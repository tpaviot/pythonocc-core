#!/bin/sh
set -e
cd /c/projects/pythonocc-core
if [ "$ARCH" = Win32 ]; then
  PATH=$PATH:/c/MinGW/bin
elif [ "$ARCH" = i686 ]; then 
  f=i686-4.9.3-release-posix-dwarf-rt_v4-rev1.7z
  if ! [ -e $f ]; then
    echo "Downloading $f"
    curl -LsSO http://sourceforge.net/projects/mingw-w64/files/Toolchains%20targetting%20Win32/Personal%20Builds/mingw-builds/4.9.3/threads-posix/dwarf/$f
  fi
  7z x $f > /dev/null
  echo "Extracting $f"
  mv mingw32 /MinGW
else
  f=x86_64-5.2.0-release-posix-seh-rt_v4-rev0.7z
  if ! [ -e $f ]; then
    echo "Downloading $f"
    curl -LsSO http://sourceforge.net/projects/mingw-w64/files/Toolchains%20targetting%20Win64/Personal%20Builds/mingw-builds/5.2.0/threads-posix/seh/$f
  fi
  echo "Extracting $f"
  7z x $f > /dev/null
  mv mingw64 /MinGW
fi
# download/extract oce-0.17.2
f=OCE-0.17.2-Mingw32.zip
if ! [ -e $f ]; then
  echo "Downloading $f"
  curl -LsSO https://github.com/tpaviot/oce/releases/download/OCE-0.17.2/$f
fi
echo "Extracting $f"
7z x $f > /dev/null

echo "current directory"
pwd
ls C:/projects/pythonocc-core/OCE-0.17.2-Mingw32/cmake
g++ -v
# make pythonocc-core
cd /c/projects/pythonocc-core
mkdir cmake-build
cd cmake-build
cmake -DOCE_DIR=C:/projects/pythonocc-core/OCE-0.17.2-Mingw32/cmake \
      -G'MSYS Makefiles' ..

mingw32-make -j4
mingw32-make install
