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

from __future__ import print_function

import sys

from OCC.gp import gp_Pln, gp_Vec
from OCC.Graphic3d import Graphic3d_ClipPlane
from OCC.Quantity import Quantity_Color, Quantity_TOC_RGB
from OCC.BRepTools import breptools_Read
from OCC.TopoDS import TopoDS_Shape
from OCC.BRep import BRep_Builder
from OCC.Display.SimpleGui import init_display
display, start_display, add_menu, add_function_to_menu = init_display()



cylinder_head = TopoDS_Shape()
builder = BRep_Builder()
breptools_Read(cylinder_head, './models/cylinder_head.brep', builder)

ais_shp = display.DisplayShape(cylinder_head).GetObject()

# clip plane number one, by default xOy
clip_plane_1 = Graphic3d_ClipPlane()

# set hatch on
clip_plane_1.SetCapping(True)
clip_plane_1.SetCappingHatch(True)

# off by default, user will have to enable it
clip_plane_1.SetOn(False)

# set clip plane color
aMat = clip_plane_1.CappingMaterial()
aColor = Quantity_Color (0.5, 0.6, 0.7, Quantity_TOC_RGB)
aMat.SetAmbientColor (aColor)
aMat.SetDiffuseColor (aColor)
clip_plane_1.SetCappingMaterial(aMat)
ais_shp.AddClipPlane(clip_plane_1.GetHandle())


def enable_clip_plane(event=None):
    clip_plane_1.SetOn(True)
    display.Context.UpdateCurrentViewer()


def disable_clip_plane(event=None):
    clip_plane_1.SetOn(False)
    display.Context.UpdateCurrentViewer()


def animate_translate_clip_plane(event=None):
    plane_definition = clip_plane_1.ToPlane()  # it's a gp_Pln
    h = 0.2
    for i in range(100):
        plane_definition.Translate(gp_Vec(0., 0., h))
        clip_plane_1.SetEquation(plane_definition)
        display.Context.UpdateCurrentViewer()


def exit(event=None):
    sys.exit()


if __name__ == '__main__':
    add_menu('clip plane')
    add_function_to_menu('clip plane', enable_clip_plane)
    add_function_to_menu('clip plane', disable_clip_plane)
    add_function_to_menu('clip plane', animate_translate_clip_plane)
    display.FitAll()
    start_display()
