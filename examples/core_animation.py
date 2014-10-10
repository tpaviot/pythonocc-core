#!/usr/bin/env python

##Copyright 2009-2013 Thomas Paviot (tpaviot@gmail.com)
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

import time

from OCC.gp import *
from OCC.BRepPrimAPI import BRepPrimAPI_MakeBox
from OCC.TopLoc import *
from OCC.AIS import *
from OCC.Display.SimpleGui import *

display, start_display, add_menu, add_function_to_menu = init_display()

ais_boxshp = None


def build_shape():
    boxshp = BRepPrimAPI_MakeBox(50., 50., 50.).Shape()
    ais_boxshp = display.DisplayShape(boxshp, update=True)
    return ais_boxshp


def rotating_cube_1_axis(event=None):
    ais_boxshp = build_shape()
    ax1 = gp_Ax1(gp_Pnt(0., 0., 0.), gp_Dir(0., 0., 1.))
    aCubeTrsf = gp_Trsf()
    angle = 0.0
    tA = time.time()
    n_rotations = 200
    for i in range(n_rotations):
        aCubeTrsf.SetRotation(ax1, angle)
        aCubeToploc = TopLoc_Location(aCubeTrsf)
        display.Context.SetLocation(ais_boxshp, aCubeToploc)
        display.Context.UpdateCurrentViewer()
        angle += 0.1
    print "{0} rotations took {1}".format(n_rotations, time.time() - tA)


def rotating_cube_2_axis(event=None):
    ais_boxshp = build_shape()
    ax1 = gp_Ax1(gp_Pnt(0., 0., 0.), gp_Dir(0., 0., 1.))
    ax2 = gp_Ax1(gp_Pnt(0., 0., 0.), gp_Dir(0., 1., 0.))
    aCubeTrsf = gp_Trsf()
    aCubeTrsf2 = gp_Trsf()
    angle = 0.0
    angle2 = 0.0
    tA = time.time()
    n_rotations = 200
    for i in range(n_rotations):
        aCubeTrsf.SetRotation(ax1, angle)
        aCubeTrsf2.SetRotation(ax2, angle)
        aCubeToploc = TopLoc_Location(aCubeTrsf*aCubeTrsf2)
        display.Context.SetLocation(ais_boxshp, aCubeToploc)
        display.Context.UpdateCurrentViewer()
        angle += 0.1
    print "{0} rotations took {1}".format(n_rotations, time.time() - tA)

if __name__ == '__main__':
    add_menu('animation')
    add_function_to_menu('animation', rotating_cube_1_axis)
    add_function_to_menu('animation', rotating_cube_2_axis)
    start_display()
