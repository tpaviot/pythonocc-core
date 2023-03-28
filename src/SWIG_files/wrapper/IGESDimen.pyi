from enum import IntEnum
from typing import overload, NewType, Optional, Tuple

from OCC.Core.Standard import *
from OCC.Core.NCollection import *
from OCC.Core.IGESData import *
from OCC.Core.gp import *
from OCC.Core.TColgp import *
from OCC.Core.TCollection import *
from OCC.Core.TColStd import *
from OCC.Core.Interface import *
from OCC.Core.IGESGraph import *
from OCC.Core.IGESGeom import *


class IGESDimen_Array1OfGeneralNote:
    @overload
    def __init__(self) -> None: ...
    @overload
    def __init__(self, theLower: int, theUpper: int) -> None: ...
    def __getitem__(self, index: int) -> False: ...
    def __setitem__(self, index: int, value: False) -> None: ...
    def __len__(self) -> int: ...
    def __iter__(self) -> Iterator[False]: ...
    def next(self) -> False: ...
    __next__ = next
    def Init(self, theValue: False) -> None: ...
    def Size(self) -> int: ...
    def Length(self) -> int: ...
    def IsEmpty(self) -> bool: ...
    def Lower(self) -> int: ...
    def Upper(self) -> int: ...
    def IsDetectable(self) -> bool: ...
    def IsAllocated(self) -> bool: ...
    def First(self) -> False: ...
    def Last(self) -> False: ...
    def Value(self, theIndex: int) -> False: ...
    def SetValue(self, theIndex: int, theValue: False) -> None: ...

class IGESDimen_Array1OfLeaderArrow:
    @overload
    def __init__(self) -> None: ...
    @overload
    def __init__(self, theLower: int, theUpper: int) -> None: ...
    def __getitem__(self, index: int) -> False: ...
    def __setitem__(self, index: int, value: False) -> None: ...
    def __len__(self) -> int: ...
    def __iter__(self) -> Iterator[False]: ...
    def next(self) -> False: ...
    __next__ = next
    def Init(self, theValue: False) -> None: ...
    def Size(self) -> int: ...
    def Length(self) -> int: ...
    def IsEmpty(self) -> bool: ...
    def Lower(self) -> int: ...
    def Upper(self) -> int: ...
    def IsDetectable(self) -> bool: ...
    def IsAllocated(self) -> bool: ...
    def First(self) -> False: ...
    def Last(self) -> False: ...
    def Value(self, theIndex: int) -> False: ...
    def SetValue(self, theIndex: int, theValue: False) -> None: ...

class igesdimen:
    @staticmethod
    def Init() -> None: ...
    @staticmethod
    def Protocol() -> IGESDimen_Protocol: ...

class IGESDimen_AngularDimension(IGESData_IGESEntity):
    def __init__(self) -> None: ...
    def FirstLeader(self) -> IGESDimen_LeaderArrow: ...
    def FirstWitnessLine(self) -> IGESDimen_WitnessLine: ...
    def HasFirstWitnessLine(self) -> bool: ...
    def HasSecondWitnessLine(self) -> bool: ...
    def Init(self, aNote: IGESDimen_GeneralNote, aLine: IGESDimen_WitnessLine, anotherLine: IGESDimen_WitnessLine, aVertex: gp_XY, aRadius: float, aLeader: IGESDimen_LeaderArrow, anotherLeader: IGESDimen_LeaderArrow) -> None: ...
    def Note(self) -> IGESDimen_GeneralNote: ...
    def Radius(self) -> float: ...
    def SecondLeader(self) -> IGESDimen_LeaderArrow: ...
    def SecondWitnessLine(self) -> IGESDimen_WitnessLine: ...
    def TransformedVertex(self) -> gp_Pnt2d: ...
    def Vertex(self) -> gp_Pnt2d: ...

class IGESDimen_BasicDimension(IGESData_IGESEntity):
    def __init__(self) -> None: ...
    def Init(self, nbPropVal: int, lowerLeft: gp_XY, lowerRight: gp_XY, upperRight: gp_XY, upperLeft: gp_XY) -> None: ...
    def LowerLeft(self) -> gp_Pnt2d: ...
    def LowerRight(self) -> gp_Pnt2d: ...
    def NbPropertyValues(self) -> int: ...
    def UpperLeft(self) -> gp_Pnt2d: ...
    def UpperRight(self) -> gp_Pnt2d: ...

class IGESDimen_CenterLine(IGESData_IGESEntity):
    def __init__(self) -> None: ...
    def Datatype(self) -> int: ...
    def Init(self, aDataType: int, aZdisp: float, dataPnts: TColgp_HArray1OfXY) -> None: ...
    def IsCrossHair(self) -> bool: ...
    def NbPoints(self) -> int: ...
    def Point(self, Index: int) -> gp_Pnt: ...
    def SetCrossHair(self, mode: bool) -> None: ...
    def TransformedPoint(self, Index: int) -> gp_Pnt: ...
    def ZDisplacement(self) -> float: ...

class IGESDimen_CurveDimension(IGESData_IGESEntity):
    def __init__(self) -> None: ...
    def FirstCurve(self) -> IGESData_IGESEntity: ...
    def FirstLeader(self) -> IGESDimen_LeaderArrow: ...
    def FirstWitnessLine(self) -> IGESDimen_WitnessLine: ...
    def HasFirstWitnessLine(self) -> bool: ...
    def HasSecondCurve(self) -> bool: ...
    def HasSecondWitnessLine(self) -> bool: ...
    def Init(self, aNote: IGESDimen_GeneralNote, aCurve: IGESData_IGESEntity, anotherCurve: IGESData_IGESEntity, aLeader: IGESDimen_LeaderArrow, anotherLeader: IGESDimen_LeaderArrow, aLine: IGESDimen_WitnessLine, anotherLine: IGESDimen_WitnessLine) -> None: ...
    def Note(self) -> IGESDimen_GeneralNote: ...
    def SecondCurve(self) -> IGESData_IGESEntity: ...
    def SecondLeader(self) -> IGESDimen_LeaderArrow: ...
    def SecondWitnessLine(self) -> IGESDimen_WitnessLine: ...

class IGESDimen_DiameterDimension(IGESData_IGESEntity):
    def __init__(self) -> None: ...
    def Center(self) -> gp_Pnt2d: ...
    def FirstLeader(self) -> IGESDimen_LeaderArrow: ...
    def HasSecondLeader(self) -> bool: ...
    def Init(self, aNote: IGESDimen_GeneralNote, aLeader: IGESDimen_LeaderArrow, anotherLeader: IGESDimen_LeaderArrow, aCenter: gp_XY) -> None: ...
    def Note(self) -> IGESDimen_GeneralNote: ...
    def SecondLeader(self) -> IGESDimen_LeaderArrow: ...
    def TransformedCenter(self) -> gp_Pnt2d: ...

class IGESDimen_DimensionDisplayData(IGESData_IGESEntity):
    def __init__(self) -> None: ...
    def ArrowHeadOrientation(self) -> int: ...
    def CharacterSet(self) -> int: ...
    def DecimalSymbol(self) -> int: ...
    def DimensionType(self) -> int: ...
    def EndIndex(self, Index: int) -> int: ...
    def Init(self, numProps: int, aDimType: int, aLabelPos: int, aCharSet: int, aString: TCollection_HAsciiString, aSymbol: int, anAng: float, anAlign: int, aLevel: int, aPlace: int, anOrient: int, initVal: float, notes: TColStd_HArray1OfInteger, startInd: TColStd_HArray1OfInteger, endInd: TColStd_HArray1OfInteger) -> None: ...
    def InitialValue(self) -> float: ...
    def LString(self) -> TCollection_HAsciiString: ...
    def LabelPosition(self) -> int: ...
    def NbPropertyValues(self) -> int: ...
    def NbSupplementaryNotes(self) -> int: ...
    def StartIndex(self, Index: int) -> int: ...
    def SupplementaryNote(self, Index: int) -> int: ...
    def TextAlignment(self) -> int: ...
    def TextLevel(self) -> int: ...
    def TextPlacement(self) -> int: ...
    def WitnessLineAngle(self) -> float: ...

class IGESDimen_DimensionTolerance(IGESData_IGESEntity):
    def __init__(self) -> None: ...
    def FractionFlag(self) -> int: ...
    def Init(self, nbPropVal: int, aSecTolFlag: int, aTolType: int, aTolPlaceFlag: int, anUpperTol: float, aLowerTol: float, aSignFlag: bool, aFracFlag: int, aPrecision: int) -> None: ...
    def LowerTolerance(self) -> float: ...
    def NbPropertyValues(self) -> int: ...
    def Precision(self) -> int: ...
    def SecondaryToleranceFlag(self) -> int: ...
    def SignSuppressionFlag(self) -> bool: ...
    def TolerancePlacementFlag(self) -> int: ...
    def ToleranceType(self) -> int: ...
    def UpperTolerance(self) -> float: ...

class IGESDimen_DimensionUnits(IGESData_IGESEntity):
    def __init__(self) -> None: ...
    def CharacterSet(self) -> int: ...
    def FormatString(self) -> TCollection_HAsciiString: ...
    def FractionFlag(self) -> int: ...
    def Init(self, nbPropVal: int, aSecondPos: int, aUnitsInd: int, aCharSet: int, aFormat: TCollection_HAsciiString, aFracFlag: int, aPrecision: int) -> None: ...
    def NbPropertyValues(self) -> int: ...
    def PrecisionOrDenominator(self) -> int: ...
    def SecondaryDimenPosition(self) -> int: ...
    def UnitsIndicator(self) -> int: ...

class IGESDimen_DimensionedGeometry(IGESData_IGESEntity):
    def __init__(self) -> None: ...
    def DimensionEntity(self) -> IGESData_IGESEntity: ...
    def GeometryEntity(self, Index: int) -> IGESData_IGESEntity: ...
    def Init(self, nbDims: int, aDimension: IGESData_IGESEntity, entities: IGESData_HArray1OfIGESEntity) -> None: ...
    def NbDimensions(self) -> int: ...
    def NbGeometryEntities(self) -> int: ...

class IGESDimen_FlagNote(IGESData_IGESEntity):
    def __init__(self) -> None: ...
    def Angle(self) -> float: ...
    def CharacterHeight(self) -> float: ...
    def Height(self) -> float: ...
    def Init(self, leftCorner: gp_XYZ, anAngle: float, aNote: IGESDimen_GeneralNote, someLeaders: IGESDimen_HArray1OfLeaderArrow) -> None: ...
    def Leader(self, Index: int) -> IGESDimen_LeaderArrow: ...
    def Length(self) -> float: ...
    def LowerLeftCorner(self) -> gp_Pnt: ...
    def NbLeaders(self) -> int: ...
    def Note(self) -> IGESDimen_GeneralNote: ...
    def TextWidth(self) -> float: ...
    def TipLength(self) -> float: ...
    def TransformedLowerLeftCorner(self) -> gp_Pnt: ...

class IGESDimen_GeneralLabel(IGESData_IGESEntity):
    def __init__(self) -> None: ...
    def Init(self, aNote: IGESDimen_GeneralNote, someLeaders: IGESDimen_HArray1OfLeaderArrow) -> None: ...
    def Leader(self, Index: int) -> IGESDimen_LeaderArrow: ...
    def NbLeaders(self) -> int: ...
    def Note(self) -> IGESDimen_GeneralNote: ...

class IGESDimen_GeneralModule(IGESData_GeneralModule):
    def __init__(self) -> None: ...
    def CategoryNumber(self, CN: int, ent: Standard_Transient, shares: Interface_ShareTool) -> int: ...
    def DirChecker(self, CN: int, ent: IGESData_IGESEntity) -> IGESData_DirChecker: ...
    def NewVoid(self, CN: int, entto: Standard_Transient) -> bool: ...
    def OwnCheckCase(self, CN: int, ent: IGESData_IGESEntity, shares: Interface_ShareTool, ach: Interface_Check) -> None: ...
    def OwnCopyCase(self, CN: int, entfrom: IGESData_IGESEntity, entto: IGESData_IGESEntity, TC: Interface_CopyTool) -> None: ...
    def OwnSharedCase(self, CN: int, ent: IGESData_IGESEntity, iter: Interface_EntityIterator) -> None: ...

class IGESDimen_GeneralNote(IGESData_IGESEntity):
    def __init__(self) -> None: ...
    def BoxHeight(self, Index: int) -> float: ...
    def BoxWidth(self, Index: int) -> float: ...
    def FontCode(self, Index: int) -> int: ...
    def FontEntity(self, Index: int) -> IGESGraph_TextFontDef: ...
    def Init(self, nbChars: TColStd_HArray1OfInteger, widths: TColStd_HArray1OfReal, heights: TColStd_HArray1OfReal, fontCodes: TColStd_HArray1OfInteger, fonts: IGESGraph_HArray1OfTextFontDef, slants: TColStd_HArray1OfReal, rotations: TColStd_HArray1OfReal, mirrorFlags: TColStd_HArray1OfInteger, rotFlags: TColStd_HArray1OfInteger, start: TColgp_HArray1OfXYZ, texts: Interface_HArray1OfHAsciiString) -> None: ...
    def IsFontEntity(self, Index: int) -> bool: ...
    def MirrorFlag(self, Index: int) -> int: ...
    def NbCharacters(self, Index: int) -> int: ...
    def NbStrings(self) -> int: ...
    def RotateFlag(self, Index: int) -> int: ...
    def RotationAngle(self, Index: int) -> float: ...
    def SetFormNumber(self, form: int) -> None: ...
    def SlantAngle(self, Index: int) -> float: ...
    def StartPoint(self, Index: int) -> gp_Pnt: ...
    def Text(self, Index: int) -> TCollection_HAsciiString: ...
    def TransformedStartPoint(self, Index: int) -> gp_Pnt: ...
    def ZDepthStartPoint(self, Index: int) -> float: ...

class IGESDimen_GeneralSymbol(IGESData_IGESEntity):
    def __init__(self) -> None: ...
    def GeomEntity(self, Index: int) -> IGESData_IGESEntity: ...
    def HasNote(self) -> bool: ...
    def Init(self, aNote: IGESDimen_GeneralNote, allGeoms: IGESData_HArray1OfIGESEntity, allLeaders: IGESDimen_HArray1OfLeaderArrow) -> None: ...
    def LeaderArrow(self, Index: int) -> IGESDimen_LeaderArrow: ...
    def NbGeomEntities(self) -> int: ...
    def NbLeaders(self) -> int: ...
    def Note(self) -> IGESDimen_GeneralNote: ...
    def SetFormNumber(self, form: int) -> None: ...

class IGESDimen_LeaderArrow(IGESData_IGESEntity):
    def __init__(self) -> None: ...
    def ArrowHead(self) -> gp_Pnt2d: ...
    def ArrowHeadHeight(self) -> float: ...
    def ArrowHeadWidth(self) -> float: ...
    def Init(self, height: float, width: float, depth: float, position: gp_XY, segments: TColgp_HArray1OfXY) -> None: ...
    def NbSegments(self) -> int: ...
    def SegmentTail(self, Index: int) -> gp_Pnt2d: ...
    def SetFormNumber(self, form: int) -> None: ...
    def TransformedArrowHead(self) -> gp_Pnt: ...
    def TransformedSegmentTail(self, Index: int) -> gp_Pnt: ...
    def ZDepth(self) -> float: ...

class IGESDimen_LinearDimension(IGESData_IGESEntity):
    def __init__(self) -> None: ...
    def FirstLeader(self) -> IGESDimen_LeaderArrow: ...
    def FirstWitness(self) -> IGESDimen_WitnessLine: ...
    def HasFirstWitness(self) -> bool: ...
    def HasSecondWitness(self) -> bool: ...
    def Init(self, aNote: IGESDimen_GeneralNote, aLeader: IGESDimen_LeaderArrow, anotherLeader: IGESDimen_LeaderArrow, aWitness: IGESDimen_WitnessLine, anotherWitness: IGESDimen_WitnessLine) -> None: ...
    def Note(self) -> IGESDimen_GeneralNote: ...
    def SecondLeader(self) -> IGESDimen_LeaderArrow: ...
    def SecondWitness(self) -> IGESDimen_WitnessLine: ...
    def SetFormNumber(self, form: int) -> None: ...

class IGESDimen_NewDimensionedGeometry(IGESData_IGESEntity):
    def __init__(self) -> None: ...
    def AngleValue(self) -> float: ...
    def DimensionEntity(self) -> IGESData_IGESEntity: ...
    def DimensionLocationFlag(self, Index: int) -> int: ...
    def DimensionOrientationFlag(self) -> int: ...
    def GeometryEntity(self, Index: int) -> IGESData_IGESEntity: ...
    def Init(self, nbDimens: int, aDimen: IGESData_IGESEntity, anOrientation: int, anAngle: float, allEntities: IGESData_HArray1OfIGESEntity, allLocations: TColStd_HArray1OfInteger, allPoints: TColgp_HArray1OfXYZ) -> None: ...
    def NbDimensions(self) -> int: ...
    def NbGeometries(self) -> int: ...
    def Point(self, Index: int) -> gp_Pnt: ...
    def TransformedPoint(self, Index: int) -> gp_Pnt: ...

class IGESDimen_NewGeneralNote(IGESData_IGESEntity):
    def __init__(self) -> None: ...
    def AreaLocation(self) -> gp_Pnt: ...
    def AreaRotationAngle(self) -> float: ...
    def BaseLinePosition(self) -> gp_Pnt: ...
    def BoxHeight(self, Index: int) -> float: ...
    def BoxWidth(self, Index: int) -> float: ...
    def CharSetCode(self, Index: int) -> int: ...
    def CharSetEntity(self, Index: int) -> IGESData_IGESEntity: ...
    def CharacterAngle(self, Index: int) -> float: ...
    def CharacterDisplay(self, Index: int) -> int: ...
    def CharacterHeight(self, Index: int) -> float: ...
    def CharacterWidth(self, Index: int) -> float: ...
    def ControlCodeString(self, Index: int) -> TCollection_HAsciiString: ...
    def FontStyle(self, Index: int) -> int: ...
    def Init(self, width: float, height: float, justifyCode: int, areaLoc: gp_XYZ, areaRotationAngle: float, baseLinePos: gp_XYZ, normalInterlineSpace: float, charDisplays: TColStd_HArray1OfInteger, charWidths: TColStd_HArray1OfReal, charHeights: TColStd_HArray1OfReal, interCharSpc: TColStd_HArray1OfReal, interLineSpc: TColStd_HArray1OfReal, fontStyles: TColStd_HArray1OfInteger, charAngles: TColStd_HArray1OfReal, controlCodeStrings: Interface_HArray1OfHAsciiString, nbChars: TColStd_HArray1OfInteger, boxWidths: TColStd_HArray1OfReal, boxHeights: TColStd_HArray1OfReal, charSetCodes: TColStd_HArray1OfInteger, charSetEntities: IGESData_HArray1OfIGESEntity, slAngles: TColStd_HArray1OfReal, rotAngles: TColStd_HArray1OfReal, mirrorFlags: TColStd_HArray1OfInteger, rotateFlags: TColStd_HArray1OfInteger, startPoints: TColgp_HArray1OfXYZ, texts: Interface_HArray1OfHAsciiString) -> None: ...
    def InterCharacterSpace(self, Index: int) -> float: ...
    def InterlineSpace(self, Index: int) -> float: ...
    def IsCharSetEntity(self, Index: int) -> bool: ...
    def IsMirrored(self, Index: int) -> bool: ...
    def IsVariable(self, Index: int) -> bool: ...
    def JustifyCode(self) -> int: ...
    def MirrorFlag(self, Index: int) -> int: ...
    def NbCharacters(self, Index: int) -> int: ...
    def NbStrings(self) -> int: ...
    def NormalInterlineSpace(self) -> float: ...
    def RotateFlag(self, Index: int) -> int: ...
    def RotationAngle(self, Index: int) -> float: ...
    def SlantAngle(self, Index: int) -> float: ...
    def StartPoint(self, Index: int) -> gp_Pnt: ...
    def Text(self, Index: int) -> TCollection_HAsciiString: ...
    def TextHeight(self) -> float: ...
    def TextWidth(self) -> float: ...
    def TransformedAreaLocation(self) -> gp_Pnt: ...
    def TransformedBaseLinePosition(self) -> gp_Pnt: ...
    def TransformedStartPoint(self, Index: int) -> gp_Pnt: ...
    def ZDepthAreaLocation(self) -> float: ...
    def ZDepthBaseLinePosition(self) -> float: ...
    def ZDepthStartPoint(self, Index: int) -> float: ...

class IGESDimen_OrdinateDimension(IGESData_IGESEntity):
    def __init__(self) -> None: ...
    def Init(self, aNote: IGESDimen_GeneralNote, aType: bool, aLine: IGESDimen_WitnessLine, anArrow: IGESDimen_LeaderArrow) -> None: ...
    def IsLeader(self) -> bool: ...
    def IsLine(self) -> bool: ...
    def Leader(self) -> IGESDimen_LeaderArrow: ...
    def Note(self) -> IGESDimen_GeneralNote: ...
    def WitnessLine(self) -> IGESDimen_WitnessLine: ...

class IGESDimen_PointDimension(IGESData_IGESEntity):
    def __init__(self) -> None: ...
    def CircularArc(self) -> IGESGeom_CircularArc: ...
    def CompositeCurve(self) -> IGESGeom_CompositeCurve: ...
    def Geom(self) -> IGESData_IGESEntity: ...
    def GeomCase(self) -> int: ...
    def Init(self, aNote: IGESDimen_GeneralNote, anArrow: IGESDimen_LeaderArrow, aGeom: IGESData_IGESEntity) -> None: ...
    def LeaderArrow(self) -> IGESDimen_LeaderArrow: ...
    def Note(self) -> IGESDimen_GeneralNote: ...

class IGESDimen_Protocol(IGESData_Protocol):
    def __init__(self) -> None: ...
    def NbResources(self) -> int: ...
    def Resource(self, num: int) -> Interface_Protocol: ...
    def TypeNumber(self, atype: Standard_Type) -> int: ...

class IGESDimen_RadiusDimension(IGESData_IGESEntity):
    def __init__(self) -> None: ...
    def Center(self) -> gp_Pnt2d: ...
    def HasLeader2(self) -> bool: ...
    def Init(self, aNote: IGESDimen_GeneralNote, anArrow: IGESDimen_LeaderArrow, arcCenter: gp_XY, anotherArrow: IGESDimen_LeaderArrow) -> None: ...
    def InitForm(self, form: int) -> None: ...
    def Leader(self) -> IGESDimen_LeaderArrow: ...
    def Leader2(self) -> IGESDimen_LeaderArrow: ...
    def Note(self) -> IGESDimen_GeneralNote: ...
    def TransformedCenter(self) -> gp_Pnt: ...

class IGESDimen_ReadWriteModule(IGESData_ReadWriteModule):
    def __init__(self) -> None: ...
    def CaseIGES(self, typenum: int, formnum: int) -> int: ...
    def ReadOwnParams(self, CN: int, ent: IGESData_IGESEntity, IR: IGESData_IGESReaderData, PR: IGESData_ParamReader) -> None: ...
    def WriteOwnParams(self, CN: int, ent: IGESData_IGESEntity, IW: IGESData_IGESWriter) -> None: ...

class IGESDimen_Section(IGESData_IGESEntity):
    def __init__(self) -> None: ...
    def Datatype(self) -> int: ...
    def Init(self, dataType: int, aDisp: float, dataPoints: TColgp_HArray1OfXY) -> None: ...
    def NbPoints(self) -> int: ...
    def Point(self, Index: int) -> gp_Pnt: ...
    def SetFormNumber(self, form: int) -> None: ...
    def TransformedPoint(self, Index: int) -> gp_Pnt: ...
    def ZDisplacement(self) -> float: ...

class IGESDimen_SectionedArea(IGESData_IGESEntity):
    def __init__(self) -> None: ...
    def Angle(self) -> float: ...
    def Distance(self) -> float: ...
    def ExteriorCurve(self) -> IGESData_IGESEntity: ...
    def Init(self, aCurve: IGESData_IGESEntity, aPattern: int, aPoint: gp_XYZ, aDistance: float, anAngle: float, someIslands: IGESData_HArray1OfIGESEntity) -> None: ...
    def IsInverted(self) -> bool: ...
    def IslandCurve(self, Index: int) -> IGESData_IGESEntity: ...
    def NbIslands(self) -> int: ...
    def PassingPoint(self) -> gp_Pnt: ...
    def Pattern(self) -> int: ...
    def SetInverted(self, mode: bool) -> None: ...
    def TransformedPassingPoint(self) -> gp_Pnt: ...
    def ZDepth(self) -> float: ...

class IGESDimen_SpecificModule(IGESData_SpecificModule):
    def __init__(self) -> None: ...
    def OwnCorrect(self, CN: int, ent: IGESData_IGESEntity) -> bool: ...

class IGESDimen_ToolAngularDimension:
    def __init__(self) -> None: ...
    def DirChecker(self, ent: IGESDimen_AngularDimension) -> IGESData_DirChecker: ...
    def OwnCheck(self, ent: IGESDimen_AngularDimension, shares: Interface_ShareTool, ach: Interface_Check) -> None: ...
    def OwnCopy(self, entfrom: IGESDimen_AngularDimension, entto: IGESDimen_AngularDimension, TC: Interface_CopyTool) -> None: ...
    def OwnShared(self, ent: IGESDimen_AngularDimension, iter: Interface_EntityIterator) -> None: ...
    def ReadOwnParams(self, ent: IGESDimen_AngularDimension, IR: IGESData_IGESReaderData, PR: IGESData_ParamReader) -> None: ...
    def WriteOwnParams(self, ent: IGESDimen_AngularDimension, IW: IGESData_IGESWriter) -> None: ...

class IGESDimen_ToolBasicDimension:
    def __init__(self) -> None: ...
    def DirChecker(self, ent: IGESDimen_BasicDimension) -> IGESData_DirChecker: ...
    def OwnCheck(self, ent: IGESDimen_BasicDimension, shares: Interface_ShareTool, ach: Interface_Check) -> None: ...
    def OwnCopy(self, entfrom: IGESDimen_BasicDimension, entto: IGESDimen_BasicDimension, TC: Interface_CopyTool) -> None: ...
    def OwnCorrect(self, ent: IGESDimen_BasicDimension) -> bool: ...
    def OwnShared(self, ent: IGESDimen_BasicDimension, iter: Interface_EntityIterator) -> None: ...
    def ReadOwnParams(self, ent: IGESDimen_BasicDimension, IR: IGESData_IGESReaderData, PR: IGESData_ParamReader) -> None: ...
    def WriteOwnParams(self, ent: IGESDimen_BasicDimension, IW: IGESData_IGESWriter) -> None: ...

class IGESDimen_ToolCenterLine:
    def __init__(self) -> None: ...
    def DirChecker(self, ent: IGESDimen_CenterLine) -> IGESData_DirChecker: ...
    def OwnCheck(self, ent: IGESDimen_CenterLine, shares: Interface_ShareTool, ach: Interface_Check) -> None: ...
    def OwnCopy(self, entfrom: IGESDimen_CenterLine, entto: IGESDimen_CenterLine, TC: Interface_CopyTool) -> None: ...
    def OwnCorrect(self, ent: IGESDimen_CenterLine) -> bool: ...
    def OwnShared(self, ent: IGESDimen_CenterLine, iter: Interface_EntityIterator) -> None: ...
    def ReadOwnParams(self, ent: IGESDimen_CenterLine, IR: IGESData_IGESReaderData, PR: IGESData_ParamReader) -> None: ...
    def WriteOwnParams(self, ent: IGESDimen_CenterLine, IW: IGESData_IGESWriter) -> None: ...

class IGESDimen_ToolCurveDimension:
    def __init__(self) -> None: ...
    def DirChecker(self, ent: IGESDimen_CurveDimension) -> IGESData_DirChecker: ...
    def OwnCheck(self, ent: IGESDimen_CurveDimension, shares: Interface_ShareTool, ach: Interface_Check) -> None: ...
    def OwnCopy(self, entfrom: IGESDimen_CurveDimension, entto: IGESDimen_CurveDimension, TC: Interface_CopyTool) -> None: ...
    def OwnShared(self, ent: IGESDimen_CurveDimension, iter: Interface_EntityIterator) -> None: ...
    def ReadOwnParams(self, ent: IGESDimen_CurveDimension, IR: IGESData_IGESReaderData, PR: IGESData_ParamReader) -> None: ...
    def WriteOwnParams(self, ent: IGESDimen_CurveDimension, IW: IGESData_IGESWriter) -> None: ...

class IGESDimen_ToolDiameterDimension:
    def __init__(self) -> None: ...
    def DirChecker(self, ent: IGESDimen_DiameterDimension) -> IGESData_DirChecker: ...
    def OwnCheck(self, ent: IGESDimen_DiameterDimension, shares: Interface_ShareTool, ach: Interface_Check) -> None: ...
    def OwnCopy(self, entfrom: IGESDimen_DiameterDimension, entto: IGESDimen_DiameterDimension, TC: Interface_CopyTool) -> None: ...
    def OwnShared(self, ent: IGESDimen_DiameterDimension, iter: Interface_EntityIterator) -> None: ...
    def ReadOwnParams(self, ent: IGESDimen_DiameterDimension, IR: IGESData_IGESReaderData, PR: IGESData_ParamReader) -> None: ...
    def WriteOwnParams(self, ent: IGESDimen_DiameterDimension, IW: IGESData_IGESWriter) -> None: ...

class IGESDimen_ToolDimensionDisplayData:
    def __init__(self) -> None: ...
    def DirChecker(self, ent: IGESDimen_DimensionDisplayData) -> IGESData_DirChecker: ...
    def OwnCheck(self, ent: IGESDimen_DimensionDisplayData, shares: Interface_ShareTool, ach: Interface_Check) -> None: ...
    def OwnCopy(self, entfrom: IGESDimen_DimensionDisplayData, entto: IGESDimen_DimensionDisplayData, TC: Interface_CopyTool) -> None: ...
    def OwnCorrect(self, ent: IGESDimen_DimensionDisplayData) -> bool: ...
    def OwnShared(self, ent: IGESDimen_DimensionDisplayData, iter: Interface_EntityIterator) -> None: ...
    def ReadOwnParams(self, ent: IGESDimen_DimensionDisplayData, IR: IGESData_IGESReaderData, PR: IGESData_ParamReader) -> None: ...
    def WriteOwnParams(self, ent: IGESDimen_DimensionDisplayData, IW: IGESData_IGESWriter) -> None: ...

class IGESDimen_ToolDimensionTolerance:
    def __init__(self) -> None: ...
    def DirChecker(self, ent: IGESDimen_DimensionTolerance) -> IGESData_DirChecker: ...
    def OwnCheck(self, ent: IGESDimen_DimensionTolerance, shares: Interface_ShareTool, ach: Interface_Check) -> None: ...
    def OwnCopy(self, entfrom: IGESDimen_DimensionTolerance, entto: IGESDimen_DimensionTolerance, TC: Interface_CopyTool) -> None: ...
    def OwnCorrect(self, ent: IGESDimen_DimensionTolerance) -> bool: ...
    def OwnShared(self, ent: IGESDimen_DimensionTolerance, iter: Interface_EntityIterator) -> None: ...
    def ReadOwnParams(self, ent: IGESDimen_DimensionTolerance, IR: IGESData_IGESReaderData, PR: IGESData_ParamReader) -> None: ...
    def WriteOwnParams(self, ent: IGESDimen_DimensionTolerance, IW: IGESData_IGESWriter) -> None: ...

class IGESDimen_ToolDimensionUnits:
    def __init__(self) -> None: ...
    def DirChecker(self, ent: IGESDimen_DimensionUnits) -> IGESData_DirChecker: ...
    def OwnCheck(self, ent: IGESDimen_DimensionUnits, shares: Interface_ShareTool, ach: Interface_Check) -> None: ...
    def OwnCopy(self, entfrom: IGESDimen_DimensionUnits, entto: IGESDimen_DimensionUnits, TC: Interface_CopyTool) -> None: ...
    def OwnCorrect(self, ent: IGESDimen_DimensionUnits) -> bool: ...
    def OwnShared(self, ent: IGESDimen_DimensionUnits, iter: Interface_EntityIterator) -> None: ...
    def ReadOwnParams(self, ent: IGESDimen_DimensionUnits, IR: IGESData_IGESReaderData, PR: IGESData_ParamReader) -> None: ...
    def WriteOwnParams(self, ent: IGESDimen_DimensionUnits, IW: IGESData_IGESWriter) -> None: ...

class IGESDimen_ToolDimensionedGeometry:
    def __init__(self) -> None: ...
    def DirChecker(self, ent: IGESDimen_DimensionedGeometry) -> IGESData_DirChecker: ...
    def OwnCheck(self, ent: IGESDimen_DimensionedGeometry, shares: Interface_ShareTool, ach: Interface_Check) -> None: ...
    def OwnCopy(self, entfrom: IGESDimen_DimensionedGeometry, entto: IGESDimen_DimensionedGeometry, TC: Interface_CopyTool) -> None: ...
    def OwnCorrect(self, ent: IGESDimen_DimensionedGeometry) -> bool: ...
    def OwnShared(self, ent: IGESDimen_DimensionedGeometry, iter: Interface_EntityIterator) -> None: ...
    def ReadOwnParams(self, ent: IGESDimen_DimensionedGeometry, IR: IGESData_IGESReaderData, PR: IGESData_ParamReader) -> None: ...
    def WriteOwnParams(self, ent: IGESDimen_DimensionedGeometry, IW: IGESData_IGESWriter) -> None: ...

class IGESDimen_ToolFlagNote:
    def __init__(self) -> None: ...
    def DirChecker(self, ent: IGESDimen_FlagNote) -> IGESData_DirChecker: ...
    def OwnCheck(self, ent: IGESDimen_FlagNote, shares: Interface_ShareTool, ach: Interface_Check) -> None: ...
    def OwnCopy(self, entfrom: IGESDimen_FlagNote, entto: IGESDimen_FlagNote, TC: Interface_CopyTool) -> None: ...
    def OwnShared(self, ent: IGESDimen_FlagNote, iter: Interface_EntityIterator) -> None: ...
    def ReadOwnParams(self, ent: IGESDimen_FlagNote, IR: IGESData_IGESReaderData, PR: IGESData_ParamReader) -> None: ...
    def WriteOwnParams(self, ent: IGESDimen_FlagNote, IW: IGESData_IGESWriter) -> None: ...

class IGESDimen_ToolGeneralLabel:
    def __init__(self) -> None: ...
    def DirChecker(self, ent: IGESDimen_GeneralLabel) -> IGESData_DirChecker: ...
    def OwnCheck(self, ent: IGESDimen_GeneralLabel, shares: Interface_ShareTool, ach: Interface_Check) -> None: ...
    def OwnCopy(self, entfrom: IGESDimen_GeneralLabel, entto: IGESDimen_GeneralLabel, TC: Interface_CopyTool) -> None: ...
    def OwnShared(self, ent: IGESDimen_GeneralLabel, iter: Interface_EntityIterator) -> None: ...
    def ReadOwnParams(self, ent: IGESDimen_GeneralLabel, IR: IGESData_IGESReaderData, PR: IGESData_ParamReader) -> None: ...
    def WriteOwnParams(self, ent: IGESDimen_GeneralLabel, IW: IGESData_IGESWriter) -> None: ...

class IGESDimen_ToolGeneralNote:
    def __init__(self) -> None: ...
    def DirChecker(self, ent: IGESDimen_GeneralNote) -> IGESData_DirChecker: ...
    def OwnCheck(self, ent: IGESDimen_GeneralNote, shares: Interface_ShareTool, ach: Interface_Check) -> None: ...
    def OwnCopy(self, entfrom: IGESDimen_GeneralNote, entto: IGESDimen_GeneralNote, TC: Interface_CopyTool) -> None: ...
    def OwnShared(self, ent: IGESDimen_GeneralNote, iter: Interface_EntityIterator) -> None: ...
    def ReadOwnParams(self, ent: IGESDimen_GeneralNote, IR: IGESData_IGESReaderData, PR: IGESData_ParamReader) -> None: ...
    def WriteOwnParams(self, ent: IGESDimen_GeneralNote, IW: IGESData_IGESWriter) -> None: ...

class IGESDimen_ToolGeneralSymbol:
    def __init__(self) -> None: ...
    def DirChecker(self, ent: IGESDimen_GeneralSymbol) -> IGESData_DirChecker: ...
    def OwnCheck(self, ent: IGESDimen_GeneralSymbol, shares: Interface_ShareTool, ach: Interface_Check) -> None: ...
    def OwnCopy(self, entfrom: IGESDimen_GeneralSymbol, entto: IGESDimen_GeneralSymbol, TC: Interface_CopyTool) -> None: ...
    def OwnShared(self, ent: IGESDimen_GeneralSymbol, iter: Interface_EntityIterator) -> None: ...
    def ReadOwnParams(self, ent: IGESDimen_GeneralSymbol, IR: IGESData_IGESReaderData, PR: IGESData_ParamReader) -> None: ...
    def WriteOwnParams(self, ent: IGESDimen_GeneralSymbol, IW: IGESData_IGESWriter) -> None: ...

class IGESDimen_ToolLeaderArrow:
    def __init__(self) -> None: ...
    def DirChecker(self, ent: IGESDimen_LeaderArrow) -> IGESData_DirChecker: ...
    def OwnCheck(self, ent: IGESDimen_LeaderArrow, shares: Interface_ShareTool, ach: Interface_Check) -> None: ...
    def OwnCopy(self, entfrom: IGESDimen_LeaderArrow, entto: IGESDimen_LeaderArrow, TC: Interface_CopyTool) -> None: ...
    def OwnShared(self, ent: IGESDimen_LeaderArrow, iter: Interface_EntityIterator) -> None: ...
    def ReadOwnParams(self, ent: IGESDimen_LeaderArrow, IR: IGESData_IGESReaderData, PR: IGESData_ParamReader) -> None: ...
    def WriteOwnParams(self, ent: IGESDimen_LeaderArrow, IW: IGESData_IGESWriter) -> None: ...

class IGESDimen_ToolLinearDimension:
    def __init__(self) -> None: ...
    def DirChecker(self, ent: IGESDimen_LinearDimension) -> IGESData_DirChecker: ...
    def OwnCheck(self, ent: IGESDimen_LinearDimension, shares: Interface_ShareTool, ach: Interface_Check) -> None: ...
    def OwnCopy(self, entfrom: IGESDimen_LinearDimension, entto: IGESDimen_LinearDimension, TC: Interface_CopyTool) -> None: ...
    def OwnShared(self, ent: IGESDimen_LinearDimension, iter: Interface_EntityIterator) -> None: ...
    def ReadOwnParams(self, ent: IGESDimen_LinearDimension, IR: IGESData_IGESReaderData, PR: IGESData_ParamReader) -> None: ...
    def WriteOwnParams(self, ent: IGESDimen_LinearDimension, IW: IGESData_IGESWriter) -> None: ...

class IGESDimen_ToolNewDimensionedGeometry:
    def __init__(self) -> None: ...
    def DirChecker(self, ent: IGESDimen_NewDimensionedGeometry) -> IGESData_DirChecker: ...
    def OwnCheck(self, ent: IGESDimen_NewDimensionedGeometry, shares: Interface_ShareTool, ach: Interface_Check) -> None: ...
    def OwnCopy(self, entfrom: IGESDimen_NewDimensionedGeometry, entto: IGESDimen_NewDimensionedGeometry, TC: Interface_CopyTool) -> None: ...
    def OwnCorrect(self, ent: IGESDimen_NewDimensionedGeometry) -> bool: ...
    def OwnShared(self, ent: IGESDimen_NewDimensionedGeometry, iter: Interface_EntityIterator) -> None: ...
    def ReadOwnParams(self, ent: IGESDimen_NewDimensionedGeometry, IR: IGESData_IGESReaderData, PR: IGESData_ParamReader) -> None: ...
    def WriteOwnParams(self, ent: IGESDimen_NewDimensionedGeometry, IW: IGESData_IGESWriter) -> None: ...

class IGESDimen_ToolNewGeneralNote:
    def __init__(self) -> None: ...
    def DirChecker(self, ent: IGESDimen_NewGeneralNote) -> IGESData_DirChecker: ...
    def OwnCheck(self, ent: IGESDimen_NewGeneralNote, shares: Interface_ShareTool, ach: Interface_Check) -> None: ...
    def OwnCopy(self, entfrom: IGESDimen_NewGeneralNote, entto: IGESDimen_NewGeneralNote, TC: Interface_CopyTool) -> None: ...
    def OwnShared(self, ent: IGESDimen_NewGeneralNote, iter: Interface_EntityIterator) -> None: ...
    def ReadOwnParams(self, ent: IGESDimen_NewGeneralNote, IR: IGESData_IGESReaderData, PR: IGESData_ParamReader) -> None: ...
    def WriteOwnParams(self, ent: IGESDimen_NewGeneralNote, IW: IGESData_IGESWriter) -> None: ...

class IGESDimen_ToolOrdinateDimension:
    def __init__(self) -> None: ...
    def DirChecker(self, ent: IGESDimen_OrdinateDimension) -> IGESData_DirChecker: ...
    def OwnCheck(self, ent: IGESDimen_OrdinateDimension, shares: Interface_ShareTool, ach: Interface_Check) -> None: ...
    def OwnCopy(self, entfrom: IGESDimen_OrdinateDimension, entto: IGESDimen_OrdinateDimension, TC: Interface_CopyTool) -> None: ...
    def OwnShared(self, ent: IGESDimen_OrdinateDimension, iter: Interface_EntityIterator) -> None: ...
    def ReadOwnParams(self, ent: IGESDimen_OrdinateDimension, IR: IGESData_IGESReaderData, PR: IGESData_ParamReader) -> None: ...
    def WriteOwnParams(self, ent: IGESDimen_OrdinateDimension, IW: IGESData_IGESWriter) -> None: ...

class IGESDimen_ToolPointDimension:
    def __init__(self) -> None: ...
    def DirChecker(self, ent: IGESDimen_PointDimension) -> IGESData_DirChecker: ...
    def OwnCheck(self, ent: IGESDimen_PointDimension, shares: Interface_ShareTool, ach: Interface_Check) -> None: ...
    def OwnCopy(self, entfrom: IGESDimen_PointDimension, entto: IGESDimen_PointDimension, TC: Interface_CopyTool) -> None: ...
    def OwnShared(self, ent: IGESDimen_PointDimension, iter: Interface_EntityIterator) -> None: ...
    def ReadOwnParams(self, ent: IGESDimen_PointDimension, IR: IGESData_IGESReaderData, PR: IGESData_ParamReader) -> None: ...
    def WriteOwnParams(self, ent: IGESDimen_PointDimension, IW: IGESData_IGESWriter) -> None: ...

class IGESDimen_ToolRadiusDimension:
    def __init__(self) -> None: ...
    def DirChecker(self, ent: IGESDimen_RadiusDimension) -> IGESData_DirChecker: ...
    def OwnCheck(self, ent: IGESDimen_RadiusDimension, shares: Interface_ShareTool, ach: Interface_Check) -> None: ...
    def OwnCopy(self, entfrom: IGESDimen_RadiusDimension, entto: IGESDimen_RadiusDimension, TC: Interface_CopyTool) -> None: ...
    def OwnShared(self, ent: IGESDimen_RadiusDimension, iter: Interface_EntityIterator) -> None: ...
    def ReadOwnParams(self, ent: IGESDimen_RadiusDimension, IR: IGESData_IGESReaderData, PR: IGESData_ParamReader) -> None: ...
    def WriteOwnParams(self, ent: IGESDimen_RadiusDimension, IW: IGESData_IGESWriter) -> None: ...

class IGESDimen_ToolSection:
    def __init__(self) -> None: ...
    def DirChecker(self, ent: IGESDimen_Section) -> IGESData_DirChecker: ...
    def OwnCheck(self, ent: IGESDimen_Section, shares: Interface_ShareTool, ach: Interface_Check) -> None: ...
    def OwnCopy(self, entfrom: IGESDimen_Section, entto: IGESDimen_Section, TC: Interface_CopyTool) -> None: ...
    def OwnCorrect(self, ent: IGESDimen_Section) -> bool: ...
    def OwnShared(self, ent: IGESDimen_Section, iter: Interface_EntityIterator) -> None: ...
    def ReadOwnParams(self, ent: IGESDimen_Section, IR: IGESData_IGESReaderData, PR: IGESData_ParamReader) -> None: ...
    def WriteOwnParams(self, ent: IGESDimen_Section, IW: IGESData_IGESWriter) -> None: ...

class IGESDimen_ToolSectionedArea:
    def __init__(self) -> None: ...
    def DirChecker(self, ent: IGESDimen_SectionedArea) -> IGESData_DirChecker: ...
    def OwnCheck(self, ent: IGESDimen_SectionedArea, shares: Interface_ShareTool, ach: Interface_Check) -> None: ...
    def OwnCopy(self, entfrom: IGESDimen_SectionedArea, entto: IGESDimen_SectionedArea, TC: Interface_CopyTool) -> None: ...
    def OwnShared(self, ent: IGESDimen_SectionedArea, iter: Interface_EntityIterator) -> None: ...
    def ReadOwnParams(self, ent: IGESDimen_SectionedArea, IR: IGESData_IGESReaderData, PR: IGESData_ParamReader) -> None: ...
    def WriteOwnParams(self, ent: IGESDimen_SectionedArea, IW: IGESData_IGESWriter) -> None: ...

class IGESDimen_ToolWitnessLine:
    def __init__(self) -> None: ...
    def DirChecker(self, ent: IGESDimen_WitnessLine) -> IGESData_DirChecker: ...
    def OwnCheck(self, ent: IGESDimen_WitnessLine, shares: Interface_ShareTool, ach: Interface_Check) -> None: ...
    def OwnCopy(self, entfrom: IGESDimen_WitnessLine, entto: IGESDimen_WitnessLine, TC: Interface_CopyTool) -> None: ...
    def OwnCorrect(self, ent: IGESDimen_WitnessLine) -> bool: ...
    def OwnShared(self, ent: IGESDimen_WitnessLine, iter: Interface_EntityIterator) -> None: ...
    def ReadOwnParams(self, ent: IGESDimen_WitnessLine, IR: IGESData_IGESReaderData, PR: IGESData_ParamReader) -> None: ...
    def WriteOwnParams(self, ent: IGESDimen_WitnessLine, IW: IGESData_IGESWriter) -> None: ...

class IGESDimen_WitnessLine(IGESData_IGESEntity):
    def __init__(self) -> None: ...
    def Datatype(self) -> int: ...
    def Init(self, dataType: int, aDisp: float, dataPoints: TColgp_HArray1OfXY) -> None: ...
    def NbPoints(self) -> int: ...
    def Point(self, Index: int) -> gp_Pnt: ...
    def TransformedPoint(self, Index: int) -> gp_Pnt: ...
    def ZDisplacement(self) -> float: ...

# harray1 classes

class IGESDimen_HArray1OfGeneralNote(IGESDimen_Array1OfGeneralNote, Standard_Transient):
    def __init__(self, theLower: int, theUpper: int) -> None: ...
    def Array1(self) -> IGESDimen_Array1OfGeneralNote: ...


class IGESDimen_HArray1OfLeaderArrow(IGESDimen_Array1OfLeaderArrow, Standard_Transient):
    def __init__(self, theLower: int, theUpper: int) -> None: ...
    def Array1(self) -> IGESDimen_Array1OfLeaderArrow: ...

# harray2 classes
# hsequence classes

igesdimen_Init = igesdimen.Init
igesdimen_Protocol = igesdimen.Protocol
