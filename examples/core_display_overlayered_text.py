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

import random
from math import pi

from OCC.Core.BRepPrimAPI import BRepPrimAPI_MakeBox
from OCC.Core.Aspect import Aspect_TODT_NORMAL, Aspect_TODT_DEKALE 
from OCC.Core.Quantity import Quantity_Color, Quantity_NOC_BLACK, Quantity_NOC_ORANGE
from OCC.Core.TCollection import TCollection_AsciiString
from OCC.Core.gp import gp_Ax1, gp_Pnt, gp_Dir, gp_Trsf
from OCC.Core.TopLoc import TopLoc_Location
from OCC.Core.Addons import TextItem

from OCC.Display.SimpleGui import init_display


# load the bottle
from core_classic_occ_bottle import bottle

display, start_display, add_menu, add_function_to_menu = init_display()
mybox = BRepPrimAPI_MakeBox(10, 10, 10).Shape()


def rotate_shp(ais_shp):
    ax1 = gp_Ax1(gp_Pnt(0., 0., 0.), gp_Dir(0., 0., 1.))
    aCubeTrsf = gp_Trsf()
    angle = 0.0
    #tA = time.time()
    n_rotations = 200
    for i in range(n_rotations):
        aCubeTrsf.SetRotation(ax1, angle)
        aCubeToploc = TopLoc_Location(aCubeTrsf)
        display.Context.SetLocation(ais_shp, aCubeToploc)
        display.Context.UpdateCurrentViewer()
        angle += 2*pi / n_rotations
#     print("%i rotations took %f" % (n_rotations, time.time() - tA))
# In the followin, display type should be either:
# Aspect_TODT_NORMAL,
# Aspect_TODT_SUBTITLE,
# Aspect_TODT_DEKALE,
# Aspect_TODT_BLEND,
# Aspect_TODT_DIMENSION,

def draw_simple_text(x, y, text_str):
    str_to_display = TCollection_AsciiString(text_str)
    height = 30
    font_name = TCollection_AsciiString("Courier")
    display_type = Aspect_TODT_NORMAL
    text_color = Quantity_Color(Quantity_NOC_BLACK)
    subtitle_color = Quantity_Color(Quantity_NOC_BLACK)
    aTextItem = TextItem(str_to_display, x, y, height, font_name,
                         text_color, subtitle_color, display_type,
                         display.GetOverLayer())
    display.register_overlay_item(aTextItem)


def add_scrolled_text(event=None):
    str_to_display = TCollection_AsciiString("Pythonocc Rocks!!")
    x1 = 1024 / 2
    y1 = 768 / 2
    height = 30
    font_name = TCollection_AsciiString("Arial")
    display_type = Aspect_TODT_DEKALE
    text_color = Quantity_Color(Quantity_NOC_ORANGE)
    subtitle_color = Quantity_Color(Quantity_NOC_BLACK)
    aTextItem = TextItem(str_to_display, x1, y1, height, font_name,
                         text_color, subtitle_color, display_type,
                         display.GetOverLayer(),
                         ScrollX=random.random()-0.5,
                         ScrollY=random.random()-0.5)
    display.register_overlay_item(aTextItem)
    rotate_shp(ais_bottle)

if __name__ == '__main__':
    ais_bottle = display.DisplayShape(bottle, update=True)
    draw_simple_text(300, 50, "Overlayed text example")
    add_menu('draw text')
    add_function_to_menu('draw text', add_scrolled_text)
    display.DisplayShape(mybox, update=True)
    start_display()
