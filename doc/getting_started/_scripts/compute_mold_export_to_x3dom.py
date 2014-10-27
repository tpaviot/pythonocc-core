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

from OCC.STEPControl import STEPControl_Reader
from OCC.BRepAlgoAPI import BRepAlgoAPI_Cut
from OCC.BRepPrimAPI import BRepPrimAPI_MakeBox
from OCC.gp import gp_Vec, gp_Trsf
from OCC.BRepBuilderAPI import BRepBuilderAPI_Transform
from OCC.Display.WebGl import x3dom_renderer

# loads file
step_reader = STEPControl_Reader()
step_reader.ReadFile('../_models/cylinder_block_mold_model.stp')
step_reader.TransferRoot()
block_cylinder_shape = step_reader.Shape()

# create box
box = BRepPrimAPI_MakeBox(30, 90, 90).Shape()
trns = gp_Trsf()
trns.SetTranslation(gp_Vec(0, -35, -35))
mold_basis = BRepBuilderAPI_Transform(box, trns).Shape()

# compute mold print
mold = BRepAlgoAPI_Cut(mold_basis, block_cylinder_shape).Shape()

# export to X3D
my_webgl_renderer = x3dom_renderer.X3DomRenderer()
my_webgl_renderer.DisplayShape(mold)
