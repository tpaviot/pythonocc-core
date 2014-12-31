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

from OCC.gp import gp_Pnt2d
from OCC.TColgp import TColgp_Array1OfPnt2d
from OCC.Geom2dAPI import Geom2dAPI_PointsToBSpline
from OCC.Geom2d import Geom2d_OffsetCurve

from OCC.Display.SimpleGui import init_display
display, start_display, add_menu, add_function_to_menu = init_display()


def curves2d_from_offset(event=None):
    '''
    @param display:
    '''
    pnt2d_array = TColgp_Array1OfPnt2d(1, 5)
    pnt2d_array.SetValue(1, gp_Pnt2d(-4, 0))
    pnt2d_array.SetValue(2, gp_Pnt2d(-7, 2))
    pnt2d_array.SetValue(3, gp_Pnt2d(-6, 3))
    pnt2d_array.SetValue(4, gp_Pnt2d(-4, 3))
    pnt2d_array.SetValue(5, gp_Pnt2d(-3, 5))

    spline_1 = Geom2dAPI_PointsToBSpline(pnt2d_array).Curve()

    dist = 1
    offset_curve1 = Geom2d_OffsetCurve(spline_1, dist)
    result = offset_curve1.IsCN(2)
    print("Offset curve yellow is C2: %r" % result)
    dist2 = 1.5
    offset_curve2 = Geom2d_OffsetCurve(spline_1, dist2)
    result2 = offset_curve2.IsCN(2)
    result = offset_curve1.IsCN(2)
    print("Offset curve blue is C2: %r" % result2)

    display.DisplayShape(spline_1)
    display.DisplayShape(offset_curve1, color='YELLOW')
    display.DisplayShape(offset_curve2, color='BLUE', update=True)


if __name__ == '__main__':
    curves2d_from_offset()
    start_display()
