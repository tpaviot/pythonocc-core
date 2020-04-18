from enum import IntEnum
from typing import overload, NewType, Optional, Tuple

from OCC.Core.Standard import *
from OCC.Core.NCollection import *

FSD_BStream = NewType('FSD_BStream', FILE)
#the following typedef cannot be wrapped as is
FSD_FStream = NewType('FSD_FStream', Any)

#classnotwrapped
class FSD_Base64Decoder: ...

#classnotwrapped
class FSD_File: ...

#classnotwrapped
class FSD_BinaryFile: ...

#classnotwrapped
class FSD_CmpFile: ...

#classnotwrapped
class FSD_FileHeader: ...

# harray1 classes
# harray2 classes
# hsequence classes

