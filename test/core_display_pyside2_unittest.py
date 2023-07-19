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

import sys

from OCC.Display.backend import load_pyside2
from OCC.Display.SimpleGui import init_display
from OCC.Core.BRepPrimAPI import BRepPrimAPI_MakeBox

# check for pyside
if not load_pyside2():
    print("pyside2 required to run this test")
    sys.exit()

print("pyside2 test running ...")
pyside2_display, start_display, add_menu, add_function_to_menu = init_display(
    "qt-pyside2"
)
my_box = BRepPrimAPI_MakeBox(10.0, 20.0, 30.0).Shape()
pyside2_display.DisplayShape(my_box, update=True)
print("pyside2 test ok.")
