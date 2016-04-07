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

from OCC.Display.backend import load_pyside
from OCC.Display.SimpleGui import init_display
from OCC.BRepPrimAPI import BRepPrimAPI_MakeBox

# check for pyside
if not load_pyside():
    print("pyside required to run this test")
    sys.exit()

print('pyside test')
pyside_display, start_display, add_menu, add_function_to_menu = init_display('qt-pyside')
my_box_1 = BRepPrimAPI_MakeBox(10., 20., 30.).Shape()
pyside_display.DisplayShape(my_box_1, update=True)
