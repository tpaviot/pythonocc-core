/*
Copyright 2008-2019 Thomas Paviot (tpaviot@gmail.com)

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
https://www.opencascade.com/doc/occt-7.4.0/refman/html/package_AIS.html"
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
#include<Visual3d_module.hxx>
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
%template(AIS_DataMapofIntegerListOfinteractive) NCollection_DataMap <Standard_Integer , AIS_ListOfInteractive , TColStd_MapIntegerHasher>;
%template(AIS_ListOfInteractive) NCollection_List <opencascade::handle <AIS_InteractiveObject>>;
%template(AIS_ListIteratorOfListOfInteractive) NCollection_TListIterator<opencascade::handle<AIS_InteractiveObject>>;
%template(AIS_MouseGestureMap) NCollection_DataMap <unsigned int , AIS_MouseGesture>;
%template(AIS_DataMapOfShapeDrawer) NCollection_DataMap <TopoDS_Shape , opencascade::handle <AIS_ColoredDrawer>, TopTools_ShapeMapHasher>;
%template(AIS_MapOfInteractive) NCollection_Map <opencascade::handle <AIS_InteractiveObject>, TColStd_MapTransientHasher>;
%template(AIS_DataMapOfIOStatus) NCollection_DataMap <opencascade::handle <AIS_InteractiveObject>, opencascade::handle <AIS_GlobalStatus>, TColStd_MapTransientHasher>;
%template(AIS_SequenceOfDimension) NCollection_Sequence <opencascade::handle <AIS_Relation>>;
%template(AIS_IndexedDataMapOfOwnerPrs) NCollection_IndexedDataMap <opencascade::handle <SelectMgr_EntityOwner>, opencascade::handle <Prs3d_Presentation>, TColStd_MapTransientHasher>;
%template(AIS_NListOfEntityOwner) NCollection_List <opencascade::handle <SelectMgr_EntityOwner>>;
%template(AIS_SequenceOfInteractive) NCollection_Sequence <opencascade::handle <AIS_InteractiveObject>>;
/* end templates declaration */

/* typedefs */
typedef NCollection_DataMap <Standard_Integer , AIS_ListOfInteractive , TColStd_MapIntegerHasher> AIS_DataMapofIntegerListOfinteractive;
typedef NCollection_DataMap <Standard_Integer , AIS_ListOfInteractive , TColStd_MapIntegerHasher>::Iterator AIS_DataMapIteratorOfDataMapofIntegerListOfinteractive;
typedef NCollection_List <opencascade::handle <AIS_InteractiveObject>> AIS_ListOfInteractive;
typedef NCollection_List <opencascade::handle <AIS_InteractiveObject>>::Iterator AIS_ListIteratorOfListOfInteractive;
typedef NCollection_DataMap <unsigned int , AIS_MouseGesture> AIS_MouseGestureMap;
typedef NCollection_DataMap <TopoDS_Shape , opencascade::handle <AIS_ColoredDrawer>, TopTools_ShapeMapHasher> AIS_DataMapOfShapeDrawer;
typedef NCollection_Map <opencascade::handle <AIS_InteractiveObject>, TColStd_MapTransientHasher> AIS_MapOfInteractive;
typedef NCollection_Map <opencascade::handle <AIS_InteractiveObject>, TColStd_MapTransientHasher>::Iterator AIS_MapIteratorOfMapOfInteractive;
typedef NCollection_DataMap <opencascade::handle <AIS_InteractiveObject>, opencascade::handle <AIS_GlobalStatus>, TColStd_MapTransientHasher> AIS_DataMapOfIOStatus;
typedef NCollection_DataMap <opencascade::handle <AIS_InteractiveObject>, opencascade::handle <AIS_GlobalStatus>, TColStd_MapTransientHasher>::Iterator AIS_DataMapIteratorOfDataMapOfIOStatus;
typedef NCollection_Sequence <opencascade::handle <AIS_Relation>> AIS_SequenceOfDimension;
typedef NCollection_IndexedDataMap <opencascade::handle <SelectMgr_EntityOwner>, opencascade::handle <Prs3d_Presentation>, TColStd_MapTransientHasher> AIS_IndexedDataMapOfOwnerPrs;
typedef NCollection_List <opencascade::handle <SelectMgr_EntityOwner>> AIS_NListOfEntityOwner;
typedef NCollection_Sequence <opencascade::handle <AIS_InteractiveObject>> AIS_SequenceOfInteractive;
typedef Media_Timer AIS_AnimationTimer;
/* end typedefs declaration */

%rename(ais) AIS;
class AIS {
	public:
		%feature("compactdefaultargs") ComputeGeomCurve;
		%feature("autodoc", "	* Checks if aCurve belongs to aPlane; if not, projects aCurve in aPlane and returns aCurve; Return True if ok

	:param aCurve:
	:type aCurve: opencascade::handle<Geom_Curve> &
	:param first1:
	:type first1: float
	:param last1:
	:type last1: float
	:param FirstPnt1:
	:type FirstPnt1: gp_Pnt
	:param LastPnt1:
	:type LastPnt1: gp_Pnt
	:param aPlane:
	:type aPlane: opencascade::handle<Geom_Plane> &
	:param isOnPlane:
	:type isOnPlane: bool
	:rtype: bool
") ComputeGeomCurve;
		static Standard_Boolean ComputeGeomCurve (opencascade::handle<Geom_Curve> & aCurve,const Standard_Real first1,const Standard_Real last1,gp_Pnt & FirstPnt1,gp_Pnt & LastPnt1,const opencascade::handle<Geom_Plane> & aPlane,Standard_Boolean &OutValue);
		%feature("compactdefaultargs") ComputeGeometry;
		%feature("autodoc", "	* Used by 2d Relation only Computes the 3d geometry of <anEdge> in the current WorkingPlane and the extremities if any Return True if ok.

	:param theEdge:
	:type theEdge: TopoDS_Edge &
	:param theCurve:
	:type theCurve: opencascade::handle<Geom_Curve> &
	:param theFirstPnt:
	:type theFirstPnt: gp_Pnt
	:param theLastPnt:
	:type theLastPnt: gp_Pnt
	:rtype: bool
") ComputeGeometry;
		static Standard_Boolean ComputeGeometry (const TopoDS_Edge & theEdge,opencascade::handle<Geom_Curve> & theCurve,gp_Pnt & theFirstPnt,gp_Pnt & theLastPnt);
		%feature("compactdefaultargs") ComputeGeometry;
		%feature("autodoc", "	* Used by dimensions only. Computes the 3d geometry of <anEdge>. Return True if ok.

	:param theEdge:
	:type theEdge: TopoDS_Edge &
	:param theCurve:
	:type theCurve: opencascade::handle<Geom_Curve> &
	:param theFirstPnt:
	:type theFirstPnt: gp_Pnt
	:param theLastPnt:
	:type theLastPnt: gp_Pnt
	:param theIsInfinite:
	:type theIsInfinite: bool
	:rtype: bool
") ComputeGeometry;
		static Standard_Boolean ComputeGeometry (const TopoDS_Edge & theEdge,opencascade::handle<Geom_Curve> & theCurve,gp_Pnt & theFirstPnt,gp_Pnt & theLastPnt,Standard_Boolean &OutValue);
		%feature("compactdefaultargs") ComputeGeometry;
		%feature("autodoc", "	* Used by 2d Relation only Computes the 3d geometry of <anEdge> in the current WorkingPlane and the extremities if any. If <aCurve> is not in the current plane, <extCurve> contains the not projected curve associated to <anEdge>. If <anEdge> is infinite, <isinfinite> = true and the 2 parameters <FirstPnt> and <LastPnt> have no signification. Return True if ok.

	:param theEdge:
	:type theEdge: TopoDS_Edge &
	:param theCurve:
	:type theCurve: opencascade::handle<Geom_Curve> &
	:param theFirstPnt:
	:type theFirstPnt: gp_Pnt
	:param theLastPnt:
	:type theLastPnt: gp_Pnt
	:param theExtCurve:
	:type theExtCurve: opencascade::handle<Geom_Curve> &
	:param theIsInfinite:
	:type theIsInfinite: bool
	:param theIsOnPlane:
	:type theIsOnPlane: bool
	:param thePlane:
	:type thePlane: opencascade::handle<Geom_Plane> &
	:rtype: bool
") ComputeGeometry;
		static Standard_Boolean ComputeGeometry (const TopoDS_Edge & theEdge,opencascade::handle<Geom_Curve> & theCurve,gp_Pnt & theFirstPnt,gp_Pnt & theLastPnt,opencascade::handle<Geom_Curve> & theExtCurve,Standard_Boolean &OutValue,Standard_Boolean &OutValue,const opencascade::handle<Geom_Plane> & thePlane);
		%feature("compactdefaultargs") ComputeGeometry;
		%feature("autodoc", "	* Used by 2d Relation only Computes the 3d geometry of <anEdge> in the current WorkingPlane and the extremities if any Return True if ok.

	:param theFirstEdge:
	:type theFirstEdge: TopoDS_Edge &
	:param theSecondEdge:
	:type theSecondEdge: TopoDS_Edge &
	:param theFirstCurve:
	:type theFirstCurve: opencascade::handle<Geom_Curve> &
	:param theSecondCurve:
	:type theSecondCurve: opencascade::handle<Geom_Curve> &
	:param theFirstPnt1:
	:type theFirstPnt1: gp_Pnt
	:param theLastPnt1:
	:type theLastPnt1: gp_Pnt
	:param theFirstPnt2:
	:type theFirstPnt2: gp_Pnt
	:param theLastPnt2:
	:type theLastPnt2: gp_Pnt
	:param thePlane:
	:type thePlane: opencascade::handle<Geom_Plane> &
	:rtype: bool
") ComputeGeometry;
		static Standard_Boolean ComputeGeometry (const TopoDS_Edge & theFirstEdge,const TopoDS_Edge & theSecondEdge,opencascade::handle<Geom_Curve> & theFirstCurve,opencascade::handle<Geom_Curve> & theSecondCurve,gp_Pnt & theFirstPnt1,gp_Pnt & theLastPnt1,gp_Pnt & theFirstPnt2,gp_Pnt & theLastPnt2,const opencascade::handle<Geom_Plane> & thePlane);
		%feature("compactdefaultargs") ComputeGeometry;
		%feature("autodoc", "	* Used by dimensions only.Computes the 3d geometry of<anEdge1> and <anEdge2> and checks if they are infinite.

	:param theFirstEdge:
	:type theFirstEdge: TopoDS_Edge &
	:param theSecondEdge:
	:type theSecondEdge: TopoDS_Edge &
	:param theFirstCurve:
	:type theFirstCurve: opencascade::handle<Geom_Curve> &
	:param theSecondCurve:
	:type theSecondCurve: opencascade::handle<Geom_Curve> &
	:param theFirstPnt1:
	:type theFirstPnt1: gp_Pnt
	:param theLastPnt1:
	:type theLastPnt1: gp_Pnt
	:param theFirstPnt2:
	:type theFirstPnt2: gp_Pnt
	:param theLastPnt2:
	:type theLastPnt2: gp_Pnt
	:param theIsinfinite1:
	:type theIsinfinite1: bool
	:param theIsinfinite2:
	:type theIsinfinite2: bool
	:rtype: bool
") ComputeGeometry;
		static Standard_Boolean ComputeGeometry (const TopoDS_Edge & theFirstEdge,const TopoDS_Edge & theSecondEdge,opencascade::handle<Geom_Curve> & theFirstCurve,opencascade::handle<Geom_Curve> & theSecondCurve,gp_Pnt & theFirstPnt1,gp_Pnt & theLastPnt1,gp_Pnt & theFirstPnt2,gp_Pnt & theLastPnt2,Standard_Boolean &OutValue,Standard_Boolean &OutValue);
		%feature("compactdefaultargs") ComputeGeometry;
		%feature("autodoc", "	* Used by 2d Relation only Computes the 3d geometry of<anEdge1> and <anEdge2> in the current Plane and the extremities if any. Return in ExtCurve the 3d curve (not projected in the plane) of the first edge if <indexExt> =1 or of the 2nd edge if <indexExt> = 2. If <indexExt> = 0, ExtCurve is Null. if there is an edge external to the plane, <isinfinite> is true if this edge is infinite. So, the extremities of it are not significant. Return True if ok

	:param theFirstEdge:
	:type theFirstEdge: TopoDS_Edge &
	:param theSecondEdge:
	:type theSecondEdge: TopoDS_Edge &
	:param theExtIndex:
	:type theExtIndex: int &
	:param theFirstCurve:
	:type theFirstCurve: opencascade::handle<Geom_Curve> &
	:param theSecondCurve:
	:type theSecondCurve: opencascade::handle<Geom_Curve> &
	:param theFirstPnt1:
	:type theFirstPnt1: gp_Pnt
	:param theLastPnt1:
	:type theLastPnt1: gp_Pnt
	:param theFirstPnt2:
	:type theFirstPnt2: gp_Pnt
	:param theLastPnt2:
	:type theLastPnt2: gp_Pnt
	:param theExtCurve:
	:type theExtCurve: opencascade::handle<Geom_Curve> &
	:param theIsinfinite1:
	:type theIsinfinite1: bool
	:param theIsinfinite2:
	:type theIsinfinite2: bool
	:param thePlane:
	:type thePlane: opencascade::handle<Geom_Plane> &
	:rtype: bool
") ComputeGeometry;
		static Standard_Boolean ComputeGeometry (const TopoDS_Edge & theFirstEdge,const TopoDS_Edge & theSecondEdge,Standard_Integer &OutValue,opencascade::handle<Geom_Curve> & theFirstCurve,opencascade::handle<Geom_Curve> & theSecondCurve,gp_Pnt & theFirstPnt1,gp_Pnt & theLastPnt1,gp_Pnt & theFirstPnt2,gp_Pnt & theLastPnt2,opencascade::handle<Geom_Curve> & theExtCurve,Standard_Boolean &OutValue,Standard_Boolean &OutValue,const opencascade::handle<Geom_Plane> & thePlane);
		%feature("compactdefaultargs") ComputeGeometry;
		%feature("autodoc", "	:param aVertex:
	:type aVertex: TopoDS_Vertex &
	:param point:
	:type point: gp_Pnt
	:param aPlane:
	:type aPlane: opencascade::handle<Geom_Plane> &
	:param isOnPlane:
	:type isOnPlane: bool
	:rtype: bool
") ComputeGeometry;
		static Standard_Boolean ComputeGeometry (const TopoDS_Vertex & aVertex,gp_Pnt & point,const opencascade::handle<Geom_Plane> & aPlane,Standard_Boolean &OutValue);
		%feature("compactdefaultargs") ComputeProjEdgePresentation;
		%feature("autodoc", "	:param aPres:
	:type aPres: opencascade::handle<Prs3d_Presentation> &
	:param aDrawer:
	:type aDrawer: opencascade::handle<Prs3d_Drawer> &
	:param anEdge:
	:type anEdge: TopoDS_Edge &
	:param ProjCurve:
	:type ProjCurve: opencascade::handle<Geom_Curve> &
	:param FirstP:
	:type FirstP: gp_Pnt
	:param LastP:
	:type LastP: gp_Pnt
	:param aColor: default value is Quantity_NOC_PURPLE
	:type aColor: Quantity_NameOfColor
	:param aWidth: default value is 2
	:type aWidth: float
	:param aProjTOL: default value is Aspect_TOL_DASH
	:type aProjTOL: Aspect_TypeOfLine
	:param aCallTOL: default value is Aspect_TOL_DOT
	:type aCallTOL: Aspect_TypeOfLine
	:rtype: void
") ComputeProjEdgePresentation;
		static void ComputeProjEdgePresentation (const opencascade::handle<Prs3d_Presentation> & aPres,const opencascade::handle<Prs3d_Drawer> & aDrawer,const TopoDS_Edge & anEdge,const opencascade::handle<Geom_Curve> & ProjCurve,const gp_Pnt & FirstP,const gp_Pnt & LastP,const Quantity_NameOfColor aColor = Quantity_NOC_PURPLE,const Standard_Real aWidth = 2,const Aspect_TypeOfLine aProjTOL = Aspect_TOL_DASH,const Aspect_TypeOfLine aCallTOL = Aspect_TOL_DOT);
		%feature("compactdefaultargs") ComputeProjVertexPresentation;
		%feature("autodoc", "	:param aPres:
	:type aPres: opencascade::handle<Prs3d_Presentation> &
	:param aDrawer:
	:type aDrawer: opencascade::handle<Prs3d_Drawer> &
	:param aVertex:
	:type aVertex: TopoDS_Vertex &
	:param ProjPoint:
	:type ProjPoint: gp_Pnt
	:param aColor: default value is Quantity_NOC_PURPLE
	:type aColor: Quantity_NameOfColor
	:param aWidth: default value is 2
	:type aWidth: float
	:param aProjTOM: default value is Aspect_TOM_PLUS
	:type aProjTOM: Aspect_TypeOfMarker
	:param aCallTOL: default value is Aspect_TOL_DOT
	:type aCallTOL: Aspect_TypeOfLine
	:rtype: void
") ComputeProjVertexPresentation;
		static void ComputeProjVertexPresentation (const opencascade::handle<Prs3d_Presentation> & aPres,const opencascade::handle<Prs3d_Drawer> & aDrawer,const TopoDS_Vertex & aVertex,const gp_Pnt & ProjPoint,const Quantity_NameOfColor aColor = Quantity_NOC_PURPLE,const Standard_Real aWidth = 2,const Aspect_TypeOfMarker aProjTOM = Aspect_TOM_PLUS,const Aspect_TypeOfLine aCallTOL = Aspect_TOL_DOT);
		%feature("compactdefaultargs") DistanceFromApex;
		%feature("autodoc", "	* computes length of ellipse arc in parametric units

	:param elips:
	:type elips: gp_Elips
	:param Apex:
	:type Apex: gp_Pnt
	:param par:
	:type par: float
	:rtype: float
") DistanceFromApex;
		static Standard_Real DistanceFromApex (const gp_Elips & elips,const gp_Pnt & Apex,const Standard_Real par);
		%feature("compactdefaultargs") Farest;
		%feature("autodoc", "	:param aShape:
	:type aShape: TopoDS_Shape &
	:param aPoint:
	:type aPoint: gp_Pnt
	:rtype: gp_Pnt
") Farest;
		static gp_Pnt Farest (const TopoDS_Shape & aShape,const gp_Pnt & aPoint);
		%feature("compactdefaultargs") GetPlaneFromFace;
		%feature("autodoc", "	* Tryes to get Plane from Face. Returns Surface of Face in aSurf. Returns Standard_True and Plane of Face in aPlane in following cases: Face is Plane, Offset of Plane, Extrusion of Line and Offset of Extrusion of Line Returns pure type of Surface which can be: Plane, Cylinder, Cone, Sphere, Torus, SurfaceOfRevolution, SurfaceOfExtrusion

	:param aFace:
	:type aFace: TopoDS_Face &
	:param aPlane:
	:type aPlane: gp_Pln
	:param aSurf:
	:type aSurf: opencascade::handle<Geom_Surface> &
	:param aSurfType:
	:type aSurfType: AIS_KindOfSurface &
	:param Offset:
	:type Offset: float &
	:rtype: bool
") GetPlaneFromFace;
		static Standard_Boolean GetPlaneFromFace (const TopoDS_Face & aFace,gp_Pln & aPlane,opencascade::handle<Geom_Surface> & aSurf,AIS_KindOfSurface & aSurfType,Standard_Real &OutValue);
		%feature("compactdefaultargs") InDomain;
		%feature("autodoc", "	* returns True if point with anAttachPar is in domain of arc

	:param aFirstPar:
	:type aFirstPar: float
	:param aLastPar:
	:type aLastPar: float
	:param anAttachPar:
	:type anAttachPar: float
	:rtype: bool
") InDomain;
		static Standard_Boolean InDomain (const Standard_Real aFirstPar,const Standard_Real aLastPar,const Standard_Real anAttachPar);
		%feature("compactdefaultargs") InitAngleBetweenCurvilinearFaces;
		%feature("autodoc", "	* Finds three points for the angle dimension between two curvilinear surfaces.

	:param theFirstFace:
	:type theFirstFace: TopoDS_Face &
	:param theSecondFace:
	:type theSecondFace: TopoDS_Face &
	:param theFirstSurfType:
	:type theFirstSurfType: AIS_KindOfSurface
	:param theSecondSurfType:
	:type theSecondSurfType: AIS_KindOfSurface
	:param theCenter:
	:type theCenter: gp_Pnt
	:param theFirstAttach:
	:type theFirstAttach: gp_Pnt
	:param theSecondAttach:
	:type theSecondAttach: gp_Pnt
	:param theIsFirstPointSet: default value is Standard_False
	:type theIsFirstPointSet: bool
	:rtype: bool
") InitAngleBetweenCurvilinearFaces;
		static Standard_Boolean InitAngleBetweenCurvilinearFaces (const TopoDS_Face & theFirstFace,const TopoDS_Face & theSecondFace,const AIS_KindOfSurface theFirstSurfType,const AIS_KindOfSurface theSecondSurfType,gp_Pnt & theCenter,gp_Pnt & theFirstAttach,gp_Pnt & theSecondAttach,const Standard_Boolean theIsFirstPointSet = Standard_False);
		%feature("compactdefaultargs") InitAngleBetweenPlanarFaces;
		%feature("autodoc", "	* Finds three points for the angle dimension between two planes.

	:param theFirstFace:
	:type theFirstFace: TopoDS_Face &
	:param theSecondFace:
	:type theSecondFace: TopoDS_Face &
	:param theCenter:
	:type theCenter: gp_Pnt
	:param theFirstAttach:
	:type theFirstAttach: gp_Pnt
	:param theSecondAttach:
	:type theSecondAttach: gp_Pnt
	:param theIsFirstPointSet: default value is Standard_False
	:type theIsFirstPointSet: bool
	:rtype: bool
") InitAngleBetweenPlanarFaces;
		static Standard_Boolean InitAngleBetweenPlanarFaces (const TopoDS_Face & theFirstFace,const TopoDS_Face & theSecondFace,gp_Pnt & theCenter,gp_Pnt & theFirstAttach,gp_Pnt & theSecondAttach,const Standard_Boolean theIsFirstPointSet = Standard_False);
		%feature("compactdefaultargs") InitFaceLength;
		%feature("autodoc", "	:param aFace:
	:type aFace: TopoDS_Face &
	:param aPlane:
	:type aPlane: gp_Pln
	:param aSurface:
	:type aSurface: opencascade::handle<Geom_Surface> &
	:param aSurfaceType:
	:type aSurfaceType: AIS_KindOfSurface &
	:param anOffset:
	:type anOffset: float &
	:rtype: void
") InitFaceLength;
		static void InitFaceLength (const TopoDS_Face & aFace,gp_Pln & aPlane,opencascade::handle<Geom_Surface> & aSurface,AIS_KindOfSurface & aSurfaceType,Standard_Real &OutValue);
		%feature("compactdefaultargs") InitLengthBetweenCurvilinearFaces;
		%feature("autodoc", "	* Finds attachment points on two curvilinear faces for length dimension. @param thePlaneDir [in] the direction on the dimension plane to compute the plane automatically. It will not be taken into account if plane is defined by user.

	:param theFirstFace:
	:type theFirstFace: TopoDS_Face &
	:param theSecondFace:
	:type theSecondFace: TopoDS_Face &
	:param theFirstSurf:
	:type theFirstSurf: opencascade::handle<Geom_Surface> &
	:param theSecondSurf:
	:type theSecondSurf: opencascade::handle<Geom_Surface> &
	:param theFirstAttach:
	:type theFirstAttach: gp_Pnt
	:param theSecondAttach:
	:type theSecondAttach: gp_Pnt
	:param theDirOnPlane:
	:type theDirOnPlane: gp_Dir
	:rtype: void
") InitLengthBetweenCurvilinearFaces;
		static void InitLengthBetweenCurvilinearFaces (const TopoDS_Face & theFirstFace,const TopoDS_Face & theSecondFace,opencascade::handle<Geom_Surface> & theFirstSurf,opencascade::handle<Geom_Surface> & theSecondSurf,gp_Pnt & theFirstAttach,gp_Pnt & theSecondAttach,gp_Dir & theDirOnPlane);
		%feature("compactdefaultargs") Nearest;
		%feature("autodoc", "	* Returns the nearest point in a shape. This is used by several classes in calculation of dimensions.

	:param aShape:
	:type aShape: TopoDS_Shape &
	:param aPoint:
	:type aPoint: gp_Pnt
	:rtype: gp_Pnt
") Nearest;
		static gp_Pnt Nearest (const TopoDS_Shape & aShape,const gp_Pnt & aPoint);
		%feature("compactdefaultargs") Nearest;
		%feature("autodoc", "	* returns the nearest point on the line.

	:param theLine:
	:type theLine: gp_Lin
	:param thePoint:
	:type thePoint: gp_Pnt
	:rtype: gp_Pnt
") Nearest;
		static gp_Pnt Nearest (const gp_Lin & theLine,const gp_Pnt & thePoint);
		%feature("compactdefaultargs") Nearest;
		%feature("autodoc", "	* For the given point finds nearest point on the curve, returns True if found point is belongs to the curve and False otherwise.

	:param theCurve:
	:type theCurve: opencascade::handle<Geom_Curve> &
	:param thePoint:
	:type thePoint: gp_Pnt
	:param theFirstPoint:
	:type theFirstPoint: gp_Pnt
	:param theLastPoint:
	:type theLastPoint: gp_Pnt
	:param theNearestPoint:
	:type theNearestPoint: gp_Pnt
	:rtype: bool
") Nearest;
		static Standard_Boolean Nearest (const opencascade::handle<Geom_Curve> & theCurve,const gp_Pnt & thePoint,const gp_Pnt & theFirstPoint,const gp_Pnt & theLastPoint,gp_Pnt & theNearestPoint);
		%feature("compactdefaultargs") NearestApex;
		%feature("autodoc", "	* computes nearest to ellipse arc apex

	:param elips:
	:type elips: gp_Elips
	:param pApex:
	:type pApex: gp_Pnt
	:param nApex:
	:type nApex: gp_Pnt
	:param fpara:
	:type fpara: float
	:param lpara:
	:type lpara: float
	:param IsInDomain:
	:type IsInDomain: bool
	:rtype: gp_Pnt
") NearestApex;
		static gp_Pnt NearestApex (const gp_Elips & elips,const gp_Pnt & pApex,const gp_Pnt & nApex,const Standard_Real fpara,const Standard_Real lpara,Standard_Boolean &OutValue);
		%feature("compactdefaultargs") ProjectPointOnLine;
		%feature("autodoc", "	:param aPoint:
	:type aPoint: gp_Pnt
	:param aLine:
	:type aLine: gp_Lin
	:rtype: gp_Pnt
") ProjectPointOnLine;
		static gp_Pnt ProjectPointOnLine (const gp_Pnt & aPoint,const gp_Lin & aLine);
		%feature("compactdefaultargs") ProjectPointOnPlane;
		%feature("autodoc", "	:param aPoint:
	:type aPoint: gp_Pnt
	:param aPlane:
	:type aPlane: gp_Pln
	:rtype: gp_Pnt
") ProjectPointOnPlane;
		static gp_Pnt ProjectPointOnPlane (const gp_Pnt & aPoint,const gp_Pln & aPlane);
		%feature("compactdefaultargs") TranslatePointToBound;
		%feature("autodoc", "	:param aPoint:
	:type aPoint: gp_Pnt
	:param aDir:
	:type aDir: gp_Dir
	:param aBndBox:
	:type aBndBox: Bnd_Box &
	:rtype: gp_Pnt
") TranslatePointToBound;
		static gp_Pnt TranslatePointToBound (const gp_Pnt & aPoint,const gp_Dir & aDir,const Bnd_Box & aBndBox);
};


%extend AIS {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor AIS_Animation;
class AIS_Animation : public Standard_Transient {
	public:
		%feature("compactdefaultargs") AIS_Animation;
		%feature("autodoc", "	* Creates empty animation.

	:param theAnimationName:
	:type theAnimationName: TCollection_AsciiString &
	:rtype: None
") AIS_Animation;
		 AIS_Animation (const TCollection_AsciiString & theAnimationName);
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "	* Add single animation to the timeline. @param theAnimation input animation

	:param theAnimation:
	:type theAnimation: opencascade::handle<AIS_Animation> &
	:rtype: None
") Add;
		void Add (const opencascade::handle<AIS_Animation> & theAnimation);
		%feature("compactdefaultargs") Children;
		%feature("autodoc", "	* Return sequence of child animations.

	:rtype: NCollection_Sequence<opencascade::handle<AIS_Animation> >
") Children;
		const NCollection_Sequence<opencascade::handle<AIS_Animation> > & Children ();
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	* Clear animation timeline - remove all animations from it.

	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") CopyFrom;
		%feature("autodoc", "	* Clears own children and then copy child animations from another object. Copy also Start Time and Duration values.

	:param theOther:
	:type theOther: opencascade::handle<AIS_Animation> &
	:rtype: None
") CopyFrom;
		void CopyFrom (const opencascade::handle<AIS_Animation> & theOther);
		%feature("compactdefaultargs") Duration;
		%feature("autodoc", "	* returns duration of the animation in the timeline

	:rtype: float
") Duration;
		Standard_Real Duration ();
		%feature("compactdefaultargs") ElapsedTime;
		%feature("autodoc", "	* Return elapsed time.

	:rtype: float
") ElapsedTime;
		Standard_Real ElapsedTime ();
		%feature("compactdefaultargs") Find;
		%feature("autodoc", "	* Return the child animation with the given name.

	:param theAnimationName:
	:type theAnimationName: TCollection_AsciiString &
	:rtype: opencascade::handle<AIS_Animation>
") Find;
		opencascade::handle<AIS_Animation> Find (const TCollection_AsciiString & theAnimationName);
		%feature("compactdefaultargs") HasOwnDuration;
		%feature("autodoc", "	* Return true if duration is defined.

	:rtype: bool
") HasOwnDuration;
		Standard_Boolean HasOwnDuration ();
		%feature("compactdefaultargs") IsStopped;
		%feature("autodoc", "	* Check if animation is to be performed in the animation timeline. returns True if it is stopped of finished.

	:rtype: bool
") IsStopped;
		bool IsStopped ();
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "	* Animation name.

	:rtype: TCollection_AsciiString
") Name;
		const TCollection_AsciiString & Name ();
		%feature("compactdefaultargs") OwnDuration;
		%feature("autodoc", "	* returns own duration of the animation in the timeline

	:rtype: float
") OwnDuration;
		Standard_Real OwnDuration ();
		%feature("compactdefaultargs") Pause;
		%feature("autodoc", "	* Pause the process timeline.

	:rtype: void
") Pause;
		virtual void Pause ();
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	* Remove the child animation.

	:param theAnimation:
	:type theAnimation: opencascade::handle<AIS_Animation> &
	:rtype: bool
") Remove;
		Standard_Boolean Remove (const opencascade::handle<AIS_Animation> & theAnimation);
		%feature("compactdefaultargs") Replace;
		%feature("autodoc", "	* Replace the child animation.

	:param theAnimationOld:
	:type theAnimationOld: opencascade::handle<AIS_Animation> &
	:param theAnimationNew:
	:type theAnimationNew: opencascade::handle<AIS_Animation> &
	:rtype: bool
") Replace;
		Standard_Boolean Replace (const opencascade::handle<AIS_Animation> & theAnimationOld,const opencascade::handle<AIS_Animation> & theAnimationNew);
		%feature("compactdefaultargs") SetOwnDuration;
		%feature("autodoc", "	* Defines duration of the animation.

	:param theDuration:
	:type theDuration: float
	:rtype: None
") SetOwnDuration;
		void SetOwnDuration (const Standard_Real theDuration);
		%feature("compactdefaultargs") SetStartPts;
		%feature("autodoc", "	* Sets time limits for animation in the animation timeline

	:param thePtsStart:
	:type thePtsStart: float
	:rtype: None
") SetStartPts;
		void SetStartPts (const Standard_Real thePtsStart);
		%feature("compactdefaultargs") Start;
		%feature("autodoc", "	* Start animation. This method changes status of the animation to Started. This status defines whether animation is to be performed in the timeline or not. @param theToUpdate call Update() method

	:param theToUpdate:
	:type theToUpdate: bool
	:rtype: void
") Start;
		virtual void Start (const Standard_Boolean theToUpdate);
		%feature("compactdefaultargs") StartPts;
		%feature("autodoc", "	* returns start time of the animation in the timeline

	:rtype: float
") StartPts;
		Standard_Real StartPts ();
		%feature("compactdefaultargs") StartTimer;
		%feature("autodoc", "	* Start animation with internally defined timer instance. Calls ::Start() internally. //! Note, that this method initializes a timer calculating an elapsed time (presentation timestamps within AIS_Animation::UpdateTimer()), not a multimedia timer executing Viewer updates at specific intervals! Viewer redrawing should be managed at application level, so that AIS_Animation::UpdateTimer() is called once right before each redrawing of a Viewer content. //! @param theStartPts starting timer position (presentation timestamp) @param thePlaySpeed playback speed (1.0 means normal speed) @param theToUpdate flag to update defined animations to specified start position @param theToStopTimer flag to pause timer at the starting position

	:param theStartPts:
	:type theStartPts: float
	:param thePlaySpeed:
	:type thePlaySpeed: float
	:param theToUpdate:
	:type theToUpdate: bool
	:param theToStopTimer: default value is Standard_False
	:type theToStopTimer: bool
	:rtype: void
") StartTimer;
		virtual void StartTimer (const Standard_Real theStartPts,const Standard_Real thePlaySpeed,const Standard_Boolean theToUpdate,const Standard_Boolean theToStopTimer = Standard_False);
		%feature("compactdefaultargs") Stop;
		%feature("autodoc", "	* Stop animation. This method changed status of the animation to Stopped. This status shows that animation will not be performed in the timeline or it is finished.

	:rtype: void
") Stop;
		virtual void Stop ();
		%feature("compactdefaultargs") Update;
		%feature("autodoc", "	* Update single frame of animation, update timer state @param thePts [in] the time moment within [0; Duration()] returns True if timeline is in progress

	:param thePts:
	:type thePts: float
	:rtype: bool
") Update;
		virtual Standard_Boolean Update (const Standard_Real thePts);
		%feature("compactdefaultargs") UpdateTimer;
		%feature("autodoc", "	* Update single frame of animation, update timer state returns current time of timeline progress.

	:rtype: float
") UpdateTimer;
		virtual Standard_Real UpdateTimer ();
		%feature("compactdefaultargs") UpdateTotalDuration;
		%feature("autodoc", "	* Update total duration considering all animations on timeline.

	:rtype: None
") UpdateTotalDuration;
		void UpdateTotalDuration ();
};


%make_alias(AIS_Animation)

%extend AIS_Animation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor AIS_AnimationProgress;
class AIS_AnimationProgress {
	public:
		float Pts;
		float LocalPts;
		float LocalNormalized;
		%feature("compactdefaultargs") AIS_AnimationProgress;
		%feature("autodoc", "	* //!< normalized position within current animation within 0..1 range

	:rtype: None
") AIS_AnimationProgress;
		 AIS_AnimationProgress ();
};


%extend AIS_AnimationProgress {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor AIS_AttributeFilter;
class AIS_AttributeFilter : public SelectMgr_Filter {
	public:
		%feature("compactdefaultargs") AIS_AttributeFilter;
		%feature("autodoc", "	* Constructs an empty attribute filter object. This filter object determines whether selectable interactive objects have a non-null owner.

	:rtype: None
") AIS_AttributeFilter;
		 AIS_AttributeFilter ();
		%feature("compactdefaultargs") AIS_AttributeFilter;
		%feature("autodoc", "	* Constructs an attribute filter object defined by the color attribute aCol.

	:param aCol:
	:type aCol: Quantity_NameOfColor
	:rtype: None
") AIS_AttributeFilter;
		 AIS_AttributeFilter (const Quantity_NameOfColor aCol);
		%feature("compactdefaultargs") AIS_AttributeFilter;
		%feature("autodoc", "	* Constructs an attribute filter object defined by the line width attribute aWidth.

	:param aWidth:
	:type aWidth: float
	:rtype: None
") AIS_AttributeFilter;
		 AIS_AttributeFilter (const Standard_Real aWidth);
		%feature("compactdefaultargs") HasColor;
		%feature("autodoc", "	* Indicates that the Interactive Object has the color setting specified by the argument aCol at construction time.

	:rtype: bool
") HasColor;
		Standard_Boolean HasColor ();
		%feature("compactdefaultargs") HasWidth;
		%feature("autodoc", "	* Indicates that the Interactive Object has the width setting specified by the argument aWidth at construction time.

	:rtype: bool
") HasWidth;
		Standard_Boolean HasWidth ();
		%feature("compactdefaultargs") IsOk;
		%feature("autodoc", "	* Indicates that the selected Interactive Object passes the filter. The owner, anObj, can be either direct or user. A direct owner is the corresponding construction element, whereas a user is the compound shape of which the entity forms a part. If the Interactive Object returns Standard_True when detected by the Local Context selector through the mouse, the object is kept; if not, it is rejected.

	:param anObj:
	:type anObj: opencascade::handle<SelectMgr_EntityOwner> &
	:rtype: bool
") IsOk;
		virtual Standard_Boolean IsOk (const opencascade::handle<SelectMgr_EntityOwner> & anObj);
		%feature("compactdefaultargs") SetColor;
		%feature("autodoc", "	* Sets the color aCol. This must be chosen from the list of colors in Quantity_NameOfColor.

	:param aCol:
	:type aCol: Quantity_NameOfColor
	:rtype: None
") SetColor;
		void SetColor (const Quantity_NameOfColor aCol);
		%feature("compactdefaultargs") SetWidth;
		%feature("autodoc", "	* Sets the line width aWidth.

	:param aWidth:
	:type aWidth: float
	:rtype: None
") SetWidth;
		void SetWidth (const Standard_Real aWidth);
		%feature("compactdefaultargs") UnsetColor;
		%feature("autodoc", "	* Removes the setting for color from the filter.

	:rtype: None
") UnsetColor;
		void UnsetColor ();
		%feature("compactdefaultargs") UnsetWidth;
		%feature("autodoc", "	* Removes the setting for width from the filter.

	:rtype: None
") UnsetWidth;
		void UnsetWidth ();
};


%make_alias(AIS_AttributeFilter)

%extend AIS_AttributeFilter {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor AIS_BadEdgeFilter;
class AIS_BadEdgeFilter : public SelectMgr_Filter {
	public:
		%feature("compactdefaultargs") AIS_BadEdgeFilter;
		%feature("autodoc", "	* Constructs an empty filter object for bad edges.

	:rtype: None
") AIS_BadEdgeFilter;
		 AIS_BadEdgeFilter ();
		%feature("compactdefaultargs") ActsOn;
		%feature("autodoc", "	:param aType:
	:type aType: TopAbs_ShapeEnum
	:rtype: bool
") ActsOn;
		virtual Standard_Boolean ActsOn (const TopAbs_ShapeEnum aType);
		%feature("compactdefaultargs") AddEdge;
		%feature("autodoc", "	* Adds an edge to the list of non-selectionnable edges.

	:param anEdge:
	:type anEdge: TopoDS_Edge &
	:param Index:
	:type Index: int
	:rtype: None
") AddEdge;
		void AddEdge (const TopoDS_Edge & anEdge,const Standard_Integer Index);
		%feature("compactdefaultargs") IsOk;
		%feature("autodoc", "	:param EO:
	:type EO: opencascade::handle<SelectMgr_EntityOwner> &
	:rtype: bool
") IsOk;
		virtual Standard_Boolean IsOk (const opencascade::handle<SelectMgr_EntityOwner> & EO);
		%feature("compactdefaultargs") RemoveEdges;
		%feature("autodoc", "	* removes from the list of non-selectionnable edges all edges in the contour <Index>.

	:param Index:
	:type Index: int
	:rtype: None
") RemoveEdges;
		void RemoveEdges (const Standard_Integer Index);
		%feature("compactdefaultargs") SetContour;
		%feature("autodoc", "	* sets <myContour> with current contour. used by IsOk.

	:param Index:
	:type Index: int
	:rtype: None
") SetContour;
		void SetContour (const Standard_Integer Index);
};


%make_alias(AIS_BadEdgeFilter)

%extend AIS_BadEdgeFilter {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor AIS_C0RegularityFilter;
class AIS_C0RegularityFilter : public SelectMgr_Filter {
	public:
		%feature("compactdefaultargs") AIS_C0RegularityFilter;
		%feature("autodoc", "	:param aShape:
	:type aShape: TopoDS_Shape &
	:rtype: None
") AIS_C0RegularityFilter;
		 AIS_C0RegularityFilter (const TopoDS_Shape & aShape);
		%feature("compactdefaultargs") ActsOn;
		%feature("autodoc", "	:param aType:
	:type aType: TopAbs_ShapeEnum
	:rtype: bool
") ActsOn;
		virtual Standard_Boolean ActsOn (const TopAbs_ShapeEnum aType);
		%feature("compactdefaultargs") IsOk;
		%feature("autodoc", "	:param EO:
	:type EO: opencascade::handle<SelectMgr_EntityOwner> &
	:rtype: bool
") IsOk;
		virtual Standard_Boolean IsOk (const opencascade::handle<SelectMgr_EntityOwner> & EO);
};


%make_alias(AIS_C0RegularityFilter)

%extend AIS_C0RegularityFilter {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor AIS_ColoredDrawer;
class AIS_ColoredDrawer : public Prs3d_Drawer {
	public:
		bool myIsHidden;
		bool myHasOwnColor;
		bool myHasOwnTransp;
		bool myHasOwnWidth;
		%feature("compactdefaultargs") AIS_ColoredDrawer;
		%feature("autodoc", "	* Default constructor.

	:param theLink:
	:type theLink: opencascade::handle<Prs3d_Drawer> &
	:rtype: None
") AIS_ColoredDrawer;
		 AIS_ColoredDrawer (const opencascade::handle<Prs3d_Drawer> & theLink);
		%feature("compactdefaultargs") HasOwnColor;
		%feature("autodoc", "	:rtype: bool
") HasOwnColor;
		bool HasOwnColor ();
		%feature("compactdefaultargs") HasOwnTransparency;
		%feature("autodoc", "	:rtype: bool
") HasOwnTransparency;
		bool HasOwnTransparency ();
		%feature("compactdefaultargs") HasOwnWidth;
		%feature("autodoc", "	:rtype: bool
") HasOwnWidth;
		bool HasOwnWidth ();
		%feature("compactdefaultargs") IsHidden;
		%feature("autodoc", "	:rtype: bool
") IsHidden;
		bool IsHidden ();
		%feature("compactdefaultargs") SetHidden;
		%feature("autodoc", "	:param theToHide:
	:type theToHide: bool
	:rtype: None
") SetHidden;
		void SetHidden (const bool theToHide);
		%feature("compactdefaultargs") SetOwnColor;
		%feature("autodoc", "	:param &:
	:type &: Quantity_Color
	:rtype: None
") SetOwnColor;
		void SetOwnColor (const Quantity_Color &);
		%feature("compactdefaultargs") SetOwnTransparency;
		%feature("autodoc", "	:param :
	:type : float
	:rtype: None
") SetOwnTransparency;
		void SetOwnTransparency (Standard_Real );
		%feature("compactdefaultargs") SetOwnWidth;
		%feature("autodoc", "	:param Standard_Real:
	:type Standard_Real: 
	:rtype: None
") SetOwnWidth;
		void SetOwnWidth (const Standard_Real);
		%feature("compactdefaultargs") UnsetOwnColor;
		%feature("autodoc", "	:rtype: None
") UnsetOwnColor;
		void UnsetOwnColor ();
		%feature("compactdefaultargs") UnsetOwnTransparency;
		%feature("autodoc", "	:rtype: None
") UnsetOwnTransparency;
		void UnsetOwnTransparency ();
		%feature("compactdefaultargs") UnsetOwnWidth;
		%feature("autodoc", "	:rtype: None
") UnsetOwnWidth;
		void UnsetOwnWidth ();
};


%make_alias(AIS_ColoredDrawer)

%extend AIS_ColoredDrawer {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor AIS_DimensionOwner;
class AIS_DimensionOwner : public SelectMgr_EntityOwner {
	public:
		%feature("compactdefaultargs") AIS_DimensionOwner;
		%feature("autodoc", "	* Initializes the dimension owner, theSO, and attributes it the priority, thePriority.

	:param theSelObject:
	:type theSelObject: opencascade::handle<SelectMgr_SelectableObject> &
	:param theSelMode:
	:type theSelMode: AIS_DimensionSelectionMode
	:param thePriority: default value is 0
	:type thePriority: int
	:rtype: None
") AIS_DimensionOwner;
		 AIS_DimensionOwner (const opencascade::handle<SelectMgr_SelectableObject> & theSelObject,const AIS_DimensionSelectionMode theSelMode,const Standard_Integer thePriority = 0);
		%feature("compactdefaultargs") HilightWithColor;
		%feature("autodoc", "	:param thePM:
	:type thePM: opencascade::handle<PrsMgr_PresentationManager3d> &
	:param theStyle:
	:type theStyle: opencascade::handle<Prs3d_Drawer> &
	:param theMode: default value is 0
	:type theMode: int
	:rtype: void
") HilightWithColor;
		virtual void HilightWithColor (const opencascade::handle<PrsMgr_PresentationManager3d> & thePM,const opencascade::handle<Prs3d_Drawer> & theStyle,const Standard_Integer theMode = 0);
		%feature("compactdefaultargs") IsHilighted;
		%feature("autodoc", "	* Returns true if an object with the selection mode aMode is highlighted in the presentation manager aPM.

	:param thePM:
	:type thePM: opencascade::handle<PrsMgr_PresentationManager> &
	:param theMode: default value is 0
	:type theMode: int
	:rtype: bool
") IsHilighted;
		virtual Standard_Boolean IsHilighted (const opencascade::handle<PrsMgr_PresentationManager> & thePM,const Standard_Integer theMode = 0);
		%feature("compactdefaultargs") SelectionMode;
		%feature("autodoc", "	:rtype: AIS_DimensionSelectionMode
") SelectionMode;
		AIS_DimensionSelectionMode SelectionMode ();
		%feature("compactdefaultargs") Unhilight;
		%feature("autodoc", "	* Removes highlighting from the selected part of dimension.

	:param thePM:
	:type thePM: opencascade::handle<PrsMgr_PresentationManager> &
	:param theMode: default value is 0
	:type theMode: int
	:rtype: void
") Unhilight;
		virtual void Unhilight (const opencascade::handle<PrsMgr_PresentationManager> & thePM,const Standard_Integer theMode = 0);
};


%make_alias(AIS_DimensionOwner)

%extend AIS_DimensionOwner {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor AIS_ExclusionFilter;
class AIS_ExclusionFilter : public SelectMgr_Filter {
	public:
		%feature("compactdefaultargs") AIS_ExclusionFilter;
		%feature("autodoc", "	* Constructs an empty exclusion filter object defined by the flag setting ExclusionFlagOn. By default, the flag is set to true.

	:param ExclusionFlagOn: default value is Standard_True
	:type ExclusionFlagOn: bool
	:rtype: None
") AIS_ExclusionFilter;
		 AIS_ExclusionFilter (const Standard_Boolean ExclusionFlagOn = Standard_True);
		%feature("compactdefaultargs") AIS_ExclusionFilter;
		%feature("autodoc", "	* All the AIS objects of <TypeToExclude> Will be rejected by the IsOk Method.

	:param TypeToExclude:
	:type TypeToExclude: AIS_KindOfInteractive
	:param ExclusionFlagOn: default value is Standard_True
	:type ExclusionFlagOn: bool
	:rtype: None
") AIS_ExclusionFilter;
		 AIS_ExclusionFilter (const AIS_KindOfInteractive TypeToExclude,const Standard_Boolean ExclusionFlagOn = Standard_True);
		%feature("compactdefaultargs") AIS_ExclusionFilter;
		%feature("autodoc", "	* Constructs an exclusion filter object defined by the enumeration value TypeToExclude, the signature SignatureInType, and the flag setting ExclusionFlagOn. By default, the flag is set to true.

	:param TypeToExclude:
	:type TypeToExclude: AIS_KindOfInteractive
	:param SignatureInType:
	:type SignatureInType: int
	:param ExclusionFlagOn: default value is Standard_True
	:type ExclusionFlagOn: bool
	:rtype: None
") AIS_ExclusionFilter;
		 AIS_ExclusionFilter (const AIS_KindOfInteractive TypeToExclude,const Standard_Integer SignatureInType,const Standard_Boolean ExclusionFlagOn = Standard_True);
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "	* Adds the type TypeToExclude to the list of types.

	:param TypeToExclude:
	:type TypeToExclude: AIS_KindOfInteractive
	:rtype: bool
") Add;
		Standard_Boolean Add (const AIS_KindOfInteractive TypeToExclude);
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "	:param TypeToExclude:
	:type TypeToExclude: AIS_KindOfInteractive
	:param SignatureInType:
	:type SignatureInType: int
	:rtype: bool
") Add;
		Standard_Boolean Add (const AIS_KindOfInteractive TypeToExclude,const Standard_Integer SignatureInType);
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") IsExclusionFlagOn;
		%feature("autodoc", "	:rtype: bool
") IsExclusionFlagOn;
		Standard_Boolean IsExclusionFlagOn ();
		%feature("compactdefaultargs") IsOk;
		%feature("autodoc", "	:param anObj:
	:type anObj: opencascade::handle<SelectMgr_EntityOwner> &
	:rtype: bool
") IsOk;
		virtual Standard_Boolean IsOk (const opencascade::handle<SelectMgr_EntityOwner> & anObj);
		%feature("compactdefaultargs") IsStored;
		%feature("autodoc", "	:param aType:
	:type aType: AIS_KindOfInteractive
	:rtype: bool
") IsStored;
		Standard_Boolean IsStored (const AIS_KindOfInteractive aType);
		%feature("compactdefaultargs") ListOfSignature;
		%feature("autodoc", "	:param aType:
	:type aType: AIS_KindOfInteractive
	:param TheStoredList:
	:type TheStoredList: TColStd_ListOfInteger &
	:rtype: None
") ListOfSignature;
		void ListOfSignature (const AIS_KindOfInteractive aType,TColStd_ListOfInteger & TheStoredList);
		%feature("compactdefaultargs") ListOfStoredTypes;
		%feature("autodoc", "	:param TheList:
	:type TheList: TColStd_ListOfInteger &
	:rtype: None
") ListOfStoredTypes;
		void ListOfStoredTypes (TColStd_ListOfInteger & TheList);
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	:param TypeToExclude:
	:type TypeToExclude: AIS_KindOfInteractive
	:rtype: bool
") Remove;
		Standard_Boolean Remove (const AIS_KindOfInteractive TypeToExclude);
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	:param TypeToExclude:
	:type TypeToExclude: AIS_KindOfInteractive
	:param SignatureInType:
	:type SignatureInType: int
	:rtype: bool
") Remove;
		Standard_Boolean Remove (const AIS_KindOfInteractive TypeToExclude,const Standard_Integer SignatureInType);
		%feature("compactdefaultargs") SetExclusionFlag;
		%feature("autodoc", "	:param Status:
	:type Status: bool
	:rtype: None
") SetExclusionFlag;
		void SetExclusionFlag (const Standard_Boolean Status);
};


%make_alias(AIS_ExclusionFilter)

%extend AIS_ExclusionFilter {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor AIS_GlobalStatus;
class AIS_GlobalStatus : public Standard_Transient {
	public:
		%feature("compactdefaultargs") AIS_GlobalStatus;
		%feature("autodoc", "	:rtype: None
") AIS_GlobalStatus;
		 AIS_GlobalStatus ();
		%feature("compactdefaultargs") AIS_GlobalStatus;
		%feature("autodoc", "	:param aStat:
	:type aStat: AIS_DisplayStatus
	:param aDispMode:
	:type aDispMode: int
	:param aSelMode:
	:type aSelMode: int
	:param ishilighted: default value is Standard_False
	:type ishilighted: bool
	:param aLayerIndex: default value is 0
	:type aLayerIndex: int
	:rtype: None
") AIS_GlobalStatus;
		 AIS_GlobalStatus (const AIS_DisplayStatus aStat,const Standard_Integer aDispMode,const Standard_Integer aSelMode,const Standard_Boolean ishilighted = Standard_False,const Standard_Integer aLayerIndex = 0);
		%feature("compactdefaultargs") AddSelectionMode;
		%feature("autodoc", "	:param theMode:
	:type theMode: int
	:rtype: None
") AddSelectionMode;
		void AddSelectionMode (const Standard_Integer theMode);
		%feature("compactdefaultargs") ClearSelectionModes;
		%feature("autodoc", "	:rtype: None
") ClearSelectionModes;
		void ClearSelectionModes ();
		%feature("compactdefaultargs") DisplayMode;
		%feature("autodoc", "	* Returns the display mode.

	:rtype: int
") DisplayMode;
		Standard_Integer DisplayMode ();
		%feature("compactdefaultargs") GetLayerIndex;
		%feature("autodoc", "	* Returns layer index.

	:rtype: int
") GetLayerIndex;
		Standard_Integer GetLayerIndex ();
		%feature("compactdefaultargs") GraphicStatus;
		%feature("autodoc", "	:rtype: AIS_DisplayStatus
") GraphicStatus;
		AIS_DisplayStatus GraphicStatus ();
		%feature("compactdefaultargs") HilightStyle;
		%feature("autodoc", "	* Returns applied highlight style for a particular object

	:rtype: opencascade::handle<Prs3d_Drawer>
") HilightStyle;
		const opencascade::handle<Prs3d_Drawer> & HilightStyle ();
		%feature("compactdefaultargs") IsHilighted;
		%feature("autodoc", "	:rtype: bool
") IsHilighted;
		Standard_Boolean IsHilighted ();
		%feature("compactdefaultargs") IsSModeIn;
		%feature("autodoc", "	:param aMode:
	:type aMode: int
	:rtype: bool
") IsSModeIn;
		Standard_Boolean IsSModeIn (const Standard_Integer aMode);
		%feature("compactdefaultargs") IsSubIntensityOn;
		%feature("autodoc", "	:rtype: bool
") IsSubIntensityOn;
		Standard_Boolean IsSubIntensityOn ();
		%feature("compactdefaultargs") RemoveSelectionMode;
		%feature("autodoc", "	:param aMode:
	:type aMode: int
	:rtype: None
") RemoveSelectionMode;
		void RemoveSelectionMode (const Standard_Integer aMode);
		%feature("compactdefaultargs") SelectionModes;
		%feature("autodoc", "	* keeps the active selection modes of the object in the main viewer.

	:rtype: TColStd_ListOfInteger
") SelectionModes;
		const TColStd_ListOfInteger & SelectionModes ();
		%feature("compactdefaultargs") SetDisplayMode;
		%feature("autodoc", "	* Sets display mode.

	:param theMode:
	:type theMode: int
	:rtype: None
") SetDisplayMode;
		void SetDisplayMode (const Standard_Integer theMode);
		%feature("compactdefaultargs") SetGraphicStatus;
		%feature("autodoc", "	:param theStatus:
	:type theStatus: AIS_DisplayStatus
	:rtype: None
") SetGraphicStatus;
		void SetGraphicStatus (const AIS_DisplayStatus theStatus);
		%feature("compactdefaultargs") SetHilightStatus;
		%feature("autodoc", "	:param theStatus:
	:type theStatus: bool
	:rtype: None
") SetHilightStatus;
		void SetHilightStatus (const Standard_Boolean theStatus);
		%feature("compactdefaultargs") SetHilightStyle;
		%feature("autodoc", "	* Changes applied highlight style for a particular object

	:param theStyle:
	:type theStyle: opencascade::handle<Prs3d_Drawer> &
	:rtype: None
") SetHilightStyle;
		void SetHilightStyle (const opencascade::handle<Prs3d_Drawer> & theStyle);
		%feature("compactdefaultargs") SetLayerIndex;
		%feature("autodoc", "	:param theIndex:
	:type theIndex: int
	:rtype: None
") SetLayerIndex;
		void SetLayerIndex (const Standard_Integer theIndex);
		%feature("compactdefaultargs") SubIntensityOff;
		%feature("autodoc", "	:rtype: None
") SubIntensityOff;
		void SubIntensityOff ();
		%feature("compactdefaultargs") SubIntensityOn;
		%feature("autodoc", "	:rtype: None
") SubIntensityOn;
		void SubIntensityOn ();
};


%make_alias(AIS_GlobalStatus)

%extend AIS_GlobalStatus {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
class AIS_GraphicTool {
	public:
		%feature("compactdefaultargs") GetInteriorColor;
		%feature("autodoc", "	:param aDrawer:
	:type aDrawer: opencascade::handle<Prs3d_Drawer> &
	:rtype: Quantity_NameOfColor
") GetInteriorColor;
		static Quantity_NameOfColor GetInteriorColor (const opencascade::handle<Prs3d_Drawer> & aDrawer);
		%feature("compactdefaultargs") GetInteriorColor;
		%feature("autodoc", "	:param aDrawer:
	:type aDrawer: opencascade::handle<Prs3d_Drawer> &
	:param aColor:
	:type aColor: Quantity_Color &
	:rtype: void
") GetInteriorColor;
		static void GetInteriorColor (const opencascade::handle<Prs3d_Drawer> & aDrawer,Quantity_Color & aColor);
		%feature("compactdefaultargs") GetLineAtt;
		%feature("autodoc", "	:param aDrawer:
	:type aDrawer: opencascade::handle<Prs3d_Drawer> &
	:param TheTypeOfAttributes:
	:type TheTypeOfAttributes: AIS_TypeOfAttribute
	:param aCol:
	:type aCol: Quantity_NameOfColor &
	:param aWidth:
	:type aWidth: float &
	:param aTyp:
	:type aTyp: Aspect_TypeOfLine &
	:rtype: void
") GetLineAtt;
		static void GetLineAtt (const opencascade::handle<Prs3d_Drawer> & aDrawer,const AIS_TypeOfAttribute TheTypeOfAttributes,Quantity_NameOfColor & aCol,Standard_Real &OutValue,Aspect_TypeOfLine & aTyp);
		%feature("compactdefaultargs") GetLineColor;
		%feature("autodoc", "	:param aDrawer:
	:type aDrawer: opencascade::handle<Prs3d_Drawer> &
	:param TheTypeOfAttributes:
	:type TheTypeOfAttributes: AIS_TypeOfAttribute
	:rtype: Quantity_NameOfColor
") GetLineColor;
		static Quantity_NameOfColor GetLineColor (const opencascade::handle<Prs3d_Drawer> & aDrawer,const AIS_TypeOfAttribute TheTypeOfAttributes);
		%feature("compactdefaultargs") GetLineColor;
		%feature("autodoc", "	:param aDrawer:
	:type aDrawer: opencascade::handle<Prs3d_Drawer> &
	:param TheTypeOfAttributes:
	:type TheTypeOfAttributes: AIS_TypeOfAttribute
	:param TheLineColor:
	:type TheLineColor: Quantity_Color &
	:rtype: void
") GetLineColor;
		static void GetLineColor (const opencascade::handle<Prs3d_Drawer> & aDrawer,const AIS_TypeOfAttribute TheTypeOfAttributes,Quantity_Color & TheLineColor);
		%feature("compactdefaultargs") GetLineType;
		%feature("autodoc", "	:param aDrawer:
	:type aDrawer: opencascade::handle<Prs3d_Drawer> &
	:param TheTypeOfAttributes:
	:type TheTypeOfAttributes: AIS_TypeOfAttribute
	:rtype: Aspect_TypeOfLine
") GetLineType;
		static Aspect_TypeOfLine GetLineType (const opencascade::handle<Prs3d_Drawer> & aDrawer,const AIS_TypeOfAttribute TheTypeOfAttributes);
		%feature("compactdefaultargs") GetLineWidth;
		%feature("autodoc", "	:param aDrawer:
	:type aDrawer: opencascade::handle<Prs3d_Drawer> &
	:param TheTypeOfAttributes:
	:type TheTypeOfAttributes: AIS_TypeOfAttribute
	:rtype: float
") GetLineWidth;
		static Standard_Real GetLineWidth (const opencascade::handle<Prs3d_Drawer> & aDrawer,const AIS_TypeOfAttribute TheTypeOfAttributes);
		%feature("compactdefaultargs") GetMaterial;
		%feature("autodoc", "	:param aDrawer:
	:type aDrawer: opencascade::handle<Prs3d_Drawer> &
	:rtype: Graphic3d_MaterialAspect
") GetMaterial;
		static Graphic3d_MaterialAspect GetMaterial (const opencascade::handle<Prs3d_Drawer> & aDrawer);
};


%extend AIS_GraphicTool {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor AIS_InteractiveContext;
class AIS_InteractiveContext : public Standard_Transient {
	public:
		%feature("compactdefaultargs") AIS_InteractiveContext;
		%feature("autodoc", "	* @name object display management Constructs the interactive context object defined by the principal viewer MainViewer.

	:param MainViewer:
	:type MainViewer: opencascade::handle<V3d_Viewer> &
	:rtype: None
") AIS_InteractiveContext;
		 AIS_InteractiveContext (const opencascade::handle<V3d_Viewer> & MainViewer);
		%feature("compactdefaultargs") Activate;
		%feature("autodoc", "	* Activates the selection mode aMode whose index is given, for the given interactive entity anIobj.

	:param theObj:
	:type theObj: opencascade::handle<AIS_InteractiveObject> &
	:param theMode: default value is 0
	:type theMode: int
	:param theIsForce: default value is Standard_False
	:type theIsForce: bool
	:rtype: None
") Activate;
		void Activate (const opencascade::handle<AIS_InteractiveObject> & theObj,const Standard_Integer theMode = 0,const Standard_Boolean theIsForce = Standard_False);
		%feature("compactdefaultargs") Activate;
		%feature("autodoc", "	* Activates the given selection mode for the all displayed objects.

	:param theMode:
	:type theMode: int
	:param theIsForce: default value is Standard_False
	:type theIsForce: bool
	:rtype: None
") Activate;
		void Activate (const Standard_Integer theMode,const Standard_Boolean theIsForce = Standard_False);
		%feature("compactdefaultargs") ActivatedModes;
		%feature("autodoc", "	* Returns the list of activated selection modes.

	:param anIobj:
	:type anIobj: opencascade::handle<AIS_InteractiveObject> &
	:param theList:
	:type theList: TColStd_ListOfInteger &
	:rtype: None
") ActivatedModes;
		void ActivatedModes (const opencascade::handle<AIS_InteractiveObject> & anIobj,TColStd_ListOfInteger & theList);
		%feature("compactdefaultargs") AddFilter;
		%feature("autodoc", "	* Allows you to add the filter.

	:param theFilter:
	:type theFilter: opencascade::handle<SelectMgr_Filter> &
	:rtype: None
") AddFilter;
		void AddFilter (const opencascade::handle<SelectMgr_Filter> & theFilter);
		%feature("compactdefaultargs") AddOrRemoveCurrentObject;
		%feature("autodoc", "	* Allows to add or remove the object given to the list of current and highlight/unhighlight it correspondingly. Is valid for global context only; for local context use method AddOrRemoveSelected. Since this method makes sence only for neutral point selection of a whole object, if 0 selection of the object is empty this method simply does nothing.

	:param theObj:
	:type theObj: opencascade::handle<AIS_InteractiveObject> &
	:param theIsToUpdateViewer:
	:type theIsToUpdateViewer: bool
	:rtype: None
") AddOrRemoveCurrentObject;
		void AddOrRemoveCurrentObject (const opencascade::handle<AIS_InteractiveObject> & theObj,const Standard_Boolean theIsToUpdateViewer);
		%feature("compactdefaultargs") AddOrRemoveSelected;
		%feature("autodoc", "	* Allows to highlight or unhighlight the owner given depending on its selection status

	:param theObject:
	:type theObject: opencascade::handle<AIS_InteractiveObject> &
	:param theToUpdateViewer:
	:type theToUpdateViewer: bool
	:rtype: None
") AddOrRemoveSelected;
		void AddOrRemoveSelected (const opencascade::handle<AIS_InteractiveObject> & theObject,const Standard_Boolean theToUpdateViewer);
		%feature("compactdefaultargs") AddOrRemoveSelected;
		%feature("autodoc", "	* Allows to highlight or unhighlight the owner given depending on its selection status

	:param theOwner:
	:type theOwner: opencascade::handle<SelectMgr_EntityOwner> &
	:param theToUpdateViewer:
	:type theToUpdateViewer: bool
	:rtype: None
") AddOrRemoveSelected;
		void AddOrRemoveSelected (const opencascade::handle<SelectMgr_EntityOwner> & theOwner,const Standard_Boolean theToUpdateViewer);
		%feature("compactdefaultargs") AddSelect;
		%feature("autodoc", "	* Adds object in the selection.

	:param theObject:
	:type theObject: opencascade::handle<SelectMgr_EntityOwner> &
	:rtype: AIS_StatusOfPick
") AddSelect;
		AIS_StatusOfPick AddSelect (const opencascade::handle<SelectMgr_EntityOwner> & theObject);
		%feature("compactdefaultargs") AddSelect;
		%feature("autodoc", "	* Adds object in the selection.

	:param theObject:
	:type theObject: opencascade::handle<AIS_InteractiveObject> &
	:rtype: AIS_StatusOfPick
") AddSelect;
		AIS_StatusOfPick AddSelect (const opencascade::handle<AIS_InteractiveObject> & theObject);
		%feature("compactdefaultargs") Applicative;
		%feature("autodoc", "	* Returns SelectedInteractive()->GetOwner(). @sa SelectedOwner().

	:rtype: opencascade::handle<Standard_Transient>
") Applicative;
		opencascade::handle<Standard_Transient> Applicative ();
		%feature("compactdefaultargs") AutomaticHilight;
		%feature("autodoc", "	* Returns true if the automatic highlight mode is active; True by default. @sa MoveTo(), Select(), HilightWithColor(), Unhilight()

	:rtype: bool
") AutomaticHilight;
		Standard_Boolean AutomaticHilight ();
		%feature("compactdefaultargs") BeginImmediateDraw;
		%feature("autodoc", "	* @name immediate mode rendering initializes the list of presentations to be displayed returns False if no local context is opened.

	:rtype: bool
") BeginImmediateDraw;
		Standard_Boolean BeginImmediateDraw ();
		%feature("compactdefaultargs") BoundingBoxOfSelection;
		%feature("autodoc", "	* Returns bounding box of selected objects.

	:rtype: Bnd_Box
") BoundingBoxOfSelection;
		Bnd_Box BoundingBoxOfSelection ();
		%feature("compactdefaultargs") ClearActiveSensitive;
		%feature("autodoc", "	* Clear visualization of sensitives.

	:param aView:
	:type aView: opencascade::handle<V3d_View> &
	:rtype: None
") ClearActiveSensitive;
		void ClearActiveSensitive (const opencascade::handle<V3d_View> & aView);
		%feature("compactdefaultargs") ClearCurrents;
		%feature("autodoc", "	* Empties previous current objects in order to get the current objects detected by the selector using UpdateCurrent. Objects selected when there is no open local context are called current objects; those selected in open local context, selected objects.

	:param theToUpdateViewer:
	:type theToUpdateViewer: bool
	:rtype: None
") ClearCurrents;
		void ClearCurrents (const Standard_Boolean theToUpdateViewer);
		%feature("compactdefaultargs") ClearDetected;
		%feature("autodoc", "	* Clears the list of entities detected by MoveTo() and resets dynamic highlighting. @param theToRedrawImmediate if True, the main Viewer will be redrawn on update returns True if viewer needs to be updated (e.g. there were actually dynamically highlighted entities)

	:param theToRedrawImmediate: default value is Standard_False
	:type theToRedrawImmediate: bool
	:rtype: bool
") ClearDetected;
		Standard_Boolean ClearDetected (Standard_Boolean theToRedrawImmediate = Standard_False);
		%feature("compactdefaultargs") ClearPrs;
		%feature("autodoc", "	* Empties the graphic presentation of the mode indexed by aMode. Warning! Removes theIObj. theIObj is still active if it was previously activated.

	:param theIObj:
	:type theIObj: opencascade::handle<AIS_InteractiveObject> &
	:param theMode:
	:type theMode: int
	:param theToUpdateViewer:
	:type theToUpdateViewer: bool
	:rtype: None
") ClearPrs;
		void ClearPrs (const opencascade::handle<AIS_InteractiveObject> & theIObj,const Standard_Integer theMode,const Standard_Boolean theToUpdateViewer);
		%feature("compactdefaultargs") ClearSelected;
		%feature("autodoc", "	* Empties previous selected objects in order to get the selected objects detected by the selector using UpdateSelected.

	:param theToUpdateViewer:
	:type theToUpdateViewer: bool
	:rtype: None
") ClearSelected;
		void ClearSelected (const Standard_Boolean theToUpdateViewer);
		%feature("compactdefaultargs") Color;
		%feature("autodoc", "	* Returns the color of the Object in the interactive context.

	:param aniobj:
	:type aniobj: opencascade::handle<AIS_InteractiveObject> &
	:param acolor:
	:type acolor: Quantity_Color &
	:rtype: None
") Color;
		void Color (const opencascade::handle<AIS_InteractiveObject> & aniobj,Quantity_Color & acolor);
		%feature("compactdefaultargs") Current;
		%feature("autodoc", "	* Returns the current interactive object. Objects selected when there is no open local context are called current objects; those selected in open local context, selected objects.

	:rtype: opencascade::handle<AIS_InteractiveObject>
") Current;
		opencascade::handle<AIS_InteractiveObject> Current ();
		%feature("compactdefaultargs") CurrentViewer;
		%feature("autodoc", "	* Returns the current viewer.

	:rtype: opencascade::handle<V3d_Viewer>
") CurrentViewer;
		const opencascade::handle<V3d_Viewer> & CurrentViewer ();
		%feature("compactdefaultargs") Deactivate;
		%feature("autodoc", "	* Deactivates all the activated selection modes of an object.

	:param theObj:
	:type theObj: opencascade::handle<AIS_InteractiveObject> &
	:rtype: None
") Deactivate;
		void Deactivate (const opencascade::handle<AIS_InteractiveObject> & theObj);
		%feature("compactdefaultargs") Deactivate;
		%feature("autodoc", "	* Deactivates all the activated selection modes of the interactive object anIobj with a given selection mode aMode.

	:param theObj:
	:type theObj: opencascade::handle<AIS_InteractiveObject> &
	:param theMode:
	:type theMode: int
	:rtype: None
") Deactivate;
		void Deactivate (const opencascade::handle<AIS_InteractiveObject> & theObj,const Standard_Integer theMode);
		%feature("compactdefaultargs") Deactivate;
		%feature("autodoc", "	* Deactivates the given selection mode for all displayed objects.

	:param theMode:
	:type theMode: int
	:rtype: None
") Deactivate;
		void Deactivate (const Standard_Integer theMode);
		%feature("compactdefaultargs") Deactivate;
		%feature("autodoc", "	* Deactivates all the activated selection mode at all displayed objects.

	:rtype: None
") Deactivate;
		void Deactivate ();
		%feature("compactdefaultargs") DefaultDrawer;
		%feature("autodoc", "	* @name common properties Returns the default attribute manager. This contains all the color and line attributes which can be used by interactive objects which do not have their own attributes.

	:rtype: opencascade::handle<Prs3d_Drawer>
") DefaultDrawer;
		const opencascade::handle<Prs3d_Drawer> & DefaultDrawer ();
		%feature("compactdefaultargs") DetectedCurrentObject;
		%feature("autodoc", "	* returns current mouse-detected interactive object or null object, if there is no currently detected interactives @sa DetectedCurrentOwner()/InitDetected()/MoreDetected()/NextDetected().

	:rtype: opencascade::handle<AIS_InteractiveObject>
") DetectedCurrentObject;
		opencascade::handle<AIS_InteractiveObject> DetectedCurrentObject ();
		%feature("compactdefaultargs") DetectedCurrentOwner;
		%feature("autodoc", "	* Returns the owner from detected list pointed by current iterator position. WARNING! This method is irrelevant to DetectedOwner() which returns last picked Owner regardless of iterator position! @sa InitDetected()/MoreDetected()/NextDetected().

	:rtype: opencascade::handle<SelectMgr_EntityOwner>
") DetectedCurrentOwner;
		opencascade::handle<SelectMgr_EntityOwner> DetectedCurrentOwner ();
		%feature("compactdefaultargs") DetectedCurrentShape;
		%feature("autodoc", "	* returns current mouse-detected shape or empty (null) shape, if current interactive object is not a shape (AIS_Shape) or there is no current mouse-detected interactive object at all. @sa DetectedCurrentOwner()/InitDetected()/MoreDetected()/NextDetected().

	:rtype: TopoDS_Shape
") DetectedCurrentShape;
		const TopoDS_Shape  DetectedCurrentShape ();
		%feature("compactdefaultargs") DetectedInteractive;
		%feature("autodoc", "	* Returns the interactive objects last detected in context. In general this is just a wrapper for opencascade::handle<AIS_InteractiveObject>::DownCast(DetectedOwner()->Selectable()). @sa DetectedOwner()

	:rtype: opencascade::handle<AIS_InteractiveObject>
") DetectedInteractive;
		opencascade::handle<AIS_InteractiveObject> DetectedInteractive ();
		%feature("compactdefaultargs") DetectedOwner;
		%feature("autodoc", "	* Returns the owner of the detected sensitive primitive which is currently dynamically highlighted. WARNING! This method is irrelevant to InitDetected()/MoreDetected()/NextDetected(). @sa HasDetected()/HasNextDetected()/HilightPreviousDetected()/HilightNextDetected().

	:rtype: opencascade::handle<SelectMgr_EntityOwner>
") DetectedOwner;
		const opencascade::handle<SelectMgr_EntityOwner> & DetectedOwner ();
		%feature("compactdefaultargs") DetectedShape;
		%feature("autodoc", "	* Returns the shape detected in local context. @sa DetectedOwner()

	:rtype: TopoDS_Shape
") DetectedShape;
		const TopoDS_Shape  DetectedShape ();
		%feature("compactdefaultargs") DeviationAngle;
		%feature("autodoc", "	:rtype: float
") DeviationAngle;
		Standard_Real DeviationAngle ();
		%feature("compactdefaultargs") DeviationCoefficient;
		%feature("autodoc", "	* Returns the deviation coefficient. Drawings of curves or patches are made with respect to a maximal chordal deviation. A Deviation coefficient is used in the shading display mode. The shape is seen decomposed into triangles. These are used to calculate reflection of light from the surface of the object. The triangles are formed from chords of the curves in the shape. The deviation coefficient gives the highest value of the angle with which a chord can deviate from a tangent to a curve. If this limit is reached, a new triangle is begun. This deviation is absolute and is set through Prs3d_Drawer::SetMaximalChordialDeviation. The default value is 0.001. In drawing shapes, however, you are allowed to ask for a relative deviation. This deviation will be: SizeOfObject * DeviationCoefficient.

	:rtype: float
") DeviationCoefficient;
		Standard_Real DeviationCoefficient ();
		%feature("compactdefaultargs") DisableDrawHiddenLine;
		%feature("autodoc", "	:rtype: None
") DisableDrawHiddenLine;
		void DisableDrawHiddenLine ();
		%feature("compactdefaultargs") Disconnect;
		%feature("autodoc", "	* Disconnects theObjToDisconnect from theAssembly and removes dependent selection structures

	:param theAssembly:
	:type theAssembly: opencascade::handle<AIS_InteractiveObject> &
	:param theObjToDisconnect: default value is NULL
	:type theObjToDisconnect: opencascade::handle<AIS_InteractiveObject> &
	:rtype: None
") Disconnect;
		void Disconnect (const opencascade::handle<AIS_InteractiveObject> & theAssembly,const opencascade::handle<AIS_InteractiveObject> & theObjToDisconnect = NULL);
		%feature("compactdefaultargs") Display;
		%feature("autodoc", "	* Displays the object in this Context using default Display Mode. This will be the object's default display mode, if there is one. Otherwise, it will be the context mode. The Interactive Object's default selection mode is activated if GetAutoActivateSelection() is True. In general, this is 0.

	:param theIObj:
	:type theIObj: opencascade::handle<AIS_InteractiveObject> &
	:param theToUpdateViewer:
	:type theToUpdateViewer: bool
	:rtype: None
") Display;
		void Display (const opencascade::handle<AIS_InteractiveObject> & theIObj,const Standard_Boolean theToUpdateViewer);
		%feature("compactdefaultargs") Display;
		%feature("autodoc", "	* Sets status, display mode and selection mode for specified Object If theSelectionMode equals -1, theIObj will not be activated: it will be displayed but will not be selectable.

	:param theIObj:
	:type theIObj: opencascade::handle<AIS_InteractiveObject> &
	:param theDispMode:
	:type theDispMode: int
	:param theSelectionMode:
	:type theSelectionMode: int
	:param theToUpdateViewer:
	:type theToUpdateViewer: bool
	:param theDispStatus: default value is AIS_DS_None
	:type theDispStatus: AIS_DisplayStatus
	:rtype: None
") Display;
		void Display (const opencascade::handle<AIS_InteractiveObject> & theIObj,const Standard_Integer theDispMode,const Standard_Integer theSelectionMode,const Standard_Boolean theToUpdateViewer,const AIS_DisplayStatus theDispStatus = AIS_DS_None);
		%feature("compactdefaultargs") Display;
		%feature("autodoc", "	:param theIObj:
	:type theIObj: opencascade::handle<AIS_InteractiveObject> &
	:param theDispMode:
	:type theDispMode: int
	:param theSelectionMode:
	:type theSelectionMode: int
	:param theToUpdateViewer:
	:type theToUpdateViewer: bool
	:param theToAllowDecomposition:
	:type theToAllowDecomposition: bool
	:param theDispStatus: default value is AIS_DS_None
	:type theDispStatus: AIS_DisplayStatus
	:rtype: None
") Display;
		void Display (const opencascade::handle<AIS_InteractiveObject> & theIObj,const Standard_Integer theDispMode,const Standard_Integer theSelectionMode,const Standard_Boolean theToUpdateViewer,const Standard_Boolean theToAllowDecomposition,const AIS_DisplayStatus theDispStatus = AIS_DS_None);
		%feature("compactdefaultargs") DisplayActiveSensitive;
		%feature("autodoc", "	* @name debug visualization Visualization of sensitives - for debugging purposes!

	:param aView:
	:type aView: opencascade::handle<V3d_View> &
	:rtype: None
") DisplayActiveSensitive;
		void DisplayActiveSensitive (const opencascade::handle<V3d_View> & aView);
		%feature("compactdefaultargs") DisplayActiveSensitive;
		%feature("autodoc", "	* Visualization of sensitives - for debugging purposes!

	:param anObject:
	:type anObject: opencascade::handle<AIS_InteractiveObject> &
	:param aView:
	:type aView: opencascade::handle<V3d_View> &
	:rtype: None
") DisplayActiveSensitive;
		void DisplayActiveSensitive (const opencascade::handle<AIS_InteractiveObject> & anObject,const opencascade::handle<V3d_View> & aView);
		%feature("compactdefaultargs") DisplayAll;
		%feature("autodoc", "	* Displays all hidden objects.

	:param theToUpdateViewer:
	:type theToUpdateViewer: bool
	:rtype: None
") DisplayAll;
		void DisplayAll (const Standard_Boolean theToUpdateViewer);
		%feature("compactdefaultargs") DisplayMode;
		%feature("autodoc", "	* @name Display Mode management Returns the Display Mode setting to be used by default.

	:rtype: int
") DisplayMode;
		Standard_Integer DisplayMode ();
		%feature("compactdefaultargs") DisplayPriority;
		%feature("autodoc", "	* @name object presence management (View affinity, Layer, Priority) Returns the display priority of the Object.

	:param theIObj:
	:type theIObj: opencascade::handle<AIS_InteractiveObject> &
	:rtype: int
") DisplayPriority;
		Standard_Integer DisplayPriority (const opencascade::handle<AIS_InteractiveObject> & theIObj);
		%feature("compactdefaultargs") DisplaySelected;
		%feature("autodoc", "	* Displays current objects.

	:param theToUpdateViewer:
	:type theToUpdateViewer: bool
	:rtype: None
") DisplaySelected;
		void DisplaySelected (const Standard_Boolean theToUpdateViewer);
		%feature("compactdefaultargs") DisplayStatus;
		%feature("autodoc", "	* Returns the display status of the entity anIobj. This will be one of the following: - AIS_DS_Displayed displayed in main viewer - AIS_DS_Erased hidden in main viewer - AIS_DS_Temporary temporarily displayed - AIS_DS_None nowhere displayed.

	:param anIobj:
	:type anIobj: opencascade::handle<AIS_InteractiveObject> &
	:rtype: AIS_DisplayStatus
") DisplayStatus;
		AIS_DisplayStatus DisplayStatus (const opencascade::handle<AIS_InteractiveObject> & anIobj);
		%feature("compactdefaultargs") DisplayedObjects;
		%feature("autodoc", "	* Returns the list of displayed objects of a particular Type WhichKind and Signature WhichSignature. By Default, WhichSignature equals -1. This means that there is a check on type only.

	:param aListOfIO:
	:type aListOfIO: AIS_ListOfInteractive &
	:rtype: None
") DisplayedObjects;
		void DisplayedObjects (AIS_ListOfInteractive & aListOfIO);
		%feature("compactdefaultargs") DisplayedObjects;
		%feature("autodoc", "	* gives the list of displayed objects of a particular Type and signature. by Default, <WhichSignature> = -1 means control only on <WhichKind>.

	:param theWhichKind:
	:type theWhichKind: AIS_KindOfInteractive
	:param theWhichSignature:
	:type theWhichSignature: int
	:param theListOfIO:
	:type theListOfIO: AIS_ListOfInteractive &
	:rtype: None
") DisplayedObjects;
		void DisplayedObjects (const AIS_KindOfInteractive theWhichKind,const Standard_Integer theWhichSignature,AIS_ListOfInteractive & theListOfIO);
		%feature("compactdefaultargs") DrawHiddenLine;
		%feature("autodoc", "	* returns Standard_True if the hidden lines are to be drawn. By default the hidden lines are not drawn.

	:rtype: bool
") DrawHiddenLine;
		Standard_Boolean DrawHiddenLine ();
		%feature("compactdefaultargs") EnableDrawHiddenLine;
		%feature("autodoc", "	:rtype: None
") EnableDrawHiddenLine;
		void EnableDrawHiddenLine ();
		%feature("compactdefaultargs") EndImmediateDraw;
		%feature("autodoc", "	* returns True if the immediate display has been done.

	:param theView:
	:type theView: opencascade::handle<V3d_View> &
	:rtype: bool
") EndImmediateDraw;
		Standard_Boolean EndImmediateDraw (const opencascade::handle<V3d_View> & theView);
		%feature("compactdefaultargs") EndImmediateDraw;
		%feature("autodoc", "	* Uses the First Active View of Main Viewer! returns True if the immediate display has been done.

	:rtype: bool
") EndImmediateDraw;
		Standard_Boolean EndImmediateDraw ();
		%feature("compactdefaultargs") Erase;
		%feature("autodoc", "	* Hides the object. The object's presentations are simply flagged as invisible and therefore excluded from redrawing. To show hidden objects, use Display().

	:param theIObj:
	:type theIObj: opencascade::handle<AIS_InteractiveObject> &
	:param theToUpdateViewer:
	:type theToUpdateViewer: bool
	:rtype: None
") Erase;
		void Erase (const opencascade::handle<AIS_InteractiveObject> & theIObj,const Standard_Boolean theToUpdateViewer);
		%feature("compactdefaultargs") EraseAll;
		%feature("autodoc", "	* Hides all objects. The object's presentations are simply flagged as invisible and therefore excluded from redrawing. To show all hidden objects, use DisplayAll().

	:param theToUpdateViewer:
	:type theToUpdateViewer: bool
	:rtype: None
") EraseAll;
		void EraseAll (const Standard_Boolean theToUpdateViewer);
		%feature("compactdefaultargs") EraseSelected;
		%feature("autodoc", "	* Hides selected objects. The object's presentations are simply flagged as invisible and therefore excluded from redrawing. To show hidden objects, use Display().

	:param theToUpdateViewer:
	:type theToUpdateViewer: bool
	:rtype: None
") EraseSelected;
		void EraseSelected (const Standard_Boolean theToUpdateViewer);
		%feature("compactdefaultargs") ErasedObjects;
		%feature("autodoc", "	* Returns the list theListOfIO of erased objects (hidden objects) particular Type WhichKind and Signature WhichSignature. By Default, WhichSignature equals 1. This means that there is a check on type only.

	:param theListOfIO:
	:type theListOfIO: AIS_ListOfInteractive &
	:rtype: None
") ErasedObjects;
		void ErasedObjects (AIS_ListOfInteractive & theListOfIO);
		%feature("compactdefaultargs") ErasedObjects;
		%feature("autodoc", "	* gives the list of erased objects (hidden objects) Type and signature by Default, <WhichSignature> = -1 means control only on <WhichKind>.

	:param theWhichKind:
	:type theWhichKind: AIS_KindOfInteractive
	:param theWhichSignature:
	:type theWhichSignature: int
	:param theListOfIO:
	:type theListOfIO: AIS_ListOfInteractive &
	:rtype: None
") ErasedObjects;
		void ErasedObjects (const AIS_KindOfInteractive theWhichKind,const Standard_Integer theWhichSignature,AIS_ListOfInteractive & theListOfIO);
		%feature("compactdefaultargs") Filters;
		%feature("autodoc", "	* @name Selection Filters management Returns the list of filters active in a local context.

	:rtype: SelectMgr_ListOfFilter
") Filters;
		const SelectMgr_ListOfFilter & Filters ();
		%feature("compactdefaultargs") FirstSelectedObject;
		%feature("autodoc", "	* Returns the first selected object in the list of current selected.

	:rtype: opencascade::handle<AIS_InteractiveObject>
") FirstSelectedObject;
		opencascade::handle<AIS_InteractiveObject> FirstSelectedObject ();
		%feature("compactdefaultargs") FitSelected;
		%feature("autodoc", "	* Fits the view correspondingly to the bounds of selected objects. Infinite objects are ignored if infinite state of AIS_InteractiveObject is set to true.

	:param theView:
	:type theView: opencascade::handle<V3d_View> &
	:param theMargin:
	:type theMargin: float
	:param theToUpdate:
	:type theToUpdate: bool
	:rtype: None
") FitSelected;
		void FitSelected (const opencascade::handle<V3d_View> & theView,const Standard_Real theMargin,const Standard_Boolean theToUpdate);
		%feature("compactdefaultargs") FitSelected;
		%feature("autodoc", "	* Fits the view correspondingly to the bounds of selected objects. Infinite objects are ignored if infinite state of AIS_InteractiveObject is set to true.

	:param theView:
	:type theView: opencascade::handle<V3d_View> &
	:rtype: None
") FitSelected;
		void FitSelected (const opencascade::handle<V3d_View> & theView);
		%feature("compactdefaultargs") GetAutoActivateSelection;
		%feature("autodoc", "	* Manages displaying the new object should also automatically activate default selection mode; True by default.

	:rtype: bool
") GetAutoActivateSelection;
		Standard_Boolean GetAutoActivateSelection ();
		%feature("compactdefaultargs") GetZLayer;
		%feature("autodoc", "	* Get Z layer id set for displayed interactive object.

	:param theIObj:
	:type theIObj: opencascade::handle<AIS_InteractiveObject> &
	:rtype: Graphic3d_ZLayerId
") GetZLayer;
		Graphic3d_ZLayerId GetZLayer (const opencascade::handle<AIS_InteractiveObject> & theIObj);
		%feature("compactdefaultargs") GravityPoint;
		%feature("autodoc", "	* Return rotation gravity point.

	:param theView:
	:type theView: opencascade::handle<V3d_View> &
	:rtype: gp_Pnt
") GravityPoint;
		virtual gp_Pnt GravityPoint (const opencascade::handle<V3d_View> & theView);
		%feature("compactdefaultargs") HLRAngle;
		%feature("autodoc", "	* Returns the real number value of the deviation angle in hidden line removal views in this interactive context. The default value is 20*PI/180.

	:rtype: float
") HLRAngle;
		Standard_Real HLRAngle ();
		%feature("compactdefaultargs") HLRDeviationCoefficient;
		%feature("autodoc", "	* Returns the real number value of the hidden line removal deviation coefficient. A Deviation coefficient is used in the shading display mode. The shape is seen decomposed into triangles. These are used to calculate reflection of light from the surface of the object. The triangles are formed from chords of the curves in the shape. The deviation coefficient give the highest value of the angle with which a chord can deviate from a tangent to a curve. If this limit is reached, a new triangle is begun. To find the hidden lines, hidden line display mode entails recalculation of the view at each different projector perspective. Because hidden lines entail calculations of more than usual complexity to decompose them into these triangles, a deviation coefficient allowing greater tolerance is used. This increases efficiency in calculation. The Default value is 0.02.

	:rtype: float
") HLRDeviationCoefficient;
		Standard_Real HLRDeviationCoefficient ();
		%feature("compactdefaultargs") HasApplicative;
		%feature("autodoc", "	* Returns SelectedInteractive()->HasOwner(). @sa SelectedOwner().

	:rtype: bool
") HasApplicative;
		Standard_Boolean HasApplicative ();
		%feature("compactdefaultargs") HasColor;
		%feature("autodoc", "	* Returns true if a view of the Interactive Object has color.

	:param aniobj:
	:type aniobj: opencascade::handle<AIS_InteractiveObject> &
	:rtype: bool
") HasColor;
		Standard_Boolean HasColor (const opencascade::handle<AIS_InteractiveObject> & aniobj);
		%feature("compactdefaultargs") HasDetected;
		%feature("autodoc", "	* Returns true if there is a mouse-detected entity in context. @sa DetectedOwner()/HasNextDetected()/HilightPreviousDetected()/HilightNextDetected().

	:rtype: bool
") HasDetected;
		Standard_Boolean HasDetected ();
		%feature("compactdefaultargs") HasDetectedShape;
		%feature("autodoc", "	* Returns true if there is a detected shape in local context. @sa HasDetected()/DetectedShape()

	:rtype: bool
") HasDetectedShape;
		Standard_Boolean HasDetectedShape ();
		%feature("compactdefaultargs") HasLocation;
		%feature("autodoc", "	* Returns true if the Object has a location.

	:param theObject:
	:type theObject: opencascade::handle<AIS_InteractiveObject> &
	:rtype: bool
") HasLocation;
		Standard_Boolean HasLocation (const opencascade::handle<AIS_InteractiveObject> & theObject);
		%feature("compactdefaultargs") HasNextDetected;
		%feature("autodoc", "	* returns True if other entities were detected in the last mouse detection @sa HilightPreviousDetected()/HilightNextDetected().

	:rtype: bool
") HasNextDetected;
		Standard_Boolean HasNextDetected ();
		%feature("compactdefaultargs") HasPolygonOffsets;
		%feature("autodoc", "	* Simply calls AIS_InteractiveObject::HasPolygonOffsets().

	:param anObj:
	:type anObj: opencascade::handle<AIS_InteractiveObject> &
	:rtype: bool
") HasPolygonOffsets;
		Standard_Boolean HasPolygonOffsets (const opencascade::handle<AIS_InteractiveObject> & anObj);
		%feature("compactdefaultargs") HasSelectedShape;
		%feature("autodoc", "	* Returns True if the interactive context has a shape selected. @sa SelectedShape().

	:rtype: bool
") HasSelectedShape;
		Standard_Boolean HasSelectedShape ();
		%feature("compactdefaultargs") HiddenLineAspect;
		%feature("autodoc", "	* @name HLR (Hidden Line Removal) display attributes Initializes hidden line aspect in the default drawing tool, or Drawer. The default values are: Color: Quantity_NOC_YELLOW Type of line: Aspect_TOL_DASH Width: 1.

	:rtype: opencascade::handle<Prs3d_LineAspect>
") HiddenLineAspect;
		opencascade::handle<Prs3d_LineAspect> HiddenLineAspect ();
		%feature("compactdefaultargs") HighlightStyle;
		%feature("autodoc", "	* @name highlighting management Returns highlight style settings.

	:param theStyleType:
	:type theStyleType: Prs3d_TypeOfHighlight
	:rtype: opencascade::handle<Prs3d_Drawer>
") HighlightStyle;
		const opencascade::handle<Prs3d_Drawer> & HighlightStyle (const Prs3d_TypeOfHighlight theStyleType);
		%feature("compactdefaultargs") HighlightStyle;
		%feature("autodoc", "	* Returns current dynamic highlight style settings. By default: - the color of dynamic highlight is Quantity_NOC_CYAN1; - the presentation for dynamic highlight is completely opaque; - the type of highlight is Aspect_TOHM_COLOR.

	:rtype: opencascade::handle<Prs3d_Drawer>
") HighlightStyle;
		const opencascade::handle<Prs3d_Drawer> & HighlightStyle ();
		%feature("compactdefaultargs") HighlightStyle;
		%feature("autodoc", "	* Returns highlight style of the object if it is marked as highlighted via global status @param theObj [in] the object to check

	:param theObj:
	:type theObj: opencascade::handle<AIS_InteractiveObject> &
	:param theStyle:
	:type theStyle: opencascade::handle<Prs3d_Drawer> &
	:rtype: bool
") HighlightStyle;
		Standard_Boolean HighlightStyle (const opencascade::handle<AIS_InteractiveObject> & theObj,opencascade::handle<Prs3d_Drawer> & theStyle);
		%feature("compactdefaultargs") HighlightStyle;
		%feature("autodoc", "	* Returns highlight style of the owner if it is selected @param theOwner [in] the owner to check

	:param theOwner:
	:type theOwner: opencascade::handle<SelectMgr_EntityOwner> &
	:param theStyle:
	:type theStyle: opencascade::handle<Prs3d_Drawer> &
	:rtype: bool
") HighlightStyle;
		Standard_Boolean HighlightStyle (const opencascade::handle<SelectMgr_EntityOwner> & theOwner,opencascade::handle<Prs3d_Drawer> & theStyle);
		%feature("compactdefaultargs") Hilight;
		%feature("autodoc", "	* Updates the display in the viewer to take dynamic detection into account. On dynamic detection by the mouse cursor, sensitive primitives are highlighted. The highlight color of entities detected by mouse movement is white by default.

	:param theObj:
	:type theObj: opencascade::handle<AIS_InteractiveObject> &
	:param theIsToUpdateViewer:
	:type theIsToUpdateViewer: bool
	:rtype: None
") Hilight;
		void Hilight (const opencascade::handle<AIS_InteractiveObject> & theObj,const Standard_Boolean theIsToUpdateViewer);
		%feature("compactdefaultargs") HilightCurrents;
		%feature("autodoc", "	* Highlights current objects. Objects selected when there is no open local context are called current objects; those selected in open local context, selected objects.

	:param theToUpdateViewer:
	:type theToUpdateViewer: bool
	:rtype: None
") HilightCurrents;
		void HilightCurrents (const Standard_Boolean theToUpdateViewer);
		%feature("compactdefaultargs") HilightNextDetected;
		%feature("autodoc", "	* If more than 1 object is detected by the selector, only the 'best' owner is hilighted at the mouse position. This Method allows the user to hilight one after another the other detected entities. If The method select is called, the selected entity will be the hilighted one! WARNING: Loop Method. When all the detected entities have been hilighted, the next call will hilight the first one again. returns the Rank of hilighted entity @sa HasNextDetected()/HilightPreviousDetected().

	:param theView:
	:type theView: opencascade::handle<V3d_View> &
	:param theToRedrawImmediate: default value is Standard_True
	:type theToRedrawImmediate: bool
	:rtype: int
") HilightNextDetected;
		Standard_Integer HilightNextDetected (const opencascade::handle<V3d_View> & theView,const Standard_Boolean theToRedrawImmediate = Standard_True);
		%feature("compactdefaultargs") HilightPreviousDetected;
		%feature("autodoc", "	* Same as previous methods in reverse direction. @sa HasNextDetected()/HilightNextDetected().

	:param theView:
	:type theView: opencascade::handle<V3d_View> &
	:param theToRedrawImmediate: default value is Standard_True
	:type theToRedrawImmediate: bool
	:rtype: int
") HilightPreviousDetected;
		Standard_Integer HilightPreviousDetected (const opencascade::handle<V3d_View> & theView,const Standard_Boolean theToRedrawImmediate = Standard_True);
		%feature("compactdefaultargs") HilightSelected;
		%feature("autodoc", "	* Highlights selected objects.

	:param theToUpdateViewer:
	:type theToUpdateViewer: bool
	:rtype: None
") HilightSelected;
		void HilightSelected (const Standard_Boolean theToUpdateViewer);
		%feature("compactdefaultargs") HilightWithColor;
		%feature("autodoc", "	* Changes the color of all the lines of the object in view.

	:param theObj:
	:type theObj: opencascade::handle<AIS_InteractiveObject> &
	:param theStyle:
	:type theStyle: opencascade::handle<Prs3d_Drawer> &
	:param theToUpdateViewer:
	:type theToUpdateViewer: bool
	:rtype: None
") HilightWithColor;
		void HilightWithColor (const opencascade::handle<AIS_InteractiveObject> & theObj,const opencascade::handle<Prs3d_Drawer> & theStyle,const Standard_Boolean theToUpdateViewer);
		%feature("compactdefaultargs") ImmediateAdd;
		%feature("autodoc", "	* returns True if <anIObj> has been stored in the list.

	:param theObj:
	:type theObj: opencascade::handle<AIS_InteractiveObject> &
	:param theMode: default value is 0
	:type theMode: int
	:rtype: bool
") ImmediateAdd;
		Standard_Boolean ImmediateAdd (const opencascade::handle<AIS_InteractiveObject> & theObj,const Standard_Integer theMode = 0);
		%feature("compactdefaultargs") InitCurrent;
		%feature("autodoc", "	* Initializes a scan of the current selected objects in Neutral Point. Objects selected when there is no open local context are called current objects; those selected in open local context, selected objects.

	:rtype: None
") InitCurrent;
		void InitCurrent ();
		%feature("compactdefaultargs") InitDetected;
		%feature("autodoc", "	* @name iteration through detected entities Initialization for iteration through mouse-detected objects in interactive context or in local context if it is opened. @sa DetectedCurrentOwner()/MoreDetected()/NextDetected().

	:rtype: None
") InitDetected;
		void InitDetected ();
		%feature("compactdefaultargs") InitSelected;
		%feature("autodoc", "	* Initializes a scan of the selected objects. @sa SelectedOwner()/MoreSelected()/NextSelected().

	:rtype: None
") InitSelected;
		void InitSelected ();
		%feature("compactdefaultargs") IsCurrent;
		%feature("autodoc", "	* Returns true if there is a non-null interactive object in Neutral Point. Objects selected when there is no open local context are called current objects; those selected in open local context, selected objects.

	:param theObject:
	:type theObject: opencascade::handle<AIS_InteractiveObject> &
	:rtype: bool
") IsCurrent;
		Standard_Boolean IsCurrent (const opencascade::handle<AIS_InteractiveObject> & theObject);
		%feature("compactdefaultargs") IsDisplayed;
		%feature("autodoc", "	* Returns true if Object is displayed in the interactive context.

	:param anIobj:
	:type anIobj: opencascade::handle<AIS_InteractiveObject> &
	:rtype: bool
") IsDisplayed;
		Standard_Boolean IsDisplayed (const opencascade::handle<AIS_InteractiveObject> & anIobj);
		%feature("compactdefaultargs") IsDisplayed;
		%feature("autodoc", "	:param aniobj:
	:type aniobj: opencascade::handle<AIS_InteractiveObject> &
	:param aMode:
	:type aMode: int
	:rtype: bool
") IsDisplayed;
		Standard_Boolean IsDisplayed (const opencascade::handle<AIS_InteractiveObject> & aniobj,const Standard_Integer aMode);
		%feature("compactdefaultargs") IsHilighted;
		%feature("autodoc", "	* Returns true if the object is marked as highlighted via its global status @param theObj [in] the object to check

	:param theObj:
	:type theObj: opencascade::handle<AIS_InteractiveObject> &
	:rtype: bool
") IsHilighted;
		Standard_Boolean IsHilighted (const opencascade::handle<AIS_InteractiveObject> & theObj);
		%feature("compactdefaultargs") IsHilighted;
		%feature("autodoc", "	* Returns true if the owner is marked as selected @param theOwner [in] the owner to check

	:param theOwner:
	:type theOwner: opencascade::handle<SelectMgr_EntityOwner> &
	:rtype: bool
") IsHilighted;
		Standard_Boolean IsHilighted (const opencascade::handle<SelectMgr_EntityOwner> & theOwner);
		%feature("compactdefaultargs") IsImmediateModeOn;
		%feature("autodoc", "	:rtype: bool
") IsImmediateModeOn;
		Standard_Boolean IsImmediateModeOn ();
		%feature("compactdefaultargs") IsSelected;
		%feature("autodoc", "	* Returns true is the owner given is selected

	:param theOwner:
	:type theOwner: opencascade::handle<SelectMgr_EntityOwner> &
	:rtype: bool
") IsSelected;
		Standard_Boolean IsSelected (const opencascade::handle<SelectMgr_EntityOwner> & theOwner);
		%feature("compactdefaultargs") IsSelected;
		%feature("autodoc", "	* Returns true is the object given is selected

	:param theObj:
	:type theObj: opencascade::handle<AIS_InteractiveObject> &
	:rtype: bool
") IsSelected;
		Standard_Boolean IsSelected (const opencascade::handle<AIS_InteractiveObject> & theObj);
		%feature("compactdefaultargs") IsoNumber;
		%feature("autodoc", "	* Returns the number of U and V isoparameters displayed.

	:param WhichIsos: default value is AIS_TOI_Both
	:type WhichIsos: AIS_TypeOfIso
	:rtype: int
") IsoNumber;
		Standard_Integer IsoNumber (const AIS_TypeOfIso WhichIsos = AIS_TOI_Both);
		%feature("compactdefaultargs") IsoOnPlane;
		%feature("autodoc", "	* Returns True if drawing isoparameters on planes is enabled.

	:param SwitchOn:
	:type SwitchOn: bool
	:rtype: None
") IsoOnPlane;
		void IsoOnPlane (const Standard_Boolean SwitchOn);
		%feature("compactdefaultargs") IsoOnPlane;
		%feature("autodoc", "	* Returns True if drawing isoparameters on planes is enabled. if <forUIsos> = False,

	:rtype: bool
") IsoOnPlane;
		Standard_Boolean IsoOnPlane ();
		%feature("compactdefaultargs") IsoOnTriangulation;
		%feature("autodoc", "	* Enables or disables on-triangulation build for isolines for a particular object. In case if on-triangulation builder is disabled, default on-plane builder will compute isolines for the object given.

	:param theIsEnabled:
	:type theIsEnabled: bool
	:param theObject:
	:type theObject: opencascade::handle<AIS_InteractiveObject> &
	:rtype: None
") IsoOnTriangulation;
		void IsoOnTriangulation (const Standard_Boolean theIsEnabled,const opencascade::handle<AIS_InteractiveObject> & theObject);
		%feature("compactdefaultargs") IsoOnTriangulation;
		%feature("autodoc", "	* Enables or disables on-triangulation build for isolines for default drawer. In case if on-triangulation builder is disabled, default on-plane builder will compute isolines for the object given.

	:param theToSwitchOn:
	:type theToSwitchOn: bool
	:rtype: None
") IsoOnTriangulation;
		void IsoOnTriangulation (const Standard_Boolean theToSwitchOn);
		%feature("compactdefaultargs") IsoOnTriangulation;
		%feature("autodoc", "	* Returns true if drawing isolines on triangulation algorithm is enabled.

	:rtype: bool
") IsoOnTriangulation;
		Standard_Boolean IsoOnTriangulation ();
		%feature("compactdefaultargs") LastActiveView;
		%feature("autodoc", "	* Returns last active View (argument of MoveTo()/Select() methods).

	:rtype: opencascade::handle<V3d_View>
") LastActiveView;
		opencascade::handle<V3d_View> LastActiveView ();
		%feature("compactdefaultargs") Load;
		%feature("autodoc", "	* Allows you to load the Interactive Object with a given selection mode, and/or with the desired decomposition option, whether the object is visualized or not. The loaded objects will be selectable but displayable in highlighting only when detected by the Selector.

	:param theObj:
	:type theObj: opencascade::handle<AIS_InteractiveObject> &
	:param theSelectionMode: default value is -1
	:type theSelectionMode: int
	:rtype: None
") Load;
		void Load (const opencascade::handle<AIS_InteractiveObject> & theObj,const Standard_Integer theSelectionMode = -1);
		%feature("compactdefaultargs") Load;
		%feature("autodoc", "	:param theObj:
	:type theObj: opencascade::handle<AIS_InteractiveObject> &
	:param theSelectionMode:
	:type theSelectionMode: int
	:param :
	:type : bool
	:rtype: None
") Load;
		void Load (const opencascade::handle<AIS_InteractiveObject> & theObj,Standard_Integer theSelectionMode,Standard_Boolean );
		%feature("compactdefaultargs") Location;
		%feature("autodoc", "	* Returns the location of the Object.

	:param theObject:
	:type theObject: opencascade::handle<AIS_InteractiveObject> &
	:rtype: TopLoc_Location
") Location;
		TopLoc_Location Location (const opencascade::handle<AIS_InteractiveObject> & theObject);
		%feature("compactdefaultargs") MainPrsMgr;
		%feature("autodoc", "	:rtype: opencascade::handle<PrsMgr_PresentationManager3d>
") MainPrsMgr;
		const opencascade::handle<PrsMgr_PresentationManager3d> & MainPrsMgr ();
		%feature("compactdefaultargs") MainSelector;
		%feature("autodoc", "	:rtype: opencascade::handle<StdSelect_ViewerSelector3d>
") MainSelector;
		const opencascade::handle<StdSelect_ViewerSelector3d> & MainSelector ();
		%feature("compactdefaultargs") MoreCurrent;
		%feature("autodoc", "	* Returns true if there is another object found by the scan of the list of current objects. Objects selected when there is no open local context are called current objects; those selected in open local context, selected objects.

	:rtype: bool
") MoreCurrent;
		Standard_Boolean MoreCurrent ();
		%feature("compactdefaultargs") MoreDetected;
		%feature("autodoc", "	* Return True if there is more mouse-detected objects after the current one during iteration through mouse-detected interactive objects. @sa DetectedCurrentOwner()/InitDetected()/NextDetected().

	:rtype: bool
") MoreDetected;
		Standard_Boolean MoreDetected ();
		%feature("compactdefaultargs") MoreSelected;
		%feature("autodoc", "	* Returns true if there is another object found by the scan of the list of selected objects. @sa SelectedOwner()/InitSelected()/NextSelected().

	:rtype: bool
") MoreSelected;
		Standard_Boolean MoreSelected ();
		%feature("compactdefaultargs") MoveTo;
		%feature("autodoc", "	* Relays mouse position in pixels theXPix and theYPix to the interactive context selectors. This is done by the view theView passing this position to the main viewer and updating it. If theToRedrawOnUpdate is set to false, callee should call RedrawImmediate() to highlight detected object. @sa PickingStrategy()

	:param theXPix:
	:type theXPix: int
	:param theYPix:
	:type theYPix: int
	:param theView:
	:type theView: opencascade::handle<V3d_View> &
	:param theToRedrawOnUpdate:
	:type theToRedrawOnUpdate: bool
	:rtype: AIS_StatusOfDetection
") MoveTo;
		AIS_StatusOfDetection MoveTo (const Standard_Integer theXPix,const Standard_Integer theYPix,const opencascade::handle<V3d_View> & theView,const Standard_Boolean theToRedrawOnUpdate);
		%feature("compactdefaultargs") NbCurrents;
		%feature("autodoc", "	:rtype: int
") NbCurrents;
		Standard_Integer NbCurrents ();
		%feature("compactdefaultargs") NbSelected;
		%feature("autodoc", "	* Count a number of selected entities using InitSelected()+MoreSelected()+NextSelected() iterator. @sa SelectedOwner()/InitSelected()/MoreSelected()/NextSelected().

	:rtype: int
") NbSelected;
		Standard_Integer NbSelected ();
		%feature("compactdefaultargs") NextCurrent;
		%feature("autodoc", "	* Continues the scan to the next object in the list of current objects. Objects selected when there is no open local context are called current objects; those selected in open local context, selected objects.

	:rtype: None
") NextCurrent;
		void NextCurrent ();
		%feature("compactdefaultargs") NextDetected;
		%feature("autodoc", "	* Gets next current object during iteration through mouse-detected interactive objects. @sa DetectedCurrentOwner()/InitDetected()/MoreDetected().

	:rtype: None
") NextDetected;
		void NextDetected ();
		%feature("compactdefaultargs") NextSelected;
		%feature("autodoc", "	* Continues the scan to the next object in the list of selected objects. @sa SelectedOwner()/InitSelected()/MoreSelected().

	:rtype: None
") NextSelected;
		void NextSelected ();
		%feature("compactdefaultargs") ObjectsByDisplayStatus;
		%feature("autodoc", "	* Returns the list theListOfIO of objects with indicated display status particular Type WhichKind and Signature WhichSignature. By Default, WhichSignature equals 1. This means that there is a check on type only.

	:param theStatus:
	:type theStatus: AIS_DisplayStatus
	:param theListOfIO:
	:type theListOfIO: AIS_ListOfInteractive &
	:rtype: None
") ObjectsByDisplayStatus;
		void ObjectsByDisplayStatus (const AIS_DisplayStatus theStatus,AIS_ListOfInteractive & theListOfIO);
		%feature("compactdefaultargs") ObjectsByDisplayStatus;
		%feature("autodoc", "	* gives the list of objects with indicated display status Type and signature by Default, <WhichSignature> = -1 means control only on <WhichKind>.

	:param WhichKind:
	:type WhichKind: AIS_KindOfInteractive
	:param WhichSignature:
	:type WhichSignature: int
	:param theStatus:
	:type theStatus: AIS_DisplayStatus
	:param theListOfIO:
	:type theListOfIO: AIS_ListOfInteractive &
	:rtype: None
") ObjectsByDisplayStatus;
		void ObjectsByDisplayStatus (const AIS_KindOfInteractive WhichKind,const Standard_Integer WhichSignature,const AIS_DisplayStatus theStatus,AIS_ListOfInteractive & theListOfIO);
		%feature("compactdefaultargs") ObjectsForView;
		%feature("autodoc", "	* Query objects visible or hidden in specified view due to affinity mask.

	:param theListOfIO:
	:type theListOfIO: AIS_ListOfInteractive &
	:param theView:
	:type theView: opencascade::handle<V3d_View> &
	:param theIsVisibleInView:
	:type theIsVisibleInView: bool
	:param theStatus: default value is AIS_DS_None
	:type theStatus: AIS_DisplayStatus
	:rtype: None
") ObjectsForView;
		void ObjectsForView (AIS_ListOfInteractive & theListOfIO,const opencascade::handle<V3d_View> & theView,const Standard_Boolean theIsVisibleInView,const AIS_DisplayStatus theStatus = AIS_DS_None);
		%feature("compactdefaultargs") ObjectsInside;
		%feature("autodoc", "	* fills <aListOfIO> with objects of a particular Type and Signature with no consideration of display status. by Default, <WhichSignature> = -1 means control only on <WhichKind>. if <WhichKind> = AIS_KOI_None and <WhichSignature> = -1, all the objects are put into the list.

	:param aListOfIO:
	:type aListOfIO: AIS_ListOfInteractive &
	:param WhichKind: default value is AIS_KOI_None
	:type WhichKind: AIS_KindOfInteractive
	:param WhichSignature: default value is -1
	:type WhichSignature: int
	:rtype: None
") ObjectsInside;
		void ObjectsInside (AIS_ListOfInteractive & aListOfIO,const AIS_KindOfInteractive WhichKind = AIS_KOI_None,const Standard_Integer WhichSignature = -1);
		%feature("compactdefaultargs") PickingStrategy;
		%feature("autodoc", "	* Return picking strategy; SelectMgr_PickingStrategy_FirstAcceptable by default. @sa MoveTo()/Filters()

	:rtype: SelectMgr_PickingStrategy
") PickingStrategy;
		SelectMgr_PickingStrategy PickingStrategy ();
		%feature("compactdefaultargs") PixelTolerance;
		%feature("autodoc", "	* Returns the pixel tolerance, default is 2. Pixel Tolerance extends sensitivity within MoveTo() operation (picking by point) and can be adjusted by application based on user input precision (e.g. screen pixel density, input device precision, etc.).

	:rtype: int
") PixelTolerance;
		Standard_Integer PixelTolerance ();
		%feature("compactdefaultargs") PlaneSize;
		%feature("autodoc", "	* Returns true if the length in the X direction XSize is the same as that in the Y direction YSize.

	:param XSize:
	:type XSize: float &
	:param YSize:
	:type YSize: float &
	:rtype: bool
") PlaneSize;
		Standard_Boolean PlaneSize (Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") PolygonOffsets;
		%feature("autodoc", "	* Retrieves current polygon offsets settings for Object.

	:param anObj:
	:type anObj: opencascade::handle<AIS_InteractiveObject> &
	:param aMode:
	:type aMode: int &
	:param aFactor:
	:type aFactor: Standard_ShortReal &
	:param aUnits:
	:type aUnits: Standard_ShortReal &
	:rtype: None
") PolygonOffsets;
		void PolygonOffsets (const opencascade::handle<AIS_InteractiveObject> & anObj,Standard_Integer &OutValue,Standard_ShortReal & aFactor,Standard_ShortReal & aUnits);
		%feature("compactdefaultargs") PurgeDisplay;
		%feature("autodoc", "	* Clears all the structures which don't belong to objects displayed at neutral point only effective when no Local Context is opened... returns the number of removed structures from the viewers.

	:rtype: int
") PurgeDisplay;
		Standard_Integer PurgeDisplay ();
		%feature("compactdefaultargs") RebuildSelectionStructs;
		%feature("autodoc", "	* Rebuilds 1st level of BVH selection forcibly

	:rtype: None
") RebuildSelectionStructs;
		void RebuildSelectionStructs ();
		%feature("compactdefaultargs") RecomputePrsOnly;
		%feature("autodoc", "	* Recomputes the displayed presentations, flags the others. Doesn't update presentations.

	:param theIObj:
	:type theIObj: opencascade::handle<AIS_InteractiveObject> &
	:param theToUpdateViewer:
	:type theToUpdateViewer: bool
	:param theAllModes: default value is Standard_False
	:type theAllModes: bool
	:rtype: None
") RecomputePrsOnly;
		void RecomputePrsOnly (const opencascade::handle<AIS_InteractiveObject> & theIObj,const Standard_Boolean theToUpdateViewer,const Standard_Boolean theAllModes = Standard_False);
		%feature("compactdefaultargs") RecomputeSelectionOnly;
		%feature("autodoc", "	* Recomputes the active selections, flags the others. Doesn't update presentations.

	:param anIObj:
	:type anIObj: opencascade::handle<AIS_InteractiveObject> &
	:rtype: None
") RecomputeSelectionOnly;
		void RecomputeSelectionOnly (const opencascade::handle<AIS_InteractiveObject> & anIObj);
		%feature("compactdefaultargs") Redisplay;
		%feature("autodoc", "	* Recomputes the seen parts presentation of the Object. If theAllModes equals true, all presentations are present in the object even if unseen.

	:param theIObj:
	:type theIObj: opencascade::handle<AIS_InteractiveObject> &
	:param theToUpdateViewer:
	:type theToUpdateViewer: bool
	:param theAllModes: default value is Standard_False
	:type theAllModes: bool
	:rtype: None
") Redisplay;
		void Redisplay (const opencascade::handle<AIS_InteractiveObject> & theIObj,const Standard_Boolean theToUpdateViewer,const Standard_Boolean theAllModes = Standard_False);
		%feature("compactdefaultargs") Redisplay;
		%feature("autodoc", "	* Recomputes the Prs/Selection of displayed objects of a given type and a given signature. if signature = -1 doesn't take signature criterion.

	:param theTypeOfObject:
	:type theTypeOfObject: AIS_KindOfInteractive
	:param theSignature:
	:type theSignature: int
	:param theToUpdateViewer:
	:type theToUpdateViewer: bool
	:rtype: None
") Redisplay;
		void Redisplay (const AIS_KindOfInteractive theTypeOfObject,const Standard_Integer theSignature,const Standard_Boolean theToUpdateViewer);
		%feature("compactdefaultargs") RedrawImmediate;
		%feature("autodoc", "	* Redraws immediate structures in all views of the viewer given taking into account its visibility.

	:param theViewer:
	:type theViewer: opencascade::handle<V3d_Viewer> &
	:rtype: None
") RedrawImmediate;
		void RedrawImmediate (const opencascade::handle<V3d_Viewer> & theViewer);
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	* Removes Object from every viewer.

	:param theIObj:
	:type theIObj: opencascade::handle<AIS_InteractiveObject> &
	:param theToUpdateViewer:
	:type theToUpdateViewer: bool
	:rtype: None
") Remove;
		void Remove (const opencascade::handle<AIS_InteractiveObject> & theIObj,const Standard_Boolean theToUpdateViewer);
		%feature("compactdefaultargs") RemoveAll;
		%feature("autodoc", "	* Removes all the objects from Context.

	:param theToUpdateViewer:
	:type theToUpdateViewer: bool
	:rtype: None
") RemoveAll;
		void RemoveAll (const Standard_Boolean theToUpdateViewer);
		%feature("compactdefaultargs") RemoveFilter;
		%feature("autodoc", "	* Removes a filter from context.

	:param theFilter:
	:type theFilter: opencascade::handle<SelectMgr_Filter> &
	:rtype: None
") RemoveFilter;
		void RemoveFilter (const opencascade::handle<SelectMgr_Filter> & theFilter);
		%feature("compactdefaultargs") RemoveFilters;
		%feature("autodoc", "	* Remove all filters from context.

	:rtype: None
") RemoveFilters;
		void RemoveFilters ();
		%feature("compactdefaultargs") ResetLocation;
		%feature("autodoc", "	* Puts the Object back into its initial position.

	:param theObject:
	:type theObject: opencascade::handle<AIS_InteractiveObject> &
	:rtype: None
") ResetLocation;
		void ResetLocation (const opencascade::handle<AIS_InteractiveObject> & theObject);
		%feature("compactdefaultargs") Select;
		%feature("autodoc", "	* Selects everything found in the bounding rectangle defined by the pixel minima and maxima, XPMin, YPMin, XPMax, and YPMax in the view. The objects detected are passed to the main viewer, which is then updated.

	:param theXPMin:
	:type theXPMin: int
	:param theYPMin:
	:type theYPMin: int
	:param theXPMax:
	:type theXPMax: int
	:param theYPMax:
	:type theYPMax: int
	:param theView:
	:type theView: opencascade::handle<V3d_View> &
	:param theToUpdateViewer:
	:type theToUpdateViewer: bool
	:rtype: AIS_StatusOfPick
") Select;
		AIS_StatusOfPick Select (const Standard_Integer theXPMin,const Standard_Integer theYPMin,const Standard_Integer theXPMax,const Standard_Integer theYPMax,const opencascade::handle<V3d_View> & theView,const Standard_Boolean theToUpdateViewer);
		%feature("compactdefaultargs") Select;
		%feature("autodoc", "	* polyline selection; clears the previous picked list

	:param thePolyline:
	:type thePolyline: TColgp_Array1OfPnt2d
	:param theView:
	:type theView: opencascade::handle<V3d_View> &
	:param theToUpdateViewer:
	:type theToUpdateViewer: bool
	:rtype: AIS_StatusOfPick
") Select;
		AIS_StatusOfPick Select (const TColgp_Array1OfPnt2d & thePolyline,const opencascade::handle<V3d_View> & theView,const Standard_Boolean theToUpdateViewer);
		%feature("compactdefaultargs") Select;
		%feature("autodoc", "	* Stores and hilights the previous detected; Unhilights the previous picked. @sa MoveTo().

	:param theToUpdateViewer:
	:type theToUpdateViewer: bool
	:rtype: AIS_StatusOfPick
") Select;
		AIS_StatusOfPick Select (const Standard_Boolean theToUpdateViewer);
		%feature("compactdefaultargs") SelectedInteractive;
		%feature("autodoc", "	* Return opencascade::handle<AIS_InteractiveObject>::DownCast (SelectedOwner()->Selectable()). @sa SelectedOwner().

	:rtype: opencascade::handle<AIS_InteractiveObject>
") SelectedInteractive;
		opencascade::handle<AIS_InteractiveObject> SelectedInteractive ();
		%feature("compactdefaultargs") SelectedOwner;
		%feature("autodoc", "	* Returns the owner of the selected entity. @sa InitSelected()/MoreSelected()/NextSelected().

	:rtype: opencascade::handle<SelectMgr_EntityOwner>
") SelectedOwner;
		opencascade::handle<SelectMgr_EntityOwner> SelectedOwner ();
		%feature("compactdefaultargs") SelectedShape;
		%feature("autodoc", "	* Returns the selected shape. Basically it is just a shape returned stored by StdSelect_BRepOwner with graphic transformation being applied: @code const opencascade::handle<StdSelect_BRepOwner> aBRepOwner = opencascade::handle<StdSelect_BRepOwner>::DownCast (SelectedOwner()); TopoDS_Shape aSelShape = aBRepOwner->Shape(); TopoDS_Shape aLocatedShape = aSelShape.Located (aBRepOwner->Location() * aSelShape.Location()); @endcode @sa SelectedOwner()/HasSelectedShape().

	:rtype: TopoDS_Shape
") SelectedShape;
		TopoDS_Shape SelectedShape ();
		%feature("compactdefaultargs") Selection;
		%feature("autodoc", "	* Returns selection instance

	:rtype: opencascade::handle<AIS_Selection>
") Selection;
		const opencascade::handle<AIS_Selection> & Selection ();
		%feature("compactdefaultargs") SelectionManager;
		%feature("autodoc", "	:rtype: opencascade::handle<SelectMgr_SelectionManager>
") SelectionManager;
		const opencascade::handle<SelectMgr_SelectionManager> & SelectionManager ();
		%feature("compactdefaultargs") SelectionStyle;
		%feature("autodoc", "	* Returns current selection style settings. By default: - the color of selection is Quantity_NOC_GRAY80; - the presentation for selection is completely opaque; - the type of highlight is Aspect_TOHM_COLOR.

	:rtype: opencascade::handle<Prs3d_Drawer>
") SelectionStyle;
		const opencascade::handle<Prs3d_Drawer> & SelectionStyle ();
		%feature("compactdefaultargs") SetAngleAndDeviation;
		%feature("autodoc", "	* Calls the AIS_Shape SetAngleAndDeviation to set both Angle and Deviation coefficients

	:param theIObj:
	:type theIObj: opencascade::handle<AIS_InteractiveObject> &
	:param theAngle:
	:type theAngle: float
	:param theToUpdateViewer:
	:type theToUpdateViewer: bool
	:rtype: None
") SetAngleAndDeviation;
		void SetAngleAndDeviation (const opencascade::handle<AIS_InteractiveObject> & theIObj,const Standard_Real theAngle,const Standard_Boolean theToUpdateViewer);
		%feature("compactdefaultargs") SetAutoActivateSelection;
		%feature("autodoc", "	* Enable or disable automatic activation of default selection mode while displaying the object.

	:param theIsAuto:
	:type theIsAuto: bool
	:rtype: None
") SetAutoActivateSelection;
		void SetAutoActivateSelection (const Standard_Boolean theIsAuto);
		%feature("compactdefaultargs") SetAutomaticHilight;
		%feature("autodoc", "	* Sets the highlighting status of detected and selected entities. This function allows you to disconnect the automatic mode. //! MoveTo() will fill the list of detected entities and Select() will set selected state to detected objects regardless of this flag, but with disabled AutomaticHiligh() their highlighting state will be left unaffected, so that application will be able performing custom highlighting in a different way, if needed. //! This API should be distinguished from SelectMgr_SelectableObject::SetAutoHilight() that is used to implement custom highlighting logic for a specific interactive object class. //! @sa MoveTo(), Select(), HilightWithColor(), Unhilight()

	:param theStatus:
	:type theStatus: bool
	:rtype: None
") SetAutomaticHilight;
		void SetAutomaticHilight (Standard_Boolean theStatus);
		%feature("compactdefaultargs") SetColor;
		%feature("autodoc", "	* Sets the color of the selected entity.

	:param theIObj:
	:type theIObj: opencascade::handle<AIS_InteractiveObject> &
	:param theColor:
	:type theColor: Quantity_Color &
	:param theToUpdateViewer:
	:type theToUpdateViewer: bool
	:rtype: None
") SetColor;
		void SetColor (const opencascade::handle<AIS_InteractiveObject> & theIObj,const Quantity_Color & theColor,const Standard_Boolean theToUpdateViewer);
		%feature("compactdefaultargs") SetCurrentFacingModel;
		%feature("autodoc", "	* change the current facing model apply on polygons for SetColor(), SetTransparency(), SetMaterial() methods default facing model is Aspect_TOFM_TWO_SIDE. This mean that attributes is applying both on the front and back face.

	:param aniobj:
	:type aniobj: opencascade::handle<AIS_InteractiveObject> &
	:param aModel: default value is Aspect_TOFM_BOTH_SIDE
	:type aModel: Aspect_TypeOfFacingModel
	:rtype: None
") SetCurrentFacingModel;
		void SetCurrentFacingModel (const opencascade::handle<AIS_InteractiveObject> & aniobj,const Aspect_TypeOfFacingModel aModel = Aspect_TOFM_BOTH_SIDE);
		%feature("compactdefaultargs") SetCurrentObject;
		%feature("autodoc", "	* @name obsolete methods Updates the view of the current object in open context. Objects selected when there is no open local context are called current objects; those selected in open local context, selected objects.

	:param theIObj:
	:type theIObj: opencascade::handle<AIS_InteractiveObject> &
	:param theToUpdateViewer:
	:type theToUpdateViewer: bool
	:rtype: None
") SetCurrentObject;
		void SetCurrentObject (const opencascade::handle<AIS_InteractiveObject> & theIObj,const Standard_Boolean theToUpdateViewer);
		%feature("compactdefaultargs") SetDeviationAngle;
		%feature("autodoc", "	:param theIObj:
	:type theIObj: opencascade::handle<AIS_InteractiveObject> &
	:param theAngle:
	:type theAngle: float
	:param theToUpdateViewer:
	:type theToUpdateViewer: bool
	:rtype: None
") SetDeviationAngle;
		void SetDeviationAngle (const opencascade::handle<AIS_InteractiveObject> & theIObj,const Standard_Real theAngle,const Standard_Boolean theToUpdateViewer);
		%feature("compactdefaultargs") SetDeviationAngle;
		%feature("autodoc", "	* default 12 degrees

	:param anAngle:
	:type anAngle: float
	:rtype: None
") SetDeviationAngle;
		void SetDeviationAngle (const Standard_Real anAngle);
		%feature("compactdefaultargs") SetDeviationCoefficient;
		%feature("autodoc", "	* @name tessellation deviation properties for automatic triangulation Sets the deviation coefficient theCoefficient. Drawings of curves or patches are made with respect to a maximal chordal deviation. A Deviation coefficient is used in the shading display mode. The shape is seen decomposed into triangles. These are used to calculate reflection of light from the surface of the object. The triangles are formed from chords of the curves in the shape. The deviation coefficient theCoefficient gives the highest value of the angle with which a chord can deviate from a tangent to a curve. If this limit is reached, a new triangle is begun. This deviation is absolute and is set through the method: SetMaximalChordialDeviation. The default value is 0.001. In drawing shapes, however, you are allowed to ask for a relative deviation. This deviation will be: SizeOfObject * DeviationCoefficient.

	:param theIObj:
	:type theIObj: opencascade::handle<AIS_InteractiveObject> &
	:param theCoefficient:
	:type theCoefficient: float
	:param theToUpdateViewer:
	:type theToUpdateViewer: bool
	:rtype: None
") SetDeviationCoefficient;
		void SetDeviationCoefficient (const opencascade::handle<AIS_InteractiveObject> & theIObj,const Standard_Real theCoefficient,const Standard_Boolean theToUpdateViewer);
		%feature("compactdefaultargs") SetDeviationCoefficient;
		%feature("autodoc", "	* Sets the deviation coefficient theCoefficient. Drawings of curves or patches are made with respect to a maximal chordal deviation. A Deviation coefficient is used in the shading display mode. The shape is seen decomposed into triangles. These are used to calculate reflection of light from the surface of the object. The triangles are formed from chords of the curves in the shape. The deviation coefficient theCoefficient gives the highest value of the angle with which a chord can deviate from a tangent to a curve. If this limit is reached, a new triangle is begun. This deviation is absolute and is set through the method: SetMaximalChordialDeviation. The default value is 0.001. In drawing shapes, however, you are allowed to ask for a relative deviation. This deviation will be: SizeOfObject * DeviationCoefficient.

	:param theCoefficient:
	:type theCoefficient: float
	:rtype: None
") SetDeviationCoefficient;
		void SetDeviationCoefficient (const Standard_Real theCoefficient);
		%feature("compactdefaultargs") SetDisplayMode;
		%feature("autodoc", "	* Sets the display mode of seen Interactive Objects (which have no overridden Display Mode).

	:param theMode:
	:type theMode: int
	:param theToUpdateViewer:
	:type theToUpdateViewer: bool
	:rtype: None
") SetDisplayMode;
		void SetDisplayMode (const Standard_Integer theMode,const Standard_Boolean theToUpdateViewer);
		%feature("compactdefaultargs") SetDisplayMode;
		%feature("autodoc", "	* Sets the display mode of seen Interactive Objects. theMode provides the display mode index of the entity theIObj.

	:param theIObj:
	:type theIObj: opencascade::handle<AIS_InteractiveObject> &
	:param theMode:
	:type theMode: int
	:param theToUpdateViewer:
	:type theToUpdateViewer: bool
	:rtype: None
") SetDisplayMode;
		void SetDisplayMode (const opencascade::handle<AIS_InteractiveObject> & theIObj,const Standard_Integer theMode,const Standard_Boolean theToUpdateViewer);
		%feature("compactdefaultargs") SetDisplayPriority;
		%feature("autodoc", "	* Sets the display priority of the seen parts presentation of the Object.

	:param theIObj:
	:type theIObj: opencascade::handle<AIS_InteractiveObject> &
	:param thePriority:
	:type thePriority: int
	:rtype: None
") SetDisplayPriority;
		void SetDisplayPriority (const opencascade::handle<AIS_InteractiveObject> & theIObj,const Standard_Integer thePriority);
		%feature("compactdefaultargs") SetHLRAngle;
		%feature("autodoc", "	* Sets the HLR angle.

	:param theAngle:
	:type theAngle: float
	:rtype: None
") SetHLRAngle;
		void SetHLRAngle (const Standard_Real theAngle);
		%feature("compactdefaultargs") SetHLRAngleAndDeviation;
		%feature("autodoc", "	* Computes a HLRAngle and a HLRDeviationCoefficient by means of the angle anAngle and sets the corresponding methods in the default drawing tool with these values.

	:param theIObj:
	:type theIObj: opencascade::handle<AIS_InteractiveObject> &
	:param theAngle:
	:type theAngle: float
	:param theToUpdateViewer:
	:type theToUpdateViewer: bool
	:rtype: None
") SetHLRAngleAndDeviation;
		void SetHLRAngleAndDeviation (const opencascade::handle<AIS_InteractiveObject> & theIObj,const Standard_Real theAngle,const Standard_Boolean theToUpdateViewer);
		%feature("compactdefaultargs") SetHLRAngleAndDeviation;
		%feature("autodoc", "	* compute with theAngle a HLRAngle and a HLRDeviationCoefficient and set them in myHLRAngle and in myHLRDeviationCoefficient of myDefaultDrawer; theAngle is in radian; ( 1 deg < angle in deg < 20 deg)

	:param theAngle:
	:type theAngle: float
	:rtype: None
") SetHLRAngleAndDeviation;
		void SetHLRAngleAndDeviation (const Standard_Real theAngle);
		%feature("compactdefaultargs") SetHLRDeviationAngle;
		%feature("autodoc", "	:param theIObj:
	:type theIObj: opencascade::handle<AIS_InteractiveObject> &
	:param theAngle:
	:type theAngle: float
	:param theToUpdateViewer:
	:type theToUpdateViewer: bool
	:rtype: None
") SetHLRDeviationAngle;
		void SetHLRDeviationAngle (const opencascade::handle<AIS_InteractiveObject> & theIObj,const Standard_Real theAngle,const Standard_Boolean theToUpdateViewer);
		%feature("compactdefaultargs") SetHLRDeviationCoefficient;
		%feature("autodoc", "	* Sets the deviation coefficient aCoefficient for removal of hidden lines created by different viewpoints in different presentations. The Default value is 0.02.

	:param theIObj:
	:type theIObj: opencascade::handle<AIS_InteractiveObject> &
	:param theCoefficient:
	:type theCoefficient: float
	:param theToUpdateViewer:
	:type theToUpdateViewer: bool
	:rtype: None
") SetHLRDeviationCoefficient;
		void SetHLRDeviationCoefficient (const opencascade::handle<AIS_InteractiveObject> & theIObj,const Standard_Real theCoefficient,const Standard_Boolean theToUpdateViewer);
		%feature("compactdefaultargs") SetHLRDeviationCoefficient;
		%feature("autodoc", "	* Sets the deviation coefficient aCoefficient for removal of hidden lines created by different viewpoints in different presentations. The Default value is 0.02.

	:param aCoefficient:
	:type aCoefficient: float
	:rtype: None
") SetHLRDeviationCoefficient;
		void SetHLRDeviationCoefficient (const Standard_Real aCoefficient);
		%feature("compactdefaultargs") SetHiddenLineAspect;
		%feature("autodoc", "	* Sets the hidden line aspect anAspect. Aspect defines display attributes for hidden lines in HLR projections.

	:param anAspect:
	:type anAspect: opencascade::handle<Prs3d_LineAspect> &
	:rtype: None
") SetHiddenLineAspect;
		void SetHiddenLineAspect (const opencascade::handle<Prs3d_LineAspect> & anAspect);
		%feature("compactdefaultargs") SetHighlightStyle;
		%feature("autodoc", "	* Setup highlight style settings. It is preferred modifying existing style returned by method HighlightStyle() instead of creating a new drawer. //! If a new highlight style is created, its presentation Zlayer should be checked, otherwise highlighting might not work as expected. Default values are: - Prs3d_TypeOfHighlight_Dynamic: Graphic3d_ZLayerId_Top, object highlighting is drawn on top of main scene within Immediate Layers, so that V3d_View::RedrawImmediate() will be enough to see update; - Prs3d_TypeOfHighlight_LocalDynamic: Graphic3d_ZLayerId_Topmost, object parts highlighting is drawn on top of main scene within Immediate Layers with depth cleared (even overlapped geometry will be revealed); - Prs3d_TypeOfHighlight_Selected: Graphic3d_ZLayerId_UNKNOWN, object highlighting is drawn on top of main scene within the same layer as object itself (e.g. Graphic3d_ZLayerId_Default by default) and increased priority.

	:param theStyleType:
	:type theStyleType: Prs3d_TypeOfHighlight
	:param theStyle:
	:type theStyle: opencascade::handle<Prs3d_Drawer> &
	:rtype: None
") SetHighlightStyle;
		void SetHighlightStyle (const Prs3d_TypeOfHighlight theStyleType,const opencascade::handle<Prs3d_Drawer> & theStyle);
		%feature("compactdefaultargs") SetHighlightStyle;
		%feature("autodoc", "	* Setup the style of dynamic highlighting. It is preferred modifying existing style returned by method HighlightStyle() instead of creating a new drawer. //! If a new highlight style is created, its presentation Zlayer should be checked, otherwise highlighting might not work as expected. Default value is Graphic3d_ZLayerId_Top, object highlighting is drawn on top of main scene within Immediate Layers, so that V3d_View::RedrawImmediate() will be enough to see update;

	:param theStyle:
	:type theStyle: opencascade::handle<Prs3d_Drawer> &
	:rtype: None
") SetHighlightStyle;
		void SetHighlightStyle (const opencascade::handle<Prs3d_Drawer> & theStyle);
		%feature("compactdefaultargs") SetIsoNumber;
		%feature("autodoc", "	* @name iso-line display attributes Sets the number of U and V isoparameters displayed.

	:param NbIsos:
	:type NbIsos: int
	:param WhichIsos: default value is AIS_TOI_Both
	:type WhichIsos: AIS_TypeOfIso
	:rtype: None
") SetIsoNumber;
		void SetIsoNumber (const Standard_Integer NbIsos,const AIS_TypeOfIso WhichIsos = AIS_TOI_Both);
		%feature("compactdefaultargs") SetLocalAttributes;
		%feature("autodoc", "	* @name common object display attributes Sets the graphic attributes of the interactive object, such as visualization mode, color, and material.

	:param theIObj:
	:type theIObj: opencascade::handle<AIS_InteractiveObject> &
	:param theDrawer:
	:type theDrawer: opencascade::handle<Prs3d_Drawer> &
	:param theToUpdateViewer:
	:type theToUpdateViewer: bool
	:rtype: None
") SetLocalAttributes;
		void SetLocalAttributes (const opencascade::handle<AIS_InteractiveObject> & theIObj,const opencascade::handle<Prs3d_Drawer> & theDrawer,const Standard_Boolean theToUpdateViewer);
		%feature("compactdefaultargs") SetLocation;
		%feature("autodoc", "	* @name object local transformation management Puts the location on the initial graphic representation and the selection for the Object.

	:param theObject:
	:type theObject: opencascade::handle<AIS_InteractiveObject> &
	:param theLocation:
	:type theLocation: TopLoc_Location &
	:rtype: None
") SetLocation;
		void SetLocation (const opencascade::handle<AIS_InteractiveObject> & theObject,const TopLoc_Location & theLocation);
		%feature("compactdefaultargs") SetMaterial;
		%feature("autodoc", "	* Provides the type of material setting for the view of the Object.

	:param theIObj:
	:type theIObj: opencascade::handle<AIS_InteractiveObject> &
	:param theMaterial:
	:type theMaterial: Graphic3d_MaterialAspect &
	:param theToUpdateViewer:
	:type theToUpdateViewer: bool
	:rtype: None
") SetMaterial;
		void SetMaterial (const opencascade::handle<AIS_InteractiveObject> & theIObj,const Graphic3d_MaterialAspect & theMaterial,const Standard_Boolean theToUpdateViewer);
		%feature("compactdefaultargs") SetPickingStrategy;
		%feature("autodoc", "	* Setup picking strategy - which entities detected by picking line will be accepted, considering Selection Filters. By default (SelectMgr_PickingStrategy_FirstAcceptable), Selection Filters reduce the list of entities so that the context accepts topmost in remaining. //! This means that entities behind non-selectable (by filters) parts can be picked by user. If this behavior is undesirable, and user wants that non-selectable (by filters) parts should remain an obstacle for picking, SelectMgr_PickingStrategy_OnlyTopmost can be set instead. //! Notice, that since Selection Manager operates only objects registered in it, SelectMgr_PickingStrategy_OnlyTopmost will NOT prevent picking entities behind visible by unregistered in Selection Manager presentations (e.g. deactivated). Hence, SelectMgr_PickingStrategy_OnlyTopmost changes behavior only with Selection Filters enabled.

	:param theStrategy:
	:type theStrategy: SelectMgr_PickingStrategy
	:rtype: None
") SetPickingStrategy;
		void SetPickingStrategy (const SelectMgr_PickingStrategy theStrategy);
		%feature("compactdefaultargs") SetPixelTolerance;
		%feature("autodoc", "	* @name mouse picking logic (detection and dynamic highlighting of entities under cursor) Setup pixel tolerance for MoveTo() operation. @sa MoveTo().

	:param thePrecision: default value is 2
	:type thePrecision: int
	:rtype: None
") SetPixelTolerance;
		void SetPixelTolerance (const Standard_Integer thePrecision = 2);
		%feature("compactdefaultargs") SetPlaneSize;
		%feature("autodoc", "	* @name plane display attributes Sets the plane size defined by the length in the X direction XSize and that in the Y direction YSize.

	:param theSizeX:
	:type theSizeX: float
	:param theSizeY:
	:type theSizeY: float
	:param theToUpdateViewer:
	:type theToUpdateViewer: bool
	:rtype: None
") SetPlaneSize;
		void SetPlaneSize (const Standard_Real theSizeX,const Standard_Real theSizeY,const Standard_Boolean theToUpdateViewer);
		%feature("compactdefaultargs") SetPlaneSize;
		%feature("autodoc", "	* Sets the plane size aSize.

	:param theSize:
	:type theSize: float
	:param theToUpdateViewer:
	:type theToUpdateViewer: bool
	:rtype: None
") SetPlaneSize;
		void SetPlaneSize (const Standard_Real theSize,const Standard_Boolean theToUpdateViewer);
		%feature("compactdefaultargs") SetPolygonOffsets;
		%feature("autodoc", "	* Sets up polygon offsets for the given AIS_InteractiveObject. It simply calls AIS_InteractiveObject::SetPolygonOffsets().

	:param theIObj:
	:type theIObj: opencascade::handle<AIS_InteractiveObject> &
	:param theMode:
	:type theMode: int
	:param theFactor:
	:type theFactor: Standard_ShortReal
	:param theUnits:
	:type theUnits: Standard_ShortReal
	:param theToUpdateViewer:
	:type theToUpdateViewer: bool
	:rtype: None
") SetPolygonOffsets;
		void SetPolygonOffsets (const opencascade::handle<AIS_InteractiveObject> & theIObj,const Standard_Integer theMode,const Standard_ShortReal theFactor,const Standard_ShortReal theUnits,const Standard_Boolean theToUpdateViewer);
		%feature("compactdefaultargs") SetSelected;
		%feature("autodoc", "	* Unhighlights previously selected owners and marks them as not selected. Marks owner given as selected and highlights it. Performs selection filters check.

	:param theOwners:
	:type theOwners: opencascade::handle<SelectMgr_EntityOwner> &
	:param theToUpdateViewer:
	:type theToUpdateViewer: bool
	:rtype: None
") SetSelected;
		void SetSelected (const opencascade::handle<SelectMgr_EntityOwner> & theOwners,const Standard_Boolean theToUpdateViewer);
		%feature("compactdefaultargs") SetSelected;
		%feature("autodoc", "	* Puts the interactive object aniObj in the list of selected objects. Performs selection filters check.

	:param theObject:
	:type theObject: opencascade::handle<AIS_InteractiveObject> &
	:param theToUpdateViewer:
	:type theToUpdateViewer: bool
	:rtype: None
") SetSelected;
		void SetSelected (const opencascade::handle<AIS_InteractiveObject> & theObject,const Standard_Boolean theToUpdateViewer);
		%feature("compactdefaultargs") SetSelectedAspect;
		%feature("autodoc", "	* @name Selection management Sets the graphic basic aspect to the current presentation of ALL selected objects.

	:param theAspect:
	:type theAspect: opencascade::handle<Prs3d_BasicAspect> &
	:param theToUpdateViewer:
	:type theToUpdateViewer: bool
	:rtype: None
") SetSelectedAspect;
		void SetSelectedAspect (const opencascade::handle<Prs3d_BasicAspect> & theAspect,const Standard_Boolean theToUpdateViewer);
		%feature("compactdefaultargs") SetSelectedState;
		%feature("autodoc", "	* Updates Selected state of specified owner without calling HilightSelected(). Has no effect if Selected state is not changed, and redirects to AddOrRemoveSelected() otherwise. @param theOwner owner object to set selected state @param theIsSelected new selected state returns True if Selected state has been changed

	:param theOwner:
	:type theOwner: opencascade::handle<SelectMgr_EntityOwner> &
	:param theIsSelected:
	:type theIsSelected: bool
	:rtype: bool
") SetSelectedState;
		Standard_Boolean SetSelectedState (const opencascade::handle<SelectMgr_EntityOwner> & theOwner,const Standard_Boolean theIsSelected);
		%feature("compactdefaultargs") SetSelection;
		%feature("autodoc", "	* Sets selection instance to manipulate a container of selected owners @param theSelection an instance of the selection

	:param theSelection:
	:type theSelection: opencascade::handle<AIS_Selection> &
	:rtype: None
") SetSelection;
		void SetSelection (const opencascade::handle<AIS_Selection> & theSelection);
		%feature("compactdefaultargs") SetSelectionModeActive;
		%feature("autodoc", "	* @name management of active Selection Modes Activates or deactivates the selection mode for specified object. Has no effect if selection mode was already active/deactivated. @param theObj object to activate/deactivate selection mode @param theMode selection mode to activate/deactivate;  deactivation of -1 selection mode will effectively deactivate all selection modes;  activation of -1 selection mode with AIS_SelectionModesConcurrency_Single  will deactivate all selection modes, and will has no effect otherwise @param theToActivate activation/deactivation flag @param theConcurrency specifies how to handle already activated selection modes;  default value (AIS_SelectionModesConcurrency_Multiple) means active selection modes should be left as is,  AIS_SelectionModesConcurrency_Single can be used if only one selection mode is expected to be active  and AIS_SelectionModesConcurrency_GlobalOrLocal can be used if either AIS_InteractiveObject::GlobalSelectionMode()  or any combination of Local selection modes is acceptable;  this value is considered only if theToActivate set to True @param theIsForce when set to True, the display status will be ignored while activating selection mode

	:param theObj:
	:type theObj: opencascade::handle<AIS_InteractiveObject> &
	:param theMode:
	:type theMode: int
	:param theToActivate:
	:type theToActivate: bool
	:param theConcurrency: default value is AIS_SelectionModesConcurrency_Multiple
	:type theConcurrency: AIS_SelectionModesConcurrency
	:param theIsForce: default value is Standard_False
	:type theIsForce: bool
	:rtype: None
") SetSelectionModeActive;
		void SetSelectionModeActive (const opencascade::handle<AIS_InteractiveObject> & theObj,const Standard_Integer theMode,const Standard_Boolean theToActivate,const AIS_SelectionModesConcurrency theConcurrency = AIS_SelectionModesConcurrency_Multiple,const Standard_Boolean theIsForce = Standard_False);
		%feature("compactdefaultargs") SetSelectionSensitivity;
		%feature("autodoc", "	* Allows to manage sensitivity of a particular selection of interactive object theObject and changes previous sensitivity value of all sensitive entities in selection with theMode to the given theNewSensitivity.

	:param theObject:
	:type theObject: opencascade::handle<AIS_InteractiveObject> &
	:param theMode:
	:type theMode: int
	:param theNewSensitivity:
	:type theNewSensitivity: int
	:rtype: None
") SetSelectionSensitivity;
		void SetSelectionSensitivity (const opencascade::handle<AIS_InteractiveObject> & theObject,const Standard_Integer theMode,const Standard_Integer theNewSensitivity);
		%feature("compactdefaultargs") SetSelectionStyle;
		%feature("autodoc", "	* Setup the style of selection highlighting.

	:param theStyle:
	:type theStyle: opencascade::handle<Prs3d_Drawer> &
	:rtype: None
") SetSelectionStyle;
		void SetSelectionStyle (const opencascade::handle<Prs3d_Drawer> & theStyle);
		%feature("compactdefaultargs") SetSubIntensityColor;
		%feature("autodoc", "	* Sub-intensity allows temporary highlighting of particular objects with specified color in a manner of selection highlight, but without actual selection (e.g., global status and owner's selection state will not be updated). The method sets up the color for such highlighting. By default, this is Quantity_NOC_GRAY40.

	:param theColor:
	:type theColor: Quantity_Color &
	:rtype: None
") SetSubIntensityColor;
		void SetSubIntensityColor (const Quantity_Color & theColor);
		%feature("compactdefaultargs") SetToHilightSelected;
		%feature("autodoc", "	* Specify whether selected object must be hilighted when mouse cursor is moved above it (in MoveTo method). By default this value is false and selected object is not hilighted in this case. @sa MoveTo()

	:param toHilight:
	:type toHilight: bool
	:rtype: None
") SetToHilightSelected;
		void SetToHilightSelected (const Standard_Boolean toHilight);
		%feature("compactdefaultargs") SetTransformPersistence;
		%feature("autodoc", "	* Sets transform persistence.

	:param theObject:
	:type theObject: opencascade::handle<AIS_InteractiveObject> &
	:param theTrsfPers:
	:type theTrsfPers: opencascade::handle<Graphic3d_TransformPers> &
	:rtype: None
") SetTransformPersistence;
		void SetTransformPersistence (const opencascade::handle<AIS_InteractiveObject> & theObject,const opencascade::handle<Graphic3d_TransformPers> & theTrsfPers);
		%feature("compactdefaultargs") SetTransformPersistence;
		%feature("autodoc", "	:param theObj:
	:type theObj: opencascade::handle<AIS_InteractiveObject> &
	:param theFlag:
	:type theFlag: Graphic3d_TransModeFlags &
	:param thePoint: default value is gp_Pnt(0.0,0.0,0.0)
	:type thePoint: gp_Pnt
	:rtype: None
") SetTransformPersistence;
		void SetTransformPersistence (const opencascade::handle<AIS_InteractiveObject> & theObj,const Graphic3d_TransModeFlags & theFlag,const gp_Pnt & thePoint = gp_Pnt(0.0,0.0,0.0));
		%feature("compactdefaultargs") SetTransparency;
		%feature("autodoc", "	* Provides the transparency settings for viewing the Object. The transparency value aValue may be between 0.0, opaque, and 1.0, fully transparent.

	:param theIObj:
	:type theIObj: opencascade::handle<AIS_InteractiveObject> &
	:param theValue:
	:type theValue: float
	:param theToUpdateViewer:
	:type theToUpdateViewer: bool
	:rtype: None
") SetTransparency;
		void SetTransparency (const opencascade::handle<AIS_InteractiveObject> & theIObj,const Standard_Real theValue,const Standard_Boolean theToUpdateViewer);
		%feature("compactdefaultargs") SetTrihedronSize;
		%feature("autodoc", "	* @name trihedron display attributes Sets the size aSize of the trihedron. Is used to change the default value 100 mm for display of trihedra. Use of this function in one of your own interactive objects requires a call to the Compute function of the new class. This will recalculate the presentation for every trihedron displayed.

	:param theSize:
	:type theSize: float
	:param theToUpdateViewer:
	:type theToUpdateViewer: bool
	:rtype: None
") SetTrihedronSize;
		void SetTrihedronSize (const Standard_Real theSize,const Standard_Boolean theToUpdateViewer);
		%feature("compactdefaultargs") SetViewAffinity;
		%feature("autodoc", "	* Setup object visibility in specified view. Has no effect if object is not displayed in this context.

	:param theIObj:
	:type theIObj: opencascade::handle<AIS_InteractiveObject> &
	:param theView:
	:type theView: opencascade::handle<V3d_View> &
	:param theIsVisible:
	:type theIsVisible: bool
	:rtype: None
") SetViewAffinity;
		void SetViewAffinity (const opencascade::handle<AIS_InteractiveObject> & theIObj,const opencascade::handle<V3d_View> & theView,const Standard_Boolean theIsVisible);
		%feature("compactdefaultargs") SetWidth;
		%feature("autodoc", "	* Sets the width of the Object.

	:param theIObj:
	:type theIObj: opencascade::handle<AIS_InteractiveObject> &
	:param theValue:
	:type theValue: float
	:param theToUpdateViewer:
	:type theToUpdateViewer: bool
	:rtype: void
") SetWidth;
		virtual void SetWidth (const opencascade::handle<AIS_InteractiveObject> & theIObj,const Standard_Real theValue,const Standard_Boolean theToUpdateViewer);
		%feature("compactdefaultargs") SetZLayer;
		%feature("autodoc", "	* Set Z layer id for interactive object. The Z layers can be used to display temporarily presentations of some object in front of the other objects in the scene. The ids for Z layers are generated by V3d_Viewer.

	:param theIObj:
	:type theIObj: opencascade::handle<AIS_InteractiveObject> &
	:param theLayerId:
	:type theLayerId: Graphic3d_ZLayerId
	:rtype: None
") SetZLayer;
		void SetZLayer (const opencascade::handle<AIS_InteractiveObject> & theIObj,const Graphic3d_ZLayerId theLayerId);
		%feature("compactdefaultargs") ShiftSelect;
		%feature("autodoc", "	* Adds the last detected to the list of previous picked. If the last detected was already declared as picked, removes it from the Picked List. @sa MoveTo().

	:param theToUpdateViewer:
	:type theToUpdateViewer: bool
	:rtype: AIS_StatusOfPick
") ShiftSelect;
		AIS_StatusOfPick ShiftSelect (const Standard_Boolean theToUpdateViewer);
		%feature("compactdefaultargs") ShiftSelect;
		%feature("autodoc", "	* Adds the last detected to the list of previous picked. If the last detected was already declared as picked, removes it from the Picked List.

	:param thePolyline:
	:type thePolyline: TColgp_Array1OfPnt2d
	:param theView:
	:type theView: opencascade::handle<V3d_View> &
	:param theToUpdateViewer:
	:type theToUpdateViewer: bool
	:rtype: AIS_StatusOfPick
") ShiftSelect;
		AIS_StatusOfPick ShiftSelect (const TColgp_Array1OfPnt2d & thePolyline,const opencascade::handle<V3d_View> & theView,const Standard_Boolean theToUpdateViewer);
		%feature("compactdefaultargs") ShiftSelect;
		%feature("autodoc", "	* Rectangle of selection; adds new detected entities into the picked list, removes the detected entities that were already stored.

	:param theXPMin:
	:type theXPMin: int
	:param theYPMin:
	:type theYPMin: int
	:param theXPMax:
	:type theXPMax: int
	:param theYPMax:
	:type theYPMax: int
	:param theView:
	:type theView: opencascade::handle<V3d_View> &
	:param theToUpdateViewer:
	:type theToUpdateViewer: bool
	:rtype: AIS_StatusOfPick
") ShiftSelect;
		AIS_StatusOfPick ShiftSelect (const Standard_Integer theXPMin,const Standard_Integer theYPMin,const Standard_Integer theXPMax,const Standard_Integer theYPMax,const opencascade::handle<V3d_View> & theView,const Standard_Boolean theToUpdateViewer);
		%feature("compactdefaultargs") SubIntensityColor;
		%feature("autodoc", "	* @name sub-intensity management (deprecated) Sub-intensity allows temporary highlighting of particular objects with specified color in a manner of selection highlight, but without actual selection (e.g., global status and owner's selection state will not be updated). The method returns the color of such highlighting. By default, it is Quantity_NOC_GRAY40.

	:rtype: Quantity_Color
") SubIntensityColor;
		const Quantity_Color & SubIntensityColor ();
		%feature("compactdefaultargs") SubIntensityOff;
		%feature("autodoc", "	* Removes the subintensity option for the entity. If a local context is open, the presentation of the Interactive Object activates the selection mode.

	:param theIObj:
	:type theIObj: opencascade::handle<AIS_InteractiveObject> &
	:param theToUpdateViewer:
	:type theToUpdateViewer: bool
	:rtype: None
") SubIntensityOff;
		void SubIntensityOff (const opencascade::handle<AIS_InteractiveObject> & theIObj,const Standard_Boolean theToUpdateViewer);
		%feature("compactdefaultargs") SubIntensityOn;
		%feature("autodoc", "	* Highlights, and removes highlights from, the displayed object which is displayed at Neutral Point with subintensity color. Available only for active local context. There is no effect if there is no local context. If a local context is open, the presentation of the Interactive Object activates the selection mode.

	:param theIObj:
	:type theIObj: opencascade::handle<AIS_InteractiveObject> &
	:param theToUpdateViewer:
	:type theToUpdateViewer: bool
	:rtype: None
") SubIntensityOn;
		void SubIntensityOn (const opencascade::handle<AIS_InteractiveObject> & theIObj,const Standard_Boolean theToUpdateViewer);
		%feature("compactdefaultargs") ToHilightSelected;
		%feature("autodoc", "	* Return value specified whether selected object must be hilighted when mouse cursor is moved above it @sa MoveTo()

	:rtype: bool
") ToHilightSelected;
		Standard_Boolean ToHilightSelected ();
		%feature("compactdefaultargs") TrihedronSize;
		%feature("autodoc", "	* returns the current value of trihedron size.

	:rtype: float
") TrihedronSize;
		Standard_Real TrihedronSize ();
		%feature("compactdefaultargs") Unhilight;
		%feature("autodoc", "	* Removes hilighting from the Object.

	:param theIObj:
	:type theIObj: opencascade::handle<AIS_InteractiveObject> &
	:param theToUpdateViewer:
	:type theToUpdateViewer: bool
	:rtype: None
") Unhilight;
		void Unhilight (const opencascade::handle<AIS_InteractiveObject> & theIObj,const Standard_Boolean theToUpdateViewer);
		%feature("compactdefaultargs") UnhilightCurrents;
		%feature("autodoc", "	* Removes highlighting from current objects. Objects selected when there is no open local context are called current objects; those selected in open local context, selected objects.

	:param theToUpdateViewer:
	:type theToUpdateViewer: bool
	:rtype: None
") UnhilightCurrents;
		void UnhilightCurrents (const Standard_Boolean theToUpdateViewer);
		%feature("compactdefaultargs") UnhilightSelected;
		%feature("autodoc", "	* Removes highlighting from selected objects.

	:param theToUpdateViewer:
	:type theToUpdateViewer: bool
	:rtype: None
") UnhilightSelected;
		void UnhilightSelected (const Standard_Boolean theToUpdateViewer);
		%feature("compactdefaultargs") UnsetColor;
		%feature("autodoc", "	* Removes the color selection for the selected entity.

	:param theIObj:
	:type theIObj: opencascade::handle<AIS_InteractiveObject> &
	:param theToUpdateViewer:
	:type theToUpdateViewer: bool
	:rtype: None
") UnsetColor;
		void UnsetColor (const opencascade::handle<AIS_InteractiveObject> & theIObj,const Standard_Boolean theToUpdateViewer);
		%feature("compactdefaultargs") UnsetDisplayMode;
		%feature("autodoc", "	* Unsets the display mode of seen Interactive Objects.

	:param theIObj:
	:type theIObj: opencascade::handle<AIS_InteractiveObject> &
	:param theToUpdateViewer:
	:type theToUpdateViewer: bool
	:rtype: None
") UnsetDisplayMode;
		void UnsetDisplayMode (const opencascade::handle<AIS_InteractiveObject> & theIObj,const Standard_Boolean theToUpdateViewer);
		%feature("compactdefaultargs") UnsetLocalAttributes;
		%feature("autodoc", "	* Removes the settings for local attributes of the Object and returns to defaults.

	:param theIObj:
	:type theIObj: opencascade::handle<AIS_InteractiveObject> &
	:param theToUpdateViewer:
	:type theToUpdateViewer: bool
	:rtype: None
") UnsetLocalAttributes;
		void UnsetLocalAttributes (const opencascade::handle<AIS_InteractiveObject> & theIObj,const Standard_Boolean theToUpdateViewer);
		%feature("compactdefaultargs") UnsetMaterial;
		%feature("autodoc", "	* Removes the type of material setting for viewing the Object.

	:param theIObj:
	:type theIObj: opencascade::handle<AIS_InteractiveObject> &
	:param theToUpdateViewer:
	:type theToUpdateViewer: bool
	:rtype: None
") UnsetMaterial;
		void UnsetMaterial (const opencascade::handle<AIS_InteractiveObject> & theIObj,const Standard_Boolean theToUpdateViewer);
		%feature("compactdefaultargs") UnsetTransparency;
		%feature("autodoc", "	* Removes the transparency settings for viewing the Object.

	:param theIObj:
	:type theIObj: opencascade::handle<AIS_InteractiveObject> &
	:param theToUpdateViewer:
	:type theToUpdateViewer: bool
	:rtype: None
") UnsetTransparency;
		void UnsetTransparency (const opencascade::handle<AIS_InteractiveObject> & theIObj,const Standard_Boolean theToUpdateViewer);
		%feature("compactdefaultargs") UnsetWidth;
		%feature("autodoc", "	* Removes the width setting of the Object.

	:param theIObj:
	:type theIObj: opencascade::handle<AIS_InteractiveObject> &
	:param theToUpdateViewer:
	:type theToUpdateViewer: bool
	:rtype: void
") UnsetWidth;
		virtual void UnsetWidth (const opencascade::handle<AIS_InteractiveObject> & theIObj,const Standard_Boolean theToUpdateViewer);
		%feature("compactdefaultargs") Update;
		%feature("autodoc", "	* Updates displayed interactive object by checking and recomputing its flagged as 'to be recomputed' presentation and selection structures. This method does not force any recomputation on its own. The method recomputes selections even if they are loaded without activation in particular selector.

	:param theIObj:
	:type theIObj: opencascade::handle<AIS_InteractiveObject> &
	:param theUpdateViewer:
	:type theUpdateViewer: bool
	:rtype: None
") Update;
		void Update (const opencascade::handle<AIS_InteractiveObject> & theIObj,const Standard_Boolean theUpdateViewer);
		%feature("compactdefaultargs") UpdateCurrent;
		%feature("autodoc", "	* Updates the list of current objects, i.e. hilights new current objects, removes hilighting from former current objects. Objects selected when there is no open local context are called current objects; those selected in open local context, selected objects.

	:rtype: None
") UpdateCurrent;
		void UpdateCurrent ();
		%feature("compactdefaultargs") UpdateCurrentViewer;
		%feature("autodoc", "	* Updates the current viewer.

	:rtype: None
") UpdateCurrentViewer;
		void UpdateCurrentViewer ();
		%feature("compactdefaultargs") UpdateSelected;
		%feature("autodoc", "	* Updates the list of selected objects: i.e. highlights the newly selected ones and unhighlights previously selected objects. @sa HilightSelected().

	:param theToUpdateViewer:
	:type theToUpdateViewer: bool
	:rtype: None
") UpdateSelected;
		void UpdateSelected (Standard_Boolean theToUpdateViewer);
		%feature("compactdefaultargs") Width;
		%feature("autodoc", "	* Returns the width of the Interactive Object in the interactive context.

	:param aniobj:
	:type aniobj: opencascade::handle<AIS_InteractiveObject> &
	:rtype: float
") Width;
		virtual Standard_Real Width (const opencascade::handle<AIS_InteractiveObject> & aniobj);
};


%make_alias(AIS_InteractiveContext)

%extend AIS_InteractiveContext {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor AIS_InteractiveObject;
class AIS_InteractiveObject : public SelectMgr_SelectableObject {
	public:
		%feature("compactdefaultargs") ClearOwner;
		%feature("autodoc", "	* Each Interactive Object has methods which allow us to attribute an Owner to it in the form of a Transient. This method removes the owner from the graphic entity.

	:rtype: None
") ClearOwner;
		void ClearOwner ();
		%feature("compactdefaultargs") DumpJson;
		%feature("autodoc", "	* Dumps the content of me into the stream

	:param theOStream:
	:type theOStream: Standard_OStream &
	:param theDepth: default value is -1
	:type theDepth: int
	:rtype: void
") DumpJson;
		virtual void DumpJson (Standard_OStream & theOStream,const Standard_Integer theDepth = -1);
		%feature("compactdefaultargs") GetContext;
		%feature("autodoc", "	* Returns the context pointer to the interactive context.

	:rtype: opencascade::handle<AIS_InteractiveContext>
") GetContext;
		opencascade::handle<AIS_InteractiveContext> GetContext ();
		%feature("compactdefaultargs") GetOwner;
		%feature("autodoc", "	* Returns the owner of the Interactive Object. The owner can be a shape for a set of sub-shapes or a sub-shape for sub-shapes which it is composed of, and takes the form of a transient. There are two types of owners: - Direct owners, decomposition shapes such as edges, wires, and faces. - Users, presentable objects connecting to sensitive primitives, or a shape which has been decomposed.

	:rtype: opencascade::handle<Standard_Transient>
") GetOwner;
		const opencascade::handle<Standard_Transient> & GetOwner ();
		%feature("compactdefaultargs") HasInteractiveContext;
		%feature("autodoc", "	* Indicates whether the Interactive Object has a pointer to an interactive context.

	:rtype: bool
") HasInteractiveContext;
		Standard_Boolean HasInteractiveContext ();
		%feature("compactdefaultargs") HasOwner;
		%feature("autodoc", "	* Returns true if the object has an owner attributed to it. The owner can be a shape for a set of sub-shapes or a sub-shape for sub-shapes which it is composed of, and takes the form of a transient.

	:rtype: bool
") HasOwner;
		Standard_Boolean HasOwner ();
		%feature("compactdefaultargs") HasPresentation;
		%feature("autodoc", "	* Returns True when this object has a presentation in the current DisplayMode()

	:rtype: bool
") HasPresentation;
		Standard_Boolean HasPresentation ();
		%feature("compactdefaultargs") InteractiveContext;
		%feature("autodoc", "	* Returns the context pointer to the interactive context.

	:rtype: AIS_InteractiveContext *
") InteractiveContext;
		AIS_InteractiveContext * InteractiveContext ();
		%feature("compactdefaultargs") Presentation;
		%feature("autodoc", "	* Returns the current presentation of this object according to the current DisplayMode()

	:rtype: opencascade::handle<Prs3d_Presentation>
") Presentation;
		opencascade::handle<Prs3d_Presentation> Presentation ();
		%feature("compactdefaultargs") Redisplay;
		%feature("autodoc", "	* Updates the active presentation; if <AllModes> = Standard_True all the presentations inside are recomputed. IMPORTANT: It is preferable to call Redisplay method of corresponding AIS_InteractiveContext instance for cases when it is accessible. This method just redirects call to myCTXPtr, so this class field must be up to date for proper result.

	:param AllModes: default value is Standard_False
	:type AllModes: bool
	:rtype: None
") Redisplay;
		void Redisplay (const Standard_Boolean AllModes = Standard_False);
		%feature("compactdefaultargs") SetAspect;
		%feature("autodoc", "	* Sets the graphic basic aspect to the current presentation.

	:param anAspect:
	:type anAspect: opencascade::handle<Prs3d_BasicAspect> &
	:rtype: None
") SetAspect;
		void SetAspect (const opencascade::handle<Prs3d_BasicAspect> & anAspect);
		%feature("compactdefaultargs") SetContext;
		%feature("autodoc", "	* Sets the interactive context aCtx and provides a link to the default drawing tool or 'Drawer' if there is none.

	:param aCtx:
	:type aCtx: opencascade::handle<AIS_InteractiveContext> &
	:rtype: void
") SetContext;
		virtual void SetContext (const opencascade::handle<AIS_InteractiveContext> & aCtx);
		%feature("compactdefaultargs") SetOwner;
		%feature("autodoc", "	* Allows you to attribute the owner theApplicativeEntity to an Interactive Object. This can be a shape for a set of sub-shapes or a sub-shape for sub-shapes which it is composed of. The owner takes the form of a transient.

	:param theApplicativeEntity:
	:type theApplicativeEntity: opencascade::handle<Standard_Transient> &
	:rtype: None
") SetOwner;
		void SetOwner (const opencascade::handle<Standard_Transient> & theApplicativeEntity);
		%feature("compactdefaultargs") Signature;
		%feature("autodoc", "	* Specifies additional characteristics of Interactive Object of Type(); -1 by default. Among the datums, this signature is attributed to the shape. The remaining datums have the following default signatures: - Point signature 1 - Axis  signature 2 - Trihedron signature 3 - PlaneTrihedron signature 4 - Line  signature 5 - Circle signature 6 - Plane signature 7.

	:rtype: int
") Signature;
		Standard_Integer Signature ();
		%feature("compactdefaultargs") Type;
		%feature("autodoc", "	* Returns the kind of Interactive Object; AIS_KOI_None by default.

	:rtype: AIS_KindOfInteractive
") Type;
		AIS_KindOfInteractive Type ();
};


%make_alias(AIS_InteractiveObject)

%extend AIS_InteractiveObject {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor AIS_ManipulatorOwner;
class AIS_ManipulatorOwner : public SelectMgr_EntityOwner {
	public:
		%feature("compactdefaultargs") AIS_ManipulatorOwner;
		%feature("autodoc", "	:param theSelObject:
	:type theSelObject: opencascade::handle<SelectMgr_SelectableObject> &
	:param theIndex:
	:type theIndex: int
	:param theMode:
	:type theMode: AIS_ManipulatorMode
	:param thePriority: default value is 0
	:type thePriority: int
	:rtype: None
") AIS_ManipulatorOwner;
		 AIS_ManipulatorOwner (const opencascade::handle<SelectMgr_SelectableObject> & theSelObject,const Standard_Integer theIndex,const AIS_ManipulatorMode theMode,const Standard_Integer thePriority = 0);
		%feature("compactdefaultargs") HilightWithColor;
		%feature("autodoc", "	:param thePM:
	:type thePM: opencascade::handle<PrsMgr_PresentationManager3d> &
	:param theStyle:
	:type theStyle: opencascade::handle<Prs3d_Drawer> &
	:param theMode:
	:type theMode: int
	:rtype: void
") HilightWithColor;
		virtual void HilightWithColor (const opencascade::handle<PrsMgr_PresentationManager3d> & thePM,const opencascade::handle<Prs3d_Drawer> & theStyle,const Standard_Integer theMode);
		%feature("compactdefaultargs") Index;
		%feature("autodoc", "	* returns index of manipulator axis.

	:rtype: int
") Index;
		Standard_Integer Index ();
		%feature("compactdefaultargs") IsHilighted;
		%feature("autodoc", "	:param thePM:
	:type thePM: opencascade::handle<PrsMgr_PresentationManager> &
	:param theMode:
	:type theMode: int
	:rtype: bool
") IsHilighted;
		Standard_Boolean IsHilighted (const opencascade::handle<PrsMgr_PresentationManager> & thePM,const Standard_Integer theMode);
		%feature("compactdefaultargs") Mode;
		%feature("autodoc", "	:rtype: AIS_ManipulatorMode
") Mode;
		AIS_ManipulatorMode Mode ();
		%feature("compactdefaultargs") Unhilight;
		%feature("autodoc", "	:param thePM:
	:type thePM: opencascade::handle<PrsMgr_PresentationManager> &
	:param theMode:
	:type theMode: int
	:rtype: void
") Unhilight;
		virtual void Unhilight (const opencascade::handle<PrsMgr_PresentationManager> & thePM,const Standard_Integer theMode);
};


%make_alias(AIS_ManipulatorOwner)

%extend AIS_ManipulatorOwner {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor AIS_PointCloudOwner;
class AIS_PointCloudOwner : public SelectMgr_EntityOwner {
	public:
		%feature("compactdefaultargs") AIS_PointCloudOwner;
		%feature("autodoc", "	* ////DEFINE_STANDARD_RTTIEXT(AIS_PointCloudOwner, SelectMgr_EntityOwner) Main constructor.

	:param theOrigin:
	:type theOrigin: opencascade::handle<AIS_PointCloud> &
	:rtype: None
") AIS_PointCloudOwner;
		 AIS_PointCloudOwner (const opencascade::handle<AIS_PointCloud> & theOrigin);
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	* Clears presentation.

	:param thePrsMgr:
	:type thePrsMgr: opencascade::handle<PrsMgr_PresentationManager> &
	:param theMode:
	:type theMode: int
	:rtype: void
") Clear;
		virtual void Clear (const opencascade::handle<PrsMgr_PresentationManager> & thePrsMgr,const Standard_Integer theMode);
		%feature("compactdefaultargs") DetectedPoints;
		%feature("autodoc", "	* Return last detected points. WARNING! Indexation starts with 0 (shifted by -1 comparing to Graphic3d_ArrayOfPoints::Vertice()).

	:rtype: opencascade::handle<TColStd_HPackedMapOfInteger>
") DetectedPoints;
		const opencascade::handle<TColStd_HPackedMapOfInteger> & DetectedPoints ();
		%feature("compactdefaultargs") HilightWithColor;
		%feature("autodoc", "	* Handle dynamic highlighting.

	:param thePrsMgr:
	:type thePrsMgr: opencascade::handle<PrsMgr_PresentationManager3d> &
	:param theStyle:
	:type theStyle: opencascade::handle<Prs3d_Drawer> &
	:param theMode:
	:type theMode: int
	:rtype: void
") HilightWithColor;
		virtual void HilightWithColor (const opencascade::handle<PrsMgr_PresentationManager3d> & thePrsMgr,const opencascade::handle<Prs3d_Drawer> & theStyle,const Standard_Integer theMode);
		%feature("compactdefaultargs") IsForcedHilight;
		%feature("autodoc", "	* Always update dynamic highlighting.

	:rtype: bool
") IsForcedHilight;
		virtual Standard_Boolean IsForcedHilight ();
		%feature("compactdefaultargs") SelectedPoints;
		%feature("autodoc", "	* Return selected points. WARNING! Indexation starts with 0 (shifted by -1 comparing to Graphic3d_ArrayOfPoints::Vertice()).

	:rtype: opencascade::handle<TColStd_HPackedMapOfInteger>
") SelectedPoints;
		const opencascade::handle<TColStd_HPackedMapOfInteger> & SelectedPoints ();
		%feature("compactdefaultargs") Unhilight;
		%feature("autodoc", "	* Removes highlighting.

	:param thePrsMgr:
	:type thePrsMgr: opencascade::handle<PrsMgr_PresentationManager> &
	:param theMode:
	:type theMode: int
	:rtype: void
") Unhilight;
		virtual void Unhilight (const opencascade::handle<PrsMgr_PresentationManager> & thePrsMgr,const Standard_Integer theMode);
};


%extend AIS_PointCloudOwner {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor AIS_Selection;
class AIS_Selection : public Standard_Transient {
	public:
		%feature("compactdefaultargs") AIS_Selection;
		%feature("autodoc", "	* creates a new selection.

	:rtype: None
") AIS_Selection;
		 AIS_Selection ();
		%feature("compactdefaultargs") AddSelect;
		%feature("autodoc", "	* the object is always add int the selection. faster when the number of objects selected is great.

	:param theObject:
	:type theObject: opencascade::handle<SelectMgr_EntityOwner> &
	:rtype: AIS_SelectStatus
") AddSelect;
		virtual AIS_SelectStatus AddSelect (const opencascade::handle<SelectMgr_EntityOwner> & theObject);
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	* removes all the object of the selection.

	:rtype: void
") Clear;
		virtual void Clear ();
		%feature("compactdefaultargs") ClearAndSelect;
		%feature("autodoc", "	* clears the selection and adds the object in the selection.

	:param theObject:
	:type theObject: opencascade::handle<SelectMgr_EntityOwner> &
	:rtype: None
") ClearAndSelect;
		void ClearAndSelect (const opencascade::handle<SelectMgr_EntityOwner> & theObject);
		%feature("compactdefaultargs") Extent;
		%feature("autodoc", "	* Return the number of selected objects.

	:rtype: int
") Extent;
		Standard_Integer Extent ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* Start iteration through selected objects.

	:rtype: None
") Init;
		void Init ();
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "	* Return true if list of selected objects is empty.

	:rtype: bool
") IsEmpty;
		Standard_Boolean IsEmpty ();
		%feature("compactdefaultargs") IsSelected;
		%feature("autodoc", "	* checks if the object is in the selection.

	:param theObject:
	:type theObject: opencascade::handle<SelectMgr_EntityOwner> &
	:rtype: bool
") IsSelected;
		Standard_Boolean IsSelected (const opencascade::handle<SelectMgr_EntityOwner> & theObject);
		%feature("compactdefaultargs") More;
		%feature("autodoc", "	* Return true if iterator points to selected object.

	:rtype: bool
") More;
		Standard_Boolean More ();
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "	* Continue iteration through selected objects.

	:rtype: None
") Next;
		void Next ();
		%feature("compactdefaultargs") Objects;
		%feature("autodoc", "	* Return the list of selected objects.

	:rtype: AIS_NListOfEntityOwner
") Objects;
		const AIS_NListOfEntityOwner & Objects ();
		%feature("compactdefaultargs") Select;
		%feature("autodoc", "	* if the object is not yet in the selection, it will be added. if the object is already in the selection, it will be removed.

	:param theObject:
	:type theObject: opencascade::handle<SelectMgr_EntityOwner> &
	:rtype: AIS_SelectStatus
") Select;
		virtual AIS_SelectStatus Select (const opencascade::handle<SelectMgr_EntityOwner> & theObject);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	* Return selected object at iterator position.

	:rtype: opencascade::handle<SelectMgr_EntityOwner>
") Value;
		const opencascade::handle<SelectMgr_EntityOwner> & Value ();
};


%make_alias(AIS_Selection)

%extend AIS_Selection {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor AIS_TrihedronOwner;
class AIS_TrihedronOwner : public SelectMgr_EntityOwner {
	public:
		%feature("compactdefaultargs") AIS_TrihedronOwner;
		%feature("autodoc", "	* Creates an owner of AIS_Trihedron object.

	:param theSelObject:
	:type theSelObject: opencascade::handle<SelectMgr_SelectableObject> &
	:param theDatumPart:
	:type theDatumPart: Prs3d_DatumParts
	:param thePriority:
	:type thePriority: int
	:rtype: None
") AIS_TrihedronOwner;
		 AIS_TrihedronOwner (const opencascade::handle<SelectMgr_SelectableObject> & theSelObject,const Prs3d_DatumParts theDatumPart,const Standard_Integer thePriority);
		%feature("compactdefaultargs") DatumPart;
		%feature("autodoc", "	* Returns the datum part identifier.

	:rtype: Prs3d_DatumParts
") DatumPart;
		Prs3d_DatumParts DatumPart ();
		%feature("compactdefaultargs") HilightWithColor;
		%feature("autodoc", "	* Highlights selectable object's presentation.

	:param thePM:
	:type thePM: opencascade::handle<PrsMgr_PresentationManager3d> &
	:param theStyle:
	:type theStyle: opencascade::handle<Prs3d_Drawer> &
	:param theMode:
	:type theMode: int
	:rtype: void
") HilightWithColor;
		virtual void HilightWithColor (const opencascade::handle<PrsMgr_PresentationManager3d> & thePM,const opencascade::handle<Prs3d_Drawer> & theStyle,const Standard_Integer theMode);
		%feature("compactdefaultargs") IsHilighted;
		%feature("autodoc", "	* Returns true if the presentation manager thePM highlights selections corresponding to the selection mode aMode.

	:param thePM:
	:type thePM: opencascade::handle<PrsMgr_PresentationManager> &
	:param theMode:
	:type theMode: int
	:rtype: bool
") IsHilighted;
		Standard_Boolean IsHilighted (const opencascade::handle<PrsMgr_PresentationManager> & thePM,const Standard_Integer theMode);
		%feature("compactdefaultargs") Unhilight;
		%feature("autodoc", "	* Removes highlighting from the owner of a detected selectable object in the presentation manager thePM.

	:param thePM:
	:type thePM: opencascade::handle<PrsMgr_PresentationManager> &
	:param theMode:
	:type theMode: int
	:rtype: void
") Unhilight;
		virtual void Unhilight (const opencascade::handle<PrsMgr_PresentationManager> & thePM,const Standard_Integer theMode);
};


%make_alias(AIS_TrihedronOwner)

%extend AIS_TrihedronOwner {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor AIS_TypeFilter;
class AIS_TypeFilter : public SelectMgr_Filter {
	public:
		%feature("compactdefaultargs") AIS_TypeFilter;
		%feature("autodoc", "	* Initializes filter for type, aGivenKind.

	:param aGivenKind:
	:type aGivenKind: AIS_KindOfInteractive
	:rtype: None
") AIS_TypeFilter;
		 AIS_TypeFilter (const AIS_KindOfInteractive aGivenKind);
		%feature("compactdefaultargs") IsOk;
		%feature("autodoc", "	* Returns False if the transient is not an Interactive Object, or if the type of the Interactive Object is not the same as that stored in the filter.

	:param anobj:
	:type anobj: opencascade::handle<SelectMgr_EntityOwner> &
	:rtype: bool
") IsOk;
		virtual Standard_Boolean IsOk (const opencascade::handle<SelectMgr_EntityOwner> & anobj);
};


%make_alias(AIS_TypeFilter)

%extend AIS_TypeFilter {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor AIS_ViewController;
class AIS_ViewController {
	public:
		%feature("compactdefaultargs") AIS_ViewController;
		%feature("autodoc", "	* Empty constructor.

	:rtype: None
") AIS_ViewController;
		 AIS_ViewController ();
		%feature("compactdefaultargs") AbortViewAnimation;
		%feature("autodoc", "	* Interrupt active view animation.

	:rtype: None
") AbortViewAnimation;
		void AbortViewAnimation ();
		%feature("compactdefaultargs") AddTouchPoint;
		%feature("autodoc", "	* Add touch point with the given ID. This method is expected to be called from UI thread. @param theId touch unique identifier @param thePnt touch coordinates @param theClearBefore if True previously registered touches will be removed

	:param theId:
	:type theId: Standard_Size
	:param thePnt:
	:type thePnt: Graphic3d_Vec2d &
	:param theClearBefore: default value is false
	:type theClearBefore: bool
	:rtype: void
") AddTouchPoint;
		virtual void AddTouchPoint (Standard_Size theId,const Graphic3d_Vec2d & thePnt,Standard_Boolean theClearBefore = false);
		%feature("compactdefaultargs") ChangeInputBuffer;
		%feature("autodoc", "	* Return input buffer.

	:param theType:
	:type theType: AIS_ViewInputBufferType
	:rtype: AIS_ViewInputBuffer
") ChangeInputBuffer;
		AIS_ViewInputBuffer & ChangeInputBuffer (AIS_ViewInputBufferType theType);
		%feature("compactdefaultargs") ChangeKeys;
		%feature("autodoc", "	* Return keyboard state.

	:rtype: Aspect_VKeySet
") ChangeKeys;
		Aspect_VKeySet & ChangeKeys ();
		%feature("compactdefaultargs") ChangeMouseGestureMap;
		%feature("autodoc", "	* Return map defining mouse gestures.

	:rtype: AIS_MouseGestureMap
") ChangeMouseGestureMap;
		AIS_MouseGestureMap & ChangeMouseGestureMap ();
		%feature("compactdefaultargs") EventTime;
		%feature("autodoc", "	* Return event time (e.g. current time).

	:rtype: double
") EventTime;
		double EventTime ();
		%feature("compactdefaultargs") FetchNavigationKeys;
		%feature("autodoc", "	* Fetch active navigation actions.

	:param theCrouchRatio:
	:type theCrouchRatio: float
	:param theRunRatio:
	:type theRunRatio: float
	:rtype: AIS_WalkDelta
") FetchNavigationKeys;
		AIS_WalkDelta FetchNavigationKeys (Standard_Real theCrouchRatio,Standard_Real theRunRatio);
		%feature("compactdefaultargs") FlushViewEvents;
		%feature("autodoc", "	* Update buffer for rendering thread. This method is expected to be called within synchronization barrier between GUI and Rendering threads (e.g. GUI thread should be locked beforehand to avoid data races). @param theCtx interactive context @param theView active view @param theToHandle if True, the HandleViewEvents() will be called

	:param theCtx:
	:type theCtx: opencascade::handle<AIS_InteractiveContext> &
	:param theView:
	:type theView: opencascade::handle<V3d_View> &
	:param theToHandle: default value is Standard_False
	:type theToHandle: bool
	:rtype: void
") FlushViewEvents;
		virtual void FlushViewEvents (const opencascade::handle<AIS_InteractiveContext> & theCtx,const opencascade::handle<V3d_View> & theView,Standard_Boolean theToHandle = Standard_False);
		%feature("compactdefaultargs") GravityPoint;
		%feature("autodoc", "	* Compute rotation gravity center point depending on rotation mode. This method is expected to be called from rendering thread.

	:param theCtx:
	:type theCtx: opencascade::handle<AIS_InteractiveContext> &
	:param theView:
	:type theView: opencascade::handle<V3d_View> &
	:rtype: gp_Pnt
") GravityPoint;
		virtual gp_Pnt GravityPoint (const opencascade::handle<AIS_InteractiveContext> & theCtx,const opencascade::handle<V3d_View> & theView);
		%feature("compactdefaultargs") HandleViewEvents;
		%feature("autodoc", "	* Process events within rendering thread.

	:param theCtx:
	:type theCtx: opencascade::handle<AIS_InteractiveContext> &
	:param theView:
	:type theView: opencascade::handle<V3d_View> &
	:rtype: void
") HandleViewEvents;
		virtual void HandleViewEvents (const opencascade::handle<AIS_InteractiveContext> & theCtx,const opencascade::handle<V3d_View> & theView);
		%feature("compactdefaultargs") HasPreviousMoveTo;
		%feature("autodoc", "	* Return True if previous position of MoveTo has been defined.

	:rtype: bool
") HasPreviousMoveTo;
		bool HasPreviousMoveTo ();
		%feature("compactdefaultargs") HasTouchPoints;
		%feature("autodoc", "	* Return True if touches map is not empty.

	:rtype: bool
") HasTouchPoints;
		bool HasTouchPoints ();
		%feature("compactdefaultargs") InputBuffer;
		%feature("autodoc", "	* Return input buffer.

	:param theType:
	:type theType: AIS_ViewInputBufferType
	:rtype: AIS_ViewInputBuffer
") InputBuffer;
		const AIS_ViewInputBuffer & InputBuffer (AIS_ViewInputBufferType theType);
		%feature("compactdefaultargs") KeyDown;
		%feature("autodoc", "	* Press key. @param theKey key pressed @param theTime event timestamp

	:param theKey:
	:type theKey: Aspect_VKey
	:param theTime:
	:type theTime: double
	:param thePressure: default value is 1.0
	:type thePressure: double
	:rtype: void
") KeyDown;
		virtual void KeyDown (Aspect_VKey theKey,double theTime,double thePressure = 1.0);
		%feature("compactdefaultargs") KeyFromAxis;
		%feature("autodoc", "	* Simulate key up/down events from axis value.

	:param theNegative:
	:type theNegative: Aspect_VKey
	:param thePositive:
	:type thePositive: Aspect_VKey
	:param theTime:
	:type theTime: double
	:param thePressure:
	:type thePressure: double
	:rtype: void
") KeyFromAxis;
		virtual void KeyFromAxis (Aspect_VKey theNegative,Aspect_VKey thePositive,double theTime,double thePressure);
		%feature("compactdefaultargs") KeyUp;
		%feature("autodoc", "	* Release key. @param theKey key pressed @param theTime event timestamp

	:param theKey:
	:type theKey: Aspect_VKey
	:param theTime:
	:type theTime: double
	:rtype: void
") KeyUp;
		virtual void KeyUp (Aspect_VKey theKey,double theTime);
		%feature("compactdefaultargs") Keys;
		%feature("autodoc", "	* @name keyboard input Return keyboard state.

	:rtype: Aspect_VKeySet
") Keys;
		const Aspect_VKeySet & Keys ();
		%feature("compactdefaultargs") LastMouseFlags;
		%feature("autodoc", "	* Return active key modifiers passed with last mouse event.

	:rtype: Aspect_VKeyFlags
") LastMouseFlags;
		Aspect_VKeyFlags LastMouseFlags ();
		%feature("compactdefaultargs") LastMousePosition;
		%feature("autodoc", "	* Return last mouse position.

	:rtype: Graphic3d_Vec2i
") LastMousePosition;
		const Graphic3d_Vec2i & LastMousePosition ();
		%feature("compactdefaultargs") MinZoomDistance;
		%feature("autodoc", "	* Return minimal camera distance for zoom operation.

	:rtype: double
") MinZoomDistance;
		double MinZoomDistance ();
		%feature("compactdefaultargs") MouseAcceleration;
		%feature("autodoc", "	* Return mouse input acceleration ratio in First Person mode; 1.0 by default.

	:rtype: float
") MouseAcceleration;
		float MouseAcceleration ();
		%feature("compactdefaultargs") MouseDoubleClickInterval;
		%feature("autodoc", "	* Return double click interval in seconds; 0.4 by default.

	:rtype: double
") MouseDoubleClickInterval;
		double MouseDoubleClickInterval ();
		%feature("compactdefaultargs") MouseGestureMap;
		%feature("autodoc", "	* @name mouse input Return map defining mouse gestures.

	:rtype: AIS_MouseGestureMap
") MouseGestureMap;
		const AIS_MouseGestureMap & MouseGestureMap ();
		%feature("compactdefaultargs") NavigationMode;
		%feature("autodoc", "	* Return camera navigation mode; AIS_NavigationMode_Orbit by default.

	:rtype: AIS_NavigationMode
") NavigationMode;
		AIS_NavigationMode NavigationMode ();
		%feature("compactdefaultargs") OnObjectDragged;
		%feature("autodoc", "	* Callback called by handleMoveTo() on dragging object in 3D Viewer. This method is expected to be called from rendering thread.

	:param theCtx:
	:type theCtx: opencascade::handle<AIS_InteractiveContext> &
	:param theView:
	:type theView: opencascade::handle<V3d_View> &
	:param theAction:
	:type theAction: AIS_DragAction
	:rtype: void
") OnObjectDragged;
		virtual void OnObjectDragged (const opencascade::handle<AIS_InteractiveContext> & theCtx,const opencascade::handle<V3d_View> & theView,AIS_DragAction theAction);
		%feature("compactdefaultargs") OnSelectionChanged;
		%feature("autodoc", "	* Callback called by handleMoveTo() on Selection in 3D Viewer. This method is expected to be called from rendering thread.

	:param theCtx:
	:type theCtx: opencascade::handle<AIS_InteractiveContext> &
	:param theView:
	:type theView: opencascade::handle<V3d_View> &
	:rtype: void
") OnSelectionChanged;
		virtual void OnSelectionChanged (const opencascade::handle<AIS_InteractiveContext> & theCtx,const opencascade::handle<V3d_View> & theView);
		%feature("compactdefaultargs") OrbitAcceleration;
		%feature("autodoc", "	* Return orbit rotation acceleration ratio; 1.0 by default.

	:rtype: float
") OrbitAcceleration;
		float OrbitAcceleration ();
		%feature("compactdefaultargs") PickPoint;
		%feature("autodoc", "	* Pick closest point under mouse cursor. This method is expected to be called from rendering thread. @param thePnt [out] result point @param theCtx [in] interactive context @param theView [in] active view @param theCursor [in] mouse cursor @param theToStickToPickRay [in] when True, the result point will lie on picking ray returns True if result has been found

	:param thePnt:
	:type thePnt: gp_Pnt
	:param theCtx:
	:type theCtx: opencascade::handle<AIS_InteractiveContext> &
	:param theView:
	:type theView: opencascade::handle<V3d_View> &
	:param theCursor:
	:type theCursor: Graphic3d_Vec2i &
	:param theToStickToPickRay:
	:type theToStickToPickRay: bool
	:rtype: bool
") PickPoint;
		virtual bool PickPoint (gp_Pnt & thePnt,const opencascade::handle<AIS_InteractiveContext> & theCtx,const opencascade::handle<V3d_View> & theView,const Graphic3d_Vec2i & theCursor,bool theToStickToPickRay);
		%feature("compactdefaultargs") PressMouseButton;
		%feature("autodoc", "	* Handle mouse button press event. This method is expected to be called from UI thread. @param thePoint mouse cursor position @param theButton pressed button @param theModifiers key modifiers @param theIsEmulated if True then mouse event comes NOT from real mouse  but emulated from non-precise input like touch on screen returns True if View should be redrawn

	:param thePoint:
	:type thePoint: Graphic3d_Vec2i &
	:param theButton:
	:type theButton: Aspect_VKeyMouse
	:param theModifiers:
	:type theModifiers: Aspect_VKeyFlags
	:param theIsEmulated:
	:type theIsEmulated: bool
	:rtype: bool
") PressMouseButton;
		bool PressMouseButton (const Graphic3d_Vec2i & thePoint,Aspect_VKeyMouse theButton,Aspect_VKeyFlags theModifiers,bool theIsEmulated);
		%feature("compactdefaultargs") PressedMouseButtons;
		%feature("autodoc", "	* Return currently pressed mouse buttons.

	:rtype: Aspect_VKeyMouse
") PressedMouseButtons;
		Aspect_VKeyMouse PressedMouseButtons ();
		%feature("compactdefaultargs") PreviousMoveTo;
		%feature("autodoc", "	* Return previous position of MoveTo event in 3D viewer.

	:rtype: Graphic3d_Vec2i
") PreviousMoveTo;
		const Graphic3d_Vec2i & PreviousMoveTo ();
		%feature("compactdefaultargs") ReleaseMouseButton;
		%feature("autodoc", "	* Handle mouse button release event. This method is expected to be called from UI thread. @param thePoint mouse cursor position @param theButton released button @param theModifiers key modifiers @param theIsEmulated if True then mouse event comes NOT from real mouse  but emulated from non-precise input like touch on screen returns True if View should be redrawn

	:param thePoint:
	:type thePoint: Graphic3d_Vec2i &
	:param theButton:
	:type theButton: Aspect_VKeyMouse
	:param theModifiers:
	:type theModifiers: Aspect_VKeyFlags
	:param theIsEmulated:
	:type theIsEmulated: bool
	:rtype: bool
") ReleaseMouseButton;
		bool ReleaseMouseButton (const Graphic3d_Vec2i & thePoint,Aspect_VKeyMouse theButton,Aspect_VKeyFlags theModifiers,bool theIsEmulated);
		%feature("compactdefaultargs") RemoveTouchPoint;
		%feature("autodoc", "	* Remove touch point with the given ID. This method is expected to be called from UI thread. @param theId touch unique identifier @param theClearSelectPnts if True will initiate clearing of selection points returns True if point has been removed

	:param theId:
	:type theId: Standard_Size
	:param theClearSelectPnts: default value is false
	:type theClearSelectPnts: bool
	:rtype: bool
") RemoveTouchPoint;
		virtual bool RemoveTouchPoint (Standard_Size theId,Standard_Boolean theClearSelectPnts = false);
		%feature("compactdefaultargs") ResetPreviousMoveTo;
		%feature("autodoc", "	* Reset previous position of MoveTo.

	:rtype: None
") ResetPreviousMoveTo;
		void ResetPreviousMoveTo ();
		%feature("compactdefaultargs") ResetViewInput;
		%feature("autodoc", "	* Reset input state (pressed keys, mouse buttons, etc.) e.g. on window focus loss. This method is expected to be called from UI thread.

	:rtype: void
") ResetViewInput;
		virtual void ResetViewInput ();
		%feature("compactdefaultargs") RotationMode;
		%feature("autodoc", "	* @name global parameters Return camera rotation mode, AIS_RotationMode_BndBoxActive by default.

	:rtype: AIS_RotationMode
") RotationMode;
		AIS_RotationMode RotationMode ();
		%feature("compactdefaultargs") SelectInViewer;
		%feature("autodoc", "	* Perform selection in 3D viewer. This method is expected to be called from UI thread. @param thePnt picking point @param theIsXOR XOR selection flag

	:param thePnt:
	:type thePnt: Graphic3d_Vec2i &
	:param theIsXOR: default value is false
	:type theIsXOR: bool
	:rtype: void
") SelectInViewer;
		virtual void SelectInViewer (const Graphic3d_Vec2i & thePnt,const bool theIsXOR = false);
		%feature("compactdefaultargs") SelectInViewer;
		%feature("autodoc", "	* Perform selection in 3D viewer. This method is expected to be called from UI thread. @param thePnts picking point @param theIsXOR XOR selection flag

	:param thePnts:
	:type thePnts: NCollection_Sequence<Graphic3d_Vec2i> &
	:param theIsXOR: default value is false
	:type theIsXOR: bool
	:rtype: void
") SelectInViewer;
		virtual void SelectInViewer (const NCollection_Sequence<Graphic3d_Vec2i> & thePnts,const bool theIsXOR = false);
		%feature("compactdefaultargs") SetAllowDragging;
		%feature("autodoc", "	* Set if dynamic highlight on mouse move is allowed.

	:param theToEnable:
	:type theToEnable: bool
	:rtype: None
") SetAllowDragging;
		void SetAllowDragging (bool theToEnable);
		%feature("compactdefaultargs") SetAllowHighlight;
		%feature("autodoc", "	* Set if dragging object is allowed.

	:param theToEnable:
	:type theToEnable: bool
	:rtype: None
") SetAllowHighlight;
		void SetAllowHighlight (bool theToEnable);
		%feature("compactdefaultargs") SetAllowPanning;
		%feature("autodoc", "	* Set if panning is allowed.

	:param theToEnable:
	:type theToEnable: bool
	:rtype: None
") SetAllowPanning;
		void SetAllowPanning (bool theToEnable);
		%feature("compactdefaultargs") SetAllowRotation;
		%feature("autodoc", "	* Set if camera rotation is allowed.

	:param theToEnable:
	:type theToEnable: bool
	:rtype: None
") SetAllowRotation;
		void SetAllowRotation (bool theToEnable);
		%feature("compactdefaultargs") SetAllowTouchZRotation;
		%feature("autodoc", "	* Set if z-rotation via two-touches gesture is enabled.

	:param theToEnable:
	:type theToEnable: bool
	:rtype: None
") SetAllowTouchZRotation;
		void SetAllowTouchZRotation (bool theToEnable);
		%feature("compactdefaultargs") SetAllowZFocus;
		%feature("autodoc", "	* Set if ZFocus change is allowed.

	:param theToEnable:
	:type theToEnable: bool
	:rtype: None
") SetAllowZFocus;
		void SetAllowZFocus (bool theToEnable);
		%feature("compactdefaultargs") SetAllowZooming;
		%feature("autodoc", "	* Set if zooming is allowed.

	:param theToEnable:
	:type theToEnable: bool
	:rtype: None
") SetAllowZooming;
		void SetAllowZooming (bool theToEnable);
		%feature("compactdefaultargs") SetInvertPitch;
		%feature("autodoc", "	* Set flag inverting pitch direction.

	:param theToInvert:
	:type theToInvert: bool
	:rtype: None
") SetInvertPitch;
		void SetInvertPitch (bool theToInvert);
		%feature("compactdefaultargs") SetLockOrbitZUp;
		%feature("autodoc", "	* Set if camera up orientation within AIS_NavigationMode_Orbit rotation mode should be forced Z up.

	:param theToForceUp:
	:type theToForceUp: bool
	:rtype: None
") SetLockOrbitZUp;
		void SetLockOrbitZUp (bool theToForceUp);
		%feature("compactdefaultargs") SetMinZoomDistance;
		%feature("autodoc", "	* Set minimal camera distance for zoom operation.

	:param theDist:
	:type theDist: double
	:rtype: None
") SetMinZoomDistance;
		void SetMinZoomDistance (double theDist);
		%feature("compactdefaultargs") SetMouseAcceleration;
		%feature("autodoc", "	* Set mouse input acceleration ratio.

	:param theRatio:
	:type theRatio: float
	:rtype: None
") SetMouseAcceleration;
		void SetMouseAcceleration (float theRatio);
		%feature("compactdefaultargs") SetMouseDoubleClickInterval;
		%feature("autodoc", "	* Set double click interval in seconds.

	:param theSeconds:
	:type theSeconds: double
	:rtype: None
") SetMouseDoubleClickInterval;
		void SetMouseDoubleClickInterval (double theSeconds);
		%feature("compactdefaultargs") SetNavigationMode;
		%feature("autodoc", "	* Set camera navigation mode.

	:param theMode:
	:type theMode: AIS_NavigationMode
	:rtype: None
") SetNavigationMode;
		void SetNavigationMode (AIS_NavigationMode theMode);
		%feature("compactdefaultargs") SetOrbitAcceleration;
		%feature("autodoc", "	* Set orbit rotation acceleration ratio.

	:param theRatio:
	:type theRatio: float
	:rtype: None
") SetOrbitAcceleration;
		void SetOrbitAcceleration (float theRatio);
		%feature("compactdefaultargs") SetRotationMode;
		%feature("autodoc", "	* Set camera rotation mode.

	:param theMode:
	:type theMode: AIS_RotationMode
	:rtype: None
") SetRotationMode;
		void SetRotationMode (AIS_RotationMode theMode);
		%feature("compactdefaultargs") SetShowPanAnchorPoint;
		%feature("autodoc", "	* Set if panning anchor point within perspective projection should be displayed in 3D Viewer.

	:param theToShow:
	:type theToShow: bool
	:rtype: None
") SetShowPanAnchorPoint;
		void SetShowPanAnchorPoint (bool theToShow);
		%feature("compactdefaultargs") SetShowRotateCenter;
		%feature("autodoc", "	* Set if rotation point should be displayed in 3D Viewer.

	:param theToShow:
	:type theToShow: bool
	:rtype: None
") SetShowRotateCenter;
		void SetShowRotateCenter (bool theToShow);
		%feature("compactdefaultargs") SetStickToRayOnRotation;
		%feature("autodoc", "	* Set if picked point should be projected to picking ray on rotating around point.

	:param theToEnable:
	:type theToEnable: bool
	:rtype: None
") SetStickToRayOnRotation;
		void SetStickToRayOnRotation (bool theToEnable);
		%feature("compactdefaultargs") SetStickToRayOnZoom;
		%feature("autodoc", "	* Set if picked point should be projected to picking ray on zooming at point.

	:param theToEnable:
	:type theToEnable: bool
	:rtype: None
") SetStickToRayOnZoom;
		void SetStickToRayOnZoom (bool theToEnable);
		%feature("compactdefaultargs") SetThrustSpeed;
		%feature("autodoc", "	* Set active thrust value.

	:param theSpeed:
	:type theSpeed: float
	:rtype: None
") SetThrustSpeed;
		void SetThrustSpeed (float theSpeed);
		%feature("compactdefaultargs") SetTouchToleranceScale;
		%feature("autodoc", "	* Set scale factor for adjusting tolerances for starting multi-touch gestures.

	:param theTolerance:
	:type theTolerance: float
	:rtype: None
") SetTouchToleranceScale;
		void SetTouchToleranceScale (float theTolerance);
		%feature("compactdefaultargs") SetViewAnimation;
		%feature("autodoc", "	* Set view animation to be handled within handleViewRedraw().

	:param theAnimation:
	:type theAnimation: opencascade::handle<AIS_AnimationCamera> &
	:rtype: None
") SetViewAnimation;
		void SetViewAnimation (const opencascade::handle<AIS_AnimationCamera> & theAnimation);
		%feature("compactdefaultargs") SetWalkSpeedAbsolute;
		%feature("autodoc", "	* Set normal walking speed, in m/s; 1.5 by default.

	:param theSpeed:
	:type theSpeed: float
	:rtype: None
") SetWalkSpeedAbsolute;
		void SetWalkSpeedAbsolute (float theSpeed);
		%feature("compactdefaultargs") SetWalkSpeedRelative;
		%feature("autodoc", "	* Set walking speed relative to scene bounding box.

	:param theFactor:
	:type theFactor: float
	:rtype: None
") SetWalkSpeedRelative;
		void SetWalkSpeedRelative (float theFactor);
		%feature("compactdefaultargs") ThrustSpeed;
		%feature("autodoc", "	* Return active thrust value; 0.0f by default.

	:rtype: float
") ThrustSpeed;
		float ThrustSpeed ();
		%feature("compactdefaultargs") ToAllowDragging;
		%feature("autodoc", "	* Return True if dragging object is allowed; True by default.

	:rtype: bool
") ToAllowDragging;
		bool ToAllowDragging ();
		%feature("compactdefaultargs") ToAllowHighlight;
		%feature("autodoc", "	* Return True if dynamic highlight on mouse move is allowed; True by default.

	:rtype: bool
") ToAllowHighlight;
		bool ToAllowHighlight ();
		%feature("compactdefaultargs") ToAllowPanning;
		%feature("autodoc", "	* Return True if panning is allowed; True by default.

	:rtype: bool
") ToAllowPanning;
		bool ToAllowPanning ();
		%feature("compactdefaultargs") ToAllowRotation;
		%feature("autodoc", "	* Return True if camera rotation is allowed; True by default.

	:rtype: bool
") ToAllowRotation;
		bool ToAllowRotation ();
		%feature("compactdefaultargs") ToAllowTouchZRotation;
		%feature("autodoc", "	* Return True if z-rotation via two-touches gesture is enabled; False by default.

	:rtype: bool
") ToAllowTouchZRotation;
		bool ToAllowTouchZRotation ();
		%feature("compactdefaultargs") ToAllowZFocus;
		%feature("autodoc", "	* Return True if ZFocus change is allowed; True by default.

	:rtype: bool
") ToAllowZFocus;
		bool ToAllowZFocus ();
		%feature("compactdefaultargs") ToAllowZooming;
		%feature("autodoc", "	* Return True if zooming is allowed; True by default.

	:rtype: bool
") ToAllowZooming;
		bool ToAllowZooming ();
		%feature("compactdefaultargs") ToInvertPitch;
		%feature("autodoc", "	* Return True if pitch direction should be inverted while processing Aspect_VKey_NavLookUp/Aspect_VKey_NavLookDown; False by default.

	:rtype: bool
") ToInvertPitch;
		bool ToInvertPitch ();
		%feature("compactdefaultargs") ToLockOrbitZUp;
		%feature("autodoc", "	* Return True if camera up orientation within AIS_NavigationMode_Orbit rotation mode should be forced Z up; False by default.

	:rtype: bool
") ToLockOrbitZUp;
		bool ToLockOrbitZUp ();
		%feature("compactdefaultargs") ToShowPanAnchorPoint;
		%feature("autodoc", "	* Return True if panning anchor point within perspective projection should be displayed in 3D Viewer; True by default.

	:rtype: bool
") ToShowPanAnchorPoint;
		bool ToShowPanAnchorPoint ();
		%feature("compactdefaultargs") ToShowRotateCenter;
		%feature("autodoc", "	* Return True if rotation point should be displayed in 3D Viewer; True by default.

	:rtype: bool
") ToShowRotateCenter;
		bool ToShowRotateCenter ();
		%feature("compactdefaultargs") ToStickToRayOnRotation;
		%feature("autodoc", "	* Return True if picked point should be projected to picking ray on rotating around point; True by default.

	:rtype: bool
") ToStickToRayOnRotation;
		bool ToStickToRayOnRotation ();
		%feature("compactdefaultargs") ToStickToRayOnZoom;
		%feature("autodoc", "	* Return True if picked point should be projected to picking ray on zooming at point; True by default.

	:rtype: bool
") ToStickToRayOnZoom;
		bool ToStickToRayOnZoom ();
		%feature("compactdefaultargs") TouchToleranceScale;
		%feature("autodoc", "	* @name multi-touch input Return scale factor for adjusting tolerances for starting multi-touch gestures; 1.0 by default This scale factor is expected to be computed from touch screen resolution.

	:rtype: float
") TouchToleranceScale;
		float TouchToleranceScale ();
		%feature("compactdefaultargs") UpdateMouseButtons;
		%feature("autodoc", "	* Handle mouse button press/release event. This method is expected to be called from UI thread. @param thePoint mouse cursor position @param theButtons pressed buttons @param theModifiers key modifiers @param theIsEmulated if True then mouse event comes NOT from real mouse  but emulated from non-precise input like touch on screen returns True if View should be redrawn

	:param thePoint:
	:type thePoint: Graphic3d_Vec2i &
	:param theButtons:
	:type theButtons: Aspect_VKeyMouse
	:param theModifiers:
	:type theModifiers: Aspect_VKeyFlags
	:param theIsEmulated:
	:type theIsEmulated: bool
	:rtype: bool
") UpdateMouseButtons;
		virtual bool UpdateMouseButtons (const Graphic3d_Vec2i & thePoint,Aspect_VKeyMouse theButtons,Aspect_VKeyFlags theModifiers,bool theIsEmulated);
		%feature("compactdefaultargs") UpdateMouseClick;
		%feature("autodoc", "	* Handle mouse button click event (emulated by UpdateMouseButtons() while releasing single button). Note that as this method is called by UpdateMouseButtons(), it should be executed from UI thread. Default implementation redirects to SelectInViewer(). This method is expected to be called from UI thread. @param thePoint mouse cursor position @param theButton clicked button @param theModifiers key modifiers @param theIsDoubleClick flag indicating double mouse click returns True if View should be redrawn

	:param thePoint:
	:type thePoint: Graphic3d_Vec2i &
	:param theButton:
	:type theButton: Aspect_VKeyMouse
	:param theModifiers:
	:type theModifiers: Aspect_VKeyFlags
	:param theIsDoubleClick:
	:type theIsDoubleClick: bool
	:rtype: bool
") UpdateMouseClick;
		virtual bool UpdateMouseClick (const Graphic3d_Vec2i & thePoint,Aspect_VKeyMouse theButton,Aspect_VKeyFlags theModifiers,bool theIsDoubleClick);
		%feature("compactdefaultargs") UpdateMousePosition;
		%feature("autodoc", "	* Handle mouse cursor movement event. This method is expected to be called from UI thread. @param thePoint mouse cursor position @param theButtons pressed buttons @param theModifiers key modifiers @param theIsEmulated if True then mouse event comes NOT from real mouse  but emulated from non-precise input like touch on screen returns True if View should be redrawn

	:param thePoint:
	:type thePoint: Graphic3d_Vec2i &
	:param theButtons:
	:type theButtons: Aspect_VKeyMouse
	:param theModifiers:
	:type theModifiers: Aspect_VKeyFlags
	:param theIsEmulated:
	:type theIsEmulated: bool
	:rtype: bool
") UpdateMousePosition;
		virtual bool UpdateMousePosition (const Graphic3d_Vec2i & thePoint,Aspect_VKeyMouse theButtons,Aspect_VKeyFlags theModifiers,bool theIsEmulated);
		%feature("compactdefaultargs") UpdateMouseScroll;
		%feature("autodoc", "	* Update mouse scroll event; redirects to UpdateZoom by default. This method is expected to be called from UI thread. @param theDelta mouse cursor position and delta returns True if new event has been created or False if existing one has been updated

	:param theDelta:
	:type theDelta: Aspect_ScrollDelta &
	:rtype: bool
") UpdateMouseScroll;
		virtual bool UpdateMouseScroll (const Aspect_ScrollDelta & theDelta);
		%feature("compactdefaultargs") UpdatePolySelection;
		%feature("autodoc", "	* Update polygonal selection tool. This method is expected to be called from UI thread. @param thePnt new point to add to polygon @param theToAppend append new point or update the last point

	:param thePnt:
	:type thePnt: Graphic3d_Vec2i &
	:param theToAppend:
	:type theToAppend: bool
	:rtype: void
") UpdatePolySelection;
		virtual void UpdatePolySelection (const Graphic3d_Vec2i & thePnt,bool theToAppend);
		%feature("compactdefaultargs") UpdateRubberBand;
		%feature("autodoc", "	* Update rectangle selection tool. This method is expected to be called from UI thread. @param thePntFrom rectangle first corner @param thePntTo rectangle another corner @param theIsXOR XOR selection flag

	:param thePntFrom:
	:type thePntFrom: Graphic3d_Vec2i &
	:param thePntTo:
	:type thePntTo: Graphic3d_Vec2i &
	:param theIsXOR: default value is false
	:type theIsXOR: bool
	:rtype: void
") UpdateRubberBand;
		virtual void UpdateRubberBand (const Graphic3d_Vec2i & thePntFrom,const Graphic3d_Vec2i & thePntTo,const bool theIsXOR = false);
		%feature("compactdefaultargs") UpdateTouchPoint;
		%feature("autodoc", "	* Update touch point with the given ID. If point with specified ID was not registered before, it will be added. This method is expected to be called from UI thread. @param theId touch unique identifier @param thePnt touch coordinates

	:param theId:
	:type theId: Standard_Size
	:param thePnt:
	:type thePnt: Graphic3d_Vec2d &
	:rtype: void
") UpdateTouchPoint;
		virtual void UpdateTouchPoint (Standard_Size theId,const Graphic3d_Vec2d & thePnt);
		%feature("compactdefaultargs") UpdateViewOrientation;
		%feature("autodoc", "	* Reset view orientation. This method is expected to be called from UI thread.

	:param theOrientation:
	:type theOrientation: V3d_TypeOfOrientation
	:param theToFitAll:
	:type theToFitAll: bool
	:rtype: void
") UpdateViewOrientation;
		virtual void UpdateViewOrientation (V3d_TypeOfOrientation theOrientation,bool theToFitAll);
		%feature("compactdefaultargs") UpdateZRotation;
		%feature("autodoc", "	* Update Z rotation event. @param theAngle rotation angle, in radians. returns True if new zoom event has been created or False if existing one has been updated

	:param theAngle:
	:type theAngle: double
	:rtype: bool
") UpdateZRotation;
		virtual bool UpdateZRotation (double theAngle);
		%feature("compactdefaultargs") UpdateZoom;
		%feature("autodoc", "	* Update zoom event (e.g. from mouse scroll). This method is expected to be called from UI thread. @param theDelta mouse cursor position to zoom at and zoom delta returns True if new zoom event has been created or False if existing one has been updated

	:param theDelta:
	:type theDelta: Aspect_ScrollDelta &
	:rtype: bool
") UpdateZoom;
		virtual bool UpdateZoom (const Aspect_ScrollDelta & theDelta);
		%feature("compactdefaultargs") ViewAnimation;
		%feature("autodoc", "	* Return view animation; empty (but not NULL) animation by default.

	:rtype: opencascade::handle<AIS_AnimationCamera>
") ViewAnimation;
		const opencascade::handle<AIS_AnimationCamera> & ViewAnimation ();
		%feature("compactdefaultargs") WalkSpeedAbsolute;
		%feature("autodoc", "	* Return normal walking speed, in m/s; 1.5 by default.

	:rtype: float
") WalkSpeedAbsolute;
		float WalkSpeedAbsolute ();
		%feature("compactdefaultargs") WalkSpeedRelative;
		%feature("autodoc", "	* Return walking speed relative to scene bounding box; 0.1 by default.

	:rtype: float
") WalkSpeedRelative;
		float WalkSpeedRelative ();
		%feature("compactdefaultargs") handleCameraActions;
		%feature("autodoc", "	* Perform camera actions. This method is expected to be called from rendering thread.

	:param theCtx:
	:type theCtx: opencascade::handle<AIS_InteractiveContext> &
	:param theView:
	:type theView: opencascade::handle<V3d_View> &
	:param theWalk:
	:type theWalk: AIS_WalkDelta &
	:rtype: void
") handleCameraActions;
		virtual void handleCameraActions (const opencascade::handle<AIS_InteractiveContext> & theCtx,const opencascade::handle<V3d_View> & theView,const AIS_WalkDelta & theWalk);
		%feature("compactdefaultargs") handleMoveTo;
		%feature("autodoc", "	* Perform moveto/selection/dragging. This method is expected to be called from rendering thread.

	:param theCtx:
	:type theCtx: opencascade::handle<AIS_InteractiveContext> &
	:param theView:
	:type theView: opencascade::handle<V3d_View> &
	:rtype: void
") handleMoveTo;
		virtual void handleMoveTo (const opencascade::handle<AIS_InteractiveContext> & theCtx,const opencascade::handle<V3d_View> & theView);
		%feature("compactdefaultargs") handleOrbitRotation;
		%feature("autodoc", "	* Handle orbital rotation events myGL.OrbitRotation. @param theView view to modify @param thePnt 3D point to rotate around @param theToLockZUp amend camera to exclude roll angle (put camera Up vector to plane containing global Z and view direction)

	:param theView:
	:type theView: opencascade::handle<V3d_View> &
	:param thePnt:
	:type thePnt: gp_Pnt
	:param theToLockZUp:
	:type theToLockZUp: bool
	:rtype: void
") handleOrbitRotation;
		virtual void handleOrbitRotation (const opencascade::handle<V3d_View> & theView,const gp_Pnt & thePnt,bool theToLockZUp);
		%feature("compactdefaultargs") handlePanning;
		%feature("autodoc", "	* Handle panning event myGL.Panning.

	:param theView:
	:type theView: opencascade::handle<V3d_View> &
	:rtype: void
") handlePanning;
		virtual void handlePanning (const opencascade::handle<V3d_View> & theView);
		%feature("compactdefaultargs") handleViewRedraw;
		%feature("autodoc", "	* Handle view redraw. This method is expected to be called from rendering thread.

	:param theCtx:
	:type theCtx: opencascade::handle<AIS_InteractiveContext> &
	:param theView:
	:type theView: opencascade::handle<V3d_View> &
	:rtype: void
") handleViewRedraw;
		virtual void handleViewRedraw (const opencascade::handle<AIS_InteractiveContext> & theCtx,const opencascade::handle<V3d_View> & theView);
		%feature("compactdefaultargs") handleViewRotation;
		%feature("autodoc", "	* Handle view direction rotation events myGL.ViewRotation. This method is expected to be called from rendering thread. @param theView camera to modify @param theYawExtra extra yaw increment @param thePitchExtra extra pitch increment @param theRoll roll value @param theToRestartOnIncrement flag indicating flight mode

	:param theView:
	:type theView: opencascade::handle<V3d_View> &
	:param theYawExtra:
	:type theYawExtra: double
	:param thePitchExtra:
	:type thePitchExtra: double
	:param theRoll:
	:type theRoll: double
	:param theToRestartOnIncrement:
	:type theToRestartOnIncrement: bool
	:rtype: void
") handleViewRotation;
		virtual void handleViewRotation (const opencascade::handle<V3d_View> & theView,double theYawExtra,double thePitchExtra,double theRoll,bool theToRestartOnIncrement);
		%feature("compactdefaultargs") handleZFocusScroll;
		%feature("autodoc", "	* Handle ZScroll event myGL.ZoomActions. This method is expected to be called from rendering thread.

	:param theView:
	:type theView: opencascade::handle<V3d_View> &
	:param theParams:
	:type theParams: Aspect_ScrollDelta &
	:rtype: void
") handleZFocusScroll;
		virtual void handleZFocusScroll (const opencascade::handle<V3d_View> & theView,const Aspect_ScrollDelta & theParams);
		%feature("compactdefaultargs") handleZRotate;
		%feature("autodoc", "	* Handle Z rotation event myGL.ZRotate.

	:param theView:
	:type theView: opencascade::handle<V3d_View> &
	:rtype: void
") handleZRotate;
		virtual void handleZRotate (const opencascade::handle<V3d_View> & theView);
		%feature("compactdefaultargs") handleZoom;
		%feature("autodoc", "	* Handle zoom event myGL.ZoomActions. This method is expected to be called from rendering thread.

	:param theView:
	:type theView: opencascade::handle<V3d_View> &
	:param theParams:
	:type theParams: Aspect_ScrollDelta &
	:param thePnt:
	:type thePnt: gp_Pnt *
	:rtype: void
") handleZoom;
		virtual void handleZoom (const opencascade::handle<V3d_View> & theView,const Aspect_ScrollDelta & theParams,const gp_Pnt * thePnt);
		%feature("compactdefaultargs") hasPanningAnchorPoint;
		%feature("autodoc", "	* Return if panning anchor point has been defined.

	:rtype: bool
") hasPanningAnchorPoint;
		bool hasPanningAnchorPoint ();
		%feature("compactdefaultargs") panningAnchorPoint;
		%feature("autodoc", "	* Return active panning anchor point.

	:rtype: gp_Pnt
") panningAnchorPoint;
		const gp_Pnt  panningAnchorPoint ();
		%feature("compactdefaultargs") setAskNextFrame;
		%feature("autodoc", "	* Set if another frame should be drawn right after this one.

	:param theToDraw: default value is true
	:type theToDraw: bool
	:rtype: None
") setAskNextFrame;
		void setAskNextFrame (bool theToDraw = true);
		%feature("compactdefaultargs") setPanningAnchorPoint;
		%feature("autodoc", "	* Set active panning anchor point.

	:param thePnt:
	:type thePnt: gp_Pnt
	:rtype: None
") setPanningAnchorPoint;
		void setPanningAnchorPoint (const gp_Pnt & thePnt);
		%feature("compactdefaultargs") toAskNextFrame;
		%feature("autodoc", "	* Return True if another frame should be drawn right after this one.

	:rtype: bool
") toAskNextFrame;
		bool toAskNextFrame ();
};


%extend AIS_ViewController {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor AIS_ViewCubeOwner;
class AIS_ViewCubeOwner : public SelectMgr_EntityOwner {
	public:
		%feature("compactdefaultargs") AIS_ViewCubeOwner;
		%feature("autodoc", "	* ////DEFINE_STANDARD_RTTIEXT(AIS_ViewCubeOwner, SelectMgr_EntityOwner) Main constructor.

	:param theObject:
	:type theObject: opencascade::handle<AIS_ViewCube> &
	:param theOrient:
	:type theOrient: V3d_TypeOfOrientation
	:param thePriority: default value is 5
	:type thePriority: int
	:rtype: None
") AIS_ViewCubeOwner;
		 AIS_ViewCubeOwner (const opencascade::handle<AIS_ViewCube> & theObject,V3d_TypeOfOrientation theOrient,Standard_Integer thePriority = 5);
		%feature("compactdefaultargs") HandleMouseClick;
		%feature("autodoc", "	* Handle mouse button click event.

	:param thePoint:
	:type thePoint: Graphic3d_Vec2i &
	:param theButton:
	:type theButton: Aspect_VKeyMouse
	:param theModifiers:
	:type theModifiers: Aspect_VKeyFlags
	:param theIsDoubleClick:
	:type theIsDoubleClick: bool
	:rtype: bool
") HandleMouseClick;
		Standard_Boolean HandleMouseClick (const Graphic3d_Vec2i & thePoint,Aspect_VKeyMouse theButton,Aspect_VKeyFlags theModifiers,bool theIsDoubleClick);
		%feature("compactdefaultargs") IsForcedHilight;
		%feature("autodoc", "	* returns True. This owner will always call method Hilight for its Selectable Object when the owner is detected.

	:rtype: bool
") IsForcedHilight;
		Standard_Boolean IsForcedHilight ();
		%feature("compactdefaultargs") MainOrientation;
		%feature("autodoc", "	* Return new orientation to set.

	:rtype: V3d_TypeOfOrientation
") MainOrientation;
		V3d_TypeOfOrientation MainOrientation ();
};


%extend AIS_ViewCubeOwner {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor AIS_ViewInputBuffer;
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
		NCollection_Sequence<Aspect_ScrollDelta> ZoomActions;
		_orientation Orientation;
		_highlighting MoveTo;
		_selection Selection;
		_panningParams Panning;
		_draggingParams Dragging;
		_orbitRotation OrbitRotation;
		_viewRotation ViewRotation;
		_zrotateParams ZRotate;
		%feature("compactdefaultargs") AIS_ViewInputBuffer;
		%feature("autodoc", "	:rtype: None
") AIS_ViewInputBuffer;
		 AIS_ViewInputBuffer ();
		%feature("compactdefaultargs") Reset;
		%feature("autodoc", "	* Reset events buffer.

	:rtype: None
") Reset;
		void Reset ();
};


%extend AIS_ViewInputBuffer {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor AIS_WalkDelta;
class AIS_WalkDelta {
	public:
		%feature("compactdefaultargs") AIS_WalkDelta;
		%feature("autodoc", "	* Empty constructor.

	:rtype: None
") AIS_WalkDelta;
		 AIS_WalkDelta ();
		%feature("compactdefaultargs") IsCrouching;
		%feature("autodoc", "	* Return crouching state.

	:rtype: bool
") IsCrouching;
		bool IsCrouching ();
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "	* Return True when both Rotation and Translation deltas are empty.

	:rtype: bool
") IsEmpty;
		bool IsEmpty ();
		%feature("compactdefaultargs") IsJumping;
		%feature("autodoc", "	* Return jumping state.

	:rtype: bool
") IsJumping;
		bool IsJumping ();
		%feature("compactdefaultargs") IsRunning;
		%feature("autodoc", "	* Return running state.

	:rtype: bool
") IsRunning;
		bool IsRunning ();
		%feature("compactdefaultargs") SetCrouching;
		%feature("autodoc", "	* Set crouching state.

	:param theIsCrouching:
	:type theIsCrouching: bool
	:rtype: None
") SetCrouching;
		void SetCrouching (bool theIsCrouching);
		%feature("compactdefaultargs") SetJumping;
		%feature("autodoc", "	* Set jumping state.

	:param theIsJumping:
	:type theIsJumping: bool
	:rtype: None
") SetJumping;
		void SetJumping (bool theIsJumping);
		%feature("compactdefaultargs") SetRunning;
		%feature("autodoc", "	* Set running state.

	:param theIsRunning:
	:type theIsRunning: bool
	:rtype: None
") SetRunning;
		void SetRunning (bool theIsRunning);
		%feature("compactdefaultargs") ToMove;
		%feature("autodoc", "	* Return True if translation delta is defined.

	:rtype: bool
") ToMove;
		bool ToMove ();
		%feature("compactdefaultargs") ToRotate;
		%feature("autodoc", "	* Return True if rotation delta is defined.

	:rtype: bool
") ToRotate;
		bool ToRotate ();
};


%extend AIS_WalkDelta {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor AIS_WalkPart;
class AIS_WalkPart {
	public:
		float Value;
		float Pressure;
		float Duration;
		%feature("compactdefaultargs") AIS_WalkPart;
		%feature("autodoc", "	* Empty constructor.

	:rtype: None
") AIS_WalkPart;
		 AIS_WalkPart ();
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "	* //!< duration Return True if delta is empty.

	:rtype: bool
") IsEmpty;
		bool IsEmpty ();
};


%extend AIS_WalkPart {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor AIS_AnimationCamera;
class AIS_AnimationCamera : public AIS_Animation {
	public:
		%feature("compactdefaultargs") AIS_AnimationCamera;
		%feature("autodoc", "	* Main constructor.

	:param theAnimationName:
	:type theAnimationName: TCollection_AsciiString &
	:param theView:
	:type theView: opencascade::handle<V3d_View> &
	:rtype: None
") AIS_AnimationCamera;
		 AIS_AnimationCamera (const TCollection_AsciiString & theAnimationName,const opencascade::handle<V3d_View> & theView);
		%feature("compactdefaultargs") CameraEnd;
		%feature("autodoc", "	* Return camera end position.

	:rtype: opencascade::handle<Graphic3d_Camera>
") CameraEnd;
		const opencascade::handle<Graphic3d_Camera> & CameraEnd ();
		%feature("compactdefaultargs") CameraStart;
		%feature("autodoc", "	* Return camera start position.

	:rtype: opencascade::handle<Graphic3d_Camera>
") CameraStart;
		const opencascade::handle<Graphic3d_Camera> & CameraStart ();
		%feature("compactdefaultargs") SetCameraEnd;
		%feature("autodoc", "	* Define camera end position.

	:param theCameraEnd:
	:type theCameraEnd: opencascade::handle<Graphic3d_Camera> &
	:rtype: None
") SetCameraEnd;
		void SetCameraEnd (const opencascade::handle<Graphic3d_Camera> & theCameraEnd);
		%feature("compactdefaultargs") SetCameraStart;
		%feature("autodoc", "	* Define camera start position.

	:param theCameraStart:
	:type theCameraStart: opencascade::handle<Graphic3d_Camera> &
	:rtype: None
") SetCameraStart;
		void SetCameraStart (const opencascade::handle<Graphic3d_Camera> & theCameraStart);
		%feature("compactdefaultargs") SetView;
		%feature("autodoc", "	* Set target view.

	:param theView:
	:type theView: opencascade::handle<V3d_View> &
	:rtype: None
") SetView;
		void SetView (const opencascade::handle<V3d_View> & theView);
		%feature("compactdefaultargs") View;
		%feature("autodoc", "	* Return the target view.

	:rtype: opencascade::handle<V3d_View>
") View;
		const opencascade::handle<V3d_View> & View ();
};


%make_alias(AIS_AnimationCamera)

%extend AIS_AnimationCamera {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor AIS_AnimationObject;
class AIS_AnimationObject : public AIS_Animation {
	public:
		%feature("compactdefaultargs") AIS_AnimationObject;
		%feature("autodoc", "	* Constructor with initialization. Note that start/end transformations specify exactly local transformation of the object, not the transformation to be applied to existing local transformation. @param theAnimationName animation identifier @param theContext interactive context where object have been displayed @param theObject object to apply local transformation @param theTrsfStart local transformation at the start of animation (e.g. theObject->LocalTransformation()) @param theTrsfEnd local transformation at the end of animation

	:param theAnimationName:
	:type theAnimationName: TCollection_AsciiString &
	:param theContext:
	:type theContext: opencascade::handle<AIS_InteractiveContext> &
	:param theObject:
	:type theObject: opencascade::handle<AIS_InteractiveObject> &
	:param theTrsfStart:
	:type theTrsfStart: gp_Trsf
	:param theTrsfEnd:
	:type theTrsfEnd: gp_Trsf
	:rtype: None
") AIS_AnimationObject;
		 AIS_AnimationObject (const TCollection_AsciiString & theAnimationName,const opencascade::handle<AIS_InteractiveContext> & theContext,const opencascade::handle<AIS_InteractiveObject> & theObject,const gp_Trsf & theTrsfStart,const gp_Trsf & theTrsfEnd);
};


%make_alias(AIS_AnimationObject)

%extend AIS_AnimationObject {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor AIS_CameraFrustum;
class AIS_CameraFrustum : public AIS_InteractiveObject {
	public:
/* public enums */
enum SelectionMode {
	SelectionMode_Edges = 0,
	SelectionMode_Volume = 1,
};

/* end public enums declaration */

		%feature("compactdefaultargs") AIS_CameraFrustum;
		%feature("autodoc", "	* Constructs camera frustum with default configuration.

	:rtype: None
") AIS_CameraFrustum;
		 AIS_CameraFrustum ();
		%feature("compactdefaultargs") AcceptDisplayMode;
		%feature("autodoc", "	* Return true if specified display mode is supported.

	:param theMode:
	:type theMode: int
	:rtype: bool
") AcceptDisplayMode;
		virtual Standard_Boolean AcceptDisplayMode (const Standard_Integer theMode);
		%feature("compactdefaultargs") SetCameraFrustum;
		%feature("autodoc", "	* Sets camera frustum.

	:param theCamera:
	:type theCamera: opencascade::handle<Graphic3d_Camera> &
	:rtype: None
") SetCameraFrustum;
		void SetCameraFrustum (const opencascade::handle<Graphic3d_Camera> & theCamera);
		%feature("compactdefaultargs") SetColor;
		%feature("autodoc", "	* Setup custom color.

	:param theColor:
	:type theColor: Quantity_Color &
	:rtype: void
") SetColor;
		virtual void SetColor (const Quantity_Color & theColor);
		%feature("compactdefaultargs") UnsetColor;
		%feature("autodoc", "	* Restore default color.

	:rtype: void
") UnsetColor;
		virtual void UnsetColor ();
		%feature("compactdefaultargs") UnsetTransparency;
		%feature("autodoc", "	* Restore transparency setting.

	:rtype: void
") UnsetTransparency;
		virtual void UnsetTransparency ();
};


%extend AIS_CameraFrustum {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor AIS_Circle;
class AIS_Circle : public AIS_InteractiveObject {
	public:
		%feature("compactdefaultargs") AIS_Circle;
		%feature("autodoc", "	* Initializes this algorithm for constructing AIS circle datums initializes the circle aCircle

	:param aCircle:
	:type aCircle: opencascade::handle<Geom_Circle> &
	:rtype: None
") AIS_Circle;
		 AIS_Circle (const opencascade::handle<Geom_Circle> & aCircle);
		%feature("compactdefaultargs") AIS_Circle;
		%feature("autodoc", "	* Initializes this algorithm for constructing AIS circle datums. Initializes the circle theCircle, the arc starting point theUStart, the arc ending point theUEnd, and the type of sensitivity theIsFilledCircleSens.

	:param theCircle:
	:type theCircle: opencascade::handle<Geom_Circle> &
	:param theUStart:
	:type theUStart: float
	:param theUEnd:
	:type theUEnd: float
	:param theIsFilledCircleSens: default value is Standard_False
	:type theIsFilledCircleSens: bool
	:rtype: None
") AIS_Circle;
		 AIS_Circle (const opencascade::handle<Geom_Circle> & theCircle,const Standard_Real theUStart,const Standard_Real theUEnd,const Standard_Boolean theIsFilledCircleSens = Standard_False);
		%feature("compactdefaultargs") Circle;
		%feature("autodoc", "	* Returns the circle component defined in SetCircle.

	:rtype: opencascade::handle<Geom_Circle>
") Circle;
		const opencascade::handle<Geom_Circle> & Circle ();
		%feature("compactdefaultargs") Compute;
		%feature("autodoc", "	* computes the presentation according to a point of view given by <aProjector>. To be Used when the associated degenerated Presentations have been transformed by <aTrsf> which is not a Pure Translation. The HLR Prs can't be deducted automatically WARNING :<aTrsf> must be applied to the object to display before computation !!!

	:param aProjector:
	:type aProjector: opencascade::handle<Prs3d_Projector> &
	:param aTrsf:
	:type aTrsf: opencascade::handle<Geom_Transformation> &
	:param aPresentation:
	:type aPresentation: opencascade::handle<Prs3d_Presentation> &
	:rtype: void
") Compute;
		virtual void Compute (const opencascade::handle<Prs3d_Projector> & aProjector,const opencascade::handle<Geom_Transformation> & aTrsf,const opencascade::handle<Prs3d_Presentation> & aPresentation);
		%feature("compactdefaultargs") IsFilledCircleSens;
		%feature("autodoc", "	* Returns the type of sensitivity for the circle;

	:rtype: bool
") IsFilledCircleSens;
		Standard_Boolean IsFilledCircleSens ();
		%feature("compactdefaultargs") Parameters;
		%feature("autodoc", "	* Constructs instances of the starting point and the end point parameters, theU1 and theU2.

	:param theU1:
	:type theU1: float &
	:param theU2:
	:type theU2: float &
	:rtype: None
") Parameters;
		void Parameters (Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") SetCircle;
		%feature("autodoc", "	* Allows you to provide settings for the circle datum aCircle.

	:param theCircle:
	:type theCircle: opencascade::handle<Geom_Circle> &
	:rtype: None
") SetCircle;
		void SetCircle (const opencascade::handle<Geom_Circle> & theCircle);
		%feature("compactdefaultargs") SetColor;
		%feature("autodoc", "	:param aColor:
	:type aColor: Quantity_Color &
	:rtype: None
") SetColor;
		void SetColor (const Quantity_Color & aColor);
		%feature("compactdefaultargs") SetFilledCircleSens;
		%feature("autodoc", "	* Sets the type of sensitivity for the circle. If theIsFilledCircleSens set to Standard_True then the whole circle will be detectable, otherwise only the boundary of the circle.

	:param theIsFilledCircleSens:
	:type theIsFilledCircleSens: bool
	:rtype: None
") SetFilledCircleSens;
		void SetFilledCircleSens (const Standard_Boolean theIsFilledCircleSens);
		%feature("compactdefaultargs") SetFirstParam;
		%feature("autodoc", "	* Allows you to set the parameter theU for the starting point of an arc.

	:param theU:
	:type theU: float
	:rtype: None
") SetFirstParam;
		void SetFirstParam (const Standard_Real theU);
		%feature("compactdefaultargs") SetLastParam;
		%feature("autodoc", "	* Allows you to provide the parameter theU for the end point of an arc.

	:param theU:
	:type theU: float
	:rtype: None
") SetLastParam;
		void SetLastParam (const Standard_Real theU);
		%feature("compactdefaultargs") SetWidth;
		%feature("autodoc", "	* Assigns the width aValue to the solid line boundary of the circle datum.

	:param aValue:
	:type aValue: float
	:rtype: None
") SetWidth;
		void SetWidth (const Standard_Real aValue);
		%feature("compactdefaultargs") Signature;
		%feature("autodoc", "	* Returns index 6 by default.

	:rtype: int
") Signature;
		Standard_Integer Signature ();
		%feature("compactdefaultargs") Type;
		%feature("autodoc", "	* Indicates that the type of Interactive Object is a datum.

	:rtype: AIS_KindOfInteractive
") Type;
		AIS_KindOfInteractive Type ();
		%feature("compactdefaultargs") UnsetColor;
		%feature("autodoc", "	* Removes color from the solid line boundary of the circle datum.

	:rtype: None
") UnsetColor;
		void UnsetColor ();
		%feature("compactdefaultargs") UnsetWidth;
		%feature("autodoc", "	* Removes width settings from the solid line boundary of the circle datum.

	:rtype: None
") UnsetWidth;
		void UnsetWidth ();
};


%make_alias(AIS_Circle)

%extend AIS_Circle {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor AIS_ColorScale;
class AIS_ColorScale : public AIS_InteractiveObject {
	public:
		%feature("compactdefaultargs") AIS_ColorScale;
		%feature("autodoc", "	* Default constructor.

	:rtype: None
") AIS_ColorScale;
		 AIS_ColorScale ();
		%feature("compactdefaultargs") AcceptDisplayMode;
		%feature("autodoc", "	* Return true if specified display mode is supported.

	:param theMode:
	:type theMode: int
	:rtype: bool
") AcceptDisplayMode;
		Standard_Boolean AcceptDisplayMode (const Standard_Integer theMode);
		%feature("compactdefaultargs") ColorRange;
		%feature("autodoc", "	* Returns color range corresponding to minimum and maximum values, blue to red by default.

	:param theMinColor:
	:type theMinColor: Quantity_Color &
	:param theMaxColor:
	:type theMaxColor: Quantity_Color &
	:rtype: None
") ColorRange;
		void ColorRange (Quantity_Color & theMinColor,Quantity_Color & theMaxColor);
		%feature("compactdefaultargs") Compute;
		%feature("autodoc", "	* Compute presentation.

	:param thePresentationManager:
	:type thePresentationManager: opencascade::handle<PrsMgr_PresentationManager3d> &
	:param thePresentation:
	:type thePresentation: opencascade::handle<Prs3d_Presentation> &
	:param theMode:
	:type theMode: int
	:rtype: void
") Compute;
		virtual void Compute (const opencascade::handle<PrsMgr_PresentationManager3d> & thePresentationManager,const opencascade::handle<Prs3d_Presentation> & thePresentation,const Standard_Integer theMode);
		%feature("compactdefaultargs") ComputeSelection;
		%feature("autodoc", "	* Compute selection - not implemented for color scale.

	:param &:
	:type &: opencascade::handle<SelectMgr_Selection>
	:param Standard_Integer:
	:type Standard_Integer: 
	:rtype: None
") ComputeSelection;
		void ComputeSelection (const opencascade::handle<SelectMgr_Selection> &,const Standard_Integer);
		%feature("compactdefaultargs") FindColor;
		%feature("autodoc", "	* Calculate color according passed value; returns true if value is in range or false, if isn't

	:param theValue:
	:type theValue: float
	:param theMin:
	:type theMin: float
	:param theMax:
	:type theMax: float
	:param theColorsCount:
	:type theColorsCount: int
	:param theColorHlsMin:
	:type theColorHlsMin: Graphic3d_Vec3d &
	:param theColorHlsMax:
	:type theColorHlsMax: Graphic3d_Vec3d &
	:param theColor:
	:type theColor: Quantity_Color &
	:rtype: bool
") FindColor;
		static Standard_Boolean FindColor (const Standard_Real theValue,const Standard_Real theMin,const Standard_Real theMax,const Standard_Integer theColorsCount,const Graphic3d_Vec3d & theColorHlsMin,const Graphic3d_Vec3d & theColorHlsMax,Quantity_Color & theColor);
		%feature("compactdefaultargs") FindColor;
		%feature("autodoc", "	* Calculate color according passed value; returns true if value is in range or false, if isn't

	:param theValue:
	:type theValue: float
	:param theMin:
	:type theMin: float
	:param theMax:
	:type theMax: float
	:param theColorsCount:
	:type theColorsCount: int
	:param theColor:
	:type theColor: Quantity_Color &
	:rtype: bool
") FindColor;
		static Standard_Boolean FindColor (const Standard_Real theValue,const Standard_Real theMin,const Standard_Real theMax,const Standard_Integer theColorsCount,Quantity_Color & theColor);
		%feature("compactdefaultargs") FindColor;
		%feature("autodoc", "	* Calculate color according passed value; returns true if value is in range or false, if isn't

	:param theValue:
	:type theValue: float
	:param theColor:
	:type theColor: Quantity_Color &
	:rtype: bool
") FindColor;
		Standard_Boolean FindColor (const Standard_Real theValue,Quantity_Color & theColor);
		%feature("compactdefaultargs") Format;
		%feature("autodoc", "	* Returns the format of text.

	:rtype: TCollection_AsciiString
") Format;
		const TCollection_AsciiString & Format ();
		%feature("compactdefaultargs") GetBreadth;
		%feature("autodoc", "	* Returns the breadth of color bar, 0 by default (e.g. should be set by user explicitly before displaying).

	:rtype: int
") GetBreadth;
		Standard_Integer GetBreadth ();
		%feature("compactdefaultargs") GetColorType;
		%feature("autodoc", "	* Returns the type of colors, Aspect_TOCSD_AUTO by default. Aspect_TOCSD_AUTO - value between Red and Blue Aspect_TOCSD_USER - user specified color from color map

	:rtype: Aspect_TypeOfColorScaleData
") GetColorType;
		Aspect_TypeOfColorScaleData GetColorType ();
		%feature("compactdefaultargs") GetColors;
		%feature("autodoc", "	* Returns the user specified colors.

	:param theColors:
	:type theColors: Aspect_SequenceOfColor &
	:rtype: None
") GetColors;
		void GetColors (Aspect_SequenceOfColor & theColors);
		%feature("compactdefaultargs") GetColors;
		%feature("autodoc", "	* Returns the user specified colors.

	:rtype: Aspect_SequenceOfColor
") GetColors;
		const Aspect_SequenceOfColor & GetColors ();
		%feature("compactdefaultargs") GetFormat;
		%feature("autodoc", "	* Returns the format for numbers, '%.4g' by default. The same like format for function printf(). Used if GetLabelType() is TOCSD_AUTO;

	:rtype: TCollection_AsciiString
") GetFormat;
		const TCollection_AsciiString & GetFormat ();
		%feature("compactdefaultargs") GetHeight;
		%feature("autodoc", "	* Returns the height of color bar, 0 by default (e.g. should be set by user explicitly before displaying).

	:rtype: int
") GetHeight;
		Standard_Integer GetHeight ();
		%feature("compactdefaultargs") GetIntervalColor;
		%feature("autodoc", "	* Returns the user specified color from color map with index (starts at 1). Returns default color if index is out of range in color map.

	:param theIndex:
	:type theIndex: int
	:rtype: Quantity_Color
") GetIntervalColor;
		Quantity_Color GetIntervalColor (const Standard_Integer theIndex);
		%feature("compactdefaultargs") GetLabel;
		%feature("autodoc", "	* Returns the user specified label with index theIndex. Index is in range from 1 to GetNumberOfIntervals() or to GetNumberOfIntervals() + 1 if IsLabelAtBorder() is true. Returns empty string if label not defined.

	:param theIndex:
	:type theIndex: int
	:rtype: TCollection_ExtendedString
") GetLabel;
		TCollection_ExtendedString GetLabel (const Standard_Integer theIndex);
		%feature("compactdefaultargs") GetLabelPosition;
		%feature("autodoc", "	* Returns the position of labels concerning color filled rectangles, Aspect_TOCSP_RIGHT by default.

	:rtype: Aspect_TypeOfColorScalePosition
") GetLabelPosition;
		Aspect_TypeOfColorScalePosition GetLabelPosition ();
		%feature("compactdefaultargs") GetLabelType;
		%feature("autodoc", "	* Returns the type of labels, Aspect_TOCSD_AUTO by default. Aspect_TOCSD_AUTO - labels as boundary values for intervals Aspect_TOCSD_USER - user specified label is used

	:rtype: Aspect_TypeOfColorScaleData
") GetLabelType;
		Aspect_TypeOfColorScaleData GetLabelType ();
		%feature("compactdefaultargs") GetLabels;
		%feature("autodoc", "	* Returns the user specified labels.

	:param theLabels:
	:type theLabels: TColStd_SequenceOfExtendedString &
	:rtype: None
") GetLabels;
		void GetLabels (TColStd_SequenceOfExtendedString & theLabels);
		%feature("compactdefaultargs") GetMax;
		%feature("autodoc", "	* Returns maximal value of color scale, 1.0 by default.

	:rtype: float
") GetMax;
		Standard_Real GetMax ();
		%feature("compactdefaultargs") GetMin;
		%feature("autodoc", "	* Returns minimal value of color scale, 0.0 by default.

	:rtype: float
") GetMin;
		Standard_Real GetMin ();
		%feature("compactdefaultargs") GetNumberOfIntervals;
		%feature("autodoc", "	* Returns the number of color scale intervals, 10 by default.

	:rtype: int
") GetNumberOfIntervals;
		Standard_Integer GetNumberOfIntervals ();
		%feature("compactdefaultargs") GetPosition;
		%feature("autodoc", "	* Returns the bottom-left position of color scale, 0x0 by default.

	:param theX:
	:type theX: float &
	:param theY:
	:type theY: float &
	:rtype: None
") GetPosition;
		void GetPosition (Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") GetRange;
		%feature("autodoc", "	* Returns minimal and maximal values of color scale, 0.0 to 1.0 by default.

	:param theMin:
	:type theMin: float &
	:param theMax:
	:type theMax: float &
	:rtype: None
") GetRange;
		void GetRange (Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") GetSize;
		%feature("autodoc", "	* Returns the size of color bar, 0 and 0 by default (e.g. should be set by user explicitly before displaying).

	:param theBreadth:
	:type theBreadth: int &
	:param theHeight:
	:type theHeight: int &
	:rtype: None
") GetSize;
		void GetSize (Standard_Integer &OutValue,Standard_Integer &OutValue);
		%feature("compactdefaultargs") GetTextHeight;
		%feature("autodoc", "	* Returns the font height of text labels, 20 by default.

	:rtype: int
") GetTextHeight;
		Standard_Integer GetTextHeight ();
		%feature("compactdefaultargs") GetTitle;
		%feature("autodoc", "	* Returns the color scale title string, empty string by default.

	:rtype: TCollection_ExtendedString
") GetTitle;
		const TCollection_ExtendedString & GetTitle ();
		%feature("compactdefaultargs") GetTitlePosition;
		%feature("autodoc", "	* Returns the position of color scale title, Aspect_TOCSP_LEFT by default.

	:rtype: Aspect_TypeOfColorScalePosition
") GetTitlePosition;
		Aspect_TypeOfColorScalePosition GetTitlePosition ();
		%feature("compactdefaultargs") GetXPosition;
		%feature("autodoc", "	* Returns the left position of color scale, 0 by default.

	:rtype: int
") GetXPosition;
		Standard_Integer GetXPosition ();
		%feature("compactdefaultargs") GetYPosition;
		%feature("autodoc", "	* Returns the bottom position of color scale, 0 by default.

	:rtype: int
") GetYPosition;
		Standard_Integer GetYPosition ();
		%feature("compactdefaultargs") HueMax;
		%feature("autodoc", "	* Returns the hue angle corresponding to maximum value, 0 by default (red).

	:rtype: float
") HueMax;
		Standard_Real HueMax ();
		%feature("compactdefaultargs") HueMin;
		%feature("autodoc", "	* Returns the hue angle corresponding to minimum value, 230 by default (blue).

	:rtype: float
") HueMin;
		Standard_Real HueMin ();
		%feature("compactdefaultargs") HueRange;
		%feature("autodoc", "	* Returns the hue angle range corresponding to minimum and maximum values, 230 to 0 by default (blue to red).

	:param theMinAngle:
	:type theMinAngle: float &
	:param theMaxAngle:
	:type theMaxAngle: float &
	:rtype: None
") HueRange;
		void HueRange (Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") IsLabelAtBorder;
		%feature("autodoc", "	* Returns True if the labels are placed at border of color intervals, True by default. The automatically generated label will show value exactly on the current position: - value connecting two neighbor intervals (True) - value in the middle of interval (False)

	:rtype: bool
") IsLabelAtBorder;
		Standard_Boolean IsLabelAtBorder ();
		%feature("compactdefaultargs") IsLogarithmic;
		%feature("autodoc", "	* Returns True if the color scale has logarithmic intervals, False by default.

	:rtype: bool
") IsLogarithmic;
		Standard_Boolean IsLogarithmic ();
		%feature("compactdefaultargs") IsReversed;
		%feature("autodoc", "	* Returns True if the labels and colors used in reversed order, False by default. - Normal, bottom-up order with Minimal value on the Bottom and Maximum value on Top. - Reversed, top-down order with Maximum value on the Bottom and Minimum value on Top.

	:rtype: bool
") IsReversed;
		Standard_Boolean IsReversed ();
		%feature("compactdefaultargs") IsSmoothTransition;
		%feature("autodoc", "	* Return True if color transition between neighbor intervals should be linearly interpolated, False by default.

	:rtype: bool
") IsSmoothTransition;
		Standard_Boolean IsSmoothTransition ();
		%feature("compactdefaultargs") Labels;
		%feature("autodoc", "	* Returns the user specified labels.

	:rtype: TColStd_SequenceOfExtendedString
") Labels;
		const TColStd_SequenceOfExtendedString & Labels ();
		%feature("compactdefaultargs") SetBreadth;
		%feature("autodoc", "	* Sets the width of color bar.

	:param theBreadth:
	:type theBreadth: int
	:rtype: None
") SetBreadth;
		void SetBreadth (const Standard_Integer theBreadth);
		%feature("compactdefaultargs") SetColorRange;
		%feature("autodoc", "	* Sets color range corresponding to minimum and maximum values.

	:param theMinColor:
	:type theMinColor: Quantity_Color &
	:param theMaxColor:
	:type theMaxColor: Quantity_Color &
	:rtype: None
") SetColorRange;
		void SetColorRange (const Quantity_Color & theMinColor,const Quantity_Color & theMaxColor);
		%feature("compactdefaultargs") SetColorType;
		%feature("autodoc", "	* Sets the type of colors. Aspect_TOCSD_AUTO - value between Red and Blue Aspect_TOCSD_USER - user specified color from color map

	:param theType:
	:type theType: Aspect_TypeOfColorScaleData
	:rtype: None
") SetColorType;
		void SetColorType (const Aspect_TypeOfColorScaleData theType);
		%feature("compactdefaultargs") SetColors;
		%feature("autodoc", "	* Sets the color scale colors. The length of the sequence should be equal to GetNumberOfIntervals().

	:param theSeq:
	:type theSeq: Aspect_SequenceOfColor &
	:rtype: None
") SetColors;
		void SetColors (const Aspect_SequenceOfColor & theSeq);
		%feature("compactdefaultargs") SetFormat;
		%feature("autodoc", "	* Sets the color scale auto label format specification.

	:param theFormat:
	:type theFormat: TCollection_AsciiString &
	:rtype: None
") SetFormat;
		void SetFormat (const TCollection_AsciiString & theFormat);
		%feature("compactdefaultargs") SetHeight;
		%feature("autodoc", "	* Sets the height of color bar.

	:param theHeight:
	:type theHeight: int
	:rtype: None
") SetHeight;
		void SetHeight (const Standard_Integer theHeight);
		%feature("compactdefaultargs") SetHueRange;
		%feature("autodoc", "	* Sets hue angle range corresponding to minimum and maximum values. The valid angle range is [0, 360], see Quantity_Color and Quantity_TOC_HLS for more details.

	:param theMinAngle:
	:type theMinAngle: float
	:param theMaxAngle:
	:type theMaxAngle: float
	:rtype: None
") SetHueRange;
		void SetHueRange (const Standard_Real theMinAngle,const Standard_Real theMaxAngle);
		%feature("compactdefaultargs") SetIntervalColor;
		%feature("autodoc", "	* Sets the color of the specified interval. Note that list is automatically resized to include specified index. @param theColor color value to set @param theIndex index in range [1, GetNumberOfIntervals()];  appended to the end of list if -1 is specified

	:param theColor:
	:type theColor: Quantity_Color &
	:param theIndex:
	:type theIndex: int
	:rtype: None
") SetIntervalColor;
		void SetIntervalColor (const Quantity_Color & theColor,const Standard_Integer theIndex);
		%feature("compactdefaultargs") SetLabel;
		%feature("autodoc", "	* Sets the color scale label at index. Note that list is automatically resized to include specified index. @param theLabel new label text @param theIndex index in range [1, GetNumberOfIntervals()] or [1, GetNumberOfIntervals() + 1] if IsLabelAtBorder() is true;  label is appended to the end of list if negative index is specified

	:param theLabel:
	:type theLabel: TCollection_ExtendedString &
	:param theIndex:
	:type theIndex: int
	:rtype: None
") SetLabel;
		void SetLabel (const TCollection_ExtendedString & theLabel,const Standard_Integer theIndex);
		%feature("compactdefaultargs") SetLabelAtBorder;
		%feature("autodoc", "	* Sets true if the labels are placed at border of color intervals (True by default). If set to False, labels will be drawn at color intervals rather than at borders.

	:param theOn:
	:type theOn: bool
	:rtype: None
") SetLabelAtBorder;
		void SetLabelAtBorder (const Standard_Boolean theOn);
		%feature("compactdefaultargs") SetLabelPosition;
		%feature("autodoc", "	* Sets the color scale labels position relative to color bar.

	:param thePos:
	:type thePos: Aspect_TypeOfColorScalePosition
	:rtype: None
") SetLabelPosition;
		void SetLabelPosition (const Aspect_TypeOfColorScalePosition thePos);
		%feature("compactdefaultargs") SetLabelType;
		%feature("autodoc", "	* Sets the type of labels. Aspect_TOCSD_AUTO - labels as boundary values for intervals Aspect_TOCSD_USER - user specified label is used

	:param theType:
	:type theType: Aspect_TypeOfColorScaleData
	:rtype: None
") SetLabelType;
		void SetLabelType (const Aspect_TypeOfColorScaleData theType);
		%feature("compactdefaultargs") SetLabels;
		%feature("autodoc", "	* Sets the color scale labels. The length of the sequence should be equal to GetNumberOfIntervals() or to GetNumberOfIntervals() + 1 if IsLabelAtBorder() is true. If length of the sequence does not much the number of intervals, then these labels will be considered as 'free' and will be located at the virtual intervals corresponding to the number of labels (with flag IsLabelAtBorder() having the same effect as in normal case).

	:param theSeq:
	:type theSeq: TColStd_SequenceOfExtendedString &
	:rtype: None
") SetLabels;
		void SetLabels (const TColStd_SequenceOfExtendedString & theSeq);
		%feature("compactdefaultargs") SetLogarithmic;
		%feature("autodoc", "	* Sets true if the color scale has logarithmic intervals.

	:param isLogarithmic:
	:type isLogarithmic: bool
	:rtype: None
") SetLogarithmic;
		void SetLogarithmic (const Standard_Boolean isLogarithmic);
		%feature("compactdefaultargs") SetMax;
		%feature("autodoc", "	* Sets the maximal value of color scale.

	:param theMax:
	:type theMax: float
	:rtype: None
") SetMax;
		void SetMax (const Standard_Real theMax);
		%feature("compactdefaultargs") SetMin;
		%feature("autodoc", "	* Sets the minimal value of color scale.

	:param theMin:
	:type theMin: float
	:rtype: None
") SetMin;
		void SetMin (const Standard_Real theMin);
		%feature("compactdefaultargs") SetNumberOfIntervals;
		%feature("autodoc", "	* Sets the number of color scale intervals.

	:param theNum:
	:type theNum: int
	:rtype: None
") SetNumberOfIntervals;
		void SetNumberOfIntervals (const Standard_Integer theNum);
		%feature("compactdefaultargs") SetPosition;
		%feature("autodoc", "	* Sets the position of color scale.

	:param theX:
	:type theX: int
	:param theY:
	:type theY: int
	:rtype: None
") SetPosition;
		void SetPosition (const Standard_Integer theX,const Standard_Integer theY);
		%feature("compactdefaultargs") SetRange;
		%feature("autodoc", "	* Sets the minimal and maximal value of color scale. Note that values order will be ignored - the minimum and maximum values will be swapped if needed. ::SetReversed() should be called to swap displaying order.

	:param theMin:
	:type theMin: float
	:param theMax:
	:type theMax: float
	:rtype: None
") SetRange;
		void SetRange (const Standard_Real theMin,const Standard_Real theMax);
		%feature("compactdefaultargs") SetReversed;
		%feature("autodoc", "	* Sets true if the labels and colors used in reversed order.

	:param theReverse:
	:type theReverse: bool
	:rtype: None
") SetReversed;
		void SetReversed (const Standard_Boolean theReverse);
		%feature("compactdefaultargs") SetSize;
		%feature("autodoc", "	* Sets the size of color bar.

	:param theBreadth:
	:type theBreadth: int
	:param theHeight:
	:type theHeight: int
	:rtype: None
") SetSize;
		void SetSize (const Standard_Integer theBreadth,const Standard_Integer theHeight);
		%feature("compactdefaultargs") SetSmoothTransition;
		%feature("autodoc", "	* Setup smooth color transition.

	:param theIsSmooth:
	:type theIsSmooth: bool
	:rtype: None
") SetSmoothTransition;
		void SetSmoothTransition (const Standard_Boolean theIsSmooth);
		%feature("compactdefaultargs") SetTextHeight;
		%feature("autodoc", "	* Sets the height of text of color scale.

	:param theHeight:
	:type theHeight: int
	:rtype: None
") SetTextHeight;
		void SetTextHeight (const Standard_Integer theHeight);
		%feature("compactdefaultargs") SetTitle;
		%feature("autodoc", "	* Sets the color scale title string.

	:param theTitle:
	:type theTitle: TCollection_ExtendedString &
	:rtype: None
") SetTitle;
		void SetTitle (const TCollection_ExtendedString & theTitle);
		%feature("compactdefaultargs") SetTitlePosition;
		%feature("autodoc", "	* Sets the color scale title position.

	:param thePos:
	:type thePos: Aspect_TypeOfColorScalePosition
	:rtype: None
") SetTitlePosition;
		void SetTitlePosition (const Aspect_TypeOfColorScalePosition thePos);
		%feature("compactdefaultargs") SetXPosition;
		%feature("autodoc", "	* Sets the left position of color scale.

	:param theX:
	:type theX: int
	:rtype: None
") SetXPosition;
		void SetXPosition (const Standard_Integer theX);
		%feature("compactdefaultargs") SetYPosition;
		%feature("autodoc", "	* Sets the bottom position of color scale.

	:param theY:
	:type theY: int
	:rtype: None
") SetYPosition;
		void SetYPosition (const Standard_Integer theY);
		%feature("compactdefaultargs") TextHeight;
		%feature("autodoc", "	* Returns the height of text. @param theText [in] the text of which to calculate height.

	:param theText:
	:type theText: TCollection_ExtendedString &
	:rtype: int
") TextHeight;
		Standard_Integer TextHeight (const TCollection_ExtendedString & theText);
		%feature("compactdefaultargs") TextSize;
		%feature("autodoc", "	:param theText:
	:type theText: TCollection_ExtendedString &
	:param theHeight:
	:type theHeight: int
	:param theWidth:
	:type theWidth: int &
	:param theAscent:
	:type theAscent: int &
	:param theDescent:
	:type theDescent: int &
	:rtype: None
") TextSize;
		void TextSize (const TCollection_ExtendedString & theText,const Standard_Integer theHeight,Standard_Integer &OutValue,Standard_Integer &OutValue,Standard_Integer &OutValue);
		%feature("compactdefaultargs") TextWidth;
		%feature("autodoc", "	* Returns the width of text. @param theText [in] the text of which to calculate width.

	:param theText:
	:type theText: TCollection_ExtendedString &
	:rtype: int
") TextWidth;
		Standard_Integer TextWidth (const TCollection_ExtendedString & theText);
		%feature("compactdefaultargs") hueToValidRange;
		%feature("autodoc", "	* Shift hue into valid range. Lightness and Saturation should be specified in valid range [0.0, 1.0], however Hue might be given out of Quantity_Color range to specify desired range for interpolation.

	:param theHue:
	:type theHue: float
	:rtype: float
") hueToValidRange;
		static Standard_Real hueToValidRange (const Standard_Real theHue);
};


%make_alias(AIS_ColorScale)

%extend AIS_ColorScale {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor AIS_ConnectedInteractive;
class AIS_ConnectedInteractive : public AIS_InteractiveObject {
	public:
		%feature("compactdefaultargs") AIS_ConnectedInteractive;
		%feature("autodoc", "	* Disconnects the previous view and sets highlight mode to 0. This highlights the wireframe presentation aTypeOfPresentation3d. Top_AllView deactivates hidden line removal.

	:param aTypeOfPresentation3d: default value is PrsMgr_TOP_AllView
	:type aTypeOfPresentation3d: PrsMgr_TypeOfPresentation3d
	:rtype: None
") AIS_ConnectedInteractive;
		 AIS_ConnectedInteractive (const PrsMgr_TypeOfPresentation3d aTypeOfPresentation3d = PrsMgr_TOP_AllView);
		%feature("compactdefaultargs") AcceptDisplayMode;
		%feature("autodoc", "	* Return true if reference presentation accepts specified display mode.

	:param theMode:
	:type theMode: int
	:rtype: bool
") AcceptDisplayMode;
		Standard_Boolean AcceptDisplayMode (const Standard_Integer theMode);
		%feature("compactdefaultargs") AcceptShapeDecomposition;
		%feature("autodoc", "	* Informs the graphic context that the interactive Object may be decomposed into sub-shapes for dynamic selection.

	:rtype: bool
") AcceptShapeDecomposition;
		Standard_Boolean AcceptShapeDecomposition ();
		%feature("compactdefaultargs") Connect;
		%feature("autodoc", "	* Establishes the connection between the Connected Interactive Object, anotherIobj, and its reference.

	:param theAnotherObj:
	:type theAnotherObj: opencascade::handle<AIS_InteractiveObject> &
	:rtype: None
") Connect;
		void Connect (const opencascade::handle<AIS_InteractiveObject> & theAnotherObj);
		%feature("compactdefaultargs") Connect;
		%feature("autodoc", "	* Establishes the connection between the Connected Interactive Object, anotherIobj, and its reference. Locates instance in aLocation.

	:param theAnotherObj:
	:type theAnotherObj: opencascade::handle<AIS_InteractiveObject> &
	:param theLocation:
	:type theLocation: gp_Trsf
	:rtype: None
") Connect;
		void Connect (const opencascade::handle<AIS_InteractiveObject> & theAnotherObj,const gp_Trsf & theLocation);
		%feature("compactdefaultargs") Connect;
		%feature("autodoc", "	* Establishes the connection between the Connected Interactive Object, anotherIobj, and its reference. Locates instance in aLocation.

	:param theAnotherObj:
	:type theAnotherObj: opencascade::handle<AIS_InteractiveObject> &
	:param theLocation:
	:type theLocation: opencascade::handle<Geom_Transformation> &
	:rtype: None
") Connect;
		void Connect (const opencascade::handle<AIS_InteractiveObject> & theAnotherObj,const opencascade::handle<Geom_Transformation> & theLocation);
		%feature("compactdefaultargs") ConnectedTo;
		%feature("autodoc", "	* Returns the connection with the reference Interactive Object.

	:rtype: opencascade::handle<AIS_InteractiveObject>
") ConnectedTo;
		const opencascade::handle<AIS_InteractiveObject> & ConnectedTo ();
		%feature("compactdefaultargs") Disconnect;
		%feature("autodoc", "	* Clears the connection with a source reference. The presentation will no longer be displayed. Warning Must be done before deleting the presentation.

	:rtype: None
") Disconnect;
		void Disconnect ();
		%feature("compactdefaultargs") HasConnection;
		%feature("autodoc", "	* Returns true if there is a connection established between the presentation and its source reference.

	:rtype: bool
") HasConnection;
		Standard_Boolean HasConnection ();
		%feature("compactdefaultargs") Signature;
		%feature("autodoc", "	* Returns 0

	:rtype: int
") Signature;
		Standard_Integer Signature ();
		%feature("compactdefaultargs") Type;
		%feature("autodoc", "	* Returns KOI_Object

	:rtype: AIS_KindOfInteractive
") Type;
		AIS_KindOfInteractive Type ();
};


%make_alias(AIS_ConnectedInteractive)

%extend AIS_ConnectedInteractive {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
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

		%feature("compactdefaultargs") AcceptDisplayMode;
		%feature("autodoc", "	* Returns true if the class of objects accepts the display mode theMode. The interactive context can have a default mode of representation for the set of Interactive Objects. This mode may not be accepted by object.

	:param theMode:
	:type theMode: int
	:rtype: bool
") AcceptDisplayMode;
		Standard_Boolean AcceptDisplayMode (const Standard_Integer theMode);
		%feature("compactdefaultargs") DimensionAspect;
		%feature("autodoc", "	* Gets the dimension aspect from AIS object drawer. Dimension aspect contains aspects of line, text and arrows for dimension presentation.

	:rtype: opencascade::handle<Prs3d_DimensionAspect>
") DimensionAspect;
		opencascade::handle<Prs3d_DimensionAspect> DimensionAspect ();
		%feature("compactdefaultargs") DisplaySpecialSymbol;
		%feature("autodoc", "	* returns dimension special symbol display options.

	:rtype: AIS_DisplaySpecialSymbol
") DisplaySpecialSymbol;
		AIS_DisplaySpecialSymbol DisplaySpecialSymbol ();
		%feature("compactdefaultargs") GetCustomValue;
		%feature("autodoc", "	* Gets user-defined dimension value. returns dimension value string.

	:rtype: TCollection_ExtendedString
") GetCustomValue;
		const TCollection_ExtendedString & GetCustomValue ();
		%feature("compactdefaultargs") GetDisplayUnits;
		%feature("autodoc", "	:rtype: TCollection_AsciiString
") GetDisplayUnits;
		virtual const TCollection_AsciiString & GetDisplayUnits ();
		%feature("compactdefaultargs") GetFlyout;
		%feature("autodoc", "	* returns flyout value for dimension.

	:rtype: float
") GetFlyout;
		Standard_Real GetFlyout ();
		%feature("compactdefaultargs") GetGeometryType;
		%feature("autodoc", "	* Geometry type defines type of shapes on which the dimension is to be built. returns type of geometry on which the dimension will be built.

	:rtype: int
") GetGeometryType;
		Standard_Integer GetGeometryType ();
		%feature("compactdefaultargs") GetModelUnits;
		%feature("autodoc", "	:rtype: TCollection_AsciiString
") GetModelUnits;
		virtual const TCollection_AsciiString & GetModelUnits ();
		%feature("compactdefaultargs") GetPlane;
		%feature("autodoc", "	* Get the dimension plane in which the 2D dimension presentation is computed. By default, if plane is not defined by user, it is computed automatically after dimension geometry is computed. If computed dimension geometry (points) can't be placed on the user-defined plane, dimension geometry was set as invalid (validity flag is set to false) and dimension presentation will not be computed. If user-defined plane allow geometry placement on it, it will be used for computing of the dimension presentation. returns dimension plane used for presentation computing.

	:rtype: gp_Pln
") GetPlane;
		const gp_Pln  GetPlane ();
		%feature("compactdefaultargs") GetTextPosition;
		%feature("autodoc", "	* Computes absolute text position from dimension parameters (flyout, plane and text alignment).

	:rtype: gp_Pnt
") GetTextPosition;
		const gp_Pnt GetTextPosition ();
		%feature("compactdefaultargs") GetValue;
		%feature("autodoc", "	* Gets dimension measurement value. If the value to display is not specified by user, then the dimension object is responsible to compute it on its own in model space coordinates. returns the dimension value (in model units) which is used during display of the presentation.

	:rtype: float
") GetValue;
		Standard_Real GetValue ();
		%feature("compactdefaultargs") IsTextPositionCustom;
		%feature("autodoc", "	* returns True if text position is set by user with method SetTextPosition().

	:rtype: bool
") IsTextPositionCustom;
		Standard_Boolean IsTextPositionCustom ();
		%feature("compactdefaultargs") IsValid;
		%feature("autodoc", "	* Check that the input geometry for dimension is valid and the presentation can be successfully computed. returns True if dimension geometry is ok.

	:rtype: bool
") IsValid;
		Standard_Boolean IsValid ();
		%feature("compactdefaultargs") KindOfDimension;
		%feature("autodoc", "	* returns the kind of dimension.

	:rtype: AIS_KindOfDimension
") KindOfDimension;
		AIS_KindOfDimension KindOfDimension ();
		%feature("compactdefaultargs") SelToleranceForText2d;
		%feature("autodoc", "	* Returns selection tolerance for text2d: For 2d text selection detection sensitive point with tolerance is used Important! Only for 2d text.

	:rtype: float
") SelToleranceForText2d;
		Standard_Real SelToleranceForText2d ();
		%feature("compactdefaultargs") SetComputedValue;
		%feature("autodoc", "	* Sets computed dimension value. Resets custom value mode if it was set.

	:rtype: None
") SetComputedValue;
		void SetComputedValue ();
		%feature("compactdefaultargs") SetCustomPlane;
		%feature("autodoc", "	* Sets user-defined plane where the 2D dimension presentation will be placed. Checks validity of this plane if geometry has been set already. Validity of the plane is checked according to the geometry set and has different criteria for different kinds of dimensions.

	:param thePlane:
	:type thePlane: gp_Pln
	:rtype: void
") SetCustomPlane;
		virtual void SetCustomPlane (const gp_Pln & thePlane);
		%feature("compactdefaultargs") SetCustomValue;
		%feature("autodoc", "	* Sets user-defined dimension value. The user-defined dimension value is specified in model space, and affect by unit conversion during the display. @param theValue [in] the user-defined value to display.

	:param theValue:
	:type theValue: float
	:rtype: None
") SetCustomValue;
		void SetCustomValue (const Standard_Real theValue);
		%feature("compactdefaultargs") SetCustomValue;
		%feature("autodoc", "	* Sets user-defined dimension value. Unit conversion during the display is not applyed. @param theValue [in] the user-defined value to display.

	:param theValue:
	:type theValue: TCollection_ExtendedString &
	:rtype: None
") SetCustomValue;
		void SetCustomValue (const TCollection_ExtendedString & theValue);
		%feature("compactdefaultargs") SetDimensionAspect;
		%feature("autodoc", "	* Sets new dimension aspect for the interactive object drawer. The dimension aspect provides dynamic properties which are generally used during computation of dimension presentations.

	:param theDimensionAspect:
	:type theDimensionAspect: opencascade::handle<Prs3d_DimensionAspect> &
	:rtype: None
") SetDimensionAspect;
		void SetDimensionAspect (const opencascade::handle<Prs3d_DimensionAspect> & theDimensionAspect);
		%feature("compactdefaultargs") SetDisplaySpecialSymbol;
		%feature("autodoc", "	* Specifies whether to display special symbol or not.

	:param theDisplaySpecSymbol:
	:type theDisplaySpecSymbol: AIS_DisplaySpecialSymbol
	:rtype: None
") SetDisplaySpecialSymbol;
		void SetDisplaySpecialSymbol (const AIS_DisplaySpecialSymbol theDisplaySpecSymbol);
		%feature("compactdefaultargs") SetDisplayUnits;
		%feature("autodoc", "	:param &:
	:type &: TCollection_AsciiString
	:rtype: None
") SetDisplayUnits;
		void SetDisplayUnits (const TCollection_AsciiString &);
		%feature("compactdefaultargs") SetFlyout;
		%feature("autodoc", "	* Sets flyout value for dimension.

	:param theFlyout:
	:type theFlyout: float
	:rtype: None
") SetFlyout;
		void SetFlyout (const Standard_Real theFlyout);
		%feature("compactdefaultargs") SetModelUnits;
		%feature("autodoc", "	:param &:
	:type &: TCollection_AsciiString
	:rtype: None
") SetModelUnits;
		void SetModelUnits (const TCollection_AsciiString &);
		%feature("compactdefaultargs") SetSelToleranceForText2d;
		%feature("autodoc", "	* Sets selection tolerance for text2d: For 2d text selection detection sensitive point with tolerance is used to change this tolerance use this method Important! Only for 2d text.

	:param theTol:
	:type theTol: float
	:rtype: None
") SetSelToleranceForText2d;
		void SetSelToleranceForText2d (const Standard_Real theTol);
		%feature("compactdefaultargs") SetSpecialSymbol;
		%feature("autodoc", "	* Specifies special symbol.

	:param theSpecialSymbol:
	:type theSpecialSymbol: Standard_ExtCharacter
	:rtype: None
") SetSpecialSymbol;
		void SetSpecialSymbol (const Standard_ExtCharacter theSpecialSymbol);
		%feature("compactdefaultargs") SetTextPosition;
		%feature("autodoc", "	* Fixes the absolute text position and adjusts flyout, plane and text alignment according to it. Updates presentation if the text position is valid. ATTENTION! It does not change vertical text alignment. @param theTextPos [in] the point of text position.

	:param &:
	:type &: gp_Pnt
	:rtype: None
") SetTextPosition;
		void SetTextPosition (const gp_Pnt &);
		%feature("compactdefaultargs") SpecialSymbol;
		%feature("autodoc", "	* returns special symbol.

	:rtype: Standard_ExtCharacter
") SpecialSymbol;
		Standard_ExtCharacter SpecialSymbol ();
		%feature("compactdefaultargs") Type;
		%feature("autodoc", "	* returns the kind of interactive.

	:rtype: AIS_KindOfInteractive
") Type;
		AIS_KindOfInteractive Type ();
		%feature("compactdefaultargs") UnsetCustomPlane;
		%feature("autodoc", "	* Unsets user-defined plane. Therefore the plane for dimension will be computed automatically.

	:rtype: None
") UnsetCustomPlane;
		void UnsetCustomPlane ();
		%feature("compactdefaultargs") UnsetFixedTextPosition;
		%feature("autodoc", "	* Unsets user defined text positioning and enables text positioning by other parameters: text alignment, extension size, flyout and custom plane.

	:rtype: None
") UnsetFixedTextPosition;
		void UnsetFixedTextPosition ();
};


%make_alias(AIS_Dimension)

%extend AIS_Dimension {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor AIS_Line;
class AIS_Line : public AIS_InteractiveObject {
	public:
		%feature("compactdefaultargs") AIS_Line;
		%feature("autodoc", "	* Initializes the line aLine.

	:param aLine:
	:type aLine: opencascade::handle<Geom_Line> &
	:rtype: None
") AIS_Line;
		 AIS_Line (const opencascade::handle<Geom_Line> & aLine);
		%feature("compactdefaultargs") AIS_Line;
		%feature("autodoc", "	* Initializes a starting point aStartPoint and a finishing point aEndPoint for the line.

	:param aStartPoint:
	:type aStartPoint: opencascade::handle<Geom_Point> &
	:param aEndPoint:
	:type aEndPoint: opencascade::handle<Geom_Point> &
	:rtype: None
") AIS_Line;
		 AIS_Line (const opencascade::handle<Geom_Point> & aStartPoint,const opencascade::handle<Geom_Point> & aEndPoint);
		%feature("compactdefaultargs") Compute;
		%feature("autodoc", "	* computes the presentation according to a point of view given by <aProjector>. To be Used when the associated degenerated Presentations have been transformed by <aTrsf> which is not a Pure Translation. The HLR Prs can't be deducted automatically WARNING :<aTrsf> must be applied to the object to display before computation !!!

	:param aProjector:
	:type aProjector: opencascade::handle<Prs3d_Projector> &
	:param aTrsf:
	:type aTrsf: opencascade::handle<Geom_Transformation> &
	:param aPresentation:
	:type aPresentation: opencascade::handle<Prs3d_Presentation> &
	:rtype: void
") Compute;
		virtual void Compute (const opencascade::handle<Prs3d_Projector> & aProjector,const opencascade::handle<Geom_Transformation> & aTrsf,const opencascade::handle<Prs3d_Presentation> & aPresentation);
		%feature("compactdefaultargs") Line;
		%feature("autodoc", "	* Constructs an infinite line.

	:rtype: opencascade::handle<Geom_Line>
") Line;
		const opencascade::handle<Geom_Line> & Line ();
		%feature("compactdefaultargs") Points;
		%feature("autodoc", "	* Returns the starting point thePStart and the end point thePEnd of the line set by SetPoints.

	:param thePStart:
	:type thePStart: opencascade::handle<Geom_Point> &
	:param thePEnd:
	:type thePEnd: opencascade::handle<Geom_Point> &
	:rtype: None
") Points;
		void Points (opencascade::handle<Geom_Point> & thePStart,opencascade::handle<Geom_Point> & thePEnd);
		%feature("compactdefaultargs") SetColor;
		%feature("autodoc", "	* Provides a new color setting aColor for the line in the drawing tool, or 'Drawer'.

	:param aColor:
	:type aColor: Quantity_Color &
	:rtype: None
") SetColor;
		void SetColor (const Quantity_Color & aColor);
		%feature("compactdefaultargs") SetLine;
		%feature("autodoc", "	* instantiates an infinite line.

	:param theLine:
	:type theLine: opencascade::handle<Geom_Line> &
	:rtype: None
") SetLine;
		void SetLine (const opencascade::handle<Geom_Line> & theLine);
		%feature("compactdefaultargs") SetPoints;
		%feature("autodoc", "	* Sets the starting point thePStart and ending point thePEnd of the infinite line to create a finite line segment.

	:param thePStart:
	:type thePStart: opencascade::handle<Geom_Point> &
	:param thePEnd:
	:type thePEnd: opencascade::handle<Geom_Point> &
	:rtype: None
") SetPoints;
		void SetPoints (const opencascade::handle<Geom_Point> & thePStart,const opencascade::handle<Geom_Point> & thePEnd);
		%feature("compactdefaultargs") SetWidth;
		%feature("autodoc", "	* Provides the new width setting aValue for the line in the drawing tool, or 'Drawer'.

	:param aValue:
	:type aValue: float
	:rtype: None
") SetWidth;
		void SetWidth (const Standard_Real aValue);
		%feature("compactdefaultargs") Signature;
		%feature("autodoc", "	* Returns the signature 5.

	:rtype: int
") Signature;
		Standard_Integer Signature ();
		%feature("compactdefaultargs") Type;
		%feature("autodoc", "	* Returns the type Datum.

	:rtype: AIS_KindOfInteractive
") Type;
		AIS_KindOfInteractive Type ();
		%feature("compactdefaultargs") UnsetColor;
		%feature("autodoc", "	* Removes the color setting and returns the original color.

	:rtype: None
") UnsetColor;
		void UnsetColor ();
		%feature("compactdefaultargs") UnsetWidth;
		%feature("autodoc", "	* Removes the width setting and returns the original width.

	:rtype: None
") UnsetWidth;
		void UnsetWidth ();
};


%make_alias(AIS_Line)

%extend AIS_Line {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor AIS_Manipulator;
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
		%feature("compactdefaultargs") AIS_Manipulator;
		%feature("autodoc", "	* Constructs a manipulator object with default placement and all parts to be displayed.

	:rtype: None
") AIS_Manipulator;
		 AIS_Manipulator ();
		%feature("compactdefaultargs") AIS_Manipulator;
		%feature("autodoc", "	* Constructs a manipulator object with input location and positions of axes and all parts to be displayed.

	:param thePosition:
	:type thePosition: gp_Ax2
	:rtype: None
") AIS_Manipulator;
		 AIS_Manipulator (const gp_Ax2 & thePosition);
		%feature("compactdefaultargs") ActiveMode;
		%feature("autodoc", "	* @name Setters for parameters

	:rtype: AIS_ManipulatorMode
") ActiveMode;
		AIS_ManipulatorMode ActiveMode ();
		%feature("compactdefaultargs") Attach;
		%feature("autodoc", "	* Attaches himself to the input interactive object and become displayed in the same context. It is placed in the center of object bounding box, and its size is adjusted to the object bounding box.

	:param theObject:
	:type theObject: opencascade::handle<AIS_InteractiveObject> &
	:param theOptions: default value is OptionsForAttach()
	:type theOptions: OptionsForAttach &
	:rtype: None
") Attach;
		void Attach (const opencascade::handle<AIS_InteractiveObject> & theObject,const OptionsForAttach & theOptions = OptionsForAttach());
		%feature("compactdefaultargs") Attach;
		%feature("autodoc", "	* Attaches himself to the input interactive object group and become displayed in the same context. It become attached to the first object, baut manage manipulation of the whole group. It is placed in the center of object bounding box, and its size is adjusted to the object bounding box.

	:param theObject:
	:type theObject: opencascade::handle<AIS_ManipulatorObjectSequence> &
	:param theOptions: default value is OptionsForAttach()
	:type theOptions: OptionsForAttach &
	:rtype: None
") Attach;
		void Attach (const opencascade::handle<AIS_ManipulatorObjectSequence> & theObject,const OptionsForAttach & theOptions = OptionsForAttach());
		%feature("compactdefaultargs") ClearSelected;
		%feature("autodoc", "	* Method which clear all selected owners belonging to this selectable object ( for fast presentation draw ).

	:rtype: void
") ClearSelected;
		virtual void ClearSelected ();
		%feature("compactdefaultargs") Compute;
		%feature("autodoc", "	* @name Presentation computation Fills presentation. @note Manipulator presentation does not use display mode and for all modes has the same presentation.

	:param thePrsMgr:
	:type thePrsMgr: opencascade::handle<PrsMgr_PresentationManager3d> &
	:param thePrs:
	:type thePrs: opencascade::handle<Prs3d_Presentation> &
	:param theMode: default value is 0
	:type theMode: int
	:rtype: void
") Compute;
		virtual void Compute (const opencascade::handle<PrsMgr_PresentationManager3d> & thePrsMgr,const opencascade::handle<Prs3d_Presentation> & thePrs,const Standard_Integer theMode = 0);
		%feature("compactdefaultargs") ComputeSelection;
		%feature("autodoc", "	* Computes selection sensitive zones (triangulation) for manipulator. @param theNode [in] Selection mode that is treated as transformation mode.

	:param theSelection:
	:type theSelection: opencascade::handle<SelectMgr_Selection> &
	:param theMode:
	:type theMode: int
	:rtype: void
") ComputeSelection;
		virtual void ComputeSelection (const opencascade::handle<SelectMgr_Selection> & theSelection,const Standard_Integer theMode);
		%feature("compactdefaultargs") DeactivateCurrentMode;
		%feature("autodoc", "	* Make inactive the current selected manipulator part and reset current axis index and current mode. After its call HasActiveMode() returns false. @sa HasActiveMode()

	:rtype: None
") DeactivateCurrentMode;
		void DeactivateCurrentMode ();
		%feature("compactdefaultargs") Detach;
		%feature("autodoc", "	* Detaches himself from the owner object, and removes itself from context.

	:rtype: None
") Detach;
		void Detach ();
		%feature("compactdefaultargs") EnableMode;
		%feature("autodoc", "	* Enable manipualtion mode. @warning It activates selection mode in the current context. If manipulator is not displayed, no mode will be activated.

	:param theMode:
	:type theMode: AIS_ManipulatorMode
	:rtype: None
") EnableMode;
		void EnableMode (const AIS_ManipulatorMode theMode);
		%feature("compactdefaultargs") HasActiveMode;
		%feature("autodoc", "	* returns true if some part of manipulator is selected (transformation mode is active, and owning object can be transformed).

	:rtype: bool
") HasActiveMode;
		Standard_Boolean HasActiveMode ();
		%feature("compactdefaultargs") HasActiveTransformation;
		%feature("autodoc", "	:rtype: bool
") HasActiveTransformation;
		Standard_Boolean HasActiveTransformation ();
		%feature("compactdefaultargs") HilightOwnerWithColor;
		%feature("autodoc", "	* Method which hilight an owner belonging to this selectable object ( for fast presentation draw ).

	:param thePM:
	:type thePM: opencascade::handle<PrsMgr_PresentationManager3d> &
	:param theStyle:
	:type theStyle: opencascade::handle<Prs3d_Drawer> &
	:param theOwner:
	:type theOwner: opencascade::handle<SelectMgr_EntityOwner> &
	:rtype: void
") HilightOwnerWithColor;
		virtual void HilightOwnerWithColor (const opencascade::handle<PrsMgr_PresentationManager3d> & thePM,const opencascade::handle<Prs3d_Drawer> & theStyle,const opencascade::handle<SelectMgr_EntityOwner> & theOwner);
		%feature("compactdefaultargs") HilightSelected;
		%feature("autodoc", "	* Method which draws selected owners ( for fast presentation draw ).

	:param thePM:
	:type thePM: opencascade::handle<PrsMgr_PresentationManager3d> &
	:param theSeq:
	:type theSeq: SelectMgr_SequenceOfOwner &
	:rtype: void
") HilightSelected;
		virtual void HilightSelected (const opencascade::handle<PrsMgr_PresentationManager3d> & thePM,const SelectMgr_SequenceOfOwner & theSeq);
		%feature("compactdefaultargs") IsAttached;
		%feature("autodoc", "	* returns true if manipulator is attached to some interactive object (has owning object).

	:rtype: bool
") IsAttached;
		Standard_Boolean IsAttached ();
		%feature("compactdefaultargs") IsAutoHilight;
		%feature("autodoc", "	* Disables auto highlighting to use HilightSelected() and HilightOwnerWithColor() overridden methods.

	:rtype: bool
") IsAutoHilight;
		Standard_Boolean IsAutoHilight ();
		%feature("compactdefaultargs") IsModeActivationOnDetection;
		%feature("autodoc", "	* returns true if manual mode activation is enabled.

	:rtype: bool
") IsModeActivationOnDetection;
		Standard_Boolean IsModeActivationOnDetection ();
		%feature("compactdefaultargs") Object;
		%feature("autodoc", "	* returns the first (leading) object of the owning objects.

	:rtype: opencascade::handle<AIS_InteractiveObject>
") Object;
		opencascade::handle<AIS_InteractiveObject> Object ();
		%feature("compactdefaultargs") Object;
		%feature("autodoc", "	* returns one of the owning objects. @warning raises program error if theIndex is more than owning objects count or less than 1.

	:param theIndex:
	:type theIndex: int
	:rtype: opencascade::handle<AIS_InteractiveObject>
") Object;
		opencascade::handle<AIS_InteractiveObject> Object (const Standard_Integer theIndex);
		%feature("compactdefaultargs") ObjectTransformation;
		%feature("autodoc", "	* Computes transformation of parent object according to the active mode and input motion vector. You can use this method to get object transformation according to current mode or use own algorithm to implement any other tranformation for modes. returns transformation of parent object.

	:param theX:
	:type theX: int
	:param theY:
	:type theY: int
	:param theView:
	:type theView: opencascade::handle<V3d_View> &
	:param theTrsf:
	:type theTrsf: gp_Trsf
	:rtype: bool
") ObjectTransformation;
		Standard_Boolean ObjectTransformation (const Standard_Integer theX,const Standard_Integer theY,const opencascade::handle<V3d_View> & theView,gp_Trsf & theTrsf);
		%feature("compactdefaultargs") Objects;
		%feature("autodoc", "	* returns all owning objects.

	:rtype: opencascade::handle<AIS_ManipulatorObjectSequence>
") Objects;
		opencascade::handle<AIS_ManipulatorObjectSequence> Objects ();
		%feature("compactdefaultargs") Position;
		%feature("autodoc", "	* returns poition of manipulator interactive object.

	:rtype: gp_Ax2
") Position;
		const gp_Ax2  Position ();
		%feature("compactdefaultargs") SetGap;
		%feature("autodoc", "	* Sets gaps between translator, scaler and rotator sub-presentations.

	:param theValue:
	:type theValue: Standard_ShortReal
	:rtype: None
") SetGap;
		void SetGap (const Standard_ShortReal theValue);
		%feature("compactdefaultargs") SetModeActivationOnDetection;
		%feature("autodoc", "	* Enables mode activation on detection (highlighting). By default, mode is activated on selection of manipulator part. @warning If this mode is enabled, selection of parts does nothing.

	:param theToEnable:
	:type theToEnable: bool
	:rtype: None
") SetModeActivationOnDetection;
		void SetModeActivationOnDetection (const Standard_Boolean theToEnable);
		%feature("compactdefaultargs") SetPart;
		%feature("autodoc", "	* Disable or enable visual parts for translation, rotation or scaling for some axis. By default all parts are enabled (will be displayed). @warning Enabling or disabling of visual parts of manipulator does not manage the manipulation (selection) mode. @warning Raises program error if axis index is < 0 or > 2.

	:param theAxisIndex:
	:type theAxisIndex: int
	:param theMode:
	:type theMode: AIS_ManipulatorMode
	:param theIsEnabled:
	:type theIsEnabled: bool
	:rtype: None
") SetPart;
		void SetPart (const Standard_Integer theAxisIndex,const AIS_ManipulatorMode theMode,const Standard_Boolean theIsEnabled);
		%feature("compactdefaultargs") SetPart;
		%feature("autodoc", "	* Disable or enable visual parts for translation, rotation or scaling for ALL axes. By default all parts are enabled (will be displayed). @warning Enabling or disabling of visual parts of manipulator does not manage the manipulation (selection) mode. @warning Raises program error if axis index is < 0 or > 2.

	:param theMode:
	:type theMode: AIS_ManipulatorMode
	:param theIsEnabled:
	:type theIsEnabled: bool
	:rtype: None
") SetPart;
		void SetPart (const AIS_ManipulatorMode theMode,const Standard_Boolean theIsEnabled);
		%feature("compactdefaultargs") SetPosition;
		%feature("autodoc", "	* Sets position of the manipulator object.

	:param thePosition:
	:type thePosition: gp_Ax2
	:rtype: None
") SetPosition;
		void SetPosition (const gp_Ax2 & thePosition);
		%feature("compactdefaultargs") SetSize;
		%feature("autodoc", "	* Sets size (length of side of the manipulator cubic bounding box.

	:param theSideLength:
	:type theSideLength: Standard_ShortReal
	:rtype: None
") SetSize;
		void SetSize (const Standard_ShortReal theSideLength);
		%feature("compactdefaultargs") SetTransformPersistence;
		%feature("autodoc", "	* Redefines transform persistence management to setup transformation for sub-presentation of axes. @warning this interactive object does not support custom transformation persistence when using \sa ZoomPersistence mode. In this mode the transformation persistence flags for presentations are overridden by this class. @warning Invokes debug assertion to catch incompatible usage of the method with \sa ZoomPersistence mode, silently does nothing in release mode. @warning revise use of AdjustSize argument of of \sa AttachToObjects method when enabling zoom persistence.

	:param theTrsfPers:
	:type theTrsfPers: opencascade::handle<Graphic3d_TransformPers> &
	:rtype: void
") SetTransformPersistence;
		virtual void SetTransformPersistence (const opencascade::handle<Graphic3d_TransformPers> & theTrsfPers);
		%feature("compactdefaultargs") SetZoomPersistence;
		%feature("autodoc", "	* @name Configuration of graphical transformations Enable or disable zoom persistence mode for the manipulator. With this mode turned on the presentation will keep fixed screen size. @warning when turned on this option overrides transform persistence properties and local transformation to achieve necessary visual effect. @warning revise use of AdjustSize argument of of \sa AttachToObjects method when enabling zoom persistence.

	:param theToEnable:
	:type theToEnable: bool
	:rtype: None
") SetZoomPersistence;
		void SetZoomPersistence (const Standard_Boolean theToEnable);
		%feature("compactdefaultargs") Size;
		%feature("autodoc", "	:rtype: Standard_ShortReal
") Size;
		Standard_ShortReal Size ();
		%feature("compactdefaultargs") StartTransform;
		%feature("autodoc", "	* Init start (reference) transformation. @warning It is used in chain with StartTransform-Transform(gp_Trsf)-StopTransform and is used only for custom transform set. If Transform(const Standard_Integer, const Standard_Integer) is used, initial data is set automatically, and it is reset on DeactivateCurrentMode call if it is not reset yet.

	:param theX:
	:type theX: int
	:param theY:
	:type theY: int
	:param theView:
	:type theView: opencascade::handle<V3d_View> &
	:rtype: None
") StartTransform;
		void StartTransform (const Standard_Integer theX,const Standard_Integer theY,const opencascade::handle<V3d_View> & theView);
		%feature("compactdefaultargs") StartTransformation;
		%feature("autodoc", "	:rtype: gp_Trsf
") StartTransformation;
		gp_Trsf StartTransformation ();
		%feature("compactdefaultargs") StartTransformation;
		%feature("autodoc", "	:param theIndex:
	:type theIndex: int
	:rtype: gp_Trsf
") StartTransformation;
		gp_Trsf StartTransformation (Standard_Integer theIndex);
		%feature("compactdefaultargs") StopTransform;
		%feature("autodoc", "	* Reset start (reference) transformation. @param theToApply [in] option to apply or to cancel the started transformation. @warning It is used in chain with StartTransform-Transform(gp_Trsf)-StopTransform and is used only for custom transform set.

	:param theToApply: default value is Standard_True
	:type theToApply: bool
	:rtype: None
") StopTransform;
		void StopTransform (const Standard_Boolean theToApply = Standard_True);
		%feature("compactdefaultargs") Transform;
		%feature("autodoc", "	* Apply to the owning objects the input transformation. @remark The transformation is set using SetLocalTransformation for owning objects. The location of the manipulator is stored also in Local Transformation, so that there's no need to redisplay objects. @warning It is used in chain with StartTransform-Transform(gp_Trsf)-StopTransform and is used only for custom transform set. @warning It will does nothing if transformation is not initiated (with StartTransform() call).

	:param aTrsf:
	:type aTrsf: gp_Trsf
	:rtype: None
") Transform;
		void Transform (const gp_Trsf & aTrsf);
		%feature("compactdefaultargs") Transform;
		%feature("autodoc", "	* Apply transformation made from mouse moving from start position (save on the first Tranform() call and reset on DeactivateCurrentMode() call.) to the in/out mouse position (theX, theY)

	:param theX:
	:type theX: int
	:param theY:
	:type theY: int
	:param theView:
	:type theView: opencascade::handle<V3d_View> &
	:rtype: gp_Trsf
") Transform;
		gp_Trsf Transform (const Standard_Integer theX,const Standard_Integer theY,const opencascade::handle<V3d_View> & theView);
		%feature("compactdefaultargs") ZoomPersistence;
		%feature("autodoc", "	* Returns state of zoom persistence mode, whether it turned on or off.

	:rtype: bool
") ZoomPersistence;
		Standard_Boolean ZoomPersistence ();
};


%make_alias(AIS_Manipulator)

%extend AIS_Manipulator {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor AIS_MediaPlayer;
class AIS_MediaPlayer : public AIS_InteractiveObject {
	public:
		%feature("compactdefaultargs") AIS_MediaPlayer;
		%feature("autodoc", "	* Empty constructor.

	:rtype: None
") AIS_MediaPlayer;
		 AIS_MediaPlayer ();
		%feature("compactdefaultargs") Duration;
		%feature("autodoc", "	* Return duration.

	:rtype: double
") Duration;
		double Duration ();
		%feature("compactdefaultargs") OpenInput;
		%feature("autodoc", "	* Open specified file.

	:param thePath:
	:type thePath: TCollection_AsciiString &
	:param theToWait:
	:type theToWait: bool
	:rtype: None
") OpenInput;
		void OpenInput (const TCollection_AsciiString & thePath,Standard_Boolean theToWait);
		%feature("compactdefaultargs") PlayPause;
		%feature("autodoc", "	* Switch playback state.

	:rtype: None
") PlayPause;
		void PlayPause ();
		%feature("compactdefaultargs") PlayerContext;
		%feature("autodoc", "	* Return player context.

	:rtype: opencascade::handle<Media_PlayerContext>
") PlayerContext;
		const opencascade::handle<Media_PlayerContext> & PlayerContext ();
		%feature("compactdefaultargs") PresentFrame;
		%feature("autodoc", "	* Display new frame.

	:param theLeftCorner:
	:type theLeftCorner: Graphic3d_Vec2i &
	:param theMaxSize:
	:type theMaxSize: Graphic3d_Vec2i &
	:rtype: bool
") PresentFrame;
		bool PresentFrame (const Graphic3d_Vec2i & theLeftCorner,const Graphic3d_Vec2i & theMaxSize);
		%feature("compactdefaultargs") SetCallback;
		%feature("autodoc", "	* Setup callback to be called on queue progress (e.g. when new frame should be displayed).

	:param theCallbackFunction:
	:type theCallbackFunction: Graphic3d_MediaTextureSet::CallbackOnUpdate_t
	:param theCallbackUserPtr:
	:type theCallbackUserPtr: void *
	:rtype: None
") SetCallback;
		void SetCallback (Graphic3d_MediaTextureSet::CallbackOnUpdate_t theCallbackFunction,void * theCallbackUserPtr);
		%feature("compactdefaultargs") SetClosePlayer;
		%feature("autodoc", "	* Schedule player to be closed.

	:rtype: None
") SetClosePlayer;
		void SetClosePlayer ();
};


%extend AIS_MediaPlayer {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor AIS_MultipleConnectedInteractive;
class AIS_MultipleConnectedInteractive : public AIS_InteractiveObject {
	public:
		%feature("compactdefaultargs") AIS_MultipleConnectedInteractive;
		%feature("autodoc", "	* Initializes the Interactive Object with multiple connections to AIS_Interactive objects.

	:rtype: None
") AIS_MultipleConnectedInteractive;
		 AIS_MultipleConnectedInteractive ();
		%feature("compactdefaultargs") AcceptShapeDecomposition;
		%feature("autodoc", "	* Informs the graphic context that the interactive Object may be decomposed into sub-shapes for dynamic selection.

	:rtype: bool
") AcceptShapeDecomposition;
		virtual Standard_Boolean AcceptShapeDecomposition ();
		%feature("compactdefaultargs") Compute;
		%feature("autodoc", "	* computes the presentation according to a point of view given by <aProjector>. To be Used when the associated degenerated Presentations have been transformed by <aTrsf> which is not a Pure Translation. The HLR Prs can't be deducted automatically WARNING :<aTrsf> must be applied to the object to display before computation !!!

	:param aProjector:
	:type aProjector: opencascade::handle<Prs3d_Projector> &
	:param aTrsf:
	:type aTrsf: opencascade::handle<Geom_Transformation> &
	:param aPresentation:
	:type aPresentation: opencascade::handle<Prs3d_Presentation> &
	:rtype: void
") Compute;
		virtual void Compute (const opencascade::handle<Prs3d_Projector> & aProjector,const opencascade::handle<Geom_Transformation> & aTrsf,const opencascade::handle<Prs3d_Presentation> & aPresentation);
		%feature("compactdefaultargs") Compute;
		%feature("autodoc", "	:param aProjector:
	:type aProjector: opencascade::handle<Prs3d_Projector> &
	:param aPresentation:
	:type aPresentation: opencascade::handle<Prs3d_Presentation> &
	:rtype: void
") Compute;
		virtual void Compute (const opencascade::handle<Prs3d_Projector> & aProjector,const opencascade::handle<Prs3d_Presentation> & aPresentation);
		%feature("compactdefaultargs") Connect;
		%feature("autodoc", "	* Establishes the connection between the Connected Interactive Object, theInteractive, and its reference. Locates instance in theLocation and applies specified transformation persistence mode. returns created instance object (AIS_ConnectedInteractive or AIS_MultipleConnectedInteractive)

	:param theAnotherObj:
	:type theAnotherObj: opencascade::handle<AIS_InteractiveObject> &
	:param theLocation:
	:type theLocation: opencascade::handle<Geom_Transformation> &
	:param theTrsfPers:
	:type theTrsfPers: opencascade::handle<Graphic3d_TransformPers> &
	:rtype: opencascade::handle<AIS_InteractiveObject>
") Connect;
		opencascade::handle<AIS_InteractiveObject> Connect (const opencascade::handle<AIS_InteractiveObject> & theAnotherObj,const opencascade::handle<Geom_Transformation> & theLocation,const opencascade::handle<Graphic3d_TransformPers> & theTrsfPers);
		%feature("compactdefaultargs") Connect;
		%feature("autodoc", "	* Establishes the connection between the Connected Interactive Object, theInteractive, and its reference. Copies local transformation and transformation persistence mode from theInteractive. returns created instance object (AIS_ConnectedInteractive or AIS_MultipleConnectedInteractive)

	:param theAnotherObj:
	:type theAnotherObj: opencascade::handle<AIS_InteractiveObject> &
	:rtype: opencascade::handle<AIS_InteractiveObject>
") Connect;
		opencascade::handle<AIS_InteractiveObject> Connect (const opencascade::handle<AIS_InteractiveObject> & theAnotherObj);
		%feature("compactdefaultargs") Connect;
		%feature("autodoc", "	* Establishes the connection between the Connected Interactive Object, theInteractive, and its reference. Locates instance in theLocation and copies transformation persistence mode from theInteractive. returns created instance object (AIS_ConnectedInteractive or AIS_MultipleConnectedInteractive)

	:param theAnotherObj:
	:type theAnotherObj: opencascade::handle<AIS_InteractiveObject> &
	:param theLocation:
	:type theLocation: gp_Trsf
	:rtype: opencascade::handle<AIS_InteractiveObject>
") Connect;
		opencascade::handle<AIS_InteractiveObject> Connect (const opencascade::handle<AIS_InteractiveObject> & theAnotherObj,const gp_Trsf & theLocation);
		%feature("compactdefaultargs") Connect;
		%feature("autodoc", "	* Establishes the connection between the Connected Interactive Object, theInteractive, and its reference. Locates instance in theLocation and applies specified transformation persistence mode. returns created instance object (AIS_ConnectedInteractive or AIS_MultipleConnectedInteractive)

	:param theAnotherObj:
	:type theAnotherObj: opencascade::handle<AIS_InteractiveObject> &
	:param theLocation:
	:type theLocation: gp_Trsf
	:param theTrsfPers:
	:type theTrsfPers: opencascade::handle<Graphic3d_TransformPers> &
	:rtype: opencascade::handle<AIS_InteractiveObject>
") Connect;
		opencascade::handle<AIS_InteractiveObject> Connect (const opencascade::handle<AIS_InteractiveObject> & theAnotherObj,const gp_Trsf & theLocation,const opencascade::handle<Graphic3d_TransformPers> & theTrsfPers);
		%feature("compactdefaultargs") Connect;
		%feature("autodoc", "	:param theInteractive:
	:type theInteractive: opencascade::handle<AIS_InteractiveObject> &
	:param theLocation:
	:type theLocation: gp_Trsf
	:param theTrsfPersFlag:
	:type theTrsfPersFlag: Graphic3d_TransModeFlags &
	:param theTrsfPersPoint:
	:type theTrsfPersPoint: gp_Pnt
	:rtype: opencascade::handle<AIS_InteractiveObject>
") Connect;
		opencascade::handle<AIS_InteractiveObject> Connect (const opencascade::handle<AIS_InteractiveObject> & theInteractive,const gp_Trsf & theLocation,const Graphic3d_TransModeFlags & theTrsfPersFlag,const gp_Pnt & theTrsfPersPoint);
		%feature("compactdefaultargs") Disconnect;
		%feature("autodoc", "	* Removes the connection with theInteractive.

	:param theInteractive:
	:type theInteractive: opencascade::handle<AIS_InteractiveObject> &
	:rtype: None
") Disconnect;
		void Disconnect (const opencascade::handle<AIS_InteractiveObject> & theInteractive);
		%feature("compactdefaultargs") DisconnectAll;
		%feature("autodoc", "	* Clears all the connections to objects.

	:rtype: None
") DisconnectAll;
		void DisconnectAll ();
		%feature("compactdefaultargs") GetAssemblyOwner;
		%feature("autodoc", "	* Returns common entity owner if the object is an assembly

	:rtype: opencascade::handle<SelectMgr_EntityOwner>
") GetAssemblyOwner;
		const opencascade::handle<SelectMgr_EntityOwner> & GetAssemblyOwner ();
		%feature("compactdefaultargs") GlobalSelOwner;
		%feature("autodoc", "	* Returns the owner of mode for selection of object as a whole

	:rtype: opencascade::handle<SelectMgr_EntityOwner>
") GlobalSelOwner;
		opencascade::handle<SelectMgr_EntityOwner> GlobalSelOwner ();
		%feature("compactdefaultargs") HasConnection;
		%feature("autodoc", "	* Returns true if the object is connected to others.

	:rtype: bool
") HasConnection;
		Standard_Boolean HasConnection ();
		%feature("compactdefaultargs") SetContext;
		%feature("autodoc", "	* Assigns interactive context.

	:param theCtx:
	:type theCtx: opencascade::handle<AIS_InteractiveContext> &
	:rtype: void
") SetContext;
		virtual void SetContext (const opencascade::handle<AIS_InteractiveContext> & theCtx);
		%feature("compactdefaultargs") Signature;
		%feature("autodoc", "	:rtype: int
") Signature;
		virtual Standard_Integer Signature ();
		%feature("compactdefaultargs") Type;
		%feature("autodoc", "	:rtype: AIS_KindOfInteractive
") Type;
		virtual AIS_KindOfInteractive Type ();
};


%make_alias(AIS_MultipleConnectedInteractive)

%extend AIS_MultipleConnectedInteractive {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor AIS_Plane;
class AIS_Plane : public AIS_InteractiveObject {
	public:
		%feature("compactdefaultargs") AIS_Plane;
		%feature("autodoc", "	* initializes the plane aComponent. If the mode aCurrentMode equals true, the drawing tool, 'Drawer' is not initialized.

	:param aComponent:
	:type aComponent: opencascade::handle<Geom_Plane> &
	:param aCurrentMode: default value is Standard_False
	:type aCurrentMode: bool
	:rtype: None
") AIS_Plane;
		 AIS_Plane (const opencascade::handle<Geom_Plane> & aComponent,const Standard_Boolean aCurrentMode = Standard_False);
		%feature("compactdefaultargs") AIS_Plane;
		%feature("autodoc", "	* initializes the plane aComponent and the point aCenter. If the mode aCurrentMode equals true, the drawing tool, 'Drawer' is not initialized. aCurrentMode equals true, the drawing tool, 'Drawer' is not initialized.

	:param aComponent:
	:type aComponent: opencascade::handle<Geom_Plane> &
	:param aCenter:
	:type aCenter: gp_Pnt
	:param aCurrentMode: default value is Standard_False
	:type aCurrentMode: bool
	:rtype: None
") AIS_Plane;
		 AIS_Plane (const opencascade::handle<Geom_Plane> & aComponent,const gp_Pnt & aCenter,const Standard_Boolean aCurrentMode = Standard_False);
		%feature("compactdefaultargs") AIS_Plane;
		%feature("autodoc", "	* initializes the plane aComponent, the point aCenter, and the minimum and maximum points, aPmin and aPmax. If the mode aCurrentMode equals true, the drawing tool, 'Drawer' is not initialized.

	:param aComponent:
	:type aComponent: opencascade::handle<Geom_Plane> &
	:param aCenter:
	:type aCenter: gp_Pnt
	:param aPmin:
	:type aPmin: gp_Pnt
	:param aPmax:
	:type aPmax: gp_Pnt
	:param aCurrentMode: default value is Standard_False
	:type aCurrentMode: bool
	:rtype: None
") AIS_Plane;
		 AIS_Plane (const opencascade::handle<Geom_Plane> & aComponent,const gp_Pnt & aCenter,const gp_Pnt & aPmin,const gp_Pnt & aPmax,const Standard_Boolean aCurrentMode = Standard_False);
		%feature("compactdefaultargs") AIS_Plane;
		%feature("autodoc", "	:param aComponent:
	:type aComponent: opencascade::handle<Geom_Axis2Placement> &
	:param aPlaneType:
	:type aPlaneType: AIS_TypeOfPlane
	:param aCurrentMode: default value is Standard_False
	:type aCurrentMode: bool
	:rtype: None
") AIS_Plane;
		 AIS_Plane (const opencascade::handle<Geom_Axis2Placement> & aComponent,const AIS_TypeOfPlane aPlaneType,const Standard_Boolean aCurrentMode = Standard_False);
		%feature("compactdefaultargs") AcceptDisplayMode;
		%feature("autodoc", "	* Returns true if the display mode selected, aMode, is valid for planes.

	:param aMode:
	:type aMode: int
	:rtype: bool
") AcceptDisplayMode;
		virtual Standard_Boolean AcceptDisplayMode (const Standard_Integer aMode);
		%feature("compactdefaultargs") Axis2Placement;
		%feature("autodoc", "	* Returns the position of the plane's axis2 system identifying the x, y, or z axis and giving the plane a direction in 3D space. An axis2 system is a right-handed coordinate system.

	:rtype: opencascade::handle<Geom_Axis2Placement>
") Axis2Placement;
		opencascade::handle<Geom_Axis2Placement> Axis2Placement ();
		%feature("compactdefaultargs") Center;
		%feature("autodoc", "	* Returns the coordinates of the center point.

	:rtype: gp_Pnt
") Center;
		const gp_Pnt  Center ();
		%feature("compactdefaultargs") Component;
		%feature("autodoc", "	* Returns the component specified in SetComponent.

	:rtype: opencascade::handle<Geom_Plane>
") Component;
		const opencascade::handle<Geom_Plane> & Component ();
		%feature("compactdefaultargs") Compute;
		%feature("autodoc", "	* computes the presentation according to a point of view given by <aProjector>. To be Used when the associated degenerated Presentations have been transformed by <aTrsf> which is not a Pure Translation. The HLR Prs can't be deducted automatically WARNING :<aTrsf> must be applied to the object to display before computation !!!

	:param aProjector:
	:type aProjector: opencascade::handle<Prs3d_Projector> &
	:param aTrsf:
	:type aTrsf: opencascade::handle<Geom_Transformation> &
	:param aPresentation:
	:type aPresentation: opencascade::handle<Prs3d_Presentation> &
	:rtype: void
") Compute;
		virtual void Compute (const opencascade::handle<Prs3d_Projector> & aProjector,const opencascade::handle<Geom_Transformation> & aTrsf,const opencascade::handle<Prs3d_Presentation> & aPresentation);
		%feature("compactdefaultargs") ComputeSelection;
		%feature("autodoc", "	:param theSelection:
	:type theSelection: opencascade::handle<SelectMgr_Selection> &
	:param theMode:
	:type theMode: int
	:rtype: void
") ComputeSelection;
		virtual void ComputeSelection (const opencascade::handle<SelectMgr_Selection> & theSelection,const Standard_Integer theMode);
		%feature("compactdefaultargs") CurrentMode;
		%feature("autodoc", "	* Returns the non-default current display mode set by SetCurrentMode.

	:rtype: bool
") CurrentMode;
		Standard_Boolean CurrentMode ();
		%feature("compactdefaultargs") HasOwnSize;
		%feature("autodoc", "	:rtype: bool
") HasOwnSize;
		Standard_Boolean HasOwnSize ();
		%feature("compactdefaultargs") IsXYZPlane;
		%feature("autodoc", "	* Returns the type of plane - xy, yz, or xz.

	:rtype: bool
") IsXYZPlane;
		Standard_Boolean IsXYZPlane ();
		%feature("compactdefaultargs") PlaneAttributes;
		%feature("autodoc", "	* Returns the settings for the selected plane aComponent, provided in SetPlaneAttributes. These include the points aCenter, aPmin, and aPmax

	:param aComponent:
	:type aComponent: opencascade::handle<Geom_Plane> &
	:param aCenter:
	:type aCenter: gp_Pnt
	:param aPmin:
	:type aPmin: gp_Pnt
	:param aPmax:
	:type aPmax: gp_Pnt
	:rtype: bool
") PlaneAttributes;
		Standard_Boolean PlaneAttributes (opencascade::handle<Geom_Plane> & aComponent,gp_Pnt & aCenter,gp_Pnt & aPmin,gp_Pnt & aPmax);
		%feature("compactdefaultargs") SetAxis2Placement;
		%feature("autodoc", "	* Allows you to provide settings for the position and direction of one of the plane's axes, aComponent, in 3D space. The coordinate system used is right-handed, and the type of plane aPlaneType is one of: - AIS_ TOPL_Unknown - AIS_ TOPL_XYPlane - AIS_ TOPL_XZPlane - AIS_ TOPL_YZPlane}.

	:param aComponent:
	:type aComponent: opencascade::handle<Geom_Axis2Placement> &
	:param aPlaneType:
	:type aPlaneType: AIS_TypeOfPlane
	:rtype: None
") SetAxis2Placement;
		void SetAxis2Placement (const opencascade::handle<Geom_Axis2Placement> & aComponent,const AIS_TypeOfPlane aPlaneType);
		%feature("compactdefaultargs") SetCenter;
		%feature("autodoc", "	* Provides settings for the center theCenter other than (0, 0, 0).

	:param theCenter:
	:type theCenter: gp_Pnt
	:rtype: None
") SetCenter;
		void SetCenter (const gp_Pnt & theCenter);
		%feature("compactdefaultargs") SetColor;
		%feature("autodoc", "	:param aColor:
	:type aColor: Quantity_Color &
	:rtype: None
") SetColor;
		void SetColor (const Quantity_Color & aColor);
		%feature("compactdefaultargs") SetComponent;
		%feature("autodoc", "	* Creates an instance of the plane aComponent.

	:param aComponent:
	:type aComponent: opencascade::handle<Geom_Plane> &
	:rtype: None
") SetComponent;
		void SetComponent (const opencascade::handle<Geom_Plane> & aComponent);
		%feature("compactdefaultargs") SetContext;
		%feature("autodoc", "	* connection to <aCtx> default drawer implies a recomputation of Frame values.

	:param aCtx:
	:type aCtx: opencascade::handle<AIS_InteractiveContext> &
	:rtype: void
") SetContext;
		virtual void SetContext (const opencascade::handle<AIS_InteractiveContext> & aCtx);
		%feature("compactdefaultargs") SetCurrentMode;
		%feature("autodoc", "	* Allows you to provide settings for a non-default current display mode.

	:param theCurrentMode:
	:type theCurrentMode: bool
	:rtype: None
") SetCurrentMode;
		void SetCurrentMode (const Standard_Boolean theCurrentMode);
		%feature("compactdefaultargs") SetPlaneAttributes;
		%feature("autodoc", "	* Allows you to provide settings other than default ones for the selected plane. These include: center point aCenter, maximum aPmax and minimum aPmin.

	:param aComponent:
	:type aComponent: opencascade::handle<Geom_Plane> &
	:param aCenter:
	:type aCenter: gp_Pnt
	:param aPmin:
	:type aPmin: gp_Pnt
	:param aPmax:
	:type aPmax: gp_Pnt
	:rtype: None
") SetPlaneAttributes;
		void SetPlaneAttributes (const opencascade::handle<Geom_Plane> & aComponent,const gp_Pnt & aCenter,const gp_Pnt & aPmin,const gp_Pnt & aPmax);
		%feature("compactdefaultargs") SetSize;
		%feature("autodoc", "	* Same value for x and y directions

	:param aValue:
	:type aValue: float
	:rtype: None
") SetSize;
		void SetSize (const Standard_Real aValue);
		%feature("compactdefaultargs") SetSize;
		%feature("autodoc", "	* Sets the size defined by the length along the X axis XVal and the length along the Y axis YVal.

	:param Xval:
	:type Xval: float
	:param YVal:
	:type YVal: float
	:rtype: None
") SetSize;
		void SetSize (const Standard_Real Xval,const Standard_Real YVal);
		%feature("compactdefaultargs") SetTypeOfSensitivity;
		%feature("autodoc", "	* Sets the type of sensitivity for the plane.

	:param theTypeOfSensitivity:
	:type theTypeOfSensitivity: Select3D_TypeOfSensitivity
	:rtype: None
") SetTypeOfSensitivity;
		void SetTypeOfSensitivity (Select3D_TypeOfSensitivity theTypeOfSensitivity);
		%feature("compactdefaultargs") Signature;
		%feature("autodoc", "	:rtype: int
") Signature;
		virtual Standard_Integer Signature ();
		%feature("compactdefaultargs") Size;
		%feature("autodoc", "	:param X:
	:type X: float &
	:param Y:
	:type Y: float &
	:rtype: bool
") Size;
		Standard_Boolean Size (Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") Type;
		%feature("autodoc", "	:rtype: AIS_KindOfInteractive
") Type;
		virtual AIS_KindOfInteractive Type ();
		%feature("compactdefaultargs") TypeOfPlane;
		%feature("autodoc", "	* Returns the type of plane - xy, yz, xz or unknown.

	:rtype: AIS_TypeOfPlane
") TypeOfPlane;
		AIS_TypeOfPlane TypeOfPlane ();
		%feature("compactdefaultargs") TypeOfSensitivity;
		%feature("autodoc", "	* Returns the type of sensitivity for the plane;

	:rtype: Select3D_TypeOfSensitivity
") TypeOfSensitivity;
		Select3D_TypeOfSensitivity TypeOfSensitivity ();
		%feature("compactdefaultargs") UnsetColor;
		%feature("autodoc", "	:rtype: None
") UnsetColor;
		void UnsetColor ();
		%feature("compactdefaultargs") UnsetSize;
		%feature("autodoc", "	:rtype: None
") UnsetSize;
		void UnsetSize ();
};


%make_alias(AIS_Plane)

%extend AIS_Plane {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor AIS_PlaneTrihedron;
class AIS_PlaneTrihedron : public AIS_InteractiveObject {
	public:
		%feature("compactdefaultargs") AIS_PlaneTrihedron;
		%feature("autodoc", "	* Initializes the plane aPlane. The plane trihedron is constructed from this and an axis.

	:param aPlane:
	:type aPlane: opencascade::handle<Geom_Plane> &
	:rtype: None
") AIS_PlaneTrihedron;
		 AIS_PlaneTrihedron (const opencascade::handle<Geom_Plane> & aPlane);
		%feature("compactdefaultargs") AcceptDisplayMode;
		%feature("autodoc", "	* Returns true if the display mode selected, aMode, is valid.

	:param aMode:
	:type aMode: int
	:rtype: bool
") AcceptDisplayMode;
		Standard_Boolean AcceptDisplayMode (const Standard_Integer aMode);
		%feature("compactdefaultargs") Component;
		%feature("autodoc", "	* Returns the component specified in SetComponent.

	:rtype: opencascade::handle<Geom_Plane>
") Component;
		opencascade::handle<Geom_Plane> Component ();
		%feature("compactdefaultargs") Compute;
		%feature("autodoc", "	* computes the presentation according to a point of view given by <aProjector>. To be Used when the associated degenerated Presentations have been transformed by <aTrsf> which is not a Pure Translation. The HLR Prs can't be deducted automatically WARNING :<aTrsf> must be applied to the object to display before computation !!!

	:param aProjector:
	:type aProjector: opencascade::handle<Prs3d_Projector> &
	:param aTrsf:
	:type aTrsf: opencascade::handle<Geom_Transformation> &
	:param aPresentation:
	:type aPresentation: opencascade::handle<Prs3d_Presentation> &
	:rtype: void
") Compute;
		virtual void Compute (const opencascade::handle<Prs3d_Projector> & aProjector,const opencascade::handle<Geom_Transformation> & aTrsf,const opencascade::handle<Prs3d_Presentation> & aPresentation);
		%feature("compactdefaultargs") GetLength;
		%feature("autodoc", "	* Returns the length of X and Y axes.

	:rtype: float
") GetLength;
		Standard_Real GetLength ();
		%feature("compactdefaultargs") Position;
		%feature("autodoc", "	* Returns the point of origin of the plane trihedron.

	:rtype: opencascade::handle<AIS_Point>
") Position;
		opencascade::handle<AIS_Point> Position ();
		%feature("compactdefaultargs") SetColor;
		%feature("autodoc", "	* Allows you to provide settings for the color aColor.

	:param theColor:
	:type theColor: Quantity_Color &
	:rtype: void
") SetColor;
		virtual void SetColor (const Quantity_Color & theColor);
		%feature("compactdefaultargs") SetComponent;
		%feature("autodoc", "	* Creates an instance of the component object aPlane.

	:param aPlane:
	:type aPlane: opencascade::handle<Geom_Plane> &
	:rtype: None
") SetComponent;
		void SetComponent (const opencascade::handle<Geom_Plane> & aPlane);
		%feature("compactdefaultargs") SetLength;
		%feature("autodoc", "	* Sets the length of the X and Y axes.

	:param theLength:
	:type theLength: float
	:rtype: None
") SetLength;
		void SetLength (const Standard_Real theLength);
		%feature("compactdefaultargs") SetXLabel;
		%feature("autodoc", "	:param theLabel:
	:type theLabel: TCollection_AsciiString &
	:rtype: None
") SetXLabel;
		void SetXLabel (const TCollection_AsciiString & theLabel);
		%feature("compactdefaultargs") SetYLabel;
		%feature("autodoc", "	:param theLabel:
	:type theLabel: TCollection_AsciiString &
	:rtype: None
") SetYLabel;
		void SetYLabel (const TCollection_AsciiString & theLabel);
		%feature("compactdefaultargs") Signature;
		%feature("autodoc", "	:rtype: int
") Signature;
		Standard_Integer Signature ();
		%feature("compactdefaultargs") Type;
		%feature("autodoc", "	* Returns datum as the type of Interactive Object.

	:rtype: AIS_KindOfInteractive
") Type;
		AIS_KindOfInteractive Type ();
		%feature("compactdefaultargs") XAxis;
		%feature("autodoc", "	* Returns the 'XAxis'.

	:rtype: opencascade::handle<AIS_Line>
") XAxis;
		opencascade::handle<AIS_Line> XAxis ();
		%feature("compactdefaultargs") YAxis;
		%feature("autodoc", "	* Returns the 'YAxis'.

	:rtype: opencascade::handle<AIS_Line>
") YAxis;
		opencascade::handle<AIS_Line> YAxis ();
};


%make_alias(AIS_PlaneTrihedron)

%extend AIS_PlaneTrihedron {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor AIS_Point;
class AIS_Point : public AIS_InteractiveObject {
	public:
		%feature("compactdefaultargs") AIS_Point;
		%feature("autodoc", "	* Initializes the point aComponent from which the point datum will be built.

	:param aComponent:
	:type aComponent: opencascade::handle<Geom_Point> &
	:rtype: None
") AIS_Point;
		 AIS_Point (const opencascade::handle<Geom_Point> & aComponent);
		%feature("compactdefaultargs") AcceptDisplayMode;
		%feature("autodoc", "	* Returns true if the display mode selected is valid for point datums.

	:param aMode:
	:type aMode: int
	:rtype: bool
") AcceptDisplayMode;
		Standard_Boolean AcceptDisplayMode (const Standard_Integer aMode);
		%feature("compactdefaultargs") Component;
		%feature("autodoc", "	* Returns the component specified in SetComponent.

	:rtype: opencascade::handle<Geom_Point>
") Component;
		opencascade::handle<Geom_Point> Component ();
		%feature("compactdefaultargs") Compute;
		%feature("autodoc", "	* computes the presentation according to a point of view given by <aProjector>. To be Used when the associated degenerated Presentations have been transformed by <aTrsf> which is not a Pure Translation. The HLR Prs can't be deducted automatically WARNING :<aTrsf> must be applied to the object to display before computation !!!

	:param aProjector:
	:type aProjector: opencascade::handle<Prs3d_Projector> &
	:param aTrsf:
	:type aTrsf: opencascade::handle<Geom_Transformation> &
	:param aPresentation:
	:type aPresentation: opencascade::handle<Prs3d_Presentation> &
	:rtype: void
") Compute;
		virtual void Compute (const opencascade::handle<Prs3d_Projector> & aProjector,const opencascade::handle<Geom_Transformation> & aTrsf,const opencascade::handle<Prs3d_Presentation> & aPresentation);
		%feature("compactdefaultargs") HasMarker;
		%feature("autodoc", "	* Returns true if the point datum has a marker.

	:rtype: bool
") HasMarker;
		Standard_Boolean HasMarker ();
		%feature("compactdefaultargs") SetColor;
		%feature("autodoc", "	* Allows you to provide settings for the Color.

	:param theColor:
	:type theColor: Quantity_Color &
	:rtype: void
") SetColor;
		virtual void SetColor (const Quantity_Color & theColor);
		%feature("compactdefaultargs") SetComponent;
		%feature("autodoc", "	* Constructs an instance of the point aComponent.

	:param aComponent:
	:type aComponent: opencascade::handle<Geom_Point> &
	:rtype: None
") SetComponent;
		void SetComponent (const opencascade::handle<Geom_Point> & aComponent);
		%feature("compactdefaultargs") SetMarker;
		%feature("autodoc", "	* Allows you to provide settings for a marker. These include - type of marker, - marker color, - scale factor.

	:param aType:
	:type aType: Aspect_TypeOfMarker
	:rtype: None
") SetMarker;
		void SetMarker (const Aspect_TypeOfMarker aType);
		%feature("compactdefaultargs") Signature;
		%feature("autodoc", "	* Returns index 1, the default index for a point.

	:rtype: int
") Signature;
		Standard_Integer Signature ();
		%feature("compactdefaultargs") Type;
		%feature("autodoc", "	* Indicates that a point is a datum.

	:rtype: AIS_KindOfInteractive
") Type;
		AIS_KindOfInteractive Type ();
		%feature("compactdefaultargs") UnsetColor;
		%feature("autodoc", "	* Allows you to remove color settings.

	:rtype: void
") UnsetColor;
		virtual void UnsetColor ();
		%feature("compactdefaultargs") UnsetMarker;
		%feature("autodoc", "	* Removes the marker settings.

	:rtype: None
") UnsetMarker;
		void UnsetMarker ();
		%feature("compactdefaultargs") Vertex;
		%feature("autodoc", "	* Converts a point into a vertex.

	:rtype: TopoDS_Vertex
") Vertex;
		TopoDS_Vertex Vertex ();
};


%make_alias(AIS_Point)

%extend AIS_Point {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor AIS_PointCloud;
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

		%feature("compactdefaultargs") AIS_PointCloud;
		%feature("autodoc", "	* Constructor.

	:rtype: None
") AIS_PointCloud;
		 AIS_PointCloud ();
		%feature("compactdefaultargs") GetBoundingBox;
		%feature("autodoc", "	* Get bounding box for presentation.

	:rtype: Bnd_Box
") GetBoundingBox;
		virtual Bnd_Box GetBoundingBox ();
		%feature("compactdefaultargs") GetPoints;
		%feature("autodoc", "	* Get the points array. Method might be overridden to fill in points array dynamically from application data structures. returns the array of points

	:rtype: opencascade::handle<Graphic3d_ArrayOfPoints>
") GetPoints;
		virtual const opencascade::handle<Graphic3d_ArrayOfPoints> GetPoints ();
		%feature("compactdefaultargs") SetColor;
		%feature("autodoc", "	* Setup custom color. Affects presentation only when no per-point color attribute has been assigned.

	:param theColor:
	:type theColor: Quantity_Color &
	:rtype: void
") SetColor;
		virtual void SetColor (const Quantity_Color & theColor);
		%feature("compactdefaultargs") SetMaterial;
		%feature("autodoc", "	* Setup custom material. Affects presentation only when normals are defined.

	:param theMat:
	:type theMat: Graphic3d_MaterialAspect &
	:rtype: void
") SetMaterial;
		virtual void SetMaterial (const Graphic3d_MaterialAspect & theMat);
		%feature("compactdefaultargs") SetPoints;
		%feature("autodoc", "	* Sets the points from array of points. Method will not copy the input data - array will be stored as handle. @param thePoints [in] the array of points

	:param thePoints:
	:type thePoints: opencascade::handle<Graphic3d_ArrayOfPoints> &
	:rtype: void
") SetPoints;
		virtual void SetPoints (const opencascade::handle<Graphic3d_ArrayOfPoints> & thePoints);
		%feature("compactdefaultargs") SetPoints;
		%feature("autodoc", "	* Sets the points with optional colors. The input data will be copied into internal buffer. The input arrays should have equal length, otherwise the presentation will not be computed and displayed. @param theCoords [in] the array of coordinates @param theColors [in] optional array of colors @param theNormals [in] optional array of normals

	:param theCoords:
	:type theCoords: opencascade::handle<TColgp_HArray1OfPnt>
	:param theColors: default value is NULL
	:type theColors: opencascade::handle<Quantity_HArray1OfColor> &
	:param theNormals: default value is NULL
	:type theNormals: opencascade::handle<TColgp_HArray1OfDir>
	:rtype: void
") SetPoints;
		virtual void SetPoints (const opencascade::handle<TColgp_HArray1OfPnt> & theCoords,const opencascade::handle<Quantity_HArray1OfColor> & theColors = NULL,const opencascade::handle<TColgp_HArray1OfDir> & theNormals = NULL);
		%feature("compactdefaultargs") UnsetColor;
		%feature("autodoc", "	* Restore default color.

	:rtype: void
") UnsetColor;
		virtual void UnsetColor ();
		%feature("compactdefaultargs") UnsetMaterial;
		%feature("autodoc", "	* Restore default material.

	:rtype: void
") UnsetMaterial;
		virtual void UnsetMaterial ();
};


%make_alias(AIS_PointCloud)

%extend AIS_PointCloud {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor AIS_Relation;
class AIS_Relation : public AIS_InteractiveObject {
	public:
		%feature("compactdefaultargs") AcceptDisplayMode;
		%feature("autodoc", "	* Returns true if the display mode aMode is accepted for the Interactive Objects in the relation. ComputeProjPresentation(me; aPres : Presentation from Prs3d; Curve1 : Curve from Geom; Curve2 : Curve from Geom; FirstP1 : Pnt from gp; LastP1 : Pnt from gp; FirstP2 : Pnt from gp; LastP2 : Pnt from gp; aColor : NameOfColor from Quantity = Quantity_NOC_PURPLE; aWidth : Real  from Standard = 2; aProjTOL : TypeOfLine  from Aspect = Aspect_TOL_DASH; aCallTOL : TypeOfLine  from Aspect = Aspect_TOL_DOT)

	:param aMode:
	:type aMode: int
	:rtype: bool
") AcceptDisplayMode;
		virtual Standard_Boolean AcceptDisplayMode (const Standard_Integer aMode);
		%feature("compactdefaultargs") ArrowSize;
		%feature("autodoc", "	* Returns the value for the size of the arrow identifying the relation between the two shapes.

	:rtype: float
") ArrowSize;
		Standard_Real ArrowSize ();
		%feature("compactdefaultargs") AutomaticPosition;
		%feature("autodoc", "	:rtype: bool
") AutomaticPosition;
		Standard_Boolean AutomaticPosition ();
		%feature("compactdefaultargs") ExtShape;
		%feature("autodoc", "	* Returns the status index of the extension shape.

	:rtype: int
") ExtShape;
		Standard_Integer ExtShape ();
		%feature("compactdefaultargs") FirstShape;
		%feature("autodoc", "	:rtype: TopoDS_Shape
") FirstShape;
		const TopoDS_Shape  FirstShape ();
		%feature("compactdefaultargs") IsMovable;
		%feature("autodoc", "	* Returns true if the interactive object is movable.

	:rtype: bool
") IsMovable;
		virtual Standard_Boolean IsMovable ();
		%feature("compactdefaultargs") KindOfDimension;
		%feature("autodoc", "	* Indicates that the type of dimension is unknown.

	:rtype: AIS_KindOfDimension
") KindOfDimension;
		virtual AIS_KindOfDimension KindOfDimension ();
		%feature("compactdefaultargs") Plane;
		%feature("autodoc", "	* Returns the plane.

	:rtype: opencascade::handle<Geom_Plane>
") Plane;
		const opencascade::handle<Geom_Plane> & Plane ();
		%feature("compactdefaultargs") Position;
		%feature("autodoc", "	* Returns the position set using SetPosition.

	:rtype: gp_Pnt
") Position;
		const gp_Pnt  Position ();
		%feature("compactdefaultargs") SecondShape;
		%feature("autodoc", "	* Returns the second shape.

	:rtype: TopoDS_Shape
") SecondShape;
		const TopoDS_Shape  SecondShape ();
		%feature("compactdefaultargs") SetArrowSize;
		%feature("autodoc", "	* Allows you to provide settings for the size of the arrow theArrowSize identifying the relation between the two shapes.

	:param theArrowSize:
	:type theArrowSize: float
	:rtype: None
") SetArrowSize;
		void SetArrowSize (const Standard_Real theArrowSize);
		%feature("compactdefaultargs") SetAutomaticPosition;
		%feature("autodoc", "	:param theStatus:
	:type theStatus: bool
	:rtype: None
") SetAutomaticPosition;
		void SetAutomaticPosition (const Standard_Boolean theStatus);
		%feature("compactdefaultargs") SetBndBox;
		%feature("autodoc", "	:param theXmin:
	:type theXmin: float
	:param theYmin:
	:type theYmin: float
	:param theZmin:
	:type theZmin: float
	:param theXmax:
	:type theXmax: float
	:param theYmax:
	:type theYmax: float
	:param theZmax:
	:type theZmax: float
	:rtype: None
") SetBndBox;
		void SetBndBox (const Standard_Real theXmin,const Standard_Real theYmin,const Standard_Real theZmin,const Standard_Real theXmax,const Standard_Real theYmax,const Standard_Real theZmax);
		%feature("compactdefaultargs") SetColor;
		%feature("autodoc", "	* Allows you to provide settings for the color theColor of the lines representing the relation between the two shapes.

	:param theColor:
	:type theColor: Quantity_Color &
	:rtype: None
") SetColor;
		void SetColor (const Quantity_Color & theColor);
		%feature("compactdefaultargs") SetExtShape;
		%feature("autodoc", "	* Allows you to set the status of the extension shape by the index aIndex. The status will be one of the following: - 0 - there is no connection to a shape; - 1 - there is a connection to the first shape; - 2 - there is a connection to the second shape.

	:param theIndex:
	:type theIndex: int
	:rtype: None
") SetExtShape;
		void SetExtShape (const Standard_Integer theIndex);
		%feature("compactdefaultargs") SetFirstShape;
		%feature("autodoc", "	:param aFShape:
	:type aFShape: TopoDS_Shape &
	:rtype: void
") SetFirstShape;
		virtual void SetFirstShape (const TopoDS_Shape & aFShape);
		%feature("compactdefaultargs") SetPlane;
		%feature("autodoc", "	* Allows you to set the plane thePlane. This is used to define relations and dimensions in several daughter classes.

	:param thePlane:
	:type thePlane: opencascade::handle<Geom_Plane> &
	:rtype: None
") SetPlane;
		void SetPlane (const opencascade::handle<Geom_Plane> & thePlane);
		%feature("compactdefaultargs") SetPosition;
		%feature("autodoc", "	* Allows you to provide the objects in the relation with settings for a non-default position.

	:param thePosition:
	:type thePosition: gp_Pnt
	:rtype: None
") SetPosition;
		void SetPosition (const gp_Pnt & thePosition);
		%feature("compactdefaultargs") SetSecondShape;
		%feature("autodoc", "	* Allows you to identify the second shape aSShape relative to the first.

	:param aSShape:
	:type aSShape: TopoDS_Shape &
	:rtype: void
") SetSecondShape;
		virtual void SetSecondShape (const TopoDS_Shape & aSShape);
		%feature("compactdefaultargs") SetSymbolPrs;
		%feature("autodoc", "	* Allows you to provide settings for the symbol presentation.

	:param theSymbolPrs:
	:type theSymbolPrs: DsgPrs_ArrowSide
	:rtype: None
") SetSymbolPrs;
		void SetSymbolPrs (const DsgPrs_ArrowSide theSymbolPrs);
		%feature("compactdefaultargs") SetText;
		%feature("autodoc", "	* Allows you to provide the settings theText for text aspect.

	:param theText:
	:type theText: TCollection_ExtendedString &
	:rtype: None
") SetText;
		void SetText (const TCollection_ExtendedString & theText);
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	* Allows you to provide settings for the value theVal for each object in the relation.

	:param theVal:
	:type theVal: float
	:rtype: None
") SetValue;
		void SetValue (const Standard_Real theVal);
		%feature("compactdefaultargs") SymbolPrs;
		%feature("autodoc", "	* Returns the value of the symbol presentation. This will be one of: - AS_NONE - none - AS_FIRSTAR - first arrow - AS_LASTAR - last arrow - AS_BOTHAR - both arrows - AS_FIRSTPT - first point - AS_LASTPT - last point - AS_BOTHPT - both points - AS_FIRSTAR_LASTPT - first arrow, last point - AS_FIRSTPT_LASTAR - first point, last arrow

	:rtype: DsgPrs_ArrowSide
") SymbolPrs;
		DsgPrs_ArrowSide SymbolPrs ();
		%feature("compactdefaultargs") Text;
		%feature("autodoc", "	* Returns settings for text aspect.

	:rtype: TCollection_ExtendedString
") Text;
		const TCollection_ExtendedString & Text ();
		%feature("compactdefaultargs") Type;
		%feature("autodoc", "	:rtype: AIS_KindOfInteractive
") Type;
		AIS_KindOfInteractive Type ();
		%feature("compactdefaultargs") UnsetBndBox;
		%feature("autodoc", "	:rtype: None
") UnsetBndBox;
		void UnsetBndBox ();
		%feature("compactdefaultargs") UnsetColor;
		%feature("autodoc", "	* Allows you to remove settings for the color of the lines representing the relation between the two shapes.

	:rtype: None
") UnsetColor;
		void UnsetColor ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	* Returns the value of each object in the relation.

	:rtype: float
") Value;
		Standard_Real Value ();
};


%make_alias(AIS_Relation)

%extend AIS_Relation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor AIS_RubberBand;
class AIS_RubberBand : public AIS_InteractiveObject {
	public:
		%feature("compactdefaultargs") AIS_RubberBand;
		%feature("autodoc", "	* Constructs rubber band with default configuration: empty filling and white solid lines. @warning It binds this object with Graphic3d_ZLayerId_TopOSD layer.

	:rtype: None
") AIS_RubberBand;
		 AIS_RubberBand ();
		%feature("compactdefaultargs") AIS_RubberBand;
		%feature("autodoc", "	* Consructs the rubber band with empty filling and defined line style. @param theLineColor [in] color of rubber band lines @param theType [in] type of rubber band lines @param theLineWidth [in] width of rubber band line. By default it is 1. @warning It binds this object with Graphic3d_ZLayerId_TopOSD layer.

	:param theLineColor:
	:type theLineColor: Quantity_Color &
	:param theType:
	:type theType: Aspect_TypeOfLine
	:param theLineWidth: default value is 1.0
	:type theLineWidth: float
	:param theIsPolygonClosed: default value is Standard_True
	:type theIsPolygonClosed: bool
	:rtype: None
") AIS_RubberBand;
		 AIS_RubberBand (const Quantity_Color & theLineColor,const Aspect_TypeOfLine theType,const Standard_Real theLineWidth = 1.0,const Standard_Boolean theIsPolygonClosed = Standard_True);
		%feature("compactdefaultargs") AIS_RubberBand;
		%feature("autodoc", "	* Constructs the rubber band with defined filling and line parameters. @param theLineColor [in] color of rubber band lines @param theType [in] type of rubber band lines @param theFillColor [in] color of rubber band filling @param theTransparency [in] transparency of the filling. 0 is for opaque filling. By default it is transparent. @param theLineWidth [in] width of rubber band line. By default it is 1. @warning It binds this object with Graphic3d_ZLayerId_TopOSD layer.

	:param theLineColor:
	:type theLineColor: Quantity_Color &
	:param theType:
	:type theType: Aspect_TypeOfLine
	:param theFillColor:
	:type theFillColor: Quantity_Color
	:param theTransparency: default value is 1.0
	:type theTransparency: float
	:param theLineWidth: default value is 1.0
	:type theLineWidth: float
	:param theIsPolygonClosed: default value is Standard_True
	:type theIsPolygonClosed: bool
	:rtype: None
") AIS_RubberBand;
		 AIS_RubberBand (const Quantity_Color & theLineColor,const Aspect_TypeOfLine theType,const Quantity_Color theFillColor,const Standard_Real theTransparency = 1.0,const Standard_Real theLineWidth = 1.0,const Standard_Boolean theIsPolygonClosed = Standard_True);
		%feature("compactdefaultargs") AddPoint;
		%feature("autodoc", "	* Adds last point to the list of points. They are used to build polygon for rubber band. @sa RemoveLastPoint(), GetPoints()

	:param thePoint:
	:type thePoint: Graphic3d_Vec2i &
	:rtype: None
") AddPoint;
		void AddPoint (const Graphic3d_Vec2i & thePoint);
		%feature("compactdefaultargs") ClearPoints;
		%feature("autodoc", "	* Remove all points for the rubber band polygon.

	:rtype: None
") ClearPoints;
		void ClearPoints ();
		%feature("compactdefaultargs") FillColor;
		%feature("autodoc", "	* returns the color of rubber band filling.

	:rtype: Quantity_Color
") FillColor;
		Quantity_Color FillColor ();
		%feature("compactdefaultargs") FillTransparency;
		%feature("autodoc", "	* returns fill transparency.

	:rtype: float
") FillTransparency;
		Standard_Real FillTransparency ();
		%feature("compactdefaultargs") IsFilling;
		%feature("autodoc", "	* returns true if filling of rubber band is enabled.

	:rtype: bool
") IsFilling;
		Standard_Boolean IsFilling ();
		%feature("compactdefaultargs") IsPolygonClosed;
		%feature("autodoc", "	* returns true if automatic closing of rubber band is enabled.

	:rtype: bool
") IsPolygonClosed;
		Standard_Boolean IsPolygonClosed ();
		%feature("compactdefaultargs") LineColor;
		%feature("autodoc", "	* returns the Color attributes.

	:rtype: Quantity_Color
") LineColor;
		Quantity_Color LineColor ();
		%feature("compactdefaultargs") LineType;
		%feature("autodoc", "	* returns type of lines.

	:rtype: Aspect_TypeOfLine
") LineType;
		Aspect_TypeOfLine LineType ();
		%feature("compactdefaultargs") LineWidth;
		%feature("autodoc", "	* returns width of lines.

	:rtype: float
") LineWidth;
		Standard_Real LineWidth ();
		%feature("compactdefaultargs") Points;
		%feature("autodoc", "	* returns points for the rubber band polygon.

	:rtype: NCollection_Sequence<Graphic3d_Vec2i>
") Points;
		const NCollection_Sequence<Graphic3d_Vec2i> & Points ();
		%feature("compactdefaultargs") RemoveLastPoint;
		%feature("autodoc", "	* Remove last point from the list of points for the rubber band polygon. @sa AddPoint(), GetPoints()

	:rtype: None
") RemoveLastPoint;
		void RemoveLastPoint ();
		%feature("compactdefaultargs") SetFillColor;
		%feature("autodoc", "	* Sets color of rubber band filling.

	:param theColor:
	:type theColor: Quantity_Color &
	:rtype: None
") SetFillColor;
		void SetFillColor (const Quantity_Color & theColor);
		%feature("compactdefaultargs") SetFillTransparency;
		%feature("autodoc", "	* Sets fill transparency. @param theValue [in] the transparency value. 1.0 is for transparent background

	:param theValue:
	:type theValue: float
	:rtype: None
") SetFillTransparency;
		void SetFillTransparency (const Standard_Real theValue);
		%feature("compactdefaultargs") SetFilling;
		%feature("autodoc", "	* Enable or disable filling of rubber band.

	:param theIsFilling:
	:type theIsFilling: bool
	:rtype: None
") SetFilling;
		void SetFilling (const Standard_Boolean theIsFilling);
		%feature("compactdefaultargs") SetFilling;
		%feature("autodoc", "	* Enable filling of rubber band with defined parameters. @param theColor [in] color of filling @param theTransparency [in] transparency of the filling. 0 is for opaque filling.

	:param theColor:
	:type theColor: Quantity_Color
	:param theTransparency:
	:type theTransparency: float
	:rtype: None
") SetFilling;
		void SetFilling (const Quantity_Color theColor,const Standard_Real theTransparency);
		%feature("compactdefaultargs") SetLineColor;
		%feature("autodoc", "	* Sets color of lines for rubber band presentation.

	:param theColor:
	:type theColor: Quantity_Color &
	:rtype: None
") SetLineColor;
		void SetLineColor (const Quantity_Color & theColor);
		%feature("compactdefaultargs") SetLineType;
		%feature("autodoc", "	* Sets type of line for rubber band presentation.

	:param theType:
	:type theType: Aspect_TypeOfLine
	:rtype: None
") SetLineType;
		void SetLineType (const Aspect_TypeOfLine theType);
		%feature("compactdefaultargs") SetLineWidth;
		%feature("autodoc", "	* Sets width of line for rubber band presentation.

	:param theWidth:
	:type theWidth: float
	:rtype: None
") SetLineWidth;
		void SetLineWidth (const Standard_Real theWidth);
		%feature("compactdefaultargs") SetPolygonClosed;
		%feature("autodoc", "	* Automatically create an additional line connecting the first and the last screen points to close the boundary polyline

	:param theIsPolygonClosed:
	:type theIsPolygonClosed: bool
	:rtype: None
") SetPolygonClosed;
		void SetPolygonClosed (Standard_Boolean theIsPolygonClosed);
		%feature("compactdefaultargs") SetRectangle;
		%feature("autodoc", "	* Sets rectangle bounds.

	:param theMinX:
	:type theMinX: int
	:param theMinY:
	:type theMinY: int
	:param theMaxX:
	:type theMaxX: int
	:param theMaxY:
	:type theMaxY: int
	:rtype: None
") SetRectangle;
		void SetRectangle (const Standard_Integer theMinX,const Standard_Integer theMinY,const Standard_Integer theMaxX,const Standard_Integer theMaxY);
};


%make_alias(AIS_RubberBand)

%extend AIS_RubberBand {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor AIS_Shape;
class AIS_Shape : public AIS_InteractiveObject {
	public:
		%feature("compactdefaultargs") AIS_Shape;
		%feature("autodoc", "	* Initializes construction of the shape shap from wires, edges and vertices.

	:param shap:
	:type shap: TopoDS_Shape &
	:rtype: None
") AIS_Shape;
		 AIS_Shape (const TopoDS_Shape & shap);
		%feature("compactdefaultargs") AcceptDisplayMode;
		%feature("autodoc", "	* Return true if specified display mode is supported.

	:param theMode:
	:type theMode: int
	:rtype: bool
") AcceptDisplayMode;
		Standard_Boolean AcceptDisplayMode (const Standard_Integer theMode);
		%feature("compactdefaultargs") AcceptShapeDecomposition;
		%feature("autodoc", "	* Returns true if the Interactive Object accepts shape decomposition.

	:rtype: bool
") AcceptShapeDecomposition;
		Standard_Boolean AcceptShapeDecomposition ();
		%feature("compactdefaultargs") BoundingBox;
		%feature("autodoc", "	* Constructs a bounding box with which to reconstruct compound topological shapes for presentation.

	:rtype: Bnd_Box
") BoundingBox;
		virtual const Bnd_Box & BoundingBox ();
		%feature("compactdefaultargs") Color;
		%feature("autodoc", "	* Returns the Color attributes of the shape accordingly to the current facing model;

	:param aColor:
	:type aColor: Quantity_Color &
	:rtype: void
") Color;
		virtual void Color (Quantity_Color & aColor);
		%feature("compactdefaultargs") Material;
		%feature("autodoc", "	* Returns the NameOfMaterial attributes of the shape accordingly to the current facing model;

	:rtype: Graphic3d_NameOfMaterial
") Material;
		virtual Graphic3d_NameOfMaterial Material ();
		%feature("compactdefaultargs") OwnDeviationAngle;
		%feature("autodoc", "	* Returns true and the values of the deviation angle anAngle and the previous deviation angle aPreviousAngle. If these values are not already set, false is returned.

	:param anAngle:
	:type anAngle: float &
	:param aPreviousAngle:
	:type aPreviousAngle: float &
	:rtype: bool
") OwnDeviationAngle;
		Standard_Boolean OwnDeviationAngle (Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") OwnDeviationCoefficient;
		%feature("autodoc", "	* Returns true and the values of the deviation coefficient aCoefficient and the previous deviation coefficient aPreviousCoefficient. If these values are not already set, false is returned.

	:param aCoefficient:
	:type aCoefficient: float &
	:param aPreviousCoefficient:
	:type aPreviousCoefficient: float &
	:rtype: bool
") OwnDeviationCoefficient;
		Standard_Boolean OwnDeviationCoefficient (Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") OwnHLRDeviationAngle;
		%feature("autodoc", "	* Returns true and the values of the HLR deviation angle anAngle and of the previous HLR deviation angle aPreviousAngle. If these values are not already set, false is returned.

	:param anAngle:
	:type anAngle: float &
	:param aPreviousAngle:
	:type aPreviousAngle: float &
	:rtype: bool
") OwnHLRDeviationAngle;
		Standard_Boolean OwnHLRDeviationAngle (Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") OwnHLRDeviationCoefficient;
		%feature("autodoc", "	* Returns true and the values of the HLR deviation coefficient aCoefficient and the previous HLR deviation coefficient aPreviousCoefficient. If these values are not already set, false is returned.

	:param aCoefficient:
	:type aCoefficient: float &
	:param aPreviousCoefficient:
	:type aPreviousCoefficient: float &
	:rtype: bool
") OwnHLRDeviationCoefficient;
		Standard_Boolean OwnHLRDeviationCoefficient (Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") SelectionMode;
		%feature("autodoc", "	* Return selection mode for specified shape type.

	:param theShapeType:
	:type theShapeType: TopAbs_ShapeEnum
	:rtype: int
") SelectionMode;
		static Standard_Integer SelectionMode (const TopAbs_ShapeEnum theShapeType);
		%feature("compactdefaultargs") SelectionType;
		%feature("autodoc", "	* Return shape type for specified selection mode.

	:param theSelMode:
	:type theSelMode: int
	:rtype: TopAbs_ShapeEnum
") SelectionType;
		static TopAbs_ShapeEnum SelectionType (const Standard_Integer theSelMode);
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "	* Alias for ::SetShape().

	:param theShape:
	:type theShape: TopoDS_Shape &
	:rtype: None
") Set;
		void Set (const TopoDS_Shape & theShape);
		%feature("compactdefaultargs") SetAngleAndDeviation;
		%feature("autodoc", "	* this compute a new angle and Deviation from the value anAngle and set the values stored in myDrawer with these that become local to the shape

	:param anAngle:
	:type anAngle: float
	:rtype: None
") SetAngleAndDeviation;
		void SetAngleAndDeviation (const Standard_Real anAngle);
		%feature("compactdefaultargs") SetColor;
		%feature("autodoc", "	* Sets the color aColor in the reconstructed compound shape. Acts via the Drawer methods below on the appearance of: - free boundaries: Prs3d_Drawer_FreeBoundaryAspect, - isos: Prs3d_Drawer_UIsoAspect, Prs3dDrawer_VIsoAspect, - shared boundaries: Prs3d_Drawer_UnFreeBoundaryAspect, - shading: Prs3d_Drawer_ShadingAspect, - visible line color in hidden line mode: Prs3d_Drawer_SeenLineAspect - hidden line color in hidden line mode: Prs3d_Drawer_HiddenLineAspect.

	:param theColor:
	:type theColor: Quantity_Color &
	:rtype: void
") SetColor;
		virtual void SetColor (const Quantity_Color & theColor);
		%feature("compactdefaultargs") SetHLRAngleAndDeviation;
		%feature("autodoc", "	* this compute a new Angle and Deviation from the value anAngle for HLR and set the values stored in myDrawer for with these that become local to the shape

	:param anAngle:
	:type anAngle: float
	:rtype: None
") SetHLRAngleAndDeviation;
		void SetHLRAngleAndDeviation (const Standard_Real anAngle);
		%feature("compactdefaultargs") SetMaterial;
		%feature("autodoc", "	* Allows you to provide settings for the material aName in the reconstructed compound shape.

	:param aName:
	:type aName: Graphic3d_MaterialAspect &
	:rtype: void
") SetMaterial;
		virtual void SetMaterial (const Graphic3d_MaterialAspect & aName);
		%feature("compactdefaultargs") SetOwnDeviationAngle;
		%feature("autodoc", "	* Sets a local value for deviation angle for this specific shape.

	:rtype: bool
") SetOwnDeviationAngle;
		Standard_Boolean SetOwnDeviationAngle ();
		%feature("compactdefaultargs") SetOwnDeviationAngle;
		%feature("autodoc", "	* sets myOwnDeviationAngle field in Prs3d_Drawer & recomputes presentation

	:param anAngle:
	:type anAngle: float
	:rtype: None
") SetOwnDeviationAngle;
		void SetOwnDeviationAngle (const Standard_Real anAngle);
		%feature("compactdefaultargs") SetOwnDeviationCoefficient;
		%feature("autodoc", "	* Sets a local value for deviation coefficient for this specific shape.

	:rtype: bool
") SetOwnDeviationCoefficient;
		Standard_Boolean SetOwnDeviationCoefficient ();
		%feature("compactdefaultargs") SetOwnDeviationCoefficient;
		%feature("autodoc", "	* Sets a local value for deviation coefficient for this specific shape.

	:param aCoefficient:
	:type aCoefficient: float
	:rtype: None
") SetOwnDeviationCoefficient;
		void SetOwnDeviationCoefficient (const Standard_Real aCoefficient);
		%feature("compactdefaultargs") SetOwnHLRDeviationAngle;
		%feature("autodoc", "	* Sets a local value for HLR deviation angle for this specific shape.

	:rtype: bool
") SetOwnHLRDeviationAngle;
		Standard_Boolean SetOwnHLRDeviationAngle ();
		%feature("compactdefaultargs") SetOwnHLRDeviationAngle;
		%feature("autodoc", "	* sets myOwnHLRDeviationAngle field in Prs3d_Drawer & recomputes presentation

	:param anAngle:
	:type anAngle: float
	:rtype: None
") SetOwnHLRDeviationAngle;
		void SetOwnHLRDeviationAngle (const Standard_Real anAngle);
		%feature("compactdefaultargs") SetOwnHLRDeviationCoefficient;
		%feature("autodoc", "	* Sets a local value for HLR deviation coefficient for this specific shape.

	:rtype: bool
") SetOwnHLRDeviationCoefficient;
		Standard_Boolean SetOwnHLRDeviationCoefficient ();
		%feature("compactdefaultargs") SetOwnHLRDeviationCoefficient;
		%feature("autodoc", "	* sets myOwnHLRDeviationCoefficient field in Prs3d_Drawer & recomputes presentation

	:param aCoefficient:
	:type aCoefficient: float
	:rtype: None
") SetOwnHLRDeviationCoefficient;
		void SetOwnHLRDeviationCoefficient (const Standard_Real aCoefficient);
		%feature("compactdefaultargs") SetShape;
		%feature("autodoc", "	* Constructs an instance of the shape object theShape.

	:param theShape:
	:type theShape: TopoDS_Shape &
	:rtype: None
") SetShape;
		void SetShape (const TopoDS_Shape & theShape);
		%feature("compactdefaultargs") SetTextureOriginUV;
		%feature("autodoc", "	* Use this method to change the origin of the texture. The texel (0,0) will be mapped to the surface (myUVOrigin.X(), myUVOrigin.Y()).

	:param theOriginUV:
	:type theOriginUV: gp_Pnt2d
	:rtype: None
") SetTextureOriginUV;
		void SetTextureOriginUV (const gp_Pnt2d & theOriginUV);
		%feature("compactdefaultargs") SetTextureRepeatUV;
		%feature("autodoc", "	* Sets the number of occurrences of the texture on each face. The texture itself is parameterized in (0,1) by (0,1). Each face of the shape to be textured is parameterized in UV space (Umin,Umax) by (Vmin,Vmax).

	:param theRepeatUV:
	:type theRepeatUV: gp_Pnt2d
	:rtype: None
") SetTextureRepeatUV;
		void SetTextureRepeatUV (const gp_Pnt2d & theRepeatUV);
		%feature("compactdefaultargs") SetTextureScaleUV;
		%feature("autodoc", "	* Use this method to scale the texture (percent of the face). You can specify a scale factor for both U and V. Example: if you set ScaleU and ScaleV to 0.5 and you enable texture repeat, the texture will appear twice on the face in each direction.

	:param theScaleUV:
	:type theScaleUV: gp_Pnt2d
	:rtype: None
") SetTextureScaleUV;
		void SetTextureScaleUV (const gp_Pnt2d & theScaleUV);
		%feature("compactdefaultargs") SetTransparency;
		%feature("autodoc", "	* Sets the value aValue for transparency in the reconstructed compound shape.

	:param aValue: default value is 0.6
	:type aValue: float
	:rtype: void
") SetTransparency;
		virtual void SetTransparency (const Standard_Real aValue = 0.6);
		%feature("compactdefaultargs") SetTypeOfHLR;
		%feature("autodoc", "	* Sets the type of HLR algorithm used by the shape

	:param theTypeOfHLR:
	:type theTypeOfHLR: Prs3d_TypeOfHLR
	:rtype: None
") SetTypeOfHLR;
		void SetTypeOfHLR (const Prs3d_TypeOfHLR theTypeOfHLR);
		%feature("compactdefaultargs") SetWidth;
		%feature("autodoc", "	* Sets the value aValue for line width in the reconstructed compound shape. Changes line aspects for lines presentation.

	:param aValue:
	:type aValue: float
	:rtype: void
") SetWidth;
		virtual void SetWidth (const Standard_Real aValue);
		%feature("compactdefaultargs") Shape;
		%feature("autodoc", "	* Returns this shape object.

	:rtype: TopoDS_Shape
") Shape;
		const TopoDS_Shape  Shape ();
		%feature("compactdefaultargs") Signature;
		%feature("autodoc", "	* Returns index 0. This value refers to SHAPE from TopAbs_ShapeEnum

	:rtype: int
") Signature;
		Standard_Integer Signature ();
		%feature("compactdefaultargs") TextureOriginUV;
		%feature("autodoc", "	* Return texture origin UV position; (0, 0) by default.

	:rtype: gp_Pnt2d
") TextureOriginUV;
		const gp_Pnt2d  TextureOriginUV ();
		%feature("compactdefaultargs") TextureRepeatUV;
		%feature("autodoc", "	* @name methods to alter texture mapping properties Return texture repeat UV values; (1, 1) by default.

	:rtype: gp_Pnt2d
") TextureRepeatUV;
		const gp_Pnt2d  TextureRepeatUV ();
		%feature("compactdefaultargs") TextureScaleUV;
		%feature("autodoc", "	* Return scale factor for UV coordinates; (1, 1) by default.

	:rtype: gp_Pnt2d
") TextureScaleUV;
		const gp_Pnt2d  TextureScaleUV ();
		%feature("compactdefaultargs") Transparency;
		%feature("autodoc", "	* Returns the transparency attributes of the shape accordingly to the current facing model;

	:rtype: float
") Transparency;
		virtual Standard_Real Transparency ();
		%feature("compactdefaultargs") Type;
		%feature("autodoc", "	* Returns Object as the type of Interactive Object.

	:rtype: AIS_KindOfInteractive
") Type;
		AIS_KindOfInteractive Type ();
		%feature("compactdefaultargs") TypeOfHLR;
		%feature("autodoc", "	* Gets the type of HLR algorithm

	:rtype: Prs3d_TypeOfHLR
") TypeOfHLR;
		Prs3d_TypeOfHLR TypeOfHLR ();
		%feature("compactdefaultargs") UnsetColor;
		%feature("autodoc", "	* Removes settings for color in the reconstructed compound shape.

	:rtype: void
") UnsetColor;
		virtual void UnsetColor ();
		%feature("compactdefaultargs") UnsetMaterial;
		%feature("autodoc", "	* Removes settings for material in the reconstructed compound shape.

	:rtype: void
") UnsetMaterial;
		virtual void UnsetMaterial ();
		%feature("compactdefaultargs") UnsetTransparency;
		%feature("autodoc", "	* Removes the setting for transparency in the reconstructed compound shape.

	:rtype: void
") UnsetTransparency;
		virtual void UnsetTransparency ();
		%feature("compactdefaultargs") UnsetWidth;
		%feature("autodoc", "	* Removes the setting for line width in the reconstructed compound shape.

	:rtype: void
") UnsetWidth;
		virtual void UnsetWidth ();
		%feature("compactdefaultargs") UserAngle;
		%feature("autodoc", "	* gives back the angle initial value put by the User.

	:rtype: float
") UserAngle;
		Standard_Real UserAngle ();
		%feature("compactdefaultargs") computeHlrPresentation;
		%feature("autodoc", "	* Compute HLR presentation for specified shape.

	:param theProjector:
	:type theProjector: opencascade::handle<Prs3d_Projector> &
	:param thePrs:
	:type thePrs: opencascade::handle<Prs3d_Presentation> &
	:param theShape:
	:type theShape: TopoDS_Shape &
	:param theDrawer:
	:type theDrawer: opencascade::handle<Prs3d_Drawer> &
	:rtype: void
") computeHlrPresentation;
		static void computeHlrPresentation (const opencascade::handle<Prs3d_Projector> & theProjector,const opencascade::handle<Prs3d_Presentation> & thePrs,const TopoDS_Shape & theShape,const opencascade::handle<Prs3d_Drawer> & theDrawer);
};


%make_alias(AIS_Shape)

%extend AIS_Shape {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor AIS_SignatureFilter;
class AIS_SignatureFilter : public AIS_TypeFilter {
	public:
		%feature("compactdefaultargs") AIS_SignatureFilter;
		%feature("autodoc", "	* Initializes the signature filter, adding the signature specification, aGivenSignature, to that for type, aGivenKind, in AIS_TypeFilter.

	:param aGivenKind:
	:type aGivenKind: AIS_KindOfInteractive
	:param aGivenSignature:
	:type aGivenSignature: int
	:rtype: None
") AIS_SignatureFilter;
		 AIS_SignatureFilter (const AIS_KindOfInteractive aGivenKind,const Standard_Integer aGivenSignature);
		%feature("compactdefaultargs") IsOk;
		%feature("autodoc", "	* Returns False if the transient is not an AIS_InteractiveObject. Returns False if the signature of InteractiveObject is not the same as the stored one in the filter...

	:param anobj:
	:type anobj: opencascade::handle<SelectMgr_EntityOwner> &
	:rtype: bool
") IsOk;
		Standard_Boolean IsOk (const opencascade::handle<SelectMgr_EntityOwner> & anobj);
};


%make_alias(AIS_SignatureFilter)

%extend AIS_SignatureFilter {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor AIS_TextLabel;
class AIS_TextLabel : public AIS_InteractiveObject {
	public:
		%feature("compactdefaultargs") AIS_TextLabel;
		%feature("autodoc", "	* Default constructor

	:rtype: None
") AIS_TextLabel;
		 AIS_TextLabel ();
		%feature("compactdefaultargs") HasFlipping;
		%feature("autodoc", "	:rtype: bool
") HasFlipping;
		Standard_Boolean HasFlipping ();
		%feature("compactdefaultargs") HasOrientation3D;
		%feature("autodoc", "	* Returns true if the current text placement mode uses text orientation in the model 3D space.

	:rtype: bool
") HasOrientation3D;
		Standard_Boolean HasOrientation3D ();
		%feature("compactdefaultargs") Orientation3D;
		%feature("autodoc", "	* Returns label orientation in the model 3D space.

	:rtype: gp_Ax2
") Orientation3D;
		const gp_Ax2  Orientation3D ();
		%feature("compactdefaultargs") Position;
		%feature("autodoc", "	* Returns position.

	:rtype: gp_Pnt
") Position;
		const gp_Pnt  Position ();
		%feature("compactdefaultargs") SetAngle;
		%feature("autodoc", "	* Setup angle.

	:param theAngle:
	:type theAngle: float
	:rtype: None
") SetAngle;
		void SetAngle (const Standard_Real theAngle);
		%feature("compactdefaultargs") SetColor;
		%feature("autodoc", "	* Setup color of entire text.

	:param theColor:
	:type theColor: Quantity_Color &
	:rtype: void
") SetColor;
		virtual void SetColor (const Quantity_Color & theColor);
		%feature("compactdefaultargs") SetColorSubTitle;
		%feature("autodoc", "	* Modifies the colour of the subtitle for the TODT_SUBTITLE TextDisplayType and the colour of backgroubd for the TODT_DEKALE TextDisplayType.

	:param theColor:
	:type theColor: Quantity_Color &
	:rtype: None
") SetColorSubTitle;
		void SetColorSubTitle (const Quantity_Color & theColor);
		%feature("compactdefaultargs") SetDisplayType;
		%feature("autodoc", "	* Define the display type of the text. //! TODT_NORMAL Default display. Text only. TODT_SUBTITLE There is a subtitle under the text. TODT_DEKALE The text is displayed with a 3D style. TODT_BLEND The text is displayed in XOR. TODT_DIMENSION Dimension line under text will be invisible.

	:param theDisplayType:
	:type theDisplayType: Aspect_TypeOfDisplayText
	:rtype: None
") SetDisplayType;
		void SetDisplayType (const Aspect_TypeOfDisplayText theDisplayType);
		%feature("compactdefaultargs") SetFlipping;
		%feature("autodoc", "	:param theIsFlipping:
	:type theIsFlipping: bool
	:rtype: None
") SetFlipping;
		void SetFlipping (const Standard_Boolean theIsFlipping);
		%feature("compactdefaultargs") SetFont;
		%feature("autodoc", "	* Setup font.

	:param theFont:
	:type theFont: char *
	:rtype: None
") SetFont;
		void SetFont (const char * theFont);
		%feature("compactdefaultargs") SetFontAspect;
		%feature("autodoc", "	* Setup font aspect.

	:param theFontAspect:
	:type theFontAspect: Font_FontAspect
	:rtype: None
") SetFontAspect;
		void SetFontAspect (const Font_FontAspect theFontAspect);
		%feature("compactdefaultargs") SetHJustification;
		%feature("autodoc", "	* Setup horizontal justification.

	:param theHJust:
	:type theHJust: Graphic3d_HorizontalTextAlignment
	:rtype: None
") SetHJustification;
		void SetHJustification (const Graphic3d_HorizontalTextAlignment theHJust);
		%feature("compactdefaultargs") SetHeight;
		%feature("autodoc", "	* Setup height.

	:param theHeight:
	:type theHeight: float
	:rtype: None
") SetHeight;
		void SetHeight (const Standard_Real theHeight);
		%feature("compactdefaultargs") SetMaterial;
		%feature("autodoc", "	* Material has no effect for text label.

	:param &:
	:type &: Graphic3d_MaterialAspect
	:rtype: None
") SetMaterial;
		void SetMaterial (const Graphic3d_MaterialAspect &);
		%feature("compactdefaultargs") SetOrientation3D;
		%feature("autodoc", "	* Setup label orientation in the model 3D space.

	:param theOrientation:
	:type theOrientation: gp_Ax2
	:rtype: None
") SetOrientation3D;
		void SetOrientation3D (const gp_Ax2 & theOrientation);
		%feature("compactdefaultargs") SetPosition;
		%feature("autodoc", "	* Setup position.

	:param thePosition:
	:type thePosition: gp_Pnt
	:rtype: None
") SetPosition;
		void SetPosition (const gp_Pnt & thePosition);
		%feature("compactdefaultargs") SetText;
		%feature("autodoc", "	* Setup text.

	:param theText:
	:type theText: TCollection_ExtendedString &
	:rtype: None
") SetText;
		void SetText (const TCollection_ExtendedString & theText);
		%feature("compactdefaultargs") SetTransparency;
		%feature("autodoc", "	* Setup transparency within [0, 1] range.

	:param theValue:
	:type theValue: float
	:rtype: void
") SetTransparency;
		virtual void SetTransparency (const Standard_Real theValue);
		%feature("compactdefaultargs") SetVJustification;
		%feature("autodoc", "	* Setup vertical justification.

	:param theVJust:
	:type theVJust: Graphic3d_VerticalTextAlignment
	:rtype: None
") SetVJustification;
		void SetVJustification (const Graphic3d_VerticalTextAlignment theVJust);
		%feature("compactdefaultargs") SetZoomable;
		%feature("autodoc", "	* Setup zoomable property.

	:param theIsZoomable:
	:type theIsZoomable: bool
	:rtype: None
") SetZoomable;
		void SetZoomable (const Standard_Boolean theIsZoomable);
		%feature("compactdefaultargs") UnsetOrientation3D;
		%feature("autodoc", "	* Reset label orientation in the model 3D space.

	:rtype: None
") UnsetOrientation3D;
		void UnsetOrientation3D ();
		%feature("compactdefaultargs") UnsetTransparency;
		%feature("autodoc", "	* Removes the transparency setting.

	:rtype: None
") UnsetTransparency;
		void UnsetTransparency ();
};


%make_alias(AIS_TextLabel)

%extend AIS_TextLabel {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor AIS_Triangulation;
class AIS_Triangulation : public AIS_InteractiveObject {
	public:
		%feature("compactdefaultargs") AIS_Triangulation;
		%feature("autodoc", "	* Constructs the Triangulation display object

	:param aTriangulation:
	:type aTriangulation: opencascade::handle<Poly_Triangulation> &
	:rtype: None
") AIS_Triangulation;
		 AIS_Triangulation (const opencascade::handle<Poly_Triangulation> & aTriangulation);
		%feature("compactdefaultargs") GetColors;
		%feature("autodoc", "	* Get the color for each node. Each 32-bit color is Alpha << 24 + Blue << 16 + Green << 8 + Red

	:rtype: opencascade::handle<TColStd_HArray1OfInteger>
") GetColors;
		opencascade::handle<TColStd_HArray1OfInteger> GetColors ();
		%feature("compactdefaultargs") GetTriangulation;
		%feature("autodoc", "	* Returns Poly_Triangulation .

	:rtype: opencascade::handle<Poly_Triangulation>
") GetTriangulation;
		opencascade::handle<Poly_Triangulation> GetTriangulation ();
		%feature("compactdefaultargs") HasVertexColors;
		%feature("autodoc", "	* Returns true if triangulation has vertex colors.

	:rtype: bool
") HasVertexColors;
		Standard_Boolean HasVertexColors ();
		%feature("compactdefaultargs") SetColors;
		%feature("autodoc", "	* Set the color for each node. Each 32-bit color is Alpha << 24 + Blue << 16 + Green << 8 + Red Order of color components is essential for further usage by OpenGL

	:param aColor:
	:type aColor: opencascade::handle<TColStd_HArray1OfInteger> &
	:rtype: None
") SetColors;
		void SetColors (const opencascade::handle<TColStd_HArray1OfInteger> & aColor);
		%feature("compactdefaultargs") SetTransparency;
		%feature("autodoc", "	* Sets the value aValue for transparency in the reconstructed compound shape.

	:param aValue: default value is 0.6
	:type aValue: float
	:rtype: void
") SetTransparency;
		virtual void SetTransparency (const Standard_Real aValue = 0.6);
		%feature("compactdefaultargs") SetTriangulation;
		%feature("autodoc", "	:param aTriangulation:
	:type aTriangulation: opencascade::handle<Poly_Triangulation> &
	:rtype: None
") SetTriangulation;
		void SetTriangulation (const opencascade::handle<Poly_Triangulation> & aTriangulation);
		%feature("compactdefaultargs") UnsetTransparency;
		%feature("autodoc", "	* Removes the setting for transparency in the reconstructed compound shape.

	:rtype: void
") UnsetTransparency;
		virtual void UnsetTransparency ();
};


%make_alias(AIS_Triangulation)

%extend AIS_Triangulation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor AIS_Trihedron;
class AIS_Trihedron : public AIS_InteractiveObject {
	public:
		%feature("compactdefaultargs") AIS_Trihedron;
		%feature("autodoc", "	* Initializes a trihedron entity.

	:param theComponent:
	:type theComponent: opencascade::handle<Geom_Axis2Placement> &
	:rtype: None
") AIS_Trihedron;
		 AIS_Trihedron (const opencascade::handle<Geom_Axis2Placement> & theComponent);
		%feature("compactdefaultargs") AcceptDisplayMode;
		%feature("autodoc", "	* Returns true if the display mode selected, aMode, is valid for trihedron datums.

	:param theMode:
	:type theMode: int
	:rtype: bool
") AcceptDisplayMode;
		Standard_Boolean AcceptDisplayMode (const Standard_Integer theMode);
		%feature("compactdefaultargs") ArrowColor;
		%feature("autodoc", "	* Returns trihedron arrow color

	:rtype: Quantity_Color
") ArrowColor;
		Quantity_Color ArrowColor ();
		%feature("compactdefaultargs") ClearSelected;
		%feature("autodoc", "	* Method which clear all selected owners belonging to this selectable object ( for fast presentation draw ).

	:rtype: void
") ClearSelected;
		virtual void ClearSelected ();
		%feature("compactdefaultargs") Component;
		%feature("autodoc", "	* Returns the right-handed coordinate system set in SetComponent.

	:rtype: opencascade::handle<Geom_Axis2Placement>
") Component;
		const opencascade::handle<Geom_Axis2Placement> & Component ();
		%feature("compactdefaultargs") DatumDisplayMode;
		%feature("autodoc", "	* Returns datum display mode.

	:rtype: Prs3d_DatumMode
") DatumDisplayMode;
		Prs3d_DatumMode DatumDisplayMode ();
		%feature("compactdefaultargs") DatumPartColor;
		%feature("autodoc", "	* Returns color of datum part: origin or some of trihedron axes.

	:param thePart:
	:type thePart: Prs3d_DatumParts
	:rtype: Quantity_Color
") DatumPartColor;
		Quantity_Color DatumPartColor (Prs3d_DatumParts thePart);
		%feature("compactdefaultargs") HasArrowColor;
		%feature("autodoc", "	* Returns true if trihedron has own arrow color

	:rtype: bool
") HasArrowColor;
		Standard_Boolean HasArrowColor ();
		%feature("compactdefaultargs") HasOwnSize;
		%feature("autodoc", "	* Returns true if the trihedron object has a size other than the default size of 100 mm. along each axis.

	:rtype: bool
") HasOwnSize;
		Standard_Boolean HasOwnSize ();
		%feature("compactdefaultargs") HasTextColor;
		%feature("autodoc", "	* Returns true if trihedron has own text color

	:rtype: bool
") HasTextColor;
		Standard_Boolean HasTextColor ();
		%feature("compactdefaultargs") HilightOwnerWithColor;
		%feature("autodoc", "	* Method which hilight an owner belonging to this selectable object ( for fast presentation draw ).

	:param thePM:
	:type thePM: opencascade::handle<PrsMgr_PresentationManager3d> &
	:param theStyle:
	:type theStyle: opencascade::handle<Prs3d_Drawer> &
	:param theOwner:
	:type theOwner: opencascade::handle<SelectMgr_EntityOwner> &
	:rtype: void
") HilightOwnerWithColor;
		virtual void HilightOwnerWithColor (const opencascade::handle<PrsMgr_PresentationManager3d> & thePM,const opencascade::handle<Prs3d_Drawer> & theStyle,const opencascade::handle<SelectMgr_EntityOwner> & theOwner);
		%feature("compactdefaultargs") HilightSelected;
		%feature("autodoc", "	* Method which draws selected owners ( for fast presentation draw ).

	:param thePM:
	:type thePM: opencascade::handle<PrsMgr_PresentationManager3d> &
	:param theOwners:
	:type theOwners: SelectMgr_SequenceOfOwner &
	:rtype: void
") HilightSelected;
		virtual void HilightSelected (const opencascade::handle<PrsMgr_PresentationManager3d> & thePM,const SelectMgr_SequenceOfOwner & theOwners);
		%feature("compactdefaultargs") IsAutoHilight;
		%feature("autodoc", "	* Disables auto highlighting to use HilightSelected() and HilightOwnerWithColor() overridden methods.

	:rtype: bool
") IsAutoHilight;
		Standard_Boolean IsAutoHilight ();
		%feature("compactdefaultargs") Label;
		%feature("autodoc", "	* Returns text of axis. Parameter thePart should be XAxis, YAxis or ZAxis

	:param thePart:
	:type thePart: Prs3d_DatumParts
	:rtype: TCollection_ExtendedString
") Label;
		const TCollection_ExtendedString & Label (Prs3d_DatumParts thePart);
		%feature("compactdefaultargs") SelectionPriority;
		%feature("autodoc", "	* Sets priority of selection for owner of the given type

	:param thePart:
	:type thePart: Prs3d_DatumParts
	:rtype: int
") SelectionPriority;
		Standard_Integer SelectionPriority (Prs3d_DatumParts thePart);
		%feature("compactdefaultargs") SetArrowColor;
		%feature("autodoc", "	* Sets color of arrow of trihedron axes. Used only in wireframe mode

	:param theColor:
	:type theColor: Quantity_Color &
	:rtype: None
") SetArrowColor;
		void SetArrowColor (const Quantity_Color & theColor);
		%feature("compactdefaultargs") SetAxisColor;
		%feature("autodoc", "	* Sets color of z-axis. //Standard_DEPRECATED('This method is deprecated - SetColor() should be called instead')

	:param theColor:
	:type theColor: Quantity_Color &
	:rtype: None
") SetAxisColor;
		void SetAxisColor (const Quantity_Color & theColor);
		%feature("compactdefaultargs") SetColor;
		%feature("autodoc", "	* Sets the color theColor for this trihedron object, it changes color of axes.

	:param theColor:
	:type theColor: Quantity_Color &
	:rtype: None
") SetColor;
		void SetColor (const Quantity_Color & theColor);
		%feature("compactdefaultargs") SetComponent;
		%feature("autodoc", "	* Constructs the right-handed coordinate system aComponent.

	:param theComponent:
	:type theComponent: opencascade::handle<Geom_Axis2Placement> &
	:rtype: None
") SetComponent;
		void SetComponent (const opencascade::handle<Geom_Axis2Placement> & theComponent);
		%feature("compactdefaultargs") SetDatumDisplayMode;
		%feature("autodoc", "	* Sets Shading or Wireframe display mode, triangle or segment graphic group is used relatively.

	:param theMode:
	:type theMode: Prs3d_DatumMode
	:rtype: None
") SetDatumDisplayMode;
		void SetDatumDisplayMode (Prs3d_DatumMode theMode);
		%feature("compactdefaultargs") SetDatumPartColor;
		%feature("autodoc", "	* Sets color of datum part: origin or some of trihedron axes. If presentation is shading mode, this color is set for both sides of facing model

	:param thePart:
	:type thePart: Prs3d_DatumParts
	:param theColor:
	:type theColor: Quantity_Color &
	:rtype: None
") SetDatumPartColor;
		void SetDatumPartColor (const Prs3d_DatumParts thePart,const Quantity_Color & theColor);
		%feature("compactdefaultargs") SetDrawArrows;
		%feature("autodoc", "	* Sets whether to draw the arrows in visualization

	:param theToDraw:
	:type theToDraw: bool
	:rtype: None
") SetDrawArrows;
		void SetDrawArrows (const Standard_Boolean theToDraw);
		%feature("compactdefaultargs") SetLabel;
		%feature("autodoc", "	* Sets text label for trihedron axis. Parameter thePart should be XAxis, YAxis or ZAxis

	:param thePart:
	:type thePart: Prs3d_DatumParts
	:param thePriority:
	:type thePriority: TCollection_ExtendedString &
	:rtype: None
") SetLabel;
		void SetLabel (const Prs3d_DatumParts thePart,const TCollection_ExtendedString & thePriority);
		%feature("compactdefaultargs") SetOriginColor;
		%feature("autodoc", "	* Sets color of origin. //Standard_DEPRECATED('This method is deprecated - SetColor() should be called instead')

	:param theColor:
	:type theColor: Quantity_Color &
	:rtype: None
") SetOriginColor;
		void SetOriginColor (const Quantity_Color & theColor);
		%feature("compactdefaultargs") SetSelectionPriority;
		%feature("autodoc", "	* Sets priority of selection for owner of the given type

	:param thePart:
	:type thePart: Prs3d_DatumParts
	:param thePriority:
	:type thePriority: int
	:rtype: None
") SetSelectionPriority;
		void SetSelectionPriority (Prs3d_DatumParts thePart,Standard_Integer thePriority);
		%feature("compactdefaultargs") SetSize;
		%feature("autodoc", "	* Sets the size aValue for the trihedron object. The default value is 100 mm.

	:param theValue:
	:type theValue: float
	:rtype: None
") SetSize;
		void SetSize (const Standard_Real theValue);
		%feature("compactdefaultargs") SetTextColor;
		%feature("autodoc", "	* Sets color of label of trihedron axes.

	:param theColor:
	:type theColor: Quantity_Color &
	:rtype: None
") SetTextColor;
		void SetTextColor (const Quantity_Color & theColor);
		%feature("compactdefaultargs") SetXAxisColor;
		%feature("autodoc", "	* Sets color of x-axis. //Standard_DEPRECATED('This method is deprecated - SetColor() should be called instead')

	:param theColor:
	:type theColor: Quantity_Color &
	:rtype: None
") SetXAxisColor;
		void SetXAxisColor (const Quantity_Color & theColor);
		%feature("compactdefaultargs") SetYAxisColor;
		%feature("autodoc", "	* Sets color of y-axis. //Standard_DEPRECATED('This method is deprecated - SetColor() should be called instead')

	:param theColor:
	:type theColor: Quantity_Color &
	:rtype: None
") SetYAxisColor;
		void SetYAxisColor (const Quantity_Color & theColor);
		%feature("compactdefaultargs") Signature;
		%feature("autodoc", "	* Returns index 3, selection of the planes XOY, YOZ, XOZ.

	:rtype: int
") Signature;
		Standard_Integer Signature ();
		%feature("compactdefaultargs") Size;
		%feature("autodoc", "	:rtype: float
") Size;
		Standard_Real Size ();
		%feature("compactdefaultargs") TextColor;
		%feature("autodoc", "	* Returns trihedron text color

	:rtype: Quantity_Color
") TextColor;
		Quantity_Color TextColor ();
		%feature("compactdefaultargs") ToDrawArrows;
		%feature("autodoc", "	* Returns true if arrows are to be drawn

	:rtype: bool
") ToDrawArrows;
		Standard_Boolean ToDrawArrows ();
		%feature("compactdefaultargs") Type;
		%feature("autodoc", "	* Indicates that the type of Interactive Object is datum.

	:rtype: AIS_KindOfInteractive
") Type;
		AIS_KindOfInteractive Type ();
		%feature("compactdefaultargs") UnsetColor;
		%feature("autodoc", "	* Removes the settings for color.

	:rtype: void
") UnsetColor;
		virtual void UnsetColor ();
		%feature("compactdefaultargs") UnsetSize;
		%feature("autodoc", "	* Removes any non-default settings for size of this trihedron object. If the object has 1 color, the default size of the drawer is reproduced, otherwise DatumAspect becomes null.

	:rtype: None
") UnsetSize;
		void UnsetSize ();
};


%make_alias(AIS_Trihedron)

%extend AIS_Trihedron {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor AIS_ViewCube;
class AIS_ViewCube : public AIS_InteractiveObject {
	public:
		class IntegerHasher {};
		%feature("compactdefaultargs") AIS_ViewCube;
		%feature("autodoc", "	* Empty constructor.

	:rtype: None
") AIS_ViewCube;
		 AIS_ViewCube ();
		%feature("compactdefaultargs") AcceptDisplayMode;
		%feature("autodoc", "	* @name Presentation computation Return True for supported display mode.

	:param theMode:
	:type theMode: int
	:rtype: bool
") AcceptDisplayMode;
		Standard_Boolean AcceptDisplayMode (const Standard_Integer theMode);
		%feature("compactdefaultargs") AxesPadding;
		%feature("autodoc", "	* Return padding between axes and 3D part (box); 10 by default.

	:rtype: float
") AxesPadding;
		Standard_Real AxesPadding ();
		%feature("compactdefaultargs") AxisLabel;
		%feature("autodoc", "	* Return axes labels or empty string if undefined. Default labels: X, Y, Z.

	:param theAxis:
	:type theAxis: Prs3d_DatumParts
	:rtype: TCollection_AsciiString
") AxisLabel;
		TCollection_AsciiString AxisLabel (Prs3d_DatumParts theAxis);
		%feature("compactdefaultargs") BoxColor;
		%feature("autodoc", "	* Return value of front color for the 3D part of object.

	:rtype: Quantity_Color
") BoxColor;
		const Quantity_Color & BoxColor ();
		%feature("compactdefaultargs") BoxCornerMinSize;
		%feature("autodoc", "	* Return minimal size of box corner; 2 by default.

	:rtype: float
") BoxCornerMinSize;
		Standard_Real BoxCornerMinSize ();
		%feature("compactdefaultargs") BoxCornerStyle;
		%feature("autodoc", "	* Return shading style of box corners.

	:rtype: opencascade::handle<Prs3d_ShadingAspect>
") BoxCornerStyle;
		const opencascade::handle<Prs3d_ShadingAspect> & BoxCornerStyle ();
		%feature("compactdefaultargs") BoxEdgeGap;
		%feature("autodoc", "	* Return gap between box edges and box sides; 0 by default.

	:rtype: float
") BoxEdgeGap;
		Standard_Real BoxEdgeGap ();
		%feature("compactdefaultargs") BoxEdgeMinSize;
		%feature("autodoc", "	* Return minimal size of box edge; 2 by default.

	:rtype: float
") BoxEdgeMinSize;
		Standard_Real BoxEdgeMinSize ();
		%feature("compactdefaultargs") BoxEdgeStyle;
		%feature("autodoc", "	* Return shading style of box edges.

	:rtype: opencascade::handle<Prs3d_ShadingAspect>
") BoxEdgeStyle;
		const opencascade::handle<Prs3d_ShadingAspect> & BoxEdgeStyle ();
		%feature("compactdefaultargs") BoxFacetExtension;
		%feature("autodoc", "	* Return box facet extension to edge/corner facet split; 10 by default.

	:rtype: float
") BoxFacetExtension;
		Standard_Real BoxFacetExtension ();
		%feature("compactdefaultargs") BoxSideLabel;
		%feature("autodoc", "	* Return box side label or empty string if undefined. Default labels: FRONT, BACK, LEFT, RIGHT, TOP, BOTTOM.

	:param theSide:
	:type theSide: V3d_TypeOfOrientation
	:rtype: TCollection_AsciiString
") BoxSideLabel;
		TCollection_AsciiString BoxSideLabel (V3d_TypeOfOrientation theSide);
		%feature("compactdefaultargs") BoxSideStyle;
		%feature("autodoc", "	* @name Style management API Return shading style of box sides.

	:rtype: opencascade::handle<Prs3d_ShadingAspect>
") BoxSideStyle;
		const opencascade::handle<Prs3d_ShadingAspect> & BoxSideStyle ();
		%feature("compactdefaultargs") BoxTransparency;
		%feature("autodoc", "	* Return transparency for 3D part of object.

	:rtype: float
") BoxTransparency;
		Standard_Real BoxTransparency ();
		%feature("compactdefaultargs") ClearSelected;
		%feature("autodoc", "	* Method which clear all selected owners belonging to this selectable object. @warning this object does not support selection.

	:rtype: None
") ClearSelected;
		void ClearSelected ();
		%feature("compactdefaultargs") Compute;
		%feature("autodoc", "	* Compute 3D part of View Cube. @param thePrsMgr [in] presentation manager. @param thePrs [in] input presentation that is to be filled with flat presentation primitives. @param theMode [in] display mode. @warning this object accept only 0 display mode.

	:param thePrsMgr:
	:type thePrsMgr: opencascade::handle<PrsMgr_PresentationManager3d> &
	:param thePrs:
	:type thePrs: opencascade::handle<Prs3d_Presentation> &
	:param theMode: default value is 0
	:type theMode: int
	:rtype: void
") Compute;
		virtual void Compute (const opencascade::handle<PrsMgr_PresentationManager3d> & thePrsMgr,const opencascade::handle<Prs3d_Presentation> & thePrs,const Standard_Integer theMode = 0);
		%feature("compactdefaultargs") ComputeSelection;
		%feature("autodoc", "	* Redefine computing of sensitive entities for View Cube. @param theSelection [in] input selection object that is to be filled with sensitive entities. @param theMode [in] selection mode. @warning object accepts only 0 selection mode.

	:param theSelection:
	:type theSelection: opencascade::handle<SelectMgr_Selection> &
	:param theMode:
	:type theMode: int
	:rtype: void
") ComputeSelection;
		virtual void ComputeSelection (const opencascade::handle<SelectMgr_Selection> & theSelection,const Standard_Integer theMode);
		%feature("compactdefaultargs") Duration;
		%feature("autodoc", "	* @name animation methods Return duration of animation in seconds; 0.5 sec by default

	:rtype: float
") Duration;
		Standard_Real Duration ();
		%feature("compactdefaultargs") Font;
		%feature("autodoc", "	* Return font name that is used for displaying of sides and axes text. Alias for: @code Attributes()->TextAspect()->Aspect()->SetFont() @endcode

	:rtype: TCollection_AsciiString
") Font;
		const TCollection_AsciiString & Font ();
		%feature("compactdefaultargs") FontHeight;
		%feature("autodoc", "	* Return height of font

	:rtype: float
") FontHeight;
		Standard_Real FontHeight ();
		%feature("compactdefaultargs") GlobalSelOwner;
		%feature("autodoc", "	* Global selection has no meaning for this class.

	:rtype: opencascade::handle<SelectMgr_EntityOwner>
") GlobalSelOwner;
		opencascade::handle<SelectMgr_EntityOwner> GlobalSelOwner ();
		%feature("compactdefaultargs") HandleClick;
		%feature("autodoc", "	* Perform camera transformation corresponding to the input detected owner.

	:param theOwner:
	:type theOwner: opencascade::handle<AIS_ViewCubeOwner> &
	:rtype: void
") HandleClick;
		virtual void HandleClick (const opencascade::handle<AIS_ViewCubeOwner> & theOwner);
		%feature("compactdefaultargs") HasAnimation;
		%feature("autodoc", "	* returns True if View Cube has unfinished animation of view camera.

	:rtype: bool
") HasAnimation;
		Standard_Boolean HasAnimation ();
		%feature("compactdefaultargs") HilightOwnerWithColor;
		%feature("autodoc", "	* Method which highlights input owner belonging to this selectable object. @param thePM [in] presentation manager @param theStyle [in] style for dynamic highlighting. @param theOwner [in] input entity owner.

	:param thePM:
	:type thePM: opencascade::handle<PrsMgr_PresentationManager3d> &
	:param theStyle:
	:type theStyle: opencascade::handle<Prs3d_Drawer> &
	:param theOwner:
	:type theOwner: opencascade::handle<SelectMgr_EntityOwner> &
	:rtype: void
") HilightOwnerWithColor;
		virtual void HilightOwnerWithColor (const opencascade::handle<PrsMgr_PresentationManager3d> & thePM,const opencascade::handle<Prs3d_Drawer> & theStyle,const opencascade::handle<SelectMgr_EntityOwner> & theOwner);
		%feature("compactdefaultargs") HilightSelected;
		%feature("autodoc", "	* Method which draws selected owners.

	:param thePM:
	:type thePM: opencascade::handle<PrsMgr_PresentationManager3d> &
	:param theSeq:
	:type theSeq: SelectMgr_SequenceOfOwner &
	:rtype: void
") HilightSelected;
		virtual void HilightSelected (const opencascade::handle<PrsMgr_PresentationManager3d> & thePM,const SelectMgr_SequenceOfOwner & theSeq);
		%feature("compactdefaultargs") InnerColor;
		%feature("autodoc", "	* Return color of sides back material.

	:rtype: Quantity_Color
") InnerColor;
		const Quantity_Color & InnerColor ();
		%feature("compactdefaultargs") IsAutoHilight;
		%feature("autodoc", "	* Disables auto highlighting to use HilightSelected() and HilightOwnerWithColor() overridden methods.

	:rtype: bool
") IsAutoHilight;
		Standard_Boolean IsAutoHilight ();
		%feature("compactdefaultargs") IsBoxCorner;
		%feature("autodoc", "	* Return True if specified orientation belongs to box corner (vertex).

	:param theOrient:
	:type theOrient: V3d_TypeOfOrientation
	:rtype: bool
") IsBoxCorner;
		static bool IsBoxCorner (V3d_TypeOfOrientation theOrient);
		%feature("compactdefaultargs") IsBoxEdge;
		%feature("autodoc", "	* Return True if specified orientation belongs to box edge.

	:param theOrient:
	:type theOrient: V3d_TypeOfOrientation
	:rtype: bool
") IsBoxEdge;
		static bool IsBoxEdge (V3d_TypeOfOrientation theOrient);
		%feature("compactdefaultargs") IsBoxSide;
		%feature("autodoc", "	* ////DEFINE_STANDARD_RTTIEXT(AIS_ViewCube, AIS_InteractiveObject) Return True if specified orientation belongs to box side.

	:param theOrient:
	:type theOrient: V3d_TypeOfOrientation
	:rtype: bool
") IsBoxSide;
		static bool IsBoxSide (V3d_TypeOfOrientation theOrient);
		%feature("compactdefaultargs") IsFixedAnimationLoop;
		%feature("autodoc", "	* Return True if camera animation should be done in uninterruptible loop; True by default.

	:rtype: bool
") IsFixedAnimationLoop;
		Standard_Boolean IsFixedAnimationLoop ();
		%feature("compactdefaultargs") IsYup;
		%feature("autodoc", "	* Return True if application expects Y-up viewer orientation instead of Z-up; False by default.

	:rtype: bool
") IsYup;
		Standard_Boolean IsYup ();
		%feature("compactdefaultargs") ResetStyles;
		%feature("autodoc", "	* Reset all size and style parameters to default. @warning It doesn't reset position of View Cube

	:rtype: None
") ResetStyles;
		void ResetStyles ();
		%feature("compactdefaultargs") RoundRadius;
		%feature("autodoc", "	* Return relative radius of side corners (round rectangle); 0.0 by default. The value in within [0, 0.5] range meaning absolute radius = RoundRadius() / Size().

	:rtype: float
") RoundRadius;
		Standard_Real RoundRadius ();
		%feature("compactdefaultargs") SetAutoStartAnimation;
		%feature("autodoc", "	* Enable/disable automatic camera transformation on selection (highlighting). The automatic logic can be disabled if application wants performing action manually basing on picking results (AIS_ViewCubeOwner).

	:param theToEnable:
	:type theToEnable: bool
	:rtype: None
") SetAutoStartAnimation;
		void SetAutoStartAnimation (bool theToEnable);
		%feature("compactdefaultargs") SetAxesLabels;
		%feature("autodoc", "	* Set axes labels.

	:param theX:
	:type theX: TCollection_AsciiString &
	:param theY:
	:type theY: TCollection_AsciiString &
	:param theZ:
	:type theZ: TCollection_AsciiString &
	:rtype: None
") SetAxesLabels;
		void SetAxesLabels (const TCollection_AsciiString & theX,const TCollection_AsciiString & theY,const TCollection_AsciiString & theZ);
		%feature("compactdefaultargs") SetAxesPadding;
		%feature("autodoc", "	* Set new value of padding between axes and 3D part (box).

	:param theValue:
	:type theValue: float
	:rtype: None
") SetAxesPadding;
		void SetAxesPadding (Standard_Real theValue);
		%feature("compactdefaultargs") SetBoxColor;
		%feature("autodoc", "	* Set new value of front color for the 3D part of object. @param theColor [in] input color value.

	:param theColor:
	:type theColor: Quantity_Color &
	:rtype: None
") SetBoxColor;
		void SetBoxColor (const Quantity_Color & theColor);
		%feature("compactdefaultargs") SetBoxCornerMinSize;
		%feature("autodoc", "	* Set new value of box corner minimal size.

	:param theValue:
	:type theValue: float
	:rtype: None
") SetBoxCornerMinSize;
		void SetBoxCornerMinSize (Standard_Real theValue);
		%feature("compactdefaultargs") SetBoxEdgeGap;
		%feature("autodoc", "	* Set new value of box edges gap.

	:param theValue:
	:type theValue: float
	:rtype: None
") SetBoxEdgeGap;
		void SetBoxEdgeGap (Standard_Real theValue);
		%feature("compactdefaultargs") SetBoxEdgeMinSize;
		%feature("autodoc", "	* Set new value of box edge minimal size.

	:param theValue:
	:type theValue: float
	:rtype: None
") SetBoxEdgeMinSize;
		void SetBoxEdgeMinSize (Standard_Real theValue);
		%feature("compactdefaultargs") SetBoxFacetExtension;
		%feature("autodoc", "	* Set new value of box facet extension.

	:param theValue:
	:type theValue: float
	:rtype: None
") SetBoxFacetExtension;
		void SetBoxFacetExtension (Standard_Real theValue);
		%feature("compactdefaultargs") SetBoxSideLabel;
		%feature("autodoc", "	* Set box side label.

	:param theSide:
	:type theSide: V3d_TypeOfOrientation
	:param theLabel:
	:type theLabel: TCollection_AsciiString &
	:rtype: None
") SetBoxSideLabel;
		void SetBoxSideLabel (const V3d_TypeOfOrientation theSide,const TCollection_AsciiString & theLabel);
		%feature("compactdefaultargs") SetBoxTransparency;
		%feature("autodoc", "	* Set new value of transparency for 3D part of object. @param theValue [in] input transparency value

	:param theValue:
	:type theValue: float
	:rtype: None
") SetBoxTransparency;
		void SetBoxTransparency (Standard_Real theValue);
		%feature("compactdefaultargs") SetColor;
		%feature("autodoc", "	* Set new value of color for the whole object. @param theColor [in] input color value.

	:param theColor:
	:type theColor: Quantity_Color &
	:rtype: None
") SetColor;
		void SetColor (const Quantity_Color & theColor);
		%feature("compactdefaultargs") SetDrawAxes;
		%feature("autodoc", "	* Enable/disable drawing of trihedron.

	:param theValue:
	:type theValue: bool
	:rtype: None
") SetDrawAxes;
		void SetDrawAxes (Standard_Boolean theValue);
		%feature("compactdefaultargs") SetDrawEdges;
		%feature("autodoc", "	* Enable/disable drawing of edges of View Cube.

	:param theValue:
	:type theValue: bool
	:rtype: None
") SetDrawEdges;
		void SetDrawEdges (Standard_Boolean theValue);
		%feature("compactdefaultargs") SetDrawVertices;
		%feature("autodoc", "	* Enable/disable drawing of vertices (corners) of View Cube.

	:param theValue:
	:type theValue: bool
	:rtype: None
") SetDrawVertices;
		void SetDrawVertices (Standard_Boolean theValue);
		%feature("compactdefaultargs") SetDuration;
		%feature("autodoc", "	* Set duration of animation. @param theValue [in] input value of duration in seconds

	:param theValue:
	:type theValue: float
	:rtype: None
") SetDuration;
		void SetDuration (Standard_Real theValue);
		%feature("compactdefaultargs") SetFitSelected;
		%feature("autodoc", "	* Set if animation should fit selected objects or to fit entire scene.

	:param theToFitSelected:
	:type theToFitSelected: bool
	:rtype: None
") SetFitSelected;
		void SetFitSelected (Standard_Boolean theToFitSelected);
		%feature("compactdefaultargs") SetFixedAnimationLoop;
		%feature("autodoc", "	* Set if camera animation should be done in uninterruptible loop.

	:param theToEnable:
	:type theToEnable: bool
	:rtype: None
") SetFixedAnimationLoop;
		void SetFixedAnimationLoop (bool theToEnable);
		%feature("compactdefaultargs") SetFont;
		%feature("autodoc", "	* Set font name that is used for displaying of sides and axes text. Alias for: @code Attributes()->TextAspect()->SetFont() @endcode

	:param theFont:
	:type theFont: TCollection_AsciiString &
	:rtype: None
") SetFont;
		void SetFont (const TCollection_AsciiString & theFont);
		%feature("compactdefaultargs") SetFontHeight;
		%feature("autodoc", "	* Change font height. Alias for: @code Attributes()->TextAspect()->SetHeight() @endcode

	:param theValue:
	:type theValue: float
	:rtype: None
") SetFontHeight;
		void SetFontHeight (Standard_Real theValue);
		%feature("compactdefaultargs") SetInnerColor;
		%feature("autodoc", "	* Set color of sides back material. Alias for: @code Attributes()->ShadingAspect()->Aspect()->ChangeBackMaterial().SetColor() @endcode

	:param theColor:
	:type theColor: Quantity_Color &
	:rtype: None
") SetInnerColor;
		void SetInnerColor (const Quantity_Color & theColor);
		%feature("compactdefaultargs") SetMaterial;
		%feature("autodoc", "	* Sets the material for the interactive object.

	:param theMat:
	:type theMat: Graphic3d_MaterialAspect &
	:rtype: None
") SetMaterial;
		void SetMaterial (const Graphic3d_MaterialAspect & theMat);
		%feature("compactdefaultargs") SetResetCamera;
		%feature("autodoc", "	* Set if new camera Up direction should be always set to default value for a new camera Direction.

	:param theToReset:
	:type theToReset: bool
	:rtype: None
") SetResetCamera;
		void SetResetCamera (Standard_Boolean theToReset);
		%feature("compactdefaultargs") SetRoundRadius;
		%feature("autodoc", "	* Set relative radius of View Cube sides corners (round rectangle). The value should be within [0, 0.5] range.

	:param theValue:
	:type theValue: float
	:rtype: None
") SetRoundRadius;
		void SetRoundRadius (const Standard_Real theValue);
		%feature("compactdefaultargs") SetSize;
		%feature("autodoc", "	* Sets size (width and height) of View cube sides. @param theToAdaptAnother if True, then other parameters will be adapted to specified size

	:param theValue:
	:type theValue: float
	:param theToAdaptAnother: default value is true
	:type theToAdaptAnother: bool
	:rtype: None
") SetSize;
		void SetSize (Standard_Real theValue,Standard_Boolean theToAdaptAnother = true);
		%feature("compactdefaultargs") SetTextColor;
		%feature("autodoc", "	* Set color of text labels on box sides. Alias for: @code Attributes()->TextAspect()->SetColor() @endcode

	:param theColor:
	:type theColor: Quantity_Color &
	:rtype: None
") SetTextColor;
		void SetTextColor (const Quantity_Color & theColor);
		%feature("compactdefaultargs") SetTransparency;
		%feature("autodoc", "	* Set new value of transparency for the whole object. @param theValue [in] input transparency value.

	:param theValue:
	:type theValue: float
	:rtype: None
") SetTransparency;
		void SetTransparency (const Standard_Real theValue);
		%feature("compactdefaultargs") SetViewAnimation;
		%feature("autodoc", "	* Set view animation.

	:param theAnimation:
	:type theAnimation: opencascade::handle<AIS_AnimationCamera> &
	:rtype: None
") SetViewAnimation;
		void SetViewAnimation (const opencascade::handle<AIS_AnimationCamera> & theAnimation);
		%feature("compactdefaultargs") SetYup;
		%feature("autodoc", "	* Set if application expects Y-up viewer orientation instead of Z-up.

	:param theIsYup:
	:type theIsYup: bool
	:param theToUpdateLabels: default value is Standard_True
	:type theToUpdateLabels: bool
	:rtype: None
") SetYup;
		void SetYup (Standard_Boolean theIsYup,Standard_Boolean theToUpdateLabels = Standard_True);
		%feature("compactdefaultargs") Size;
		%feature("autodoc", "	* @name Geometry management API returns size (width and height) of View cube sides; 100 by default.

	:rtype: float
") Size;
		Standard_Real Size ();
		%feature("compactdefaultargs") StartAnimation;
		%feature("autodoc", "	* Start camera transformation corresponding to the input detected owner. @param theOwner [in] detected owner.

	:param theOwner:
	:type theOwner: opencascade::handle<AIS_ViewCubeOwner> &
	:rtype: void
") StartAnimation;
		virtual void StartAnimation (const opencascade::handle<AIS_ViewCubeOwner> & theOwner);
		%feature("compactdefaultargs") TextColor;
		%feature("autodoc", "	* Return text color of labels of box sides; BLACK by default.

	:rtype: Quantity_Color
") TextColor;
		const Quantity_Color & TextColor ();
		%feature("compactdefaultargs") ToAutoStartAnimation;
		%feature("autodoc", "	* Return True if automatic camera transformation on selection (highlighting) is enabled; True by default.

	:rtype: bool
") ToAutoStartAnimation;
		Standard_Boolean ToAutoStartAnimation ();
		%feature("compactdefaultargs") ToDrawAxes;
		%feature("autodoc", "	* returns True if trihedron is drawn; True by default.

	:rtype: bool
") ToDrawAxes;
		Standard_Boolean ToDrawAxes ();
		%feature("compactdefaultargs") ToDrawEdges;
		%feature("autodoc", "	* returns True if edges of View Cube is drawn; True by default.

	:rtype: bool
") ToDrawEdges;
		Standard_Boolean ToDrawEdges ();
		%feature("compactdefaultargs") ToDrawVertices;
		%feature("autodoc", "	* Return True if vertices (vertex) of View Cube is drawn; True by default.

	:rtype: bool
") ToDrawVertices;
		Standard_Boolean ToDrawVertices ();
		%feature("compactdefaultargs") ToFitSelected;
		%feature("autodoc", "	* Return True if animation should fit selected objects and False to fit entire scene; True by default.

	:rtype: bool
") ToFitSelected;
		Standard_Boolean ToFitSelected ();
		%feature("compactdefaultargs") ToResetCameraUp;
		%feature("autodoc", "	* Return True if new camera Up direction should be always set to default value for a new camera Direction; False by default. When this flag is False, the new camera Up will be set as current Up orthogonalized to the new camera Direction, and will set to default Up on second click.

	:rtype: bool
") ToResetCameraUp;
		Standard_Boolean ToResetCameraUp ();
		%feature("compactdefaultargs") UnsetAttributes;
		%feature("autodoc", "	* Set default parameters for visual attributes @sa Attributes()

	:rtype: None
") UnsetAttributes;
		void UnsetAttributes ();
		%feature("compactdefaultargs") UnsetColor;
		%feature("autodoc", "	* Reset color for the whole object.

	:rtype: None
") UnsetColor;
		void UnsetColor ();
		%feature("compactdefaultargs") UnsetHilightAttributes;
		%feature("autodoc", "	* Set default parameters for dynamic highlighting attributes, reset highlight attributes

	:rtype: None
") UnsetHilightAttributes;
		void UnsetHilightAttributes ();
		%feature("compactdefaultargs") UnsetMaterial;
		%feature("autodoc", "	* Sets the material for the interactive object.

	:rtype: None
") UnsetMaterial;
		void UnsetMaterial ();
		%feature("compactdefaultargs") UnsetTransparency;
		%feature("autodoc", "	* Reset transparency for the whole object.

	:rtype: None
") UnsetTransparency;
		void UnsetTransparency ();
		%feature("compactdefaultargs") UpdateAnimation;
		%feature("autodoc", "	* Perform one step of current camera transformation. theToUpdate [in] enable/disable update of view. returns True if animation is not stopped.

	:param theToUpdate:
	:type theToUpdate: bool
	:rtype: bool
") UpdateAnimation;
		virtual Standard_Boolean UpdateAnimation (const Standard_Boolean theToUpdate);
		%feature("compactdefaultargs") ViewAnimation;
		%feature("autodoc", "	* Return view animation.

	:rtype: opencascade::handle<AIS_AnimationCamera>
") ViewAnimation;
		const opencascade::handle<AIS_AnimationCamera> & ViewAnimation ();
};


%extend AIS_ViewCube {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor AIS_AngleDimension;
class AIS_AngleDimension : public AIS_Dimension {
	public:
		%feature("compactdefaultargs") AIS_AngleDimension;
		%feature("autodoc", "	* Constructs minimum angle dimension between two linear edges (where possible). These two edges should be intersected by each other. Otherwise the geometry is not valid. @param theFirstEdge [in] the first edge. @param theSecondEdge [in] the second edge.

	:param theFirstEdge:
	:type theFirstEdge: TopoDS_Edge &
	:param theSecondEdge:
	:type theSecondEdge: TopoDS_Edge &
	:rtype: None
") AIS_AngleDimension;
		 AIS_AngleDimension (const TopoDS_Edge & theFirstEdge,const TopoDS_Edge & theSecondEdge);
		%feature("compactdefaultargs") AIS_AngleDimension;
		%feature("autodoc", "	* Constructs the angle display object defined by three points. @param theFirstPoint [in] the first point (point on first angle flyout). @param theSecondPoint [in] the center point of angle dimension. @param theThirdPoint [in] the second point (point on second angle flyout).

	:param theFirstPoint:
	:type theFirstPoint: gp_Pnt
	:param theSecondPoint:
	:type theSecondPoint: gp_Pnt
	:param theThirdPoint:
	:type theThirdPoint: gp_Pnt
	:rtype: None
") AIS_AngleDimension;
		 AIS_AngleDimension (const gp_Pnt & theFirstPoint,const gp_Pnt & theSecondPoint,const gp_Pnt & theThirdPoint);
		%feature("compactdefaultargs") AIS_AngleDimension;
		%feature("autodoc", "	* Constructs the angle display object defined by three vertices. @param theFirstVertex [in] the first vertex (vertex for first angle flyout). @param theSecondVertex [in] the center vertex of angle dimension. @param theThirdPoint [in] the second vertex (vertex for second angle flyout).

	:param theFirstVertex:
	:type theFirstVertex: TopoDS_Vertex &
	:param theSecondVertex:
	:type theSecondVertex: TopoDS_Vertex &
	:param theThirdVertex:
	:type theThirdVertex: TopoDS_Vertex &
	:rtype: None
") AIS_AngleDimension;
		 AIS_AngleDimension (const TopoDS_Vertex & theFirstVertex,const TopoDS_Vertex & theSecondVertex,const TopoDS_Vertex & theThirdVertex);
		%feature("compactdefaultargs") AIS_AngleDimension;
		%feature("autodoc", "	* Constructs angle dimension for the cone face. @param theCone [in] the conical face.

	:param theCone:
	:type theCone: TopoDS_Face &
	:rtype: None
") AIS_AngleDimension;
		 AIS_AngleDimension (const TopoDS_Face & theCone);
		%feature("compactdefaultargs") AIS_AngleDimension;
		%feature("autodoc", "	* Constructs angle dimension between two planar faces. @param theFirstFace [in] the first face. @param theSecondFace [in] the second face.

	:param theFirstFace:
	:type theFirstFace: TopoDS_Face &
	:param theSecondFace:
	:type theSecondFace: TopoDS_Face &
	:rtype: None
") AIS_AngleDimension;
		 AIS_AngleDimension (const TopoDS_Face & theFirstFace,const TopoDS_Face & theSecondFace);
		%feature("compactdefaultargs") AIS_AngleDimension;
		%feature("autodoc", "	* Constructs angle dimension between two planar faces. @param theFirstFace [in] the first face. @param theSecondFace [in] the second face. @param thePoint [in] the point which the dimension plane should pass through. This point can lay on the one of the faces or not.

	:param theFirstFace:
	:type theFirstFace: TopoDS_Face &
	:param theSecondFace:
	:type theSecondFace: TopoDS_Face &
	:param thePoint:
	:type thePoint: gp_Pnt
	:rtype: None
") AIS_AngleDimension;
		 AIS_AngleDimension (const TopoDS_Face & theFirstFace,const TopoDS_Face & theSecondFace,const gp_Pnt & thePoint);
		%feature("compactdefaultargs") CenterPoint;
		%feature("autodoc", "	* returns center point forming the angle.

	:rtype: gp_Pnt
") CenterPoint;
		const gp_Pnt  CenterPoint ();
		%feature("compactdefaultargs") FirstPoint;
		%feature("autodoc", "	* returns first point forming the angle.

	:rtype: gp_Pnt
") FirstPoint;
		const gp_Pnt  FirstPoint ();
		%feature("compactdefaultargs") FirstShape;
		%feature("autodoc", "	* returns first argument shape.

	:rtype: TopoDS_Shape
") FirstShape;
		const TopoDS_Shape  FirstShape ();
		%feature("compactdefaultargs") GetArrowsVisibility;
		%feature("autodoc", "	* returns the type of visibility of arrows.

	:rtype: AIS_TypeOfAngleArrowVisibility
") GetArrowsVisibility;
		AIS_TypeOfAngleArrowVisibility GetArrowsVisibility ();
		%feature("compactdefaultargs") GetDisplayUnits;
		%feature("autodoc", "	* returns the display units string.

	:rtype: TCollection_AsciiString
") GetDisplayUnits;
		virtual const TCollection_AsciiString & GetDisplayUnits ();
		%feature("compactdefaultargs") GetModelUnits;
		%feature("autodoc", "	* returns the model units string.

	:rtype: TCollection_AsciiString
") GetModelUnits;
		virtual const TCollection_AsciiString & GetModelUnits ();
		%feature("compactdefaultargs") GetTextPosition;
		%feature("autodoc", "	:rtype: gp_Pnt
") GetTextPosition;
		virtual const gp_Pnt GetTextPosition ();
		%feature("compactdefaultargs") GetType;
		%feature("autodoc", "	* returns the current angle type.

	:rtype: AIS_TypeOfAngle
") GetType;
		AIS_TypeOfAngle GetType ();
		%feature("compactdefaultargs") SecondPoint;
		%feature("autodoc", "	* returns second point forming the angle.

	:rtype: gp_Pnt
") SecondPoint;
		const gp_Pnt  SecondPoint ();
		%feature("compactdefaultargs") SecondShape;
		%feature("autodoc", "	* returns second argument shape.

	:rtype: TopoDS_Shape
") SecondShape;
		const TopoDS_Shape  SecondShape ();
		%feature("compactdefaultargs") SetArrowsVisibility;
		%feature("autodoc", "	* Sets visible arrows type @param theType [in] the type of visibility of arrows.

	:param theType:
	:type theType: AIS_TypeOfAngleArrowVisibility &
	:rtype: None
") SetArrowsVisibility;
		void SetArrowsVisibility (const AIS_TypeOfAngleArrowVisibility & theType);
		%feature("compactdefaultargs") SetDisplayUnits;
		%feature("autodoc", "	:param theUnits:
	:type theUnits: TCollection_AsciiString &
	:rtype: void
") SetDisplayUnits;
		virtual void SetDisplayUnits (const TCollection_AsciiString & theUnits);
		%feature("compactdefaultargs") SetMeasuredGeometry;
		%feature("autodoc", "	* Measures minimum angle dimension between two linear edges. These two edges should be intersected by each other. Otherwise the geometry is not valid. @param theFirstEdge [in] the first edge. @param theSecondEdge [in] the second edge.

	:param theFirstEdge:
	:type theFirstEdge: TopoDS_Edge &
	:param theSecondEdge:
	:type theSecondEdge: TopoDS_Edge &
	:rtype: None
") SetMeasuredGeometry;
		void SetMeasuredGeometry (const TopoDS_Edge & theFirstEdge,const TopoDS_Edge & theSecondEdge);
		%feature("compactdefaultargs") SetMeasuredGeometry;
		%feature("autodoc", "	* Measures angle defined by three points. @param theFirstPoint [in] the first point (point on first angle flyout). @param theSecondPoint [in] the center point of angle dimension. @param theThirdPoint [in] the second point (point on second angle flyout).

	:param theFirstPoint:
	:type theFirstPoint: gp_Pnt
	:param theSecondPoint:
	:type theSecondPoint: gp_Pnt
	:param theThridPoint:
	:type theThridPoint: gp_Pnt
	:rtype: None
") SetMeasuredGeometry;
		void SetMeasuredGeometry (const gp_Pnt & theFirstPoint,const gp_Pnt & theSecondPoint,const gp_Pnt & theThridPoint);
		%feature("compactdefaultargs") SetMeasuredGeometry;
		%feature("autodoc", "	* Measures angle defined by three vertices. @param theFirstVertex [in] the first vertex (vertex for first angle flyout). @param theSecondVertex [in] the center vertex of angle dimension. @param theThirdPoint [in] the second vertex (vertex for second angle flyout).

	:param theFirstVertex:
	:type theFirstVertex: TopoDS_Vertex &
	:param theSecondVertex:
	:type theSecondVertex: TopoDS_Vertex &
	:param theThirdVertex:
	:type theThirdVertex: TopoDS_Vertex &
	:rtype: None
") SetMeasuredGeometry;
		void SetMeasuredGeometry (const TopoDS_Vertex & theFirstVertex,const TopoDS_Vertex & theSecondVertex,const TopoDS_Vertex & theThirdVertex);
		%feature("compactdefaultargs") SetMeasuredGeometry;
		%feature("autodoc", "	* Measures angle of conical face. @param theCone [in] the shape to measure.

	:param theCone:
	:type theCone: TopoDS_Face &
	:rtype: None
") SetMeasuredGeometry;
		void SetMeasuredGeometry (const TopoDS_Face & theCone);
		%feature("compactdefaultargs") SetMeasuredGeometry;
		%feature("autodoc", "	* Measures angle between two planar faces. @param theFirstFace [in] the first face. @param theSecondFace [in] the second face..

	:param theFirstFace:
	:type theFirstFace: TopoDS_Face &
	:param theSecondFace:
	:type theSecondFace: TopoDS_Face &
	:rtype: None
") SetMeasuredGeometry;
		void SetMeasuredGeometry (const TopoDS_Face & theFirstFace,const TopoDS_Face & theSecondFace);
		%feature("compactdefaultargs") SetMeasuredGeometry;
		%feature("autodoc", "	* Measures angle between two planar faces. @param theFirstFace [in] the first face. @param theSecondFace [in] the second face. @param thePoint [in] the point which the dimension plane should pass through. This point can lay on the one of the faces or not.

	:param theFirstFace:
	:type theFirstFace: TopoDS_Face &
	:param theSecondFace:
	:type theSecondFace: TopoDS_Face &
	:param thePoint:
	:type thePoint: gp_Pnt
	:rtype: None
") SetMeasuredGeometry;
		void SetMeasuredGeometry (const TopoDS_Face & theFirstFace,const TopoDS_Face & theSecondFace,const gp_Pnt & thePoint);
		%feature("compactdefaultargs") SetModelUnits;
		%feature("autodoc", "	:param theUnits:
	:type theUnits: TCollection_AsciiString &
	:rtype: void
") SetModelUnits;
		virtual void SetModelUnits (const TCollection_AsciiString & theUnits);
		%feature("compactdefaultargs") SetTextPosition;
		%feature("autodoc", "	* Principle of horizontal text alignment settings: - divide circle into two halves according to attachment points - if aTextPos is between attach points -> Center + positive flyout - if aTextPos is not between attach points but in this half -> Left or Right + positive flyout - if aTextPos is between reflections of attach points -> Center + negative flyout - if aTextPos is not between reflections of attach points -> Left or Right + negative flyout

	:param theTextPos:
	:type theTextPos: gp_Pnt
	:rtype: void
") SetTextPosition;
		virtual void SetTextPosition (const gp_Pnt & theTextPos);
		%feature("compactdefaultargs") SetType;
		%feature("autodoc", "	* Sets angle type. @param theType [in] the type value.

	:param theType:
	:type theType: AIS_TypeOfAngle
	:rtype: None
") SetType;
		void SetType (const AIS_TypeOfAngle theType);
		%feature("compactdefaultargs") ThirdShape;
		%feature("autodoc", "	* returns third argument shape.

	:rtype: TopoDS_Shape
") ThirdShape;
		const TopoDS_Shape  ThirdShape ();
};


%make_alias(AIS_AngleDimension)

%extend AIS_AngleDimension {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor AIS_Chamf2dDimension;
class AIS_Chamf2dDimension : public AIS_Relation {
	public:
		%feature("compactdefaultargs") AIS_Chamf2dDimension;
		%feature("autodoc", "	* Constructs the display object for 2D chamfers. This object is defined by the face aFShape, the dimension aVal, the plane aPlane and the text aText.

	:param aFShape:
	:type aFShape: TopoDS_Shape &
	:param aPlane:
	:type aPlane: opencascade::handle<Geom_Plane> &
	:param aVal:
	:type aVal: float
	:param aText:
	:type aText: TCollection_ExtendedString &
	:rtype: None
") AIS_Chamf2dDimension;
		 AIS_Chamf2dDimension (const TopoDS_Shape & aFShape,const opencascade::handle<Geom_Plane> & aPlane,const Standard_Real aVal,const TCollection_ExtendedString & aText);
		%feature("compactdefaultargs") AIS_Chamf2dDimension;
		%feature("autodoc", "	* Constructs the display object for 2D chamfers. This object is defined by the face aFShape, the plane aPlane, the dimension aVal, the position aPosition, the type of arrow aSymbolPrs with the size anArrowSize, and the text aText.

	:param aFShape:
	:type aFShape: TopoDS_Shape &
	:param aPlane:
	:type aPlane: opencascade::handle<Geom_Plane> &
	:param aVal:
	:type aVal: float
	:param aText:
	:type aText: TCollection_ExtendedString &
	:param aPosition:
	:type aPosition: gp_Pnt
	:param aSymbolPrs:
	:type aSymbolPrs: DsgPrs_ArrowSide
	:param anArrowSize: default value is 0.0
	:type anArrowSize: float
	:rtype: None
") AIS_Chamf2dDimension;
		 AIS_Chamf2dDimension (const TopoDS_Shape & aFShape,const opencascade::handle<Geom_Plane> & aPlane,const Standard_Real aVal,const TCollection_ExtendedString & aText,const gp_Pnt & aPosition,const DsgPrs_ArrowSide aSymbolPrs,const Standard_Real anArrowSize = 0.0);
		%feature("compactdefaultargs") Compute;
		%feature("autodoc", "	* computes the presentation according to a point of view given by <aProjector>. To be Used when the associated degenerated Presentations have been transformed by <aTrsf> which is not a Pure Translation. The HLR Prs can't be deducted automatically WARNING :<aTrsf> must be applied to the object to display before computation !!!

	:param aProjector:
	:type aProjector: opencascade::handle<Prs3d_Projector> &
	:param aTrsf:
	:type aTrsf: opencascade::handle<Geom_Transformation> &
	:param aPresentation:
	:type aPresentation: opencascade::handle<Prs3d_Presentation> &
	:rtype: void
") Compute;
		virtual void Compute (const opencascade::handle<Prs3d_Projector> & aProjector,const opencascade::handle<Geom_Transformation> & aTrsf,const opencascade::handle<Prs3d_Presentation> & aPresentation);
		%feature("compactdefaultargs") IsMovable;
		%feature("autodoc", "	* Returns true if the 2d chamfer dimension is movable.

	:rtype: bool
") IsMovable;
		Standard_Boolean IsMovable ();
		%feature("compactdefaultargs") KindOfDimension;
		%feature("autodoc", "	* Indicates that we are concerned with a 2d length.

	:rtype: AIS_KindOfDimension
") KindOfDimension;
		AIS_KindOfDimension KindOfDimension ();
};


%make_alias(AIS_Chamf2dDimension)

%extend AIS_Chamf2dDimension {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor AIS_Chamf3dDimension;
class AIS_Chamf3dDimension : public AIS_Relation {
	public:
		%feature("compactdefaultargs") AIS_Chamf3dDimension;
		%feature("autodoc", "	* Constructs a display object for 3D chamfers. This object is defined by the shape aFShape, the dimension aVal and the text aText.

	:param aFShape:
	:type aFShape: TopoDS_Shape &
	:param aVal:
	:type aVal: float
	:param aText:
	:type aText: TCollection_ExtendedString &
	:rtype: None
") AIS_Chamf3dDimension;
		 AIS_Chamf3dDimension (const TopoDS_Shape & aFShape,const Standard_Real aVal,const TCollection_ExtendedString & aText);
		%feature("compactdefaultargs") AIS_Chamf3dDimension;
		%feature("autodoc", "	* Constructs a display object for 3D chamfers. This object is defined by the shape aFShape, the dimension aVal, the text aText, the point of origin of the chamfer aPosition, the type of arrow aSymbolPrs with the size anArrowSize.

	:param aFShape:
	:type aFShape: TopoDS_Shape &
	:param aVal:
	:type aVal: float
	:param aText:
	:type aText: TCollection_ExtendedString &
	:param aPosition:
	:type aPosition: gp_Pnt
	:param aSymbolPrs:
	:type aSymbolPrs: DsgPrs_ArrowSide
	:param anArrowSize: default value is 0.0
	:type anArrowSize: float
	:rtype: None
") AIS_Chamf3dDimension;
		 AIS_Chamf3dDimension (const TopoDS_Shape & aFShape,const Standard_Real aVal,const TCollection_ExtendedString & aText,const gp_Pnt & aPosition,const DsgPrs_ArrowSide aSymbolPrs,const Standard_Real anArrowSize = 0.0);
		%feature("compactdefaultargs") Compute;
		%feature("autodoc", "	* computes the presentation according to a point of view given by <aProjector>. To be Used when the associated degenerated Presentations have been transformed by <aTrsf> which is not a Pure Translation. The HLR Prs can't be deducted automatically WARNING :<aTrsf> must be applied to the object to display before computation !!!

	:param aProjector:
	:type aProjector: opencascade::handle<Prs3d_Projector> &
	:param aTrsf:
	:type aTrsf: opencascade::handle<Geom_Transformation> &
	:param aPresentation:
	:type aPresentation: opencascade::handle<Prs3d_Presentation> &
	:rtype: void
") Compute;
		virtual void Compute (const opencascade::handle<Prs3d_Projector> & aProjector,const opencascade::handle<Geom_Transformation> & aTrsf,const opencascade::handle<Prs3d_Presentation> & aPresentation);
		%feature("compactdefaultargs") IsMovable;
		%feature("autodoc", "	* Returns true if the 3d chamfer dimension is movable.

	:rtype: bool
") IsMovable;
		Standard_Boolean IsMovable ();
		%feature("compactdefaultargs") KindOfDimension;
		%feature("autodoc", "	* Indicates that we are concerned with a 3d length.

	:rtype: AIS_KindOfDimension
") KindOfDimension;
		AIS_KindOfDimension KindOfDimension ();
};


%make_alias(AIS_Chamf3dDimension)

%extend AIS_Chamf3dDimension {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor AIS_ColoredShape;
class AIS_ColoredShape : public AIS_Shape {
	public:
		%feature("compactdefaultargs") AIS_ColoredShape;
		%feature("autodoc", "	* Default constructor

	:param theShape:
	:type theShape: TopoDS_Shape &
	:rtype: None
") AIS_ColoredShape;
		 AIS_ColoredShape (const TopoDS_Shape & theShape);
		%feature("compactdefaultargs") AIS_ColoredShape;
		%feature("autodoc", "	* Copy constructor

	:param theShape:
	:type theShape: opencascade::handle<AIS_Shape> &
	:rtype: None
") AIS_ColoredShape;
		 AIS_ColoredShape (const opencascade::handle<AIS_Shape> & theShape);
		%feature("compactdefaultargs") ChangeCustomAspectsMap;
		%feature("autodoc", "	* Return the map of custom aspects.

	:rtype: AIS_DataMapOfShapeDrawer
") ChangeCustomAspectsMap;
		AIS_DataMapOfShapeDrawer & ChangeCustomAspectsMap ();
		%feature("compactdefaultargs") ClearCustomAspects;
		%feature("autodoc", "	* Reset the map of custom sub-shape aspects.

	:rtype: void
") ClearCustomAspects;
		virtual void ClearCustomAspects ();
		%feature("compactdefaultargs") CustomAspects;
		%feature("autodoc", "	* @name sub-shape aspects Customize properties of specified sub-shape. The shape will be stored in the map but ignored, if it is not sub-shape of main Shape! This method can be used to mark sub-shapes with customizable properties.

	:param theShape:
	:type theShape: TopoDS_Shape &
	:rtype: opencascade::handle<AIS_ColoredDrawer>
") CustomAspects;
		virtual opencascade::handle<AIS_ColoredDrawer> CustomAspects (const TopoDS_Shape & theShape);
		%feature("compactdefaultargs") CustomAspectsMap;
		%feature("autodoc", "	* Return the map of custom aspects.

	:rtype: AIS_DataMapOfShapeDrawer
") CustomAspectsMap;
		const AIS_DataMapOfShapeDrawer & CustomAspectsMap ();
		%feature("compactdefaultargs") SetColor;
		%feature("autodoc", "	* @name global aspects Setup color of entire shape.

	:param theColor:
	:type theColor: Quantity_Color &
	:rtype: void
") SetColor;
		virtual void SetColor (const Quantity_Color & theColor);
		%feature("compactdefaultargs") SetCustomColor;
		%feature("autodoc", "	* Customize color of specified sub-shape

	:param theShape:
	:type theShape: TopoDS_Shape &
	:param theColor:
	:type theColor: Quantity_Color &
	:rtype: None
") SetCustomColor;
		void SetCustomColor (const TopoDS_Shape & theShape,const Quantity_Color & theColor);
		%feature("compactdefaultargs") SetCustomTransparency;
		%feature("autodoc", "	* Customize transparency of specified sub-shape

	:param theShape:
	:type theShape: TopoDS_Shape &
	:param theTransparency:
	:type theTransparency: float
	:rtype: None
") SetCustomTransparency;
		void SetCustomTransparency (const TopoDS_Shape & theShape,Standard_Real theTransparency);
		%feature("compactdefaultargs") SetCustomWidth;
		%feature("autodoc", "	* Customize line width of specified sub-shape

	:param theShape:
	:type theShape: TopoDS_Shape &
	:param theLineWidth:
	:type theLineWidth: float
	:rtype: None
") SetCustomWidth;
		void SetCustomWidth (const TopoDS_Shape & theShape,const Standard_Real theLineWidth);
		%feature("compactdefaultargs") SetMaterial;
		%feature("autodoc", "	* Sets the material aspect.

	:param theAspect:
	:type theAspect: Graphic3d_MaterialAspect &
	:rtype: void
") SetMaterial;
		virtual void SetMaterial (const Graphic3d_MaterialAspect & theAspect);
		%feature("compactdefaultargs") SetTransparency;
		%feature("autodoc", "	* Sets transparency value.

	:param theValue:
	:type theValue: float
	:rtype: void
") SetTransparency;
		virtual void SetTransparency (const Standard_Real theValue);
		%feature("compactdefaultargs") SetWidth;
		%feature("autodoc", "	* Setup line width of entire shape.

	:param theLineWidth:
	:type theLineWidth: float
	:rtype: void
") SetWidth;
		virtual void SetWidth (const Standard_Real theLineWidth);
		%feature("compactdefaultargs") UnsetCustomAspects;
		%feature("autodoc", "	* Reset custom properties of specified sub-shape. @param theToUnregister unregister or not sub-shape from the map

	:param theShape:
	:type theShape: TopoDS_Shape &
	:param theToUnregister: default value is Standard_False
	:type theToUnregister: bool
	:rtype: None
") UnsetCustomAspects;
		void UnsetCustomAspects (const TopoDS_Shape & theShape,const Standard_Boolean theToUnregister = Standard_False);
		%feature("compactdefaultargs") UnsetTransparency;
		%feature("autodoc", "	* Removes the setting for transparency in the reconstructed compound shape.

	:rtype: void
") UnsetTransparency;
		virtual void UnsetTransparency ();
		%feature("compactdefaultargs") UnsetWidth;
		%feature("autodoc", "	* Setup line width of entire shape.

	:rtype: void
") UnsetWidth;
		virtual void UnsetWidth ();
};


%make_alias(AIS_ColoredShape)

%extend AIS_ColoredShape {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor AIS_ConcentricRelation;
class AIS_ConcentricRelation : public AIS_Relation {
	public:
		%feature("compactdefaultargs") AIS_ConcentricRelation;
		%feature("autodoc", "	* Constructs the display object for concentric relations between shapes. This object is defined by the two shapes, aFShape and aSShape and the plane aPlane. aPlane is provided to create an axis along which the relation of concentricity can be extended.

	:param aFShape:
	:type aFShape: TopoDS_Shape &
	:param aSShape:
	:type aSShape: TopoDS_Shape &
	:param aPlane:
	:type aPlane: opencascade::handle<Geom_Plane> &
	:rtype: None
") AIS_ConcentricRelation;
		 AIS_ConcentricRelation (const TopoDS_Shape & aFShape,const TopoDS_Shape & aSShape,const opencascade::handle<Geom_Plane> & aPlane);
		%feature("compactdefaultargs") Compute;
		%feature("autodoc", "	* computes the presentation according to a point of view given by <aProjector>. To be Used when the associated degenerated Presentations have been transformed by <aTrsf> which is not a Pure Translation. The HLR Prs can't be deducted automatically WARNING :<aTrsf> must be applied to the object to display before computation !!!

	:param aProjector:
	:type aProjector: opencascade::handle<Prs3d_Projector> &
	:param aTrsf:
	:type aTrsf: opencascade::handle<Geom_Transformation> &
	:param aPresentation:
	:type aPresentation: opencascade::handle<Prs3d_Presentation> &
	:rtype: void
") Compute;
		virtual void Compute (const opencascade::handle<Prs3d_Projector> & aProjector,const opencascade::handle<Geom_Transformation> & aTrsf,const opencascade::handle<Prs3d_Presentation> & aPresentation);
};


%make_alias(AIS_ConcentricRelation)

%extend AIS_ConcentricRelation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor AIS_DiameterDimension;
class AIS_DiameterDimension : public AIS_Dimension {
	public:
		%feature("compactdefaultargs") AIS_DiameterDimension;
		%feature("autodoc", "	* Construct diameter dimension for the circle. @param theCircle [in] the circle to measure.

	:param theCircle:
	:type theCircle: gp_Circ
	:rtype: None
") AIS_DiameterDimension;
		 AIS_DiameterDimension (const gp_Circ & theCircle);
		%feature("compactdefaultargs") AIS_DiameterDimension;
		%feature("autodoc", "	* Construct diameter dimension for the circle and orient it correspondingly to the passed plane. @param theCircle [in] the circle to measure. @param thePlane [in] the plane defining preferred orientation for dimension.

	:param theCircle:
	:type theCircle: gp_Circ
	:param thePlane:
	:type thePlane: gp_Pln
	:rtype: None
") AIS_DiameterDimension;
		 AIS_DiameterDimension (const gp_Circ & theCircle,const gp_Pln & thePlane);
		%feature("compactdefaultargs") AIS_DiameterDimension;
		%feature("autodoc", "	* Construct diameter on the passed shape, if applicable. @param theShape [in] the shape to measure.

	:param theShape:
	:type theShape: TopoDS_Shape &
	:rtype: None
") AIS_DiameterDimension;
		 AIS_DiameterDimension (const TopoDS_Shape & theShape);
		%feature("compactdefaultargs") AIS_DiameterDimension;
		%feature("autodoc", "	* Construct diameter on the passed shape, if applicable - and define the preferred plane to orient the dimension. @param theShape [in] the shape to measure. @param thePlane [in] the plane defining preferred orientation for dimension.

	:param theShape:
	:type theShape: TopoDS_Shape &
	:param thePlane:
	:type thePlane: gp_Pln
	:rtype: None
") AIS_DiameterDimension;
		 AIS_DiameterDimension (const TopoDS_Shape & theShape,const gp_Pln & thePlane);
		%feature("compactdefaultargs") AnchorPoint;
		%feature("autodoc", "	* returns anchor point on circle for diameter dimension.

	:rtype: gp_Pnt
") AnchorPoint;
		gp_Pnt AnchorPoint ();
		%feature("compactdefaultargs") Circle;
		%feature("autodoc", "	* returns measured geometry circle.

	:rtype: gp_Circ
") Circle;
		const gp_Circ  Circle ();
		%feature("compactdefaultargs") GetDisplayUnits;
		%feature("autodoc", "	* returns the display units string.

	:rtype: TCollection_AsciiString
") GetDisplayUnits;
		virtual const TCollection_AsciiString & GetDisplayUnits ();
		%feature("compactdefaultargs") GetModelUnits;
		%feature("autodoc", "	* returns the model units string.

	:rtype: TCollection_AsciiString
") GetModelUnits;
		virtual const TCollection_AsciiString & GetModelUnits ();
		%feature("compactdefaultargs") GetTextPosition;
		%feature("autodoc", "	:rtype: gp_Pnt
") GetTextPosition;
		virtual const gp_Pnt GetTextPosition ();
		%feature("compactdefaultargs") SetDisplayUnits;
		%feature("autodoc", "	:param theUnits:
	:type theUnits: TCollection_AsciiString &
	:rtype: void
") SetDisplayUnits;
		virtual void SetDisplayUnits (const TCollection_AsciiString & theUnits);
		%feature("compactdefaultargs") SetMeasuredGeometry;
		%feature("autodoc", "	* Measure diameter of the circle. The actual dimension plane is used for determining anchor points on the circle to attach the dimension lines to. The dimension will become invalid if the diameter of the circle is less than Precision::Confusion(). @param theCircle [in] the circle to measure.

	:param theCircle:
	:type theCircle: gp_Circ
	:rtype: None
") SetMeasuredGeometry;
		void SetMeasuredGeometry (const gp_Circ & theCircle);
		%feature("compactdefaultargs") SetMeasuredGeometry;
		%feature("autodoc", "	* Measure diameter on the passed shape, if applicable. The dimension will become invalid if the passed shape is not measurable or if measured diameter value is less than Precision::Confusion(). @param theShape [in] the shape to measure.

	:param theShape:
	:type theShape: TopoDS_Shape &
	:rtype: None
") SetMeasuredGeometry;
		void SetMeasuredGeometry (const TopoDS_Shape & theShape);
		%feature("compactdefaultargs") SetModelUnits;
		%feature("autodoc", "	:param theUnits:
	:type theUnits: TCollection_AsciiString &
	:rtype: void
") SetModelUnits;
		virtual void SetModelUnits (const TCollection_AsciiString & theUnits);
		%feature("compactdefaultargs") SetTextPosition;
		%feature("autodoc", "	:param theTextPos:
	:type theTextPos: gp_Pnt
	:rtype: void
") SetTextPosition;
		virtual void SetTextPosition (const gp_Pnt & theTextPos);
		%feature("compactdefaultargs") Shape;
		%feature("autodoc", "	* returns the measured shape.

	:rtype: TopoDS_Shape
") Shape;
		const TopoDS_Shape  Shape ();
};


%make_alias(AIS_DiameterDimension)

%extend AIS_DiameterDimension {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor AIS_EllipseRadiusDimension;
class AIS_EllipseRadiusDimension : public AIS_Relation {
	public:
		%feature("compactdefaultargs") ComputeGeometry;
		%feature("autodoc", "	:rtype: None
") ComputeGeometry;
		void ComputeGeometry ();
		%feature("compactdefaultargs") IsMovable;
		%feature("autodoc", "	:rtype: bool
") IsMovable;
		virtual Standard_Boolean IsMovable ();
		%feature("compactdefaultargs") KindOfDimension;
		%feature("autodoc", "	:rtype: AIS_KindOfDimension
") KindOfDimension;
		virtual AIS_KindOfDimension KindOfDimension ();
};


%make_alias(AIS_EllipseRadiusDimension)

%extend AIS_EllipseRadiusDimension {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor AIS_EqualDistanceRelation;
class AIS_EqualDistanceRelation : public AIS_Relation {
	public:
		%feature("compactdefaultargs") AIS_EqualDistanceRelation;
		%feature("autodoc", "	* Constructs a framework to display equivalent distances between the shapes aShape1, aShape2, aShape3, aShape4 and the plane aPlane. The distance is the length of a projection from the shape to the plane.

	:param aShape1:
	:type aShape1: TopoDS_Shape &
	:param aShape2:
	:type aShape2: TopoDS_Shape &
	:param aShape3:
	:type aShape3: TopoDS_Shape &
	:param aShape4:
	:type aShape4: TopoDS_Shape &
	:param aPlane:
	:type aPlane: opencascade::handle<Geom_Plane> &
	:rtype: None
") AIS_EqualDistanceRelation;
		 AIS_EqualDistanceRelation (const TopoDS_Shape & aShape1,const TopoDS_Shape & aShape2,const TopoDS_Shape & aShape3,const TopoDS_Shape & aShape4,const opencascade::handle<Geom_Plane> & aPlane);
		%feature("compactdefaultargs") Compute;
		%feature("autodoc", "	* Computes the presentation according to a point of view given by <aProjector>. To be Used when the associated degenerated Presentations have been transformed by <aTrsf> which is not a Pure Translation. The HLR Prs can't be deducted automatically WARNING :<aTrsf> must be applied to the object to display before computation !!!

	:param aProjector:
	:type aProjector: opencascade::handle<Prs3d_Projector> &
	:param aTrsf:
	:type aTrsf: opencascade::handle<Geom_Transformation> &
	:param aPresentation:
	:type aPresentation: opencascade::handle<Prs3d_Presentation> &
	:rtype: void
") Compute;
		virtual void Compute (const opencascade::handle<Prs3d_Projector> & aProjector,const opencascade::handle<Geom_Transformation> & aTrsf,const opencascade::handle<Prs3d_Presentation> & aPresentation);
		%feature("compactdefaultargs") ComputeOneEdgeOneVertexLength;
		%feature("autodoc", "	* Compute the interval location between a vertex and an edge. Edge may be a line or a circle.

	:param aPresentation:
	:type aPresentation: opencascade::handle<Prs3d_Presentation> &
	:param aDrawer:
	:type aDrawer: opencascade::handle<Prs3d_Drawer> &
	:param ArrowSize:
	:type ArrowSize: float
	:param FirstShape:
	:type FirstShape: TopoDS_Shape &
	:param SecondShape:
	:type SecondShape: TopoDS_Shape &
	:param Plane:
	:type Plane: opencascade::handle<Geom_Plane> &
	:param AutomaticPos:
	:type AutomaticPos: bool
	:param IsSetBndBox:
	:type IsSetBndBox: bool
	:param BndBox:
	:type BndBox: Bnd_Box &
	:param Position:
	:type Position: gp_Pnt
	:param FirstAttach:
	:type FirstAttach: gp_Pnt
	:param SecondAttach:
	:type SecondAttach: gp_Pnt
	:param FirstExtreme:
	:type FirstExtreme: gp_Pnt
	:param SecondExtreme:
	:type SecondExtreme: gp_Pnt
	:param SymbolPrs:
	:type SymbolPrs: DsgPrs_ArrowSide &
	:rtype: void
") ComputeOneEdgeOneVertexLength;
		static void ComputeOneEdgeOneVertexLength (const opencascade::handle<Prs3d_Presentation> & aPresentation,const opencascade::handle<Prs3d_Drawer> & aDrawer,const Standard_Real ArrowSize,const TopoDS_Shape & FirstShape,const TopoDS_Shape & SecondShape,const opencascade::handle<Geom_Plane> & Plane,const Standard_Boolean AutomaticPos,const Standard_Boolean IsSetBndBox,const Bnd_Box & BndBox,gp_Pnt & Position,gp_Pnt & FirstAttach,gp_Pnt & SecondAttach,gp_Pnt & FirstExtreme,gp_Pnt & SecondExtreme,DsgPrs_ArrowSide & SymbolPrs);
		%feature("compactdefaultargs") ComputeTwoEdgesLength;
		%feature("autodoc", "	* Computes the location of an intreval between between two edges. FirstAttach , SecondAttach are the returned extreme points of the interval.

	:param aPresentation:
	:type aPresentation: opencascade::handle<Prs3d_Presentation> &
	:param aDrawer:
	:type aDrawer: opencascade::handle<Prs3d_Drawer> &
	:param ArrowSize:
	:type ArrowSize: float
	:param FirstEdge:
	:type FirstEdge: TopoDS_Edge &
	:param SecondEdge:
	:type SecondEdge: TopoDS_Edge &
	:param Plane:
	:type Plane: opencascade::handle<Geom_Plane> &
	:param AutomaticPos:
	:type AutomaticPos: bool
	:param IsSetBndBox:
	:type IsSetBndBox: bool
	:param BndBox:
	:type BndBox: Bnd_Box &
	:param Position:
	:type Position: gp_Pnt
	:param FirstAttach:
	:type FirstAttach: gp_Pnt
	:param SecondAttach:
	:type SecondAttach: gp_Pnt
	:param FirstExtreme:
	:type FirstExtreme: gp_Pnt
	:param SecondExtreme:
	:type SecondExtreme: gp_Pnt
	:param SymbolPrs:
	:type SymbolPrs: DsgPrs_ArrowSide &
	:rtype: void
") ComputeTwoEdgesLength;
		static void ComputeTwoEdgesLength (const opencascade::handle<Prs3d_Presentation> & aPresentation,const opencascade::handle<Prs3d_Drawer> & aDrawer,const Standard_Real ArrowSize,const TopoDS_Edge & FirstEdge,const TopoDS_Edge & SecondEdge,const opencascade::handle<Geom_Plane> & Plane,const Standard_Boolean AutomaticPos,const Standard_Boolean IsSetBndBox,const Bnd_Box & BndBox,gp_Pnt & Position,gp_Pnt & FirstAttach,gp_Pnt & SecondAttach,gp_Pnt & FirstExtreme,gp_Pnt & SecondExtreme,DsgPrs_ArrowSide & SymbolPrs);
		%feature("compactdefaultargs") ComputeTwoVerticesLength;
		%feature("autodoc", "	* Computes the interval position between two vertexs. FirstAttach, SecondAttach are the returned extreme points of the interval.

	:param aPresentation:
	:type aPresentation: opencascade::handle<Prs3d_Presentation> &
	:param aDrawer:
	:type aDrawer: opencascade::handle<Prs3d_Drawer> &
	:param ArrowSize:
	:type ArrowSize: float
	:param FirstVertex:
	:type FirstVertex: TopoDS_Vertex &
	:param SecondVertex:
	:type SecondVertex: TopoDS_Vertex &
	:param Plane:
	:type Plane: opencascade::handle<Geom_Plane> &
	:param AutomaticPos:
	:type AutomaticPos: bool
	:param IsSetBndBox:
	:type IsSetBndBox: bool
	:param BndBox:
	:type BndBox: Bnd_Box &
	:param TypeDist:
	:type TypeDist: AIS_TypeOfDist
	:param Position:
	:type Position: gp_Pnt
	:param FirstAttach:
	:type FirstAttach: gp_Pnt
	:param SecondAttach:
	:type SecondAttach: gp_Pnt
	:param FirstExtreme:
	:type FirstExtreme: gp_Pnt
	:param SecondExtreme:
	:type SecondExtreme: gp_Pnt
	:param SymbolPrs:
	:type SymbolPrs: DsgPrs_ArrowSide &
	:rtype: void
") ComputeTwoVerticesLength;
		static void ComputeTwoVerticesLength (const opencascade::handle<Prs3d_Presentation> & aPresentation,const opencascade::handle<Prs3d_Drawer> & aDrawer,const Standard_Real ArrowSize,const TopoDS_Vertex & FirstVertex,const TopoDS_Vertex & SecondVertex,const opencascade::handle<Geom_Plane> & Plane,const Standard_Boolean AutomaticPos,const Standard_Boolean IsSetBndBox,const Bnd_Box & BndBox,const AIS_TypeOfDist TypeDist,gp_Pnt & Position,gp_Pnt & FirstAttach,gp_Pnt & SecondAttach,gp_Pnt & FirstExtreme,gp_Pnt & SecondExtreme,DsgPrs_ArrowSide & SymbolPrs);
		%feature("compactdefaultargs") SetShape3;
		%feature("autodoc", "	* Sets the shape aShape to be used as the shape aShape3 in the framework created at construction time.

	:param aShape:
	:type aShape: TopoDS_Shape &
	:rtype: None
") SetShape3;
		void SetShape3 (const TopoDS_Shape & aShape);
		%feature("compactdefaultargs") SetShape4;
		%feature("autodoc", "	* Sets the shape aShape to be used as the shape aShape4 in the framework created at construction time.

	:param aShape:
	:type aShape: TopoDS_Shape &
	:rtype: None
") SetShape4;
		void SetShape4 (const TopoDS_Shape & aShape);
		%feature("compactdefaultargs") Shape3;
		%feature("autodoc", "	* Returns the shape aShape3 from the framework created at construction time.

	:rtype: TopoDS_Shape
") Shape3;
		const TopoDS_Shape  Shape3 ();
		%feature("compactdefaultargs") Shape4;
		%feature("autodoc", "	* Returns the shape aShape4 from the framework created at construction time.

	:rtype: TopoDS_Shape
") Shape4;
		const TopoDS_Shape  Shape4 ();
};


%make_alias(AIS_EqualDistanceRelation)

%extend AIS_EqualDistanceRelation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor AIS_EqualRadiusRelation;
class AIS_EqualRadiusRelation : public AIS_Relation {
	public:
		%feature("compactdefaultargs") AIS_EqualRadiusRelation;
		%feature("autodoc", "	* Creates equal relation of two arc's radiuses. If one of edges is not in the given plane, the presentation method projects it onto the plane.

	:param aFirstEdge:
	:type aFirstEdge: TopoDS_Edge &
	:param aSecondEdge:
	:type aSecondEdge: TopoDS_Edge &
	:param aPlane:
	:type aPlane: opencascade::handle<Geom_Plane> &
	:rtype: None
") AIS_EqualRadiusRelation;
		 AIS_EqualRadiusRelation (const TopoDS_Edge & aFirstEdge,const TopoDS_Edge & aSecondEdge,const opencascade::handle<Geom_Plane> & aPlane);
		%feature("compactdefaultargs") Compute;
		%feature("autodoc", "	* computes the presentation according to a point of view given by <aProjector>. To be Used when the associated degenerated Presentations have been transformed by <aTrsf> which is not a Pure Translation. The HLR Prs can't be deducted automatically WARNING :<aTrsf> must be applied to the object to display before computation !!!

	:param aProjector:
	:type aProjector: opencascade::handle<Prs3d_Projector> &
	:param aTrsf:
	:type aTrsf: opencascade::handle<Geom_Transformation> &
	:param aPresentation:
	:type aPresentation: opencascade::handle<Prs3d_Presentation> &
	:rtype: void
") Compute;
		virtual void Compute (const opencascade::handle<Prs3d_Projector> & aProjector,const opencascade::handle<Geom_Transformation> & aTrsf,const opencascade::handle<Prs3d_Presentation> & aPresentation);
};


%make_alias(AIS_EqualRadiusRelation)

%extend AIS_EqualRadiusRelation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor AIS_FixRelation;
class AIS_FixRelation : public AIS_Relation {
	public:
		%feature("compactdefaultargs") AIS_FixRelation;
		%feature("autodoc", "	* initializes the vertex aShape, the plane aPlane and the wire aWire, which connects the two vertices in a fixed relation.

	:param aShape:
	:type aShape: TopoDS_Shape &
	:param aPlane:
	:type aPlane: opencascade::handle<Geom_Plane> &
	:param aWire:
	:type aWire: TopoDS_Wire &
	:rtype: None
") AIS_FixRelation;
		 AIS_FixRelation (const TopoDS_Shape & aShape,const opencascade::handle<Geom_Plane> & aPlane,const TopoDS_Wire & aWire);
		%feature("compactdefaultargs") AIS_FixRelation;
		%feature("autodoc", "	* initializes the vertex aShape, the plane aPlane and the wire aWire, the position aPosition, the arrow size anArrowSize and the wire aWire, which connects the two vertices in a fixed relation.

	:param aShape:
	:type aShape: TopoDS_Shape &
	:param aPlane:
	:type aPlane: opencascade::handle<Geom_Plane> &
	:param aWire:
	:type aWire: TopoDS_Wire &
	:param aPosition:
	:type aPosition: gp_Pnt
	:param anArrowSize: default value is 0.01
	:type anArrowSize: float
	:rtype: None
") AIS_FixRelation;
		 AIS_FixRelation (const TopoDS_Shape & aShape,const opencascade::handle<Geom_Plane> & aPlane,const TopoDS_Wire & aWire,const gp_Pnt & aPosition,const Standard_Real anArrowSize = 0.01);
		%feature("compactdefaultargs") AIS_FixRelation;
		%feature("autodoc", "	* initializes the edge aShape and the plane aPlane.

	:param aShape:
	:type aShape: TopoDS_Shape &
	:param aPlane:
	:type aPlane: opencascade::handle<Geom_Plane> &
	:rtype: None
") AIS_FixRelation;
		 AIS_FixRelation (const TopoDS_Shape & aShape,const opencascade::handle<Geom_Plane> & aPlane);
		%feature("compactdefaultargs") AIS_FixRelation;
		%feature("autodoc", "	* initializes the edge aShape, the plane aPlane, the position aPosition and the arrow size anArrowSize.

	:param aShape:
	:type aShape: TopoDS_Shape &
	:param aPlane:
	:type aPlane: opencascade::handle<Geom_Plane> &
	:param aPosition:
	:type aPosition: gp_Pnt
	:param anArrowSize: default value is 0.01
	:type anArrowSize: float
	:rtype: None
") AIS_FixRelation;
		 AIS_FixRelation (const TopoDS_Shape & aShape,const opencascade::handle<Geom_Plane> & aPlane,const gp_Pnt & aPosition,const Standard_Real anArrowSize = 0.01);
		%feature("compactdefaultargs") Compute;
		%feature("autodoc", "	* computes the presentation according to a point of view given by <aProjector>. To be Used when the associated degenerated Presentations have been transformed by <aTrsf> which is not a Pure Translation. The HLR Prs can't be deducted automatically WARNING :<aTrsf> must be applied to the object to display before computation !!!

	:param aProjector:
	:type aProjector: opencascade::handle<Prs3d_Projector> &
	:param aTrsf:
	:type aTrsf: opencascade::handle<Geom_Transformation> &
	:param aPresentation:
	:type aPresentation: opencascade::handle<Prs3d_Presentation> &
	:rtype: void
") Compute;
		virtual void Compute (const opencascade::handle<Prs3d_Projector> & aProjector,const opencascade::handle<Geom_Transformation> & aTrsf,const opencascade::handle<Prs3d_Presentation> & aPresentation);
		%feature("compactdefaultargs") IsMovable;
		%feature("autodoc", "	* Returns true if the Interactive Objects in the relation are movable.

	:rtype: bool
") IsMovable;
		Standard_Boolean IsMovable ();
		%feature("compactdefaultargs") SetWire;
		%feature("autodoc", "	* Constructs the wire aWire. This connects vertices which are in a fixed relation.

	:param aWire:
	:type aWire: TopoDS_Wire &
	:rtype: None
") SetWire;
		void SetWire (const TopoDS_Wire & aWire);
		%feature("compactdefaultargs") Wire;
		%feature("autodoc", "	* Returns the wire which connects vertices in a fixed relation.

	:rtype: TopoDS_Wire
") Wire;
		TopoDS_Wire Wire ();
};


%make_alias(AIS_FixRelation)

%extend AIS_FixRelation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor AIS_IdenticRelation;
class AIS_IdenticRelation : public AIS_Relation {
	public:
		%feature("compactdefaultargs") AIS_IdenticRelation;
		%feature("autodoc", "	* Initializes the relation of identity between the two entities, FirstShape and SecondShape. The plane aPlane is initialized in case a visual reference is needed to show identity.

	:param FirstShape:
	:type FirstShape: TopoDS_Shape &
	:param SecondShape:
	:type SecondShape: TopoDS_Shape &
	:param aPlane:
	:type aPlane: opencascade::handle<Geom_Plane> &
	:rtype: None
") AIS_IdenticRelation;
		 AIS_IdenticRelation (const TopoDS_Shape & FirstShape,const TopoDS_Shape & SecondShape,const opencascade::handle<Geom_Plane> & aPlane);
		%feature("compactdefaultargs") AddUser;
		%feature("autodoc", "	:param theUser:
	:type theUser: opencascade::handle<Standard_Transient> &
	:rtype: None
") AddUser;
		void AddUser (const opencascade::handle<Standard_Transient> & theUser);
		%feature("compactdefaultargs") ClearUsers;
		%feature("autodoc", "	:rtype: None
") ClearUsers;
		void ClearUsers ();
		%feature("compactdefaultargs") Compute;
		%feature("autodoc", "	* computes the presentation according to a point of view given by <aProjector>. To be Used when the associated degenerated Presentations have been transformed by <aTrsf> which is not a Pure Translation. The HLR Prs can't be deducted automatically WARNING :<aTrsf> must be applied to the object to display before computation !!!

	:param aProjector:
	:type aProjector: opencascade::handle<Prs3d_Projector> &
	:param aTrsf:
	:type aTrsf: opencascade::handle<Geom_Transformation> &
	:param aPresentation:
	:type aPresentation: opencascade::handle<Prs3d_Presentation> &
	:rtype: void
") Compute;
		virtual void Compute (const opencascade::handle<Prs3d_Projector> & aProjector,const opencascade::handle<Geom_Transformation> & aTrsf,const opencascade::handle<Prs3d_Presentation> & aPresentation);
		%feature("compactdefaultargs") HasUsers;
		%feature("autodoc", "	:rtype: bool
") HasUsers;
		Standard_Boolean HasUsers ();
		%feature("compactdefaultargs") IsMovable;
		%feature("autodoc", "	* Returns true if the interactive object is movable.

	:rtype: bool
") IsMovable;
		Standard_Boolean IsMovable ();
		%feature("compactdefaultargs") Users;
		%feature("autodoc", "	:rtype: TColStd_ListOfTransient
") Users;
		const TColStd_ListOfTransient & Users ();
};


%make_alias(AIS_IdenticRelation)

%extend AIS_IdenticRelation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor AIS_LengthDimension;
class AIS_LengthDimension : public AIS_Dimension {
	public:
		%feature("compactdefaultargs") AIS_LengthDimension;
		%feature("autodoc", "	* Construct length dimension between face and edge. Here dimension can be built without user-defined plane. @param theFace [in] the face (first shape). @param theEdge [in] the edge (second shape).

	:param theFace:
	:type theFace: TopoDS_Face &
	:param theEdge:
	:type theEdge: TopoDS_Edge &
	:rtype: None
") AIS_LengthDimension;
		 AIS_LengthDimension (const TopoDS_Face & theFace,const TopoDS_Edge & theEdge);
		%feature("compactdefaultargs") AIS_LengthDimension;
		%feature("autodoc", "	* Construct length dimension between two faces. @param theFirstFace [in] the first face (first shape). @param theSecondFace [in] the second face (second shape).

	:param theFirstFace:
	:type theFirstFace: TopoDS_Face &
	:param theSecondFace:
	:type theSecondFace: TopoDS_Face &
	:rtype: None
") AIS_LengthDimension;
		 AIS_LengthDimension (const TopoDS_Face & theFirstFace,const TopoDS_Face & theSecondFace);
		%feature("compactdefaultargs") AIS_LengthDimension;
		%feature("autodoc", "	* Construct length dimension between two points in the specified plane. @param theFirstPoint [in] the first point. @param theSecondPoint [in] the second point. @param thePlane [in] the plane to orient dimension.

	:param theFirstPoint:
	:type theFirstPoint: gp_Pnt
	:param theSecondPoint:
	:type theSecondPoint: gp_Pnt
	:param thePlane:
	:type thePlane: gp_Pln
	:rtype: None
") AIS_LengthDimension;
		 AIS_LengthDimension (const gp_Pnt & theFirstPoint,const gp_Pnt & theSecondPoint,const gp_Pln & thePlane);
		%feature("compactdefaultargs") AIS_LengthDimension;
		%feature("autodoc", "	* Construct length dimension between two arbitrary shapes in the specified plane. @param theFirstShape [in] the first shape. @param theSecondShape [in] the second shape. @param thePlane [in] the plane to orient dimension.

	:param theFirstShape:
	:type theFirstShape: TopoDS_Shape &
	:param theSecondShape:
	:type theSecondShape: TopoDS_Shape &
	:param thePlane:
	:type thePlane: gp_Pln
	:rtype: None
") AIS_LengthDimension;
		 AIS_LengthDimension (const TopoDS_Shape & theFirstShape,const TopoDS_Shape & theSecondShape,const gp_Pln & thePlane);
		%feature("compactdefaultargs") AIS_LengthDimension;
		%feature("autodoc", "	* Construct length dimension of linear edge. @param theEdge [in] the edge to measure. @param thePlane [in] the plane to orient dimension.

	:param theEdge:
	:type theEdge: TopoDS_Edge &
	:param thePlane:
	:type thePlane: gp_Pln
	:rtype: None
") AIS_LengthDimension;
		 AIS_LengthDimension (const TopoDS_Edge & theEdge,const gp_Pln & thePlane);
		%feature("compactdefaultargs") FirstPoint;
		%feature("autodoc", "	* returns first attachement point.

	:rtype: gp_Pnt
") FirstPoint;
		const gp_Pnt  FirstPoint ();
		%feature("compactdefaultargs") FirstShape;
		%feature("autodoc", "	* returns first attachement shape.

	:rtype: TopoDS_Shape
") FirstShape;
		const TopoDS_Shape  FirstShape ();
		%feature("compactdefaultargs") GetDisplayUnits;
		%feature("autodoc", "	* returns the display units string.

	:rtype: TCollection_AsciiString
") GetDisplayUnits;
		virtual const TCollection_AsciiString & GetDisplayUnits ();
		%feature("compactdefaultargs") GetModelUnits;
		%feature("autodoc", "	* returns the model units string.

	:rtype: TCollection_AsciiString
") GetModelUnits;
		virtual const TCollection_AsciiString & GetModelUnits ();
		%feature("compactdefaultargs") GetTextPosition;
		%feature("autodoc", "	:rtype: gp_Pnt
") GetTextPosition;
		virtual const gp_Pnt GetTextPosition ();
		%feature("compactdefaultargs") SecondPoint;
		%feature("autodoc", "	* returns second attachement point.

	:rtype: gp_Pnt
") SecondPoint;
		const gp_Pnt  SecondPoint ();
		%feature("compactdefaultargs") SecondShape;
		%feature("autodoc", "	* returns second attachement shape.

	:rtype: TopoDS_Shape
") SecondShape;
		const TopoDS_Shape  SecondShape ();
		%feature("compactdefaultargs") SetDirection;
		%feature("autodoc", "	* Set custom direction for dimension. If it is not set, the direction is obtained from the measured geometry (e.g. line between points of dimension) The direction does not change flyout direction of dimension. @param theDirection [in] the dimension direction. @param theUseDirection [in] boolean value if custom direction should be used.

	:param theDirection:
	:type theDirection: gp_Dir
	:param theUseDirection: default value is Standard_True
	:type theUseDirection: bool
	:rtype: None
") SetDirection;
		void SetDirection (const gp_Dir & theDirection,const Standard_Boolean theUseDirection = Standard_True);
		%feature("compactdefaultargs") SetDisplayUnits;
		%feature("autodoc", "	:param theUnits:
	:type theUnits: TCollection_AsciiString &
	:rtype: void
") SetDisplayUnits;
		virtual void SetDisplayUnits (const TCollection_AsciiString & theUnits);
		%feature("compactdefaultargs") SetMeasuredGeometry;
		%feature("autodoc", "	* Measure distance between two points. The dimension will become invalid if the new distance between attachement points is less than Precision::Confusion(). @param theFirstPoint [in] the first point. @param theSecondPoint [in] the second point. @param thePlane [in] the user-defined plane

	:param theFirstPoint:
	:type theFirstPoint: gp_Pnt
	:param theSecondPoint:
	:type theSecondPoint: gp_Pnt
	:param thePlane:
	:type thePlane: gp_Pln
	:rtype: None
") SetMeasuredGeometry;
		void SetMeasuredGeometry (const gp_Pnt & theFirstPoint,const gp_Pnt & theSecondPoint,const gp_Pln & thePlane);
		%feature("compactdefaultargs") SetMeasuredGeometry;
		%feature("autodoc", "	* Measure length of edge. The dimension will become invalid if the new length of edge is less than Precision::Confusion(). @param theEdge [in] the edge to measure. @param thePlane [in] the user-defined plane

	:param theEdge:
	:type theEdge: TopoDS_Edge &
	:param thePlane:
	:type thePlane: gp_Pln
	:rtype: None
") SetMeasuredGeometry;
		void SetMeasuredGeometry (const TopoDS_Edge & theEdge,const gp_Pln & thePlane);
		%feature("compactdefaultargs") SetMeasuredGeometry;
		%feature("autodoc", "	* Measure distance between two faces. The dimension will become invalid if the distance can not be measured or it is less than Precision::Confusion(). @param theFirstFace [in] the first face (first shape). @param theSecondFace [in] the second face (second shape).

	:param theFirstFace:
	:type theFirstFace: TopoDS_Face &
	:param theSecondFace:
	:type theSecondFace: TopoDS_Face &
	:rtype: None
") SetMeasuredGeometry;
		void SetMeasuredGeometry (const TopoDS_Face & theFirstFace,const TopoDS_Face & theSecondFace);
		%feature("compactdefaultargs") SetMeasuredGeometry;
		%feature("autodoc", "	* Measure distance between face and edge. The dimension will become invalid if the distance can not be measured or it is less than Precision::Confusion(). @param theFace [in] the face (first shape). @param theEdge [in] the edge (second shape).

	:param theFace:
	:type theFace: TopoDS_Face &
	:param theEdge:
	:type theEdge: TopoDS_Edge &
	:rtype: None
") SetMeasuredGeometry;
		void SetMeasuredGeometry (const TopoDS_Face & theFace,const TopoDS_Edge & theEdge);
		%feature("compactdefaultargs") SetMeasuredShapes;
		%feature("autodoc", "	* Measure distance between generic pair of shapes (edges, vertices, length), where measuring is applicable. @param theFirstShape [in] the first shape. @param theSecondShape [in] the second shape.

	:param theFirstShape:
	:type theFirstShape: TopoDS_Shape &
	:param theSecondShape:
	:type theSecondShape: TopoDS_Shape &
	:rtype: None
") SetMeasuredShapes;
		void SetMeasuredShapes (const TopoDS_Shape & theFirstShape,const TopoDS_Shape & theSecondShape);
		%feature("compactdefaultargs") SetModelUnits;
		%feature("autodoc", "	:param theUnits:
	:type theUnits: TCollection_AsciiString &
	:rtype: void
") SetModelUnits;
		virtual void SetModelUnits (const TCollection_AsciiString & theUnits);
		%feature("compactdefaultargs") SetTextPosition;
		%feature("autodoc", "	:param theTextPos:
	:type theTextPos: gp_Pnt
	:rtype: void
") SetTextPosition;
		virtual void SetTextPosition (const gp_Pnt & theTextPos);
};


%make_alias(AIS_LengthDimension)

%extend AIS_LengthDimension {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor AIS_MidPointRelation;
class AIS_MidPointRelation : public AIS_Relation {
	public:
		%feature("compactdefaultargs") AIS_MidPointRelation;
		%feature("autodoc", "	:param aSymmTool:
	:type aSymmTool: TopoDS_Shape &
	:param FirstShape:
	:type FirstShape: TopoDS_Shape &
	:param SecondShape:
	:type SecondShape: TopoDS_Shape &
	:param aPlane:
	:type aPlane: opencascade::handle<Geom_Plane> &
	:rtype: None
") AIS_MidPointRelation;
		 AIS_MidPointRelation (const TopoDS_Shape & aSymmTool,const TopoDS_Shape & FirstShape,const TopoDS_Shape & SecondShape,const opencascade::handle<Geom_Plane> & aPlane);
		%feature("compactdefaultargs") Compute;
		%feature("autodoc", "	* Computes the presentation according to a point of view given by <aProjector>. To be Used when the associated degenerated Presentations have been transformed by <aTrsf> which is not a Pure Translation. The HLR Prs can't be deducted automatically WARNING :<aTrsf> must be applied to the object to display before computation !!!

	:param aProjector:
	:type aProjector: opencascade::handle<Prs3d_Projector> &
	:param aTrsf:
	:type aTrsf: opencascade::handle<Geom_Transformation> &
	:param aPresentation:
	:type aPresentation: opencascade::handle<Prs3d_Presentation> &
	:rtype: void
") Compute;
		virtual void Compute (const opencascade::handle<Prs3d_Projector> & aProjector,const opencascade::handle<Geom_Transformation> & aTrsf,const opencascade::handle<Prs3d_Presentation> & aPresentation);
		%feature("compactdefaultargs") GetTool;
		%feature("autodoc", "	:rtype: TopoDS_Shape
") GetTool;
		const TopoDS_Shape  GetTool ();
		%feature("compactdefaultargs") IsMovable;
		%feature("autodoc", "	:rtype: bool
") IsMovable;
		Standard_Boolean IsMovable ();
		%feature("compactdefaultargs") SetTool;
		%feature("autodoc", "	:param aMidPointTool:
	:type aMidPointTool: TopoDS_Shape &
	:rtype: None
") SetTool;
		void SetTool (const TopoDS_Shape & aMidPointTool);
};


%make_alias(AIS_MidPointRelation)

%extend AIS_MidPointRelation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor AIS_OffsetDimension;
class AIS_OffsetDimension : public AIS_Relation {
	public:
		%feature("compactdefaultargs") AIS_OffsetDimension;
		%feature("autodoc", "	* Constructs the offset display object defined by the first shape aFShape, the second shape aSShape, the dimension aVal, and the text aText.

	:param FistShape:
	:type FistShape: TopoDS_Shape &
	:param SecondShape:
	:type SecondShape: TopoDS_Shape &
	:param aVal:
	:type aVal: float
	:param aText:
	:type aText: TCollection_ExtendedString &
	:rtype: None
") AIS_OffsetDimension;
		 AIS_OffsetDimension (const TopoDS_Shape & FistShape,const TopoDS_Shape & SecondShape,const Standard_Real aVal,const TCollection_ExtendedString & aText);
		%feature("compactdefaultargs") Compute;
		%feature("autodoc", "	* computes the presentation according to a point of view given by <aProjector>. To be Used when the associated degenerated Presentations have been transformed by <aTrsf> which is not a Pure Translation. The HLR Prs can't be deducted automatically WARNING :<aTrsf> must be applied to the object to display before computation !!!

	:param aProjector:
	:type aProjector: opencascade::handle<Prs3d_Projector> &
	:param aTrsf:
	:type aTrsf: opencascade::handle<Geom_Transformation> &
	:param aPresentation:
	:type aPresentation: opencascade::handle<Prs3d_Presentation> &
	:rtype: void
") Compute;
		virtual void Compute (const opencascade::handle<Prs3d_Projector> & aProjector,const opencascade::handle<Geom_Transformation> & aTrsf,const opencascade::handle<Prs3d_Presentation> & aPresentation);
		%feature("compactdefaultargs") IsMovable;
		%feature("autodoc", "	* Returns true if the offset datum is movable.

	:rtype: bool
") IsMovable;
		Standard_Boolean IsMovable ();
		%feature("compactdefaultargs") KindOfDimension;
		%feature("autodoc", "	* Indicates that the dimension we are concerned with is an offset.

	:rtype: AIS_KindOfDimension
") KindOfDimension;
		AIS_KindOfDimension KindOfDimension ();
		%feature("compactdefaultargs") SetRelativePos;
		%feature("autodoc", "	* Sets a transformation aTrsf for presentation and selection to a relative position.

	:param aTrsf:
	:type aTrsf: gp_Trsf
	:rtype: None
") SetRelativePos;
		void SetRelativePos (const gp_Trsf & aTrsf);
};


%make_alias(AIS_OffsetDimension)

%extend AIS_OffsetDimension {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor AIS_ParallelRelation;
class AIS_ParallelRelation : public AIS_Relation {
	public:
		%feature("compactdefaultargs") AIS_ParallelRelation;
		%feature("autodoc", "	* Constructs an object to display parallel constraints. This object is defined by the first shape aFShape and the second shape aSShape and the plane aPlane.

	:param aFShape:
	:type aFShape: TopoDS_Shape &
	:param aSShape:
	:type aSShape: TopoDS_Shape &
	:param aPlane:
	:type aPlane: opencascade::handle<Geom_Plane> &
	:rtype: None
") AIS_ParallelRelation;
		 AIS_ParallelRelation (const TopoDS_Shape & aFShape,const TopoDS_Shape & aSShape,const opencascade::handle<Geom_Plane> & aPlane);
		%feature("compactdefaultargs") AIS_ParallelRelation;
		%feature("autodoc", "	* Constructs an object to display parallel constraints. This object is defined by the first shape aFShape and the second shape aSShape the plane aPlane, the position aPosition, the type of arrow, aSymbolPrs and its size anArrowSize.

	:param aFShape:
	:type aFShape: TopoDS_Shape &
	:param aSShape:
	:type aSShape: TopoDS_Shape &
	:param aPlane:
	:type aPlane: opencascade::handle<Geom_Plane> &
	:param aPosition:
	:type aPosition: gp_Pnt
	:param aSymbolPrs:
	:type aSymbolPrs: DsgPrs_ArrowSide
	:param anArrowSize: default value is 0.01
	:type anArrowSize: float
	:rtype: None
") AIS_ParallelRelation;
		 AIS_ParallelRelation (const TopoDS_Shape & aFShape,const TopoDS_Shape & aSShape,const opencascade::handle<Geom_Plane> & aPlane,const gp_Pnt & aPosition,const DsgPrs_ArrowSide aSymbolPrs,const Standard_Real anArrowSize = 0.01);
		%feature("compactdefaultargs") Compute;
		%feature("autodoc", "	* computes the presentation according to a point of view given by <aProjector>. To be Used when the associated degenerated Presentations have been transformed by <aTrsf> which is not a Pure Translation. The HLR Prs can't be deducted automatically WARNING :<aTrsf> must be applied to the object to display before computation !!!

	:param aProjector:
	:type aProjector: opencascade::handle<Prs3d_Projector> &
	:param aTrsf:
	:type aTrsf: opencascade::handle<Geom_Transformation> &
	:param aPresentation:
	:type aPresentation: opencascade::handle<Prs3d_Presentation> &
	:rtype: void
") Compute;
		virtual void Compute (const opencascade::handle<Prs3d_Projector> & aProjector,const opencascade::handle<Geom_Transformation> & aTrsf,const opencascade::handle<Prs3d_Presentation> & aPresentation);
		%feature("compactdefaultargs") IsMovable;
		%feature("autodoc", "	* Returns true if the parallelism is movable.

	:rtype: bool
") IsMovable;
		Standard_Boolean IsMovable ();
};


%make_alias(AIS_ParallelRelation)

%extend AIS_ParallelRelation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor AIS_PerpendicularRelation;
class AIS_PerpendicularRelation : public AIS_Relation {
	public:
		%feature("compactdefaultargs") AIS_PerpendicularRelation;
		%feature("autodoc", "	* Constructs an object to display constraints of perpendicularity on shapes. This object is defined by a first shape aFShape, a second shape aSShape, and a plane aPlane. aPlane is the plane of reference to show and test the perpendicular relation between two shapes, at least one of which has a revolved surface.

	:param aFShape:
	:type aFShape: TopoDS_Shape &
	:param aSShape:
	:type aSShape: TopoDS_Shape &
	:param aPlane:
	:type aPlane: opencascade::handle<Geom_Plane> &
	:rtype: None
") AIS_PerpendicularRelation;
		 AIS_PerpendicularRelation (const TopoDS_Shape & aFShape,const TopoDS_Shape & aSShape,const opencascade::handle<Geom_Plane> & aPlane);
		%feature("compactdefaultargs") AIS_PerpendicularRelation;
		%feature("autodoc", "	* Constructs an object to display constraints of perpendicularity on shapes. This object is defined by a first shape aFShape and a second shape aSShape.

	:param aFShape:
	:type aFShape: TopoDS_Shape &
	:param aSShape:
	:type aSShape: TopoDS_Shape &
	:rtype: None
") AIS_PerpendicularRelation;
		 AIS_PerpendicularRelation (const TopoDS_Shape & aFShape,const TopoDS_Shape & aSShape);
		%feature("compactdefaultargs") Compute;
		%feature("autodoc", "	* computes the presentation according to a point of view given by <aProjector>. To be Used when the associated degenerated Presentations have been transformed by <aTrsf> which is not a Pure Translation. The HLR Prs can't be deducted automatically WARNING :<aTrsf> must be applied to the object to display before computation !!!

	:param aProjector:
	:type aProjector: opencascade::handle<Prs3d_Projector> &
	:param aTrsf:
	:type aTrsf: opencascade::handle<Geom_Transformation> &
	:param aPresentation:
	:type aPresentation: opencascade::handle<Prs3d_Presentation> &
	:rtype: void
") Compute;
		virtual void Compute (const opencascade::handle<Prs3d_Projector> & aProjector,const opencascade::handle<Geom_Transformation> & aTrsf,const opencascade::handle<Prs3d_Presentation> & aPresentation);
};


%make_alias(AIS_PerpendicularRelation)

%extend AIS_PerpendicularRelation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor AIS_RadiusDimension;
class AIS_RadiusDimension : public AIS_Dimension {
	public:
		%feature("compactdefaultargs") AIS_RadiusDimension;
		%feature("autodoc", "	* Create radius dimension for the circle geometry. @param theCircle [in] the circle to measure.

	:param theCircle:
	:type theCircle: gp_Circ
	:rtype: None
") AIS_RadiusDimension;
		 AIS_RadiusDimension (const gp_Circ & theCircle);
		%feature("compactdefaultargs") AIS_RadiusDimension;
		%feature("autodoc", "	* Create radius dimension for the circle geometry and define its orientation by location of the first point on that circle. @param theCircle [in] the circle to measure. @param theAnchorPoint [in] the point to define the position of the dimension attachment on the circle.

	:param theCircle:
	:type theCircle: gp_Circ
	:param theAnchorPoint:
	:type theAnchorPoint: gp_Pnt
	:rtype: None
") AIS_RadiusDimension;
		 AIS_RadiusDimension (const gp_Circ & theCircle,const gp_Pnt & theAnchorPoint);
		%feature("compactdefaultargs") AIS_RadiusDimension;
		%feature("autodoc", "	* Create radius dimension for the arbitrary shape (if possible). @param theShape [in] the shape to measure.

	:param theShape:
	:type theShape: TopoDS_Shape &
	:rtype: None
") AIS_RadiusDimension;
		 AIS_RadiusDimension (const TopoDS_Shape & theShape);
		%feature("compactdefaultargs") AnchorPoint;
		%feature("autodoc", "	* returns anchor point on circle for radius dimension.

	:rtype: gp_Pnt
") AnchorPoint;
		const gp_Pnt  AnchorPoint ();
		%feature("compactdefaultargs") Circle;
		%feature("autodoc", "	* returns measured geometry circle.

	:rtype: gp_Circ
") Circle;
		const gp_Circ  Circle ();
		%feature("compactdefaultargs") GetDisplayUnits;
		%feature("autodoc", "	* returns the display units string.

	:rtype: TCollection_AsciiString
") GetDisplayUnits;
		virtual const TCollection_AsciiString & GetDisplayUnits ();
		%feature("compactdefaultargs") GetModelUnits;
		%feature("autodoc", "	* returns the model units string.

	:rtype: TCollection_AsciiString
") GetModelUnits;
		virtual const TCollection_AsciiString & GetModelUnits ();
		%feature("compactdefaultargs") GetTextPosition;
		%feature("autodoc", "	:rtype: gp_Pnt
") GetTextPosition;
		virtual const gp_Pnt GetTextPosition ();
		%feature("compactdefaultargs") SetDisplayUnits;
		%feature("autodoc", "	:param theUnits:
	:type theUnits: TCollection_AsciiString &
	:rtype: void
") SetDisplayUnits;
		virtual void SetDisplayUnits (const TCollection_AsciiString & theUnits);
		%feature("compactdefaultargs") SetMeasuredGeometry;
		%feature("autodoc", "	* Measure radius of the circle. The dimension will become invalid if the radius of the circle is less than Precision::Confusion(). @param theCircle [in] the circle to measure.

	:param theCircle:
	:type theCircle: gp_Circ
	:rtype: None
") SetMeasuredGeometry;
		void SetMeasuredGeometry (const gp_Circ & theCircle);
		%feature("compactdefaultargs") SetMeasuredGeometry;
		%feature("autodoc", "	* Measure radius of the circle and orient the dimension so the dimension lines attaches to anchor point on the circle. The dimension will become invalid if the radius of the circle is less than Precision::Confusion(). @param theCircle [in] the circle to measure. @param theAnchorPoint [in] the point to attach the dimension lines, should be on the circle @param theHasAnchor [in] should be set True if theAnchorPoint should be used

	:param theCircle:
	:type theCircle: gp_Circ
	:param theAnchorPoint:
	:type theAnchorPoint: gp_Pnt
	:param theHasAnchor: default value is Standard_True
	:type theHasAnchor: bool
	:rtype: None
") SetMeasuredGeometry;
		void SetMeasuredGeometry (const gp_Circ & theCircle,const gp_Pnt & theAnchorPoint,const Standard_Boolean theHasAnchor = Standard_True);
		%feature("compactdefaultargs") SetMeasuredGeometry;
		%feature("autodoc", "	* Measure radius on the passed shape, if applicable. The dimension will become invalid if the passed shape is not measurable or if measured diameter value is less than Precision::Confusion(). @param theShape [in] the shape to measure.

	:param theShape:
	:type theShape: TopoDS_Shape &
	:rtype: None
") SetMeasuredGeometry;
		void SetMeasuredGeometry (const TopoDS_Shape & theShape);
		%feature("compactdefaultargs") SetMeasuredGeometry;
		%feature("autodoc", "	* Measure radius on the passed shape, if applicable. The dimension will become invalid if the passed shape is not measurable or if measured diameter value is less than Precision::Confusion(). @param theShape [in] the shape to measure. @param theAnchorPoint [in] the point to attach the dimension lines, should be on the circle @param theHasAnchor [in] should be set True if theAnchorPoint should be used

	:param theShape:
	:type theShape: TopoDS_Shape &
	:param theAnchorPoint:
	:type theAnchorPoint: gp_Pnt
	:param theHasAnchor: default value is Standard_True
	:type theHasAnchor: bool
	:rtype: None
") SetMeasuredGeometry;
		void SetMeasuredGeometry (const TopoDS_Shape & theShape,const gp_Pnt & theAnchorPoint,const Standard_Boolean theHasAnchor = Standard_True);
		%feature("compactdefaultargs") SetModelUnits;
		%feature("autodoc", "	:param theUnits:
	:type theUnits: TCollection_AsciiString &
	:rtype: void
") SetModelUnits;
		virtual void SetModelUnits (const TCollection_AsciiString & theUnits);
		%feature("compactdefaultargs") SetTextPosition;
		%feature("autodoc", "	:param theTextPos:
	:type theTextPos: gp_Pnt
	:rtype: void
") SetTextPosition;
		virtual void SetTextPosition (const gp_Pnt & theTextPos);
		%feature("compactdefaultargs") Shape;
		%feature("autodoc", "	* returns the measured shape.

	:rtype: TopoDS_Shape
") Shape;
		const TopoDS_Shape  Shape ();
};


%make_alias(AIS_RadiusDimension)

%extend AIS_RadiusDimension {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor AIS_SymmetricRelation;
class AIS_SymmetricRelation : public AIS_Relation {
	public:
		%feature("compactdefaultargs") AIS_SymmetricRelation;
		%feature("autodoc", "	* Constructs an object to display constraints of symmetricity. This object is defined by a tool aSymmTool, a first shape FirstShape, a second shape SecondShape, and a plane aPlane. aPlane serves as the axis of symmetry. aSymmTool is the shape composed of FirstShape SecondShape and aPlane. It may be queried and edited using the functions GetTool and SetTool. The two shapes are typically two edges, two vertices or two points.

	:param aSymmTool:
	:type aSymmTool: TopoDS_Shape &
	:param FirstShape:
	:type FirstShape: TopoDS_Shape &
	:param SecondShape:
	:type SecondShape: TopoDS_Shape &
	:param aPlane:
	:type aPlane: opencascade::handle<Geom_Plane> &
	:rtype: None
") AIS_SymmetricRelation;
		 AIS_SymmetricRelation (const TopoDS_Shape & aSymmTool,const TopoDS_Shape & FirstShape,const TopoDS_Shape & SecondShape,const opencascade::handle<Geom_Plane> & aPlane);
		%feature("compactdefaultargs") Compute;
		%feature("autodoc", "	* computes the presentation according to a point of view given by <aProjector>. To be Used when the associated degenerated Presentations have been transformed by <aTrsf> which is not a Pure Translation. The HLR Prs can't be deducted automatically WARNING :<aTrsf> must be applied to the object to display before computation !!!

	:param aProjector:
	:type aProjector: opencascade::handle<Prs3d_Projector> &
	:param aTrsf:
	:type aTrsf: opencascade::handle<Geom_Transformation> &
	:param aPresentation:
	:type aPresentation: opencascade::handle<Prs3d_Presentation> &
	:rtype: void
") Compute;
		virtual void Compute (const opencascade::handle<Prs3d_Projector> & aProjector,const opencascade::handle<Geom_Transformation> & aTrsf,const opencascade::handle<Prs3d_Presentation> & aPresentation);
		%feature("compactdefaultargs") GetTool;
		%feature("autodoc", "	* Returns the tool composed of a first shape, a second shape, and a plane. This tool is created at construction time.

	:rtype: TopoDS_Shape
") GetTool;
		const TopoDS_Shape  GetTool ();
		%feature("compactdefaultargs") IsMovable;
		%feature("autodoc", "	* Returns true if the symmetric constraint display is movable.

	:rtype: bool
") IsMovable;
		Standard_Boolean IsMovable ();
		%feature("compactdefaultargs") SetTool;
		%feature("autodoc", "	* Sets the tool aSymmetricTool composed of a first shape, a second shape, and a plane. This tool is initially created at construction time.

	:param aSymmetricTool:
	:type aSymmetricTool: TopoDS_Shape &
	:rtype: None
") SetTool;
		void SetTool (const TopoDS_Shape & aSymmetricTool);
};


%make_alias(AIS_SymmetricRelation)

%extend AIS_SymmetricRelation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor AIS_TangentRelation;
class AIS_TangentRelation : public AIS_Relation {
	public:
		%feature("compactdefaultargs") AIS_TangentRelation;
		%feature("autodoc", "	* TwoFacesTangent or TwoEdgesTangent relation Constructs an object to display tangency constraints. This object is defined by the first shape aFShape, the second shape aSShape, the plane aPlane and the index anExternRef. aPlane serves as an optional axis. anExternRef set to 0 indicates that there is no relation.

	:param aFShape:
	:type aFShape: TopoDS_Shape &
	:param aSShape:
	:type aSShape: TopoDS_Shape &
	:param aPlane:
	:type aPlane: opencascade::handle<Geom_Plane> &
	:param anExternRef: default value is 0
	:type anExternRef: int
	:rtype: None
") AIS_TangentRelation;
		 AIS_TangentRelation (const TopoDS_Shape & aFShape,const TopoDS_Shape & aSShape,const opencascade::handle<Geom_Plane> & aPlane,const Standard_Integer anExternRef = 0);
		%feature("compactdefaultargs") Compute;
		%feature("autodoc", "	* computes the presentation according to a point of view given by <aProjector>. To be Used when the associated degenerated Presentations have been transformed by <aTrsf> which is not a Pure Translation. The HLR Prs can't be deducted automatically WARNING :<aTrsf> must be applied to the object to display before computation !!!

	:param aProjector:
	:type aProjector: opencascade::handle<Prs3d_Projector> &
	:param aTrsf:
	:type aTrsf: opencascade::handle<Geom_Transformation> &
	:param aPresentation:
	:type aPresentation: opencascade::handle<Prs3d_Presentation> &
	:rtype: void
") Compute;
		virtual void Compute (const opencascade::handle<Prs3d_Projector> & aProjector,const opencascade::handle<Geom_Transformation> & aTrsf,const opencascade::handle<Prs3d_Presentation> & aPresentation);
		%feature("compactdefaultargs") ExternRef;
		%feature("autodoc", "	* Returns the external reference for tangency. The values are as follows: - 0 - there is no connection; - 1 - there is a connection to the first shape; - 2 - there is a connection to the second shape. This reference is defined at construction time.

	:rtype: int
") ExternRef;
		Standard_Integer ExternRef ();
		%feature("compactdefaultargs") SetExternRef;
		%feature("autodoc", "	* Sets the external reference for tangency, aRef. The values are as follows: - 0 - there is no connection; - 1 - there is a connection to the first shape; - 2 - there is a connection to the second shape. This reference is initially defined at construction time.

	:param aRef:
	:type aRef: int
	:rtype: None
") SetExternRef;
		void SetExternRef (const Standard_Integer aRef);
};


%make_alias(AIS_TangentRelation)

%extend AIS_TangentRelation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor AIS_TexturedShape;
class AIS_TexturedShape : public AIS_Shape {
	public:
		%feature("compactdefaultargs") AIS_TexturedShape;
		%feature("autodoc", "	* @name main methods Initializes the textured shape.

	:param theShape:
	:type theShape: TopoDS_Shape &
	:rtype: None
") AIS_TexturedShape;
		 AIS_TexturedShape (const TopoDS_Shape & theShape);
		%feature("compactdefaultargs") AcceptDisplayMode;
		%feature("autodoc", "	* Return true if specified display mode is supported (extends AIS_Shape with Display Mode 3).

	:param theMode:
	:type theMode: int
	:rtype: bool
") AcceptDisplayMode;
		Standard_Boolean AcceptDisplayMode (const Standard_Integer theMode);
		%feature("compactdefaultargs") DisableTextureModulate;
		%feature("autodoc", "	* Disables texture modulation

	:rtype: None
") DisableTextureModulate;
		void DisableTextureModulate ();
		%feature("compactdefaultargs") EnableTextureModulate;
		%feature("autodoc", "	* Enables texture modulation

	:rtype: None
") EnableTextureModulate;
		void EnableTextureModulate ();
		%feature("compactdefaultargs") SetColor;
		%feature("autodoc", "	* Sets the color.

	:param theColor:
	:type theColor: Quantity_Color &
	:rtype: void
") SetColor;
		virtual void SetColor (const Quantity_Color & theColor);
		%feature("compactdefaultargs") SetMaterial;
		%feature("autodoc", "	* Sets the material aspect.

	:param theAspect:
	:type theAspect: Graphic3d_MaterialAspect &
	:rtype: void
") SetMaterial;
		virtual void SetMaterial (const Graphic3d_MaterialAspect & theAspect);
		%feature("compactdefaultargs") SetTextureFileName;
		%feature("autodoc", "	* Sets the texture source. <theTextureFileName> can specify path to texture image or one of the standard predefined textures. The accepted file types are those used in Image_AlienPixMap with extensions such as rgb, png, jpg and more. To specify the standard predefined texture, the <theTextureFileName> should contain integer - the Graphic3d_NameOfTexture2D enumeration index. Setting texture source using this method resets the source pixmap (if was set previously).

	:param theTextureFileName:
	:type theTextureFileName: TCollection_AsciiString &
	:rtype: void
") SetTextureFileName;
		virtual void SetTextureFileName (const TCollection_AsciiString & theTextureFileName);
		%feature("compactdefaultargs") SetTextureMapOff;
		%feature("autodoc", "	* Disables texture mapping

	:rtype: None
") SetTextureMapOff;
		void SetTextureMapOff ();
		%feature("compactdefaultargs") SetTextureMapOn;
		%feature("autodoc", "	* Enables texture mapping

	:rtype: None
") SetTextureMapOn;
		void SetTextureMapOn ();
		%feature("compactdefaultargs") SetTextureOrigin;
		%feature("autodoc", "	* Use this method to change the origin of the texture. The texel (0,0) will be mapped to the surface (UOrigin,VOrigin)

	:param theToSetTextureOrigin:
	:type theToSetTextureOrigin: bool
	:param theUOrigin: default value is 0.0
	:type theUOrigin: float
	:param theVOrigin: default value is 0.0
	:type theVOrigin: float
	:rtype: None
") SetTextureOrigin;
		void SetTextureOrigin (const Standard_Boolean theToSetTextureOrigin,const Standard_Real theUOrigin = 0.0,const Standard_Real theVOrigin = 0.0);
		%feature("compactdefaultargs") SetTexturePixMap;
		%feature("autodoc", "	* Sets the texture source. <theTexturePixMap> specifies image data. Please note that the data should be in Bottom-Up order, the flag of Image_PixMap::IsTopDown() will be ignored by graphic driver. Setting texture source using this method resets the source by filename (if was set previously).

	:param theTexturePixMap:
	:type theTexturePixMap: opencascade::handle<Image_PixMap> &
	:rtype: void
") SetTexturePixMap;
		virtual void SetTexturePixMap (const opencascade::handle<Image_PixMap> & theTexturePixMap);
		%feature("compactdefaultargs") SetTextureRepeat;
		%feature("autodoc", "	* Sets the number of occurrences of the texture on each face. The texture itself is parameterized in (0,1) by (0,1). Each face of the shape to be textured is parameterized in UV space (Umin,Umax) by (Vmin,Vmax). If RepeatYN is set to false, texture coordinates are clamped in the range (0,1)x(0,1) of the face.

	:param theToRepeat:
	:type theToRepeat: bool
	:param theURepeat: default value is 1.0
	:type theURepeat: float
	:param theVRepeat: default value is 1.0
	:type theVRepeat: float
	:rtype: None
") SetTextureRepeat;
		void SetTextureRepeat (const Standard_Boolean theToRepeat,const Standard_Real theURepeat = 1.0,const Standard_Real theVRepeat = 1.0);
		%feature("compactdefaultargs") SetTextureScale;
		%feature("autodoc", "	* Use this method to scale the texture (percent of the face). You can specify a scale factor for both U and V. Example: if you set ScaleU and ScaleV to 0.5 and you enable texture repeat, the texture will appear twice on the face in each direction.

	:param theToSetTextureScale:
	:type theToSetTextureScale: bool
	:param theScaleU: default value is 1.0
	:type theScaleU: float
	:param theScaleV: default value is 1.0
	:type theScaleV: float
	:rtype: None
") SetTextureScale;
		void SetTextureScale (const Standard_Boolean theToSetTextureScale,const Standard_Real theScaleU = 1.0,const Standard_Real theScaleV = 1.0);
		%feature("compactdefaultargs") TextureFile;
		%feature("autodoc", "	* returns path to the texture file

	:rtype: char *
") TextureFile;
		const char * TextureFile ();
		%feature("compactdefaultargs") TextureMapState;
		%feature("autodoc", "	* returns flag to control texture mapping (for presentation mode 3)

	:rtype: bool
") TextureMapState;
		Standard_Boolean TextureMapState ();
		%feature("compactdefaultargs") TextureModulate;
		%feature("autodoc", "	* returns true if texture color modulation is turned on

	:rtype: bool
") TextureModulate;
		Standard_Boolean TextureModulate ();
		%feature("compactdefaultargs") TextureOrigin;
		%feature("autodoc", "	* returns true if texture UV origin has been modified

	:rtype: bool
") TextureOrigin;
		Standard_Boolean TextureOrigin ();
		%feature("compactdefaultargs") TexturePixMap;
		%feature("autodoc", "	* returns the source pixmap for texture map

	:rtype: opencascade::handle<Image_PixMap>
") TexturePixMap;
		const opencascade::handle<Image_PixMap> & TexturePixMap ();
		%feature("compactdefaultargs") TextureRepeat;
		%feature("autodoc", "	* returns texture repeat flag

	:rtype: bool
") TextureRepeat;
		Standard_Boolean TextureRepeat ();
		%feature("compactdefaultargs") TextureScale;
		%feature("autodoc", "	* returns true if scale factor should be applied to texture mapping

	:rtype: bool
") TextureScale;
		Standard_Boolean TextureScale ();
		%feature("compactdefaultargs") TextureScaleU;
		%feature("autodoc", "	* returns scale factor for U coordinate (1.0 by default)

	:rtype: float
") TextureScaleU;
		Standard_Real TextureScaleU ();
		%feature("compactdefaultargs") TextureScaleV;
		%feature("autodoc", "	* returns scale factor for V coordinate (1.0 by default)

	:rtype: float
") TextureScaleV;
		Standard_Real TextureScaleV ();
		%feature("compactdefaultargs") TextureUOrigin;
		%feature("autodoc", "	* returns texture origin U position (0.0 by default)

	:rtype: float
") TextureUOrigin;
		Standard_Real TextureUOrigin ();
		%feature("compactdefaultargs") TextureVOrigin;
		%feature("autodoc", "	* returns texture origin V position (0.0 by default)

	:rtype: float
") TextureVOrigin;
		Standard_Real TextureVOrigin ();
		%feature("compactdefaultargs") URepeat;
		%feature("autodoc", "	* returns texture repeat U value

	:rtype: float
") URepeat;
		Standard_Real URepeat ();
		%feature("compactdefaultargs") UnsetColor;
		%feature("autodoc", "	* Removes settings for the color.

	:rtype: void
") UnsetColor;
		virtual void UnsetColor ();
		%feature("compactdefaultargs") UnsetMaterial;
		%feature("autodoc", "	* Removes settings for material aspect.

	:rtype: void
") UnsetMaterial;
		virtual void UnsetMaterial ();
		%feature("compactdefaultargs") UpdateAttributes;
		%feature("autodoc", "	* @name methods to alter texture mapping properties Use this method to display the textured shape without recomputing the whole presentation. Use this method when ONLY the texture content has been changed. If other parameters (ie: scale factors, texture origin, texture repeat...) have changed, the whole presentation has to be recomputed: @code if (myShape->DisplayMode() == 3) { myAISContext->RecomputePrsOnly (myShape); } else { myAISContext->SetDisplayMode (myShape, 3, Standard_False); myAISContext->Display (myShape, Standard_True); } @endcode

	:rtype: None
") UpdateAttributes;
		void UpdateAttributes ();
		%feature("compactdefaultargs") VRepeat;
		%feature("autodoc", "	* returns texture repeat V value

	:rtype: float
") VRepeat;
		Standard_Real VRepeat ();
};


%make_alias(AIS_TexturedShape)

%extend AIS_TexturedShape {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor AIS_MaxRadiusDimension;
class AIS_MaxRadiusDimension : public AIS_EllipseRadiusDimension {
	public:
		%feature("compactdefaultargs") AIS_MaxRadiusDimension;
		%feature("autodoc", "	* Max Ellipse radius dimension Shape can be edge , planar face or cylindrical face

	:param aShape:
	:type aShape: TopoDS_Shape &
	:param aVal:
	:type aVal: float
	:param aText:
	:type aText: TCollection_ExtendedString &
	:rtype: None
") AIS_MaxRadiusDimension;
		 AIS_MaxRadiusDimension (const TopoDS_Shape & aShape,const Standard_Real aVal,const TCollection_ExtendedString & aText);
		%feature("compactdefaultargs") AIS_MaxRadiusDimension;
		%feature("autodoc", "	* Max Ellipse radius dimension with position Shape can be edge , planar face or cylindrical face

	:param aShape:
	:type aShape: TopoDS_Shape &
	:param aVal:
	:type aVal: float
	:param aText:
	:type aText: TCollection_ExtendedString &
	:param aPosition:
	:type aPosition: gp_Pnt
	:param aSymbolPrs:
	:type aSymbolPrs: DsgPrs_ArrowSide
	:param anArrowSize: default value is 0.0
	:type anArrowSize: float
	:rtype: None
") AIS_MaxRadiusDimension;
		 AIS_MaxRadiusDimension (const TopoDS_Shape & aShape,const Standard_Real aVal,const TCollection_ExtendedString & aText,const gp_Pnt & aPosition,const DsgPrs_ArrowSide aSymbolPrs,const Standard_Real anArrowSize = 0.0);
		%feature("compactdefaultargs") Compute;
		%feature("autodoc", "	* computes the presentation according to a point of view given by <aProjector>. To be Used when the associated degenerated Presentations have been transformed by <aTrsf> which is not a Pure Translation. The HLR Prs can't be deducted automatically WARNING :<aTrsf> must be applied to the object to display before computation !!!

	:param aProjector:
	:type aProjector: opencascade::handle<Prs3d_Projector> &
	:param aTrsf:
	:type aTrsf: opencascade::handle<Geom_Transformation> &
	:param aPresentation:
	:type aPresentation: opencascade::handle<Prs3d_Presentation> &
	:rtype: void
") Compute;
		virtual void Compute (const opencascade::handle<Prs3d_Projector> & aProjector,const opencascade::handle<Geom_Transformation> & aTrsf,const opencascade::handle<Prs3d_Presentation> & aPresentation);
};


%make_alias(AIS_MaxRadiusDimension)

%extend AIS_MaxRadiusDimension {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor AIS_MinRadiusDimension;
class AIS_MinRadiusDimension : public AIS_EllipseRadiusDimension {
	public:
		%feature("compactdefaultargs") AIS_MinRadiusDimension;
		%feature("autodoc", "	* Max Ellipse radius dimension Shape can be edge , planar face or cylindrical face

	:param aShape:
	:type aShape: TopoDS_Shape &
	:param aVal:
	:type aVal: float
	:param aText:
	:type aText: TCollection_ExtendedString &
	:rtype: None
") AIS_MinRadiusDimension;
		 AIS_MinRadiusDimension (const TopoDS_Shape & aShape,const Standard_Real aVal,const TCollection_ExtendedString & aText);
		%feature("compactdefaultargs") AIS_MinRadiusDimension;
		%feature("autodoc", "	* Max Ellipse radius dimension with position Shape can be edge , planar face or cylindrical face

	:param aShape:
	:type aShape: TopoDS_Shape &
	:param aVal:
	:type aVal: float
	:param aText:
	:type aText: TCollection_ExtendedString &
	:param aPosition:
	:type aPosition: gp_Pnt
	:param aSymbolPrs:
	:type aSymbolPrs: DsgPrs_ArrowSide
	:param anArrowSize: default value is 0.0
	:type anArrowSize: float
	:rtype: None
") AIS_MinRadiusDimension;
		 AIS_MinRadiusDimension (const TopoDS_Shape & aShape,const Standard_Real aVal,const TCollection_ExtendedString & aText,const gp_Pnt & aPosition,const DsgPrs_ArrowSide aSymbolPrs,const Standard_Real anArrowSize = 0.0);
		%feature("compactdefaultargs") Compute;
		%feature("autodoc", "	* computes the presentation according to a point of view given by <aProjector>. To be Used when the associated degenerated Presentations have been transformed by <aTrsf> which is not a Pure Translation. The HLR Prs can't be deducted automatically WARNING :<aTrsf> must be applied to the object to display before computation !!!

	:param aProjector:
	:type aProjector: opencascade::handle<Prs3d_Projector> &
	:param aTrsf:
	:type aTrsf: opencascade::handle<Geom_Transformation> &
	:param aPresentation:
	:type aPresentation: opencascade::handle<Prs3d_Presentation> &
	:rtype: void
") Compute;
		virtual void Compute (const opencascade::handle<Prs3d_Projector> & aProjector,const opencascade::handle<Geom_Transformation> & aTrsf,const opencascade::handle<Prs3d_Presentation> & aPresentation);
};


%make_alias(AIS_MinRadiusDimension)

%extend AIS_MinRadiusDimension {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
/* harray1 class */
/* harray2 class */
/* harray2 class */
