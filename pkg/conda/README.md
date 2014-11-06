## Packaging with conda

pythonocc depends on one of the largest Open Source code bases out there, [OpenCasCADE](http://opencascade.org)
specifically, the [OpenCasCADE Community Edition](https://github.com/tpaviot/oce).

[conda](http://conda.pydata.org/docs/) is a solution to install pythonOCC and *all* of its dependencies in about 5 minutes. 

## How is this done?

First, decide if you prefer the complete [anaconda](http://docs.continuum.io/anaconda/index.html#packages-included-in-anaconda)
that comes with many great modules readily installed or a lighter handed approach (prefered), by installing [miniconda](http://conda.pydata.org/miniconda.html). This is accomplished through the following command on linux:

```
curl 'http://repo.continuum.io/miniconda/Miniconda-3.7.0-Linux-x86_64.sh' > Miniconda.sh
bash Miniconda.sh
```

and for mac osx through  

```
curl 'http://repo.continuum.io/miniconda/Miniconda-3.7.0-MacOSX-x86_64.sh' > Miniconda.sh
bash Miniconda.sh
```

that installs a fresh python interpreter.

As of now, *only* an osx build is completed, as conda support for pythonocc is a work in progress. 
You can install pythonocc-core like so:

```
# add the channel
conda config --add channels http://conda.binstar.org/jf
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
being able to switch to any older version.

## packages at binstar

[binstar](https://binstar.org/) is a site where you can upload and distribute your own repository of packages [here's Jelle's](https://binstar.org/jf/). 
Ownership of packages can be shared, which is great for working together on supporting a package for different platforms. 
Check out available packages by the [maintainer of conda and binstar](https://binstar.org/asmeurer/_list-packages) 
 
If your interested to learn more about conda, check out the [documentation](http://conda.pydata.org/docs). You're also encouraged you to see this [excellent talk]
(http://youtu.be/UaIvrDWrIWM) by [Aaron Meurer](https://github.com/asmeurer).
