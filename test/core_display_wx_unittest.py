#!/usr/bin/python

##Copyright 2010-2014 Thomas Paviot (tpaviot@gmail.com)
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
print(sys.path)
# required by travis to find SimpleGui module
# both on py2 and py3
sys.path.append('/home/travis/virtualenv/python2.7.8/lib/python2.7/site-packages')
sys.path.append('/home/travis/virtualenv/python3.3.5/lib/python3.3/site-packages')
from OCC.Display.SimpleGui import init_display
from OCC.BRepPrimAPI import BRepPrimAPI_MakeBox

# pyside test
print('wx test')
wx_display, start_display, add_menu, add_function_to_menu = init_display('wx')
my_box_1 = BRepPrimAPI_MakeBox(10., 20., 30.).Shape()
wx_display.DisplayShape(my_box_1, update=True)
