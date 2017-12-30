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
import tempfile

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

# default values

def format_color(r,g,b):
    return '#%02x%02x%02x' % (r,g,b)

default_shape_color = format_color(166, 166, 166)
default_edge_color = format_color(0, 0, 0)


def get_boundingbox(shape, tol=1e-5):
    """ return the bounding box of the TopoDS_Shape `shape`
    Parameters
    ----------
    shape : TopoDS_Shape or a subclass such as TopoDS_Face
        the shape to compute the bounding box from
    tol: float
        tolerance of the computed boundingbox
    use_mesh : bool
        a flag that tells whether or not the shape has first to be meshed before the bbox
        computation. This produces more accurate results
    """
    bbox = Bnd_Box()
    bbox.SetGap(tol)
    brepbndlib_Add(shape, bbox, False)

    x_min, y_min, z_min, x_max, y_max, z_max = bbox.Get()
    x_size = x_max - x_min
    y_size = y_max - y_min
    z_size = z_max - z_min
    x_center = x_min + x_size / 2
    y_center = y_min + y_size / 2
    z_center = z_min + z_size / 2
    return x_size, y_size, z_size, x_center, y_center, z_center


class JupyterRenderer(object):
    def __init__(self, size=(480,480)):
        self._background = 'white'
        self._background_opacity = 1
        self._size = size


    def DisplayShape(self,
                     shp,  # the TopoDS_Shape to be displayed
                     shape_color = default_shape_color,
                     render_edges = False,
                     edge_color = default_edge_color):
        """ takes a topods_shape and displays it in a jupyter notebook
        """
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
        
        #shape_geometry.exec_three_obj_method('computeFaceNormals') TODO normals should be client-side computed
        #shape_geometry.exec_three_obj_method('computeVertexNormals') TODO idem for vertex normals
        shp_material = MeshPhongMaterial(color=default_shape_color, shininess=0.9, morphTargets=True)
        shape_mesh = Mesh(geometry=shape_geometry, material = shp_material)

        edges = list(map(lambda i_edge: [tess.GetEdgeVertex(i_edge, i_vert) for i_vert in range(tess.ObjEdgeGetVertexCount(i_edge))], range(tess.ObjGetEdgeCount())))
        edges = list(filter(lambda edge: len(edge) == 2, edges))
        np_edge_vertices = np.array(edges, dtype=np.float32).reshape(-1,3)
        np_edge_indices = np.arange(np_edge_vertices.shape[0], dtype=np.uint32)
        
        # create a camera
        px, py, pz, xc, yc, zc = get_boundingbox(shp)
        self._camera = c = PerspectiveCamera(position=[0, -3*py, pz *3],
                                             fov=50,
                                             children=[DirectionalLight(color='#ffffff', position=[50, 50, 50], intensity=0.5)])
                                             
        scene_children = [AmbientLight(color='#101010'), shape_mesh, c]
        
        if render_edges:
            edge_geometry = BufferGeometry(attributes={
                'position': BufferAttribute(np_edge_vertices),
                'index'   : BufferAttribute(np_edge_indices)
            })
            edge_material = LineBasicMaterial(color=edge_color, linewidth=2)
            edge_lines = LineSegments(geometry=edge_geometry, material=edge_material)

            scene_children.append(edge_lines)

        scene_shp = Scene(children=scene_children)
        
        renderer_shp = Renderer(camera=c,
                                background=self._background,
                                background_opacity=self._background_opacity,
                                scene = scene_shp,
                                controls=[OrbitControls(controlling=self._camera)],
                                width=self._size[0],
                                height=self._size[1],
                                antialias=True)
                                
        display(renderer_shp)



if __name__ == "__main__":
    from OCC.BRepPrimAPI import BRepPrimAPI_MakeBox, BRepPrimAPI_MakeTorus
    my_ren = JupyterRenderer()
    box_s = BRepPrimAPI_MakeBox(10, 20, 30).Shape()
    my_ren.DisplayShape(box_s)
