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
from OCC.StlAPI import StlAPI_Writer
from OCC.BRepPrimAPI import BRepPrimAPI_MakeBox

my_box = BRepPrimAPI_MakeBox(10., 20., 30.).Shape()

# set the directory where to output the
directory = os.path.split(__name__)[0]
stl_output_dir = os.path.abspath(os.path.join(directory, "models"))

# make sure the path exists otherwise OCE get confused
assert os.path.isdir(stl_output_dir)
stl_output_file = os.path.join(stl_output_dir, "box.stl")

stl_exporter = StlAPI_Writer()
stl_exporter.SetASCIIMode(True)  # change to False if you need binary export
stl_exporter.Write(my_box, stl_output_file)
