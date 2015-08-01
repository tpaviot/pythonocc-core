##Copyright 2015 Thomas Paviot (tpaviot@gmail.com)
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

from OCC.Display.SimpleGui import init_display
from OCC.BRepPrimAPI import BRepPrimAPI_MakeTorus
from OCC.Graphic3d import (Graphic3d_EF_PDF,
                           Graphic3d_EF_SVG,
                           Graphic3d_EF_TEX,
                           Graphic3d_EF_PostScript,
                           Graphic3d_EF_EnhPostScript)

display, start_display, add_menu, add_function_to_menu = init_display()
my_box = BRepPrimAPI_MakeTorus(40., 20.).Shape()

display.DisplayShape(my_box, update=True)
f = display.View.View().GetObject()

#-------------------------------------------------------------------------------
# for this example to work, pythonocc / OCE needs to be built with the gl2ps lib
#-------------------------------------------------------------------------------

def export_to_PDF(event=None):
    f.Export('torus_export.pdf', Graphic3d_EF_PDF)


def export_to_SVG(event=None):
    f.Export('torus_export.svg', Graphic3d_EF_SVG)


def export_to_PS(event=None):
    f.Export('torus_export.ps', Graphic3d_EF_PostScript)


def export_to_EnhPS(event=None):
    f.Export('torus_export_enh.ps', Graphic3d_EF_EnhPostScript)


def export_to_TEX(event=None):
    f.Export('torus_export.tex', Graphic3d_EF_TEX)


if __name__ == '__main__':
    add_menu('screencapture')
    add_function_to_menu('screencapture', export_to_PDF)
    add_function_to_menu('screencapture', export_to_SVG)
    add_function_to_menu('screencapture', export_to_PS)
    add_function_to_menu('screencapture', export_to_EnhPS)
    add_function_to_menu('screencapture', export_to_TEX)
    start_display()
