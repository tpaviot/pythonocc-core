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

from __future__ import print_function
# look for all example names
import os
import glob
import sys
import subprocess

all_examples_file_names = glob.glob(os.path.join('..', 'examples', 'core_*.py'))
# some tests have to be excluded from the automatic
# run.
tests_to_exclude = ['core_display_signal_slots.py',
                    'core_visualization_overpaint_viewer.py',
                    'core_display_customize_prs3d.py',
                    'core_visualization_graphic3d_custom_opengl.py',
                    'core_display_quality.py',
                    'core_display_export_to_EF.py',
                    'core_matplotlib_box.py',
                    'core_font_3d_console.py',
                    'core_visualization_camera.py']
# for OSX travis-ci.org, remove tests that take too long
if sys.platform == 'darwin':
    tests_to_exclude.extend(['core_geometry_splinecage.py',  # buggy
                             'core_parallel_slicer.py'])
# remove examples to excludes
for test_name in tests_to_exclude:
    test_fullpath = os.path.join('..', 'examples', test_name)
    if test_fullpath in all_examples_file_names:
        all_examples_file_names.remove(test_fullpath)

nbr_examples = len(all_examples_file_names)
succeed = 0
failed = 0

os.environ["PYTHONOCC_SHUNT_GUI"] = "1"
os.environ["PYTHONOCC_SHUNT_WEB_SERVER"] = "1"

os.chdir(os.path.join('..', 'examples'))
for example in all_examples_file_names:
    print("running %s ..." % example, end="")
    try:
        out = subprocess.check_output([sys.executable, example])
        succeed += 1
        print("[passed]")
    except:
        failed += 1
        print("[failed]")

print("Test examples results :")
print("\t %i/%i tests passed" % (succeed, nbr_examples))

del os.environ["PYTHONOCC_SHUNT_GUI"]
del os.environ["PYTHONOCC_SHUNT_WEB_SERVER"]

if failed > 0:
    raise AssertionError("%i tests failed" % (failed))
