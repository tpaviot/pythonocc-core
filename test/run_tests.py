#!/usr/bin/env python

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

import unittest

import core_wrapper_features_unittest
import core_geometry_unittest
import core_visualization_unittest

# Create test suite
suite = unittest.TestSuite()

# Get all test suites from modules
suite1 = core_wrapper_features_unittest.suite()
suite2 = core_geometry_unittest.suite()
suite3 = core_visualization_unittest.suite()
tests = [suite1, suite2, suite3]
# Add test cases
suite.addTests(tests)

# Run test suite
unittest.TextTestRunner(verbosity=2).run(suite)
