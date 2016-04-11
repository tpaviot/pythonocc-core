[![license](https://binstar.org/jf/pythonocc-core/badges/license.svg)](https://github.com/tpaviot/pythonocc-core/blob/master/LICENSE)
[![Build Status](https://travis-ci.org/tpaviot/pythonocc-core.png?branch=master)](https://travis-ci.org/tpaviot/pythonocc-core)
[![Conda installer](https://anaconda.org/dlr-sc/pythonocc-core/badges/installer/conda.svg)](https://anaconda.org/dlr-sc/pythonocc-core)
[![Join the chat at https://gitter.im/tpaviot/pythonocc-core](https://badges.gitter.im/Join%20Chat.svg)](https://gitter.im/tpaviot/pythonocc-core?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)

pythonocc-core
--------------

what is pythonocc?
------------------

pythonocc is a python library whose purpose is to provide 3D modeling
features. It is intended to developers who aim at developing
CAD/PDM/PLM applications.

Latest release : [pythonocc-core 0.16.4 (april 2016)](https://github.com/tpaviot/pythonocc-core/releases/tag/0.16.4)

How to quicky download/install binaries ?
-----------------------------------------

pythonocc provides precompiled [conda packages](https://anaconda.org/DLR-SC/pythonocc-core). 
This will get you up & running in minutes whether you run win32/win64/linux64/osx64:

```bash
conda install -c https://conda.anaconda.org/dlr-sc pythonocc-core
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
  * Travic-CI
       https://travis-ci.org/tpaviot/pythonocc-core
  * twitter
       https://twitter.com/pythonocc

how do __oce__ and __pythonocc__ relate?
----------------------------------------

The basis of pythonocc is python wrapper for the [oce C++ library / CAD kernel]
(https://github.com/tpaviot/oce), aka pythonocc-core.
pythonocc-core version number correspond to oce library releases its wrapping.
 
For example; the current pythonocc-core release, 0.16.x, requires [OCE
 0.16.x](https://github.com/tpaviot/oce/releases) release. Here, the __Major__ 
 version name of either OCE or pythonocc-core release is __0__, the __Minor__ 
 version is __16__ and the __Patch__ version is __x__. pythonocc-core can be 
 built with any OCE version that has a corresponding __Major__ and __Minor__ version 
 number. That is pythonocc-core 0.16.0 can be built with OCE 0.16.1 and visa 
 versa.   


License
-------

You can redistribute it and/or modify it under the terms of the GNU Lesser
General Public License version 3 as published by the Free Software Foundation.
