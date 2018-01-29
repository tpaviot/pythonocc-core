##Copyright 2017 Thomas Paviot (tpaviot@gmail.com)
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

from OCC.Display.SimpleGui import init_display
from OCC.Core.Graphic3d import Graphic3d_RenderingParams
from OCC.Core.BRepTools import breptools_Read
from OCC.Core.TopoDS import TopoDS_Shape
from OCC.Core.BRep import BRep_Builder

display, start_display, add_menu, add_function_to_menu = init_display()

# loads the motor model
motor_c = TopoDS_Shape()
builder = BRep_Builder()
breptools_Read(motor_c, './models/Motor-c.brep', builder)
display.DisplayShape(motor_c, update=True)

def perspective(event=None):
    display.SetPerspectiveProjection()
    display.FitAll()

def orthographic(event=None):
    display.SetOrthographicProjection()
    display.FitAll()

def anaglyph_red_cyan(event=None):
    display.SetAnaglyphMode(Graphic3d_RenderingParams.Anaglyph_RedCyan_Simple)
    display.FitAll()

def anaglyph_red_cyan_optimized(event=None):
    display.SetAnaglyphMode(Graphic3d_RenderingParams.Anaglyph_RedCyan_Optimized)
    display.FitAll()

def anaglyph_yellow_blue(event=None):
    display.SetAnaglyphMode(Graphic3d_RenderingParams.Anaglyph_YellowBlue_Simple)
    display.FitAll()

def anaglyph_green_magenta(event=None):
    display.SetAnaglyphMode(Graphic3d_RenderingParams.Anaglyph_GreenMagenta_Simple)
    display.FitAll()

def exit(event=None):
    sys.exit()


if __name__ == '__main__':
    add_menu('camera projection')
    add_function_to_menu('camera projection', perspective)
    add_function_to_menu('camera projection', orthographic)
    add_function_to_menu('camera projection', anaglyph_red_cyan)
    add_function_to_menu('camera projection', anaglyph_red_cyan_optimized)
    add_function_to_menu('camera projection', anaglyph_yellow_blue)
    add_function_to_menu('camera projection', anaglyph_green_magenta)
    add_function_to_menu('camera projection', exit)
    start_display()
