##Copyright 2017 Thomas Paviot (tpaviot@gmail.com)
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

import os
import sys
import operator

try:
    from pythreejs import *
    from IPython.display import display, HTML
    from ipywidgets import HTML, Text
    from traitlets import link, dlink
    import numpy as np
except ImportError:
    raise AssertionError("You must install pythreejs and dependencies to benefit from the jupyter renderer")

# this renderer currently targets pythreejs version number 1.0.x
assert version_info[0] == 1 and version_info[1] == 0

from OCC.Bnd import Bnd_Box
from OCC.BRepBndLib import brepbndlib_Add
from OCC.Visualization import Tesselator
from collections import namedtuple

# default values

def format_color(r,g,b):
    return '#%02x%02x%02x' % (r,g,b)

default_shape_color = format_color(166, 166, 166)
default_edge_color = format_color(0, 0, 0)

try:
    # Backwards compatibility
    BufferGeometry = PlainBufferGeometry
    MeshPhongMaterial = PhongMaterial
except: pass

shape_data = namedtuple("shape_data", ("name", "shape", "mesh", "wireframe", "shape_color", "edge_color"))

try:
    from functools import reduce
except: pass

class bounding_box(object):

    """ Representation of the bounding box of the TopoDS_Shape `shape`
    Constructor Parameters
    ----------
    shape : TopoDS_Shape or a subclass such as TopoDS_Face
        the shape to compute the bounding box from
    tol: float
        tolerance of the computed boundingbox
    use_mesh : bool (TODO)
        a flag that tells whether or not the shape has first to be meshed before the bbox
        computation. This produces more accurate results
    """

    def __init__(self, shape_or_values, tol=1.e-5):
        if isinstance(shape_or_values, tuple):
            self.values = shape_or_values
        else:
            bbox = Bnd_Box()
            bbox.SetGap(tol)
            brepbndlib_Add(shape_or_values, bbox, False)
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


def format_color(r, g, b):
    float_or_int = lambda v: int(v * 255.) if isinstance(v, float) else int(v)
    return '#%02x%02x%02x' % tuple(map(float_or_int, (r, g, b)))

# default values
default_shape_color = format_color(166, 166, 166)
default_edge_color = format_color(0, 0, 0)
selected_edge_color = format_color(255, 128, 0)

class JupyterRenderer(object):

    def __init__(self, size=(480,480)):
        self._background = 'white'
        self._background_opacity = 1
        self._size = size
        
        self._shapes = []
        self._objects = []
        
        self._camera = None                  
        
        self.html = HTML("No element selected")
        
        self._pickable_objects = Group()
        self._wireframes = Group()
        self._picker = Picker(controlling=self._pickable_objects, event='click')
        
        current = {'selection': None}
        
        def click(value):
            if current['selection'] is not None:
                wf = self._objects[current['selection']].wireframe
                if wf is not None:
                    wf.material.color = self._objects[current['selection']].edge_color

            nm = None
            obj = value.owner.object

            if obj is not None:
                nm = int(obj.name)
                wf = self._objects[nm].wireframe
                if wf is not None:
                    wf.material.color = selected_edge_color

            current['selection'] = nm
            self.onclick(None if nm is None else self._objects[nm])
                
        self._picker.observe(click, names=['point'])
    
    
    def onclick(self, item):
        if item:
            self.html.value = "Selected element " + str(item.name)
        else:
            self.html.value = "No element selected"
        

    def _update_camera(self):
        bb = reduce(operator.add, map(bounding_box, self._shapes))
        
        self._target = [bb.x_center, bb.y_center, bb.z_center]
        self._camera = PerspectiveCamera(position=[0, bb.y_center - 3 * bb.y_size, bb.z_center + 3 * bb.z_center],
                                         lookAt=self._target,
                                         up=[0,0,1],
                                         fov=50,
                                         children=[DirectionalLight(color='#ffffff', position=[50, 50, 50], intensity=0.5)])

        
    def DisplayShape(self,
                     shp,  # the TopoDS_Shape to be displayed
                     shape_color = default_shape_color,
                     render_edges = False,
                     edge_color = default_edge_color,
                     show = True):

        """
        Takes a topods_shape and displays it in a jupyter notebook
        """

        if not isinstance(shape_color, str): 
            shape_color=format_color(*shape_color)
        
        if not isinstance(edge_color, str): 
            edge_color=format_color(*edge_color)
            
        self._shapes.append(shp)
        
        # compute the tesselation
        tess = Tesselator(shp)
        tess.Compute(compute_edges=render_edges)
        # get vertices and normals
        vertices_position = tess.GetVerticesPositionAsTuple()

        number_of_triangles = tess.ObjGetTriangleCount()
        number_of_vertices = len(vertices_position)

        # number of vertices should be a multiple of 3
        assert number_of_vertices % 3 == 0
        assert number_of_triangles * 9 == number_of_vertices

        # then we compute the vertices and normals arrays
        np_vertices = np.array(vertices_position, dtype='float32').reshape(int(number_of_vertices / 3), 3)
        np_normals = np.array(tess.GetNormalsAsTuple(), dtype='float32').reshape(-1, 3)
        np_faces = np.arange(np_vertices.shape[0], dtype='uint32')

        assert np_normals.shape == np_vertices.shape

        # finally DisplayShape
        shape_geometry = BufferGeometry(attributes={
            'position': BufferAttribute(np_vertices),
            'normal'  : BufferAttribute(np_normals),
            'index'   : BufferAttribute(np_faces)
        })
        
        shp_material = MeshPhongMaterial(
            color = shape_color,
            polygonOffset = True,
            polygonOffsetFactor = 1,
            polygonOffsetUnits = 1
        )
        
        name = str(len(self._objects))
        
        shape_mesh = Mesh(
            geometry=shape_geometry,
            material=shp_material,
            name=name)
        
        self._pickable_objects.add(shape_mesh)
        
        edge_lines = None
        
        if render_edges:

            edges = list(map(lambda i_edge: [tess.GetEdgeVertex(i_edge, i_vert) for i_vert in range(tess.ObjEdgeGetVertexCount(i_edge))], range(tess.ObjGetEdgeCount())))
            edges = list(filter(lambda edge: len(edge) == 2, edges))
            np_edge_vertices = np.array(edges, dtype=np.float32).reshape(-1,3)
            np_edge_indices = np.arange(np_edge_vertices.shape[0], dtype=np.uint32)

            edge_geometry = BufferGeometry(attributes={
                'position': BufferAttribute(np_edge_vertices),
                'index'   : BufferAttribute(np_edge_indices)
            })
            edge_material = LineBasicMaterial(color=edge_color, linewidth=2)
            edge_lines = LineSegments(geometry=edge_geometry, material=edge_material)
            
            self._wireframes.add(edge_lines)

        self._objects.append(shape_data(
            name = name,
            shape = shp,
            mesh = shape_mesh,
            wireframe = edge_lines,
            shape_color = shape_color,
            edge_color = edge_color
        ))
            
        if show: self.Display()
                        
    def Display(self):                                 
        self._update_camera()
        
        scene = Scene(children=[self._pickable_objects, self._wireframes, self._camera, AmbientLight(color='#101010')])
        
        renderer = Renderer(camera=self._camera,
                            background=self._background,
                            background_opacity=self._background_opacity,
                            scene = scene,
                            width = self._size[0],
                            height = self._size[1],
                            antialias=True,
                            controls=[OrbitControls(controlling=self._camera, target=self._target), self._picker])
                                
        display(renderer, self.html)

if __name__ == "__main__":
    from OCC.BRepPrimAPI import BRepPrimAPI_MakeBox, BRepPrimAPI_MakeTorus
    my_ren = JupyterRenderer()
    box_s = BRepPrimAPI_MakeBox(10, 20, 30).Shape()
    my_ren.DisplayShape(box_s)
