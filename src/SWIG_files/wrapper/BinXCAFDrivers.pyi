from enum import IntEnum
from typing import overload, NewType, Optional, Tuple

from OCC.Core.Standard import *
from OCC.Core.NCollection import *
from OCC.Core.Message import *
from OCC.Core.BinMDF import *
from OCC.Core.TDocStd import *
from OCC.Core.BinDrivers import *


class binxcafdrivers:
	@staticmethod
	def AttributeDrivers(MsgDrv: Message_Messenger) -> BinMDF_ADriverTable: ...
	@staticmethod
	def DefineFormat(theApp: TDocStd_Application) -> None: ...
	@staticmethod
	def Factory(theGUID: Standard_GUID) -> Standard_Transient: ...

class BinXCAFDrivers_DocumentRetrievalDriver(BinDrivers_DocumentRetrievalDriver):
	def __init__(self) -> None: ...
	def AttributeDrivers(self, theMsgDriver: Message_Messenger) -> BinMDF_ADriverTable: ...

class BinXCAFDrivers_DocumentStorageDriver(BinDrivers_DocumentStorageDriver):
	def __init__(self) -> None: ...
	def AttributeDrivers(self, theMsgDriver: Message_Messenger) -> BinMDF_ADriverTable: ...

# harray1 classes
# harray2 classes
# hsequence classes

binxcafdrivers_AttributeDrivers = binxcafdrivers.AttributeDrivers
binxcafdrivers_DefineFormat = binxcafdrivers.DefineFormat
binxcafdrivers_Factory = binxcafdrivers.Factory
