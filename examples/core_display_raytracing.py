##Copyright 2010-2017 Thomas Paviot (tpaviot@gmail.com)
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

import sys

from OCC.Display.SimpleGui import init_display
from OCC.Core.BRepPrimAPI import BRepPrimAPI_MakeBox, BRepPrimAPI_MakeCone
from OCC.Core.Graphic3d import Graphic3d_NOM_PLASTIC, Graphic3d_NOM_ALUMINIUM
from OCC.Core.V3d import V3d_SpotLight, V3d_COMPLETE, V3d_XnegYnegZpos
from OCC.Core.Quantity import Quantity_NOC_WHITE, Quantity_NOC_CORAL2, Quantity_NOC_BROWN
from OCC.Core.BRepAlgoAPI import BRepAlgoAPI_Cut
from OCC.Core.gp import gp_Vec

from OCC.Extend.ShapeFactory import translate_shp

# first create geometry
from core_classic_occ_bottle import bottle
table = translate_shp(BRepPrimAPI_MakeBox(100, 100, 10).Shape(), gp_Vec(-50, -50, -10))
glass_out = BRepPrimAPI_MakeCone(7, 9, 25).Shape()
glass_in = translate_shp(BRepPrimAPI_MakeCone(7, 9, 25).Shape(), gp_Vec(0., 0., 0.2))
glass = BRepAlgoAPI_Cut(glass_out, glass_in).Shape()
translated_glass = translate_shp(glass, gp_Vec(-30, -30, 0))

# then inits display
display, start_display, add_menu, add_function_to_menu = init_display()

# create one spotlight
spot_light = V3d_SpotLight(display.Viewer_handle, -100, -100, 100,
                           V3d_XnegYnegZpos, Quantity_NOC_WHITE)
## display the spotlight in rasterized mode
spot_light.Display(display.View_handle, V3d_COMPLETE)
display.View.SetLightOn()

display.DisplayShape(bottle, material=Graphic3d_NOM_ALUMINIUM)
display.DisplayShape(table, material=Graphic3d_NOM_PLASTIC, color=Quantity_NOC_CORAL2)
display.DisplayShape(translated_glass,
                     material=Graphic3d_NOM_PLASTIC,
                     color=Quantity_NOC_BROWN,
                     transparency=0.6,
                     update=True)

def raytracing_default_depth(event=None):
    display.SetRaytracingMode()

def raytracing_depth_8(event=None):
    display.SetRaytracingMode(depth=8)
    
def rasterization(event=None):
    display.SetRasterizationMode()

def exit(event=None):
    sys.exit(0)

if __name__ == '__main__':
    add_menu('raytracing')
    add_function_to_menu('raytracing', rasterization)
    add_function_to_menu('raytracing', raytracing_default_depth)
    add_function_to_menu('raytracing', raytracing_depth_8)
    add_function_to_menu('raytracing', exit)
    start_display()
