from enum import IntEnum
from typing import overload, NewType, Optional, Tuple

from OCC.Core.Standard import *
from OCC.Core.NCollection import *
from OCC.Core.BinMDF import *
from OCC.Core.Message import *
from OCC.Core.TDF import *
from OCC.Core.BinObjMgt import *


class binmfunction:
	@staticmethod
	def AddDrivers(theDriverTable: BinMDF_ADriverTable, aMsgDrv: Message_Messenger) -> None: ...

class BinMFunction_FunctionDriver(BinMDF_ADriver):
	def __init__(self, theMessageDriver: Message_Messenger) -> None: ...
	def NewEmpty(self) -> TDF_Attribute: ...
	@overload
	def Paste(self, Source: BinObjMgt_Persistent, Target: TDF_Attribute, RelocTable: BinObjMgt_RRelocationTable) -> bool: ...
	@overload
	def Paste(self, Source: TDF_Attribute, Target: BinObjMgt_Persistent, RelocTable: BinObjMgt_SRelocationTable) -> None: ...

class BinMFunction_GraphNodeDriver(BinMDF_ADriver):
	def __init__(self, theMessageDriver: Message_Messenger) -> None: ...
	def NewEmpty(self) -> TDF_Attribute: ...
	@overload
	def Paste(self, Source: BinObjMgt_Persistent, Target: TDF_Attribute, RelocTable: BinObjMgt_RRelocationTable) -> bool: ...
	@overload
	def Paste(self, Source: TDF_Attribute, Target: BinObjMgt_Persistent, RelocTable: BinObjMgt_SRelocationTable) -> None: ...

class BinMFunction_ScopeDriver(BinMDF_ADriver):
	def __init__(self, theMessageDriver: Message_Messenger) -> None: ...
	def NewEmpty(self) -> TDF_Attribute: ...
	@overload
	def Paste(self, Source: BinObjMgt_Persistent, Target: TDF_Attribute, RelocTable: BinObjMgt_RRelocationTable) -> bool: ...
	@overload
	def Paste(self, Source: TDF_Attribute, Target: BinObjMgt_Persistent, RelocTable: BinObjMgt_SRelocationTable) -> None: ...

# harray1 classes
# harray2 classes
# hsequence classes

binmfunction_AddDrivers = binmfunction.AddDrivers
