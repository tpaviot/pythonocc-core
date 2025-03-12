from enum import IntEnum
from typing import overload, NewType, Optional, Tuple

from OCC.Core.Standard import *
from OCC.Core.NCollection import *
from OCC.Core.Transfer import *
from OCC.Core.Interface import *
from OCC.Core.StepRepr import *
from OCC.Core.gp import *
from OCC.Core.StepData import *
from OCC.Core.StepGeom import *
from OCC.Core.Message import *
from OCC.Core.TopoDS import *
from OCC.Core.StepShape import *
from OCC.Core.TopTools import *
from OCC.Core.XSControl import *
from OCC.Core.IFSelect import *
from OCC.Core.TColStd import *
from OCC.Core.DE import *


class STEPControl_StepModelType(IntEnum):
    STEPControl_AsIs: int = ...
    STEPControl_ManifoldSolidBrep: int = ...
    STEPControl_BrepWithVoids: int = ...
    STEPControl_FacetedBrep: int = ...
    STEPControl_FacetedBrepAndBrepWithVoids: int = ...
    STEPControl_ShellBasedSurfaceModel: int = ...
    STEPControl_GeometricCurveSet: int = ...
    STEPControl_Hybrid: int = ...

STEPControl_AsIs = STEPControl_StepModelType.STEPControl_AsIs
STEPControl_ManifoldSolidBrep = STEPControl_StepModelType.STEPControl_ManifoldSolidBrep
STEPControl_BrepWithVoids = STEPControl_StepModelType.STEPControl_BrepWithVoids
STEPControl_FacetedBrep = STEPControl_StepModelType.STEPControl_FacetedBrep
STEPControl_FacetedBrepAndBrepWithVoids = STEPControl_StepModelType.STEPControl_FacetedBrepAndBrepWithVoids
STEPControl_ShellBasedSurfaceModel = STEPControl_StepModelType.STEPControl_ShellBasedSurfaceModel
STEPControl_GeometricCurveSet = STEPControl_StepModelType.STEPControl_GeometricCurveSet
STEPControl_Hybrid = STEPControl_StepModelType.STEPControl_Hybrid

class STEPControl_ActorRead(Transfer_ActorOfTransientProcess):
    def __init__(self, theModel: Interface_InterfaceModel) -> None: ...
    def ComputeSRRWT(self, SRR: StepRepr_RepresentationRelationship, TP: Transfer_TransientProcess, Trsf: gp_Trsf, theLocalFactors: Optional[StepData_Factors] = StepData_Factors()) -> bool: ...
    def ComputeTransformation(self, Origin: StepGeom_Axis2Placement3d, Target: StepGeom_Axis2Placement3d, OrigContext: StepRepr_Representation, TargContext: StepRepr_Representation, TP: Transfer_TransientProcess, Trsf: gp_Trsf, theLocalFactors: Optional[StepData_Factors] = StepData_Factors()) -> bool: ...
    def PrepareUnits(self, rep: StepRepr_Representation, TP: Transfer_TransientProcess, theLocalFactors: StepData_Factors) -> None: ...
    def Recognize(self, start: Standard_Transient) -> bool: ...
    def ResetUnits(self, theModel: StepData_StepModel, theLocalFactors: StepData_Factors) -> None: ...
    def SetModel(self, theModel: Interface_InterfaceModel) -> None: ...
    def Transfer(self, start: Standard_Transient, TP: Transfer_TransientProcess, theProgress: Optional[Message_ProgressRange] = Message_ProgressRange()) -> Transfer_Binder: ...
    def TransferShape(self, start: Standard_Transient, TP: Transfer_TransientProcess, theLocalFactors: Optional[StepData_Factors] = StepData_Factors(), isManifold: Optional[bool] = True, theUseTrsf: Optional[bool] = False, theProgress: Optional[Message_ProgressRange] = Message_ProgressRange()) -> Transfer_Binder: ...

class STEPControl_ActorWrite(Transfer_ActorOfFinderProcess):
    def __init__(self) -> None: ...
    def GroupMode(self) -> int: ...
    def IsAssembly(self, theModel: StepData_StepModel, S: TopoDS_Shape) -> bool: ...
    def Mode(self) -> STEPControl_StepModelType: ...
    def Recognize(self, start: Transfer_Finder) -> bool: ...
    def SetGroupMode(self, mode: int) -> None: ...
    def SetMode(self, M: STEPControl_StepModelType) -> None: ...
    def SetTolerance(self, Tol: float) -> None: ...
    def Transfer(self, start: Transfer_Finder, FP: Transfer_FinderProcess, theProgress: Optional[Message_ProgressRange] = Message_ProgressRange()) -> Transfer_Binder: ...
    def TransferCompound(self, start: Transfer_Finder, SDR: StepShape_ShapeDefinitionRepresentation, FP: Transfer_FinderProcess, theLocalFactors: Optional[StepData_Factors] = StepData_Factors(), theProgress: Optional[Message_ProgressRange] = Message_ProgressRange()) -> Transfer_Binder: ...
    def TransferShape(self, start: Transfer_Finder, SDR: StepShape_ShapeDefinitionRepresentation, FP: Transfer_FinderProcess, theLocalFactors: Optional[StepData_Factors] = StepData_Factors(), shapeGroup: Optional[TopTools_HSequenceOfShape] = None, isManifold: Optional[bool] = True, theProgress: Optional[Message_ProgressRange] = Message_ProgressRange()) -> Transfer_Binder: ...
    def TransferSubShape(self, start: Transfer_Finder, SDR: StepShape_ShapeDefinitionRepresentation, AX1: StepGeom_Axis2Placement3d, FP: Transfer_FinderProcess, theLocalFactors: Optional[StepData_Factors] = StepData_Factors(), shapeGroup: Optional[TopTools_HSequenceOfShape] = None, isManifold: Optional[bool] = True, theProgress: Optional[Message_ProgressRange] = Message_ProgressRange()) -> Transfer_Binder: ...

class STEPControl_Controller(XSControl_Controller):
    def __init__(self) -> None: ...
    def ActorRead(self, theModel: Interface_InterfaceModel) -> Transfer_ActorOfTransientProcess: ...
    def Customise(self, WS: XSControl_WorkSession) -> None: ...
    @staticmethod
    def Init() -> bool: ...
    def NewModel(self) -> Interface_InterfaceModel: ...
    def TransferWriteShape(self, shape: TopoDS_Shape, FP: Transfer_FinderProcess, model: Interface_InterfaceModel, modetrans: Optional[int] = 0, theProgress: Optional[Message_ProgressRange] = Message_ProgressRange()) -> IFSelect_ReturnStatus: ...

class STEPControl_Reader(XSControl_Reader):
    @overload
    def __init__(self) -> None: ...
    @overload
    def __init__(self, WS: XSControl_WorkSession, scratch: Optional[bool] = True) -> None: ...
    def FileUnits(self, theUnitLengthNames: TColStd_SequenceOfAsciiString, theUnitAngleNames: TColStd_SequenceOfAsciiString, theUnitSolidAngleNames: TColStd_SequenceOfAsciiString) -> None: ...
    def NbRootsForTransfer(self) -> int: ...
    @overload
    def ReadFile(self, filename: str) -> IFSelect_ReturnStatus: ...
    @overload
    def ReadStream(self, theName: str, theIStream: str) -> IFSelect_ReturnStatus: ...
    def SetSystemLengthUnit(self, theLengthUnit: float) -> None: ...
    def StepModel(self) -> StepData_StepModel: ...
    def SystemLengthUnit(self) -> float: ...
    def TransferRoot(self, num: Optional[int] = 1, theProgress: Optional[Message_ProgressRange] = Message_ProgressRange()) -> bool: ...

class STEPControl_Writer:
    @overload
    def __init__(self) -> None: ...
    @overload
    def __init__(self, WS: XSControl_WorkSession, scratch: Optional[bool] = True) -> None: ...
    def GetShapeFixParameters(self) -> False: ...
    def GetShapeProcessFlags(self) -> False: ...
    def Model(self, newone: Optional[bool] = False) -> StepData_StepModel: ...
    def PrintStatsTransfer(self, what: int, mode: Optional[int] = 0) -> None: ...
    def SetTolerance(self, Tol: float) -> None: ...
    def SetWS(self, WS: XSControl_WorkSession, scratch: Optional[bool] = True) -> None: ...
    @overload
    def Transfer(self, sh: TopoDS_Shape, mode: STEPControl_StepModelType, compgraph: Optional[bool] = True, theProgress: Optional[Message_ProgressRange] = Message_ProgressRange()) -> IFSelect_ReturnStatus: ...
    def UnsetTolerance(self) -> None: ...
    def WS(self) -> XSControl_WorkSession: ...
    def Write(self, theFileName: str) -> IFSelect_ReturnStatus: ...
    def WriteStream(self) -> Tuple[IFSelect_ReturnStatus, str]: ...

# harray1 classes
# harray2 classes
# hsequence classes

