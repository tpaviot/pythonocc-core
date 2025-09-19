# Building pythonOCC 7.9.0 - Complete Guide for Linux and Windows

## Table of Contents
- [Linux Build Guide](#linux-build-guide)
  - [Prerequisites (Linux)](#prerequisites-linux)
  - [System Requirements (Linux)](#system-requirements-linux)
  - [Build Process (Linux)](#build-process-linux)
    - [1. Installing System Dependencies](#1-installing-system-dependencies-linux)
    - [2. Building SWIG](#2-building-swig-linux)
    - [3. Building OpenCascade](#3-building-opencascade-linux)
    - [4. Building pythonOCC](#4-building-pythonocc-linux)
  - [Optional Features (Linux)](#optional-features-linux)
- [Windows Build Guide](#windows-build-guide)
  - [Prerequisites (Windows)](#prerequisites-windows)
  - [System Requirements (Windows)](#system-requirements-windows)
  - [Build Process (Windows)](#build-process-windows)
    - [1. Installing Required Software](#1-installing-required-software-windows)
    - [2. Installing OpenCascade](#2-installing-opencascade-windows)
    - [3. Building pythonOCC](#3-building-pythonocc-windows)
  - [Optional Features (Windows)](#optional-features-windows)
- [Common Steps](#common-steps)
  - [Testing](#testing)
  - [Demo Applications](#demo-applications)

# Linux Build Guide

## Prerequisites (Linux)

Before starting the build process, ensure your system meets these requirements:

- Ubuntu 22.04 LTS (fresh installation recommended)
- At least 8GB of free disk space
- Internet connection for downloading packages
- Sudo privileges

## System Requirements (Linux)

pythonOCC 7.9.0 requires the following components:

| Component | Version | Purpose |
|-----------|---------|---------|
| Python | ≥ 3.9 | Runtime environment |
| OpenCascade | 7.9.0 | Core CAD functionality |
| SWIG | 4.2.1 | Interface generation |
| CMake | ≥ 3.20 | Build system |

## Build Process (Linux)

### 1. Installing System Dependencies (Linux)

First, update your system and install required packages:

```bash
sudo apt-get update
sudo apt-get install -y \
    wget \
    libglu1-mesa-dev \
    libgl1-mesa-dev \
    libxmu-dev \
    libxi-dev \
    build-essential \
    cmake \
    libfreetype6-dev \
    tk-dev \
    python3-dev \
    rapidjson-dev \
    python3 \
    git \
    python3-pip \
    libpcre2-dev
```

### 2. Building SWIG (Linux)

SWIG 4.2.1 or higher is required but not available in Ubuntu's default repositories. Build it from source:

```bash
wget http://prdownloads.sourceforge.net/swig/swig-4.3.0.tar.gz
tar -zxvf swig-4.3.0.tar.gz
cd swig-4.3.0
./configure
make -j$(nproc)
sudo make install
```

### 3. Building OpenCascade (Linux)

Download and extract OpenCascade 7.9.0:

```bash
wget https://github.com/Open-Cascade-SAS/OCCT/archive/refs/tags/V7_9_0.tar.gz
tar -xvzf V7_9_0.tar.gz
cd OCCT-7.9.0
mkdir cmake-build
cd cmake-build
```

Configure and build OpenCascade:

```bash
cmake -DINSTALL_DIR=/opt/occt790 \
      -DBUILD_RELEASE_DISABLE_EXCEPTIONS=OFF \
      ..

make -j$(nproc)
sudo make install
```

Add OpenCascade libraries to the system:

```bash
sudo bash -c 'echo "/opt/occt790/lib" >> /etc/ld.so.conf.d/occt.conf'
sudo ldconfig
```

### 4. Building pythonOCC (Linux)

Clone and build pythonOCC:

```bash
git clone https://github.com/tpaviot/pythonocc-core.git
cd pythonocc-core
mkdir cmake-build && cd cmake-build

# Set installation directory (optional)
PYTHONOCC_INSTALL_DIRECTORY=${PYTHONOCC_INSTALL_DIRECTORY:-/usr/local}

cmake \
    -DOCCT_INCLUDE_DIR=/opt/occt790/include/opencascade \
    -DOCCT_LIBRARY_DIR=/opt/occt790/lib \
    -DCMAKE_BUILD_TYPE=Release \
    -DPYTHONOCC_INSTALL_DIRECTORY=$PYTHONOCC_INSTALL_DIRECTORY \
    ..

make -j$(nproc) && sudo make install
```

Add OpenCascade libraries to your environment:

```bash
echo 'export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/opt/occt790/lib' >> ~/.bashrc
source ~/.bashrc
```

Note: if you're running a conda environment on a recent linux distribution, you migh have to

```bash
conda update -c conda-forge libstdcxx-ng libgcc-ng
```

# Windows Build Guide

## Prerequisites (Windows)

Before starting the build process, ensure your system meets these requirements:

- Windows 10 or 11 (64-bit)
- At least 10GB of free disk space
- Internet connection for downloading packages
- Administrator privileges

## System Requirements (Windows)

| Component | Version | Download Link |
|-----------|---------|---------------|
| Visual Studio | 2019 or 2022 Community | [Download](https://visualstudio.microsoft.com/downloads/) |
| Python | ≥ 3.9 | [Download](https://www.python.org/downloads/) |
| CMake | ≥ 3.20 | [Download](https://cmake.org/download/) |
| Git | Latest | [Download](https://git-scm.com/download/win) |
| RapidJSON | Latest | [Download](https://github.com/Tencent/rapidjson.git) |
| SWIG | ≥ 4.2.1 | [Download](http://www.swig.org/download.html) |
| OpenCascade | 7.9.0 | [Download](https://dev.opencascade.org/download) |

## Build Process (Windows)

### 1. Installing Required Software (Windows)

1. Install Visual Studio 2019/2022 Community Edition:
   - During installation, select "Desktop development with C++"
   - Include "Windows 10 SDK" and "MSBuild"

2. Install Python 3.9 or later:
   - Download and run the installer
   - Check "Add Python to PATH"
   - Choose "Customize installation"
   - Select "pip" and "py launcher"
   - Install for all users

3. Install CMake:
   - Download and run the installer
   - Add CMake to the system PATH for all users

4. Install Git:
   - Download and run the installer
   - Use Git from Windows Command Prompt
   - Use OpenSSL library

5. Install SWIG:
   - Download SWIG 4.3.0 for Windows
   - Extract to C:\swigwin
   - Add C:\swigwin to the system PATH

6. Install RapidJSON
    - Clone the git repository git clone https://github.com/Tencent/rapidjson.git

Binaries for dependencies can be downloaded at https://dev.opencascade.org/resources/download/3rd-party-components

### 2. Installing OpenCascade (Windows)

1. Download OpenCascade 7.9.0 for Windows
2. Extract to, for example, occt-7.9.0

If the binaries are not available, consider compiling by yourself OCCT on Windows. Refer to the official OpenCascade Technology documentation https://dev.opencascade.org/doc/overview/html/build_upgrade.html

When installing OpenCascade and third-party libraries, you should have a structure similar to the one described at https://dev.opencascade.org/doc/overview/html/index.html#intro_install_windows

C:\OpenCASCADE-7.9.0-vc10-64
├── ffmpeg-3.3.4-gpl-64
├── freeimage-3.17.0-vc10-64
├── freetype-2.6.3-vc10-64
├── occt-7.9.0
├── qt486-vc10-64
├── tclkit-86-64
├── vtk-6.1.0-vc10-64
└── zlib-1.2.8-vc10-64

### 3. Building pythonOCC (Windows)

1. Clone the repository:
```batch
git clone https://github.com/tpaviot/pythonocc-core.git
cd pythonocc-core
```

2. Create build directory:
```batch
mkdir cmake-build
cd cmake-build
```

3. Configure with CMake:
```batch
cmake -G "Visual Studio 16 2019" -A x64 ^
    -DCMAKE_BUILD_TYPE=Release ^
    -DOCCT_INCLUDE_DIR=C:\OpenCASCADE-7.9.0-vc10-64\occt-7.9.0\inc ^
    -DOCCT_LIBRARY_DIR=C:\OpenCASCADE-7.9.0-vc10-64\occt-7.9.0\win64\vc14\lib ^
    -DOCCT_ESSENTIALS_ROOT=C:\OpenCASCADE-7.9.0-vc10-64
    ..
```

If using CMake GUI, make sure to set these two variables before clicking the "Generate" button:
```
OCCT_INCLUDE_DIR=C:\OpenCASCADE-7.9.0-vc10-64\occt-7.9.0\inc
OCCT_LIBRARY_DIR=C:\OpenCASCADE-7.9.0-vc10-64\occt-7.9.0\win64\vc14\lib
```

4. Build:
```batch
cmake --build . --config Release
```

5. Install:
```batch
cmake --install .
```

# Common Steps

## Optional Features

### NumPy Support

To enable fast STL file loading with NumPy support:

1. Install NumPy:
```bash
pip install numpy
```

2. Add the following CMake flag during pythonOCC configuration:
```bash
-DPYTHONOCC_MESHDS_NUMPY=ON
```

### Additional Dependencies

Install additional Python packages for full functionality:

```bash
pip install svgwrite numpy numpy-stl matplotlib PyQt5
```

## Testing

### Quick Test

Verify the installation:

```python
python3
>>> from OCC.Core.gp import gp_Pnt
>>> p = gp_Pnt(1., 2., 3.)
>>> p.X()
1.0
```

### Full Test Suite

Run the complete test suite:

```bash
pip install pytest
pytest
```

## Demo Applications

Try the demo applications:

```bash
git clone https://github.com/tpaviot/pythonocc-demos
cd pythonocc-demos
python3 examples/core_classic_occ_bottle.py
```

## Troubleshooting

### Linux Issues

1. **Library not found errors**:
   ```bash
   sudo ldconfig
   ```

2. **SWIG version mismatch**:
   - Ensure no other SWIG versions are installed
   - Verify installation: `swig -version`

### Windows Issues

1. **DLL not found errors**:
   - Verify PATH environment variable includes OpenCascade bin directory
   - Check Visual Studio installation
   - if you encounter the following error:

2. **DLL not found** for 3rd part libraries:

If it was not done at build time, you can define the OCCT_ESSENTIALS_ROOT path
at run time, by setting the env var:

```batch
setx OCCT_ESSENTIALS_ROOT "%CASROOT%\win64\vc14\bin"
```

3. **CMake configuration errors**:
   - Ensure all paths use backslashes
   - Verify Visual Studio installation
   - Check environment variables

For more examples and documentation, visit:
- [Demo Repository](https://github.com/tpaviot/pythonocc-demos)
