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
from OCC.Core.TColStd import *


class DESTEP_ConfigurationNode(DE_ShapeFixConfigurationNode):
    @overload
    def __init__(self) -> None: ...
    @overload
    def __init__(self, theNode: DESTEP_ConfigurationNode) -> None: ...
    def BuildProvider(self) -> DE_Provider: ...
    def CheckContent(self, theBuffer: NCollection_Buffer) -> bool: ...
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
    def DownCast(t: Standard_Transient) -> DESTEP_ConfigurationNode: ...
    @overload
    @staticmethod
    def DownCast(t: None) -> None: ...

class DESTEP_Parameters:
    class ReadMode_BSplineContinuity(IntEnum):
        ReadMode_BSplineContinuity_C0 = 0
        ReadMode_BSplineContinuity_C1 = 1
        ReadMode_BSplineContinuity_C2 = 2

    ReadMode_BSplineContinuity_C0 = ReadMode_BSplineContinuity.ReadMode_BSplineContinuity_C0
    ReadMode_BSplineContinuity_C1 = ReadMode_BSplineContinuity.ReadMode_BSplineContinuity_C1
    ReadMode_BSplineContinuity_C2 = ReadMode_BSplineContinuity.ReadMode_BSplineContinuity_C2

    class ReadMode_Precision(IntEnum):
        ReadMode_Precision_File = 0
        ReadMode_Precision_User = 1

    ReadMode_Precision_File = ReadMode_Precision.ReadMode_Precision_File
    ReadMode_Precision_User = ReadMode_Precision.ReadMode_Precision_User

    class ReadMode_MaxPrecision(IntEnum):
        ReadMode_MaxPrecision_Preferred = 0
        ReadMode_MaxPrecision_Forced = 1

    ReadMode_MaxPrecision_Preferred = ReadMode_MaxPrecision.ReadMode_MaxPrecision_Preferred
    ReadMode_MaxPrecision_Forced = ReadMode_MaxPrecision.ReadMode_MaxPrecision_Forced

    class ReadMode_SurfaceCurve(IntEnum):
        ReadMode_SurfaceCurve_Default = 0
        ReadMode_SurfaceCurve_2DUse_Preferred = 2
        ReadMode_SurfaceCurve_2DUse_Forced = ...
        ReadMode_SurfaceCurve_3DUse_Preferred = 3
        ReadMode_SurfaceCurve_3DUse_Forced = ...

    ReadMode_SurfaceCurve_Default = ReadMode_SurfaceCurve.ReadMode_SurfaceCurve_Default
    ReadMode_SurfaceCurve_2DUse_Preferred = ReadMode_SurfaceCurve.ReadMode_SurfaceCurve_2DUse_Preferred
    ReadMode_SurfaceCurve_2DUse_Forced = ReadMode_SurfaceCurve.ReadMode_SurfaceCurve_2DUse_Forced
    ReadMode_SurfaceCurve_3DUse_Preferred = ReadMode_SurfaceCurve.ReadMode_SurfaceCurve_3DUse_Preferred
    ReadMode_SurfaceCurve_3DUse_Forced = ReadMode_SurfaceCurve.ReadMode_SurfaceCurve_3DUse_Forced

    class AngleUnitMode(IntEnum):
        AngleUnitMode_File = 0
        AngleUnitMode_Rad = 1
        AngleUnitMode_Deg = 2

    AngleUnitMode_File = AngleUnitMode.AngleUnitMode_File
    AngleUnitMode_Rad = AngleUnitMode.AngleUnitMode_Rad
    AngleUnitMode_Deg = AngleUnitMode.AngleUnitMode_Deg

    class ReadMode_ProductContext(IntEnum):
        ReadMode_ProductContext_All = 1
        ReadMode_ProductContext_Design = 2
        ReadMode_ProductContext_Analysis = 3

    ReadMode_ProductContext_All = ReadMode_ProductContext.ReadMode_ProductContext_All
    ReadMode_ProductContext_Design = ReadMode_ProductContext.ReadMode_ProductContext_Design
    ReadMode_ProductContext_Analysis = ReadMode_ProductContext.ReadMode_ProductContext_Analysis

    class ReadMode_ShapeRepr(IntEnum):
        ReadMode_ShapeRepr_All = 1
        ReadMode_ShapeRepr_ABSR = 2
        ReadMode_ShapeRepr_MSSR = 3
        ReadMode_ShapeRepr_GBSSR = 4
        ReadMode_ShapeRepr_FBSR = 5
        ReadMode_ShapeRepr_EBWSR = 6
        ReadMode_ShapeRepr_GBWSR = 7

    ReadMode_ShapeRepr_All = ReadMode_ShapeRepr.ReadMode_ShapeRepr_All
    ReadMode_ShapeRepr_ABSR = ReadMode_ShapeRepr.ReadMode_ShapeRepr_ABSR
    ReadMode_ShapeRepr_MSSR = ReadMode_ShapeRepr.ReadMode_ShapeRepr_MSSR
    ReadMode_ShapeRepr_GBSSR = ReadMode_ShapeRepr.ReadMode_ShapeRepr_GBSSR
    ReadMode_ShapeRepr_FBSR = ReadMode_ShapeRepr.ReadMode_ShapeRepr_FBSR
    ReadMode_ShapeRepr_EBWSR = ReadMode_ShapeRepr.ReadMode_ShapeRepr_EBWSR
    ReadMode_ShapeRepr_GBWSR = ReadMode_ShapeRepr.ReadMode_ShapeRepr_GBWSR

    class ReadMode_AssemblyLevel(IntEnum):
        ReadMode_AssemblyLevel_All = 1
        ReadMode_AssemblyLevel_Assembly = 2
        ReadMode_AssemblyLevel_Structure = 3
        ReadMode_AssemblyLevel_Shape = 4

    ReadMode_AssemblyLevel_All = ReadMode_AssemblyLevel.ReadMode_AssemblyLevel_All
    ReadMode_AssemblyLevel_Assembly = ReadMode_AssemblyLevel.ReadMode_AssemblyLevel_Assembly
    ReadMode_AssemblyLevel_Structure = ReadMode_AssemblyLevel.ReadMode_AssemblyLevel_Structure
    ReadMode_AssemblyLevel_Shape = ReadMode_AssemblyLevel.ReadMode_AssemblyLevel_Shape

    class RWMode_Tessellated(IntEnum):
        RWMode_Tessellated_Off = 0
        RWMode_Tessellated_On = 1
        RWMode_Tessellated_OnNoBRep = 2

    RWMode_Tessellated_Off = RWMode_Tessellated.RWMode_Tessellated_Off
    RWMode_Tessellated_On = RWMode_Tessellated.RWMode_Tessellated_On
    RWMode_Tessellated_OnNoBRep = RWMode_Tessellated.RWMode_Tessellated_OnNoBRep

    class WriteMode_PrecisionMode(IntEnum):
        WriteMode_PrecisionMode_Least = ...
        WriteMode_PrecisionMode_Average = 0
        WriteMode_PrecisionMode_Greatest = 1
        WriteMode_PrecisionMode_Session = 2

    WriteMode_PrecisionMode_Least = WriteMode_PrecisionMode.WriteMode_PrecisionMode_Least
    WriteMode_PrecisionMode_Average = WriteMode_PrecisionMode.WriteMode_PrecisionMode_Average
    WriteMode_PrecisionMode_Greatest = WriteMode_PrecisionMode.WriteMode_PrecisionMode_Greatest
    WriteMode_PrecisionMode_Session = WriteMode_PrecisionMode.WriteMode_PrecisionMode_Session

    class WriteMode_Assembly(IntEnum):
        WriteMode_Assembly_Off = 0
        WriteMode_Assembly_On = 1
        WriteMode_Assembly_Auto = 2

    WriteMode_Assembly_Off = WriteMode_Assembly.WriteMode_Assembly_Off
    WriteMode_Assembly_On = WriteMode_Assembly.WriteMode_Assembly_On
    WriteMode_Assembly_Auto = WriteMode_Assembly.WriteMode_Assembly_Auto

    class WriteMode_StepSchema(IntEnum):
        WriteMode_StepSchema_AP214CD = 1
        WriteMode_StepSchema_AP214DIS = 2
        WriteMode_StepSchema_AP203 = 3
        WriteMode_StepSchema_AP214IS = 4
        WriteMode_StepSchema_AP242DIS = 5

    WriteMode_StepSchema_AP214CD = WriteMode_StepSchema.WriteMode_StepSchema_AP214CD
    WriteMode_StepSchema_AP214DIS = WriteMode_StepSchema.WriteMode_StepSchema_AP214DIS
    WriteMode_StepSchema_AP203 = WriteMode_StepSchema.WriteMode_StepSchema_AP203
    WriteMode_StepSchema_AP214IS = WriteMode_StepSchema.WriteMode_StepSchema_AP214IS
    WriteMode_StepSchema_AP242DIS = WriteMode_StepSchema.WriteMode_StepSchema_AP242DIS

    class WriteMode_VertexMode(IntEnum):
        WriteMode_VertexMode_OneCompound = 0
        WriteMode_VertexMode_SingleVertex = 1

    WriteMode_VertexMode_OneCompound = WriteMode_VertexMode.WriteMode_VertexMode_OneCompound
    WriteMode_VertexMode_SingleVertex = WriteMode_VertexMode.WriteMode_VertexMode_SingleVertex
    def __init__(self) -> None: ...
    @staticmethod
    def GetDefaultShapeFixParameters() -> DE_ShapeFixParameters: ...
    def GetString(self, theMode: Any) -> str: ...
    def InitFromStatic(self) -> None: ...
    def Reset(self) -> None: ...

class DESTEP_Provider(DE_Provider):
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
    def DownCast(t: Standard_Transient) -> DESTEP_Provider: ...
    @overload
    @staticmethod
    def DownCast(t: None) -> None: ...

# harray1 classes
# harray2 classes
# hsequence classes

