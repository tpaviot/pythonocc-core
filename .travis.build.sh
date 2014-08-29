#! /bin/sh
set -e

ncpus=4

echo "Timestamp" && date
cmake -DOCE_INCLUDE_PATH=/usr/include/oce -DOCE_LIB_PATH=/usr/lib ..
echo ""
echo "Timestamp" && date
echo "Starting build with -j$ncpus ..."

make -j$ncpus
sudo make install
# Run tests
echo "Timestamp" && date
#make test
