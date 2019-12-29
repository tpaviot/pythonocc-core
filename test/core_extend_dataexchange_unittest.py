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

import os
import unittest

from OCC.Extend.DataExchange import read_step_file, read_step_file_with_names_colors

STEP_AP203_SAMPLE_FILE = os.path.join('.', 'test_io', 'as1_pe_203.stp')
STEP_AP214_SAMPLE_FILE = os.path.join('.', 'test_io', 'as1-oc-214.stp') 


class TestExtendDataExchange(unittest.TestCase):

    def test_read_step_file(self):
        read_step_file(STEP_AP203_SAMPLE_FILE)
        read_step_file(STEP_AP214_SAMPLE_FILE)


    def test_discretize_wire(self):
        read_step_file_with_names_colors(STEP_AP203_SAMPLE_FILE)
        read_step_file_with_names_colors(STEP_AP214_SAMPLE_FILE)

def suite():
    test_suite = unittest.TestSuite()
    test_suite.addTest(unittest.makeSuite(TestExtendDataExchange))
    return test_suite

if __name__ == "__main__":
    unittest.main()
