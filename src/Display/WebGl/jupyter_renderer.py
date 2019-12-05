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

import enum
from functools import reduce
import itertools
import math
import operator
import uuid
import sys

# pythreejs
try:
    from pythreejs import (CombinedCamera, BufferAttribute, BufferGeometry, Plane, Mesh,
                           LineSegmentsGeometry, LineMaterial, LineSegments2, AmbientLight,
                           DirectionalLight, Scene, OrbitControls, Renderer, PerspectiveCamera,
                           Picker, Group, GridHelper, LineSegments,
                           ShaderMaterial, ShaderLib, MeshPhongMaterial, LineBasicMaterial)
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
from OCC.Core.BRepPrimAPI import BRepPrimAPI_MakeSphere
from OCC.Core.BRepBndLib import brepbndlib_Add
from OCC.Core.Visualization import Tesselator

from OCC.Extend.TopologyUtils import (TopologyExplorer, is_edge, is_wire, discretize_edge,
                                      discretize_wire, get_type_as_string)

try:
    from OCC.Core.SMESH import SMESH_Mesh
    HAVE_SMESH = True
except ImportError:
    HAVE_SMESH = False

# default values

def format_color(r, g, b):
    return '#%02x%02x%02x' % (r, g, b)

default_shape_color = format_color(166, 166, 166)
default_mesh_color = 'white'
default_edge_color = format_color(0, 0, 0)

def distance(v1, v2):
    return np.linalg.norm([x - y for x, y in zip(v1, v2)])


class Helpers(object):

    def __init__(self, bb_center):
        self.bb_center = bb_center
        self.center = (0, 0, 0)

    def _center(self, zero=True):
        return self.center if zero else self.bb_center

    def set_position(self, position):
        raise NotImplementedError()

    def set_visibility(self, change):
        raise NotImplementedError()

    def set_center(self, change):
        self.set_position(self._center(change))


class Grid(Helpers):

    def __init__(self, bb_center=None, maximum=5, ticks=10, colorCenterLine='#aaa', colorGrid='#ddd'):
        super().__init__(bb_center)
        self.maximum = maximum
        axis_start, axis_end, nice_tick = self.nice_bounds(-maximum, maximum, 2 * ticks)
        self.step = nice_tick
        self.size = axis_end - axis_start
        self.grid = GridHelper(
            self.size, int(self.size / self.step), colorCenterLine=colorCenterLine, colorGrid=colorGrid)
        self.set_center(True)

    # https://stackoverflow.com/questions/4947682/intelligently-calculating-chart-tick-positions
    def _nice_number(self, value, round_=False):
        exponent = math.floor(math.log(value, 10))
        fraction = value / 10**exponent

        if round_:
            if fraction < 1.5:
                nice_fraction = 1.
            elif fraction < 3.:
                nice_fraction = 2.
            elif fraction < 7.:
                nice_fraction = 5.
            else:
                nice_fraction = 10.
        else:
            if fraction <= 1:
                nice_fraction = 1.
            elif fraction <= 2:
                nice_fraction = 2.
            elif fraction <= 5:
                nice_fraction = 5.
            else:
                nice_fraction = 10.

        return nice_fraction * 10**exponent

    def nice_bounds(self, axis_start, axis_end, num_ticks=10):
        axis_width = axis_end - axis_start
        if axis_width == 0:
            nice_tick = 0
        else:
            nice_range = self._nice_number(axis_width)
            nice_tick = self._nice_number(nice_range / (num_ticks - 1), round_=True)
            axis_start = math.floor(axis_start / nice_tick) * nice_tick
            axis_end = math.ceil(axis_end / nice_tick) * nice_tick

        return axis_start, axis_end, nice_tick

    def set_position(self, position):
        self.grid.position = position

    def set_visibility(self, change):
        self.grid.visible = change

    def set_rotation(self, rotation):
        self.grid.rotation = rotation


class Axes(Helpers):
    """ X, Y and Z axis
    X is red
    Y is green
    Z is blue
    """
    def __init__(self, bb_center, length=1, width=3):
        super().__init__(bb_center)

        self.axes = []
        for vector, color in zip(([length, 0, 0], [0, length, 0], [0, 0, length]), ('red', 'green', 'blue')):
            self.axes.append(
                LineSegments2(
                    LineSegmentsGeometry(positions=[[self.center, self._shift(self.center, vector)]]),
                    LineMaterial(linewidth=width, color=color)))

    def _shift(self, v, offset):
        return [x + o for x, o in zip(v, offset)]

    def set_position(self, position):
        for i in range(3):
            self.axes[i].position = position

    def set_visibility(self, change):
        for i in range(3):
            self.axes[i].visible = change


class CustomMaterial(ShaderMaterial):

    def __init__(self, typ):
        self.types = {'diffuse': 'c', 'uvTransform': 'm3', 'normalScale': 'v2', 'fogColor': 'c', 'emissive': 'c'}

        shader = ShaderLib[typ]

        fragmentShader = """
        uniform float alpha;
        """
        frag_from = "gl_FragColor = vec4( outgoingLight, diffuseColor.a );"
        frag_to = """
            if ( gl_FrontFacing ) {
                gl_FragColor = vec4( outgoingLight, alpha * diffuseColor.a );
            } else {
                gl_FragColor = vec4( diffuseColor.r, diffuseColor.g, diffuseColor.b, alpha * diffuseColor.a );
            }"""
        fragmentShader += shader["fragmentShader"].replace(frag_from, frag_to)

        vertexShader = shader["vertexShader"]
        uniforms = shader["uniforms"]
        uniforms["alpha"] = dict(value=0.7)

        super().__init__(uniforms=uniforms, vertexShader=vertexShader, fragmentShader=fragmentShader)
        self.lights = True

    @property
    def color(self):
        return self.uniforms["diffuse"]["value"]

    @color.setter
    def color(self, value):
        self.update("diffuse", value)

    @property
    def alpha(self):
        return self.uniforms["alpha"]["value"]

    @alpha.setter
    def alpha(self, value):
        self.update("alpha", value)

    def update(self, key, value):
        uniforms = dict(**self.uniforms)
        if self.types.get(key) is None:
            uniforms[key] = {'value': value}
        else:
            uniforms[key] = {'type': self.types.get(key), 'value': value}
        self.uniforms = uniforms
        self.needsUpdate = True


class BoundingBox(object):
    def __init__(self, objects, tol=1e-5):
        self.tol = tol
        
        bbox = reduce(self._opt, [self.bbox(obj) for obj in objects])
        self.xmin, self.xmax, self.ymin, self.ymax, self.zmin, self.zmax = bbox
        self.xsize = self.xmax - self.xmin
        self.ysize = self.ymax - self.ymin
        self.zsize = self.zmax - self.zmin
        self.center = (self.xmin + self.xsize / 2.0, self.ymin + self.ysize / 2.0, self.zmin + self.zsize / 2.0)
        self.max = reduce(lambda a, b: max(abs(a), abs(b)), bbox)
        self.diagonal = max([
            distance(self.center, v)
            for v in itertools.product((self.xmin, self.xmax), (self.ymin, self.ymax), (self.zmin, self.zmax))
        ])

    def _opt(self, b1, b2):
        return (min(b1[0], b2[0]), max(b1[1], b2[1]), min(b1[2], b2[2]), max(b1[3], b2[3]), min(b1[4], b2[4]),
                max(b1[5], b2[5]))

    def _bounding_box(self, obj, tol=1e-5):
        bbox = Bnd_Box()
        bbox.SetGap(self.tol)
        brepbndlib_Add(obj, bbox, True)
        values = bbox.Get()
        return (values[0], values[3], values[1], values[4], values[2], values[5])

    def bbox(self, objects):
        bb = reduce(self._opt, [self._bounding_box(obj) for obj in objects])
        return bb

    def __repr__(self):
        return "[x(%f .. %f), y(%f .. %f), z(%f .. %f)]" % \
               (self.xmin, self.xmax, self.ymin, self.ymax, self.zmin, self.zmax)


class NORMAL(enum.Enum):
    SERVER_SIDE = 1
    CLIENT_SIDE = 2


class JupyterRenderer(object):
    def __init__(self,
                 size=(640, 480),
                 compute_normals_mode=NORMAL.SERVER_SIDE,
                 parallel=False):
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

        self._bb = None  # the bounding box, necessary to compute camera position

        # the default camera object
        self._camera_target = [0., 0., 0.]  # the point to look at
        self._camera_position = [0, 0., 100.]  # the camera initial position
        self._camera = None

        # a dictionnary of all the shapes belonging to the renderer
        # each element is a key 'mesh_id:shape'
        self._shapes = {}

        # we save the renderer so that is can be accessed
        self._renderer = None

        # the group of 3d and 2d objects to render
        self._displayed_pickable_objects = Group()

        # the group of other objects (grid, trihedron etc.) that can't be selected
        self._displayed_non_pickable_objects = Group()

        # event manager/selection manager
        self._picker = Picker(controlling=self._displayed_pickable_objects, event='mousedown')

        self._current_shape_selection = None
        self._current_mesh_selection = None
        self._selection_color = format_color(232, 176, 36)

        self._select_callbacks = []  # a list of all functions called after an object is selected


        def click(value):
            """ called whenever a shape  or edge is clicked
            """
            obj = value.owner.object
            if self._current_mesh_selection is not None:
                self._current_mesh_selection.material.color = self._current_selection_material_color
            if obj is not None:
                id_clicked = obj.name  # the mesh id clicked
                self._current_mesh_selection = obj
                self._current_selection_material_color = obj.material.color
                obj.material.color = self._selection_color
                # get the shape from this mesh id
                selected_shape = self._shapes[id_clicked]
                html_value = "<b>Shape type:</b> %s<br>" % get_type_as_string(selected_shape)
                html_value += "<b>Shape id:</b> %s<br>" % selected_shape
                self.html.value = html_value
                self._current_shape_selection = selected_shape
            else:
                self.html.value = "<b>Shape type:</b> None<br><b>Shape id:</b> None"
            # then execute calbacks
            for callback in self._select_callbacks:
                callback(self._current_shape_selection)

        self._picker.observe(click)


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


    def GetSelectedShape(self):
        """ Returns the selected shape
        """
        return self._current_shape_selection


    def DisplayMesh(self,
                    mesh,
                    color=default_mesh_color):
        """ Display a MEFISTO2 triangle mesh
        """
        if not HAVE_SMESH:
            print("SMESH not installed, DisplayMesh method unavailable.")
            return
        if not isinstance(mesh, SMESH_Mesh):
            raise AssertionError("You mush provide an SMESH_Mesh instance")
        mesh_ds = mesh.GetMeshDS()  # the mesh data source
        face_iter = mesh_ds.facesIterator()
        # vertices positions are stored to a liste
        vertices_position = []
        for _ in range(mesh_ds.NbFaces()-1):
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
                                          wireframe=False,
                                          side='DoubleSide')
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
        topo_level: "default" by default. The value should be either "compound", "shape", "vertex".
        update: optional, False by default. If True, render all the shapes.
        """
        if is_wire(shp) or is_edge(shp):
            self.AddCurveToScene(shp, shape_color)
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


    def AddCurveToScene(self, shp, color):
        """ shp is either a TopoDS_Wire or a TopodS_Edge.
        """
        if is_edge(shp):
            pnts = discretize_edge(shp)
        elif is_wire(shp):
            pnts = discretize_wire(shp)
        np_edge_vertices = np.array(pnts, dtype=np.float32)
        np_edge_indices = np.arange(np_edge_vertices.shape[0], dtype=np.uint32)
        edge_geometry = BufferGeometry(attributes={
            'position': BufferAttribute(np_edge_vertices),
            'index'   : BufferAttribute(np_edge_indices)
        })
        edge_material = LineBasicMaterial(color=color, linewidth=2, fog=True)
        edge_lines = LineSegments(geometry=edge_geometry, material=edge_material)

        # Add geometries to pickable or non pickable objects
        self._displayed_pickable_objects.add(edge_lines)


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
        if number_of_vertices % 3 != 0:
            raise AssertionError("Wrong number of vertices")
        if number_of_triangles * 9 != number_of_vertices:
            raise AssertionError("Wrong number of triangles")

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
            if np_normals.shape != np_vertices.shape:
                raise AssertionError("Wrong number of normals/shapes")
            buffer_geometry_properties['normal'] = BufferAttribute(np_normals)

        # build a BufferGeometry instance
        shape_geometry = BufferGeometry(attributes=buffer_geometry_properties)

        # if the client has to render normals, add the related js instructions
        if self._compute_normals_mode == NORMAL.CLIENT_SIDE:
            shape_geometry.exec_three_obj_method('computeVertexNormals')

        # then a default material
        shp_material = self._material(shape_color, transparent=transparency, opacity=opacity)
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

    def _scale(self, vec):
        r = self._bb.diagonal * 2.5
        n = np.linalg.norm(vec)
        new_vec = [v / n * r for v in vec]
        return self._add(new_vec, self._bb.center)

    def _add(self, vec1, vec2):
        return list(v1 + v2 for v1, v2 in zip(vec1, vec2))

    def _material(self, color, transparent=False, opacity=1.0):
        material = CustomMaterial("standard")
        material.color = color
        material.clipping = True
        material.side = "DoubleSide"
        material.alpha = 0.7
        material.polygonOffset = False
        material.polygonOffsetFactor = 1
        material.polygonOffsetUnits = 1
        material.transparent = transparent
        material.opacity = opacity
        material.update("metalness", 0.3)
        material.update("roughness", 0.8)
        return material

    def EraseAll(self):
        self._shapes = {}
        self._displayed_pickable_objects = Group()
        self._current_shape_selection = None
        self._current_mesh_selection = None
        self._current_selection_material = None
        self._renderer.scene = Scene(children=[])


    def Display(self):
        # Get the overall bounding box
        if self._shapes:
            self._bb = BoundingBox([self._shapes.values()])
        else:  # if nothing registered yet, create a fake bb
            self._bb = BoundingBox([[BRepPrimAPI_MakeSphere(5.).Shape()]])
        bb_max = self._bb.max
        bb_diag = 2 * self._bb.diagonal

        # Set up camera
        camera_target = self._bb.center
        camera_position = self._scale([1, 1, 1])


        self._camera = CombinedCamera(position=camera_position,
                                      width=self._size[0], height=self._size[1],
                                      far=10 * bb_diag, orthoFar=10 * bb_diag)
        self._camera.up = (0.0, 0.0, 1.0)
        self._camera.lookAt(camera_target)
        self._camera.mode = 'orthographic'
        self._camera_target = camera_target
        self._camera.position = camera_position

        # Set up lights in every of the 8 corners of the global bounding box
        key_lights = [
            DirectionalLight(color='white', position=position, intensity=0.12)
            for position in list(itertools.product((-bb_diag, bb_diag), (-bb_diag, bb_diag), (-bb_diag, bb_diag)))
        ]
        ambient_light = AmbientLight(intensity=1.0)

        # Set up Helpers
        self.axes = Axes(bb_center=self._bb.center, length=bb_max * 1.1)
        self.grid = Grid(bb_center=self._bb.center, maximum=bb_max, colorCenterLine='#aaa', colorGrid='#ddd')

        # Set up scene
        environment = self.axes.axes + key_lights + [ambient_light, self.grid.grid, self._camera]

        scene_shp = Scene(children=[self._displayed_pickable_objects,
                                    self._displayed_non_pickable_objects] + environment)

        # Set up Controllers
        self._controller = OrbitControls(controlling=self._camera, target=camera_target)

        self._renderer = Renderer(camera=self._camera,
                                  background=self._background,
                                  background_opacity=self._background_opacity,
                                  scene=scene_shp,
                                  controls=[self._controller, self._picker],
                                  width=self._size[0],
                                  height=self._size[1],
                                  antialias=True)

        # needs to be done after setup of camera
        self.grid.set_rotation((math.pi / 2.0, 0, 0, "XYZ"))
        self.grid.set_position((0, 0, 0))

        # Workaround: Zoom forth and back to update frame. Sometimes necessary :(
        self._camera.zoom = 1.01
        self._update()
        self._camera.zoom = 1.0
        self._update()

        # then display both 3d widgets and webui
        display(HBox([self._renderer, self.html]))

    def _update(self):
        self._controller.exec_three_obj_method('update')

    def __repr__(self):
        self.Display()
        return ""
