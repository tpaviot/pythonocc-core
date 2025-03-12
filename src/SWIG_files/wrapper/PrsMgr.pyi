from enum import IntEnum
from typing import overload, NewType, Optional, Tuple

from OCC.Core.Standard import *
from OCC.Core.NCollection import *
from OCC.Core.Prs3d import *
from OCC.Core.Graphic3d import *
from OCC.Core.Bnd import *
from OCC.Core.Quantity import *
from OCC.Core.TopLoc import *
from OCC.Core.Aspect import *
from OCC.Core.gp import *
from OCC.Core.TColStd import *
from OCC.Core.V3d import *

Handle_PrsMgr_Presentation3d = NewType("Handle_PrsMgr_Presentation3d", Handle_PrsMgr_Presentation)
Handle_PrsMgr_PresentationManager3d = NewType("Handle_PrsMgr_PresentationManager3d", Handle_PrsMgr_PresentationManager)
Prs3d_Presentation = NewType("Prs3d_Presentation", Graphic3d_Structure)
PrsMgr_Presentation3d = NewType("PrsMgr_Presentation3d", PrsMgr_Presentation)
PrsMgr_PresentationManager3d = NewType("PrsMgr_PresentationManager3d", PrsMgr_PresentationManager)

class PrsMgr_ListOfPresentableObjects:
    def __init__(self) -> None: ...
    def __len__(self) -> int: ...
    def Size(self) -> int: ...
    def Clear(self) -> None: ...
    def First(self) -> False: ...
    def Last(self) -> False: ...
    def Append(self, theItem: False) -> False: ...
    def Prepend(self, theItem: False) -> False: ...
    def RemoveFirst(self) -> None: ...
    def Reverse(self) -> None: ...
    def Value(self, theIndex: int) -> False: ...
    def SetValue(self, theIndex: int, theValue: False) -> None: ...

class PrsMgr_ListOfPresentations:
    def __init__(self) -> None: ...
    def __len__(self) -> int: ...
    def Size(self) -> int: ...
    def Clear(self) -> None: ...
    def First(self) -> False: ...
    def Last(self) -> False: ...
    def Append(self, theItem: False) -> False: ...
    def Prepend(self, theItem: False) -> False: ...
    def RemoveFirst(self) -> None: ...
    def Reverse(self) -> None: ...
    def Value(self, theIndex: int) -> False: ...
    def SetValue(self, theIndex: int, theValue: False) -> None: ...

class PrsMgr_Presentations:
    def __init__(self) -> None: ...
    def __len__(self) -> int: ...
    def Size(self) -> int: ...
    def Clear(self) -> None: ...
    def First(self) -> False: ...
    def Last(self) -> False: ...
    def Length(self) -> int: ...
    def Append(self, theItem: False) -> False: ...
    def Prepend(self, theItem: False) -> False: ...
    def RemoveFirst(self) -> None: ...
    def Reverse(self) -> None: ...
    def Value(self, theIndex: int) -> False: ...
    def SetValue(self, theIndex: int, theValue: False) -> None: ...

class PrsMgr_DisplayStatus(IntEnum):
    PrsMgr_DisplayStatus_Displayed: int = ...
    PrsMgr_DisplayStatus_Erased: int = ...
    PrsMgr_DisplayStatus_None: int = ...
    AIS_DS_Displayed: int = ...
    AIS_DS_Erased: int = ...
    AIS_DS_None: int = ...

PrsMgr_DisplayStatus_Displayed = PrsMgr_DisplayStatus.PrsMgr_DisplayStatus_Displayed
PrsMgr_DisplayStatus_Erased = PrsMgr_DisplayStatus.PrsMgr_DisplayStatus_Erased
PrsMgr_DisplayStatus_None = PrsMgr_DisplayStatus.PrsMgr_DisplayStatus_None
AIS_DS_Displayed = PrsMgr_DisplayStatus.AIS_DS_Displayed
AIS_DS_Erased = PrsMgr_DisplayStatus.AIS_DS_Erased
AIS_DS_None = PrsMgr_DisplayStatus.AIS_DS_None

class PrsMgr_TypeOfPresentation3d(IntEnum):
    PrsMgr_TOP_AllView: int = ...
    PrsMgr_TOP_ProjectorDependent: int = ...

PrsMgr_TOP_AllView = PrsMgr_TypeOfPresentation3d.PrsMgr_TOP_AllView
PrsMgr_TOP_ProjectorDependent = PrsMgr_TypeOfPresentation3d.PrsMgr_TOP_ProjectorDependent

class PrsMgr_PresentableObject(Standard_Transient):
    def AcceptDisplayMode(self, theMode: int) -> bool: ...
    def AddChild(self, theObject: PrsMgr_PresentableObject) -> None: ...
    def AddChildWithCurrentTransformation(self, theObject: PrsMgr_PresentableObject) -> None: ...
    def AddClipPlane(self, thePlane: Graphic3d_ClipPlane) -> None: ...
    def Attributes(self) -> Prs3d_Drawer: ...
    def BoundingBox(self, theBndBox: Bnd_Box) -> None: ...
    def Children(self) -> PrsMgr_ListOfPresentableObjects: ...
    def ClipPlanes(self) -> Graphic3d_SequenceOfHClipPlane: ...
    def Color(self, theColor: Quantity_Color) -> None: ...
    def CombinedParentTransformation(self) -> TopLoc_Datum3D: ...
    def CurrentFacingModel(self) -> Aspect_TypeOfFacingModel: ...
    def DefaultDisplayMode(self) -> int: ...
    def DisplayMode(self) -> int: ...
    def DisplayStatus(self) -> PrsMgr_DisplayStatus: ...
    def DumpJson(self, depth: Optional[int]=-1) -> str: ...
    def DynamicHilightAttributes(self) -> Prs3d_Drawer: ...
    def HasColor(self) -> bool: ...
    def HasDisplayMode(self) -> bool: ...
    def HasHilightMode(self) -> bool: ...
    def HasMaterial(self) -> bool: ...
    def HasOwnPresentations(self) -> bool: ...
    def HasPolygonOffsets(self) -> bool: ...
    def HasTransformation(self) -> bool: ...
    def HasWidth(self) -> bool: ...
    def HilightAttributes(self) -> Prs3d_Drawer: ...
    def HilightMode(self) -> int: ...
    def InversedTransformation(self) -> gp_GTrsf: ...
    def IsInfinite(self) -> bool: ...
    def IsMutable(self) -> bool: ...
    def IsTransparent(self) -> bool: ...
    def LocalTransformation(self) -> gp_Trsf: ...
    def LocalTransformationGeom(self) -> TopLoc_Datum3D: ...
    def Material(self) -> Graphic3d_NameOfMaterial: ...
    def Parent(self) -> PrsMgr_PresentableObject: ...
    def PolygonOffsets(self) -> Tuple[int, float, float]: ...
    def Presentations(self) -> PrsMgr_Presentations: ...
    def RecomputeTransformation(self, theProjector: Graphic3d_Camera) -> None: ...
    def RemoveChild(self, theObject: PrsMgr_PresentableObject) -> None: ...
    def RemoveChildWithRestoreTransformation(self, theObject: PrsMgr_PresentableObject) -> None: ...
    def RemoveClipPlane(self, thePlane: Graphic3d_ClipPlane) -> None: ...
    def ResetTransformation(self) -> None: ...
    def SetAttributes(self, theDrawer: Prs3d_Drawer) -> None: ...
    def SetClipPlanes(self, thePlanes: Graphic3d_SequenceOfHClipPlane) -> None: ...
    def SetColor(self, theColor: Quantity_Color) -> None: ...
    def SetCurrentFacingModel(self, theModel: Optional[Aspect_TypeOfFacingModel] = Aspect_TOFM_BOTH_SIDE) -> None: ...
    def SetDisplayMode(self, theMode: int) -> None: ...
    def SetDynamicHilightAttributes(self, theDrawer: Prs3d_Drawer) -> None: ...
    def SetHilightAttributes(self, theDrawer: Prs3d_Drawer) -> None: ...
    def SetHilightMode(self, theMode: int) -> None: ...
    def SetInfiniteState(self, theFlag: Optional[bool] = True) -> None: ...
    def SetIsoOnTriangulation(self, theIsEnabled: bool) -> None: ...
    @overload
    def SetLocalTransformation(self, theTrsf: gp_Trsf) -> None: ...
    @overload
    def SetLocalTransformation(self, theTrsf: TopLoc_Datum3D) -> None: ...
    def SetMaterial(self, aName: Graphic3d_MaterialAspect) -> None: ...
    def SetMutable(self, theIsMutable: bool) -> None: ...
    def SetPolygonOffsets(self, aMode: int, aFactor: Optional[float] = 1.0, aUnits: Optional[float] = 0.0) -> None: ...
    def SetPropagateVisualState(self, theFlag: bool) -> None: ...
    @overload
    def SetToUpdate(self, theMode: int) -> None: ...
    @overload
    def SetToUpdate(self) -> None: ...
    def SetTransformPersistence(self, theTrsfPers: Graphic3d_TransformPers) -> None: ...
    def SetTransparency(self, aValue: Optional[float] = 0.6) -> None: ...
    def SetTypeOfPresentation(self, theType: PrsMgr_TypeOfPresentation3d) -> None: ...
    def SetWidth(self, theWidth: float) -> None: ...
    def SetZLayer(self, theLayerId: int) -> None: ...
    def SynchronizeAspects(self) -> None: ...
    @overload
    def ToBeUpdated(self, theToIncludeHidden: Optional[bool] = False) -> bool: ...
    @overload
    def ToBeUpdated(self, ListOfMode: TColStd_ListOfInteger) -> None: ...
    def ToPropagateVisualState(self) -> bool: ...
    def TransformPersistence(self) -> Graphic3d_TransformPers: ...
    def Transformation(self) -> gp_Trsf: ...
    def TransformationGeom(self) -> TopLoc_Datum3D: ...
    def Transparency(self) -> float: ...
    def TypeOfPresentation3d(self) -> PrsMgr_TypeOfPresentation3d: ...
    def UnsetAttributes(self) -> None: ...
    def UnsetColor(self) -> None: ...
    def UnsetDisplayMode(self) -> None: ...
    def UnsetHilightAttributes(self) -> None: ...
    def UnsetHilightMode(self) -> None: ...
    def UnsetMaterial(self) -> None: ...
    def UnsetTransparency(self) -> None: ...
    def UnsetWidth(self) -> None: ...
    def UpdateTransformation(self) -> None: ...
    def ViewAffinity(self) -> Graphic3d_ViewAffinity: ...
    def Width(self) -> float: ...
    def ZLayer(self) -> Graphic3d_ZLayerId: ...

class PrsMgr_Presentation(Graphic3d_Structure):
    def Clear(self, theWithDestruction: Optional[bool] = True) -> None: ...
    def Compute(self) -> None: ...
    def Display(self) -> None: ...
    def DumpJson(self, depth: Optional[int]=-1) -> str: ...
    def Erase(self) -> None: ...
    def Highlight(self, theStyle: Prs3d_Drawer) -> None: ...
    def IsDisplayed(self) -> bool: ...
    def Mode(self) -> int: ...
    def MustBeUpdated(self) -> bool: ...
    def Presentation(self) -> Prs3d_Presentation: ...
    def PresentationManager(self) -> PrsMgr_PresentationManager: ...
    def SetUpdateStatus(self, theUpdateStatus: bool) -> None: ...
    def Unhighlight(self) -> None: ...

class PrsMgr_PresentationManager(Standard_Transient):
    def __init__(self, theStructureManager: Graphic3d_StructureManager) -> None: ...
    def AddToImmediateList(self, thePrs: Prs3d_Presentation) -> None: ...
    def BeginImmediateDraw(self) -> None: ...
    def Clear(self, thePrsObject: PrsMgr_PresentableObject, theMode: Optional[int] = 0) -> None: ...
    def ClearImmediateDraw(self) -> None: ...
    def Color(self, thePrsObject: PrsMgr_PresentableObject, theStyle: Prs3d_Drawer, theMode: Optional[int] = 0, theSelObj: Optional[PrsMgr_PresentableObject] = None, theImmediateStructLayerId: Optional[int] = Graphic3d_ZLayerId_Topmost) -> None: ...
    def Connect(self, thePrsObject: PrsMgr_PresentableObject, theOtherObject: PrsMgr_PresentableObject, theMode: Optional[int] = 0, theOtherMode: Optional[int] = 0) -> None: ...
    def Display(self, thePrsObject: PrsMgr_PresentableObject, theMode: Optional[int] = 0) -> None: ...
    def DisplayPriority(self, thePrsObject: PrsMgr_PresentableObject, theMode: int) -> Graphic3d_DisplayPriority: ...
    def EndImmediateDraw(self, theViewer: V3d_Viewer) -> None: ...
    def Erase(self, thePrsObject: PrsMgr_PresentableObject, theMode: Optional[int] = 0) -> None: ...
    def GetZLayer(self, thePrsObject: PrsMgr_PresentableObject) -> Graphic3d_ZLayerId: ...
    def HasPresentation(self, thePrsObject: PrsMgr_PresentableObject, theMode: Optional[int] = 0) -> bool: ...
    def IsDisplayed(self, thePrsObject: PrsMgr_PresentableObject, theMode: Optional[int] = 0) -> bool: ...
    def IsHighlighted(self, thePrsObject: PrsMgr_PresentableObject, theMode: Optional[int] = 0) -> bool: ...
    def IsImmediateModeOn(self) -> bool: ...
    def Presentation(self, thePrsObject: PrsMgr_PresentableObject, theMode: Optional[int] = 0, theToCreate: Optional[bool] = False, theSelObj: Optional[PrsMgr_PresentableObject] = None) -> PrsMgr_Presentation: ...
    def RedrawImmediate(self, theViewer: V3d_Viewer) -> None: ...
    def SetDisplayPriority(self, thePrsObject: PrsMgr_PresentableObject, theMode: int, theNewPrior: Graphic3d_DisplayPriority) -> None: ...
    def SetVisibility(self, thePrsObject: PrsMgr_PresentableObject, theMode: int, theValue: bool) -> None: ...
    def SetZLayer(self, thePrsObject: PrsMgr_PresentableObject, theLayerId: int) -> None: ...
    def StructureManager(self) -> Graphic3d_StructureManager: ...
    def Transform(self, thePrsObject: PrsMgr_PresentableObject, theTransformation: TopLoc_Datum3D, theMode: Optional[int] = 0) -> None: ...
    def Unhighlight(self, thePrsObject: PrsMgr_PresentableObject) -> None: ...
    def Update(self, thePrsObject: PrsMgr_PresentableObject, theMode: Optional[int] = 0) -> None: ...
    def UpdateHighlightTrsf(self, theViewer: V3d_Viewer, theObj: PrsMgr_PresentableObject, theMode: Optional[int] = 0, theSelObj: Optional[PrsMgr_PresentableObject] = None) -> None: ...

# harray1 classes
# harray2 classes
# hsequence classes

