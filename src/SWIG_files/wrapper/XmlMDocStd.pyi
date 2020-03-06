from typing import NewType, Optional, Tuple

from OCC.Core.XmlMDocStd import *
from OCC.Core.Standard import *
from OCC.Core.NCollection import *
from OCC.Core.XmlMDF import *
from OCC.Core.Message import *
from OCC.Core.TDF import *
from OCC.Core.XmlObjMgt import *


class XmlMDocStd:
	@staticmethod
	def AddDrivers(self, aDriverTable: XmlMDF_ADriverTable, theMessageDriver: Message_Messenger) -> None: ...

class XmlMDocStd_XLinkDriver(XmlMDF_ADriver):
	def __init__(self, theMessageDriver: Message_Messenger) -> None: ...
	def NewEmpty(self) -> TDF_Attribute: ...
	def Paste(self, Source: XmlObjMgt_Persistent, Target: TDF_Attribute, RelocTable: XmlObjMgt_RRelocationTable) -> bool: ...
	def Paste(self, Source: TDF_Attribute, Target: XmlObjMgt_Persistent, RelocTable: XmlObjMgt_SRelocationTable) -> None: ...
