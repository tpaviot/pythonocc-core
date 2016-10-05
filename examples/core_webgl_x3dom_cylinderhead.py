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
from OCC.BRep import BRep_Builder
from OCC.TopoDS import TopoDS_Shape
from OCC.BRepTools import breptools_Read

# loads brep shape
cylinder_head = TopoDS_Shape()
builder = BRep_Builder()
breptools_Read(cylinder_head, './models/cylinder_head.brep', builder)

# render cylinder head in x3dom
my_renderer = x3dom_renderer.X3DomRenderer()
my_renderer.DisplayShape(cylinder_head)
my_renderer.render()
