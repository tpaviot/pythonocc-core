from enum import IntEnum
from typing import overload, NewType, Optional, Tuple

from OCC.Core.Standard import *
from OCC.Core.NCollection import *
from OCC.Core.TDocStd import *
from OCC.Core.CDM import *


class XCAFApp_Application(TDocStd_Application):
    @staticmethod
    def GetApplication() -> XCAFApp_Application: ...
    def InitDocument(self, aDoc: CDM_Document) -> None: ...
    def ResourcesName(self) -> str: ...

# harray1 classes
# harray2 classes
# hsequence classes

