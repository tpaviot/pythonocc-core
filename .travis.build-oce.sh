#! /bin/sh
set -e


#  Default values
: ${OCE_USE_PCH=OFF}
: ${OCE_COPY_HEADERS_BUILD=OFF}

echo "Timestamp" && date
cmake -DOCE_ENABLE_DEB_FLAG:BOOL=OFF \
      -DCMAKE_BUILD_TYPE:STRING=Release \
      -DOCE_USE_TCL_TEST_FRAMEWORK:BOOL=ON \
      -DOCE_TESTING:BOOL=ON \
      -DOCE_DRAW:BOOL=ON \
      -DOCE_VISUALISATION:BOOL=ON \
      -DOCE_OCAF:BOOL=ON \
      -DOCE_DATAEXCHANGE:BOOL=ON \
      -DOCE_USE_PCH:BOOL=${OCE_USE_PCH} \
      -DOCE_COPY_HEADERS_BUILD:BOOL=${OCE_COPY_HEADERS_BUILD} \
      -DOCE_WITH_GL2PS:BOOL=ON \
      -DOCE_WITH_FREEIMAGE:BOOL=ON \
      -DOCE_MULTITHREAD_LIBRARY:STRING=NONE \
      ..
echo ""
echo "Timestamp" && date
make -j16 | grep Built

echo "Timestamp" && date
