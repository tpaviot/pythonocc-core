# make an in source build do to some problems with install

# Configure step
cmake -G Ninja -DCMAKE_INSTALL_PREFIX=$PREFIX \
 -DPYTHONOCC_BUILD_TYPE=Release \
 -DCMAKE_PREFIX_PATH=$PREFIX \
 -DCMAKE_SYSTEM_PREFIX_PATH=$PREFIX \
 -DPython3_FIND_STRATEGY=LOCATION \
 -DPython3_FIND_FRAMEWORK=NEVER \
 -DPYTHONOCC_WRAP_SMESH=OFF \
 -DSMESH_INCLUDE_PATH:PATH=$PREFIX/include/smesh \
 -DSMESH_LIB_PATH:PATH=$PREFIX/lib \
 .
# Build step
# on linux travis, limit the number of concurrent jobs otherwise
# gcc gets out of memory
ninja -j 6 install

# fix rpaths
#if [ `uname` == Darwin ]; then
#    for lib in `ls $SP_DIR/OCC/_*.so`; do
#      install_name_tool -rpath $PREFIX/lib @loader_path/../../../ $lib
#    done
#fi
