#!/usr/bin/env python

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

from OCC.gp import gp_Pnt
from OCC.BRepBuilderAPI import (BRepBuilderAPI_MakeEdge,
                                BRepBuilderAPI_MakeWire,
                                BRepBuilderAPI_MakeFace,
                                BRepBuilderAPI_Sewing)
from OCC.Display.SimpleGui import init_display

# create vertices
v1 = gp_Pnt(1, 0, 0)
v2 = gp_Pnt(0, 1, 0)
v3 = gp_Pnt(0, 0, 1)
v4 = gp_Pnt(0, 0, 0)

# create edges
e0 = BRepBuilderAPI_MakeEdge(v1, v4).Edge()
e1 = BRepBuilderAPI_MakeEdge(v4, v2).Edge()
e2 = BRepBuilderAPI_MakeEdge(v4, v3).Edge()
e3 = BRepBuilderAPI_MakeEdge(v2, v1).Edge()
e4 = BRepBuilderAPI_MakeEdge(v3, v2).Edge()
e5 = BRepBuilderAPI_MakeEdge(v3, v1).Edge()

# create wires
w0 = BRepBuilderAPI_MakeWire(e5, e3, e4).Wire()
w1 = BRepBuilderAPI_MakeWire(e1, e3, e0).Wire()
w2 = BRepBuilderAPI_MakeWire(e0, e5, e2).Wire()
w3 = BRepBuilderAPI_MakeWire(e2, e4, e1).Wire()

# then create faces
f0 = BRepBuilderAPI_MakeFace(w0).Face()
f1 = BRepBuilderAPI_MakeFace(w1).Face()
f2 = BRepBuilderAPI_MakeFace(w2).Face()
f3 = BRepBuilderAPI_MakeFace(w3).Face()

# sew the faces together to create a shell
sew = BRepBuilderAPI_Sewing()
sew.Add(f0)
sew.Add(f1)
sew.Add(f2)
sew.Add(f3)
sew.Perform()
tetrahedron_shell = sew.SewedShape()

# display the result
display, start_display, add_menu, add_function_to_menu = init_display()

display.DisplayShape(tetrahedron_shell, update=True)
start_display()
