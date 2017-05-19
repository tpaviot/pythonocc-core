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

from OCC.STEPControl import STEPControl_Reader
from OCC.IFSelect import IFSelect_RetDone, IFSelect_ItemsByEntity
from OCC.Quantity import Quantity_Color, Quantity_TOC_RGB
from OCC.Display.SimpleGui import init_display

from core_topology_traverse import Topo

def read_step_file(filename):
    """ read the STEP file and returns a compound
    """
    step_reader = STEPControl_Reader()
    status = step_reader.ReadFile(filename)

    if status == IFSelect_RetDone:  # check status
        failsonly = False
        step_reader.PrintCheckLoad(failsonly, IFSelect_ItemsByEntity)
        step_reader.PrintCheckTransfer(failsonly, IFSelect_ItemsByEntity)

        ok = step_reader.TransferRoot(1)
        _nbs = step_reader.NbShapes()
        aResShape = step_reader.Shape(1)
    else:
        print("Error: can't read file.")
        sys.exit(0)
    return aResShape

def import_as_one_shape(event=None):
    shp = read_step_file(os.path.join('.', 'models', 'as1_pe_203.stp'))
    display.EraseAll()
    display.DisplayShape(shp, update=True)

def import_as_compound(event=None):
    compound = read_step_file(os.path.join('.', 'models', 'as1_pe_203.stp'))
    t = Topo(compound)
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
    add_function_to_menu('STEP import', import_as_compound)
    start_display()
