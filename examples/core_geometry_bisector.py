##Copyright 2016 Jelle Feringa (jelleferinga@gmail.com)
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

import os
import sys

from OCC.Bisector import Bisector_BisecCC
from OCC.Display.SimpleGui import init_display
from OCC.GCE2d import GCE2d_MakeLine, GCE2d_MakeCircle
from OCC.GccAna import GccAna_Lin2dBisec, GccAna_CircLin2dBisec, GccAna_Pnt2dBisec
from OCC.gp import gp_Lin2d, gp_Pnt2d, gp_Dir2d, gp_Circ2d, gp_Ax22d, gp_Pnt

sys.path.append(os.path.dirname(__file__))
from core_geometry_utils import make_vertex, make_edge2d

# start gui
display, start_display, add_menu, add_function_to_menu = init_display()


def bisect_lineline(event=None):
    display.EraseAll()
    li1 = gp_Lin2d(gp_Pnt2d(), gp_Dir2d(1, 0))
    li2 = gp_Lin2d(gp_Pnt2d(), gp_Dir2d(0, 1))

    bi = GccAna_Lin2dBisec(li1, li2)
    bi_li1 = bi.ThisSolution(1)
    bi_li2 = bi.ThisSolution(2)

    for i in [li1, li2]:
        display.DisplayShape(make_edge2d(i))
    for i in [bi_li1, bi_li2]:
        display.DisplayColoredShape(make_edge2d(i), 'BLUE')
    display.FitAll()


def bisect_linecircle(event=None):
    display.EraseAll()
    ci1 = gp_Circ2d(gp_Ax22d(), 10000)
    li1 = gp_Lin2d(gp_Pnt2d(2000000, 20), gp_Dir2d(0, 1))
    bi = GccAna_CircLin2dBisec(ci1, li1)
    assert bi.IsDone()
    bisec = bi.ThisSolution(1).GetObject()
    pb = bisec.Parabola()
    display.DisplayShape([make_edge2d(ci1), make_edge2d(li1)])
    display.DisplayColoredShape(make_edge2d(pb), 'BLUE')
    display.FitAll()


def bisect_pnt(event=None):
    display.EraseAll()
    p1 = gp_Pnt2d(1, 0.5)
    p2 = gp_Pnt2d(0, 1e5)
    bi = GccAna_Pnt2dBisec(p1, p2)
    bisec = bi.ThisSolution()
    # enum GccInt_Lin, GccInt_Cir, GccInt_Ell, GccInt_Par, GccInt_Hpr, GccInt_Pnt
    p1_ = make_vertex(gp_Pnt(p1.X(), p1.Y(), 0))
    p2_ = make_vertex(gp_Pnt(p2.X(), p2.Y(), 0))
    display.DisplayShape([p1_, p2_])
    display.DisplayColoredShape(make_edge2d(bisec), 'BLUE')
    display.FitAll()


def bisect_crvcrv(event=None):
    display.EraseAll()
    ax = gp_Ax22d(gp_Pnt2d(), gp_Dir2d(1, 0), gp_Dir2d(0, -1))
    circ = gp_Circ2d(ax, 5)
    crv1 = GCE2d_MakeCircle(circ).Value()
    edg1 = make_edge2d(crv1, -1.0, 1.0)
    display.DisplayColoredShape(edg1, 'BLUE')

    p1 = gp_Pnt2d(-10, 0)
    p2 = gp_Pnt2d(-10, 10)
    crv2 = GCE2d_MakeLine(p1, p2).Value()
    edg2 = make_edge2d(crv2, -10.0, 10.0)
    display.DisplayColoredShape(edg2, 'GREEN')

    bi = Bisector_BisecCC(crv1, crv2, 50, -5, gp_Pnt2d(0, 0))
    crv_bi = bi.Curve(1)
    edg3 = make_edge2d(crv_bi, -1.0, 1.0)
    display.DisplayColoredShape(edg3, 'RED')
    display.FitAll()


if __name__ == '__main__':
    add_menu('bisector')
    add_function_to_menu('bisector', bisect_lineline)
    add_function_to_menu('bisector', bisect_linecircle)
    add_function_to_menu('bisector', bisect_pnt)
    add_function_to_menu('bisector', bisect_crvcrv)
    start_display()
