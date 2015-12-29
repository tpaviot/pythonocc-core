#! /bin/sh
set -e

ncpus=5

echo "Timestamp" && date
echo "Configuring pythonocc for python"
mkdir cmake-build
cd cmake-build
cmake -DPYTHON_EXECUTABLE=/home/travis/miniconda/bin/python$python_version \
      -DPYTHON_LIBRARY=/home/travis/miniconda/lib/libpython$python_version.so \
      -DPYTHON_INCLUDE_DIR=/home/travis/miniconda/include/python$python_version \
      ..
echo ""
echo "Timestamp" && date
echo "Starting build for python with -j$ncpus ..."

make -j$ncpus
make install > /dev/null
# Run tests
echo "Timestamp" && date
cd ../test
/home/travis/miniconda/bin/python run_tests.py
/home/travis/miniconda/bin/python core_webgl_unittest.py
xvfb-run -s "-screen 0 1024x768x16" /home/travis/miniconda/bin/python core_display_unittest.py
