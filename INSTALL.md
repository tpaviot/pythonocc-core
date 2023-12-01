Build pythonocc-7.7.2 from scratch on a fresh Ubuntu 22.04 install
------------------------------------------------------------------

Requirements
------------

pythonOCC-7.7.2 needs the following libraries or programs to be installed before you
can compile/use it:

*   the python programming language (<https://www.python.org>). Python 3.8 or more is required.
*   OpenCascade 7.7.2 (<https://dev.opencascade.org>)
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
Download/extract version 7.7.2 https://git.dev.opencascade.org/gitweb/?p=occt.git;a=snapshot;h=cec1ecd0c9f3b3d2572c47035d11949e8dfa85e2;sf=tgz

```bash
wget -o occt-7.7.2.tgz https://git.dev.opencascade.org/gitweb/?p=occt.git;a=snapshot;h=cec1ecd0c9f3b3d2572c47035d11949e8dfa85e2;sf=tgz
tar -zxvf occt-7.7.2.tgz
```

Prepare the build stage:
```bash
cd occt-cec1ecd
mkdir cmake-build
cd cmake-build
```

Choose an installation destination. Default is /usr/local, but it is better to set up
an other folder so that it's easier to work with concurrent versions.
```bash
$ cmake -DINSTALL_DIR=/opt/build/occt772 -DBUILD_RELEASE_DISABLE_EXCEPTIONS=OFF ..
```
then
```bash
make -j4
sudo make install
```
and finally add the libraries to the system
```bash
echo "/opt/build/occt772/lib" >> /etc/ld.so.conf.d/occt.conf
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
 -DOCCT_INCLUDE_DIR=/opt/build/occt772/include/opencascade \
 -DOCCT_LIBRARY_DIR=/opt/build/occt772/lib \
 -DPYTHONOCC_BUILD_TYPE=Release \
 -DPYTHONOCC_INSTALL_DIRECTORY=<PATH-TO-INSTALL> \
  ..

RUN make -j4 && make install 
```

If `PYTHONOCC_INSTALL_DIRECTORY` is unset, it will be installed to `site-packages/OCC`.

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

additional dependencies
-----------------------
Additional python packages are required if you want to benefit from all pythonocc features.
```
pip install svgwrite numpy matplotlib PyQt5
```

test
----
In order to check that everything is ok, run the pythonocc unittest suite:

```bash
cd ../test
python run_tests.py
```

demos
-----
Download/test demos available at <https://github.com/tpaviot/pythonocc-demos>
