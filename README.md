[![Code style: black](https://img.shields.io/badge/code%20style-black-000000.svg)](https://github.com/psf/black)
[![Azure Build Status](https://dev.azure.com/tpaviot/pythonocc-core/_apis/build/status/tpaviot.pythonocc-core?branchName=master)](https://dev.azure.com/tpaviot/pythonocc-core/_build?definitionId=2)
[![Downloads Badge](https://anaconda.org/conda-forge/pythonocc-core/badges/downloads.svg)](https://anaconda.org/conda-forge/pythonocc-core)
[![Codacy Badge](https://api.codacy.com/project/badge/Grade/67c121324b8d4f37bc27029464c87020)](https://www.codacy.com/app/tpaviot/pythonocc-core?utm_source=github.com&amp;utm_medium=referral&amp;utm_content=tpaviot/pythonocc-core&amp;utm_campaign=Badge_Grade)
[![Binder](http://mybinder.org/badge.svg)](https://mybinder.org/v2/gh/tpaviot/pythonocc-binderhub/7.9.3)
[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.3605364.svg)](https://doi.org/10.5281/zenodo.3605364)

pythonocc-core
--------------

About
-----
pythonocc provides 3D modeling and dataexchange features. It is intended for CAD/PDM/PLM/BIM development. It is based on the OpenCascade Technology modeling kernel.

Latest release: [pythonocc-core 7.9.3 (February 2026)](https://github.com/tpaviot/pythonocc-core/releases/tag/7.9.3)

Features
--------
pythonocc provides the following features:

* Full access from Python to almost all of the thousand OpenCascade C++ classes. Classes and methods/functions share the same names, and, as possible as it can be, the same signature
* 3D visualization from the most famous Python Gui (tkinter, pyQt5 and 6, PySide2 and 6, wxPython)
* 3D visualization in a web browser using threejs or x3dom frameworks
* 3D visualization and work within a jupyter notebook
* Data exchange using most famous formats IGES/STEP/STL/PLY/OBJ/GLTF
* Utility Python classes/methods for Topology operations, inertia computations, and more

Try online at mybinder
----------------------
Click [![Binder](http://mybinder.org/badge.svg)](https://mybinder.org/v2/gh/tpaviot/pythonocc-binderhub/7.9.3) to open a jupyter notebook running the latest pythonocc-core 7.9.3.

Install with conda
------------------
pythonocc provides precompiled [conda packages](https://anaconda.org/conda-forge/pythonocc-core) (they depend on third-party libraries made available from the conda-forge channel) for Python 3.10, 3.11, 3.12, 3.13 and 3.14. This will get you up and running in minutes whether you run win32/win64/linux64/osx64. Here is an example for Python 3.12:

```bash
# first create an environment
conda create --name=pyoccenv python=3.12
conda activate pyoccenv
conda install -c conda-forge pythonocc-core=7.9.3
```

Other conda channels may provide pythonocc-core packages, check [search Anaconda](https://anaconda.org/search?q=pythonocc-core)

Build from source
-----------------
Read the [INSTALL.md](https://github.com/tpaviot/pythonocc-core/blob/master/INSTALL.md) instructions where you find compilation instructions for all platforms.

Use cases
---------
pythonocc is widely used in industrial and academic communities, with over 400 scientific citations covering a broad range of domains [Google Scholar pythonocc page](https://scholar.google.com/scholar?as_vis=1&q=pythonocc&hl=fr&as_sdt=0,5)

Many pythonocc-related projects are available as [github repositories](https://github.com/search?q=pythonocc&type=repositories&p=3)

Cite as
-------
pythonocc is registered as a [Zenodo open access software](https://zenodo.org/record/7471333) and should be cited as:

Paviot, T. (2022). "pythonocc". Zenodo. https://doi.org/10.5281/zenodo.3605364

Support
-------
pythonocc is backed by [meeDIA](https://meedia.ai/pythonocc-en), a french company co-founded by pythonocc's creator and lead maintainer. For professional support inquiries, please contact us at contact@meedia.ai

<a href="https://meedia.ai/pythonocc-en"><img src="https://www.meedia.ai/wp-content/uploads/go-x/u/d3a61d32-b812-4a39-89c8-57fa93df5780/image-320x95.png" width="150" alt="meeDIA logo"></a>

Other pythonocc related resources
---------------------------------
*   Demos: python examples, as well as jupyter notebooks <https://github.com/tpaviot/pythonocc-demos>. A good place to start with pythonocc
*   Docker, binderhub: docker and online jupyter notebooks <https://github.com/tpaviot/pythonocc-binderhub>
*   Documentation: <https://github.com/tpaviot/pythonocc-documentation>
*   <https://github.com/tpaviot/pythonocc-generator> automates the production of SWIG interface files used for the OpenCascade python wrapper

License
-------
pythonocc-core is licensed under the GNU Lesser General Public License version 3 as published by the Free Software Foundation. You can redistribute and/or modify it under the terms of this license.
