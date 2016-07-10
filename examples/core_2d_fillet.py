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

from OCC.gp import gp_Pnt,gp_Dir,gp_Pln
from OCC.Display.SimpleGui import init_display
from OCC.ChFi2d import ChFi2d_AnaFilletAlgo
from OCC.BRepBuilderAPI import BRepBuilderAPI_MakeEdge,BRepBuilderAPI_MakeWire

from core_geometry_utils import make_wire
display,start_display, add_menu,add_functionto_menu = init_display()

# Defining the points
p1 = gp_Pnt(0, 0, 0) 
p2 = gp_Pnt(5, 5, 0)
p3 = gp_Pnt(-5,5, 0)

# Making the edges
ed1 = BRepBuilderAPI_MakeEdge(p3,p2).Edge()
ed2 = BRepBuilderAPI_MakeEdge(p2,p1).Edge()

#Making the 2dFillet
f = ChFi2d_AnaFilletAlgo()
f.Init(ed1,ed2,gp_Pln())
radius = 1.0
f.Perform(radius)
fillet2d = f.Result(ed1,ed2)

# Create and display a wire
w = make_wire([ed1, fillet2d, ed2])
display.DisplayShape(w)
start_display()
