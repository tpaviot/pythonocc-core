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

from OCC.Core.BRepPrimAPI import BRepPrimAPI_MakeTorus
from OCC.Extend.DataExchange import write_stl_file

# first, create the shape
my_torus = BRepPrimAPI_MakeTorus(20., 10.).Shape()

# set the directory where to output the
directory = os.path.split(__name__)[0]
stl_output_dir = os.path.abspath(os.path.join(directory, "models"))

# make sure the path exists otherwise OCE get confused
assert os.path.isdir(stl_output_dir)
stl_low_resolution_file = os.path.join(stl_output_dir, "torus_default_resolution.stl")
write_stl_file(my_torus, stl_low_resolution_file)

# then we change the mesh resolution, and export as binary
stl_high_resolution_file = os.path.join(stl_output_dir, "torus_high_resolution.stl")
# we set the format to binary
write_stl_file(my_torus, stl_low_resolution_file, mode="binary", linear_deflection=0.5, angular_deflection=0.3)
