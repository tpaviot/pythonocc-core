#!/usr/bin/env python

##Copyright 2009-2014 Thomas Paviot (tpaviot@gmail.com)
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

from OCC.Display.WebGl import x3dom_renderer
from OCC.BRepPrimAPI import BRepPrimAPI_MakeBox

box_shp = BRepPrimAPI_MakeBox(10., 20., 30.).Shape()

# render cylinder head in x3dom
my_renderer = x3dom_renderer.X3DomRenderer()
# display with one esh (Shape node) per face
my_renderer.DisplayShape(box_shp, map_faces_to_mesh=True)
