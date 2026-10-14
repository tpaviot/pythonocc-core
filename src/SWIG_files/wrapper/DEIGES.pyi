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


class DEIGES_ConfigurationNode(DE_ShapeFixConfigurationNode):
    @overload
    def __init__(self) -> None: ...
    @overload
    def __init__(self, theNode: DEIGES_ConfigurationNode) -> None: ...
    def BuildProvider(self) -> DE_Provider: ...
    def CheckContent(self, theBuffer: NCollection_Buffer) -> bool: ...
    def Copy(self) -> DE_ConfigurationNode: ...
    def GetExtensions(self) -> TColStd_ListOfAsciiString: ...
    def GetFormat(self) -> str: ...
    def GetVendor(self) -> str: ...
    def IsExportSupported(self) -> bool: ...
    def IsImportSupported(self) -> bool: ...
    def Load(self, theResource: DE_ConfigurationContext) -> bool: ...
    def Save(self) -> str: ...
    @overload
    @staticmethod
    def DownCast(t: Standard_Transient) -> DEIGES_ConfigurationNode: ...
    @overload
    @staticmethod
    def DownCast(t: None) -> None: ...

class DEIGES_Parameters:
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

    class WriteMode_BRep(IntEnum):
        WriteMode_BRep_Faces = 0
        WriteMode_BRep_BRep = 1

    WriteMode_BRep_Faces = WriteMode_BRep.WriteMode_BRep_Faces
    WriteMode_BRep_BRep = WriteMode_BRep.WriteMode_BRep_BRep

    class WriteMode_ConvertSurface(IntEnum):
        WriteMode_ConvertSurface_Off = 0
        WriteMode_ConvertSurface_On = 1

    WriteMode_ConvertSurface_Off = WriteMode_ConvertSurface.WriteMode_ConvertSurface_Off
    WriteMode_ConvertSurface_On = WriteMode_ConvertSurface.WriteMode_ConvertSurface_On

    class WriteMode_PrecisionMode(IntEnum):
        WriteMode_PrecisionMode_Least = ...
        WriteMode_PrecisionMode_Average = 0
        WriteMode_PrecisionMode_Greatest = 1
        WriteMode_PrecisionMode_Session = 2

    WriteMode_PrecisionMode_Least = WriteMode_PrecisionMode.WriteMode_PrecisionMode_Least
    WriteMode_PrecisionMode_Average = WriteMode_PrecisionMode.WriteMode_PrecisionMode_Average
    WriteMode_PrecisionMode_Greatest = WriteMode_PrecisionMode.WriteMode_PrecisionMode_Greatest
    WriteMode_PrecisionMode_Session = WriteMode_PrecisionMode.WriteMode_PrecisionMode_Session

    class WriteMode_PlaneMode(IntEnum):
        WriteMode_PlaneMode_Plane = 0
        WriteMode_PlaneMode_BSpline = 1

    WriteMode_PlaneMode_Plane = WriteMode_PlaneMode.WriteMode_PlaneMode_Plane
    WriteMode_PlaneMode_BSpline = WriteMode_PlaneMode.WriteMode_PlaneMode_BSpline
    def __init__(self) -> None: ...
    @staticmethod
    def GetDefaultShapeFixParameters() -> DE_ShapeFixParameters: ...
    def InitFromStatic(self) -> None: ...
    def Reset(self) -> None: ...

class DEIGES_Provider(DE_Provider):
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
    def DownCast(t: Standard_Transient) -> DEIGES_Provider: ...
    @overload
    @staticmethod
    def DownCast(t: None) -> None: ...

# harray1 classes
# harray2 classes
# hsequence classes

