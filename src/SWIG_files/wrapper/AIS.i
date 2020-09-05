/*
Copyright 2008-2020 Thomas Paviot (tpaviot@gmail.com)

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
https://www.opencascade.com/doc/occt-7.4.0/refman/html/package_ais.html"
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
%include ../common/Operators.i
%include ../common/OccHandle.i


%{
#include<AIS_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<SelectMgr_module.hxx>
#include<Media_module.hxx>
#include<Geom_module.hxx>
#include<gp_module.hxx>
#include<TopoDS_module.hxx>
#include<Prs3d_module.hxx>
#include<Quantity_module.hxx>
#include<Aspect_module.hxx>
#include<Bnd_module.hxx>
#include<TCollection_module.hxx>
#include<TopAbs_module.hxx>
#include<PrsMgr_module.hxx>
#include<TColStd_module.hxx>
#include<Graphic3d_module.hxx>
#include<V3d_module.hxx>
#include<TopLoc_module.hxx>
#include<StdSelect_module.hxx>
#include<TColgp_module.hxx>
#include<Select3D_module.hxx>
#include<DsgPrs_module.hxx>
#include<Poly_module.hxx>
#include<Image_module.hxx>
#include<TopTools_module.hxx>
#include<Message_module.hxx>
#include<TShort_module.hxx>
#include<SelectBasics_module.hxx>
#include<HLRAlgo_module.hxx>
#include<TColQuantity_module.hxx>
#include<SelectMgr_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import SelectMgr.i
%import Media.i
%import Geom.i
%import gp.i
%import TopoDS.i
%import Prs3d.i
%import Quantity.i
%import Aspect.i
%import Bnd.i
%import TCollection.i
%import TopAbs.i
%import PrsMgr.i
%import TColStd.i
%import Graphic3d.i
%import V3d.i
%import TopLoc.i
%import StdSelect.i
%import TColgp.i
%import Select3D.i
%import DsgPrs.i
%import Poly.i
%import Image.i

%pythoncode {
from enum import IntEnum
from OCC.Core.Exception import *
};

/* public enums */
enum AIS_TrihedronSelectionMode {
	AIS_TrihedronSelectionMode_EntireObject = 0,
	AIS_TrihedronSelectionMode_Origin = 1,
	AIS_TrihedronSelectionMode_Axes = 2,
	AIS_TrihedronSelectionMode_MainPlanes = 3,
};

enum AIS_MouseGesture {
	AIS_MouseGesture_NONE = 0,
	AIS_MouseGesture_SelectRectangle = 1,
	AIS_MouseGesture_SelectLasso = 2,
	AIS_MouseGesture_Zoom = 3,
	AIS_MouseGesture_Pan = 4,
	AIS_MouseGesture_RotateOrbit = 5,
	AIS_MouseGesture_RotateView = 6,
};

enum AIS_ClearMode {
	AIS_CM_All = 0,
	AIS_CM_Interactive = 1,
	AIS_CM_Filters = 2,
	AIS_CM_StandardModes = 3,
	AIS_CM_TemporaryShapePrs = 4,
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

enum AIS_TypeOfAngleArrowVisibility {
	AIS_TOAV_Both = 0,
	AIS_TOAV_First = 1,
	AIS_TOAV_Second = 2,
	AIS_TOAV_None = 3,
};

enum AIS_DimensionSelectionMode {
	AIS_DSM_All = 0,
	AIS_DSM_Line = 1,
	AIS_DSM_Text = 2,
};

enum AIS_KindOfInteractive {
	AIS_KOI_None = 0,
	AIS_KOI_Datum = 1,
	AIS_KOI_Shape = 2,
	AIS_KOI_Object = 3,
	AIS_KOI_Relation = 4,
	AIS_KOI_Dimension = 5,
};

enum AIS_KindOfDimension {
	AIS_KOD_NONE = 0,
	AIS_KOD_LENGTH = 1,
	AIS_KOD_PLANEANGLE = 2,
	AIS_KOD_SOLIDANGLE = 3,
	AIS_KOD_AREA = 4,
	AIS_KOD_VOLUME = 5,
	AIS_KOD_MASS = 6,
	AIS_KOD_TIME = 7,
	AIS_KOD_RADIUS = 8,
	AIS_KOD_DIAMETER = 9,
	AIS_KOD_CHAMF2D = 10,
	AIS_KOD_CHAMF3D = 11,
	AIS_KOD_OFFSET = 12,
	AIS_KOD_ELLIPSERADIUS = 13,
};

enum AIS_SelectStatus {
	AIS_SS_Added = 0,
	AIS_SS_Removed = 1,
	AIS_SS_NotDone = 2,
};

enum AIS_TypeOfAxis {
	AIS_TOAX_Unknown = 0,
	AIS_TOAX_XAxis = 1,
	AIS_TOAX_YAxis = 2,
	AIS_TOAX_ZAxis = 3,
};

enum AIS_KindOfUnit {
	AIS_TOU_LENGTH = 0,
	AIS_TOU_SURFACE = 1,
	AIS_TOU_VOLUME = 2,
	AIS_TOU_PLANE_ANGLE = 3,
	AIS_TOU_SOLID_ANGLE = 4,
	AIS_TOU_MASS = 5,
	AIS_TOU_FORCE = 6,
	AIS_TOU_TIME = 7,
};

enum AIS_TypeOfAngle {
	AIS_TOA_Interior = 0,
	AIS_TOA_Exterior = 1,
};

enum AIS_ConnectStatus {
	AIS_CS_None = 0,
	AIS_CS_Connection = 1,
	AIS_CS_Transform = 2,
	AIS_CS_Both = 3,
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

enum AIS_ViewSelectionTool {
	AIS_ViewSelectionTool_Picking = 0,
	AIS_ViewSelectionTool_RubberBand = 1,
	AIS_ViewSelectionTool_Polygon = 2,
};

enum AIS_ViewInputBufferType {
	AIS_ViewInputBufferType_UI = 0,
	AIS_ViewInputBufferType_GL = 1,
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

enum AIS_TypeOfIso {
	AIS_TOI_IsoU = 0,
	AIS_TOI_IsoV = 1,
	AIS_TOI_Both = 2,
};

enum AIS_KindOfRelation {
	AIS_KOR_NONE = 0,
	AIS_KOR_CONCENTRIC = 1,
	AIS_KOR_EQUALDISTANCE = 2,
	AIS_KOR_EQUALRADIUS = 3,
	AIS_KOR_FIX = 4,
	AIS_KOR_IDENTIC = 5,
	AIS_KOR_OFFSET = 6,
	AIS_KOR_PARALLEL = 7,
	AIS_KOR_PERPENDICULAR = 8,
	AIS_KOR_TANGENT = 9,
	AIS_KOR_SYMMETRIC = 10,
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

enum AIS_ManipulatorMode {
	AIS_MM_None = 0,
	AIS_MM_Translation = 1,
	AIS_MM_Rotation = 2,
	AIS_MM_Scaling = 3,
	AIS_MM_TranslationPlane = 4,
};

enum AIS_SelectionModesConcurrency {
	AIS_SelectionModesConcurrency_Single = 0,
	AIS_SelectionModesConcurrency_GlobalOrLocal = 1,
	AIS_SelectionModesConcurrency_Multiple = 2,
};

enum AIS_KindOfSurface {
	AIS_KOS_Plane = 0,
	AIS_KOS_Cylinder = 1,
	AIS_KOS_Cone = 2,
	AIS_KOS_Sphere = 3,
	AIS_KOS_Torus = 4,
	AIS_KOS_Revolution = 5,
	AIS_KOS_Extrusion = 6,
	AIS_KOS_OtherSurface = 7,
};

enum AIS_StandardDatum {
	AIS_SD_None = 0,
	AIS_SD_Point = 1,
	AIS_SD_Axis = 2,
	AIS_SD_Trihedron = 3,
	AIS_SD_PlaneTrihedron = 4,
	AIS_SD_Line = 5,
	AIS_SD_Circle = 6,
	AIS_SD_Plane = 7,
};

enum AIS_DisplayMode {
	AIS_WireFrame = 0,
	AIS_Shaded = 1,
};

enum AIS_StatusOfPick {
	AIS_SOP_Error = 0,
	AIS_SOP_NothingSelected = 1,
	AIS_SOP_Removed = 2,
	AIS_SOP_OneSelected = 3,
	AIS_SOP_SeveralSelected = 4,
};

enum AIS_DragAction {
	AIS_DragAction_Start = 0,
	AIS_DragAction_Update = 1,
	AIS_DragAction_Stop = 2,
	AIS_DragAction_Abort = 3,
};

enum AIS_DisplaySpecialSymbol {
	AIS_DSS_No = 0,
	AIS_DSS_Before = 1,
	AIS_DSS_After = 2,
};

enum AIS_TypeOfDist {
	AIS_TOD_Unknown = 0,
	AIS_TOD_Horizontal = 1,
	AIS_TOD_Vertical = 2,
};

enum AIS_TypeOfPlane {
	AIS_TOPL_Unknown = 0,
	AIS_TOPL_XYPlane = 1,
	AIS_TOPL_XZPlane = 2,
	AIS_TOPL_YZPlane = 3,
};

enum AIS_DisplayStatus {
	AIS_DS_Displayed = 0,
	AIS_DS_Erased = 1,
	AIS_DS_None = 2,
};

/* end public enums declaration */

/* python proy classes for enums */
%pythoncode {

class AIS_TrihedronSelectionMode(IntEnum):
	AIS_TrihedronSelectionMode_EntireObject = 0
	AIS_TrihedronSelectionMode_Origin = 1
	AIS_TrihedronSelectionMode_Axes = 2
	AIS_TrihedronSelectionMode_MainPlanes = 3
AIS_TrihedronSelectionMode_EntireObject = AIS_TrihedronSelectionMode.AIS_TrihedronSelectionMode_EntireObject
AIS_TrihedronSelectionMode_Origin = AIS_TrihedronSelectionMode.AIS_TrihedronSelectionMode_Origin
AIS_TrihedronSelectionMode_Axes = AIS_TrihedronSelectionMode.AIS_TrihedronSelectionMode_Axes
AIS_TrihedronSelectionMode_MainPlanes = AIS_TrihedronSelectionMode.AIS_TrihedronSelectionMode_MainPlanes

class AIS_MouseGesture(IntEnum):
	AIS_MouseGesture_NONE = 0
	AIS_MouseGesture_SelectRectangle = 1
	AIS_MouseGesture_SelectLasso = 2
	AIS_MouseGesture_Zoom = 3
	AIS_MouseGesture_Pan = 4
	AIS_MouseGesture_RotateOrbit = 5
	AIS_MouseGesture_RotateView = 6
AIS_MouseGesture_NONE = AIS_MouseGesture.AIS_MouseGesture_NONE
AIS_MouseGesture_SelectRectangle = AIS_MouseGesture.AIS_MouseGesture_SelectRectangle
AIS_MouseGesture_SelectLasso = AIS_MouseGesture.AIS_MouseGesture_SelectLasso
AIS_MouseGesture_Zoom = AIS_MouseGesture.AIS_MouseGesture_Zoom
AIS_MouseGesture_Pan = AIS_MouseGesture.AIS_MouseGesture_Pan
AIS_MouseGesture_RotateOrbit = AIS_MouseGesture.AIS_MouseGesture_RotateOrbit
AIS_MouseGesture_RotateView = AIS_MouseGesture.AIS_MouseGesture_RotateView

class AIS_ClearMode(IntEnum):
	AIS_CM_All = 0
	AIS_CM_Interactive = 1
	AIS_CM_Filters = 2
	AIS_CM_StandardModes = 3
	AIS_CM_TemporaryShapePrs = 4
AIS_CM_All = AIS_ClearMode.AIS_CM_All
AIS_CM_Interactive = AIS_ClearMode.AIS_CM_Interactive
AIS_CM_Filters = AIS_ClearMode.AIS_CM_Filters
AIS_CM_StandardModes = AIS_ClearMode.AIS_CM_StandardModes
AIS_CM_TemporaryShapePrs = AIS_ClearMode.AIS_CM_TemporaryShapePrs

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

class AIS_TypeOfAngleArrowVisibility(IntEnum):
	AIS_TOAV_Both = 0
	AIS_TOAV_First = 1
	AIS_TOAV_Second = 2
	AIS_TOAV_None = 3
AIS_TOAV_Both = AIS_TypeOfAngleArrowVisibility.AIS_TOAV_Both
AIS_TOAV_First = AIS_TypeOfAngleArrowVisibility.AIS_TOAV_First
AIS_TOAV_Second = AIS_TypeOfAngleArrowVisibility.AIS_TOAV_Second
AIS_TOAV_None = AIS_TypeOfAngleArrowVisibility.AIS_TOAV_None

class AIS_DimensionSelectionMode(IntEnum):
	AIS_DSM_All = 0
	AIS_DSM_Line = 1
	AIS_DSM_Text = 2
AIS_DSM_All = AIS_DimensionSelectionMode.AIS_DSM_All
AIS_DSM_Line = AIS_DimensionSelectionMode.AIS_DSM_Line
AIS_DSM_Text = AIS_DimensionSelectionMode.AIS_DSM_Text

class AIS_KindOfInteractive(IntEnum):
	AIS_KOI_None = 0
	AIS_KOI_Datum = 1
	AIS_KOI_Shape = 2
	AIS_KOI_Object = 3
	AIS_KOI_Relation = 4
	AIS_KOI_Dimension = 5
AIS_KOI_None = AIS_KindOfInteractive.AIS_KOI_None
AIS_KOI_Datum = AIS_KindOfInteractive.AIS_KOI_Datum
AIS_KOI_Shape = AIS_KindOfInteractive.AIS_KOI_Shape
AIS_KOI_Object = AIS_KindOfInteractive.AIS_KOI_Object
AIS_KOI_Relation = AIS_KindOfInteractive.AIS_KOI_Relation
AIS_KOI_Dimension = AIS_KindOfInteractive.AIS_KOI_Dimension

class AIS_KindOfDimension(IntEnum):
	AIS_KOD_NONE = 0
	AIS_KOD_LENGTH = 1
	AIS_KOD_PLANEANGLE = 2
	AIS_KOD_SOLIDANGLE = 3
	AIS_KOD_AREA = 4
	AIS_KOD_VOLUME = 5
	AIS_KOD_MASS = 6
	AIS_KOD_TIME = 7
	AIS_KOD_RADIUS = 8
	AIS_KOD_DIAMETER = 9
	AIS_KOD_CHAMF2D = 10
	AIS_KOD_CHAMF3D = 11
	AIS_KOD_OFFSET = 12
	AIS_KOD_ELLIPSERADIUS = 13
AIS_KOD_NONE = AIS_KindOfDimension.AIS_KOD_NONE
AIS_KOD_LENGTH = AIS_KindOfDimension.AIS_KOD_LENGTH
AIS_KOD_PLANEANGLE = AIS_KindOfDimension.AIS_KOD_PLANEANGLE
AIS_KOD_SOLIDANGLE = AIS_KindOfDimension.AIS_KOD_SOLIDANGLE
AIS_KOD_AREA = AIS_KindOfDimension.AIS_KOD_AREA
AIS_KOD_VOLUME = AIS_KindOfDimension.AIS_KOD_VOLUME
AIS_KOD_MASS = AIS_KindOfDimension.AIS_KOD_MASS
AIS_KOD_TIME = AIS_KindOfDimension.AIS_KOD_TIME
AIS_KOD_RADIUS = AIS_KindOfDimension.AIS_KOD_RADIUS
AIS_KOD_DIAMETER = AIS_KindOfDimension.AIS_KOD_DIAMETER
AIS_KOD_CHAMF2D = AIS_KindOfDimension.AIS_KOD_CHAMF2D
AIS_KOD_CHAMF3D = AIS_KindOfDimension.AIS_KOD_CHAMF3D
AIS_KOD_OFFSET = AIS_KindOfDimension.AIS_KOD_OFFSET
AIS_KOD_ELLIPSERADIUS = AIS_KindOfDimension.AIS_KOD_ELLIPSERADIUS

class AIS_SelectStatus(IntEnum):
	AIS_SS_Added = 0
	AIS_SS_Removed = 1
	AIS_SS_NotDone = 2
AIS_SS_Added = AIS_SelectStatus.AIS_SS_Added
AIS_SS_Removed = AIS_SelectStatus.AIS_SS_Removed
AIS_SS_NotDone = AIS_SelectStatus.AIS_SS_NotDone

class AIS_TypeOfAxis(IntEnum):
	AIS_TOAX_Unknown = 0
	AIS_TOAX_XAxis = 1
	AIS_TOAX_YAxis = 2
	AIS_TOAX_ZAxis = 3
AIS_TOAX_Unknown = AIS_TypeOfAxis.AIS_TOAX_Unknown
AIS_TOAX_XAxis = AIS_TypeOfAxis.AIS_TOAX_XAxis
AIS_TOAX_YAxis = AIS_TypeOfAxis.AIS_TOAX_YAxis
AIS_TOAX_ZAxis = AIS_TypeOfAxis.AIS_TOAX_ZAxis

class AIS_KindOfUnit(IntEnum):
	AIS_TOU_LENGTH = 0
	AIS_TOU_SURFACE = 1
	AIS_TOU_VOLUME = 2
	AIS_TOU_PLANE_ANGLE = 3
	AIS_TOU_SOLID_ANGLE = 4
	AIS_TOU_MASS = 5
	AIS_TOU_FORCE = 6
	AIS_TOU_TIME = 7
AIS_TOU_LENGTH = AIS_KindOfUnit.AIS_TOU_LENGTH
AIS_TOU_SURFACE = AIS_KindOfUnit.AIS_TOU_SURFACE
AIS_TOU_VOLUME = AIS_KindOfUnit.AIS_TOU_VOLUME
AIS_TOU_PLANE_ANGLE = AIS_KindOfUnit.AIS_TOU_PLANE_ANGLE
AIS_TOU_SOLID_ANGLE = AIS_KindOfUnit.AIS_TOU_SOLID_ANGLE
AIS_TOU_MASS = AIS_KindOfUnit.AIS_TOU_MASS
AIS_TOU_FORCE = AIS_KindOfUnit.AIS_TOU_FORCE
AIS_TOU_TIME = AIS_KindOfUnit.AIS_TOU_TIME

class AIS_TypeOfAngle(IntEnum):
	AIS_TOA_Interior = 0
	AIS_TOA_Exterior = 1
AIS_TOA_Interior = AIS_TypeOfAngle.AIS_TOA_Interior
AIS_TOA_Exterior = AIS_TypeOfAngle.AIS_TOA_Exterior

class AIS_ConnectStatus(IntEnum):
	AIS_CS_None = 0
	AIS_CS_Connection = 1
	AIS_CS_Transform = 2
	AIS_CS_Both = 3
AIS_CS_None = AIS_ConnectStatus.AIS_CS_None
AIS_CS_Connection = AIS_ConnectStatus.AIS_CS_Connection
AIS_CS_Transform = AIS_ConnectStatus.AIS_CS_Transform
AIS_CS_Both = AIS_ConnectStatus.AIS_CS_Both

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

class AIS_ViewSelectionTool(IntEnum):
	AIS_ViewSelectionTool_Picking = 0
	AIS_ViewSelectionTool_RubberBand = 1
	AIS_ViewSelectionTool_Polygon = 2
AIS_ViewSelectionTool_Picking = AIS_ViewSelectionTool.AIS_ViewSelectionTool_Picking
AIS_ViewSelectionTool_RubberBand = AIS_ViewSelectionTool.AIS_ViewSelectionTool_RubberBand
AIS_ViewSelectionTool_Polygon = AIS_ViewSelectionTool.AIS_ViewSelectionTool_Polygon

class AIS_ViewInputBufferType(IntEnum):
	AIS_ViewInputBufferType_UI = 0
	AIS_ViewInputBufferType_GL = 1
AIS_ViewInputBufferType_UI = AIS_ViewInputBufferType.AIS_ViewInputBufferType_UI
AIS_ViewInputBufferType_GL = AIS_ViewInputBufferType.AIS_ViewInputBufferType_GL

class AIS_NavigationMode(IntEnum):
	AIS_NavigationMode_Orbit = 0
	AIS_NavigationMode_FirstPersonFlight = 1
	AIS_NavigationMode_FirstPersonWalk = 2
AIS_NavigationMode_Orbit = AIS_NavigationMode.AIS_NavigationMode_Orbit
AIS_NavigationMode_FirstPersonFlight = AIS_NavigationMode.AIS_NavigationMode_FirstPersonFlight
AIS_NavigationMode_FirstPersonWalk = AIS_NavigationMode.AIS_NavigationMode_FirstPersonWalk

class AIS_TypeOfIso(IntEnum):
	AIS_TOI_IsoU = 0
	AIS_TOI_IsoV = 1
	AIS_TOI_Both = 2
AIS_TOI_IsoU = AIS_TypeOfIso.AIS_TOI_IsoU
AIS_TOI_IsoV = AIS_TypeOfIso.AIS_TOI_IsoV
AIS_TOI_Both = AIS_TypeOfIso.AIS_TOI_Both

class AIS_KindOfRelation(IntEnum):
	AIS_KOR_NONE = 0
	AIS_KOR_CONCENTRIC = 1
	AIS_KOR_EQUALDISTANCE = 2
	AIS_KOR_EQUALRADIUS = 3
	AIS_KOR_FIX = 4
	AIS_KOR_IDENTIC = 5
	AIS_KOR_OFFSET = 6
	AIS_KOR_PARALLEL = 7
	AIS_KOR_PERPENDICULAR = 8
	AIS_KOR_TANGENT = 9
	AIS_KOR_SYMMETRIC = 10
AIS_KOR_NONE = AIS_KindOfRelation.AIS_KOR_NONE
AIS_KOR_CONCENTRIC = AIS_KindOfRelation.AIS_KOR_CONCENTRIC
AIS_KOR_EQUALDISTANCE = AIS_KindOfRelation.AIS_KOR_EQUALDISTANCE
AIS_KOR_EQUALRADIUS = AIS_KindOfRelation.AIS_KOR_EQUALRADIUS
AIS_KOR_FIX = AIS_KindOfRelation.AIS_KOR_FIX
AIS_KOR_IDENTIC = AIS_KindOfRelation.AIS_KOR_IDENTIC
AIS_KOR_OFFSET = AIS_KindOfRelation.AIS_KOR_OFFSET
AIS_KOR_PARALLEL = AIS_KindOfRelation.AIS_KOR_PARALLEL
AIS_KOR_PERPENDICULAR = AIS_KindOfRelation.AIS_KOR_PERPENDICULAR
AIS_KOR_TANGENT = AIS_KindOfRelation.AIS_KOR_TANGENT
AIS_KOR_SYMMETRIC = AIS_KindOfRelation.AIS_KOR_SYMMETRIC

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

class AIS_SelectionModesConcurrency(IntEnum):
	AIS_SelectionModesConcurrency_Single = 0
	AIS_SelectionModesConcurrency_GlobalOrLocal = 1
	AIS_SelectionModesConcurrency_Multiple = 2
AIS_SelectionModesConcurrency_Single = AIS_SelectionModesConcurrency.AIS_SelectionModesConcurrency_Single
AIS_SelectionModesConcurrency_GlobalOrLocal = AIS_SelectionModesConcurrency.AIS_SelectionModesConcurrency_GlobalOrLocal
AIS_SelectionModesConcurrency_Multiple = AIS_SelectionModesConcurrency.AIS_SelectionModesConcurrency_Multiple

class AIS_KindOfSurface(IntEnum):
	AIS_KOS_Plane = 0
	AIS_KOS_Cylinder = 1
	AIS_KOS_Cone = 2
	AIS_KOS_Sphere = 3
	AIS_KOS_Torus = 4
	AIS_KOS_Revolution = 5
	AIS_KOS_Extrusion = 6
	AIS_KOS_OtherSurface = 7
AIS_KOS_Plane = AIS_KindOfSurface.AIS_KOS_Plane
AIS_KOS_Cylinder = AIS_KindOfSurface.AIS_KOS_Cylinder
AIS_KOS_Cone = AIS_KindOfSurface.AIS_KOS_Cone
AIS_KOS_Sphere = AIS_KindOfSurface.AIS_KOS_Sphere
AIS_KOS_Torus = AIS_KindOfSurface.AIS_KOS_Torus
AIS_KOS_Revolution = AIS_KindOfSurface.AIS_KOS_Revolution
AIS_KOS_Extrusion = AIS_KindOfSurface.AIS_KOS_Extrusion
AIS_KOS_OtherSurface = AIS_KindOfSurface.AIS_KOS_OtherSurface

class AIS_StandardDatum(IntEnum):
	AIS_SD_None = 0
	AIS_SD_Point = 1
	AIS_SD_Axis = 2
	AIS_SD_Trihedron = 3
	AIS_SD_PlaneTrihedron = 4
	AIS_SD_Line = 5
	AIS_SD_Circle = 6
	AIS_SD_Plane = 7
AIS_SD_None = AIS_StandardDatum.AIS_SD_None
AIS_SD_Point = AIS_StandardDatum.AIS_SD_Point
AIS_SD_Axis = AIS_StandardDatum.AIS_SD_Axis
AIS_SD_Trihedron = AIS_StandardDatum.AIS_SD_Trihedron
AIS_SD_PlaneTrihedron = AIS_StandardDatum.AIS_SD_PlaneTrihedron
AIS_SD_Line = AIS_StandardDatum.AIS_SD_Line
AIS_SD_Circle = AIS_StandardDatum.AIS_SD_Circle
AIS_SD_Plane = AIS_StandardDatum.AIS_SD_Plane

class AIS_DisplayMode(IntEnum):
	AIS_WireFrame = 0
	AIS_Shaded = 1
AIS_WireFrame = AIS_DisplayMode.AIS_WireFrame
AIS_Shaded = AIS_DisplayMode.AIS_Shaded

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

class AIS_DragAction(IntEnum):
	AIS_DragAction_Start = 0
	AIS_DragAction_Update = 1
	AIS_DragAction_Stop = 2
	AIS_DragAction_Abort = 3
AIS_DragAction_Start = AIS_DragAction.AIS_DragAction_Start
AIS_DragAction_Update = AIS_DragAction.AIS_DragAction_Update
AIS_DragAction_Stop = AIS_DragAction.AIS_DragAction_Stop
AIS_DragAction_Abort = AIS_DragAction.AIS_DragAction_Abort

class AIS_DisplaySpecialSymbol(IntEnum):
	AIS_DSS_No = 0
	AIS_DSS_Before = 1
	AIS_DSS_After = 2
AIS_DSS_No = AIS_DisplaySpecialSymbol.AIS_DSS_No
AIS_DSS_Before = AIS_DisplaySpecialSymbol.AIS_DSS_Before
AIS_DSS_After = AIS_DisplaySpecialSymbol.AIS_DSS_After

class AIS_TypeOfDist(IntEnum):
	AIS_TOD_Unknown = 0
	AIS_TOD_Horizontal = 1
	AIS_TOD_Vertical = 2
AIS_TOD_Unknown = AIS_TypeOfDist.AIS_TOD_Unknown
AIS_TOD_Horizontal = AIS_TypeOfDist.AIS_TOD_Horizontal
AIS_TOD_Vertical = AIS_TypeOfDist.AIS_TOD_Vertical

class AIS_TypeOfPlane(IntEnum):
	AIS_TOPL_Unknown = 0
	AIS_TOPL_XYPlane = 1
	AIS_TOPL_XZPlane = 2
	AIS_TOPL_YZPlane = 3
AIS_TOPL_Unknown = AIS_TypeOfPlane.AIS_TOPL_Unknown
AIS_TOPL_XYPlane = AIS_TypeOfPlane.AIS_TOPL_XYPlane
AIS_TOPL_XZPlane = AIS_TypeOfPlane.AIS_TOPL_XZPlane
AIS_TOPL_YZPlane = AIS_TypeOfPlane.AIS_TOPL_YZPlane

class AIS_DisplayStatus(IntEnum):
	AIS_DS_Displayed = 0
	AIS_DS_Erased = 1
	AIS_DS_None = 2
AIS_DS_Displayed = AIS_DisplayStatus.AIS_DS_Displayed
AIS_DS_Erased = AIS_DisplayStatus.AIS_DS_Erased
AIS_DS_None = AIS_DisplayStatus.AIS_DS_None
};
/* end python proxy for enums */

/* handles */
%wrap_handle(AIS_Animation)
%wrap_handle(AIS_AttributeFilter)
%wrap_handle(AIS_BadEdgeFilter)
%wrap_handle(AIS_C0RegularityFilter)
%wrap_handle(AIS_ColoredDrawer)
%wrap_handle(AIS_DimensionOwner)
%wrap_handle(AIS_ExclusionFilter)
%wrap_handle(AIS_GlobalStatus)
%wrap_handle(AIS_InteractiveContext)
%wrap_handle(AIS_InteractiveObject)
%wrap_handle(AIS_ManipulatorOwner)
%wrap_handle(AIS_Selection)
%wrap_handle(AIS_TrihedronOwner)
%wrap_handle(AIS_TypeFilter)
%wrap_handle(AIS_AnimationCamera)
%wrap_handle(AIS_AnimationObject)
%wrap_handle(AIS_Axis)
%wrap_handle(AIS_Circle)
%wrap_handle(AIS_ColorScale)
%wrap_handle(AIS_ConnectedInteractive)
%wrap_handle(AIS_Dimension)
%wrap_handle(AIS_Line)
%wrap_handle(AIS_Manipulator)
%wrap_handle(AIS_MultipleConnectedInteractive)
%wrap_handle(AIS_Plane)
%wrap_handle(AIS_PlaneTrihedron)
%wrap_handle(AIS_Point)
%wrap_handle(AIS_PointCloud)
%wrap_handle(AIS_Relation)
%wrap_handle(AIS_RubberBand)
%wrap_handle(AIS_Shape)
%wrap_handle(AIS_SignatureFilter)
%wrap_handle(AIS_TextLabel)
%wrap_handle(AIS_Triangulation)
%wrap_handle(AIS_Trihedron)
%wrap_handle(AIS_AngleDimension)
%wrap_handle(AIS_Chamf2dDimension)
%wrap_handle(AIS_Chamf3dDimension)
%wrap_handle(AIS_ColoredShape)
%wrap_handle(AIS_ConcentricRelation)
%wrap_handle(AIS_DiameterDimension)
%wrap_handle(AIS_EllipseRadiusDimension)
%wrap_handle(AIS_EqualDistanceRelation)
%wrap_handle(AIS_EqualRadiusRelation)
%wrap_handle(AIS_FixRelation)
%wrap_handle(AIS_IdenticRelation)
%wrap_handle(AIS_LengthDimension)
%wrap_handle(AIS_MidPointRelation)
%wrap_handle(AIS_OffsetDimension)
%wrap_handle(AIS_ParallelRelation)
%wrap_handle(AIS_PerpendicularRelation)
%wrap_handle(AIS_RadiusDimension)
%wrap_handle(AIS_SymmetricRelation)
%wrap_handle(AIS_TangentRelation)
%wrap_handle(AIS_TexturedShape)
%wrap_handle(AIS_MaxRadiusDimension)
%wrap_handle(AIS_MinRadiusDimension)
/* end handles declaration */

/* templates */
%template(AIS_DataMapOfIOStatus) NCollection_DataMap<opencascade::handle<AIS_InteractiveObject>,opencascade::handle<AIS_GlobalStatus>,TColStd_MapTransientHasher>;
%template(AIS_DataMapOfShapeDrawer) NCollection_DataMap<TopoDS_Shape,opencascade::handle<AIS_ColoredDrawer>,TopTools_ShapeMapHasher>;
%template(AIS_DataMapofIntegerListOfinteractive) NCollection_DataMap<Standard_Integer,AIS_ListOfInteractive,TColStd_MapIntegerHasher>;

%extend NCollection_DataMap<Standard_Integer,AIS_ListOfInteractive,TColStd_MapIntegerHasher> {
    PyObject* Keys() {
        PyObject *l=PyList_New(0);
        for (AIS_DataMapofIntegerListOfinteractive::Iterator anIt1(*self); anIt1.More(); anIt1.Next()) {
          PyObject *o = PyLong_FromLong(anIt1.Key());
          PyList_Append(l, o);
          Py_DECREF(o);
        }
    return l;
    }
};
%template(AIS_IndexedDataMapOfOwnerPrs) NCollection_IndexedDataMap<opencascade::handle<SelectMgr_EntityOwner>,opencascade::handle<Prs3d_Presentation>,TColStd_MapTransientHasher>;
%template(AIS_ListIteratorOfListOfInteractive) NCollection_TListIterator<opencascade::handle<AIS_InteractiveObject>>;
%template(AIS_ListOfInteractive) NCollection_List<opencascade::handle<AIS_InteractiveObject>>;

%extend NCollection_List<opencascade::handle<AIS_InteractiveObject>> {
    %pythoncode {
    def __len__(self):
        return self.Size()
    }
};
%template(AIS_MapOfInteractive) NCollection_Map<opencascade::handle<AIS_InteractiveObject>,TColStd_MapTransientHasher>;
%template(AIS_MouseGestureMap) NCollection_DataMap<unsigned int, AIS_MouseGesture>;
%template(AIS_NListOfEntityOwner) NCollection_List<opencascade::handle<SelectMgr_EntityOwner>>;

%extend NCollection_List<opencascade::handle<SelectMgr_EntityOwner>> {
    %pythoncode {
    def __len__(self):
        return self.Size()
    }
};
%template(AIS_SequenceOfDimension) NCollection_Sequence<opencascade::handle<AIS_Relation>>;

%extend NCollection_Sequence<opencascade::handle<AIS_Relation>> {
    %pythoncode {
    def __len__(self):
        return self.Size()
    }
};
%template(AIS_SequenceOfInteractive) NCollection_Sequence<opencascade::handle<AIS_InteractiveObject>>;

%extend NCollection_Sequence<opencascade::handle<AIS_InteractiveObject>> {
    %pythoncode {
    def __len__(self):
        return self.Size()
    }
};
/* end templates declaration */

/* typedefs */
typedef Media_Timer AIS_AnimationTimer;
typedef NCollection_DataMap<opencascade::handle<AIS_InteractiveObject>, opencascade::handle<AIS_GlobalStatus>, TColStd_MapTransientHasher>::Iterator AIS_DataMapIteratorOfDataMapOfIOStatus;
typedef NCollection_DataMap<Standard_Integer, AIS_ListOfInteractive, TColStd_MapIntegerHasher>::Iterator AIS_DataMapIteratorOfDataMapofIntegerListOfinteractive;
typedef NCollection_DataMap<opencascade::handle<AIS_InteractiveObject>, opencascade::handle<AIS_GlobalStatus>, TColStd_MapTransientHasher> AIS_DataMapOfIOStatus;
typedef NCollection_DataMap<TopoDS_Shape, opencascade::handle<AIS_ColoredDrawer>, TopTools_ShapeMapHasher> AIS_DataMapOfShapeDrawer;
typedef NCollection_DataMap<Standard_Integer, AIS_ListOfInteractive, TColStd_MapIntegerHasher> AIS_DataMapofIntegerListOfinteractive;
typedef NCollection_IndexedDataMap<opencascade::handle<SelectMgr_EntityOwner>, opencascade::handle<Prs3d_Presentation>, TColStd_MapTransientHasher> AIS_IndexedDataMapOfOwnerPrs;
typedef NCollection_List<opencascade::handle<AIS_InteractiveObject>>::Iterator AIS_ListIteratorOfListOfInteractive;
typedef NCollection_List<opencascade::handle<AIS_InteractiveObject>> AIS_ListOfInteractive;
typedef NCollection_Map<opencascade::handle<AIS_InteractiveObject>, TColStd_MapTransientHasher>::Iterator AIS_MapIteratorOfMapOfInteractive;
typedef NCollection_Map<opencascade::handle<AIS_InteractiveObject>, TColStd_MapTransientHasher> AIS_MapOfInteractive;
typedef NCollection_DataMap<unsigned int, AIS_MouseGesture> AIS_MouseGestureMap;
typedef NCollection_List<opencascade::handle<SelectMgr_EntityOwner>> AIS_NListOfEntityOwner;
typedef NCollection_Sequence<opencascade::handle<AIS_Relation>> AIS_SequenceOfDimension;
typedef NCollection_Sequence<opencascade::handle<AIS_InteractiveObject>> AIS_SequenceOfInteractive;
/* end typedefs declaration */

/************
* class AIS *
************/
%rename(ais) AIS;
class AIS {
	public:
		/****************** ComputeGeomCurve ******************/
		/**** md5 signature: 6cb69c4ea337cf6a19ea54e6c660e70a ****/
		%feature("compactdefaultargs") ComputeGeomCurve;
		%feature("autodoc", "Checks if acurve belongs to aplane; if not, projects acurve in aplane and returns acurve; return true if ok.

Parameters
----------
aCurve: Geom_Curve
first1: float
last1: float
FirstPnt1: gp_Pnt
LastPnt1: gp_Pnt
aPlane: Geom_Plane

Returns
-------
isOnPlane: bool
") ComputeGeomCurve;
		static Standard_Boolean ComputeGeomCurve(opencascade::handle<Geom_Curve> & aCurve, const Standard_Real first1, const Standard_Real last1, gp_Pnt & FirstPnt1, gp_Pnt & LastPnt1, const opencascade::handle<Geom_Plane> & aPlane, Standard_Boolean &OutValue);

		/****************** ComputeGeometry ******************/
		/**** md5 signature: e8a575e5403a4ba0093cb9d2b31b2b98 ****/
		%feature("compactdefaultargs") ComputeGeometry;
		%feature("autodoc", "Used by 2d relation only computes the 3d geometry of <anedge> in the current workingplane and the extremities if any return true if ok.

Parameters
----------
theEdge: TopoDS_Edge
theCurve: Geom_Curve
theFirstPnt: gp_Pnt
theLastPnt: gp_Pnt

Returns
-------
bool
") ComputeGeometry;
		static Standard_Boolean ComputeGeometry(const TopoDS_Edge & theEdge, opencascade::handle<Geom_Curve> & theCurve, gp_Pnt & theFirstPnt, gp_Pnt & theLastPnt);

		/****************** ComputeGeometry ******************/
		/**** md5 signature: efd861838cb718f7744f62f9854ac012 ****/
		%feature("compactdefaultargs") ComputeGeometry;
		%feature("autodoc", "Used by dimensions only. computes the 3d geometry of <anedge>. return true if ok.

Parameters
----------
theEdge: TopoDS_Edge
theCurve: Geom_Curve
theFirstPnt: gp_Pnt
theLastPnt: gp_Pnt

Returns
-------
theIsInfinite: bool
") ComputeGeometry;
		static Standard_Boolean ComputeGeometry(const TopoDS_Edge & theEdge, opencascade::handle<Geom_Curve> & theCurve, gp_Pnt & theFirstPnt, gp_Pnt & theLastPnt, Standard_Boolean &OutValue);

		/****************** ComputeGeometry ******************/
		/**** md5 signature: 8b94e7eacd171a5f348b83aa3344f8e2 ****/
		%feature("compactdefaultargs") ComputeGeometry;
		%feature("autodoc", "Used by 2d relation only computes the 3d geometry of <anedge> in the current workingplane and the extremities if any. if <acurve> is not in the current plane, <extcurve> contains the not projected curve associated to <anedge>. if <anedge> is infinite, <isinfinite> = true and the 2 parameters <firstpnt> and <lastpnt> have no signification. return true if ok.

Parameters
----------
theEdge: TopoDS_Edge
theCurve: Geom_Curve
theFirstPnt: gp_Pnt
theLastPnt: gp_Pnt
theExtCurve: Geom_Curve
thePlane: Geom_Plane

Returns
-------
theIsInfinite: bool
theIsOnPlane: bool
") ComputeGeometry;
		static Standard_Boolean ComputeGeometry(const TopoDS_Edge & theEdge, opencascade::handle<Geom_Curve> & theCurve, gp_Pnt & theFirstPnt, gp_Pnt & theLastPnt, opencascade::handle<Geom_Curve> & theExtCurve, Standard_Boolean &OutValue, Standard_Boolean &OutValue, const opencascade::handle<Geom_Plane> & thePlane);

		/****************** ComputeGeometry ******************/
		/**** md5 signature: 8df8e467ff61bbb7f23d9cd9468ecad2 ****/
		%feature("compactdefaultargs") ComputeGeometry;
		%feature("autodoc", "Used by 2d relation only computes the 3d geometry of <anedge> in the current workingplane and the extremities if any return true if ok.

Parameters
----------
theFirstEdge: TopoDS_Edge
theSecondEdge: TopoDS_Edge
theFirstCurve: Geom_Curve
theSecondCurve: Geom_Curve
theFirstPnt1: gp_Pnt
theLastPnt1: gp_Pnt
theFirstPnt2: gp_Pnt
theLastPnt2: gp_Pnt
thePlane: Geom_Plane

Returns
-------
bool
") ComputeGeometry;
		static Standard_Boolean ComputeGeometry(const TopoDS_Edge & theFirstEdge, const TopoDS_Edge & theSecondEdge, opencascade::handle<Geom_Curve> & theFirstCurve, opencascade::handle<Geom_Curve> & theSecondCurve, gp_Pnt & theFirstPnt1, gp_Pnt & theLastPnt1, gp_Pnt & theFirstPnt2, gp_Pnt & theLastPnt2, const opencascade::handle<Geom_Plane> & thePlane);

		/****************** ComputeGeometry ******************/
		/**** md5 signature: 0df198d142c4b96a61c095fd4bf2b68b ****/
		%feature("compactdefaultargs") ComputeGeometry;
		%feature("autodoc", "Used by dimensions only.computes the 3d geometry of<anedge1> and <anedge2> and checks if they are infinite.

Parameters
----------
theFirstEdge: TopoDS_Edge
theSecondEdge: TopoDS_Edge
theFirstCurve: Geom_Curve
theSecondCurve: Geom_Curve
theFirstPnt1: gp_Pnt
theLastPnt1: gp_Pnt
theFirstPnt2: gp_Pnt
theLastPnt2: gp_Pnt

Returns
-------
theIsinfinite1: bool
theIsinfinite2: bool
") ComputeGeometry;
		static Standard_Boolean ComputeGeometry(const TopoDS_Edge & theFirstEdge, const TopoDS_Edge & theSecondEdge, opencascade::handle<Geom_Curve> & theFirstCurve, opencascade::handle<Geom_Curve> & theSecondCurve, gp_Pnt & theFirstPnt1, gp_Pnt & theLastPnt1, gp_Pnt & theFirstPnt2, gp_Pnt & theLastPnt2, Standard_Boolean &OutValue, Standard_Boolean &OutValue);

		/****************** ComputeGeometry ******************/
		/**** md5 signature: b6be325805be1ce5c8ffac49b7ee1d13 ****/
		%feature("compactdefaultargs") ComputeGeometry;
		%feature("autodoc", "Used by 2d relation only computes the 3d geometry of<anedge1> and <anedge2> in the current plane and the extremities if any. return in extcurve the 3d curve (not projected in the plane) of the first edge if <indexext> =1 or of the 2nd edge if <indexext> = 2. if <indexext> = 0, extcurve is null. if there is an edge external to the plane, <isinfinite> is true if this edge is infinite. so, the extremities of it are not significant. return true if ok.

Parameters
----------
theFirstEdge: TopoDS_Edge
theSecondEdge: TopoDS_Edge
theFirstCurve: Geom_Curve
theSecondCurve: Geom_Curve
theFirstPnt1: gp_Pnt
theLastPnt1: gp_Pnt
theFirstPnt2: gp_Pnt
theLastPnt2: gp_Pnt
theExtCurve: Geom_Curve
thePlane: Geom_Plane

Returns
-------
theExtIndex: int
theIsinfinite1: bool
theIsinfinite2: bool
") ComputeGeometry;
		static Standard_Boolean ComputeGeometry(const TopoDS_Edge & theFirstEdge, const TopoDS_Edge & theSecondEdge, Standard_Integer &OutValue, opencascade::handle<Geom_Curve> & theFirstCurve, opencascade::handle<Geom_Curve> & theSecondCurve, gp_Pnt & theFirstPnt1, gp_Pnt & theLastPnt1, gp_Pnt & theFirstPnt2, gp_Pnt & theLastPnt2, opencascade::handle<Geom_Curve> & theExtCurve, Standard_Boolean &OutValue, Standard_Boolean &OutValue, const opencascade::handle<Geom_Plane> & thePlane);

		/****************** ComputeGeometry ******************/
		/**** md5 signature: 1b2f2da9052ca02b5e26e70990845489 ****/
		%feature("compactdefaultargs") ComputeGeometry;
		%feature("autodoc", "No available documentation.

Parameters
----------
aVertex: TopoDS_Vertex
point: gp_Pnt
aPlane: Geom_Plane

Returns
-------
isOnPlane: bool
") ComputeGeometry;
		static Standard_Boolean ComputeGeometry(const TopoDS_Vertex & aVertex, gp_Pnt & point, const opencascade::handle<Geom_Plane> & aPlane, Standard_Boolean &OutValue);

		/****************** ComputeProjEdgePresentation ******************/
		/**** md5 signature: 48580268b98d21f047f2b8907f481c25 ****/
		%feature("compactdefaultargs") ComputeProjEdgePresentation;
		%feature("autodoc", "No available documentation.

Parameters
----------
aPres: Prs3d_Presentation
aDrawer: Prs3d_Drawer
anEdge: TopoDS_Edge
ProjCurve: Geom_Curve
FirstP: gp_Pnt
LastP: gp_Pnt
aColor: Quantity_NameOfColor,optional
	default value is Quantity_NOC_PURPLE
aWidth: float,optional
	default value is 2
aProjTOL: Aspect_TypeOfLine,optional
	default value is Aspect_TOL_DASH
aCallTOL: Aspect_TypeOfLine,optional
	default value is Aspect_TOL_DOT

Returns
-------
None
") ComputeProjEdgePresentation;
		static void ComputeProjEdgePresentation(const opencascade::handle<Prs3d_Presentation> & aPres, const opencascade::handle<Prs3d_Drawer> & aDrawer, const TopoDS_Edge & anEdge, const opencascade::handle<Geom_Curve> & ProjCurve, const gp_Pnt & FirstP, const gp_Pnt & LastP, const Quantity_NameOfColor aColor = Quantity_NOC_PURPLE, const Standard_Real aWidth = 2, const Aspect_TypeOfLine aProjTOL = Aspect_TOL_DASH, const Aspect_TypeOfLine aCallTOL = Aspect_TOL_DOT);

		/****************** ComputeProjVertexPresentation ******************/
		/**** md5 signature: 6a04d97aa212bbd9e4e92a1cd57df632 ****/
		%feature("compactdefaultargs") ComputeProjVertexPresentation;
		%feature("autodoc", "No available documentation.

Parameters
----------
aPres: Prs3d_Presentation
aDrawer: Prs3d_Drawer
aVertex: TopoDS_Vertex
ProjPoint: gp_Pnt
aColor: Quantity_NameOfColor,optional
	default value is Quantity_NOC_PURPLE
aWidth: float,optional
	default value is 2
aProjTOM: Aspect_TypeOfMarker,optional
	default value is Aspect_TOM_PLUS
aCallTOL: Aspect_TypeOfLine,optional
	default value is Aspect_TOL_DOT

Returns
-------
None
") ComputeProjVertexPresentation;
		static void ComputeProjVertexPresentation(const opencascade::handle<Prs3d_Presentation> & aPres, const opencascade::handle<Prs3d_Drawer> & aDrawer, const TopoDS_Vertex & aVertex, const gp_Pnt & ProjPoint, const Quantity_NameOfColor aColor = Quantity_NOC_PURPLE, const Standard_Real aWidth = 2, const Aspect_TypeOfMarker aProjTOM = Aspect_TOM_PLUS, const Aspect_TypeOfLine aCallTOL = Aspect_TOL_DOT);

		/****************** DistanceFromApex ******************/
		/**** md5 signature: 5ca9397fdee6875e346635084e849102 ****/
		%feature("compactdefaultargs") DistanceFromApex;
		%feature("autodoc", "Computes length of ellipse arc in parametric units.

Parameters
----------
elips: gp_Elips
Apex: gp_Pnt
par: float

Returns
-------
float
") DistanceFromApex;
		static Standard_Real DistanceFromApex(const gp_Elips & elips, const gp_Pnt & Apex, const Standard_Real par);

		/****************** Farest ******************/
		/**** md5 signature: 4711939cbf61dc61e0a31e90c0ba6574 ****/
		%feature("compactdefaultargs") Farest;
		%feature("autodoc", "No available documentation.

Parameters
----------
aShape: TopoDS_Shape
aPoint: gp_Pnt

Returns
-------
gp_Pnt
") Farest;
		static gp_Pnt Farest(const TopoDS_Shape & aShape, const gp_Pnt & aPoint);

		/****************** GetPlaneFromFace ******************/
		/**** md5 signature: b603086660615f240da7dfc0d7a86012 ****/
		%feature("compactdefaultargs") GetPlaneFromFace;
		%feature("autodoc", "Tryes to get plane from face. returns surface of face in asurf. returns standard_true and plane of face in aplane in following cases: face is plane, offset of plane, extrusion of line and offset of extrusion of line returns pure type of surface which can be: plane, cylinder, cone, sphere, torus, surfaceofrevolution, surfaceofextrusion.

Parameters
----------
aFace: TopoDS_Face
aPlane: gp_Pln
aSurf: Geom_Surface
aSurfType: AIS_KindOfSurface

Returns
-------
Offset: float
") GetPlaneFromFace;
		static Standard_Boolean GetPlaneFromFace(const TopoDS_Face & aFace, gp_Pln & aPlane, opencascade::handle<Geom_Surface> & aSurf, AIS_KindOfSurface & aSurfType, Standard_Real &OutValue);

		/****************** InDomain ******************/
		/**** md5 signature: e1a93aaf6fc6d1a74b142e3804975f9e ****/
		%feature("compactdefaultargs") InDomain;
		%feature("autodoc", "Returns true if point with anattachpar is in domain of arc.

Parameters
----------
aFirstPar: float
aLastPar: float
anAttachPar: float

Returns
-------
bool
") InDomain;
		static Standard_Boolean InDomain(const Standard_Real aFirstPar, const Standard_Real aLastPar, const Standard_Real anAttachPar);

		/****************** InitAngleBetweenCurvilinearFaces ******************/
		/**** md5 signature: 9861d5690e7b460b57b1696914bd96cb ****/
		%feature("compactdefaultargs") InitAngleBetweenCurvilinearFaces;
		%feature("autodoc", "Finds three points for the angle dimension between two curvilinear surfaces.

Parameters
----------
theFirstFace: TopoDS_Face
theSecondFace: TopoDS_Face
theFirstSurfType: AIS_KindOfSurface
theSecondSurfType: AIS_KindOfSurface
theCenter: gp_Pnt
theFirstAttach: gp_Pnt
theSecondAttach: gp_Pnt
theIsFirstPointSet: bool,optional
	default value is Standard_False

Returns
-------
bool
") InitAngleBetweenCurvilinearFaces;
		static Standard_Boolean InitAngleBetweenCurvilinearFaces(const TopoDS_Face & theFirstFace, const TopoDS_Face & theSecondFace, const AIS_KindOfSurface theFirstSurfType, const AIS_KindOfSurface theSecondSurfType, gp_Pnt & theCenter, gp_Pnt & theFirstAttach, gp_Pnt & theSecondAttach, const Standard_Boolean theIsFirstPointSet = Standard_False);

		/****************** InitAngleBetweenPlanarFaces ******************/
		/**** md5 signature: f3f9d6eda2bc4626227a0a6044b9294f ****/
		%feature("compactdefaultargs") InitAngleBetweenPlanarFaces;
		%feature("autodoc", "Finds three points for the angle dimension between two planes.

Parameters
----------
theFirstFace: TopoDS_Face
theSecondFace: TopoDS_Face
theCenter: gp_Pnt
theFirstAttach: gp_Pnt
theSecondAttach: gp_Pnt
theIsFirstPointSet: bool,optional
	default value is Standard_False

Returns
-------
bool
") InitAngleBetweenPlanarFaces;
		static Standard_Boolean InitAngleBetweenPlanarFaces(const TopoDS_Face & theFirstFace, const TopoDS_Face & theSecondFace, gp_Pnt & theCenter, gp_Pnt & theFirstAttach, gp_Pnt & theSecondAttach, const Standard_Boolean theIsFirstPointSet = Standard_False);

		/****************** InitFaceLength ******************/
		/**** md5 signature: e74c1c11fe71addadb41dc7491cf7239 ****/
		%feature("compactdefaultargs") InitFaceLength;
		%feature("autodoc", "No available documentation.

Parameters
----------
aFace: TopoDS_Face
aPlane: gp_Pln
aSurface: Geom_Surface
aSurfaceType: AIS_KindOfSurface

Returns
-------
anOffset: float
") InitFaceLength;
		static void InitFaceLength(const TopoDS_Face & aFace, gp_Pln & aPlane, opencascade::handle<Geom_Surface> & aSurface, AIS_KindOfSurface & aSurfaceType, Standard_Real &OutValue);

		/****************** InitLengthBetweenCurvilinearFaces ******************/
		/**** md5 signature: a415f028d8574f37e0030484cbbc493a ****/
		%feature("compactdefaultargs") InitLengthBetweenCurvilinearFaces;
		%feature("autodoc", "Finds attachment points on two curvilinear faces for length dimension. @param theplanedir [in] the direction on the dimension plane to compute the plane automatically. it will not be taken into account if plane is defined by user.

Parameters
----------
theFirstFace: TopoDS_Face
theSecondFace: TopoDS_Face
theFirstSurf: Geom_Surface
theSecondSurf: Geom_Surface
theFirstAttach: gp_Pnt
theSecondAttach: gp_Pnt
theDirOnPlane: gp_Dir

Returns
-------
None
") InitLengthBetweenCurvilinearFaces;
		static void InitLengthBetweenCurvilinearFaces(const TopoDS_Face & theFirstFace, const TopoDS_Face & theSecondFace, opencascade::handle<Geom_Surface> & theFirstSurf, opencascade::handle<Geom_Surface> & theSecondSurf, gp_Pnt & theFirstAttach, gp_Pnt & theSecondAttach, gp_Dir & theDirOnPlane);

		/****************** Nearest ******************/
		/**** md5 signature: ca941eb9deaee6d9850f4e04eff46172 ****/
		%feature("compactdefaultargs") Nearest;
		%feature("autodoc", "Returns the nearest point in a shape. this is used by several classes in calculation of dimensions.

Parameters
----------
aShape: TopoDS_Shape
aPoint: gp_Pnt

Returns
-------
gp_Pnt
") Nearest;
		static gp_Pnt Nearest(const TopoDS_Shape & aShape, const gp_Pnt & aPoint);

		/****************** Nearest ******************/
		/**** md5 signature: ca517f1153f3874290b78263548ad358 ****/
		%feature("compactdefaultargs") Nearest;
		%feature("autodoc", "Returns the nearest point on the line.

Parameters
----------
theLine: gp_Lin
thePoint: gp_Pnt

Returns
-------
gp_Pnt
") Nearest;
		static gp_Pnt Nearest(const gp_Lin & theLine, const gp_Pnt & thePoint);

		/****************** Nearest ******************/
		/**** md5 signature: e025c3fd731e2d20f08a2a452029e645 ****/
		%feature("compactdefaultargs") Nearest;
		%feature("autodoc", "For the given point finds nearest point on the curve, returns true if found point is belongs to the curve and false otherwise.

Parameters
----------
theCurve: Geom_Curve
thePoint: gp_Pnt
theFirstPoint: gp_Pnt
theLastPoint: gp_Pnt
theNearestPoint: gp_Pnt

Returns
-------
bool
") Nearest;
		static Standard_Boolean Nearest(const opencascade::handle<Geom_Curve> & theCurve, const gp_Pnt & thePoint, const gp_Pnt & theFirstPoint, const gp_Pnt & theLastPoint, gp_Pnt & theNearestPoint);

		/****************** NearestApex ******************/
		/**** md5 signature: 6c271d03667151d1766ac1e2b3ae1ee0 ****/
		%feature("compactdefaultargs") NearestApex;
		%feature("autodoc", "Computes nearest to ellipse arc apex.

Parameters
----------
elips: gp_Elips
pApex: gp_Pnt
nApex: gp_Pnt
fpara: float
lpara: float

Returns
-------
IsInDomain: bool
") NearestApex;
		static gp_Pnt NearestApex(const gp_Elips & elips, const gp_Pnt & pApex, const gp_Pnt & nApex, const Standard_Real fpara, const Standard_Real lpara, Standard_Boolean &OutValue);

		/****************** ProjectPointOnLine ******************/
		/**** md5 signature: ccd13eaf330359cd2d1963858612230a ****/
		%feature("compactdefaultargs") ProjectPointOnLine;
		%feature("autodoc", "No available documentation.

Parameters
----------
aPoint: gp_Pnt
aLine: gp_Lin

Returns
-------
gp_Pnt
") ProjectPointOnLine;
		static gp_Pnt ProjectPointOnLine(const gp_Pnt & aPoint, const gp_Lin & aLine);

		/****************** ProjectPointOnPlane ******************/
		/**** md5 signature: bb162bd011a4b418ec144bcaa3106b38 ****/
		%feature("compactdefaultargs") ProjectPointOnPlane;
		%feature("autodoc", "No available documentation.

Parameters
----------
aPoint: gp_Pnt
aPlane: gp_Pln

Returns
-------
gp_Pnt
") ProjectPointOnPlane;
		static gp_Pnt ProjectPointOnPlane(const gp_Pnt & aPoint, const gp_Pln & aPlane);

		/****************** TranslatePointToBound ******************/
		/**** md5 signature: 0f51e84cbfc1ab767a85d5ab839116dd ****/
		%feature("compactdefaultargs") TranslatePointToBound;
		%feature("autodoc", "No available documentation.

Parameters
----------
aPoint: gp_Pnt
aDir: gp_Dir
aBndBox: Bnd_Box

Returns
-------
gp_Pnt
") TranslatePointToBound;
		static gp_Pnt TranslatePointToBound(const gp_Pnt & aPoint, const gp_Dir & aDir, const Bnd_Box & aBndBox);

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
		/****************** AIS_Animation ******************/
		/**** md5 signature: 727aa36e0eb9a950096a860aa469ee16 ****/
		%feature("compactdefaultargs") AIS_Animation;
		%feature("autodoc", "Creates empty animation.

Parameters
----------
theAnimationName: TCollection_AsciiString

Returns
-------
None
") AIS_Animation;
		 AIS_Animation(const TCollection_AsciiString & theAnimationName);

		/****************** Add ******************/
		/**** md5 signature: b7202ad1c8c688e6eb7fda91d2734c8a ****/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "Add single animation to the timeline. @param theanimation input animation.

Parameters
----------
theAnimation: AIS_Animation

Returns
-------
None
") Add;
		void Add(const opencascade::handle<AIS_Animation> & theAnimation);

		/****************** Children ******************/
		/**** md5 signature: 4d291cae5d0ccc80f46be7cb0940bb81 ****/
		%feature("compactdefaultargs") Children;
		%feature("autodoc", "Return sequence of child animations.

Returns
-------
NCollection_Sequence<opencascade::handle<AIS_Animation>>
") Children;
		const NCollection_Sequence<opencascade::handle<AIS_Animation>> & Children();

		/****************** Clear ******************/
		/**** md5 signature: ae54be580b423a6eadbe062e0bdb44c2 ****/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Clear animation timeline - remove all animations from it.

Returns
-------
None
") Clear;
		void Clear();

		/****************** CopyFrom ******************/
		/**** md5 signature: 7d3ff49ce8472b7f7d11949859063cb9 ****/
		%feature("compactdefaultargs") CopyFrom;
		%feature("autodoc", "Clears own children and then copy child animations from another object. copy also start time and duration values.

Parameters
----------
theOther: AIS_Animation

Returns
-------
None
") CopyFrom;
		void CopyFrom(const opencascade::handle<AIS_Animation> & theOther);

		/****************** Duration ******************/
		/**** md5 signature: 06189957f640ef2ea84a8c20c3be6eb2 ****/
		%feature("compactdefaultargs") Duration;
		%feature("autodoc", "Returns duration of the animation in the timeline.

Returns
-------
float
") Duration;
		Standard_Real Duration();

		/****************** ElapsedTime ******************/
		/**** md5 signature: 70206d58970896f6b73a519322e3cb27 ****/
		%feature("compactdefaultargs") ElapsedTime;
		%feature("autodoc", "Return elapsed time.

Returns
-------
float
") ElapsedTime;
		Standard_Real ElapsedTime();

		/****************** Find ******************/
		/**** md5 signature: 9e22b1f4cfa3ba31fa4a06fb1ca92a95 ****/
		%feature("compactdefaultargs") Find;
		%feature("autodoc", "Return the child animation with the given name.

Parameters
----------
theAnimationName: TCollection_AsciiString

Returns
-------
opencascade::handle<AIS_Animation>
") Find;
		opencascade::handle<AIS_Animation> Find(const TCollection_AsciiString & theAnimationName);

		/****************** HasOwnDuration ******************/
		/**** md5 signature: d56fdc215ecd1f278eef79952f8de61f ****/
		%feature("compactdefaultargs") HasOwnDuration;
		%feature("autodoc", "Return true if duration is defined.

Returns
-------
bool
") HasOwnDuration;
		Standard_Boolean HasOwnDuration();

		/****************** IsStopped ******************/
		/**** md5 signature: 47d24d2d20eebce42247deefc3d90f95 ****/
		%feature("compactdefaultargs") IsStopped;
		%feature("autodoc", "Check if animation is to be performed in the animation timeline. returns true if it is stopped of finished.

Returns
-------
bool
") IsStopped;
		bool IsStopped();

		/****************** Name ******************/
		/**** md5 signature: efed61b92683387cd746fb27e0376505 ****/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "Animation name.

Returns
-------
TCollection_AsciiString
") Name;
		const TCollection_AsciiString & Name();

		/****************** OwnDuration ******************/
		/**** md5 signature: 91e7334f62ba03e5416b947ca9e5589c ****/
		%feature("compactdefaultargs") OwnDuration;
		%feature("autodoc", "Returns own duration of the animation in the timeline.

Returns
-------
float
") OwnDuration;
		Standard_Real OwnDuration();

		/****************** Pause ******************/
		/**** md5 signature: 98a33dcef2fa2a4e7461512069a3757c ****/
		%feature("compactdefaultargs") Pause;
		%feature("autodoc", "Pause the process timeline.

Returns
-------
None
") Pause;
		virtual void Pause();

		/****************** Remove ******************/
		/**** md5 signature: c2d3205baf5b26e561fca40dd748a99c ****/
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "Remove the child animation.

Parameters
----------
theAnimation: AIS_Animation

Returns
-------
bool
") Remove;
		Standard_Boolean Remove(const opencascade::handle<AIS_Animation> & theAnimation);

		/****************** Replace ******************/
		/**** md5 signature: 42763c45f3c3b0ec0a4cf50313c6374f ****/
		%feature("compactdefaultargs") Replace;
		%feature("autodoc", "Replace the child animation.

Parameters
----------
theAnimationOld: AIS_Animation
theAnimationNew: AIS_Animation

Returns
-------
bool
") Replace;
		Standard_Boolean Replace(const opencascade::handle<AIS_Animation> & theAnimationOld, const opencascade::handle<AIS_Animation> & theAnimationNew);

		/****************** SetOwnDuration ******************/
		/**** md5 signature: 93e15a8bd1da9298f6befc23307f6a81 ****/
		%feature("compactdefaultargs") SetOwnDuration;
		%feature("autodoc", "Defines duration of the animation.

Parameters
----------
theDuration: float

Returns
-------
None
") SetOwnDuration;
		void SetOwnDuration(const Standard_Real theDuration);

		/****************** SetStartPts ******************/
		/**** md5 signature: 564ab9fb556b377ff791cc01be87d894 ****/
		%feature("compactdefaultargs") SetStartPts;
		%feature("autodoc", "Sets time limits for animation in the animation timeline.

Parameters
----------
thePtsStart: float

Returns
-------
None
") SetStartPts;
		void SetStartPts(const Standard_Real thePtsStart);

		/****************** Start ******************/
		/**** md5 signature: f879b7bb1d28c81e7848195df5536432 ****/
		%feature("compactdefaultargs") Start;
		%feature("autodoc", "Start animation. this method changes status of the animation to started. this status defines whether animation is to be performed in the timeline or not. @param thetoupdate call update() method.

Parameters
----------
theToUpdate: bool

Returns
-------
None
") Start;
		virtual void Start(const Standard_Boolean theToUpdate);

		/****************** StartPts ******************/
		/**** md5 signature: a0076f268b996d9d8cca8f5b92fd5c71 ****/
		%feature("compactdefaultargs") StartPts;
		%feature("autodoc", "Returns start time of the animation in the timeline.

Returns
-------
float
") StartPts;
		Standard_Real StartPts();

		/****************** StartTimer ******************/
		/**** md5 signature: 0f7c28567a9543eb78614de7c427983a ****/
		%feature("compactdefaultargs") StartTimer;
		%feature("autodoc", "Start animation with internally defined timer instance. calls ::start() internally. //! note, that this method initializes a timer calculating an elapsed time (presentation timestamps within ais_animation::updatetimer()), not a multimedia timer executing viewer updates at specific intervals! viewer redrawing should be managed at application level, so that ais_animation::updatetimer() is called once right before each redrawing of a viewer content. //! @param thestartpts starting timer position (presentation timestamp) @param theplayspeed playback speed (1.0 means normal speed) @param thetoupdate flag to update defined animations to specified start position @param thetostoptimer flag to pause timer at the starting position.

Parameters
----------
theStartPts: float
thePlaySpeed: float
theToUpdate: bool
theToStopTimer: bool,optional
	default value is Standard_False

Returns
-------
None
") StartTimer;
		virtual void StartTimer(const Standard_Real theStartPts, const Standard_Real thePlaySpeed, const Standard_Boolean theToUpdate, const Standard_Boolean theToStopTimer = Standard_False);

		/****************** Stop ******************/
		/**** md5 signature: e7291f237a00cfa5edd0b11c2d39a866 ****/
		%feature("compactdefaultargs") Stop;
		%feature("autodoc", "Stop animation. this method changed status of the animation to stopped. this status shows that animation will not be performed in the timeline or it is finished.

Returns
-------
None
") Stop;
		virtual void Stop();

		/****************** Update ******************/
		/**** md5 signature: 3cb3b333871faa76cde54e56cbc9a277 ****/
		%feature("compactdefaultargs") Update;
		%feature("autodoc", "Update single frame of animation, update timer state @param thepts [in] the time moment within [0; duration()] returns true if timeline is in progress.

Parameters
----------
thePts: float

Returns
-------
bool
") Update;
		virtual Standard_Boolean Update(const Standard_Real thePts);

		/****************** UpdateTimer ******************/
		/**** md5 signature: e7ae9d2b64379352e7169b97fceb8f0b ****/
		%feature("compactdefaultargs") UpdateTimer;
		%feature("autodoc", "Update single frame of animation, update timer state returns current time of timeline progress.

Returns
-------
float
") UpdateTimer;
		virtual Standard_Real UpdateTimer();

		/****************** UpdateTotalDuration ******************/
		/**** md5 signature: 93617e806beabddc226ac7dfb7d23e8a ****/
		%feature("compactdefaultargs") UpdateTotalDuration;
		%feature("autodoc", "Update total duration considering all animations on timeline.

Returns
-------
None
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
		float Pts;
		float LocalPts;
		float LocalNormalized;
		/****************** AIS_AnimationProgress ******************/
		/**** md5 signature: 9e9e671b9cf6b1f96915c177eaaa8cf0 ****/
		%feature("compactdefaultargs") AIS_AnimationProgress;
		%feature("autodoc", "No available documentation.

Returns
-------
None
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
		/****************** AIS_AttributeFilter ******************/
		/**** md5 signature: efd1db0583fe2307eee29a09c901762e ****/
		%feature("compactdefaultargs") AIS_AttributeFilter;
		%feature("autodoc", "Constructs an empty attribute filter object. this filter object determines whether selectable interactive objects have a non-null owner.

Returns
-------
None
") AIS_AttributeFilter;
		 AIS_AttributeFilter();

		/****************** AIS_AttributeFilter ******************/
		/**** md5 signature: c9cdc1fdd6f2484c93f120e29d61460e ****/
		%feature("compactdefaultargs") AIS_AttributeFilter;
		%feature("autodoc", "Constructs an attribute filter object defined by the color attribute acol.

Parameters
----------
aCol: Quantity_NameOfColor

Returns
-------
None
") AIS_AttributeFilter;
		 AIS_AttributeFilter(const Quantity_NameOfColor aCol);

		/****************** AIS_AttributeFilter ******************/
		/**** md5 signature: 2972c55c086814240c46ab438e47b674 ****/
		%feature("compactdefaultargs") AIS_AttributeFilter;
		%feature("autodoc", "Constructs an attribute filter object defined by the line width attribute awidth.

Parameters
----------
aWidth: float

Returns
-------
None
") AIS_AttributeFilter;
		 AIS_AttributeFilter(const Standard_Real aWidth);

		/****************** HasColor ******************/
		/**** md5 signature: a769345684f55d228a3a0773ed253c2e ****/
		%feature("compactdefaultargs") HasColor;
		%feature("autodoc", "Indicates that the interactive object has the color setting specified by the argument acol at construction time.

Returns
-------
bool
") HasColor;
		Standard_Boolean HasColor();

		/****************** HasWidth ******************/
		/**** md5 signature: adf8ad0ef06bcc936459a8354657697e ****/
		%feature("compactdefaultargs") HasWidth;
		%feature("autodoc", "Indicates that the interactive object has the width setting specified by the argument awidth at construction time.

Returns
-------
bool
") HasWidth;
		Standard_Boolean HasWidth();

		/****************** IsOk ******************/
		/**** md5 signature: 30e74b6ea22a70db5324b6f796325694 ****/
		%feature("compactdefaultargs") IsOk;
		%feature("autodoc", "Indicates that the selected interactive object passes the filter. the owner, anobj, can be either direct or user. a direct owner is the corresponding construction element, whereas a user is the compound shape of which the entity forms a part. if the interactive object returns standard_true when detected by the local context selector through the mouse, the object is kept; if not, it is rejected.

Parameters
----------
anObj: SelectMgr_EntityOwner

Returns
-------
bool
") IsOk;
		virtual Standard_Boolean IsOk(const opencascade::handle<SelectMgr_EntityOwner> & anObj);

		/****************** SetColor ******************/
		/**** md5 signature: a5a89259e3fdf177522ec6a45eb6b08d ****/
		%feature("compactdefaultargs") SetColor;
		%feature("autodoc", "Sets the color acol. this must be chosen from the list of colors in quantity_nameofcolor.

Parameters
----------
aCol: Quantity_NameOfColor

Returns
-------
None
") SetColor;
		void SetColor(const Quantity_NameOfColor aCol);

		/****************** SetWidth ******************/
		/**** md5 signature: 241a01ddb40e85ceaaa56807348390c6 ****/
		%feature("compactdefaultargs") SetWidth;
		%feature("autodoc", "Sets the line width awidth.

Parameters
----------
aWidth: float

Returns
-------
None
") SetWidth;
		void SetWidth(const Standard_Real aWidth);

		/****************** UnsetColor ******************/
		/**** md5 signature: 188f0bfeebabf5f6612a608155ee828e ****/
		%feature("compactdefaultargs") UnsetColor;
		%feature("autodoc", "Removes the setting for color from the filter.

Returns
-------
None
") UnsetColor;
		void UnsetColor();

		/****************** UnsetWidth ******************/
		/**** md5 signature: 18cdd810cf848c52cf981cc677405046 ****/
		%feature("compactdefaultargs") UnsetWidth;
		%feature("autodoc", "Removes the setting for width from the filter.

Returns
-------
None
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
		/****************** AIS_BadEdgeFilter ******************/
		/**** md5 signature: c4f845eb6fba1f43aff9d06bfb985213 ****/
		%feature("compactdefaultargs") AIS_BadEdgeFilter;
		%feature("autodoc", "Constructs an empty filter object for bad edges.

Returns
-------
None
") AIS_BadEdgeFilter;
		 AIS_BadEdgeFilter();

		/****************** ActsOn ******************/
		/**** md5 signature: 202566b6d5f020366514ab01472c39b8 ****/
		%feature("compactdefaultargs") ActsOn;
		%feature("autodoc", "No available documentation.

Parameters
----------
aType: TopAbs_ShapeEnum

Returns
-------
bool
") ActsOn;
		virtual Standard_Boolean ActsOn(const TopAbs_ShapeEnum aType);

		/****************** AddEdge ******************/
		/**** md5 signature: 934c4e49a2ab432fcd7f7080aefadb3d ****/
		%feature("compactdefaultargs") AddEdge;
		%feature("autodoc", "Adds an edge to the list of non-selectionnable edges.

Parameters
----------
anEdge: TopoDS_Edge
Index: int

Returns
-------
None
") AddEdge;
		void AddEdge(const TopoDS_Edge & anEdge, const Standard_Integer Index);

		/****************** IsOk ******************/
		/**** md5 signature: c2526a31eda69e8f1f4f826cf18212d8 ****/
		%feature("compactdefaultargs") IsOk;
		%feature("autodoc", "No available documentation.

Parameters
----------
EO: SelectMgr_EntityOwner

Returns
-------
bool
") IsOk;
		virtual Standard_Boolean IsOk(const opencascade::handle<SelectMgr_EntityOwner> & EO);

		/****************** RemoveEdges ******************/
		/**** md5 signature: 63ed789acf308eb7c7b33128e1a1dc4b ****/
		%feature("compactdefaultargs") RemoveEdges;
		%feature("autodoc", "Removes from the list of non-selectionnable edges all edges in the contour <index>.

Parameters
----------
Index: int

Returns
-------
None
") RemoveEdges;
		void RemoveEdges(const Standard_Integer Index);

		/****************** SetContour ******************/
		/**** md5 signature: 5b04583b1eb841d44ea72ab6bd645066 ****/
		%feature("compactdefaultargs") SetContour;
		%feature("autodoc", "Sets <mycontour> with current contour. used by isok.

Parameters
----------
Index: int

Returns
-------
None
") SetContour;
		void SetContour(const Standard_Integer Index);

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
		/****************** AIS_C0RegularityFilter ******************/
		/**** md5 signature: 3cbcdfd2403fe0204a455ddc08350f99 ****/
		%feature("compactdefaultargs") AIS_C0RegularityFilter;
		%feature("autodoc", "No available documentation.

Parameters
----------
aShape: TopoDS_Shape

Returns
-------
None
") AIS_C0RegularityFilter;
		 AIS_C0RegularityFilter(const TopoDS_Shape & aShape);

		/****************** ActsOn ******************/
		/**** md5 signature: 202566b6d5f020366514ab01472c39b8 ****/
		%feature("compactdefaultargs") ActsOn;
		%feature("autodoc", "No available documentation.

Parameters
----------
aType: TopAbs_ShapeEnum

Returns
-------
bool
") ActsOn;
		virtual Standard_Boolean ActsOn(const TopAbs_ShapeEnum aType);

		/****************** IsOk ******************/
		/**** md5 signature: c2526a31eda69e8f1f4f826cf18212d8 ****/
		%feature("compactdefaultargs") IsOk;
		%feature("autodoc", "No available documentation.

Parameters
----------
EO: SelectMgr_EntityOwner

Returns
-------
bool
") IsOk;
		virtual Standard_Boolean IsOk(const opencascade::handle<SelectMgr_EntityOwner> & EO);

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
		bool myIsHidden;
		bool myHasOwnColor;
		bool myHasOwnTransp;
		bool myHasOwnWidth;
		/****************** AIS_ColoredDrawer ******************/
		/**** md5 signature: fb206bfbdf2e0955a791e7882ddd0a6d ****/
		%feature("compactdefaultargs") AIS_ColoredDrawer;
		%feature("autodoc", "Default constructor.

Parameters
----------
theLink: Prs3d_Drawer

Returns
-------
None
") AIS_ColoredDrawer;
		 AIS_ColoredDrawer(const opencascade::handle<Prs3d_Drawer> & theLink);

		/****************** HasOwnColor ******************/
		/**** md5 signature: c1d7c3268c360a84f320795d404c0b59 ****/
		%feature("compactdefaultargs") HasOwnColor;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") HasOwnColor;
		bool HasOwnColor();

		/****************** HasOwnTransparency ******************/
		/**** md5 signature: bfa958c2a81028d8551656b0f415f2b7 ****/
		%feature("compactdefaultargs") HasOwnTransparency;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") HasOwnTransparency;
		bool HasOwnTransparency();

		/****************** HasOwnWidth ******************/
		/**** md5 signature: 9f80b7b4536e979a5ec2d9011e0b5ad9 ****/
		%feature("compactdefaultargs") HasOwnWidth;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") HasOwnWidth;
		bool HasOwnWidth();

		/****************** IsHidden ******************/
		/**** md5 signature: 488685d602cd739d12ad12a5304d7b3e ****/
		%feature("compactdefaultargs") IsHidden;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsHidden;
		bool IsHidden();

		/****************** SetHidden ******************/
		/**** md5 signature: b8fd4d1df359caf57cb2042980fb02f6 ****/
		%feature("compactdefaultargs") SetHidden;
		%feature("autodoc", "No available documentation.

Parameters
----------
theToHide: bool

Returns
-------
None
") SetHidden;
		void SetHidden(const bool theToHide);

		/****************** SetOwnColor ******************/
		/**** md5 signature: 907a5bceace779e32277c3a1c2939792 ****/
		%feature("compactdefaultargs") SetOwnColor;
		%feature("autodoc", "No available documentation.

Parameters
----------
&: Quantity_Color

Returns
-------
None
") SetOwnColor;
		void SetOwnColor(const Quantity_Color &);

		/****************** SetOwnTransparency ******************/
		/**** md5 signature: 785e1eb625a3adf8c2d0a175272d25b2 ****/
		%feature("compactdefaultargs") SetOwnTransparency;
		%feature("autodoc", "No available documentation.

Parameters
----------
: float

Returns
-------
None
") SetOwnTransparency;
		void SetOwnTransparency(Standard_Real );

		/****************** SetOwnWidth ******************/
		/**** md5 signature: b905349cdb9aa07ebf24fb1890debcd1 ****/
		%feature("compactdefaultargs") SetOwnWidth;
		%feature("autodoc", "No available documentation.

Parameters
----------
Standard_Real: 

Returns
-------
None
") SetOwnWidth;
		void SetOwnWidth(const Standard_Real);

		/****************** UnsetOwnColor ******************/
		/**** md5 signature: 99078fba8198e7c264e3446bab64edc2 ****/
		%feature("compactdefaultargs") UnsetOwnColor;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") UnsetOwnColor;
		void UnsetOwnColor();

		/****************** UnsetOwnTransparency ******************/
		/**** md5 signature: 5d88cb3910be04c91a3ef80818d3b464 ****/
		%feature("compactdefaultargs") UnsetOwnTransparency;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") UnsetOwnTransparency;
		void UnsetOwnTransparency();

		/****************** UnsetOwnWidth ******************/
		/**** md5 signature: 9ab1ef7846eb1ab8ad2a68a36ac92341 ****/
		%feature("compactdefaultargs") UnsetOwnWidth;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") UnsetOwnWidth;
		void UnsetOwnWidth();

};


%make_alias(AIS_ColoredDrawer)

%extend AIS_ColoredDrawer {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************
* class AIS_DimensionOwner *
***************************/
class AIS_DimensionOwner : public SelectMgr_EntityOwner {
	public:
		/****************** AIS_DimensionOwner ******************/
		/**** md5 signature: 07b0818ad54c7ede730718fe88b654f0 ****/
		%feature("compactdefaultargs") AIS_DimensionOwner;
		%feature("autodoc", "Initializes the dimension owner, theso, and attributes it the priority, thepriority.

Parameters
----------
theSelObject: SelectMgr_SelectableObject
theSelMode: AIS_DimensionSelectionMode
thePriority: int,optional
	default value is 0

Returns
-------
None
") AIS_DimensionOwner;
		 AIS_DimensionOwner(const opencascade::handle<SelectMgr_SelectableObject> & theSelObject, const AIS_DimensionSelectionMode theSelMode, const Standard_Integer thePriority = 0);

		/****************** HilightWithColor ******************/
		/**** md5 signature: 56e556dd0edce796a3c3d12b272af59e ****/
		%feature("compactdefaultargs") HilightWithColor;
		%feature("autodoc", "No available documentation.

Parameters
----------
thePM: PrsMgr_PresentationManager3d
theStyle: Prs3d_Drawer
theMode: int,optional
	default value is 0

Returns
-------
None
") HilightWithColor;
		virtual void HilightWithColor(const opencascade::handle<PrsMgr_PresentationManager3d> & thePM, const opencascade::handle<Prs3d_Drawer> & theStyle, const Standard_Integer theMode = 0);

		/****************** IsHilighted ******************/
		/**** md5 signature: 47cdfcd94ad9e17a52e4b8d49964f328 ****/
		%feature("compactdefaultargs") IsHilighted;
		%feature("autodoc", "Returns true if an object with the selection mode amode is highlighted in the presentation manager apm.

Parameters
----------
thePM: PrsMgr_PresentationManager
theMode: int,optional
	default value is 0

Returns
-------
bool
") IsHilighted;
		virtual Standard_Boolean IsHilighted(const opencascade::handle<PrsMgr_PresentationManager> & thePM, const Standard_Integer theMode = 0);

		/****************** SelectionMode ******************/
		/**** md5 signature: 9e03c1a5a01e947ffe15cd8a0092f8ce ****/
		%feature("compactdefaultargs") SelectionMode;
		%feature("autodoc", "No available documentation.

Returns
-------
AIS_DimensionSelectionMode
") SelectionMode;
		AIS_DimensionSelectionMode SelectionMode();

		/****************** Unhilight ******************/
		/**** md5 signature: cbfa3741ba9c5eeac22e43360132f4ee ****/
		%feature("compactdefaultargs") Unhilight;
		%feature("autodoc", "Removes highlighting from the selected part of dimension.

Parameters
----------
thePM: PrsMgr_PresentationManager
theMode: int,optional
	default value is 0

Returns
-------
None
") Unhilight;
		virtual void Unhilight(const opencascade::handle<PrsMgr_PresentationManager> & thePM, const Standard_Integer theMode = 0);

};


%make_alias(AIS_DimensionOwner)

%extend AIS_DimensionOwner {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************
* class AIS_ExclusionFilter *
****************************/
class AIS_ExclusionFilter : public SelectMgr_Filter {
	public:
		/****************** AIS_ExclusionFilter ******************/
		/**** md5 signature: 064ab98be3c73998d458415e488fecc1 ****/
		%feature("compactdefaultargs") AIS_ExclusionFilter;
		%feature("autodoc", "Constructs an empty exclusion filter object defined by the flag setting exclusionflagon. by default, the flag is set to true.

Parameters
----------
ExclusionFlagOn: bool,optional
	default value is Standard_True

Returns
-------
None
") AIS_ExclusionFilter;
		 AIS_ExclusionFilter(const Standard_Boolean ExclusionFlagOn = Standard_True);

		/****************** AIS_ExclusionFilter ******************/
		/**** md5 signature: 041d0ad3434583d0c04faf66f482809a ****/
		%feature("compactdefaultargs") AIS_ExclusionFilter;
		%feature("autodoc", "All the ais objects of <typetoexclude> will be rejected by the isok method.

Parameters
----------
TypeToExclude: AIS_KindOfInteractive
ExclusionFlagOn: bool,optional
	default value is Standard_True

Returns
-------
None
") AIS_ExclusionFilter;
		 AIS_ExclusionFilter(const AIS_KindOfInteractive TypeToExclude, const Standard_Boolean ExclusionFlagOn = Standard_True);

		/****************** AIS_ExclusionFilter ******************/
		/**** md5 signature: cab18768b3cb1adf8f2ba0efbbe4421f ****/
		%feature("compactdefaultargs") AIS_ExclusionFilter;
		%feature("autodoc", "Constructs an exclusion filter object defined by the enumeration value typetoexclude, the signature signatureintype, and the flag setting exclusionflagon. by default, the flag is set to true.

Parameters
----------
TypeToExclude: AIS_KindOfInteractive
SignatureInType: int
ExclusionFlagOn: bool,optional
	default value is Standard_True

Returns
-------
None
") AIS_ExclusionFilter;
		 AIS_ExclusionFilter(const AIS_KindOfInteractive TypeToExclude, const Standard_Integer SignatureInType, const Standard_Boolean ExclusionFlagOn = Standard_True);

		/****************** Add ******************/
		/**** md5 signature: 085fb35c1492d2f8b4750399435d1aa2 ****/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "Adds the type typetoexclude to the list of types.

Parameters
----------
TypeToExclude: AIS_KindOfInteractive

Returns
-------
bool
") Add;
		Standard_Boolean Add(const AIS_KindOfInteractive TypeToExclude);

		/****************** Add ******************/
		/**** md5 signature: 86fefe7809855d68a55a9dc4b6decc4f ****/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "No available documentation.

Parameters
----------
TypeToExclude: AIS_KindOfInteractive
SignatureInType: int

Returns
-------
bool
") Add;
		Standard_Boolean Add(const AIS_KindOfInteractive TypeToExclude, const Standard_Integer SignatureInType);

		/****************** Clear ******************/
		/**** md5 signature: ae54be580b423a6eadbe062e0bdb44c2 ****/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Clear;
		void Clear();

		/****************** IsExclusionFlagOn ******************/
		/**** md5 signature: 7fe88450ac84eb6aa148073340c9bce3 ****/
		%feature("compactdefaultargs") IsExclusionFlagOn;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsExclusionFlagOn;
		Standard_Boolean IsExclusionFlagOn();

		/****************** IsOk ******************/
		/**** md5 signature: 30e74b6ea22a70db5324b6f796325694 ****/
		%feature("compactdefaultargs") IsOk;
		%feature("autodoc", "No available documentation.

Parameters
----------
anObj: SelectMgr_EntityOwner

Returns
-------
bool
") IsOk;
		virtual Standard_Boolean IsOk(const opencascade::handle<SelectMgr_EntityOwner> & anObj);

		/****************** IsStored ******************/
		/**** md5 signature: bba870e74cc49817d7f7c8757cf54a8c ****/
		%feature("compactdefaultargs") IsStored;
		%feature("autodoc", "No available documentation.

Parameters
----------
aType: AIS_KindOfInteractive

Returns
-------
bool
") IsStored;
		Standard_Boolean IsStored(const AIS_KindOfInteractive aType);

		/****************** ListOfSignature ******************/
		/**** md5 signature: 1a8fa99abcbb240a3c0dc243f15bff18 ****/
		%feature("compactdefaultargs") ListOfSignature;
		%feature("autodoc", "No available documentation.

Parameters
----------
aType: AIS_KindOfInteractive
TheStoredList: TColStd_ListOfInteger

Returns
-------
None
") ListOfSignature;
		void ListOfSignature(const AIS_KindOfInteractive aType, TColStd_ListOfInteger & TheStoredList);

		/****************** ListOfStoredTypes ******************/
		/**** md5 signature: 69d6ce3a47052a79b0d237bd773c8583 ****/
		%feature("compactdefaultargs") ListOfStoredTypes;
		%feature("autodoc", "No available documentation.

Parameters
----------
TheList: TColStd_ListOfInteger

Returns
-------
None
") ListOfStoredTypes;
		void ListOfStoredTypes(TColStd_ListOfInteger & TheList);

		/****************** Remove ******************/
		/**** md5 signature: 111f2ac32b46afb3d773732ee38ca94a ****/
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "No available documentation.

Parameters
----------
TypeToExclude: AIS_KindOfInteractive

Returns
-------
bool
") Remove;
		Standard_Boolean Remove(const AIS_KindOfInteractive TypeToExclude);

		/****************** Remove ******************/
		/**** md5 signature: a6c8969a5b4d28109160b0ea4cf45f3d ****/
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "No available documentation.

Parameters
----------
TypeToExclude: AIS_KindOfInteractive
SignatureInType: int

Returns
-------
bool
") Remove;
		Standard_Boolean Remove(const AIS_KindOfInteractive TypeToExclude, const Standard_Integer SignatureInType);

		/****************** SetExclusionFlag ******************/
		/**** md5 signature: 776a282b6c6b3f5c2639bb6c16791d22 ****/
		%feature("compactdefaultargs") SetExclusionFlag;
		%feature("autodoc", "No available documentation.

Parameters
----------
Status: bool

Returns
-------
None
") SetExclusionFlag;
		void SetExclusionFlag(const Standard_Boolean Status);

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
		/****************** AIS_GlobalStatus ******************/
		/**** md5 signature: 9c56844364db5c947daf28e63bef42e2 ****/
		%feature("compactdefaultargs") AIS_GlobalStatus;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") AIS_GlobalStatus;
		 AIS_GlobalStatus();

		/****************** AIS_GlobalStatus ******************/
		/**** md5 signature: 23cd32a350a0cbde82da5192eb9c1991 ****/
		%feature("compactdefaultargs") AIS_GlobalStatus;
		%feature("autodoc", "No available documentation.

Parameters
----------
aStat: AIS_DisplayStatus
aDispMode: int
aSelMode: int
ishilighted: bool,optional
	default value is Standard_False
aLayerIndex: int,optional
	default value is 0

Returns
-------
None
") AIS_GlobalStatus;
		 AIS_GlobalStatus(const AIS_DisplayStatus aStat, const Standard_Integer aDispMode, const Standard_Integer aSelMode, const Standard_Boolean ishilighted = Standard_False, const Standard_Integer aLayerIndex = 0);

		/****************** AddSelectionMode ******************/
		/**** md5 signature: 8d521f67bc72d54c9e4e290d83d68ddc ****/
		%feature("compactdefaultargs") AddSelectionMode;
		%feature("autodoc", "No available documentation.

Parameters
----------
theMode: int

Returns
-------
None
") AddSelectionMode;
		void AddSelectionMode(const Standard_Integer theMode);

		/****************** ClearSelectionModes ******************/
		/**** md5 signature: fd12a734ed1c8100ef06c89abfda31a4 ****/
		%feature("compactdefaultargs") ClearSelectionModes;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") ClearSelectionModes;
		void ClearSelectionModes();

		/****************** DisplayMode ******************/
		/**** md5 signature: 87ab8eae5ccb1d4f4dfd02dc34d6febc ****/
		%feature("compactdefaultargs") DisplayMode;
		%feature("autodoc", "Returns the display mode.

Returns
-------
int
") DisplayMode;
		Standard_Integer DisplayMode();

		/****************** GetLayerIndex ******************/
		/**** md5 signature: 7b96c91f5523916797eb6286445c0e6e ****/
		%feature("compactdefaultargs") GetLayerIndex;
		%feature("autodoc", "Returns layer index.

Returns
-------
int
") GetLayerIndex;
		Standard_Integer GetLayerIndex();

		/****************** GraphicStatus ******************/
		/**** md5 signature: ff5a84cfe20daa40af44f9889fc706ce ****/
		%feature("compactdefaultargs") GraphicStatus;
		%feature("autodoc", "No available documentation.

Returns
-------
AIS_DisplayStatus
") GraphicStatus;
		AIS_DisplayStatus GraphicStatus();

		/****************** HilightStyle ******************/
		/**** md5 signature: d17b0472c23cb74e2e63d1233b6a1355 ****/
		%feature("compactdefaultargs") HilightStyle;
		%feature("autodoc", "Returns applied highlight style for a particular object.

Returns
-------
opencascade::handle<Prs3d_Drawer>
") HilightStyle;
		const opencascade::handle<Prs3d_Drawer> & HilightStyle();

		/****************** IsHilighted ******************/
		/**** md5 signature: 35d1f91e445f37fcfd3bf419bad32f49 ****/
		%feature("compactdefaultargs") IsHilighted;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsHilighted;
		Standard_Boolean IsHilighted();

		/****************** IsSModeIn ******************/
		/**** md5 signature: ccf0fb36f839d3f90dd25d57ef7c634b ****/
		%feature("compactdefaultargs") IsSModeIn;
		%feature("autodoc", "No available documentation.

Parameters
----------
aMode: int

Returns
-------
bool
") IsSModeIn;
		Standard_Boolean IsSModeIn(const Standard_Integer aMode);

		/****************** IsSubIntensityOn ******************/
		/**** md5 signature: 1df00a9c06ea8c4f5d73e211efb2c1c6 ****/
		%feature("compactdefaultargs") IsSubIntensityOn;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsSubIntensityOn;
		Standard_Boolean IsSubIntensityOn();

		/****************** RemoveSelectionMode ******************/
		/**** md5 signature: a6d4cc7f4184138d0c1e3aad4be138ba ****/
		%feature("compactdefaultargs") RemoveSelectionMode;
		%feature("autodoc", "No available documentation.

Parameters
----------
aMode: int

Returns
-------
None
") RemoveSelectionMode;
		void RemoveSelectionMode(const Standard_Integer aMode);

		/****************** SelectionModes ******************/
		/**** md5 signature: 908d50ed59833e1e3d8eb3eb90d6ad2c ****/
		%feature("compactdefaultargs") SelectionModes;
		%feature("autodoc", "Keeps the active selection modes of the object in the main viewer.

Returns
-------
TColStd_ListOfInteger
") SelectionModes;
		const TColStd_ListOfInteger & SelectionModes();

		/****************** SetDisplayMode ******************/
		/**** md5 signature: 2a99a6840fca4af1fbc5cc91ac2d554d ****/
		%feature("compactdefaultargs") SetDisplayMode;
		%feature("autodoc", "Sets display mode.

Parameters
----------
theMode: int

Returns
-------
None
") SetDisplayMode;
		void SetDisplayMode(const Standard_Integer theMode);

		/****************** SetGraphicStatus ******************/
		/**** md5 signature: 3f1e04531cd7e5ad848d7dcea1cf9460 ****/
		%feature("compactdefaultargs") SetGraphicStatus;
		%feature("autodoc", "No available documentation.

Parameters
----------
theStatus: AIS_DisplayStatus

Returns
-------
None
") SetGraphicStatus;
		void SetGraphicStatus(const AIS_DisplayStatus theStatus);

		/****************** SetHilightStatus ******************/
		/**** md5 signature: 32df1cc3cd232c4fb69f8546f990eb32 ****/
		%feature("compactdefaultargs") SetHilightStatus;
		%feature("autodoc", "No available documentation.

Parameters
----------
theStatus: bool

Returns
-------
None
") SetHilightStatus;
		void SetHilightStatus(const Standard_Boolean theStatus);

		/****************** SetHilightStyle ******************/
		/**** md5 signature: f245d0c0a2ce5f6a233e75a326f80a8c ****/
		%feature("compactdefaultargs") SetHilightStyle;
		%feature("autodoc", "Changes applied highlight style for a particular object.

Parameters
----------
theStyle: Prs3d_Drawer

Returns
-------
None
") SetHilightStyle;
		void SetHilightStyle(const opencascade::handle<Prs3d_Drawer> & theStyle);

		/****************** SetLayerIndex ******************/
		/**** md5 signature: 6425d3c907faef916eed507feced557a ****/
		%feature("compactdefaultargs") SetLayerIndex;
		%feature("autodoc", "No available documentation.

Parameters
----------
theIndex: int

Returns
-------
None
") SetLayerIndex;
		void SetLayerIndex(const Standard_Integer theIndex);

		/****************** SubIntensityOff ******************/
		/**** md5 signature: 460a3dc0927cf1132fc4383a9c3f3e8a ****/
		%feature("compactdefaultargs") SubIntensityOff;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") SubIntensityOff;
		void SubIntensityOff();

		/****************** SubIntensityOn ******************/
		/**** md5 signature: 35338134478596b5237bbe62411f8447 ****/
		%feature("compactdefaultargs") SubIntensityOn;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") SubIntensityOn;
		void SubIntensityOn();

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
		/****************** GetInteriorColor ******************/
		/**** md5 signature: a09776a9369f9af7c09c13e0f002bccf ****/
		%feature("compactdefaultargs") GetInteriorColor;
		%feature("autodoc", "No available documentation.

Parameters
----------
aDrawer: Prs3d_Drawer

Returns
-------
Quantity_NameOfColor
") GetInteriorColor;
		static Quantity_NameOfColor GetInteriorColor(const opencascade::handle<Prs3d_Drawer> & aDrawer);

		/****************** GetInteriorColor ******************/
		/**** md5 signature: ca6ae445556055bebc087f7202929ccf ****/
		%feature("compactdefaultargs") GetInteriorColor;
		%feature("autodoc", "No available documentation.

Parameters
----------
aDrawer: Prs3d_Drawer
aColor: Quantity_Color

Returns
-------
None
") GetInteriorColor;
		static void GetInteriorColor(const opencascade::handle<Prs3d_Drawer> & aDrawer, Quantity_Color & aColor);

		/****************** GetLineAtt ******************/
		/**** md5 signature: ff93797c6653dc188d33c3aa89713ee0 ****/
		%feature("compactdefaultargs") GetLineAtt;
		%feature("autodoc", "No available documentation.

Parameters
----------
aDrawer: Prs3d_Drawer
TheTypeOfAttributes: AIS_TypeOfAttribute
aCol: Quantity_NameOfColor
aTyp: Aspect_TypeOfLine

Returns
-------
aWidth: float
") GetLineAtt;
		static void GetLineAtt(const opencascade::handle<Prs3d_Drawer> & aDrawer, const AIS_TypeOfAttribute TheTypeOfAttributes, Quantity_NameOfColor & aCol, Standard_Real &OutValue, Aspect_TypeOfLine & aTyp);

		/****************** GetLineColor ******************/
		/**** md5 signature: eba7d0fb34c3645d05f21c7b3545cd3c ****/
		%feature("compactdefaultargs") GetLineColor;
		%feature("autodoc", "No available documentation.

Parameters
----------
aDrawer: Prs3d_Drawer
TheTypeOfAttributes: AIS_TypeOfAttribute

Returns
-------
Quantity_NameOfColor
") GetLineColor;
		static Quantity_NameOfColor GetLineColor(const opencascade::handle<Prs3d_Drawer> & aDrawer, const AIS_TypeOfAttribute TheTypeOfAttributes);

		/****************** GetLineColor ******************/
		/**** md5 signature: ba905e7c41f5ad7f557bf6fdd367c9fc ****/
		%feature("compactdefaultargs") GetLineColor;
		%feature("autodoc", "No available documentation.

Parameters
----------
aDrawer: Prs3d_Drawer
TheTypeOfAttributes: AIS_TypeOfAttribute
TheLineColor: Quantity_Color

Returns
-------
None
") GetLineColor;
		static void GetLineColor(const opencascade::handle<Prs3d_Drawer> & aDrawer, const AIS_TypeOfAttribute TheTypeOfAttributes, Quantity_Color & TheLineColor);

		/****************** GetLineType ******************/
		/**** md5 signature: 096ac584eafeaee003d7c6fee0409ae9 ****/
		%feature("compactdefaultargs") GetLineType;
		%feature("autodoc", "No available documentation.

Parameters
----------
aDrawer: Prs3d_Drawer
TheTypeOfAttributes: AIS_TypeOfAttribute

Returns
-------
Aspect_TypeOfLine
") GetLineType;
		static Aspect_TypeOfLine GetLineType(const opencascade::handle<Prs3d_Drawer> & aDrawer, const AIS_TypeOfAttribute TheTypeOfAttributes);

		/****************** GetLineWidth ******************/
		/**** md5 signature: 9598d110bfca1fc2bd93c1fc85125dbb ****/
		%feature("compactdefaultargs") GetLineWidth;
		%feature("autodoc", "No available documentation.

Parameters
----------
aDrawer: Prs3d_Drawer
TheTypeOfAttributes: AIS_TypeOfAttribute

Returns
-------
float
") GetLineWidth;
		static Standard_Real GetLineWidth(const opencascade::handle<Prs3d_Drawer> & aDrawer, const AIS_TypeOfAttribute TheTypeOfAttributes);

		/****************** GetMaterial ******************/
		/**** md5 signature: 4049b89d3369ddd54ce882f6e39b1700 ****/
		%feature("compactdefaultargs") GetMaterial;
		%feature("autodoc", "No available documentation.

Parameters
----------
aDrawer: Prs3d_Drawer

Returns
-------
Graphic3d_MaterialAspect
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
		/****************** AIS_InteractiveContext ******************/
		/**** md5 signature: e050aa4400b6a1b1bad39801422c3f15 ****/
		%feature("compactdefaultargs") AIS_InteractiveContext;
		%feature("autodoc", "Constructs the interactive context object defined by the principal viewer mainviewer.

Parameters
----------
MainViewer: V3d_Viewer

Returns
-------
None
") AIS_InteractiveContext;
		 AIS_InteractiveContext(const opencascade::handle<V3d_Viewer> & MainViewer);

		/****************** Activate ******************/
		/**** md5 signature: 55fe7d0b67d661d0036919d5c5b808fe ****/
		%feature("compactdefaultargs") Activate;
		%feature("autodoc", "Activates the selection mode amode whose index is given, for the given interactive entity aniobj.

Parameters
----------
theObj: AIS_InteractiveObject
theMode: int,optional
	default value is 0
theIsForce: bool,optional
	default value is Standard_False

Returns
-------
None
") Activate;
		void Activate(const opencascade::handle<AIS_InteractiveObject> & theObj, const Standard_Integer theMode = 0, const Standard_Boolean theIsForce = Standard_False);

		/****************** Activate ******************/
		/**** md5 signature: 8f26e8d542718dfb36634eb940fc280b ****/
		%feature("compactdefaultargs") Activate;
		%feature("autodoc", "Activates the given selection mode for the all displayed objects.

Parameters
----------
theMode: int
theIsForce: bool,optional
	default value is Standard_False

Returns
-------
None
") Activate;
		void Activate(const Standard_Integer theMode, const Standard_Boolean theIsForce = Standard_False);

		/****************** ActivatedModes ******************/
		/**** md5 signature: 473b3a424c116d59c0cb0dea18173794 ****/
		%feature("compactdefaultargs") ActivatedModes;
		%feature("autodoc", "Returns the list of activated selection modes.

Parameters
----------
anIobj: AIS_InteractiveObject
theList: TColStd_ListOfInteger

Returns
-------
None
") ActivatedModes;
		void ActivatedModes(const opencascade::handle<AIS_InteractiveObject> & anIobj, TColStd_ListOfInteger & theList);

		/****************** AddFilter ******************/
		/**** md5 signature: 8f89ceb3d250cc70530e81ee261a2e71 ****/
		%feature("compactdefaultargs") AddFilter;
		%feature("autodoc", "Allows you to add the filter.

Parameters
----------
theFilter: SelectMgr_Filter

Returns
-------
None
") AddFilter;
		void AddFilter(const opencascade::handle<SelectMgr_Filter> & theFilter);

		/****************** AddOrRemoveCurrentObject ******************/
		/**** md5 signature: 89eb3aca1b8b6d529be5010ff461f430 ****/
		%feature("compactdefaultargs") AddOrRemoveCurrentObject;
		%feature("autodoc", "Allows to add or remove the object given to the list of current and highlight/unhighlight it correspondingly. is valid for global context only; for local context use method addorremoveselected. since this method makes sence only for neutral point selection of a whole object, if 0 selection of the object is empty this method simply does nothing.

Parameters
----------
theObj: AIS_InteractiveObject
theIsToUpdateViewer: bool

Returns
-------
None
") AddOrRemoveCurrentObject;
		void AddOrRemoveCurrentObject(const opencascade::handle<AIS_InteractiveObject> & theObj, const Standard_Boolean theIsToUpdateViewer);

		/****************** AddOrRemoveSelected ******************/
		/**** md5 signature: 1bb429ff4eafd5c81c1557e9bf7f1315 ****/
		%feature("compactdefaultargs") AddOrRemoveSelected;
		%feature("autodoc", "Allows to highlight or unhighlight the owner given depending on its selection status.

Parameters
----------
theObject: AIS_InteractiveObject
theToUpdateViewer: bool

Returns
-------
None
") AddOrRemoveSelected;
		void AddOrRemoveSelected(const opencascade::handle<AIS_InteractiveObject> & theObject, const Standard_Boolean theToUpdateViewer);

		/****************** AddOrRemoveSelected ******************/
		/**** md5 signature: 16190e6848910433cfb62ce0a8cd35f5 ****/
		%feature("compactdefaultargs") AddOrRemoveSelected;
		%feature("autodoc", "Allows to highlight or unhighlight the owner given depending on its selection status.

Parameters
----------
theOwner: SelectMgr_EntityOwner
theToUpdateViewer: bool

Returns
-------
None
") AddOrRemoveSelected;
		void AddOrRemoveSelected(const opencascade::handle<SelectMgr_EntityOwner> & theOwner, const Standard_Boolean theToUpdateViewer);

		/****************** AddSelect ******************/
		/**** md5 signature: 52ea6338337a736ab508e9fc2a8879f6 ****/
		%feature("compactdefaultargs") AddSelect;
		%feature("autodoc", "Adds object in the selection.

Parameters
----------
theObject: SelectMgr_EntityOwner

Returns
-------
AIS_StatusOfPick
") AddSelect;
		AIS_StatusOfPick AddSelect(const opencascade::handle<SelectMgr_EntityOwner> & theObject);

		/****************** AddSelect ******************/
		/**** md5 signature: 37dc4fd1f46d4797ff3f04cf30ba255c ****/
		%feature("compactdefaultargs") AddSelect;
		%feature("autodoc", "Adds object in the selection.

Parameters
----------
theObject: AIS_InteractiveObject

Returns
-------
AIS_StatusOfPick
") AddSelect;
		AIS_StatusOfPick AddSelect(const opencascade::handle<AIS_InteractiveObject> & theObject);

		/****************** Applicative ******************/
		/**** md5 signature: d43af2e985c3a710a87f1b988ff487fb ****/
		%feature("compactdefaultargs") Applicative;
		%feature("autodoc", "Returns selectedinteractive()->getowner(). @sa selectedowner().

Returns
-------
opencascade::handle<Standard_Transient>
") Applicative;
		opencascade::handle<Standard_Transient> Applicative();

		/****************** AutomaticHilight ******************/
		/**** md5 signature: 4952888a363f75b407065ba2086186e6 ****/
		%feature("compactdefaultargs") AutomaticHilight;
		%feature("autodoc", "Returns true if the automatic highlight mode is active; true by default. @sa moveto(), select(), hilightwithcolor(), unhilight().

Returns
-------
bool
") AutomaticHilight;
		Standard_Boolean AutomaticHilight();

		/****************** BeginImmediateDraw ******************/
		/**** md5 signature: 35e8d0184dd051a6d98a100d7384205d ****/
		%feature("compactdefaultargs") BeginImmediateDraw;
		%feature("autodoc", "Initializes the list of presentations to be displayed returns false if no local context is opened.

Returns
-------
bool
") BeginImmediateDraw;
		Standard_Boolean BeginImmediateDraw();

		/****************** BoundingBoxOfSelection ******************/
		/**** md5 signature: 19a0242f29a43de5c30da614a02e6932 ****/
		%feature("compactdefaultargs") BoundingBoxOfSelection;
		%feature("autodoc", "Returns bounding box of selected objects.

Returns
-------
Bnd_Box
") BoundingBoxOfSelection;
		Bnd_Box BoundingBoxOfSelection();

		/****************** ClearActiveSensitive ******************/
		/**** md5 signature: 81b910a4cd745e76d9d2719b0e8bc729 ****/
		%feature("compactdefaultargs") ClearActiveSensitive;
		%feature("autodoc", "Clear visualization of sensitives.

Parameters
----------
aView: V3d_View

Returns
-------
None
") ClearActiveSensitive;
		void ClearActiveSensitive(const opencascade::handle<V3d_View> & aView);

		/****************** ClearCurrents ******************/
		/**** md5 signature: 5a42913642e1c5502336115ec9966dde ****/
		%feature("compactdefaultargs") ClearCurrents;
		%feature("autodoc", "Empties previous current objects in order to get the current objects detected by the selector using updatecurrent. objects selected when there is no open local context are called current objects; those selected in open local context, selected objects.

Parameters
----------
theToUpdateViewer: bool

Returns
-------
None
") ClearCurrents;
		void ClearCurrents(const Standard_Boolean theToUpdateViewer);

		/****************** ClearDetected ******************/
		/**** md5 signature: 05bcfbbe15e2a7b718c1e7367190267b ****/
		%feature("compactdefaultargs") ClearDetected;
		%feature("autodoc", "Clears the list of entities detected by moveto() and resets dynamic highlighting. @param thetoredrawimmediate if true, the main viewer will be redrawn on update returns true if viewer needs to be updated (e.g. there were actually dynamically highlighted entities).

Parameters
----------
theToRedrawImmediate: bool,optional
	default value is Standard_False

Returns
-------
bool
") ClearDetected;
		Standard_Boolean ClearDetected(Standard_Boolean theToRedrawImmediate = Standard_False);

		/****************** ClearPrs ******************/
		/**** md5 signature: cc651ed8024f067783d71c8717cfd6c7 ****/
		%feature("compactdefaultargs") ClearPrs;
		%feature("autodoc", "Empties the graphic presentation of the mode indexed by amode. warning! removes theiobj. theiobj is still active if it was previously activated.

Parameters
----------
theIObj: AIS_InteractiveObject
theMode: int
theToUpdateViewer: bool

Returns
-------
None
") ClearPrs;
		void ClearPrs(const opencascade::handle<AIS_InteractiveObject> & theIObj, const Standard_Integer theMode, const Standard_Boolean theToUpdateViewer);

		/****************** ClearSelected ******************/
		/**** md5 signature: cd9127863ce8c74cdaa3ced0018f7a26 ****/
		%feature("compactdefaultargs") ClearSelected;
		%feature("autodoc", "Empties previous selected objects in order to get the selected objects detected by the selector using updateselected.

Parameters
----------
theToUpdateViewer: bool

Returns
-------
None
") ClearSelected;
		void ClearSelected(const Standard_Boolean theToUpdateViewer);

		/****************** Color ******************/
		/**** md5 signature: 30319ccfc0804ed2727c24b795588dd1 ****/
		%feature("compactdefaultargs") Color;
		%feature("autodoc", "Returns the color of the object in the interactive context.

Parameters
----------
aniobj: AIS_InteractiveObject
acolor: Quantity_Color

Returns
-------
None
") Color;
		void Color(const opencascade::handle<AIS_InteractiveObject> & aniobj, Quantity_Color & acolor);

		/****************** Current ******************/
		/**** md5 signature: 306daa9a488493500027cb5d7534764b ****/
		%feature("compactdefaultargs") Current;
		%feature("autodoc", "Returns the current interactive object. objects selected when there is no open local context are called current objects; those selected in open local context, selected objects.

Returns
-------
opencascade::handle<AIS_InteractiveObject>
") Current;
		opencascade::handle<AIS_InteractiveObject> Current();

		/****************** CurrentViewer ******************/
		/**** md5 signature: c71b17a30c90b404a2fe56e1cbabac4b ****/
		%feature("compactdefaultargs") CurrentViewer;
		%feature("autodoc", "Returns the current viewer.

Returns
-------
opencascade::handle<V3d_Viewer>
") CurrentViewer;
		const opencascade::handle<V3d_Viewer> & CurrentViewer();

		/****************** Deactivate ******************/
		/**** md5 signature: 2836d4ea8ca04a1b3dbd8159991e33e0 ****/
		%feature("compactdefaultargs") Deactivate;
		%feature("autodoc", "Deactivates all the activated selection modes of an object.

Parameters
----------
theObj: AIS_InteractiveObject

Returns
-------
None
") Deactivate;
		void Deactivate(const opencascade::handle<AIS_InteractiveObject> & theObj);

		/****************** Deactivate ******************/
		/**** md5 signature: a1aa11d729d351adf1e876927c761e2e ****/
		%feature("compactdefaultargs") Deactivate;
		%feature("autodoc", "Deactivates all the activated selection modes of the interactive object aniobj with a given selection mode amode.

Parameters
----------
theObj: AIS_InteractiveObject
theMode: int

Returns
-------
None
") Deactivate;
		void Deactivate(const opencascade::handle<AIS_InteractiveObject> & theObj, const Standard_Integer theMode);

		/****************** Deactivate ******************/
		/**** md5 signature: e24aebd581a35bc452696b3deee7c97a ****/
		%feature("compactdefaultargs") Deactivate;
		%feature("autodoc", "Deactivates the given selection mode for all displayed objects.

Parameters
----------
theMode: int

Returns
-------
None
") Deactivate;
		void Deactivate(const Standard_Integer theMode);

		/****************** Deactivate ******************/
		/**** md5 signature: cfea69d44907bc53764978e47e0de401 ****/
		%feature("compactdefaultargs") Deactivate;
		%feature("autodoc", "Deactivates all the activated selection mode at all displayed objects.

Returns
-------
None
") Deactivate;
		void Deactivate();

		/****************** DefaultDrawer ******************/
		/**** md5 signature: 14128b182687edc7e9f18d40a682f0b8 ****/
		%feature("compactdefaultargs") DefaultDrawer;
		%feature("autodoc", "Returns the default attribute manager. this contains all the color and line attributes which can be used by interactive objects which do not have their own attributes.

Returns
-------
opencascade::handle<Prs3d_Drawer>
") DefaultDrawer;
		const opencascade::handle<Prs3d_Drawer> & DefaultDrawer();

		/****************** DetectedCurrentObject ******************/
		/**** md5 signature: db9a21d25f0bb2a34f1d9b68c667faf4 ****/
		%feature("compactdefaultargs") DetectedCurrentObject;
		%feature("autodoc", "Returns current mouse-detected interactive object or null object, if there is no currently detected interactives @sa detectedcurrentowner()/initdetected()/moredetected()/nextdetected().

Returns
-------
opencascade::handle<AIS_InteractiveObject>
") DetectedCurrentObject;
		opencascade::handle<AIS_InteractiveObject> DetectedCurrentObject();

		/****************** DetectedCurrentOwner ******************/
		/**** md5 signature: f92c094b1c7835be9059494de430ed90 ****/
		%feature("compactdefaultargs") DetectedCurrentOwner;
		%feature("autodoc", "Returns the owner from detected list pointed by current iterator position. warning! this method is irrelevant to detectedowner() which returns last picked owner regardless of iterator position! @sa initdetected()/moredetected()/nextdetected().

Returns
-------
opencascade::handle<SelectMgr_EntityOwner>
") DetectedCurrentOwner;
		opencascade::handle<SelectMgr_EntityOwner> DetectedCurrentOwner();

		/****************** DetectedCurrentShape ******************/
		/**** md5 signature: 89ce12168c616c9e784d18e7ee93368c ****/
		%feature("compactdefaultargs") DetectedCurrentShape;
		%feature("autodoc", "Returns current mouse-detected shape or empty (null) shape, if current interactive object is not a shape (ais_shape) or there is no current mouse-detected interactive object at all. @sa detectedcurrentowner()/initdetected()/moredetected()/nextdetected().

Returns
-------
TopoDS_Shape
") DetectedCurrentShape;
		const TopoDS_Shape DetectedCurrentShape();

		/****************** DetectedInteractive ******************/
		/**** md5 signature: b0bed930b69f468285a023bd6f872239 ****/
		%feature("compactdefaultargs") DetectedInteractive;
		%feature("autodoc", "Returns the interactive objects last detected in context. in general this is just a wrapper for opencascade::handle<ais_interactiveobject>::downcast(detectedowner()->selectable()). @sa detectedowner().

Returns
-------
opencascade::handle<AIS_InteractiveObject>
") DetectedInteractive;
		opencascade::handle<AIS_InteractiveObject> DetectedInteractive();

		/****************** DetectedOwner ******************/
		/**** md5 signature: e2c982281c31eda113b04938de464319 ****/
		%feature("compactdefaultargs") DetectedOwner;
		%feature("autodoc", "Returns the owner of the detected sensitive primitive which is currently dynamically highlighted. warning! this method is irrelevant to initdetected()/moredetected()/nextdetected(). @sa hasdetected()/hasnextdetected()/hilightpreviousdetected()/hilightnextdetected().

Returns
-------
opencascade::handle<SelectMgr_EntityOwner>
") DetectedOwner;
		const opencascade::handle<SelectMgr_EntityOwner> & DetectedOwner();

		/****************** DetectedShape ******************/
		/**** md5 signature: f9c1d6b6d8e786aa2886d569920b8fa0 ****/
		%feature("compactdefaultargs") DetectedShape;
		%feature("autodoc", "Returns the shape detected in local context. @sa detectedowner().

Returns
-------
TopoDS_Shape
") DetectedShape;
		const TopoDS_Shape DetectedShape();

		/****************** DeviationAngle ******************/
		/**** md5 signature: 508af72f994b69f958301c949bd7776d ****/
		%feature("compactdefaultargs") DeviationAngle;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") DeviationAngle;
		Standard_Real DeviationAngle();

		/****************** DeviationCoefficient ******************/
		/**** md5 signature: 9c4d7eea432c70a83c2882b4c26bcbec ****/
		%feature("compactdefaultargs") DeviationCoefficient;
		%feature("autodoc", "Returns the deviation coefficient. drawings of curves or patches are made with respect to a maximal chordal deviation. a deviation coefficient is used in the shading display mode. the shape is seen decomposed into triangles. these are used to calculate reflection of light from the surface of the object. the triangles are formed from chords of the curves in the shape. the deviation coefficient gives the highest value of the angle with which a chord can deviate from a tangent to a curve. if this limit is reached, a new triangle is begun. this deviation is absolute and is set through prs3d_drawer::setmaximalchordialdeviation. the default value is 0.001. in drawing shapes, however, you are allowed to ask for a relative deviation. this deviation will be: sizeofobject * deviationcoefficient.

Returns
-------
float
") DeviationCoefficient;
		Standard_Real DeviationCoefficient();

		/****************** DisableDrawHiddenLine ******************/
		/**** md5 signature: 3fc2c3cfd86c41638b1fc12d3405a6bc ****/
		%feature("compactdefaultargs") DisableDrawHiddenLine;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") DisableDrawHiddenLine;
		void DisableDrawHiddenLine();

		/****************** Disconnect ******************/
		/**** md5 signature: 528774f6c6d5fd969edecd2c6f010a95 ****/
		%feature("compactdefaultargs") Disconnect;
		%feature("autodoc", "Disconnects theobjtodisconnect from theassembly and removes dependent selection structures.

Parameters
----------
theAssembly: AIS_InteractiveObject
theObjToDisconnect: AIS_InteractiveObject,optional
	default value is NULL

Returns
-------
None
") Disconnect;
		void Disconnect(const opencascade::handle<AIS_InteractiveObject> & theAssembly, const opencascade::handle<AIS_InteractiveObject> & theObjToDisconnect = NULL);

		/****************** Display ******************/
		/**** md5 signature: 884ed94525df7c45cb1fa54e5a35ba76 ****/
		%feature("compactdefaultargs") Display;
		%feature("autodoc", "Displays the object in this context using default display mode. this will be the object's default display mode, if there is one. otherwise, it will be the context mode. the interactive object's default selection mode is activated if getautoactivateselection() is true. in general, this is 0.

Parameters
----------
theIObj: AIS_InteractiveObject
theToUpdateViewer: bool

Returns
-------
None
") Display;
		void Display(const opencascade::handle<AIS_InteractiveObject> & theIObj, const Standard_Boolean theToUpdateViewer);

		/****************** Display ******************/
		/**** md5 signature: ef545bdb5680ab97c00d3bcc914c2f94 ****/
		%feature("compactdefaultargs") Display;
		%feature("autodoc", "Sets status, display mode and selection mode for specified object if theselectionmode equals -1, theiobj will not be activated: it will be displayed but will not be selectable.

Parameters
----------
theIObj: AIS_InteractiveObject
theDispMode: int
theSelectionMode: int
theToUpdateViewer: bool
theDispStatus: AIS_DisplayStatus,optional
	default value is AIS_DS_None

Returns
-------
None
") Display;
		void Display(const opencascade::handle<AIS_InteractiveObject> & theIObj, const Standard_Integer theDispMode, const Standard_Integer theSelectionMode, const Standard_Boolean theToUpdateViewer, const AIS_DisplayStatus theDispStatus = AIS_DS_None);

		/****************** Display ******************/
		/**** md5 signature: 65b510998a253649cd991f6bf670b1e3 ****/
		%feature("compactdefaultargs") Display;
		%feature("autodoc", "No available documentation.

Parameters
----------
theIObj: AIS_InteractiveObject
theDispMode: int
theSelectionMode: int
theToUpdateViewer: bool
theToAllowDecomposition: bool
theDispStatus: AIS_DisplayStatus,optional
	default value is AIS_DS_None

Returns
-------
None
") Display;
		void Display(const opencascade::handle<AIS_InteractiveObject> & theIObj, const Standard_Integer theDispMode, const Standard_Integer theSelectionMode, const Standard_Boolean theToUpdateViewer, const Standard_Boolean theToAllowDecomposition, const AIS_DisplayStatus theDispStatus = AIS_DS_None);

		/****************** DisplayActiveSensitive ******************/
		/**** md5 signature: 3e2889a461702eed5abdf967dcfcfd6c ****/
		%feature("compactdefaultargs") DisplayActiveSensitive;
		%feature("autodoc", "Visualization of sensitives - for debugging purposes!.

Parameters
----------
aView: V3d_View

Returns
-------
None
") DisplayActiveSensitive;
		void DisplayActiveSensitive(const opencascade::handle<V3d_View> & aView);

		/****************** DisplayActiveSensitive ******************/
		/**** md5 signature: 3aede03c6608a0f4e195960113404d0e ****/
		%feature("compactdefaultargs") DisplayActiveSensitive;
		%feature("autodoc", "Visualization of sensitives - for debugging purposes!.

Parameters
----------
anObject: AIS_InteractiveObject
aView: V3d_View

Returns
-------
None
") DisplayActiveSensitive;
		void DisplayActiveSensitive(const opencascade::handle<AIS_InteractiveObject> & anObject, const opencascade::handle<V3d_View> & aView);

		/****************** DisplayAll ******************/
		/**** md5 signature: ba71b3275c7e104b6dd9f109fe7e9d88 ****/
		%feature("compactdefaultargs") DisplayAll;
		%feature("autodoc", "Displays all hidden objects.

Parameters
----------
theToUpdateViewer: bool

Returns
-------
None
") DisplayAll;
		void DisplayAll(const Standard_Boolean theToUpdateViewer);

		/****************** DisplayMode ******************/
		/**** md5 signature: 87ab8eae5ccb1d4f4dfd02dc34d6febc ****/
		%feature("compactdefaultargs") DisplayMode;
		%feature("autodoc", "Returns the display mode setting to be used by default.

Returns
-------
int
") DisplayMode;
		Standard_Integer DisplayMode();

		/****************** DisplayPriority ******************/
		/**** md5 signature: c3d8c29f8000764afe6d1d744631698f ****/
		%feature("compactdefaultargs") DisplayPriority;
		%feature("autodoc", "Returns the display priority of the object.

Parameters
----------
theIObj: AIS_InteractiveObject

Returns
-------
int
") DisplayPriority;
		Standard_Integer DisplayPriority(const opencascade::handle<AIS_InteractiveObject> & theIObj);

		/****************** DisplaySelected ******************/
		/**** md5 signature: 6981bcb57104e11b8ce741613e585a41 ****/
		%feature("compactdefaultargs") DisplaySelected;
		%feature("autodoc", "Displays current objects.

Parameters
----------
theToUpdateViewer: bool

Returns
-------
None
") DisplaySelected;
		void DisplaySelected(const Standard_Boolean theToUpdateViewer);

		/****************** DisplayStatus ******************/
		/**** md5 signature: 2c3ee8144ab209b024b7cd0ee5b3e9dc ****/
		%feature("compactdefaultargs") DisplayStatus;
		%feature("autodoc", "Returns the display status of the entity aniobj. this will be one of the following: - ais_ds_displayed displayed in main viewer - ais_ds_erased hidden in main viewer - ais_ds_temporary temporarily displayed - ais_ds_none nowhere displayed.

Parameters
----------
anIobj: AIS_InteractiveObject

Returns
-------
AIS_DisplayStatus
") DisplayStatus;
		AIS_DisplayStatus DisplayStatus(const opencascade::handle<AIS_InteractiveObject> & anIobj);

		/****************** DisplayedObjects ******************/
		/**** md5 signature: 2ac371de0991b7c60d0ec9d3cdc39d6c ****/
		%feature("compactdefaultargs") DisplayedObjects;
		%feature("autodoc", "Returns the list of displayed objects of a particular type whichkind and signature whichsignature. by default, whichsignature equals -1. this means that there is a check on type only.

Parameters
----------
aListOfIO: AIS_ListOfInteractive

Returns
-------
None
") DisplayedObjects;
		void DisplayedObjects(AIS_ListOfInteractive & aListOfIO);

		/****************** DisplayedObjects ******************/
		/**** md5 signature: e13aa22fbebdae8b832b7fe1e5a85dda ****/
		%feature("compactdefaultargs") DisplayedObjects;
		%feature("autodoc", "Gives the list of displayed objects of a particular type and signature. by default, <whichsignature> = -1 means control only on <whichkind>.

Parameters
----------
theWhichKind: AIS_KindOfInteractive
theWhichSignature: int
theListOfIO: AIS_ListOfInteractive

Returns
-------
None
") DisplayedObjects;
		void DisplayedObjects(const AIS_KindOfInteractive theWhichKind, const Standard_Integer theWhichSignature, AIS_ListOfInteractive & theListOfIO);

		/****************** DrawHiddenLine ******************/
		/**** md5 signature: ee867d8bc869aae190f7ad2dd51ea119 ****/
		%feature("compactdefaultargs") DrawHiddenLine;
		%feature("autodoc", "Returns standard_true if the hidden lines are to be drawn. by default the hidden lines are not drawn.

Returns
-------
bool
") DrawHiddenLine;
		Standard_Boolean DrawHiddenLine();

		/****************** EnableDrawHiddenLine ******************/
		/**** md5 signature: 7c98158946b8428a204c851de2124594 ****/
		%feature("compactdefaultargs") EnableDrawHiddenLine;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") EnableDrawHiddenLine;
		void EnableDrawHiddenLine();

		/****************** EndImmediateDraw ******************/
		/**** md5 signature: d412b785cf73f80c6e408fe57fdcaa1e ****/
		%feature("compactdefaultargs") EndImmediateDraw;
		%feature("autodoc", "Returns true if the immediate display has been done.

Parameters
----------
theView: V3d_View

Returns
-------
bool
") EndImmediateDraw;
		Standard_Boolean EndImmediateDraw(const opencascade::handle<V3d_View> & theView);

		/****************** EndImmediateDraw ******************/
		/**** md5 signature: 817e9310dd497bb5350d7d89a7805025 ****/
		%feature("compactdefaultargs") EndImmediateDraw;
		%feature("autodoc", "Uses the first active view of main viewer! returns true if the immediate display has been done.

Returns
-------
bool
") EndImmediateDraw;
		Standard_Boolean EndImmediateDraw();

		/****************** Erase ******************/
		/**** md5 signature: 969438c38739175fcb7c0c4c75b922fb ****/
		%feature("compactdefaultargs") Erase;
		%feature("autodoc", "Hides the object. the object's presentations are simply flagged as invisible and therefore excluded from redrawing. to show hidden objects, use display().

Parameters
----------
theIObj: AIS_InteractiveObject
theToUpdateViewer: bool

Returns
-------
None
") Erase;
		void Erase(const opencascade::handle<AIS_InteractiveObject> & theIObj, const Standard_Boolean theToUpdateViewer);

		/****************** EraseAll ******************/
		/**** md5 signature: 5b33d1ce278b256afd7b4948a73d39cd ****/
		%feature("compactdefaultargs") EraseAll;
		%feature("autodoc", "Hides all objects. the object's presentations are simply flagged as invisible and therefore excluded from redrawing. to show all hidden objects, use displayall().

Parameters
----------
theToUpdateViewer: bool

Returns
-------
None
") EraseAll;
		void EraseAll(const Standard_Boolean theToUpdateViewer);

		/****************** EraseSelected ******************/
		/**** md5 signature: c049d06d34cae1cc7285391e7aeb3e9b ****/
		%feature("compactdefaultargs") EraseSelected;
		%feature("autodoc", "Hides selected objects. the object's presentations are simply flagged as invisible and therefore excluded from redrawing. to show hidden objects, use display().

Parameters
----------
theToUpdateViewer: bool

Returns
-------
None
") EraseSelected;
		void EraseSelected(const Standard_Boolean theToUpdateViewer);

		/****************** ErasedObjects ******************/
		/**** md5 signature: fba807be656c8be6c28360b3dee631c5 ****/
		%feature("compactdefaultargs") ErasedObjects;
		%feature("autodoc", "Returns the list thelistofio of erased objects (hidden objects) particular type whichkind and signature whichsignature. by default, whichsignature equals 1. this means that there is a check on type only.

Parameters
----------
theListOfIO: AIS_ListOfInteractive

Returns
-------
None
") ErasedObjects;
		void ErasedObjects(AIS_ListOfInteractive & theListOfIO);

		/****************** ErasedObjects ******************/
		/**** md5 signature: d02164fb2a78fbf0cad653c1922f6452 ****/
		%feature("compactdefaultargs") ErasedObjects;
		%feature("autodoc", "Gives the list of erased objects (hidden objects) type and signature by default, <whichsignature> = -1 means control only on <whichkind>.

Parameters
----------
theWhichKind: AIS_KindOfInteractive
theWhichSignature: int
theListOfIO: AIS_ListOfInteractive

Returns
-------
None
") ErasedObjects;
		void ErasedObjects(const AIS_KindOfInteractive theWhichKind, const Standard_Integer theWhichSignature, AIS_ListOfInteractive & theListOfIO);

		/****************** Filters ******************/
		/**** md5 signature: 3fdc80dd75c17b43e3b22bec55f591f0 ****/
		%feature("compactdefaultargs") Filters;
		%feature("autodoc", "Returns the list of filters active in a local context.

Returns
-------
SelectMgr_ListOfFilter
") Filters;
		const SelectMgr_ListOfFilter & Filters();

		/****************** FirstSelectedObject ******************/
		/**** md5 signature: b2acdd4c911cfcbaab84d9d6a86cd9a5 ****/
		%feature("compactdefaultargs") FirstSelectedObject;
		%feature("autodoc", "Returns the first selected object in the list of current selected.

Returns
-------
opencascade::handle<AIS_InteractiveObject>
") FirstSelectedObject;
		opencascade::handle<AIS_InteractiveObject> FirstSelectedObject();

		/****************** FitSelected ******************/
		/**** md5 signature: 35039067e64419ba27be322de4475534 ****/
		%feature("compactdefaultargs") FitSelected;
		%feature("autodoc", "Fits the view correspondingly to the bounds of selected objects. infinite objects are ignored if infinite state of ais_interactiveobject is set to true.

Parameters
----------
theView: V3d_View
theMargin: float
theToUpdate: bool

Returns
-------
None
") FitSelected;
		void FitSelected(const opencascade::handle<V3d_View> & theView, const Standard_Real theMargin, const Standard_Boolean theToUpdate);

		/****************** FitSelected ******************/
		/**** md5 signature: fac92c7e203e7b23d7c9d8470d938941 ****/
		%feature("compactdefaultargs") FitSelected;
		%feature("autodoc", "Fits the view correspondingly to the bounds of selected objects. infinite objects are ignored if infinite state of ais_interactiveobject is set to true.

Parameters
----------
theView: V3d_View

Returns
-------
None
") FitSelected;
		void FitSelected(const opencascade::handle<V3d_View> & theView);

		/****************** GetAutoActivateSelection ******************/
		/**** md5 signature: a611232040c566e34ca8670e7ea16a71 ****/
		%feature("compactdefaultargs") GetAutoActivateSelection;
		%feature("autodoc", "Manages displaying the new object should also automatically activate default selection mode; true by default.

Returns
-------
bool
") GetAutoActivateSelection;
		Standard_Boolean GetAutoActivateSelection();

		/****************** GetZLayer ******************/
		/**** md5 signature: fc7034555b0d116eef6c19ec38f9deca ****/
		%feature("compactdefaultargs") GetZLayer;
		%feature("autodoc", "Get z layer id set for displayed interactive object.

Parameters
----------
theIObj: AIS_InteractiveObject

Returns
-------
Graphic3d_ZLayerId
") GetZLayer;
		Graphic3d_ZLayerId GetZLayer(const opencascade::handle<AIS_InteractiveObject> & theIObj);

		/****************** GravityPoint ******************/
		/**** md5 signature: 61432a855a261dfe994f834c87d91d2a ****/
		%feature("compactdefaultargs") GravityPoint;
		%feature("autodoc", "Return rotation gravity point.

Parameters
----------
theView: V3d_View

Returns
-------
gp_Pnt
") GravityPoint;
		virtual gp_Pnt GravityPoint(const opencascade::handle<V3d_View> & theView);

		/****************** HLRAngle ******************/
		/**** md5 signature: 8718623bb4ce2a6c7eec9f2615f1958a ****/
		%feature("compactdefaultargs") HLRAngle;
		%feature("autodoc", "Returns the real number value of the deviation angle in hidden line removal views in this interactive context. the default value is 20*pi/180.

Returns
-------
float
") HLRAngle;
		Standard_Real HLRAngle();

		/****************** HLRDeviationCoefficient ******************/
		/**** md5 signature: 1a0f4440c53293bc4465e0027431f5cf ****/
		%feature("compactdefaultargs") HLRDeviationCoefficient;
		%feature("autodoc", "Returns the real number value of the hidden line removal deviation coefficient. a deviation coefficient is used in the shading display mode. the shape is seen decomposed into triangles. these are used to calculate reflection of light from the surface of the object. the triangles are formed from chords of the curves in the shape. the deviation coefficient give the highest value of the angle with which a chord can deviate from a tangent to a curve. if this limit is reached, a new triangle is begun. to find the hidden lines, hidden line display mode entails recalculation of the view at each different projector perspective. because hidden lines entail calculations of more than usual complexity to decompose them into these triangles, a deviation coefficient allowing greater tolerance is used. this increases efficiency in calculation. the default value is 0.02.

Returns
-------
float
") HLRDeviationCoefficient;
		Standard_Real HLRDeviationCoefficient();

		/****************** HasApplicative ******************/
		/**** md5 signature: 60d05f5258a04bb60710b49cfc48cf5a ****/
		%feature("compactdefaultargs") HasApplicative;
		%feature("autodoc", "Returns selectedinteractive()->hasowner(). @sa selectedowner().

Returns
-------
bool
") HasApplicative;
		Standard_Boolean HasApplicative();

		/****************** HasColor ******************/
		/**** md5 signature: cc8dd25fdc35e31043976e96be57d5b9 ****/
		%feature("compactdefaultargs") HasColor;
		%feature("autodoc", "Returns true if a view of the interactive object has color.

Parameters
----------
aniobj: AIS_InteractiveObject

Returns
-------
bool
") HasColor;
		Standard_Boolean HasColor(const opencascade::handle<AIS_InteractiveObject> & aniobj);

		/****************** HasDetected ******************/
		/**** md5 signature: 9784833ccfaab525e30c79edfbe72190 ****/
		%feature("compactdefaultargs") HasDetected;
		%feature("autodoc", "Returns true if there is a mouse-detected entity in context. @sa detectedowner()/hasnextdetected()/hilightpreviousdetected()/hilightnextdetected().

Returns
-------
bool
") HasDetected;
		Standard_Boolean HasDetected();

		/****************** HasDetectedShape ******************/
		/**** md5 signature: d2fb3a69e46a45ed0edd4bafb59b8257 ****/
		%feature("compactdefaultargs") HasDetectedShape;
		%feature("autodoc", "Returns true if there is a detected shape in local context. @sa hasdetected()/detectedshape().

Returns
-------
bool
") HasDetectedShape;
		Standard_Boolean HasDetectedShape();

		/****************** HasLocation ******************/
		/**** md5 signature: 015cfc324c92fd00be4aef64c25f24d2 ****/
		%feature("compactdefaultargs") HasLocation;
		%feature("autodoc", "Returns true if the object has a location.

Parameters
----------
theObject: AIS_InteractiveObject

Returns
-------
bool
") HasLocation;
		Standard_Boolean HasLocation(const opencascade::handle<AIS_InteractiveObject> & theObject);

		/****************** HasNextDetected ******************/
		/**** md5 signature: 7a28caee8124c59c13fd939c4f7e2c47 ****/
		%feature("compactdefaultargs") HasNextDetected;
		%feature("autodoc", "Returns true if other entities were detected in the last mouse detection @sa hilightpreviousdetected()/hilightnextdetected().

Returns
-------
bool
") HasNextDetected;
		Standard_Boolean HasNextDetected();

		/****************** HasPolygonOffsets ******************/
		/**** md5 signature: 40f0ecc7de3c38df2fa3453b26a4dff0 ****/
		%feature("compactdefaultargs") HasPolygonOffsets;
		%feature("autodoc", "Simply calls ais_interactiveobject::haspolygonoffsets().

Parameters
----------
anObj: AIS_InteractiveObject

Returns
-------
bool
") HasPolygonOffsets;
		Standard_Boolean HasPolygonOffsets(const opencascade::handle<AIS_InteractiveObject> & anObj);

		/****************** HasSelectedShape ******************/
		/**** md5 signature: 490f9e8372b8aa45e061a56a47cd4fa4 ****/
		%feature("compactdefaultargs") HasSelectedShape;
		%feature("autodoc", "Returns true if the interactive context has a shape selected. @sa selectedshape().

Returns
-------
bool
") HasSelectedShape;
		Standard_Boolean HasSelectedShape();

		/****************** HiddenLineAspect ******************/
		/**** md5 signature: 2194dc9305a8d04891ff31b2c7d09c8d ****/
		%feature("compactdefaultargs") HiddenLineAspect;
		%feature("autodoc", "Initializes hidden line aspect in the default drawing tool, or drawer. the default values are: color: quantity_noc_yellow type of line: aspect_tol_dash width: 1.

Returns
-------
opencascade::handle<Prs3d_LineAspect>
") HiddenLineAspect;
		opencascade::handle<Prs3d_LineAspect> HiddenLineAspect();

		/****************** HighlightStyle ******************/
		/**** md5 signature: 2cb78034dd0075f5760ff6947175afbf ****/
		%feature("compactdefaultargs") HighlightStyle;
		%feature("autodoc", "Returns highlight style settings.

Parameters
----------
theStyleType: Prs3d_TypeOfHighlight

Returns
-------
opencascade::handle<Prs3d_Drawer>
") HighlightStyle;
		const opencascade::handle<Prs3d_Drawer> & HighlightStyle(const Prs3d_TypeOfHighlight theStyleType);

		/****************** HighlightStyle ******************/
		/**** md5 signature: a5e55eefe6df1b6a11e0c9a34f35e9be ****/
		%feature("compactdefaultargs") HighlightStyle;
		%feature("autodoc", "Returns current dynamic highlight style settings. by default: - the color of dynamic highlight is quantity_noc_cyan1; - the presentation for dynamic highlight is completely opaque; - the type of highlight is aspect_tohm_color.

Returns
-------
opencascade::handle<Prs3d_Drawer>
") HighlightStyle;
		const opencascade::handle<Prs3d_Drawer> & HighlightStyle();

		/****************** HighlightStyle ******************/
		/**** md5 signature: 77c11de0b93da91ba5c484b3b8f5f1ce ****/
		%feature("compactdefaultargs") HighlightStyle;
		%feature("autodoc", "Returns highlight style of the object if it is marked as highlighted via global status @param theobj [in] the object to check.

Parameters
----------
theObj: AIS_InteractiveObject
theStyle: Prs3d_Drawer

Returns
-------
bool
") HighlightStyle;
		Standard_Boolean HighlightStyle(const opencascade::handle<AIS_InteractiveObject> & theObj, opencascade::handle<Prs3d_Drawer> & theStyle);

		/****************** HighlightStyle ******************/
		/**** md5 signature: 67e112908a1146ebe2626616c583fce2 ****/
		%feature("compactdefaultargs") HighlightStyle;
		%feature("autodoc", "Returns highlight style of the owner if it is selected @param theowner [in] the owner to check.

Parameters
----------
theOwner: SelectMgr_EntityOwner
theStyle: Prs3d_Drawer

Returns
-------
bool
") HighlightStyle;
		Standard_Boolean HighlightStyle(const opencascade::handle<SelectMgr_EntityOwner> & theOwner, opencascade::handle<Prs3d_Drawer> & theStyle);

		/****************** Hilight ******************/
		/**** md5 signature: e4baa3152e7a2a38dd2e68bd6f2939aa ****/
		%feature("compactdefaultargs") Hilight;
		%feature("autodoc", "Updates the display in the viewer to take dynamic detection into account. on dynamic detection by the mouse cursor, sensitive primitives are highlighted. the highlight color of entities detected by mouse movement is white by default.

Parameters
----------
theObj: AIS_InteractiveObject
theIsToUpdateViewer: bool

Returns
-------
None
") Hilight;
		void Hilight(const opencascade::handle<AIS_InteractiveObject> & theObj, const Standard_Boolean theIsToUpdateViewer);

		/****************** HilightCurrents ******************/
		/**** md5 signature: cab78712012415a0a9c1a56c5790e3ed ****/
		%feature("compactdefaultargs") HilightCurrents;
		%feature("autodoc", "Highlights current objects. objects selected when there is no open local context are called current objects; those selected in open local context, selected objects.

Parameters
----------
theToUpdateViewer: bool

Returns
-------
None
") HilightCurrents;
		void HilightCurrents(const Standard_Boolean theToUpdateViewer);

		/****************** HilightNextDetected ******************/
		/**** md5 signature: 9c05abb0fa3776e9813bee557372d755 ****/
		%feature("compactdefaultargs") HilightNextDetected;
		%feature("autodoc", "If more than 1 object is detected by the selector, only the 'best' owner is hilighted at the mouse position. this method allows the user to hilight one after another the other detected entities. if the method select is called, the selected entity will be the hilighted one! warning: loop method. when all the detected entities have been hilighted, the next call will hilight the first one again. returns the rank of hilighted entity @sa hasnextdetected()/hilightpreviousdetected().

Parameters
----------
theView: V3d_View
theToRedrawImmediate: bool,optional
	default value is Standard_True

Returns
-------
int
") HilightNextDetected;
		Standard_Integer HilightNextDetected(const opencascade::handle<V3d_View> & theView, const Standard_Boolean theToRedrawImmediate = Standard_True);

		/****************** HilightPreviousDetected ******************/
		/**** md5 signature: 262cae5bc6c5467cc4d7bc8c48f38ba0 ****/
		%feature("compactdefaultargs") HilightPreviousDetected;
		%feature("autodoc", "Same as previous methods in reverse direction. @sa hasnextdetected()/hilightnextdetected().

Parameters
----------
theView: V3d_View
theToRedrawImmediate: bool,optional
	default value is Standard_True

Returns
-------
int
") HilightPreviousDetected;
		Standard_Integer HilightPreviousDetected(const opencascade::handle<V3d_View> & theView, const Standard_Boolean theToRedrawImmediate = Standard_True);

		/****************** HilightSelected ******************/
		/**** md5 signature: fbae34d3611ad95d43225055edcfeb6c ****/
		%feature("compactdefaultargs") HilightSelected;
		%feature("autodoc", "Highlights selected objects.

Parameters
----------
theToUpdateViewer: bool

Returns
-------
None
") HilightSelected;
		void HilightSelected(const Standard_Boolean theToUpdateViewer);

		/****************** HilightWithColor ******************/
		/**** md5 signature: 39c928c522f658b4bc35ad09476c370b ****/
		%feature("compactdefaultargs") HilightWithColor;
		%feature("autodoc", "Changes the color of all the lines of the object in view.

Parameters
----------
theObj: AIS_InteractiveObject
theStyle: Prs3d_Drawer
theToUpdateViewer: bool

Returns
-------
None
") HilightWithColor;
		void HilightWithColor(const opencascade::handle<AIS_InteractiveObject> & theObj, const opencascade::handle<Prs3d_Drawer> & theStyle, const Standard_Boolean theToUpdateViewer);

		/****************** ImmediateAdd ******************/
		/**** md5 signature: f1c6cfe88d67fef4d99d5d59f858679d ****/
		%feature("compactdefaultargs") ImmediateAdd;
		%feature("autodoc", "Returns true if <aniobj> has been stored in the list.

Parameters
----------
theObj: AIS_InteractiveObject
theMode: int,optional
	default value is 0

Returns
-------
bool
") ImmediateAdd;
		Standard_Boolean ImmediateAdd(const opencascade::handle<AIS_InteractiveObject> & theObj, const Standard_Integer theMode = 0);

		/****************** InitCurrent ******************/
		/**** md5 signature: 3be01264f20faf11fcd664c48a8a4660 ****/
		%feature("compactdefaultargs") InitCurrent;
		%feature("autodoc", "Initializes a scan of the current selected objects in neutral point. objects selected when there is no open local context are called current objects; those selected in open local context, selected objects.

Returns
-------
None
") InitCurrent;
		void InitCurrent();

		/****************** InitDetected ******************/
		/**** md5 signature: c8e093453ccb47b93fdb3539272d695f ****/
		%feature("compactdefaultargs") InitDetected;
		%feature("autodoc", "Initialization for iteration through mouse-detected objects in interactive context or in local context if it is opened. @sa detectedcurrentowner()/moredetected()/nextdetected().

Returns
-------
None
") InitDetected;
		void InitDetected();

		/****************** InitSelected ******************/
		/**** md5 signature: 5a647272f34af26ffd1cb3083091517d ****/
		%feature("compactdefaultargs") InitSelected;
		%feature("autodoc", "Initializes a scan of the selected objects. @sa selectedowner()/moreselected()/nextselected().

Returns
-------
None
") InitSelected;
		void InitSelected();

		/****************** IsCurrent ******************/
		/**** md5 signature: 2c28b7fccf52ba48ec1ee035f561df97 ****/
		%feature("compactdefaultargs") IsCurrent;
		%feature("autodoc", "Returns true if there is a non-null interactive object in neutral point. objects selected when there is no open local context are called current objects; those selected in open local context, selected objects.

Parameters
----------
theObject: AIS_InteractiveObject

Returns
-------
bool
") IsCurrent;
		Standard_Boolean IsCurrent(const opencascade::handle<AIS_InteractiveObject> & theObject);

		/****************** IsDisplayed ******************/
		/**** md5 signature: ecf149ce37d3b960446b93fc86709fc3 ****/
		%feature("compactdefaultargs") IsDisplayed;
		%feature("autodoc", "Returns true if object is displayed in the interactive context.

Parameters
----------
anIobj: AIS_InteractiveObject

Returns
-------
bool
") IsDisplayed;
		Standard_Boolean IsDisplayed(const opencascade::handle<AIS_InteractiveObject> & anIobj);

		/****************** IsDisplayed ******************/
		/**** md5 signature: a1ae8679353cd72804eb499d4aee8ded ****/
		%feature("compactdefaultargs") IsDisplayed;
		%feature("autodoc", "No available documentation.

Parameters
----------
aniobj: AIS_InteractiveObject
aMode: int

Returns
-------
bool
") IsDisplayed;
		Standard_Boolean IsDisplayed(const opencascade::handle<AIS_InteractiveObject> & aniobj, const Standard_Integer aMode);

		/****************** IsHilighted ******************/
		/**** md5 signature: b43be3c44fd163fff4750f33b968090a ****/
		%feature("compactdefaultargs") IsHilighted;
		%feature("autodoc", "Returns true if the object is marked as highlighted via its global status @param theobj [in] the object to check.

Parameters
----------
theObj: AIS_InteractiveObject

Returns
-------
bool
") IsHilighted;
		Standard_Boolean IsHilighted(const opencascade::handle<AIS_InteractiveObject> & theObj);

		/****************** IsHilighted ******************/
		/**** md5 signature: 5d7918d872a09248c3b801d85db8a988 ****/
		%feature("compactdefaultargs") IsHilighted;
		%feature("autodoc", "Returns true if the owner is marked as selected @param theowner [in] the owner to check.

Parameters
----------
theOwner: SelectMgr_EntityOwner

Returns
-------
bool
") IsHilighted;
		Standard_Boolean IsHilighted(const opencascade::handle<SelectMgr_EntityOwner> & theOwner);

		/****************** IsImmediateModeOn ******************/
		/**** md5 signature: 802f25d07bc3216afed5043bb5a75130 ****/
		%feature("compactdefaultargs") IsImmediateModeOn;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsImmediateModeOn;
		Standard_Boolean IsImmediateModeOn();

		/****************** IsSelected ******************/
		/**** md5 signature: e7bf93b9da84e840c50f69967794905c ****/
		%feature("compactdefaultargs") IsSelected;
		%feature("autodoc", "Returns true is the owner given is selected.

Parameters
----------
theOwner: SelectMgr_EntityOwner

Returns
-------
bool
") IsSelected;
		Standard_Boolean IsSelected(const opencascade::handle<SelectMgr_EntityOwner> & theOwner);

		/****************** IsSelected ******************/
		/**** md5 signature: d7dd3e491d524a532b0124af17ea19cf ****/
		%feature("compactdefaultargs") IsSelected;
		%feature("autodoc", "Returns true is the object given is selected.

Parameters
----------
theObj: AIS_InteractiveObject

Returns
-------
bool
") IsSelected;
		Standard_Boolean IsSelected(const opencascade::handle<AIS_InteractiveObject> & theObj);

		/****************** IsoNumber ******************/
		/**** md5 signature: 67c6591eeef40686da48e9c8279f7db4 ****/
		%feature("compactdefaultargs") IsoNumber;
		%feature("autodoc", "Returns the number of u and v isoparameters displayed.

Parameters
----------
WhichIsos: AIS_TypeOfIso,optional
	default value is AIS_TOI_Both

Returns
-------
int
") IsoNumber;
		Standard_Integer IsoNumber(const AIS_TypeOfIso WhichIsos = AIS_TOI_Both);

		/****************** IsoOnPlane ******************/
		/**** md5 signature: 44f2fd1c20ce3c1811c498bdca672c1e ****/
		%feature("compactdefaultargs") IsoOnPlane;
		%feature("autodoc", "Returns true if drawing isoparameters on planes is enabled.

Parameters
----------
SwitchOn: bool

Returns
-------
None
") IsoOnPlane;
		void IsoOnPlane(const Standard_Boolean SwitchOn);

		/****************** IsoOnPlane ******************/
		/**** md5 signature: 2399069013e2297195a97f40a31fdec3 ****/
		%feature("compactdefaultargs") IsoOnPlane;
		%feature("autodoc", "Returns true if drawing isoparameters on planes is enabled. if <foruisos> = false,.

Returns
-------
bool
") IsoOnPlane;
		Standard_Boolean IsoOnPlane();

		/****************** IsoOnTriangulation ******************/
		/**** md5 signature: 6c6b851432f9c77e0d427b8894d13702 ****/
		%feature("compactdefaultargs") IsoOnTriangulation;
		%feature("autodoc", "Enables or disables on-triangulation build for isolines for a particular object. in case if on-triangulation builder is disabled, default on-plane builder will compute isolines for the object given.

Parameters
----------
theIsEnabled: bool
theObject: AIS_InteractiveObject

Returns
-------
None
") IsoOnTriangulation;
		void IsoOnTriangulation(const Standard_Boolean theIsEnabled, const opencascade::handle<AIS_InteractiveObject> & theObject);

		/****************** IsoOnTriangulation ******************/
		/**** md5 signature: 4ed3479d463d2bbfc2b72917813f3b3b ****/
		%feature("compactdefaultargs") IsoOnTriangulation;
		%feature("autodoc", "Enables or disables on-triangulation build for isolines for default drawer. in case if on-triangulation builder is disabled, default on-plane builder will compute isolines for the object given.

Parameters
----------
theToSwitchOn: bool

Returns
-------
None
") IsoOnTriangulation;
		void IsoOnTriangulation(const Standard_Boolean theToSwitchOn);

		/****************** IsoOnTriangulation ******************/
		/**** md5 signature: 35291a4239d94266e0d7a4a8b135deb7 ****/
		%feature("compactdefaultargs") IsoOnTriangulation;
		%feature("autodoc", "Returns true if drawing isolines on triangulation algorithm is enabled.

Returns
-------
bool
") IsoOnTriangulation;
		Standard_Boolean IsoOnTriangulation();

		/****************** LastActiveView ******************/
		/**** md5 signature: 917b175d2fccb1c48372a3e9d347f6f4 ****/
		%feature("compactdefaultargs") LastActiveView;
		%feature("autodoc", "Returns last active view (argument of moveto()/select() methods).

Returns
-------
opencascade::handle<V3d_View>
") LastActiveView;
		opencascade::handle<V3d_View> LastActiveView();

		/****************** Load ******************/
		/**** md5 signature: 1613cc105e3d94428049dd01e84bdcec ****/
		%feature("compactdefaultargs") Load;
		%feature("autodoc", "Allows you to load the interactive object with a given selection mode, and/or with the desired decomposition option, whether the object is visualized or not. the loaded objects will be selectable but displayable in highlighting only when detected by the selector.

Parameters
----------
theObj: AIS_InteractiveObject
theSelectionMode: int,optional
	default value is -1

Returns
-------
None
") Load;
		void Load(const opencascade::handle<AIS_InteractiveObject> & theObj, const Standard_Integer theSelectionMode = -1);

		/****************** Load ******************/
		/**** md5 signature: 4c20b3a553cb0de0cb199ecfc09410a8 ****/
		%feature("compactdefaultargs") Load;
		%feature("autodoc", "No available documentation.

Parameters
----------
theObj: AIS_InteractiveObject
theSelectionMode: int
: bool

Returns
-------
None
") Load;
		void Load(const opencascade::handle<AIS_InteractiveObject> & theObj, Standard_Integer theSelectionMode, Standard_Boolean );

		/****************** Location ******************/
		/**** md5 signature: e6bd8403c84dda3a7567f9c4cf6245fd ****/
		%feature("compactdefaultargs") Location;
		%feature("autodoc", "Returns the location of the object.

Parameters
----------
theObject: AIS_InteractiveObject

Returns
-------
TopLoc_Location
") Location;
		TopLoc_Location Location(const opencascade::handle<AIS_InteractiveObject> & theObject);

		/****************** MainPrsMgr ******************/
		/**** md5 signature: ac85fee1d90b00c3d3b7b78afe44671e ****/
		%feature("compactdefaultargs") MainPrsMgr;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<PrsMgr_PresentationManager3d>
") MainPrsMgr;
		const opencascade::handle<PrsMgr_PresentationManager3d> & MainPrsMgr();

		/****************** MainSelector ******************/
		/**** md5 signature: 324583e97a6b1f0d3b2bbf32bc96a6ef ****/
		%feature("compactdefaultargs") MainSelector;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StdSelect_ViewerSelector3d>
") MainSelector;
		const opencascade::handle<StdSelect_ViewerSelector3d> & MainSelector();

		/****************** MoreCurrent ******************/
		/**** md5 signature: 1a8720231c263e320b851a9c4ea2f693 ****/
		%feature("compactdefaultargs") MoreCurrent;
		%feature("autodoc", "Returns true if there is another object found by the scan of the list of current objects. objects selected when there is no open local context are called current objects; those selected in open local context, selected objects.

Returns
-------
bool
") MoreCurrent;
		Standard_Boolean MoreCurrent();

		/****************** MoreDetected ******************/
		/**** md5 signature: 07e8132e91725af6307db9bfd564c136 ****/
		%feature("compactdefaultargs") MoreDetected;
		%feature("autodoc", "Return true if there is more mouse-detected objects after the current one during iteration through mouse-detected interactive objects. @sa detectedcurrentowner()/initdetected()/nextdetected().

Returns
-------
bool
") MoreDetected;
		Standard_Boolean MoreDetected();

		/****************** MoreSelected ******************/
		/**** md5 signature: 9f460e4981ece0e01fad2077174757e0 ****/
		%feature("compactdefaultargs") MoreSelected;
		%feature("autodoc", "Returns true if there is another object found by the scan of the list of selected objects. @sa selectedowner()/initselected()/nextselected().

Returns
-------
bool
") MoreSelected;
		Standard_Boolean MoreSelected();

		/****************** MoveTo ******************/
		/**** md5 signature: 9c6ee0b190031604e2ad3ee603a732e4 ****/
		%feature("compactdefaultargs") MoveTo;
		%feature("autodoc", "Relays mouse position in pixels thexpix and theypix to the interactive context selectors. this is done by the view theview passing this position to the main viewer and updating it. if thetoredrawonupdate is set to false, callee should call redrawimmediate() to highlight detected object. @sa pickingstrategy().

Parameters
----------
theXPix: int
theYPix: int
theView: V3d_View
theToRedrawOnUpdate: bool

Returns
-------
AIS_StatusOfDetection
") MoveTo;
		AIS_StatusOfDetection MoveTo(const Standard_Integer theXPix, const Standard_Integer theYPix, const opencascade::handle<V3d_View> & theView, const Standard_Boolean theToRedrawOnUpdate);

		/****************** NbCurrents ******************/
		/**** md5 signature: 2bd21aea6055d1a4ef8d258c5b2a1542 ****/
		%feature("compactdefaultargs") NbCurrents;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbCurrents;
		Standard_Integer NbCurrents();

		/****************** NbSelected ******************/
		/**** md5 signature: 29cc2a3b075c044d0d4a48fbbe1b0094 ****/
		%feature("compactdefaultargs") NbSelected;
		%feature("autodoc", "Count a number of selected entities using initselected()+moreselected()+nextselected() iterator. @sa selectedowner()/initselected()/moreselected()/nextselected().

Returns
-------
int
") NbSelected;
		Standard_Integer NbSelected();

		/****************** NextCurrent ******************/
		/**** md5 signature: d0fa06bf08aae72d9d2f78c98b20d4f9 ****/
		%feature("compactdefaultargs") NextCurrent;
		%feature("autodoc", "Continues the scan to the next object in the list of current objects. objects selected when there is no open local context are called current objects; those selected in open local context, selected objects.

Returns
-------
None
") NextCurrent;
		void NextCurrent();

		/****************** NextDetected ******************/
		/**** md5 signature: 80e9abbe7c307e899704c0aa75085271 ****/
		%feature("compactdefaultargs") NextDetected;
		%feature("autodoc", "Gets next current object during iteration through mouse-detected interactive objects. @sa detectedcurrentowner()/initdetected()/moredetected().

Returns
-------
None
") NextDetected;
		void NextDetected();

		/****************** NextSelected ******************/
		/**** md5 signature: b0ac689aff47b7f0c7ffd7973ff9538f ****/
		%feature("compactdefaultargs") NextSelected;
		%feature("autodoc", "Continues the scan to the next object in the list of selected objects. @sa selectedowner()/initselected()/moreselected().

Returns
-------
None
") NextSelected;
		void NextSelected();

		/****************** ObjectsByDisplayStatus ******************/
		/**** md5 signature: 4bcd63aa892c491a7896eac1ebe4c320 ****/
		%feature("compactdefaultargs") ObjectsByDisplayStatus;
		%feature("autodoc", "Returns the list thelistofio of objects with indicated display status particular type whichkind and signature whichsignature. by default, whichsignature equals 1. this means that there is a check on type only.

Parameters
----------
theStatus: AIS_DisplayStatus
theListOfIO: AIS_ListOfInteractive

Returns
-------
None
") ObjectsByDisplayStatus;
		void ObjectsByDisplayStatus(const AIS_DisplayStatus theStatus, AIS_ListOfInteractive & theListOfIO);

		/****************** ObjectsByDisplayStatus ******************/
		/**** md5 signature: 2983aa8e8e07ff883ac47f17cda6d066 ****/
		%feature("compactdefaultargs") ObjectsByDisplayStatus;
		%feature("autodoc", "Gives the list of objects with indicated display status type and signature by default, <whichsignature> = -1 means control only on <whichkind>.

Parameters
----------
WhichKind: AIS_KindOfInteractive
WhichSignature: int
theStatus: AIS_DisplayStatus
theListOfIO: AIS_ListOfInteractive

Returns
-------
None
") ObjectsByDisplayStatus;
		void ObjectsByDisplayStatus(const AIS_KindOfInteractive WhichKind, const Standard_Integer WhichSignature, const AIS_DisplayStatus theStatus, AIS_ListOfInteractive & theListOfIO);

		/****************** ObjectsForView ******************/
		/**** md5 signature: 40843a5ed70af61c5c2068857d2e8f2d ****/
		%feature("compactdefaultargs") ObjectsForView;
		%feature("autodoc", "Query objects visible or hidden in specified view due to affinity mask.

Parameters
----------
theListOfIO: AIS_ListOfInteractive
theView: V3d_View
theIsVisibleInView: bool
theStatus: AIS_DisplayStatus,optional
	default value is AIS_DS_None

Returns
-------
None
") ObjectsForView;
		void ObjectsForView(AIS_ListOfInteractive & theListOfIO, const opencascade::handle<V3d_View> & theView, const Standard_Boolean theIsVisibleInView, const AIS_DisplayStatus theStatus = AIS_DS_None);

		/****************** ObjectsInside ******************/
		/**** md5 signature: d09ee8b48f1dd0dc665da27f01e182bd ****/
		%feature("compactdefaultargs") ObjectsInside;
		%feature("autodoc", "Fills <alistofio> with objects of a particular type and signature with no consideration of display status. by default, <whichsignature> = -1 means control only on <whichkind>. if <whichkind> = ais_koi_none and <whichsignature> = -1, all the objects are put into the list.

Parameters
----------
aListOfIO: AIS_ListOfInteractive
WhichKind: AIS_KindOfInteractive,optional
	default value is AIS_KOI_None
WhichSignature: int,optional
	default value is -1

Returns
-------
None
") ObjectsInside;
		void ObjectsInside(AIS_ListOfInteractive & aListOfIO, const AIS_KindOfInteractive WhichKind = AIS_KOI_None, const Standard_Integer WhichSignature = -1);

		/****************** PickingStrategy ******************/
		/**** md5 signature: 7ec32744d1635811c168c2b831c6636a ****/
		%feature("compactdefaultargs") PickingStrategy;
		%feature("autodoc", "Return picking strategy; selectmgr_pickingstrategy_firstacceptable by default. @sa moveto()/filters().

Returns
-------
SelectMgr_PickingStrategy
") PickingStrategy;
		SelectMgr_PickingStrategy PickingStrategy();

		/****************** PixelTolerance ******************/
		/**** md5 signature: 8078ba0406b978ded77c2e81f2ee556f ****/
		%feature("compactdefaultargs") PixelTolerance;
		%feature("autodoc", "Returns the pixel tolerance, default is 2. pixel tolerance extends sensitivity within moveto() operation (picking by point) and can be adjusted by application based on user input precision (e.g. screen pixel density, input device precision, etc.).

Returns
-------
int
") PixelTolerance;
		Standard_Integer PixelTolerance();

		/****************** PlaneSize ******************/
		/**** md5 signature: f2c01cfa4b361519aaccdf814526ddcb ****/
		%feature("compactdefaultargs") PlaneSize;
		%feature("autodoc", "Returns true if the length in the x direction xsize is the same as that in the y direction ysize.

Parameters
----------

Returns
-------
XSize: float
YSize: float
") PlaneSize;
		Standard_Boolean PlaneSize(Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** PolygonOffsets ******************/
		/**** md5 signature: c1936a0a3ad3599bb263dc0a176d83eb ****/
		%feature("compactdefaultargs") PolygonOffsets;
		%feature("autodoc", "Retrieves current polygon offsets settings for object.

Parameters
----------
anObj: AIS_InteractiveObject
aFactor: Standard_ShortReal
aUnits: Standard_ShortReal

Returns
-------
aMode: int
") PolygonOffsets;
		void PolygonOffsets(const opencascade::handle<AIS_InteractiveObject> & anObj, Standard_Integer &OutValue, Standard_ShortReal & aFactor, Standard_ShortReal & aUnits);

		/****************** PurgeDisplay ******************/
		/**** md5 signature: 98035b1ff513129f455deed9d95ed3f0 ****/
		%feature("compactdefaultargs") PurgeDisplay;
		%feature("autodoc", "Clears all the structures which don't belong to objects displayed at neutral point only effective when no local context is opened... returns the number of removed structures from the viewers.

Returns
-------
int
") PurgeDisplay;
		Standard_Integer PurgeDisplay();

		/****************** RebuildSelectionStructs ******************/
		/**** md5 signature: fc018c2ec4a8be467c479b724e4da811 ****/
		%feature("compactdefaultargs") RebuildSelectionStructs;
		%feature("autodoc", "Rebuilds 1st level of bvh selection forcibly.

Returns
-------
None
") RebuildSelectionStructs;
		void RebuildSelectionStructs();

		/****************** RecomputePrsOnly ******************/
		/**** md5 signature: 0b528d2535c19477d902b704c03a7eec ****/
		%feature("compactdefaultargs") RecomputePrsOnly;
		%feature("autodoc", "Recomputes the displayed presentations, flags the others. doesn't update presentations.

Parameters
----------
theIObj: AIS_InteractiveObject
theToUpdateViewer: bool
theAllModes: bool,optional
	default value is Standard_False

Returns
-------
None
") RecomputePrsOnly;
		void RecomputePrsOnly(const opencascade::handle<AIS_InteractiveObject> & theIObj, const Standard_Boolean theToUpdateViewer, const Standard_Boolean theAllModes = Standard_False);

		/****************** RecomputeSelectionOnly ******************/
		/**** md5 signature: e3225619e43fcc63cdd183d03946a41e ****/
		%feature("compactdefaultargs") RecomputeSelectionOnly;
		%feature("autodoc", "Recomputes the active selections, flags the others. doesn't update presentations.

Parameters
----------
anIObj: AIS_InteractiveObject

Returns
-------
None
") RecomputeSelectionOnly;
		void RecomputeSelectionOnly(const opencascade::handle<AIS_InteractiveObject> & anIObj);

		/****************** Redisplay ******************/
		/**** md5 signature: 947c6a52bcfc11efad67ab17759161b7 ****/
		%feature("compactdefaultargs") Redisplay;
		%feature("autodoc", "Recomputes the seen parts presentation of the object. if theallmodes equals true, all presentations are present in the object even if unseen.

Parameters
----------
theIObj: AIS_InteractiveObject
theToUpdateViewer: bool
theAllModes: bool,optional
	default value is Standard_False

Returns
-------
None
") Redisplay;
		void Redisplay(const opencascade::handle<AIS_InteractiveObject> & theIObj, const Standard_Boolean theToUpdateViewer, const Standard_Boolean theAllModes = Standard_False);

		/****************** Redisplay ******************/
		/**** md5 signature: 46c62f4d2ef46f9720e84ed2470660f9 ****/
		%feature("compactdefaultargs") Redisplay;
		%feature("autodoc", "Recomputes the prs/selection of displayed objects of a given type and a given signature. if signature = -1 doesn't take signature criterion.

Parameters
----------
theTypeOfObject: AIS_KindOfInteractive
theSignature: int
theToUpdateViewer: bool

Returns
-------
None
") Redisplay;
		void Redisplay(const AIS_KindOfInteractive theTypeOfObject, const Standard_Integer theSignature, const Standard_Boolean theToUpdateViewer);

		/****************** RedrawImmediate ******************/
		/**** md5 signature: 9829a5f87a4517fdc1d9d8e6cd654438 ****/
		%feature("compactdefaultargs") RedrawImmediate;
		%feature("autodoc", "Redraws immediate structures in all views of the viewer given taking into account its visibility.

Parameters
----------
theViewer: V3d_Viewer

Returns
-------
None
") RedrawImmediate;
		void RedrawImmediate(const opencascade::handle<V3d_Viewer> & theViewer);

		/****************** Remove ******************/
		/**** md5 signature: 65f35a6cfb567319856ce5af05c5f34a ****/
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "Removes object from every viewer.

Parameters
----------
theIObj: AIS_InteractiveObject
theToUpdateViewer: bool

Returns
-------
None
") Remove;
		void Remove(const opencascade::handle<AIS_InteractiveObject> & theIObj, const Standard_Boolean theToUpdateViewer);

		/****************** RemoveAll ******************/
		/**** md5 signature: f450dd60f2781efb4892d6321edefdc6 ****/
		%feature("compactdefaultargs") RemoveAll;
		%feature("autodoc", "Removes all the objects from context.

Parameters
----------
theToUpdateViewer: bool

Returns
-------
None
") RemoveAll;
		void RemoveAll(const Standard_Boolean theToUpdateViewer);

		/****************** RemoveFilter ******************/
		/**** md5 signature: 2a3b89c9253eed8d2e19ca8eee689bf0 ****/
		%feature("compactdefaultargs") RemoveFilter;
		%feature("autodoc", "Removes a filter from context.

Parameters
----------
theFilter: SelectMgr_Filter

Returns
-------
None
") RemoveFilter;
		void RemoveFilter(const opencascade::handle<SelectMgr_Filter> & theFilter);

		/****************** RemoveFilters ******************/
		/**** md5 signature: c67437b03a9b7287c85294a22b5cf833 ****/
		%feature("compactdefaultargs") RemoveFilters;
		%feature("autodoc", "Remove all filters from context.

Returns
-------
None
") RemoveFilters;
		void RemoveFilters();

		/****************** ResetLocation ******************/
		/**** md5 signature: 80b2588af111ed65716dd5f1f6899724 ****/
		%feature("compactdefaultargs") ResetLocation;
		%feature("autodoc", "Puts the object back into its initial position.

Parameters
----------
theObject: AIS_InteractiveObject

Returns
-------
None
") ResetLocation;
		void ResetLocation(const opencascade::handle<AIS_InteractiveObject> & theObject);

		/****************** Select ******************/
		/**** md5 signature: 440778a1d119dc9eec978a78067df06f ****/
		%feature("compactdefaultargs") Select;
		%feature("autodoc", "Selects everything found in the bounding rectangle defined by the pixel minima and maxima, xpmin, ypmin, xpmax, and ypmax in the view. the objects detected are passed to the main viewer, which is then updated.

Parameters
----------
theXPMin: int
theYPMin: int
theXPMax: int
theYPMax: int
theView: V3d_View
theToUpdateViewer: bool

Returns
-------
AIS_StatusOfPick
") Select;
		AIS_StatusOfPick Select(const Standard_Integer theXPMin, const Standard_Integer theYPMin, const Standard_Integer theXPMax, const Standard_Integer theYPMax, const opencascade::handle<V3d_View> & theView, const Standard_Boolean theToUpdateViewer);

		/****************** Select ******************/
		/**** md5 signature: 2a92ae056b4a11b086ad1207d7fea0dd ****/
		%feature("compactdefaultargs") Select;
		%feature("autodoc", "Polyline selection; clears the previous picked list.

Parameters
----------
thePolyline: TColgp_Array1OfPnt2d
theView: V3d_View
theToUpdateViewer: bool

Returns
-------
AIS_StatusOfPick
") Select;
		AIS_StatusOfPick Select(const TColgp_Array1OfPnt2d & thePolyline, const opencascade::handle<V3d_View> & theView, const Standard_Boolean theToUpdateViewer);

		/****************** Select ******************/
		/**** md5 signature: e14f29de8bcca1ca7d733b513df83374 ****/
		%feature("compactdefaultargs") Select;
		%feature("autodoc", "Stores and hilights the previous detected; unhilights the previous picked. @sa moveto().

Parameters
----------
theToUpdateViewer: bool

Returns
-------
AIS_StatusOfPick
") Select;
		AIS_StatusOfPick Select(const Standard_Boolean theToUpdateViewer);

		/****************** SelectedInteractive ******************/
		/**** md5 signature: b6273836cee8954a2faee535a7126f4e ****/
		%feature("compactdefaultargs") SelectedInteractive;
		%feature("autodoc", "Return opencascade::handle<ais_interactiveobject>::downcast (selectedowner()->selectable()). @sa selectedowner().

Returns
-------
opencascade::handle<AIS_InteractiveObject>
") SelectedInteractive;
		opencascade::handle<AIS_InteractiveObject> SelectedInteractive();

		/****************** SelectedOwner ******************/
		/**** md5 signature: 4f367f2cac81145c8b4f46a462bff157 ****/
		%feature("compactdefaultargs") SelectedOwner;
		%feature("autodoc", "Returns the owner of the selected entity. @sa initselected()/moreselected()/nextselected().

Returns
-------
opencascade::handle<SelectMgr_EntityOwner>
") SelectedOwner;
		opencascade::handle<SelectMgr_EntityOwner> SelectedOwner();

		/****************** SelectedShape ******************/
		/**** md5 signature: 721d3a216ce98c9b5e5e9d1b15f143f5 ****/
		%feature("compactdefaultargs") SelectedShape;
		%feature("autodoc", "Returns the selected shape. basically it is just a shape returned stored by stdselect_brepowner with graphic transformation being applied: @code const opencascade::handle<stdselect_brepowner> abrepowner = opencascade::handle<stdselect_brepowner>::downcast (selectedowner()); topods_shape aselshape = abrepowner->shape(); topods_shape alocatedshape = aselshape.located (abrepowner->location() * aselshape.location()); @endcode @sa selectedowner()/hasselectedshape().

Returns
-------
TopoDS_Shape
") SelectedShape;
		TopoDS_Shape SelectedShape();

		/****************** Selection ******************/
		/**** md5 signature: 0522c4713b6259bb252f2580882a049c ****/
		%feature("compactdefaultargs") Selection;
		%feature("autodoc", "Returns selection instance.

Returns
-------
opencascade::handle<AIS_Selection>
") Selection;
		const opencascade::handle<AIS_Selection> & Selection();

		/****************** SelectionManager ******************/
		/**** md5 signature: 9e4dab209ad46b3c197dda1ed7898179 ****/
		%feature("compactdefaultargs") SelectionManager;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<SelectMgr_SelectionManager>
") SelectionManager;
		const opencascade::handle<SelectMgr_SelectionManager> & SelectionManager();

		/****************** SelectionStyle ******************/
		/**** md5 signature: 3c3ddd0e1d466df6b150cfb790baa61a ****/
		%feature("compactdefaultargs") SelectionStyle;
		%feature("autodoc", "Returns current selection style settings. by default: - the color of selection is quantity_noc_gray80; - the presentation for selection is completely opaque; - the type of highlight is aspect_tohm_color.

Returns
-------
opencascade::handle<Prs3d_Drawer>
") SelectionStyle;
		const opencascade::handle<Prs3d_Drawer> & SelectionStyle();

		/****************** SetAngleAndDeviation ******************/
		/**** md5 signature: aa67c1520d442b18293722c76e904584 ****/
		%feature("compactdefaultargs") SetAngleAndDeviation;
		%feature("autodoc", "Calls the ais_shape setangleanddeviation to set both angle and deviation coefficients.

Parameters
----------
theIObj: AIS_InteractiveObject
theAngle: float
theToUpdateViewer: bool

Returns
-------
None
") SetAngleAndDeviation;
		void SetAngleAndDeviation(const opencascade::handle<AIS_InteractiveObject> & theIObj, const Standard_Real theAngle, const Standard_Boolean theToUpdateViewer);

		/****************** SetAutoActivateSelection ******************/
		/**** md5 signature: ac2e58ba6564f519e5c5ac5e3ee3092e ****/
		%feature("compactdefaultargs") SetAutoActivateSelection;
		%feature("autodoc", "Enable or disable automatic activation of default selection mode while displaying the object.

Parameters
----------
theIsAuto: bool

Returns
-------
None
") SetAutoActivateSelection;
		void SetAutoActivateSelection(const Standard_Boolean theIsAuto);

		/****************** SetAutomaticHilight ******************/
		/**** md5 signature: 48f9e99b030a8eaf74f5a4bb8a4486b9 ****/
		%feature("compactdefaultargs") SetAutomaticHilight;
		%feature("autodoc", "Sets the highlighting status of detected and selected entities. this function allows you to disconnect the automatic mode. //! moveto() will fill the list of detected entities and select() will set selected state to detected objects regardless of this flag, but with disabled automatichiligh() their highlighting state will be left unaffected, so that application will be able performing custom highlighting in a different way, if needed. //! this api should be distinguished from selectmgr_selectableobject::setautohilight() that is used to implement custom highlighting logic for a specific interactive object class. //! @sa moveto(), select(), hilightwithcolor(), unhilight().

Parameters
----------
theStatus: bool

Returns
-------
None
") SetAutomaticHilight;
		void SetAutomaticHilight(Standard_Boolean theStatus);

		/****************** SetColor ******************/
		/**** md5 signature: f81d3ed950b395ddea6c30fdc2042201 ****/
		%feature("compactdefaultargs") SetColor;
		%feature("autodoc", "Sets the color of the selected entity.

Parameters
----------
theIObj: AIS_InteractiveObject
theColor: Quantity_Color
theToUpdateViewer: bool

Returns
-------
None
") SetColor;
		void SetColor(const opencascade::handle<AIS_InteractiveObject> & theIObj, const Quantity_Color & theColor, const Standard_Boolean theToUpdateViewer);

		/****************** SetCurrentFacingModel ******************/
		/**** md5 signature: 6e9ce30ba43f9290ff6c58e79a404edc ****/
		%feature("compactdefaultargs") SetCurrentFacingModel;
		%feature("autodoc", "Change the current facing model apply on polygons for setcolor(), settransparency(), setmaterial() methods default facing model is aspect_tofm_two_side. this mean that attributes is applying both on the front and back face.

Parameters
----------
aniobj: AIS_InteractiveObject
aModel: Aspect_TypeOfFacingModel,optional
	default value is Aspect_TOFM_BOTH_SIDE

Returns
-------
None
") SetCurrentFacingModel;
		void SetCurrentFacingModel(const opencascade::handle<AIS_InteractiveObject> & aniobj, const Aspect_TypeOfFacingModel aModel = Aspect_TOFM_BOTH_SIDE);

		/****************** SetCurrentObject ******************/
		/**** md5 signature: bc6b6f7f20877e27eead8e940f0ee191 ****/
		%feature("compactdefaultargs") SetCurrentObject;
		%feature("autodoc", "Updates the view of the current object in open context. objects selected when there is no open local context are called current objects; those selected in open local context, selected objects.

Parameters
----------
theIObj: AIS_InteractiveObject
theToUpdateViewer: bool

Returns
-------
None
") SetCurrentObject;
		void SetCurrentObject(const opencascade::handle<AIS_InteractiveObject> & theIObj, const Standard_Boolean theToUpdateViewer);

		/****************** SetDeviationAngle ******************/
		/**** md5 signature: 3fa01c3e51e45d16b88cd62df5c6dba6 ****/
		%feature("compactdefaultargs") SetDeviationAngle;
		%feature("autodoc", "No available documentation.

Parameters
----------
theIObj: AIS_InteractiveObject
theAngle: float
theToUpdateViewer: bool

Returns
-------
None
") SetDeviationAngle;
		void SetDeviationAngle(const opencascade::handle<AIS_InteractiveObject> & theIObj, const Standard_Real theAngle, const Standard_Boolean theToUpdateViewer);

		/****************** SetDeviationAngle ******************/
		/**** md5 signature: 373845ba63fe87edd7d9720e6aade848 ****/
		%feature("compactdefaultargs") SetDeviationAngle;
		%feature("autodoc", "Default 12 degrees.

Parameters
----------
anAngle: float

Returns
-------
None
") SetDeviationAngle;
		void SetDeviationAngle(const Standard_Real anAngle);

		/****************** SetDeviationCoefficient ******************/
		/**** md5 signature: a869465c8496bd4f68daf77ec26ec399 ****/
		%feature("compactdefaultargs") SetDeviationCoefficient;
		%feature("autodoc", "Sets the deviation coefficient thecoefficient. drawings of curves or patches are made with respect to a maximal chordal deviation. a deviation coefficient is used in the shading display mode. the shape is seen decomposed into triangles. these are used to calculate reflection of light from the surface of the object. the triangles are formed from chords of the curves in the shape. the deviation coefficient thecoefficient gives the highest value of the angle with which a chord can deviate from a tangent to a curve. if this limit is reached, a new triangle is begun. this deviation is absolute and is set through the method: setmaximalchordialdeviation. the default value is 0.001. in drawing shapes, however, you are allowed to ask for a relative deviation. this deviation will be: sizeofobject * deviationcoefficient.

Parameters
----------
theIObj: AIS_InteractiveObject
theCoefficient: float
theToUpdateViewer: bool

Returns
-------
None
") SetDeviationCoefficient;
		void SetDeviationCoefficient(const opencascade::handle<AIS_InteractiveObject> & theIObj, const Standard_Real theCoefficient, const Standard_Boolean theToUpdateViewer);

		/****************** SetDeviationCoefficient ******************/
		/**** md5 signature: c876cabde5740c4ce35b0db72a481d97 ****/
		%feature("compactdefaultargs") SetDeviationCoefficient;
		%feature("autodoc", "Sets the deviation coefficient thecoefficient. drawings of curves or patches are made with respect to a maximal chordal deviation. a deviation coefficient is used in the shading display mode. the shape is seen decomposed into triangles. these are used to calculate reflection of light from the surface of the object. the triangles are formed from chords of the curves in the shape. the deviation coefficient thecoefficient gives the highest value of the angle with which a chord can deviate from a tangent to a curve. if this limit is reached, a new triangle is begun. this deviation is absolute and is set through the method: setmaximalchordialdeviation. the default value is 0.001. in drawing shapes, however, you are allowed to ask for a relative deviation. this deviation will be: sizeofobject * deviationcoefficient.

Parameters
----------
theCoefficient: float

Returns
-------
None
") SetDeviationCoefficient;
		void SetDeviationCoefficient(const Standard_Real theCoefficient);

		/****************** SetDisplayMode ******************/
		/**** md5 signature: 6ffe3bb5ef5970c4fcf781535ed6b3b9 ****/
		%feature("compactdefaultargs") SetDisplayMode;
		%feature("autodoc", "Sets the display mode of seen interactive objects (which have no overridden display mode).

Parameters
----------
theMode: int
theToUpdateViewer: bool

Returns
-------
None
") SetDisplayMode;
		void SetDisplayMode(const Standard_Integer theMode, const Standard_Boolean theToUpdateViewer);

		/****************** SetDisplayMode ******************/
		/**** md5 signature: 8c4da4b973b38bb48138a0e5409e8fa7 ****/
		%feature("compactdefaultargs") SetDisplayMode;
		%feature("autodoc", "Sets the display mode of seen interactive objects. themode provides the display mode index of the entity theiobj.

Parameters
----------
theIObj: AIS_InteractiveObject
theMode: int
theToUpdateViewer: bool

Returns
-------
None
") SetDisplayMode;
		void SetDisplayMode(const opencascade::handle<AIS_InteractiveObject> & theIObj, const Standard_Integer theMode, const Standard_Boolean theToUpdateViewer);

		/****************** SetDisplayPriority ******************/
		/**** md5 signature: bf4d439c11543113184d91660ddaf446 ****/
		%feature("compactdefaultargs") SetDisplayPriority;
		%feature("autodoc", "Sets the display priority of the seen parts presentation of the object.

Parameters
----------
theIObj: AIS_InteractiveObject
thePriority: int

Returns
-------
None
") SetDisplayPriority;
		void SetDisplayPriority(const opencascade::handle<AIS_InteractiveObject> & theIObj, const Standard_Integer thePriority);

		/****************** SetHLRAngle ******************/
		/**** md5 signature: e8b63f0b08f1d10459cb68d05f08b965 ****/
		%feature("compactdefaultargs") SetHLRAngle;
		%feature("autodoc", "Sets the hlr angle.

Parameters
----------
theAngle: float

Returns
-------
None
") SetHLRAngle;
		void SetHLRAngle(const Standard_Real theAngle);

		/****************** SetHLRAngleAndDeviation ******************/
		/**** md5 signature: 3f48c97096590983f78d831ddf38df88 ****/
		%feature("compactdefaultargs") SetHLRAngleAndDeviation;
		%feature("autodoc", "Computes a hlrangle and a hlrdeviationcoefficient by means of the angle anangle and sets the corresponding methods in the default drawing tool with these values.

Parameters
----------
theIObj: AIS_InteractiveObject
theAngle: float
theToUpdateViewer: bool

Returns
-------
None
") SetHLRAngleAndDeviation;
		void SetHLRAngleAndDeviation(const opencascade::handle<AIS_InteractiveObject> & theIObj, const Standard_Real theAngle, const Standard_Boolean theToUpdateViewer);

		/****************** SetHLRAngleAndDeviation ******************/
		/**** md5 signature: ca2f25beeb6dbdc4916d998373109d05 ****/
		%feature("compactdefaultargs") SetHLRAngleAndDeviation;
		%feature("autodoc", "Compute with theangle a hlrangle and a hlrdeviationcoefficient and set them in myhlrangle and in myhlrdeviationcoefficient of mydefaultdrawer; theangle is in radian; ( 1 deg < angle in deg < 20 deg).

Parameters
----------
theAngle: float

Returns
-------
None
") SetHLRAngleAndDeviation;
		void SetHLRAngleAndDeviation(const Standard_Real theAngle);

		/****************** SetHLRDeviationAngle ******************/
		/**** md5 signature: ff98fb1256bb7a58716c813f135ae0c4 ****/
		%feature("compactdefaultargs") SetHLRDeviationAngle;
		%feature("autodoc", "No available documentation.

Parameters
----------
theIObj: AIS_InteractiveObject
theAngle: float
theToUpdateViewer: bool

Returns
-------
None
") SetHLRDeviationAngle;
		void SetHLRDeviationAngle(const opencascade::handle<AIS_InteractiveObject> & theIObj, const Standard_Real theAngle, const Standard_Boolean theToUpdateViewer);

		/****************** SetHLRDeviationCoefficient ******************/
		/**** md5 signature: d8692fd21d36052079c6ef946b86271e ****/
		%feature("compactdefaultargs") SetHLRDeviationCoefficient;
		%feature("autodoc", "Sets the deviation coefficient acoefficient for removal of hidden lines created by different viewpoints in different presentations. the default value is 0.02.

Parameters
----------
theIObj: AIS_InteractiveObject
theCoefficient: float
theToUpdateViewer: bool

Returns
-------
None
") SetHLRDeviationCoefficient;
		void SetHLRDeviationCoefficient(const opencascade::handle<AIS_InteractiveObject> & theIObj, const Standard_Real theCoefficient, const Standard_Boolean theToUpdateViewer);

		/****************** SetHLRDeviationCoefficient ******************/
		/**** md5 signature: d6c6ee6b6094ad583c7591814ab38524 ****/
		%feature("compactdefaultargs") SetHLRDeviationCoefficient;
		%feature("autodoc", "Sets the deviation coefficient acoefficient for removal of hidden lines created by different viewpoints in different presentations. the default value is 0.02.

Parameters
----------
aCoefficient: float

Returns
-------
None
") SetHLRDeviationCoefficient;
		void SetHLRDeviationCoefficient(const Standard_Real aCoefficient);

		/****************** SetHiddenLineAspect ******************/
		/**** md5 signature: 5b46a3500446af2bbd4fd524d0b64376 ****/
		%feature("compactdefaultargs") SetHiddenLineAspect;
		%feature("autodoc", "Sets the hidden line aspect anaspect. aspect defines display attributes for hidden lines in hlr projections.

Parameters
----------
anAspect: Prs3d_LineAspect

Returns
-------
None
") SetHiddenLineAspect;
		void SetHiddenLineAspect(const opencascade::handle<Prs3d_LineAspect> & anAspect);

		/****************** SetHighlightStyle ******************/
		/**** md5 signature: 514ba754efe6d3cdef1ca1443d525348 ****/
		%feature("compactdefaultargs") SetHighlightStyle;
		%feature("autodoc", "Setup highlight style settings. it is preferred modifying existing style returned by method highlightstyle() instead of creating a new drawer. //! if a new highlight style is created, its presentation zlayer should be checked, otherwise highlighting might not work as expected. default values are: - prs3d_typeofhighlight_dynamic: graphic3d_zlayerid_top, object highlighting is drawn on top of main scene within immediate layers, so that v3d_view::redrawimmediate() will be enough to see update; - prs3d_typeofhighlight_localdynamic: graphic3d_zlayerid_topmost, object parts highlighting is drawn on top of main scene within immediate layers with depth cleared (even overlapped geometry will be revealed); - prs3d_typeofhighlight_selected: graphic3d_zlayerid_unknown, object highlighting is drawn on top of main scene within the same layer as object itself (e.g. graphic3d_zlayerid_default by default) and increased priority.

Parameters
----------
theStyleType: Prs3d_TypeOfHighlight
theStyle: Prs3d_Drawer

Returns
-------
None
") SetHighlightStyle;
		void SetHighlightStyle(const Prs3d_TypeOfHighlight theStyleType, const opencascade::handle<Prs3d_Drawer> & theStyle);

		/****************** SetHighlightStyle ******************/
		/**** md5 signature: 0f582d623d586c315d681407eef8bab2 ****/
		%feature("compactdefaultargs") SetHighlightStyle;
		%feature("autodoc", "Setup the style of dynamic highlighting. it is preferred modifying existing style returned by method highlightstyle() instead of creating a new drawer. //! if a new highlight style is created, its presentation zlayer should be checked, otherwise highlighting might not work as expected. default value is graphic3d_zlayerid_top, object highlighting is drawn on top of main scene within immediate layers, so that v3d_view::redrawimmediate() will be enough to see update;.

Parameters
----------
theStyle: Prs3d_Drawer

Returns
-------
None
") SetHighlightStyle;
		void SetHighlightStyle(const opencascade::handle<Prs3d_Drawer> & theStyle);

		/****************** SetIsoNumber ******************/
		/**** md5 signature: 108e9a31a51c2c1be4fb2fc91b68906c ****/
		%feature("compactdefaultargs") SetIsoNumber;
		%feature("autodoc", "Sets the number of u and v isoparameters displayed.

Parameters
----------
NbIsos: int
WhichIsos: AIS_TypeOfIso,optional
	default value is AIS_TOI_Both

Returns
-------
None
") SetIsoNumber;
		void SetIsoNumber(const Standard_Integer NbIsos, const AIS_TypeOfIso WhichIsos = AIS_TOI_Both);

		/****************** SetLocalAttributes ******************/
		/**** md5 signature: 2dc75f962d027692405727903e0ef22c ****/
		%feature("compactdefaultargs") SetLocalAttributes;
		%feature("autodoc", "Sets the graphic attributes of the interactive object, such as visualization mode, color, and material.

Parameters
----------
theIObj: AIS_InteractiveObject
theDrawer: Prs3d_Drawer
theToUpdateViewer: bool

Returns
-------
None
") SetLocalAttributes;
		void SetLocalAttributes(const opencascade::handle<AIS_InteractiveObject> & theIObj, const opencascade::handle<Prs3d_Drawer> & theDrawer, const Standard_Boolean theToUpdateViewer);

		/****************** SetLocation ******************/
		/**** md5 signature: 278570b2ad71d01112ac61ba95d92f6f ****/
		%feature("compactdefaultargs") SetLocation;
		%feature("autodoc", "Puts the location on the initial graphic representation and the selection for the object.

Parameters
----------
theObject: AIS_InteractiveObject
theLocation: TopLoc_Location

Returns
-------
None
") SetLocation;
		void SetLocation(const opencascade::handle<AIS_InteractiveObject> & theObject, const TopLoc_Location & theLocation);

		/****************** SetMaterial ******************/
		/**** md5 signature: b7292556e6ed4659948c0946af2a2c88 ****/
		%feature("compactdefaultargs") SetMaterial;
		%feature("autodoc", "Provides the type of material setting for the view of the object.

Parameters
----------
theIObj: AIS_InteractiveObject
theMaterial: Graphic3d_MaterialAspect
theToUpdateViewer: bool

Returns
-------
None
") SetMaterial;
		void SetMaterial(const opencascade::handle<AIS_InteractiveObject> & theIObj, const Graphic3d_MaterialAspect & theMaterial, const Standard_Boolean theToUpdateViewer);

		/****************** SetPickingStrategy ******************/
		/**** md5 signature: 7eb0b1033404a3318ec39d0b8f456b86 ****/
		%feature("compactdefaultargs") SetPickingStrategy;
		%feature("autodoc", "Setup picking strategy - which entities detected by picking line will be accepted, considering selection filters. by default (selectmgr_pickingstrategy_firstacceptable), selection filters reduce the list of entities so that the context accepts topmost in remaining. //! this means that entities behind non-selectable (by filters) parts can be picked by user. if this behavior is undesirable, and user wants that non-selectable (by filters) parts should remain an obstacle for picking, selectmgr_pickingstrategy_onlytopmost can be set instead. //! notice, that since selection manager operates only objects registered in it, selectmgr_pickingstrategy_onlytopmost will not prevent picking entities behind visible by unregistered in selection manager presentations (e.g. deactivated). hence, selectmgr_pickingstrategy_onlytopmost changes behavior only with selection filters enabled.

Parameters
----------
theStrategy: SelectMgr_PickingStrategy

Returns
-------
None
") SetPickingStrategy;
		void SetPickingStrategy(const SelectMgr_PickingStrategy theStrategy);

		/****************** SetPixelTolerance ******************/
		/**** md5 signature: 0687dc8be567f668454cb9cecd8746b3 ****/
		%feature("compactdefaultargs") SetPixelTolerance;
		%feature("autodoc", "Setup pixel tolerance for moveto() operation. @sa moveto().

Parameters
----------
thePrecision: int,optional
	default value is 2

Returns
-------
None
") SetPixelTolerance;
		void SetPixelTolerance(const Standard_Integer thePrecision = 2);

		/****************** SetPlaneSize ******************/
		/**** md5 signature: 6377ec1f2a7840f7b57b14849d1af438 ****/
		%feature("compactdefaultargs") SetPlaneSize;
		%feature("autodoc", "Sets the plane size defined by the length in the x direction xsize and that in the y direction ysize.

Parameters
----------
theSizeX: float
theSizeY: float
theToUpdateViewer: bool

Returns
-------
None
") SetPlaneSize;
		void SetPlaneSize(const Standard_Real theSizeX, const Standard_Real theSizeY, const Standard_Boolean theToUpdateViewer);

		/****************** SetPlaneSize ******************/
		/**** md5 signature: 8b187b41fa59677dcd33b94c60f2887e ****/
		%feature("compactdefaultargs") SetPlaneSize;
		%feature("autodoc", "Sets the plane size asize.

Parameters
----------
theSize: float
theToUpdateViewer: bool

Returns
-------
None
") SetPlaneSize;
		void SetPlaneSize(const Standard_Real theSize, const Standard_Boolean theToUpdateViewer);

		/****************** SetPolygonOffsets ******************/
		/**** md5 signature: f78652fe5f3334a97cfeeaf9fc53a55f ****/
		%feature("compactdefaultargs") SetPolygonOffsets;
		%feature("autodoc", "Sets up polygon offsets for the given ais_interactiveobject. it simply calls ais_interactiveobject::setpolygonoffsets().

Parameters
----------
theIObj: AIS_InteractiveObject
theMode: int
theFactor: Standard_ShortReal
theUnits: Standard_ShortReal
theToUpdateViewer: bool

Returns
-------
None
") SetPolygonOffsets;
		void SetPolygonOffsets(const opencascade::handle<AIS_InteractiveObject> & theIObj, const Standard_Integer theMode, const Standard_ShortReal theFactor, const Standard_ShortReal theUnits, const Standard_Boolean theToUpdateViewer);

		/****************** SetSelected ******************/
		/**** md5 signature: f0b850a3af4fe947123c9d3eafa73363 ****/
		%feature("compactdefaultargs") SetSelected;
		%feature("autodoc", "Unhighlights previously selected owners and marks them as not selected. marks owner given as selected and highlights it. performs selection filters check.

Parameters
----------
theOwners: SelectMgr_EntityOwner
theToUpdateViewer: bool

Returns
-------
None
") SetSelected;
		void SetSelected(const opencascade::handle<SelectMgr_EntityOwner> & theOwners, const Standard_Boolean theToUpdateViewer);

		/****************** SetSelected ******************/
		/**** md5 signature: 401134da5619f51956c86499d723f4be ****/
		%feature("compactdefaultargs") SetSelected;
		%feature("autodoc", "Puts the interactive object aniobj in the list of selected objects. performs selection filters check.

Parameters
----------
theObject: AIS_InteractiveObject
theToUpdateViewer: bool

Returns
-------
None
") SetSelected;
		void SetSelected(const opencascade::handle<AIS_InteractiveObject> & theObject, const Standard_Boolean theToUpdateViewer);

		/****************** SetSelectedAspect ******************/
		/**** md5 signature: a6c69f221df199d5c6401f993c6f645b ****/
		%feature("compactdefaultargs") SetSelectedAspect;
		%feature("autodoc", "Sets the graphic basic aspect to the current presentation of all selected objects.

Parameters
----------
theAspect: Prs3d_BasicAspect
theToUpdateViewer: bool

Returns
-------
None
") SetSelectedAspect;
		void SetSelectedAspect(const opencascade::handle<Prs3d_BasicAspect> & theAspect, const Standard_Boolean theToUpdateViewer);

		/****************** SetSelectedState ******************/
		/**** md5 signature: d5d1f8962f9c93408e9c2ed807fb4450 ****/
		%feature("compactdefaultargs") SetSelectedState;
		%feature("autodoc", "Updates selected state of specified owner without calling hilightselected(). has no effect if selected state is not changed, and redirects to addorremoveselected() otherwise. @param theowner owner object to set selected state @param theisselected new selected state returns true if selected state has been changed.

Parameters
----------
theOwner: SelectMgr_EntityOwner
theIsSelected: bool

Returns
-------
bool
") SetSelectedState;
		Standard_Boolean SetSelectedState(const opencascade::handle<SelectMgr_EntityOwner> & theOwner, const Standard_Boolean theIsSelected);

		/****************** SetSelection ******************/
		/**** md5 signature: 5ff5220ba2200900a533a9612db4e0bd ****/
		%feature("compactdefaultargs") SetSelection;
		%feature("autodoc", "Sets selection instance to manipulate a container of selected owners @param theselection an instance of the selection.

Parameters
----------
theSelection: AIS_Selection

Returns
-------
None
") SetSelection;
		void SetSelection(const opencascade::handle<AIS_Selection> & theSelection);

		/****************** SetSelectionModeActive ******************/
		/**** md5 signature: 7c19717100bc0b50dcae6e86485112ab ****/
		%feature("compactdefaultargs") SetSelectionModeActive;
		%feature("autodoc", "Activates or deactivates the selection mode for specified object. has no effect if selection mode was already active/deactivated. @param theobj object to activate/deactivate selection mode @param themode selection mode to activate/deactivate;  deactivation of -1 selection mode will effectively deactivate all selection modes;  activation of -1 selection mode with ais_selectionmodesconcurrency_single  will deactivate all selection modes, and will has no effect otherwise @param thetoactivate activation/deactivation flag @param theconcurrency specifies how to handle already activated selection modes;  default value (ais_selectionmodesconcurrency_multiple) means active selection modes should be left as is,  ais_selectionmodesconcurrency_single can be used if only one selection mode is expected to be active  and ais_selectionmodesconcurrency_globalorlocal can be used if either ais_interactiveobject::globalselectionmode()  or any combination of local selection modes is acceptable;  this value is considered only if thetoactivate set to true @param theisforce when set to true, the display status will be ignored while activating selection mode.

Parameters
----------
theObj: AIS_InteractiveObject
theMode: int
theToActivate: bool
theConcurrency: AIS_SelectionModesConcurrency,optional
	default value is AIS_SelectionModesConcurrency_Multiple
theIsForce: bool,optional
	default value is Standard_False

Returns
-------
None
") SetSelectionModeActive;
		void SetSelectionModeActive(const opencascade::handle<AIS_InteractiveObject> & theObj, const Standard_Integer theMode, const Standard_Boolean theToActivate, const AIS_SelectionModesConcurrency theConcurrency = AIS_SelectionModesConcurrency_Multiple, const Standard_Boolean theIsForce = Standard_False);

		/****************** SetSelectionSensitivity ******************/
		/**** md5 signature: b30adbf5d1a9914b4bfcec6e22a4dc51 ****/
		%feature("compactdefaultargs") SetSelectionSensitivity;
		%feature("autodoc", "Allows to manage sensitivity of a particular selection of interactive object theobject and changes previous sensitivity value of all sensitive entities in selection with themode to the given thenewsensitivity.

Parameters
----------
theObject: AIS_InteractiveObject
theMode: int
theNewSensitivity: int

Returns
-------
None
") SetSelectionSensitivity;
		void SetSelectionSensitivity(const opencascade::handle<AIS_InteractiveObject> & theObject, const Standard_Integer theMode, const Standard_Integer theNewSensitivity);

		/****************** SetSelectionStyle ******************/
		/**** md5 signature: 93a6cf42e8daf8b20f671afa0142b5ba ****/
		%feature("compactdefaultargs") SetSelectionStyle;
		%feature("autodoc", "Setup the style of selection highlighting.

Parameters
----------
theStyle: Prs3d_Drawer

Returns
-------
None
") SetSelectionStyle;
		void SetSelectionStyle(const opencascade::handle<Prs3d_Drawer> & theStyle);

		/****************** SetSubIntensityColor ******************/
		/**** md5 signature: efbd8ffda6a16710153bd546969c5e71 ****/
		%feature("compactdefaultargs") SetSubIntensityColor;
		%feature("autodoc", "Sub-intensity allows temporary highlighting of particular objects with specified color in a manner of selection highlight, but without actual selection (e.g., global status and owner's selection state will not be updated). the method sets up the color for such highlighting. by default, this is quantity_noc_gray40.

Parameters
----------
theColor: Quantity_Color

Returns
-------
None
") SetSubIntensityColor;
		void SetSubIntensityColor(const Quantity_Color & theColor);

		/****************** SetToHilightSelected ******************/
		/**** md5 signature: c73093a95a9778fce26b45a5b59bda90 ****/
		%feature("compactdefaultargs") SetToHilightSelected;
		%feature("autodoc", "Specify whether selected object must be hilighted when mouse cursor is moved above it (in moveto method). by default this value is false and selected object is not hilighted in this case. @sa moveto().

Parameters
----------
toHilight: bool

Returns
-------
None
") SetToHilightSelected;
		void SetToHilightSelected(const Standard_Boolean toHilight);

		/****************** SetTransformPersistence ******************/
		/**** md5 signature: 4fdb4a5c645cc9dae3adacc6cbe0332f ****/
		%feature("compactdefaultargs") SetTransformPersistence;
		%feature("autodoc", "Sets transform persistence.

Parameters
----------
theObject: AIS_InteractiveObject
theTrsfPers: Graphic3d_TransformPers

Returns
-------
None
") SetTransformPersistence;
		void SetTransformPersistence(const opencascade::handle<AIS_InteractiveObject> & theObject, const opencascade::handle<Graphic3d_TransformPers> & theTrsfPers);

		/****************** SetTransformPersistence ******************/
		/**** md5 signature: 8227af0069ce6c1db420a1ae7c1520a9 ****/
		%feature("compactdefaultargs") SetTransformPersistence;
		%feature("autodoc", "No available documentation.

Parameters
----------
theObj: AIS_InteractiveObject
theFlag: Graphic3d_TransModeFlags
thePoint: gp_Pnt,optional
	default value is gp_Pnt(0.0,0.0,0.0)

Returns
-------
None
") SetTransformPersistence;
		void SetTransformPersistence(const opencascade::handle<AIS_InteractiveObject> & theObj, const Graphic3d_TransModeFlags & theFlag, const gp_Pnt & thePoint = gp_Pnt(0.0,0.0,0.0));

		/****************** SetTransparency ******************/
		/**** md5 signature: fee820087e4dfddda2498e02179e9112 ****/
		%feature("compactdefaultargs") SetTransparency;
		%feature("autodoc", "Provides the transparency settings for viewing the object. the transparency value avalue may be between 0.0, opaque, and 1.0, fully transparent.

Parameters
----------
theIObj: AIS_InteractiveObject
theValue: float
theToUpdateViewer: bool

Returns
-------
None
") SetTransparency;
		void SetTransparency(const opencascade::handle<AIS_InteractiveObject> & theIObj, const Standard_Real theValue, const Standard_Boolean theToUpdateViewer);

		/****************** SetTrihedronSize ******************/
		/**** md5 signature: 5fd503409307be524e278af757eb2d24 ****/
		%feature("compactdefaultargs") SetTrihedronSize;
		%feature("autodoc", "Sets the size asize of the trihedron. is used to change the default value 100 mm for display of trihedra. use of this function in one of your own interactive objects requires a call to the compute function of the new class. this will recalculate the presentation for every trihedron displayed.

Parameters
----------
theSize: float
theToUpdateViewer: bool

Returns
-------
None
") SetTrihedronSize;
		void SetTrihedronSize(const Standard_Real theSize, const Standard_Boolean theToUpdateViewer);

		/****************** SetViewAffinity ******************/
		/**** md5 signature: d3189b408dddf07ef7ed75dda5761b6c ****/
		%feature("compactdefaultargs") SetViewAffinity;
		%feature("autodoc", "Setup object visibility in specified view. has no effect if object is not displayed in this context.

Parameters
----------
theIObj: AIS_InteractiveObject
theView: V3d_View
theIsVisible: bool

Returns
-------
None
") SetViewAffinity;
		void SetViewAffinity(const opencascade::handle<AIS_InteractiveObject> & theIObj, const opencascade::handle<V3d_View> & theView, const Standard_Boolean theIsVisible);

		/****************** SetWidth ******************/
		/**** md5 signature: 6abf2eab4c7d3c361f6d5b684119c3cd ****/
		%feature("compactdefaultargs") SetWidth;
		%feature("autodoc", "Sets the width of the object.

Parameters
----------
theIObj: AIS_InteractiveObject
theValue: float
theToUpdateViewer: bool

Returns
-------
None
") SetWidth;
		virtual void SetWidth(const opencascade::handle<AIS_InteractiveObject> & theIObj, const Standard_Real theValue, const Standard_Boolean theToUpdateViewer);

		/****************** SetZLayer ******************/
		/**** md5 signature: 9de16485878ef47171f12d852b4297c1 ****/
		%feature("compactdefaultargs") SetZLayer;
		%feature("autodoc", "Set z layer id for interactive object. the z layers can be used to display temporarily presentations of some object in front of the other objects in the scene. the ids for z layers are generated by v3d_viewer.

Parameters
----------
theIObj: AIS_InteractiveObject
theLayerId: int

Returns
-------
None
") SetZLayer;
		void SetZLayer(const opencascade::handle<AIS_InteractiveObject> & theIObj, int theLayerId);

		/****************** ShiftSelect ******************/
		/**** md5 signature: 5b6572c7a2d833175cf596250c21b3d3 ****/
		%feature("compactdefaultargs") ShiftSelect;
		%feature("autodoc", "Adds the last detected to the list of previous picked. if the last detected was already declared as picked, removes it from the picked list. @sa moveto().

Parameters
----------
theToUpdateViewer: bool

Returns
-------
AIS_StatusOfPick
") ShiftSelect;
		AIS_StatusOfPick ShiftSelect(const Standard_Boolean theToUpdateViewer);

		/****************** ShiftSelect ******************/
		/**** md5 signature: 618d73e8ab9d28f941dda9c06d7ed4b3 ****/
		%feature("compactdefaultargs") ShiftSelect;
		%feature("autodoc", "Adds the last detected to the list of previous picked. if the last detected was already declared as picked, removes it from the picked list.

Parameters
----------
thePolyline: TColgp_Array1OfPnt2d
theView: V3d_View
theToUpdateViewer: bool

Returns
-------
AIS_StatusOfPick
") ShiftSelect;
		AIS_StatusOfPick ShiftSelect(const TColgp_Array1OfPnt2d & thePolyline, const opencascade::handle<V3d_View> & theView, const Standard_Boolean theToUpdateViewer);

		/****************** ShiftSelect ******************/
		/**** md5 signature: cf486a7ba2130ff83344c799e272831f ****/
		%feature("compactdefaultargs") ShiftSelect;
		%feature("autodoc", "Rectangle of selection; adds new detected entities into the picked list, removes the detected entities that were already stored.

Parameters
----------
theXPMin: int
theYPMin: int
theXPMax: int
theYPMax: int
theView: V3d_View
theToUpdateViewer: bool

Returns
-------
AIS_StatusOfPick
") ShiftSelect;
		AIS_StatusOfPick ShiftSelect(const Standard_Integer theXPMin, const Standard_Integer theYPMin, const Standard_Integer theXPMax, const Standard_Integer theYPMax, const opencascade::handle<V3d_View> & theView, const Standard_Boolean theToUpdateViewer);

		/****************** SubIntensityColor ******************/
		/**** md5 signature: e1332d593cf25efd90cc06d78287a52b ****/
		%feature("compactdefaultargs") SubIntensityColor;
		%feature("autodoc", "Sub-intensity allows temporary highlighting of particular objects with specified color in a manner of selection highlight, but without actual selection (e.g., global status and owner's selection state will not be updated). the method returns the color of such highlighting. by default, it is quantity_noc_gray40.

Returns
-------
Quantity_Color
") SubIntensityColor;
		const Quantity_Color & SubIntensityColor();

		/****************** SubIntensityOff ******************/
		/**** md5 signature: 6f3475edad38e7262220fe96d88ef623 ****/
		%feature("compactdefaultargs") SubIntensityOff;
		%feature("autodoc", "Removes the subintensity option for the entity. if a local context is open, the presentation of the interactive object activates the selection mode.

Parameters
----------
theIObj: AIS_InteractiveObject
theToUpdateViewer: bool

Returns
-------
None
") SubIntensityOff;
		void SubIntensityOff(const opencascade::handle<AIS_InteractiveObject> & theIObj, const Standard_Boolean theToUpdateViewer);

		/****************** SubIntensityOn ******************/
		/**** md5 signature: ca6236bf53cb80cdc3ebbd7e74a23daf ****/
		%feature("compactdefaultargs") SubIntensityOn;
		%feature("autodoc", "Highlights, and removes highlights from, the displayed object which is displayed at neutral point with subintensity color. available only for active local context. there is no effect if there is no local context. if a local context is open, the presentation of the interactive object activates the selection mode.

Parameters
----------
theIObj: AIS_InteractiveObject
theToUpdateViewer: bool

Returns
-------
None
") SubIntensityOn;
		void SubIntensityOn(const opencascade::handle<AIS_InteractiveObject> & theIObj, const Standard_Boolean theToUpdateViewer);

		/****************** ToHilightSelected ******************/
		/**** md5 signature: 988844a9d79a6fc69ac1a23fbcf496f6 ****/
		%feature("compactdefaultargs") ToHilightSelected;
		%feature("autodoc", "Return value specified whether selected object must be hilighted when mouse cursor is moved above it @sa moveto().

Returns
-------
bool
") ToHilightSelected;
		Standard_Boolean ToHilightSelected();

		/****************** TrihedronSize ******************/
		/**** md5 signature: 58270011eed5029f395e07a1f2596286 ****/
		%feature("compactdefaultargs") TrihedronSize;
		%feature("autodoc", "Returns the current value of trihedron size.

Returns
-------
float
") TrihedronSize;
		Standard_Real TrihedronSize();

		/****************** Unhilight ******************/
		/**** md5 signature: cabf4c4699cc554eccbb9ac29d71126f ****/
		%feature("compactdefaultargs") Unhilight;
		%feature("autodoc", "Removes hilighting from the object.

Parameters
----------
theIObj: AIS_InteractiveObject
theToUpdateViewer: bool

Returns
-------
None
") Unhilight;
		void Unhilight(const opencascade::handle<AIS_InteractiveObject> & theIObj, const Standard_Boolean theToUpdateViewer);

		/****************** UnhilightCurrents ******************/
		/**** md5 signature: afc367d55540bdee7dc9ed2e2e3b600a ****/
		%feature("compactdefaultargs") UnhilightCurrents;
		%feature("autodoc", "Removes highlighting from current objects. objects selected when there is no open local context are called current objects; those selected in open local context, selected objects.

Parameters
----------
theToUpdateViewer: bool

Returns
-------
None
") UnhilightCurrents;
		void UnhilightCurrents(const Standard_Boolean theToUpdateViewer);

		/****************** UnhilightSelected ******************/
		/**** md5 signature: 6e710c02eb430375e6fe836b6511101c ****/
		%feature("compactdefaultargs") UnhilightSelected;
		%feature("autodoc", "Removes highlighting from selected objects.

Parameters
----------
theToUpdateViewer: bool

Returns
-------
None
") UnhilightSelected;
		void UnhilightSelected(const Standard_Boolean theToUpdateViewer);

		/****************** UnsetColor ******************/
		/**** md5 signature: d9da782381329c45d7b9d8caa4f3e450 ****/
		%feature("compactdefaultargs") UnsetColor;
		%feature("autodoc", "Removes the color selection for the selected entity.

Parameters
----------
theIObj: AIS_InteractiveObject
theToUpdateViewer: bool

Returns
-------
None
") UnsetColor;
		void UnsetColor(const opencascade::handle<AIS_InteractiveObject> & theIObj, const Standard_Boolean theToUpdateViewer);

		/****************** UnsetDisplayMode ******************/
		/**** md5 signature: 4dc58e4bf04485276a2c0182bb3dc3dc ****/
		%feature("compactdefaultargs") UnsetDisplayMode;
		%feature("autodoc", "Unsets the display mode of seen interactive objects.

Parameters
----------
theIObj: AIS_InteractiveObject
theToUpdateViewer: bool

Returns
-------
None
") UnsetDisplayMode;
		void UnsetDisplayMode(const opencascade::handle<AIS_InteractiveObject> & theIObj, const Standard_Boolean theToUpdateViewer);

		/****************** UnsetLocalAttributes ******************/
		/**** md5 signature: 97053ae6096b9d24699428d0ecc7f03e ****/
		%feature("compactdefaultargs") UnsetLocalAttributes;
		%feature("autodoc", "Removes the settings for local attributes of the object and returns to defaults.

Parameters
----------
theIObj: AIS_InteractiveObject
theToUpdateViewer: bool

Returns
-------
None
") UnsetLocalAttributes;
		void UnsetLocalAttributes(const opencascade::handle<AIS_InteractiveObject> & theIObj, const Standard_Boolean theToUpdateViewer);

		/****************** UnsetMaterial ******************/
		/**** md5 signature: 901ba466f5e6f9138f6e6980dbdef644 ****/
		%feature("compactdefaultargs") UnsetMaterial;
		%feature("autodoc", "Removes the type of material setting for viewing the object.

Parameters
----------
theIObj: AIS_InteractiveObject
theToUpdateViewer: bool

Returns
-------
None
") UnsetMaterial;
		void UnsetMaterial(const opencascade::handle<AIS_InteractiveObject> & theIObj, const Standard_Boolean theToUpdateViewer);

		/****************** UnsetTransparency ******************/
		/**** md5 signature: 2e8742a27916f586cc38ffc5a8e4b854 ****/
		%feature("compactdefaultargs") UnsetTransparency;
		%feature("autodoc", "Removes the transparency settings for viewing the object.

Parameters
----------
theIObj: AIS_InteractiveObject
theToUpdateViewer: bool

Returns
-------
None
") UnsetTransparency;
		void UnsetTransparency(const opencascade::handle<AIS_InteractiveObject> & theIObj, const Standard_Boolean theToUpdateViewer);

		/****************** UnsetWidth ******************/
		/**** md5 signature: f22cfacba2c4a9f18fad46951832bd9c ****/
		%feature("compactdefaultargs") UnsetWidth;
		%feature("autodoc", "Removes the width setting of the object.

Parameters
----------
theIObj: AIS_InteractiveObject
theToUpdateViewer: bool

Returns
-------
None
") UnsetWidth;
		virtual void UnsetWidth(const opencascade::handle<AIS_InteractiveObject> & theIObj, const Standard_Boolean theToUpdateViewer);

		/****************** Update ******************/
		/**** md5 signature: 3f42b13a11f9aa876a5b030ed18c6379 ****/
		%feature("compactdefaultargs") Update;
		%feature("autodoc", "Updates displayed interactive object by checking and recomputing its flagged as 'to be recomputed' presentation and selection structures. this method does not force any recomputation on its own. the method recomputes selections even if they are loaded without activation in particular selector.

Parameters
----------
theIObj: AIS_InteractiveObject
theUpdateViewer: bool

Returns
-------
None
") Update;
		void Update(const opencascade::handle<AIS_InteractiveObject> & theIObj, const Standard_Boolean theUpdateViewer);

		/****************** UpdateCurrent ******************/
		/**** md5 signature: b0255cb4a140dfe10f31c4adcc570785 ****/
		%feature("compactdefaultargs") UpdateCurrent;
		%feature("autodoc", "Updates the list of current objects, i.e. hilights new current objects, removes hilighting from former current objects. objects selected when there is no open local context are called current objects; those selected in open local context, selected objects.

Returns
-------
None
") UpdateCurrent;
		void UpdateCurrent();

		/****************** UpdateCurrentViewer ******************/
		/**** md5 signature: 7ec7524380aa7da52320b4262dabacd6 ****/
		%feature("compactdefaultargs") UpdateCurrentViewer;
		%feature("autodoc", "Updates the current viewer.

Returns
-------
None
") UpdateCurrentViewer;
		void UpdateCurrentViewer();

		/****************** UpdateSelected ******************/
		/**** md5 signature: addaefbb5d1e597c3e797750a2657ccc ****/
		%feature("compactdefaultargs") UpdateSelected;
		%feature("autodoc", "Updates the list of selected objects: i.e. highlights the newly selected ones and unhighlights previously selected objects. @sa hilightselected().

Parameters
----------
theToUpdateViewer: bool

Returns
-------
None
") UpdateSelected;
		void UpdateSelected(Standard_Boolean theToUpdateViewer);

		/****************** Width ******************/
		/**** md5 signature: 4f480dafbfc845fa7330627983f2729f ****/
		%feature("compactdefaultargs") Width;
		%feature("autodoc", "Returns the width of the interactive object in the interactive context.

Parameters
----------
aniobj: AIS_InteractiveObject

Returns
-------
float
") Width;
		virtual Standard_Real Width(const opencascade::handle<AIS_InteractiveObject> & aniobj);

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
		/****************** ClearOwner ******************/
		/**** md5 signature: 8592d7a71151aca87082b1c1d7ca818c ****/
		%feature("compactdefaultargs") ClearOwner;
		%feature("autodoc", "Each interactive object has methods which allow us to attribute an owner to it in the form of a transient. this method removes the owner from the graphic entity.

Returns
-------
None
") ClearOwner;
		void ClearOwner();


            %feature("autodoc", "1");
            %extend{
                std::string DumpJsonToString(int depth=-1) {
                std::stringstream s;
                self->DumpJson(s, depth);
                return s.str();}
            };
		/****************** GetContext ******************/
		/**** md5 signature: 9141453181bb741f4971f346e5b4d4cb ****/
		%feature("compactdefaultargs") GetContext;
		%feature("autodoc", "Returns the context pointer to the interactive context.

Returns
-------
opencascade::handle<AIS_InteractiveContext>
") GetContext;
		opencascade::handle<AIS_InteractiveContext> GetContext();

		/****************** GetOwner ******************/
		/**** md5 signature: 269b252597829cad630a6bbf4ea69473 ****/
		%feature("compactdefaultargs") GetOwner;
		%feature("autodoc", "Returns the owner of the interactive object. the owner can be a shape for a set of sub-shapes or a sub-shape for sub-shapes which it is composed of, and takes the form of a transient. there are two types of owners: - direct owners, decomposition shapes such as edges, wires, and faces. - users, presentable objects connecting to sensitive primitives, or a shape which has been decomposed.

Returns
-------
opencascade::handle<Standard_Transient>
") GetOwner;
		const opencascade::handle<Standard_Transient> & GetOwner();

		/****************** HasInteractiveContext ******************/
		/**** md5 signature: 1314b115a1808d957f87aa1497f6ab89 ****/
		%feature("compactdefaultargs") HasInteractiveContext;
		%feature("autodoc", "Indicates whether the interactive object has a pointer to an interactive context.

Returns
-------
bool
") HasInteractiveContext;
		Standard_Boolean HasInteractiveContext();

		/****************** HasOwner ******************/
		/**** md5 signature: 3f6ab68b2fb7c6818c3a2483804f0d62 ****/
		%feature("compactdefaultargs") HasOwner;
		%feature("autodoc", "Returns true if the object has an owner attributed to it. the owner can be a shape for a set of sub-shapes or a sub-shape for sub-shapes which it is composed of, and takes the form of a transient.

Returns
-------
bool
") HasOwner;
		Standard_Boolean HasOwner();

		/****************** HasPresentation ******************/
		/**** md5 signature: 2847bbb5d15f8c4b2003053a9adce753 ****/
		%feature("compactdefaultargs") HasPresentation;
		%feature("autodoc", "Returns true when this object has a presentation in the current displaymode().

Returns
-------
bool
") HasPresentation;
		Standard_Boolean HasPresentation();

		/****************** InteractiveContext ******************/
		/**** md5 signature: 9383f882f57497c320cdfadce7894acb ****/
		%feature("compactdefaultargs") InteractiveContext;
		%feature("autodoc", "Returns the context pointer to the interactive context.

Returns
-------
AIS_InteractiveContext *
") InteractiveContext;
		AIS_InteractiveContext * InteractiveContext();

		/****************** Presentation ******************/
		/**** md5 signature: 88be3e26e114f8c34739a306f65e267d ****/
		%feature("compactdefaultargs") Presentation;
		%feature("autodoc", "Returns the current presentation of this object according to the current displaymode().

Returns
-------
opencascade::handle<Prs3d_Presentation>
") Presentation;
		opencascade::handle<Prs3d_Presentation> Presentation();

		/****************** Redisplay ******************/
		/**** md5 signature: fca7d8c34b9513257ffbe0b732493e56 ****/
		%feature("compactdefaultargs") Redisplay;
		%feature("autodoc", "Updates the active presentation; if <allmodes> = standard_true all the presentations inside are recomputed. important: it is preferable to call redisplay method of corresponding ais_interactivecontext instance for cases when it is accessible. this method just redirects call to myctxptr, so this class field must be up to date for proper result.

Parameters
----------
AllModes: bool,optional
	default value is Standard_False

Returns
-------
None
") Redisplay;
		void Redisplay(const Standard_Boolean AllModes = Standard_False);

		/****************** SetAspect ******************/
		/**** md5 signature: eb261a37528b25042807667593c3b378 ****/
		%feature("compactdefaultargs") SetAspect;
		%feature("autodoc", "Sets the graphic basic aspect to the current presentation.

Parameters
----------
anAspect: Prs3d_BasicAspect

Returns
-------
None
") SetAspect;
		void SetAspect(const opencascade::handle<Prs3d_BasicAspect> & anAspect);

		/****************** SetContext ******************/
		/**** md5 signature: aea0f9b1ecdc3c6f470618d4f2a4757d ****/
		%feature("compactdefaultargs") SetContext;
		%feature("autodoc", "Sets the interactive context actx and provides a link to the default drawing tool or 'drawer' if there is none.

Parameters
----------
aCtx: AIS_InteractiveContext

Returns
-------
None
") SetContext;
		virtual void SetContext(const opencascade::handle<AIS_InteractiveContext> & aCtx);

		/****************** SetOwner ******************/
		/**** md5 signature: 3c9542fea45232da4a6e2ddd58ba67f4 ****/
		%feature("compactdefaultargs") SetOwner;
		%feature("autodoc", "Allows you to attribute the owner theapplicativeentity to an interactive object. this can be a shape for a set of sub-shapes or a sub-shape for sub-shapes which it is composed of. the owner takes the form of a transient.

Parameters
----------
theApplicativeEntity: Standard_Transient

Returns
-------
None
") SetOwner;
		void SetOwner(const opencascade::handle<Standard_Transient> & theApplicativeEntity);

		/****************** Signature ******************/
		/**** md5 signature: 04c50097d676454d1a64488eb69af2dc ****/
		%feature("compactdefaultargs") Signature;
		%feature("autodoc", "Specifies additional characteristics of interactive object of type(); -1 by default. among the datums, this signature is attributed to the shape. the remaining datums have the following default signatures: - point signature 1 - axis  signature 2 - trihedron signature 3 - planetrihedron signature 4 - line  signature 5 - circle signature 6 - plane signature 7.

Returns
-------
int
") Signature;
		virtual Standard_Integer Signature();

		/****************** Type ******************/
		/**** md5 signature: 7e0280329d789210bd49ed9764da22e3 ****/
		%feature("compactdefaultargs") Type;
		%feature("autodoc", "Returns the kind of interactive object; ais_koi_none by default.

Returns
-------
AIS_KindOfInteractive
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
* class AIS_ManipulatorOwner *
*****************************/
class AIS_ManipulatorOwner : public SelectMgr_EntityOwner {
	public:
		/****************** AIS_ManipulatorOwner ******************/
		/**** md5 signature: e9149e1393505f2a15862a109e2ace43 ****/
		%feature("compactdefaultargs") AIS_ManipulatorOwner;
		%feature("autodoc", "No available documentation.

Parameters
----------
theSelObject: SelectMgr_SelectableObject
theIndex: int
theMode: AIS_ManipulatorMode
thePriority: int,optional
	default value is 0

Returns
-------
None
") AIS_ManipulatorOwner;
		 AIS_ManipulatorOwner(const opencascade::handle<SelectMgr_SelectableObject> & theSelObject, const Standard_Integer theIndex, const AIS_ManipulatorMode theMode, const Standard_Integer thePriority = 0);

		/****************** HilightWithColor ******************/
		/**** md5 signature: 71c328368ee46e9ee02419c61fa1b191 ****/
		%feature("compactdefaultargs") HilightWithColor;
		%feature("autodoc", "No available documentation.

Parameters
----------
thePM: PrsMgr_PresentationManager3d
theStyle: Prs3d_Drawer
theMode: int

Returns
-------
None
") HilightWithColor;
		virtual void HilightWithColor(const opencascade::handle<PrsMgr_PresentationManager3d> & thePM, const opencascade::handle<Prs3d_Drawer> & theStyle, const Standard_Integer theMode);

		/****************** Index ******************/
		/**** md5 signature: 0be2d384cf83d16771bb3f9c857c6326 ****/
		%feature("compactdefaultargs") Index;
		%feature("autodoc", "Returns index of manipulator axis.

Returns
-------
int
") Index;
		Standard_Integer Index();

		/****************** IsHilighted ******************/
		/**** md5 signature: 75ad53fe5d3fc51cf2a9dd7e62ee1347 ****/
		%feature("compactdefaultargs") IsHilighted;
		%feature("autodoc", "No available documentation.

Parameters
----------
thePM: PrsMgr_PresentationManager
theMode: int

Returns
-------
bool
") IsHilighted;
		Standard_Boolean IsHilighted(const opencascade::handle<PrsMgr_PresentationManager> & thePM, const Standard_Integer theMode);

		/****************** Mode ******************/
		/**** md5 signature: 185ce7f30436df2ae54dc24077fa08f1 ****/
		%feature("compactdefaultargs") Mode;
		%feature("autodoc", "No available documentation.

Returns
-------
AIS_ManipulatorMode
") Mode;
		AIS_ManipulatorMode Mode();

		/****************** Unhilight ******************/
		/**** md5 signature: 2c4ea7d84a1f77c1bca30641ba41616d ****/
		%feature("compactdefaultargs") Unhilight;
		%feature("autodoc", "No available documentation.

Parameters
----------
thePM: PrsMgr_PresentationManager
theMode: int

Returns
-------
None
") Unhilight;
		virtual void Unhilight(const opencascade::handle<PrsMgr_PresentationManager> & thePM, const Standard_Integer theMode);

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
		/****************** AIS_PointCloudOwner ******************/
		/**** md5 signature: 670174874a27bd532f1d46109c419250 ****/
		%feature("compactdefaultargs") AIS_PointCloudOwner;
		%feature("autodoc", "Main constructor.

Parameters
----------
theOrigin: AIS_PointCloud

Returns
-------
None
") AIS_PointCloudOwner;
		 AIS_PointCloudOwner(const opencascade::handle<AIS_PointCloud> & theOrigin);

		/****************** Clear ******************/
		/**** md5 signature: 5dc5e5efb2de906b524713f5bda45e1c ****/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Clears presentation.

Parameters
----------
thePrsMgr: PrsMgr_PresentationManager
theMode: int

Returns
-------
None
") Clear;
		virtual void Clear(const opencascade::handle<PrsMgr_PresentationManager> & thePrsMgr, const Standard_Integer theMode);

		/****************** DetectedPoints ******************/
		/**** md5 signature: 417e2050aa5d23f2a94aa5e022916b2d ****/
		%feature("compactdefaultargs") DetectedPoints;
		%feature("autodoc", "Return last detected points. warning! indexation starts with 0 (shifted by -1 comparing to graphic3d_arrayofpoints::vertice()).

Returns
-------
opencascade::handle<TColStd_HPackedMapOfInteger>
") DetectedPoints;
		const opencascade::handle<TColStd_HPackedMapOfInteger> & DetectedPoints();

		/****************** HilightWithColor ******************/
		/**** md5 signature: ac1a5f13927ca247a3c85abe1279df2d ****/
		%feature("compactdefaultargs") HilightWithColor;
		%feature("autodoc", "Handle dynamic highlighting.

Parameters
----------
thePrsMgr: PrsMgr_PresentationManager3d
theStyle: Prs3d_Drawer
theMode: int

Returns
-------
None
") HilightWithColor;
		virtual void HilightWithColor(const opencascade::handle<PrsMgr_PresentationManager3d> & thePrsMgr, const opencascade::handle<Prs3d_Drawer> & theStyle, const Standard_Integer theMode);

		/****************** IsForcedHilight ******************/
		/**** md5 signature: b7e8a39578fc441f958f06f3cf923c7d ****/
		%feature("compactdefaultargs") IsForcedHilight;
		%feature("autodoc", "Always update dynamic highlighting.

Returns
-------
bool
") IsForcedHilight;
		virtual Standard_Boolean IsForcedHilight();

		/****************** SelectedPoints ******************/
		/**** md5 signature: 2ac5ef1820739df521163373d95dceba ****/
		%feature("compactdefaultargs") SelectedPoints;
		%feature("autodoc", "Return selected points. warning! indexation starts with 0 (shifted by -1 comparing to graphic3d_arrayofpoints::vertice()).

Returns
-------
opencascade::handle<TColStd_HPackedMapOfInteger>
") SelectedPoints;
		const opencascade::handle<TColStd_HPackedMapOfInteger> & SelectedPoints();

		/****************** Unhilight ******************/
		/**** md5 signature: da660df8a6c884db0328dd60a36026ae ****/
		%feature("compactdefaultargs") Unhilight;
		%feature("autodoc", "Removes highlighting.

Parameters
----------
thePrsMgr: PrsMgr_PresentationManager
theMode: int

Returns
-------
None
") Unhilight;
		virtual void Unhilight(const opencascade::handle<PrsMgr_PresentationManager> & thePrsMgr, const Standard_Integer theMode);

};


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
		/****************** AIS_Selection ******************/
		/**** md5 signature: bd27ce322f4357aff0848195050258b2 ****/
		%feature("compactdefaultargs") AIS_Selection;
		%feature("autodoc", "Creates a new selection.

Returns
-------
None
") AIS_Selection;
		 AIS_Selection();

		/****************** AddSelect ******************/
		/**** md5 signature: 935dfa1e78a7bd4bc211338bfecc5077 ****/
		%feature("compactdefaultargs") AddSelect;
		%feature("autodoc", "The object is always add int the selection. faster when the number of objects selected is great.

Parameters
----------
theObject: SelectMgr_EntityOwner

Returns
-------
AIS_SelectStatus
") AddSelect;
		virtual AIS_SelectStatus AddSelect(const opencascade::handle<SelectMgr_EntityOwner> & theObject);

		/****************** Clear ******************/
		/**** md5 signature: 1badd2d119b64dbdb177834e510c3af9 ****/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Removes all the object of the selection.

Returns
-------
None
") Clear;
		virtual void Clear();

		/****************** ClearAndSelect ******************/
		/**** md5 signature: 8b52ba2d74fab9aa0e60b9e59590b3f1 ****/
		%feature("compactdefaultargs") ClearAndSelect;
		%feature("autodoc", "Clears the selection and adds the object in the selection.

Parameters
----------
theObject: SelectMgr_EntityOwner

Returns
-------
None
") ClearAndSelect;
		virtual void ClearAndSelect(const opencascade::handle<SelectMgr_EntityOwner> & theObject);

		/****************** Extent ******************/
		/**** md5 signature: 19453f219e568f9c5109a0fd06459e95 ****/
		%feature("compactdefaultargs") Extent;
		%feature("autodoc", "Return the number of selected objects.

Returns
-------
int
") Extent;
		Standard_Integer Extent();

		/****************** Init ******************/
		/**** md5 signature: ca2feb116ce485f3e8278f79ba5f5d53 ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Start iteration through selected objects.

Returns
-------
None
") Init;
		void Init();

		/****************** IsEmpty ******************/
		/**** md5 signature: d529c07ce9e12eea3222188c82b0e80b ****/
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "Return true if list of selected objects is empty.

Returns
-------
bool
") IsEmpty;
		Standard_Boolean IsEmpty();

		/****************** IsSelected ******************/
		/**** md5 signature: 5ff80b2a0592facc019e9c16f23576a9 ****/
		%feature("compactdefaultargs") IsSelected;
		%feature("autodoc", "Checks if the object is in the selection.

Parameters
----------
theObject: SelectMgr_EntityOwner

Returns
-------
bool
") IsSelected;
		Standard_Boolean IsSelected(const opencascade::handle<SelectMgr_EntityOwner> & theObject);

		/****************** More ******************/
		/**** md5 signature: cff271d3b32940da94bada40648f9096 ****/
		%feature("compactdefaultargs") More;
		%feature("autodoc", "Return true if iterator points to selected object.

Returns
-------
bool
") More;
		Standard_Boolean More();

		/****************** Next ******************/
		/**** md5 signature: 1201a55f750036045cd397a65f07fc7d ****/
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "Continue iteration through selected objects.

Returns
-------
None
") Next;
		void Next();

		/****************** Objects ******************/
		/**** md5 signature: cd0377eef6bd9573f695d03614c020ca ****/
		%feature("compactdefaultargs") Objects;
		%feature("autodoc", "Return the list of selected objects.

Returns
-------
AIS_NListOfEntityOwner
") Objects;
		const AIS_NListOfEntityOwner & Objects();

		/****************** Select ******************/
		/**** md5 signature: 87943d82b4002f5fb77cbc7b75a89c73 ****/
		%feature("compactdefaultargs") Select;
		%feature("autodoc", "If the object is not yet in the selection, it will be added. if the object is already in the selection, it will be removed.

Parameters
----------
theObject: SelectMgr_EntityOwner

Returns
-------
AIS_SelectStatus
") Select;
		virtual AIS_SelectStatus Select(const opencascade::handle<SelectMgr_EntityOwner> & theObject);

		/****************** Value ******************/
		/**** md5 signature: af0cbe2fba1d118547342f72cf6f251c ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Return selected object at iterator position.

Returns
-------
opencascade::handle<SelectMgr_EntityOwner>
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
		/****************** AIS_TrihedronOwner ******************/
		/**** md5 signature: 23751440812cd73da0d7efc89d2fb02c ****/
		%feature("compactdefaultargs") AIS_TrihedronOwner;
		%feature("autodoc", "Creates an owner of ais_trihedron object.

Parameters
----------
theSelObject: SelectMgr_SelectableObject
theDatumPart: Prs3d_DatumParts
thePriority: int

Returns
-------
None
") AIS_TrihedronOwner;
		 AIS_TrihedronOwner(const opencascade::handle<SelectMgr_SelectableObject> & theSelObject, const Prs3d_DatumParts theDatumPart, const Standard_Integer thePriority);

		/****************** DatumPart ******************/
		/**** md5 signature: a41d605d3f547efa643c1327a2cc9ab2 ****/
		%feature("compactdefaultargs") DatumPart;
		%feature("autodoc", "Returns the datum part identifier.

Returns
-------
Prs3d_DatumParts
") DatumPart;
		Prs3d_DatumParts DatumPart();

		/****************** HilightWithColor ******************/
		/**** md5 signature: 71c328368ee46e9ee02419c61fa1b191 ****/
		%feature("compactdefaultargs") HilightWithColor;
		%feature("autodoc", "Highlights selectable object's presentation.

Parameters
----------
thePM: PrsMgr_PresentationManager3d
theStyle: Prs3d_Drawer
theMode: int

Returns
-------
None
") HilightWithColor;
		virtual void HilightWithColor(const opencascade::handle<PrsMgr_PresentationManager3d> & thePM, const opencascade::handle<Prs3d_Drawer> & theStyle, const Standard_Integer theMode);

		/****************** IsHilighted ******************/
		/**** md5 signature: 75ad53fe5d3fc51cf2a9dd7e62ee1347 ****/
		%feature("compactdefaultargs") IsHilighted;
		%feature("autodoc", "Returns true if the presentation manager thepm highlights selections corresponding to the selection mode amode.

Parameters
----------
thePM: PrsMgr_PresentationManager
theMode: int

Returns
-------
bool
") IsHilighted;
		Standard_Boolean IsHilighted(const opencascade::handle<PrsMgr_PresentationManager> & thePM, const Standard_Integer theMode);

		/****************** Unhilight ******************/
		/**** md5 signature: 2c4ea7d84a1f77c1bca30641ba41616d ****/
		%feature("compactdefaultargs") Unhilight;
		%feature("autodoc", "Removes highlighting from the owner of a detected selectable object in the presentation manager thepm.

Parameters
----------
thePM: PrsMgr_PresentationManager
theMode: int

Returns
-------
None
") Unhilight;
		virtual void Unhilight(const opencascade::handle<PrsMgr_PresentationManager> & thePM, const Standard_Integer theMode);

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
		/****************** AIS_TypeFilter ******************/
		/**** md5 signature: ebb79db0373d3bbba2771a109e6c7798 ****/
		%feature("compactdefaultargs") AIS_TypeFilter;
		%feature("autodoc", "Initializes filter for type, agivenkind.

Parameters
----------
aGivenKind: AIS_KindOfInteractive

Returns
-------
None
") AIS_TypeFilter;
		 AIS_TypeFilter(const AIS_KindOfInteractive aGivenKind);

		/****************** IsOk ******************/
		/**** md5 signature: 30e74b6ea22a70db5324b6f796325694 ****/
		%feature("compactdefaultargs") IsOk;
		%feature("autodoc", "Returns false if the transient is not an interactive object, or if the type of the interactive object is not the same as that stored in the filter.

Parameters
----------
anobj: SelectMgr_EntityOwner

Returns
-------
bool
") IsOk;
		virtual Standard_Boolean IsOk(const opencascade::handle<SelectMgr_EntityOwner> & anobj);

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
class AIS_ViewController {
	public:
		/****************** AIS_ViewController ******************/
		/**** md5 signature: d17644811ddb999bc83fdf0d339ec312 ****/
		%feature("compactdefaultargs") AIS_ViewController;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") AIS_ViewController;
		 AIS_ViewController();

		/****************** AbortViewAnimation ******************/
		/**** md5 signature: 731d09b2f2102bc88821725825303c73 ****/
		%feature("compactdefaultargs") AbortViewAnimation;
		%feature("autodoc", "Interrupt active view animation.

Returns
-------
None
") AbortViewAnimation;
		void AbortViewAnimation();

		/****************** AddTouchPoint ******************/
		/**** md5 signature: 93b82d6d34eb813c208bc4163ef671c4 ****/
		%feature("compactdefaultargs") AddTouchPoint;
		%feature("autodoc", "Add touch point with the given id. this method is expected to be called from ui thread. @param theid touch unique identifier @param thepnt touch coordinates @param theclearbefore if true previously registered touches will be removed.

Parameters
----------
theId: Standard_Size
thePnt: Graphic3d_Vec2d
theClearBefore: bool,optional
	default value is false

Returns
-------
None
") AddTouchPoint;
		virtual void AddTouchPoint(Standard_Size theId, const Graphic3d_Vec2d & thePnt, Standard_Boolean theClearBefore = false);

		/****************** ChangeInputBuffer ******************/
		/**** md5 signature: c617c43bf721a07d3495c85c386656be ****/
		%feature("compactdefaultargs") ChangeInputBuffer;
		%feature("autodoc", "Return input buffer.

Parameters
----------
theType: AIS_ViewInputBufferType

Returns
-------
AIS_ViewInputBuffer
") ChangeInputBuffer;
		AIS_ViewInputBuffer & ChangeInputBuffer(AIS_ViewInputBufferType theType);

		/****************** ChangeKeys ******************/
		/**** md5 signature: 5ba331e57bcd00b6539ab5d9145324ac ****/
		%feature("compactdefaultargs") ChangeKeys;
		%feature("autodoc", "Return keyboard state.

Returns
-------
Aspect_VKeySet
") ChangeKeys;
		Aspect_VKeySet & ChangeKeys();

		/****************** ChangeMouseGestureMap ******************/
		/**** md5 signature: f27868853ccb67e85e9cde87d79c302f ****/
		%feature("compactdefaultargs") ChangeMouseGestureMap;
		%feature("autodoc", "Return map defining mouse gestures.

Returns
-------
AIS_MouseGestureMap
") ChangeMouseGestureMap;
		AIS_MouseGestureMap & ChangeMouseGestureMap();

		/****************** EventTime ******************/
		/**** md5 signature: 6bdc5b17561b5be0e9e4dbdd76a72ace ****/
		%feature("compactdefaultargs") EventTime;
		%feature("autodoc", "Return event time (e.g. current time).

Returns
-------
double
") EventTime;
		double EventTime();

		/****************** FetchNavigationKeys ******************/
		/**** md5 signature: 5b7cb763413888a54d2f8b3826e86cda ****/
		%feature("compactdefaultargs") FetchNavigationKeys;
		%feature("autodoc", "Fetch active navigation actions.

Parameters
----------
theCrouchRatio: float
theRunRatio: float

Returns
-------
AIS_WalkDelta
") FetchNavigationKeys;
		AIS_WalkDelta FetchNavigationKeys(Standard_Real theCrouchRatio, Standard_Real theRunRatio);

		/****************** FlushViewEvents ******************/
		/**** md5 signature: a398ee112a4247b63979af70592cb6a0 ****/
		%feature("compactdefaultargs") FlushViewEvents;
		%feature("autodoc", "Update buffer for rendering thread. this method is expected to be called within synchronization barrier between gui and rendering threads (e.g. gui thread should be locked beforehand to avoid data races). @param thectx interactive context @param theview active view @param thetohandle if true, the handleviewevents() will be called.

Parameters
----------
theCtx: AIS_InteractiveContext
theView: V3d_View
theToHandle: bool,optional
	default value is Standard_False

Returns
-------
None
") FlushViewEvents;
		virtual void FlushViewEvents(const opencascade::handle<AIS_InteractiveContext> & theCtx, const opencascade::handle<V3d_View> & theView, Standard_Boolean theToHandle = Standard_False);

		/****************** GravityPoint ******************/
		/**** md5 signature: 8c62140d10f0624c3042ec01021f9c63 ****/
		%feature("compactdefaultargs") GravityPoint;
		%feature("autodoc", "Compute rotation gravity center point depending on rotation mode. this method is expected to be called from rendering thread.

Parameters
----------
theCtx: AIS_InteractiveContext
theView: V3d_View

Returns
-------
gp_Pnt
") GravityPoint;
		virtual gp_Pnt GravityPoint(const opencascade::handle<AIS_InteractiveContext> & theCtx, const opencascade::handle<V3d_View> & theView);

		/****************** HandleViewEvents ******************/
		/**** md5 signature: e3784b7efd9bd39b5d26bbf04f33ae3d ****/
		%feature("compactdefaultargs") HandleViewEvents;
		%feature("autodoc", "Process events within rendering thread.

Parameters
----------
theCtx: AIS_InteractiveContext
theView: V3d_View

Returns
-------
None
") HandleViewEvents;
		virtual void HandleViewEvents(const opencascade::handle<AIS_InteractiveContext> & theCtx, const opencascade::handle<V3d_View> & theView);

		/****************** HasPreviousMoveTo ******************/
		/**** md5 signature: 3d9b6ec437ae40d62db4d05a38ce3745 ****/
		%feature("compactdefaultargs") HasPreviousMoveTo;
		%feature("autodoc", "Return true if previous position of moveto has been defined.

Returns
-------
bool
") HasPreviousMoveTo;
		bool HasPreviousMoveTo();

		/****************** HasTouchPoints ******************/
		/**** md5 signature: f6532233e79841283a6d00ea2e7477d5 ****/
		%feature("compactdefaultargs") HasTouchPoints;
		%feature("autodoc", "Return true if touches map is not empty.

Returns
-------
bool
") HasTouchPoints;
		bool HasTouchPoints();

		/****************** InputBuffer ******************/
		/**** md5 signature: 0e66b64ea2254057a38ac6990d92e49f ****/
		%feature("compactdefaultargs") InputBuffer;
		%feature("autodoc", "Return input buffer.

Parameters
----------
theType: AIS_ViewInputBufferType

Returns
-------
AIS_ViewInputBuffer
") InputBuffer;
		const AIS_ViewInputBuffer & InputBuffer(AIS_ViewInputBufferType theType);

		/****************** KeyDown ******************/
		/**** md5 signature: e81df4f0db38c260f6d1c40efe826065 ****/
		%feature("compactdefaultargs") KeyDown;
		%feature("autodoc", "Press key. @param thekey key pressed @param thetime event timestamp.

Parameters
----------
theKey: Aspect_VKey
theTime: double
thePressure: double,optional
	default value is 1.0

Returns
-------
None
") KeyDown;
		virtual void KeyDown(Aspect_VKey theKey, double theTime, double thePressure = 1.0);

		/****************** KeyFromAxis ******************/
		/**** md5 signature: a8474160bd508215c794eb4f52308070 ****/
		%feature("compactdefaultargs") KeyFromAxis;
		%feature("autodoc", "Simulate key up/down events from axis value.

Parameters
----------
theNegative: Aspect_VKey
thePositive: Aspect_VKey
theTime: double
thePressure: double

Returns
-------
None
") KeyFromAxis;
		virtual void KeyFromAxis(Aspect_VKey theNegative, Aspect_VKey thePositive, double theTime, double thePressure);

		/****************** KeyUp ******************/
		/**** md5 signature: 15846f68bddea480edd14c42e82a328b ****/
		%feature("compactdefaultargs") KeyUp;
		%feature("autodoc", "Release key. @param thekey key pressed @param thetime event timestamp.

Parameters
----------
theKey: Aspect_VKey
theTime: double

Returns
-------
None
") KeyUp;
		virtual void KeyUp(Aspect_VKey theKey, double theTime);

		/****************** Keys ******************/
		/**** md5 signature: 71088904ae13bced99cf6e1155c58478 ****/
		%feature("compactdefaultargs") Keys;
		%feature("autodoc", "Return keyboard state.

Returns
-------
Aspect_VKeySet
") Keys;
		const Aspect_VKeySet & Keys();

		/****************** LastMouseFlags ******************/
		/**** md5 signature: 891e38e0b645d78e87ef09c802ac2d63 ****/
		%feature("compactdefaultargs") LastMouseFlags;
		%feature("autodoc", "Return active key modifiers passed with last mouse event.

Returns
-------
Aspect_VKeyFlags
") LastMouseFlags;
		Aspect_VKeyFlags LastMouseFlags();

		/****************** LastMousePosition ******************/
		/**** md5 signature: 69040771a57339f922c8a0c6021122bb ****/
		%feature("compactdefaultargs") LastMousePosition;
		%feature("autodoc", "Return last mouse position.

Returns
-------
Graphic3d_Vec2i
") LastMousePosition;
		const Graphic3d_Vec2i & LastMousePosition();

		/****************** MinZoomDistance ******************/
		/**** md5 signature: 5bb7298fe9e97f5e9e5ab0365d634252 ****/
		%feature("compactdefaultargs") MinZoomDistance;
		%feature("autodoc", "Return minimal camera distance for zoom operation.

Returns
-------
double
") MinZoomDistance;
		double MinZoomDistance();

		/****************** MouseAcceleration ******************/
		/**** md5 signature: f265598ba72b1915cecbb49edd0a9d81 ****/
		%feature("compactdefaultargs") MouseAcceleration;
		%feature("autodoc", "Return mouse input acceleration ratio in first person mode; 1.0 by default.

Returns
-------
float
") MouseAcceleration;
		float MouseAcceleration();

		/****************** MouseDoubleClickInterval ******************/
		/**** md5 signature: 0b1c8ccdce13f23e18102cc62c6b767a ****/
		%feature("compactdefaultargs") MouseDoubleClickInterval;
		%feature("autodoc", "Return double click interval in seconds; 0.4 by default.

Returns
-------
double
") MouseDoubleClickInterval;
		double MouseDoubleClickInterval();

		/****************** MouseGestureMap ******************/
		/**** md5 signature: 6a56ea9364a41a0bd33383ac695e295c ****/
		%feature("compactdefaultargs") MouseGestureMap;
		%feature("autodoc", "Return map defining mouse gestures.

Returns
-------
AIS_MouseGestureMap
") MouseGestureMap;
		const AIS_MouseGestureMap & MouseGestureMap();

		/****************** NavigationMode ******************/
		/**** md5 signature: de20fce514777ce3a2a466778f462fc3 ****/
		%feature("compactdefaultargs") NavigationMode;
		%feature("autodoc", "Return camera navigation mode; ais_navigationmode_orbit by default.

Returns
-------
AIS_NavigationMode
") NavigationMode;
		AIS_NavigationMode NavigationMode();

		/****************** OnObjectDragged ******************/
		/**** md5 signature: e3d03bd62923f7f609f4ff8690501efc ****/
		%feature("compactdefaultargs") OnObjectDragged;
		%feature("autodoc", "Callback called by handlemoveto() on dragging object in 3d viewer. this method is expected to be called from rendering thread.

Parameters
----------
theCtx: AIS_InteractiveContext
theView: V3d_View
theAction: AIS_DragAction

Returns
-------
None
") OnObjectDragged;
		virtual void OnObjectDragged(const opencascade::handle<AIS_InteractiveContext> & theCtx, const opencascade::handle<V3d_View> & theView, AIS_DragAction theAction);

		/****************** OnSelectionChanged ******************/
		/**** md5 signature: 19b94fd304dbfac300a34e45312cee94 ****/
		%feature("compactdefaultargs") OnSelectionChanged;
		%feature("autodoc", "Callback called by handlemoveto() on selection in 3d viewer. this method is expected to be called from rendering thread.

Parameters
----------
theCtx: AIS_InteractiveContext
theView: V3d_View

Returns
-------
None
") OnSelectionChanged;
		virtual void OnSelectionChanged(const opencascade::handle<AIS_InteractiveContext> & theCtx, const opencascade::handle<V3d_View> & theView);

		/****************** OrbitAcceleration ******************/
		/**** md5 signature: da5f202aed945c1ea0545de4854049ae ****/
		%feature("compactdefaultargs") OrbitAcceleration;
		%feature("autodoc", "Return orbit rotation acceleration ratio; 1.0 by default.

Returns
-------
float
") OrbitAcceleration;
		float OrbitAcceleration();

		/****************** PickPoint ******************/
		/**** md5 signature: f34d655153fb91f33134075ddbeb45a4 ****/
		%feature("compactdefaultargs") PickPoint;
		%feature("autodoc", "Pick closest point under mouse cursor. this method is expected to be called from rendering thread. @param thepnt [out] result point @param thectx [in] interactive context @param theview [in] active view @param thecursor [in] mouse cursor @param thetosticktopickray [in] when true, the result point will lie on picking ray returns true if result has been found.

Parameters
----------
thePnt: gp_Pnt
theCtx: AIS_InteractiveContext
theView: V3d_View
theCursor: Graphic3d_Vec2i
theToStickToPickRay: bool

Returns
-------
bool
") PickPoint;
		virtual bool PickPoint(gp_Pnt & thePnt, const opencascade::handle<AIS_InteractiveContext> & theCtx, const opencascade::handle<V3d_View> & theView, const Graphic3d_Vec2i & theCursor, bool theToStickToPickRay);

		/****************** PressMouseButton ******************/
		/**** md5 signature: 3011ceaa0add6213ae689425180a9aab ****/
		%feature("compactdefaultargs") PressMouseButton;
		%feature("autodoc", "Handle mouse button press event. this method is expected to be called from ui thread. @param thepoint mouse cursor position @param thebutton pressed button @param themodifiers key modifiers @param theisemulated if true then mouse event comes not from real mouse  but emulated from non-precise input like touch on screen returns true if view should be redrawn.

Parameters
----------
thePoint: Graphic3d_Vec2i
theButton: Aspect_VKeyMouse
theModifiers: Aspect_VKeyFlags
theIsEmulated: bool

Returns
-------
bool
") PressMouseButton;
		bool PressMouseButton(const Graphic3d_Vec2i & thePoint, Aspect_VKeyMouse theButton, Aspect_VKeyFlags theModifiers, bool theIsEmulated);

		/****************** PressedMouseButtons ******************/
		/**** md5 signature: 28ea733557be0052235dc8a7fe3ed119 ****/
		%feature("compactdefaultargs") PressedMouseButtons;
		%feature("autodoc", "Return currently pressed mouse buttons.

Returns
-------
Aspect_VKeyMouse
") PressedMouseButtons;
		Aspect_VKeyMouse PressedMouseButtons();

		/****************** PreviousMoveTo ******************/
		/**** md5 signature: 0238bfa577ed4f8d2d7e4ac20fe0c928 ****/
		%feature("compactdefaultargs") PreviousMoveTo;
		%feature("autodoc", "Return previous position of moveto event in 3d viewer.

Returns
-------
Graphic3d_Vec2i
") PreviousMoveTo;
		const Graphic3d_Vec2i & PreviousMoveTo();

		/****************** ReleaseMouseButton ******************/
		/**** md5 signature: a9b43da8768564266828a78fde53802f ****/
		%feature("compactdefaultargs") ReleaseMouseButton;
		%feature("autodoc", "Handle mouse button release event. this method is expected to be called from ui thread. @param thepoint mouse cursor position @param thebutton released button @param themodifiers key modifiers @param theisemulated if true then mouse event comes not from real mouse  but emulated from non-precise input like touch on screen returns true if view should be redrawn.

Parameters
----------
thePoint: Graphic3d_Vec2i
theButton: Aspect_VKeyMouse
theModifiers: Aspect_VKeyFlags
theIsEmulated: bool

Returns
-------
bool
") ReleaseMouseButton;
		bool ReleaseMouseButton(const Graphic3d_Vec2i & thePoint, Aspect_VKeyMouse theButton, Aspect_VKeyFlags theModifiers, bool theIsEmulated);

		/****************** RemoveTouchPoint ******************/
		/**** md5 signature: 45c3401339716ca58b815f7e44a3d196 ****/
		%feature("compactdefaultargs") RemoveTouchPoint;
		%feature("autodoc", "Remove touch point with the given id. this method is expected to be called from ui thread. @param theid touch unique identifier @param theclearselectpnts if true will initiate clearing of selection points returns true if point has been removed.

Parameters
----------
theId: Standard_Size
theClearSelectPnts: bool,optional
	default value is false

Returns
-------
bool
") RemoveTouchPoint;
		virtual bool RemoveTouchPoint(Standard_Size theId, Standard_Boolean theClearSelectPnts = false);

		/****************** ResetPreviousMoveTo ******************/
		/**** md5 signature: ff7cc9a520e1718b6fc18bc5f46cc8c2 ****/
		%feature("compactdefaultargs") ResetPreviousMoveTo;
		%feature("autodoc", "Reset previous position of moveto.

Returns
-------
None
") ResetPreviousMoveTo;
		void ResetPreviousMoveTo();

		/****************** ResetViewInput ******************/
		/**** md5 signature: 62483d4c4a228ccac68e25645b87e1e9 ****/
		%feature("compactdefaultargs") ResetViewInput;
		%feature("autodoc", "Reset input state (pressed keys, mouse buttons, etc.) e.g. on window focus loss. this method is expected to be called from ui thread.

Returns
-------
None
") ResetViewInput;
		virtual void ResetViewInput();

		/****************** RotationMode ******************/
		/**** md5 signature: fe28f5b4de6b6363de3be27ba9b18699 ****/
		%feature("compactdefaultargs") RotationMode;
		%feature("autodoc", "Return camera rotation mode, ais_rotationmode_bndboxactive by default.

Returns
-------
AIS_RotationMode
") RotationMode;
		AIS_RotationMode RotationMode();

		/****************** SelectInViewer ******************/
		/**** md5 signature: fb1ee6ed4cad231a75d704035cc26f17 ****/
		%feature("compactdefaultargs") SelectInViewer;
		%feature("autodoc", "Perform selection in 3d viewer. this method is expected to be called from ui thread. @param thepnt picking point @param theisxor xor selection flag.

Parameters
----------
thePnt: Graphic3d_Vec2i
theIsXOR: bool,optional
	default value is false

Returns
-------
None
") SelectInViewer;
		virtual void SelectInViewer(const Graphic3d_Vec2i & thePnt, const bool theIsXOR = false);

		/****************** SelectInViewer ******************/
		/**** md5 signature: e6d212ca872d2875f33a351bd67cae52 ****/
		%feature("compactdefaultargs") SelectInViewer;
		%feature("autodoc", "Perform selection in 3d viewer. this method is expected to be called from ui thread. @param thepnts picking point @param theisxor xor selection flag.

Parameters
----------
thePnts: NCollection_Sequence<Graphic3d_Vec2i>
theIsXOR: bool,optional
	default value is false

Returns
-------
None
") SelectInViewer;
		virtual void SelectInViewer(const NCollection_Sequence<Graphic3d_Vec2i> & thePnts, const bool theIsXOR = false);

		/****************** SetAllowDragging ******************/
		/**** md5 signature: df0d4841ca91c4e463f1b9ff172bb5a7 ****/
		%feature("compactdefaultargs") SetAllowDragging;
		%feature("autodoc", "Set if dynamic highlight on mouse move is allowed.

Parameters
----------
theToEnable: bool

Returns
-------
None
") SetAllowDragging;
		void SetAllowDragging(bool theToEnable);

		/****************** SetAllowHighlight ******************/
		/**** md5 signature: 6d086c23d765d930b39eb6604ea15be5 ****/
		%feature("compactdefaultargs") SetAllowHighlight;
		%feature("autodoc", "Set if dragging object is allowed.

Parameters
----------
theToEnable: bool

Returns
-------
None
") SetAllowHighlight;
		void SetAllowHighlight(bool theToEnable);

		/****************** SetAllowPanning ******************/
		/**** md5 signature: aa5e493b4b9d5ca7f79b1000442d464b ****/
		%feature("compactdefaultargs") SetAllowPanning;
		%feature("autodoc", "Set if panning is allowed.

Parameters
----------
theToEnable: bool

Returns
-------
None
") SetAllowPanning;
		void SetAllowPanning(bool theToEnable);

		/****************** SetAllowRotation ******************/
		/**** md5 signature: ac9fc6d418b04ff6ca20098169113ae9 ****/
		%feature("compactdefaultargs") SetAllowRotation;
		%feature("autodoc", "Set if camera rotation is allowed.

Parameters
----------
theToEnable: bool

Returns
-------
None
") SetAllowRotation;
		void SetAllowRotation(bool theToEnable);

		/****************** SetAllowTouchZRotation ******************/
		/**** md5 signature: 684a151d49f6470f151d7e9e10ae1b33 ****/
		%feature("compactdefaultargs") SetAllowTouchZRotation;
		%feature("autodoc", "Set if z-rotation via two-touches gesture is enabled.

Parameters
----------
theToEnable: bool

Returns
-------
None
") SetAllowTouchZRotation;
		void SetAllowTouchZRotation(bool theToEnable);

		/****************** SetAllowZFocus ******************/
		/**** md5 signature: eeb044a0780a3ac8322c4f5acfe6f70b ****/
		%feature("compactdefaultargs") SetAllowZFocus;
		%feature("autodoc", "Set if zfocus change is allowed.

Parameters
----------
theToEnable: bool

Returns
-------
None
") SetAllowZFocus;
		void SetAllowZFocus(bool theToEnable);

		/****************** SetAllowZooming ******************/
		/**** md5 signature: 7baa92e6f17f9c36d0a5fa8f4ea8f5e4 ****/
		%feature("compactdefaultargs") SetAllowZooming;
		%feature("autodoc", "Set if zooming is allowed.

Parameters
----------
theToEnable: bool

Returns
-------
None
") SetAllowZooming;
		void SetAllowZooming(bool theToEnable);

		/****************** SetInvertPitch ******************/
		/**** md5 signature: 337a14fda31c3ddd9f94b558761281f5 ****/
		%feature("compactdefaultargs") SetInvertPitch;
		%feature("autodoc", "Set flag inverting pitch direction.

Parameters
----------
theToInvert: bool

Returns
-------
None
") SetInvertPitch;
		void SetInvertPitch(bool theToInvert);

		/****************** SetLockOrbitZUp ******************/
		/**** md5 signature: 1c3c112156d57b75190d046cf6bd0c46 ****/
		%feature("compactdefaultargs") SetLockOrbitZUp;
		%feature("autodoc", "Set if camera up orientation within ais_navigationmode_orbit rotation mode should be forced z up.

Parameters
----------
theToForceUp: bool

Returns
-------
None
") SetLockOrbitZUp;
		void SetLockOrbitZUp(bool theToForceUp);

		/****************** SetMinZoomDistance ******************/
		/**** md5 signature: 856c0547c4e27c0d164eba54a3f80e01 ****/
		%feature("compactdefaultargs") SetMinZoomDistance;
		%feature("autodoc", "Set minimal camera distance for zoom operation.

Parameters
----------
theDist: double

Returns
-------
None
") SetMinZoomDistance;
		void SetMinZoomDistance(double theDist);

		/****************** SetMouseAcceleration ******************/
		/**** md5 signature: abc78184a58362cc1aa6587b34de644d ****/
		%feature("compactdefaultargs") SetMouseAcceleration;
		%feature("autodoc", "Set mouse input acceleration ratio.

Parameters
----------
theRatio: float

Returns
-------
None
") SetMouseAcceleration;
		void SetMouseAcceleration(float theRatio);

		/****************** SetMouseDoubleClickInterval ******************/
		/**** md5 signature: 1f69fdc78277fa239a1443e52d9b3da6 ****/
		%feature("compactdefaultargs") SetMouseDoubleClickInterval;
		%feature("autodoc", "Set double click interval in seconds.

Parameters
----------
theSeconds: double

Returns
-------
None
") SetMouseDoubleClickInterval;
		void SetMouseDoubleClickInterval(double theSeconds);

		/****************** SetNavigationMode ******************/
		/**** md5 signature: e565c8b8b89295a6fb623e32ef593592 ****/
		%feature("compactdefaultargs") SetNavigationMode;
		%feature("autodoc", "Set camera navigation mode.

Parameters
----------
theMode: AIS_NavigationMode

Returns
-------
None
") SetNavigationMode;
		void SetNavigationMode(AIS_NavigationMode theMode);

		/****************** SetOrbitAcceleration ******************/
		/**** md5 signature: d9ccb4db2cbf77b5f312c630bd8dcdd6 ****/
		%feature("compactdefaultargs") SetOrbitAcceleration;
		%feature("autodoc", "Set orbit rotation acceleration ratio.

Parameters
----------
theRatio: float

Returns
-------
None
") SetOrbitAcceleration;
		void SetOrbitAcceleration(float theRatio);

		/****************** SetRotationMode ******************/
		/**** md5 signature: de089ee21b8924d75e03a45a58b75511 ****/
		%feature("compactdefaultargs") SetRotationMode;
		%feature("autodoc", "Set camera rotation mode.

Parameters
----------
theMode: AIS_RotationMode

Returns
-------
None
") SetRotationMode;
		void SetRotationMode(AIS_RotationMode theMode);

		/****************** SetShowPanAnchorPoint ******************/
		/**** md5 signature: c1af13270fbfe0d32ee0d908aeb118b4 ****/
		%feature("compactdefaultargs") SetShowPanAnchorPoint;
		%feature("autodoc", "Set if panning anchor point within perspective projection should be displayed in 3d viewer.

Parameters
----------
theToShow: bool

Returns
-------
None
") SetShowPanAnchorPoint;
		void SetShowPanAnchorPoint(bool theToShow);

		/****************** SetShowRotateCenter ******************/
		/**** md5 signature: b6a34589631dfba5576c50d2bede4383 ****/
		%feature("compactdefaultargs") SetShowRotateCenter;
		%feature("autodoc", "Set if rotation point should be displayed in 3d viewer.

Parameters
----------
theToShow: bool

Returns
-------
None
") SetShowRotateCenter;
		void SetShowRotateCenter(bool theToShow);

		/****************** SetStickToRayOnRotation ******************/
		/**** md5 signature: cf3fd759c29403514df6afecf8051399 ****/
		%feature("compactdefaultargs") SetStickToRayOnRotation;
		%feature("autodoc", "Set if picked point should be projected to picking ray on rotating around point.

Parameters
----------
theToEnable: bool

Returns
-------
None
") SetStickToRayOnRotation;
		void SetStickToRayOnRotation(bool theToEnable);

		/****************** SetStickToRayOnZoom ******************/
		/**** md5 signature: d25c6b1a39106d29c25ccf77ad2a69b8 ****/
		%feature("compactdefaultargs") SetStickToRayOnZoom;
		%feature("autodoc", "Set if picked point should be projected to picking ray on zooming at point.

Parameters
----------
theToEnable: bool

Returns
-------
None
") SetStickToRayOnZoom;
		void SetStickToRayOnZoom(bool theToEnable);

		/****************** SetThrustSpeed ******************/
		/**** md5 signature: b13ce9ef3d785307e809621923941346 ****/
		%feature("compactdefaultargs") SetThrustSpeed;
		%feature("autodoc", "Set active thrust value.

Parameters
----------
theSpeed: float

Returns
-------
None
") SetThrustSpeed;
		void SetThrustSpeed(float theSpeed);

		/****************** SetTouchToleranceScale ******************/
		/**** md5 signature: f1ade41663fe131af4ad6d54d8feebdb ****/
		%feature("compactdefaultargs") SetTouchToleranceScale;
		%feature("autodoc", "Set scale factor for adjusting tolerances for starting multi-touch gestures.

Parameters
----------
theTolerance: float

Returns
-------
None
") SetTouchToleranceScale;
		void SetTouchToleranceScale(float theTolerance);

		/****************** SetViewAnimation ******************/
		/**** md5 signature: 853aa0ceb7bdaa632922e5e8afd4812f ****/
		%feature("compactdefaultargs") SetViewAnimation;
		%feature("autodoc", "Set view animation to be handled within handleviewredraw().

Parameters
----------
theAnimation: AIS_AnimationCamera

Returns
-------
None
") SetViewAnimation;
		void SetViewAnimation(const opencascade::handle<AIS_AnimationCamera> & theAnimation);

		/****************** SetWalkSpeedAbsolute ******************/
		/**** md5 signature: d26b13370b725b71536c89f45bb23923 ****/
		%feature("compactdefaultargs") SetWalkSpeedAbsolute;
		%feature("autodoc", "Set normal walking speed, in m/s; 1.5 by default.

Parameters
----------
theSpeed: float

Returns
-------
None
") SetWalkSpeedAbsolute;
		void SetWalkSpeedAbsolute(float theSpeed);

		/****************** SetWalkSpeedRelative ******************/
		/**** md5 signature: c00c0ed676f960255bca7849164d38e7 ****/
		%feature("compactdefaultargs") SetWalkSpeedRelative;
		%feature("autodoc", "Set walking speed relative to scene bounding box.

Parameters
----------
theFactor: float

Returns
-------
None
") SetWalkSpeedRelative;
		void SetWalkSpeedRelative(float theFactor);

		/****************** ThrustSpeed ******************/
		/**** md5 signature: 6ebe02e681cce532322afaeb747648ca ****/
		%feature("compactdefaultargs") ThrustSpeed;
		%feature("autodoc", "Return active thrust value; 0.0f by default.

Returns
-------
float
") ThrustSpeed;
		float ThrustSpeed();

		/****************** ToAllowDragging ******************/
		/**** md5 signature: 8a61183f21fcf283f340eec4ff8531b8 ****/
		%feature("compactdefaultargs") ToAllowDragging;
		%feature("autodoc", "Return true if dragging object is allowed; true by default.

Returns
-------
bool
") ToAllowDragging;
		bool ToAllowDragging();

		/****************** ToAllowHighlight ******************/
		/**** md5 signature: 3e9876722280e384f00f5556d90c68eb ****/
		%feature("compactdefaultargs") ToAllowHighlight;
		%feature("autodoc", "Return true if dynamic highlight on mouse move is allowed; true by default.

Returns
-------
bool
") ToAllowHighlight;
		bool ToAllowHighlight();

		/****************** ToAllowPanning ******************/
		/**** md5 signature: d8724d20df71f79fe860bda14e35bbb5 ****/
		%feature("compactdefaultargs") ToAllowPanning;
		%feature("autodoc", "Return true if panning is allowed; true by default.

Returns
-------
bool
") ToAllowPanning;
		bool ToAllowPanning();

		/****************** ToAllowRotation ******************/
		/**** md5 signature: a1bcfb6f1a894b15467dc8feabcaa19b ****/
		%feature("compactdefaultargs") ToAllowRotation;
		%feature("autodoc", "Return true if camera rotation is allowed; true by default.

Returns
-------
bool
") ToAllowRotation;
		bool ToAllowRotation();

		/****************** ToAllowTouchZRotation ******************/
		/**** md5 signature: 7b12f77923cf330922234a4f6873992c ****/
		%feature("compactdefaultargs") ToAllowTouchZRotation;
		%feature("autodoc", "Return true if z-rotation via two-touches gesture is enabled; false by default.

Returns
-------
bool
") ToAllowTouchZRotation;
		bool ToAllowTouchZRotation();

		/****************** ToAllowZFocus ******************/
		/**** md5 signature: 4988d4b63afb784a57e53295d9a3de30 ****/
		%feature("compactdefaultargs") ToAllowZFocus;
		%feature("autodoc", "Return true if zfocus change is allowed; true by default.

Returns
-------
bool
") ToAllowZFocus;
		bool ToAllowZFocus();

		/****************** ToAllowZooming ******************/
		/**** md5 signature: ca4ee2f5af27be92a7253af8446350d8 ****/
		%feature("compactdefaultargs") ToAllowZooming;
		%feature("autodoc", "Return true if zooming is allowed; true by default.

Returns
-------
bool
") ToAllowZooming;
		bool ToAllowZooming();

		/****************** ToInvertPitch ******************/
		/**** md5 signature: 624a70a882a963f2b6dcf003ebe66984 ****/
		%feature("compactdefaultargs") ToInvertPitch;
		%feature("autodoc", "Return true if pitch direction should be inverted while processing aspect_vkey_navlookup/aspect_vkey_navlookdown; false by default.

Returns
-------
bool
") ToInvertPitch;
		bool ToInvertPitch();

		/****************** ToLockOrbitZUp ******************/
		/**** md5 signature: 98161f7200cec34fa1a5e0418649145f ****/
		%feature("compactdefaultargs") ToLockOrbitZUp;
		%feature("autodoc", "Return true if camera up orientation within ais_navigationmode_orbit rotation mode should be forced z up; false by default.

Returns
-------
bool
") ToLockOrbitZUp;
		bool ToLockOrbitZUp();

		/****************** ToShowPanAnchorPoint ******************/
		/**** md5 signature: 20019a5af0a5a60f6ba338d642a2d2b0 ****/
		%feature("compactdefaultargs") ToShowPanAnchorPoint;
		%feature("autodoc", "Return true if panning anchor point within perspective projection should be displayed in 3d viewer; true by default.

Returns
-------
bool
") ToShowPanAnchorPoint;
		bool ToShowPanAnchorPoint();

		/****************** ToShowRotateCenter ******************/
		/**** md5 signature: afbcbc8bef4febc944526842afc0655f ****/
		%feature("compactdefaultargs") ToShowRotateCenter;
		%feature("autodoc", "Return true if rotation point should be displayed in 3d viewer; true by default.

Returns
-------
bool
") ToShowRotateCenter;
		bool ToShowRotateCenter();

		/****************** ToStickToRayOnRotation ******************/
		/**** md5 signature: dadbc81c3708872fefe8c3ec144bd235 ****/
		%feature("compactdefaultargs") ToStickToRayOnRotation;
		%feature("autodoc", "Return true if picked point should be projected to picking ray on rotating around point; true by default.

Returns
-------
bool
") ToStickToRayOnRotation;
		bool ToStickToRayOnRotation();

		/****************** ToStickToRayOnZoom ******************/
		/**** md5 signature: eaf01e1ef26d6069928f6489ab0a8c8b ****/
		%feature("compactdefaultargs") ToStickToRayOnZoom;
		%feature("autodoc", "Return true if picked point should be projected to picking ray on zooming at point; true by default.

Returns
-------
bool
") ToStickToRayOnZoom;
		bool ToStickToRayOnZoom();

		/****************** TouchToleranceScale ******************/
		/**** md5 signature: 2f6188968f83596542ec90be7549c9c6 ****/
		%feature("compactdefaultargs") TouchToleranceScale;
		%feature("autodoc", "Return scale factor for adjusting tolerances for starting multi-touch gestures; 1.0 by default this scale factor is expected to be computed from touch screen resolution.

Returns
-------
float
") TouchToleranceScale;
		float TouchToleranceScale();

		/****************** UpdateMouseButtons ******************/
		/**** md5 signature: 9ccfebb398dffcbca649cfaf245931da ****/
		%feature("compactdefaultargs") UpdateMouseButtons;
		%feature("autodoc", "Handle mouse button press/release event. this method is expected to be called from ui thread. @param thepoint mouse cursor position @param thebuttons pressed buttons @param themodifiers key modifiers @param theisemulated if true then mouse event comes not from real mouse  but emulated from non-precise input like touch on screen returns true if view should be redrawn.

Parameters
----------
thePoint: Graphic3d_Vec2i
theButtons: Aspect_VKeyMouse
theModifiers: Aspect_VKeyFlags
theIsEmulated: bool

Returns
-------
bool
") UpdateMouseButtons;
		virtual bool UpdateMouseButtons(const Graphic3d_Vec2i & thePoint, Aspect_VKeyMouse theButtons, Aspect_VKeyFlags theModifiers, bool theIsEmulated);

		/****************** UpdateMouseClick ******************/
		/**** md5 signature: aafb990cc843bb6cd39d762419c4af3c ****/
		%feature("compactdefaultargs") UpdateMouseClick;
		%feature("autodoc", "Handle mouse button click event (emulated by updatemousebuttons() while releasing single button). note that as this method is called by updatemousebuttons(), it should be executed from ui thread. default implementation redirects to selectinviewer(). this method is expected to be called from ui thread. @param thepoint mouse cursor position @param thebutton clicked button @param themodifiers key modifiers @param theisdoubleclick flag indicating double mouse click returns true if view should be redrawn.

Parameters
----------
thePoint: Graphic3d_Vec2i
theButton: Aspect_VKeyMouse
theModifiers: Aspect_VKeyFlags
theIsDoubleClick: bool

Returns
-------
bool
") UpdateMouseClick;
		virtual bool UpdateMouseClick(const Graphic3d_Vec2i & thePoint, Aspect_VKeyMouse theButton, Aspect_VKeyFlags theModifiers, bool theIsDoubleClick);

		/****************** UpdateMousePosition ******************/
		/**** md5 signature: 24ca41a825cf87f54a5d2e38aaedf170 ****/
		%feature("compactdefaultargs") UpdateMousePosition;
		%feature("autodoc", "Handle mouse cursor movement event. this method is expected to be called from ui thread. @param thepoint mouse cursor position @param thebuttons pressed buttons @param themodifiers key modifiers @param theisemulated if true then mouse event comes not from real mouse  but emulated from non-precise input like touch on screen returns true if view should be redrawn.

Parameters
----------
thePoint: Graphic3d_Vec2i
theButtons: Aspect_VKeyMouse
theModifiers: Aspect_VKeyFlags
theIsEmulated: bool

Returns
-------
bool
") UpdateMousePosition;
		virtual bool UpdateMousePosition(const Graphic3d_Vec2i & thePoint, Aspect_VKeyMouse theButtons, Aspect_VKeyFlags theModifiers, bool theIsEmulated);

		/****************** UpdateMouseScroll ******************/
		/**** md5 signature: 9112a58a31d222aaaaca5bc7dadc5e9d ****/
		%feature("compactdefaultargs") UpdateMouseScroll;
		%feature("autodoc", "Update mouse scroll event; redirects to updatezoom by default. this method is expected to be called from ui thread. @param thedelta mouse cursor position and delta returns true if new event has been created or false if existing one has been updated.

Parameters
----------
theDelta: Aspect_ScrollDelta

Returns
-------
bool
") UpdateMouseScroll;
		virtual bool UpdateMouseScroll(const Aspect_ScrollDelta & theDelta);

		/****************** UpdatePolySelection ******************/
		/**** md5 signature: a7b21ea05bd9285ae2d4ae90cff07198 ****/
		%feature("compactdefaultargs") UpdatePolySelection;
		%feature("autodoc", "Update polygonal selection tool. this method is expected to be called from ui thread. @param thepnt new point to add to polygon @param thetoappend append new point or update the last point.

Parameters
----------
thePnt: Graphic3d_Vec2i
theToAppend: bool

Returns
-------
None
") UpdatePolySelection;
		virtual void UpdatePolySelection(const Graphic3d_Vec2i & thePnt, bool theToAppend);

		/****************** UpdateRubberBand ******************/
		/**** md5 signature: 669fce723d95f678c15282bbb1bd3c7a ****/
		%feature("compactdefaultargs") UpdateRubberBand;
		%feature("autodoc", "Update rectangle selection tool. this method is expected to be called from ui thread. @param thepntfrom rectangle first corner @param thepntto rectangle another corner @param theisxor xor selection flag.

Parameters
----------
thePntFrom: Graphic3d_Vec2i
thePntTo: Graphic3d_Vec2i
theIsXOR: bool,optional
	default value is false

Returns
-------
None
") UpdateRubberBand;
		virtual void UpdateRubberBand(const Graphic3d_Vec2i & thePntFrom, const Graphic3d_Vec2i & thePntTo, const bool theIsXOR = false);

		/****************** UpdateTouchPoint ******************/
		/**** md5 signature: 32b5b3a5782487b44b49157cf52c6e04 ****/
		%feature("compactdefaultargs") UpdateTouchPoint;
		%feature("autodoc", "Update touch point with the given id. if point with specified id was not registered before, it will be added. this method is expected to be called from ui thread. @param theid touch unique identifier @param thepnt touch coordinates.

Parameters
----------
theId: Standard_Size
thePnt: Graphic3d_Vec2d

Returns
-------
None
") UpdateTouchPoint;
		virtual void UpdateTouchPoint(Standard_Size theId, const Graphic3d_Vec2d & thePnt);

		/****************** UpdateViewOrientation ******************/
		/**** md5 signature: ee43c806e8949e02b969471967206777 ****/
		%feature("compactdefaultargs") UpdateViewOrientation;
		%feature("autodoc", "Reset view orientation. this method is expected to be called from ui thread.

Parameters
----------
theOrientation: V3d_TypeOfOrientation
theToFitAll: bool

Returns
-------
None
") UpdateViewOrientation;
		virtual void UpdateViewOrientation(V3d_TypeOfOrientation theOrientation, bool theToFitAll);

		/****************** UpdateZRotation ******************/
		/**** md5 signature: 49c10fcd9e41eb2b1119a794084480d6 ****/
		%feature("compactdefaultargs") UpdateZRotation;
		%feature("autodoc", "Update z rotation event. @param theangle rotation angle, in radians. returns true if new zoom event has been created or false if existing one has been updated.

Parameters
----------
theAngle: double

Returns
-------
bool
") UpdateZRotation;
		virtual bool UpdateZRotation(double theAngle);

		/****************** UpdateZoom ******************/
		/**** md5 signature: 3705bb839abd1b717b4e19145bbe8168 ****/
		%feature("compactdefaultargs") UpdateZoom;
		%feature("autodoc", "Update zoom event (e.g. from mouse scroll). this method is expected to be called from ui thread. @param thedelta mouse cursor position to zoom at and zoom delta returns true if new zoom event has been created or false if existing one has been updated.

Parameters
----------
theDelta: Aspect_ScrollDelta

Returns
-------
bool
") UpdateZoom;
		virtual bool UpdateZoom(const Aspect_ScrollDelta & theDelta);

		/****************** ViewAnimation ******************/
		/**** md5 signature: 7a7517bd1c0e55fdc5279dc1aefd5047 ****/
		%feature("compactdefaultargs") ViewAnimation;
		%feature("autodoc", "Return view animation; empty (but not null) animation by default.

Returns
-------
opencascade::handle<AIS_AnimationCamera>
") ViewAnimation;
		const opencascade::handle<AIS_AnimationCamera> & ViewAnimation();

		/****************** WalkSpeedAbsolute ******************/
		/**** md5 signature: 63209822e3eecea23c4ff51f6e7af537 ****/
		%feature("compactdefaultargs") WalkSpeedAbsolute;
		%feature("autodoc", "Return normal walking speed, in m/s; 1.5 by default.

Returns
-------
float
") WalkSpeedAbsolute;
		float WalkSpeedAbsolute();

		/****************** WalkSpeedRelative ******************/
		/**** md5 signature: 907dc8d9c54a4795e102f9cf3c6361ac ****/
		%feature("compactdefaultargs") WalkSpeedRelative;
		%feature("autodoc", "Return walking speed relative to scene bounding box; 0.1 by default.

Returns
-------
float
") WalkSpeedRelative;
		float WalkSpeedRelative();

		/****************** handleCameraActions ******************/
		/**** md5 signature: e26067a98b91986866681c1bcad0d809 ****/
		%feature("compactdefaultargs") handleCameraActions;
		%feature("autodoc", "Perform camera actions. this method is expected to be called from rendering thread.

Parameters
----------
theCtx: AIS_InteractiveContext
theView: V3d_View
theWalk: AIS_WalkDelta

Returns
-------
None
") handleCameraActions;
		virtual void handleCameraActions(const opencascade::handle<AIS_InteractiveContext> & theCtx, const opencascade::handle<V3d_View> & theView, const AIS_WalkDelta & theWalk);

		/****************** handleMoveTo ******************/
		/**** md5 signature: bd30701597ebc33e344bb6c177211a48 ****/
		%feature("compactdefaultargs") handleMoveTo;
		%feature("autodoc", "Perform moveto/selection/dragging. this method is expected to be called from rendering thread.

Parameters
----------
theCtx: AIS_InteractiveContext
theView: V3d_View

Returns
-------
None
") handleMoveTo;
		virtual void handleMoveTo(const opencascade::handle<AIS_InteractiveContext> & theCtx, const opencascade::handle<V3d_View> & theView);

		/****************** handleOrbitRotation ******************/
		/**** md5 signature: fdc3bbd840949a270881f6aa0f2931a7 ****/
		%feature("compactdefaultargs") handleOrbitRotation;
		%feature("autodoc", "Handle orbital rotation events mygl.orbitrotation. @param theview view to modify @param thepnt 3d point to rotate around @param thetolockzup amend camera to exclude roll angle (put camera up vector to plane containing global z and view direction).

Parameters
----------
theView: V3d_View
thePnt: gp_Pnt
theToLockZUp: bool

Returns
-------
None
") handleOrbitRotation;
		virtual void handleOrbitRotation(const opencascade::handle<V3d_View> & theView, const gp_Pnt & thePnt, bool theToLockZUp);

		/****************** handlePanning ******************/
		/**** md5 signature: 5887c49a23a711bd97b00a82a72bab5a ****/
		%feature("compactdefaultargs") handlePanning;
		%feature("autodoc", "Handle panning event mygl.panning.

Parameters
----------
theView: V3d_View

Returns
-------
None
") handlePanning;
		virtual void handlePanning(const opencascade::handle<V3d_View> & theView);

		/****************** handleViewRedraw ******************/
		/**** md5 signature: 6fd13d07572584fe70e21b27775870be ****/
		%feature("compactdefaultargs") handleViewRedraw;
		%feature("autodoc", "Handle view redraw. this method is expected to be called from rendering thread.

Parameters
----------
theCtx: AIS_InteractiveContext
theView: V3d_View

Returns
-------
None
") handleViewRedraw;
		virtual void handleViewRedraw(const opencascade::handle<AIS_InteractiveContext> & theCtx, const opencascade::handle<V3d_View> & theView);

		/****************** handleViewRotation ******************/
		/**** md5 signature: f2f90628551efd3f46dcbe83213380f1 ****/
		%feature("compactdefaultargs") handleViewRotation;
		%feature("autodoc", "Handle view direction rotation events mygl.viewrotation. this method is expected to be called from rendering thread. @param theview camera to modify @param theyawextra extra yaw increment @param thepitchextra extra pitch increment @param theroll roll value @param thetorestartonincrement flag indicating flight mode.

Parameters
----------
theView: V3d_View
theYawExtra: double
thePitchExtra: double
theRoll: double
theToRestartOnIncrement: bool

Returns
-------
None
") handleViewRotation;
		virtual void handleViewRotation(const opencascade::handle<V3d_View> & theView, double theYawExtra, double thePitchExtra, double theRoll, bool theToRestartOnIncrement);

		/****************** handleZFocusScroll ******************/
		/**** md5 signature: 4d7ba821266f7b764f51666a67a2da46 ****/
		%feature("compactdefaultargs") handleZFocusScroll;
		%feature("autodoc", "Handle zscroll event mygl.zoomactions. this method is expected to be called from rendering thread.

Parameters
----------
theView: V3d_View
theParams: Aspect_ScrollDelta

Returns
-------
None
") handleZFocusScroll;
		virtual void handleZFocusScroll(const opencascade::handle<V3d_View> & theView, const Aspect_ScrollDelta & theParams);

		/****************** handleZRotate ******************/
		/**** md5 signature: 4a013b1ad2e9ee9774ef44523b4a6532 ****/
		%feature("compactdefaultargs") handleZRotate;
		%feature("autodoc", "Handle z rotation event mygl.zrotate.

Parameters
----------
theView: V3d_View

Returns
-------
None
") handleZRotate;
		virtual void handleZRotate(const opencascade::handle<V3d_View> & theView);

		/****************** handleZoom ******************/
		/**** md5 signature: 0e123a7c7df5a4e2cce136990e950a04 ****/
		%feature("compactdefaultargs") handleZoom;
		%feature("autodoc", "Handle zoom event mygl.zoomactions. this method is expected to be called from rendering thread.

Parameters
----------
theView: V3d_View
theParams: Aspect_ScrollDelta
thePnt: gp_Pnt *

Returns
-------
None
") handleZoom;
		virtual void handleZoom(const opencascade::handle<V3d_View> & theView, const Aspect_ScrollDelta & theParams, const gp_Pnt * thePnt);

		/****************** hasPanningAnchorPoint ******************/
		/**** md5 signature: 5a5940ea0f0577e425c4d053777baccb ****/
		%feature("compactdefaultargs") hasPanningAnchorPoint;
		%feature("autodoc", "Return if panning anchor point has been defined.

Returns
-------
bool
") hasPanningAnchorPoint;
		bool hasPanningAnchorPoint();

		/****************** panningAnchorPoint ******************/
		/**** md5 signature: ba684401aa2b89569090e3ad13f4834f ****/
		%feature("compactdefaultargs") panningAnchorPoint;
		%feature("autodoc", "Return active panning anchor point.

Returns
-------
gp_Pnt
") panningAnchorPoint;
		const gp_Pnt panningAnchorPoint();

		/****************** setAskNextFrame ******************/
		/**** md5 signature: 6d19af3a6c77b607b1f07eb2f7996578 ****/
		%feature("compactdefaultargs") setAskNextFrame;
		%feature("autodoc", "Set if another frame should be drawn right after this one.

Parameters
----------
theToDraw: bool,optional
	default value is true

Returns
-------
None
") setAskNextFrame;
		void setAskNextFrame(bool theToDraw = true);

		/****************** setPanningAnchorPoint ******************/
		/**** md5 signature: b7553988e5fbf0f722b71d831535f2ef ****/
		%feature("compactdefaultargs") setPanningAnchorPoint;
		%feature("autodoc", "Set active panning anchor point.

Parameters
----------
thePnt: gp_Pnt

Returns
-------
None
") setPanningAnchorPoint;
		void setPanningAnchorPoint(const gp_Pnt & thePnt);

		/****************** toAskNextFrame ******************/
		/**** md5 signature: d01248dd29bfdaa729f5199d74c25787 ****/
		%feature("compactdefaultargs") toAskNextFrame;
		%feature("autodoc", "Return true if another frame should be drawn right after this one.

Returns
-------
bool
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
		/****************** AIS_ViewCubeOwner ******************/
		/**** md5 signature: 36978750a4457ecd3b36a6a3432d9241 ****/
		%feature("compactdefaultargs") AIS_ViewCubeOwner;
		%feature("autodoc", "Main constructor.

Parameters
----------
theObject: AIS_ViewCube
theOrient: V3d_TypeOfOrientation
thePriority: int,optional
	default value is 5

Returns
-------
None
") AIS_ViewCubeOwner;
		 AIS_ViewCubeOwner(const opencascade::handle<AIS_ViewCube> & theObject, V3d_TypeOfOrientation theOrient, Standard_Integer thePriority = 5);

		/****************** HandleMouseClick ******************/
		/**** md5 signature: c9960462cd9c8c10b47ef70eec4e28e3 ****/
		%feature("compactdefaultargs") HandleMouseClick;
		%feature("autodoc", "Handle mouse button click event.

Parameters
----------
thePoint: Graphic3d_Vec2i
theButton: Aspect_VKeyMouse
theModifiers: Aspect_VKeyFlags
theIsDoubleClick: bool

Returns
-------
bool
") HandleMouseClick;
		virtual Standard_Boolean HandleMouseClick(const Graphic3d_Vec2i & thePoint, Aspect_VKeyMouse theButton, Aspect_VKeyFlags theModifiers, bool theIsDoubleClick);

		/****************** IsForcedHilight ******************/
		/**** md5 signature: dba960b87733b88665f100db30e7dd77 ****/
		%feature("compactdefaultargs") IsForcedHilight;
		%feature("autodoc", "Returns true. this owner will always call method hilight for its selectable object when the owner is detected.

Returns
-------
bool
") IsForcedHilight;
		virtual Standard_Boolean IsForcedHilight();

		/****************** MainOrientation ******************/
		/**** md5 signature: 7d1d15cbf0063e6e41d7faee8d9ffb0a ****/
		%feature("compactdefaultargs") MainOrientation;
		%feature("autodoc", "Return new orientation to set.

Returns
-------
V3d_TypeOfOrientation
") MainOrientation;
		V3d_TypeOfOrientation MainOrientation();

};


%extend AIS_ViewCubeOwner {
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
		bool IsNewGesture;
		NCollection_Sequence<Aspect_ScrollDelta > ZoomActions;
		_orientation Orientation;
		_highlighting MoveTo;
		_selection Selection;
		_panningParams Panning;
		_draggingParams Dragging;
		_orbitRotation OrbitRotation;
		_viewRotation ViewRotation;
		_zrotateParams ZRotate;
		/****************** AIS_ViewInputBuffer ******************/
		/**** md5 signature: 745d73c10e784c3d8e971b2aac633943 ****/
		%feature("compactdefaultargs") AIS_ViewInputBuffer;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") AIS_ViewInputBuffer;
		 AIS_ViewInputBuffer();

		/****************** Reset ******************/
		/**** md5 signature: e3081050d274769a1cd4a93969da94c6 ****/
		%feature("compactdefaultargs") Reset;
		%feature("autodoc", "Reset events buffer.

Returns
-------
None
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
		/****************** AIS_WalkDelta ******************/
		/**** md5 signature: 78d0e66f1b9582c94cc5e1325ffc1ece ****/
		%feature("compactdefaultargs") AIS_WalkDelta;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") AIS_WalkDelta;
		 AIS_WalkDelta();

		/****************** IsCrouching ******************/
		/**** md5 signature: 9edc9fe6122620d3da7900016c4dd274 ****/
		%feature("compactdefaultargs") IsCrouching;
		%feature("autodoc", "Return crouching state.

Returns
-------
bool
") IsCrouching;
		bool IsCrouching();

		/****************** IsEmpty ******************/
		/**** md5 signature: 70a41d5fe65955a28167088305fc6991 ****/
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "Return true when both rotation and translation deltas are empty.

Returns
-------
bool
") IsEmpty;
		bool IsEmpty();

		/****************** IsJumping ******************/
		/**** md5 signature: d4be653fde273b1c6b730a0da8c487b6 ****/
		%feature("compactdefaultargs") IsJumping;
		%feature("autodoc", "Return jumping state.

Returns
-------
bool
") IsJumping;
		bool IsJumping();

		/****************** IsRunning ******************/
		/**** md5 signature: fb4df305f3df2579c794552bb89356af ****/
		%feature("compactdefaultargs") IsRunning;
		%feature("autodoc", "Return running state.

Returns
-------
bool
") IsRunning;
		bool IsRunning();

		/****************** SetCrouching ******************/
		/**** md5 signature: 5eceefece527a932b4edfcab57edade2 ****/
		%feature("compactdefaultargs") SetCrouching;
		%feature("autodoc", "Set crouching state.

Parameters
----------
theIsCrouching: bool

Returns
-------
None
") SetCrouching;
		void SetCrouching(bool theIsCrouching);

		/****************** SetJumping ******************/
		/**** md5 signature: 3b746ded8c228237e58bdc8b95def62f ****/
		%feature("compactdefaultargs") SetJumping;
		%feature("autodoc", "Set jumping state.

Parameters
----------
theIsJumping: bool

Returns
-------
None
") SetJumping;
		void SetJumping(bool theIsJumping);

		/****************** SetRunning ******************/
		/**** md5 signature: 9e52f30649e18f8ab29d5958a3d4ded2 ****/
		%feature("compactdefaultargs") SetRunning;
		%feature("autodoc", "Set running state.

Parameters
----------
theIsRunning: bool

Returns
-------
None
") SetRunning;
		void SetRunning(bool theIsRunning);

		/****************** ToMove ******************/
		/**** md5 signature: 7b66cd6cf6a1dd37a403775814652db7 ****/
		%feature("compactdefaultargs") ToMove;
		%feature("autodoc", "Return true if translation delta is defined.

Returns
-------
bool
") ToMove;
		bool ToMove();

		/****************** ToRotate ******************/
		/**** md5 signature: fcc05bcbce9d2e30ba46ffee48a00dd8 ****/
		%feature("compactdefaultargs") ToRotate;
		%feature("autodoc", "Return true if rotation delta is defined.

Returns
-------
bool
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
		float Value;
		float Pressure;
		float Duration;
		/****************** AIS_WalkPart ******************/
		/**** md5 signature: 5e3a0f6962670df498761fa44109c312 ****/
		%feature("compactdefaultargs") AIS_WalkPart;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") AIS_WalkPart;
		 AIS_WalkPart();

		/****************** IsEmpty ******************/
		/**** md5 signature: 70a41d5fe65955a28167088305fc6991 ****/
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "Return true if delta is empty.

Returns
-------
bool
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
		/****************** AIS_AnimationCamera ******************/
		/**** md5 signature: 8ff92abae4b3ac909180f754a717bd23 ****/
		%feature("compactdefaultargs") AIS_AnimationCamera;
		%feature("autodoc", "Main constructor.

Parameters
----------
theAnimationName: TCollection_AsciiString
theView: V3d_View

Returns
-------
None
") AIS_AnimationCamera;
		 AIS_AnimationCamera(const TCollection_AsciiString & theAnimationName, const opencascade::handle<V3d_View> & theView);

		/****************** CameraEnd ******************/
		/**** md5 signature: b01b09ea2b055e00cd1afbc9547d1944 ****/
		%feature("compactdefaultargs") CameraEnd;
		%feature("autodoc", "Return camera end position.

Returns
-------
opencascade::handle<Graphic3d_Camera>
") CameraEnd;
		const opencascade::handle<Graphic3d_Camera> & CameraEnd();

		/****************** CameraStart ******************/
		/**** md5 signature: d6ebd288f132ab4ec611acad6908ce38 ****/
		%feature("compactdefaultargs") CameraStart;
		%feature("autodoc", "Return camera start position.

Returns
-------
opencascade::handle<Graphic3d_Camera>
") CameraStart;
		const opencascade::handle<Graphic3d_Camera> & CameraStart();

		/****************** SetCameraEnd ******************/
		/**** md5 signature: 75679516df27f3c84a21aa3e0909ecf2 ****/
		%feature("compactdefaultargs") SetCameraEnd;
		%feature("autodoc", "Define camera end position.

Parameters
----------
theCameraEnd: Graphic3d_Camera

Returns
-------
None
") SetCameraEnd;
		void SetCameraEnd(const opencascade::handle<Graphic3d_Camera> & theCameraEnd);

		/****************** SetCameraStart ******************/
		/**** md5 signature: 32b740e9f4a21c3ee69c1acc0dfa9c67 ****/
		%feature("compactdefaultargs") SetCameraStart;
		%feature("autodoc", "Define camera start position.

Parameters
----------
theCameraStart: Graphic3d_Camera

Returns
-------
None
") SetCameraStart;
		void SetCameraStart(const opencascade::handle<Graphic3d_Camera> & theCameraStart);

		/****************** SetView ******************/
		/**** md5 signature: 0584fa04772f11b6b4dc66d41a80a5f7 ****/
		%feature("compactdefaultargs") SetView;
		%feature("autodoc", "Set target view.

Parameters
----------
theView: V3d_View

Returns
-------
None
") SetView;
		void SetView(const opencascade::handle<V3d_View> & theView);

		/****************** View ******************/
		/**** md5 signature: 592d26a27bd3a7b6180f94a10b60dfb1 ****/
		%feature("compactdefaultargs") View;
		%feature("autodoc", "Return the target view.

Returns
-------
opencascade::handle<V3d_View>
") View;
		const opencascade::handle<V3d_View> & View();

};


%make_alias(AIS_AnimationCamera)

%extend AIS_AnimationCamera {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************
* class AIS_AnimationObject *
****************************/
class AIS_AnimationObject : public AIS_Animation {
	public:
		/****************** AIS_AnimationObject ******************/
		/**** md5 signature: c16e60828b420c37f86bd653dd4d9c04 ****/
		%feature("compactdefaultargs") AIS_AnimationObject;
		%feature("autodoc", "Constructor with initialization. note that start/end transformations specify exactly local transformation of the object, not the transformation to be applied to existing local transformation. @param theanimationname animation identifier @param thecontext interactive context where object have been displayed @param theobject object to apply local transformation @param thetrsfstart local transformation at the start of animation (e.g. theobject->localtransformation()) @param thetrsfend local transformation at the end of animation.

Parameters
----------
theAnimationName: TCollection_AsciiString
theContext: AIS_InteractiveContext
theObject: AIS_InteractiveObject
theTrsfStart: gp_Trsf
theTrsfEnd: gp_Trsf

Returns
-------
None
") AIS_AnimationObject;
		 AIS_AnimationObject(const TCollection_AsciiString & theAnimationName, const opencascade::handle<AIS_InteractiveContext> & theContext, const opencascade::handle<AIS_InteractiveObject> & theObject, const gp_Trsf & theTrsfStart, const gp_Trsf & theTrsfEnd);

};


%make_alias(AIS_AnimationObject)

%extend AIS_AnimationObject {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************
* class AIS_Axis *
*****************/
class AIS_Axis : public AIS_InteractiveObject {
	public:
		/****************** AIS_Axis ******************/
		/**** md5 signature: 496908e4e4a697e3d91ac63063fecdfc ****/
		%feature("compactdefaultargs") AIS_Axis;
		%feature("autodoc", "Initializes the line acomponent.

Parameters
----------
aComponent: Geom_Line

Returns
-------
None
") AIS_Axis;
		 AIS_Axis(const opencascade::handle<Geom_Line> & aComponent);

		/****************** AIS_Axis ******************/
		/**** md5 signature: e18674f14ec23c9de38d04b4c4849317 ****/
		%feature("compactdefaultargs") AIS_Axis;
		%feature("autodoc", "Initializes the axis2 position acomponent. the coordinate system used is right-handed.

Parameters
----------
aComponent: Geom_Axis2Placement
anAxisType: AIS_TypeOfAxis

Returns
-------
None
") AIS_Axis;
		 AIS_Axis(const opencascade::handle<Geom_Axis2Placement> & aComponent, const AIS_TypeOfAxis anAxisType);

		/****************** AIS_Axis ******************/
		/**** md5 signature: 7521b6e648a3b47e5909b08aca72ee84 ****/
		%feature("compactdefaultargs") AIS_Axis;
		%feature("autodoc", "Initializes the axis1 position anaxis.

Parameters
----------
anAxis: Geom_Axis1Placement

Returns
-------
None
") AIS_Axis;
		 AIS_Axis(const opencascade::handle<Geom_Axis1Placement> & anAxis);

		/****************** AcceptDisplayMode ******************/
		/**** md5 signature: 4b2dbc71bc9796a113d83252030ddc96 ****/
		%feature("compactdefaultargs") AcceptDisplayMode;
		%feature("autodoc", "Returns true if the interactive object accepts the display mode amode.

Parameters
----------
aMode: int

Returns
-------
bool
") AcceptDisplayMode;
		Standard_Boolean AcceptDisplayMode(const Standard_Integer aMode);

		/****************** Axis2Placement ******************/
		/**** md5 signature: 1eb7fb00f1ddac7348881c96ee090d62 ****/
		%feature("compactdefaultargs") Axis2Placement;
		%feature("autodoc", "Returns the position of axis2 and positions it by identifying it as the x, y, or z axis and giving its direction in 3d space. the coordinate system used is right-handed.

Returns
-------
opencascade::handle<Geom_Axis2Placement>
") Axis2Placement;
		const opencascade::handle<Geom_Axis2Placement> & Axis2Placement();

		/****************** Component ******************/
		/**** md5 signature: f69e55b36337e553cef8f7f1128a7e5d ****/
		%feature("compactdefaultargs") Component;
		%feature("autodoc", "Returns the axis entity acomponent and identifies it as a component of a shape.

Returns
-------
opencascade::handle<Geom_Line>
") Component;
		const opencascade::handle<Geom_Line> & Component();

		/****************** Compute ******************/
		/**** md5 signature: 09436ef6513347d4c96315939d8b75d5 ****/
		%feature("compactdefaultargs") Compute;
		%feature("autodoc", "Computes the presentation according to a point of view given by <aprojector>. to be used when the associated degenerated presentations have been transformed by <atrsf> which is not a pure translation. the hlr prs can't be deducted automatically warning :<atrsf> must be applied to the object to display before computation !!!.

Parameters
----------
aProjector: Prs3d_Projector
aTrsf: Geom_Transformation
aPresentation: Prs3d_Presentation

Returns
-------
None
") Compute;
		virtual void Compute(const opencascade::handle<Prs3d_Projector> & aProjector, const opencascade::handle<Geom_Transformation> & aTrsf, const opencascade::handle<Prs3d_Presentation> & aPresentation);

		/****************** IsXYZAxis ******************/
		/**** md5 signature: 1d85f51d36d0ae430b9a865d101c9dcf ****/
		%feature("compactdefaultargs") IsXYZAxis;
		%feature("autodoc", "Returns a signature of 2 for axis datums. when you activate mode 2 by a signature, you pick ais objects of type ais_axis.

Returns
-------
bool
") IsXYZAxis;
		Standard_Boolean IsXYZAxis();

		/****************** SetAxis1Placement ******************/
		/**** md5 signature: 8c0fc181857403a46c591ffe5130de85 ****/
		%feature("compactdefaultargs") SetAxis1Placement;
		%feature("autodoc", "Constructs a new line to serve as the axis anaxis in 3d space.

Parameters
----------
anAxis: Geom_Axis1Placement

Returns
-------
None
") SetAxis1Placement;
		void SetAxis1Placement(const opencascade::handle<Geom_Axis1Placement> & anAxis);

		/****************** SetAxis2Placement ******************/
		/**** md5 signature: acd86dedac2b089c67648b84cfc69afd ****/
		%feature("compactdefaultargs") SetAxis2Placement;
		%feature("autodoc", "Allows you to provide settings for acomponent:the position and direction of an axis in 3d space. the coordinate system used is right-handed.

Parameters
----------
aComponent: Geom_Axis2Placement
anAxisType: AIS_TypeOfAxis

Returns
-------
None
") SetAxis2Placement;
		void SetAxis2Placement(const opencascade::handle<Geom_Axis2Placement> & aComponent, const AIS_TypeOfAxis anAxisType);

		/****************** SetColor ******************/
		/**** md5 signature: 6b2b764a1e8ffb5d1aa4218d6218005c ****/
		%feature("compactdefaultargs") SetColor;
		%feature("autodoc", "No available documentation.

Parameters
----------
aColor: Quantity_Color

Returns
-------
None
") SetColor;
		void SetColor(const Quantity_Color & aColor);

		/****************** SetComponent ******************/
		/**** md5 signature: a13f4f5c2d68a8a72653cf5c30dc559b ****/
		%feature("compactdefaultargs") SetComponent;
		%feature("autodoc", "Sets the coordinates of the lin acomponent.

Parameters
----------
aComponent: Geom_Line

Returns
-------
None
") SetComponent;
		void SetComponent(const opencascade::handle<Geom_Line> & aComponent);

		/****************** SetTypeOfAxis ******************/
		/**** md5 signature: 020f7cadcbe397a98ebb13acd7bdc321 ****/
		%feature("compactdefaultargs") SetTypeOfAxis;
		%feature("autodoc", "Constructs the entity thetypeaxis to stock information concerning type of axis.

Parameters
----------
theTypeAxis: AIS_TypeOfAxis

Returns
-------
None
") SetTypeOfAxis;
		void SetTypeOfAxis(const AIS_TypeOfAxis theTypeAxis);

		/****************** SetWidth ******************/
		/**** md5 signature: 9d813a0ff21da5ccb02e00971f20abed ****/
		%feature("compactdefaultargs") SetWidth;
		%feature("autodoc", "No available documentation.

Parameters
----------
aValue: float

Returns
-------
None
") SetWidth;
		void SetWidth(const Standard_Real aValue);

		/****************** Signature ******************/
		/**** md5 signature: 4e037e01ba764fd5d5261e3d9ba6557d ****/
		%feature("compactdefaultargs") Signature;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") Signature;
		virtual Standard_Integer Signature();

		/****************** Type ******************/
		/**** md5 signature: bf4aea6b24d0b584b57c781f208134ec ****/
		%feature("compactdefaultargs") Type;
		%feature("autodoc", "No available documentation.

Returns
-------
AIS_KindOfInteractive
") Type;
		virtual AIS_KindOfInteractive Type();

		/****************** TypeOfAxis ******************/
		/**** md5 signature: 9f9988d6567e5e10c79eb93ead9bc6e5 ****/
		%feature("compactdefaultargs") TypeOfAxis;
		%feature("autodoc", "Returns the type of axis.

Returns
-------
AIS_TypeOfAxis
") TypeOfAxis;
		AIS_TypeOfAxis TypeOfAxis();

		/****************** UnsetColor ******************/
		/**** md5 signature: 305de4c541ce8067f3ff456f9ec26b55 ****/
		%feature("compactdefaultargs") UnsetColor;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") UnsetColor;
		void UnsetColor();

		/****************** UnsetWidth ******************/
		/**** md5 signature: a9083157cc12b18148f87c7816510f28 ****/
		%feature("compactdefaultargs") UnsetWidth;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") UnsetWidth;
		void UnsetWidth();

};


%make_alias(AIS_Axis)

%extend AIS_Axis {
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

/* python proy classes for enums */
%pythoncode {

class SelectionMode(IntEnum):
	SelectionMode_Edges = 0
	SelectionMode_Volume = 1
SelectionMode_Edges = SelectionMode.SelectionMode_Edges
SelectionMode_Volume = SelectionMode.SelectionMode_Volume
};
/* end python proxy for enums */

		/****************** AIS_CameraFrustum ******************/
		/**** md5 signature: 150818eb23cd3e2e2db0bb6db4cf94d7 ****/
		%feature("compactdefaultargs") AIS_CameraFrustum;
		%feature("autodoc", "Constructs camera frustum with default configuration.

Returns
-------
None
") AIS_CameraFrustum;
		 AIS_CameraFrustum();

		/****************** AcceptDisplayMode ******************/
		/**** md5 signature: 73e6b64240388c9f5967edd29a7d922a ****/
		%feature("compactdefaultargs") AcceptDisplayMode;
		%feature("autodoc", "Return true if specified display mode is supported.

Parameters
----------
theMode: int

Returns
-------
bool
") AcceptDisplayMode;
		virtual Standard_Boolean AcceptDisplayMode(const Standard_Integer theMode);

		/****************** SetCameraFrustum ******************/
		/**** md5 signature: d196fc8b383c2d94bbf20ae29d0720c5 ****/
		%feature("compactdefaultargs") SetCameraFrustum;
		%feature("autodoc", "Sets camera frustum.

Parameters
----------
theCamera: Graphic3d_Camera

Returns
-------
None
") SetCameraFrustum;
		void SetCameraFrustum(const opencascade::handle<Graphic3d_Camera> & theCamera);

		/****************** SetColor ******************/
		/**** md5 signature: 259272248bacb2cef242adbc667f0ef9 ****/
		%feature("compactdefaultargs") SetColor;
		%feature("autodoc", "Setup custom color.

Parameters
----------
theColor: Quantity_Color

Returns
-------
None
") SetColor;
		virtual void SetColor(const Quantity_Color & theColor);

		/****************** UnsetColor ******************/
		/**** md5 signature: 2da7e2ed6a63f7c70c36c2a82118a7ec ****/
		%feature("compactdefaultargs") UnsetColor;
		%feature("autodoc", "Restore default color.

Returns
-------
None
") UnsetColor;
		virtual void UnsetColor();

		/****************** UnsetTransparency ******************/
		/**** md5 signature: bdf34ac27dd66c689517e7b105e66cb2 ****/
		%feature("compactdefaultargs") UnsetTransparency;
		%feature("autodoc", "Restore transparency setting.

Returns
-------
None
") UnsetTransparency;
		virtual void UnsetTransparency();

};


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
		/****************** AIS_Circle ******************/
		/**** md5 signature: 7840debc97d471b60b1bd796a31a034f ****/
		%feature("compactdefaultargs") AIS_Circle;
		%feature("autodoc", "Initializes this algorithm for constructing ais circle datums initializes the circle acircle.

Parameters
----------
aCircle: Geom_Circle

Returns
-------
None
") AIS_Circle;
		 AIS_Circle(const opencascade::handle<Geom_Circle> & aCircle);

		/****************** AIS_Circle ******************/
		/**** md5 signature: 27923ecaf8cbe2d56e0129b466ec95f1 ****/
		%feature("compactdefaultargs") AIS_Circle;
		%feature("autodoc", "Initializes this algorithm for constructing ais circle datums. initializes the circle thecircle, the arc starting point theustart, the arc ending point theuend, and the type of sensitivity theisfilledcirclesens.

Parameters
----------
theCircle: Geom_Circle
theUStart: float
theUEnd: float
theIsFilledCircleSens: bool,optional
	default value is Standard_False

Returns
-------
None
") AIS_Circle;
		 AIS_Circle(const opencascade::handle<Geom_Circle> & theCircle, const Standard_Real theUStart, const Standard_Real theUEnd, const Standard_Boolean theIsFilledCircleSens = Standard_False);

		/****************** Circle ******************/
		/**** md5 signature: dca94d5c17b802a2d82f4b02016fcaa0 ****/
		%feature("compactdefaultargs") Circle;
		%feature("autodoc", "Returns the circle component defined in setcircle.

Returns
-------
opencascade::handle<Geom_Circle>
") Circle;
		const opencascade::handle<Geom_Circle> & Circle();

		/****************** Compute ******************/
		/**** md5 signature: 09436ef6513347d4c96315939d8b75d5 ****/
		%feature("compactdefaultargs") Compute;
		%feature("autodoc", "Computes the presentation according to a point of view given by <aprojector>. to be used when the associated degenerated presentations have been transformed by <atrsf> which is not a pure translation. the hlr prs can't be deducted automatically warning :<atrsf> must be applied to the object to display before computation !!!.

Parameters
----------
aProjector: Prs3d_Projector
aTrsf: Geom_Transformation
aPresentation: Prs3d_Presentation

Returns
-------
None
") Compute;
		virtual void Compute(const opencascade::handle<Prs3d_Projector> & aProjector, const opencascade::handle<Geom_Transformation> & aTrsf, const opencascade::handle<Prs3d_Presentation> & aPresentation);

		/****************** IsFilledCircleSens ******************/
		/**** md5 signature: ddaea116033193620f481ab3c97bd9d0 ****/
		%feature("compactdefaultargs") IsFilledCircleSens;
		%feature("autodoc", "Returns the type of sensitivity for the circle;.

Returns
-------
bool
") IsFilledCircleSens;
		Standard_Boolean IsFilledCircleSens();

		/****************** Parameters ******************/
		/**** md5 signature: 6bfe2bdfa8f1f8a9a2b0d2ddbe974b6b ****/
		%feature("compactdefaultargs") Parameters;
		%feature("autodoc", "Constructs instances of the starting point and the end point parameters, theu1 and theu2.

Parameters
----------

Returns
-------
theU1: float
theU2: float
") Parameters;
		void Parameters(Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** SetCircle ******************/
		/**** md5 signature: 96449d53f84bdc37171b080fcbaf229f ****/
		%feature("compactdefaultargs") SetCircle;
		%feature("autodoc", "Allows you to provide settings for the circle datum acircle.

Parameters
----------
theCircle: Geom_Circle

Returns
-------
None
") SetCircle;
		void SetCircle(const opencascade::handle<Geom_Circle> & theCircle);

		/****************** SetColor ******************/
		/**** md5 signature: 6b2b764a1e8ffb5d1aa4218d6218005c ****/
		%feature("compactdefaultargs") SetColor;
		%feature("autodoc", "No available documentation.

Parameters
----------
aColor: Quantity_Color

Returns
-------
None
") SetColor;
		void SetColor(const Quantity_Color & aColor);

		/****************** SetFilledCircleSens ******************/
		/**** md5 signature: a806a83742b7e68ae11b365ebebc7a53 ****/
		%feature("compactdefaultargs") SetFilledCircleSens;
		%feature("autodoc", "Sets the type of sensitivity for the circle. if theisfilledcirclesens set to standard_true then the whole circle will be detectable, otherwise only the boundary of the circle.

Parameters
----------
theIsFilledCircleSens: bool

Returns
-------
None
") SetFilledCircleSens;
		void SetFilledCircleSens(const Standard_Boolean theIsFilledCircleSens);

		/****************** SetFirstParam ******************/
		/**** md5 signature: 30825c81f464c29337e52ffb7bc42de8 ****/
		%feature("compactdefaultargs") SetFirstParam;
		%feature("autodoc", "Allows you to set the parameter theu for the starting point of an arc.

Parameters
----------
theU: float

Returns
-------
None
") SetFirstParam;
		void SetFirstParam(const Standard_Real theU);

		/****************** SetLastParam ******************/
		/**** md5 signature: 618bfebbc085b09013b19573c3f2c3ba ****/
		%feature("compactdefaultargs") SetLastParam;
		%feature("autodoc", "Allows you to provide the parameter theu for the end point of an arc.

Parameters
----------
theU: float

Returns
-------
None
") SetLastParam;
		void SetLastParam(const Standard_Real theU);

		/****************** SetWidth ******************/
		/**** md5 signature: 9d813a0ff21da5ccb02e00971f20abed ****/
		%feature("compactdefaultargs") SetWidth;
		%feature("autodoc", "Assigns the width avalue to the solid line boundary of the circle datum.

Parameters
----------
aValue: float

Returns
-------
None
") SetWidth;
		void SetWidth(const Standard_Real aValue);

		/****************** Signature ******************/
		/**** md5 signature: 4e037e01ba764fd5d5261e3d9ba6557d ****/
		%feature("compactdefaultargs") Signature;
		%feature("autodoc", "Returns index 6 by default.

Returns
-------
int
") Signature;
		virtual Standard_Integer Signature();

		/****************** Type ******************/
		/**** md5 signature: bf4aea6b24d0b584b57c781f208134ec ****/
		%feature("compactdefaultargs") Type;
		%feature("autodoc", "Indicates that the type of interactive object is a datum.

Returns
-------
AIS_KindOfInteractive
") Type;
		virtual AIS_KindOfInteractive Type();

		/****************** UnsetColor ******************/
		/**** md5 signature: 305de4c541ce8067f3ff456f9ec26b55 ****/
		%feature("compactdefaultargs") UnsetColor;
		%feature("autodoc", "Removes color from the solid line boundary of the circle datum.

Returns
-------
None
") UnsetColor;
		void UnsetColor();

		/****************** UnsetWidth ******************/
		/**** md5 signature: a9083157cc12b18148f87c7816510f28 ****/
		%feature("compactdefaultargs") UnsetWidth;
		%feature("autodoc", "Removes width settings from the solid line boundary of the circle datum.

Returns
-------
None
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
		/****************** AIS_ColorScale ******************/
		/**** md5 signature: f743d580a5e9c57906d990bffe1e305b ****/
		%feature("compactdefaultargs") AIS_ColorScale;
		%feature("autodoc", "Default constructor.

Returns
-------
None
") AIS_ColorScale;
		 AIS_ColorScale();

		/****************** AcceptDisplayMode ******************/
		/**** md5 signature: 4c81f1c2cfc05fd196e1c09a383a3455 ****/
		%feature("compactdefaultargs") AcceptDisplayMode;
		%feature("autodoc", "Return true if specified display mode is supported.

Parameters
----------
theMode: int

Returns
-------
bool
") AcceptDisplayMode;
		virtual Standard_Boolean AcceptDisplayMode(const Standard_Integer theMode);

		/****************** ColorRange ******************/
		/**** md5 signature: 09c7c44e660693a064e563e79c9b2177 ****/
		%feature("compactdefaultargs") ColorRange;
		%feature("autodoc", "Returns color range corresponding to minimum and maximum values, blue to red by default.

Parameters
----------
theMinColor: Quantity_Color
theMaxColor: Quantity_Color

Returns
-------
None
") ColorRange;
		void ColorRange(Quantity_Color & theMinColor, Quantity_Color & theMaxColor);

		/****************** Compute ******************/
		/**** md5 signature: b5355a3b64ac692f9073af0b450bf918 ****/
		%feature("compactdefaultargs") Compute;
		%feature("autodoc", "Compute presentation.

Parameters
----------
thePresentationManager: PrsMgr_PresentationManager3d
thePresentation: Prs3d_Presentation
theMode: int

Returns
-------
None
") Compute;
		virtual void Compute(const opencascade::handle<PrsMgr_PresentationManager3d> & thePresentationManager, const opencascade::handle<Prs3d_Presentation> & thePresentation, const Standard_Integer theMode);

		/****************** ComputeSelection ******************/
		/**** md5 signature: cebd8858c299db78edb7052c49348937 ****/
		%feature("compactdefaultargs") ComputeSelection;
		%feature("autodoc", "Compute selection - not implemented for color scale.

Parameters
----------
&: SelectMgr_Selection
Standard_Integer: 

Returns
-------
None
") ComputeSelection;
		virtual void ComputeSelection(const opencascade::handle<SelectMgr_Selection > &, const Standard_Integer);

		/****************** FindColor ******************/
		/**** md5 signature: 45503e79acd0e8e9e8f6cbed02ec31bf ****/
		%feature("compactdefaultargs") FindColor;
		%feature("autodoc", "Calculate color according passed value; returns true if value is in range or false, if isn't.

Parameters
----------
theValue: float
theMin: float
theMax: float
theColorsCount: int
theColorHlsMin: Graphic3d_Vec3d
theColorHlsMax: Graphic3d_Vec3d
theColor: Quantity_Color

Returns
-------
bool
") FindColor;
		static Standard_Boolean FindColor(const Standard_Real theValue, const Standard_Real theMin, const Standard_Real theMax, const Standard_Integer theColorsCount, const Graphic3d_Vec3d & theColorHlsMin, const Graphic3d_Vec3d & theColorHlsMax, Quantity_Color & theColor);

		/****************** FindColor ******************/
		/**** md5 signature: 8d3344b8104a62193a16e135eb078b3d ****/
		%feature("compactdefaultargs") FindColor;
		%feature("autodoc", "Calculate color according passed value; returns true if value is in range or false, if isn't.

Parameters
----------
theValue: float
theMin: float
theMax: float
theColorsCount: int
theColor: Quantity_Color

Returns
-------
bool
") FindColor;
		static Standard_Boolean FindColor(const Standard_Real theValue, const Standard_Real theMin, const Standard_Real theMax, const Standard_Integer theColorsCount, Quantity_Color & theColor);

		/****************** FindColor ******************/
		/**** md5 signature: 9abe0c7448de981f5c28d49fc8e91980 ****/
		%feature("compactdefaultargs") FindColor;
		%feature("autodoc", "Calculate color according passed value; returns true if value is in range or false, if isn't.

Parameters
----------
theValue: float
theColor: Quantity_Color

Returns
-------
bool
") FindColor;
		Standard_Boolean FindColor(const Standard_Real theValue, Quantity_Color & theColor);

		/****************** Format ******************/
		/**** md5 signature: e9d46855e7e702fd9247d888cb57d283 ****/
		%feature("compactdefaultargs") Format;
		%feature("autodoc", "Returns the format of text.

Returns
-------
TCollection_AsciiString
") Format;
		const TCollection_AsciiString & Format();

		/****************** GetBreadth ******************/
		/**** md5 signature: 60c66494a66bb8b81538e217bbd69f0f ****/
		%feature("compactdefaultargs") GetBreadth;
		%feature("autodoc", "Returns the breadth of color bar, 0 by default (e.g. should be set by user explicitly before displaying).

Returns
-------
int
") GetBreadth;
		Standard_Integer GetBreadth();

		/****************** GetColorType ******************/
		/**** md5 signature: 74ef7f5246b762298ca7fb66001ffb68 ****/
		%feature("compactdefaultargs") GetColorType;
		%feature("autodoc", "Returns the type of colors, aspect_tocsd_auto by default. aspect_tocsd_auto - value between red and blue aspect_tocsd_user - user specified color from color map.

Returns
-------
Aspect_TypeOfColorScaleData
") GetColorType;
		Aspect_TypeOfColorScaleData GetColorType();

		/****************** GetColors ******************/
		/**** md5 signature: 4eac91b266fb62448dfee88590d32204 ****/
		%feature("compactdefaultargs") GetColors;
		%feature("autodoc", "Returns the user specified colors.

Parameters
----------
theColors: Aspect_SequenceOfColor

Returns
-------
None
") GetColors;
		void GetColors(Aspect_SequenceOfColor & theColors);

		/****************** GetColors ******************/
		/**** md5 signature: 9dd2da5a85896576f1b8faa51824613e ****/
		%feature("compactdefaultargs") GetColors;
		%feature("autodoc", "Returns the user specified colors.

Returns
-------
Aspect_SequenceOfColor
") GetColors;
		const Aspect_SequenceOfColor & GetColors();

		/****************** GetFormat ******************/
		/**** md5 signature: 54c7ef0bc14e2d3ab1ecb4d4d0c39e35 ****/
		%feature("compactdefaultargs") GetFormat;
		%feature("autodoc", "Returns the format for numbers, '%.4g' by default. the same like format for function printf(). used if getlabeltype() is tocsd_auto;.

Returns
-------
TCollection_AsciiString
") GetFormat;
		const TCollection_AsciiString & GetFormat();

		/****************** GetHeight ******************/
		/**** md5 signature: f73bd370be1a33627722a97ab21a3944 ****/
		%feature("compactdefaultargs") GetHeight;
		%feature("autodoc", "Returns the height of color bar, 0 by default (e.g. should be set by user explicitly before displaying).

Returns
-------
int
") GetHeight;
		Standard_Integer GetHeight();

		/****************** GetIntervalColor ******************/
		/**** md5 signature: 9fe0281a4a2854a52a01e0ad862b76c8 ****/
		%feature("compactdefaultargs") GetIntervalColor;
		%feature("autodoc", "Returns the user specified color from color map with index (starts at 1). returns default color if index is out of range in color map.

Parameters
----------
theIndex: int

Returns
-------
Quantity_Color
") GetIntervalColor;
		Quantity_Color GetIntervalColor(const Standard_Integer theIndex);

		/****************** GetLabel ******************/
		/**** md5 signature: 209ac05f071e491f772f57146e650b94 ****/
		%feature("compactdefaultargs") GetLabel;
		%feature("autodoc", "Returns the user specified label with index theindex. index is in range from 1 to getnumberofintervals() or to getnumberofintervals() + 1 if islabelatborder() is true. returns empty string if label not defined.

Parameters
----------
theIndex: int

Returns
-------
TCollection_ExtendedString
") GetLabel;
		TCollection_ExtendedString GetLabel(const Standard_Integer theIndex);

		/****************** GetLabelPosition ******************/
		/**** md5 signature: 88288ffee0ed0f8d63549846a0f422d4 ****/
		%feature("compactdefaultargs") GetLabelPosition;
		%feature("autodoc", "Returns the position of labels concerning color filled rectangles, aspect_tocsp_right by default.

Returns
-------
Aspect_TypeOfColorScalePosition
") GetLabelPosition;
		Aspect_TypeOfColorScalePosition GetLabelPosition();

		/****************** GetLabelType ******************/
		/**** md5 signature: a0a0539f49a2cced1489ebfe193b2cbf ****/
		%feature("compactdefaultargs") GetLabelType;
		%feature("autodoc", "Returns the type of labels, aspect_tocsd_auto by default. aspect_tocsd_auto - labels as boundary values for intervals aspect_tocsd_user - user specified label is used.

Returns
-------
Aspect_TypeOfColorScaleData
") GetLabelType;
		Aspect_TypeOfColorScaleData GetLabelType();

		/****************** GetLabels ******************/
		/**** md5 signature: b61c0c474dbe12a38ad32ccf53629f06 ****/
		%feature("compactdefaultargs") GetLabels;
		%feature("autodoc", "Returns the user specified labels.

Parameters
----------
theLabels: TColStd_SequenceOfExtendedString

Returns
-------
None
") GetLabels;
		void GetLabels(TColStd_SequenceOfExtendedString & theLabels);

		/****************** GetMax ******************/
		/**** md5 signature: 6dbd6ddcdeb1e84f290e8ef25a18ec36 ****/
		%feature("compactdefaultargs") GetMax;
		%feature("autodoc", "Returns maximal value of color scale, 1.0 by default.

Returns
-------
float
") GetMax;
		Standard_Real GetMax();

		/****************** GetMin ******************/
		/**** md5 signature: 012840e577d48b8e93dc4b2ebfe7fab8 ****/
		%feature("compactdefaultargs") GetMin;
		%feature("autodoc", "Returns minimal value of color scale, 0.0 by default.

Returns
-------
float
") GetMin;
		Standard_Real GetMin();

		/****************** GetNumberOfIntervals ******************/
		/**** md5 signature: 7a45275605944756fb48c569f3216264 ****/
		%feature("compactdefaultargs") GetNumberOfIntervals;
		%feature("autodoc", "Returns the number of color scale intervals, 10 by default.

Returns
-------
int
") GetNumberOfIntervals;
		Standard_Integer GetNumberOfIntervals();

		/****************** GetPosition ******************/
		/**** md5 signature: 34da0784d19f0c8adbfc5576fc684578 ****/
		%feature("compactdefaultargs") GetPosition;
		%feature("autodoc", "Returns the bottom-left position of color scale, 0x0 by default.

Parameters
----------

Returns
-------
theX: float
theY: float
") GetPosition;
		void GetPosition(Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** GetRange ******************/
		/**** md5 signature: 2b2ba75ae145a171d46ddece662d6e49 ****/
		%feature("compactdefaultargs") GetRange;
		%feature("autodoc", "Returns minimal and maximal values of color scale, 0.0 to 1.0 by default.

Parameters
----------

Returns
-------
theMin: float
theMax: float
") GetRange;
		void GetRange(Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** GetSize ******************/
		/**** md5 signature: bda5f3873fc73f6ed83df761bd931364 ****/
		%feature("compactdefaultargs") GetSize;
		%feature("autodoc", "Returns the size of color bar, 0 and 0 by default (e.g. should be set by user explicitly before displaying).

Parameters
----------

Returns
-------
theBreadth: int
theHeight: int
") GetSize;
		void GetSize(Standard_Integer &OutValue, Standard_Integer &OutValue);

		/****************** GetTextHeight ******************/
		/**** md5 signature: 56193ab0dbdc23a7fce07b41f86aef1c ****/
		%feature("compactdefaultargs") GetTextHeight;
		%feature("autodoc", "Returns the font height of text labels, 20 by default.

Returns
-------
int
") GetTextHeight;
		Standard_Integer GetTextHeight();

		/****************** GetTitle ******************/
		/**** md5 signature: a72936ae7a819e87d6c110c7a97925c7 ****/
		%feature("compactdefaultargs") GetTitle;
		%feature("autodoc", "Returns the color scale title string, empty string by default.

Returns
-------
TCollection_ExtendedString
") GetTitle;
		const TCollection_ExtendedString & GetTitle();

		/****************** GetTitlePosition ******************/
		/**** md5 signature: 6653dc38f69098958c96501f1a02b184 ****/
		%feature("compactdefaultargs") GetTitlePosition;
		%feature("autodoc", "Returns the position of color scale title, aspect_tocsp_left by default.

Returns
-------
Aspect_TypeOfColorScalePosition
") GetTitlePosition;
		Aspect_TypeOfColorScalePosition GetTitlePosition();

		/****************** GetXPosition ******************/
		/**** md5 signature: 5d6923c1ea08e8ed4c013d7b9f0f3965 ****/
		%feature("compactdefaultargs") GetXPosition;
		%feature("autodoc", "Returns the left position of color scale, 0 by default.

Returns
-------
int
") GetXPosition;
		Standard_Integer GetXPosition();

		/****************** GetYPosition ******************/
		/**** md5 signature: 7cc4007da07d7e3f6d724dca71e8398d ****/
		%feature("compactdefaultargs") GetYPosition;
		%feature("autodoc", "Returns the bottom position of color scale, 0 by default.

Returns
-------
int
") GetYPosition;
		Standard_Integer GetYPosition();

		/****************** HueMax ******************/
		/**** md5 signature: e7799f032906a869b978e479658db84b ****/
		%feature("compactdefaultargs") HueMax;
		%feature("autodoc", "Returns the hue angle corresponding to maximum value, 0 by default (red).

Returns
-------
float
") HueMax;
		Standard_Real HueMax();

		/****************** HueMin ******************/
		/**** md5 signature: 345bd0e79609339522ded27cde082f7c ****/
		%feature("compactdefaultargs") HueMin;
		%feature("autodoc", "Returns the hue angle corresponding to minimum value, 230 by default (blue).

Returns
-------
float
") HueMin;
		Standard_Real HueMin();

		/****************** HueRange ******************/
		/**** md5 signature: b7bf861498dcd72e2e9e1407ed935519 ****/
		%feature("compactdefaultargs") HueRange;
		%feature("autodoc", "Returns the hue angle range corresponding to minimum and maximum values, 230 to 0 by default (blue to red).

Parameters
----------

Returns
-------
theMinAngle: float
theMaxAngle: float
") HueRange;
		void HueRange(Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** IsLabelAtBorder ******************/
		/**** md5 signature: e70dd3577bdc0d8d3eeffd5bc40cf067 ****/
		%feature("compactdefaultargs") IsLabelAtBorder;
		%feature("autodoc", "Returns true if the labels are placed at border of color intervals, true by default. the automatically generated label will show value exactly on the current position: - value connecting two neighbor intervals (true) - value in the middle of interval (false).

Returns
-------
bool
") IsLabelAtBorder;
		Standard_Boolean IsLabelAtBorder();

		/****************** IsLogarithmic ******************/
		/**** md5 signature: 206c126d3c03062d4da3f5821d473f35 ****/
		%feature("compactdefaultargs") IsLogarithmic;
		%feature("autodoc", "Returns true if the color scale has logarithmic intervals, false by default.

Returns
-------
bool
") IsLogarithmic;
		Standard_Boolean IsLogarithmic();

		/****************** IsReversed ******************/
		/**** md5 signature: fc4392faff5ff74541d64e131a69df7d ****/
		%feature("compactdefaultargs") IsReversed;
		%feature("autodoc", "Returns true if the labels and colors used in reversed order, false by default. - normal, bottom-up order with minimal value on the bottom and maximum value on top. - reversed, top-down order with maximum value on the bottom and minimum value on top.

Returns
-------
bool
") IsReversed;
		Standard_Boolean IsReversed();

		/****************** IsSmoothTransition ******************/
		/**** md5 signature: 948f5603b0f0b0b71079796c742b4a27 ****/
		%feature("compactdefaultargs") IsSmoothTransition;
		%feature("autodoc", "Return true if color transition between neighbor intervals should be linearly interpolated, false by default.

Returns
-------
bool
") IsSmoothTransition;
		Standard_Boolean IsSmoothTransition();

		/****************** Labels ******************/
		/**** md5 signature: ba9d9d591e9b7d0404c8a268dba1ff46 ****/
		%feature("compactdefaultargs") Labels;
		%feature("autodoc", "Returns the user specified labels.

Returns
-------
TColStd_SequenceOfExtendedString
") Labels;
		const TColStd_SequenceOfExtendedString & Labels();

		/****************** SetBreadth ******************/
		/**** md5 signature: b169d0a06d61cdb70c75cd65cf142545 ****/
		%feature("compactdefaultargs") SetBreadth;
		%feature("autodoc", "Sets the width of color bar.

Parameters
----------
theBreadth: int

Returns
-------
None
") SetBreadth;
		void SetBreadth(const Standard_Integer theBreadth);

		/****************** SetColorRange ******************/
		/**** md5 signature: 3483915ea52d4e4643411a8644762be9 ****/
		%feature("compactdefaultargs") SetColorRange;
		%feature("autodoc", "Sets color range corresponding to minimum and maximum values.

Parameters
----------
theMinColor: Quantity_Color
theMaxColor: Quantity_Color

Returns
-------
None
") SetColorRange;
		void SetColorRange(const Quantity_Color & theMinColor, const Quantity_Color & theMaxColor);

		/****************** SetColorType ******************/
		/**** md5 signature: ccb79408e792e85c00c45c6bb9b717ac ****/
		%feature("compactdefaultargs") SetColorType;
		%feature("autodoc", "Sets the type of colors. aspect_tocsd_auto - value between red and blue aspect_tocsd_user - user specified color from color map.

Parameters
----------
theType: Aspect_TypeOfColorScaleData

Returns
-------
None
") SetColorType;
		void SetColorType(const Aspect_TypeOfColorScaleData theType);

		/****************** SetColors ******************/
		/**** md5 signature: 053f2a7e1146c7ff1caaf50c036ddd26 ****/
		%feature("compactdefaultargs") SetColors;
		%feature("autodoc", "Sets the color scale colors. the length of the sequence should be equal to getnumberofintervals().

Parameters
----------
theSeq: Aspect_SequenceOfColor

Returns
-------
None
") SetColors;
		void SetColors(const Aspect_SequenceOfColor & theSeq);

		/****************** SetFormat ******************/
		/**** md5 signature: db500bbac847facf0570542df6d698c0 ****/
		%feature("compactdefaultargs") SetFormat;
		%feature("autodoc", "Sets the color scale auto label format specification.

Parameters
----------
theFormat: TCollection_AsciiString

Returns
-------
None
") SetFormat;
		void SetFormat(const TCollection_AsciiString & theFormat);

		/****************** SetHeight ******************/
		/**** md5 signature: e32aa97606dad72235a0a6b4a7c46ba6 ****/
		%feature("compactdefaultargs") SetHeight;
		%feature("autodoc", "Sets the height of color bar.

Parameters
----------
theHeight: int

Returns
-------
None
") SetHeight;
		void SetHeight(const Standard_Integer theHeight);

		/****************** SetHueRange ******************/
		/**** md5 signature: f87adea70a6ccfaf228d21ab54a0cb26 ****/
		%feature("compactdefaultargs") SetHueRange;
		%feature("autodoc", "Sets hue angle range corresponding to minimum and maximum values. the valid angle range is [0, 360], see quantity_color and quantity_toc_hls for more details.

Parameters
----------
theMinAngle: float
theMaxAngle: float

Returns
-------
None
") SetHueRange;
		void SetHueRange(const Standard_Real theMinAngle, const Standard_Real theMaxAngle);

		/****************** SetIntervalColor ******************/
		/**** md5 signature: 754d258b8a860b7f9a3fdd24835d1977 ****/
		%feature("compactdefaultargs") SetIntervalColor;
		%feature("autodoc", "Sets the color of the specified interval. note that list is automatically resized to include specified index. @param thecolor color value to set @param theindex index in range [1, getnumberofintervals()];  appended to the end of list if -1 is specified.

Parameters
----------
theColor: Quantity_Color
theIndex: int

Returns
-------
None
") SetIntervalColor;
		void SetIntervalColor(const Quantity_Color & theColor, const Standard_Integer theIndex);

		/****************** SetLabel ******************/
		/**** md5 signature: cfbcf70c0fd3a5586d1e2aa40a279820 ****/
		%feature("compactdefaultargs") SetLabel;
		%feature("autodoc", "Sets the color scale label at index. note that list is automatically resized to include specified index. @param thelabel new label text @param theindex index in range [1, getnumberofintervals()] or [1, getnumberofintervals() + 1] if islabelatborder() is true;  label is appended to the end of list if negative index is specified.

Parameters
----------
theLabel: TCollection_ExtendedString
theIndex: int

Returns
-------
None
") SetLabel;
		void SetLabel(const TCollection_ExtendedString & theLabel, const Standard_Integer theIndex);

		/****************** SetLabelAtBorder ******************/
		/**** md5 signature: 2e74089f2855b82e157ab10779d34d9a ****/
		%feature("compactdefaultargs") SetLabelAtBorder;
		%feature("autodoc", "Sets true if the labels are placed at border of color intervals (true by default). if set to false, labels will be drawn at color intervals rather than at borders.

Parameters
----------
theOn: bool

Returns
-------
None
") SetLabelAtBorder;
		void SetLabelAtBorder(const Standard_Boolean theOn);

		/****************** SetLabelPosition ******************/
		/**** md5 signature: f2079deb9de667b1bdebac8fa78780a5 ****/
		%feature("compactdefaultargs") SetLabelPosition;
		%feature("autodoc", "Sets the color scale labels position relative to color bar.

Parameters
----------
thePos: Aspect_TypeOfColorScalePosition

Returns
-------
None
") SetLabelPosition;
		void SetLabelPosition(const Aspect_TypeOfColorScalePosition thePos);

		/****************** SetLabelType ******************/
		/**** md5 signature: 25ca56d3438d8f07cae52daa92e3c673 ****/
		%feature("compactdefaultargs") SetLabelType;
		%feature("autodoc", "Sets the type of labels. aspect_tocsd_auto - labels as boundary values for intervals aspect_tocsd_user - user specified label is used.

Parameters
----------
theType: Aspect_TypeOfColorScaleData

Returns
-------
None
") SetLabelType;
		void SetLabelType(const Aspect_TypeOfColorScaleData theType);

		/****************** SetLabels ******************/
		/**** md5 signature: bfef69cf016bddb79975f840b471e057 ****/
		%feature("compactdefaultargs") SetLabels;
		%feature("autodoc", "Sets the color scale labels. the length of the sequence should be equal to getnumberofintervals() or to getnumberofintervals() + 1 if islabelatborder() is true. if length of the sequence does not much the number of intervals, then these labels will be considered as 'free' and will be located at the virtual intervals corresponding to the number of labels (with flag islabelatborder() having the same effect as in normal case).

Parameters
----------
theSeq: TColStd_SequenceOfExtendedString

Returns
-------
None
") SetLabels;
		void SetLabels(const TColStd_SequenceOfExtendedString & theSeq);

		/****************** SetLogarithmic ******************/
		/**** md5 signature: 1aa9b8cbb29d4a6b236745d92f8bbb26 ****/
		%feature("compactdefaultargs") SetLogarithmic;
		%feature("autodoc", "Sets true if the color scale has logarithmic intervals.

Parameters
----------
isLogarithmic: bool

Returns
-------
None
") SetLogarithmic;
		void SetLogarithmic(const Standard_Boolean isLogarithmic);

		/****************** SetMax ******************/
		/**** md5 signature: 4c20d3fea95945d42f75fa966f2ad673 ****/
		%feature("compactdefaultargs") SetMax;
		%feature("autodoc", "Sets the maximal value of color scale.

Parameters
----------
theMax: float

Returns
-------
None
") SetMax;
		void SetMax(const Standard_Real theMax);

		/****************** SetMin ******************/
		/**** md5 signature: 6921ecfd3ae542273e85c8630eea2b3b ****/
		%feature("compactdefaultargs") SetMin;
		%feature("autodoc", "Sets the minimal value of color scale.

Parameters
----------
theMin: float

Returns
-------
None
") SetMin;
		void SetMin(const Standard_Real theMin);

		/****************** SetNumberOfIntervals ******************/
		/**** md5 signature: a481601d8f65c5086c8cf8207d34c5e2 ****/
		%feature("compactdefaultargs") SetNumberOfIntervals;
		%feature("autodoc", "Sets the number of color scale intervals.

Parameters
----------
theNum: int

Returns
-------
None
") SetNumberOfIntervals;
		void SetNumberOfIntervals(const Standard_Integer theNum);

		/****************** SetPosition ******************/
		/**** md5 signature: c59d56150ba74cb250a9febbb8af984d ****/
		%feature("compactdefaultargs") SetPosition;
		%feature("autodoc", "Sets the position of color scale.

Parameters
----------
theX: int
theY: int

Returns
-------
None
") SetPosition;
		void SetPosition(const Standard_Integer theX, const Standard_Integer theY);

		/****************** SetRange ******************/
		/**** md5 signature: 447e6555076e1c4cb2530ad76fe5dd51 ****/
		%feature("compactdefaultargs") SetRange;
		%feature("autodoc", "Sets the minimal and maximal value of color scale. note that values order will be ignored - the minimum and maximum values will be swapped if needed. ::setreversed() should be called to swap displaying order.

Parameters
----------
theMin: float
theMax: float

Returns
-------
None
") SetRange;
		void SetRange(const Standard_Real theMin, const Standard_Real theMax);

		/****************** SetReversed ******************/
		/**** md5 signature: 76e30efca3b6a2aa0c8a38b4b2cb3c1f ****/
		%feature("compactdefaultargs") SetReversed;
		%feature("autodoc", "Sets true if the labels and colors used in reversed order.

Parameters
----------
theReverse: bool

Returns
-------
None
") SetReversed;
		void SetReversed(const Standard_Boolean theReverse);

		/****************** SetSize ******************/
		/**** md5 signature: cffb0141a67df2198798e06d0162c5fa ****/
		%feature("compactdefaultargs") SetSize;
		%feature("autodoc", "Sets the size of color bar.

Parameters
----------
theBreadth: int
theHeight: int

Returns
-------
None
") SetSize;
		void SetSize(const Standard_Integer theBreadth, const Standard_Integer theHeight);

		/****************** SetSmoothTransition ******************/
		/**** md5 signature: 2f4cc203f3ce19aa09e9aa11dc5041b3 ****/
		%feature("compactdefaultargs") SetSmoothTransition;
		%feature("autodoc", "Setup smooth color transition.

Parameters
----------
theIsSmooth: bool

Returns
-------
None
") SetSmoothTransition;
		void SetSmoothTransition(const Standard_Boolean theIsSmooth);

		/****************** SetTextHeight ******************/
		/**** md5 signature: 376d7cbb786e7d59161a71cca5489791 ****/
		%feature("compactdefaultargs") SetTextHeight;
		%feature("autodoc", "Sets the height of text of color scale.

Parameters
----------
theHeight: int

Returns
-------
None
") SetTextHeight;
		void SetTextHeight(const Standard_Integer theHeight);

		/****************** SetTitle ******************/
		/**** md5 signature: 1858779efdb47aad84406fafb11b64f2 ****/
		%feature("compactdefaultargs") SetTitle;
		%feature("autodoc", "Sets the color scale title string.

Parameters
----------
theTitle: TCollection_ExtendedString

Returns
-------
None
") SetTitle;
		void SetTitle(const TCollection_ExtendedString & theTitle);

		/****************** SetTitlePosition ******************/
		/**** md5 signature: ffb68e1026952762986ee0e118b51626 ****/
		%feature("compactdefaultargs") SetTitlePosition;
		%feature("autodoc", "Sets the color scale title position.

Parameters
----------
thePos: Aspect_TypeOfColorScalePosition

Returns
-------
None
") SetTitlePosition;
		void SetTitlePosition(const Aspect_TypeOfColorScalePosition thePos);

		/****************** SetXPosition ******************/
		/**** md5 signature: a0e6df9560ed6e5302a5d7db2ecacdf8 ****/
		%feature("compactdefaultargs") SetXPosition;
		%feature("autodoc", "Sets the left position of color scale.

Parameters
----------
theX: int

Returns
-------
None
") SetXPosition;
		void SetXPosition(const Standard_Integer theX);

		/****************** SetYPosition ******************/
		/**** md5 signature: c54835c4c8e01730d64532eb5a13a6e2 ****/
		%feature("compactdefaultargs") SetYPosition;
		%feature("autodoc", "Sets the bottom position of color scale.

Parameters
----------
theY: int

Returns
-------
None
") SetYPosition;
		void SetYPosition(const Standard_Integer theY);

		/****************** TextHeight ******************/
		/**** md5 signature: f1b1fbe39606e457f13a36a5111da3f5 ****/
		%feature("compactdefaultargs") TextHeight;
		%feature("autodoc", "Returns the height of text. @param thetext [in] the text of which to calculate height.

Parameters
----------
theText: TCollection_ExtendedString

Returns
-------
int
") TextHeight;
		Standard_Integer TextHeight(const TCollection_ExtendedString & theText);

		/****************** TextSize ******************/
		/**** md5 signature: df57c5cfbbb6f8f9a5d75ce1943f61ab ****/
		%feature("compactdefaultargs") TextSize;
		%feature("autodoc", "No available documentation.

Parameters
----------
theText: TCollection_ExtendedString
theHeight: int

Returns
-------
theWidth: int
theAscent: int
theDescent: int
") TextSize;
		void TextSize(const TCollection_ExtendedString & theText, const Standard_Integer theHeight, Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue);

		/****************** TextWidth ******************/
		/**** md5 signature: ef6e59d61da317f2087b0778bbc36b23 ****/
		%feature("compactdefaultargs") TextWidth;
		%feature("autodoc", "Returns the width of text. @param thetext [in] the text of which to calculate width.

Parameters
----------
theText: TCollection_ExtendedString

Returns
-------
int
") TextWidth;
		Standard_Integer TextWidth(const TCollection_ExtendedString & theText);

		/****************** hueToValidRange ******************/
		/**** md5 signature: f60f245014fce41540c5cd6f560cd4ad ****/
		%feature("compactdefaultargs") hueToValidRange;
		%feature("autodoc", "Shift hue into valid range. lightness and saturation should be specified in valid range [0.0, 1.0], however hue might be given out of quantity_color range to specify desired range for interpolation.

Parameters
----------
theHue: float

Returns
-------
float
") hueToValidRange;
		static Standard_Real hueToValidRange(const Standard_Real theHue);

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
		/****************** AIS_ConnectedInteractive ******************/
		/**** md5 signature: 377e611268f08de16ae81b87c0243098 ****/
		%feature("compactdefaultargs") AIS_ConnectedInteractive;
		%feature("autodoc", "Disconnects the previous view and sets highlight mode to 0. this highlights the wireframe presentation atypeofpresentation3d. top_allview deactivates hidden line removal.

Parameters
----------
aTypeOfPresentation3d: PrsMgr_TypeOfPresentation3d,optional
	default value is PrsMgr_TOP_AllView

Returns
-------
None
") AIS_ConnectedInteractive;
		 AIS_ConnectedInteractive(const PrsMgr_TypeOfPresentation3d aTypeOfPresentation3d = PrsMgr_TOP_AllView);

		/****************** AcceptDisplayMode ******************/
		/**** md5 signature: 4c81f1c2cfc05fd196e1c09a383a3455 ****/
		%feature("compactdefaultargs") AcceptDisplayMode;
		%feature("autodoc", "Return true if reference presentation accepts specified display mode.

Parameters
----------
theMode: int

Returns
-------
bool
") AcceptDisplayMode;
		virtual Standard_Boolean AcceptDisplayMode(const Standard_Integer theMode);

		/****************** AcceptShapeDecomposition ******************/
		/**** md5 signature: 9203a7c0dd9eda460f91938a68e9d24e ****/
		%feature("compactdefaultargs") AcceptShapeDecomposition;
		%feature("autodoc", "Informs the graphic context that the interactive object may be decomposed into sub-shapes for dynamic selection.

Returns
-------
bool
") AcceptShapeDecomposition;
		virtual Standard_Boolean AcceptShapeDecomposition();

		/****************** Connect ******************/
		/**** md5 signature: 76ce604e5db4b247a8706638259ec61c ****/
		%feature("compactdefaultargs") Connect;
		%feature("autodoc", "Establishes the connection between the connected interactive object, anotheriobj, and its reference.

Parameters
----------
theAnotherObj: AIS_InteractiveObject

Returns
-------
None
") Connect;
		void Connect(const opencascade::handle<AIS_InteractiveObject> & theAnotherObj);

		/****************** Connect ******************/
		/**** md5 signature: 966dfec391c604c7ae9629c925cdd1c4 ****/
		%feature("compactdefaultargs") Connect;
		%feature("autodoc", "Establishes the connection between the connected interactive object, anotheriobj, and its reference. locates instance in alocation.

Parameters
----------
theAnotherObj: AIS_InteractiveObject
theLocation: gp_Trsf

Returns
-------
None
") Connect;
		void Connect(const opencascade::handle<AIS_InteractiveObject> & theAnotherObj, const gp_Trsf & theLocation);

		/****************** Connect ******************/
		/**** md5 signature: 643e5665c805730183e65eb188e2aa0c ****/
		%feature("compactdefaultargs") Connect;
		%feature("autodoc", "Establishes the connection between the connected interactive object, anotheriobj, and its reference. locates instance in alocation.

Parameters
----------
theAnotherObj: AIS_InteractiveObject
theLocation: Geom_Transformation

Returns
-------
None
") Connect;
		void Connect(const opencascade::handle<AIS_InteractiveObject> & theAnotherObj, const opencascade::handle<Geom_Transformation> & theLocation);

		/****************** ConnectedTo ******************/
		/**** md5 signature: 1541a2cb7b3a6f95f8064287356a8f2c ****/
		%feature("compactdefaultargs") ConnectedTo;
		%feature("autodoc", "Returns the connection with the reference interactive object.

Returns
-------
opencascade::handle<AIS_InteractiveObject>
") ConnectedTo;
		const opencascade::handle<AIS_InteractiveObject> & ConnectedTo();

		/****************** Disconnect ******************/
		/**** md5 signature: 3c68b068054eba545e5aa24799ed950d ****/
		%feature("compactdefaultargs") Disconnect;
		%feature("autodoc", "Clears the connection with a source reference. the presentation will no longer be displayed. warning must be done before deleting the presentation.

Returns
-------
None
") Disconnect;
		void Disconnect();

		/****************** HasConnection ******************/
		/**** md5 signature: e23c7e5e57b8a56096bab865a5988291 ****/
		%feature("compactdefaultargs") HasConnection;
		%feature("autodoc", "Returns true if there is a connection established between the presentation and its source reference.

Returns
-------
bool
") HasConnection;
		Standard_Boolean HasConnection();

		/****************** Signature ******************/
		/**** md5 signature: 4e037e01ba764fd5d5261e3d9ba6557d ****/
		%feature("compactdefaultargs") Signature;
		%feature("autodoc", "Returns 0.

Returns
-------
int
") Signature;
		virtual Standard_Integer Signature();

		/****************** Type ******************/
		/**** md5 signature: bf4aea6b24d0b584b57c781f208134ec ****/
		%feature("compactdefaultargs") Type;
		%feature("autodoc", "Returns koi_object.

Returns
-------
AIS_KindOfInteractive
") Type;
		virtual AIS_KindOfInteractive Type();

};


%make_alias(AIS_ConnectedInteractive)

%extend AIS_ConnectedInteractive {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************
* class AIS_Dimension *
**********************/
%nodefaultctor AIS_Dimension;
class AIS_Dimension : public AIS_InteractiveObject {
	public:
		class SelectionGeometry {};
/* public enums */
enum ComputeMode {
	ComputeMode_All = 0,
	ComputeMode_Line = 1,
	ComputeMode_Text = 2,
};

/* end public enums declaration */

/* python proy classes for enums */
%pythoncode {

class ComputeMode(IntEnum):
	ComputeMode_All = 0
	ComputeMode_Line = 1
	ComputeMode_Text = 2
ComputeMode_All = ComputeMode.ComputeMode_All
ComputeMode_Line = ComputeMode.ComputeMode_Line
ComputeMode_Text = ComputeMode.ComputeMode_Text
};
/* end python proxy for enums */

		/****************** AcceptDisplayMode ******************/
		/**** md5 signature: 4c81f1c2cfc05fd196e1c09a383a3455 ****/
		%feature("compactdefaultargs") AcceptDisplayMode;
		%feature("autodoc", "Returns true if the class of objects accepts the display mode themode. the interactive context can have a default mode of representation for the set of interactive objects. this mode may not be accepted by object.

Parameters
----------
theMode: int

Returns
-------
bool
") AcceptDisplayMode;
		virtual Standard_Boolean AcceptDisplayMode(const Standard_Integer theMode);

		/****************** DimensionAspect ******************/
		/**** md5 signature: 2f6e42d6c31db01e2bc6cd4dba206808 ****/
		%feature("compactdefaultargs") DimensionAspect;
		%feature("autodoc", "Gets the dimension aspect from ais object drawer. dimension aspect contains aspects of line, text and arrows for dimension presentation.

Returns
-------
opencascade::handle<Prs3d_DimensionAspect>
") DimensionAspect;
		opencascade::handle<Prs3d_DimensionAspect> DimensionAspect();

		/****************** DisplaySpecialSymbol ******************/
		/**** md5 signature: 7c8dd1fc38f544b9ddae4ac3dde99a54 ****/
		%feature("compactdefaultargs") DisplaySpecialSymbol;
		%feature("autodoc", "Returns dimension special symbol display options.

Returns
-------
AIS_DisplaySpecialSymbol
") DisplaySpecialSymbol;
		AIS_DisplaySpecialSymbol DisplaySpecialSymbol();

		/****************** GetCustomValue ******************/
		/**** md5 signature: 058a2fa09af09ddcd194aa7c58020a83 ****/
		%feature("compactdefaultargs") GetCustomValue;
		%feature("autodoc", "Gets user-defined dimension value. returns dimension value string.

Returns
-------
TCollection_ExtendedString
") GetCustomValue;
		const TCollection_ExtendedString & GetCustomValue();

		/****************** GetDisplayUnits ******************/
		/**** md5 signature: ddc04b9c02a93ab070d76d081dd932f4 ****/
		%feature("compactdefaultargs") GetDisplayUnits;
		%feature("autodoc", "No available documentation.

Returns
-------
TCollection_AsciiString
") GetDisplayUnits;
		virtual const TCollection_AsciiString & GetDisplayUnits();

		/****************** GetFlyout ******************/
		/**** md5 signature: eda99b4bc6964dc635fe0548f0e74f5c ****/
		%feature("compactdefaultargs") GetFlyout;
		%feature("autodoc", "Returns flyout value for dimension.

Returns
-------
float
") GetFlyout;
		Standard_Real GetFlyout();

		/****************** GetGeometryType ******************/
		/**** md5 signature: 15c47df8128e11cd2512f3eef50b1555 ****/
		%feature("compactdefaultargs") GetGeometryType;
		%feature("autodoc", "Geometry type defines type of shapes on which the dimension is to be built. returns type of geometry on which the dimension will be built.

Returns
-------
int
") GetGeometryType;
		Standard_Integer GetGeometryType();

		/****************** GetModelUnits ******************/
		/**** md5 signature: 930ae9f0d86096fd7617e48776d468ed ****/
		%feature("compactdefaultargs") GetModelUnits;
		%feature("autodoc", "No available documentation.

Returns
-------
TCollection_AsciiString
") GetModelUnits;
		virtual const TCollection_AsciiString & GetModelUnits();

		/****************** GetPlane ******************/
		/**** md5 signature: 95477303c6decbabbe95af7270c23fb3 ****/
		%feature("compactdefaultargs") GetPlane;
		%feature("autodoc", "Get the dimension plane in which the 2d dimension presentation is computed. by default, if plane is not defined by user, it is computed automatically after dimension geometry is computed. if computed dimension geometry (points) can't be placed on the user-defined plane, dimension geometry was set as invalid (validity flag is set to false) and dimension presentation will not be computed. if user-defined plane allow geometry placement on it, it will be used for computing of the dimension presentation. returns dimension plane used for presentation computing.

Returns
-------
gp_Pln
") GetPlane;
		const gp_Pln GetPlane();

		/****************** GetTextPosition ******************/
		/**** md5 signature: a2ed058f1d70e12dc0c80a7b532ecf6d ****/
		%feature("compactdefaultargs") GetTextPosition;
		%feature("autodoc", "Computes absolute text position from dimension parameters (flyout, plane and text alignment).

Returns
-------
gp_Pnt
") GetTextPosition;
		virtual const gp_Pnt GetTextPosition();

		/****************** GetValue ******************/
		/**** md5 signature: d602b48d41f0ae37152aeb1633e13fb9 ****/
		%feature("compactdefaultargs") GetValue;
		%feature("autodoc", "Gets dimension measurement value. if the value to display is not specified by user, then the dimension object is responsible to compute it on its own in model space coordinates. returns the dimension value (in model units) which is used during display of the presentation.

Returns
-------
float
") GetValue;
		Standard_Real GetValue();

		/****************** IsTextPositionCustom ******************/
		/**** md5 signature: cb63adca34669ac6b14993304b5cec35 ****/
		%feature("compactdefaultargs") IsTextPositionCustom;
		%feature("autodoc", "Returns true if text position is set by user with method settextposition().

Returns
-------
bool
") IsTextPositionCustom;
		Standard_Boolean IsTextPositionCustom();

		/****************** IsValid ******************/
		/**** md5 signature: 13a0f49072e992d80b7990c04d5ad580 ****/
		%feature("compactdefaultargs") IsValid;
		%feature("autodoc", "Check that the input geometry for dimension is valid and the presentation can be successfully computed. returns true if dimension geometry is ok.

Returns
-------
bool
") IsValid;
		virtual Standard_Boolean IsValid();

		/****************** KindOfDimension ******************/
		/**** md5 signature: 000f5095607efa7b66f30b41d7fadeed ****/
		%feature("compactdefaultargs") KindOfDimension;
		%feature("autodoc", "Returns the kind of dimension.

Returns
-------
AIS_KindOfDimension
") KindOfDimension;
		AIS_KindOfDimension KindOfDimension();

		/****************** SelToleranceForText2d ******************/
		/**** md5 signature: 5e1f7b036e9e0c1b485c5d8da6b6286a ****/
		%feature("compactdefaultargs") SelToleranceForText2d;
		%feature("autodoc", "Returns selection tolerance for text2d: for 2d text selection detection sensitive point with tolerance is used important! only for 2d text.

Returns
-------
float
") SelToleranceForText2d;
		Standard_Real SelToleranceForText2d();

		/****************** SetComputedValue ******************/
		/**** md5 signature: 74883cf4b8a353dfbc969645f6db6362 ****/
		%feature("compactdefaultargs") SetComputedValue;
		%feature("autodoc", "Sets computed dimension value. resets custom value mode if it was set.

Returns
-------
None
") SetComputedValue;
		void SetComputedValue();

		/****************** SetCustomPlane ******************/
		/**** md5 signature: a371fba2e87123f75db102d389dc8aeb ****/
		%feature("compactdefaultargs") SetCustomPlane;
		%feature("autodoc", "Sets user-defined plane where the 2d dimension presentation will be placed. checks validity of this plane if geometry has been set already. validity of the plane is checked according to the geometry set and has different criteria for different kinds of dimensions.

Parameters
----------
thePlane: gp_Pln

Returns
-------
None
") SetCustomPlane;
		virtual void SetCustomPlane(const gp_Pln & thePlane);

		/****************** SetCustomValue ******************/
		/**** md5 signature: e4767ba55ab2e4ffbdd6196bdb4a2e75 ****/
		%feature("compactdefaultargs") SetCustomValue;
		%feature("autodoc", "Sets user-defined dimension value. the user-defined dimension value is specified in model space, and affect by unit conversion during the display. @param thevalue [in] the user-defined value to display.

Parameters
----------
theValue: float

Returns
-------
None
") SetCustomValue;
		void SetCustomValue(const Standard_Real theValue);

		/****************** SetCustomValue ******************/
		/**** md5 signature: aa638ede9bd0fe424934618474a9c131 ****/
		%feature("compactdefaultargs") SetCustomValue;
		%feature("autodoc", "Sets user-defined dimension value. unit conversion during the display is not applyed. @param thevalue [in] the user-defined value to display.

Parameters
----------
theValue: TCollection_ExtendedString

Returns
-------
None
") SetCustomValue;
		void SetCustomValue(const TCollection_ExtendedString & theValue);

		/****************** SetDimensionAspect ******************/
		/**** md5 signature: 653cffb5413acf12c0dc78f7606b5fb6 ****/
		%feature("compactdefaultargs") SetDimensionAspect;
		%feature("autodoc", "Sets new dimension aspect for the interactive object drawer. the dimension aspect provides dynamic properties which are generally used during computation of dimension presentations.

Parameters
----------
theDimensionAspect: Prs3d_DimensionAspect

Returns
-------
None
") SetDimensionAspect;
		void SetDimensionAspect(const opencascade::handle<Prs3d_DimensionAspect> & theDimensionAspect);

		/****************** SetDisplaySpecialSymbol ******************/
		/**** md5 signature: d6c4a985d2826ddc0f2d295e9f047067 ****/
		%feature("compactdefaultargs") SetDisplaySpecialSymbol;
		%feature("autodoc", "Specifies whether to display special symbol or not.

Parameters
----------
theDisplaySpecSymbol: AIS_DisplaySpecialSymbol

Returns
-------
None
") SetDisplaySpecialSymbol;
		void SetDisplaySpecialSymbol(const AIS_DisplaySpecialSymbol theDisplaySpecSymbol);

		/****************** SetDisplayUnits ******************/
		/**** md5 signature: 7c4ef2629b83770e3b1f5cd4e63cfe14 ****/
		%feature("compactdefaultargs") SetDisplayUnits;
		%feature("autodoc", "No available documentation.

Parameters
----------
&: TCollection_AsciiString

Returns
-------
None
") SetDisplayUnits;
		virtual void SetDisplayUnits(const TCollection_AsciiString &);

		/****************** SetFlyout ******************/
		/**** md5 signature: 4a01b6b05617128166d05bb9d7623eae ****/
		%feature("compactdefaultargs") SetFlyout;
		%feature("autodoc", "Sets flyout value for dimension.

Parameters
----------
theFlyout: float

Returns
-------
None
") SetFlyout;
		void SetFlyout(const Standard_Real theFlyout);

		/****************** SetModelUnits ******************/
		/**** md5 signature: ff93ccdd85e84f0afae8a4d40959d10a ****/
		%feature("compactdefaultargs") SetModelUnits;
		%feature("autodoc", "No available documentation.

Parameters
----------
&: TCollection_AsciiString

Returns
-------
None
") SetModelUnits;
		virtual void SetModelUnits(const TCollection_AsciiString &);

		/****************** SetSelToleranceForText2d ******************/
		/**** md5 signature: 537173bd79d28c6fa1429de304305501 ****/
		%feature("compactdefaultargs") SetSelToleranceForText2d;
		%feature("autodoc", "Sets selection tolerance for text2d: for 2d text selection detection sensitive point with tolerance is used to change this tolerance use this method important! only for 2d text.

Parameters
----------
theTol: float

Returns
-------
None
") SetSelToleranceForText2d;
		void SetSelToleranceForText2d(const Standard_Real theTol);

		/****************** SetSpecialSymbol ******************/
		/**** md5 signature: 9f205d745c9301fbbd3129b43fd8deb5 ****/
		%feature("compactdefaultargs") SetSpecialSymbol;
		%feature("autodoc", "Specifies special symbol.

Parameters
----------
theSpecialSymbol: Standard_ExtCharacter

Returns
-------
None
") SetSpecialSymbol;
		void SetSpecialSymbol(const Standard_ExtCharacter theSpecialSymbol);

		/****************** SetTextPosition ******************/
		/**** md5 signature: a461f493832c6de5dbec73ad9e2da9a0 ****/
		%feature("compactdefaultargs") SetTextPosition;
		%feature("autodoc", "Fixes the absolute text position and adjusts flyout, plane and text alignment according to it. updates presentation if the text position is valid. attention! it does not change vertical text alignment. @param thetextpos [in] the point of text position.

Parameters
----------
&: gp_Pnt

Returns
-------
None
") SetTextPosition;
		virtual void SetTextPosition(const gp_Pnt &);

		/****************** SpecialSymbol ******************/
		/**** md5 signature: 29a0ed47fd42ba819648af4ecd1c15a4 ****/
		%feature("compactdefaultargs") SpecialSymbol;
		%feature("autodoc", "Returns special symbol.

Returns
-------
Standard_ExtCharacter
") SpecialSymbol;
		Standard_ExtCharacter SpecialSymbol();

		/****************** Type ******************/
		/**** md5 signature: bf4aea6b24d0b584b57c781f208134ec ****/
		%feature("compactdefaultargs") Type;
		%feature("autodoc", "Returns the kind of interactive.

Returns
-------
AIS_KindOfInteractive
") Type;
		virtual AIS_KindOfInteractive Type();

		/****************** UnsetCustomPlane ******************/
		/**** md5 signature: 0545e29e8f1f4729d3901ed8c8f7965d ****/
		%feature("compactdefaultargs") UnsetCustomPlane;
		%feature("autodoc", "Unsets user-defined plane. therefore the plane for dimension will be computed automatically.

Returns
-------
None
") UnsetCustomPlane;
		void UnsetCustomPlane();

		/****************** UnsetFixedTextPosition ******************/
		/**** md5 signature: d8406cc4e1101ee7ff26d8abf793d532 ****/
		%feature("compactdefaultargs") UnsetFixedTextPosition;
		%feature("autodoc", "Unsets user defined text positioning and enables text positioning by other parameters: text alignment, extension size, flyout and custom plane.

Returns
-------
None
") UnsetFixedTextPosition;
		void UnsetFixedTextPosition();

};


%make_alias(AIS_Dimension)

%extend AIS_Dimension {
	%pythoncode {
	__repr__ = _dumps_object

	@methodnotwrapped
	def AIS_Dimension(self):
		pass
	}
};

/*****************
* class AIS_Line *
*****************/
class AIS_Line : public AIS_InteractiveObject {
	public:
		/****************** AIS_Line ******************/
		/**** md5 signature: 8bbcd784a7e573aad13b95eda3357ac2 ****/
		%feature("compactdefaultargs") AIS_Line;
		%feature("autodoc", "Initializes the line aline.

Parameters
----------
aLine: Geom_Line

Returns
-------
None
") AIS_Line;
		 AIS_Line(const opencascade::handle<Geom_Line> & aLine);

		/****************** AIS_Line ******************/
		/**** md5 signature: 2068a18405f77f106bfd8618f346ed47 ****/
		%feature("compactdefaultargs") AIS_Line;
		%feature("autodoc", "Initializes a starting point astartpoint and a finishing point aendpoint for the line.

Parameters
----------
aStartPoint: Geom_Point
aEndPoint: Geom_Point

Returns
-------
None
") AIS_Line;
		 AIS_Line(const opencascade::handle<Geom_Point> & aStartPoint, const opencascade::handle<Geom_Point> & aEndPoint);

		/****************** Compute ******************/
		/**** md5 signature: 09436ef6513347d4c96315939d8b75d5 ****/
		%feature("compactdefaultargs") Compute;
		%feature("autodoc", "Computes the presentation according to a point of view given by <aprojector>. to be used when the associated degenerated presentations have been transformed by <atrsf> which is not a pure translation. the hlr prs can't be deducted automatically warning :<atrsf> must be applied to the object to display before computation !!!.

Parameters
----------
aProjector: Prs3d_Projector
aTrsf: Geom_Transformation
aPresentation: Prs3d_Presentation

Returns
-------
None
") Compute;
		virtual void Compute(const opencascade::handle<Prs3d_Projector> & aProjector, const opencascade::handle<Geom_Transformation> & aTrsf, const opencascade::handle<Prs3d_Presentation> & aPresentation);

		/****************** Line ******************/
		/**** md5 signature: 3abeaae7f4e4373ddc51d06b177bee17 ****/
		%feature("compactdefaultargs") Line;
		%feature("autodoc", "Constructs an infinite line.

Returns
-------
opencascade::handle<Geom_Line>
") Line;
		const opencascade::handle<Geom_Line> & Line();

		/****************** Points ******************/
		/**** md5 signature: 4980115aa3f0510a68a255ca82f83258 ****/
		%feature("compactdefaultargs") Points;
		%feature("autodoc", "Returns the starting point thepstart and the end point thepend of the line set by setpoints.

Parameters
----------
thePStart: Geom_Point
thePEnd: Geom_Point

Returns
-------
None
") Points;
		void Points(opencascade::handle<Geom_Point> & thePStart, opencascade::handle<Geom_Point> & thePEnd);

		/****************** SetColor ******************/
		/**** md5 signature: 6b2b764a1e8ffb5d1aa4218d6218005c ****/
		%feature("compactdefaultargs") SetColor;
		%feature("autodoc", "Provides a new color setting acolor for the line in the drawing tool, or 'drawer'.

Parameters
----------
aColor: Quantity_Color

Returns
-------
None
") SetColor;
		void SetColor(const Quantity_Color & aColor);

		/****************** SetLine ******************/
		/**** md5 signature: 1110fcc783ccf875a09ba25ff81a4115 ****/
		%feature("compactdefaultargs") SetLine;
		%feature("autodoc", "Instantiates an infinite line.

Parameters
----------
theLine: Geom_Line

Returns
-------
None
") SetLine;
		void SetLine(const opencascade::handle<Geom_Line> & theLine);

		/****************** SetPoints ******************/
		/**** md5 signature: ce5646c69ff404ac863ce5401ebb4524 ****/
		%feature("compactdefaultargs") SetPoints;
		%feature("autodoc", "Sets the starting point thepstart and ending point thepend of the infinite line to create a finite line segment.

Parameters
----------
thePStart: Geom_Point
thePEnd: Geom_Point

Returns
-------
None
") SetPoints;
		void SetPoints(const opencascade::handle<Geom_Point> & thePStart, const opencascade::handle<Geom_Point> & thePEnd);

		/****************** SetWidth ******************/
		/**** md5 signature: 9d813a0ff21da5ccb02e00971f20abed ****/
		%feature("compactdefaultargs") SetWidth;
		%feature("autodoc", "Provides the new width setting avalue for the line in the drawing tool, or 'drawer'.

Parameters
----------
aValue: float

Returns
-------
None
") SetWidth;
		void SetWidth(const Standard_Real aValue);

		/****************** Signature ******************/
		/**** md5 signature: 4e037e01ba764fd5d5261e3d9ba6557d ****/
		%feature("compactdefaultargs") Signature;
		%feature("autodoc", "Returns the signature 5.

Returns
-------
int
") Signature;
		virtual Standard_Integer Signature();

		/****************** Type ******************/
		/**** md5 signature: bf4aea6b24d0b584b57c781f208134ec ****/
		%feature("compactdefaultargs") Type;
		%feature("autodoc", "Returns the type datum.

Returns
-------
AIS_KindOfInteractive
") Type;
		virtual AIS_KindOfInteractive Type();

		/****************** UnsetColor ******************/
		/**** md5 signature: 305de4c541ce8067f3ff456f9ec26b55 ****/
		%feature("compactdefaultargs") UnsetColor;
		%feature("autodoc", "Removes the color setting and returns the original color.

Returns
-------
None
") UnsetColor;
		void UnsetColor();

		/****************** UnsetWidth ******************/
		/**** md5 signature: a9083157cc12b18148f87c7816510f28 ****/
		%feature("compactdefaultargs") UnsetWidth;
		%feature("autodoc", "Removes the width setting and returns the original width.

Returns
-------
None
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
		/****************** AIS_Manipulator ******************/
		/**** md5 signature: d6d73953b5293a4bb9f85d59f84e4550 ****/
		%feature("compactdefaultargs") AIS_Manipulator;
		%feature("autodoc", "Constructs a manipulator object with default placement and all parts to be displayed.

Returns
-------
None
") AIS_Manipulator;
		 AIS_Manipulator();

		/****************** AIS_Manipulator ******************/
		/**** md5 signature: a673beebf1686d05fab2c9b57d63a9d3 ****/
		%feature("compactdefaultargs") AIS_Manipulator;
		%feature("autodoc", "Constructs a manipulator object with input location and positions of axes and all parts to be displayed.

Parameters
----------
thePosition: gp_Ax2

Returns
-------
None
") AIS_Manipulator;
		 AIS_Manipulator(const gp_Ax2 & thePosition);

		/****************** ActiveMode ******************/
		/**** md5 signature: 518316bdc464c63b5a1ab2fd9b9e2cb2 ****/
		%feature("compactdefaultargs") ActiveMode;
		%feature("autodoc", "No available documentation.

Returns
-------
AIS_ManipulatorMode
") ActiveMode;
		AIS_ManipulatorMode ActiveMode();

		/****************** Attach ******************/
		/**** md5 signature: 7d386f66b57656d8a31beb14cb6ab6be ****/
		%feature("compactdefaultargs") Attach;
		%feature("autodoc", "Attaches himself to the input interactive object and become displayed in the same context. it is placed in the center of object bounding box, and its size is adjusted to the object bounding box.

Parameters
----------
theObject: AIS_InteractiveObject
theOptions: OptionsForAttach,optional
	default value is OptionsForAttach()

Returns
-------
None
") Attach;
		void Attach(const opencascade::handle<AIS_InteractiveObject> & theObject, OptionsForAttach theOptions = OptionsForAttach());

		/****************** Attach ******************/
		/**** md5 signature: 832dc115dea47eb279f6ed86e41ac087 ****/
		%feature("compactdefaultargs") Attach;
		%feature("autodoc", "Attaches himself to the input interactive object group and become displayed in the same context. it become attached to the first object, baut manage manipulation of the whole group. it is placed in the center of object bounding box, and its size is adjusted to the object bounding box.

Parameters
----------
theObject: AIS_ManipulatorObjectSequence
theOptions: OptionsForAttach,optional
	default value is OptionsForAttach()

Returns
-------
None
") Attach;
		void Attach(const opencascade::handle<AIS_ManipulatorObjectSequence> & theObject, OptionsForAttach theOptions = OptionsForAttach());

		/****************** ClearSelected ******************/
		/**** md5 signature: 3aaae3eac8509b6abfc3ffd58cbe26e1 ****/
		%feature("compactdefaultargs") ClearSelected;
		%feature("autodoc", "Method which clear all selected owners belonging to this selectable object ( for fast presentation draw ).

Returns
-------
None
") ClearSelected;
		virtual void ClearSelected();

		/****************** Compute ******************/
		/**** md5 signature: 1bb1940ebb02c69fcdc59de667417f7b ****/
		%feature("compactdefaultargs") Compute;
		%feature("autodoc", "Fills presentation. @note manipulator presentation does not use display mode and for all modes has the same presentation.

Parameters
----------
thePrsMgr: PrsMgr_PresentationManager3d
thePrs: Prs3d_Presentation
theMode: int,optional
	default value is 0

Returns
-------
None
") Compute;
		virtual void Compute(const opencascade::handle<PrsMgr_PresentationManager3d> & thePrsMgr, const opencascade::handle<Prs3d_Presentation> & thePrs, const Standard_Integer theMode = 0);

		/****************** ComputeSelection ******************/
		/**** md5 signature: 0ee36b1ad2a8a3c1bbb813dfdb1d40ae ****/
		%feature("compactdefaultargs") ComputeSelection;
		%feature("autodoc", "Computes selection sensitive zones (triangulation) for manipulator. @param thenode [in] selection mode that is treated as transformation mode.

Parameters
----------
theSelection: SelectMgr_Selection
theMode: int

Returns
-------
None
") ComputeSelection;
		virtual void ComputeSelection(const opencascade::handle<SelectMgr_Selection> & theSelection, const Standard_Integer theMode);

		/****************** DeactivateCurrentMode ******************/
		/**** md5 signature: 9f9d413f44f19c0e451cbd2d4a724668 ****/
		%feature("compactdefaultargs") DeactivateCurrentMode;
		%feature("autodoc", "Make inactive the current selected manipulator part and reset current axis index and current mode. after its call hasactivemode() returns false. @sa hasactivemode().

Returns
-------
None
") DeactivateCurrentMode;
		void DeactivateCurrentMode();

		/****************** Detach ******************/
		/**** md5 signature: 7ff09e11641571ebd32a8aea4ee5c9d7 ****/
		%feature("compactdefaultargs") Detach;
		%feature("autodoc", "Detaches himself from the owner object, and removes itself from context.

Returns
-------
None
") Detach;
		void Detach();

		/****************** EnableMode ******************/
		/**** md5 signature: ed430e32069c676de349fa1b988e84c2 ****/
		%feature("compactdefaultargs") EnableMode;
		%feature("autodoc", "Enable manipualtion mode. @warning it activates selection mode in the current context. if manipulator is not displayed, no mode will be activated.

Parameters
----------
theMode: AIS_ManipulatorMode

Returns
-------
None
") EnableMode;
		void EnableMode(const AIS_ManipulatorMode theMode);

		/****************** HasActiveMode ******************/
		/**** md5 signature: f43eeb7b2b47c07afce90de1cbb74ff9 ****/
		%feature("compactdefaultargs") HasActiveMode;
		%feature("autodoc", "Returns true if some part of manipulator is selected (transformation mode is active, and owning object can be transformed).

Returns
-------
bool
") HasActiveMode;
		Standard_Boolean HasActiveMode();

		/****************** HasActiveTransformation ******************/
		/**** md5 signature: 743e5698ac61066f8b7d495ae7359262 ****/
		%feature("compactdefaultargs") HasActiveTransformation;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") HasActiveTransformation;
		Standard_Boolean HasActiveTransformation();

		/****************** HilightOwnerWithColor ******************/
		/**** md5 signature: 59e159c706312ffbc3fbab59d0e52b8c ****/
		%feature("compactdefaultargs") HilightOwnerWithColor;
		%feature("autodoc", "Method which hilight an owner belonging to this selectable object ( for fast presentation draw ).

Parameters
----------
thePM: PrsMgr_PresentationManager3d
theStyle: Prs3d_Drawer
theOwner: SelectMgr_EntityOwner

Returns
-------
None
") HilightOwnerWithColor;
		virtual void HilightOwnerWithColor(const opencascade::handle<PrsMgr_PresentationManager3d> & thePM, const opencascade::handle<Prs3d_Drawer> & theStyle, const opencascade::handle<SelectMgr_EntityOwner> & theOwner);

		/****************** HilightSelected ******************/
		/**** md5 signature: 51adc22064d394c9bf0b2f20ae0065c3 ****/
		%feature("compactdefaultargs") HilightSelected;
		%feature("autodoc", "Method which draws selected owners ( for fast presentation draw ).

Parameters
----------
thePM: PrsMgr_PresentationManager3d
theSeq: SelectMgr_SequenceOfOwner

Returns
-------
None
") HilightSelected;
		virtual void HilightSelected(const opencascade::handle<PrsMgr_PresentationManager3d> & thePM, const SelectMgr_SequenceOfOwner & theSeq);

		/****************** IsAttached ******************/
		/**** md5 signature: f05a2e5d0a5e075997cd6dc06d401426 ****/
		%feature("compactdefaultargs") IsAttached;
		%feature("autodoc", "Returns true if manipulator is attached to some interactive object (has owning object).

Returns
-------
bool
") IsAttached;
		Standard_Boolean IsAttached();

		/****************** IsAutoHilight ******************/
		/**** md5 signature: d08251e65bb2038174f4c2dab73d34c9 ****/
		%feature("compactdefaultargs") IsAutoHilight;
		%feature("autodoc", "Disables auto highlighting to use hilightselected() and hilightownerwithcolor() overridden methods.

Returns
-------
bool
") IsAutoHilight;
		virtual Standard_Boolean IsAutoHilight();

		/****************** IsModeActivationOnDetection ******************/
		/**** md5 signature: 2af8fa23d5c9b0d15190f17af70b9283 ****/
		%feature("compactdefaultargs") IsModeActivationOnDetection;
		%feature("autodoc", "Returns true if manual mode activation is enabled.

Returns
-------
bool
") IsModeActivationOnDetection;
		Standard_Boolean IsModeActivationOnDetection();

		/****************** Object ******************/
		/**** md5 signature: 7f1f823e7838d5f1ace29947c6685976 ****/
		%feature("compactdefaultargs") Object;
		%feature("autodoc", "Returns the first (leading) object of the owning objects.

Returns
-------
opencascade::handle<AIS_InteractiveObject>
") Object;
		opencascade::handle<AIS_InteractiveObject> Object();

		/****************** Object ******************/
		/**** md5 signature: e539c0d3d9f8c83a7da6513e8f5ba4f9 ****/
		%feature("compactdefaultargs") Object;
		%feature("autodoc", "Returns one of the owning objects. @warning raises program error if theindex is more than owning objects count or less than 1.

Parameters
----------
theIndex: int

Returns
-------
opencascade::handle<AIS_InteractiveObject>
") Object;
		opencascade::handle<AIS_InteractiveObject> Object(const Standard_Integer theIndex);

		/****************** ObjectTransformation ******************/
		/**** md5 signature: e6857da7c59a18275835c532be288e72 ****/
		%feature("compactdefaultargs") ObjectTransformation;
		%feature("autodoc", "Computes transformation of parent object according to the active mode and input motion vector. you can use this method to get object transformation according to current mode or use own algorithm to implement any other tranformation for modes. returns transformation of parent object.

Parameters
----------
theX: int
theY: int
theView: V3d_View
theTrsf: gp_Trsf

Returns
-------
bool
") ObjectTransformation;
		Standard_Boolean ObjectTransformation(const Standard_Integer theX, const Standard_Integer theY, const opencascade::handle<V3d_View> & theView, gp_Trsf & theTrsf);

		/****************** Objects ******************/
		/**** md5 signature: 6f9e402610564bdab86e777db82db8cf ****/
		%feature("compactdefaultargs") Objects;
		%feature("autodoc", "Returns all owning objects.

Returns
-------
opencascade::handle<AIS_ManipulatorObjectSequence>
") Objects;
		opencascade::handle<AIS_ManipulatorObjectSequence> Objects();

		/****************** Position ******************/
		/**** md5 signature: 0919c787263d4f8ff9c1e18688f5d16c ****/
		%feature("compactdefaultargs") Position;
		%feature("autodoc", "Returns poition of manipulator interactive object.

Returns
-------
gp_Ax2
") Position;
		const gp_Ax2 Position();

		/****************** SetGap ******************/
		/**** md5 signature: 93bbf4c4c799016d4246a94510cb49b4 ****/
		%feature("compactdefaultargs") SetGap;
		%feature("autodoc", "Sets gaps between translator, scaler and rotator sub-presentations.

Parameters
----------
theValue: Standard_ShortReal

Returns
-------
None
") SetGap;
		void SetGap(const Standard_ShortReal theValue);

		/****************** SetModeActivationOnDetection ******************/
		/**** md5 signature: 74d02205a7664eb45a83e6f9f91b1cfb ****/
		%feature("compactdefaultargs") SetModeActivationOnDetection;
		%feature("autodoc", "Enables mode activation on detection (highlighting). by default, mode is activated on selection of manipulator part. @warning if this mode is enabled, selection of parts does nothing.

Parameters
----------
theToEnable: bool

Returns
-------
None
") SetModeActivationOnDetection;
		void SetModeActivationOnDetection(const Standard_Boolean theToEnable);

		/****************** SetPart ******************/
		/**** md5 signature: 684caeb3d3c62fad166a3ed99df49f70 ****/
		%feature("compactdefaultargs") SetPart;
		%feature("autodoc", "Disable or enable visual parts for translation, rotation or scaling for some axis. by default all parts are enabled (will be displayed). @warning enabling or disabling of visual parts of manipulator does not manage the manipulation (selection) mode. @warning raises program error if axis index is < 0 or > 2.

Parameters
----------
theAxisIndex: int
theMode: AIS_ManipulatorMode
theIsEnabled: bool

Returns
-------
None
") SetPart;
		void SetPart(const Standard_Integer theAxisIndex, const AIS_ManipulatorMode theMode, const Standard_Boolean theIsEnabled);

		/****************** SetPart ******************/
		/**** md5 signature: 86d1cc4e648095a53a2accd8505ecc4b ****/
		%feature("compactdefaultargs") SetPart;
		%feature("autodoc", "Disable or enable visual parts for translation, rotation or scaling for all axes. by default all parts are enabled (will be displayed). @warning enabling or disabling of visual parts of manipulator does not manage the manipulation (selection) mode. @warning raises program error if axis index is < 0 or > 2.

Parameters
----------
theMode: AIS_ManipulatorMode
theIsEnabled: bool

Returns
-------
None
") SetPart;
		void SetPart(const AIS_ManipulatorMode theMode, const Standard_Boolean theIsEnabled);

		/****************** SetPosition ******************/
		/**** md5 signature: 3065dca0a8eb5a2b508f4791a4ae43c1 ****/
		%feature("compactdefaultargs") SetPosition;
		%feature("autodoc", "Sets position of the manipulator object.

Parameters
----------
thePosition: gp_Ax2

Returns
-------
None
") SetPosition;
		void SetPosition(const gp_Ax2 & thePosition);

		/****************** SetSize ******************/
		/**** md5 signature: 490bc744a2d34e53e9d07eaab52ec139 ****/
		%feature("compactdefaultargs") SetSize;
		%feature("autodoc", "Sets size (length of side of the manipulator cubic bounding box.

Parameters
----------
theSideLength: Standard_ShortReal

Returns
-------
None
") SetSize;
		void SetSize(const Standard_ShortReal theSideLength);

		/****************** SetTransformPersistence ******************/
		/**** md5 signature: 55e7ba0326b97d41dc89997ba6b5628e ****/
		%feature("compactdefaultargs") SetTransformPersistence;
		%feature("autodoc", "Redefines transform persistence management to setup transformation for sub-presentation of axes. @warning this interactive object does not support custom transformation persistence when using \sa zoompersistence mode. in this mode the transformation persistence flags for presentations are overridden by this class. @warning invokes debug assertion to catch incompatible usage of the method with \sa zoompersistence mode, silently does nothing in release mode. @warning revise use of adjustsize argument of of \sa attachtoobjects method when enabling zoom persistence.

Parameters
----------
theTrsfPers: Graphic3d_TransformPers

Returns
-------
None
") SetTransformPersistence;
		virtual void SetTransformPersistence(const opencascade::handle<Graphic3d_TransformPers> & theTrsfPers);

		/****************** SetZoomPersistence ******************/
		/**** md5 signature: 6d63f55bd881baa9dbefc2bc469583f4 ****/
		%feature("compactdefaultargs") SetZoomPersistence;
		%feature("autodoc", "Enable or disable zoom persistence mode for the manipulator. with this mode turned on the presentation will keep fixed screen size. @warning when turned on this option overrides transform persistence properties and local transformation to achieve necessary visual effect. @warning revise use of adjustsize argument of of \sa attachtoobjects method when enabling zoom persistence.

Parameters
----------
theToEnable: bool

Returns
-------
None
") SetZoomPersistence;
		void SetZoomPersistence(const Standard_Boolean theToEnable);

		/****************** Size ******************/
		/**** md5 signature: 2fb6b7fb424bb2bf67b8cf866a5ce3c3 ****/
		%feature("compactdefaultargs") Size;
		%feature("autodoc", "No available documentation.

Returns
-------
Standard_ShortReal
") Size;
		Standard_ShortReal Size();

		/****************** StartTransform ******************/
		/**** md5 signature: 0e42457948e68fa72b81e5837dd4f985 ****/
		%feature("compactdefaultargs") StartTransform;
		%feature("autodoc", "Init start (reference) transformation. @warning it is used in chain with starttransform-transform(gp_trsf)-stoptransform and is used only for custom transform set. if transform(const standard_integer, const standard_integer) is used, initial data is set automatically, and it is reset on deactivatecurrentmode call if it is not reset yet.

Parameters
----------
theX: int
theY: int
theView: V3d_View

Returns
-------
None
") StartTransform;
		void StartTransform(const Standard_Integer theX, const Standard_Integer theY, const opencascade::handle<V3d_View> & theView);

		/****************** StartTransformation ******************/
		/**** md5 signature: 8eb6cc7b893f18d392ff6c57e93767a3 ****/
		%feature("compactdefaultargs") StartTransformation;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Trsf
") StartTransformation;
		gp_Trsf StartTransformation();

		/****************** StartTransformation ******************/
		/**** md5 signature: ecdcc1a23c08b016547c467ef2b958df ****/
		%feature("compactdefaultargs") StartTransformation;
		%feature("autodoc", "No available documentation.

Parameters
----------
theIndex: int

Returns
-------
gp_Trsf
") StartTransformation;
		gp_Trsf StartTransformation(Standard_Integer theIndex);

		/****************** StopTransform ******************/
		/**** md5 signature: a1d35931e335de8d202014fd19f22a34 ****/
		%feature("compactdefaultargs") StopTransform;
		%feature("autodoc", "Reset start (reference) transformation. @param thetoapply [in] option to apply or to cancel the started transformation. @warning it is used in chain with starttransform-transform(gp_trsf)-stoptransform and is used only for custom transform set.

Parameters
----------
theToApply: bool,optional
	default value is Standard_True

Returns
-------
None
") StopTransform;
		void StopTransform(const Standard_Boolean theToApply = Standard_True);

		/****************** Transform ******************/
		/**** md5 signature: 70cd3856c03eefd4d3419cd64304b204 ****/
		%feature("compactdefaultargs") Transform;
		%feature("autodoc", "Apply to the owning objects the input transformation. @remark the transformation is set using setlocaltransformation for owning objects. the location of the manipulator is stored also in local transformation, so that there's no need to redisplay objects. @warning it is used in chain with starttransform-transform(gp_trsf)-stoptransform and is used only for custom transform set. @warning it will does nothing if transformation is not initiated (with starttransform() call).

Parameters
----------
aTrsf: gp_Trsf

Returns
-------
None
") Transform;
		void Transform(const gp_Trsf & aTrsf);

		/****************** Transform ******************/
		/**** md5 signature: 7b80f6f8c56072806fdc079cea756bd9 ****/
		%feature("compactdefaultargs") Transform;
		%feature("autodoc", "Apply transformation made from mouse moving from start position (save on the first tranform() call and reset on deactivatecurrentmode() call.) to the in/out mouse position (thex, they).

Parameters
----------
theX: int
theY: int
theView: V3d_View

Returns
-------
gp_Trsf
") Transform;
		gp_Trsf Transform(const Standard_Integer theX, const Standard_Integer theY, const opencascade::handle<V3d_View> & theView);

		/****************** ZoomPersistence ******************/
		/**** md5 signature: 26783ffb6600049d444313c048467f7d ****/
		%feature("compactdefaultargs") ZoomPersistence;
		%feature("autodoc", "Returns state of zoom persistence mode, whether it turned on or off.

Returns
-------
bool
") ZoomPersistence;
		Standard_Boolean ZoomPersistence();

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
		/****************** AIS_MediaPlayer ******************/
		/**** md5 signature: 0446d23899803b089df6bd8d6821c9e2 ****/
		%feature("compactdefaultargs") AIS_MediaPlayer;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") AIS_MediaPlayer;
		 AIS_MediaPlayer();

		/****************** Duration ******************/
		/**** md5 signature: 7dbbe5f7e0b63b92819c252fd1239f67 ****/
		%feature("compactdefaultargs") Duration;
		%feature("autodoc", "Return duration.

Returns
-------
double
") Duration;
		double Duration();

		/****************** OpenInput ******************/
		/**** md5 signature: 860c3b6e78ac92cbd8cf0044e55bef88 ****/
		%feature("compactdefaultargs") OpenInput;
		%feature("autodoc", "Open specified file.

Parameters
----------
thePath: TCollection_AsciiString
theToWait: bool

Returns
-------
None
") OpenInput;
		void OpenInput(const TCollection_AsciiString & thePath, Standard_Boolean theToWait);

		/****************** PlayPause ******************/
		/**** md5 signature: 811ffa83708da2acdc8d22e930c8cece ****/
		%feature("compactdefaultargs") PlayPause;
		%feature("autodoc", "Switch playback state.

Returns
-------
None
") PlayPause;
		void PlayPause();

		/****************** PlayerContext ******************/
		/**** md5 signature: 5fc0e0cbec11700279e3e8631feee60b ****/
		%feature("compactdefaultargs") PlayerContext;
		%feature("autodoc", "Return player context.

Returns
-------
opencascade::handle<Media_PlayerContext>
") PlayerContext;
		const opencascade::handle<Media_PlayerContext> & PlayerContext();

		/****************** PresentFrame ******************/
		/**** md5 signature: 7d26f4d44c79f3dff718eeaf121837ff ****/
		%feature("compactdefaultargs") PresentFrame;
		%feature("autodoc", "Display new frame.

Parameters
----------
theLeftCorner: Graphic3d_Vec2i
theMaxSize: Graphic3d_Vec2i

Returns
-------
bool
") PresentFrame;
		bool PresentFrame(const Graphic3d_Vec2i & theLeftCorner, const Graphic3d_Vec2i & theMaxSize);

		/****************** SetCallback ******************/
		/**** md5 signature: 6e4600666f30d884b42d87dfd0954e3a ****/
		%feature("compactdefaultargs") SetCallback;
		%feature("autodoc", "Setup callback to be called on queue progress (e.g. when new frame should be displayed).

Parameters
----------
theCallbackFunction: Graphic3d_MediaTextureSet::CallbackOnUpdate_t
theCallbackUserPtr: void *

Returns
-------
None
") SetCallback;
		void SetCallback(Graphic3d_MediaTextureSet::CallbackOnUpdate_t theCallbackFunction, void * theCallbackUserPtr);

		/****************** SetClosePlayer ******************/
		/**** md5 signature: 3032f6e42b741faba7f30fd3218ff7e7 ****/
		%feature("compactdefaultargs") SetClosePlayer;
		%feature("autodoc", "Schedule player to be closed.

Returns
-------
None
") SetClosePlayer;
		void SetClosePlayer();

};


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
		/****************** AIS_MultipleConnectedInteractive ******************/
		/**** md5 signature: fba70400b7faac2115b274698220e2c9 ****/
		%feature("compactdefaultargs") AIS_MultipleConnectedInteractive;
		%feature("autodoc", "Initializes the interactive object with multiple connections to ais_interactive objects.

Returns
-------
None
") AIS_MultipleConnectedInteractive;
		 AIS_MultipleConnectedInteractive();

		/****************** AcceptShapeDecomposition ******************/
		/**** md5 signature: f0c4d1bd14b4f64b202098891add7268 ****/
		%feature("compactdefaultargs") AcceptShapeDecomposition;
		%feature("autodoc", "Informs the graphic context that the interactive object may be decomposed into sub-shapes for dynamic selection.

Returns
-------
bool
") AcceptShapeDecomposition;
		virtual Standard_Boolean AcceptShapeDecomposition();

		/****************** Compute ******************/
		/**** md5 signature: 09436ef6513347d4c96315939d8b75d5 ****/
		%feature("compactdefaultargs") Compute;
		%feature("autodoc", "Computes the presentation according to a point of view given by <aprojector>. to be used when the associated degenerated presentations have been transformed by <atrsf> which is not a pure translation. the hlr prs can't be deducted automatically warning :<atrsf> must be applied to the object to display before computation !!!.

Parameters
----------
aProjector: Prs3d_Projector
aTrsf: Geom_Transformation
aPresentation: Prs3d_Presentation

Returns
-------
None
") Compute;
		virtual void Compute(const opencascade::handle<Prs3d_Projector> & aProjector, const opencascade::handle<Geom_Transformation> & aTrsf, const opencascade::handle<Prs3d_Presentation> & aPresentation);

		/****************** Compute ******************/
		/**** md5 signature: a7522d245885b593fa6b856c13c5987f ****/
		%feature("compactdefaultargs") Compute;
		%feature("autodoc", "No available documentation.

Parameters
----------
aProjector: Prs3d_Projector
aPresentation: Prs3d_Presentation

Returns
-------
None
") Compute;
		virtual void Compute(const opencascade::handle<Prs3d_Projector> & aProjector, const opencascade::handle<Prs3d_Presentation> & aPresentation);

		/****************** Connect ******************/
		/**** md5 signature: 617859b10fb322097970436d4b00035d ****/
		%feature("compactdefaultargs") Connect;
		%feature("autodoc", "Establishes the connection between the connected interactive object, theinteractive, and its reference. locates instance in thelocation and applies specified transformation persistence mode. returns created instance object (ais_connectedinteractive or ais_multipleconnectedinteractive).

Parameters
----------
theAnotherObj: AIS_InteractiveObject
theLocation: Geom_Transformation
theTrsfPers: Graphic3d_TransformPers

Returns
-------
opencascade::handle<AIS_InteractiveObject>
") Connect;
		opencascade::handle<AIS_InteractiveObject> Connect(const opencascade::handle<AIS_InteractiveObject> & theAnotherObj, const opencascade::handle<Geom_Transformation> & theLocation, const opencascade::handle<Graphic3d_TransformPers> & theTrsfPers);

		/****************** Connect ******************/
		/**** md5 signature: d10a69c61a6c9d8b102edd8739b7f2b4 ****/
		%feature("compactdefaultargs") Connect;
		%feature("autodoc", "Establishes the connection between the connected interactive object, theinteractive, and its reference. copies local transformation and transformation persistence mode from theinteractive. returns created instance object (ais_connectedinteractive or ais_multipleconnectedinteractive).

Parameters
----------
theAnotherObj: AIS_InteractiveObject

Returns
-------
opencascade::handle<AIS_InteractiveObject>
") Connect;
		opencascade::handle<AIS_InteractiveObject> Connect(const opencascade::handle<AIS_InteractiveObject> & theAnotherObj);

		/****************** Connect ******************/
		/**** md5 signature: 99ccdf3ecba8a64760230d69d1f05173 ****/
		%feature("compactdefaultargs") Connect;
		%feature("autodoc", "Establishes the connection between the connected interactive object, theinteractive, and its reference. locates instance in thelocation and copies transformation persistence mode from theinteractive. returns created instance object (ais_connectedinteractive or ais_multipleconnectedinteractive).

Parameters
----------
theAnotherObj: AIS_InteractiveObject
theLocation: gp_Trsf

Returns
-------
opencascade::handle<AIS_InteractiveObject>
") Connect;
		opencascade::handle<AIS_InteractiveObject> Connect(const opencascade::handle<AIS_InteractiveObject> & theAnotherObj, const gp_Trsf & theLocation);

		/****************** Connect ******************/
		/**** md5 signature: fe47f9ee36bde7f16ff1155bf0cfd849 ****/
		%feature("compactdefaultargs") Connect;
		%feature("autodoc", "Establishes the connection between the connected interactive object, theinteractive, and its reference. locates instance in thelocation and applies specified transformation persistence mode. returns created instance object (ais_connectedinteractive or ais_multipleconnectedinteractive).

Parameters
----------
theAnotherObj: AIS_InteractiveObject
theLocation: gp_Trsf
theTrsfPers: Graphic3d_TransformPers

Returns
-------
opencascade::handle<AIS_InteractiveObject>
") Connect;
		opencascade::handle<AIS_InteractiveObject> Connect(const opencascade::handle<AIS_InteractiveObject> & theAnotherObj, const gp_Trsf & theLocation, const opencascade::handle<Graphic3d_TransformPers> & theTrsfPers);

		/****************** Connect ******************/
		/**** md5 signature: 2770be8a578431190d56c454749b76eb ****/
		%feature("compactdefaultargs") Connect;
		%feature("autodoc", "No available documentation.

Parameters
----------
theInteractive: AIS_InteractiveObject
theLocation: gp_Trsf
theTrsfPersFlag: Graphic3d_TransModeFlags
theTrsfPersPoint: gp_Pnt

Returns
-------
opencascade::handle<AIS_InteractiveObject>
") Connect;
		opencascade::handle<AIS_InteractiveObject> Connect(const opencascade::handle<AIS_InteractiveObject> & theInteractive, const gp_Trsf & theLocation, const Graphic3d_TransModeFlags & theTrsfPersFlag, const gp_Pnt & theTrsfPersPoint);

		/****************** Disconnect ******************/
		/**** md5 signature: 8baee36d436931ddbde7f0643b9e8f4a ****/
		%feature("compactdefaultargs") Disconnect;
		%feature("autodoc", "Removes the connection with theinteractive.

Parameters
----------
theInteractive: AIS_InteractiveObject

Returns
-------
None
") Disconnect;
		void Disconnect(const opencascade::handle<AIS_InteractiveObject> & theInteractive);

		/****************** DisconnectAll ******************/
		/**** md5 signature: 6ff75930eb4fe3a9d24be8bb57ecbce1 ****/
		%feature("compactdefaultargs") DisconnectAll;
		%feature("autodoc", "Clears all the connections to objects.

Returns
-------
None
") DisconnectAll;
		void DisconnectAll();

		/****************** GetAssemblyOwner ******************/
		/**** md5 signature: fdcc25b4af0825772c906148415cbc13 ****/
		%feature("compactdefaultargs") GetAssemblyOwner;
		%feature("autodoc", "Returns common entity owner if the object is an assembly.

Returns
-------
opencascade::handle<SelectMgr_EntityOwner>
") GetAssemblyOwner;
		virtual const opencascade::handle<SelectMgr_EntityOwner> & GetAssemblyOwner();

		/****************** GlobalSelOwner ******************/
		/**** md5 signature: 4b6aea62676c6d618f2db36c62ce24fb ****/
		%feature("compactdefaultargs") GlobalSelOwner;
		%feature("autodoc", "Returns the owner of mode for selection of object as a whole.

Returns
-------
opencascade::handle<SelectMgr_EntityOwner>
") GlobalSelOwner;
		virtual opencascade::handle<SelectMgr_EntityOwner> GlobalSelOwner();

		/****************** HasConnection ******************/
		/**** md5 signature: c342aa32a45245fb748ee5398c1c4a5a ****/
		%feature("compactdefaultargs") HasConnection;
		%feature("autodoc", "Returns true if the object is connected to others.

Returns
-------
bool
") HasConnection;
		Standard_Boolean HasConnection();

		/****************** SetContext ******************/
		/**** md5 signature: af12f571fad40e135e056476329514e6 ****/
		%feature("compactdefaultargs") SetContext;
		%feature("autodoc", "Assigns interactive context.

Parameters
----------
theCtx: AIS_InteractiveContext

Returns
-------
None
") SetContext;
		virtual void SetContext(const opencascade::handle<AIS_InteractiveContext> & theCtx);

		/****************** Signature ******************/
		/**** md5 signature: 81eb93a6a9075273e61be0bf8e0d1a46 ****/
		%feature("compactdefaultargs") Signature;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") Signature;
		virtual Standard_Integer Signature();

		/****************** Type ******************/
		/**** md5 signature: dd06dc48aefe8f5e4fea271bcf932271 ****/
		%feature("compactdefaultargs") Type;
		%feature("autodoc", "No available documentation.

Returns
-------
AIS_KindOfInteractive
") Type;
		virtual AIS_KindOfInteractive Type();

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
		/****************** AIS_Plane ******************/
		/**** md5 signature: 3c342f25630d9581d2c70a369facc359 ****/
		%feature("compactdefaultargs") AIS_Plane;
		%feature("autodoc", "Initializes the plane acomponent. if the mode acurrentmode equals true, the drawing tool, 'drawer' is not initialized.

Parameters
----------
aComponent: Geom_Plane
aCurrentMode: bool,optional
	default value is Standard_False

Returns
-------
None
") AIS_Plane;
		 AIS_Plane(const opencascade::handle<Geom_Plane> & aComponent, const Standard_Boolean aCurrentMode = Standard_False);

		/****************** AIS_Plane ******************/
		/**** md5 signature: 6b93dc858ae0d4c7f57fed9860708802 ****/
		%feature("compactdefaultargs") AIS_Plane;
		%feature("autodoc", "Initializes the plane acomponent and the point acenter. if the mode acurrentmode equals true, the drawing tool, 'drawer' is not initialized. acurrentmode equals true, the drawing tool, 'drawer' is not initialized.

Parameters
----------
aComponent: Geom_Plane
aCenter: gp_Pnt
aCurrentMode: bool,optional
	default value is Standard_False

Returns
-------
None
") AIS_Plane;
		 AIS_Plane(const opencascade::handle<Geom_Plane> & aComponent, const gp_Pnt & aCenter, const Standard_Boolean aCurrentMode = Standard_False);

		/****************** AIS_Plane ******************/
		/**** md5 signature: 05bf8980d9c4c3df365fa7712ba217b6 ****/
		%feature("compactdefaultargs") AIS_Plane;
		%feature("autodoc", "Initializes the plane acomponent, the point acenter, and the minimum and maximum points, apmin and apmax. if the mode acurrentmode equals true, the drawing tool, 'drawer' is not initialized.

Parameters
----------
aComponent: Geom_Plane
aCenter: gp_Pnt
aPmin: gp_Pnt
aPmax: gp_Pnt
aCurrentMode: bool,optional
	default value is Standard_False

Returns
-------
None
") AIS_Plane;
		 AIS_Plane(const opencascade::handle<Geom_Plane> & aComponent, const gp_Pnt & aCenter, const gp_Pnt & aPmin, const gp_Pnt & aPmax, const Standard_Boolean aCurrentMode = Standard_False);

		/****************** AIS_Plane ******************/
		/**** md5 signature: 9edc05a5ec11fbc531da5dd401280271 ****/
		%feature("compactdefaultargs") AIS_Plane;
		%feature("autodoc", "No available documentation.

Parameters
----------
aComponent: Geom_Axis2Placement
aPlaneType: AIS_TypeOfPlane
aCurrentMode: bool,optional
	default value is Standard_False

Returns
-------
None
") AIS_Plane;
		 AIS_Plane(const opencascade::handle<Geom_Axis2Placement> & aComponent, const AIS_TypeOfPlane aPlaneType, const Standard_Boolean aCurrentMode = Standard_False);

		/****************** AcceptDisplayMode ******************/
		/**** md5 signature: 16fc40475e94b16a496778d86dfb4fec ****/
		%feature("compactdefaultargs") AcceptDisplayMode;
		%feature("autodoc", "Returns true if the display mode selected, amode, is valid for planes.

Parameters
----------
aMode: int

Returns
-------
bool
") AcceptDisplayMode;
		virtual Standard_Boolean AcceptDisplayMode(const Standard_Integer aMode);

		/****************** Axis2Placement ******************/
		/**** md5 signature: 37877c5e97ab627517b822b230b8b22b ****/
		%feature("compactdefaultargs") Axis2Placement;
		%feature("autodoc", "Returns the position of the plane's axis2 system identifying the x, y, or z axis and giving the plane a direction in 3d space. an axis2 system is a right-handed coordinate system.

Returns
-------
opencascade::handle<Geom_Axis2Placement>
") Axis2Placement;
		opencascade::handle<Geom_Axis2Placement> Axis2Placement();

		/****************** Center ******************/
		/**** md5 signature: 76b3760b23b8ce2c654d603f295e0c0d ****/
		%feature("compactdefaultargs") Center;
		%feature("autodoc", "Returns the coordinates of the center point.

Returns
-------
gp_Pnt
") Center;
		const gp_Pnt Center();

		/****************** Component ******************/
		/**** md5 signature: 303a9682f54bbdacc71e8f17577c38b3 ****/
		%feature("compactdefaultargs") Component;
		%feature("autodoc", "Returns the component specified in setcomponent.

Returns
-------
opencascade::handle<Geom_Plane>
") Component;
		const opencascade::handle<Geom_Plane> & Component();

		/****************** Compute ******************/
		/**** md5 signature: 09436ef6513347d4c96315939d8b75d5 ****/
		%feature("compactdefaultargs") Compute;
		%feature("autodoc", "Computes the presentation according to a point of view given by <aprojector>. to be used when the associated degenerated presentations have been transformed by <atrsf> which is not a pure translation. the hlr prs can't be deducted automatically warning :<atrsf> must be applied to the object to display before computation !!!.

Parameters
----------
aProjector: Prs3d_Projector
aTrsf: Geom_Transformation
aPresentation: Prs3d_Presentation

Returns
-------
None
") Compute;
		virtual void Compute(const opencascade::handle<Prs3d_Projector> & aProjector, const opencascade::handle<Geom_Transformation> & aTrsf, const opencascade::handle<Prs3d_Presentation> & aPresentation);

		/****************** ComputeSelection ******************/
		/**** md5 signature: 0ee36b1ad2a8a3c1bbb813dfdb1d40ae ****/
		%feature("compactdefaultargs") ComputeSelection;
		%feature("autodoc", "No available documentation.

Parameters
----------
theSelection: SelectMgr_Selection
theMode: int

Returns
-------
None
") ComputeSelection;
		virtual void ComputeSelection(const opencascade::handle<SelectMgr_Selection> & theSelection, const Standard_Integer theMode);

		/****************** CurrentMode ******************/
		/**** md5 signature: 063a9db1602f7bac1a4e0fa8301ae9a8 ****/
		%feature("compactdefaultargs") CurrentMode;
		%feature("autodoc", "Returns the non-default current display mode set by setcurrentmode.

Returns
-------
bool
") CurrentMode;
		Standard_Boolean CurrentMode();

		/****************** HasOwnSize ******************/
		/**** md5 signature: e915e28bcd0aa89fd85e56d0cb0fab71 ****/
		%feature("compactdefaultargs") HasOwnSize;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") HasOwnSize;
		Standard_Boolean HasOwnSize();

		/****************** IsXYZPlane ******************/
		/**** md5 signature: a306d22b0be3b8b20d3c93daeae452c2 ****/
		%feature("compactdefaultargs") IsXYZPlane;
		%feature("autodoc", "Returns the type of plane - xy, yz, or xz.

Returns
-------
bool
") IsXYZPlane;
		Standard_Boolean IsXYZPlane();

		/****************** PlaneAttributes ******************/
		/**** md5 signature: 222046c8756742783a17e4ea27163ab2 ****/
		%feature("compactdefaultargs") PlaneAttributes;
		%feature("autodoc", "Returns the settings for the selected plane acomponent, provided in setplaneattributes. these include the points acenter, apmin, and apmax.

Parameters
----------
aComponent: Geom_Plane
aCenter: gp_Pnt
aPmin: gp_Pnt
aPmax: gp_Pnt

Returns
-------
bool
") PlaneAttributes;
		Standard_Boolean PlaneAttributes(opencascade::handle<Geom_Plane> & aComponent, gp_Pnt & aCenter, gp_Pnt & aPmin, gp_Pnt & aPmax);

		/****************** SetAxis2Placement ******************/
		/**** md5 signature: d73d8eb41254415fddcc962ddec5e469 ****/
		%feature("compactdefaultargs") SetAxis2Placement;
		%feature("autodoc", "Allows you to provide settings for the position and direction of one of the plane's axes, acomponent, in 3d space. the coordinate system used is right-handed, and the type of plane aplanetype is one of: - ais_ topl_unknown - ais_ topl_xyplane - ais_ topl_xzplane - ais_ topl_yzplane}.

Parameters
----------
aComponent: Geom_Axis2Placement
aPlaneType: AIS_TypeOfPlane

Returns
-------
None
") SetAxis2Placement;
		void SetAxis2Placement(const opencascade::handle<Geom_Axis2Placement> & aComponent, const AIS_TypeOfPlane aPlaneType);

		/****************** SetCenter ******************/
		/**** md5 signature: ecf3b6f0e545b80cc6040218013c7da9 ****/
		%feature("compactdefaultargs") SetCenter;
		%feature("autodoc", "Provides settings for the center thecenter other than (0, 0, 0).

Parameters
----------
theCenter: gp_Pnt

Returns
-------
None
") SetCenter;
		void SetCenter(const gp_Pnt & theCenter);

		/****************** SetColor ******************/
		/**** md5 signature: 6b2b764a1e8ffb5d1aa4218d6218005c ****/
		%feature("compactdefaultargs") SetColor;
		%feature("autodoc", "No available documentation.

Parameters
----------
aColor: Quantity_Color

Returns
-------
None
") SetColor;
		void SetColor(const Quantity_Color & aColor);

		/****************** SetComponent ******************/
		/**** md5 signature: cabe0299a719dc64171b081f75779f2e ****/
		%feature("compactdefaultargs") SetComponent;
		%feature("autodoc", "Creates an instance of the plane acomponent.

Parameters
----------
aComponent: Geom_Plane

Returns
-------
None
") SetComponent;
		void SetComponent(const opencascade::handle<Geom_Plane> & aComponent);

		/****************** SetContext ******************/
		/**** md5 signature: bade88f85081ac1317d21b16677f9862 ****/
		%feature("compactdefaultargs") SetContext;
		%feature("autodoc", "Connection to <actx> default drawer implies a recomputation of frame values.

Parameters
----------
aCtx: AIS_InteractiveContext

Returns
-------
None
") SetContext;
		virtual void SetContext(const opencascade::handle<AIS_InteractiveContext> & aCtx);

		/****************** SetCurrentMode ******************/
		/**** md5 signature: 52128d8f940c1aad39994637a332dfae ****/
		%feature("compactdefaultargs") SetCurrentMode;
		%feature("autodoc", "Allows you to provide settings for a non-default current display mode.

Parameters
----------
theCurrentMode: bool

Returns
-------
None
") SetCurrentMode;
		void SetCurrentMode(const Standard_Boolean theCurrentMode);

		/****************** SetPlaneAttributes ******************/
		/**** md5 signature: fcab47c7809627db9a9877e1b1b1ecfc ****/
		%feature("compactdefaultargs") SetPlaneAttributes;
		%feature("autodoc", "Allows you to provide settings other than default ones for the selected plane. these include: center point acenter, maximum apmax and minimum apmin.

Parameters
----------
aComponent: Geom_Plane
aCenter: gp_Pnt
aPmin: gp_Pnt
aPmax: gp_Pnt

Returns
-------
None
") SetPlaneAttributes;
		void SetPlaneAttributes(const opencascade::handle<Geom_Plane> & aComponent, const gp_Pnt & aCenter, const gp_Pnt & aPmin, const gp_Pnt & aPmax);

		/****************** SetSize ******************/
		/**** md5 signature: c65fe36c41e6254ef40d079d847a39ba ****/
		%feature("compactdefaultargs") SetSize;
		%feature("autodoc", "Same value for x and y directions.

Parameters
----------
aValue: float

Returns
-------
None
") SetSize;
		void SetSize(const Standard_Real aValue);

		/****************** SetSize ******************/
		/**** md5 signature: 62b5a679beaf40fe5973c710160a59dc ****/
		%feature("compactdefaultargs") SetSize;
		%feature("autodoc", "Sets the size defined by the length along the x axis xval and the length along the y axis yval.

Parameters
----------
Xval: float
YVal: float

Returns
-------
None
") SetSize;
		void SetSize(const Standard_Real Xval, const Standard_Real YVal);

		/****************** SetTypeOfSensitivity ******************/
		/**** md5 signature: 0961922ef3f5c20bfe8405bc7846dadb ****/
		%feature("compactdefaultargs") SetTypeOfSensitivity;
		%feature("autodoc", "Sets the type of sensitivity for the plane.

Parameters
----------
theTypeOfSensitivity: Select3D_TypeOfSensitivity

Returns
-------
None
") SetTypeOfSensitivity;
		void SetTypeOfSensitivity(Select3D_TypeOfSensitivity theTypeOfSensitivity);

		/****************** Signature ******************/
		/**** md5 signature: 81eb93a6a9075273e61be0bf8e0d1a46 ****/
		%feature("compactdefaultargs") Signature;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") Signature;
		virtual Standard_Integer Signature();

		/****************** Size ******************/
		/**** md5 signature: c55e2744a8e0a499ff417b8524bf3c2d ****/
		%feature("compactdefaultargs") Size;
		%feature("autodoc", "No available documentation.

Parameters
----------

Returns
-------
X: float
Y: float
") Size;
		Standard_Boolean Size(Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** Type ******************/
		/**** md5 signature: dd06dc48aefe8f5e4fea271bcf932271 ****/
		%feature("compactdefaultargs") Type;
		%feature("autodoc", "No available documentation.

Returns
-------
AIS_KindOfInteractive
") Type;
		virtual AIS_KindOfInteractive Type();

		/****************** TypeOfPlane ******************/
		/**** md5 signature: b5d4b79d2d9f478b8bfb8f6f08aeff9a ****/
		%feature("compactdefaultargs") TypeOfPlane;
		%feature("autodoc", "Returns the type of plane - xy, yz, xz or unknown.

Returns
-------
AIS_TypeOfPlane
") TypeOfPlane;
		AIS_TypeOfPlane TypeOfPlane();

		/****************** TypeOfSensitivity ******************/
		/**** md5 signature: c53b1e467cd6a018aa2a82b303f3ed51 ****/
		%feature("compactdefaultargs") TypeOfSensitivity;
		%feature("autodoc", "Returns the type of sensitivity for the plane;.

Returns
-------
Select3D_TypeOfSensitivity
") TypeOfSensitivity;
		Select3D_TypeOfSensitivity TypeOfSensitivity();

		/****************** UnsetColor ******************/
		/**** md5 signature: 305de4c541ce8067f3ff456f9ec26b55 ****/
		%feature("compactdefaultargs") UnsetColor;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") UnsetColor;
		void UnsetColor();

		/****************** UnsetSize ******************/
		/**** md5 signature: 01e2703c873bbcb3ae46d4b247bdacb6 ****/
		%feature("compactdefaultargs") UnsetSize;
		%feature("autodoc", "No available documentation.

Returns
-------
None
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
		/****************** AIS_PlaneTrihedron ******************/
		/**** md5 signature: ae783f3a176a7a2444c5f23672eaf5c5 ****/
		%feature("compactdefaultargs") AIS_PlaneTrihedron;
		%feature("autodoc", "Initializes the plane aplane. the plane trihedron is constructed from this and an axis.

Parameters
----------
aPlane: Geom_Plane

Returns
-------
None
") AIS_PlaneTrihedron;
		 AIS_PlaneTrihedron(const opencascade::handle<Geom_Plane> & aPlane);

		/****************** AcceptDisplayMode ******************/
		/**** md5 signature: 4b2dbc71bc9796a113d83252030ddc96 ****/
		%feature("compactdefaultargs") AcceptDisplayMode;
		%feature("autodoc", "Returns true if the display mode selected, amode, is valid.

Parameters
----------
aMode: int

Returns
-------
bool
") AcceptDisplayMode;
		Standard_Boolean AcceptDisplayMode(const Standard_Integer aMode);

		/****************** Component ******************/
		/**** md5 signature: e2c0d02519a70a2ebf4ac43e0b834b9e ****/
		%feature("compactdefaultargs") Component;
		%feature("autodoc", "Returns the component specified in setcomponent.

Returns
-------
opencascade::handle<Geom_Plane>
") Component;
		opencascade::handle<Geom_Plane> Component();

		/****************** Compute ******************/
		/**** md5 signature: 09436ef6513347d4c96315939d8b75d5 ****/
		%feature("compactdefaultargs") Compute;
		%feature("autodoc", "Computes the presentation according to a point of view given by <aprojector>. to be used when the associated degenerated presentations have been transformed by <atrsf> which is not a pure translation. the hlr prs can't be deducted automatically warning :<atrsf> must be applied to the object to display before computation !!!.

Parameters
----------
aProjector: Prs3d_Projector
aTrsf: Geom_Transformation
aPresentation: Prs3d_Presentation

Returns
-------
None
") Compute;
		virtual void Compute(const opencascade::handle<Prs3d_Projector> & aProjector, const opencascade::handle<Geom_Transformation> & aTrsf, const opencascade::handle<Prs3d_Presentation> & aPresentation);

		/****************** GetLength ******************/
		/**** md5 signature: 9390a920d888683f8b474026b2d95a49 ****/
		%feature("compactdefaultargs") GetLength;
		%feature("autodoc", "Returns the length of x and y axes.

Returns
-------
float
") GetLength;
		Standard_Real GetLength();

		/****************** Position ******************/
		/**** md5 signature: 7d9aba563ce6c4534b6f60ef5450366a ****/
		%feature("compactdefaultargs") Position;
		%feature("autodoc", "Returns the point of origin of the plane trihedron.

Returns
-------
opencascade::handle<AIS_Point>
") Position;
		opencascade::handle<AIS_Point> Position();

		/****************** SetColor ******************/
		/**** md5 signature: 259272248bacb2cef242adbc667f0ef9 ****/
		%feature("compactdefaultargs") SetColor;
		%feature("autodoc", "Allows you to provide settings for the color acolor.

Parameters
----------
theColor: Quantity_Color

Returns
-------
None
") SetColor;
		virtual void SetColor(const Quantity_Color & theColor);

		/****************** SetComponent ******************/
		/**** md5 signature: 1bca8d1d2d75bebfbc41ee846bfa84a1 ****/
		%feature("compactdefaultargs") SetComponent;
		%feature("autodoc", "Creates an instance of the component object aplane.

Parameters
----------
aPlane: Geom_Plane

Returns
-------
None
") SetComponent;
		void SetComponent(const opencascade::handle<Geom_Plane> & aPlane);

		/****************** SetLength ******************/
		/**** md5 signature: 8666b48a650ccc14efb217be9a1a2a9d ****/
		%feature("compactdefaultargs") SetLength;
		%feature("autodoc", "Sets the length of the x and y axes.

Parameters
----------
theLength: float

Returns
-------
None
") SetLength;
		void SetLength(const Standard_Real theLength);

		/****************** SetXLabel ******************/
		/**** md5 signature: 77db9994f4c4890941ca57fa8eb88e9a ****/
		%feature("compactdefaultargs") SetXLabel;
		%feature("autodoc", "No available documentation.

Parameters
----------
theLabel: TCollection_AsciiString

Returns
-------
None
") SetXLabel;
		void SetXLabel(const TCollection_AsciiString & theLabel);

		/****************** SetYLabel ******************/
		/**** md5 signature: 8fe68a257c14798d817c0a27a82042b8 ****/
		%feature("compactdefaultargs") SetYLabel;
		%feature("autodoc", "No available documentation.

Parameters
----------
theLabel: TCollection_AsciiString

Returns
-------
None
") SetYLabel;
		void SetYLabel(const TCollection_AsciiString & theLabel);

		/****************** Signature ******************/
		/**** md5 signature: 4e037e01ba764fd5d5261e3d9ba6557d ****/
		%feature("compactdefaultargs") Signature;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") Signature;
		virtual Standard_Integer Signature();

		/****************** Type ******************/
		/**** md5 signature: bf4aea6b24d0b584b57c781f208134ec ****/
		%feature("compactdefaultargs") Type;
		%feature("autodoc", "Returns datum as the type of interactive object.

Returns
-------
AIS_KindOfInteractive
") Type;
		virtual AIS_KindOfInteractive Type();

		/****************** XAxis ******************/
		/**** md5 signature: e4128aaf660a4951e55140d350cd10f9 ****/
		%feature("compactdefaultargs") XAxis;
		%feature("autodoc", "Returns the 'xaxis'.

Returns
-------
opencascade::handle<AIS_Line>
") XAxis;
		opencascade::handle<AIS_Line> XAxis();

		/****************** YAxis ******************/
		/**** md5 signature: 0a267871ff2869b09e2a9b41404ae03b ****/
		%feature("compactdefaultargs") YAxis;
		%feature("autodoc", "Returns the 'yaxis'.

Returns
-------
opencascade::handle<AIS_Line>
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
		/****************** AIS_Point ******************/
		/**** md5 signature: 2f1f87ccd8789d1b41f61f012d372bc1 ****/
		%feature("compactdefaultargs") AIS_Point;
		%feature("autodoc", "Initializes the point acomponent from which the point datum will be built.

Parameters
----------
aComponent: Geom_Point

Returns
-------
None
") AIS_Point;
		 AIS_Point(const opencascade::handle<Geom_Point> & aComponent);

		/****************** AcceptDisplayMode ******************/
		/**** md5 signature: 4b2dbc71bc9796a113d83252030ddc96 ****/
		%feature("compactdefaultargs") AcceptDisplayMode;
		%feature("autodoc", "Returns true if the display mode selected is valid for point datums.

Parameters
----------
aMode: int

Returns
-------
bool
") AcceptDisplayMode;
		Standard_Boolean AcceptDisplayMode(const Standard_Integer aMode);

		/****************** Component ******************/
		/**** md5 signature: 04da78de5b13e434be2216d44998d0e9 ****/
		%feature("compactdefaultargs") Component;
		%feature("autodoc", "Returns the component specified in setcomponent.

Returns
-------
opencascade::handle<Geom_Point>
") Component;
		opencascade::handle<Geom_Point> Component();

		/****************** Compute ******************/
		/**** md5 signature: 09436ef6513347d4c96315939d8b75d5 ****/
		%feature("compactdefaultargs") Compute;
		%feature("autodoc", "Computes the presentation according to a point of view given by <aprojector>. to be used when the associated degenerated presentations have been transformed by <atrsf> which is not a pure translation. the hlr prs can't be deducted automatically warning :<atrsf> must be applied to the object to display before computation !!!.

Parameters
----------
aProjector: Prs3d_Projector
aTrsf: Geom_Transformation
aPresentation: Prs3d_Presentation

Returns
-------
None
") Compute;
		virtual void Compute(const opencascade::handle<Prs3d_Projector> & aProjector, const opencascade::handle<Geom_Transformation> & aTrsf, const opencascade::handle<Prs3d_Presentation> & aPresentation);

		/****************** HasMarker ******************/
		/**** md5 signature: 7622325081b114c983e5a28bc511c5cc ****/
		%feature("compactdefaultargs") HasMarker;
		%feature("autodoc", "Returns true if the point datum has a marker.

Returns
-------
bool
") HasMarker;
		Standard_Boolean HasMarker();

		/****************** SetColor ******************/
		/**** md5 signature: 259272248bacb2cef242adbc667f0ef9 ****/
		%feature("compactdefaultargs") SetColor;
		%feature("autodoc", "Allows you to provide settings for the color.

Parameters
----------
theColor: Quantity_Color

Returns
-------
None
") SetColor;
		virtual void SetColor(const Quantity_Color & theColor);

		/****************** SetComponent ******************/
		/**** md5 signature: e1a4992bb046aba80ac5162deb11429f ****/
		%feature("compactdefaultargs") SetComponent;
		%feature("autodoc", "Constructs an instance of the point acomponent.

Parameters
----------
aComponent: Geom_Point

Returns
-------
None
") SetComponent;
		void SetComponent(const opencascade::handle<Geom_Point> & aComponent);

		/****************** SetMarker ******************/
		/**** md5 signature: 53b11e7f18efb0f33c0075851766f7e8 ****/
		%feature("compactdefaultargs") SetMarker;
		%feature("autodoc", "Allows you to provide settings for a marker. these include - type of marker, - marker color, - scale factor.

Parameters
----------
aType: Aspect_TypeOfMarker

Returns
-------
None
") SetMarker;
		void SetMarker(const Aspect_TypeOfMarker aType);

		/****************** Signature ******************/
		/**** md5 signature: 4e037e01ba764fd5d5261e3d9ba6557d ****/
		%feature("compactdefaultargs") Signature;
		%feature("autodoc", "Returns index 1, the default index for a point.

Returns
-------
int
") Signature;
		virtual Standard_Integer Signature();

		/****************** Type ******************/
		/**** md5 signature: bf4aea6b24d0b584b57c781f208134ec ****/
		%feature("compactdefaultargs") Type;
		%feature("autodoc", "Indicates that a point is a datum.

Returns
-------
AIS_KindOfInteractive
") Type;
		virtual AIS_KindOfInteractive Type();

		/****************** UnsetColor ******************/
		/**** md5 signature: 2da7e2ed6a63f7c70c36c2a82118a7ec ****/
		%feature("compactdefaultargs") UnsetColor;
		%feature("autodoc", "Allows you to remove color settings.

Returns
-------
None
") UnsetColor;
		virtual void UnsetColor();

		/****************** UnsetMarker ******************/
		/**** md5 signature: df2d21daa9af0f066f37782351572702 ****/
		%feature("compactdefaultargs") UnsetMarker;
		%feature("autodoc", "Removes the marker settings.

Returns
-------
None
") UnsetMarker;
		void UnsetMarker();

		/****************** Vertex ******************/
		/**** md5 signature: f00980db3d22a7e6d7f5f1300940ccaa ****/
		%feature("compactdefaultargs") Vertex;
		%feature("autodoc", "Converts a point into a vertex.

Returns
-------
TopoDS_Vertex
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

/* python proy classes for enums */
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

		/****************** AIS_PointCloud ******************/
		/**** md5 signature: a48e67fa09efde4b134cc4b5e5b4ca47 ****/
		%feature("compactdefaultargs") AIS_PointCloud;
		%feature("autodoc", "Constructor.

Returns
-------
None
") AIS_PointCloud;
		 AIS_PointCloud();

		/****************** GetBoundingBox ******************/
		/**** md5 signature: c776ca3f9f7d80c6934fc1b6003552bc ****/
		%feature("compactdefaultargs") GetBoundingBox;
		%feature("autodoc", "Get bounding box for presentation.

Returns
-------
Bnd_Box
") GetBoundingBox;
		virtual Bnd_Box GetBoundingBox();

		/****************** GetPoints ******************/
		/**** md5 signature: e4eda70415581cdfb96fa049a3263656 ****/
		%feature("compactdefaultargs") GetPoints;
		%feature("autodoc", "Get the points array. method might be overridden to fill in points array dynamically from application data structures. returns the array of points.

Returns
-------
opencascade::handle<Graphic3d_ArrayOfPoints>
") GetPoints;
		virtual const opencascade::handle<Graphic3d_ArrayOfPoints> GetPoints();

		/****************** SetColor ******************/
		/**** md5 signature: 259272248bacb2cef242adbc667f0ef9 ****/
		%feature("compactdefaultargs") SetColor;
		%feature("autodoc", "Setup custom color. affects presentation only when no per-point color attribute has been assigned.

Parameters
----------
theColor: Quantity_Color

Returns
-------
None
") SetColor;
		virtual void SetColor(const Quantity_Color & theColor);

		/****************** SetMaterial ******************/
		/**** md5 signature: 2361a3d4a6a38f1663c4f2b668f1199e ****/
		%feature("compactdefaultargs") SetMaterial;
		%feature("autodoc", "Setup custom material. affects presentation only when normals are defined.

Parameters
----------
theMat: Graphic3d_MaterialAspect

Returns
-------
None
") SetMaterial;
		virtual void SetMaterial(const Graphic3d_MaterialAspect & theMat);

		/****************** SetPoints ******************/
		/**** md5 signature: 0b6a2d7fb3cf24bd7f5f4e81bd82b008 ****/
		%feature("compactdefaultargs") SetPoints;
		%feature("autodoc", "Sets the points from array of points. method will not copy the input data - array will be stored as handle. @param thepoints [in] the array of points.

Parameters
----------
thePoints: Graphic3d_ArrayOfPoints

Returns
-------
None
") SetPoints;
		virtual void SetPoints(const opencascade::handle<Graphic3d_ArrayOfPoints> & thePoints);

		/****************** SetPoints ******************/
		/**** md5 signature: a5e4149d123953f4aa31667666e721d4 ****/
		%feature("compactdefaultargs") SetPoints;
		%feature("autodoc", "Sets the points with optional colors. the input data will be copied into internal buffer. the input arrays should have equal length, otherwise the presentation will not be computed and displayed. @param thecoords [in] the array of coordinates @param thecolors [in] optional array of colors @param thenormals [in] optional array of normals.

Parameters
----------
theCoords: TColgp_HArray1OfPnt
theColors: Quantity_HArray1OfColor,optional
	default value is NULL
theNormals: TColgp_HArray1OfDir,optional
	default value is NULL

Returns
-------
None
") SetPoints;
		virtual void SetPoints(const opencascade::handle<TColgp_HArray1OfPnt> & theCoords, const opencascade::handle<Quantity_HArray1OfColor> & theColors = NULL, const opencascade::handle<TColgp_HArray1OfDir> & theNormals = NULL);

		/****************** UnsetColor ******************/
		/**** md5 signature: 2da7e2ed6a63f7c70c36c2a82118a7ec ****/
		%feature("compactdefaultargs") UnsetColor;
		%feature("autodoc", "Restore default color.

Returns
-------
None
") UnsetColor;
		virtual void UnsetColor();

		/****************** UnsetMaterial ******************/
		/**** md5 signature: 0a051ddc9f5267e24615c6f3dfd30498 ****/
		%feature("compactdefaultargs") UnsetMaterial;
		%feature("autodoc", "Restore default material.

Returns
-------
None
") UnsetMaterial;
		virtual void UnsetMaterial();

};


%make_alias(AIS_PointCloud)

%extend AIS_PointCloud {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************
* class AIS_Relation *
*********************/
%nodefaultctor AIS_Relation;
class AIS_Relation : public AIS_InteractiveObject {
	public:
		/****************** AcceptDisplayMode ******************/
		/**** md5 signature: 16fc40475e94b16a496778d86dfb4fec ****/
		%feature("compactdefaultargs") AcceptDisplayMode;
		%feature("autodoc", "Returns true if the display mode amode is accepted for the interactive objects in the relation. computeprojpresentation(me; apres : presentation from prs3d; curve1 : curve from geom; curve2 : curve from geom; firstp1 : pnt from gp; lastp1 : pnt from gp; firstp2 : pnt from gp; lastp2 : pnt from gp; acolor : nameofcolor from quantity = quantity_noc_purple; awidth : real  from standard = 2; aprojtol : typeofline  from aspect = aspect_tol_dash; acalltol : typeofline  from aspect = aspect_tol_dot).

Parameters
----------
aMode: int

Returns
-------
bool
") AcceptDisplayMode;
		virtual Standard_Boolean AcceptDisplayMode(const Standard_Integer aMode);

		/****************** ArrowSize ******************/
		/**** md5 signature: 1c64631a05987281258edff790436577 ****/
		%feature("compactdefaultargs") ArrowSize;
		%feature("autodoc", "Returns the value for the size of the arrow identifying the relation between the two shapes.

Returns
-------
float
") ArrowSize;
		Standard_Real ArrowSize();

		/****************** AutomaticPosition ******************/
		/**** md5 signature: 4069aa0ccd84519a8254a311ab36e427 ****/
		%feature("compactdefaultargs") AutomaticPosition;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") AutomaticPosition;
		Standard_Boolean AutomaticPosition();

		/****************** ExtShape ******************/
		/**** md5 signature: ba3f30014ebd951754e2319eb6678935 ****/
		%feature("compactdefaultargs") ExtShape;
		%feature("autodoc", "Returns the status index of the extension shape.

Returns
-------
int
") ExtShape;
		Standard_Integer ExtShape();

		/****************** FirstShape ******************/
		/**** md5 signature: 0052eba922702f3e525649e52d93f4e7 ****/
		%feature("compactdefaultargs") FirstShape;
		%feature("autodoc", "No available documentation.

Returns
-------
TopoDS_Shape
") FirstShape;
		const TopoDS_Shape FirstShape();

		/****************** IsMovable ******************/
		/**** md5 signature: 9f41b36fced50df9775679c8c7b28f09 ****/
		%feature("compactdefaultargs") IsMovable;
		%feature("autodoc", "Returns true if the interactive object is movable.

Returns
-------
bool
") IsMovable;
		virtual Standard_Boolean IsMovable();

		/****************** KindOfDimension ******************/
		/**** md5 signature: 5fbd88227fb3451f8553f8a12b933712 ****/
		%feature("compactdefaultargs") KindOfDimension;
		%feature("autodoc", "Indicates that the type of dimension is unknown.

Returns
-------
AIS_KindOfDimension
") KindOfDimension;
		virtual AIS_KindOfDimension KindOfDimension();

		/****************** Plane ******************/
		/**** md5 signature: 94aa2880e5105df8ee475ace1dfe0bd2 ****/
		%feature("compactdefaultargs") Plane;
		%feature("autodoc", "Returns the plane.

Returns
-------
opencascade::handle<Geom_Plane>
") Plane;
		const opencascade::handle<Geom_Plane> & Plane();

		/****************** Position ******************/
		/**** md5 signature: 0ab08d371c89be0cb1eecbddf304bb77 ****/
		%feature("compactdefaultargs") Position;
		%feature("autodoc", "Returns the position set using setposition.

Returns
-------
gp_Pnt
") Position;
		const gp_Pnt Position();

		/****************** SecondShape ******************/
		/**** md5 signature: 3c9d5f80bfbcac42f6848475061ecf61 ****/
		%feature("compactdefaultargs") SecondShape;
		%feature("autodoc", "Returns the second shape.

Returns
-------
TopoDS_Shape
") SecondShape;
		const TopoDS_Shape SecondShape();

		/****************** SetArrowSize ******************/
		/**** md5 signature: 7f29c9d69ed4995251718b45132ef44a ****/
		%feature("compactdefaultargs") SetArrowSize;
		%feature("autodoc", "Allows you to provide settings for the size of the arrow thearrowsize identifying the relation between the two shapes.

Parameters
----------
theArrowSize: float

Returns
-------
None
") SetArrowSize;
		void SetArrowSize(const Standard_Real theArrowSize);

		/****************** SetAutomaticPosition ******************/
		/**** md5 signature: eb2707fc0c7ac0140ed8fd4c80f28b34 ****/
		%feature("compactdefaultargs") SetAutomaticPosition;
		%feature("autodoc", "No available documentation.

Parameters
----------
theStatus: bool

Returns
-------
None
") SetAutomaticPosition;
		void SetAutomaticPosition(const Standard_Boolean theStatus);

		/****************** SetBndBox ******************/
		/**** md5 signature: 7c3556dffd56ab1f14ecdaaf0953820a ****/
		%feature("compactdefaultargs") SetBndBox;
		%feature("autodoc", "No available documentation.

Parameters
----------
theXmin: float
theYmin: float
theZmin: float
theXmax: float
theYmax: float
theZmax: float

Returns
-------
None
") SetBndBox;
		void SetBndBox(const Standard_Real theXmin, const Standard_Real theYmin, const Standard_Real theZmin, const Standard_Real theXmax, const Standard_Real theYmax, const Standard_Real theZmax);

		/****************** SetColor ******************/
		/**** md5 signature: 7e02f3e04e30cfab690f414e5d7614ca ****/
		%feature("compactdefaultargs") SetColor;
		%feature("autodoc", "Allows you to provide settings for the color thecolor of the lines representing the relation between the two shapes.

Parameters
----------
theColor: Quantity_Color

Returns
-------
None
") SetColor;
		void SetColor(const Quantity_Color & theColor);

		/****************** SetExtShape ******************/
		/**** md5 signature: 86fc35735d1c517597a5d532e3f8521a ****/
		%feature("compactdefaultargs") SetExtShape;
		%feature("autodoc", "Allows you to set the status of the extension shape by the index aindex. the status will be one of the following: - 0 - there is no connection to a shape; - 1 - there is a connection to the first shape; - 2 - there is a connection to the second shape.

Parameters
----------
theIndex: int

Returns
-------
None
") SetExtShape;
		void SetExtShape(const Standard_Integer theIndex);

		/****************** SetFirstShape ******************/
		/**** md5 signature: 264d1d215505df4496dcf2e3266265a8 ****/
		%feature("compactdefaultargs") SetFirstShape;
		%feature("autodoc", "No available documentation.

Parameters
----------
aFShape: TopoDS_Shape

Returns
-------
None
") SetFirstShape;
		virtual void SetFirstShape(const TopoDS_Shape & aFShape);

		/****************** SetPlane ******************/
		/**** md5 signature: 950afcbb12a962d6ac501f5bcd6b2945 ****/
		%feature("compactdefaultargs") SetPlane;
		%feature("autodoc", "Allows you to set the plane theplane. this is used to define relations and dimensions in several daughter classes.

Parameters
----------
thePlane: Geom_Plane

Returns
-------
None
") SetPlane;
		void SetPlane(const opencascade::handle<Geom_Plane> & thePlane);

		/****************** SetPosition ******************/
		/**** md5 signature: 2f8cb3df196eb538026858474c42a042 ****/
		%feature("compactdefaultargs") SetPosition;
		%feature("autodoc", "Allows you to provide the objects in the relation with settings for a non-default position.

Parameters
----------
thePosition: gp_Pnt

Returns
-------
None
") SetPosition;
		void SetPosition(const gp_Pnt & thePosition);

		/****************** SetSecondShape ******************/
		/**** md5 signature: 2dd80771be171a80800223d09f3be002 ****/
		%feature("compactdefaultargs") SetSecondShape;
		%feature("autodoc", "Allows you to identify the second shape asshape relative to the first.

Parameters
----------
aSShape: TopoDS_Shape

Returns
-------
None
") SetSecondShape;
		virtual void SetSecondShape(const TopoDS_Shape & aSShape);

		/****************** SetSymbolPrs ******************/
		/**** md5 signature: 703c256ba420e65c94dac6b87e3d6047 ****/
		%feature("compactdefaultargs") SetSymbolPrs;
		%feature("autodoc", "Allows you to provide settings for the symbol presentation.

Parameters
----------
theSymbolPrs: DsgPrs_ArrowSide

Returns
-------
None
") SetSymbolPrs;
		void SetSymbolPrs(const DsgPrs_ArrowSide theSymbolPrs);

		/****************** SetText ******************/
		/**** md5 signature: b6056cb56568f8909dbeaac438ef83aa ****/
		%feature("compactdefaultargs") SetText;
		%feature("autodoc", "Allows you to provide the settings thetext for text aspect.

Parameters
----------
theText: TCollection_ExtendedString

Returns
-------
None
") SetText;
		void SetText(const TCollection_ExtendedString & theText);

		/****************** SetValue ******************/
		/**** md5 signature: 5be0c2680e760a4f92ac7b7d3ae78786 ****/
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "Allows you to provide settings for the value theval for each object in the relation.

Parameters
----------
theVal: float

Returns
-------
None
") SetValue;
		void SetValue(const Standard_Real theVal);

		/****************** SymbolPrs ******************/
		/**** md5 signature: 7b81240b7c5c019dedce9d08539b00f1 ****/
		%feature("compactdefaultargs") SymbolPrs;
		%feature("autodoc", "Returns the value of the symbol presentation. this will be one of: - as_none - none - as_firstar - first arrow - as_lastar - last arrow - as_bothar - both arrows - as_firstpt - first point - as_lastpt - last point - as_bothpt - both points - as_firstar_lastpt - first arrow, last point - as_firstpt_lastar - first point, last arrow.

Returns
-------
DsgPrs_ArrowSide
") SymbolPrs;
		DsgPrs_ArrowSide SymbolPrs();

		/****************** Text ******************/
		/**** md5 signature: 72bf6306b0638727f5e5c6cb054bb79f ****/
		%feature("compactdefaultargs") Text;
		%feature("autodoc", "Returns settings for text aspect.

Returns
-------
TCollection_ExtendedString
") Text;
		const TCollection_ExtendedString & Text();

		/****************** Type ******************/
		/**** md5 signature: bf4aea6b24d0b584b57c781f208134ec ****/
		%feature("compactdefaultargs") Type;
		%feature("autodoc", "No available documentation.

Returns
-------
AIS_KindOfInteractive
") Type;
		virtual AIS_KindOfInteractive Type();

		/****************** UnsetBndBox ******************/
		/**** md5 signature: c3c34a2be55a0808b9eae7a500b23e3b ****/
		%feature("compactdefaultargs") UnsetBndBox;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") UnsetBndBox;
		void UnsetBndBox();

		/****************** UnsetColor ******************/
		/**** md5 signature: 305de4c541ce8067f3ff456f9ec26b55 ****/
		%feature("compactdefaultargs") UnsetColor;
		%feature("autodoc", "Allows you to remove settings for the color of the lines representing the relation between the two shapes.

Returns
-------
None
") UnsetColor;
		void UnsetColor();

		/****************** Value ******************/
		/**** md5 signature: 246826be964a300c707aadb5d0b62468 ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Returns the value of each object in the relation.

Returns
-------
float
") Value;
		Standard_Real Value();

};


%make_alias(AIS_Relation)

%extend AIS_Relation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************
* class AIS_RubberBand *
***********************/
class AIS_RubberBand : public AIS_InteractiveObject {
	public:
		/****************** AIS_RubberBand ******************/
		/**** md5 signature: 830a722d349851c570ded7e3f3ebacf8 ****/
		%feature("compactdefaultargs") AIS_RubberBand;
		%feature("autodoc", "Constructs rubber band with default configuration: empty filling and white solid lines. @warning it binds this object with graphic3d_zlayerid_toposd layer.

Returns
-------
None
") AIS_RubberBand;
		 AIS_RubberBand();

		/****************** AIS_RubberBand ******************/
		/**** md5 signature: f206c8224cee53d31fb6bb8cc43bef8e ****/
		%feature("compactdefaultargs") AIS_RubberBand;
		%feature("autodoc", "Consructs the rubber band with empty filling and defined line style. @param thelinecolor [in] color of rubber band lines @param thetype [in] type of rubber band lines @param thelinewidth [in] width of rubber band line. by default it is 1. @warning it binds this object with graphic3d_zlayerid_toposd layer.

Parameters
----------
theLineColor: Quantity_Color
theType: Aspect_TypeOfLine
theLineWidth: float,optional
	default value is 1.0
theIsPolygonClosed: bool,optional
	default value is Standard_True

Returns
-------
None
") AIS_RubberBand;
		 AIS_RubberBand(const Quantity_Color & theLineColor, const Aspect_TypeOfLine theType, const Standard_Real theLineWidth = 1.0, const Standard_Boolean theIsPolygonClosed = Standard_True);

		/****************** AIS_RubberBand ******************/
		/**** md5 signature: 89e6e93566c08dfc9ed6bc2ca57390a0 ****/
		%feature("compactdefaultargs") AIS_RubberBand;
		%feature("autodoc", "Constructs the rubber band with defined filling and line parameters. @param thelinecolor [in] color of rubber band lines @param thetype [in] type of rubber band lines @param thefillcolor [in] color of rubber band filling @param thetransparency [in] transparency of the filling. 0 is for opaque filling. by default it is transparent. @param thelinewidth [in] width of rubber band line. by default it is 1. @warning it binds this object with graphic3d_zlayerid_toposd layer.

Parameters
----------
theLineColor: Quantity_Color
theType: Aspect_TypeOfLine
theFillColor: Quantity_Color
theTransparency: float,optional
	default value is 1.0
theLineWidth: float,optional
	default value is 1.0
theIsPolygonClosed: bool,optional
	default value is Standard_True

Returns
-------
None
") AIS_RubberBand;
		 AIS_RubberBand(const Quantity_Color & theLineColor, const Aspect_TypeOfLine theType, const Quantity_Color theFillColor, const Standard_Real theTransparency = 1.0, const Standard_Real theLineWidth = 1.0, const Standard_Boolean theIsPolygonClosed = Standard_True);

		/****************** AddPoint ******************/
		/**** md5 signature: 42c27bcd3e0ab815d6401243fb685b51 ****/
		%feature("compactdefaultargs") AddPoint;
		%feature("autodoc", "Adds last point to the list of points. they are used to build polygon for rubber band. @sa removelastpoint(), getpoints().

Parameters
----------
thePoint: Graphic3d_Vec2i

Returns
-------
None
") AddPoint;
		void AddPoint(const Graphic3d_Vec2i & thePoint);

		/****************** ClearPoints ******************/
		/**** md5 signature: 666d63d9f2a8b4f033341bec50a0bbe5 ****/
		%feature("compactdefaultargs") ClearPoints;
		%feature("autodoc", "Remove all points for the rubber band polygon.

Returns
-------
None
") ClearPoints;
		void ClearPoints();

		/****************** FillColor ******************/
		/**** md5 signature: ffbf8b528d2e8dbd58b3fdc84942a96d ****/
		%feature("compactdefaultargs") FillColor;
		%feature("autodoc", "Returns the color of rubber band filling.

Returns
-------
Quantity_Color
") FillColor;
		Quantity_Color FillColor();

		/****************** FillTransparency ******************/
		/**** md5 signature: 0c352e3dbfa6432d72d8ec9221d3015d ****/
		%feature("compactdefaultargs") FillTransparency;
		%feature("autodoc", "Returns fill transparency.

Returns
-------
float
") FillTransparency;
		Standard_Real FillTransparency();

		/****************** IsFilling ******************/
		/**** md5 signature: 91fdd2021ff1fad726886b499424ccdd ****/
		%feature("compactdefaultargs") IsFilling;
		%feature("autodoc", "Returns true if filling of rubber band is enabled.

Returns
-------
bool
") IsFilling;
		Standard_Boolean IsFilling();

		/****************** IsPolygonClosed ******************/
		/**** md5 signature: deeb710d374819fbf6ad38f62a301293 ****/
		%feature("compactdefaultargs") IsPolygonClosed;
		%feature("autodoc", "Returns true if automatic closing of rubber band is enabled.

Returns
-------
bool
") IsPolygonClosed;
		Standard_Boolean IsPolygonClosed();

		/****************** LineColor ******************/
		/**** md5 signature: 287d3db7c040dbd903ae9bab4775434d ****/
		%feature("compactdefaultargs") LineColor;
		%feature("autodoc", "Returns the color attributes.

Returns
-------
Quantity_Color
") LineColor;
		Quantity_Color LineColor();

		/****************** LineType ******************/
		/**** md5 signature: 0f99f64671ffab5d520407d1f66ce563 ****/
		%feature("compactdefaultargs") LineType;
		%feature("autodoc", "Returns type of lines.

Returns
-------
Aspect_TypeOfLine
") LineType;
		Aspect_TypeOfLine LineType();

		/****************** LineWidth ******************/
		/**** md5 signature: 7028be9a1a0deda89ceb2ccd30bda317 ****/
		%feature("compactdefaultargs") LineWidth;
		%feature("autodoc", "Returns width of lines.

Returns
-------
float
") LineWidth;
		Standard_Real LineWidth();

		/****************** Points ******************/
		/**** md5 signature: f9612ca729b2bdd863061545066ec5cc ****/
		%feature("compactdefaultargs") Points;
		%feature("autodoc", "Returns points for the rubber band polygon.

Returns
-------
NCollection_Sequence<Graphic3d_Vec2i>
") Points;
		const NCollection_Sequence<Graphic3d_Vec2i> & Points();

		/****************** RemoveLastPoint ******************/
		/**** md5 signature: 90c19d859f20a83ceba67713ab84917b ****/
		%feature("compactdefaultargs") RemoveLastPoint;
		%feature("autodoc", "Remove last point from the list of points for the rubber band polygon. @sa addpoint(), getpoints().

Returns
-------
None
") RemoveLastPoint;
		void RemoveLastPoint();

		/****************** SetFillColor ******************/
		/**** md5 signature: a05c06141e0ede7ccc6b1d79a19ece27 ****/
		%feature("compactdefaultargs") SetFillColor;
		%feature("autodoc", "Sets color of rubber band filling.

Parameters
----------
theColor: Quantity_Color

Returns
-------
None
") SetFillColor;
		void SetFillColor(const Quantity_Color & theColor);

		/****************** SetFillTransparency ******************/
		/**** md5 signature: 483f815d00ddd65d253b43360b4b15a1 ****/
		%feature("compactdefaultargs") SetFillTransparency;
		%feature("autodoc", "Sets fill transparency. @param thevalue [in] the transparency value. 1.0 is for transparent background.

Parameters
----------
theValue: float

Returns
-------
None
") SetFillTransparency;
		void SetFillTransparency(const Standard_Real theValue);

		/****************** SetFilling ******************/
		/**** md5 signature: df4f622ce4ceece864cea55c7c7d5893 ****/
		%feature("compactdefaultargs") SetFilling;
		%feature("autodoc", "Enable or disable filling of rubber band.

Parameters
----------
theIsFilling: bool

Returns
-------
None
") SetFilling;
		void SetFilling(const Standard_Boolean theIsFilling);

		/****************** SetFilling ******************/
		/**** md5 signature: 0bb022730b6fdadb73a8f3e7920af24e ****/
		%feature("compactdefaultargs") SetFilling;
		%feature("autodoc", "Enable filling of rubber band with defined parameters. @param thecolor [in] color of filling @param thetransparency [in] transparency of the filling. 0 is for opaque filling.

Parameters
----------
theColor: Quantity_Color
theTransparency: float

Returns
-------
None
") SetFilling;
		void SetFilling(const Quantity_Color theColor, const Standard_Real theTransparency);

		/****************** SetLineColor ******************/
		/**** md5 signature: cda5d06f471777b34354dd1e594e9ba9 ****/
		%feature("compactdefaultargs") SetLineColor;
		%feature("autodoc", "Sets color of lines for rubber band presentation.

Parameters
----------
theColor: Quantity_Color

Returns
-------
None
") SetLineColor;
		void SetLineColor(const Quantity_Color & theColor);

		/****************** SetLineType ******************/
		/**** md5 signature: ad6a901b16ac578c15dc18e99302b01e ****/
		%feature("compactdefaultargs") SetLineType;
		%feature("autodoc", "Sets type of line for rubber band presentation.

Parameters
----------
theType: Aspect_TypeOfLine

Returns
-------
None
") SetLineType;
		void SetLineType(const Aspect_TypeOfLine theType);

		/****************** SetLineWidth ******************/
		/**** md5 signature: b8f442f2ffcdc567b7bd62c5c4cdd45f ****/
		%feature("compactdefaultargs") SetLineWidth;
		%feature("autodoc", "Sets width of line for rubber band presentation.

Parameters
----------
theWidth: float

Returns
-------
None
") SetLineWidth;
		void SetLineWidth(const Standard_Real theWidth);

		/****************** SetPolygonClosed ******************/
		/**** md5 signature: e051ee25b6bcca4aadc4fd8abe7e174a ****/
		%feature("compactdefaultargs") SetPolygonClosed;
		%feature("autodoc", "Automatically create an additional line connecting the first and the last screen points to close the boundary polyline.

Parameters
----------
theIsPolygonClosed: bool

Returns
-------
None
") SetPolygonClosed;
		void SetPolygonClosed(Standard_Boolean theIsPolygonClosed);

		/****************** SetRectangle ******************/
		/**** md5 signature: a10c4a7ba9e0ff374fd3fd9a26e1088a ****/
		%feature("compactdefaultargs") SetRectangle;
		%feature("autodoc", "Sets rectangle bounds.

Parameters
----------
theMinX: int
theMinY: int
theMaxX: int
theMaxY: int

Returns
-------
None
") SetRectangle;
		void SetRectangle(const Standard_Integer theMinX, const Standard_Integer theMinY, const Standard_Integer theMaxX, const Standard_Integer theMaxY);

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
		/****************** AIS_Shape ******************/
		/**** md5 signature: 676def0e267dd9cfd41b78bdeb64a3a6 ****/
		%feature("compactdefaultargs") AIS_Shape;
		%feature("autodoc", "Initializes construction of the shape shap from wires, edges and vertices.

Parameters
----------
shap: TopoDS_Shape

Returns
-------
None
") AIS_Shape;
		 AIS_Shape(const TopoDS_Shape & shap);

		/****************** AcceptDisplayMode ******************/
		/**** md5 signature: 4c81f1c2cfc05fd196e1c09a383a3455 ****/
		%feature("compactdefaultargs") AcceptDisplayMode;
		%feature("autodoc", "Return true if specified display mode is supported.

Parameters
----------
theMode: int

Returns
-------
bool
") AcceptDisplayMode;
		virtual Standard_Boolean AcceptDisplayMode(const Standard_Integer theMode);

		/****************** AcceptShapeDecomposition ******************/
		/**** md5 signature: 9203a7c0dd9eda460f91938a68e9d24e ****/
		%feature("compactdefaultargs") AcceptShapeDecomposition;
		%feature("autodoc", "Returns true if the interactive object accepts shape decomposition.

Returns
-------
bool
") AcceptShapeDecomposition;
		virtual Standard_Boolean AcceptShapeDecomposition();

		/****************** BoundingBox ******************/
		/**** md5 signature: c5ba355b93437b89fc95a23246eabd6a ****/
		%feature("compactdefaultargs") BoundingBox;
		%feature("autodoc", "Constructs a bounding box with which to reconstruct compound topological shapes for presentation.

Returns
-------
Bnd_Box
") BoundingBox;
		virtual const Bnd_Box & BoundingBox();

		/****************** Color ******************/
		/**** md5 signature: 1982b45d283b92077c1723466ec20a14 ****/
		%feature("compactdefaultargs") Color;
		%feature("autodoc", "Returns the color attributes of the shape accordingly to the current facing model;.

Parameters
----------
aColor: Quantity_Color

Returns
-------
None
") Color;
		virtual void Color(Quantity_Color & aColor);

		/****************** Material ******************/
		/**** md5 signature: bd49ae260cc3f6209d9618dfc722ced2 ****/
		%feature("compactdefaultargs") Material;
		%feature("autodoc", "Returns the nameofmaterial attributes of the shape accordingly to the current facing model;.

Returns
-------
Graphic3d_NameOfMaterial
") Material;
		virtual Graphic3d_NameOfMaterial Material();

		/****************** OwnDeviationAngle ******************/
		/**** md5 signature: 40e9067bc6e61f75e42a502bd518a070 ****/
		%feature("compactdefaultargs") OwnDeviationAngle;
		%feature("autodoc", "Returns true and the values of the deviation angle anangle and the previous deviation angle apreviousangle. if these values are not already set, false is returned.

Parameters
----------

Returns
-------
anAngle: float
aPreviousAngle: float
") OwnDeviationAngle;
		Standard_Boolean OwnDeviationAngle(Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** OwnDeviationCoefficient ******************/
		/**** md5 signature: 37b33b79d8eb25faa0a3dd31519d110a ****/
		%feature("compactdefaultargs") OwnDeviationCoefficient;
		%feature("autodoc", "Returns true and the values of the deviation coefficient acoefficient and the previous deviation coefficient apreviouscoefficient. if these values are not already set, false is returned.

Parameters
----------

Returns
-------
aCoefficient: float
aPreviousCoefficient: float
") OwnDeviationCoefficient;
		Standard_Boolean OwnDeviationCoefficient(Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** OwnHLRDeviationAngle ******************/
		/**** md5 signature: 38d3ddc4bfa9baad4ece431087592030 ****/
		%feature("compactdefaultargs") OwnHLRDeviationAngle;
		%feature("autodoc", "Returns true and the values of the hlr deviation angle anangle and of the previous hlr deviation angle apreviousangle. if these values are not already set, false is returned.

Parameters
----------

Returns
-------
anAngle: float
aPreviousAngle: float
") OwnHLRDeviationAngle;
		Standard_Boolean OwnHLRDeviationAngle(Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** OwnHLRDeviationCoefficient ******************/
		/**** md5 signature: 2f0005f52d24b0972257fbdc1547cafd ****/
		%feature("compactdefaultargs") OwnHLRDeviationCoefficient;
		%feature("autodoc", "Returns true and the values of the hlr deviation coefficient acoefficient and the previous hlr deviation coefficient apreviouscoefficient. if these values are not already set, false is returned.

Parameters
----------

Returns
-------
aCoefficient: float
aPreviousCoefficient: float
") OwnHLRDeviationCoefficient;
		Standard_Boolean OwnHLRDeviationCoefficient(Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** SelectionMode ******************/
		/**** md5 signature: 4a947460fc181fe83e633a9f49d508dd ****/
		%feature("compactdefaultargs") SelectionMode;
		%feature("autodoc", "Return selection mode for specified shape type.

Parameters
----------
theShapeType: TopAbs_ShapeEnum

Returns
-------
int
") SelectionMode;
		static Standard_Integer SelectionMode(const TopAbs_ShapeEnum theShapeType);

		/****************** SelectionType ******************/
		/**** md5 signature: 3418b538998473b7ebfd408f8153924e ****/
		%feature("compactdefaultargs") SelectionType;
		%feature("autodoc", "Return shape type for specified selection mode.

Parameters
----------
theSelMode: int

Returns
-------
TopAbs_ShapeEnum
") SelectionType;
		static TopAbs_ShapeEnum SelectionType(const Standard_Integer theSelMode);

		/****************** Set ******************/
		/**** md5 signature: 51503ed05940c30aefe5458efb0529e5 ****/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "Alias for ::setshape().

Parameters
----------
theShape: TopoDS_Shape

Returns
-------
None
") Set;
		void Set(const TopoDS_Shape & theShape);

		/****************** SetAngleAndDeviation ******************/
		/**** md5 signature: 3f26a06c2a928474bccaea0ef6a5a4cd ****/
		%feature("compactdefaultargs") SetAngleAndDeviation;
		%feature("autodoc", "This compute a new angle and deviation from the value anangle and set the values stored in mydrawer with these that become local to the shape.

Parameters
----------
anAngle: float

Returns
-------
None
") SetAngleAndDeviation;
		void SetAngleAndDeviation(const Standard_Real anAngle);

		/****************** SetColor ******************/
		/**** md5 signature: 259272248bacb2cef242adbc667f0ef9 ****/
		%feature("compactdefaultargs") SetColor;
		%feature("autodoc", "Sets the color acolor in the reconstructed compound shape. acts via the drawer methods below on the appearance of: - free boundaries: prs3d_drawer_freeboundaryaspect, - isos: prs3d_drawer_uisoaspect, prs3ddrawer_visoaspect, - shared boundaries: prs3d_drawer_unfreeboundaryaspect, - shading: prs3d_drawer_shadingaspect, - visible line color in hidden line mode: prs3d_drawer_seenlineaspect - hidden line color in hidden line mode: prs3d_drawer_hiddenlineaspect.

Parameters
----------
theColor: Quantity_Color

Returns
-------
None
") SetColor;
		virtual void SetColor(const Quantity_Color & theColor);

		/****************** SetHLRAngleAndDeviation ******************/
		/**** md5 signature: d20685cf4dbc812009da397e4f7b3ed6 ****/
		%feature("compactdefaultargs") SetHLRAngleAndDeviation;
		%feature("autodoc", "This compute a new angle and deviation from the value anangle for hlr and set the values stored in mydrawer for with these that become local to the shape.

Parameters
----------
anAngle: float

Returns
-------
None
") SetHLRAngleAndDeviation;
		void SetHLRAngleAndDeviation(const Standard_Real anAngle);

		/****************** SetMaterial ******************/
		/**** md5 signature: cc1b64cc41c0ecb4b453d96f4996d469 ****/
		%feature("compactdefaultargs") SetMaterial;
		%feature("autodoc", "Allows you to provide settings for the material aname in the reconstructed compound shape.

Parameters
----------
aName: Graphic3d_MaterialAspect

Returns
-------
None
") SetMaterial;
		virtual void SetMaterial(const Graphic3d_MaterialAspect & aName);

		/****************** SetOwnDeviationAngle ******************/
		/**** md5 signature: aec2fb5ac4ce30b0f41b58af1d45999f ****/
		%feature("compactdefaultargs") SetOwnDeviationAngle;
		%feature("autodoc", "Sets a local value for deviation angle for this specific shape.

Returns
-------
bool
") SetOwnDeviationAngle;
		Standard_Boolean SetOwnDeviationAngle();

		/****************** SetOwnDeviationAngle ******************/
		/**** md5 signature: 3061c55552c128f703fa14901147c62a ****/
		%feature("compactdefaultargs") SetOwnDeviationAngle;
		%feature("autodoc", "Sets myowndeviationangle field in prs3d_drawer & recomputes presentation.

Parameters
----------
anAngle: float

Returns
-------
None
") SetOwnDeviationAngle;
		void SetOwnDeviationAngle(const Standard_Real anAngle);

		/****************** SetOwnDeviationCoefficient ******************/
		/**** md5 signature: 1c85ce58334056121dacea2a7d566b14 ****/
		%feature("compactdefaultargs") SetOwnDeviationCoefficient;
		%feature("autodoc", "Sets a local value for deviation coefficient for this specific shape.

Returns
-------
bool
") SetOwnDeviationCoefficient;
		Standard_Boolean SetOwnDeviationCoefficient();

		/****************** SetOwnDeviationCoefficient ******************/
		/**** md5 signature: 75d3daa7bdb95da77761e0553fc0712d ****/
		%feature("compactdefaultargs") SetOwnDeviationCoefficient;
		%feature("autodoc", "Sets a local value for deviation coefficient for this specific shape.

Parameters
----------
aCoefficient: float

Returns
-------
None
") SetOwnDeviationCoefficient;
		void SetOwnDeviationCoefficient(const Standard_Real aCoefficient);

		/****************** SetOwnHLRDeviationAngle ******************/
		/**** md5 signature: 928ff97a4af55e5736105254a0a88d52 ****/
		%feature("compactdefaultargs") SetOwnHLRDeviationAngle;
		%feature("autodoc", "Sets a local value for hlr deviation angle for this specific shape.

Returns
-------
bool
") SetOwnHLRDeviationAngle;
		Standard_Boolean SetOwnHLRDeviationAngle();

		/****************** SetOwnHLRDeviationAngle ******************/
		/**** md5 signature: abf5ef44850d12f98d50c2c5d396815b ****/
		%feature("compactdefaultargs") SetOwnHLRDeviationAngle;
		%feature("autodoc", "Sets myownhlrdeviationangle field in prs3d_drawer & recomputes presentation.

Parameters
----------
anAngle: float

Returns
-------
None
") SetOwnHLRDeviationAngle;
		void SetOwnHLRDeviationAngle(const Standard_Real anAngle);

		/****************** SetOwnHLRDeviationCoefficient ******************/
		/**** md5 signature: d9d1197bc5a079287007f7854ea99943 ****/
		%feature("compactdefaultargs") SetOwnHLRDeviationCoefficient;
		%feature("autodoc", "Sets a local value for hlr deviation coefficient for this specific shape.

Returns
-------
bool
") SetOwnHLRDeviationCoefficient;
		Standard_Boolean SetOwnHLRDeviationCoefficient();

		/****************** SetOwnHLRDeviationCoefficient ******************/
		/**** md5 signature: 92afcee69d06f8518bb85c0985669ba0 ****/
		%feature("compactdefaultargs") SetOwnHLRDeviationCoefficient;
		%feature("autodoc", "Sets myownhlrdeviationcoefficient field in prs3d_drawer & recomputes presentation.

Parameters
----------
aCoefficient: float

Returns
-------
None
") SetOwnHLRDeviationCoefficient;
		void SetOwnHLRDeviationCoefficient(const Standard_Real aCoefficient);

		/****************** SetShape ******************/
		/**** md5 signature: 927e2ebe2fb5354dfb3da3c53e512cad ****/
		%feature("compactdefaultargs") SetShape;
		%feature("autodoc", "Constructs an instance of the shape object theshape.

Parameters
----------
theShape: TopoDS_Shape

Returns
-------
None
") SetShape;
		void SetShape(const TopoDS_Shape & theShape);

		/****************** SetTextureOriginUV ******************/
		/**** md5 signature: ef6ae799011e0e64c5951dbb75a0bbf3 ****/
		%feature("compactdefaultargs") SetTextureOriginUV;
		%feature("autodoc", "Use this method to change the origin of the texture. the texel (0,0) will be mapped to the surface (myuvorigin.x(), myuvorigin.y()).

Parameters
----------
theOriginUV: gp_Pnt2d

Returns
-------
None
") SetTextureOriginUV;
		void SetTextureOriginUV(const gp_Pnt2d & theOriginUV);

		/****************** SetTextureRepeatUV ******************/
		/**** md5 signature: 25b37b340fee812ff2a622d745958d59 ****/
		%feature("compactdefaultargs") SetTextureRepeatUV;
		%feature("autodoc", "Sets the number of occurrences of the texture on each face. the texture itself is parameterized in (0,1) by (0,1). each face of the shape to be textured is parameterized in uv space (umin,umax) by (vmin,vmax).

Parameters
----------
theRepeatUV: gp_Pnt2d

Returns
-------
None
") SetTextureRepeatUV;
		void SetTextureRepeatUV(const gp_Pnt2d & theRepeatUV);

		/****************** SetTextureScaleUV ******************/
		/**** md5 signature: ec42ab71903fb0177a6a0aa0ee8187f9 ****/
		%feature("compactdefaultargs") SetTextureScaleUV;
		%feature("autodoc", "Use this method to scale the texture (percent of the face). you can specify a scale factor for both u and v. example: if you set scaleu and scalev to 0.5 and you enable texture repeat, the texture will appear twice on the face in each direction.

Parameters
----------
theScaleUV: gp_Pnt2d

Returns
-------
None
") SetTextureScaleUV;
		void SetTextureScaleUV(const gp_Pnt2d & theScaleUV);

		/****************** SetTransparency ******************/
		/**** md5 signature: 92324fa31dc7752e99539d3b250e4522 ****/
		%feature("compactdefaultargs") SetTransparency;
		%feature("autodoc", "Sets the value avalue for transparency in the reconstructed compound shape.

Parameters
----------
aValue: float,optional
	default value is 0.6

Returns
-------
None
") SetTransparency;
		virtual void SetTransparency(const Standard_Real aValue = 0.6);

		/****************** SetTypeOfHLR ******************/
		/**** md5 signature: f05d013edd687a2ace45302343607b0d ****/
		%feature("compactdefaultargs") SetTypeOfHLR;
		%feature("autodoc", "Sets the type of hlr algorithm used by the shape.

Parameters
----------
theTypeOfHLR: Prs3d_TypeOfHLR

Returns
-------
None
") SetTypeOfHLR;
		void SetTypeOfHLR(const Prs3d_TypeOfHLR theTypeOfHLR);

		/****************** SetWidth ******************/
		/**** md5 signature: e7615096a848f5015090af1e7028d21b ****/
		%feature("compactdefaultargs") SetWidth;
		%feature("autodoc", "Sets the value avalue for line width in the reconstructed compound shape. changes line aspects for lines presentation.

Parameters
----------
aValue: float

Returns
-------
None
") SetWidth;
		virtual void SetWidth(const Standard_Real aValue);

		/****************** Shape ******************/
		/**** md5 signature: 1058569f5d639354fedf11e73741b7df ****/
		%feature("compactdefaultargs") Shape;
		%feature("autodoc", "Returns this shape object.

Returns
-------
TopoDS_Shape
") Shape;
		const TopoDS_Shape Shape();

		/****************** Signature ******************/
		/**** md5 signature: 4e037e01ba764fd5d5261e3d9ba6557d ****/
		%feature("compactdefaultargs") Signature;
		%feature("autodoc", "Returns index 0. this value refers to shape from topabs_shapeenum.

Returns
-------
int
") Signature;
		virtual Standard_Integer Signature();

		/****************** TextureOriginUV ******************/
		/**** md5 signature: c2e574654e7fff1283a776325c9d03eb ****/
		%feature("compactdefaultargs") TextureOriginUV;
		%feature("autodoc", "Return texture origin uv position; (0, 0) by default.

Returns
-------
gp_Pnt2d
") TextureOriginUV;
		const gp_Pnt2d TextureOriginUV();

		/****************** TextureRepeatUV ******************/
		/**** md5 signature: de849df2f2a78aabc5d59235e4643811 ****/
		%feature("compactdefaultargs") TextureRepeatUV;
		%feature("autodoc", "Return texture repeat uv values; (1, 1) by default.

Returns
-------
gp_Pnt2d
") TextureRepeatUV;
		const gp_Pnt2d TextureRepeatUV();

		/****************** TextureScaleUV ******************/
		/**** md5 signature: 4a631ef97f685c7cc9ee0c3ecef81321 ****/
		%feature("compactdefaultargs") TextureScaleUV;
		%feature("autodoc", "Return scale factor for uv coordinates; (1, 1) by default.

Returns
-------
gp_Pnt2d
") TextureScaleUV;
		const gp_Pnt2d TextureScaleUV();

		/****************** Transparency ******************/
		/**** md5 signature: bfa77aad49dcd61a1bc27d8c82087538 ****/
		%feature("compactdefaultargs") Transparency;
		%feature("autodoc", "Returns the transparency attributes of the shape accordingly to the current facing model;.

Returns
-------
float
") Transparency;
		virtual Standard_Real Transparency();

		/****************** Type ******************/
		/**** md5 signature: bf4aea6b24d0b584b57c781f208134ec ****/
		%feature("compactdefaultargs") Type;
		%feature("autodoc", "Returns object as the type of interactive object.

Returns
-------
AIS_KindOfInteractive
") Type;
		virtual AIS_KindOfInteractive Type();

		/****************** TypeOfHLR ******************/
		/**** md5 signature: 6e7597badcbcce7d92e2fcaa7413af66 ****/
		%feature("compactdefaultargs") TypeOfHLR;
		%feature("autodoc", "Gets the type of hlr algorithm.

Returns
-------
Prs3d_TypeOfHLR
") TypeOfHLR;
		Prs3d_TypeOfHLR TypeOfHLR();

		/****************** UnsetColor ******************/
		/**** md5 signature: 2da7e2ed6a63f7c70c36c2a82118a7ec ****/
		%feature("compactdefaultargs") UnsetColor;
		%feature("autodoc", "Removes settings for color in the reconstructed compound shape.

Returns
-------
None
") UnsetColor;
		virtual void UnsetColor();

		/****************** UnsetMaterial ******************/
		/**** md5 signature: 0a051ddc9f5267e24615c6f3dfd30498 ****/
		%feature("compactdefaultargs") UnsetMaterial;
		%feature("autodoc", "Removes settings for material in the reconstructed compound shape.

Returns
-------
None
") UnsetMaterial;
		virtual void UnsetMaterial();

		/****************** UnsetTransparency ******************/
		/**** md5 signature: bdf34ac27dd66c689517e7b105e66cb2 ****/
		%feature("compactdefaultargs") UnsetTransparency;
		%feature("autodoc", "Removes the setting for transparency in the reconstructed compound shape.

Returns
-------
None
") UnsetTransparency;
		virtual void UnsetTransparency();

		/****************** UnsetWidth ******************/
		/**** md5 signature: f4f13d47402fae34af3d548b3b62cf10 ****/
		%feature("compactdefaultargs") UnsetWidth;
		%feature("autodoc", "Removes the setting for line width in the reconstructed compound shape.

Returns
-------
None
") UnsetWidth;
		virtual void UnsetWidth();

		/****************** UserAngle ******************/
		/**** md5 signature: edce4b4e5010ac8160b607ac8192497e ****/
		%feature("compactdefaultargs") UserAngle;
		%feature("autodoc", "Gives back the angle initial value put by the user.

Returns
-------
float
") UserAngle;
		Standard_Real UserAngle();

		/****************** computeHlrPresentation ******************/
		/**** md5 signature: 178fb24d422a7d8711227c75df76a2ed ****/
		%feature("compactdefaultargs") computeHlrPresentation;
		%feature("autodoc", "Compute hlr presentation for specified shape.

Parameters
----------
theProjector: Prs3d_Projector
thePrs: Prs3d_Presentation
theShape: TopoDS_Shape
theDrawer: Prs3d_Drawer

Returns
-------
None
") computeHlrPresentation;
		static void computeHlrPresentation(const opencascade::handle<Prs3d_Projector> & theProjector, const opencascade::handle<Prs3d_Presentation> & thePrs, const TopoDS_Shape & theShape, const opencascade::handle<Prs3d_Drawer> & theDrawer);

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
		/****************** AIS_SignatureFilter ******************/
		/**** md5 signature: 57bfd47e3c0b858781c37970ccb12c16 ****/
		%feature("compactdefaultargs") AIS_SignatureFilter;
		%feature("autodoc", "Initializes the signature filter, adding the signature specification, agivensignature, to that for type, agivenkind, in ais_typefilter.

Parameters
----------
aGivenKind: AIS_KindOfInteractive
aGivenSignature: int

Returns
-------
None
") AIS_SignatureFilter;
		 AIS_SignatureFilter(const AIS_KindOfInteractive aGivenKind, const Standard_Integer aGivenSignature);

		/****************** IsOk ******************/
		/**** md5 signature: 22a33e4e2022519dc44ef8862044fea0 ****/
		%feature("compactdefaultargs") IsOk;
		%feature("autodoc", "Returns false if the transient is not an ais_interactiveobject. returns false if the signature of interactiveobject is not the same as the stored one in the filter...

Parameters
----------
anobj: SelectMgr_EntityOwner

Returns
-------
bool
") IsOk;
		Standard_Boolean IsOk(const opencascade::handle<SelectMgr_EntityOwner> & anobj);

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
		/****************** AIS_TextLabel ******************/
		/**** md5 signature: ea29765f87567cd9f618ee169e658a97 ****/
		%feature("compactdefaultargs") AIS_TextLabel;
		%feature("autodoc", "Default constructor.

Returns
-------
None
") AIS_TextLabel;
		 AIS_TextLabel();

		/****************** HasFlipping ******************/
		/**** md5 signature: e5aa6181c813315a6f4edf94cdb0e9ac ****/
		%feature("compactdefaultargs") HasFlipping;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") HasFlipping;
		Standard_Boolean HasFlipping();

		/****************** HasOrientation3D ******************/
		/**** md5 signature: 32890c1ea6df573c66760af44025329e ****/
		%feature("compactdefaultargs") HasOrientation3D;
		%feature("autodoc", "Returns true if the current text placement mode uses text orientation in the model 3d space.

Returns
-------
bool
") HasOrientation3D;
		Standard_Boolean HasOrientation3D();

		/****************** Orientation3D ******************/
		/**** md5 signature: 59c12b43a793dfc418565149b93d1848 ****/
		%feature("compactdefaultargs") Orientation3D;
		%feature("autodoc", "Returns label orientation in the model 3d space.

Returns
-------
gp_Ax2
") Orientation3D;
		const gp_Ax2 Orientation3D();

		/****************** Position ******************/
		/**** md5 signature: b397668de8ab55c0ba7dba3385ed76d0 ****/
		%feature("compactdefaultargs") Position;
		%feature("autodoc", "Returns position.

Returns
-------
gp_Pnt
") Position;
		const gp_Pnt Position();

		/****************** SetAngle ******************/
		/**** md5 signature: dd6cdd7e9c31b2b6461d8a3e1df2d0ba ****/
		%feature("compactdefaultargs") SetAngle;
		%feature("autodoc", "Setup angle.

Parameters
----------
theAngle: float

Returns
-------
None
") SetAngle;
		void SetAngle(const Standard_Real theAngle);

		/****************** SetColor ******************/
		/**** md5 signature: 259272248bacb2cef242adbc667f0ef9 ****/
		%feature("compactdefaultargs") SetColor;
		%feature("autodoc", "Setup color of entire text.

Parameters
----------
theColor: Quantity_Color

Returns
-------
None
") SetColor;
		virtual void SetColor(const Quantity_Color & theColor);

		/****************** SetColorSubTitle ******************/
		/**** md5 signature: 86b27f31504d545b35f6d527a8614032 ****/
		%feature("compactdefaultargs") SetColorSubTitle;
		%feature("autodoc", "Modifies the colour of the subtitle for the todt_subtitle textdisplaytype and the colour of backgroubd for the todt_dekale textdisplaytype.

Parameters
----------
theColor: Quantity_Color

Returns
-------
None
") SetColorSubTitle;
		void SetColorSubTitle(const Quantity_Color & theColor);

		/****************** SetDisplayType ******************/
		/**** md5 signature: 841f090e5b526ffb97840b2c0b5ccf62 ****/
		%feature("compactdefaultargs") SetDisplayType;
		%feature("autodoc", "Define the display type of the text. //! todt_normal default display. text only. todt_subtitle there is a subtitle under the text. todt_dekale the text is displayed with a 3d style. todt_blend the text is displayed in xor. todt_dimension dimension line under text will be invisible.

Parameters
----------
theDisplayType: Aspect_TypeOfDisplayText

Returns
-------
None
") SetDisplayType;
		void SetDisplayType(const Aspect_TypeOfDisplayText theDisplayType);

		/****************** SetFlipping ******************/
		/**** md5 signature: 63ae61d2bbfa473697ae5bde51aa1b85 ****/
		%feature("compactdefaultargs") SetFlipping;
		%feature("autodoc", "No available documentation.

Parameters
----------
theIsFlipping: bool

Returns
-------
None
") SetFlipping;
		void SetFlipping(const Standard_Boolean theIsFlipping);

		/****************** SetFont ******************/
		/**** md5 signature: d9bf22282bf38a81d5b21c8bf460eabf ****/
		%feature("compactdefaultargs") SetFont;
		%feature("autodoc", "Setup font.

Parameters
----------
theFont: char *

Returns
-------
None
") SetFont;
		void SetFont(const char * theFont);

		/****************** SetFontAspect ******************/
		/**** md5 signature: 5c2494c796ae98d97b009a2fec1f0d8d ****/
		%feature("compactdefaultargs") SetFontAspect;
		%feature("autodoc", "Setup font aspect.

Parameters
----------
theFontAspect: Font_FontAspect

Returns
-------
None
") SetFontAspect;
		void SetFontAspect(const Font_FontAspect theFontAspect);

		/****************** SetHJustification ******************/
		/**** md5 signature: 222b316fbe2b20961d17c752ca22f482 ****/
		%feature("compactdefaultargs") SetHJustification;
		%feature("autodoc", "Setup horizontal justification.

Parameters
----------
theHJust: Graphic3d_HorizontalTextAlignment

Returns
-------
None
") SetHJustification;
		void SetHJustification(const Graphic3d_HorizontalTextAlignment theHJust);

		/****************** SetHeight ******************/
		/**** md5 signature: 805878ad5815242d668f44db87535707 ****/
		%feature("compactdefaultargs") SetHeight;
		%feature("autodoc", "Setup height.

Parameters
----------
theHeight: float

Returns
-------
None
") SetHeight;
		void SetHeight(const Standard_Real theHeight);

		/****************** SetMaterial ******************/
		/**** md5 signature: 66ca7d2e5ce9f246d7fa85fd0d49ef24 ****/
		%feature("compactdefaultargs") SetMaterial;
		%feature("autodoc", "Material has no effect for text label.

Parameters
----------
&: Graphic3d_MaterialAspect

Returns
-------
None
") SetMaterial;
		virtual void SetMaterial(const Graphic3d_MaterialAspect &);

		/****************** SetOrientation3D ******************/
		/**** md5 signature: 495ee926ccc07e7eec3f148e71ebe0e0 ****/
		%feature("compactdefaultargs") SetOrientation3D;
		%feature("autodoc", "Setup label orientation in the model 3d space.

Parameters
----------
theOrientation: gp_Ax2

Returns
-------
None
") SetOrientation3D;
		void SetOrientation3D(const gp_Ax2 & theOrientation);

		/****************** SetPosition ******************/
		/**** md5 signature: 6cd7cdcecb59ee7f74eb9c342f464f4d ****/
		%feature("compactdefaultargs") SetPosition;
		%feature("autodoc", "Setup position.

Parameters
----------
thePosition: gp_Pnt

Returns
-------
None
") SetPosition;
		void SetPosition(const gp_Pnt & thePosition);

		/****************** SetText ******************/
		/**** md5 signature: 4a1b137668607e74e5fd1c9c0ecf6bb3 ****/
		%feature("compactdefaultargs") SetText;
		%feature("autodoc", "Setup text.

Parameters
----------
theText: TCollection_ExtendedString

Returns
-------
None
") SetText;
		void SetText(const TCollection_ExtendedString & theText);

		/****************** SetTransparency ******************/
		/**** md5 signature: ba76d0fd3455858ee750a8806e400e81 ****/
		%feature("compactdefaultargs") SetTransparency;
		%feature("autodoc", "Setup transparency within [0, 1] range.

Parameters
----------
theValue: float

Returns
-------
None
") SetTransparency;
		virtual void SetTransparency(const Standard_Real theValue);

		/****************** SetVJustification ******************/
		/**** md5 signature: 74811ea56e21f5af22a1b17013352e38 ****/
		%feature("compactdefaultargs") SetVJustification;
		%feature("autodoc", "Setup vertical justification.

Parameters
----------
theVJust: Graphic3d_VerticalTextAlignment

Returns
-------
None
") SetVJustification;
		void SetVJustification(const Graphic3d_VerticalTextAlignment theVJust);

		/****************** SetZoomable ******************/
		/**** md5 signature: f87b964084e353bb6b380aea2cc4a4d0 ****/
		%feature("compactdefaultargs") SetZoomable;
		%feature("autodoc", "Setup zoomable property.

Parameters
----------
theIsZoomable: bool

Returns
-------
None
") SetZoomable;
		void SetZoomable(const Standard_Boolean theIsZoomable);

		/****************** UnsetOrientation3D ******************/
		/**** md5 signature: 493fe411e83a69dc26417de323100db9 ****/
		%feature("compactdefaultargs") UnsetOrientation3D;
		%feature("autodoc", "Reset label orientation in the model 3d space.

Returns
-------
None
") UnsetOrientation3D;
		void UnsetOrientation3D();

		/****************** UnsetTransparency ******************/
		/**** md5 signature: d5dc50ef874a9e0fcbfa62da4cd73b8f ****/
		%feature("compactdefaultargs") UnsetTransparency;
		%feature("autodoc", "Removes the transparency setting.

Returns
-------
None
") UnsetTransparency;
		virtual void UnsetTransparency();

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
		/****************** AIS_Triangulation ******************/
		/**** md5 signature: b1f39d13206b79ed4e26675482c469c3 ****/
		%feature("compactdefaultargs") AIS_Triangulation;
		%feature("autodoc", "Constructs the triangulation display object.

Parameters
----------
aTriangulation: Poly_Triangulation

Returns
-------
None
") AIS_Triangulation;
		 AIS_Triangulation(const opencascade::handle<Poly_Triangulation> & aTriangulation);

		/****************** GetColors ******************/
		/**** md5 signature: 02261cc1c013e697d82f9d79c04e76d7 ****/
		%feature("compactdefaultargs") GetColors;
		%feature("autodoc", "Get the color for each node. each 32-bit color is alpha << 24 + blue << 16 + green << 8 + red.

Returns
-------
opencascade::handle<TColStd_HArray1OfInteger>
") GetColors;
		opencascade::handle<TColStd_HArray1OfInteger> GetColors();

		/****************** GetTriangulation ******************/
		/**** md5 signature: 43bd327b5645ba0da5653a0bd81a9f5b ****/
		%feature("compactdefaultargs") GetTriangulation;
		%feature("autodoc", "Returns poly_triangulation .

Returns
-------
opencascade::handle<Poly_Triangulation>
") GetTriangulation;
		opencascade::handle<Poly_Triangulation> GetTriangulation();

		/****************** HasVertexColors ******************/
		/**** md5 signature: fa868ff9e1fa2eafb8056b01f75d6453 ****/
		%feature("compactdefaultargs") HasVertexColors;
		%feature("autodoc", "Returns true if triangulation has vertex colors.

Returns
-------
bool
") HasVertexColors;
		Standard_Boolean HasVertexColors();

		/****************** SetColors ******************/
		/**** md5 signature: 0a92a5615736d146ffd88ca378dd2d45 ****/
		%feature("compactdefaultargs") SetColors;
		%feature("autodoc", "Set the color for each node. each 32-bit color is alpha << 24 + blue << 16 + green << 8 + red order of color components is essential for further usage by opengl.

Parameters
----------
aColor: TColStd_HArray1OfInteger

Returns
-------
None
") SetColors;
		void SetColors(const opencascade::handle<TColStd_HArray1OfInteger> & aColor);

		/****************** SetTransparency ******************/
		/**** md5 signature: 92324fa31dc7752e99539d3b250e4522 ****/
		%feature("compactdefaultargs") SetTransparency;
		%feature("autodoc", "Sets the value avalue for transparency in the reconstructed compound shape.

Parameters
----------
aValue: float,optional
	default value is 0.6

Returns
-------
None
") SetTransparency;
		virtual void SetTransparency(const Standard_Real aValue = 0.6);

		/****************** SetTriangulation ******************/
		/**** md5 signature: 5958e531c24aa9ebf5d35ea3895b63dd ****/
		%feature("compactdefaultargs") SetTriangulation;
		%feature("autodoc", "No available documentation.

Parameters
----------
aTriangulation: Poly_Triangulation

Returns
-------
None
") SetTriangulation;
		void SetTriangulation(const opencascade::handle<Poly_Triangulation> & aTriangulation);

		/****************** UnsetTransparency ******************/
		/**** md5 signature: bdf34ac27dd66c689517e7b105e66cb2 ****/
		%feature("compactdefaultargs") UnsetTransparency;
		%feature("autodoc", "Removes the setting for transparency in the reconstructed compound shape.

Returns
-------
None
") UnsetTransparency;
		virtual void UnsetTransparency();

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
		/****************** AIS_Trihedron ******************/
		/**** md5 signature: 7abadf81ecefbae170558dec5a045471 ****/
		%feature("compactdefaultargs") AIS_Trihedron;
		%feature("autodoc", "Initializes a trihedron entity.

Parameters
----------
theComponent: Geom_Axis2Placement

Returns
-------
None
") AIS_Trihedron;
		 AIS_Trihedron(const opencascade::handle<Geom_Axis2Placement> & theComponent);

		/****************** AcceptDisplayMode ******************/
		/**** md5 signature: 4c81f1c2cfc05fd196e1c09a383a3455 ****/
		%feature("compactdefaultargs") AcceptDisplayMode;
		%feature("autodoc", "Returns true if the display mode selected, amode, is valid for trihedron datums.

Parameters
----------
theMode: int

Returns
-------
bool
") AcceptDisplayMode;
		virtual Standard_Boolean AcceptDisplayMode(const Standard_Integer theMode);

		/****************** ArrowColor ******************/
		/**** md5 signature: 4fc33e4156a708bf068aa14dcdd1f4ea ****/
		%feature("compactdefaultargs") ArrowColor;
		%feature("autodoc", "Returns trihedron arrow color.

Returns
-------
Quantity_Color
") ArrowColor;
		Quantity_Color ArrowColor();

		/****************** ClearSelected ******************/
		/**** md5 signature: 3aaae3eac8509b6abfc3ffd58cbe26e1 ****/
		%feature("compactdefaultargs") ClearSelected;
		%feature("autodoc", "Method which clear all selected owners belonging to this selectable object ( for fast presentation draw ).

Returns
-------
None
") ClearSelected;
		virtual void ClearSelected();

		/****************** Component ******************/
		/**** md5 signature: 1234d8906c95cc001e4c962cd9c4933b ****/
		%feature("compactdefaultargs") Component;
		%feature("autodoc", "Returns the right-handed coordinate system set in setcomponent.

Returns
-------
opencascade::handle<Geom_Axis2Placement>
") Component;
		const opencascade::handle<Geom_Axis2Placement> & Component();

		/****************** DatumDisplayMode ******************/
		/**** md5 signature: 85349bc7830d85b4d93f109c8361b6bf ****/
		%feature("compactdefaultargs") DatumDisplayMode;
		%feature("autodoc", "Returns datum display mode.

Returns
-------
Prs3d_DatumMode
") DatumDisplayMode;
		Prs3d_DatumMode DatumDisplayMode();

		/****************** DatumPartColor ******************/
		/**** md5 signature: 6085d0ed60102d6ed078723a4a105a8f ****/
		%feature("compactdefaultargs") DatumPartColor;
		%feature("autodoc", "Returns color of datum part: origin or some of trihedron axes.

Parameters
----------
thePart: Prs3d_DatumParts

Returns
-------
Quantity_Color
") DatumPartColor;
		Quantity_Color DatumPartColor(Prs3d_DatumParts thePart);

		/****************** HasArrowColor ******************/
		/**** md5 signature: 752dadd6593a80c09907199cd16ef4e8 ****/
		%feature("compactdefaultargs") HasArrowColor;
		%feature("autodoc", "Returns true if trihedron has own arrow color.

Returns
-------
bool
") HasArrowColor;
		Standard_Boolean HasArrowColor();

		/****************** HasOwnSize ******************/
		/**** md5 signature: e915e28bcd0aa89fd85e56d0cb0fab71 ****/
		%feature("compactdefaultargs") HasOwnSize;
		%feature("autodoc", "Returns true if the trihedron object has a size other than the default size of 100 mm. along each axis.

Returns
-------
bool
") HasOwnSize;
		Standard_Boolean HasOwnSize();

		/****************** HasTextColor ******************/
		/**** md5 signature: cace4b0f1dd5ef05d295a303f4b6e82b ****/
		%feature("compactdefaultargs") HasTextColor;
		%feature("autodoc", "Returns true if trihedron has own text color.

Returns
-------
bool
") HasTextColor;
		Standard_Boolean HasTextColor();

		/****************** HilightOwnerWithColor ******************/
		/**** md5 signature: 59e159c706312ffbc3fbab59d0e52b8c ****/
		%feature("compactdefaultargs") HilightOwnerWithColor;
		%feature("autodoc", "Method which hilight an owner belonging to this selectable object ( for fast presentation draw ).

Parameters
----------
thePM: PrsMgr_PresentationManager3d
theStyle: Prs3d_Drawer
theOwner: SelectMgr_EntityOwner

Returns
-------
None
") HilightOwnerWithColor;
		virtual void HilightOwnerWithColor(const opencascade::handle<PrsMgr_PresentationManager3d> & thePM, const opencascade::handle<Prs3d_Drawer> & theStyle, const opencascade::handle<SelectMgr_EntityOwner> & theOwner);

		/****************** HilightSelected ******************/
		/**** md5 signature: bf8a0c8dc2d6626609da91792dd9d611 ****/
		%feature("compactdefaultargs") HilightSelected;
		%feature("autodoc", "Method which draws selected owners ( for fast presentation draw ).

Parameters
----------
thePM: PrsMgr_PresentationManager3d
theOwners: SelectMgr_SequenceOfOwner

Returns
-------
None
") HilightSelected;
		virtual void HilightSelected(const opencascade::handle<PrsMgr_PresentationManager3d> & thePM, const SelectMgr_SequenceOfOwner & theOwners);

		/****************** IsAutoHilight ******************/
		/**** md5 signature: d08251e65bb2038174f4c2dab73d34c9 ****/
		%feature("compactdefaultargs") IsAutoHilight;
		%feature("autodoc", "Disables auto highlighting to use hilightselected() and hilightownerwithcolor() overridden methods.

Returns
-------
bool
") IsAutoHilight;
		virtual Standard_Boolean IsAutoHilight();

		/****************** Label ******************/
		/**** md5 signature: cd3b87f754f01f91f4db0b402e5a6620 ****/
		%feature("compactdefaultargs") Label;
		%feature("autodoc", "Returns text of axis. parameter thepart should be xaxis, yaxis or zaxis.

Parameters
----------
thePart: Prs3d_DatumParts

Returns
-------
TCollection_ExtendedString
") Label;
		const TCollection_ExtendedString & Label(Prs3d_DatumParts thePart);

		/****************** SelectionPriority ******************/
		/**** md5 signature: c7f76247dd6ec404acc1afff52e95917 ****/
		%feature("compactdefaultargs") SelectionPriority;
		%feature("autodoc", "Sets priority of selection for owner of the given type.

Parameters
----------
thePart: Prs3d_DatumParts

Returns
-------
int
") SelectionPriority;
		Standard_Integer SelectionPriority(Prs3d_DatumParts thePart);

		/****************** SetArrowColor ******************/
		/**** md5 signature: b033462aa3dce4543ee90b2ffdc498cd ****/
		%feature("compactdefaultargs") SetArrowColor;
		%feature("autodoc", "Sets color of arrow of trihedron axes. used only in wireframe mode.

Parameters
----------
theColor: Quantity_Color

Returns
-------
None
") SetArrowColor;
		void SetArrowColor(const Quantity_Color & theColor);

		/****************** SetAxisColor ******************/
		/**** md5 signature: 5414b36e056312b5d2ce5a3255bab6e0 ****/
		%feature("compactdefaultargs") SetAxisColor;
		%feature("autodoc", "Sets color of z-axis. //standard_deprecated('this method is deprecated - setcolor() should be called instead').

Parameters
----------
theColor: Quantity_Color

Returns
-------
None
") SetAxisColor;
		void SetAxisColor(const Quantity_Color & theColor);

		/****************** SetColor ******************/
		/**** md5 signature: 7e02f3e04e30cfab690f414e5d7614ca ****/
		%feature("compactdefaultargs") SetColor;
		%feature("autodoc", "Sets the color thecolor for this trihedron object, it changes color of axes.

Parameters
----------
theColor: Quantity_Color

Returns
-------
None
") SetColor;
		void SetColor(const Quantity_Color & theColor);

		/****************** SetComponent ******************/
		/**** md5 signature: 0cb02d582043f1733c1764c1c909a674 ****/
		%feature("compactdefaultargs") SetComponent;
		%feature("autodoc", "Constructs the right-handed coordinate system acomponent.

Parameters
----------
theComponent: Geom_Axis2Placement

Returns
-------
None
") SetComponent;
		void SetComponent(const opencascade::handle<Geom_Axis2Placement> & theComponent);

		/****************** SetDatumDisplayMode ******************/
		/**** md5 signature: 9f6d65070e9826102aec9979c024ba74 ****/
		%feature("compactdefaultargs") SetDatumDisplayMode;
		%feature("autodoc", "Sets shading or wireframe display mode, triangle or segment graphic group is used relatively.

Parameters
----------
theMode: Prs3d_DatumMode

Returns
-------
None
") SetDatumDisplayMode;
		void SetDatumDisplayMode(Prs3d_DatumMode theMode);

		/****************** SetDatumPartColor ******************/
		/**** md5 signature: bac1c795a4dc41baab0e0761fbd4adfa ****/
		%feature("compactdefaultargs") SetDatumPartColor;
		%feature("autodoc", "Sets color of datum part: origin or some of trihedron axes. if presentation is shading mode, this color is set for both sides of facing model.

Parameters
----------
thePart: Prs3d_DatumParts
theColor: Quantity_Color

Returns
-------
None
") SetDatumPartColor;
		void SetDatumPartColor(const Prs3d_DatumParts thePart, const Quantity_Color & theColor);

		/****************** SetDrawArrows ******************/
		/**** md5 signature: fb1a2bd859e154964e1a124af5e1fb01 ****/
		%feature("compactdefaultargs") SetDrawArrows;
		%feature("autodoc", "Sets whether to draw the arrows in visualization.

Parameters
----------
theToDraw: bool

Returns
-------
None
") SetDrawArrows;
		void SetDrawArrows(const Standard_Boolean theToDraw);

		/****************** SetLabel ******************/
		/**** md5 signature: 849b28153ab6d0762b12767c5f379ce7 ****/
		%feature("compactdefaultargs") SetLabel;
		%feature("autodoc", "Sets text label for trihedron axis. parameter thepart should be xaxis, yaxis or zaxis.

Parameters
----------
thePart: Prs3d_DatumParts
thePriority: TCollection_ExtendedString

Returns
-------
None
") SetLabel;
		void SetLabel(const Prs3d_DatumParts thePart, const TCollection_ExtendedString & thePriority);

		/****************** SetOriginColor ******************/
		/**** md5 signature: 1017d076464e72d0a5e64feb3baf458f ****/
		%feature("compactdefaultargs") SetOriginColor;
		%feature("autodoc", "Sets color of origin. //standard_deprecated('this method is deprecated - setcolor() should be called instead').

Parameters
----------
theColor: Quantity_Color

Returns
-------
None
") SetOriginColor;
		void SetOriginColor(const Quantity_Color & theColor);

		/****************** SetSelectionPriority ******************/
		/**** md5 signature: a3572d43d4d834b85a5686dc7ffb301b ****/
		%feature("compactdefaultargs") SetSelectionPriority;
		%feature("autodoc", "Sets priority of selection for owner of the given type.

Parameters
----------
thePart: Prs3d_DatumParts
thePriority: int

Returns
-------
None
") SetSelectionPriority;
		void SetSelectionPriority(Prs3d_DatumParts thePart, Standard_Integer thePriority);

		/****************** SetSize ******************/
		/**** md5 signature: 4ddd2387ee49354c88a5763d724abf32 ****/
		%feature("compactdefaultargs") SetSize;
		%feature("autodoc", "Sets the size avalue for the trihedron object. the default value is 100 mm.

Parameters
----------
theValue: float

Returns
-------
None
") SetSize;
		void SetSize(const Standard_Real theValue);

		/****************** SetTextColor ******************/
		/**** md5 signature: c4c1e2b86d1c9f306c0090e96309e623 ****/
		%feature("compactdefaultargs") SetTextColor;
		%feature("autodoc", "Sets color of label of trihedron axes.

Parameters
----------
theColor: Quantity_Color

Returns
-------
None
") SetTextColor;
		void SetTextColor(const Quantity_Color & theColor);

		/****************** SetXAxisColor ******************/
		/**** md5 signature: ed9ab965e65191191a7681d47d2ec159 ****/
		%feature("compactdefaultargs") SetXAxisColor;
		%feature("autodoc", "Sets color of x-axis. //standard_deprecated('this method is deprecated - setcolor() should be called instead').

Parameters
----------
theColor: Quantity_Color

Returns
-------
None
") SetXAxisColor;
		void SetXAxisColor(const Quantity_Color & theColor);

		/****************** SetYAxisColor ******************/
		/**** md5 signature: 3d9f763d5f18d448930e3a455d43081f ****/
		%feature("compactdefaultargs") SetYAxisColor;
		%feature("autodoc", "Sets color of y-axis. //standard_deprecated('this method is deprecated - setcolor() should be called instead').

Parameters
----------
theColor: Quantity_Color

Returns
-------
None
") SetYAxisColor;
		void SetYAxisColor(const Quantity_Color & theColor);

		/****************** Signature ******************/
		/**** md5 signature: 4e037e01ba764fd5d5261e3d9ba6557d ****/
		%feature("compactdefaultargs") Signature;
		%feature("autodoc", "Returns index 3, selection of the planes xoy, yoz, xoz.

Returns
-------
int
") Signature;
		virtual Standard_Integer Signature();

		/****************** Size ******************/
		/**** md5 signature: a8e9905382c3964d697ee929ccdb9562 ****/
		%feature("compactdefaultargs") Size;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") Size;
		Standard_Real Size();

		/****************** TextColor ******************/
		/**** md5 signature: 44826bd1a0a47517f0715e047eb767ed ****/
		%feature("compactdefaultargs") TextColor;
		%feature("autodoc", "Returns trihedron text color.

Returns
-------
Quantity_Color
") TextColor;
		Quantity_Color TextColor();

		/****************** ToDrawArrows ******************/
		/**** md5 signature: d43d54fb812974eaf7cf90303f961bff ****/
		%feature("compactdefaultargs") ToDrawArrows;
		%feature("autodoc", "Returns true if arrows are to be drawn.

Returns
-------
bool
") ToDrawArrows;
		Standard_Boolean ToDrawArrows();

		/****************** Type ******************/
		/**** md5 signature: bf4aea6b24d0b584b57c781f208134ec ****/
		%feature("compactdefaultargs") Type;
		%feature("autodoc", "Indicates that the type of interactive object is datum.

Returns
-------
AIS_KindOfInteractive
") Type;
		virtual AIS_KindOfInteractive Type();

		/****************** UnsetColor ******************/
		/**** md5 signature: 2da7e2ed6a63f7c70c36c2a82118a7ec ****/
		%feature("compactdefaultargs") UnsetColor;
		%feature("autodoc", "Removes the settings for color.

Returns
-------
None
") UnsetColor;
		virtual void UnsetColor();

		/****************** UnsetSize ******************/
		/**** md5 signature: 01e2703c873bbcb3ae46d4b247bdacb6 ****/
		%feature("compactdefaultargs") UnsetSize;
		%feature("autodoc", "Removes any non-default settings for size of this trihedron object. if the object has 1 color, the default size of the drawer is reproduced, otherwise datumaspect becomes null.

Returns
-------
None
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
		class IntegerHasher {};
		/****************** AIS_ViewCube ******************/
		/**** md5 signature: 582207f6972f9893779647b1bc5ed072 ****/
		%feature("compactdefaultargs") AIS_ViewCube;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") AIS_ViewCube;
		 AIS_ViewCube();

		/****************** AcceptDisplayMode ******************/
		/**** md5 signature: 4c81f1c2cfc05fd196e1c09a383a3455 ****/
		%feature("compactdefaultargs") AcceptDisplayMode;
		%feature("autodoc", "Return true for supported display mode.

Parameters
----------
theMode: int

Returns
-------
bool
") AcceptDisplayMode;
		virtual Standard_Boolean AcceptDisplayMode(const Standard_Integer theMode);

		/****************** AxesPadding ******************/
		/**** md5 signature: c7cf9c49ac3b2ff7007839a7a4e35f25 ****/
		%feature("compactdefaultargs") AxesPadding;
		%feature("autodoc", "Return padding between axes and 3d part (box); 10 by default.

Returns
-------
float
") AxesPadding;
		Standard_Real AxesPadding();

		/****************** AxisLabel ******************/
		/**** md5 signature: 5de552dbd8b43895a1c56ff8429a7ff8 ****/
		%feature("compactdefaultargs") AxisLabel;
		%feature("autodoc", "Return axes labels or empty string if undefined. default labels: x, y, z.

Parameters
----------
theAxis: Prs3d_DatumParts

Returns
-------
TCollection_AsciiString
") AxisLabel;
		TCollection_AsciiString AxisLabel(Prs3d_DatumParts theAxis);

		/****************** BoxColor ******************/
		/**** md5 signature: 50e147884653441e4200c687eaac0698 ****/
		%feature("compactdefaultargs") BoxColor;
		%feature("autodoc", "Return value of front color for the 3d part of object.

Returns
-------
Quantity_Color
") BoxColor;
		const Quantity_Color & BoxColor();

		/****************** BoxCornerMinSize ******************/
		/**** md5 signature: cafaf934eb4662e014c49d3919a5ce75 ****/
		%feature("compactdefaultargs") BoxCornerMinSize;
		%feature("autodoc", "Return minimal size of box corner; 2 by default.

Returns
-------
float
") BoxCornerMinSize;
		Standard_Real BoxCornerMinSize();

		/****************** BoxCornerStyle ******************/
		/**** md5 signature: fd4fc1c3355e14afdded11cd3419cf7a ****/
		%feature("compactdefaultargs") BoxCornerStyle;
		%feature("autodoc", "Return shading style of box corners.

Returns
-------
opencascade::handle<Prs3d_ShadingAspect>
") BoxCornerStyle;
		const opencascade::handle<Prs3d_ShadingAspect> & BoxCornerStyle();

		/****************** BoxEdgeGap ******************/
		/**** md5 signature: 67480960a2f50fb564f93a6c1b577c13 ****/
		%feature("compactdefaultargs") BoxEdgeGap;
		%feature("autodoc", "Return gap between box edges and box sides; 0 by default.

Returns
-------
float
") BoxEdgeGap;
		Standard_Real BoxEdgeGap();

		/****************** BoxEdgeMinSize ******************/
		/**** md5 signature: 9b8c3f97bde852c0a0b85f3805feb5aa ****/
		%feature("compactdefaultargs") BoxEdgeMinSize;
		%feature("autodoc", "Return minimal size of box edge; 2 by default.

Returns
-------
float
") BoxEdgeMinSize;
		Standard_Real BoxEdgeMinSize();

		/****************** BoxEdgeStyle ******************/
		/**** md5 signature: 5e9bce8c10e662a32cada7316ea97356 ****/
		%feature("compactdefaultargs") BoxEdgeStyle;
		%feature("autodoc", "Return shading style of box edges.

Returns
-------
opencascade::handle<Prs3d_ShadingAspect>
") BoxEdgeStyle;
		const opencascade::handle<Prs3d_ShadingAspect> & BoxEdgeStyle();

		/****************** BoxFacetExtension ******************/
		/**** md5 signature: 63868a40e6236808acfc797143f8d7d3 ****/
		%feature("compactdefaultargs") BoxFacetExtension;
		%feature("autodoc", "Return box facet extension to edge/corner facet split; 10 by default.

Returns
-------
float
") BoxFacetExtension;
		Standard_Real BoxFacetExtension();

		/****************** BoxSideLabel ******************/
		/**** md5 signature: a97bf5fe626f7488166a6ec22c6801dd ****/
		%feature("compactdefaultargs") BoxSideLabel;
		%feature("autodoc", "Return box side label or empty string if undefined. default labels: front, back, left, right, top, bottom.

Parameters
----------
theSide: V3d_TypeOfOrientation

Returns
-------
TCollection_AsciiString
") BoxSideLabel;
		TCollection_AsciiString BoxSideLabel(V3d_TypeOfOrientation theSide);

		/****************** BoxSideStyle ******************/
		/**** md5 signature: a46fcc5ed6922015f07f2f9b6adb0b29 ****/
		%feature("compactdefaultargs") BoxSideStyle;
		%feature("autodoc", "Return shading style of box sides.

Returns
-------
opencascade::handle<Prs3d_ShadingAspect>
") BoxSideStyle;
		const opencascade::handle<Prs3d_ShadingAspect> & BoxSideStyle();

		/****************** BoxTransparency ******************/
		/**** md5 signature: 35032e2c2d21ffedb0b966bdeec6d019 ****/
		%feature("compactdefaultargs") BoxTransparency;
		%feature("autodoc", "Return transparency for 3d part of object.

Returns
-------
float
") BoxTransparency;
		Standard_Real BoxTransparency();

		/****************** ClearSelected ******************/
		/**** md5 signature: 407e8a534dc8fd5986c54ff8c078ba6d ****/
		%feature("compactdefaultargs") ClearSelected;
		%feature("autodoc", "Method which clear all selected owners belonging to this selectable object. @warning this object does not support selection.

Returns
-------
None
") ClearSelected;
		virtual void ClearSelected();

		/****************** Compute ******************/
		/**** md5 signature: 1bb1940ebb02c69fcdc59de667417f7b ****/
		%feature("compactdefaultargs") Compute;
		%feature("autodoc", "Compute 3d part of view cube. @param theprsmgr [in] presentation manager. @param theprs [in] input presentation that is to be filled with flat presentation primitives. @param themode [in] display mode. @warning this object accept only 0 display mode.

Parameters
----------
thePrsMgr: PrsMgr_PresentationManager3d
thePrs: Prs3d_Presentation
theMode: int,optional
	default value is 0

Returns
-------
None
") Compute;
		virtual void Compute(const opencascade::handle<PrsMgr_PresentationManager3d> & thePrsMgr, const opencascade::handle<Prs3d_Presentation> & thePrs, const Standard_Integer theMode = 0);

		/****************** ComputeSelection ******************/
		/**** md5 signature: 0ee36b1ad2a8a3c1bbb813dfdb1d40ae ****/
		%feature("compactdefaultargs") ComputeSelection;
		%feature("autodoc", "Redefine computing of sensitive entities for view cube. @param theselection [in] input selection object that is to be filled with sensitive entities. @param themode [in] selection mode. @warning object accepts only 0 selection mode.

Parameters
----------
theSelection: SelectMgr_Selection
theMode: int

Returns
-------
None
") ComputeSelection;
		virtual void ComputeSelection(const opencascade::handle<SelectMgr_Selection> & theSelection, const Standard_Integer theMode);

		/****************** Duration ******************/
		/**** md5 signature: 06189957f640ef2ea84a8c20c3be6eb2 ****/
		%feature("compactdefaultargs") Duration;
		%feature("autodoc", "Return duration of animation in seconds; 0.5 sec by default.

Returns
-------
float
") Duration;
		Standard_Real Duration();

		/****************** Font ******************/
		/**** md5 signature: 246154ff4659a4acf077229295e5855e ****/
		%feature("compactdefaultargs") Font;
		%feature("autodoc", "Return font name that is used for displaying of sides and axes text. alias for: @code attributes()->textaspect()->aspect()->setfont() @endcode.

Returns
-------
TCollection_AsciiString
") Font;
		const TCollection_AsciiString & Font();

		/****************** FontHeight ******************/
		/**** md5 signature: f8ae02fac55647c17230ba644edd4c2a ****/
		%feature("compactdefaultargs") FontHeight;
		%feature("autodoc", "Return height of font.

Returns
-------
float
") FontHeight;
		Standard_Real FontHeight();

		/****************** GlobalSelOwner ******************/
		/**** md5 signature: 4b6aea62676c6d618f2db36c62ce24fb ****/
		%feature("compactdefaultargs") GlobalSelOwner;
		%feature("autodoc", "Global selection has no meaning for this class.

Returns
-------
opencascade::handle<SelectMgr_EntityOwner>
") GlobalSelOwner;
		virtual opencascade::handle<SelectMgr_EntityOwner> GlobalSelOwner();

		/****************** HandleClick ******************/
		/**** md5 signature: 233cc95372f82b5f942da4a36a76df2e ****/
		%feature("compactdefaultargs") HandleClick;
		%feature("autodoc", "Perform camera transformation corresponding to the input detected owner.

Parameters
----------
theOwner: AIS_ViewCubeOwner

Returns
-------
None
") HandleClick;
		virtual void HandleClick(const opencascade::handle<AIS_ViewCubeOwner> & theOwner);

		/****************** HasAnimation ******************/
		/**** md5 signature: ea8e65091e3937097b9cc6944fb87e34 ****/
		%feature("compactdefaultargs") HasAnimation;
		%feature("autodoc", "Returns true if view cube has unfinished animation of view camera.

Returns
-------
bool
") HasAnimation;
		Standard_Boolean HasAnimation();

		/****************** HilightOwnerWithColor ******************/
		/**** md5 signature: 59e159c706312ffbc3fbab59d0e52b8c ****/
		%feature("compactdefaultargs") HilightOwnerWithColor;
		%feature("autodoc", "Method which highlights input owner belonging to this selectable object. @param thepm [in] presentation manager @param thestyle [in] style for dynamic highlighting. @param theowner [in] input entity owner.

Parameters
----------
thePM: PrsMgr_PresentationManager3d
theStyle: Prs3d_Drawer
theOwner: SelectMgr_EntityOwner

Returns
-------
None
") HilightOwnerWithColor;
		virtual void HilightOwnerWithColor(const opencascade::handle<PrsMgr_PresentationManager3d> & thePM, const opencascade::handle<Prs3d_Drawer> & theStyle, const opencascade::handle<SelectMgr_EntityOwner> & theOwner);

		/****************** HilightSelected ******************/
		/**** md5 signature: 51adc22064d394c9bf0b2f20ae0065c3 ****/
		%feature("compactdefaultargs") HilightSelected;
		%feature("autodoc", "Method which draws selected owners.

Parameters
----------
thePM: PrsMgr_PresentationManager3d
theSeq: SelectMgr_SequenceOfOwner

Returns
-------
None
") HilightSelected;
		virtual void HilightSelected(const opencascade::handle<PrsMgr_PresentationManager3d> & thePM, const SelectMgr_SequenceOfOwner & theSeq);

		/****************** InnerColor ******************/
		/**** md5 signature: 14a7d761b72d032118329dab4a717cc8 ****/
		%feature("compactdefaultargs") InnerColor;
		%feature("autodoc", "Return color of sides back material.

Returns
-------
Quantity_Color
") InnerColor;
		const Quantity_Color & InnerColor();

		/****************** IsAutoHilight ******************/
		/**** md5 signature: d08251e65bb2038174f4c2dab73d34c9 ****/
		%feature("compactdefaultargs") IsAutoHilight;
		%feature("autodoc", "Disables auto highlighting to use hilightselected() and hilightownerwithcolor() overridden methods.

Returns
-------
bool
") IsAutoHilight;
		virtual Standard_Boolean IsAutoHilight();

		/****************** IsBoxCorner ******************/
		/**** md5 signature: 75fe36b27e987c1abfb32a08311b0265 ****/
		%feature("compactdefaultargs") IsBoxCorner;
		%feature("autodoc", "Return true if specified orientation belongs to box corner (vertex).

Parameters
----------
theOrient: V3d_TypeOfOrientation

Returns
-------
bool
") IsBoxCorner;
		static bool IsBoxCorner(V3d_TypeOfOrientation theOrient);

		/****************** IsBoxEdge ******************/
		/**** md5 signature: dea43b60f7436844e12040dd2b97a04c ****/
		%feature("compactdefaultargs") IsBoxEdge;
		%feature("autodoc", "Return true if specified orientation belongs to box edge.

Parameters
----------
theOrient: V3d_TypeOfOrientation

Returns
-------
bool
") IsBoxEdge;
		static bool IsBoxEdge(V3d_TypeOfOrientation theOrient);

		/****************** IsBoxSide ******************/
		/**** md5 signature: f20117775f8e7e897cd2c7de0f3999b8 ****/
		%feature("compactdefaultargs") IsBoxSide;
		%feature("autodoc", "Return true if specified orientation belongs to box side.

Parameters
----------
theOrient: V3d_TypeOfOrientation

Returns
-------
bool
") IsBoxSide;
		static bool IsBoxSide(V3d_TypeOfOrientation theOrient);

		/****************** IsFixedAnimationLoop ******************/
		/**** md5 signature: 9a52eb355318c2784667b23e102c4d58 ****/
		%feature("compactdefaultargs") IsFixedAnimationLoop;
		%feature("autodoc", "Return true if camera animation should be done in uninterruptible loop; true by default.

Returns
-------
bool
") IsFixedAnimationLoop;
		Standard_Boolean IsFixedAnimationLoop();

		/****************** IsYup ******************/
		/**** md5 signature: 0258bf2f11be77e639c0e89833b4fb7d ****/
		%feature("compactdefaultargs") IsYup;
		%feature("autodoc", "Return true if application expects y-up viewer orientation instead of z-up; false by default.

Returns
-------
bool
") IsYup;
		Standard_Boolean IsYup();

		/****************** ResetStyles ******************/
		/**** md5 signature: 1f06b68deac4bd647a9e560e0db0ee77 ****/
		%feature("compactdefaultargs") ResetStyles;
		%feature("autodoc", "Reset all size and style parameters to default. @warning it doesn't reset position of view cube.

Returns
-------
None
") ResetStyles;
		void ResetStyles();

		/****************** RoundRadius ******************/
		/**** md5 signature: b765e7492bbb4ae2e6ea2c63b8a106ee ****/
		%feature("compactdefaultargs") RoundRadius;
		%feature("autodoc", "Return relative radius of side corners (round rectangle); 0.0 by default. the value in within [0, 0.5] range meaning absolute radius = roundradius() / size().

Returns
-------
float
") RoundRadius;
		Standard_Real RoundRadius();

		/****************** SetAutoStartAnimation ******************/
		/**** md5 signature: 8a1b8c856a96bad116e83f4b7a7dfe16 ****/
		%feature("compactdefaultargs") SetAutoStartAnimation;
		%feature("autodoc", "Enable/disable automatic camera transformation on selection (highlighting). the automatic logic can be disabled if application wants performing action manually basing on picking results (ais_viewcubeowner).

Parameters
----------
theToEnable: bool

Returns
-------
None
") SetAutoStartAnimation;
		void SetAutoStartAnimation(bool theToEnable);

		/****************** SetAxesLabels ******************/
		/**** md5 signature: e0b70137acafbab1dfb0049c9b2302e4 ****/
		%feature("compactdefaultargs") SetAxesLabels;
		%feature("autodoc", "Set axes labels.

Parameters
----------
theX: TCollection_AsciiString
theY: TCollection_AsciiString
theZ: TCollection_AsciiString

Returns
-------
None
") SetAxesLabels;
		void SetAxesLabels(const TCollection_AsciiString & theX, const TCollection_AsciiString & theY, const TCollection_AsciiString & theZ);

		/****************** SetAxesPadding ******************/
		/**** md5 signature: bda467829db54201ecc24927f31793c3 ****/
		%feature("compactdefaultargs") SetAxesPadding;
		%feature("autodoc", "Set new value of padding between axes and 3d part (box).

Parameters
----------
theValue: float

Returns
-------
None
") SetAxesPadding;
		void SetAxesPadding(Standard_Real theValue);

		/****************** SetBoxColor ******************/
		/**** md5 signature: 88db23bbfdea3bc42a298167dbc484b3 ****/
		%feature("compactdefaultargs") SetBoxColor;
		%feature("autodoc", "Set new value of front color for the 3d part of object. @param thecolor [in] input color value.

Parameters
----------
theColor: Quantity_Color

Returns
-------
None
") SetBoxColor;
		void SetBoxColor(const Quantity_Color & theColor);

		/****************** SetBoxCornerMinSize ******************/
		/**** md5 signature: 9d13ba003e1e5abf276c1861755ae870 ****/
		%feature("compactdefaultargs") SetBoxCornerMinSize;
		%feature("autodoc", "Set new value of box corner minimal size.

Parameters
----------
theValue: float

Returns
-------
None
") SetBoxCornerMinSize;
		void SetBoxCornerMinSize(Standard_Real theValue);

		/****************** SetBoxEdgeGap ******************/
		/**** md5 signature: 509bab1cb550227d5b9ef2b8b06b8857 ****/
		%feature("compactdefaultargs") SetBoxEdgeGap;
		%feature("autodoc", "Set new value of box edges gap.

Parameters
----------
theValue: float

Returns
-------
None
") SetBoxEdgeGap;
		void SetBoxEdgeGap(Standard_Real theValue);

		/****************** SetBoxEdgeMinSize ******************/
		/**** md5 signature: 5ebb8cd58ee33cd5b2d5938d1345e440 ****/
		%feature("compactdefaultargs") SetBoxEdgeMinSize;
		%feature("autodoc", "Set new value of box edge minimal size.

Parameters
----------
theValue: float

Returns
-------
None
") SetBoxEdgeMinSize;
		void SetBoxEdgeMinSize(Standard_Real theValue);

		/****************** SetBoxFacetExtension ******************/
		/**** md5 signature: 098f3a467ddf8cf6716c6347bad9ca5c ****/
		%feature("compactdefaultargs") SetBoxFacetExtension;
		%feature("autodoc", "Set new value of box facet extension.

Parameters
----------
theValue: float

Returns
-------
None
") SetBoxFacetExtension;
		void SetBoxFacetExtension(Standard_Real theValue);

		/****************** SetBoxSideLabel ******************/
		/**** md5 signature: afb875f447d85dddc5aecae5535def86 ****/
		%feature("compactdefaultargs") SetBoxSideLabel;
		%feature("autodoc", "Set box side label.

Parameters
----------
theSide: V3d_TypeOfOrientation
theLabel: TCollection_AsciiString

Returns
-------
None
") SetBoxSideLabel;
		void SetBoxSideLabel(const V3d_TypeOfOrientation theSide, const TCollection_AsciiString & theLabel);

		/****************** SetBoxTransparency ******************/
		/**** md5 signature: 7b1db2c489dae836412f459804ab26de ****/
		%feature("compactdefaultargs") SetBoxTransparency;
		%feature("autodoc", "Set new value of transparency for 3d part of object. @param thevalue [in] input transparency value.

Parameters
----------
theValue: float

Returns
-------
None
") SetBoxTransparency;
		void SetBoxTransparency(Standard_Real theValue);

		/****************** SetColor ******************/
		/**** md5 signature: 8b05a1176e8ea8308341667f45b45c55 ****/
		%feature("compactdefaultargs") SetColor;
		%feature("autodoc", "Set new value of color for the whole object. @param thecolor [in] input color value.

Parameters
----------
theColor: Quantity_Color

Returns
-------
None
") SetColor;
		virtual void SetColor(const Quantity_Color & theColor);

		/****************** SetDrawAxes ******************/
		/**** md5 signature: 6d8a79f10109d6e330c2252fb0788a3a ****/
		%feature("compactdefaultargs") SetDrawAxes;
		%feature("autodoc", "Enable/disable drawing of trihedron.

Parameters
----------
theValue: bool

Returns
-------
None
") SetDrawAxes;
		void SetDrawAxes(Standard_Boolean theValue);

		/****************** SetDrawEdges ******************/
		/**** md5 signature: 561c086bdeef81fcce791ab36dd58d37 ****/
		%feature("compactdefaultargs") SetDrawEdges;
		%feature("autodoc", "Enable/disable drawing of edges of view cube.

Parameters
----------
theValue: bool

Returns
-------
None
") SetDrawEdges;
		void SetDrawEdges(Standard_Boolean theValue);

		/****************** SetDrawVertices ******************/
		/**** md5 signature: 7620542fa225287ee76a8ccf14ea2d2f ****/
		%feature("compactdefaultargs") SetDrawVertices;
		%feature("autodoc", "Enable/disable drawing of vertices (corners) of view cube.

Parameters
----------
theValue: bool

Returns
-------
None
") SetDrawVertices;
		void SetDrawVertices(Standard_Boolean theValue);

		/****************** SetDuration ******************/
		/**** md5 signature: 5d997ec35c7b56e30bc519baa447e206 ****/
		%feature("compactdefaultargs") SetDuration;
		%feature("autodoc", "Set duration of animation. @param thevalue [in] input value of duration in seconds.

Parameters
----------
theValue: float

Returns
-------
None
") SetDuration;
		void SetDuration(Standard_Real theValue);

		/****************** SetFitSelected ******************/
		/**** md5 signature: 8d3243804e683621aa021dc968363a29 ****/
		%feature("compactdefaultargs") SetFitSelected;
		%feature("autodoc", "Set if animation should fit selected objects or to fit entire scene.

Parameters
----------
theToFitSelected: bool

Returns
-------
None
") SetFitSelected;
		void SetFitSelected(Standard_Boolean theToFitSelected);

		/****************** SetFixedAnimationLoop ******************/
		/**** md5 signature: f081ff0fc52eba4baf015d8e1c8d3cf9 ****/
		%feature("compactdefaultargs") SetFixedAnimationLoop;
		%feature("autodoc", "Set if camera animation should be done in uninterruptible loop.

Parameters
----------
theToEnable: bool

Returns
-------
None
") SetFixedAnimationLoop;
		void SetFixedAnimationLoop(bool theToEnable);

		/****************** SetFont ******************/
		/**** md5 signature: 7f2969793d80ece6d22485bcb15f06b4 ****/
		%feature("compactdefaultargs") SetFont;
		%feature("autodoc", "Set font name that is used for displaying of sides and axes text. alias for: @code attributes()->textaspect()->setfont() @endcode.

Parameters
----------
theFont: TCollection_AsciiString

Returns
-------
None
") SetFont;
		void SetFont(const TCollection_AsciiString & theFont);

		/****************** SetFontHeight ******************/
		/**** md5 signature: 88c3666178019f6b9e8629cb7bd9166f ****/
		%feature("compactdefaultargs") SetFontHeight;
		%feature("autodoc", "Change font height. alias for: @code attributes()->textaspect()->setheight() @endcode.

Parameters
----------
theValue: float

Returns
-------
None
") SetFontHeight;
		void SetFontHeight(Standard_Real theValue);

		/****************** SetInnerColor ******************/
		/**** md5 signature: c006b72a08a2372175b589ace45abf78 ****/
		%feature("compactdefaultargs") SetInnerColor;
		%feature("autodoc", "Set color of sides back material. alias for: @code attributes()->shadingaspect()->aspect()->changebackmaterial().setcolor() @endcode.

Parameters
----------
theColor: Quantity_Color

Returns
-------
None
") SetInnerColor;
		void SetInnerColor(const Quantity_Color & theColor);

		/****************** SetMaterial ******************/
		/**** md5 signature: ee0a196604d70f5cc8455b24228bcaef ****/
		%feature("compactdefaultargs") SetMaterial;
		%feature("autodoc", "Sets the material for the interactive object.

Parameters
----------
theMat: Graphic3d_MaterialAspect

Returns
-------
None
") SetMaterial;
		virtual void SetMaterial(const Graphic3d_MaterialAspect & theMat);

		/****************** SetResetCamera ******************/
		/**** md5 signature: 5f322fdd51d73afcfa771ed706e084e8 ****/
		%feature("compactdefaultargs") SetResetCamera;
		%feature("autodoc", "Set if new camera up direction should be always set to default value for a new camera direction.

Parameters
----------
theToReset: bool

Returns
-------
None
") SetResetCamera;
		void SetResetCamera(Standard_Boolean theToReset);

		/****************** SetRoundRadius ******************/
		/**** md5 signature: 3f1472c692ca705e2555a28d216862a0 ****/
		%feature("compactdefaultargs") SetRoundRadius;
		%feature("autodoc", "Set relative radius of view cube sides corners (round rectangle). the value should be within [0, 0.5] range.

Parameters
----------
theValue: float

Returns
-------
None
") SetRoundRadius;
		void SetRoundRadius(const Standard_Real theValue);

		/****************** SetSize ******************/
		/**** md5 signature: 5baa016955736829fa7e1f0badc0d106 ****/
		%feature("compactdefaultargs") SetSize;
		%feature("autodoc", "Sets size (width and height) of view cube sides. @param thetoadaptanother if true, then other parameters will be adapted to specified size.

Parameters
----------
theValue: float
theToAdaptAnother: bool,optional
	default value is true

Returns
-------
None
") SetSize;
		void SetSize(Standard_Real theValue, Standard_Boolean theToAdaptAnother = true);

		/****************** SetTextColor ******************/
		/**** md5 signature: f1aa114965e956f094c13e5b3ae0dc42 ****/
		%feature("compactdefaultargs") SetTextColor;
		%feature("autodoc", "Set color of text labels on box sides. alias for: @code attributes()->textaspect()->setcolor() @endcode.

Parameters
----------
theColor: Quantity_Color

Returns
-------
None
") SetTextColor;
		void SetTextColor(const Quantity_Color & theColor);

		/****************** SetTransparency ******************/
		/**** md5 signature: dd8539d90dbe5b5ee6a12b8b3e461ecb ****/
		%feature("compactdefaultargs") SetTransparency;
		%feature("autodoc", "Set new value of transparency for the whole object. @param thevalue [in] input transparency value.

Parameters
----------
theValue: float

Returns
-------
None
") SetTransparency;
		virtual void SetTransparency(const Standard_Real theValue);

		/****************** SetViewAnimation ******************/
		/**** md5 signature: 853aa0ceb7bdaa632922e5e8afd4812f ****/
		%feature("compactdefaultargs") SetViewAnimation;
		%feature("autodoc", "Set view animation.

Parameters
----------
theAnimation: AIS_AnimationCamera

Returns
-------
None
") SetViewAnimation;
		void SetViewAnimation(const opencascade::handle<AIS_AnimationCamera> & theAnimation);

		/****************** SetYup ******************/
		/**** md5 signature: 042b2f912421f1ec215a2aee204101be ****/
		%feature("compactdefaultargs") SetYup;
		%feature("autodoc", "Set if application expects y-up viewer orientation instead of z-up.

Parameters
----------
theIsYup: bool
theToUpdateLabels: bool,optional
	default value is Standard_True

Returns
-------
None
") SetYup;
		void SetYup(Standard_Boolean theIsYup, Standard_Boolean theToUpdateLabels = Standard_True);

		/****************** Size ******************/
		/**** md5 signature: 0113d47673ecbdcb4822fb85c27ac0c5 ****/
		%feature("compactdefaultargs") Size;
		%feature("autodoc", "Returns size (width and height) of view cube sides; 100 by default.

Returns
-------
float
") Size;
		Standard_Real Size();

		/****************** StartAnimation ******************/
		/**** md5 signature: e11ccac5a43cc784cce774de19a1f2f9 ****/
		%feature("compactdefaultargs") StartAnimation;
		%feature("autodoc", "Start camera transformation corresponding to the input detected owner. @param theowner [in] detected owner.

Parameters
----------
theOwner: AIS_ViewCubeOwner

Returns
-------
None
") StartAnimation;
		virtual void StartAnimation(const opencascade::handle<AIS_ViewCubeOwner> & theOwner);

		/****************** TextColor ******************/
		/**** md5 signature: 92b8584a07bd8f0e0e3839a819e74e79 ****/
		%feature("compactdefaultargs") TextColor;
		%feature("autodoc", "Return text color of labels of box sides; black by default.

Returns
-------
Quantity_Color
") TextColor;
		const Quantity_Color & TextColor();

		/****************** ToAutoStartAnimation ******************/
		/**** md5 signature: 173be5b407140d752a33eecf77a56b09 ****/
		%feature("compactdefaultargs") ToAutoStartAnimation;
		%feature("autodoc", "Return true if automatic camera transformation on selection (highlighting) is enabled; true by default.

Returns
-------
bool
") ToAutoStartAnimation;
		Standard_Boolean ToAutoStartAnimation();

		/****************** ToDrawAxes ******************/
		/**** md5 signature: cf79dcc6451b48c9e4ca8d3f257bcc8d ****/
		%feature("compactdefaultargs") ToDrawAxes;
		%feature("autodoc", "Returns true if trihedron is drawn; true by default.

Returns
-------
bool
") ToDrawAxes;
		Standard_Boolean ToDrawAxes();

		/****************** ToDrawEdges ******************/
		/**** md5 signature: 04159a85d23312a120a98b95966f1e8d ****/
		%feature("compactdefaultargs") ToDrawEdges;
		%feature("autodoc", "Returns true if edges of view cube is drawn; true by default.

Returns
-------
bool
") ToDrawEdges;
		Standard_Boolean ToDrawEdges();

		/****************** ToDrawVertices ******************/
		/**** md5 signature: 71770068df79467e3f52c43f268b446f ****/
		%feature("compactdefaultargs") ToDrawVertices;
		%feature("autodoc", "Return true if vertices (vertex) of view cube is drawn; true by default.

Returns
-------
bool
") ToDrawVertices;
		Standard_Boolean ToDrawVertices();

		/****************** ToFitSelected ******************/
		/**** md5 signature: ca2e1783e415345ec5dde27605ce5511 ****/
		%feature("compactdefaultargs") ToFitSelected;
		%feature("autodoc", "Return true if animation should fit selected objects and false to fit entire scene; true by default.

Returns
-------
bool
") ToFitSelected;
		Standard_Boolean ToFitSelected();

		/****************** ToResetCameraUp ******************/
		/**** md5 signature: 8126147cfb93a6867ff8d666dce509ea ****/
		%feature("compactdefaultargs") ToResetCameraUp;
		%feature("autodoc", "Return true if new camera up direction should be always set to default value for a new camera direction; false by default. when this flag is false, the new camera up will be set as current up orthogonalized to the new camera direction, and will set to default up on second click.

Returns
-------
bool
") ToResetCameraUp;
		Standard_Boolean ToResetCameraUp();

		/****************** UnsetAttributes ******************/
		/**** md5 signature: f3893ef8c4b0f7748ca4fdf6a6ba4ae8 ****/
		%feature("compactdefaultargs") UnsetAttributes;
		%feature("autodoc", "Set default parameters for visual attributes @sa attributes().

Returns
-------
None
") UnsetAttributes;
		virtual void UnsetAttributes();

		/****************** UnsetColor ******************/
		/**** md5 signature: 543a55646b9732434a34cda0626c7ae0 ****/
		%feature("compactdefaultargs") UnsetColor;
		%feature("autodoc", "Reset color for the whole object.

Returns
-------
None
") UnsetColor;
		virtual void UnsetColor();

		/****************** UnsetHilightAttributes ******************/
		/**** md5 signature: cdbaa046fa84db348b32f4063de97507 ****/
		%feature("compactdefaultargs") UnsetHilightAttributes;
		%feature("autodoc", "Set default parameters for dynamic highlighting attributes, reset highlight attributes.

Returns
-------
None
") UnsetHilightAttributes;
		virtual void UnsetHilightAttributes();

		/****************** UnsetMaterial ******************/
		/**** md5 signature: fd222a04e009fb71173291d494b57fbe ****/
		%feature("compactdefaultargs") UnsetMaterial;
		%feature("autodoc", "Sets the material for the interactive object.

Returns
-------
None
") UnsetMaterial;
		virtual void UnsetMaterial();

		/****************** UnsetTransparency ******************/
		/**** md5 signature: d5dc50ef874a9e0fcbfa62da4cd73b8f ****/
		%feature("compactdefaultargs") UnsetTransparency;
		%feature("autodoc", "Reset transparency for the whole object.

Returns
-------
None
") UnsetTransparency;
		virtual void UnsetTransparency();

		/****************** UpdateAnimation ******************/
		/**** md5 signature: 1cd4b6447fb9ee386d69db232b771bf6 ****/
		%feature("compactdefaultargs") UpdateAnimation;
		%feature("autodoc", "Perform one step of current camera transformation. thetoupdate [in] enable/disable update of view. returns true if animation is not stopped.

Parameters
----------
theToUpdate: bool

Returns
-------
bool
") UpdateAnimation;
		virtual Standard_Boolean UpdateAnimation(const Standard_Boolean theToUpdate);

		/****************** ViewAnimation ******************/
		/**** md5 signature: 7a7517bd1c0e55fdc5279dc1aefd5047 ****/
		%feature("compactdefaultargs") ViewAnimation;
		%feature("autodoc", "Return view animation.

Returns
-------
opencascade::handle<AIS_AnimationCamera>
") ViewAnimation;
		const opencascade::handle<AIS_AnimationCamera> & ViewAnimation();

};


%extend AIS_ViewCube {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************
* class AIS_AngleDimension *
***************************/
class AIS_AngleDimension : public AIS_Dimension {
	public:
		/****************** AIS_AngleDimension ******************/
		/**** md5 signature: 10dfb47313700070eb9ffece6759f9b9 ****/
		%feature("compactdefaultargs") AIS_AngleDimension;
		%feature("autodoc", "Constructs minimum angle dimension between two linear edges (where possible). these two edges should be intersected by each other. otherwise the geometry is not valid. @param thefirstedge [in] the first edge. @param thesecondedge [in] the second edge.

Parameters
----------
theFirstEdge: TopoDS_Edge
theSecondEdge: TopoDS_Edge

Returns
-------
None
") AIS_AngleDimension;
		 AIS_AngleDimension(const TopoDS_Edge & theFirstEdge, const TopoDS_Edge & theSecondEdge);

		/****************** AIS_AngleDimension ******************/
		/**** md5 signature: 110311f51945857cc0cfdebe6e679cd2 ****/
		%feature("compactdefaultargs") AIS_AngleDimension;
		%feature("autodoc", "Constructs the angle display object defined by three points. @param thefirstpoint [in] the first point (point on first angle flyout). @param thesecondpoint [in] the center point of angle dimension. @param thethirdpoint [in] the second point (point on second angle flyout).

Parameters
----------
theFirstPoint: gp_Pnt
theSecondPoint: gp_Pnt
theThirdPoint: gp_Pnt

Returns
-------
None
") AIS_AngleDimension;
		 AIS_AngleDimension(const gp_Pnt & theFirstPoint, const gp_Pnt & theSecondPoint, const gp_Pnt & theThirdPoint);

		/****************** AIS_AngleDimension ******************/
		/**** md5 signature: 5832942a4c48886862c77c462bb66fd8 ****/
		%feature("compactdefaultargs") AIS_AngleDimension;
		%feature("autodoc", "Constructs the angle display object defined by three vertices. @param thefirstvertex [in] the first vertex (vertex for first angle flyout). @param thesecondvertex [in] the center vertex of angle dimension. @param thethirdpoint [in] the second vertex (vertex for second angle flyout).

Parameters
----------
theFirstVertex: TopoDS_Vertex
theSecondVertex: TopoDS_Vertex
theThirdVertex: TopoDS_Vertex

Returns
-------
None
") AIS_AngleDimension;
		 AIS_AngleDimension(const TopoDS_Vertex & theFirstVertex, const TopoDS_Vertex & theSecondVertex, const TopoDS_Vertex & theThirdVertex);

		/****************** AIS_AngleDimension ******************/
		/**** md5 signature: 6d9de1f6611d948a35b9861366f60b5d ****/
		%feature("compactdefaultargs") AIS_AngleDimension;
		%feature("autodoc", "Constructs angle dimension for the cone face. @param thecone [in] the conical face.

Parameters
----------
theCone: TopoDS_Face

Returns
-------
None
") AIS_AngleDimension;
		 AIS_AngleDimension(const TopoDS_Face & theCone);

		/****************** AIS_AngleDimension ******************/
		/**** md5 signature: dfc407454ea77e7991cbf328e192032f ****/
		%feature("compactdefaultargs") AIS_AngleDimension;
		%feature("autodoc", "Constructs angle dimension between two planar faces. @param thefirstface [in] the first face. @param thesecondface [in] the second face.

Parameters
----------
theFirstFace: TopoDS_Face
theSecondFace: TopoDS_Face

Returns
-------
None
") AIS_AngleDimension;
		 AIS_AngleDimension(const TopoDS_Face & theFirstFace, const TopoDS_Face & theSecondFace);

		/****************** AIS_AngleDimension ******************/
		/**** md5 signature: 12a0fe401f05d4996e9a59d00704f375 ****/
		%feature("compactdefaultargs") AIS_AngleDimension;
		%feature("autodoc", "Constructs angle dimension between two planar faces. @param thefirstface [in] the first face. @param thesecondface [in] the second face. @param thepoint [in] the point which the dimension plane should pass through. this point can lay on the one of the faces or not.

Parameters
----------
theFirstFace: TopoDS_Face
theSecondFace: TopoDS_Face
thePoint: gp_Pnt

Returns
-------
None
") AIS_AngleDimension;
		 AIS_AngleDimension(const TopoDS_Face & theFirstFace, const TopoDS_Face & theSecondFace, const gp_Pnt & thePoint);

		/****************** CenterPoint ******************/
		/**** md5 signature: 376d48ef89b723bce96dea4dcf286eaf ****/
		%feature("compactdefaultargs") CenterPoint;
		%feature("autodoc", "Returns center point forming the angle.

Returns
-------
gp_Pnt
") CenterPoint;
		const gp_Pnt CenterPoint();

		/****************** FirstPoint ******************/
		/**** md5 signature: ce6daac63a94ae39a0d0bfa7edc5f3cd ****/
		%feature("compactdefaultargs") FirstPoint;
		%feature("autodoc", "Returns first point forming the angle.

Returns
-------
gp_Pnt
") FirstPoint;
		const gp_Pnt FirstPoint();

		/****************** FirstShape ******************/
		/**** md5 signature: 0052eba922702f3e525649e52d93f4e7 ****/
		%feature("compactdefaultargs") FirstShape;
		%feature("autodoc", "Returns first argument shape.

Returns
-------
TopoDS_Shape
") FirstShape;
		const TopoDS_Shape FirstShape();

		/****************** GetArrowsVisibility ******************/
		/**** md5 signature: 80864e002950ec6283289e3d5f43c3ae ****/
		%feature("compactdefaultargs") GetArrowsVisibility;
		%feature("autodoc", "Returns the type of visibility of arrows.

Returns
-------
AIS_TypeOfAngleArrowVisibility
") GetArrowsVisibility;
		AIS_TypeOfAngleArrowVisibility GetArrowsVisibility();

		/****************** GetDisplayUnits ******************/
		/**** md5 signature: 6fbf70f12ad85e7a1835a85781f8abb8 ****/
		%feature("compactdefaultargs") GetDisplayUnits;
		%feature("autodoc", "Returns the display units string.

Returns
-------
TCollection_AsciiString
") GetDisplayUnits;
		virtual const TCollection_AsciiString & GetDisplayUnits();

		/****************** GetModelUnits ******************/
		/**** md5 signature: 27dbe0cf13d3ca82bbb0bf570025f3a8 ****/
		%feature("compactdefaultargs") GetModelUnits;
		%feature("autodoc", "Returns the model units string.

Returns
-------
TCollection_AsciiString
") GetModelUnits;
		virtual const TCollection_AsciiString & GetModelUnits();

		/****************** GetTextPosition ******************/
		/**** md5 signature: 8c2fd05c2d7874fe62f7d2730b192774 ****/
		%feature("compactdefaultargs") GetTextPosition;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Pnt
") GetTextPosition;
		virtual const gp_Pnt GetTextPosition();

		/****************** GetType ******************/
		/**** md5 signature: 44149ecb59501940a4e737eec66ade20 ****/
		%feature("compactdefaultargs") GetType;
		%feature("autodoc", "Returns the current angle type.

Returns
-------
AIS_TypeOfAngle
") GetType;
		AIS_TypeOfAngle GetType();

		/****************** SecondPoint ******************/
		/**** md5 signature: 66319c8fbdc379c409c2efa67f6e79e2 ****/
		%feature("compactdefaultargs") SecondPoint;
		%feature("autodoc", "Returns second point forming the angle.

Returns
-------
gp_Pnt
") SecondPoint;
		const gp_Pnt SecondPoint();

		/****************** SecondShape ******************/
		/**** md5 signature: 3c9d5f80bfbcac42f6848475061ecf61 ****/
		%feature("compactdefaultargs") SecondShape;
		%feature("autodoc", "Returns second argument shape.

Returns
-------
TopoDS_Shape
") SecondShape;
		const TopoDS_Shape SecondShape();

		/****************** SetArrowsVisibility ******************/
		/**** md5 signature: d4f7ca2ce5ec4942135497a46f9443d3 ****/
		%feature("compactdefaultargs") SetArrowsVisibility;
		%feature("autodoc", "Sets visible arrows type @param thetype [in] the type of visibility of arrows.

Parameters
----------
theType: AIS_TypeOfAngleArrowVisibility

Returns
-------
None
") SetArrowsVisibility;
		void SetArrowsVisibility(const AIS_TypeOfAngleArrowVisibility & theType);

		/****************** SetDisplayUnits ******************/
		/**** md5 signature: afe69b618dcd1bcf849c7c525bd3f1db ****/
		%feature("compactdefaultargs") SetDisplayUnits;
		%feature("autodoc", "No available documentation.

Parameters
----------
theUnits: TCollection_AsciiString

Returns
-------
None
") SetDisplayUnits;
		virtual void SetDisplayUnits(const TCollection_AsciiString & theUnits);

		/****************** SetMeasuredGeometry ******************/
		/**** md5 signature: bd2a1958aebc184ac052f65310544456 ****/
		%feature("compactdefaultargs") SetMeasuredGeometry;
		%feature("autodoc", "Measures minimum angle dimension between two linear edges. these two edges should be intersected by each other. otherwise the geometry is not valid. @param thefirstedge [in] the first edge. @param thesecondedge [in] the second edge.

Parameters
----------
theFirstEdge: TopoDS_Edge
theSecondEdge: TopoDS_Edge

Returns
-------
None
") SetMeasuredGeometry;
		void SetMeasuredGeometry(const TopoDS_Edge & theFirstEdge, const TopoDS_Edge & theSecondEdge);

		/****************** SetMeasuredGeometry ******************/
		/**** md5 signature: 8370d49fd8b758a25710cc639a9511cd ****/
		%feature("compactdefaultargs") SetMeasuredGeometry;
		%feature("autodoc", "Measures angle defined by three points. @param thefirstpoint [in] the first point (point on first angle flyout). @param thesecondpoint [in] the center point of angle dimension. @param thethirdpoint [in] the second point (point on second angle flyout).

Parameters
----------
theFirstPoint: gp_Pnt
theSecondPoint: gp_Pnt
theThridPoint: gp_Pnt

Returns
-------
None
") SetMeasuredGeometry;
		void SetMeasuredGeometry(const gp_Pnt & theFirstPoint, const gp_Pnt & theSecondPoint, const gp_Pnt & theThridPoint);

		/****************** SetMeasuredGeometry ******************/
		/**** md5 signature: 250b7a4fbb3059f28c11f7363968850b ****/
		%feature("compactdefaultargs") SetMeasuredGeometry;
		%feature("autodoc", "Measures angle defined by three vertices. @param thefirstvertex [in] the first vertex (vertex for first angle flyout). @param thesecondvertex [in] the center vertex of angle dimension. @param thethirdpoint [in] the second vertex (vertex for second angle flyout).

Parameters
----------
theFirstVertex: TopoDS_Vertex
theSecondVertex: TopoDS_Vertex
theThirdVertex: TopoDS_Vertex

Returns
-------
None
") SetMeasuredGeometry;
		void SetMeasuredGeometry(const TopoDS_Vertex & theFirstVertex, const TopoDS_Vertex & theSecondVertex, const TopoDS_Vertex & theThirdVertex);

		/****************** SetMeasuredGeometry ******************/
		/**** md5 signature: 05157dc0a85dc9fbcd1befa60e9f98ee ****/
		%feature("compactdefaultargs") SetMeasuredGeometry;
		%feature("autodoc", "Measures angle of conical face. @param thecone [in] the shape to measure.

Parameters
----------
theCone: TopoDS_Face

Returns
-------
None
") SetMeasuredGeometry;
		void SetMeasuredGeometry(const TopoDS_Face & theCone);

		/****************** SetMeasuredGeometry ******************/
		/**** md5 signature: bfe5f7ff6a46076a22cbf50a395e204f ****/
		%feature("compactdefaultargs") SetMeasuredGeometry;
		%feature("autodoc", "Measures angle between two planar faces. @param thefirstface [in] the first face. @param thesecondface [in] the second face..

Parameters
----------
theFirstFace: TopoDS_Face
theSecondFace: TopoDS_Face

Returns
-------
None
") SetMeasuredGeometry;
		void SetMeasuredGeometry(const TopoDS_Face & theFirstFace, const TopoDS_Face & theSecondFace);

		/****************** SetMeasuredGeometry ******************/
		/**** md5 signature: 1ba045d48067d962f09980869f2f63bf ****/
		%feature("compactdefaultargs") SetMeasuredGeometry;
		%feature("autodoc", "Measures angle between two planar faces. @param thefirstface [in] the first face. @param thesecondface [in] the second face. @param thepoint [in] the point which the dimension plane should pass through. this point can lay on the one of the faces or not.

Parameters
----------
theFirstFace: TopoDS_Face
theSecondFace: TopoDS_Face
thePoint: gp_Pnt

Returns
-------
None
") SetMeasuredGeometry;
		void SetMeasuredGeometry(const TopoDS_Face & theFirstFace, const TopoDS_Face & theSecondFace, const gp_Pnt & thePoint);

		/****************** SetModelUnits ******************/
		/**** md5 signature: bac7da9c21ed70bf629179ea24a5af0c ****/
		%feature("compactdefaultargs") SetModelUnits;
		%feature("autodoc", "No available documentation.

Parameters
----------
theUnits: TCollection_AsciiString

Returns
-------
None
") SetModelUnits;
		virtual void SetModelUnits(const TCollection_AsciiString & theUnits);

		/****************** SetTextPosition ******************/
		/**** md5 signature: f1658ae61229bf1e77ff3828626b747f ****/
		%feature("compactdefaultargs") SetTextPosition;
		%feature("autodoc", "Principle of horizontal text alignment settings: - divide circle into two halves according to attachment points - if atextpos is between attach points -> center + positive flyout - if atextpos is not between attach points but in this half -> left or right + positive flyout - if atextpos is between reflections of attach points -> center + negative flyout - if atextpos is not between reflections of attach points -> left or right + negative flyout.

Parameters
----------
theTextPos: gp_Pnt

Returns
-------
None
") SetTextPosition;
		virtual void SetTextPosition(const gp_Pnt & theTextPos);

		/****************** SetType ******************/
		/**** md5 signature: 2e29fa670315e9b1bbf288653f6eb2ef ****/
		%feature("compactdefaultargs") SetType;
		%feature("autodoc", "Sets angle type. @param thetype [in] the type value.

Parameters
----------
theType: AIS_TypeOfAngle

Returns
-------
None
") SetType;
		void SetType(const AIS_TypeOfAngle theType);

		/****************** ThirdShape ******************/
		/**** md5 signature: bdef6863310cc2c387933980e76c0b33 ****/
		%feature("compactdefaultargs") ThirdShape;
		%feature("autodoc", "Returns third argument shape.

Returns
-------
TopoDS_Shape
") ThirdShape;
		const TopoDS_Shape ThirdShape();

};


%make_alias(AIS_AngleDimension)

%extend AIS_AngleDimension {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************
* class AIS_Chamf2dDimension *
*****************************/
class AIS_Chamf2dDimension : public AIS_Relation {
	public:
		/****************** AIS_Chamf2dDimension ******************/
		/**** md5 signature: 8f53a6daba91ef88879c3dc2e3b39aa6 ****/
		%feature("compactdefaultargs") AIS_Chamf2dDimension;
		%feature("autodoc", "Constructs the display object for 2d chamfers. this object is defined by the face afshape, the dimension aval, the plane aplane and the text atext.

Parameters
----------
aFShape: TopoDS_Shape
aPlane: Geom_Plane
aVal: float
aText: TCollection_ExtendedString

Returns
-------
None
") AIS_Chamf2dDimension;
		 AIS_Chamf2dDimension(const TopoDS_Shape & aFShape, const opencascade::handle<Geom_Plane> & aPlane, const Standard_Real aVal, const TCollection_ExtendedString & aText);

		/****************** AIS_Chamf2dDimension ******************/
		/**** md5 signature: da279a5682cbfe9c14cfd09c87354538 ****/
		%feature("compactdefaultargs") AIS_Chamf2dDimension;
		%feature("autodoc", "Constructs the display object for 2d chamfers. this object is defined by the face afshape, the plane aplane, the dimension aval, the position aposition, the type of arrow asymbolprs with the size anarrowsize, and the text atext.

Parameters
----------
aFShape: TopoDS_Shape
aPlane: Geom_Plane
aVal: float
aText: TCollection_ExtendedString
aPosition: gp_Pnt
aSymbolPrs: DsgPrs_ArrowSide
anArrowSize: float,optional
	default value is 0.0

Returns
-------
None
") AIS_Chamf2dDimension;
		 AIS_Chamf2dDimension(const TopoDS_Shape & aFShape, const opencascade::handle<Geom_Plane> & aPlane, const Standard_Real aVal, const TCollection_ExtendedString & aText, const gp_Pnt & aPosition, const DsgPrs_ArrowSide aSymbolPrs, const Standard_Real anArrowSize = 0.0);

		/****************** Compute ******************/
		/**** md5 signature: 09436ef6513347d4c96315939d8b75d5 ****/
		%feature("compactdefaultargs") Compute;
		%feature("autodoc", "Computes the presentation according to a point of view given by <aprojector>. to be used when the associated degenerated presentations have been transformed by <atrsf> which is not a pure translation. the hlr prs can't be deducted automatically warning :<atrsf> must be applied to the object to display before computation !!!.

Parameters
----------
aProjector: Prs3d_Projector
aTrsf: Geom_Transformation
aPresentation: Prs3d_Presentation

Returns
-------
None
") Compute;
		virtual void Compute(const opencascade::handle<Prs3d_Projector> & aProjector, const opencascade::handle<Geom_Transformation> & aTrsf, const opencascade::handle<Prs3d_Presentation> & aPresentation);

		/****************** IsMovable ******************/
		/**** md5 signature: efb300c047e87ac82d826b80cdd545da ****/
		%feature("compactdefaultargs") IsMovable;
		%feature("autodoc", "Returns true if the 2d chamfer dimension is movable.

Returns
-------
bool
") IsMovable;
		virtual Standard_Boolean IsMovable();

		/****************** KindOfDimension ******************/
		/**** md5 signature: 5346b8aa31fa1e8edfb8a13dfcfc1be1 ****/
		%feature("compactdefaultargs") KindOfDimension;
		%feature("autodoc", "Indicates that we are concerned with a 2d length.

Returns
-------
AIS_KindOfDimension
") KindOfDimension;
		virtual AIS_KindOfDimension KindOfDimension();

};


%make_alias(AIS_Chamf2dDimension)

%extend AIS_Chamf2dDimension {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************
* class AIS_Chamf3dDimension *
*****************************/
class AIS_Chamf3dDimension : public AIS_Relation {
	public:
		/****************** AIS_Chamf3dDimension ******************/
		/**** md5 signature: 51b533b75906bd68b170567c1761481d ****/
		%feature("compactdefaultargs") AIS_Chamf3dDimension;
		%feature("autodoc", "Constructs a display object for 3d chamfers. this object is defined by the shape afshape, the dimension aval and the text atext.

Parameters
----------
aFShape: TopoDS_Shape
aVal: float
aText: TCollection_ExtendedString

Returns
-------
None
") AIS_Chamf3dDimension;
		 AIS_Chamf3dDimension(const TopoDS_Shape & aFShape, const Standard_Real aVal, const TCollection_ExtendedString & aText);

		/****************** AIS_Chamf3dDimension ******************/
		/**** md5 signature: 7519e534821286fa14c5c9b32f38a796 ****/
		%feature("compactdefaultargs") AIS_Chamf3dDimension;
		%feature("autodoc", "Constructs a display object for 3d chamfers. this object is defined by the shape afshape, the dimension aval, the text atext, the point of origin of the chamfer aposition, the type of arrow asymbolprs with the size anarrowsize.

Parameters
----------
aFShape: TopoDS_Shape
aVal: float
aText: TCollection_ExtendedString
aPosition: gp_Pnt
aSymbolPrs: DsgPrs_ArrowSide
anArrowSize: float,optional
	default value is 0.0

Returns
-------
None
") AIS_Chamf3dDimension;
		 AIS_Chamf3dDimension(const TopoDS_Shape & aFShape, const Standard_Real aVal, const TCollection_ExtendedString & aText, const gp_Pnt & aPosition, const DsgPrs_ArrowSide aSymbolPrs, const Standard_Real anArrowSize = 0.0);

		/****************** Compute ******************/
		/**** md5 signature: 09436ef6513347d4c96315939d8b75d5 ****/
		%feature("compactdefaultargs") Compute;
		%feature("autodoc", "Computes the presentation according to a point of view given by <aprojector>. to be used when the associated degenerated presentations have been transformed by <atrsf> which is not a pure translation. the hlr prs can't be deducted automatically warning :<atrsf> must be applied to the object to display before computation !!!.

Parameters
----------
aProjector: Prs3d_Projector
aTrsf: Geom_Transformation
aPresentation: Prs3d_Presentation

Returns
-------
None
") Compute;
		virtual void Compute(const opencascade::handle<Prs3d_Projector> & aProjector, const opencascade::handle<Geom_Transformation> & aTrsf, const opencascade::handle<Prs3d_Presentation> & aPresentation);

		/****************** IsMovable ******************/
		/**** md5 signature: efb300c047e87ac82d826b80cdd545da ****/
		%feature("compactdefaultargs") IsMovable;
		%feature("autodoc", "Returns true if the 3d chamfer dimension is movable.

Returns
-------
bool
") IsMovable;
		virtual Standard_Boolean IsMovable();

		/****************** KindOfDimension ******************/
		/**** md5 signature: 5346b8aa31fa1e8edfb8a13dfcfc1be1 ****/
		%feature("compactdefaultargs") KindOfDimension;
		%feature("autodoc", "Indicates that we are concerned with a 3d length.

Returns
-------
AIS_KindOfDimension
") KindOfDimension;
		virtual AIS_KindOfDimension KindOfDimension();

};


%make_alias(AIS_Chamf3dDimension)

%extend AIS_Chamf3dDimension {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************
* class AIS_ColoredShape *
*************************/
class AIS_ColoredShape : public AIS_Shape {
	public:
		/****************** AIS_ColoredShape ******************/
		/**** md5 signature: fb3b55130e0ac29dc003b42df171867f ****/
		%feature("compactdefaultargs") AIS_ColoredShape;
		%feature("autodoc", "Default constructor.

Parameters
----------
theShape: TopoDS_Shape

Returns
-------
None
") AIS_ColoredShape;
		 AIS_ColoredShape(const TopoDS_Shape & theShape);

		/****************** AIS_ColoredShape ******************/
		/**** md5 signature: 57d5a885b365bbdae440a6669a47baaf ****/
		%feature("compactdefaultargs") AIS_ColoredShape;
		%feature("autodoc", "Copy constructor.

Parameters
----------
theShape: AIS_Shape

Returns
-------
None
") AIS_ColoredShape;
		 AIS_ColoredShape(const opencascade::handle<AIS_Shape> & theShape);

		/****************** ChangeCustomAspectsMap ******************/
		/**** md5 signature: 2476431f03a5311f849b8058f8394850 ****/
		%feature("compactdefaultargs") ChangeCustomAspectsMap;
		%feature("autodoc", "Return the map of custom aspects.

Returns
-------
AIS_DataMapOfShapeDrawer
") ChangeCustomAspectsMap;
		AIS_DataMapOfShapeDrawer & ChangeCustomAspectsMap();

		/****************** ClearCustomAspects ******************/
		/**** md5 signature: fc6f686010bc49df004ff6cccab2c0a6 ****/
		%feature("compactdefaultargs") ClearCustomAspects;
		%feature("autodoc", "Reset the map of custom sub-shape aspects.

Returns
-------
None
") ClearCustomAspects;
		virtual void ClearCustomAspects();

		/****************** CustomAspects ******************/
		/**** md5 signature: 23e6d1633ab573a66905b41e46a87dae ****/
		%feature("compactdefaultargs") CustomAspects;
		%feature("autodoc", "Customize properties of specified sub-shape. the shape will be stored in the map but ignored, if it is not sub-shape of main shape! this method can be used to mark sub-shapes with customizable properties.

Parameters
----------
theShape: TopoDS_Shape

Returns
-------
opencascade::handle<AIS_ColoredDrawer>
") CustomAspects;
		virtual opencascade::handle<AIS_ColoredDrawer> CustomAspects(const TopoDS_Shape & theShape);

		/****************** CustomAspectsMap ******************/
		/**** md5 signature: 47035b68a9196eeabf7efbd351c7543e ****/
		%feature("compactdefaultargs") CustomAspectsMap;
		%feature("autodoc", "Return the map of custom aspects.

Returns
-------
AIS_DataMapOfShapeDrawer
") CustomAspectsMap;
		const AIS_DataMapOfShapeDrawer & CustomAspectsMap();

		/****************** SetColor ******************/
		/**** md5 signature: 259272248bacb2cef242adbc667f0ef9 ****/
		%feature("compactdefaultargs") SetColor;
		%feature("autodoc", "Setup color of entire shape.

Parameters
----------
theColor: Quantity_Color

Returns
-------
None
") SetColor;
		virtual void SetColor(const Quantity_Color & theColor);

		/****************** SetCustomColor ******************/
		/**** md5 signature: 6e83a5131df277baf8e10888e6a04420 ****/
		%feature("compactdefaultargs") SetCustomColor;
		%feature("autodoc", "Customize color of specified sub-shape.

Parameters
----------
theShape: TopoDS_Shape
theColor: Quantity_Color

Returns
-------
None
") SetCustomColor;
		void SetCustomColor(const TopoDS_Shape & theShape, const Quantity_Color & theColor);

		/****************** SetCustomTransparency ******************/
		/**** md5 signature: 8d33038bdbc2ac4fcd98bb4df4850d0d ****/
		%feature("compactdefaultargs") SetCustomTransparency;
		%feature("autodoc", "Customize transparency of specified sub-shape.

Parameters
----------
theShape: TopoDS_Shape
theTransparency: float

Returns
-------
None
") SetCustomTransparency;
		void SetCustomTransparency(const TopoDS_Shape & theShape, Standard_Real theTransparency);

		/****************** SetCustomWidth ******************/
		/**** md5 signature: ecca2ec2322496495b6873213e79a4c4 ****/
		%feature("compactdefaultargs") SetCustomWidth;
		%feature("autodoc", "Customize line width of specified sub-shape.

Parameters
----------
theShape: TopoDS_Shape
theLineWidth: float

Returns
-------
None
") SetCustomWidth;
		void SetCustomWidth(const TopoDS_Shape & theShape, const Standard_Real theLineWidth);

		/****************** SetMaterial ******************/
		/**** md5 signature: 027cc7416eed42a51ff9f029065484ce ****/
		%feature("compactdefaultargs") SetMaterial;
		%feature("autodoc", "Sets the material aspect.

Parameters
----------
theAspect: Graphic3d_MaterialAspect

Returns
-------
None
") SetMaterial;
		virtual void SetMaterial(const Graphic3d_MaterialAspect & theAspect);

		/****************** SetTransparency ******************/
		/**** md5 signature: ba76d0fd3455858ee750a8806e400e81 ****/
		%feature("compactdefaultargs") SetTransparency;
		%feature("autodoc", "Sets transparency value.

Parameters
----------
theValue: float

Returns
-------
None
") SetTransparency;
		virtual void SetTransparency(const Standard_Real theValue);

		/****************** SetWidth ******************/
		/**** md5 signature: 57b7c9277a0da4b605caca1f2d04261e ****/
		%feature("compactdefaultargs") SetWidth;
		%feature("autodoc", "Setup line width of entire shape.

Parameters
----------
theLineWidth: float

Returns
-------
None
") SetWidth;
		virtual void SetWidth(const Standard_Real theLineWidth);

		/****************** UnsetCustomAspects ******************/
		/**** md5 signature: c6fa220c089211fa5af52ae527cd7403 ****/
		%feature("compactdefaultargs") UnsetCustomAspects;
		%feature("autodoc", "Reset custom properties of specified sub-shape. @param thetounregister unregister or not sub-shape from the map.

Parameters
----------
theShape: TopoDS_Shape
theToUnregister: bool,optional
	default value is Standard_False

Returns
-------
None
") UnsetCustomAspects;
		void UnsetCustomAspects(const TopoDS_Shape & theShape, const Standard_Boolean theToUnregister = Standard_False);

		/****************** UnsetTransparency ******************/
		/**** md5 signature: bdf34ac27dd66c689517e7b105e66cb2 ****/
		%feature("compactdefaultargs") UnsetTransparency;
		%feature("autodoc", "Removes the setting for transparency in the reconstructed compound shape.

Returns
-------
None
") UnsetTransparency;
		virtual void UnsetTransparency();

		/****************** UnsetWidth ******************/
		/**** md5 signature: f4f13d47402fae34af3d548b3b62cf10 ****/
		%feature("compactdefaultargs") UnsetWidth;
		%feature("autodoc", "Setup line width of entire shape.

Returns
-------
None
") UnsetWidth;
		virtual void UnsetWidth();

};


%make_alias(AIS_ColoredShape)

%extend AIS_ColoredShape {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************
* class AIS_ConcentricRelation *
*******************************/
class AIS_ConcentricRelation : public AIS_Relation {
	public:
		/****************** AIS_ConcentricRelation ******************/
		/**** md5 signature: cfd26e2ef042af4fd4c3346ee5476b34 ****/
		%feature("compactdefaultargs") AIS_ConcentricRelation;
		%feature("autodoc", "Constructs the display object for concentric relations between shapes. this object is defined by the two shapes, afshape and asshape and the plane aplane. aplane is provided to create an axis along which the relation of concentricity can be extended.

Parameters
----------
aFShape: TopoDS_Shape
aSShape: TopoDS_Shape
aPlane: Geom_Plane

Returns
-------
None
") AIS_ConcentricRelation;
		 AIS_ConcentricRelation(const TopoDS_Shape & aFShape, const TopoDS_Shape & aSShape, const opencascade::handle<Geom_Plane> & aPlane);

		/****************** Compute ******************/
		/**** md5 signature: 09436ef6513347d4c96315939d8b75d5 ****/
		%feature("compactdefaultargs") Compute;
		%feature("autodoc", "Computes the presentation according to a point of view given by <aprojector>. to be used when the associated degenerated presentations have been transformed by <atrsf> which is not a pure translation. the hlr prs can't be deducted automatically warning :<atrsf> must be applied to the object to display before computation !!!.

Parameters
----------
aProjector: Prs3d_Projector
aTrsf: Geom_Transformation
aPresentation: Prs3d_Presentation

Returns
-------
None
") Compute;
		virtual void Compute(const opencascade::handle<Prs3d_Projector> & aProjector, const opencascade::handle<Geom_Transformation> & aTrsf, const opencascade::handle<Prs3d_Presentation> & aPresentation);

};


%make_alias(AIS_ConcentricRelation)

%extend AIS_ConcentricRelation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************
* class AIS_DiameterDimension *
******************************/
class AIS_DiameterDimension : public AIS_Dimension {
	public:
		/****************** AIS_DiameterDimension ******************/
		/**** md5 signature: 803814984eec22210488681ee880c4a0 ****/
		%feature("compactdefaultargs") AIS_DiameterDimension;
		%feature("autodoc", "Construct diameter dimension for the circle. @param thecircle [in] the circle to measure.

Parameters
----------
theCircle: gp_Circ

Returns
-------
None
") AIS_DiameterDimension;
		 AIS_DiameterDimension(const gp_Circ & theCircle);

		/****************** AIS_DiameterDimension ******************/
		/**** md5 signature: fc3f5fd398839282841b8d5548fbd6fd ****/
		%feature("compactdefaultargs") AIS_DiameterDimension;
		%feature("autodoc", "Construct diameter dimension for the circle and orient it correspondingly to the passed plane. @param thecircle [in] the circle to measure. @param theplane [in] the plane defining preferred orientation for dimension.

Parameters
----------
theCircle: gp_Circ
thePlane: gp_Pln

Returns
-------
None
") AIS_DiameterDimension;
		 AIS_DiameterDimension(const gp_Circ & theCircle, const gp_Pln & thePlane);

		/****************** AIS_DiameterDimension ******************/
		/**** md5 signature: 858a80e04023c906f5ee173cc68fa734 ****/
		%feature("compactdefaultargs") AIS_DiameterDimension;
		%feature("autodoc", "Construct diameter on the passed shape, if applicable. @param theshape [in] the shape to measure.

Parameters
----------
theShape: TopoDS_Shape

Returns
-------
None
") AIS_DiameterDimension;
		 AIS_DiameterDimension(const TopoDS_Shape & theShape);

		/****************** AIS_DiameterDimension ******************/
		/**** md5 signature: 396d0a7025ad3ead7bcf0f9ded73b6e8 ****/
		%feature("compactdefaultargs") AIS_DiameterDimension;
		%feature("autodoc", "Construct diameter on the passed shape, if applicable - and define the preferred plane to orient the dimension. @param theshape [in] the shape to measure. @param theplane [in] the plane defining preferred orientation for dimension.

Parameters
----------
theShape: TopoDS_Shape
thePlane: gp_Pln

Returns
-------
None
") AIS_DiameterDimension;
		 AIS_DiameterDimension(const TopoDS_Shape & theShape, const gp_Pln & thePlane);

		/****************** AnchorPoint ******************/
		/**** md5 signature: 92adc8b9baf75c6634009a53820f63a3 ****/
		%feature("compactdefaultargs") AnchorPoint;
		%feature("autodoc", "Returns anchor point on circle for diameter dimension.

Returns
-------
gp_Pnt
") AnchorPoint;
		gp_Pnt AnchorPoint();

		/****************** Circle ******************/
		/**** md5 signature: 1eaea6bdc97e0fc2fac6cefd24825e1a ****/
		%feature("compactdefaultargs") Circle;
		%feature("autodoc", "Returns measured geometry circle.

Returns
-------
gp_Circ
") Circle;
		const gp_Circ Circle();

		/****************** GetDisplayUnits ******************/
		/**** md5 signature: 6fbf70f12ad85e7a1835a85781f8abb8 ****/
		%feature("compactdefaultargs") GetDisplayUnits;
		%feature("autodoc", "Returns the display units string.

Returns
-------
TCollection_AsciiString
") GetDisplayUnits;
		virtual const TCollection_AsciiString & GetDisplayUnits();

		/****************** GetModelUnits ******************/
		/**** md5 signature: 27dbe0cf13d3ca82bbb0bf570025f3a8 ****/
		%feature("compactdefaultargs") GetModelUnits;
		%feature("autodoc", "Returns the model units string.

Returns
-------
TCollection_AsciiString
") GetModelUnits;
		virtual const TCollection_AsciiString & GetModelUnits();

		/****************** GetTextPosition ******************/
		/**** md5 signature: 8c2fd05c2d7874fe62f7d2730b192774 ****/
		%feature("compactdefaultargs") GetTextPosition;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Pnt
") GetTextPosition;
		virtual const gp_Pnt GetTextPosition();

		/****************** SetDisplayUnits ******************/
		/**** md5 signature: afe69b618dcd1bcf849c7c525bd3f1db ****/
		%feature("compactdefaultargs") SetDisplayUnits;
		%feature("autodoc", "No available documentation.

Parameters
----------
theUnits: TCollection_AsciiString

Returns
-------
None
") SetDisplayUnits;
		virtual void SetDisplayUnits(const TCollection_AsciiString & theUnits);

		/****************** SetMeasuredGeometry ******************/
		/**** md5 signature: c1b9a4fe27f3e19a1218bcbc41264af8 ****/
		%feature("compactdefaultargs") SetMeasuredGeometry;
		%feature("autodoc", "Measure diameter of the circle. the actual dimension plane is used for determining anchor points on the circle to attach the dimension lines to. the dimension will become invalid if the diameter of the circle is less than precision::confusion(). @param thecircle [in] the circle to measure.

Parameters
----------
theCircle: gp_Circ

Returns
-------
None
") SetMeasuredGeometry;
		void SetMeasuredGeometry(const gp_Circ & theCircle);

		/****************** SetMeasuredGeometry ******************/
		/**** md5 signature: 38eeeac1c934d2bc9090d5e208e54b6e ****/
		%feature("compactdefaultargs") SetMeasuredGeometry;
		%feature("autodoc", "Measure diameter on the passed shape, if applicable. the dimension will become invalid if the passed shape is not measurable or if measured diameter value is less than precision::confusion(). @param theshape [in] the shape to measure.

Parameters
----------
theShape: TopoDS_Shape

Returns
-------
None
") SetMeasuredGeometry;
		void SetMeasuredGeometry(const TopoDS_Shape & theShape);

		/****************** SetModelUnits ******************/
		/**** md5 signature: bac7da9c21ed70bf629179ea24a5af0c ****/
		%feature("compactdefaultargs") SetModelUnits;
		%feature("autodoc", "No available documentation.

Parameters
----------
theUnits: TCollection_AsciiString

Returns
-------
None
") SetModelUnits;
		virtual void SetModelUnits(const TCollection_AsciiString & theUnits);

		/****************** SetTextPosition ******************/
		/**** md5 signature: f1658ae61229bf1e77ff3828626b747f ****/
		%feature("compactdefaultargs") SetTextPosition;
		%feature("autodoc", "No available documentation.

Parameters
----------
theTextPos: gp_Pnt

Returns
-------
None
") SetTextPosition;
		virtual void SetTextPosition(const gp_Pnt & theTextPos);

		/****************** Shape ******************/
		/**** md5 signature: 1058569f5d639354fedf11e73741b7df ****/
		%feature("compactdefaultargs") Shape;
		%feature("autodoc", "Returns the measured shape.

Returns
-------
TopoDS_Shape
") Shape;
		const TopoDS_Shape Shape();

};


%make_alias(AIS_DiameterDimension)

%extend AIS_DiameterDimension {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************************
* class AIS_EllipseRadiusDimension *
***********************************/
%nodefaultctor AIS_EllipseRadiusDimension;
class AIS_EllipseRadiusDimension : public AIS_Relation {
	public:
		/****************** ComputeGeometry ******************/
		/**** md5 signature: 690247bb657a85c155cdc17b6745df6a ****/
		%feature("compactdefaultargs") ComputeGeometry;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") ComputeGeometry;
		void ComputeGeometry();

		/****************** IsMovable ******************/
		/**** md5 signature: efb300c047e87ac82d826b80cdd545da ****/
		%feature("compactdefaultargs") IsMovable;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsMovable;
		virtual Standard_Boolean IsMovable();

		/****************** KindOfDimension ******************/
		/**** md5 signature: 5346b8aa31fa1e8edfb8a13dfcfc1be1 ****/
		%feature("compactdefaultargs") KindOfDimension;
		%feature("autodoc", "No available documentation.

Returns
-------
AIS_KindOfDimension
") KindOfDimension;
		virtual AIS_KindOfDimension KindOfDimension();

};


%make_alias(AIS_EllipseRadiusDimension)

%extend AIS_EllipseRadiusDimension {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************************
* class AIS_EqualDistanceRelation *
**********************************/
class AIS_EqualDistanceRelation : public AIS_Relation {
	public:
		/****************** AIS_EqualDistanceRelation ******************/
		/**** md5 signature: 40dc0dd77a41ee3be4d8dec5ca2ee9ef ****/
		%feature("compactdefaultargs") AIS_EqualDistanceRelation;
		%feature("autodoc", "Constructs a framework to display equivalent distances between the shapes ashape1, ashape2, ashape3, ashape4 and the plane aplane. the distance is the length of a projection from the shape to the plane.

Parameters
----------
aShape1: TopoDS_Shape
aShape2: TopoDS_Shape
aShape3: TopoDS_Shape
aShape4: TopoDS_Shape
aPlane: Geom_Plane

Returns
-------
None
") AIS_EqualDistanceRelation;
		 AIS_EqualDistanceRelation(const TopoDS_Shape & aShape1, const TopoDS_Shape & aShape2, const TopoDS_Shape & aShape3, const TopoDS_Shape & aShape4, const opencascade::handle<Geom_Plane> & aPlane);

		/****************** Compute ******************/
		/**** md5 signature: 09436ef6513347d4c96315939d8b75d5 ****/
		%feature("compactdefaultargs") Compute;
		%feature("autodoc", "Computes the presentation according to a point of view given by <aprojector>. to be used when the associated degenerated presentations have been transformed by <atrsf> which is not a pure translation. the hlr prs can't be deducted automatically warning :<atrsf> must be applied to the object to display before computation !!!.

Parameters
----------
aProjector: Prs3d_Projector
aTrsf: Geom_Transformation
aPresentation: Prs3d_Presentation

Returns
-------
None
") Compute;
		virtual void Compute(const opencascade::handle<Prs3d_Projector> & aProjector, const opencascade::handle<Geom_Transformation> & aTrsf, const opencascade::handle<Prs3d_Presentation> & aPresentation);

		/****************** ComputeOneEdgeOneVertexLength ******************/
		/**** md5 signature: c8433bd8e1b8b43c506c26453cfea334 ****/
		%feature("compactdefaultargs") ComputeOneEdgeOneVertexLength;
		%feature("autodoc", "Compute the interval location between a vertex and an edge. edge may be a line or a circle.

Parameters
----------
aPresentation: Prs3d_Presentation
aDrawer: Prs3d_Drawer
ArrowSize: float
FirstShape: TopoDS_Shape
SecondShape: TopoDS_Shape
Plane: Geom_Plane
AutomaticPos: bool
IsSetBndBox: bool
BndBox: Bnd_Box
Position: gp_Pnt
FirstAttach: gp_Pnt
SecondAttach: gp_Pnt
FirstExtreme: gp_Pnt
SecondExtreme: gp_Pnt
SymbolPrs: DsgPrs_ArrowSide

Returns
-------
None
") ComputeOneEdgeOneVertexLength;
		static void ComputeOneEdgeOneVertexLength(const opencascade::handle<Prs3d_Presentation> & aPresentation, const opencascade::handle<Prs3d_Drawer> & aDrawer, const Standard_Real ArrowSize, const TopoDS_Shape & FirstShape, const TopoDS_Shape & SecondShape, const opencascade::handle<Geom_Plane> & Plane, const Standard_Boolean AutomaticPos, const Standard_Boolean IsSetBndBox, const Bnd_Box & BndBox, gp_Pnt & Position, gp_Pnt & FirstAttach, gp_Pnt & SecondAttach, gp_Pnt & FirstExtreme, gp_Pnt & SecondExtreme, DsgPrs_ArrowSide & SymbolPrs);

		/****************** ComputeTwoEdgesLength ******************/
		/**** md5 signature: 8f004ba6dc5773a9742094e3b3f3f885 ****/
		%feature("compactdefaultargs") ComputeTwoEdgesLength;
		%feature("autodoc", "Computes the location of an intreval between between two edges. firstattach , secondattach are the returned extreme points of the interval.

Parameters
----------
aPresentation: Prs3d_Presentation
aDrawer: Prs3d_Drawer
ArrowSize: float
FirstEdge: TopoDS_Edge
SecondEdge: TopoDS_Edge
Plane: Geom_Plane
AutomaticPos: bool
IsSetBndBox: bool
BndBox: Bnd_Box
Position: gp_Pnt
FirstAttach: gp_Pnt
SecondAttach: gp_Pnt
FirstExtreme: gp_Pnt
SecondExtreme: gp_Pnt
SymbolPrs: DsgPrs_ArrowSide

Returns
-------
None
") ComputeTwoEdgesLength;
		static void ComputeTwoEdgesLength(const opencascade::handle<Prs3d_Presentation> & aPresentation, const opencascade::handle<Prs3d_Drawer> & aDrawer, const Standard_Real ArrowSize, const TopoDS_Edge & FirstEdge, const TopoDS_Edge & SecondEdge, const opencascade::handle<Geom_Plane> & Plane, const Standard_Boolean AutomaticPos, const Standard_Boolean IsSetBndBox, const Bnd_Box & BndBox, gp_Pnt & Position, gp_Pnt & FirstAttach, gp_Pnt & SecondAttach, gp_Pnt & FirstExtreme, gp_Pnt & SecondExtreme, DsgPrs_ArrowSide & SymbolPrs);

		/****************** ComputeTwoVerticesLength ******************/
		/**** md5 signature: 34c727d32d0519a0a17053a3a544211e ****/
		%feature("compactdefaultargs") ComputeTwoVerticesLength;
		%feature("autodoc", "Computes the interval position between two vertexs. firstattach, secondattach are the returned extreme points of the interval.

Parameters
----------
aPresentation: Prs3d_Presentation
aDrawer: Prs3d_Drawer
ArrowSize: float
FirstVertex: TopoDS_Vertex
SecondVertex: TopoDS_Vertex
Plane: Geom_Plane
AutomaticPos: bool
IsSetBndBox: bool
BndBox: Bnd_Box
TypeDist: AIS_TypeOfDist
Position: gp_Pnt
FirstAttach: gp_Pnt
SecondAttach: gp_Pnt
FirstExtreme: gp_Pnt
SecondExtreme: gp_Pnt
SymbolPrs: DsgPrs_ArrowSide

Returns
-------
None
") ComputeTwoVerticesLength;
		static void ComputeTwoVerticesLength(const opencascade::handle<Prs3d_Presentation> & aPresentation, const opencascade::handle<Prs3d_Drawer> & aDrawer, const Standard_Real ArrowSize, const TopoDS_Vertex & FirstVertex, const TopoDS_Vertex & SecondVertex, const opencascade::handle<Geom_Plane> & Plane, const Standard_Boolean AutomaticPos, const Standard_Boolean IsSetBndBox, const Bnd_Box & BndBox, const AIS_TypeOfDist TypeDist, gp_Pnt & Position, gp_Pnt & FirstAttach, gp_Pnt & SecondAttach, gp_Pnt & FirstExtreme, gp_Pnt & SecondExtreme, DsgPrs_ArrowSide & SymbolPrs);

		/****************** SetShape3 ******************/
		/**** md5 signature: 4bcf8db6e5b4b1f88cadcdf31664d60c ****/
		%feature("compactdefaultargs") SetShape3;
		%feature("autodoc", "Sets the shape ashape to be used as the shape ashape3 in the framework created at construction time.

Parameters
----------
aShape: TopoDS_Shape

Returns
-------
None
") SetShape3;
		void SetShape3(const TopoDS_Shape & aShape);

		/****************** SetShape4 ******************/
		/**** md5 signature: 4fda39696a169c1772b9abb5c6479c62 ****/
		%feature("compactdefaultargs") SetShape4;
		%feature("autodoc", "Sets the shape ashape to be used as the shape ashape4 in the framework created at construction time.

Parameters
----------
aShape: TopoDS_Shape

Returns
-------
None
") SetShape4;
		void SetShape4(const TopoDS_Shape & aShape);

		/****************** Shape3 ******************/
		/**** md5 signature: f8d37d7bea0d495162c6ada46f516593 ****/
		%feature("compactdefaultargs") Shape3;
		%feature("autodoc", "Returns the shape ashape3 from the framework created at construction time.

Returns
-------
TopoDS_Shape
") Shape3;
		const TopoDS_Shape Shape3();

		/****************** Shape4 ******************/
		/**** md5 signature: 554c0aac391cd7e4d6a501c1d3b9abfb ****/
		%feature("compactdefaultargs") Shape4;
		%feature("autodoc", "Returns the shape ashape4 from the framework created at construction time.

Returns
-------
TopoDS_Shape
") Shape4;
		const TopoDS_Shape Shape4();

};


%make_alias(AIS_EqualDistanceRelation)

%extend AIS_EqualDistanceRelation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************
* class AIS_EqualRadiusRelation *
********************************/
class AIS_EqualRadiusRelation : public AIS_Relation {
	public:
		/****************** AIS_EqualRadiusRelation ******************/
		/**** md5 signature: 24aa3e0a42c25fe1f6a33ebb4db63cb2 ****/
		%feature("compactdefaultargs") AIS_EqualRadiusRelation;
		%feature("autodoc", "Creates equal relation of two arc's radiuses. if one of edges is not in the given plane, the presentation method projects it onto the plane.

Parameters
----------
aFirstEdge: TopoDS_Edge
aSecondEdge: TopoDS_Edge
aPlane: Geom_Plane

Returns
-------
None
") AIS_EqualRadiusRelation;
		 AIS_EqualRadiusRelation(const TopoDS_Edge & aFirstEdge, const TopoDS_Edge & aSecondEdge, const opencascade::handle<Geom_Plane> & aPlane);

		/****************** Compute ******************/
		/**** md5 signature: 09436ef6513347d4c96315939d8b75d5 ****/
		%feature("compactdefaultargs") Compute;
		%feature("autodoc", "Computes the presentation according to a point of view given by <aprojector>. to be used when the associated degenerated presentations have been transformed by <atrsf> which is not a pure translation. the hlr prs can't be deducted automatically warning :<atrsf> must be applied to the object to display before computation !!!.

Parameters
----------
aProjector: Prs3d_Projector
aTrsf: Geom_Transformation
aPresentation: Prs3d_Presentation

Returns
-------
None
") Compute;
		virtual void Compute(const opencascade::handle<Prs3d_Projector> & aProjector, const opencascade::handle<Geom_Transformation> & aTrsf, const opencascade::handle<Prs3d_Presentation> & aPresentation);

};


%make_alias(AIS_EqualRadiusRelation)

%extend AIS_EqualRadiusRelation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************
* class AIS_FixRelation *
************************/
class AIS_FixRelation : public AIS_Relation {
	public:
		/****************** AIS_FixRelation ******************/
		/**** md5 signature: 33a80d9464394ca03762450102960065 ****/
		%feature("compactdefaultargs") AIS_FixRelation;
		%feature("autodoc", "Initializes the vertex ashape, the plane aplane and the wire awire, which connects the two vertices in a fixed relation.

Parameters
----------
aShape: TopoDS_Shape
aPlane: Geom_Plane
aWire: TopoDS_Wire

Returns
-------
None
") AIS_FixRelation;
		 AIS_FixRelation(const TopoDS_Shape & aShape, const opencascade::handle<Geom_Plane> & aPlane, const TopoDS_Wire & aWire);

		/****************** AIS_FixRelation ******************/
		/**** md5 signature: 3c5879380f9fabcfca9a6e9d088df3ad ****/
		%feature("compactdefaultargs") AIS_FixRelation;
		%feature("autodoc", "Initializes the vertex ashape, the plane aplane and the wire awire, the position aposition, the arrow size anarrowsize and the wire awire, which connects the two vertices in a fixed relation.

Parameters
----------
aShape: TopoDS_Shape
aPlane: Geom_Plane
aWire: TopoDS_Wire
aPosition: gp_Pnt
anArrowSize: float,optional
	default value is 0.01

Returns
-------
None
") AIS_FixRelation;
		 AIS_FixRelation(const TopoDS_Shape & aShape, const opencascade::handle<Geom_Plane> & aPlane, const TopoDS_Wire & aWire, const gp_Pnt & aPosition, const Standard_Real anArrowSize = 0.01);

		/****************** AIS_FixRelation ******************/
		/**** md5 signature: 0c266f14e57938cbeab3460d3fb53a6c ****/
		%feature("compactdefaultargs") AIS_FixRelation;
		%feature("autodoc", "Initializes the edge ashape and the plane aplane.

Parameters
----------
aShape: TopoDS_Shape
aPlane: Geom_Plane

Returns
-------
None
") AIS_FixRelation;
		 AIS_FixRelation(const TopoDS_Shape & aShape, const opencascade::handle<Geom_Plane> & aPlane);

		/****************** AIS_FixRelation ******************/
		/**** md5 signature: 730b240179796d094a1f6fce8bee3a46 ****/
		%feature("compactdefaultargs") AIS_FixRelation;
		%feature("autodoc", "Initializes the edge ashape, the plane aplane, the position aposition and the arrow size anarrowsize.

Parameters
----------
aShape: TopoDS_Shape
aPlane: Geom_Plane
aPosition: gp_Pnt
anArrowSize: float,optional
	default value is 0.01

Returns
-------
None
") AIS_FixRelation;
		 AIS_FixRelation(const TopoDS_Shape & aShape, const opencascade::handle<Geom_Plane> & aPlane, const gp_Pnt & aPosition, const Standard_Real anArrowSize = 0.01);

		/****************** Compute ******************/
		/**** md5 signature: 09436ef6513347d4c96315939d8b75d5 ****/
		%feature("compactdefaultargs") Compute;
		%feature("autodoc", "Computes the presentation according to a point of view given by <aprojector>. to be used when the associated degenerated presentations have been transformed by <atrsf> which is not a pure translation. the hlr prs can't be deducted automatically warning :<atrsf> must be applied to the object to display before computation !!!.

Parameters
----------
aProjector: Prs3d_Projector
aTrsf: Geom_Transformation
aPresentation: Prs3d_Presentation

Returns
-------
None
") Compute;
		virtual void Compute(const opencascade::handle<Prs3d_Projector> & aProjector, const opencascade::handle<Geom_Transformation> & aTrsf, const opencascade::handle<Prs3d_Presentation> & aPresentation);

		/****************** IsMovable ******************/
		/**** md5 signature: efb300c047e87ac82d826b80cdd545da ****/
		%feature("compactdefaultargs") IsMovable;
		%feature("autodoc", "Returns true if the interactive objects in the relation are movable.

Returns
-------
bool
") IsMovable;
		virtual Standard_Boolean IsMovable();

		/****************** SetWire ******************/
		/**** md5 signature: 02e50a2e0849e0c95235baf7c1fd9f23 ****/
		%feature("compactdefaultargs") SetWire;
		%feature("autodoc", "Constructs the wire awire. this connects vertices which are in a fixed relation.

Parameters
----------
aWire: TopoDS_Wire

Returns
-------
None
") SetWire;
		void SetWire(const TopoDS_Wire & aWire);

		/****************** Wire ******************/
		/**** md5 signature: 8377380f40be065c1e388c12f5ebdb73 ****/
		%feature("compactdefaultargs") Wire;
		%feature("autodoc", "Returns the wire which connects vertices in a fixed relation.

Returns
-------
TopoDS_Wire
") Wire;
		TopoDS_Wire Wire();

};


%make_alias(AIS_FixRelation)

%extend AIS_FixRelation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************
* class AIS_IdenticRelation *
****************************/
class AIS_IdenticRelation : public AIS_Relation {
	public:
		/****************** AIS_IdenticRelation ******************/
		/**** md5 signature: fd0fbfac9d3fef6872f5a65bb55f4cb7 ****/
		%feature("compactdefaultargs") AIS_IdenticRelation;
		%feature("autodoc", "Initializes the relation of identity between the two entities, firstshape and secondshape. the plane aplane is initialized in case a visual reference is needed to show identity.

Parameters
----------
FirstShape: TopoDS_Shape
SecondShape: TopoDS_Shape
aPlane: Geom_Plane

Returns
-------
None
") AIS_IdenticRelation;
		 AIS_IdenticRelation(const TopoDS_Shape & FirstShape, const TopoDS_Shape & SecondShape, const opencascade::handle<Geom_Plane> & aPlane);

		/****************** AddUser ******************/
		/**** md5 signature: 96e81e223c191f89f7f54782a86a0e55 ****/
		%feature("compactdefaultargs") AddUser;
		%feature("autodoc", "No available documentation.

Parameters
----------
theUser: Standard_Transient

Returns
-------
None
") AddUser;
		void AddUser(const opencascade::handle<Standard_Transient> & theUser);

		/****************** ClearUsers ******************/
		/**** md5 signature: f911b16400daf995643262aaebb56bf9 ****/
		%feature("compactdefaultargs") ClearUsers;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") ClearUsers;
		void ClearUsers();

		/****************** Compute ******************/
		/**** md5 signature: 09436ef6513347d4c96315939d8b75d5 ****/
		%feature("compactdefaultargs") Compute;
		%feature("autodoc", "Computes the presentation according to a point of view given by <aprojector>. to be used when the associated degenerated presentations have been transformed by <atrsf> which is not a pure translation. the hlr prs can't be deducted automatically warning :<atrsf> must be applied to the object to display before computation !!!.

Parameters
----------
aProjector: Prs3d_Projector
aTrsf: Geom_Transformation
aPresentation: Prs3d_Presentation

Returns
-------
None
") Compute;
		virtual void Compute(const opencascade::handle<Prs3d_Projector> & aProjector, const opencascade::handle<Geom_Transformation> & aTrsf, const opencascade::handle<Prs3d_Presentation> & aPresentation);

		/****************** HasUsers ******************/
		/**** md5 signature: aedf7f0293a5ad9e45c4f97ca68483fb ****/
		%feature("compactdefaultargs") HasUsers;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") HasUsers;
		Standard_Boolean HasUsers();

		/****************** IsMovable ******************/
		/**** md5 signature: efb300c047e87ac82d826b80cdd545da ****/
		%feature("compactdefaultargs") IsMovable;
		%feature("autodoc", "Returns true if the interactive object is movable.

Returns
-------
bool
") IsMovable;
		virtual Standard_Boolean IsMovable();

		/****************** Users ******************/
		/**** md5 signature: 65858c69a6e24c72829560eee6991487 ****/
		%feature("compactdefaultargs") Users;
		%feature("autodoc", "No available documentation.

Returns
-------
TColStd_ListOfTransient
") Users;
		const TColStd_ListOfTransient & Users();

};


%make_alias(AIS_IdenticRelation)

%extend AIS_IdenticRelation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************
* class AIS_LengthDimension *
****************************/
class AIS_LengthDimension : public AIS_Dimension {
	public:
		/****************** AIS_LengthDimension ******************/
		/**** md5 signature: ccfee9c16308aae00afca8cfcfbac5ed ****/
		%feature("compactdefaultargs") AIS_LengthDimension;
		%feature("autodoc", "Construct length dimension between face and edge. here dimension can be built without user-defined plane. @param theface [in] the face (first shape). @param theedge [in] the edge (second shape).

Parameters
----------
theFace: TopoDS_Face
theEdge: TopoDS_Edge

Returns
-------
None
") AIS_LengthDimension;
		 AIS_LengthDimension(const TopoDS_Face & theFace, const TopoDS_Edge & theEdge);

		/****************** AIS_LengthDimension ******************/
		/**** md5 signature: e46de5218b2ee4a3c7ddcb98adae2d98 ****/
		%feature("compactdefaultargs") AIS_LengthDimension;
		%feature("autodoc", "Construct length dimension between two faces. @param thefirstface [in] the first face (first shape). @param thesecondface [in] the second face (second shape).

Parameters
----------
theFirstFace: TopoDS_Face
theSecondFace: TopoDS_Face

Returns
-------
None
") AIS_LengthDimension;
		 AIS_LengthDimension(const TopoDS_Face & theFirstFace, const TopoDS_Face & theSecondFace);

		/****************** AIS_LengthDimension ******************/
		/**** md5 signature: 3dbae5f23683880487b151e66c1b6459 ****/
		%feature("compactdefaultargs") AIS_LengthDimension;
		%feature("autodoc", "Construct length dimension between two points in the specified plane. @param thefirstpoint [in] the first point. @param thesecondpoint [in] the second point. @param theplane [in] the plane to orient dimension.

Parameters
----------
theFirstPoint: gp_Pnt
theSecondPoint: gp_Pnt
thePlane: gp_Pln

Returns
-------
None
") AIS_LengthDimension;
		 AIS_LengthDimension(const gp_Pnt & theFirstPoint, const gp_Pnt & theSecondPoint, const gp_Pln & thePlane);

		/****************** AIS_LengthDimension ******************/
		/**** md5 signature: 389763e784ff86f06e1c997097f8285f ****/
		%feature("compactdefaultargs") AIS_LengthDimension;
		%feature("autodoc", "Construct length dimension between two arbitrary shapes in the specified plane. @param thefirstshape [in] the first shape. @param thesecondshape [in] the second shape. @param theplane [in] the plane to orient dimension.

Parameters
----------
theFirstShape: TopoDS_Shape
theSecondShape: TopoDS_Shape
thePlane: gp_Pln

Returns
-------
None
") AIS_LengthDimension;
		 AIS_LengthDimension(const TopoDS_Shape & theFirstShape, const TopoDS_Shape & theSecondShape, const gp_Pln & thePlane);

		/****************** AIS_LengthDimension ******************/
		/**** md5 signature: 3a70ac5ca88b31117de45c4ee970ff1d ****/
		%feature("compactdefaultargs") AIS_LengthDimension;
		%feature("autodoc", "Construct length dimension of linear edge. @param theedge [in] the edge to measure. @param theplane [in] the plane to orient dimension.

Parameters
----------
theEdge: TopoDS_Edge
thePlane: gp_Pln

Returns
-------
None
") AIS_LengthDimension;
		 AIS_LengthDimension(const TopoDS_Edge & theEdge, const gp_Pln & thePlane);

		/****************** FirstPoint ******************/
		/**** md5 signature: ce6daac63a94ae39a0d0bfa7edc5f3cd ****/
		%feature("compactdefaultargs") FirstPoint;
		%feature("autodoc", "Returns first attachement point.

Returns
-------
gp_Pnt
") FirstPoint;
		const gp_Pnt FirstPoint();

		/****************** FirstShape ******************/
		/**** md5 signature: 0052eba922702f3e525649e52d93f4e7 ****/
		%feature("compactdefaultargs") FirstShape;
		%feature("autodoc", "Returns first attachement shape.

Returns
-------
TopoDS_Shape
") FirstShape;
		const TopoDS_Shape FirstShape();

		/****************** GetDisplayUnits ******************/
		/**** md5 signature: 6fbf70f12ad85e7a1835a85781f8abb8 ****/
		%feature("compactdefaultargs") GetDisplayUnits;
		%feature("autodoc", "Returns the display units string.

Returns
-------
TCollection_AsciiString
") GetDisplayUnits;
		virtual const TCollection_AsciiString & GetDisplayUnits();

		/****************** GetModelUnits ******************/
		/**** md5 signature: 27dbe0cf13d3ca82bbb0bf570025f3a8 ****/
		%feature("compactdefaultargs") GetModelUnits;
		%feature("autodoc", "Returns the model units string.

Returns
-------
TCollection_AsciiString
") GetModelUnits;
		virtual const TCollection_AsciiString & GetModelUnits();

		/****************** GetTextPosition ******************/
		/**** md5 signature: 8c2fd05c2d7874fe62f7d2730b192774 ****/
		%feature("compactdefaultargs") GetTextPosition;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Pnt
") GetTextPosition;
		virtual const gp_Pnt GetTextPosition();

		/****************** SecondPoint ******************/
		/**** md5 signature: 66319c8fbdc379c409c2efa67f6e79e2 ****/
		%feature("compactdefaultargs") SecondPoint;
		%feature("autodoc", "Returns second attachement point.

Returns
-------
gp_Pnt
") SecondPoint;
		const gp_Pnt SecondPoint();

		/****************** SecondShape ******************/
		/**** md5 signature: 3c9d5f80bfbcac42f6848475061ecf61 ****/
		%feature("compactdefaultargs") SecondShape;
		%feature("autodoc", "Returns second attachement shape.

Returns
-------
TopoDS_Shape
") SecondShape;
		const TopoDS_Shape SecondShape();

		/****************** SetDirection ******************/
		/**** md5 signature: fdd4b1217edc47b9493c5cf7f462b2e9 ****/
		%feature("compactdefaultargs") SetDirection;
		%feature("autodoc", "Set custom direction for dimension. if it is not set, the direction is obtained from the measured geometry (e.g. line between points of dimension) the direction does not change flyout direction of dimension. @param thedirection [in] the dimension direction. @param theusedirection [in] boolean value if custom direction should be used.

Parameters
----------
theDirection: gp_Dir
theUseDirection: bool,optional
	default value is Standard_True

Returns
-------
None
") SetDirection;
		void SetDirection(const gp_Dir & theDirection, const Standard_Boolean theUseDirection = Standard_True);

		/****************** SetDisplayUnits ******************/
		/**** md5 signature: afe69b618dcd1bcf849c7c525bd3f1db ****/
		%feature("compactdefaultargs") SetDisplayUnits;
		%feature("autodoc", "No available documentation.

Parameters
----------
theUnits: TCollection_AsciiString

Returns
-------
None
") SetDisplayUnits;
		virtual void SetDisplayUnits(const TCollection_AsciiString & theUnits);

		/****************** SetMeasuredGeometry ******************/
		/**** md5 signature: cef07b2afa7411d338e4348d1fb09cb3 ****/
		%feature("compactdefaultargs") SetMeasuredGeometry;
		%feature("autodoc", "Measure distance between two points. the dimension will become invalid if the new distance between attachement points is less than precision::confusion(). @param thefirstpoint [in] the first point. @param thesecondpoint [in] the second point. @param theplane [in] the user-defined plane.

Parameters
----------
theFirstPoint: gp_Pnt
theSecondPoint: gp_Pnt
thePlane: gp_Pln

Returns
-------
None
") SetMeasuredGeometry;
		void SetMeasuredGeometry(const gp_Pnt & theFirstPoint, const gp_Pnt & theSecondPoint, const gp_Pln & thePlane);

		/****************** SetMeasuredGeometry ******************/
		/**** md5 signature: ab814d79ff07f7269fe3cb037f48b9a8 ****/
		%feature("compactdefaultargs") SetMeasuredGeometry;
		%feature("autodoc", "Measure length of edge. the dimension will become invalid if the new length of edge is less than precision::confusion(). @param theedge [in] the edge to measure. @param theplane [in] the user-defined plane.

Parameters
----------
theEdge: TopoDS_Edge
thePlane: gp_Pln

Returns
-------
None
") SetMeasuredGeometry;
		void SetMeasuredGeometry(const TopoDS_Edge & theEdge, const gp_Pln & thePlane);

		/****************** SetMeasuredGeometry ******************/
		/**** md5 signature: bfe5f7ff6a46076a22cbf50a395e204f ****/
		%feature("compactdefaultargs") SetMeasuredGeometry;
		%feature("autodoc", "Measure distance between two faces. the dimension will become invalid if the distance can not be measured or it is less than precision::confusion(). @param thefirstface [in] the first face (first shape). @param thesecondface [in] the second face (second shape).

Parameters
----------
theFirstFace: TopoDS_Face
theSecondFace: TopoDS_Face

Returns
-------
None
") SetMeasuredGeometry;
		void SetMeasuredGeometry(const TopoDS_Face & theFirstFace, const TopoDS_Face & theSecondFace);

		/****************** SetMeasuredGeometry ******************/
		/**** md5 signature: 7c671ce46d9bfe5c6d511144762d0662 ****/
		%feature("compactdefaultargs") SetMeasuredGeometry;
		%feature("autodoc", "Measure distance between face and edge. the dimension will become invalid if the distance can not be measured or it is less than precision::confusion(). @param theface [in] the face (first shape). @param theedge [in] the edge (second shape).

Parameters
----------
theFace: TopoDS_Face
theEdge: TopoDS_Edge

Returns
-------
None
") SetMeasuredGeometry;
		void SetMeasuredGeometry(const TopoDS_Face & theFace, const TopoDS_Edge & theEdge);

		/****************** SetMeasuredShapes ******************/
		/**** md5 signature: 27e960b24f38031999030c9d7d2242ae ****/
		%feature("compactdefaultargs") SetMeasuredShapes;
		%feature("autodoc", "Measure distance between generic pair of shapes (edges, vertices, length), where measuring is applicable. @param thefirstshape [in] the first shape. @param thesecondshape [in] the second shape.

Parameters
----------
theFirstShape: TopoDS_Shape
theSecondShape: TopoDS_Shape

Returns
-------
None
") SetMeasuredShapes;
		void SetMeasuredShapes(const TopoDS_Shape & theFirstShape, const TopoDS_Shape & theSecondShape);

		/****************** SetModelUnits ******************/
		/**** md5 signature: bac7da9c21ed70bf629179ea24a5af0c ****/
		%feature("compactdefaultargs") SetModelUnits;
		%feature("autodoc", "No available documentation.

Parameters
----------
theUnits: TCollection_AsciiString

Returns
-------
None
") SetModelUnits;
		virtual void SetModelUnits(const TCollection_AsciiString & theUnits);

		/****************** SetTextPosition ******************/
		/**** md5 signature: f1658ae61229bf1e77ff3828626b747f ****/
		%feature("compactdefaultargs") SetTextPosition;
		%feature("autodoc", "No available documentation.

Parameters
----------
theTextPos: gp_Pnt

Returns
-------
None
") SetTextPosition;
		virtual void SetTextPosition(const gp_Pnt & theTextPos);

};


%make_alias(AIS_LengthDimension)

%extend AIS_LengthDimension {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************
* class AIS_MidPointRelation *
*****************************/
class AIS_MidPointRelation : public AIS_Relation {
	public:
		/****************** AIS_MidPointRelation ******************/
		/**** md5 signature: c298dec9fc726b54772799ca618e3d85 ****/
		%feature("compactdefaultargs") AIS_MidPointRelation;
		%feature("autodoc", "No available documentation.

Parameters
----------
aSymmTool: TopoDS_Shape
FirstShape: TopoDS_Shape
SecondShape: TopoDS_Shape
aPlane: Geom_Plane

Returns
-------
None
") AIS_MidPointRelation;
		 AIS_MidPointRelation(const TopoDS_Shape & aSymmTool, const TopoDS_Shape & FirstShape, const TopoDS_Shape & SecondShape, const opencascade::handle<Geom_Plane> & aPlane);

		/****************** Compute ******************/
		/**** md5 signature: 09436ef6513347d4c96315939d8b75d5 ****/
		%feature("compactdefaultargs") Compute;
		%feature("autodoc", "Computes the presentation according to a point of view given by <aprojector>. to be used when the associated degenerated presentations have been transformed by <atrsf> which is not a pure translation. the hlr prs can't be deducted automatically warning :<atrsf> must be applied to the object to display before computation !!!.

Parameters
----------
aProjector: Prs3d_Projector
aTrsf: Geom_Transformation
aPresentation: Prs3d_Presentation

Returns
-------
None
") Compute;
		virtual void Compute(const opencascade::handle<Prs3d_Projector> & aProjector, const opencascade::handle<Geom_Transformation> & aTrsf, const opencascade::handle<Prs3d_Presentation> & aPresentation);

		/****************** GetTool ******************/
		/**** md5 signature: face5c8735961d0bbaff1f7f56abdc4c ****/
		%feature("compactdefaultargs") GetTool;
		%feature("autodoc", "No available documentation.

Returns
-------
TopoDS_Shape
") GetTool;
		const TopoDS_Shape GetTool();

		/****************** IsMovable ******************/
		/**** md5 signature: efb300c047e87ac82d826b80cdd545da ****/
		%feature("compactdefaultargs") IsMovable;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsMovable;
		virtual Standard_Boolean IsMovable();

		/****************** SetTool ******************/
		/**** md5 signature: 66ac0c699e889ec55abd030633c80442 ****/
		%feature("compactdefaultargs") SetTool;
		%feature("autodoc", "No available documentation.

Parameters
----------
aMidPointTool: TopoDS_Shape

Returns
-------
None
") SetTool;
		void SetTool(const TopoDS_Shape & aMidPointTool);

};


%make_alias(AIS_MidPointRelation)

%extend AIS_MidPointRelation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************
* class AIS_OffsetDimension *
****************************/
class AIS_OffsetDimension : public AIS_Relation {
	public:
		/****************** AIS_OffsetDimension ******************/
		/**** md5 signature: 924f094bd5764b832b892035027b2138 ****/
		%feature("compactdefaultargs") AIS_OffsetDimension;
		%feature("autodoc", "Constructs the offset display object defined by the first shape afshape, the second shape asshape, the dimension aval, and the text atext.

Parameters
----------
FistShape: TopoDS_Shape
SecondShape: TopoDS_Shape
aVal: float
aText: TCollection_ExtendedString

Returns
-------
None
") AIS_OffsetDimension;
		 AIS_OffsetDimension(const TopoDS_Shape & FistShape, const TopoDS_Shape & SecondShape, const Standard_Real aVal, const TCollection_ExtendedString & aText);

		/****************** Compute ******************/
		/**** md5 signature: 09436ef6513347d4c96315939d8b75d5 ****/
		%feature("compactdefaultargs") Compute;
		%feature("autodoc", "Computes the presentation according to a point of view given by <aprojector>. to be used when the associated degenerated presentations have been transformed by <atrsf> which is not a pure translation. the hlr prs can't be deducted automatically warning :<atrsf> must be applied to the object to display before computation !!!.

Parameters
----------
aProjector: Prs3d_Projector
aTrsf: Geom_Transformation
aPresentation: Prs3d_Presentation

Returns
-------
None
") Compute;
		virtual void Compute(const opencascade::handle<Prs3d_Projector> & aProjector, const opencascade::handle<Geom_Transformation> & aTrsf, const opencascade::handle<Prs3d_Presentation> & aPresentation);

		/****************** IsMovable ******************/
		/**** md5 signature: efb300c047e87ac82d826b80cdd545da ****/
		%feature("compactdefaultargs") IsMovable;
		%feature("autodoc", "Returns true if the offset datum is movable.

Returns
-------
bool
") IsMovable;
		virtual Standard_Boolean IsMovable();

		/****************** KindOfDimension ******************/
		/**** md5 signature: 5346b8aa31fa1e8edfb8a13dfcfc1be1 ****/
		%feature("compactdefaultargs") KindOfDimension;
		%feature("autodoc", "Indicates that the dimension we are concerned with is an offset.

Returns
-------
AIS_KindOfDimension
") KindOfDimension;
		virtual AIS_KindOfDimension KindOfDimension();

		/****************** SetRelativePos ******************/
		/**** md5 signature: d3f2619e0cfb252fb2c93faba92de061 ****/
		%feature("compactdefaultargs") SetRelativePos;
		%feature("autodoc", "Sets a transformation atrsf for presentation and selection to a relative position.

Parameters
----------
aTrsf: gp_Trsf

Returns
-------
None
") SetRelativePos;
		void SetRelativePos(const gp_Trsf & aTrsf);

};


%make_alias(AIS_OffsetDimension)

%extend AIS_OffsetDimension {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************
* class AIS_ParallelRelation *
*****************************/
class AIS_ParallelRelation : public AIS_Relation {
	public:
		/****************** AIS_ParallelRelation ******************/
		/**** md5 signature: bf531989c6c44efc9baebcd4097065ab ****/
		%feature("compactdefaultargs") AIS_ParallelRelation;
		%feature("autodoc", "Constructs an object to display parallel constraints. this object is defined by the first shape afshape and the second shape asshape and the plane aplane.

Parameters
----------
aFShape: TopoDS_Shape
aSShape: TopoDS_Shape
aPlane: Geom_Plane

Returns
-------
None
") AIS_ParallelRelation;
		 AIS_ParallelRelation(const TopoDS_Shape & aFShape, const TopoDS_Shape & aSShape, const opencascade::handle<Geom_Plane> & aPlane);

		/****************** AIS_ParallelRelation ******************/
		/**** md5 signature: 5421605781b0c35d0c6d6b87f91fea61 ****/
		%feature("compactdefaultargs") AIS_ParallelRelation;
		%feature("autodoc", "Constructs an object to display parallel constraints. this object is defined by the first shape afshape and the second shape asshape the plane aplane, the position aposition, the type of arrow, asymbolprs and its size anarrowsize.

Parameters
----------
aFShape: TopoDS_Shape
aSShape: TopoDS_Shape
aPlane: Geom_Plane
aPosition: gp_Pnt
aSymbolPrs: DsgPrs_ArrowSide
anArrowSize: float,optional
	default value is 0.01

Returns
-------
None
") AIS_ParallelRelation;
		 AIS_ParallelRelation(const TopoDS_Shape & aFShape, const TopoDS_Shape & aSShape, const opencascade::handle<Geom_Plane> & aPlane, const gp_Pnt & aPosition, const DsgPrs_ArrowSide aSymbolPrs, const Standard_Real anArrowSize = 0.01);

		/****************** Compute ******************/
		/**** md5 signature: 09436ef6513347d4c96315939d8b75d5 ****/
		%feature("compactdefaultargs") Compute;
		%feature("autodoc", "Computes the presentation according to a point of view given by <aprojector>. to be used when the associated degenerated presentations have been transformed by <atrsf> which is not a pure translation. the hlr prs can't be deducted automatically warning :<atrsf> must be applied to the object to display before computation !!!.

Parameters
----------
aProjector: Prs3d_Projector
aTrsf: Geom_Transformation
aPresentation: Prs3d_Presentation

Returns
-------
None
") Compute;
		virtual void Compute(const opencascade::handle<Prs3d_Projector> & aProjector, const opencascade::handle<Geom_Transformation> & aTrsf, const opencascade::handle<Prs3d_Presentation> & aPresentation);

		/****************** IsMovable ******************/
		/**** md5 signature: efb300c047e87ac82d826b80cdd545da ****/
		%feature("compactdefaultargs") IsMovable;
		%feature("autodoc", "Returns true if the parallelism is movable.

Returns
-------
bool
") IsMovable;
		virtual Standard_Boolean IsMovable();

};


%make_alias(AIS_ParallelRelation)

%extend AIS_ParallelRelation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************************
* class AIS_PerpendicularRelation *
**********************************/
class AIS_PerpendicularRelation : public AIS_Relation {
	public:
		/****************** AIS_PerpendicularRelation ******************/
		/**** md5 signature: 78f59fbf6e8f7129fc09fe828a0778ec ****/
		%feature("compactdefaultargs") AIS_PerpendicularRelation;
		%feature("autodoc", "Constructs an object to display constraints of perpendicularity on shapes. this object is defined by a first shape afshape, a second shape asshape, and a plane aplane. aplane is the plane of reference to show and test the perpendicular relation between two shapes, at least one of which has a revolved surface.

Parameters
----------
aFShape: TopoDS_Shape
aSShape: TopoDS_Shape
aPlane: Geom_Plane

Returns
-------
None
") AIS_PerpendicularRelation;
		 AIS_PerpendicularRelation(const TopoDS_Shape & aFShape, const TopoDS_Shape & aSShape, const opencascade::handle<Geom_Plane> & aPlane);

		/****************** AIS_PerpendicularRelation ******************/
		/**** md5 signature: 4fc5b795ae7dc2504ddb4c2dd8a3abee ****/
		%feature("compactdefaultargs") AIS_PerpendicularRelation;
		%feature("autodoc", "Constructs an object to display constraints of perpendicularity on shapes. this object is defined by a first shape afshape and a second shape asshape.

Parameters
----------
aFShape: TopoDS_Shape
aSShape: TopoDS_Shape

Returns
-------
None
") AIS_PerpendicularRelation;
		 AIS_PerpendicularRelation(const TopoDS_Shape & aFShape, const TopoDS_Shape & aSShape);

		/****************** Compute ******************/
		/**** md5 signature: 09436ef6513347d4c96315939d8b75d5 ****/
		%feature("compactdefaultargs") Compute;
		%feature("autodoc", "Computes the presentation according to a point of view given by <aprojector>. to be used when the associated degenerated presentations have been transformed by <atrsf> which is not a pure translation. the hlr prs can't be deducted automatically warning :<atrsf> must be applied to the object to display before computation !!!.

Parameters
----------
aProjector: Prs3d_Projector
aTrsf: Geom_Transformation
aPresentation: Prs3d_Presentation

Returns
-------
None
") Compute;
		virtual void Compute(const opencascade::handle<Prs3d_Projector> & aProjector, const opencascade::handle<Geom_Transformation> & aTrsf, const opencascade::handle<Prs3d_Presentation> & aPresentation);

};


%make_alias(AIS_PerpendicularRelation)

%extend AIS_PerpendicularRelation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************
* class AIS_RadiusDimension *
****************************/
class AIS_RadiusDimension : public AIS_Dimension {
	public:
		/****************** AIS_RadiusDimension ******************/
		/**** md5 signature: 4d963f1a1bf3147cfcf965833ad616a4 ****/
		%feature("compactdefaultargs") AIS_RadiusDimension;
		%feature("autodoc", "Create radius dimension for the circle geometry. @param thecircle [in] the circle to measure.

Parameters
----------
theCircle: gp_Circ

Returns
-------
None
") AIS_RadiusDimension;
		 AIS_RadiusDimension(const gp_Circ & theCircle);

		/****************** AIS_RadiusDimension ******************/
		/**** md5 signature: 309b68f0ff8b1887df8d973238a5e8e7 ****/
		%feature("compactdefaultargs") AIS_RadiusDimension;
		%feature("autodoc", "Create radius dimension for the circle geometry and define its orientation by location of the first point on that circle. @param thecircle [in] the circle to measure. @param theanchorpoint [in] the point to define the position of the dimension attachment on the circle.

Parameters
----------
theCircle: gp_Circ
theAnchorPoint: gp_Pnt

Returns
-------
None
") AIS_RadiusDimension;
		 AIS_RadiusDimension(const gp_Circ & theCircle, const gp_Pnt & theAnchorPoint);

		/****************** AIS_RadiusDimension ******************/
		/**** md5 signature: b44a32e357dbed328c93f7c94ed555b3 ****/
		%feature("compactdefaultargs") AIS_RadiusDimension;
		%feature("autodoc", "Create radius dimension for the arbitrary shape (if possible). @param theshape [in] the shape to measure.

Parameters
----------
theShape: TopoDS_Shape

Returns
-------
None
") AIS_RadiusDimension;
		 AIS_RadiusDimension(const TopoDS_Shape & theShape);

		/****************** AnchorPoint ******************/
		/**** md5 signature: e00b76aa30ec48768c82c1a07e620981 ****/
		%feature("compactdefaultargs") AnchorPoint;
		%feature("autodoc", "Returns anchor point on circle for radius dimension.

Returns
-------
gp_Pnt
") AnchorPoint;
		const gp_Pnt AnchorPoint();

		/****************** Circle ******************/
		/**** md5 signature: 1eaea6bdc97e0fc2fac6cefd24825e1a ****/
		%feature("compactdefaultargs") Circle;
		%feature("autodoc", "Returns measured geometry circle.

Returns
-------
gp_Circ
") Circle;
		const gp_Circ Circle();

		/****************** GetDisplayUnits ******************/
		/**** md5 signature: 6fbf70f12ad85e7a1835a85781f8abb8 ****/
		%feature("compactdefaultargs") GetDisplayUnits;
		%feature("autodoc", "Returns the display units string.

Returns
-------
TCollection_AsciiString
") GetDisplayUnits;
		virtual const TCollection_AsciiString & GetDisplayUnits();

		/****************** GetModelUnits ******************/
		/**** md5 signature: 27dbe0cf13d3ca82bbb0bf570025f3a8 ****/
		%feature("compactdefaultargs") GetModelUnits;
		%feature("autodoc", "Returns the model units string.

Returns
-------
TCollection_AsciiString
") GetModelUnits;
		virtual const TCollection_AsciiString & GetModelUnits();

		/****************** GetTextPosition ******************/
		/**** md5 signature: 8c2fd05c2d7874fe62f7d2730b192774 ****/
		%feature("compactdefaultargs") GetTextPosition;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Pnt
") GetTextPosition;
		virtual const gp_Pnt GetTextPosition();

		/****************** SetDisplayUnits ******************/
		/**** md5 signature: afe69b618dcd1bcf849c7c525bd3f1db ****/
		%feature("compactdefaultargs") SetDisplayUnits;
		%feature("autodoc", "No available documentation.

Parameters
----------
theUnits: TCollection_AsciiString

Returns
-------
None
") SetDisplayUnits;
		virtual void SetDisplayUnits(const TCollection_AsciiString & theUnits);

		/****************** SetMeasuredGeometry ******************/
		/**** md5 signature: 20f5d2af27af2754cd354025e857b6b0 ****/
		%feature("compactdefaultargs") SetMeasuredGeometry;
		%feature("autodoc", "Measure radius of the circle. the dimension will become invalid if the radius of the circle is less than precision::confusion(). @param thecircle [in] the circle to measure.

Parameters
----------
theCircle: gp_Circ

Returns
-------
None
") SetMeasuredGeometry;
		void SetMeasuredGeometry(const gp_Circ & theCircle);

		/****************** SetMeasuredGeometry ******************/
		/**** md5 signature: c108135e71c04f939442708481e8be34 ****/
		%feature("compactdefaultargs") SetMeasuredGeometry;
		%feature("autodoc", "Measure radius of the circle and orient the dimension so the dimension lines attaches to anchor point on the circle. the dimension will become invalid if the radius of the circle is less than precision::confusion(). @param thecircle [in] the circle to measure. @param theanchorpoint [in] the point to attach the dimension lines, should be on the circle @param thehasanchor [in] should be set true if theanchorpoint should be used.

Parameters
----------
theCircle: gp_Circ
theAnchorPoint: gp_Pnt
theHasAnchor: bool,optional
	default value is Standard_True

Returns
-------
None
") SetMeasuredGeometry;
		void SetMeasuredGeometry(const gp_Circ & theCircle, const gp_Pnt & theAnchorPoint, const Standard_Boolean theHasAnchor = Standard_True);

		/****************** SetMeasuredGeometry ******************/
		/**** md5 signature: ad36f6541ba8fd4bb2abf0ec1ff6c97e ****/
		%feature("compactdefaultargs") SetMeasuredGeometry;
		%feature("autodoc", "Measure radius on the passed shape, if applicable. the dimension will become invalid if the passed shape is not measurable or if measured diameter value is less than precision::confusion(). @param theshape [in] the shape to measure.

Parameters
----------
theShape: TopoDS_Shape

Returns
-------
None
") SetMeasuredGeometry;
		void SetMeasuredGeometry(const TopoDS_Shape & theShape);

		/****************** SetMeasuredGeometry ******************/
		/**** md5 signature: 47558a720aeeb8c5e6f999e8e591bac0 ****/
		%feature("compactdefaultargs") SetMeasuredGeometry;
		%feature("autodoc", "Measure radius on the passed shape, if applicable. the dimension will become invalid if the passed shape is not measurable or if measured diameter value is less than precision::confusion(). @param theshape [in] the shape to measure. @param theanchorpoint [in] the point to attach the dimension lines, should be on the circle @param thehasanchor [in] should be set true if theanchorpoint should be used.

Parameters
----------
theShape: TopoDS_Shape
theAnchorPoint: gp_Pnt
theHasAnchor: bool,optional
	default value is Standard_True

Returns
-------
None
") SetMeasuredGeometry;
		void SetMeasuredGeometry(const TopoDS_Shape & theShape, const gp_Pnt & theAnchorPoint, const Standard_Boolean theHasAnchor = Standard_True);

		/****************** SetModelUnits ******************/
		/**** md5 signature: bac7da9c21ed70bf629179ea24a5af0c ****/
		%feature("compactdefaultargs") SetModelUnits;
		%feature("autodoc", "No available documentation.

Parameters
----------
theUnits: TCollection_AsciiString

Returns
-------
None
") SetModelUnits;
		virtual void SetModelUnits(const TCollection_AsciiString & theUnits);

		/****************** SetTextPosition ******************/
		/**** md5 signature: f1658ae61229bf1e77ff3828626b747f ****/
		%feature("compactdefaultargs") SetTextPosition;
		%feature("autodoc", "No available documentation.

Parameters
----------
theTextPos: gp_Pnt

Returns
-------
None
") SetTextPosition;
		virtual void SetTextPosition(const gp_Pnt & theTextPos);

		/****************** Shape ******************/
		/**** md5 signature: 1058569f5d639354fedf11e73741b7df ****/
		%feature("compactdefaultargs") Shape;
		%feature("autodoc", "Returns the measured shape.

Returns
-------
TopoDS_Shape
") Shape;
		const TopoDS_Shape Shape();

};


%make_alias(AIS_RadiusDimension)

%extend AIS_RadiusDimension {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************
* class AIS_SymmetricRelation *
******************************/
class AIS_SymmetricRelation : public AIS_Relation {
	public:
		/****************** AIS_SymmetricRelation ******************/
		/**** md5 signature: 8954d871456fd32cde121f64cfc708c8 ****/
		%feature("compactdefaultargs") AIS_SymmetricRelation;
		%feature("autodoc", "Constructs an object to display constraints of symmetricity. this object is defined by a tool asymmtool, a first shape firstshape, a second shape secondshape, and a plane aplane. aplane serves as the axis of symmetry. asymmtool is the shape composed of firstshape secondshape and aplane. it may be queried and edited using the functions gettool and settool. the two shapes are typically two edges, two vertices or two points.

Parameters
----------
aSymmTool: TopoDS_Shape
FirstShape: TopoDS_Shape
SecondShape: TopoDS_Shape
aPlane: Geom_Plane

Returns
-------
None
") AIS_SymmetricRelation;
		 AIS_SymmetricRelation(const TopoDS_Shape & aSymmTool, const TopoDS_Shape & FirstShape, const TopoDS_Shape & SecondShape, const opencascade::handle<Geom_Plane> & aPlane);

		/****************** Compute ******************/
		/**** md5 signature: 09436ef6513347d4c96315939d8b75d5 ****/
		%feature("compactdefaultargs") Compute;
		%feature("autodoc", "Computes the presentation according to a point of view given by <aprojector>. to be used when the associated degenerated presentations have been transformed by <atrsf> which is not a pure translation. the hlr prs can't be deducted automatically warning :<atrsf> must be applied to the object to display before computation !!!.

Parameters
----------
aProjector: Prs3d_Projector
aTrsf: Geom_Transformation
aPresentation: Prs3d_Presentation

Returns
-------
None
") Compute;
		virtual void Compute(const opencascade::handle<Prs3d_Projector> & aProjector, const opencascade::handle<Geom_Transformation> & aTrsf, const opencascade::handle<Prs3d_Presentation> & aPresentation);

		/****************** GetTool ******************/
		/**** md5 signature: face5c8735961d0bbaff1f7f56abdc4c ****/
		%feature("compactdefaultargs") GetTool;
		%feature("autodoc", "Returns the tool composed of a first shape, a second shape, and a plane. this tool is created at construction time.

Returns
-------
TopoDS_Shape
") GetTool;
		const TopoDS_Shape GetTool();

		/****************** IsMovable ******************/
		/**** md5 signature: efb300c047e87ac82d826b80cdd545da ****/
		%feature("compactdefaultargs") IsMovable;
		%feature("autodoc", "Returns true if the symmetric constraint display is movable.

Returns
-------
bool
") IsMovable;
		virtual Standard_Boolean IsMovable();

		/****************** SetTool ******************/
		/**** md5 signature: 51e7416548336ac785d9dc24f9d81809 ****/
		%feature("compactdefaultargs") SetTool;
		%feature("autodoc", "Sets the tool asymmetrictool composed of a first shape, a second shape, and a plane. this tool is initially created at construction time.

Parameters
----------
aSymmetricTool: TopoDS_Shape

Returns
-------
None
") SetTool;
		void SetTool(const TopoDS_Shape & aSymmetricTool);

};


%make_alias(AIS_SymmetricRelation)

%extend AIS_SymmetricRelation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************
* class AIS_TangentRelation *
****************************/
class AIS_TangentRelation : public AIS_Relation {
	public:
		/****************** AIS_TangentRelation ******************/
		/**** md5 signature: b7bc04bd5d10e595a17b9fbc1f8201f8 ****/
		%feature("compactdefaultargs") AIS_TangentRelation;
		%feature("autodoc", "Twofacestangent or twoedgestangent relation constructs an object to display tangency constraints. this object is defined by the first shape afshape, the second shape asshape, the plane aplane and the index anexternref. aplane serves as an optional axis. anexternref set to 0 indicates that there is no relation.

Parameters
----------
aFShape: TopoDS_Shape
aSShape: TopoDS_Shape
aPlane: Geom_Plane
anExternRef: int,optional
	default value is 0

Returns
-------
None
") AIS_TangentRelation;
		 AIS_TangentRelation(const TopoDS_Shape & aFShape, const TopoDS_Shape & aSShape, const opencascade::handle<Geom_Plane> & aPlane, const Standard_Integer anExternRef = 0);

		/****************** Compute ******************/
		/**** md5 signature: 09436ef6513347d4c96315939d8b75d5 ****/
		%feature("compactdefaultargs") Compute;
		%feature("autodoc", "Computes the presentation according to a point of view given by <aprojector>. to be used when the associated degenerated presentations have been transformed by <atrsf> which is not a pure translation. the hlr prs can't be deducted automatically warning :<atrsf> must be applied to the object to display before computation !!!.

Parameters
----------
aProjector: Prs3d_Projector
aTrsf: Geom_Transformation
aPresentation: Prs3d_Presentation

Returns
-------
None
") Compute;
		virtual void Compute(const opencascade::handle<Prs3d_Projector> & aProjector, const opencascade::handle<Geom_Transformation> & aTrsf, const opencascade::handle<Prs3d_Presentation> & aPresentation);

		/****************** ExternRef ******************/
		/**** md5 signature: 14d6f16498ea53b13fd8ad81f1ebe2a5 ****/
		%feature("compactdefaultargs") ExternRef;
		%feature("autodoc", "Returns the external reference for tangency. the values are as follows: - 0 - there is no connection; - 1 - there is a connection to the first shape; - 2 - there is a connection to the second shape. this reference is defined at construction time.

Returns
-------
int
") ExternRef;
		Standard_Integer ExternRef();

		/****************** SetExternRef ******************/
		/**** md5 signature: 55924e68423e3bd90b4be27d79b7bf55 ****/
		%feature("compactdefaultargs") SetExternRef;
		%feature("autodoc", "Sets the external reference for tangency, aref. the values are as follows: - 0 - there is no connection; - 1 - there is a connection to the first shape; - 2 - there is a connection to the second shape. this reference is initially defined at construction time.

Parameters
----------
aRef: int

Returns
-------
None
") SetExternRef;
		void SetExternRef(const Standard_Integer aRef);

};


%make_alias(AIS_TangentRelation)

%extend AIS_TangentRelation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************
* class AIS_TexturedShape *
**************************/
class AIS_TexturedShape : public AIS_Shape {
	public:
		/****************** AIS_TexturedShape ******************/
		/**** md5 signature: 7b5e3f67785ea4fff1a50e2a26f126ec ****/
		%feature("compactdefaultargs") AIS_TexturedShape;
		%feature("autodoc", "Initializes the textured shape.

Parameters
----------
theShape: TopoDS_Shape

Returns
-------
None
") AIS_TexturedShape;
		 AIS_TexturedShape(const TopoDS_Shape & theShape);

		/****************** AcceptDisplayMode ******************/
		/**** md5 signature: 4c81f1c2cfc05fd196e1c09a383a3455 ****/
		%feature("compactdefaultargs") AcceptDisplayMode;
		%feature("autodoc", "Return true if specified display mode is supported (extends ais_shape with display mode 3).

Parameters
----------
theMode: int

Returns
-------
bool
") AcceptDisplayMode;
		virtual Standard_Boolean AcceptDisplayMode(const Standard_Integer theMode);

		/****************** DisableTextureModulate ******************/
		/**** md5 signature: 97c815d24c97b655242a724b8bf1b6c6 ****/
		%feature("compactdefaultargs") DisableTextureModulate;
		%feature("autodoc", "Disables texture modulation.

Returns
-------
None
") DisableTextureModulate;
		void DisableTextureModulate();

		/****************** EnableTextureModulate ******************/
		/**** md5 signature: 6079501117720843b340d16a5a6761c6 ****/
		%feature("compactdefaultargs") EnableTextureModulate;
		%feature("autodoc", "Enables texture modulation.

Returns
-------
None
") EnableTextureModulate;
		void EnableTextureModulate();

		/****************** SetColor ******************/
		/**** md5 signature: 259272248bacb2cef242adbc667f0ef9 ****/
		%feature("compactdefaultargs") SetColor;
		%feature("autodoc", "Sets the color.

Parameters
----------
theColor: Quantity_Color

Returns
-------
None
") SetColor;
		virtual void SetColor(const Quantity_Color & theColor);

		/****************** SetMaterial ******************/
		/**** md5 signature: 027cc7416eed42a51ff9f029065484ce ****/
		%feature("compactdefaultargs") SetMaterial;
		%feature("autodoc", "Sets the material aspect.

Parameters
----------
theAspect: Graphic3d_MaterialAspect

Returns
-------
None
") SetMaterial;
		virtual void SetMaterial(const Graphic3d_MaterialAspect & theAspect);

		/****************** SetTextureFileName ******************/
		/**** md5 signature: 15c6241ea9acf77eec1dd78180a11112 ****/
		%feature("compactdefaultargs") SetTextureFileName;
		%feature("autodoc", "Sets the texture source. <thetexturefilename> can specify path to texture image or one of the standard predefined textures. the accepted file types are those used in image_alienpixmap with extensions such as rgb, png, jpg and more. to specify the standard predefined texture, the <thetexturefilename> should contain integer - the graphic3d_nameoftexture2d enumeration index. setting texture source using this method resets the source pixmap (if was set previously).

Parameters
----------
theTextureFileName: TCollection_AsciiString

Returns
-------
None
") SetTextureFileName;
		virtual void SetTextureFileName(const TCollection_AsciiString & theTextureFileName);

		/****************** SetTextureMapOff ******************/
		/**** md5 signature: 63364859b184736648b21d705a82db43 ****/
		%feature("compactdefaultargs") SetTextureMapOff;
		%feature("autodoc", "Disables texture mapping.

Returns
-------
None
") SetTextureMapOff;
		void SetTextureMapOff();

		/****************** SetTextureMapOn ******************/
		/**** md5 signature: 61746e3f31a504b75cfbd53d8aff65e6 ****/
		%feature("compactdefaultargs") SetTextureMapOn;
		%feature("autodoc", "Enables texture mapping.

Returns
-------
None
") SetTextureMapOn;
		void SetTextureMapOn();

		/****************** SetTextureOrigin ******************/
		/**** md5 signature: 376433b22adc598ae979b2689aa06720 ****/
		%feature("compactdefaultargs") SetTextureOrigin;
		%feature("autodoc", "Use this method to change the origin of the texture. the texel (0,0) will be mapped to the surface (uorigin,vorigin).

Parameters
----------
theToSetTextureOrigin: bool
theUOrigin: float,optional
	default value is 0.0
theVOrigin: float,optional
	default value is 0.0

Returns
-------
None
") SetTextureOrigin;
		void SetTextureOrigin(const Standard_Boolean theToSetTextureOrigin, const Standard_Real theUOrigin = 0.0, const Standard_Real theVOrigin = 0.0);

		/****************** SetTexturePixMap ******************/
		/**** md5 signature: 94f1328e4794c7fc34b1026e594da246 ****/
		%feature("compactdefaultargs") SetTexturePixMap;
		%feature("autodoc", "Sets the texture source. <thetexturepixmap> specifies image data. please note that the data should be in bottom-up order, the flag of image_pixmap::istopdown() will be ignored by graphic driver. setting texture source using this method resets the source by filename (if was set previously).

Parameters
----------
theTexturePixMap: Image_PixMap

Returns
-------
None
") SetTexturePixMap;
		virtual void SetTexturePixMap(const opencascade::handle<Image_PixMap> & theTexturePixMap);

		/****************** SetTextureRepeat ******************/
		/**** md5 signature: bfbb34918c9be619b4b0aa3c7926bce9 ****/
		%feature("compactdefaultargs") SetTextureRepeat;
		%feature("autodoc", "Sets the number of occurrences of the texture on each face. the texture itself is parameterized in (0,1) by (0,1). each face of the shape to be textured is parameterized in uv space (umin,umax) by (vmin,vmax). if repeatyn is set to false, texture coordinates are clamped in the range (0,1)x(0,1) of the face.

Parameters
----------
theToRepeat: bool
theURepeat: float,optional
	default value is 1.0
theVRepeat: float,optional
	default value is 1.0

Returns
-------
None
") SetTextureRepeat;
		void SetTextureRepeat(const Standard_Boolean theToRepeat, const Standard_Real theURepeat = 1.0, const Standard_Real theVRepeat = 1.0);

		/****************** SetTextureScale ******************/
		/**** md5 signature: 400d25195a4dd51c58b863f68c159841 ****/
		%feature("compactdefaultargs") SetTextureScale;
		%feature("autodoc", "Use this method to scale the texture (percent of the face). you can specify a scale factor for both u and v. example: if you set scaleu and scalev to 0.5 and you enable texture repeat, the texture will appear twice on the face in each direction.

Parameters
----------
theToSetTextureScale: bool
theScaleU: float,optional
	default value is 1.0
theScaleV: float,optional
	default value is 1.0

Returns
-------
None
") SetTextureScale;
		void SetTextureScale(const Standard_Boolean theToSetTextureScale, const Standard_Real theScaleU = 1.0, const Standard_Real theScaleV = 1.0);

		/****************** TextureFile ******************/
		/**** md5 signature: 9a6c79cb2b482678f5b7c07b954ecea9 ****/
		%feature("compactdefaultargs") TextureFile;
		%feature("autodoc", "Returns path to the texture file.

Returns
-------
char *
") TextureFile;
		const char * TextureFile();

		/****************** TextureMapState ******************/
		/**** md5 signature: 383404f1553dcde6191be859120a79f5 ****/
		%feature("compactdefaultargs") TextureMapState;
		%feature("autodoc", "Returns flag to control texture mapping (for presentation mode 3).

Returns
-------
bool
") TextureMapState;
		Standard_Boolean TextureMapState();

		/****************** TextureModulate ******************/
		/**** md5 signature: c5f30284076b9848b41b3650d0b61253 ****/
		%feature("compactdefaultargs") TextureModulate;
		%feature("autodoc", "Returns true if texture color modulation is turned on.

Returns
-------
bool
") TextureModulate;
		Standard_Boolean TextureModulate();

		/****************** TextureOrigin ******************/
		/**** md5 signature: 38e250787d2ff1326d55f0160476e4ca ****/
		%feature("compactdefaultargs") TextureOrigin;
		%feature("autodoc", "Returns true if texture uv origin has been modified.

Returns
-------
bool
") TextureOrigin;
		Standard_Boolean TextureOrigin();

		/****************** TexturePixMap ******************/
		/**** md5 signature: f87f144c3a04ccf005ab0fc99e7fbfed ****/
		%feature("compactdefaultargs") TexturePixMap;
		%feature("autodoc", "Returns the source pixmap for texture map.

Returns
-------
opencascade::handle<Image_PixMap>
") TexturePixMap;
		const opencascade::handle<Image_PixMap> & TexturePixMap();

		/****************** TextureRepeat ******************/
		/**** md5 signature: 212d7df9500adb68a80d8f2b3bc7a27c ****/
		%feature("compactdefaultargs") TextureRepeat;
		%feature("autodoc", "Returns texture repeat flag.

Returns
-------
bool
") TextureRepeat;
		Standard_Boolean TextureRepeat();

		/****************** TextureScale ******************/
		/**** md5 signature: e5d81624609f681f147a099328454b07 ****/
		%feature("compactdefaultargs") TextureScale;
		%feature("autodoc", "Returns true if scale factor should be applied to texture mapping.

Returns
-------
bool
") TextureScale;
		Standard_Boolean TextureScale();

		/****************** TextureScaleU ******************/
		/**** md5 signature: 9776950f41e75a5c7d44cfe89127a0c3 ****/
		%feature("compactdefaultargs") TextureScaleU;
		%feature("autodoc", "Returns scale factor for u coordinate (1.0 by default).

Returns
-------
float
") TextureScaleU;
		Standard_Real TextureScaleU();

		/****************** TextureScaleV ******************/
		/**** md5 signature: 6fb743bea73c852a9e3e1e56c8c43b08 ****/
		%feature("compactdefaultargs") TextureScaleV;
		%feature("autodoc", "Returns scale factor for v coordinate (1.0 by default).

Returns
-------
float
") TextureScaleV;
		Standard_Real TextureScaleV();

		/****************** TextureUOrigin ******************/
		/**** md5 signature: 10ef3372c0fb41b7da97ce782d879adc ****/
		%feature("compactdefaultargs") TextureUOrigin;
		%feature("autodoc", "Returns texture origin u position (0.0 by default).

Returns
-------
float
") TextureUOrigin;
		Standard_Real TextureUOrigin();

		/****************** TextureVOrigin ******************/
		/**** md5 signature: 42004987cc3ad144bf2d27aa57e01071 ****/
		%feature("compactdefaultargs") TextureVOrigin;
		%feature("autodoc", "Returns texture origin v position (0.0 by default).

Returns
-------
float
") TextureVOrigin;
		Standard_Real TextureVOrigin();

		/****************** URepeat ******************/
		/**** md5 signature: 404b02720a20f2fc3eb85deed39ca11b ****/
		%feature("compactdefaultargs") URepeat;
		%feature("autodoc", "Returns texture repeat u value.

Returns
-------
float
") URepeat;
		Standard_Real URepeat();

		/****************** UnsetColor ******************/
		/**** md5 signature: 2da7e2ed6a63f7c70c36c2a82118a7ec ****/
		%feature("compactdefaultargs") UnsetColor;
		%feature("autodoc", "Removes settings for the color.

Returns
-------
None
") UnsetColor;
		virtual void UnsetColor();

		/****************** UnsetMaterial ******************/
		/**** md5 signature: 0a051ddc9f5267e24615c6f3dfd30498 ****/
		%feature("compactdefaultargs") UnsetMaterial;
		%feature("autodoc", "Removes settings for material aspect.

Returns
-------
None
") UnsetMaterial;
		virtual void UnsetMaterial();

		/****************** UpdateAttributes ******************/
		/**** md5 signature: 334c979de66ee04703d34c5c9478d7f3 ****/
		%feature("compactdefaultargs") UpdateAttributes;
		%feature("autodoc", "Use this method to display the textured shape without recomputing the whole presentation. use this method when only the texture content has been changed. if other parameters (ie: scale factors, texture origin, texture repeat...) have changed, the whole presentation has to be recomputed: @code if (myshape->displaymode() == 3) { myaiscontext->recomputeprsonly (myshape); } else { myaiscontext->setdisplaymode (myshape, 3, standard_false); myaiscontext->display (myshape, standard_true); } @endcode.

Returns
-------
None
") UpdateAttributes;
		void UpdateAttributes();

		/****************** VRepeat ******************/
		/**** md5 signature: 397e3c09b7e7140fac90dda021680f8d ****/
		%feature("compactdefaultargs") VRepeat;
		%feature("autodoc", "Returns texture repeat v value.

Returns
-------
float
") VRepeat;
		Standard_Real VRepeat();

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

/*******************************
* class AIS_MaxRadiusDimension *
*******************************/
class AIS_MaxRadiusDimension : public AIS_EllipseRadiusDimension {
	public:
		/****************** AIS_MaxRadiusDimension ******************/
		/**** md5 signature: 5fe225a4d922a7537e22888c8649779a ****/
		%feature("compactdefaultargs") AIS_MaxRadiusDimension;
		%feature("autodoc", "Max ellipse radius dimension shape can be edge , planar face or cylindrical face.

Parameters
----------
aShape: TopoDS_Shape
aVal: float
aText: TCollection_ExtendedString

Returns
-------
None
") AIS_MaxRadiusDimension;
		 AIS_MaxRadiusDimension(const TopoDS_Shape & aShape, const Standard_Real aVal, const TCollection_ExtendedString & aText);

		/****************** AIS_MaxRadiusDimension ******************/
		/**** md5 signature: a59c65e3dd617139bbe9ba3863d815b6 ****/
		%feature("compactdefaultargs") AIS_MaxRadiusDimension;
		%feature("autodoc", "Max ellipse radius dimension with position shape can be edge , planar face or cylindrical face.

Parameters
----------
aShape: TopoDS_Shape
aVal: float
aText: TCollection_ExtendedString
aPosition: gp_Pnt
aSymbolPrs: DsgPrs_ArrowSide
anArrowSize: float,optional
	default value is 0.0

Returns
-------
None
") AIS_MaxRadiusDimension;
		 AIS_MaxRadiusDimension(const TopoDS_Shape & aShape, const Standard_Real aVal, const TCollection_ExtendedString & aText, const gp_Pnt & aPosition, const DsgPrs_ArrowSide aSymbolPrs, const Standard_Real anArrowSize = 0.0);

		/****************** Compute ******************/
		/**** md5 signature: 09436ef6513347d4c96315939d8b75d5 ****/
		%feature("compactdefaultargs") Compute;
		%feature("autodoc", "Computes the presentation according to a point of view given by <aprojector>. to be used when the associated degenerated presentations have been transformed by <atrsf> which is not a pure translation. the hlr prs can't be deducted automatically warning :<atrsf> must be applied to the object to display before computation !!!.

Parameters
----------
aProjector: Prs3d_Projector
aTrsf: Geom_Transformation
aPresentation: Prs3d_Presentation

Returns
-------
None
") Compute;
		virtual void Compute(const opencascade::handle<Prs3d_Projector> & aProjector, const opencascade::handle<Geom_Transformation> & aTrsf, const opencascade::handle<Prs3d_Presentation> & aPresentation);

};


%make_alias(AIS_MaxRadiusDimension)

%extend AIS_MaxRadiusDimension {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************
* class AIS_MinRadiusDimension *
*******************************/
class AIS_MinRadiusDimension : public AIS_EllipseRadiusDimension {
	public:
		/****************** AIS_MinRadiusDimension ******************/
		/**** md5 signature: 6b0a98d440f395371371192968f3305a ****/
		%feature("compactdefaultargs") AIS_MinRadiusDimension;
		%feature("autodoc", "Max ellipse radius dimension shape can be edge , planar face or cylindrical face.

Parameters
----------
aShape: TopoDS_Shape
aVal: float
aText: TCollection_ExtendedString

Returns
-------
None
") AIS_MinRadiusDimension;
		 AIS_MinRadiusDimension(const TopoDS_Shape & aShape, const Standard_Real aVal, const TCollection_ExtendedString & aText);

		/****************** AIS_MinRadiusDimension ******************/
		/**** md5 signature: 3f38ab5ba912fdea238dad3a1ddf28db ****/
		%feature("compactdefaultargs") AIS_MinRadiusDimension;
		%feature("autodoc", "Max ellipse radius dimension with position shape can be edge , planar face or cylindrical face.

Parameters
----------
aShape: TopoDS_Shape
aVal: float
aText: TCollection_ExtendedString
aPosition: gp_Pnt
aSymbolPrs: DsgPrs_ArrowSide
anArrowSize: float,optional
	default value is 0.0

Returns
-------
None
") AIS_MinRadiusDimension;
		 AIS_MinRadiusDimension(const TopoDS_Shape & aShape, const Standard_Real aVal, const TCollection_ExtendedString & aText, const gp_Pnt & aPosition, const DsgPrs_ArrowSide aSymbolPrs, const Standard_Real anArrowSize = 0.0);

		/****************** Compute ******************/
		/**** md5 signature: 09436ef6513347d4c96315939d8b75d5 ****/
		%feature("compactdefaultargs") Compute;
		%feature("autodoc", "Computes the presentation according to a point of view given by <aprojector>. to be used when the associated degenerated presentations have been transformed by <atrsf> which is not a pure translation. the hlr prs can't be deducted automatically warning :<atrsf> must be applied to the object to display before computation !!!.

Parameters
----------
aProjector: Prs3d_Projector
aTrsf: Geom_Transformation
aPresentation: Prs3d_Presentation

Returns
-------
None
") Compute;
		virtual void Compute(const opencascade::handle<Prs3d_Projector> & aProjector, const opencascade::handle<Geom_Transformation> & aTrsf, const opencascade::handle<Prs3d_Presentation> & aPresentation);

};


%make_alias(AIS_MinRadiusDimension)

%extend AIS_MinRadiusDimension {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* harray1 classes */
/* harray2 classes */
/* hsequence classes */
