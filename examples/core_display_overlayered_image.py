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

from math import pi

from OCC.Core.TCollection import TCollection_AsciiString
from OCC.Core.Addons import TextureItem
from OCC.Display.SimpleGui import init_display

# load the bottle
from core_classic_occ_bottle import bottle

display, start_display, add_menu, add_function_to_menu = init_display()


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
    aTextureItem.SetRelativePosition(30, 60)  # 30% width, 60% width
    display.register_overlay_item(aTextureItem)

if __name__ == "__main__":
    display.DisplayShape(bottle, update=True)
    menu_name = 'overlay images'
    add_menu(menu_name)
    add_function_to_menu(menu_name, absolute_position)
    add_function_to_menu(menu_name, relative_position)
    start_display()