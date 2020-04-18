from enum import IntEnum
from typing import overload, NewType, Optional, Tuple

from OCC.Core.Standard import *
from OCC.Core.NCollection import *
from OCC.Core.Message import *
from OCC.Core.XmlMDF import *
from OCC.Core.TDocStd import *
from OCC.Core.XmlLDrivers import *
from OCC.Core.XmlObjMgt import *
from OCC.Core.TCollection import *


class xmldrivers:
	@staticmethod
	def AttributeDrivers(theMsgDriver: Message_Messenger) -> XmlMDF_ADriverTable: ...
	@staticmethod
	def DefineFormat(theApp: TDocStd_Application) -> None: ...
	@staticmethod
	def Factory(theGUID: Standard_GUID) -> Standard_Transient: ...

class XmlDrivers_DocumentRetrievalDriver(XmlLDrivers_DocumentRetrievalDriver):
	def __init__(self) -> None: ...
	def AttributeDrivers(self, theMsgDriver: Message_Messenger) -> XmlMDF_ADriverTable: ...
	def ReadShapeSection(self, thePDoc: XmlObjMgt_Element, theMsgDriver: Message_Messenger) -> XmlMDF_ADriver: ...
	def ShapeSetCleaning(self, theDriver: XmlMDF_ADriver) -> None: ...

class XmlDrivers_DocumentStorageDriver(XmlLDrivers_DocumentStorageDriver):
	def __init__(self, theCopyright: TCollection_ExtendedString) -> None: ...
	def AttributeDrivers(self, theMsgDriver: Message_Messenger) -> XmlMDF_ADriverTable: ...
	def WriteShapeSection(self, thePDoc: XmlObjMgt_Element) -> bool: ...

# harray1 classes
# harray2 classes
# hsequence classes

xmldrivers_AttributeDrivers = xmldrivers.AttributeDrivers
xmldrivers_DefineFormat = xmldrivers.DefineFormat
xmldrivers_Factory = xmldrivers.Factory
