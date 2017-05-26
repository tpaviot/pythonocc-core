##Copyright 2009-2016 Thomas Paviot (tpaviot@gmail.com)
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
import sys
from math import cos, pi

from OCC.BRepAlgoAPI import BRepAlgoAPI_Fuse
from OCC.BRepFilletAPI import BRepFilletAPI_MakeFillet
from OCC.BRepPrimAPI import BRepPrimAPI_MakeBox, BRepPrimAPI_MakeCylinder
from OCC.Display.SimpleGui import init_display
from OCC.TColgp import TColgp_Array1OfPnt2d
from OCC.gp import gp_Ax2, gp_Pnt, gp_Dir, gp_Pnt2d
from core_topology_traverse import Topo

display, start_display, add_menu, add_function_to_menu = init_display()


def fillet(event=None):
    Box = BRepPrimAPI_MakeBox(gp_Pnt(-400, 0, 0), 200, 230, 180).Shape()
    fillet = BRepFilletAPI_MakeFillet(Box)
    # Add fillet on each edge
    for e in Topo(Box).edges():
        fillet.Add(20, e)

    blendedBox = fillet.Shape()

    P1 = gp_Pnt(250, 150, 75)
    S1 = BRepPrimAPI_MakeBox(300, 200, 200).Shape()
    S2 = BRepPrimAPI_MakeBox(P1, 120, 180, 70).Shape()
    Fuse = BRepAlgoAPI_Fuse(S1, S2)
    FusedShape = Fuse.Shape()

    fill = BRepFilletAPI_MakeFillet(FusedShape)
    for e in Topo(FusedShape).edges():
        fill.Add(e)

    for i in range(1, fill.NbContours() + 1):
        length = fill.Length(i)
        Rad = 0.15 * length
        fill.SetRadius(Rad, i, 1)

    blendedFusedSolids = fill.Shape()

    display.EraseAll()
    display.DisplayShape(blendedBox)
    display.DisplayShape(blendedFusedSolids)
    display.FitAll()


def variable_filleting(event=None):
    display.EraseAll()
    # Create Box
    Box = BRepPrimAPI_MakeBox(200, 200, 200).Shape()
    # Fillet
    Rake = BRepFilletAPI_MakeFillet(Box)
    ex = Topo(Box).edges()
    next(ex)
    next(ex)
    next(ex)

    Rake.Add(8, 50, next(ex))
    Rake.Build()
    if Rake.IsDone():
        evolvedBox = Rake.Shape()
        display.DisplayShape(evolvedBox)
    else:
        print("Rake not done.")
    # Create Cylinder
    Cylinder = BRepPrimAPI_MakeCylinder(gp_Ax2(gp_Pnt(-300, 0, 0), gp_Dir(0, 0, 1)), 100, 200).Shape()
    fillet = BRepFilletAPI_MakeFillet(Cylinder)

    TabPoint2 = TColgp_Array1OfPnt2d(0, 20)
    for i in range(0, 20):
        Point2d = gp_Pnt2d(i * 2 * pi / 19, 60 * cos(i * pi / 19 - pi / 2) + 10)
        TabPoint2.SetValue(i, Point2d)

    exp2 = Topo(Cylinder).edges()
    fillet.Add(TabPoint2, next(exp2))
    fillet.Build()
    if fillet.IsDone():
        LawEvolvedCylinder = fillet.Shape()
        display.DisplayShape(LawEvolvedCylinder)
    else:
        print("fillet not done.")  ## TODO : fillet not done
    P = gp_Pnt(350, 0, 0)
    Box2 = BRepPrimAPI_MakeBox(P, 200, 200, 200).Shape()
    afillet = BRepFilletAPI_MakeFillet(Box2)

    TabPoint = TColgp_Array1OfPnt2d(1, 6)
    P1 = gp_Pnt2d(0., 8.)
    P2 = gp_Pnt2d(0.2, 16.)
    P3 = gp_Pnt2d(0.4, 25.)
    P4 = gp_Pnt2d(0.6, 55.)
    P5 = gp_Pnt2d(0.8, 28.)
    P6 = gp_Pnt2d(1., 20.)
    TabPoint.SetValue(1, P1)
    TabPoint.SetValue(2, P2)
    TabPoint.SetValue(3, P3)
    TabPoint.SetValue(4, P4)
    TabPoint.SetValue(5, P5)
    TabPoint.SetValue(6, P6)

    exp = Topo(Box2).edges()
    next(exp)
    next(exp)
    next(exp)

    afillet.Add(TabPoint, next(exp))
    afillet.Build()
    if afillet.IsDone():
        LawEvolvedBox = afillet.Shape()
    else:
        print("aFillet not done.") 
        display.DisplayShape(LawEvolvedBox)
    display.FitAll()


def exit(event=None):
    sys.exit()


if __name__ == '__main__':
    add_menu('topology fillet operations')
    add_function_to_menu('topology fillet operations', fillet)
    add_function_to_menu('topology fillet operations', variable_filleting)
    add_function_to_menu('topology fillet operations', exit)
    start_display()
