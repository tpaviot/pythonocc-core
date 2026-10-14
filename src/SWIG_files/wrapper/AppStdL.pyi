from enum import IntEnum
import typing
from typing import Any, overload, NewType, Optional, Tuple

from OCC.Core.Standard import *
from OCC.Core.NCollection import *
from OCC.Core.TDocStd import *


class AppStdL_Application(TDocStd_Application):
    def DumpJson(self, depth: Optional[int]=-1) -> str: ...
    def ResourcesName(self) -> str: ...
    @overload
    @staticmethod
    def DownCast(t: Standard_Transient) -> AppStdL_Application: ...
    @overload
    @staticmethod
    def DownCast(t: None) -> None: ...

# harray1 classes
# harray2 classes
# hsequence classes

