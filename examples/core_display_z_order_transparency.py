import sys
import time

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

from OCC.BRepBuilderAPI import BRepBuilderAPI_MakeFace, BRepBuilderAPI_Transform
from OCC.BRepPrimAPI import BRepPrimAPI_MakeBox, BRepPrimAPI_MakeWedge, BRepPrimAPI_MakeSphere, BRepPrimAPI_MakeTorus
from OCC.Display.SimpleGui import init_display
from OCC.gp import gp_Vec, gp_Ax2, gp_Pnt, gp_Dir, gp_Pln, gp_Trsf

from core_geometry_utils import translate_shp

display, start_display, add_menu, add_function_to_menu = init_display()

# Create Box
box = BRepPrimAPI_MakeBox(200, 60, 60).Shape()
# Create Sphere
sphere = BRepPrimAPI_MakeSphere(gp_Pnt(100, 20, 20), 80).Shape()
# move the sphere
moved_sphere = translate_shp(sphere, gp_Vec(0., -200., 0.))

ais_box = display.DisplayShape(box)
display.Context.SetTransparency(ais_box, 0.1)
ais_sphere = display.DisplayColoredShape(moved_sphere, color="BLUE")
display.Context.SetTransparency(ais_sphere, 0.9)
display.FitAll()
start_display()
