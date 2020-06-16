#!/usr/bin/env python

##Copyright 2009 Thomas Paviot (tpaviot@gmail.com)
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

import os
import unittest

from OCC.Core.BRepPrimAPI import BRepPrimAPI_MakeTorus
from OCC.Core.TopoDS import TopoDS_Compound

from OCC.Extend.DataExchange import (read_step_file,
                                     read_step_file_with_names_colors,
                                     read_stl_file,
                                     read_iges_file,
                                     write_step_file,
                                     write_stl_file,
                                     write_iges_file,
                                     export_shape_to_svg)


SAMPLES_DIRECTORY = os.path.join('.', 'test_io')

def get_test_fullname(filename):
    return os.path.join(SAMPLES_DIRECTORY, filename)

# the sample files
STEP_AP203_SAMPLE_FILE = get_test_fullname('as1_pe_203.stp')
STEP_AP214_SAMPLE_FILE = get_test_fullname('as1-oc-214.stp')
STEP_MULTIPLE_ROOT = get_test_fullname('stp_multiple_shp_at_root.stp')
IGES_SAMPLE_FILE = get_test_fullname('sunglasses_lens.igs')
STL_ASCII_SAMPLE_FILE = get_test_fullname('bottle_ascii.stl')
STL_BINARY_SAMPLE_FILE = get_test_fullname('cube_binary.stl')

# the basic geometry to test exporters
A_TOPODS_SHAPE = BRepPrimAPI_MakeTorus(200, 50).Shape()

class TestExtendDataExchange(unittest.TestCase):

    def test_read_step_file(self):
        read_step_file(STEP_AP203_SAMPLE_FILE)
        read_step_file(STEP_AP214_SAMPLE_FILE)


    def test_read_step_file_multiple_shape_as_root(self):
        t = read_step_file(STEP_MULTIPLE_ROOT, as_compound=True)
        self.assertTrue(isinstance(t, TopoDS_Compound))

        l = read_step_file(STEP_MULTIPLE_ROOT, as_compound=False)
        self.assertEqual(len(l), 3)


    def test_read_step_file_names_colors(self):
        read_step_file_with_names_colors(STEP_AP203_SAMPLE_FILE)
        read_step_file_with_names_colors(STEP_AP214_SAMPLE_FILE)


    def test_read_iges_file(self):
        read_iges_file(IGES_SAMPLE_FILE)


    def test_read_stl_file(self):
        read_stl_file(STL_ASCII_SAMPLE_FILE)
        read_stl_file(STL_BINARY_SAMPLE_FILE)


    def test_export_shape_to_svg(self):
        export_shape_to_svg(A_TOPODS_SHAPE, get_test_fullname('sample.svg'))


    # def test_write_step_ap203(self):
    #     write_step_file(A_TOPODS_SHAPE,
    #                     get_test_fullname("sample_ap_203.stp"),
    #                     application_protocol="AP203")


    def test_write_step_ap214(self):
        write_step_file(A_TOPODS_SHAPE,
                        get_test_fullname("sample_214.stp"),
                        application_protocol="AP214IS")


    def test_write_step_ap242(self):
        write_step_file(A_TOPODS_SHAPE,
                        get_test_fullname("sample_242.stp"),
                        application_protocol="AP242DIS")


    def test_write_iges(self):
        write_iges_file(A_TOPODS_SHAPE,
                        get_test_fullname("sample.igs"))


    def test_stl_ascii(self):
        write_stl_file(A_TOPODS_SHAPE,
                       get_test_fullname("sample_ascii.stl"),
                       mode="ascii")


    def test_stl_binary(self):
        write_stl_file(A_TOPODS_SHAPE,
                       get_test_fullname("sample_binary.stl"),
                       mode="binary")


def suite():
    test_suite = unittest.TestSuite()
    test_suite.addTest(unittest.makeSuite(TestExtendDataExchange))
    return test_suite

if __name__ == "__main__":
    unittest.main()
