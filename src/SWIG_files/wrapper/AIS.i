/*
Copyright 2008-2026 Thomas Paviot (tpaviot@gmail.com)

This file is part of pythonOCC.
pythonOCC is free software: you can redistribute it and/or modify
it under the terms of the GNU Lesser General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

pythonOCC is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU Lesser General Public License for more details.

You should have received a copy of the GNU Lesser General Public License
along with pythonOCC.  If not, see <http://www.gnu.org/licenses/>.
*/
%define AISDOCSTRING
"AIS module, see official documentation at
https://dev.opencascade.org/doc/occt-7.9.0/refman/html/package_ais.html"
%enddef
%module (package="OCC.Core", docstring=AISDOCSTRING) AIS


%{
#ifdef WNT
#pragma warning(disable : 4716)
#endif
%}

%include ../common/CommonIncludes.i
%include ../common/ExceptionCatcher.i
%include ../common/FunctionTransformers.i
%include ../common/EnumTemplates.i
%include ../common/Operators.i
%include ../common/OccHandle.i
%include ../common/IOStream.i
%include ../common/ArrayMacros.i


%{
#include<AIS_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<SelectMgr_module.hxx>
#include<Media_module.hxx>
#include<PrsMgr_module.hxx>
#include<TCollection_module.hxx>
#include<Quantity_module.hxx>
#include<TopAbs_module.hxx>
#include<TopoDS_module.hxx>
#include<Prs3d_module.hxx>
#include<TColStd_module.hxx>
#include<Aspect_module.hxx>
#include<Graphic3d_module.hxx>
#include<V3d_module.hxx>
#include<Bnd_module.hxx>
#include<gp_module.hxx>
#include<TopLoc_module.hxx>
#include<StdSelect_module.hxx>
#include<TColgp_module.hxx>
#include<Select3D_module.hxx>
#include<SelectBasics_module.hxx>
#include<Geom_module.hxx>
#include<Poly_module.hxx>
#include<Image_module.hxx>
#include<TopTools_module.hxx>
#include<Message_module.hxx>
#include<TShort_module.hxx>
#include<SelectBasics_module.hxx>
#include<HLRAlgo_module.hxx>
#include<TColQuantity_module.hxx>
#include<SelectMgr_module.hxx>
#include<BRep_module.hxx>
#include<Geom2d_module.hxx>
#include<GeomAdaptor_module.hxx>
#include<Adaptor2d_module.hxx>
#include<BRepAdaptor_module.hxx>
#include<Adaptor3d_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import SelectMgr.i
%import Media.i
%import PrsMgr.i
%import TCollection.i
%import Quantity.i
%import TopAbs.i
%import TopoDS.i
%import Prs3d.i
%import TColStd.i
%import Aspect.i
%import Graphic3d.i
%import V3d.i
%import Bnd.i
%import gp.i
%import TopLoc.i
%import StdSelect.i
%import TColgp.i
%import Select3D.i
%import SelectBasics.i
%import Geom.i
%import Poly.i
%import Image.i

%pythoncode {
from enum import IntEnum
from OCC.Core.Exception import *
};

/* public enums */
enum AIS_DisplayMode {
	AIS_WireFrame = 0,
	AIS_Shaded = 1,
};

enum AIS_DragAction {
	AIS_DragAction_Start = 0,
	AIS_DragAction_Confirmed = 1,
	AIS_DragAction_Update = 2,
	AIS_DragAction_Stop = 3,
	AIS_DragAction_Abort = 4,
};

enum AIS_KindOfInteractive {
	AIS_KindOfInteractive_None = 0,
	AIS_KindOfInteractive_Datum = 1,
	AIS_KindOfInteractive_Shape = 2,
	AIS_KindOfInteractive_Object = 3,
	AIS_KindOfInteractive_Relation = 4,
	AIS_KindOfInteractive_Dimension = 5,
	AIS_KindOfInteractive_LightSource = 6,
	AIS_KOI_None = AIS_KindOfInteractive_None,
	AIS_KOI_Datum = AIS_KindOfInteractive_Datum,
	AIS_KOI_Shape = AIS_KindOfInteractive_Shape,
	AIS_KOI_Object = AIS_KindOfInteractive_Object,
	AIS_KOI_Relation = AIS_KindOfInteractive_Relation,
	AIS_KOI_Dimension = AIS_KindOfInteractive_Dimension,
};

enum AIS_ManipulatorMode {
	AIS_MM_None = 0,
	AIS_MM_Translation = 1,
	AIS_MM_Rotation = 2,
	AIS_MM_Scaling = 3,
	AIS_MM_TranslationPlane = 4,
};

enum AIS_MouseGesture {
	AIS_MouseGesture_NONE = 0,
	AIS_MouseGesture_SelectRectangle = 1,
	AIS_MouseGesture_SelectLasso = 2,
	AIS_MouseGesture_Zoom = 3,
	AIS_MouseGesture_ZoomVertical = 4,
	AIS_MouseGesture_ZoomWindow = 5,
	AIS_MouseGesture_Pan = 6,
	AIS_MouseGesture_RotateOrbit = 7,
	AIS_MouseGesture_RotateView = 8,
	AIS_MouseGesture_Drag = 9,
};

enum AIS_NavigationMode {
	AIS_NavigationMode_Orbit = 0,
	AIS_NavigationMode_FirstPersonFlight = 1,
	AIS_NavigationMode_FirstPersonWalk = 2,
};

enum  {
	AIS_NavigationMode_LOWER = 0,
	AIS_NavigationMode_UPPER = AIS_NavigationMode_FirstPersonWalk,
};

enum AIS_RotationMode {
	AIS_RotationMode_BndBoxActive = 0,
	AIS_RotationMode_PickLast = 1,
	AIS_RotationMode_PickCenter = 2,
	AIS_RotationMode_CameraAt = 3,
	AIS_RotationMode_BndBoxScene = 4,
};

enum  {
	AIS_RotationMode_LOWER = 0,
	AIS_RotationMode_UPPER = AIS_RotationMode_BndBoxScene,
};

enum AIS_SelectStatus {
	AIS_SS_Added = 0,
	AIS_SS_Removed = 1,
	AIS_SS_NotDone = 2,
};

enum AIS_SelectionModesConcurrency {
	AIS_SelectionModesConcurrency_Single = 0,
	AIS_SelectionModesConcurrency_GlobalOrLocal = 1,
	AIS_SelectionModesConcurrency_Multiple = 2,
};

enum AIS_SelectionScheme {
	AIS_SelectionScheme_UNKNOWN = - 1,
	AIS_SelectionScheme_Replace = 0,
	AIS_SelectionScheme_Add = 1,
	AIS_SelectionScheme_Remove = 2,
	AIS_SelectionScheme_XOR = 3,
	AIS_SelectionScheme_Clear = 4,
	AIS_SelectionScheme_ReplaceExtra = 5,
};

enum AIS_StatusOfDetection {
	AIS_SOD_Error = 0,
	AIS_SOD_Nothing = 1,
	AIS_SOD_AllBad = 2,
	AIS_SOD_Selected = 3,
	AIS_SOD_OnlyOneDetected = 4,
	AIS_SOD_OnlyOneGood = 5,
	AIS_SOD_SeveralGood = 6,
};

enum AIS_StatusOfPick {
	AIS_SOP_Error = 0,
	AIS_SOP_NothingSelected = 1,
	AIS_SOP_Removed = 2,
	AIS_SOP_OneSelected = 3,
	AIS_SOP_SeveralSelected = 4,
};

enum AIS_TrihedronSelectionMode {
	AIS_TrihedronSelectionMode_EntireObject = 0,
	AIS_TrihedronSelectionMode_Origin = 1,
	AIS_TrihedronSelectionMode_Axes = 2,
	AIS_TrihedronSelectionMode_MainPlanes = 3,
};

enum AIS_TypeOfAttribute {
	AIS_TOA_Line = 0,
	AIS_TOA_Dimension = 1,
	AIS_TOA_Wire = 2,
	AIS_TOA_Plane = 3,
	AIS_TOA_Vector = 4,
	AIS_TOA_UIso = 5,
	AIS_TOA_VIso = 6,
	AIS_TOA_Free = 7,
	AIS_TOA_UnFree = 8,
	AIS_TOA_Section = 9,
	AIS_TOA_Hidden = 10,
	AIS_TOA_Seen = 11,
	AIS_TOA_FaceBoundary = 12,
	AIS_TOA_FirstAxis = 13,
	AIS_TOA_SecondAxis = 14,
	AIS_TOA_ThirdAxis = 15,
};

enum AIS_TypeOfAxis {
	AIS_TOAX_Unknown = 0,
	AIS_TOAX_XAxis = 1,
	AIS_TOAX_YAxis = 2,
	AIS_TOAX_ZAxis = 3,
};

enum AIS_TypeOfIso {
	AIS_TOI_IsoU = 0,
	AIS_TOI_IsoV = 1,
	AIS_TOI_Both = 2,
};

enum AIS_TypeOfPlane {
	AIS_TOPL_Unknown = 0,
	AIS_TOPL_XYPlane = 1,
	AIS_TOPL_XZPlane = 2,
	AIS_TOPL_YZPlane = 3,
};

enum AIS_ViewSelectionTool {
	AIS_ViewSelectionTool_Picking = 0,
	AIS_ViewSelectionTool_RubberBand = 1,
	AIS_ViewSelectionTool_Polygon = 2,
	AIS_ViewSelectionTool_ZoomWindow = 3,
};

enum AIS_ViewInputBufferType {
	AIS_ViewInputBufferType_UI = 0,
	AIS_ViewInputBufferType_GL = 1,
};

enum AIS_WalkTranslation {
	AIS_WalkTranslation_Forward = 0,
	AIS_WalkTranslation_Side = 1,
	AIS_WalkTranslation_Up = 2,
};

enum AIS_WalkRotation {
	AIS_WalkRotation_Yaw = 0,
	AIS_WalkRotation_Pitch = 1,
	AIS_WalkRotation_Roll = 2,
};

/* end public enums declaration */

/* python proxy classes for enums */
%pythoncode {

class AIS_DisplayMode(IntEnum):
	AIS_WireFrame = 0
	AIS_Shaded = 1
AIS_WireFrame = AIS_DisplayMode.AIS_WireFrame
AIS_Shaded = AIS_DisplayMode.AIS_Shaded

class AIS_DragAction(IntEnum):
	AIS_DragAction_Start = 0
	AIS_DragAction_Confirmed = 1
	AIS_DragAction_Update = 2
	AIS_DragAction_Stop = 3
	AIS_DragAction_Abort = 4
AIS_DragAction_Start = AIS_DragAction.AIS_DragAction_Start
AIS_DragAction_Confirmed = AIS_DragAction.AIS_DragAction_Confirmed
AIS_DragAction_Update = AIS_DragAction.AIS_DragAction_Update
AIS_DragAction_Stop = AIS_DragAction.AIS_DragAction_Stop
AIS_DragAction_Abort = AIS_DragAction.AIS_DragAction_Abort

class AIS_KindOfInteractive(IntEnum):
	AIS_KindOfInteractive_None = 0
	AIS_KindOfInteractive_Datum = 1
	AIS_KindOfInteractive_Shape = 2
	AIS_KindOfInteractive_Object = 3
	AIS_KindOfInteractive_Relation = 4
	AIS_KindOfInteractive_Dimension = 5
	AIS_KindOfInteractive_LightSource = 6
	AIS_KOI_None = AIS_KindOfInteractive_None
	AIS_KOI_Datum = AIS_KindOfInteractive_Datum
	AIS_KOI_Shape = AIS_KindOfInteractive_Shape
	AIS_KOI_Object = AIS_KindOfInteractive_Object
	AIS_KOI_Relation = AIS_KindOfInteractive_Relation
	AIS_KOI_Dimension = AIS_KindOfInteractive_Dimension
AIS_KindOfInteractive_None = AIS_KindOfInteractive.AIS_KindOfInteractive_None
AIS_KindOfInteractive_Datum = AIS_KindOfInteractive.AIS_KindOfInteractive_Datum
AIS_KindOfInteractive_Shape = AIS_KindOfInteractive.AIS_KindOfInteractive_Shape
AIS_KindOfInteractive_Object = AIS_KindOfInteractive.AIS_KindOfInteractive_Object
AIS_KindOfInteractive_Relation = AIS_KindOfInteractive.AIS_KindOfInteractive_Relation
AIS_KindOfInteractive_Dimension = AIS_KindOfInteractive.AIS_KindOfInteractive_Dimension
AIS_KindOfInteractive_LightSource = AIS_KindOfInteractive.AIS_KindOfInteractive_LightSource
AIS_KOI_None = AIS_KindOfInteractive.AIS_KOI_None
AIS_KOI_Datum = AIS_KindOfInteractive.AIS_KOI_Datum
AIS_KOI_Shape = AIS_KindOfInteractive.AIS_KOI_Shape
AIS_KOI_Object = AIS_KindOfInteractive.AIS_KOI_Object
AIS_KOI_Relation = AIS_KindOfInteractive.AIS_KOI_Relation
AIS_KOI_Dimension = AIS_KindOfInteractive.AIS_KOI_Dimension

class AIS_ManipulatorMode(IntEnum):
	AIS_MM_None = 0
	AIS_MM_Translation = 1
	AIS_MM_Rotation = 2
	AIS_MM_Scaling = 3
	AIS_MM_TranslationPlane = 4
AIS_MM_None = AIS_ManipulatorMode.AIS_MM_None
AIS_MM_Translation = AIS_ManipulatorMode.AIS_MM_Translation
AIS_MM_Rotation = AIS_ManipulatorMode.AIS_MM_Rotation
AIS_MM_Scaling = AIS_ManipulatorMode.AIS_MM_Scaling
AIS_MM_TranslationPlane = AIS_ManipulatorMode.AIS_MM_TranslationPlane

class AIS_MouseGesture(IntEnum):
	AIS_MouseGesture_NONE = 0
	AIS_MouseGesture_SelectRectangle = 1
	AIS_MouseGesture_SelectLasso = 2
	AIS_MouseGesture_Zoom = 3
	AIS_MouseGesture_ZoomVertical = 4
	AIS_MouseGesture_ZoomWindow = 5
	AIS_MouseGesture_Pan = 6
	AIS_MouseGesture_RotateOrbit = 7
	AIS_MouseGesture_RotateView = 8
	AIS_MouseGesture_Drag = 9
AIS_MouseGesture_NONE = AIS_MouseGesture.AIS_MouseGesture_NONE
AIS_MouseGesture_SelectRectangle = AIS_MouseGesture.AIS_MouseGesture_SelectRectangle
AIS_MouseGesture_SelectLasso = AIS_MouseGesture.AIS_MouseGesture_SelectLasso
AIS_MouseGesture_Zoom = AIS_MouseGesture.AIS_MouseGesture_Zoom
AIS_MouseGesture_ZoomVertical = AIS_MouseGesture.AIS_MouseGesture_ZoomVertical
AIS_MouseGesture_ZoomWindow = AIS_MouseGesture.AIS_MouseGesture_ZoomWindow
AIS_MouseGesture_Pan = AIS_MouseGesture.AIS_MouseGesture_Pan
AIS_MouseGesture_RotateOrbit = AIS_MouseGesture.AIS_MouseGesture_RotateOrbit
AIS_MouseGesture_RotateView = AIS_MouseGesture.AIS_MouseGesture_RotateView
AIS_MouseGesture_Drag = AIS_MouseGesture.AIS_MouseGesture_Drag

class AIS_NavigationMode(IntEnum):
	AIS_NavigationMode_Orbit = 0
	AIS_NavigationMode_FirstPersonFlight = 1
	AIS_NavigationMode_FirstPersonWalk = 2
AIS_NavigationMode_Orbit = AIS_NavigationMode.AIS_NavigationMode_Orbit
AIS_NavigationMode_FirstPersonFlight = AIS_NavigationMode.AIS_NavigationMode_FirstPersonFlight
AIS_NavigationMode_FirstPersonWalk = AIS_NavigationMode.AIS_NavigationMode_FirstPersonWalk

class AIS_RotationMode(IntEnum):
	AIS_RotationMode_BndBoxActive = 0
	AIS_RotationMode_PickLast = 1
	AIS_RotationMode_PickCenter = 2
	AIS_RotationMode_CameraAt = 3
	AIS_RotationMode_BndBoxScene = 4
AIS_RotationMode_BndBoxActive = AIS_RotationMode.AIS_RotationMode_BndBoxActive
AIS_RotationMode_PickLast = AIS_RotationMode.AIS_RotationMode_PickLast
AIS_RotationMode_PickCenter = AIS_RotationMode.AIS_RotationMode_PickCenter
AIS_RotationMode_CameraAt = AIS_RotationMode.AIS_RotationMode_CameraAt
AIS_RotationMode_BndBoxScene = AIS_RotationMode.AIS_RotationMode_BndBoxScene

class AIS_SelectStatus(IntEnum):
	AIS_SS_Added = 0
	AIS_SS_Removed = 1
	AIS_SS_NotDone = 2
AIS_SS_Added = AIS_SelectStatus.AIS_SS_Added
AIS_SS_Removed = AIS_SelectStatus.AIS_SS_Removed
AIS_SS_NotDone = AIS_SelectStatus.AIS_SS_NotDone

class AIS_SelectionModesConcurrency(IntEnum):
	AIS_SelectionModesConcurrency_Single = 0
	AIS_SelectionModesConcurrency_GlobalOrLocal = 1
	AIS_SelectionModesConcurrency_Multiple = 2
AIS_SelectionModesConcurrency_Single = AIS_SelectionModesConcurrency.AIS_SelectionModesConcurrency_Single
AIS_SelectionModesConcurrency_GlobalOrLocal = AIS_SelectionModesConcurrency.AIS_SelectionModesConcurrency_GlobalOrLocal
AIS_SelectionModesConcurrency_Multiple = AIS_SelectionModesConcurrency.AIS_SelectionModesConcurrency_Multiple

class AIS_SelectionScheme(IntEnum):
	AIS_SelectionScheme_UNKNOWN = - 1
	AIS_SelectionScheme_Replace = 0
	AIS_SelectionScheme_Add = 1
	AIS_SelectionScheme_Remove = 2
	AIS_SelectionScheme_XOR = 3
	AIS_SelectionScheme_Clear = 4
	AIS_SelectionScheme_ReplaceExtra = 5
AIS_SelectionScheme_UNKNOWN = AIS_SelectionScheme.AIS_SelectionScheme_UNKNOWN
AIS_SelectionScheme_Replace = AIS_SelectionScheme.AIS_SelectionScheme_Replace
AIS_SelectionScheme_Add = AIS_SelectionScheme.AIS_SelectionScheme_Add
AIS_SelectionScheme_Remove = AIS_SelectionScheme.AIS_SelectionScheme_Remove
AIS_SelectionScheme_XOR = AIS_SelectionScheme.AIS_SelectionScheme_XOR
AIS_SelectionScheme_Clear = AIS_SelectionScheme.AIS_SelectionScheme_Clear
AIS_SelectionScheme_ReplaceExtra = AIS_SelectionScheme.AIS_SelectionScheme_ReplaceExtra

class AIS_StatusOfDetection(IntEnum):
	AIS_SOD_Error = 0
	AIS_SOD_Nothing = 1
	AIS_SOD_AllBad = 2
	AIS_SOD_Selected = 3
	AIS_SOD_OnlyOneDetected = 4
	AIS_SOD_OnlyOneGood = 5
	AIS_SOD_SeveralGood = 6
AIS_SOD_Error = AIS_StatusOfDetection.AIS_SOD_Error
AIS_SOD_Nothing = AIS_StatusOfDetection.AIS_SOD_Nothing
AIS_SOD_AllBad = AIS_StatusOfDetection.AIS_SOD_AllBad
AIS_SOD_Selected = AIS_StatusOfDetection.AIS_SOD_Selected
AIS_SOD_OnlyOneDetected = AIS_StatusOfDetection.AIS_SOD_OnlyOneDetected
AIS_SOD_OnlyOneGood = AIS_StatusOfDetection.AIS_SOD_OnlyOneGood
AIS_SOD_SeveralGood = AIS_StatusOfDetection.AIS_SOD_SeveralGood

class AIS_StatusOfPick(IntEnum):
	AIS_SOP_Error = 0
	AIS_SOP_NothingSelected = 1
	AIS_SOP_Removed = 2
	AIS_SOP_OneSelected = 3
	AIS_SOP_SeveralSelected = 4
AIS_SOP_Error = AIS_StatusOfPick.AIS_SOP_Error
AIS_SOP_NothingSelected = AIS_StatusOfPick.AIS_SOP_NothingSelected
AIS_SOP_Removed = AIS_StatusOfPick.AIS_SOP_Removed
AIS_SOP_OneSelected = AIS_StatusOfPick.AIS_SOP_OneSelected
AIS_SOP_SeveralSelected = AIS_StatusOfPick.AIS_SOP_SeveralSelected

class AIS_TrihedronSelectionMode(IntEnum):
	AIS_TrihedronSelectionMode_EntireObject = 0
	AIS_TrihedronSelectionMode_Origin = 1
	AIS_TrihedronSelectionMode_Axes = 2
	AIS_TrihedronSelectionMode_MainPlanes = 3
AIS_TrihedronSelectionMode_EntireObject = AIS_TrihedronSelectionMode.AIS_TrihedronSelectionMode_EntireObject
AIS_TrihedronSelectionMode_Origin = AIS_TrihedronSelectionMode.AIS_TrihedronSelectionMode_Origin
AIS_TrihedronSelectionMode_Axes = AIS_TrihedronSelectionMode.AIS_TrihedronSelectionMode_Axes
AIS_TrihedronSelectionMode_MainPlanes = AIS_TrihedronSelectionMode.AIS_TrihedronSelectionMode_MainPlanes

class AIS_TypeOfAttribute(IntEnum):
	AIS_TOA_Line = 0
	AIS_TOA_Dimension = 1
	AIS_TOA_Wire = 2
	AIS_TOA_Plane = 3
	AIS_TOA_Vector = 4
	AIS_TOA_UIso = 5
	AIS_TOA_VIso = 6
	AIS_TOA_Free = 7
	AIS_TOA_UnFree = 8
	AIS_TOA_Section = 9
	AIS_TOA_Hidden = 10
	AIS_TOA_Seen = 11
	AIS_TOA_FaceBoundary = 12
	AIS_TOA_FirstAxis = 13
	AIS_TOA_SecondAxis = 14
	AIS_TOA_ThirdAxis = 15
AIS_TOA_Line = AIS_TypeOfAttribute.AIS_TOA_Line
AIS_TOA_Dimension = AIS_TypeOfAttribute.AIS_TOA_Dimension
AIS_TOA_Wire = AIS_TypeOfAttribute.AIS_TOA_Wire
AIS_TOA_Plane = AIS_TypeOfAttribute.AIS_TOA_Plane
AIS_TOA_Vector = AIS_TypeOfAttribute.AIS_TOA_Vector
AIS_TOA_UIso = AIS_TypeOfAttribute.AIS_TOA_UIso
AIS_TOA_VIso = AIS_TypeOfAttribute.AIS_TOA_VIso
AIS_TOA_Free = AIS_TypeOfAttribute.AIS_TOA_Free
AIS_TOA_UnFree = AIS_TypeOfAttribute.AIS_TOA_UnFree
AIS_TOA_Section = AIS_TypeOfAttribute.AIS_TOA_Section
AIS_TOA_Hidden = AIS_TypeOfAttribute.AIS_TOA_Hidden
AIS_TOA_Seen = AIS_TypeOfAttribute.AIS_TOA_Seen
AIS_TOA_FaceBoundary = AIS_TypeOfAttribute.AIS_TOA_FaceBoundary
AIS_TOA_FirstAxis = AIS_TypeOfAttribute.AIS_TOA_FirstAxis
AIS_TOA_SecondAxis = AIS_TypeOfAttribute.AIS_TOA_SecondAxis
AIS_TOA_ThirdAxis = AIS_TypeOfAttribute.AIS_TOA_ThirdAxis

class AIS_TypeOfAxis(IntEnum):
	AIS_TOAX_Unknown = 0
	AIS_TOAX_XAxis = 1
	AIS_TOAX_YAxis = 2
	AIS_TOAX_ZAxis = 3
AIS_TOAX_Unknown = AIS_TypeOfAxis.AIS_TOAX_Unknown
AIS_TOAX_XAxis = AIS_TypeOfAxis.AIS_TOAX_XAxis
AIS_TOAX_YAxis = AIS_TypeOfAxis.AIS_TOAX_YAxis
AIS_TOAX_ZAxis = AIS_TypeOfAxis.AIS_TOAX_ZAxis

class AIS_TypeOfIso(IntEnum):
	AIS_TOI_IsoU = 0
	AIS_TOI_IsoV = 1
	AIS_TOI_Both = 2
AIS_TOI_IsoU = AIS_TypeOfIso.AIS_TOI_IsoU
AIS_TOI_IsoV = AIS_TypeOfIso.AIS_TOI_IsoV
AIS_TOI_Both = AIS_TypeOfIso.AIS_TOI_Both

class AIS_TypeOfPlane(IntEnum):
	AIS_TOPL_Unknown = 0
	AIS_TOPL_XYPlane = 1
	AIS_TOPL_XZPlane = 2
	AIS_TOPL_YZPlane = 3
AIS_TOPL_Unknown = AIS_TypeOfPlane.AIS_TOPL_Unknown
AIS_TOPL_XYPlane = AIS_TypeOfPlane.AIS_TOPL_XYPlane
AIS_TOPL_XZPlane = AIS_TypeOfPlane.AIS_TOPL_XZPlane
AIS_TOPL_YZPlane = AIS_TypeOfPlane.AIS_TOPL_YZPlane

class AIS_ViewSelectionTool(IntEnum):
	AIS_ViewSelectionTool_Picking = 0
	AIS_ViewSelectionTool_RubberBand = 1
	AIS_ViewSelectionTool_Polygon = 2
	AIS_ViewSelectionTool_ZoomWindow = 3
AIS_ViewSelectionTool_Picking = AIS_ViewSelectionTool.AIS_ViewSelectionTool_Picking
AIS_ViewSelectionTool_RubberBand = AIS_ViewSelectionTool.AIS_ViewSelectionTool_RubberBand
AIS_ViewSelectionTool_Polygon = AIS_ViewSelectionTool.AIS_ViewSelectionTool_Polygon
AIS_ViewSelectionTool_ZoomWindow = AIS_ViewSelectionTool.AIS_ViewSelectionTool_ZoomWindow

class AIS_ViewInputBufferType(IntEnum):
	AIS_ViewInputBufferType_UI = 0
	AIS_ViewInputBufferType_GL = 1
AIS_ViewInputBufferType_UI = AIS_ViewInputBufferType.AIS_ViewInputBufferType_UI
AIS_ViewInputBufferType_GL = AIS_ViewInputBufferType.AIS_ViewInputBufferType_GL

class AIS_WalkTranslation(IntEnum):
	AIS_WalkTranslation_Forward = 0
	AIS_WalkTranslation_Side = 1
	AIS_WalkTranslation_Up = 2
AIS_WalkTranslation_Forward = AIS_WalkTranslation.AIS_WalkTranslation_Forward
AIS_WalkTranslation_Side = AIS_WalkTranslation.AIS_WalkTranslation_Side
AIS_WalkTranslation_Up = AIS_WalkTranslation.AIS_WalkTranslation_Up

class AIS_WalkRotation(IntEnum):
	AIS_WalkRotation_Yaw = 0
	AIS_WalkRotation_Pitch = 1
	AIS_WalkRotation_Roll = 2
AIS_WalkRotation_Yaw = AIS_WalkRotation.AIS_WalkRotation_Yaw
AIS_WalkRotation_Pitch = AIS_WalkRotation.AIS_WalkRotation_Pitch
AIS_WalkRotation_Roll = AIS_WalkRotation.AIS_WalkRotation_Roll
};
/* end python proxy for enums */

/* handles */
%wrap_handle(AIS_Animation)
%wrap_handle(AIS_AttributeFilter)
%wrap_handle(AIS_BadEdgeFilter)
%wrap_handle(AIS_C0RegularityFilter)
%wrap_handle(AIS_ColoredDrawer)
%wrap_handle(AIS_ExclusionFilter)
%wrap_handle(AIS_GlobalStatus)
%wrap_handle(AIS_InteractiveContext)
%wrap_handle(AIS_InteractiveObject)
%wrap_handle(AIS_LightSourceOwner)
%wrap_handle(AIS_ManipulatorOwner)
%wrap_handle(AIS_PointCloudOwner)
%wrap_handle(AIS_Selection)
%wrap_handle(AIS_TrihedronOwner)
%wrap_handle(AIS_TypeFilter)
%wrap_handle(AIS_ViewCubeOwner)
%wrap_handle(AIS_ViewCubeSensitive)
%wrap_handle(AIS_AnimationCamera)
%wrap_handle(AIS_Axis)
%wrap_handle(AIS_BaseAnimationObject)
%wrap_handle(AIS_CameraFrustum)
%wrap_handle(AIS_Circle)
%wrap_handle(AIS_ColorScale)
%wrap_handle(AIS_ConnectedInteractive)
%wrap_handle(AIS_LightSource)
%wrap_handle(AIS_Line)
%wrap_handle(AIS_Manipulator)
%wrap_handle(AIS_MediaPlayer)
%wrap_handle(AIS_MultipleConnectedInteractive)
%wrap_handle(AIS_Plane)
%wrap_handle(AIS_PlaneTrihedron)
%wrap_handle(AIS_Point)
%wrap_handle(AIS_PointCloud)
%wrap_handle(AIS_RubberBand)
%wrap_handle(AIS_Shape)
%wrap_handle(AIS_SignatureFilter)
%wrap_handle(AIS_TextLabel)
%wrap_handle(AIS_Triangulation)
%wrap_handle(AIS_Trihedron)
%wrap_handle(AIS_ViewCube)
%wrap_handle(AIS_XRTrackedDevice)
%wrap_handle(AIS_AnimationAxisRotation)
%wrap_handle(AIS_AnimationObject)
%wrap_handle(AIS_ColoredShape)
%wrap_handle(AIS_TexturedShape)
/* end handles declaration */

/* templates */
%ignore NCollection_DataMap<opencascade::handle<AIS_InteractiveObject>,opencascade::handle<AIS_GlobalStatus>>::Items;
%ignore NCollection_DataMap<opencascade::handle<AIS_InteractiveObject>,opencascade::handle<AIS_GlobalStatus>>::KeyValues;
%template(AIS_DataMapOfIOStatus) NCollection_DataMap<opencascade::handle<AIS_InteractiveObject>,opencascade::handle<AIS_GlobalStatus>>;
%ignore NCollection_DataMap<TopoDS_Shape,opencascade::handle<AIS_ColoredDrawer>,TopTools_ShapeMapHasher>::Items;
%ignore NCollection_DataMap<TopoDS_Shape,opencascade::handle<AIS_ColoredDrawer>,TopTools_ShapeMapHasher>::KeyValues;
%template(AIS_DataMapOfShapeDrawer) NCollection_DataMap<TopoDS_Shape,opencascade::handle<AIS_ColoredDrawer>,TopTools_ShapeMapHasher>;
%template(AIS_ListIteratorOfListOfInteractive) NCollection_TListIterator<opencascade::handle<AIS_InteractiveObject>>;
%template(AIS_ListOfInteractive) NCollection_List<opencascade::handle<AIS_InteractiveObject>>;

%extend NCollection_List<opencascade::handle<AIS_InteractiveObject>> {
    // occt-800: re-export Size/Length/IsEmpty per instantiation; the
    // NCollection_BaseList header is wrapped but its inherited methods
    // don't propagate cleanly to the typedef-aliased Python class.
    size_t Size() const noexcept { return $self->Size(); }
    int Length() const noexcept { return $self->Length(); }
    bool IsEmpty() const noexcept { return $self->IsEmpty(); }
    %pythoncode {
    def __len__(self):
        return self.Size()

    def __iter__(self):
        it = AIS_ListIteratorOfListOfInteractive(self)
        while it.More():
            yield it.Value()
            it.Next()
    }
};
%template(AIS_NArray1OfEntityOwner) NCollection_Array1<opencascade::handle<SelectMgr_EntityOwner>>;
Array1ExtendIter(opencascade::handle<SelectMgr_EntityOwner>)

%template(AIS_NListOfEntityOwner) NCollection_List<opencascade::handle<SelectMgr_EntityOwner>>;

%extend NCollection_List<opencascade::handle<SelectMgr_EntityOwner>> {
    // occt-800: re-export Size/Length/IsEmpty per instantiation; the
    // NCollection_BaseList header is wrapped but its inherited methods
    // don't propagate cleanly to the typedef-aliased Python class.
    size_t Size() const noexcept { return $self->Size(); }
    int Length() const noexcept { return $self->Length(); }
    bool IsEmpty() const noexcept { return $self->IsEmpty(); }
    %pythoncode {
    def __len__(self):
        return self.Size()

    def __iter__(self):
        it = AIS_NListIteratorOfListOfEntityOwner(self)
        while it.More():
            yield it.Value()
            it.Next()
    }
};
/* end templates declaration */

/* typedefs */
typedef Media_Timer AIS_AnimationTimer;
typedef NCollection_DataMap<opencascade::handle<AIS_InteractiveObject>, opencascade::handle<AIS_GlobalStatus>>::Iterator AIS_DataMapIteratorOfDataMapOfIOStatus;
typedef NCollection_DataMap<opencascade::handle<AIS_InteractiveObject>, opencascade::handle<AIS_GlobalStatus>> AIS_DataMapOfIOStatus;
typedef NCollection_DataMap<TopoDS_Shape, opencascade::handle<AIS_ColoredDrawer>, TopTools_ShapeMapHasher> AIS_DataMapOfShapeDrawer;
typedef PrsMgr_DisplayStatus AIS_DisplayStatus;
typedef NCollection_List<opencascade::handle<AIS_InteractiveObject>>::Iterator AIS_ListIteratorOfListOfInteractive;
typedef NCollection_List<opencascade::handle<AIS_InteractiveObject>> AIS_ListOfInteractive;
typedef NCollection_Array1<opencascade::handle<SelectMgr_EntityOwner>> AIS_NArray1OfEntityOwner;
typedef NCollection_List<opencascade::handle<SelectMgr_EntityOwner>> AIS_NListOfEntityOwner;
/* end typedefs declaration */

/************
* class AIS *
************/
%rename(ais) AIS;
class AIS {
	public:
};


%extend AIS {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************
* class AIS_Animation *
**********************/
class AIS_Animation : public Standard_Transient {
	public:
		/****** AIS_Animation::AIS_Animation ******/
		/****** md5 signature: 727aa36e0eb9a950096a860aa469ee16 ******/
		%feature("compactdefaultargs") AIS_Animation;
		%feature("autodoc", "
Parameters
----------
theAnimationName: str

Return
-------
None

Description
-----------
Creates empty animation.
") AIS_Animation;
		 AIS_Animation(TCollection_AsciiString theAnimationName);

		/****** AIS_Animation::Add ******/
		/****** md5 signature: b7202ad1c8c688e6eb7fda91d2734c8a ******/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
theAnimation: AIS_Animation

Return
-------
None

Description
-----------
Add single animation to the timeline. 
Parameter theAnimation input animation.
") Add;
		void Add(const opencascade::handle<AIS_Animation> & theAnimation);

		/****** AIS_Animation::Children ******/
		/****** md5 signature: 4d291cae5d0ccc80f46be7cb0940bb81 ******/
		%feature("compactdefaultargs") Children;
		%feature("autodoc", "Return
-------
NCollection_Sequence<opencascade::handle<AIS_Animation>>

Description
-----------
Return sequence of child animations.
") Children;
		const NCollection_Sequence<opencascade::handle<AIS_Animation>> & Children();

		/****** AIS_Animation::Clear ******/
		/****** md5 signature: ae54be580b423a6eadbe062e0bdb44c2 ******/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Return
-------
None

Description
-----------
Clear animation timeline - remove all animations from it.
") Clear;
		void Clear();

		/****** AIS_Animation::CopyFrom ******/
		/****** md5 signature: 7d3ff49ce8472b7f7d11949859063cb9 ******/
		%feature("compactdefaultargs") CopyFrom;
		%feature("autodoc", "
Parameters
----------
theOther: AIS_Animation

Return
-------
None

Description
-----------
Clears own children and then copy child animations from another object. Copy also Start Time and Duration values.
") CopyFrom;
		void CopyFrom(const opencascade::handle<AIS_Animation> & theOther);

		/****** AIS_Animation::Duration ******/
		/****** md5 signature: 7dbbe5f7e0b63b92819c252fd1239f67 ******/
		%feature("compactdefaultargs") Duration;
		%feature("autodoc", "Return
-------
double

Description
-----------
Return: duration of the animation in the timeline.
") Duration;
		double Duration();

		/****** AIS_Animation::ElapsedTime ******/
		/****** md5 signature: 28f2a1f1b712e0e5fb18dfda48c1dc8e ******/
		%feature("compactdefaultargs") ElapsedTime;
		%feature("autodoc", "Return
-------
double

Description
-----------
Return elapsed time.
") ElapsedTime;
		double ElapsedTime();

		/****** AIS_Animation::Find ******/
		/****** md5 signature: 9e22b1f4cfa3ba31fa4a06fb1ca92a95 ******/
		%feature("compactdefaultargs") Find;
		%feature("autodoc", "
Parameters
----------
theAnimationName: str

Return
-------
opencascade::handle<AIS_Animation>

Description
-----------
Return the child animation with the given name.
") Find;
		opencascade::handle<AIS_Animation> Find(TCollection_AsciiString theAnimationName);

		/****** AIS_Animation::HasOwnDuration ******/
		/****** md5 signature: 8ed9145143f28ca0e5118ad6e62ed1f8 ******/
		%feature("compactdefaultargs") HasOwnDuration;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Return true if duration is defined.
") HasOwnDuration;
		bool HasOwnDuration();

		/****** AIS_Animation::IsStopped ******/
		/****** md5 signature: 47d24d2d20eebce42247deefc3d90f95 ******/
		%feature("compactdefaultargs") IsStopped;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Check if animation is to be performed in the animation timeline. 
Return: True if it is stopped of finished.
") IsStopped;
		bool IsStopped();

		/****** AIS_Animation::Name ******/
		/****** md5 signature: efed61b92683387cd746fb27e0376505 ******/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "Return
-------
TCollection_AsciiString

Description
-----------
Animation name.
") Name;
		const TCollection_AsciiString & Name();

		/****** AIS_Animation::OwnDuration ******/
		/****** md5 signature: 15bdc81964fd7040280de0f6c773035c ******/
		%feature("compactdefaultargs") OwnDuration;
		%feature("autodoc", "Return
-------
double

Description
-----------
Return: own duration of the animation in the timeline.
") OwnDuration;
		double OwnDuration();

		/****** AIS_Animation::Pause ******/
		/****** md5 signature: 98a33dcef2fa2a4e7461512069a3757c ******/
		%feature("compactdefaultargs") Pause;
		%feature("autodoc", "Return
-------
None

Description
-----------
Pause the process timeline.
") Pause;
		virtual void Pause();

		/****** AIS_Animation::Remove ******/
		/****** md5 signature: 24df9c8ea6e2ac976323b46d8fba4712 ******/
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "
Parameters
----------
theAnimation: AIS_Animation

Return
-------
bool

Description
-----------
Remove the child animation.
") Remove;
		bool Remove(const opencascade::handle<AIS_Animation> & theAnimation);

		/****** AIS_Animation::Replace ******/
		/****** md5 signature: 16ef8da613e604459c8791b9ae064bd6 ******/
		%feature("compactdefaultargs") Replace;
		%feature("autodoc", "
Parameters
----------
theAnimationOld: AIS_Animation
theAnimationNew: AIS_Animation

Return
-------
bool

Description
-----------
Replace the child animation.
") Replace;
		bool Replace(const opencascade::handle<AIS_Animation> & theAnimationOld, const opencascade::handle<AIS_Animation> & theAnimationNew);

		/****** AIS_Animation::SetOwnDuration ******/
		/****** md5 signature: 4d906be5ad57cb382bfe15618ec08d81 ******/
		%feature("compactdefaultargs") SetOwnDuration;
		%feature("autodoc", "
Parameters
----------
theDuration: double

Return
-------
None

Description
-----------
Defines duration of the animation.
") SetOwnDuration;
		void SetOwnDuration(const double theDuration);

		/****** AIS_Animation::SetStartPts ******/
		/****** md5 signature: ed1cbd7e86437c8c1a5cefccbfa88852 ******/
		%feature("compactdefaultargs") SetStartPts;
		%feature("autodoc", "
Parameters
----------
thePtsStart: double

Return
-------
None

Description
-----------
Sets time limits for animation in the animation timeline.
") SetStartPts;
		void SetStartPts(const double thePtsStart);

		/****** AIS_Animation::SetTimer ******/
		/****** md5 signature: bc8c37bcd5d705b0ef533ab6789205d2 ******/
		%feature("compactdefaultargs") SetTimer;
		%feature("autodoc", "
Parameters
----------
theTimer: Media_Timer

Return
-------
None

Description
-----------
Set playback timer.
") SetTimer;
		void SetTimer(const opencascade::handle<Media_Timer> & theTimer);

		/****** AIS_Animation::Start ******/
		/****** md5 signature: 49c6ba1c6367ef94136492dc74e07dc7 ******/
		%feature("compactdefaultargs") Start;
		%feature("autodoc", "
Parameters
----------
theToUpdate: bool

Return
-------
None

Description
-----------
Start animation. This method changes status of the animation to Started. This status defines whether animation is to be performed in the timeline or not. 
Parameter theToUpdate call Update() method.
") Start;
		virtual void Start(const bool theToUpdate);

		/****** AIS_Animation::StartPts ******/
		/****** md5 signature: eca687fdf70cafee09f1710fa2f81f35 ******/
		%feature("compactdefaultargs") StartPts;
		%feature("autodoc", "Return
-------
double

Description
-----------
Return: start time of the animation in the timeline.
") StartPts;
		double StartPts();

		/****** AIS_Animation::StartTimer ******/
		/****** md5 signature: 48ec8ab8b62343926b8045957a2e78d5 ******/
		%feature("compactdefaultargs") StartTimer;
		%feature("autodoc", "
Parameters
----------
theStartPts: double
thePlaySpeed: double
theToUpdate: bool
theToStopTimer: bool (optional, default to false)

Return
-------
None

Description
-----------
Start animation with internally defined timer instance. Calls ::Start() internally. //! Note, that this method initializes a timer calculating an elapsed time (presentation timestamps within AIS_Animation::UpdateTimer()), not a multimedia timer executing Viewer updates at specific intervals! Viewer redrawing should be managed at application level, so that AIS_Animation::UpdateTimer() is called once right before each redrawing of a Viewer content. //! 
Parameter theStartPts starting timer position (presentation timestamp) 
Parameter thePlaySpeed playback speed (1.0 means normal speed) 
Parameter theToUpdate flag to update defined animations to specified start position 
Parameter theToStopTimer flag to pause timer at the starting position.
") StartTimer;
		virtual void StartTimer(const double theStartPts, const double thePlaySpeed, const bool theToUpdate, const bool theToStopTimer = false);

		/****** AIS_Animation::Stop ******/
		/****** md5 signature: e7291f237a00cfa5edd0b11c2d39a866 ******/
		%feature("compactdefaultargs") Stop;
		%feature("autodoc", "Return
-------
None

Description
-----------
Stop animation. This method changed status of the animation to Stopped. This status shows that animation will not be performed in the timeline or it is finished.
") Stop;
		virtual void Stop();

		/****** AIS_Animation::Timer ******/
		/****** md5 signature: 5e95b895bb505401280421403e4d0404 ******/
		%feature("compactdefaultargs") Timer;
		%feature("autodoc", "Return
-------
opencascade::handle<Media_Timer>

Description
-----------
Return playback timer.
") Timer;
		const opencascade::handle<Media_Timer> & Timer();

		/****** AIS_Animation::Update ******/
		/****** md5 signature: fa06e8ed39bdaab78ebc7c7288c19cc6 ******/
		%feature("compactdefaultargs") Update;
		%feature("autodoc", "
Parameters
----------
thePts: double

Return
-------
bool

Description
-----------
Update single frame of animation, update timer state 
Input parameter: thePts the time moment within [0; Duration()] 
Return: True if timeline is in progress.
") Update;
		virtual bool Update(const double thePts);

		/****** AIS_Animation::UpdateTimer ******/
		/****** md5 signature: f207bdf693a06ee992aada0416ba400b ******/
		%feature("compactdefaultargs") UpdateTimer;
		%feature("autodoc", "Return
-------
double

Description
-----------
Update single frame of animation, update timer state 
Return: current time of timeline progress.
") UpdateTimer;
		virtual double UpdateTimer();

		/****** AIS_Animation::UpdateTotalDuration ******/
		/****** md5 signature: 93617e806beabddc226ac7dfb7d23e8a ******/
		%feature("compactdefaultargs") UpdateTotalDuration;
		%feature("autodoc", "Return
-------
None

Description
-----------
Update total duration considering all animations on timeline.
") UpdateTotalDuration;
		void UpdateTotalDuration();

};


%make_alias(AIS_Animation)

%extend AIS_Animation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************
* class AIS_AnimationProgress *
******************************/
class AIS_AnimationProgress {
	public:
		/****** AIS_AnimationProgress::AIS_AnimationProgress ******/
		/****** md5 signature: 9e9e671b9cf6b1f96915c177eaaa8cf0 ******/
		%feature("compactdefaultargs") AIS_AnimationProgress;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") AIS_AnimationProgress;
		 AIS_AnimationProgress();

};


%extend AIS_AnimationProgress {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************
* class AIS_AttributeFilter *
****************************/
class AIS_AttributeFilter : public SelectMgr_Filter {
	public:
		/****** AIS_AttributeFilter::AIS_AttributeFilter ******/
		/****** md5 signature: efd1db0583fe2307eee29a09c901762e ******/
		%feature("compactdefaultargs") AIS_AttributeFilter;
		%feature("autodoc", "Return
-------
None

Description
-----------
Constructs an empty attribute filter object. This filter object determines whether selectable interactive objects have a non-null owner.
") AIS_AttributeFilter;
		 AIS_AttributeFilter();

		/****** AIS_AttributeFilter::AIS_AttributeFilter ******/
		/****** md5 signature: c9cdc1fdd6f2484c93f120e29d61460e ******/
		%feature("compactdefaultargs") AIS_AttributeFilter;
		%feature("autodoc", "
Parameters
----------
aCol: Quantity_NameOfColor

Return
-------
None

Description
-----------
Constructs an attribute filter object defined by the color attribute aCol.
") AIS_AttributeFilter;
		 AIS_AttributeFilter(const Quantity_NameOfColor aCol);

		/****** AIS_AttributeFilter::AIS_AttributeFilter ******/
		/****** md5 signature: 98ed55ff23cea6ddfb4e50bdc98e7bad ******/
		%feature("compactdefaultargs") AIS_AttributeFilter;
		%feature("autodoc", "
Parameters
----------
aWidth: double

Return
-------
None

Description
-----------
Constructs an attribute filter object defined by the line width attribute aWidth.
") AIS_AttributeFilter;
		 AIS_AttributeFilter(const double aWidth);

		/****** AIS_AttributeFilter::HasColor ******/
		/****** md5 signature: 9d4e6cc50a499be7adbd7b5390ea23e4 ******/
		%feature("compactdefaultargs") HasColor;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Indicates that the Interactive Object has the color setting specified by the argument aCol at construction time.
") HasColor;
		bool HasColor();

		/****** AIS_AttributeFilter::HasWidth ******/
		/****** md5 signature: 4a398cea04ef93366218cbb8b231f7d1 ******/
		%feature("compactdefaultargs") HasWidth;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Indicates that the Interactive Object has the width setting specified by the argument aWidth at construction time.
") HasWidth;
		bool HasWidth();

		/****** AIS_AttributeFilter::IsOk ******/
		/****** md5 signature: eeea6f6b4b7492f5eeac7be277a67559 ******/
		%feature("compactdefaultargs") IsOk;
		%feature("autodoc", "
Parameters
----------
anObj: SelectMgr_EntityOwner

Return
-------
bool

Description
-----------
Indicates that the selected Interactive Object passes the filter. The owner, anObj, can be either direct or user. A direct owner is the corresponding construction element, whereas a user is the compound shape of which the entity forms a part. If the Interactive Object returns true when detected by the Local Context selector through the mouse, the object is kept; if not, it is rejected.
") IsOk;
		bool IsOk(const opencascade::handle<SelectMgr_EntityOwner> & anObj);

		/****** AIS_AttributeFilter::SetColor ******/
		/****** md5 signature: 9860b6e19b23fad901e24b0cb7a0be30 ******/
		%feature("compactdefaultargs") SetColor;
		%feature("autodoc", "
Parameters
----------
theCol: Quantity_NameOfColor

Return
-------
None

Description
-----------
Sets the color.
") SetColor;
		void SetColor(const Quantity_NameOfColor theCol);

		/****** AIS_AttributeFilter::SetWidth ******/
		/****** md5 signature: dca96455ca545124c2c49422e4d8c257 ******/
		%feature("compactdefaultargs") SetWidth;
		%feature("autodoc", "
Parameters
----------
theWidth: double

Return
-------
None

Description
-----------
Sets the line width.
") SetWidth;
		void SetWidth(const double theWidth);

		/****** AIS_AttributeFilter::UnsetColor ******/
		/****** md5 signature: 6e328a6dea703ee08923d991dc618e9a ******/
		%feature("compactdefaultargs") UnsetColor;
		%feature("autodoc", "Return
-------
None

Description
-----------
Removes the setting for color from the filter.
") UnsetColor;
		void UnsetColor();

		/****** AIS_AttributeFilter::UnsetWidth ******/
		/****** md5 signature: 4be8fdb1e151f0a55dae0f7e3762ce2f ******/
		%feature("compactdefaultargs") UnsetWidth;
		%feature("autodoc", "Return
-------
None

Description
-----------
Removes the setting for width from the filter.
") UnsetWidth;
		void UnsetWidth();

};


%make_alias(AIS_AttributeFilter)

%extend AIS_AttributeFilter {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************
* class AIS_BadEdgeFilter *
**************************/
class AIS_BadEdgeFilter : public SelectMgr_Filter {
	public:
		/****** AIS_BadEdgeFilter::AIS_BadEdgeFilter ******/
		/****** md5 signature: c4f845eb6fba1f43aff9d06bfb985213 ******/
		%feature("compactdefaultargs") AIS_BadEdgeFilter;
		%feature("autodoc", "Return
-------
None

Description
-----------
Constructs an empty filter object for bad edges.
") AIS_BadEdgeFilter;
		 AIS_BadEdgeFilter();

		/****** AIS_BadEdgeFilter::ActsOn ******/
		/****** md5 signature: 96a4ee4f072ee40f692009ab171fa4ac ******/
		%feature("compactdefaultargs") ActsOn;
		%feature("autodoc", "
Parameters
----------
aType: TopAbs_ShapeEnum

Return
-------
bool

Description
-----------
No available documentation.
") ActsOn;
		bool ActsOn(const TopAbs_ShapeEnum aType);

		/****** AIS_BadEdgeFilter::AddEdge ******/
		/****** md5 signature: cc7bb17fc162722fc50d5c17e01f7154 ******/
		%feature("compactdefaultargs") AddEdge;
		%feature("autodoc", "
Parameters
----------
anEdge: TopoDS_Edge
Index: int

Return
-------
None

Description
-----------
Adds an edge to the list of non-selectable edges.
") AddEdge;
		void AddEdge(const TopoDS_Edge & anEdge, const int Index);

		/****** AIS_BadEdgeFilter::IsOk ******/
		/****** md5 signature: 98a9c35bd19bafdc77b478936779a636 ******/
		%feature("compactdefaultargs") IsOk;
		%feature("autodoc", "
Parameters
----------
EO: SelectMgr_EntityOwner

Return
-------
bool

Description
-----------
No available documentation.
") IsOk;
		bool IsOk(const opencascade::handle<SelectMgr_EntityOwner> & EO);

		/****** AIS_BadEdgeFilter::RemoveEdges ******/
		/****** md5 signature: f47fc3fd88968527539c7325297ad64b ******/
		%feature("compactdefaultargs") RemoveEdges;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
None

Description
-----------
removes from the list of non-selectable edges all edges in the contour <Index>.
") RemoveEdges;
		void RemoveEdges(const int Index);

		/****** AIS_BadEdgeFilter::SetContour ******/
		/****** md5 signature: 94c638e9e0e2dbb89f8966800b99a527 ******/
		%feature("compactdefaultargs") SetContour;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
None

Description
-----------
sets <myContour> with current contour. used by IsOk.
") SetContour;
		void SetContour(const int Index);

};


%make_alias(AIS_BadEdgeFilter)

%extend AIS_BadEdgeFilter {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************
* class AIS_C0RegularityFilter *
*******************************/
class AIS_C0RegularityFilter : public SelectMgr_Filter {
	public:
		/****** AIS_C0RegularityFilter::AIS_C0RegularityFilter ******/
		/****** md5 signature: 3cbcdfd2403fe0204a455ddc08350f99 ******/
		%feature("compactdefaultargs") AIS_C0RegularityFilter;
		%feature("autodoc", "
Parameters
----------
aShape: TopoDS_Shape

Return
-------
None

Description
-----------
No available documentation.
") AIS_C0RegularityFilter;
		 AIS_C0RegularityFilter(const TopoDS_Shape & aShape);

		/****** AIS_C0RegularityFilter::ActsOn ******/
		/****** md5 signature: 96a4ee4f072ee40f692009ab171fa4ac ******/
		%feature("compactdefaultargs") ActsOn;
		%feature("autodoc", "
Parameters
----------
aType: TopAbs_ShapeEnum

Return
-------
bool

Description
-----------
No available documentation.
") ActsOn;
		bool ActsOn(const TopAbs_ShapeEnum aType);

		/****** AIS_C0RegularityFilter::IsOk ******/
		/****** md5 signature: 98a9c35bd19bafdc77b478936779a636 ******/
		%feature("compactdefaultargs") IsOk;
		%feature("autodoc", "
Parameters
----------
EO: SelectMgr_EntityOwner

Return
-------
bool

Description
-----------
No available documentation.
") IsOk;
		bool IsOk(const opencascade::handle<SelectMgr_EntityOwner> & EO);

};


%make_alias(AIS_C0RegularityFilter)

%extend AIS_C0RegularityFilter {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************
* class AIS_ColoredDrawer *
**************************/
class AIS_ColoredDrawer : public Prs3d_Drawer {
	public:
		/****** AIS_ColoredDrawer::AIS_ColoredDrawer ******/
		/****** md5 signature: fb206bfbdf2e0955a791e7882ddd0a6d ******/
		%feature("compactdefaultargs") AIS_ColoredDrawer;
		%feature("autodoc", "
Parameters
----------
theLink: Prs3d_Drawer

Return
-------
None

Description
-----------
Default constructor.
") AIS_ColoredDrawer;
		 AIS_ColoredDrawer(const opencascade::handle<Prs3d_Drawer> & theLink);

		/****** AIS_ColoredDrawer::HasOwnColor ******/
		/****** md5 signature: c1d7c3268c360a84f320795d404c0b59 ******/
		%feature("compactdefaultargs") HasOwnColor;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") HasOwnColor;
		bool HasOwnColor();

		/****** AIS_ColoredDrawer::HasOwnMaterial ******/
		/****** md5 signature: d79080c087fc3592869db0ed508eafbc ******/
		%feature("compactdefaultargs") HasOwnMaterial;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") HasOwnMaterial;
		bool HasOwnMaterial();

		/****** AIS_ColoredDrawer::HasOwnTransparency ******/
		/****** md5 signature: bfa958c2a81028d8551656b0f415f2b7 ******/
		%feature("compactdefaultargs") HasOwnTransparency;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") HasOwnTransparency;
		bool HasOwnTransparency();

		/****** AIS_ColoredDrawer::HasOwnWidth ******/
		/****** md5 signature: 9f80b7b4536e979a5ec2d9011e0b5ad9 ******/
		%feature("compactdefaultargs") HasOwnWidth;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") HasOwnWidth;
		bool HasOwnWidth();

		/****** AIS_ColoredDrawer::IsHidden ******/
		/****** md5 signature: 488685d602cd739d12ad12a5304d7b3e ******/
		%feature("compactdefaultargs") IsHidden;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsHidden;
		bool IsHidden();

		/****** AIS_ColoredDrawer::SetHidden ******/
		/****** md5 signature: b8fd4d1df359caf57cb2042980fb02f6 ******/
		%feature("compactdefaultargs") SetHidden;
		%feature("autodoc", "
Parameters
----------
theToHide: bool

Return
-------
None

Description
-----------
No available documentation.
") SetHidden;
		void SetHidden(const bool theToHide);

		/****** AIS_ColoredDrawer::SetOwnColor ******/
		/****** md5 signature: 907a5bceace779e32277c3a1c2939792 ******/
		%feature("compactdefaultargs") SetOwnColor;
		%feature("autodoc", "
Parameters
----------
&: Quantity_Color

Return
-------
None

Description
-----------
No available documentation.
") SetOwnColor;
		void SetOwnColor(const Quantity_Color &);

		/****** AIS_ColoredDrawer::SetOwnMaterial ******/
		/****** md5 signature: a9d55f286f01e4a30605f50143bdaada ******/
		%feature("compactdefaultargs") SetOwnMaterial;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") SetOwnMaterial;
		void SetOwnMaterial();

		/****** AIS_ColoredDrawer::SetOwnTransparency ******/
		/****** md5 signature: 5ab9b4052a7a668ded31be5294c3696d ******/
		%feature("compactdefaultargs") SetOwnTransparency;
		%feature("autodoc", "
Parameters
----------
: double

Return
-------
None

Description
-----------
No available documentation.
") SetOwnTransparency;
		void SetOwnTransparency(double );

		/****** AIS_ColoredDrawer::SetOwnWidth ******/
		/****** md5 signature: 38d220dbec4b2b4be1a19e5385be4c0d ******/
		%feature("compactdefaultargs") SetOwnWidth;
		%feature("autodoc", "
Parameters
----------
: double

Return
-------
None

Description
-----------
No available documentation.
") SetOwnWidth;
		void SetOwnWidth(const double );

		/****** AIS_ColoredDrawer::UnsetOwnColor ******/
		/****** md5 signature: 99078fba8198e7c264e3446bab64edc2 ******/
		%feature("compactdefaultargs") UnsetOwnColor;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") UnsetOwnColor;
		void UnsetOwnColor();

		/****** AIS_ColoredDrawer::UnsetOwnMaterial ******/
		/****** md5 signature: 51558ef8e8f82da5e88a74b4204850af ******/
		%feature("compactdefaultargs") UnsetOwnMaterial;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") UnsetOwnMaterial;
		void UnsetOwnMaterial();

		/****** AIS_ColoredDrawer::UnsetOwnTransparency ******/
		/****** md5 signature: 5d88cb3910be04c91a3ef80818d3b464 ******/
		%feature("compactdefaultargs") UnsetOwnTransparency;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") UnsetOwnTransparency;
		void UnsetOwnTransparency();

		/****** AIS_ColoredDrawer::UnsetOwnWidth ******/
		/****** md5 signature: 9ab1ef7846eb1ab8ad2a68a36ac92341 ******/
		%feature("compactdefaultargs") UnsetOwnWidth;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") UnsetOwnWidth;
		void UnsetOwnWidth();

};


%make_alias(AIS_ColoredDrawer)

%extend AIS_ColoredDrawer {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************
* class AIS_ExclusionFilter *
****************************/
class AIS_ExclusionFilter : public SelectMgr_Filter {
	public:
		/****** AIS_ExclusionFilter::AIS_ExclusionFilter ******/
		/****** md5 signature: 88bc08b47d7f73beb1f393667190c487 ******/
		%feature("compactdefaultargs") AIS_ExclusionFilter;
		%feature("autodoc", "
Parameters
----------
ExclusionFlagOn: bool (optional, default to true)

Return
-------
None

Description
-----------
Constructs an empty exclusion filter object defined by the flag setting ExclusionFlagOn. By default, the flag is set to true.
") AIS_ExclusionFilter;
		 AIS_ExclusionFilter(const bool ExclusionFlagOn = true);

		/****** AIS_ExclusionFilter::AIS_ExclusionFilter ******/
		/****** md5 signature: b950a7a255d1a8e1537ca7cbe511bba5 ******/
		%feature("compactdefaultargs") AIS_ExclusionFilter;
		%feature("autodoc", "
Parameters
----------
TypeToExclude: AIS_KindOfInteractive
ExclusionFlagOn: bool (optional, default to true)

Return
-------
None

Description
-----------
All the AIS objects of <TypeToExclude> Will be rejected by the IsOk Method.
") AIS_ExclusionFilter;
		 AIS_ExclusionFilter(const AIS_KindOfInteractive TypeToExclude, const bool ExclusionFlagOn = true);

		/****** AIS_ExclusionFilter::AIS_ExclusionFilter ******/
		/****** md5 signature: d7fa278689dfdceea3bb26017999dc27 ******/
		%feature("compactdefaultargs") AIS_ExclusionFilter;
		%feature("autodoc", "
Parameters
----------
TypeToExclude: AIS_KindOfInteractive
SignatureInType: int
ExclusionFlagOn: bool (optional, default to true)

Return
-------
None

Description
-----------
Constructs an exclusion filter object defined by the enumeration value TypeToExclude, the signature SignatureInType, and the flag setting ExclusionFlagOn. By default, the flag is set to true.
") AIS_ExclusionFilter;
		 AIS_ExclusionFilter(const AIS_KindOfInteractive TypeToExclude, const int SignatureInType, const bool ExclusionFlagOn = true);

		/****** AIS_ExclusionFilter::Add ******/
		/****** md5 signature: 539e48fdac24c5317e43feae65627498 ******/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
TypeToExclude: AIS_KindOfInteractive

Return
-------
bool

Description
-----------
Adds the type TypeToExclude to the list of types.
") Add;
		bool Add(const AIS_KindOfInteractive TypeToExclude);

		/****** AIS_ExclusionFilter::Add ******/
		/****** md5 signature: 2fbf64fa1255a9757a801575a8a95d7e ******/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
TypeToExclude: AIS_KindOfInteractive
SignatureInType: int

Return
-------
bool

Description
-----------
No available documentation.
") Add;
		bool Add(const AIS_KindOfInteractive TypeToExclude, const int SignatureInType);

		/****** AIS_ExclusionFilter::Clear ******/
		/****** md5 signature: ae54be580b423a6eadbe062e0bdb44c2 ******/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Clear;
		void Clear();

		/****** AIS_ExclusionFilter::IsExclusionFlagOn ******/
		/****** md5 signature: 74d3c003cf8f05c1517dbd81a627bcf9 ******/
		%feature("compactdefaultargs") IsExclusionFlagOn;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsExclusionFlagOn;
		bool IsExclusionFlagOn();

		/****** AIS_ExclusionFilter::IsOk ******/
		/****** md5 signature: eeea6f6b4b7492f5eeac7be277a67559 ******/
		%feature("compactdefaultargs") IsOk;
		%feature("autodoc", "
Parameters
----------
anObj: SelectMgr_EntityOwner

Return
-------
bool

Description
-----------
No available documentation.
") IsOk;
		bool IsOk(const opencascade::handle<SelectMgr_EntityOwner> & anObj);

		/****** AIS_ExclusionFilter::IsStored ******/
		/****** md5 signature: 7f292f505666561dd7893fca0338e0ad ******/
		%feature("compactdefaultargs") IsStored;
		%feature("autodoc", "
Parameters
----------
aType: AIS_KindOfInteractive

Return
-------
bool

Description
-----------
No available documentation.
") IsStored;
		bool IsStored(const AIS_KindOfInteractive aType);

		/****** AIS_ExclusionFilter::ListOfSignature ******/
		/****** md5 signature: 146ad3dde424189b8d736fbf126dcc28 ******/
		%feature("compactdefaultargs") ListOfSignature;
		%feature("autodoc", "
Parameters
----------
aType: AIS_KindOfInteractive
TheStoredList: TColStd_ListOfInteger

Return
-------
None

Description
-----------
No available documentation.
") ListOfSignature;
		void ListOfSignature(const AIS_KindOfInteractive aType, TColStd_ListOfInteger & TheStoredList);

		/****** AIS_ExclusionFilter::ListOfStoredTypes ******/
		/****** md5 signature: 8680b84b79bccd01ae95de60f153c56d ******/
		%feature("compactdefaultargs") ListOfStoredTypes;
		%feature("autodoc", "
Parameters
----------
TheList: TColStd_ListOfInteger

Return
-------
None

Description
-----------
No available documentation.
") ListOfStoredTypes;
		void ListOfStoredTypes(TColStd_ListOfInteger & TheList);

		/****** AIS_ExclusionFilter::Remove ******/
		/****** md5 signature: 1c5f2e265ca43dc2f194d9925acfb62e ******/
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "
Parameters
----------
TypeToExclude: AIS_KindOfInteractive

Return
-------
bool

Description
-----------
No available documentation.
") Remove;
		bool Remove(const AIS_KindOfInteractive TypeToExclude);

		/****** AIS_ExclusionFilter::Remove ******/
		/****** md5 signature: 2d3af17acb8ac6743192b5266f3496ec ******/
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "
Parameters
----------
TypeToExclude: AIS_KindOfInteractive
SignatureInType: int

Return
-------
bool

Description
-----------
No available documentation.
") Remove;
		bool Remove(const AIS_KindOfInteractive TypeToExclude, const int SignatureInType);

		/****** AIS_ExclusionFilter::SetExclusionFlag ******/
		/****** md5 signature: c25cee4278f0cedca231655cf21d32be ******/
		%feature("compactdefaultargs") SetExclusionFlag;
		%feature("autodoc", "
Parameters
----------
theStatus: bool

Return
-------
None

Description
-----------
No available documentation.
") SetExclusionFlag;
		void SetExclusionFlag(const bool theStatus);

};


%make_alias(AIS_ExclusionFilter)

%extend AIS_ExclusionFilter {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************
* class AIS_GlobalStatus *
*************************/
class AIS_GlobalStatus : public Standard_Transient {
	public:
		/****** AIS_GlobalStatus::AIS_GlobalStatus ******/
		/****** md5 signature: 9c56844364db5c947daf28e63bef42e2 ******/
		%feature("compactdefaultargs") AIS_GlobalStatus;
		%feature("autodoc", "Return
-------
None

Description
-----------
Default constructor.
") AIS_GlobalStatus;
		 AIS_GlobalStatus();

		/****** AIS_GlobalStatus::AddSelectionMode ******/
		/****** md5 signature: a349b7711fefab87e69cce1a64c62a37 ******/
		%feature("compactdefaultargs") AddSelectionMode;
		%feature("autodoc", "
Parameters
----------
theMode: int

Return
-------
bool

Description
-----------
Add selection mode.
") AddSelectionMode;
		bool AddSelectionMode(const int theMode);

		/****** AIS_GlobalStatus::ClearSelectionModes ******/
		/****** md5 signature: 239a6fa95794aa4d619474ae09fc6c8d ******/
		%feature("compactdefaultargs") ClearSelectionModes;
		%feature("autodoc", "Return
-------
None

Description
-----------
Remove all selection modes.
") ClearSelectionModes;
		void ClearSelectionModes();

		/****** AIS_GlobalStatus::DisplayMode ******/
		/****** md5 signature: ac5a0607c42d4a5cb024f9e1f4d5fff9 ******/
		%feature("compactdefaultargs") DisplayMode;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the display mode.
") DisplayMode;
		int DisplayMode();

		/****** AIS_GlobalStatus::HilightStyle ******/
		/****** md5 signature: d17b0472c23cb74e2e63d1233b6a1355 ******/
		%feature("compactdefaultargs") HilightStyle;
		%feature("autodoc", "Return
-------
opencascade::handle<Prs3d_Drawer>

Description
-----------
Returns applied highlight style for a particular object.
") HilightStyle;
		const opencascade::handle<Prs3d_Drawer> & HilightStyle();

		/****** AIS_GlobalStatus::IsHilighted ******/
		/****** md5 signature: 3eab070dccfafcb319c7086f83cc668f ******/
		%feature("compactdefaultargs") IsHilighted;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if object is highlighted.
") IsHilighted;
		bool IsHilighted();

		/****** AIS_GlobalStatus::IsSModeIn ******/
		/****** md5 signature: be0a702803badd83073c5d370cfae91b ******/
		%feature("compactdefaultargs") IsSModeIn;
		%feature("autodoc", "
Parameters
----------
theMode: int

Return
-------
bool

Description
-----------
Return True if selection mode was registered.
") IsSModeIn;
		bool IsSModeIn(int theMode);

		/****** AIS_GlobalStatus::IsSubIntensityOn ******/
		/****** md5 signature: 5bf11fde8ca6b2140172dc1bfc2efd64 ******/
		%feature("compactdefaultargs") IsSubIntensityOn;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsSubIntensityOn;
		bool IsSubIntensityOn();

		/****** AIS_GlobalStatus::RemoveSelectionMode ******/
		/****** md5 signature: ed430e5d28a3bbb8f3002d24c18df4f2 ******/
		%feature("compactdefaultargs") RemoveSelectionMode;
		%feature("autodoc", "
Parameters
----------
theMode: int

Return
-------
bool

Description
-----------
Remove selection mode.
") RemoveSelectionMode;
		bool RemoveSelectionMode(const int theMode);

		/****** AIS_GlobalStatus::SelectionModes ******/
		/****** md5 signature: 2132a8895ae0782915c7441237f1bf3c ******/
		%feature("compactdefaultargs") SelectionModes;
		%feature("autodoc", "Return
-------
TColStd_ListOfInteger

Description
-----------
Returns active selection modes of the object.
") SelectionModes;
		const TColStd_ListOfInteger & SelectionModes();

		/****** AIS_GlobalStatus::SetDisplayMode ******/
		/****** md5 signature: e8e6901d77a66a90acf6b94e4ae659ff ******/
		%feature("compactdefaultargs") SetDisplayMode;
		%feature("autodoc", "
Parameters
----------
theMode: int

Return
-------
None

Description
-----------
Sets display mode.
") SetDisplayMode;
		void SetDisplayMode(const int theMode);

		/****** AIS_GlobalStatus::SetHilightStatus ******/
		/****** md5 signature: cdfb580a66e11f76ec1cfef7c1497e0c ******/
		%feature("compactdefaultargs") SetHilightStatus;
		%feature("autodoc", "
Parameters
----------
theStatus: bool

Return
-------
None

Description
-----------
Sets highlighted state.
") SetHilightStatus;
		void SetHilightStatus(const bool theStatus);

		/****** AIS_GlobalStatus::SetHilightStyle ******/
		/****** md5 signature: f245d0c0a2ce5f6a233e75a326f80a8c ******/
		%feature("compactdefaultargs") SetHilightStyle;
		%feature("autodoc", "
Parameters
----------
theStyle: Prs3d_Drawer

Return
-------
None

Description
-----------
Changes applied highlight style for a particular object.
") SetHilightStyle;
		void SetHilightStyle(const opencascade::handle<Prs3d_Drawer> & theStyle);

		/****** AIS_GlobalStatus::SetSubIntensity ******/
		/****** md5 signature: e499431540f2c070c01c44a819093748 ******/
		%feature("compactdefaultargs") SetSubIntensity;
		%feature("autodoc", "
Parameters
----------
theIsOn: bool

Return
-------
None

Description
-----------
No available documentation.
") SetSubIntensity;
		void SetSubIntensity(bool theIsOn);

};


%make_alias(AIS_GlobalStatus)

%extend AIS_GlobalStatus {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************
* class AIS_GraphicTool *
************************/
class AIS_GraphicTool {
	public:
		/****** AIS_GraphicTool::GetInteriorColor ******/
		/****** md5 signature: a09776a9369f9af7c09c13e0f002bccf ******/
		%feature("compactdefaultargs") GetInteriorColor;
		%feature("autodoc", "
Parameters
----------
aDrawer: Prs3d_Drawer

Return
-------
Quantity_NameOfColor

Description
-----------
No available documentation.
") GetInteriorColor;
		static Quantity_NameOfColor GetInteriorColor(const opencascade::handle<Prs3d_Drawer> & aDrawer);

		/****** AIS_GraphicTool::GetInteriorColor ******/
		/****** md5 signature: ca6ae445556055bebc087f7202929ccf ******/
		%feature("compactdefaultargs") GetInteriorColor;
		%feature("autodoc", "
Parameters
----------
aDrawer: Prs3d_Drawer
aColor: Quantity_Color

Return
-------
None

Description
-----------
No available documentation.
") GetInteriorColor;
		static void GetInteriorColor(const opencascade::handle<Prs3d_Drawer> & aDrawer, Quantity_Color & aColor);

		/****** AIS_GraphicTool::GetLineAtt ******/
		/****** md5 signature: c5b8bb66d3078356640df87d990524bd ******/
		%feature("compactdefaultargs") GetLineAtt;
		%feature("autodoc", "
Parameters
----------
aDrawer: Prs3d_Drawer
TheTypeOfAttributes: AIS_TypeOfAttribute

Return
-------
aCol: Quantity_NameOfColor
aWidth: double
aTyp: Aspect_TypeOfLine

Description
-----------
No available documentation.
") GetLineAtt;
		static void GetLineAtt(const opencascade::handle<Prs3d_Drawer> & aDrawer, const AIS_TypeOfAttribute TheTypeOfAttributes, Quantity_NameOfColor &OutValue, Standard_Real &OutValue, Aspect_TypeOfLine &OutValue);

		/****** AIS_GraphicTool::GetLineColor ******/
		/****** md5 signature: eba7d0fb34c3645d05f21c7b3545cd3c ******/
		%feature("compactdefaultargs") GetLineColor;
		%feature("autodoc", "
Parameters
----------
aDrawer: Prs3d_Drawer
TheTypeOfAttributes: AIS_TypeOfAttribute

Return
-------
Quantity_NameOfColor

Description
-----------
No available documentation.
") GetLineColor;
		static Quantity_NameOfColor GetLineColor(const opencascade::handle<Prs3d_Drawer> & aDrawer, const AIS_TypeOfAttribute TheTypeOfAttributes);

		/****** AIS_GraphicTool::GetLineColor ******/
		/****** md5 signature: ba905e7c41f5ad7f557bf6fdd367c9fc ******/
		%feature("compactdefaultargs") GetLineColor;
		%feature("autodoc", "
Parameters
----------
aDrawer: Prs3d_Drawer
TheTypeOfAttributes: AIS_TypeOfAttribute
TheLineColor: Quantity_Color

Return
-------
None

Description
-----------
No available documentation.
") GetLineColor;
		static void GetLineColor(const opencascade::handle<Prs3d_Drawer> & aDrawer, const AIS_TypeOfAttribute TheTypeOfAttributes, Quantity_Color & TheLineColor);

		/****** AIS_GraphicTool::GetLineType ******/
		/****** md5 signature: 096ac584eafeaee003d7c6fee0409ae9 ******/
		%feature("compactdefaultargs") GetLineType;
		%feature("autodoc", "
Parameters
----------
aDrawer: Prs3d_Drawer
TheTypeOfAttributes: AIS_TypeOfAttribute

Return
-------
Aspect_TypeOfLine

Description
-----------
No available documentation.
") GetLineType;
		static Aspect_TypeOfLine GetLineType(const opencascade::handle<Prs3d_Drawer> & aDrawer, const AIS_TypeOfAttribute TheTypeOfAttributes);

		/****** AIS_GraphicTool::GetLineWidth ******/
		/****** md5 signature: ca3eccb0ba3cf583d541d043ef044173 ******/
		%feature("compactdefaultargs") GetLineWidth;
		%feature("autodoc", "
Parameters
----------
aDrawer: Prs3d_Drawer
TheTypeOfAttributes: AIS_TypeOfAttribute

Return
-------
double

Description
-----------
No available documentation.
") GetLineWidth;
		static double GetLineWidth(const opencascade::handle<Prs3d_Drawer> & aDrawer, const AIS_TypeOfAttribute TheTypeOfAttributes);

		/****** AIS_GraphicTool::GetMaterial ******/
		/****** md5 signature: 4049b89d3369ddd54ce882f6e39b1700 ******/
		%feature("compactdefaultargs") GetMaterial;
		%feature("autodoc", "
Parameters
----------
aDrawer: Prs3d_Drawer

Return
-------
Graphic3d_MaterialAspect

Description
-----------
No available documentation.
") GetMaterial;
		static Graphic3d_MaterialAspect GetMaterial(const opencascade::handle<Prs3d_Drawer> & aDrawer);

};


%extend AIS_GraphicTool {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************
* class AIS_InteractiveContext *
*******************************/
class AIS_InteractiveContext : public Standard_Transient {
	public:
		/****** AIS_InteractiveContext::AIS_InteractiveContext ******/
		/****** md5 signature: e050aa4400b6a1b1bad39801422c3f15 ******/
		%feature("compactdefaultargs") AIS_InteractiveContext;
		%feature("autodoc", "
Parameters
----------
MainViewer: V3d_Viewer

Return
-------
None

Description
-----------
Constructs the interactive context object defined by the principal viewer MainViewer.
") AIS_InteractiveContext;
		 AIS_InteractiveContext(const opencascade::handle<V3d_Viewer> & MainViewer);

		/****** AIS_InteractiveContext::Activate ******/
		/****** md5 signature: c5df36af68c7cecf470f6af2cafd8910 ******/
		%feature("compactdefaultargs") Activate;
		%feature("autodoc", "
Parameters
----------
theObj: AIS_InteractiveObject
theMode: int (optional, default to 0)
theIsForce: bool (optional, default to false)

Return
-------
None

Description
-----------
Activates the selection mode aMode whose index is given, for the given interactive entity anIobj.
") Activate;
		void Activate(const opencascade::handle<AIS_InteractiveObject> & theObj, const int theMode = 0, const bool theIsForce = false);

		/****** AIS_InteractiveContext::Activate ******/
		/****** md5 signature: b53ee679d1af6bb797f3e66e04d715eb ******/
		%feature("compactdefaultargs") Activate;
		%feature("autodoc", "
Parameters
----------
theMode: int
theIsForce: bool (optional, default to false)

Return
-------
None

Description
-----------
Activates the given selection mode for the all displayed objects.
") Activate;
		void Activate(const int theMode, const bool theIsForce = false);

		/****** AIS_InteractiveContext::ActivatedModes ******/
		/****** md5 signature: e3218e687da357ebb650065008dce608 ******/
		%feature("compactdefaultargs") ActivatedModes;
		%feature("autodoc", "
Parameters
----------
anIobj: AIS_InteractiveObject
theList: TColStd_ListOfInteger

Return
-------
None

Description
-----------
Returns the list of activated selection modes.
") ActivatedModes;
		void ActivatedModes(const opencascade::handle<AIS_InteractiveObject> & anIobj, TColStd_ListOfInteger & theList);

		/****** AIS_InteractiveContext::AddFilter ******/
		/****** md5 signature: 8a902c12e6fe5b2f586f4e19c0758623 ******/
		%feature("compactdefaultargs") AddFilter;
		%feature("autodoc", "
Parameters
----------
theFilter: SelectMgr_Filter

Return
-------
None

Description
-----------
Allows you to add the filter.
") AddFilter;
		void AddFilter(const opencascade::handle<SelectMgr_Filter> & theFilter);

		/****** AIS_InteractiveContext::AddOrRemoveCurrentObject ******/
		/****** md5 signature: 323c0a5eb387e00067e523e9682b9198 ******/
		%feature("compactdefaultargs") AddOrRemoveCurrentObject;
		%feature("autodoc", "
Parameters
----------
theObj: AIS_InteractiveObject
theIsToUpdateViewer: bool

Return
-------
None

Description
-----------
No available documentation.
") AddOrRemoveCurrentObject;
		void AddOrRemoveCurrentObject(const opencascade::handle<AIS_InteractiveObject> & theObj, const bool theIsToUpdateViewer);

		/****** AIS_InteractiveContext::AddOrRemoveSelected ******/
		/****** md5 signature: f55c75e4e2d68c123981598802dccaa5 ******/
		%feature("compactdefaultargs") AddOrRemoveSelected;
		%feature("autodoc", "
Parameters
----------
theObject: AIS_InteractiveObject
theToUpdateViewer: bool

Return
-------
None

Description
-----------
Allows to highlight or unhighlight the owner given depending on its selection status.
") AddOrRemoveSelected;
		void AddOrRemoveSelected(const opencascade::handle<AIS_InteractiveObject> & theObject, const bool theToUpdateViewer);

		/****** AIS_InteractiveContext::AddOrRemoveSelected ******/
		/****** md5 signature: 7df9d99be46b4151be8526547a0052e9 ******/
		%feature("compactdefaultargs") AddOrRemoveSelected;
		%feature("autodoc", "
Parameters
----------
theOwner: SelectMgr_EntityOwner
theToUpdateViewer: bool

Return
-------
None

Description
-----------
Allows to highlight or unhighlight the owner given depending on its selection status.
") AddOrRemoveSelected;
		void AddOrRemoveSelected(const opencascade::handle<SelectMgr_EntityOwner> & theOwner, const bool theToUpdateViewer);

		/****** AIS_InteractiveContext::AddSelect ******/
		/****** md5 signature: 52ea6338337a736ab508e9fc2a8879f6 ******/
		%feature("compactdefaultargs") AddSelect;
		%feature("autodoc", "
Parameters
----------
theObject: SelectMgr_EntityOwner

Return
-------
AIS_StatusOfPick

Description
-----------
Adds object in the selection.
") AddSelect;
		AIS_StatusOfPick AddSelect(const opencascade::handle<SelectMgr_EntityOwner> & theObject);

		/****** AIS_InteractiveContext::AddSelect ******/
		/****** md5 signature: 37dc4fd1f46d4797ff3f04cf30ba255c ******/
		%feature("compactdefaultargs") AddSelect;
		%feature("autodoc", "
Parameters
----------
theObject: AIS_InteractiveObject

Return
-------
AIS_StatusOfPick

Description
-----------
Adds object in the selection.
") AddSelect;
		AIS_StatusOfPick AddSelect(const opencascade::handle<AIS_InteractiveObject> & theObject);

		/****** AIS_InteractiveContext::Applicative ******/
		/****** md5 signature: d43af2e985c3a710a87f1b988ff487fb ******/
		%feature("compactdefaultargs") Applicative;
		%feature("autodoc", "Return
-------
opencascade::handle<Standard_Transient>

Description
-----------
Returns SelectedInteractive()->GetOwner(). 
See also: SelectedOwner().
") Applicative;
		opencascade::handle<Standard_Transient> Applicative();

		/****** AIS_InteractiveContext::AutomaticHilight ******/
		/****** md5 signature: d4d4c199c2918fc63a185325798339d4 ******/
		%feature("compactdefaultargs") AutomaticHilight;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if the automatic highlight mode is active; True by default. 
See also: MoveTo(), Select(), HilightWithColor(), Unhilight().
") AutomaticHilight;
		bool AutomaticHilight();

		/****** AIS_InteractiveContext::BeginImmediateDraw ******/
		/****** md5 signature: ac1c6318628ab4f3c30d9270371f0a8f ******/
		%feature("compactdefaultargs") BeginImmediateDraw;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") BeginImmediateDraw;
		bool BeginImmediateDraw();

		/****** AIS_InteractiveContext::BoundingBoxOfSelection ******/
		/****** md5 signature: ce3c459b72706889de79199277654aa5 ******/
		%feature("compactdefaultargs") BoundingBoxOfSelection;
		%feature("autodoc", "
Parameters
----------
theView: V3d_View

Return
-------
Bnd_Box

Description
-----------
Returns bounding box of selected objects.
") BoundingBoxOfSelection;
		Bnd_Box BoundingBoxOfSelection(const opencascade::handle<V3d_View> & theView);

		/****** AIS_InteractiveContext::BoundingBoxOfSelection ******/
		/****** md5 signature: e06af7ec716edc2c5f5cf7203564685a ******/
		%feature("compactdefaultargs") BoundingBoxOfSelection;
		%feature("autodoc", "Return
-------
Bnd_Box

Description
-----------
No available documentation.
") BoundingBoxOfSelection;
		Bnd_Box BoundingBoxOfSelection();

		/****** AIS_InteractiveContext::ClearActiveSensitive ******/
		/****** md5 signature: 81b910a4cd745e76d9d2719b0e8bc729 ******/
		%feature("compactdefaultargs") ClearActiveSensitive;
		%feature("autodoc", "
Parameters
----------
aView: V3d_View

Return
-------
None

Description
-----------
Clear visualization of sensitives.
") ClearActiveSensitive;
		void ClearActiveSensitive(const opencascade::handle<V3d_View> & aView);

		/****** AIS_InteractiveContext::ClearCurrents ******/
		/****** md5 signature: c42eccd6c8d7b64cc3bbd6522a272356 ******/
		%feature("compactdefaultargs") ClearCurrents;
		%feature("autodoc", "
Parameters
----------
theToUpdateViewer: bool

Return
-------
None

Description
-----------
No available documentation.
") ClearCurrents;
		void ClearCurrents(const bool theToUpdateViewer);

		/****** AIS_InteractiveContext::ClearDetected ******/
		/****** md5 signature: 145bbff0c82b252aa61d9d393b601f52 ******/
		%feature("compactdefaultargs") ClearDetected;
		%feature("autodoc", "
Parameters
----------
theToRedrawImmediate: bool (optional, default to false)

Return
-------
bool

Description
-----------
Clears the list of entities detected by MoveTo() and resets dynamic highlighting. 
Parameter theToRedrawImmediate if True, the main Viewer will be redrawn on update 
Return: True if viewer needs to be updated (e.g. there were actually dynamically highlighted entities).
") ClearDetected;
		bool ClearDetected(bool theToRedrawImmediate = false);

		/****** AIS_InteractiveContext::ClearPrs ******/
		/****** md5 signature: 045a89e91c8e4125ffd5a7c4b22d6ff5 ******/
		%feature("compactdefaultargs") ClearPrs;
		%feature("autodoc", "
Parameters
----------
theIObj: AIS_InteractiveObject
theMode: int
theToUpdateViewer: bool

Return
-------
None

Description
-----------
Empties the graphic presentation of the mode indexed by aMode. Warning! Removes theIObj. theIObj is still active if it was previously activated.
") ClearPrs;
		void ClearPrs(const opencascade::handle<AIS_InteractiveObject> & theIObj, const int theMode, const bool theToUpdateViewer);

		/****** AIS_InteractiveContext::ClearSelected ******/
		/****** md5 signature: f036b8e25158f4d50059ba8c0d57a69b ******/
		%feature("compactdefaultargs") ClearSelected;
		%feature("autodoc", "
Parameters
----------
theToUpdateViewer: bool

Return
-------
None

Description
-----------
Empties previous selected objects in order to get the selected objects detected by the selector using UpdateSelected.
") ClearSelected;
		void ClearSelected(const bool theToUpdateViewer);

		/****** AIS_InteractiveContext::Color ******/
		/****** md5 signature: 30319ccfc0804ed2727c24b795588dd1 ******/
		%feature("compactdefaultargs") Color;
		%feature("autodoc", "
Parameters
----------
aniobj: AIS_InteractiveObject
acolor: Quantity_Color

Return
-------
None

Description
-----------
Returns the color of the Object in the interactive context.
") Color;
		void Color(const opencascade::handle<AIS_InteractiveObject> & aniobj, Quantity_Color & acolor);

		/****** AIS_InteractiveContext::Current ******/
		/****** md5 signature: 306daa9a488493500027cb5d7534764b ******/
		%feature("compactdefaultargs") Current;
		%feature("autodoc", "Return
-------
opencascade::handle<AIS_InteractiveObject>

Description
-----------
No available documentation.
") Current;
		opencascade::handle<AIS_InteractiveObject> Current();

		/****** AIS_InteractiveContext::CurrentViewer ******/
		/****** md5 signature: c71b17a30c90b404a2fe56e1cbabac4b ******/
		%feature("compactdefaultargs") CurrentViewer;
		%feature("autodoc", "Return
-------
opencascade::handle<V3d_Viewer>

Description
-----------
Returns the current viewer.
") CurrentViewer;
		const opencascade::handle<V3d_Viewer> & CurrentViewer();

		/****** AIS_InteractiveContext::Deactivate ******/
		/****** md5 signature: 2836d4ea8ca04a1b3dbd8159991e33e0 ******/
		%feature("compactdefaultargs") Deactivate;
		%feature("autodoc", "
Parameters
----------
theObj: AIS_InteractiveObject

Return
-------
None

Description
-----------
Deactivates all the activated selection modes of an object.
") Deactivate;
		void Deactivate(const opencascade::handle<AIS_InteractiveObject> & theObj);

		/****** AIS_InteractiveContext::Deactivate ******/
		/****** md5 signature: 94bddbc0be51373dfde2d5be158d91f9 ******/
		%feature("compactdefaultargs") Deactivate;
		%feature("autodoc", "
Parameters
----------
theObj: AIS_InteractiveObject
theMode: int

Return
-------
None

Description
-----------
Deactivates all the activated selection modes of the interactive object anIobj with a given selection mode aMode.
") Deactivate;
		void Deactivate(const opencascade::handle<AIS_InteractiveObject> & theObj, const int theMode);

		/****** AIS_InteractiveContext::Deactivate ******/
		/****** md5 signature: 03a30a4c241c4765dc9ebfb039fd58eb ******/
		%feature("compactdefaultargs") Deactivate;
		%feature("autodoc", "
Parameters
----------
theMode: int

Return
-------
None

Description
-----------
Deactivates the given selection mode for all displayed objects.
") Deactivate;
		void Deactivate(const int theMode);

		/****** AIS_InteractiveContext::Deactivate ******/
		/****** md5 signature: cfea69d44907bc53764978e47e0de401 ******/
		%feature("compactdefaultargs") Deactivate;
		%feature("autodoc", "Return
-------
None

Description
-----------
Deactivates all the activated selection mode at all displayed objects.
") Deactivate;
		void Deactivate();

		/****** AIS_InteractiveContext::DefaultDrawer ******/
		/****** md5 signature: 14128b182687edc7e9f18d40a682f0b8 ******/
		%feature("compactdefaultargs") DefaultDrawer;
		%feature("autodoc", "Return
-------
opencascade::handle<Prs3d_Drawer>

Description
-----------
Returns the default attribute manager. This contains all the color and line attributes which can be used by interactive objects which do not have their own attributes.
") DefaultDrawer;
		const opencascade::handle<Prs3d_Drawer> & DefaultDrawer();

		/****** AIS_InteractiveContext::DetectedCurrentObject ******/
		/****** md5 signature: db9a21d25f0bb2a34f1d9b68c667faf4 ******/
		%feature("compactdefaultargs") DetectedCurrentObject;
		%feature("autodoc", "Return
-------
opencascade::handle<AIS_InteractiveObject>

Description
-----------
No available documentation.
") DetectedCurrentObject;
		opencascade::handle<AIS_InteractiveObject> DetectedCurrentObject();

		/****** AIS_InteractiveContext::DetectedCurrentOwner ******/
		/****** md5 signature: f92c094b1c7835be9059494de430ed90 ******/
		%feature("compactdefaultargs") DetectedCurrentOwner;
		%feature("autodoc", "Return
-------
opencascade::handle<SelectMgr_EntityOwner>

Description
-----------
Returns the owner from detected list pointed by current iterator position. WARNING! This method is irrelevant to DetectedOwner() which returns last picked Owner regardless of iterator position! 
See also: InitDetected(), MoreDetected(), NextDetected().
") DetectedCurrentOwner;
		opencascade::handle<SelectMgr_EntityOwner> DetectedCurrentOwner();

		/****** AIS_InteractiveContext::DetectedCurrentShape ******/
		/****** md5 signature: 89ce12168c616c9e784d18e7ee93368c ******/
		%feature("compactdefaultargs") DetectedCurrentShape;
		%feature("autodoc", "Return
-------
TopoDS_Shape

Description
-----------
No available documentation.
") DetectedCurrentShape;
		const TopoDS_Shape DetectedCurrentShape();

		/****** AIS_InteractiveContext::DetectedInteractive ******/
		/****** md5 signature: b0bed930b69f468285a023bd6f872239 ******/
		%feature("compactdefaultargs") DetectedInteractive;
		%feature("autodoc", "Return
-------
opencascade::handle<AIS_InteractiveObject>

Description
-----------
Returns the interactive objects last detected in context. In general this is just a wrapper for occ::down_cast<AIS_InteractiveObject>(DetectedOwner()->Selectable()). 
See also: DetectedOwner().
") DetectedInteractive;
		opencascade::handle<AIS_InteractiveObject> DetectedInteractive();

		/****** AIS_InteractiveContext::DetectedOwner ******/
		/****** md5 signature: e2c982281c31eda113b04938de464319 ******/
		%feature("compactdefaultargs") DetectedOwner;
		%feature("autodoc", "Return
-------
opencascade::handle<SelectMgr_EntityOwner>

Description
-----------
Returns the owner of the detected sensitive primitive which is currently dynamically highlighted. WARNING! This method is irrelevant to InitDetected()/MoreDetected()/NextDetected(). 
See also: HasDetected(), HasNextDetected(), HilightPreviousDetected(), HilightNextDetected().
") DetectedOwner;
		const opencascade::handle<SelectMgr_EntityOwner> & DetectedOwner();

		/****** AIS_InteractiveContext::DetectedShape ******/
		/****** md5 signature: f9c1d6b6d8e786aa2886d569920b8fa0 ******/
		%feature("compactdefaultargs") DetectedShape;
		%feature("autodoc", "Return
-------
TopoDS_Shape

Description
-----------
No available documentation.
") DetectedShape;
		const TopoDS_Shape DetectedShape();

		/****** AIS_InteractiveContext::DeviationAngle ******/
		/****** md5 signature: 4fe694e6c5adbb86b632b32bbfe70e0f ******/
		%feature("compactdefaultargs") DeviationAngle;
		%feature("autodoc", "Return
-------
double

Description
-----------
No available documentation.
") DeviationAngle;
		double DeviationAngle();

		/****** AIS_InteractiveContext::DeviationCoefficient ******/
		/****** md5 signature: 2a333fa3fdd9a3eae97d90cf54d7eb3d ******/
		%feature("compactdefaultargs") DeviationCoefficient;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns the deviation coefficient. Drawings of curves or patches are made with respect to a maximal chordal deviation. A Deviation coefficient is used in the shading display mode. The shape is seen decomposed into triangles. These are used to calculate reflection of light from the surface of the object. The triangles are formed from chords of the curves in the shape. The deviation coefficient gives the highest value of the angle with which a chord can deviate from a tangent to a curve. If this limit is reached, a new triangle is begun. This deviation is absolute and is set through Prs3d_Drawer::SetMaximalChordialDeviation. The default value is 0.001. In drawing shapes, however, you are allowed to ask for a relative deviation. This deviation will be: SizeOfObject * DeviationCoefficient.
") DeviationCoefficient;
		double DeviationCoefficient();

		/****** AIS_InteractiveContext::DisableDrawHiddenLine ******/
		/****** md5 signature: 6b6aa32f5adca641a6dc6a0b3f24eac5 ******/
		%feature("compactdefaultargs") DisableDrawHiddenLine;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") DisableDrawHiddenLine;
		void DisableDrawHiddenLine();

		/****** AIS_InteractiveContext::Disconnect ******/
		/****** md5 signature: d82d50039f7b9e3970f0cb205fec138f ******/
		%feature("compactdefaultargs") Disconnect;
		%feature("autodoc", "
Parameters
----------
theAssembly: AIS_InteractiveObject
theObjToDisconnect: AIS_InteractiveObject (optional, default to nullptr)

Return
-------
None

Description
-----------
Disconnects theObjToDisconnect from theAssembly and removes dependent selection structures.
") Disconnect;
		void Disconnect(const opencascade::handle<AIS_InteractiveObject> & theAssembly, const opencascade::handle<AIS_InteractiveObject> & theObjToDisconnect = nullptr);

		/****** AIS_InteractiveContext::Display ******/
		/****** md5 signature: 8d325aa2ac907d74b59da0d476943116 ******/
		%feature("compactdefaultargs") Display;
		%feature("autodoc", "
Parameters
----------
theIObj: AIS_InteractiveObject
theToUpdateViewer: bool

Return
-------
None

Description
-----------
Displays the object in this Context using default Display Mode. This will be the object's default display mode, if there is one. Otherwise, it will be the context mode. The Interactive Object's default selection mode is activated if GetAutoActivateSelection() is True. In general, this is 0.
") Display;
		void Display(const opencascade::handle<AIS_InteractiveObject> & theIObj, const bool theToUpdateViewer);

		/****** AIS_InteractiveContext::Display ******/
		/****** md5 signature: 2dc0c40ffe060e8cffbfb100ee9c36f3 ******/
		%feature("compactdefaultargs") Display;
		%feature("autodoc", "
Parameters
----------
theIObj: AIS_InteractiveObject
theDispMode: int
theSelectionMode: int
theToUpdateViewer: bool
theDispStatus: PrsMgr_DisplayStatus (optional, default to PrsMgr_DisplayStatus_None)

Return
-------
None

Description
-----------
Sets status, display mode and selection mode for specified Object If theSelectionMode equals -1, theIObj will not be activated: it will be displayed but will not be selectable.
") Display;
		void Display(const opencascade::handle<AIS_InteractiveObject> & theIObj, const int theDispMode, const int theSelectionMode, const bool theToUpdateViewer, const PrsMgr_DisplayStatus theDispStatus = PrsMgr_DisplayStatus_None);

		/****** AIS_InteractiveContext::Display ******/
		/****** md5 signature: f07de2227726c6423d6b9f9c24dd32b9 ******/
		%feature("compactdefaultargs") Display;
		%feature("autodoc", "
Parameters
----------
theIObj: AIS_InteractiveObject
theDispMode: int
theSelectionMode: int
theToUpdateViewer: bool
theToAllowDecomposition: bool
theDispStatus: PrsMgr_DisplayStatus (optional, default to PrsMgr_DisplayStatus_None)

Return
-------
None

Description
-----------
No available documentation.
") Display;
		void Display(const opencascade::handle<AIS_InteractiveObject> & theIObj, const int theDispMode, const int theSelectionMode, const bool theToUpdateViewer, const bool theToAllowDecomposition, const PrsMgr_DisplayStatus theDispStatus = PrsMgr_DisplayStatus_None);

		/****** AIS_InteractiveContext::DisplayActiveSensitive ******/
		/****** md5 signature: 3e2889a461702eed5abdf967dcfcfd6c ******/
		%feature("compactdefaultargs") DisplayActiveSensitive;
		%feature("autodoc", "
Parameters
----------
aView: V3d_View

Return
-------
None

Description
-----------
Visualization of sensitives - for debugging purposes!.
") DisplayActiveSensitive;
		void DisplayActiveSensitive(const opencascade::handle<V3d_View> & aView);

		/****** AIS_InteractiveContext::DisplayActiveSensitive ******/
		/****** md5 signature: 3aede03c6608a0f4e195960113404d0e ******/
		%feature("compactdefaultargs") DisplayActiveSensitive;
		%feature("autodoc", "
Parameters
----------
anObject: AIS_InteractiveObject
aView: V3d_View

Return
-------
None

Description
-----------
Visualization of sensitives - for debugging purposes!.
") DisplayActiveSensitive;
		void DisplayActiveSensitive(const opencascade::handle<AIS_InteractiveObject> & anObject, const opencascade::handle<V3d_View> & aView);

		/****** AIS_InteractiveContext::DisplayAll ******/
		/****** md5 signature: 9cb80d45965345914804ed1c9881c3a0 ******/
		%feature("compactdefaultargs") DisplayAll;
		%feature("autodoc", "
Parameters
----------
theToUpdateViewer: bool

Return
-------
None

Description
-----------
Displays all hidden objects.
") DisplayAll;
		void DisplayAll(const bool theToUpdateViewer);

		/****** AIS_InteractiveContext::DisplayMode ******/
		/****** md5 signature: ac5a0607c42d4a5cb024f9e1f4d5fff9 ******/
		%feature("compactdefaultargs") DisplayMode;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the Display Mode setting to be used by default.
") DisplayMode;
		int DisplayMode();

		/****** AIS_InteractiveContext::DisplayPriority ******/
		/****** md5 signature: 5ee166e687f439119f4237cb1827925f ******/
		%feature("compactdefaultargs") DisplayPriority;
		%feature("autodoc", "
Parameters
----------
theIObj: AIS_InteractiveObject

Return
-------
Graphic3d_DisplayPriority

Description
-----------
Returns the display priority of the Object.
") DisplayPriority;
		Graphic3d_DisplayPriority DisplayPriority(const opencascade::handle<AIS_InteractiveObject> & theIObj);

		/****** AIS_InteractiveContext::DisplaySelected ******/
		/****** md5 signature: 57107a2b6e492c9da8717d6d7fe05849 ******/
		%feature("compactdefaultargs") DisplaySelected;
		%feature("autodoc", "
Parameters
----------
theToUpdateViewer: bool

Return
-------
None

Description
-----------
Displays current objects.
") DisplaySelected;
		void DisplaySelected(const bool theToUpdateViewer);

		/****** AIS_InteractiveContext::DisplayStatus ******/
		/****** md5 signature: 63fdc6587cc5281c7155ba72cfd784af ******/
		%feature("compactdefaultargs") DisplayStatus;
		%feature("autodoc", "
Parameters
----------
anIobj: AIS_InteractiveObject

Return
-------
PrsMgr_DisplayStatus

Description
-----------
Returns the display status of the entity anIobj. This will be one of the following: - AIS_DS_Displayed displayed in main viewer - AIS_DS_Erased hidden in main viewer - AIS_DS_Temporary temporarily displayed - AIS_DS_None nowhere displayed.
") DisplayStatus;
		PrsMgr_DisplayStatus DisplayStatus(const opencascade::handle<AIS_InteractiveObject> & anIobj);

		/****** AIS_InteractiveContext::DisplayedObjects ******/
		/****** md5 signature: 7fcf5bb9acd3ea2aa141f21a6cb08720 ******/
		%feature("compactdefaultargs") DisplayedObjects;
		%feature("autodoc", "
Parameters
----------
aListOfIO: AIS_InteractiveObject

Return
-------
None

Description
-----------
Returns the list of displayed objects of a particular Type WhichKind and Signature WhichSignature. By Default, WhichSignature equals -1. This means that there is a check on type only.
") DisplayedObjects;
		void DisplayedObjects(NCollection_List<opencascade::handle<AIS_InteractiveObject>> & aListOfIO);

		/****** AIS_InteractiveContext::DisplayedObjects ******/
		/****** md5 signature: 24c63341d93dc6be9fd0ad3f0b65c6f5 ******/
		%feature("compactdefaultargs") DisplayedObjects;
		%feature("autodoc", "
Parameters
----------
theWhichKind: AIS_KindOfInteractive
theWhichSignature: int
theListOfIO: AIS_InteractiveObject

Return
-------
None

Description
-----------
gives the list of displayed objects of a particular Type and signature. by Default, <WhichSignature> = -1 means control only on <WhichKind>.
") DisplayedObjects;
		void DisplayedObjects(const AIS_KindOfInteractive theWhichKind, const int theWhichSignature, NCollection_List<opencascade::handle<AIS_InteractiveObject>> & theListOfIO);

		/****** AIS_InteractiveContext::DrawHiddenLine ******/
		/****** md5 signature: f101b8f6d639c91c9dfd43356964ef9e ******/
		%feature("compactdefaultargs") DrawHiddenLine;
		%feature("autodoc", "Return
-------
bool

Description
-----------
returns true if the hidden lines are to be drawn. By default the hidden lines are not drawn.
") DrawHiddenLine;
		bool DrawHiddenLine();


        /****************** DumpJson ******************/
        %feature("autodoc", "
Parameters
----------
depth: int, default=-1

Return
-------
str

Description
-----------
Dump the object to JSON string.
") DumpJson;
        %extend{
            std::string DumpJson(int depth=-1) {
            std::stringstream s;
            self->DumpJson(s, depth);
            return "{" + s.str() + "}" ;}
        };
		/****** AIS_InteractiveContext::EnableDrawHiddenLine ******/
		/****** md5 signature: ef1c63d78ea294d9e74f6b66ff4bc5ee ******/
		%feature("compactdefaultargs") EnableDrawHiddenLine;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") EnableDrawHiddenLine;
		void EnableDrawHiddenLine();

		/****** AIS_InteractiveContext::EndImmediateDraw ******/
		/****** md5 signature: f4e988ec1ee1dc2a753923dda99c14d6 ******/
		%feature("compactdefaultargs") EndImmediateDraw;
		%feature("autodoc", "
Parameters
----------
theView: V3d_View

Return
-------
bool

Description
-----------
No available documentation.
") EndImmediateDraw;
		bool EndImmediateDraw(const opencascade::handle<V3d_View> & theView);

		/****** AIS_InteractiveContext::EndImmediateDraw ******/
		/****** md5 signature: df2198949acf41b64852228d5d49dcfc ******/
		%feature("compactdefaultargs") EndImmediateDraw;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") EndImmediateDraw;
		bool EndImmediateDraw();

		/****** AIS_InteractiveContext::Erase ******/
		/****** md5 signature: ced9edb1020b9e3a18346a016700dc33 ******/
		%feature("compactdefaultargs") Erase;
		%feature("autodoc", "
Parameters
----------
theIObj: AIS_InteractiveObject
theToUpdateViewer: bool

Return
-------
None

Description
-----------
Hides the object. The object's presentations are simply flagged as invisible and therefore excluded from redrawing. To show hidden objects, use Display().
") Erase;
		void Erase(const opencascade::handle<AIS_InteractiveObject> & theIObj, const bool theToUpdateViewer);

		/****** AIS_InteractiveContext::EraseAll ******/
		/****** md5 signature: 210cb0fd281e01d50a501dcb68eeadfd ******/
		%feature("compactdefaultargs") EraseAll;
		%feature("autodoc", "
Parameters
----------
theToUpdateViewer: bool

Return
-------
None

Description
-----------
Hides all objects. The object's presentations are simply flagged as invisible and therefore excluded from redrawing. To show all hidden objects, use DisplayAll().
") EraseAll;
		void EraseAll(const bool theToUpdateViewer);

		/****** AIS_InteractiveContext::EraseSelected ******/
		/****** md5 signature: f27afb187813b1ef47c78844a4b69e9c ******/
		%feature("compactdefaultargs") EraseSelected;
		%feature("autodoc", "
Parameters
----------
theToUpdateViewer: bool

Return
-------
None

Description
-----------
Hides selected objects. The object's presentations are simply flagged as invisible and therefore excluded from redrawing. To show hidden objects, use Display().
") EraseSelected;
		void EraseSelected(const bool theToUpdateViewer);

		/****** AIS_InteractiveContext::ErasedObjects ******/
		/****** md5 signature: 7ad08532ebce2248d1a23892ee6c11f2 ******/
		%feature("compactdefaultargs") ErasedObjects;
		%feature("autodoc", "
Parameters
----------
theListOfIO: AIS_InteractiveObject

Return
-------
None

Description
-----------
Returns the list theListOfIO of erased objects (hidden objects) particular Type WhichKind and Signature WhichSignature. By Default, WhichSignature equals 1. This means that there is a check on type only.
") ErasedObjects;
		void ErasedObjects(NCollection_List<opencascade::handle<AIS_InteractiveObject>> & theListOfIO);

		/****** AIS_InteractiveContext::ErasedObjects ******/
		/****** md5 signature: 36aa955c27886fe500ec3a67d71b531a ******/
		%feature("compactdefaultargs") ErasedObjects;
		%feature("autodoc", "
Parameters
----------
theWhichKind: AIS_KindOfInteractive
theWhichSignature: int
theListOfIO: AIS_InteractiveObject

Return
-------
None

Description
-----------
gives the list of erased objects (hidden objects) Type and signature by Default, <WhichSignature> = -1 means control only on <WhichKind>.
") ErasedObjects;
		void ErasedObjects(const AIS_KindOfInteractive theWhichKind, const int theWhichSignature, NCollection_List<opencascade::handle<AIS_InteractiveObject>> & theListOfIO);

		/****** AIS_InteractiveContext::FilterType ******/
		/****** md5 signature: e37fce598a0b5e9b676a367504573e6c ******/
		%feature("compactdefaultargs") FilterType;
		%feature("autodoc", "Return
-------
SelectMgr_FilterType

Description
-----------
Return: the context selection filter type.
") FilterType;
		SelectMgr_FilterType FilterType();

		/****** AIS_InteractiveContext::Filters ******/
		/****** md5 signature: 952ec326fbdc2c7b93e91359d0cc739a ******/
		%feature("compactdefaultargs") Filters;
		%feature("autodoc", "Return
-------
NCollection_List<opencascade::handle<SelectMgr_Filter>>

Description
-----------
Returns the list of filters active in a local context.
") Filters;
		const NCollection_List<opencascade::handle<SelectMgr_Filter>> & Filters();

		/****** AIS_InteractiveContext::FirstSelectedObject ******/
		/****** md5 signature: b2acdd4c911cfcbaab84d9d6a86cd9a5 ******/
		%feature("compactdefaultargs") FirstSelectedObject;
		%feature("autodoc", "Return
-------
opencascade::handle<AIS_InteractiveObject>

Description
-----------
Returns the first selected object in the list of current selected.
") FirstSelectedObject;
		opencascade::handle<AIS_InteractiveObject> FirstSelectedObject();

		/****** AIS_InteractiveContext::FitSelected ******/
		/****** md5 signature: 5fc211c4110126e9f4077cd3277c3150 ******/
		%feature("compactdefaultargs") FitSelected;
		%feature("autodoc", "
Parameters
----------
theView: V3d_View
theMargin: double
theToUpdate: bool

Return
-------
None

Description
-----------
Fits the view correspondingly to the bounds of selected objects. Infinite objects are ignored if infinite state of AIS_InteractiveObject is set to true.
") FitSelected;
		void FitSelected(const opencascade::handle<V3d_View> & theView, const double theMargin, const bool theToUpdate);

		/****** AIS_InteractiveContext::FitSelected ******/
		/****** md5 signature: fac92c7e203e7b23d7c9d8470d938941 ******/
		%feature("compactdefaultargs") FitSelected;
		%feature("autodoc", "
Parameters
----------
theView: V3d_View

Return
-------
None

Description
-----------
Fits the view correspondingly to the bounds of selected objects. Infinite objects are ignored if infinite state of AIS_InteractiveObject is set to true.
") FitSelected;
		void FitSelected(const opencascade::handle<V3d_View> & theView);

		/****** AIS_InteractiveContext::GetAutoActivateSelection ******/
		/****** md5 signature: 49ae62abb3cf1a46951bccff26d7b60d ******/
		%feature("compactdefaultargs") GetAutoActivateSelection;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Manages displaying the new object should also automatically activate default selection mode; True by default.
") GetAutoActivateSelection;
		bool GetAutoActivateSelection();

		/****** AIS_InteractiveContext::GetZLayer ******/
		/****** md5 signature: fc7034555b0d116eef6c19ec38f9deca ******/
		%feature("compactdefaultargs") GetZLayer;
		%feature("autodoc", "
Parameters
----------
theIObj: AIS_InteractiveObject

Return
-------
Graphic3d_ZLayerId

Description
-----------
Get Z layer id set for displayed interactive object.
") GetZLayer;
		Graphic3d_ZLayerId GetZLayer(const opencascade::handle<AIS_InteractiveObject> & theIObj);

		/****** AIS_InteractiveContext::GlobalFilter ******/
		/****** md5 signature: 06ef473f9ff7dbdffd2e783f736f69a0 ******/
		%feature("compactdefaultargs") GlobalFilter;
		%feature("autodoc", "Return
-------
opencascade::handle<SelectMgr_AndOrFilter>

Description
-----------
Return: the context selection global context filter.
") GlobalFilter;
		const opencascade::handle<SelectMgr_AndOrFilter> & GlobalFilter();

		/****** AIS_InteractiveContext::GravityPoint ******/
		/****** md5 signature: 61432a855a261dfe994f834c87d91d2a ******/
		%feature("compactdefaultargs") GravityPoint;
		%feature("autodoc", "
Parameters
----------
theView: V3d_View

Return
-------
gp_Pnt

Description
-----------
Return rotation gravity point.
") GravityPoint;
		virtual gp_Pnt GravityPoint(const opencascade::handle<V3d_View> & theView);

		/****** AIS_InteractiveContext::HasApplicative ******/
		/****** md5 signature: 798dd90a7f160891e906b2af2976624a ******/
		%feature("compactdefaultargs") HasApplicative;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns SelectedInteractive()->HasOwner(). 
See also: SelectedOwner().
") HasApplicative;
		bool HasApplicative();

		/****** AIS_InteractiveContext::HasColor ******/
		/****** md5 signature: f22a8bc6bcb9b8ffa6248d7c3a4ce79c ******/
		%feature("compactdefaultargs") HasColor;
		%feature("autodoc", "
Parameters
----------
aniobj: AIS_InteractiveObject

Return
-------
bool

Description
-----------
Returns true if a view of the Interactive Object has color.
") HasColor;
		bool HasColor(const opencascade::handle<AIS_InteractiveObject> & aniobj);

		/****** AIS_InteractiveContext::HasDetected ******/
		/****** md5 signature: 676270e6789f911200d61f948c278a92 ******/
		%feature("compactdefaultargs") HasDetected;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if there is a mouse-detected entity in context. 
See also: DetectedOwner(), HasNextDetected(), HilightPreviousDetected(), HilightNextDetected().
") HasDetected;
		bool HasDetected();

		/****** AIS_InteractiveContext::HasDetectedShape ******/
		/****** md5 signature: c9fc16c9407435d422d5a615814ab0ff ******/
		%feature("compactdefaultargs") HasDetectedShape;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") HasDetectedShape;
		bool HasDetectedShape();

		/****** AIS_InteractiveContext::HasLocation ******/
		/****** md5 signature: 4250903cedf1f330939e121531e192bd ******/
		%feature("compactdefaultargs") HasLocation;
		%feature("autodoc", "
Parameters
----------
theObject: AIS_InteractiveObject

Return
-------
bool

Description
-----------
Returns true if the Object has a location.
") HasLocation;
		bool HasLocation(const opencascade::handle<AIS_InteractiveObject> & theObject);

		/****** AIS_InteractiveContext::HasNextDetected ******/
		/****** md5 signature: 28ccf130db200ad6924f647a789825f9 ******/
		%feature("compactdefaultargs") HasNextDetected;
		%feature("autodoc", "Return
-------
bool

Description
-----------
returns True if other entities were detected in the last mouse detection 
See also: HilightPreviousDetected(), HilightNextDetected().
") HasNextDetected;
		bool HasNextDetected();

		/****** AIS_InteractiveContext::HasPolygonOffsets ******/
		/****** md5 signature: 571b8d411e330981c27cdf3f56005f7d ******/
		%feature("compactdefaultargs") HasPolygonOffsets;
		%feature("autodoc", "
Parameters
----------
anObj: AIS_InteractiveObject

Return
-------
bool

Description
-----------
Simply calls AIS_InteractiveObject::HasPolygonOffsets().
") HasPolygonOffsets;
		bool HasPolygonOffsets(const opencascade::handle<AIS_InteractiveObject> & anObj);

		/****** AIS_InteractiveContext::HasSelectedShape ******/
		/****** md5 signature: 75e26923cad62dc2431b8a442e9fec41 ******/
		%feature("compactdefaultargs") HasSelectedShape;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if the interactive context has a shape selected. 
See also: SelectedShape().
") HasSelectedShape;
		bool HasSelectedShape();

		/****** AIS_InteractiveContext::HiddenLineAspect ******/
		/****** md5 signature: 94d1c2a65d1f004db7812470264560c4 ******/
		%feature("compactdefaultargs") HiddenLineAspect;
		%feature("autodoc", "Return
-------
opencascade::handle<Prs3d_LineAspect>

Description
-----------
Initializes hidden line aspect in the default drawing tool, or Drawer. The default values are: Color: Quantity_NOC_YELLOW Type of line: Aspect_TOL_DASH Width: 1.
") HiddenLineAspect;
		const opencascade::handle<Prs3d_LineAspect> & HiddenLineAspect();

		/****** AIS_InteractiveContext::HighlightStyle ******/
		/****** md5 signature: 2cb78034dd0075f5760ff6947175afbf ******/
		%feature("compactdefaultargs") HighlightStyle;
		%feature("autodoc", "
Parameters
----------
theStyleType: Prs3d_TypeOfHighlight

Return
-------
opencascade::handle<Prs3d_Drawer>

Description
-----------
Returns default highlight style settings (could be overridden by PrsMgr_PresentableObject). //! Tip: although highlighting style is defined by Prs3d_Drawer, only a small set of properties derived from it's base class Graphic3d_PresentationAttributes will be actually used in most cases. //! Default highlight style for all types is Aspect_TOHM_COLOR. Other defaults: - Prs3d_TypeOfHighlight_Dynamic * Color: Quantity_NOC_CYAN1; * Layer: Graphic3d_ZLayerId_Top, object highlighting is drawn on top of main scene within Immediate Layers, so that V3d_View::RedrawImmediate() will be enough to see update; - Prs3d_TypeOfHighlight_LocalDynamic * Color: Quantity_NOC_CYAN1; * Layer: Graphic3d_ZLayerId_Topmost, object parts highlighting is drawn on top of main scene within Immediate Layers with depth cleared (even overlapped geometry will be revealed); - Prs3d_TypeOfHighlight_Selected * Color: Quantity_NOC_GRAY80; * Layer: Graphic3d_ZLayerId_UNKNOWN, object highlighting is drawn on top of main scene within the same layer as object itself (e.g. Graphic3d_ZLayerId_Default by default) and increased priority. //! 
Input parameter: theStyleType highlight style to modify 
Return: drawer associated to specified highlight type //! 
See also: MoveTo() using Prs3d_TypeOfHighlight_Dynamic and Prs3d_TypeOfHighlight_LocalDynamic types 
See also: SelectDetected() using Prs3d_TypeOfHighlight_Selected and Prs3d_TypeOfHighlight_LocalSelected types 
See also: PrsMgr_PresentableObject::DynamicHilightAttributes() overriding Prs3d_TypeOfHighlight_Dynamic and Prs3d_TypeOfHighlight_LocalDynamic defaults on object level 
See also: PrsMgr_PresentableObject::HilightAttributes() overriding Prs3d_TypeOfHighlight_Selected and Prs3d_TypeOfHighlight_LocalSelected defaults on object level.
") HighlightStyle;
		const opencascade::handle<Prs3d_Drawer> & HighlightStyle(const Prs3d_TypeOfHighlight theStyleType);

		/****** AIS_InteractiveContext::HighlightStyle ******/
		/****** md5 signature: a5e55eefe6df1b6a11e0c9a34f35e9be ******/
		%feature("compactdefaultargs") HighlightStyle;
		%feature("autodoc", "Return
-------
opencascade::handle<Prs3d_Drawer>

Description
-----------
Returns current dynamic highlight style settings corresponding to Prs3d_TypeOfHighlight_Dynamic. This is just a short-cut to HighlightStyle(Prs3d_TypeOfHighlight_Dynamic).
") HighlightStyle;
		const opencascade::handle<Prs3d_Drawer> & HighlightStyle();

		/****** AIS_InteractiveContext::HighlightStyle ******/
		/****** md5 signature: 3a07ab333107794a0b43c878bcdf4b2e ******/
		%feature("compactdefaultargs") HighlightStyle;
		%feature("autodoc", "
Parameters
----------
theObj: AIS_InteractiveObject
theStyle: Prs3d_Drawer

Return
-------
bool

Description
-----------
Returns highlight style of the object if it is marked as highlighted via global status 
Input parameter: theObj the object to check.
") HighlightStyle;
		bool HighlightStyle(const opencascade::handle<AIS_InteractiveObject> & theObj, opencascade::handle<Prs3d_Drawer> & theStyle);

		/****** AIS_InteractiveContext::HighlightStyle ******/
		/****** md5 signature: 043b93b4df8d9778103fdc8855a04be0 ******/
		%feature("compactdefaultargs") HighlightStyle;
		%feature("autodoc", "
Parameters
----------
theOwner: SelectMgr_EntityOwner
theStyle: Prs3d_Drawer

Return
-------
bool

Description
-----------
Returns highlight style of the owner if it is selected 
Input parameter: theOwner the owner to check.
") HighlightStyle;
		bool HighlightStyle(const opencascade::handle<SelectMgr_EntityOwner> & theOwner, opencascade::handle<Prs3d_Drawer> & theStyle);

		/****** AIS_InteractiveContext::Hilight ******/
		/****** md5 signature: f3591b060d94af5b7d02a7edf50a6372 ******/
		%feature("compactdefaultargs") Hilight;
		%feature("autodoc", "
Parameters
----------
theObj: AIS_InteractiveObject
theIsToUpdateViewer: bool

Return
-------
None

Description
-----------
No available documentation.
") Hilight;
		void Hilight(const opencascade::handle<AIS_InteractiveObject> & theObj, const bool theIsToUpdateViewer);

		/****** AIS_InteractiveContext::HilightCurrents ******/
		/****** md5 signature: ca62e44392c0607053af4f8f4faeb684 ******/
		%feature("compactdefaultargs") HilightCurrents;
		%feature("autodoc", "
Parameters
----------
theToUpdateViewer: bool

Return
-------
None

Description
-----------
No available documentation.
") HilightCurrents;
		void HilightCurrents(const bool theToUpdateViewer);

		/****** AIS_InteractiveContext::HilightNextDetected ******/
		/****** md5 signature: 97b2d299278e1bdd64f470282809000e ******/
		%feature("compactdefaultargs") HilightNextDetected;
		%feature("autodoc", "
Parameters
----------
theView: V3d_View
theToRedrawImmediate: bool (optional, default to true)

Return
-------
int

Description
-----------
If more than 1 object is detected by the selector, only the 'best' owner is hilighted at the mouse position. This Method allows the user to hilight one after another the other detected entities. If The method select is called, the selected entity will be the hilighted one! WARNING: Loop Method. When all the detected entities have been hilighted, the next call will hilight the first one again. 
Return: the Rank of hilighted entity 
See also: HasNextDetected(), HilightPreviousDetected().
") HilightNextDetected;
		int HilightNextDetected(const opencascade::handle<V3d_View> & theView, const bool theToRedrawImmediate = true);

		/****** AIS_InteractiveContext::HilightPreviousDetected ******/
		/****** md5 signature: 71b7b08e9bcc50eed83308b5aad0b3dc ******/
		%feature("compactdefaultargs") HilightPreviousDetected;
		%feature("autodoc", "
Parameters
----------
theView: V3d_View
theToRedrawImmediate: bool (optional, default to true)

Return
-------
int

Description
-----------
Same as previous methods in reverse direction. 
See also: HasNextDetected(), HilightNextDetected().
") HilightPreviousDetected;
		int HilightPreviousDetected(const opencascade::handle<V3d_View> & theView, const bool theToRedrawImmediate = true);

		/****** AIS_InteractiveContext::HilightSelected ******/
		/****** md5 signature: 8252c60c4d93b6c63d1502cda5b8d383 ******/
		%feature("compactdefaultargs") HilightSelected;
		%feature("autodoc", "
Parameters
----------
theToUpdateViewer: bool

Return
-------
None

Description
-----------
Highlights selected objects.
") HilightSelected;
		void HilightSelected(const bool theToUpdateViewer);

		/****** AIS_InteractiveContext::HilightWithColor ******/
		/****** md5 signature: b25bdc5ec637ffa5c048f3c64adaef0d ******/
		%feature("compactdefaultargs") HilightWithColor;
		%feature("autodoc", "
Parameters
----------
theObj: AIS_InteractiveObject
theStyle: Prs3d_Drawer
theToUpdateViewer: bool

Return
-------
None

Description
-----------
Changes the color of all the lines of the object in view.
") HilightWithColor;
		void HilightWithColor(const opencascade::handle<AIS_InteractiveObject> & theObj, const opencascade::handle<Prs3d_Drawer> & theStyle, const bool theToUpdateViewer);

		/****** AIS_InteractiveContext::ImmediateAdd ******/
		/****** md5 signature: 2f47f31f11b8a1e6bacf8a5afdad4c4f ******/
		%feature("compactdefaultargs") ImmediateAdd;
		%feature("autodoc", "
Parameters
----------
theObj: AIS_InteractiveObject
theMode: int (optional, default to 0)

Return
-------
bool

Description
-----------
No available documentation.
") ImmediateAdd;
		bool ImmediateAdd(const opencascade::handle<AIS_InteractiveObject> & theObj, const int theMode = 0);

		/****** AIS_InteractiveContext::InitCurrent ******/
		/****** md5 signature: 3be01264f20faf11fcd664c48a8a4660 ******/
		%feature("compactdefaultargs") InitCurrent;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") InitCurrent;
		void InitCurrent();

		/****** AIS_InteractiveContext::InitDetected ******/
		/****** md5 signature: c8e093453ccb47b93fdb3539272d695f ******/
		%feature("compactdefaultargs") InitDetected;
		%feature("autodoc", "Return
-------
None

Description
-----------
Initialization for iteration through mouse-detected objects in interactive context or in local context if it is opened. 
See also: DetectedCurrentOwner(), MoreDetected(), NextDetected().
") InitDetected;
		void InitDetected();

		/****** AIS_InteractiveContext::InitSelected ******/
		/****** md5 signature: 5a647272f34af26ffd1cb3083091517d ******/
		%feature("compactdefaultargs") InitSelected;
		%feature("autodoc", "Return
-------
None

Description
-----------
Initializes a scan of the selected objects. 
See also: SelectedOwner(), MoreSelected(), NextSelected().
") InitSelected;
		void InitSelected();

		/****** AIS_InteractiveContext::IsCurrent ******/
		/****** md5 signature: c5178aeedef12c1a2c754d7e50286712 ******/
		%feature("compactdefaultargs") IsCurrent;
		%feature("autodoc", "
Parameters
----------
theObject: AIS_InteractiveObject

Return
-------
bool

Description
-----------
No available documentation.
") IsCurrent;
		bool IsCurrent(const opencascade::handle<AIS_InteractiveObject> & theObject);

		/****** AIS_InteractiveContext::IsDisplayed ******/
		/****** md5 signature: c3d92a73de6a1706978b920d4d352972 ******/
		%feature("compactdefaultargs") IsDisplayed;
		%feature("autodoc", "
Parameters
----------
anIobj: AIS_InteractiveObject

Return
-------
bool

Description
-----------
Returns true if Object is displayed in the interactive context.
") IsDisplayed;
		bool IsDisplayed(const opencascade::handle<AIS_InteractiveObject> & anIobj);

		/****** AIS_InteractiveContext::IsDisplayed ******/
		/****** md5 signature: c9c97b9061b1f615a5c79fced62575a1 ******/
		%feature("compactdefaultargs") IsDisplayed;
		%feature("autodoc", "
Parameters
----------
aniobj: AIS_InteractiveObject
aMode: int

Return
-------
bool

Description
-----------
No available documentation.
") IsDisplayed;
		bool IsDisplayed(const opencascade::handle<AIS_InteractiveObject> & aniobj, const int aMode);

		/****** AIS_InteractiveContext::IsHilighted ******/
		/****** md5 signature: f8aa820f536787ed283ce19a4a9f1977 ******/
		%feature("compactdefaultargs") IsHilighted;
		%feature("autodoc", "
Parameters
----------
theObj: AIS_InteractiveObject

Return
-------
bool

Description
-----------
Returns true if the object is marked as highlighted via its global status 
Input parameter: theObj the object to check.
") IsHilighted;
		bool IsHilighted(const opencascade::handle<AIS_InteractiveObject> & theObj);

		/****** AIS_InteractiveContext::IsHilighted ******/
		/****** md5 signature: 78fa06a60fc9aac93cc05852f8c4cf05 ******/
		%feature("compactdefaultargs") IsHilighted;
		%feature("autodoc", "
Parameters
----------
theOwner: SelectMgr_EntityOwner

Return
-------
bool

Description
-----------
Returns true if the owner is marked as selected 
Input parameter: theOwner the owner to check.
") IsHilighted;
		bool IsHilighted(const opencascade::handle<SelectMgr_EntityOwner> & theOwner);

		/****** AIS_InteractiveContext::IsImmediateModeOn ******/
		/****** md5 signature: 9c28ff2b552e612a89a33462bcb77e96 ******/
		%feature("compactdefaultargs") IsImmediateModeOn;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsImmediateModeOn;
		bool IsImmediateModeOn();

		/****** AIS_InteractiveContext::IsSelected ******/
		/****** md5 signature: 5708cdbabace1dc2fb1aa3183470425b ******/
		%feature("compactdefaultargs") IsSelected;
		%feature("autodoc", "
Parameters
----------
theOwner: SelectMgr_EntityOwner

Return
-------
bool

Description
-----------
Returns true is the owner given is selected.
") IsSelected;
		bool IsSelected(const opencascade::handle<SelectMgr_EntityOwner> & theOwner);

		/****** AIS_InteractiveContext::IsSelected ******/
		/****** md5 signature: d2b5aabe2314acbbb54dcc2811be57e5 ******/
		%feature("compactdefaultargs") IsSelected;
		%feature("autodoc", "
Parameters
----------
theObj: AIS_InteractiveObject

Return
-------
bool

Description
-----------
Returns true is the object given is selected.
") IsSelected;
		bool IsSelected(const opencascade::handle<AIS_InteractiveObject> & theObj);

		/****** AIS_InteractiveContext::IsoNumber ******/
		/****** md5 signature: 8ab7082cd8dac27b12a024205b6b988f ******/
		%feature("compactdefaultargs") IsoNumber;
		%feature("autodoc", "
Parameters
----------
WhichIsos: AIS_TypeOfIso (optional, default to AIS_TOI_Both)

Return
-------
int

Description
-----------
Returns the number of U and V isoparameters displayed.
") IsoNumber;
		int IsoNumber(const AIS_TypeOfIso WhichIsos = AIS_TOI_Both);

		/****** AIS_InteractiveContext::IsoOnPlane ******/
		/****** md5 signature: 99d1968fb031db6805e232bd55cabb03 ******/
		%feature("compactdefaultargs") IsoOnPlane;
		%feature("autodoc", "
Parameters
----------
theToSwitchOn: bool

Return
-------
None

Description
-----------
Returns True if drawing isoparameters on planes is enabled.
") IsoOnPlane;
		void IsoOnPlane(const bool theToSwitchOn);

		/****** AIS_InteractiveContext::IsoOnPlane ******/
		/****** md5 signature: bf0d1722489788824ecc7c4c4a3c49c0 ******/
		%feature("compactdefaultargs") IsoOnPlane;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if drawing isoparameters on planes is enabled. if <forUIsos> = False,.
") IsoOnPlane;
		bool IsoOnPlane();

		/****** AIS_InteractiveContext::IsoOnTriangulation ******/
		/****** md5 signature: 1adedaa831b50201ed4b8b1e46e799e7 ******/
		%feature("compactdefaultargs") IsoOnTriangulation;
		%feature("autodoc", "
Parameters
----------
theIsEnabled: bool
theObject: AIS_InteractiveObject

Return
-------
None

Description
-----------
Enables or disables on-triangulation build for isolines for a particular object. In case if on-triangulation builder is disabled, default on-plane builder will compute isolines for the object given.
") IsoOnTriangulation;
		void IsoOnTriangulation(const bool theIsEnabled, const opencascade::handle<AIS_InteractiveObject> & theObject);

		/****** AIS_InteractiveContext::IsoOnTriangulation ******/
		/****** md5 signature: 9128f28f78badf057bfdea541664e5e9 ******/
		%feature("compactdefaultargs") IsoOnTriangulation;
		%feature("autodoc", "
Parameters
----------
theToSwitchOn: bool

Return
-------
None

Description
-----------
Enables or disables on-triangulation build for isolines for default drawer. In case if on-triangulation builder is disabled, default on-plane builder will compute isolines for the object given.
") IsoOnTriangulation;
		void IsoOnTriangulation(const bool theToSwitchOn);

		/****** AIS_InteractiveContext::IsoOnTriangulation ******/
		/****** md5 signature: 6e249f26b384cfb03474a3f50adc52c5 ******/
		%feature("compactdefaultargs") IsoOnTriangulation;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if drawing isolines on triangulation algorithm is enabled.
") IsoOnTriangulation;
		bool IsoOnTriangulation();

		/****** AIS_InteractiveContext::LastActiveView ******/
		/****** md5 signature: 917b175d2fccb1c48372a3e9d347f6f4 ******/
		%feature("compactdefaultargs") LastActiveView;
		%feature("autodoc", "Return
-------
opencascade::handle<V3d_View>

Description
-----------
Returns last active View (argument of MoveTo()/Select() methods).
") LastActiveView;
		opencascade::handle<V3d_View> LastActiveView();

		/****** AIS_InteractiveContext::Load ******/
		/****** md5 signature: c7928c879d6a52595b54119abcac0b04 ******/
		%feature("compactdefaultargs") Load;
		%feature("autodoc", "
Parameters
----------
theObj: AIS_InteractiveObject
theSelectionMode: int (optional, default to -1)

Return
-------
None

Description
-----------
Allows you to load the Interactive Object with a given selection mode, and/or with the desired decomposition option, whether the object is visualized or not. The loaded objects will be selectable but displayable in highlighting only when detected by the Selector.
") Load;
		void Load(const opencascade::handle<AIS_InteractiveObject> & theObj, const int theSelectionMode = -1);

		/****** AIS_InteractiveContext::Load ******/
		/****** md5 signature: 59911c98d30cf2f869da7c1977b5de8d ******/
		%feature("compactdefaultargs") Load;
		%feature("autodoc", "
Parameters
----------
theObj: AIS_InteractiveObject
theSelectionMode: int
: bool

Return
-------
None

Description
-----------
No available documentation.
") Load;
		void Load(const opencascade::handle<AIS_InteractiveObject> & theObj, int theSelectionMode, bool );

		/****** AIS_InteractiveContext::Location ******/
		/****** md5 signature: e6bd8403c84dda3a7567f9c4cf6245fd ******/
		%feature("compactdefaultargs") Location;
		%feature("autodoc", "
Parameters
----------
theObject: AIS_InteractiveObject

Return
-------
TopLoc_Location

Description
-----------
Returns the location of the Object.
") Location;
		TopLoc_Location Location(const opencascade::handle<AIS_InteractiveObject> & theObject);

		/****** AIS_InteractiveContext::MainPrsMgr ******/
		/****** md5 signature: bdc4498bf12a71cbbfdc608a2521c7ca ******/
		%feature("compactdefaultargs") MainPrsMgr;
		%feature("autodoc", "Return
-------
opencascade::handle<PrsMgr_PresentationManager>

Description
-----------
No available documentation.
") MainPrsMgr;
		const opencascade::handle<PrsMgr_PresentationManager> & MainPrsMgr();

		/****** AIS_InteractiveContext::MainSelector ******/
		/****** md5 signature: 324583e97a6b1f0d3b2bbf32bc96a6ef ******/
		%feature("compactdefaultargs") MainSelector;
		%feature("autodoc", "Return
-------
opencascade::handle<StdSelect_ViewerSelector3d>

Description
-----------
No available documentation.
") MainSelector;
		const opencascade::handle<StdSelect_ViewerSelector3d> & MainSelector();

		/****** AIS_InteractiveContext::MoreCurrent ******/
		/****** md5 signature: f4c05752ee1f881a0563333923b591ba ******/
		%feature("compactdefaultargs") MoreCurrent;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") MoreCurrent;
		bool MoreCurrent();

		/****** AIS_InteractiveContext::MoreDetected ******/
		/****** md5 signature: 5e6db8b522d038e999d1eefa01246129 ******/
		%feature("compactdefaultargs") MoreDetected;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Return True if there is more mouse-detected objects after the current one during iteration through mouse-detected interactive objects. 
See also: DetectedCurrentOwner(), InitDetected(), NextDetected().
") MoreDetected;
		bool MoreDetected();

		/****** AIS_InteractiveContext::MoreSelected ******/
		/****** md5 signature: 5109223e58ff9af171355f5b017aa40d ******/
		%feature("compactdefaultargs") MoreSelected;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if there is another object found by the scan of the list of selected objects. 
See also: SelectedOwner(), InitSelected(), NextSelected().
") MoreSelected;
		bool MoreSelected();

		/****** AIS_InteractiveContext::MoveTo ******/
		/****** md5 signature: 9baaedbf32ddf32b401c3865f7ed2f89 ******/
		%feature("compactdefaultargs") MoveTo;
		%feature("autodoc", "
Parameters
----------
theXPix: int
theYPix: int
theView: V3d_View
theToRedrawOnUpdate: bool

Return
-------
AIS_StatusOfDetection

Description
-----------
Relays mouse position in pixels theXPix and theYPix to the interactive context selectors. This is done by the view theView passing this position to the main viewer and updating it. If theToRedrawOnUpdate is set to false, callee should call RedrawImmediate() to highlight detected object. 
See also: PickingStrategy() 
See also: HighlightStyle() defining default dynamic highlight styles of detected owners  (Prs3d_TypeOfHighlight_Dynamic and Prs3d_TypeOfHighlight_LocalDynamic) 
See also: PrsMgr_PresentableObject::DynamicHilightAttributes() defining per-object dynamic highlight style of detected owners (overrides defaults).
") MoveTo;
		AIS_StatusOfDetection MoveTo(const int theXPix, const int theYPix, const opencascade::handle<V3d_View> & theView, const bool theToRedrawOnUpdate);

		/****** AIS_InteractiveContext::MoveTo ******/
		/****** md5 signature: bef15627a3a153d035d775317ae09de2 ******/
		%feature("compactdefaultargs") MoveTo;
		%feature("autodoc", "
Parameters
----------
theAxis: gp_Ax1
theView: V3d_View
theToRedrawOnUpdate: bool

Return
-------
AIS_StatusOfDetection

Description
-----------
Relays axis theAxis to the interactive context selectors. This is done by the view theView passing this axis to the main viewer and updating it. If theToRedrawOnUpdate is set to false, callee should call RedrawImmediate() to highlight detected object. 
See also: PickingStrategy().
") MoveTo;
		AIS_StatusOfDetection MoveTo(const gp_Ax1 & theAxis, const opencascade::handle<V3d_View> & theView, const bool theToRedrawOnUpdate);

		/****** AIS_InteractiveContext::NbCurrents ******/
		/****** md5 signature: 5ddafa491c5ac9dbeba3db16402869f3 ******/
		%feature("compactdefaultargs") NbCurrents;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbCurrents;
		int NbCurrents();

		/****** AIS_InteractiveContext::NbSelected ******/
		/****** md5 signature: adce6048698bd1cac8f8c07ce1e7f1a4 ******/
		%feature("compactdefaultargs") NbSelected;
		%feature("autodoc", "Return
-------
int

Description
-----------
Count a number of selected entities using InitSelected()+MoreSelected()+NextSelected() iterator. 
See also: SelectedOwner(), InitSelected(), MoreSelected(), NextSelected().
") NbSelected;
		int NbSelected();

		/****** AIS_InteractiveContext::NextCurrent ******/
		/****** md5 signature: d0fa06bf08aae72d9d2f78c98b20d4f9 ******/
		%feature("compactdefaultargs") NextCurrent;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") NextCurrent;
		void NextCurrent();

		/****** AIS_InteractiveContext::NextDetected ******/
		/****** md5 signature: 80e9abbe7c307e899704c0aa75085271 ******/
		%feature("compactdefaultargs") NextDetected;
		%feature("autodoc", "Return
-------
None

Description
-----------
Gets next current object during iteration through mouse-detected interactive objects. 
See also: DetectedCurrentOwner(), InitDetected(), MoreDetected().
") NextDetected;
		void NextDetected();

		/****** AIS_InteractiveContext::NextSelected ******/
		/****** md5 signature: b0ac689aff47b7f0c7ffd7973ff9538f ******/
		%feature("compactdefaultargs") NextSelected;
		%feature("autodoc", "Return
-------
None

Description
-----------
Continues the scan to the next object in the list of selected objects. 
See also: SelectedOwner(), InitSelected(), MoreSelected().
") NextSelected;
		void NextSelected();

		/****** AIS_InteractiveContext::ObjectIterator ******/
		/****** md5 signature: 53bc60a8d2140ec37a63dad988b0e15e ******/
		%feature("compactdefaultargs") ObjectIterator;
		%feature("autodoc", "Return
-------
NCollection_DataMap<opencascade::handle<AIS_InteractiveObject>, opencascade::handle<AIS_GlobalStatus>>::Iterator

Description
-----------
Create iterator through all objects registered in context.
") ObjectIterator;
		NCollection_DataMap<opencascade::handle<AIS_InteractiveObject>, opencascade::handle<AIS_GlobalStatus>>::Iterator ObjectIterator();

		/****** AIS_InteractiveContext::ObjectsByDisplayStatus ******/
		/****** md5 signature: 9158ed3a7ebf570223971c2bff9c1a19 ******/
		%feature("compactdefaultargs") ObjectsByDisplayStatus;
		%feature("autodoc", "
Parameters
----------
theStatus: PrsMgr_DisplayStatus
theListOfIO: AIS_InteractiveObject

Return
-------
None

Description
-----------
Returns the list theListOfIO of objects with indicated display status particular Type WhichKind and Signature WhichSignature. By Default, WhichSignature equals 1. This means that there is a check on type only.
") ObjectsByDisplayStatus;
		void ObjectsByDisplayStatus(const PrsMgr_DisplayStatus theStatus, NCollection_List<opencascade::handle<AIS_InteractiveObject>> & theListOfIO);

		/****** AIS_InteractiveContext::ObjectsByDisplayStatus ******/
		/****** md5 signature: fab48c225f39eaf4c6f0ff333ff57ad5 ******/
		%feature("compactdefaultargs") ObjectsByDisplayStatus;
		%feature("autodoc", "
Parameters
----------
WhichKind: AIS_KindOfInteractive
WhichSignature: int
theStatus: PrsMgr_DisplayStatus
theListOfIO: AIS_InteractiveObject

Return
-------
None

Description
-----------
gives the list of objects with indicated display status Type and signature by Default, <WhichSignature> = -1 means control only on <WhichKind>.
") ObjectsByDisplayStatus;
		void ObjectsByDisplayStatus(const AIS_KindOfInteractive WhichKind, const int WhichSignature, const PrsMgr_DisplayStatus theStatus, NCollection_List<opencascade::handle<AIS_InteractiveObject>> & theListOfIO);

		/****** AIS_InteractiveContext::ObjectsForView ******/
		/****** md5 signature: c2f1594f93d738ecabf7a8e145a41a7f ******/
		%feature("compactdefaultargs") ObjectsForView;
		%feature("autodoc", "
Parameters
----------
theListOfIO: AIS_InteractiveObject
theView: V3d_View
theIsVisibleInView: bool
theStatus: PrsMgr_DisplayStatus (optional, default to PrsMgr_DisplayStatus_None)

Return
-------
None

Description
-----------
Query objects visible or hidden in specified view due to affinity mask.
") ObjectsForView;
		void ObjectsForView(NCollection_List<opencascade::handle<AIS_InteractiveObject>> & theListOfIO, const opencascade::handle<V3d_View> & theView, const bool theIsVisibleInView, const PrsMgr_DisplayStatus theStatus = PrsMgr_DisplayStatus_None);

		/****** AIS_InteractiveContext::ObjectsInside ******/
		/****** md5 signature: 27dce5875be7a9f6ece73085559febe9 ******/
		%feature("compactdefaultargs") ObjectsInside;
		%feature("autodoc", "
Parameters
----------
aListOfIO: AIS_InteractiveObject
WhichKind: AIS_KindOfInteractive (optional, default to AIS_KindOfInteractive_None)
WhichSignature: int (optional, default to -1)

Return
-------
None

Description
-----------
fills <aListOfIO> with objects of a particular Type and Signature with no consideration of display status. by Default, <WhichSignature> = -1 means control only on <WhichKind>. if <WhichKind> = AIS_KindOfInteractive_None and <WhichSignature> = -1, all the objects are put into the list.
") ObjectsInside;
		void ObjectsInside(NCollection_List<opencascade::handle<AIS_InteractiveObject>> & aListOfIO, const AIS_KindOfInteractive WhichKind = AIS_KindOfInteractive_None, const int WhichSignature = -1);

		/****** AIS_InteractiveContext::PickingStrategy ******/
		/****** md5 signature: 7ec32744d1635811c168c2b831c6636a ******/
		%feature("compactdefaultargs") PickingStrategy;
		%feature("autodoc", "Return
-------
SelectMgr_PickingStrategy

Description
-----------
Return picking strategy; SelectMgr_PickingStrategy_FirstAcceptable by default. 
See also: MoveTo(), Filters().
") PickingStrategy;
		SelectMgr_PickingStrategy PickingStrategy();

		/****** AIS_InteractiveContext::PixelTolerance ******/
		/****** md5 signature: 7d40699f6c5245d6536c82f00a2f8f06 ******/
		%feature("compactdefaultargs") PixelTolerance;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the pixel tolerance, default is 2. Pixel Tolerance extends sensitivity within MoveTo() operation (picking by point) and can be adjusted by application based on user input precision (e.g. screen pixel density, input device precision, etc.).
") PixelTolerance;
		int PixelTolerance();

		/****** AIS_InteractiveContext::PlaneSize ******/
		/****** md5 signature: f42b10ed8ba872c4ce9b5c43aacabc8b ******/
		%feature("compactdefaultargs") PlaneSize;
		%feature("autodoc", "
Parameters
----------

Return
-------
XSize: double
YSize: double

Description
-----------
Returns true if the length in the X direction XSize is the same as that in the Y direction YSize.
") PlaneSize;
		bool PlaneSize(Standard_Real &OutValue, Standard_Real &OutValue);

		/****** AIS_InteractiveContext::PolygonOffsets ******/
		/****** md5 signature: 1af2e0f6eb6d950f6c2eff6fa2f07bc6 ******/
		%feature("compactdefaultargs") PolygonOffsets;
		%feature("autodoc", "
Parameters
----------
anObj: AIS_InteractiveObject

Return
-------
aMode: int
aFactor: float
aUnits: float

Description
-----------
Retrieves current polygon offsets settings for Object.
") PolygonOffsets;
		void PolygonOffsets(const opencascade::handle<AIS_InteractiveObject> & anObj, Standard_Integer &OutValue, Standard_ShortReal &OutValue, Standard_ShortReal &OutValue);

		/****** AIS_InteractiveContext::RebuildSelectionStructs ******/
		/****** md5 signature: fc018c2ec4a8be467c479b724e4da811 ******/
		%feature("compactdefaultargs") RebuildSelectionStructs;
		%feature("autodoc", "Return
-------
None

Description
-----------
Rebuilds 1st level of BVH selection forcibly.
") RebuildSelectionStructs;
		void RebuildSelectionStructs();

		/****** AIS_InteractiveContext::RecomputePrsOnly ******/
		/****** md5 signature: 06ee3944262ee2216d4a1b4f14074d7f ******/
		%feature("compactdefaultargs") RecomputePrsOnly;
		%feature("autodoc", "
Parameters
----------
theIObj: AIS_InteractiveObject
theToUpdateViewer: bool
theAllModes: bool (optional, default to false)

Return
-------
None

Description
-----------
Recomputes the displayed presentations, flags the others. Doesn't update presentations.
") RecomputePrsOnly;
		void RecomputePrsOnly(const opencascade::handle<AIS_InteractiveObject> & theIObj, const bool theToUpdateViewer, const bool theAllModes = false);

		/****** AIS_InteractiveContext::RecomputeSelectionOnly ******/
		/****** md5 signature: e3225619e43fcc63cdd183d03946a41e ******/
		%feature("compactdefaultargs") RecomputeSelectionOnly;
		%feature("autodoc", "
Parameters
----------
anIObj: AIS_InteractiveObject

Return
-------
None

Description
-----------
Recomputes the active selections, flags the others. Doesn't update presentations.
") RecomputeSelectionOnly;
		void RecomputeSelectionOnly(const opencascade::handle<AIS_InteractiveObject> & anIObj);

		/****** AIS_InteractiveContext::Redisplay ******/
		/****** md5 signature: 60cb3c83549ef35fe2ae8171c7f34e43 ******/
		%feature("compactdefaultargs") Redisplay;
		%feature("autodoc", "
Parameters
----------
theIObj: AIS_InteractiveObject
theToUpdateViewer: bool
theAllModes: bool (optional, default to false)

Return
-------
None

Description
-----------
Recomputes the seen parts presentation of the Object. If theAllModes equals true, all presentations are present in the object even if unseen.
") Redisplay;
		void Redisplay(const opencascade::handle<AIS_InteractiveObject> & theIObj, const bool theToUpdateViewer, const bool theAllModes = false);

		/****** AIS_InteractiveContext::Redisplay ******/
		/****** md5 signature: f6911241b90d817069173774f05251bc ******/
		%feature("compactdefaultargs") Redisplay;
		%feature("autodoc", "
Parameters
----------
theTypeOfObject: AIS_KindOfInteractive
theSignature: int
theToUpdateViewer: bool

Return
-------
None

Description
-----------
Recomputes the Prs/Selection of displayed objects of a given type and a given signature. if signature = -1 doesn't take signature criterion.
") Redisplay;
		void Redisplay(const AIS_KindOfInteractive theTypeOfObject, const int theSignature, const bool theToUpdateViewer);

		/****** AIS_InteractiveContext::RedrawImmediate ******/
		/****** md5 signature: 9829a5f87a4517fdc1d9d8e6cd654438 ******/
		%feature("compactdefaultargs") RedrawImmediate;
		%feature("autodoc", "
Parameters
----------
theViewer: V3d_Viewer

Return
-------
None

Description
-----------
Redraws immediate structures in all views of the viewer given taking into account its visibility.
") RedrawImmediate;
		void RedrawImmediate(const opencascade::handle<V3d_Viewer> & theViewer);

		/****** AIS_InteractiveContext::Remove ******/
		/****** md5 signature: a9b11c879ce50f225fc7d590428e3eda ******/
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "
Parameters
----------
theIObj: AIS_InteractiveObject
theToUpdateViewer: bool

Return
-------
None

Description
-----------
Removes Object from every viewer.
") Remove;
		void Remove(const opencascade::handle<AIS_InteractiveObject> & theIObj, const bool theToUpdateViewer);

		/****** AIS_InteractiveContext::RemoveAll ******/
		/****** md5 signature: 7e6f35fa60faff366feafba672980e16 ******/
		%feature("compactdefaultargs") RemoveAll;
		%feature("autodoc", "
Parameters
----------
theToUpdateViewer: bool

Return
-------
None

Description
-----------
Removes all the objects from Context.
") RemoveAll;
		void RemoveAll(const bool theToUpdateViewer);

		/****** AIS_InteractiveContext::RemoveFilter ******/
		/****** md5 signature: 694a9fa10d2e0617b4c8daffb2ec97d7 ******/
		%feature("compactdefaultargs") RemoveFilter;
		%feature("autodoc", "
Parameters
----------
theFilter: SelectMgr_Filter

Return
-------
None

Description
-----------
Removes a filter from context.
") RemoveFilter;
		void RemoveFilter(const opencascade::handle<SelectMgr_Filter> & theFilter);

		/****** AIS_InteractiveContext::RemoveFilters ******/
		/****** md5 signature: 76b1dac56b76ef3b70fd79415970d062 ******/
		%feature("compactdefaultargs") RemoveFilters;
		%feature("autodoc", "Return
-------
None

Description
-----------
Remove all filters from context.
") RemoveFilters;
		void RemoveFilters();

		/****** AIS_InteractiveContext::ResetLocation ******/
		/****** md5 signature: 80b2588af111ed65716dd5f1f6899724 ******/
		%feature("compactdefaultargs") ResetLocation;
		%feature("autodoc", "
Parameters
----------
theObject: AIS_InteractiveObject

Return
-------
None

Description
-----------
Puts the Object back into its initial position.
") ResetLocation;
		void ResetLocation(const opencascade::handle<AIS_InteractiveObject> & theObject);

		/****** AIS_InteractiveContext::Select ******/
		/****** md5 signature: 3a9c8e4bc596d82080d1e9d78f5a09ef ******/
		%feature("compactdefaultargs") Select;
		%feature("autodoc", "
Parameters
----------
theOwners: SelectMgr_EntityOwner
theSelScheme: AIS_SelectionScheme

Return
-------
AIS_StatusOfPick

Description
-----------
Sets list of owner selected/deselected using specified selection scheme. 
Parameter theOwners owners to change selection state 
Parameter theSelScheme selection scheme 
Return: picking status.
") Select;
		AIS_StatusOfPick Select(const NCollection_Array1<opencascade::handle<SelectMgr_EntityOwner>> & theOwners, const AIS_SelectionScheme theSelScheme);

		/****** AIS_InteractiveContext::Select ******/
		/****** md5 signature: 74d5695ed8c4aa8965184e0aa133851e ******/
		%feature("compactdefaultargs") Select;
		%feature("autodoc", "
Parameters
----------
theXPMin: int
theYPMin: int
theXPMax: int
theYPMax: int
theView: V3d_View
theToUpdateViewer: bool

Return
-------
AIS_StatusOfPick

Description
-----------
No available documentation.
") Select;
		AIS_StatusOfPick Select(const int theXPMin, const int theYPMin, const int theXPMax, const int theYPMax, const opencascade::handle<V3d_View> & theView, const bool theToUpdateViewer);

		/****** AIS_InteractiveContext::Select ******/
		/****** md5 signature: 1682532c23fc0197d1f9bd30726e3ca2 ******/
		%feature("compactdefaultargs") Select;
		%feature("autodoc", "
Parameters
----------
thePolyline: TColgp_Array1OfPnt2d
theView: V3d_View
theToUpdateViewer: bool

Return
-------
AIS_StatusOfPick

Description
-----------
No available documentation.
") Select;
		AIS_StatusOfPick Select(const TColgp_Array1OfPnt2d & thePolyline, const opencascade::handle<V3d_View> & theView, const bool theToUpdateViewer);

		/****** AIS_InteractiveContext::Select ******/
		/****** md5 signature: bc58a90f1be3bd472e49d5d50df8539f ******/
		%feature("compactdefaultargs") Select;
		%feature("autodoc", "
Parameters
----------
theToUpdateViewer: bool

Return
-------
AIS_StatusOfPick

Description
-----------
No available documentation.
") Select;
		AIS_StatusOfPick Select(const bool theToUpdateViewer);

		/****** AIS_InteractiveContext::SelectDetected ******/
		/****** md5 signature: 89506ff221e1c7c4fc54b977e288b0b8 ******/
		%feature("compactdefaultargs") SelectDetected;
		%feature("autodoc", "
Parameters
----------
theSelScheme: AIS_SelectionScheme (optional, default to AIS_SelectionScheme_Replace)

Return
-------
AIS_StatusOfPick

Description
-----------
Select and hilights the previous detected via AIS_InteractiveContext::MoveTo() method; unhilights the previous picked. Viewer should be explicitly redrawn after selection. 
Input parameter: theSelScheme selection scheme 
Return: picking status //! 
See also: HighlightStyle() defining default highlight styles of selected owners (Prs3d_TypeOfHighlight_Selected and Prs3d_TypeOfHighlight_LocalSelected) 
See also: PrsMgr_PresentableObject::HilightAttributes() defining per-object highlight style of selected owners (overrides defaults) For all selection schemes, allowing to select an object, HandleMouseClick is available.
") SelectDetected;
		AIS_StatusOfPick SelectDetected(const AIS_SelectionScheme theSelScheme = AIS_SelectionScheme_Replace);

		/****** AIS_InteractiveContext::SelectPoint ******/
		/****** md5 signature: f21e67dc3ac5e73fe8cc64ace8e12d36 ******/
		%feature("compactdefaultargs") SelectPoint;
		%feature("autodoc", "
Parameters
----------
thePnt: NCollection_Vec2<int>
theView: V3d_View
theSelScheme: AIS_SelectionScheme (optional, default to AIS_SelectionScheme_Replace)

Return
-------
AIS_StatusOfPick

Description
-----------
Selects the topmost object picked by the point in the view, Viewer should be explicitly redrawn after selection. 
Input parameter: thePnt point pixel coordinates within the view 
Input parameter: theView active view where point is defined 
Input parameter: theSelScheme selection scheme 
Return: picking status.
") SelectPoint;
		AIS_StatusOfPick SelectPoint(const NCollection_Vec2<int> & thePnt, const opencascade::handle<V3d_View> & theView, const AIS_SelectionScheme theSelScheme = AIS_SelectionScheme_Replace);

		/****** AIS_InteractiveContext::SelectPolygon ******/
		/****** md5 signature: e9573ec59f6cf582bcbf109c16f1a61e ******/
		%feature("compactdefaultargs") SelectPolygon;
		%feature("autodoc", "
Parameters
----------
thePolyline: TColgp_Array1OfPnt2d
theView: V3d_View
theSelScheme: AIS_SelectionScheme (optional, default to AIS_SelectionScheme_Replace)

Return
-------
AIS_StatusOfPick

Description
-----------
Select everything found in the polygon defined by bounding polyline. Viewer should be explicitly redrawn after selection. 
Input parameter: thePolyline polyline defining polygon bounds (in pixels) 
Input parameter: theView active view where polyline is defined 
Input parameter: theSelScheme selection scheme 
Return: picking status.
") SelectPolygon;
		AIS_StatusOfPick SelectPolygon(const TColgp_Array1OfPnt2d & thePolyline, const opencascade::handle<V3d_View> & theView, const AIS_SelectionScheme theSelScheme = AIS_SelectionScheme_Replace);

		/****** AIS_InteractiveContext::SelectRectangle ******/
		/****** md5 signature: 19fd20cc256b5225ccea8899939ad1f2 ******/
		%feature("compactdefaultargs") SelectRectangle;
		%feature("autodoc", "
Parameters
----------
thePntMin: NCollection_Vec2<int>
thePntMax: NCollection_Vec2<int>
theView: V3d_View
theSelScheme: AIS_SelectionScheme (optional, default to AIS_SelectionScheme_Replace)

Return
-------
AIS_StatusOfPick

Description
-----------
Selects objects within the bounding rectangle. Viewer should be explicitly redrawn after selection. 
Input parameter: thePntMin rectangle lower point (in pixels) 
Input parameter: thePntMax rectangle upper point (in pixels) 
Input parameter: theView active view where rectangle is defined 
Input parameter: theSelScheme selection scheme 
Return: picking status 
See also: StdSelect_ViewerSelector3d::AllowOverlapDetection().
") SelectRectangle;
		AIS_StatusOfPick SelectRectangle(const NCollection_Vec2<int> & thePntMin, const NCollection_Vec2<int> & thePntMax, const opencascade::handle<V3d_View> & theView, const AIS_SelectionScheme theSelScheme = AIS_SelectionScheme_Replace);

		/****** AIS_InteractiveContext::SelectedInteractive ******/
		/****** md5 signature: b6273836cee8954a2faee535a7126f4e ******/
		%feature("compactdefaultargs") SelectedInteractive;
		%feature("autodoc", "Return
-------
opencascade::handle<AIS_InteractiveObject>

Description
-----------
Return opencascade::handle<AIS_InteractiveObject>::DownCast (SelectedOwner()->Selectable()). 
See also: SelectedOwner().
") SelectedInteractive;
		opencascade::handle<AIS_InteractiveObject> SelectedInteractive();

		/****** AIS_InteractiveContext::SelectedOwner ******/
		/****** md5 signature: 4f367f2cac81145c8b4f46a462bff157 ******/
		%feature("compactdefaultargs") SelectedOwner;
		%feature("autodoc", "Return
-------
opencascade::handle<SelectMgr_EntityOwner>

Description
-----------
Returns the owner of the selected entity. 
See also: InitSelected(), MoreSelected(), NextSelected().
") SelectedOwner;
		opencascade::handle<SelectMgr_EntityOwner> SelectedOwner();

		/****** AIS_InteractiveContext::SelectedShape ******/
		/****** md5 signature: 721d3a216ce98c9b5e5e9d1b15f143f5 ******/
		%feature("compactdefaultargs") SelectedShape;
		%feature("autodoc", "Return
-------
TopoDS_Shape

Description
-----------
Returns the selected shape. Basically it is just a shape returned stored by StdSelect_BRepOwner with graphic transformation being applied: @code const opencascade::handle<StdSelect_BRepOwner> aBRepOwner = opencascade::handle<StdSelect_BRepOwner>::DownCast (SelectedOwner()); TopoDS_Shape aSelShape = aBRepOwner->Shape(); TopoDS_Shape aLocatedShape = aSelShape.Located (aBRepOwner->Location() * aSelShape.Location()); @endcode 
See also: SelectedOwner(), HasSelectedShape().
") SelectedShape;
		TopoDS_Shape SelectedShape();

		/****** AIS_InteractiveContext::Selection ******/
		/****** md5 signature: 0522c4713b6259bb252f2580882a049c ******/
		%feature("compactdefaultargs") Selection;
		%feature("autodoc", "Return
-------
opencascade::handle<AIS_Selection>

Description
-----------
Returns selection instance.
") Selection;
		const opencascade::handle<AIS_Selection> & Selection();

		/****** AIS_InteractiveContext::SelectionManager ******/
		/****** md5 signature: 9e4dab209ad46b3c197dda1ed7898179 ******/
		%feature("compactdefaultargs") SelectionManager;
		%feature("autodoc", "Return
-------
opencascade::handle<SelectMgr_SelectionManager>

Description
-----------
No available documentation.
") SelectionManager;
		const opencascade::handle<SelectMgr_SelectionManager> & SelectionManager();

		/****** AIS_InteractiveContext::SelectionStyle ******/
		/****** md5 signature: 3c3ddd0e1d466df6b150cfb790baa61a ******/
		%feature("compactdefaultargs") SelectionStyle;
		%feature("autodoc", "Return
-------
opencascade::handle<Prs3d_Drawer>

Description
-----------
Returns current selection style settings corresponding to Prs3d_TypeOfHighlight_Selected. This is just a short-cut to HighlightStyle(Prs3d_TypeOfHighlight_Selected).
") SelectionStyle;
		const opencascade::handle<Prs3d_Drawer> & SelectionStyle();

		/****** AIS_InteractiveContext::SetAngleAndDeviation ******/
		/****** md5 signature: 4ae83b0430929470fa4af61022bbf4e6 ******/
		%feature("compactdefaultargs") SetAngleAndDeviation;
		%feature("autodoc", "
Parameters
----------
theIObj: AIS_InteractiveObject
theAngle: double
theToUpdateViewer: bool

Return
-------
None

Description
-----------
Calls the AIS_Shape SetAngleAndDeviation to set both Angle and Deviation coefficients.
") SetAngleAndDeviation;
		void SetAngleAndDeviation(const opencascade::handle<AIS_InteractiveObject> & theIObj, const double theAngle, const bool theToUpdateViewer);

		/****** AIS_InteractiveContext::SetAutoActivateSelection ******/
		/****** md5 signature: bf4232372a17ee45d9506a297e04a8f2 ******/
		%feature("compactdefaultargs") SetAutoActivateSelection;
		%feature("autodoc", "
Parameters
----------
theIsAuto: bool

Return
-------
None

Description
-----------
Enable or disable automatic activation of default selection mode while displaying the object.
") SetAutoActivateSelection;
		void SetAutoActivateSelection(const bool theIsAuto);

		/****** AIS_InteractiveContext::SetAutomaticHilight ******/
		/****** md5 signature: 1836789370e6a3de49a51561227028fa ******/
		%feature("compactdefaultargs") SetAutomaticHilight;
		%feature("autodoc", "
Parameters
----------
theStatus: bool

Return
-------
None

Description
-----------
Sets the highlighting status of detected and selected entities. This function allows you to disconnect the automatic mode. //! MoveTo() will fill the list of detected entities and Select() will set selected state to detected objects regardless of this flag, but with disabled AutomaticHiligh() their highlighting state will be left unaffected, so that application will be able performing custom highlighting in a different way, if needed. //! This API should be distinguished from SelectMgr_SelectableObject::SetAutoHilight() that is used to implement custom highlighting logic for a specific interactive object class. //! 
See also: MoveTo(), Select(), HilightWithColor(), Unhilight().
") SetAutomaticHilight;
		void SetAutomaticHilight(bool theStatus);

		/****** AIS_InteractiveContext::SetColor ******/
		/****** md5 signature: af5c29332e7eebf72aea74aab0cb0ca5 ******/
		%feature("compactdefaultargs") SetColor;
		%feature("autodoc", "
Parameters
----------
theIObj: AIS_InteractiveObject
theColor: Quantity_Color
theToUpdateViewer: bool

Return
-------
None

Description
-----------
Sets the color of the selected entity.
") SetColor;
		void SetColor(const opencascade::handle<AIS_InteractiveObject> & theIObj, const Quantity_Color & theColor, const bool theToUpdateViewer);

		/****** AIS_InteractiveContext::SetCurrentFacingModel ******/
		/****** md5 signature: 6e9ce30ba43f9290ff6c58e79a404edc ******/
		%feature("compactdefaultargs") SetCurrentFacingModel;
		%feature("autodoc", "
Parameters
----------
aniobj: AIS_InteractiveObject
aModel: Aspect_TypeOfFacingModel (optional, default to Aspect_TOFM_BOTH_SIDE)

Return
-------
None

Description
-----------
change the current facing model apply on polygons for SetColor(), SetTransparency(), SetMaterial() methods default facing model is Aspect_TOFM_TWO_SIDE. This mean that attributes is applying both on the front and back face.
") SetCurrentFacingModel;
		void SetCurrentFacingModel(const opencascade::handle<AIS_InteractiveObject> & aniobj, const Aspect_TypeOfFacingModel aModel = Aspect_TOFM_BOTH_SIDE);

		/****** AIS_InteractiveContext::SetCurrentObject ******/
		/****** md5 signature: 1c54ad43ee85aaab3812a22ee79a2107 ******/
		%feature("compactdefaultargs") SetCurrentObject;
		%feature("autodoc", "
Parameters
----------
theIObj: AIS_InteractiveObject
theToUpdateViewer: bool

Return
-------
None

Description
-----------
No available documentation.
") SetCurrentObject;
		void SetCurrentObject(const opencascade::handle<AIS_InteractiveObject> & theIObj, const bool theToUpdateViewer);

		/****** AIS_InteractiveContext::SetDefaultDrawer ******/
		/****** md5 signature: fa88c8a7788e5b89033f7deefbc9be1c ******/
		%feature("compactdefaultargs") SetDefaultDrawer;
		%feature("autodoc", "
Parameters
----------
theDrawer: Prs3d_Drawer

Return
-------
None

Description
-----------
Sets the default attribute manager; should be set at context creation time. Warning - this setter doesn't update links to the default drawer of already displayed objects!.
") SetDefaultDrawer;
		void SetDefaultDrawer(const opencascade::handle<Prs3d_Drawer> & theDrawer);

		/****** AIS_InteractiveContext::SetDeviationAngle ******/
		/****** md5 signature: 759d6c58b9384b928e00a065b1d73953 ******/
		%feature("compactdefaultargs") SetDeviationAngle;
		%feature("autodoc", "
Parameters
----------
theIObj: AIS_InteractiveObject
theAngle: double
theToUpdateViewer: bool

Return
-------
None

Description
-----------
No available documentation.
") SetDeviationAngle;
		void SetDeviationAngle(const opencascade::handle<AIS_InteractiveObject> & theIObj, const double theAngle, const bool theToUpdateViewer);

		/****** AIS_InteractiveContext::SetDeviationAngle ******/
		/****** md5 signature: aa437fcc3de82c366be4b49f1a1ce0ec ******/
		%feature("compactdefaultargs") SetDeviationAngle;
		%feature("autodoc", "
Parameters
----------
theAngle: double

Return
-------
None

Description
-----------
default 20 degrees.
") SetDeviationAngle;
		void SetDeviationAngle(const double theAngle);

		/****** AIS_InteractiveContext::SetDeviationCoefficient ******/
		/****** md5 signature: 5f07ff6f6fa5324fc974103ca852bf46 ******/
		%feature("compactdefaultargs") SetDeviationCoefficient;
		%feature("autodoc", "
Parameters
----------
theIObj: AIS_InteractiveObject
theCoefficient: double
theToUpdateViewer: bool

Return
-------
None

Description
-----------
Sets the deviation coefficient theCoefficient. Drawings of curves or patches are made with respect to a maximal chordal deviation. A Deviation coefficient is used in the shading display mode. The shape is seen decomposed into triangles. These are used to calculate reflection of light from the surface of the object. The triangles are formed from chords of the curves in the shape. The deviation coefficient theCoefficient gives the highest value of the angle with which a chord can deviate from a tangent to a curve. If this limit is reached, a new triangle is begun. This deviation is absolute and is set through the method: SetMaximalChordialDeviation. The default value is 0.001. In drawing shapes, however, you are allowed to ask for a relative deviation. This deviation will be: SizeOfObject * DeviationCoefficient.
") SetDeviationCoefficient;
		void SetDeviationCoefficient(const opencascade::handle<AIS_InteractiveObject> & theIObj, const double theCoefficient, const bool theToUpdateViewer);

		/****** AIS_InteractiveContext::SetDeviationCoefficient ******/
		/****** md5 signature: 4d068b74269d0f8389a8164d51600e13 ******/
		%feature("compactdefaultargs") SetDeviationCoefficient;
		%feature("autodoc", "
Parameters
----------
theCoefficient: double

Return
-------
None

Description
-----------
Sets the deviation coefficient theCoefficient. Drawings of curves or patches are made with respect to a maximal chordal deviation. A Deviation coefficient is used in the shading display mode. The shape is seen decomposed into triangles. These are used to calculate reflection of light from the surface of the object. The triangles are formed from chords of the curves in the shape. The deviation coefficient theCoefficient gives the highest value of the angle with which a chord can deviate from a tangent to a curve. If this limit is reached, a new triangle is begun. This deviation is absolute and is set through the method: SetMaximalChordialDeviation. The default value is 0.001. In drawing shapes, however, you are allowed to ask for a relative deviation. This deviation will be: SizeOfObject * DeviationCoefficient.
") SetDeviationCoefficient;
		void SetDeviationCoefficient(const double theCoefficient);

		/****** AIS_InteractiveContext::SetDisplayMode ******/
		/****** md5 signature: 047199fbf01809d1f8c51d751d053708 ******/
		%feature("compactdefaultargs") SetDisplayMode;
		%feature("autodoc", "
Parameters
----------
theMode: int
theToUpdateViewer: bool

Return
-------
None

Description
-----------
Sets the display mode of seen Interactive Objects (which have no overridden Display Mode).
") SetDisplayMode;
		void SetDisplayMode(const int theMode, const bool theToUpdateViewer);

		/****** AIS_InteractiveContext::SetDisplayMode ******/
		/****** md5 signature: e12ca44c6366044df6d080457a715a83 ******/
		%feature("compactdefaultargs") SetDisplayMode;
		%feature("autodoc", "
Parameters
----------
theIObj: AIS_InteractiveObject
theMode: int
theToUpdateViewer: bool

Return
-------
None

Description
-----------
Sets the display mode of seen Interactive Objects. theMode provides the display mode index of the entity theIObj.
") SetDisplayMode;
		void SetDisplayMode(const opencascade::handle<AIS_InteractiveObject> & theIObj, const int theMode, const bool theToUpdateViewer);

		/****** AIS_InteractiveContext::SetDisplayPriority ******/
		/****** md5 signature: 42353ccb4c6eda1cc29153e74393c82b ******/
		%feature("compactdefaultargs") SetDisplayPriority;
		%feature("autodoc", "
Parameters
----------
theIObj: AIS_InteractiveObject
thePriority: Graphic3d_DisplayPriority

Return
-------
None

Description
-----------
Sets the display priority of the seen parts presentation of the Object.
") SetDisplayPriority;
		void SetDisplayPriority(const opencascade::handle<AIS_InteractiveObject> & theIObj, const Graphic3d_DisplayPriority thePriority);

		/****** AIS_InteractiveContext::SetDisplayPriority ******/
		/****** md5 signature: c3a63c099867494d3902c2b1eff6c7ff ******/
		%feature("compactdefaultargs") SetDisplayPriority;
		%feature("autodoc", "
Parameters
----------
theIObj: AIS_InteractiveObject
thePriority: int

Return
-------
None

Description
-----------
No available documentation.
") SetDisplayPriority;
		void SetDisplayPriority(const opencascade::handle<AIS_InteractiveObject> & theIObj, const int thePriority);

		/****** AIS_InteractiveContext::SetFilterType ******/
		/****** md5 signature: c4f32b4815b398cc3dcfa30b4c00ebdc ******/
		%feature("compactdefaultargs") SetFilterType;
		%feature("autodoc", "
Parameters
----------
theFilterType: SelectMgr_FilterType

Return
-------
None

Description
-----------
Sets the context selection filter type. SelectMgr_TypeFilter_OR selection filter is used by default. 
Parameter theFilterType the filter type.
") SetFilterType;
		void SetFilterType(const SelectMgr_FilterType theFilterType);

		/****** AIS_InteractiveContext::SetHiddenLineAspect ******/
		/****** md5 signature: 82e7745333ec21f019200e5221b9cdcf ******/
		%feature("compactdefaultargs") SetHiddenLineAspect;
		%feature("autodoc", "
Parameters
----------
theAspect: Prs3d_LineAspect

Return
-------
None

Description
-----------
Sets the hidden line aspect anAspect. Aspect defines display attributes for hidden lines in HLR projections.
") SetHiddenLineAspect;
		void SetHiddenLineAspect(const opencascade::handle<Prs3d_LineAspect> & theAspect);

		/****** AIS_InteractiveContext::SetHighlightStyle ******/
		/****** md5 signature: 514ba754efe6d3cdef1ca1443d525348 ******/
		%feature("compactdefaultargs") SetHighlightStyle;
		%feature("autodoc", "
Parameters
----------
theStyleType: Prs3d_TypeOfHighlight
theStyle: Prs3d_Drawer

Return
-------
None

Description
-----------
Setup highlight style settings. Tip: it is better modifying existing style returned by method HighlightStyle() instead of creating a new Prs3d_Drawer to avoid unexpected results due misconfiguration. //! If a new highlight style is created, its presentation Zlayer should be checked, otherwise highlighting might not work as expected.
") SetHighlightStyle;
		void SetHighlightStyle(const Prs3d_TypeOfHighlight theStyleType, const opencascade::handle<Prs3d_Drawer> & theStyle);

		/****** AIS_InteractiveContext::SetHighlightStyle ******/
		/****** md5 signature: 0f582d623d586c315d681407eef8bab2 ******/
		%feature("compactdefaultargs") SetHighlightStyle;
		%feature("autodoc", "
Parameters
----------
theStyle: Prs3d_Drawer

Return
-------
None

Description
-----------
Setup the style of dynamic highlighting corresponding to Prs3d_TypeOfHighlight_Selected. This is just a short-cut to SetHighlightStyle(Prs3d_TypeOfHighlight_Dynamic,theStyle).
") SetHighlightStyle;
		void SetHighlightStyle(const opencascade::handle<Prs3d_Drawer> & theStyle);

		/****** AIS_InteractiveContext::SetIsoNumber ******/
		/****** md5 signature: b119c34d50c03e0f0107b6d3601adf54 ******/
		%feature("compactdefaultargs") SetIsoNumber;
		%feature("autodoc", "
Parameters
----------
NbIsos: int
WhichIsos: AIS_TypeOfIso (optional, default to AIS_TOI_Both)

Return
-------
None

Description
-----------
Sets the number of U and V isoparameters displayed.
") SetIsoNumber;
		void SetIsoNumber(const int NbIsos, const AIS_TypeOfIso WhichIsos = AIS_TOI_Both);

		/****** AIS_InteractiveContext::SetLocalAttributes ******/
		/****** md5 signature: 10410427a5537fa9d09ea6635bb2961e ******/
		%feature("compactdefaultargs") SetLocalAttributes;
		%feature("autodoc", "
Parameters
----------
theIObj: AIS_InteractiveObject
theDrawer: Prs3d_Drawer
theToUpdateViewer: bool

Return
-------
None

Description
-----------
Sets the graphic attributes of the interactive object, such as visualization mode, color, and material.
") SetLocalAttributes;
		void SetLocalAttributes(const opencascade::handle<AIS_InteractiveObject> & theIObj, const opencascade::handle<Prs3d_Drawer> & theDrawer, const bool theToUpdateViewer);

		/****** AIS_InteractiveContext::SetLocation ******/
		/****** md5 signature: 278570b2ad71d01112ac61ba95d92f6f ******/
		%feature("compactdefaultargs") SetLocation;
		%feature("autodoc", "
Parameters
----------
theObject: AIS_InteractiveObject
theLocation: TopLoc_Location

Return
-------
None

Description
-----------
Puts the location on the initial graphic representation and the selection for the Object.
") SetLocation;
		void SetLocation(const opencascade::handle<AIS_InteractiveObject> & theObject, const TopLoc_Location & theLocation);

		/****** AIS_InteractiveContext::SetMaterial ******/
		/****** md5 signature: 466e6a06d3133eeb36f8ee564e117695 ******/
		%feature("compactdefaultargs") SetMaterial;
		%feature("autodoc", "
Parameters
----------
theIObj: AIS_InteractiveObject
theMaterial: Graphic3d_MaterialAspect
theToUpdateViewer: bool

Return
-------
None

Description
-----------
Provides the type of material setting for the view of the Object.
") SetMaterial;
		void SetMaterial(const opencascade::handle<AIS_InteractiveObject> & theIObj, const Graphic3d_MaterialAspect & theMaterial, const bool theToUpdateViewer);

		/****** AIS_InteractiveContext::SetPickingStrategy ******/
		/****** md5 signature: 7eb0b1033404a3318ec39d0b8f456b86 ******/
		%feature("compactdefaultargs") SetPickingStrategy;
		%feature("autodoc", "
Parameters
----------
theStrategy: SelectMgr_PickingStrategy

Return
-------
None

Description
-----------
Setup picking strategy - which entities detected by picking line will be accepted, considering Selection Filters. By default (SelectMgr_PickingStrategy_FirstAcceptable), Selection Filters reduce the list of entities so that the context accepts topmost in remaining. //! This means that entities behind non-selectable (by filters) parts can be picked by user. If this behavior is undesirable, and user wants that non-selectable (by filters) parts should remain an obstacle for picking, SelectMgr_PickingStrategy_OnlyTopmost can be set instead. //! Notice, that since Selection Manager operates only objects registered in it, SelectMgr_PickingStrategy_OnlyTopmost will NOT prevent picking entities behind visible by unregistered in Selection Manager presentations (e.g. deactivated). Hence, SelectMgr_PickingStrategy_OnlyTopmost changes behavior only with Selection Filters enabled.
") SetPickingStrategy;
		void SetPickingStrategy(const SelectMgr_PickingStrategy theStrategy);

		/****** AIS_InteractiveContext::SetPixelTolerance ******/
		/****** md5 signature: 3578b06cc12214e2ed8d080e411fafcd ******/
		%feature("compactdefaultargs") SetPixelTolerance;
		%feature("autodoc", "
Parameters
----------
thePrecision: int (optional, default to 2)

Return
-------
None

Description
-----------
Setup pixel tolerance for MoveTo() operation. 
See also: MoveTo().
") SetPixelTolerance;
		void SetPixelTolerance(const int thePrecision = 2);

		/****** AIS_InteractiveContext::SetPlaneSize ******/
		/****** md5 signature: 4ecba188293ad71962a2913ff443bc12 ******/
		%feature("compactdefaultargs") SetPlaneSize;
		%feature("autodoc", "
Parameters
----------
theSizeX: double
theSizeY: double
theToUpdateViewer: bool

Return
-------
None

Description
-----------
Sets the plane size defined by the length in the X direction XSize and that in the Y direction YSize.
") SetPlaneSize;
		void SetPlaneSize(const double theSizeX, const double theSizeY, const bool theToUpdateViewer);

		/****** AIS_InteractiveContext::SetPlaneSize ******/
		/****** md5 signature: 2b41f47696e293ae339d12fddae7515e ******/
		%feature("compactdefaultargs") SetPlaneSize;
		%feature("autodoc", "
Parameters
----------
theSize: double
theToUpdateViewer: bool

Return
-------
None

Description
-----------
Sets the plane size aSize.
") SetPlaneSize;
		void SetPlaneSize(const double theSize, const bool theToUpdateViewer);

		/****** AIS_InteractiveContext::SetPolygonOffsets ******/
		/****** md5 signature: 5904a2c30eea2541023c530b3335d98a ******/
		%feature("compactdefaultargs") SetPolygonOffsets;
		%feature("autodoc", "
Parameters
----------
theIObj: AIS_InteractiveObject
theMode: int
theFactor: float
theUnits: float
theToUpdateViewer: bool

Return
-------
None

Description
-----------
Sets up polygon offsets for the given AIS_InteractiveObject. It simply calls AIS_InteractiveObject::SetPolygonOffsets().
") SetPolygonOffsets;
		void SetPolygonOffsets(const opencascade::handle<AIS_InteractiveObject> & theIObj, const int theMode, const float theFactor, const float theUnits, const bool theToUpdateViewer);

		/****** AIS_InteractiveContext::SetSelected ******/
		/****** md5 signature: fa3715f154532ff2361e6869f30ee9b1 ******/
		%feature("compactdefaultargs") SetSelected;
		%feature("autodoc", "
Parameters
----------
theOwners: SelectMgr_EntityOwner
theToUpdateViewer: bool

Return
-------
None

Description
-----------
Unhighlights previously selected owners and marks them as not selected. Marks owner given as selected and highlights it. Performs selection filters check.
") SetSelected;
		void SetSelected(const opencascade::handle<SelectMgr_EntityOwner> & theOwners, const bool theToUpdateViewer);

		/****** AIS_InteractiveContext::SetSelected ******/
		/****** md5 signature: 3345a45c98c900549a89bc9bb5a20b89 ******/
		%feature("compactdefaultargs") SetSelected;
		%feature("autodoc", "
Parameters
----------
theObject: AIS_InteractiveObject
theToUpdateViewer: bool

Return
-------
None

Description
-----------
Puts the interactive object aniObj in the list of selected objects. Performs selection filters check.
") SetSelected;
		void SetSelected(const opencascade::handle<AIS_InteractiveObject> & theObject, const bool theToUpdateViewer);

		/****** AIS_InteractiveContext::SetSelectedAspect ******/
		/****** md5 signature: f60642bd3cb6cea4556fbb379239ad62 ******/
		%feature("compactdefaultargs") SetSelectedAspect;
		%feature("autodoc", "
Parameters
----------
theAspect: Prs3d_BasicAspect
theToUpdateViewer: bool

Return
-------
None

Description
-----------
No available documentation.
") SetSelectedAspect;
		void SetSelectedAspect(const opencascade::handle<Prs3d_BasicAspect> & theAspect, const bool theToUpdateViewer);

		/****** AIS_InteractiveContext::SetSelectedState ******/
		/****** md5 signature: 1c8c4afa1c4f338b998638a9ba6f2f90 ******/
		%feature("compactdefaultargs") SetSelectedState;
		%feature("autodoc", "
Parameters
----------
theOwner: SelectMgr_EntityOwner
theIsSelected: bool

Return
-------
bool

Description
-----------
Updates Selected state of specified owner without calling HilightSelected(). Has no effect if Selected state is not changed, and redirects to AddOrRemoveSelected() otherwise. 
Parameter theOwner owner object to set selected state 
Parameter theIsSelected new selected state 
Return: True if Selected state has been changed.
") SetSelectedState;
		bool SetSelectedState(const opencascade::handle<SelectMgr_EntityOwner> & theOwner, const bool theIsSelected);

		/****** AIS_InteractiveContext::SetSelection ******/
		/****** md5 signature: 5ff5220ba2200900a533a9612db4e0bd ******/
		%feature("compactdefaultargs") SetSelection;
		%feature("autodoc", "
Parameters
----------
theSelection: AIS_Selection

Return
-------
None

Description
-----------
Sets selection instance to manipulate a container of selected owners 
Parameter theSelection an instance of the selection.
") SetSelection;
		void SetSelection(const opencascade::handle<AIS_Selection> & theSelection);

		/****** AIS_InteractiveContext::SetSelectionModeActive ******/
		/****** md5 signature: 94e77a72524d2f1d609767812418af3d ******/
		%feature("compactdefaultargs") SetSelectionModeActive;
		%feature("autodoc", "
Parameters
----------
theObj: AIS_InteractiveObject
theMode: int
theToActivate: bool
theConcurrency: AIS_SelectionModesConcurrency (optional, default to AIS_SelectionModesConcurrency_Multiple)
theIsForce: bool (optional, default to false)

Return
-------
None

Description
-----------
Activates or deactivates the selection mode for specified object. Has no effect if selection mode was already active/deactivated. 
Parameter theObj object to activate/deactivate selection mode 
Parameter theMode selection mode to activate/deactivate;  deactivation of -1 selection mode will effectively deactivate all  selection modes; activation of -1 selection mode with  AIS_SelectionModesConcurrency_Single will deactivate all selection  modes, and will has no effect otherwise 
Parameter theToActivate activation/deactivation flag 
Parameter theConcurrency specifies how to handle already activated selection modes;  default value (AIS_SelectionModesConcurrency_Multiple) means active  selection modes should be left as is,  AIS_SelectionModesConcurrency_Single can be used if only one selection  mode is expected to be active and  AIS_SelectionModesConcurrency_GlobalOrLocal can be used if either  AIS_InteractiveObject::GlobalSelectionMode() or any combination of Local  selection modes is acceptable; this value is considered only if  theToActivate set to True 
Parameter theIsForce when set to True, the display status will be ignored while activating selection mode.
") SetSelectionModeActive;
		void SetSelectionModeActive(const opencascade::handle<AIS_InteractiveObject> & theObj, const int theMode, const bool theToActivate, const AIS_SelectionModesConcurrency theConcurrency = AIS_SelectionModesConcurrency_Multiple, const bool theIsForce = false);

		/****** AIS_InteractiveContext::SetSelectionSensitivity ******/
		/****** md5 signature: 32c7931e68c0eb8004077878ad25b22c ******/
		%feature("compactdefaultargs") SetSelectionSensitivity;
		%feature("autodoc", "
Parameters
----------
theObject: AIS_InteractiveObject
theMode: int
theNewSensitivity: int

Return
-------
None

Description
-----------
Allows to manage sensitivity of a particular selection of interactive object theObject and changes previous sensitivity value of all sensitive entities in selection with theMode to the given theNewSensitivity.
") SetSelectionSensitivity;
		void SetSelectionSensitivity(const opencascade::handle<AIS_InteractiveObject> & theObject, const int theMode, const int theNewSensitivity);

		/****** AIS_InteractiveContext::SetSelectionStyle ******/
		/****** md5 signature: 93a6cf42e8daf8b20f671afa0142b5ba ******/
		%feature("compactdefaultargs") SetSelectionStyle;
		%feature("autodoc", "
Parameters
----------
theStyle: Prs3d_Drawer

Return
-------
None

Description
-----------
Setup the style of selection highlighting. This is just a short-cut to SetHighlightStyle(Prs3d_TypeOfHighlight_Selected,theStyle).
") SetSelectionStyle;
		void SetSelectionStyle(const opencascade::handle<Prs3d_Drawer> & theStyle);

		/****** AIS_InteractiveContext::SetSubIntensityColor ******/
		/****** md5 signature: efbd8ffda6a16710153bd546969c5e71 ******/
		%feature("compactdefaultargs") SetSubIntensityColor;
		%feature("autodoc", "
Parameters
----------
theColor: Quantity_Color

Return
-------
None

Description
-----------
Sub-intensity allows temporary highlighting of particular objects with specified color in a manner of selection highlight, but without actual selection (e.g., global status and owner's selection state will not be updated). The method sets up the color for such highlighting. By default, this is Quantity_NOC_GRAY40.
") SetSubIntensityColor;
		void SetSubIntensityColor(const Quantity_Color & theColor);

		/****** AIS_InteractiveContext::SetToHilightSelected ******/
		/****** md5 signature: 3f25f21cd7146a5ec1547a692b94556c ******/
		%feature("compactdefaultargs") SetToHilightSelected;
		%feature("autodoc", "
Parameters
----------
toHilight: bool

Return
-------
None

Description
-----------
Specify whether selected object must be hilighted when mouse cursor is moved above it (in MoveTo method). By default this value is false and selected object is not hilighted in this case. 
See also: MoveTo().
") SetToHilightSelected;
		void SetToHilightSelected(const bool toHilight);

		/****** AIS_InteractiveContext::SetTransformPersistence ******/
		/****** md5 signature: 4fdb4a5c645cc9dae3adacc6cbe0332f ******/
		%feature("compactdefaultargs") SetTransformPersistence;
		%feature("autodoc", "
Parameters
----------
theObject: AIS_InteractiveObject
theTrsfPers: Graphic3d_TransformPers

Return
-------
None

Description
-----------
Sets transform persistence.
") SetTransformPersistence;
		void SetTransformPersistence(const opencascade::handle<AIS_InteractiveObject> & theObject, const opencascade::handle<Graphic3d_TransformPers> & theTrsfPers);

		/****** AIS_InteractiveContext::SetTransparency ******/
		/****** md5 signature: f9ffe75ac9f04c2e4766bc98373b8292 ******/
		%feature("compactdefaultargs") SetTransparency;
		%feature("autodoc", "
Parameters
----------
theIObj: AIS_InteractiveObject
theValue: double
theToUpdateViewer: bool

Return
-------
None

Description
-----------
Provides the transparency settings for viewing the Object. The transparency value aValue may be between 0.0, opaque, and 1.0, fully transparent.
") SetTransparency;
		void SetTransparency(const opencascade::handle<AIS_InteractiveObject> & theIObj, const double theValue, const bool theToUpdateViewer);

		/****** AIS_InteractiveContext::SetTrihedronSize ******/
		/****** md5 signature: 35331cc9cc85a7858742b0391e310465 ******/
		%feature("compactdefaultargs") SetTrihedronSize;
		%feature("autodoc", "
Parameters
----------
theSize: double
theToUpdateViewer: bool

Return
-------
None

Description
-----------
Sets the size aSize of the trihedron. Is used to change the default value 100 mm for display of trihedra. Use of this function in one of your own interactive objects requires a call to the Compute function of the new class. This will recalculate the presentation for every trihedron displayed.
") SetTrihedronSize;
		void SetTrihedronSize(const double theSize, const bool theToUpdateViewer);

		/****** AIS_InteractiveContext::SetViewAffinity ******/
		/****** md5 signature: 2b09c4ab0729fdb9bb6787b2164970d5 ******/
		%feature("compactdefaultargs") SetViewAffinity;
		%feature("autodoc", "
Parameters
----------
theIObj: AIS_InteractiveObject
theView: V3d_View
theIsVisible: bool

Return
-------
None

Description
-----------
Setup object visibility in specified view. Has no effect if object is not displayed in this context.
") SetViewAffinity;
		void SetViewAffinity(const opencascade::handle<AIS_InteractiveObject> & theIObj, const opencascade::handle<V3d_View> & theView, const bool theIsVisible);

		/****** AIS_InteractiveContext::SetWidth ******/
		/****** md5 signature: 7c4425bf7f00a704ffd1b24422fe4df5 ******/
		%feature("compactdefaultargs") SetWidth;
		%feature("autodoc", "
Parameters
----------
theIObj: AIS_InteractiveObject
theValue: double
theToUpdateViewer: bool

Return
-------
None

Description
-----------
Sets the width of the Object.
") SetWidth;
		virtual void SetWidth(const opencascade::handle<AIS_InteractiveObject> & theIObj, const double theValue, const bool theToUpdateViewer);

		/****** AIS_InteractiveContext::SetZLayer ******/
		/****** md5 signature: 9de16485878ef47171f12d852b4297c1 ******/
		%feature("compactdefaultargs") SetZLayer;
		%feature("autodoc", "
Parameters
----------
theIObj: AIS_InteractiveObject
theLayerId: int

Return
-------
None

Description
-----------
Set Z layer id for interactive object. The Z layers can be used to display temporarily presentations of some object in front of the other objects in the scene. The ids for Z layers are generated by V3d_Viewer.
") SetZLayer;
		void SetZLayer(const opencascade::handle<AIS_InteractiveObject> & theIObj, int theLayerId);

		/****** AIS_InteractiveContext::ShiftSelect ******/
		/****** md5 signature: 2e39a0322525c6ffdc9e94978c786877 ******/
		%feature("compactdefaultargs") ShiftSelect;
		%feature("autodoc", "
Parameters
----------
theToUpdateViewer: bool

Return
-------
AIS_StatusOfPick

Description
-----------
No available documentation.
") ShiftSelect;
		AIS_StatusOfPick ShiftSelect(const bool theToUpdateViewer);

		/****** AIS_InteractiveContext::ShiftSelect ******/
		/****** md5 signature: 53ac907ea92c40f35d1b34f32791d04c ******/
		%feature("compactdefaultargs") ShiftSelect;
		%feature("autodoc", "
Parameters
----------
thePolyline: TColgp_Array1OfPnt2d
theView: V3d_View
theToUpdateViewer: bool

Return
-------
AIS_StatusOfPick

Description
-----------
No available documentation.
") ShiftSelect;
		AIS_StatusOfPick ShiftSelect(const TColgp_Array1OfPnt2d & thePolyline, const opencascade::handle<V3d_View> & theView, const bool theToUpdateViewer);

		/****** AIS_InteractiveContext::ShiftSelect ******/
		/****** md5 signature: 7708dbea6b48449ad5dc0ef9ec15e704 ******/
		%feature("compactdefaultargs") ShiftSelect;
		%feature("autodoc", "
Parameters
----------
theXPMin: int
theYPMin: int
theXPMax: int
theYPMax: int
theView: V3d_View
theToUpdateViewer: bool

Return
-------
AIS_StatusOfPick

Description
-----------
No available documentation.
") ShiftSelect;
		AIS_StatusOfPick ShiftSelect(const int theXPMin, const int theYPMin, const int theXPMax, const int theYPMax, const opencascade::handle<V3d_View> & theView, const bool theToUpdateViewer);

		/****** AIS_InteractiveContext::SubIntensityColor ******/
		/****** md5 signature: e1332d593cf25efd90cc06d78287a52b ******/
		%feature("compactdefaultargs") SubIntensityColor;
		%feature("autodoc", "Return
-------
Quantity_Color

Description
-----------
Sub-intensity allows temporary highlighting of particular objects with specified color in a manner of selection highlight, but without actual selection (e.g., global status and owner's selection state will not be updated). The method returns the color of such highlighting. By default, it is Quantity_NOC_GRAY40.
") SubIntensityColor;
		const Quantity_Color & SubIntensityColor();

		/****** AIS_InteractiveContext::SubIntensityOff ******/
		/****** md5 signature: 85b78fdcae8899e88d16dc144f32f237 ******/
		%feature("compactdefaultargs") SubIntensityOff;
		%feature("autodoc", "
Parameters
----------
theIObj: AIS_InteractiveObject
theToUpdateViewer: bool

Return
-------
None

Description
-----------
Removes the subintensity option for the entity. If a local context is open, the presentation of the Interactive Object activates the selection mode.
") SubIntensityOff;
		void SubIntensityOff(const opencascade::handle<AIS_InteractiveObject> & theIObj, const bool theToUpdateViewer);

		/****** AIS_InteractiveContext::SubIntensityOn ******/
		/****** md5 signature: 87097d631c6871964bd1b48fec3fb7c6 ******/
		%feature("compactdefaultargs") SubIntensityOn;
		%feature("autodoc", "
Parameters
----------
theIObj: AIS_InteractiveObject
theToUpdateViewer: bool

Return
-------
None

Description
-----------
Highlights, and removes highlights from, the displayed object which is displayed at Neutral Point with subintensity color. Available only for active local context. There is no effect if there is no local context. If a local context is open, the presentation of the Interactive Object activates the selection mode.
") SubIntensityOn;
		void SubIntensityOn(const opencascade::handle<AIS_InteractiveObject> & theIObj, const bool theToUpdateViewer);

		/****** AIS_InteractiveContext::ToHilightSelected ******/
		/****** md5 signature: d3c4c29cf0be26a910279688b1a981ff ******/
		%feature("compactdefaultargs") ToHilightSelected;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Return value specified whether selected object must be hilighted when mouse cursor is moved above it 
See also: MoveTo().
") ToHilightSelected;
		bool ToHilightSelected();

		/****** AIS_InteractiveContext::TrihedronSize ******/
		/****** md5 signature: 3ad10d3509731bc41069746b3a871957 ******/
		%feature("compactdefaultargs") TrihedronSize;
		%feature("autodoc", "Return
-------
double

Description
-----------
returns the current value of trihedron size.
") TrihedronSize;
		double TrihedronSize();

		/****** AIS_InteractiveContext::Unhilight ******/
		/****** md5 signature: 960653e371af67a2e5d67ba60a200bc5 ******/
		%feature("compactdefaultargs") Unhilight;
		%feature("autodoc", "
Parameters
----------
theIObj: AIS_InteractiveObject
theToUpdateViewer: bool

Return
-------
None

Description
-----------
Removes highlighting from the Object.
") Unhilight;
		void Unhilight(const opencascade::handle<AIS_InteractiveObject> & theIObj, const bool theToUpdateViewer);

		/****** AIS_InteractiveContext::UnhilightCurrents ******/
		/****** md5 signature: 0133743894d0166819d959179a43d8f8 ******/
		%feature("compactdefaultargs") UnhilightCurrents;
		%feature("autodoc", "
Parameters
----------
theToUpdateViewer: bool

Return
-------
None

Description
-----------
No available documentation.
") UnhilightCurrents;
		void UnhilightCurrents(const bool theToUpdateViewer);

		/****** AIS_InteractiveContext::UnhilightSelected ******/
		/****** md5 signature: 32dced4aaed2022f216413f40a516537 ******/
		%feature("compactdefaultargs") UnhilightSelected;
		%feature("autodoc", "
Parameters
----------
theToUpdateViewer: bool

Return
-------
None

Description
-----------
Removes highlighting from selected objects.
") UnhilightSelected;
		void UnhilightSelected(const bool theToUpdateViewer);

		/****** AIS_InteractiveContext::UnsetColor ******/
		/****** md5 signature: dfb088ba12cd6436e944adf93d9b7586 ******/
		%feature("compactdefaultargs") UnsetColor;
		%feature("autodoc", "
Parameters
----------
theIObj: AIS_InteractiveObject
theToUpdateViewer: bool

Return
-------
None

Description
-----------
Removes the color selection for the selected entity.
") UnsetColor;
		void UnsetColor(const opencascade::handle<AIS_InteractiveObject> & theIObj, const bool theToUpdateViewer);

		/****** AIS_InteractiveContext::UnsetDisplayMode ******/
		/****** md5 signature: 15bdd562d1fd3a27cbb5f1a0e38d727f ******/
		%feature("compactdefaultargs") UnsetDisplayMode;
		%feature("autodoc", "
Parameters
----------
theIObj: AIS_InteractiveObject
theToUpdateViewer: bool

Return
-------
None

Description
-----------
Unsets the display mode of seen Interactive Objects.
") UnsetDisplayMode;
		void UnsetDisplayMode(const opencascade::handle<AIS_InteractiveObject> & theIObj, const bool theToUpdateViewer);

		/****** AIS_InteractiveContext::UnsetLocalAttributes ******/
		/****** md5 signature: cdf91f4ea7b11094180b9af02c604f27 ******/
		%feature("compactdefaultargs") UnsetLocalAttributes;
		%feature("autodoc", "
Parameters
----------
theIObj: AIS_InteractiveObject
theToUpdateViewer: bool

Return
-------
None

Description
-----------
Removes the settings for local attributes of the Object and returns to defaults.
") UnsetLocalAttributes;
		void UnsetLocalAttributes(const opencascade::handle<AIS_InteractiveObject> & theIObj, const bool theToUpdateViewer);

		/****** AIS_InteractiveContext::UnsetMaterial ******/
		/****** md5 signature: 11d09c80ef3cee91c8c9099c6beb53af ******/
		%feature("compactdefaultargs") UnsetMaterial;
		%feature("autodoc", "
Parameters
----------
theIObj: AIS_InteractiveObject
theToUpdateViewer: bool

Return
-------
None

Description
-----------
Removes the type of material setting for viewing the Object.
") UnsetMaterial;
		void UnsetMaterial(const opencascade::handle<AIS_InteractiveObject> & theIObj, const bool theToUpdateViewer);

		/****** AIS_InteractiveContext::UnsetTransparency ******/
		/****** md5 signature: 39c7759d6a3ce9567df9876663714e7f ******/
		%feature("compactdefaultargs") UnsetTransparency;
		%feature("autodoc", "
Parameters
----------
theIObj: AIS_InteractiveObject
theToUpdateViewer: bool

Return
-------
None

Description
-----------
Removes the transparency settings for viewing the Object.
") UnsetTransparency;
		void UnsetTransparency(const opencascade::handle<AIS_InteractiveObject> & theIObj, const bool theToUpdateViewer);

		/****** AIS_InteractiveContext::UnsetWidth ******/
		/****** md5 signature: 7b0c4d5b8e0cbf38686d3628b7fa5784 ******/
		%feature("compactdefaultargs") UnsetWidth;
		%feature("autodoc", "
Parameters
----------
theIObj: AIS_InteractiveObject
theToUpdateViewer: bool

Return
-------
None

Description
-----------
Removes the width setting of the Object.
") UnsetWidth;
		virtual void UnsetWidth(const opencascade::handle<AIS_InteractiveObject> & theIObj, const bool theToUpdateViewer);

		/****** AIS_InteractiveContext::Update ******/
		/****** md5 signature: dccbbf45906ca2a33dc2d4b7c0e5b5d9 ******/
		%feature("compactdefaultargs") Update;
		%feature("autodoc", "
Parameters
----------
theIObj: AIS_InteractiveObject
theUpdateViewer: bool

Return
-------
None

Description
-----------
Updates displayed interactive object by checking and recomputing its flagged as 'to be recomputed' presentation and selection structures. This method does not force any recomputation on its own. The method recomputes selections even if they are loaded without activation in particular selector.
") Update;
		void Update(const opencascade::handle<AIS_InteractiveObject> & theIObj, const bool theUpdateViewer);

		/****** AIS_InteractiveContext::UpdateCurrent ******/
		/****** md5 signature: b0255cb4a140dfe10f31c4adcc570785 ******/
		%feature("compactdefaultargs") UpdateCurrent;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") UpdateCurrent;
		void UpdateCurrent();

		/****** AIS_InteractiveContext::UpdateCurrentViewer ******/
		/****** md5 signature: 7ec7524380aa7da52320b4262dabacd6 ******/
		%feature("compactdefaultargs") UpdateCurrentViewer;
		%feature("autodoc", "Return
-------
None

Description
-----------
Updates the current viewer.
") UpdateCurrentViewer;
		void UpdateCurrentViewer();

		/****** AIS_InteractiveContext::UpdateSelected ******/
		/****** md5 signature: d29be14e1b52d626edfa6748d9a59017 ******/
		%feature("compactdefaultargs") UpdateSelected;
		%feature("autodoc", "
Parameters
----------
theToUpdateViewer: bool

Return
-------
None

Description
-----------
Updates the list of selected objects: i.e. highlights the newly selected ones and unhighlights previously selected objects. 
See also: HilightSelected().
") UpdateSelected;
		void UpdateSelected(bool theToUpdateViewer);

		/****** AIS_InteractiveContext::Width ******/
		/****** md5 signature: 170b8fb51bcae7e019ae4ec8d873685b ******/
		%feature("compactdefaultargs") Width;
		%feature("autodoc", "
Parameters
----------
aniobj: AIS_InteractiveObject

Return
-------
double

Description
-----------
Returns the width of the Interactive Object in the interactive context.
") Width;
		virtual double Width(const opencascade::handle<AIS_InteractiveObject> & aniobj);

};


%make_alias(AIS_InteractiveContext)

%extend AIS_InteractiveContext {
	%pythoncode {
	__repr__ = _dumps_object

	@methodnotwrapped
	def EntityOwners(self):
		pass

	@methodnotwrapped
	def Status(self):
		pass
	}
};

/******************************
* class AIS_InteractiveObject *
******************************/
%nodefaultctor AIS_InteractiveObject;
class AIS_InteractiveObject : public SelectMgr_SelectableObject {
	public:
		/****** AIS_InteractiveObject::ClearOwner ******/
		/****** md5 signature: 8592d7a71151aca87082b1c1d7ca818c ******/
		%feature("compactdefaultargs") ClearOwner;
		%feature("autodoc", "Return
-------
None

Description
-----------
Each Interactive Object has methods which allow us to attribute an Owner to it in the form of a Transient. This method removes the owner from the graphic entity.
") ClearOwner;
		void ClearOwner();


        /****************** DumpJson ******************/
        %feature("autodoc", "
Parameters
----------
depth: int, default=-1

Return
-------
str

Description
-----------
Dump the object to JSON string.
") DumpJson;
        %extend{
            std::string DumpJson(int depth=-1) {
            std::stringstream s;
            self->DumpJson(s, depth);
            return "{" + s.str() + "}" ;}
        };
		/****** AIS_InteractiveObject::GetContext ******/
		/****** md5 signature: 9141453181bb741f4971f346e5b4d4cb ******/
		%feature("compactdefaultargs") GetContext;
		%feature("autodoc", "Return
-------
opencascade::handle<AIS_InteractiveContext>

Description
-----------
Returns the context pointer to the interactive context.
") GetContext;
		opencascade::handle<AIS_InteractiveContext> GetContext();

		/****** AIS_InteractiveObject::GetOwner ******/
		/****** md5 signature: 269b252597829cad630a6bbf4ea69473 ******/
		%feature("compactdefaultargs") GetOwner;
		%feature("autodoc", "Return
-------
opencascade::handle<Standard_Transient>

Description
-----------
Returns the owner of the Interactive Object. The owner can be a shape for a set of sub-shapes or a sub-shape for sub-shapes which it is composed of, and takes the form of a transient. There are two types of owners: - Direct owners, decomposition shapes such as edges, wires, and faces. - Users, presentable objects connecting to sensitive primitives, or a shape which has been decomposed.
") GetOwner;
		const opencascade::handle<Standard_Transient> & GetOwner();

		/****** AIS_InteractiveObject::HasInteractiveContext ******/
		/****** md5 signature: 1ca289714d63b69fbe8e31bc6c358a0f ******/
		%feature("compactdefaultargs") HasInteractiveContext;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Indicates whether the Interactive Object has a pointer to an interactive context.
") HasInteractiveContext;
		bool HasInteractiveContext();

		/****** AIS_InteractiveObject::HasOwner ******/
		/****** md5 signature: 1840142524ae0d09744c7d0fc072b3b4 ******/
		%feature("compactdefaultargs") HasOwner;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if the object has an owner attributed to it. The owner can be a shape for a set of sub-shapes or a sub-shape for sub-shapes which it is composed of, and takes the form of a transient.
") HasOwner;
		bool HasOwner();

		/****** AIS_InteractiveObject::HasPresentation ******/
		/****** md5 signature: ac796505b39bc4fca05e32df2cecbb5b ******/
		%feature("compactdefaultargs") HasPresentation;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True when this object has a presentation in the current DisplayMode().
") HasPresentation;
		bool HasPresentation();

		/****** AIS_InteractiveObject::InteractiveContext ******/
		/****** md5 signature: 9383f882f57497c320cdfadce7894acb ******/
		%feature("compactdefaultargs") InteractiveContext;
		%feature("autodoc", "Return
-------
AIS_InteractiveContext *

Description
-----------
Returns the context pointer to the interactive context.
") InteractiveContext;
		AIS_InteractiveContext * InteractiveContext();

		/****** AIS_InteractiveObject::Presentation ******/
		/****** md5 signature: 88be3e26e114f8c34739a306f65e267d ******/
		%feature("compactdefaultargs") Presentation;
		%feature("autodoc", "Return
-------
opencascade::handle<Prs3d_Presentation>

Description
-----------
Returns the current presentation of this object according to the current DisplayMode().
") Presentation;
		opencascade::handle<Prs3d_Presentation> Presentation();

		/****** AIS_InteractiveObject::ProcessDragging ******/
		/****** md5 signature: 22623500afe8babf8ce56043a5af9b7c ******/
		%feature("compactdefaultargs") ProcessDragging;
		%feature("autodoc", "
Parameters
----------
theCtx: AIS_InteractiveContext
theView: V3d_View
theOwner: SelectMgr_EntityOwner
theDragFrom: NCollection_Vec2<int>
theDragTo: NCollection_Vec2<int>
theAction: AIS_DragAction

Return
-------
bool

Description
-----------
Drag object in the viewer. 
Input parameter: theCtx interactive context 
Input parameter: theView active View 
Input parameter: theOwner the owner of detected entity 
Input parameter: theDragFrom drag start point 
Input parameter: theDragTo drag end point 
Input parameter: theAction drag action 
Return: False if object rejects dragging action (e.g. AIS_DragAction_Start).
") ProcessDragging;
		virtual bool ProcessDragging(const opencascade::handle<AIS_InteractiveContext> & theCtx, const opencascade::handle<V3d_View> & theView, const opencascade::handle<SelectMgr_EntityOwner> & theOwner, const NCollection_Vec2<int> & theDragFrom, const NCollection_Vec2<int> & theDragTo, const AIS_DragAction theAction);

		/****** AIS_InteractiveObject::Redisplay ******/
		/****** md5 signature: 21b97b863ecfbda6ac7f10d6593b39ee ******/
		%feature("compactdefaultargs") Redisplay;
		%feature("autodoc", "
Parameters
----------
AllModes: bool (optional, default to false)

Return
-------
None

Description
-----------
Updates the active presentation; if <AllModes> = true all the presentations inside are recomputed. IMPORTANT: It is preferable to call Redisplay method of corresponding AIS_InteractiveContext instance for cases when it is accessible. This method just redirects call to myCTXPtr, so this class field must be up to date for proper result.
") Redisplay;
		void Redisplay(const bool AllModes = false);

		/****** AIS_InteractiveObject::SetAspect ******/
		/****** md5 signature: eb261a37528b25042807667593c3b378 ******/
		%feature("compactdefaultargs") SetAspect;
		%feature("autodoc", "
Parameters
----------
anAspect: Prs3d_BasicAspect

Return
-------
None

Description
-----------
No available documentation.
") SetAspect;
		void SetAspect(const opencascade::handle<Prs3d_BasicAspect> & anAspect);

		/****** AIS_InteractiveObject::SetContext ******/
		/****** md5 signature: aea0f9b1ecdc3c6f470618d4f2a4757d ******/
		%feature("compactdefaultargs") SetContext;
		%feature("autodoc", "
Parameters
----------
aCtx: AIS_InteractiveContext

Return
-------
None

Description
-----------
Sets the interactive context aCtx and provides a link to the default drawing tool or 'Drawer' if there is none.
") SetContext;
		virtual void SetContext(const opencascade::handle<AIS_InteractiveContext> & aCtx);

		/****** AIS_InteractiveObject::SetOwner ******/
		/****** md5 signature: 3c9542fea45232da4a6e2ddd58ba67f4 ******/
		%feature("compactdefaultargs") SetOwner;
		%feature("autodoc", "
Parameters
----------
theApplicativeEntity: Standard_Transient

Return
-------
None

Description
-----------
Allows you to attribute the owner theApplicativeEntity to an Interactive Object. This can be a shape for a set of sub-shapes or a sub-shape for sub-shapes which it is composed of. The owner takes the form of a transient.
") SetOwner;
		void SetOwner(const opencascade::handle<Standard_Transient> & theApplicativeEntity);

		/****** AIS_InteractiveObject::Signature ******/
		/****** md5 signature: f9de1a0341af31e78e8dc4a6f59b7210 ******/
		%feature("compactdefaultargs") Signature;
		%feature("autodoc", "Return
-------
int

Description
-----------
Specifies additional characteristics of Interactive Object of Type(); -1 by default. Among the datums, this signature is attributed to the shape. The remaining datums have the following default signatures: - Point signature 1 - Axis  signature 2 - Trihedron signature 3 - PlaneTrihedron signature 4 - Line  signature 5 - Circle signature 6 - Plane signature 7.
") Signature;
		virtual int Signature();

		/****** AIS_InteractiveObject::Type ******/
		/****** md5 signature: 7e0280329d789210bd49ed9764da22e3 ******/
		%feature("compactdefaultargs") Type;
		%feature("autodoc", "Return
-------
AIS_KindOfInteractive

Description
-----------
Returns the kind of Interactive Object; AIS_KindOfInteractive_None by default.
") Type;
		virtual AIS_KindOfInteractive Type();

};


%make_alias(AIS_InteractiveObject)

%extend AIS_InteractiveObject {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************
* class AIS_LightSourceOwner *
*****************************/
class AIS_LightSourceOwner : public SelectMgr_EntityOwner {
	public:
		/****** AIS_LightSourceOwner::AIS_LightSourceOwner ******/
		/****** md5 signature: 25c1e716b334fbc0684936d816a515d6 ******/
		%feature("compactdefaultargs") AIS_LightSourceOwner;
		%feature("autodoc", "
Parameters
----------
theObject: AIS_LightSource
thePriority: int (optional, default to 5)

Return
-------
None

Description
-----------
Main constructor.
") AIS_LightSourceOwner;
		 AIS_LightSourceOwner(const opencascade::handle<AIS_LightSource> & theObject, int thePriority = 5);

		/****** AIS_LightSourceOwner::HandleMouseClick ******/
		/****** md5 signature: f6558fc2e4bf07e03b731ab9f08699fb ******/
		%feature("compactdefaultargs") HandleMouseClick;
		%feature("autodoc", "
Parameters
----------
thePoint: NCollection_Vec2<int>
theButton: Aspect_VKeyMouse
theModifiers: Aspect_VKeyFlags
theIsDoubleClick: bool

Return
-------
bool

Description
-----------
Handle mouse button click event.
") HandleMouseClick;
		bool HandleMouseClick(const NCollection_Vec2<int> & thePoint, Aspect_VKeyMouse theButton, Aspect_VKeyFlags theModifiers, bool theIsDoubleClick);

		/****** AIS_LightSourceOwner::HilightWithColor ******/
		/****** md5 signature: 985541d7a85b855c0446605f355db282 ******/
		%feature("compactdefaultargs") HilightWithColor;
		%feature("autodoc", "
Parameters
----------
thePrsMgr: PrsMgr_PresentationManager
theStyle: Prs3d_Drawer
theMode: int

Return
-------
None

Description
-----------
Highlights selectable object's presentation with display mode in presentation manager with given highlight style. Also a check for auto-highlight is performed - if selectable object manages highlighting on its own, execution will be passed to SelectMgr_SelectableObject::HilightOwnerWithColor method.
") HilightWithColor;
		void HilightWithColor(const opencascade::handle<PrsMgr_PresentationManager> & thePrsMgr, const opencascade::handle<Prs3d_Drawer> & theStyle, const int theMode);

		/****** AIS_LightSourceOwner::IsForcedHilight ******/
		/****** md5 signature: 92f3baa5202989891d1ab29485820efe ******/
		%feature("compactdefaultargs") IsForcedHilight;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Always update dynamic highlighting.
") IsForcedHilight;
		bool IsForcedHilight();

};


%make_alias(AIS_LightSourceOwner)

%extend AIS_LightSourceOwner {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************
* class AIS_ManipulatorOwner *
*****************************/
class AIS_ManipulatorOwner : public SelectMgr_EntityOwner {
	public:
		/****** AIS_ManipulatorOwner::AIS_ManipulatorOwner ******/
		/****** md5 signature: 633e1bed1291a705f3521cd40db0d615 ******/
		%feature("compactdefaultargs") AIS_ManipulatorOwner;
		%feature("autodoc", "
Parameters
----------
theSelObject: SelectMgr_SelectableObject
theIndex: int
theMode: AIS_ManipulatorMode
thePriority: int (optional, default to 0)

Return
-------
None

Description
-----------
No available documentation.
") AIS_ManipulatorOwner;
		 AIS_ManipulatorOwner(const opencascade::handle<SelectMgr_SelectableObject> & theSelObject, const int theIndex, const AIS_ManipulatorMode theMode, const int thePriority = 0);

		/****** AIS_ManipulatorOwner::HilightWithColor ******/
		/****** md5 signature: bcacc84fce4a273c2cef40b3c49caa70 ******/
		%feature("compactdefaultargs") HilightWithColor;
		%feature("autodoc", "
Parameters
----------
thePM: PrsMgr_PresentationManager
theStyle: Prs3d_Drawer
theMode: int

Return
-------
None

Description
-----------
No available documentation.
") HilightWithColor;
		void HilightWithColor(const opencascade::handle<PrsMgr_PresentationManager> & thePM, const opencascade::handle<Prs3d_Drawer> & theStyle, const int theMode);

		/****** AIS_ManipulatorOwner::Index ******/
		/****** md5 signature: 4fc88a71a4ab819038de9a6160c989c2 ******/
		%feature("compactdefaultargs") Index;
		%feature("autodoc", "Return
-------
int

Description
-----------
Return: index of manipulator axis.
") Index;
		int Index();

		/****** AIS_ManipulatorOwner::IsHilighted ******/
		/****** md5 signature: bed9484aede1ad67e2fa4bccedcf6168 ******/
		%feature("compactdefaultargs") IsHilighted;
		%feature("autodoc", "
Parameters
----------
thePM: PrsMgr_PresentationManager
theMode: int

Return
-------
bool

Description
-----------
No available documentation.
") IsHilighted;
		bool IsHilighted(const opencascade::handle<PrsMgr_PresentationManager> & thePM, const int theMode);

		/****** AIS_ManipulatorOwner::Mode ******/
		/****** md5 signature: 185ce7f30436df2ae54dc24077fa08f1 ******/
		%feature("compactdefaultargs") Mode;
		%feature("autodoc", "Return
-------
AIS_ManipulatorMode

Description
-----------
No available documentation.
") Mode;
		AIS_ManipulatorMode Mode();

		/****** AIS_ManipulatorOwner::Unhilight ******/
		/****** md5 signature: b1f8b4eea5e9961c5f58b92ae1836470 ******/
		%feature("compactdefaultargs") Unhilight;
		%feature("autodoc", "
Parameters
----------
thePM: PrsMgr_PresentationManager
theMode: int

Return
-------
None

Description
-----------
No available documentation.
") Unhilight;
		void Unhilight(const opencascade::handle<PrsMgr_PresentationManager> & thePM, const int theMode);

};


%make_alias(AIS_ManipulatorOwner)

%extend AIS_ManipulatorOwner {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************
* class AIS_PointCloudOwner *
****************************/
class AIS_PointCloudOwner : public SelectMgr_EntityOwner {
	public:
		/****** AIS_PointCloudOwner::AIS_PointCloudOwner ******/
		/****** md5 signature: 670174874a27bd532f1d46109c419250 ******/
		%feature("compactdefaultargs") AIS_PointCloudOwner;
		%feature("autodoc", "
Parameters
----------
theOrigin: AIS_PointCloud

Return
-------
None

Description
-----------
Main constructor.
") AIS_PointCloudOwner;
		 AIS_PointCloudOwner(const opencascade::handle<AIS_PointCloud> & theOrigin);

		/****** AIS_PointCloudOwner::Clear ******/
		/****** md5 signature: 07c81bafc16c05fd55e0de6a1307e16f ******/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "
Parameters
----------
thePrsMgr: PrsMgr_PresentationManager
theMode: int

Return
-------
None

Description
-----------
Clears presentation.
") Clear;
		void Clear(const opencascade::handle<PrsMgr_PresentationManager> & thePrsMgr, const int theMode);

		/****** AIS_PointCloudOwner::DetectedPoints ******/
		/****** md5 signature: 417e2050aa5d23f2a94aa5e022916b2d ******/
		%feature("compactdefaultargs") DetectedPoints;
		%feature("autodoc", "Return
-------
opencascade::handle<TColStd_HPackedMapOfInteger>

Description
-----------
Return last detected points. WARNING! Indexation starts with 0 (shifted by -1 comparing to Graphic3d_ArrayOfPoints::Vertice()).
") DetectedPoints;
		const opencascade::handle<TColStd_HPackedMapOfInteger> & DetectedPoints();

		/****** AIS_PointCloudOwner::HilightWithColor ******/
		/****** md5 signature: 985541d7a85b855c0446605f355db282 ******/
		%feature("compactdefaultargs") HilightWithColor;
		%feature("autodoc", "
Parameters
----------
thePrsMgr: PrsMgr_PresentationManager
theStyle: Prs3d_Drawer
theMode: int

Return
-------
None

Description
-----------
Handle dynamic highlighting.
") HilightWithColor;
		void HilightWithColor(const opencascade::handle<PrsMgr_PresentationManager> & thePrsMgr, const opencascade::handle<Prs3d_Drawer> & theStyle, const int theMode);

		/****** AIS_PointCloudOwner::IsForcedHilight ******/
		/****** md5 signature: 92f3baa5202989891d1ab29485820efe ******/
		%feature("compactdefaultargs") IsForcedHilight;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Always update dynamic highlighting.
") IsForcedHilight;
		bool IsForcedHilight();

		/****** AIS_PointCloudOwner::SelectedPoints ******/
		/****** md5 signature: 2ac5ef1820739df521163373d95dceba ******/
		%feature("compactdefaultargs") SelectedPoints;
		%feature("autodoc", "Return
-------
opencascade::handle<TColStd_HPackedMapOfInteger>

Description
-----------
Return selected points. WARNING! Indexation starts with 0 (shifted by -1 comparing to Graphic3d_ArrayOfPoints::Vertice()).
") SelectedPoints;
		const opencascade::handle<TColStd_HPackedMapOfInteger> & SelectedPoints();

		/****** AIS_PointCloudOwner::Unhilight ******/
		/****** md5 signature: 01b253b3b65952c4150ece87c5848f75 ******/
		%feature("compactdefaultargs") Unhilight;
		%feature("autodoc", "
Parameters
----------
thePrsMgr: PrsMgr_PresentationManager
theMode: int

Return
-------
None

Description
-----------
Removes highlighting.
") Unhilight;
		void Unhilight(const opencascade::handle<PrsMgr_PresentationManager> & thePrsMgr, const int theMode);

};


%make_alias(AIS_PointCloudOwner)

%extend AIS_PointCloudOwner {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************
* class AIS_Selection *
**********************/
class AIS_Selection : public Standard_Transient {
	public:
		/****** AIS_Selection::AIS_Selection ******/
		/****** md5 signature: bd27ce322f4357aff0848195050258b2 ******/
		%feature("compactdefaultargs") AIS_Selection;
		%feature("autodoc", "Return
-------
None

Description
-----------
creates a new selection.
") AIS_Selection;
		 AIS_Selection();

		/****** AIS_Selection::AddSelect ******/
		/****** md5 signature: 935dfa1e78a7bd4bc211338bfecc5077 ******/
		%feature("compactdefaultargs") AddSelect;
		%feature("autodoc", "
Parameters
----------
theObject: SelectMgr_EntityOwner

Return
-------
AIS_SelectStatus

Description
-----------
the object is always add int the selection. faster when the number of objects selected is great.
") AddSelect;
		virtual AIS_SelectStatus AddSelect(const opencascade::handle<SelectMgr_EntityOwner> & theObject);

		/****** AIS_Selection::Clear ******/
		/****** md5 signature: 1badd2d119b64dbdb177834e510c3af9 ******/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Return
-------
None

Description
-----------
removes all the object of the selection.
") Clear;
		virtual void Clear();

		/****** AIS_Selection::ClearAndSelect ******/
		/****** md5 signature: 2641f110093319511fa0a2a16a48b7b4 ******/
		%feature("compactdefaultargs") ClearAndSelect;
		%feature("autodoc", "
Parameters
----------
theObject: SelectMgr_EntityOwner
theFilter: SelectMgr_Filter
theIsDetected: bool

Return
-------
None

Description
-----------
clears the selection and adds the object in the selection. 
Input parameter: theObject element to change selection state 
Input parameter: theFilter context filter 
Input parameter: theIsDetected flag of object detection.
") ClearAndSelect;
		virtual void ClearAndSelect(const opencascade::handle<SelectMgr_EntityOwner> & theObject, const opencascade::handle<SelectMgr_Filter> & theFilter, const bool theIsDetected);

		/****** AIS_Selection::Extent ******/
		/****** md5 signature: 5ab265087cc74fd902b499a31008b06c ******/
		%feature("compactdefaultargs") Extent;
		%feature("autodoc", "Return
-------
int

Description
-----------
Return the number of selected objects.
") Extent;
		int Extent();

		/****** AIS_Selection::Init ******/
		/****** md5 signature: ca2feb116ce485f3e8278f79ba5f5d53 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Return
-------
None

Description
-----------
Start iteration through selected objects.
") Init;
		void Init();

		/****** AIS_Selection::IsEmpty ******/
		/****** md5 signature: 70a41d5fe65955a28167088305fc6991 ******/
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Return true if list of selected objects is empty.
") IsEmpty;
		bool IsEmpty();

		/****** AIS_Selection::IsSelected ******/
		/****** md5 signature: 6903338425e4cadd10671187a6f76731 ******/
		%feature("compactdefaultargs") IsSelected;
		%feature("autodoc", "
Parameters
----------
theObject: SelectMgr_EntityOwner

Return
-------
bool

Description
-----------
checks if the object is in the selection.
") IsSelected;
		bool IsSelected(const opencascade::handle<SelectMgr_EntityOwner> & theObject);

		/****** AIS_Selection::More ******/
		/****** md5 signature: 0a7b505ff53e438121f2c208f8ae7ce8 ******/
		%feature("compactdefaultargs") More;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Return true if iterator points to selected object.
") More;
		bool More();

		/****** AIS_Selection::Next ******/
		/****** md5 signature: 1201a55f750036045cd397a65f07fc7d ******/
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "Return
-------
None

Description
-----------
Continue iteration through selected objects.
") Next;
		void Next();

		/****** AIS_Selection::Objects ******/
		/****** md5 signature: 3cc847338c9dcee386e723f1f9175ffd ******/
		%feature("compactdefaultargs") Objects;
		%feature("autodoc", "Return
-------
NCollection_List<opencascade::handle<SelectMgr_EntityOwner>>

Description
-----------
Return the list of selected objects.
") Objects;
		const NCollection_List<opencascade::handle<SelectMgr_EntityOwner>> & Objects();

		/****** AIS_Selection::Select ******/
		/****** md5 signature: 4f39cd5ec0f7f18e6f8df41492ed2738 ******/
		%feature("compactdefaultargs") Select;
		%feature("autodoc", "
Parameters
----------
theOwner: SelectMgr_EntityOwner
theFilter: SelectMgr_Filter
theSelScheme: AIS_SelectionScheme
theIsDetected: bool

Return
-------
AIS_SelectStatus

Description
-----------
if the object is not yet in the selection, it will be added. if the object is already in the selection, it will be removed. 
Input parameter: theOwner element to change selection state 
Input parameter: theFilter context filter 
Input parameter: theSelScheme selection scheme 
Input parameter: theIsDetected flag of object detection 
Return: result of selection.
") Select;
		virtual AIS_SelectStatus Select(const opencascade::handle<SelectMgr_EntityOwner> & theOwner, const opencascade::handle<SelectMgr_Filter> & theFilter, const AIS_SelectionScheme theSelScheme, const bool theIsDetected);

		/****** AIS_Selection::SelectOwners ******/
		/****** md5 signature: 4066a1396512e9004f4b7442089bcdb0 ******/
		%feature("compactdefaultargs") SelectOwners;
		%feature("autodoc", "
Parameters
----------
thePickedOwners: SelectMgr_EntityOwner
theSelScheme: AIS_SelectionScheme
theToAllowSelOverlap: bool
theFilter: SelectMgr_Filter

Return
-------
None

Description
-----------
Select or deselect owners depending on the selection scheme. 
Input parameter: thePickedOwners elements to change selection state 
Input parameter: theSelScheme selection scheme, defines how owner is selected 
Input parameter: theToAllowSelOverlap selection flag, if true - overlapped entities are allowed 
Input parameter: theFilter context filter to skip not acceptable owners.
") SelectOwners;
		virtual void SelectOwners(const NCollection_Array1<opencascade::handle<SelectMgr_EntityOwner>> & thePickedOwners, const AIS_SelectionScheme theSelScheme, const bool theToAllowSelOverlap, const opencascade::handle<SelectMgr_Filter> & theFilter);

		/****** AIS_Selection::Value ******/
		/****** md5 signature: af0cbe2fba1d118547342f72cf6f251c ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Return
-------
opencascade::handle<SelectMgr_EntityOwner>

Description
-----------
Return selected object at iterator position.
") Value;
		const opencascade::handle<SelectMgr_EntityOwner> & Value();

};


%make_alias(AIS_Selection)

%extend AIS_Selection {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************
* class AIS_TrihedronOwner *
***************************/
class AIS_TrihedronOwner : public SelectMgr_EntityOwner {
	public:
		/****** AIS_TrihedronOwner::AIS_TrihedronOwner ******/
		/****** md5 signature: cbe8817bbfc638cf95cee5e92858bf89 ******/
		%feature("compactdefaultargs") AIS_TrihedronOwner;
		%feature("autodoc", "
Parameters
----------
theSelObject: SelectMgr_SelectableObject
theDatumPart: Prs3d_DatumParts
thePriority: int

Return
-------
None

Description
-----------
Creates an owner of AIS_Trihedron object.
") AIS_TrihedronOwner;
		 AIS_TrihedronOwner(const opencascade::handle<SelectMgr_SelectableObject> & theSelObject, const Prs3d_DatumParts theDatumPart, const int thePriority);

		/****** AIS_TrihedronOwner::DatumPart ******/
		/****** md5 signature: a41d605d3f547efa643c1327a2cc9ab2 ******/
		%feature("compactdefaultargs") DatumPart;
		%feature("autodoc", "Return
-------
Prs3d_DatumParts

Description
-----------
Returns the datum part identifier.
") DatumPart;
		Prs3d_DatumParts DatumPart();

		/****** AIS_TrihedronOwner::HilightWithColor ******/
		/****** md5 signature: bcacc84fce4a273c2cef40b3c49caa70 ******/
		%feature("compactdefaultargs") HilightWithColor;
		%feature("autodoc", "
Parameters
----------
thePM: PrsMgr_PresentationManager
theStyle: Prs3d_Drawer
theMode: int

Return
-------
None

Description
-----------
Highlights selectable object's presentation.
") HilightWithColor;
		void HilightWithColor(const opencascade::handle<PrsMgr_PresentationManager> & thePM, const opencascade::handle<Prs3d_Drawer> & theStyle, const int theMode);

		/****** AIS_TrihedronOwner::IsHilighted ******/
		/****** md5 signature: bed9484aede1ad67e2fa4bccedcf6168 ******/
		%feature("compactdefaultargs") IsHilighted;
		%feature("autodoc", "
Parameters
----------
thePM: PrsMgr_PresentationManager
theMode: int

Return
-------
bool

Description
-----------
Returns true if the presentation manager thePM highlights selections corresponding to the selection mode aMode.
") IsHilighted;
		bool IsHilighted(const opencascade::handle<PrsMgr_PresentationManager> & thePM, const int theMode);

		/****** AIS_TrihedronOwner::Unhilight ******/
		/****** md5 signature: b1f8b4eea5e9961c5f58b92ae1836470 ******/
		%feature("compactdefaultargs") Unhilight;
		%feature("autodoc", "
Parameters
----------
thePM: PrsMgr_PresentationManager
theMode: int

Return
-------
None

Description
-----------
Removes highlighting from the owner of a detected selectable object in the presentation manager thePM.
") Unhilight;
		void Unhilight(const opencascade::handle<PrsMgr_PresentationManager> & thePM, const int theMode);

};


%make_alias(AIS_TrihedronOwner)

%extend AIS_TrihedronOwner {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************
* class AIS_TypeFilter *
***********************/
class AIS_TypeFilter : public SelectMgr_Filter {
	public:
		/****** AIS_TypeFilter::AIS_TypeFilter ******/
		/****** md5 signature: ebb79db0373d3bbba2771a109e6c7798 ******/
		%feature("compactdefaultargs") AIS_TypeFilter;
		%feature("autodoc", "
Parameters
----------
aGivenKind: AIS_KindOfInteractive

Return
-------
None

Description
-----------
Initializes filter for type, aGivenKind.
") AIS_TypeFilter;
		 AIS_TypeFilter(const AIS_KindOfInteractive aGivenKind);

		/****** AIS_TypeFilter::IsOk ******/
		/****** md5 signature: eeea6f6b4b7492f5eeac7be277a67559 ******/
		%feature("compactdefaultargs") IsOk;
		%feature("autodoc", "
Parameters
----------
anobj: SelectMgr_EntityOwner

Return
-------
bool

Description
-----------
Returns False if the transient is not an Interactive Object, or if the type of the Interactive Object is not the same as that stored in the filter.
") IsOk;
		bool IsOk(const opencascade::handle<SelectMgr_EntityOwner> & anobj);

};


%make_alias(AIS_TypeFilter)

%extend AIS_TypeFilter {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************
* class AIS_ViewController *
***************************/
class AIS_ViewController : public Aspect_WindowInputListener {
	public:
		/****** AIS_ViewController::AIS_ViewController ******/
		/****** md5 signature: d17644811ddb999bc83fdf0d339ec312 ******/
		%feature("compactdefaultargs") AIS_ViewController;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") AIS_ViewController;
		 AIS_ViewController();

		/****** AIS_ViewController::AbortViewAnimation ******/
		/****** md5 signature: 731d09b2f2102bc88821725825303c73 ******/
		%feature("compactdefaultargs") AbortViewAnimation;
		%feature("autodoc", "Return
-------
None

Description
-----------
Interrupt active view animation.
") AbortViewAnimation;
		void AbortViewAnimation();

		/****** AIS_ViewController::AddTouchPoint ******/
		/****** md5 signature: 5f3938ab2da174a762e0e73d1068baed ******/
		%feature("compactdefaultargs") AddTouchPoint;
		%feature("autodoc", "
Parameters
----------
theId: size_t
thePnt: NCollection_Vec2<double>
theClearBefore: bool (optional, default to false)

Return
-------
None

Description
-----------
Add touch point with the given ID. This method is expected to be called from UI thread. 
Parameter theId touch unique identifier 
Parameter thePnt touch coordinates 
Parameter theClearBefore if True previously registered touches will be removed.
") AddTouchPoint;
		void AddTouchPoint(size_t theId, const NCollection_Vec2<double> & thePnt, bool theClearBefore = false);

		/****** AIS_ViewController::ChangeInputBuffer ******/
		/****** md5 signature: c617c43bf721a07d3495c85c386656be ******/
		%feature("compactdefaultargs") ChangeInputBuffer;
		%feature("autodoc", "
Parameters
----------
theType: AIS_ViewInputBufferType

Return
-------
AIS_ViewInputBuffer

Description
-----------
Return input buffer.
") ChangeInputBuffer;
		AIS_ViewInputBuffer & ChangeInputBuffer(AIS_ViewInputBufferType theType);

		/****** AIS_ViewController::ChangeMouseGestureMap ******/
		/****** md5 signature: 58f282fc720499d059aeb939a3f6e3d2 ******/
		%feature("compactdefaultargs") ChangeMouseGestureMap;
		%feature("autodoc", "Return
-------
NCollection_DataMap<unsigned int, AIS_MouseGesture>

Description
-----------
Return map defining mouse gestures.
") ChangeMouseGestureMap;
		NCollection_DataMap<unsigned int, AIS_MouseGesture> & ChangeMouseGestureMap();

		/****** AIS_ViewController::ChangeMouseSelectionSchemes ******/
		/****** md5 signature: ad82e907bd4f3215cb04700f12bb0682 ******/
		%feature("compactdefaultargs") ChangeMouseSelectionSchemes;
		%feature("autodoc", "Return
-------
NCollection_DataMap<unsigned int, AIS_SelectionScheme>

Description
-----------
Return map defining mouse gestures.
") ChangeMouseSelectionSchemes;
		NCollection_DataMap<unsigned int, AIS_SelectionScheme> & ChangeMouseSelectionSchemes();

		/****** AIS_ViewController::FetchNavigationKeys ******/
		/****** md5 signature: 24477742380c2cd6b0f1335c3b400f8f ******/
		%feature("compactdefaultargs") FetchNavigationKeys;
		%feature("autodoc", "
Parameters
----------
theCrouchRatio: double
theRunRatio: double

Return
-------
AIS_WalkDelta

Description
-----------
Fetch active navigation actions.
") FetchNavigationKeys;
		AIS_WalkDelta FetchNavigationKeys(double theCrouchRatio, double theRunRatio);

		/****** AIS_ViewController::FitAllAuto ******/
		/****** md5 signature: e1231c24d57b52a006fd8876a9bd9bb0 ******/
		%feature("compactdefaultargs") FitAllAuto;
		%feature("autodoc", "
Parameters
----------
theCtx: AIS_InteractiveContext
theView: V3d_View

Return
-------
None

Description
-----------
Modify view camera to fit all objects. Default implementation fits either all visible and all selected objects (swapped on each call).
") FitAllAuto;
		virtual void FitAllAuto(const opencascade::handle<AIS_InteractiveContext> & theCtx, const opencascade::handle<V3d_View> & theView);

		/****** AIS_ViewController::FlushViewEvents ******/
		/****** md5 signature: 6ce5611e5d7156af2b6408158812ec6c ******/
		%feature("compactdefaultargs") FlushViewEvents;
		%feature("autodoc", "
Parameters
----------
theCtx: AIS_InteractiveContext
theView: V3d_View
theToHandle: bool (optional, default to false)

Return
-------
None

Description
-----------
Update buffer for rendering thread. This method is expected to be called within synchronization barrier between GUI and Rendering threads (e.g. GUI thread should be locked beforehand to avoid data races). 
Parameter theCtx interactive context 
Parameter theView active view 
Parameter theToHandle if True, the HandleViewEvents() will be called.
") FlushViewEvents;
		virtual void FlushViewEvents(const opencascade::handle<AIS_InteractiveContext> & theCtx, const opencascade::handle<V3d_View> & theView, bool theToHandle = false);

		/****** AIS_ViewController::GravityPoint ******/
		/****** md5 signature: 8c62140d10f0624c3042ec01021f9c63 ******/
		%feature("compactdefaultargs") GravityPoint;
		%feature("autodoc", "
Parameters
----------
theCtx: AIS_InteractiveContext
theView: V3d_View

Return
-------
gp_Pnt

Description
-----------
Compute rotation gravity center point depending on rotation mode. This method is expected to be called from rendering thread.
") GravityPoint;
		virtual gp_Pnt GravityPoint(const opencascade::handle<AIS_InteractiveContext> & theCtx, const opencascade::handle<V3d_View> & theView);

		/****** AIS_ViewController::HandleViewEvents ******/
		/****** md5 signature: e3784b7efd9bd39b5d26bbf04f33ae3d ******/
		%feature("compactdefaultargs") HandleViewEvents;
		%feature("autodoc", "
Parameters
----------
theCtx: AIS_InteractiveContext
theView: V3d_View

Return
-------
None

Description
-----------
Process events within rendering thread.
") HandleViewEvents;
		virtual void HandleViewEvents(const opencascade::handle<AIS_InteractiveContext> & theCtx, const opencascade::handle<V3d_View> & theView);

		/****** AIS_ViewController::HasPreviousMoveTo ******/
		/****** md5 signature: 3d9b6ec437ae40d62db4d05a38ce3745 ******/
		%feature("compactdefaultargs") HasPreviousMoveTo;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Return True if previous position of MoveTo has been defined.
") HasPreviousMoveTo;
		bool HasPreviousMoveTo();

		/****** AIS_ViewController::InputBuffer ******/
		/****** md5 signature: 0e66b64ea2254057a38ac6990d92e49f ******/
		%feature("compactdefaultargs") InputBuffer;
		%feature("autodoc", "
Parameters
----------
theType: AIS_ViewInputBufferType

Return
-------
AIS_ViewInputBuffer

Description
-----------
Return input buffer.
") InputBuffer;
		const AIS_ViewInputBuffer & InputBuffer(AIS_ViewInputBufferType theType);

		/****** AIS_ViewController::IsContinuousRedraw ******/
		/****** md5 signature: ebe0ac2e75e8c36daa1c62aa56049396 ******/
		%feature("compactdefaultargs") IsContinuousRedraw;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Return True if continuous redrawing is enabled; False by default. This option would request a next viewer frame to be completely redrawn right after current frame is finished.
") IsContinuousRedraw;
		bool IsContinuousRedraw();

		/****** AIS_ViewController::KeyDown ******/
		/****** md5 signature: b98bb6d6cbaac4c835580c59d79d3a46 ******/
		%feature("compactdefaultargs") KeyDown;
		%feature("autodoc", "
Parameters
----------
theKey: Aspect_VKey
theTime: double
thePressure: double (optional, default to 1.0)

Return
-------
None

Description
-----------
Press key. Default implementation updates internal cache. 
Parameter theKey key pressed 
Parameter theTime event timestamp.
") KeyDown;
		void KeyDown(Aspect_VKey theKey, double theTime, double thePressure = 1.0);

		/****** AIS_ViewController::KeyFromAxis ******/
		/****** md5 signature: a2d95811e4a96a5934c71cd541ed2a6e ******/
		%feature("compactdefaultargs") KeyFromAxis;
		%feature("autodoc", "
Parameters
----------
theNegative: Aspect_VKey
thePositive: Aspect_VKey
theTime: double
thePressure: double

Return
-------
None

Description
-----------
Simulate key up/down events from axis value. Default implementation updates internal cache.
") KeyFromAxis;
		void KeyFromAxis(Aspect_VKey theNegative, Aspect_VKey thePositive, double theTime, double thePressure);

		/****** AIS_ViewController::KeyUp ******/
		/****** md5 signature: caa9c6166a094db2ced6876d7a0e9b61 ******/
		%feature("compactdefaultargs") KeyUp;
		%feature("autodoc", "
Parameters
----------
theKey: Aspect_VKey
theTime: double

Return
-------
None

Description
-----------
Release key. Default implementation updates internal cache. 
Parameter theKey key pressed 
Parameter theTime event timestamp.
") KeyUp;
		void KeyUp(Aspect_VKey theKey, double theTime);

		/****** AIS_ViewController::MinZoomDistance ******/
		/****** md5 signature: 5bb7298fe9e97f5e9e5ab0365d634252 ******/
		%feature("compactdefaultargs") MinZoomDistance;
		%feature("autodoc", "Return
-------
double

Description
-----------
Return minimal camera distance for zoom operation.
") MinZoomDistance;
		double MinZoomDistance();

		/****** AIS_ViewController::MouseAcceleration ******/
		/****** md5 signature: f265598ba72b1915cecbb49edd0a9d81 ******/
		%feature("compactdefaultargs") MouseAcceleration;
		%feature("autodoc", "Return
-------
float

Description
-----------
Return mouse input acceleration ratio in First Person mode; 1.0 by default.
") MouseAcceleration;
		float MouseAcceleration();

		/****** AIS_ViewController::MouseDoubleClickInterval ******/
		/****** md5 signature: 0b1c8ccdce13f23e18102cc62c6b767a ******/
		%feature("compactdefaultargs") MouseDoubleClickInterval;
		%feature("autodoc", "Return
-------
double

Description
-----------
Return double click interval in seconds; 0.4 by default.
") MouseDoubleClickInterval;
		double MouseDoubleClickInterval();

		/****** AIS_ViewController::MouseGestureMap ******/
		/****** md5 signature: e0030eba5573c7e60957cd3f29db3726 ******/
		%feature("compactdefaultargs") MouseGestureMap;
		%feature("autodoc", "Return
-------
NCollection_DataMap<unsigned int, AIS_MouseGesture>

Description
-----------
Return map defining mouse gestures.
") MouseGestureMap;
		const NCollection_DataMap<unsigned int, AIS_MouseGesture> & MouseGestureMap();

		/****** AIS_ViewController::MouseSelectionSchemes ******/
		/****** md5 signature: 403234e1fc2d2963bfc1b0340f6a20d8 ******/
		%feature("compactdefaultargs") MouseSelectionSchemes;
		%feature("autodoc", "Return
-------
NCollection_DataMap<unsigned int, AIS_SelectionScheme>

Description
-----------
Return map defining mouse selection schemes.
") MouseSelectionSchemes;
		const NCollection_DataMap<unsigned int, AIS_SelectionScheme> & MouseSelectionSchemes();

		/****** AIS_ViewController::NavigationMode ******/
		/****** md5 signature: de20fce514777ce3a2a466778f462fc3 ******/
		%feature("compactdefaultargs") NavigationMode;
		%feature("autodoc", "Return
-------
AIS_NavigationMode

Description
-----------
Return camera navigation mode; AIS_NavigationMode_Orbit by default.
") NavigationMode;
		AIS_NavigationMode NavigationMode();

		/****** AIS_ViewController::ObjectsAnimation ******/
		/****** md5 signature: f84f413869b6320ac0352f35312f7fc9 ******/
		%feature("compactdefaultargs") ObjectsAnimation;
		%feature("autodoc", "Return
-------
opencascade::handle<AIS_Animation>

Description
-----------
Return objects animation; empty (but not NULL) animation by default.
") ObjectsAnimation;
		const opencascade::handle<AIS_Animation> & ObjectsAnimation();

		/****** AIS_ViewController::OnObjectDragged ******/
		/****** md5 signature: e3d03bd62923f7f609f4ff8690501efc ******/
		%feature("compactdefaultargs") OnObjectDragged;
		%feature("autodoc", "
Parameters
----------
theCtx: AIS_InteractiveContext
theView: V3d_View
theAction: AIS_DragAction

Return
-------
None

Description
-----------
Callback called by handleMoveTo() on dragging object in 3D Viewer. This method is expected to be called from rendering thread.
") OnObjectDragged;
		virtual void OnObjectDragged(const opencascade::handle<AIS_InteractiveContext> & theCtx, const opencascade::handle<V3d_View> & theView, AIS_DragAction theAction);

		/****** AIS_ViewController::OnSelectionChanged ******/
		/****** md5 signature: 19b94fd304dbfac300a34e45312cee94 ******/
		%feature("compactdefaultargs") OnSelectionChanged;
		%feature("autodoc", "
Parameters
----------
theCtx: AIS_InteractiveContext
theView: V3d_View

Return
-------
None

Description
-----------
Callback called by handleMoveTo() on Selection in 3D Viewer. This method is expected to be called from rendering thread.
") OnSelectionChanged;
		virtual void OnSelectionChanged(const opencascade::handle<AIS_InteractiveContext> & theCtx, const opencascade::handle<V3d_View> & theView);

		/****** AIS_ViewController::OnSubviewChanged ******/
		/****** md5 signature: 164823ba5741e132455aee7ed3e0374f ******/
		%feature("compactdefaultargs") OnSubviewChanged;
		%feature("autodoc", "
Parameters
----------
theCtx: AIS_InteractiveContext
theOldView: V3d_View
theNewView: V3d_View

Return
-------
None

Description
-----------
Callback called by HandleViewEvents() on Selection of another (sub)view. This method is expected to be called from rendering thread.
") OnSubviewChanged;
		virtual void OnSubviewChanged(const opencascade::handle<AIS_InteractiveContext> & theCtx, const opencascade::handle<V3d_View> & theOldView, const opencascade::handle<V3d_View> & theNewView);

		/****** AIS_ViewController::OrbitAcceleration ******/
		/****** md5 signature: da5f202aed945c1ea0545de4854049ae ******/
		%feature("compactdefaultargs") OrbitAcceleration;
		%feature("autodoc", "Return
-------
float

Description
-----------
Return orbit rotation acceleration ratio; 1.0 by default.
") OrbitAcceleration;
		float OrbitAcceleration();

		/****** AIS_ViewController::PickAxis ******/
		/****** md5 signature: 623ae1227bd809a63fcbddc49732d262 ******/
		%feature("compactdefaultargs") PickAxis;
		%feature("autodoc", "
Parameters
----------
theTopPnt: gp_Pnt
theCtx: AIS_InteractiveContext
theView: V3d_View
theAxis: gp_Ax1

Return
-------
bool

Description
-----------
Pick closest point by axis. This method is expected to be called from rendering thread. @param[out] theTopPnt result point 
Input parameter: theCtx interactive context 
Input parameter: theView active view 
Input parameter: theAxis selection axis 
Return: True if result has been found.
") PickAxis;
		virtual bool PickAxis(gp_Pnt & theTopPnt, const opencascade::handle<AIS_InteractiveContext> & theCtx, const opencascade::handle<V3d_View> & theView, const gp_Ax1 & theAxis);

		/****** AIS_ViewController::PickPoint ******/
		/****** md5 signature: 44f2d9921375b623b7aba57828fdc51b ******/
		%feature("compactdefaultargs") PickPoint;
		%feature("autodoc", "
Parameters
----------
thePnt: gp_Pnt
theCtx: AIS_InteractiveContext
theView: V3d_View
theCursor: NCollection_Vec2<int>
theToStickToPickRay: bool

Return
-------
bool

Description
-----------
Pick closest point under mouse cursor. This method is expected to be called from rendering thread. @param[out] thePnt result point 
Input parameter: theCtx interactive context 
Input parameter: theView active view 
Input parameter: theCursor mouse cursor 
Input parameter: theToStickToPickRay when True, the result point will lie on picking ray 
Return: True if result has been found.
") PickPoint;
		virtual bool PickPoint(gp_Pnt & thePnt, const opencascade::handle<AIS_InteractiveContext> & theCtx, const opencascade::handle<V3d_View> & theView, const NCollection_Vec2<int> & theCursor, bool theToStickToPickRay);

		/****** AIS_ViewController::PreviousMoveTo ******/
		/****** md5 signature: 943061652fab5d658d424e771ba9c319 ******/
		%feature("compactdefaultargs") PreviousMoveTo;
		%feature("autodoc", "Return
-------
NCollection_Vec2<int>

Description
-----------
Return previous position of MoveTo event in 3D viewer.
") PreviousMoveTo;
		const NCollection_Vec2<int> & PreviousMoveTo();

		/****** AIS_ViewController::ProcessClose ******/
		/****** md5 signature: f1a98d1c407e5e22763fcaf33cac7bc5 ******/
		%feature("compactdefaultargs") ProcessClose;
		%feature("autodoc", "Return
-------
None

Description
-----------
Handle window close event. Default implementation does nothing.
") ProcessClose;
		void ProcessClose();

		/****** AIS_ViewController::ProcessConfigure ******/
		/****** md5 signature: 23612082ffac07bb8c92fcc1043c1769 ******/
		%feature("compactdefaultargs") ProcessConfigure;
		%feature("autodoc", "
Parameters
----------
theIsResized: bool

Return
-------
None

Description
-----------
Handle window resize event. Default implementation does nothing.
") ProcessConfigure;
		void ProcessConfigure(bool theIsResized);

		/****** AIS_ViewController::ProcessExpose ******/
		/****** md5 signature: ec2b5848c3aa6d14cfe94ccca393c8e6 ******/
		%feature("compactdefaultargs") ProcessExpose;
		%feature("autodoc", "Return
-------
None

Description
-----------
Handle expose event (window content has been invalidation and should be redrawn). Default implementation does nothing.
") ProcessExpose;
		void ProcessExpose();

		/****** AIS_ViewController::ProcessFocus ******/
		/****** md5 signature: 89f6195435f7ab2b881a8d927f36a718 ******/
		%feature("compactdefaultargs") ProcessFocus;
		%feature("autodoc", "
Parameters
----------
theIsActivated: bool

Return
-------
None

Description
-----------
Handle focus event. Default implementation resets cached input state (pressed keys).
") ProcessFocus;
		void ProcessFocus(bool theIsActivated);

		/****** AIS_ViewController::ProcessInput ******/
		/****** md5 signature: 1089b0d110da3f8b67e43b79a1c5d726 ******/
		%feature("compactdefaultargs") ProcessInput;
		%feature("autodoc", "Return
-------
None

Description
-----------
Handle window input event immediately. Default implementation does nothing - input events are accumulated in internal buffer until explicit FlushViewEvents() call.
") ProcessInput;
		void ProcessInput();

		/****** AIS_ViewController::RemoveTouchPoint ******/
		/****** md5 signature: 5fec6cc98137abc82ad3c7df0831936d ******/
		%feature("compactdefaultargs") RemoveTouchPoint;
		%feature("autodoc", "
Parameters
----------
theId: size_t
theClearSelectPnts: bool (optional, default to false)

Return
-------
bool

Description
-----------
Remove touch point with the given ID. This method is expected to be called from UI thread. 
Parameter theId touch unique identifier 
Parameter theClearSelectPnts if True will initiate clearing of selection points 
Return: True if point has been removed.
") RemoveTouchPoint;
		bool RemoveTouchPoint(size_t theId, bool theClearSelectPnts = false);

		/****** AIS_ViewController::ResetPreviousMoveTo ******/
		/****** md5 signature: ff7cc9a520e1718b6fc18bc5f46cc8c2 ******/
		%feature("compactdefaultargs") ResetPreviousMoveTo;
		%feature("autodoc", "Return
-------
None

Description
-----------
Reset previous position of MoveTo.
") ResetPreviousMoveTo;
		void ResetPreviousMoveTo();

		/****** AIS_ViewController::ResetViewInput ******/
		/****** md5 signature: 62483d4c4a228ccac68e25645b87e1e9 ******/
		%feature("compactdefaultargs") ResetViewInput;
		%feature("autodoc", "Return
-------
None

Description
-----------
Reset input state (pressed keys, mouse buttons, etc.) e.g. on window focus loss. This method is expected to be called from UI thread.
") ResetViewInput;
		virtual void ResetViewInput();

		/****** AIS_ViewController::RotationMode ******/
		/****** md5 signature: fe28f5b4de6b6363de3be27ba9b18699 ******/
		%feature("compactdefaultargs") RotationMode;
		%feature("autodoc", "Return
-------
AIS_RotationMode

Description
-----------
Return camera rotation mode, AIS_RotationMode_BndBoxActive by default.
") RotationMode;
		AIS_RotationMode RotationMode();

		/****** AIS_ViewController::SelectInViewer ******/
		/****** md5 signature: 08168da7895c423952c7feafc5ddbd6b ******/
		%feature("compactdefaultargs") SelectInViewer;
		%feature("autodoc", "
Parameters
----------
thePnt: NCollection_Vec2<int>
theScheme: AIS_SelectionScheme (optional, default to AIS_SelectionScheme_Replace)

Return
-------
None

Description
-----------
Perform selection in 3D viewer. This method is expected to be called from UI thread. 
Parameter thePnt picking point 
Parameter theScheme selection scheme.
") SelectInViewer;
		virtual void SelectInViewer(const NCollection_Vec2<int> & thePnt, const AIS_SelectionScheme theScheme = AIS_SelectionScheme_Replace);

		/****** AIS_ViewController::SelectInViewer ******/
		/****** md5 signature: 59cf5c7b38c4d1c019429587e6d2c767 ******/
		%feature("compactdefaultargs") SelectInViewer;
		%feature("autodoc", "
Parameters
----------
thePnts: NCollection_Sequence<NCollection_Vec2<int>>
theScheme: AIS_SelectionScheme (optional, default to AIS_SelectionScheme_Replace)

Return
-------
None

Description
-----------
Perform selection in 3D viewer. This method is expected to be called from UI thread. 
Parameter thePnts picking point 
Parameter theScheme selection scheme.
") SelectInViewer;
		virtual void SelectInViewer(const NCollection_Sequence<NCollection_Vec2<int>> & thePnts, const AIS_SelectionScheme theScheme = AIS_SelectionScheme_Replace);

		/****** AIS_ViewController::SetAllowDragging ******/
		/****** md5 signature: df0d4841ca91c4e463f1b9ff172bb5a7 ******/
		%feature("compactdefaultargs") SetAllowDragging;
		%feature("autodoc", "
Parameters
----------
theToEnable: bool

Return
-------
None

Description
-----------
Set if dynamic highlight on mouse move is allowed.
") SetAllowDragging;
		void SetAllowDragging(bool theToEnable);

		/****** AIS_ViewController::SetAllowHighlight ******/
		/****** md5 signature: 6d086c23d765d930b39eb6604ea15be5 ******/
		%feature("compactdefaultargs") SetAllowHighlight;
		%feature("autodoc", "
Parameters
----------
theToEnable: bool

Return
-------
None

Description
-----------
Set if dragging object is allowed.
") SetAllowHighlight;
		void SetAllowHighlight(bool theToEnable);

		/****** AIS_ViewController::SetAllowPanning ******/
		/****** md5 signature: aa5e493b4b9d5ca7f79b1000442d464b ******/
		%feature("compactdefaultargs") SetAllowPanning;
		%feature("autodoc", "
Parameters
----------
theToEnable: bool

Return
-------
None

Description
-----------
Set if panning is allowed.
") SetAllowPanning;
		void SetAllowPanning(bool theToEnable);

		/****** AIS_ViewController::SetAllowRotation ******/
		/****** md5 signature: ac9fc6d418b04ff6ca20098169113ae9 ******/
		%feature("compactdefaultargs") SetAllowRotation;
		%feature("autodoc", "
Parameters
----------
theToEnable: bool

Return
-------
None

Description
-----------
Set if camera rotation is allowed.
") SetAllowRotation;
		void SetAllowRotation(bool theToEnable);

		/****** AIS_ViewController::SetAllowTouchZRotation ******/
		/****** md5 signature: 684a151d49f6470f151d7e9e10ae1b33 ******/
		%feature("compactdefaultargs") SetAllowTouchZRotation;
		%feature("autodoc", "
Parameters
----------
theToEnable: bool

Return
-------
None

Description
-----------
Set if z-rotation via two-touches gesture is enabled.
") SetAllowTouchZRotation;
		void SetAllowTouchZRotation(bool theToEnable);

		/****** AIS_ViewController::SetAllowZFocus ******/
		/****** md5 signature: eeb044a0780a3ac8322c4f5acfe6f70b ******/
		%feature("compactdefaultargs") SetAllowZFocus;
		%feature("autodoc", "
Parameters
----------
theToEnable: bool

Return
-------
None

Description
-----------
Set if ZFocus change is allowed.
") SetAllowZFocus;
		void SetAllowZFocus(bool theToEnable);

		/****** AIS_ViewController::SetAllowZooming ******/
		/****** md5 signature: 7baa92e6f17f9c36d0a5fa8f4ea8f5e4 ******/
		%feature("compactdefaultargs") SetAllowZooming;
		%feature("autodoc", "
Parameters
----------
theToEnable: bool

Return
-------
None

Description
-----------
Set if zooming is allowed.
") SetAllowZooming;
		void SetAllowZooming(bool theToEnable);

		/****** AIS_ViewController::SetContinuousRedraw ******/
		/****** md5 signature: 20b6590274368b0cc65949958df5306b ******/
		%feature("compactdefaultargs") SetContinuousRedraw;
		%feature("autodoc", "
Parameters
----------
theToEnable: bool

Return
-------
None

Description
-----------
Enable or disable continuous updates.
") SetContinuousRedraw;
		void SetContinuousRedraw(bool theToEnable);

		/****** AIS_ViewController::SetDisplayXRAuxDevices ******/
		/****** md5 signature: 135d6d3dee9bf55919790adaacc3d566 ******/
		%feature("compactdefaultargs") SetDisplayXRAuxDevices;
		%feature("autodoc", "
Parameters
----------
theToDisplay: bool

Return
-------
None

Description
-----------
Set if auxiliary tracked XR devices should be displayed.
") SetDisplayXRAuxDevices;
		void SetDisplayXRAuxDevices(bool theToDisplay);

		/****** AIS_ViewController::SetDisplayXRHands ******/
		/****** md5 signature: 825ac296237c4a1dfc7291d638be96fb ******/
		%feature("compactdefaultargs") SetDisplayXRHands;
		%feature("autodoc", "
Parameters
----------
theToDisplay: bool

Return
-------
None

Description
-----------
Set if tracked XR hand controllers should be displayed.
") SetDisplayXRHands;
		void SetDisplayXRHands(bool theToDisplay);

		/****** AIS_ViewController::SetInvertPitch ******/
		/****** md5 signature: 337a14fda31c3ddd9f94b558761281f5 ******/
		%feature("compactdefaultargs") SetInvertPitch;
		%feature("autodoc", "
Parameters
----------
theToInvert: bool

Return
-------
None

Description
-----------
Set flag inverting pitch direction.
") SetInvertPitch;
		void SetInvertPitch(bool theToInvert);

		/****** AIS_ViewController::SetLockOrbitZUp ******/
		/****** md5 signature: 1c3c112156d57b75190d046cf6bd0c46 ******/
		%feature("compactdefaultargs") SetLockOrbitZUp;
		%feature("autodoc", "
Parameters
----------
theToForceUp: bool

Return
-------
None

Description
-----------
Set if camera up orientation within AIS_NavigationMode_Orbit rotation mode should be forced Z up.
") SetLockOrbitZUp;
		void SetLockOrbitZUp(bool theToForceUp);

		/****** AIS_ViewController::SetMinZoomDistance ******/
		/****** md5 signature: 856c0547c4e27c0d164eba54a3f80e01 ******/
		%feature("compactdefaultargs") SetMinZoomDistance;
		%feature("autodoc", "
Parameters
----------
theDist: double

Return
-------
None

Description
-----------
Set minimal camera distance for zoom operation.
") SetMinZoomDistance;
		void SetMinZoomDistance(double theDist);

		/****** AIS_ViewController::SetMouseAcceleration ******/
		/****** md5 signature: abc78184a58362cc1aa6587b34de644d ******/
		%feature("compactdefaultargs") SetMouseAcceleration;
		%feature("autodoc", "
Parameters
----------
theRatio: float

Return
-------
None

Description
-----------
Set mouse input acceleration ratio.
") SetMouseAcceleration;
		void SetMouseAcceleration(float theRatio);

		/****** AIS_ViewController::SetMouseDoubleClickInterval ******/
		/****** md5 signature: 1f69fdc78277fa239a1443e52d9b3da6 ******/
		%feature("compactdefaultargs") SetMouseDoubleClickInterval;
		%feature("autodoc", "
Parameters
----------
theSeconds: double

Return
-------
None

Description
-----------
Set double click interval in seconds.
") SetMouseDoubleClickInterval;
		void SetMouseDoubleClickInterval(double theSeconds);

		/****** AIS_ViewController::SetNavigationMode ******/
		/****** md5 signature: e565c8b8b89295a6fb623e32ef593592 ******/
		%feature("compactdefaultargs") SetNavigationMode;
		%feature("autodoc", "
Parameters
----------
theMode: AIS_NavigationMode

Return
-------
None

Description
-----------
Set camera navigation mode.
") SetNavigationMode;
		void SetNavigationMode(AIS_NavigationMode theMode);

		/****** AIS_ViewController::SetObjectsAnimation ******/
		/****** md5 signature: 88f1b826298874a96efd29de754191e5 ******/
		%feature("compactdefaultargs") SetObjectsAnimation;
		%feature("autodoc", "
Parameters
----------
theAnimation: AIS_Animation

Return
-------
None

Description
-----------
Set object animation to be handled within handleViewRedraw().
") SetObjectsAnimation;
		void SetObjectsAnimation(const opencascade::handle<AIS_Animation> & theAnimation);

		/****** AIS_ViewController::SetOrbitAcceleration ******/
		/****** md5 signature: d9ccb4db2cbf77b5f312c630bd8dcdd6 ******/
		%feature("compactdefaultargs") SetOrbitAcceleration;
		%feature("autodoc", "
Parameters
----------
theRatio: float

Return
-------
None

Description
-----------
Set orbit rotation acceleration ratio.
") SetOrbitAcceleration;
		void SetOrbitAcceleration(float theRatio);

		/****** AIS_ViewController::SetPauseObjectsAnimation ******/
		/****** md5 signature: 53643e467565b04cd522841842d5380d ******/
		%feature("compactdefaultargs") SetPauseObjectsAnimation;
		%feature("autodoc", "
Parameters
----------
theToPause: bool

Return
-------
None

Description
-----------
Set if object animation should be paused on mouse click.
") SetPauseObjectsAnimation;
		void SetPauseObjectsAnimation(bool theToPause);

		/****** AIS_ViewController::SetRotationMode ******/
		/****** md5 signature: de089ee21b8924d75e03a45a58b75511 ******/
		%feature("compactdefaultargs") SetRotationMode;
		%feature("autodoc", "
Parameters
----------
theMode: AIS_RotationMode

Return
-------
None

Description
-----------
Set camera rotation mode.
") SetRotationMode;
		void SetRotationMode(AIS_RotationMode theMode);

		/****** AIS_ViewController::SetShowPanAnchorPoint ******/
		/****** md5 signature: c1af13270fbfe0d32ee0d908aeb118b4 ******/
		%feature("compactdefaultargs") SetShowPanAnchorPoint;
		%feature("autodoc", "
Parameters
----------
theToShow: bool

Return
-------
None

Description
-----------
Set if panning anchor point within perspective projection should be displayed in 3D Viewer.
") SetShowPanAnchorPoint;
		void SetShowPanAnchorPoint(bool theToShow);

		/****** AIS_ViewController::SetShowRotateCenter ******/
		/****** md5 signature: b6a34589631dfba5576c50d2bede4383 ******/
		%feature("compactdefaultargs") SetShowRotateCenter;
		%feature("autodoc", "
Parameters
----------
theToShow: bool

Return
-------
None

Description
-----------
Set if rotation point should be displayed in 3D Viewer.
") SetShowRotateCenter;
		void SetShowRotateCenter(bool theToShow);

		/****** AIS_ViewController::SetStickToRayOnRotation ******/
		/****** md5 signature: cf3fd759c29403514df6afecf8051399 ******/
		%feature("compactdefaultargs") SetStickToRayOnRotation;
		%feature("autodoc", "
Parameters
----------
theToEnable: bool

Return
-------
None

Description
-----------
Set if picked point should be projected to picking ray on rotating around point.
") SetStickToRayOnRotation;
		void SetStickToRayOnRotation(bool theToEnable);

		/****** AIS_ViewController::SetStickToRayOnZoom ******/
		/****** md5 signature: d25c6b1a39106d29c25ccf77ad2a69b8 ******/
		%feature("compactdefaultargs") SetStickToRayOnZoom;
		%feature("autodoc", "
Parameters
----------
theToEnable: bool

Return
-------
None

Description
-----------
Set if picked point should be projected to picking ray on zooming at point.
") SetStickToRayOnZoom;
		void SetStickToRayOnZoom(bool theToEnable);

		/****** AIS_ViewController::SetThrustSpeed ******/
		/****** md5 signature: b13ce9ef3d785307e809621923941346 ******/
		%feature("compactdefaultargs") SetThrustSpeed;
		%feature("autodoc", "
Parameters
----------
theSpeed: float

Return
-------
None

Description
-----------
Set active thrust value.
") SetThrustSpeed;
		void SetThrustSpeed(float theSpeed);

		/****** AIS_ViewController::SetTouchToleranceScale ******/
		/****** md5 signature: f1ade41663fe131af4ad6d54d8feebdb ******/
		%feature("compactdefaultargs") SetTouchToleranceScale;
		%feature("autodoc", "
Parameters
----------
theTolerance: float

Return
-------
None

Description
-----------
Set scale factor for adjusting tolerances for starting multi-touch gestures.
") SetTouchToleranceScale;
		void SetTouchToleranceScale(float theTolerance);

		/****** AIS_ViewController::SetViewAnimation ******/
		/****** md5 signature: 853aa0ceb7bdaa632922e5e8afd4812f ******/
		%feature("compactdefaultargs") SetViewAnimation;
		%feature("autodoc", "
Parameters
----------
theAnimation: AIS_AnimationCamera

Return
-------
None

Description
-----------
Set view animation to be handled within handleViewRedraw().
") SetViewAnimation;
		void SetViewAnimation(const opencascade::handle<AIS_AnimationCamera> & theAnimation);

		/****** AIS_ViewController::SetWalkSpeedAbsolute ******/
		/****** md5 signature: d26b13370b725b71536c89f45bb23923 ******/
		%feature("compactdefaultargs") SetWalkSpeedAbsolute;
		%feature("autodoc", "
Parameters
----------
theSpeed: float

Return
-------
None

Description
-----------
Set normal walking speed, in m/s; 1.5 by default.
") SetWalkSpeedAbsolute;
		void SetWalkSpeedAbsolute(float theSpeed);

		/****** AIS_ViewController::SetWalkSpeedRelative ******/
		/****** md5 signature: c00c0ed676f960255bca7849164d38e7 ******/
		%feature("compactdefaultargs") SetWalkSpeedRelative;
		%feature("autodoc", "
Parameters
----------
theFactor: float

Return
-------
None

Description
-----------
Set walking speed relative to scene bounding box.
") SetWalkSpeedRelative;
		void SetWalkSpeedRelative(float theFactor);

		/****** AIS_ViewController::ThrustSpeed ******/
		/****** md5 signature: 6ebe02e681cce532322afaeb747648ca ******/
		%feature("compactdefaultargs") ThrustSpeed;
		%feature("autodoc", "Return
-------
float

Description
-----------
Return active thrust value; 0.0f by default.
") ThrustSpeed;
		float ThrustSpeed();

		/****** AIS_ViewController::ToAllowDragging ******/
		/****** md5 signature: 8a61183f21fcf283f340eec4ff8531b8 ******/
		%feature("compactdefaultargs") ToAllowDragging;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Return True if dragging object is allowed; True by default.
") ToAllowDragging;
		bool ToAllowDragging();

		/****** AIS_ViewController::ToAllowHighlight ******/
		/****** md5 signature: 3e9876722280e384f00f5556d90c68eb ******/
		%feature("compactdefaultargs") ToAllowHighlight;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Return True if dynamic highlight on mouse move is allowed; True by default.
") ToAllowHighlight;
		bool ToAllowHighlight();

		/****** AIS_ViewController::ToAllowPanning ******/
		/****** md5 signature: d8724d20df71f79fe860bda14e35bbb5 ******/
		%feature("compactdefaultargs") ToAllowPanning;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Return True if panning is allowed; True by default.
") ToAllowPanning;
		bool ToAllowPanning();

		/****** AIS_ViewController::ToAllowRotation ******/
		/****** md5 signature: a1bcfb6f1a894b15467dc8feabcaa19b ******/
		%feature("compactdefaultargs") ToAllowRotation;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Return True if camera rotation is allowed; True by default.
") ToAllowRotation;
		bool ToAllowRotation();

		/****** AIS_ViewController::ToAllowTouchZRotation ******/
		/****** md5 signature: 7b12f77923cf330922234a4f6873992c ******/
		%feature("compactdefaultargs") ToAllowTouchZRotation;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Return True if z-rotation via two-touches gesture is enabled; False by default.
") ToAllowTouchZRotation;
		bool ToAllowTouchZRotation();

		/****** AIS_ViewController::ToAllowZFocus ******/
		/****** md5 signature: 4988d4b63afb784a57e53295d9a3de30 ******/
		%feature("compactdefaultargs") ToAllowZFocus;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Return True if ZFocus change is allowed; True by default.
") ToAllowZFocus;
		bool ToAllowZFocus();

		/****** AIS_ViewController::ToAllowZooming ******/
		/****** md5 signature: ca4ee2f5af27be92a7253af8446350d8 ******/
		%feature("compactdefaultargs") ToAllowZooming;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Return True if zooming is allowed; True by default.
") ToAllowZooming;
		bool ToAllowZooming();

		/****** AIS_ViewController::ToDisplayXRAuxDevices ******/
		/****** md5 signature: e137eeb702d3133925ef9a160665f27c ******/
		%feature("compactdefaultargs") ToDisplayXRAuxDevices;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Return True to display auxiliary tracked XR devices (like tracking stations).
") ToDisplayXRAuxDevices;
		bool ToDisplayXRAuxDevices();

		/****** AIS_ViewController::ToDisplayXRHands ******/
		/****** md5 signature: 32934f4d9a3a4c676a42438dfb298124 ******/
		%feature("compactdefaultargs") ToDisplayXRHands;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Return True to display XR hand controllers.
") ToDisplayXRHands;
		bool ToDisplayXRHands();

		/****** AIS_ViewController::ToInvertPitch ******/
		/****** md5 signature: 624a70a882a963f2b6dcf003ebe66984 ******/
		%feature("compactdefaultargs") ToInvertPitch;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Return True if pitch direction should be inverted while processing Aspect_VKey_NavLookUp/Aspect_VKey_NavLookDown; False by default.
") ToInvertPitch;
		bool ToInvertPitch();

		/****** AIS_ViewController::ToLockOrbitZUp ******/
		/****** md5 signature: 98161f7200cec34fa1a5e0418649145f ******/
		%feature("compactdefaultargs") ToLockOrbitZUp;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Return True if camera up orientation within AIS_NavigationMode_Orbit rotation mode should be forced Z up; False by default.
") ToLockOrbitZUp;
		bool ToLockOrbitZUp();

		/****** AIS_ViewController::ToPauseObjectsAnimation ******/
		/****** md5 signature: 9eebb76fd53450abfb9c1f0883f9c02a ******/
		%feature("compactdefaultargs") ToPauseObjectsAnimation;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Return True if object animation should be paused on mouse click; False by default.
") ToPauseObjectsAnimation;
		bool ToPauseObjectsAnimation();

		/****** AIS_ViewController::ToShowPanAnchorPoint ******/
		/****** md5 signature: 20019a5af0a5a60f6ba338d642a2d2b0 ******/
		%feature("compactdefaultargs") ToShowPanAnchorPoint;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Return True if panning anchor point within perspective projection should be displayed in 3D Viewer; True by default.
") ToShowPanAnchorPoint;
		bool ToShowPanAnchorPoint();

		/****** AIS_ViewController::ToShowRotateCenter ******/
		/****** md5 signature: afbcbc8bef4febc944526842afc0655f ******/
		%feature("compactdefaultargs") ToShowRotateCenter;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Return True if rotation point should be displayed in 3D Viewer; True by default.
") ToShowRotateCenter;
		bool ToShowRotateCenter();

		/****** AIS_ViewController::ToStickToRayOnRotation ******/
		/****** md5 signature: dadbc81c3708872fefe8c3ec144bd235 ******/
		%feature("compactdefaultargs") ToStickToRayOnRotation;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Return True if picked point should be projected to picking ray on rotating around point; True by default.
") ToStickToRayOnRotation;
		bool ToStickToRayOnRotation();

		/****** AIS_ViewController::ToStickToRayOnZoom ******/
		/****** md5 signature: eaf01e1ef26d6069928f6489ab0a8c8b ******/
		%feature("compactdefaultargs") ToStickToRayOnZoom;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Return True if picked point should be projected to picking ray on zooming at point; True by default.
") ToStickToRayOnZoom;
		bool ToStickToRayOnZoom();

		/****** AIS_ViewController::TouchToleranceScale ******/
		/****** md5 signature: 2f6188968f83596542ec90be7549c9c6 ******/
		%feature("compactdefaultargs") TouchToleranceScale;
		%feature("autodoc", "Return
-------
float

Description
-----------
Return scale factor for adjusting tolerances for starting multi-touch gestures; 1.0 by default This scale factor is expected to be computed from touch screen resolution.
") TouchToleranceScale;
		float TouchToleranceScale();

		/****** AIS_ViewController::Update3dMouse ******/
		/****** md5 signature: bf7d2361269e5f7ad4a7a0a364da9997 ******/
		%feature("compactdefaultargs") Update3dMouse;
		%feature("autodoc", "
Parameters
----------
theEvent: WNT_HIDSpaceMouse

Return
-------
bool

Description
-----------
Process 3d mouse input event (redirects to translation, rotation and keys).
") Update3dMouse;
		bool Update3dMouse(const WNT_HIDSpaceMouse & theEvent);

		/****** AIS_ViewController::UpdateMouseButtons ******/
		/****** md5 signature: 4f94f54082c4999f3276bb60227db5b9 ******/
		%feature("compactdefaultargs") UpdateMouseButtons;
		%feature("autodoc", "
Parameters
----------
thePoint: NCollection_Vec2<int>
theButtons: Aspect_VKeyMouse
theModifiers: Aspect_VKeyFlags
theIsEmulated: bool

Return
-------
bool

Description
-----------
Handle mouse button press/release event. This method is expected to be called from UI thread. 
Parameter thePoint mouse cursor position 
Parameter theButtons pressed buttons 
Parameter theModifiers key modifiers 
Parameter theIsEmulated if True then mouse event comes NOT from real mouse  but emulated from non-precise input like touch on screen 
Return: True if View should be redrawn.
") UpdateMouseButtons;
		bool UpdateMouseButtons(const NCollection_Vec2<int> & thePoint, Aspect_VKeyMouse theButtons, Aspect_VKeyFlags theModifiers, bool theIsEmulated);

		/****** AIS_ViewController::UpdateMouseClick ******/
		/****** md5 signature: f9256af38a59d3a80ebc4a350d68a10f ******/
		%feature("compactdefaultargs") UpdateMouseClick;
		%feature("autodoc", "
Parameters
----------
thePoint: NCollection_Vec2<int>
theButton: Aspect_VKeyMouse
theModifiers: Aspect_VKeyFlags
theIsDoubleClick: bool

Return
-------
bool

Description
-----------
Handle mouse button click event (emulated by UpdateMouseButtons() while releasing single button). Note that as this method is called by UpdateMouseButtons(), it should be executed from UI thread. Default implementation redirects to SelectInViewer(). This method is expected to be called from UI thread. 
Parameter thePoint mouse cursor position 
Parameter theButton clicked button 
Parameter theModifiers key modifiers 
Parameter theIsDoubleClick flag indicating double mouse click 
Return: True if View should be redrawn.
") UpdateMouseClick;
		virtual bool UpdateMouseClick(const NCollection_Vec2<int> & thePoint, Aspect_VKeyMouse theButton, Aspect_VKeyFlags theModifiers, bool theIsDoubleClick);

		/****** AIS_ViewController::UpdateMousePosition ******/
		/****** md5 signature: 8c09263e171cbe013475d2423ee1f3b1 ******/
		%feature("compactdefaultargs") UpdateMousePosition;
		%feature("autodoc", "
Parameters
----------
thePoint: NCollection_Vec2<int>
theButtons: Aspect_VKeyMouse
theModifiers: Aspect_VKeyFlags
theIsEmulated: bool

Return
-------
bool

Description
-----------
Handle mouse cursor movement event. This method is expected to be called from UI thread. 
Parameter thePoint mouse cursor position 
Parameter theButtons pressed buttons 
Parameter theModifiers key modifiers 
Parameter theIsEmulated if True then mouse event comes NOT from real mouse  but emulated from non-precise input like touch on screen 
Return: True if View should be redrawn.
") UpdateMousePosition;
		bool UpdateMousePosition(const NCollection_Vec2<int> & thePoint, Aspect_VKeyMouse theButtons, Aspect_VKeyFlags theModifiers, bool theIsEmulated);

		/****** AIS_ViewController::UpdateMouseScroll ******/
		/****** md5 signature: 7a79906076d2df39d236cfa2fffa7228 ******/
		%feature("compactdefaultargs") UpdateMouseScroll;
		%feature("autodoc", "
Parameters
----------
theDelta: Aspect_ScrollDelta

Return
-------
bool

Description
-----------
Update mouse scroll event; redirects to UpdateZoom by default. This method is expected to be called from UI thread. 
Parameter theDelta mouse cursor position and delta 
Return: True if new event has been created or False if existing one has been updated.
") UpdateMouseScroll;
		bool UpdateMouseScroll(const Aspect_ScrollDelta & theDelta);

		/****** AIS_ViewController::UpdatePolySelection ******/
		/****** md5 signature: d783ddbc9ce0b49fc13afab6d4020eb0 ******/
		%feature("compactdefaultargs") UpdatePolySelection;
		%feature("autodoc", "
Parameters
----------
thePnt: NCollection_Vec2<int>
theToAppend: bool

Return
-------
None

Description
-----------
Update polygonal selection tool. This method is expected to be called from UI thread. 
Parameter thePnt new point to add to polygon 
Parameter theToAppend append new point or update the last point.
") UpdatePolySelection;
		virtual void UpdatePolySelection(const NCollection_Vec2<int> & thePnt, bool theToAppend);

		/****** AIS_ViewController::UpdateRubberBand ******/
		/****** md5 signature: 03c5ca1212b28e1da09b021c9edf7b1d ******/
		%feature("compactdefaultargs") UpdateRubberBand;
		%feature("autodoc", "
Parameters
----------
thePntFrom: NCollection_Vec2<int>
thePntTo: NCollection_Vec2<int>

Return
-------
None

Description
-----------
Update rectangle selection tool. This method is expected to be called from UI thread. 
Parameter thePntFrom rectangle first corner 
Parameter thePntTo rectangle another corner.
") UpdateRubberBand;
		virtual void UpdateRubberBand(const NCollection_Vec2<int> & thePntFrom, const NCollection_Vec2<int> & thePntTo);

		/****** AIS_ViewController::UpdateTouchPoint ******/
		/****** md5 signature: 5cea94abca6fd851482fadc86f6df504 ******/
		%feature("compactdefaultargs") UpdateTouchPoint;
		%feature("autodoc", "
Parameters
----------
theId: size_t
thePnt: NCollection_Vec2<double>

Return
-------
None

Description
-----------
Update touch point with the given ID. If point with specified ID was not registered before, it will be added. This method is expected to be called from UI thread. 
Parameter theId touch unique identifier 
Parameter thePnt touch coordinates.
") UpdateTouchPoint;
		void UpdateTouchPoint(size_t theId, const NCollection_Vec2<double> & thePnt);

		/****** AIS_ViewController::UpdateViewOrientation ******/
		/****** md5 signature: ee43c806e8949e02b969471967206777 ******/
		%feature("compactdefaultargs") UpdateViewOrientation;
		%feature("autodoc", "
Parameters
----------
theOrientation: V3d_TypeOfOrientation
theToFitAll: bool

Return
-------
None

Description
-----------
Reset view orientation. This method is expected to be called from UI thread.
") UpdateViewOrientation;
		virtual void UpdateViewOrientation(V3d_TypeOfOrientation theOrientation, bool theToFitAll);

		/****** AIS_ViewController::UpdateZRotation ******/
		/****** md5 signature: 49c10fcd9e41eb2b1119a794084480d6 ******/
		%feature("compactdefaultargs") UpdateZRotation;
		%feature("autodoc", "
Parameters
----------
theAngle: double

Return
-------
bool

Description
-----------
Update Z rotation event. 
Parameter theAngle rotation angle, in radians. 
Return: True if new zoom event has been created or False if existing one has been updated.
") UpdateZRotation;
		virtual bool UpdateZRotation(double theAngle);

		/****** AIS_ViewController::UpdateZoom ******/
		/****** md5 signature: 3705bb839abd1b717b4e19145bbe8168 ******/
		%feature("compactdefaultargs") UpdateZoom;
		%feature("autodoc", "
Parameters
----------
theDelta: Aspect_ScrollDelta

Return
-------
bool

Description
-----------
Update zoom event (e.g. from mouse scroll). This method is expected to be called from UI thread. 
Parameter theDelta mouse cursor position to zoom at and zoom delta 
Return: True if new zoom event has been created or False if existing one has been updated.
") UpdateZoom;
		virtual bool UpdateZoom(const Aspect_ScrollDelta & theDelta);

		/****** AIS_ViewController::ViewAnimation ******/
		/****** md5 signature: 7a7517bd1c0e55fdc5279dc1aefd5047 ******/
		%feature("compactdefaultargs") ViewAnimation;
		%feature("autodoc", "Return
-------
opencascade::handle<AIS_AnimationCamera>

Description
-----------
Return view animation; empty (but not NULL) animation by default.
") ViewAnimation;
		const opencascade::handle<AIS_AnimationCamera> & ViewAnimation();

		/****** AIS_ViewController::WalkSpeedAbsolute ******/
		/****** md5 signature: 63209822e3eecea23c4ff51f6e7af537 ******/
		%feature("compactdefaultargs") WalkSpeedAbsolute;
		%feature("autodoc", "Return
-------
float

Description
-----------
Return normal walking speed, in m/s; 1.5 by default.
") WalkSpeedAbsolute;
		float WalkSpeedAbsolute();

		/****** AIS_ViewController::WalkSpeedRelative ******/
		/****** md5 signature: 907dc8d9c54a4795e102f9cf3c6361ac ******/
		%feature("compactdefaultargs") WalkSpeedRelative;
		%feature("autodoc", "Return
-------
float

Description
-----------
Return walking speed relative to scene bounding box; 0.1 by default.
") WalkSpeedRelative;
		float WalkSpeedRelative();

		/****** AIS_ViewController::handleCameraActions ******/
		/****** md5 signature: e26067a98b91986866681c1bcad0d809 ******/
		%feature("compactdefaultargs") handleCameraActions;
		%feature("autodoc", "
Parameters
----------
theCtx: AIS_InteractiveContext
theView: V3d_View
theWalk: AIS_WalkDelta

Return
-------
None

Description
-----------
Perform immediate camera actions (rotate/zoom/pan) on gesture progress. This method is expected to be called from rendering thread.
") handleCameraActions;
		virtual void handleCameraActions(const opencascade::handle<AIS_InteractiveContext> & theCtx, const opencascade::handle<V3d_View> & theView, const AIS_WalkDelta & theWalk);

		/****** AIS_ViewController::handleMoveTo ******/
		/****** md5 signature: bd30701597ebc33e344bb6c177211a48 ******/
		%feature("compactdefaultargs") handleMoveTo;
		%feature("autodoc", "
Parameters
----------
theCtx: AIS_InteractiveContext
theView: V3d_View

Return
-------
None

Description
-----------
Perform moveto/selection/dragging. This method is expected to be called from rendering thread.
") handleMoveTo;
		virtual void handleMoveTo(const opencascade::handle<AIS_InteractiveContext> & theCtx, const opencascade::handle<V3d_View> & theView);

		/****** AIS_ViewController::handleNavigationKeys ******/
		/****** md5 signature: feb7561777c3adef83227bc5f492cd66 ******/
		%feature("compactdefaultargs") handleNavigationKeys;
		%feature("autodoc", "
Parameters
----------
theCtx: AIS_InteractiveContext
theView: V3d_View

Return
-------
AIS_WalkDelta

Description
-----------
Perform navigation (Aspect_VKey_NavForward and similar keys). This method is expected to be called from rendering thread.
") handleNavigationKeys;
		virtual AIS_WalkDelta handleNavigationKeys(const opencascade::handle<AIS_InteractiveContext> & theCtx, const opencascade::handle<V3d_View> & theView);

		/****** AIS_ViewController::handleOrbitRotation ******/
		/****** md5 signature: fdc3bbd840949a270881f6aa0f2931a7 ******/
		%feature("compactdefaultargs") handleOrbitRotation;
		%feature("autodoc", "
Parameters
----------
theView: V3d_View
thePnt: gp_Pnt
theToLockZUp: bool

Return
-------
None

Description
-----------
Handle orbital rotation events myGL.OrbitRotation. 
Parameter theView view to modify 
Parameter thePnt 3D point to rotate around 
Parameter theToLockZUp amend camera to exclude roll angle (put camera Up vector to plane containing global Z and view direction).
") handleOrbitRotation;
		virtual void handleOrbitRotation(const opencascade::handle<V3d_View> & theView, const gp_Pnt & thePnt, bool theToLockZUp);

		/****** AIS_ViewController::handlePanning ******/
		/****** md5 signature: 5887c49a23a711bd97b00a82a72bab5a ******/
		%feature("compactdefaultargs") handlePanning;
		%feature("autodoc", "
Parameters
----------
theView: V3d_View

Return
-------
None

Description
-----------
Handle panning event myGL.Panning.
") handlePanning;
		virtual void handlePanning(const opencascade::handle<V3d_View> & theView);

		/****** AIS_ViewController::handleViewOrientationKeys ******/
		/****** md5 signature: fc827e821ed2c2644d0bb5ebfb306f4c ******/
		%feature("compactdefaultargs") handleViewOrientationKeys;
		%feature("autodoc", "
Parameters
----------
theCtx: AIS_InteractiveContext
theView: V3d_View

Return
-------
None

Description
-----------
Handle hot-keys defining new camera orientation (Aspect_VKey_ViewTop and similar keys). Default implementation starts an animated transaction from the current to the target camera orientation, when specific action key was pressed. This method is expected to be called from rendering thread.
") handleViewOrientationKeys;
		virtual void handleViewOrientationKeys(const opencascade::handle<AIS_InteractiveContext> & theCtx, const opencascade::handle<V3d_View> & theView);

		/****** AIS_ViewController::handleViewRedraw ******/
		/****** md5 signature: 6fd13d07572584fe70e21b27775870be ******/
		%feature("compactdefaultargs") handleViewRedraw;
		%feature("autodoc", "
Parameters
----------
theCtx: AIS_InteractiveContext
theView: V3d_View

Return
-------
None

Description
-----------
Handle view redraw. This method is expected to be called from rendering thread.
") handleViewRedraw;
		virtual void handleViewRedraw(const opencascade::handle<AIS_InteractiveContext> & theCtx, const opencascade::handle<V3d_View> & theView);

		/****** AIS_ViewController::handleViewRotation ******/
		/****** md5 signature: f2f90628551efd3f46dcbe83213380f1 ******/
		%feature("compactdefaultargs") handleViewRotation;
		%feature("autodoc", "
Parameters
----------
theView: V3d_View
theYawExtra: double
thePitchExtra: double
theRoll: double
theToRestartOnIncrement: bool

Return
-------
None

Description
-----------
Handle view direction rotation events myGL.ViewRotation. This method is expected to be called from rendering thread. 
Parameter theView camera to modify 
Parameter theYawExtra extra yaw increment 
Parameter thePitchExtra extra pitch increment 
Parameter theRoll roll value 
Parameter theToRestartOnIncrement flag indicating flight mode.
") handleViewRotation;
		virtual void handleViewRotation(const opencascade::handle<V3d_View> & theView, double theYawExtra, double thePitchExtra, double theRoll, bool theToRestartOnIncrement);

		/****** AIS_ViewController::handleXRHighlight ******/
		/****** md5 signature: 8a713c5e7e4c6abab9d9e3fae9bcf71f ******/
		%feature("compactdefaultargs") handleXRHighlight;
		%feature("autodoc", "
Parameters
----------
theCtx: AIS_InteractiveContext
theView: V3d_View

Return
-------
None

Description
-----------
Perform dynamic highlighting for active hand.
") handleXRHighlight;
		virtual void handleXRHighlight(const opencascade::handle<AIS_InteractiveContext> & theCtx, const opencascade::handle<V3d_View> & theView);

		/****** AIS_ViewController::handleXRInput ******/
		/****** md5 signature: 1e6d90c7e0207002712ad7ee00652514 ******/
		%feature("compactdefaultargs") handleXRInput;
		%feature("autodoc", "
Parameters
----------
theCtx: AIS_InteractiveContext
theView: V3d_View
theWalk: AIS_WalkDelta

Return
-------
None

Description
-----------
Perform XR input. This method is expected to be called from rendering thread.
") handleXRInput;
		virtual void handleXRInput(const opencascade::handle<AIS_InteractiveContext> & theCtx, const opencascade::handle<V3d_View> & theView, const AIS_WalkDelta & theWalk);

		/****** AIS_ViewController::handleXRMoveTo ******/
		/****** md5 signature: 955097332dc07a7237c0e69ecc07dcba ******/
		%feature("compactdefaultargs") handleXRMoveTo;
		%feature("autodoc", "
Parameters
----------
theCtx: AIS_InteractiveContext
theView: V3d_View
thePose: gp_Trsf
theToHighlight: bool

Return
-------
int

Description
-----------
Perform picking with/without dynamic highlighting for XR pose.
") handleXRMoveTo;
		virtual int handleXRMoveTo(const opencascade::handle<AIS_InteractiveContext> & theCtx, const opencascade::handle<V3d_View> & theView, const gp_Trsf & thePose, const bool theToHighlight);

		/****** AIS_ViewController::handleXRPicking ******/
		/****** md5 signature: 222444cb5c4cdef1d3a6bfb12966c890 ******/
		%feature("compactdefaultargs") handleXRPicking;
		%feature("autodoc", "
Parameters
----------
theCtx: AIS_InteractiveContext
theView: V3d_View

Return
-------
None

Description
-----------
Handle picking on trigger click.
") handleXRPicking;
		virtual void handleXRPicking(const opencascade::handle<AIS_InteractiveContext> & theCtx, const opencascade::handle<V3d_View> & theView);

		/****** AIS_ViewController::handleXRPresentations ******/
		/****** md5 signature: efc9157b2e2753d08637e420750d902a ******/
		%feature("compactdefaultargs") handleXRPresentations;
		%feature("autodoc", "
Parameters
----------
theCtx: AIS_InteractiveContext
theView: V3d_View

Return
-------
None

Description
-----------
Display auxiliary XR presentations.
") handleXRPresentations;
		virtual void handleXRPresentations(const opencascade::handle<AIS_InteractiveContext> & theCtx, const opencascade::handle<V3d_View> & theView);

		/****** AIS_ViewController::handleXRTeleport ******/
		/****** md5 signature: b4e260f3ccbacea0758813222d07c62e ******/
		%feature("compactdefaultargs") handleXRTeleport;
		%feature("autodoc", "
Parameters
----------
theCtx: AIS_InteractiveContext
theView: V3d_View

Return
-------
None

Description
-----------
Handle trackpad teleportation action.
") handleXRTeleport;
		virtual void handleXRTeleport(const opencascade::handle<AIS_InteractiveContext> & theCtx, const opencascade::handle<V3d_View> & theView);

		/****** AIS_ViewController::handleXRTurnPad ******/
		/****** md5 signature: e830480d597b887ce8a335727dbd86c7 ******/
		%feature("compactdefaultargs") handleXRTurnPad;
		%feature("autodoc", "
Parameters
----------
theCtx: AIS_InteractiveContext
theView: V3d_View

Return
-------
None

Description
-----------
Handle trackpad view turn action.
") handleXRTurnPad;
		virtual void handleXRTurnPad(const opencascade::handle<AIS_InteractiveContext> & theCtx, const opencascade::handle<V3d_View> & theView);

		/****** AIS_ViewController::handleZFocusScroll ******/
		/****** md5 signature: 4d7ba821266f7b764f51666a67a2da46 ******/
		%feature("compactdefaultargs") handleZFocusScroll;
		%feature("autodoc", "
Parameters
----------
theView: V3d_View
theParams: Aspect_ScrollDelta

Return
-------
None

Description
-----------
Handle ZScroll event myGL.ZoomActions. This method is expected to be called from rendering thread.
") handleZFocusScroll;
		virtual void handleZFocusScroll(const opencascade::handle<V3d_View> & theView, const Aspect_ScrollDelta & theParams);

		/****** AIS_ViewController::handleZRotate ******/
		/****** md5 signature: 4a013b1ad2e9ee9774ef44523b4a6532 ******/
		%feature("compactdefaultargs") handleZRotate;
		%feature("autodoc", "
Parameters
----------
theView: V3d_View

Return
-------
None

Description
-----------
Handle Z rotation event myGL.ZRotate.
") handleZRotate;
		virtual void handleZRotate(const opencascade::handle<V3d_View> & theView);

		/****** AIS_ViewController::handleZoom ******/
		/****** md5 signature: 0e123a7c7df5a4e2cce136990e950a04 ******/
		%feature("compactdefaultargs") handleZoom;
		%feature("autodoc", "
Parameters
----------
theView: V3d_View
theParams: Aspect_ScrollDelta
thePnt: gp_Pnt *

Return
-------
None

Description
-----------
Handle zoom event myGL.ZoomActions. This method is expected to be called from rendering thread.
") handleZoom;
		virtual void handleZoom(const opencascade::handle<V3d_View> & theView, const Aspect_ScrollDelta & theParams, const gp_Pnt * thePnt);

		/****** AIS_ViewController::hasPanningAnchorPoint ******/
		/****** md5 signature: 5a5940ea0f0577e425c4d053777baccb ******/
		%feature("compactdefaultargs") hasPanningAnchorPoint;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Return if panning anchor point has been defined.
") hasPanningAnchorPoint;
		bool hasPanningAnchorPoint();

		/****** AIS_ViewController::panningAnchorPoint ******/
		/****** md5 signature: ba684401aa2b89569090e3ad13f4834f ******/
		%feature("compactdefaultargs") panningAnchorPoint;
		%feature("autodoc", "Return
-------
gp_Pnt

Description
-----------
Return active panning anchor point.
") panningAnchorPoint;
		const gp_Pnt panningAnchorPoint();

		/****** AIS_ViewController::setAskNextFrame ******/
		/****** md5 signature: 6d19af3a6c77b607b1f07eb2f7996578 ******/
		%feature("compactdefaultargs") setAskNextFrame;
		%feature("autodoc", "
Parameters
----------
theToDraw: bool (optional, default to true)

Return
-------
None

Description
-----------
Set if another frame should be drawn right after this one.
") setAskNextFrame;
		void setAskNextFrame(bool theToDraw = true);

		/****** AIS_ViewController::setPanningAnchorPoint ******/
		/****** md5 signature: b7553988e5fbf0f722b71d831535f2ef ******/
		%feature("compactdefaultargs") setPanningAnchorPoint;
		%feature("autodoc", "
Parameters
----------
thePnt: gp_Pnt

Return
-------
None

Description
-----------
Set active panning anchor point.
") setPanningAnchorPoint;
		void setPanningAnchorPoint(const gp_Pnt & thePnt);

		/****** AIS_ViewController::toAskNextFrame ******/
		/****** md5 signature: d01248dd29bfdaa729f5199d74c25787 ******/
		%feature("compactdefaultargs") toAskNextFrame;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Return True if another frame should be drawn right after this one.
") toAskNextFrame;
		bool toAskNextFrame();

};


%extend AIS_ViewController {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************
* class AIS_ViewCubeOwner *
**************************/
class AIS_ViewCubeOwner : public SelectMgr_EntityOwner {
	public:
		/****** AIS_ViewCubeOwner::AIS_ViewCubeOwner ******/
		/****** md5 signature: f4066c19a26300558ee1e6068fb43cfc ******/
		%feature("compactdefaultargs") AIS_ViewCubeOwner;
		%feature("autodoc", "
Parameters
----------
theObject: AIS_ViewCube
theOrient: V3d_TypeOfOrientation
thePriority: int (optional, default to 5)

Return
-------
None

Description
-----------
Main constructor.
") AIS_ViewCubeOwner;
		 AIS_ViewCubeOwner(const opencascade::handle<AIS_ViewCube> & theObject, V3d_TypeOfOrientation theOrient, int thePriority = 5);

		/****** AIS_ViewCubeOwner::HandleMouseClick ******/
		/****** md5 signature: 72844e868e75b8190c9b66caa910dea2 ******/
		%feature("compactdefaultargs") HandleMouseClick;
		%feature("autodoc", "
Parameters
----------
thePoint: NCollection_Vec2<int>
theButton: Aspect_VKeyMouse
theModifiers: Aspect_VKeyFlags
theIsDoubleClick: bool

Return
-------
bool

Description
-----------
Handle mouse button click event.
") HandleMouseClick;
		bool HandleMouseClick(const NCollection_Vec2<int> & thePoint, Aspect_VKeyMouse theButton, Aspect_VKeyFlags theModifiers, bool theIsDoubleClick);

		/****** AIS_ViewCubeOwner::IsForcedHilight ******/
		/****** md5 signature: b755592344ca3643dbf4dea30ce4c0a8 ******/
		%feature("compactdefaultargs") IsForcedHilight;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Return: True. This owner will always call method Hilight for its Selectable Object when the owner is detected.
") IsForcedHilight;
		bool IsForcedHilight();

		/****** AIS_ViewCubeOwner::MainOrientation ******/
		/****** md5 signature: 7d1d15cbf0063e6e41d7faee8d9ffb0a ******/
		%feature("compactdefaultargs") MainOrientation;
		%feature("autodoc", "Return
-------
V3d_TypeOfOrientation

Description
-----------
Return new orientation to set.
") MainOrientation;
		V3d_TypeOfOrientation MainOrientation();

};


%make_alias(AIS_ViewCubeOwner)

%extend AIS_ViewCubeOwner {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************
* class AIS_ViewCubeSensitive *
******************************/
class AIS_ViewCubeSensitive : public Select3D_SensitivePrimitiveArray {
	public:
		/****** AIS_ViewCubeSensitive::AIS_ViewCubeSensitive ******/
		/****** md5 signature: e45652d05a411666b6fb202a054d81ef ******/
		%feature("compactdefaultargs") AIS_ViewCubeSensitive;
		%feature("autodoc", "
Parameters
----------
theOwner: SelectMgr_EntityOwner
theTris: Graphic3d_ArrayOfTriangles

Return
-------
None

Description
-----------
Constructor.
") AIS_ViewCubeSensitive;
		 AIS_ViewCubeSensitive(const opencascade::handle<SelectMgr_EntityOwner> & theOwner, const opencascade::handle<Graphic3d_ArrayOfTriangles> & theTris);

		/****** AIS_ViewCubeSensitive::Matches ******/
		/****** md5 signature: 9eee725668f2c37b2df03ecf1889ee0f ******/
		%feature("compactdefaultargs") Matches;
		%feature("autodoc", "
Parameters
----------
theMgr: SelectBasics_SelectingVolumeManager
thePickResult: SelectBasics_PickResult

Return
-------
bool

Description
-----------
Checks whether element overlaps current selecting volume.
") Matches;
		bool Matches(SelectBasics_SelectingVolumeManager & theMgr, SelectBasics_PickResult & thePickResult);

};


%make_alias(AIS_ViewCubeSensitive)

%extend AIS_ViewCubeSensitive {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************
* class AIS_ViewInputBuffer *
****************************/
class AIS_ViewInputBuffer {
	public:
		class _orientation {};
		class _highlighting {};
		class _selection {};
		class _panningParams {};
		class _draggingParams {};
		class _orbitRotation {};
		class _viewRotation {};
		class _zrotateParams {};
		/****** AIS_ViewInputBuffer::AIS_ViewInputBuffer ******/
		/****** md5 signature: 745d73c10e784c3d8e971b2aac633943 ******/
		%feature("compactdefaultargs") AIS_ViewInputBuffer;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") AIS_ViewInputBuffer;
		 AIS_ViewInputBuffer();

		/****** AIS_ViewInputBuffer::Reset ******/
		/****** md5 signature: e3081050d274769a1cd4a93969da94c6 ******/
		%feature("compactdefaultargs") Reset;
		%feature("autodoc", "Return
-------
None

Description
-----------
Reset events buffer.
") Reset;
		void Reset();

};


%extend AIS_ViewInputBuffer {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************
* class AIS_WalkDelta *
**********************/
class AIS_WalkDelta {
	public:
		/****** AIS_WalkDelta::AIS_WalkDelta ******/
		/****** md5 signature: 78d0e66f1b9582c94cc5e1325ffc1ece ******/
		%feature("compactdefaultargs") AIS_WalkDelta;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") AIS_WalkDelta;
		 AIS_WalkDelta();

		/****** AIS_WalkDelta::IsCrouching ******/
		/****** md5 signature: 9edc9fe6122620d3da7900016c4dd274 ******/
		%feature("compactdefaultargs") IsCrouching;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Return crouching state.
") IsCrouching;
		bool IsCrouching();

		/****** AIS_WalkDelta::IsDefined ******/
		/****** md5 signature: b70d5071bbde3aa553369be83e08074a ******/
		%feature("compactdefaultargs") IsDefined;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Return True if navigation keys are pressed even if delta from the previous frame is empty.
") IsDefined;
		bool IsDefined();

		/****** AIS_WalkDelta::IsEmpty ******/
		/****** md5 signature: 70a41d5fe65955a28167088305fc6991 ******/
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Return True when both Rotation and Translation deltas are empty.
") IsEmpty;
		bool IsEmpty();

		/****** AIS_WalkDelta::IsJumping ******/
		/****** md5 signature: d4be653fde273b1c6b730a0da8c487b6 ******/
		%feature("compactdefaultargs") IsJumping;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Return jumping state.
") IsJumping;
		bool IsJumping();

		/****** AIS_WalkDelta::IsRunning ******/
		/****** md5 signature: fb4df305f3df2579c794552bb89356af ******/
		%feature("compactdefaultargs") IsRunning;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Return running state.
") IsRunning;
		bool IsRunning();

		/****** AIS_WalkDelta::SetCrouching ******/
		/****** md5 signature: 5eceefece527a932b4edfcab57edade2 ******/
		%feature("compactdefaultargs") SetCrouching;
		%feature("autodoc", "
Parameters
----------
theIsCrouching: bool

Return
-------
None

Description
-----------
Set crouching state.
") SetCrouching;
		void SetCrouching(bool theIsCrouching);

		/****** AIS_WalkDelta::SetDefined ******/
		/****** md5 signature: b71ec8fb76b263547fd8c33a97753c6c ******/
		%feature("compactdefaultargs") SetDefined;
		%feature("autodoc", "
Parameters
----------
theIsDefined: bool

Return
-------
None

Description
-----------
Set if any navigation key is pressed.
") SetDefined;
		void SetDefined(bool theIsDefined);

		/****** AIS_WalkDelta::SetJumping ******/
		/****** md5 signature: 3b746ded8c228237e58bdc8b95def62f ******/
		%feature("compactdefaultargs") SetJumping;
		%feature("autodoc", "
Parameters
----------
theIsJumping: bool

Return
-------
None

Description
-----------
Set jumping state.
") SetJumping;
		void SetJumping(bool theIsJumping);

		/****** AIS_WalkDelta::SetRunning ******/
		/****** md5 signature: 9e52f30649e18f8ab29d5958a3d4ded2 ******/
		%feature("compactdefaultargs") SetRunning;
		%feature("autodoc", "
Parameters
----------
theIsRunning: bool

Return
-------
None

Description
-----------
Set running state.
") SetRunning;
		void SetRunning(bool theIsRunning);

		/****** AIS_WalkDelta::ToMove ******/
		/****** md5 signature: 7b66cd6cf6a1dd37a403775814652db7 ******/
		%feature("compactdefaultargs") ToMove;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Return True if translation delta is defined.
") ToMove;
		bool ToMove();

		/****** AIS_WalkDelta::ToRotate ******/
		/****** md5 signature: fcc05bcbce9d2e30ba46ffee48a00dd8 ******/
		%feature("compactdefaultargs") ToRotate;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Return True if rotation delta is defined.
") ToRotate;
		bool ToRotate();

};


%extend AIS_WalkDelta {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************
* class AIS_WalkPart *
*********************/
class AIS_WalkPart {
	public:
		/****** AIS_WalkPart::AIS_WalkPart ******/
		/****** md5 signature: 5e3a0f6962670df498761fa44109c312 ******/
		%feature("compactdefaultargs") AIS_WalkPart;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") AIS_WalkPart;
		 AIS_WalkPart();

		/****** AIS_WalkPart::IsEmpty ******/
		/****** md5 signature: 70a41d5fe65955a28167088305fc6991 ******/
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Return True if delta is empty.
") IsEmpty;
		bool IsEmpty();

};


%extend AIS_WalkPart {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************
* class AIS_AnimationCamera *
****************************/
class AIS_AnimationCamera : public AIS_Animation {
	public:
		/****** AIS_AnimationCamera::AIS_AnimationCamera ******/
		/****** md5 signature: 8ff92abae4b3ac909180f754a717bd23 ******/
		%feature("compactdefaultargs") AIS_AnimationCamera;
		%feature("autodoc", "
Parameters
----------
theAnimationName: str
theView: V3d_View

Return
-------
None

Description
-----------
Main constructor.
") AIS_AnimationCamera;
		 AIS_AnimationCamera(TCollection_AsciiString theAnimationName, const opencascade::handle<V3d_View> & theView);

		/****** AIS_AnimationCamera::CameraEnd ******/
		/****** md5 signature: b01b09ea2b055e00cd1afbc9547d1944 ******/
		%feature("compactdefaultargs") CameraEnd;
		%feature("autodoc", "Return
-------
opencascade::handle<Graphic3d_Camera>

Description
-----------
Return camera end position.
") CameraEnd;
		const opencascade::handle<Graphic3d_Camera> & CameraEnd();

		/****** AIS_AnimationCamera::CameraStart ******/
		/****** md5 signature: d6ebd288f132ab4ec611acad6908ce38 ******/
		%feature("compactdefaultargs") CameraStart;
		%feature("autodoc", "Return
-------
opencascade::handle<Graphic3d_Camera>

Description
-----------
Return camera start position.
") CameraStart;
		const opencascade::handle<Graphic3d_Camera> & CameraStart();

		/****** AIS_AnimationCamera::SetCameraEnd ******/
		/****** md5 signature: 75679516df27f3c84a21aa3e0909ecf2 ******/
		%feature("compactdefaultargs") SetCameraEnd;
		%feature("autodoc", "
Parameters
----------
theCameraEnd: Graphic3d_Camera

Return
-------
None

Description
-----------
Define camera end position.
") SetCameraEnd;
		void SetCameraEnd(const opencascade::handle<Graphic3d_Camera> & theCameraEnd);

		/****** AIS_AnimationCamera::SetCameraStart ******/
		/****** md5 signature: 32b740e9f4a21c3ee69c1acc0dfa9c67 ******/
		%feature("compactdefaultargs") SetCameraStart;
		%feature("autodoc", "
Parameters
----------
theCameraStart: Graphic3d_Camera

Return
-------
None

Description
-----------
Define camera start position.
") SetCameraStart;
		void SetCameraStart(const opencascade::handle<Graphic3d_Camera> & theCameraStart);

		/****** AIS_AnimationCamera::SetView ******/
		/****** md5 signature: 0584fa04772f11b6b4dc66d41a80a5f7 ******/
		%feature("compactdefaultargs") SetView;
		%feature("autodoc", "
Parameters
----------
theView: V3d_View

Return
-------
None

Description
-----------
Set target view.
") SetView;
		void SetView(const opencascade::handle<V3d_View> & theView);

		/****** AIS_AnimationCamera::View ******/
		/****** md5 signature: 592d26a27bd3a7b6180f94a10b60dfb1 ******/
		%feature("compactdefaultargs") View;
		%feature("autodoc", "Return
-------
opencascade::handle<V3d_View>

Description
-----------
Return the target view.
") View;
		const opencascade::handle<V3d_View> & View();

};


%make_alias(AIS_AnimationCamera)

%extend AIS_AnimationCamera {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************
* class AIS_Axis *
*****************/
class AIS_Axis : public AIS_InteractiveObject {
	public:
		/****** AIS_Axis::AIS_Axis ******/
		/****** md5 signature: 496908e4e4a697e3d91ac63063fecdfc ******/
		%feature("compactdefaultargs") AIS_Axis;
		%feature("autodoc", "
Parameters
----------
aComponent: Geom_Line

Return
-------
None

Description
-----------
Initializes the line aComponent.
") AIS_Axis;
		 AIS_Axis(const opencascade::handle<Geom_Line> & aComponent);

		/****** AIS_Axis::AIS_Axis ******/
		/****** md5 signature: e18674f14ec23c9de38d04b4c4849317 ******/
		%feature("compactdefaultargs") AIS_Axis;
		%feature("autodoc", "
Parameters
----------
aComponent: Geom_Axis2Placement
anAxisType: AIS_TypeOfAxis

Return
-------
None

Description
-----------
initializes the axis2 position aComponent. The coordinate system used is right-handed.
") AIS_Axis;
		 AIS_Axis(const opencascade::handle<Geom_Axis2Placement> & aComponent, const AIS_TypeOfAxis anAxisType);

		/****** AIS_Axis::AIS_Axis ******/
		/****** md5 signature: 7521b6e648a3b47e5909b08aca72ee84 ******/
		%feature("compactdefaultargs") AIS_Axis;
		%feature("autodoc", "
Parameters
----------
anAxis: Geom_Axis1Placement

Return
-------
None

Description
-----------
Initializes the axis1 position anAxis.
") AIS_Axis;
		 AIS_Axis(const opencascade::handle<Geom_Axis1Placement> & anAxis);

		/****** AIS_Axis::AIS_Axis ******/
		/****** md5 signature: 5775acd43b1df567234bdd7f848a0d13 ******/
		%feature("compactdefaultargs") AIS_Axis;
		%feature("autodoc", "
Parameters
----------
theAxis: gp_Ax1
theLength: double (optional, default to -1)

Return
-------
None

Description
-----------
Initializes the ray as axis with start point and direction 
Input parameter: theAxis Start point and direction of the ray 
Input parameter: theLength Optional length of the ray (ray is infinite by default).
") AIS_Axis;
		 AIS_Axis(const gp_Ax1 & theAxis, const double theLength = -1);

		/****** AIS_Axis::AcceptDisplayMode ******/
		/****** md5 signature: bc48ea6a4869b14bc142f86833b6d516 ******/
		%feature("compactdefaultargs") AcceptDisplayMode;
		%feature("autodoc", "
Parameters
----------
aMode: int

Return
-------
bool

Description
-----------
Returns true if the interactive object accepts the display mode aMode.
") AcceptDisplayMode;
		bool AcceptDisplayMode(const int aMode);

		/****** AIS_Axis::Axis2Placement ******/
		/****** md5 signature: 1eb7fb00f1ddac7348881c96ee090d62 ******/
		%feature("compactdefaultargs") Axis2Placement;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom_Axis2Placement>

Description
-----------
Returns the position of axis2 and positions it by identifying it as the x, y, or z axis and giving its direction in 3D space. The coordinate system used is right-handed.
") Axis2Placement;
		const opencascade::handle<Geom_Axis2Placement> & Axis2Placement();

		/****** AIS_Axis::Component ******/
		/****** md5 signature: f69e55b36337e553cef8f7f1128a7e5d ******/
		%feature("compactdefaultargs") Component;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom_Line>

Description
-----------
Returns the axis entity aComponent and identifies it as a component of a shape.
") Component;
		const opencascade::handle<Geom_Line> & Component();

		/****** AIS_Axis::IsXYZAxis ******/
		/****** md5 signature: c8704357f772dcfcd481542d8a915f0c ******/
		%feature("compactdefaultargs") IsXYZAxis;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns a signature of 2 for axis datums. When you activate mode 2 by a signature, you pick AIS objects of type AIS_Axis.
") IsXYZAxis;
		bool IsXYZAxis();

		/****** AIS_Axis::SetAxis1Placement ******/
		/****** md5 signature: 8c0fc181857403a46c591ffe5130de85 ******/
		%feature("compactdefaultargs") SetAxis1Placement;
		%feature("autodoc", "
Parameters
----------
anAxis: Geom_Axis1Placement

Return
-------
None

Description
-----------
Constructs a new line to serve as the axis anAxis in 3D space.
") SetAxis1Placement;
		void SetAxis1Placement(const opencascade::handle<Geom_Axis1Placement> & anAxis);

		/****** AIS_Axis::SetAxis2Placement ******/
		/****** md5 signature: acd86dedac2b089c67648b84cfc69afd ******/
		%feature("compactdefaultargs") SetAxis2Placement;
		%feature("autodoc", "
Parameters
----------
aComponent: Geom_Axis2Placement
anAxisType: AIS_TypeOfAxis

Return
-------
None

Description
-----------
Allows you to provide settings for aComponent:the position and direction of an axis in 3D space. The coordinate system used is right-handed.
") SetAxis2Placement;
		void SetAxis2Placement(const opencascade::handle<Geom_Axis2Placement> & aComponent, const AIS_TypeOfAxis anAxisType);

		/****** AIS_Axis::SetColor ******/
		/****** md5 signature: e785f798cd798d31cee335b9cb87421c ******/
		%feature("compactdefaultargs") SetColor;
		%feature("autodoc", "
Parameters
----------
aColor: Quantity_Color

Return
-------
None

Description
-----------
No available documentation.
") SetColor;
		void SetColor(const Quantity_Color & aColor);

		/****** AIS_Axis::SetComponent ******/
		/****** md5 signature: a13f4f5c2d68a8a72653cf5c30dc559b ******/
		%feature("compactdefaultargs") SetComponent;
		%feature("autodoc", "
Parameters
----------
aComponent: Geom_Line

Return
-------
None

Description
-----------
Sets the coordinates of the lin aComponent.
") SetComponent;
		void SetComponent(const opencascade::handle<Geom_Line> & aComponent);

		/****** AIS_Axis::SetDisplayAspect ******/
		/****** md5 signature: fbb9dcc512474594bfb63a46987619d6 ******/
		%feature("compactdefaultargs") SetDisplayAspect;
		%feature("autodoc", "
Parameters
----------
theNewDatumAspect: Prs3d_LineAspect

Return
-------
None

Description
-----------
Set required visualization parameters.
") SetDisplayAspect;
		void SetDisplayAspect(const opencascade::handle<Prs3d_LineAspect> & theNewDatumAspect);

		/****** AIS_Axis::SetTypeOfAxis ******/
		/****** md5 signature: 020f7cadcbe397a98ebb13acd7bdc321 ******/
		%feature("compactdefaultargs") SetTypeOfAxis;
		%feature("autodoc", "
Parameters
----------
theTypeAxis: AIS_TypeOfAxis

Return
-------
None

Description
-----------
Constructs the entity theTypeAxis to stock information concerning type of axis.
") SetTypeOfAxis;
		void SetTypeOfAxis(const AIS_TypeOfAxis theTypeAxis);

		/****** AIS_Axis::SetWidth ******/
		/****** md5 signature: 5c28197685e1a227390e8b87486b22a0 ******/
		%feature("compactdefaultargs") SetWidth;
		%feature("autodoc", "
Parameters
----------
aValue: double

Return
-------
None

Description
-----------
No available documentation.
") SetWidth;
		void SetWidth(const double aValue);

		/****** AIS_Axis::Signature ******/
		/****** md5 signature: cb4be277567e09ceca8f8a2aaa8aa8fd ******/
		%feature("compactdefaultargs") Signature;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") Signature;
		int Signature();

		/****** AIS_Axis::Type ******/
		/****** md5 signature: c88659fa26c5e97835681ebdf0f08b53 ******/
		%feature("compactdefaultargs") Type;
		%feature("autodoc", "Return
-------
AIS_KindOfInteractive

Description
-----------
No available documentation.
") Type;
		AIS_KindOfInteractive Type();

		/****** AIS_Axis::TypeOfAxis ******/
		/****** md5 signature: 9f9988d6567e5e10c79eb93ead9bc6e5 ******/
		%feature("compactdefaultargs") TypeOfAxis;
		%feature("autodoc", "Return
-------
AIS_TypeOfAxis

Description
-----------
Returns the type of axis.
") TypeOfAxis;
		AIS_TypeOfAxis TypeOfAxis();

		/****** AIS_Axis::UnsetColor ******/
		/****** md5 signature: 11f9cda4f631b34a4be33c2bf7cf48b1 ******/
		%feature("compactdefaultargs") UnsetColor;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") UnsetColor;
		void UnsetColor();

		/****** AIS_Axis::UnsetWidth ******/
		/****** md5 signature: 806020285b21e0f143ac65d1e797f644 ******/
		%feature("compactdefaultargs") UnsetWidth;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") UnsetWidth;
		void UnsetWidth();

};


%make_alias(AIS_Axis)

%extend AIS_Axis {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************
* class AIS_BaseAnimationObject *
********************************/
%nodefaultctor AIS_BaseAnimationObject;
class AIS_BaseAnimationObject : public AIS_Animation {
	public:
};


%make_alias(AIS_BaseAnimationObject)

%extend AIS_BaseAnimationObject {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************
* class AIS_CameraFrustum *
**************************/
class AIS_CameraFrustum : public AIS_InteractiveObject {
	public:
/* public enums */
enum SelectionMode {
	SelectionMode_Edges = 0,
	SelectionMode_Volume = 1,
};

/* end public enums declaration */

/* python proxy classes for enums */
%pythoncode {

class SelectionMode(IntEnum):
	SelectionMode_Edges = 0
	SelectionMode_Volume = 1
SelectionMode_Edges = SelectionMode.SelectionMode_Edges
SelectionMode_Volume = SelectionMode.SelectionMode_Volume
};
/* end python proxy for enums */

		/****** AIS_CameraFrustum::AIS_CameraFrustum ******/
		/****** md5 signature: 150818eb23cd3e2e2db0bb6db4cf94d7 ******/
		%feature("compactdefaultargs") AIS_CameraFrustum;
		%feature("autodoc", "Return
-------
None

Description
-----------
Constructs camera frustum with default configuration.
") AIS_CameraFrustum;
		 AIS_CameraFrustum();

		/****** AIS_CameraFrustum::AcceptDisplayMode ******/
		/****** md5 signature: d90d8273b45e739d910a614eb1bf7b69 ******/
		%feature("compactdefaultargs") AcceptDisplayMode;
		%feature("autodoc", "
Parameters
----------
theMode: int

Return
-------
bool

Description
-----------
Return true if specified display mode is supported.
") AcceptDisplayMode;
		bool AcceptDisplayMode(const int theMode);

		/****** AIS_CameraFrustum::SetCameraFrustum ******/
		/****** md5 signature: d196fc8b383c2d94bbf20ae29d0720c5 ******/
		%feature("compactdefaultargs") SetCameraFrustum;
		%feature("autodoc", "
Parameters
----------
theCamera: Graphic3d_Camera

Return
-------
None

Description
-----------
Sets camera frustum.
") SetCameraFrustum;
		void SetCameraFrustum(const opencascade::handle<Graphic3d_Camera> & theCamera);

		/****** AIS_CameraFrustum::SetColor ******/
		/****** md5 signature: b174106500deaf4ecfa505bb8ae6784c ******/
		%feature("compactdefaultargs") SetColor;
		%feature("autodoc", "
Parameters
----------
theColor: Quantity_Color

Return
-------
None

Description
-----------
Setup custom color.
") SetColor;
		void SetColor(const Quantity_Color & theColor);

		/****** AIS_CameraFrustum::UnsetColor ******/
		/****** md5 signature: 11f9cda4f631b34a4be33c2bf7cf48b1 ******/
		%feature("compactdefaultargs") UnsetColor;
		%feature("autodoc", "Return
-------
None

Description
-----------
Restore default color.
") UnsetColor;
		void UnsetColor();

		/****** AIS_CameraFrustum::UnsetTransparency ******/
		/****** md5 signature: b0bbb5c0e2872867b944fb3488b9badd ******/
		%feature("compactdefaultargs") UnsetTransparency;
		%feature("autodoc", "Return
-------
None

Description
-----------
Restore transparency setting.
") UnsetTransparency;
		void UnsetTransparency();

};


%make_alias(AIS_CameraFrustum)

%extend AIS_CameraFrustum {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************
* class AIS_Circle *
*******************/
class AIS_Circle : public AIS_InteractiveObject {
	public:
		/****** AIS_Circle::AIS_Circle ******/
		/****** md5 signature: 7840debc97d471b60b1bd796a31a034f ******/
		%feature("compactdefaultargs") AIS_Circle;
		%feature("autodoc", "
Parameters
----------
aCircle: Geom_Circle

Return
-------
None

Description
-----------
Initializes this algorithm for constructing AIS circle datums initializes the circle aCircle.
") AIS_Circle;
		 AIS_Circle(const opencascade::handle<Geom_Circle> & aCircle);

		/****** AIS_Circle::AIS_Circle ******/
		/****** md5 signature: 44a6c16733defe448c7aeb20b431afaf ******/
		%feature("compactdefaultargs") AIS_Circle;
		%feature("autodoc", "
Parameters
----------
theCircle: Geom_Circle
theUStart: double
theUEnd: double
theIsFilledCircleSens: bool (optional, default to false)

Return
-------
None

Description
-----------
Initializes this algorithm for constructing AIS circle datums. Initializes the circle theCircle, the arc starting point theUStart, the arc ending point theUEnd, and the type of sensitivity theIsFilledCircleSens.
") AIS_Circle;
		 AIS_Circle(const opencascade::handle<Geom_Circle> & theCircle, const double theUStart, const double theUEnd, const bool theIsFilledCircleSens = false);

		/****** AIS_Circle::Circle ******/
		/****** md5 signature: dca94d5c17b802a2d82f4b02016fcaa0 ******/
		%feature("compactdefaultargs") Circle;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom_Circle>

Description
-----------
Returns the circle component defined in SetCircle.
") Circle;
		const opencascade::handle<Geom_Circle> & Circle();

		/****** AIS_Circle::IsFilledCircleSens ******/
		/****** md5 signature: a8cc235505669b267a54db495c92ae8d ******/
		%feature("compactdefaultargs") IsFilledCircleSens;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns the type of sensitivity for the circle;.
") IsFilledCircleSens;
		bool IsFilledCircleSens();

		/****** AIS_Circle::Parameters ******/
		/****** md5 signature: a92085bd80864da7ed24f8ce5b3e528c ******/
		%feature("compactdefaultargs") Parameters;
		%feature("autodoc", "
Parameters
----------

Return
-------
theU1: double
theU2: double

Description
-----------
Constructs instances of the starting point and the end point parameters, theU1 and theU2.
") Parameters;
		void Parameters(Standard_Real &OutValue, Standard_Real &OutValue);

		/****** AIS_Circle::SetCircle ******/
		/****** md5 signature: 96449d53f84bdc37171b080fcbaf229f ******/
		%feature("compactdefaultargs") SetCircle;
		%feature("autodoc", "
Parameters
----------
theCircle: Geom_Circle

Return
-------
None

Description
-----------
Allows you to provide settings for the circle datum aCircle.
") SetCircle;
		void SetCircle(const opencascade::handle<Geom_Circle> & theCircle);

		/****** AIS_Circle::SetColor ******/
		/****** md5 signature: e785f798cd798d31cee335b9cb87421c ******/
		%feature("compactdefaultargs") SetColor;
		%feature("autodoc", "
Parameters
----------
aColor: Quantity_Color

Return
-------
None

Description
-----------
No available documentation.
") SetColor;
		void SetColor(const Quantity_Color & aColor);

		/****** AIS_Circle::SetFilledCircleSens ******/
		/****** md5 signature: 014f3ddce043b7137460ef61546847ba ******/
		%feature("compactdefaultargs") SetFilledCircleSens;
		%feature("autodoc", "
Parameters
----------
theIsFilledCircleSens: bool

Return
-------
None

Description
-----------
Sets the type of sensitivity for the circle. If theIsFilledCircleSens set to true then the whole circle will be detectable, otherwise only the boundary of the circle.
") SetFilledCircleSens;
		void SetFilledCircleSens(const bool theIsFilledCircleSens);

		/****** AIS_Circle::SetFirstParam ******/
		/****** md5 signature: fe8e0bd35b6f390339b04ebd352b1863 ******/
		%feature("compactdefaultargs") SetFirstParam;
		%feature("autodoc", "
Parameters
----------
theU: double

Return
-------
None

Description
-----------
Allows you to set the parameter theU for the starting point of an arc.
") SetFirstParam;
		void SetFirstParam(const double theU);

		/****** AIS_Circle::SetLastParam ******/
		/****** md5 signature: d675a916f373e9e03591823e100f357e ******/
		%feature("compactdefaultargs") SetLastParam;
		%feature("autodoc", "
Parameters
----------
theU: double

Return
-------
None

Description
-----------
Allows you to provide the parameter theU for the end point of an arc.
") SetLastParam;
		void SetLastParam(const double theU);

		/****** AIS_Circle::SetWidth ******/
		/****** md5 signature: 5c28197685e1a227390e8b87486b22a0 ******/
		%feature("compactdefaultargs") SetWidth;
		%feature("autodoc", "
Parameters
----------
aValue: double

Return
-------
None

Description
-----------
Assigns the width aValue to the solid line boundary of the circle datum.
") SetWidth;
		void SetWidth(const double aValue);

		/****** AIS_Circle::Signature ******/
		/****** md5 signature: cb4be277567e09ceca8f8a2aaa8aa8fd ******/
		%feature("compactdefaultargs") Signature;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns index 6 by default.
") Signature;
		int Signature();

		/****** AIS_Circle::Type ******/
		/****** md5 signature: c88659fa26c5e97835681ebdf0f08b53 ******/
		%feature("compactdefaultargs") Type;
		%feature("autodoc", "Return
-------
AIS_KindOfInteractive

Description
-----------
Indicates that the type of Interactive Object is a datum.
") Type;
		AIS_KindOfInteractive Type();

		/****** AIS_Circle::UnsetColor ******/
		/****** md5 signature: 11f9cda4f631b34a4be33c2bf7cf48b1 ******/
		%feature("compactdefaultargs") UnsetColor;
		%feature("autodoc", "Return
-------
None

Description
-----------
Removes color from the solid line boundary of the circle datum.
") UnsetColor;
		void UnsetColor();

		/****** AIS_Circle::UnsetWidth ******/
		/****** md5 signature: 806020285b21e0f143ac65d1e797f644 ******/
		%feature("compactdefaultargs") UnsetWidth;
		%feature("autodoc", "Return
-------
None

Description
-----------
Removes width settings from the solid line boundary of the circle datum.
") UnsetWidth;
		void UnsetWidth();

};


%make_alias(AIS_Circle)

%extend AIS_Circle {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************
* class AIS_ColorScale *
***********************/
class AIS_ColorScale : public AIS_InteractiveObject {
	public:
		/****** AIS_ColorScale::AIS_ColorScale ******/
		/****** md5 signature: f743d580a5e9c57906d990bffe1e305b ******/
		%feature("compactdefaultargs") AIS_ColorScale;
		%feature("autodoc", "Return
-------
None

Description
-----------
Default constructor.
") AIS_ColorScale;
		 AIS_ColorScale();

		/****** AIS_ColorScale::AcceptDisplayMode ******/
		/****** md5 signature: 87fb12421b337c0d3c009064a10e954f ******/
		%feature("compactdefaultargs") AcceptDisplayMode;
		%feature("autodoc", "
Parameters
----------
theMode: int

Return
-------
bool

Description
-----------
Return true if specified display mode is supported.
") AcceptDisplayMode;
		bool AcceptDisplayMode(const int theMode);

		/****** AIS_ColorScale::ColorRange ******/
		/****** md5 signature: 09c7c44e660693a064e563e79c9b2177 ******/
		%feature("compactdefaultargs") ColorRange;
		%feature("autodoc", "
Parameters
----------
theMinColor: Quantity_Color
theMaxColor: Quantity_Color

Return
-------
None

Description
-----------
Returns color range corresponding to minimum and maximum values, blue to red by default.
") ColorRange;
		void ColorRange(Quantity_Color & theMinColor, Quantity_Color & theMaxColor);

		/****** AIS_ColorScale::Compute ******/
		/****** md5 signature: 72c4c549688bd611b1c46ed296ee2417 ******/
		%feature("compactdefaultargs") Compute;
		%feature("autodoc", "
Parameters
----------
thePrsMgr: PrsMgr_PresentationManager
thePresentation: Prs3d_Presentation
theMode: int

Return
-------
None

Description
-----------
Compute presentation.
") Compute;
		void Compute(const opencascade::handle<PrsMgr_PresentationManager> & thePrsMgr, const opencascade::handle<Prs3d_Presentation> & thePresentation, const int theMode);

		/****** AIS_ColorScale::ComputeSelection ******/
		/****** md5 signature: af25cc24476e89ba7bb8fa7ec6acee2f ******/
		%feature("compactdefaultargs") ComputeSelection;
		%feature("autodoc", "
Parameters
----------
&: SelectMgr_Selection
: int

Return
-------
None

Description
-----------
Compute selection - not implemented for color scale.
") ComputeSelection;
		void ComputeSelection(const opencascade::handle<SelectMgr_Selection > &, const int );

		/****** AIS_ColorScale::FindColor ******/
		/****** md5 signature: 581608fbbc274d16659ade28faabb300 ******/
		%feature("compactdefaultargs") FindColor;
		%feature("autodoc", "
Parameters
----------
theValue: double
theMin: double
theMax: double
theColorsCount: int
theColorHlsMin: NCollection_Vec3<double>
theColorHlsMax: NCollection_Vec3<double>
theColor: Quantity_Color

Return
-------
bool

Description
-----------
Calculate color according passed value; returns true if value is in range or false, if isn't.
") FindColor;
		static bool FindColor(const double theValue, const double theMin, const double theMax, const int theColorsCount, const NCollection_Vec3<double> & theColorHlsMin, const NCollection_Vec3<double> & theColorHlsMax, Quantity_Color & theColor);

		/****** AIS_ColorScale::FindColor ******/
		/****** md5 signature: a68590ab713fb2c06f4e686334403989 ******/
		%feature("compactdefaultargs") FindColor;
		%feature("autodoc", "
Parameters
----------
theValue: double
theMin: double
theMax: double
theColorsCount: int
theColor: Quantity_Color

Return
-------
bool

Description
-----------
Calculate color according passed value; returns true if value is in range or false, if isn't.
") FindColor;
		static bool FindColor(const double theValue, const double theMin, const double theMax, const int theColorsCount, Quantity_Color & theColor);

		/****** AIS_ColorScale::FindColor ******/
		/****** md5 signature: 3bb46117d2e46c710fb6309a319c2f52 ******/
		%feature("compactdefaultargs") FindColor;
		%feature("autodoc", "
Parameters
----------
theValue: double
theColor: Quantity_Color

Return
-------
bool

Description
-----------
Calculate color according passed value; returns true if value is in range or false, if isn't.
") FindColor;
		bool FindColor(const double theValue, Quantity_Color & theColor);

		/****** AIS_ColorScale::Format ******/
		/****** md5 signature: e9d46855e7e702fd9247d888cb57d283 ******/
		%feature("compactdefaultargs") Format;
		%feature("autodoc", "Return
-------
TCollection_AsciiString

Description
-----------
Returns the format of text.
") Format;
		const TCollection_AsciiString & Format();

		/****** AIS_ColorScale::GetBreadth ******/
		/****** md5 signature: 9f50944477043fa62322b5ad6ec72196 ******/
		%feature("compactdefaultargs") GetBreadth;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the breadth of color bar, 0 by default (e.g. should be set by user explicitly before displaying).
") GetBreadth;
		int GetBreadth();

		/****** AIS_ColorScale::GetColorType ******/
		/****** md5 signature: 74ef7f5246b762298ca7fb66001ffb68 ******/
		%feature("compactdefaultargs") GetColorType;
		%feature("autodoc", "Return
-------
Aspect_TypeOfColorScaleData

Description
-----------
Returns the type of colors, Aspect_TOCSD_AUTO by default. Aspect_TOCSD_AUTO - value between Red and Blue Aspect_TOCSD_USER - user specified color from color map.
") GetColorType;
		Aspect_TypeOfColorScaleData GetColorType();

		/****** AIS_ColorScale::GetColors ******/
		/****** md5 signature: 45936fedae345f23618524abb2e9c5b4 ******/
		%feature("compactdefaultargs") GetColors;
		%feature("autodoc", "
Parameters
----------
theColors: NCollection_Sequence<Quantity_Color>

Return
-------
None

Description
-----------
Returns the user specified colors.
") GetColors;
		void GetColors(NCollection_Sequence<Quantity_Color> & theColors);

		/****** AIS_ColorScale::GetColors ******/
		/****** md5 signature: cb5b00e9e341cb583b210123a42cdeb1 ******/
		%feature("compactdefaultargs") GetColors;
		%feature("autodoc", "Return
-------
NCollection_Sequence<Quantity_Color>

Description
-----------
Returns the user specified colors.
") GetColors;
		const NCollection_Sequence<Quantity_Color> & GetColors();

		/****** AIS_ColorScale::GetFormat ******/
		/****** md5 signature: 54c7ef0bc14e2d3ab1ecb4d4d0c39e35 ******/
		%feature("compactdefaultargs") GetFormat;
		%feature("autodoc", "Return
-------
TCollection_AsciiString

Description
-----------
Returns the format for numbers, '%.4g' by default. The same like format for function printf(). Used if GetLabelType() is TOCSD_AUTO;.
") GetFormat;
		const TCollection_AsciiString & GetFormat();

		/****** AIS_ColorScale::GetHeight ******/
		/****** md5 signature: 3357e04a678b73b211dcfdd7464a4155 ******/
		%feature("compactdefaultargs") GetHeight;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the height of color bar, 0 by default (e.g. should be set by user explicitly before displaying).
") GetHeight;
		int GetHeight();

		/****** AIS_ColorScale::GetIntervalColor ******/
		/****** md5 signature: 546747835a7967c804db410c14e5bd86 ******/
		%feature("compactdefaultargs") GetIntervalColor;
		%feature("autodoc", "
Parameters
----------
theIndex: int

Return
-------
Quantity_Color

Description
-----------
Returns the user specified color from color map with index (starts at 1). Returns default color if index is out of range in color map.
") GetIntervalColor;
		Quantity_Color GetIntervalColor(const int theIndex);

		/****** AIS_ColorScale::GetLabel ******/
		/****** md5 signature: ecb6f2b9133421f3d4a317a8c9045df8 ******/
		%feature("compactdefaultargs") GetLabel;
		%feature("autodoc", "
Parameters
----------
theIndex: int

Return
-------
TCollection_ExtendedString

Description
-----------
Returns the user specified label with index theIndex. Index is in range from 1 to GetNumberOfIntervals() or to GetNumberOfIntervals() + 1 if IsLabelAtBorder() is true. Returns empty string if label not defined.
") GetLabel;
		TCollection_ExtendedString GetLabel(const int theIndex);

		/****** AIS_ColorScale::GetLabelPosition ******/
		/****** md5 signature: 88288ffee0ed0f8d63549846a0f422d4 ******/
		%feature("compactdefaultargs") GetLabelPosition;
		%feature("autodoc", "Return
-------
Aspect_TypeOfColorScalePosition

Description
-----------
Returns the position of labels concerning color filled rectangles, Aspect_TOCSP_RIGHT by default.
") GetLabelPosition;
		Aspect_TypeOfColorScalePosition GetLabelPosition();

		/****** AIS_ColorScale::GetLabelType ******/
		/****** md5 signature: a0a0539f49a2cced1489ebfe193b2cbf ******/
		%feature("compactdefaultargs") GetLabelType;
		%feature("autodoc", "Return
-------
Aspect_TypeOfColorScaleData

Description
-----------
Returns the type of labels, Aspect_TOCSD_AUTO by default. Aspect_TOCSD_AUTO - labels as boundary values for intervals Aspect_TOCSD_USER - user specified label is used.
") GetLabelType;
		Aspect_TypeOfColorScaleData GetLabelType();

		/****** AIS_ColorScale::GetLabels ******/
		/****** md5 signature: f86f37c403a53054ad9fd5cdf17c0cf5 ******/
		%feature("compactdefaultargs") GetLabels;
		%feature("autodoc", "
Parameters
----------
theLabels: TColStd_SequenceOfExtendedString

Return
-------
None

Description
-----------
Returns the user specified labels.
") GetLabels;
		void GetLabels(TColStd_SequenceOfExtendedString & theLabels);

		/****** AIS_ColorScale::GetMax ******/
		/****** md5 signature: 7bc9614550d3e3642484718733bd9491 ******/
		%feature("compactdefaultargs") GetMax;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns maximal value of color scale, 1.0 by default.
") GetMax;
		double GetMax();

		/****** AIS_ColorScale::GetMin ******/
		/****** md5 signature: 4c3afe7a83451bbf82fe9a8655288023 ******/
		%feature("compactdefaultargs") GetMin;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns minimal value of color scale, 0.0 by default.
") GetMin;
		double GetMin();

		/****** AIS_ColorScale::GetNumberOfIntervals ******/
		/****** md5 signature: 7082ac39b67083fe8ccca2f3a4b774fe ******/
		%feature("compactdefaultargs") GetNumberOfIntervals;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of color scale intervals, 10 by default.
") GetNumberOfIntervals;
		int GetNumberOfIntervals();

		/****** AIS_ColorScale::GetPosition ******/
		/****** md5 signature: 87e122eee5bca74e52811b23eef3a87d ******/
		%feature("compactdefaultargs") GetPosition;
		%feature("autodoc", "
Parameters
----------

Return
-------
theX: double
theY: double

Description
-----------
Returns the bottom-left position of color scale, 0x0 by default.
") GetPosition;
		void GetPosition(Standard_Real &OutValue, Standard_Real &OutValue);

		/****** AIS_ColorScale::GetRange ******/
		/****** md5 signature: 5ce51d6c8a88cd11269971ad58ddbe29 ******/
		%feature("compactdefaultargs") GetRange;
		%feature("autodoc", "
Parameters
----------

Return
-------
theMin: double
theMax: double

Description
-----------
Returns minimal and maximal values of color scale, 0.0 to 1.0 by default.
") GetRange;
		void GetRange(Standard_Real &OutValue, Standard_Real &OutValue);

		/****** AIS_ColorScale::GetSize ******/
		/****** md5 signature: e4fa5785e8cee100b7338dc816120bf0 ******/
		%feature("compactdefaultargs") GetSize;
		%feature("autodoc", "
Parameters
----------

Return
-------
theBreadth: int
theHeight: int

Description
-----------
Returns the size of color bar, 0 and 0 by default (e.g. should be set by user explicitly before displaying).
") GetSize;
		void GetSize(Standard_Integer &OutValue, Standard_Integer &OutValue);

		/****** AIS_ColorScale::GetTextHeight ******/
		/****** md5 signature: 406924b9970043f07faef4f18793be2a ******/
		%feature("compactdefaultargs") GetTextHeight;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the font height of text labels, 20 by default.
") GetTextHeight;
		int GetTextHeight();

		/****** AIS_ColorScale::GetTitle ******/
		/****** md5 signature: a72936ae7a819e87d6c110c7a97925c7 ******/
		%feature("compactdefaultargs") GetTitle;
		%feature("autodoc", "Return
-------
TCollection_ExtendedString

Description
-----------
Returns the color scale title string, empty string by default.
") GetTitle;
		const TCollection_ExtendedString & GetTitle();

		/****** AIS_ColorScale::GetTitlePosition ******/
		/****** md5 signature: 6653dc38f69098958c96501f1a02b184 ******/
		%feature("compactdefaultargs") GetTitlePosition;
		%feature("autodoc", "Return
-------
Aspect_TypeOfColorScalePosition

Description
-----------
Returns the position of color scale title, Aspect_TOCSP_LEFT by default.
") GetTitlePosition;
		Aspect_TypeOfColorScalePosition GetTitlePosition();

		/****** AIS_ColorScale::GetXPosition ******/
		/****** md5 signature: df3f0097f53790f45d955d827cce6e5e ******/
		%feature("compactdefaultargs") GetXPosition;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the left position of color scale, 0 by default.
") GetXPosition;
		int GetXPosition();

		/****** AIS_ColorScale::GetYPosition ******/
		/****** md5 signature: 7c1c3cbf55563d858096e1aa8cff541a ******/
		%feature("compactdefaultargs") GetYPosition;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the bottom position of color scale, 0 by default.
") GetYPosition;
		int GetYPosition();

		/****** AIS_ColorScale::HueMax ******/
		/****** md5 signature: 6e5ce436adf7c242a86f1326a525fb19 ******/
		%feature("compactdefaultargs") HueMax;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns the hue angle corresponding to maximum value, 0 by default (red).
") HueMax;
		double HueMax();

		/****** AIS_ColorScale::HueMin ******/
		/****** md5 signature: f310f530800861fd05318629cfe6231d ******/
		%feature("compactdefaultargs") HueMin;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns the hue angle corresponding to minimum value, 230 by default (blue).
") HueMin;
		double HueMin();

		/****** AIS_ColorScale::HueRange ******/
		/****** md5 signature: f3da23e444c3411cb8febf81fe0893c3 ******/
		%feature("compactdefaultargs") HueRange;
		%feature("autodoc", "
Parameters
----------

Return
-------
theMinAngle: double
theMaxAngle: double

Description
-----------
Returns the hue angle range corresponding to minimum and maximum values, 230 to 0 by default (blue to red).
") HueRange;
		void HueRange(Standard_Real &OutValue, Standard_Real &OutValue);

		/****** AIS_ColorScale::IsLabelAtBorder ******/
		/****** md5 signature: e9f52f62e094ef148f609d2709c6e1c8 ******/
		%feature("compactdefaultargs") IsLabelAtBorder;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if the labels are placed at border of color intervals, True by default. The automatically generated label will show value exactly on the current position: - value connecting two neighbor intervals (True) - value in the middle of interval (False).
") IsLabelAtBorder;
		bool IsLabelAtBorder();

		/****** AIS_ColorScale::IsLogarithmic ******/
		/****** md5 signature: e92a157c50f4c4bd83a6a710f5a529df ******/
		%feature("compactdefaultargs") IsLogarithmic;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if the color scale has logarithmic intervals, False by default.
") IsLogarithmic;
		bool IsLogarithmic();

		/****** AIS_ColorScale::IsReversed ******/
		/****** md5 signature: fc8ec93d6b9158df890d8a20ff9a71c7 ******/
		%feature("compactdefaultargs") IsReversed;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if the labels and colors used in reversed order, False by default. - Normal, bottom-up order with Minimal value on the Bottom and Maximum value on Top. - Reversed, top-down order with Maximum value on the Bottom and Minimum value on Top.
") IsReversed;
		bool IsReversed();

		/****** AIS_ColorScale::IsSmoothTransition ******/
		/****** md5 signature: 1bdf3f8e17d4f306a43183351d7919ee ******/
		%feature("compactdefaultargs") IsSmoothTransition;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Return True if color transition between neighbor intervals should be linearly interpolated, False by default.
") IsSmoothTransition;
		bool IsSmoothTransition();

		/****** AIS_ColorScale::Labels ******/
		/****** md5 signature: 49c4f79a7c7977a36a91af50b5215558 ******/
		%feature("compactdefaultargs") Labels;
		%feature("autodoc", "Return
-------
TColStd_SequenceOfExtendedString

Description
-----------
Returns the user specified labels.
") Labels;
		const TColStd_SequenceOfExtendedString & Labels();

		/****** AIS_ColorScale::MakeUniformColors ******/
		/****** md5 signature: f7e7dcaf615d48d82a7b30faaadf83ef ******/
		%feature("compactdefaultargs") MakeUniformColors;
		%feature("autodoc", "
Parameters
----------
theNbColors: int
theLightness: double
theHueFrom: double
theHueTo: double

Return
-------
NCollection_Sequence<Quantity_Color >

Description
-----------
Generates sequence of colors of the same lightness value in CIE Lch color space (see #Quantity_TOC_CIELch), with hue values in the specified range. The colors are distributed across the range such as to have perceptually same difference between neighbour colors. For each color, maximal chroma value fitting in sRGB gamut is used. //! 
Parameter theNbColors - number of colors to generate 
Parameter theLightness - lightness to be used (0 is black, 100 is white, 32 is lightness of pure blue) 
Parameter theHueFrom - hue value at the start of the scale 
Parameter theHueTo - hue value defining the end of the scale //! Hue value can be out of the range [0, 360], interpreted as modulo 360. The colors of the scale will be in the order of increasing hue if theHueTo > theHueFrom, and decreasing otherwise.
") MakeUniformColors;
		static NCollection_Sequence<Quantity_Color > MakeUniformColors(int theNbColors, double theLightness, double theHueFrom, double theHueTo);

		/****** AIS_ColorScale::SetBreadth ******/
		/****** md5 signature: 081eef7e4cd8fd1746af66326358696c ******/
		%feature("compactdefaultargs") SetBreadth;
		%feature("autodoc", "
Parameters
----------
theBreadth: int

Return
-------
None

Description
-----------
Sets the width of color bar.
") SetBreadth;
		void SetBreadth(const int theBreadth);

		/****** AIS_ColorScale::SetColorRange ******/
		/****** md5 signature: 3483915ea52d4e4643411a8644762be9 ******/
		%feature("compactdefaultargs") SetColorRange;
		%feature("autodoc", "
Parameters
----------
theMinColor: Quantity_Color
theMaxColor: Quantity_Color

Return
-------
None

Description
-----------
Sets color range corresponding to minimum and maximum values.
") SetColorRange;
		void SetColorRange(const Quantity_Color & theMinColor, const Quantity_Color & theMaxColor);

		/****** AIS_ColorScale::SetColorType ******/
		/****** md5 signature: ccb79408e792e85c00c45c6bb9b717ac ******/
		%feature("compactdefaultargs") SetColorType;
		%feature("autodoc", "
Parameters
----------
theType: Aspect_TypeOfColorScaleData

Return
-------
None

Description
-----------
Sets the type of colors. Aspect_TOCSD_AUTO - value between Red and Blue Aspect_TOCSD_USER - user specified color from color map.
") SetColorType;
		void SetColorType(const Aspect_TypeOfColorScaleData theType);

		/****** AIS_ColorScale::SetColors ******/
		/****** md5 signature: fe2baaa1068ede590c18dfcac773ef77 ******/
		%feature("compactdefaultargs") SetColors;
		%feature("autodoc", "
Parameters
----------
theSeq: NCollection_Sequence<Quantity_Color>

Return
-------
None

Description
-----------
Sets the color scale colors. The length of the sequence should be equal to GetNumberOfIntervals().
") SetColors;
		void SetColors(const NCollection_Sequence<Quantity_Color> & theSeq);

		/****** AIS_ColorScale::SetFormat ******/
		/****** md5 signature: db500bbac847facf0570542df6d698c0 ******/
		%feature("compactdefaultargs") SetFormat;
		%feature("autodoc", "
Parameters
----------
theFormat: str

Return
-------
None

Description
-----------
Sets the color scale auto label format specification.
") SetFormat;
		void SetFormat(TCollection_AsciiString theFormat);

		/****** AIS_ColorScale::SetHeight ******/
		/****** md5 signature: 613433fab1c1c83e503c5b775db5ce95 ******/
		%feature("compactdefaultargs") SetHeight;
		%feature("autodoc", "
Parameters
----------
theHeight: int

Return
-------
None

Description
-----------
Sets the height of color bar.
") SetHeight;
		void SetHeight(const int theHeight);

		/****** AIS_ColorScale::SetHueRange ******/
		/****** md5 signature: 70a2d3ddbf84e79ad17df0a921c257fa ******/
		%feature("compactdefaultargs") SetHueRange;
		%feature("autodoc", "
Parameters
----------
theMinAngle: double
theMaxAngle: double

Return
-------
None

Description
-----------
Sets hue angle range corresponding to minimum and maximum values. The valid angle range is [0, 360], see Quantity_Color and Quantity_TOC_HLS for more details.
") SetHueRange;
		void SetHueRange(const double theMinAngle, const double theMaxAngle);

		/****** AIS_ColorScale::SetIntervalColor ******/
		/****** md5 signature: 3eb3f6aee1285c5d59a88d5e71ba535e ******/
		%feature("compactdefaultargs") SetIntervalColor;
		%feature("autodoc", "
Parameters
----------
theColor: Quantity_Color
theIndex: int

Return
-------
None

Description
-----------
Sets the color of the specified interval. Note that list is automatically resized to include specified index. 
Parameter theColor color value to set 
Parameter theIndex index in range [1, GetNumberOfIntervals()];  appended to the end of list if -1 is specified.
") SetIntervalColor;
		void SetIntervalColor(const Quantity_Color & theColor, const int theIndex);

		/****** AIS_ColorScale::SetLabel ******/
		/****** md5 signature: 1a207ba2119b0d8d2158c4abfd275203 ******/
		%feature("compactdefaultargs") SetLabel;
		%feature("autodoc", "
Parameters
----------
theLabel: str
theIndex: int

Return
-------
None

Description
-----------
Sets the color scale label at index. Note that list is automatically resized to include specified index. 
Parameter theLabel new label text 
Parameter theIndex index in range [1, GetNumberOfIntervals()] or [1, GetNumberOfIntervals() + 1] if IsLabelAtBorder() is true;  label is appended to the end of list if negative index is specified.
") SetLabel;
		void SetLabel(TCollection_ExtendedString theLabel, const int theIndex);

		/****** AIS_ColorScale::SetLabelAtBorder ******/
		/****** md5 signature: 80291f513e32169133ac48ea5cd047dd ******/
		%feature("compactdefaultargs") SetLabelAtBorder;
		%feature("autodoc", "
Parameters
----------
theOn: bool

Return
-------
None

Description
-----------
Sets true if the labels are placed at border of color intervals (True by default). If set to False, labels will be drawn at color intervals rather than at borders.
") SetLabelAtBorder;
		void SetLabelAtBorder(const bool theOn);

		/****** AIS_ColorScale::SetLabelPosition ******/
		/****** md5 signature: f2079deb9de667b1bdebac8fa78780a5 ******/
		%feature("compactdefaultargs") SetLabelPosition;
		%feature("autodoc", "
Parameters
----------
thePos: Aspect_TypeOfColorScalePosition

Return
-------
None

Description
-----------
Sets the color scale labels position relative to color bar.
") SetLabelPosition;
		void SetLabelPosition(const Aspect_TypeOfColorScalePosition thePos);

		/****** AIS_ColorScale::SetLabelType ******/
		/****** md5 signature: 25ca56d3438d8f07cae52daa92e3c673 ******/
		%feature("compactdefaultargs") SetLabelType;
		%feature("autodoc", "
Parameters
----------
theType: Aspect_TypeOfColorScaleData

Return
-------
None

Description
-----------
Sets the type of labels. Aspect_TOCSD_AUTO - labels as boundary values for intervals Aspect_TOCSD_USER - user specified label is used.
") SetLabelType;
		void SetLabelType(const Aspect_TypeOfColorScaleData theType);

		/****** AIS_ColorScale::SetLabels ******/
		/****** md5 signature: 6733719fe9cf80c2b0a65d0635357ec3 ******/
		%feature("compactdefaultargs") SetLabels;
		%feature("autodoc", "
Parameters
----------
theSeq: TColStd_SequenceOfExtendedString

Return
-------
None

Description
-----------
Sets the color scale labels. The length of the sequence should be equal to GetNumberOfIntervals() or to GetNumberOfIntervals() + 1 if IsLabelAtBorder() is true. If length of the sequence does not much the number of intervals, then these labels will be considered as 'free' and will be located at the virtual intervals corresponding to the number of labels (with flag IsLabelAtBorder() having the same effect as in normal case).
") SetLabels;
		void SetLabels(const TColStd_SequenceOfExtendedString & theSeq);

		/****** AIS_ColorScale::SetLogarithmic ******/
		/****** md5 signature: cabe634b1cf5ade1e81622c3082e654e ******/
		%feature("compactdefaultargs") SetLogarithmic;
		%feature("autodoc", "
Parameters
----------
isLogarithmic: bool

Return
-------
None

Description
-----------
Sets true if the color scale has logarithmic intervals.
") SetLogarithmic;
		void SetLogarithmic(const bool isLogarithmic);

		/****** AIS_ColorScale::SetMax ******/
		/****** md5 signature: cfc94560ffe2f57784eb8471d50550ce ******/
		%feature("compactdefaultargs") SetMax;
		%feature("autodoc", "
Parameters
----------
theMax: double

Return
-------
None

Description
-----------
Sets the maximal value of color scale.
") SetMax;
		void SetMax(const double theMax);

		/****** AIS_ColorScale::SetMin ******/
		/****** md5 signature: 8fddfe56f8f6369fd0c54921468a4b23 ******/
		%feature("compactdefaultargs") SetMin;
		%feature("autodoc", "
Parameters
----------
theMin: double

Return
-------
None

Description
-----------
Sets the minimal value of color scale.
") SetMin;
		void SetMin(const double theMin);

		/****** AIS_ColorScale::SetNumberOfIntervals ******/
		/****** md5 signature: a4ec29e8e73841eca04f005569f85ca9 ******/
		%feature("compactdefaultargs") SetNumberOfIntervals;
		%feature("autodoc", "
Parameters
----------
theNum: int

Return
-------
None

Description
-----------
Sets the number of color scale intervals.
") SetNumberOfIntervals;
		void SetNumberOfIntervals(const int theNum);

		/****** AIS_ColorScale::SetPosition ******/
		/****** md5 signature: dd9aad818dda1fa694c79adb4c60138f ******/
		%feature("compactdefaultargs") SetPosition;
		%feature("autodoc", "
Parameters
----------
theX: int
theY: int

Return
-------
None

Description
-----------
Sets the position of color scale.
") SetPosition;
		void SetPosition(const int theX, const int theY);

		/****** AIS_ColorScale::SetRange ******/
		/****** md5 signature: 57051f4872473421e95b822c7ecaf89e ******/
		%feature("compactdefaultargs") SetRange;
		%feature("autodoc", "
Parameters
----------
theMin: double
theMax: double

Return
-------
None

Description
-----------
Sets the minimal and maximal value of color scale. Note that values order will be ignored - the minimum and maximum values will be swapped if needed. ::SetReversed() should be called to swap displaying order.
") SetRange;
		void SetRange(const double theMin, const double theMax);

		/****** AIS_ColorScale::SetReversed ******/
		/****** md5 signature: dfc491bda9fdb866f8f297b7c29d14d0 ******/
		%feature("compactdefaultargs") SetReversed;
		%feature("autodoc", "
Parameters
----------
theReverse: bool

Return
-------
None

Description
-----------
Sets true if the labels and colors used in reversed order.
") SetReversed;
		void SetReversed(const bool theReverse);

		/****** AIS_ColorScale::SetSize ******/
		/****** md5 signature: 93d58bfb6c07a1beaeb6cca99d779dde ******/
		%feature("compactdefaultargs") SetSize;
		%feature("autodoc", "
Parameters
----------
theBreadth: int
theHeight: int

Return
-------
None

Description
-----------
Sets the size of color bar.
") SetSize;
		void SetSize(const int theBreadth, const int theHeight);

		/****** AIS_ColorScale::SetSmoothTransition ******/
		/****** md5 signature: c55e25ec52d982e877d5ce59ec34fdaa ******/
		%feature("compactdefaultargs") SetSmoothTransition;
		%feature("autodoc", "
Parameters
----------
theIsSmooth: bool

Return
-------
None

Description
-----------
Setup smooth color transition.
") SetSmoothTransition;
		void SetSmoothTransition(const bool theIsSmooth);

		/****** AIS_ColorScale::SetTextHeight ******/
		/****** md5 signature: d3bc4e53aeb24e39cc975836b83b2999 ******/
		%feature("compactdefaultargs") SetTextHeight;
		%feature("autodoc", "
Parameters
----------
theHeight: int

Return
-------
None

Description
-----------
Sets the height of text of color scale.
") SetTextHeight;
		void SetTextHeight(const int theHeight);

		/****** AIS_ColorScale::SetTitle ******/
		/****** md5 signature: 1858779efdb47aad84406fafb11b64f2 ******/
		%feature("compactdefaultargs") SetTitle;
		%feature("autodoc", "
Parameters
----------
theTitle: str

Return
-------
None

Description
-----------
Sets the color scale title string.
") SetTitle;
		void SetTitle(TCollection_ExtendedString theTitle);

		/****** AIS_ColorScale::SetTitlePosition ******/
		/****** md5 signature: ffb68e1026952762986ee0e118b51626 ******/
		%feature("compactdefaultargs") SetTitlePosition;
		%feature("autodoc", "
Parameters
----------
thePos: Aspect_TypeOfColorScalePosition

Return
-------
None

Description
-----------
No available documentation.
") SetTitlePosition;
		void SetTitlePosition(const Aspect_TypeOfColorScalePosition thePos);

		/****** AIS_ColorScale::SetUniformColors ******/
		/****** md5 signature: 20bde5bd2465b277502e403b07950fb7 ******/
		%feature("compactdefaultargs") SetUniformColors;
		%feature("autodoc", "
Parameters
----------
theLightness: double
theHueFrom: double
theHueTo: double

Return
-------
None

Description
-----------
Populates colors scale by colors of the same lightness value in CIE Lch color space, distributed by hue, with perceptually uniform differences between consequent colors. See MakeUniformColors() for description of parameters.
") SetUniformColors;
		void SetUniformColors(double theLightness, double theHueFrom, double theHueTo);

		/****** AIS_ColorScale::SetXPosition ******/
		/****** md5 signature: e63638cdcff114d119d286778efdbf91 ******/
		%feature("compactdefaultargs") SetXPosition;
		%feature("autodoc", "
Parameters
----------
theX: int

Return
-------
None

Description
-----------
Sets the left position of color scale.
") SetXPosition;
		void SetXPosition(const int theX);

		/****** AIS_ColorScale::SetYPosition ******/
		/****** md5 signature: c6bf6df3147d521d86cee0d443dd09b4 ******/
		%feature("compactdefaultargs") SetYPosition;
		%feature("autodoc", "
Parameters
----------
theY: int

Return
-------
None

Description
-----------
Sets the bottom position of color scale.
") SetYPosition;
		void SetYPosition(const int theY);

		/****** AIS_ColorScale::TextHeight ******/
		/****** md5 signature: 7e56be17fc836452fd2f441cc2ff26ac ******/
		%feature("compactdefaultargs") TextHeight;
		%feature("autodoc", "
Parameters
----------
theText: str

Return
-------
int

Description
-----------
Returns the height of text. 
Input parameter: theText the text of which to calculate height.
") TextHeight;
		int TextHeight(TCollection_ExtendedString theText);

		/****** AIS_ColorScale::TextSize ******/
		/****** md5 signature: 06bfba0d38bde29446934cb76517cf8c ******/
		%feature("compactdefaultargs") TextSize;
		%feature("autodoc", "
Parameters
----------
theText: str
theHeight: int

Return
-------
theWidth: int
theAscent: int
theDescent: int

Description
-----------
No available documentation.
") TextSize;
		void TextSize(TCollection_ExtendedString theText, const int theHeight, Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue);

		/****** AIS_ColorScale::TextWidth ******/
		/****** md5 signature: 42967aaa92c27221b40af85fbf877974 ******/
		%feature("compactdefaultargs") TextWidth;
		%feature("autodoc", "
Parameters
----------
theText: str

Return
-------
int

Description
-----------
Returns the width of text. 
Input parameter: theText the text of which to calculate width.
") TextWidth;
		int TextWidth(TCollection_ExtendedString theText);

		/****** AIS_ColorScale::hueToValidRange ******/
		/****** md5 signature: 4f3d5b4df1b673c3f294cd1773474cac ******/
		%feature("compactdefaultargs") hueToValidRange;
		%feature("autodoc", "
Parameters
----------
theHue: double

Return
-------
double

Description
-----------
Shift hue into valid range. Lightness and Saturation should be specified in valid range [0.0, 1.0], however Hue might be given out of Quantity_Color range to specify desired range for interpolation.
") hueToValidRange;
		static double hueToValidRange(const double theHue);

};


%make_alias(AIS_ColorScale)

%extend AIS_ColorScale {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************
* class AIS_ConnectedInteractive *
*********************************/
class AIS_ConnectedInteractive : public AIS_InteractiveObject {
	public:
		/****** AIS_ConnectedInteractive::AIS_ConnectedInteractive ******/
		/****** md5 signature: 377e611268f08de16ae81b87c0243098 ******/
		%feature("compactdefaultargs") AIS_ConnectedInteractive;
		%feature("autodoc", "
Parameters
----------
aTypeOfPresentation3d: PrsMgr_TypeOfPresentation3d (optional, default to PrsMgr_TOP_AllView)

Return
-------
None

Description
-----------
Disconnects the previous view and sets highlight mode to 0. This highlights the wireframe presentation aTypeOfPresentation3d. Top_AllView deactivates hidden line removal.
") AIS_ConnectedInteractive;
		 AIS_ConnectedInteractive(const PrsMgr_TypeOfPresentation3d aTypeOfPresentation3d = PrsMgr_TOP_AllView);

		/****** AIS_ConnectedInteractive::AcceptDisplayMode ******/
		/****** md5 signature: 87fb12421b337c0d3c009064a10e954f ******/
		%feature("compactdefaultargs") AcceptDisplayMode;
		%feature("autodoc", "
Parameters
----------
theMode: int

Return
-------
bool

Description
-----------
Return true if reference presentation accepts specified display mode.
") AcceptDisplayMode;
		bool AcceptDisplayMode(const int theMode);

		/****** AIS_ConnectedInteractive::AcceptShapeDecomposition ******/
		/****** md5 signature: f7f4d7577ac331ad723892b4e07e1409 ******/
		%feature("compactdefaultargs") AcceptShapeDecomposition;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Informs the graphic context that the interactive Object may be decomposed into sub-shapes for dynamic selection.
") AcceptShapeDecomposition;
		bool AcceptShapeDecomposition();

		/****** AIS_ConnectedInteractive::Connect ******/
		/****** md5 signature: 76ce604e5db4b247a8706638259ec61c ******/
		%feature("compactdefaultargs") Connect;
		%feature("autodoc", "
Parameters
----------
theAnotherObj: AIS_InteractiveObject

Return
-------
None

Description
-----------
Establishes the connection between the Connected Interactive Object, anotherIobj, and its reference.
") Connect;
		void Connect(const opencascade::handle<AIS_InteractiveObject> & theAnotherObj);

		/****** AIS_ConnectedInteractive::Connect ******/
		/****** md5 signature: 966dfec391c604c7ae9629c925cdd1c4 ******/
		%feature("compactdefaultargs") Connect;
		%feature("autodoc", "
Parameters
----------
theAnotherObj: AIS_InteractiveObject
theLocation: gp_Trsf

Return
-------
None

Description
-----------
Establishes the connection between the Connected Interactive Object, anotherIobj, and its reference. Locates instance in aLocation.
") Connect;
		void Connect(const opencascade::handle<AIS_InteractiveObject> & theAnotherObj, const gp_Trsf & theLocation);

		/****** AIS_ConnectedInteractive::Connect ******/
		/****** md5 signature: 418505c88f7f147f47107d38894767f1 ******/
		%feature("compactdefaultargs") Connect;
		%feature("autodoc", "
Parameters
----------
theAnotherObj: AIS_InteractiveObject
theLocation: TopLoc_Datum3D

Return
-------
None

Description
-----------
Establishes the connection between the Connected Interactive Object, anotherIobj, and its reference. Locates instance in aLocation.
") Connect;
		void Connect(const opencascade::handle<AIS_InteractiveObject> & theAnotherObj, const opencascade::handle<TopLoc_Datum3D> & theLocation);

		/****** AIS_ConnectedInteractive::ConnectedTo ******/
		/****** md5 signature: 1541a2cb7b3a6f95f8064287356a8f2c ******/
		%feature("compactdefaultargs") ConnectedTo;
		%feature("autodoc", "Return
-------
opencascade::handle<AIS_InteractiveObject>

Description
-----------
Returns the connection with the reference Interactive Object.
") ConnectedTo;
		const opencascade::handle<AIS_InteractiveObject> & ConnectedTo();

		/****** AIS_ConnectedInteractive::Disconnect ******/
		/****** md5 signature: 3c68b068054eba545e5aa24799ed950d ******/
		%feature("compactdefaultargs") Disconnect;
		%feature("autodoc", "Return
-------
None

Description
-----------
Clears the connection with a source reference. The presentation will no longer be displayed. Warning Must be done before deleting the presentation.
") Disconnect;
		void Disconnect();

		/****** AIS_ConnectedInteractive::HasConnection ******/
		/****** md5 signature: c025ea6ca3a4f77c028c54dfca333111 ******/
		%feature("compactdefaultargs") HasConnection;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if there is a connection established between the presentation and its source reference.
") HasConnection;
		bool HasConnection();

		/****** AIS_ConnectedInteractive::Signature ******/
		/****** md5 signature: cb4be277567e09ceca8f8a2aaa8aa8fd ******/
		%feature("compactdefaultargs") Signature;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns 0.
") Signature;
		int Signature();

		/****** AIS_ConnectedInteractive::Type ******/
		/****** md5 signature: c88659fa26c5e97835681ebdf0f08b53 ******/
		%feature("compactdefaultargs") Type;
		%feature("autodoc", "Return
-------
AIS_KindOfInteractive

Description
-----------
Returns KOI_Object.
") Type;
		AIS_KindOfInteractive Type();

};


%make_alias(AIS_ConnectedInteractive)

%extend AIS_ConnectedInteractive {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************
* class AIS_LightSource *
************************/
class AIS_LightSource : public AIS_InteractiveObject {
	public:
		/****** AIS_LightSource::AIS_LightSource ******/
		/****** md5 signature: 0052d1e81d2de0d4f85d4355071d4c6e ******/
		%feature("compactdefaultargs") AIS_LightSource;
		%feature("autodoc", "
Parameters
----------
theLightSource: Graphic3d_CLight

Return
-------
None

Description
-----------
Initializes the light source by copying Graphic3d_CLight settings.
") AIS_LightSource;
		 AIS_LightSource(const opencascade::handle<Graphic3d_CLight> & theLightSource);

		/****** AIS_LightSource::ArcSize ******/
		/****** md5 signature: 462286f47b429daa42867a25dfdf9e67 ******/
		%feature("compactdefaultargs") ArcSize;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns Sensitive sphere arc size in pixels; 20 by default.
") ArcSize;
		int ArcSize();

		/****** AIS_LightSource::IsZoomable ******/
		/****** md5 signature: 0e11552facaac98faf2474f0071c0b9d ******/
		%feature("compactdefaultargs") IsZoomable;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if transform-persistence is allowed; True by default for Ambient and Directional lights and False by default for Positional and Spot lights.
") IsZoomable;
		bool IsZoomable();

		/****** AIS_LightSource::Light ******/
		/****** md5 signature: 214a553f85b1ef4686d7ae852494295b ******/
		%feature("compactdefaultargs") Light;
		%feature("autodoc", "Return
-------
opencascade::handle<Graphic3d_CLight>

Description
-----------
Returns the light.
") Light;
		const opencascade::handle<Graphic3d_CLight> & Light();

		/****** AIS_LightSource::MarkerImage ******/
		/****** md5 signature: 9fa6877c3a5222f7e4f2cd4481cff78c ******/
		%feature("compactdefaultargs") MarkerImage;
		%feature("autodoc", "
Parameters
----------
theIsEnabled: bool

Return
-------
opencascade::handle<Graphic3d_MarkerImage>

Description
-----------
Returns light source icon. 
Input parameter: theIsEnabled marker index for enabled/disabled light source states.
") MarkerImage;
		const opencascade::handle<Graphic3d_MarkerImage> & MarkerImage(bool theIsEnabled);

		/****** AIS_LightSource::MarkerType ******/
		/****** md5 signature: 9dc5f63506bba9b44b67e3b05b759d65 ******/
		%feature("compactdefaultargs") MarkerType;
		%feature("autodoc", "
Parameters
----------
theIsEnabled: bool

Return
-------
Aspect_TypeOfMarker

Description
-----------
Returns light source icon. 
Input parameter: theIsEnabled marker index for enabled/disabled light source states.
") MarkerType;
		Aspect_TypeOfMarker MarkerType(bool theIsEnabled);

		/****** AIS_LightSource::NbArrows ******/
		/****** md5 signature: 9f8807063c52b9fe1148a9c708c41b14 ******/
		%feature("compactdefaultargs") NbArrows;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns a number of directional light arrows to display; 5 by default.
") NbArrows;
		int NbArrows();

		/****** AIS_LightSource::NbSplitsArrow ******/
		/****** md5 signature: 690154cd7c72a6003a396ff77973966c ******/
		%feature("compactdefaultargs") NbSplitsArrow;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns tessellation level for arrows; 20 by default.
") NbSplitsArrow;
		int NbSplitsArrow();

		/****** AIS_LightSource::NbSplitsQuadric ******/
		/****** md5 signature: 788fdafdb031b59f161b5133640493cf ******/
		%feature("compactdefaultargs") NbSplitsQuadric;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns tessellation level for quadric surfaces; 30 by default.
") NbSplitsQuadric;
		int NbSplitsQuadric();

		/****** AIS_LightSource::SetArcSize ******/
		/****** md5 signature: 5c6702371700e9f3baebdbdd6b1121cb ******/
		%feature("compactdefaultargs") SetArcSize;
		%feature("autodoc", "
Parameters
----------
theSize: int

Return
-------
None

Description
-----------
Sets the size of sensitive sphere arc.
") SetArcSize;
		void SetArcSize(int theSize);

		/****** AIS_LightSource::SetDisplayName ******/
		/****** md5 signature: f91dc22af42905244b7d7eea83bf681c ******/
		%feature("compactdefaultargs") SetDisplayName;
		%feature("autodoc", "
Parameters
----------
theToDisplay: bool

Return
-------
None

Description
-----------
Show/hide light source name.
") SetDisplayName;
		void SetDisplayName(bool theToDisplay);

		/****** AIS_LightSource::SetDisplayRange ******/
		/****** md5 signature: 5bca78745f27e1fd966b167fb2f54d86 ******/
		%feature("compactdefaultargs") SetDisplayRange;
		%feature("autodoc", "
Parameters
----------
theToDisplay: bool

Return
-------
None

Description
-----------
Show/hide light source range shaded presentation.
") SetDisplayRange;
		void SetDisplayRange(bool theToDisplay);

		/****** AIS_LightSource::SetDraggable ******/
		/****** md5 signature: 5d216231b8eb7eb27307d5eb7408eefb ******/
		%feature("compactdefaultargs") SetDraggable;
		%feature("autodoc", "
Parameters
----------
theIsDraggable: bool

Return
-------
None

Description
-----------
Sets if dragging is allowed.
") SetDraggable;
		void SetDraggable(bool theIsDraggable);

		/****** AIS_LightSource::SetLight ******/
		/****** md5 signature: ce31662804605d4873b310f2a6d763c9 ******/
		%feature("compactdefaultargs") SetLight;
		%feature("autodoc", "
Parameters
----------
theLight: Graphic3d_CLight

Return
-------
None

Description
-----------
Set the light.
") SetLight;
		void SetLight(const opencascade::handle<Graphic3d_CLight> & theLight);

		/****** AIS_LightSource::SetMarkerImage ******/
		/****** md5 signature: dc256bfcd47e005efd4fe7461270e9e3 ******/
		%feature("compactdefaultargs") SetMarkerImage;
		%feature("autodoc", "
Parameters
----------
theImage: Graphic3d_MarkerImage
theIsEnabled: bool

Return
-------
None

Description
-----------
Sets custom icon to light source.
") SetMarkerImage;
		void SetMarkerImage(const opencascade::handle<Graphic3d_MarkerImage> & theImage, bool theIsEnabled);

		/****** AIS_LightSource::SetMarkerType ******/
		/****** md5 signature: 3f31956a7405775b0ff57aeb49f530f4 ******/
		%feature("compactdefaultargs") SetMarkerType;
		%feature("autodoc", "
Parameters
----------
theType: Aspect_TypeOfMarker
theIsEnabled: bool

Return
-------
None

Description
-----------
Sets standard icon to light source.
") SetMarkerType;
		void SetMarkerType(Aspect_TypeOfMarker theType, bool theIsEnabled);

		/****** AIS_LightSource::SetNbArrows ******/
		/****** md5 signature: 0b99fea63a9aa3f3187b37498a4b4279 ******/
		%feature("compactdefaultargs") SetNbArrows;
		%feature("autodoc", "
Parameters
----------
theNbArrows: int

Return
-------
None

Description
-----------
Returns a number of directional light arrows to display (supported values: 1, 3, 5, 9).
") SetNbArrows;
		void SetNbArrows(int theNbArrows);

		/****** AIS_LightSource::SetNbSplitsArrow ******/
		/****** md5 signature: b2049f7221b6e81d2c03c1da74c46f64 ******/
		%feature("compactdefaultargs") SetNbSplitsArrow;
		%feature("autodoc", "
Parameters
----------
theNbSplits: int

Return
-------
None

Description
-----------
Sets tessellation level for arrows.
") SetNbSplitsArrow;
		void SetNbSplitsArrow(int theNbSplits);

		/****** AIS_LightSource::SetNbSplitsQuadric ******/
		/****** md5 signature: 1edefedcfe8a35c67902147df1a12093 ******/
		%feature("compactdefaultargs") SetNbSplitsQuadric;
		%feature("autodoc", "
Parameters
----------
theNbSplits: int

Return
-------
None

Description
-----------
Sets tessellation level for quadric surfaces.
") SetNbSplitsQuadric;
		void SetNbSplitsQuadric(int theNbSplits);

		/****** AIS_LightSource::SetSize ******/
		/****** md5 signature: f02533c480116a8836347b3bf398bfa2 ******/
		%feature("compactdefaultargs") SetSize;
		%feature("autodoc", "
Parameters
----------
theSize: double

Return
-------
None

Description
-----------
Sets the size of presentation.
") SetSize;
		void SetSize(double theSize);

		/****** AIS_LightSource::SetSwitchOnClick ******/
		/****** md5 signature: 97b94ff7d25449db3028d59cb20146de ******/
		%feature("compactdefaultargs") SetSwitchOnClick;
		%feature("autodoc", "
Parameters
----------
theToHandle: bool

Return
-------
None

Description
-----------
Sets if mouse click should turn light on/off.
") SetSwitchOnClick;
		void SetSwitchOnClick(bool theToHandle);

		/****** AIS_LightSource::SetZoomable ******/
		/****** md5 signature: 97ffe04fce7ef540e2fce9a76dd33eaa ******/
		%feature("compactdefaultargs") SetZoomable;
		%feature("autodoc", "
Parameters
----------
theIsZoomable: bool

Return
-------
None

Description
-----------
Sets if transform-persistence is allowed.
") SetZoomable;
		void SetZoomable(bool theIsZoomable);

		/****** AIS_LightSource::Size ******/
		/****** md5 signature: a692f88e36fb51593b7dee1f407b647f ******/
		%feature("compactdefaultargs") Size;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns the size of presentation; 50 by default.
") Size;
		double Size();

		/****** AIS_LightSource::ToDisplayName ******/
		/****** md5 signature: 9a812a9f58a9537c5eb4333202e7aa12 ******/
		%feature("compactdefaultargs") ToDisplayName;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if the light source name should be displayed; True by default.
") ToDisplayName;
		bool ToDisplayName();

		/****** AIS_LightSource::ToDisplayRange ******/
		/****** md5 signature: 87ee189b751b6cf07ba2153f0bc15104 ******/
		%feature("compactdefaultargs") ToDisplayRange;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True to display light source range as sphere (positional light) or cone (spot light); True by default. Has no effect for non-zoomable presentation.
") ToDisplayRange;
		bool ToDisplayRange();

		/****** AIS_LightSource::ToSwitchOnClick ******/
		/****** md5 signature: ecdef05201eb6d53f5b9f95f9a193655 ******/
		%feature("compactdefaultargs") ToSwitchOnClick;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if mouse click will turn light on/off; True by default.
") ToSwitchOnClick;
		bool ToSwitchOnClick();

		/****** AIS_LightSource::Type ******/
		/****** md5 signature: c88659fa26c5e97835681ebdf0f08b53 ******/
		%feature("compactdefaultargs") Type;
		%feature("autodoc", "Return
-------
AIS_KindOfInteractive

Description
-----------
Returns kind of the object.
") Type;
		AIS_KindOfInteractive Type();

};


%make_alias(AIS_LightSource)

%extend AIS_LightSource {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************
* class AIS_Line *
*****************/
class AIS_Line : public AIS_InteractiveObject {
	public:
		/****** AIS_Line::AIS_Line ******/
		/****** md5 signature: 8bbcd784a7e573aad13b95eda3357ac2 ******/
		%feature("compactdefaultargs") AIS_Line;
		%feature("autodoc", "
Parameters
----------
aLine: Geom_Line

Return
-------
None

Description
-----------
Initializes the line aLine.
") AIS_Line;
		 AIS_Line(const opencascade::handle<Geom_Line> & aLine);

		/****** AIS_Line::AIS_Line ******/
		/****** md5 signature: 2068a18405f77f106bfd8618f346ed47 ******/
		%feature("compactdefaultargs") AIS_Line;
		%feature("autodoc", "
Parameters
----------
aStartPoint: Geom_Point
aEndPoint: Geom_Point

Return
-------
None

Description
-----------
Initializes a starting point aStartPoint and a finishing point aEndPoint for the line.
") AIS_Line;
		 AIS_Line(const opencascade::handle<Geom_Point> & aStartPoint, const opencascade::handle<Geom_Point> & aEndPoint);

		/****** AIS_Line::EndPoint ******/
		/****** md5 signature: ed614955d92defb23869b32dd539128f ******/
		%feature("compactdefaultargs") EndPoint;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom_Point>

Description
-----------
Returns the end point of the line set by SetPoints. 
Return: handle to the end point.
") EndPoint;
		const opencascade::handle<Geom_Point> & EndPoint();

		/****** AIS_Line::Line ******/
		/****** md5 signature: 3abeaae7f4e4373ddc51d06b177bee17 ******/
		%feature("compactdefaultargs") Line;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom_Line>

Description
-----------
Constructs an infinite line.
") Line;
		const opencascade::handle<Geom_Line> & Line();

		/****** AIS_Line::Points ******/
		/****** md5 signature: 4980115aa3f0510a68a255ca82f83258 ******/
		%feature("compactdefaultargs") Points;
		%feature("autodoc", "
Parameters
----------
thePStart: Geom_Point
thePEnd: Geom_Point

Return
-------
None

Description
-----------
No available documentation.
") Points;
		void Points(opencascade::handle<Geom_Point> & thePStart, opencascade::handle<Geom_Point> & thePEnd);

		/****** AIS_Line::SetColor ******/
		/****** md5 signature: e785f798cd798d31cee335b9cb87421c ******/
		%feature("compactdefaultargs") SetColor;
		%feature("autodoc", "
Parameters
----------
aColor: Quantity_Color

Return
-------
None

Description
-----------
Provides a new color setting aColor for the line in the drawing tool, or 'Drawer'.
") SetColor;
		void SetColor(const Quantity_Color & aColor);

		/****** AIS_Line::SetLine ******/
		/****** md5 signature: 1110fcc783ccf875a09ba25ff81a4115 ******/
		%feature("compactdefaultargs") SetLine;
		%feature("autodoc", "
Parameters
----------
theLine: Geom_Line

Return
-------
None

Description
-----------
Sets the infinite line. 
Input parameter: theLine the geometric line.
") SetLine;
		void SetLine(const opencascade::handle<Geom_Line> & theLine);

		/****** AIS_Line::SetPoints ******/
		/****** md5 signature: ce5646c69ff404ac863ce5401ebb4524 ******/
		%feature("compactdefaultargs") SetPoints;
		%feature("autodoc", "
Parameters
----------
thePStart: Geom_Point
thePEnd: Geom_Point

Return
-------
None

Description
-----------
Sets the starting point and ending point of the infinite line to create a finite line segment. 
Input parameter: thePStart the starting point 
Input parameter: thePEnd the ending point.
") SetPoints;
		void SetPoints(const opencascade::handle<Geom_Point> & thePStart, const opencascade::handle<Geom_Point> & thePEnd);

		/****** AIS_Line::SetWidth ******/
		/****** md5 signature: 5c28197685e1a227390e8b87486b22a0 ******/
		%feature("compactdefaultargs") SetWidth;
		%feature("autodoc", "
Parameters
----------
aValue: double

Return
-------
None

Description
-----------
Provides the new width setting aValue for the line in the drawing tool, or 'Drawer'.
") SetWidth;
		void SetWidth(const double aValue);

		/****** AIS_Line::Signature ******/
		/****** md5 signature: cb4be277567e09ceca8f8a2aaa8aa8fd ******/
		%feature("compactdefaultargs") Signature;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the signature 5.
") Signature;
		int Signature();

		/****** AIS_Line::StartPoint ******/
		/****** md5 signature: 03321fa36c60926a347276869574d7ff ******/
		%feature("compactdefaultargs") StartPoint;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom_Point>

Description
-----------
Returns the starting point of the line set by SetPoints. 
Return: handle to the start point.
") StartPoint;
		const opencascade::handle<Geom_Point> & StartPoint();

		/****** AIS_Line::Type ******/
		/****** md5 signature: c88659fa26c5e97835681ebdf0f08b53 ******/
		%feature("compactdefaultargs") Type;
		%feature("autodoc", "Return
-------
AIS_KindOfInteractive

Description
-----------
Returns the type Datum.
") Type;
		AIS_KindOfInteractive Type();

		/****** AIS_Line::UnsetColor ******/
		/****** md5 signature: 11f9cda4f631b34a4be33c2bf7cf48b1 ******/
		%feature("compactdefaultargs") UnsetColor;
		%feature("autodoc", "Return
-------
None

Description
-----------
Removes the color setting and returns the original color.
") UnsetColor;
		void UnsetColor();

		/****** AIS_Line::UnsetWidth ******/
		/****** md5 signature: 806020285b21e0f143ac65d1e797f644 ******/
		%feature("compactdefaultargs") UnsetWidth;
		%feature("autodoc", "Return
-------
None

Description
-----------
Removes the width setting and returns the original width.
") UnsetWidth;
		void UnsetWidth();

};


%make_alias(AIS_Line)

%extend AIS_Line {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************
* class AIS_Manipulator *
************************/
class AIS_Manipulator : public AIS_InteractiveObject {
	public:
		class OptionsForAttach {};
		class BehaviorOnTransform {};
		class Quadric {};
		class Disk {};
		class Sphere {};
		class Cube {};
		class Sector {};
		class Axis {};
/* public enums */
enum ManipulatorSkin {
	ManipulatorSkin_Shaded = 0,
	ManipulatorSkin_Flat = 1,
};

/* end public enums declaration */

/* python proxy classes for enums */
%pythoncode {

class ManipulatorSkin(IntEnum):
	ManipulatorSkin_Shaded = 0
	ManipulatorSkin_Flat = 1
ManipulatorSkin_Shaded = ManipulatorSkin.ManipulatorSkin_Shaded
ManipulatorSkin_Flat = ManipulatorSkin.ManipulatorSkin_Flat
};
/* end python proxy for enums */

		/****** AIS_Manipulator::AIS_Manipulator ******/
		/****** md5 signature: d6d73953b5293a4bb9f85d59f84e4550 ******/
		%feature("compactdefaultargs") AIS_Manipulator;
		%feature("autodoc", "Return
-------
None

Description
-----------
Constructs a manipulator object with default placement and all parts to be displayed.
") AIS_Manipulator;
		 AIS_Manipulator();

		/****** AIS_Manipulator::AIS_Manipulator ******/
		/****** md5 signature: a673beebf1686d05fab2c9b57d63a9d3 ******/
		%feature("compactdefaultargs") AIS_Manipulator;
		%feature("autodoc", "
Parameters
----------
thePosition: gp_Ax2

Return
-------
None

Description
-----------
Constructs a manipulator object with input location and positions of axes and all parts to be displayed.
") AIS_Manipulator;
		 AIS_Manipulator(const gp_Ax2 & thePosition);

		/****** AIS_Manipulator::ActiveAxisIndex ******/
		/****** md5 signature: 16fc90a82e47c60e9e00322c25f0dc89 ******/
		%feature("compactdefaultargs") ActiveAxisIndex;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") ActiveAxisIndex;
		int ActiveAxisIndex();

		/****** AIS_Manipulator::ActiveMode ******/
		/****** md5 signature: 518316bdc464c63b5a1ab2fd9b9e2cb2 ******/
		%feature("compactdefaultargs") ActiveMode;
		%feature("autodoc", "Return
-------
AIS_ManipulatorMode

Description
-----------
No available documentation.
") ActiveMode;
		AIS_ManipulatorMode ActiveMode();

		/****** AIS_Manipulator::Attach ******/
		/****** md5 signature: 7d386f66b57656d8a31beb14cb6ab6be ******/
		%feature("compactdefaultargs") Attach;
		%feature("autodoc", "
Parameters
----------
theObject: AIS_InteractiveObject
theOptions: OptionsForAttach (optional, default to OptionsForAttach())

Return
-------
None

Description
-----------
Attaches himself to the input interactive object and become displayed in the same context. It is placed in the center of object bounding box, and its size is adjusted to the object bounding box.
") Attach;
		void Attach(const opencascade::handle<AIS_InteractiveObject> & theObject, OptionsForAttach theOptions = OptionsForAttach());

		/****** AIS_Manipulator::Attach ******/
		/****** md5 signature: e81daaa7c4db147811656c51aecb38b4 ******/
		%feature("compactdefaultargs") Attach;
		%feature("autodoc", "
Parameters
----------
theObject: NCollection_HSequence<
theOptions: OptionsForAttach (optional, default to OptionsForAttach())

Return
-------
None

Description
-----------
Attaches himself to the input interactive object group and become displayed in the same context. It become attached to the first object, baut manage manipulation of the whole group. It is placed in the center of object bounding box, and its size is adjusted to the object bounding box.
") Attach;
		void Attach(const opencascade::handle<NCollection_HSequence<opencascade::handle<AIS_InteractiveObject>> > & theObject, OptionsForAttach theOptions = OptionsForAttach());

		/****** AIS_Manipulator::ClearSelected ******/
		/****** md5 signature: bbf73c5d3ff19ae0db25243e1c446610 ******/
		%feature("compactdefaultargs") ClearSelected;
		%feature("autodoc", "Return
-------
None

Description
-----------
Method which clear all selected owners belonging to this selectable object (for fast presentation draw).
") ClearSelected;
		void ClearSelected();

		/****** AIS_Manipulator::Compute ******/
		/****** md5 signature: 26eb7e31f3632d89998a902a197dae4e ******/
		%feature("compactdefaultargs") Compute;
		%feature("autodoc", "
Parameters
----------
thePrsMgr: PrsMgr_PresentationManager
thePrs: Prs3d_Presentation
theMode: int (optional, default to 0)

Return
-------
None

Description
-----------
Fills presentation. @note Manipulator presentation does not use display mode and for all modes has the same presentation.
") Compute;
		void Compute(const opencascade::handle<PrsMgr_PresentationManager> & thePrsMgr, const opencascade::handle<Prs3d_Presentation> & thePrs, const int theMode = 0);

		/****** AIS_Manipulator::ComputeSelection ******/
		/****** md5 signature: 80bbf2353e570b22648f0171cb224c2f ******/
		%feature("compactdefaultargs") ComputeSelection;
		%feature("autodoc", "
Parameters
----------
theSelection: SelectMgr_Selection
theMode: int

Return
-------
None

Description
-----------
Computes selection sensitive zones (triangulation) for manipulator. 
Input parameter: theNode Selection mode that is treated as transformation mode.
") ComputeSelection;
		void ComputeSelection(const opencascade::handle<SelectMgr_Selection> & theSelection, const int theMode);

		/****** AIS_Manipulator::DeactivateCurrentMode ******/
		/****** md5 signature: 9f9d413f44f19c0e451cbd2d4a724668 ******/
		%feature("compactdefaultargs") DeactivateCurrentMode;
		%feature("autodoc", "Return
-------
None

Description
-----------
Make inactive the current selected manipulator part and reset current axis index and current mode. After its call HasActiveMode() returns false. 
See also: HasActiveMode().
") DeactivateCurrentMode;
		void DeactivateCurrentMode();

		/****** AIS_Manipulator::Detach ******/
		/****** md5 signature: 7ff09e11641571ebd32a8aea4ee5c9d7 ******/
		%feature("compactdefaultargs") Detach;
		%feature("autodoc", "Return
-------
None

Description
-----------
Detaches himself from the owner object, and removes itself from context.
") Detach;
		void Detach();

		/****** AIS_Manipulator::EnableMode ******/
		/****** md5 signature: ed430e32069c676de349fa1b988e84c2 ******/
		%feature("compactdefaultargs") EnableMode;
		%feature("autodoc", "
Parameters
----------
theMode: AIS_ManipulatorMode

Return
-------
None

Description
-----------
Enable manipualtion mode. @warning It activates selection mode in the current context. If manipulator is not displayed, no mode will be activated.
") EnableMode;
		void EnableMode(const AIS_ManipulatorMode theMode);

		/****** AIS_Manipulator::HasActiveMode ******/
		/****** md5 signature: 8600d8c13a3d7cb5acfb3c23ea95281b ******/
		%feature("compactdefaultargs") HasActiveMode;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Return: true if some part of manipulator is selected (transformation mode is active, and owning object can be transformed).
") HasActiveMode;
		bool HasActiveMode();

		/****** AIS_Manipulator::HasActiveTransformation ******/
		/****** md5 signature: 68a4007839b430a17ba55849dfa71a16 ******/
		%feature("compactdefaultargs") HasActiveTransformation;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") HasActiveTransformation;
		bool HasActiveTransformation();

		/****** AIS_Manipulator::HilightOwnerWithColor ******/
		/****** md5 signature: 0f2fbe3928cdfd19fd4ac5881486f69b ******/
		%feature("compactdefaultargs") HilightOwnerWithColor;
		%feature("autodoc", "
Parameters
----------
thePM: PrsMgr_PresentationManager
theStyle: Prs3d_Drawer
theOwner: SelectMgr_EntityOwner

Return
-------
None

Description
-----------
Method which hilight an owner belonging to this selectable object (for fast presentation draw).
") HilightOwnerWithColor;
		void HilightOwnerWithColor(const opencascade::handle<PrsMgr_PresentationManager> & thePM, const opencascade::handle<Prs3d_Drawer> & theStyle, const opencascade::handle<SelectMgr_EntityOwner> & theOwner);

		/****** AIS_Manipulator::HilightSelected ******/
		/****** md5 signature: c640a133511288b142f57f56721031c6 ******/
		%feature("compactdefaultargs") HilightSelected;
		%feature("autodoc", "
Parameters
----------
thePM: PrsMgr_PresentationManager
theSeq: SelectMgr_EntityOwner

Return
-------
None

Description
-----------
Method which draws selected owners (for fast presentation draw).
") HilightSelected;
		void HilightSelected(const opencascade::handle<PrsMgr_PresentationManager> & thePM, const NCollection_Sequence<opencascade::handle<SelectMgr_EntityOwner>> & theSeq);

		/****** AIS_Manipulator::IsAttached ******/
		/****** md5 signature: cc16703b3093937bcc6e1b23813c2195 ******/
		%feature("compactdefaultargs") IsAttached;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Return: true if manipulator is attached to some interactive object (has owning object).
") IsAttached;
		bool IsAttached();

		/****** AIS_Manipulator::IsAutoHilight ******/
		/****** md5 signature: 3edec92a3a77c7631dfaa86f05f1e7b8 ******/
		%feature("compactdefaultargs") IsAutoHilight;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Disables auto highlighting to use HilightSelected() and HilightOwnerWithColor() overridden methods.
") IsAutoHilight;
		bool IsAutoHilight();

		/****** AIS_Manipulator::IsModeActivationOnDetection ******/
		/****** md5 signature: cfd43ec22931a6b9ad5ac5bbecb6ffca ******/
		%feature("compactdefaultargs") IsModeActivationOnDetection;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Return: true if manual mode activation is enabled.
") IsModeActivationOnDetection;
		bool IsModeActivationOnDetection();

		/****** AIS_Manipulator::Object ******/
		/****** md5 signature: 7f1f823e7838d5f1ace29947c6685976 ******/
		%feature("compactdefaultargs") Object;
		%feature("autodoc", "Return
-------
opencascade::handle<AIS_InteractiveObject>

Description
-----------
Return: the first (leading) object of the owning objects.
") Object;
		opencascade::handle<AIS_InteractiveObject> Object();

		/****** AIS_Manipulator::Object ******/
		/****** md5 signature: 12969e7d33ee41b24ef3fef9f55774d5 ******/
		%feature("compactdefaultargs") Object;
		%feature("autodoc", "
Parameters
----------
theIndex: int

Return
-------
opencascade::handle<AIS_InteractiveObject>

Description
-----------
Return: one of the owning objects. @warning raises program error if theIndex is more than owning objects count or less than 1.
") Object;
		opencascade::handle<AIS_InteractiveObject> Object(const int theIndex);

		/****** AIS_Manipulator::ObjectTransformation ******/
		/****** md5 signature: 42bb017354ab834147173e480fd8aa9a ******/
		%feature("compactdefaultargs") ObjectTransformation;
		%feature("autodoc", "
Parameters
----------
theX: int
theY: int
theView: V3d_View
theTrsf: gp_Trsf

Return
-------
bool

Description
-----------
Computes transformation of parent object according to the active mode and input motion vector. You can use this method to get object transformation according to current mode or use own algorithm to implement any other transformation for modes. 
Return: transformation of parent object.
") ObjectTransformation;
		bool ObjectTransformation(const int theX, const int theY, const opencascade::handle<V3d_View> & theView, gp_Trsf & theTrsf);

		/****** AIS_Manipulator::Objects ******/
		/****** md5 signature: 36361bd3242a0b1cf6831855448c36c5 ******/
		%feature("compactdefaultargs") Objects;
		%feature("autodoc", "Return
-------
opencascade::handle<NCollection_HSequence<opencascade::handle<AIS_InteractiveObject>>>

Description
-----------
Return: all owning objects.
") Objects;
		opencascade::handle<NCollection_HSequence<opencascade::handle<AIS_InteractiveObject>>> Objects();

		/****** AIS_Manipulator::Position ******/
		/****** md5 signature: 0919c787263d4f8ff9c1e18688f5d16c ******/
		%feature("compactdefaultargs") Position;
		%feature("autodoc", "Return
-------
gp_Ax2

Description
-----------
Return: poition of manipulator interactive object.
") Position;
		const gp_Ax2 Position();

		/****** AIS_Manipulator::ProcessDragging ******/
		/****** md5 signature: 98d82902a92c5c36ccec18e402021dc0 ******/
		%feature("compactdefaultargs") ProcessDragging;
		%feature("autodoc", "
Parameters
----------
theCtx: AIS_InteractiveContext
theView: V3d_View
theOwner: SelectMgr_EntityOwner
theDragFrom: NCollection_Vec2<int>
theDragTo: NCollection_Vec2<int>
theAction: AIS_DragAction

Return
-------
bool

Description
-----------
Drag object in the viewer. 
Input parameter: theCtx interactive context 
Input parameter: theView active View 
Input parameter: theOwner the owner of detected entity 
Input parameter: theDragFrom drag start point 
Input parameter: theDragTo drag end point 
Input parameter: theAction drag action 
Return: False if object rejects dragging action (e.g. AIS_DragAction_Start).
") ProcessDragging;
		bool ProcessDragging(const opencascade::handle<AIS_InteractiveContext> & theCtx, const opencascade::handle<V3d_View> & theView, const opencascade::handle<SelectMgr_EntityOwner> & theOwner, const NCollection_Vec2<int> & theDragFrom, const NCollection_Vec2<int> & theDragTo, const AIS_DragAction theAction);

		/****** AIS_Manipulator::RecomputeSelection ******/
		/****** md5 signature: 25d3db43686d21021cd3d58d65eb3a05 ******/
		%feature("compactdefaultargs") RecomputeSelection;
		%feature("autodoc", "
Parameters
----------
theMode: AIS_ManipulatorMode

Return
-------
None

Description
-----------
Recomputes sensitive primitives for the given selection mode. 
Parameter theMode selection mode to recompute sensitive primitives.
") RecomputeSelection;
		void RecomputeSelection(const AIS_ManipulatorMode theMode);

		/****** AIS_Manipulator::RecomputeTransformation ******/
		/****** md5 signature: 8dc1b6ee195f605f7bb8ac3afa3ff0b6 ******/
		%feature("compactdefaultargs") RecomputeTransformation;
		%feature("autodoc", "
Parameters
----------
theCamera: Graphic3d_Camera

Return
-------
None

Description
-----------
Apply camera transformation to flat skin manipulator.
") RecomputeTransformation;
		void RecomputeTransformation(const opencascade::handle<Graphic3d_Camera> & theCamera);

		/****** AIS_Manipulator::SetGap ******/
		/****** md5 signature: 34a70aca647b8da0bf885eabb106ca84 ******/
		%feature("compactdefaultargs") SetGap;
		%feature("autodoc", "
Parameters
----------
theValue: float

Return
-------
None

Description
-----------
Sets gaps between translator, scaler and rotator sub-presentations.
") SetGap;
		void SetGap(const float theValue);

		/****** AIS_Manipulator::SetModeActivationOnDetection ******/
		/****** md5 signature: a57c70ae2ee134c5382b54be93eeb849 ******/
		%feature("compactdefaultargs") SetModeActivationOnDetection;
		%feature("autodoc", "
Parameters
----------
theToEnable: bool

Return
-------
None

Description
-----------
Enables mode activation on detection (highlighting). By default, mode is activated on selection of manipulator part. @warning If this mode is enabled, selection of parts does nothing.
") SetModeActivationOnDetection;
		void SetModeActivationOnDetection(const bool theToEnable);

		/****** AIS_Manipulator::SetPart ******/
		/****** md5 signature: 663ccaa902a3377defda03af1215225a ******/
		%feature("compactdefaultargs") SetPart;
		%feature("autodoc", "
Parameters
----------
theAxisIndex: int
theMode: AIS_ManipulatorMode
theIsEnabled: bool

Return
-------
None

Description
-----------
Disable or enable visual parts for translation, rotation or scaling for some axis. By default all parts are enabled (will be displayed). @warning Enabling or disabling of visual parts of manipulator does not manage the manipulation (selection) mode. @warning Raises program error if axis index is < 0 or > 2.
") SetPart;
		void SetPart(const int theAxisIndex, const AIS_ManipulatorMode theMode, const bool theIsEnabled);

		/****** AIS_Manipulator::SetPart ******/
		/****** md5 signature: 7f407eb43c0a11c72268b79bf747c764 ******/
		%feature("compactdefaultargs") SetPart;
		%feature("autodoc", "
Parameters
----------
theMode: AIS_ManipulatorMode
theIsEnabled: bool

Return
-------
None

Description
-----------
Disable or enable visual parts for translation, rotation or scaling for ALL axes. By default all parts are enabled (will be displayed). @warning Enabling or disabling of visual parts of manipulator does not manage the manipulation (selection) mode. @warning Raises program error if axis index is < 0 or > 2.
") SetPart;
		void SetPart(const AIS_ManipulatorMode theMode, const bool theIsEnabled);

		/****** AIS_Manipulator::SetPosition ******/
		/****** md5 signature: 3065dca0a8eb5a2b508f4791a4ae43c1 ******/
		%feature("compactdefaultargs") SetPosition;
		%feature("autodoc", "
Parameters
----------
thePosition: gp_Ax2

Return
-------
None

Description
-----------
Sets position of the manipulator object.
") SetPosition;
		void SetPosition(const gp_Ax2 & thePosition);

		/****** AIS_Manipulator::SetSize ******/
		/****** md5 signature: f457d03d9792e72e347e91dabad08ed1 ******/
		%feature("compactdefaultargs") SetSize;
		%feature("autodoc", "
Parameters
----------
theSideLength: float

Return
-------
None

Description
-----------
Sets size (length of side of the manipulator cubic bounding box.
") SetSize;
		void SetSize(const float theSideLength);

		/****** AIS_Manipulator::SetSkinMode ******/
		/****** md5 signature: 54ec9dc8d4d778610619c493ddb68c31 ******/
		%feature("compactdefaultargs") SetSkinMode;
		%feature("autodoc", "
Parameters
----------
theSkinMode: ManipulatorSkin

Return
-------
None

Description
-----------
Sets skin mode for the manipulator.
") SetSkinMode;
		void SetSkinMode(ManipulatorSkin theSkinMode);

		/****** AIS_Manipulator::SetTransformPersistence ******/
		/****** md5 signature: dc27fa0d40bba6d6964684d0589efaf5 ******/
		%feature("compactdefaultargs") SetTransformPersistence;
		%feature("autodoc", "
Parameters
----------
theTrsfPers: Graphic3d_TransformPers

Return
-------
None

Description
-----------
Redefines transform persistence management to setup transformation for sub-presentation of axes. @warning this interactive object does not support custom transformation persistence when using \sa ZoomPersistence mode. In this mode the transformation persistence flags for presentations are overridden by this class. @warning Invokes debug assertion to catch incompatible usage of the method with \sa ZoomPersistence mode, silently does nothing in release mode. @warning revise use of AdjustSize argument of of \sa AttachToObjects method when enabling zoom persistence.
") SetTransformPersistence;
		void SetTransformPersistence(const opencascade::handle<Graphic3d_TransformPers> & theTrsfPers);

		/****** AIS_Manipulator::SetZoomPersistence ******/
		/****** md5 signature: eed438f38fbdda3820c6427ead6d357d ******/
		%feature("compactdefaultargs") SetZoomPersistence;
		%feature("autodoc", "
Parameters
----------
theToEnable: bool

Return
-------
None

Description
-----------
Enable or disable zoom persistence mode for the manipulator. With this mode turned on the presentation will keep fixed screen size. @warning when turned on this option overrides transform persistence properties and local transformation to achieve necessary visual effect. @warning revise use of AdjustSize argument of of \sa AttachToObjects method when enabling zoom persistence.
") SetZoomPersistence;
		void SetZoomPersistence(const bool theToEnable);

		/****** AIS_Manipulator::Size ******/
		/****** md5 signature: 8a06ba6b4796ff3f051dcea596087e95 ******/
		%feature("compactdefaultargs") Size;
		%feature("autodoc", "Return
-------
float

Description
-----------
No available documentation.
") Size;
		float Size();

		/****** AIS_Manipulator::SkinMode ******/
		/****** md5 signature: 688c8135f1ec26fffa795d0d9d9cd548 ******/
		%feature("compactdefaultargs") SkinMode;
		%feature("autodoc", "Return
-------
AIS_Manipulator::ManipulatorSkin

Description
-----------
Return: current manipulator skin mode.
") SkinMode;
		AIS_Manipulator::ManipulatorSkin SkinMode();

		/****** AIS_Manipulator::StartTransform ******/
		/****** md5 signature: d88b751614f50fa654732cce76432c24 ******/
		%feature("compactdefaultargs") StartTransform;
		%feature("autodoc", "
Parameters
----------
theX: int
theY: int
theView: V3d_View

Return
-------
None

Description
-----------
Init start (reference) transformation. @warning It is used in chain with StartTransform-Transform(gp_Trsf)-StopTransform and is used only for custom transform set. If Transform(const int, const int) is used, initial data is set automatically, and it is reset on DeactivateCurrentMode call if it is not reset yet.
") StartTransform;
		void StartTransform(const int theX, const int theY, const opencascade::handle<V3d_View> & theView);

		/****** AIS_Manipulator::StartTransformation ******/
		/****** md5 signature: 8eb6cc7b893f18d392ff6c57e93767a3 ******/
		%feature("compactdefaultargs") StartTransformation;
		%feature("autodoc", "Return
-------
gp_Trsf

Description
-----------
No available documentation.
") StartTransformation;
		gp_Trsf StartTransformation();

		/****** AIS_Manipulator::StartTransformation ******/
		/****** md5 signature: d4d7d5dc7ef176013b4fa909d0e5a46c ******/
		%feature("compactdefaultargs") StartTransformation;
		%feature("autodoc", "
Parameters
----------
theIndex: int

Return
-------
gp_Trsf

Description
-----------
No available documentation.
") StartTransformation;
		gp_Trsf StartTransformation(int theIndex);

		/****** AIS_Manipulator::StopTransform ******/
		/****** md5 signature: a9d94cc5dfc02bc90932062f2b544e11 ******/
		%feature("compactdefaultargs") StopTransform;
		%feature("autodoc", "
Parameters
----------
theToApply: bool (optional, default to true)

Return
-------
None

Description
-----------
Reset start (reference) transformation. 
Input parameter: theToApply option to apply or to cancel the started transformation. @warning It is used in chain with StartTransform-Transform(gp_Trsf)-StopTransform and is used only for custom transform set.
") StopTransform;
		void StopTransform(const bool theToApply = true);

		/****** AIS_Manipulator::Transform ******/
		/****** md5 signature: 70cd3856c03eefd4d3419cd64304b204 ******/
		%feature("compactdefaultargs") Transform;
		%feature("autodoc", "
Parameters
----------
aTrsf: gp_Trsf

Return
-------
None

Description
-----------
Apply to the owning objects the input transformation. @remark The transformation is set using SetLocalTransformation for owning objects. The location of the manipulator is stored also in Local Transformation, so that there's no need to redisplay objects. @warning It is used in chain with StartTransform-Transform(gp_Trsf)-StopTransform and is used only for custom transform set. @warning It will does nothing if transformation is not initiated (with StartTransform() call).
") Transform;
		void Transform(const gp_Trsf & aTrsf);

		/****** AIS_Manipulator::Transform ******/
		/****** md5 signature: 584ec3cf93cc2cd41f54bfd23ce0e9f1 ******/
		%feature("compactdefaultargs") Transform;
		%feature("autodoc", "
Parameters
----------
theX: int
theY: int
theView: V3d_View

Return
-------
gp_Trsf

Description
-----------
Apply transformation made from mouse moving from start position (save on the first Transform() call and reset on DeactivateCurrentMode() call.) to the in/out mouse position (theX, theY).
") Transform;
		gp_Trsf Transform(const int theX, const int theY, const opencascade::handle<V3d_View> & theView);

		/****** AIS_Manipulator::ZoomPersistence ******/
		/****** md5 signature: 13f1d236f008221543d4402cd2da4491 ******/
		%feature("compactdefaultargs") ZoomPersistence;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns state of zoom persistence mode, whether it turned on or off.
") ZoomPersistence;
		bool ZoomPersistence();

};


%make_alias(AIS_Manipulator)

%extend AIS_Manipulator {
	%pythoncode {
	__repr__ = _dumps_object

	@methodnotwrapped
	def TransformBehavior(self):
		pass

	@methodnotwrapped
	def ChangeTransformBehavior(self):
		pass

	@methodnotwrapped
	def SetTransformBehavior(self):
		pass
	}
};

/************************
* class AIS_MediaPlayer *
************************/
class AIS_MediaPlayer : public AIS_InteractiveObject {
	public:
		/****** AIS_MediaPlayer::AIS_MediaPlayer ******/
		/****** md5 signature: 0446d23899803b089df6bd8d6821c9e2 ******/
		%feature("compactdefaultargs") AIS_MediaPlayer;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") AIS_MediaPlayer;
		 AIS_MediaPlayer();

		/****** AIS_MediaPlayer::Duration ******/
		/****** md5 signature: 7dbbe5f7e0b63b92819c252fd1239f67 ******/
		%feature("compactdefaultargs") Duration;
		%feature("autodoc", "Return
-------
double

Description
-----------
Return duration.
") Duration;
		double Duration();

		/****** AIS_MediaPlayer::OpenInput ******/
		/****** md5 signature: d26354b811f0c9d27e0306b4e1650003 ******/
		%feature("compactdefaultargs") OpenInput;
		%feature("autodoc", "
Parameters
----------
thePath: str
theToWait: bool

Return
-------
None

Description
-----------
Open specified file.
") OpenInput;
		void OpenInput(TCollection_AsciiString thePath, bool theToWait);

		/****** AIS_MediaPlayer::PlayPause ******/
		/****** md5 signature: 811ffa83708da2acdc8d22e930c8cece ******/
		%feature("compactdefaultargs") PlayPause;
		%feature("autodoc", "Return
-------
None

Description
-----------
Switch playback state.
") PlayPause;
		void PlayPause();

		/****** AIS_MediaPlayer::PlayerContext ******/
		/****** md5 signature: 5fc0e0cbec11700279e3e8631feee60b ******/
		%feature("compactdefaultargs") PlayerContext;
		%feature("autodoc", "Return
-------
opencascade::handle<Media_PlayerContext>

Description
-----------
Return player context.
") PlayerContext;
		const opencascade::handle<Media_PlayerContext> & PlayerContext();

		/****** AIS_MediaPlayer::PresentFrame ******/
		/****** md5 signature: 8606f60f7f4c331ee6dd9423096ae224 ******/
		%feature("compactdefaultargs") PresentFrame;
		%feature("autodoc", "
Parameters
----------
theLeftCorner: NCollection_Vec2<int>
theMaxSize: NCollection_Vec2<int>

Return
-------
bool

Description
-----------
Display new frame.
") PresentFrame;
		bool PresentFrame(const NCollection_Vec2<int> & theLeftCorner, const NCollection_Vec2<int> & theMaxSize);

		/****** AIS_MediaPlayer::SetCallback ******/
		/****** md5 signature: 6e4600666f30d884b42d87dfd0954e3a ******/
		%feature("compactdefaultargs") SetCallback;
		%feature("autodoc", "
Parameters
----------
theCallbackFunction: Graphic3d_MediaTextureSet::CallbackOnUpdate_t
theCallbackUserPtr: void *

Return
-------
None

Description
-----------
Setup callback to be called on queue progress (e.g. when new frame should be displayed).
") SetCallback;
		void SetCallback(Graphic3d_MediaTextureSet::CallbackOnUpdate_t theCallbackFunction, void * theCallbackUserPtr);

		/****** AIS_MediaPlayer::SetClosePlayer ******/
		/****** md5 signature: 3032f6e42b741faba7f30fd3218ff7e7 ******/
		%feature("compactdefaultargs") SetClosePlayer;
		%feature("autodoc", "Return
-------
None

Description
-----------
Schedule player to be closed.
") SetClosePlayer;
		void SetClosePlayer();

};


%make_alias(AIS_MediaPlayer)

%extend AIS_MediaPlayer {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************************
* class AIS_MultipleConnectedInteractive *
*****************************************/
class AIS_MultipleConnectedInteractive : public AIS_InteractiveObject {
	public:
		/****** AIS_MultipleConnectedInteractive::AIS_MultipleConnectedInteractive ******/
		/****** md5 signature: fba70400b7faac2115b274698220e2c9 ******/
		%feature("compactdefaultargs") AIS_MultipleConnectedInteractive;
		%feature("autodoc", "Return
-------
None

Description
-----------
Initializes the Interactive Object with multiple connections to AIS_Interactive objects.
") AIS_MultipleConnectedInteractive;
		 AIS_MultipleConnectedInteractive();

		/****** AIS_MultipleConnectedInteractive::AcceptShapeDecomposition ******/
		/****** md5 signature: 8e13c8aa243289fd3f141cf46dc0f1c3 ******/
		%feature("compactdefaultargs") AcceptShapeDecomposition;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Informs the graphic context that the interactive Object may be decomposed into sub-shapes for dynamic selection.
") AcceptShapeDecomposition;
		bool AcceptShapeDecomposition();

		/****** AIS_MultipleConnectedInteractive::Connect ******/
		/****** md5 signature: 9456f753f89ea1d3d12e6c7e4b293e0f ******/
		%feature("compactdefaultargs") Connect;
		%feature("autodoc", "
Parameters
----------
theAnotherObj: AIS_InteractiveObject
theLocation: TopLoc_Datum3D
theTrsfPers: Graphic3d_TransformPers

Return
-------
opencascade::handle<AIS_InteractiveObject>

Description
-----------
Establishes the connection between the Connected Interactive Object, theInteractive, and its reference. Locates instance in theLocation and applies specified transformation persistence mode. 
Return: created instance object (AIS_ConnectedInteractive or AIS_MultipleConnectedInteractive).
") Connect;
		opencascade::handle<AIS_InteractiveObject> Connect(const opencascade::handle<AIS_InteractiveObject> & theAnotherObj, const opencascade::handle<TopLoc_Datum3D> & theLocation, const opencascade::handle<Graphic3d_TransformPers> & theTrsfPers);

		/****** AIS_MultipleConnectedInteractive::Connect ******/
		/****** md5 signature: d10a69c61a6c9d8b102edd8739b7f2b4 ******/
		%feature("compactdefaultargs") Connect;
		%feature("autodoc", "
Parameters
----------
theAnotherObj: AIS_InteractiveObject

Return
-------
opencascade::handle<AIS_InteractiveObject>

Description
-----------
Establishes the connection between the Connected Interactive Object, theInteractive, and its reference. Copies local transformation and transformation persistence mode from theInteractive. 
Return: created instance object (AIS_ConnectedInteractive or AIS_MultipleConnectedInteractive).
") Connect;
		opencascade::handle<AIS_InteractiveObject> Connect(const opencascade::handle<AIS_InteractiveObject> & theAnotherObj);

		/****** AIS_MultipleConnectedInteractive::Connect ******/
		/****** md5 signature: 99ccdf3ecba8a64760230d69d1f05173 ******/
		%feature("compactdefaultargs") Connect;
		%feature("autodoc", "
Parameters
----------
theAnotherObj: AIS_InteractiveObject
theLocation: gp_Trsf

Return
-------
opencascade::handle<AIS_InteractiveObject>

Description
-----------
Establishes the connection between the Connected Interactive Object, theInteractive, and its reference. Locates instance in theLocation and copies transformation persistence mode from theInteractive. 
Return: created instance object (AIS_ConnectedInteractive or AIS_MultipleConnectedInteractive).
") Connect;
		opencascade::handle<AIS_InteractiveObject> Connect(const opencascade::handle<AIS_InteractiveObject> & theAnotherObj, const gp_Trsf & theLocation);

		/****** AIS_MultipleConnectedInteractive::Connect ******/
		/****** md5 signature: fe47f9ee36bde7f16ff1155bf0cfd849 ******/
		%feature("compactdefaultargs") Connect;
		%feature("autodoc", "
Parameters
----------
theAnotherObj: AIS_InteractiveObject
theLocation: gp_Trsf
theTrsfPers: Graphic3d_TransformPers

Return
-------
opencascade::handle<AIS_InteractiveObject>

Description
-----------
Establishes the connection between the Connected Interactive Object, theInteractive, and its reference. Locates instance in theLocation and applies specified transformation persistence mode. 
Return: created instance object (AIS_ConnectedInteractive or AIS_MultipleConnectedInteractive).
") Connect;
		opencascade::handle<AIS_InteractiveObject> Connect(const opencascade::handle<AIS_InteractiveObject> & theAnotherObj, const gp_Trsf & theLocation, const opencascade::handle<Graphic3d_TransformPers> & theTrsfPers);

		/****** AIS_MultipleConnectedInteractive::Disconnect ******/
		/****** md5 signature: 8baee36d436931ddbde7f0643b9e8f4a ******/
		%feature("compactdefaultargs") Disconnect;
		%feature("autodoc", "
Parameters
----------
theInteractive: AIS_InteractiveObject

Return
-------
None

Description
-----------
Removes the connection with theInteractive.
") Disconnect;
		void Disconnect(const opencascade::handle<AIS_InteractiveObject> & theInteractive);

		/****** AIS_MultipleConnectedInteractive::DisconnectAll ******/
		/****** md5 signature: 6ff75930eb4fe3a9d24be8bb57ecbce1 ******/
		%feature("compactdefaultargs") DisconnectAll;
		%feature("autodoc", "Return
-------
None

Description
-----------
Clears all the connections to objects.
") DisconnectAll;
		void DisconnectAll();

		/****** AIS_MultipleConnectedInteractive::GetAssemblyOwner ******/
		/****** md5 signature: 75a115a129477621715eba48593359f9 ******/
		%feature("compactdefaultargs") GetAssemblyOwner;
		%feature("autodoc", "Return
-------
opencascade::handle<SelectMgr_EntityOwner>

Description
-----------
Returns common entity owner if the object is an assembly.
") GetAssemblyOwner;
		const opencascade::handle<SelectMgr_EntityOwner> & GetAssemblyOwner();

		/****** AIS_MultipleConnectedInteractive::GlobalSelOwner ******/
		/****** md5 signature: 0a5947f02b4b0e4889696234407a4d87 ******/
		%feature("compactdefaultargs") GlobalSelOwner;
		%feature("autodoc", "Return
-------
opencascade::handle<SelectMgr_EntityOwner>

Description
-----------
Returns the owner of mode for selection of object as a whole.
") GlobalSelOwner;
		opencascade::handle<SelectMgr_EntityOwner> GlobalSelOwner();

		/****** AIS_MultipleConnectedInteractive::HasConnection ******/
		/****** md5 signature: 69120b80fb87d68dea90e8bcaa83e5ec ******/
		%feature("compactdefaultargs") HasConnection;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if the object is connected to others.
") HasConnection;
		bool HasConnection();

		/****** AIS_MultipleConnectedInteractive::SetContext ******/
		/****** md5 signature: 5ceb3b0304e69d834bf54db1d6f9f782 ******/
		%feature("compactdefaultargs") SetContext;
		%feature("autodoc", "
Parameters
----------
theCtx: AIS_InteractiveContext

Return
-------
None

Description
-----------
Assigns interactive context.
") SetContext;
		void SetContext(const opencascade::handle<AIS_InteractiveContext> & theCtx);

		/****** AIS_MultipleConnectedInteractive::Signature ******/
		/****** md5 signature: cb4be277567e09ceca8f8a2aaa8aa8fd ******/
		%feature("compactdefaultargs") Signature;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") Signature;
		int Signature();

		/****** AIS_MultipleConnectedInteractive::Type ******/
		/****** md5 signature: c88659fa26c5e97835681ebdf0f08b53 ******/
		%feature("compactdefaultargs") Type;
		%feature("autodoc", "Return
-------
AIS_KindOfInteractive

Description
-----------
No available documentation.
") Type;
		AIS_KindOfInteractive Type();

};


%make_alias(AIS_MultipleConnectedInteractive)

%extend AIS_MultipleConnectedInteractive {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************
* class AIS_Plane *
******************/
class AIS_Plane : public AIS_InteractiveObject {
	public:
		/****** AIS_Plane::AIS_Plane ******/
		/****** md5 signature: fe918ba5c298bdd003b0bac990858b42 ******/
		%feature("compactdefaultargs") AIS_Plane;
		%feature("autodoc", "
Parameters
----------
aComponent: Geom_Plane
aCurrentMode: bool (optional, default to false)

Return
-------
None

Description
-----------
initializes the plane aComponent. If the mode aCurrentMode equals true, the drawing tool, 'Drawer' is not initialized.
") AIS_Plane;
		 AIS_Plane(const opencascade::handle<Geom_Plane> & aComponent, const bool aCurrentMode = false);

		/****** AIS_Plane::AIS_Plane ******/
		/****** md5 signature: f6f211fc801a0f176e3af44a111bf247 ******/
		%feature("compactdefaultargs") AIS_Plane;
		%feature("autodoc", "
Parameters
----------
aComponent: Geom_Plane
aCenter: gp_Pnt
aCurrentMode: bool (optional, default to false)

Return
-------
None

Description
-----------
initializes the plane aComponent and the point aCenter. If the mode aCurrentMode equals true, the drawing tool, 'Drawer' is not initialized. aCurrentMode equals true, the drawing tool, 'Drawer' is not initialized.
") AIS_Plane;
		 AIS_Plane(const opencascade::handle<Geom_Plane> & aComponent, const gp_Pnt & aCenter, const bool aCurrentMode = false);

		/****** AIS_Plane::AIS_Plane ******/
		/****** md5 signature: bee27642952eef77b4fe4d5eefccc2d2 ******/
		%feature("compactdefaultargs") AIS_Plane;
		%feature("autodoc", "
Parameters
----------
aComponent: Geom_Plane
aCenter: gp_Pnt
aPmin: gp_Pnt
aPmax: gp_Pnt
aCurrentMode: bool (optional, default to false)

Return
-------
None

Description
-----------
initializes the plane aComponent, the point aCenter, and the minimum and maximum points, aPmin and aPmax. If the mode aCurrentMode equals true, the drawing tool, 'Drawer' is not initialized.
") AIS_Plane;
		 AIS_Plane(const opencascade::handle<Geom_Plane> & aComponent, const gp_Pnt & aCenter, const gp_Pnt & aPmin, const gp_Pnt & aPmax, const bool aCurrentMode = false);

		/****** AIS_Plane::AIS_Plane ******/
		/****** md5 signature: 907762d00d6daa4b6a0acc23a552f8e5 ******/
		%feature("compactdefaultargs") AIS_Plane;
		%feature("autodoc", "
Parameters
----------
aComponent: Geom_Axis2Placement
aPlaneType: AIS_TypeOfPlane
aCurrentMode: bool (optional, default to false)

Return
-------
None

Description
-----------
No available documentation.
") AIS_Plane;
		 AIS_Plane(const opencascade::handle<Geom_Axis2Placement> & aComponent, const AIS_TypeOfPlane aPlaneType, const bool aCurrentMode = false);

		/****** AIS_Plane::AcceptDisplayMode ******/
		/****** md5 signature: bc48ea6a4869b14bc142f86833b6d516 ******/
		%feature("compactdefaultargs") AcceptDisplayMode;
		%feature("autodoc", "
Parameters
----------
aMode: int

Return
-------
bool

Description
-----------
Returns true if the display mode selected, aMode, is valid for planes.
") AcceptDisplayMode;
		bool AcceptDisplayMode(const int aMode);

		/****** AIS_Plane::Axis2Placement ******/
		/****** md5 signature: 37877c5e97ab627517b822b230b8b22b ******/
		%feature("compactdefaultargs") Axis2Placement;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom_Axis2Placement>

Description
-----------
Returns the position of the plane's axis2 system identifying the x, y, or z axis and giving the plane a direction in 3D space. An axis2 system is a right-handed coordinate system.
") Axis2Placement;
		opencascade::handle<Geom_Axis2Placement> Axis2Placement();

		/****** AIS_Plane::Center ******/
		/****** md5 signature: 76b3760b23b8ce2c654d603f295e0c0d ******/
		%feature("compactdefaultargs") Center;
		%feature("autodoc", "Return
-------
gp_Pnt

Description
-----------
Returns the coordinates of the center point.
") Center;
		const gp_Pnt Center();

		/****** AIS_Plane::Component ******/
		/****** md5 signature: 303a9682f54bbdacc71e8f17577c38b3 ******/
		%feature("compactdefaultargs") Component;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom_Plane>

Description
-----------
Returns the component specified in SetComponent.
") Component;
		const opencascade::handle<Geom_Plane> & Component();

		/****** AIS_Plane::ComputeSelection ******/
		/****** md5 signature: 80bbf2353e570b22648f0171cb224c2f ******/
		%feature("compactdefaultargs") ComputeSelection;
		%feature("autodoc", "
Parameters
----------
theSelection: SelectMgr_Selection
theMode: int

Return
-------
None

Description
-----------
No available documentation.
") ComputeSelection;
		void ComputeSelection(const opencascade::handle<SelectMgr_Selection> & theSelection, const int theMode);

		/****** AIS_Plane::CurrentMode ******/
		/****** md5 signature: c5486aaef7feed9c4e9aee7b1e61a1b2 ******/
		%feature("compactdefaultargs") CurrentMode;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns the non-default current display mode set by SetCurrentMode.
") CurrentMode;
		bool CurrentMode();

		/****** AIS_Plane::HasMinimumSize ******/
		/****** md5 signature: 4c6ecc8bb9e4a8e55908f9251e7d9cfe ******/
		%feature("compactdefaultargs") HasMinimumSize;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if transform persistence for zoom is set.
") HasMinimumSize;
		bool HasMinimumSize();

		/****** AIS_Plane::HasOwnSize ******/
		/****** md5 signature: 59eab499ef3ea5e219a14642fe120d7f ******/
		%feature("compactdefaultargs") HasOwnSize;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") HasOwnSize;
		bool HasOwnSize();

		/****** AIS_Plane::IsXYZPlane ******/
		/****** md5 signature: dace7697370f98652a1f3b54e7387e5a ******/
		%feature("compactdefaultargs") IsXYZPlane;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns the type of plane - xy, yz, or xz.
") IsXYZPlane;
		bool IsXYZPlane();

		/****** AIS_Plane::PlaneAttributes ******/
		/****** md5 signature: 1da89a9cd6db1a06998ee9a07fc4ca69 ******/
		%feature("compactdefaultargs") PlaneAttributes;
		%feature("autodoc", "
Parameters
----------
aComponent: Geom_Plane
aCenter: gp_Pnt
aPmin: gp_Pnt
aPmax: gp_Pnt

Return
-------
bool

Description
-----------
Returns the settings for the selected plane aComponent, provided in SetPlaneAttributes. These include the points aCenter, aPmin, and aPmax.
") PlaneAttributes;
		bool PlaneAttributes(opencascade::handle<Geom_Plane> & aComponent, gp_Pnt & aCenter, gp_Pnt & aPmin, gp_Pnt & aPmax);

		/****** AIS_Plane::SetAxis2Placement ******/
		/****** md5 signature: d73d8eb41254415fddcc962ddec5e469 ******/
		%feature("compactdefaultargs") SetAxis2Placement;
		%feature("autodoc", "
Parameters
----------
aComponent: Geom_Axis2Placement
aPlaneType: AIS_TypeOfPlane

Return
-------
None

Description
-----------
Allows you to provide settings for the position and direction of one of the plane's axes, aComponent, in 3D space. The coordinate system used is right-handed, and the type of plane aPlaneType is one of: - AIS_ TOPL_Unknown - AIS_ TOPL_XYPlane - AIS_ TOPL_XZPlane - AIS_ TOPL_YZPlane}.
") SetAxis2Placement;
		void SetAxis2Placement(const opencascade::handle<Geom_Axis2Placement> & aComponent, const AIS_TypeOfPlane aPlaneType);

		/****** AIS_Plane::SetCenter ******/
		/****** md5 signature: ecf3b6f0e545b80cc6040218013c7da9 ******/
		%feature("compactdefaultargs") SetCenter;
		%feature("autodoc", "
Parameters
----------
theCenter: gp_Pnt

Return
-------
None

Description
-----------
Provides settings for the center theCenter other than (0, 0, 0).
") SetCenter;
		void SetCenter(const gp_Pnt & theCenter);

		/****** AIS_Plane::SetColor ******/
		/****** md5 signature: e785f798cd798d31cee335b9cb87421c ******/
		%feature("compactdefaultargs") SetColor;
		%feature("autodoc", "
Parameters
----------
aColor: Quantity_Color

Return
-------
None

Description
-----------
No available documentation.
") SetColor;
		void SetColor(const Quantity_Color & aColor);

		/****** AIS_Plane::SetComponent ******/
		/****** md5 signature: cabe0299a719dc64171b081f75779f2e ******/
		%feature("compactdefaultargs") SetComponent;
		%feature("autodoc", "
Parameters
----------
aComponent: Geom_Plane

Return
-------
None

Description
-----------
Creates an instance of the plane aComponent.
") SetComponent;
		void SetComponent(const opencascade::handle<Geom_Plane> & aComponent);

		/****** AIS_Plane::SetContext ******/
		/****** md5 signature: 09bfcc9e4758e1809bbba4333225ea96 ******/
		%feature("compactdefaultargs") SetContext;
		%feature("autodoc", "
Parameters
----------
aCtx: AIS_InteractiveContext

Return
-------
None

Description
-----------
connection to <aCtx> default drawer implies a recomputation of Frame values.
") SetContext;
		void SetContext(const opencascade::handle<AIS_InteractiveContext> & aCtx);

		/****** AIS_Plane::SetCurrentMode ******/
		/****** md5 signature: 27b21dd8c26d62c37f2731cfad633e36 ******/
		%feature("compactdefaultargs") SetCurrentMode;
		%feature("autodoc", "
Parameters
----------
theCurrentMode: bool

Return
-------
None

Description
-----------
Allows you to provide settings for a non-default current display mode.
") SetCurrentMode;
		void SetCurrentMode(const bool theCurrentMode);

		/****** AIS_Plane::SetMinimumSize ******/
		/****** md5 signature: 6f964aa72f18d91893d90bf59e046bde ******/
		%feature("compactdefaultargs") SetMinimumSize;
		%feature("autodoc", "
Parameters
----------
theValue: double

Return
-------
None

Description
-----------
Sets transform persistence for zoom with value of minimum size.
") SetMinimumSize;
		void SetMinimumSize(const double theValue);

		/****** AIS_Plane::SetPlaneAttributes ******/
		/****** md5 signature: fcab47c7809627db9a9877e1b1b1ecfc ******/
		%feature("compactdefaultargs") SetPlaneAttributes;
		%feature("autodoc", "
Parameters
----------
aComponent: Geom_Plane
aCenter: gp_Pnt
aPmin: gp_Pnt
aPmax: gp_Pnt

Return
-------
None

Description
-----------
Allows you to provide settings other than default ones for the selected plane. These include: center point aCenter, maximum aPmax and minimum aPmin.
") SetPlaneAttributes;
		void SetPlaneAttributes(const opencascade::handle<Geom_Plane> & aComponent, const gp_Pnt & aCenter, const gp_Pnt & aPmin, const gp_Pnt & aPmax);

		/****** AIS_Plane::SetSize ******/
		/****** md5 signature: c003287ad7f3d116ebb0790c1961d5c8 ******/
		%feature("compactdefaultargs") SetSize;
		%feature("autodoc", "
Parameters
----------
aValue: double

Return
-------
None

Description
-----------
Same value for x and y directions.
") SetSize;
		void SetSize(const double aValue);

		/****** AIS_Plane::SetSize ******/
		/****** md5 signature: 0adfd44536ff435bf72acad9bea834e8 ******/
		%feature("compactdefaultargs") SetSize;
		%feature("autodoc", "
Parameters
----------
Xval: double
YVal: double

Return
-------
None

Description
-----------
Sets the size defined by the length along the X axis XVal and the length along the Y axis YVal.
") SetSize;
		void SetSize(const double Xval, const double YVal);

		/****** AIS_Plane::SetTypeOfSensitivity ******/
		/****** md5 signature: 0961922ef3f5c20bfe8405bc7846dadb ******/
		%feature("compactdefaultargs") SetTypeOfSensitivity;
		%feature("autodoc", "
Parameters
----------
theTypeOfSensitivity: Select3D_TypeOfSensitivity

Return
-------
None

Description
-----------
Sets the type of sensitivity for the plane.
") SetTypeOfSensitivity;
		void SetTypeOfSensitivity(Select3D_TypeOfSensitivity theTypeOfSensitivity);

		/****** AIS_Plane::Signature ******/
		/****** md5 signature: cb4be277567e09ceca8f8a2aaa8aa8fd ******/
		%feature("compactdefaultargs") Signature;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") Signature;
		int Signature();

		/****** AIS_Plane::Size ******/
		/****** md5 signature: 6d5c245fcbef2eaafb7399831fbc00ee ******/
		%feature("compactdefaultargs") Size;
		%feature("autodoc", "
Parameters
----------

Return
-------
X: double
Y: double

Description
-----------
No available documentation.
") Size;
		bool Size(Standard_Real &OutValue, Standard_Real &OutValue);

		/****** AIS_Plane::Type ******/
		/****** md5 signature: c88659fa26c5e97835681ebdf0f08b53 ******/
		%feature("compactdefaultargs") Type;
		%feature("autodoc", "Return
-------
AIS_KindOfInteractive

Description
-----------
No available documentation.
") Type;
		AIS_KindOfInteractive Type();

		/****** AIS_Plane::TypeOfPlane ******/
		/****** md5 signature: b5d4b79d2d9f478b8bfb8f6f08aeff9a ******/
		%feature("compactdefaultargs") TypeOfPlane;
		%feature("autodoc", "Return
-------
AIS_TypeOfPlane

Description
-----------
Returns the type of plane - xy, yz, xz or unknown.
") TypeOfPlane;
		AIS_TypeOfPlane TypeOfPlane();

		/****** AIS_Plane::TypeOfSensitivity ******/
		/****** md5 signature: c53b1e467cd6a018aa2a82b303f3ed51 ******/
		%feature("compactdefaultargs") TypeOfSensitivity;
		%feature("autodoc", "Return
-------
Select3D_TypeOfSensitivity

Description
-----------
Returns the type of sensitivity for the plane;.
") TypeOfSensitivity;
		Select3D_TypeOfSensitivity TypeOfSensitivity();

		/****** AIS_Plane::UnsetColor ******/
		/****** md5 signature: 11f9cda4f631b34a4be33c2bf7cf48b1 ******/
		%feature("compactdefaultargs") UnsetColor;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") UnsetColor;
		void UnsetColor();

		/****** AIS_Plane::UnsetMinimumSize ******/
		/****** md5 signature: 455188e1c9c74ff00306b83f10dccb0d ******/
		%feature("compactdefaultargs") UnsetMinimumSize;
		%feature("autodoc", "Return
-------
None

Description
-----------
Unsets transform persistence zoom.
") UnsetMinimumSize;
		void UnsetMinimumSize();

		/****** AIS_Plane::UnsetSize ******/
		/****** md5 signature: 01e2703c873bbcb3ae46d4b247bdacb6 ******/
		%feature("compactdefaultargs") UnsetSize;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") UnsetSize;
		void UnsetSize();

};


%make_alias(AIS_Plane)

%extend AIS_Plane {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************
* class AIS_PlaneTrihedron *
***************************/
class AIS_PlaneTrihedron : public AIS_InteractiveObject {
	public:
		/****** AIS_PlaneTrihedron::AIS_PlaneTrihedron ******/
		/****** md5 signature: ae783f3a176a7a2444c5f23672eaf5c5 ******/
		%feature("compactdefaultargs") AIS_PlaneTrihedron;
		%feature("autodoc", "
Parameters
----------
aPlane: Geom_Plane

Return
-------
None

Description
-----------
Initializes the plane aPlane. The plane trihedron is constructed from this and an axis.
") AIS_PlaneTrihedron;
		 AIS_PlaneTrihedron(const opencascade::handle<Geom_Plane> & aPlane);

		/****** AIS_PlaneTrihedron::AcceptDisplayMode ******/
		/****** md5 signature: bc48ea6a4869b14bc142f86833b6d516 ******/
		%feature("compactdefaultargs") AcceptDisplayMode;
		%feature("autodoc", "
Parameters
----------
aMode: int

Return
-------
bool

Description
-----------
Returns true if the display mode selected, aMode, is valid.
") AcceptDisplayMode;
		bool AcceptDisplayMode(const int aMode);

		/****** AIS_PlaneTrihedron::Component ******/
		/****** md5 signature: e2c0d02519a70a2ebf4ac43e0b834b9e ******/
		%feature("compactdefaultargs") Component;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom_Plane>

Description
-----------
Returns the component specified in SetComponent.
") Component;
		opencascade::handle<Geom_Plane> Component();

		/****** AIS_PlaneTrihedron::GetLength ******/
		/****** md5 signature: 11d25f6ae6c88d05783a64e3684ffaed ******/
		%feature("compactdefaultargs") GetLength;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns the length of X and Y axes.
") GetLength;
		double GetLength();

		/****** AIS_PlaneTrihedron::Position ******/
		/****** md5 signature: 7d9aba563ce6c4534b6f60ef5450366a ******/
		%feature("compactdefaultargs") Position;
		%feature("autodoc", "Return
-------
opencascade::handle<AIS_Point>

Description
-----------
Returns the point of origin of the plane trihedron.
") Position;
		opencascade::handle<AIS_Point> Position();

		/****** AIS_PlaneTrihedron::SetColor ******/
		/****** md5 signature: b174106500deaf4ecfa505bb8ae6784c ******/
		%feature("compactdefaultargs") SetColor;
		%feature("autodoc", "
Parameters
----------
theColor: Quantity_Color

Return
-------
None

Description
-----------
Allows you to provide settings for the color aColor.
") SetColor;
		void SetColor(const Quantity_Color & theColor);

		/****** AIS_PlaneTrihedron::SetComponent ******/
		/****** md5 signature: 1bca8d1d2d75bebfbc41ee846bfa84a1 ******/
		%feature("compactdefaultargs") SetComponent;
		%feature("autodoc", "
Parameters
----------
aPlane: Geom_Plane

Return
-------
None

Description
-----------
Creates an instance of the component object aPlane.
") SetComponent;
		void SetComponent(const opencascade::handle<Geom_Plane> & aPlane);

		/****** AIS_PlaneTrihedron::SetLength ******/
		/****** md5 signature: fcccb272de2cb183143003c4f3e12b43 ******/
		%feature("compactdefaultargs") SetLength;
		%feature("autodoc", "
Parameters
----------
theLength: double

Return
-------
None

Description
-----------
Sets the length of the X and Y axes.
") SetLength;
		void SetLength(const double theLength);

		/****** AIS_PlaneTrihedron::SetXLabel ******/
		/****** md5 signature: 77db9994f4c4890941ca57fa8eb88e9a ******/
		%feature("compactdefaultargs") SetXLabel;
		%feature("autodoc", "
Parameters
----------
theLabel: str

Return
-------
None

Description
-----------
No available documentation.
") SetXLabel;
		void SetXLabel(TCollection_AsciiString theLabel);

		/****** AIS_PlaneTrihedron::SetYLabel ******/
		/****** md5 signature: 8fe68a257c14798d817c0a27a82042b8 ******/
		%feature("compactdefaultargs") SetYLabel;
		%feature("autodoc", "
Parameters
----------
theLabel: str

Return
-------
None

Description
-----------
No available documentation.
") SetYLabel;
		void SetYLabel(TCollection_AsciiString theLabel);

		/****** AIS_PlaneTrihedron::Signature ******/
		/****** md5 signature: cb4be277567e09ceca8f8a2aaa8aa8fd ******/
		%feature("compactdefaultargs") Signature;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") Signature;
		int Signature();

		/****** AIS_PlaneTrihedron::Type ******/
		/****** md5 signature: c88659fa26c5e97835681ebdf0f08b53 ******/
		%feature("compactdefaultargs") Type;
		%feature("autodoc", "Return
-------
AIS_KindOfInteractive

Description
-----------
Returns datum as the type of Interactive Object.
") Type;
		AIS_KindOfInteractive Type();

		/****** AIS_PlaneTrihedron::XAxis ******/
		/****** md5 signature: e4128aaf660a4951e55140d350cd10f9 ******/
		%feature("compactdefaultargs") XAxis;
		%feature("autodoc", "Return
-------
opencascade::handle<AIS_Line>

Description
-----------
Returns the 'XAxis'.
") XAxis;
		opencascade::handle<AIS_Line> XAxis();

		/****** AIS_PlaneTrihedron::YAxis ******/
		/****** md5 signature: 0a267871ff2869b09e2a9b41404ae03b ******/
		%feature("compactdefaultargs") YAxis;
		%feature("autodoc", "Return
-------
opencascade::handle<AIS_Line>

Description
-----------
Returns the 'YAxis'.
") YAxis;
		opencascade::handle<AIS_Line> YAxis();

};


%make_alias(AIS_PlaneTrihedron)

%extend AIS_PlaneTrihedron {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************
* class AIS_Point *
******************/
class AIS_Point : public AIS_InteractiveObject {
	public:
		/****** AIS_Point::AIS_Point ******/
		/****** md5 signature: 2f1f87ccd8789d1b41f61f012d372bc1 ******/
		%feature("compactdefaultargs") AIS_Point;
		%feature("autodoc", "
Parameters
----------
aComponent: Geom_Point

Return
-------
None

Description
-----------
Initializes the point aComponent from which the point datum will be built.
") AIS_Point;
		 AIS_Point(const opencascade::handle<Geom_Point> & aComponent);

		/****** AIS_Point::AcceptDisplayMode ******/
		/****** md5 signature: bc48ea6a4869b14bc142f86833b6d516 ******/
		%feature("compactdefaultargs") AcceptDisplayMode;
		%feature("autodoc", "
Parameters
----------
aMode: int

Return
-------
bool

Description
-----------
Returns true if the display mode selected is valid for point datums.
") AcceptDisplayMode;
		bool AcceptDisplayMode(const int aMode);

		/****** AIS_Point::Component ******/
		/****** md5 signature: 04da78de5b13e434be2216d44998d0e9 ******/
		%feature("compactdefaultargs") Component;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom_Point>

Description
-----------
Returns the component specified in SetComponent.
") Component;
		opencascade::handle<Geom_Point> Component();

		/****** AIS_Point::HasMarker ******/
		/****** md5 signature: eec1b447b2a5faae5aaea71f9e523dad ******/
		%feature("compactdefaultargs") HasMarker;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if the point datum has a marker.
") HasMarker;
		bool HasMarker();

		/****** AIS_Point::SetColor ******/
		/****** md5 signature: b174106500deaf4ecfa505bb8ae6784c ******/
		%feature("compactdefaultargs") SetColor;
		%feature("autodoc", "
Parameters
----------
theColor: Quantity_Color

Return
-------
None

Description
-----------
Allows you to provide settings for the Color.
") SetColor;
		void SetColor(const Quantity_Color & theColor);

		/****** AIS_Point::SetComponent ******/
		/****** md5 signature: e1a4992bb046aba80ac5162deb11429f ******/
		%feature("compactdefaultargs") SetComponent;
		%feature("autodoc", "
Parameters
----------
aComponent: Geom_Point

Return
-------
None

Description
-----------
Constructs an instance of the point aComponent.
") SetComponent;
		void SetComponent(const opencascade::handle<Geom_Point> & aComponent);

		/****** AIS_Point::SetMarker ******/
		/****** md5 signature: 53b11e7f18efb0f33c0075851766f7e8 ******/
		%feature("compactdefaultargs") SetMarker;
		%feature("autodoc", "
Parameters
----------
aType: Aspect_TypeOfMarker

Return
-------
None

Description
-----------
Allows you to provide settings for a marker. These include - type of marker, - marker color, - scale factor.
") SetMarker;
		void SetMarker(const Aspect_TypeOfMarker aType);

		/****** AIS_Point::Signature ******/
		/****** md5 signature: cb4be277567e09ceca8f8a2aaa8aa8fd ******/
		%feature("compactdefaultargs") Signature;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns index 1, the default index for a point.
") Signature;
		int Signature();

		/****** AIS_Point::Type ******/
		/****** md5 signature: c88659fa26c5e97835681ebdf0f08b53 ******/
		%feature("compactdefaultargs") Type;
		%feature("autodoc", "Return
-------
AIS_KindOfInteractive

Description
-----------
Indicates that a point is a datum.
") Type;
		AIS_KindOfInteractive Type();

		/****** AIS_Point::UnsetColor ******/
		/****** md5 signature: 11f9cda4f631b34a4be33c2bf7cf48b1 ******/
		%feature("compactdefaultargs") UnsetColor;
		%feature("autodoc", "Return
-------
None

Description
-----------
Allows you to remove color settings.
") UnsetColor;
		void UnsetColor();

		/****** AIS_Point::UnsetMarker ******/
		/****** md5 signature: df2d21daa9af0f066f37782351572702 ******/
		%feature("compactdefaultargs") UnsetMarker;
		%feature("autodoc", "Return
-------
None

Description
-----------
Removes the marker settings.
") UnsetMarker;
		void UnsetMarker();

		/****** AIS_Point::Vertex ******/
		/****** md5 signature: f00980db3d22a7e6d7f5f1300940ccaa ******/
		%feature("compactdefaultargs") Vertex;
		%feature("autodoc", "Return
-------
TopoDS_Vertex

Description
-----------
Converts a point into a vertex.
") Vertex;
		TopoDS_Vertex Vertex();

};


%make_alias(AIS_Point)

%extend AIS_Point {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************
* class AIS_PointCloud *
***********************/
class AIS_PointCloud : public AIS_InteractiveObject {
	public:
/* public enums */
enum DisplayMode {
	DM_Points = 0,
	DM_BndBox = 2,
};

enum SelectionMode {
	SM_Points = 0,
	SM_SubsetOfPoints = 1,
	SM_BndBox = 2,
};

/* end public enums declaration */

/* python proxy classes for enums */
%pythoncode {

class DisplayMode(IntEnum):
	DM_Points = 0
	DM_BndBox = 2
DM_Points = DisplayMode.DM_Points
DM_BndBox = DisplayMode.DM_BndBox

class SelectionMode(IntEnum):
	SM_Points = 0
	SM_SubsetOfPoints = 1
	SM_BndBox = 2
SM_Points = SelectionMode.SM_Points
SM_SubsetOfPoints = SelectionMode.SM_SubsetOfPoints
SM_BndBox = SelectionMode.SM_BndBox
};
/* end python proxy for enums */

		/****** AIS_PointCloud::AIS_PointCloud ******/
		/****** md5 signature: a48e67fa09efde4b134cc4b5e5b4ca47 ******/
		%feature("compactdefaultargs") AIS_PointCloud;
		%feature("autodoc", "Return
-------
None

Description
-----------
Constructor.
") AIS_PointCloud;
		 AIS_PointCloud();

		/****** AIS_PointCloud::GetBoundingBox ******/
		/****** md5 signature: c776ca3f9f7d80c6934fc1b6003552bc ******/
		%feature("compactdefaultargs") GetBoundingBox;
		%feature("autodoc", "Return
-------
Bnd_Box

Description
-----------
Get bounding box for presentation.
") GetBoundingBox;
		virtual Bnd_Box GetBoundingBox();

		/****** AIS_PointCloud::GetPoints ******/
		/****** md5 signature: e4eda70415581cdfb96fa049a3263656 ******/
		%feature("compactdefaultargs") GetPoints;
		%feature("autodoc", "Return
-------
opencascade::handle<Graphic3d_ArrayOfPoints>

Description
-----------
Get the points array. Method might be overridden to fill in points array dynamically from application data structures. 
Return: the array of points.
") GetPoints;
		virtual const opencascade::handle<Graphic3d_ArrayOfPoints> GetPoints();

		/****** AIS_PointCloud::SetColor ******/
		/****** md5 signature: b174106500deaf4ecfa505bb8ae6784c ******/
		%feature("compactdefaultargs") SetColor;
		%feature("autodoc", "
Parameters
----------
theColor: Quantity_Color

Return
-------
None

Description
-----------
Setup custom color. Affects presentation only when no per-point color attribute has been assigned.
") SetColor;
		void SetColor(const Quantity_Color & theColor);

		/****** AIS_PointCloud::SetMaterial ******/
		/****** md5 signature: 7018ab4861a8bb54176f5dfb0f6c81fa ******/
		%feature("compactdefaultargs") SetMaterial;
		%feature("autodoc", "
Parameters
----------
theMat: Graphic3d_MaterialAspect

Return
-------
None

Description
-----------
Setup custom material. Affects presentation only when normals are defined.
") SetMaterial;
		void SetMaterial(const Graphic3d_MaterialAspect & theMat);

		/****** AIS_PointCloud::SetPoints ******/
		/****** md5 signature: 0b6a2d7fb3cf24bd7f5f4e81bd82b008 ******/
		%feature("compactdefaultargs") SetPoints;
		%feature("autodoc", "
Parameters
----------
thePoints: Graphic3d_ArrayOfPoints

Return
-------
None

Description
-----------
Sets the points from array of points. Method will not copy the input data - array will be stored as handle. 
Input parameter: thePoints the array of points.
") SetPoints;
		virtual void SetPoints(const opencascade::handle<Graphic3d_ArrayOfPoints> & thePoints);

		/****** AIS_PointCloud::SetPoints ******/
		/****** md5 signature: 68645b5a2986cc0ed773c0dac687306c ******/
		%feature("compactdefaultargs") SetPoints;
		%feature("autodoc", "
Parameters
----------
theCoords: TColgp_HArray1OfPnt
theColors: Quantity_HArray1OfColor (optional, default to nullptr)
theNormals: TColgp_HArray1OfDir (optional, default to nullptr)

Return
-------
None

Description
-----------
Sets the points with optional colors. The input data will be copied into internal buffer. The input arrays should have equal length, otherwise the presentation will not be computed and displayed. 
Input parameter: theCoords the array of coordinates 
Input parameter: theColors optional array of colors 
Input parameter: theNormals optional array of normals.
") SetPoints;
		virtual void SetPoints(const opencascade::handle<TColgp_HArray1OfPnt> & theCoords, const opencascade::handle<Quantity_HArray1OfColor> & theColors = nullptr, const opencascade::handle<TColgp_HArray1OfDir> & theNormals = nullptr);

		/****** AIS_PointCloud::UnsetColor ******/
		/****** md5 signature: 11f9cda4f631b34a4be33c2bf7cf48b1 ******/
		%feature("compactdefaultargs") UnsetColor;
		%feature("autodoc", "Return
-------
None

Description
-----------
Restore default color.
") UnsetColor;
		void UnsetColor();

		/****** AIS_PointCloud::UnsetMaterial ******/
		/****** md5 signature: 37a176a466a7b4bfec282c7d87b3982c ******/
		%feature("compactdefaultargs") UnsetMaterial;
		%feature("autodoc", "Return
-------
None

Description
-----------
Restore default material.
") UnsetMaterial;
		void UnsetMaterial();

};


%make_alias(AIS_PointCloud)

%extend AIS_PointCloud {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************
* class AIS_RubberBand *
***********************/
class AIS_RubberBand : public AIS_InteractiveObject {
	public:
		/****** AIS_RubberBand::AIS_RubberBand ******/
		/****** md5 signature: 830a722d349851c570ded7e3f3ebacf8 ******/
		%feature("compactdefaultargs") AIS_RubberBand;
		%feature("autodoc", "Return
-------
None

Description
-----------
Constructs rubber band with default configuration: empty filling and white solid lines. @warning It binds this object with Graphic3d_ZLayerId_TopOSD layer.
") AIS_RubberBand;
		 AIS_RubberBand();

		/****** AIS_RubberBand::AIS_RubberBand ******/
		/****** md5 signature: 585171e5b449923bac5a3c96fea14b06 ******/
		%feature("compactdefaultargs") AIS_RubberBand;
		%feature("autodoc", "
Parameters
----------
theLineColor: Quantity_Color
theType: Aspect_TypeOfLine
theLineWidth: double (optional, default to 1.0)
theIsPolygonClosed: bool (optional, default to true)

Return
-------
None

Description
-----------
Constructs the rubber band with empty filling and defined line style. 
Input parameter: theLineColor color of rubber band lines 
Input parameter: theType type of rubber band lines 
Input parameter: theLineWidth width of rubber band line. By default it is 1. @warning It binds this object with Graphic3d_ZLayerId_TopOSD layer.
") AIS_RubberBand;
		 AIS_RubberBand(const Quantity_Color & theLineColor, const Aspect_TypeOfLine theType, const double theLineWidth = 1.0, const bool theIsPolygonClosed = true);

		/****** AIS_RubberBand::AIS_RubberBand ******/
		/****** md5 signature: 2d5bdd13b91e88143cfeac0c783827ca ******/
		%feature("compactdefaultargs") AIS_RubberBand;
		%feature("autodoc", "
Parameters
----------
theLineColor: Quantity_Color
theType: Aspect_TypeOfLine
theFillColor: Quantity_Color
theTransparency: double (optional, default to 1.0)
theLineWidth: double (optional, default to 1.0)
theIsPolygonClosed: bool (optional, default to true)

Return
-------
None

Description
-----------
Constructs the rubber band with defined filling and line parameters. 
Input parameter: theLineColor color of rubber band lines 
Input parameter: theType type of rubber band lines 
Input parameter: theFillColor color of rubber band filling 
Input parameter: theTransparency transparency of the filling. 0 is for opaque filling. By default it is transparent. 
Input parameter: theLineWidth width of rubber band line. By default it is 1. @warning It binds this object with Graphic3d_ZLayerId_TopOSD layer.
") AIS_RubberBand;
		 AIS_RubberBand(const Quantity_Color & theLineColor, const Aspect_TypeOfLine theType, const Quantity_Color theFillColor, const double theTransparency = 1.0, const double theLineWidth = 1.0, const bool theIsPolygonClosed = true);

		/****** AIS_RubberBand::AddPoint ******/
		/****** md5 signature: b07e888836f16a859eeaa4a9143ac35b ******/
		%feature("compactdefaultargs") AddPoint;
		%feature("autodoc", "
Parameters
----------
thePoint: NCollection_Vec2<int>

Return
-------
None

Description
-----------
Adds last point to the list of points. They are used to build polygon for rubber band. 
See also: RemoveLastPoint(), GetPoints().
") AddPoint;
		void AddPoint(const NCollection_Vec2<int> & thePoint);

		/****** AIS_RubberBand::ClearPoints ******/
		/****** md5 signature: 666d63d9f2a8b4f033341bec50a0bbe5 ******/
		%feature("compactdefaultargs") ClearPoints;
		%feature("autodoc", "Return
-------
None

Description
-----------
Remove all points for the rubber band polygon.
") ClearPoints;
		void ClearPoints();

		/****** AIS_RubberBand::FillColor ******/
		/****** md5 signature: ffbf8b528d2e8dbd58b3fdc84942a96d ******/
		%feature("compactdefaultargs") FillColor;
		%feature("autodoc", "Return
-------
Quantity_Color

Description
-----------
Return: the color of rubber band filling.
") FillColor;
		Quantity_Color FillColor();

		/****** AIS_RubberBand::FillTransparency ******/
		/****** md5 signature: 7cd0d2073ed51a69a3d9ace87fc5ee0c ******/
		%feature("compactdefaultargs") FillTransparency;
		%feature("autodoc", "Return
-------
double

Description
-----------
Return: fill transparency.
") FillTransparency;
		double FillTransparency();

		/****** AIS_RubberBand::IsFilling ******/
		/****** md5 signature: ff7822f4b14d875f44662c51cc5351e9 ******/
		%feature("compactdefaultargs") IsFilling;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Return: true if filling of rubber band is enabled.
") IsFilling;
		bool IsFilling();

		/****** AIS_RubberBand::IsPolygonClosed ******/
		/****** md5 signature: 158c18d2efbccf9714995e9dbdc06ce4 ******/
		%feature("compactdefaultargs") IsPolygonClosed;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Return: true if automatic closing of rubber band is enabled.
") IsPolygonClosed;
		bool IsPolygonClosed();

		/****** AIS_RubberBand::LineColor ******/
		/****** md5 signature: 287d3db7c040dbd903ae9bab4775434d ******/
		%feature("compactdefaultargs") LineColor;
		%feature("autodoc", "Return
-------
Quantity_Color

Description
-----------
Return: the Color attributes.
") LineColor;
		Quantity_Color LineColor();

		/****** AIS_RubberBand::LineType ******/
		/****** md5 signature: 0f99f64671ffab5d520407d1f66ce563 ******/
		%feature("compactdefaultargs") LineType;
		%feature("autodoc", "Return
-------
Aspect_TypeOfLine

Description
-----------
Return: type of lines.
") LineType;
		Aspect_TypeOfLine LineType();

		/****** AIS_RubberBand::LineWidth ******/
		/****** md5 signature: fbf1b00746a2472f1755e089c40af079 ******/
		%feature("compactdefaultargs") LineWidth;
		%feature("autodoc", "Return
-------
double

Description
-----------
Return: width of lines.
") LineWidth;
		double LineWidth();

		/****** AIS_RubberBand::Points ******/
		/****** md5 signature: 7147b2d1cbaab5befa049f5523c3fbd7 ******/
		%feature("compactdefaultargs") Points;
		%feature("autodoc", "Return
-------
NCollection_Sequence<NCollection_Vec2<int>>

Description
-----------
Return: points for the rubber band polygon.
") Points;
		const NCollection_Sequence<NCollection_Vec2<int>> & Points();

		/****** AIS_RubberBand::RemoveLastPoint ******/
		/****** md5 signature: 90c19d859f20a83ceba67713ab84917b ******/
		%feature("compactdefaultargs") RemoveLastPoint;
		%feature("autodoc", "Return
-------
None

Description
-----------
Remove last point from the list of points for the rubber band polygon. 
See also: AddPoint(), GetPoints().
") RemoveLastPoint;
		void RemoveLastPoint();

		/****** AIS_RubberBand::SetFillColor ******/
		/****** md5 signature: a05c06141e0ede7ccc6b1d79a19ece27 ******/
		%feature("compactdefaultargs") SetFillColor;
		%feature("autodoc", "
Parameters
----------
theColor: Quantity_Color

Return
-------
None

Description
-----------
Sets color of rubber band filling.
") SetFillColor;
		void SetFillColor(const Quantity_Color & theColor);

		/****** AIS_RubberBand::SetFillTransparency ******/
		/****** md5 signature: e741ea3f9533a8fb73995889ad3be80c ******/
		%feature("compactdefaultargs") SetFillTransparency;
		%feature("autodoc", "
Parameters
----------
theValue: double

Return
-------
None

Description
-----------
Sets fill transparency. 
Input parameter: theValue the transparency value. 1.0 is for transparent background.
") SetFillTransparency;
		void SetFillTransparency(const double theValue);

		/****** AIS_RubberBand::SetFilling ******/
		/****** md5 signature: 45dfc3835994b820c8c9c13ecee34c83 ******/
		%feature("compactdefaultargs") SetFilling;
		%feature("autodoc", "
Parameters
----------
theIsFilling: bool

Return
-------
None

Description
-----------
Enable or disable filling of rubber band.
") SetFilling;
		void SetFilling(const bool theIsFilling);

		/****** AIS_RubberBand::SetFilling ******/
		/****** md5 signature: bd3d6c9cf73c560baaee31db3839e9c5 ******/
		%feature("compactdefaultargs") SetFilling;
		%feature("autodoc", "
Parameters
----------
theColor: Quantity_Color
theTransparency: double

Return
-------
None

Description
-----------
Enable filling of rubber band with defined parameters. 
Input parameter: theColor color of filling 
Input parameter: theTransparency transparency of the filling. 0 is for opaque filling.
") SetFilling;
		void SetFilling(const Quantity_Color theColor, const double theTransparency);

		/****** AIS_RubberBand::SetLineColor ******/
		/****** md5 signature: cda5d06f471777b34354dd1e594e9ba9 ******/
		%feature("compactdefaultargs") SetLineColor;
		%feature("autodoc", "
Parameters
----------
theColor: Quantity_Color

Return
-------
None

Description
-----------
Sets color of lines for rubber band presentation.
") SetLineColor;
		void SetLineColor(const Quantity_Color & theColor);

		/****** AIS_RubberBand::SetLineType ******/
		/****** md5 signature: ad6a901b16ac578c15dc18e99302b01e ******/
		%feature("compactdefaultargs") SetLineType;
		%feature("autodoc", "
Parameters
----------
theType: Aspect_TypeOfLine

Return
-------
None

Description
-----------
Sets type of line for rubber band presentation.
") SetLineType;
		void SetLineType(const Aspect_TypeOfLine theType);

		/****** AIS_RubberBand::SetLineWidth ******/
		/****** md5 signature: 8703eb0ab58858d1882b19a8af5af811 ******/
		%feature("compactdefaultargs") SetLineWidth;
		%feature("autodoc", "
Parameters
----------
theWidth: double

Return
-------
None

Description
-----------
Sets width of line for rubber band presentation.
") SetLineWidth;
		void SetLineWidth(const double theWidth);

		/****** AIS_RubberBand::SetPolygonClosed ******/
		/****** md5 signature: 9463d5ce73d8091d0db046ad8c8526bc ******/
		%feature("compactdefaultargs") SetPolygonClosed;
		%feature("autodoc", "
Parameters
----------
theIsPolygonClosed: bool

Return
-------
None

Description
-----------
Automatically create an additional line connecting the first and the last screen points to close the boundary polyline.
") SetPolygonClosed;
		void SetPolygonClosed(bool theIsPolygonClosed);

		/****** AIS_RubberBand::SetRectangle ******/
		/****** md5 signature: ecbd176d3899e8274fb250c8544324a8 ******/
		%feature("compactdefaultargs") SetRectangle;
		%feature("autodoc", "
Parameters
----------
theMinX: int
theMinY: int
theMaxX: int
theMaxY: int

Return
-------
None

Description
-----------
Sets rectangle bounds.
") SetRectangle;
		void SetRectangle(const int theMinX, const int theMinY, const int theMaxX, const int theMaxY);

};


%make_alias(AIS_RubberBand)

%extend AIS_RubberBand {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************
* class AIS_Shape *
******************/
class AIS_Shape : public AIS_InteractiveObject {
	public:
		/****** AIS_Shape::AIS_Shape ******/
		/****** md5 signature: 676def0e267dd9cfd41b78bdeb64a3a6 ******/
		%feature("compactdefaultargs") AIS_Shape;
		%feature("autodoc", "
Parameters
----------
shap: TopoDS_Shape

Return
-------
None

Description
-----------
Initializes construction of the shape shap from wires, edges and vertices.
") AIS_Shape;
		 AIS_Shape(const TopoDS_Shape & shap);

		/****** AIS_Shape::AcceptDisplayMode ******/
		/****** md5 signature: 87fb12421b337c0d3c009064a10e954f ******/
		%feature("compactdefaultargs") AcceptDisplayMode;
		%feature("autodoc", "
Parameters
----------
theMode: int

Return
-------
bool

Description
-----------
Return true if specified display mode is supported.
") AcceptDisplayMode;
		bool AcceptDisplayMode(const int theMode);

		/****** AIS_Shape::AcceptShapeDecomposition ******/
		/****** md5 signature: f7f4d7577ac331ad723892b4e07e1409 ******/
		%feature("compactdefaultargs") AcceptShapeDecomposition;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if the Interactive Object accepts shape decomposition.
") AcceptShapeDecomposition;
		bool AcceptShapeDecomposition();

		/****** AIS_Shape::BoundingBox ******/
		/****** md5 signature: c5ba355b93437b89fc95a23246eabd6a ******/
		%feature("compactdefaultargs") BoundingBox;
		%feature("autodoc", "Return
-------
Bnd_Box

Description
-----------
Constructs a bounding box with which to reconstruct compound topological shapes for presentation.
") BoundingBox;
		virtual const Bnd_Box & BoundingBox();

		/****** AIS_Shape::Color ******/
		/****** md5 signature: 5488e8db3aaa0076122c5f4f5e25bc48 ******/
		%feature("compactdefaultargs") Color;
		%feature("autodoc", "
Parameters
----------
aColor: Quantity_Color

Return
-------
None

Description
-----------
Returns the Color attributes of the shape accordingly to the current facing model;.
") Color;
		void Color(Quantity_Color & aColor);


        /****************** DumpJson ******************/
        %feature("autodoc", "
Parameters
----------
depth: int, default=-1

Return
-------
str

Description
-----------
Dump the object to JSON string.
") DumpJson;
        %extend{
            std::string DumpJson(int depth=-1) {
            std::stringstream s;
            self->DumpJson(s, depth);
            return "{" + s.str() + "}" ;}
        };
		/****** AIS_Shape::Material ******/
		/****** md5 signature: 2a9ca186c8c8bf090639bc928e45f842 ******/
		%feature("compactdefaultargs") Material;
		%feature("autodoc", "Return
-------
Graphic3d_NameOfMaterial

Description
-----------
Returns the NameOfMaterial attributes of the shape accordingly to the current facing model;.
") Material;
		Graphic3d_NameOfMaterial Material();

		/****** AIS_Shape::OwnDeviationAngle ******/
		/****** md5 signature: 8acbb99479e7448265666358aeb04c34 ******/
		%feature("compactdefaultargs") OwnDeviationAngle;
		%feature("autodoc", "
Parameters
----------

Return
-------
anAngle: double
aPreviousAngle: double

Description
-----------
Returns true and the values of the deviation angle anAngle and the previous deviation angle aPreviousAngle. If these values are not already set, false is returned.
") OwnDeviationAngle;
		bool OwnDeviationAngle(Standard_Real &OutValue, Standard_Real &OutValue);

		/****** AIS_Shape::OwnDeviationCoefficient ******/
		/****** md5 signature: 0ebb3f044bdcf7f6c064dd75560c7718 ******/
		%feature("compactdefaultargs") OwnDeviationCoefficient;
		%feature("autodoc", "
Parameters
----------

Return
-------
aCoefficient: double
aPreviousCoefficient: double

Description
-----------
Returns true and the values of the deviation coefficient aCoefficient and the previous deviation coefficient aPreviousCoefficient. If these values are not already set, false is returned.
") OwnDeviationCoefficient;
		bool OwnDeviationCoefficient(Standard_Real &OutValue, Standard_Real &OutValue);

		/****** AIS_Shape::SelectionMode ******/
		/****** md5 signature: e6112c669d91ac9800d90eeb19d79be2 ******/
		%feature("compactdefaultargs") SelectionMode;
		%feature("autodoc", "
Parameters
----------
theShapeType: TopAbs_ShapeEnum

Return
-------
int

Description
-----------
Return selection mode for specified shape type.
") SelectionMode;
		static int SelectionMode(const TopAbs_ShapeEnum theShapeType);

		/****** AIS_Shape::SelectionType ******/
		/****** md5 signature: 7e69b6f38befb24036679c1d47752144 ******/
		%feature("compactdefaultargs") SelectionType;
		%feature("autodoc", "
Parameters
----------
theSelMode: int

Return
-------
TopAbs_ShapeEnum

Description
-----------
Return shape type for specified selection mode.
") SelectionType;
		static TopAbs_ShapeEnum SelectionType(const int theSelMode);

		/****** AIS_Shape::Set ******/
		/****** md5 signature: 51503ed05940c30aefe5458efb0529e5 ******/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
theShape: TopoDS_Shape

Return
-------
None

Description
-----------
Alias for ::SetShape().
") Set;
		void Set(const TopoDS_Shape & theShape);

		/****** AIS_Shape::SetAngleAndDeviation ******/
		/****** md5 signature: 5831e381acb07228041a49c9651caeff ******/
		%feature("compactdefaultargs") SetAngleAndDeviation;
		%feature("autodoc", "
Parameters
----------
anAngle: double

Return
-------
None

Description
-----------
this compute a new angle and Deviation from the value anAngle and set the values stored in myDrawer with these that become local to the shape.
") SetAngleAndDeviation;
		void SetAngleAndDeviation(const double anAngle);

		/****** AIS_Shape::SetColor ******/
		/****** md5 signature: b174106500deaf4ecfa505bb8ae6784c ******/
		%feature("compactdefaultargs") SetColor;
		%feature("autodoc", "
Parameters
----------
theColor: Quantity_Color

Return
-------
None

Description
-----------
Sets the color aColor in the reconstructed compound shape. Acts via the Drawer methods below on the appearance of: - free boundaries: Prs3d_Drawer_FreeBoundaryAspect, - isos: Prs3d_Drawer_UIsoAspect, Prs3dDrawer_VIsoAspect, - shared boundaries: Prs3d_Drawer_UnFreeBoundaryAspect, - shading: Prs3d_Drawer_ShadingAspect, - visible line color in hidden line mode: Prs3d_Drawer_SeenLineAspect - hidden line color in hidden line mode: Prs3d_Drawer_HiddenLineAspect.
") SetColor;
		void SetColor(const Quantity_Color & theColor);

		/****** AIS_Shape::SetMaterial ******/
		/****** md5 signature: a9a88200809bde5680b76f1c0323e38b ******/
		%feature("compactdefaultargs") SetMaterial;
		%feature("autodoc", "
Parameters
----------
aName: Graphic3d_MaterialAspect

Return
-------
None

Description
-----------
Allows you to provide settings for the material aName in the reconstructed compound shape.
") SetMaterial;
		void SetMaterial(const Graphic3d_MaterialAspect & aName);

		/****** AIS_Shape::SetOwnDeviationAngle ******/
		/****** md5 signature: 5abe2644058ef2f7e1e1410df41e551b ******/
		%feature("compactdefaultargs") SetOwnDeviationAngle;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Sets a local value for deviation angle for this specific shape.
") SetOwnDeviationAngle;
		bool SetOwnDeviationAngle();

		/****** AIS_Shape::SetOwnDeviationAngle ******/
		/****** md5 signature: 5ec156747a8b7a696ab7d21adcd3f546 ******/
		%feature("compactdefaultargs") SetOwnDeviationAngle;
		%feature("autodoc", "
Parameters
----------
anAngle: double

Return
-------
None

Description
-----------
sets myOwnDeviationAngle field in Prs3d_Drawer & recomputes presentation.
") SetOwnDeviationAngle;
		void SetOwnDeviationAngle(const double anAngle);

		/****** AIS_Shape::SetOwnDeviationCoefficient ******/
		/****** md5 signature: 86ce2f673030c9b1cb5e687aedce5350 ******/
		%feature("compactdefaultargs") SetOwnDeviationCoefficient;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Sets a local value for deviation coefficient for this specific shape.
") SetOwnDeviationCoefficient;
		bool SetOwnDeviationCoefficient();

		/****** AIS_Shape::SetOwnDeviationCoefficient ******/
		/****** md5 signature: 9b5185fb003b3ff5e0c2ffcfdd53f4a4 ******/
		%feature("compactdefaultargs") SetOwnDeviationCoefficient;
		%feature("autodoc", "
Parameters
----------
aCoefficient: double

Return
-------
None

Description
-----------
Sets a local value for deviation coefficient for this specific shape.
") SetOwnDeviationCoefficient;
		void SetOwnDeviationCoefficient(const double aCoefficient);

		/****** AIS_Shape::SetShape ******/
		/****** md5 signature: 927e2ebe2fb5354dfb3da3c53e512cad ******/
		%feature("compactdefaultargs") SetShape;
		%feature("autodoc", "
Parameters
----------
theShape: TopoDS_Shape

Return
-------
None

Description
-----------
Constructs an instance of the shape object theShape.
") SetShape;
		void SetShape(const TopoDS_Shape & theShape);

		/****** AIS_Shape::SetTextureOriginUV ******/
		/****** md5 signature: ef6ae799011e0e64c5951dbb75a0bbf3 ******/
		%feature("compactdefaultargs") SetTextureOriginUV;
		%feature("autodoc", "
Parameters
----------
theOriginUV: gp_Pnt2d

Return
-------
None

Description
-----------
Use this method to change the origin of the texture. The texel (0,0) will be mapped to the surface (myUVOrigin.X(), myUVOrigin.Y()).
") SetTextureOriginUV;
		void SetTextureOriginUV(const gp_Pnt2d & theOriginUV);

		/****** AIS_Shape::SetTextureRepeatUV ******/
		/****** md5 signature: 25b37b340fee812ff2a622d745958d59 ******/
		%feature("compactdefaultargs") SetTextureRepeatUV;
		%feature("autodoc", "
Parameters
----------
theRepeatUV: gp_Pnt2d

Return
-------
None

Description
-----------
Sets the number of occurrences of the texture on each face. The texture itself is parameterized in (0,1) by (0,1). Each face of the shape to be textured is parameterized in UV space (Umin,Umax) by (Vmin,Vmax).
") SetTextureRepeatUV;
		void SetTextureRepeatUV(const gp_Pnt2d & theRepeatUV);

		/****** AIS_Shape::SetTextureScaleUV ******/
		/****** md5 signature: ec42ab71903fb0177a6a0aa0ee8187f9 ******/
		%feature("compactdefaultargs") SetTextureScaleUV;
		%feature("autodoc", "
Parameters
----------
theScaleUV: gp_Pnt2d

Return
-------
None

Description
-----------
Use this method to scale the texture (percent of the face). You can specify a scale factor for both U and V. Example: if you set ScaleU and ScaleV to 0.5 and you enable texture repeat, the texture will appear twice on the face in each direction.
") SetTextureScaleUV;
		void SetTextureScaleUV(const gp_Pnt2d & theScaleUV);

		/****** AIS_Shape::SetTransparency ******/
		/****** md5 signature: e5e4b890b6aeb9b23a1ad2e264a87891 ******/
		%feature("compactdefaultargs") SetTransparency;
		%feature("autodoc", "
Parameters
----------
aValue: double (optional, default to 0.6)

Return
-------
None

Description
-----------
Sets the value aValue for transparency in the reconstructed compound shape.
") SetTransparency;
		void SetTransparency(const double aValue = 0.6);

		/****** AIS_Shape::SetTypeOfHLR ******/
		/****** md5 signature: f05d013edd687a2ace45302343607b0d ******/
		%feature("compactdefaultargs") SetTypeOfHLR;
		%feature("autodoc", "
Parameters
----------
theTypeOfHLR: Prs3d_TypeOfHLR

Return
-------
None

Description
-----------
Sets the type of HLR algorithm used by the shape.
") SetTypeOfHLR;
		void SetTypeOfHLR(const Prs3d_TypeOfHLR theTypeOfHLR);

		/****** AIS_Shape::SetWidth ******/
		/****** md5 signature: 5c28197685e1a227390e8b87486b22a0 ******/
		%feature("compactdefaultargs") SetWidth;
		%feature("autodoc", "
Parameters
----------
aValue: double

Return
-------
None

Description
-----------
Sets the value aValue for line width in the reconstructed compound shape. Changes line aspects for lines presentation.
") SetWidth;
		void SetWidth(const double aValue);

		/****** AIS_Shape::Shape ******/
		/****** md5 signature: 1058569f5d639354fedf11e73741b7df ******/
		%feature("compactdefaultargs") Shape;
		%feature("autodoc", "Return
-------
TopoDS_Shape

Description
-----------
Returns this shape object.
") Shape;
		const TopoDS_Shape Shape();

		/****** AIS_Shape::Signature ******/
		/****** md5 signature: cb4be277567e09ceca8f8a2aaa8aa8fd ******/
		%feature("compactdefaultargs") Signature;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns index 0. This value refers to SHAPE from TopAbs_ShapeEnum.
") Signature;
		int Signature();

		/****** AIS_Shape::TextureOriginUV ******/
		/****** md5 signature: c2e574654e7fff1283a776325c9d03eb ******/
		%feature("compactdefaultargs") TextureOriginUV;
		%feature("autodoc", "Return
-------
gp_Pnt2d

Description
-----------
Return texture origin UV position; (0, 0) by default.
") TextureOriginUV;
		const gp_Pnt2d TextureOriginUV();

		/****** AIS_Shape::TextureRepeatUV ******/
		/****** md5 signature: de849df2f2a78aabc5d59235e4643811 ******/
		%feature("compactdefaultargs") TextureRepeatUV;
		%feature("autodoc", "Return
-------
gp_Pnt2d

Description
-----------
Return texture repeat UV values; (1, 1) by default.
") TextureRepeatUV;
		const gp_Pnt2d TextureRepeatUV();

		/****** AIS_Shape::TextureScaleUV ******/
		/****** md5 signature: 4a631ef97f685c7cc9ee0c3ecef81321 ******/
		%feature("compactdefaultargs") TextureScaleUV;
		%feature("autodoc", "Return
-------
gp_Pnt2d

Description
-----------
Return scale factor for UV coordinates; (1, 1) by default.
") TextureScaleUV;
		const gp_Pnt2d TextureScaleUV();

		/****** AIS_Shape::Transparency ******/
		/****** md5 signature: be77fd2713e73baf6452e1e45bdd60ee ******/
		%feature("compactdefaultargs") Transparency;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns the transparency attributes of the shape accordingly to the current facing model;.
") Transparency;
		double Transparency();

		/****** AIS_Shape::Type ******/
		/****** md5 signature: c88659fa26c5e97835681ebdf0f08b53 ******/
		%feature("compactdefaultargs") Type;
		%feature("autodoc", "Return
-------
AIS_KindOfInteractive

Description
-----------
Returns Object as the type of Interactive Object.
") Type;
		AIS_KindOfInteractive Type();

		/****** AIS_Shape::TypeOfHLR ******/
		/****** md5 signature: 6e7597badcbcce7d92e2fcaa7413af66 ******/
		%feature("compactdefaultargs") TypeOfHLR;
		%feature("autodoc", "Return
-------
Prs3d_TypeOfHLR

Description
-----------
Gets the type of HLR algorithm.
") TypeOfHLR;
		Prs3d_TypeOfHLR TypeOfHLR();

		/****** AIS_Shape::UnsetColor ******/
		/****** md5 signature: 11f9cda4f631b34a4be33c2bf7cf48b1 ******/
		%feature("compactdefaultargs") UnsetColor;
		%feature("autodoc", "Return
-------
None

Description
-----------
Removes settings for color in the reconstructed compound shape.
") UnsetColor;
		void UnsetColor();

		/****** AIS_Shape::UnsetMaterial ******/
		/****** md5 signature: 37a176a466a7b4bfec282c7d87b3982c ******/
		%feature("compactdefaultargs") UnsetMaterial;
		%feature("autodoc", "Return
-------
None

Description
-----------
Removes settings for material in the reconstructed compound shape.
") UnsetMaterial;
		void UnsetMaterial();

		/****** AIS_Shape::UnsetTransparency ******/
		/****** md5 signature: b0bbb5c0e2872867b944fb3488b9badd ******/
		%feature("compactdefaultargs") UnsetTransparency;
		%feature("autodoc", "Return
-------
None

Description
-----------
Removes the setting for transparency in the reconstructed compound shape.
") UnsetTransparency;
		void UnsetTransparency();

		/****** AIS_Shape::UnsetWidth ******/
		/****** md5 signature: 806020285b21e0f143ac65d1e797f644 ******/
		%feature("compactdefaultargs") UnsetWidth;
		%feature("autodoc", "Return
-------
None

Description
-----------
Removes the setting for line width in the reconstructed compound shape.
") UnsetWidth;
		void UnsetWidth();

		/****** AIS_Shape::UserAngle ******/
		/****** md5 signature: 6c59959204062d8e86b57a2719526e05 ******/
		%feature("compactdefaultargs") UserAngle;
		%feature("autodoc", "Return
-------
double

Description
-----------
gives back the angle initial value put by the User.
") UserAngle;
		double UserAngle();

		/****** AIS_Shape::computeHlrPresentation ******/
		/****** md5 signature: 2c89e1d02192d3494845e204cf0b751c ******/
		%feature("compactdefaultargs") computeHlrPresentation;
		%feature("autodoc", "
Parameters
----------
theProjector: Graphic3d_Camera
thePrs: Prs3d_Presentation
theShape: TopoDS_Shape
theDrawer: Prs3d_Drawer

Return
-------
None

Description
-----------
Compute HLR presentation for specified shape.
") computeHlrPresentation;
		static void computeHlrPresentation(const opencascade::handle<Graphic3d_Camera> & theProjector, const opencascade::handle<Prs3d_Presentation> & thePrs, const TopoDS_Shape & theShape, const opencascade::handle<Prs3d_Drawer> & theDrawer);

};


%make_alias(AIS_Shape)

%extend AIS_Shape {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************
* class AIS_SignatureFilter *
****************************/
class AIS_SignatureFilter : public AIS_TypeFilter {
	public:
		/****** AIS_SignatureFilter::AIS_SignatureFilter ******/
		/****** md5 signature: 859cc587eee927a5a458a0c8aaaae65d ******/
		%feature("compactdefaultargs") AIS_SignatureFilter;
		%feature("autodoc", "
Parameters
----------
aGivenKind: AIS_KindOfInteractive
aGivenSignature: int

Return
-------
None

Description
-----------
Initializes the signature filter, adding the signature specification, aGivenSignature, to that for type, aGivenKind, in AIS_TypeFilter.
") AIS_SignatureFilter;
		 AIS_SignatureFilter(const AIS_KindOfInteractive aGivenKind, const int aGivenSignature);

		/****** AIS_SignatureFilter::IsOk ******/
		/****** md5 signature: eeea6f6b4b7492f5eeac7be277a67559 ******/
		%feature("compactdefaultargs") IsOk;
		%feature("autodoc", "
Parameters
----------
anobj: SelectMgr_EntityOwner

Return
-------
bool

Description
-----------
Returns False if the transient is not an AIS_InteractiveObject. Returns False if the signature of InteractiveObject is not the same as the stored one in the filter...
") IsOk;
		bool IsOk(const opencascade::handle<SelectMgr_EntityOwner> & anobj);

};


%make_alias(AIS_SignatureFilter)

%extend AIS_SignatureFilter {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************
* class AIS_TextLabel *
**********************/
class AIS_TextLabel : public AIS_InteractiveObject {
	public:
		/****** AIS_TextLabel::AIS_TextLabel ******/
		/****** md5 signature: ea29765f87567cd9f618ee169e658a97 ******/
		%feature("compactdefaultargs") AIS_TextLabel;
		%feature("autodoc", "Return
-------
None

Description
-----------
Default constructor.
") AIS_TextLabel;
		 AIS_TextLabel();

		/****** AIS_TextLabel::AcceptDisplayMode ******/
		/****** md5 signature: 87fb12421b337c0d3c009064a10e954f ******/
		%feature("compactdefaultargs") AcceptDisplayMode;
		%feature("autodoc", "
Parameters
----------
theMode: int

Return
-------
bool

Description
-----------
Return True for supported display mode.
") AcceptDisplayMode;
		bool AcceptDisplayMode(const int theMode);

		/****** AIS_TextLabel::FontAspect ******/
		/****** md5 signature: 6949367e7841153f9bf40dc3c8ceebde ******/
		%feature("compactdefaultargs") FontAspect;
		%feature("autodoc", "Return
-------
Font_FontAspect

Description
-----------
Returns the font aspect of the label text.
") FontAspect;
		Font_FontAspect FontAspect();

		/****** AIS_TextLabel::FontName ******/
		/****** md5 signature: 2c67f4ccf190033bd2df359b02c80019 ******/
		%feature("compactdefaultargs") FontName;
		%feature("autodoc", "Return
-------
TCollection_AsciiString

Description
-----------
Returns the font of the label text.
") FontName;
		const TCollection_AsciiString & FontName();

		/****** AIS_TextLabel::HasFlipping ******/
		/****** md5 signature: 68045256d3f077d33589623cd1b9672b ******/
		%feature("compactdefaultargs") HasFlipping;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") HasFlipping;
		bool HasFlipping();

		/****** AIS_TextLabel::HasOrientation3D ******/
		/****** md5 signature: d712413ab3b1fc8adf6990057ff247fb ******/
		%feature("compactdefaultargs") HasOrientation3D;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if the current text placement mode uses text orientation in the model 3D space.
") HasOrientation3D;
		bool HasOrientation3D();

		/****** AIS_TextLabel::HasOwnAnchorPoint ******/
		/****** md5 signature: 39cb551908cba0204e9e666e55e73184 ******/
		%feature("compactdefaultargs") HasOwnAnchorPoint;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns flag if text uses position as point of attach.
") HasOwnAnchorPoint;
		bool HasOwnAnchorPoint();

		/****** AIS_TextLabel::Orientation3D ******/
		/****** md5 signature: 59c12b43a793dfc418565149b93d1848 ******/
		%feature("compactdefaultargs") Orientation3D;
		%feature("autodoc", "Return
-------
gp_Ax2

Description
-----------
Returns label orientation in the model 3D space.
") Orientation3D;
		const gp_Ax2 Orientation3D();

		/****** AIS_TextLabel::Position ******/
		/****** md5 signature: b397668de8ab55c0ba7dba3385ed76d0 ******/
		%feature("compactdefaultargs") Position;
		%feature("autodoc", "Return
-------
gp_Pnt

Description
-----------
Returns position.
") Position;
		const gp_Pnt Position();

		/****** AIS_TextLabel::SetAngle ******/
		/****** md5 signature: 74e805f34f5fae9cc7acd431b75f9e33 ******/
		%feature("compactdefaultargs") SetAngle;
		%feature("autodoc", "
Parameters
----------
theAngle: double

Return
-------
None

Description
-----------
Setup angle.
") SetAngle;
		void SetAngle(const double theAngle);

		/****** AIS_TextLabel::SetColor ******/
		/****** md5 signature: b174106500deaf4ecfa505bb8ae6784c ******/
		%feature("compactdefaultargs") SetColor;
		%feature("autodoc", "
Parameters
----------
theColor: Quantity_Color

Return
-------
None

Description
-----------
Setup color of entire text.
") SetColor;
		void SetColor(const Quantity_Color & theColor);

		/****** AIS_TextLabel::SetColorSubTitle ******/
		/****** md5 signature: 86b27f31504d545b35f6d527a8614032 ******/
		%feature("compactdefaultargs") SetColorSubTitle;
		%feature("autodoc", "
Parameters
----------
theColor: Quantity_Color

Return
-------
None

Description
-----------
Modifies the colour of the subtitle for the TODT_SUBTITLE TextDisplayType and the colour of backgroubd for the TODT_DEKALE TextDisplayType.
") SetColorSubTitle;
		void SetColorSubTitle(const Quantity_Color & theColor);

		/****** AIS_TextLabel::SetDisplayType ******/
		/****** md5 signature: 841f090e5b526ffb97840b2c0b5ccf62 ******/
		%feature("compactdefaultargs") SetDisplayType;
		%feature("autodoc", "
Parameters
----------
theDisplayType: Aspect_TypeOfDisplayText

Return
-------
None

Description
-----------
Define the display type of the text. //! TODT_NORMAL Default display. Text only. TODT_SUBTITLE There is a subtitle under the text. TODT_DEKALE The text is displayed with a 3D style. TODT_BLEND The text is displayed in XOR. TODT_DIMENSION Dimension line under text will be invisible.
") SetDisplayType;
		void SetDisplayType(const Aspect_TypeOfDisplayText theDisplayType);

		/****** AIS_TextLabel::SetFlipping ******/
		/****** md5 signature: 2acf170b5cacd5b0b32ec5bf7138c2ed ******/
		%feature("compactdefaultargs") SetFlipping;
		%feature("autodoc", "
Parameters
----------
theIsFlipping: bool

Return
-------
None

Description
-----------
No available documentation.
") SetFlipping;
		void SetFlipping(const bool theIsFlipping);

		/****** AIS_TextLabel::SetFont ******/
		/****** md5 signature: 0f342ba08c971b503f9a06b17ca79f87 ******/
		%feature("compactdefaultargs") SetFont;
		%feature("autodoc", "
Parameters
----------
theFont: char *

Return
-------
None

Description
-----------
Setup font.
") SetFont;
		void SetFont(const char * theFont);

		/****** AIS_TextLabel::SetFontAspect ******/
		/****** md5 signature: 5c2494c796ae98d97b009a2fec1f0d8d ******/
		%feature("compactdefaultargs") SetFontAspect;
		%feature("autodoc", "
Parameters
----------
theFontAspect: Font_FontAspect

Return
-------
None

Description
-----------
Setup font aspect.
") SetFontAspect;
		void SetFontAspect(const Font_FontAspect theFontAspect);

		/****** AIS_TextLabel::SetHJustification ******/
		/****** md5 signature: 222b316fbe2b20961d17c752ca22f482 ******/
		%feature("compactdefaultargs") SetHJustification;
		%feature("autodoc", "
Parameters
----------
theHJust: Graphic3d_HorizontalTextAlignment

Return
-------
None

Description
-----------
Setup horizontal justification.
") SetHJustification;
		void SetHJustification(const Graphic3d_HorizontalTextAlignment theHJust);

		/****** AIS_TextLabel::SetHeight ******/
		/****** md5 signature: fed85ae2e9047f1c25bf2ef7a3516fa0 ******/
		%feature("compactdefaultargs") SetHeight;
		%feature("autodoc", "
Parameters
----------
theHeight: double

Return
-------
None

Description
-----------
Setup height.
") SetHeight;
		void SetHeight(const double theHeight);

		/****** AIS_TextLabel::SetMaterial ******/
		/****** md5 signature: 71d992d493b1e8c72e2b3163ec3e0b3b ******/
		%feature("compactdefaultargs") SetMaterial;
		%feature("autodoc", "
Parameters
----------
&: Graphic3d_MaterialAspect

Return
-------
None

Description
-----------
Material has no effect for text label.
") SetMaterial;
		void SetMaterial(const Graphic3d_MaterialAspect &);

		/****** AIS_TextLabel::SetOrientation3D ******/
		/****** md5 signature: 495ee926ccc07e7eec3f148e71ebe0e0 ******/
		%feature("compactdefaultargs") SetOrientation3D;
		%feature("autodoc", "
Parameters
----------
theOrientation: gp_Ax2

Return
-------
None

Description
-----------
Setup label orientation in the model 3D space.
") SetOrientation3D;
		void SetOrientation3D(const gp_Ax2 & theOrientation);

		/****** AIS_TextLabel::SetOwnAnchorPoint ******/
		/****** md5 signature: f8008539cae83bea7d2a504c73ac2e6c ******/
		%feature("compactdefaultargs") SetOwnAnchorPoint;
		%feature("autodoc", "
Parameters
----------
theOwnAnchorPoint: bool

Return
-------
None

Description
-----------
Set flag if text uses position as point of attach.
") SetOwnAnchorPoint;
		void SetOwnAnchorPoint(const bool theOwnAnchorPoint);

		/****** AIS_TextLabel::SetPosition ******/
		/****** md5 signature: 6cd7cdcecb59ee7f74eb9c342f464f4d ******/
		%feature("compactdefaultargs") SetPosition;
		%feature("autodoc", "
Parameters
----------
thePosition: gp_Pnt

Return
-------
None

Description
-----------
Setup position.
") SetPosition;
		void SetPosition(const gp_Pnt & thePosition);

		/****** AIS_TextLabel::SetText ******/
		/****** md5 signature: 4a1b137668607e74e5fd1c9c0ecf6bb3 ******/
		%feature("compactdefaultargs") SetText;
		%feature("autodoc", "
Parameters
----------
theText: str

Return
-------
None

Description
-----------
Setup text.
") SetText;
		void SetText(TCollection_ExtendedString theText);

		/****** AIS_TextLabel::SetTextFormatter ******/
		/****** md5 signature: 69d92dbd5b2f2ec93859c8dcc0b4f585 ******/
		%feature("compactdefaultargs") SetTextFormatter;
		%feature("autodoc", "
Parameters
----------
theFormatter: Font_TextFormatter

Return
-------
None

Description
-----------
Setup text formatter for presentation. It's empty by default.
") SetTextFormatter;
		void SetTextFormatter(const opencascade::handle<Font_TextFormatter> & theFormatter);

		/****** AIS_TextLabel::SetTransparency ******/
		/****** md5 signature: 9582fced1bcb1b8dbb6c76d8e3e022f6 ******/
		%feature("compactdefaultargs") SetTransparency;
		%feature("autodoc", "
Parameters
----------
theValue: double

Return
-------
None

Description
-----------
Setup transparency within [0, 1] range.
") SetTransparency;
		void SetTransparency(const double theValue);

		/****** AIS_TextLabel::SetVJustification ******/
		/****** md5 signature: 74811ea56e21f5af22a1b17013352e38 ******/
		%feature("compactdefaultargs") SetVJustification;
		%feature("autodoc", "
Parameters
----------
theVJust: Graphic3d_VerticalTextAlignment

Return
-------
None

Description
-----------
Setup vertical justification.
") SetVJustification;
		void SetVJustification(const Graphic3d_VerticalTextAlignment theVJust);

		/****** AIS_TextLabel::SetZoomable ******/
		/****** md5 signature: 046f62395d774c4a16a46964e801006f ******/
		%feature("compactdefaultargs") SetZoomable;
		%feature("autodoc", "
Parameters
----------
theIsZoomable: bool

Return
-------
None

Description
-----------
Setup zoomable property.
") SetZoomable;
		void SetZoomable(const bool theIsZoomable);

		/****** AIS_TextLabel::Text ******/
		/****** md5 signature: 72bf6306b0638727f5e5c6cb054bb79f ******/
		%feature("compactdefaultargs") Text;
		%feature("autodoc", "Return
-------
TCollection_ExtendedString

Description
-----------
Returns the label text.
") Text;
		const TCollection_ExtendedString & Text();

		/****** AIS_TextLabel::TextFormatter ******/
		/****** md5 signature: 8f3bf7d01406c07afa85cad5f2782460 ******/
		%feature("compactdefaultargs") TextFormatter;
		%feature("autodoc", "Return
-------
opencascade::handle<Font_TextFormatter>

Description
-----------
Returns text presentation formatter; NULL by default, which means standard text formatter will be used.
") TextFormatter;
		const opencascade::handle<Font_TextFormatter> & TextFormatter();

		/****** AIS_TextLabel::UnsetOrientation3D ******/
		/****** md5 signature: 493fe411e83a69dc26417de323100db9 ******/
		%feature("compactdefaultargs") UnsetOrientation3D;
		%feature("autodoc", "Return
-------
None

Description
-----------
Reset label orientation in the model 3D space.
") UnsetOrientation3D;
		void UnsetOrientation3D();

		/****** AIS_TextLabel::UnsetTransparency ******/
		/****** md5 signature: 9018897577979ed9f7a251e3f4363da8 ******/
		%feature("compactdefaultargs") UnsetTransparency;
		%feature("autodoc", "Return
-------
None

Description
-----------
Removes the transparency setting.
") UnsetTransparency;
		void UnsetTransparency();

};


%make_alias(AIS_TextLabel)

%extend AIS_TextLabel {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************
* class AIS_Triangulation *
**************************/
class AIS_Triangulation : public AIS_InteractiveObject {
	public:
		/****** AIS_Triangulation::AIS_Triangulation ******/
		/****** md5 signature: b1f39d13206b79ed4e26675482c469c3 ******/
		%feature("compactdefaultargs") AIS_Triangulation;
		%feature("autodoc", "
Parameters
----------
aTriangulation: Poly_Triangulation

Return
-------
None

Description
-----------
Constructs the Triangulation display object.
") AIS_Triangulation;
		 AIS_Triangulation(const opencascade::handle<Poly_Triangulation> & aTriangulation);

		/****** AIS_Triangulation::GetColors ******/
		/****** md5 signature: d05f00232cd32745d87250fbf5305413 ******/
		%feature("compactdefaultargs") GetColors;
		%feature("autodoc", "Return
-------
opencascade::handle<TColStd_HArray1OfInteger>

Description
-----------
Get the color for each node. Each 32-bit color is Alpha << 24 + Blue << 16 + Green << 8 + Red.
") GetColors;
		opencascade::handle<TColStd_HArray1OfInteger> GetColors();

		/****** AIS_Triangulation::GetTriangulation ******/
		/****** md5 signature: 43bd327b5645ba0da5653a0bd81a9f5b ******/
		%feature("compactdefaultargs") GetTriangulation;
		%feature("autodoc", "Return
-------
opencascade::handle<Poly_Triangulation>

Description
-----------
Returns Poly_Triangulation .
") GetTriangulation;
		opencascade::handle<Poly_Triangulation> GetTriangulation();

		/****** AIS_Triangulation::HasVertexColors ******/
		/****** md5 signature: 8db29bfd26e034a818f0ab3bc2aad2c2 ******/
		%feature("compactdefaultargs") HasVertexColors;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if triangulation has vertex colors.
") HasVertexColors;
		bool HasVertexColors();

		/****** AIS_Triangulation::SetColors ******/
		/****** md5 signature: 4fb2ee7b05e753a0f181c22281a7d70b ******/
		%feature("compactdefaultargs") SetColors;
		%feature("autodoc", "
Parameters
----------
aColor: TColStd_HArray1OfInteger

Return
-------
None

Description
-----------
Set the color for each node. Each 32-bit color is Alpha << 24 + Blue << 16 + Green << 8 + Red Order of color components is essential for further usage by OpenGL.
") SetColors;
		void SetColors(const opencascade::handle<TColStd_HArray1OfInteger> & aColor);

		/****** AIS_Triangulation::SetTransparency ******/
		/****** md5 signature: e5e4b890b6aeb9b23a1ad2e264a87891 ******/
		%feature("compactdefaultargs") SetTransparency;
		%feature("autodoc", "
Parameters
----------
aValue: double (optional, default to 0.6)

Return
-------
None

Description
-----------
Sets the value aValue for transparency in the reconstructed compound shape.
") SetTransparency;
		void SetTransparency(const double aValue = 0.6);

		/****** AIS_Triangulation::SetTriangulation ******/
		/****** md5 signature: 5958e531c24aa9ebf5d35ea3895b63dd ******/
		%feature("compactdefaultargs") SetTriangulation;
		%feature("autodoc", "
Parameters
----------
aTriangulation: Poly_Triangulation

Return
-------
None

Description
-----------
No available documentation.
") SetTriangulation;
		void SetTriangulation(const opencascade::handle<Poly_Triangulation> & aTriangulation);

		/****** AIS_Triangulation::UnsetTransparency ******/
		/****** md5 signature: b0bbb5c0e2872867b944fb3488b9badd ******/
		%feature("compactdefaultargs") UnsetTransparency;
		%feature("autodoc", "Return
-------
None

Description
-----------
Removes the setting for transparency in the reconstructed compound shape.
") UnsetTransparency;
		void UnsetTransparency();

};


%make_alias(AIS_Triangulation)

%extend AIS_Triangulation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************
* class AIS_Trihedron *
**********************/
class AIS_Trihedron : public AIS_InteractiveObject {
	public:
		/****** AIS_Trihedron::AIS_Trihedron ******/
		/****** md5 signature: 7abadf81ecefbae170558dec5a045471 ******/
		%feature("compactdefaultargs") AIS_Trihedron;
		%feature("autodoc", "
Parameters
----------
theComponent: Geom_Axis2Placement

Return
-------
None

Description
-----------
Initializes a trihedron entity.
") AIS_Trihedron;
		 AIS_Trihedron(const opencascade::handle<Geom_Axis2Placement> & theComponent);

		/****** AIS_Trihedron::AcceptDisplayMode ******/
		/****** md5 signature: 87fb12421b337c0d3c009064a10e954f ******/
		%feature("compactdefaultargs") AcceptDisplayMode;
		%feature("autodoc", "
Parameters
----------
theMode: int

Return
-------
bool

Description
-----------
Returns true if the display mode selected, aMode, is valid for trihedron datums.
") AcceptDisplayMode;
		bool AcceptDisplayMode(const int theMode);

		/****** AIS_Trihedron::ArrowColor ******/
		/****** md5 signature: 4fc33e4156a708bf068aa14dcdd1f4ea ******/
		%feature("compactdefaultargs") ArrowColor;
		%feature("autodoc", "Return
-------
Quantity_Color

Description
-----------
Returns trihedron arrow color.
") ArrowColor;
		Quantity_Color ArrowColor();

		/****** AIS_Trihedron::ClearSelected ******/
		/****** md5 signature: bbf73c5d3ff19ae0db25243e1c446610 ******/
		%feature("compactdefaultargs") ClearSelected;
		%feature("autodoc", "Return
-------
None

Description
-----------
Method which clear all selected owners belonging to this selectable object (for fast presentation draw).
") ClearSelected;
		void ClearSelected();

		/****** AIS_Trihedron::Component ******/
		/****** md5 signature: 1234d8906c95cc001e4c962cd9c4933b ******/
		%feature("compactdefaultargs") Component;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom_Axis2Placement>

Description
-----------
Returns the right-handed coordinate system set in SetComponent.
") Component;
		const opencascade::handle<Geom_Axis2Placement> & Component();

		/****** AIS_Trihedron::DatumDisplayMode ******/
		/****** md5 signature: 85349bc7830d85b4d93f109c8361b6bf ******/
		%feature("compactdefaultargs") DatumDisplayMode;
		%feature("autodoc", "Return
-------
Prs3d_DatumMode

Description
-----------
Returns datum display mode.
") DatumDisplayMode;
		Prs3d_DatumMode DatumDisplayMode();

		/****** AIS_Trihedron::DatumPartColor ******/
		/****** md5 signature: 6085d0ed60102d6ed078723a4a105a8f ******/
		%feature("compactdefaultargs") DatumPartColor;
		%feature("autodoc", "
Parameters
----------
thePart: Prs3d_DatumParts

Return
-------
Quantity_Color

Description
-----------
Returns color of datum part: origin or some of trihedron axes.
") DatumPartColor;
		Quantity_Color DatumPartColor(Prs3d_DatumParts thePart);

		/****** AIS_Trihedron::HasArrowColor ******/
		/****** md5 signature: aa6c14ef483234d32114bf7cda3d015e ******/
		%feature("compactdefaultargs") HasArrowColor;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if trihedron has own arrow color.
") HasArrowColor;
		bool HasArrowColor();

		/****** AIS_Trihedron::HasOwnSize ******/
		/****** md5 signature: 59eab499ef3ea5e219a14642fe120d7f ******/
		%feature("compactdefaultargs") HasOwnSize;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if the trihedron object has a size other than the default size of 100 mm. along each axis.
") HasOwnSize;
		bool HasOwnSize();

		/****** AIS_Trihedron::HasTextColor ******/
		/****** md5 signature: 7e9b711fe57e5b21eb6dc07bb050473c ******/
		%feature("compactdefaultargs") HasTextColor;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if trihedron has own text color.
") HasTextColor;
		bool HasTextColor();

		/****** AIS_Trihedron::HilightOwnerWithColor ******/
		/****** md5 signature: 0f2fbe3928cdfd19fd4ac5881486f69b ******/
		%feature("compactdefaultargs") HilightOwnerWithColor;
		%feature("autodoc", "
Parameters
----------
thePM: PrsMgr_PresentationManager
theStyle: Prs3d_Drawer
theOwner: SelectMgr_EntityOwner

Return
-------
None

Description
-----------
Method which highlights an owner belonging to this selectable object (for fast presentation draw).
") HilightOwnerWithColor;
		void HilightOwnerWithColor(const opencascade::handle<PrsMgr_PresentationManager> & thePM, const opencascade::handle<Prs3d_Drawer> & theStyle, const opencascade::handle<SelectMgr_EntityOwner> & theOwner);

		/****** AIS_Trihedron::HilightSelected ******/
		/****** md5 signature: c96239d10bdfb15c151647f8850a90b9 ******/
		%feature("compactdefaultargs") HilightSelected;
		%feature("autodoc", "
Parameters
----------
thePM: PrsMgr_PresentationManager
theOwners: SelectMgr_EntityOwner

Return
-------
None

Description
-----------
Method which draws selected owners (for fast presentation draw).
") HilightSelected;
		void HilightSelected(const opencascade::handle<PrsMgr_PresentationManager> & thePM, const NCollection_Sequence<opencascade::handle<SelectMgr_EntityOwner>> & theOwners);

		/****** AIS_Trihedron::Label ******/
		/****** md5 signature: cd3b87f754f01f91f4db0b402e5a6620 ******/
		%feature("compactdefaultargs") Label;
		%feature("autodoc", "
Parameters
----------
thePart: Prs3d_DatumParts

Return
-------
TCollection_ExtendedString

Description
-----------
Returns text of axis. Parameter thePart should be XAxis, YAxis or ZAxis.
") Label;
		const TCollection_ExtendedString & Label(Prs3d_DatumParts thePart);

		/****** AIS_Trihedron::SelectionPriority ******/
		/****** md5 signature: 51fb4318dce42a9fea243a5c76d4367f ******/
		%feature("compactdefaultargs") SelectionPriority;
		%feature("autodoc", "
Parameters
----------
thePart: Prs3d_DatumParts

Return
-------
int

Description
-----------
Returns priority of selection for owner of the given type.
") SelectionPriority;
		int SelectionPriority(Prs3d_DatumParts thePart);

		/****** AIS_Trihedron::SetArrowColor ******/
		/****** md5 signature: b033462aa3dce4543ee90b2ffdc498cd ******/
		%feature("compactdefaultargs") SetArrowColor;
		%feature("autodoc", "
Parameters
----------
theColor: Quantity_Color

Return
-------
None

Description
-----------
Sets color of arrow of trihedron axes.
") SetArrowColor;
		void SetArrowColor(const Quantity_Color & theColor);

		/****** AIS_Trihedron::SetArrowColor ******/
		/****** md5 signature: eed1ac90c97ed266f836f961bb20ebcd ******/
		%feature("compactdefaultargs") SetArrowColor;
		%feature("autodoc", "
Parameters
----------
thePart: Prs3d_DatumParts
theColor: Quantity_Color

Return
-------
None

Description
-----------
Sets color of arrow of trihedron axes.
") SetArrowColor;
		void SetArrowColor(const Prs3d_DatumParts thePart, const Quantity_Color & theColor);

		/****** AIS_Trihedron::SetAxisColor ******/
		/****** md5 signature: 5414b36e056312b5d2ce5a3255bab6e0 ******/
		%feature("compactdefaultargs") SetAxisColor;
		%feature("autodoc", "
Parameters
----------
theColor: Quantity_Color

Return
-------
None

Description
-----------
Sets color of z-axis. .
") SetAxisColor;
		void SetAxisColor(const Quantity_Color & theColor);

		/****** AIS_Trihedron::SetColor ******/
		/****** md5 signature: b174106500deaf4ecfa505bb8ae6784c ******/
		%feature("compactdefaultargs") SetColor;
		%feature("autodoc", "
Parameters
----------
theColor: Quantity_Color

Return
-------
None

Description
-----------
Sets the color theColor for this trihedron object, it changes color of axes.
") SetColor;
		void SetColor(const Quantity_Color & theColor);

		/****** AIS_Trihedron::SetComponent ******/
		/****** md5 signature: 0cb02d582043f1733c1764c1c909a674 ******/
		%feature("compactdefaultargs") SetComponent;
		%feature("autodoc", "
Parameters
----------
theComponent: Geom_Axis2Placement

Return
-------
None

Description
-----------
Constructs the right-handed coordinate system aComponent.
") SetComponent;
		void SetComponent(const opencascade::handle<Geom_Axis2Placement> & theComponent);

		/****** AIS_Trihedron::SetDatumDisplayMode ******/
		/****** md5 signature: 9f6d65070e9826102aec9979c024ba74 ******/
		%feature("compactdefaultargs") SetDatumDisplayMode;
		%feature("autodoc", "
Parameters
----------
theMode: Prs3d_DatumMode

Return
-------
None

Description
-----------
Sets Shading or Wireframe display mode, triangle or segment graphic group is used relatively.
") SetDatumDisplayMode;
		void SetDatumDisplayMode(Prs3d_DatumMode theMode);

		/****** AIS_Trihedron::SetDatumPartColor ******/
		/****** md5 signature: bac1c795a4dc41baab0e0761fbd4adfa ******/
		%feature("compactdefaultargs") SetDatumPartColor;
		%feature("autodoc", "
Parameters
----------
thePart: Prs3d_DatumParts
theColor: Quantity_Color

Return
-------
None

Description
-----------
Sets color of datum part: origin or some of trihedron axes. If presentation is shading mode, this color is set for both sides of facing model.
") SetDatumPartColor;
		void SetDatumPartColor(const Prs3d_DatumParts thePart, const Quantity_Color & theColor);

		/****** AIS_Trihedron::SetDrawArrows ******/
		/****** md5 signature: 25399ceea68aad8b14cce9a24461dbb3 ******/
		%feature("compactdefaultargs") SetDrawArrows;
		%feature("autodoc", "
Parameters
----------
theToDraw: bool

Return
-------
None

Description
-----------
Sets whether to draw the arrows in visualization.
") SetDrawArrows;
		void SetDrawArrows(const bool theToDraw);

		/****** AIS_Trihedron::SetLabel ******/
		/****** md5 signature: f46fc70422e44644cfd6260e70ed55d0 ******/
		%feature("compactdefaultargs") SetLabel;
		%feature("autodoc", "
Parameters
----------
thePart: Prs3d_DatumParts
theName: str

Return
-------
None

Description
-----------
Sets text label for trihedron axis. Parameter thePart should be XAxis, YAxis or ZAxis.
") SetLabel;
		void SetLabel(const Prs3d_DatumParts thePart, TCollection_ExtendedString theName);

		/****** AIS_Trihedron::SetOriginColor ******/
		/****** md5 signature: 1017d076464e72d0a5e64feb3baf458f ******/
		%feature("compactdefaultargs") SetOriginColor;
		%feature("autodoc", "
Parameters
----------
theColor: Quantity_Color

Return
-------
None

Description
-----------
Sets color of origin. .
") SetOriginColor;
		void SetOriginColor(const Quantity_Color & theColor);

		/****** AIS_Trihedron::SetSelectionPriority ******/
		/****** md5 signature: 161cfb064b17ba45b135f3a4369017d0 ******/
		%feature("compactdefaultargs") SetSelectionPriority;
		%feature("autodoc", "
Parameters
----------
thePart: Prs3d_DatumParts
thePriority: int

Return
-------
None

Description
-----------
Sets priority of selection for owner of the given type.
") SetSelectionPriority;
		void SetSelectionPriority(Prs3d_DatumParts thePart, int thePriority);

		/****** AIS_Trihedron::SetSize ******/
		/****** md5 signature: 0873fdf811d808e09c79ddaed4252ea4 ******/
		%feature("compactdefaultargs") SetSize;
		%feature("autodoc", "
Parameters
----------
theValue: double

Return
-------
None

Description
-----------
Sets the size of trihedron object.
") SetSize;
		void SetSize(const double theValue);

		/****** AIS_Trihedron::SetTextColor ******/
		/****** md5 signature: c4c1e2b86d1c9f306c0090e96309e623 ******/
		%feature("compactdefaultargs") SetTextColor;
		%feature("autodoc", "
Parameters
----------
theColor: Quantity_Color

Return
-------
None

Description
-----------
Sets color of label of trihedron axes.
") SetTextColor;
		void SetTextColor(const Quantity_Color & theColor);

		/****** AIS_Trihedron::SetTextColor ******/
		/****** md5 signature: bdaf05bdad9bcc4e0cbdf6a0d46642a3 ******/
		%feature("compactdefaultargs") SetTextColor;
		%feature("autodoc", "
Parameters
----------
thePart: Prs3d_DatumParts
theColor: Quantity_Color

Return
-------
None

Description
-----------
Sets color of label of trihedron axis.
") SetTextColor;
		void SetTextColor(const Prs3d_DatumParts thePart, const Quantity_Color & theColor);

		/****** AIS_Trihedron::SetXAxisColor ******/
		/****** md5 signature: ed9ab965e65191191a7681d47d2ec159 ******/
		%feature("compactdefaultargs") SetXAxisColor;
		%feature("autodoc", "
Parameters
----------
theColor: Quantity_Color

Return
-------
None

Description
-----------
Sets color of x-axis. .
") SetXAxisColor;
		void SetXAxisColor(const Quantity_Color & theColor);

		/****** AIS_Trihedron::SetYAxisColor ******/
		/****** md5 signature: 3d9f763d5f18d448930e3a455d43081f ******/
		%feature("compactdefaultargs") SetYAxisColor;
		%feature("autodoc", "
Parameters
----------
theColor: Quantity_Color

Return
-------
None

Description
-----------
Sets color of y-axis. .
") SetYAxisColor;
		void SetYAxisColor(const Quantity_Color & theColor);

		/****** AIS_Trihedron::Signature ******/
		/****** md5 signature: cb4be277567e09ceca8f8a2aaa8aa8fd ******/
		%feature("compactdefaultargs") Signature;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns index 3, selection of the planes XOY, YOZ, XOZ.
") Signature;
		int Signature();

		/****** AIS_Trihedron::Size ******/
		/****** md5 signature: 06192572c9cdca54cf74477cdabdab63 ******/
		%feature("compactdefaultargs") Size;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns the size of trihedron object; 100.0 by DEFAULT.
") Size;
		double Size();

		/****** AIS_Trihedron::TextColor ******/
		/****** md5 signature: 44826bd1a0a47517f0715e047eb767ed ******/
		%feature("compactdefaultargs") TextColor;
		%feature("autodoc", "Return
-------
Quantity_Color

Description
-----------
Returns trihedron text color.
") TextColor;
		Quantity_Color TextColor();

		/****** AIS_Trihedron::ToDrawArrows ******/
		/****** md5 signature: b422eaf15680c56446f056d879451463 ******/
		%feature("compactdefaultargs") ToDrawArrows;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if arrows are to be drawn.
") ToDrawArrows;
		bool ToDrawArrows();

		/****** AIS_Trihedron::Type ******/
		/****** md5 signature: c88659fa26c5e97835681ebdf0f08b53 ******/
		%feature("compactdefaultargs") Type;
		%feature("autodoc", "Return
-------
AIS_KindOfInteractive

Description
-----------
Indicates that the type of Interactive Object is datum.
") Type;
		AIS_KindOfInteractive Type();

		/****** AIS_Trihedron::UnsetColor ******/
		/****** md5 signature: 11f9cda4f631b34a4be33c2bf7cf48b1 ******/
		%feature("compactdefaultargs") UnsetColor;
		%feature("autodoc", "Return
-------
None

Description
-----------
Removes the settings for color.
") UnsetColor;
		void UnsetColor();

		/****** AIS_Trihedron::UnsetSize ******/
		/****** md5 signature: 01e2703c873bbcb3ae46d4b247bdacb6 ******/
		%feature("compactdefaultargs") UnsetSize;
		%feature("autodoc", "Return
-------
None

Description
-----------
Removes any non-default settings for size of this trihedron object. If the object has 1 color, the default size of the drawer is reproduced, otherwise DatumAspect becomes null.
") UnsetSize;
		void UnsetSize();

};


%make_alias(AIS_Trihedron)

%extend AIS_Trihedron {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************
* class AIS_ViewCube *
*********************/
class AIS_ViewCube : public AIS_InteractiveObject {
	public:
		/****** AIS_ViewCube::AIS_ViewCube ******/
		/****** md5 signature: 582207f6972f9893779647b1bc5ed072 ******/
		%feature("compactdefaultargs") AIS_ViewCube;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") AIS_ViewCube;
		 AIS_ViewCube();

		/****** AIS_ViewCube::AcceptDisplayMode ******/
		/****** md5 signature: 87fb12421b337c0d3c009064a10e954f ******/
		%feature("compactdefaultargs") AcceptDisplayMode;
		%feature("autodoc", "
Parameters
----------
theMode: int

Return
-------
bool

Description
-----------
Return True for supported display mode.
") AcceptDisplayMode;
		bool AcceptDisplayMode(const int theMode);

		/****** AIS_ViewCube::AxesConeRadius ******/
		/****** md5 signature: 92d48442664ad3f02c7a10ae3836f8e1 ******/
		%feature("compactdefaultargs") AxesConeRadius;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns radius of cone of axes of the trihedron; 3.0 by default.
") AxesConeRadius;
		double AxesConeRadius();

		/****** AIS_ViewCube::AxesPadding ******/
		/****** md5 signature: 514b7fba901aec978acfb515f8c594e4 ******/
		%feature("compactdefaultargs") AxesPadding;
		%feature("autodoc", "Return
-------
double

Description
-----------
Return padding between axes and 3D part (box); 10 by default.
") AxesPadding;
		double AxesPadding();

		/****** AIS_ViewCube::AxesRadius ******/
		/****** md5 signature: c04248dcd333a9a36f01fe16a60ed231 ******/
		%feature("compactdefaultargs") AxesRadius;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns radius of axes of the trihedron; 1.0 by default.
") AxesRadius;
		double AxesRadius();

		/****** AIS_ViewCube::AxesSphereRadius ******/
		/****** md5 signature: f33aef58cba4781a6264ad056d66488e ******/
		%feature("compactdefaultargs") AxesSphereRadius;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns radius of sphere (central point) of the trihedron; 4.0 by default.
") AxesSphereRadius;
		double AxesSphereRadius();

		/****** AIS_ViewCube::AxisLabel ******/
		/****** md5 signature: 5de552dbd8b43895a1c56ff8429a7ff8 ******/
		%feature("compactdefaultargs") AxisLabel;
		%feature("autodoc", "
Parameters
----------
theAxis: Prs3d_DatumParts

Return
-------
TCollection_AsciiString

Description
-----------
Return axes labels or empty string if undefined. Default labels: X, Y, Z.
") AxisLabel;
		TCollection_AsciiString AxisLabel(Prs3d_DatumParts theAxis);

		/****** AIS_ViewCube::BoxColor ******/
		/****** md5 signature: 50e147884653441e4200c687eaac0698 ******/
		%feature("compactdefaultargs") BoxColor;
		%feature("autodoc", "Return
-------
Quantity_Color

Description
-----------
Return value of front color for the 3D part of object.
") BoxColor;
		const Quantity_Color & BoxColor();

		/****** AIS_ViewCube::BoxCornerMinSize ******/
		/****** md5 signature: 0444c53a9c3a8911c6277f87caa7aa00 ******/
		%feature("compactdefaultargs") BoxCornerMinSize;
		%feature("autodoc", "Return
-------
double

Description
-----------
Return minimal size of box corner; 2 by default.
") BoxCornerMinSize;
		double BoxCornerMinSize();

		/****** AIS_ViewCube::BoxCornerStyle ******/
		/****** md5 signature: fd4fc1c3355e14afdded11cd3419cf7a ******/
		%feature("compactdefaultargs") BoxCornerStyle;
		%feature("autodoc", "Return
-------
opencascade::handle<Prs3d_ShadingAspect>

Description
-----------
Return shading style of box corners.
") BoxCornerStyle;
		const opencascade::handle<Prs3d_ShadingAspect> & BoxCornerStyle();

		/****** AIS_ViewCube::BoxEdgeGap ******/
		/****** md5 signature: 4bede6bef212fcdd8f0f2f4e7b206d15 ******/
		%feature("compactdefaultargs") BoxEdgeGap;
		%feature("autodoc", "Return
-------
double

Description
-----------
Return gap between box edges and box sides; 0 by default.
") BoxEdgeGap;
		double BoxEdgeGap();

		/****** AIS_ViewCube::BoxEdgeMinSize ******/
		/****** md5 signature: 9e7ed8f71f87e9cb4a03bd8fd6767477 ******/
		%feature("compactdefaultargs") BoxEdgeMinSize;
		%feature("autodoc", "Return
-------
double

Description
-----------
Return minimal size of box edge; 2 by default.
") BoxEdgeMinSize;
		double BoxEdgeMinSize();

		/****** AIS_ViewCube::BoxEdgeStyle ******/
		/****** md5 signature: 5e9bce8c10e662a32cada7316ea97356 ******/
		%feature("compactdefaultargs") BoxEdgeStyle;
		%feature("autodoc", "Return
-------
opencascade::handle<Prs3d_ShadingAspect>

Description
-----------
Return shading style of box edges.
") BoxEdgeStyle;
		const opencascade::handle<Prs3d_ShadingAspect> & BoxEdgeStyle();

		/****** AIS_ViewCube::BoxFacetExtension ******/
		/****** md5 signature: 8dbac938db67b41e90fa1690222659b3 ******/
		%feature("compactdefaultargs") BoxFacetExtension;
		%feature("autodoc", "Return
-------
double

Description
-----------
Return box facet extension to edge/corner facet split; 10 by default.
") BoxFacetExtension;
		double BoxFacetExtension();

		/****** AIS_ViewCube::BoxSideLabel ******/
		/****** md5 signature: a97bf5fe626f7488166a6ec22c6801dd ******/
		%feature("compactdefaultargs") BoxSideLabel;
		%feature("autodoc", "
Parameters
----------
theSide: V3d_TypeOfOrientation

Return
-------
TCollection_AsciiString

Description
-----------
Return box side label or empty string if undefined. Default labels: FRONT, BACK, LEFT, RIGHT, TOP, BOTTOM.
") BoxSideLabel;
		TCollection_AsciiString BoxSideLabel(V3d_TypeOfOrientation theSide);

		/****** AIS_ViewCube::BoxSideStyle ******/
		/****** md5 signature: a46fcc5ed6922015f07f2f9b6adb0b29 ******/
		%feature("compactdefaultargs") BoxSideStyle;
		%feature("autodoc", "Return
-------
opencascade::handle<Prs3d_ShadingAspect>

Description
-----------
Return shading style of box sides.
") BoxSideStyle;
		const opencascade::handle<Prs3d_ShadingAspect> & BoxSideStyle();

		/****** AIS_ViewCube::BoxTransparency ******/
		/****** md5 signature: 7e2e1781a4bfbec627de2d831ea2639f ******/
		%feature("compactdefaultargs") BoxTransparency;
		%feature("autodoc", "Return
-------
double

Description
-----------
Return transparency for 3D part of object.
") BoxTransparency;
		double BoxTransparency();

		/****** AIS_ViewCube::ClearSelected ******/
		/****** md5 signature: 18addb519b7e5e4a9d82362327b4a543 ******/
		%feature("compactdefaultargs") ClearSelected;
		%feature("autodoc", "Return
-------
None

Description
-----------
Method which clear all selected owners belonging to this selectable object. @warning this object does not support selection.
") ClearSelected;
		void ClearSelected();

		/****** AIS_ViewCube::Compute ******/
		/****** md5 signature: 26eb7e31f3632d89998a902a197dae4e ******/
		%feature("compactdefaultargs") Compute;
		%feature("autodoc", "
Parameters
----------
thePrsMgr: PrsMgr_PresentationManager
thePrs: Prs3d_Presentation
theMode: int (optional, default to 0)

Return
-------
None

Description
-----------
Compute 3D part of View Cube. 
Input parameter: thePrsMgr presentation manager. 
Input parameter: thePrs input presentation that is to be filled with flat presentation primitives. 
Input parameter: theMode display mode. @warning this object accept only 0 display mode.
") Compute;
		void Compute(const opencascade::handle<PrsMgr_PresentationManager> & thePrsMgr, const opencascade::handle<Prs3d_Presentation> & thePrs, const int theMode = 0);

		/****** AIS_ViewCube::ComputeSelection ******/
		/****** md5 signature: 80bbf2353e570b22648f0171cb224c2f ******/
		%feature("compactdefaultargs") ComputeSelection;
		%feature("autodoc", "
Parameters
----------
theSelection: SelectMgr_Selection
theMode: int

Return
-------
None

Description
-----------
Redefine computing of sensitive entities for View Cube. 
Input parameter: theSelection input selection object that is to be filled with sensitive entities. 
Input parameter: theMode selection mode. @warning object accepts only 0 selection mode.
") ComputeSelection;
		void ComputeSelection(const opencascade::handle<SelectMgr_Selection> & theSelection, const int theMode);

		/****** AIS_ViewCube::Duration ******/
		/****** md5 signature: ebedc130e033eb6791d18291a44481ea ******/
		%feature("compactdefaultargs") Duration;
		%feature("autodoc", "Return
-------
double

Description
-----------
Return duration of animation in seconds; 0.5 sec by default.
") Duration;
		double Duration();

		/****** AIS_ViewCube::Font ******/
		/****** md5 signature: 246154ff4659a4acf077229295e5855e ******/
		%feature("compactdefaultargs") Font;
		%feature("autodoc", "Return
-------
TCollection_AsciiString

Description
-----------
Return font name that is used for displaying of sides and axes text. Alias for: @code Attributes()->TextAspect()->Aspect()->SetFont() @endcode.
") Font;
		const TCollection_AsciiString & Font();

		/****** AIS_ViewCube::FontHeight ******/
		/****** md5 signature: 2da6d5593f9b6bf2c44e70f552dd80a4 ******/
		%feature("compactdefaultargs") FontHeight;
		%feature("autodoc", "Return
-------
double

Description
-----------
Return height of font.
") FontHeight;
		double FontHeight();

		/****** AIS_ViewCube::GlobalSelOwner ******/
		/****** md5 signature: 0a5947f02b4b0e4889696234407a4d87 ******/
		%feature("compactdefaultargs") GlobalSelOwner;
		%feature("autodoc", "Return
-------
opencascade::handle<SelectMgr_EntityOwner>

Description
-----------
Global selection has no meaning for this class.
") GlobalSelOwner;
		opencascade::handle<SelectMgr_EntityOwner> GlobalSelOwner();

		/****** AIS_ViewCube::HandleClick ******/
		/****** md5 signature: 233cc95372f82b5f942da4a36a76df2e ******/
		%feature("compactdefaultargs") HandleClick;
		%feature("autodoc", "
Parameters
----------
theOwner: AIS_ViewCubeOwner

Return
-------
None

Description
-----------
Perform camera transformation corresponding to the input detected owner.
") HandleClick;
		virtual void HandleClick(const opencascade::handle<AIS_ViewCubeOwner> & theOwner);

		/****** AIS_ViewCube::HasAnimation ******/
		/****** md5 signature: c3a2040ae247b737d701fc2007b84d6a ******/
		%feature("compactdefaultargs") HasAnimation;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Return: True if View Cube has unfinished animation of view camera.
") HasAnimation;
		bool HasAnimation();

		/****** AIS_ViewCube::HilightOwnerWithColor ******/
		/****** md5 signature: 0f2fbe3928cdfd19fd4ac5881486f69b ******/
		%feature("compactdefaultargs") HilightOwnerWithColor;
		%feature("autodoc", "
Parameters
----------
thePM: PrsMgr_PresentationManager
theStyle: Prs3d_Drawer
theOwner: SelectMgr_EntityOwner

Return
-------
None

Description
-----------
Method which highlights input owner belonging to this selectable object. 
Input parameter: thePM presentation manager 
Input parameter: theStyle style for dynamic highlighting. 
Input parameter: theOwner input entity owner.
") HilightOwnerWithColor;
		void HilightOwnerWithColor(const opencascade::handle<PrsMgr_PresentationManager> & thePM, const opencascade::handle<Prs3d_Drawer> & theStyle, const opencascade::handle<SelectMgr_EntityOwner> & theOwner);

		/****** AIS_ViewCube::HilightSelected ******/
		/****** md5 signature: c640a133511288b142f57f56721031c6 ******/
		%feature("compactdefaultargs") HilightSelected;
		%feature("autodoc", "
Parameters
----------
thePM: PrsMgr_PresentationManager
theSeq: SelectMgr_EntityOwner

Return
-------
None

Description
-----------
Method which draws selected owners.
") HilightSelected;
		void HilightSelected(const opencascade::handle<PrsMgr_PresentationManager> & thePM, const NCollection_Sequence<opencascade::handle<SelectMgr_EntityOwner>> & theSeq);

		/****** AIS_ViewCube::InnerColor ******/
		/****** md5 signature: 14a7d761b72d032118329dab4a717cc8 ******/
		%feature("compactdefaultargs") InnerColor;
		%feature("autodoc", "Return
-------
Quantity_Color

Description
-----------
Return color of sides back material.
") InnerColor;
		const Quantity_Color & InnerColor();

		/****** AIS_ViewCube::IsAutoHilight ******/
		/****** md5 signature: 3edec92a3a77c7631dfaa86f05f1e7b8 ******/
		%feature("compactdefaultargs") IsAutoHilight;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Disables auto highlighting to use HilightSelected() and HilightOwnerWithColor() overridden methods.
") IsAutoHilight;
		bool IsAutoHilight();

		/****** AIS_ViewCube::IsBoxCorner ******/
		/****** md5 signature: 75fe36b27e987c1abfb32a08311b0265 ******/
		%feature("compactdefaultargs") IsBoxCorner;
		%feature("autodoc", "
Parameters
----------
theOrient: V3d_TypeOfOrientation

Return
-------
bool

Description
-----------
Return True if specified orientation belongs to box corner (vertex).
") IsBoxCorner;
		static bool IsBoxCorner(V3d_TypeOfOrientation theOrient);

		/****** AIS_ViewCube::IsBoxEdge ******/
		/****** md5 signature: dea43b60f7436844e12040dd2b97a04c ******/
		%feature("compactdefaultargs") IsBoxEdge;
		%feature("autodoc", "
Parameters
----------
theOrient: V3d_TypeOfOrientation

Return
-------
bool

Description
-----------
Return True if specified orientation belongs to box edge.
") IsBoxEdge;
		static bool IsBoxEdge(V3d_TypeOfOrientation theOrient);

		/****** AIS_ViewCube::IsBoxSide ******/
		/****** md5 signature: f20117775f8e7e897cd2c7de0f3999b8 ******/
		%feature("compactdefaultargs") IsBoxSide;
		%feature("autodoc", "
Parameters
----------
theOrient: V3d_TypeOfOrientation

Return
-------
bool

Description
-----------
Return True if specified orientation belongs to box side.
") IsBoxSide;
		static bool IsBoxSide(V3d_TypeOfOrientation theOrient);

		/****** AIS_ViewCube::IsFixedAnimationLoop ******/
		/****** md5 signature: 9ab9df732b7f46ffc02991f198c808c7 ******/
		%feature("compactdefaultargs") IsFixedAnimationLoop;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Return True if camera animation should be done in uninterruptible loop; True by default.
") IsFixedAnimationLoop;
		bool IsFixedAnimationLoop();

		/****** AIS_ViewCube::IsYup ******/
		/****** md5 signature: 24e38a58d00c5d40cf61bf8fa5eccfc7 ******/
		%feature("compactdefaultargs") IsYup;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Return True if application expects Y-up viewer orientation instead of Z-up; False by default.
") IsYup;
		bool IsYup();

		/****** AIS_ViewCube::ResetStyles ******/
		/****** md5 signature: 1f06b68deac4bd647a9e560e0db0ee77 ******/
		%feature("compactdefaultargs") ResetStyles;
		%feature("autodoc", "Return
-------
None

Description
-----------
Reset all size and style parameters to default. @warning It doesn't reset position of View Cube.
") ResetStyles;
		void ResetStyles();

		/****** AIS_ViewCube::RoundRadius ******/
		/****** md5 signature: 40e2c8df121ee010eaa5fa523fa3f026 ******/
		%feature("compactdefaultargs") RoundRadius;
		%feature("autodoc", "Return
-------
double

Description
-----------
Return relative radius of side corners (round rectangle); 0.0 by default. The value in within [0, 0.5] range meaning absolute radius = RoundRadius() / Size().
") RoundRadius;
		double RoundRadius();

		/****** AIS_ViewCube::SetAutoStartAnimation ******/
		/****** md5 signature: 8a1b8c856a96bad116e83f4b7a7dfe16 ******/
		%feature("compactdefaultargs") SetAutoStartAnimation;
		%feature("autodoc", "
Parameters
----------
theToEnable: bool

Return
-------
None

Description
-----------
Enable/disable automatic camera transformation on selection (highlighting). The automatic logic can be disabled if application wants performing action manually basing on picking results (AIS_ViewCubeOwner).
") SetAutoStartAnimation;
		void SetAutoStartAnimation(bool theToEnable);

		/****** AIS_ViewCube::SetAxesConeRadius ******/
		/****** md5 signature: 1e629bedd79281cbba4b79ef0eab00b2 ******/
		%feature("compactdefaultargs") SetAxesConeRadius;
		%feature("autodoc", "
Parameters
----------
theRadius: double

Return
-------
None

Description
-----------
Sets radius of cone of axes of the trihedron.
") SetAxesConeRadius;
		void SetAxesConeRadius(double theRadius);

		/****** AIS_ViewCube::SetAxesLabels ******/
		/****** md5 signature: e0b70137acafbab1dfb0049c9b2302e4 ******/
		%feature("compactdefaultargs") SetAxesLabels;
		%feature("autodoc", "
Parameters
----------
theX: str
theY: str
theZ: str

Return
-------
None

Description
-----------
Set axes labels.
") SetAxesLabels;
		void SetAxesLabels(TCollection_AsciiString theX, TCollection_AsciiString theY, TCollection_AsciiString theZ);

		/****** AIS_ViewCube::SetAxesPadding ******/
		/****** md5 signature: fd621bdfab98bc7cc4810cb6974912f7 ******/
		%feature("compactdefaultargs") SetAxesPadding;
		%feature("autodoc", "
Parameters
----------
theValue: double

Return
-------
None

Description
-----------
Set new value of padding between axes and 3D part (box).
") SetAxesPadding;
		void SetAxesPadding(double theValue);

		/****** AIS_ViewCube::SetAxesRadius ******/
		/****** md5 signature: 20c6d15e904d978d9727ba8dbbe0f08c ******/
		%feature("compactdefaultargs") SetAxesRadius;
		%feature("autodoc", "
Parameters
----------
theRadius: double

Return
-------
None

Description
-----------
Sets radius of axes of the trihedron.
") SetAxesRadius;
		void SetAxesRadius(const double theRadius);

		/****** AIS_ViewCube::SetAxesSphereRadius ******/
		/****** md5 signature: 17d564eca258959f620ec6f5820b525d ******/
		%feature("compactdefaultargs") SetAxesSphereRadius;
		%feature("autodoc", "
Parameters
----------
theRadius: double

Return
-------
None

Description
-----------
Sets radius of sphere (central point) of the trihedron.
") SetAxesSphereRadius;
		void SetAxesSphereRadius(double theRadius);

		/****** AIS_ViewCube::SetBoxColor ******/
		/****** md5 signature: 88db23bbfdea3bc42a298167dbc484b3 ******/
		%feature("compactdefaultargs") SetBoxColor;
		%feature("autodoc", "
Parameters
----------
theColor: Quantity_Color

Return
-------
None

Description
-----------
Set new value of front color for the 3D part of object. 
Input parameter: theColor input color value.
") SetBoxColor;
		void SetBoxColor(const Quantity_Color & theColor);

		/****** AIS_ViewCube::SetBoxCornerMinSize ******/
		/****** md5 signature: 49b5b033752d0ecfd212e8c58d5edfaf ******/
		%feature("compactdefaultargs") SetBoxCornerMinSize;
		%feature("autodoc", "
Parameters
----------
theValue: double

Return
-------
None

Description
-----------
Set new value of box corner minimal size.
") SetBoxCornerMinSize;
		void SetBoxCornerMinSize(double theValue);

		/****** AIS_ViewCube::SetBoxEdgeGap ******/
		/****** md5 signature: 02e229cf58dfe2b587b467fa69a3dad4 ******/
		%feature("compactdefaultargs") SetBoxEdgeGap;
		%feature("autodoc", "
Parameters
----------
theValue: double

Return
-------
None

Description
-----------
Set new value of box edges gap.
") SetBoxEdgeGap;
		void SetBoxEdgeGap(double theValue);

		/****** AIS_ViewCube::SetBoxEdgeMinSize ******/
		/****** md5 signature: 98cc3aac831541e75613a37a92007fe9 ******/
		%feature("compactdefaultargs") SetBoxEdgeMinSize;
		%feature("autodoc", "
Parameters
----------
theValue: double

Return
-------
None

Description
-----------
Set new value of box edge minimal size.
") SetBoxEdgeMinSize;
		void SetBoxEdgeMinSize(double theValue);

		/****** AIS_ViewCube::SetBoxFacetExtension ******/
		/****** md5 signature: 049b6a0252dfa03fc7327c6de1a2b226 ******/
		%feature("compactdefaultargs") SetBoxFacetExtension;
		%feature("autodoc", "
Parameters
----------
theValue: double

Return
-------
None

Description
-----------
Set new value of box facet extension.
") SetBoxFacetExtension;
		void SetBoxFacetExtension(double theValue);

		/****** AIS_ViewCube::SetBoxSideLabel ******/
		/****** md5 signature: afb875f447d85dddc5aecae5535def86 ******/
		%feature("compactdefaultargs") SetBoxSideLabel;
		%feature("autodoc", "
Parameters
----------
theSide: V3d_TypeOfOrientation
theLabel: str

Return
-------
None

Description
-----------
Set box side label.
") SetBoxSideLabel;
		void SetBoxSideLabel(const V3d_TypeOfOrientation theSide, TCollection_AsciiString theLabel);

		/****** AIS_ViewCube::SetBoxTransparency ******/
		/****** md5 signature: 11250fe2a65584ef52b1f987e69852ed ******/
		%feature("compactdefaultargs") SetBoxTransparency;
		%feature("autodoc", "
Parameters
----------
theValue: double

Return
-------
None

Description
-----------
Set new value of transparency for 3D part of object. 
Input parameter: theValue input transparency value.
") SetBoxTransparency;
		void SetBoxTransparency(double theValue);

		/****** AIS_ViewCube::SetColor ******/
		/****** md5 signature: 5c58a8cc6047afcf6f911e266de9cce6 ******/
		%feature("compactdefaultargs") SetColor;
		%feature("autodoc", "
Parameters
----------
theColor: Quantity_Color

Return
-------
None

Description
-----------
Set new value of color for the whole object. 
Input parameter: theColor input color value.
") SetColor;
		void SetColor(const Quantity_Color & theColor);

		/****** AIS_ViewCube::SetDrawAxes ******/
		/****** md5 signature: 36660a28f6ed42a2ab3c7d88271f81f0 ******/
		%feature("compactdefaultargs") SetDrawAxes;
		%feature("autodoc", "
Parameters
----------
theValue: bool

Return
-------
None

Description
-----------
Enable/disable drawing of trihedron.
") SetDrawAxes;
		void SetDrawAxes(bool theValue);

		/****** AIS_ViewCube::SetDrawEdges ******/
		/****** md5 signature: 1c3dbe06446b01e60e243102cb327836 ******/
		%feature("compactdefaultargs") SetDrawEdges;
		%feature("autodoc", "
Parameters
----------
theValue: bool

Return
-------
None

Description
-----------
Enable/disable drawing of edges of View Cube.
") SetDrawEdges;
		void SetDrawEdges(bool theValue);

		/****** AIS_ViewCube::SetDrawVertices ******/
		/****** md5 signature: b3a346d0328a83e2dc5bc296474583d3 ******/
		%feature("compactdefaultargs") SetDrawVertices;
		%feature("autodoc", "
Parameters
----------
theValue: bool

Return
-------
None

Description
-----------
Enable/disable drawing of vertices (corners) of View Cube.
") SetDrawVertices;
		void SetDrawVertices(bool theValue);

		/****** AIS_ViewCube::SetDuration ******/
		/****** md5 signature: 3f785eed39f205e03f108d010e1e1e68 ******/
		%feature("compactdefaultargs") SetDuration;
		%feature("autodoc", "
Parameters
----------
theValue: double

Return
-------
None

Description
-----------
Set duration of animation. 
Input parameter: theValue input value of duration in seconds.
") SetDuration;
		void SetDuration(double theValue);

		/****** AIS_ViewCube::SetFitSelected ******/
		/****** md5 signature: d77d5d1236510a5294914ef91feb189a ******/
		%feature("compactdefaultargs") SetFitSelected;
		%feature("autodoc", "
Parameters
----------
theToFitSelected: bool

Return
-------
None

Description
-----------
Set if animation should fit selected objects or to fit entire scene.
") SetFitSelected;
		void SetFitSelected(bool theToFitSelected);

		/****** AIS_ViewCube::SetFixedAnimationLoop ******/
		/****** md5 signature: f081ff0fc52eba4baf015d8e1c8d3cf9 ******/
		%feature("compactdefaultargs") SetFixedAnimationLoop;
		%feature("autodoc", "
Parameters
----------
theToEnable: bool

Return
-------
None

Description
-----------
Set if camera animation should be done in uninterruptible loop.
") SetFixedAnimationLoop;
		void SetFixedAnimationLoop(bool theToEnable);

		/****** AIS_ViewCube::SetFont ******/
		/****** md5 signature: 7f2969793d80ece6d22485bcb15f06b4 ******/
		%feature("compactdefaultargs") SetFont;
		%feature("autodoc", "
Parameters
----------
theFont: str

Return
-------
None

Description
-----------
Set font name that is used for displaying of sides and axes text. Alias for: @code Attributes()->TextAspect()->SetFont() @endcode.
") SetFont;
		void SetFont(TCollection_AsciiString theFont);

		/****** AIS_ViewCube::SetFontHeight ******/
		/****** md5 signature: 57ca2d2505dfc87e39815db16834c52f ******/
		%feature("compactdefaultargs") SetFontHeight;
		%feature("autodoc", "
Parameters
----------
theValue: double

Return
-------
None

Description
-----------
Change font height. Alias for: @code Attributes()->TextAspect()->SetHeight() @endcode.
") SetFontHeight;
		void SetFontHeight(double theValue);

		/****** AIS_ViewCube::SetInnerColor ******/
		/****** md5 signature: c006b72a08a2372175b589ace45abf78 ******/
		%feature("compactdefaultargs") SetInnerColor;
		%feature("autodoc", "
Parameters
----------
theColor: Quantity_Color

Return
-------
None

Description
-----------
Set color of sides back material. Alias for: @code Attributes()->ShadingAspect()->Aspect()->ChangeBackMaterial().SetColor() @endcode.
") SetInnerColor;
		void SetInnerColor(const Quantity_Color & theColor);

		/****** AIS_ViewCube::SetMaterial ******/
		/****** md5 signature: d49d5c42563dd379e4f37403a5f9b0ac ******/
		%feature("compactdefaultargs") SetMaterial;
		%feature("autodoc", "
Parameters
----------
theMat: Graphic3d_MaterialAspect

Return
-------
None

Description
-----------
Sets the material for the interactive object.
") SetMaterial;
		void SetMaterial(const Graphic3d_MaterialAspect & theMat);

		/****** AIS_ViewCube::SetResetCamera ******/
		/****** md5 signature: 1b8b33182ff4a3b50209eefa64c59c7d ******/
		%feature("compactdefaultargs") SetResetCamera;
		%feature("autodoc", "
Parameters
----------
theToReset: bool

Return
-------
None

Description
-----------
Set if new camera Up direction should be always set to default value for a new camera Direction.
") SetResetCamera;
		void SetResetCamera(bool theToReset);

		/****** AIS_ViewCube::SetRoundRadius ******/
		/****** md5 signature: c8649ea8558c0fd34e9165914f2ec89d ******/
		%feature("compactdefaultargs") SetRoundRadius;
		%feature("autodoc", "
Parameters
----------
theValue: double

Return
-------
None

Description
-----------
Set relative radius of View Cube sides corners (round rectangle). The value should be within [0, 0.5] range.
") SetRoundRadius;
		void SetRoundRadius(const double theValue);

		/****** AIS_ViewCube::SetSize ******/
		/****** md5 signature: 45915b2c4badce95da767186cf4f7652 ******/
		%feature("compactdefaultargs") SetSize;
		%feature("autodoc", "
Parameters
----------
theValue: double
theToAdaptAnother: bool (optional, default to true)

Return
-------
None

Description
-----------
Sets size (width and height) of View cube sides. 
Parameter theToAdaptAnother if True, then other parameters will be adapted to specified size.
") SetSize;
		void SetSize(double theValue, bool theToAdaptAnother = true);

		/****** AIS_ViewCube::SetTextColor ******/
		/****** md5 signature: f1aa114965e956f094c13e5b3ae0dc42 ******/
		%feature("compactdefaultargs") SetTextColor;
		%feature("autodoc", "
Parameters
----------
theColor: Quantity_Color

Return
-------
None

Description
-----------
Set color of text labels on box sides. Alias for: @code Attributes()->TextAspect()->SetColor() @endcode.
") SetTextColor;
		void SetTextColor(const Quantity_Color & theColor);

		/****** AIS_ViewCube::SetTransparency ******/
		/****** md5 signature: 060c38dc82a7406f19f614868eeef138 ******/
		%feature("compactdefaultargs") SetTransparency;
		%feature("autodoc", "
Parameters
----------
theValue: double

Return
-------
None

Description
-----------
Set new value of transparency for the whole object. 
Input parameter: theValue input transparency value.
") SetTransparency;
		void SetTransparency(const double theValue);

		/****** AIS_ViewCube::SetViewAnimation ******/
		/****** md5 signature: 853aa0ceb7bdaa632922e5e8afd4812f ******/
		%feature("compactdefaultargs") SetViewAnimation;
		%feature("autodoc", "
Parameters
----------
theAnimation: AIS_AnimationCamera

Return
-------
None

Description
-----------
Set view animation.
") SetViewAnimation;
		void SetViewAnimation(const opencascade::handle<AIS_AnimationCamera> & theAnimation);

		/****** AIS_ViewCube::SetYup ******/
		/****** md5 signature: b550dfd203744108c1d9917ec2148c9b ******/
		%feature("compactdefaultargs") SetYup;
		%feature("autodoc", "
Parameters
----------
theIsYup: bool
theToUpdateLabels: bool (optional, default to true)

Return
-------
None

Description
-----------
Set if application expects Y-up viewer orientation instead of Z-up.
") SetYup;
		void SetYup(bool theIsYup, bool theToUpdateLabels = true);

		/****** AIS_ViewCube::Size ******/
		/****** md5 signature: a692f88e36fb51593b7dee1f407b647f ******/
		%feature("compactdefaultargs") Size;
		%feature("autodoc", "Return
-------
double

Description
-----------
Return: size (width and height) of View cube sides; 100 by default.
") Size;
		double Size();

		/****** AIS_ViewCube::StartAnimation ******/
		/****** md5 signature: e11ccac5a43cc784cce774de19a1f2f9 ******/
		%feature("compactdefaultargs") StartAnimation;
		%feature("autodoc", "
Parameters
----------
theOwner: AIS_ViewCubeOwner

Return
-------
None

Description
-----------
Start camera transformation corresponding to the input detected owner. 
Input parameter: theOwner detected owner.
") StartAnimation;
		virtual void StartAnimation(const opencascade::handle<AIS_ViewCubeOwner> & theOwner);

		/****** AIS_ViewCube::TextColor ******/
		/****** md5 signature: 92b8584a07bd8f0e0e3839a819e74e79 ******/
		%feature("compactdefaultargs") TextColor;
		%feature("autodoc", "Return
-------
Quantity_Color

Description
-----------
Return text color of labels of box sides; BLACK by default.
") TextColor;
		const Quantity_Color & TextColor();

		/****** AIS_ViewCube::ToAutoStartAnimation ******/
		/****** md5 signature: b4d3d9da8d17277fd9908f1419d14b69 ******/
		%feature("compactdefaultargs") ToAutoStartAnimation;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Return True if automatic camera transformation on selection (highlighting) is enabled; True by default.
") ToAutoStartAnimation;
		bool ToAutoStartAnimation();

		/****** AIS_ViewCube::ToDrawAxes ******/
		/****** md5 signature: e59c10df31cd7c7d5638c74486d08235 ******/
		%feature("compactdefaultargs") ToDrawAxes;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Return: True if trihedron is drawn; True by default.
") ToDrawAxes;
		bool ToDrawAxes();

		/****** AIS_ViewCube::ToDrawEdges ******/
		/****** md5 signature: ebb13a2795fd190f68dd5ad205901719 ******/
		%feature("compactdefaultargs") ToDrawEdges;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Return: True if edges of View Cube is drawn; True by default.
") ToDrawEdges;
		bool ToDrawEdges();

		/****** AIS_ViewCube::ToDrawVertices ******/
		/****** md5 signature: ee84a0f7a65283d645f2d8f168525dac ******/
		%feature("compactdefaultargs") ToDrawVertices;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Return True if vertices (vertex) of View Cube is drawn; True by default.
") ToDrawVertices;
		bool ToDrawVertices();

		/****** AIS_ViewCube::ToFitSelected ******/
		/****** md5 signature: af20cb0fe0e3b47cff5576865c607055 ******/
		%feature("compactdefaultargs") ToFitSelected;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Return True if animation should fit selected objects and False to fit entire scene; True by default.
") ToFitSelected;
		bool ToFitSelected();

		/****** AIS_ViewCube::ToResetCameraUp ******/
		/****** md5 signature: 0cec9e5b0201b93a6489d46c4da3b674 ******/
		%feature("compactdefaultargs") ToResetCameraUp;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Return True if new camera Up direction should be always set to default value for a new camera Direction; False by default. When this flag is False, the new camera Up will be set as current Up orthogonalized to the new camera Direction, and will set to default Up on second click.
") ToResetCameraUp;
		bool ToResetCameraUp();

		/****** AIS_ViewCube::UnsetAttributes ******/
		/****** md5 signature: a11475568ffddcab54a51defc0c87fe4 ******/
		%feature("compactdefaultargs") UnsetAttributes;
		%feature("autodoc", "Return
-------
None

Description
-----------
Set default parameters for visual attributes 
See also: Attributes().
") UnsetAttributes;
		void UnsetAttributes();

		/****** AIS_ViewCube::UnsetColor ******/
		/****** md5 signature: 841a98372e7a63347d0e91fe67f933d4 ******/
		%feature("compactdefaultargs") UnsetColor;
		%feature("autodoc", "Return
-------
None

Description
-----------
Reset color for the whole object.
") UnsetColor;
		void UnsetColor();

		/****** AIS_ViewCube::UnsetHilightAttributes ******/
		/****** md5 signature: 6cd5a3d1ea02ed4d567d0845a0b34000 ******/
		%feature("compactdefaultargs") UnsetHilightAttributes;
		%feature("autodoc", "Return
-------
None

Description
-----------
Set default parameters for dynamic highlighting attributes, reset highlight attributes.
") UnsetHilightAttributes;
		void UnsetHilightAttributes();

		/****** AIS_ViewCube::UnsetMaterial ******/
		/****** md5 signature: 388d02a1244a4247b4efceaba738b3e3 ******/
		%feature("compactdefaultargs") UnsetMaterial;
		%feature("autodoc", "Return
-------
None

Description
-----------
Sets the material for the interactive object.
") UnsetMaterial;
		void UnsetMaterial();

		/****** AIS_ViewCube::UnsetTransparency ******/
		/****** md5 signature: 9018897577979ed9f7a251e3f4363da8 ******/
		%feature("compactdefaultargs") UnsetTransparency;
		%feature("autodoc", "Return
-------
None

Description
-----------
Reset transparency for the whole object.
") UnsetTransparency;
		void UnsetTransparency();

		/****** AIS_ViewCube::UpdateAnimation ******/
		/****** md5 signature: 1fba06a343ff3048d879c8d5c869c9e1 ******/
		%feature("compactdefaultargs") UpdateAnimation;
		%feature("autodoc", "
Parameters
----------
theToUpdate: bool

Return
-------
bool

Description
-----------
Perform one step of current camera transformation. theToUpdate[in] enable/disable update of view. 
Return: True if animation is not stopped.
") UpdateAnimation;
		virtual bool UpdateAnimation(const bool theToUpdate);

		/****** AIS_ViewCube::ViewAnimation ******/
		/****** md5 signature: 7a7517bd1c0e55fdc5279dc1aefd5047 ******/
		%feature("compactdefaultargs") ViewAnimation;
		%feature("autodoc", "Return
-------
opencascade::handle<AIS_AnimationCamera>

Description
-----------
Return view animation.
") ViewAnimation;
		const opencascade::handle<AIS_AnimationCamera> & ViewAnimation();

};


%make_alias(AIS_ViewCube)

%extend AIS_ViewCube {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************
* class AIS_XRTrackedDevice *
****************************/
class AIS_XRTrackedDevice : public AIS_InteractiveObject {
	public:
		/****** AIS_XRTrackedDevice::AIS_XRTrackedDevice ******/
		/****** md5 signature: 73db88b212ab4ea311f2c54259f77263 ******/
		%feature("compactdefaultargs") AIS_XRTrackedDevice;
		%feature("autodoc", "
Parameters
----------
theTris: Graphic3d_ArrayOfTriangles
theTexture: Image_Texture

Return
-------
None

Description
-----------
Main constructor.
") AIS_XRTrackedDevice;
		 AIS_XRTrackedDevice(const opencascade::handle<Graphic3d_ArrayOfTriangles> & theTris, const opencascade::handle<Image_Texture> & theTexture);

		/****** AIS_XRTrackedDevice::AIS_XRTrackedDevice ******/
		/****** md5 signature: 81dc9375bb8ceba5f8e13cdae8ed699d ******/
		%feature("compactdefaultargs") AIS_XRTrackedDevice;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") AIS_XRTrackedDevice;
		 AIS_XRTrackedDevice();

		/****** AIS_XRTrackedDevice::LaserColor ******/
		/****** md5 signature: 3764f0787105c7ac66e6b31a8f2890b8 ******/
		%feature("compactdefaultargs") LaserColor;
		%feature("autodoc", "Return
-------
Quantity_Color

Description
-----------
Return laser color.
") LaserColor;
		const Quantity_Color & LaserColor();

		/****** AIS_XRTrackedDevice::LaserLength ******/
		/****** md5 signature: 2412bea094fc8f15e2f0eb3202b330b1 ******/
		%feature("compactdefaultargs") LaserLength;
		%feature("autodoc", "Return
-------
float

Description
-----------
Return laser length.
") LaserLength;
		float LaserLength();

		/****** AIS_XRTrackedDevice::Role ******/
		/****** md5 signature: 9ca69fc1cf78226378dfe201ccd20d67 ******/
		%feature("compactdefaultargs") Role;
		%feature("autodoc", "Return
-------
Aspect_XRTrackedDeviceRole

Description
-----------
Return device role.
") Role;
		Aspect_XRTrackedDeviceRole Role();

		/****** AIS_XRTrackedDevice::SetLaserColor ******/
		/****** md5 signature: 6c097047fce7892b381ebd56a66e83cc ******/
		%feature("compactdefaultargs") SetLaserColor;
		%feature("autodoc", "
Parameters
----------
theColor: Quantity_Color

Return
-------
None

Description
-----------
Set laser color.
") SetLaserColor;
		void SetLaserColor(const Quantity_Color & theColor);

		/****** AIS_XRTrackedDevice::SetLaserLength ******/
		/****** md5 signature: 583af6911e58141069de519c2537266c ******/
		%feature("compactdefaultargs") SetLaserLength;
		%feature("autodoc", "
Parameters
----------
theLength: float

Return
-------
None

Description
-----------
Set laser length.
") SetLaserLength;
		void SetLaserLength(float theLength);

		/****** AIS_XRTrackedDevice::SetRole ******/
		/****** md5 signature: 327a00be1fb4288d5cf8731991db2478 ******/
		%feature("compactdefaultargs") SetRole;
		%feature("autodoc", "
Parameters
----------
theRole: Aspect_XRTrackedDeviceRole

Return
-------
None

Description
-----------
Set device role.
") SetRole;
		void SetRole(Aspect_XRTrackedDeviceRole theRole);

		/****** AIS_XRTrackedDevice::SetUnitFactor ******/
		/****** md5 signature: 182ca7b569c81289452bf6d8887fefca ******/
		%feature("compactdefaultargs") SetUnitFactor;
		%feature("autodoc", "
Parameters
----------
theFactor: float

Return
-------
None

Description
-----------
Set unit scale factor.
") SetUnitFactor;
		void SetUnitFactor(float theFactor);

		/****** AIS_XRTrackedDevice::UnitFactor ******/
		/****** md5 signature: efeb2d38ffbf81bea1c2fc7ae82b0a0d ******/
		%feature("compactdefaultargs") UnitFactor;
		%feature("autodoc", "Return
-------
float

Description
-----------
Return unit scale factor.
") UnitFactor;
		float UnitFactor();

};


%make_alias(AIS_XRTrackedDevice)

%extend AIS_XRTrackedDevice {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************************
* class AIS_AnimationAxisRotation *
**********************************/
class AIS_AnimationAxisRotation : public AIS_BaseAnimationObject {
	public:
		/****** AIS_AnimationAxisRotation::AIS_AnimationAxisRotation ******/
		/****** md5 signature: 03b21db6d0d5a0f62a858fa5831b420d ******/
		%feature("compactdefaultargs") AIS_AnimationAxisRotation;
		%feature("autodoc", "
Parameters
----------
theAnimationName: str
theContext: AIS_InteractiveContext
theObject: AIS_InteractiveObject
theAxis: gp_Ax1
theAngleStart: double
theAngleEnd: double

Return
-------
None

Description
-----------
Constructor with initialization. 
Input parameter: theAnimationName animation identifier 
Input parameter: theContext interactive context where object have been displayed 
Input parameter: theObject object to apply rotation 
Input parameter: theAxis rotation axis 
Input parameter: theAngleStart rotation angle at the start of animation 
Input parameter: theAngleEnd rotation angle at the end of animation.
") AIS_AnimationAxisRotation;
		 AIS_AnimationAxisRotation(TCollection_AsciiString theAnimationName, const opencascade::handle<AIS_InteractiveContext> & theContext, const opencascade::handle<AIS_InteractiveObject> & theObject, const gp_Ax1 & theAxis, const double theAngleStart, const double theAngleEnd);

};


%make_alias(AIS_AnimationAxisRotation)

%extend AIS_AnimationAxisRotation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************
* class AIS_AnimationObject *
****************************/
class AIS_AnimationObject : public AIS_BaseAnimationObject {
	public:
		/****** AIS_AnimationObject::AIS_AnimationObject ******/
		/****** md5 signature: c16e60828b420c37f86bd653dd4d9c04 ******/
		%feature("compactdefaultargs") AIS_AnimationObject;
		%feature("autodoc", "
Parameters
----------
theAnimationName: str
theContext: AIS_InteractiveContext
theObject: AIS_InteractiveObject
theTrsfStart: gp_Trsf
theTrsfEnd: gp_Trsf

Return
-------
None

Description
-----------
Constructor with initialization. Note that start/end transformations specify exactly local transformation of the object, not the transformation to be applied to existing local transformation. 
Input parameter: theAnimationName animation identifier 
Input parameter: theContext interactive context where object have been displayed 
Input parameter: theObject object to apply local transformation 
Input parameter: theTrsfStart local transformation at the start of animation (e.g. theObject->LocalTransformation()) 
Input parameter: theTrsfEnd local transformation at the end of animation.
") AIS_AnimationObject;
		 AIS_AnimationObject(TCollection_AsciiString theAnimationName, const opencascade::handle<AIS_InteractiveContext> & theContext, const opencascade::handle<AIS_InteractiveObject> & theObject, const gp_Trsf & theTrsfStart, const gp_Trsf & theTrsfEnd);

};


%make_alias(AIS_AnimationObject)

%extend AIS_AnimationObject {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************
* class AIS_ColoredShape *
*************************/
class AIS_ColoredShape : public AIS_Shape {
	public:
		/****** AIS_ColoredShape::AIS_ColoredShape ******/
		/****** md5 signature: fb3b55130e0ac29dc003b42df171867f ******/
		%feature("compactdefaultargs") AIS_ColoredShape;
		%feature("autodoc", "
Parameters
----------
theShape: TopoDS_Shape

Return
-------
None

Description
-----------
Default constructor.
") AIS_ColoredShape;
		 AIS_ColoredShape(const TopoDS_Shape & theShape);

		/****** AIS_ColoredShape::AIS_ColoredShape ******/
		/****** md5 signature: 57d5a885b365bbdae440a6669a47baaf ******/
		%feature("compactdefaultargs") AIS_ColoredShape;
		%feature("autodoc", "
Parameters
----------
theShape: AIS_Shape

Return
-------
None

Description
-----------
Copy constructor.
") AIS_ColoredShape;
		 AIS_ColoredShape(const opencascade::handle<AIS_Shape> & theShape);

		/****** AIS_ColoredShape::ChangeCustomAspectsMap ******/
		/****** md5 signature: 1b5e6581783f4f7e407867a361871e28 ******/
		%feature("compactdefaultargs") ChangeCustomAspectsMap;
		%feature("autodoc", "Return
-------
NCollection_DataMap<TopoDS_Shape, opencascade::handle<AIS_ColoredDrawer>, TopTools_ShapeMapHasher>

Description
-----------
Return the map of custom aspects.
") ChangeCustomAspectsMap;
		NCollection_DataMap<TopoDS_Shape, opencascade::handle<AIS_ColoredDrawer>, TopTools_ShapeMapHasher> ChangeCustomAspectsMap();

		/****** AIS_ColoredShape::ClearCustomAspects ******/
		/****** md5 signature: fc6f686010bc49df004ff6cccab2c0a6 ******/
		%feature("compactdefaultargs") ClearCustomAspects;
		%feature("autodoc", "Return
-------
None

Description
-----------
Reset the map of custom sub-shape aspects.
") ClearCustomAspects;
		virtual void ClearCustomAspects();

		/****** AIS_ColoredShape::CustomAspects ******/
		/****** md5 signature: 23e6d1633ab573a66905b41e46a87dae ******/
		%feature("compactdefaultargs") CustomAspects;
		%feature("autodoc", "
Parameters
----------
theShape: TopoDS_Shape

Return
-------
opencascade::handle<AIS_ColoredDrawer>

Description
-----------
Customize properties of specified sub-shape. The shape will be stored in the map but ignored, if it is not sub-shape of main Shape! This method can be used to mark sub-shapes with customizable properties.
") CustomAspects;
		virtual opencascade::handle<AIS_ColoredDrawer> CustomAspects(const TopoDS_Shape & theShape);

		/****** AIS_ColoredShape::CustomAspectsMap ******/
		/****** md5 signature: dd7fa0b49706ffc16a3748dccbfaa717 ******/
		%feature("compactdefaultargs") CustomAspectsMap;
		%feature("autodoc", "Return
-------
NCollection_DataMap<TopoDS_Shape, opencascade::handle<AIS_ColoredDrawer>, TopTools_ShapeMapHasher>

Description
-----------
Return the map of custom aspects.
") CustomAspectsMap;
		const NCollection_DataMap<TopoDS_Shape, opencascade::handle<AIS_ColoredDrawer>, TopTools_ShapeMapHasher> CustomAspectsMap();

		/****** AIS_ColoredShape::SetColor ******/
		/****** md5 signature: b174106500deaf4ecfa505bb8ae6784c ******/
		%feature("compactdefaultargs") SetColor;
		%feature("autodoc", "
Parameters
----------
theColor: Quantity_Color

Return
-------
None

Description
-----------
Setup color of entire shape.
") SetColor;
		void SetColor(const Quantity_Color & theColor);

		/****** AIS_ColoredShape::SetCustomColor ******/
		/****** md5 signature: 6e83a5131df277baf8e10888e6a04420 ******/
		%feature("compactdefaultargs") SetCustomColor;
		%feature("autodoc", "
Parameters
----------
theShape: TopoDS_Shape
theColor: Quantity_Color

Return
-------
None

Description
-----------
Customize color of specified sub-shape.
") SetCustomColor;
		void SetCustomColor(const TopoDS_Shape & theShape, const Quantity_Color & theColor);

		/****** AIS_ColoredShape::SetCustomTransparency ******/
		/****** md5 signature: 9e453eee3cdb3edb48b0a312814fb750 ******/
		%feature("compactdefaultargs") SetCustomTransparency;
		%feature("autodoc", "
Parameters
----------
theShape: TopoDS_Shape
theTransparency: double

Return
-------
None

Description
-----------
Customize transparency of specified sub-shape.
") SetCustomTransparency;
		void SetCustomTransparency(const TopoDS_Shape & theShape, double theTransparency);

		/****** AIS_ColoredShape::SetCustomWidth ******/
		/****** md5 signature: 077eb6b0ec9cae41316f5cdbcc337758 ******/
		%feature("compactdefaultargs") SetCustomWidth;
		%feature("autodoc", "
Parameters
----------
theShape: TopoDS_Shape
theLineWidth: double

Return
-------
None

Description
-----------
Customize line width of specified sub-shape.
") SetCustomWidth;
		void SetCustomWidth(const TopoDS_Shape & theShape, const double theLineWidth);

		/****** AIS_ColoredShape::SetMaterial ******/
		/****** md5 signature: f8b9ecd0a48429588203ef4ac881272a ******/
		%feature("compactdefaultargs") SetMaterial;
		%feature("autodoc", "
Parameters
----------
theAspect: Graphic3d_MaterialAspect

Return
-------
None

Description
-----------
Sets the material aspect.
") SetMaterial;
		void SetMaterial(const Graphic3d_MaterialAspect & theAspect);

		/****** AIS_ColoredShape::SetTransparency ******/
		/****** md5 signature: 9582fced1bcb1b8dbb6c76d8e3e022f6 ******/
		%feature("compactdefaultargs") SetTransparency;
		%feature("autodoc", "
Parameters
----------
theValue: double

Return
-------
None

Description
-----------
Sets transparency value.
") SetTransparency;
		void SetTransparency(const double theValue);

		/****** AIS_ColoredShape::SetWidth ******/
		/****** md5 signature: a6f123fe1755d0bb8f2e4332a3ef8810 ******/
		%feature("compactdefaultargs") SetWidth;
		%feature("autodoc", "
Parameters
----------
theLineWidth: double

Return
-------
None

Description
-----------
Setup line width of entire shape.
") SetWidth;
		void SetWidth(const double theLineWidth);

		/****** AIS_ColoredShape::UnsetCustomAspects ******/
		/****** md5 signature: d651b14fa81bee27160f8a913575abdd ******/
		%feature("compactdefaultargs") UnsetCustomAspects;
		%feature("autodoc", "
Parameters
----------
theShape: TopoDS_Shape
theToUnregister: bool (optional, default to false)

Return
-------
None

Description
-----------
Reset custom properties of specified sub-shape. 
Parameter theToUnregister unregister or not sub-shape from the map.
") UnsetCustomAspects;
		void UnsetCustomAspects(const TopoDS_Shape & theShape, const bool theToUnregister = false);

		/****** AIS_ColoredShape::UnsetTransparency ******/
		/****** md5 signature: b0bbb5c0e2872867b944fb3488b9badd ******/
		%feature("compactdefaultargs") UnsetTransparency;
		%feature("autodoc", "Return
-------
None

Description
-----------
Removes the setting for transparency in the reconstructed compound shape.
") UnsetTransparency;
		void UnsetTransparency();

		/****** AIS_ColoredShape::UnsetWidth ******/
		/****** md5 signature: 806020285b21e0f143ac65d1e797f644 ******/
		%feature("compactdefaultargs") UnsetWidth;
		%feature("autodoc", "Return
-------
None

Description
-----------
Setup line width of entire shape.
") UnsetWidth;
		void UnsetWidth();

};


%make_alias(AIS_ColoredShape)

%extend AIS_ColoredShape {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************
* class AIS_TexturedShape *
**************************/
class AIS_TexturedShape : public AIS_Shape {
	public:
		/****** AIS_TexturedShape::AIS_TexturedShape ******/
		/****** md5 signature: 7b5e3f67785ea4fff1a50e2a26f126ec ******/
		%feature("compactdefaultargs") AIS_TexturedShape;
		%feature("autodoc", "
Parameters
----------
theShape: TopoDS_Shape

Return
-------
None

Description
-----------
Initializes the textured shape.
") AIS_TexturedShape;
		 AIS_TexturedShape(const TopoDS_Shape & theShape);

		/****** AIS_TexturedShape::AcceptDisplayMode ******/
		/****** md5 signature: 87fb12421b337c0d3c009064a10e954f ******/
		%feature("compactdefaultargs") AcceptDisplayMode;
		%feature("autodoc", "
Parameters
----------
theMode: int

Return
-------
bool

Description
-----------
Return true if specified display mode is supported (extends AIS_Shape with Display Mode 3).
") AcceptDisplayMode;
		bool AcceptDisplayMode(const int theMode);

		/****** AIS_TexturedShape::DisableTextureModulate ******/
		/****** md5 signature: 97c815d24c97b655242a724b8bf1b6c6 ******/
		%feature("compactdefaultargs") DisableTextureModulate;
		%feature("autodoc", "Return
-------
None

Description
-----------
Disables texture modulation.
") DisableTextureModulate;
		void DisableTextureModulate();

		/****** AIS_TexturedShape::EnableTextureModulate ******/
		/****** md5 signature: 6079501117720843b340d16a5a6761c6 ******/
		%feature("compactdefaultargs") EnableTextureModulate;
		%feature("autodoc", "Return
-------
None

Description
-----------
Enables texture modulation.
") EnableTextureModulate;
		void EnableTextureModulate();

		/****** AIS_TexturedShape::SetColor ******/
		/****** md5 signature: b174106500deaf4ecfa505bb8ae6784c ******/
		%feature("compactdefaultargs") SetColor;
		%feature("autodoc", "
Parameters
----------
theColor: Quantity_Color

Return
-------
None

Description
-----------
Sets the color.
") SetColor;
		void SetColor(const Quantity_Color & theColor);

		/****** AIS_TexturedShape::SetMaterial ******/
		/****** md5 signature: f8b9ecd0a48429588203ef4ac881272a ******/
		%feature("compactdefaultargs") SetMaterial;
		%feature("autodoc", "
Parameters
----------
theAspect: Graphic3d_MaterialAspect

Return
-------
None

Description
-----------
Sets the material aspect.
") SetMaterial;
		void SetMaterial(const Graphic3d_MaterialAspect & theAspect);

		/****** AIS_TexturedShape::SetTextureFileName ******/
		/****** md5 signature: 15c6241ea9acf77eec1dd78180a11112 ******/
		%feature("compactdefaultargs") SetTextureFileName;
		%feature("autodoc", "
Parameters
----------
theTextureFileName: str

Return
-------
None

Description
-----------
Sets the texture source. <theTextureFileName> can specify path to texture image or one of the standard predefined textures. The accepted file types are those used in Image_AlienPixMap with extensions such as rgb, png, jpg and more. To specify the standard predefined texture, the <theTextureFileName> should contain integer - the Graphic3d_NameOfTexture2D enumeration index. Setting texture source using this method resets the source pixmap (if was set previously).
") SetTextureFileName;
		virtual void SetTextureFileName(TCollection_AsciiString theTextureFileName);

		/****** AIS_TexturedShape::SetTextureMapOff ******/
		/****** md5 signature: 63364859b184736648b21d705a82db43 ******/
		%feature("compactdefaultargs") SetTextureMapOff;
		%feature("autodoc", "Return
-------
None

Description
-----------
Disables texture mapping.
") SetTextureMapOff;
		void SetTextureMapOff();

		/****** AIS_TexturedShape::SetTextureMapOn ******/
		/****** md5 signature: 61746e3f31a504b75cfbd53d8aff65e6 ******/
		%feature("compactdefaultargs") SetTextureMapOn;
		%feature("autodoc", "Return
-------
None

Description
-----------
Enables texture mapping.
") SetTextureMapOn;
		void SetTextureMapOn();

		/****** AIS_TexturedShape::SetTextureOrigin ******/
		/****** md5 signature: 6ba8e472a55b27952b8eb2474cb2f955 ******/
		%feature("compactdefaultargs") SetTextureOrigin;
		%feature("autodoc", "
Parameters
----------
theToSetTextureOrigin: bool
theUOrigin: double (optional, default to 0.0)
theVOrigin: double (optional, default to 0.0)

Return
-------
None

Description
-----------
Use this method to change the origin of the texture. The texel (0,0) will be mapped to the surface (UOrigin,VOrigin).
") SetTextureOrigin;
		void SetTextureOrigin(const bool theToSetTextureOrigin, const double theUOrigin = 0.0, const double theVOrigin = 0.0);

		/****** AIS_TexturedShape::SetTexturePixMap ******/
		/****** md5 signature: 94f1328e4794c7fc34b1026e594da246 ******/
		%feature("compactdefaultargs") SetTexturePixMap;
		%feature("autodoc", "
Parameters
----------
theTexturePixMap: Image_PixMap

Return
-------
None

Description
-----------
Sets the texture source. <theTexturePixMap> specifies image data. Please note that the data should be in Bottom-Up order, the flag of Image_PixMap::IsTopDown() will be ignored by graphic driver. Setting texture source using this method resets the source by filename (if was set previously).
") SetTexturePixMap;
		virtual void SetTexturePixMap(const opencascade::handle<Image_PixMap> & theTexturePixMap);

		/****** AIS_TexturedShape::SetTextureRepeat ******/
		/****** md5 signature: c1e52c247f0798a8d89c412b148d449c ******/
		%feature("compactdefaultargs") SetTextureRepeat;
		%feature("autodoc", "
Parameters
----------
theToRepeat: bool
theURepeat: double (optional, default to 1.0)
theVRepeat: double (optional, default to 1.0)

Return
-------
None

Description
-----------
Sets the number of occurrences of the texture on each face. The texture itself is parameterized in (0,1) by (0,1). Each face of the shape to be textured is parameterized in UV space (Umin,Umax) by (Vmin,Vmax). If RepeatYN is set to false, texture coordinates are clamped in the range (0,1)x(0,1) of the face.
") SetTextureRepeat;
		void SetTextureRepeat(const bool theToRepeat, const double theURepeat = 1.0, const double theVRepeat = 1.0);

		/****** AIS_TexturedShape::SetTextureScale ******/
		/****** md5 signature: 395f28801e66ef324d0dcf1c4c830463 ******/
		%feature("compactdefaultargs") SetTextureScale;
		%feature("autodoc", "
Parameters
----------
theToSetTextureScale: bool
theScaleU: double (optional, default to 1.0)
theScaleV: double (optional, default to 1.0)

Return
-------
None

Description
-----------
Use this method to scale the texture (percent of the face). You can specify a scale factor for both U and V. Example: if you set ScaleU and ScaleV to 0.5 and you enable texture repeat, the texture will appear twice on the face in each direction.
") SetTextureScale;
		void SetTextureScale(const bool theToSetTextureScale, const double theScaleU = 1.0, const double theScaleV = 1.0);

		/****** AIS_TexturedShape::TextureFile ******/
		/****** md5 signature: 909f8ac694dee0c162b07cf6eda86031 ******/
		%feature("compactdefaultargs") TextureFile;
		%feature("autodoc", "Return
-------
char *

Description
-----------
Return: path to the texture file.
") TextureFile;
		const char * TextureFile();

		/****** AIS_TexturedShape::TextureMapState ******/
		/****** md5 signature: c311bbaba192ed972f153a49cf92dd65 ******/
		%feature("compactdefaultargs") TextureMapState;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Return: flag to control texture mapping (for presentation mode 3).
") TextureMapState;
		bool TextureMapState();

		/****** AIS_TexturedShape::TextureModulate ******/
		/****** md5 signature: bb9e443d147d59db583dfee4f4a3eb89 ******/
		%feature("compactdefaultargs") TextureModulate;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Return: true if texture color modulation is turned on.
") TextureModulate;
		bool TextureModulate();

		/****** AIS_TexturedShape::TextureOrigin ******/
		/****** md5 signature: 1c5ce6d7116120fc1a18f1f219d6fdfd ******/
		%feature("compactdefaultargs") TextureOrigin;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Return: true if texture UV origin has been modified.
") TextureOrigin;
		bool TextureOrigin();

		/****** AIS_TexturedShape::TexturePixMap ******/
		/****** md5 signature: f87f144c3a04ccf005ab0fc99e7fbfed ******/
		%feature("compactdefaultargs") TexturePixMap;
		%feature("autodoc", "Return
-------
opencascade::handle<Image_PixMap>

Description
-----------
Return: the source pixmap for texture map.
") TexturePixMap;
		const opencascade::handle<Image_PixMap> & TexturePixMap();

		/****** AIS_TexturedShape::TextureRepeat ******/
		/****** md5 signature: 7e3f4054d7a131592bf66e533f8b973b ******/
		%feature("compactdefaultargs") TextureRepeat;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Return: texture repeat flag.
") TextureRepeat;
		bool TextureRepeat();

		/****** AIS_TexturedShape::TextureScale ******/
		/****** md5 signature: f38b9a77ba7536c7bf118c267ae6b351 ******/
		%feature("compactdefaultargs") TextureScale;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Return: true if scale factor should be applied to texture mapping.
") TextureScale;
		bool TextureScale();

		/****** AIS_TexturedShape::TextureScaleU ******/
		/****** md5 signature: df90d86ed7d2534b69adf3c1f18d7427 ******/
		%feature("compactdefaultargs") TextureScaleU;
		%feature("autodoc", "Return
-------
double

Description
-----------
Return: scale factor for U coordinate (1.0 by default).
") TextureScaleU;
		double TextureScaleU();

		/****** AIS_TexturedShape::TextureScaleV ******/
		/****** md5 signature: ebaa9e27a721677174c5e1de6c17d7fc ******/
		%feature("compactdefaultargs") TextureScaleV;
		%feature("autodoc", "Return
-------
double

Description
-----------
Return: scale factor for V coordinate (1.0 by default).
") TextureScaleV;
		double TextureScaleV();

		/****** AIS_TexturedShape::TextureUOrigin ******/
		/****** md5 signature: c0bb42018aeabebcb1e6792d6f9e47bb ******/
		%feature("compactdefaultargs") TextureUOrigin;
		%feature("autodoc", "Return
-------
double

Description
-----------
Return: texture origin U position (0.0 by default).
") TextureUOrigin;
		double TextureUOrigin();

		/****** AIS_TexturedShape::TextureVOrigin ******/
		/****** md5 signature: b4b0ebd15850f27272e50fa68afa0e33 ******/
		%feature("compactdefaultargs") TextureVOrigin;
		%feature("autodoc", "Return
-------
double

Description
-----------
Return: texture origin V position (0.0 by default).
") TextureVOrigin;
		double TextureVOrigin();

		/****** AIS_TexturedShape::URepeat ******/
		/****** md5 signature: e5d2bab825291a8dc0e3810ba48ac9b3 ******/
		%feature("compactdefaultargs") URepeat;
		%feature("autodoc", "Return
-------
double

Description
-----------
Return: texture repeat U value.
") URepeat;
		double URepeat();

		/****** AIS_TexturedShape::UnsetColor ******/
		/****** md5 signature: 11f9cda4f631b34a4be33c2bf7cf48b1 ******/
		%feature("compactdefaultargs") UnsetColor;
		%feature("autodoc", "Return
-------
None

Description
-----------
Removes settings for the color.
") UnsetColor;
		void UnsetColor();

		/****** AIS_TexturedShape::UnsetMaterial ******/
		/****** md5 signature: 37a176a466a7b4bfec282c7d87b3982c ******/
		%feature("compactdefaultargs") UnsetMaterial;
		%feature("autodoc", "Return
-------
None

Description
-----------
Removes settings for material aspect.
") UnsetMaterial;
		void UnsetMaterial();

		/****** AIS_TexturedShape::UpdateAttributes ******/
		/****** md5 signature: 334c979de66ee04703d34c5c9478d7f3 ******/
		%feature("compactdefaultargs") UpdateAttributes;
		%feature("autodoc", "Return
-------
None

Description
-----------
Use this method to display the textured shape without recomputing the whole presentation. Use this method when ONLY the texture content has been changed. If other parameters (ie: scale factors, texture origin, texture repeat...) have changed, the whole presentation has to be recomputed: @code if (myShape->DisplayMode() == 3) { myAISContext->RecomputePrsOnly (myShape); } else { myAISContext->SetDisplayMode (myShape, 3, false); myAISContext->Display (myShape, true); } @endcode.
") UpdateAttributes;
		void UpdateAttributes();

		/****** AIS_TexturedShape::VRepeat ******/
		/****** md5 signature: 4c0fa51bb30c2c0daee93b4421c5d710 ******/
		%feature("compactdefaultargs") VRepeat;
		%feature("autodoc", "Return
-------
double

Description
-----------
Return: texture repeat V value.
") VRepeat;
		double VRepeat();

};


%make_alias(AIS_TexturedShape)

%extend AIS_TexturedShape {
	%pythoncode {
	__repr__ = _dumps_object

	@methodnotwrapped
	def ShowTriangles(self):
		pass
	}
};

/* harray1 classes */
/* harray2 classes */
/* hsequence classes */
/* class aliases */
%pythoncode {
AIS_AnimationTimer=OCC.Core.Media.Media_Timer
AIS_DisplayStatus=OCC.Core.PrsMgr.PrsMgr_DisplayStatus
}
/* deprecated methods */
%pythoncode {
@deprecated
def AIS_GraphicTool_GetInteriorColor(*args):
	return AIS_GraphicTool.GetInteriorColor(*args)

@deprecated
def AIS_GraphicTool_GetInteriorColor(*args):
	return AIS_GraphicTool.GetInteriorColor(*args)

@deprecated
def AIS_GraphicTool_GetLineAtt(*args):
	return AIS_GraphicTool.GetLineAtt(*args)

@deprecated
def AIS_GraphicTool_GetLineColor(*args):
	return AIS_GraphicTool.GetLineColor(*args)

@deprecated
def AIS_GraphicTool_GetLineColor(*args):
	return AIS_GraphicTool.GetLineColor(*args)

@deprecated
def AIS_GraphicTool_GetLineType(*args):
	return AIS_GraphicTool.GetLineType(*args)

@deprecated
def AIS_GraphicTool_GetLineWidth(*args):
	return AIS_GraphicTool.GetLineWidth(*args)

@deprecated
def AIS_GraphicTool_GetMaterial(*args):
	return AIS_GraphicTool.GetMaterial(*args)

@deprecated
def AIS_ColorScale_FindColor(*args):
	return AIS_ColorScale.FindColor(*args)

@deprecated
def AIS_ColorScale_FindColor(*args):
	return AIS_ColorScale.FindColor(*args)

@deprecated
def AIS_ColorScale_MakeUniformColors(*args):
	return AIS_ColorScale.MakeUniformColors(*args)

@deprecated
def AIS_ColorScale_hueToValidRange(*args):
	return AIS_ColorScale.hueToValidRange(*args)

@deprecated
def AIS_Shape_SelectionMode(*args):
	return AIS_Shape.SelectionMode(*args)

@deprecated
def AIS_Shape_SelectionType(*args):
	return AIS_Shape.SelectionType(*args)

@deprecated
def AIS_Shape_computeHlrPresentation(*args):
	return AIS_Shape.computeHlrPresentation(*args)

@deprecated
def AIS_ViewCube_IsBoxCorner(*args):
	return AIS_ViewCube.IsBoxCorner(*args)

@deprecated
def AIS_ViewCube_IsBoxEdge(*args):
	return AIS_ViewCube.IsBoxEdge(*args)

@deprecated
def AIS_ViewCube_IsBoxSide(*args):
	return AIS_ViewCube.IsBoxSide(*args)

}
