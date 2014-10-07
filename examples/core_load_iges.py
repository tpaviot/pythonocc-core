##Copyright 2010-2014 Thomas Paviot (tpaviot@gmail.com)
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

from OCC.IGESControl import IGESControl_Reader
from OCC.IFSelect import IFSelect_RetDone, IFSelect_ItemsByEntity
from OCC.Display.SimpleGui import init_display

iges_reader = IGESControl_Reader()
status = iges_reader.ReadFile('./models/surf114.igs')

if status == IFSelect_RetDone:  # check status
    failsonly = False
    iges_reader.PrintCheckLoad(failsonly, IFSelect_ItemsByEntity)
    iges_reader.PrintCheckTransfer(failsonly, IFSelect_ItemsByEntity)
    ok = iges_reader.TransferRoots()
    aResShape = iges_reader.Shape(1)
else:
    print("Error: can't read file.")
    sys.exit(0)
display, start_display, add_menu, add_function_to_menu = init_display()
display.DisplayShape(aResShape, update=True)
start_display()
