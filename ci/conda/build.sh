# make an in source build do to some problems with install

if [ "$PY3K" == "1" ]; then
    MY_PY_VER="${PY_VER}m"
else
    MY_PY_VER="${PY_VER}"
fi

if [ `uname` == Darwin ]; then
    PY_LIB="libpython${MY_PY_VER}.dylib"
else
    PY_LIB="libpython${MY_PY_VER}.so"
fi

# Configure step
cmake -G Ninja -DCMAKE_INSTALL_PREFIX=$PREFIX \
 -DCMAKE_BUILD_TYPE=Release \
 -DCMAKE_PREFIX_PATH=$PREFIX \
 -DCMAKE_SYSTEM_PREFIX_PATH=$PREFIX \
 -DPYTHON_EXECUTABLE:FILEPATH=$PYTHON \
 -DPYTHON_INCLUDE_DIR:PATH=$PREFIX/include/python$MY_PY_VER \
 -DPYTHON_LIBRARY:FILEPATH=$PREFIX/lib/${PY_LIB} \
 -DPYTHON_LIBRARY:FILEPATH=$PREFIX/lib/${PY_LIB} \
 -DPYTHONOCC_WRAP_SMESH=ON \
 -DSMESH_INCLUDE_PATH:PATH=$PREFIX/include/smesh \
 -DSMESH_LIB_PATH:PATH=$PREFIX/lib \
 .
# Build step
# on linux travis, limit the number of concurrent jobs otherwise
# gcc gets out of memory
if [ `uname` == Darwin ]; then
ninja
else
ninja -j 6
fi

# Install step
ninja install

# copy the source
mkdir -p $PREFIX/src
mkdir -p $PREFIX/src/pythonocc-core
cp -r src $PREFIX/src/pythonocc-core

# fix rpaths
if [ `uname` == Darwin ]; then
    for lib in `ls $SP_DIR/OCC/_*.so`; do
      install_name_tool -rpath $PREFIX/lib @loader_path/../../../ $lib
    done
fi
