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

# -------------------------------------------------------------------------------
# Example for attaching GLSL shaders to shapes
# GLSL stands for OpenGL Shader Language
# Find out more about GLSL here: http://www.lighthouse3d.com/opengl/glsl/
# -------------------------------------------------------------------------------

import glob
import os
import sys
import time

from OCC.AIS import AIS_Shape
from OCC.BRepPrimAPI import BRepPrimAPI_MakeSphere
from OCC.Display.SimpleGui import init_display
from OCC.Graphic3d import (Graphic3d_ShaderProgram, Graphic3d_TOS_VERTEX, Graphic3d_TOS_FRAGMENT,
                           Graphic3d_ShaderObject)
from OCC.IFSelect import IFSelect_RetDone, IFSelect_ItemsByEntity
from OCC.STEPControl import STEPControl_Reader
from OCC.TCollection import TCollection_AsciiString

display, start_display, add_menu, add_function_to_menu = init_display()

shape = BRepPrimAPI_MakeSphere(100).Shape()

anIO = AIS_Shape(shape)
display.Context.Display(anIO.GetHandle())

shader_dir = "/Users/jelleferinga/GIT/oce/src/Shaders"

# look for the shaders stored in the shader folder...
# only a single vertex (vs) and fragment (fs) shader for the moment
_phong_vs = glob.glob(os.path.join(shader_dir, "*.vs"))[0]  # PhongShading.vs
_phong_fs = glob.glob(os.path.join(shader_dir, "*.fs"))[0]  # PhongShading.fs

# construct TCollection_AsciiString from string
# fs = TCollection_AsciiString(_phong_fs)
# vs = TCollection_AsciiString(_phong_vs)
fs = TCollection_AsciiString("/Users/jelleferinga/GIT/pythonocc-core/examples/shaders/phong.fs.glsl")
vs = TCollection_AsciiString("/Users/jelleferinga/GIT/pythonocc-core/examples/shaders/phong.vs.glsl")
# fs = TCollection_AsciiString("/Users/jelleferinga/miniconda/envs/_test/share/oce-0.18-dev/src/Shaders/RaytraceSmooth.fs")
# vs=TCollection_AsciiString("/Users/jelleferinga/miniconda/envs/_test/share/oce-0.18-dev/src/Shaders/RaytraceRender.vs")

# construct the shader, load, compile and attach the GLSL programs
aProgram = Graphic3d_ShaderProgram()
fs_shader = Graphic3d_ShaderObject.CreateFromFile(Graphic3d_TOS_FRAGMENT, fs)
aProgram.AttachShader(fs_shader)
aProgram.AttachShader(Graphic3d_ShaderObject.CreateFromFile(Graphic3d_TOS_VERTEX, vs))

# >>> aProgram.Variables()
# Out[2]: <Swig Object of type 'NCollection_Sequence< Handle_Graphic3d_ShaderVariable > *' at 0x1158bc330>
# >>> aProgram.Variables().GetObject()



# attach the shader to the AIS_Shape representation that renders the sphere
aspect = anIO.Attributes().GetObject().ShadingAspect().GetObject().aspect().GetObject()
# aspect.SetShaderProgram(aspect.ShaderProgram())

# type(aspect.ShaderProgram())
# Out[76]: SwigPyObject


display.Context.Redisplay(anIO.GetHandle())
display.FitAll()

print "ref count ", aProgram.GetRefCount()
start_display()
