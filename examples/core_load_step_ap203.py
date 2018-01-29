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

from __future__ import print_function

import random
import os
import os.path
import sys

from OCC.Core.STEPControl import STEPControl_Reader
from OCC.Core.IFSelect import IFSelect_RetDone, IFSelect_ItemsByEntity
from OCC.Core.Quantity import Quantity_Color, Quantity_TOC_RGB
from OCC.Display.SimpleGui import init_display

from OCC.Extend.TopologyUtils import TopologyExplorer
from OCC.Extend.DataExchange import read_step_file

def import_as_one_shape(event=None):
    shp = read_step_file(os.path.join('.', 'models', 'as1_pe_203.stp'))
    display.EraseAll()
    display.DisplayShape(shp, update=True)

def import_as_multiple_shapes(event=None):
    compound = read_step_file(os.path.join('.', 'models', 'as1_pe_203.stp'))
    t = TopologyExplorer(compound)
    display.EraseAll()
    for solid in t.solids():
        color = Quantity_Color(random.random(),
                               random.random(),
                               random.random(),
                               Quantity_TOC_RGB)
        display.DisplayColoredShape(solid, color)
    display.FitAll()

def exit(event=None):
    sys.exit()


if __name__ == '__main__':
    display, start_display, add_menu, add_function_to_menu = init_display()
    add_menu('STEP import')
    add_function_to_menu('STEP import', import_as_one_shape)
    add_function_to_menu('STEP import', import_as_multiple_shapes)
    start_display()
