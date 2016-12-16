[![Travis Build Status](https://travis-ci.org/tpaviot/pythonocc-core.png?branch=master)](https://travis-ci.org/tpaviot/pythonocc-core)
[![Appveyor Build status](https://ci.appveyor.com/api/projects/status/oyeifkxtknl2tslq?svg=true)](https://ci.appveyor.com/project/tpaviot/pythonocc-core)
[![Conda installer](https://anaconda.org/pythonocc/pythonocc-core/badges/installer/conda.svg)](https://anaconda.org/dlr-sc/pythonocc-core)
[![Anaconda-Server Badge](https://anaconda.org/pythonocc/pythonocc-core/badges/version.svg)](https://anaconda.org/pythonocc/pythonocc-core)
[![Join the chat at https://gitter.im/tpaviot/pythonocc-core](https://badges.gitter.im/Join%20Chat.svg)](https://gitter.im/tpaviot/pythonocc-core?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)

pythonocc-core
--------------

what is pythonocc?
------------------

pythonocc is a python library whose purpose is to provide 3D modeling
features. It is intended to developers who aim at developing
CAD/PDM/PLM applications.

Latest release : [pythonocc-core 0.17.1 (december 2016)](https://github.com/tpaviot/pythonocc-core/releases/tag/0.17.1)

How to quicky download/install binaries ?
-----------------------------------------

pythonocc provides precompiled [conda packages](https://anaconda.org/pythonocc/pythonocc-core) (they depend on third part libraries made available from the dlr-sc conda repository).
This will get you up and running in minutes whether you run win32/win64/linux64/osx64:

```bash
# install pythonocc in an environment named `pythonocc` with python 3.5; use python=2 for legacy python 2.7.12
conda create -n pythonocc -c pythonocc -c dlr-sc pythonocc-core==0.17.1 python=3
```

How to compile ?
----------------
You can of course build pythonocc-core by your own. Read the [INSTALL.md](https://github.com/tpaviot/pythonocc-core/blob/master/INSTALL.md) instructions.

Online resources
----------------

We use the following online resources:
  * Homepage
       http://www.pythonocc.org
  * Sources
       https://github.com/tpaviot/pythonocc-core
  * API documentation
       http://api.pythonocc.org
  * Bug tracker
       https://github.com/tpaviot/pythonocc-core/issues
  * Mailing list
       http://groups.google.com/group/pythonocc/about
  * Appveyor
       https://ci.appveyor.com/project/tpaviot/pythonocc-core
  * Travic-CI
       https://travis-ci.org/tpaviot/pythonocc-core
  * Twitter
       https://twitter.com/pythonocc
  * Anaconda cloud
       https://anaconda.org/pythonocc

how do __oce__ and __pythonocc__ relate?
----------------------------------------

The basis of pythonocc is python wrapper for the [oce C++ library / CAD kernel]
(https://github.com/tpaviot/oce), aka pythonocc-core.
pythonocc-core version number correspond to oce library releases its wrapping.
 
For example; the current pythonocc-core release, 0.17.1, requires any of the [OCE
 0.17.x](https://github.com/tpaviot/oce/releases) releases. Here, the __Major__ 
 version name of either OCE or pythonocc-core release is __0__, the __Minor__ 
 version is __17__ and the __Patch__ version is (optionally) __x__. pythonocc-core can be built with any OCE version that has a corresponding __Major__ and __Minor__ version 
 number. For example, pythonocc-core 0.17 can be built with OCE-0.17.1.   


License
-------

You can redistribute it and/or modify it under the terms of the GNU Lesser
General Public License version 3 as published by the Free Software Foundation.
