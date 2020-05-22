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

import json
import os
import unittest
from xml.etree import ElementTree as ET

from OCC.Core.BRepPrimAPI import (BRepPrimAPI_MakeBox,
                                  BRepPrimAPI_MakeTorus,
                                  BRepPrimAPI_MakeSphere)
from OCC.Core.Tesselator import ShapeTesselator

from OCC.Extend.DataExchange.STEP import read_step_file

class TestTesselator(unittest.TestCase):
    """ A class for testing tesselation algorithm """
    def test_tesselate_box(self):
        """ 1st test : tesselation of a box """
        a_box = BRepPrimAPI_MakeBox(10, 20, 30).Shape()
        tess = ShapeTesselator(a_box)
        tess.Compute()
        self.assertEqual(tess.ObjGetTriangleCount(), 12)
        self.assertEqual(tess.ObjGetNormalCount(), 24)

    def test_tesselate_torus(self):
        """ 2st test : tesselation of a torus """
        a_torus = BRepPrimAPI_MakeTorus(10, 4).Shape()
        tess = ShapeTesselator(a_torus)
        tess.Compute()
        self.assertGreater(tess.ObjGetTriangleCount(), 100)
        self.assertGreater(tess.ObjGetNormalCount(), 100)

    def test_tesselate_torus_with_edges(self):
        """ 2st test : tesselation of a torus """
        a_torus = BRepPrimAPI_MakeTorus(10, 4).Shape()
        tess = ShapeTesselator(a_torus)
        tess.Compute(compute_edges=True)
        self.assertGreater(tess.ObjGetTriangleCount(), 100)
        self.assertGreater(tess.ObjGetNormalCount(), 100)

    def test_tesselate_torus_with_bad_quality(self):
        """ 2st test : tesselation of a torus """
        a_torus = BRepPrimAPI_MakeTorus(10, 4).Shape()
        tess = ShapeTesselator(a_torus)
        tess.Compute(mesh_quality=40.)
        # since mesh quality is much lower, we should count less vertices and
        # triangles
        self.assertGreater(tess.ObjGetTriangleCount(), 10)
        self.assertLess(tess.ObjGetTriangleCount(), 100)
        self.assertGreater(tess.ObjGetNormalCount(), 10)
        self.assertLess(tess.ObjGetNormalCount(), 100)

    def test_export_to_x3d(self):
        """ 3rd test : export a sphere to X3D file format """
        a_sphere = BRepPrimAPI_MakeSphere(10.).Shape()
        tess = ShapeTesselator(a_sphere)
        tess.Compute()
        tess.ExportShapeToX3D(os.path.join("test_io", "sphere.x3d"))
        self.assertTrue(os.path.exists(os.path.join("test_io", "sphere.x3d")))

    def test_export_to_x3d_TriangleSet(self):
        """ 3rd test : export a sphere to an X3D TriangleSet triangle mesh """
        a_sphere = BRepPrimAPI_MakeBox(10., 10., 10.).Shape()
        sphere_tess = ShapeTesselator(a_sphere)
        sphere_tess.Compute()
        sphere_triangle_set_string = sphere_tess.ExportShapeToX3DTriangleSet()
        self.assertTrue(sphere_triangle_set_string.startswith("<TriangleSet"))
        self.assertTrue("0 10 0" in sphere_triangle_set_string)  # a vertex
        self.assertTrue("0 0 1" in sphere_triangle_set_string)  # a normal

    def test_export_to_3js_JSON(self):
        a_box = BRepPrimAPI_MakeBox(10, 20, 30).Shape()
        tess = ShapeTesselator(a_box)
        tess.Compute()
        # get the JSON string
        JSON_str = tess.ExportShapeToThreejsJSONString("myshapeid")
        # check the python JSON parser can decode the string
        # i.e. the JSON string is well formed
        dico = json.loads(JSON_str)
        # after that, check that the number of vertices is ok
        self.assertEqual(len(dico["data"]["attributes"]["position"]["array"]), 36*3)

    def test_x3d_file_is_valid_xml(self):
        """ use ElementTree to parse X3D output """
        another_torus = BRepPrimAPI_MakeTorus(10, 4).Shape()
        torus_tess = ShapeTesselator(another_torus)
        torus_tess.Compute()
        output_x3d_filename = os.path.join("test_io", "torus.x3d")
        torus_tess.ExportShapeToX3D(output_x3d_filename)
        self.assertTrue(os.path.exists(output_x3d_filename))
        with open(output_x3d_filename, "r") as x3d_file:
            x3d_content = x3d_file.read()
            ET.fromstring(x3d_content)  # raise an exception if not valid xml

    def test_tesselate_STEP_file(self):
        """ loads a step file, tesselate. The as1_pe_203 contains
        free edges"""
        stp_file = os.path.join(os.path.join("test_io", "as1_pe_203.stp"))
        stp_file_shape = read_step_file(stp_file)
        stp_file_tesselator = ShapeTesselator(stp_file_shape)

        # free edges have been excluded, then should work as expected
        stp_file_tesselator.Compute(compute_edges=True)

    def test_tesselate_twice(self):
        """ calling Compte() many times should no raise an exception
        """
        another_torus = BRepPrimAPI_MakeTorus(10, 4).Shape()
        torus_tess = ShapeTesselator(another_torus)
        torus_tess.Compute()
        torus_tess.Compute()


def suite():
    """ builds the test suite """
    test_suite = unittest.TestSuite()
    test_suite.addTest(unittest.makeSuite(TestTesselator))
    return test_suite

if __name__ == '__main__':
    unittest.main()
