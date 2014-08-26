#!/usr/bin/env python

##Copyright 2009-2013 Jelle Ferina (jelleferinga@gmail.com)
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

from OCC.gp import gp_Pnt, gp_Pnt2d, gp_OX2d
from OCC.Geom2d import Geom2d_Circle
from OCC.Geom2dAdaptor import Geom2dAdaptor_Curve
from OCC.GCPnts import GCPnts_UniformAbscissa

from OCC.Display.SimpleGui import init_display
display, start_display, add_menu, add_function_to_menu = init_display()


def points_from_curve(event=None):
    radius = 5.
    abscissa = 3.
    circle = Geom2d_Circle(gp_OX2d(), radius, True)
    gac = Geom2dAdaptor_Curve(circle.GetHandle())
    ua = GCPnts_UniformAbscissa(gac, abscissa)

    aSequence = []
    if ua.IsDone():
        n = ua.NbPoints()
        for count in range(1, n + 1):
            p = gp_Pnt2d()
            circle.D0(ua.Parameter(count), p)
            aSequence.append(p)

    # convert analytic to bspline
    display.DisplayShape(circle, update=True)

    i = 0
    for p in aSequence:
        i = i + 1
        pstring = 'P%i : parameter %f' % (i, ua.Parameter(i))
        pnt = gp_Pnt(p.X(), p.Y(), 0)
        # display points
        display.DisplayShape(pnt, update=True)
        display.DisplayMessage(pnt, pstring)


def exit(event=None):
    sys.exit()

if __name__ == '__main__':
    add_menu('geometry')
    add_function_to_menu('geometry', points_from_curve)
    add_function_to_menu('geometry', exit)
    start_display()
