#!/usr/bin/env python

##Copyright 2016 Jelle Feringa (jelleferinga@gmail.com)
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


from OCC.Display.SimpleGui import init_display
from OCC.Graphic3d import Graphic3d_Camera

import sys, os

sys.path.append(os.path.dirname(__name__))
from core_load_step_ap203 import read_step_file

display, start_display, add_menu, add_function_to_menu = init_display()

# load step file
the_shape = read_step_file('./models/as1_pe_203.stp')
display.DisplayShape(the_shape)


def animate_viewpoint():
    display.FitAll()
    display.Context.UpdateCurrentViewer()

    cam = display.View.Camera().GetObject()  # type: Graphic3d_Camera

    center = cam.Center()
    eye = cam.Eye()

    for i in range(100):
        eye.SetY(eye.Y() + i)
        cam.SetEye(eye)
        display.View.ZFitAll()
        display.Context.UpdateCurrentViewer()

    for i in range(100):
        center.SetZ(center.Z() + i)
        cam.SetCenter(center)
        display.View.ZFitAll()
        display.Context.UpdateCurrentViewer()


add_menu("camera")
add_function_to_menu("camera", animate_viewpoint)

start_display()
