##Copyright 20117-2018 Thomas Paviot (tpaviot@gmail.com)
##
##This file is part of pythonOCC.
##
##pythonOCC is free software: you can redistribute it and/or modify
##it under the terms of the GNU Lesser General Public License as published by
##the Free Software Foundation, either version 3 of the License, or
##(at your option) any later version.
##
##pythonOCC is distributed in the hope that it will be useful,
##but WITHOUT ANY WARRANTY; without even the implied warranty of
##MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
##GNU Lesser General Public License for more details.
##
##You should have received a copy of the GNU Lesser General Public License
##along with pythonOCC.  If not, see <http://www.gnu.org/licenses/>.

from __future__ import print_function, absolute_import

import sys
import enum
import uuid
import operator
from functools import reduce

# pythreejs
try:
    from pythreejs import *
    from IPython.display import display
    from ipywidgets import HTML, HBox
    import numpy as np
except ImportError:
    error_log = """ Error You must install pythreejs/ipywidgets/numpy to run the jupyter notebook renderer.
If you installed pythonocc using conda, just type :
$ conda install -c conda-forge pythreejs"""
    print(error_log)
    sys.exit(0)

from OCC.Core.Bnd import Bnd_Box
from OCC.Core.BRepBndLib import brepbndlib_Add
from OCC.Core.Visualization import Tesselator
from OCC.Extend.TopologyUtils import TopologyExplorer

# smesh
try:
    from OCC.Core.SMESH import SMESH_Mesh
    HAVE_SMESH = True
except ImportError:
    print("SMESH wrapper not found, can't display SMESH meshes")
    HAVE_SMESH = False

# default values

def format_color(r, g, b):
    return '#%02x%02x%02x' % (r, g, b)

default_shape_color = format_color(166, 166, 166)
default_mesh_color = 'white'
default_edge_color = format_color(0, 0, 0)
default_selection_material = MeshPhongMaterial(color='orange',
                                               polygonOffset=True,
                                               polygonOffsetFactor=1,
                                               polygonOffsetUnits=1,
                                               shininess=0.9)

class bounding_box(object):
    """ Representation of the bounding box of the TopoDS_Shape `shape`
    Constructor Parameters
    ----------
    shape : TopoDS_Shape or a subclass such as TopoDS_Face
        the shape to compute the bounding box from
    tol: float
        tolerance of the computed boundingbox
    """

    def __init__(self, shape_or_values, tol=1.e-5):
        if isinstance(shape_or_values, tuple):
            self.values = shape_or_values
        else:
            bbox = Bnd_Box()
            bbox.SetGap(tol)
            brepbndlib_Add(shape_or_values, bbox, True)  # use the shape triangulation
            self.values = bbox.Get()

    def __getattr__(self, k):
        attrs_0 = "x_min", "y_min", "z_min", "x_max", "y_max", "z_max"
        if k in attrs_0:
            return self.values[attrs_0.index(k)]

        idx = "xyz".index(k.split('_')[0])

        attrs_1 = "x_size", "y_size", "z_size"
        if k in attrs_1:
            return self.values[idx + 3] - self.values[idx]

        attrs_2 = "x_center", "y_center", "z_center"
        if k in attrs_2:
            return (self.values[idx] + self.values[idx + 3]) / 2.

        raise AttributeError("bounding_box has no attribute " + k)

    def __add__(self, other):
        a, b = self.values, other.values
        mi = tuple(map(min, a[0:3], b[0:3]))
        ma = tuple(map(max, a[3:6], b[3:6]))
        return bounding_box(mi + ma)


class NORMAL(enum.Enum):
    SERVER_SIDE = 1
    CLIENT_SIDE = 2


class JupyterRenderer(object):
    def __init__(self, size=(480, 480), compute_normals_mode=NORMAL.SERVER_SIDE, parallel=False):
        """ Creates a jupyter renderer.
        size: a tuple (width, height). Must be a square, or shapes will look like deformed
        compute_normals_mode: optional, set to SERVER_SIDE by default. This flag lets you choose the
        way normals are computed. If SERVER_SIDE is selected (default value), then normals
        will be computed by the Tesselator, packed as a python tuple, and send as a json structure
        to the client. If, on the other hand, CLIENT_SIDE is chose, then the computer only compute vertex
        indices, and let the normals be computed by the client (the web js machine embedded in the webrowser).

        * SERVER_SIDE: higher server load, loading time increased, lower client load. Poor performance client will
          choose this option (mobile terminals for instance)
        * CLIENT_SIDE: lower server load, loading time decreased, higher client load. Higher performance clients will
                            choose this option (laptops, desktop machines).
        * parallel: optional, False by default. If set to True, meshing runs in parallelized mode.
        """
        self._background = 'white'
        self._background_opacity = 1
        self._size = size
        self._compute_normals_mode = compute_normals_mode
        self._parallel = parallel

        self.html = HTML("Selected shape : None")
        # the default camera object
        self._camera = None
        self._camera_target = [0., 0., 0.]  # the point to look at
        self._camera_position = [0, 0., 100.]  # the camera initial position

        # a dictionnary of all the shapes belonging to the renderer
        # each element is a key 'mesh_id:shape'
        self._shapes = {}

        # we save the renderer so that is can be accessed
        self._renderer = None

        # the group of 3d and 2d objects to render
        self._displayed_pickable_objects = Group()

        # the group of other objects (grid, trihedron etc.) that can't e selected
        self._displayed_non_pickable_objects = Group()

        # event manager/selection manager
        self._picker = Picker(controlling=self._displayed_pickable_objects, event='mousedown')

        self._current_shape_selection = None
        self._current_mesh_selection = None
        self._current_selection_material = None  # the color of the object currently being rendered
        self._select_callbacks = []  # a list of all functions called after an object is selected


        def click(value):
            """ called whenever a shape  or edge is clicked
            """
            obj = value.owner.object
            if self._current_mesh_selection is not None:
                self._current_mesh_selection.material = self._current_selection_material
            if obj is not None:
                id_clicked = obj.name  # the mesh id clicked
                self._current_mesh_selection = obj
                self._current_selection_material = obj.material
                obj.material = default_selection_material
                # get the shape from this mesh id
                selected_shape = self._shapes[id_clicked]
                self.html.value = "<b>Shape id:</b> %s<br><b>Topology hierearchy</b>" % (selected_shape)
                self._current_shape_selection = selected_shape
            else:
                self.html.value = "<b>Shape id:</b> None"
            # then execute calbacks
            for callback in self._select_callbacks:
                callback(self._current_shape_selection)

        self._picker.observe(click)

        # key press and related events
        def key_pressed(widget):
            print("key pressed")
        #self._picker2 = Picker(event='keypress')
        #self._picker.observe(key_pressed)


    def register_select_callback(self, callback):
        """ Adds a callback that will be called each time a shape is selected
        """
        if not callable(callback):
            raise AssertionError("You must provide a callable to register the callback")
        else:
            self._select_callbacks.append(callback)


    def unregister_callback(self, callback):
        """ Remove a callback from the callback list
        """
        if not callback in self._select_callbacks:
            raise AssertionError("This callback is not registered")
        else:
            self._select_callbacks.remove(callback)


    def _update_camera(self):
        all_shapes = list(self._shapes.values())
        if all_shapes:
            bb = reduce(operator.add, map(bounding_box, all_shapes))
            self._camera_target = [bb.x_center, bb.y_center, bb.z_center]
            self._camera_position = [0, bb.y_center - 2 * bb.y_size, bb.z_center + 2 * bb.z_center]
        self._camera = PerspectiveCamera(position=self._camera_position,
                                         lookAt=self._camera_target,
                                         up=[0, 0, 1],
                                         aspect=self._size[0] / self._size[1],
                                         fov=50,
                                         children=[DirectionalLight(color='#ffffff', position=[50, 50, 50], intensity=0.9)])


    def GetSelectedShape(self):
        """ Returns the selected shape
        """
        return self._current_shape_selection


    def DisplayGrid(self, sizex, sizey, nx, ny):
        """ Displays a grid in the renderer.
        sizex: float, grid size along x axis
        sizey: float, grid size along y axis
        nx: integer, number of segments along the x axis
        ny: integer, number of segments along the y axis
        """
        surf_geo = SurfaceGeometry(z=[0] * (nx + 1) * (ny + 1),
                                   width=sizex,
                                   height=sizey,
                                   width_segments=nx,
                                   height_segments=ny)
        surf_grid = SurfaceGrid(geometry=surf_geo,
                                material=LineBasicMaterial(color='#000000',
                                                           opacity=0.2,
                                                           transparent=True))
        self._displayed_non_pickable_objects.add(surf_grid)
        return surf_geo


    def DisplayMesh(self,
                    mesh,
                    color=default_mesh_color):
        """ Display a MEFISTO2 triangle mesh
        """
        if not HAVE_SMESH:
            print("SMESH not installed, DisplayMesh method unavailable.")
            return
        assert isinstance(mesh, SMESH_Mesh)
        mesh_ds = mesh.GetMeshDS()  # the mesh data source
        face_iter = mesh_ds.facesIterator()
        # vertices positions are stored to a liste
        vertices_position = []
        for i in range(mesh_ds.NbFaces()-1):
            face = face_iter.next()
            #print('Face %i, type %i' % (i, face.GetType()))
            #print(dir(face))
            # if face.GetType == 3 : triangle mesh, then 3 nodes
            for j in range(3):
                node = face.GetNode(j)
                #print('Coordinates of node %i:(%f,%f,%f)'%(i, node.X(), node.Y(), node.Z()))
                vertices_position.append(node.X())
                vertices_position.append(node.Y())
                vertices_position.append(node.Z())
        number_of_vertices = len(vertices_position)
        # then we build the vertex and faces collections as numpy ndarrays
        np_vertices = np.array(vertices_position, dtype='float32').reshape(int(number_of_vertices / 3), 3)
        # Note: np_faces is just [0, 1, 2, 3, 4, 5, ...], thus arange is used
        np_faces = np.arange(np_vertices.shape[0], dtype='uint32')
        # set geometry properties
        buffer_geometry_properties = {'position': BufferAttribute(np_vertices),
                                      'index'   : BufferAttribute(np_faces)}
        # build a BufferGeometry instance
        mesh_geometry = BufferGeometry(attributes=buffer_geometry_properties)

        mesh_geometry.exec_three_obj_method('computeVertexNormals')

        # then a default material
        mesh_material = MeshPhongMaterial(color=color,
                                          polygonOffset=True,
                                          polygonOffsetFactor=1,
                                          polygonOffsetUnits=1,
                                          shininess=0.5,
                                          wireframe=False)
        edges_material = MeshPhongMaterial(color='black',
                                           polygonOffset=True,
                                           polygonOffsetFactor=1,
                                           polygonOffsetUnits=1,
                                           shininess=0.5,
                                           wireframe=True)
        # create a mesh unique id
        mesh_id = uuid.uuid4().hex

        # finally create the mash
        shape_mesh = Mesh(geometry=mesh_geometry,
                          material=mesh_material,
                          name=mesh_id)
        edges_mesh = Mesh(geometry=mesh_geometry,
                          material=edges_material,
                          name=mesh_id)


        # a special display for the mesh
        camera_target = [0., 0., 0.]  # the point to look at
        camera_position = [0, 0., 100.]  # the camera initial position
        camera = PerspectiveCamera(position=camera_position,
                                   lookAt=camera_target,
                                   up=[0, 0, 1],
                                   fov=50,
                                   children=[DirectionalLight(color='#ffffff',
                                                              position=[50, 50, 50],
                                                              intensity=0.9)])
        scene_shp = Scene(children=[shape_mesh, edges_mesh, camera, AmbientLight(color='#101010')])

        renderer = Renderer(camera=camera,
                            background=self._background,
                            background_opacity=self._background_opacity,
                            scene=scene_shp,
                            controls=[OrbitControls(controlling=camera, target=camera_target)],
                            width=self._size[0],
                            height=self._size[1],
                            antialias=True)

        display(renderer)


    def DisplayShape(self,
                     shp,  # the TopoDS_Shape to be displayed
                     shape_color=default_shape_color,  # the default
                     render_edges=False,
                     edge_color=default_edge_color,
                     compute_uv_coords=False,
                     quality=1.0,
                     transparency=False,
                     opacity=1.,
                     topo_level='default',
                     update=False):
        """ Displays a topods_shape in the renderer instance.
        shp: the TopoDS_Shape to render
        shape_color: the shape color, in html corm, eg '#abe000'
        render_edges: optional, False by default. If True, compute and dislay all
                      edges as a linear interpolation of segments.
        edge_color: optional, black by default. The color used for edge rendering,
                    in html form eg '#ff00ee'
        compute_uv_coords: optional, false by default. If True, compute texture
                           coordinates (required if the shape has to be textured)
        quality: optional, 1.0 by default. If set to something lower than 1.0,
                      mesh will be more precise. If set to something higher than 1.0,
                      mesh will be less precise, i.e. lower numer of triangles.
        transparency: optional, False by default (opaque).
        opacity: optional, float, by default to 1 (opaque). if transparency is set to True,
                 0. is fully opaque, 1. is fully transparent.
        detail_level: "default" by default. The value should be either "compound", "shape", "vertex".
        update: optional, False by default. If True, render all the shapes.
        """
        if topo_level != "default":
            t = TopologyExplorer(shp)
            map_type_and_methods = {"Solid": t.solids, "Face": t.faces, "Shell": t.shells,
                                    "Compound": t.compounds, "Compsolid": t.comp_solids}
            for subshape in map_type_and_methods[topo_level]():
                self.AddShapeToScene(subshape, shape_color, render_edges, edge_color, compute_uv_coords, quality,
                                     transparency, opacity)
        else:
            self.AddShapeToScene(shp, shape_color, render_edges, edge_color, compute_uv_coords, quality,
                                 transparency, opacity)

        if update:
            self.Display()


    def AddShapeToScene(self,
                        shp,  # the TopoDS_Shape to be displayed
                        shape_color=default_shape_color,  # the default
                        render_edges=False,
                        edge_color=default_edge_color,
                        compute_uv_coords=False,
                        quality=1.0,
                        transparency=False,
                        opacity=1.):
        # first, compute the tesselation
        tess = Tesselator(shp)
        tess.Compute(uv_coords=compute_uv_coords,
                     compute_edges=render_edges,
                     mesh_quality=quality,
                     parallel=self._parallel)
        # get vertices and normals
        vertices_position = tess.GetVerticesPositionAsTuple()

        number_of_triangles = tess.ObjGetTriangleCount()
        number_of_vertices = len(vertices_position)

        # number of vertices should be a multiple of 3
        assert number_of_vertices % 3 == 0
        assert number_of_triangles * 9 == number_of_vertices

        # then we build the vertex and faces collections as numpy ndarrays
        np_vertices = np.array(vertices_position, dtype='float32').reshape(int(number_of_vertices / 3), 3)
        # Note: np_faces is just [0, 1, 2, 3, 4, 5, ...], thus arange is used
        np_faces = np.arange(np_vertices.shape[0], dtype='uint32')

        # set geometry properties
        buffer_geometry_properties = {'position': BufferAttribute(np_vertices),
                                      'index'   : BufferAttribute(np_faces)}
        if self._compute_normals_mode == NORMAL.SERVER_SIDE:
            # get the normal list, converts to a numpy ndarray. This should not raise
            # any issue, since normals have been computed by the server, and are available
            # as a list of floats
            np_normals = np.array(tess.GetNormalsAsTuple(), dtype='float32').reshape(-1, 3)
            # quick check
            assert np_normals.shape == np_vertices.shape
            buffer_geometry_properties['normal'] = BufferAttribute(np_normals)

        # build a BufferGeometry instance
        shape_geometry = BufferGeometry(attributes=buffer_geometry_properties)

        # if the client has to render normals, add the related js instructions
        if self._compute_normals_mode == NORMAL.CLIENT_SIDE:
            shape_geometry.exec_three_obj_method('computeVertexNormals')

        # then a default material
        shp_material = MeshPhongMaterial(color=shape_color,
                                         polygonOffset=True,
                                         polygonOffsetFactor=1,
                                         polygonOffsetUnits=1,
                                         shininess=0.9,
                                         transparent=transparency,
                                         opacity=opacity)

        # create a mesh unique id
        mesh_id = uuid.uuid4().hex

        # finally create the mash
        shape_mesh = Mesh(geometry=shape_geometry,
                          material=shp_material,
                          name=mesh_id)


        # and to the dict of shapes, to have a mapping between meshes and shapes
        self._shapes[mesh_id] = shp

        # edge rendering, if set to True
        edge_lines = None
        if render_edges:
            edges = list(map(lambda i_edge: [tess.GetEdgeVertex(i_edge, i_vert) for i_vert in range(tess.ObjEdgeGetVertexCount(i_edge))], range(tess.ObjGetEdgeCount())))
            edges = list(filter(lambda edge: len(edge) == 2, edges))
            np_edge_vertices = np.array(edges, dtype=np.float32).reshape(-1, 3)
            np_edge_indices = np.arange(np_edge_vertices.shape[0], dtype=np.uint32)
            edge_geometry = BufferGeometry(attributes={
                'position': BufferAttribute(np_edge_vertices),
                'index'   : BufferAttribute(np_edge_indices)
            })
            edge_material = LineBasicMaterial(color=edge_color, linewidth=1)
            edge_lines = LineSegments(geometry=edge_geometry, material=edge_material)

        # Add geometries to pickable or non pickable objects
        self._displayed_pickable_objects.add(shape_mesh)
        if render_edges:
            self._displayed_non_pickable_objects.add(edge_lines)


    def EraseAll(self):
        self._shapes = {}
        self._displayed_pickable_objects = Group()
        self._current_shape_selection = None
        self._current_mesh_selection = None
        self._current_selection_material = None
        self._renderer.scene = Scene(children=[])


    def Display(self):
        self._update_camera()
        scene_shp = Scene(children=[self._displayed_pickable_objects,
                                    self._displayed_non_pickable_objects,
                                    self._camera,
                                    AmbientLight(color='#101010')])

        self._renderer = Renderer(camera=self._camera,
                                  background=self._background,
                                  background_opacity=self._background_opacity,
                                  scene=scene_shp,
                                  controls=[OrbitControls(controlling=self._camera, target=self._camera_target), self._picker],
                                  width=self._size[0],
                                  height=self._size[1],
                                  antialias=True)
        # then display both 3d widgets and webui
        display(HBox([self._renderer, self.html]))


    def __repr__(self):
        self.Display()
        return ""
