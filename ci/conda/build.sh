# make an in source build do to some problems with install

declare -a CMAKE_PLATFORM_FLAGS
if [[ ${HOST} =~ .*linux.* ]]; then
    CMAKE_PLATFORM_FLAGS+=(-DCMAKE_TOOLCHAIN_FILE="${RECIPE_DIR}/cross-linux.cmake")
fi

# Configure step
cmake -G Ninja -DCMAKE_INSTALL_PREFIX=$PREFIX \
 -DPYTHONOCC_BUILD_TYPE=Release \
  ${CMAKE_PLATFORM_FLAGS[@]} \
 -DCMAKE_PREFIX_PATH=$PREFIX \
 -DCMAKE_SYSTEM_PREFIX_PATH=$PREFIX \
 -DPYTHONOCC_WRAP_SMESH=ON \
 -DSMESH_INCLUDE_PATH:PATH=$PREFIX/include/smesh \
 -DSMESH_LIB_PATH:PATH=$PREFIX/lib \
 -DPython3_FIND_STRATEGY=LOCATION \
 -DPython3_FIND_FRAMEWORK=NEVER \
 .

# Build step
ninja

# Install step
ninja install

# fix rpaths
if [ `uname` == Darwin ]; then
    for lib in `ls $SP_DIR/OCC/_*.so`; do
      install_name_tool -rpath $PREFIX/lib @loader_path/../../../ $lib
    done
fi
