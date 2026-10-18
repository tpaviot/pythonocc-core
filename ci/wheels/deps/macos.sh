#!/bin/bash
# Build the native dependencies of the pythonocc-core macOS wheels and
# install them to $PYOCC_DEPS_PREFIX:
#  * SWIG, for the build machine
#  * OCCT, for $ARCH (x86_64 or arm64, may differ from the build machine).
#    Its 3rd parties (freetype, FreeImage, RapidJSON) are built by vcpkg,
#    through the OCCT vcpkg manifest, and copied to the prefix.
#
# Nothing is done if the prefix is already complete (restored from cache).
set -euo pipefail

# lowest priority for the whole build (inherited by the child processes), so
# that the CI runner agent still gets CPU time for its heartbeats: a starved
# agent is reported as lost
renice -n 19 $$ > /dev/null

SWIG_VERSION=4.5.1
OCCT_TAG=V8_0_1
ARCH=${ARCH:?ARCH must be x86_64 or arm64}
DEPS_PREFIX=${PYOCC_DEPS_PREFIX:?PYOCC_DEPS_PREFIX must be set}
export MACOSX_DEPLOYMENT_TARGET=11.0

HERE=$(cd "$(dirname "$0")/.." && pwd)
COMPLETE_MARK="${DEPS_PREFIX}/.pyocc-deps-complete"
if [ -f "${COMPLETE_MARK}" ]; then
  echo "Dependencies already installed in ${DEPS_PREFIX}"
  exit 0
fi

case "${ARCH}" in
  x86_64) TRIPLET=x64-osx-pyocc ;;
  arm64) TRIPLET=arm64-osx-pyocc ;;
  *) echo "unsupported ARCH ${ARCH}"; exit 1 ;;
esac

# one compile job per core, but at most one per 3 GB of memory: the hosted
# agent is lost when the build exhausts the memory
MEM_JOBS=$(( $(sysctl -n hw.memsize) / (3 * 1024 * 1024 * 1024) ))
NPROC=$(sysctl -n hw.ncpu)
if [ "${MEM_JOBS}" -ge 1 ] && [ "${MEM_JOBS}" -lt "${NPROC}" ]; then NPROC=${MEM_JOBS}; fi
echo "Building with ${NPROC} jobs"

# log the free memory and disk space, to diagnose a lost agent
( while true; do
    sleep 120
    echo "[resources] $(date +%H:%M:%S) $(vm_stat | awk -v ps="$(sysctl -n hw.pagesize)" '/Pages free/ {f = $3} /Pages inactive/ {i = $3} END {printf "free %d MB inactive %d MB", f * ps / 1048576, i * ps / 1048576}') $(sysctl -n vm.swapusage | awk '{print "swap used " $6}') disk $(df -h / | awk 'NR == 2 {print $4}') free"
  done ) &
MONITOR_PID=$!
trap 'kill ${MONITOR_PID} 2>/dev/null || true' EXIT

WORK=$(mktemp -d)
cd "${WORK}"

# SWIG, runs on the build machine only. PCRE is only needed by the
# %rename regex matching, which pythonocc does not use
curl -fsSL "https://downloads.sourceforge.net/project/swig/swig/swig-${SWIG_VERSION}/swig-${SWIG_VERSION}.tar.gz" | tar xz
pushd "swig-${SWIG_VERSION}"
./configure --prefix="${DEPS_PREFIX}" --without-alllang --with-python3 --without-pcre
make -j"${NPROC}"
make install
popd

# autotools, needed by some vcpkg ports (the OCCT macOS CI installs the same)
brew install autoconf autoconf-archive automake libtool nasm pkg-config || true

# vcpkg: a full clone, the OCCT manifest pins a baseline commit
git clone https://github.com/microsoft/vcpkg.git vcpkg
./vcpkg/bootstrap-vcpkg.sh -disableMetrics

# OCCT
mkdir occt-src
curl -fsSL "https://github.com/Open-Cascade-SAS/OCCT/archive/refs/tags/${OCCT_TAG}.tar.gz" | tar xz --strip-components=1 -C occt-src
cmake -S occt-src -B occt-build -G "Unix Makefiles" \
  -DCMAKE_BUILD_TYPE=Release \
  -DCMAKE_OSX_ARCHITECTURES="${ARCH}" \
  -DCMAKE_OSX_DEPLOYMENT_TARGET="${MACOSX_DEPLOYMENT_TARGET}" \
  -DCMAKE_INSTALL_RPATH="${DEPS_PREFIX}/lib" \
  -DBUILD_USE_VCPKG=ON \
  -DVCPKG_ROOT="${WORK}/vcpkg" \
  -DVCPKG_TARGET_TRIPLET="${TRIPLET}" \
  -DVCPKG_OVERLAY_TRIPLETS="${HERE}/triplets" \
  -DVCPKG_INSTALL_OPTIONS=--clean-after-build \
  -DINSTALL_DIR="${DEPS_PREFIX}" \
  -DINSTALL_DIR_LAYOUT=Unix \
  -DBUILD_LIBRARY_TYPE=Shared \
  -DBUILD_RELEASE_DISABLE_EXCEPTIONS=OFF \
  -DBUILD_MODULE_Draw=OFF \
  -DBUILD_DOC_Overview=OFF \
  -DUSE_TCL=OFF \
  -DUSE_TK=OFF \
  -DUSE_FREETYPE=ON \
  -DUSE_RAPIDJSON=ON \
  -DUSE_FREEIMAGE=ON \
  -DUSE_DRACO=OFF \
  -DUSE_TBB=OFF \
  -DUSE_VTK=OFF \
  -DUSE_OPENVR=OFF \
  -DUSE_FFMPEG=OFF \
  || {
    # vcpkg runs during the configuration, show why it failed at the end of the log
    grep -n -A30 "^error:" occt-build/vcpkg-manifest-install.log | tail -n 120 || true
    exit 1
  }
cmake --build occt-build -j"${NPROC}"
cmake --install occt-build

# the 3rd party dylibs, for delocate. RapidJSON is header only, its
# headers are included by the OCCT glTF headers: put them next to the
# OCCT headers so that the pythonocc build finds them
VCPKG_INSTALLED="occt-build/vcpkg_installed/${TRIPLET}"
cp -a "${VCPKG_INSTALLED}"/lib/*.dylib "${DEPS_PREFIX}/lib/"
cp -a "${VCPKG_INSTALLED}/include/rapidjson" "${DEPS_PREFIX}/include/opencascade/"

# the wheels only need the libraries, headers and cmake config
rm -rf "${DEPS_PREFIX}/share/doc" "${DEPS_PREFIX}/share/opencascade/samples"

cd /
rm -rf "${WORK}"
date > "${COMPLETE_MARK}"
