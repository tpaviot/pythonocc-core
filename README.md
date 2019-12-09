[![Azure Build Status](https://dev.azure.com/tpaviot/pythonocc-core/_apis/build/status/tpaviot.pythonocc-core?branchName=master)](https://dev.azure.com/tpaviot/pythonocc-core/_build/latest?definitionId=1?branchName=master)
[![Conda installer](https://anaconda.org/pythonocc/pythonocc-core/badges/installer/conda.svg)](https://anaconda.org/pythonocc/pythonocc-core)
[![Downloads Badge](https://anaconda.org/pythonocc/pythonocc-core/badges/downloads.svg)](https://anaconda.org/pythonocc/pythonocc-core)
[![Language grade: Python](https://img.shields.io/lgtm/grade/python/g/tpaviot/pythonocc-core.svg?logo=lgtm&logoWidth=18)](https://lgtm.com/projects/g/tpaviot/pythonocc-core/context:python)
[![Codacy Badge](https://api.codacy.com/project/badge/Grade/67c121324b8d4f37bc27029464c87020)](https://www.codacy.com/app/tpaviot/pythonocc-core?utm_source=github.com&amp;utm_medium=referral&amp;utm_content=tpaviot/pythonocc-core&amp;utm_campaign=Badge_Grade)
[![Join the chat at https://gitter.im/tpaviot/pythonocc-core](https://badges.gitter.im/Join%20Chat.svg)](https://gitter.im/tpaviot/pythonocc-core?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)

pythonocc-core
--------------

About
-----

pythonocc is a python package whose purpose is to provide 3D modeling
features. It is intended to developers who aim at developing
CAD/PDM/PLM applications.

Latest release : [pythonocc-core 7.4.0beta2 (december 2019)](https://github.com/tpaviot/pythonocc-core/releases/tag/7.4.0beta2)


Build from source
-----------------

Read the [INSTALL.md](https://github.com/tpaviot/pythonocc-core/blob/master/INSTALL.md) instructions where you find compilation instructions for all platforms.

Download/install binaries for Linux/OSX/Windows
-----------------------------------------------

pythonocc provides precompiled [conda packages](https://anaconda.org/pythonocc/pythonocc-core) (they depend on third part libraries made available from the dlr-sc and conda-forge conda channels) for python 3.5, 3.6 and 3.7. This will get you up and running in minutes whether you run win32/win64/linux64/osx64. Here is an example for python 3.7:

```bash
# first create an environment
conda create --name=whatever-name python=3.7
source activate whatever-name
conda install -c dlr-sc -c pythonocc pythonocc-core=7.4.0beta2
```

Conda packages are provided for python 3.6 and 3.7.

Other pythonocc related resources
---------------------------------

* Demos: python examples, as well as jupyter notebooks https://github.com/tpaviot/pythonocc-demos

* Docker, binderhub: docker and online jupyter notebooks https://github.com/tpaviot/pythonocc-binderhub

* Documentation: https://github.com/tpaviot/pythonocc-documentation

Online resources for development
--------------------------------

We use the following online resources:

* Homepage: http://www.pythonocc.org

* Mailing list: http://groups.google.com/group/pythonocc

* Twitter : https://twitter.com/pythonocc

* LGTM code quality review: https://lgtm.com/projects/g/tpaviot/honocc-core/

* Codacy quality checker: https://app.codacy.com/app/tpaviot/pythonocc-core

pythonocc, oce and opencascade dependencies
-------------------------------------------

From release 7.4.0, pythonocc-core depends on the official OpenCascade-7.4.0 library (https://dev.opencascade.org)

Former releases rely on oce (OpenCascade Community Edition), available at  
[oce C++ library / CAD kernel](https://github.com/tpaviot/oce).

License
-------

You can redistribute it and/or modify it under the terms of the GNU Lesser
General Public License version 3 as published by the Free Software Foundation.
