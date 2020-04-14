from typing import overload, NewType, Optional, Tuple

from OCC.Core.XmlMNaming import *
from OCC.Core.Standard import *
from OCC.Core.NCollection import *
from OCC.Core.XmlMDF import *
from OCC.Core.Message import *
from OCC.Core.TopTools import *
from OCC.Core.TDF import *
from OCC.Core.XmlObjMgt import *
from OCC.Core.TopAbs import *
from OCC.Core.TopoDS import *


class XmlMNaming:
	@staticmethod
	def AddDrivers(self, aDriverTable: XmlMDF_ADriverTable, aMessageDriver: Message_Messenger) -> None: ...

class XmlMNaming_NamedShapeDriver(XmlMDF_ADriver):
	def __init__(self, aMessageDriver: Message_Messenger) -> None: ...
	def Clear(self) -> None: ...
	def GetShapesLocations(self) -> TopTools_LocationSet: ...
	def NewEmpty(self) -> TDF_Attribute: ...
	def Paste(self, theSource: XmlObjMgt_Persistent, theTarget: TDF_Attribute, theRelocTable: XmlObjMgt_RRelocationTable) -> bool: ...
	def Paste(self, theSource: TDF_Attribute, theTarget: XmlObjMgt_Persistent, theRelocTable: XmlObjMgt_SRelocationTable) -> None: ...
	def ReadShapeSection(self, anElement: XmlObjMgt_Element) -> None: ...
	def WriteShapeSection(self, anElement: XmlObjMgt_Element) -> None: ...

class XmlMNaming_NamingDriver(XmlMDF_ADriver):
	def __init__(self, aMessageDriver: Message_Messenger) -> None: ...
	def NewEmpty(self) -> TDF_Attribute: ...
	def Paste(self, theSource: XmlObjMgt_Persistent, theTarget: TDF_Attribute, theRelocTable: XmlObjMgt_RRelocationTable) -> bool: ...
	def Paste(self, theSource: TDF_Attribute, theTarget: XmlObjMgt_Persistent, theRelocTable: XmlObjMgt_SRelocationTable) -> None: ...

class XmlMNaming_Shape1:
	@overload
	def __init__(self, Doc: XmlObjMgt_Document) -> None: ...
	@overload
	def __init__(self, E: XmlObjMgt_Element) -> None: ...
	def Element(self) -> XmlObjMgt_Element: ...
	def Element(self) -> XmlObjMgt_Element: ...
	def LocId(self) -> int: ...
	def Orientation(self) -> TopAbs_Orientation: ...
	def SetShape(self, ID: int, LocID: int, Orient: TopAbs_Orientation) -> None: ...
	def SetVertex(self, theVertex: TopoDS_Shape) -> None: ...
	def TShapeId(self) -> int: ...