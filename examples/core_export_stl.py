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
from OCC.BRepPrimAPI import BRepPrimAPI_MakeTorus
from OCC.BRepMesh import BRepMesh_IncrementalMesh

# first, create the shape
my_torus = BRepPrimAPI_MakeTorus(20., 10.).Shape()
# then mesh it. This mesh is used by the STL exporter
# Note : if the mesh is not performed, the STL exporter
# won't do nothing
mesh = BRepMesh_IncrementalMesh(my_torus, 0.9)
mesh.Perform()
assert mesh.IsDone()

# set the directory where to output the
directory = os.path.split(__name__)[0]
stl_output_dir = os.path.abspath(os.path.join(directory, "models"))

# make sure the path exists otherwise OCE get confused
assert os.path.isdir(stl_output_dir)
stl_low_resolution_file = os.path.join(stl_output_dir, "torus_low_resolution.stl")
stl_exporter = StlAPI_Writer()
stl_exporter.SetASCIIMode(True)  # change to False if you need binary export
stl_exporter.Write(my_torus, stl_low_resolution_file)
# make sure the program was created
assert os.path.isfile(stl_low_resolution_file)

# then we change the mesh resolution
#
mesh.SetDeflection(0.05)
mesh.Perform()
assert mesh.IsDone()
stl_high_resolution_file = os.path.join(stl_output_dir, "torus_high_resolution.stl")
# we set the format to binary
stl_exporter.SetASCIIMode(False)
stl_exporter.Write(my_torus, stl_high_resolution_file)
assert os.path.isfile(stl_high_resolution_file)
