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

from OCC.Core.gp import (gp_Pnt, gp_Sphere, gp_Ax3, gp_Dir, gp_Circ, gp_Ax2,
                    gp_Pnt2d, gp_Dir2d)
from OCC.Core.BRepBuilderAPI import (BRepBuilderAPI_MakeEdge,
                                BRepBuilderAPI_MakeFace,
                                BRepBuilderAPI_MakeWire)
from OCC.Core.TColgp import TColgp_Array2OfPnt
from OCC.Core.GeomAPI import GeomAPI_PointsToBSplineSurface
from OCC.Core.GeomAbs import GeomAbs_C2
from OCC.Core.Geom2d import Geom2d_Line
from OCC.Core.BRepLib import breplib_BuildCurves3d
from OCC.Core.Quantity import Quantity_Color, Quantity_NOC_PINK

from OCC.Display.SimpleGui import init_display
display, start_display, add_menu, add_function_to_menu = init_display()


def face():
    p1 = gp_Pnt()
    p2 = gp_Pnt()
    p3 = gp_Pnt()
    p4 = gp_Pnt()
    p5 = gp_Pnt()
    p6 = gp_Pnt()

    # The white Face
    sphere = gp_Sphere(gp_Ax3(gp_Pnt(0, 0, 0), gp_Dir(1, 0, 0)), 150)
    green_face = BRepBuilderAPI_MakeFace(sphere, 0.1, 0.7, 0.2, 0.9)

    # The red face
    p1.SetCoord(-15, 200, 10)
    p2.SetCoord(5, 204, 0)
    p3.SetCoord(15, 200, 0)
    p4.SetCoord(-15, 20, 15)
    p5.SetCoord(-5, 20, 0)
    p6.SetCoord(15, 20, 35)
    array = TColgp_Array2OfPnt(1, 3, 1, 2)
    array.SetValue(1, 1, p1)
    array.SetValue(2, 1, p2)
    array.SetValue(3, 1, p3)
    array.SetValue(1, 2, p4)
    array.SetValue(2, 2, p5)
    array.SetValue(3, 2, p6)
    curve = GeomAPI_PointsToBSplineSurface(array, 3, 8, GeomAbs_C2,
                                           0.001).Surface()
    red_face = BRepBuilderAPI_MakeFace(curve, 1e-6)

    #The brown face
    circle = gp_Circ(gp_Ax2(gp_Pnt(0, 0, 0), gp_Dir(1, 0, 0)), 80)
    Edge1 = BRepBuilderAPI_MakeEdge(circle, 0, math.pi)
    Edge2 = BRepBuilderAPI_MakeEdge(gp_Pnt(0, 0, -80), gp_Pnt(0, -10, 40))
    Edge3 = BRepBuilderAPI_MakeEdge(gp_Pnt(0, -10, 40), gp_Pnt(0, 0, 80))

    ##TopoDS_Wire YellowWire
    MW1 = BRepBuilderAPI_MakeWire(Edge1.Edge(), Edge2.Edge(), Edge3.Edge())
    assert MW1.IsDone()
    yellow_wire = MW1.Wire()
    brown_face = BRepBuilderAPI_MakeFace(yellow_wire)

    #The pink face
    p1.SetCoord(35, -200, 40)
    p2.SetCoord(50, -204, 30)
    p3.SetCoord(65, -200, 30)
    p4.SetCoord(35, -20, 45)
    p5.SetCoord(45, -20, 30)
    p6.SetCoord(65, -20, 65)
    array2 = TColgp_Array2OfPnt(1, 3, 1, 2)
    array2.SetValue(1, 1, p1)
    array2.SetValue(2, 1, p2)
    array2.SetValue(3, 1, p3)
    array2.SetValue(1, 2, p4)
    array2.SetValue(2, 2, p5)
    array2.SetValue(3, 2, p6)
    BSplineSurf = GeomAPI_PointsToBSplineSurface(array2, 3, 8, GeomAbs_C2,
                                                 0.001)
    aFace = BRepBuilderAPI_MakeFace(BSplineSurf.Surface(), 1e-6).Face()
    ##
    ##//2d lines
    P12d = gp_Pnt2d(0.9, 0.1)
    P22d = gp_Pnt2d(0.2, 0.7)
    P32d = gp_Pnt2d(0.02, 0.1)
    ##
    line1 = Geom2d_Line(P12d, gp_Dir2d((0.2-0.9), (0.7-0.1)))
    line2 = Geom2d_Line(P22d, gp_Dir2d((0.02-0.2), (0.1-0.7)))
    line3 = Geom2d_Line(P32d, gp_Dir2d((0.9-0.02), (0.1-0.1)))
    ##
    ##//Edges are on the BSpline surface
    Edge1 = BRepBuilderAPI_MakeEdge(line1.GetHandle(), BSplineSurf.Surface(),
                                    0, P12d.Distance(P22d)).Edge()
    Edge2 = BRepBuilderAPI_MakeEdge(line2.GetHandle(), BSplineSurf.Surface(),
                                    0, P22d.Distance(P32d)).Edge()
    Edge3 = BRepBuilderAPI_MakeEdge(line3.GetHandle(), BSplineSurf.Surface(),
                                    0, P32d.Distance(P12d)).Edge()
    ##
    Wire1 = BRepBuilderAPI_MakeWire(Edge1, Edge2, Edge3).Wire()
    Wire1.Reverse()
    pink_face = BRepBuilderAPI_MakeFace(aFace, Wire1).Face()
    breplib_BuildCurves3d(pink_face)

    display.DisplayColoredShape(green_face.Face(), 'GREEN')
    display.DisplayColoredShape(red_face.Face(), 'RED')
    display.DisplayColoredShape(pink_face, Quantity_Color(Quantity_NOC_PINK))
    display.DisplayColoredShape(brown_face.Face(), 'BLUE')
    display.DisplayColoredShape(yellow_wire, 'YELLOW', update=True)

if __name__ == '__main__':
    face()
    start_display()
