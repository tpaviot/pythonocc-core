from enum import IntEnum
import typing
from typing import Any, overload, NewType, Optional, Tuple

from OCC.Core.Standard import *
from OCC.Core.NCollection import *
from OCC.Core.DE import *
from OCC.Core.TCollection import *
from OCC.Core.TDocStd import *
from OCC.Core.XSControl import *
from OCC.Core.Message import *
from OCC.Core.TopoDS import *
from OCC.Core.RWMesh import *
from OCC.Core.TColStd import *


class DEVRML_ConfigurationNode(DE_ConfigurationNode):
    class WriteMode_WriterVersion(IntEnum):
        WriteMode_WriterVersion_1 = 1
        WriteMode_WriterVersion_2 = 2

    WriteMode_WriterVersion_1 = WriteMode_WriterVersion.WriteMode_WriterVersion_1
    WriteMode_WriterVersion_2 = WriteMode_WriterVersion.WriteMode_WriterVersion_2

    class WriteMode_RepresentationType(IntEnum):
        WriteMode_RepresentationType_Shaded = 0
        WriteMode_RepresentationType_Wireframe = 1
        WriteMode_RepresentationType_Both = 2

    WriteMode_RepresentationType_Shaded = WriteMode_RepresentationType.WriteMode_RepresentationType_Shaded
    WriteMode_RepresentationType_Wireframe = WriteMode_RepresentationType.WriteMode_RepresentationType_Wireframe
    WriteMode_RepresentationType_Both = WriteMode_RepresentationType.WriteMode_RepresentationType_Both
    InternalParameters: DEVRML_ConfigurationNode_Vrml_InternalSection
    @overload
    def __init__(self) -> None: ...
    @overload
    def __init__(self, theNode: DEVRML_ConfigurationNode) -> None: ...
    def BuildProvider(self) -> DE_Provider: ...
    def Copy(self) -> DE_ConfigurationNode: ...
    def GetExtensions(self) -> TColStd_ListOfAsciiString: ...
    def GetFormat(self) -> str: ...
    def GetVendor(self) -> str: ...
    def IsExportSupported(self) -> bool: ...
    def IsImportSupported(self) -> bool: ...
    def IsStreamSupported(self) -> bool: ...
    def Load(self, theResource: DE_ConfigurationContext) -> bool: ...
    def Save(self) -> str: ...
    @overload
    @staticmethod
    def DownCast(t: Standard_Transient) -> DEVRML_ConfigurationNode: ...
    @overload
    @staticmethod
    def DownCast(t: None) -> None: ...

class DEVRML_ConfigurationNode_Vrml_InternalSection:
    ReadFileUnit: float
    ReadFileCoordinateSys: RWMesh_CoordinateSystem
    ReadSystemCoordinateSys: RWMesh_CoordinateSystem
    ReadFillIncomplete: bool
    WriterVersion: DEVRML_ConfigurationNode.WriteMode_WriterVersion
    WriteRepresentationType: DEVRML_ConfigurationNode.WriteMode_RepresentationType

class DEVRML_Provider(DE_Provider):
    @overload
    def __init__(self) -> None: ...
    @overload
    def __init__(self, theNode: DE_ConfigurationNode) -> None: ...
    def GetFormat(self) -> str: ...
    def GetVendor(self) -> str: ...
    @overload
    def Read(self, thePath: str | TCollection_AsciiString, theDocument: TDocStd_Document, theWS: Optional[XSControl_WorkSession], theProgress: Optional[Message_ProgressRange] = Message_ProgressRange()) -> Tuple[bool, Optional[XSControl_WorkSession]]: ...
    @overload
    def Read(self, thePath: str | TCollection_AsciiString, theDocument: TDocStd_Document, theProgress: Optional[Message_ProgressRange] = Message_ProgressRange()) -> bool: ...
    @overload
    def Read(self, thePath: str | TCollection_AsciiString, theShape: TopoDS_Shape, theWS: Optional[XSControl_WorkSession], theProgress: Optional[Message_ProgressRange] = Message_ProgressRange()) -> Tuple[bool, Optional[XSControl_WorkSession]]: ...
    @overload
    def Read(self, thePath: str | TCollection_AsciiString, theShape: TopoDS_Shape, theProgress: Optional[Message_ProgressRange] = Message_ProgressRange()) -> bool: ...
    @overload
    def Write(self, thePath: str | TCollection_AsciiString, theDocument: TDocStd_Document, theWS: Optional[XSControl_WorkSession], theProgress: Optional[Message_ProgressRange] = Message_ProgressRange()) -> Tuple[bool, Optional[XSControl_WorkSession]]: ...
    @overload
    def Write(self, thePath: str | TCollection_AsciiString, theDocument: TDocStd_Document, theProgress: Optional[Message_ProgressRange] = Message_ProgressRange()) -> bool: ...
    @overload
    def Write(self, thePath: str | TCollection_AsciiString, theShape: TopoDS_Shape, theWS: Optional[XSControl_WorkSession], theProgress: Optional[Message_ProgressRange] = Message_ProgressRange()) -> Tuple[bool, Optional[XSControl_WorkSession]]: ...
    @overload
    def Write(self, thePath: str | TCollection_AsciiString, theShape: TopoDS_Shape, theProgress: Optional[Message_ProgressRange] = Message_ProgressRange()) -> bool: ...
    @overload
    @staticmethod
    def DownCast(t: Standard_Transient) -> DEVRML_Provider: ...
    @overload
    @staticmethod
    def DownCast(t: None) -> None: ...

# harray1 classes
# harray2 classes
# hsequence classes

