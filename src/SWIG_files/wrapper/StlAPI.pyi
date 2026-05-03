from enum import IntEnum
from typing import overload, NewType, Optional, Tuple

from OCC.Core.Standard import *
from OCC.Core.NCollection import *
from OCC.Core.TopoDS import *
from OCC.Core.Message import *


class stlapi:
    @staticmethod
    def Read(theShape: TopoDS_Shape, aFile: str) -> bool: ...
    @staticmethod
    def Write(theShape: TopoDS_Shape, theFile: str, theAsciiMode: Optional[bool] = true) -> bool: ...

class StlAPI_Reader:
    @overload
    def Read(self, theShape: TopoDS_Shape, theFileName: str) -> bool: ...
    @overload
    def Read(self, theShape: TopoDS_Shape, theStream: str) -> bool: ...

class StlAPI_Writer:
    def __init__(self) -> None: ...
    def ASCIIMode(self) -> bool: ...
    @overload
    def Write(self, theShape: TopoDS_Shape, theFileName: str, theProgress: Optional[Message_ProgressRange] = Message_ProgressRange()) -> bool: ...
    @overload
    def Write(self, theShape: TopoDS_Shape, theProgress: Optional[Message_ProgressRange] = Message_ProgressRange()) -> Tuple[bool, str]: ...

# harray1 classes
# harray2 classes
# hsequence classes

