from enum import IntEnum
from typing import overload, NewType, Optional, Tuple

from OCC.Core.Standard import *
from OCC.Core.NCollection import *
from OCC.Core.TDocStd import *

class AppStd_Application(TDocStd_Application):
    def DumpJson(self, depth: Optional[int] = -1) -> str: ...
    def ResourcesName(self) -> str: ...

# harray1 classes
# harray2 classes
# hsequence classes
