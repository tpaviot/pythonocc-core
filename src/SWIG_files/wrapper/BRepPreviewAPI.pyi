from enum import IntEnum
import typing
from typing import Any, overload, NewType, Optional, Tuple

from OCC.Core.Standard import *
from OCC.Core.NCollection import *
from OCC.Core.BRepPrimAPI import *
from OCC.Core.Message import *


class BRepPreviewAPI_MakeBox(BRepPrimAPI_MakeBox):
    def __init__(self) -> None: ...
    def Build(self, theRange: Optional[Message_ProgressRange] = Message_ProgressRange()) -> None: ...

# harray1 classes
# harray2 classes
# hsequence classes

