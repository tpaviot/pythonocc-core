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
from OCC.Geom2dAPI import Geom2dAPI_Interpolate, Geom2dAPI_PointsToBSpline
from OCC.TColgp import TColgp_HArray1OfPnt2d, TColgp_Array1OfPnt2d

from OCC.Display.SimpleGui import init_display
display, start_display, add_menu, add_function_to_menu = init_display()


def bspline():
    # the first bspline
    array = TColgp_Array1OfPnt2d(1, 5)
    array.SetValue(1, gp_Pnt2d(0, 0))
    array.SetValue(2, gp_Pnt2d(1, 2))
    array.SetValue(3, gp_Pnt2d(2, 3))
    array.SetValue(4, gp_Pnt2d(4, 3))
    array.SetValue(5, gp_Pnt2d(5, 5))
    bspline_1 = Geom2dAPI_PointsToBSpline(array).Curve()

    # the second one
    harray = TColgp_HArray1OfPnt2d(1, 5)
    harray.SetValue(1, gp_Pnt2d(0, 0))
    harray.SetValue(2, gp_Pnt2d(1, 2))
    harray.SetValue(3, gp_Pnt2d(2, 3))
    harray.SetValue(4, gp_Pnt2d(4, 3))
    harray.SetValue(5, gp_Pnt2d(5, 5))

    anInterpolation = Geom2dAPI_Interpolate(harray.GetHandle(), False, 0.01)
    anInterpolation.Perform()
    bspline_2 = anInterpolation.Curve()

    harray2 = TColgp_HArray1OfPnt2d(1, 5)
    harray2.SetValue(1, gp_Pnt2d(11, 0))
    harray2.SetValue(2, gp_Pnt2d(12, 2))
    harray2.SetValue(3, gp_Pnt2d(13, 3))
    harray2.SetValue(4, gp_Pnt2d(15, 3))
    harray2.SetValue(5, gp_Pnt2d(16, 5))

    anInterpolation2 = Geom2dAPI_Interpolate(harray.GetHandle(), True, 0.01)
    anInterpolation2.Perform()
    bspline_3 = anInterpolation2.Curve()

    for j in range(array.Lower(), array.Upper()+1):
        p = array.Value(j)
        display.DisplayShape(p, update=False)
    for j in range(harray.Lower(), harray.Upper()+1):
        p = harray.Value(j)
        display.DisplayShape(p, update=False)

    display.DisplayShape(bspline_1, update=False)
    display.DisplayShape(bspline_2, update=False, color='GREEN')
    display.DisplayShape(bspline_3, update=True, color='BLUE')

if __name__ == '__main__':
    bspline()
    start_display()
