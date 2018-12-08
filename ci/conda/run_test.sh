cd ../work/test
python run_tests.py
python core_webgl_unittest.py
if [ $(uname) == Linux ]; then
    # start xvfb
    export DISPLAY=:99.0
    sh -e /etc/init.d/xvfb start
    sleep 3 # give xvfb some time to start
    # run example as tests
    python run_examples_as_tests.py
    # then run GUI tests
    python core_display_pyqt4_unittest.py
    python core_display_pyqt5_unittest.py
    python core_display_pyside_unittest.py
    python core_display_wx_unittest.py
fi
