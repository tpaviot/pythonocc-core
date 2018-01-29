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

import os

from OCC.Display.SimpleGui import init_display
from OCC.Extend.DataExchange import read_stl_file

stl_filename = os.path.join('.', 'models', 'fan.stl')
stl_shp = read_stl_file(stl_filename)

display, start_display, add_menu, add_function_to_menu = init_display()
display.DisplayShape(stl_shp, update=True)
start_display()
