#!/bin/bash

# builds fine on OSX 10.8.5 / clang 5.0.0

# if you'd like to build a conda package from a local directory
# then comment out the "source" section in meta.yaml
# and replace $LOCAL_SRC_DIR to your pythonocc-core directory
#export LOCAL_SRC_DIR=/path/to/pythonocc-core/
#cp -r $LOCAL_SRC_DIR .

echo "conda build directory is:" `pwd`
#export PYTHONOCC_VERSION=`python -c "import OCC;print( OCC.VERSION )"`
#echo "building pythonocc-core version:" $PYTHONOCC_VERSION

export MACOSX_DEPLOYMENT_TARGET=10.6
export DYLD_LIBRARY_PATH="$PREFIX/lib:$DYLD_LIBRARY_PATH"
export LD_LIBRARY_PATH="$PREFIX/lib:$LD_LIBRARY_PATH"
export EXAMPLE_DIR=$PREFIX/share/pythonocc-core/examples

# set paths that are python version specific
if [ "$PY_VER" == "2.7" ]; then
    echo "building for python 2.7"
    echo "export CONDA_PY=34 to build for python 3.4"
    export LIB_PY=$PREFIX/lib/libpython2.7.dylib
    export INC_PY=$PREFIX/include/python2.7
    export PYOCC_INSTALL_DIR=$PREFIX/lib/python2.7/site-packages/OCC

elif [ "$PY_VER" ==  "3.4" ]; then
    echo "conda py is 3.4"
    echo "export CONDA_PY=27 to build for python 2.7"
    export LIB_PY=$PREFIX/lib/libpython3.4m.dylib
    export INC_PY=$PREFIX/include/python3.4m
    export PYOCC_INSTALL_DIR=$PREFIX/lib/python3.4/site-packages/OCC
else
    echo "supports building pythonocc-core for python version 2.7 or 3.4, $PY_VER not supported"
    exit 1
fi

ncpus=1
if test -x /usr/bin/getconf; then
    ncpus=$(/usr/bin/getconf _NPROCESSORS_ONLN)
fi

#swig_incl_dir=`$PREFIX/bin/swig -swiglib`
# see: https://github.com/ContinuumIO/anaconda-issues/issues/164
# setting the $SWIG_LIB variable as a temporary bypass
export SWIG_LIB=$PREFIX/share/swig/3.0.2
echo "swig <<<"$SWIG_LIB">>>"

echo "Timestamp" && date
cmake -DCMAKE_INSTALL_PREFIX=$PREFIX \
      -DCMAKE_OSX_DEPLOYMENT_TARGET=10.8 \
      -DBOOST_BUNDLED_DIR="" \
      -DBoost_DIR=$PREFIX/share/cmake-3.0/Modules/ \
      -DBoost_INCLUDE_DIR=$PREFIX/include \
      -DOCE_DIR=$PREFIX/lib \
      -DPYTHON_EXECUTABLE=$PREFIX/bin/python2.7 \
      -DPYTHON_INCLUDE_DIR=$INC_PY \
      -DPYTHON_LIBRARY=$LIB_PY \
      -DSWIG_EXECUTABLE=$PREFIX/bin/swig \
      -DSWIG_DIR=$SWIG_LIB \
      -DPYTHONOCC_WRAP_NETGEN=ON \
      -DPYTHONOCC_WRAP_SMESH=ON \
      -DPYTHONOCC_WRAP_VISU=ON \
      -DPYTHONOCC_WRAP_DATAEXCHANGE=ON \
      -DSMESH_INCLUDE_PATH=$PREFIX/include/smesh \
      -DSMESH_LIB_PATH=$PREFIX/lib \
      $SRC_DIR

echo ""
echo "Timestamp" && date
echo "Starting build with -j$ncpus ..."
make -j$ncpus
make install


if [ ! -d "$EXAMPLE_DIR" ]; then
    mkdir -p $EXAMPLE_DIR
fi
cp examples/*.py $EXAMPLE_DIR


echo "Done building and installing pythonocc-core" && date
