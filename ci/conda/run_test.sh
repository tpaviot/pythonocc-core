cd ../work/test
python run_tests.py
if [ `uname` == Linux ]; then
	# run those tests only on linux because
	# it takes too long on travis osx
	python run_examples_as_tests.py
	python core_webgl_unittest.py
	# start xvfb
	export DISPLAY=:99.0
    sh -e /etc/init.d/xvfb start
    sleep 3 # give xvfb some time to start
    # then run GUI tests
    python core_display_pyqt4_unittest.py
    python core_display_pyqt5_unittest.py
    python core_display_pyside_unittest.py
    python core_display_wx_unittest.py
fi
