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


from OCC.AIS import AIS_Shape
from OCC.BRepPrimAPI import BRepPrimAPI_MakeBox
from OCC.Display.SimpleGui import init_display
display, start_display, add_menu, add_function_to_menu = init_display()

#
# Create a box
#
s = BRepPrimAPI_MakeBox(200, 100, 50).Shape()
#
# Create an AIS_Shape from the previous shape
#
ais_shp = AIS_Shape(s)
ais_shp.SetWidth(4)
ais_shp.SetTransparency(0.10)

#
# Get context and display shape
#
# Get Context
ais_context = display.GetContext().GetObject()
ais_context.Display(ais_shp.GetHandle())

display.View_Iso()
display.FitAll()
start_display()
