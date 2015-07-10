#! /usr/bin/python

##Copyright 2009-2015 Thomas Paviot (tpaviot@gmail.com)
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

from OCC.BRepPrimAPI import BRepPrimAPI_MakeBox

import pickle

# Create shape
box1 = BRepPrimAPI_MakeBox(10., 10., 10.).Shape()

# Dump shape to a python string
box_dump_string = pickle.dumps(box1)
print("Box (10,10,10) dump:\n", box_dump_string)

# this string can, of course, be saved to a file

#Create another box from the dump
box2 = pickle.loads(box_dump_string)
assert(not box2.IsNull())
print("Box sucessfully loaded.")
