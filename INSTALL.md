Overview
--------

pythonOCC is a python library whose purpose is to provide 3D modeling features.
It's intended to
developers who aim at developing a complete CAD/PLM application, and to
engineers who want to have a total control over the data during complex design
activities.

About this document
-------------------

This file explains how to build pythonocc-core from source on Windows, Linux or
MacOSX platforms.

Requirements
------------

pythonOCC needs the following libraries or programs to be installed before you
can compile/use it:

*   the python programming language (<https://www.python.org>). Python 3.x is required.

*   OpenCascade 7.7.0 (<https://dev.opencascade.org>)

    IMPORTANT: OpenCASCADE has to be compiled using flag -D BUILD_RELEASE_DISABLE_EXCEPTIONS=OFF

*   SWIG 4.0.2 (<https://www.swig.org>)

Optional
--------

If you want to benefit from a 3D graphical rendering, you will need a GUI manager, e.g. PyQt, PySide or wxPython.

Create a local copy of the repository
-------------------------------------

```bash
git clone https://github.com/tpaviot/pythonocc-core.git
```

pythonocc-core compilation
--------------------------

```bash
cd pythonocc-core
mkdir cmake-build
cd cmake-build
```

The configuration steps uses cmake:

```bash
cmake ..
```

By default, cmake looks for oce include headers in /usr/local/include/oce and
libraries in /usr/local/include/lib. If these paths don't match your
installation, you have to set OCE_INCLUDE_PATH and OCE_LIB_PATH:

```bash
cmake -DOCE_INCLUDE_PATH=/your_oce_headers -DOCE_LIB_PATH=/your_lib_dir ..
```

And launch the build process

```bash
make
```

If you have many cpus, you can increase the compilation speed with:

```bash
make -j$ncpus
```

According to your machine/os/ncpus, the total compilation time should be around 15 minutes.

Then

```bash
make install
```

You may require admin privileges to install

```bash
sudo make install
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
