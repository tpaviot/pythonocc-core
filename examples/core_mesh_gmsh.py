#! /usr/bin/python

##Copyright 2018 Thomas Paviot (tpaviot@gmail.com)
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

from __future__ import print_function

import os
import sys

from OCC.BRepPrimAPI import BRepPrimAPI_MakeBox, BRepPrimAPI_MakeTorus
from OCC.Display.SimpleGui import init_display
from OCC.StlAPI import StlAPI_Reader
from OCC.TopoDS import TopoDS_Shape
from OCC.BRepTools import breptools_Write

    
def mesh_shape(a_topods_shape):
    """ Takes a BRep filename (extension .brep) and returns
    a topods_shp ready to be displayed
    """
    # dump the geometry to a brep file
    breptools_Write(a_topods_shape, "shape.brep")

    # create the gmesh file
    gmsh_geo_file_content = """SetFactory("OpenCASCADE");

    Mesh.CharacteristicLengthMin = 1;
    Mesh.CharacteristicLengthMax = 5;

    a() = ShapeFromFile("shape.brep");
    """
    gmsh_geo_file = open("shape.geo", "w")
    gmsh_geo_file.write(gmsh_geo_file_content)
    gmsh_geo_file.close()

    # call gmsh
    gmsh_success = os.system("gmsh shape.geo -2 -o shape.stl -format stl")
    # load the stl file
    if gmsh_success != 0 and os.path.isfile("shape.stl") :
        stl_reader = StlAPI_Reader()
        mesh_shp = TopoDS_Shape()
        stl_reader.Read(mesh_shp, "shape.stl")
        return mesh_shp
    else:
        print("Be sure gmsh is in your PATH")
        sys.exit()

# First example, a simple torus
torus_shp = BRepPrimAPI_MakeTorus(40., 10.).Shape()
torus_mesh_shp = mesh_shape(torus_shp)

display, start_display, add_menu, add_function_to_menu = init_display()
display.DisplayShape(torus_mesh_shp, update=True)
start_display()
