#!/usr/bin/env python

##Copyright 2020 Thomas Paviot (tpaviot@gmail.com)
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

import math

from OCC.Core.BRepPrimAPI import (
    BRepPrimAPI_MakeBox,
    BRepPrimAPI_MakeSphere,
    BRepPrimAPI_MakeTorus,
)
from OCC.Core.gp import gp_Pnt, gp_Vec

from OCC.Extend.ShapeFactory import (
    midpoint,
    scale_shape,
    measure_shape_volume,
    translate_shp,
    measure_shape_mass_center_of_gravity,
    edge_to_bezier,
)
from OCC.Extend.TopologyUtils import TopologyExplorer

import pytest


def test_midpoint():
    p1 = gp_Pnt(0, 0, 0)
    p2 = gp_Pnt(4, 5, 6)
    p3 = midpoint(p1, p2)
    assert [p3.X(), p3.Y(), p3.Z()] == [2, 2.5, 3.0]


def test_measure_shape_volume():
    # first the colume of a box a,b,c should be a*b*c
    a = 10.0
    b = 23.0
    c = 98.1
    box = BRepPrimAPI_MakeBox(a, b, c).Shape()
    box_volume = measure_shape_volume(box)
    assert box_volume == pytest.approx(box_volume, a * b * c)
    # for a sphere of radius r, it should be 4/3.pi.r^3
    r = 9.8775  # a random radius
    sph = BRepPrimAPI_MakeSphere(r).Shape()
    sph_volume = measure_shape_volume(sph)
    assert sph_volume == pytest.approx(4.0 / 3.0 * math.pi * r**3)


def test_scale_shape():
    box = BRepPrimAPI_MakeBox(10.0, 10.0, 10.0).Shape()
    box2 = scale_shape(box, 2.0, 1.0, 1.0)
    # volume should be double
    box2_volume = measure_shape_volume(box2)
    assert pytest.approx(box2_volume) == 2000.0


def test_measure_shape_center_of_gravity():
    # we compute the cog of a sphere centered at a point P
    # then the cog must be P
    x, y, z = 10.0, 3.0, -2.44  # random values for point P
    radius = 20.0
    vector = gp_Vec(x, y, z)
    sph = translate_shp(BRepPrimAPI_MakeSphere(radius).Shape(), vector)
    cog, mass, mass_property = measure_shape_mass_center_of_gravity(sph)
    assert cog.X() == pytest.approx(x)
    assert cog.Y() == pytest.approx(y)
    assert cog.Z() == pytest.approx(z)
    assert mass == pytest.approx(4 / 3 * math.pi * radius**3)
    assert mass_property == "Volume"


def test_edge_to_bezier():
    b = BRepPrimAPI_MakeTorus(30, 10).Shape()
    t = TopologyExplorer(b)
    for ed in t.edges():
        is_bezier, bezier_curve, degree = edge_to_bezier(ed)
        assert isinstance(is_bezier, bool)
        if not is_bezier:
            assert degree is None
            assert bezier_curve is None
        else:
            assert isinstance(degree, int)
