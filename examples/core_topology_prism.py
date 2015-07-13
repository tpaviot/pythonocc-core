#!/usr/bin/env python

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

from __future__ import print_function

from OCC.gp import gp_Pnt, gp_Vec
from OCC.GeomAPI import GeomAPI_PointsToBSpline
from OCC.TColgp import TColgp_Array1OfPnt
from OCC.BRepBuilderAPI import BRepBuilderAPI_MakeEdge
from OCC.BRepPrimAPI import BRepPrimAPI_MakePrism

from OCC.Display.SimpleGui import init_display
display, start_display, add_menu, add_function_to_menu = init_display()


def prism():
    # the bspline profile
    array = TColgp_Array1OfPnt(1, 5)
    array.SetValue(1, gp_Pnt(0, 0, 0))
    array.SetValue(2, gp_Pnt(1, 2, 0))
    array.SetValue(3, gp_Pnt(2, 3, 0))
    array.SetValue(4, gp_Pnt(4, 3, 0))
    array.SetValue(5, gp_Pnt(5, 5, 0))
    bspline = GeomAPI_PointsToBSpline(array).Curve()
    profile = BRepBuilderAPI_MakeEdge(bspline).Edge()

    # the linear path
    starting_point = gp_Pnt(0., 0., 0.)
    end_point = gp_Pnt(0., 0., 6.)
    vec = gp_Vec(starting_point, end_point)
    path = BRepBuilderAPI_MakeEdge(starting_point, end_point).Edge()

    # extrusion
    prism = BRepPrimAPI_MakePrism(profile, vec).Shape()

    display.DisplayShape(profile, update=False)
    display.DisplayShape(starting_point, update=False)
    display.DisplayShape(end_point, update=False)
    display.DisplayShape(path, update=False)
    display.DisplayShape(prism, update=True)

if __name__ == '__main__':
    prism()
    start_display()
