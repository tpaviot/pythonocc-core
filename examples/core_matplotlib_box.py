#!/usr/bin/env python

##Copyright 2015 Martin Siggel (martinsiggel@gmail.com)
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

# Small example how to use the Tesselator interface to draw
# a shape with matplotlib

import sys

from OCC.Visualization import Tesselator
from OCC.BRepPrimAPI import BRepPrimAPI_MakeBox
try:
    from mpl_toolkits.mplot3d import Axes3D
    from matplotlib import pyplot as plt
    from mpl_toolkits.mplot3d.art3d import Poly3DCollection, Line3DCollection
except ImportError:
    print("This example requires matplotlib.")
    sys.exit(0)

def draw_shape_mpl(shape):
    """
    Draw a TopoDS_Shape with matplotlib
    """

    tess = Tesselator(shape)

    triangles = []
    edges = []

    # get the triangles
    triangle_count = tess.ObjGetTriangleCount()
    for i_triangle in range(0, triangle_count):
        i1, i2, i3 = tess.GetTriangleIndex(i_triangle)
        triangles.append([tess.GetVertex(i1), tess.GetVertex(i2), tess.GetVertex(i3)])

    # get the edges
    edge_count = tess.ObjGetEdgeCount()
    for i_edge in range(0, edge_count):
        vertex_count = tess.ObjEdgeGetVertexCount(i_edge)
        edge = []
        for i_vertex in range(0, vertex_count):
            vertex = tess.GetEdgeVertex(i_edge, i_vertex)
            edge.append(vertex)
        edges.append(edge)

    # plot it
    fig = plt.figure()
    ax = Axes3D(fig)

    ax.add_collection3d(Poly3DCollection(triangles, linewidths=0.2, alpha=0.5))
    ax.add_collection3d(Line3DCollection(edges, colors='w', linewidths=1.0))

    ax.get_xaxis().set_visible(True)
    ax.get_yaxis().set_visible(True)
    ax.set_autoscale_on(True)
    plt.show()


box = BRepPrimAPI_MakeBox(1,1,1).Shape()
draw_shape_mpl(box)
