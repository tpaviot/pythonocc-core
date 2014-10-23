#!/usr/bin/env python

##Copyright 2009-2014 Jelle Ferina (jelleferinga@gmail.com)
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

from __future__ import print_function

from OCC.gp import gp_Pnt2d, gp_Dir2d, gp_Ax22d, gp_Parab2d
from OCC.GCE2d import GCE2d_MakeParabola
from OCC.Geom2d import Geom2d_TrimmedCurve

from OCC.Display.SimpleGui import init_display
display, start_display, add_menu, add_function_to_menu = init_display()


def parabola(event=None):
    # P is the vertex point
    # P and D give the axis of symmetry
    # 6 is the focal length of the parabola
    a_pnt = gp_Pnt2d(2, 3)
    a_dir = gp_Dir2d(4, 5)
    an_ax = gp_Ax22d(a_pnt, a_dir, True)
    para = gp_Parab2d(an_ax, 6)
    display.DisplayShape(a_pnt)
    display.DisplayMessage(a_pnt, "P")

    aParabola = GCE2d_MakeParabola(para)
    gParabola = aParabola.Value()

    aTrimmedCurve = Geom2d_TrimmedCurve(gParabola, -100, 100, True)

    display.DisplayShape(aTrimmedCurve, update=True)


if __name__ == '__main__':
    parabola()
    start_display()
