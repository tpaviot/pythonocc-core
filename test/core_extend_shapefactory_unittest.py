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
import unittest

from OCC.Core.BRepPrimAPI import (BRepPrimAPI_MakeBox, BRepPrimAPI_MakeSphere,
                                  BRepPrimAPI_MakeTorus)
from OCC.Core.gp import gp_Pnt, gp_Vec

from OCC.Extend.ShapeFactory import (midpoint, scale_shape, measure_shape_volume,
                                     translate_shp, measure_shape_mass_center_of_gravity,
                                     edge_to_bezier)
from OCC.Extend.TopologyUtils import TopologyExplorer


class TestExtendShapeFactory(unittest.TestCase):


    def test_midpoint(self):
        p1 = gp_Pnt(0, 0, 0)
        p2 = gp_Pnt(4, 5, 6)
        p3 = midpoint(p1, p2)
        self.assertEqual([p3.X(), p3.Y(), p3.Z()], [2, 2.5, 3.])


    def test_measure_shape_volume(self):
        # first the colume of a box a,b,c should be a*b*c
        a = 10.
        b = 23.
        c = 98.1
        box = BRepPrimAPI_MakeBox(a, b, c).Shape()
        box_volume = measure_shape_volume(box)
        self.assertAlmostEqual(box_volume, a * b * c, places=6)
        # for a sphere of radius r, it should be 4/3.pi.r^3
        r = 9.8775  # a random radius
        sph = BRepPrimAPI_MakeSphere(r).Shape()
        sph_volume = measure_shape_volume(sph)
        self.assertAlmostEqual(sph_volume, 4./3. * math.pi * r ** 3, places=6)


    def test_scale_shape(self):
        box = BRepPrimAPI_MakeBox(10., 10., 10.).Shape()
        box2 = scale_shape(box, 2.0, 1.0, 1.0)
        # volume should be double
        box2_volume = measure_shape_volume(box2)
        self.assertAlmostEqual(box2_volume, 2000., places=6)


    def test_measure_shape_center_of_gravity(self):
        # we compute the cog of a sphere centered at a point P
        # then the cog must be P
        x, y, z = 10., 3., -2.44  # random values for point P
        radius = 20.
        vector = gp_Vec(x, y, z)
        sph = translate_shp(BRepPrimAPI_MakeSphere(radius).Shape(), vector)
        cog, mass, mass_property = measure_shape_mass_center_of_gravity(sph)
        self.assertAlmostEqual(cog.X(), x, places=6)
        self.assertAlmostEqual(cog.Y(), y, places=6)
        self.assertAlmostEqual(cog.Z(), z, places=6)
        self.assertAlmostEqual(mass, 4 / 3 * math.pi * radius ** 3, places=6)
        self.assertEqual(mass_property, "Volume")


    def test_edge_to_bezier(self):
        b = BRepPrimAPI_MakeTorus(30, 10).Shape()
        t = TopologyExplorer(b)
        for ed in t.edges():
            is_bezier, bezier_curve, degree = edge_to_bezier(ed)
            self.assertTrue(isinstance(is_bezier, bool))
            if not is_bezier:
                self.assertTrue(degree is None)
                self.assertTrue(bezier_curve is None)
            else:
                self.assertTrue(isinstance(degree, int))

def suite():
    test_suite = unittest.TestSuite()
    test_suite.addTest(unittest.makeSuite(TestExtendShapeFactory))
    return test_suite

if __name__ == "__main__":
    unittest.main()
