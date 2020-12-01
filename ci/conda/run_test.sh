#!/bin/bash
cd ../work/test
python run_tests.py
mypy test_mypy_classic_occ_bottle.py

if [ $(uname) == Linux ]; then
    # start xvfb
    xvfb-run --auto-servernum --server-args='-screen 0, 1024x768x24' python core_display_pyqt5_unittest.py
    xvfb-run --auto-servernum --server-args='-screen 0, 1024x768x24' python core_display_pyside2_unittest.py
    xvfb-run --auto-servernum --server-args='-screen 0, 1024x768x24' python core_display_wx_unittest.py
fi
