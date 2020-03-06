from typing import NewType, Optional, Tuple

from OCC.Core.BinXCAFDrivers import *
from OCC.Core.Standard import *
from OCC.Core.NCollection import *
from OCC.Core.Message import *
from OCC.Core.BinMDF import *
from OCC.Core.TDocStd import *
from OCC.Core.BinDrivers import *


class BinXCAFDrivers:
	@staticmethod
	def AttributeDrivers(self, MsgDrv: Message_Messenger) -> BinMDF_ADriverTable: ...
	@staticmethod
	def DefineFormat(self, theApp: TDocStd_Application) -> None: ...
	@staticmethod
	def Factory(self, theGUID: Standard_GUID) -> Standard_Transient: ...

class BinXCAFDrivers_DocumentRetrievalDriver(BinDrivers_DocumentRetrievalDriver):
	def __init__(self) -> None: ...
	def AttributeDrivers(self, theMsgDriver: Message_Messenger) -> BinMDF_ADriverTable: ...

class BinXCAFDrivers_DocumentStorageDriver(BinDrivers_DocumentStorageDriver):
	def __init__(self) -> None: ...
	def AttributeDrivers(self, theMsgDriver: Message_Messenger) -> BinMDF_ADriverTable: ...
