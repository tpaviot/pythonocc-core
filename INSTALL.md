Build pythonocc-7.8.1 from scratch on a fresh Ubuntu 22.04 install
------------------------------------------------------------------

Requirements
------------

pythonOCC-7.8.1 needs the following libraries or programs to be installed before you
can compile/use it:

*   the python programming language (<https://www.python.org>). Python 3.9 or more is required.
*   OpenCascade 7.8.1 (<https://dev.opencascade.org>)
*   SWIG 4.1.1 (<https://www.swig.org>)
*   rapidjson (<https://rapidjson.org/>) for Gltf import/export
*   cmake

All the necessary libraries can be downloaded/installed using apt:
```bash
sudo apt-get update
sudo apt-get install -y wget libglu1-mesa-dev libgl1-mesa-dev libxmu-dev libxi-dev build-essential cmake libfreetype6-dev tk-dev python3-dev rapidjson-dev python3 git python3-pip libpcre2-dev
```

Build swig
----------
The required swgi version is 4.1.1. Unfortunately, the ubuntu ppa only provides an outdated 4.0.2 version. If swig 4.1.1 is not available on your machine, you have to download/build by yourself (depends on libpcre2, previously installed):
```bash
wget http://prdownloads.sourceforge.net/swig/swig-4.1.1.tar.gz
tar -zxvf swig-4.1.1.tar.gz
cd swig-4.1.1
./configure && make -j4 && make install
```

Build OpenCascade
-----------------
Download/extract version 7.8.1 https://git.dev.opencascade.org/gitweb/?p=occt.git;a=snapshot;h=bd2a789f15235755ce4d1a3b07379a2e062fdc2e;sf=tgz

```bash
wget -O occt-7.8.1.tgz https://git.dev.opencascade.org/gitweb/?p=occt.git;a=snapshot;h=bd2a789f15235755ce4d1a3b07379a2e062fdc2e;sf=tgz
tar -zxvf occt-7.8.1.tgz
```

Prepare the build stage:
```bash
cd occt-bd2a789
mkdir cmake-build
cd cmake-build
```

Choose an installation destination. Default is /usr/local, but it is better to set up
an other folder so that it's easier to work with concurrent versions.
```bash
$ cmake -DINSTALL_DIR=/opt/occt781 -DBUILD_RELEASE_DISABLE_EXCEPTIONS=OFF ..
```
then
```bash
make -j4
sudo make install
```
and finally add the libraries to the system
```bash
echo "/opt/occt781/lib" >> /etc/ld.so.conf.d/occt.conf
```

Build pythonocc
---------------
First create a local copy of the git repository:
```bash
git clone https://github.com/tpaviot/pythonocc-core.git
```
then
```bash
cd xx/pythonocc-core
mkdir cmake-build && cd cmake-build

RUN cmake \
 -DOCCT_INCLUDE_DIR=/opt/occt781/include/opencascade \
 -DOCCT_LIBRARY_DIR=/opt/occt781/lib \
 -DPYTHONOCC_BUILD_TYPE=Release \
 -DPYTHONOCC_INSTALL_DIRECTORY=<PATH-TO-INSTALL> \
  ..

RUN make -j4 && make install 

RUN  export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/opt/build/occt781/lib
```

If `PYTHONOCC_INSTALL_DIRECTORY` is unset, it will be installed to `site-packages/OCC`. Also add your LD_LIBRARY_PATH in your .bashrc file.

Build pythonocc with numpy support
----------------------------------
numpy enables fast STL file loading. In order to benefit from this feature, you must install the numpy package (including the dev part), and compile pythonocc with:
```bash
 -DPYTHONOCC_MESHDS_NUMPY=ON
```

simple test
-----------
```bash
$ python
>>> from OCC.Core.gp import gp_Pnt
>>> p = gp_Pnt(1., 2., 3.)
>>> p.X()
1.0
>>>
```

For Windows OS users, you may encounter the following error:

```bash
>>> ImportError: DLL load failed while importing _gp:
```

To resolve this issue, you need to import the OCCT DLL directory as follows:

```bash
>>> import os
>>> os.add_dll_directory('path/to/occt/bin')
>>> from OCC.Core.gp import gp_Pnt
```

additional dependencies
-----------------------
Additional python packages are required if you want to benefit from all pythonocc features.
```
pip install svgwrite numpy numpy-stl matplotlib PyQt5
```

test
----
In order to check that everything is ok, run the pythonocc unittest suite:

```bash
pip install pytest
pytest
```

demos
-----
Download/test demos available at <https://github.com/tpaviot/pythonocc-demos>
