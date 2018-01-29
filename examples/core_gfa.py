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
from OCC.Core.BRepPrimAPI import BRepPrimAPI_MakeBox
from OCC.Core.BOPAlgo import BOPAlgo_Builder

display, start_display, add_menu, add_function_to_menu = init_display()
my_box1 = BRepPrimAPI_MakeBox(10., 20., 30.).Shape()
my_box2 = BRepPrimAPI_MakeBox(20., 1., 30.).Shape()

# use the GFA
builder = BOPAlgo_Builder()
builder.AddArgument(my_box1)
builder.AddArgument(my_box2)
builder.SetRunParallel(True)
builder.Perform()  # or .PerformWithFiller(aPF);
error_code = builder.ErrorStatus()
if error_code != 0:
	raise AssertionError("Failed with error code %i" % error_code)
result = builder.Shape()
display.DisplayShape(result, update=True)
start_display()
