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

import sys

from OCC.gp import gp_Pnt, gp_Dir, gp_Ax3

from OCC.Display.SimpleGui import init_display
display, start_display, add_menu, add_function_to_menu = init_display()


def axis():
    p1 = gp_Pnt(2., 3., 4.)
    d = gp_Dir(4., 5., 6.)
    a = gp_Ax3(p1, d)
    a_IsDirect = a.Direct()
    print("a is direct:", a_IsDirect)
    # a_XDirection = a.XDirection()
    # a_YDirection = a.YDirection()
    p2 = gp_Pnt(5., 3., 4.)
    a2 = gp_Ax3(p2, d)
    a2.YReverse()
    # axis3 is now left handed
    a2_IsDirect = a2.Direct()
    print("a2 is direct:", a2_IsDirect)
    # a2_XDirection = a2.XDirection()
    # a2_YDirection = a2.YDirection()
    display.DisplayShape(p1, update=True)
    display.DisplayShape(p2, update=True)
    display.DisplayMessage(p1, "P1")
    display.DisplayMessage(p2, "P2")


def exit(event=None):
    sys.exit()

if __name__ == '__main__':
    axis()
    start_display()
