from enum import IntEnum
from typing import overload, NewType, Optional, Tuple

from OCC.Core.Standard import *
from OCC.Core.NCollection import *
from OCC.Core.TopoDS import *


class stlapi:
	@staticmethod
	def Read(theShape: TopoDS_Shape, aFile: str) -> bool: ...
	@staticmethod
	def Write(theShape: TopoDS_Shape, theFile: str, theAsciiMode: Optional[bool] = True) -> bool: ...

class StlAPI_Reader:
	def Read(self, theShape: TopoDS_Shape, theFileName: str) -> bool: ...

class StlAPI_Writer:
	def __init__(self) -> None: ...
	def GetASCIIMode(self) -> bool: ...
	def SetASCIIMode(self, value: bool) -> None: ...
	def Write(self, theShape: TopoDS_Shape, theFileName: str) -> bool: ...

# harray1 classes
# harray2 classes
# hsequence classes

stlapi_Read = stlapi.Read
stlapi_Write = stlapi.Write
