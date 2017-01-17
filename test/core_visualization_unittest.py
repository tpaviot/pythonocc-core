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

""" This module provides unittests for the visualization wrapper
Usage :
$ python core_visualization_unittest.python """

import os
import unittest
import json

from OCC.Visualization import Tesselator, atNormal
from OCC.BRepPrimAPI import BRepPrimAPI_MakeBox, BRepPrimAPI_MakeTorus, BRepPrimAPI_MakeSphere


class TestTesselator(unittest.TestCase):
    """ A class for testing tesselation algorithm """
    def test_tesselate_box(self):
        """ 1st test : tesselation of a box """
        a_box = BRepPrimAPI_MakeBox(10, 20, 30).Shape()
        tess = Tesselator(a_box, atNormal, 1.0, 1, 0.01, 0.1, 0.1, 0.1, 0.1,
                          0.1, 0.1, 0.)
        tess.Compute()
        self.assert_(tess.ObjGetTriangleCount() == 12)
        self.assert_(tess.ObjGetNormalCount() == 24)

    def test_tesselate_torus(self):
        """ 2st test : tesselation of a torus """
        a_torus = BRepPrimAPI_MakeTorus(10, 4).Shape()
        tess = Tesselator(a_torus, atNormal, 1.0, 1, 0.01, 0.1, 0.1, 0.1, 0.1,
                          0.1, 0.1, 0.)
        tess.Compute()
        self.assert_(tess.ObjGetTriangleCount() > 100)
        self.assert_(tess.ObjGetNormalCount() > 100)

    def test_tesselate_torus_with_edges(self):
        """ 2st test : tesselation of a torus """
        a_torus = BRepPrimAPI_MakeTorus(10, 4).Shape()
        tess = Tesselator(a_torus, atNormal, 1.0, 1, 0.01, 0.1, 0.1, 0.1, 0.1,
                          0.1, 0.1, 0.)
        tess.Compute(compute_edges=True)
        self.assert_(tess.ObjGetTriangleCount() > 100)
        self.assert_(tess.ObjGetNormalCount() > 100)

    def test_tesselate_torus_with_bad_quality(self):
        """ 2st test : tesselation of a torus """
        a_torus = BRepPrimAPI_MakeTorus(10, 4).Shape()
        tess = Tesselator(a_torus, atNormal, 1.0, 1, 0.01, 0.1, 0.1, 0.1, 0.1,
                          0.1, 0.1, 0.)
        tess.Compute(mesh_quality=40.)
        # since mesh quality is much lower, we should count less vertices and
        # triangles
        self.assert_(tess.ObjGetTriangleCount() > 10)
        self.assert_(tess.ObjGetTriangleCount() < 100)
        self.assert_(tess.ObjGetNormalCount() > 10)
        self.assert_(tess.ObjGetNormalCount() < 100)

    def test_export_to_x3d(self):
        """ 3rd test : export a sphere to X3D file format """
        a_sphere = BRepPrimAPI_MakeSphere(10.).Shape()
        tess = Tesselator(a_sphere)
        tess.Compute()
        tess.ExportShapeToX3D(os.path.join("test_io", "sphere.x3d"))
        self.assert_(os.path.exists(os.path.join("test_io", "sphere.x3d")))

    def test_export_to_x3d_TriangleSet(self):
        """ 3rd test : export a sphere to an X3D TriangleSet triangle mesh """
        a_sphere = BRepPrimAPI_MakeBox(10., 10., 10.).Shape()
        tess = Tesselator(a_sphere)
        tess.Compute()
        ifs = tess.ExportShapeToX3DIndexedFaceSet()
        self.assert_(ifs.startswith("<TriangleSet"))
        self.assert_("0 10 0" in ifs)  # a vertex
        self.assert_("0 0 1" in ifs)  # a normal

    def test_export_to_3js_JSON(self):
        a_box = BRepPrimAPI_MakeBox(10, 20, 30).Shape()
        tess = Tesselator(a_box)
        tess.Compute()
        # get the JSON string
        JSON_str = tess.ExportShapeToThreejsJSONString("myshapeid")
        # check the python JSON parser can decode the string
        # i.e. the JSON string is well formed
        dico = json.loads(JSON_str)
        # after that, check that the number of vertices is ok
        assert len(dico["data"]["attributes"]["position"]["array"]) == 36*3


def suite():
    """ builds the test suite """
    test_suite = unittest.TestSuite()
    test_suite.addTest(unittest.makeSuite(TestTesselator))
    return test_suite

if __name__ == '__main__':
    unittest.main()
