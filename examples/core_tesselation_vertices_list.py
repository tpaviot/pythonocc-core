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

from OCC.Visualization import Tesselator
from OCC.BRepPrimAPI import BRepPrimAPI_MakeBox, BRepPrimAPI_MakeTorus

try:
    import numpy as np
    HAVE_NUMPY = True
except:
    HAVE_NUMPY = False

# create the shape
box_s = BRepPrimAPI_MakeBox(10, 20, 30).Shape()

# compute the tesselation
tess = Tesselator(box_s)
tess.Compute()

# get vertices
vertices_position = tess.GetVerticesPositionAsTuple()

number_of_triangles = tess.ObjGetTriangleCount()
number_of_vertices = len(vertices_position)

# number of vertices should be a multiple of 3
assert number_of_vertices % 3 == 0
assert number_of_triangles * 9 == number_of_vertices

# get normals
normals = tess.GetNormalsAsTuple()
number_of_normals = len(normals)
assert number_of_normals == number_of_vertices

# if HAVE_NUMPY, we try to reshape the tuple so that it is of
# a ndarray such as [[x1, y1, z1], [x2, y2, z2], ...]
#
if HAVE_NUMPY:
    vertices = np.array(vertices_position).reshape(int(number_of_vertices / 3), 3)
    print(vertices)
    normals = np.array(normals).reshape(int(number_of_vertices / 3), 3)
    print(normals)
