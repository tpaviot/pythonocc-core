#!/bin/bash

# builds fine on OSX 10.8.5 / clang 5.0.0

# if you'd like to build a conda package from a local directory
# then comment out the "source" section in meta.yaml
# and replace $LOCAL_SRC_DIR to your pythonocc-core directory
#export LOCAL_SRC_DIR=/path/to/pythonocc-core/
#cp -r $LOCAL_SRC_DIR .

echo "conda build directory is:" `pwd`
export PYTHONOCC_VERSION=`python -c "import OCC;print OCC.VERSION"`
echo "building pythonocc-core version:" $PYTHONOCC_VERSION

export MACOSX_DEPLOYMENT_TARGET=10.6
export DYLD_LIBRARY_PATH="$PREFIX/lib:$DYLD_LIBRARY_PATH"
export LD_LIBRARY_PATH="$PREFIX/lib:$LD_LIBRARY_PATH"

backup_prefix=$PREFIX

ncpus=1
if test -x /usr/bin/getconf; then
    ncpus=$(/usr/bin/getconf _NPROCESSORS_ONLN)
fi

#swig_incl_dir=`$PREFIX/bin/swig -swiglib`
# see: https://github.com/ContinuumIO/anaconda-issues/issues/164
# setting the $SWIG_LIB variable as a temporary bypass
export SWIG_LIB=$PREFIX/share/swig/2.0.10
echo "swig <<<"$SWIG_LIB">>>"

echo "Timestamp" && date
cmake -DCMAKE_INSTALL_PREFIX=$PREFIX \
      -DCMAKE_OSX_DEPLOYMENT_TARGET=10.8 \
      -DOCE_INCLUDE_PATH=$PREFIX/include/oce \
      -DPYTHON_LIBRARY=$PREFIX/lib/libpython2.7.dylib \
      -DSWIG_EXECUTABLE=$PREFIX/bin/swig \
      -DSWIG_DIR=$SWIG_LIB \
      -DOCE_LIB_PATH=$PREFIX/lib\
      -DpythonOCC_INSTALL_DIRECTORY=$PREFIX/lib/python2.7/site-packages/OCC \
      -DpythonOCC_WRAP_DATAEXCHANGE=ON \
      -DpythonOCC_WRAP_MODEL=ON \
      -DpythonOCC_WRAP_VISU=ON \
      $SRC_DIR

echo ""
echo "Timestamp" && date
echo "Starting build with -j$ncpus ..."
make -j$ncpus
make install
echo "Done building and installing pythonocc-core" && date
