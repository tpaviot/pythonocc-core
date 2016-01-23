cd $SRC_DIR/test
python run_tests.py
python core_webgl_unittest.py
if [ `uname` == Linux ]; then
    xvfb-run -s "-screen 0 1024x768x16" python core_display_pyqt4_unittest.py
    xvfb-run -s "-screen 0 1024x768x16" python core_display_pyqt5_unittest.py
    xvfb-run -s "-screen 0 1024x768x16" python core_display_pyside_unittest.py
    xvfb-run -s "-screen 0 1024x768x16" python core_display_wx_unittest.py
fi
