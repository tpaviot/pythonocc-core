#!/usr/bin/env python

##Copyright 2009-2016 Thomas Paviot (tpaviot@gmail.com)
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

from OCC.Core.BRepPrimAPI import BRepPrimAPI_MakeBox
from OCC.Core.BRepBuilderAPI import (
    BRepBuilderAPI_MakeEdge,
    BRepBuilderAPI_Sewing,
)
from OCC.Core.gp import gp_Dir, gp_Pnt

import pytest


def test_standard_out_of_range() -> None:
    """asserts that handling of OCC exceptions is handled correctly caught
    Standard_OutOfRange mapped to IndexError
    """
    with pytest.raises(IndexError):
        gp_Dir(0, 0, 1).Coord(-1)

    with pytest.raises(IndexError):
        BRepBuilderAPI_Sewing().FreeEdge(-1)


def test_standard_fail_not_done() -> None:
    with pytest.raises(RuntimeError):
        BRepBuilderAPI_MakeEdge(gp_Pnt(0, 0, 0), gp_Pnt(0, 0, 0)).Edge()


def test_standard_domain() -> None:
    with pytest.raises(ValueError):
        BRepPrimAPI_MakeBox(0, 0, 0).Shape()
