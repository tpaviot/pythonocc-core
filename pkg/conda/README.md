## pythonocc is not a small project... 
it depends on one of the largest Open Source code bases out there, [OpenCasCADE](http://opencascade.org)
specifically, the [OpenCasCADE Community Edition](https://github.com/tpaviot/oce)

in the past, one of the major hurdles in exploring PythonOCC is that while the library is user friendly in itself,
building the project presented a huge obstacle, ruining the short term experience. 
[conda](http://conda.pydata.org/docs/) solves that problem convincingly 
in that now the time to install PythonOCC and *all* of its dependencies can be installed in about 5 minutes. 
by supporting conda installations we think that we'll lower the threshold to get going with PythonOCC considerable  

## So how is this done?
First, decide if you prefer the complete [anaconda](http://docs.continuum.io/anaconda/index.html#packages-included-in-anaconda)
that comes with many great modules readily installed. I prefer a lighter handed approach, by installing [miniconda](http://conda.pydata.org/miniconda.html)
and installing dependencies as I go. This is accomplished through the following command on linux:

```
curl 'http://repo.continuum.io/miniconda/Miniconda-3.7.0-Linux-x86_64.sh' > Miniconda.sh
bash Miniconda.sh
```

and for mac osx through  

```
curl 'http://repo.continuum.io/miniconda/Miniconda-3.7.0-MacOSX-x86_64.sh' > Miniconda.sh
bash Miniconda.sh
```

that installs a fresh python interpreter

as of now, *only* an osx build is completed, as conda support is a work in progress. 
you can install pythonocc-core like so:

```
# add the channel
conda config --add channels http://conda.binstar.org/jf/osx-64/
# create a pythonocc environment
conda create -n pythonocc python
# grab and install pythonocc
conda install pythonocc-core
# You're encouraged to install a GUI manager PyQt4 or wxPython
conda install pyqt
```

## Environments

Environments are a very important concept, and conda provides more fundamental support for environments than for instance
[virtualenv](http://docs.python-guide.org/en/latest/dev/virtualenvs/). This is again, related to dependencies.
With conda, mutiple version of pythonocc supporting different version of the OCE library can be supported.
By changing your environment, its easy to upgrade your codebase to a newer version of PythonOCC while still 
being able to switch to your rusty, trusty ol' version in no time.

## How we got to adopting conda
Earlier and thanks to the support of the PythonOCC community we've tried to overcome this issue while working with 
[platform depended package managers](http://en.wikipedia.org/wiki/Package_manager) this turned out to be a poor idea... 

It creates fragmentation; on every platform there are a number of package managers and creates a situation where it becomes impossible to support all of these. 
with conda, there is a pythonic cross-platform package manager that works and is a pleasure to use.

Exisiting solutions such as [pip](https://pip.readthedocs.org/en/latest/) are grossfully out of their depth, since it 
cannot deal with installing and managing the *many* dependencies of a sopisticated python module wrapping C++. 
 
[binstar](https://binstar.org/) is a site where you can upload and distribute your own repository of packages [here's mine](https://binstar.org/jf/). 
A cool feature is that ownership of packages can be shared, which is great for working together on supporting a package for different platforms. 
check out available packages by the [maintainer of conda and binstar](https://binstar.org/asmeurer/_list-packages) 
 
If your interested to learn more about conda, check out the [documentation](http://conda.pydata.org/docs) and I encourage you to see this [excellent talk]
(http://youtu.be/UaIvrDWrIWM) by [Aaron Meurer](https://github.com/asmeurer) who does an amazing job of pointing out the importance of the conda project.
