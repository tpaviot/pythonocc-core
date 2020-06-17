#!/bin/bash
cd ../work/test
python run_tests.py
mypy test_mypy_classic_occ_bottle.py

if [ $(uname) == Linux ]; then
    # start xvfb
    export DISPLAY=:99.0
    sh -e /etc/init.d/xvfb start
    sleep 3 # give xvfb some time to start
    # then run pyqt5 GUI test
    python core_display_pyqt5_unittest.py
fi