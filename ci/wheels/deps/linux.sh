#!/bin/bash
# Build the native dependencies of the pythonocc-core Linux wheels (SWIG,
# OCCT) and install them to $DEPS_PREFIX. Runs as the cibuildwheel
# "before-all" step, inside the manylinux_2_28 container.
#
# If PYOCC_DEPS_CACHE points to a writable directory (on the host, through
# the /host mount), the installed prefix is saved there as a tarball and
# reused by the next runs.
set -euo pipefail

# lowest priority for the whole build (inherited by the child processes), so
# that the CI runner agent still gets CPU time for its heartbeats: a starved
# agent is reported as lost
renice -n 19 $$ > /dev/null

SWIG_VERSION=4.5.1
OCCT_VERSION=8.0.1
OCCT_TAG=V8_0_1
RAPIDJSON_COMMIT=24b5e7a8b27f42fa16b96fc70aade9106cf7102f
DEPS_PREFIX=${DEPS_PREFIX:-/opt/pyocc-deps}

# bump the last component to invalidate caches when the build options change
CACHE_KEY="swig-${SWIG_VERSION}_occt-${OCCT_VERSION}_$(uname -m)_2"

# system packages, also needed when the cache is used: X11/OpenGL headers
# for the visualization toolkits, freetype/fontconfig for text rendering,
# FreeImage (EPEL) for image files I/O, pcre2 for SWIG
dnf install -y epel-release
dnf install -y freetype-devel fontconfig-devel freeimage-devel mesa-libGL-devel libX11-devel pcre2-devel

CACHE_TARBALL=""
if [ -n "${PYOCC_DEPS_CACHE:-}" ]; then
  CACHE_TARBALL="${PYOCC_DEPS_CACHE}/pyocc-deps_${CACHE_KEY}.tar.gz"
  if [ -f "${CACHE_TARBALL}" ]; then
    echo "Using cached dependencies ${CACHE_TARBALL}"
    mkdir -p "${DEPS_PREFIX}"
    tar xzf "${CACHE_TARBALL}" -C "${DEPS_PREFIX}"
    exit 0
  fi
fi

# one compile job per core, but at most one per 3 GB of memory: some OCCT
# sources need more than 1 GB to compile, the agent is lost when it runs out
MEM_JOBS=$(awk '/MemTotal/ {print int($2 / (3 * 1024 * 1024))}' /proc/meminfo)
NPROC=$(nproc)
if [ "${MEM_JOBS}" -ge 1 ] && [ "${MEM_JOBS}" -lt "${NPROC}" ]; then NPROC=${MEM_JOBS}; fi
echo "Building with ${NPROC} jobs"
WORK=$(mktemp -d)
cd "${WORK}"

# SWIG
curl -fsSL "https://downloads.sourceforge.net/project/swig/swig/swig-${SWIG_VERSION}/swig-${SWIG_VERSION}.tar.gz" | tar xz
pushd "swig-${SWIG_VERSION}"
./configure --prefix="${DEPS_PREFIX}" --without-alllang --with-python3
make -j"${NPROC}"
make install
popd

# RapidJSON (header only, required by the glTF reader/writer)
curl -fsSL "https://github.com/Tencent/rapidjson/archive/${RAPIDJSON_COMMIT}.tar.gz" | tar xz
mkdir -p "${DEPS_PREFIX}/include"
cp -r "rapidjson-${RAPIDJSON_COMMIT}/include/rapidjson" "${DEPS_PREFIX}/include/"

# OCCT
mkdir occt-src
curl -fsSL "https://github.com/Open-Cascade-SAS/OCCT/archive/refs/tags/${OCCT_TAG}.tar.gz" | tar xz --strip-components=1 -C occt-src
cmake -S occt-src -B occt-build -G "Unix Makefiles" \
  -DCMAKE_BUILD_TYPE=Release \
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
  -D3RDPARTY_RAPIDJSON_INCLUDE_DIR="${DEPS_PREFIX}/include" \
  -DUSE_FREEIMAGE=ON \
  -D3RDPARTY_FREEIMAGE_INCLUDE_DIR=/usr/include \
  -D3RDPARTY_FREEIMAGE_LIBRARY_DIR=/usr/lib64 \
  -DUSE_DRACO=OFF \
  -DUSE_TBB=OFF \
  -DUSE_VTK=OFF \
  -DUSE_OPENVR=OFF \
  -DUSE_FFMPEG=OFF
cmake --build occt-build -j"${NPROC}"
cmake --install occt-build

# the wheels only need the libraries, headers and cmake config
rm -rf "${DEPS_PREFIX}/share/doc" "${DEPS_PREFIX}/share/opencascade/samples"

cd /
rm -rf "${WORK}"

if [ -n "${CACHE_TARBALL}" ]; then
  mkdir -p "${PYOCC_DEPS_CACHE}"
  tar czf "${CACHE_TARBALL}.tmp" -C "${DEPS_PREFIX}" .
  mv "${CACHE_TARBALL}.tmp" "${CACHE_TARBALL}"
  echo "Saved dependencies to ${CACHE_TARBALL}"
fi
