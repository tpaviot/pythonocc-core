from enum import IntEnum
from typing import overload, NewType, Optional, Tuple

from OCC.Core.Standard import *
from OCC.Core.NCollection import *
from OCC.Core.Message import *
from OCC.Core.BinMDF import *
from OCC.Core.TDocStd import *
from OCC.Core.TCollection import *
from OCC.Core.BinLDrivers import *
from OCC.Core.Storage import *


class BinDrivers_Marker(IntEnum):
	BinDrivers_ENDATTRLIST: int = ...
	BinDrivers_ENDLABEL: int = ...
BinDrivers_ENDATTRLIST = BinDrivers_Marker.BinDrivers_ENDATTRLIST
BinDrivers_ENDLABEL = BinDrivers_Marker.BinDrivers_ENDLABEL

class bindrivers:
	@staticmethod
	def AttributeDrivers(MsgDrv: Message_Messenger) -> BinMDF_ADriverTable: ...
	@staticmethod
	def DefineFormat(theApp: TDocStd_Application) -> None: ...
	@staticmethod
	def Factory(theGUID: Standard_GUID) -> Standard_Transient: ...
	@staticmethod
	def StorageVersion() -> TCollection_AsciiString: ...

class BinDrivers_DocumentRetrievalDriver(BinLDrivers_DocumentRetrievalDriver):
	def __init__(self) -> None: ...
	def AttributeDrivers(self, theMsgDriver: Message_Messenger) -> BinMDF_ADriverTable: ...
	def Clear(self) -> None: ...

class BinDrivers_DocumentStorageDriver(BinLDrivers_DocumentStorageDriver):
	def __init__(self) -> None: ...
	def AttributeDrivers(self, theMsgDriver: Message_Messenger) -> BinMDF_ADriverTable: ...
	def IsWithTriangles(self) -> bool: ...
	def SetWithTriangles(self, theMessageDriver: Message_Messenger, theWithTriangulation: bool) -> None: ...

# harray1 classes
# harray2 classes
# hsequence classes

bindrivers_AttributeDrivers = bindrivers.AttributeDrivers
bindrivers_DefineFormat = bindrivers.DefineFormat
bindrivers_Factory = bindrivers.Factory
bindrivers_StorageVersion = bindrivers.StorageVersion
