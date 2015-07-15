##Copyright 2009-2015 Thomas Paviot (tpaviot@gmail.com)
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

from OCC.gp import gp_Pnt, gp_Lin, gp_Ax1, gp_Dir, gp_Elips, gp_Ax2
from OCC.BRepBuilderAPI import (BRepBuilderAPI_MakeEdge,
                                BRepBuilderAPI_MakeVertex)
from OCC.TColgp import TColgp_Array1OfPnt
from OCC.Geom import Geom_BezierCurve

from OCC.Display.SimpleGui import init_display
display, start_display, add_menu, add_function_to_menu = init_display()


def edge(event=None):
    # The blud edge
    BlueEdge = BRepBuilderAPI_MakeEdge(gp_Pnt(-80, -50, -20),
                                       gp_Pnt(-30, -60, -60))
    V1 = BRepBuilderAPI_MakeVertex(gp_Pnt(-20, 10, -30))
    V2 = BRepBuilderAPI_MakeVertex(gp_Pnt(10, 7, -25))
    YellowEdge = BRepBuilderAPI_MakeEdge(V1.Vertex(), V2.Vertex())

    #The white edge
    line = gp_Lin(gp_Ax1(gp_Pnt(10, 10, 10), gp_Dir(1, 0, 0)))
    WhiteEdge = BRepBuilderAPI_MakeEdge(line, -20, 10)

    #The red edge
    Elips = gp_Elips(gp_Ax2(gp_Pnt(10, 0, 0), gp_Dir(1, 1, 1)), 60, 30)
    RedEdge = BRepBuilderAPI_MakeEdge(Elips, 0, math.pi/2)

    # The green edge and the both extreme vertex
    P1 = gp_Pnt(-15, 200, 10)
    P2 = gp_Pnt(5, 204, 0)
    P3 = gp_Pnt(15, 200, 0)
    P4 = gp_Pnt(-15, 20, 15)
    P5 = gp_Pnt(-5, 20, 0)
    P6 = gp_Pnt(15, 20, 0)
    P7 = gp_Pnt(24, 120, 0)
    P8 = gp_Pnt(-24, 120, 12.5)
    array = TColgp_Array1OfPnt(1, 8)
    array.SetValue(1, P1)
    array.SetValue(2, P2)
    array.SetValue(3, P3)
    array.SetValue(4, P4)
    array.SetValue(5, P5)
    array.SetValue(6, P6)
    array.SetValue(7, P7)
    array.SetValue(8, P8)
    curve = Geom_BezierCurve(array)
    ME = BRepBuilderAPI_MakeEdge(curve.GetHandle())
    GreenEdge = ME
    V3 = ME.Vertex1()
    V4 = ME.Vertex2()

    display.DisplayColoredShape(BlueEdge.Edge(), 'BLUE')
    display.DisplayShape(V1.Vertex())
    display.DisplayShape(V2.Vertex())
    display.DisplayColoredShape(WhiteEdge.Edge(), 'WHITE')
    display.DisplayColoredShape(YellowEdge.Edge(), 'YELLOW')
    display.DisplayColoredShape(RedEdge.Edge(), 'RED')
    display.DisplayColoredShape(GreenEdge.Edge(), 'GREEN')
    display.DisplayShape(V3)
    display.DisplayShape(V4, update=True)

if __name__ == '__main__':
    edge()
    start_display()
