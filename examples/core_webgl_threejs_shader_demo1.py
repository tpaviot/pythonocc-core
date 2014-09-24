#!/usr/bin/env python

##Copyright 2009-2013 Thomas Paviot (tpaviot@gmail.com)
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

from OCC.Display.WebGl import threejs_renderer
from OCC.BRepPrimAPI import BRepPrimAPI_MakeTorus

# create box
cube_shp = BRepPrimAPI_MakeTorus(25., 15.).Shape()
# load shaders
vs = open('shaders/pink.vs', 'r').read()
fs = open('shaders/pink.fs', 'r').read()
u = open('shaders/pink.uniforms', 'r').read()
my_renderer = threejs_renderer.ThreejsRenderer(vertex_shader=vs, fragment_shader=fs, uniforms = u)
my_renderer.DisplayShape(cube_shp)
