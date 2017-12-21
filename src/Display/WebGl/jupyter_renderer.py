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

from OCC.Bnd import Bnd_Box
from OCC.BRepBndLib import brepbndlib_Add
from OCC.Visualization import Tesselator

# default values
default_shape_color = '#%02x%02x%02x' % (166, 166, 166)


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
    def __init__(self, size='100%%'):
        self._background = 'white'
        self._background_opacity = 1
        self._size = size


    def DisplayShape(self, shp, shape_color = default_shape_color):
        """ takes a topods_shape and displays it in a jupyter notebook
        """
        # compute the tesselation
        tess = Tesselator(shp)
        tess.Compute()
        # get vertices and normals
        vertices_position = tess.GetVerticesPositionAsTuple()

        number_of_triangles = tess.ObjGetTriangleCount()
        number_of_vertices = len(vertices_position)

        # number of vertices should be a multiple of 3
        assert number_of_vertices % 3 == 0
        assert number_of_triangles * 9 == number_of_vertices

        #normals = tess.GetNormalsAsTuple()
        #number_of_normals = len(normals)
        ## there should be as many normals than vertices
        #assert number_of_normals == number_of_vertices

        # then we compute the vertices and normals arrays
        np_vertices = np.array(vertices_position, dtype='float32').reshape(int(number_of_vertices / 3), 3)
        #np_normals = np.array(normals, dtype='float32').reshape(int(number_of_vertices / 3), 3)
        number_of_faces = number_of_vertices / 3
        np_faces = np.arange(number_of_faces, dtype='uint32').reshape(int(number_of_faces/3), 3)

        # finally DisplayShape
        shape_geometry = PlainBufferGeometry(vertices=np_vertices, faces=np_faces)
        #shape_geometry.exec_three_obj_method('computeFaceNormals') TODO normals should be client-side computed
        #shape_geometry.exec_three_obj_method('computeVertexNormals') TODO idem for vertex normals
        shp_material = PhongMaterial(color=default_shape_color, shininess=0.9, morphTargets=True)
        shape_mesh = Mesh(geometry=shape_geometry, material = shp_material)
        scene_shp = Scene(children=[shape_mesh, AmbientLight(color='#101010')])

        # create a camera
        px, py, pz, xc, yc, zc = get_boundingbox(shp)
        self._camera = PerspectiveCamera(position=[0, -3*py, pz *3],
                                         fov=50,
                                         children=[DirectionalLight(color='#ffffff', position=[50, 50, 50], intensity=0.5)])
        renderer_shp = Renderer(camera=self._camera,
                                background=self._background,
                                background_opacity=self._background_opacity,
                                scene = scene_shp,
                                controls=[TrackballControls(controlling=self._camera)])
        display(renderer_shp)



if __name__ == "__main__":
    from OCC.BRepPrimAPI import BRepPrimAPI_MakeBox, BRepPrimAPI_MakeTorus
    my_ren = JupyterRenderer()
    box_s = BRepPrimAPI_MakeBox(10, 20, 30).Shape()
    my_ren.DisplayShape(box_s)
    