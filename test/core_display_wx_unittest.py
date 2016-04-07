#!/usr/bin/python

##Copyright 2010-2016 Thomas Paviot (tpaviot@gmail.com)
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
import sys

from OCC.Display.backend import load_wx
from OCC.Display.SimpleGui import init_display
from OCC.BRepPrimAPI import BRepPrimAPI_MakeBox

# check for wx
if not load_wx():
    print("wx required to run this test")
    sys.exit()

print('wx test')
wx_display, start_display, add_menu, add_function_to_menu = init_display('wx')
my_box_1 = BRepPrimAPI_MakeBox(10., 20., 30.).Shape()
wx_display.DisplayShape(my_box_1, update=True)
