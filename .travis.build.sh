#! /bin/sh
set -e

ncpus=5

#####################
# build for python3 #
#####################
echo "Timestamp" && date
echo "Configuring pythonocc for python3"
mkdir cmake-build-py3
cd cmake-build-py3
cmake -DPYTHON_EXECUTABLE=/usr/bin/python3.4 \
      -DPYTHON_INCLUDE_DIR=/usr/include/python3.4m \
      -DPYTHON_LIBRARY=/usr/lib/x86_64-linux-gnu/libpython3.4m.so \
      ..
echo ""
echo "Timestamp" && date
# make for py3
echo "Starting build for python3 with -j$ncpus ..."
# travis-ci truncates when there are more than 10,000 lines of output.
# trim them to see test results.
sudo make -j$ncpus install | grep Built
# Run tests
echo "Timestamp" && date
cd ../test
sudo /usr/bin/python3.4 run_tests.py
sudo /usr/bin/python3.4 core_webgl_unittest.py

#####################
# build for python2 #
#####################
cd ..
echo "Timestamp" && date
echo "Configuring pythonocc for python2"
mkdir cmake-build-py2
cd cmake-build-py2
cmake ..
echo ""
echo "Timestamp" && date
echo "Starting build for python2 with -j$ncpus ..."
# travis-ci truncates when there are more than 10,000 lines of output.
# Builds generate around 9,000 lines of output, trim them to see test
# results.
sudo make -j$ncpus install | grep Built
# Run tests
echo "Timestamp" && date
cd ../test
sudo python run_tests.py
sudo python core_webgl_unittest.py
# we only run this test on python2 since it requires GUIs
xvfb-run -s "-screen 0 1024x768x16" sudo python core_display_unittest.py
