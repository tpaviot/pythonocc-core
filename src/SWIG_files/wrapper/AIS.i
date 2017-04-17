/*
Copyright 2008-2017 Thomas Paviot (tpaviot@gmail.com)


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
%module (package="OCC") AIS

#pragma SWIG nowarn=504,325,503

%{
#ifdef WNT
#pragma warning(disable : 4716)
#endif
%}

%include ../common/CommonIncludes.i
%include ../common/ExceptionCatcher.i
%include ../common/FunctionTransformers.i
%include ../common/Operators.i


%include AIS_headers.i


%pythoncode {
def register_handle(handle, base_object):
    """
    Inserts the handle into the base object to
    prevent memory corruption in certain cases
    """
    try:
        if base_object.IsKind("Standard_Transient"):
            base_object.thisHandle = handle
            base_object.thisown = False
    except:
        pass
};

/* typedefs */
typedef NCollection_List <Handle_Standard_Transient> AIS_NListTransient;
typedef AIS_NListTransient::Iterator AIS_NListIteratorOfListTransient;
typedef NCollection_DataMap <Handle_Standard_Transient , AIS_NListIteratorOfListTransient> AIS_NDataMapOfTransientIteratorOfListTransient;
typedef AIS_InteractiveContext * AIS_PToContext;
/* end typedefs declaration */

/* public enums */
enum AIS_ClearMode {
	AIS_CM_All = 0,
	AIS_CM_Interactive = 1,
	AIS_CM_Filters = 2,
	AIS_CM_StandardModes = 3,
	AIS_CM_TemporaryShapePrs = 4,
};

enum AIS_ConnectStatus {
	AIS_CS_None = 0,
	AIS_CS_Connection = 1,
	AIS_CS_Transform = 2,
	AIS_CS_Both = 3,
};

enum AIS_DimensionSelectionMode {
	AIS_DSM_All = 0,
	AIS_DSM_Line = 1,
	AIS_DSM_Text = 2,
};

enum AIS_DisplayMode {
	AIS_WireFrame = 0,
	AIS_Shaded = 1,
};

enum AIS_DisplaySpecialSymbol {
	AIS_DSS_No = 0,
	AIS_DSS_Before = 1,
	AIS_DSS_After = 2,
};

enum AIS_DisplayStatus {
	AIS_DS_Displayed = 0,
	AIS_DS_Erased = 1,
	AIS_DS_Temporary = 2,
	AIS_DS_None = 3,
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

enum AIS_KindOfInteractive {
	AIS_KOI_None = 0,
	AIS_KOI_Datum = 1,
	AIS_KOI_Shape = 2,
	AIS_KOI_Object = 3,
	AIS_KOI_Relation = 4,
	AIS_KOI_Dimension = 5,
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

enum AIS_SelectStatus {
	AIS_SS_Added = 0,
	AIS_SS_Removed = 1,
	AIS_SS_NotDone = 2,
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
	AIS_TOA_FirstAxis = 12,
	AIS_TOA_SecondAxis = 13,
	AIS_TOA_ThirdAxis = 14,
};

enum AIS_TypeOfAxis {
	AIS_TOAX_Unknown = 0,
	AIS_TOAX_XAxis = 1,
	AIS_TOAX_YAxis = 2,
	AIS_TOAX_ZAxis = 3,
};

enum AIS_TypeOfDist {
	AIS_TOD_Unknown = 0,
	AIS_TOD_Horizontal = 1,
	AIS_TOD_Vertical = 2,
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

/* end public enums declaration */

%rename(ais) AIS;
class AIS {
	public:
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
	:type theCurve: Handle_Geom_Curve &
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
		static Standard_Boolean Nearest (const Handle_Geom_Curve & theCurve,const gp_Pnt & thePoint,const gp_Pnt & theFirstPoint,const gp_Pnt & theLastPoint,gp_Pnt & theNearestPoint);
		%feature("compactdefaultargs") Farest;
		%feature("autodoc", "	:param aShape:
	:type aShape: TopoDS_Shape &
	:param aPoint:
	:type aPoint: gp_Pnt
	:rtype: gp_Pnt
") Farest;
		static gp_Pnt Farest (const TopoDS_Shape & aShape,const gp_Pnt & aPoint);
		%feature("compactdefaultargs") ComputeGeometry;
		%feature("autodoc", "	* Used by 2d Relation only Computes the 3d geometry of <anEdge> in the current WorkingPlane and the extremities if any Return True if ok.

	:param theEdge:
	:type theEdge: TopoDS_Edge &
	:param theCurve:
	:type theCurve: Handle_Geom_Curve &
	:param theFirstPnt:
	:type theFirstPnt: gp_Pnt
	:param theLastPnt:
	:type theLastPnt: gp_Pnt
	:rtype: bool
") ComputeGeometry;
		static Standard_Boolean ComputeGeometry (const TopoDS_Edge & theEdge,Handle_Geom_Curve & theCurve,gp_Pnt & theFirstPnt,gp_Pnt & theLastPnt);
		%feature("compactdefaultargs") ComputeGeometry;
		%feature("autodoc", "	* Used by dimensions only. Computes the 3d geometry of <anEdge>. Return True if ok.

	:param theEdge:
	:type theEdge: TopoDS_Edge &
	:param theCurve:
	:type theCurve: Handle_Geom_Curve &
	:param theFirstPnt:
	:type theFirstPnt: gp_Pnt
	:param theLastPnt:
	:type theLastPnt: gp_Pnt
	:param theIsInfinite:
	:type theIsInfinite: bool
	:rtype: bool
") ComputeGeometry;
		static Standard_Boolean ComputeGeometry (const TopoDS_Edge & theEdge,Handle_Geom_Curve & theCurve,gp_Pnt & theFirstPnt,gp_Pnt & theLastPnt,Standard_Boolean &OutValue);
		%feature("compactdefaultargs") ComputeGeometry;
		%feature("autodoc", "	* Used by 2d Relation only Computes the 3d geometry of <anEdge> in the current WorkingPlane and the extremities if any. If <aCurve> is not in the current plane, <extCurve> contains the not projected curve associated to <anEdge>. If <anEdge> is infinite, <isinfinite> = true and the 2 parameters <FirstPnt> and <LastPnt> have no signification. Return True if ok.

	:param theEdge:
	:type theEdge: TopoDS_Edge &
	:param theCurve:
	:type theCurve: Handle_Geom_Curve &
	:param theFirstPnt:
	:type theFirstPnt: gp_Pnt
	:param theLastPnt:
	:type theLastPnt: gp_Pnt
	:param theExtCurve:
	:type theExtCurve: Handle_Geom_Curve &
	:param theIsInfinite:
	:type theIsInfinite: bool
	:param theIsOnPlane:
	:type theIsOnPlane: bool
	:param thePlane:
	:type thePlane: Handle_Geom_Plane &
	:rtype: bool
") ComputeGeometry;
		static Standard_Boolean ComputeGeometry (const TopoDS_Edge & theEdge,Handle_Geom_Curve & theCurve,gp_Pnt & theFirstPnt,gp_Pnt & theLastPnt,Handle_Geom_Curve & theExtCurve,Standard_Boolean &OutValue,Standard_Boolean &OutValue,const Handle_Geom_Plane & thePlane);
		%feature("compactdefaultargs") ComputeGeometry;
		%feature("autodoc", "	* Used by 2d Relation only Computes the 3d geometry of <anEdge> in the current WorkingPlane and the extremities if any Return True if ok.

	:param theFirstEdge:
	:type theFirstEdge: TopoDS_Edge &
	:param theSecondEdge:
	:type theSecondEdge: TopoDS_Edge &
	:param theFirstCurve:
	:type theFirstCurve: Handle_Geom_Curve &
	:param theSecondCurve:
	:type theSecondCurve: Handle_Geom_Curve &
	:param theFirstPnt1:
	:type theFirstPnt1: gp_Pnt
	:param theLastPnt1:
	:type theLastPnt1: gp_Pnt
	:param theFirstPnt2:
	:type theFirstPnt2: gp_Pnt
	:param theLastPnt2:
	:type theLastPnt2: gp_Pnt
	:param thePlane:
	:type thePlane: Handle_Geom_Plane &
	:rtype: bool
") ComputeGeometry;
		static Standard_Boolean ComputeGeometry (const TopoDS_Edge & theFirstEdge,const TopoDS_Edge & theSecondEdge,Handle_Geom_Curve & theFirstCurve,Handle_Geom_Curve & theSecondCurve,gp_Pnt & theFirstPnt1,gp_Pnt & theLastPnt1,gp_Pnt & theFirstPnt2,gp_Pnt & theLastPnt2,const Handle_Geom_Plane & thePlane);
		%feature("compactdefaultargs") ComputeGeometry;
		%feature("autodoc", "	* Used by dimensions only.Computes the 3d geometry of<anEdge1> and <anEdge2> and checks if they are infinite.

	:param theFirstEdge:
	:type theFirstEdge: TopoDS_Edge &
	:param theSecondEdge:
	:type theSecondEdge: TopoDS_Edge &
	:param theFirstCurve:
	:type theFirstCurve: Handle_Geom_Curve &
	:param theSecondCurve:
	:type theSecondCurve: Handle_Geom_Curve &
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
		static Standard_Boolean ComputeGeometry (const TopoDS_Edge & theFirstEdge,const TopoDS_Edge & theSecondEdge,Handle_Geom_Curve & theFirstCurve,Handle_Geom_Curve & theSecondCurve,gp_Pnt & theFirstPnt1,gp_Pnt & theLastPnt1,gp_Pnt & theFirstPnt2,gp_Pnt & theLastPnt2,Standard_Boolean &OutValue,Standard_Boolean &OutValue);
		%feature("compactdefaultargs") ComputeGeometry;
		%feature("autodoc", "	* Used by 2d Relation only Computes the 3d geometry of<anEdge1> and <anEdge2> in the current Plane and the extremities if any. Return in ExtCurve the 3d curve (not projected in the plane) of the first edge if <indexExt> =1 or of the 2nd edge if <indexExt> = 2. If <indexExt> = 0, ExtCurve is Null. if there is an edge external to the plane, <isinfinite> is true if this edge is infinite. So, the extremities of it are not significant. Return True if ok

	:param theFirstEdge:
	:type theFirstEdge: TopoDS_Edge &
	:param theSecondEdge:
	:type theSecondEdge: TopoDS_Edge &
	:param theExtIndex:
	:type theExtIndex: int &
	:param theFirstCurve:
	:type theFirstCurve: Handle_Geom_Curve &
	:param theSecondCurve:
	:type theSecondCurve: Handle_Geom_Curve &
	:param theFirstPnt1:
	:type theFirstPnt1: gp_Pnt
	:param theLastPnt1:
	:type theLastPnt1: gp_Pnt
	:param theFirstPnt2:
	:type theFirstPnt2: gp_Pnt
	:param theLastPnt2:
	:type theLastPnt2: gp_Pnt
	:param theExtCurve:
	:type theExtCurve: Handle_Geom_Curve &
	:param theIsinfinite1:
	:type theIsinfinite1: bool
	:param theIsinfinite2:
	:type theIsinfinite2: bool
	:param thePlane:
	:type thePlane: Handle_Geom_Plane &
	:rtype: bool
") ComputeGeometry;
		static Standard_Boolean ComputeGeometry (const TopoDS_Edge & theFirstEdge,const TopoDS_Edge & theSecondEdge,Standard_Integer &OutValue,Handle_Geom_Curve & theFirstCurve,Handle_Geom_Curve & theSecondCurve,gp_Pnt & theFirstPnt1,gp_Pnt & theLastPnt1,gp_Pnt & theFirstPnt2,gp_Pnt & theLastPnt2,Handle_Geom_Curve & theExtCurve,Standard_Boolean &OutValue,Standard_Boolean &OutValue,const Handle_Geom_Plane & thePlane);
		%feature("compactdefaultargs") ComputeGeomCurve;
		%feature("autodoc", "	* Checks if aCurve belongs to aPlane; if not, projects aCurve in aPlane and returns aCurve; Return True if ok

	:param aCurve:
	:type aCurve: Handle_Geom_Curve &
	:param first1:
	:type first1: float
	:param last1:
	:type last1: float
	:param FirstPnt1:
	:type FirstPnt1: gp_Pnt
	:param LastPnt1:
	:type LastPnt1: gp_Pnt
	:param aPlane:
	:type aPlane: Handle_Geom_Plane &
	:param isOnPlane:
	:type isOnPlane: bool
	:rtype: bool
") ComputeGeomCurve;
		static Standard_Boolean ComputeGeomCurve (Handle_Geom_Curve & aCurve,const Standard_Real first1,const Standard_Real last1,gp_Pnt & FirstPnt1,gp_Pnt & LastPnt1,const Handle_Geom_Plane & aPlane,Standard_Boolean &OutValue);
		%feature("compactdefaultargs") ComputeGeometry;
		%feature("autodoc", "	:param aVertex:
	:type aVertex: TopoDS_Vertex &
	:param point:
	:type point: gp_Pnt
	:param aPlane:
	:type aPlane: Handle_Geom_Plane &
	:param isOnPlane:
	:type isOnPlane: bool
	:rtype: bool
") ComputeGeometry;
		static Standard_Boolean ComputeGeometry (const TopoDS_Vertex & aVertex,gp_Pnt & point,const Handle_Geom_Plane & aPlane,Standard_Boolean &OutValue);
		%feature("compactdefaultargs") GetPlaneFromFace;
		%feature("autodoc", "	* Tryes to get Plane from Face. Returns Surface of Face in aSurf. Returns Standard_True and Plane of Face in aPlane in following cases: Face is Plane, Offset of Plane, Extrusion of Line and Offset of Extrusion of Line Returns pure type of Surface which can be: Plane, Cylinder, Cone, Sphere, Torus, SurfaceOfRevolution, SurfaceOfExtrusion

	:param aFace:
	:type aFace: TopoDS_Face &
	:param aPlane:
	:type aPlane: gp_Pln
	:param aSurf:
	:type aSurf: Handle_Geom_Surface &
	:param aSurfType:
	:type aSurfType: AIS_KindOfSurface &
	:param Offset:
	:type Offset: float &
	:rtype: bool
") GetPlaneFromFace;
		static Standard_Boolean GetPlaneFromFace (const TopoDS_Face & aFace,gp_Pln & aPlane,Handle_Geom_Surface & aSurf,AIS_KindOfSurface & aSurfType,Standard_Real &OutValue);
		%feature("compactdefaultargs") InitFaceLength;
		%feature("autodoc", "	:param aFace:
	:type aFace: TopoDS_Face &
	:param aPlane:
	:type aPlane: gp_Pln
	:param aSurface:
	:type aSurface: Handle_Geom_Surface &
	:param aSurfaceType:
	:type aSurfaceType: AIS_KindOfSurface &
	:param anOffset:
	:type anOffset: float &
	:rtype: void
") InitFaceLength;
		static void InitFaceLength (const TopoDS_Face & aFace,gp_Pln & aPlane,Handle_Geom_Surface & aSurface,AIS_KindOfSurface & aSurfaceType,Standard_Real &OutValue);
		%feature("compactdefaultargs") InitLengthBetweenCurvilinearFaces;
		%feature("autodoc", "	* Finds attachment points on two curvilinear faces for length dimension. @param thePlaneDir [in] the direction on the dimension plane to compute the plane automatically. It will not be taken into account if plane is defined by user.

	:param theFirstFace:
	:type theFirstFace: TopoDS_Face &
	:param theSecondFace:
	:type theSecondFace: TopoDS_Face &
	:param theFirstSurf:
	:type theFirstSurf: Handle_Geom_Surface &
	:param theSecondSurf:
	:type theSecondSurf: Handle_Geom_Surface &
	:param theFirstAttach:
	:type theFirstAttach: gp_Pnt
	:param theSecondAttach:
	:type theSecondAttach: gp_Pnt
	:param theDirOnPlane:
	:type theDirOnPlane: gp_Dir
	:rtype: void
") InitLengthBetweenCurvilinearFaces;
		static void InitLengthBetweenCurvilinearFaces (const TopoDS_Face & theFirstFace,const TopoDS_Face & theSecondFace,Handle_Geom_Surface & theFirstSurf,Handle_Geom_Surface & theSecondSurf,gp_Pnt & theFirstAttach,gp_Pnt & theSecondAttach,gp_Dir & theDirOnPlane);
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
		%feature("compactdefaultargs") ProjectPointOnPlane;
		%feature("autodoc", "	:param aPoint:
	:type aPoint: gp_Pnt
	:param aPlane:
	:type aPlane: gp_Pln
	:rtype: gp_Pnt
") ProjectPointOnPlane;
		static gp_Pnt ProjectPointOnPlane (const gp_Pnt & aPoint,const gp_Pln & aPlane);
		%feature("compactdefaultargs") ProjectPointOnLine;
		%feature("autodoc", "	:param aPoint:
	:type aPoint: gp_Pnt
	:param aLine:
	:type aLine: gp_Lin
	:rtype: gp_Pnt
") ProjectPointOnLine;
		static gp_Pnt ProjectPointOnLine (const gp_Pnt & aPoint,const gp_Lin & aLine);
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
		%feature("compactdefaultargs") ComputeProjEdgePresentation;
		%feature("autodoc", "	:param aPres:
	:type aPres: Handle_Prs3d_Presentation &
	:param aDrawer:
	:type aDrawer: Handle_Prs3d_Drawer &
	:param anEdge:
	:type anEdge: TopoDS_Edge &
	:param ProjCurve:
	:type ProjCurve: Handle_Geom_Curve &
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
		static void ComputeProjEdgePresentation (const Handle_Prs3d_Presentation & aPres,const Handle_Prs3d_Drawer & aDrawer,const TopoDS_Edge & anEdge,const Handle_Geom_Curve & ProjCurve,const gp_Pnt & FirstP,const gp_Pnt & LastP,const Quantity_NameOfColor aColor = Quantity_NOC_PURPLE,const Standard_Real aWidth = 2,const Aspect_TypeOfLine aProjTOL = Aspect_TOL_DASH,const Aspect_TypeOfLine aCallTOL = Aspect_TOL_DOT);
		%feature("compactdefaultargs") ComputeProjVertexPresentation;
		%feature("autodoc", "	:param aPres:
	:type aPres: Handle_Prs3d_Presentation &
	:param aDrawer:
	:type aDrawer: Handle_Prs3d_Drawer &
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
		static void ComputeProjVertexPresentation (const Handle_Prs3d_Presentation & aPres,const Handle_Prs3d_Drawer & aDrawer,const TopoDS_Vertex & aVertex,const gp_Pnt & ProjPoint,const Quantity_NameOfColor aColor = Quantity_NOC_PURPLE,const Standard_Real aWidth = 2,const Aspect_TypeOfMarker aProjTOM = Aspect_TOM_PLUS,const Aspect_TypeOfLine aCallTOL = Aspect_TOL_DOT);
};


%extend AIS {
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
		%feature("compactdefaultargs") IsOk;
		%feature("autodoc", "	* Indicates that the selected Interactive Object passes the filter. The owner, anObj, can be either direct or user. A direct owner is the corresponding construction element, whereas a user is the compound shape of which the entity forms a part. If the Interactive Object returns Standard_True when detected by the Local Context selector through the mouse, the object is kept; if not, it is rejected.

	:param anObj:
	:type anObj: Handle_SelectMgr_EntityOwner &
	:rtype: bool
") IsOk;
		virtual Standard_Boolean IsOk (const Handle_SelectMgr_EntityOwner & anObj);
};


%extend AIS_AttributeFilter {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_AIS_AttributeFilter(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_AIS_AttributeFilter::Handle_AIS_AttributeFilter %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_AIS_AttributeFilter;
class Handle_AIS_AttributeFilter : public Handle_SelectMgr_Filter {

    public:
        // constructors
        Handle_AIS_AttributeFilter();
        Handle_AIS_AttributeFilter(const Handle_AIS_AttributeFilter &aHandle);
        Handle_AIS_AttributeFilter(const AIS_AttributeFilter *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_AIS_AttributeFilter DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_AIS_AttributeFilter {
    AIS_AttributeFilter* _get_reference() {
    return (AIS_AttributeFilter*)$self->Access();
    }
};

%extend Handle_AIS_AttributeFilter {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

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
		%feature("compactdefaultargs") IsOk;
		%feature("autodoc", "	:param EO:
	:type EO: Handle_SelectMgr_EntityOwner &
	:rtype: bool
") IsOk;
		virtual Standard_Boolean IsOk (const Handle_SelectMgr_EntityOwner & EO);
		%feature("compactdefaultargs") SetContour;
		%feature("autodoc", "	* sets <myContour> with current contour. used by IsOk.

	:param Index:
	:type Index: int
	:rtype: None
") SetContour;
		void SetContour (const Standard_Integer Index);
		%feature("compactdefaultargs") AddEdge;
		%feature("autodoc", "	* Adds an edge to the list of non-selectionnable edges.

	:param anEdge:
	:type anEdge: TopoDS_Edge &
	:param Index:
	:type Index: int
	:rtype: None
") AddEdge;
		void AddEdge (const TopoDS_Edge & anEdge,const Standard_Integer Index);
		%feature("compactdefaultargs") RemoveEdges;
		%feature("autodoc", "	* removes from the list of non-selectionnable edges all edges in the contour <Index>.

	:param Index:
	:type Index: int
	:rtype: None
") RemoveEdges;
		void RemoveEdges (const Standard_Integer Index);
};


%extend AIS_BadEdgeFilter {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_AIS_BadEdgeFilter(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_AIS_BadEdgeFilter::Handle_AIS_BadEdgeFilter %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_AIS_BadEdgeFilter;
class Handle_AIS_BadEdgeFilter : public Handle_SelectMgr_Filter {

    public:
        // constructors
        Handle_AIS_BadEdgeFilter();
        Handle_AIS_BadEdgeFilter(const Handle_AIS_BadEdgeFilter &aHandle);
        Handle_AIS_BadEdgeFilter(const AIS_BadEdgeFilter *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_AIS_BadEdgeFilter DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_AIS_BadEdgeFilter {
    AIS_BadEdgeFilter* _get_reference() {
    return (AIS_BadEdgeFilter*)$self->Access();
    }
};

%extend Handle_AIS_BadEdgeFilter {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

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
	:type EO: Handle_SelectMgr_EntityOwner &
	:rtype: bool
") IsOk;
		virtual Standard_Boolean IsOk (const Handle_SelectMgr_EntityOwner & EO);
};


%extend AIS_C0RegularityFilter {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_AIS_C0RegularityFilter(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_AIS_C0RegularityFilter::Handle_AIS_C0RegularityFilter %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_AIS_C0RegularityFilter;
class Handle_AIS_C0RegularityFilter : public Handle_SelectMgr_Filter {

    public:
        // constructors
        Handle_AIS_C0RegularityFilter();
        Handle_AIS_C0RegularityFilter(const Handle_AIS_C0RegularityFilter &aHandle);
        Handle_AIS_C0RegularityFilter(const AIS_C0RegularityFilter *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_AIS_C0RegularityFilter DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_AIS_C0RegularityFilter {
    AIS_C0RegularityFilter* _get_reference() {
    return (AIS_C0RegularityFilter*)$self->Access();
    }
};

%extend Handle_AIS_C0RegularityFilter {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

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
		bool myHasOwnWidth;
		%feature("compactdefaultargs") AIS_ColoredDrawer;
		%feature("autodoc", "	:param theLink:
	:type theLink: Handle_Prs3d_Drawer &
	:rtype: None
") AIS_ColoredDrawer;
		 AIS_ColoredDrawer (const Handle_Prs3d_Drawer & theLink);
		%feature("compactdefaultargs") IsHidden;
		%feature("autodoc", "	:rtype: bool
") IsHidden;
		Standard_Boolean IsHidden ();
		%feature("compactdefaultargs") SetHidden;
		%feature("autodoc", "	:param theToHide:
	:type theToHide: bool
	:rtype: None
") SetHidden;
		void SetHidden (const Standard_Boolean theToHide);
		%feature("compactdefaultargs") HasOwnColor;
		%feature("autodoc", "	:rtype: bool
") HasOwnColor;
		Standard_Boolean HasOwnColor ();
		%feature("compactdefaultargs") UnsetOwnColor;
		%feature("autodoc", "	:rtype: None
") UnsetOwnColor;
		void UnsetOwnColor ();
		%feature("compactdefaultargs") SetOwnColor;
		%feature("autodoc", "	:param &:
	:type &: Quantity_Color
	:rtype: None
") SetOwnColor;
		void SetOwnColor (const Quantity_Color &);
		%feature("compactdefaultargs") HasOwnWidth;
		%feature("autodoc", "	:rtype: bool
") HasOwnWidth;
		Standard_Boolean HasOwnWidth ();
		%feature("compactdefaultargs") UnsetOwnWidth;
		%feature("autodoc", "	:rtype: None
") UnsetOwnWidth;
		void UnsetOwnWidth ();
		%feature("compactdefaultargs") SetOwnWidth;
		%feature("autodoc", "	:param Standard_Real:
	:type Standard_Real: 
	:rtype: None
") SetOwnWidth;
		void SetOwnWidth (const Standard_Real);
		%feature("compactdefaultargs") DEFINE_STANDARD_RTTI;
		%feature("autodoc", "	:param :
	:type : AIS_ColoredDrawer
	:rtype: None
") DEFINE_STANDARD_RTTI;
		 DEFINE_STANDARD_RTTI (AIS_ColoredDrawer );
};


%extend AIS_ColoredDrawer {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_AIS_ColoredDrawer(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_AIS_ColoredDrawer::Handle_AIS_ColoredDrawer %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_AIS_ColoredDrawer;
class Handle_AIS_ColoredDrawer : public Handle_Prs3d_Drawer {

    public:
        // constructors
        Handle_AIS_ColoredDrawer();
        Handle_AIS_ColoredDrawer(const Handle_AIS_ColoredDrawer &aHandle);
        Handle_AIS_ColoredDrawer(const AIS_ColoredDrawer *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_AIS_ColoredDrawer DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_AIS_ColoredDrawer {
    AIS_ColoredDrawer* _get_reference() {
    return (AIS_ColoredDrawer*)$self->Access();
    }
};

%extend Handle_AIS_ColoredDrawer {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend AIS_ColoredDrawer {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor AIS_DataMapIteratorOfDataMapOfILC;
class AIS_DataMapIteratorOfDataMapOfILC : public TCollection_BasicMapIterator {
	public:
		%feature("compactdefaultargs") AIS_DataMapIteratorOfDataMapOfILC;
		%feature("autodoc", "	:rtype: None
") AIS_DataMapIteratorOfDataMapOfILC;
		 AIS_DataMapIteratorOfDataMapOfILC ();
		%feature("compactdefaultargs") AIS_DataMapIteratorOfDataMapOfILC;
		%feature("autodoc", "	:param aMap:
	:type aMap: AIS_DataMapOfILC &
	:rtype: None
") AIS_DataMapIteratorOfDataMapOfILC;
		 AIS_DataMapIteratorOfDataMapOfILC (const AIS_DataMapOfILC & aMap);
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "	:param aMap:
	:type aMap: AIS_DataMapOfILC &
	:rtype: None
") Initialize;
		void Initialize (const AIS_DataMapOfILC & aMap);
		%feature("compactdefaultargs") Key;
		%feature("autodoc", "	:rtype: int
") Key;
		const Standard_Integer & Key ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: Handle_AIS_LocalContext
") Value;
		Handle_AIS_LocalContext Value ();
};


%extend AIS_DataMapIteratorOfDataMapOfILC {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor AIS_DataMapIteratorOfDataMapOfIOStatus;
class AIS_DataMapIteratorOfDataMapOfIOStatus : public TCollection_BasicMapIterator {
	public:
		%feature("compactdefaultargs") AIS_DataMapIteratorOfDataMapOfIOStatus;
		%feature("autodoc", "	:rtype: None
") AIS_DataMapIteratorOfDataMapOfIOStatus;
		 AIS_DataMapIteratorOfDataMapOfIOStatus ();
		%feature("compactdefaultargs") AIS_DataMapIteratorOfDataMapOfIOStatus;
		%feature("autodoc", "	:param aMap:
	:type aMap: AIS_DataMapOfIOStatus &
	:rtype: None
") AIS_DataMapIteratorOfDataMapOfIOStatus;
		 AIS_DataMapIteratorOfDataMapOfIOStatus (const AIS_DataMapOfIOStatus & aMap);
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "	:param aMap:
	:type aMap: AIS_DataMapOfIOStatus &
	:rtype: None
") Initialize;
		void Initialize (const AIS_DataMapOfIOStatus & aMap);
		%feature("compactdefaultargs") Key;
		%feature("autodoc", "	:rtype: Handle_AIS_InteractiveObject
") Key;
		Handle_AIS_InteractiveObject Key ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: Handle_AIS_GlobalStatus
") Value;
		Handle_AIS_GlobalStatus Value ();
};


%extend AIS_DataMapIteratorOfDataMapOfIOStatus {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor AIS_DataMapIteratorOfDataMapOfSelStat;
class AIS_DataMapIteratorOfDataMapOfSelStat : public TCollection_BasicMapIterator {
	public:
		%feature("compactdefaultargs") AIS_DataMapIteratorOfDataMapOfSelStat;
		%feature("autodoc", "	:rtype: None
") AIS_DataMapIteratorOfDataMapOfSelStat;
		 AIS_DataMapIteratorOfDataMapOfSelStat ();
		%feature("compactdefaultargs") AIS_DataMapIteratorOfDataMapOfSelStat;
		%feature("autodoc", "	:param aMap:
	:type aMap: AIS_DataMapOfSelStat &
	:rtype: None
") AIS_DataMapIteratorOfDataMapOfSelStat;
		 AIS_DataMapIteratorOfDataMapOfSelStat (const AIS_DataMapOfSelStat & aMap);
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "	:param aMap:
	:type aMap: AIS_DataMapOfSelStat &
	:rtype: None
") Initialize;
		void Initialize (const AIS_DataMapOfSelStat & aMap);
		%feature("compactdefaultargs") Key;
		%feature("autodoc", "	:rtype: Handle_SelectMgr_SelectableObject
") Key;
		Handle_SelectMgr_SelectableObject Key ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: Handle_AIS_LocalStatus
") Value;
		Handle_AIS_LocalStatus Value ();
};


%extend AIS_DataMapIteratorOfDataMapOfSelStat {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor AIS_DataMapIteratorOfDataMapofIntegerListOfinteractive;
class AIS_DataMapIteratorOfDataMapofIntegerListOfinteractive : public TCollection_BasicMapIterator {
	public:
		%feature("compactdefaultargs") AIS_DataMapIteratorOfDataMapofIntegerListOfinteractive;
		%feature("autodoc", "	:rtype: None
") AIS_DataMapIteratorOfDataMapofIntegerListOfinteractive;
		 AIS_DataMapIteratorOfDataMapofIntegerListOfinteractive ();
		%feature("compactdefaultargs") AIS_DataMapIteratorOfDataMapofIntegerListOfinteractive;
		%feature("autodoc", "	:param aMap:
	:type aMap: AIS_DataMapofIntegerListOfinteractive &
	:rtype: None
") AIS_DataMapIteratorOfDataMapofIntegerListOfinteractive;
		 AIS_DataMapIteratorOfDataMapofIntegerListOfinteractive (const AIS_DataMapofIntegerListOfinteractive & aMap);
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "	:param aMap:
	:type aMap: AIS_DataMapofIntegerListOfinteractive &
	:rtype: None
") Initialize;
		void Initialize (const AIS_DataMapofIntegerListOfinteractive & aMap);
		%feature("compactdefaultargs") Key;
		%feature("autodoc", "	:rtype: int
") Key;
		const Standard_Integer & Key ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: AIS_ListOfInteractive
") Value;
		const AIS_ListOfInteractive & Value ();
};


%extend AIS_DataMapIteratorOfDataMapofIntegerListOfinteractive {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor AIS_DataMapNodeOfDataMapOfILC;
class AIS_DataMapNodeOfDataMapOfILC : public TCollection_MapNode {
	public:
		%feature("compactdefaultargs") AIS_DataMapNodeOfDataMapOfILC;
		%feature("autodoc", "	:param K:
	:type K: int &
	:param I:
	:type I: Handle_AIS_LocalContext &
	:param n:
	:type n: TCollection_MapNodePtr &
	:rtype: None
") AIS_DataMapNodeOfDataMapOfILC;
		 AIS_DataMapNodeOfDataMapOfILC (const Standard_Integer & K,const Handle_AIS_LocalContext & I,const TCollection_MapNodePtr & n);

            %feature("autodoc","1");
            %extend {
                Standard_Integer GetKey() {
                return (Standard_Integer) $self->Key();
                }
            };
            %feature("autodoc","1");
            %extend {
                void SetKey(Standard_Integer value ) {
                $self->Key()=value;
                }
            };
            		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: Handle_AIS_LocalContext
") Value;
		Handle_AIS_LocalContext Value ();
};


%extend AIS_DataMapNodeOfDataMapOfILC {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_AIS_DataMapNodeOfDataMapOfILC(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_AIS_DataMapNodeOfDataMapOfILC::Handle_AIS_DataMapNodeOfDataMapOfILC %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_AIS_DataMapNodeOfDataMapOfILC;
class Handle_AIS_DataMapNodeOfDataMapOfILC : public Handle_TCollection_MapNode {

    public:
        // constructors
        Handle_AIS_DataMapNodeOfDataMapOfILC();
        Handle_AIS_DataMapNodeOfDataMapOfILC(const Handle_AIS_DataMapNodeOfDataMapOfILC &aHandle);
        Handle_AIS_DataMapNodeOfDataMapOfILC(const AIS_DataMapNodeOfDataMapOfILC *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_AIS_DataMapNodeOfDataMapOfILC DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_AIS_DataMapNodeOfDataMapOfILC {
    AIS_DataMapNodeOfDataMapOfILC* _get_reference() {
    return (AIS_DataMapNodeOfDataMapOfILC*)$self->Access();
    }
};

%extend Handle_AIS_DataMapNodeOfDataMapOfILC {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend AIS_DataMapNodeOfDataMapOfILC {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor AIS_DataMapNodeOfDataMapOfIOStatus;
class AIS_DataMapNodeOfDataMapOfIOStatus : public TCollection_MapNode {
	public:
		%feature("compactdefaultargs") AIS_DataMapNodeOfDataMapOfIOStatus;
		%feature("autodoc", "	:param K:
	:type K: Handle_AIS_InteractiveObject &
	:param I:
	:type I: Handle_AIS_GlobalStatus &
	:param n:
	:type n: TCollection_MapNodePtr &
	:rtype: None
") AIS_DataMapNodeOfDataMapOfIOStatus;
		 AIS_DataMapNodeOfDataMapOfIOStatus (const Handle_AIS_InteractiveObject & K,const Handle_AIS_GlobalStatus & I,const TCollection_MapNodePtr & n);
		%feature("compactdefaultargs") Key;
		%feature("autodoc", "	:rtype: Handle_AIS_InteractiveObject
") Key;
		Handle_AIS_InteractiveObject Key ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: Handle_AIS_GlobalStatus
") Value;
		Handle_AIS_GlobalStatus Value ();
};


%extend AIS_DataMapNodeOfDataMapOfIOStatus {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_AIS_DataMapNodeOfDataMapOfIOStatus(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_AIS_DataMapNodeOfDataMapOfIOStatus::Handle_AIS_DataMapNodeOfDataMapOfIOStatus %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_AIS_DataMapNodeOfDataMapOfIOStatus;
class Handle_AIS_DataMapNodeOfDataMapOfIOStatus : public Handle_TCollection_MapNode {

    public:
        // constructors
        Handle_AIS_DataMapNodeOfDataMapOfIOStatus();
        Handle_AIS_DataMapNodeOfDataMapOfIOStatus(const Handle_AIS_DataMapNodeOfDataMapOfIOStatus &aHandle);
        Handle_AIS_DataMapNodeOfDataMapOfIOStatus(const AIS_DataMapNodeOfDataMapOfIOStatus *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_AIS_DataMapNodeOfDataMapOfIOStatus DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_AIS_DataMapNodeOfDataMapOfIOStatus {
    AIS_DataMapNodeOfDataMapOfIOStatus* _get_reference() {
    return (AIS_DataMapNodeOfDataMapOfIOStatus*)$self->Access();
    }
};

%extend Handle_AIS_DataMapNodeOfDataMapOfIOStatus {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend AIS_DataMapNodeOfDataMapOfIOStatus {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor AIS_DataMapNodeOfDataMapOfSelStat;
class AIS_DataMapNodeOfDataMapOfSelStat : public TCollection_MapNode {
	public:
		%feature("compactdefaultargs") AIS_DataMapNodeOfDataMapOfSelStat;
		%feature("autodoc", "	:param K:
	:type K: Handle_SelectMgr_SelectableObject &
	:param I:
	:type I: Handle_AIS_LocalStatus &
	:param n:
	:type n: TCollection_MapNodePtr &
	:rtype: None
") AIS_DataMapNodeOfDataMapOfSelStat;
		 AIS_DataMapNodeOfDataMapOfSelStat (const Handle_SelectMgr_SelectableObject & K,const Handle_AIS_LocalStatus & I,const TCollection_MapNodePtr & n);
		%feature("compactdefaultargs") Key;
		%feature("autodoc", "	:rtype: Handle_SelectMgr_SelectableObject
") Key;
		Handle_SelectMgr_SelectableObject Key ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: Handle_AIS_LocalStatus
") Value;
		Handle_AIS_LocalStatus Value ();
};


%extend AIS_DataMapNodeOfDataMapOfSelStat {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_AIS_DataMapNodeOfDataMapOfSelStat(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_AIS_DataMapNodeOfDataMapOfSelStat::Handle_AIS_DataMapNodeOfDataMapOfSelStat %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_AIS_DataMapNodeOfDataMapOfSelStat;
class Handle_AIS_DataMapNodeOfDataMapOfSelStat : public Handle_TCollection_MapNode {

    public:
        // constructors
        Handle_AIS_DataMapNodeOfDataMapOfSelStat();
        Handle_AIS_DataMapNodeOfDataMapOfSelStat(const Handle_AIS_DataMapNodeOfDataMapOfSelStat &aHandle);
        Handle_AIS_DataMapNodeOfDataMapOfSelStat(const AIS_DataMapNodeOfDataMapOfSelStat *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_AIS_DataMapNodeOfDataMapOfSelStat DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_AIS_DataMapNodeOfDataMapOfSelStat {
    AIS_DataMapNodeOfDataMapOfSelStat* _get_reference() {
    return (AIS_DataMapNodeOfDataMapOfSelStat*)$self->Access();
    }
};

%extend Handle_AIS_DataMapNodeOfDataMapOfSelStat {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend AIS_DataMapNodeOfDataMapOfSelStat {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor AIS_DataMapNodeOfDataMapofIntegerListOfinteractive;
class AIS_DataMapNodeOfDataMapofIntegerListOfinteractive : public TCollection_MapNode {
	public:
		%feature("compactdefaultargs") AIS_DataMapNodeOfDataMapofIntegerListOfinteractive;
		%feature("autodoc", "	:param K:
	:type K: int &
	:param I:
	:type I: AIS_ListOfInteractive &
	:param n:
	:type n: TCollection_MapNodePtr &
	:rtype: None
") AIS_DataMapNodeOfDataMapofIntegerListOfinteractive;
		 AIS_DataMapNodeOfDataMapofIntegerListOfinteractive (const Standard_Integer & K,const AIS_ListOfInteractive & I,const TCollection_MapNodePtr & n);

            %feature("autodoc","1");
            %extend {
                Standard_Integer GetKey() {
                return (Standard_Integer) $self->Key();
                }
            };
            %feature("autodoc","1");
            %extend {
                void SetKey(Standard_Integer value ) {
                $self->Key()=value;
                }
            };
            		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: AIS_ListOfInteractive
") Value;
		AIS_ListOfInteractive & Value ();
};


%extend AIS_DataMapNodeOfDataMapofIntegerListOfinteractive {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_AIS_DataMapNodeOfDataMapofIntegerListOfinteractive(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_AIS_DataMapNodeOfDataMapofIntegerListOfinteractive::Handle_AIS_DataMapNodeOfDataMapofIntegerListOfinteractive %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_AIS_DataMapNodeOfDataMapofIntegerListOfinteractive;
class Handle_AIS_DataMapNodeOfDataMapofIntegerListOfinteractive : public Handle_TCollection_MapNode {

    public:
        // constructors
        Handle_AIS_DataMapNodeOfDataMapofIntegerListOfinteractive();
        Handle_AIS_DataMapNodeOfDataMapofIntegerListOfinteractive(const Handle_AIS_DataMapNodeOfDataMapofIntegerListOfinteractive &aHandle);
        Handle_AIS_DataMapNodeOfDataMapofIntegerListOfinteractive(const AIS_DataMapNodeOfDataMapofIntegerListOfinteractive *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_AIS_DataMapNodeOfDataMapofIntegerListOfinteractive DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_AIS_DataMapNodeOfDataMapofIntegerListOfinteractive {
    AIS_DataMapNodeOfDataMapofIntegerListOfinteractive* _get_reference() {
    return (AIS_DataMapNodeOfDataMapofIntegerListOfinteractive*)$self->Access();
    }
};

%extend Handle_AIS_DataMapNodeOfDataMapofIntegerListOfinteractive {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend AIS_DataMapNodeOfDataMapofIntegerListOfinteractive {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor AIS_DataMapOfILC;
class AIS_DataMapOfILC : public TCollection_BasicMap {
	public:
		%feature("compactdefaultargs") AIS_DataMapOfILC;
		%feature("autodoc", "	:param NbBuckets: default value is 1
	:type NbBuckets: int
	:rtype: None
") AIS_DataMapOfILC;
		 AIS_DataMapOfILC (const Standard_Integer NbBuckets = 1);
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: AIS_DataMapOfILC &
	:rtype: AIS_DataMapOfILC
") Assign;
		AIS_DataMapOfILC & Assign (const AIS_DataMapOfILC & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: AIS_DataMapOfILC &
	:rtype: AIS_DataMapOfILC
") operator =;
		AIS_DataMapOfILC & operator = (const AIS_DataMapOfILC & Other);
		%feature("compactdefaultargs") ReSize;
		%feature("autodoc", "	:param NbBuckets:
	:type NbBuckets: int
	:rtype: None
") ReSize;
		void ReSize (const Standard_Integer NbBuckets);
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Bind;
		%feature("autodoc", "	:param K:
	:type K: int &
	:param I:
	:type I: Handle_AIS_LocalContext &
	:rtype: bool
") Bind;
		Standard_Boolean Bind (const Standard_Integer & K,const Handle_AIS_LocalContext & I);
		%feature("compactdefaultargs") IsBound;
		%feature("autodoc", "	:param K:
	:type K: int &
	:rtype: bool
") IsBound;
		Standard_Boolean IsBound (const Standard_Integer & K);
		%feature("compactdefaultargs") UnBind;
		%feature("autodoc", "	:param K:
	:type K: int &
	:rtype: bool
") UnBind;
		Standard_Boolean UnBind (const Standard_Integer & K);
		%feature("compactdefaultargs") Find;
		%feature("autodoc", "	:param K:
	:type K: int &
	:rtype: Handle_AIS_LocalContext
") Find;
		Handle_AIS_LocalContext Find (const Standard_Integer & K);
		%feature("compactdefaultargs") ChangeFind;
		%feature("autodoc", "	:param K:
	:type K: int &
	:rtype: Handle_AIS_LocalContext
") ChangeFind;
		Handle_AIS_LocalContext ChangeFind (const Standard_Integer & K);
		%feature("compactdefaultargs") Find1;
		%feature("autodoc", "	:param K:
	:type K: int &
	:rtype: Standard_Address
") Find1;
		Standard_Address Find1 (const Standard_Integer & K);
		%feature("compactdefaultargs") ChangeFind1;
		%feature("autodoc", "	:param K:
	:type K: int &
	:rtype: Standard_Address
") ChangeFind1;
		Standard_Address ChangeFind1 (const Standard_Integer & K);
};


%extend AIS_DataMapOfILC {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor AIS_DataMapOfIOStatus;
class AIS_DataMapOfIOStatus : public TCollection_BasicMap {
	public:
		%feature("compactdefaultargs") AIS_DataMapOfIOStatus;
		%feature("autodoc", "	:param NbBuckets: default value is 1
	:type NbBuckets: int
	:rtype: None
") AIS_DataMapOfIOStatus;
		 AIS_DataMapOfIOStatus (const Standard_Integer NbBuckets = 1);
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: AIS_DataMapOfIOStatus &
	:rtype: AIS_DataMapOfIOStatus
") Assign;
		AIS_DataMapOfIOStatus & Assign (const AIS_DataMapOfIOStatus & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: AIS_DataMapOfIOStatus &
	:rtype: AIS_DataMapOfIOStatus
") operator =;
		AIS_DataMapOfIOStatus & operator = (const AIS_DataMapOfIOStatus & Other);
		%feature("compactdefaultargs") ReSize;
		%feature("autodoc", "	:param NbBuckets:
	:type NbBuckets: int
	:rtype: None
") ReSize;
		void ReSize (const Standard_Integer NbBuckets);
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Bind;
		%feature("autodoc", "	:param K:
	:type K: Handle_AIS_InteractiveObject &
	:param I:
	:type I: Handle_AIS_GlobalStatus &
	:rtype: bool
") Bind;
		Standard_Boolean Bind (const Handle_AIS_InteractiveObject & K,const Handle_AIS_GlobalStatus & I);
		%feature("compactdefaultargs") IsBound;
		%feature("autodoc", "	:param K:
	:type K: Handle_AIS_InteractiveObject &
	:rtype: bool
") IsBound;
		Standard_Boolean IsBound (const Handle_AIS_InteractiveObject & K);
		%feature("compactdefaultargs") UnBind;
		%feature("autodoc", "	:param K:
	:type K: Handle_AIS_InteractiveObject &
	:rtype: bool
") UnBind;
		Standard_Boolean UnBind (const Handle_AIS_InteractiveObject & K);
		%feature("compactdefaultargs") Find;
		%feature("autodoc", "	:param K:
	:type K: Handle_AIS_InteractiveObject &
	:rtype: Handle_AIS_GlobalStatus
") Find;
		Handle_AIS_GlobalStatus Find (const Handle_AIS_InteractiveObject & K);
		%feature("compactdefaultargs") ChangeFind;
		%feature("autodoc", "	:param K:
	:type K: Handle_AIS_InteractiveObject &
	:rtype: Handle_AIS_GlobalStatus
") ChangeFind;
		Handle_AIS_GlobalStatus ChangeFind (const Handle_AIS_InteractiveObject & K);
		%feature("compactdefaultargs") Find1;
		%feature("autodoc", "	:param K:
	:type K: Handle_AIS_InteractiveObject &
	:rtype: Standard_Address
") Find1;
		Standard_Address Find1 (const Handle_AIS_InteractiveObject & K);
		%feature("compactdefaultargs") ChangeFind1;
		%feature("autodoc", "	:param K:
	:type K: Handle_AIS_InteractiveObject &
	:rtype: Standard_Address
") ChangeFind1;
		Standard_Address ChangeFind1 (const Handle_AIS_InteractiveObject & K);
};


%extend AIS_DataMapOfIOStatus {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor AIS_DataMapOfSelStat;
class AIS_DataMapOfSelStat : public TCollection_BasicMap {
	public:
		%feature("compactdefaultargs") AIS_DataMapOfSelStat;
		%feature("autodoc", "	:param NbBuckets: default value is 1
	:type NbBuckets: int
	:rtype: None
") AIS_DataMapOfSelStat;
		 AIS_DataMapOfSelStat (const Standard_Integer NbBuckets = 1);
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: AIS_DataMapOfSelStat &
	:rtype: AIS_DataMapOfSelStat
") Assign;
		AIS_DataMapOfSelStat & Assign (const AIS_DataMapOfSelStat & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: AIS_DataMapOfSelStat &
	:rtype: AIS_DataMapOfSelStat
") operator =;
		AIS_DataMapOfSelStat & operator = (const AIS_DataMapOfSelStat & Other);
		%feature("compactdefaultargs") ReSize;
		%feature("autodoc", "	:param NbBuckets:
	:type NbBuckets: int
	:rtype: None
") ReSize;
		void ReSize (const Standard_Integer NbBuckets);
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Bind;
		%feature("autodoc", "	:param K:
	:type K: Handle_SelectMgr_SelectableObject &
	:param I:
	:type I: Handle_AIS_LocalStatus &
	:rtype: bool
") Bind;
		Standard_Boolean Bind (const Handle_SelectMgr_SelectableObject & K,const Handle_AIS_LocalStatus & I);
		%feature("compactdefaultargs") IsBound;
		%feature("autodoc", "	:param K:
	:type K: Handle_SelectMgr_SelectableObject &
	:rtype: bool
") IsBound;
		Standard_Boolean IsBound (const Handle_SelectMgr_SelectableObject & K);
		%feature("compactdefaultargs") UnBind;
		%feature("autodoc", "	:param K:
	:type K: Handle_SelectMgr_SelectableObject &
	:rtype: bool
") UnBind;
		Standard_Boolean UnBind (const Handle_SelectMgr_SelectableObject & K);
		%feature("compactdefaultargs") Find;
		%feature("autodoc", "	:param K:
	:type K: Handle_SelectMgr_SelectableObject &
	:rtype: Handle_AIS_LocalStatus
") Find;
		Handle_AIS_LocalStatus Find (const Handle_SelectMgr_SelectableObject & K);
		%feature("compactdefaultargs") ChangeFind;
		%feature("autodoc", "	:param K:
	:type K: Handle_SelectMgr_SelectableObject &
	:rtype: Handle_AIS_LocalStatus
") ChangeFind;
		Handle_AIS_LocalStatus ChangeFind (const Handle_SelectMgr_SelectableObject & K);
		%feature("compactdefaultargs") Find1;
		%feature("autodoc", "	:param K:
	:type K: Handle_SelectMgr_SelectableObject &
	:rtype: Standard_Address
") Find1;
		Standard_Address Find1 (const Handle_SelectMgr_SelectableObject & K);
		%feature("compactdefaultargs") ChangeFind1;
		%feature("autodoc", "	:param K:
	:type K: Handle_SelectMgr_SelectableObject &
	:rtype: Standard_Address
") ChangeFind1;
		Standard_Address ChangeFind1 (const Handle_SelectMgr_SelectableObject & K);
};


%extend AIS_DataMapOfSelStat {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor AIS_DataMapofIntegerListOfinteractive;
class AIS_DataMapofIntegerListOfinteractive : public TCollection_BasicMap {
	public:
		%feature("compactdefaultargs") AIS_DataMapofIntegerListOfinteractive;
		%feature("autodoc", "	:param NbBuckets: default value is 1
	:type NbBuckets: int
	:rtype: None
") AIS_DataMapofIntegerListOfinteractive;
		 AIS_DataMapofIntegerListOfinteractive (const Standard_Integer NbBuckets = 1);
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: AIS_DataMapofIntegerListOfinteractive &
	:rtype: AIS_DataMapofIntegerListOfinteractive
") Assign;
		AIS_DataMapofIntegerListOfinteractive & Assign (const AIS_DataMapofIntegerListOfinteractive & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: AIS_DataMapofIntegerListOfinteractive &
	:rtype: AIS_DataMapofIntegerListOfinteractive
") operator =;
		AIS_DataMapofIntegerListOfinteractive & operator = (const AIS_DataMapofIntegerListOfinteractive & Other);
		%feature("compactdefaultargs") ReSize;
		%feature("autodoc", "	:param NbBuckets:
	:type NbBuckets: int
	:rtype: None
") ReSize;
		void ReSize (const Standard_Integer NbBuckets);
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Bind;
		%feature("autodoc", "	:param K:
	:type K: int &
	:param I:
	:type I: AIS_ListOfInteractive &
	:rtype: bool
") Bind;
		Standard_Boolean Bind (const Standard_Integer & K,const AIS_ListOfInteractive & I);
		%feature("compactdefaultargs") IsBound;
		%feature("autodoc", "	:param K:
	:type K: int &
	:rtype: bool
") IsBound;
		Standard_Boolean IsBound (const Standard_Integer & K);
		%feature("compactdefaultargs") UnBind;
		%feature("autodoc", "	:param K:
	:type K: int &
	:rtype: bool
") UnBind;
		Standard_Boolean UnBind (const Standard_Integer & K);
		%feature("compactdefaultargs") Find;
		%feature("autodoc", "	:param K:
	:type K: int &
	:rtype: AIS_ListOfInteractive
") Find;
		const AIS_ListOfInteractive & Find (const Standard_Integer & K);
		%feature("compactdefaultargs") ChangeFind;
		%feature("autodoc", "	:param K:
	:type K: int &
	:rtype: AIS_ListOfInteractive
") ChangeFind;
		AIS_ListOfInteractive & ChangeFind (const Standard_Integer & K);
		%feature("compactdefaultargs") Find1;
		%feature("autodoc", "	:param K:
	:type K: int &
	:rtype: Standard_Address
") Find1;
		Standard_Address Find1 (const Standard_Integer & K);
		%feature("compactdefaultargs") ChangeFind1;
		%feature("autodoc", "	:param K:
	:type K: int &
	:rtype: Standard_Address
") ChangeFind1;
		Standard_Address ChangeFind1 (const Standard_Integer & K);
};


%extend AIS_DataMapofIntegerListOfinteractive {
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
	:type theSelObject: Handle_SelectMgr_SelectableObject &
	:param theSelMode:
	:type theSelMode: AIS_DimensionSelectionMode
	:param thePriority: default value is 0
	:type thePriority: int
	:rtype: None
") AIS_DimensionOwner;
		 AIS_DimensionOwner (const Handle_SelectMgr_SelectableObject & theSelObject,const AIS_DimensionSelectionMode theSelMode,const Standard_Integer thePriority = 0);
		%feature("compactdefaultargs") SelectionMode;
		%feature("autodoc", "	:rtype: AIS_DimensionSelectionMode
") SelectionMode;
		AIS_DimensionSelectionMode SelectionMode ();
		%feature("compactdefaultargs") HilightWithColor;
		%feature("autodoc", "	:param thePM:
	:type thePM: Handle_PrsMgr_PresentationManager3d &
	:param theColor:
	:type theColor: Quantity_NameOfColor
	:param theMode: default value is 0
	:type theMode: int
	:rtype: void
") HilightWithColor;
		virtual void HilightWithColor (const Handle_PrsMgr_PresentationManager3d & thePM,const Quantity_NameOfColor theColor,const Standard_Integer theMode = 0);
		%feature("compactdefaultargs") IsHilighted;
		%feature("autodoc", "	* Returns true if an object with the selection mode aMode is highlighted in the presentation manager aPM.

	:param thePM:
	:type thePM: Handle_PrsMgr_PresentationManager &
	:param theMode: default value is 0
	:type theMode: int
	:rtype: bool
") IsHilighted;
		virtual Standard_Boolean IsHilighted (const Handle_PrsMgr_PresentationManager & thePM,const Standard_Integer theMode = 0);
		%feature("compactdefaultargs") Hilight;
		%feature("autodoc", "	:param thePM:
	:type thePM: Handle_PrsMgr_PresentationManager &
	:param theMode: default value is 0
	:type theMode: int
	:rtype: void
") Hilight;
		virtual void Hilight (const Handle_PrsMgr_PresentationManager & thePM,const Standard_Integer theMode = 0);
		%feature("compactdefaultargs") Unhilight;
		%feature("autodoc", "	* Removes highlighting from the selected part of dimension.

	:param thePM:
	:type thePM: Handle_PrsMgr_PresentationManager &
	:param theMode: default value is 0
	:type theMode: int
	:rtype: void
") Unhilight;
		virtual void Unhilight (const Handle_PrsMgr_PresentationManager & thePM,const Standard_Integer theMode = 0);
};


%extend AIS_DimensionOwner {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_AIS_DimensionOwner(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_AIS_DimensionOwner::Handle_AIS_DimensionOwner %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_AIS_DimensionOwner;
class Handle_AIS_DimensionOwner : public Handle_SelectMgr_EntityOwner {

    public:
        // constructors
        Handle_AIS_DimensionOwner();
        Handle_AIS_DimensionOwner(const Handle_AIS_DimensionOwner &aHandle);
        Handle_AIS_DimensionOwner(const AIS_DimensionOwner *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_AIS_DimensionOwner DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_AIS_DimensionOwner {
    AIS_DimensionOwner* _get_reference() {
    return (AIS_DimensionOwner*)$self->Access();
    }
};

%extend Handle_AIS_DimensionOwner {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

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
		%feature("compactdefaultargs") IsOk;
		%feature("autodoc", "	:param anObj:
	:type anObj: Handle_SelectMgr_EntityOwner &
	:rtype: bool
") IsOk;
		virtual Standard_Boolean IsOk (const Handle_SelectMgr_EntityOwner & anObj);
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
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") IsExclusionFlagOn;
		%feature("autodoc", "	:rtype: bool
") IsExclusionFlagOn;
		Standard_Boolean IsExclusionFlagOn ();
		%feature("compactdefaultargs") SetExclusionFlag;
		%feature("autodoc", "	:param Status:
	:type Status: bool
	:rtype: None
") SetExclusionFlag;
		void SetExclusionFlag (const Standard_Boolean Status);
		%feature("compactdefaultargs") IsStored;
		%feature("autodoc", "	:param aType:
	:type aType: AIS_KindOfInteractive
	:rtype: bool
") IsStored;
		Standard_Boolean IsStored (const AIS_KindOfInteractive aType);
		%feature("compactdefaultargs") ListOfStoredTypes;
		%feature("autodoc", "	:param TheList:
	:type TheList: TColStd_ListOfInteger &
	:rtype: None
") ListOfStoredTypes;
		void ListOfStoredTypes (TColStd_ListOfInteger & TheList);
		%feature("compactdefaultargs") ListOfSignature;
		%feature("autodoc", "	:param aType:
	:type aType: AIS_KindOfInteractive
	:param TheStoredList:
	:type TheStoredList: TColStd_ListOfInteger &
	:rtype: None
") ListOfSignature;
		void ListOfSignature (const AIS_KindOfInteractive aType,TColStd_ListOfInteger & TheStoredList);
};


%extend AIS_ExclusionFilter {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_AIS_ExclusionFilter(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_AIS_ExclusionFilter::Handle_AIS_ExclusionFilter %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_AIS_ExclusionFilter;
class Handle_AIS_ExclusionFilter : public Handle_SelectMgr_Filter {

    public:
        // constructors
        Handle_AIS_ExclusionFilter();
        Handle_AIS_ExclusionFilter(const Handle_AIS_ExclusionFilter &aHandle);
        Handle_AIS_ExclusionFilter(const AIS_ExclusionFilter *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_AIS_ExclusionFilter DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_AIS_ExclusionFilter {
    AIS_ExclusionFilter* _get_reference() {
    return (AIS_ExclusionFilter*)$self->Access();
    }
};

%extend Handle_AIS_ExclusionFilter {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend AIS_ExclusionFilter {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor AIS_GlobalStatus;
class AIS_GlobalStatus : public MMgt_TShared {
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
	:param TheHiCol: default value is Quantity_NOC_WHITE
	:type TheHiCol: Quantity_NameOfColor
	:param aLayerIndex: default value is 0
	:type aLayerIndex: int
	:rtype: None
") AIS_GlobalStatus;
		 AIS_GlobalStatus (const AIS_DisplayStatus aStat,const Standard_Integer aDispMode,const Standard_Integer aSelMode,const Standard_Boolean ishilighted = Standard_False,const Quantity_NameOfColor TheHiCol = Quantity_NOC_WHITE,const Standard_Integer aLayerIndex = 0);
		%feature("compactdefaultargs") SetGraphicStatus;
		%feature("autodoc", "	:param aStat:
	:type aStat: AIS_DisplayStatus
	:rtype: None
") SetGraphicStatus;
		void SetGraphicStatus (const AIS_DisplayStatus aStat);
		%feature("compactdefaultargs") AddDisplayMode;
		%feature("autodoc", "	:param aMode:
	:type aMode: int
	:rtype: None
") AddDisplayMode;
		void AddDisplayMode (const Standard_Integer aMode);
		%feature("compactdefaultargs") AddSelectionMode;
		%feature("autodoc", "	:param aMode:
	:type aMode: int
	:rtype: None
") AddSelectionMode;
		void AddSelectionMode (const Standard_Integer aMode);
		%feature("compactdefaultargs") SetLayerIndex;
		%feature("autodoc", "	:param AnIndex:
	:type AnIndex: int
	:rtype: None
") SetLayerIndex;
		void SetLayerIndex (const Standard_Integer AnIndex);
		%feature("compactdefaultargs") SetHilightStatus;
		%feature("autodoc", "	:param aStat:
	:type aStat: bool
	:rtype: None
") SetHilightStatus;
		void SetHilightStatus (const Standard_Boolean aStat);
		%feature("compactdefaultargs") SetHilightColor;
		%feature("autodoc", "	:param aHiCol:
	:type aHiCol: Quantity_NameOfColor
	:rtype: None
") SetHilightColor;
		void SetHilightColor (const Quantity_NameOfColor aHiCol);
		%feature("compactdefaultargs") IsSubIntensityOn;
		%feature("autodoc", "	:rtype: bool
") IsSubIntensityOn;
		Standard_Boolean IsSubIntensityOn ();
		%feature("compactdefaultargs") SubIntensityOn;
		%feature("autodoc", "	:rtype: None
") SubIntensityOn;
		void SubIntensityOn ();
		%feature("compactdefaultargs") SubIntensityOff;
		%feature("autodoc", "	:rtype: None
") SubIntensityOff;
		void SubIntensityOff ();
		%feature("compactdefaultargs") RemoveDisplayMode;
		%feature("autodoc", "	:param aMode:
	:type aMode: int
	:rtype: None
") RemoveDisplayMode;
		void RemoveDisplayMode (const Standard_Integer aMode);
		%feature("compactdefaultargs") RemoveSelectionMode;
		%feature("autodoc", "	:param aMode:
	:type aMode: int
	:rtype: None
") RemoveSelectionMode;
		void RemoveSelectionMode (const Standard_Integer aMode);
		%feature("compactdefaultargs") ClearSelectionModes;
		%feature("autodoc", "	:rtype: None
") ClearSelectionModes;
		void ClearSelectionModes ();
		%feature("compactdefaultargs") GraphicStatus;
		%feature("autodoc", "	:rtype: AIS_DisplayStatus
") GraphicStatus;
		AIS_DisplayStatus GraphicStatus ();
		%feature("compactdefaultargs") DisplayedModes;
		%feature("autodoc", "	* keeps the information of displayed modes in the main viewer.

	:rtype: TColStd_ListOfInteger
") DisplayedModes;
		const TColStd_ListOfInteger & DisplayedModes ();
		%feature("compactdefaultargs") SelectionModes;
		%feature("autodoc", "	* keeps the active selection modes of the object in the main viewer.

	:rtype: TColStd_ListOfInteger
") SelectionModes;
		const TColStd_ListOfInteger & SelectionModes ();
		%feature("compactdefaultargs") IsHilighted;
		%feature("autodoc", "	:rtype: bool
") IsHilighted;
		Standard_Boolean IsHilighted ();
		%feature("compactdefaultargs") HilightColor;
		%feature("autodoc", "	:rtype: Quantity_NameOfColor
") HilightColor;
		Quantity_NameOfColor HilightColor ();
		%feature("compactdefaultargs") IsDModeIn;
		%feature("autodoc", "	:param aMode:
	:type aMode: int
	:rtype: bool
") IsDModeIn;
		Standard_Boolean IsDModeIn (const Standard_Integer aMode);
		%feature("compactdefaultargs") IsSModeIn;
		%feature("autodoc", "	:param aMode:
	:type aMode: int
	:rtype: bool
") IsSModeIn;
		Standard_Boolean IsSModeIn (const Standard_Integer aMode);
};


%extend AIS_GlobalStatus {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_AIS_GlobalStatus(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_AIS_GlobalStatus::Handle_AIS_GlobalStatus %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_AIS_GlobalStatus;
class Handle_AIS_GlobalStatus : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_AIS_GlobalStatus();
        Handle_AIS_GlobalStatus(const Handle_AIS_GlobalStatus &aHandle);
        Handle_AIS_GlobalStatus(const AIS_GlobalStatus *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_AIS_GlobalStatus DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_AIS_GlobalStatus {
    AIS_GlobalStatus* _get_reference() {
    return (AIS_GlobalStatus*)$self->Access();
    }
};

%extend Handle_AIS_GlobalStatus {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend AIS_GlobalStatus {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
class AIS_GraphicTool {
	public:
		%feature("compactdefaultargs") GetLineColor;
		%feature("autodoc", "	:param aDrawer:
	:type aDrawer: Handle_Prs3d_Drawer &
	:param TheTypeOfAttributes:
	:type TheTypeOfAttributes: AIS_TypeOfAttribute
	:rtype: Quantity_NameOfColor
") GetLineColor;
		static Quantity_NameOfColor GetLineColor (const Handle_Prs3d_Drawer & aDrawer,const AIS_TypeOfAttribute TheTypeOfAttributes);
		%feature("compactdefaultargs") GetLineColor;
		%feature("autodoc", "	:param aDrawer:
	:type aDrawer: Handle_Prs3d_Drawer &
	:param TheTypeOfAttributes:
	:type TheTypeOfAttributes: AIS_TypeOfAttribute
	:param TheLineColor:
	:type TheLineColor: Quantity_Color &
	:rtype: void
") GetLineColor;
		static void GetLineColor (const Handle_Prs3d_Drawer & aDrawer,const AIS_TypeOfAttribute TheTypeOfAttributes,Quantity_Color & TheLineColor);
		%feature("compactdefaultargs") GetLineWidth;
		%feature("autodoc", "	:param aDrawer:
	:type aDrawer: Handle_Prs3d_Drawer &
	:param TheTypeOfAttributes:
	:type TheTypeOfAttributes: AIS_TypeOfAttribute
	:rtype: float
") GetLineWidth;
		static Standard_Real GetLineWidth (const Handle_Prs3d_Drawer & aDrawer,const AIS_TypeOfAttribute TheTypeOfAttributes);
		%feature("compactdefaultargs") GetLineType;
		%feature("autodoc", "	:param aDrawer:
	:type aDrawer: Handle_Prs3d_Drawer &
	:param TheTypeOfAttributes:
	:type TheTypeOfAttributes: AIS_TypeOfAttribute
	:rtype: Aspect_TypeOfLine
") GetLineType;
		static Aspect_TypeOfLine GetLineType (const Handle_Prs3d_Drawer & aDrawer,const AIS_TypeOfAttribute TheTypeOfAttributes);
		%feature("compactdefaultargs") GetLineAtt;
		%feature("autodoc", "	:param aDrawer:
	:type aDrawer: Handle_Prs3d_Drawer &
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
		static void GetLineAtt (const Handle_Prs3d_Drawer & aDrawer,const AIS_TypeOfAttribute TheTypeOfAttributes,Quantity_NameOfColor & aCol,Standard_Real &OutValue,Aspect_TypeOfLine & aTyp);
		%feature("compactdefaultargs") GetInteriorColor;
		%feature("autodoc", "	:param aDrawer:
	:type aDrawer: Handle_Prs3d_Drawer &
	:rtype: Quantity_NameOfColor
") GetInteriorColor;
		static Quantity_NameOfColor GetInteriorColor (const Handle_Prs3d_Drawer & aDrawer);
		%feature("compactdefaultargs") GetInteriorColor;
		%feature("autodoc", "	:param aDrawer:
	:type aDrawer: Handle_Prs3d_Drawer &
	:param aColor:
	:type aColor: Quantity_Color &
	:rtype: void
") GetInteriorColor;
		static void GetInteriorColor (const Handle_Prs3d_Drawer & aDrawer,Quantity_Color & aColor);
		%feature("compactdefaultargs") GetMaterial;
		%feature("autodoc", "	:param aDrawer:
	:type aDrawer: Handle_Prs3d_Drawer &
	:rtype: Graphic3d_MaterialAspect
") GetMaterial;
		static Graphic3d_MaterialAspect GetMaterial (const Handle_Prs3d_Drawer & aDrawer);
};


%extend AIS_GraphicTool {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor AIS_IndexedDataMapNodeOfIndexedDataMapOfOwnerPrs;
class AIS_IndexedDataMapNodeOfIndexedDataMapOfOwnerPrs : public TCollection_MapNode {
	public:
		%feature("compactdefaultargs") AIS_IndexedDataMapNodeOfIndexedDataMapOfOwnerPrs;
		%feature("autodoc", "	:param K1:
	:type K1: Handle_SelectMgr_EntityOwner &
	:param K2:
	:type K2: int
	:param I:
	:type I: Handle_Prs3d_Presentation &
	:param n1:
	:type n1: TCollection_MapNodePtr &
	:param n2:
	:type n2: TCollection_MapNodePtr &
	:rtype: None
") AIS_IndexedDataMapNodeOfIndexedDataMapOfOwnerPrs;
		 AIS_IndexedDataMapNodeOfIndexedDataMapOfOwnerPrs (const Handle_SelectMgr_EntityOwner & K1,const Standard_Integer K2,const Handle_Prs3d_Presentation & I,const TCollection_MapNodePtr & n1,const TCollection_MapNodePtr & n2);
		%feature("compactdefaultargs") Key1;
		%feature("autodoc", "	:rtype: Handle_SelectMgr_EntityOwner
") Key1;
		Handle_SelectMgr_EntityOwner Key1 ();

            %feature("autodoc","1");
            %extend {
                Standard_Integer GetKey2() {
                return (Standard_Integer) $self->Key2();
                }
            };
            %feature("autodoc","1");
            %extend {
                void SetKey2(Standard_Integer value ) {
                $self->Key2()=value;
                }
            };
            		%feature("compactdefaultargs") Next2;
		%feature("autodoc", "	:rtype: TCollection_MapNodePtr
") Next2;
		TCollection_MapNodePtr & Next2 ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: Handle_Prs3d_Presentation
") Value;
		Handle_Prs3d_Presentation Value ();
};


%extend AIS_IndexedDataMapNodeOfIndexedDataMapOfOwnerPrs {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_AIS_IndexedDataMapNodeOfIndexedDataMapOfOwnerPrs(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_AIS_IndexedDataMapNodeOfIndexedDataMapOfOwnerPrs::Handle_AIS_IndexedDataMapNodeOfIndexedDataMapOfOwnerPrs %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_AIS_IndexedDataMapNodeOfIndexedDataMapOfOwnerPrs;
class Handle_AIS_IndexedDataMapNodeOfIndexedDataMapOfOwnerPrs : public Handle_TCollection_MapNode {

    public:
        // constructors
        Handle_AIS_IndexedDataMapNodeOfIndexedDataMapOfOwnerPrs();
        Handle_AIS_IndexedDataMapNodeOfIndexedDataMapOfOwnerPrs(const Handle_AIS_IndexedDataMapNodeOfIndexedDataMapOfOwnerPrs &aHandle);
        Handle_AIS_IndexedDataMapNodeOfIndexedDataMapOfOwnerPrs(const AIS_IndexedDataMapNodeOfIndexedDataMapOfOwnerPrs *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_AIS_IndexedDataMapNodeOfIndexedDataMapOfOwnerPrs DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_AIS_IndexedDataMapNodeOfIndexedDataMapOfOwnerPrs {
    AIS_IndexedDataMapNodeOfIndexedDataMapOfOwnerPrs* _get_reference() {
    return (AIS_IndexedDataMapNodeOfIndexedDataMapOfOwnerPrs*)$self->Access();
    }
};

%extend Handle_AIS_IndexedDataMapNodeOfIndexedDataMapOfOwnerPrs {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend AIS_IndexedDataMapNodeOfIndexedDataMapOfOwnerPrs {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor AIS_IndexedDataMapOfOwnerPrs;
class AIS_IndexedDataMapOfOwnerPrs : public TCollection_BasicMap {
	public:
		%feature("compactdefaultargs") AIS_IndexedDataMapOfOwnerPrs;
		%feature("autodoc", "	:param NbBuckets: default value is 1
	:type NbBuckets: int
	:rtype: None
") AIS_IndexedDataMapOfOwnerPrs;
		 AIS_IndexedDataMapOfOwnerPrs (const Standard_Integer NbBuckets = 1);
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: AIS_IndexedDataMapOfOwnerPrs &
	:rtype: AIS_IndexedDataMapOfOwnerPrs
") Assign;
		AIS_IndexedDataMapOfOwnerPrs & Assign (const AIS_IndexedDataMapOfOwnerPrs & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: AIS_IndexedDataMapOfOwnerPrs &
	:rtype: AIS_IndexedDataMapOfOwnerPrs
") operator =;
		AIS_IndexedDataMapOfOwnerPrs & operator = (const AIS_IndexedDataMapOfOwnerPrs & Other);
		%feature("compactdefaultargs") ReSize;
		%feature("autodoc", "	:param NbBuckets:
	:type NbBuckets: int
	:rtype: None
") ReSize;
		void ReSize (const Standard_Integer NbBuckets);
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "	:param K:
	:type K: Handle_SelectMgr_EntityOwner &
	:param I:
	:type I: Handle_Prs3d_Presentation &
	:rtype: int
") Add;
		Standard_Integer Add (const Handle_SelectMgr_EntityOwner & K,const Handle_Prs3d_Presentation & I);
		%feature("compactdefaultargs") Substitute;
		%feature("autodoc", "	:param I:
	:type I: int
	:param K:
	:type K: Handle_SelectMgr_EntityOwner &
	:param T:
	:type T: Handle_Prs3d_Presentation &
	:rtype: None
") Substitute;
		void Substitute (const Standard_Integer I,const Handle_SelectMgr_EntityOwner & K,const Handle_Prs3d_Presentation & T);
		%feature("compactdefaultargs") RemoveLast;
		%feature("autodoc", "	:rtype: None
") RemoveLast;
		void RemoveLast ();
		%feature("compactdefaultargs") Contains;
		%feature("autodoc", "	:param K:
	:type K: Handle_SelectMgr_EntityOwner &
	:rtype: bool
") Contains;
		Standard_Boolean Contains (const Handle_SelectMgr_EntityOwner & K);
		%feature("compactdefaultargs") FindKey;
		%feature("autodoc", "	:param I:
	:type I: int
	:rtype: Handle_SelectMgr_EntityOwner
") FindKey;
		Handle_SelectMgr_EntityOwner FindKey (const Standard_Integer I);
		%feature("compactdefaultargs") FindFromIndex;
		%feature("autodoc", "	:param I:
	:type I: int
	:rtype: Handle_Prs3d_Presentation
") FindFromIndex;
		Handle_Prs3d_Presentation FindFromIndex (const Standard_Integer I);
		%feature("compactdefaultargs") ChangeFromIndex;
		%feature("autodoc", "	:param I:
	:type I: int
	:rtype: Handle_Prs3d_Presentation
") ChangeFromIndex;
		Handle_Prs3d_Presentation ChangeFromIndex (const Standard_Integer I);
		%feature("compactdefaultargs") FindIndex;
		%feature("autodoc", "	:param K:
	:type K: Handle_SelectMgr_EntityOwner &
	:rtype: int
") FindIndex;
		Standard_Integer FindIndex (const Handle_SelectMgr_EntityOwner & K);
		%feature("compactdefaultargs") FindFromKey;
		%feature("autodoc", "	:param K:
	:type K: Handle_SelectMgr_EntityOwner &
	:rtype: Handle_Prs3d_Presentation
") FindFromKey;
		Handle_Prs3d_Presentation FindFromKey (const Handle_SelectMgr_EntityOwner & K);
		%feature("compactdefaultargs") ChangeFromKey;
		%feature("autodoc", "	:param K:
	:type K: Handle_SelectMgr_EntityOwner &
	:rtype: Handle_Prs3d_Presentation
") ChangeFromKey;
		Handle_Prs3d_Presentation ChangeFromKey (const Handle_SelectMgr_EntityOwner & K);
		%feature("compactdefaultargs") FindFromKey1;
		%feature("autodoc", "	:param K:
	:type K: Handle_SelectMgr_EntityOwner &
	:rtype: Standard_Address
") FindFromKey1;
		Standard_Address FindFromKey1 (const Handle_SelectMgr_EntityOwner & K);
		%feature("compactdefaultargs") ChangeFromKey1;
		%feature("autodoc", "	:param K:
	:type K: Handle_SelectMgr_EntityOwner &
	:rtype: Standard_Address
") ChangeFromKey1;
		Standard_Address ChangeFromKey1 (const Handle_SelectMgr_EntityOwner & K);
};


%extend AIS_IndexedDataMapOfOwnerPrs {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor AIS_InteractiveContext;
class AIS_InteractiveContext : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") AIS_InteractiveContext;
		%feature("autodoc", "	* Constructs the interactive context object defined by the principal viewer MainViewer.

	:param MainViewer:
	:type MainViewer: Handle_V3d_Viewer &
	:rtype: None
") AIS_InteractiveContext;
		 AIS_InteractiveContext (const Handle_V3d_Viewer & MainViewer);
		%feature("compactdefaultargs") Delete;
		%feature("autodoc", "	:rtype: void
") Delete;
		virtual void Delete ();
		%feature("compactdefaultargs") SetAutoActivateSelection;
		%feature("autodoc", "	:param Auto:
	:type Auto: bool
	:rtype: None
") SetAutoActivateSelection;
		void SetAutoActivateSelection (const Standard_Boolean Auto);
		%feature("compactdefaultargs") GetAutoActivateSelection;
		%feature("autodoc", "	:rtype: bool
") GetAutoActivateSelection;
		Standard_Boolean GetAutoActivateSelection ();
		%feature("compactdefaultargs") Display;
		%feature("autodoc", "	* Controls the choice between the using the display and selection modes of open local context which you have defined and activating those available by default. If a local context is open and if updateviewer equals Standard_False, the Interactive Object anIobj is displayed in the default active mode. This will be the object's default display mode, if there is one. Otherwise, it will be the context mode. The Interactive Object's default selection mode is activated. In general, this is 0. This syntax has the same behavior as local context, open or closed. If you want to view the object in open local context without selection, use the syntax below, setting aSelectionMode to -1.

	:param anIobj:
	:type anIobj: Handle_AIS_InteractiveObject &
	:param updateviewer: default value is Standard_True
	:type updateviewer: bool
	:rtype: None
") Display;
		void Display (const Handle_AIS_InteractiveObject & anIobj,const Standard_Boolean updateviewer = Standard_True);
		%feature("compactdefaultargs") Display;
		%feature("autodoc", "	* Controls the choice between the using the display and selection modes of open local context which you have defined and activating those available by default. If no Local Context is opened. and the Interactive Object theIObj has no display mode of its own, the default display mode, 0, is used. Likewise, if theIObj has no selection mode of its own, the default one, 0, is used. If a local context is open and if theToUpdateViewer equals Standard_False, the presentation of the Interactive Object activates the selection mode; the object is displayed but no viewer will be updated. If theSelectionMode equals -1, theIObj will not be activated: it will be displayed but will not be selectable. Use this if you want to view the object in open local context without selection. Note: This option is only available in Local Context. If theToAllowDecomposition equals true, theIObj can have subshapes detected by selection mechanisms. theIObj must be able to give a shape selection modes which fit the AIS_Shape selection modes: - vertices: 1 - edges: 2 - wires: 3.

	:param theIObj:
	:type theIObj: Handle_AIS_InteractiveObject &
	:param theDispMode:
	:type theDispMode: int
	:param theSelectionMode:
	:type theSelectionMode: int
	:param theToUpdateViewer: default value is Standard_True
	:type theToUpdateViewer: bool
	:param theToAllowDecomposition: default value is Standard_True
	:type theToAllowDecomposition: bool
	:param theDispStatus: default value is AIS_DS_None
	:type theDispStatus: AIS_DisplayStatus
	:rtype: None
") Display;
		void Display (const Handle_AIS_InteractiveObject & theIObj,const Standard_Integer theDispMode,const Standard_Integer theSelectionMode,const Standard_Boolean theToUpdateViewer = Standard_True,const Standard_Boolean theToAllowDecomposition = Standard_True,const AIS_DisplayStatus theDispStatus = AIS_DS_None);
		%feature("compactdefaultargs") Load;
		%feature("autodoc", "	* Allows you to load the Interactive Object aniobj with a given selection mode SelectionMode, and/or with the desired decomposition option, whether the object is visualized or not. If AllowDecomp = Standard_True and, if the interactive object is of the 'Shape' type, these 'standard' selection modes will be automatically activated as a function of the modes present in the Local Context. The loaded objects will be selectable but displayable in highlighting only when detected by the Selector. This method is available only when Local Contexts are open.

	:param aniobj:
	:type aniobj: Handle_AIS_InteractiveObject &
	:param SelectionMode: default value is -1
	:type SelectionMode: int
	:param AllowDecomp: default value is Standard_False
	:type AllowDecomp: bool
	:rtype: None
") Load;
		void Load (const Handle_AIS_InteractiveObject & aniobj,const Standard_Integer SelectionMode = -1,const Standard_Boolean AllowDecomp = Standard_False);
		%feature("compactdefaultargs") Erase;
		%feature("autodoc", "	* Hides the object. The object's presentations are simply flagged as invisible and therefore excluded from redrawing. To show hidden objects, use Display().

	:param aniobj:
	:type aniobj: Handle_AIS_InteractiveObject &
	:param updateviewer: default value is Standard_True
	:type updateviewer: bool
	:rtype: None
") Erase;
		void Erase (const Handle_AIS_InteractiveObject & aniobj,const Standard_Boolean updateviewer = Standard_True);
		%feature("compactdefaultargs") EraseAll;
		%feature("autodoc", "	* Hides all objects. The object's presentations are simply flagged as invisible and therefore excluded from redrawing. To show all hidden objects, use DisplayAll().

	:param updateviewer: default value is Standard_True
	:type updateviewer: bool
	:rtype: None
") EraseAll;
		void EraseAll (const Standard_Boolean updateviewer = Standard_True);
		%feature("compactdefaultargs") DisplayAll;
		%feature("autodoc", "	* Displays all hidden objects.

	:param updateviewer: default value is Standard_True
	:type updateviewer: bool
	:rtype: None
") DisplayAll;
		void DisplayAll (const Standard_Boolean updateviewer = Standard_True);
		%feature("compactdefaultargs") EraseSelected;
		%feature("autodoc", "	* Hides selected objects. The object's presentations are simply flagged as invisible and therefore excluded from redrawing. To show hidden objects, use Display().

	:param updateviewer: default value is Standard_True
	:type updateviewer: bool
	:rtype: None
") EraseSelected;
		void EraseSelected (const Standard_Boolean updateviewer = Standard_True);
		%feature("compactdefaultargs") DisplaySelected;
		%feature("autodoc", "	* Displays selected objects if a local context is open. Displays current objects if there is no active local context. Objects selected when there is no open local context are called current objects; those selected in open local context, selected objects. If a local context is open and if updateviewer equals Standard_False, the presentation of the Interactive Object activates the selection mode; the object is displayed but no viewer will be updated.

	:param updateviewer: default value is Standard_True
	:type updateviewer: bool
	:rtype: None
") DisplaySelected;
		void DisplaySelected (const Standard_Boolean updateviewer = Standard_True);
		%feature("compactdefaultargs") KeepTemporary;
		%feature("autodoc", "	* Changes the status of a temporary object. It will be kept at the neutral point, i.e. put in the list of displayed objects along withwith its temporary attributes. These include display mode and selection mode, for example. Returns true if done. inWhichLocal gives the local context in which anIObj is displayed. By default, the index -1 refers to the last Local Context opened.

	:param anIObj:
	:type anIObj: Handle_AIS_InteractiveObject &
	:param InWhichLocal: default value is -1
	:type InWhichLocal: int
	:rtype: bool
") KeepTemporary;
		Standard_Boolean KeepTemporary (const Handle_AIS_InteractiveObject & anIObj,const Standard_Integer InWhichLocal = -1);
		%feature("compactdefaultargs") ClearPrs;
		%feature("autodoc", "	* Empties the graphic presentation of the mode indexed by aMode. If a local context is open and if updateviewer equals Standard_False, the presentation of the Interactive Object activates the selection mode; the object is displayed but no viewer will be updated. Warning Removes anIobj. anIobj is still active if it was previously activated.

	:param aniobj:
	:type aniobj: Handle_AIS_InteractiveObject &
	:param aMode: default value is 0
	:type aMode: int
	:param updateviewer: default value is Standard_True
	:type updateviewer: bool
	:rtype: None
") ClearPrs;
		void ClearPrs (const Handle_AIS_InteractiveObject & aniobj,const Standard_Integer aMode = 0,const Standard_Boolean updateviewer = Standard_True);
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	* Removes aniobj from every viewer. aniobj is no longer referenced in the Context. If a local context is open and if updateviewer equals Standard_False, the presentation of the Interactive Object activates the selection mode; the object is displayed but no viewer will be updated.

	:param aniobj:
	:type aniobj: Handle_AIS_InteractiveObject &
	:param updateviewer: default value is Standard_True
	:type updateviewer: bool
	:rtype: None
") Remove;
		void Remove (const Handle_AIS_InteractiveObject & aniobj,const Standard_Boolean updateviewer = Standard_True);
		%feature("compactdefaultargs") RemoveAll;
		%feature("autodoc", "	* Removes all the objects from all opened Local Contexts and from the Neutral Point

	:param updateviewer: default value is Standard_True
	:type updateviewer: bool
	:rtype: None
") RemoveAll;
		void RemoveAll (const Standard_Boolean updateviewer = Standard_True);
		%feature("compactdefaultargs") Hilight;
		%feature("autodoc", "	* Updates the display in the viewer to take dynamic detection into account. On dynamic detection by the mouse cursor, sensitive primitives are highlighted. The highlight color of entities detected by mouse movement is white by default. If a local context is open and if updateviewer equals Standard_False, the presentation of the Interactive Object activates the selection mode; the object is displayed but no viewer will be updated.

	:param aniobj:
	:type aniobj: Handle_AIS_InteractiveObject &
	:param updateviewer: default value is Standard_True
	:type updateviewer: bool
	:rtype: None
") Hilight;
		void Hilight (const Handle_AIS_InteractiveObject & aniobj,const Standard_Boolean updateviewer = Standard_True);
		%feature("compactdefaultargs") HilightWithColor;
		%feature("autodoc", "	* Changes the color of all the lines of the object in view, aniobj. It paints these lines the color passed as the argument, aCol. If a local context is open and if updateviewer equals Standard_False, the presentation of the Interactive Object activates the selection mode; the object is displayed but no viewer will be updated.

	:param aniobj:
	:type aniobj: Handle_AIS_InteractiveObject &
	:param aCol:
	:type aCol: Quantity_NameOfColor
	:param updateviewer: default value is Standard_True
	:type updateviewer: bool
	:rtype: None
") HilightWithColor;
		void HilightWithColor (const Handle_AIS_InteractiveObject & aniobj,const Quantity_NameOfColor aCol,const Standard_Boolean updateviewer = Standard_True);
		%feature("compactdefaultargs") Unhilight;
		%feature("autodoc", "	* Removes hilighting from the entity aniobj. Updates the viewer. If a local context is open and if updateviewer equals Standard_False, the presentation of the Interactive Object activates the selection mode; the object is displayed but no viewer will be updated.

	:param aniobj:
	:type aniobj: Handle_AIS_InteractiveObject &
	:param updateviewer: default value is Standard_True
	:type updateviewer: bool
	:rtype: None
") Unhilight;
		void Unhilight (const Handle_AIS_InteractiveObject & aniobj,const Standard_Boolean updateviewer = Standard_True);
		%feature("compactdefaultargs") SetDisplayPriority;
		%feature("autodoc", "	* Sets the display priority aPriority of the seen parts presentation of the entity anIobj.

	:param anIobj:
	:type anIobj: Handle_AIS_InteractiveObject &
	:param aPriority:
	:type aPriority: int
	:rtype: None
") SetDisplayPriority;
		void SetDisplayPriority (const Handle_AIS_InteractiveObject & anIobj,const Standard_Integer aPriority);
		%feature("compactdefaultargs") SetZLayer;
		%feature("autodoc", "	* Set Z layer id for interactive object. The Z layers can be used to display temporarily presentations of some object in front of the other objects in the scene. The ids for Z layers are generated by V3d_Viewer.

	:param theIObj:
	:type theIObj: Handle_AIS_InteractiveObject &
	:param theLayerId:
	:type theLayerId: int
	:rtype: None
") SetZLayer;
		void SetZLayer (const Handle_AIS_InteractiveObject & theIObj,const Standard_Integer theLayerId);
		%feature("compactdefaultargs") GetZLayer;
		%feature("autodoc", "	* Get Z layer id set for displayed interactive object.

	:param theIObj:
	:type theIObj: Handle_AIS_InteractiveObject &
	:rtype: int
") GetZLayer;
		Standard_Integer GetZLayer (const Handle_AIS_InteractiveObject & theIObj);
		%feature("compactdefaultargs") Redisplay;
		%feature("autodoc", "	* Recomputes the seen parts presentation of the entity aniobj. If allmodes equals true, all presentations are present in the object even if unseen. If a local context is open and if updateviewer equals Standard_False, the presentation of the Interactive Object activates the selection mode; the object is displayed but no viewer will be updated.

	:param aniobj:
	:type aniobj: Handle_AIS_InteractiveObject &
	:param updateviewer: default value is Standard_True
	:type updateviewer: bool
	:param allmodes: default value is Standard_False
	:type allmodes: bool
	:rtype: None
") Redisplay;
		void Redisplay (const Handle_AIS_InteractiveObject & aniobj,const Standard_Boolean updateviewer = Standard_True,const Standard_Boolean allmodes = Standard_False);
		%feature("compactdefaultargs") Redisplay;
		%feature("autodoc", "	* Recomputes the Prs/Selection of displayed objects of a given type and a given signature. if signature = -1 doesnt take signature criterion.

	:param aTypeOfObject:
	:type aTypeOfObject: AIS_KindOfInteractive
	:param Signature: default value is -1
	:type Signature: int
	:param updateviewer: default value is Standard_True
	:type updateviewer: bool
	:rtype: None
") Redisplay;
		void Redisplay (const AIS_KindOfInteractive aTypeOfObject,const Standard_Integer Signature = -1,const Standard_Boolean updateviewer = Standard_True);
		%feature("compactdefaultargs") RecomputePrsOnly;
		%feature("autodoc", "	* Recomputes the displayed presentations, flags the others Doesn't update presentations

	:param anIobj:
	:type anIobj: Handle_AIS_InteractiveObject &
	:param updateviewer: default value is Standard_True
	:type updateviewer: bool
	:param allmodes: default value is Standard_False
	:type allmodes: bool
	:rtype: None
") RecomputePrsOnly;
		void RecomputePrsOnly (const Handle_AIS_InteractiveObject & anIobj,const Standard_Boolean updateviewer = Standard_True,const Standard_Boolean allmodes = Standard_False);
		%feature("compactdefaultargs") RecomputeSelectionOnly;
		%feature("autodoc", "	* Recomputes the active selections, flags the others Doesn't update presentations

	:param anIObj:
	:type anIObj: Handle_AIS_InteractiveObject &
	:rtype: None
") RecomputeSelectionOnly;
		void RecomputeSelectionOnly (const Handle_AIS_InteractiveObject & anIObj);
		%feature("compactdefaultargs") Update;
		%feature("autodoc", "	* Updates displayed interactive object by checking and recomputing its flagged as 'to be recomputed' presentation and selection structures. This method does not force any recomputation on its own. The method recomputes selections even if they are loaded without activation in particular selector.

	:param theIObj:
	:type theIObj: Handle_AIS_InteractiveObject &
	:param theUpdateViewer: default value is Standard_True
	:type theUpdateViewer: bool
	:rtype: None
") Update;
		void Update (const Handle_AIS_InteractiveObject & theIObj,const Standard_Boolean theUpdateViewer = Standard_True);
		%feature("compactdefaultargs") SetDisplayMode;
		%feature("autodoc", "	* Sets the display mode of seen Interactive Objects. aMode provides the display mode index of the entity aniobj. If updateviewer equals Standard_True, the predominant mode aMode will overule the context mode. If a local context is open and if updateviewer equals Standard_False, the presentation of the Interactive Object returns to the default selection mode; the object is displayed but no viewer will be updated. Note that display mode 3 is only used if you have an AIS_Textured Shape.

	:param aniobj:
	:type aniobj: Handle_AIS_InteractiveObject &
	:param aMode:
	:type aMode: int
	:param updateviewer: default value is Standard_True
	:type updateviewer: bool
	:rtype: None
") SetDisplayMode;
		void SetDisplayMode (const Handle_AIS_InteractiveObject & aniobj,const Standard_Integer aMode,const Standard_Boolean updateviewer = Standard_True);
		%feature("compactdefaultargs") UnsetDisplayMode;
		%feature("autodoc", "	* Unsets the display mode of seen Interactive Objects. aMode provides the display mode index of the entity aniobj. If updateviewer equals Standard_True, the predominant mode aMode will overule the context mode. If a local context is open and if updateviewer equals Standard_False, the presentation of the Interactive Object returns to the default selection mode; the object is displayed but no viewer will be updated.

	:param aniobj:
	:type aniobj: Handle_AIS_InteractiveObject &
	:param updateviewer: default value is Standard_True
	:type updateviewer: bool
	:rtype: None
") UnsetDisplayMode;
		void UnsetDisplayMode (const Handle_AIS_InteractiveObject & aniobj,const Standard_Boolean updateviewer = Standard_True);
		%feature("compactdefaultargs") SetSelectionMode;
		%feature("autodoc", "	* Sets the selection mode of Interactive Objects. aMode provides the selection mode index of the entity aniobj.

	:param aniobj:
	:type aniobj: Handle_AIS_InteractiveObject &
	:param aMode:
	:type aMode: int
	:rtype: None
") SetSelectionMode;
		void SetSelectionMode (const Handle_AIS_InteractiveObject & aniobj,const Standard_Integer aMode);
		%feature("compactdefaultargs") UnsetSelectionMode;
		%feature("autodoc", "	* Removes selection mode from Interactive Objects. aMode provides the selection mode index of the entity aniobj.

	:param aniobj:
	:type aniobj: Handle_AIS_InteractiveObject &
	:rtype: None
") UnsetSelectionMode;
		void UnsetSelectionMode (const Handle_AIS_InteractiveObject & aniobj);
		%feature("compactdefaultargs") SetPixelTolerance;
		%feature("autodoc", "	* Disables the mechanism of adaptive tolerance calculation in SelectMgr_ViewerSelector and sets the given tolerance for ALL sensitive entities activated. For more information, see SelectMgr_ViewerSelector documentation Warning: When a local context is open the sensitivity is apply on it instead on the main context.

	:param aPrecision: default value is 2
	:type aPrecision: int
	:rtype: None
") SetPixelTolerance;
		void SetPixelTolerance (const Standard_Integer aPrecision = 2);
		%feature("compactdefaultargs") PixelTolerance;
		%feature("autodoc", "	* Returns the pixel tolerance.

	:rtype: int
") PixelTolerance;
		Standard_Integer PixelTolerance ();
		%feature("compactdefaultargs") SetSelectionSensitivity;
		%feature("autodoc", "	* Allows to manage sensitivity of a particular selection of interactive object theObject and changes previous sensitivity value of all sensitive entities in selection with theMode to the given theNewSensitivity.

	:param theObject:
	:type theObject: Handle_AIS_InteractiveObject &
	:param theMode:
	:type theMode: int
	:param theNewSensitivity:
	:type theNewSensitivity: int
	:rtype: None
") SetSelectionSensitivity;
		void SetSelectionSensitivity (const Handle_AIS_InteractiveObject & theObject,const Standard_Integer theMode,const Standard_Integer theNewSensitivity);
		%feature("compactdefaultargs") SetLocation;
		%feature("autodoc", "	* Puts the location aLocation on the initial graphic representation and the selection for the entity aniobj. In other words, aniobj is visible and selectable at a position other than initial position. Graphic and selection primitives are not recomputed. To clean the view correctly, you must reset the previous location.

	:param aniobj:
	:type aniobj: Handle_AIS_InteractiveObject &
	:param aLocation:
	:type aLocation: TopLoc_Location &
	:rtype: None
") SetLocation;
		void SetLocation (const Handle_AIS_InteractiveObject & aniobj,const TopLoc_Location & aLocation);
		%feature("compactdefaultargs") ResetLocation;
		%feature("autodoc", "	* Puts the entity aniobj back into its initial position.

	:param aniobj:
	:type aniobj: Handle_AIS_InteractiveObject &
	:rtype: None
") ResetLocation;
		void ResetLocation (const Handle_AIS_InteractiveObject & aniobj);
		%feature("compactdefaultargs") HasLocation;
		%feature("autodoc", "	* Returns true if the entity aniobj has a location.

	:param aniobj:
	:type aniobj: Handle_AIS_InteractiveObject &
	:rtype: bool
") HasLocation;
		Standard_Boolean HasLocation (const Handle_AIS_InteractiveObject & aniobj);
		%feature("compactdefaultargs") Location;
		%feature("autodoc", "	* Returns the location of the entity aniobj.

	:param aniobj:
	:type aniobj: Handle_AIS_InteractiveObject &
	:rtype: TopLoc_Location
") Location;
		TopLoc_Location Location (const Handle_AIS_InteractiveObject & aniobj);
		%feature("compactdefaultargs") SetCurrentFacingModel;
		%feature("autodoc", "	* change the current facing model apply on polygons for SetColor(), SetTransparency(), SetMaterial() methods default facing model is Aspect_TOFM_TWO_SIDE. This mean that attributes is applying both on the front and back face.

	:param aniobj:
	:type aniobj: Handle_AIS_InteractiveObject &
	:param aModel: default value is Aspect_TOFM_BOTH_SIDE
	:type aModel: Aspect_TypeOfFacingModel
	:rtype: None
") SetCurrentFacingModel;
		void SetCurrentFacingModel (const Handle_AIS_InteractiveObject & aniobj,const Aspect_TypeOfFacingModel aModel = Aspect_TOFM_BOTH_SIDE);
		%feature("compactdefaultargs") SetColor;
		%feature("autodoc", "	:param aniobj:
	:type aniobj: Handle_AIS_InteractiveObject &
	:param aColor:
	:type aColor: Quantity_NameOfColor
	:param updateviewer: default value is Standard_True
	:type updateviewer: bool
	:rtype: None
") SetColor;
		void SetColor (const Handle_AIS_InteractiveObject & aniobj,const Quantity_NameOfColor aColor,const Standard_Boolean updateviewer = Standard_True);
		%feature("compactdefaultargs") SetColor;
		%feature("autodoc", "	* Sets the color of the selected entity. If a local context is open and if updateviewer equals Standard_False, the presentation of the Interactive Object activates the selection mode; the object is displayed but no viewer will be updated.

	:param aniobj:
	:type aniobj: Handle_AIS_InteractiveObject &
	:param aColor:
	:type aColor: Quantity_Color &
	:param updateviewer: default value is Standard_True
	:type updateviewer: bool
	:rtype: None
") SetColor;
		void SetColor (const Handle_AIS_InteractiveObject & aniobj,const Quantity_Color & aColor,const Standard_Boolean updateviewer = Standard_True);
		%feature("compactdefaultargs") UnsetColor;
		%feature("autodoc", "	* Removes the color selection for the selected entity. If a local context is open and if updateviewer equals Standard_False, the presentation of the Interactive Object activates the selection mode; the object is displayed but no viewer will be updated.

	:param aniobj:
	:type aniobj: Handle_AIS_InteractiveObject &
	:param updateviewer: default value is Standard_True
	:type updateviewer: bool
	:rtype: None
") UnsetColor;
		void UnsetColor (const Handle_AIS_InteractiveObject & aniobj,const Standard_Boolean updateviewer = Standard_True);
		%feature("compactdefaultargs") SetWidth;
		%feature("autodoc", "	* Sets the width of the entity aniobj. If a local context is open and if updateviewer equals Standard_False, the presentation of the Interactive Object activates the selection mode; the object is displayed but no viewer will be updated.

	:param aniobj:
	:type aniobj: Handle_AIS_InteractiveObject &
	:param aValue:
	:type aValue: float
	:param updateviewer: default value is Standard_True
	:type updateviewer: bool
	:rtype: void
") SetWidth;
		virtual void SetWidth (const Handle_AIS_InteractiveObject & aniobj,const Standard_Real aValue,const Standard_Boolean updateviewer = Standard_True);
		%feature("compactdefaultargs") UnsetWidth;
		%feature("autodoc", "	* Removes the width setting of the entity aniobj. If a local context is open and if updateviewer equals Standard_False, the presentation of the Interactive Object activates the selection mode; the object is displayed but no viewer will be updated.

	:param aniobj:
	:type aniobj: Handle_AIS_InteractiveObject &
	:param updateviewer: default value is Standard_True
	:type updateviewer: bool
	:rtype: void
") UnsetWidth;
		virtual void UnsetWidth (const Handle_AIS_InteractiveObject & aniobj,const Standard_Boolean updateviewer = Standard_True);
		%feature("compactdefaultargs") SetMaterial;
		%feature("autodoc", "	* Provides the type of material setting for the view of the entity aniobj. The range of settings includes: BRASS, BRONZE, GOLD, PEWTER, SILVER, STONE. If a local context is open and if updateviewer equals Standard_False, the presentation of the Interactive Object activates the selection mode; the object is displayed but no viewer will be updated.

	:param aniobj:
	:type aniobj: Handle_AIS_InteractiveObject &
	:param aName:
	:type aName: Graphic3d_NameOfMaterial
	:param updateviewer: default value is Standard_True
	:type updateviewer: bool
	:rtype: None
") SetMaterial;
		void SetMaterial (const Handle_AIS_InteractiveObject & aniobj,const Graphic3d_NameOfMaterial aName,const Standard_Boolean updateviewer = Standard_True);
		%feature("compactdefaultargs") UnsetMaterial;
		%feature("autodoc", "	* Removes the type of material setting for viewing the entity aniobj. If a local context is open and if updateviewer equals Standard_False, the presentation of the Interactive Object activates the selection mode; the object is displayed but no viewer will be updated.

	:param anObj:
	:type anObj: Handle_AIS_InteractiveObject &
	:param updateviewer: default value is Standard_True
	:type updateviewer: bool
	:rtype: None
") UnsetMaterial;
		void UnsetMaterial (const Handle_AIS_InteractiveObject & anObj,const Standard_Boolean updateviewer = Standard_True);
		%feature("compactdefaultargs") SetTransparency;
		%feature("autodoc", "	* Provides the transparency settings for viewing the entity aniobj. The transparency value aValue may be between 0.0, opaque, and 1.0, fully transparent. If a local context is open and if updateviewer equals Standard_False, the presentation of the Interactive Object activates the selection mode; the object is displayed but no viewer will be updated.

	:param aniobj:
	:type aniobj: Handle_AIS_InteractiveObject &
	:param aValue: default value is 0.6
	:type aValue: float
	:param updateviewer: default value is Standard_True
	:type updateviewer: bool
	:rtype: None
") SetTransparency;
		void SetTransparency (const Handle_AIS_InteractiveObject & aniobj,const Standard_Real aValue = 0.6,const Standard_Boolean updateviewer = Standard_True);
		%feature("compactdefaultargs") UnsetTransparency;
		%feature("autodoc", "	* Removes the transparency settings for viewing the entity aniobj. The transparency value aValue may be between 0.0, opaque, and 1.0, fully transparent. If a local context is open and if updateviewer equals Standard_False, the presentation of the Interactive Object activates the selection mode; the object is displayed but no viewer will be updated.

	:param aniobj:
	:type aniobj: Handle_AIS_InteractiveObject &
	:param updateviewer: default value is Standard_True
	:type updateviewer: bool
	:rtype: None
") UnsetTransparency;
		void UnsetTransparency (const Handle_AIS_InteractiveObject & aniobj,const Standard_Boolean updateviewer = Standard_True);
		%feature("compactdefaultargs") SetLocalAttributes;
		%feature("autodoc", "	* Sets the attributes of the interactive object aniobj by plugging the attribute manager aDrawer into the local context. The graphic attributes of aDrawer such as visualization mode, color, and material, are then used to display aniobj. If a local context is open and if updateviewer equals Standard_False, the presentation of the Interactive Object activates the selection mode; the object is displayed but no viewer will be updated.

	:param aniobj:
	:type aniobj: Handle_AIS_InteractiveObject &
	:param aDrawer:
	:type aDrawer: Handle_Prs3d_Drawer &
	:param updateviewer: default value is Standard_True
	:type updateviewer: bool
	:rtype: None
") SetLocalAttributes;
		void SetLocalAttributes (const Handle_AIS_InteractiveObject & aniobj,const Handle_Prs3d_Drawer & aDrawer,const Standard_Boolean updateviewer = Standard_True);
		%feature("compactdefaultargs") UnsetLocalAttributes;
		%feature("autodoc", "	* Removes the settings for local attributes of the entity anObj and returns to the Neutral Point attributes or those of the previous local context. If a local context is open and if updateviewer equals Standard_False, the presentation of the Interactive Object activates the selection mode; the object is displayed but no viewer will be updated.

	:param anObj:
	:type anObj: Handle_AIS_InteractiveObject &
	:param updateviewer: default value is Standard_True
	:type updateviewer: bool
	:rtype: None
") UnsetLocalAttributes;
		void UnsetLocalAttributes (const Handle_AIS_InteractiveObject & anObj,const Standard_Boolean updateviewer = Standard_True);
		%feature("compactdefaultargs") SetPolygonOffsets;
		%feature("autodoc", "	* Sets up polygon offsets for the given AIS_InteractiveObject. It simply calls anObj->SetPolygonOffsets()

	:param anObj:
	:type anObj: Handle_AIS_InteractiveObject &
	:param aMode:
	:type aMode: int
	:param aFactor: default value is 1.0
	:type aFactor: Standard_ShortReal
	:param aUnits: default value is 0.0
	:type aUnits: Standard_ShortReal
	:param updateviewer: default value is Standard_True
	:type updateviewer: bool
	:rtype: None
") SetPolygonOffsets;
		void SetPolygonOffsets (const Handle_AIS_InteractiveObject & anObj,const Standard_Integer aMode,const Standard_ShortReal aFactor = 1.0,const Standard_ShortReal aUnits = 0.0,const Standard_Boolean updateviewer = Standard_True);
		%feature("compactdefaultargs") HasPolygonOffsets;
		%feature("autodoc", "	* simply calls anObj->HasPolygonOffsets()

	:param anObj:
	:type anObj: Handle_AIS_InteractiveObject &
	:rtype: bool
") HasPolygonOffsets;
		Standard_Boolean HasPolygonOffsets (const Handle_AIS_InteractiveObject & anObj);
		%feature("compactdefaultargs") PolygonOffsets;
		%feature("autodoc", "	* Retrieves current polygon offsets settings for <anObj>.

	:param anObj:
	:type anObj: Handle_AIS_InteractiveObject &
	:param aMode:
	:type aMode: int &
	:param aFactor:
	:type aFactor: Standard_ShortReal &
	:param aUnits:
	:type aUnits: Standard_ShortReal &
	:rtype: None
") PolygonOffsets;
		void PolygonOffsets (const Handle_AIS_InteractiveObject & anObj,Standard_Integer &OutValue,Standard_ShortReal & aFactor,Standard_ShortReal & aUnits);
		%feature("compactdefaultargs") SetTrihedronSize;
		%feature("autodoc", "	* Sets the size aSize of the trihedron. Is used to change the default value 100 mm for display of trihedra. Use of this function in one of your own interactive objects requires a call to the Compute function of the new class. This will recalculate the presentation for every trihedron displayed. If a local context is open and if updateviewer equals Standard_False, the presentation of the Interactive Object activates the selection mode; the object is displayed but no viewer will be updated.

	:param aSize:
	:type aSize: float
	:param updateviewer: default value is Standard_True
	:type updateviewer: bool
	:rtype: None
") SetTrihedronSize;
		void SetTrihedronSize (const Standard_Real aSize,const Standard_Boolean updateviewer = Standard_True);
		%feature("compactdefaultargs") TrihedronSize;
		%feature("autodoc", "	* returns the current value of trihedron size.

	:rtype: float
") TrihedronSize;
		Standard_Real TrihedronSize ();
		%feature("compactdefaultargs") SetPlaneSize;
		%feature("autodoc", "	* Sets the plane size defined by the length in the X direction XSize and that in the Y direction YSize. If a local context is open and if updateviewer equals Standard_False, the presentation of the Interactive Object activates the selection mode; the object is displayed but no viewer will be updated.

	:param aSizeX:
	:type aSizeX: float
	:param aSizeY:
	:type aSizeY: float
	:param updateviewer: default value is Standard_True
	:type updateviewer: bool
	:rtype: None
") SetPlaneSize;
		void SetPlaneSize (const Standard_Real aSizeX,const Standard_Real aSizeY,const Standard_Boolean updateviewer = Standard_True);
		%feature("compactdefaultargs") SetPlaneSize;
		%feature("autodoc", "	* Sets the plane size aSize. If a local context is open and if updateviewer equals Standard_False, the presentation of the Interactive Object activates the selection mode; the object is displayed but no viewer will be updated. May be used if PlaneSize returns true.

	:param aSize:
	:type aSize: float
	:param updateviewer: default value is Standard_True
	:type updateviewer: bool
	:rtype: None
") SetPlaneSize;
		void SetPlaneSize (const Standard_Real aSize,const Standard_Boolean updateviewer = Standard_True);
		%feature("compactdefaultargs") PlaneSize;
		%feature("autodoc", "	* Returns true if the length in the X direction XSize is the same as that in the Y direction YSize.

	:param XSize:
	:type XSize: float &
	:param YSize:
	:type YSize: float &
	:rtype: bool
") PlaneSize;
		Standard_Boolean PlaneSize (Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") DisplayStatus;
		%feature("autodoc", "	* Returns the display status of the entity anIobj. This will be one of the following: - DS_Displayed displayed in main viewer - DS_Erased hidden in main viewer - DS_Temporary temporarily displayed - DS_None nowhere displayed.

	:param anIobj:
	:type anIobj: Handle_AIS_InteractiveObject &
	:rtype: AIS_DisplayStatus
") DisplayStatus;
		AIS_DisplayStatus DisplayStatus (const Handle_AIS_InteractiveObject & anIobj);
		%feature("compactdefaultargs") DisplayedModes;
		%feature("autodoc", "	* Returns the list of active display modes for the entity aniobj.

	:param aniobj:
	:type aniobj: Handle_AIS_InteractiveObject &
	:rtype: TColStd_ListOfInteger
") DisplayedModes;
		const TColStd_ListOfInteger & DisplayedModes (const Handle_AIS_InteractiveObject & aniobj);
		%feature("compactdefaultargs") IsDisplayed;
		%feature("autodoc", "	* Returns true if anIobj is displayed in the interactive context.

	:param anIobj:
	:type anIobj: Handle_AIS_InteractiveObject &
	:rtype: bool
") IsDisplayed;
		Standard_Boolean IsDisplayed (const Handle_AIS_InteractiveObject & anIobj);
		%feature("compactdefaultargs") IsDisplayed;
		%feature("autodoc", "	:param aniobj:
	:type aniobj: Handle_AIS_InteractiveObject &
	:param aMode:
	:type aMode: int
	:rtype: bool
") IsDisplayed;
		Standard_Boolean IsDisplayed (const Handle_AIS_InteractiveObject & aniobj,const Standard_Integer aMode);
		%feature("compactdefaultargs") IsHilighted;
		%feature("autodoc", "	:param aniobj:
	:type aniobj: Handle_AIS_InteractiveObject &
	:rtype: bool
") IsHilighted;
		Standard_Boolean IsHilighted (const Handle_AIS_InteractiveObject & aniobj);
		%feature("compactdefaultargs") IsHilighted;
		%feature("autodoc", "	* if <anIObj> is hilighted with a specific color <WithColor> will be returned True <theHiCol> gives the name of the hilightcolor

	:param anIobj:
	:type anIobj: Handle_AIS_InteractiveObject &
	:param WithColor:
	:type WithColor: bool
	:param theHiCol:
	:type theHiCol: Quantity_NameOfColor &
	:rtype: bool
") IsHilighted;
		Standard_Boolean IsHilighted (const Handle_AIS_InteractiveObject & anIobj,Standard_Boolean &OutValue,Quantity_NameOfColor & theHiCol);
		%feature("compactdefaultargs") DisplayPriority;
		%feature("autodoc", "	* Returns the display priority of the entity anIobj. This will be display mode of anIobj if it is in the main viewer.

	:param anIobj:
	:type anIobj: Handle_AIS_InteractiveObject &
	:rtype: int
") DisplayPriority;
		Standard_Integer DisplayPriority (const Handle_AIS_InteractiveObject & anIobj);
		%feature("compactdefaultargs") HasColor;
		%feature("autodoc", "	* Returns true if a view of the Interactive Object aniobj has color.

	:param aniobj:
	:type aniobj: Handle_AIS_InteractiveObject &
	:rtype: bool
") HasColor;
		Standard_Boolean HasColor (const Handle_AIS_InteractiveObject & aniobj);
		%feature("compactdefaultargs") Color;
		%feature("autodoc", "	:param aniobj:
	:type aniobj: Handle_AIS_InteractiveObject &
	:rtype: Quantity_NameOfColor
") Color;
		Quantity_NameOfColor Color (const Handle_AIS_InteractiveObject & aniobj);
		%feature("compactdefaultargs") Color;
		%feature("autodoc", "	* Returns the color Color of the entity aniobj in the interactive context.

	:param aniobj:
	:type aniobj: Handle_AIS_InteractiveObject &
	:param acolor:
	:type acolor: Quantity_Color &
	:rtype: None
") Color;
		void Color (const Handle_AIS_InteractiveObject & aniobj,Quantity_Color & acolor);
		%feature("compactdefaultargs") Width;
		%feature("autodoc", "	* Returns the width of the Interactive Object aniobj in the interactive context.

	:param aniobj:
	:type aniobj: Handle_AIS_InteractiveObject &
	:rtype: float
") Width;
		virtual Standard_Real Width (const Handle_AIS_InteractiveObject & aniobj);
		%feature("compactdefaultargs") Status;
		%feature("autodoc", "	* Returns the status astatus of the Interactive Context for the view of the Interactive Object anObj.

	:param anObj:
	:type anObj: Handle_AIS_InteractiveObject &
	:param astatus:
	:type astatus: TCollection_ExtendedString &
	:rtype: None
") Status;
		void Status (const Handle_AIS_InteractiveObject & anObj,TCollection_ExtendedString & astatus);
		%feature("compactdefaultargs") UpdateCurrentViewer;
		%feature("autodoc", "	* Updates the current viewer, the viewer in Neutral Point. Objects selected when there is no open local context are called current objects; those selected in open local context, selected objects.

	:rtype: None
") UpdateCurrentViewer;
		void UpdateCurrentViewer ();
		%feature("compactdefaultargs") DisplayMode;
		%feature("autodoc", "	* Returns the display mode setting. Note that mode 3 is only used.

	:rtype: int
") DisplayMode;
		Standard_Integer DisplayMode ();
		%feature("compactdefaultargs") HilightColor;
		%feature("autodoc", "	* Returns the name of the color used to show highlighted entities, that is, entities picked out by the mouse.

	:rtype: Quantity_NameOfColor
") HilightColor;
		Quantity_NameOfColor HilightColor ();
		%feature("compactdefaultargs") SelectionColor;
		%feature("autodoc", "	* Returns the name of the color used to show selected entities. By default, this is Quantity_NOC_GRAY80.

	:rtype: Quantity_NameOfColor
") SelectionColor;
		Quantity_NameOfColor SelectionColor ();
		%feature("compactdefaultargs") PreSelectionColor;
		%feature("autodoc", "	* Returns the name of the color used to show preselection. By default, this is Quantity_NOC_GREEN.

	:rtype: Quantity_NameOfColor
") PreSelectionColor;
		Quantity_NameOfColor PreSelectionColor ();
		%feature("compactdefaultargs") DefaultColor;
		%feature("autodoc", "	* Returns the name of the color used by default. By default, this is Quantity_NOC_GOLDENROD.

	:rtype: Quantity_NameOfColor
") DefaultColor;
		Quantity_NameOfColor DefaultColor ();
		%feature("compactdefaultargs") SubIntensityColor;
		%feature("autodoc", "	* Returns the name of the color used to show that an object is not currently selected. By default, this is Quantity_NOC_GRAY40.

	:rtype: Quantity_NameOfColor
") SubIntensityColor;
		Quantity_NameOfColor SubIntensityColor ();
		%feature("compactdefaultargs") SetHilightColor;
		%feature("autodoc", "	* Sets the color used to show highlighted entities, that is, entities picked by the mouse. By default, this is Quantity_NOC_CYAN1.

	:param aHiCol:
	:type aHiCol: Quantity_NameOfColor
	:rtype: None
") SetHilightColor;
		void SetHilightColor (const Quantity_NameOfColor aHiCol);
		%feature("compactdefaultargs") SelectionColor;
		%feature("autodoc", "	* Sets the color used to show selected entities. By default, this is Quantity_NOC_GRAY80.

	:param aCol:
	:type aCol: Quantity_NameOfColor
	:rtype: None
") SelectionColor;
		void SelectionColor (const Quantity_NameOfColor aCol);
		%feature("compactdefaultargs") SetPreselectionColor;
		%feature("autodoc", "	* Allows you to set the color used to show preselection. By default, this is Quantity_NOC_GREEN. A preselected entity is one which has been selected as the domain of application of a function such as a fillet.

	:param aCol:
	:type aCol: Quantity_NameOfColor
	:rtype: None
") SetPreselectionColor;
		void SetPreselectionColor (const Quantity_NameOfColor aCol);
		%feature("compactdefaultargs") SetSubIntensityColor;
		%feature("autodoc", "	* Sets the color used to show that an object is not currently selected. By default, this is Quantity_NOC_GRAY40.

	:param aCol:
	:type aCol: Quantity_NameOfColor
	:rtype: None
") SetSubIntensityColor;
		void SetSubIntensityColor (const Quantity_NameOfColor aCol);
		%feature("compactdefaultargs") SetDisplayMode;
		%feature("autodoc", "	* Sets the display mode of seen Interactive Objects. aMode provides the display mode index of the entity aniobj. If updateviewer equals Standard_True, the predominant mode aMode will overule the context mode. If a local context is open and if updateviewer equals Standard_False, the presentation of the Interactive Object returns to the default selection mode; the object is displayed but no viewer will be updated. Note that display mode 3 is only used if you have an AIS_Textured Shape.

	:param AMode:
	:type AMode: AIS_DisplayMode
	:param updateviewer: default value is Standard_True
	:type updateviewer: bool
	:rtype: None
") SetDisplayMode;
		void SetDisplayMode (const AIS_DisplayMode AMode,const Standard_Boolean updateviewer = Standard_True);
		%feature("compactdefaultargs") SetDeviationCoefficient;
		%feature("autodoc", "	* Sets the deviation coefficient aCoefficient. Drawings of curves or patches are made with respect to a maximal chordal deviation. A Deviation coefficient is used in the shading display mode. The shape is seen decomposed into triangles. These are used to calculate reflection of light from the surface of the object. The triangles are formed from chords of the curves in the shape. The deviation coefficient aCoefficient gives the highest value of the angle with which a chord can deviate from a tangent to a curve. If this limit is reached, a new triangle is begun. This deviation is absolute and is set through the method: SetMaximalChordialDeviation. The default value is 0.001. In drawing shapes, however, you are allowed to ask for a relative deviation. This deviation will be: SizeOfObject * DeviationCoefficient. default 0.001

	:param aniobj:
	:type aniobj: Handle_AIS_InteractiveObject &
	:param aCoefficient:
	:type aCoefficient: float
	:param updateviewer: default value is Standard_True
	:type updateviewer: bool
	:rtype: None
") SetDeviationCoefficient;
		void SetDeviationCoefficient (const Handle_AIS_InteractiveObject & aniobj,const Standard_Real aCoefficient,const Standard_Boolean updateviewer = Standard_True);
		%feature("compactdefaultargs") SetDeviationAngle;
		%feature("autodoc", "	:param aniobj:
	:type aniobj: Handle_AIS_InteractiveObject &
	:param anAngle:
	:type anAngle: float
	:param updateviewer: default value is Standard_True
	:type updateviewer: bool
	:rtype: None
") SetDeviationAngle;
		void SetDeviationAngle (const Handle_AIS_InteractiveObject & aniobj,const Standard_Real anAngle,const Standard_Boolean updateviewer = Standard_True);
		%feature("compactdefaultargs") SetAngleAndDeviation;
		%feature("autodoc", "	* Calls the AIS_Shape SetAngleAndDeviation to set both Angle and Deviation coefficients

	:param aniobj:
	:type aniobj: Handle_AIS_InteractiveObject &
	:param anAngle:
	:type anAngle: float
	:param updateviewer: default value is Standard_True
	:type updateviewer: bool
	:rtype: None
") SetAngleAndDeviation;
		void SetAngleAndDeviation (const Handle_AIS_InteractiveObject & aniobj,const Standard_Real anAngle,const Standard_Boolean updateviewer = Standard_True);
		%feature("compactdefaultargs") SetHLRDeviationCoefficient;
		%feature("autodoc", "	* Sets the deviation coefficient aCoefficient for removal of hidden lines created by different viewpoints in different presentations. The Default value is 0.02.

	:param aniobj:
	:type aniobj: Handle_AIS_InteractiveObject &
	:param aCoefficient:
	:type aCoefficient: float
	:param updateviewer: default value is Standard_True
	:type updateviewer: bool
	:rtype: None
") SetHLRDeviationCoefficient;
		void SetHLRDeviationCoefficient (const Handle_AIS_InteractiveObject & aniobj,const Standard_Real aCoefficient,const Standard_Boolean updateviewer = Standard_True);
		%feature("compactdefaultargs") SetHLRDeviationAngle;
		%feature("autodoc", "	:param aniobj:
	:type aniobj: Handle_AIS_InteractiveObject &
	:param anAngle:
	:type anAngle: float
	:param updateviewer: default value is Standard_True
	:type updateviewer: bool
	:rtype: None
") SetHLRDeviationAngle;
		void SetHLRDeviationAngle (const Handle_AIS_InteractiveObject & aniobj,const Standard_Real anAngle,const Standard_Boolean updateviewer = Standard_True);
		%feature("compactdefaultargs") SetHLRAngleAndDeviation;
		%feature("autodoc", "	* Computes a HLRAngle and a HLRDeviationCoefficient by means of the angle anAngle and sets the corresponding methods in the default drawing tool with these values.

	:param aniobj:
	:type aniobj: Handle_AIS_InteractiveObject &
	:param anAngle:
	:type anAngle: float
	:param updateviewer: default value is Standard_True
	:type updateviewer: bool
	:rtype: None
") SetHLRAngleAndDeviation;
		void SetHLRAngleAndDeviation (const Handle_AIS_InteractiveObject & aniobj,const Standard_Real anAngle,const Standard_Boolean updateviewer = Standard_True);
		%feature("compactdefaultargs") SetDeviationCoefficient;
		%feature("autodoc", "	* Sets the deviation coefficient aCoefficient. Drawings of curves or patches are made with respect to a maximal chordal deviation. A Deviation coefficient is used in the shading display mode. The shape is seen decomposed into triangles. These are used to calculate reflection of light from the surface of the object. The triangles are formed from chords of the curves in the shape. The deviation coefficient aCoefficient gives the highest value of the angle with which a chord can deviate from a tangent to a curve. If this limit is reached, a new triangle is begun. This deviation is absolute and is set through the method: SetMaximalChordialDeviation. The default value is 0.001. In drawing shapes, however, you are allowed to ask for a relative deviation. This deviation will be: SizeOfObject * DeviationCoefficient. default 0.001

	:param aCoefficient:
	:type aCoefficient: float
	:rtype: None
") SetDeviationCoefficient;
		void SetDeviationCoefficient (const Standard_Real aCoefficient);
		%feature("compactdefaultargs") DeviationCoefficient;
		%feature("autodoc", "	* Returns the deviation coefficient. Drawings of curves or patches are made with respect to a maximal chordal deviation. A Deviation coefficient is used in the shading display mode. The shape is seen decomposed into triangles. These are used to calculate reflection of light from the surface of the object. The triangles are formed from chords of the curves in the shape. The deviation coefficient gives the highest value of the angle with which a chord can deviate from a tangent to a curve. If this limit is reached, a new triangle is begun. This deviation is absolute and is set through Prs3d_Drawer::SetMaximalChordialDeviation. The default value is 0.001. In drawing shapes, however, you are allowed to ask for a relative deviation. This deviation will be: SizeOfObject * DeviationCoefficient.

	:rtype: float
") DeviationCoefficient;
		Standard_Real DeviationCoefficient ();
		%feature("compactdefaultargs") SetDeviationAngle;
		%feature("autodoc", "	* default 6degrees

	:param anAngle:
	:type anAngle: float
	:rtype: None
") SetDeviationAngle;
		void SetDeviationAngle (const Standard_Real anAngle);
		%feature("compactdefaultargs") DeviationAngle;
		%feature("autodoc", "	:rtype: float
") DeviationAngle;
		Standard_Real DeviationAngle ();
		%feature("compactdefaultargs") SetHLRDeviationCoefficient;
		%feature("autodoc", "	* Sets the deviation coefficient aCoefficient for removal of hidden lines created by different viewpoints in different presentations. The Default value is 0.02.

	:param aCoefficient:
	:type aCoefficient: float
	:rtype: None
") SetHLRDeviationCoefficient;
		void SetHLRDeviationCoefficient (const Standard_Real aCoefficient);
		%feature("compactdefaultargs") HLRDeviationCoefficient;
		%feature("autodoc", "	* Returns the real number value of the hidden line removal deviation coefficient. A Deviation coefficient is used in the shading display mode. The shape is seen decomposed into triangles. These are used to calculate reflection of light from the surface of the object. The triangles are formed from chords of the curves in the shape. The deviation coefficient give the highest value of the angle with which a chord can deviate from a tangent to a curve. If this limit is reached, a new triangle is begun. To find the hidden lines, hidden line display mode entails recalculation of the view at each different projector perspective. Because hidden lines entail calculations of more than usual complexity to decompose them into these triangles, a deviation coefficient allowing greater tolerance is used. This increases efficiency in calculation. The Default value is 0.02.

	:rtype: float
") HLRDeviationCoefficient;
		Standard_Real HLRDeviationCoefficient ();
		%feature("compactdefaultargs") SetHLRAngle;
		%feature("autodoc", "	* Sets the HLR angle anAngle.

	:param anAngle:
	:type anAngle: float
	:rtype: None
") SetHLRAngle;
		void SetHLRAngle (const Standard_Real anAngle);
		%feature("compactdefaultargs") HLRAngle;
		%feature("autodoc", "	* Returns the real number value of the deviation angle in hidden line removal views in this interactive context. The default value is 20*PI/180.

	:rtype: float
") HLRAngle;
		Standard_Real HLRAngle ();
		%feature("compactdefaultargs") SetHLRAngleAndDeviation;
		%feature("autodoc", "	* compute with anangle a HLRAngle and a HLRDeviationCoefficient and set them in myHLRAngle and in myHLRDeviationCoefficient of myDefaultDrawer ; anAngle is in radian ; ( 1 deg < angle in deg < 20 deg)

	:param anAngle:
	:type anAngle: float
	:rtype: None
") SetHLRAngleAndDeviation;
		void SetHLRAngleAndDeviation (const Standard_Real anAngle);
		%feature("compactdefaultargs") HiddenLineAspect;
		%feature("autodoc", "	* Initializes hidden line aspect in the default drawing tool, or Drawer. The default values are: Color: Quantity_NOC_YELLOW Type of line: Aspect_TOL_DASH Width: 1.

	:rtype: Handle_Prs3d_LineAspect
") HiddenLineAspect;
		Handle_Prs3d_LineAspect HiddenLineAspect ();
		%feature("compactdefaultargs") SetHiddenLineAspect;
		%feature("autodoc", "	* Sets the hidden line aspect anAspect. anAspect defines display attributes for hidden lines in HLR projections.

	:param anAspect:
	:type anAspect: Handle_Prs3d_LineAspect &
	:rtype: None
") SetHiddenLineAspect;
		void SetHiddenLineAspect (const Handle_Prs3d_LineAspect & anAspect);
		%feature("compactdefaultargs") DrawHiddenLine;
		%feature("autodoc", "	* returns Standard_True if the hidden lines are to be drawn. By default the hidden lines are not drawn.

	:rtype: bool
") DrawHiddenLine;
		Standard_Boolean DrawHiddenLine ();
		%feature("compactdefaultargs") EnableDrawHiddenLine;
		%feature("autodoc", "	:rtype: None
") EnableDrawHiddenLine;
		void EnableDrawHiddenLine ();
		%feature("compactdefaultargs") DisableDrawHiddenLine;
		%feature("autodoc", "	:rtype: None
") DisableDrawHiddenLine;
		void DisableDrawHiddenLine ();
		%feature("compactdefaultargs") SetIsoNumber;
		%feature("autodoc", "	* Sets the number of U and V isoparameters displayed.

	:param NbIsos:
	:type NbIsos: int
	:param WhichIsos: default value is AIS_TOI_Both
	:type WhichIsos: AIS_TypeOfIso
	:rtype: None
") SetIsoNumber;
		void SetIsoNumber (const Standard_Integer NbIsos,const AIS_TypeOfIso WhichIsos = AIS_TOI_Both);
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
		%feature("compactdefaultargs") SetSelectedAspect;
		%feature("autodoc", "	* Sets the graphic basic aspect to the current presentation of ALL selected objects. When <globalChange> is True , the full object presentation is changed. When <globalChange> is False , only the current group of the object presentation is changed. Updates the viewer when <updateViewer> is True

	:param anAspect:
	:type anAspect: Handle_Prs3d_BasicAspect &
	:param globalChange: default value is Standard_True
	:type globalChange: bool
	:param updateViewer: default value is Standard_True
	:type updateViewer: bool
	:rtype: None
") SetSelectedAspect;
		void SetSelectedAspect (const Handle_Prs3d_BasicAspect & anAspect,const Standard_Boolean globalChange = Standard_True,const Standard_Boolean updateViewer = Standard_True);
		%feature("compactdefaultargs") MoveTo;
		%feature("autodoc", "	* Relays mouse position in pixels theXPix and theYPix to the interactive context selectors. This is done by the view theView passing this position to the main viewer and updating it. Functions in both Neutral Point and local contexts. If theToRedrawOnUpdate is set to false, callee should call RedrawImmediate() to highlight detected object.

	:param theXPix:
	:type theXPix: int
	:param theYPix:
	:type theYPix: int
	:param theView:
	:type theView: Handle_V3d_View &
	:param theToRedrawOnUpdate: default value is Standard_True
	:type theToRedrawOnUpdate: bool
	:rtype: AIS_StatusOfDetection
") MoveTo;
		AIS_StatusOfDetection MoveTo (const Standard_Integer theXPix,const Standard_Integer theYPix,const Handle_V3d_View & theView,const Standard_Boolean theToRedrawOnUpdate = Standard_True);
		%feature("compactdefaultargs") HasNextDetected;
		%feature("autodoc", "	* returns True if other entities were detected in the last mouse detection

	:rtype: bool
") HasNextDetected;
		Standard_Boolean HasNextDetected ();
		%feature("compactdefaultargs") HilightNextDetected;
		%feature("autodoc", "	* if more than 1 object is detected by the selector, only the 'best' owner is hilighted at the mouse position. This Method allows the user to hilight one after another the other detected entities. if The method select is called, the selected entity will be the hilighted one! returns the Rank of hilighted entity WARNING : Loop Method. When all the detected entities have been hilighted , the next call will hilight the first one again

	:param theView:
	:type theView: Handle_V3d_View &
	:param theToRedrawImmediate: default value is Standard_True
	:type theToRedrawImmediate: bool
	:rtype: int
") HilightNextDetected;
		Standard_Integer HilightNextDetected (const Handle_V3d_View & theView,const Standard_Boolean theToRedrawImmediate = Standard_True);
		%feature("compactdefaultargs") HilightPreviousDetected;
		%feature("autodoc", "	* Same as previous methods in reverse direction...

	:param theView:
	:type theView: Handle_V3d_View &
	:param theToRedrawImmediate: default value is Standard_True
	:type theToRedrawImmediate: bool
	:rtype: int
") HilightPreviousDetected;
		Standard_Integer HilightPreviousDetected (const Handle_V3d_View & theView,const Standard_Boolean theToRedrawImmediate = Standard_True);
		%feature("compactdefaultargs") Select;
		%feature("autodoc", "	* Selects everything found in the bounding rectangle defined by the pixel minima and maxima, XPMin, YPMin, XPMax, and YPMax in the view, aView The objects detected are passed to the main viewer, which is then updated.

	:param XPMin:
	:type XPMin: int
	:param YPMin:
	:type YPMin: int
	:param XPMax:
	:type XPMax: int
	:param YPMax:
	:type YPMax: int
	:param aView:
	:type aView: Handle_V3d_View &
	:param updateviewer: default value is Standard_True
	:type updateviewer: bool
	:rtype: AIS_StatusOfPick
") Select;
		AIS_StatusOfPick Select (const Standard_Integer XPMin,const Standard_Integer YPMin,const Standard_Integer XPMax,const Standard_Integer YPMax,const Handle_V3d_View & aView,const Standard_Boolean updateviewer = Standard_True);
		%feature("compactdefaultargs") Select;
		%feature("autodoc", "	* polyline selection; clears the previous picked list

	:param Polyline:
	:type Polyline: TColgp_Array1OfPnt2d
	:param aView:
	:type aView: Handle_V3d_View &
	:param updateviewer: default value is Standard_True
	:type updateviewer: bool
	:rtype: AIS_StatusOfPick
") Select;
		AIS_StatusOfPick Select (const TColgp_Array1OfPnt2d & Polyline,const Handle_V3d_View & aView,const Standard_Boolean updateviewer = Standard_True);
		%feature("compactdefaultargs") Select;
		%feature("autodoc", "	* Stores and hilights the previous detected; Unhilights the previous picked.

	:param updateviewer: default value is Standard_True
	:type updateviewer: bool
	:rtype: AIS_StatusOfPick
") Select;
		AIS_StatusOfPick Select (const Standard_Boolean updateviewer = Standard_True);
		%feature("compactdefaultargs") ShiftSelect;
		%feature("autodoc", "	* adds the last detected to the list of previous picked. if the last detected was already declared as picked, removes it from the Picked List.

	:param updateviewer: default value is Standard_True
	:type updateviewer: bool
	:rtype: AIS_StatusOfPick
") ShiftSelect;
		AIS_StatusOfPick ShiftSelect (const Standard_Boolean updateviewer = Standard_True);
		%feature("compactdefaultargs") ShiftSelect;
		%feature("autodoc", "	* adds the last detected to the list of previous picked. if the last detected was already declared as picked, removes it from the Picked List.

	:param Polyline:
	:type Polyline: TColgp_Array1OfPnt2d
	:param aView:
	:type aView: Handle_V3d_View &
	:param updateviewer: default value is Standard_True
	:type updateviewer: bool
	:rtype: AIS_StatusOfPick
") ShiftSelect;
		AIS_StatusOfPick ShiftSelect (const TColgp_Array1OfPnt2d & Polyline,const Handle_V3d_View & aView,const Standard_Boolean updateviewer = Standard_True);
		%feature("compactdefaultargs") ShiftSelect;
		%feature("autodoc", "	* rectangle of selection ; adds new detected entities into the picked list, removes the detected entities that were already stored...

	:param XPMin:
	:type XPMin: int
	:param YPMin:
	:type YPMin: int
	:param XPMax:
	:type XPMax: int
	:param YPMax:
	:type YPMax: int
	:param aView:
	:type aView: Handle_V3d_View &
	:param updateviewer: default value is Standard_True
	:type updateviewer: bool
	:rtype: AIS_StatusOfPick
") ShiftSelect;
		AIS_StatusOfPick ShiftSelect (const Standard_Integer XPMin,const Standard_Integer YPMin,const Standard_Integer XPMax,const Standard_Integer YPMax,const Handle_V3d_View & aView,const Standard_Boolean updateviewer = Standard_True);
		%feature("compactdefaultargs") SetToHilightSelected;
		%feature("autodoc", "	* Specify whether selected object must be hilighted when mouse cursor is moved above it (in MoveTo method). By default this value is false and selected object is not hilighted in this case.

	:param toHilight:
	:type toHilight: bool
	:rtype: None
") SetToHilightSelected;
		void SetToHilightSelected (const Standard_Boolean toHilight);
		%feature("compactdefaultargs") ToHilightSelected;
		%feature("autodoc", "	* Return value specified whether selected object must be hilighted when mouse cursor is moved above it

	:rtype: bool
") ToHilightSelected;
		Standard_Boolean ToHilightSelected ();
		%feature("compactdefaultargs") SetCurrentObject;
		%feature("autodoc", "	* Updates the view of the current object in open context. Objects selected when there is no open local context are called current objects; those selected in open local context, selected objects. If a local context is open and if updateviewer equals Standard_False, the presentation of the Interactive Object activates the selection mode; the object is displayed but no viewer will be updated.

	:param aniobj:
	:type aniobj: Handle_AIS_InteractiveObject &
	:param updateviewer: default value is Standard_True
	:type updateviewer: bool
	:rtype: None
") SetCurrentObject;
		void SetCurrentObject (const Handle_AIS_InteractiveObject & aniobj,const Standard_Boolean updateviewer = Standard_True);
		%feature("compactdefaultargs") AddOrRemoveCurrentObject;
		%feature("autodoc", "	* Allows you to add a current object to the list of current objects or remove it from that list. Objects selected when there is no open local context are called current objects; those selected in open local context, selected objects. If a local context is open and if updateviewer equals Standard_False, the presentation of the Interactive Object activates the selection mode; the object is displayed but no viewer will be updated.

	:param aniobj:
	:type aniobj: Handle_AIS_InteractiveObject &
	:param updateviewer: default value is Standard_True
	:type updateviewer: bool
	:rtype: None
") AddOrRemoveCurrentObject;
		void AddOrRemoveCurrentObject (const Handle_AIS_InteractiveObject & aniobj,const Standard_Boolean updateviewer = Standard_True);
		%feature("compactdefaultargs") UpdateCurrent;
		%feature("autodoc", "	* Updates the list of current objects, i.e. hilights new current objects, removes hilighting from former current objects. Objects selected when there is no open local context are called current objects; those selected in open local context, selected objects.

	:rtype: None
") UpdateCurrent;
		void UpdateCurrent ();
		%feature("compactdefaultargs") WasCurrentTouched;
		%feature("autodoc", "	* Returns the current selection touched by the cursor. Objects selected when there is no open local context are called current objects; those selected in open local context, selected objects.

	:rtype: bool
") WasCurrentTouched;
		Standard_Boolean WasCurrentTouched ();
		%feature("compactdefaultargs") SetOkCurrent;
		%feature("autodoc", "	:rtype: None
") SetOkCurrent;
		void SetOkCurrent ();
		%feature("compactdefaultargs") IsCurrent;
		%feature("autodoc", "	* Returns true if there is a non-null interactive object in Neutral Point. Objects selected when there is no open local context are called current objects; those selected in open local context, selected objects.

	:param aniobj:
	:type aniobj: Handle_AIS_InteractiveObject &
	:rtype: bool
") IsCurrent;
		Standard_Boolean IsCurrent (const Handle_AIS_InteractiveObject & aniobj);
		%feature("compactdefaultargs") InitCurrent;
		%feature("autodoc", "	* Initializes a scan of the current selected objects in Neutral Point. Objects selected when there is no open local context are called current objects; those selected in open local context, selected objects.

	:rtype: None
") InitCurrent;
		void InitCurrent ();
		%feature("compactdefaultargs") MoreCurrent;
		%feature("autodoc", "	* Returns true if there is another object found by the scan of the list of current objects. Objects selected when there is no open local context are called current objects; those selected in open local context, selected objects.

	:rtype: bool
") MoreCurrent;
		Standard_Boolean MoreCurrent ();
		%feature("compactdefaultargs") NextCurrent;
		%feature("autodoc", "	* Continues the scan to the next object in the list of current objects. Objects selected when there is no open local context are called current objects; those selected in open local context, selected objects.

	:rtype: None
") NextCurrent;
		void NextCurrent ();
		%feature("compactdefaultargs") Current;
		%feature("autodoc", "	* Returns the current interactive object. Objects selected when there is no open local context are called current objects; those selected in open local context, selected objects.

	:rtype: Handle_AIS_InteractiveObject
") Current;
		Handle_AIS_InteractiveObject Current ();
		%feature("compactdefaultargs") NbCurrents;
		%feature("autodoc", "	:rtype: int
") NbCurrents;
		Standard_Integer NbCurrents ();
		%feature("compactdefaultargs") FirstCurrentObject;
		%feature("autodoc", "	* Returns the first current object in the list of current objects. Objects selected when there is no open local context are called current objects; those selected in open local context, selected objects.

	:rtype: Handle_AIS_InteractiveObject
") FirstCurrentObject;
		Handle_AIS_InteractiveObject FirstCurrentObject ();
		%feature("compactdefaultargs") HilightCurrents;
		%feature("autodoc", "	* Highlights current objects. Objects selected when there is no open local context are called current objects; those selected in open local context, selected objects. If a local context is open and if updateviewer equals Standard_False, the presentation of the Interactive Object activates the selection mode; the object is displayed but no viewer will be updated.

	:param updateviewer: default value is Standard_True
	:type updateviewer: bool
	:rtype: None
") HilightCurrents;
		void HilightCurrents (const Standard_Boolean updateviewer = Standard_True);
		%feature("compactdefaultargs") UnhilightCurrents;
		%feature("autodoc", "	* Removes highlighting from current objects. Objects selected when there is no open local context are called current objects; those selected in open local context, selected objects. If a local context is open and if updateviewer equals Standard_False, the presentation of the Interactive Object activates the selection mode; the object is displayed but no viewer will be updated.

	:param updateviewer: default value is Standard_True
	:type updateviewer: bool
	:rtype: None
") UnhilightCurrents;
		void UnhilightCurrents (const Standard_Boolean updateviewer = Standard_True);
		%feature("compactdefaultargs") ClearCurrents;
		%feature("autodoc", "	* Empties previous current objects in order to get the current objects detected by the selector using UpdateCurrent. Objects selected when there is no open local context are called current objects; those selected in open local context, selected objects. If a local context is open and if updateviewer equals Standard_False, the presentation of the Interactive Object activates the selection mode; the object is displayed but no viewer will be updated.

	:param updateviewer: default value is Standard_True
	:type updateviewer: bool
	:rtype: None
") ClearCurrents;
		void ClearCurrents (const Standard_Boolean updateviewer = Standard_True);
		%feature("compactdefaultargs") SetSelected;
		%feature("autodoc", "	* Puts the interactive object aniObj in the list of selected objects. If a local context is open and if updateviewer equals Standard_False, the presentation of the Interactive Object activates the selection mode; the object is displayed but no viewer will be updated.

	:param aniObj:
	:type aniObj: Handle_AIS_InteractiveObject &
	:param updateviewer: default value is Standard_True
	:type updateviewer: bool
	:rtype: None
") SetSelected;
		void SetSelected (const Handle_AIS_InteractiveObject & aniObj,const Standard_Boolean updateviewer = Standard_True);
		%feature("compactdefaultargs") SetSelectedCurrent;
		%feature("autodoc", "	* puts the selected list in the current objects List.

	:rtype: None
") SetSelectedCurrent;
		void SetSelectedCurrent ();
		%feature("compactdefaultargs") UpdateSelected;
		%feature("autodoc", "	* updates the list of selected objects i.e. hilights the new selected unhilights old selected objects

	:param updateviewer: default value is Standard_True
	:type updateviewer: bool
	:rtype: None
") UpdateSelected;
		void UpdateSelected (const Standard_Boolean updateviewer = Standard_True);
		%feature("compactdefaultargs") AddOrRemoveSelected;
		%feature("autodoc", "	* Allows you to add a selected object to the list of selected objects or remove it from that list. This entity can be an Interactive Object aniobj or its owner aShape as can be seen in the two syntaxes above. Objects selected when there is no open local context are called current objects; those selected in open local context, selected objects. If a local context is open and if updateviewer equals Standard_False, the presentation of the Interactive Object activates the selection mode; the object is displayed but no viewer will be updated.

	:param aniobj:
	:type aniobj: Handle_AIS_InteractiveObject &
	:param updateviewer: default value is Standard_True
	:type updateviewer: bool
	:rtype: None
") AddOrRemoveSelected;
		void AddOrRemoveSelected (const Handle_AIS_InteractiveObject & aniobj,const Standard_Boolean updateviewer = Standard_True);
		%feature("compactdefaultargs") HilightSelected;
		%feature("autodoc", "	* Highlights selected objects. Objects selected when there is no open local context are called current objects; those selected in open local context, selected objects. If a local context is open and if updateviewer equals Standard_False, the presentation of the Interactive Object activates the selection mode; the object is displayed but no viewer will be updated.

	:param updateviewer: default value is Standard_True
	:type updateviewer: bool
	:rtype: None
") HilightSelected;
		void HilightSelected (const Standard_Boolean updateviewer = Standard_True);
		%feature("compactdefaultargs") UnhilightSelected;
		%feature("autodoc", "	* Removes highlighting from selected objects. Objects selected when there is no open local context are called current objects; those selected in open local context, selected objects. If a local context is open and if updateviewer equals Standard_False, the presentation of the Interactive Object activates the selection mode; the object is displayed but no viewer will be updated.

	:param updateviewer: default value is Standard_True
	:type updateviewer: bool
	:rtype: None
") UnhilightSelected;
		void UnhilightSelected (const Standard_Boolean updateviewer = Standard_True);
		%feature("compactdefaultargs") ClearSelected;
		%feature("autodoc", "	* Empties previous selected objects in order to get the selected objects detected by the selector using UpdateSelected. Objects selected when there is no open local context are called current objects; those selected in open local context, selected objects. If a local context is open and if updateviewer equals Standard_False, the presentation of the Interactive Object activates the selection mode; the object is displayed but no viewer will be updated.

	:param updateviewer: default value is Standard_True
	:type updateviewer: bool
	:rtype: None
") ClearSelected;
		void ClearSelected (const Standard_Boolean updateviewer = Standard_True);
		%feature("compactdefaultargs") AddOrRemoveSelected;
		%feature("autodoc", "	* No right to Add a selected Shape (Internal Management of shape Selection). A Previous selected shape may only be removed.

	:param aShape:
	:type aShape: TopoDS_Shape &
	:param updateviewer: default value is Standard_True
	:type updateviewer: bool
	:rtype: None
") AddOrRemoveSelected;
		void AddOrRemoveSelected (const TopoDS_Shape & aShape,const Standard_Boolean updateviewer = Standard_True);
		%feature("compactdefaultargs") AddOrRemoveSelected;
		%feature("autodoc", "	* allows to add/remove in the selected list the entities represented by <anOwner> in the selection process.

	:param anOwner:
	:type anOwner: Handle_SelectMgr_EntityOwner &
	:param updateviewer: default value is Standard_True
	:type updateviewer: bool
	:rtype: None
") AddOrRemoveSelected;
		void AddOrRemoveSelected (const Handle_SelectMgr_EntityOwner & anOwner,const Standard_Boolean updateviewer = Standard_True);
		%feature("compactdefaultargs") IsSelected;
		%feature("autodoc", "	* Finds the selected object aniobj in local context and returns its name. Objects selected when there is no open local context are called current objects; those selected in open local context, selected objects.

	:param aniobj:
	:type aniobj: Handle_AIS_InteractiveObject &
	:rtype: bool
") IsSelected;
		Standard_Boolean IsSelected (const Handle_AIS_InteractiveObject & aniobj);
		%feature("compactdefaultargs") InitSelected;
		%feature("autodoc", "	* Initializes a scan of the selected objects in local context. Objects selected when there is no open local context are called current objects; those selected in open local context, selected objects.

	:rtype: None
") InitSelected;
		void InitSelected ();
		%feature("compactdefaultargs") MoreSelected;
		%feature("autodoc", "	* Returns true if there is another object found by the scan of the list of selected objects. Objects selected when there is no open local context are called current objects; those selected in open local context, selected objects.

	:rtype: bool
") MoreSelected;
		Standard_Boolean MoreSelected ();
		%feature("compactdefaultargs") NextSelected;
		%feature("autodoc", "	* Continues the scan to the next object in the list of selected objects. Objects selected when there is no open local context are called current objects; those selected in open local context, selected objects.

	:rtype: None
") NextSelected;
		void NextSelected ();
		%feature("compactdefaultargs") NbSelected;
		%feature("autodoc", "	:rtype: int
") NbSelected;
		Standard_Integer NbSelected ();
		%feature("compactdefaultargs") HasSelectedShape;
		%feature("autodoc", "	* Returns true if the interactive context has a shape selected in it which results from the decomposition of another entity in local context. If HasSelectedShape returns true, SelectedShape returns the shape which has been shown to be selected. Interactive returns the Interactive Object from which the shape has been selected. If HasSelectedShape returns false, Interactive returns the interactive entity selected by the click of the mouse.

	:rtype: bool
") HasSelectedShape;
		Standard_Boolean HasSelectedShape ();
		%feature("compactdefaultargs") SelectedShape;
		%feature("autodoc", "	* Returns the selected shape in the open local context. Objects selected when there is no open local context are called current objects; those selected in open local context, selected objects.

	:rtype: TopoDS_Shape
") SelectedShape;
		TopoDS_Shape SelectedShape ();
		%feature("compactdefaultargs") SelectedOwner;
		%feature("autodoc", "	* Returns the owner of the selected entity resulting from the decomposition of another entity in local context.

	:rtype: Handle_SelectMgr_EntityOwner
") SelectedOwner;
		Handle_SelectMgr_EntityOwner SelectedOwner ();
		%feature("compactdefaultargs") EntityOwners;
		%feature("autodoc", "	* Returns a collection containing all entity owners created for the interactive object <theIObj> in the selection mode theMode (in all active modes if the Mode == -1)

	:param theOwners:
	:type theOwners: Handle_SelectMgr_IndexedMapOfOwner &
	:param theIObj:
	:type theIObj: Handle_AIS_InteractiveObject &
	:param theMode: default value is -1
	:type theMode: int
	:rtype: None
") EntityOwners;
		void EntityOwners (Handle_SelectMgr_IndexedMapOfOwner & theOwners,const Handle_AIS_InteractiveObject & theIObj,const Standard_Integer theMode = -1);
		%feature("compactdefaultargs") Interactive;
		%feature("autodoc", "	* Returns the location of the selected Interactive Object.

	:rtype: Handle_AIS_InteractiveObject
") Interactive;
		Handle_AIS_InteractiveObject Interactive ();
		%feature("compactdefaultargs") SelectedInteractive;
		%feature("autodoc", "	:rtype: Handle_AIS_InteractiveObject
") SelectedInteractive;
		Handle_AIS_InteractiveObject SelectedInteractive ();
		%feature("compactdefaultargs") HasApplicative;
		%feature("autodoc", "	* Returns true if the applicative object has an owner from Interactive attributed to it.

	:rtype: bool
") HasApplicative;
		Standard_Boolean HasApplicative ();
		%feature("compactdefaultargs") Applicative;
		%feature("autodoc", "	* Returns the owner of the applicative entity detected in interactive context. The owner can be a shape for a set of sub-shapes or a sub-shape for sub-shapes which it is composed of.

	:rtype: Handle_Standard_Transient
") Applicative;
		Handle_Standard_Transient Applicative ();
		%feature("compactdefaultargs") HasDetected;
		%feature("autodoc", "	* Returns true if there is a mouse-detected entity in local context. If there is no open local context, the objects selected are called current objects; selected objects if there is one. Iterators allow entities to be recovered in either case. This method is one of a set which allows you to manipulate the objects which have been placed in these two lists.

	:rtype: bool
") HasDetected;
		Standard_Boolean HasDetected ();
		%feature("compactdefaultargs") HasDetectedShape;
		%feature("autodoc", "	* Returns true if there is a detected shape in local context. If there is no open local context, the objects selected are called current objects; selected objects if there is one. Iterators allow entities to be recovered in either case. This method is one of a set which allows you to manipulate the objects which have been placed in these two lists.

	:rtype: bool
") HasDetectedShape;
		Standard_Boolean HasDetectedShape ();
		%feature("compactdefaultargs") DetectedShape;
		%feature("autodoc", "	* Returns the shape detected in local context. If there is no open local context, the objects selected are called current objects; selected objects if there is one. Iterators allow entities to be recovered in either case. This method is one of a set which allows you to manipulate the objects which have been placed in these two lists.

	:rtype: TopoDS_Shape
") DetectedShape;
		const TopoDS_Shape  DetectedShape ();
		%feature("compactdefaultargs") DetectedInteractive;
		%feature("autodoc", "	* Returns the interactive objects last detected in open context. If there is no open local context, the objects selected are called current objects; selected objects if there is one. Iterators allow entities to be recovered in either case. This method is one of a set which allows you to manipulate the objects which have been placed in these two lists.

	:rtype: Handle_AIS_InteractiveObject
") DetectedInteractive;
		Handle_AIS_InteractiveObject DetectedInteractive ();
		%feature("compactdefaultargs") DetectedOwner;
		%feature("autodoc", "	* returns the owner of the detected sensitive primitive.

	:rtype: Handle_SelectMgr_EntityOwner
") DetectedOwner;
		Handle_SelectMgr_EntityOwner DetectedOwner ();
		%feature("compactdefaultargs") InitDetected;
		%feature("autodoc", "	* Initialization for iteration through mouse-detected objects in interactive context or in local context if it is opened.

	:rtype: None
") InitDetected;
		void InitDetected ();
		%feature("compactdefaultargs") MoreDetected;
		%feature("autodoc", "	* returns true if there is more mouse-detected objects after the current one during iteration through mouse-detected interactive objects.

	:rtype: bool
") MoreDetected;
		Standard_Boolean MoreDetected ();
		%feature("compactdefaultargs") NextDetected;
		%feature("autodoc", "	* Gets next current object during iteration through mouse-detected interactive objects.

	:rtype: None
") NextDetected;
		void NextDetected ();
		%feature("compactdefaultargs") DetectedCurrentShape;
		%feature("autodoc", "	* returns current mouse-detected shape or empty (null) shape, if current interactive object is not a shape (AIS_Shape) or there is no current mouse-detected interactive object at all.

	:rtype: TopoDS_Shape
") DetectedCurrentShape;
		const TopoDS_Shape  DetectedCurrentShape ();
		%feature("compactdefaultargs") DetectedCurrentObject;
		%feature("autodoc", "	:rtype: Handle_AIS_InteractiveObject
") DetectedCurrentObject;
		Handle_AIS_InteractiveObject DetectedCurrentObject ();
		%feature("compactdefaultargs") OpenLocalContext;
		%feature("autodoc", "	* Opens local contexts and specifies how this is to be done. The options listed above function in the following manner: - UseDisplayedObjects -allows you to load or not load the interactive objects visualized at Neutral Point in the local context which you open. If false, the local context is empty after being opened. If true, the objects at Neutral Point are loaded by their default selection mode. - AllowShapeDecomposition -AIS_Shape allows or prevents decomposition in standard shape location mode of objects at Neutral Point which are type-'privileged'. This Flag is only taken into account when UseDisplayedObjects is true. - AcceptEraseOfObjects -authorises other local contexts to erase the interactive objects present in this context. This option is rarely used. - BothViewers - Has no use currently defined. This method returns the index of the created local context. It should be kept and used to close the context. Opening a local context allows you to prepare an environment for temporary presentations and selections which will disappear once the local context is closed. You can open several local contexts, but only the last one will be active.

	:param UseDisplayedObjects: default value is Standard_True
	:type UseDisplayedObjects: bool
	:param AllowShapeDecomposition: default value is Standard_True
	:type AllowShapeDecomposition: bool
	:param AcceptEraseOfObjects: default value is Standard_False
	:type AcceptEraseOfObjects: bool
	:param BothViewers: default value is Standard_False
	:type BothViewers: bool
	:rtype: int
") OpenLocalContext;
		Standard_Integer OpenLocalContext (const Standard_Boolean UseDisplayedObjects = Standard_True,const Standard_Boolean AllowShapeDecomposition = Standard_True,const Standard_Boolean AcceptEraseOfObjects = Standard_False,const Standard_Boolean BothViewers = Standard_False);
		%feature("compactdefaultargs") CloseLocalContext;
		%feature("autodoc", "	* Allows you to close local contexts. For greater security, you should close the context with the index Index given on opening. When you close a local context, the one before, which is still on the stack, reactivates. If none is left, you return to Neutral Point. If a local context is open and if updateviewer equals Standard_False, the presentation of the Interactive Object activates the selection mode; the object is displayed but no viewer will be updated. Warning When the index isn't specified, the current context is closed. This option can be dangerous, as other Interactive Functions can open local contexts without necessarily warning the user.

	:param Index: default value is -1
	:type Index: int
	:param updateviewer: default value is Standard_True
	:type updateviewer: bool
	:rtype: None
") CloseLocalContext;
		void CloseLocalContext (const Standard_Integer Index = -1,const Standard_Boolean updateviewer = Standard_True);
		%feature("compactdefaultargs") IndexOfCurrentLocal;
		%feature("autodoc", "	* returns -1 if no opened local context.

	:rtype: int
") IndexOfCurrentLocal;
		Standard_Integer IndexOfCurrentLocal ();
		%feature("compactdefaultargs") CloseAllContexts;
		%feature("autodoc", "	* Allows you to close all local contexts at one go and return to Neutral Point. If a local context is open and if updateviewer equals Standard_False, the presentation of the Interactive Object activates the selection mode; the object is displayed but no viewer will be updated.

	:param updateviewer: default value is Standard_True
	:type updateviewer: bool
	:rtype: None
") CloseAllContexts;
		void CloseAllContexts (const Standard_Boolean updateviewer = Standard_True);
		%feature("compactdefaultargs") ResetOriginalState;
		%feature("autodoc", "	* to be used only with no opened local context.. displays and activates objects in their original state before local contexts were opened...

	:param updateviewer: default value is Standard_True
	:type updateviewer: bool
	:rtype: None
") ResetOriginalState;
		void ResetOriginalState (const Standard_Boolean updateviewer = Standard_True);
		%feature("compactdefaultargs") ClearLocalContext;
		%feature("autodoc", "	* clears Objects/Filters/Activated Modes list in the current opened local context.

	:param TheMode: default value is AIS_CM_All
	:type TheMode: AIS_ClearMode
	:rtype: None
") ClearLocalContext;
		void ClearLocalContext (const AIS_ClearMode TheMode = AIS_CM_All);
		%feature("compactdefaultargs") UseDisplayedObjects;
		%feature("autodoc", "	:rtype: None
") UseDisplayedObjects;
		void UseDisplayedObjects ();
		%feature("compactdefaultargs") NotUseDisplayedObjects;
		%feature("autodoc", "	* when a local Context is opened, one is able to use/not use the displayed objects at neutral point at anytime.

	:rtype: None
") NotUseDisplayedObjects;
		void NotUseDisplayedObjects ();
		%feature("compactdefaultargs") BeginImmediateDraw;
		%feature("autodoc", "	* initializes the list of presentations to be displayed returns False if No Local COnte

	:rtype: bool
") BeginImmediateDraw;
		Standard_Boolean BeginImmediateDraw ();
		%feature("compactdefaultargs") ImmediateAdd;
		%feature("autodoc", "	* returns True if <anIObj> has been stored in the list.

	:param theObj:
	:type theObj: Handle_AIS_InteractiveObject &
	:param theMode: default value is 0
	:type theMode: int
	:rtype: bool
") ImmediateAdd;
		Standard_Boolean ImmediateAdd (const Handle_AIS_InteractiveObject & theObj,const Standard_Integer theMode = 0);
		%feature("compactdefaultargs") EndImmediateDraw;
		%feature("autodoc", "	* returns True if the immediate display has been done.

	:param theView:
	:type theView: Handle_V3d_View &
	:rtype: bool
") EndImmediateDraw;
		Standard_Boolean EndImmediateDraw (const Handle_V3d_View & theView);
		%feature("compactdefaultargs") EndImmediateDraw;
		%feature("autodoc", "	* Uses the First Active View of Main Viewer! returns True if the immediate display has been done.

	:rtype: bool
") EndImmediateDraw;
		Standard_Boolean EndImmediateDraw ();
		%feature("compactdefaultargs") IsImmediateModeOn;
		%feature("autodoc", "	:rtype: bool
") IsImmediateModeOn;
		Standard_Boolean IsImmediateModeOn ();
		%feature("compactdefaultargs") SetAutomaticHilight;
		%feature("autodoc", "	* Sets the highlighting status aStatus of detected and selected entities. Whether you are in Neutral Point or local context, this is automatically managed by the Interactive Context. This function allows you to disconnect the automatic mode.

	:param aStatus:
	:type aStatus: bool
	:rtype: None
") SetAutomaticHilight;
		void SetAutomaticHilight (const Standard_Boolean aStatus);
		%feature("compactdefaultargs") AutomaticHilight;
		%feature("autodoc", "	* Returns true if the automatic highlight mode is active in an open context.

	:rtype: bool
") AutomaticHilight;
		Standard_Boolean AutomaticHilight ();
		%feature("compactdefaultargs") SetZDetection;
		%feature("autodoc", "	* Enables/Disables the Z detection. If True the detection echo can be partially hidden by the detected object.

	:param aStatus: default value is Standard_False
	:type aStatus: bool
	:rtype: None
") SetZDetection;
		void SetZDetection (const Standard_Boolean aStatus = Standard_False);
		%feature("compactdefaultargs") ZDetection;
		%feature("autodoc", "	* Retrieves the Z detection state.

	:rtype: bool
") ZDetection;
		Standard_Boolean ZDetection ();
		%feature("compactdefaultargs") Activate;
		%feature("autodoc", "	* Activates the selection mode aMode whose index is given, for the given interactive entity anIobj.

	:param anIobj:
	:type anIobj: Handle_AIS_InteractiveObject &
	:param aMode: default value is 0
	:type aMode: int
	:param theIsForce: default value is Standard_False
	:type theIsForce: bool
	:rtype: None
") Activate;
		void Activate (const Handle_AIS_InteractiveObject & anIobj,const Standard_Integer aMode = 0,const Standard_Boolean theIsForce = Standard_False);
		%feature("compactdefaultargs") Deactivate;
		%feature("autodoc", "	* Deactivates all the activated selection modes of an object.

	:param anIObj:
	:type anIObj: Handle_AIS_InteractiveObject &
	:rtype: None
") Deactivate;
		void Deactivate (const Handle_AIS_InteractiveObject & anIObj);
		%feature("compactdefaultargs") Deactivate;
		%feature("autodoc", "	* Deactivates all the activated selection modes of the interactive object anIobj with a given selection mode aMode.

	:param anIobj:
	:type anIobj: Handle_AIS_InteractiveObject &
	:param aMode:
	:type aMode: int
	:rtype: None
") Deactivate;
		void Deactivate (const Handle_AIS_InteractiveObject & anIobj,const Standard_Integer aMode);
		%feature("compactdefaultargs") ActivatedModes;
		%feature("autodoc", "	* Returns the list of activated selection modes in an open context.

	:param anIobj:
	:type anIobj: Handle_AIS_InteractiveObject &
	:param theList:
	:type theList: TColStd_ListOfInteger &
	:rtype: None
") ActivatedModes;
		void ActivatedModes (const Handle_AIS_InteractiveObject & anIobj,TColStd_ListOfInteger & theList);
		%feature("compactdefaultargs") SetShapeDecomposition;
		%feature("autodoc", "	* to be Used only with opened local context and if <anIobj> is of type shape... if <aStatus> = True <anIobj> will be sensitive to shape selection modes activation. = False, <anIobj> will not be senstive any more.

	:param anIobj:
	:type anIobj: Handle_AIS_InteractiveObject &
	:param aStatus:
	:type aStatus: bool
	:rtype: None
") SetShapeDecomposition;
		void SetShapeDecomposition (const Handle_AIS_InteractiveObject & anIobj,const Standard_Boolean aStatus);
		%feature("compactdefaultargs") SetTemporaryAttributes;
		%feature("autodoc", "	* Sets the temporary graphic attributes of the entity anObj. These are provided by the attribute manager aDrawer and are valid for a particular local context only. If a local context is open and if updateviewer equals Standard_False, the presentation of the Interactive Object activates the selection mode; the object is displayed but no viewer will be updated.

	:param anObj:
	:type anObj: Handle_AIS_InteractiveObject &
	:param aDrawer:
	:type aDrawer: Handle_Prs3d_Drawer &
	:param updateviewer: default value is Standard_True
	:type updateviewer: bool
	:rtype: None
") SetTemporaryAttributes;
		void SetTemporaryAttributes (const Handle_AIS_InteractiveObject & anObj,const Handle_Prs3d_Drawer & aDrawer,const Standard_Boolean updateviewer = Standard_True);
		%feature("compactdefaultargs") SubIntensityOn;
		%feature("autodoc", "	* Highlights, and removes highlights from, the displayed object aniobj which is displayed at Neutral Point with subintensity color; available only for active local context. There is no effect if there is no local context. If a local context is open and if updateviewer equals Standard_False, the presentation of the Interactive Object activates the selection mode; the object is displayed but no viewer will be updated.

	:param aniobj:
	:type aniobj: Handle_AIS_InteractiveObject &
	:param updateviewer: default value is Standard_True
	:type updateviewer: bool
	:rtype: None
") SubIntensityOn;
		void SubIntensityOn (const Handle_AIS_InteractiveObject & aniobj,const Standard_Boolean updateviewer = Standard_True);
		%feature("compactdefaultargs") SubIntensityOff;
		%feature("autodoc", "	* Removes the subintensity option for the entity aniobj. If a local context is open and if updateviewer equals Standard_False, the presentation of the Interactive Object activates the selection mode; the object is displayed but no viewer will be updated.

	:param aniobj:
	:type aniobj: Handle_AIS_InteractiveObject &
	:param updateviewer: default value is Standard_True
	:type updateviewer: bool
	:rtype: None
") SubIntensityOff;
		void SubIntensityOff (const Handle_AIS_InteractiveObject & aniobj,const Standard_Boolean updateviewer = Standard_True);
		%feature("compactdefaultargs") SubIntensityOn;
		%feature("autodoc", "	* hilights/unhilights displayed objects which are displayed at neutral state with subintensity color; available only for active local context. No effect if no local context.

	:param updateviewer: default value is Standard_True
	:type updateviewer: bool
	:rtype: None
") SubIntensityOn;
		void SubIntensityOn (const Standard_Boolean updateviewer = Standard_True);
		%feature("compactdefaultargs") SubIntensityOff;
		%feature("autodoc", "	* removes subintensity option for all objects.

	:param updateviewer: default value is Standard_True
	:type updateviewer: bool
	:rtype: None
") SubIntensityOff;
		void SubIntensityOff (const Standard_Boolean updateviewer = Standard_True);
		%feature("compactdefaultargs") AddFilter;
		%feature("autodoc", "	* Allows you to add the filter aFilter to Neutral Point or to a local context if one or more selection modes have been activated. Only type filters may be active in Neutral Point.

	:param aFilter:
	:type aFilter: Handle_SelectMgr_Filter &
	:rtype: None
") AddFilter;
		void AddFilter (const Handle_SelectMgr_Filter & aFilter);
		%feature("compactdefaultargs") RemoveFilter;
		%feature("autodoc", "	* Removes a filter from Neutral Point or a local context if one or more selection modes have been activated. Only type filters are activated in Neutral Point.

	:param aFilter:
	:type aFilter: Handle_SelectMgr_Filter &
	:rtype: None
") RemoveFilter;
		void RemoveFilter (const Handle_SelectMgr_Filter & aFilter);
		%feature("compactdefaultargs") RemoveFilters;
		%feature("autodoc", "	* Remove a filter to Neutral Point or a local context if one or more selection modes have been activated. Only type filters are active in Neutral Point.

	:rtype: None
") RemoveFilters;
		void RemoveFilters ();
		%feature("compactdefaultargs") ActivateStandardMode;
		%feature("autodoc", "	* Provides an alternative to the Display methods when activating specific selection modes. This has the effect of activating the corresponding selection mode aStandardActivation for all objects in Local Context which accept decomposition into sub-shapes. Every new Object which has been loaded into the interactive context and which answers these decomposition criteria is automatically activated according to these modes. Warning If you have opened a local context by loading an object with the default options (<AllowShapeDecomposition >= Standard_True), all objects of the 'Shape' type are also activated with the same modes. You can act on the state of these 'Standard' objects by using SetShapeDecomposition(Status).

	:param aStandardActivation:
	:type aStandardActivation: TopAbs_ShapeEnum
	:rtype: None
") ActivateStandardMode;
		void ActivateStandardMode (const TopAbs_ShapeEnum aStandardActivation);
		%feature("compactdefaultargs") DeactivateStandardMode;
		%feature("autodoc", "	* Provides an alternative to the Display methods when deactivating specific selection modes. This has the effect of deactivating the corresponding selection mode aStandardActivation for all objects in Local Context which accept decomposition into sub-shapes.

	:param aStandardActivation:
	:type aStandardActivation: TopAbs_ShapeEnum
	:rtype: None
") DeactivateStandardMode;
		void DeactivateStandardMode (const TopAbs_ShapeEnum aStandardActivation);
		%feature("compactdefaultargs") ActivatedStandardModes;
		%feature("autodoc", "	* Returns the list of activated standard selection modes available in a local context.

	:rtype: TColStd_ListOfInteger
") ActivatedStandardModes;
		const TColStd_ListOfInteger & ActivatedStandardModes ();
		%feature("compactdefaultargs") Filters;
		%feature("autodoc", "	* Returns the list of filters active in a local context.

	:rtype: SelectMgr_ListOfFilter
") Filters;
		const SelectMgr_ListOfFilter & Filters ();
		%feature("compactdefaultargs") DefaultDrawer;
		%feature("autodoc", "	* Returns the default attribute manager. This contains all the color and line attributes which can be used by interactive objects which do not have their own attributes.

	:rtype: Handle_Prs3d_Drawer
") DefaultDrawer;
		Handle_Prs3d_Drawer DefaultDrawer ();
		%feature("compactdefaultargs") CurrentViewer;
		%feature("autodoc", "	* Returns the current viewer.

	:rtype: Handle_V3d_Viewer
") CurrentViewer;
		Handle_V3d_Viewer CurrentViewer ();
		%feature("compactdefaultargs") DisplayedObjects;
		%feature("autodoc", "	* Returns the list of displayed objects of a particular Type WhichKind and Signature WhichSignature. By Default, WhichSignature equals -1. This means that there is a check on type only.

	:param aListOfIO:
	:type aListOfIO: AIS_ListOfInteractive &
	:param OnlyFromNeutral: default value is Standard_False
	:type OnlyFromNeutral: bool
	:rtype: None
") DisplayedObjects;
		void DisplayedObjects (AIS_ListOfInteractive & aListOfIO,const Standard_Boolean OnlyFromNeutral = Standard_False);
		%feature("compactdefaultargs") DisplayedObjects;
		%feature("autodoc", "	* gives the list of displayed objects of a particular Type and signature. by Default, <WhichSignature> = -1 means control only on <WhichKind>.

	:param WhichKind:
	:type WhichKind: AIS_KindOfInteractive
	:param WhichSignature:
	:type WhichSignature: int
	:param aListOfIO:
	:type aListOfIO: AIS_ListOfInteractive &
	:param OnlyFromNeutral: default value is Standard_False
	:type OnlyFromNeutral: bool
	:rtype: None
") DisplayedObjects;
		void DisplayedObjects (const AIS_KindOfInteractive WhichKind,const Standard_Integer WhichSignature,AIS_ListOfInteractive & aListOfIO,const Standard_Boolean OnlyFromNeutral = Standard_False);
		%feature("compactdefaultargs") ErasedObjects;
		%feature("autodoc", "	* Returns the list theListOfIO of erased objects (hidden objects) particular Type WhichKind and Signature WhichSignature. By Default, WhichSignature equals 1. This means that there is a check on type only.

	:param theListOfIO:
	:type theListOfIO: AIS_ListOfInteractive &
	:rtype: None
") ErasedObjects;
		void ErasedObjects (AIS_ListOfInteractive & theListOfIO);
		%feature("compactdefaultargs") ErasedObjects;
		%feature("autodoc", "	* gives the list of erased objects (hidden objects) Type and signature by Default, <WhichSignature> = -1 means control only on <WhichKind>.

	:param WhichKind:
	:type WhichKind: AIS_KindOfInteractive
	:param WhichSignature:
	:type WhichSignature: int
	:param theListOfIO:
	:type theListOfIO: AIS_ListOfInteractive &
	:rtype: None
") ErasedObjects;
		void ErasedObjects (const AIS_KindOfInteractive WhichKind,const Standard_Integer WhichSignature,AIS_ListOfInteractive & theListOfIO);
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
		%feature("compactdefaultargs") HasOpenedContext;
		%feature("autodoc", "	* Returns true if there is an open context.

	:rtype: bool
") HasOpenedContext;
		Standard_Boolean HasOpenedContext ();
		%feature("compactdefaultargs") CurrentName;
		%feature("autodoc", "	* Returns the name of the current selected entity in Neutral Point. Objects selected when there is no open local context are called current objects; those selected in open local context, selected objects.

	:rtype: TCollection_AsciiString
") CurrentName;
		const TCollection_AsciiString & CurrentName ();
		%feature("compactdefaultargs") SelectionName;
		%feature("autodoc", "	* Returns the name of the current selected entity in open local context. Objects selected when there is no open local context are called current objects; those selected in open local context, selected objects.

	:rtype: TCollection_AsciiString
") SelectionName;
		const TCollection_AsciiString & SelectionName ();
		%feature("compactdefaultargs") DomainOfMainViewer;
		%feature("autodoc", "	* Returns the domain name of the main viewer.

	:rtype: char *
") DomainOfMainViewer;
		const char * DomainOfMainViewer ();
		%feature("compactdefaultargs") LocalContext;
		%feature("autodoc", "	* This method is only intended for advanced operation, particularly with the aim to improve performance when many objects have to be selected together. Otherwise, you should use other (non-internal) methods of class AIS_InteractiveContext without trying to obtain an instance of AIS_LocalContext.

	:rtype: Handle_AIS_LocalContext
") LocalContext;
		Handle_AIS_LocalContext LocalContext ();
		%feature("compactdefaultargs") SelectionManager;
		%feature("autodoc", "	:rtype: Handle_SelectMgr_SelectionManager
") SelectionManager;
		Handle_SelectMgr_SelectionManager SelectionManager ();
		%feature("compactdefaultargs") MainPrsMgr;
		%feature("autodoc", "	:rtype: Handle_PrsMgr_PresentationManager3d
") MainPrsMgr;
		Handle_PrsMgr_PresentationManager3d MainPrsMgr ();
		%feature("compactdefaultargs") MainSelector;
		%feature("autodoc", "	:rtype: Handle_StdSelect_ViewerSelector3d
") MainSelector;
		Handle_StdSelect_ViewerSelector3d MainSelector ();
		%feature("compactdefaultargs") LocalSelector;
		%feature("autodoc", "	:rtype: Handle_StdSelect_ViewerSelector3d
") LocalSelector;
		Handle_StdSelect_ViewerSelector3d LocalSelector ();
		%feature("compactdefaultargs") PurgeDisplay;
		%feature("autodoc", "	* Clears all the structures which don't belong to objects displayed at neutral point only effective when no Local Context is opened... returns the number of removed structures from the viewers.

	:rtype: int
") PurgeDisplay;
		Standard_Integer PurgeDisplay ();
		%feature("compactdefaultargs") HighestIndex;
		%feature("autodoc", "	:rtype: int
") HighestIndex;
		Standard_Integer HighestIndex ();
		%feature("compactdefaultargs") DisplayActiveSensitive;
		%feature("autodoc", "	:param aView:
	:type aView: Handle_V3d_View &
	:rtype: None
") DisplayActiveSensitive;
		void DisplayActiveSensitive (const Handle_V3d_View & aView);
		%feature("compactdefaultargs") ClearActiveSensitive;
		%feature("autodoc", "	:param aView:
	:type aView: Handle_V3d_View &
	:rtype: None
") ClearActiveSensitive;
		void ClearActiveSensitive (const Handle_V3d_View & aView);
		%feature("compactdefaultargs") FitSelected;
		%feature("autodoc", "	* Fits the view correspondingly to the bounds of selected objects. Infinite objects are ignored if infinite state of AIS_InteractiveObject is set to true.

	:param theView:
	:type theView: Handle_V3d_View &
	:param theMargin: default value is 0.01
	:type theMargin: float
	:param theToUpdate: default value is Standard_True
	:type theToUpdate: bool
	:rtype: None
") FitSelected;
		void FitSelected (const Handle_V3d_View & theView,const Standard_Real theMargin = 0.01,const Standard_Boolean theToUpdate = Standard_True);
		%feature("compactdefaultargs") DisplayActiveSensitive;
		%feature("autodoc", "	:param anObject:
	:type anObject: Handle_AIS_InteractiveObject &
	:param aView:
	:type aView: Handle_V3d_View &
	:rtype: None
") DisplayActiveSensitive;
		void DisplayActiveSensitive (const Handle_AIS_InteractiveObject & anObject,const Handle_V3d_View & aView);
		%feature("compactdefaultargs") IsInLocal;
		%feature("autodoc", "	* returns if possible, the first local context where the object is seen

	:param anObject:
	:type anObject: Handle_AIS_InteractiveObject &
	:param TheIndex:
	:type TheIndex: int &
	:rtype: bool
") IsInLocal;
		Standard_Boolean IsInLocal (const Handle_AIS_InteractiveObject & anObject,Standard_Integer &OutValue);
		%feature("compactdefaultargs") RebuildSelectionStructs;
		%feature("autodoc", "	* Rebuilds 1st level of BVH selection forcibly

	:rtype: None
") RebuildSelectionStructs;
		void RebuildSelectionStructs ();
		%feature("compactdefaultargs") SetViewAffinity;
		%feature("autodoc", "	* setup object visibility in specified view, has no effect if object is not disaplyed in this context.

	:param theIObj:
	:type theIObj: Handle_AIS_InteractiveObject &
	:param theView:
	:type theView: Handle_V3d_View &
	:param theIsVisible:
	:type theIsVisible: bool
	:rtype: None
") SetViewAffinity;
		void SetViewAffinity (const Handle_AIS_InteractiveObject & theIObj,const Handle_V3d_View & theView,const Standard_Boolean theIsVisible);
		%feature("compactdefaultargs") Disconnect;
		%feature("autodoc", "	* Disconnects theObjToDisconnect from theAssembly and removes dependent selection structures

	:param theAssembly:
	:type theAssembly: Handle_AIS_InteractiveObject &
	:param theObjToDisconnect: default value is NULL
	:type theObjToDisconnect: Handle_AIS_InteractiveObject &
	:rtype: None
") Disconnect;
		void Disconnect (const Handle_AIS_InteractiveObject & theAssembly,const Handle_AIS_InteractiveObject & theObjToDisconnect = NULL);
		%feature("compactdefaultargs") ObjectsForView;
		%feature("autodoc", "	* Query objects visible or hidden in specified view due to affinity mask.

	:param theListOfIO:
	:type theListOfIO: AIS_ListOfInteractive &
	:param theView:
	:type theView: Handle_V3d_View &
	:param theIsVisibleInView:
	:type theIsVisibleInView: bool
	:param theStatus: default value is AIS_DS_None
	:type theStatus: AIS_DisplayStatus
	:rtype: None
") ObjectsForView;
		void ObjectsForView (AIS_ListOfInteractive & theListOfIO,const Handle_V3d_View & theView,const Standard_Boolean theIsVisibleInView,const AIS_DisplayStatus theStatus = AIS_DS_None);
};


%extend AIS_InteractiveContext {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_AIS_InteractiveContext(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_AIS_InteractiveContext::Handle_AIS_InteractiveContext %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_AIS_InteractiveContext;
class Handle_AIS_InteractiveContext : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_AIS_InteractiveContext();
        Handle_AIS_InteractiveContext(const Handle_AIS_InteractiveContext &aHandle);
        Handle_AIS_InteractiveContext(const AIS_InteractiveContext *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_AIS_InteractiveContext DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_AIS_InteractiveContext {
    AIS_InteractiveContext* _get_reference() {
    return (AIS_InteractiveContext*)$self->Access();
    }
};

%extend Handle_AIS_InteractiveContext {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend AIS_InteractiveContext {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor AIS_InteractiveObject;
class AIS_InteractiveObject : public SelectMgr_SelectableObject {
	public:
		%feature("compactdefaultargs") Type;
		%feature("autodoc", "	* Returns the kind of Interactive Object: - None - Datum - Relation - Object By default, the interactive object has a None type. Because specific shapes entail different behavior according to their sub-shapes, you may need to create a Local Context. This will allow you to specify the additional characteristics which you need to handle these shapes.

	:rtype: AIS_KindOfInteractive
") Type;
		virtual AIS_KindOfInteractive Type ();
		%feature("compactdefaultargs") Signature;
		%feature("autodoc", "	* Specifies additional characteristics of Interactive Objects. A signature is, in fact, an index with integer values assigned different properties. This method is frequently used in conjuction with Type to give a particular type and signature to an Interactive Object. By default, the Interactive Object has a None type and a signature of 0. Among the datums, this signature is attributed to the shape The remaining datums have the following default signatures: - Point  signature 1 - Axis signature 2 - Trihedron signature 3 - PlaneTrihedron signature 4 - Line signature 5 - Circle signature 6 - Plane  signature 7.

	:rtype: int
") Signature;
		virtual Standard_Integer Signature ();
		%feature("compactdefaultargs") AcceptShapeDecomposition;
		%feature("autodoc", "	* Informs the graphic context that the interactive Object may be decomposed into sub-shapes for dynamic selection. The most used Interactive Object is AIS_Shape. Activation methods for standard selection modes are proposed in the Interactive Context. These include selection by vertex or by edges. For datums with the same behavior as AIS_Shape, such as vetices and edges, we must redefine the virtual method so that AcceptShapeDecomposition returns false. Rule for selection : Mode 0 : Selection of the interactive Object itself Mode 1 : Selection of vertices Mode 2 : Selection Of Edges Mode 3 : Selection Of Wires Mode 4 : Selection Of Faces ...

	:rtype: bool
") AcceptShapeDecomposition;
		Standard_Boolean AcceptShapeDecomposition ();
		%feature("compactdefaultargs") SetCurrentFacingModel;
		%feature("autodoc", "	* change the current facing model apply on polygons for SetColor(), SetTransparency(), SetMaterial() methods default facing model is Aspect_TOFM_TWO_SIDE. This mean that attributes is applying both on the front and back face.

	:param aModel: default value is Aspect_TOFM_BOTH_SIDE
	:type aModel: Aspect_TypeOfFacingModel
	:rtype: None
") SetCurrentFacingModel;
		void SetCurrentFacingModel (const Aspect_TypeOfFacingModel aModel = Aspect_TOFM_BOTH_SIDE);
		%feature("compactdefaultargs") CurrentFacingModel;
		%feature("autodoc", "	* Returns the current facing model which is in effect.

	:rtype: Aspect_TypeOfFacingModel
") CurrentFacingModel;
		Aspect_TypeOfFacingModel CurrentFacingModel ();
		%feature("compactdefaultargs") SetColor;
		%feature("autodoc", "	:param aColor:
	:type aColor: Quantity_Color &
	:rtype: void
") SetColor;
		virtual void SetColor (const Quantity_Color & aColor);
		%feature("compactdefaultargs") SetColor;
		%feature("autodoc", "	* only the interactive obj knowns which Drawer attribute is affected by the color (ex: for a wire, it's the wireaspect field of the drawer, but for a vertex, only the point aspect field is affected by the color) WARNING : Do not forget to set the corresponding fields here (hasOwnColor and myOwnColor)

	:param aColor:
	:type aColor: Quantity_NameOfColor
	:rtype: void
") SetColor;
		virtual void SetColor (const Quantity_NameOfColor aColor);
		%feature("compactdefaultargs") UnsetColor;
		%feature("autodoc", "	* Removes color settings. Only the Interactive Object knows which Drawer attribute is affected by the color setting. For a wire, for example, wire aspect is the attribute affected. For a vertex, however, only point aspect is affected by the color setting.

	:rtype: void
") UnsetColor;
		virtual void UnsetColor ();
		%feature("compactdefaultargs") SetWidth;
		%feature("autodoc", "	* Allows you to provide the setting aValue for width. Only the Interactive Object knows which Drawer attribute is affected by the width setting.

	:param aValue:
	:type aValue: float
	:rtype: void
") SetWidth;
		virtual void SetWidth (const Standard_Real aValue);
		%feature("compactdefaultargs") UnsetWidth;
		%feature("autodoc", "	:rtype: void
") UnsetWidth;
		virtual void UnsetWidth ();
		%feature("compactdefaultargs") AcceptDisplayMode;
		%feature("autodoc", "	* Returns true if the class of objects accepts the display mode aMode. The interactive context can have a default mode of representation for the set of Interactive Objects. This mode may not be accepted by a given class of objects. Consequently, this virtual method allowing us to get information about the class in question must be implemented.

	:param aMode:
	:type aMode: int
	:rtype: bool
") AcceptDisplayMode;
		virtual Standard_Boolean AcceptDisplayMode (const Standard_Integer aMode);
		%feature("compactdefaultargs") DefaultDisplayMode;
		%feature("autodoc", "	* Returns the default display mode. This method is to be implemented when the main mode is not mode 0.

	:rtype: int
") DefaultDisplayMode;
		virtual Standard_Integer DefaultDisplayMode ();
		%feature("compactdefaultargs") Redisplay;
		%feature("autodoc", "	* Updates the active presentation; if <AllModes> = Standard_True all the presentations inside are recomputed. IMPORTANT: It is preferable to call Redisplay method of corresponding AIS_InteractiveContext instance for cases when it is accessible. This method just redirects call to myCTXPtr, so this class field must be up to date for proper result.

	:param AllModes: default value is Standard_False
	:type AllModes: bool
	:rtype: None
") Redisplay;
		void Redisplay (const Standard_Boolean AllModes = Standard_False);
		%feature("compactdefaultargs") SetInfiniteState;
		%feature("autodoc", "	* Sets the infinite state flag aFlage. if <aFlag> = True , the interactiveObject is considered as infinite, i.e. its graphic presentations are not taken in account for View FitAll...

	:param aFlag: default value is Standard_True
	:type aFlag: bool
	:rtype: None
") SetInfiniteState;
		void SetInfiniteState (const Standard_Boolean aFlag = Standard_True);
		%feature("compactdefaultargs") IsInfinite;
		%feature("autodoc", "	* Returns true if the interactive object is infinite. In this case, its graphic presentations are not taken into account in the fit-all view.

	:rtype: bool
") IsInfinite;
		Standard_Boolean IsInfinite ();
		%feature("compactdefaultargs") HasInteractiveContext;
		%feature("autodoc", "	* Indicates whether the Interactive Object has a pointer to an interactive context.

	:rtype: bool
") HasInteractiveContext;
		Standard_Boolean HasInteractiveContext ();
		%feature("compactdefaultargs") GetContext;
		%feature("autodoc", "	* Returns the context pointer to the interactive context.

	:rtype: Handle_AIS_InteractiveContext
") GetContext;
		Handle_AIS_InteractiveContext GetContext ();
		%feature("compactdefaultargs") SetContext;
		%feature("autodoc", "	* Sets the interactive context aCtx and provides a link to the default drawing tool or 'Drawer' if there is none.

	:param aCtx:
	:type aCtx: Handle_AIS_InteractiveContext &
	:rtype: void
") SetContext;
		virtual void SetContext (const Handle_AIS_InteractiveContext & aCtx);
		%feature("compactdefaultargs") HasOwner;
		%feature("autodoc", "	* Returns true if the object has an owner attributed to it. The owner can be a shape for a set of sub-shapes or a sub-shape for sub-shapes which it is composed of, and takes the form of a transient.

	:rtype: bool
") HasOwner;
		Standard_Boolean HasOwner ();
		%feature("compactdefaultargs") GetOwner;
		%feature("autodoc", "	* Returns the owner of the Interactive Object. The owner can be a shape for a set of sub-shapes or a sub-shape for sub-shapes which it is composed of, and takes the form of a transient. There are two types of owners: - Direct owners, decomposition shapes such as edges, wires, and faces. - Users, presentable objects connecting to sensitive primitives, or a shape which has been decomposed.

	:rtype: Handle_Standard_Transient
") GetOwner;
		Handle_Standard_Transient GetOwner ();
		%feature("compactdefaultargs") SetOwner;
		%feature("autodoc", "	* Allows you to attribute the owner ApplicativeEntity to an Interactive Object. This can be a shape for a set of sub-shapes or a sub-shape for sub-shapes which it is composed of. The owner takes the form of a transient.

	:param ApplicativeEntity:
	:type ApplicativeEntity: Handle_Standard_Transient &
	:rtype: None
") SetOwner;
		void SetOwner (const Handle_Standard_Transient & ApplicativeEntity);
		%feature("compactdefaultargs") ClearOwner;
		%feature("autodoc", "	* Each Interactive Object has methods which allow us to attribute an Owner to it in the form of a Transient. This method removes the owner from the graphic entity.

	:rtype: None
") ClearOwner;
		void ClearOwner ();
		%feature("compactdefaultargs") HasUsers;
		%feature("autodoc", "	:rtype: bool
") HasUsers;
		Standard_Boolean HasUsers ();
		%feature("compactdefaultargs") Users;
		%feature("autodoc", "	:rtype: TColStd_ListOfTransient
") Users;
		const TColStd_ListOfTransient & Users ();
		%feature("compactdefaultargs") AddUser;
		%feature("autodoc", "	:param aUser:
	:type aUser: Handle_Standard_Transient &
	:rtype: None
") AddUser;
		void AddUser (const Handle_Standard_Transient & aUser);
		%feature("compactdefaultargs") ClearUsers;
		%feature("autodoc", "	:rtype: None
") ClearUsers;
		void ClearUsers ();
		%feature("compactdefaultargs") HasDisplayMode;
		%feature("autodoc", "	* Returns true if the Interactive Object has a display mode setting. Otherwise, it is displayed in Neutral Point.

	:rtype: bool
") HasDisplayMode;
		Standard_Boolean HasDisplayMode ();
		%feature("compactdefaultargs") SetDisplayMode;
		%feature("autodoc", "	* Sets the display mode aMode for the interactive object. An object can have its own temporary display mode, which is different from that proposed by the interactive context. The range of possibilities currently proposed is the following: - AIS_WireFrame - AIS_Shaded This range can, however, be extended through the creation of new display modes.

	:param aMode:
	:type aMode: int
	:rtype: None
") SetDisplayMode;
		void SetDisplayMode (const Standard_Integer aMode);
		%feature("compactdefaultargs") UnsetDisplayMode;
		%feature("autodoc", "	* Removes display mode settings from the interactive object.

	:rtype: None
") UnsetDisplayMode;
		void UnsetDisplayMode ();
		%feature("compactdefaultargs") DisplayMode;
		%feature("autodoc", "	* Returns the display mode setting of the Interactive Object. The range of possibilities is the following: - AIS_WireFrame - AIS_Shaded This range can, however, be extended through the creation of new display modes.

	:rtype: int
") DisplayMode;
		Standard_Integer DisplayMode ();
		%feature("compactdefaultargs") HasSelectionMode;
		%feature("autodoc", "	* Allows you to change the selection mode of an Interactive Object. The default selection mode setting is 0. For shapes, for example, the selection modes are as follows: - mode 0 - selection of the shape itself - mode 1 - selection of vertices - mode 2 - selection of edges - mode 3 - selection of wires - mode 4 - selection of faces - mode 5 - selection of shells - mode 6 - selection of solids - mode 7 - selection of compounds For trihedra, on the other hand, the selection modes are the following four: - mode 0 - selection of a trihedron - mode 1 - selection of its origin - mode 2 - selection of its axes - mode 3 - selection of its planes

	:rtype: bool
") HasSelectionMode;
		Standard_Boolean HasSelectionMode ();
		%feature("compactdefaultargs") SelectionMode;
		%feature("autodoc", "	* Returns the selection mode of the interactive object.

	:rtype: int
") SelectionMode;
		Standard_Integer SelectionMode ();
		%feature("compactdefaultargs") SetSelectionMode;
		%feature("autodoc", "	* You can change the default selection mode index aMode of an Interactive Object. This is only of interest if you decide that mode 0 adopted by convention will not do.

	:param aMode:
	:type aMode: int
	:rtype: None
") SetSelectionMode;
		void SetSelectionMode (const Standard_Integer aMode);
		%feature("compactdefaultargs") UnsetSelectionMode;
		%feature("autodoc", "	* You can change the default selection mode index of an Interactive Object. This is only of interest if you decide that the 0 mode adopted by convention will not do.

	:rtype: None
") UnsetSelectionMode;
		void UnsetSelectionMode ();
		%feature("compactdefaultargs") SelectionPriority;
		%feature("autodoc", "	* Returns the selection priority setting. -1 indicates that there is none. You can modify the selection priority of an owner to make one entity more selectionable than another one. The default selection priority for an owner is 5, for example. To increase selection priority, choose a setting between 5 and 10. An entity with priority 7 will take priority over one with a setting of 6 if both objects are selected at the same time. You could give vertices priority 8, edges priority 7, faces priority 6, and shapes priority 5. If a vertex, an edge and a face are simultaneously detected during selection, only the vertex will then be highlighted. For trihedra, for example, the default priorities are the following four: - priority 1 - a trihedron - priority 5 - its origin - priority 3 - its axes - priority 2 - its planes

	:rtype: int
") SelectionPriority;
		Standard_Integer SelectionPriority ();
		%feature("compactdefaultargs") SetSelectionPriority;
		%feature("autodoc", "	* Allows you to provide a setting aPriority for selection priority. You can modify selection priority of an owner to make one entity more selectionable than another one. The default selection priority for an owner is 5, for example. To increase selection priority, choose a setting between 5 and 10. An entity with priority 7 will take priority over one with a setting of 6.

	:param aPriority:
	:type aPriority: int
	:rtype: None
") SetSelectionPriority;
		void SetSelectionPriority (const Standard_Integer aPriority);
		%feature("compactdefaultargs") UnsetSelectionPriority;
		%feature("autodoc", "	* Removes the setting for selection priority. SelectionPriority then returns -1.

	:rtype: None
") UnsetSelectionPriority;
		void UnsetSelectionPriority ();
		%feature("compactdefaultargs") HasSelectionPriority;
		%feature("autodoc", "	* Returns true if there is a setting for selection priority. You can modify selection priority of an owner to make one entity more selectionable than another one. The default selection priority for an owner is 5, for example. To increase selection priority, choose a setting between 5 and 10. An entity with priority 7 will take priority over one with a setting of 6.

	:rtype: bool
") HasSelectionPriority;
		Standard_Boolean HasSelectionPriority ();
		%feature("compactdefaultargs") HasHilightMode;
		%feature("autodoc", "	* Returns true if the Interactive Object is in highlight mode.

	:rtype: bool
") HasHilightMode;
		Standard_Boolean HasHilightMode ();
		%feature("compactdefaultargs") HilightMode;
		%feature("autodoc", "	* Returns the setting for highlight mode. At dynamic detection, the presentation echoed by the Interactive Context, is by default the presentation already on the screen. You can specify a Highlight presentation mode which is valid no matter what the active representation of the object. It makes no difference whether this choice is temporary or definitive. To do this, we use the following functions: - SetHilightMode - UnSetHilightMode In the case of a shape, whether it is visualized in wireframe presentation or with shading, we want to systematically highlight the wireframe presentation. Consequently, we set the highlight mode to 0.

	:rtype: int
") HilightMode;
		Standard_Integer HilightMode ();
		%feature("compactdefaultargs") SetHilightMode;
		%feature("autodoc", "	* Sets the highlight mode anIndex for the interactive object. If, for example, you want to systematically highlight the wireframe presentation of a shape - whether visualized in wireframe presentation or with shading - you set the highlight mode to 0.

	:param anIndex:
	:type anIndex: int
	:rtype: None
") SetHilightMode;
		void SetHilightMode (const Standard_Integer anIndex);
		%feature("compactdefaultargs") UnsetHilightMode;
		%feature("autodoc", "	* Allows the user to take a given Prs for hilight ex : for a shape which would be displayed in shading mode the hilight Prs is the wireframe mode. if No specific hilight mode is defined, the displayed Prs will be the hilighted one.

	:rtype: None
") UnsetHilightMode;
		void UnsetHilightMode ();
		%feature("compactdefaultargs") HasColor;
		%feature("autodoc", "	* Returns true if the Interactive Object has color.

	:rtype: bool
") HasColor;
		Standard_Boolean HasColor ();
		%feature("compactdefaultargs") Color;
		%feature("autodoc", "	* Returns the color setting of the Interactive Object.

	:rtype: Quantity_NameOfColor
") Color;
		Quantity_NameOfColor Color ();
		%feature("compactdefaultargs") Color;
		%feature("autodoc", "	:param aColor:
	:type aColor: Quantity_Color &
	:rtype: None
") Color;
		void Color (Quantity_Color & aColor);
		%feature("compactdefaultargs") HasWidth;
		%feature("autodoc", "	* Returns true if the Interactive Object has width.

	:rtype: bool
") HasWidth;
		Standard_Boolean HasWidth ();
		%feature("compactdefaultargs") Width;
		%feature("autodoc", "	* Returns the width setting of the Interactive Object.

	:rtype: float
") Width;
		Standard_Real Width ();
		%feature("compactdefaultargs") HasMaterial;
		%feature("autodoc", "	* Returns true if the Interactive Object has a setting for material.

	:rtype: bool
") HasMaterial;
		Standard_Boolean HasMaterial ();
		%feature("compactdefaultargs") Material;
		%feature("autodoc", "	* Returns the current material setting. This will be on of the following materials: - Brass - Bronze - Gold - Pewter - Silver - Stone.

	:rtype: Graphic3d_NameOfMaterial
") Material;
		virtual Graphic3d_NameOfMaterial Material ();
		%feature("compactdefaultargs") SetMaterial;
		%feature("autodoc", "	* Sets the name aName for material defining this display attribute for the interactive object. Material aspect determines shading aspect, color and transparency of visible entities.

	:param aName:
	:type aName: Graphic3d_NameOfMaterial
	:rtype: void
") SetMaterial;
		virtual void SetMaterial (const Graphic3d_NameOfMaterial aName);
		%feature("compactdefaultargs") SetMaterial;
		%feature("autodoc", "	* Sets the material aMat defining this display attribute for the interactive object. Material aspect determines shading aspect, color and transparency of visible entities.

	:param aName:
	:type aName: Graphic3d_MaterialAspect &
	:rtype: void
") SetMaterial;
		virtual void SetMaterial (const Graphic3d_MaterialAspect & aName);
		%feature("compactdefaultargs") UnsetMaterial;
		%feature("autodoc", "	* Removes the setting for material.

	:rtype: void
") UnsetMaterial;
		virtual void UnsetMaterial ();
		%feature("compactdefaultargs") SetTransparency;
		%feature("autodoc", "	* Attributes a setting aValue for transparency. The transparency value should be between 0.0 and 1.0. At 0.0 an object will be totally opaque, and at 1.0, fully transparent. Warning At a value of 1.0, there may be nothing visible.

	:param aValue: default value is 0.6
	:type aValue: float
	:rtype: void
") SetTransparency;
		virtual void SetTransparency (const Standard_Real aValue = 0.6);
		%feature("compactdefaultargs") IsTransparent;
		%feature("autodoc", "	* Returns true if there is a transparency setting.

	:rtype: bool
") IsTransparent;
		Standard_Boolean IsTransparent ();
		%feature("compactdefaultargs") Transparency;
		%feature("autodoc", "	* Returns the transparency setting. This will be between 0.0 and 1.0. At 0.0 an object will be totally opaque, and at 1.0, fully transparent.

	:rtype: float
") Transparency;
		virtual Standard_Real Transparency ();
		%feature("compactdefaultargs") UnsetTransparency;
		%feature("autodoc", "	* Removes the transparency setting. The object is opaque by default.

	:rtype: void
") UnsetTransparency;
		virtual void UnsetTransparency ();
		%feature("compactdefaultargs") UnsetAttributes;
		%feature("autodoc", "	* Clears settings provided by the drawing tool aDrawer.

	:rtype: void
") UnsetAttributes;
		virtual void UnsetAttributes ();
		%feature("compactdefaultargs") State;
		%feature("autodoc", "	:param theState:
	:type theState: int
	:rtype: None
") State;
		void State (const Standard_Integer theState);
		%feature("compactdefaultargs") State;
		%feature("autodoc", "	:rtype: int
") State;
		Standard_Integer State ();
		%feature("compactdefaultargs") HasPresentation;
		%feature("autodoc", "	* Returns True when this object has a presentation in the current DisplayMode()

	:rtype: bool
") HasPresentation;
		Standard_Boolean HasPresentation ();
		%feature("compactdefaultargs") Presentation;
		%feature("autodoc", "	* Returns the current presentation of this object according to the current DisplayMode()

	:rtype: Handle_Prs3d_Presentation
") Presentation;
		Handle_Prs3d_Presentation Presentation ();
		%feature("compactdefaultargs") SetAspect;
		%feature("autodoc", "	* Sets the graphic basic aspect to the current presentation. When <globalChange> is True , the full object presentation is changed. When <globalChange> is False , only the current group of the object presentation is changed.

	:param anAspect:
	:type anAspect: Handle_Prs3d_BasicAspect &
	:param globalChange: default value is Standard_True
	:type globalChange: bool
	:rtype: None
") SetAspect;
		void SetAspect (const Handle_Prs3d_BasicAspect & anAspect,const Standard_Boolean globalChange = Standard_True);
		%feature("compactdefaultargs") SetPolygonOffsets;
		%feature("autodoc", "	* Sets up polygon offsets for this object. It modifies all existing presentations of <anObj> (if any), so it is reasonable to call this method after <anObj> has been displayed. Otherwise, Compute() method should pass Graphic3d_AspectFillArea3d aspect from <myDrawer> to Graphic3d_Group to make polygon offsets work. //! <aMode> parameter can contain various combinations of Aspect_PolygonOffsetMode enumeration elements (Aspect_POM_None means that polygon offsets are not changed). If <aMode> is different from Aspect_POM_Off and Aspect_POM_None, then <aFactor> and <aUnits> arguments are used by graphic renderer to calculate a depth offset value: //! offset = <aFactor> * m + <aUnits> * r, where m - maximum depth slope for the polygon currently being displayed, r - minimum window coordinates depth resolution (implementation-specific). //! Deafult settings for OCC 3D viewer: mode = Aspect_POM_Fill, factor = 1., units = 0. //! Negative offset values move polygons closer to the viewport, while positive values shift polygons away. Consult OpenGL reference for details (glPolygonOffset function description). //! NOTE: This method has a side effect - it creates own shading aspect if not yet created, so it is better to set up object material, color, etc. first.

	:param aMode:
	:type aMode: int
	:param aFactor: default value is 1.0
	:type aFactor: Standard_ShortReal
	:param aUnits: default value is 0.0
	:type aUnits: Standard_ShortReal
	:rtype: void
") SetPolygonOffsets;
		virtual void SetPolygonOffsets (const Standard_Integer aMode,const Standard_ShortReal aFactor = 1.0,const Standard_ShortReal aUnits = 0.0);
		%feature("compactdefaultargs") HasPolygonOffsets;
		%feature("autodoc", "	* Returns Standard_True if <myDrawer> has non-null shading aspect

	:rtype: bool
") HasPolygonOffsets;
		virtual Standard_Boolean HasPolygonOffsets ();
		%feature("compactdefaultargs") PolygonOffsets;
		%feature("autodoc", "	* Retrieves current polygon offsets settings from <myDrawer>.

	:param aMode:
	:type aMode: int &
	:param aFactor:
	:type aFactor: Standard_ShortReal &
	:param aUnits:
	:type aUnits: Standard_ShortReal &
	:rtype: void
") PolygonOffsets;
		virtual void PolygonOffsets (Standard_Integer &OutValue,Standard_ShortReal & aFactor,Standard_ShortReal & aUnits);
		%feature("compactdefaultargs") BoundingBox;
		%feature("autodoc", "	* Returns bounding box of object correspondingly to its current display mode.

	:param theBndBox:
	:type theBndBox: Bnd_Box &
	:rtype: void
") BoundingBox;
		virtual void BoundingBox (Bnd_Box & theBndBox);
};


%extend AIS_InteractiveObject {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_AIS_InteractiveObject(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_AIS_InteractiveObject::Handle_AIS_InteractiveObject %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_AIS_InteractiveObject;
class Handle_AIS_InteractiveObject : public Handle_SelectMgr_SelectableObject {

    public:
        // constructors
        Handle_AIS_InteractiveObject();
        Handle_AIS_InteractiveObject(const Handle_AIS_InteractiveObject &aHandle);
        Handle_AIS_InteractiveObject(const AIS_InteractiveObject *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_AIS_InteractiveObject DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_AIS_InteractiveObject {
    AIS_InteractiveObject* _get_reference() {
    return (AIS_InteractiveObject*)$self->Access();
    }
};

%extend Handle_AIS_InteractiveObject {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend AIS_InteractiveObject {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor AIS_ListIteratorOfListOfInteractive;
class AIS_ListIteratorOfListOfInteractive {
	public:
		%feature("compactdefaultargs") AIS_ListIteratorOfListOfInteractive;
		%feature("autodoc", "	:rtype: None
") AIS_ListIteratorOfListOfInteractive;
		 AIS_ListIteratorOfListOfInteractive ();
		%feature("compactdefaultargs") AIS_ListIteratorOfListOfInteractive;
		%feature("autodoc", "	:param L:
	:type L: AIS_ListOfInteractive &
	:rtype: None
") AIS_ListIteratorOfListOfInteractive;
		 AIS_ListIteratorOfListOfInteractive (const AIS_ListOfInteractive & L);
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "	:param L:
	:type L: AIS_ListOfInteractive &
	:rtype: None
") Initialize;
		void Initialize (const AIS_ListOfInteractive & L);
		%feature("compactdefaultargs") More;
		%feature("autodoc", "	:rtype: bool
") More;
		Standard_Boolean More ();
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "	:rtype: None
") Next;
		void Next ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: Handle_AIS_InteractiveObject
") Value;
		Handle_AIS_InteractiveObject Value ();
};


%extend AIS_ListIteratorOfListOfInteractive {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor AIS_ListNodeOfListOfInteractive;
class AIS_ListNodeOfListOfInteractive : public TCollection_MapNode {
	public:
		%feature("compactdefaultargs") AIS_ListNodeOfListOfInteractive;
		%feature("autodoc", "	:param I:
	:type I: Handle_AIS_InteractiveObject &
	:param n:
	:type n: TCollection_MapNodePtr &
	:rtype: None
") AIS_ListNodeOfListOfInteractive;
		 AIS_ListNodeOfListOfInteractive (const Handle_AIS_InteractiveObject & I,const TCollection_MapNodePtr & n);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: Handle_AIS_InteractiveObject
") Value;
		Handle_AIS_InteractiveObject Value ();
};


%extend AIS_ListNodeOfListOfInteractive {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_AIS_ListNodeOfListOfInteractive(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_AIS_ListNodeOfListOfInteractive::Handle_AIS_ListNodeOfListOfInteractive %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_AIS_ListNodeOfListOfInteractive;
class Handle_AIS_ListNodeOfListOfInteractive : public Handle_TCollection_MapNode {

    public:
        // constructors
        Handle_AIS_ListNodeOfListOfInteractive();
        Handle_AIS_ListNodeOfListOfInteractive(const Handle_AIS_ListNodeOfListOfInteractive &aHandle);
        Handle_AIS_ListNodeOfListOfInteractive(const AIS_ListNodeOfListOfInteractive *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_AIS_ListNodeOfListOfInteractive DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_AIS_ListNodeOfListOfInteractive {
    AIS_ListNodeOfListOfInteractive* _get_reference() {
    return (AIS_ListNodeOfListOfInteractive*)$self->Access();
    }
};

%extend Handle_AIS_ListNodeOfListOfInteractive {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend AIS_ListNodeOfListOfInteractive {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor AIS_ListOfInteractive;
class AIS_ListOfInteractive {
	public:
		%feature("compactdefaultargs") AIS_ListOfInteractive;
		%feature("autodoc", "	:rtype: None
") AIS_ListOfInteractive;
		 AIS_ListOfInteractive ();
		%feature("compactdefaultargs") AIS_ListOfInteractive;
		%feature("autodoc", "	:param Other:
	:type Other: AIS_ListOfInteractive &
	:rtype: None
") AIS_ListOfInteractive;
		 AIS_ListOfInteractive (const AIS_ListOfInteractive & Other);
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: AIS_ListOfInteractive &
	:rtype: None
") Assign;
		void Assign (const AIS_ListOfInteractive & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: AIS_ListOfInteractive &
	:rtype: None
") operator =;
		void operator = (const AIS_ListOfInteractive & Other);
		%feature("compactdefaultargs") Extent;
		%feature("autodoc", "	:rtype: int
") Extent;
		Standard_Integer Extent ();
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "	:rtype: bool
") IsEmpty;
		Standard_Boolean IsEmpty ();
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param I:
	:type I: Handle_AIS_InteractiveObject &
	:rtype: None
") Prepend;
		void Prepend (const Handle_AIS_InteractiveObject & I);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param I:
	:type I: Handle_AIS_InteractiveObject &
	:param theIt:
	:type theIt: AIS_ListIteratorOfListOfInteractive &
	:rtype: None
") Prepend;
		void Prepend (const Handle_AIS_InteractiveObject & I,AIS_ListIteratorOfListOfInteractive & theIt);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param Other:
	:type Other: AIS_ListOfInteractive &
	:rtype: None
") Prepend;
		void Prepend (AIS_ListOfInteractive & Other);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param I:
	:type I: Handle_AIS_InteractiveObject &
	:rtype: None
") Append;
		void Append (const Handle_AIS_InteractiveObject & I);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param I:
	:type I: Handle_AIS_InteractiveObject &
	:param theIt:
	:type theIt: AIS_ListIteratorOfListOfInteractive &
	:rtype: None
") Append;
		void Append (const Handle_AIS_InteractiveObject & I,AIS_ListIteratorOfListOfInteractive & theIt);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param Other:
	:type Other: AIS_ListOfInteractive &
	:rtype: None
") Append;
		void Append (AIS_ListOfInteractive & Other);
		%feature("compactdefaultargs") First;
		%feature("autodoc", "	:rtype: Handle_AIS_InteractiveObject
") First;
		Handle_AIS_InteractiveObject First ();
		%feature("compactdefaultargs") Last;
		%feature("autodoc", "	:rtype: Handle_AIS_InteractiveObject
") Last;
		Handle_AIS_InteractiveObject Last ();
		%feature("compactdefaultargs") RemoveFirst;
		%feature("autodoc", "	:rtype: None
") RemoveFirst;
		void RemoveFirst ();
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	:param It:
	:type It: AIS_ListIteratorOfListOfInteractive &
	:rtype: None
") Remove;
		void Remove (AIS_ListIteratorOfListOfInteractive & It);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param I:
	:type I: Handle_AIS_InteractiveObject &
	:param It:
	:type It: AIS_ListIteratorOfListOfInteractive &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Handle_AIS_InteractiveObject & I,AIS_ListIteratorOfListOfInteractive & It);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Other:
	:type Other: AIS_ListOfInteractive &
	:param It:
	:type It: AIS_ListIteratorOfListOfInteractive &
	:rtype: None
") InsertBefore;
		void InsertBefore (AIS_ListOfInteractive & Other,AIS_ListIteratorOfListOfInteractive & It);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param I:
	:type I: Handle_AIS_InteractiveObject &
	:param It:
	:type It: AIS_ListIteratorOfListOfInteractive &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Handle_AIS_InteractiveObject & I,AIS_ListIteratorOfListOfInteractive & It);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Other:
	:type Other: AIS_ListOfInteractive &
	:param It:
	:type It: AIS_ListIteratorOfListOfInteractive &
	:rtype: None
") InsertAfter;
		void InsertAfter (AIS_ListOfInteractive & Other,AIS_ListIteratorOfListOfInteractive & It);
};


%extend AIS_ListOfInteractive {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor AIS_LocalContext;
class AIS_LocalContext : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") AIS_LocalContext;
		%feature("autodoc", "	:rtype: None
") AIS_LocalContext;
		 AIS_LocalContext ();
		%feature("compactdefaultargs") AIS_LocalContext;
		%feature("autodoc", "	* Constructor By Default, the displayed objects are automatically loaded.

	:param aCtx:
	:type aCtx: Handle_AIS_InteractiveContext &
	:param anIndex:
	:type anIndex: int
	:param LoadDisplayed: default value is Standard_True
	:type LoadDisplayed: bool
	:param AcceptStandardModes: default value is Standard_True
	:type AcceptStandardModes: bool
	:param AcceptErase: default value is Standard_False
	:type AcceptErase: bool
	:param UseBothViewers: default value is Standard_False
	:type UseBothViewers: bool
	:rtype: None
") AIS_LocalContext;
		 AIS_LocalContext (const Handle_AIS_InteractiveContext & aCtx,const Standard_Integer anIndex,const Standard_Boolean LoadDisplayed = Standard_True,const Standard_Boolean AcceptStandardModes = Standard_True,const Standard_Boolean AcceptErase = Standard_False,const Standard_Boolean UseBothViewers = Standard_False);
		%feature("compactdefaultargs") AcceptErase;
		%feature("autodoc", "	* authorize or not others contexts to erase temporary displayed objects here;

	:param aStatus:
	:type aStatus: bool
	:rtype: None
") AcceptErase;
		void AcceptErase (const Standard_Boolean aStatus);
		%feature("compactdefaultargs") AcceptErase;
		%feature("autodoc", "	:rtype: bool
") AcceptErase;
		Standard_Boolean AcceptErase ();
		%feature("compactdefaultargs") SetContext;
		%feature("autodoc", "	:param aCtx:
	:type aCtx: Handle_AIS_InteractiveContext &
	:rtype: None
") SetContext;
		void SetContext (const Handle_AIS_InteractiveContext & aCtx);
		%feature("compactdefaultargs") SelectionName;
		%feature("autodoc", "	:rtype: TCollection_AsciiString
") SelectionName;
		const TCollection_AsciiString & SelectionName ();
		%feature("compactdefaultargs") Terminate;
		%feature("autodoc", "	:param updateviewer: default value is Standard_True
	:type updateviewer: bool
	:rtype: None
") Terminate;
		void Terminate (const Standard_Boolean updateviewer = Standard_True);
		%feature("compactdefaultargs") Display;
		%feature("autodoc", "	* returns true if done...

	:param anInteractive:
	:type anInteractive: Handle_AIS_InteractiveObject &
	:param DisplayMode: default value is 0
	:type DisplayMode: int
	:param AllowShapeDecomposition: default value is Standard_True
	:type AllowShapeDecomposition: bool
	:param ActivationMode: default value is 0
	:type ActivationMode: int
	:rtype: bool
") Display;
		Standard_Boolean Display (const Handle_AIS_InteractiveObject & anInteractive,const Standard_Integer DisplayMode = 0,const Standard_Boolean AllowShapeDecomposition = Standard_True,const Standard_Integer ActivationMode = 0);
		%feature("compactdefaultargs") Load;
		%feature("autodoc", "	* loads <anInteractive> with nodisplay... returns true if done

	:param anInteractive:
	:type anInteractive: Handle_AIS_InteractiveObject &
	:param AllowShapeDecomposition: default value is Standard_True
	:type AllowShapeDecomposition: bool
	:param ActivationMode: default value is 0
	:type ActivationMode: int
	:rtype: bool
") Load;
		Standard_Boolean Load (const Handle_AIS_InteractiveObject & anInteractive,const Standard_Boolean AllowShapeDecomposition = Standard_True,const Standard_Integer ActivationMode = 0);
		%feature("compactdefaultargs") Erase;
		%feature("autodoc", "	* returns true if done...

	:param anInteractive:
	:type anInteractive: Handle_AIS_InteractiveObject &
	:rtype: bool
") Erase;
		Standard_Boolean Erase (const Handle_AIS_InteractiveObject & anInteractive);
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	:param aSelectable:
	:type aSelectable: Handle_AIS_InteractiveObject &
	:rtype: bool
") Remove;
		Standard_Boolean Remove (const Handle_AIS_InteractiveObject & aSelectable);
		%feature("compactdefaultargs") ClearPrs;
		%feature("autodoc", "	:param anInteractive:
	:type anInteractive: Handle_AIS_InteractiveObject &
	:param aMode:
	:type aMode: int
	:rtype: bool
") ClearPrs;
		Standard_Boolean ClearPrs (const Handle_AIS_InteractiveObject & anInteractive,const Standard_Integer aMode);
		%feature("compactdefaultargs") SetShapeDecomposition;
		%feature("autodoc", "	* allows or forbids the shape decomposition into Activated Standard Mode for <aStoredObject> does nothing if the object doesn't inherits BasicShape from AIS

	:param aStoredObject:
	:type aStoredObject: Handle_AIS_InteractiveObject &
	:param aStatus:
	:type aStatus: bool
	:rtype: None
") SetShapeDecomposition;
		void SetShapeDecomposition (const Handle_AIS_InteractiveObject & aStoredObject,const Standard_Boolean aStatus);
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	* according to <atype> , clears the different parts of the selector (filters, modeof activation, objects...)

	:param atype: default value is AIS_CM_All
	:type atype: AIS_ClearMode
	:rtype: None
") Clear;
		void Clear (const AIS_ClearMode atype = AIS_CM_All);
		%feature("compactdefaultargs") ActivateMode;
		%feature("autodoc", "	* optional : activation of a mode which is not 0 for a selectable...

	:param aSelectable:
	:type aSelectable: Handle_AIS_InteractiveObject &
	:param aMode:
	:type aMode: int
	:rtype: None
") ActivateMode;
		void ActivateMode (const Handle_AIS_InteractiveObject & aSelectable,const Standard_Integer aMode);
		%feature("compactdefaultargs") DeactivateMode;
		%feature("autodoc", "	:param aSelectable:
	:type aSelectable: Handle_AIS_InteractiveObject &
	:param aMode:
	:type aMode: int
	:rtype: None
") DeactivateMode;
		void DeactivateMode (const Handle_AIS_InteractiveObject & aSelectable,const Standard_Integer aMode);
		%feature("compactdefaultargs") Deactivate;
		%feature("autodoc", "	:param aSelectable:
	:type aSelectable: Handle_AIS_InteractiveObject &
	:rtype: None
") Deactivate;
		void Deactivate (const Handle_AIS_InteractiveObject & aSelectable);
		%feature("compactdefaultargs") ActivateStandardMode;
		%feature("autodoc", "	* decomposition of shapes into <aType>

	:param aType:
	:type aType: TopAbs_ShapeEnum
	:rtype: None
") ActivateStandardMode;
		void ActivateStandardMode (const TopAbs_ShapeEnum aType);
		%feature("compactdefaultargs") DeactivateStandardMode;
		%feature("autodoc", "	:param aType:
	:type aType: TopAbs_ShapeEnum
	:rtype: None
") DeactivateStandardMode;
		void DeactivateStandardMode (const TopAbs_ShapeEnum aType);
		%feature("compactdefaultargs") StandardModes;
		%feature("autodoc", "	:rtype: TColStd_ListOfInteger
") StandardModes;
		const TColStd_ListOfInteger & StandardModes ();
		%feature("compactdefaultargs") AddFilter;
		%feature("autodoc", "	:param aFilter:
	:type aFilter: Handle_SelectMgr_Filter &
	:rtype: None
") AddFilter;
		void AddFilter (const Handle_SelectMgr_Filter & aFilter);
		%feature("compactdefaultargs") RemoveFilter;
		%feature("autodoc", "	:param aFilter:
	:type aFilter: Handle_SelectMgr_Filter &
	:rtype: None
") RemoveFilter;
		void RemoveFilter (const Handle_SelectMgr_Filter & aFilter);
		%feature("compactdefaultargs") ListOfFilter;
		%feature("autodoc", "	:rtype: SelectMgr_ListOfFilter
") ListOfFilter;
		const SelectMgr_ListOfFilter & ListOfFilter ();
		%feature("compactdefaultargs") Filter;
		%feature("autodoc", "	:rtype: Handle_SelectMgr_OrFilter
") Filter;
		Handle_SelectMgr_OrFilter Filter ();
		%feature("compactdefaultargs") SetAutomaticHilight;
		%feature("autodoc", "	* if <aStatus> = True , the shapes or subshapes detected by the selector will be automatically hilighted in the main viewer. Else the user has to manage the detected shape outside the Shape Selector....

	:param aStatus:
	:type aStatus: bool
	:rtype: None
") SetAutomaticHilight;
		void SetAutomaticHilight (const Standard_Boolean aStatus);
		%feature("compactdefaultargs") AutomaticHilight;
		%feature("autodoc", "	:rtype: bool
") AutomaticHilight;
		Standard_Boolean AutomaticHilight ();
		%feature("compactdefaultargs") MoveTo;
		%feature("autodoc", "	:param theXpix:
	:type theXpix: int
	:param theYpix:
	:type theYpix: int
	:param theView:
	:type theView: Handle_V3d_View &
	:param theToRedrawImmediate:
	:type theToRedrawImmediate: bool
	:rtype: AIS_StatusOfDetection
") MoveTo;
		AIS_StatusOfDetection MoveTo (const Standard_Integer theXpix,const Standard_Integer theYpix,const Handle_V3d_View & theView,const Standard_Boolean theToRedrawImmediate);
		%feature("compactdefaultargs") HasNextDetected;
		%feature("autodoc", "	* returns True if more than one entity was detected at the last Mouse position.

	:rtype: bool
") HasNextDetected;
		Standard_Boolean HasNextDetected ();
		%feature("compactdefaultargs") HilightNextDetected;
		%feature("autodoc", "	* returns True if last detected. the next detected will be first one (endless loop)

	:param theView:
	:type theView: Handle_V3d_View &
	:param theToRedrawImmediate:
	:type theToRedrawImmediate: bool
	:rtype: int
") HilightNextDetected;
		Standard_Integer HilightNextDetected (const Handle_V3d_View & theView,const Standard_Boolean theToRedrawImmediate);
		%feature("compactdefaultargs") HilightPreviousDetected;
		%feature("autodoc", "	:param theView:
	:type theView: Handle_V3d_View &
	:param theToRedrawImmediate:
	:type theToRedrawImmediate: bool
	:rtype: int
") HilightPreviousDetected;
		Standard_Integer HilightPreviousDetected (const Handle_V3d_View & theView,const Standard_Boolean theToRedrawImmediate);
		%feature("compactdefaultargs") UnhilightLastDetected;
		%feature("autodoc", "	* returns True if something was done...

	:param aView:
	:type aView: Handle_V3d_View &
	:rtype: bool
") UnhilightLastDetected;
		Standard_Boolean UnhilightLastDetected (const Handle_V3d_View & aView);
		%feature("compactdefaultargs") Select;
		%feature("autodoc", "	* returns the number of selected

	:param updateviewer: default value is Standard_True
	:type updateviewer: bool
	:rtype: AIS_StatusOfPick
") Select;
		AIS_StatusOfPick Select (const Standard_Boolean updateviewer = Standard_True);
		%feature("compactdefaultargs") ShiftSelect;
		%feature("autodoc", "	:param updateviewer: default value is Standard_True
	:type updateviewer: bool
	:rtype: AIS_StatusOfPick
") ShiftSelect;
		AIS_StatusOfPick ShiftSelect (const Standard_Boolean updateviewer = Standard_True);
		%feature("compactdefaultargs") Select;
		%feature("autodoc", "	:param XPMin:
	:type XPMin: int
	:param YPMin:
	:type YPMin: int
	:param XPMax:
	:type XPMax: int
	:param YPMax:
	:type YPMax: int
	:param aView:
	:type aView: Handle_V3d_View &
	:param updateviewer: default value is Standard_True
	:type updateviewer: bool
	:rtype: AIS_StatusOfPick
") Select;
		AIS_StatusOfPick Select (const Standard_Integer XPMin,const Standard_Integer YPMin,const Standard_Integer XPMax,const Standard_Integer YPMax,const Handle_V3d_View & aView,const Standard_Boolean updateviewer = Standard_True);
		%feature("compactdefaultargs") ShiftSelect;
		%feature("autodoc", "	:param XPMin:
	:type XPMin: int
	:param YPMin:
	:type YPMin: int
	:param XPMax:
	:type XPMax: int
	:param YPMax:
	:type YPMax: int
	:param aView:
	:type aView: Handle_V3d_View &
	:param updateviewer: default value is Standard_True
	:type updateviewer: bool
	:rtype: AIS_StatusOfPick
") ShiftSelect;
		AIS_StatusOfPick ShiftSelect (const Standard_Integer XPMin,const Standard_Integer YPMin,const Standard_Integer XPMax,const Standard_Integer YPMax,const Handle_V3d_View & aView,const Standard_Boolean updateviewer = Standard_True);
		%feature("compactdefaultargs") Select;
		%feature("autodoc", "	:param Polyline:
	:type Polyline: TColgp_Array1OfPnt2d
	:param aView:
	:type aView: Handle_V3d_View &
	:param updateviewer: default value is Standard_True
	:type updateviewer: bool
	:rtype: AIS_StatusOfPick
") Select;
		AIS_StatusOfPick Select (const TColgp_Array1OfPnt2d & Polyline,const Handle_V3d_View & aView,const Standard_Boolean updateviewer = Standard_True);
		%feature("compactdefaultargs") ShiftSelect;
		%feature("autodoc", "	:param Polyline:
	:type Polyline: TColgp_Array1OfPnt2d
	:param aView:
	:type aView: Handle_V3d_View &
	:param updateviewer: default value is Standard_True
	:type updateviewer: bool
	:rtype: AIS_StatusOfPick
") ShiftSelect;
		AIS_StatusOfPick ShiftSelect (const TColgp_Array1OfPnt2d & Polyline,const Handle_V3d_View & aView,const Standard_Boolean updateviewer = Standard_True);
		%feature("compactdefaultargs") HilightPicked;
		%feature("autodoc", "	:param updateviewer: default value is Standard_True
	:type updateviewer: bool
	:rtype: None
") HilightPicked;
		void HilightPicked (const Standard_Boolean updateviewer = Standard_True);
		%feature("compactdefaultargs") UnhilightPicked;
		%feature("autodoc", "	:param updateviewer: default value is Standard_True
	:type updateviewer: bool
	:rtype: None
") UnhilightPicked;
		void UnhilightPicked (const Standard_Boolean updateviewer = Standard_True);
		%feature("compactdefaultargs") UpdateSelected;
		%feature("autodoc", "	:param updateviewer: default value is Standard_True
	:type updateviewer: bool
	:rtype: None
") UpdateSelected;
		void UpdateSelected (const Standard_Boolean updateviewer = Standard_True);
		%feature("compactdefaultargs") UpdateSelected;
		%feature("autodoc", "	* Part of advanced selection highlighting mechanism. If no owners belonging to anobj are selected, calls anobj->ClearSelected(), otherwise calls anobj->HilightSelected(). This method can be used to avoid redrawing the whole selection belonging to several Selectable Objects.

	:param anobj:
	:type anobj: Handle_AIS_InteractiveObject &
	:param updateviewer: default value is Standard_True
	:type updateviewer: bool
	:rtype: None
") UpdateSelected;
		void UpdateSelected (const Handle_AIS_InteractiveObject & anobj,const Standard_Boolean updateviewer = Standard_True);
		%feature("compactdefaultargs") SetSelected;
		%feature("autodoc", "	* useful to update selection with objects coming from Collector or stack

	:param anobj:
	:type anobj: Handle_AIS_InteractiveObject &
	:param updateviewer: default value is Standard_True
	:type updateviewer: bool
	:rtype: None
") SetSelected;
		void SetSelected (const Handle_AIS_InteractiveObject & anobj,const Standard_Boolean updateviewer = Standard_True);
		%feature("compactdefaultargs") AddOrRemoveSelected;
		%feature("autodoc", "	* useful to update selection with objects coming from Collector or stack

	:param anobj:
	:type anobj: Handle_AIS_InteractiveObject &
	:param updateviewer: default value is Standard_True
	:type updateviewer: bool
	:rtype: None
") AddOrRemoveSelected;
		void AddOrRemoveSelected (const Handle_AIS_InteractiveObject & anobj,const Standard_Boolean updateviewer = Standard_True);
		%feature("compactdefaultargs") AddOrRemoveSelected;
		%feature("autodoc", "	:param aShape:
	:type aShape: TopoDS_Shape &
	:param updateviewer: default value is Standard_True
	:type updateviewer: bool
	:rtype: None
") AddOrRemoveSelected;
		void AddOrRemoveSelected (const TopoDS_Shape & aShape,const Standard_Boolean updateviewer = Standard_True);
		%feature("compactdefaultargs") AddOrRemoveSelected;
		%feature("autodoc", "	:param theOwner:
	:type theOwner: Handle_SelectMgr_EntityOwner &
	:param toUpdateViewer: default value is Standard_True
	:type toUpdateViewer: bool
	:rtype: None
") AddOrRemoveSelected;
		void AddOrRemoveSelected (const Handle_SelectMgr_EntityOwner & theOwner,const Standard_Boolean toUpdateViewer = Standard_True);
		%feature("compactdefaultargs") ClearSelected;
		%feature("autodoc", "	* Clears local context selection. @param toUpdateViewer [in] if True the viewer will be updated.

	:param toUpdateViewer: default value is Standard_True
	:type toUpdateViewer: bool
	:rtype: None
") ClearSelected;
		void ClearSelected (const Standard_Boolean toUpdateViewer = Standard_True);
		%feature("compactdefaultargs") ClearOutdatedSelection;
		%feature("autodoc", "	* Clears outdated selection and detection of owners for the interactive object. Use this method if selection structures of the interactive object have changed. The method unhilights and removes outdated entity owners from lists of selected and detected owners. @param theIO [in] the interactive object. @param toClearDeactivated [in] pass True to treat deactivated entity owners as 'outdated' when clearing the selection.

	:param theIO:
	:type theIO: Handle_AIS_InteractiveObject &
	:param toClearDeactivated:
	:type toClearDeactivated: bool
	:rtype: None
") ClearOutdatedSelection;
		void ClearOutdatedSelection (const Handle_AIS_InteractiveObject & theIO,const Standard_Boolean toClearDeactivated);
		%feature("compactdefaultargs") HasDetected;
		%feature("autodoc", "	:rtype: bool
") HasDetected;
		Standard_Boolean HasDetected ();
		%feature("compactdefaultargs") InitDetected;
		%feature("autodoc", "	* Initialization for iteration through mouse-detected objects in local context.

	:rtype: None
") InitDetected;
		void InitDetected ();
		%feature("compactdefaultargs") MoreDetected;
		%feature("autodoc", "	* returns true if there is more mouse-detected objects after the current one during iteration through mouse-detected interactive objects.

	:rtype: bool
") MoreDetected;
		Standard_Boolean MoreDetected ();
		%feature("compactdefaultargs") NextDetected;
		%feature("autodoc", "	* Gets next current object during iteration through mouse-detected interactive objects.

	:rtype: None
") NextDetected;
		void NextDetected ();
		%feature("compactdefaultargs") DetectedCurrentShape;
		%feature("autodoc", "	* returns current mouse-detected shape or empty (null) shape, if current interactive object is not a shape (AIS_Shape) or there is no current mouse-detected interactive object at all.

	:rtype: TopoDS_Shape
") DetectedCurrentShape;
		const TopoDS_Shape  DetectedCurrentShape ();
		%feature("compactdefaultargs") DetectedCurrentObject;
		%feature("autodoc", "	* returns current mouse-detected interactive object or null object if there is no current detected.

	:rtype: Handle_AIS_InteractiveObject
") DetectedCurrentObject;
		Handle_AIS_InteractiveObject DetectedCurrentObject ();
		%feature("compactdefaultargs") HasDetectedShape;
		%feature("autodoc", "	:rtype: bool
") HasDetectedShape;
		Standard_Boolean HasDetectedShape ();
		%feature("compactdefaultargs") DetectedShape;
		%feature("autodoc", "	:rtype: TopoDS_Shape
") DetectedShape;
		const TopoDS_Shape  DetectedShape ();
		%feature("compactdefaultargs") DetectedInteractive;
		%feature("autodoc", "	:rtype: Handle_AIS_InteractiveObject
") DetectedInteractive;
		Handle_AIS_InteractiveObject DetectedInteractive ();
		%feature("compactdefaultargs") DetectedOwner;
		%feature("autodoc", "	:rtype: Handle_SelectMgr_EntityOwner
") DetectedOwner;
		Handle_SelectMgr_EntityOwner DetectedOwner ();
		%feature("compactdefaultargs") InitSelected;
		%feature("autodoc", "	:rtype: None
") InitSelected;
		void InitSelected ();
		%feature("compactdefaultargs") MoreSelected;
		%feature("autodoc", "	:rtype: bool
") MoreSelected;
		Standard_Boolean MoreSelected ();
		%feature("compactdefaultargs") NextSelected;
		%feature("autodoc", "	:rtype: None
") NextSelected;
		void NextSelected ();
		%feature("compactdefaultargs") HasShape;
		%feature("autodoc", "	* returns True if the detected entity is a shape coming from a Decomposition of an element.

	:rtype: bool
") HasShape;
		Standard_Boolean HasShape ();
		%feature("compactdefaultargs") HasSelectedShape;
		%feature("autodoc", "	* returns true if current selection is not empty and the owner of selected object contains a shape. This method does not take into account decomposition status of detected shape.

	:rtype: bool
") HasSelectedShape;
		Standard_Boolean HasSelectedShape ();
		%feature("compactdefaultargs") SelectedShape;
		%feature("autodoc", "	:rtype: TopoDS_Shape
") SelectedShape;
		TopoDS_Shape SelectedShape ();
		%feature("compactdefaultargs") SelectedOwner;
		%feature("autodoc", "	:rtype: Handle_SelectMgr_EntityOwner
") SelectedOwner;
		Handle_SelectMgr_EntityOwner SelectedOwner ();
		%feature("compactdefaultargs") IsSelected;
		%feature("autodoc", "	:param aniobj:
	:type aniobj: Handle_AIS_InteractiveObject &
	:rtype: bool
") IsSelected;
		Standard_Boolean IsSelected (const Handle_AIS_InteractiveObject & aniobj);
		%feature("compactdefaultargs") IsSelected;
		%feature("autodoc", "	:param anOwner:
	:type anOwner: Handle_SelectMgr_EntityOwner &
	:rtype: bool
") IsSelected;
		Standard_Boolean IsSelected (const Handle_SelectMgr_EntityOwner & anOwner);
		%feature("compactdefaultargs") SelectedInteractive;
		%feature("autodoc", "	:rtype: Handle_AIS_InteractiveObject
") SelectedInteractive;
		Handle_AIS_InteractiveObject SelectedInteractive ();
		%feature("compactdefaultargs") HasApplicative;
		%feature("autodoc", "	* returns True if an interactive element was associated with the current picked entity.

	:rtype: bool
") HasApplicative;
		Standard_Boolean HasApplicative ();
		%feature("compactdefaultargs") SelectedApplicative;
		%feature("autodoc", "	:rtype: Handle_Standard_Transient
") SelectedApplicative;
		Handle_Standard_Transient SelectedApplicative ();
		%feature("compactdefaultargs") SetDisplayPriority;
		%feature("autodoc", "	:param anObject:
	:type anObject: Handle_AIS_InteractiveObject &
	:param Prior:
	:type Prior: int
	:rtype: None
") SetDisplayPriority;
		void SetDisplayPriority (const Handle_AIS_InteractiveObject & anObject,const Standard_Integer Prior);
		%feature("compactdefaultargs") DisplayedObjects;
		%feature("autodoc", "	:param theMapToFill:
	:type theMapToFill: TColStd_MapOfTransient &
	:rtype: int
") DisplayedObjects;
		Standard_Integer DisplayedObjects (TColStd_MapOfTransient & theMapToFill);
		%feature("compactdefaultargs") IsIn;
		%feature("autodoc", "	:param anObject:
	:type anObject: Handle_AIS_InteractiveObject &
	:rtype: bool
") IsIn;
		Standard_Boolean IsIn (const Handle_AIS_InteractiveObject & anObject);
		%feature("compactdefaultargs") IsDisplayed;
		%feature("autodoc", "	:param anObject:
	:type anObject: Handle_AIS_InteractiveObject &
	:rtype: bool
") IsDisplayed;
		Standard_Boolean IsDisplayed (const Handle_AIS_InteractiveObject & anObject);
		%feature("compactdefaultargs") IsDisplayed;
		%feature("autodoc", "	:param anObject:
	:type anObject: Handle_AIS_InteractiveObject &
	:param aMode:
	:type aMode: int
	:rtype: bool
") IsDisplayed;
		Standard_Boolean IsDisplayed (const Handle_AIS_InteractiveObject & anObject,const Standard_Integer aMode);
		%feature("compactdefaultargs") SelectionModes;
		%feature("autodoc", "	:param anObject:
	:type anObject: Handle_AIS_InteractiveObject &
	:rtype: TColStd_ListOfInteger
") SelectionModes;
		const TColStd_ListOfInteger & SelectionModes (const Handle_AIS_InteractiveObject & anObject);
		%feature("compactdefaultargs") SubIntensityOn;
		%feature("autodoc", "	:param anObject:
	:type anObject: Handle_AIS_InteractiveObject &
	:rtype: None
") SubIntensityOn;
		void SubIntensityOn (const Handle_AIS_InteractiveObject & anObject);
		%feature("compactdefaultargs") SubIntensityOff;
		%feature("autodoc", "	:param anObject:
	:type anObject: Handle_AIS_InteractiveObject &
	:rtype: None
") SubIntensityOff;
		void SubIntensityOff (const Handle_AIS_InteractiveObject & anObject);
		%feature("compactdefaultargs") Hilight;
		%feature("autodoc", "	:param anObject:
	:type anObject: Handle_AIS_InteractiveObject &
	:rtype: None
") Hilight;
		void Hilight (const Handle_AIS_InteractiveObject & anObject);
		%feature("compactdefaultargs") Hilight;
		%feature("autodoc", "	:param anObject:
	:type anObject: Handle_AIS_InteractiveObject &
	:param aCol:
	:type aCol: Quantity_NameOfColor
	:rtype: None
") Hilight;
		void Hilight (const Handle_AIS_InteractiveObject & anObject,const Quantity_NameOfColor aCol);
		%feature("compactdefaultargs") Unhilight;
		%feature("autodoc", "	:param anObject:
	:type anObject: Handle_AIS_InteractiveObject &
	:rtype: None
") Unhilight;
		void Unhilight (const Handle_AIS_InteractiveObject & anObject);
		%feature("compactdefaultargs") IsHilighted;
		%feature("autodoc", "	:param anObject:
	:type anObject: Handle_AIS_InteractiveObject &
	:rtype: bool
") IsHilighted;
		Standard_Boolean IsHilighted (const Handle_AIS_InteractiveObject & anObject);
		%feature("compactdefaultargs") IsHilighted;
		%feature("autodoc", "	:param anObject:
	:type anObject: Handle_AIS_InteractiveObject &
	:param WithColor:
	:type WithColor: bool
	:param HiCol:
	:type HiCol: Quantity_NameOfColor &
	:rtype: bool
") IsHilighted;
		Standard_Boolean IsHilighted (const Handle_AIS_InteractiveObject & anObject,Standard_Boolean &OutValue,Quantity_NameOfColor & HiCol);
		%feature("compactdefaultargs") SetPixelTolerance;
		%feature("autodoc", "	* Define the current selection sensitivity for this local context according to the view size.

	:param aPrecision: default value is 2
	:type aPrecision: int
	:rtype: None
") SetPixelTolerance;
		void SetPixelTolerance (const Standard_Integer aPrecision = 2);
		%feature("compactdefaultargs") PixelTolerance;
		%feature("autodoc", "	* Returns the pixel tolerance.

	:rtype: int
") PixelTolerance;
		Standard_Integer PixelTolerance ();
		%feature("compactdefaultargs") SetSelectionSensitivity;
		%feature("autodoc", "	* Allows to manage sensitivity of a particular selection of interactive object theObject and changes previous sensitivity value of all sensitive entities in selection with theMode to the given theNewSensitivity.

	:param theObject:
	:type theObject: Handle_AIS_InteractiveObject &
	:param theMode:
	:type theMode: int
	:param theNewSensitivity:
	:type theNewSensitivity: int
	:rtype: None
") SetSelectionSensitivity;
		void SetSelectionSensitivity (const Handle_AIS_InteractiveObject & theObject,const Standard_Integer theMode,const Standard_Integer theNewSensitivity);
		%feature("compactdefaultargs") BeginImmediateDraw;
		%feature("autodoc", "	* Resets the transient list of presentations previously displayed in immediate mode and begins accumulation of new list by following AddToImmediateList()/Color()/Highlight() calls.

	:rtype: bool
") BeginImmediateDraw;
		Standard_Boolean BeginImmediateDraw ();
		%feature("compactdefaultargs") ClearImmediateDraw;
		%feature("autodoc", "	* Resets the transient list of presentations previously displayed in immediate mode.

	:rtype: void
") ClearImmediateDraw;
		virtual void ClearImmediateDraw ();
		%feature("compactdefaultargs") ImmediateAdd;
		%feature("autodoc", "	* Stores presentation theMode of object theObj in the transient list of presentations to be displayed in immediate mode. Will be taken in account in EndImmediateDraw method.

	:param theObj:
	:type theObj: Handle_AIS_InteractiveObject &
	:param theMode: default value is 0
	:type theMode: int
	:rtype: bool
") ImmediateAdd;
		Standard_Boolean ImmediateAdd (const Handle_AIS_InteractiveObject & theObj,const Standard_Integer theMode = 0);
		%feature("compactdefaultargs") EndImmediateDraw;
		%feature("autodoc", "	* Allows rapid drawing of the view theView by avoiding an update of the whole background.

	:param theView:
	:type theView: Handle_V3d_View &
	:rtype: bool
") EndImmediateDraw;
		Standard_Boolean EndImmediateDraw (const Handle_V3d_View & theView);
		%feature("compactdefaultargs") IsImmediateModeOn;
		%feature("autodoc", "	* Returns true if Presentation Manager is accumulating transient list of presentations to be displayed in immediate mode.

	:rtype: bool
") IsImmediateModeOn;
		Standard_Boolean IsImmediateModeOn ();
		%feature("compactdefaultargs") LoadContextObjects;
		%feature("autodoc", "	:rtype: None
") LoadContextObjects;
		void LoadContextObjects ();
		%feature("compactdefaultargs") UnloadContextObjects;
		%feature("autodoc", "	:rtype: None
") UnloadContextObjects;
		void UnloadContextObjects ();
		%feature("compactdefaultargs") DisplaySensitive;
		%feature("autodoc", "	:param aView:
	:type aView: Handle_V3d_View &
	:rtype: None
") DisplaySensitive;
		void DisplaySensitive (const Handle_V3d_View & aView);
		%feature("compactdefaultargs") ClearSensitive;
		%feature("autodoc", "	:param aView:
	:type aView: Handle_V3d_View &
	:rtype: None
") ClearSensitive;
		void ClearSensitive (const Handle_V3d_View & aView);
		%feature("compactdefaultargs") MainSelector;
		%feature("autodoc", "	:rtype: Handle_StdSelect_ViewerSelector3d
") MainSelector;
		Handle_StdSelect_ViewerSelector3d MainSelector ();
		%feature("compactdefaultargs") FindSelectedOwnerFromIO;
		%feature("autodoc", "	:param anIObj:
	:type anIObj: Handle_AIS_InteractiveObject &
	:rtype: Handle_SelectMgr_EntityOwner
") FindSelectedOwnerFromIO;
		Handle_SelectMgr_EntityOwner FindSelectedOwnerFromIO (const Handle_AIS_InteractiveObject & anIObj);
		%feature("compactdefaultargs") FindSelectedOwnerFromShape;
		%feature("autodoc", "	:param aShape:
	:type aShape: TopoDS_Shape &
	:rtype: Handle_SelectMgr_EntityOwner
") FindSelectedOwnerFromShape;
		Handle_SelectMgr_EntityOwner FindSelectedOwnerFromShape (const TopoDS_Shape & aShape);
};


%extend AIS_LocalContext {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_AIS_LocalContext(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_AIS_LocalContext::Handle_AIS_LocalContext %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_AIS_LocalContext;
class Handle_AIS_LocalContext : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_AIS_LocalContext();
        Handle_AIS_LocalContext(const Handle_AIS_LocalContext &aHandle);
        Handle_AIS_LocalContext(const AIS_LocalContext *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_AIS_LocalContext DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_AIS_LocalContext {
    AIS_LocalContext* _get_reference() {
    return (AIS_LocalContext*)$self->Access();
    }
};

%extend Handle_AIS_LocalContext {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend AIS_LocalContext {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor AIS_LocalStatus;
class AIS_LocalStatus : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") AIS_LocalStatus;
		%feature("autodoc", "	:param IsTemporary: default value is Standard_True
	:type IsTemporary: bool
	:param Decompose: default value is Standard_False
	:type Decompose: bool
	:param DisplayMode: default value is -1
	:type DisplayMode: int
	:param SelectionMode: default value is -1
	:type SelectionMode: int
	:param HilightMode: default value is 0
	:type HilightMode: int
	:param SubIntensity: default value is 0
	:type SubIntensity: bool
	:param TheHiCol: default value is Quantity_NOC_WHITE
	:type TheHiCol: Quantity_NameOfColor
	:rtype: None
") AIS_LocalStatus;
		 AIS_LocalStatus (const Standard_Boolean IsTemporary = Standard_True,const Standard_Boolean Decompose = Standard_False,const Standard_Integer DisplayMode = -1,const Standard_Integer SelectionMode = -1,const Standard_Integer HilightMode = 0,const Standard_Boolean SubIntensity = 0,const Quantity_NameOfColor TheHiCol = Quantity_NOC_WHITE);
		%feature("compactdefaultargs") Decomposed;
		%feature("autodoc", "	:rtype: bool
") Decomposed;
		Standard_Boolean Decomposed ();
		%feature("compactdefaultargs") IsTemporary;
		%feature("autodoc", "	:rtype: bool
") IsTemporary;
		Standard_Boolean IsTemporary ();
		%feature("compactdefaultargs") DisplayMode;
		%feature("autodoc", "	:rtype: int
") DisplayMode;
		Standard_Integer DisplayMode ();
		%feature("compactdefaultargs") SelectionModes;
		%feature("autodoc", "	:rtype: TColStd_ListOfInteger
") SelectionModes;
		const TColStd_ListOfInteger & SelectionModes ();
		%feature("compactdefaultargs") IsActivated;
		%feature("autodoc", "	:param aSelMode:
	:type aSelMode: int
	:rtype: bool
") IsActivated;
		Standard_Boolean IsActivated (const Standard_Integer aSelMode);
		%feature("compactdefaultargs") HilightMode;
		%feature("autodoc", "	:rtype: int
") HilightMode;
		Standard_Integer HilightMode ();
		%feature("compactdefaultargs") IsSubIntensityOn;
		%feature("autodoc", "	:rtype: bool
") IsSubIntensityOn;
		Standard_Boolean IsSubIntensityOn ();
		%feature("compactdefaultargs") HilightColor;
		%feature("autodoc", "	:rtype: Quantity_NameOfColor
") HilightColor;
		Quantity_NameOfColor HilightColor ();
		%feature("compactdefaultargs") SetDecomposition;
		%feature("autodoc", "	:param astatus:
	:type astatus: bool
	:rtype: None
") SetDecomposition;
		void SetDecomposition (const Standard_Boolean astatus);
		%feature("compactdefaultargs") SetTemporary;
		%feature("autodoc", "	:param astatus:
	:type astatus: bool
	:rtype: None
") SetTemporary;
		void SetTemporary (const Standard_Boolean astatus);
		%feature("compactdefaultargs") SetDisplayMode;
		%feature("autodoc", "	:param aMode:
	:type aMode: int
	:rtype: None
") SetDisplayMode;
		void SetDisplayMode (const Standard_Integer aMode);
		%feature("compactdefaultargs") SetFirstDisplay;
		%feature("autodoc", "	:param aStatus:
	:type aStatus: bool
	:rtype: None
") SetFirstDisplay;
		void SetFirstDisplay (const Standard_Boolean aStatus);
		%feature("compactdefaultargs") IsFirstDisplay;
		%feature("autodoc", "	:rtype: bool
") IsFirstDisplay;
		Standard_Boolean IsFirstDisplay ();
		%feature("compactdefaultargs") AddSelectionMode;
		%feature("autodoc", "	:param aMode:
	:type aMode: int
	:rtype: None
") AddSelectionMode;
		void AddSelectionMode (const Standard_Integer aMode);
		%feature("compactdefaultargs") RemoveSelectionMode;
		%feature("autodoc", "	:param aMode:
	:type aMode: int
	:rtype: None
") RemoveSelectionMode;
		void RemoveSelectionMode (const Standard_Integer aMode);
		%feature("compactdefaultargs") ClearSelectionModes;
		%feature("autodoc", "	:rtype: None
") ClearSelectionModes;
		void ClearSelectionModes ();
		%feature("compactdefaultargs") IsSelModeIn;
		%feature("autodoc", "	:param aMode:
	:type aMode: int
	:rtype: bool
") IsSelModeIn;
		Standard_Boolean IsSelModeIn (const Standard_Integer aMode);
		%feature("compactdefaultargs") SetHilightMode;
		%feature("autodoc", "	:param aMode:
	:type aMode: int
	:rtype: None
") SetHilightMode;
		void SetHilightMode (const Standard_Integer aMode);
		%feature("compactdefaultargs") SetHilightColor;
		%feature("autodoc", "	:param aHiCol:
	:type aHiCol: Quantity_NameOfColor
	:rtype: None
") SetHilightColor;
		void SetHilightColor (const Quantity_NameOfColor aHiCol);
		%feature("compactdefaultargs") SubIntensityOn;
		%feature("autodoc", "	:rtype: None
") SubIntensityOn;
		void SubIntensityOn ();
		%feature("compactdefaultargs") SubIntensityOff;
		%feature("autodoc", "	:rtype: None
") SubIntensityOff;
		void SubIntensityOff ();
		%feature("compactdefaultargs") SetPreviousState;
		%feature("autodoc", "	:param aStatus:
	:type aStatus: Handle_Standard_Transient &
	:rtype: None
") SetPreviousState;
		void SetPreviousState (const Handle_Standard_Transient & aStatus);
		%feature("compactdefaultargs") PreviousState;
		%feature("autodoc", "	:rtype: Handle_Standard_Transient
") PreviousState;
		Handle_Standard_Transient PreviousState ();
};


%extend AIS_LocalStatus {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_AIS_LocalStatus(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_AIS_LocalStatus::Handle_AIS_LocalStatus %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_AIS_LocalStatus;
class Handle_AIS_LocalStatus : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_AIS_LocalStatus();
        Handle_AIS_LocalStatus(const Handle_AIS_LocalStatus &aHandle);
        Handle_AIS_LocalStatus(const AIS_LocalStatus *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_AIS_LocalStatus DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_AIS_LocalStatus {
    AIS_LocalStatus* _get_reference() {
    return (AIS_LocalStatus*)$self->Access();
    }
};

%extend Handle_AIS_LocalStatus {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend AIS_LocalStatus {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor AIS_MapIteratorOfMapOfInteractive;
class AIS_MapIteratorOfMapOfInteractive : public TCollection_BasicMapIterator {
	public:
		%feature("compactdefaultargs") AIS_MapIteratorOfMapOfInteractive;
		%feature("autodoc", "	:rtype: None
") AIS_MapIteratorOfMapOfInteractive;
		 AIS_MapIteratorOfMapOfInteractive ();
		%feature("compactdefaultargs") AIS_MapIteratorOfMapOfInteractive;
		%feature("autodoc", "	:param aMap:
	:type aMap: AIS_MapOfInteractive &
	:rtype: None
") AIS_MapIteratorOfMapOfInteractive;
		 AIS_MapIteratorOfMapOfInteractive (const AIS_MapOfInteractive & aMap);
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "	:param aMap:
	:type aMap: AIS_MapOfInteractive &
	:rtype: None
") Initialize;
		void Initialize (const AIS_MapOfInteractive & aMap);
		%feature("compactdefaultargs") Key;
		%feature("autodoc", "	:rtype: Handle_AIS_InteractiveObject
") Key;
		Handle_AIS_InteractiveObject Key ();
};


%extend AIS_MapIteratorOfMapOfInteractive {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor AIS_MapOfInteractive;
class AIS_MapOfInteractive : public TCollection_BasicMap {
	public:
		%feature("compactdefaultargs") AIS_MapOfInteractive;
		%feature("autodoc", "	:param NbBuckets: default value is 1
	:type NbBuckets: int
	:rtype: None
") AIS_MapOfInteractive;
		 AIS_MapOfInteractive (const Standard_Integer NbBuckets = 1);
		%feature("compactdefaultargs") AIS_MapOfInteractive;
		%feature("autodoc", "	:param Other:
	:type Other: AIS_MapOfInteractive &
	:rtype: None
") AIS_MapOfInteractive;
		 AIS_MapOfInteractive (const AIS_MapOfInteractive & Other);
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: AIS_MapOfInteractive &
	:rtype: AIS_MapOfInteractive
") Assign;
		AIS_MapOfInteractive & Assign (const AIS_MapOfInteractive & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: AIS_MapOfInteractive &
	:rtype: AIS_MapOfInteractive
") operator =;
		AIS_MapOfInteractive & operator = (const AIS_MapOfInteractive & Other);
		%feature("compactdefaultargs") ReSize;
		%feature("autodoc", "	:param NbBuckets:
	:type NbBuckets: int
	:rtype: None
") ReSize;
		void ReSize (const Standard_Integer NbBuckets);
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "	:param aKey:
	:type aKey: Handle_AIS_InteractiveObject &
	:rtype: bool
") Add;
		Standard_Boolean Add (const Handle_AIS_InteractiveObject & aKey);
		%feature("compactdefaultargs") Contains;
		%feature("autodoc", "	:param aKey:
	:type aKey: Handle_AIS_InteractiveObject &
	:rtype: bool
") Contains;
		Standard_Boolean Contains (const Handle_AIS_InteractiveObject & aKey);
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	:param aKey:
	:type aKey: Handle_AIS_InteractiveObject &
	:rtype: bool
") Remove;
		Standard_Boolean Remove (const Handle_AIS_InteractiveObject & aKey);
};


%extend AIS_MapOfInteractive {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor AIS_Selection;
class AIS_Selection : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") AIS_Selection;
		%feature("autodoc", "	* creates a new selection and make it current in the session. the selection will be accessible later through its name to make it again current. //! Note that if a session has been created, a session with the name 'default' is created. //! In this case, the is always a current selection which is the last one created until SetCurrentSelection is used. //! The class methods deals with the current selection. //! Warning : Better Call AIS_Selection::CreateSelection.

	:param aName:
	:type aName: char *
	:rtype: None
") AIS_Selection;
		 AIS_Selection (const char * aName);
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	:param aName:
	:type aName: char *
	:rtype: void
") Remove;
		static void Remove (const char * aName);
		%feature("compactdefaultargs") Find;
		%feature("autodoc", "	* returns True if a selection having this name exsits.

	:param aName:
	:type aName: char *
	:rtype: bool
") Find;
		static Standard_Boolean Find (const char * aName);
		%feature("compactdefaultargs") CreateSelection;
		%feature("autodoc", "	* calls the private constructor and puts the new Selection in the list of existing selections. returns False if the selection exists.

	:param aName:
	:type aName: char *
	:rtype: bool
") CreateSelection;
		static Standard_Boolean CreateSelection (const char * aName);
		%feature("compactdefaultargs") Selection;
		%feature("autodoc", "	:param aName:
	:type aName: char *
	:rtype: Handle_AIS_Selection
") Selection;
		static Handle_AIS_Selection Selection (const char * aName);
		%feature("compactdefaultargs") SetCurrentSelection;
		%feature("autodoc", "	* returns False if There is no selection of name <aName>

	:param aName:
	:type aName: char *
	:rtype: bool
") SetCurrentSelection;
		static Standard_Boolean SetCurrentSelection (const char * aName);
		%feature("compactdefaultargs") CurrentSelection;
		%feature("autodoc", "	:rtype: Handle_AIS_Selection
") CurrentSelection;
		static Handle_AIS_Selection CurrentSelection ();
		%feature("compactdefaultargs") ClearCurrentSelection;
		%feature("autodoc", "	* Clears selection.

	:rtype: void
") ClearCurrentSelection;
		static void ClearCurrentSelection ();
		%feature("compactdefaultargs") Select;
		%feature("autodoc", "	* removes all the object of the currentselection.

	:rtype: void
") Select;
		static void Select ();
		%feature("compactdefaultargs") Select;
		%feature("autodoc", "	* if the object is not yet in the current selection, it will be added. if the object is already in the current selection, it will be removed.

	:param anObject:
	:type anObject: Handle_Standard_Transient &
	:rtype: AIS_SelectStatus
") Select;
		static AIS_SelectStatus Select (const Handle_Standard_Transient & anObject);
		%feature("compactdefaultargs") AddSelect;
		%feature("autodoc", "	* the object is always add int the selection. faster when the number of objects selected is great.

	:param anObject:
	:type anObject: Handle_Standard_Transient &
	:rtype: AIS_SelectStatus
") AddSelect;
		static AIS_SelectStatus AddSelect (const Handle_Standard_Transient & anObject);
		%feature("compactdefaultargs") ClearAndSelect;
		%feature("autodoc", "	* clears the selection and adds the object in the selection.

	:param anObject:
	:type anObject: Handle_Standard_Transient &
	:rtype: void
") ClearAndSelect;
		static void ClearAndSelect (const Handle_Standard_Transient & anObject);
		%feature("compactdefaultargs") IsSelected;
		%feature("autodoc", "	:param anObject:
	:type anObject: Handle_Standard_Transient &
	:rtype: bool
") IsSelected;
		static Standard_Boolean IsSelected (const Handle_Standard_Transient & anObject);
		%feature("compactdefaultargs") Extent;
		%feature("autodoc", "	* returns the number of objects selected.

	:rtype: int
") Extent;
		static Standard_Integer Extent ();
		%feature("compactdefaultargs") Single;
		%feature("autodoc", "	* returns the single object selected. Warning: raises TypeMismatch from Standard if Extent is not equal to 1.

	:rtype: Handle_Standard_Transient
") Single;
		static Handle_Standard_Transient Single ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:rtype: None
") Init;
		void Init ();
		%feature("compactdefaultargs") More;
		%feature("autodoc", "	:rtype: bool
") More;
		Standard_Boolean More ();
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "	:rtype: None
") Next;
		void Next ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: Handle_Standard_Transient
") Value;
		Handle_Standard_Transient Value ();
		%feature("compactdefaultargs") NbStored;
		%feature("autodoc", "	:rtype: int
") NbStored;
		Standard_Integer NbStored ();
		%feature("compactdefaultargs") Objects;
		%feature("autodoc", "	:rtype: AIS_NListTransient
") Objects;
		const AIS_NListTransient & Objects ();
		%feature("compactdefaultargs") Index;
		%feature("autodoc", "	:param aName:
	:type aName: char *
	:rtype: int
") Index;
		static Standard_Integer Index (const char * aName);
};


%extend AIS_Selection {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_AIS_Selection(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_AIS_Selection::Handle_AIS_Selection %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_AIS_Selection;
class Handle_AIS_Selection : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_AIS_Selection();
        Handle_AIS_Selection(const Handle_AIS_Selection &aHandle);
        Handle_AIS_Selection(const AIS_Selection *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_AIS_Selection DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_AIS_Selection {
    AIS_Selection* _get_reference() {
    return (AIS_Selection*)$self->Access();
    }
};

%extend Handle_AIS_Selection {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend AIS_Selection {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor AIS_SequenceNodeOfSequenceOfDimension;
class AIS_SequenceNodeOfSequenceOfDimension : public TCollection_SeqNode {
	public:
		%feature("compactdefaultargs") AIS_SequenceNodeOfSequenceOfDimension;
		%feature("autodoc", "	:param I:
	:type I: Handle_AIS_Relation &
	:param n:
	:type n: TCollection_SeqNodePtr &
	:param p:
	:type p: TCollection_SeqNodePtr &
	:rtype: None
") AIS_SequenceNodeOfSequenceOfDimension;
		 AIS_SequenceNodeOfSequenceOfDimension (const Handle_AIS_Relation & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: Handle_AIS_Relation
") Value;
		Handle_AIS_Relation Value ();
};


%extend AIS_SequenceNodeOfSequenceOfDimension {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_AIS_SequenceNodeOfSequenceOfDimension(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_AIS_SequenceNodeOfSequenceOfDimension::Handle_AIS_SequenceNodeOfSequenceOfDimension %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_AIS_SequenceNodeOfSequenceOfDimension;
class Handle_AIS_SequenceNodeOfSequenceOfDimension : public Handle_TCollection_SeqNode {

    public:
        // constructors
        Handle_AIS_SequenceNodeOfSequenceOfDimension();
        Handle_AIS_SequenceNodeOfSequenceOfDimension(const Handle_AIS_SequenceNodeOfSequenceOfDimension &aHandle);
        Handle_AIS_SequenceNodeOfSequenceOfDimension(const AIS_SequenceNodeOfSequenceOfDimension *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_AIS_SequenceNodeOfSequenceOfDimension DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_AIS_SequenceNodeOfSequenceOfDimension {
    AIS_SequenceNodeOfSequenceOfDimension* _get_reference() {
    return (AIS_SequenceNodeOfSequenceOfDimension*)$self->Access();
    }
};

%extend Handle_AIS_SequenceNodeOfSequenceOfDimension {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend AIS_SequenceNodeOfSequenceOfDimension {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor AIS_SequenceNodeOfSequenceOfInteractive;
class AIS_SequenceNodeOfSequenceOfInteractive : public TCollection_SeqNode {
	public:
		%feature("compactdefaultargs") AIS_SequenceNodeOfSequenceOfInteractive;
		%feature("autodoc", "	:param I:
	:type I: Handle_AIS_InteractiveObject &
	:param n:
	:type n: TCollection_SeqNodePtr &
	:param p:
	:type p: TCollection_SeqNodePtr &
	:rtype: None
") AIS_SequenceNodeOfSequenceOfInteractive;
		 AIS_SequenceNodeOfSequenceOfInteractive (const Handle_AIS_InteractiveObject & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: Handle_AIS_InteractiveObject
") Value;
		Handle_AIS_InteractiveObject Value ();
};


%extend AIS_SequenceNodeOfSequenceOfInteractive {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_AIS_SequenceNodeOfSequenceOfInteractive(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_AIS_SequenceNodeOfSequenceOfInteractive::Handle_AIS_SequenceNodeOfSequenceOfInteractive %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_AIS_SequenceNodeOfSequenceOfInteractive;
class Handle_AIS_SequenceNodeOfSequenceOfInteractive : public Handle_TCollection_SeqNode {

    public:
        // constructors
        Handle_AIS_SequenceNodeOfSequenceOfInteractive();
        Handle_AIS_SequenceNodeOfSequenceOfInteractive(const Handle_AIS_SequenceNodeOfSequenceOfInteractive &aHandle);
        Handle_AIS_SequenceNodeOfSequenceOfInteractive(const AIS_SequenceNodeOfSequenceOfInteractive *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_AIS_SequenceNodeOfSequenceOfInteractive DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_AIS_SequenceNodeOfSequenceOfInteractive {
    AIS_SequenceNodeOfSequenceOfInteractive* _get_reference() {
    return (AIS_SequenceNodeOfSequenceOfInteractive*)$self->Access();
    }
};

%extend Handle_AIS_SequenceNodeOfSequenceOfInteractive {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend AIS_SequenceNodeOfSequenceOfInteractive {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor AIS_SequenceOfDimension;
class AIS_SequenceOfDimension : public TCollection_BaseSequence {
	public:
		%feature("compactdefaultargs") AIS_SequenceOfDimension;
		%feature("autodoc", "	:rtype: None
") AIS_SequenceOfDimension;
		 AIS_SequenceOfDimension ();
		%feature("compactdefaultargs") AIS_SequenceOfDimension;
		%feature("autodoc", "	:param Other:
	:type Other: AIS_SequenceOfDimension &
	:rtype: None
") AIS_SequenceOfDimension;
		 AIS_SequenceOfDimension (const AIS_SequenceOfDimension & Other);
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: AIS_SequenceOfDimension &
	:rtype: AIS_SequenceOfDimension
") Assign;
		const AIS_SequenceOfDimension & Assign (const AIS_SequenceOfDimension & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: AIS_SequenceOfDimension &
	:rtype: AIS_SequenceOfDimension
") operator =;
		const AIS_SequenceOfDimension & operator = (const AIS_SequenceOfDimension & Other);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param T:
	:type T: Handle_AIS_Relation &
	:rtype: None
") Append;
		void Append (const Handle_AIS_Relation & T);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param S:
	:type S: AIS_SequenceOfDimension &
	:rtype: None
") Append;
		void Append (AIS_SequenceOfDimension & S);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param T:
	:type T: Handle_AIS_Relation &
	:rtype: None
") Prepend;
		void Prepend (const Handle_AIS_Relation & T);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param S:
	:type S: AIS_SequenceOfDimension &
	:rtype: None
") Prepend;
		void Prepend (AIS_SequenceOfDimension & S);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param T:
	:type T: Handle_AIS_Relation &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const Handle_AIS_Relation & T);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param S:
	:type S: AIS_SequenceOfDimension &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,AIS_SequenceOfDimension & S);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param T:
	:type T: Handle_AIS_Relation &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const Handle_AIS_Relation & T);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param S:
	:type S: AIS_SequenceOfDimension &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,AIS_SequenceOfDimension & S);
		%feature("compactdefaultargs") First;
		%feature("autodoc", "	:rtype: Handle_AIS_Relation
") First;
		Handle_AIS_Relation First ();
		%feature("compactdefaultargs") Last;
		%feature("autodoc", "	:rtype: Handle_AIS_Relation
") Last;
		Handle_AIS_Relation Last ();
		%feature("compactdefaultargs") Split;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param Sub:
	:type Sub: AIS_SequenceOfDimension &
	:rtype: None
") Split;
		void Split (const Standard_Integer Index,AIS_SequenceOfDimension & Sub);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_AIS_Relation
") Value;
		Handle_AIS_Relation Value (const Standard_Integer Index);
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param I:
	:type I: Handle_AIS_Relation &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Handle_AIS_Relation & I);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_AIS_Relation
") ChangeValue;
		Handle_AIS_Relation ChangeValue (const Standard_Integer Index);
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: None
") Remove;
		void Remove (const Standard_Integer Index);
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	:param FromIndex:
	:type FromIndex: int
	:param ToIndex:
	:type ToIndex: int
	:rtype: None
") Remove;
		void Remove (const Standard_Integer FromIndex,const Standard_Integer ToIndex);
};


%extend AIS_SequenceOfDimension {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor AIS_SequenceOfInteractive;
class AIS_SequenceOfInteractive : public TCollection_BaseSequence {
	public:
		%feature("compactdefaultargs") AIS_SequenceOfInteractive;
		%feature("autodoc", "	:rtype: None
") AIS_SequenceOfInteractive;
		 AIS_SequenceOfInteractive ();
		%feature("compactdefaultargs") AIS_SequenceOfInteractive;
		%feature("autodoc", "	:param Other:
	:type Other: AIS_SequenceOfInteractive &
	:rtype: None
") AIS_SequenceOfInteractive;
		 AIS_SequenceOfInteractive (const AIS_SequenceOfInteractive & Other);
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: AIS_SequenceOfInteractive &
	:rtype: AIS_SequenceOfInteractive
") Assign;
		const AIS_SequenceOfInteractive & Assign (const AIS_SequenceOfInteractive & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: AIS_SequenceOfInteractive &
	:rtype: AIS_SequenceOfInteractive
") operator =;
		const AIS_SequenceOfInteractive & operator = (const AIS_SequenceOfInteractive & Other);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param T:
	:type T: Handle_AIS_InteractiveObject &
	:rtype: None
") Append;
		void Append (const Handle_AIS_InteractiveObject & T);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param S:
	:type S: AIS_SequenceOfInteractive &
	:rtype: None
") Append;
		void Append (AIS_SequenceOfInteractive & S);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param T:
	:type T: Handle_AIS_InteractiveObject &
	:rtype: None
") Prepend;
		void Prepend (const Handle_AIS_InteractiveObject & T);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param S:
	:type S: AIS_SequenceOfInteractive &
	:rtype: None
") Prepend;
		void Prepend (AIS_SequenceOfInteractive & S);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param T:
	:type T: Handle_AIS_InteractiveObject &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const Handle_AIS_InteractiveObject & T);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param S:
	:type S: AIS_SequenceOfInteractive &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,AIS_SequenceOfInteractive & S);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param T:
	:type T: Handle_AIS_InteractiveObject &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const Handle_AIS_InteractiveObject & T);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param S:
	:type S: AIS_SequenceOfInteractive &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,AIS_SequenceOfInteractive & S);
		%feature("compactdefaultargs") First;
		%feature("autodoc", "	:rtype: Handle_AIS_InteractiveObject
") First;
		Handle_AIS_InteractiveObject First ();
		%feature("compactdefaultargs") Last;
		%feature("autodoc", "	:rtype: Handle_AIS_InteractiveObject
") Last;
		Handle_AIS_InteractiveObject Last ();
		%feature("compactdefaultargs") Split;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param Sub:
	:type Sub: AIS_SequenceOfInteractive &
	:rtype: None
") Split;
		void Split (const Standard_Integer Index,AIS_SequenceOfInteractive & Sub);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_AIS_InteractiveObject
") Value;
		Handle_AIS_InteractiveObject Value (const Standard_Integer Index);
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param I:
	:type I: Handle_AIS_InteractiveObject &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Handle_AIS_InteractiveObject & I);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_AIS_InteractiveObject
") ChangeValue;
		Handle_AIS_InteractiveObject ChangeValue (const Standard_Integer Index);
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: None
") Remove;
		void Remove (const Standard_Integer Index);
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	:param FromIndex:
	:type FromIndex: int
	:param ToIndex:
	:type ToIndex: int
	:rtype: None
") Remove;
		void Remove (const Standard_Integer FromIndex,const Standard_Integer ToIndex);
};


%extend AIS_SequenceOfInteractive {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor AIS_StdMapNodeOfMapOfInteractive;
class AIS_StdMapNodeOfMapOfInteractive : public TCollection_MapNode {
	public:
		%feature("compactdefaultargs") AIS_StdMapNodeOfMapOfInteractive;
		%feature("autodoc", "	:param K:
	:type K: Handle_AIS_InteractiveObject &
	:param n:
	:type n: TCollection_MapNodePtr &
	:rtype: None
") AIS_StdMapNodeOfMapOfInteractive;
		 AIS_StdMapNodeOfMapOfInteractive (const Handle_AIS_InteractiveObject & K,const TCollection_MapNodePtr & n);
		%feature("compactdefaultargs") Key;
		%feature("autodoc", "	:rtype: Handle_AIS_InteractiveObject
") Key;
		Handle_AIS_InteractiveObject Key ();
};


%extend AIS_StdMapNodeOfMapOfInteractive {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_AIS_StdMapNodeOfMapOfInteractive(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_AIS_StdMapNodeOfMapOfInteractive::Handle_AIS_StdMapNodeOfMapOfInteractive %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_AIS_StdMapNodeOfMapOfInteractive;
class Handle_AIS_StdMapNodeOfMapOfInteractive : public Handle_TCollection_MapNode {

    public:
        // constructors
        Handle_AIS_StdMapNodeOfMapOfInteractive();
        Handle_AIS_StdMapNodeOfMapOfInteractive(const Handle_AIS_StdMapNodeOfMapOfInteractive &aHandle);
        Handle_AIS_StdMapNodeOfMapOfInteractive(const AIS_StdMapNodeOfMapOfInteractive *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_AIS_StdMapNodeOfMapOfInteractive DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_AIS_StdMapNodeOfMapOfInteractive {
    AIS_StdMapNodeOfMapOfInteractive* _get_reference() {
    return (AIS_StdMapNodeOfMapOfInteractive*)$self->Access();
    }
};

%extend Handle_AIS_StdMapNodeOfMapOfInteractive {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend AIS_StdMapNodeOfMapOfInteractive {
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
	:type anobj: Handle_SelectMgr_EntityOwner &
	:rtype: bool
") IsOk;
		virtual Standard_Boolean IsOk (const Handle_SelectMgr_EntityOwner & anobj);
};


%extend AIS_TypeFilter {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_AIS_TypeFilter(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_AIS_TypeFilter::Handle_AIS_TypeFilter %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_AIS_TypeFilter;
class Handle_AIS_TypeFilter : public Handle_SelectMgr_Filter {

    public:
        // constructors
        Handle_AIS_TypeFilter();
        Handle_AIS_TypeFilter(const Handle_AIS_TypeFilter &aHandle);
        Handle_AIS_TypeFilter(const AIS_TypeFilter *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_AIS_TypeFilter DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_AIS_TypeFilter {
    AIS_TypeFilter* _get_reference() {
    return (AIS_TypeFilter*)$self->Access();
    }
};

%extend Handle_AIS_TypeFilter {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend AIS_TypeFilter {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor AIS_Axis;
class AIS_Axis : public AIS_InteractiveObject {
	public:
		%feature("compactdefaultargs") AIS_Axis;
		%feature("autodoc", "	* Initializes the line aComponent

	:param aComponent:
	:type aComponent: Handle_Geom_Line &
	:rtype: None
") AIS_Axis;
		 AIS_Axis (const Handle_Geom_Line & aComponent);
		%feature("compactdefaultargs") AIS_Axis;
		%feature("autodoc", "	* initializes the axis2 position aComponent. The coordinate system used is right-handed.

	:param aComponent:
	:type aComponent: Handle_Geom_Axis2Placement &
	:param anAxisType:
	:type anAxisType: AIS_TypeOfAxis
	:rtype: None
") AIS_Axis;
		 AIS_Axis (const Handle_Geom_Axis2Placement & aComponent,const AIS_TypeOfAxis anAxisType);
		%feature("compactdefaultargs") AIS_Axis;
		%feature("autodoc", "	* Initializes the axis1 position anAxis.

	:param anAxis:
	:type anAxis: Handle_Geom_Axis1Placement &
	:rtype: None
") AIS_Axis;
		 AIS_Axis (const Handle_Geom_Axis1Placement & anAxis);
		%feature("compactdefaultargs") Component;
		%feature("autodoc", "	* Returns the axis entity aComponent and identifies it as a component of a shape.

	:rtype: Handle_Geom_Line
") Component;
		Handle_Geom_Line Component ();
		%feature("compactdefaultargs") SetComponent;
		%feature("autodoc", "	* Sets the coordinates of the lin aComponent.

	:param aComponent:
	:type aComponent: Handle_Geom_Line &
	:rtype: None
") SetComponent;
		void SetComponent (const Handle_Geom_Line & aComponent);
		%feature("compactdefaultargs") Axis2Placement;
		%feature("autodoc", "	* Returns the position of axis2 and positions it by identifying it as the x, y, or z axis and giving its direction in 3D space. The coordinate system used is right-handed.

	:rtype: Handle_Geom_Axis2Placement
") Axis2Placement;
		Handle_Geom_Axis2Placement Axis2Placement ();
		%feature("compactdefaultargs") SetAxis2Placement;
		%feature("autodoc", "	* Allows you to provide settings for aComponent:the position and direction of an axis in 3D space. The coordinate system used is right-handed.

	:param aComponent:
	:type aComponent: Handle_Geom_Axis2Placement &
	:param anAxisType:
	:type anAxisType: AIS_TypeOfAxis
	:rtype: None
") SetAxis2Placement;
		void SetAxis2Placement (const Handle_Geom_Axis2Placement & aComponent,const AIS_TypeOfAxis anAxisType);
		%feature("compactdefaultargs") SetAxis1Placement;
		%feature("autodoc", "	* Constructs a new line to serve as the axis anAxis in 3D space.

	:param anAxis:
	:type anAxis: Handle_Geom_Axis1Placement &
	:rtype: None
") SetAxis1Placement;
		void SetAxis1Placement (const Handle_Geom_Axis1Placement & anAxis);
		%feature("compactdefaultargs") TypeOfAxis;
		%feature("autodoc", "	* Returns the type of axis.

	:rtype: AIS_TypeOfAxis
") TypeOfAxis;
		AIS_TypeOfAxis TypeOfAxis ();
		%feature("compactdefaultargs") SetTypeOfAxis;
		%feature("autodoc", "	* Constructs the entity aTypeAxis to stock information concerning type of axis.

	:param aTypeAxis:
	:type aTypeAxis: AIS_TypeOfAxis
	:rtype: None
") SetTypeOfAxis;
		void SetTypeOfAxis (const AIS_TypeOfAxis aTypeAxis);
		%feature("compactdefaultargs") IsXYZAxis;
		%feature("autodoc", "	* Returns a signature of 2 for axis datums. When you activate mode 2 by a signature, you pick AIS objects of type AIS_Axis.

	:rtype: bool
") IsXYZAxis;
		Standard_Boolean IsXYZAxis ();
		%feature("compactdefaultargs") AcceptDisplayMode;
		%feature("autodoc", "	* Returns true if the interactive object accepts the display mode aMode.

	:param aMode:
	:type aMode: int
	:rtype: bool
") AcceptDisplayMode;
		Standard_Boolean AcceptDisplayMode (const Standard_Integer aMode);
		%feature("compactdefaultargs") Compute;
		%feature("autodoc", "	* computes the presentation according to a point of view given by <aProjector>. To be Used when the associated degenerated Presentations have been transformed by <aTrsf> which is not a Pure Translation. The HLR Prs can't be deducted automatically WARNING :<aTrsf> must be applied to the object to display before computation !!!

	:param aProjector:
	:type aProjector: Handle_Prs3d_Projector &
	:param aTrsf:
	:type aTrsf: Handle_Geom_Transformation &
	:param aPresentation:
	:type aPresentation: Handle_Prs3d_Presentation &
	:rtype: void
") Compute;
		virtual void Compute (const Handle_Prs3d_Projector & aProjector,const Handle_Geom_Transformation & aTrsf,const Handle_Prs3d_Presentation & aPresentation);
		%feature("compactdefaultargs") Signature;
		%feature("autodoc", "	:rtype: int
") Signature;
		Standard_Integer Signature ();
		%feature("compactdefaultargs") Type;
		%feature("autodoc", "	:rtype: AIS_KindOfInteractive
") Type;
		AIS_KindOfInteractive Type ();
		%feature("compactdefaultargs") SetColor;
		%feature("autodoc", "	:param aColor:
	:type aColor: Quantity_NameOfColor
	:rtype: None
") SetColor;
		void SetColor (const Quantity_NameOfColor aColor);
		%feature("compactdefaultargs") SetColor;
		%feature("autodoc", "	:param aColor:
	:type aColor: Quantity_Color &
	:rtype: None
") SetColor;
		void SetColor (const Quantity_Color & aColor);
		%feature("compactdefaultargs") SetWidth;
		%feature("autodoc", "	:param aValue:
	:type aValue: float
	:rtype: None
") SetWidth;
		void SetWidth (const Standard_Real aValue);
		%feature("compactdefaultargs") UnsetColor;
		%feature("autodoc", "	:rtype: None
") UnsetColor;
		void UnsetColor ();
		%feature("compactdefaultargs") UnsetWidth;
		%feature("autodoc", "	:rtype: None
") UnsetWidth;
		void UnsetWidth ();
};


%extend AIS_Axis {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_AIS_Axis(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_AIS_Axis::Handle_AIS_Axis %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_AIS_Axis;
class Handle_AIS_Axis : public Handle_AIS_InteractiveObject {

    public:
        // constructors
        Handle_AIS_Axis();
        Handle_AIS_Axis(const Handle_AIS_Axis &aHandle);
        Handle_AIS_Axis(const AIS_Axis *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_AIS_Axis DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_AIS_Axis {
    AIS_Axis* _get_reference() {
    return (AIS_Axis*)$self->Access();
    }
};

%extend Handle_AIS_Axis {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend AIS_Axis {
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
	:type aCircle: Handle_Geom_Circle &
	:rtype: None
") AIS_Circle;
		 AIS_Circle (const Handle_Geom_Circle & aCircle);
		%feature("compactdefaultargs") AIS_Circle;
		%feature("autodoc", "	* Initializes this algorithm for constructing AIS circle datums. Initializes the circle theCircle, the arc starting point theUStart, the arc ending point theUEnd, and the type of sensitivity theIsFilledCircleSens.

	:param theCircle:
	:type theCircle: Handle_Geom_Circle &
	:param theUStart:
	:type theUStart: float
	:param theUEnd:
	:type theUEnd: float
	:param theIsFilledCircleSens: default value is Standard_False
	:type theIsFilledCircleSens: bool
	:rtype: None
") AIS_Circle;
		 AIS_Circle (const Handle_Geom_Circle & theCircle,const Standard_Real theUStart,const Standard_Real theUEnd,const Standard_Boolean theIsFilledCircleSens = Standard_False);
		%feature("compactdefaultargs") Compute;
		%feature("autodoc", "	* computes the presentation according to a point of view given by <aProjector>. To be Used when the associated degenerated Presentations have been transformed by <aTrsf> which is not a Pure Translation. The HLR Prs can't be deducted automatically WARNING :<aTrsf> must be applied to the object to display before computation !!!

	:param aProjector:
	:type aProjector: Handle_Prs3d_Projector &
	:param aTrsf:
	:type aTrsf: Handle_Geom_Transformation &
	:param aPresentation:
	:type aPresentation: Handle_Prs3d_Presentation &
	:rtype: void
") Compute;
		virtual void Compute (const Handle_Prs3d_Projector & aProjector,const Handle_Geom_Transformation & aTrsf,const Handle_Prs3d_Presentation & aPresentation);
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
		%feature("compactdefaultargs") Circle;
		%feature("autodoc", "	* Returns the circle component defined in SetCircle.

	:rtype: Handle_Geom_Circle
") Circle;
		Handle_Geom_Circle Circle ();
		%feature("compactdefaultargs") Parameters;
		%feature("autodoc", "	* Constructs instances of the starting point and the end point parameters, u1 and u2.

	:param u1:
	:type u1: float &
	:param u2:
	:type u2: float &
	:rtype: None
") Parameters;
		void Parameters (Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") SetCircle;
		%feature("autodoc", "	* Allows you to provide settings for the circle datum aCircle.

	:param aCircle:
	:type aCircle: Handle_Geom_Circle &
	:rtype: None
") SetCircle;
		void SetCircle (const Handle_Geom_Circle & aCircle);
		%feature("compactdefaultargs") SetFirstParam;
		%feature("autodoc", "	* Allows you to set the parameter u for the starting point of an arc.

	:param u:
	:type u: float
	:rtype: None
") SetFirstParam;
		void SetFirstParam (const Standard_Real u);
		%feature("compactdefaultargs") SetLastParam;
		%feature("autodoc", "	* Allows you to provide the parameter u for the end point of an arc.

	:param u:
	:type u: float
	:rtype: None
") SetLastParam;
		void SetLastParam (const Standard_Real u);
		%feature("compactdefaultargs") SetColor;
		%feature("autodoc", "	* Assigns the color aColor to the solid line boundary of the circle datum.

	:param aColor:
	:type aColor: Quantity_NameOfColor
	:rtype: None
") SetColor;
		void SetColor (const Quantity_NameOfColor aColor);
		%feature("compactdefaultargs") SetColor;
		%feature("autodoc", "	:param aColor:
	:type aColor: Quantity_Color &
	:rtype: None
") SetColor;
		void SetColor (const Quantity_Color & aColor);
		%feature("compactdefaultargs") SetWidth;
		%feature("autodoc", "	* Assigns the width aValue to the solid line boundary of the circle datum.

	:param aValue:
	:type aValue: float
	:rtype: None
") SetWidth;
		void SetWidth (const Standard_Real aValue);
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
		%feature("compactdefaultargs") IsFilledCircleSens;
		%feature("autodoc", "	* Returns the type of sensitivity for the circle;

	:rtype: bool
") IsFilledCircleSens;
		Standard_Boolean IsFilledCircleSens ();
		%feature("compactdefaultargs") SetFilledCircleSens;
		%feature("autodoc", "	* Sets the type of sensitivity for the circle. If theIsFilledCircleSens set to Standard_True then the whole circle will be detectable, otherwise only the boundary of the circle.

	:param theIsFilledCircleSens:
	:type theIsFilledCircleSens: bool
	:rtype: None
") SetFilledCircleSens;
		void SetFilledCircleSens (const Standard_Boolean theIsFilledCircleSens);
};


%extend AIS_Circle {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_AIS_Circle(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_AIS_Circle::Handle_AIS_Circle %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_AIS_Circle;
class Handle_AIS_Circle : public Handle_AIS_InteractiveObject {

    public:
        // constructors
        Handle_AIS_Circle();
        Handle_AIS_Circle(const Handle_AIS_Circle &aHandle);
        Handle_AIS_Circle(const AIS_Circle *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_AIS_Circle DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_AIS_Circle {
    AIS_Circle* _get_reference() {
    return (AIS_Circle*)$self->Access();
    }
};

%extend Handle_AIS_Circle {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend AIS_Circle {
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
		%feature("compactdefaultargs") Type;
		%feature("autodoc", "	* Returns KOI_Object

	:rtype: AIS_KindOfInteractive
") Type;
		virtual AIS_KindOfInteractive Type ();
		%feature("compactdefaultargs") Signature;
		%feature("autodoc", "	* Returns 1

	:rtype: int
") Signature;
		virtual Standard_Integer Signature ();
		%feature("compactdefaultargs") Connect;
		%feature("autodoc", "	* Establishes the connection between the Connected Interactive Object, anotherIobj, and its reference.

	:param anotherIObj:
	:type anotherIObj: Handle_AIS_InteractiveObject &
	:rtype: void
") Connect;
		virtual void Connect (const Handle_AIS_InteractiveObject & anotherIObj);
		%feature("compactdefaultargs") Connect;
		%feature("autodoc", "	* Establishes the connection between the Connected Interactive Object, anotherIobj, and its reference. Locates instance in aLocation.

	:param anotherIobj:
	:type anotherIobj: Handle_AIS_InteractiveObject &
	:param aLocation:
	:type aLocation: gp_Trsf
	:rtype: void
") Connect;
		virtual void Connect (const Handle_AIS_InteractiveObject & anotherIobj,const gp_Trsf & aLocation);
		%feature("compactdefaultargs") HasConnection;
		%feature("autodoc", "	* Returns true if there is a connection established between the presentation and its source reference.

	:rtype: bool
") HasConnection;
		Standard_Boolean HasConnection ();
		%feature("compactdefaultargs") ConnectedTo;
		%feature("autodoc", "	* Returns the connection with the reference Interactive Object.

	:rtype: Handle_AIS_InteractiveObject
") ConnectedTo;
		Handle_AIS_InteractiveObject ConnectedTo ();
		%feature("compactdefaultargs") Disconnect;
		%feature("autodoc", "	* Clears the connection with a source reference. The presentation will no longer be displayed. Warning Must be done before deleting the presentation.

	:rtype: None
") Disconnect;
		void Disconnect ();
		%feature("compactdefaultargs") AcceptShapeDecomposition;
		%feature("autodoc", "	* Informs the graphic context that the interactive Object may be decomposed into sub-shapes for dynamic selection.

	:rtype: bool
") AcceptShapeDecomposition;
		Standard_Boolean AcceptShapeDecomposition ();
};


%extend AIS_ConnectedInteractive {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_AIS_ConnectedInteractive(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_AIS_ConnectedInteractive::Handle_AIS_ConnectedInteractive %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_AIS_ConnectedInteractive;
class Handle_AIS_ConnectedInteractive : public Handle_AIS_InteractiveObject {

    public:
        // constructors
        Handle_AIS_ConnectedInteractive();
        Handle_AIS_ConnectedInteractive(const Handle_AIS_ConnectedInteractive &aHandle);
        Handle_AIS_ConnectedInteractive(const AIS_ConnectedInteractive *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_AIS_ConnectedInteractive DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_AIS_ConnectedInteractive {
    AIS_ConnectedInteractive* _get_reference() {
    return (AIS_ConnectedInteractive*)$self->Access();
    }
};

%extend Handle_AIS_ConnectedInteractive {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend AIS_ConnectedInteractive {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor AIS_Dimension;
class AIS_Dimension : public AIS_InteractiveObject {
	public:
/* public enums */
enum ComputeMode {
	ComputeMode_All = 0,
	ComputeMode_Line = 1,
	ComputeMode_Text = 2,
};

/* end public enums declaration */

		%feature("compactdefaultargs") AIS_Dimension;
		%feature("autodoc", "	* Constructor with default parameters values. @param theType [in] the type of dimension.

	:param theType:
	:type theType: AIS_KindOfDimension
	:rtype: None
") AIS_Dimension;
		 AIS_Dimension (const AIS_KindOfDimension theType);
		%feature("compactdefaultargs") GetValue;
		%feature("autodoc", "	* Gets dimension measurement value. If the value to display is not specified by user, then the dimension object is responsible to compute it on its own in model space coordinates. returns the dimension value (in model units) which is used during display of the presentation.

	:rtype: float
") GetValue;
		Standard_Real GetValue ();
		%feature("compactdefaultargs") SetCustomValue;
		%feature("autodoc", "	* Sets user-defined dimension value. The user-defined dimension value is specified in model space, and affect by unit conversion during the display. @param theValue [in] the user-defined value to display.

	:param theValue:
	:type theValue: float
	:rtype: None
") SetCustomValue;
		void SetCustomValue (const Standard_Real theValue);
		%feature("compactdefaultargs") GetPlane;
		%feature("autodoc", "	* Get the dimension plane in which the 2D dimension presentation is computed. By default, if plane is not defined by user, it is computed automatically after dimension geometry is computed. If computed dimension geometry (points) can't be placed on the user-defined plane, dimension geometry was set as invalid (validity flag is set to false) and dimension presentation will not be computed. If user-defined plane allow geometry placement on it, it will be used for computing of the dimension presentation. returns dimension plane used for presentation computing.

	:rtype: gp_Pln
") GetPlane;
		const gp_Pln  GetPlane ();
		%feature("compactdefaultargs") GetGeometryType;
		%feature("autodoc", "	* Geometry type defines type of shapes on which the dimension is to be built. returns type of geometry on which the dimension will be built.

	:rtype: int
") GetGeometryType;
		Standard_Integer GetGeometryType ();
		%feature("compactdefaultargs") SetCustomPlane;
		%feature("autodoc", "	* Sets user-defined plane where the 2D dimension presentation will be placed. Checks validity of this plane if geometry has been set already. Validity of the plane is checked according to the geometry set and has different criteria for different kinds of dimensions.

	:param thePlane:
	:type thePlane: gp_Pln
	:rtype: void
") SetCustomPlane;
		virtual void SetCustomPlane (const gp_Pln & thePlane);
		%feature("compactdefaultargs") UnsetCustomPlane;
		%feature("autodoc", "	* Unsets user-defined plane. Therefore the plane for dimension will be computed automatically.

	:rtype: None
") UnsetCustomPlane;
		void UnsetCustomPlane ();
		%feature("compactdefaultargs") IsTextPositionCustom;
		%feature("autodoc", "	* returns True if text position is set by user with method SetTextPosition().

	:rtype: bool
") IsTextPositionCustom;
		Standard_Boolean IsTextPositionCustom ();
		%feature("compactdefaultargs") SetTextPosition;
		%feature("autodoc", "	* Fixes the absolute text position and adjusts flyout, plane and text alignment according to it. Updates presentation if the text position is valid. ATTENTION! It does not change vertical text alignment. @param theTextPos [in] the point of text position.

	:param &:
	:type &: gp_Pnt
	:rtype: None
") SetTextPosition;
		void SetTextPosition (const gp_Pnt &);
		%feature("compactdefaultargs") GetTextPosition;
		%feature("autodoc", "	* Computes absolute text position from dimension parameters (flyout, plane and text alignment).

	:rtype: gp_Pnt
") GetTextPosition;
		const gp_Pnt GetTextPosition ();
		%feature("compactdefaultargs") DimensionAspect;
		%feature("autodoc", "	* Gets the dimension aspect from AIS object drawer. Dimension aspect contains aspects of line, text and arrows for dimension presentation.

	:rtype: Handle_Prs3d_DimensionAspect
") DimensionAspect;
		Handle_Prs3d_DimensionAspect DimensionAspect ();
		%feature("compactdefaultargs") SetDimensionAspect;
		%feature("autodoc", "	* Sets new dimension aspect for the interactive object drawer. The dimension aspect provides dynamic properties which are generally used during computation of dimension presentations.

	:param theDimensionAspect:
	:type theDimensionAspect: Handle_Prs3d_DimensionAspect &
	:rtype: None
") SetDimensionAspect;
		void SetDimensionAspect (const Handle_Prs3d_DimensionAspect & theDimensionAspect);
		%feature("compactdefaultargs") KindOfDimension;
		%feature("autodoc", "	* returns the kind of dimension.

	:rtype: AIS_KindOfDimension
") KindOfDimension;
		AIS_KindOfDimension KindOfDimension ();
		%feature("compactdefaultargs") Type;
		%feature("autodoc", "	* returns the kind of interactive.

	:rtype: AIS_KindOfInteractive
") Type;
		AIS_KindOfInteractive Type ();
		%feature("compactdefaultargs") AcceptDisplayMode;
		%feature("autodoc", "	* Returns true if the class of objects accepts the display mode theMode. The interactive context can have a default mode of representation for the set of Interactive Objects. This mode may not be accepted by object.

	:param theMode:
	:type theMode: int
	:rtype: bool
") AcceptDisplayMode;
		Standard_Boolean AcceptDisplayMode (const Standard_Integer theMode);
		%feature("compactdefaultargs") DisplaySpecialSymbol;
		%feature("autodoc", "	* returns dimension special symbol display options.

	:rtype: AIS_DisplaySpecialSymbol
") DisplaySpecialSymbol;
		AIS_DisplaySpecialSymbol DisplaySpecialSymbol ();
		%feature("compactdefaultargs") SetDisplaySpecialSymbol;
		%feature("autodoc", "	* Specifies whether to display special symbol or not.

	:param theDisplaySpecSymbol:
	:type theDisplaySpecSymbol: AIS_DisplaySpecialSymbol
	:rtype: None
") SetDisplaySpecialSymbol;
		void SetDisplaySpecialSymbol (const AIS_DisplaySpecialSymbol theDisplaySpecSymbol);
		%feature("compactdefaultargs") SpecialSymbol;
		%feature("autodoc", "	* returns special symbol.

	:rtype: Standard_ExtCharacter
") SpecialSymbol;
		Standard_ExtCharacter SpecialSymbol ();
		%feature("compactdefaultargs") SetSpecialSymbol;
		%feature("autodoc", "	* Specifies special symbol.

	:param theSpecialSymbol:
	:type theSpecialSymbol: Standard_ExtCharacter
	:rtype: None
") SetSpecialSymbol;
		void SetSpecialSymbol (const Standard_ExtCharacter theSpecialSymbol);
		%feature("compactdefaultargs") GetDisplayUnits;
		%feature("autodoc", "	:rtype: TCollection_AsciiString
") GetDisplayUnits;
		virtual const TCollection_AsciiString & GetDisplayUnits ();
		%feature("compactdefaultargs") GetModelUnits;
		%feature("autodoc", "	:rtype: TCollection_AsciiString
") GetModelUnits;
		virtual const TCollection_AsciiString & GetModelUnits ();
		%feature("compactdefaultargs") SetDisplayUnits;
		%feature("autodoc", "	:param &:
	:type &: TCollection_AsciiString
	:rtype: void
") SetDisplayUnits;
		virtual void SetDisplayUnits (const TCollection_AsciiString &);
		%feature("compactdefaultargs") SetModelUnits;
		%feature("autodoc", "	:param &:
	:type &: TCollection_AsciiString
	:rtype: void
") SetModelUnits;
		virtual void SetModelUnits (const TCollection_AsciiString &);
		%feature("compactdefaultargs") UnsetFixedTextPosition;
		%feature("autodoc", "	* Unsets user defined text positioning and enables text positioning by other parameters: text alignment, extension size, flyout and custom plane.

	:rtype: None
") UnsetFixedTextPosition;
		void UnsetFixedTextPosition ();
		%feature("compactdefaultargs") SelToleranceForText2d;
		%feature("autodoc", "	* Returns selection tolerance for text2d: For 2d text selection detection sensitive point with tolerance is used Important! Only for 2d text.

	:rtype: float
") SelToleranceForText2d;
		Standard_Real SelToleranceForText2d ();
		%feature("compactdefaultargs") SetSelToleranceForText2d;
		%feature("autodoc", "	* Sets selection tolerance for text2d: For 2d text selection detection sensitive point with tolerance is used to change this tolerance use this method Important! Only for 2d text.

	:param theTol:
	:type theTol: float
	:rtype: None
") SetSelToleranceForText2d;
		void SetSelToleranceForText2d (const Standard_Real theTol);
		%feature("compactdefaultargs") GetFlyout;
		%feature("autodoc", "	* returns flyout value for dimension.

	:rtype: float
") GetFlyout;
		Standard_Real GetFlyout ();
		%feature("compactdefaultargs") SetFlyout;
		%feature("autodoc", "	* Sets flyout value for dimension.

	:param theFlyout:
	:type theFlyout: float
	:rtype: None
") SetFlyout;
		void SetFlyout (const Standard_Real theFlyout);
		%feature("compactdefaultargs") IsValid;
		%feature("autodoc", "	* Check that the input geometry for dimension is valid and the presentation can be successfully computed. returns True if dimension geometry is ok.

	:rtype: bool
") IsValid;
		Standard_Boolean IsValid ();
};


%extend AIS_Dimension {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_AIS_Dimension(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_AIS_Dimension::Handle_AIS_Dimension %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_AIS_Dimension;
class Handle_AIS_Dimension : public Handle_AIS_InteractiveObject {

    public:
        // constructors
        Handle_AIS_Dimension();
        Handle_AIS_Dimension(const Handle_AIS_Dimension &aHandle);
        Handle_AIS_Dimension(const AIS_Dimension *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_AIS_Dimension DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_AIS_Dimension {
    AIS_Dimension* _get_reference() {
    return (AIS_Dimension*)$self->Access();
    }
};

%extend Handle_AIS_Dimension {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

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
	:type aLine: Handle_Geom_Line &
	:rtype: None
") AIS_Line;
		 AIS_Line (const Handle_Geom_Line & aLine);
		%feature("compactdefaultargs") AIS_Line;
		%feature("autodoc", "	* Initializes a starting point aStartPoint and a finishing point aEndPoint for the line.

	:param aStartPoint:
	:type aStartPoint: Handle_Geom_Point &
	:param aEndPoint:
	:type aEndPoint: Handle_Geom_Point &
	:rtype: None
") AIS_Line;
		 AIS_Line (const Handle_Geom_Point & aStartPoint,const Handle_Geom_Point & aEndPoint);
		%feature("compactdefaultargs") Compute;
		%feature("autodoc", "	* computes the presentation according to a point of view given by <aProjector>. To be Used when the associated degenerated Presentations have been transformed by <aTrsf> which is not a Pure Translation. The HLR Prs can't be deducted automatically WARNING :<aTrsf> must be applied to the object to display before computation !!!

	:param aProjector:
	:type aProjector: Handle_Prs3d_Projector &
	:param aTrsf:
	:type aTrsf: Handle_Geom_Transformation &
	:param aPresentation:
	:type aPresentation: Handle_Prs3d_Presentation &
	:rtype: void
") Compute;
		virtual void Compute (const Handle_Prs3d_Projector & aProjector,const Handle_Geom_Transformation & aTrsf,const Handle_Prs3d_Presentation & aPresentation);
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
		%feature("compactdefaultargs") Line;
		%feature("autodoc", "	* Constructs an infinite line.

	:rtype: Handle_Geom_Line
") Line;
		Handle_Geom_Line Line ();
		%feature("compactdefaultargs") Points;
		%feature("autodoc", "	* Returns the starting point PStart and the end point PEnd of the line set by SetPoints.

	:param PStart:
	:type PStart: Handle_Geom_Point &
	:param PEnd:
	:type PEnd: Handle_Geom_Point &
	:rtype: None
") Points;
		void Points (Handle_Geom_Point & PStart,Handle_Geom_Point & PEnd);
		%feature("compactdefaultargs") SetLine;
		%feature("autodoc", "	* instantiates an infinite line.

	:param L:
	:type L: Handle_Geom_Line &
	:rtype: None
") SetLine;
		void SetLine (const Handle_Geom_Line & L);
		%feature("compactdefaultargs") SetPoints;
		%feature("autodoc", "	* Sets the starting point P1 and ending point P2 of the infinite line to create a finite line segment.

	:param P1:
	:type P1: Handle_Geom_Point &
	:param P2:
	:type P2: Handle_Geom_Point &
	:rtype: None
") SetPoints;
		void SetPoints (const Handle_Geom_Point & P1,const Handle_Geom_Point & P2);
		%feature("compactdefaultargs") SetColor;
		%feature("autodoc", "	* Provides a new color setting aColor for the line in the drawing tool, or 'Drawer'.

	:param aColor:
	:type aColor: Quantity_NameOfColor
	:rtype: None
") SetColor;
		void SetColor (const Quantity_NameOfColor aColor);
		%feature("compactdefaultargs") SetColor;
		%feature("autodoc", "	:param aColor:
	:type aColor: Quantity_Color &
	:rtype: None
") SetColor;
		void SetColor (const Quantity_Color & aColor);
		%feature("compactdefaultargs") SetWidth;
		%feature("autodoc", "	* Provides the new width setting aValue for the line in the drawing tool, or 'Drawer'.

	:param aValue:
	:type aValue: float
	:rtype: None
") SetWidth;
		void SetWidth (const Standard_Real aValue);
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


%extend AIS_Line {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_AIS_Line(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_AIS_Line::Handle_AIS_Line %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_AIS_Line;
class Handle_AIS_Line : public Handle_AIS_InteractiveObject {

    public:
        // constructors
        Handle_AIS_Line();
        Handle_AIS_Line(const Handle_AIS_Line &aHandle);
        Handle_AIS_Line(const AIS_Line *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_AIS_Line DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_AIS_Line {
    AIS_Line* _get_reference() {
    return (AIS_Line*)$self->Access();
    }
};

%extend Handle_AIS_Line {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend AIS_Line {
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
		%feature("compactdefaultargs") Connect;
		%feature("autodoc", "	* Establishes the connection between the Connected Interactive Object, theInteractive, and its reference. Copies local transformation and transformation persistence mode from theInteractive. returns created instance object (AIS_ConnectedInteractive or AIS_MultipleConnectedInteractive)

	:param theInteractive:
	:type theInteractive: Handle_AIS_InteractiveObject &
	:rtype: Handle_AIS_InteractiveObject
") Connect;
		Handle_AIS_InteractiveObject Connect (const Handle_AIS_InteractiveObject & theInteractive);
		%feature("compactdefaultargs") Connect;
		%feature("autodoc", "	* Establishes the connection between the Connected Interactive Object, theInteractive, and its reference. Locates instance in theLocation and copies transformation persistence mode from theInteractive. returns created instance object (AIS_ConnectedInteractive or AIS_MultipleConnectedInteractive)

	:param theInteractive:
	:type theInteractive: Handle_AIS_InteractiveObject &
	:param theLocation:
	:type theLocation: gp_Trsf
	:rtype: Handle_AIS_InteractiveObject
") Connect;
		Handle_AIS_InteractiveObject Connect (const Handle_AIS_InteractiveObject & theInteractive,const gp_Trsf & theLocation);
		%feature("compactdefaultargs") Connect;
		%feature("autodoc", "	* Establishes the connection between the Connected Interactive Object, theInteractive, and its reference. Locates instance in theLocation and applies specified transformation persistence mode. returns created instance object (AIS_ConnectedInteractive or AIS_MultipleConnectedInteractive)

	:param theInteractive:
	:type theInteractive: Handle_AIS_InteractiveObject &
	:param theLocation:
	:type theLocation: gp_Trsf
	:param theTrsfPersFlag:
	:type theTrsfPersFlag: Graphic3d_TransModeFlags &
	:param theTrsfPersPoint:
	:type theTrsfPersPoint: gp_Pnt
	:rtype: Handle_AIS_InteractiveObject
") Connect;
		virtual Handle_AIS_InteractiveObject Connect (const Handle_AIS_InteractiveObject & theInteractive,const gp_Trsf & theLocation,const Graphic3d_TransModeFlags & theTrsfPersFlag,const gp_Pnt & theTrsfPersPoint);
		%feature("compactdefaultargs") Type;
		%feature("autodoc", "	:rtype: AIS_KindOfInteractive
") Type;
		virtual AIS_KindOfInteractive Type ();
		%feature("compactdefaultargs") Signature;
		%feature("autodoc", "	:rtype: int
") Signature;
		virtual Standard_Integer Signature ();
		%feature("compactdefaultargs") HasConnection;
		%feature("autodoc", "	* Returns true if the object is connected to others.

	:rtype: bool
") HasConnection;
		Standard_Boolean HasConnection ();
		%feature("compactdefaultargs") Disconnect;
		%feature("autodoc", "	* Removes the connection with theInteractive.

	:param theInteractive:
	:type theInteractive: Handle_AIS_InteractiveObject &
	:rtype: None
") Disconnect;
		void Disconnect (const Handle_AIS_InteractiveObject & theInteractive);
		%feature("compactdefaultargs") DisconnectAll;
		%feature("autodoc", "	* Clears all the connections to objects.

	:rtype: None
") DisconnectAll;
		void DisconnectAll ();
		%feature("compactdefaultargs") Compute;
		%feature("autodoc", "	* computes the presentation according to a point of view given by <aProjector>. To be Used when the associated degenerated Presentations have been transformed by <aTrsf> which is not a Pure Translation. The HLR Prs can't be deducted automatically WARNING :<aTrsf> must be applied to the object to display before computation !!!

	:param aProjector:
	:type aProjector: Handle_Prs3d_Projector &
	:param aTrsf:
	:type aTrsf: Handle_Geom_Transformation &
	:param aPresentation:
	:type aPresentation: Handle_Prs3d_Presentation &
	:rtype: void
") Compute;
		virtual void Compute (const Handle_Prs3d_Projector & aProjector,const Handle_Geom_Transformation & aTrsf,const Handle_Prs3d_Presentation & aPresentation);
		%feature("compactdefaultargs") Compute;
		%feature("autodoc", "	:param aProjector:
	:type aProjector: Handle_Prs3d_Projector &
	:param aPresentation:
	:type aPresentation: Handle_Prs3d_Presentation &
	:rtype: void
") Compute;
		virtual void Compute (const Handle_Prs3d_Projector & aProjector,const Handle_Prs3d_Presentation & aPresentation);
		%feature("compactdefaultargs") AcceptShapeDecomposition;
		%feature("autodoc", "	* Informs the graphic context that the interactive Object may be decomposed into sub-shapes for dynamic selection.

	:rtype: bool
") AcceptShapeDecomposition;
		virtual Standard_Boolean AcceptShapeDecomposition ();
};


%extend AIS_MultipleConnectedInteractive {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_AIS_MultipleConnectedInteractive(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_AIS_MultipleConnectedInteractive::Handle_AIS_MultipleConnectedInteractive %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_AIS_MultipleConnectedInteractive;
class Handle_AIS_MultipleConnectedInteractive : public Handle_AIS_InteractiveObject {

    public:
        // constructors
        Handle_AIS_MultipleConnectedInteractive();
        Handle_AIS_MultipleConnectedInteractive(const Handle_AIS_MultipleConnectedInteractive &aHandle);
        Handle_AIS_MultipleConnectedInteractive(const AIS_MultipleConnectedInteractive *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_AIS_MultipleConnectedInteractive DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_AIS_MultipleConnectedInteractive {
    AIS_MultipleConnectedInteractive* _get_reference() {
    return (AIS_MultipleConnectedInteractive*)$self->Access();
    }
};

%extend Handle_AIS_MultipleConnectedInteractive {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

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
	:type aComponent: Handle_Geom_Plane &
	:param aCurrentMode: default value is Standard_False
	:type aCurrentMode: bool
	:rtype: None
") AIS_Plane;
		 AIS_Plane (const Handle_Geom_Plane & aComponent,const Standard_Boolean aCurrentMode = Standard_False);
		%feature("compactdefaultargs") AIS_Plane;
		%feature("autodoc", "	* initializes the plane aComponent and the point aCenter. If the mode aCurrentMode equals true, the drawing tool, 'Drawer' is not initialized. aCurrentMode equals true, the drawing tool, 'Drawer' is not initialized.

	:param aComponent:
	:type aComponent: Handle_Geom_Plane &
	:param aCenter:
	:type aCenter: gp_Pnt
	:param aCurrentMode: default value is Standard_False
	:type aCurrentMode: bool
	:rtype: None
") AIS_Plane;
		 AIS_Plane (const Handle_Geom_Plane & aComponent,const gp_Pnt & aCenter,const Standard_Boolean aCurrentMode = Standard_False);
		%feature("compactdefaultargs") AIS_Plane;
		%feature("autodoc", "	* initializes the plane aComponent, the point aCenter, and the minimum and maximum points, aPmin and aPmax. If the mode aCurrentMode equals true, the drawing tool, 'Drawer' is not initialized.

	:param aComponent:
	:type aComponent: Handle_Geom_Plane &
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
		 AIS_Plane (const Handle_Geom_Plane & aComponent,const gp_Pnt & aCenter,const gp_Pnt & aPmin,const gp_Pnt & aPmax,const Standard_Boolean aCurrentMode = Standard_False);
		%feature("compactdefaultargs") AIS_Plane;
		%feature("autodoc", "	:param aComponent:
	:type aComponent: Handle_Geom_Axis2Placement &
	:param aPlaneType:
	:type aPlaneType: AIS_TypeOfPlane
	:param aCurrentMode: default value is Standard_False
	:type aCurrentMode: bool
	:rtype: None
") AIS_Plane;
		 AIS_Plane (const Handle_Geom_Axis2Placement & aComponent,const AIS_TypeOfPlane aPlaneType,const Standard_Boolean aCurrentMode = Standard_False);
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
		%feature("compactdefaultargs") UnsetSize;
		%feature("autodoc", "	:rtype: None
") UnsetSize;
		void UnsetSize ();
		%feature("compactdefaultargs") Size;
		%feature("autodoc", "	:param X:
	:type X: float &
	:param Y:
	:type Y: float &
	:rtype: bool
") Size;
		Standard_Boolean Size (Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") HasOwnSize;
		%feature("autodoc", "	:rtype: bool
") HasOwnSize;
		Standard_Boolean HasOwnSize ();
		%feature("compactdefaultargs") Signature;
		%feature("autodoc", "	:rtype: int
") Signature;
		virtual Standard_Integer Signature ();
		%feature("compactdefaultargs") Type;
		%feature("autodoc", "	:rtype: AIS_KindOfInteractive
") Type;
		virtual AIS_KindOfInteractive Type ();
		%feature("compactdefaultargs") Component;
		%feature("autodoc", "	* Returns the component specified in SetComponent.

	:rtype: Handle_Geom_Plane
") Component;
		Handle_Geom_Plane Component ();
		%feature("compactdefaultargs") SetComponent;
		%feature("autodoc", "	* Creates an instance of the plane aComponent.

	:param aComponent:
	:type aComponent: Handle_Geom_Plane &
	:rtype: None
") SetComponent;
		void SetComponent (const Handle_Geom_Plane & aComponent);
		%feature("compactdefaultargs") PlaneAttributes;
		%feature("autodoc", "	* Returns the settings for the selected plane aComponent, provided in SetPlaneAttributes. These include the points aCenter, aPmin, and aPmax

	:param aComponent:
	:type aComponent: Handle_Geom_Plane &
	:param aCenter:
	:type aCenter: gp_Pnt
	:param aPmin:
	:type aPmin: gp_Pnt
	:param aPmax:
	:type aPmax: gp_Pnt
	:rtype: bool
") PlaneAttributes;
		Standard_Boolean PlaneAttributes (Handle_Geom_Plane & aComponent,gp_Pnt & aCenter,gp_Pnt & aPmin,gp_Pnt & aPmax);
		%feature("compactdefaultargs") SetPlaneAttributes;
		%feature("autodoc", "	* Allows you to provide settings other than default ones for the selected plane. These include: center point aCenter, maximum aPmax and minimum aPmin.

	:param aComponent:
	:type aComponent: Handle_Geom_Plane &
	:param aCenter:
	:type aCenter: gp_Pnt
	:param aPmin:
	:type aPmin: gp_Pnt
	:param aPmax:
	:type aPmax: gp_Pnt
	:rtype: None
") SetPlaneAttributes;
		void SetPlaneAttributes (const Handle_Geom_Plane & aComponent,const gp_Pnt & aCenter,const gp_Pnt & aPmin,const gp_Pnt & aPmax);
		%feature("compactdefaultargs") Center;
		%feature("autodoc", "	* Returns the coordinates of the center point.

	:rtype: gp_Pnt
") Center;
		const gp_Pnt  Center ();
		%feature("compactdefaultargs") SetCenter;
		%feature("autodoc", "	* Provides settings for the center aCenter other than (0, 0, 0).

	:param aCenter:
	:type aCenter: gp_Pnt
	:rtype: None
") SetCenter;
		void SetCenter (const gp_Pnt & aCenter);
		%feature("compactdefaultargs") SetAxis2Placement;
		%feature("autodoc", "	* Allows you to provide settings for the position and direction of one of the plane's axes, aComponent, in 3D space. The coordinate system used is right-handed, and the type of plane aPlaneType is one of: - AIS_ TOPL_Unknown - AIS_ TOPL_XYPlane - AIS_ TOPL_XZPlane - AIS_ TOPL_YZPlane}.

	:param aComponent:
	:type aComponent: Handle_Geom_Axis2Placement &
	:param aPlaneType:
	:type aPlaneType: AIS_TypeOfPlane
	:rtype: None
") SetAxis2Placement;
		void SetAxis2Placement (const Handle_Geom_Axis2Placement & aComponent,const AIS_TypeOfPlane aPlaneType);
		%feature("compactdefaultargs") Axis2Placement;
		%feature("autodoc", "	* Returns the position of the plane's axis2 system identifying the x, y, or z axis and giving the plane a direction in 3D space. An axis2 system is a right-handed coordinate system.

	:rtype: Handle_Geom_Axis2Placement
") Axis2Placement;
		Handle_Geom_Axis2Placement Axis2Placement ();
		%feature("compactdefaultargs") TypeOfPlane;
		%feature("autodoc", "	* Returns the type of plane - xy, yz, xz or unknown.

	:rtype: AIS_TypeOfPlane
") TypeOfPlane;
		AIS_TypeOfPlane TypeOfPlane ();
		%feature("compactdefaultargs") IsXYZPlane;
		%feature("autodoc", "	* Returns the type of plane - xy, yz, or xz.

	:rtype: bool
") IsXYZPlane;
		Standard_Boolean IsXYZPlane ();
		%feature("compactdefaultargs") CurrentMode;
		%feature("autodoc", "	* Returns the non-default current display mode set by SetCurrentMode.

	:rtype: bool
") CurrentMode;
		Standard_Boolean CurrentMode ();
		%feature("compactdefaultargs") SetCurrentMode;
		%feature("autodoc", "	* Allows you to provide settings for a non-default current display mode.

	:param aCurrentMode:
	:type aCurrentMode: bool
	:rtype: None
") SetCurrentMode;
		void SetCurrentMode (const Standard_Boolean aCurrentMode);
		%feature("compactdefaultargs") AcceptDisplayMode;
		%feature("autodoc", "	* Returns true if the display mode selected, aMode, is valid for planes.

	:param aMode:
	:type aMode: int
	:rtype: bool
") AcceptDisplayMode;
		virtual Standard_Boolean AcceptDisplayMode (const Standard_Integer aMode);
		%feature("compactdefaultargs") SetContext;
		%feature("autodoc", "	* connection to <aCtx> default drawer implies a recomputation of Frame values.

	:param aCtx:
	:type aCtx: Handle_AIS_InteractiveContext &
	:rtype: void
") SetContext;
		virtual void SetContext (const Handle_AIS_InteractiveContext & aCtx);
		%feature("compactdefaultargs") TypeOfSensitivity;
		%feature("autodoc", "	* Returns the type of sensitivity for the plane;

	:rtype: Select3D_TypeOfSensitivity
") TypeOfSensitivity;
		Select3D_TypeOfSensitivity TypeOfSensitivity ();
		%feature("compactdefaultargs") SetTypeOfSensitivity;
		%feature("autodoc", "	* Sets the type of sensitivity for the plane.

	:param theTypeOfSensitivity:
	:type theTypeOfSensitivity: Select3D_TypeOfSensitivity &
	:rtype: None
") SetTypeOfSensitivity;
		void SetTypeOfSensitivity (const Select3D_TypeOfSensitivity & theTypeOfSensitivity);
		%feature("compactdefaultargs") Compute;
		%feature("autodoc", "	* computes the presentation according to a point of view given by <aProjector>. To be Used when the associated degenerated Presentations have been transformed by <aTrsf> which is not a Pure Translation. The HLR Prs can't be deducted automatically WARNING :<aTrsf> must be applied to the object to display before computation !!!

	:param aProjector:
	:type aProjector: Handle_Prs3d_Projector &
	:param aTrsf:
	:type aTrsf: Handle_Geom_Transformation &
	:param aPresentation:
	:type aPresentation: Handle_Prs3d_Presentation &
	:rtype: void
") Compute;
		virtual void Compute (const Handle_Prs3d_Projector & aProjector,const Handle_Geom_Transformation & aTrsf,const Handle_Prs3d_Presentation & aPresentation);
		%feature("compactdefaultargs") ComputeSelection;
		%feature("autodoc", "	:param theSelection:
	:type theSelection: Handle_SelectMgr_Selection &
	:param theMode:
	:type theMode: int
	:rtype: void
") ComputeSelection;
		virtual void ComputeSelection (const Handle_SelectMgr_Selection & theSelection,const Standard_Integer theMode);
		%feature("compactdefaultargs") SetColor;
		%feature("autodoc", "	:param aColor:
	:type aColor: Quantity_NameOfColor
	:rtype: None
") SetColor;
		void SetColor (const Quantity_NameOfColor aColor);
		%feature("compactdefaultargs") SetColor;
		%feature("autodoc", "	:param aColor:
	:type aColor: Quantity_Color &
	:rtype: None
") SetColor;
		void SetColor (const Quantity_Color & aColor);
		%feature("compactdefaultargs") UnsetColor;
		%feature("autodoc", "	:rtype: None
") UnsetColor;
		void UnsetColor ();
};


%extend AIS_Plane {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_AIS_Plane(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_AIS_Plane::Handle_AIS_Plane %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_AIS_Plane;
class Handle_AIS_Plane : public Handle_AIS_InteractiveObject {

    public:
        // constructors
        Handle_AIS_Plane();
        Handle_AIS_Plane(const Handle_AIS_Plane &aHandle);
        Handle_AIS_Plane(const AIS_Plane *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_AIS_Plane DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_AIS_Plane {
    AIS_Plane* _get_reference() {
    return (AIS_Plane*)$self->Access();
    }
};

%extend Handle_AIS_Plane {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

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
	:type aPlane: Handle_Geom_Plane &
	:rtype: None
") AIS_PlaneTrihedron;
		 AIS_PlaneTrihedron (const Handle_Geom_Plane & aPlane);
		%feature("compactdefaultargs") Component;
		%feature("autodoc", "	* Returns the component specified in SetComponent.

	:rtype: Handle_Geom_Plane
") Component;
		Handle_Geom_Plane Component ();
		%feature("compactdefaultargs") SetComponent;
		%feature("autodoc", "	* Creates an instance of the component object aPlane.

	:param aPlane:
	:type aPlane: Handle_Geom_Plane &
	:rtype: None
") SetComponent;
		void SetComponent (const Handle_Geom_Plane & aPlane);
		%feature("compactdefaultargs") XAxis;
		%feature("autodoc", "	* Returns the 'XAxis'.

	:rtype: Handle_AIS_Line
") XAxis;
		Handle_AIS_Line XAxis ();
		%feature("compactdefaultargs") YAxis;
		%feature("autodoc", "	* Returns the 'YAxis'.

	:rtype: Handle_AIS_Line
") YAxis;
		Handle_AIS_Line YAxis ();
		%feature("compactdefaultargs") Position;
		%feature("autodoc", "	* Returns the point of origin of the plane trihedron.

	:rtype: Handle_AIS_Point
") Position;
		Handle_AIS_Point Position ();
		%feature("compactdefaultargs") SetLength;
		%feature("autodoc", "	* Sets the length of the X and Y axes.

	:param theLength:
	:type theLength: float
	:rtype: None
") SetLength;
		void SetLength (const Standard_Real theLength);
		%feature("compactdefaultargs") GetLength;
		%feature("autodoc", "	* Returns the length of X and Y axes.

	:rtype: float
") GetLength;
		Standard_Real GetLength ();
		%feature("compactdefaultargs") AcceptDisplayMode;
		%feature("autodoc", "	* Returns true if the display mode selected, aMode, is valid.

	:param aMode:
	:type aMode: int
	:rtype: bool
") AcceptDisplayMode;
		Standard_Boolean AcceptDisplayMode (const Standard_Integer aMode);
		%feature("compactdefaultargs") Compute;
		%feature("autodoc", "	* computes the presentation according to a point of view given by <aProjector>. To be Used when the associated degenerated Presentations have been transformed by <aTrsf> which is not a Pure Translation. The HLR Prs can't be deducted automatically WARNING :<aTrsf> must be applied to the object to display before computation !!!

	:param aProjector:
	:type aProjector: Handle_Prs3d_Projector &
	:param aTrsf:
	:type aTrsf: Handle_Geom_Transformation &
	:param aPresentation:
	:type aPresentation: Handle_Prs3d_Presentation &
	:rtype: void
") Compute;
		virtual void Compute (const Handle_Prs3d_Projector & aProjector,const Handle_Geom_Transformation & aTrsf,const Handle_Prs3d_Presentation & aPresentation);
		%feature("compactdefaultargs") Signature;
		%feature("autodoc", "	:rtype: int
") Signature;
		Standard_Integer Signature ();
		%feature("compactdefaultargs") Type;
		%feature("autodoc", "	* Returns datum as the type of Interactive Object.

	:rtype: AIS_KindOfInteractive
") Type;
		AIS_KindOfInteractive Type ();
		%feature("compactdefaultargs") SetColor;
		%feature("autodoc", "	* Allows you to provide settings for the color aColor.

	:param aColor:
	:type aColor: Quantity_NameOfColor
	:rtype: None
") SetColor;
		void SetColor (const Quantity_NameOfColor aColor);
		%feature("compactdefaultargs") SetColor;
		%feature("autodoc", "	:param aColor:
	:type aColor: Quantity_Color &
	:rtype: None
") SetColor;
		void SetColor (const Quantity_Color & aColor);
		%feature("compactdefaultargs") SetXLabel;
		%feature("autodoc", "	:param aLabel:
	:type aLabel: TCollection_AsciiString &
	:rtype: None
") SetXLabel;
		void SetXLabel (const TCollection_AsciiString & aLabel);
		%feature("compactdefaultargs") SetYLabel;
		%feature("autodoc", "	:param aLabel:
	:type aLabel: TCollection_AsciiString &
	:rtype: None
") SetYLabel;
		void SetYLabel (const TCollection_AsciiString & aLabel);
};


%extend AIS_PlaneTrihedron {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_AIS_PlaneTrihedron(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_AIS_PlaneTrihedron::Handle_AIS_PlaneTrihedron %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_AIS_PlaneTrihedron;
class Handle_AIS_PlaneTrihedron : public Handle_AIS_InteractiveObject {

    public:
        // constructors
        Handle_AIS_PlaneTrihedron();
        Handle_AIS_PlaneTrihedron(const Handle_AIS_PlaneTrihedron &aHandle);
        Handle_AIS_PlaneTrihedron(const AIS_PlaneTrihedron *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_AIS_PlaneTrihedron DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_AIS_PlaneTrihedron {
    AIS_PlaneTrihedron* _get_reference() {
    return (AIS_PlaneTrihedron*)$self->Access();
    }
};

%extend Handle_AIS_PlaneTrihedron {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

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
	:type aComponent: Handle_Geom_Point &
	:rtype: None
") AIS_Point;
		 AIS_Point (const Handle_Geom_Point & aComponent);
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
		%feature("compactdefaultargs") Component;
		%feature("autodoc", "	* Returns the component specified in SetComponent.

	:rtype: Handle_Geom_Point
") Component;
		Handle_Geom_Point Component ();
		%feature("compactdefaultargs") SetComponent;
		%feature("autodoc", "	* Constructs an instance of the point aComponent.

	:param aComponent:
	:type aComponent: Handle_Geom_Point &
	:rtype: None
") SetComponent;
		void SetComponent (const Handle_Geom_Point & aComponent);
		%feature("compactdefaultargs") AcceptDisplayMode;
		%feature("autodoc", "	* Returns true if the display mode selected is valid for point datums.

	:param aMode:
	:type aMode: int
	:rtype: bool
") AcceptDisplayMode;
		Standard_Boolean AcceptDisplayMode (const Standard_Integer aMode);
		%feature("compactdefaultargs") Compute;
		%feature("autodoc", "	* computes the presentation according to a point of view given by <aProjector>. To be Used when the associated degenerated Presentations have been transformed by <aTrsf> which is not a Pure Translation. The HLR Prs can't be deducted automatically WARNING :<aTrsf> must be applied to the object to display before computation !!!

	:param aProjector:
	:type aProjector: Handle_Prs3d_Projector &
	:param aTrsf:
	:type aTrsf: Handle_Geom_Transformation &
	:param aPresentation:
	:type aPresentation: Handle_Prs3d_Presentation &
	:rtype: void
") Compute;
		virtual void Compute (const Handle_Prs3d_Projector & aProjector,const Handle_Geom_Transformation & aTrsf,const Handle_Prs3d_Presentation & aPresentation);
		%feature("compactdefaultargs") SetColor;
		%feature("autodoc", "	* Allows you to provide settings for the cp;pr aColor.

	:param aColor:
	:type aColor: Quantity_NameOfColor
	:rtype: None
") SetColor;
		void SetColor (const Quantity_NameOfColor aColor);
		%feature("compactdefaultargs") SetColor;
		%feature("autodoc", "	:param aColor:
	:type aColor: Quantity_Color &
	:rtype: None
") SetColor;
		void SetColor (const Quantity_Color & aColor);
		%feature("compactdefaultargs") UnsetColor;
		%feature("autodoc", "	* Allows you to remove color settings.

	:rtype: None
") UnsetColor;
		void UnsetColor ();
		%feature("compactdefaultargs") SetMarker;
		%feature("autodoc", "	* Allows you to provide settings for a marker. These include - type of marker, - marker color, - scale factor.

	:param aType:
	:type aType: Aspect_TypeOfMarker
	:rtype: None
") SetMarker;
		void SetMarker (const Aspect_TypeOfMarker aType);
		%feature("compactdefaultargs") UnsetMarker;
		%feature("autodoc", "	* Removes the marker settings.

	:rtype: None
") UnsetMarker;
		void UnsetMarker ();
		%feature("compactdefaultargs") HasMarker;
		%feature("autodoc", "	* Returns true if the point datum has a marker.

	:rtype: bool
") HasMarker;
		Standard_Boolean HasMarker ();
		%feature("compactdefaultargs") Vertex;
		%feature("autodoc", "	* Converts a point into a vertex.

	:rtype: TopoDS_Vertex
") Vertex;
		TopoDS_Vertex Vertex ();
};


%extend AIS_Point {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_AIS_Point(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_AIS_Point::Handle_AIS_Point %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_AIS_Point;
class Handle_AIS_Point : public Handle_AIS_InteractiveObject {

    public:
        // constructors
        Handle_AIS_Point();
        Handle_AIS_Point(const Handle_AIS_Point &aHandle);
        Handle_AIS_Point(const AIS_Point *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_AIS_Point DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_AIS_Point {
    AIS_Point* _get_reference() {
    return (AIS_Point*)$self->Access();
    }
};

%extend Handle_AIS_Point {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

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

/* end public enums declaration */

		%feature("compactdefaultargs") AIS_PointCloud;
		%feature("autodoc", "	* Constructor.

	:rtype: None
") AIS_PointCloud;
		 AIS_PointCloud ();
		%feature("compactdefaultargs") SetPoints;
		%feature("autodoc", "	* Sets the points from array of points. Method will not copy the input data - array will be stored as handle. @param thePoints [in] the array of points

	:param thePoints:
	:type thePoints: Handle_Graphic3d_ArrayOfPoints &
	:rtype: void
") SetPoints;
		virtual void SetPoints (const Handle_Graphic3d_ArrayOfPoints & thePoints);
		%feature("compactdefaultargs") SetPoints;
		%feature("autodoc", "	* Sets the points with optional colors. The input data will be copied into internal buffer. The input arrays should have equal length, otherwise the presentation will not be computed and displayed. @param theCoords [in] the array of coordinates @param theColors [in] optional array of colors @param theNormals [in] optional array of normals

	:param theCoords:
	:type theCoords: Handle_TColgp_HArray1OfPnt
	:param theColors: default value is NULL
	:type theColors: Handle_Quantity_HArray1OfColor &
	:param theNormals: default value is NULL
	:type theNormals: Handle_TColgp_HArray1OfDir
	:rtype: void
") SetPoints;
		virtual void SetPoints (const Handle_TColgp_HArray1OfPnt & theCoords,const Handle_Quantity_HArray1OfColor & theColors = NULL,const Handle_TColgp_HArray1OfDir & theNormals = NULL);
		%feature("compactdefaultargs") GetPoints;
		%feature("autodoc", "	* Get the points array. Method might be overridden to fill in points array dynamically from application data structures. returns the array of points

	:rtype: Handle_Graphic3d_ArrayOfPoints
") GetPoints;
		virtual const Handle_Graphic3d_ArrayOfPoints GetPoints ();
		%feature("compactdefaultargs") GetBoundingBox;
		%feature("autodoc", "	* Get bounding box for presentation.

	:rtype: Bnd_Box
") GetBoundingBox;
		virtual Bnd_Box GetBoundingBox ();
		%feature("compactdefaultargs") SetColor;
		%feature("autodoc", "	* Setup custom color. Affects presentation only when no per-point color attribute has been assigned.

	:param theColor:
	:type theColor: Quantity_NameOfColor
	:rtype: void
") SetColor;
		virtual void SetColor (const Quantity_NameOfColor theColor);
		%feature("compactdefaultargs") SetColor;
		%feature("autodoc", "	* Setup custom color. Affects presentation only when no per-point color attribute has been assigned.

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
		%feature("compactdefaultargs") SetMaterial;
		%feature("autodoc", "	* Setup custom material. Affects presentation only when normals are defined.

	:param theMatName:
	:type theMatName: Graphic3d_NameOfMaterial
	:rtype: void
") SetMaterial;
		virtual void SetMaterial (const Graphic3d_NameOfMaterial theMatName);
		%feature("compactdefaultargs") SetMaterial;
		%feature("autodoc", "	* Setup custom material. Affects presentation only when normals are defined.

	:param theMat:
	:type theMat: Graphic3d_MaterialAspect &
	:rtype: void
") SetMaterial;
		virtual void SetMaterial (const Graphic3d_MaterialAspect & theMat);
		%feature("compactdefaultargs") UnsetMaterial;
		%feature("autodoc", "	* Restore default material.

	:rtype: void
") UnsetMaterial;
		virtual void UnsetMaterial ();
};


%extend AIS_PointCloud {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_AIS_PointCloud(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_AIS_PointCloud::Handle_AIS_PointCloud %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_AIS_PointCloud;
class Handle_AIS_PointCloud : public Handle_AIS_InteractiveObject {

    public:
        // constructors
        Handle_AIS_PointCloud();
        Handle_AIS_PointCloud(const Handle_AIS_PointCloud &aHandle);
        Handle_AIS_PointCloud(const AIS_PointCloud *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_AIS_PointCloud DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_AIS_PointCloud {
    AIS_PointCloud* _get_reference() {
    return (AIS_PointCloud*)$self->Access();
    }
};

%extend Handle_AIS_PointCloud {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend AIS_PointCloud {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor AIS_Relation;
class AIS_Relation : public AIS_InteractiveObject {
	public:
		%feature("compactdefaultargs") SetColor;
		%feature("autodoc", "	* Allows you to provide settings for the color aColor of the lines representing the relation between the two shapes.

	:param aColor:
	:type aColor: Quantity_NameOfColor
	:rtype: None
") SetColor;
		void SetColor (const Quantity_NameOfColor aColor);
		%feature("compactdefaultargs") SetColor;
		%feature("autodoc", "	:param aColor:
	:type aColor: Quantity_Color &
	:rtype: None
") SetColor;
		void SetColor (const Quantity_Color & aColor);
		%feature("compactdefaultargs") UnsetColor;
		%feature("autodoc", "	* Allows you to remove settings for the color of the lines representing the relation between the two shapes.

	:rtype: None
") UnsetColor;
		void UnsetColor ();
		%feature("compactdefaultargs") Type;
		%feature("autodoc", "	:rtype: AIS_KindOfInteractive
") Type;
		AIS_KindOfInteractive Type ();
		%feature("compactdefaultargs") KindOfDimension;
		%feature("autodoc", "	* Indicates that the type of dimension is unknown.

	:rtype: AIS_KindOfDimension
") KindOfDimension;
		virtual AIS_KindOfDimension KindOfDimension ();
		%feature("compactdefaultargs") IsMovable;
		%feature("autodoc", "	* Returns true if the interactive object is movable.

	:rtype: bool
") IsMovable;
		virtual Standard_Boolean IsMovable ();
		%feature("compactdefaultargs") FirstShape;
		%feature("autodoc", "	:rtype: TopoDS_Shape
") FirstShape;
		const TopoDS_Shape  FirstShape ();
		%feature("compactdefaultargs") SetFirstShape;
		%feature("autodoc", "	:param aFShape:
	:type aFShape: TopoDS_Shape &
	:rtype: void
") SetFirstShape;
		virtual void SetFirstShape (const TopoDS_Shape & aFShape);
		%feature("compactdefaultargs") SecondShape;
		%feature("autodoc", "	* Returns the second shape.

	:rtype: TopoDS_Shape
") SecondShape;
		const TopoDS_Shape  SecondShape ();
		%feature("compactdefaultargs") SetSecondShape;
		%feature("autodoc", "	* Allows you to identify the second shape aSShape relative to the first.

	:param aSShape:
	:type aSShape: TopoDS_Shape &
	:rtype: void
") SetSecondShape;
		virtual void SetSecondShape (const TopoDS_Shape & aSShape);
		%feature("compactdefaultargs") SetBndBox;
		%feature("autodoc", "	:param Xmin:
	:type Xmin: float
	:param Ymin:
	:type Ymin: float
	:param Zmin:
	:type Zmin: float
	:param Xmax:
	:type Xmax: float
	:param Ymax:
	:type Ymax: float
	:param Zmax:
	:type Zmax: float
	:rtype: None
") SetBndBox;
		void SetBndBox (const Standard_Real Xmin,const Standard_Real Ymin,const Standard_Real Zmin,const Standard_Real Xmax,const Standard_Real Ymax,const Standard_Real Zmax);
		%feature("compactdefaultargs") UnsetBndBox;
		%feature("autodoc", "	:rtype: None
") UnsetBndBox;
		void UnsetBndBox ();
		%feature("compactdefaultargs") Plane;
		%feature("autodoc", "	* Returns the plane.

	:rtype: Handle_Geom_Plane
") Plane;
		Handle_Geom_Plane Plane ();
		%feature("compactdefaultargs") SetPlane;
		%feature("autodoc", "	* Allows you to set the plane aPlane. This is used to define relations and dimensions in several daughter classes.

	:param aPlane:
	:type aPlane: Handle_Geom_Plane &
	:rtype: None
") SetPlane;
		void SetPlane (const Handle_Geom_Plane & aPlane);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	* Returns the value of each object in the relation.

	:rtype: float
") Value;
		Standard_Real Value ();
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	* Allows you to provide settings for the value aVal for each object in the relation.

	:param aVal:
	:type aVal: float
	:rtype: None
") SetValue;
		void SetValue (const Standard_Real aVal);
		%feature("compactdefaultargs") Position;
		%feature("autodoc", "	* Returns the position set using SetPosition.

	:rtype: gp_Pnt
") Position;
		const gp_Pnt  Position ();
		%feature("compactdefaultargs") SetPosition;
		%feature("autodoc", "	* Allows you to provide the objects in the relation with settings for a non-default position.

	:param aPosition:
	:type aPosition: gp_Pnt
	:rtype: None
") SetPosition;
		void SetPosition (const gp_Pnt & aPosition);
		%feature("compactdefaultargs") Text;
		%feature("autodoc", "	* Returns settings for text aspect.

	:rtype: TCollection_ExtendedString
") Text;
		const TCollection_ExtendedString & Text ();
		%feature("compactdefaultargs") SetText;
		%feature("autodoc", "	* Allows you to provide the settings aText for text aspect.

	:param aText:
	:type aText: TCollection_ExtendedString &
	:rtype: None
") SetText;
		void SetText (const TCollection_ExtendedString & aText);
		%feature("compactdefaultargs") ArrowSize;
		%feature("autodoc", "	* Returns the value for the size of the arrow identifying the relation between the two shapes.

	:rtype: float
") ArrowSize;
		Standard_Real ArrowSize ();
		%feature("compactdefaultargs") SetArrowSize;
		%feature("autodoc", "	* Allows you to provide settings for the size of the arrow anArrowsize identifying the relation between the two shapes.

	:param anArrowSize:
	:type anArrowSize: float
	:rtype: None
") SetArrowSize;
		void SetArrowSize (const Standard_Real anArrowSize);
		%feature("compactdefaultargs") SymbolPrs;
		%feature("autodoc", "	* Returns the value of the symbol presentation. This will be one of: - AS_NONE - none - AS_FIRSTAR - first arrow - AS_LASTAR - last arrow - AS_BOTHAR - both arrows - AS_FIRSTPT - first point - AS_LASTPT - last point - AS_BOTHPT - both points - AS_FIRSTAR_LASTPT - first arrow, last point - AS_FIRSTPT_LASTAR - first point, last arrow

	:rtype: DsgPrs_ArrowSide
") SymbolPrs;
		DsgPrs_ArrowSide SymbolPrs ();
		%feature("compactdefaultargs") SetSymbolPrs;
		%feature("autodoc", "	* Allows you to provide settings for the symbol presentation.

	:param aSymbolPrs:
	:type aSymbolPrs: DsgPrs_ArrowSide
	:rtype: None
") SetSymbolPrs;
		void SetSymbolPrs (const DsgPrs_ArrowSide aSymbolPrs);
		%feature("compactdefaultargs") SetExtShape;
		%feature("autodoc", "	* Allows you to set the status of the extension shape by the index aIndex. The status will be one of the following: - 0 - there is no connection to a shape; - 1 - there is a connection to the first shape; - 2 - there is a connection to the second shape.

	:param aIndex:
	:type aIndex: int
	:rtype: None
") SetExtShape;
		void SetExtShape (const Standard_Integer aIndex);
		%feature("compactdefaultargs") ExtShape;
		%feature("autodoc", "	* Returns the status index of the extension shape.

	:rtype: int
") ExtShape;
		Standard_Integer ExtShape ();
		%feature("compactdefaultargs") AcceptDisplayMode;
		%feature("autodoc", "	* Returns true if the display mode aMode is accepted for the Interactive Objects in the relation. ComputeProjPresentation(me; aPres : Presentation from Prs3d; Curve1 : Curve from Geom; Curve2 : Curve from Geom; FirstP1 : Pnt from gp; LastP1 : Pnt from gp; FirstP2 : Pnt from gp; LastP2 : Pnt from gp; aColor : NameOfColor from Quantity = Quantity_NOC_PURPLE; aWidth : Real  from Standard = 2; aProjTOL : TypeOfLine  from Aspect = Aspect_TOL_DASH; aCallTOL : TypeOfLine  from Aspect = Aspect_TOL_DOT)

	:param aMode:
	:type aMode: int
	:rtype: bool
") AcceptDisplayMode;
		virtual Standard_Boolean AcceptDisplayMode (const Standard_Integer aMode);
		%feature("compactdefaultargs") SetAutomaticPosition;
		%feature("autodoc", "	:param aStatus:
	:type aStatus: bool
	:rtype: None
") SetAutomaticPosition;
		void SetAutomaticPosition (const Standard_Boolean aStatus);
		%feature("compactdefaultargs") AutomaticPosition;
		%feature("autodoc", "	:rtype: bool
") AutomaticPosition;
		Standard_Boolean AutomaticPosition ();
};


%extend AIS_Relation {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_AIS_Relation(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_AIS_Relation::Handle_AIS_Relation %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_AIS_Relation;
class Handle_AIS_Relation : public Handle_AIS_InteractiveObject {

    public:
        // constructors
        Handle_AIS_Relation();
        Handle_AIS_Relation(const Handle_AIS_Relation &aHandle);
        Handle_AIS_Relation(const AIS_Relation *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_AIS_Relation DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_AIS_Relation {
    AIS_Relation* _get_reference() {
    return (AIS_Relation*)$self->Access();
    }
};

%extend Handle_AIS_Relation {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend AIS_Relation {
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
		%feature("compactdefaultargs") Signature;
		%feature("autodoc", "	* Returns index 0. This value refers to SHAPE from TopAbs_ShapeEnum

	:rtype: int
") Signature;
		virtual Standard_Integer Signature ();
		%feature("compactdefaultargs") Type;
		%feature("autodoc", "	* Returns Object as the type of Interactive Object.

	:rtype: AIS_KindOfInteractive
") Type;
		virtual AIS_KindOfInteractive Type ();
		%feature("compactdefaultargs") AcceptShapeDecomposition;
		%feature("autodoc", "	* Returns true if the Interactive Object accepts shape decomposition.

	:rtype: bool
") AcceptShapeDecomposition;
		virtual Standard_Boolean AcceptShapeDecomposition ();
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "	* Constructs an instance of the shape object ashape.

	:param ashap:
	:type ashap: TopoDS_Shape &
	:rtype: None
") Set;
		void Set (const TopoDS_Shape & ashap);
		%feature("compactdefaultargs") Shape;
		%feature("autodoc", "	* Returns this shape object.

	:rtype: TopoDS_Shape
") Shape;
		const TopoDS_Shape  Shape ();
		%feature("compactdefaultargs") SetOwnDeviationCoefficient;
		%feature("autodoc", "	* Sets a local value for deviation coefficient for this specific shape.

	:rtype: bool
") SetOwnDeviationCoefficient;
		Standard_Boolean SetOwnDeviationCoefficient ();
		%feature("compactdefaultargs") SetOwnHLRDeviationCoefficient;
		%feature("autodoc", "	* Sets a local value for HLR deviation coefficient for this specific shape.

	:rtype: bool
") SetOwnHLRDeviationCoefficient;
		Standard_Boolean SetOwnHLRDeviationCoefficient ();
		%feature("compactdefaultargs") SetOwnDeviationAngle;
		%feature("autodoc", "	* Sets a local value for deviation angle for this specific shape.

	:rtype: bool
") SetOwnDeviationAngle;
		Standard_Boolean SetOwnDeviationAngle ();
		%feature("compactdefaultargs") SetOwnHLRDeviationAngle;
		%feature("autodoc", "	* Sets a local value for HLR deviation angle for this specific shape.

	:rtype: bool
") SetOwnHLRDeviationAngle;
		Standard_Boolean SetOwnHLRDeviationAngle ();
		%feature("compactdefaultargs") SetOwnDeviationCoefficient;
		%feature("autodoc", "	* Sets a local value for deviation coefficient for this specific shape.

	:param aCoefficient:
	:type aCoefficient: float
	:rtype: None
") SetOwnDeviationCoefficient;
		void SetOwnDeviationCoefficient (const Standard_Real aCoefficient);
		%feature("compactdefaultargs") SetOwnHLRDeviationCoefficient;
		%feature("autodoc", "	* sets myOwnHLRDeviationCoefficient field in Prs3d_Drawer & recomputes presentation

	:param aCoefficient:
	:type aCoefficient: float
	:rtype: None
") SetOwnHLRDeviationCoefficient;
		void SetOwnHLRDeviationCoefficient (const Standard_Real aCoefficient);
		%feature("compactdefaultargs") SetAngleAndDeviation;
		%feature("autodoc", "	* this compute a new angle and Deviation from the value anAngle and set the values stored in myDrawer with these that become local to the shape

	:param anAngle:
	:type anAngle: float
	:rtype: None
") SetAngleAndDeviation;
		void SetAngleAndDeviation (const Standard_Real anAngle);
		%feature("compactdefaultargs") UserAngle;
		%feature("autodoc", "	* gives back the angle initial value put by the User.

	:rtype: float
") UserAngle;
		Standard_Real UserAngle ();
		%feature("compactdefaultargs") SetOwnDeviationAngle;
		%feature("autodoc", "	* sets myOwnDeviationAngle field in Prs3d_Drawer & recomputes presentation

	:param anAngle:
	:type anAngle: float
	:rtype: None
") SetOwnDeviationAngle;
		void SetOwnDeviationAngle (const Standard_Real anAngle);
		%feature("compactdefaultargs") SetHLRAngleAndDeviation;
		%feature("autodoc", "	* this compute a new Angle and Deviation from the value anAngle for HLR and set the values stored in myDrawer for with these that become local to the shape

	:param anAngle:
	:type anAngle: float
	:rtype: None
") SetHLRAngleAndDeviation;
		void SetHLRAngleAndDeviation (const Standard_Real anAngle);
		%feature("compactdefaultargs") SetOwnHLRDeviationAngle;
		%feature("autodoc", "	* sets myOwnHLRDeviationAngle field in Prs3d_Drawer & recomputes presentation

	:param anAngle:
	:type anAngle: float
	:rtype: None
") SetOwnHLRDeviationAngle;
		void SetOwnHLRDeviationAngle (const Standard_Real anAngle);
		%feature("compactdefaultargs") OwnDeviationCoefficient;
		%feature("autodoc", "	* Returns true and the values of the deviation coefficient aCoefficient and the previous deviation coefficient aPreviousCoefficient. If these values are not already set, false is returned.

	:param aCoefficient:
	:type aCoefficient: float &
	:param aPreviousCoefficient:
	:type aPreviousCoefficient: float &
	:rtype: bool
") OwnDeviationCoefficient;
		Standard_Boolean OwnDeviationCoefficient (Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") OwnHLRDeviationCoefficient;
		%feature("autodoc", "	* Returns true and the values of the HLR deviation coefficient aCoefficient and the previous HLR deviation coefficient aPreviousCoefficient. If these values are not already set, false is returned.

	:param aCoefficient:
	:type aCoefficient: float &
	:param aPreviousCoefficient:
	:type aPreviousCoefficient: float &
	:rtype: bool
") OwnHLRDeviationCoefficient;
		Standard_Boolean OwnHLRDeviationCoefficient (Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") OwnDeviationAngle;
		%feature("autodoc", "	* Returns true and the values of the deviation angle anAngle and the previous deviation angle aPreviousAngle. If these values are not already set, false is returned.

	:param anAngle:
	:type anAngle: float &
	:param aPreviousAngle:
	:type aPreviousAngle: float &
	:rtype: bool
") OwnDeviationAngle;
		Standard_Boolean OwnDeviationAngle (Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") OwnHLRDeviationAngle;
		%feature("autodoc", "	* Returns true and the values of the HLR deviation angle anAngle and of the previous HLR deviation angle aPreviousAngle. If these values are not already set, false is returned.

	:param anAngle:
	:type anAngle: float &
	:param aPreviousAngle:
	:type aPreviousAngle: float &
	:rtype: bool
") OwnHLRDeviationAngle;
		Standard_Boolean OwnHLRDeviationAngle (Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") SetTypeOfHLR;
		%feature("autodoc", "	* Sets the type of HLR algorithm used by the shape

	:param theTypeOfHLR:
	:type theTypeOfHLR: Prs3d_TypeOfHLR
	:rtype: None
") SetTypeOfHLR;
		void SetTypeOfHLR (const Prs3d_TypeOfHLR theTypeOfHLR);
		%feature("compactdefaultargs") TypeOfHLR;
		%feature("autodoc", "	* Gets the type of HLR algorithm

	:rtype: Prs3d_TypeOfHLR
") TypeOfHLR;
		Prs3d_TypeOfHLR TypeOfHLR ();
		%feature("compactdefaultargs") SetColor;
		%feature("autodoc", "	* Sets the color aColor in the reconstructed compound shape. Acts via the Drawer methods below on the appearance of: - free boundaries: Prs3d_Drawer_FreeBoundaryAspect, - isos: Prs3d_Drawer_UIsoAspect, Prs3dDrawer_VIsoAspect, - shared boundaries: Prs3d_Drawer_UnFreeBoundaryAspect, - shading: Prs3d_Drawer_ShadingAspect, - visible line color in hidden line mode: Prs3d_Drawer_SeenLineAspect - hidden line color in hidden line mode: Prs3d_Drawer_HiddenLineAspect.

	:param aColor:
	:type aColor: Quantity_NameOfColor
	:rtype: void
") SetColor;
		virtual void SetColor (const Quantity_NameOfColor aColor);
		%feature("compactdefaultargs") SetColor;
		%feature("autodoc", "	:param aColor:
	:type aColor: Quantity_Color &
	:rtype: void
") SetColor;
		virtual void SetColor (const Quantity_Color & aColor);
		%feature("compactdefaultargs") UnsetColor;
		%feature("autodoc", "	* Removes settings for color in the reconstructed compound shape.

	:rtype: void
") UnsetColor;
		virtual void UnsetColor ();
		%feature("compactdefaultargs") SetWidth;
		%feature("autodoc", "	* Sets the value aValue for line width in the reconstructed compound shape. Changes line aspects for lines-only presentation modes like Wireframe and Bounding Box. Doesn't change face boundary line aspect.

	:param aValue:
	:type aValue: float
	:rtype: void
") SetWidth;
		virtual void SetWidth (const Standard_Real aValue);
		%feature("compactdefaultargs") UnsetWidth;
		%feature("autodoc", "	* Removes the setting for line width in the reconstructed compound shape.

	:rtype: void
") UnsetWidth;
		virtual void UnsetWidth ();
		%feature("compactdefaultargs") SetMaterial;
		%feature("autodoc", "	:param aName:
	:type aName: Graphic3d_NameOfMaterial
	:rtype: void
") SetMaterial;
		virtual void SetMaterial (const Graphic3d_NameOfMaterial aName);
		%feature("compactdefaultargs") SetMaterial;
		%feature("autodoc", "	* Allows you to provide settings for the material aName in the reconstructed compound shape.

	:param aName:
	:type aName: Graphic3d_MaterialAspect &
	:rtype: void
") SetMaterial;
		virtual void SetMaterial (const Graphic3d_MaterialAspect & aName);
		%feature("compactdefaultargs") UnsetMaterial;
		%feature("autodoc", "	* Removes settings for material in the reconstructed compound shape.

	:rtype: void
") UnsetMaterial;
		virtual void UnsetMaterial ();
		%feature("compactdefaultargs") SetTransparency;
		%feature("autodoc", "	* Sets the value aValue for transparency in the reconstructed compound shape.

	:param aValue: default value is 0.6
	:type aValue: float
	:rtype: void
") SetTransparency;
		virtual void SetTransparency (const Standard_Real aValue = 0.6);
		%feature("compactdefaultargs") UnsetTransparency;
		%feature("autodoc", "	* Removes the setting for transparency in the reconstructed compound shape.

	:rtype: void
") UnsetTransparency;
		virtual void UnsetTransparency ();
		%feature("compactdefaultargs") BoundingBox;
		%feature("autodoc", "	* Constructs a bounding box with which to reconstruct compound topological shapes for presentation.

	:rtype: Bnd_Box
") BoundingBox;
		virtual const Bnd_Box & BoundingBox ();
		%feature("compactdefaultargs") Color;
		%feature("autodoc", "	* Returns the NameOfColor attributes of the shape accordingly to the current facing model;

	:rtype: Quantity_NameOfColor
") Color;
		virtual Quantity_NameOfColor Color ();
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
		%feature("compactdefaultargs") Transparency;
		%feature("autodoc", "	* Returns the transparency attributes of the shape accordingly to the current facing model;

	:rtype: float
") Transparency;
		virtual Standard_Real Transparency ();
		%feature("compactdefaultargs") SelectionType;
		%feature("autodoc", "	* Activates the same TopAbs shape enumerations as those used by SelectionMode assigning a type to the mode aDecompositionMode.

	:param aDecompositionMode:
	:type aDecompositionMode: int
	:rtype: TopAbs_ShapeEnum
") SelectionType;
		static TopAbs_ShapeEnum SelectionType (const Standard_Integer aDecompositionMode);
		%feature("compactdefaultargs") SelectionMode;
		%feature("autodoc", "	* Establishes an equivalence between a mode and the type, aShapeType, of selection. The correspondences are as follows: - mode 0 - Shape - mode 1 - Vertex - mode 2 - Edge - mode 3 - Wire - mode 4 - Face - mode 5 - Shell - mode 6 - Solid - mode 7 - Compsolid - mode 8 - Compound

	:param aShapeType:
	:type aShapeType: TopAbs_ShapeEnum
	:rtype: int
") SelectionMode;
		static Standard_Integer SelectionMode (const TopAbs_ShapeEnum aShapeType);
};


%extend AIS_Shape {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_AIS_Shape(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_AIS_Shape::Handle_AIS_Shape %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_AIS_Shape;
class Handle_AIS_Shape : public Handle_AIS_InteractiveObject {

    public:
        // constructors
        Handle_AIS_Shape();
        Handle_AIS_Shape(const Handle_AIS_Shape &aHandle);
        Handle_AIS_Shape(const AIS_Shape *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_AIS_Shape DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_AIS_Shape {
    AIS_Shape* _get_reference() {
    return (AIS_Shape*)$self->Access();
    }
};

%extend Handle_AIS_Shape {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

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
	:type anobj: Handle_SelectMgr_EntityOwner &
	:rtype: bool
") IsOk;
		Standard_Boolean IsOk (const Handle_SelectMgr_EntityOwner & anobj);
};


%extend AIS_SignatureFilter {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_AIS_SignatureFilter(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_AIS_SignatureFilter::Handle_AIS_SignatureFilter %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_AIS_SignatureFilter;
class Handle_AIS_SignatureFilter : public Handle_AIS_TypeFilter {

    public:
        // constructors
        Handle_AIS_SignatureFilter();
        Handle_AIS_SignatureFilter(const Handle_AIS_SignatureFilter &aHandle);
        Handle_AIS_SignatureFilter(const AIS_SignatureFilter *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_AIS_SignatureFilter DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_AIS_SignatureFilter {
    AIS_SignatureFilter* _get_reference() {
    return (AIS_SignatureFilter*)$self->Access();
    }
};

%extend Handle_AIS_SignatureFilter {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

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
		%feature("compactdefaultargs") SetColor;
		%feature("autodoc", "	* Setup color of entire text.

	:param theColor:
	:type theColor: Quantity_Color &
	:rtype: void
") SetColor;
		virtual void SetColor (const Quantity_Color & theColor);
		%feature("compactdefaultargs") SetColor;
		%feature("autodoc", "	* Setup color of entire text.

	:param theColor:
	:type theColor: Quantity_NameOfColor
	:rtype: void
") SetColor;
		virtual void SetColor (const Quantity_NameOfColor theColor);
		%feature("compactdefaultargs") SetText;
		%feature("autodoc", "	* Setup text.

	:param theText:
	:type theText: TCollection_ExtendedString &
	:rtype: None
") SetText;
		void SetText (const TCollection_ExtendedString & theText);
		%feature("compactdefaultargs") SetPosition;
		%feature("autodoc", "	* Setup position.

	:param thePosition:
	:type thePosition: gp_Pnt
	:rtype: None
") SetPosition;
		void SetPosition (const gp_Pnt & thePosition);
		%feature("compactdefaultargs") SetHJustification;
		%feature("autodoc", "	* Setup horizontal justification.

	:param theHJust:
	:type theHJust: Graphic3d_HorizontalTextAlignment
	:rtype: None
") SetHJustification;
		void SetHJustification (const Graphic3d_HorizontalTextAlignment theHJust);
		%feature("compactdefaultargs") SetVJustification;
		%feature("autodoc", "	* Setup vertical justification.

	:param theVJust:
	:type theVJust: Graphic3d_VerticalTextAlignment
	:rtype: None
") SetVJustification;
		void SetVJustification (const Graphic3d_VerticalTextAlignment theVJust);
		%feature("compactdefaultargs") SetAngle;
		%feature("autodoc", "	* Setup angle.

	:param theAngle:
	:type theAngle: float
	:rtype: None
") SetAngle;
		void SetAngle (const Standard_Real theAngle);
		%feature("compactdefaultargs") SetZoomable;
		%feature("autodoc", "	* Setup zoomable property.

	:param theIsZoomable:
	:type theIsZoomable: bool
	:rtype: None
") SetZoomable;
		void SetZoomable (const Standard_Boolean theIsZoomable);
		%feature("compactdefaultargs") SetHeight;
		%feature("autodoc", "	* Setup height.

	:param theHeight:
	:type theHeight: float
	:rtype: None
") SetHeight;
		void SetHeight (const Standard_Real theHeight);
		%feature("compactdefaultargs") SetFontAspect;
		%feature("autodoc", "	* Setup font aspect.

	:param theFontAspect:
	:type theFontAspect: Font_FontAspect
	:rtype: None
") SetFontAspect;
		void SetFontAspect (const Font_FontAspect theFontAspect);
		%feature("compactdefaultargs") SetFont;
		%feature("autodoc", "	* Setup font.

	:param theFont:
	:type theFont: char *
	:rtype: None
") SetFont;
		void SetFont (const char * theFont);
		%feature("compactdefaultargs") DEFINE_STANDARD_RTTI;
		%feature("autodoc", "	* CASCADE RTTI

	:param :
	:type : AIS_TextLabel
	:rtype: None
") DEFINE_STANDARD_RTTI;
		 DEFINE_STANDARD_RTTI (AIS_TextLabel );
};


%extend AIS_TextLabel {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_AIS_TextLabel(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_AIS_TextLabel::Handle_AIS_TextLabel %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_AIS_TextLabel;
class Handle_AIS_TextLabel : public Handle_AIS_InteractiveObject {

    public:
        // constructors
        Handle_AIS_TextLabel();
        Handle_AIS_TextLabel(const Handle_AIS_TextLabel &aHandle);
        Handle_AIS_TextLabel(const AIS_TextLabel *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_AIS_TextLabel DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_AIS_TextLabel {
    AIS_TextLabel* _get_reference() {
    return (AIS_TextLabel*)$self->Access();
    }
};

%extend Handle_AIS_TextLabel {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

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
	:type aTriangulation: Handle_Poly_Triangulation &
	:rtype: None
") AIS_Triangulation;
		 AIS_Triangulation (const Handle_Poly_Triangulation & aTriangulation);
		%feature("compactdefaultargs") SetColors;
		%feature("autodoc", "	* Set the color for each node. Each 32-bit color is Alpha << 24 + Blue << 16 + Green << 8 + Red Order of color components is essential for further usage by OpenGL

	:param aColor:
	:type aColor: Handle_TColStd_HArray1OfInteger &
	:rtype: None
") SetColors;
		void SetColors (const Handle_TColStd_HArray1OfInteger & aColor);
		%feature("compactdefaultargs") GetColors;
		%feature("autodoc", "	* Get the color for each node. Each 32-bit color is Alpha << 24 + Blue << 16 + Green << 8 + Red

	:rtype: Handle_TColStd_HArray1OfInteger
") GetColors;
		Handle_TColStd_HArray1OfInteger GetColors ();
		%feature("compactdefaultargs") SetTriangulation;
		%feature("autodoc", "	:param aTriangulation:
	:type aTriangulation: Handle_Poly_Triangulation &
	:rtype: None
") SetTriangulation;
		void SetTriangulation (const Handle_Poly_Triangulation & aTriangulation);
		%feature("compactdefaultargs") GetTriangulation;
		%feature("autodoc", "	* Returns Poly_Triangulation .

	:rtype: Handle_Poly_Triangulation
") GetTriangulation;
		Handle_Poly_Triangulation GetTriangulation ();
};


%extend AIS_Triangulation {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_AIS_Triangulation(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_AIS_Triangulation::Handle_AIS_Triangulation %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_AIS_Triangulation;
class Handle_AIS_Triangulation : public Handle_AIS_InteractiveObject {

    public:
        // constructors
        Handle_AIS_Triangulation();
        Handle_AIS_Triangulation(const Handle_AIS_Triangulation &aHandle);
        Handle_AIS_Triangulation(const AIS_Triangulation *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_AIS_Triangulation DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_AIS_Triangulation {
    AIS_Triangulation* _get_reference() {
    return (AIS_Triangulation*)$self->Access();
    }
};

%extend Handle_AIS_Triangulation {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

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

	:param aComponent:
	:type aComponent: Handle_Geom_Axis2Placement &
	:rtype: None
") AIS_Trihedron;
		 AIS_Trihedron (const Handle_Geom_Axis2Placement & aComponent);
		%feature("compactdefaultargs") Component;
		%feature("autodoc", "	* Returns the right-handed coordinate system set in SetComponent.

	:rtype: Handle_Geom_Axis2Placement
") Component;
		Handle_Geom_Axis2Placement Component ();
		%feature("compactdefaultargs") SetComponent;
		%feature("autodoc", "	* Constructs the right-handed coordinate system aComponent.

	:param aComponent:
	:type aComponent: Handle_Geom_Axis2Placement &
	:rtype: None
") SetComponent;
		void SetComponent (const Handle_Geom_Axis2Placement & aComponent);
		%feature("compactdefaultargs") HasOwnSize;
		%feature("autodoc", "	* Returns true if the trihedron object has a size other than the default size of 100 mm. along each axis.

	:rtype: bool
") HasOwnSize;
		Standard_Boolean HasOwnSize ();
		%feature("compactdefaultargs") SetSize;
		%feature("autodoc", "	* Sets the size aValue for the trihedron object. The default value is 100 mm.

	:param aValue:
	:type aValue: float
	:rtype: None
") SetSize;
		void SetSize (const Standard_Real aValue);
		%feature("compactdefaultargs") UnsetSize;
		%feature("autodoc", "	* Removes any non-default settings for size of this trihedron object.

	:rtype: None
") UnsetSize;
		void UnsetSize ();
		%feature("compactdefaultargs") Size;
		%feature("autodoc", "	:rtype: float
") Size;
		Standard_Real Size ();
		%feature("compactdefaultargs") XAxis;
		%feature("autodoc", "	* Returns the 'XAxis'.

	:rtype: Handle_AIS_Axis
") XAxis;
		Handle_AIS_Axis XAxis ();
		%feature("compactdefaultargs") YAxis;
		%feature("autodoc", "	* Returns the 'YAxis'.

	:rtype: Handle_AIS_Axis
") YAxis;
		Handle_AIS_Axis YAxis ();
		%feature("compactdefaultargs") Axis;
		%feature("autodoc", "	* Returns the main Axis.

	:rtype: Handle_AIS_Axis
") Axis;
		Handle_AIS_Axis Axis ();
		%feature("compactdefaultargs") Position;
		%feature("autodoc", "	* Returns the origine.

	:rtype: Handle_AIS_Point
") Position;
		Handle_AIS_Point Position ();
		%feature("compactdefaultargs") XYPlane;
		%feature("autodoc", "	* Returns the 'XYPlane'.

	:rtype: Handle_AIS_Plane
") XYPlane;
		Handle_AIS_Plane XYPlane ();
		%feature("compactdefaultargs") XZPlane;
		%feature("autodoc", "	* Returns the 'XZPlane'.

	:rtype: Handle_AIS_Plane
") XZPlane;
		Handle_AIS_Plane XZPlane ();
		%feature("compactdefaultargs") YZPlane;
		%feature("autodoc", "	* Returns the 'YZPlane'.

	:rtype: Handle_AIS_Plane
") YZPlane;
		Handle_AIS_Plane YZPlane ();
		%feature("compactdefaultargs") SetContext;
		%feature("autodoc", "	* connection to <aCtx> default drawer implies a recomputation of SubObjects values.

	:param aCtx:
	:type aCtx: Handle_AIS_InteractiveContext &
	:rtype: void
") SetContext;
		virtual void SetContext (const Handle_AIS_InteractiveContext & aCtx);
		%feature("compactdefaultargs") AcceptDisplayMode;
		%feature("autodoc", "	* Returns true if the display mode selected, aMode, is valid for trihedron datums.

	:param aMode:
	:type aMode: int
	:rtype: bool
") AcceptDisplayMode;
		Standard_Boolean AcceptDisplayMode (const Standard_Integer aMode);
		%feature("compactdefaultargs") Compute;
		%feature("autodoc", "	* Computes the presentation according to a point of view given by <aProjector>. To be Used when the associated degenerated Presentations have been transformed by <aTrsf> which is not a Pure Translation. The HLR Prs can't be deducted automatically WARNING :<aTrsf> must be applied to the object to display before computation !!!

	:param aProjector:
	:type aProjector: Handle_Prs3d_Projector &
	:param aTrsf:
	:type aTrsf: Handle_Geom_Transformation &
	:param aPresentation:
	:type aPresentation: Handle_Prs3d_Presentation &
	:rtype: void
") Compute;
		virtual void Compute (const Handle_Prs3d_Projector & aProjector,const Handle_Geom_Transformation & aTrsf,const Handle_Prs3d_Presentation & aPresentation);
		%feature("compactdefaultargs") SetLocalTransformation;
		%feature("autodoc", "	:param theTransformation:
	:type theTransformation: gp_Trsf
	:rtype: None
") SetLocalTransformation;
		void SetLocalTransformation (const gp_Trsf & theTransformation);
		%feature("compactdefaultargs") Signature;
		%feature("autodoc", "	* Returns index 3, selection of the planes XOY, YOZ, XOZ.

	:rtype: int
") Signature;
		virtual Standard_Integer Signature ();
		%feature("compactdefaultargs") Type;
		%feature("autodoc", "	* Indicates that the type of Interactive Object is datum.

	:rtype: AIS_KindOfInteractive
") Type;
		virtual AIS_KindOfInteractive Type ();
		%feature("compactdefaultargs") SetColor;
		%feature("autodoc", "	:param aColor:
	:type aColor: Quantity_NameOfColor
	:rtype: None
") SetColor;
		void SetColor (const Quantity_NameOfColor aColor);
		%feature("compactdefaultargs") SetColor;
		%feature("autodoc", "	* Sets the color aColor for this trihedron object.

	:param aColor:
	:type aColor: Quantity_Color &
	:rtype: None
") SetColor;
		void SetColor (const Quantity_Color & aColor);
		%feature("compactdefaultargs") SetTextColor;
		%feature("autodoc", "	:param aColor:
	:type aColor: Quantity_NameOfColor
	:rtype: None
") SetTextColor;
		void SetTextColor (const Quantity_NameOfColor aColor);
		%feature("compactdefaultargs") HasTextColor;
		%feature("autodoc", "	:rtype: bool
") HasTextColor;
		Standard_Boolean HasTextColor ();
		%feature("compactdefaultargs") TextColor;
		%feature("autodoc", "	:rtype: Quantity_NameOfColor
") TextColor;
		Quantity_NameOfColor TextColor ();
		%feature("compactdefaultargs") SetArrowColor;
		%feature("autodoc", "	:param aColor:
	:type aColor: Quantity_NameOfColor
	:rtype: None
") SetArrowColor;
		void SetArrowColor (const Quantity_NameOfColor aColor);
		%feature("compactdefaultargs") HasArrowColor;
		%feature("autodoc", "	:rtype: bool
") HasArrowColor;
		Standard_Boolean HasArrowColor ();
		%feature("compactdefaultargs") ArrowColor;
		%feature("autodoc", "	:rtype: Quantity_NameOfColor
") ArrowColor;
		Quantity_NameOfColor ArrowColor ();
		%feature("compactdefaultargs") ExtremityPoints;
		%feature("autodoc", "	* Returns the four extremities of the trihedron from the array of points, TheExtrem.

	:param TheExtrem:
	:type TheExtrem: TColgp_Array1OfPnt
	:rtype: None
") ExtremityPoints;
		void ExtremityPoints (TColgp_Array1OfPnt & TheExtrem);
		%feature("compactdefaultargs") UnsetColor;
		%feature("autodoc", "	* Removes the settings for color.

	:rtype: None
") UnsetColor;
		void UnsetColor ();
		%feature("compactdefaultargs") UnsetWidth;
		%feature("autodoc", "	* Removes the non-default settings for width set in SetWidth.

	:rtype: None
") UnsetWidth;
		void UnsetWidth ();
};


%extend AIS_Trihedron {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_AIS_Trihedron(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_AIS_Trihedron::Handle_AIS_Trihedron %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_AIS_Trihedron;
class Handle_AIS_Trihedron : public Handle_AIS_InteractiveObject {

    public:
        // constructors
        Handle_AIS_Trihedron();
        Handle_AIS_Trihedron(const Handle_AIS_Trihedron &aHandle);
        Handle_AIS_Trihedron(const AIS_Trihedron *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_AIS_Trihedron DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_AIS_Trihedron {
    AIS_Trihedron* _get_reference() {
    return (AIS_Trihedron*)$self->Access();
    }
};

%extend Handle_AIS_Trihedron {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend AIS_Trihedron {
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
		%feature("compactdefaultargs") FirstPoint;
		%feature("autodoc", "	* returns first point forming the angle.

	:rtype: gp_Pnt
") FirstPoint;
		const gp_Pnt  FirstPoint ();
		%feature("compactdefaultargs") SecondPoint;
		%feature("autodoc", "	* returns second point forming the angle.

	:rtype: gp_Pnt
") SecondPoint;
		const gp_Pnt  SecondPoint ();
		%feature("compactdefaultargs") CenterPoint;
		%feature("autodoc", "	* returns center point forming the angle.

	:rtype: gp_Pnt
") CenterPoint;
		const gp_Pnt  CenterPoint ();
		%feature("compactdefaultargs") FirstShape;
		%feature("autodoc", "	* returns first argument shape.

	:rtype: TopoDS_Shape
") FirstShape;
		const TopoDS_Shape  FirstShape ();
		%feature("compactdefaultargs") SecondShape;
		%feature("autodoc", "	* returns second argument shape.

	:rtype: TopoDS_Shape
") SecondShape;
		const TopoDS_Shape  SecondShape ();
		%feature("compactdefaultargs") ThirdShape;
		%feature("autodoc", "	* returns third argument shape.

	:rtype: TopoDS_Shape
") ThirdShape;
		const TopoDS_Shape  ThirdShape ();
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
		%feature("compactdefaultargs") SetDisplayUnits;
		%feature("autodoc", "	:param theUnits:
	:type theUnits: TCollection_AsciiString &
	:rtype: void
") SetDisplayUnits;
		virtual void SetDisplayUnits (const TCollection_AsciiString & theUnits);
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
		%feature("compactdefaultargs") GetTextPosition;
		%feature("autodoc", "	:rtype: gp_Pnt
") GetTextPosition;
		virtual const gp_Pnt GetTextPosition ();
};


%extend AIS_AngleDimension {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_AIS_AngleDimension(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_AIS_AngleDimension::Handle_AIS_AngleDimension %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_AIS_AngleDimension;
class Handle_AIS_AngleDimension : public Handle_AIS_Dimension {

    public:
        // constructors
        Handle_AIS_AngleDimension();
        Handle_AIS_AngleDimension(const Handle_AIS_AngleDimension &aHandle);
        Handle_AIS_AngleDimension(const AIS_AngleDimension *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_AIS_AngleDimension DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_AIS_AngleDimension {
    AIS_AngleDimension* _get_reference() {
    return (AIS_AngleDimension*)$self->Access();
    }
};

%extend Handle_AIS_AngleDimension {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

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
	:type aPlane: Handle_Geom_Plane &
	:param aVal:
	:type aVal: float
	:param aText:
	:type aText: TCollection_ExtendedString &
	:rtype: None
") AIS_Chamf2dDimension;
		 AIS_Chamf2dDimension (const TopoDS_Shape & aFShape,const Handle_Geom_Plane & aPlane,const Standard_Real aVal,const TCollection_ExtendedString & aText);
		%feature("compactdefaultargs") AIS_Chamf2dDimension;
		%feature("autodoc", "	* Constructs the display object for 2D chamfers. This object is defined by the face aFShape, the plane aPlane, the dimension aVal, the position aPosition, the type of arrow aSymbolPrs with the size anArrowSize, and the text aText.

	:param aFShape:
	:type aFShape: TopoDS_Shape &
	:param aPlane:
	:type aPlane: Handle_Geom_Plane &
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
		 AIS_Chamf2dDimension (const TopoDS_Shape & aFShape,const Handle_Geom_Plane & aPlane,const Standard_Real aVal,const TCollection_ExtendedString & aText,const gp_Pnt & aPosition,const DsgPrs_ArrowSide aSymbolPrs,const Standard_Real anArrowSize = 0.0);
		%feature("compactdefaultargs") KindOfDimension;
		%feature("autodoc", "	* Indicates that we are concerned with a 2d length.

	:rtype: AIS_KindOfDimension
") KindOfDimension;
		AIS_KindOfDimension KindOfDimension ();
		%feature("compactdefaultargs") IsMovable;
		%feature("autodoc", "	* Returns true if the 2d chamfer dimension is movable.

	:rtype: bool
") IsMovable;
		Standard_Boolean IsMovable ();
		%feature("compactdefaultargs") Compute;
		%feature("autodoc", "	* computes the presentation according to a point of view given by <aProjector>. To be Used when the associated degenerated Presentations have been transformed by <aTrsf> which is not a Pure Translation. The HLR Prs can't be deducted automatically WARNING :<aTrsf> must be applied to the object to display before computation !!!

	:param aProjector:
	:type aProjector: Handle_Prs3d_Projector &
	:param aTrsf:
	:type aTrsf: Handle_Geom_Transformation &
	:param aPresentation:
	:type aPresentation: Handle_Prs3d_Presentation &
	:rtype: void
") Compute;
		virtual void Compute (const Handle_Prs3d_Projector & aProjector,const Handle_Geom_Transformation & aTrsf,const Handle_Prs3d_Presentation & aPresentation);
};


%extend AIS_Chamf2dDimension {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_AIS_Chamf2dDimension(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_AIS_Chamf2dDimension::Handle_AIS_Chamf2dDimension %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_AIS_Chamf2dDimension;
class Handle_AIS_Chamf2dDimension : public Handle_AIS_Relation {

    public:
        // constructors
        Handle_AIS_Chamf2dDimension();
        Handle_AIS_Chamf2dDimension(const Handle_AIS_Chamf2dDimension &aHandle);
        Handle_AIS_Chamf2dDimension(const AIS_Chamf2dDimension *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_AIS_Chamf2dDimension DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_AIS_Chamf2dDimension {
    AIS_Chamf2dDimension* _get_reference() {
    return (AIS_Chamf2dDimension*)$self->Access();
    }
};

%extend Handle_AIS_Chamf2dDimension {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

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
		%feature("compactdefaultargs") KindOfDimension;
		%feature("autodoc", "	* Indicates that we are concerned with a 3d length.

	:rtype: AIS_KindOfDimension
") KindOfDimension;
		AIS_KindOfDimension KindOfDimension ();
		%feature("compactdefaultargs") IsMovable;
		%feature("autodoc", "	* Returns true if the 3d chamfer dimension is movable.

	:rtype: bool
") IsMovable;
		Standard_Boolean IsMovable ();
		%feature("compactdefaultargs") Compute;
		%feature("autodoc", "	* computes the presentation according to a point of view given by <aProjector>. To be Used when the associated degenerated Presentations have been transformed by <aTrsf> which is not a Pure Translation. The HLR Prs can't be deducted automatically WARNING :<aTrsf> must be applied to the object to display before computation !!!

	:param aProjector:
	:type aProjector: Handle_Prs3d_Projector &
	:param aTrsf:
	:type aTrsf: Handle_Geom_Transformation &
	:param aPresentation:
	:type aPresentation: Handle_Prs3d_Presentation &
	:rtype: void
") Compute;
		virtual void Compute (const Handle_Prs3d_Projector & aProjector,const Handle_Geom_Transformation & aTrsf,const Handle_Prs3d_Presentation & aPresentation);
};


%extend AIS_Chamf3dDimension {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_AIS_Chamf3dDimension(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_AIS_Chamf3dDimension::Handle_AIS_Chamf3dDimension %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_AIS_Chamf3dDimension;
class Handle_AIS_Chamf3dDimension : public Handle_AIS_Relation {

    public:
        // constructors
        Handle_AIS_Chamf3dDimension();
        Handle_AIS_Chamf3dDimension(const Handle_AIS_Chamf3dDimension &aHandle);
        Handle_AIS_Chamf3dDimension(const AIS_Chamf3dDimension *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_AIS_Chamf3dDimension DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_AIS_Chamf3dDimension {
    AIS_Chamf3dDimension* _get_reference() {
    return (AIS_Chamf3dDimension*)$self->Access();
    }
};

%extend Handle_AIS_Chamf3dDimension {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

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
	:type theShape: Handle_AIS_Shape &
	:rtype: None
") AIS_ColoredShape;
		 AIS_ColoredShape (const Handle_AIS_Shape & theShape);
		%feature("compactdefaultargs") CustomAspects;
		%feature("autodoc", "	* @name sub-shape aspects Customize properties of specified sub-shape. The shape will be stored in the map but ignored, if it is not sub-shape of main Shape! This method can be used to mark sub-shapes with customizable properties.

	:param theShape:
	:type theShape: TopoDS_Shape &
	:rtype: Handle_AIS_ColoredDrawer
") CustomAspects;
		Handle_AIS_ColoredDrawer CustomAspects (const TopoDS_Shape & theShape);
		%feature("compactdefaultargs") ClearCustomAspects;
		%feature("autodoc", "	* Reset the map of custom sub-shape aspects.

	:rtype: None
") ClearCustomAspects;
		void ClearCustomAspects ();
		%feature("compactdefaultargs") UnsetCustomAspects;
		%feature("autodoc", "	* Reset custom properties of specified sub-shape. @param theToUnregister unregister or not sub-shape from the map

	:param theShape:
	:type theShape: TopoDS_Shape &
	:param theToUnregister: default value is Standard_False
	:type theToUnregister: bool
	:rtype: None
") UnsetCustomAspects;
		void UnsetCustomAspects (const TopoDS_Shape & theShape,const Standard_Boolean theToUnregister = Standard_False);
		%feature("compactdefaultargs") SetCustomColor;
		%feature("autodoc", "	* Customize color of specified sub-shape

	:param theShape:
	:type theShape: TopoDS_Shape &
	:param theColor:
	:type theColor: Quantity_Color &
	:rtype: None
") SetCustomColor;
		void SetCustomColor (const TopoDS_Shape & theShape,const Quantity_Color & theColor);
		%feature("compactdefaultargs") SetCustomWidth;
		%feature("autodoc", "	* Customize line width of specified sub-shape

	:param theShape:
	:type theShape: TopoDS_Shape &
	:param theLineWidth:
	:type theLineWidth: float
	:rtype: None
") SetCustomWidth;
		void SetCustomWidth (const TopoDS_Shape & theShape,const Standard_Real theLineWidth);
		%feature("compactdefaultargs") SetColor;
		%feature("autodoc", "	* @name global aspects Setup color of entire shape.

	:param theColor:
	:type theColor: Quantity_Color &
	:rtype: void
") SetColor;
		virtual void SetColor (const Quantity_Color & theColor);
		%feature("compactdefaultargs") SetWidth;
		%feature("autodoc", "	* Setup line width of entire shape.

	:param theLineWidth:
	:type theLineWidth: float
	:rtype: void
") SetWidth;
		virtual void SetWidth (const Standard_Real theLineWidth);
		%feature("compactdefaultargs") SetTransparency;
		%feature("autodoc", "	* Sets transparency value.

	:param theValue:
	:type theValue: float
	:rtype: void
") SetTransparency;
		virtual void SetTransparency (const Standard_Real theValue);
		%feature("compactdefaultargs") SetMaterial;
		%feature("autodoc", "	* Sets the material aspect.

	:param theAspect:
	:type theAspect: Graphic3d_MaterialAspect &
	:rtype: void
") SetMaterial;
		virtual void SetMaterial (const Graphic3d_MaterialAspect & theAspect);
		%feature("compactdefaultargs") DEFINE_STANDARD_RTTI;
		%feature("autodoc", "	:param :
	:type : AIS_ColoredShape
	:rtype: None
") DEFINE_STANDARD_RTTI;
		 DEFINE_STANDARD_RTTI (AIS_ColoredShape );
};


%extend AIS_ColoredShape {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_AIS_ColoredShape(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_AIS_ColoredShape::Handle_AIS_ColoredShape %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_AIS_ColoredShape;
class Handle_AIS_ColoredShape : public Handle_AIS_Shape {

    public:
        // constructors
        Handle_AIS_ColoredShape();
        Handle_AIS_ColoredShape(const Handle_AIS_ColoredShape &aHandle);
        Handle_AIS_ColoredShape(const AIS_ColoredShape *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_AIS_ColoredShape DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_AIS_ColoredShape {
    AIS_ColoredShape* _get_reference() {
    return (AIS_ColoredShape*)$self->Access();
    }
};

%extend Handle_AIS_ColoredShape {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

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
	:type aPlane: Handle_Geom_Plane &
	:rtype: None
") AIS_ConcentricRelation;
		 AIS_ConcentricRelation (const TopoDS_Shape & aFShape,const TopoDS_Shape & aSShape,const Handle_Geom_Plane & aPlane);
		%feature("compactdefaultargs") Compute;
		%feature("autodoc", "	* computes the presentation according to a point of view given by <aProjector>. To be Used when the associated degenerated Presentations have been transformed by <aTrsf> which is not a Pure Translation. The HLR Prs can't be deducted automatically WARNING :<aTrsf> must be applied to the object to display before computation !!!

	:param aProjector:
	:type aProjector: Handle_Prs3d_Projector &
	:param aTrsf:
	:type aTrsf: Handle_Geom_Transformation &
	:param aPresentation:
	:type aPresentation: Handle_Prs3d_Presentation &
	:rtype: void
") Compute;
		virtual void Compute (const Handle_Prs3d_Projector & aProjector,const Handle_Geom_Transformation & aTrsf,const Handle_Prs3d_Presentation & aPresentation);
};


%extend AIS_ConcentricRelation {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_AIS_ConcentricRelation(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_AIS_ConcentricRelation::Handle_AIS_ConcentricRelation %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_AIS_ConcentricRelation;
class Handle_AIS_ConcentricRelation : public Handle_AIS_Relation {

    public:
        // constructors
        Handle_AIS_ConcentricRelation();
        Handle_AIS_ConcentricRelation(const Handle_AIS_ConcentricRelation &aHandle);
        Handle_AIS_ConcentricRelation(const AIS_ConcentricRelation *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_AIS_ConcentricRelation DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_AIS_ConcentricRelation {
    AIS_ConcentricRelation* _get_reference() {
    return (AIS_ConcentricRelation*)$self->Access();
    }
};

%extend Handle_AIS_ConcentricRelation {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

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
		%feature("compactdefaultargs") Circle;
		%feature("autodoc", "	* returns measured geometry circle.

	:rtype: gp_Circ
") Circle;
		const gp_Circ  Circle ();
		%feature("compactdefaultargs") AnchorPoint;
		%feature("autodoc", "	* returns anchor point on circle for diameter dimension.

	:rtype: gp_Pnt
") AnchorPoint;
		gp_Pnt AnchorPoint ();
		%feature("compactdefaultargs") Shape;
		%feature("autodoc", "	* returns the measured shape.

	:rtype: TopoDS_Shape
") Shape;
		const TopoDS_Shape  Shape ();
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
		%feature("compactdefaultargs") SetDisplayUnits;
		%feature("autodoc", "	:param theUnits:
	:type theUnits: TCollection_AsciiString &
	:rtype: void
") SetDisplayUnits;
		virtual void SetDisplayUnits (const TCollection_AsciiString & theUnits);
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
		%feature("compactdefaultargs") GetTextPosition;
		%feature("autodoc", "	:rtype: gp_Pnt
") GetTextPosition;
		virtual const gp_Pnt GetTextPosition ();
};


%extend AIS_DiameterDimension {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_AIS_DiameterDimension(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_AIS_DiameterDimension::Handle_AIS_DiameterDimension %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_AIS_DiameterDimension;
class Handle_AIS_DiameterDimension : public Handle_AIS_Dimension {

    public:
        // constructors
        Handle_AIS_DiameterDimension();
        Handle_AIS_DiameterDimension(const Handle_AIS_DiameterDimension &aHandle);
        Handle_AIS_DiameterDimension(const AIS_DiameterDimension *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_AIS_DiameterDimension DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_AIS_DiameterDimension {
    AIS_DiameterDimension* _get_reference() {
    return (AIS_DiameterDimension*)$self->Access();
    }
};

%extend Handle_AIS_DiameterDimension {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend AIS_DiameterDimension {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor AIS_EllipseRadiusDimension;
class AIS_EllipseRadiusDimension : public AIS_Relation {
	public:
		%feature("compactdefaultargs") KindOfDimension;
		%feature("autodoc", "	:rtype: AIS_KindOfDimension
") KindOfDimension;
		virtual AIS_KindOfDimension KindOfDimension ();
		%feature("compactdefaultargs") IsMovable;
		%feature("autodoc", "	:rtype: bool
") IsMovable;
		virtual Standard_Boolean IsMovable ();
		%feature("compactdefaultargs") ComputeGeometry;
		%feature("autodoc", "	:rtype: None
") ComputeGeometry;
		void ComputeGeometry ();
};


%extend AIS_EllipseRadiusDimension {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_AIS_EllipseRadiusDimension(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_AIS_EllipseRadiusDimension::Handle_AIS_EllipseRadiusDimension %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_AIS_EllipseRadiusDimension;
class Handle_AIS_EllipseRadiusDimension : public Handle_AIS_Relation {

    public:
        // constructors
        Handle_AIS_EllipseRadiusDimension();
        Handle_AIS_EllipseRadiusDimension(const Handle_AIS_EllipseRadiusDimension &aHandle);
        Handle_AIS_EllipseRadiusDimension(const AIS_EllipseRadiusDimension *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_AIS_EllipseRadiusDimension DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_AIS_EllipseRadiusDimension {
    AIS_EllipseRadiusDimension* _get_reference() {
    return (AIS_EllipseRadiusDimension*)$self->Access();
    }
};

%extend Handle_AIS_EllipseRadiusDimension {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

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
	:type aPlane: Handle_Geom_Plane &
	:rtype: None
") AIS_EqualDistanceRelation;
		 AIS_EqualDistanceRelation (const TopoDS_Shape & aShape1,const TopoDS_Shape & aShape2,const TopoDS_Shape & aShape3,const TopoDS_Shape & aShape4,const Handle_Geom_Plane & aPlane);
		%feature("compactdefaultargs") SetShape3;
		%feature("autodoc", "	* Sets the shape aShape to be used as the shape aShape3 in the framework created at construction time.

	:param aShape:
	:type aShape: TopoDS_Shape &
	:rtype: None
") SetShape3;
		void SetShape3 (const TopoDS_Shape & aShape);
		%feature("compactdefaultargs") Shape3;
		%feature("autodoc", "	* Returns the shape aShape3 from the framework created at construction time.

	:rtype: TopoDS_Shape
") Shape3;
		const TopoDS_Shape  Shape3 ();
		%feature("compactdefaultargs") SetShape4;
		%feature("autodoc", "	* Sets the shape aShape to be used as the shape aShape4 in the framework created at construction time.

	:param aShape:
	:type aShape: TopoDS_Shape &
	:rtype: None
") SetShape4;
		void SetShape4 (const TopoDS_Shape & aShape);
		%feature("compactdefaultargs") Shape4;
		%feature("autodoc", "	* Returns the shape aShape4 from the framework created at construction time.

	:rtype: TopoDS_Shape
") Shape4;
		const TopoDS_Shape  Shape4 ();
		%feature("compactdefaultargs") Compute;
		%feature("autodoc", "	* Computes the presentation according to a point of view given by <aProjector>. To be Used when the associated degenerated Presentations have been transformed by <aTrsf> which is not a Pure Translation. The HLR Prs can't be deducted automatically WARNING :<aTrsf> must be applied to the object to display before computation !!!

	:param aProjector:
	:type aProjector: Handle_Prs3d_Projector &
	:param aTrsf:
	:type aTrsf: Handle_Geom_Transformation &
	:param aPresentation:
	:type aPresentation: Handle_Prs3d_Presentation &
	:rtype: void
") Compute;
		virtual void Compute (const Handle_Prs3d_Projector & aProjector,const Handle_Geom_Transformation & aTrsf,const Handle_Prs3d_Presentation & aPresentation);
		%feature("compactdefaultargs") ComputeTwoEdgesLength;
		%feature("autodoc", "	* Computes the location of an intreval between between two edges. FirstAttach , SecondAttach are the returned extreme points of the interval.

	:param aPresentation:
	:type aPresentation: Handle_Prs3d_Presentation &
	:param aDrawer:
	:type aDrawer: Handle_Prs3d_Drawer &
	:param ArrowSize:
	:type ArrowSize: float
	:param FirstEdge:
	:type FirstEdge: TopoDS_Edge &
	:param SecondEdge:
	:type SecondEdge: TopoDS_Edge &
	:param Plane:
	:type Plane: Handle_Geom_Plane &
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
		static void ComputeTwoEdgesLength (const Handle_Prs3d_Presentation & aPresentation,const Handle_Prs3d_Drawer & aDrawer,const Standard_Real ArrowSize,const TopoDS_Edge & FirstEdge,const TopoDS_Edge & SecondEdge,const Handle_Geom_Plane & Plane,const Standard_Boolean AutomaticPos,const Standard_Boolean IsSetBndBox,const Bnd_Box & BndBox,gp_Pnt & Position,gp_Pnt & FirstAttach,gp_Pnt & SecondAttach,gp_Pnt & FirstExtreme,gp_Pnt & SecondExtreme,DsgPrs_ArrowSide & SymbolPrs);
		%feature("compactdefaultargs") ComputeTwoVerticesLength;
		%feature("autodoc", "	* Computes the interval position between two vertexs. FirstAttach, SecondAttach are the returned extreme points of the interval.

	:param aPresentation:
	:type aPresentation: Handle_Prs3d_Presentation &
	:param aDrawer:
	:type aDrawer: Handle_Prs3d_Drawer &
	:param ArrowSize:
	:type ArrowSize: float
	:param FirstVertex:
	:type FirstVertex: TopoDS_Vertex &
	:param SecondVertex:
	:type SecondVertex: TopoDS_Vertex &
	:param Plane:
	:type Plane: Handle_Geom_Plane &
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
		static void ComputeTwoVerticesLength (const Handle_Prs3d_Presentation & aPresentation,const Handle_Prs3d_Drawer & aDrawer,const Standard_Real ArrowSize,const TopoDS_Vertex & FirstVertex,const TopoDS_Vertex & SecondVertex,const Handle_Geom_Plane & Plane,const Standard_Boolean AutomaticPos,const Standard_Boolean IsSetBndBox,const Bnd_Box & BndBox,const AIS_TypeOfDist TypeDist,gp_Pnt & Position,gp_Pnt & FirstAttach,gp_Pnt & SecondAttach,gp_Pnt & FirstExtreme,gp_Pnt & SecondExtreme,DsgPrs_ArrowSide & SymbolPrs);
		%feature("compactdefaultargs") ComputeOneEdgeOneVertexLength;
		%feature("autodoc", "	* Compute the interval location between a vertex and an edge. Edge may be a line or a circle.

	:param aPresentation:
	:type aPresentation: Handle_Prs3d_Presentation &
	:param aDrawer:
	:type aDrawer: Handle_Prs3d_Drawer &
	:param ArrowSize:
	:type ArrowSize: float
	:param FirstShape:
	:type FirstShape: TopoDS_Shape &
	:param SecondShape:
	:type SecondShape: TopoDS_Shape &
	:param Plane:
	:type Plane: Handle_Geom_Plane &
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
		static void ComputeOneEdgeOneVertexLength (const Handle_Prs3d_Presentation & aPresentation,const Handle_Prs3d_Drawer & aDrawer,const Standard_Real ArrowSize,const TopoDS_Shape & FirstShape,const TopoDS_Shape & SecondShape,const Handle_Geom_Plane & Plane,const Standard_Boolean AutomaticPos,const Standard_Boolean IsSetBndBox,const Bnd_Box & BndBox,gp_Pnt & Position,gp_Pnt & FirstAttach,gp_Pnt & SecondAttach,gp_Pnt & FirstExtreme,gp_Pnt & SecondExtreme,DsgPrs_ArrowSide & SymbolPrs);
};


%extend AIS_EqualDistanceRelation {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_AIS_EqualDistanceRelation(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_AIS_EqualDistanceRelation::Handle_AIS_EqualDistanceRelation %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_AIS_EqualDistanceRelation;
class Handle_AIS_EqualDistanceRelation : public Handle_AIS_Relation {

    public:
        // constructors
        Handle_AIS_EqualDistanceRelation();
        Handle_AIS_EqualDistanceRelation(const Handle_AIS_EqualDistanceRelation &aHandle);
        Handle_AIS_EqualDistanceRelation(const AIS_EqualDistanceRelation *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_AIS_EqualDistanceRelation DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_AIS_EqualDistanceRelation {
    AIS_EqualDistanceRelation* _get_reference() {
    return (AIS_EqualDistanceRelation*)$self->Access();
    }
};

%extend Handle_AIS_EqualDistanceRelation {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

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
	:type aPlane: Handle_Geom_Plane &
	:rtype: None
") AIS_EqualRadiusRelation;
		 AIS_EqualRadiusRelation (const TopoDS_Edge & aFirstEdge,const TopoDS_Edge & aSecondEdge,const Handle_Geom_Plane & aPlane);
		%feature("compactdefaultargs") Compute;
		%feature("autodoc", "	* computes the presentation according to a point of view given by <aProjector>. To be Used when the associated degenerated Presentations have been transformed by <aTrsf> which is not a Pure Translation. The HLR Prs can't be deducted automatically WARNING :<aTrsf> must be applied to the object to display before computation !!!

	:param aProjector:
	:type aProjector: Handle_Prs3d_Projector &
	:param aTrsf:
	:type aTrsf: Handle_Geom_Transformation &
	:param aPresentation:
	:type aPresentation: Handle_Prs3d_Presentation &
	:rtype: void
") Compute;
		virtual void Compute (const Handle_Prs3d_Projector & aProjector,const Handle_Geom_Transformation & aTrsf,const Handle_Prs3d_Presentation & aPresentation);
};


%extend AIS_EqualRadiusRelation {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_AIS_EqualRadiusRelation(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_AIS_EqualRadiusRelation::Handle_AIS_EqualRadiusRelation %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_AIS_EqualRadiusRelation;
class Handle_AIS_EqualRadiusRelation : public Handle_AIS_Relation {

    public:
        // constructors
        Handle_AIS_EqualRadiusRelation();
        Handle_AIS_EqualRadiusRelation(const Handle_AIS_EqualRadiusRelation &aHandle);
        Handle_AIS_EqualRadiusRelation(const AIS_EqualRadiusRelation *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_AIS_EqualRadiusRelation DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_AIS_EqualRadiusRelation {
    AIS_EqualRadiusRelation* _get_reference() {
    return (AIS_EqualRadiusRelation*)$self->Access();
    }
};

%extend Handle_AIS_EqualRadiusRelation {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

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
	:type aPlane: Handle_Geom_Plane &
	:param aWire:
	:type aWire: TopoDS_Wire &
	:rtype: None
") AIS_FixRelation;
		 AIS_FixRelation (const TopoDS_Shape & aShape,const Handle_Geom_Plane & aPlane,const TopoDS_Wire & aWire);
		%feature("compactdefaultargs") AIS_FixRelation;
		%feature("autodoc", "	* initializes the vertex aShape, the plane aPlane and the wire aWire, the position aPosition, the arrow size anArrowSize and the wire aWire, which connects the two vertices in a fixed relation.

	:param aShape:
	:type aShape: TopoDS_Shape &
	:param aPlane:
	:type aPlane: Handle_Geom_Plane &
	:param aWire:
	:type aWire: TopoDS_Wire &
	:param aPosition:
	:type aPosition: gp_Pnt
	:param anArrowSize: default value is 0.01
	:type anArrowSize: float
	:rtype: None
") AIS_FixRelation;
		 AIS_FixRelation (const TopoDS_Shape & aShape,const Handle_Geom_Plane & aPlane,const TopoDS_Wire & aWire,const gp_Pnt & aPosition,const Standard_Real anArrowSize = 0.01);
		%feature("compactdefaultargs") AIS_FixRelation;
		%feature("autodoc", "	* initializes the edge aShape and the plane aPlane.

	:param aShape:
	:type aShape: TopoDS_Shape &
	:param aPlane:
	:type aPlane: Handle_Geom_Plane &
	:rtype: None
") AIS_FixRelation;
		 AIS_FixRelation (const TopoDS_Shape & aShape,const Handle_Geom_Plane & aPlane);
		%feature("compactdefaultargs") AIS_FixRelation;
		%feature("autodoc", "	* initializes the edge aShape, the plane aPlane, the position aPosition and the arrow size anArrowSize.

	:param aShape:
	:type aShape: TopoDS_Shape &
	:param aPlane:
	:type aPlane: Handle_Geom_Plane &
	:param aPosition:
	:type aPosition: gp_Pnt
	:param anArrowSize: default value is 0.01
	:type anArrowSize: float
	:rtype: None
") AIS_FixRelation;
		 AIS_FixRelation (const TopoDS_Shape & aShape,const Handle_Geom_Plane & aPlane,const gp_Pnt & aPosition,const Standard_Real anArrowSize = 0.01);
		%feature("compactdefaultargs") Wire;
		%feature("autodoc", "	* Returns the wire which connects vertices in a fixed relation.

	:rtype: TopoDS_Wire
") Wire;
		TopoDS_Wire Wire ();
		%feature("compactdefaultargs") SetWire;
		%feature("autodoc", "	* Constructs the wire aWire. This connects vertices which are in a fixed relation.

	:param aWire:
	:type aWire: TopoDS_Wire &
	:rtype: None
") SetWire;
		void SetWire (const TopoDS_Wire & aWire);
		%feature("compactdefaultargs") IsMovable;
		%feature("autodoc", "	* Returns true if the Interactive Objects in the relation are movable.

	:rtype: bool
") IsMovable;
		Standard_Boolean IsMovable ();
		%feature("compactdefaultargs") Compute;
		%feature("autodoc", "	* computes the presentation according to a point of view given by <aProjector>. To be Used when the associated degenerated Presentations have been transformed by <aTrsf> which is not a Pure Translation. The HLR Prs can't be deducted automatically WARNING :<aTrsf> must be applied to the object to display before computation !!!

	:param aProjector:
	:type aProjector: Handle_Prs3d_Projector &
	:param aTrsf:
	:type aTrsf: Handle_Geom_Transformation &
	:param aPresentation:
	:type aPresentation: Handle_Prs3d_Presentation &
	:rtype: void
") Compute;
		virtual void Compute (const Handle_Prs3d_Projector & aProjector,const Handle_Geom_Transformation & aTrsf,const Handle_Prs3d_Presentation & aPresentation);
};


%extend AIS_FixRelation {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_AIS_FixRelation(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_AIS_FixRelation::Handle_AIS_FixRelation %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_AIS_FixRelation;
class Handle_AIS_FixRelation : public Handle_AIS_Relation {

    public:
        // constructors
        Handle_AIS_FixRelation();
        Handle_AIS_FixRelation(const Handle_AIS_FixRelation &aHandle);
        Handle_AIS_FixRelation(const AIS_FixRelation *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_AIS_FixRelation DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_AIS_FixRelation {
    AIS_FixRelation* _get_reference() {
    return (AIS_FixRelation*)$self->Access();
    }
};

%extend Handle_AIS_FixRelation {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

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
	:type aPlane: Handle_Geom_Plane &
	:rtype: None
") AIS_IdenticRelation;
		 AIS_IdenticRelation (const TopoDS_Shape & FirstShape,const TopoDS_Shape & SecondShape,const Handle_Geom_Plane & aPlane);
		%feature("compactdefaultargs") IsMovable;
		%feature("autodoc", "	* Returns true if the interactive object is movable.

	:rtype: bool
") IsMovable;
		Standard_Boolean IsMovable ();
		%feature("compactdefaultargs") Compute;
		%feature("autodoc", "	* computes the presentation according to a point of view given by <aProjector>. To be Used when the associated degenerated Presentations have been transformed by <aTrsf> which is not a Pure Translation. The HLR Prs can't be deducted automatically WARNING :<aTrsf> must be applied to the object to display before computation !!!

	:param aProjector:
	:type aProjector: Handle_Prs3d_Projector &
	:param aTrsf:
	:type aTrsf: Handle_Geom_Transformation &
	:param aPresentation:
	:type aPresentation: Handle_Prs3d_Presentation &
	:rtype: void
") Compute;
		virtual void Compute (const Handle_Prs3d_Projector & aProjector,const Handle_Geom_Transformation & aTrsf,const Handle_Prs3d_Presentation & aPresentation);
};


%extend AIS_IdenticRelation {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_AIS_IdenticRelation(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_AIS_IdenticRelation::Handle_AIS_IdenticRelation %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_AIS_IdenticRelation;
class Handle_AIS_IdenticRelation : public Handle_AIS_Relation {

    public:
        // constructors
        Handle_AIS_IdenticRelation();
        Handle_AIS_IdenticRelation(const Handle_AIS_IdenticRelation &aHandle);
        Handle_AIS_IdenticRelation(const AIS_IdenticRelation *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_AIS_IdenticRelation DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_AIS_IdenticRelation {
    AIS_IdenticRelation* _get_reference() {
    return (AIS_IdenticRelation*)$self->Access();
    }
};

%extend Handle_AIS_IdenticRelation {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

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
		%feature("compactdefaultargs") SecondPoint;
		%feature("autodoc", "	* returns second attachement point.

	:rtype: gp_Pnt
") SecondPoint;
		const gp_Pnt  SecondPoint ();
		%feature("compactdefaultargs") FirstShape;
		%feature("autodoc", "	* returns first attachement shape.

	:rtype: TopoDS_Shape
") FirstShape;
		const TopoDS_Shape  FirstShape ();
		%feature("compactdefaultargs") SecondShape;
		%feature("autodoc", "	* returns second attachement shape.

	:rtype: TopoDS_Shape
") SecondShape;
		const TopoDS_Shape  SecondShape ();
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
		%feature("compactdefaultargs") SetDisplayUnits;
		%feature("autodoc", "	:param theUnits:
	:type theUnits: TCollection_AsciiString &
	:rtype: void
") SetDisplayUnits;
		virtual void SetDisplayUnits (const TCollection_AsciiString & theUnits);
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
		%feature("compactdefaultargs") GetTextPosition;
		%feature("autodoc", "	:rtype: gp_Pnt
") GetTextPosition;
		virtual const gp_Pnt GetTextPosition ();
};


%extend AIS_LengthDimension {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_AIS_LengthDimension(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_AIS_LengthDimension::Handle_AIS_LengthDimension %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_AIS_LengthDimension;
class Handle_AIS_LengthDimension : public Handle_AIS_Dimension {

    public:
        // constructors
        Handle_AIS_LengthDimension();
        Handle_AIS_LengthDimension(const Handle_AIS_LengthDimension &aHandle);
        Handle_AIS_LengthDimension(const AIS_LengthDimension *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_AIS_LengthDimension DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_AIS_LengthDimension {
    AIS_LengthDimension* _get_reference() {
    return (AIS_LengthDimension*)$self->Access();
    }
};

%extend Handle_AIS_LengthDimension {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

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
	:type aPlane: Handle_Geom_Plane &
	:rtype: None
") AIS_MidPointRelation;
		 AIS_MidPointRelation (const TopoDS_Shape & aSymmTool,const TopoDS_Shape & FirstShape,const TopoDS_Shape & SecondShape,const Handle_Geom_Plane & aPlane);
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
		%feature("compactdefaultargs") GetTool;
		%feature("autodoc", "	:rtype: TopoDS_Shape
") GetTool;
		const TopoDS_Shape  GetTool ();
		%feature("compactdefaultargs") Compute;
		%feature("autodoc", "	* Computes the presentation according to a point of view given by <aProjector>. To be Used when the associated degenerated Presentations have been transformed by <aTrsf> which is not a Pure Translation. The HLR Prs can't be deducted automatically WARNING :<aTrsf> must be applied to the object to display before computation !!!

	:param aProjector:
	:type aProjector: Handle_Prs3d_Projector &
	:param aTrsf:
	:type aTrsf: Handle_Geom_Transformation &
	:param aPresentation:
	:type aPresentation: Handle_Prs3d_Presentation &
	:rtype: void
") Compute;
		virtual void Compute (const Handle_Prs3d_Projector & aProjector,const Handle_Geom_Transformation & aTrsf,const Handle_Prs3d_Presentation & aPresentation);
};


%extend AIS_MidPointRelation {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_AIS_MidPointRelation(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_AIS_MidPointRelation::Handle_AIS_MidPointRelation %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_AIS_MidPointRelation;
class Handle_AIS_MidPointRelation : public Handle_AIS_Relation {

    public:
        // constructors
        Handle_AIS_MidPointRelation();
        Handle_AIS_MidPointRelation(const Handle_AIS_MidPointRelation &aHandle);
        Handle_AIS_MidPointRelation(const AIS_MidPointRelation *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_AIS_MidPointRelation DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_AIS_MidPointRelation {
    AIS_MidPointRelation* _get_reference() {
    return (AIS_MidPointRelation*)$self->Access();
    }
};

%extend Handle_AIS_MidPointRelation {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

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
	:type aProjector: Handle_Prs3d_Projector &
	:param aTrsf:
	:type aTrsf: Handle_Geom_Transformation &
	:param aPresentation:
	:type aPresentation: Handle_Prs3d_Presentation &
	:rtype: void
") Compute;
		virtual void Compute (const Handle_Prs3d_Projector & aProjector,const Handle_Geom_Transformation & aTrsf,const Handle_Prs3d_Presentation & aPresentation);
		%feature("compactdefaultargs") KindOfDimension;
		%feature("autodoc", "	* Indicates that the dimension we are concerned with is an offset.

	:rtype: AIS_KindOfDimension
") KindOfDimension;
		AIS_KindOfDimension KindOfDimension ();
		%feature("compactdefaultargs") IsMovable;
		%feature("autodoc", "	* Returns true if the offset datum is movable.

	:rtype: bool
") IsMovable;
		Standard_Boolean IsMovable ();
		%feature("compactdefaultargs") SetRelativePos;
		%feature("autodoc", "	* Sets a transformation aTrsf for presentation and selection to a relative position.

	:param aTrsf:
	:type aTrsf: gp_Trsf
	:rtype: None
") SetRelativePos;
		void SetRelativePos (const gp_Trsf & aTrsf);
};


%extend AIS_OffsetDimension {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_AIS_OffsetDimension(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_AIS_OffsetDimension::Handle_AIS_OffsetDimension %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_AIS_OffsetDimension;
class Handle_AIS_OffsetDimension : public Handle_AIS_Relation {

    public:
        // constructors
        Handle_AIS_OffsetDimension();
        Handle_AIS_OffsetDimension(const Handle_AIS_OffsetDimension &aHandle);
        Handle_AIS_OffsetDimension(const AIS_OffsetDimension *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_AIS_OffsetDimension DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_AIS_OffsetDimension {
    AIS_OffsetDimension* _get_reference() {
    return (AIS_OffsetDimension*)$self->Access();
    }
};

%extend Handle_AIS_OffsetDimension {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

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
	:type aPlane: Handle_Geom_Plane &
	:rtype: None
") AIS_ParallelRelation;
		 AIS_ParallelRelation (const TopoDS_Shape & aFShape,const TopoDS_Shape & aSShape,const Handle_Geom_Plane & aPlane);
		%feature("compactdefaultargs") AIS_ParallelRelation;
		%feature("autodoc", "	* Constructs an object to display parallel constraints. This object is defined by the first shape aFShape and the second shape aSShape the plane aPlane, the position aPosition, the type of arrow, aSymbolPrs and its size anArrowSize.

	:param aFShape:
	:type aFShape: TopoDS_Shape &
	:param aSShape:
	:type aSShape: TopoDS_Shape &
	:param aPlane:
	:type aPlane: Handle_Geom_Plane &
	:param aPosition:
	:type aPosition: gp_Pnt
	:param aSymbolPrs:
	:type aSymbolPrs: DsgPrs_ArrowSide
	:param anArrowSize: default value is 0.01
	:type anArrowSize: float
	:rtype: None
") AIS_ParallelRelation;
		 AIS_ParallelRelation (const TopoDS_Shape & aFShape,const TopoDS_Shape & aSShape,const Handle_Geom_Plane & aPlane,const gp_Pnt & aPosition,const DsgPrs_ArrowSide aSymbolPrs,const Standard_Real anArrowSize = 0.01);
		%feature("compactdefaultargs") IsMovable;
		%feature("autodoc", "	* Returns true if the parallelism is movable.

	:rtype: bool
") IsMovable;
		Standard_Boolean IsMovable ();
		%feature("compactdefaultargs") Compute;
		%feature("autodoc", "	* computes the presentation according to a point of view given by <aProjector>. To be Used when the associated degenerated Presentations have been transformed by <aTrsf> which is not a Pure Translation. The HLR Prs can't be deducted automatically WARNING :<aTrsf> must be applied to the object to display before computation !!!

	:param aProjector:
	:type aProjector: Handle_Prs3d_Projector &
	:param aTrsf:
	:type aTrsf: Handle_Geom_Transformation &
	:param aPresentation:
	:type aPresentation: Handle_Prs3d_Presentation &
	:rtype: void
") Compute;
		virtual void Compute (const Handle_Prs3d_Projector & aProjector,const Handle_Geom_Transformation & aTrsf,const Handle_Prs3d_Presentation & aPresentation);
};


%extend AIS_ParallelRelation {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_AIS_ParallelRelation(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_AIS_ParallelRelation::Handle_AIS_ParallelRelation %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_AIS_ParallelRelation;
class Handle_AIS_ParallelRelation : public Handle_AIS_Relation {

    public:
        // constructors
        Handle_AIS_ParallelRelation();
        Handle_AIS_ParallelRelation(const Handle_AIS_ParallelRelation &aHandle);
        Handle_AIS_ParallelRelation(const AIS_ParallelRelation *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_AIS_ParallelRelation DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_AIS_ParallelRelation {
    AIS_ParallelRelation* _get_reference() {
    return (AIS_ParallelRelation*)$self->Access();
    }
};

%extend Handle_AIS_ParallelRelation {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

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
	:type aPlane: Handle_Geom_Plane &
	:rtype: None
") AIS_PerpendicularRelation;
		 AIS_PerpendicularRelation (const TopoDS_Shape & aFShape,const TopoDS_Shape & aSShape,const Handle_Geom_Plane & aPlane);
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
	:type aProjector: Handle_Prs3d_Projector &
	:param aTrsf:
	:type aTrsf: Handle_Geom_Transformation &
	:param aPresentation:
	:type aPresentation: Handle_Prs3d_Presentation &
	:rtype: void
") Compute;
		virtual void Compute (const Handle_Prs3d_Projector & aProjector,const Handle_Geom_Transformation & aTrsf,const Handle_Prs3d_Presentation & aPresentation);
};


%extend AIS_PerpendicularRelation {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_AIS_PerpendicularRelation(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_AIS_PerpendicularRelation::Handle_AIS_PerpendicularRelation %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_AIS_PerpendicularRelation;
class Handle_AIS_PerpendicularRelation : public Handle_AIS_Relation {

    public:
        // constructors
        Handle_AIS_PerpendicularRelation();
        Handle_AIS_PerpendicularRelation(const Handle_AIS_PerpendicularRelation &aHandle);
        Handle_AIS_PerpendicularRelation(const AIS_PerpendicularRelation *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_AIS_PerpendicularRelation DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_AIS_PerpendicularRelation {
    AIS_PerpendicularRelation* _get_reference() {
    return (AIS_PerpendicularRelation*)$self->Access();
    }
};

%extend Handle_AIS_PerpendicularRelation {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

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
		%feature("compactdefaultargs") Circle;
		%feature("autodoc", "	* returns measured geometry circle.

	:rtype: gp_Circ
") Circle;
		const gp_Circ  Circle ();
		%feature("compactdefaultargs") AnchorPoint;
		%feature("autodoc", "	* returns anchor point on circle for radius dimension.

	:rtype: gp_Pnt
") AnchorPoint;
		const gp_Pnt  AnchorPoint ();
		%feature("compactdefaultargs") Shape;
		%feature("autodoc", "	* returns the measured shape.

	:rtype: TopoDS_Shape
") Shape;
		const TopoDS_Shape  Shape ();
		%feature("compactdefaultargs") SetMeasuredGeometry;
		%feature("autodoc", "	* Measure radius of the circle. The dimension will become invalid if the radius of the circle is less than Precision::Confusion(). @param theCircle [in] the circle to measure.

	:param theCircle:
	:type theCircle: gp_Circ
	:rtype: None
") SetMeasuredGeometry;
		void SetMeasuredGeometry (const gp_Circ & theCircle);
		%feature("compactdefaultargs") SetMeasuredGeometry;
		%feature("autodoc", "	* Measure radius of the circle and orient the dimension so the dimension lines attaches to anchor point on the circle. The dimension will become invalid if the radius of the circle is less than Precision::Confusion(). @param theCircle [in] the circle to measure. @param theAnchorPoint [in] the point to attach the dimension lines.

	:param theCircle:
	:type theCircle: gp_Circ
	:param theAnchorPoint:
	:type theAnchorPoint: gp_Pnt
	:rtype: None
") SetMeasuredGeometry;
		void SetMeasuredGeometry (const gp_Circ & theCircle,const gp_Pnt & theAnchorPoint);
		%feature("compactdefaultargs") SetMeasuredGeometry;
		%feature("autodoc", "	* Measure radius on the passed shape, if applicable. The dimension will become invalid if the passed shape is not measurable or if measured diameter value is less than Precision::Confusion(). @param theShape [in] the shape to measure.

	:param theShape:
	:type theShape: TopoDS_Shape &
	:rtype: None
") SetMeasuredGeometry;
		void SetMeasuredGeometry (const TopoDS_Shape & theShape);
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
		%feature("compactdefaultargs") SetDisplayUnits;
		%feature("autodoc", "	:param theUnits:
	:type theUnits: TCollection_AsciiString &
	:rtype: void
") SetDisplayUnits;
		virtual void SetDisplayUnits (const TCollection_AsciiString & theUnits);
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
		%feature("compactdefaultargs") GetTextPosition;
		%feature("autodoc", "	:rtype: gp_Pnt
") GetTextPosition;
		virtual const gp_Pnt GetTextPosition ();
};


%extend AIS_RadiusDimension {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_AIS_RadiusDimension(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_AIS_RadiusDimension::Handle_AIS_RadiusDimension %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_AIS_RadiusDimension;
class Handle_AIS_RadiusDimension : public Handle_AIS_Dimension {

    public:
        // constructors
        Handle_AIS_RadiusDimension();
        Handle_AIS_RadiusDimension(const Handle_AIS_RadiusDimension &aHandle);
        Handle_AIS_RadiusDimension(const AIS_RadiusDimension *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_AIS_RadiusDimension DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_AIS_RadiusDimension {
    AIS_RadiusDimension* _get_reference() {
    return (AIS_RadiusDimension*)$self->Access();
    }
};

%extend Handle_AIS_RadiusDimension {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

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
	:type aPlane: Handle_Geom_Plane &
	:rtype: None
") AIS_SymmetricRelation;
		 AIS_SymmetricRelation (const TopoDS_Shape & aSymmTool,const TopoDS_Shape & FirstShape,const TopoDS_Shape & SecondShape,const Handle_Geom_Plane & aPlane);
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
		%feature("compactdefaultargs") GetTool;
		%feature("autodoc", "	* Returns the tool composed of a first shape, a second shape, and a plane. This tool is created at construction time.

	:rtype: TopoDS_Shape
") GetTool;
		const TopoDS_Shape  GetTool ();
		%feature("compactdefaultargs") Compute;
		%feature("autodoc", "	* computes the presentation according to a point of view given by <aProjector>. To be Used when the associated degenerated Presentations have been transformed by <aTrsf> which is not a Pure Translation. The HLR Prs can't be deducted automatically WARNING :<aTrsf> must be applied to the object to display before computation !!!

	:param aProjector:
	:type aProjector: Handle_Prs3d_Projector &
	:param aTrsf:
	:type aTrsf: Handle_Geom_Transformation &
	:param aPresentation:
	:type aPresentation: Handle_Prs3d_Presentation &
	:rtype: void
") Compute;
		virtual void Compute (const Handle_Prs3d_Projector & aProjector,const Handle_Geom_Transformation & aTrsf,const Handle_Prs3d_Presentation & aPresentation);
};


%extend AIS_SymmetricRelation {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_AIS_SymmetricRelation(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_AIS_SymmetricRelation::Handle_AIS_SymmetricRelation %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_AIS_SymmetricRelation;
class Handle_AIS_SymmetricRelation : public Handle_AIS_Relation {

    public:
        // constructors
        Handle_AIS_SymmetricRelation();
        Handle_AIS_SymmetricRelation(const Handle_AIS_SymmetricRelation &aHandle);
        Handle_AIS_SymmetricRelation(const AIS_SymmetricRelation *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_AIS_SymmetricRelation DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_AIS_SymmetricRelation {
    AIS_SymmetricRelation* _get_reference() {
    return (AIS_SymmetricRelation*)$self->Access();
    }
};

%extend Handle_AIS_SymmetricRelation {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

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
	:type aPlane: Handle_Geom_Plane &
	:param anExternRef: default value is 0
	:type anExternRef: int
	:rtype: None
") AIS_TangentRelation;
		 AIS_TangentRelation (const TopoDS_Shape & aFShape,const TopoDS_Shape & aSShape,const Handle_Geom_Plane & aPlane,const Standard_Integer anExternRef = 0);
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
		%feature("compactdefaultargs") Compute;
		%feature("autodoc", "	* computes the presentation according to a point of view given by <aProjector>. To be Used when the associated degenerated Presentations have been transformed by <aTrsf> which is not a Pure Translation. The HLR Prs can't be deducted automatically WARNING :<aTrsf> must be applied to the object to display before computation !!!

	:param aProjector:
	:type aProjector: Handle_Prs3d_Projector &
	:param aTrsf:
	:type aTrsf: Handle_Geom_Transformation &
	:param aPresentation:
	:type aPresentation: Handle_Prs3d_Presentation &
	:rtype: void
") Compute;
		virtual void Compute (const Handle_Prs3d_Projector & aProjector,const Handle_Geom_Transformation & aTrsf,const Handle_Prs3d_Presentation & aPresentation);
};


%extend AIS_TangentRelation {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_AIS_TangentRelation(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_AIS_TangentRelation::Handle_AIS_TangentRelation %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_AIS_TangentRelation;
class Handle_AIS_TangentRelation : public Handle_AIS_Relation {

    public:
        // constructors
        Handle_AIS_TangentRelation();
        Handle_AIS_TangentRelation(const Handle_AIS_TangentRelation &aHandle);
        Handle_AIS_TangentRelation(const AIS_TangentRelation *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_AIS_TangentRelation DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_AIS_TangentRelation {
    AIS_TangentRelation* _get_reference() {
    return (AIS_TangentRelation*)$self->Access();
    }
};

%extend Handle_AIS_TangentRelation {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

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
		%feature("compactdefaultargs") SetTextureFileName;
		%feature("autodoc", "	* Sets the texture source. <theTextureFileName> can specify path to texture image or one of the standard predefined textures. The accepted file types are those used in Image_AlienPixMap with extensions such as rgb, png, jpg and more. To specify the standard predefined texture, the <theTextureFileName> should contain integer - the Graphic3d_NameOfTexture2D enumeration index. Setting texture source using this method resets the source pixmap (if was set previously).

	:param theTextureFileName:
	:type theTextureFileName: TCollection_AsciiString &
	:rtype: void
") SetTextureFileName;
		virtual void SetTextureFileName (const TCollection_AsciiString & theTextureFileName);
		%feature("compactdefaultargs") SetTexturePixMap;
		%feature("autodoc", "	* Sets the texture source. <theTexturePixMap> specifies image data. Please note that the data should be in Bottom-Up order, the flag of Image_PixMap::IsTopDown() will be ignored by graphic driver. Setting texture source using this method resets the source by filename (if was set previously).

	:param theTexturePixMap:
	:type theTexturePixMap: Image_PixMap_Handle &
	:rtype: void
") SetTexturePixMap;
		virtual void SetTexturePixMap (const Image_PixMap_Handle & theTexturePixMap);
		%feature("compactdefaultargs") TextureMapState;
		%feature("autodoc", "	* returns flag to control texture mapping (for presentation mode 3)

	:rtype: bool
") TextureMapState;
		Standard_Boolean TextureMapState ();
		%feature("compactdefaultargs") SetTextureMapOn;
		%feature("autodoc", "	* Enables texture mapping

	:rtype: None
") SetTextureMapOn;
		void SetTextureMapOn ();
		%feature("compactdefaultargs") SetTextureMapOff;
		%feature("autodoc", "	* Disables texture mapping

	:rtype: None
") SetTextureMapOff;
		void SetTextureMapOff ();
		%feature("compactdefaultargs") TextureFile;
		%feature("autodoc", "	* returns path to the texture file

	:rtype: char *
") TextureFile;
		const char * TextureFile ();
		%feature("compactdefaultargs") TexturePixMap;
		%feature("autodoc", "	* returns the source pixmap for texture map

	:rtype: Handle_Image_PixMap
") TexturePixMap;
		Handle_Image_PixMap TexturePixMap ();
		%feature("compactdefaultargs") UpdateAttributes;
		%feature("autodoc", "	* @name methods to alter texture mapping properties Use this method to display the textured shape without recomputing the whole presentation. Use this method when ONLY the texture content has been changed. If other parameters (ie: scale factors, texture origin, texture repeat...) have changed, the whole presentation has to be recomputed: @code if (myShape->DisplayMode() == 3) { myAISContext->RecomputePrsOnly (myShape); } else { myAISContext->SetDisplayMode (myShape, 3, Standard_False); myAISContext->Display (myShape, Standard_True); } @endcode

	:rtype: None
") UpdateAttributes;
		void UpdateAttributes ();
		%feature("compactdefaultargs") SetColor;
		%feature("autodoc", "	* Sets the color.

	:param theColor:
	:type theColor: Quantity_Color &
	:rtype: void
") SetColor;
		virtual void SetColor (const Quantity_Color & theColor);
		%feature("compactdefaultargs") UnsetColor;
		%feature("autodoc", "	* Removes settings for the color.

	:rtype: void
") UnsetColor;
		virtual void UnsetColor ();
		%feature("compactdefaultargs") SetMaterial;
		%feature("autodoc", "	* Sets the material aspect.

	:param theAspect:
	:type theAspect: Graphic3d_MaterialAspect &
	:rtype: void
") SetMaterial;
		virtual void SetMaterial (const Graphic3d_MaterialAspect & theAspect);
		%feature("compactdefaultargs") UnsetMaterial;
		%feature("autodoc", "	* Removes settings for material aspect.

	:rtype: void
") UnsetMaterial;
		virtual void UnsetMaterial ();
		%feature("compactdefaultargs") EnableTextureModulate;
		%feature("autodoc", "	* Enables texture modulation

	:rtype: None
") EnableTextureModulate;
		void EnableTextureModulate ();
		%feature("compactdefaultargs") DisableTextureModulate;
		%feature("autodoc", "	* Disables texture modulation

	:rtype: None
") DisableTextureModulate;
		void DisableTextureModulate ();
		%feature("compactdefaultargs") TextureRepeat;
		%feature("autodoc", "	* returns texture repeat flag

	:rtype: bool
") TextureRepeat;
		Standard_Boolean TextureRepeat ();
		%feature("compactdefaultargs") URepeat;
		%feature("autodoc", "	* returns texture repeat U value

	:rtype: float
") URepeat;
		Standard_Real URepeat ();
		%feature("compactdefaultargs") VRepeat;
		%feature("autodoc", "	* returns texture repeat V value

	:rtype: float
") VRepeat;
		Standard_Real VRepeat ();
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
		%feature("compactdefaultargs") TextureOrigin;
		%feature("autodoc", "	* returns true if texture UV origin has been modified

	:rtype: bool
") TextureOrigin;
		Standard_Boolean TextureOrigin ();
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
		%feature("compactdefaultargs") TextureModulate;
		%feature("autodoc", "	* returns true if texture color modulation is turned on

	:rtype: bool
") TextureModulate;
		Standard_Boolean TextureModulate ();
};


%extend AIS_TexturedShape {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_AIS_TexturedShape(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_AIS_TexturedShape::Handle_AIS_TexturedShape %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_AIS_TexturedShape;
class Handle_AIS_TexturedShape : public Handle_AIS_Shape {

    public:
        // constructors
        Handle_AIS_TexturedShape();
        Handle_AIS_TexturedShape(const Handle_AIS_TexturedShape &aHandle);
        Handle_AIS_TexturedShape(const AIS_TexturedShape *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_AIS_TexturedShape DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_AIS_TexturedShape {
    AIS_TexturedShape* _get_reference() {
    return (AIS_TexturedShape*)$self->Access();
    }
};

%extend Handle_AIS_TexturedShape {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

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
	:type aProjector: Handle_Prs3d_Projector &
	:param aTrsf:
	:type aTrsf: Handle_Geom_Transformation &
	:param aPresentation:
	:type aPresentation: Handle_Prs3d_Presentation &
	:rtype: void
") Compute;
		virtual void Compute (const Handle_Prs3d_Projector & aProjector,const Handle_Geom_Transformation & aTrsf,const Handle_Prs3d_Presentation & aPresentation);
};


%extend AIS_MaxRadiusDimension {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_AIS_MaxRadiusDimension(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_AIS_MaxRadiusDimension::Handle_AIS_MaxRadiusDimension %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_AIS_MaxRadiusDimension;
class Handle_AIS_MaxRadiusDimension : public Handle_AIS_EllipseRadiusDimension {

    public:
        // constructors
        Handle_AIS_MaxRadiusDimension();
        Handle_AIS_MaxRadiusDimension(const Handle_AIS_MaxRadiusDimension &aHandle);
        Handle_AIS_MaxRadiusDimension(const AIS_MaxRadiusDimension *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_AIS_MaxRadiusDimension DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_AIS_MaxRadiusDimension {
    AIS_MaxRadiusDimension* _get_reference() {
    return (AIS_MaxRadiusDimension*)$self->Access();
    }
};

%extend Handle_AIS_MaxRadiusDimension {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

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
	:type aProjector: Handle_Prs3d_Projector &
	:param aTrsf:
	:type aTrsf: Handle_Geom_Transformation &
	:param aPresentation:
	:type aPresentation: Handle_Prs3d_Presentation &
	:rtype: void
") Compute;
		virtual void Compute (const Handle_Prs3d_Projector & aProjector,const Handle_Geom_Transformation & aTrsf,const Handle_Prs3d_Presentation & aPresentation);
};


%extend AIS_MinRadiusDimension {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_AIS_MinRadiusDimension(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_AIS_MinRadiusDimension::Handle_AIS_MinRadiusDimension %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_AIS_MinRadiusDimension;
class Handle_AIS_MinRadiusDimension : public Handle_AIS_EllipseRadiusDimension {

    public:
        // constructors
        Handle_AIS_MinRadiusDimension();
        Handle_AIS_MinRadiusDimension(const Handle_AIS_MinRadiusDimension &aHandle);
        Handle_AIS_MinRadiusDimension(const AIS_MinRadiusDimension *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_AIS_MinRadiusDimension DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_AIS_MinRadiusDimension {
    AIS_MinRadiusDimension* _get_reference() {
    return (AIS_MinRadiusDimension*)$self->Access();
    }
};

%extend Handle_AIS_MinRadiusDimension {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend AIS_MinRadiusDimension {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
