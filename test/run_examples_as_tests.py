#!/usr/bin/env python

##Copyright 2009-2017 Thomas Paviot (tpaviot@gmail.com)
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
import multiprocessing as mp
import time
try:
    from threading import TIMEOUT_MAX
except ImportError:
    TIMEOUT_MAX = 60 * 60 * 24 * 49

def init(args):
    ''' store the counter for later use '''
    global failed
    failed = args

def worker(example_name):
    global failed
    # += operation is not atomic, so we need to get a lock:
    print("running %s ..." % example_name, end="")
    try:
        out = subprocess.check_output([sys.executable, example_name],
                                      stderr=subprocess.STDOUT,
                                      universal_newlines=True)
        print("[passed]")
    except subprocess.CalledProcessError as cpe:
        print("%s" % cpe.output)
        with failed.get_lock():
            failed.value += 1
        print("[failed]")

if __name__ == "__main__":
    init_time = time.time()

    # find examplessubdir from current file
    path = os.path.abspath(__file__)
    test_dirname = os.path.dirname(path)
    examples_directory = os.path.join(test_dirname, '..', 'demos', 'examples')
    os.chdir(examples_directory)
    all_examples_file_names=glob.glob('core_*.py')

    # some tests have to be excluded from the automatic
    # run. For instance, qt based examples
    tests_to_exclude = ['core_display_signal_slots.py',
                        'core_font_3d_console.py',
                        'core_display_overlayered_image.py',
                        'core_display_overlayered_lines.py',
                        'core_display_overlayered_text.py',
                        'core_display_raytracing.py',
                        'core_visualization_overpaint_viewer.py'
                        ]

    # remove examples to excludes
    for test_name in tests_to_exclude:
        all_examples_file_names.remove(test_name)

    nbr_examples = len(all_examples_file_names)

    os.environ["PYTHONOCC_OFFSCREEN_RENDERER"] = "1"
    os.environ["PYTHONOCC_OFFSCREEN_RENDERER_DUMP_IMAGE"] = "1"
    os.environ["PYTHONOCC_SHUNT_WEB_SERVER"] = "1"

    failed = mp.Value('i', 0)

    pool = mp.Pool(initializer = init, initargs = (failed, ))
    pool.map_async(worker, all_examples_file_names).get(TIMEOUT_MAX)
    pool.close()
    pool.join()

    print("Test examples results :")
    print("\t %i/%i tests passed" % ((nbr_examples - failed.value), nbr_examples))

    del os.environ["PYTHONOCC_OFFSCREEN_RENDERER"]
    del os.environ["PYTHONOCC_SHUNT_WEB_SERVER"]

    if failed.value > 0:
        raise AssertionError("%i tests failed" % (failed.value))

    print("Total time to run all examples: %fs" %(time.time() - init_time))
