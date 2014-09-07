##Copyright 2009-2013 Thomas Paviot (tpaviot@gmail.com)
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

""" This module provides unittests for the visualization wrapper
Usage :
$ python core_visualization_unittest.python """

from OCC.Visualization import Tesselator, atNormal
from OCC.BRepPrimAPI import BRepPrimAPI_MakeBox, BRepPrimAPI_MakeTorus

import unittest


class TestTesselator(unittest.TestCase):
    """ A class for testing tesselation algorithm """
    def test_tesselate_box(self):
        """ 1st test : tesselation of a box """
        a_box = BRepPrimAPI_MakeBox(10, 20, 30).Shape()
        tess = Tesselator(a_box, atNormal, 1.0, 1, 0.01, 0.1, 0.1, 0.1, 0.1,
                          0.1, 0.1, 0.)
        self.assert_(tess.ObjGetTriangleCount() == 12)
        self.assert_(tess.ObjGetNormalCount() == 24)

    def test_tesselate_torus(self):
        """ 2st test : tesselation of a torus """
        a_box = BRepPrimAPI_MakeTorus(10, 4).Shape()
        tess = Tesselator(a_box, atNormal, 1.0, 1, 0.01, 0.1, 0.1, 0.1, 0.1,
                          0.1, 0.1, 0.)
        self.assert_(tess.ObjGetTriangleCount() > 100)
        self.assert_(tess.ObjGetNormalCount() > 100)


def suite():
    """ builds the test suite """
    test_suite = unittest.TestSuite()
    test_suite.addTest(unittest.makeSuite(TestTesselator))
    return test_suite

if __name__ == '__main__':
    unittest.main()
