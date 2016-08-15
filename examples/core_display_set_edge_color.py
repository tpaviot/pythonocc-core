#!/usr/bin/env python
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

from OCC.BRepPrimAPI import BRepPrimAPI_MakeBox
from OCC.AIS import AIS_Shape
from OCC.Quantity import Quantity_NOC_BLACK
from OCC.Display.SimpleGui import init_display

display, start_display, add_menu, add_function_to_menu = init_display()

myBox = BRepPrimAPI_MakeBox(60,60,50).Shape()
context = display.Context
context.SetAutoActivateSelection(False)

aisShape = AIS_Shape(myBox)
h_aisShape = aisShape.GetHandle()
context.Display(h_aisShape)

# Set shape transparency, a float number from 0.0 to 1.0
context.SetTransparency(h_aisShape, 0.6)
context.HilightWithColor(h_aisShape, Quantity_NOC_BLACK)

display.View_Iso()
display.FitAll()
start_display()
