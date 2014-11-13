
Build / Install
===============

The build system uses `cmake <http://www.cmake.org>`_ to configure the project. This is a crossplatform solution: steps below are the same for Linux, OSX, or Windows platforms.


Build / install from source
---------------------------

Requirements
^^^^^^^^^^^^

pythonOCC needs the following libraries or programs to be installed before you
can compile/use it :

- the python programming language (http://www.python.org). Python 2.7 and 3.x are officially supported,

- OpenCascade Community Edition 0.16 (https://github.com/tpaviot/oce),

- SWIG 2.0.10 or higher (http://www.swig.org),

- CMake 2.8 or higher (http://www.cmake.org).


pythonocc-core compilation
^^^^^^^^^^^^^^^^^^^^^^^^^^
From the current directory::
    
    $ cd pythonocc-core
    $ mkdir cmake-build
    $ cd cmake-build

The configuration steps uses cmake::
    
    $ cmake ..

By default, cmake looks for oce include headers in /usr/local/include/oce and
libraries in /usr/local/include/lib. If these paths don't match your
installation, you have to set OCE_INCLUDE_PATH and OCE_LIB_PATH
::
    $ cmake -DOCE_INCLUDE_PATH=/your_oce_headers -DOCE_LIB_PATH=/your_lib_dir ..

If you prefer, you can launche the cmake-gui using the following command
::
    $ cmake-gui ..

And launch the build process
::
    $ make

If you have many cpus, you can increase the compilation speed with::
::
    $ make -j$ncpus

According to your machine/os/ncpus, the total compilation time shold be
between 5 to 15 minutes.

Then
::
    $ make install

You may require admin privileges to install
::
    $ sudo make install

test
^^^^
In order to check that everything is ok, run the pythonocc unittest suite:
::
    $ cd ../test
    $ python run_tests.py


You can also run the examples avalaible in the pythonocc-core/examples
directory.

Download / install precompiled binaries
---------------------------------------

* Windows

Binary packages for Windows/py2 and py3 are available at our  `github release page <https://github.com/tpaviot/pythonocc-core/releases>`_.

* Debian

.deb binary packages are available at our  `github release page <https://github.com/tpaviot/pythonocc-core/releases>`_.

* Ubuntu

::

  $ sudo add-apt-repository ppa:freecad-maintainers/oce-release -y
  $ sudo add-apt-repository ppa:tpaviot/pythonocc -y
  $ sudo apt-get update -q
  $ sudo apt-get install pythonocc-core

* OSX

.dmg binary package is available at our  `github release page <https://github.com/tpaviot/pythonocc-core/releases>`_.

Conda packages (OSX only)
-------------------------

* Packaging with conda

pythonocc depends on one of the largest Open Source code bases out there, `OpenCasCADE <http://opencascade.org>`_
specifically, the `OpenCasCADE Community Edition (oce) <https://github.com/tpaviot/oce>`_.

`conda <http://conda.pydata.org/docs/>`_ is a solution to install pythonOCC and *all* of its dependencies in about 5 minutes. 

* How is this done?

First, decide if you prefer the complete`anaconda <http://docs.continuum.io/anaconda/index.html#packages-included-in-anaconda>`_ 
that comes with many great modules readily installed or a lighter handed approach (prefered), by installing `miniconda <http://conda.pydata.org/miniconda.html>`_. This is accomplished through the following command on linux::

  $ curl 'http://repo.continuum.io/miniconda/Miniconda-3.7.0-Linux-x86_64.sh' > Miniconda.sh
  $ bash Miniconda.sh


and for mac osx through::

  $ curl 'http://repo.continuum.io/miniconda/Miniconda-3.7.0-MacOSX-x86_64.sh' > Miniconda.sh
  $ bash Miniconda.sh


that installs a fresh python interpreter.

As of now, *only* an osx build is completed, as conda support for pythonocc is a work in progress. 
You can install pythonocc-core like so::

  # add the channel
  $ conda config --add channels http://conda.binstar.org/jf
  # create a pythonocc environment
  $ conda create -n pythonocc python
  # grab and install pythonocc
  $ conda install pythonocc-core

You're encouraged to install a GUI manager PyQt4 or wxPython::

  $ conda install pyqt


* Environments

Environments are a very important concept, and conda provides more fundamental support for environments than for instance
`virtualenv <http://docs.python-guide.org/en/latest/dev/virtualenvs/>`_. This is again, related to dependencies.
With conda, mutiple version of pythonocc supporting different version of the OCE library can be supported.
By changing your environment, its easy to upgrade your codebase to a newer version of PythonOCC while still 
being able to switch to any older version.

* packages at binstar

`binstar <https://binstar.org>`_ is a site where you can upload and distribute your own repository of packages (here's `Jelle <https://binstar.org/jf/>`_). 
Ownership of packages can be shared, which is great for working together on supporting a package for different platforms. 
Check out available packages by the [maintainer of conda and binstar](https://binstar.org/asmeurer/_list-packages) 
 
* Contribute pythonocc package for your platform

Using conda, you can also compile and upload binaries with others. First install necessary stuff to 
build conda packages::

  $ conda install conda-build
  $ conda install jinja2

The build the package::

  $ cd pkg/conda
  $ conda-build .

* To go further

If your interested to learn more about conda, check out the `documentation <http://conda.pydata.org/docs>`_. You're also encouraged you to see this `excellent talk <http://www.python.org/>`_ by `Aaron Meurer <https://github.com/asmeurer>`_.
