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

#-------------------------------------------------------------------------------
# Example for attaching GLSL shaders to shapes
#-------------------------------------------------------------------------------

import os
from OCC.Display.SimpleGui import init_display
from OCC.BRepPrimAPI import BRepPrimAPI_MakeSphere
from OCC.Graphic3d import Graphic3d_ShaderProgram, Graphic3d_TOS_VERTEX, Graphic3d_TOS_FRAGMENT, Graphic3d_ShaderObject
from OCC.TCollection import TCollection_AsciiString

display, start_display, add_menu, add_function_to_menu = init_display()
my_box = BRepPrimAPI_MakeSphere(20.).Shape()

anIO = display.DisplayShape(my_box, update=True)
_phong_vs = "/Users/jelleferinga/miniconda/share/oce-0.16/src/Shaders/PhongShading.vs"
_phong_fs = "/Users/jelleferinga/miniconda/share/oce-0.16/src/Shaders/PhongShading.fs"

assert os.path.isfile(_phong_fs) and os.path.isfile(_phong_vs), "missing shader programs: {0} or {1}".format(_phong_fs, _phong_vs)

phong_fs = TCollection_AsciiString(_phong_fs)
phong_vs = TCollection_AsciiString(_phong_vs)

aProgram = Graphic3d_ShaderProgram()
aProgram.AttachShader(Graphic3d_ShaderObject.CreateFromFile(Graphic3d_TOS_FRAGMENT, phong_fs ) )
aProgram.AttachShader(Graphic3d_ShaderObject.CreateFromFile(Graphic3d_TOS_VERTEX, phong_vs ) )

aspect = anIO.GetObject().Attributes().GetObject().ShadingAspect().GetObject().aspect().GetObject()
h_aProgram = aspect.ShaderProgram() # returns a Graphic3d_ShaderProgram_Handle

#-------------------------------------------------------------------------------
# h_aProgram -> Graphic3d_ShaderProgram_Handle cannot be cast to a Graphic3d_ShaderProgram
# aProgram has not method .GetHandle...
# aspect.SetShader requires a `Graphic3d_ShaderProgram_Handle` instance
#-------------------------------------------------------------------------------

aspect.SetShaderProgram(aspect.ShaderProgram())

display.Context.Redisplay(anIO)
# type(aspect.ShaderProgram())
# Out[76]: SwigPyObject

start_display()
