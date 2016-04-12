##Copyright 2009-2016 Thomas Paviot (tpaviot@gmail.com) & Jelle Feringa
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
import math
from OCC.BRepBuilderAPI import BRepBuilderAPI_MakeEdge, BRepBuilderAPI_MakeWire, BRepBuilderAPI_MakeFace
from OCC.BRepPrimAPI import BRepPrimAPI_MakeRevol
from OCC.Display.SimpleGui import init_display
from OCC.gp import gp_Pnt, gp_Dir, gp_Ax1

display, start_display, add_menu, add_function_to_menu = init_display()


def revolved_shape():
    """ demonstrate how to create a revolved shape from an edge

    adapted from algotopia.com's opencascade_basic tutorial:
    http://www.algotopia.com/contents/opencascade/opencascade_basic

    """
    face_inner_radius = 0.6
    # point to create an edge from
    edg_points = [
        gp_Pnt(face_inner_radius - 0.05, 0.0, -0.05),
        gp_Pnt(face_inner_radius - 0.10, 0.0, -0.025),
        gp_Pnt(face_inner_radius - 0.10, 0.0, 0.025),
        gp_Pnt(face_inner_radius + 0.10, 0.0, 0.025),
        gp_Pnt(face_inner_radius + 0.10, 0.0, -0.025),
        gp_Pnt(face_inner_radius + 0.05, 0.0, -0.05),
        gp_Pnt(face_inner_radius - 0.05, 0.0, -0.05),
    ]

    # aggregate edges in wire
    hexwire = BRepBuilderAPI_MakeWire()

    for i in range(6):
        hexedge = BRepBuilderAPI_MakeEdge(edg_points[i], edg_points[i+1]).Edge()
        hexwire.Add(hexedge)

    hexwire_wire = hexwire.Wire()
    # face from wire
    hexface = BRepBuilderAPI_MakeFace(hexwire_wire).Face()
    revolve_axis = gp_Ax1(gp_Pnt(0, 0, 0), gp_Dir(0, 0, 1))
    # create revolved shape
    revolved_shape_ = BRepPrimAPI_MakeRevol(hexface, revolve_axis, math.radians(90.)).Shape()

    # render wire & revolved shape
    display.DisplayShape([revolved_shape_, hexwire_wire])
    display.FitAll()
    start_display()

if __name__ == '__main__':
    revolved_shape()
