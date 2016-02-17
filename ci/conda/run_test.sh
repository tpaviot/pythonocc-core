cd $SRC_DIR/test
python run_tests.py
python run_examples_as_tests.py
python core_webgl_unittest.py
if [ `uname` == Linux ]; then
	# start xvfb
	#export DISPLAY=:99.0
    #sh -e /etc/init.d/xvfb start
    /sbin/start-stop-daemon --start --pidfile /tmp/custom_xvfb_99.pid --make-pidfile --background --exec /usr/bin/Xvfb -- :99 -ac -screen 0 1024x768x16
    sleep 3 # give xvfb some time to start
    # then run GUI tests
    python core_display_pyqt4_unittest.py
    python core_display_pyqt5_unittest.py
    python core_display_pyside_unittest.py
    python core_display_wx_unittest.py
fi
