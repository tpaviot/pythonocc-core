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

import sys
import random
from math import pi

from OCC.Display.SimpleGui import init_display
from OCC.BRepPrimAPI import BRepPrimAPI_MakeBox
from OCC.Visual3d import Visual3d_Layer, Visual3d_LayerItem
from OCC.V3d import V3d_LayerMgr
from OCC.Aspect import (Aspect_TODT_NORMAL, Aspect_TODT_SUBTITLE,
                        Aspect_TODT_DEKALE, Aspect_TODT_BLEND, Aspect_TODT_DIMENSION)

from OCC.Quantity import (Quantity_Color, Quantity_NOC_BLACK,
                         Quantity_NOC_WHITE, Quantity_NOC_ORANGE)
from OCC.TCollection import TCollection_AsciiString
from OCC.gp import gp_Ax1, gp_Pnt, gp_Dir, gp_Trsf
from OCC.TopLoc import TopLoc_Location
from OCC.Addons import TextureItem

display, start_display, add_menu, add_function_to_menu = init_display()

# load the bottle
from core_classic_occ_bottle import bottle

def absolute_position(event=None):
    # create a texture
    aTextureItem = TextureItem(TCollection_AsciiString("./images/carre-200.png"),
                               display.GetView().GetObject(),
                               display.GetOverLayer())
    aTextureItem.SetAbsolutePosition(50, 50)
    display.register_overlay_item(aTextureItem)


def relative_position(event=None):
    # create a texture
    aTextureItem = TextureItem(TCollection_AsciiString("./images/carre-200.png"),
                               display.GetView().GetObject(),
                               display.GetOverLayer())
    aTextureItem.SetRelativePosition(0.8, 0.8)  # 80%, bottom right
    display.register_overlay_item(aTextureItem)

if __name__ == "__main__":
    display.DisplayShape(bottle, update = True)
    menu_name = 'overlay images'
    add_menu(menu_name)
    add_function_to_menu(menu_name, absolute_position)
    add_function_to_menu(menu_name, relative_position)
    start_display()