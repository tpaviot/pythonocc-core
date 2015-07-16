##Copyright 2010-2015 Thomas Paviot (tpaviot@gmail.com)
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
from OCC.BRepPrimAPI import BRepPrimAPI_MakeBox

display, start_display, add_menu, add_function_to_menu = init_display()
my_box = BRepPrimAPI_MakeBox(10., 20., 30.).Shape()

display.DisplayShape(my_box, update=True)

# in order to be able to export to usual file formats
# oce must have been compiled with FreeImage
# otherwise, images will be exported to PPM format


def export_to_BMP(event=None):
    display.View.Dump('./capture_bmp.bmp')


def export_to_PNG(event=None):
    display.View.Dump('./capture_png.png')


def export_to_JPEG(event=None):
    display.View.Dump('./capture_jpeg.jpeg')


def export_to_TIFF(event=None):
    display.View.Dump('./capture_tiff.tiff')


def exit(event=None):
    sys.exit()

if __name__ == '__main__':
    add_menu('screencapture')
    add_function_to_menu('screencapture', export_to_BMP)
    add_function_to_menu('screencapture', export_to_PNG)
    add_function_to_menu('screencapture', export_to_JPEG)
    add_function_to_menu('screencapture', export_to_TIFF)
    add_function_to_menu('screencapture', exit)
    start_display()
