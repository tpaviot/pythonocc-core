##Copyright 2016 Jelle Feringa (jelleferinga@gmail.com)
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


from OCC.AIS import AIS_Shape
from OCC.BRepPrimAPI import BRepPrimAPI_MakeSphere
from OCC.Display.SimpleGui import init_display
from OCC.Graphic3d import (Graphic3d_ShaderProgram, Graphic3d_TOS_VERTEX, Graphic3d_TOS_FRAGMENT,
                           Graphic3d_ShaderObject)
from OCC.TCollection import TCollection_AsciiString

display, start_display, add_menu, add_function_to_menu = init_display()

shape = BRepPrimAPI_MakeSphere(100).Shape()
anIO = AIS_Shape(shape)
display.Context.Display(anIO.GetHandle())

# gragment shader
fs = """
void main(void)
{
    gl_FragColor=vec4(0.0, 1.0, 0, 1.0);
}
"""

# vertex shader
vs = """
void main()
{
    gl_Position = occProjectionMatrix * occWorldViewMatrix * occModelWorldMatrix * occVertex;
}
"""

# construct the shader, load, compile and attach the GLSL programs
vs_shader = Graphic3d_ShaderObject.CreateFromSource(Graphic3d_TOS_VERTEX, TCollection_AsciiString(vs))
fs_shader = Graphic3d_ShaderObject.CreateFromSource(Graphic3d_TOS_FRAGMENT, TCollection_AsciiString(fs))
aProgram = Graphic3d_ShaderProgram()
aProgram.AttachShader(fs_shader)
aProgram.AttachShader(vs_shader)

# attach the shader to the AIS_Shape representation that renders the sphere
aspect = anIO.Attributes().GetObject().ShadingAspect().GetObject().Aspect().GetObject()

if aProgram.IsDone():
    aspect.SetShaderProgram(aProgram.GetHandle())
else:
    raise AssertionError("no valid shader program found")

# when a shader fails to compile, raise an AssertionError
assert not aspect.ShaderProgram().IsNull(), "no shader program is null"

# redisplay the sphere, when the shader was attached to its AIS_Shape aspect
display.Context.Redisplay(anIO.GetHandle())
display.FitAll()
start_display()
