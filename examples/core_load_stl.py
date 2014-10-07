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

from OCC.Display.SimpleGui import init_display
from OCC.TopoDS import TopoDS_Shape
from OCC.StlAPI import StlAPI_Reader

stl_reader = StlAPI_Reader()
fan_shp = TopoDS_Shape()
stl_reader.Read(fan_shp, './models/fan.stl')

display, start_display, add_menu, add_function_to_menu = init_display()
display.DisplayShape(fan_shp, update=True)
start_display()
