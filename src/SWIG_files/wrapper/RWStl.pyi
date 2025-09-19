from enum import IntEnum
from typing import overload, NewType, Optional, Tuple

from OCC.Core.Standard import *
from OCC.Core.NCollection import *
from OCC.Core.OSD import *
from OCC.Core.Message import *
from OCC.Core.Poly import *

class rwstl:
    @staticmethod
    def ReadAscii(
        thePath: OSD_Path,
        theProgress: Optional[Message_ProgressRange] = Message_ProgressRange(),
    ) -> Poly_Triangulation: ...
    @staticmethod
    def ReadBinary(
        thePath: OSD_Path,
        theProgress: Optional[Message_ProgressRange] = Message_ProgressRange(),
    ) -> Poly_Triangulation: ...
    @overload
    @staticmethod
    def ReadFile(
        theFile: OSD_Path,
        theProgress: Optional[Message_ProgressRange] = Message_ProgressRange(),
    ) -> Poly_Triangulation: ...
    @overload
    @staticmethod
    def ReadFile(
        theFile: str,
        theProgress: Optional[Message_ProgressRange] = Message_ProgressRange(),
    ) -> Poly_Triangulation: ...
    @overload
    @staticmethod
    def ReadFile(
        theFile: str,
        theMergeAngle: float,
        theProgress: Optional[Message_ProgressRange] = Message_ProgressRange(),
    ) -> Poly_Triangulation: ...
    @staticmethod
    def WriteAscii(
        theMesh: Poly_Triangulation,
        thePath: OSD_Path,
        theProgress: Optional[Message_ProgressRange] = Message_ProgressRange(),
    ) -> bool: ...
    @staticmethod
    def WriteBinary(
        theMesh: Poly_Triangulation,
        thePath: OSD_Path,
        theProgress: Optional[Message_ProgressRange] = Message_ProgressRange(),
    ) -> bool: ...

# classnotwrapped
class RWStl_Reader: ...

# harray1 classes
# harray2 classes
# hsequence classes
