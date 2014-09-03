/*
Copyright 2008-2014 Thomas Paviot (tpaviot@gmail.com)


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
%include ../common/StandardDefines.i
%include ../common/ExceptionCatcher.i
%include ../common/FunctionTransformers.i
%include ../common/Operators.i

%include AIS_headers.i

/* typedefs */
typedef AIS_NListTransient::Iterator AIS_NListIteratorOfListTransient;
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
%nodefaultctor AIS;
class AIS {
	public:
		%feature("autodoc", "Args:
	aShape(TopoDS_Shape)
	aPoint(gp_Pnt)

Returns:
	static gp_Pnt

Returns the nearest point in a shape. This is used by  
several classes in calculation of dimensions.") Nearest;
		static gp_Pnt Nearest (const TopoDS_Shape & aShape,const gp_Pnt & aPoint);
		%feature("autodoc", "Args:
	theLine(gp_Lin)
	thePoint(gp_Pnt)

Returns:
	static gp_Pnt

@return the nearest point on the line.") Nearest;
		static gp_Pnt Nearest (const gp_Lin & theLine,const gp_Pnt & thePoint);
		%feature("autodoc", "Args:
	theCurve(Handle_Geom_Curve)
	thePoint(gp_Pnt)
	theFirstPoint(gp_Pnt)
	theLastPoint(gp_Pnt)
	theNearestPoint(gp_Pnt)

Returns:
	static Standard_Boolean

For the given point finds nearest point on the curve,  
@return TRUE if found point is belongs to the curve  
and FALSE otherwise.") Nearest;
		static Standard_Boolean Nearest (const Handle_Geom_Curve & theCurve,const gp_Pnt & thePoint,const gp_Pnt & theFirstPoint,const gp_Pnt & theLastPoint,gp_Pnt & theNearestPoint);
		%feature("autodoc", "Args:
	aShape(TopoDS_Shape)
	aPoint(gp_Pnt)

Returns:
	static gp_Pnt

No detailed docstring for this function.") Farest;
		static gp_Pnt Farest (const TopoDS_Shape & aShape,const gp_Pnt & aPoint);
		%feature("autodoc", "Args:
	theEdge(TopoDS_Edge)
	theCurve(Handle_Geom_Curve)
	theFirstPnt(gp_Pnt)
	theLastPnt(gp_Pnt)

Returns:
	static Standard_Boolean

Used by 2d Relation only  
         Computes the 3d geometry of <anEdge> in the current WorkingPlane  
         and the extremities if any  
         Return TRUE if ok.") ComputeGeometry;
		static Standard_Boolean ComputeGeometry (const TopoDS_Edge & theEdge,Handle_Geom_Curve & theCurve,gp_Pnt & theFirstPnt,gp_Pnt & theLastPnt);
		%feature("autodoc", "Args:
	theEdge(TopoDS_Edge)
	theCurve(Handle_Geom_Curve)
	theFirstPnt(gp_Pnt)
	theLastPnt(gp_Pnt)
	theIsInfinite(Standard_Boolean)

Returns:
	static Standard_Boolean

Used by dimensions only.  
         Computes the 3d geometry of <anEdge>.  
         Return TRUE if ok.") ComputeGeometry;
		static Standard_Boolean ComputeGeometry (const TopoDS_Edge & theEdge,Handle_Geom_Curve & theCurve,gp_Pnt & theFirstPnt,gp_Pnt & theLastPnt,Standard_Boolean & theIsInfinite);
		%feature("autodoc", "Args:
	theEdge(TopoDS_Edge)
	theCurve(Handle_Geom_Curve)
	theFirstPnt(gp_Pnt)
	theLastPnt(gp_Pnt)
	theExtCurve(Handle_Geom_Curve)
	theIsInfinite(Standard_Boolean)
	theIsOnPlane(Standard_Boolean)
	thePlane(Handle_Geom_Plane)

Returns:
	static Standard_Boolean

Used by 2d Relation only  
         Computes the 3d geometry of <anEdge> in the current WorkingPlane  
         and the extremities if any.  
         If <aCurve> is not in the current plane, <extCurve> contains  
         the not projected curve associated to <anEdge>.  
         If <anEdge> is infinite, <isinfinite> = true and the 2  
         parameters <FirstPnt> and <LastPnt> have no signification.  
         Return TRUE if ok.") ComputeGeometry;
		static Standard_Boolean ComputeGeometry (const TopoDS_Edge & theEdge,Handle_Geom_Curve & theCurve,gp_Pnt & theFirstPnt,gp_Pnt & theLastPnt,Handle_Geom_Curve & theExtCurve,Standard_Boolean & theIsInfinite,Standard_Boolean & theIsOnPlane,const Handle_Geom_Plane & thePlane);
		%feature("autodoc", "Args:
	theFirstEdge(TopoDS_Edge)
	theSecondEdge(TopoDS_Edge)
	theFirstCurve(Handle_Geom_Curve)
	theSecondCurve(Handle_Geom_Curve)
	theFirstPnt1(gp_Pnt)
	theLastPnt1(gp_Pnt)
	theFirstPnt2(gp_Pnt)
	theLastPnt2(gp_Pnt)
	thePlane(Handle_Geom_Plane)

Returns:
	static Standard_Boolean

Used by 2d Relation only  
         Computes the 3d geometry of <anEdge> in the current WorkingPlane  
         and the extremities if any  
         Return TRUE if ok.") ComputeGeometry;
		static Standard_Boolean ComputeGeometry (const TopoDS_Edge & theFirstEdge,const TopoDS_Edge & theSecondEdge,Handle_Geom_Curve & theFirstCurve,Handle_Geom_Curve & theSecondCurve,gp_Pnt & theFirstPnt1,gp_Pnt & theLastPnt1,gp_Pnt & theFirstPnt2,gp_Pnt & theLastPnt2,const Handle_Geom_Plane & thePlane);
		%feature("autodoc", "Args:
	theFirstEdge(TopoDS_Edge)
	theSecondEdge(TopoDS_Edge)
	theFirstCurve(Handle_Geom_Curve)
	theSecondCurve(Handle_Geom_Curve)
	theFirstPnt1(gp_Pnt)
	theLastPnt1(gp_Pnt)
	theFirstPnt2(gp_Pnt)
	theLastPnt2(gp_Pnt)
	theIsinfinite1(Standard_Boolean)
	theIsinfinite2(Standard_Boolean)

Returns:
	static Standard_Boolean

Used  by  dimensions  only.Computes  the  3d geometry  
         of<anEdge1> and <anEdge2> and checks if they are infinite.") ComputeGeometry;
		static Standard_Boolean ComputeGeometry (const TopoDS_Edge & theFirstEdge,const TopoDS_Edge & theSecondEdge,Handle_Geom_Curve & theFirstCurve,Handle_Geom_Curve & theSecondCurve,gp_Pnt & theFirstPnt1,gp_Pnt & theLastPnt1,gp_Pnt & theFirstPnt2,gp_Pnt & theLastPnt2,Standard_Boolean & theIsinfinite1,Standard_Boolean & theIsinfinite2);
		%feature("autodoc", "Args:
	theFirstEdge(TopoDS_Edge)
	theSecondEdge(TopoDS_Edge)
	theExtIndex(Standard_Integer)
	theFirstCurve(Handle_Geom_Curve)
	theSecondCurve(Handle_Geom_Curve)
	theFirstPnt1(gp_Pnt)
	theLastPnt1(gp_Pnt)
	theFirstPnt2(gp_Pnt)
	theLastPnt2(gp_Pnt)
	theExtCurve(Handle_Geom_Curve)
	theIsinfinite1(Standard_Boolean)
	theIsinfinite2(Standard_Boolean)
	thePlane(Handle_Geom_Plane)

Returns:
	static Standard_Boolean

Used  by  2d Relation  only Computes  the  3d geometry  
         of<anEdge1> and <anEdge2> in the current Plane and the  
         extremities if any.   Return in ExtCurve  the 3d curve  
         (not projected  in the  plane)  of the  first edge  if  
         <indexExt> =1 or of the 2nd edge if <indexExt> = 2. If  
         <indexExt> = 0, ExtCurve is Null.  if there is an edge  
         external to the  plane,  <isinfinite> is true if  this  
         edge is infinite.  So, the extremities of it are not  
         significant.  Return TRUE if ok") ComputeGeometry;
		static Standard_Boolean ComputeGeometry (const TopoDS_Edge & theFirstEdge,const TopoDS_Edge & theSecondEdge,Standard_Integer &OutValue,Handle_Geom_Curve & theFirstCurve,Handle_Geom_Curve & theSecondCurve,gp_Pnt & theFirstPnt1,gp_Pnt & theLastPnt1,gp_Pnt & theFirstPnt2,gp_Pnt & theLastPnt2,Handle_Geom_Curve & theExtCurve,Standard_Boolean & theIsinfinite1,Standard_Boolean & theIsinfinite2,const Handle_Geom_Plane & thePlane);
		%feature("autodoc", "Args:
	aCurve(Handle_Geom_Curve)
	first1(Standard_Real)
	last1(Standard_Real)
	FirstPnt1(gp_Pnt)
	LastPnt1(gp_Pnt)
	aPlane(Handle_Geom_Plane)
	isOnPlane(Standard_Boolean)

Returns:
	static Standard_Boolean

Checks if aCurve belongs to aPlane; if not, projects aCurve in aPlane  
         and returns aCurve;  
         Return TRUE if ok") ComputeGeomCurve;
		static Standard_Boolean ComputeGeomCurve (Handle_Geom_Curve & aCurve,const Standard_Real first1,const Standard_Real last1,gp_Pnt & FirstPnt1,gp_Pnt & LastPnt1,const Handle_Geom_Plane & aPlane,Standard_Boolean & isOnPlane);
		%feature("autodoc", "Args:
	aVertex(TopoDS_Vertex)
	point(gp_Pnt)
	aPlane(Handle_Geom_Plane)
	isOnPlane(Standard_Boolean)

Returns:
	static Standard_Boolean

No detailed docstring for this function.") ComputeGeometry;
		static Standard_Boolean ComputeGeometry (const TopoDS_Vertex & aVertex,gp_Pnt & point,const Handle_Geom_Plane & aPlane,Standard_Boolean & isOnPlane);
		%feature("autodoc", "Args:
	aFace(TopoDS_Face)
	aPlane(gp_Pln)
	aSurf(Handle_Geom_Surface)
	aSurfType(AIS_KindOfSurface)
	Offset(Standard_Real)

Returns:
	static Standard_Boolean

Tryes to get Plane from Face.  Returns Surface of Face  
         in aSurf.  Returns Standard_True  and Plane of Face in  
          aPlane in following  cases:  
         Face is Plane, Offset of Plane,  
                 Extrusion of Line  and Offset of  Extrusion of Line  
         Returns pure type of Surface which can be:  
         Plane, Cylinder, Cone, Sphere, Torus,  
         SurfaceOfRevolution, SurfaceOfExtrusion") GetPlaneFromFace;
		static Standard_Boolean GetPlaneFromFace (const TopoDS_Face & aFace,gp_Pln & aPlane,Handle_Geom_Surface & aSurf,AIS_KindOfSurface & aSurfType,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	aFace(TopoDS_Face)
	aPlane(gp_Pln)
	aSurface(Handle_Geom_Surface)
	aSurfaceType(AIS_KindOfSurface)
	anOffset(Standard_Real)

Returns:
	static void

No detailed docstring for this function.") InitFaceLength;
		static void InitFaceLength (const TopoDS_Face & aFace,gp_Pln & aPlane,Handle_Geom_Surface & aSurface,AIS_KindOfSurface & aSurfaceType,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	theFirstFace(TopoDS_Face)
	theSecondFace(TopoDS_Face)
	theFirstSurf(Handle_Geom_Surface)
	theSecondSurf(Handle_Geom_Surface)
	theFirstAttach(gp_Pnt)
	theSecondAttach(gp_Pnt)
	theDirOnPlane(gp_Dir)

Returns:
	static void

Finds attachment points on two curvilinear faces for length dimension.  
@param thePlaneDir [in] the direction on the dimension plane to  
compute the plane automatically. It will not be taken into account if  
plane is defined by user.") InitLengthBetweenCurvilinearFaces;
		static void InitLengthBetweenCurvilinearFaces (const TopoDS_Face & theFirstFace,const TopoDS_Face & theSecondFace,Handle_Geom_Surface & theFirstSurf,Handle_Geom_Surface & theSecondSurf,gp_Pnt & theFirstAttach,gp_Pnt & theSecondAttach,gp_Dir & theDirOnPlane);
		%feature("autodoc", "Args:
	theFirstFace(TopoDS_Face)
	theSecondFace(TopoDS_Face)
	theCenter(gp_Pnt)
	theFirstAttach(gp_Pnt)
	theSecondAttach(gp_Pnt)
	theIsFirstPointSet(Standard_Boolean)=Standard_False

Returns:
	static Standard_Boolean

Finds three points for the angle dimension between  
two planes.") InitAngleBetweenPlanarFaces;
		static Standard_Boolean InitAngleBetweenPlanarFaces (const TopoDS_Face & theFirstFace,const TopoDS_Face & theSecondFace,gp_Pnt & theCenter,gp_Pnt & theFirstAttach,gp_Pnt & theSecondAttach,const Standard_Boolean theIsFirstPointSet = Standard_False);
		%feature("autodoc", "Args:
	theFirstFace(TopoDS_Face)
	theSecondFace(TopoDS_Face)
	theFirstSurfType(AIS_KindOfSurface)
	theSecondSurfType(AIS_KindOfSurface)
	theCenter(gp_Pnt)
	theFirstAttach(gp_Pnt)
	theSecondAttach(gp_Pnt)
	theIsFirstPointSet(Standard_Boolean)=Standard_False

Returns:
	static Standard_Boolean

Finds three points for the angle dimension between  
two curvilinear surfaces.") InitAngleBetweenCurvilinearFaces;
		static Standard_Boolean InitAngleBetweenCurvilinearFaces (const TopoDS_Face & theFirstFace,const TopoDS_Face & theSecondFace,const AIS_KindOfSurface theFirstSurfType,const AIS_KindOfSurface theSecondSurfType,gp_Pnt & theCenter,gp_Pnt & theFirstAttach,gp_Pnt & theSecondAttach,const Standard_Boolean theIsFirstPointSet = Standard_False);
		%feature("autodoc", "Args:
	aPoint(gp_Pnt)
	aPlane(gp_Pln)

Returns:
	static gp_Pnt

No detailed docstring for this function.") ProjectPointOnPlane;
		static gp_Pnt ProjectPointOnPlane (const gp_Pnt & aPoint,const gp_Pln & aPlane);
		%feature("autodoc", "Args:
	aPoint(gp_Pnt)
	aLine(gp_Lin)

Returns:
	static gp_Pnt

No detailed docstring for this function.") ProjectPointOnLine;
		static gp_Pnt ProjectPointOnLine (const gp_Pnt & aPoint,const gp_Lin & aLine);
		%feature("autodoc", "Args:
	aPoint(gp_Pnt)
	aDir(gp_Dir)
	aBndBox(Bnd_Box)

Returns:
	static gp_Pnt

No detailed docstring for this function.") TranslatePointToBound;
		static gp_Pnt TranslatePointToBound (const gp_Pnt & aPoint,const gp_Dir & aDir,const Bnd_Box & aBndBox);
		%feature("autodoc", "Args:
	aFirstPar(Standard_Real)
	aLastPar(Standard_Real)
	anAttachPar(Standard_Real)

Returns:
	static Standard_Boolean

returns  True  if  point  with anAttachPar  is  
         in  domain  of  arc") InDomain;
		static Standard_Boolean InDomain (const Standard_Real aFirstPar,const Standard_Real aLastPar,const Standard_Real anAttachPar);
		%feature("autodoc", "Args:
	elips(gp_Elips)
	pApex(gp_Pnt)
	nApex(gp_Pnt)
	fpara(Standard_Real)
	lpara(Standard_Real)
	IsInDomain(Standard_Boolean)

Returns:
	static gp_Pnt

computes  nearest  to  ellipse  arc  apex") NearestApex;
		static gp_Pnt NearestApex (const gp_Elips & elips,const gp_Pnt & pApex,const gp_Pnt & nApex,const Standard_Real fpara,const Standard_Real lpara,Standard_Boolean & IsInDomain);
		%feature("autodoc", "Args:
	elips(gp_Elips)
	Apex(gp_Pnt)
	par(Standard_Real)

Returns:
	static Standard_Real

computes  length  of  ellipse  arc  in  parametric  units") DistanceFromApex;
		static Standard_Real DistanceFromApex (const gp_Elips & elips,const gp_Pnt & Apex,const Standard_Real par);
		%feature("autodoc", "Args:
	aPres(Handle_Prs3d_Presentation)
	aDrawer(Handle_AIS_Drawer)
	anEdge(TopoDS_Edge)
	ProjCurve(Handle_Geom_Curve)
	FirstP(gp_Pnt)
	LastP(gp_Pnt)
	aColor(Quantity_NameOfColor)=Quantity_NOC_PURPLE
	aWidth(Standard_Real)=2
	aProjTOL(Aspect_TypeOfLine)=Aspect_TOL_DASH
	aCallTOL(Aspect_TypeOfLine)=Aspect_TOL_DOT

Returns:
	static void

No detailed docstring for this function.") ComputeProjEdgePresentation;
		static void ComputeProjEdgePresentation (const Handle_Prs3d_Presentation & aPres,const Handle_AIS_Drawer & aDrawer,const TopoDS_Edge & anEdge,const Handle_Geom_Curve & ProjCurve,const gp_Pnt & FirstP,const gp_Pnt & LastP,const Quantity_NameOfColor aColor = Quantity_NOC_PURPLE,const Standard_Real aWidth = 2,const Aspect_TypeOfLine aProjTOL = Aspect_TOL_DASH,const Aspect_TypeOfLine aCallTOL = Aspect_TOL_DOT);
		%feature("autodoc", "Args:
	aPres(Handle_Prs3d_Presentation)
	aDrawer(Handle_AIS_Drawer)
	aVertex(TopoDS_Vertex)
	ProjPoint(gp_Pnt)
	aColor(Quantity_NameOfColor)=Quantity_NOC_PURPLE
	aWidth(Standard_Real)=2
	aProjTOM(Aspect_TypeOfMarker)=Aspect_TOM_PLUS
	aCallTOL(Aspect_TypeOfLine)=Aspect_TOL_DOT

Returns:
	static void

No detailed docstring for this function.") ComputeProjVertexPresentation;
		static void ComputeProjVertexPresentation (const Handle_Prs3d_Presentation & aPres,const Handle_AIS_Drawer & aDrawer,const TopoDS_Vertex & aVertex,const gp_Pnt & ProjPoint,const Quantity_NameOfColor aColor = Quantity_NOC_PURPLE,const Standard_Real aWidth = 2,const Aspect_TypeOfMarker aProjTOM = Aspect_TOM_PLUS,const Aspect_TypeOfLine aCallTOL = Aspect_TOL_DOT);
};


%feature("shadow") AIS::~AIS %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend AIS {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor AIS_AttributeFilter;
class AIS_AttributeFilter : public SelectMgr_Filter {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

Constructs an empty attribute filter object.  
This filter object determines whether selectable  
interactive objects have a non-null owner.") AIS_AttributeFilter;
		 AIS_AttributeFilter ();
		%feature("autodoc", "Args:
	aCol(Quantity_NameOfColor)

Returns:
	None

Constructs an attribute filter object defined by the  
color attribute aCol.") AIS_AttributeFilter;
		 AIS_AttributeFilter (const Quantity_NameOfColor aCol);
		%feature("autodoc", "Args:
	aWidth(Standard_Real)

Returns:
	None

Constructs an attribute filter object defined by the line  
width attribute aWidth.") AIS_AttributeFilter;
		 AIS_AttributeFilter (const Standard_Real aWidth);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Indicates that the Interactive Object has the color  
setting specified by the argument aCol at construction time.") HasColor;
		Standard_Boolean HasColor ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Indicates that the Interactive Object has the width  
setting specified by the argument aWidth at  
construction time.") HasWidth;
		Standard_Boolean HasWidth ();
		%feature("autodoc", "Args:
	aCol(Quantity_NameOfColor)

Returns:
	None

Sets the color aCol.  
This must be chosen from the list of colors in Quantity_NameOfColor.") SetColor;
		void SetColor (const Quantity_NameOfColor aCol);
		%feature("autodoc", "Args:
	aWidth(Standard_Real)

Returns:
	None

Sets the line width aWidth.") SetWidth;
		void SetWidth (const Standard_Real aWidth);
		%feature("autodoc", "Args:
	None
Returns:
	None

Removes the setting for color from the filter.") UnsetColor;
		void UnsetColor ();
		%feature("autodoc", "Args:
	None
Returns:
	None

Removes the setting for width from the filter.") UnsetWidth;
		void UnsetWidth ();
		%feature("autodoc", "Args:
	anObj(Handle_SelectMgr_EntityOwner)

Returns:
	virtual Standard_Boolean

Indicates that the selected Interactive Object passes  
the filter. The owner, anObj, can be either direct or  
user. A direct owner is the corresponding  
construction element, whereas a user is the  
compound shape of which the entity forms a part.  
If the Interactive Object returns Standard_True  
when detected by the Local Context selector through  
the mouse, the object is kept; if not, it is rejected.") IsOk;
		virtual Standard_Boolean IsOk (const Handle_SelectMgr_EntityOwner & anObj);
};


%feature("shadow") AIS_AttributeFilter::~AIS_AttributeFilter %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend AIS_AttributeFilter {
	void _kill_pointed() {
		delete $self;
	}
};
%extend AIS_AttributeFilter {
	Handle_AIS_AttributeFilter GetHandle() {
	return *(Handle_AIS_AttributeFilter*) &$self;
	}
};

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
    AIS_AttributeFilter* GetObject() {
    return (AIS_AttributeFilter*)$self->Access();
    }
};
%feature("shadow") Handle_AIS_AttributeFilter::~Handle_AIS_AttributeFilter %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_AIS_AttributeFilter {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor AIS_BadEdgeFilter;
class AIS_BadEdgeFilter : public SelectMgr_Filter {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

Constructs an empty filter object for bad edges.") AIS_BadEdgeFilter;
		 AIS_BadEdgeFilter ();
		%feature("autodoc", "Args:
	aType(TopAbs_ShapeEnum)

Returns:
	virtual Standard_Boolean

No detailed docstring for this function.") ActsOn;
		virtual Standard_Boolean ActsOn (const TopAbs_ShapeEnum aType);
		%feature("autodoc", "Args:
	EO(Handle_SelectMgr_EntityOwner)

Returns:
	virtual Standard_Boolean

No detailed docstring for this function.") IsOk;
		virtual Standard_Boolean IsOk (const Handle_SelectMgr_EntityOwner & EO);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	None

sets  <myContour> with  current  contour. used  by  
         IsOk.") SetContour;
		void SetContour (const Standard_Integer Index);
		%feature("autodoc", "Args:
	anEdge(TopoDS_Edge)
	Index(Standard_Integer)

Returns:
	None

Adds an  edge  to the list  of non-selectionnable  
         edges.") AddEdge;
		void AddEdge (const TopoDS_Edge & anEdge,const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	None

removes from the  list of non-selectionnable edges  
         all edges in the contour <Index>.") RemoveEdges;
		void RemoveEdges (const Standard_Integer Index);
};


%feature("shadow") AIS_BadEdgeFilter::~AIS_BadEdgeFilter %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend AIS_BadEdgeFilter {
	void _kill_pointed() {
		delete $self;
	}
};
%extend AIS_BadEdgeFilter {
	Handle_AIS_BadEdgeFilter GetHandle() {
	return *(Handle_AIS_BadEdgeFilter*) &$self;
	}
};

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
    AIS_BadEdgeFilter* GetObject() {
    return (AIS_BadEdgeFilter*)$self->Access();
    }
};
%feature("shadow") Handle_AIS_BadEdgeFilter::~Handle_AIS_BadEdgeFilter %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_AIS_BadEdgeFilter {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor AIS_C0RegularityFilter;
class AIS_C0RegularityFilter : public SelectMgr_Filter {
	public:
		%feature("autodoc", "Args:
	aShape(TopoDS_Shape)

Returns:
	None

No detailed docstring for this function.") AIS_C0RegularityFilter;
		 AIS_C0RegularityFilter (const TopoDS_Shape & aShape);
		%feature("autodoc", "Args:
	aType(TopAbs_ShapeEnum)

Returns:
	virtual Standard_Boolean

No detailed docstring for this function.") ActsOn;
		virtual Standard_Boolean ActsOn (const TopAbs_ShapeEnum aType);
		%feature("autodoc", "Args:
	EO(Handle_SelectMgr_EntityOwner)

Returns:
	virtual Standard_Boolean

No detailed docstring for this function.") IsOk;
		virtual Standard_Boolean IsOk (const Handle_SelectMgr_EntityOwner & EO);
};


%feature("shadow") AIS_C0RegularityFilter::~AIS_C0RegularityFilter %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend AIS_C0RegularityFilter {
	void _kill_pointed() {
		delete $self;
	}
};
%extend AIS_C0RegularityFilter {
	Handle_AIS_C0RegularityFilter GetHandle() {
	return *(Handle_AIS_C0RegularityFilter*) &$self;
	}
};

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
    AIS_C0RegularityFilter* GetObject() {
    return (AIS_C0RegularityFilter*)$self->Access();
    }
};
%feature("shadow") Handle_AIS_C0RegularityFilter::~Handle_AIS_C0RegularityFilter %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_AIS_C0RegularityFilter {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor AIS_DataMapIteratorOfDataMapOfILC;
class AIS_DataMapIteratorOfDataMapOfILC : public TCollection_BasicMapIterator {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") AIS_DataMapIteratorOfDataMapOfILC;
		 AIS_DataMapIteratorOfDataMapOfILC ();
		%feature("autodoc", "Args:
	aMap(AIS_DataMapOfILC)

Returns:
	None

No detailed docstring for this function.") AIS_DataMapIteratorOfDataMapOfILC;
		 AIS_DataMapIteratorOfDataMapOfILC (const AIS_DataMapOfILC & aMap);
		%feature("autodoc", "Args:
	aMap(AIS_DataMapOfILC)

Returns:
	None

No detailed docstring for this function.") Initialize;
		void Initialize (const AIS_DataMapOfILC & aMap);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Key;
		const Standard_Integer & Key ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_AIS_LocalContext

No detailed docstring for this function.") Value;
		const Handle_AIS_LocalContext & Value ();
};


%feature("shadow") AIS_DataMapIteratorOfDataMapOfILC::~AIS_DataMapIteratorOfDataMapOfILC %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend AIS_DataMapIteratorOfDataMapOfILC {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor AIS_DataMapIteratorOfDataMapOfIOStatus;
class AIS_DataMapIteratorOfDataMapOfIOStatus : public TCollection_BasicMapIterator {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") AIS_DataMapIteratorOfDataMapOfIOStatus;
		 AIS_DataMapIteratorOfDataMapOfIOStatus ();
		%feature("autodoc", "Args:
	aMap(AIS_DataMapOfIOStatus)

Returns:
	None

No detailed docstring for this function.") AIS_DataMapIteratorOfDataMapOfIOStatus;
		 AIS_DataMapIteratorOfDataMapOfIOStatus (const AIS_DataMapOfIOStatus & aMap);
		%feature("autodoc", "Args:
	aMap(AIS_DataMapOfIOStatus)

Returns:
	None

No detailed docstring for this function.") Initialize;
		void Initialize (const AIS_DataMapOfIOStatus & aMap);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_AIS_InteractiveObject

No detailed docstring for this function.") Key;
		const Handle_AIS_InteractiveObject & Key ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_AIS_GlobalStatus

No detailed docstring for this function.") Value;
		const Handle_AIS_GlobalStatus & Value ();
};


%feature("shadow") AIS_DataMapIteratorOfDataMapOfIOStatus::~AIS_DataMapIteratorOfDataMapOfIOStatus %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend AIS_DataMapIteratorOfDataMapOfIOStatus {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor AIS_DataMapIteratorOfDataMapOfSelStat;
class AIS_DataMapIteratorOfDataMapOfSelStat : public TCollection_BasicMapIterator {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") AIS_DataMapIteratorOfDataMapOfSelStat;
		 AIS_DataMapIteratorOfDataMapOfSelStat ();
		%feature("autodoc", "Args:
	aMap(AIS_DataMapOfSelStat)

Returns:
	None

No detailed docstring for this function.") AIS_DataMapIteratorOfDataMapOfSelStat;
		 AIS_DataMapIteratorOfDataMapOfSelStat (const AIS_DataMapOfSelStat & aMap);
		%feature("autodoc", "Args:
	aMap(AIS_DataMapOfSelStat)

Returns:
	None

No detailed docstring for this function.") Initialize;
		void Initialize (const AIS_DataMapOfSelStat & aMap);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_SelectMgr_SelectableObject

No detailed docstring for this function.") Key;
		const Handle_SelectMgr_SelectableObject & Key ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_AIS_LocalStatus

No detailed docstring for this function.") Value;
		const Handle_AIS_LocalStatus & Value ();
};


%feature("shadow") AIS_DataMapIteratorOfDataMapOfSelStat::~AIS_DataMapIteratorOfDataMapOfSelStat %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend AIS_DataMapIteratorOfDataMapOfSelStat {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor AIS_DataMapIteratorOfDataMapofIntegerListOfinteractive;
class AIS_DataMapIteratorOfDataMapofIntegerListOfinteractive : public TCollection_BasicMapIterator {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") AIS_DataMapIteratorOfDataMapofIntegerListOfinteractive;
		 AIS_DataMapIteratorOfDataMapofIntegerListOfinteractive ();
		%feature("autodoc", "Args:
	aMap(AIS_DataMapofIntegerListOfinteractive)

Returns:
	None

No detailed docstring for this function.") AIS_DataMapIteratorOfDataMapofIntegerListOfinteractive;
		 AIS_DataMapIteratorOfDataMapofIntegerListOfinteractive (const AIS_DataMapofIntegerListOfinteractive & aMap);
		%feature("autodoc", "Args:
	aMap(AIS_DataMapofIntegerListOfinteractive)

Returns:
	None

No detailed docstring for this function.") Initialize;
		void Initialize (const AIS_DataMapofIntegerListOfinteractive & aMap);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Key;
		const Standard_Integer & Key ();
		%feature("autodoc", "Args:
	None
Returns:
	AIS_ListOfInteractive

No detailed docstring for this function.") Value;
		const AIS_ListOfInteractive & Value ();
};


%feature("shadow") AIS_DataMapIteratorOfDataMapofIntegerListOfinteractive::~AIS_DataMapIteratorOfDataMapofIntegerListOfinteractive %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend AIS_DataMapIteratorOfDataMapofIntegerListOfinteractive {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor AIS_DataMapNodeOfDataMapOfILC;
class AIS_DataMapNodeOfDataMapOfILC : public TCollection_MapNode {
	public:
		%feature("autodoc", "Args:
	K(Standard_Integer)
	I(Handle_AIS_LocalContext)
	n(TCollection_MapNodePtr)

Returns:
	None

No detailed docstring for this function.") AIS_DataMapNodeOfDataMapOfILC;
		 AIS_DataMapNodeOfDataMapOfILC (Standard_Integer &OutValue,const Handle_AIS_LocalContext & I,const TCollection_MapNodePtr & n);

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
            		%feature("autodoc", "Args:
	None
Returns:
	Handle_AIS_LocalContext

No detailed docstring for this function.") Value;
		Handle_AIS_LocalContext & Value ();
};


%feature("shadow") AIS_DataMapNodeOfDataMapOfILC::~AIS_DataMapNodeOfDataMapOfILC %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend AIS_DataMapNodeOfDataMapOfILC {
	void _kill_pointed() {
		delete $self;
	}
};
%extend AIS_DataMapNodeOfDataMapOfILC {
	Handle_AIS_DataMapNodeOfDataMapOfILC GetHandle() {
	return *(Handle_AIS_DataMapNodeOfDataMapOfILC*) &$self;
	}
};

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
    AIS_DataMapNodeOfDataMapOfILC* GetObject() {
    return (AIS_DataMapNodeOfDataMapOfILC*)$self->Access();
    }
};
%feature("shadow") Handle_AIS_DataMapNodeOfDataMapOfILC::~Handle_AIS_DataMapNodeOfDataMapOfILC %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_AIS_DataMapNodeOfDataMapOfILC {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor AIS_DataMapNodeOfDataMapOfIOStatus;
class AIS_DataMapNodeOfDataMapOfIOStatus : public TCollection_MapNode {
	public:
		%feature("autodoc", "Args:
	K(Handle_AIS_InteractiveObject)
	I(Handle_AIS_GlobalStatus)
	n(TCollection_MapNodePtr)

Returns:
	None

No detailed docstring for this function.") AIS_DataMapNodeOfDataMapOfIOStatus;
		 AIS_DataMapNodeOfDataMapOfIOStatus (const Handle_AIS_InteractiveObject & K,const Handle_AIS_GlobalStatus & I,const TCollection_MapNodePtr & n);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_AIS_InteractiveObject

No detailed docstring for this function.") Key;
		Handle_AIS_InteractiveObject & Key ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_AIS_GlobalStatus

No detailed docstring for this function.") Value;
		Handle_AIS_GlobalStatus & Value ();
};


%feature("shadow") AIS_DataMapNodeOfDataMapOfIOStatus::~AIS_DataMapNodeOfDataMapOfIOStatus %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend AIS_DataMapNodeOfDataMapOfIOStatus {
	void _kill_pointed() {
		delete $self;
	}
};
%extend AIS_DataMapNodeOfDataMapOfIOStatus {
	Handle_AIS_DataMapNodeOfDataMapOfIOStatus GetHandle() {
	return *(Handle_AIS_DataMapNodeOfDataMapOfIOStatus*) &$self;
	}
};

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
    AIS_DataMapNodeOfDataMapOfIOStatus* GetObject() {
    return (AIS_DataMapNodeOfDataMapOfIOStatus*)$self->Access();
    }
};
%feature("shadow") Handle_AIS_DataMapNodeOfDataMapOfIOStatus::~Handle_AIS_DataMapNodeOfDataMapOfIOStatus %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_AIS_DataMapNodeOfDataMapOfIOStatus {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor AIS_DataMapNodeOfDataMapOfSelStat;
class AIS_DataMapNodeOfDataMapOfSelStat : public TCollection_MapNode {
	public:
		%feature("autodoc", "Args:
	K(Handle_SelectMgr_SelectableObject)
	I(Handle_AIS_LocalStatus)
	n(TCollection_MapNodePtr)

Returns:
	None

No detailed docstring for this function.") AIS_DataMapNodeOfDataMapOfSelStat;
		 AIS_DataMapNodeOfDataMapOfSelStat (const Handle_SelectMgr_SelectableObject & K,const Handle_AIS_LocalStatus & I,const TCollection_MapNodePtr & n);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_SelectMgr_SelectableObject

No detailed docstring for this function.") Key;
		Handle_SelectMgr_SelectableObject & Key ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_AIS_LocalStatus

No detailed docstring for this function.") Value;
		Handle_AIS_LocalStatus & Value ();
};


%feature("shadow") AIS_DataMapNodeOfDataMapOfSelStat::~AIS_DataMapNodeOfDataMapOfSelStat %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend AIS_DataMapNodeOfDataMapOfSelStat {
	void _kill_pointed() {
		delete $self;
	}
};
%extend AIS_DataMapNodeOfDataMapOfSelStat {
	Handle_AIS_DataMapNodeOfDataMapOfSelStat GetHandle() {
	return *(Handle_AIS_DataMapNodeOfDataMapOfSelStat*) &$self;
	}
};

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
    AIS_DataMapNodeOfDataMapOfSelStat* GetObject() {
    return (AIS_DataMapNodeOfDataMapOfSelStat*)$self->Access();
    }
};
%feature("shadow") Handle_AIS_DataMapNodeOfDataMapOfSelStat::~Handle_AIS_DataMapNodeOfDataMapOfSelStat %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_AIS_DataMapNodeOfDataMapOfSelStat {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor AIS_DataMapNodeOfDataMapofIntegerListOfinteractive;
class AIS_DataMapNodeOfDataMapofIntegerListOfinteractive : public TCollection_MapNode {
	public:
		%feature("autodoc", "Args:
	K(Standard_Integer)
	I(AIS_ListOfInteractive)
	n(TCollection_MapNodePtr)

Returns:
	None

No detailed docstring for this function.") AIS_DataMapNodeOfDataMapofIntegerListOfinteractive;
		 AIS_DataMapNodeOfDataMapofIntegerListOfinteractive (Standard_Integer &OutValue,const AIS_ListOfInteractive & I,const TCollection_MapNodePtr & n);

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
            		%feature("autodoc", "Args:
	None
Returns:
	AIS_ListOfInteractive

No detailed docstring for this function.") Value;
		AIS_ListOfInteractive & Value ();
};


%feature("shadow") AIS_DataMapNodeOfDataMapofIntegerListOfinteractive::~AIS_DataMapNodeOfDataMapofIntegerListOfinteractive %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend AIS_DataMapNodeOfDataMapofIntegerListOfinteractive {
	void _kill_pointed() {
		delete $self;
	}
};
%extend AIS_DataMapNodeOfDataMapofIntegerListOfinteractive {
	Handle_AIS_DataMapNodeOfDataMapofIntegerListOfinteractive GetHandle() {
	return *(Handle_AIS_DataMapNodeOfDataMapofIntegerListOfinteractive*) &$self;
	}
};

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
    AIS_DataMapNodeOfDataMapofIntegerListOfinteractive* GetObject() {
    return (AIS_DataMapNodeOfDataMapofIntegerListOfinteractive*)$self->Access();
    }
};
%feature("shadow") Handle_AIS_DataMapNodeOfDataMapofIntegerListOfinteractive::~Handle_AIS_DataMapNodeOfDataMapofIntegerListOfinteractive %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_AIS_DataMapNodeOfDataMapofIntegerListOfinteractive {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor AIS_DataMapOfILC;
class AIS_DataMapOfILC : public TCollection_BasicMap {
	public:
		%feature("autodoc", "Args:
	NbBuckets(Standard_Integer)=1

Returns:
	None

No detailed docstring for this function.") AIS_DataMapOfILC;
		 AIS_DataMapOfILC (const Standard_Integer NbBuckets = 1);
		%feature("autodoc", "Args:
	Other(AIS_DataMapOfILC)

Returns:
	AIS_DataMapOfILC

No detailed docstring for this function.") Assign;
		AIS_DataMapOfILC & Assign (const AIS_DataMapOfILC & Other);
		%feature("autodoc", "Args:
	Other(AIS_DataMapOfILC)

Returns:
	AIS_DataMapOfILC

No detailed docstring for this function.") operator=;
		AIS_DataMapOfILC & operator = (const AIS_DataMapOfILC & Other);
		%feature("autodoc", "Args:
	NbBuckets(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") ReSize;
		void ReSize (const Standard_Integer NbBuckets);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	K(Standard_Integer)
	I(Handle_AIS_LocalContext)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Bind;
		Standard_Boolean Bind (Standard_Integer &OutValue,const Handle_AIS_LocalContext & I);
		%feature("autodoc", "Args:
	K(Standard_Integer)

Returns:
	Standard_Boolean

No detailed docstring for this function.") IsBound;
		Standard_Boolean IsBound (Standard_Integer &OutValue);
		%feature("autodoc", "Args:
	K(Standard_Integer)

Returns:
	Standard_Boolean

No detailed docstring for this function.") UnBind;
		Standard_Boolean UnBind (Standard_Integer &OutValue);
		%feature("autodoc", "Args:
	K(Standard_Integer)

Returns:
	Handle_AIS_LocalContext

No detailed docstring for this function.") Find;
		const Handle_AIS_LocalContext & Find (Standard_Integer &OutValue);
		%feature("autodoc", "Args:
	K(Standard_Integer)

Returns:
	Handle_AIS_LocalContext

No detailed docstring for this function.") ChangeFind;
		Handle_AIS_LocalContext & ChangeFind (Standard_Integer &OutValue);
		%feature("autodoc", "Args:
	K(Standard_Integer)

Returns:
	Standard_Address

No detailed docstring for this function.") Find1;
		Standard_Address Find1 (Standard_Integer &OutValue);
		%feature("autodoc", "Args:
	K(Standard_Integer)

Returns:
	Standard_Address

No detailed docstring for this function.") ChangeFind1;
		Standard_Address ChangeFind1 (Standard_Integer &OutValue);
};


%feature("shadow") AIS_DataMapOfILC::~AIS_DataMapOfILC %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend AIS_DataMapOfILC {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor AIS_DataMapOfIOStatus;
class AIS_DataMapOfIOStatus : public TCollection_BasicMap {
	public:
		%feature("autodoc", "Args:
	NbBuckets(Standard_Integer)=1

Returns:
	None

No detailed docstring for this function.") AIS_DataMapOfIOStatus;
		 AIS_DataMapOfIOStatus (const Standard_Integer NbBuckets = 1);
		%feature("autodoc", "Args:
	Other(AIS_DataMapOfIOStatus)

Returns:
	AIS_DataMapOfIOStatus

No detailed docstring for this function.") Assign;
		AIS_DataMapOfIOStatus & Assign (const AIS_DataMapOfIOStatus & Other);
		%feature("autodoc", "Args:
	Other(AIS_DataMapOfIOStatus)

Returns:
	AIS_DataMapOfIOStatus

No detailed docstring for this function.") operator=;
		AIS_DataMapOfIOStatus & operator = (const AIS_DataMapOfIOStatus & Other);
		%feature("autodoc", "Args:
	NbBuckets(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") ReSize;
		void ReSize (const Standard_Integer NbBuckets);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	K(Handle_AIS_InteractiveObject)
	I(Handle_AIS_GlobalStatus)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Bind;
		Standard_Boolean Bind (const Handle_AIS_InteractiveObject & K,const Handle_AIS_GlobalStatus & I);
		%feature("autodoc", "Args:
	K(Handle_AIS_InteractiveObject)

Returns:
	Standard_Boolean

No detailed docstring for this function.") IsBound;
		Standard_Boolean IsBound (const Handle_AIS_InteractiveObject & K);
		%feature("autodoc", "Args:
	K(Handle_AIS_InteractiveObject)

Returns:
	Standard_Boolean

No detailed docstring for this function.") UnBind;
		Standard_Boolean UnBind (const Handle_AIS_InteractiveObject & K);
		%feature("autodoc", "Args:
	K(Handle_AIS_InteractiveObject)

Returns:
	Handle_AIS_GlobalStatus

No detailed docstring for this function.") Find;
		const Handle_AIS_GlobalStatus & Find (const Handle_AIS_InteractiveObject & K);
		%feature("autodoc", "Args:
	K(Handle_AIS_InteractiveObject)

Returns:
	Handle_AIS_GlobalStatus

No detailed docstring for this function.") ChangeFind;
		Handle_AIS_GlobalStatus & ChangeFind (const Handle_AIS_InteractiveObject & K);
		%feature("autodoc", "Args:
	K(Handle_AIS_InteractiveObject)

Returns:
	Standard_Address

No detailed docstring for this function.") Find1;
		Standard_Address Find1 (const Handle_AIS_InteractiveObject & K);
		%feature("autodoc", "Args:
	K(Handle_AIS_InteractiveObject)

Returns:
	Standard_Address

No detailed docstring for this function.") ChangeFind1;
		Standard_Address ChangeFind1 (const Handle_AIS_InteractiveObject & K);
};


%feature("shadow") AIS_DataMapOfIOStatus::~AIS_DataMapOfIOStatus %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend AIS_DataMapOfIOStatus {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor AIS_DataMapOfSelStat;
class AIS_DataMapOfSelStat : public TCollection_BasicMap {
	public:
		%feature("autodoc", "Args:
	NbBuckets(Standard_Integer)=1

Returns:
	None

No detailed docstring for this function.") AIS_DataMapOfSelStat;
		 AIS_DataMapOfSelStat (const Standard_Integer NbBuckets = 1);
		%feature("autodoc", "Args:
	Other(AIS_DataMapOfSelStat)

Returns:
	AIS_DataMapOfSelStat

No detailed docstring for this function.") Assign;
		AIS_DataMapOfSelStat & Assign (const AIS_DataMapOfSelStat & Other);
		%feature("autodoc", "Args:
	Other(AIS_DataMapOfSelStat)

Returns:
	AIS_DataMapOfSelStat

No detailed docstring for this function.") operator=;
		AIS_DataMapOfSelStat & operator = (const AIS_DataMapOfSelStat & Other);
		%feature("autodoc", "Args:
	NbBuckets(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") ReSize;
		void ReSize (const Standard_Integer NbBuckets);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	K(Handle_SelectMgr_SelectableObject)
	I(Handle_AIS_LocalStatus)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Bind;
		Standard_Boolean Bind (const Handle_SelectMgr_SelectableObject & K,const Handle_AIS_LocalStatus & I);
		%feature("autodoc", "Args:
	K(Handle_SelectMgr_SelectableObject)

Returns:
	Standard_Boolean

No detailed docstring for this function.") IsBound;
		Standard_Boolean IsBound (const Handle_SelectMgr_SelectableObject & K);
		%feature("autodoc", "Args:
	K(Handle_SelectMgr_SelectableObject)

Returns:
	Standard_Boolean

No detailed docstring for this function.") UnBind;
		Standard_Boolean UnBind (const Handle_SelectMgr_SelectableObject & K);
		%feature("autodoc", "Args:
	K(Handle_SelectMgr_SelectableObject)

Returns:
	Handle_AIS_LocalStatus

No detailed docstring for this function.") Find;
		const Handle_AIS_LocalStatus & Find (const Handle_SelectMgr_SelectableObject & K);
		%feature("autodoc", "Args:
	K(Handle_SelectMgr_SelectableObject)

Returns:
	Handle_AIS_LocalStatus

No detailed docstring for this function.") ChangeFind;
		Handle_AIS_LocalStatus & ChangeFind (const Handle_SelectMgr_SelectableObject & K);
		%feature("autodoc", "Args:
	K(Handle_SelectMgr_SelectableObject)

Returns:
	Standard_Address

No detailed docstring for this function.") Find1;
		Standard_Address Find1 (const Handle_SelectMgr_SelectableObject & K);
		%feature("autodoc", "Args:
	K(Handle_SelectMgr_SelectableObject)

Returns:
	Standard_Address

No detailed docstring for this function.") ChangeFind1;
		Standard_Address ChangeFind1 (const Handle_SelectMgr_SelectableObject & K);
};


%feature("shadow") AIS_DataMapOfSelStat::~AIS_DataMapOfSelStat %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend AIS_DataMapOfSelStat {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor AIS_DataMapofIntegerListOfinteractive;
class AIS_DataMapofIntegerListOfinteractive : public TCollection_BasicMap {
	public:
		%feature("autodoc", "Args:
	NbBuckets(Standard_Integer)=1

Returns:
	None

No detailed docstring for this function.") AIS_DataMapofIntegerListOfinteractive;
		 AIS_DataMapofIntegerListOfinteractive (const Standard_Integer NbBuckets = 1);
		%feature("autodoc", "Args:
	Other(AIS_DataMapofIntegerListOfinteractive)

Returns:
	AIS_DataMapofIntegerListOfinteractive

No detailed docstring for this function.") Assign;
		AIS_DataMapofIntegerListOfinteractive & Assign (const AIS_DataMapofIntegerListOfinteractive & Other);
		%feature("autodoc", "Args:
	Other(AIS_DataMapofIntegerListOfinteractive)

Returns:
	AIS_DataMapofIntegerListOfinteractive

No detailed docstring for this function.") operator=;
		AIS_DataMapofIntegerListOfinteractive & operator = (const AIS_DataMapofIntegerListOfinteractive & Other);
		%feature("autodoc", "Args:
	NbBuckets(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") ReSize;
		void ReSize (const Standard_Integer NbBuckets);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	K(Standard_Integer)
	I(AIS_ListOfInteractive)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Bind;
		Standard_Boolean Bind (Standard_Integer &OutValue,const AIS_ListOfInteractive & I);
		%feature("autodoc", "Args:
	K(Standard_Integer)

Returns:
	Standard_Boolean

No detailed docstring for this function.") IsBound;
		Standard_Boolean IsBound (Standard_Integer &OutValue);
		%feature("autodoc", "Args:
	K(Standard_Integer)

Returns:
	Standard_Boolean

No detailed docstring for this function.") UnBind;
		Standard_Boolean UnBind (Standard_Integer &OutValue);
		%feature("autodoc", "Args:
	K(Standard_Integer)

Returns:
	AIS_ListOfInteractive

No detailed docstring for this function.") Find;
		const AIS_ListOfInteractive & Find (Standard_Integer &OutValue);
		%feature("autodoc", "Args:
	K(Standard_Integer)

Returns:
	AIS_ListOfInteractive

No detailed docstring for this function.") ChangeFind;
		AIS_ListOfInteractive & ChangeFind (Standard_Integer &OutValue);
		%feature("autodoc", "Args:
	K(Standard_Integer)

Returns:
	Standard_Address

No detailed docstring for this function.") Find1;
		Standard_Address Find1 (Standard_Integer &OutValue);
		%feature("autodoc", "Args:
	K(Standard_Integer)

Returns:
	Standard_Address

No detailed docstring for this function.") ChangeFind1;
		Standard_Address ChangeFind1 (Standard_Integer &OutValue);
};


%feature("shadow") AIS_DataMapofIntegerListOfinteractive::~AIS_DataMapofIntegerListOfinteractive %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend AIS_DataMapofIntegerListOfinteractive {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor AIS_DimensionOwner;
class AIS_DimensionOwner : public SelectMgr_EntityOwner {
	public:
		%feature("autodoc", "Args:
	theSelObject(Handle_SelectMgr_SelectableObject)
	theSelMode(AIS_DimensionSelectionMode)
	thePriority(Standard_Integer)=0

Returns:
	None

Initializes the dimension owner, theSO, and attributes it  
the priority, thePriority.") AIS_DimensionOwner;
		 AIS_DimensionOwner (const Handle_SelectMgr_SelectableObject & theSelObject,const AIS_DimensionSelectionMode theSelMode,const Standard_Integer thePriority = 0);
		%feature("autodoc", "Args:
	None
Returns:
	AIS_DimensionSelectionMode

No detailed docstring for this function.") SelectionMode;
		AIS_DimensionSelectionMode SelectionMode ();
		%feature("autodoc", "Args:
	thePM(Handle_PrsMgr_PresentationManager3d)
	theColor(Quantity_NameOfColor)
	theMode(Standard_Integer)=0

Returns:
	virtual void

No detailed docstring for this function.") HilightWithColor;
		virtual void HilightWithColor (const Handle_PrsMgr_PresentationManager3d & thePM,const Quantity_NameOfColor theColor,const Standard_Integer theMode = 0);
		%feature("autodoc", "Args:
	thePM(Handle_PrsMgr_PresentationManager)
	theMode(Standard_Integer)=0

Returns:
	virtual Standard_Boolean

Returns true if an object with the selection mode  
aMode is highlighted in the presentation manager aPM.") IsHilighted;
		virtual Standard_Boolean IsHilighted (const Handle_PrsMgr_PresentationManager & thePM,const Standard_Integer theMode = 0);
		%feature("autodoc", "Args:
	thePM(Handle_PrsMgr_PresentationManager)
	theMode(Standard_Integer)=0

Returns:
	virtual void

No detailed docstring for this function.") Hilight;
		virtual void Hilight (const Handle_PrsMgr_PresentationManager & thePM,const Standard_Integer theMode = 0);
		%feature("autodoc", "Args:
	thePM(Handle_PrsMgr_PresentationManager)
	theMode(Standard_Integer)=0

Returns:
	virtual void

Removes highlighting from the selected part of dimension.") Unhilight;
		virtual void Unhilight (const Handle_PrsMgr_PresentationManager & thePM,const Standard_Integer theMode = 0);
};


%feature("shadow") AIS_DimensionOwner::~AIS_DimensionOwner %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend AIS_DimensionOwner {
	void _kill_pointed() {
		delete $self;
	}
};
%extend AIS_DimensionOwner {
	Handle_AIS_DimensionOwner GetHandle() {
	return *(Handle_AIS_DimensionOwner*) &$self;
	}
};

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
    AIS_DimensionOwner* GetObject() {
    return (AIS_DimensionOwner*)$self->Access();
    }
};
%feature("shadow") Handle_AIS_DimensionOwner::~Handle_AIS_DimensionOwner %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_AIS_DimensionOwner {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor AIS_Drawer;
class AIS_Drawer : public Prs3d_Drawer {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

Constructs an empty attribute management framework.") AIS_Drawer;
		 AIS_Drawer ();
		%feature("autodoc", "Args:
	None
Returns:
	Aspect_TypeOfDeflection

Returns the type of chordal deflection: relative to the  
size of the object or absolute.") TypeOfDeflection;
		Aspect_TypeOfDeflection TypeOfDeflection ();
		%feature("autodoc", "Args:
	None
Returns:
	Quantity_Length

Returns the maximal chordal deviation. The default  
value is 0.1. Drawings of curves or patches are  
made with respect to an absolute maximal chordal deviation.") MaximalChordialDeviation;
		Quantity_Length MaximalChordialDeviation ();
		%feature("autodoc", "Args:
	None
Returns:
	None

Sets the hasOwnDeviationCoefficient flag to Standard_False") SetDeviationCoefficient;
		void SetDeviationCoefficient ();
		%feature("autodoc", "Args:
	None
Returns:
	None

Sets the deviation coefficient aCoefficient for  
removal of hidden lines created by different  
viewpoints in different presentations. The Default value is 0.02.") SetHLRDeviationCoefficient;
		void SetHLRDeviationCoefficient ();
		%feature("autodoc", "Args:
	None
Returns:
	None

Sets the hasOwnDeviationAngle flag to Standard_False") SetDeviationAngle;
		void SetDeviationAngle ();
		%feature("autodoc", "Args:
	None
Returns:
	None

Sets the angle of maximum chordal deviation for  
removal of hidden lines created by different viewpoints  
in different presentations. The default value is 20*PI/180.") SetHLRAngle;
		void SetHLRAngle ();
		%feature("autodoc", "Args:
	aCoefficient(Standard_Real)

Returns:
	None

Sets the hasOwnDeviationCoefficient flag to Standard_True,  
         sets myOwnDeviationCoefficient and  myPreviousDeviationCoefficient") SetDeviationCoefficient;
		void SetDeviationCoefficient (const Standard_Real aCoefficient);
		%feature("autodoc", "Args:
	aCoefficient(Standard_Real)

Returns:
	None

Sets the hasOwnHLRDeviationCoefficient flag to Standard_True,  
         sets myOwnHLRDeviationCoefficient and  myPreviousHLRDeviationCoefficient") SetHLRDeviationCoefficient;
		void SetHLRDeviationCoefficient (const Standard_Real aCoefficient);
		%feature("autodoc", "Args:
	anAngle(Standard_Real)

Returns:
	virtual void

Sets the hasOwnDeviationAngle flag to Standard_True,  
         sets myOwnDeviationAngle and  myPreviousDeviationAngle") SetDeviationAngle;
		virtual void SetDeviationAngle (const Standard_Real anAngle);
		%feature("autodoc", "Args:
	anAngle(Standard_Real)

Returns:
	None

Sets the hasOwnHLRDeviationAngle flag to Standard_True,  
         sets myOwnHLRDeviationAngle and  myPreviousHLRDeviationAngle") SetHLRAngle;
		void SetHLRAngle (const Standard_Real anAngle);
		%feature("autodoc", "Args:
	theTypeOfHLR(Prs3d_TypeOfHLR)

Returns:
	None

Sets the type of HLR algorithm  
         used by drawer's interactive objects") SetTypeOfHLR;
		void SetTypeOfHLR (const Prs3d_TypeOfHLR theTypeOfHLR);
		%feature("autodoc", "Args:
	None
Returns:
	Prs3d_TypeOfHLR

Returns the type of HLR algorithm currently in use.") TypeOfHLR;
		Prs3d_TypeOfHLR TypeOfHLR ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

Drawings of curves or patches are made with respect  
to a maximal chordal deviation. A Deviation coefficient  
is used in the shading display mode. The shape is  
seen decomposed into triangles. These are used to  
calculate reflection of light from the surface of the  
object. The triangles are formed from chords of the  
curves in the shape. The deviation coefficient gives  
the highest value of the angle with which a chord can  
deviate from a tangent to a   curve. If this limit is  
reached, a new triangle is begun.  
This deviation is absolute and is set through the  
method: SetMaximalChordialDeviation. The default value is 0.001.  
In drawing shapes, however, you are allowed to ask  
for a relative deviation. This deviation will be:  
SizeOfObject * DeviationCoefficient.") DeviationCoefficient;
		Standard_Real DeviationCoefficient ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

Returns the real number value of the HLR deviation  
coefficient in this framework, if the flag  
hasOwnHLRDeviationCoefficient is true.  
If hasOwnHLRDeviationCoefficient is false, the  
shape's HLR deviation coefficient is used.  
A Deviation coefficient is used in the shading display  
mode. The shape is seen decomposed into triangles.  
These are used to calculate reflection of light from the  
surface of the object.  
The triangles are formed from chords of the curves in  
the shape. The deviation coefficient give the highest  
value of the angle with which a chord can deviate  
from a tangent to a curve. If this limit is reached, a  
new triangle is begun.  
To find the hidden lines, hidden line display mode  
entails recalculation of the view at each different  
projector perspective.  
Since hidden lines entail calculations of more than  
usual complexity to decompose them into these  
triangles, a deviation coefficient allowing greater  
tolerance is used. This increases efficiency in calculation.  
The Default value is 0.02.") HLRDeviationCoefficient;
		Standard_Real HLRDeviationCoefficient ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual Standard_Real

Returns myOwnDeviationAngle if hasOwnDeviationAngle is True  
         else gets myDeviationAngle field from Prs3d_Drawer") DeviationAngle;
		virtual Standard_Real DeviationAngle ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

Returns the real number value of the deviation angle  
in hidden line removal views. The default value is 20*PI/180.") HLRAngle;
		Standard_Real HLRAngle ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

Saves the previous value used for the chordal  
deviation coefficient. The default value is 0.1.") PreviousDeviationCoefficient;
		Standard_Real PreviousDeviationCoefficient ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

returns myPreviousHLRDeviationCoefficient") PreviousHLRDeviationCoefficient;
		Standard_Real PreviousHLRDeviationCoefficient ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

returns myPreviousDeviationAngle") PreviousDeviationAngle;
		Standard_Real PreviousDeviationAngle ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

returns myPreviousHLRDeviationAngle") PreviousHLRDeviationAngle;
		Standard_Real PreviousHLRDeviationAngle ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns true if the there is a local setting for deviation  
coefficient in this framework for a specific interactive object.") IsOwnDeviationCoefficient;
		Standard_Boolean IsOwnDeviationCoefficient ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns true if the there is a setting for HLR deviation  
coefficient in this framework for a specific interactive object.") IsOwnHLRDeviationCoefficient;
		Standard_Boolean IsOwnHLRDeviationCoefficient ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns true if the there is a local setting for deviation  
angle in this framework for a specific interactive object.") IsOwnDeviationAngle;
		Standard_Boolean IsOwnDeviationAngle ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns true if the there is a setting for HLR deviation  
angle in this framework for a specific interactive object.") IsOwnHLRDeviationAngle;
		Standard_Boolean IsOwnHLRDeviationAngle ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Draws algorithms using discretisation, a default  
number of points has been set to 17. You can use the  
method Prs3d_Drawer_SetDiscretisation to change this value.") Discretisation;
		Standard_Integer Discretisation ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

Sets the maximum value allowed for the first and last  
parameters of an infinite curve. By default, this value is 500000.") MaximalParameterValue;
		Standard_Real MaximalParameterValue ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

returns True if the drawing of isos on planes is enabled.") IsoOnPlane;
		Standard_Boolean IsoOnPlane ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Prs3d_IsoAspect

Defines the attributes which are used when drawing an  
         U isoparametric curve of a face. Defines the number  
         of U isoparametric curves to be drawn for a single face.  
         The LineAspect for U isoparametric lines can be edited  
         (methods SetColor, SetTypeOfLine, SetWidth, SetNumber)  
         The default values are:  
         COLOR       : Quantity_NOC_GRAY75  
         TYPE OF LINE: Aspect_TOL_SOLID  
         WIDTH       : 0.5  
These attributes are used by the following algorithms:  
         Prs3d_WFDeflectionSurface  
         Prs3d_WFDeflectionRestrictedFace") UIsoAspect;
		Handle_Prs3d_IsoAspect UIsoAspect ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Prs3d_IsoAspect

Defines the attributes which are used when drawing an  
         V isoparametric curve of a face. Defines the number  
         of V isoparametric curves to be drawn for a single face.  
         The LineAspect for V isoparametric lines can be edited  
         (methods SetColor, SetTypeOfLine, SetWidth, SetNumber)  
         The default values are:  
         COLOR       : Quantity_NOC_GRAY82  
         TYPE OF LINE: Aspect_TOL_SOLID  
         WIDTH       : 0.5  
         These attributes are used by the following algorithms:  
         Prs3d_WFDeflectionSurface  
         Prs3d_WFDeflectionRestrictedFace") VIsoAspect;
		Handle_Prs3d_IsoAspect VIsoAspect ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Prs3d_LineAspect

Returns a link with  
Prs3d_Drawer_FreeBoundaryAspect. Stores the  
values for presentation of free boundaries, in other  
words, boundaries which are not shared . The  
LineAspect for the free boundaries can be edited. The  
default values are: Color: Quantity_NOC_GREEN  
Type of line: Aspect_TOL_SOLID Width: 1.  
These attributes are used by Prs3d_WFShape.") FreeBoundaryAspect;
		Handle_Prs3d_LineAspect FreeBoundaryAspect ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

returns True if the drawing of the free boundaries is enabled.") FreeBoundaryDraw;
		Standard_Boolean FreeBoundaryDraw ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Prs3d_LineAspect

Returns a link with Prs3d_Drawer_WireAspect.  
This method provides wire aspect settings.  
The LineAspect for wires can be edited. The default values are:  
         Color: Quantity_NOC_RED  
         Type of line: Aspect_TOL_SOLID  
         Width: 1.  
         These attributes are used by the following algorithms:  
         Prs3d_WFShape") WireAspect;
		Handle_Prs3d_LineAspect WireAspect ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns true if the Interactive Object has a line  
visualization aspect.") HasLineAspect;
		Standard_Boolean HasLineAspect ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns true if the Drawer has a wire aspect setting active.") HasWireAspect;
		Standard_Boolean HasWireAspect ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns a link   with Prs3d_Drawer_WireDraw. This  
method returns true if drawing of wires is enabled.  
The default setting is true.") WireDraw;
		Standard_Boolean WireDraw ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Prs3d_LineAspect

Returns a link with  
Prs3d_Drawer_UnFreeBoundaryAspect, which  
provides settings for shared boundary line aspects.  
The LineAspect for shared boundaries can be edited.  
The default values are:  
         Color: Quantity_NOC_YELLOW  
         Type of line: Aspect_TOL_SOLID  
         Width: 1.  
         These attributes are used by the following algorithms:  
         Prs3d_WFShape") UnFreeBoundaryAspect;
		Handle_Prs3d_LineAspect UnFreeBoundaryAspect ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns True if the drawing of the shared boundaries  
is enabled. True is the default setting.") UnFreeBoundaryDraw;
		Standard_Boolean UnFreeBoundaryDraw ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Prs3d_LineAspect

Returns a link with Prs3d_Drawer_LineAspect,  
which provides settings for line aspects. These  
settings can be edited. The default values are:  
         Color: Quantity_NOC_YELLOW  
         Type of line: Aspect_TOL_SOLID  
         Width: 1.  
These attributes are used by the following algorithms:  
         Prs3d_Curve  
         Prs3d_Line  
         Prs3d_HLRShape") LineAspect;
		Handle_Prs3d_LineAspect LineAspect ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") HasTextAspect;
		Standard_Boolean HasTextAspect ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Prs3d_TextAspect

No detailed docstring for this function.") TextAspect;
		Handle_Prs3d_TextAspect TextAspect ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns True if the drawing of an arrow at the end of  
each line is enabled. The default setting is False.") LineArrowDraw;
		Standard_Boolean LineArrowDraw ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Prs3d_ArrowAspect

No detailed docstring for this function.") ArrowAspect;
		Handle_Prs3d_ArrowAspect ArrowAspect ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Prs3d_PointAspect

Returns the point aspect setting. The default values  
are:        Color: Quantity_NOC_YELLOW  
         Type of marker: Aspect_TOM_PLUS  
         Scale: 1.  
         These attributes are used by the following algorithms:  
         Prs3d_Point") PointAspect;
		Handle_Prs3d_PointAspect PointAspect ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns true if the Drawer has a point aspect setting active.") HasPointAspect;
		Standard_Boolean HasPointAspect ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Prs3d_ShadingAspect

Returns a link with Prs3d_Drawer_ShadingAspect,  
which provides settings for shading aspects.  
These settings can be edited. The default values are:  
   Color: Quantity_NOC_YELLOW  
         Material: Graphic3d_NOM_BRASS  
hading aspect is obtained through decomposition of  
3D faces into triangles, each side of each triangle  
being a chord of the corresponding curved edge in  
the face. Reflection of light in each projector  
perspective is then calculated for each of the  
resultant triangular planes.") ShadingAspect;
		Handle_Prs3d_ShadingAspect ShadingAspect ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns True if the   Drawer has shading aspect active.") HasShadingAspect;
		Standard_Boolean HasShadingAspect ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Provides the attributes for hidden line removal.") ShadingAspectGlobal;
		Standard_Boolean ShadingAspectGlobal ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns Standard_True if the hidden lines are to be drawn.  
         By default the hidden lines are not drawn.") DrawHiddenLine;
		Standard_Boolean DrawHiddenLine ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Prs3d_LineAspect

Returns a link with  
Prs3d_Drawer_HiddenLineAspect, which provides  
settings for hidden line aspects.  
These settings can be edited. The default values are:  
         Color: Quantity_NOC_YELLOW  
         Type of line: Aspect_TOL_DASH  
         Width: 1.") HiddenLineAspect;
		Handle_Prs3d_LineAspect HiddenLineAspect ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Prs3d_LineAspect

Returns a link with  
Prs3d_Drawer_SeenLineAspect, which provides  
settings for seen line aspects.  
These settings can be edited. The default values are:  
         Color: Quantity_NOC_YELLOW  
         Type of line: Aspect_TOL_SOLID  
         Width: 1.") SeenLineAspect;
		Handle_Prs3d_LineAspect SeenLineAspect ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") HasPlaneAspect;
		Standard_Boolean HasPlaneAspect ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Prs3d_PlaneAspect

Returns a link with Prs3d_Drawer_PlaneAspect.  
This method provides settings for the appearance of planes.") PlaneAspect;
		Handle_Prs3d_PlaneAspect PlaneAspect ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Prs3d_LineAspect

Returns a link with Prs3d_Drawer_VectorAspect,  
which provides settings for the appearance of vectors.  
These settings can be edited. The default values are:  
         Color: Quantity_NOC_SKYBLUE  
         Type of line: Aspect_TOL_SOLID Width: 1.") VectorAspect;
		Handle_Prs3d_LineAspect VectorAspect ();
		%feature("autodoc", "Args:
	theIsEnabled(Standard_Boolean)

Returns:
	None

Enables or disables drawing of face boundaries for shading presentations.  
The method sets drawing flag owned by the drawer that will be used during  
visualization instead of the one set in link.  
theIsEnabled is a boolean flag indicating whether the face boundaries should be  
drawn or not.") SetFaceBoundaryDraw;
		void SetFaceBoundaryDraw (const Standard_Boolean theIsEnabled);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Checks whether the drawing of face boundaries is enabled or not.") IsFaceBoundaryDraw;
		Standard_Boolean IsFaceBoundaryDraw ();
		%feature("autodoc", "Args:
	theAspect(Handle_Prs3d_LineAspect)

Returns:
	None

Sets line aspect for face boundaries.  
The method sets line aspect owned by the drawer that will be used during  
visualization instead of the one set in link.  
theAspect is the line aspect that determines the look of the face boundaries.") SetFaceBoundaryAspect;
		void SetFaceBoundaryAspect (const Handle_Prs3d_LineAspect & theAspect);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Prs3d_LineAspect

Returns line aspect of face boundaries.") FaceBoundaryAspect;
		Handle_Prs3d_LineAspect FaceBoundaryAspect ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns true if the drawer has its own attribute for  
'draw face boundaries' flag that overrides the one in the link.") IsOwnFaceBoundaryDraw;
		Standard_Boolean IsOwnFaceBoundaryDraw ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns true if the drawer has its own attribute for  
face boundaries aspect that overrides the one in the link.") IsOwnFaceBoundaryAspect;
		Standard_Boolean IsOwnFaceBoundaryAspect ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") HasDatumAspect;
		Standard_Boolean HasDatumAspect ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Prs3d_DatumAspect

Returns a link with Prs3d_Drawer_DatumAspect,  
which provides settings for the appearance of datums.  
These settings can be edited. The default values for  
the three axes are:  
         Color: Quantity_NOC_PEACHPUFF  
         Type of line: Aspect_TOL_SOLID Width: 1.") DatumAspect;
		Handle_Prs3d_DatumAspect DatumAspect ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Prs3d_DimensionAspect

Returns a link with Prs3d_Drawer_DimensionAspect,  
which provides settings for the appearance of dimensions.") DimensionAspect;
		Handle_Prs3d_DimensionAspect DimensionAspect ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") HasDimensionAspect;
		Standard_Boolean HasDimensionAspect ();
		%feature("autodoc", "Args:
	theUnits(TCollection_AsciiString)

Returns:
	None

Sets dimension length model units for computing of dimension presentation.") SetDimLengthModelUnits;
		void SetDimLengthModelUnits (const TCollection_AsciiString & theUnits);
		%feature("autodoc", "Args:
	theUnits(TCollection_AsciiString)

Returns:
	None

Sets dimension angle model units for computing of dimension presentation.") SetDimAngleModelUnits;
		void SetDimAngleModelUnits (const TCollection_AsciiString & theUnits);
		%feature("autodoc", "Args:
	None
Returns:
	TCollection_AsciiString

Returns angle model units for the dimension presentation.") DimAngleModelUnits;
		const TCollection_AsciiString & DimAngleModelUnits ();
		%feature("autodoc", "Args:
	None
Returns:
	TCollection_AsciiString

Returns length model units for the dimension presentation.") DimLengthModelUnits;
		const TCollection_AsciiString & DimLengthModelUnits ();
		%feature("autodoc", "Args:
	theUnits(TCollection_AsciiString)

Returns:
	None

Sets length units in which value for dimension presentation is displayed.") SetDimLengthDisplayUnits;
		void SetDimLengthDisplayUnits (const TCollection_AsciiString & theUnits);
		%feature("autodoc", "Args:
	theUnits(TCollection_AsciiString)

Returns:
	None

Sets angle units in which value for dimension presentation is displayed.") SetDimAngleDisplayUnits;
		void SetDimAngleDisplayUnits (const TCollection_AsciiString & theUnits);
		%feature("autodoc", "Args:
	None
Returns:
	TCollection_AsciiString

Returns length units in which dimension presentation is displayed.") DimLengthDisplayUnits;
		const TCollection_AsciiString & DimLengthDisplayUnits ();
		%feature("autodoc", "Args:
	None
Returns:
	TCollection_AsciiString

Returns angle units in which dimension presentation is displayed.") DimAngleDisplayUnits;
		const TCollection_AsciiString & DimAngleDisplayUnits ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Prs3d_LineAspect

Returns a link with Prs3d_Drawer_SectionAspect,  
which provides settings for wires which highlight sections.  
The LineAspect for the wire can be edited.  
The default values are:  
Color: Quantity_NOC_ORANGE  
Type of line: Aspect_TOL_SOLID  
Width: 1.  
These attributes are used by the following algorithms:  
Prs3d_WFShape") SectionAspect;
		Handle_Prs3d_LineAspect SectionAspect ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Prs3d_Drawer

No detailed docstring for this function.") Link;
		const Handle_Prs3d_Drawer & Link ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") HasLink;
		Standard_Boolean HasLink ();
		%feature("autodoc", "Args:
	aDrawer(Handle_Prs3d_Drawer)

Returns:
	None

No detailed docstring for this function.") Link;
		void Link (const Handle_Prs3d_Drawer & aDrawer);
		%feature("autodoc", "Args:
	None
Returns:
	virtual void

Removes attributes stored in a Local Context.") ClearLocalAttributes;
		virtual void ClearLocalAttributes ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns true if the last called attribute was local; false if it was global.") WasLastLocal;
		Standard_Boolean WasLastLocal ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns true if a Local Context has stored attributes  
for Interactive Objects.") HasLocalAttributes;
		Standard_Boolean HasLocalAttributes ();
};


%feature("shadow") AIS_Drawer::~AIS_Drawer %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend AIS_Drawer {
	void _kill_pointed() {
		delete $self;
	}
};
%extend AIS_Drawer {
	Handle_AIS_Drawer GetHandle() {
	return *(Handle_AIS_Drawer*) &$self;
	}
};

%nodefaultctor Handle_AIS_Drawer;
class Handle_AIS_Drawer : public Handle_Prs3d_Drawer {

    public:
        // constructors
        Handle_AIS_Drawer();
        Handle_AIS_Drawer(const Handle_AIS_Drawer &aHandle);
        Handle_AIS_Drawer(const AIS_Drawer *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_AIS_Drawer DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_AIS_Drawer {
    AIS_Drawer* GetObject() {
    return (AIS_Drawer*)$self->Access();
    }
};
%feature("shadow") Handle_AIS_Drawer::~Handle_AIS_Drawer %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_AIS_Drawer {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor AIS_ExclusionFilter;
class AIS_ExclusionFilter : public SelectMgr_Filter {
	public:
		%feature("autodoc", "Args:
	ExclusionFlagOn(Standard_Boolean)=Standard_True

Returns:
	None

Constructs an empty exclusion filter object defined by  
the flag setting ExclusionFlagOn.  
By default, the flag is set to true.") AIS_ExclusionFilter;
		 AIS_ExclusionFilter (const Standard_Boolean ExclusionFlagOn = Standard_True);
		%feature("autodoc", "Args:
	TypeToExclude(AIS_KindOfInteractive)
	ExclusionFlagOn(Standard_Boolean)=Standard_True

Returns:
	None

All the AIS objects of <TypeToExclude>  
         Will be rejected by the IsOk Method.") AIS_ExclusionFilter;
		 AIS_ExclusionFilter (const AIS_KindOfInteractive TypeToExclude,const Standard_Boolean ExclusionFlagOn = Standard_True);
		%feature("autodoc", "Args:
	TypeToExclude(AIS_KindOfInteractive)
	SignatureInType(Standard_Integer)
	ExclusionFlagOn(Standard_Boolean)=Standard_True

Returns:
	None

Constructs an exclusion filter object defined by the  
enumeration value TypeToExclude, the signature  
SignatureInType, and the flag setting ExclusionFlagOn.  
By default, the flag is set to true.") AIS_ExclusionFilter;
		 AIS_ExclusionFilter (const AIS_KindOfInteractive TypeToExclude,const Standard_Integer SignatureInType,const Standard_Boolean ExclusionFlagOn = Standard_True);
		%feature("autodoc", "Args:
	anObj(Handle_SelectMgr_EntityOwner)

Returns:
	virtual Standard_Boolean

No detailed docstring for this function.") IsOk;
		virtual Standard_Boolean IsOk (const Handle_SelectMgr_EntityOwner & anObj);
		%feature("autodoc", "Args:
	TypeToExclude(AIS_KindOfInteractive)

Returns:
	Standard_Boolean

Adds the type TypeToExclude to the list of types.") Add;
		Standard_Boolean Add (const AIS_KindOfInteractive TypeToExclude);
		%feature("autodoc", "Args:
	TypeToExclude(AIS_KindOfInteractive)
	SignatureInType(Standard_Integer)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Add;
		Standard_Boolean Add (const AIS_KindOfInteractive TypeToExclude,const Standard_Integer SignatureInType);
		%feature("autodoc", "Args:
	TypeToExclude(AIS_KindOfInteractive)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Remove;
		Standard_Boolean Remove (const AIS_KindOfInteractive TypeToExclude);
		%feature("autodoc", "Args:
	TypeToExclude(AIS_KindOfInteractive)
	SignatureInType(Standard_Integer)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Remove;
		Standard_Boolean Remove (const AIS_KindOfInteractive TypeToExclude,const Standard_Integer SignatureInType);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsExclusionFlagOn;
		Standard_Boolean IsExclusionFlagOn ();
		%feature("autodoc", "Args:
	Status(Standard_Boolean)

Returns:
	None

No detailed docstring for this function.") SetExclusionFlag;
		void SetExclusionFlag (const Standard_Boolean Status);
		%feature("autodoc", "Args:
	aType(AIS_KindOfInteractive)

Returns:
	Standard_Boolean

No detailed docstring for this function.") IsStored;
		Standard_Boolean IsStored (const AIS_KindOfInteractive aType);
		%feature("autodoc", "Args:
	TheList(TColStd_ListOfInteger)

Returns:
	None

No detailed docstring for this function.") ListOfStoredTypes;
		void ListOfStoredTypes (TColStd_ListOfInteger & TheList);
		%feature("autodoc", "Args:
	aType(AIS_KindOfInteractive)
	TheStoredList(TColStd_ListOfInteger)

Returns:
	None

No detailed docstring for this function.") ListOfSignature;
		void ListOfSignature (const AIS_KindOfInteractive aType,TColStd_ListOfInteger & TheStoredList);
};


%feature("shadow") AIS_ExclusionFilter::~AIS_ExclusionFilter %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend AIS_ExclusionFilter {
	void _kill_pointed() {
		delete $self;
	}
};
%extend AIS_ExclusionFilter {
	Handle_AIS_ExclusionFilter GetHandle() {
	return *(Handle_AIS_ExclusionFilter*) &$self;
	}
};

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
    AIS_ExclusionFilter* GetObject() {
    return (AIS_ExclusionFilter*)$self->Access();
    }
};
%feature("shadow") Handle_AIS_ExclusionFilter::~Handle_AIS_ExclusionFilter %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_AIS_ExclusionFilter {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor AIS_GlobalStatus;
class AIS_GlobalStatus : public MMgt_TShared {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") AIS_GlobalStatus;
		 AIS_GlobalStatus ();
		%feature("autodoc", "Args:
	aStat(AIS_DisplayStatus)
	aDispMode(Standard_Integer)
	aSelMode(Standard_Integer)
	ishilighted(Standard_Boolean)=Standard_False
	TheHiCol(Quantity_NameOfColor)=Quantity_NOC_WHITE
	aLayerIndex(Standard_Integer)=0

Returns:
	None

No detailed docstring for this function.") AIS_GlobalStatus;
		 AIS_GlobalStatus (const AIS_DisplayStatus aStat,const Standard_Integer aDispMode,const Standard_Integer aSelMode,const Standard_Boolean ishilighted = Standard_False,const Quantity_NameOfColor TheHiCol = Quantity_NOC_WHITE,const Standard_Integer aLayerIndex = 0);
		%feature("autodoc", "Args:
	aStat(AIS_DisplayStatus)

Returns:
	None

No detailed docstring for this function.") SetGraphicStatus;
		void SetGraphicStatus (const AIS_DisplayStatus aStat);
		%feature("autodoc", "Args:
	aMode(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") AddDisplayMode;
		void AddDisplayMode (const Standard_Integer aMode);
		%feature("autodoc", "Args:
	aMode(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") AddSelectionMode;
		void AddSelectionMode (const Standard_Integer aMode);
		%feature("autodoc", "Args:
	AnIndex(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") SetLayerIndex;
		void SetLayerIndex (const Standard_Integer AnIndex);
		%feature("autodoc", "Args:
	aStat(Standard_Boolean)

Returns:
	None

No detailed docstring for this function.") SetHilightStatus;
		void SetHilightStatus (const Standard_Boolean aStat);
		%feature("autodoc", "Args:
	aHiCol(Quantity_NameOfColor)

Returns:
	None

No detailed docstring for this function.") SetHilightColor;
		void SetHilightColor (const Quantity_NameOfColor aHiCol);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsSubIntensityOn;
		Standard_Boolean IsSubIntensityOn ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") SubIntensityOn;
		void SubIntensityOn ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") SubIntensityOff;
		void SubIntensityOff ();
		%feature("autodoc", "Args:
	aMode(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") RemoveDisplayMode;
		void RemoveDisplayMode (const Standard_Integer aMode);
		%feature("autodoc", "Args:
	aMode(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") RemoveSelectionMode;
		void RemoveSelectionMode (const Standard_Integer aMode);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") ClearSelectionModes;
		void ClearSelectionModes ();
		%feature("autodoc", "Args:
	None
Returns:
	AIS_DisplayStatus

No detailed docstring for this function.") GraphicStatus;
		AIS_DisplayStatus GraphicStatus ();
		%feature("autodoc", "Args:
	None
Returns:
	TColStd_ListOfInteger

keeps the information of displayed modes in the  
         main viewer.") DisplayedModes;
		const TColStd_ListOfInteger & DisplayedModes ();
		%feature("autodoc", "Args:
	None
Returns:
	TColStd_ListOfInteger

keeps the active selection modes of the object  
         in the main viewer.") SelectionModes;
		const TColStd_ListOfInteger & SelectionModes ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsHilighted;
		Standard_Boolean IsHilighted ();
		%feature("autodoc", "Args:
	None
Returns:
	Quantity_NameOfColor

No detailed docstring for this function.") HilightColor;
		Quantity_NameOfColor HilightColor ();
		%feature("autodoc", "Args:
	aMode(Standard_Integer)

Returns:
	Standard_Boolean

No detailed docstring for this function.") IsDModeIn;
		Standard_Boolean IsDModeIn (const Standard_Integer aMode);
		%feature("autodoc", "Args:
	aMode(Standard_Integer)

Returns:
	Standard_Boolean

No detailed docstring for this function.") IsSModeIn;
		Standard_Boolean IsSModeIn (const Standard_Integer aMode);
};


%feature("shadow") AIS_GlobalStatus::~AIS_GlobalStatus %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend AIS_GlobalStatus {
	void _kill_pointed() {
		delete $self;
	}
};
%extend AIS_GlobalStatus {
	Handle_AIS_GlobalStatus GetHandle() {
	return *(Handle_AIS_GlobalStatus*) &$self;
	}
};

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
    AIS_GlobalStatus* GetObject() {
    return (AIS_GlobalStatus*)$self->Access();
    }
};
%feature("shadow") Handle_AIS_GlobalStatus::~Handle_AIS_GlobalStatus %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_AIS_GlobalStatus {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor AIS_GraphicTool;
class AIS_GraphicTool {
	public:
		%feature("autodoc", "Args:
	aDrawer(Handle_Prs3d_Drawer)
	TheTypeOfAttributes(AIS_TypeOfAttribute)

Returns:
	static Quantity_NameOfColor

No detailed docstring for this function.") GetLineColor;
		static Quantity_NameOfColor GetLineColor (const Handle_Prs3d_Drawer & aDrawer,const AIS_TypeOfAttribute TheTypeOfAttributes);
		%feature("autodoc", "Args:
	aDrawer(Handle_Prs3d_Drawer)
	TheTypeOfAttributes(AIS_TypeOfAttribute)
	TheLineColor(Quantity_Color)

Returns:
	static void

No detailed docstring for this function.") GetLineColor;
		static void GetLineColor (const Handle_Prs3d_Drawer & aDrawer,const AIS_TypeOfAttribute TheTypeOfAttributes,Quantity_Color & TheLineColor);
		%feature("autodoc", "Args:
	aDrawer(Handle_Prs3d_Drawer)
	TheTypeOfAttributes(AIS_TypeOfAttribute)

Returns:
	static Standard_Real

No detailed docstring for this function.") GetLineWidth;
		static Standard_Real GetLineWidth (const Handle_Prs3d_Drawer & aDrawer,const AIS_TypeOfAttribute TheTypeOfAttributes);
		%feature("autodoc", "Args:
	aDrawer(Handle_Prs3d_Drawer)
	TheTypeOfAttributes(AIS_TypeOfAttribute)

Returns:
	static Aspect_TypeOfLine

No detailed docstring for this function.") GetLineType;
		static Aspect_TypeOfLine GetLineType (const Handle_Prs3d_Drawer & aDrawer,const AIS_TypeOfAttribute TheTypeOfAttributes);
		%feature("autodoc", "Args:
	aDrawer(Handle_Prs3d_Drawer)
	TheTypeOfAttributes(AIS_TypeOfAttribute)
	aCol(Quantity_NameOfColor)
	aWidth(Standard_Real)
	aTyp(Aspect_TypeOfLine)

Returns:
	static void

No detailed docstring for this function.") GetLineAtt;
		static void GetLineAtt (const Handle_Prs3d_Drawer & aDrawer,const AIS_TypeOfAttribute TheTypeOfAttributes,Quantity_NameOfColor & aCol,Standard_Real &OutValue,Aspect_TypeOfLine & aTyp);
		%feature("autodoc", "Args:
	aDrawer(Handle_Prs3d_Drawer)

Returns:
	static Quantity_NameOfColor

No detailed docstring for this function.") GetInteriorColor;
		static Quantity_NameOfColor GetInteriorColor (const Handle_Prs3d_Drawer & aDrawer);
		%feature("autodoc", "Args:
	aDrawer(Handle_Prs3d_Drawer)
	aColor(Quantity_Color)

Returns:
	static void

No detailed docstring for this function.") GetInteriorColor;
		static void GetInteriorColor (const Handle_Prs3d_Drawer & aDrawer,Quantity_Color & aColor);
		%feature("autodoc", "Args:
	aDrawer(Handle_Prs3d_Drawer)

Returns:
	static Graphic3d_MaterialAspect

No detailed docstring for this function.") GetMaterial;
		static Graphic3d_MaterialAspect GetMaterial (const Handle_Prs3d_Drawer & aDrawer);
};


%feature("shadow") AIS_GraphicTool::~AIS_GraphicTool %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend AIS_GraphicTool {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor AIS_IndexedDataMapNodeOfIndexedDataMapOfOwnerPrs;
class AIS_IndexedDataMapNodeOfIndexedDataMapOfOwnerPrs : public TCollection_MapNode {
	public:
		%feature("autodoc", "Args:
	K1(Handle_SelectMgr_EntityOwner)
	K2(Standard_Integer)
	I(Handle_Prs3d_Presentation)
	n1(TCollection_MapNodePtr)
	n2(TCollection_MapNodePtr)

Returns:
	None

No detailed docstring for this function.") AIS_IndexedDataMapNodeOfIndexedDataMapOfOwnerPrs;
		 AIS_IndexedDataMapNodeOfIndexedDataMapOfOwnerPrs (const Handle_SelectMgr_EntityOwner & K1,const Standard_Integer K2,const Handle_Prs3d_Presentation & I,const TCollection_MapNodePtr & n1,const TCollection_MapNodePtr & n2);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_SelectMgr_EntityOwner

No detailed docstring for this function.") Key1;
		Handle_SelectMgr_EntityOwner & Key1 ();

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
            		%feature("autodoc", "Args:
	None
Returns:
	TCollection_MapNodePtr

No detailed docstring for this function.") Next2;
		TCollection_MapNodePtr & Next2 ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Prs3d_Presentation

No detailed docstring for this function.") Value;
		Handle_Prs3d_Presentation & Value ();
};


%feature("shadow") AIS_IndexedDataMapNodeOfIndexedDataMapOfOwnerPrs::~AIS_IndexedDataMapNodeOfIndexedDataMapOfOwnerPrs %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend AIS_IndexedDataMapNodeOfIndexedDataMapOfOwnerPrs {
	void _kill_pointed() {
		delete $self;
	}
};
%extend AIS_IndexedDataMapNodeOfIndexedDataMapOfOwnerPrs {
	Handle_AIS_IndexedDataMapNodeOfIndexedDataMapOfOwnerPrs GetHandle() {
	return *(Handle_AIS_IndexedDataMapNodeOfIndexedDataMapOfOwnerPrs*) &$self;
	}
};

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
    AIS_IndexedDataMapNodeOfIndexedDataMapOfOwnerPrs* GetObject() {
    return (AIS_IndexedDataMapNodeOfIndexedDataMapOfOwnerPrs*)$self->Access();
    }
};
%feature("shadow") Handle_AIS_IndexedDataMapNodeOfIndexedDataMapOfOwnerPrs::~Handle_AIS_IndexedDataMapNodeOfIndexedDataMapOfOwnerPrs %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_AIS_IndexedDataMapNodeOfIndexedDataMapOfOwnerPrs {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor AIS_IndexedDataMapOfOwnerPrs;
class AIS_IndexedDataMapOfOwnerPrs : public TCollection_BasicMap {
	public:
		%feature("autodoc", "Args:
	NbBuckets(Standard_Integer)=1

Returns:
	None

No detailed docstring for this function.") AIS_IndexedDataMapOfOwnerPrs;
		 AIS_IndexedDataMapOfOwnerPrs (const Standard_Integer NbBuckets = 1);
		%feature("autodoc", "Args:
	Other(AIS_IndexedDataMapOfOwnerPrs)

Returns:
	AIS_IndexedDataMapOfOwnerPrs

No detailed docstring for this function.") Assign;
		AIS_IndexedDataMapOfOwnerPrs & Assign (const AIS_IndexedDataMapOfOwnerPrs & Other);
		%feature("autodoc", "Args:
	Other(AIS_IndexedDataMapOfOwnerPrs)

Returns:
	AIS_IndexedDataMapOfOwnerPrs

No detailed docstring for this function.") operator=;
		AIS_IndexedDataMapOfOwnerPrs & operator = (const AIS_IndexedDataMapOfOwnerPrs & Other);
		%feature("autodoc", "Args:
	NbBuckets(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") ReSize;
		void ReSize (const Standard_Integer NbBuckets);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	K(Handle_SelectMgr_EntityOwner)
	I(Handle_Prs3d_Presentation)

Returns:
	Standard_Integer

No detailed docstring for this function.") Add;
		Standard_Integer Add (const Handle_SelectMgr_EntityOwner & K,const Handle_Prs3d_Presentation & I);
		%feature("autodoc", "Args:
	I(Standard_Integer)
	K(Handle_SelectMgr_EntityOwner)
	T(Handle_Prs3d_Presentation)

Returns:
	None

No detailed docstring for this function.") Substitute;
		void Substitute (const Standard_Integer I,const Handle_SelectMgr_EntityOwner & K,const Handle_Prs3d_Presentation & T);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") RemoveLast;
		void RemoveLast ();
		%feature("autodoc", "Args:
	K(Handle_SelectMgr_EntityOwner)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Contains;
		Standard_Boolean Contains (const Handle_SelectMgr_EntityOwner & K);
		%feature("autodoc", "Args:
	I(Standard_Integer)

Returns:
	Handle_SelectMgr_EntityOwner

No detailed docstring for this function.") FindKey;
		const Handle_SelectMgr_EntityOwner & FindKey (const Standard_Integer I);
		%feature("autodoc", "Args:
	I(Standard_Integer)

Returns:
	Handle_Prs3d_Presentation

No detailed docstring for this function.") FindFromIndex;
		const Handle_Prs3d_Presentation & FindFromIndex (const Standard_Integer I);
		%feature("autodoc", "Args:
	I(Standard_Integer)

Returns:
	Handle_Prs3d_Presentation

No detailed docstring for this function.") ChangeFromIndex;
		Handle_Prs3d_Presentation & ChangeFromIndex (const Standard_Integer I);
		%feature("autodoc", "Args:
	K(Handle_SelectMgr_EntityOwner)

Returns:
	Standard_Integer

No detailed docstring for this function.") FindIndex;
		Standard_Integer FindIndex (const Handle_SelectMgr_EntityOwner & K);
		%feature("autodoc", "Args:
	K(Handle_SelectMgr_EntityOwner)

Returns:
	Handle_Prs3d_Presentation

No detailed docstring for this function.") FindFromKey;
		const Handle_Prs3d_Presentation & FindFromKey (const Handle_SelectMgr_EntityOwner & K);
		%feature("autodoc", "Args:
	K(Handle_SelectMgr_EntityOwner)

Returns:
	Handle_Prs3d_Presentation

No detailed docstring for this function.") ChangeFromKey;
		Handle_Prs3d_Presentation & ChangeFromKey (const Handle_SelectMgr_EntityOwner & K);
		%feature("autodoc", "Args:
	K(Handle_SelectMgr_EntityOwner)

Returns:
	Standard_Address

No detailed docstring for this function.") FindFromKey1;
		Standard_Address FindFromKey1 (const Handle_SelectMgr_EntityOwner & K);
		%feature("autodoc", "Args:
	K(Handle_SelectMgr_EntityOwner)

Returns:
	Standard_Address

No detailed docstring for this function.") ChangeFromKey1;
		Standard_Address ChangeFromKey1 (const Handle_SelectMgr_EntityOwner & K);
};


%feature("shadow") AIS_IndexedDataMapOfOwnerPrs::~AIS_IndexedDataMapOfOwnerPrs %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend AIS_IndexedDataMapOfOwnerPrs {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor AIS_InteractiveContext;
class AIS_InteractiveContext : public MMgt_TShared {
	public:
		%feature("autodoc", "Args:
	MainViewer(Handle_V3d_Viewer)

Returns:
	None

Constructs the interactive context object defined by  
the principal viewer MainViewer.") AIS_InteractiveContext;
		 AIS_InteractiveContext (const Handle_V3d_Viewer & MainViewer);
		%feature("autodoc", "Args:
	None
Returns:
	virtual void

No detailed docstring for this function.") Delete;
		virtual void Delete ();
		%feature("autodoc", "Args:
	Auto(Standard_Boolean)

Returns:
	None

No detailed docstring for this function.") SetAutoActivateSelection;
		void SetAutoActivateSelection (const Standard_Boolean Auto);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") GetAutoActivateSelection;
		Standard_Boolean GetAutoActivateSelection ();
		%feature("autodoc", "Args:
	anIobj(Handle_AIS_InteractiveObject)
	updateviewer(Standard_Boolean)=Standard_True

Returns:
	None

Controls the choice between the using the display  
and selection modes of open local context which you  
have defined and activating those available by default.  
If a local context is open and if updateviewer equals  
Standard_False, the Interactive Object anIobj is  
displayed in the default active mode. This will be the  
object's default display mode, if there is one.  
Otherwise, it will be the context mode. The Interactive  
Object's default selection mode is activated. In  
general, this is 0.  
This syntax has the same behavior as local context,  
open or closed. If you want to view the object in open  
local context without selection, use the syntax below,  
setting aSelectionMode to -1.") Display;
		void Display (const Handle_AIS_InteractiveObject & anIobj,const Standard_Boolean updateviewer = Standard_True);
		%feature("autodoc", "Args:
	anIobj(Handle_AIS_InteractiveObject)
	amode(Standard_Integer)
	aSelectionMode(Standard_Integer)
	updateviewer(Standard_Boolean)=Standard_True
	allowdecomposition(Standard_Boolean)=Standard_True

Returns:
	None

Controls the choice between the using the display  
and selection modes of open local context which you  
have defined and activating those available by default.  
If no Local Context is opened. and the Interactive  
Object aniobj has no display mode of its own, the  
default display mode, 0, is used. Likewise, if aniobj  
has no selection mode of its own, the default one, 0, is used.  
If a local context is open and if updateviewer equals  
Standard_False, the presentation of the Interactive  
Object activates the selection mode; the object is  
displayed but no viewer will be updated.  
If aSelectionMode equals -1, anIobj will not be  
activated: it will be displayed but will not be selectable.  
Use this if you want to view the object in open local  
context without selection. Note: This option is only  
available in Local Context.  
If allowDecomposition equals true, anIObj can have  
subshapes detected by selection mechanisms. anIObj  
must be able to give a shape selection modes which  
fit the AIS_Shape selection modes:  
-   vertices: 1  
-   edges: 2  
-   wires: 3.") Display;
		void Display (const Handle_AIS_InteractiveObject & anIobj,const Standard_Integer amode,const Standard_Integer aSelectionMode,const Standard_Boolean updateviewer = Standard_True,const Standard_Boolean allowdecomposition = Standard_True);
		%feature("autodoc", "Args:
	aniobj(Handle_AIS_InteractiveObject)
	SelectionMode(Standard_Integer)=- 1
	AllowDecomp(Standard_Boolean)=Standard_False

Returns:
	None

Allows you to load the Interactive Object aniobj  
with a given selection mode SelectionMode, and/or  
with the desired decomposition option, whether the  
object is visualized or not. If AllowDecomp =  
Standard_True and, if the interactive object is of  
the 'Shape' type, these 'standard' selection  
modes will be automatically activated as a function  
of the modes present in the Local Context.  
The loaded objects will be selectable but  
displayable in highlighting only when detected by the Selector.  
This method is available only when Local Contexts are open.") Load;
		void Load (const Handle_AIS_InteractiveObject & aniobj,const Standard_Integer SelectionMode = - 1,const Standard_Boolean AllowDecomp = Standard_False);
		%feature("autodoc", "Args:
	aniobj(Handle_AIS_InteractiveObject)
	updateviewer(Standard_Boolean)=Standard_True

Returns:
	None

Hides the object. The object's presentations are simply  
flagged as invisible and therefore excluded from redrawing.  
To show hidden objects, use Display().") Erase;
		void Erase (const Handle_AIS_InteractiveObject & aniobj,const Standard_Boolean updateviewer = Standard_True);
		%feature("autodoc", "Args:
	updateviewer(Standard_Boolean)=Standard_True

Returns:
	None

Hides all objects. The object's presentations are simply  
flagged as invisible and therefore excluded from redrawing.  
To show all hidden objects, use DisplayAll().") EraseAll;
		void EraseAll (const Standard_Boolean updateviewer = Standard_True);
		%feature("autodoc", "Args:
	updateviewer(Standard_Boolean)=Standard_True

Returns:
	None

Displays all hidden objects.") DisplayAll;
		void DisplayAll (const Standard_Boolean updateviewer = Standard_True);
		%feature("autodoc", "Args:
	updateviewer(Standard_Boolean)=Standard_True

Returns:
	None

Hides selected objects. The object's presentations are simply  
flagged as invisible and therefore excluded from redrawing.  
To show hidden objects, use Display().") EraseSelected;
		void EraseSelected (const Standard_Boolean updateviewer = Standard_True);
		%feature("autodoc", "Args:
	updateviewer(Standard_Boolean)=Standard_True

Returns:
	None

Displays selected objects if a local context is open.  
Displays current objects if there is no active local context.  
Objects selected when there is no open local context  
are called current objects; those selected in open  
local context, selected objects.  
If a local context is open and if updateviewer equals  
Standard_False, the presentation   of the Interactive  
Object activates   the   selection   mode; the   object is  
displayed but no viewer will be updated.") DisplaySelected;
		void DisplaySelected (const Standard_Boolean updateviewer = Standard_True);
		%feature("autodoc", "Args:
	anIObj(Handle_AIS_InteractiveObject)
	InWhichLocal(Standard_Integer)=- 1

Returns:
	Standard_Boolean

Changes the status of a temporary object. It will be  
kept at the neutral point, i.e. put in the list of  
displayed   objects along withwith   its temporary  
attributes. These include display mode and  
selection   mode, for example.  
Returns true if done.  
inWhichLocal gives the local context in which anIObj  
is displayed. By default, the index -1 refers to the last  
Local Context opened.") KeepTemporary;
		Standard_Boolean KeepTemporary (const Handle_AIS_InteractiveObject & anIObj,const Standard_Integer InWhichLocal = - 1);
		%feature("autodoc", "Args:
	aniobj(Handle_AIS_InteractiveObject)
	updateviewer(Standard_Boolean)=Standard_True

Returns:
	None

Removes the interactive object aniobj from all viewers.  
If a local context is open and if updateviewer equals  
Standard_False, the presentation of the Interactive  
Object activates the selection mode; the object is  
displayed but no viewer will be updated.") Clear;
		void Clear (const Handle_AIS_InteractiveObject & aniobj,const Standard_Boolean updateviewer = Standard_True);
		%feature("autodoc", "Args:
	aniobj(Handle_AIS_InteractiveObject)
	aMode(Standard_Integer)=0
	updateviewer(Standard_Boolean)=Standard_True

Returns:
	None

Empties the graphic presentation of the mode  
indexed by aMode.  
If a local context is open and if updateviewer equals  
Standard_False, the presentation of the Interactive  
Object activates the selection mode; the object is  
displayed but no viewer will be updated.  
Warning  
Removes anIobj. anIobj is still active if it was  
previously activated.") ClearPrs;
		void ClearPrs (const Handle_AIS_InteractiveObject & aniobj,const Standard_Integer aMode = 0,const Standard_Boolean updateviewer = Standard_True);
		%feature("autodoc", "Args:
	aniobj(Handle_AIS_InteractiveObject)
	updateviewer(Standard_Boolean)=Standard_True

Returns:
	None

Removes aniobj from every viewer. aniobj is no  
longer referenced in the Context.  
If a local context is open and if updateviewer equals  
Standard_False, the presentation   of the Interactive  
Object activates the selection mode; the object is  
displayed but no viewer will be updated.") Remove;
		void Remove (const Handle_AIS_InteractiveObject & aniobj,const Standard_Boolean updateviewer = Standard_True);
		%feature("autodoc", "Args:
	updateviewer(Standard_Boolean)=Standard_True

Returns:
	None

Removes all the objects from all opened Local Contexts  
         and from the Neutral Point") RemoveAll;
		void RemoveAll (const Standard_Boolean updateviewer = Standard_True);
		%feature("autodoc", "Args:
	aniobj(Handle_AIS_InteractiveObject)
	updateviewer(Standard_Boolean)=Standard_True

Returns:
	None

Updates the display in the viewer to take dynamic  
detection into account. On dynamic detection by the  
mouse cursor, sensitive primitives are highlighted.  
The highlight color of entities detected by mouse  
movement is white by default.  
If a local context is open and if updateviewer equals  
Standard_False, the presentation of the Interactive  
Object activates the selection mode; the object is  
displayed but no viewer will be updated.") Hilight;
		void Hilight (const Handle_AIS_InteractiveObject & aniobj,const Standard_Boolean updateviewer = Standard_True);
		%feature("autodoc", "Args:
	aniobj(Handle_AIS_InteractiveObject)
	aCol(Quantity_NameOfColor)
	updateviewer(Standard_Boolean)=Standard_True

Returns:
	None

Changes the color of all the lines of the object in view,  
aniobj. It paints these lines the color passed as the  
argument, aCol.  
If a local context is open and if updateviewer equals  
Standard_False, the presentation of the Interactive  
Object activates the selection mode; the object is  
displayed but no viewer will be updated.") HilightWithColor;
		void HilightWithColor (const Handle_AIS_InteractiveObject & aniobj,const Quantity_NameOfColor aCol,const Standard_Boolean updateviewer = Standard_True);
		%feature("autodoc", "Args:
	aniobj(Handle_AIS_InteractiveObject)
	updateviewer(Standard_Boolean)=Standard_True

Returns:
	None

Removes hilighting from the entity aniobj. Updates the viewer.  
If a local context is open and if updateviewer equals  
Standard_False, the presentation of the Interactive  
Object activates the selection mode; the object is  
displayed but no viewer will be updated.") Unhilight;
		void Unhilight (const Handle_AIS_InteractiveObject & aniobj,const Standard_Boolean updateviewer = Standard_True);
		%feature("autodoc", "Args:
	anIobj(Handle_AIS_InteractiveObject)
	aPriority(Standard_Integer)

Returns:
	None

Sets the display priority aPriority of the seen parts  
presentation of the entity anIobj.") SetDisplayPriority;
		void SetDisplayPriority (const Handle_AIS_InteractiveObject & anIobj,const Standard_Integer aPriority);
		%feature("autodoc", "Args:
	theIObj(Handle_AIS_InteractiveObject)
	theLayerId(Standard_Integer)

Returns:
	None

Set Z layer id for interactive object. The layer can be  
specified for displayed object only. The Z layers can be used to display  
temporarily presentations of some object in front of the other objects  
in the scene. The ids for Z layers are generated by V3d_Viewer.  
Note that Z layers differ from under-/overlayer in V3d_View:  
under-/overlayer are intended for specific 2D drawings that appear  
behind/in front of all 3D presentations, while SetZLayer() method  
applies to regular 3D presentations and does not imply any specific  
drawing methods.") SetZLayer;
		void SetZLayer (const Handle_AIS_InteractiveObject & theIObj,const Standard_Integer theLayerId);
		%feature("autodoc", "Args:
	theIObj(Handle_AIS_InteractiveObject)

Returns:
	Standard_Integer

Get Z layer id set for displayed interactive object.  
If the object doesn't exists in context or has no computed presentations,  
the method returns -1.") GetZLayer;
		Standard_Integer GetZLayer (const Handle_AIS_InteractiveObject & theIObj);
		%feature("autodoc", "Args:
	aniobj(Handle_AIS_InteractiveObject)
	updateviewer(Standard_Boolean)=Standard_True
	allmodes(Standard_Boolean)=Standard_False

Returns:
	None

Recomputes the seen parts presentation of the entity  
aniobj. If allmodes equals true, all presentations are  
present in the object even if unseen.  
If a local context is open and if updateviewer equals  
Standard_False, the presentation of the Interactive  
Object activates the selection mode; the object is  
displayed but no viewer will be updated.") Redisplay;
		void Redisplay (const Handle_AIS_InteractiveObject & aniobj,const Standard_Boolean updateviewer = Standard_True,const Standard_Boolean allmodes = Standard_False);
		%feature("autodoc", "Args:
	aTypeOfObject(AIS_KindOfInteractive)
	Signature(Standard_Integer)=- 1
	updateviewer(Standard_Boolean)=Standard_True

Returns:
	None

Recomputes the Prs/Selection of displayed objects of  
         a given type and a given signature.  
         if signature = -1  doesnt take signature criterion.") Redisplay;
		void Redisplay (const AIS_KindOfInteractive aTypeOfObject,const Standard_Integer Signature = - 1,const Standard_Boolean updateviewer = Standard_True);
		%feature("autodoc", "Args:
	anIobj(Handle_AIS_InteractiveObject)
	updateviewer(Standard_Boolean)=Standard_True
	allmodes(Standard_Boolean)=Standard_False

Returns:
	None

Recomputes the displayed presentations, flags the others  
         Doesn't update presentations") RecomputePrsOnly;
		void RecomputePrsOnly (const Handle_AIS_InteractiveObject & anIobj,const Standard_Boolean updateviewer = Standard_True,const Standard_Boolean allmodes = Standard_False);
		%feature("autodoc", "Args:
	anIObj(Handle_AIS_InteractiveObject)

Returns:
	None

Recomputes the active selections, flags the others  
         Doesn't update presentations") RecomputeSelectionOnly;
		void RecomputeSelectionOnly (const Handle_AIS_InteractiveObject & anIObj);
		%feature("autodoc", "Args:
	theIObj(Handle_AIS_InteractiveObject)
	theUpdateViewer(Standard_Boolean)=Standard_True

Returns:
	None

Updates displayed interactive object by checking and  
         recomputing its flagged as 'to be recomputed' presentation  
         and selection structures. This method does not force any  
         recomputation on its own. The method recomputes selections  
         even if they are loaded without activation in particular selector.") Update;
		void Update (const Handle_AIS_InteractiveObject & theIObj,const Standard_Boolean theUpdateViewer = Standard_True);
		%feature("autodoc", "Args:
	aniobj(Handle_AIS_InteractiveObject)
	aMode(Standard_Integer)
	updateviewer(Standard_Boolean)=Standard_True

Returns:
	None

Sets the display mode of seen Interactive Objects.  
aMode provides the display mode index of the entity aniobj.  
If updateviewer equals Standard_True, the  
predominant mode aMode will overule the context mode.  
If a local context is open and if updateviewer equals  
Standard_False, the presentation of the Interactive  
Object returns to the default selection mode; the  
object is displayed but no viewer will be updated.  
Note that display mode 3 is only used if you have an  
AIS_Textured Shape.") SetDisplayMode;
		void SetDisplayMode (const Handle_AIS_InteractiveObject & aniobj,const Standard_Integer aMode,const Standard_Boolean updateviewer = Standard_True);
		%feature("autodoc", "Args:
	aniobj(Handle_AIS_InteractiveObject)
	updateviewer(Standard_Boolean)=Standard_True

Returns:
	None

Unsets the display mode of seen Interactive Objects.  
aMode provides the display mode index of the entity aniobj.  
If updateviewer equals Standard_True, the  
predominant mode aMode will overule the context mode.  
If a local context is open and if updateviewer equals  
Standard_False, the presentation of the Interactive  
Object returns to the default selection mode; the  
object is displayed but no viewer will be updated.") UnsetDisplayMode;
		void UnsetDisplayMode (const Handle_AIS_InteractiveObject & aniobj,const Standard_Boolean updateviewer = Standard_True);
		%feature("autodoc", "Args:
	aniobj(Handle_AIS_InteractiveObject)
	aMode(Standard_Integer)

Returns:
	None

Sets the selection mode of Interactive Objects.  
aMode provides the selection mode index of the entity aniobj.") SetSelectionMode;
		void SetSelectionMode (const Handle_AIS_InteractiveObject & aniobj,const Standard_Integer aMode);
		%feature("autodoc", "Args:
	aniobj(Handle_AIS_InteractiveObject)

Returns:
	None

Removes selection mode from Interactive Objects.  
aMode provides the selection mode index of the entity aniobj.") UnsetSelectionMode;
		void UnsetSelectionMode (const Handle_AIS_InteractiveObject & aniobj);
		%feature("autodoc", "Args:
	aMode(StdSelect_SensitivityMode)

Returns:
	None

Sets the selection sensitivity mode. SM_WINDOW mode  
uses the specified pixel tolerance to compute the sensitivity  
value, SM_VIEW mode allows to define the sensitivity manually.") SetSensitivityMode;
		void SetSensitivityMode (const StdSelect_SensitivityMode aMode);
		%feature("autodoc", "Args:
	None
Returns:
	StdSelect_SensitivityMode

Returns the selection sensitivity mode.") SensitivityMode;
		StdSelect_SensitivityMode SensitivityMode ();
		%feature("autodoc", "Args:
	aPrecision(Standard_Real)

Returns:
	None

Sets the sensitivity aPrecision  
according to the view size for the current context or local  
context if any is activated.  
  Sets the sensitivity aPrecision in pixels for the current context  
or local context if any is activated. By default, this  
sensitivity is equal to 4 pixels.  
  When a local context is open, the defined sensitivity applies to  
this local context instead of the main context.") SetSensitivity;
		void SetSensitivity (const Standard_Real aPrecision);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

Returns the selection sensitivity value.") Sensitivity;
		Standard_Real Sensitivity ();
		%feature("autodoc", "Args:
	aPrecision(Standard_Integer)=4

Returns:
	None

Define the current selection pixel sensitivity  
//!		for this context or local context if any one is activated.  
 Warning: When a local context is open the sensitivity is apply on it  
         instead on the main context.") SetPixelTolerance;
		void SetPixelTolerance (const Standard_Integer aPrecision = 4);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Returns the pixel tolerance.") PixelTolerance;
		Standard_Integer PixelTolerance ();
		%feature("autodoc", "Args:
	aniobj(Handle_AIS_InteractiveObject)
	aLocation(TopLoc_Location)

Returns:
	None

Puts the location aLocation on the initial graphic  
representation and the selection for the entity aniobj.  
In other words, aniobj is visible and selectable at a  
position other than initial position.  
Graphic and selection primitives are not recomputed.  
To clean the view correctly, you must reset the previous location.") SetLocation;
		void SetLocation (const Handle_AIS_InteractiveObject & aniobj,const TopLoc_Location & aLocation);
		%feature("autodoc", "Args:
	aniobj(Handle_AIS_InteractiveObject)

Returns:
	None

Puts the entity aniobj back into its initial position.") ResetLocation;
		void ResetLocation (const Handle_AIS_InteractiveObject & aniobj);
		%feature("autodoc", "Args:
	aniobj(Handle_AIS_InteractiveObject)

Returns:
	Standard_Boolean

Returns true if the entity aniobj has a location.") HasLocation;
		Standard_Boolean HasLocation (const Handle_AIS_InteractiveObject & aniobj);
		%feature("autodoc", "Args:
	aniobj(Handle_AIS_InteractiveObject)

Returns:
	TopLoc_Location

Returns the location of the entity aniobj.") Location;
		const TopLoc_Location & Location (const Handle_AIS_InteractiveObject & aniobj);
		%feature("autodoc", "Args:
	aniobj(Handle_AIS_InteractiveObject)
	aModel(Aspect_TypeOfFacingModel)=Aspect_TOFM_BOTH_SIDE

Returns:
	None

change the current facing model apply on polygons for  
SetColor(), SetTransparency(), SetMaterial() methods  
default facing model is Aspect_TOFM_TWO_SIDE. This mean that attributes is  
applying both on the front and back face.") SetCurrentFacingModel;
		void SetCurrentFacingModel (const Handle_AIS_InteractiveObject & aniobj,const Aspect_TypeOfFacingModel aModel = Aspect_TOFM_BOTH_SIDE);
		%feature("autodoc", "Args:
	aniobj(Handle_AIS_InteractiveObject)
	aColor(Quantity_NameOfColor)
	updateviewer(Standard_Boolean)=Standard_True

Returns:
	None

No detailed docstring for this function.") SetColor;
		void SetColor (const Handle_AIS_InteractiveObject & aniobj,const Quantity_NameOfColor aColor,const Standard_Boolean updateviewer = Standard_True);
		%feature("autodoc", "Args:
	aniobj(Handle_AIS_InteractiveObject)
	aColor(Quantity_Color)
	updateviewer(Standard_Boolean)=Standard_True

Returns:
	None

Sets the color of the selected entity.  
If a local context is open and if updateviewer equals  
Standard_False, the presentation   of the Interactive  
Object activates the selection mode; the object is  
displayed but no viewer will be updated.") SetColor;
		void SetColor (const Handle_AIS_InteractiveObject & aniobj,const Quantity_Color & aColor,const Standard_Boolean updateviewer = Standard_True);
		%feature("autodoc", "Args:
	aniobj(Handle_AIS_InteractiveObject)
	updateviewer(Standard_Boolean)=Standard_True

Returns:
	None

Removes the color selection for the selected entity.  
If a local context is open and if updateviewer equals  
Standard_False, the presentation of the Interactive  
Object activates the selection mode; the object is  
displayed but no viewer will be updated.") UnsetColor;
		void UnsetColor (const Handle_AIS_InteractiveObject & aniobj,const Standard_Boolean updateviewer = Standard_True);
		%feature("autodoc", "Args:
	aniobj(Handle_AIS_InteractiveObject)
	aValue(Standard_Real)
	updateviewer(Standard_Boolean)=Standard_True

Returns:
	virtual void

Sets the width of the entity aniobj.  
If a local context is open and if updateviewer equals  
Standard_False, the presentation of the Interactive  
Object activates the selection mode; the object is  
displayed but no viewer will be updated.") SetWidth;
		virtual void SetWidth (const Handle_AIS_InteractiveObject & aniobj,const Standard_Real aValue,const Standard_Boolean updateviewer = Standard_True);
		%feature("autodoc", "Args:
	aniobj(Handle_AIS_InteractiveObject)
	updateviewer(Standard_Boolean)=Standard_True

Returns:
	virtual void

Removes the width setting of the entity aniobj.  
If a local context is open and if updateviewer equals  
Standard_False, the presentation of the Interactive  
Object activates the selection mode; the object is  
displayed but no viewer will be updated.") UnsetWidth;
		virtual void UnsetWidth (const Handle_AIS_InteractiveObject & aniobj,const Standard_Boolean updateviewer = Standard_True);
		%feature("autodoc", "Args:
	aniobj(Handle_AIS_InteractiveObject)
	aName(Graphic3d_NameOfMaterial)
	updateviewer(Standard_Boolean)=Standard_True

Returns:
	None

Provides the type of material setting for the view of  
the entity aniobj.  
The range of settings includes: BRASS, BRONZE,  
GOLD, PEWTER, SILVER, STONE.  
If a local context is open and if updateviewer equals  
Standard_False, the presentation of the Interactive  
Object activates the selection mode; the object is  
displayed but no viewer will be updated.") SetMaterial;
		void SetMaterial (const Handle_AIS_InteractiveObject & aniobj,const Graphic3d_NameOfMaterial aName,const Standard_Boolean updateviewer = Standard_True);
		%feature("autodoc", "Args:
	anObj(Handle_AIS_InteractiveObject)
	updateviewer(Standard_Boolean)=Standard_True

Returns:
	None

Removes the type of material setting for viewing the  
entity aniobj.  
If a local context is open and if updateviewer equals  
Standard_False, the presentation of the Interactive  
Object activates the selection mode; the object is  
displayed but no viewer will be updated.") UnsetMaterial;
		void UnsetMaterial (const Handle_AIS_InteractiveObject & anObj,const Standard_Boolean updateviewer = Standard_True);
		%feature("autodoc", "Args:
	aniobj(Handle_AIS_InteractiveObject)
	aValue(Standard_Real)=0.6
	updateviewer(Standard_Boolean)=Standard_True

Returns:
	None

Provides the transparency settings for viewing the  
entity aniobj. The transparency value aValue may be  
between 0.0, opaque, and 1.0, fully transparent.  
If a local context is open and if updateviewer equals  
Standard_False, the presentation of the Interactive  
Object activates the selection mode; the object is  
displayed but no viewer will be updated.") SetTransparency;
		void SetTransparency (const Handle_AIS_InteractiveObject & aniobj,const Standard_Real aValue = 0.6,const Standard_Boolean updateviewer = Standard_True);
		%feature("autodoc", "Args:
	aniobj(Handle_AIS_InteractiveObject)
	updateviewer(Standard_Boolean)=Standard_True

Returns:
	None

Removes   the transparency settings for viewing the  
entity aniobj. The transparency value aValue may be  
between 0.0, opaque, and 1.0, fully transparent.  
If a local context is open and if updateviewer equals  
Standard_False, the presentation of the Interactive  
Object activates the selection mode; the object is  
displayed but no viewer will be updated.") UnsetTransparency;
		void UnsetTransparency (const Handle_AIS_InteractiveObject & aniobj,const Standard_Boolean updateviewer = Standard_True);
		%feature("autodoc", "Args:
	aniobj(Handle_AIS_InteractiveObject)
	aDrawer(Handle_AIS_Drawer)
	updateviewer(Standard_Boolean)=Standard_True

Returns:
	None

Sets the attributes of the interactive object aniobj by  
plugging the attribute manager aDrawer into the local  
context. The graphic attributes of aDrawer such as  
visualization mode, color, and material, are then used  
to display aniobj.  
If a local context is open and if updateviewer equals  
Standard_False, the presentation of the Interactive  
Object activates the selection mode; the object is  
displayed but no viewer will be updated.") SetLocalAttributes;
		void SetLocalAttributes (const Handle_AIS_InteractiveObject & aniobj,const Handle_AIS_Drawer & aDrawer,const Standard_Boolean updateviewer = Standard_True);
		%feature("autodoc", "Args:
	anObj(Handle_AIS_InteractiveObject)
	updateviewer(Standard_Boolean)=Standard_True

Returns:
	None

Removes the settings for local attributes of the entity  
anObj   and returns to the Neutral Point attributes or  
those of the previous local context.  
If a local context is open and if updateviewer equals  
Standard_False, the presentation of the Interactive  
Object activates the selection mode; the object is  
displayed but no viewer will be updated.") UnsetLocalAttributes;
		void UnsetLocalAttributes (const Handle_AIS_InteractiveObject & anObj,const Standard_Boolean updateviewer = Standard_True);
		%feature("autodoc", "Args:
	anObj(Handle_AIS_InteractiveObject)
	aMode(Standard_Integer)
	aFactor(Standard_ShortReal)=1.0
	aUnits(Standard_ShortReal)=0.0
	updateviewer(Standard_Boolean)=Standard_True

Returns:
	None

Sets up polygon offsets for the given AIS_InteractiveObject.  
         It simply calls anObj->SetPolygonOffsets()") SetPolygonOffsets;
		void SetPolygonOffsets (const Handle_AIS_InteractiveObject & anObj,const Standard_Integer aMode,const Standard_ShortReal aFactor = 1.0,const Standard_ShortReal aUnits = 0.0,const Standard_Boolean updateviewer = Standard_True);
		%feature("autodoc", "Args:
	anObj(Handle_AIS_InteractiveObject)

Returns:
	Standard_Boolean

simply calls anObj->HasPolygonOffsets()") HasPolygonOffsets;
		Standard_Boolean HasPolygonOffsets (const Handle_AIS_InteractiveObject & anObj);
		%feature("autodoc", "Args:
	anObj(Handle_AIS_InteractiveObject)
	aMode(Standard_Integer)
	aFactor(Standard_ShortReal)
	aUnits(Standard_ShortReal)

Returns:
	None

Retrieves current polygon offsets settings for <anObj>.") PolygonOffsets;
		void PolygonOffsets (const Handle_AIS_InteractiveObject & anObj,Standard_Integer &OutValue,Standard_ShortReal & aFactor,Standard_ShortReal & aUnits);
		%feature("autodoc", "Args:
	aSize(Standard_Real)
	updateviewer(Standard_Boolean)=Standard_True

Returns:
	None

Sets the size aSize of the trihedron.  
Is used to change the default value 100 mm for  
display of trihedra.  
Use of this function in one of your own interactive  
objects requires a call to the Compute function of the  
new class. This will recalculate the presentation for  
every trihedron displayed.  
If a local context is open and if updateviewer equals  
Standard_False, the presentation of the Interactive  
Object activates the selection mode; the object is  
displayed but no viewer will be updated.") SetTrihedronSize;
		void SetTrihedronSize (const Standard_Real aSize,const Standard_Boolean updateviewer = Standard_True);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

returns the current value of trihedron size.") TrihedronSize;
		Standard_Real TrihedronSize ();
		%feature("autodoc", "Args:
	aSizeX(Standard_Real)
	aSizeY(Standard_Real)
	updateviewer(Standard_Boolean)=Standard_True

Returns:
	None

Sets the plane size defined by the length in the X  
direction XSize and that in the Y direction YSize.  
If a local context is open and if updateviewer equals  
Standard_False, the presentation of the Interactive  
Object activates the selection mode; the object is  
displayed but no viewer will be updated.") SetPlaneSize;
		void SetPlaneSize (const Standard_Real aSizeX,const Standard_Real aSizeY,const Standard_Boolean updateviewer = Standard_True);
		%feature("autodoc", "Args:
	aSize(Standard_Real)
	updateviewer(Standard_Boolean)=Standard_True

Returns:
	None

Sets the plane size aSize.  
If a local context is open and if updateviewer equals  
Standard_False, the presentation of the Interactive  
Object activates the selection mode; the object is  
displayed but no viewer will be updated.  
May be used if PlaneSize returns true.") SetPlaneSize;
		void SetPlaneSize (const Standard_Real aSize,const Standard_Boolean updateviewer = Standard_True);
		%feature("autodoc", "Args:
	XSize(Standard_Real)
	YSize(Standard_Real)

Returns:
	Standard_Boolean

Returns true if the length in the X direction XSize is  
the same as that in the Y direction YSize.") PlaneSize;
		Standard_Boolean PlaneSize (Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	anIobj(Handle_AIS_InteractiveObject)

Returns:
	AIS_DisplayStatus

Returns the display status of the entity anIobj.  
This will be one of the following:  
-   DS_Displayed   displayed in main viewer  
-   DS_Erased   hidden in main viewer  
-   DS_Temporary   temporarily displayed  
-   DS_None   nowhere displayed.") DisplayStatus;
		AIS_DisplayStatus DisplayStatus (const Handle_AIS_InteractiveObject & anIobj);
		%feature("autodoc", "Args:
	aniobj(Handle_AIS_InteractiveObject)

Returns:
	TColStd_ListOfInteger

Returns the list of active display modes for the entity aniobj.") DisplayedModes;
		const TColStd_ListOfInteger & DisplayedModes (const Handle_AIS_InteractiveObject & aniobj);
		%feature("autodoc", "Args:
	anIobj(Handle_AIS_InteractiveObject)

Returns:
	Standard_Boolean

Returns true if anIobj is displayed in the interactive context.") IsDisplayed;
		Standard_Boolean IsDisplayed (const Handle_AIS_InteractiveObject & anIobj);
		%feature("autodoc", "Args:
	aniobj(Handle_AIS_InteractiveObject)
	aMode(Standard_Integer)

Returns:
	Standard_Boolean

No detailed docstring for this function.") IsDisplayed;
		Standard_Boolean IsDisplayed (const Handle_AIS_InteractiveObject & aniobj,const Standard_Integer aMode);
		%feature("autodoc", "Args:
	aniobj(Handle_AIS_InteractiveObject)

Returns:
	Standard_Boolean

No detailed docstring for this function.") IsHilighted;
		Standard_Boolean IsHilighted (const Handle_AIS_InteractiveObject & aniobj);
		%feature("autodoc", "Args:
	anIobj(Handle_AIS_InteractiveObject)
	WithColor(Standard_Boolean)
	theHiCol(Quantity_NameOfColor)

Returns:
	Standard_Boolean

if <anIObj> is hilighted with a specific color  
         <WithColor> will be returned TRUE  
         <theHiCol> gives the name of the hilightcolor") IsHilighted;
		Standard_Boolean IsHilighted (const Handle_AIS_InteractiveObject & anIobj,Standard_Boolean & WithColor,Quantity_NameOfColor & theHiCol);
		%feature("autodoc", "Args:
	anIobj(Handle_AIS_InteractiveObject)

Returns:
	Standard_Integer

Returns the display priority of the entity anIobj. This  
will be display   mode of anIobj if it is in the main  
viewer.") DisplayPriority;
		Standard_Integer DisplayPriority (const Handle_AIS_InteractiveObject & anIobj);
		%feature("autodoc", "Args:
	aniobj(Handle_AIS_InteractiveObject)

Returns:
	Standard_Boolean

Returns true if a view of the Interactive Object aniobj has color.") HasColor;
		Standard_Boolean HasColor (const Handle_AIS_InteractiveObject & aniobj);
		%feature("autodoc", "Args:
	aniobj(Handle_AIS_InteractiveObject)

Returns:
	Quantity_NameOfColor

No detailed docstring for this function.") Color;
		Quantity_NameOfColor Color (const Handle_AIS_InteractiveObject & aniobj);
		%feature("autodoc", "Args:
	aniobj(Handle_AIS_InteractiveObject)
	acolor(Quantity_Color)

Returns:
	None

Returns the color Color of the entity aniobj in the interactive context.") Color;
		void Color (const Handle_AIS_InteractiveObject & aniobj,Quantity_Color & acolor);
		%feature("autodoc", "Args:
	aniobj(Handle_AIS_InteractiveObject)

Returns:
	virtual Standard_Real

Returns the width of the Interactive Object aniobj in  
the interactive context.") Width;
		virtual Standard_Real Width (const Handle_AIS_InteractiveObject & aniobj);
		%feature("autodoc", "Args:
	anObj(Handle_AIS_InteractiveObject)
	astatus(TCollection_ExtendedString)

Returns:
	None

Returns the status astatus of the Interactive Context  
for the view of the Interactive Object anObj.") Status;
		void Status (const Handle_AIS_InteractiveObject & anObj,TCollection_ExtendedString & astatus);
		%feature("autodoc", "Args:
	None
Returns:
	None

Updates the current viewer, the viewer in Neutral Point.  
Objects selected when there is no open local context  
are called current objects; those selected in open  
local context, selected objects.") UpdateCurrentViewer;
		void UpdateCurrentViewer ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Returns the display mode setting.  
Note that mode 3 is only used.") DisplayMode;
		Standard_Integer DisplayMode ();
		%feature("autodoc", "Args:
	None
Returns:
	Quantity_NameOfColor

Returns the name of the color used to show  
highlighted entities, that is, entities picked out by the mouse.") HilightColor;
		Quantity_NameOfColor HilightColor ();
		%feature("autodoc", "Args:
	None
Returns:
	Quantity_NameOfColor

Returns the name of the color used to show selected entities.  
By default, this is Quantity_NOC_GRAY80.") SelectionColor;
		Quantity_NameOfColor SelectionColor ();
		%feature("autodoc", "Args:
	None
Returns:
	Quantity_NameOfColor

Returns the name of the color used to show preselection.  
By default, this is Quantity_NOC_GREEN.") PreSelectionColor;
		Quantity_NameOfColor PreSelectionColor ();
		%feature("autodoc", "Args:
	None
Returns:
	Quantity_NameOfColor

Returns the name of the color used by default.  
By default, this is Quantity_NOC_GOLDENROD.") DefaultColor;
		Quantity_NameOfColor DefaultColor ();
		%feature("autodoc", "Args:
	None
Returns:
	Quantity_NameOfColor

Returns the name of the color used to show that an  
object is not currently selected.  
By default, this is Quantity_NOC_GRAY40.") SubIntensityColor;
		Quantity_NameOfColor SubIntensityColor ();
		%feature("autodoc", "Args:
	aHiCol(Quantity_NameOfColor)

Returns:
	None

Sets the color used to show highlighted entities, that  
is, entities picked by the mouse.  
By default, this is Quantity_NOC_CYAN1.") SetHilightColor;
		void SetHilightColor (const Quantity_NameOfColor aHiCol);
		%feature("autodoc", "Args:
	aCol(Quantity_NameOfColor)

Returns:
	None

Sets the color used to show selected entities.  
By default, this is Quantity_NOC_GRAY80.") SelectionColor;
		void SelectionColor (const Quantity_NameOfColor aCol);
		%feature("autodoc", "Args:
	aCol(Quantity_NameOfColor)

Returns:
	None

Allows you to set the color used to show preselection.  
By default, this is Quantity_NOC_GREEN.  
A preselected entity is one which has been selected  
as the domain of application of a function such as a fillet.") SetPreselectionColor;
		void SetPreselectionColor (const Quantity_NameOfColor aCol);
		%feature("autodoc", "Args:
	aCol(Quantity_NameOfColor)

Returns:
	None

Sets the color used to show that an object is not currently selected.  
By default, this is Quantity_NOC_GRAY40.") SetSubIntensityColor;
		void SetSubIntensityColor (const Quantity_NameOfColor aCol);
		%feature("autodoc", "Args:
	AMode(AIS_DisplayMode)
	updateviewer(Standard_Boolean)=Standard_True

Returns:
	None

Sets the display mode of seen Interactive Objects.  
aMode provides the display mode index of the entity aniobj.  
If updateviewer equals Standard_True, the  
predominant mode aMode will overule the context mode.  
If a local context is open and if updateviewer equals  
Standard_False, the presentation of the Interactive  
Object returns to the default selection mode; the  
object is displayed but no viewer will be updated.  
Note that display mode 3 is only used if you have an  
AIS_Textured Shape.") SetDisplayMode;
		void SetDisplayMode (const AIS_DisplayMode AMode,const Standard_Boolean updateviewer = Standard_True);
		%feature("autodoc", "Args:
	aniobj(Handle_AIS_InteractiveObject)
	aCoefficient(Standard_Real)
	updateviewer(Standard_Boolean)=Standard_True

Returns:
	None

Sets the deviation coefficient aCoefficient.  
Drawings of curves or patches are made with respect  
to a maximal chordal deviation. A Deviation coefficient  
is used in the shading display mode. The shape is  
seen decomposed into triangles. These are used to  
calculate reflection of light from the surface of the  
object. The triangles are formed from chords of the  
curves in the shape. The deviation coefficient  
aCoefficient gives the highest value of the angle with  
which a chord can deviate from a tangent to a   curve.  
If this limit is reached, a new triangle is begun.  
This deviation is absolute and is set through the  
method: SetMaximalChordialDeviation. The default  
value is 0.001.  
In drawing shapes, however, you are allowed to ask  
for a relative deviation. This deviation will be:  
SizeOfObject * DeviationCoefficient.  
default 0.001") SetDeviationCoefficient;
		void SetDeviationCoefficient (const Handle_AIS_InteractiveObject & aniobj,const Standard_Real aCoefficient,const Standard_Boolean updateviewer = Standard_True);
		%feature("autodoc", "Args:
	aniobj(Handle_AIS_InteractiveObject)
	anAngle(Standard_Real)
	updateviewer(Standard_Boolean)=Standard_True

Returns:
	None

No detailed docstring for this function.") SetDeviationAngle;
		void SetDeviationAngle (const Handle_AIS_InteractiveObject & aniobj,const Standard_Real anAngle,const Standard_Boolean updateviewer = Standard_True);
		%feature("autodoc", "Args:
	aniobj(Handle_AIS_InteractiveObject)
	anAngle(Standard_Real)
	updateviewer(Standard_Boolean)=Standard_True

Returns:
	None

Calls the AIS_Shape SetAngleAndDeviation to set  
         both Angle and Deviation coefficients") SetAngleAndDeviation;
		void SetAngleAndDeviation (const Handle_AIS_InteractiveObject & aniobj,const Standard_Real anAngle,const Standard_Boolean updateviewer = Standard_True);
		%feature("autodoc", "Args:
	aniobj(Handle_AIS_InteractiveObject)
	aCoefficient(Standard_Real)
	updateviewer(Standard_Boolean)=Standard_True

Returns:
	None

Sets the deviation coefficient aCoefficient for  
removal of hidden lines created by different  
viewpoints in different presentations. The Default value is 0.02.") SetHLRDeviationCoefficient;
		void SetHLRDeviationCoefficient (const Handle_AIS_InteractiveObject & aniobj,const Standard_Real aCoefficient,const Standard_Boolean updateviewer = Standard_True);
		%feature("autodoc", "Args:
	aniobj(Handle_AIS_InteractiveObject)
	anAngle(Standard_Real)
	updateviewer(Standard_Boolean)=Standard_True

Returns:
	None

No detailed docstring for this function.") SetHLRDeviationAngle;
		void SetHLRDeviationAngle (const Handle_AIS_InteractiveObject & aniobj,const Standard_Real anAngle,const Standard_Boolean updateviewer = Standard_True);
		%feature("autodoc", "Args:
	aniobj(Handle_AIS_InteractiveObject)
	anAngle(Standard_Real)
	updateviewer(Standard_Boolean)=Standard_True

Returns:
	None

Computes a HLRAngle and a  
HLRDeviationCoefficient by means of the angle  
anAngle and sets the corresponding methods in the  
default drawing tool with these values.") SetHLRAngleAndDeviation;
		void SetHLRAngleAndDeviation (const Handle_AIS_InteractiveObject & aniobj,const Standard_Real anAngle,const Standard_Boolean updateviewer = Standard_True);
		%feature("autodoc", "Args:
	aCoefficient(Standard_Real)

Returns:
	None

Sets the deviation coefficient aCoefficient.  
Drawings of curves or patches are made with respect  
to a maximal chordal deviation. A Deviation coefficient  
is used in the shading display mode. The shape is  
seen decomposed into triangles. These are used to  
calculate reflection of light from the surface of the  
object. The triangles are formed from chords of the  
curves in the shape. The deviation coefficient  
aCoefficient gives the highest value of the angle with  
which a chord can deviate from a tangent to a   curve.  
If this limit is reached, a new triangle is begun.  
This deviation is absolute and is set through the  
method: SetMaximalChordialDeviation. The default  
value is 0.001.  
In drawing shapes, however, you are allowed to ask  
for a relative deviation. This deviation will be:  
SizeOfObject * DeviationCoefficient.  
default 0.001") SetDeviationCoefficient;
		void SetDeviationCoefficient (const Standard_Real aCoefficient);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

Returns the deviation coefficient.  
Drawings of curves or patches are made with respect  
to a maximal chordal deviation. A Deviation coefficient  
is used in the shading display mode. The shape is  
seen decomposed into triangles. These are used to  
calculate reflection of light from the surface of the  
object. The triangles are formed from chords of the  
curves in the shape. The deviation coefficient gives  
the highest value of the angle with which a chord can  
deviate from a tangent to a   curve. If this limit is  
reached, a new triangle is begun.  
This deviation is absolute and is set through  
AIS_Drawer::SetMaximalChordialDeviation. The  
default value is 0.001.  
In drawing shapes, however, you are allowed to ask  
for a relative deviation. This deviation will be:  
SizeOfObject * DeviationCoefficient.") DeviationCoefficient;
		Standard_Real DeviationCoefficient ();
		%feature("autodoc", "Args:
	anAngle(Standard_Real)

Returns:
	None

default 6degrees") SetDeviationAngle;
		void SetDeviationAngle (const Standard_Real anAngle);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") DeviationAngle;
		Standard_Real DeviationAngle ();
		%feature("autodoc", "Args:
	aCoefficient(Standard_Real)

Returns:
	None

Sets the deviation coefficient aCoefficient for  
removal of hidden lines created by different  
viewpoints in different presentations. The Default value is 0.02.") SetHLRDeviationCoefficient;
		void SetHLRDeviationCoefficient (const Standard_Real aCoefficient);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

Returns the real number value of the hidden line  
removal deviation coefficient.  
A Deviation coefficient is used in the shading display  
mode. The shape is seen decomposed into triangles.  
These are used to calculate reflection of light from the  
surface of the object.  
The triangles are formed from chords of the curves in  
the shape. The deviation coefficient give the highest  
value of the angle with which a chord can deviate  
from a tangent to a curve. If this limit is reached, a  
new triangle is begun.  
To find the hidden lines, hidden line display mode  
entails recalculation of the view at each different  
projector perspective.  
Because hidden lines entail calculations of more than  
usual complexity to decompose them into these  
triangles, a deviation coefficient allowing greater  
tolerance is used. This increases efficiency in calculation.  
The Default value is 0.02.") HLRDeviationCoefficient;
		Standard_Real HLRDeviationCoefficient ();
		%feature("autodoc", "Args:
	anAngle(Standard_Real)

Returns:
	None

Sets the HLR angle anAngle.") SetHLRAngle;
		void SetHLRAngle (const Standard_Real anAngle);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

Returns the real number value of the deviation angle  
in hidden line removal views in this interactive context.  
The default value is 20*PI/180.") HLRAngle;
		Standard_Real HLRAngle ();
		%feature("autodoc", "Args:
	anAngle(Standard_Real)

Returns:
	None

compute with anangle a HLRAngle and a HLRDeviationCoefficient  
         and set them in myHLRAngle and in myHLRDeviationCoefficient  
         of myDefaultDrawer ;  
         anAngle is in radian ; ( 1 deg < angle in deg < 20 deg)") SetHLRAngleAndDeviation;
		void SetHLRAngleAndDeviation (const Standard_Real anAngle);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Prs3d_LineAspect

Initializes hidden line aspect in the default drawing tool, or Drawer.  
The default values are:  
         Color: Quantity_NOC_YELLOW  
         Type of line: Aspect_TOL_DASH  
         Width: 1.") HiddenLineAspect;
		Handle_Prs3d_LineAspect HiddenLineAspect ();
		%feature("autodoc", "Args:
	anAspect(Handle_Prs3d_LineAspect)

Returns:
	None

Sets the hidden line aspect anAspect.  
anAspect defines display attributes for hidden lines in  
HLR projections.") SetHiddenLineAspect;
		void SetHiddenLineAspect (const Handle_Prs3d_LineAspect & anAspect);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

returns Standard_True if the hidden lines are to be drawn.  
         By default the hidden lines are not drawn.") DrawHiddenLine;
		Standard_Boolean DrawHiddenLine ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") EnableDrawHiddenLine;
		void EnableDrawHiddenLine ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") DisableDrawHiddenLine;
		void DisableDrawHiddenLine ();
		%feature("autodoc", "Args:
	NbIsos(Standard_Integer)
	WhichIsos(AIS_TypeOfIso)=AIS_TOI_Both

Returns:
	None

Sets the number of U and V isoparameters displayed.") SetIsoNumber;
		void SetIsoNumber (const Standard_Integer NbIsos,const AIS_TypeOfIso WhichIsos = AIS_TOI_Both);
		%feature("autodoc", "Args:
	WhichIsos(AIS_TypeOfIso)=AIS_TOI_Both

Returns:
	Standard_Integer

Returns the number of U and V isoparameters displayed.") IsoNumber;
		Standard_Integer IsoNumber (const AIS_TypeOfIso WhichIsos = AIS_TOI_Both);
		%feature("autodoc", "Args:
	SwitchOn(Standard_Boolean)

Returns:
	None

Returns True if drawing isoparameters on planes is enabled.") IsoOnPlane;
		void IsoOnPlane (const Standard_Boolean SwitchOn);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns True if drawing isoparameters on planes is enabled.  if <forUIsos> = False,") IsoOnPlane;
		Standard_Boolean IsoOnPlane ();
		%feature("autodoc", "Args:
	anAspect(Handle_Prs3d_BasicAspect)
	globalChange(Standard_Boolean)=Standard_True
	updateViewer(Standard_Boolean)=Standard_True

Returns:
	None

Sets the graphic basic aspect to the current presentation of  
//!		ALL selected objects.  
         When <globalChange> is TRUE , the full object presentation  
         is changed.  
         When <globalChange> is FALSE , only the current group  
         of the object presentation is changed.  
//!	  	Updates the viewer when <updateViewer> is TRUE") SetSelectedAspect;
		void SetSelectedAspect (const Handle_Prs3d_BasicAspect & anAspect,const Standard_Boolean globalChange = Standard_True,const Standard_Boolean updateViewer = Standard_True);
		%feature("autodoc", "Args:
	XPix(Standard_Integer)
	YPix(Standard_Integer)
	aView(Handle_V3d_View)

Returns:
	AIS_StatusOfDetection

Relays mouse position in pixels XPix and YPix to the  
interactive context selectors. This is done by the view  
aView passing this position to the main viewer and updating it.  
Functions in both Neutral Point and local contexts.") MoveTo;
		AIS_StatusOfDetection MoveTo (const Standard_Integer XPix,const Standard_Integer YPix,const Handle_V3d_View & aView);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

returns True  if other entities  were detected  in the  
         last mouse detection") HasNextDetected;
		Standard_Boolean HasNextDetected ();
		%feature("autodoc", "Args:
	aView(Handle_V3d_View)

Returns:
	Standard_Integer

if more than 1 object is detected by the selector,  
         only the 'best' owner is hilighted at the mouse position.  
         This Method allows the user to hilight one after another  
         the other detected entities.  
         if The method select is called, the selected entity  
         will be the hilighted one!  
         returns the Rank of hilighted entity  
         WARNING : Loop Method. When all the detected entities  
                   have been hilighted , the next call will hilight  
                   the first one again") HilightNextDetected;
		Standard_Integer HilightNextDetected (const Handle_V3d_View & aView);
		%feature("autodoc", "Args:
	aView(Handle_V3d_View)

Returns:
	Standard_Integer

Same as previous methods in reverse direction...") HilightPreviousDetected;
		Standard_Integer HilightPreviousDetected (const Handle_V3d_View & aView);
		%feature("autodoc", "Args:
	XPMin(Standard_Integer)
	YPMin(Standard_Integer)
	XPMax(Standard_Integer)
	YPMax(Standard_Integer)
	aView(Handle_V3d_View)
	updateviewer(Standard_Boolean)=Standard_True

Returns:
	AIS_StatusOfPick

Selects everything found in the bounding rectangle  
defined by the pixel minima and maxima, XPMin,  
YPMin, XPMax, and YPMax in the view, aView  
The objects detected are passed to the main viewer,  
which is then updated.") Select;
		AIS_StatusOfPick Select (const Standard_Integer XPMin,const Standard_Integer YPMin,const Standard_Integer XPMax,const Standard_Integer YPMax,const Handle_V3d_View & aView,const Standard_Boolean updateviewer = Standard_True);
		%feature("autodoc", "Args:
	Polyline(TColgp_Array1OfPnt2d)
	aView(Handle_V3d_View)
	updateviewer(Standard_Boolean)=Standard_True

Returns:
	AIS_StatusOfPick

polyline selection; clears the previous picked list") Select;
		AIS_StatusOfPick Select (const TColgp_Array1OfPnt2d & Polyline,const Handle_V3d_View & aView,const Standard_Boolean updateviewer = Standard_True);
		%feature("autodoc", "Args:
	updateviewer(Standard_Boolean)=Standard_True

Returns:
	AIS_StatusOfPick

Stores  and hilights the previous detected; Unhilights  
         the previous picked.") Select;
		AIS_StatusOfPick Select (const Standard_Boolean updateviewer = Standard_True);
		%feature("autodoc", "Args:
	updateviewer(Standard_Boolean)=Standard_True

Returns:
	AIS_StatusOfPick

adds the last detected to the list of previous picked.  
         if the last detected was already declared as picked,  
         removes it from the Picked List.") ShiftSelect;
		AIS_StatusOfPick ShiftSelect (const Standard_Boolean updateviewer = Standard_True);
		%feature("autodoc", "Args:
	Polyline(TColgp_Array1OfPnt2d)
	aView(Handle_V3d_View)
	updateviewer(Standard_Boolean)=Standard_True

Returns:
	AIS_StatusOfPick

adds the last detected to the list of previous picked.  
         if the last detected was already declared as picked,  
         removes it from the Picked List.") ShiftSelect;
		AIS_StatusOfPick ShiftSelect (const TColgp_Array1OfPnt2d & Polyline,const Handle_V3d_View & aView,const Standard_Boolean updateviewer = Standard_True);
		%feature("autodoc", "Args:
	XPMin(Standard_Integer)
	YPMin(Standard_Integer)
	XPMax(Standard_Integer)
	YPMax(Standard_Integer)
	aView(Handle_V3d_View)
	updateviewer(Standard_Boolean)=Standard_True

Returns:
	AIS_StatusOfPick

rectangle  of selection  ; adds new detected entities into the  
         picked list, removes the detected entities that were already stored...") ShiftSelect;
		AIS_StatusOfPick ShiftSelect (const Standard_Integer XPMin,const Standard_Integer YPMin,const Standard_Integer XPMax,const Standard_Integer YPMax,const Handle_V3d_View & aView,const Standard_Boolean updateviewer = Standard_True);
		%feature("autodoc", "Args:
	toHilight(Standard_Boolean)

Returns:
	None

Specify whether selected object must be hilighted when mouse cursor  
is moved above it (in MoveTo method). By default this value is false and  
selected object is not hilighted in this case.") SetToHilightSelected;
		void SetToHilightSelected (const Standard_Boolean toHilight);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Return value specified whether selected object must be hilighted  
when mouse cursor is moved above it") ToHilightSelected;
		Standard_Boolean ToHilightSelected ();
		%feature("autodoc", "Args:
	aniobj(Handle_AIS_InteractiveObject)
	updateviewer(Standard_Boolean)=Standard_True

Returns:
	None

Updates the view of the current object in open context.  
Objects selected when there is no open local context  
are called current objects; those selected in open  
local context, selected objects.  
If a local context is open and if updateviewer equals  
Standard_False, the presentation of the Interactive  
Object activates the selection mode; the object is  
displayed but no viewer will be updated.") SetCurrentObject;
		void SetCurrentObject (const Handle_AIS_InteractiveObject & aniobj,const Standard_Boolean updateviewer = Standard_True);
		%feature("autodoc", "Args:
	aniobj(Handle_AIS_InteractiveObject)
	updateviewer(Standard_Boolean)=Standard_True

Returns:
	None

Allows you to add a current object to the list of current  
objects or remove it from that list.  
Objects selected when there is no open local context  
are called current objects; those selected in open  
local context, selected objects.  
If a local context is open and if updateviewer equals  
Standard_False, the presentation of the Interactive  
Object activates the selection mode; the object is  
displayed but no viewer will be updated.") AddOrRemoveCurrentObject;
		void AddOrRemoveCurrentObject (const Handle_AIS_InteractiveObject & aniobj,const Standard_Boolean updateviewer = Standard_True);
		%feature("autodoc", "Args:
	None
Returns:
	None

Updates the list of current objects, i.e. hilights new  
current objects, removes hilighting from former current objects.  
Objects selected when there is no open local context  
are called current objects; those selected in open  
local context, selected objects.") UpdateCurrent;
		void UpdateCurrent ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns the current selection touched by the cursor.  
Objects selected when there is no open local context  
are called current objects; those selected in open  
local context, selected objects.") WasCurrentTouched;
		Standard_Boolean WasCurrentTouched ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") SetOkCurrent;
		void SetOkCurrent ();
		%feature("autodoc", "Args:
	aniobj(Handle_AIS_InteractiveObject)

Returns:
	Standard_Boolean

Returns true if there is a non-null interactive object in Neutral Point.  
Objects selected when there is no open local context  
are called current objects; those selected in open  
local context, selected objects.") IsCurrent;
		Standard_Boolean IsCurrent (const Handle_AIS_InteractiveObject & aniobj);
		%feature("autodoc", "Args:
	None
Returns:
	None

Initializes a scan of the current selected objects in  
Neutral Point.  
Objects selected when there is no open local context  
are called current objects; those selected in open  
local context, selected objects.") InitCurrent;
		void InitCurrent ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns true if there is another object found by the  
scan of the list of current objects.  
Objects selected when there is no open local context  
are called current objects; those selected in open  
local context, selected objects.") MoreCurrent;
		Standard_Boolean MoreCurrent ();
		%feature("autodoc", "Args:
	None
Returns:
	None

Continues the scan to the next object in the list of  
current objects.  
Objects selected when there is no open local context  
are called current objects; those selected in open  
local context, selected objects.") NextCurrent;
		void NextCurrent ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_AIS_InteractiveObject

Returns the current interactive object.  
Objects selected when there is no open local context  
are called current objects; those selected in open  
local context, selected objects.") Current;
		Handle_AIS_InteractiveObject Current ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") NbCurrents;
		Standard_Integer NbCurrents ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_AIS_InteractiveObject

Returns the first current object in the list of current objects.  
Objects selected when there is no open local context  
are called current objects; those selected in open  
local context, selected objects.") FirstCurrentObject;
		Handle_AIS_InteractiveObject FirstCurrentObject ();
		%feature("autodoc", "Args:
	updateviewer(Standard_Boolean)=Standard_True

Returns:
	None

Highlights current objects.  
Objects selected when there is no open local context  
are called current objects; those selected in open  
local context, selected objects.  
If a local context is open and if updateviewer equals  
Standard_False, the presentation of the Interactive  
Object activates the selection mode; the object is  
displayed but no viewer will be updated.") HilightCurrents;
		void HilightCurrents (const Standard_Boolean updateviewer = Standard_True);
		%feature("autodoc", "Args:
	updateviewer(Standard_Boolean)=Standard_True

Returns:
	None

Removes highlighting from current objects.  
Objects selected when there is no open local context  
are called current objects; those selected in open  
local context, selected objects.  
If a local context is open and if updateviewer equals  
Standard_False, the presentation of the Interactive  
Object activates the selection mode; the object is  
displayed but no viewer will be updated.") UnhilightCurrents;
		void UnhilightCurrents (const Standard_Boolean updateviewer = Standard_True);
		%feature("autodoc", "Args:
	updateviewer(Standard_Boolean)=Standard_True

Returns:
	None

Empties previous current objects in order to get the  
current objects detected by the selector using  
UpdateCurrent.  
Objects selected when there is no open local context  
are called current objects; those selected in open  
local context, selected objects.  
If a local context is open and if updateviewer equals  
Standard_False, the presentation of the Interactive  
Object activates the selection mode; the object is  
displayed but no viewer will be updated.") ClearCurrents;
		void ClearCurrents (const Standard_Boolean updateviewer = Standard_True);
		%feature("autodoc", "Args:
	aniObj(Handle_AIS_InteractiveObject)
	updateviewer(Standard_Boolean)=Standard_True

Returns:
	None

Puts the interactive object aniObj in the list of  
selected objects.  
If a local context is open and if updateviewer equals  
Standard_False, the presentation of the Interactive  
Object activates the selection mode; the object is  
displayed but no viewer will be updated.") SetSelected;
		void SetSelected (const Handle_AIS_InteractiveObject & aniObj,const Standard_Boolean updateviewer = Standard_True);
		%feature("autodoc", "Args:
	None
Returns:
	None

puts the selected list in the current objects List.") SetSelectedCurrent;
		void SetSelectedCurrent ();
		%feature("autodoc", "Args:
	updateviewer(Standard_Boolean)=Standard_True

Returns:
	None

updates the list of selected objects  
         i.e. hilights the new selected  
         unhilights old selected objects") UpdateSelected;
		void UpdateSelected (const Standard_Boolean updateviewer = Standard_True);
		%feature("autodoc", "Args:
	aniobj(Handle_AIS_InteractiveObject)
	updateviewer(Standard_Boolean)=Standard_True

Returns:
	None

//!Allows you to add a selected object to the list of  
selected objects or remove it from that list. This entity  
can be an Interactive Object aniobj or its owner  
aShape as can be seen in the two syntaxes above.  
Objects selected when there is no open local context  
are called current objects; those selected in open  
local context, selected objects.  
If a local context is open and if updateviewer equals  
Standard_False, the presentation of the Interactive  
Object activates the selection mode; the object is  
displayed but no viewer will be updated.") AddOrRemoveSelected;
		void AddOrRemoveSelected (const Handle_AIS_InteractiveObject & aniobj,const Standard_Boolean updateviewer = Standard_True);
		%feature("autodoc", "Args:
	updateviewer(Standard_Boolean)=Standard_True

Returns:
	None

Highlights selected objects.  
Objects selected when there is no open local context  
are called current objects; those selected in open  
local context, selected objects.  
If a local context is open and if updateviewer equals  
Standard_False, the presentation of the Interactive  
Object activates the selection mode; the object is  
displayed but no viewer will be updated.") HilightSelected;
		void HilightSelected (const Standard_Boolean updateviewer = Standard_True);
		%feature("autodoc", "Args:
	updateviewer(Standard_Boolean)=Standard_True

Returns:
	None

Removes highlighting from selected objects.  
Objects selected when there is no open local context  
are called current objects; those selected in open  
local context, selected objects.  
If a local context is open and if updateviewer equals  
Standard_False, the presentation of the Interactive  
Object activates the selection mode; the object is  
displayed but no viewer will be updated.") UnhilightSelected;
		void UnhilightSelected (const Standard_Boolean updateviewer = Standard_True);
		%feature("autodoc", "Args:
	updateviewer(Standard_Boolean)=Standard_True

Returns:
	None

Empties previous selected objects in order to get the  
selected objects detected by the selector using  
UpdateSelected.  
Objects selected when there is no open local context  
are called current objects; those selected in open  
local context, selected objects.  
If a local context is open and if updateviewer equals  
Standard_False, the presentation of the Interactive  
Object activates the selection mode; the object is  
displayed but no viewer will be updated.") ClearSelected;
		void ClearSelected (const Standard_Boolean updateviewer = Standard_True);
		%feature("autodoc", "Args:
	aShape(TopoDS_Shape)
	updateviewer(Standard_Boolean)=Standard_True

Returns:
	None

No right to Add a selected Shape (Internal Management  
          of shape Selection).  
          A Previous selected shape may only be removed.") AddOrRemoveSelected;
		void AddOrRemoveSelected (const TopoDS_Shape & aShape,const Standard_Boolean updateviewer = Standard_True);
		%feature("autodoc", "Args:
	anOwner(Handle_SelectMgr_EntityOwner)
	updateviewer(Standard_Boolean)=Standard_True

Returns:
	None

allows to add/remove in the selected list the entities  
         represented by <anOwner> in the selection process.") AddOrRemoveSelected;
		void AddOrRemoveSelected (const Handle_SelectMgr_EntityOwner & anOwner,const Standard_Boolean updateviewer = Standard_True);
		%feature("autodoc", "Args:
	aniobj(Handle_AIS_InteractiveObject)

Returns:
	Standard_Boolean

Finds the selected object aniobj in local context and  
returns its name.  
Objects selected when there is no open local context  
are called current objects; those selected in open  
 local context, selected objects.") IsSelected;
		Standard_Boolean IsSelected (const Handle_AIS_InteractiveObject & aniobj);
		%feature("autodoc", "Args:
	None
Returns:
	None

Initializes a scan of the selected objects in local context.  
Objects selected when there is no open local context  
are called current objects; those selected in open  
local context, selected objects.") InitSelected;
		void InitSelected ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns true if there is another object found by the  
scan of the list of selected objects.  
Objects selected when there is no open local context  
are called current objects; those selected in open  
local context, selected objects.") MoreSelected;
		Standard_Boolean MoreSelected ();
		%feature("autodoc", "Args:
	None
Returns:
	None

Continues the scan to the next object in the list of  
selected objects.  
Objects selected when there is no open local context  
are called current objects; those selected in open  
local context, selected objects.") NextSelected;
		void NextSelected ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") NbSelected;
		Standard_Integer NbSelected ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns true if the interactive context has a shape  
selected in it which results from the decomposition of  
another entity in local context.  
If HasSelectedShape returns true, SelectedShape  
returns the shape which has been shown to be  
selected. Interactive returns the Interactive Object  
from which the shape has been selected.  
If HasSelectedShape returns false, Interactive  
returns the interactive entity selected by the click of the mouse.") HasSelectedShape;
		Standard_Boolean HasSelectedShape ();
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Shape

Returns the selected shape in the open local context.  
Objects selected when there is no open local context  
are called current objects; those selected in open  
local context, selected objects.") SelectedShape;
		TopoDS_Shape SelectedShape ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_SelectMgr_EntityOwner

Returns the owner of the selected entity resulting  
from the decomposition of another entity in local context.") SelectedOwner;
		Handle_SelectMgr_EntityOwner SelectedOwner ();
		%feature("autodoc", "Args:
	theOwners(SelectMgr_IndexedMapOfOwner)
	theIObj(Handle_AIS_InteractiveObject)
	theMode(Standard_Integer)=- 1

Returns:
	None

Returns a collection containing all entity owners  
        created for the interactive object <theIObj> in  
        the selection mode theMode (in all active modes  
        if the Mode == -1)") EntityOwners;
		void EntityOwners (SelectMgr_IndexedMapOfOwner & theOwners,const Handle_AIS_InteractiveObject & theIObj,const Standard_Integer theMode = - 1);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_AIS_InteractiveObject

Returns the location of the selected Interactive Object.") Interactive;
		Handle_AIS_InteractiveObject Interactive ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_AIS_InteractiveObject

No detailed docstring for this function.") SelectedInteractive;
		Handle_AIS_InteractiveObject SelectedInteractive ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns true if the applicative object has an owner  
from Interactive attributed to it.") HasApplicative;
		Standard_Boolean HasApplicative ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Standard_Transient

Returns the owner of the applicative entity detected  
in interactive context. The owner can be a shape for  
a set of sub-shapes or a sub-shape for sub-shapes  
which it is composed of.") Applicative;
		Handle_Standard_Transient Applicative ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns true if there is a mouse-detected entity in local context.  
If there is no open local context, the objects selected  
are called current objects; selected objects if there is  
one. Iterators allow entities to be recovered in either  
case. This method is one of a set which allows you to  
manipulate the objects which have been placed in these two lists.") HasDetected;
		Standard_Boolean HasDetected ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns true if there is a detected shape in local context.  
If there is no open local context, the objects selected  
are called current objects; selected objects if there is  
one. Iterators allow entities to be recovered in either  
case. This method is one of a set which allows you to  
manipulate the objects which have been placed in these two lists.") HasDetectedShape;
		Standard_Boolean HasDetectedShape ();
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Shape

Returns the shape detected in local context.  
If there is no open local context, the objects selected  
are called current objects; selected objects if there is  
one. Iterators allow entities to be recovered in either  
case. This method is one of a set which allows you to  
manipulate the objects which have been placed in these two lists.") DetectedShape;
		const TopoDS_Shape & DetectedShape ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_AIS_InteractiveObject

Returns the interactive objects last detected in open context.  
If there is no open local context, the objects selected  
are called current objects; selected objects if there is  
one. Iterators allow entities to be recovered in either  
case. This method is one of a set which allows you to  
manipulate the objects which have been placed in these two lists.") DetectedInteractive;
		Handle_AIS_InteractiveObject DetectedInteractive ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_SelectMgr_EntityOwner

returns the owner of the detected sensitive primitive.") DetectedOwner;
		Handle_SelectMgr_EntityOwner DetectedOwner ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") InitDetected;
		void InitDetected ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") MoreDetected;
		Standard_Boolean MoreDetected ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") NextDetected;
		void NextDetected ();
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Shape

No detailed docstring for this function.") DetectedCurrentShape;
		const TopoDS_Shape & DetectedCurrentShape ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_AIS_InteractiveObject

No detailed docstring for this function.") DetectedCurrentObject;
		Handle_AIS_InteractiveObject DetectedCurrentObject ();
		%feature("autodoc", "Args:
	UseDisplayedObjects(Standard_Boolean)=Standard_True
	AllowShapeDecomposition(Standard_Boolean)=Standard_True
	AcceptEraseOfObjects(Standard_Boolean)=Standard_False
	BothViewers(Standard_Boolean)=Standard_False

Returns:
	Standard_Integer

Opens local contexts and specifies how this is to be  
done. The options listed above function in the following manner:  
-   UseDisplayedObjects -allows you to load or not  
  load the interactive objects visualized at Neutral  
  Point in the local context which you open. If false,  
  the local context is empty after being opened. If  
  true, the objects at Neutral Point are loaded by their  
  default selection mode.  
-   AllowShapeDecomposition -AIS_Shape allows or  
  prevents decomposition in standard shape location  
  mode of objects at Neutral Point which are  
  type-'privileged'. This Flag is only taken into  
  account when UseDisplayedObjects is true.  
-   AcceptEraseOfObjects -authorises other local  
  contexts to erase the interactive objects present in  
  this context. This option is rarely used.  
-   BothViewers - Has no use currently defined.  
  This method returns the index of the created local  
context. It should be kept and used to close the context.  
Opening a local context allows you to prepare an  
environment for temporary presentations and  
selections which will disappear once the local context is closed.  
You can open several local contexts, but only the last  
one will be active.") OpenLocalContext;
		Standard_Integer OpenLocalContext (const Standard_Boolean UseDisplayedObjects = Standard_True,const Standard_Boolean AllowShapeDecomposition = Standard_True,const Standard_Boolean AcceptEraseOfObjects = Standard_False,const Standard_Boolean BothViewers = Standard_False);
		%feature("autodoc", "Args:
	Index(Standard_Integer)=- 1
	updateviewer(Standard_Boolean)=Standard_True

Returns:
	None

Allows you to close local contexts. For greater  
security, you should close the context with the  
index Index given on opening.  
When you close a local context, the one before,  
which is still on the stack,   reactivates. If none is  
left, you return to Neutral Point.  
If a local context is open and if updateviewer  
equals Standard_False, the presentation of the  
Interactive Object activates the selection mode; the  
object is displayed but no viewer will be updated.  
Warning  
When the index isn't specified, the current context  
is closed. This option can be dangerous, as other  
Interactive Functions can open local contexts  
without necessarily warning the user.") CloseLocalContext;
		void CloseLocalContext (const Standard_Integer Index = - 1,const Standard_Boolean updateviewer = Standard_True);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

returns -1 if no opened local context.") IndexOfCurrentLocal;
		Standard_Integer IndexOfCurrentLocal ();
		%feature("autodoc", "Args:
	updateviewer(Standard_Boolean)=Standard_True

Returns:
	None

Allows you to close all local contexts at one go and  
return to Neutral Point.  
If a local context is open and if updateviewer equals  
Standard_False, the presentation of the Interactive  
Object activates the selection mode; the object is  
displayed but no viewer will be updated.") CloseAllContexts;
		void CloseAllContexts (const Standard_Boolean updateviewer = Standard_True);
		%feature("autodoc", "Args:
	updateviewer(Standard_Boolean)=Standard_True

Returns:
	None

to   be  used only with no  opened  
       local context..  displays and activates objects in their  
       original state before local contexts were opened...") ResetOriginalState;
		void ResetOriginalState (const Standard_Boolean updateviewer = Standard_True);
		%feature("autodoc", "Args:
	TheMode(AIS_ClearMode)=AIS_CM_All

Returns:
	None

clears Objects/Filters/Activated Modes list in the current opened  
         local context.") ClearLocalContext;
		void ClearLocalContext (const AIS_ClearMode TheMode = AIS_CM_All);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") UseDisplayedObjects;
		void UseDisplayedObjects ();
		%feature("autodoc", "Args:
	None
Returns:
	None

when a local Context is opened, one is able to  
         use/not use the displayed objects at neutral point  
         at anytime.") NotUseDisplayedObjects;
		void NotUseDisplayedObjects ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

initializes the list of presentations to be displayed  
         returns False if No Local COnte") BeginImmediateDraw;
		Standard_Boolean BeginImmediateDraw ();
		%feature("autodoc", "Args:
	anIObj(Handle_AIS_InteractiveObject)
	aMode(Standard_Integer)=0

Returns:
	Standard_Boolean

returns True if <anIObj> has been stored in the list.") ImmediateAdd;
		Standard_Boolean ImmediateAdd (const Handle_AIS_InteractiveObject & anIObj,const Standard_Integer aMode = 0);
		%feature("autodoc", "Args:
	anIObj(Handle_AIS_InteractiveObject)
	aMode(Standard_Integer)=0

Returns:
	Standard_Boolean

returns True if <anIObj> has been removed from the list.") ImmediateRemove;
		Standard_Boolean ImmediateRemove (const Handle_AIS_InteractiveObject & anIObj,const Standard_Integer aMode = 0);
		%feature("autodoc", "Args:
	aView(Handle_V3d_View)
	DoubleBuf(Standard_Boolean)=Standard_False

Returns:
	Standard_Boolean

returns True if the immediate display has been done.") EndImmediateDraw;
		Standard_Boolean EndImmediateDraw (const Handle_V3d_View & aView,const Standard_Boolean DoubleBuf = Standard_False);
		%feature("autodoc", "Args:
	DoubleBuf(Standard_Boolean)=Standard_False

Returns:
	Standard_Boolean

Uses the First Active View of Main Viewer!!!  
         returns True if the immediate display has been done.") EndImmediateDraw;
		Standard_Boolean EndImmediateDraw (const Standard_Boolean DoubleBuf = Standard_False);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsImmediateModeOn;
		Standard_Boolean IsImmediateModeOn ();
		%feature("autodoc", "Args:
	aView(Handle_V3d_View)
	anObject(Handle_AIS_InteractiveObject)
	aTranformation(Handle_Geom_Transformation)
	postConcatenate(Standard_Boolean)=Standard_False
	update(Standard_Boolean)=Standard_False
	zBuffer(Standard_Boolean)=Standard_False

Returns:
	None

Transforms the current presentation of the object <anObject>  
         using the transient graphic space of the view <aView> in  
         immediat mode graphics.") Drag;
		void Drag (const Handle_V3d_View & aView,const Handle_AIS_InteractiveObject & anObject,const Handle_Geom_Transformation & aTranformation,const Standard_Boolean postConcatenate = Standard_False,const Standard_Boolean update = Standard_False,const Standard_Boolean zBuffer = Standard_False);
		%feature("autodoc", "Args:
	aStatus(Standard_Boolean)

Returns:
	None

Sets the highlighting status aStatus of detected and  
selected entities.  
Whether you are in Neutral Point or local context, this  
is automatically managed by the Interactive Context.  
This function allows you to disconnect the automatic mode.") SetAutomaticHilight;
		void SetAutomaticHilight (const Standard_Boolean aStatus);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns true if the automatic highlight mode is active  
in an open context.") AutomaticHilight;
		Standard_Boolean AutomaticHilight ();
		%feature("autodoc", "Args:
	aStatus(Standard_Boolean)=Standard_False

Returns:
	None

Enables/Disables the Z detection.  
//!		If TRUE the detection echo can be partially hidden by the  
//!		detected object.") SetZDetection;
		void SetZDetection (const Standard_Boolean aStatus = Standard_False);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Retrieves the Z detection state.") ZDetection;
		Standard_Boolean ZDetection ();
		%feature("autodoc", "Args:
	anIobj(Handle_AIS_InteractiveObject)
	aMode(Standard_Integer)=0

Returns:
	None

Activates the selection mode aMode whose index is  
given, for the given interactive entity anIobj.") Activate;
		void Activate (const Handle_AIS_InteractiveObject & anIobj,const Standard_Integer aMode = 0);
		%feature("autodoc", "Args:
	anIObj(Handle_AIS_InteractiveObject)

Returns:
	None

Deactivates all the activated selection modes  
         of an object.") Deactivate;
		void Deactivate (const Handle_AIS_InteractiveObject & anIObj);
		%feature("autodoc", "Args:
	anIobj(Handle_AIS_InteractiveObject)
	aMode(Standard_Integer)

Returns:
	None

Deactivates all the activated selection modes of the  
interactive object anIobj with a given selection mode aMode.") Deactivate;
		void Deactivate (const Handle_AIS_InteractiveObject & anIobj,const Standard_Integer aMode);
		%feature("autodoc", "Args:
	anIobj(Handle_AIS_InteractiveObject)
	theList(TColStd_ListOfInteger)

Returns:
	None

Returns the list of activated selection modes in an open context.") ActivatedModes;
		void ActivatedModes (const Handle_AIS_InteractiveObject & anIobj,TColStd_ListOfInteger & theList);
		%feature("autodoc", "Args:
	anIobj(Handle_AIS_InteractiveObject)
	aStatus(Standard_Boolean)

Returns:
	None

to be Used only with opened local context and  
         if <anIobj> is of type shape...  
         if <aStatus> = True <anIobj> will be sensitive to  
                        shape selection modes activation.  
                      = False, <anIobj> will not be senstive  
                      any more.") SetShapeDecomposition;
		void SetShapeDecomposition (const Handle_AIS_InteractiveObject & anIobj,const Standard_Boolean aStatus);
		%feature("autodoc", "Args:
	anObj(Handle_AIS_InteractiveObject)
	aDrawer(Handle_Prs3d_Drawer)
	updateviewer(Standard_Boolean)=Standard_True

Returns:
	None

Sets the temporary graphic attributes of the entity  
anObj. These are provided by the attribute manager  
aDrawer and are valid for a particular local context only.  
If a local context is open and if updateviewer equals  
Standard_False, the presentation of the Interactive  
Object activates the selection mode; the object is  
displayed but no viewer will be updated.") SetTemporaryAttributes;
		void SetTemporaryAttributes (const Handle_AIS_InteractiveObject & anObj,const Handle_Prs3d_Drawer & aDrawer,const Standard_Boolean updateviewer = Standard_True);
		%feature("autodoc", "Args:
	aniobj(Handle_AIS_InteractiveObject)
	updateviewer(Standard_Boolean)=Standard_True

Returns:
	None

Highlights, and removes highlights from, the displayed  
object aniobj which is displayed at Neutral Point with  
subintensity color; available only for active local  
context. There is no effect if there is no local context.  
If a local context is open and if updateviewer equals  
Standard_False, the presentation of the Interactive  
Object activates the selection mode; the object is  
displayed but no viewer will be updated.") SubIntensityOn;
		void SubIntensityOn (const Handle_AIS_InteractiveObject & aniobj,const Standard_Boolean updateviewer = Standard_True);
		%feature("autodoc", "Args:
	aniobj(Handle_AIS_InteractiveObject)
	updateviewer(Standard_Boolean)=Standard_True

Returns:
	None

Removes the subintensity option for the entity aniobj.  
If a local context is open and if updateviewer equals  
Standard_False, the presentation of the Interactive  
Object activates the selection mode; the object is  
displayed but no viewer will be updated.") SubIntensityOff;
		void SubIntensityOff (const Handle_AIS_InteractiveObject & aniobj,const Standard_Boolean updateviewer = Standard_True);
		%feature("autodoc", "Args:
	updateviewer(Standard_Boolean)=Standard_True

Returns:
	None

hilights/unhilights displayed objects which are displayed at  
         neutral state with subintensity color;  
         available only for active local context.  
         No effect if no local context.") SubIntensityOn;
		void SubIntensityOn (const Standard_Boolean updateviewer = Standard_True);
		%feature("autodoc", "Args:
	updateviewer(Standard_Boolean)=Standard_True

Returns:
	None

removes subintensity option for all objects.") SubIntensityOff;
		void SubIntensityOff (const Standard_Boolean updateviewer = Standard_True);
		%feature("autodoc", "Args:
	aFilter(Handle_SelectMgr_Filter)

Returns:
	None

Allows you to add the filter aFilter to Neutral Point or  
to a local context if one or more selection modes have been activated.  
Only type filters may be active in Neutral Point.") AddFilter;
		void AddFilter (const Handle_SelectMgr_Filter & aFilter);
		%feature("autodoc", "Args:
	aFilter(Handle_SelectMgr_Filter)

Returns:
	None

Removes a filter from Neutral Point or a local context  
if one or more selection modes have been activated.  
Only type filters are activated in Neutral Point.") RemoveFilter;
		void RemoveFilter (const Handle_SelectMgr_Filter & aFilter);
		%feature("autodoc", "Args:
	None
Returns:
	None

Remove a filter to Neutral Point or a local context if  
one or more selection modes have been activated.  
Only type filters are active in Neutral Point.") RemoveFilters;
		void RemoveFilters ();
		%feature("autodoc", "Args:
	aStandardActivation(TopAbs_ShapeEnum)

Returns:
	None

Provides an alternative to the Display methods when  
activating specific selection modes. This has the  
effect of activating the corresponding selection mode  
aStandardActivation for all objects in Local Context  
which accept decomposition into sub-shapes.  
Every new Object which has been loaded into the  
interactive context and which answers these  
decomposition criteria is automatically activated  
according to these modes.  
Warning  
If you have opened a local context by loading an  
object with the default options  
(<AllowShapeDecomposition >= Standard_True), all  
objects of the 'Shape' type are also activated with  
the same modes. You can act on the state of these  
'Standard' objects by using SetShapeDecomposition(Status).") ActivateStandardMode;
		void ActivateStandardMode (const TopAbs_ShapeEnum aStandardActivation);
		%feature("autodoc", "Args:
	aStandardActivation(TopAbs_ShapeEnum)

Returns:
	None

Provides an alternative to the Display methods when  
deactivating specific selection modes. This has the  
effect of deactivating the corresponding selection  
mode aStandardActivation for all objects in Local  
Context which accept decomposition into sub-shapes.") DeactivateStandardMode;
		void DeactivateStandardMode (const TopAbs_ShapeEnum aStandardActivation);
		%feature("autodoc", "Args:
	None
Returns:
	TColStd_ListOfInteger

Returns the list of activated standard selection modes  
available in a local context.") ActivatedStandardModes;
		const TColStd_ListOfInteger & ActivatedStandardModes ();
		%feature("autodoc", "Args:
	None
Returns:
	SelectMgr_ListOfFilter

Returns the list of filters active in a local context.") Filters;
		const SelectMgr_ListOfFilter & Filters ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Prs3d_Drawer

Returns the default attribute manager.  
This contains all the color and line attributes which  
can be used by interactive objects which do not have  
their own attributes.") DefaultDrawer;
		const Handle_Prs3d_Drawer & DefaultDrawer ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_V3d_Viewer

Returns the current viewer.") CurrentViewer;
		const Handle_V3d_Viewer & CurrentViewer ();
		%feature("autodoc", "Args:
	aListOfIO(AIS_ListOfInteractive)
	OnlyFromNeutral(Standard_Boolean)=Standard_False

Returns:
	None

Returns the list of displayed objects of a particular  
Type WhichKind and Signature WhichSignature. By  
Default, WhichSignature equals -1. This means that  
there is a check on type only.") DisplayedObjects;
		void DisplayedObjects (AIS_ListOfInteractive & aListOfIO,const Standard_Boolean OnlyFromNeutral = Standard_False);
		%feature("autodoc", "Args:
	WhichKind(AIS_KindOfInteractive)
	WhichSignature(Standard_Integer)
	aListOfIO(AIS_ListOfInteractive)
	OnlyFromNeutral(Standard_Boolean)=Standard_False

Returns:
	None

gives the list of displayed objects of a particular  
         Type and signature.  
         by Default, <WhichSignature> = -1 means  
         control only on <WhichKind>.") DisplayedObjects;
		void DisplayedObjects (const AIS_KindOfInteractive WhichKind,const Standard_Integer WhichSignature,AIS_ListOfInteractive & aListOfIO,const Standard_Boolean OnlyFromNeutral = Standard_False);
		%feature("autodoc", "Args:
	theListOfIO(AIS_ListOfInteractive)

Returns:
	None

Returns the list theListOfIO of erased objects (hidden objects)  
particular Type WhichKind and Signature WhichSignature.  
By Default, WhichSignature equals 1. This means  
that there is a check on type only.") ErasedObjects;
		void ErasedObjects (AIS_ListOfInteractive & theListOfIO);
		%feature("autodoc", "Args:
	WhichKind(AIS_KindOfInteractive)
	WhichSignature(Standard_Integer)
	theListOfIO(AIS_ListOfInteractive)

Returns:
	None

gives the list of erased objects (hidden objects)  
         Type and signature  
         by Default, <WhichSignature> = -1 means  
         control only on <WhichKind>.") ErasedObjects;
		void ErasedObjects (const AIS_KindOfInteractive WhichKind,const Standard_Integer WhichSignature,AIS_ListOfInteractive & theListOfIO);
		%feature("autodoc", "Args:
	theStatus(AIS_DisplayStatus)
	theListOfIO(AIS_ListOfInteractive)

Returns:
	None

Returns the list theListOfIO of objects with indicated display status  
particular Type WhichKind and Signature WhichSignature.  
By Default, WhichSignature equals 1. This means  
that there is a check on type only.") ObjectsByDisplayStatus;
		void ObjectsByDisplayStatus (const AIS_DisplayStatus theStatus,AIS_ListOfInteractive & theListOfIO);
		%feature("autodoc", "Args:
	WhichKind(AIS_KindOfInteractive)
	WhichSignature(Standard_Integer)
	theStatus(AIS_DisplayStatus)
	theListOfIO(AIS_ListOfInteractive)

Returns:
	None

gives the list of objects with indicated display status  
         Type and signature  
         by Default, <WhichSignature> = -1 means  
         control only on <WhichKind>.") ObjectsByDisplayStatus;
		void ObjectsByDisplayStatus (const AIS_KindOfInteractive WhichKind,const Standard_Integer WhichSignature,const AIS_DisplayStatus theStatus,AIS_ListOfInteractive & theListOfIO);
		%feature("autodoc", "Args:
	aListOfIO(AIS_ListOfInteractive)
	WhichKind(AIS_KindOfInteractive)=AIS_KOI_None
	WhichSignature(Standard_Integer)=- 1

Returns:
	None

fills <aListOfIO> with objects of a particular  
         Type and Signature with no consideration of display status.  
         by Default, <WhichSignature> = -1 means  
         control only on <WhichKind>.  
         if <WhichKind> = AIS_KOI_None and <WhichSignature> = -1,  
         all the objects are put into the list.") ObjectsInside;
		void ObjectsInside (AIS_ListOfInteractive & aListOfIO,const AIS_KindOfInteractive WhichKind = AIS_KOI_None,const Standard_Integer WhichSignature = - 1);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns true if there is an open context.") HasOpenedContext;
		Standard_Boolean HasOpenedContext ();
		%feature("autodoc", "Args:
	None
Returns:
	TCollection_AsciiString

Returns the name of the current selected entity in Neutral Point.  
Objects selected when there is no open local context  
are called current objects; those selected in open  
local context, selected objects.") CurrentName;
		const TCollection_AsciiString & CurrentName ();
		%feature("autodoc", "Args:
	None
Returns:
	TCollection_AsciiString

Returns the name of the current selected entity in  
open local context.  
Objects selected when there is no open local context  
are called current objects; those selected in open  
local context, selected objects.") SelectionName;
		const TCollection_AsciiString & SelectionName ();
		%feature("autodoc", "Args:
	None
Returns:
	char *

Returns the domain name of the main viewer.") DomainOfMainViewer;
		char * DomainOfMainViewer ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_AIS_LocalContext

This method is only intended for advanced operation, particularly with  
the aim to improve performance when many objects have to be selected  
together. Otherwise, you should use other (non-internal) methods of  
class AIS_InteractiveContext without trying to obtain an instance of  
AIS_LocalContext.") LocalContext;
		Handle_AIS_LocalContext LocalContext ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_SelectMgr_SelectionManager

No detailed docstring for this function.") SelectionManager;
		const Handle_SelectMgr_SelectionManager & SelectionManager ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_PrsMgr_PresentationManager3d

No detailed docstring for this function.") MainPrsMgr;
		const Handle_PrsMgr_PresentationManager3d & MainPrsMgr ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_StdSelect_ViewerSelector3d

No detailed docstring for this function.") MainSelector;
		const Handle_StdSelect_ViewerSelector3d & MainSelector ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_StdSelect_ViewerSelector3d

No detailed docstring for this function.") LocalSelector;
		Handle_StdSelect_ViewerSelector3d LocalSelector ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Clears all the structures which don't  
         belong to objects displayed at neutral point  
         only effective when no Local Context is opened...  
         returns the number of removed  structures from the viewers.") PurgeDisplay;
		Standard_Integer PurgeDisplay ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") HighestIndex;
		Standard_Integer HighestIndex ();
		%feature("autodoc", "Args:
	aView(Handle_V3d_View)

Returns:
	None

No detailed docstring for this function.") DisplayActiveAreas;
		void DisplayActiveAreas (const Handle_V3d_View & aView);
		%feature("autodoc", "Args:
	aView(Handle_V3d_View)

Returns:
	None

No detailed docstring for this function.") ClearActiveAreas;
		void ClearActiveAreas (const Handle_V3d_View & aView);
		%feature("autodoc", "Args:
	aView(Handle_V3d_View)

Returns:
	None

No detailed docstring for this function.") DisplayActiveSensitive;
		void DisplayActiveSensitive (const Handle_V3d_View & aView);
		%feature("autodoc", "Args:
	aView(Handle_V3d_View)

Returns:
	None

No detailed docstring for this function.") ClearActiveSensitive;
		void ClearActiveSensitive (const Handle_V3d_View & aView);
		%feature("autodoc", "Args:
	anObject(Handle_AIS_InteractiveObject)
	aView(Handle_V3d_View)

Returns:
	None

No detailed docstring for this function.") DisplayActiveSensitive;
		void DisplayActiveSensitive (const Handle_AIS_InteractiveObject & anObject,const Handle_V3d_View & aView);
		%feature("autodoc", "Args:
	anObject(Handle_AIS_InteractiveObject)
	aView(Handle_V3d_View)

Returns:
	None

No detailed docstring for this function.") DisplayActiveAreas;
		void DisplayActiveAreas (const Handle_AIS_InteractiveObject & anObject,const Handle_V3d_View & aView);
		%feature("autodoc", "Args:
	anObject(Handle_AIS_InteractiveObject)
	TheIndex(Standard_Integer)

Returns:
	Standard_Boolean

returns if possible,  
         the first local context where the object is seen") IsInLocal;
		Standard_Boolean IsInLocal (const Handle_AIS_InteractiveObject & anObject,Standard_Integer &OutValue);
};


%feature("shadow") AIS_InteractiveContext::~AIS_InteractiveContext %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend AIS_InteractiveContext {
	void _kill_pointed() {
		delete $self;
	}
};
%extend AIS_InteractiveContext {
	Handle_AIS_InteractiveContext GetHandle() {
	return *(Handle_AIS_InteractiveContext*) &$self;
	}
};

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
    AIS_InteractiveContext* GetObject() {
    return (AIS_InteractiveContext*)$self->Access();
    }
};
%feature("shadow") Handle_AIS_InteractiveContext::~Handle_AIS_InteractiveContext %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_AIS_InteractiveContext {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor AIS_InteractiveObject;
class AIS_InteractiveObject : public SelectMgr_SelectableObject {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	virtual AIS_KindOfInteractive

Returns the kind of Interactive Object:  
-   None  
-   Datum  
-   Relation  
-   Object  
  By default, the   interactive object has a None type.  
Because specific shapes entail different behavior  
according to their sub-shapes, you may need to  
create a Local Context. This will allow you to  
specify the additional characteristics which you  
need to handle these shapes.") Type;
		virtual AIS_KindOfInteractive Type ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual Standard_Integer

Specifies additional characteristics of Interactive  
Objects. A signature is, in fact, an index with integer  
values assigned different properties.  
This method is frequently used in conjuction with  
Type to give a particular type and signature to an  
Interactive Object. By default, the Interactive Object  
has a None type and a signature of 0. Among the  
datums, this signature is attributed to the shape  
The remaining datums have the following default signatures:  
-   Point                   signature 1  
-   Axis                     signature 2  
-   Trihedron                signature 3  
-   PlaneTrihedron            signature 4  
-   Line                     signature 5  
-   Circle                  signature 6  
-   Plane                   signature 7.") Signature;
		virtual Standard_Integer Signature ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Informs the graphic context that the interactive Object  
may be decomposed into sub-shapes for dynamic selection.  
The most used Interactive Object is AIS_Shape.  
Activation methods for standard selection modes are  
proposed in the Interactive Context. These include  
selection by vertex or by edges. For datums with the  
same behavior as AIS_Shape, such as vetices and  
edges, we must redefine the virtual method so that  
AcceptShapeDecomposition returns false.  
     Rule for selection :  
       Mode 0 :  Selection of  the interactive Object itself  
       Mode 1 :  Selection of vertices  
       Mode 2 :  Selection Of Edges  
       Mode 3 :  Selection Of Wires  
       Mode 4 :  Selection Of Faces ...") AcceptShapeDecomposition;
		Standard_Boolean AcceptShapeDecomposition ();
		%feature("autodoc", "Args:
	aModel(Aspect_TypeOfFacingModel)=Aspect_TOFM_BOTH_SIDE

Returns:
	None

change the current facing model apply on polygons for  
SetColor(), SetTransparency(), SetMaterial() methods  
default facing model is Aspect_TOFM_TWO_SIDE. This mean that attributes is  
applying both on the front and back face.") SetCurrentFacingModel;
		void SetCurrentFacingModel (const Aspect_TypeOfFacingModel aModel = Aspect_TOFM_BOTH_SIDE);
		%feature("autodoc", "Args:
	None
Returns:
	Aspect_TypeOfFacingModel

Returns the current facing model which is in effect.") CurrentFacingModel;
		Aspect_TypeOfFacingModel CurrentFacingModel ();
		%feature("autodoc", "Args:
	aColor(Quantity_Color)

Returns:
	virtual void

No detailed docstring for this function.") SetColor;
		virtual void SetColor (const Quantity_Color & aColor);
		%feature("autodoc", "Args:
	aColor(Quantity_NameOfColor)

Returns:
	virtual void

only the interactive obj knowns which Drawer attribute  
         is  affected by the color  (ex:  for a  wire, it's the  
         wireaspect field of the drawer, but  for a vertex, only  
         the point aspect field is affected by the color)  
         WARNING : Do not forget to set the corresponding fields  
         here (hasOwnColor and myOwnColor)") SetColor;
		virtual void SetColor (const Quantity_NameOfColor aColor);
		%feature("autodoc", "Args:
	None
Returns:
	virtual void

Removes color settings. Only the Interactive Object  
knows which Drawer attribute is   affected by the color  
setting. For a wire, for example, wire aspect is the  
attribute affected. For a vertex, however, only point  
aspect is affected by the color setting.") UnsetColor;
		virtual void UnsetColor ();
		%feature("autodoc", "Args:
	aValue(Standard_Real)

Returns:
	virtual void

Allows you to provide the setting aValue for width.  
Only the Interactive Object knows which Drawer  
attribute is affected by the width setting.") SetWidth;
		virtual void SetWidth (const Standard_Real aValue);
		%feature("autodoc", "Args:
	None
Returns:
	virtual void

No detailed docstring for this function.") UnsetWidth;
		virtual void UnsetWidth ();
		%feature("autodoc", "Args:
	aMode(Standard_Integer)

Returns:
	virtual Standard_Boolean

Returns true if the class of objects accepts the display mode aMode.  
The interactive context can have a default mode of  
representation for the set of Interactive Objects. This  
mode may not be accepted by a given class of  
objects. Consequently, this virtual method allowing us  
to get information about the class in question must be implemented.") AcceptDisplayMode;
		virtual Standard_Boolean AcceptDisplayMode (const Standard_Integer aMode);
		%feature("autodoc", "Args:
	None
Returns:
	virtual Standard_Integer

Returns the default display mode. This method is to  
be implemented when the main mode is not mode 0.") DefaultDisplayMode;
		virtual Standard_Integer DefaultDisplayMode ();
		%feature("autodoc", "Args:
	AllModes(Standard_Boolean)=Standard_False

Returns:
	None

Updates the active presentation; if <AllModes> = Standard_True  
         all the presentations inside are recomputed.") Redisplay;
		void Redisplay (const Standard_Boolean AllModes = Standard_False);
		%feature("autodoc", "Args:
	aFlag(Standard_Boolean)=Standard_True

Returns:
	None

Sets the infinite state flag aFlage.  
if   <aFlag>   = True  ,  the   interactiveObject  is  
         considered as infinite, i.e. its graphic presentations  
         are not taken in account for View FitAll...") SetInfiniteState;
		void SetInfiniteState (const Standard_Boolean aFlag = Standard_True);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns true if the interactive object is infinite. In this  
case, its graphic presentations are not taken into  
account in the fit-all view.") IsInfinite;
		Standard_Boolean IsInfinite ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Indicates whether the Interactive Object has a pointer  
to an interactive context.") HasInteractiveContext;
		Standard_Boolean HasInteractiveContext ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_AIS_InteractiveContext

Returns the context pointer to the interactive context.") GetContext;
		Handle_AIS_InteractiveContext GetContext ();
		%feature("autodoc", "Args:
	aCtx(Handle_AIS_InteractiveContext)

Returns:
	virtual void

Sets the interactive context aCtx and provides a link  
to the default drawing tool or 'Drawer' if there is none.") SetContext;
		virtual void SetContext (const Handle_AIS_InteractiveContext & aCtx);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns true if the object has an owner attributed to it.  
The owner can be a shape for a set of sub-shapes or  
a sub-shape for sub-shapes which it is composed of,  
and takes the form of a transient.") HasOwner;
		Standard_Boolean HasOwner ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Standard_Transient

Returns the owner of the Interactive Object.  
The owner can be a shape for a set of sub-shapes or  
a sub-shape for sub-shapes which it is composed of,  
and takes the form of a transient.  
There are two types of owners:  
-   Direct owners, decomposition shapes such as  
  edges, wires, and faces.  
-   Users, presentable objects connecting to sensitive  
  primitives, or a shape which has been decomposed.") GetOwner;
		const Handle_Standard_Transient & GetOwner ();
		%feature("autodoc", "Args:
	ApplicativeEntity(Handle_Standard_Transient)

Returns:
	None

Allows you to attribute the owner ApplicativeEntity to  
an Interactive Object. This can be a shape for a set of  
sub-shapes or a sub-shape for sub-shapes which it  
is composed of. The owner takes the form of a transient.") SetOwner;
		void SetOwner (const Handle_Standard_Transient & ApplicativeEntity);
		%feature("autodoc", "Args:
	None
Returns:
	None

Each Interactive Object has methods which allow us  
to attribute an Owner to it in the form of a Transient.  
This method removes the owner from the graphic entity.") ClearOwner;
		void ClearOwner ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") HasUsers;
		Standard_Boolean HasUsers ();
		%feature("autodoc", "Args:
	None
Returns:
	TColStd_ListOfTransient

No detailed docstring for this function.") Users;
		const TColStd_ListOfTransient & Users ();
		%feature("autodoc", "Args:
	aUser(Handle_Standard_Transient)

Returns:
	None

No detailed docstring for this function.") AddUser;
		void AddUser (const Handle_Standard_Transient & aUser);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") ClearUsers;
		void ClearUsers ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns true if the Interactive Object has a display  
mode setting. Otherwise, it is displayed in Neutral Point.") HasDisplayMode;
		Standard_Boolean HasDisplayMode ();
		%feature("autodoc", "Args:
	aMode(Standard_Integer)

Returns:
	None

Sets the display mode aMode for the interactive object.  
An object can have its own temporary display mode,  
which is different from that proposed by the interactive context.  
The range of possibilities currently proposed is the following:  
-   AIS_WireFrame  
-   AIS_Shaded  
  This range can, however, be extended through the creation of new display modes.") SetDisplayMode;
		void SetDisplayMode (const Standard_Integer aMode);
		%feature("autodoc", "Args:
	None
Returns:
	None

Removes display mode settings from the interactive object.") UnsetDisplayMode;
		void UnsetDisplayMode ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Returns the display mode setting of the Interactive Object.  
The range of possibilities is the following:  
-   AIS_WireFrame  
-   AIS_Shaded  
  This range can, however, be extended through the  
creation of new display modes.") DisplayMode;
		Standard_Integer DisplayMode ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Allows you to change the selection mode of an  
Interactive Object.  
The default selection mode setting is 0.  
For shapes, for example, the selection modes are as follows:  
-   mode 0 - selection of the shape itself  
-   mode 1 - selection of vertices  
-   mode 2 - selection of edges  
-   mode 3 - selection of wires  
-   mode 4 - selection of faces  
-   mode 5 - selection of shells  
-   mode 6 - selection of solids  
-   mode 7 - selection of compounds  
  For trihedra, on the other hand, the selection modes are the following four:  
-   mode 0 - selection of a trihedron  
-   mode 1 - selection of its origin  
-   mode 2 - selection of its axes  
-   mode 3 - selection of its planes") HasSelectionMode;
		Standard_Boolean HasSelectionMode ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Returns the selection mode of the interactive object.") SelectionMode;
		Standard_Integer SelectionMode ();
		%feature("autodoc", "Args:
	aMode(Standard_Integer)

Returns:
	None

You can change the default selection mode index  
aMode of an Interactive Object.  
This is only of interest if you decide that mode 0  
adopted by convention will not do.") SetSelectionMode;
		void SetSelectionMode (const Standard_Integer aMode);
		%feature("autodoc", "Args:
	None
Returns:
	None

You can change the default selection mode index of  
an Interactive Object.  
This is only of interest if you decide that the 0 mode  
adopted by convention will not do.") UnsetSelectionMode;
		void UnsetSelectionMode ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Returns the selection priority setting. -1 indicates that there is none.  
You can modify the selection priority of an owner to  
make one entity more selectionable than another one.  
The default selection priority for an owner is 5, for  
example. To increase selection priority, choose a  
setting between 5 and 10. An entity with priority 7 will  
take priority over one with a setting of 6 if both  
objects are selected at the same time.  
You could give vertices priority 8, edges priority 7,  
faces priority 6, and shapes priority 5. If a vertex, an  
edge and a face are simultaneously detected during  
selection, only the vertex will then be highlighted.  
For trihedra, for example, the default priorities are the following four:  
-   priority 1 - a trihedron  
-   priority 5 - its origin  
-   priority 3 - its axes  
-   priority 2 - its planes") SelectionPriority;
		Standard_Integer SelectionPriority ();
		%feature("autodoc", "Args:
	aPriority(Standard_Integer)

Returns:
	None

Allows you to provide a setting aPriority for selection priority.  
You can modify selection priority of an owner to make  
one entity more selectionable than another one. The  
default selection priority for an owner is 5, for  
example. To increase selection priority, choose a  
setting between 5 and 10. An entity with priority 7 will  
take priority over one with a setting of 6.") SetSelectionPriority;
		void SetSelectionPriority (const Standard_Integer aPriority);
		%feature("autodoc", "Args:
	None
Returns:
	None

Removes the setting for selection priority. SelectionPriority then returns -1.") UnsetSelectionPriority;
		void UnsetSelectionPriority ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns true if there is a setting for selection priority.  
You can modify selection priority of an owner to make  
one entity more selectionable than another one. The  
default selection priority for an owner is 5, for  
example. To increase selection priority, choose a  
setting between 5 and 10. An entity with priority 7 will  
take priority over one with a setting of 6.") HasSelectionPriority;
		Standard_Boolean HasSelectionPriority ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns true if the Interactive Object is in highlight mode.") HasHilightMode;
		Standard_Boolean HasHilightMode ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Returns the setting for highlight mode.  
At dynamic detection, the presentation echoed by the  
Interactive Context, is by default the presentation  
already on the screen. You can specify a Highlight  
presentation mode which is valid no matter what the  
active representation of the object. It makes no  
difference whether this choice is temporary or  
definitive.   To do this, we use the following functions:  
-   SetHilightMode  
-   UnSetHilightMode  
  In the case of a shape, whether it is visualized in  
wireframe presentation or with shading, we want to  
systematically highlight the wireframe presentation.  
Consequently, we set the highlight mode to 0.") HilightMode;
		Standard_Integer HilightMode ();
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)

Returns:
	None

Sets the highlight mode anIndex for the interactive object.  
If, for example, you want to systematically highlight  
the wireframe presentation of a shape - whether  
visualized in wireframe presentation or with shading -  
you set the highlight mode to 0.") SetHilightMode;
		void SetHilightMode (const Standard_Integer anIndex);
		%feature("autodoc", "Args:
	None
Returns:
	None

Allows the user to take a given Prs for hilight  
         ex : for a shape which would be displayed in shading mode  
         the hilight Prs is the wireframe mode.  
         if No specific hilight mode is defined, the displayed Prs  
         will be the hilighted one.") UnsetHilightMode;
		void UnsetHilightMode ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns true if the Interactive Object has color.") HasColor;
		Standard_Boolean HasColor ();
		%feature("autodoc", "Args:
	None
Returns:
	Quantity_NameOfColor

Returns the color setting of the Interactive Object.") Color;
		Quantity_NameOfColor Color ();
		%feature("autodoc", "Args:
	aColor(Quantity_Color)

Returns:
	None

No detailed docstring for this function.") Color;
		void Color (Quantity_Color & aColor);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns true if the Interactive Object has width.") HasWidth;
		Standard_Boolean HasWidth ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

Returns the width setting of the Interactive Object.") Width;
		Standard_Real Width ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns true if the Interactive Object has a setting for material.") HasMaterial;
		Standard_Boolean HasMaterial ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual Graphic3d_NameOfMaterial

Returns the current material setting.  
This will be on of the following materials:  
-   Brass  
-   Bronze  
-   Gold  
-   Pewter  
-   Silver  
-   Stone.") Material;
		virtual Graphic3d_NameOfMaterial Material ();
		%feature("autodoc", "Args:
	aName(Graphic3d_NameOfMaterial)

Returns:
	virtual void

Sets the name aName for material defining this  
display attribute for the interactive object.  
Material aspect determines shading aspect, color and  
transparency of visible entities.") SetMaterial;
		virtual void SetMaterial (const Graphic3d_NameOfMaterial aName);
		%feature("autodoc", "Args:
	aName(Graphic3d_MaterialAspect)

Returns:
	virtual void

Sets the material aMat defining this display attribute  
for the interactive object.  
Material aspect determines shading aspect, color and  
transparency of visible entities.") SetMaterial;
		virtual void SetMaterial (const Graphic3d_MaterialAspect & aName);
		%feature("autodoc", "Args:
	None
Returns:
	virtual void

Removes the setting for material.") UnsetMaterial;
		virtual void UnsetMaterial ();
		%feature("autodoc", "Args:
	aValue(Standard_Real)=0.6

Returns:
	virtual void

Attributes a setting aValue for transparency.  
The transparency value should be between 0.0 and 1.0.  
At 0.0 an object will be totally opaque, and at 1.0, fully transparent.  
Warning At a value of 1.0, there may be nothing visible.") SetTransparency;
		virtual void SetTransparency (const Standard_Real aValue = 0.6);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns true if there is a transparency setting.") IsTransparent;
		Standard_Boolean IsTransparent ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual Standard_Real

Returns the transparency setting.  
This will be between 0.0 and 1.0.  
At 0.0 an object will be totally opaque, and at 1.0, fully transparent.") Transparency;
		virtual Standard_Real Transparency ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual void

Removes the transparency setting. The object is opaque by default.") UnsetTransparency;
		virtual void UnsetTransparency ();
		%feature("autodoc", "Args:
	aDrawer(Handle_AIS_Drawer)

Returns:
	virtual void

Initializes the drawing tool aDrawer.") SetAttributes;
		virtual void SetAttributes (const Handle_AIS_Drawer & aDrawer);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_AIS_Drawer

Returns the attributes settings.") Attributes;
		const Handle_AIS_Drawer & Attributes ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual void

Clears settings provided by the drawing tool aDrawer.") UnsetAttributes;
		virtual void UnsetAttributes ();
		%feature("autodoc", "Args:
	theState(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") State;
		void State (const Standard_Integer theState);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") State;
		Standard_Integer State ();
		%feature("autodoc", "Args:
	aTranformation(Handle_Geom_Transformation)
	postConcatenate(Standard_Boolean)=Standard_False
	updateSelection(Standard_Boolean)=Standard_True

Returns:
	None

Transforms all presentations of the object  
 and replace the actual transformation matrix if <postConcatenate> is FALSE.  
Note that the selection  must be updated only at the end of  
object animation when <updateSelection> is TRUE") SetTransformation;
		void SetTransformation (const Handle_Geom_Transformation & aTranformation,const Standard_Boolean postConcatenate = Standard_False,const Standard_Boolean updateSelection = Standard_True);
		%feature("autodoc", "Args:
	None
Returns:
	None

Deactivate the current transformation") UnsetTransformation;
		void UnsetTransformation ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Geom_Transformation

Returns the current transformation associated  
to the first available presentation of this object.") Transformation;
		Handle_Geom_Transformation Transformation ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns TRUE when this object is transformed") HasTransformation;
		Standard_Boolean HasTransformation ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns TRUE when this object has a presentation  
         in the current DisplayMode()") HasPresentation;
		Standard_Boolean HasPresentation ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Prs3d_Presentation

Returns the current presentation of this object  
         according to the current DisplayMode()") Presentation;
		Handle_Prs3d_Presentation Presentation ();
		%feature("autodoc", "Args:
	anAspect(Handle_Prs3d_BasicAspect)
	globalChange(Standard_Boolean)=Standard_True

Returns:
	None

Sets the graphic basic aspect to the current presentation.  
         When <globalChange> is TRUE , the full object presentation  
         is changed.  
         When <globalChange> is FALSE , only the current group  
         of the object presentation is changed.") SetAspect;
		void SetAspect (const Handle_Prs3d_BasicAspect & anAspect,const Standard_Boolean globalChange = Standard_True);
		%feature("autodoc", "Args:
	aMode(Standard_Integer)
	aFactor(Standard_ShortReal)=1.0
	aUnits(Standard_ShortReal)=0.0

Returns:
	virtual void

Sets up polygon offsets for this object.  
         It modifies all existing presentations of <anObj> (if any),  
         so it is reasonable to call this method after <anObj> has been displayed.  
         Otherwise, Compute() method should pass Graphic3d_AspectFillArea3d  
         aspect from <myDrawer> to Graphic3d_Group to make polygon offsets work.  
 
         <aMode> parameter can contain various combinations of  
         Aspect_PolygonOffsetMode enumeration elements (Aspect_POM_None means  
         that polygon offsets are not changed).  
         If <aMode> is different from Aspect_POM_Off and Aspect_POM_None, then <aFactor> and <aUnits>  
         arguments are used by graphic renderer to calculate a depth offset value:  
 
         offset = <aFactor> * m + <aUnits> * r, where  
         m - maximum depth slope for the polygon currently being displayed,  
         r - minimum window coordinates depth resolution (implementation-specific).  
 
         Deafult settings for OCC 3D viewer: mode = Aspect_POM_Fill, factor = 1., units = 0.  
 
         Negative offset values move polygons closer to the viewport,  
         while positive values shift polygons away.  
         Consult OpenGL reference for details (glPolygonOffset function description).  
 
         NOTE: This method has a side effect - it creates own shading aspect  
         if not yet created, so it is better to set up object material,  
         color, etc. first.") SetPolygonOffsets;
		virtual void SetPolygonOffsets (const Standard_Integer aMode,const Standard_ShortReal aFactor = 1.0,const Standard_ShortReal aUnits = 0.0);
		%feature("autodoc", "Args:
	None
Returns:
	virtual Standard_Boolean

Returns Standard_True if <myDrawer> has non-null shading aspect") HasPolygonOffsets;
		virtual Standard_Boolean HasPolygonOffsets ();
		%feature("autodoc", "Args:
	aMode(Standard_Integer)
	aFactor(Standard_ShortReal)
	aUnits(Standard_ShortReal)

Returns:
	virtual void

Retrieves current polygon offsets settings from <myDrawer>.") PolygonOffsets;
		virtual void PolygonOffsets (Standard_Integer &OutValue,Standard_ShortReal & aFactor,Standard_ShortReal & aUnits);
};


%feature("shadow") AIS_InteractiveObject::~AIS_InteractiveObject %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend AIS_InteractiveObject {
	void _kill_pointed() {
		delete $self;
	}
};
%extend AIS_InteractiveObject {
	Handle_AIS_InteractiveObject GetHandle() {
	return *(Handle_AIS_InteractiveObject*) &$self;
	}
};

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
    AIS_InteractiveObject* GetObject() {
    return (AIS_InteractiveObject*)$self->Access();
    }
};
%feature("shadow") Handle_AIS_InteractiveObject::~Handle_AIS_InteractiveObject %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_AIS_InteractiveObject {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor AIS_ListIteratorOfListOfInteractive;
class AIS_ListIteratorOfListOfInteractive {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") AIS_ListIteratorOfListOfInteractive;
		 AIS_ListIteratorOfListOfInteractive ();
		%feature("autodoc", "Args:
	L(AIS_ListOfInteractive)

Returns:
	None

No detailed docstring for this function.") AIS_ListIteratorOfListOfInteractive;
		 AIS_ListIteratorOfListOfInteractive (const AIS_ListOfInteractive & L);
		%feature("autodoc", "Args:
	L(AIS_ListOfInteractive)

Returns:
	None

No detailed docstring for this function.") Initialize;
		void Initialize (const AIS_ListOfInteractive & L);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") More;
		Standard_Boolean More ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Next;
		void Next ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_AIS_InteractiveObject

No detailed docstring for this function.") Value;
		Handle_AIS_InteractiveObject & Value ();
};


%feature("shadow") AIS_ListIteratorOfListOfInteractive::~AIS_ListIteratorOfListOfInteractive %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend AIS_ListIteratorOfListOfInteractive {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor AIS_ListNodeOfListOfInteractive;
class AIS_ListNodeOfListOfInteractive : public TCollection_MapNode {
	public:
		%feature("autodoc", "Args:
	I(Handle_AIS_InteractiveObject)
	n(TCollection_MapNodePtr)

Returns:
	None

No detailed docstring for this function.") AIS_ListNodeOfListOfInteractive;
		 AIS_ListNodeOfListOfInteractive (const Handle_AIS_InteractiveObject & I,const TCollection_MapNodePtr & n);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_AIS_InteractiveObject

No detailed docstring for this function.") Value;
		Handle_AIS_InteractiveObject & Value ();
};


%feature("shadow") AIS_ListNodeOfListOfInteractive::~AIS_ListNodeOfListOfInteractive %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend AIS_ListNodeOfListOfInteractive {
	void _kill_pointed() {
		delete $self;
	}
};
%extend AIS_ListNodeOfListOfInteractive {
	Handle_AIS_ListNodeOfListOfInteractive GetHandle() {
	return *(Handle_AIS_ListNodeOfListOfInteractive*) &$self;
	}
};

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
    AIS_ListNodeOfListOfInteractive* GetObject() {
    return (AIS_ListNodeOfListOfInteractive*)$self->Access();
    }
};
%feature("shadow") Handle_AIS_ListNodeOfListOfInteractive::~Handle_AIS_ListNodeOfListOfInteractive %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_AIS_ListNodeOfListOfInteractive {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor AIS_ListOfInteractive;
class AIS_ListOfInteractive {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") AIS_ListOfInteractive;
		 AIS_ListOfInteractive ();
		%feature("autodoc", "Args:
	Other(AIS_ListOfInteractive)

Returns:
	None

No detailed docstring for this function.") Assign;
		void Assign (const AIS_ListOfInteractive & Other);
		%feature("autodoc", "Args:
	Other(AIS_ListOfInteractive)

Returns:
	None

No detailed docstring for this function.") operator=;
		void operator = (const AIS_ListOfInteractive & Other);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Extent;
		Standard_Integer Extent ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsEmpty;
		Standard_Boolean IsEmpty ();
		%feature("autodoc", "Args:
	I(Handle_AIS_InteractiveObject)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (const Handle_AIS_InteractiveObject & I);
		%feature("autodoc", "Args:
	I(Handle_AIS_InteractiveObject)
	theIt(AIS_ListIteratorOfListOfInteractive)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (const Handle_AIS_InteractiveObject & I,AIS_ListIteratorOfListOfInteractive & theIt);
		%feature("autodoc", "Args:
	Other(AIS_ListOfInteractive)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (AIS_ListOfInteractive & Other);
		%feature("autodoc", "Args:
	I(Handle_AIS_InteractiveObject)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (const Handle_AIS_InteractiveObject & I);
		%feature("autodoc", "Args:
	I(Handle_AIS_InteractiveObject)
	theIt(AIS_ListIteratorOfListOfInteractive)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (const Handle_AIS_InteractiveObject & I,AIS_ListIteratorOfListOfInteractive & theIt);
		%feature("autodoc", "Args:
	Other(AIS_ListOfInteractive)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (AIS_ListOfInteractive & Other);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_AIS_InteractiveObject

No detailed docstring for this function.") First;
		Handle_AIS_InteractiveObject & First ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_AIS_InteractiveObject

No detailed docstring for this function.") Last;
		Handle_AIS_InteractiveObject & Last ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") RemoveFirst;
		void RemoveFirst ();
		%feature("autodoc", "Args:
	It(AIS_ListIteratorOfListOfInteractive)

Returns:
	None

No detailed docstring for this function.") Remove;
		void Remove (AIS_ListIteratorOfListOfInteractive & It);
		%feature("autodoc", "Args:
	I(Handle_AIS_InteractiveObject)
	It(AIS_ListIteratorOfListOfInteractive)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Handle_AIS_InteractiveObject & I,AIS_ListIteratorOfListOfInteractive & It);
		%feature("autodoc", "Args:
	Other(AIS_ListOfInteractive)
	It(AIS_ListIteratorOfListOfInteractive)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (AIS_ListOfInteractive & Other,AIS_ListIteratorOfListOfInteractive & It);
		%feature("autodoc", "Args:
	I(Handle_AIS_InteractiveObject)
	It(AIS_ListIteratorOfListOfInteractive)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Handle_AIS_InteractiveObject & I,AIS_ListIteratorOfListOfInteractive & It);
		%feature("autodoc", "Args:
	Other(AIS_ListOfInteractive)
	It(AIS_ListIteratorOfListOfInteractive)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (AIS_ListOfInteractive & Other,AIS_ListIteratorOfListOfInteractive & It);
};


%feature("shadow") AIS_ListOfInteractive::~AIS_ListOfInteractive %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend AIS_ListOfInteractive {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor AIS_LocalContext;
class AIS_LocalContext : public MMgt_TShared {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") AIS_LocalContext;
		 AIS_LocalContext ();
		%feature("autodoc", "Args:
	aCtx(Handle_AIS_InteractiveContext)
	anIndex(Standard_Integer)
	LoadDisplayed(Standard_Boolean)=Standard_True
	AcceptStandardModes(Standard_Boolean)=Standard_True
	AcceptErase(Standard_Boolean)=Standard_False
	UseBothViewers(Standard_Boolean)=Standard_False

Returns:
	None

Constructor By Default, the  displayed objects are  
         automatically loaded.") AIS_LocalContext;
		 AIS_LocalContext (const Handle_AIS_InteractiveContext & aCtx,const Standard_Integer anIndex,const Standard_Boolean LoadDisplayed = Standard_True,const Standard_Boolean AcceptStandardModes = Standard_True,const Standard_Boolean AcceptErase = Standard_False,const Standard_Boolean UseBothViewers = Standard_False);
		%feature("autodoc", "Args:
	aStatus(Standard_Boolean)

Returns:
	None

authorize or not others contexts to erase  
         temporary displayed objects here;") AcceptErase;
		void AcceptErase (const Standard_Boolean aStatus);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") AcceptErase;
		Standard_Boolean AcceptErase ();
		%feature("autodoc", "Args:
	aCtx(Handle_AIS_InteractiveContext)

Returns:
	None

No detailed docstring for this function.") SetContext;
		void SetContext (const Handle_AIS_InteractiveContext & aCtx);
		%feature("autodoc", "Args:
	None
Returns:
	TCollection_AsciiString

No detailed docstring for this function.") SelectionName;
		const TCollection_AsciiString & SelectionName ();
		%feature("autodoc", "Args:
	updateviewer(Standard_Boolean)=Standard_True

Returns:
	None

No detailed docstring for this function.") Terminate;
		void Terminate (const Standard_Boolean updateviewer = Standard_True);
		%feature("autodoc", "Args:
	aPrj(Handle_Select3D_Projector)

Returns:
	Standard_Boolean

compares the current projector of the localContext  
         with <aPrj>  
         returns True if the projectors are identical.  
         (no need to update projection of selection primitives  
         when closing the local context)....") HasSameProjector;
		Standard_Boolean HasSameProjector (const Handle_Select3D_Projector & aPrj);
		%feature("autodoc", "Args:
	anInteractive(Handle_AIS_InteractiveObject)
	DisplayMode(Standard_Integer)=0
	AllowShapeDecomposition(Standard_Boolean)=Standard_True
	ActivationMode(Standard_Integer)=0

Returns:
	Standard_Boolean

returns true if done...") Display;
		Standard_Boolean Display (const Handle_AIS_InteractiveObject & anInteractive,const Standard_Integer DisplayMode = 0,const Standard_Boolean AllowShapeDecomposition = Standard_True,const Standard_Integer ActivationMode = 0);
		%feature("autodoc", "Args:
	anInteractive(Handle_AIS_InteractiveObject)
	AllowShapeDecomposition(Standard_Boolean)=Standard_True
	ActivationMode(Standard_Integer)=0

Returns:
	Standard_Boolean

loads <anInteractive> with nodisplay...  
         returns true if done") Load;
		Standard_Boolean Load (const Handle_AIS_InteractiveObject & anInteractive,const Standard_Boolean AllowShapeDecomposition = Standard_True,const Standard_Integer ActivationMode = 0);
		%feature("autodoc", "Args:
	anInteractive(Handle_AIS_InteractiveObject)

Returns:
	Standard_Boolean

returns true if done...") Erase;
		Standard_Boolean Erase (const Handle_AIS_InteractiveObject & anInteractive);
		%feature("autodoc", "Args:
	aSelectable(Handle_AIS_InteractiveObject)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Remove;
		Standard_Boolean Remove (const Handle_AIS_InteractiveObject & aSelectable);
		%feature("autodoc", "Args:
	anInteractive(Handle_AIS_InteractiveObject)
	aMode(Standard_Integer)

Returns:
	Standard_Boolean

No detailed docstring for this function.") ClearPrs;
		Standard_Boolean ClearPrs (const Handle_AIS_InteractiveObject & anInteractive,const Standard_Integer aMode);
		%feature("autodoc", "Args:
	aStoredObject(Handle_AIS_InteractiveObject)
	aStatus(Standard_Boolean)

Returns:
	None

allows  or  forbids   the   shape  decomposition  into  
         Activated Standard   Mode  for   <aStoredObject>  
         does nothing if the object doesn't inherits  
         BasicShape from AIS") SetShapeDecomposition;
		void SetShapeDecomposition (const Handle_AIS_InteractiveObject & aStoredObject,const Standard_Boolean aStatus);
		%feature("autodoc", "Args:
	atype(AIS_ClearMode)=AIS_CM_All

Returns:
	None

according to <atype>  , clears the  different parts of  
         the selector (filters, modeof activation, objects...)") Clear;
		void Clear (const AIS_ClearMode atype = AIS_CM_All);
		%feature("autodoc", "Args:
	aSelectable(Handle_AIS_InteractiveObject)
	aMode(Standard_Integer)

Returns:
	None

optional : activation of a mode which is not 0 for a selectable...") ActivateMode;
		void ActivateMode (const Handle_AIS_InteractiveObject & aSelectable,const Standard_Integer aMode);
		%feature("autodoc", "Args:
	aSelectable(Handle_AIS_InteractiveObject)
	aMode(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") DeactivateMode;
		void DeactivateMode (const Handle_AIS_InteractiveObject & aSelectable,const Standard_Integer aMode);
		%feature("autodoc", "Args:
	aSelectable(Handle_AIS_InteractiveObject)

Returns:
	None

No detailed docstring for this function.") Deactivate;
		void Deactivate (const Handle_AIS_InteractiveObject & aSelectable);
		%feature("autodoc", "Args:
	aType(TopAbs_ShapeEnum)

Returns:
	None

decomposition of shapes into <aType>") ActivateStandardMode;
		void ActivateStandardMode (const TopAbs_ShapeEnum aType);
		%feature("autodoc", "Args:
	aType(TopAbs_ShapeEnum)

Returns:
	None

No detailed docstring for this function.") DeactivateStandardMode;
		void DeactivateStandardMode (const TopAbs_ShapeEnum aType);
		%feature("autodoc", "Args:
	None
Returns:
	TColStd_ListOfInteger

No detailed docstring for this function.") StandardModes;
		const TColStd_ListOfInteger & StandardModes ();
		%feature("autodoc", "Args:
	aFilter(Handle_SelectMgr_Filter)

Returns:
	None

No detailed docstring for this function.") AddFilter;
		void AddFilter (const Handle_SelectMgr_Filter & aFilter);
		%feature("autodoc", "Args:
	aFilter(Handle_SelectMgr_Filter)

Returns:
	None

No detailed docstring for this function.") RemoveFilter;
		void RemoveFilter (const Handle_SelectMgr_Filter & aFilter);
		%feature("autodoc", "Args:
	None
Returns:
	SelectMgr_ListOfFilter

No detailed docstring for this function.") ListOfFilter;
		const SelectMgr_ListOfFilter & ListOfFilter ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_SelectMgr_OrFilter

No detailed docstring for this function.") Filter;
		const Handle_SelectMgr_OrFilter & Filter ();
		%feature("autodoc", "Args:
	aStatus(Standard_Boolean)

Returns:
	None

if <aStatus> = True , the shapes or subshapes detected  
         by the selector will be automatically hilighted in the  
         main viewer.  
         Else the user has to manage the detected shape outside the  
         Shape Selector....") SetAutomaticHilight;
		void SetAutomaticHilight (const Standard_Boolean aStatus);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") AutomaticHilight;
		Standard_Boolean AutomaticHilight ();
		%feature("autodoc", "Args:
	Xpix(Standard_Integer)
	Ypix(Standard_Integer)
	aview(Handle_V3d_View)

Returns:
	AIS_StatusOfDetection

No detailed docstring for this function.") MoveTo;
		AIS_StatusOfDetection MoveTo (const Standard_Integer Xpix,const Standard_Integer Ypix,const Handle_V3d_View & aview);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

returns True if more than one entity  
         was detected at the last Mouse position.") HasNextDetected;
		Standard_Boolean HasNextDetected ();
		%feature("autodoc", "Args:
	aView(Handle_V3d_View)

Returns:
	Standard_Integer

returns True if  last detected. the next detected will  
         be first one (endless loop)") HilightNextDetected;
		Standard_Integer HilightNextDetected (const Handle_V3d_View & aView);
		%feature("autodoc", "Args:
	aView(Handle_V3d_View)

Returns:
	Standard_Integer

No detailed docstring for this function.") HilightPreviousDetected;
		Standard_Integer HilightPreviousDetected (const Handle_V3d_View & aView);
		%feature("autodoc", "Args:
	aView(Handle_V3d_View)

Returns:
	Standard_Boolean

returns True if something was done...") UnhilightLastDetected;
		Standard_Boolean UnhilightLastDetected (const Handle_V3d_View & aView);
		%feature("autodoc", "Args:
	updateviewer(Standard_Boolean)=Standard_True

Returns:
	AIS_StatusOfPick

returns the number of selected") Select;
		AIS_StatusOfPick Select (const Standard_Boolean updateviewer = Standard_True);
		%feature("autodoc", "Args:
	updateviewer(Standard_Boolean)=Standard_True

Returns:
	AIS_StatusOfPick

No detailed docstring for this function.") ShiftSelect;
		AIS_StatusOfPick ShiftSelect (const Standard_Boolean updateviewer = Standard_True);
		%feature("autodoc", "Args:
	XPMin(Standard_Integer)
	YPMin(Standard_Integer)
	XPMax(Standard_Integer)
	YPMax(Standard_Integer)
	aView(Handle_V3d_View)
	updateviewer(Standard_Boolean)=Standard_True

Returns:
	AIS_StatusOfPick

No detailed docstring for this function.") Select;
		AIS_StatusOfPick Select (const Standard_Integer XPMin,const Standard_Integer YPMin,const Standard_Integer XPMax,const Standard_Integer YPMax,const Handle_V3d_View & aView,const Standard_Boolean updateviewer = Standard_True);
		%feature("autodoc", "Args:
	XPMin(Standard_Integer)
	YPMin(Standard_Integer)
	XPMax(Standard_Integer)
	YPMax(Standard_Integer)
	aView(Handle_V3d_View)
	updateviewer(Standard_Boolean)=Standard_True

Returns:
	AIS_StatusOfPick

No detailed docstring for this function.") ShiftSelect;
		AIS_StatusOfPick ShiftSelect (const Standard_Integer XPMin,const Standard_Integer YPMin,const Standard_Integer XPMax,const Standard_Integer YPMax,const Handle_V3d_View & aView,const Standard_Boolean updateviewer = Standard_True);
		%feature("autodoc", "Args:
	Polyline(TColgp_Array1OfPnt2d)
	aView(Handle_V3d_View)
	updateviewer(Standard_Boolean)=Standard_True

Returns:
	AIS_StatusOfPick

No detailed docstring for this function.") Select;
		AIS_StatusOfPick Select (const TColgp_Array1OfPnt2d & Polyline,const Handle_V3d_View & aView,const Standard_Boolean updateviewer = Standard_True);
		%feature("autodoc", "Args:
	Polyline(TColgp_Array1OfPnt2d)
	aView(Handle_V3d_View)
	updateviewer(Standard_Boolean)=Standard_True

Returns:
	AIS_StatusOfPick

No detailed docstring for this function.") ShiftSelect;
		AIS_StatusOfPick ShiftSelect (const TColgp_Array1OfPnt2d & Polyline,const Handle_V3d_View & aView,const Standard_Boolean updateviewer = Standard_True);
		%feature("autodoc", "Args:
	updateviewer(Standard_Boolean)=Standard_True

Returns:
	None

No detailed docstring for this function.") HilightPicked;
		void HilightPicked (const Standard_Boolean updateviewer = Standard_True);
		%feature("autodoc", "Args:
	updateviewer(Standard_Boolean)=Standard_True

Returns:
	None

No detailed docstring for this function.") UnhilightPicked;
		void UnhilightPicked (const Standard_Boolean updateviewer = Standard_True);
		%feature("autodoc", "Args:
	updateviewer(Standard_Boolean)=Standard_True

Returns:
	None

No detailed docstring for this function.") UpdateSelected;
		void UpdateSelected (const Standard_Boolean updateviewer = Standard_True);
		%feature("autodoc", "Args:
	anobj(Handle_AIS_InteractiveObject)
	updateviewer(Standard_Boolean)=Standard_True

Returns:
	None

Part of advanced selection highlighting mechanism.  
         If no owners belonging to anobj are selected, calls anobj->ClearSelected(),  
         otherwise calls anobj->HilightSelected(). This method can be used to avoid  
         redrawing the whole selection belonging to several Selectable Objects.") UpdateSelected;
		void UpdateSelected (const Handle_AIS_InteractiveObject & anobj,const Standard_Boolean updateviewer = Standard_True);
		%feature("autodoc", "Args:
	anobj(Handle_AIS_InteractiveObject)
	updateviewer(Standard_Boolean)=Standard_True

Returns:
	None

useful  to  update selection with objects  coming from  
         Collector or stack") SetSelected;
		void SetSelected (const Handle_AIS_InteractiveObject & anobj,const Standard_Boolean updateviewer = Standard_True);
		%feature("autodoc", "Args:
	anobj(Handle_AIS_InteractiveObject)
	updateviewer(Standard_Boolean)=Standard_True

Returns:
	None

useful  to  update selection with objects  coming from  
         Collector or stack") AddOrRemoveSelected;
		void AddOrRemoveSelected (const Handle_AIS_InteractiveObject & anobj,const Standard_Boolean updateviewer = Standard_True);
		%feature("autodoc", "Args:
	aShape(TopoDS_Shape)
	updateviewer(Standard_Boolean)=Standard_True

Returns:
	None

No detailed docstring for this function.") AddOrRemoveSelected;
		void AddOrRemoveSelected (const TopoDS_Shape & aShape,const Standard_Boolean updateviewer = Standard_True);
		%feature("autodoc", "Args:
	Ownr(Handle_SelectMgr_EntityOwner)
	updateviewer(Standard_Boolean)=Standard_True

Returns:
	None

No detailed docstring for this function.") AddOrRemoveSelected;
		void AddOrRemoveSelected (const Handle_SelectMgr_EntityOwner & Ownr,const Standard_Boolean updateviewer = Standard_True);
		%feature("autodoc", "Args:
	updateviewer(Standard_Boolean)=Standard_True

Returns:
	None

No detailed docstring for this function.") ClearSelected;
		void ClearSelected (const Standard_Boolean updateviewer = Standard_True);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") HasDetected;
		Standard_Boolean HasDetected ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") InitDetected;
		void InitDetected ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") MoreDetected;
		Standard_Boolean MoreDetected ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") NextDetected;
		void NextDetected ();
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Shape

No detailed docstring for this function.") DetectedCurrentShape;
		const TopoDS_Shape & DetectedCurrentShape ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_AIS_InteractiveObject

No detailed docstring for this function.") DetectedCurrentObject;
		Handle_AIS_InteractiveObject DetectedCurrentObject ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") HasDetectedShape;
		Standard_Boolean HasDetectedShape ();
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Shape

No detailed docstring for this function.") DetectedShape;
		const TopoDS_Shape & DetectedShape ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_AIS_InteractiveObject

No detailed docstring for this function.") DetectedInteractive;
		Handle_AIS_InteractiveObject DetectedInteractive ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_SelectMgr_EntityOwner

No detailed docstring for this function.") DetectedOwner;
		Handle_SelectMgr_EntityOwner DetectedOwner ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") InitSelected;
		void InitSelected ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") MoreSelected;
		Standard_Boolean MoreSelected ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") NextSelected;
		void NextSelected ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

returns TRUE if the detected entity is a shape  
         coming from a Decomposition of an element.") HasShape;
		Standard_Boolean HasShape ();
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Shape

No detailed docstring for this function.") SelectedShape;
		const TopoDS_Shape & SelectedShape ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_SelectMgr_EntityOwner

No detailed docstring for this function.") SelectedOwner;
		Handle_SelectMgr_EntityOwner SelectedOwner ();
		%feature("autodoc", "Args:
	aniobj(Handle_AIS_InteractiveObject)

Returns:
	Standard_Boolean

No detailed docstring for this function.") IsSelected;
		Standard_Boolean IsSelected (const Handle_AIS_InteractiveObject & aniobj);
		%feature("autodoc", "Args:
	anOwner(Handle_SelectMgr_EntityOwner)

Returns:
	Standard_Boolean

No detailed docstring for this function.") IsSelected;
		Standard_Boolean IsSelected (const Handle_SelectMgr_EntityOwner & anOwner);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_AIS_InteractiveObject

No detailed docstring for this function.") SelectedInteractive;
		Handle_AIS_InteractiveObject SelectedInteractive ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

returns TRUE if an interactive element  
         was associated with the current picked entity.") HasApplicative;
		Standard_Boolean HasApplicative ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Standard_Transient

No detailed docstring for this function.") SelectedApplicative;
		const Handle_Standard_Transient & SelectedApplicative ();
		%feature("autodoc", "Args:
	anObject(Handle_AIS_InteractiveObject)
	Prior(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") SetDisplayPriority;
		void SetDisplayPriority (const Handle_AIS_InteractiveObject & anObject,const Standard_Integer Prior);
		%feature("autodoc", "Args:
	theIObj(Handle_AIS_InteractiveObject)
	theLayerId(Standard_Integer)

Returns:
	None

Set Z layer id for interactive object. The layer can be  
specified for displayed object only. The Z layers can be used to display  
temporarily presentations of some object in front of the other objects  
in the scene. The ids for Z layers are generated by V3d_Viewer.  
Note that Z layers differ from under-/overlayer in V3d_View:  
under-/overlayer are intended for specific 2D drawings that appear  
behind/in front of all 3D presentations, while SetZLayer() method  
applies to regular 3D presentations and does not imply any specific  
drawing methods.") SetZLayer;
		void SetZLayer (const Handle_AIS_InteractiveObject & theIObj,const Standard_Integer theLayerId);
		%feature("autodoc", "Args:
	theIObj(Handle_AIS_InteractiveObject)

Returns:
	Standard_Integer

Get Z layer id set for displayed interactive object.  
If the object doesn't exists in context or has no computed presentations,  
the method returns -1.") GetZLayer;
		Standard_Integer GetZLayer (const Handle_AIS_InteractiveObject & theIObj);
		%feature("autodoc", "Args:
	theMapToFill(TColStd_MapOfTransient)

Returns:
	Standard_Integer

No detailed docstring for this function.") DisplayedObjects;
		Standard_Integer DisplayedObjects (TColStd_MapOfTransient & theMapToFill);
		%feature("autodoc", "Args:
	anObject(Handle_AIS_InteractiveObject)

Returns:
	Standard_Boolean

No detailed docstring for this function.") IsIn;
		Standard_Boolean IsIn (const Handle_AIS_InteractiveObject & anObject);
		%feature("autodoc", "Args:
	anObject(Handle_AIS_InteractiveObject)

Returns:
	Standard_Boolean

No detailed docstring for this function.") IsDisplayed;
		Standard_Boolean IsDisplayed (const Handle_AIS_InteractiveObject & anObject);
		%feature("autodoc", "Args:
	anObject(Handle_AIS_InteractiveObject)
	aMode(Standard_Integer)

Returns:
	Standard_Boolean

No detailed docstring for this function.") IsDisplayed;
		Standard_Boolean IsDisplayed (const Handle_AIS_InteractiveObject & anObject,const Standard_Integer aMode);
		%feature("autodoc", "Args:
	anObject(Handle_AIS_InteractiveObject)

Returns:
	TColStd_ListOfInteger

No detailed docstring for this function.") SelectionModes;
		const TColStd_ListOfInteger & SelectionModes (const Handle_AIS_InteractiveObject & anObject);
		%feature("autodoc", "Args:
	anObject(Handle_AIS_InteractiveObject)

Returns:
	None

No detailed docstring for this function.") SubIntensityOn;
		void SubIntensityOn (const Handle_AIS_InteractiveObject & anObject);
		%feature("autodoc", "Args:
	anObject(Handle_AIS_InteractiveObject)

Returns:
	None

No detailed docstring for this function.") SubIntensityOff;
		void SubIntensityOff (const Handle_AIS_InteractiveObject & anObject);
		%feature("autodoc", "Args:
	anObject(Handle_AIS_InteractiveObject)

Returns:
	None

No detailed docstring for this function.") Hilight;
		void Hilight (const Handle_AIS_InteractiveObject & anObject);
		%feature("autodoc", "Args:
	anObject(Handle_AIS_InteractiveObject)
	aCol(Quantity_NameOfColor)

Returns:
	None

No detailed docstring for this function.") Hilight;
		void Hilight (const Handle_AIS_InteractiveObject & anObject,const Quantity_NameOfColor aCol);
		%feature("autodoc", "Args:
	anObject(Handle_AIS_InteractiveObject)

Returns:
	None

No detailed docstring for this function.") Unhilight;
		void Unhilight (const Handle_AIS_InteractiveObject & anObject);
		%feature("autodoc", "Args:
	anObject(Handle_AIS_InteractiveObject)

Returns:
	Standard_Boolean

No detailed docstring for this function.") IsHilighted;
		Standard_Boolean IsHilighted (const Handle_AIS_InteractiveObject & anObject);
		%feature("autodoc", "Args:
	anObject(Handle_AIS_InteractiveObject)
	WithColor(Standard_Boolean)
	HiCol(Quantity_NameOfColor)

Returns:
	Standard_Boolean

No detailed docstring for this function.") IsHilighted;
		Standard_Boolean IsHilighted (const Handle_AIS_InteractiveObject & anObject,Standard_Boolean & WithColor,Quantity_NameOfColor & HiCol);
		%feature("autodoc", "Args:
	aMode(StdSelect_SensitivityMode)

Returns:
	None

Sets the selection sensitivity mode. SM_WINDOW mode  
uses the specified pixel tolerance to compute the sensitivity  
value, SM_VIEW mode allows to define the sensitivity manually.") SetSensitivityMode;
		void SetSensitivityMode (const StdSelect_SensitivityMode aMode);
		%feature("autodoc", "Args:
	None
Returns:
	StdSelect_SensitivityMode

Returns the selection sensitivity mode.") SensitivityMode;
		StdSelect_SensitivityMode SensitivityMode ();
		%feature("autodoc", "Args:
	aPrecision(Standard_Real)

Returns:
	None

Define the current selection sensitivity for  
         this local context according to the view size.") SetSensitivity;
		void SetSensitivity (const Standard_Real aPrecision);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

Returns the selection sensitivity value.") Sensitivity;
		Standard_Real Sensitivity ();
		%feature("autodoc", "Args:
	aPrecision(Standard_Integer)=2

Returns:
	None

Define the current selection sensitivity for  
         this local context according to the view size.") SetPixelTolerance;
		void SetPixelTolerance (const Standard_Integer aPrecision = 2);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Returns the pixel tolerance.") PixelTolerance;
		Standard_Integer PixelTolerance ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

initializes the list of presentations to be displayed  
         returns False if No Local COnte") BeginImmediateDraw;
		Standard_Boolean BeginImmediateDraw ();
		%feature("autodoc", "Args:
	anIObj(Handle_AIS_InteractiveObject)
	aMode(Standard_Integer)=0

Returns:
	Standard_Boolean

returns True if <anIObj> has been stored in the list.") ImmediateAdd;
		Standard_Boolean ImmediateAdd (const Handle_AIS_InteractiveObject & anIObj,const Standard_Integer aMode = 0);
		%feature("autodoc", "Args:
	anIObj(Handle_AIS_InteractiveObject)
	aMode(Standard_Integer)=0

Returns:
	Standard_Boolean

returns True if <anIObj> has been removed from the list.") ImmediateRemove;
		Standard_Boolean ImmediateRemove (const Handle_AIS_InteractiveObject & anIObj,const Standard_Integer aMode = 0);
		%feature("autodoc", "Args:
	aView(Handle_V3d_View)
	DoubleBuf(Standard_Boolean)=Standard_False

Returns:
	Standard_Boolean

returns True if the immediate display has been done.") EndImmediateDraw;
		Standard_Boolean EndImmediateDraw (const Handle_V3d_View & aView,const Standard_Boolean DoubleBuf = Standard_False);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsImmediateModeOn;
		Standard_Boolean IsImmediateModeOn ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") UpdateConversion;
		void UpdateConversion ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") UpdateSort;
		void UpdateSort ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") LoadContextObjects;
		void LoadContextObjects ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") UnloadContextObjects;
		void UnloadContextObjects ();
		%feature("autodoc", "Args:
	aviou(Handle_V3d_View)

Returns:
	None

No detailed docstring for this function.") DisplayAreas;
		void DisplayAreas (const Handle_V3d_View & aviou);
		%feature("autodoc", "Args:
	aView(Handle_V3d_View)

Returns:
	None

No detailed docstring for this function.") ClearAreas;
		void ClearAreas (const Handle_V3d_View & aView);
		%feature("autodoc", "Args:
	aView(Handle_V3d_View)

Returns:
	None

No detailed docstring for this function.") DisplaySensitive;
		void DisplaySensitive (const Handle_V3d_View & aView);
		%feature("autodoc", "Args:
	aView(Handle_V3d_View)

Returns:
	None

No detailed docstring for this function.") ClearSensitive;
		void ClearSensitive (const Handle_V3d_View & aView);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_StdSelect_ViewerSelector3d

No detailed docstring for this function.") MainSelector;
		const Handle_StdSelect_ViewerSelector3d & MainSelector ();
		%feature("autodoc", "Args:
	anIObj(Handle_AIS_InteractiveObject)

Returns:
	Handle_SelectMgr_EntityOwner

No detailed docstring for this function.") FindSelectedOwnerFromIO;
		Handle_SelectMgr_EntityOwner FindSelectedOwnerFromIO (const Handle_AIS_InteractiveObject & anIObj);
		%feature("autodoc", "Args:
	aShape(TopoDS_Shape)

Returns:
	Handle_SelectMgr_EntityOwner

No detailed docstring for this function.") FindSelectedOwnerFromShape;
		Handle_SelectMgr_EntityOwner FindSelectedOwnerFromShape (const TopoDS_Shape & aShape);
};


%feature("shadow") AIS_LocalContext::~AIS_LocalContext %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend AIS_LocalContext {
	void _kill_pointed() {
		delete $self;
	}
};
%extend AIS_LocalContext {
	Handle_AIS_LocalContext GetHandle() {
	return *(Handle_AIS_LocalContext*) &$self;
	}
};

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
    AIS_LocalContext* GetObject() {
    return (AIS_LocalContext*)$self->Access();
    }
};
%feature("shadow") Handle_AIS_LocalContext::~Handle_AIS_LocalContext %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_AIS_LocalContext {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor AIS_LocalStatus;
class AIS_LocalStatus : public MMgt_TShared {
	public:
		%feature("autodoc", "Args:
	IsTemporary(Standard_Boolean)=Standard_True
	Decompose(Standard_Boolean)=Standard_False
	DisplayMode(Standard_Integer)=- 1
	SelectionMode(Standard_Integer)=- 1
	HilightMode(Standard_Integer)=0
	SubIntensity(Standard_Boolean)=0
	TheHiCol(Quantity_NameOfColor)=Quantity_NOC_WHITE

Returns:
	None

No detailed docstring for this function.") AIS_LocalStatus;
		 AIS_LocalStatus (const Standard_Boolean IsTemporary = Standard_True,const Standard_Boolean Decompose = Standard_False,const Standard_Integer DisplayMode = - 1,const Standard_Integer SelectionMode = - 1,const Standard_Integer HilightMode = 0,const Standard_Boolean SubIntensity = 0,const Quantity_NameOfColor TheHiCol = Quantity_NOC_WHITE);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") Decomposed;
		Standard_Boolean Decomposed ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsTemporary;
		Standard_Boolean IsTemporary ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") DisplayMode;
		Standard_Integer DisplayMode ();
		%feature("autodoc", "Args:
	None
Returns:
	TColStd_ListOfInteger

No detailed docstring for this function.") SelectionModes;
		const TColStd_ListOfInteger & SelectionModes ();
		%feature("autodoc", "Args:
	aSelMode(Standard_Integer)

Returns:
	Standard_Boolean

No detailed docstring for this function.") IsActivated;
		Standard_Boolean IsActivated (const Standard_Integer aSelMode);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") HilightMode;
		Standard_Integer HilightMode ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsSubIntensityOn;
		Standard_Boolean IsSubIntensityOn ();
		%feature("autodoc", "Args:
	None
Returns:
	Quantity_NameOfColor

No detailed docstring for this function.") HilightColor;
		Quantity_NameOfColor HilightColor ();
		%feature("autodoc", "Args:
	astatus(Standard_Boolean)

Returns:
	None

No detailed docstring for this function.") SetDecomposition;
		void SetDecomposition (const Standard_Boolean astatus);
		%feature("autodoc", "Args:
	astatus(Standard_Boolean)

Returns:
	None

No detailed docstring for this function.") SetTemporary;
		void SetTemporary (const Standard_Boolean astatus);
		%feature("autodoc", "Args:
	aMode(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") SetDisplayMode;
		void SetDisplayMode (const Standard_Integer aMode);
		%feature("autodoc", "Args:
	aStatus(Standard_Boolean)

Returns:
	None

No detailed docstring for this function.") SetFirstDisplay;
		void SetFirstDisplay (const Standard_Boolean aStatus);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsFirstDisplay;
		Standard_Boolean IsFirstDisplay ();
		%feature("autodoc", "Args:
	aMode(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") AddSelectionMode;
		void AddSelectionMode (const Standard_Integer aMode);
		%feature("autodoc", "Args:
	aMode(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") RemoveSelectionMode;
		void RemoveSelectionMode (const Standard_Integer aMode);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") ClearSelectionModes;
		void ClearSelectionModes ();
		%feature("autodoc", "Args:
	aMode(Standard_Integer)

Returns:
	Standard_Boolean

No detailed docstring for this function.") IsSelModeIn;
		Standard_Boolean IsSelModeIn (const Standard_Integer aMode);
		%feature("autodoc", "Args:
	aMode(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") SetHilightMode;
		void SetHilightMode (const Standard_Integer aMode);
		%feature("autodoc", "Args:
	aHiCol(Quantity_NameOfColor)

Returns:
	None

No detailed docstring for this function.") SetHilightColor;
		void SetHilightColor (const Quantity_NameOfColor aHiCol);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") SubIntensityOn;
		void SubIntensityOn ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") SubIntensityOff;
		void SubIntensityOff ();
		%feature("autodoc", "Args:
	aStatus(Handle_Standard_Transient)

Returns:
	None

No detailed docstring for this function.") SetPreviousState;
		void SetPreviousState (const Handle_Standard_Transient & aStatus);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Standard_Transient

No detailed docstring for this function.") PreviousState;
		const Handle_Standard_Transient & PreviousState ();
};


%feature("shadow") AIS_LocalStatus::~AIS_LocalStatus %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend AIS_LocalStatus {
	void _kill_pointed() {
		delete $self;
	}
};
%extend AIS_LocalStatus {
	Handle_AIS_LocalStatus GetHandle() {
	return *(Handle_AIS_LocalStatus*) &$self;
	}
};

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
    AIS_LocalStatus* GetObject() {
    return (AIS_LocalStatus*)$self->Access();
    }
};
%feature("shadow") Handle_AIS_LocalStatus::~Handle_AIS_LocalStatus %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_AIS_LocalStatus {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor AIS_MapIteratorOfMapOfInteractive;
class AIS_MapIteratorOfMapOfInteractive : public TCollection_BasicMapIterator {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") AIS_MapIteratorOfMapOfInteractive;
		 AIS_MapIteratorOfMapOfInteractive ();
		%feature("autodoc", "Args:
	aMap(AIS_MapOfInteractive)

Returns:
	None

No detailed docstring for this function.") AIS_MapIteratorOfMapOfInteractive;
		 AIS_MapIteratorOfMapOfInteractive (const AIS_MapOfInteractive & aMap);
		%feature("autodoc", "Args:
	aMap(AIS_MapOfInteractive)

Returns:
	None

No detailed docstring for this function.") Initialize;
		void Initialize (const AIS_MapOfInteractive & aMap);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_AIS_InteractiveObject

No detailed docstring for this function.") Key;
		const Handle_AIS_InteractiveObject & Key ();
};


%feature("shadow") AIS_MapIteratorOfMapOfInteractive::~AIS_MapIteratorOfMapOfInteractive %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend AIS_MapIteratorOfMapOfInteractive {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor AIS_MapOfInteractive;
class AIS_MapOfInteractive : public TCollection_BasicMap {
	public:
		%feature("autodoc", "Args:
	NbBuckets(Standard_Integer)=1

Returns:
	None

No detailed docstring for this function.") AIS_MapOfInteractive;
		 AIS_MapOfInteractive (const Standard_Integer NbBuckets = 1);
		%feature("autodoc", "Args:
	Other(AIS_MapOfInteractive)

Returns:
	AIS_MapOfInteractive

No detailed docstring for this function.") Assign;
		AIS_MapOfInteractive & Assign (const AIS_MapOfInteractive & Other);
		%feature("autodoc", "Args:
	Other(AIS_MapOfInteractive)

Returns:
	AIS_MapOfInteractive

No detailed docstring for this function.") operator=;
		AIS_MapOfInteractive & operator = (const AIS_MapOfInteractive & Other);
		%feature("autodoc", "Args:
	NbBuckets(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") ReSize;
		void ReSize (const Standard_Integer NbBuckets);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	aKey(Handle_AIS_InteractiveObject)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Add;
		Standard_Boolean Add (const Handle_AIS_InteractiveObject & aKey);
		%feature("autodoc", "Args:
	aKey(Handle_AIS_InteractiveObject)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Contains;
		Standard_Boolean Contains (const Handle_AIS_InteractiveObject & aKey);
		%feature("autodoc", "Args:
	aKey(Handle_AIS_InteractiveObject)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Remove;
		Standard_Boolean Remove (const Handle_AIS_InteractiveObject & aKey);
};


%feature("shadow") AIS_MapOfInteractive::~AIS_MapOfInteractive %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend AIS_MapOfInteractive {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor AIS_Selection;
class AIS_Selection : public MMgt_TShared {
	public:
		%feature("autodoc", "Args:
	aName(char *)

Returns:
	None

creates a new selection and make it current in the session.  
         the selection will be accessible later through its name  
         to make it again current.  
 
         Note that if a session has been created, a session with  
         the name  'default' is created.  
 
         In this case, the is always a current selection which  
         is the last one created  until SetCurrentSelection is used.  
 
         The class methods deals with the current selection.  
 
         Warning : Better Call AIS_Selection::CreateSelection.") AIS_Selection;
		 AIS_Selection (const char * aName);
		%feature("autodoc", "Args:
	aName(char *)

Returns:
	static void

No detailed docstring for this function.") Remove;
		static void Remove (const char * aName);
		%feature("autodoc", "Args:
	aName(char *)

Returns:
	static Standard_Boolean

returns True if a selection having this name exsits.") Find;
		static Standard_Boolean Find (const char * aName);
		%feature("autodoc", "Args:
	aName(char *)

Returns:
	static Standard_Boolean

calls the private constructor and puts the new Selection  
         in the list of existing selections.  
         returns False if the selection exists.") CreateSelection;
		static Standard_Boolean CreateSelection (const char * aName);
		%feature("autodoc", "Args:
	aName(char *)

Returns:
	static Handle_AIS_Selection

No detailed docstring for this function.") Selection;
		static Handle_AIS_Selection Selection (const char * aName);
		%feature("autodoc", "Args:
	aName(char *)

Returns:
	static Standard_Boolean

returns False if There is no selection of name <aName>") SetCurrentSelection;
		static Standard_Boolean SetCurrentSelection (const char * aName);
		%feature("autodoc", "Args:
	None
Returns:
	static Handle_AIS_Selection

No detailed docstring for this function.") CurrentSelection;
		static Handle_AIS_Selection CurrentSelection ();
		%feature("autodoc", "Args:
	None
Returns:
	static void

Clears selection.") ClearCurrentSelection;
		static void ClearCurrentSelection ();
		%feature("autodoc", "Args:
	None
Returns:
	static void

removes all the object of the currentselection.") Select;
		static void Select ();
		%feature("autodoc", "Args:
	anObject(Handle_Standard_Transient)

Returns:
	static AIS_SelectStatus

if the object is not yet in the current selection, it will be added.  
          if the object is already in the current selection, it will be removed.") Select;
		static AIS_SelectStatus Select (const Handle_Standard_Transient & anObject);
		%feature("autodoc", "Args:
	anObject(Handle_Standard_Transient)

Returns:
	static AIS_SelectStatus

the object is always add int the selection.  
          faster when the number of objects selected is great.") AddSelect;
		static AIS_SelectStatus AddSelect (const Handle_Standard_Transient & anObject);
		%feature("autodoc", "Args:
	anObject(Handle_Standard_Transient)

Returns:
	static void

clears the selection and adds the object in the selection.") ClearAndSelect;
		static void ClearAndSelect (const Handle_Standard_Transient & anObject);
		%feature("autodoc", "Args:
	anObject(Handle_Standard_Transient)

Returns:
	static Standard_Boolean

No detailed docstring for this function.") IsSelected;
		static Standard_Boolean IsSelected (const Handle_Standard_Transient & anObject);
		%feature("autodoc", "Args:
	None
Returns:
	static Standard_Integer

returns the number of objects selected.") Extent;
		static Standard_Integer Extent ();
		%feature("autodoc", "Args:
	None
Returns:
	static Handle_Standard_Transient

returns the single object selected.  
 Warning: raises TypeMismatch from Standard if Extent is not equal to 1.") Single;
		static Handle_Standard_Transient Single ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Init;
		void Init ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") More;
		Standard_Boolean More ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Next;
		void Next ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Standard_Transient

No detailed docstring for this function.") Value;
		const Handle_Standard_Transient & Value ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") NbStored;
		Standard_Integer NbStored ();
		%feature("autodoc", "Args:
	None
Returns:
	AIS_NListTransient

No detailed docstring for this function.") Objects;
		const AIS_NListTransient & Objects ();
		%feature("autodoc", "Args:
	aName(char *)

Returns:
	static Standard_Integer

No detailed docstring for this function.") Index;
		static Standard_Integer Index (const char * aName);
};


%feature("shadow") AIS_Selection::~AIS_Selection %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend AIS_Selection {
	void _kill_pointed() {
		delete $self;
	}
};
%extend AIS_Selection {
	Handle_AIS_Selection GetHandle() {
	return *(Handle_AIS_Selection*) &$self;
	}
};

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
    AIS_Selection* GetObject() {
    return (AIS_Selection*)$self->Access();
    }
};
%feature("shadow") Handle_AIS_Selection::~Handle_AIS_Selection %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_AIS_Selection {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor AIS_SequenceNodeOfSequenceOfDimension;
class AIS_SequenceNodeOfSequenceOfDimension : public TCollection_SeqNode {
	public:
		%feature("autodoc", "Args:
	I(Handle_AIS_Relation)
	n(TCollection_SeqNodePtr)
	p(TCollection_SeqNodePtr)

Returns:
	None

No detailed docstring for this function.") AIS_SequenceNodeOfSequenceOfDimension;
		 AIS_SequenceNodeOfSequenceOfDimension (const Handle_AIS_Relation & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_AIS_Relation

No detailed docstring for this function.") Value;
		Handle_AIS_Relation & Value ();
};


%feature("shadow") AIS_SequenceNodeOfSequenceOfDimension::~AIS_SequenceNodeOfSequenceOfDimension %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend AIS_SequenceNodeOfSequenceOfDimension {
	void _kill_pointed() {
		delete $self;
	}
};
%extend AIS_SequenceNodeOfSequenceOfDimension {
	Handle_AIS_SequenceNodeOfSequenceOfDimension GetHandle() {
	return *(Handle_AIS_SequenceNodeOfSequenceOfDimension*) &$self;
	}
};

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
    AIS_SequenceNodeOfSequenceOfDimension* GetObject() {
    return (AIS_SequenceNodeOfSequenceOfDimension*)$self->Access();
    }
};
%feature("shadow") Handle_AIS_SequenceNodeOfSequenceOfDimension::~Handle_AIS_SequenceNodeOfSequenceOfDimension %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_AIS_SequenceNodeOfSequenceOfDimension {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor AIS_SequenceNodeOfSequenceOfInteractive;
class AIS_SequenceNodeOfSequenceOfInteractive : public TCollection_SeqNode {
	public:
		%feature("autodoc", "Args:
	I(Handle_AIS_InteractiveObject)
	n(TCollection_SeqNodePtr)
	p(TCollection_SeqNodePtr)

Returns:
	None

No detailed docstring for this function.") AIS_SequenceNodeOfSequenceOfInteractive;
		 AIS_SequenceNodeOfSequenceOfInteractive (const Handle_AIS_InteractiveObject & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_AIS_InteractiveObject

No detailed docstring for this function.") Value;
		Handle_AIS_InteractiveObject & Value ();
};


%feature("shadow") AIS_SequenceNodeOfSequenceOfInteractive::~AIS_SequenceNodeOfSequenceOfInteractive %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend AIS_SequenceNodeOfSequenceOfInteractive {
	void _kill_pointed() {
		delete $self;
	}
};
%extend AIS_SequenceNodeOfSequenceOfInteractive {
	Handle_AIS_SequenceNodeOfSequenceOfInteractive GetHandle() {
	return *(Handle_AIS_SequenceNodeOfSequenceOfInteractive*) &$self;
	}
};

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
    AIS_SequenceNodeOfSequenceOfInteractive* GetObject() {
    return (AIS_SequenceNodeOfSequenceOfInteractive*)$self->Access();
    }
};
%feature("shadow") Handle_AIS_SequenceNodeOfSequenceOfInteractive::~Handle_AIS_SequenceNodeOfSequenceOfInteractive %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_AIS_SequenceNodeOfSequenceOfInteractive {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor AIS_SequenceOfDimension;
class AIS_SequenceOfDimension : public TCollection_BaseSequence {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") AIS_SequenceOfDimension;
		 AIS_SequenceOfDimension ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	Other(AIS_SequenceOfDimension)

Returns:
	AIS_SequenceOfDimension

No detailed docstring for this function.") Assign;
		const AIS_SequenceOfDimension & Assign (const AIS_SequenceOfDimension & Other);
		%feature("autodoc", "Args:
	Other(AIS_SequenceOfDimension)

Returns:
	AIS_SequenceOfDimension

No detailed docstring for this function.") operator=;
		const AIS_SequenceOfDimension & operator = (const AIS_SequenceOfDimension & Other);
		%feature("autodoc", "Args:
	T(Handle_AIS_Relation)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (const Handle_AIS_Relation & T);
		%feature("autodoc", "Args:
	S(AIS_SequenceOfDimension)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (AIS_SequenceOfDimension & S);
		%feature("autodoc", "Args:
	T(Handle_AIS_Relation)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (const Handle_AIS_Relation & T);
		%feature("autodoc", "Args:
	S(AIS_SequenceOfDimension)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (AIS_SequenceOfDimension & S);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	T(Handle_AIS_Relation)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const Handle_AIS_Relation & T);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	S(AIS_SequenceOfDimension)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer Index,AIS_SequenceOfDimension & S);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	T(Handle_AIS_Relation)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const Handle_AIS_Relation & T);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	S(AIS_SequenceOfDimension)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer Index,AIS_SequenceOfDimension & S);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_AIS_Relation

No detailed docstring for this function.") First;
		const Handle_AIS_Relation & First ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_AIS_Relation

No detailed docstring for this function.") Last;
		const Handle_AIS_Relation & Last ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	Sub(AIS_SequenceOfDimension)

Returns:
	None

No detailed docstring for this function.") Split;
		void Split (const Standard_Integer Index,AIS_SequenceOfDimension & Sub);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Handle_AIS_Relation

No detailed docstring for this function.") Value;
		const Handle_AIS_Relation & Value (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	I(Handle_AIS_Relation)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const Standard_Integer Index,const Handle_AIS_Relation & I);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Handle_AIS_Relation

No detailed docstring for this function.") ChangeValue;
		Handle_AIS_Relation & ChangeValue (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Remove;
		void Remove (const Standard_Integer Index);
		%feature("autodoc", "Args:
	FromIndex(Standard_Integer)
	ToIndex(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Remove;
		void Remove (const Standard_Integer FromIndex,const Standard_Integer ToIndex);
};


%feature("shadow") AIS_SequenceOfDimension::~AIS_SequenceOfDimension %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend AIS_SequenceOfDimension {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor AIS_SequenceOfInteractive;
class AIS_SequenceOfInteractive : public TCollection_BaseSequence {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") AIS_SequenceOfInteractive;
		 AIS_SequenceOfInteractive ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	Other(AIS_SequenceOfInteractive)

Returns:
	AIS_SequenceOfInteractive

No detailed docstring for this function.") Assign;
		const AIS_SequenceOfInteractive & Assign (const AIS_SequenceOfInteractive & Other);
		%feature("autodoc", "Args:
	Other(AIS_SequenceOfInteractive)

Returns:
	AIS_SequenceOfInteractive

No detailed docstring for this function.") operator=;
		const AIS_SequenceOfInteractive & operator = (const AIS_SequenceOfInteractive & Other);
		%feature("autodoc", "Args:
	T(Handle_AIS_InteractiveObject)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (const Handle_AIS_InteractiveObject & T);
		%feature("autodoc", "Args:
	S(AIS_SequenceOfInteractive)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (AIS_SequenceOfInteractive & S);
		%feature("autodoc", "Args:
	T(Handle_AIS_InteractiveObject)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (const Handle_AIS_InteractiveObject & T);
		%feature("autodoc", "Args:
	S(AIS_SequenceOfInteractive)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (AIS_SequenceOfInteractive & S);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	T(Handle_AIS_InteractiveObject)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const Handle_AIS_InteractiveObject & T);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	S(AIS_SequenceOfInteractive)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer Index,AIS_SequenceOfInteractive & S);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	T(Handle_AIS_InteractiveObject)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const Handle_AIS_InteractiveObject & T);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	S(AIS_SequenceOfInteractive)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer Index,AIS_SequenceOfInteractive & S);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_AIS_InteractiveObject

No detailed docstring for this function.") First;
		const Handle_AIS_InteractiveObject & First ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_AIS_InteractiveObject

No detailed docstring for this function.") Last;
		const Handle_AIS_InteractiveObject & Last ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	Sub(AIS_SequenceOfInteractive)

Returns:
	None

No detailed docstring for this function.") Split;
		void Split (const Standard_Integer Index,AIS_SequenceOfInteractive & Sub);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Handle_AIS_InteractiveObject

No detailed docstring for this function.") Value;
		const Handle_AIS_InteractiveObject & Value (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	I(Handle_AIS_InteractiveObject)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const Standard_Integer Index,const Handle_AIS_InteractiveObject & I);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Handle_AIS_InteractiveObject

No detailed docstring for this function.") ChangeValue;
		Handle_AIS_InteractiveObject & ChangeValue (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Remove;
		void Remove (const Standard_Integer Index);
		%feature("autodoc", "Args:
	FromIndex(Standard_Integer)
	ToIndex(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Remove;
		void Remove (const Standard_Integer FromIndex,const Standard_Integer ToIndex);
};


%feature("shadow") AIS_SequenceOfInteractive::~AIS_SequenceOfInteractive %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend AIS_SequenceOfInteractive {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor AIS_StdMapNodeOfMapOfInteractive;
class AIS_StdMapNodeOfMapOfInteractive : public TCollection_MapNode {
	public:
		%feature("autodoc", "Args:
	K(Handle_AIS_InteractiveObject)
	n(TCollection_MapNodePtr)

Returns:
	None

No detailed docstring for this function.") AIS_StdMapNodeOfMapOfInteractive;
		 AIS_StdMapNodeOfMapOfInteractive (const Handle_AIS_InteractiveObject & K,const TCollection_MapNodePtr & n);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_AIS_InteractiveObject

No detailed docstring for this function.") Key;
		Handle_AIS_InteractiveObject & Key ();
};


%feature("shadow") AIS_StdMapNodeOfMapOfInteractive::~AIS_StdMapNodeOfMapOfInteractive %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend AIS_StdMapNodeOfMapOfInteractive {
	void _kill_pointed() {
		delete $self;
	}
};
%extend AIS_StdMapNodeOfMapOfInteractive {
	Handle_AIS_StdMapNodeOfMapOfInteractive GetHandle() {
	return *(Handle_AIS_StdMapNodeOfMapOfInteractive*) &$self;
	}
};

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
    AIS_StdMapNodeOfMapOfInteractive* GetObject() {
    return (AIS_StdMapNodeOfMapOfInteractive*)$self->Access();
    }
};
%feature("shadow") Handle_AIS_StdMapNodeOfMapOfInteractive::~Handle_AIS_StdMapNodeOfMapOfInteractive %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_AIS_StdMapNodeOfMapOfInteractive {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor AIS_TypeFilter;
class AIS_TypeFilter : public SelectMgr_Filter {
	public:
		%feature("autodoc", "Args:
	aGivenKind(AIS_KindOfInteractive)

Returns:
	None

Initializes filter for type, aGivenKind.") AIS_TypeFilter;
		 AIS_TypeFilter (const AIS_KindOfInteractive aGivenKind);
		%feature("autodoc", "Args:
	anobj(Handle_SelectMgr_EntityOwner)

Returns:
	virtual Standard_Boolean

Returns False if the transient is not an Interactive  
Object, or if the type of the Interactive Object is not  
the same as that stored in the filter.") IsOk;
		virtual Standard_Boolean IsOk (const Handle_SelectMgr_EntityOwner & anobj);
};


%feature("shadow") AIS_TypeFilter::~AIS_TypeFilter %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend AIS_TypeFilter {
	void _kill_pointed() {
		delete $self;
	}
};
%extend AIS_TypeFilter {
	Handle_AIS_TypeFilter GetHandle() {
	return *(Handle_AIS_TypeFilter*) &$self;
	}
};

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
    AIS_TypeFilter* GetObject() {
    return (AIS_TypeFilter*)$self->Access();
    }
};
%feature("shadow") Handle_AIS_TypeFilter::~Handle_AIS_TypeFilter %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_AIS_TypeFilter {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor AIS_Axis;
class AIS_Axis : public AIS_InteractiveObject {
	public:
		%feature("autodoc", "Args:
	aComponent(Handle_Geom_Line)

Returns:
	None

Initializes the line aComponent") AIS_Axis;
		 AIS_Axis (const Handle_Geom_Line & aComponent);
		%feature("autodoc", "Args:
	aComponent(Handle_Geom_Axis2Placement)
	anAxisType(AIS_TypeOfAxis)

Returns:
	None

initializes the axis2 position  
  aComponent. The coordinate system used is right-handed.") AIS_Axis;
		 AIS_Axis (const Handle_Geom_Axis2Placement & aComponent,const AIS_TypeOfAxis anAxisType);
		%feature("autodoc", "Args:
	anAxis(Handle_Geom_Axis1Placement)

Returns:
	None

Initializes the axis1 position anAxis.") AIS_Axis;
		 AIS_Axis (const Handle_Geom_Axis1Placement & anAxis);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Geom_Line

Returns the axis entity aComponent and identifies it  
as a component of a shape.") Component;
		const Handle_Geom_Line & Component ();
		%feature("autodoc", "Args:
	aComponent(Handle_Geom_Line)

Returns:
	None

Sets the coordinates of the lin aComponent.") SetComponent;
		void SetComponent (const Handle_Geom_Line & aComponent);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Geom_Axis2Placement

Returns the position of axis2 and   positions it by  
identifying it as the x, y, or z axis and giving its  
direction in 3D space. The coordinate system used is right-handed.") Axis2Placement;
		const Handle_Geom_Axis2Placement & Axis2Placement ();
		%feature("autodoc", "Args:
	aComponent(Handle_Geom_Axis2Placement)
	anAxisType(AIS_TypeOfAxis)

Returns:
	None

Allows you to provide settings for aComponent:the  
position and direction of an axis in 3D space. The  
coordinate system used is right-handed.") SetAxis2Placement;
		void SetAxis2Placement (const Handle_Geom_Axis2Placement & aComponent,const AIS_TypeOfAxis anAxisType);
		%feature("autodoc", "Args:
	anAxis(Handle_Geom_Axis1Placement)

Returns:
	None

Constructs a new line to serve as the axis anAxis in 3D space.") SetAxis1Placement;
		void SetAxis1Placement (const Handle_Geom_Axis1Placement & anAxis);
		%feature("autodoc", "Args:
	None
Returns:
	AIS_TypeOfAxis

Returns the type of axis.") TypeOfAxis;
		AIS_TypeOfAxis TypeOfAxis ();
		%feature("autodoc", "Args:
	aTypeAxis(AIS_TypeOfAxis)

Returns:
	None

Constructs the entity aTypeAxis to stock information  
concerning type of axis.") SetTypeOfAxis;
		void SetTypeOfAxis (const AIS_TypeOfAxis aTypeAxis);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns a signature of 2 for axis datums. When you  
activate mode 2 by a signature, you pick AIS objects  
of type AIS_Axis.") IsXYZAxis;
		Standard_Boolean IsXYZAxis ();
		%feature("autodoc", "Args:
	aMode(Standard_Integer)

Returns:
	Standard_Boolean

Returns true if the interactive object accepts the display mode aMode.") AcceptDisplayMode;
		Standard_Boolean AcceptDisplayMode (const Standard_Integer aMode);
		%feature("autodoc", "Args:
	aProjector(Handle_Prs3d_Projector)
	aTrsf(Handle_Geom_Transformation)
	aPresentation(Handle_Prs3d_Presentation)

Returns:
	virtual void

computes the presentation according to a point of view  
         given by <aProjector>.  
         To be Used when the associated degenerated Presentations  
         have been transformed by <aTrsf> which is not a Pure  
         Translation. The HLR Prs can't be deducted automatically  
         WARNING :<aTrsf> must be applied  
          to the object to display before computation  !!!") Compute;
		virtual void Compute (const Handle_Prs3d_Projector & aProjector,const Handle_Geom_Transformation & aTrsf,const Handle_Prs3d_Presentation & aPresentation);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Signature;
		Standard_Integer Signature ();
		%feature("autodoc", "Args:
	None
Returns:
	AIS_KindOfInteractive

No detailed docstring for this function.") Type;
		AIS_KindOfInteractive Type ();
		%feature("autodoc", "Args:
	aColor(Quantity_NameOfColor)

Returns:
	None

No detailed docstring for this function.") SetColor;
		void SetColor (const Quantity_NameOfColor aColor);
		%feature("autodoc", "Args:
	aColor(Quantity_Color)

Returns:
	None

No detailed docstring for this function.") SetColor;
		void SetColor (const Quantity_Color & aColor);
		%feature("autodoc", "Args:
	aValue(Standard_Real)

Returns:
	None

No detailed docstring for this function.") SetWidth;
		void SetWidth (const Standard_Real aValue);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") UnsetColor;
		void UnsetColor ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") UnsetWidth;
		void UnsetWidth ();
};


%feature("shadow") AIS_Axis::~AIS_Axis %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend AIS_Axis {
	void _kill_pointed() {
		delete $self;
	}
};
%extend AIS_Axis {
	Handle_AIS_Axis GetHandle() {
	return *(Handle_AIS_Axis*) &$self;
	}
};

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
    AIS_Axis* GetObject() {
    return (AIS_Axis*)$self->Access();
    }
};
%feature("shadow") Handle_AIS_Axis::~Handle_AIS_Axis %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_AIS_Axis {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor AIS_Circle;
class AIS_Circle : public AIS_InteractiveObject {
	public:
		%feature("autodoc", "Args:
	aCircle(Handle_Geom_Circle)

Returns:
	None

Initializes this algorithm for constructing AIS circle  
datums initializes the circle aCircle") AIS_Circle;
		 AIS_Circle (const Handle_Geom_Circle & aCircle);
		%feature("autodoc", "Args:
	theCircle(Handle_Geom_Circle)
	theUStart(Standard_Real)
	theUEnd(Standard_Real)
	theIsFilledCircleSens(Standard_Boolean)=Standard_False

Returns:
	None

Initializes this algorithm for constructing AIS circle datums.  
Initializes the circle theCircle, the arc  
  starting point theUStart, the arc ending point theUEnd,  
  and the type of sensitivity theIsFilledCircleSens.") AIS_Circle;
		 AIS_Circle (const Handle_Geom_Circle & theCircle,const Standard_Real theUStart,const Standard_Real theUEnd,const Standard_Boolean theIsFilledCircleSens = Standard_False);
		%feature("autodoc", "Args:
	aProjector(Handle_Prs3d_Projector)
	aTrsf(Handle_Geom_Transformation)
	aPresentation(Handle_Prs3d_Presentation)

Returns:
	virtual void

computes the presentation according to a point of view  
         given by <aProjector>.  
         To be Used when the associated degenerated Presentations  
         have been transformed by <aTrsf> which is not a Pure  
         Translation. The HLR Prs can't be deducted automatically  
         WARNING :<aTrsf> must be applied  
          to the object to display before computation  !!!") Compute;
		virtual void Compute (const Handle_Prs3d_Projector & aProjector,const Handle_Geom_Transformation & aTrsf,const Handle_Prs3d_Presentation & aPresentation);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Returns index 6 by default.") Signature;
		Standard_Integer Signature ();
		%feature("autodoc", "Args:
	None
Returns:
	AIS_KindOfInteractive

Indicates that the type of Interactive Object is a datum.") Type;
		AIS_KindOfInteractive Type ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Geom_Circle

Returns the circle component defined in SetCircle.") Circle;
		const Handle_Geom_Circle & Circle ();
		%feature("autodoc", "Args:
	u1(Standard_Real)
	u2(Standard_Real)

Returns:
	None

Constructs instances of the starting point and the end  
point parameters, u1 and u2.") Parameters;
		void Parameters (Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	aCircle(Handle_Geom_Circle)

Returns:
	None

Allows you to provide settings for the circle datum aCircle.") SetCircle;
		void SetCircle (const Handle_Geom_Circle & aCircle);
		%feature("autodoc", "Args:
	u(Standard_Real)

Returns:
	None

Allows you to set the parameter u for the starting point of an arc.") SetFirstParam;
		void SetFirstParam (const Standard_Real u);
		%feature("autodoc", "Args:
	u(Standard_Real)

Returns:
	None

Allows you to provide the parameter u for the end point of an arc.") SetLastParam;
		void SetLastParam (const Standard_Real u);
		%feature("autodoc", "Args:
	aColor(Quantity_NameOfColor)

Returns:
	None

Assigns the color aColor to the solid line boundary of the circle datum.") SetColor;
		void SetColor (const Quantity_NameOfColor aColor);
		%feature("autodoc", "Args:
	aColor(Quantity_Color)

Returns:
	None

No detailed docstring for this function.") SetColor;
		void SetColor (const Quantity_Color & aColor);
		%feature("autodoc", "Args:
	aValue(Standard_Real)

Returns:
	None

Assigns the width aValue to the solid line boundary of the circle datum.") SetWidth;
		void SetWidth (const Standard_Real aValue);
		%feature("autodoc", "Args:
	None
Returns:
	None

Removes color from the solid line boundary of the circle datum.") UnsetColor;
		void UnsetColor ();
		%feature("autodoc", "Args:
	None
Returns:
	None

Removes width settings from the solid line boundary of the circle datum.") UnsetWidth;
		void UnsetWidth ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns the type of sensitivity for the circle;") IsFilledCircleSens;
		Standard_Boolean IsFilledCircleSens ();
		%feature("autodoc", "Args:
	theIsFilledCircleSens(Standard_Boolean)

Returns:
	None

Sets the type of sensitivity for the circle. If theIsFilledCircleSens set to Standard_True  
then the whole circle will be detectable, otherwise only the boundary of the circle.") SetFilledCircleSens;
		void SetFilledCircleSens (const Standard_Boolean theIsFilledCircleSens);
};


%feature("shadow") AIS_Circle::~AIS_Circle %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend AIS_Circle {
	void _kill_pointed() {
		delete $self;
	}
};
%extend AIS_Circle {
	Handle_AIS_Circle GetHandle() {
	return *(Handle_AIS_Circle*) &$self;
	}
};

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
    AIS_Circle* GetObject() {
    return (AIS_Circle*)$self->Access();
    }
};
%feature("shadow") Handle_AIS_Circle::~Handle_AIS_Circle %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_AIS_Circle {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor AIS_ConnectedInteractive;
class AIS_ConnectedInteractive : public AIS_InteractiveObject {
	public:
		%feature("autodoc", "Args:
	aTypeOfPresentation3d(PrsMgr_TypeOfPresentation3d)=PrsMgr_TOP_AllView

Returns:
	None

Disconnects the previous view and sets highlight  
mode to 0. This highlights the wireframe presentation  
aTypeOfPresentation3d.  
Top_AllView deactivates hidden line removal.") AIS_ConnectedInteractive;
		 AIS_ConnectedInteractive (const PrsMgr_TypeOfPresentation3d aTypeOfPresentation3d = PrsMgr_TOP_AllView);
		%feature("autodoc", "Args:
	None
Returns:
	virtual AIS_KindOfInteractive

Returns KOI_Object") Type;
		virtual AIS_KindOfInteractive Type ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual Standard_Integer

Returns 1") Signature;
		virtual Standard_Integer Signature ();
		%feature("autodoc", "Args:
	anotherIObj(Handle_AIS_InteractiveObject)

Returns:
	virtual void

Establishes the connection between the Connected  
Interactive Object, anotherIobj, and its reference  
entity. If a previous connection with an Interactive  
Object already exists, it is removed by Disconnect.  
The second syntax also initiates the location of the  
Connected Interactive Object.") Connect;
		virtual void Connect (const Handle_AIS_InteractiveObject & anotherIObj);
		%feature("autodoc", "Args:
	anotherIobj(Handle_AIS_InteractiveObject)
	aLocation(TopLoc_Location)

Returns:
	virtual void

No detailed docstring for this function.") Connect;
		virtual void Connect (const Handle_AIS_InteractiveObject & anotherIobj,const TopLoc_Location & aLocation);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns true if there is a connection established  
between the presentation and its source reference.") HasConnection;
		Standard_Boolean HasConnection ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_AIS_InteractiveObject

Returns the connection with the reference Interactive Object.") ConnectedTo;
		const Handle_AIS_InteractiveObject & ConnectedTo ();
		%feature("autodoc", "Args:
	None
Returns:
	None

Clears the connection with a source reference. The  
presentation will no longer be displayed.  
Warning Must be done before deleting the presentation.") Disconnect;
		void Disconnect ();
		%feature("autodoc", "Args:
	aProjector(Handle_Prs3d_Projector)
	aTrsf(Handle_Geom_Transformation)
	aPresentation(Handle_Prs3d_Presentation)

Returns:
	virtual void

Computes the presentation according to a point of view  
         given by <aProjector>.  
         To be Used when the associated degenerated Presentations  
         have been transformed by <aTrsf> which is not a Pure  
         Translation. The HLR Prs can't be deducted automatically  
         WARNING :<aTrsf> must be applied  
          to the object to display before computation  !!!") Compute;
		virtual void Compute (const Handle_Prs3d_Projector & aProjector,const Handle_Geom_Transformation & aTrsf,const Handle_Prs3d_Presentation & aPresentation);
		%feature("autodoc", "Args:
	aProjector(Handle_Prs3d_Projector)
	aPresentation(Handle_Prs3d_Presentation)

Returns:
	virtual void

No detailed docstring for this function.") Compute;
		virtual void Compute (const Handle_Prs3d_Projector & aProjector,const Handle_Prs3d_Presentation & aPresentation);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") AcceptShapeDecomposition;
		Standard_Boolean AcceptShapeDecomposition ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual void

No detailed docstring for this function.") UpdateLocation;
		virtual void UpdateLocation ();
		%feature("autodoc", "Args:
	aSel(Handle_SelectMgr_Selection)

Returns:
	virtual void

For this class, the  location effect is treated in the  
          compute   &     computeSelection  methods.  So     the  
       UpdateLocation Methods are redefined to do nothing else") UpdateLocation;
		virtual void UpdateLocation (const Handle_SelectMgr_Selection & aSel);
};


%feature("shadow") AIS_ConnectedInteractive::~AIS_ConnectedInteractive %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend AIS_ConnectedInteractive {
	void _kill_pointed() {
		delete $self;
	}
};
%extend AIS_ConnectedInteractive {
	Handle_AIS_ConnectedInteractive GetHandle() {
	return *(Handle_AIS_ConnectedInteractive*) &$self;
	}
};

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
    AIS_ConnectedInteractive* GetObject() {
    return (AIS_ConnectedInteractive*)$self->Access();
    }
};
%feature("shadow") Handle_AIS_ConnectedInteractive::~Handle_AIS_ConnectedInteractive %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_AIS_ConnectedInteractive {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor AIS_Dimension;
class AIS_Dimension : public AIS_InteractiveObject {
	public:
		%feature("autodoc", "Args:
	theType(AIS_KindOfDimension)

Returns:
	None

Constructor with default parameters values.
@param theType [in] the type of dimension.") AIS_Dimension;
		 AIS_Dimension (const AIS_KindOfDimension theType);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

Gets dimension measurement value. If the value to display is not
specified by user, then the dimension object is responsible to
compute it on its own in model space coordinates.
@return the dimension value (in model units) which is used
during display of the presentation.") GetValue;
		Standard_Real GetValue ();
		%feature("autodoc", "Args:
	theValue(Standard_Real)

Returns:
	None

Sets user-defined dimension value.
The user-defined dimension value is specified in model space,
and affect by unit conversion during the display.
@param theValue [in] the user-defined value to display.") SetCustomValue;
		void SetCustomValue (const Standard_Real theValue);
		%feature("autodoc", "Args:
	None
Returns:
	gp_Pln

Get the dimension plane in which the 2D dimension presentation is computed.
By default, if plane is not defined by user, it is computed automatically
after dimension geometry is computed.
If computed dimension geometry (points) can't be placed on the user-defined
plane, dimension geometry was set as invalid (validity flag is set to false)
and dimension presentation will not be computed.
If user-defined plane allow geometry placement on it, it will be used for
computing of the dimension presentation.
@return dimension plane used for presentation computing.") GetPlane;
		const gp_Pln & GetPlane ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Geometry type defines type of shapes on which the dimension is to be built. 
@return type of geometry on which the dimension will be built.") GetGeometryType;
		Standard_Integer GetGeometryType ();
		%feature("autodoc", "Args:
	thePlane(gp_Pln)

Returns:
	virtual void

Sets user-defined plane where the 2D dimension presentation will be placed.
Checks validity of this plane if geometry has been set already.
Validity of the plane is checked according to the geometry set
and has different criteria for different kinds of dimensions.") SetCustomPlane;
		virtual void SetCustomPlane (const gp_Pln & thePlane);
		%feature("autodoc", "Args:
	None
Returns:
	None

Unsets user-defined plane. Therefore the plane for dimension will be
computed automatically.") UnsetCustomPlane;
		void UnsetCustomPlane ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

@return TRUE if text position is set by user with method SetTextPosition().") IsTextPositionCustom;
		Standard_Boolean IsTextPositionCustom ();
		%feature("autodoc", "Args:
	&(gp_Pnt)

Returns:
	None

Fixes the absolute text position and adjusts flyout, plane and text alignment
according to it. Updates presentation if the text position is valid.
ATTENTION! It does not change vertical text alignment.
@param theTextPos [in] the point of text position.") SetTextPosition;
		void SetTextPosition (const gp_Pnt &);
		%feature("autodoc", "Args:
	None
Returns:
	gp_Pnt

Computes absolute text position from dimension parameters
(flyout, plane and text alignment).") GetTextPosition;
		const gp_Pnt GetTextPosition ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Prs3d_DimensionAspect

Gets the dimension aspect from AIS object drawer.
Dimension aspect contains aspects of line, text and arrows for dimension presentation.") DimensionAspect;
		Handle_Prs3d_DimensionAspect DimensionAspect ();
		%feature("autodoc", "Args:
	theDimensionAspect(Handle_Prs3d_DimensionAspect)

Returns:
	None

Sets new dimension aspect for the interactive object drawer.
The dimension aspect provides dynamic properties which are generally
used during computation of dimension presentations.") SetDimensionAspect;
		void SetDimensionAspect (const Handle_Prs3d_DimensionAspect & theDimensionAspect);
		%feature("autodoc", "Args:
	None
Returns:
	AIS_KindOfDimension

@return the kind of dimension.") KindOfDimension;
		AIS_KindOfDimension KindOfDimension ();
		%feature("autodoc", "Args:
	None
Returns:
	AIS_KindOfInteractive

@return the kind of interactive.") Type;
		AIS_KindOfInteractive Type ();
		%feature("autodoc", "Args:
	theMode(Standard_Integer)

Returns:
	Standard_Boolean

Returns true if the class of objects accepts the display mode theMode.
The interactive context can have a default mode of representation for
the set of Interactive Objects. This mode may not be accepted by object.") AcceptDisplayMode;
		Standard_Boolean AcceptDisplayMode (const Standard_Integer theMode);
		%feature("autodoc", "Args:
	None
Returns:
	AIS_DisplaySpecialSymbol

@return dimension special symbol display options.") DisplaySpecialSymbol;
		AIS_DisplaySpecialSymbol DisplaySpecialSymbol ();
		%feature("autodoc", "Args:
	theDisplaySpecSymbol(AIS_DisplaySpecialSymbol)

Returns:
	None

Specifies whether to display special symbol or not.") SetDisplaySpecialSymbol;
		void SetDisplaySpecialSymbol (const AIS_DisplaySpecialSymbol theDisplaySpecSymbol);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_ExtCharacter

@return special symbol.") SpecialSymbol;
		Standard_ExtCharacter SpecialSymbol ();
		%feature("autodoc", "Args:
	theSpecialSymbol(Standard_ExtCharacter)

Returns:
	None

Specifies special symbol.") SetSpecialSymbol;
		void SetSpecialSymbol (const Standard_ExtCharacter theSpecialSymbol);
		%feature("autodoc", "Args:
	None
Returns:
	virtual  TCollection_AsciiString

No detailed docstring for this function.") GetDisplayUnits;
		virtual const TCollection_AsciiString & GetDisplayUnits ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual  TCollection_AsciiString

No detailed docstring for this function.") GetModelUnits;
		virtual const TCollection_AsciiString & GetModelUnits ();
		%feature("autodoc", "Args:
	&(TCollection_AsciiString)

Returns:
	virtual void

No detailed docstring for this function.") SetDisplayUnits;
		virtual void SetDisplayUnits (const TCollection_AsciiString &);
		%feature("autodoc", "Args:
	&(TCollection_AsciiString)

Returns:
	virtual void

No detailed docstring for this function.") SetModelUnits;
		virtual void SetModelUnits (const TCollection_AsciiString &);
		%feature("autodoc", "Args:
	None
Returns:
	None

Unsets user defined text positioning and enables text positioning
 by other parameters: text alignment, extension size, flyout and custom plane.") UnsetFixedTextPosition;
		void UnsetFixedTextPosition ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

Returns selection tolerance for text2d:
For 2d text selection detection sensitive point with tolerance is used
Important! Only for 2d text.") SelToleranceForText2d;
		Standard_Real SelToleranceForText2d ();
		%feature("autodoc", "Args:
	theTol(Standard_Real)

Returns:
	None

Sets selection tolerance for text2d:
For 2d text selection detection sensitive point with tolerance is used
to change this tolerance use this method
Important! Only for 2d text.") SetSelToleranceForText2d;
		void SetSelToleranceForText2d (const Standard_Real theTol);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

@return flyout value for dimension.") GetFlyout;
		Standard_Real GetFlyout ();
		%feature("autodoc", "Args:
	theFlyout(Standard_Real)

Returns:
	None

Sets flyout value for dimension.") SetFlyout;
		void SetFlyout (const Standard_Real theFlyout);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Check that the input geometry for dimension is valid and the
presentation can be successfully computed.
@return TRUE if dimension geometry is ok.") IsValid;
		Standard_Boolean IsValid ();
};


%feature("shadow") AIS_Dimension::~AIS_Dimension %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend AIS_Dimension {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor AIS_Line;
class AIS_Line : public AIS_InteractiveObject {
	public:
		%feature("autodoc", "Args:
	aLine(Handle_Geom_Line)

Returns:
	None

Initializes the line aLine.") AIS_Line;
		 AIS_Line (const Handle_Geom_Line & aLine);
		%feature("autodoc", "Args:
	aStartPoint(Handle_Geom_Point)
	aEndPoint(Handle_Geom_Point)

Returns:
	None

Initializes a starting point aStartPoint  
  and a finishing point aEndPoint for the line.") AIS_Line;
		 AIS_Line (const Handle_Geom_Point & aStartPoint,const Handle_Geom_Point & aEndPoint);
		%feature("autodoc", "Args:
	aProjector(Handle_Prs3d_Projector)
	aTrsf(Handle_Geom_Transformation)
	aPresentation(Handle_Prs3d_Presentation)

Returns:
	virtual void

computes the presentation according to a point of view  
         given by <aProjector>.  
         To be Used when the associated degenerated Presentations  
         have been transformed by <aTrsf> which is not a Pure  
         Translation. The HLR Prs can't be deducted automatically  
         WARNING :<aTrsf> must be applied  
          to the object to display before computation  !!!") Compute;
		virtual void Compute (const Handle_Prs3d_Projector & aProjector,const Handle_Geom_Transformation & aTrsf,const Handle_Prs3d_Presentation & aPresentation);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Returns the signature 5.") Signature;
		Standard_Integer Signature ();
		%feature("autodoc", "Args:
	None
Returns:
	AIS_KindOfInteractive

Returns the type Datum.") Type;
		AIS_KindOfInteractive Type ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Geom_Line

Constructs an infinite line.") Line;
		const Handle_Geom_Line & Line ();
		%feature("autodoc", "Args:
	PStart(Handle_Geom_Point)
	PEnd(Handle_Geom_Point)

Returns:
	None

Returns the starting point PStart and the end point  
PEnd of the line set by SetPoints.") Points;
		void Points (Handle_Geom_Point & PStart,Handle_Geom_Point & PEnd);
		%feature("autodoc", "Args:
	L(Handle_Geom_Line)

Returns:
	None

instantiates an infinite line.") SetLine;
		void SetLine (const Handle_Geom_Line & L);
		%feature("autodoc", "Args:
	P1(Handle_Geom_Point)
	P2(Handle_Geom_Point)

Returns:
	None

Sets the starting point P1 and ending point P2 of the  
infinite line to create a finite line segment.") SetPoints;
		void SetPoints (const Handle_Geom_Point & P1,const Handle_Geom_Point & P2);
		%feature("autodoc", "Args:
	aColor(Quantity_NameOfColor)

Returns:
	None

Provides a new color setting aColor for the line in the  
drawing tool, or 'Drawer'.") SetColor;
		void SetColor (const Quantity_NameOfColor aColor);
		%feature("autodoc", "Args:
	aColor(Quantity_Color)

Returns:
	None

No detailed docstring for this function.") SetColor;
		void SetColor (const Quantity_Color & aColor);
		%feature("autodoc", "Args:
	aValue(Standard_Real)

Returns:
	None

Provides the new width setting aValue for the line in  
the drawing tool, or 'Drawer'.") SetWidth;
		void SetWidth (const Standard_Real aValue);
		%feature("autodoc", "Args:
	None
Returns:
	None

Removes the color setting and returns the original color.") UnsetColor;
		void UnsetColor ();
		%feature("autodoc", "Args:
	None
Returns:
	None

Removes the width setting and returns the original width.") UnsetWidth;
		void UnsetWidth ();
};


%feature("shadow") AIS_Line::~AIS_Line %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend AIS_Line {
	void _kill_pointed() {
		delete $self;
	}
};
%extend AIS_Line {
	Handle_AIS_Line GetHandle() {
	return *(Handle_AIS_Line*) &$self;
	}
};

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
    AIS_Line* GetObject() {
    return (AIS_Line*)$self->Access();
    }
};
%feature("shadow") Handle_AIS_Line::~Handle_AIS_Line %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_AIS_Line {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor AIS_MultipleConnectedInteractive;
class AIS_MultipleConnectedInteractive : public AIS_InteractiveObject {
	public:
		%feature("autodoc", "Args:
	aTypeOfPresentation3d(PrsMgr_TypeOfPresentation3d)=PrsMgr_TOP_AllView

Returns:
	None

Initializes the Interactive Object with multiple  
presentation connections. If aTypeOfPresentation3d  
does not have the affectation PrsMgr_TOP_AllView,  
it is projector dependent.") AIS_MultipleConnectedInteractive;
		 AIS_MultipleConnectedInteractive (const PrsMgr_TypeOfPresentation3d aTypeOfPresentation3d = PrsMgr_TOP_AllView);
		%feature("autodoc", "Args:
	anotherIObj(Handle_AIS_InteractiveObject)

Returns:
	None

Add anotherIObj in the presentation of me") Connect;
		void Connect (const Handle_AIS_InteractiveObject & anotherIObj);
		%feature("autodoc", "Args:
	None
Returns:
	virtual AIS_KindOfInteractive

No detailed docstring for this function.") Type;
		virtual AIS_KindOfInteractive Type ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual Standard_Integer

No detailed docstring for this function.") Signature;
		virtual Standard_Integer Signature ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns true if the object is connected to others.") HasConnection;
		Standard_Boolean HasConnection ();
		%feature("autodoc", "Args:
	None
Returns:
	AIS_SequenceOfInteractive

Returns the connection references of the previous  
Interactive Objects in view.") ConnectedTo;
		const AIS_SequenceOfInteractive & ConnectedTo ();
		%feature("autodoc", "Args:
	anotherIObj(Handle_AIS_InteractiveObject)

Returns:
	None

Removes the connection anotherIObj to an entity.") Disconnect;
		void Disconnect (const Handle_AIS_InteractiveObject & anotherIObj);
		%feature("autodoc", "Args:
	None
Returns:
	None

Clears all the connections to objects.") DisconnectAll;
		void DisconnectAll ();
		%feature("autodoc", "Args:
	aProjector(Handle_Prs3d_Projector)
	aTrsf(Handle_Geom_Transformation)
	aPresentation(Handle_Prs3d_Presentation)

Returns:
	virtual void

computes the presentation according to a point of view  
         given by <aProjector>.  
         To be Used when the associated degenerated Presentations  
         have been transformed by <aTrsf> which is not a Pure  
         Translation. The HLR Prs can't be deducted automatically  
         WARNING :<aTrsf> must be applied  
          to the object to display before computation  !!!") Compute;
		virtual void Compute (const Handle_Prs3d_Projector & aProjector,const Handle_Geom_Transformation & aTrsf,const Handle_Prs3d_Presentation & aPresentation);
		%feature("autodoc", "Args:
	aProjector(Handle_Prs3d_Projector)
	aPresentation(Handle_Prs3d_Presentation)

Returns:
	virtual void

No detailed docstring for this function.") Compute;
		virtual void Compute (const Handle_Prs3d_Projector & aProjector,const Handle_Prs3d_Presentation & aPresentation);
};


%feature("shadow") AIS_MultipleConnectedInteractive::~AIS_MultipleConnectedInteractive %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend AIS_MultipleConnectedInteractive {
	void _kill_pointed() {
		delete $self;
	}
};
%extend AIS_MultipleConnectedInteractive {
	Handle_AIS_MultipleConnectedInteractive GetHandle() {
	return *(Handle_AIS_MultipleConnectedInteractive*) &$self;
	}
};

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
    AIS_MultipleConnectedInteractive* GetObject() {
    return (AIS_MultipleConnectedInteractive*)$self->Access();
    }
};
%feature("shadow") Handle_AIS_MultipleConnectedInteractive::~Handle_AIS_MultipleConnectedInteractive %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_AIS_MultipleConnectedInteractive {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor AIS_Plane;
class AIS_Plane : public AIS_InteractiveObject {
	public:
		%feature("autodoc", "Args:
	aComponent(Handle_Geom_Plane)
	aCurrentMode(Standard_Boolean)=Standard_False

Returns:
	None

initializes the plane aComponent. If  
  the mode aCurrentMode equals true, the drawing  
  tool, 'Drawer' is not initialized.") AIS_Plane;
		 AIS_Plane (const Handle_Geom_Plane & aComponent,const Standard_Boolean aCurrentMode = Standard_False);
		%feature("autodoc", "Args:
	aComponent(Handle_Geom_Plane)
	aCenter(gp_Pnt)
	aCurrentMode(Standard_Boolean)=Standard_False

Returns:
	None

initializes the plane aComponent and  
  the point aCenter. If the mode aCurrentMode  
  equals true, the drawing tool, 'Drawer' is not  
  initialized. aCurrentMode equals true, the drawing  
  tool, 'Drawer' is not initialized.") AIS_Plane;
		 AIS_Plane (const Handle_Geom_Plane & aComponent,const gp_Pnt & aCenter,const Standard_Boolean aCurrentMode = Standard_False);
		%feature("autodoc", "Args:
	aComponent(Handle_Geom_Plane)
	aCenter(gp_Pnt)
	aPmin(gp_Pnt)
	aPmax(gp_Pnt)
	aCurrentMode(Standard_Boolean)=Standard_False

Returns:
	None

initializes the plane aComponent, the  
  point aCenter, and the minimum and maximum  
  points, aPmin and aPmax. If the mode  
aCurrentMode equals true, the drawing tool, 'Drawer' is not initialized.") AIS_Plane;
		 AIS_Plane (const Handle_Geom_Plane & aComponent,const gp_Pnt & aCenter,const gp_Pnt & aPmin,const gp_Pnt & aPmax,const Standard_Boolean aCurrentMode = Standard_False);
		%feature("autodoc", "Args:
	aComponent(Handle_Geom_Axis2Placement)
	aPlaneType(AIS_TypeOfPlane)
	aCurrentMode(Standard_Boolean)=Standard_False

Returns:
	None

No detailed docstring for this function.") AIS_Plane;
		 AIS_Plane (const Handle_Geom_Axis2Placement & aComponent,const AIS_TypeOfPlane aPlaneType,const Standard_Boolean aCurrentMode = Standard_False);
		%feature("autodoc", "Args:
	aValue(Standard_Real)

Returns:
	None

Same value for x and y directions") SetSize;
		void SetSize (const Standard_Real aValue);
		%feature("autodoc", "Args:
	Xval(Standard_Real)
	YVal(Standard_Real)

Returns:
	None

Sets the size defined by the length along the X axis  
XVal and the length along the Y axis YVal.") SetSize;
		void SetSize (const Standard_Real Xval,const Standard_Real YVal);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") UnsetSize;
		void UnsetSize ();
		%feature("autodoc", "Args:
	X(Standard_Real)
	Y(Standard_Real)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Size;
		Standard_Boolean Size (Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") HasOwnSize;
		Standard_Boolean HasOwnSize ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual Standard_Integer

No detailed docstring for this function.") Signature;
		virtual Standard_Integer Signature ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual AIS_KindOfInteractive

No detailed docstring for this function.") Type;
		virtual AIS_KindOfInteractive Type ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Geom_Plane

Returns the component specified in SetComponent.") Component;
		const Handle_Geom_Plane & Component ();
		%feature("autodoc", "Args:
	aComponent(Handle_Geom_Plane)

Returns:
	None

Creates an instance of the plane aComponent.") SetComponent;
		void SetComponent (const Handle_Geom_Plane & aComponent);
		%feature("autodoc", "Args:
	aComponent(Handle_Geom_Plane)
	aCenter(gp_Pnt)
	aPmin(gp_Pnt)
	aPmax(gp_Pnt)

Returns:
	Standard_Boolean

Returns the settings for the selected plane  
aComponent, provided in SetPlaneAttributes.  
These include the points aCenter, aPmin, and aPmax") PlaneAttributes;
		Standard_Boolean PlaneAttributes (Handle_Geom_Plane & aComponent,gp_Pnt & aCenter,gp_Pnt & aPmin,gp_Pnt & aPmax);
		%feature("autodoc", "Args:
	aComponent(Handle_Geom_Plane)
	aCenter(gp_Pnt)
	aPmin(gp_Pnt)
	aPmax(gp_Pnt)

Returns:
	None

Allows you to provide settings other than default ones  
for the selected plane. These include: center point  
aCenter, maximum aPmax and minimum aPmin.") SetPlaneAttributes;
		void SetPlaneAttributes (const Handle_Geom_Plane & aComponent,const gp_Pnt & aCenter,const gp_Pnt & aPmin,const gp_Pnt & aPmax);
		%feature("autodoc", "Args:
	None
Returns:
	gp_Pnt

Returns the coordinates of the center point.") Center;
		const gp_Pnt & Center ();
		%feature("autodoc", "Args:
	aCenter(gp_Pnt)

Returns:
	None

Provides settings for the center aCenter other than (0, 0, 0).") SetCenter;
		void SetCenter (const gp_Pnt & aCenter);
		%feature("autodoc", "Args:
	aComponent(Handle_Geom_Axis2Placement)
	aPlaneType(AIS_TypeOfPlane)

Returns:
	None

Allows you to provide settings for the position and  
direction of one of the plane's axes, aComponent, in  
3D space. The coordinate system used is  
right-handed, and the type of plane aPlaneType is one of:  
-   AIS_ TOPL_Unknown  
-   AIS_ TOPL_XYPlane  
-   AIS_ TOPL_XZPlane  
-   AIS_ TOPL_YZPlane}.") SetAxis2Placement;
		void SetAxis2Placement (const Handle_Geom_Axis2Placement & aComponent,const AIS_TypeOfPlane aPlaneType);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Geom_Axis2Placement

Returns the position of the plane's axis2 system  
identifying the x, y, or z axis and giving the plane a  
direction in 3D space. An axis2 system is a right-handed coordinate system.") Axis2Placement;
		Handle_Geom_Axis2Placement Axis2Placement ();
		%feature("autodoc", "Args:
	None
Returns:
	AIS_TypeOfPlane

Returns the type of plane - xy, yz, xz or unknown.") TypeOfPlane;
		AIS_TypeOfPlane TypeOfPlane ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns the type of plane - xy, yz, or xz.") IsXYZPlane;
		Standard_Boolean IsXYZPlane ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns the non-default current display mode set by SetCurrentMode.") CurrentMode;
		Standard_Boolean CurrentMode ();
		%feature("autodoc", "Args:
	aCurrentMode(Standard_Boolean)

Returns:
	None

Allows you to provide settings for a non-default  
current display mode.") SetCurrentMode;
		void SetCurrentMode (const Standard_Boolean aCurrentMode);
		%feature("autodoc", "Args:
	aMode(Standard_Integer)

Returns:
	virtual Standard_Boolean

Returns true if the display mode selected, aMode, is valid for planes.") AcceptDisplayMode;
		virtual Standard_Boolean AcceptDisplayMode (const Standard_Integer aMode);
		%feature("autodoc", "Args:
	aCtx(Handle_AIS_InteractiveContext)

Returns:
	virtual void

connection to <aCtx> default drawer implies a recomputation of Frame values.") SetContext;
		virtual void SetContext (const Handle_AIS_InteractiveContext & aCtx);
		%feature("autodoc", "Args:
	None
Returns:
	Select3D_TypeOfSensitivity

Returns the type of sensitivity for the plane;") TypeOfSensitivity;
		Select3D_TypeOfSensitivity TypeOfSensitivity ();
		%feature("autodoc", "Args:
	theTypeOfSensitivity(Select3D_TypeOfSensitivity)

Returns:
	None

Sets the type of sensitivity for the plane.") SetTypeOfSensitivity;
		void SetTypeOfSensitivity (const Select3D_TypeOfSensitivity theTypeOfSensitivity);
		%feature("autodoc", "Args:
	aProjector(Handle_Prs3d_Projector)
	aTrsf(Handle_Geom_Transformation)
	aPresentation(Handle_Prs3d_Presentation)

Returns:
	virtual void

computes the presentation according to a point of view  
         given by <aProjector>.  
         To be Used when the associated degenerated Presentations  
         have been transformed by <aTrsf> which is not a Pure  
         Translation. The HLR Prs can't be deducted automatically  
         WARNING :<aTrsf> must be applied  
          to the object to display before computation  !!!") Compute;
		virtual void Compute (const Handle_Prs3d_Projector & aProjector,const Handle_Geom_Transformation & aTrsf,const Handle_Prs3d_Presentation & aPresentation);
		%feature("autodoc", "Args:
	theSelection(Handle_SelectMgr_Selection)
	theMode(Standard_Integer)

Returns:
	virtual void

No detailed docstring for this function.") ComputeSelection;
		virtual void ComputeSelection (const Handle_SelectMgr_Selection & theSelection,const Standard_Integer theMode);
		%feature("autodoc", "Args:
	aColor(Quantity_NameOfColor)

Returns:
	None

No detailed docstring for this function.") SetColor;
		void SetColor (const Quantity_NameOfColor aColor);
		%feature("autodoc", "Args:
	aColor(Quantity_Color)

Returns:
	None

No detailed docstring for this function.") SetColor;
		void SetColor (const Quantity_Color & aColor);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") UnsetColor;
		void UnsetColor ();
};


%feature("shadow") AIS_Plane::~AIS_Plane %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend AIS_Plane {
	void _kill_pointed() {
		delete $self;
	}
};
%extend AIS_Plane {
	Handle_AIS_Plane GetHandle() {
	return *(Handle_AIS_Plane*) &$self;
	}
};

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
    AIS_Plane* GetObject() {
    return (AIS_Plane*)$self->Access();
    }
};
%feature("shadow") Handle_AIS_Plane::~Handle_AIS_Plane %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_AIS_Plane {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor AIS_PlaneTrihedron;
class AIS_PlaneTrihedron : public AIS_InteractiveObject {
	public:
		%feature("autodoc", "Args:
	aPlane(Handle_Geom_Plane)

Returns:
	None

Initializes the plane aPlane. The plane trihedron is  
 constructed from this and an axis.") AIS_PlaneTrihedron;
		 AIS_PlaneTrihedron (const Handle_Geom_Plane & aPlane);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Geom_Plane

Returns the component specified in SetComponent.") Component;
		Handle_Geom_Plane Component ();
		%feature("autodoc", "Args:
	aPlane(Handle_Geom_Plane)

Returns:
	None

Creates an instance of the component object aPlane.") SetComponent;
		void SetComponent (const Handle_Geom_Plane & aPlane);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_AIS_Line

Returns the 'XAxis'.") XAxis;
		Handle_AIS_Line XAxis ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_AIS_Line

Returns the 'YAxis'.") YAxis;
		Handle_AIS_Line YAxis ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_AIS_Point

Returns the point of origin of the plane trihedron.") Position;
		Handle_AIS_Point Position ();
		%feature("autodoc", "Args:
	theLength(Standard_Real)

Returns:
	None

Sets the length of the X and Y axes.") SetLength;
		void SetLength (const Standard_Real theLength);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

Returns the length of X and Y axes.") GetLength;
		Standard_Real GetLength ();
		%feature("autodoc", "Args:
	aMode(Standard_Integer)

Returns:
	Standard_Boolean

Returns true if the display mode selected, aMode, is valid.") AcceptDisplayMode;
		Standard_Boolean AcceptDisplayMode (const Standard_Integer aMode);
		%feature("autodoc", "Args:
	aProjector(Handle_Prs3d_Projector)
	aTrsf(Handle_Geom_Transformation)
	aPresentation(Handle_Prs3d_Presentation)

Returns:
	virtual void

computes the presentation according to a point of view  
         given by <aProjector>.  
         To be Used when the associated degenerated Presentations  
         have been transformed by <aTrsf> which is not a Pure  
         Translation. The HLR Prs can't be deducted automatically  
         WARNING :<aTrsf> must be applied  
          to the object to display before computation  !!!") Compute;
		virtual void Compute (const Handle_Prs3d_Projector & aProjector,const Handle_Geom_Transformation & aTrsf,const Handle_Prs3d_Presentation & aPresentation);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Signature;
		Standard_Integer Signature ();
		%feature("autodoc", "Args:
	None
Returns:
	AIS_KindOfInteractive

Returns datum as the type of Interactive Object.") Type;
		AIS_KindOfInteractive Type ();
		%feature("autodoc", "Args:
	aColor(Quantity_NameOfColor)

Returns:
	None

Allows you to provide settings for the color aColor.") SetColor;
		void SetColor (const Quantity_NameOfColor aColor);
		%feature("autodoc", "Args:
	aColor(Quantity_Color)

Returns:
	None

No detailed docstring for this function.") SetColor;
		void SetColor (const Quantity_Color & aColor);
		%feature("autodoc", "Args:
	aLabel(TCollection_AsciiString)

Returns:
	None

No detailed docstring for this function.") SetXLabel;
		void SetXLabel (const TCollection_AsciiString & aLabel);
		%feature("autodoc", "Args:
	aLabel(TCollection_AsciiString)

Returns:
	None

No detailed docstring for this function.") SetYLabel;
		void SetYLabel (const TCollection_AsciiString & aLabel);
};


%feature("shadow") AIS_PlaneTrihedron::~AIS_PlaneTrihedron %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend AIS_PlaneTrihedron {
	void _kill_pointed() {
		delete $self;
	}
};
%extend AIS_PlaneTrihedron {
	Handle_AIS_PlaneTrihedron GetHandle() {
	return *(Handle_AIS_PlaneTrihedron*) &$self;
	}
};

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
    AIS_PlaneTrihedron* GetObject() {
    return (AIS_PlaneTrihedron*)$self->Access();
    }
};
%feature("shadow") Handle_AIS_PlaneTrihedron::~Handle_AIS_PlaneTrihedron %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_AIS_PlaneTrihedron {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor AIS_Point;
class AIS_Point : public AIS_InteractiveObject {
	public:
		%feature("autodoc", "Args:
	aComponent(Handle_Geom_Point)

Returns:
	None

Initializes the point aComponent from which the point  
datum will be built.") AIS_Point;
		 AIS_Point (const Handle_Geom_Point & aComponent);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Returns index 1, the default index for a point.") Signature;
		Standard_Integer Signature ();
		%feature("autodoc", "Args:
	None
Returns:
	AIS_KindOfInteractive

Indicates that a point is a datum.") Type;
		AIS_KindOfInteractive Type ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Geom_Point

Returns the component specified in SetComponent.") Component;
		Handle_Geom_Point Component ();
		%feature("autodoc", "Args:
	aComponent(Handle_Geom_Point)

Returns:
	None

Constructs an instance of the point aComponent.") SetComponent;
		void SetComponent (const Handle_Geom_Point & aComponent);
		%feature("autodoc", "Args:
	aMode(Standard_Integer)

Returns:
	Standard_Boolean

Returns true if the display mode selected is valid for point datums.") AcceptDisplayMode;
		Standard_Boolean AcceptDisplayMode (const Standard_Integer aMode);
		%feature("autodoc", "Args:
	aProjector(Handle_Prs3d_Projector)
	aTrsf(Handle_Geom_Transformation)
	aPresentation(Handle_Prs3d_Presentation)

Returns:
	virtual void

computes the presentation according to a point of view  
         given by <aProjector>.  
         To be Used when the associated degenerated Presentations  
         have been transformed by <aTrsf> which is not a Pure  
         Translation. The HLR Prs can't be deducted automatically  
         WARNING :<aTrsf> must be applied  
          to the object to display before computation  !!!") Compute;
		virtual void Compute (const Handle_Prs3d_Projector & aProjector,const Handle_Geom_Transformation & aTrsf,const Handle_Prs3d_Presentation & aPresentation);
		%feature("autodoc", "Args:
	aColor(Quantity_NameOfColor)

Returns:
	None

Allows you to provide settings for the cp;pr aColor.") SetColor;
		void SetColor (const Quantity_NameOfColor aColor);
		%feature("autodoc", "Args:
	aColor(Quantity_Color)

Returns:
	None

No detailed docstring for this function.") SetColor;
		void SetColor (const Quantity_Color & aColor);
		%feature("autodoc", "Args:
	None
Returns:
	None

Allows you to remove color settings.") UnsetColor;
		void UnsetColor ();
		%feature("autodoc", "Args:
	aType(Aspect_TypeOfMarker)

Returns:
	None

Allows you to provide settings for a marker. These include  
-   type of marker,  
-   marker color,  
-   scale factor.") SetMarker;
		void SetMarker (const Aspect_TypeOfMarker aType);
		%feature("autodoc", "Args:
	None
Returns:
	None

Removes the marker settings.") UnsetMarker;
		void UnsetMarker ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns true if the point datum has a marker.") HasMarker;
		Standard_Boolean HasMarker ();
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Vertex

Converts a point into a vertex.") Vertex;
		TopoDS_Vertex Vertex ();
};


%feature("shadow") AIS_Point::~AIS_Point %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend AIS_Point {
	void _kill_pointed() {
		delete $self;
	}
};
%extend AIS_Point {
	Handle_AIS_Point GetHandle() {
	return *(Handle_AIS_Point*) &$self;
	}
};

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
    AIS_Point* GetObject() {
    return (AIS_Point*)$self->Access();
    }
};
%feature("shadow") Handle_AIS_Point::~Handle_AIS_Point %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_AIS_Point {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor AIS_Relation;
class AIS_Relation : public AIS_InteractiveObject {
	public:
		%feature("autodoc", "Args:
	aColor(Quantity_NameOfColor)

Returns:
	None

Allows you to provide settings for the color aColor  
of the lines representing the relation between the two shapes.") SetColor;
		void SetColor (const Quantity_NameOfColor aColor);
		%feature("autodoc", "Args:
	aColor(Quantity_Color)

Returns:
	None

No detailed docstring for this function.") SetColor;
		void SetColor (const Quantity_Color & aColor);
		%feature("autodoc", "Args:
	None
Returns:
	None

Allows you to remove settings for the color of the  
lines representing the relation between the two shapes.") UnsetColor;
		void UnsetColor ();
		%feature("autodoc", "Args:
	None
Returns:
	AIS_KindOfInteractive

No detailed docstring for this function.") Type;
		AIS_KindOfInteractive Type ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual AIS_KindOfDimension

Indicates that the type of dimension is unknown.") KindOfDimension;
		virtual AIS_KindOfDimension KindOfDimension ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual Standard_Boolean

Returns true if the interactive object is movable.") IsMovable;
		virtual Standard_Boolean IsMovable ();
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Shape

No detailed docstring for this function.") FirstShape;
		const TopoDS_Shape & FirstShape ();
		%feature("autodoc", "Args:
	aFShape(TopoDS_Shape)

Returns:
	virtual void

No detailed docstring for this function.") SetFirstShape;
		virtual void SetFirstShape (const TopoDS_Shape & aFShape);
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Shape

Returns the second shape.") SecondShape;
		const TopoDS_Shape & SecondShape ();
		%feature("autodoc", "Args:
	aSShape(TopoDS_Shape)

Returns:
	virtual void

Allows you to identify the second shape aSShape  
relative to the first.") SetSecondShape;
		virtual void SetSecondShape (const TopoDS_Shape & aSShape);
		%feature("autodoc", "Args:
	Xmin(Standard_Real)
	Ymin(Standard_Real)
	Zmin(Standard_Real)
	Xmax(Standard_Real)
	Ymax(Standard_Real)
	Zmax(Standard_Real)

Returns:
	None

No detailed docstring for this function.") SetBndBox;
		void SetBndBox (const Standard_Real Xmin,const Standard_Real Ymin,const Standard_Real Zmin,const Standard_Real Xmax,const Standard_Real Ymax,const Standard_Real Zmax);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") UnsetBndBox;
		void UnsetBndBox ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Geom_Plane

Returns the plane.") Plane;
		const Handle_Geom_Plane & Plane ();
		%feature("autodoc", "Args:
	aPlane(Handle_Geom_Plane)

Returns:
	None

Allows you to set the plane aPlane. This is used to  
define relations and dimensions in several daughter classes.") SetPlane;
		void SetPlane (const Handle_Geom_Plane & aPlane);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

Returns the value of each object in the relation.") Value;
		Standard_Real Value ();
		%feature("autodoc", "Args:
	aVal(Standard_Real)

Returns:
	None

Allows you to provide settings for the value aVal for  
each object in the relation.") SetValue;
		void SetValue (const Standard_Real aVal);
		%feature("autodoc", "Args:
	None
Returns:
	gp_Pnt

Returns the position set using SetPosition.") Position;
		const gp_Pnt & Position ();
		%feature("autodoc", "Args:
	aPosition(gp_Pnt)

Returns:
	None

Allows you to provide the objects in the relation with  
settings for a non-default position.") SetPosition;
		void SetPosition (const gp_Pnt & aPosition);
		%feature("autodoc", "Args:
	None
Returns:
	TCollection_ExtendedString

Returns settings for text aspect.") Text;
		const TCollection_ExtendedString & Text ();
		%feature("autodoc", "Args:
	aText(TCollection_ExtendedString)

Returns:
	None

Allows you to provide the settings aText for text aspect.") SetText;
		void SetText (const TCollection_ExtendedString & aText);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

Returns the value for the size of the arrow identifying  
the relation between the two shapes.") ArrowSize;
		Standard_Real ArrowSize ();
		%feature("autodoc", "Args:
	anArrowSize(Standard_Real)

Returns:
	None

Allows you to provide settings for the size of the  
arrow anArrowsize identifying the relation between the two shapes.") SetArrowSize;
		void SetArrowSize (const Standard_Real anArrowSize);
		%feature("autodoc", "Args:
	None
Returns:
	DsgPrs_ArrowSide

Returns the value of the symbol presentation. This will be one of:  
-   AS_NONE - none  
-   AS_FIRSTAR - first arrow  
-   AS_LASTAR - last arrow  
-   AS_BOTHAR - both arrows  
-   AS_FIRSTPT - first point  
-   AS_LASTPT - last point  
-   AS_BOTHPT - both points  
-   AS_FIRSTAR_LASTPT - first arrow, last point  
-   AS_FIRSTPT_LASTAR - first point, last arrow") SymbolPrs;
		DsgPrs_ArrowSide SymbolPrs ();
		%feature("autodoc", "Args:
	aSymbolPrs(DsgPrs_ArrowSide)

Returns:
	None

Allows you to provide settings for the symbol presentation.") SetSymbolPrs;
		void SetSymbolPrs (const DsgPrs_ArrowSide aSymbolPrs);
		%feature("autodoc", "Args:
	aIndex(Standard_Integer)

Returns:
	None

Allows you to set the status of the extension shape by  
the index aIndex.  
The status will be one of the following:  
-   0 - there is no connection to a shape;  
-   1 - there is a connection to the first shape;  
-   2 - there is a connection to the second shape.") SetExtShape;
		void SetExtShape (const Standard_Integer aIndex);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Returns the status index of the extension shape.") ExtShape;
		Standard_Integer ExtShape ();
		%feature("autodoc", "Args:
	aMode(Standard_Integer)

Returns:
	virtual Standard_Boolean

Returns true if the display mode aMode is accepted  
for the Interactive Objects in the relation.  
ComputeProjPresentation(me;  
	    	    	    aPres    : mutable Presentation from Prs3d;  
//!		    Curve1   : Curve                from Geom;  
//!		    Curve2   : Curve                from Geom;  
//!		    FirstP1  : Pnt                  from gp;  
//!		    LastP1   : Pnt                  from gp;  
//!		    FirstP2  : Pnt                  from gp;  
//!		    LastP2   : Pnt                  from gp;  
//!		    aColor   : NameOfColor          from Quantity = Quantity_NOC_PURPLE;  
//!		    aWidth   : Real                 from Standard = 2;  
   	    	    aProjTOL : TypeOfLine           from Aspect   = Aspect_TOL_DASH;  
//!		    aCallTOL : TypeOfLine           from Aspect   = Aspect_TOL_DOT)") AcceptDisplayMode;
		virtual Standard_Boolean AcceptDisplayMode (const Standard_Integer aMode);
		%feature("autodoc", "Args:
	aStatus(Standard_Boolean)

Returns:
	None

No detailed docstring for this function.") SetAutomaticPosition;
		void SetAutomaticPosition (const Standard_Boolean aStatus);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") AutomaticPosition;
		Standard_Boolean AutomaticPosition ();
};


%feature("shadow") AIS_Relation::~AIS_Relation %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend AIS_Relation {
	void _kill_pointed() {
		delete $self;
	}
};
%extend AIS_Relation {
	Handle_AIS_Relation GetHandle() {
	return *(Handle_AIS_Relation*) &$self;
	}
};

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
    AIS_Relation* GetObject() {
    return (AIS_Relation*)$self->Access();
    }
};
%feature("shadow") Handle_AIS_Relation::~Handle_AIS_Relation %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_AIS_Relation {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor AIS_Shape;
class AIS_Shape : public AIS_InteractiveObject {
	public:
		%feature("autodoc", "Args:
	shap(TopoDS_Shape)

Returns:
	None

Initializes construction of the shape shap from wires,  
edges and vertices.") AIS_Shape;
		 AIS_Shape (const TopoDS_Shape & shap);
		%feature("autodoc", "Args:
	None
Returns:
	virtual Standard_Integer

Returns index 0. This value refers to SHAPE from TopAbs_ShapeEnum") Signature;
		virtual Standard_Integer Signature ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual AIS_KindOfInteractive

Returns Object as the type of Interactive Object.") Type;
		virtual AIS_KindOfInteractive Type ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual Standard_Boolean

Returns true if the Interactive Object accepts shape decomposition.") AcceptShapeDecomposition;
		virtual Standard_Boolean AcceptShapeDecomposition ();
		%feature("autodoc", "Args:
	ashap(TopoDS_Shape)

Returns:
	None

Constructs an instance of the shape object ashape.") Set;
		void Set (const TopoDS_Shape & ashap);
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Shape

Returns this shape object.") Shape;
		const TopoDS_Shape & Shape ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Sets a local value for deviation coefficient for this specific shape.") SetOwnDeviationCoefficient;
		Standard_Boolean SetOwnDeviationCoefficient ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Sets a local value for HLR deviation coefficient for this specific shape.") SetOwnHLRDeviationCoefficient;
		Standard_Boolean SetOwnHLRDeviationCoefficient ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Sets a local value for deviation angle for this specific shape.") SetOwnDeviationAngle;
		Standard_Boolean SetOwnDeviationAngle ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Sets a local value for HLR deviation angle for this specific shape.") SetOwnHLRDeviationAngle;
		Standard_Boolean SetOwnHLRDeviationAngle ();
		%feature("autodoc", "Args:
	aCoefficient(Standard_Real)

Returns:
	None

Sets a local value for deviation coefficient for this specific shape.") SetOwnDeviationCoefficient;
		void SetOwnDeviationCoefficient (const Standard_Real aCoefficient);
		%feature("autodoc", "Args:
	aCoefficient(Standard_Real)

Returns:
	None

sets myOwnHLRDeviationCoefficient field in AIS_Drawer &  
         recomputes presentation") SetOwnHLRDeviationCoefficient;
		void SetOwnHLRDeviationCoefficient (const Standard_Real aCoefficient);
		%feature("autodoc", "Args:
	anAngle(Standard_Real)

Returns:
	None

this compute a new angle and Deviation from the value anAngle  
  and set the values stored in myDrawer with these that become local to the shape") SetAngleAndDeviation;
		void SetAngleAndDeviation (const Standard_Real anAngle);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

gives back the angle initial value put by the User.") UserAngle;
		Standard_Real UserAngle ();
		%feature("autodoc", "Args:
	anAngle(Standard_Real)

Returns:
	None

sets myOwnDeviationAngle field in AIS_Drawer & recomputes presentation") SetOwnDeviationAngle;
		void SetOwnDeviationAngle (const Standard_Real anAngle);
		%feature("autodoc", "Args:
	anAngle(Standard_Real)

Returns:
	None

this compute a new Angle and Deviation from the value anAngle for HLR  
  and set the values stored in myDrawer for with these that become local to the shape") SetHLRAngleAndDeviation;
		void SetHLRAngleAndDeviation (const Standard_Real anAngle);
		%feature("autodoc", "Args:
	anAngle(Standard_Real)

Returns:
	None

sets myOwnHLRDeviationAngle field in AIS_Drawer & recomputes presentation") SetOwnHLRDeviationAngle;
		void SetOwnHLRDeviationAngle (const Standard_Real anAngle);
		%feature("autodoc", "Args:
	aCoefficient(Standard_Real)
	aPreviousCoefficient(Standard_Real)

Returns:
	Standard_Boolean

Returns true and the values of the deviation  
coefficient aCoefficient and the previous deviation  
coefficient aPreviousCoefficient. If these values are  
not already set, false is returned.") OwnDeviationCoefficient;
		Standard_Boolean OwnDeviationCoefficient (Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	aCoefficient(Standard_Real)
	aPreviousCoefficient(Standard_Real)

Returns:
	Standard_Boolean

Returns   true and the values of the HLR deviation  
coefficient aCoefficient and the previous HLR  
deviation coefficient aPreviousCoefficient. If these  
values are not already set, false is returned.") OwnHLRDeviationCoefficient;
		Standard_Boolean OwnHLRDeviationCoefficient (Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	anAngle(Standard_Real)
	aPreviousAngle(Standard_Real)

Returns:
	Standard_Boolean

Returns true and the values of the deviation angle  
anAngle and the previous deviation angle aPreviousAngle.  
If these values are not already set, false is returned.") OwnDeviationAngle;
		Standard_Boolean OwnDeviationAngle (Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	anAngle(Standard_Real)
	aPreviousAngle(Standard_Real)

Returns:
	Standard_Boolean

Returns true and the values   of the HLR deviation  
angle anAngle and of the previous HLR deviation  
angle aPreviousAngle. If these values are not  
already set, false is returned.") OwnHLRDeviationAngle;
		Standard_Boolean OwnHLRDeviationAngle (Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	theTypeOfHLR(Prs3d_TypeOfHLR)

Returns:
	None

Sets the type of HLR algorithm used by the shape") SetTypeOfHLR;
		void SetTypeOfHLR (const Prs3d_TypeOfHLR theTypeOfHLR);
		%feature("autodoc", "Args:
	None
Returns:
	Prs3d_TypeOfHLR

Gets the type of HLR algorithm") TypeOfHLR;
		Prs3d_TypeOfHLR TypeOfHLR ();
		%feature("autodoc", "Args:
	aColor(Quantity_NameOfColor)

Returns:
	virtual void

Sets the color aColor in the reconstructed  
compound shape. Acts via the Drawer methods below on the appearance of:  
-   free boundaries:  
  AIS_Drawer_FreeBoundaryAspect,  
-   isos: AIS_Drawer_UIsoAspect,  
  AIS_Drawer_VIsoAspect,  
-   shared boundaries:  
  AIS_Drawer_UnFreeBoundaryAspect,  
-   shading: AIS_Drawer_ShadingAspect,  
-   visible line color in hidden line mode:  
  AIS_Drawer_SeenLineAspect  
-   hidden line color in hidden line mode:  
  AIS_Drawer_HiddenLineAspect.") SetColor;
		virtual void SetColor (const Quantity_NameOfColor aColor);
		%feature("autodoc", "Args:
	aColor(Quantity_Color)

Returns:
	virtual void

No detailed docstring for this function.") SetColor;
		virtual void SetColor (const Quantity_Color & aColor);
		%feature("autodoc", "Args:
	None
Returns:
	virtual void

Removes settings for color in the reconstructed compound shape.") UnsetColor;
		virtual void UnsetColor ();
		%feature("autodoc", "Args:
	aValue(Standard_Real)

Returns:
	virtual void

Sets the value aValue for line width in the reconstructed compound shape.") SetWidth;
		virtual void SetWidth (const Standard_Real aValue);
		%feature("autodoc", "Args:
	None
Returns:
	virtual void

Removes the setting for line width in the reconstructed compound shape.") UnsetWidth;
		virtual void UnsetWidth ();
		%feature("autodoc", "Args:
	aName(Graphic3d_NameOfMaterial)

Returns:
	virtual void

No detailed docstring for this function.") SetMaterial;
		virtual void SetMaterial (const Graphic3d_NameOfMaterial aName);
		%feature("autodoc", "Args:
	aName(Graphic3d_MaterialAspect)

Returns:
	virtual void

Allows you to provide settings for the material aName  
in the reconstructed compound shape.") SetMaterial;
		virtual void SetMaterial (const Graphic3d_MaterialAspect & aName);
		%feature("autodoc", "Args:
	None
Returns:
	virtual void

Removes settings for material in the reconstructed compound shape.") UnsetMaterial;
		virtual void UnsetMaterial ();
		%feature("autodoc", "Args:
	aValue(Standard_Real)=0.6

Returns:
	virtual void

Sets the value aValue for transparency in the reconstructed compound shape.") SetTransparency;
		virtual void SetTransparency (const Standard_Real aValue = 0.6);
		%feature("autodoc", "Args:
	None
Returns:
	virtual void

Removes the setting for transparency in the reconstructed compound shape.") UnsetTransparency;
		virtual void UnsetTransparency ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual  Bnd_Box

Constructs a bounding box with which to reconstruct  
compound topological shapes for presentation.") BoundingBox;
		virtual const Bnd_Box & BoundingBox ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual Quantity_NameOfColor

Returns the NameOfColor attributes of the shape accordingly to  
 the current facing model;") Color;
		virtual Quantity_NameOfColor Color ();
		%feature("autodoc", "Args:
	aColor(Quantity_Color)

Returns:
	virtual void

Returns the Color attributes of the shape accordingly to  
 the current facing model;") Color;
		virtual void Color (Quantity_Color & aColor);
		%feature("autodoc", "Args:
	None
Returns:
	virtual Graphic3d_NameOfMaterial

Returns the NameOfMaterial attributes of the shape accordingly to  
 the current facing model;") Material;
		virtual Graphic3d_NameOfMaterial Material ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual Standard_Real

Returns the transparency attributes of the shape accordingly to  
 the current facing model;") Transparency;
		virtual Standard_Real Transparency ();
		%feature("autodoc", "Args:
	aDecompositionMode(Standard_Integer)

Returns:
	static TopAbs_ShapeEnum

Activates the same TopAbs shape enumerations as  
those used by SelectionMode assigning a type to the mode aDecompositionMode.") SelectionType;
		static TopAbs_ShapeEnum SelectionType (const Standard_Integer aDecompositionMode);
		%feature("autodoc", "Args:
	aShapeType(TopAbs_ShapeEnum)

Returns:
	static Standard_Integer

Establishes an equivalence between a mode and the  
type, aShapeType,   of selection. The correspondences are as follows:  
-   mode 0 - Shape  
-   mode 1 - Vertex  
-   mode 2 - Edge  
-   mode 3 - Wire  
-   mode 4 - Face  
-   mode 5 - Shell  
-   mode 6 - Solid  
-   mode 7 - Compsolid  
-   mode 8 - Compound") SelectionMode;
		static Standard_Integer SelectionMode (const TopAbs_ShapeEnum aShapeType);
		%feature("autodoc", "Args:
	aShape(TopoDS_Shape)
	aDrawer(Handle_Prs3d_Drawer)

Returns:
	static Standard_Real

No detailed docstring for this function.") GetDeflection;
		static Standard_Real GetDeflection (const TopoDS_Shape & aShape,const Handle_Prs3d_Drawer & aDrawer);
};


%feature("shadow") AIS_Shape::~AIS_Shape %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend AIS_Shape {
	void _kill_pointed() {
		delete $self;
	}
};
%extend AIS_Shape {
	Handle_AIS_Shape GetHandle() {
	return *(Handle_AIS_Shape*) &$self;
	}
};

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
    AIS_Shape* GetObject() {
    return (AIS_Shape*)$self->Access();
    }
};
%feature("shadow") Handle_AIS_Shape::~Handle_AIS_Shape %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_AIS_Shape {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor AIS_SignatureFilter;
class AIS_SignatureFilter : public AIS_TypeFilter {
	public:
		%feature("autodoc", "Args:
	aGivenKind(AIS_KindOfInteractive)
	aGivenSignature(Standard_Integer)

Returns:
	None

Initializes the signature filter, adding the signature  
specification, aGivenSignature, to that for type,  
aGivenKind, in AIS_TypeFilter.") AIS_SignatureFilter;
		 AIS_SignatureFilter (const AIS_KindOfInteractive aGivenKind,const Standard_Integer aGivenSignature);
		%feature("autodoc", "Args:
	anobj(Handle_SelectMgr_EntityOwner)

Returns:
	Standard_Boolean

Returns False if the transient is not an AIS_InteractiveObject.  
         Returns False if the signature of InteractiveObject  
         is not the same as the stored one in the filter...") IsOk;
		Standard_Boolean IsOk (const Handle_SelectMgr_EntityOwner & anobj);
};


%feature("shadow") AIS_SignatureFilter::~AIS_SignatureFilter %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend AIS_SignatureFilter {
	void _kill_pointed() {
		delete $self;
	}
};
%extend AIS_SignatureFilter {
	Handle_AIS_SignatureFilter GetHandle() {
	return *(Handle_AIS_SignatureFilter*) &$self;
	}
};

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
    AIS_SignatureFilter* GetObject() {
    return (AIS_SignatureFilter*)$self->Access();
    }
};
%feature("shadow") Handle_AIS_SignatureFilter::~Handle_AIS_SignatureFilter %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_AIS_SignatureFilter {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor AIS_Triangulation;
class AIS_Triangulation : public AIS_InteractiveObject {
	public:
		%feature("autodoc", "Args:
	aTriangulation(Handle_Poly_Triangulation)

Returns:
	None

Constructs the Triangulation display object") AIS_Triangulation;
		 AIS_Triangulation (const Handle_Poly_Triangulation & aTriangulation);
		%feature("autodoc", "Args:
	aColor(Handle_TColStd_HArray1OfInteger)

Returns:
	None

Set the color for each node.  
Each 32-bit color is Alpha << 24 + Blue << 16 + Green << 8 + Red  
Order of color components is essential for further usage by OpenGL") SetColors;
		void SetColors (const Handle_TColStd_HArray1OfInteger & aColor);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_TColStd_HArray1OfInteger

Get the color for each node.  
Each 32-bit color is Alpha << 24 + Blue << 16 + Green << 8 + Red") GetColors;
		Handle_TColStd_HArray1OfInteger GetColors ();
		%feature("autodoc", "Args:
	aTriangulation(Handle_Poly_Triangulation)

Returns:
	None

No detailed docstring for this function.") SetTriangulation;
		void SetTriangulation (const Handle_Poly_Triangulation & aTriangulation);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Poly_Triangulation

Returns Poly_Triangulation .") GetTriangulation;
		Handle_Poly_Triangulation GetTriangulation ();
};


%feature("shadow") AIS_Triangulation::~AIS_Triangulation %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend AIS_Triangulation {
	void _kill_pointed() {
		delete $self;
	}
};
%extend AIS_Triangulation {
	Handle_AIS_Triangulation GetHandle() {
	return *(Handle_AIS_Triangulation*) &$self;
	}
};

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
    AIS_Triangulation* GetObject() {
    return (AIS_Triangulation*)$self->Access();
    }
};
%feature("shadow") Handle_AIS_Triangulation::~Handle_AIS_Triangulation %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_AIS_Triangulation {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor AIS_Trihedron;
class AIS_Trihedron : public AIS_InteractiveObject {
	public:
		%feature("autodoc", "Args:
	aComponent(Handle_Geom_Axis2Placement)

Returns:
	None

Initializes a trihedron entity.") AIS_Trihedron;
		 AIS_Trihedron (const Handle_Geom_Axis2Placement & aComponent);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Geom_Axis2Placement

Returns the right-handed coordinate system set in SetComponent.") Component;
		const Handle_Geom_Axis2Placement & Component ();
		%feature("autodoc", "Args:
	aComponent(Handle_Geom_Axis2Placement)

Returns:
	None

Constructs the right-handed coordinate system aComponent.") SetComponent;
		void SetComponent (const Handle_Geom_Axis2Placement & aComponent);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns true if the trihedron object has a size other  
than the default size of 100 mm. along each axis.") HasOwnSize;
		Standard_Boolean HasOwnSize ();
		%feature("autodoc", "Args:
	aValue(Standard_Real)

Returns:
	None

Sets the size aValue for the trihedron object.  
The default value is 100 mm.") SetSize;
		void SetSize (const Standard_Real aValue);
		%feature("autodoc", "Args:
	None
Returns:
	None

Removes any non-default settings for size of this  
trihedron object.") UnsetSize;
		void UnsetSize ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") Size;
		Standard_Real Size ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_AIS_Axis

Returns the 'XAxis'.") XAxis;
		Handle_AIS_Axis XAxis ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_AIS_Axis

Returns the 'YAxis'.") YAxis;
		Handle_AIS_Axis YAxis ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_AIS_Axis

Returns the main Axis.") Axis;
		Handle_AIS_Axis Axis ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_AIS_Point

Returns the origine.") Position;
		Handle_AIS_Point Position ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_AIS_Plane

Returns the 'XYPlane'.") XYPlane;
		Handle_AIS_Plane XYPlane ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_AIS_Plane

Returns the 'XZPlane'.") XZPlane;
		Handle_AIS_Plane XZPlane ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_AIS_Plane

Returns the 'YZPlane'.") YZPlane;
		Handle_AIS_Plane YZPlane ();
		%feature("autodoc", "Args:
	aCtx(Handle_AIS_InteractiveContext)

Returns:
	virtual void

connection to <aCtx> default drawer implies a recomputation  
         of SubObjects values.") SetContext;
		virtual void SetContext (const Handle_AIS_InteractiveContext & aCtx);
		%feature("autodoc", "Args:
	aMode(Standard_Integer)

Returns:
	Standard_Boolean

Returns true if the display mode selected, aMode, is  
valid for trihedron datums.") AcceptDisplayMode;
		Standard_Boolean AcceptDisplayMode (const Standard_Integer aMode);
		%feature("autodoc", "Args:
	aProjector(Handle_Prs3d_Projector)
	aTrsf(Handle_Geom_Transformation)
	aPresentation(Handle_Prs3d_Presentation)

Returns:
	virtual void

Computes the presentation according to a point of view  
         given by <aProjector>.  
         To be Used when the associated degenerated Presentations  
         have been transformed by <aTrsf> which is not a Pure  
         Translation. The HLR Prs can't be deducted automatically  
         WARNING :<aTrsf> must be applied  
          to the object to display before computation  !!!") Compute;
		virtual void Compute (const Handle_Prs3d_Projector & aProjector,const Handle_Geom_Transformation & aTrsf,const Handle_Prs3d_Presentation & aPresentation);
		%feature("autodoc", "Args:
	aLoc(TopLoc_Location)

Returns:
	None

No detailed docstring for this function.") SetLocation;
		void SetLocation (const TopLoc_Location & aLoc);
		%feature("autodoc", "Args:
	None
Returns:
	virtual Standard_Integer

Returns index 3, selection of the planes XOY, YOZ, XOZ.") Signature;
		virtual Standard_Integer Signature ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual AIS_KindOfInteractive

Indicates that the type of Interactive Object is datum.") Type;
		virtual AIS_KindOfInteractive Type ();
		%feature("autodoc", "Args:
	aColor(Quantity_NameOfColor)

Returns:
	None

No detailed docstring for this function.") SetColor;
		void SetColor (const Quantity_NameOfColor aColor);
		%feature("autodoc", "Args:
	aColor(Quantity_Color)

Returns:
	None

Sets the color aColor for this trihedron object.") SetColor;
		void SetColor (const Quantity_Color & aColor);
		%feature("autodoc", "Args:
	aColor(Quantity_NameOfColor)

Returns:
	None

No detailed docstring for this function.") SetTextColor;
		void SetTextColor (const Quantity_NameOfColor aColor);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") HasTextColor;
		Standard_Boolean HasTextColor ();
		%feature("autodoc", "Args:
	None
Returns:
	Quantity_NameOfColor

No detailed docstring for this function.") TextColor;
		Quantity_NameOfColor TextColor ();
		%feature("autodoc", "Args:
	aColor(Quantity_NameOfColor)

Returns:
	None

No detailed docstring for this function.") SetArrowColor;
		void SetArrowColor (const Quantity_NameOfColor aColor);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") HasArrowColor;
		Standard_Boolean HasArrowColor ();
		%feature("autodoc", "Args:
	None
Returns:
	Quantity_NameOfColor

No detailed docstring for this function.") ArrowColor;
		Quantity_NameOfColor ArrowColor ();
		%feature("autodoc", "Args:
	TheExtrem(TColgp_Array1OfPnt)

Returns:
	None

Returns the four extremities of the trihedron from the  
array of points, TheExtrem.") ExtremityPoints;
		void ExtremityPoints (TColgp_Array1OfPnt & TheExtrem);
		%feature("autodoc", "Args:
	None
Returns:
	None

Removes the settings for color.") UnsetColor;
		void UnsetColor ();
		%feature("autodoc", "Args:
	None
Returns:
	None

Removes the non-default settings for width set in SetWidth.") UnsetWidth;
		void UnsetWidth ();
};


%feature("shadow") AIS_Trihedron::~AIS_Trihedron %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend AIS_Trihedron {
	void _kill_pointed() {
		delete $self;
	}
};
%extend AIS_Trihedron {
	Handle_AIS_Trihedron GetHandle() {
	return *(Handle_AIS_Trihedron*) &$self;
	}
};

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
    AIS_Trihedron* GetObject() {
    return (AIS_Trihedron*)$self->Access();
    }
};
%feature("shadow") Handle_AIS_Trihedron::~Handle_AIS_Trihedron %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_AIS_Trihedron {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor AIS_AngleDimension;
class AIS_AngleDimension : public AIS_Dimension {
	public:
		%feature("autodoc", "Args:
	theFirstEdge(TopoDS_Edge)
	theSecondEdge(TopoDS_Edge)

Returns:
	None

Constructs minimum angle dimension between two linear edges (where possible).
These two edges should be intersected by each other. Otherwise the geometry is not valid.
@param theFirstEdge [in] the first edge.
@param theSecondEdge [in] the second edge.") AIS_AngleDimension;
		 AIS_AngleDimension (const TopoDS_Edge & theFirstEdge,const TopoDS_Edge & theSecondEdge);
		%feature("autodoc", "Args:
	theFirstPoint(gp_Pnt)
	theSecondPoint(gp_Pnt)
	theThirdPoint(gp_Pnt)

Returns:
	None

Constructs the angle display object defined by three points.
@param theFirstPoint [in] the first point (point on first angle flyout).
@param theSecondPoint [in] the center point of angle dimension.
@param theThirdPoint [in] the second point (point on second angle flyout).") AIS_AngleDimension;
		 AIS_AngleDimension (const gp_Pnt & theFirstPoint,const gp_Pnt & theSecondPoint,const gp_Pnt & theThirdPoint);
		%feature("autodoc", "Args:
	theFirstVertex(TopoDS_Vertex)
	theSecondVertex(TopoDS_Vertex)
	theThirdVertex(TopoDS_Vertex)

Returns:
	None

Constructs the angle display object defined by three vertices.
@param theFirstVertex [in] the first vertex (vertex for first angle flyout).
@param theSecondVertex [in] the center vertex of angle dimension.
@param theThirdPoint [in] the second vertex (vertex for second angle flyout).") AIS_AngleDimension;
		 AIS_AngleDimension (const TopoDS_Vertex & theFirstVertex,const TopoDS_Vertex & theSecondVertex,const TopoDS_Vertex & theThirdVertex);
		%feature("autodoc", "Args:
	theCone(TopoDS_Face)

Returns:
	None

Constructs angle dimension for the cone face.
@param theCone [in] the conical face.") AIS_AngleDimension;
		 AIS_AngleDimension (const TopoDS_Face & theCone);
		%feature("autodoc", "Args:
	theFirstFace(TopoDS_Face)
	theSecondFace(TopoDS_Face)

Returns:
	None

Constructs angle dimension between two planar faces.
@param theFirstFace [in] the first face.
@param theSecondFace [in] the second face.") AIS_AngleDimension;
		 AIS_AngleDimension (const TopoDS_Face & theFirstFace,const TopoDS_Face & theSecondFace);
		%feature("autodoc", "Args:
	theFirstFace(TopoDS_Face)
	theSecondFace(TopoDS_Face)
	thePoint(gp_Pnt)

Returns:
	None

Constructs angle dimension between two planar faces.
@param theFirstFace [in] the first face.
@param theSecondFace [in] the second face.
@param thePoint [in] the point which the dimension plane should pass through.
This point can lay on the one of the faces or not.") AIS_AngleDimension;
		 AIS_AngleDimension (const TopoDS_Face & theFirstFace,const TopoDS_Face & theSecondFace,const gp_Pnt & thePoint);
		%feature("autodoc", "Args:
	None
Returns:
	gp_Pnt

@return first point forming the angle.") FirstPoint;
		const gp_Pnt & FirstPoint ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Pnt

@return second point forming the angle.") SecondPoint;
		const gp_Pnt & SecondPoint ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Pnt

@return center point forming the angle.") CenterPoint;
		const gp_Pnt & CenterPoint ();
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Shape

@return first argument shape.") FirstShape;
		const TopoDS_Shape & FirstShape ();
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Shape

@return second argument shape.") SecondShape;
		const TopoDS_Shape & SecondShape ();
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Shape

@return third argument shape.") ThirdShape;
		const TopoDS_Shape & ThirdShape ();
		%feature("autodoc", "Args:
	theFirstEdge(TopoDS_Edge)
	theSecondEdge(TopoDS_Edge)

Returns:
	None

Measures minimum angle dimension between two linear edges.
These two edges should be intersected by each other. Otherwise the geometry is not valid.
@param theFirstEdge [in] the first edge.
@param theSecondEdge [in] the second edge.") SetMeasuredGeometry;
		void SetMeasuredGeometry (const TopoDS_Edge & theFirstEdge,const TopoDS_Edge & theSecondEdge);
		%feature("autodoc", "Args:
	theFirstPoint(gp_Pnt)
	theSecondPoint(gp_Pnt)
	theThridPoint(gp_Pnt)

Returns:
	None

Measures angle defined by three points.
@param theFirstPoint [in] the first point (point on first angle flyout).
@param theSecondPoint [in] the center point of angle dimension.
@param theThirdPoint [in] the second point (point on second angle flyout).") SetMeasuredGeometry;
		void SetMeasuredGeometry (const gp_Pnt & theFirstPoint,const gp_Pnt & theSecondPoint,const gp_Pnt & theThridPoint);
		%feature("autodoc", "Args:
	theFirstVertex(TopoDS_Vertex)
	theSecondVertex(TopoDS_Vertex)
	theThirdVertex(TopoDS_Vertex)

Returns:
	None

Measures angle defined by three vertices.
@param theFirstVertex [in] the first vertex (vertex for first angle flyout).
@param theSecondVertex [in] the center vertex of angle dimension.
@param theThirdPoint [in] the second vertex (vertex for second angle flyout).") SetMeasuredGeometry;
		void SetMeasuredGeometry (const TopoDS_Vertex & theFirstVertex,const TopoDS_Vertex & theSecondVertex,const TopoDS_Vertex & theThirdVertex);
		%feature("autodoc", "Args:
	theCone(TopoDS_Face)

Returns:
	None

Measures angle of conical face.
@param theCone [in] the shape to measure.") SetMeasuredGeometry;
		void SetMeasuredGeometry (const TopoDS_Face & theCone);
		%feature("autodoc", "Args:
	theFirstFace(TopoDS_Face)
	theSecondFace(TopoDS_Face)

Returns:
	None

Measures angle between two planar faces.
@param theFirstFace [in] the first face.
@param theSecondFace [in] the second face..") SetMeasuredGeometry;
		void SetMeasuredGeometry (const TopoDS_Face & theFirstFace,const TopoDS_Face & theSecondFace);
		%feature("autodoc", "Args:
	theFirstFace(TopoDS_Face)
	theSecondFace(TopoDS_Face)
	thePoint(gp_Pnt)

Returns:
	None

Measures angle between two planar faces.
@param theFirstFace [in] the first face.
@param theSecondFace [in] the second face.
@param thePoint [in] the point which the dimension plane should pass through.
This point can lay on the one of the faces or not.") SetMeasuredGeometry;
		void SetMeasuredGeometry (const TopoDS_Face & theFirstFace,const TopoDS_Face & theSecondFace,const gp_Pnt & thePoint);
		%feature("autodoc", "Args:
	None
Returns:
	virtual  TCollection_AsciiString

@return the display units string.") GetDisplayUnits;
		virtual const TCollection_AsciiString & GetDisplayUnits ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual  TCollection_AsciiString

@return the model units string.") GetModelUnits;
		virtual const TCollection_AsciiString & GetModelUnits ();
		%feature("autodoc", "Args:
	theUnits(TCollection_AsciiString)

Returns:
	virtual void

No detailed docstring for this function.") SetDisplayUnits;
		virtual void SetDisplayUnits (const TCollection_AsciiString & theUnits);
		%feature("autodoc", "Args:
	theUnits(TCollection_AsciiString)

Returns:
	virtual void

No detailed docstring for this function.") SetModelUnits;
		virtual void SetModelUnits (const TCollection_AsciiString & theUnits);
		%feature("autodoc", "Args:
	theTextPos(gp_Pnt)

Returns:
	virtual void

Principle of horizontal text alignment settings:
- divide circle into two halves according to attachment points
- if aTextPos is between attach points -> Center + positive flyout
- if aTextPos is not between attach points but in this half -> Left or Right + positive flyout
- if aTextPos is between reflections of attach points -> Center + negative flyout
- if aTextPos is not between reflections of attach points -> Left or Right + negative flyout") SetTextPosition;
		virtual void SetTextPosition (const gp_Pnt & theTextPos);
		%feature("autodoc", "Args:
	None
Returns:
	virtual  gp_Pnt

No detailed docstring for this function.") GetTextPosition;
		virtual const gp_Pnt GetTextPosition ();
};


%feature("shadow") AIS_AngleDimension::~AIS_AngleDimension %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend AIS_AngleDimension {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor AIS_Chamf2dDimension;
class AIS_Chamf2dDimension : public AIS_Relation {
	public:
		%feature("autodoc", "Args:
	aFShape(TopoDS_Shape)
	aPlane(Handle_Geom_Plane)
	aVal(Standard_Real)
	aText(TCollection_ExtendedString)

Returns:
	None

Constructs the display object for 2D chamfers.  
This object is defined by the face aFShape, the  
dimension aVal, the plane aPlane and the text aText.") AIS_Chamf2dDimension;
		 AIS_Chamf2dDimension (const TopoDS_Shape & aFShape,const Handle_Geom_Plane & aPlane,const Standard_Real aVal,const TCollection_ExtendedString & aText);
		%feature("autodoc", "Args:
	aFShape(TopoDS_Shape)
	aPlane(Handle_Geom_Plane)
	aVal(Standard_Real)
	aText(TCollection_ExtendedString)
	aPosition(gp_Pnt)
	aSymbolPrs(DsgPrs_ArrowSide)
	anArrowSize(Standard_Real)=0.0

Returns:
	None

Constructs the display object for 2D chamfers.  
This object is defined by the face aFShape, the plane  
aPlane, the dimension aVal, the position aPosition,  
the type of arrow aSymbolPrs with the size  
anArrowSize, and the text aText.") AIS_Chamf2dDimension;
		 AIS_Chamf2dDimension (const TopoDS_Shape & aFShape,const Handle_Geom_Plane & aPlane,const Standard_Real aVal,const TCollection_ExtendedString & aText,const gp_Pnt & aPosition,const DsgPrs_ArrowSide aSymbolPrs,const Standard_Real anArrowSize = 0.0);
		%feature("autodoc", "Args:
	None
Returns:
	AIS_KindOfDimension

Indicates that we are concerned with a 2d length.") KindOfDimension;
		AIS_KindOfDimension KindOfDimension ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns true if the 2d chamfer dimension is movable.") IsMovable;
		Standard_Boolean IsMovable ();
		%feature("autodoc", "Args:
	aProjector(Handle_Prs3d_Projector)
	aTrsf(Handle_Geom_Transformation)
	aPresentation(Handle_Prs3d_Presentation)

Returns:
	virtual void

computes the presentation according to a point of view  
         given by <aProjector>.  
         To be Used when the associated degenerated Presentations  
         have been transformed by <aTrsf> which is not a Pure  
         Translation. The HLR Prs can't be deducted automatically  
         WARNING :<aTrsf> must be applied  
         to the object to display before computation  !!!") Compute;
		virtual void Compute (const Handle_Prs3d_Projector & aProjector,const Handle_Geom_Transformation & aTrsf,const Handle_Prs3d_Presentation & aPresentation);
};


%feature("shadow") AIS_Chamf2dDimension::~AIS_Chamf2dDimension %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend AIS_Chamf2dDimension {
	void _kill_pointed() {
		delete $self;
	}
};
%extend AIS_Chamf2dDimension {
	Handle_AIS_Chamf2dDimension GetHandle() {
	return *(Handle_AIS_Chamf2dDimension*) &$self;
	}
};

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
    AIS_Chamf2dDimension* GetObject() {
    return (AIS_Chamf2dDimension*)$self->Access();
    }
};
%feature("shadow") Handle_AIS_Chamf2dDimension::~Handle_AIS_Chamf2dDimension %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_AIS_Chamf2dDimension {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor AIS_Chamf3dDimension;
class AIS_Chamf3dDimension : public AIS_Relation {
	public:
		%feature("autodoc", "Args:
	aFShape(TopoDS_Shape)
	aVal(Standard_Real)
	aText(TCollection_ExtendedString)

Returns:
	None

Constructs a display object for 3D chamfers.  
This object is defined by the shape aFShape, the  
dimension aVal and the text aText.") AIS_Chamf3dDimension;
		 AIS_Chamf3dDimension (const TopoDS_Shape & aFShape,const Standard_Real aVal,const TCollection_ExtendedString & aText);
		%feature("autodoc", "Args:
	aFShape(TopoDS_Shape)
	aVal(Standard_Real)
	aText(TCollection_ExtendedString)
	aPosition(gp_Pnt)
	aSymbolPrs(DsgPrs_ArrowSide)
	anArrowSize(Standard_Real)=0.0

Returns:
	None

Constructs a display object for 3D chamfers.  
This object is defined by the shape aFShape, the  
dimension aVal, the text aText, the point of origin of  
the chamfer aPosition, the type of arrow aSymbolPrs  
with the size anArrowSize.") AIS_Chamf3dDimension;
		 AIS_Chamf3dDimension (const TopoDS_Shape & aFShape,const Standard_Real aVal,const TCollection_ExtendedString & aText,const gp_Pnt & aPosition,const DsgPrs_ArrowSide aSymbolPrs,const Standard_Real anArrowSize = 0.0);
		%feature("autodoc", "Args:
	None
Returns:
	AIS_KindOfDimension

Indicates that we are concerned with a 3d length.") KindOfDimension;
		AIS_KindOfDimension KindOfDimension ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns true if the 3d chamfer dimension is movable.") IsMovable;
		Standard_Boolean IsMovable ();
		%feature("autodoc", "Args:
	aProjector(Handle_Prs3d_Projector)
	aTrsf(Handle_Geom_Transformation)
	aPresentation(Handle_Prs3d_Presentation)

Returns:
	virtual void

computes the presentation according to a point of view  
         given by <aProjector>.  
         To be Used when the associated degenerated Presentations  
         have been transformed by <aTrsf> which is not a Pure  
         Translation. The HLR Prs can't be deducted automatically  
         WARNING :<aTrsf> must be applied  
          to the object to display before computation  !!!") Compute;
		virtual void Compute (const Handle_Prs3d_Projector & aProjector,const Handle_Geom_Transformation & aTrsf,const Handle_Prs3d_Presentation & aPresentation);
};


%feature("shadow") AIS_Chamf3dDimension::~AIS_Chamf3dDimension %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend AIS_Chamf3dDimension {
	void _kill_pointed() {
		delete $self;
	}
};
%extend AIS_Chamf3dDimension {
	Handle_AIS_Chamf3dDimension GetHandle() {
	return *(Handle_AIS_Chamf3dDimension*) &$self;
	}
};

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
    AIS_Chamf3dDimension* GetObject() {
    return (AIS_Chamf3dDimension*)$self->Access();
    }
};
%feature("shadow") Handle_AIS_Chamf3dDimension::~Handle_AIS_Chamf3dDimension %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_AIS_Chamf3dDimension {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor AIS_ConcentricRelation;
class AIS_ConcentricRelation : public AIS_Relation {
	public:
		%feature("autodoc", "Args:
	aFShape(TopoDS_Shape)
	aSShape(TopoDS_Shape)
	aPlane(Handle_Geom_Plane)

Returns:
	None

Constructs the display object for concentric relations  
between shapes.  
This object is defined by the two shapes, aFShape  
and aSShape and the plane aPlane.  
aPlane is provided to create an axis along which the  
relation of concentricity can be extended.") AIS_ConcentricRelation;
		 AIS_ConcentricRelation (const TopoDS_Shape & aFShape,const TopoDS_Shape & aSShape,const Handle_Geom_Plane & aPlane);
		%feature("autodoc", "Args:
	aProjector(Handle_Prs3d_Projector)
	aTrsf(Handle_Geom_Transformation)
	aPresentation(Handle_Prs3d_Presentation)

Returns:
	virtual void

computes the presentation according to a point of view  
         given by <aProjector>.  
         To be Used when the associated degenerated Presentations  
         have been transformed by <aTrsf> which is not a Pure  
         Translation. The HLR Prs can't be deducted automatically  
         WARNING :<aTrsf> must be applied  
          to the object to display before computation  !!!") Compute;
		virtual void Compute (const Handle_Prs3d_Projector & aProjector,const Handle_Geom_Transformation & aTrsf,const Handle_Prs3d_Presentation & aPresentation);
};


%feature("shadow") AIS_ConcentricRelation::~AIS_ConcentricRelation %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend AIS_ConcentricRelation {
	void _kill_pointed() {
		delete $self;
	}
};
%extend AIS_ConcentricRelation {
	Handle_AIS_ConcentricRelation GetHandle() {
	return *(Handle_AIS_ConcentricRelation*) &$self;
	}
};

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
    AIS_ConcentricRelation* GetObject() {
    return (AIS_ConcentricRelation*)$self->Access();
    }
};
%feature("shadow") Handle_AIS_ConcentricRelation::~Handle_AIS_ConcentricRelation %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_AIS_ConcentricRelation {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor AIS_ConnectedShape;
class AIS_ConnectedShape : public AIS_ConnectedInteractive {
	public:
		%feature("autodoc", "Args:
	aTypeOfPresentation(PrsMgr_TypeOfPresentation3d)=PrsMgr_TOP_ProjectorDependant

Returns:
	None

Initializes the type of 3d presentation aTypeOfPresentation") AIS_ConnectedShape;
		 AIS_ConnectedShape (const PrsMgr_TypeOfPresentation3d aTypeOfPresentation = PrsMgr_TOP_ProjectorDependant);
		%feature("autodoc", "Args:
	aInteractiveShape(Handle_AIS_Shape)
	aTypeOfPresentation(PrsMgr_TypeOfPresentation3d)=PrsMgr_TOP_ProjectorDependant

Returns:
	None

Initializes the entity aInteractiveShape and the type of 3d presentation aTypeOfPresentation.") AIS_ConnectedShape;
		 AIS_ConnectedShape (const Handle_AIS_Shape & aInteractiveShape,const PrsMgr_TypeOfPresentation3d aTypeOfPresentation = PrsMgr_TOP_ProjectorDependant);
		%feature("autodoc", "Args:
	aConnectedShape(Handle_AIS_ConnectedShape)
	aTypeOfPresentation(PrsMgr_TypeOfPresentation3d)=PrsMgr_TOP_ProjectorDependant

Returns:
	None

Initializes the entity aConnectedShape and the type of 3d presentation aTypeOfPresentation.") AIS_ConnectedShape;
		 AIS_ConnectedShape (const Handle_AIS_ConnectedShape & aConnectedShape,const PrsMgr_TypeOfPresentation3d aTypeOfPresentation = PrsMgr_TOP_ProjectorDependant);
		%feature("autodoc", "Args:
	None
Returns:
	virtual AIS_KindOfInteractive

No detailed docstring for this function.") Type;
		virtual AIS_KindOfInteractive Type ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual Standard_Integer

No detailed docstring for this function.") Signature;
		virtual Standard_Integer Signature ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual Standard_Boolean

No detailed docstring for this function.") AcceptShapeDecomposition;
		virtual Standard_Boolean AcceptShapeDecomposition ();
		%feature("autodoc", "Args:
	anotherIObj(Handle_AIS_InteractiveObject)

Returns:
	virtual void

Establishes the connection between the Connected  
Interactive Object, anotherIobj, and its reference  
entity. If there is already a previous connection with  
an Interactive Object, this connection is removed.") Connect;
		virtual void Connect (const Handle_AIS_InteractiveObject & anotherIObj);
		%feature("autodoc", "Args:
	anotherIobj(Handle_AIS_InteractiveObject)
	aLocation(TopLoc_Location)

Returns:
	virtual void

Establishes the connection between the Connected  
Interactive Object, anotherIobj, and its reference  
entity. If there is already a previous connection with  
an Interactive Object, this connection is removed.  
This syntax also initiates the location of the Connected Interactive Object.") Connect;
		virtual void Connect (const Handle_AIS_InteractiveObject & anotherIobj,const TopLoc_Location & aLocation);
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Shape

Returns the topological shape which is the reference  
for the connected shape. Sets hilight mode to index  
0. This returns a wireframe presentation.") Shape;
		const TopoDS_Shape & Shape ();
};


%feature("shadow") AIS_ConnectedShape::~AIS_ConnectedShape %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend AIS_ConnectedShape {
	void _kill_pointed() {
		delete $self;
	}
};
%extend AIS_ConnectedShape {
	Handle_AIS_ConnectedShape GetHandle() {
	return *(Handle_AIS_ConnectedShape*) &$self;
	}
};

%nodefaultctor Handle_AIS_ConnectedShape;
class Handle_AIS_ConnectedShape : public Handle_AIS_ConnectedInteractive {

    public:
        // constructors
        Handle_AIS_ConnectedShape();
        Handle_AIS_ConnectedShape(const Handle_AIS_ConnectedShape &aHandle);
        Handle_AIS_ConnectedShape(const AIS_ConnectedShape *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_AIS_ConnectedShape DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_AIS_ConnectedShape {
    AIS_ConnectedShape* GetObject() {
    return (AIS_ConnectedShape*)$self->Access();
    }
};
%feature("shadow") Handle_AIS_ConnectedShape::~Handle_AIS_ConnectedShape %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_AIS_ConnectedShape {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor AIS_DiameterDimension;
class AIS_DiameterDimension : public AIS_Dimension {
	public:
		%feature("autodoc", "Args:
	theCircle(gp_Circ)

Returns:
	None

Construct diameter dimension for the circle.
@param theCircle [in] the circle to measure.") AIS_DiameterDimension;
		 AIS_DiameterDimension (const gp_Circ & theCircle);
		%feature("autodoc", "Args:
	theCircle(gp_Circ)
	thePlane(gp_Pln)

Returns:
	None

Construct diameter dimension for the circle and orient it correspondingly
to the passed plane.
@param theCircle [in] the circle to measure.
@param thePlane [in] the plane defining preferred orientation
       for dimension.") AIS_DiameterDimension;
		 AIS_DiameterDimension (const gp_Circ & theCircle,const gp_Pln & thePlane);
		%feature("autodoc", "Args:
	theShape(TopoDS_Shape)

Returns:
	None

Construct diameter on the passed shape, if applicable.
@param theShape [in] the shape to measure.") AIS_DiameterDimension;
		 AIS_DiameterDimension (const TopoDS_Shape & theShape);
		%feature("autodoc", "Args:
	theShape(TopoDS_Shape)
	thePlane(gp_Pln)

Returns:
	None

Construct diameter on the passed shape, if applicable - and
define the preferred plane to orient the dimension.
@param theShape [in] the shape to measure.
@param thePlane [in] the plane defining preferred orientation
       for dimension.") AIS_DiameterDimension;
		 AIS_DiameterDimension (const TopoDS_Shape & theShape,const gp_Pln & thePlane);
		%feature("autodoc", "Args:
	None
Returns:
	gp_Circ

@return measured geometry circle.") Circle;
		const gp_Circ & Circle ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Pnt

@return anchor point on circle for diameter dimension.") AnchorPoint;
		gp_Pnt AnchorPoint ();
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Shape

@return the measured shape.") Shape;
		const TopoDS_Shape & Shape ();
		%feature("autodoc", "Args:
	theCircle(gp_Circ)

Returns:
	None

Measure diameter of the circle.
The actual dimension plane is used for determining anchor points
on the circle to attach the dimension lines to.
The dimension will become invalid if the diameter of the circle
is less than Precision::Confusion().
@param theCircle [in] the circle to measure.") SetMeasuredGeometry;
		void SetMeasuredGeometry (const gp_Circ & theCircle);
		%feature("autodoc", "Args:
	theShape(TopoDS_Shape)

Returns:
	None

Measure diameter on the passed shape, if applicable.
The dimension will become invalid if the passed shape is not
measurable or if measured diameter value is less than Precision::Confusion().
@param theShape [in] the shape to measure.") SetMeasuredGeometry;
		void SetMeasuredGeometry (const TopoDS_Shape & theShape);
		%feature("autodoc", "Args:
	None
Returns:
	virtual  TCollection_AsciiString

@return the display units string.") GetDisplayUnits;
		virtual const TCollection_AsciiString & GetDisplayUnits ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual  TCollection_AsciiString

@return the model units string.") GetModelUnits;
		virtual const TCollection_AsciiString & GetModelUnits ();
		%feature("autodoc", "Args:
	theUnits(TCollection_AsciiString)

Returns:
	virtual void

No detailed docstring for this function.") SetDisplayUnits;
		virtual void SetDisplayUnits (const TCollection_AsciiString & theUnits);
		%feature("autodoc", "Args:
	theUnits(TCollection_AsciiString)

Returns:
	virtual void

No detailed docstring for this function.") SetModelUnits;
		virtual void SetModelUnits (const TCollection_AsciiString & theUnits);
		%feature("autodoc", "Args:
	theTextPos(gp_Pnt)

Returns:
	virtual void

No detailed docstring for this function.") SetTextPosition;
		virtual void SetTextPosition (const gp_Pnt & theTextPos);
		%feature("autodoc", "Args:
	None
Returns:
	virtual  gp_Pnt

No detailed docstring for this function.") GetTextPosition;
		virtual const gp_Pnt GetTextPosition ();
};


%feature("shadow") AIS_DiameterDimension::~AIS_DiameterDimension %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend AIS_DiameterDimension {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor AIS_EllipseRadiusDimension;
class AIS_EllipseRadiusDimension : public AIS_Relation {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	virtual AIS_KindOfDimension

No detailed docstring for this function.") KindOfDimension;
		virtual AIS_KindOfDimension KindOfDimension ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual Standard_Boolean

No detailed docstring for this function.") IsMovable;
		virtual Standard_Boolean IsMovable ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") ComputeGeometry;
		void ComputeGeometry ();
};


%feature("shadow") AIS_EllipseRadiusDimension::~AIS_EllipseRadiusDimension %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend AIS_EllipseRadiusDimension {
	void _kill_pointed() {
		delete $self;
	}
};
%extend AIS_EllipseRadiusDimension {
	Handle_AIS_EllipseRadiusDimension GetHandle() {
	return *(Handle_AIS_EllipseRadiusDimension*) &$self;
	}
};

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
    AIS_EllipseRadiusDimension* GetObject() {
    return (AIS_EllipseRadiusDimension*)$self->Access();
    }
};
%feature("shadow") Handle_AIS_EllipseRadiusDimension::~Handle_AIS_EllipseRadiusDimension %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_AIS_EllipseRadiusDimension {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor AIS_EqualDistanceRelation;
class AIS_EqualDistanceRelation : public AIS_Relation {
	public:
		%feature("autodoc", "Args:
	aShape1(TopoDS_Shape)
	aShape2(TopoDS_Shape)
	aShape3(TopoDS_Shape)
	aShape4(TopoDS_Shape)
	aPlane(Handle_Geom_Plane)

Returns:
	None

Constructs a framework to display equivalent  
distances between the shapes aShape1, aShape2,  
aShape3, aShape4 and the plane aPlane.  
The distance is the length of a projection from the  
shape to the plane.") AIS_EqualDistanceRelation;
		 AIS_EqualDistanceRelation (const TopoDS_Shape & aShape1,const TopoDS_Shape & aShape2,const TopoDS_Shape & aShape3,const TopoDS_Shape & aShape4,const Handle_Geom_Plane & aPlane);
		%feature("autodoc", "Args:
	aShape(TopoDS_Shape)

Returns:
	None

Sets the shape aShape to be used as the shape  
aShape3 in the framework created at construction time.") SetShape3;
		void SetShape3 (const TopoDS_Shape & aShape);
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Shape

Returns the shape aShape3 from the framework  
created at construction time.") Shape3;
		const TopoDS_Shape & Shape3 ();
		%feature("autodoc", "Args:
	aShape(TopoDS_Shape)

Returns:
	None

Sets the shape aShape to be used as the shape  
aShape4 in the framework created at construction time.") SetShape4;
		void SetShape4 (const TopoDS_Shape & aShape);
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Shape

Returns the shape aShape4 from the framework  
created at construction time.") Shape4;
		const TopoDS_Shape & Shape4 ();
		%feature("autodoc", "Args:
	aProjector(Handle_Prs3d_Projector)
	aTrsf(Handle_Geom_Transformation)
	aPresentation(Handle_Prs3d_Presentation)

Returns:
	virtual void

Computes the presentation according to a point of view  
         given by <aProjector>.  
         To be Used when the associated degenerated Presentations  
         have been transformed by <aTrsf> which is not a Pure  
         Translation. The HLR Prs can't be deducted automatically  
         WARNING :<aTrsf> must be applied  
          to the object to display before computation  !!!") Compute;
		virtual void Compute (const Handle_Prs3d_Projector & aProjector,const Handle_Geom_Transformation & aTrsf,const Handle_Prs3d_Presentation & aPresentation);
		%feature("autodoc", "Args:
	aPresentation(Handle_Prs3d_Presentation)
	aDrawer(Handle_AIS_Drawer)
	ArrowSize(Standard_Real)
	FirstEdge(TopoDS_Edge)
	SecondEdge(TopoDS_Edge)
	Plane(Handle_Geom_Plane)
	AutomaticPos(Standard_Boolean)
	IsSetBndBox(Standard_Boolean)
	BndBox(Bnd_Box)
	Position(gp_Pnt)
	FirstAttach(gp_Pnt)
	SecondAttach(gp_Pnt)
	FirstExtreme(gp_Pnt)
	SecondExtreme(gp_Pnt)
	SymbolPrs(DsgPrs_ArrowSide)

Returns:
	static void

Computes the location of an intreval between  
         between two edges. FirstAttach , SecondAttach  
         are the returned extreme points of the interval.") ComputeTwoEdgesLength;
		static void ComputeTwoEdgesLength (const Handle_Prs3d_Presentation & aPresentation,const Handle_AIS_Drawer & aDrawer,const Standard_Real ArrowSize,const TopoDS_Edge & FirstEdge,const TopoDS_Edge & SecondEdge,const Handle_Geom_Plane & Plane,const Standard_Boolean AutomaticPos,const Standard_Boolean IsSetBndBox,const Bnd_Box & BndBox,gp_Pnt & Position,gp_Pnt & FirstAttach,gp_Pnt & SecondAttach,gp_Pnt & FirstExtreme,gp_Pnt & SecondExtreme,DsgPrs_ArrowSide & SymbolPrs);
		%feature("autodoc", "Args:
	aPresentation(Handle_Prs3d_Presentation)
	aDrawer(Handle_AIS_Drawer)
	ArrowSize(Standard_Real)
	FirstVertex(TopoDS_Vertex)
	SecondVertex(TopoDS_Vertex)
	Plane(Handle_Geom_Plane)
	AutomaticPos(Standard_Boolean)
	IsSetBndBox(Standard_Boolean)
	BndBox(Bnd_Box)
	TypeDist(AIS_TypeOfDist)
	Position(gp_Pnt)
	FirstAttach(gp_Pnt)
	SecondAttach(gp_Pnt)
	FirstExtreme(gp_Pnt)
	SecondExtreme(gp_Pnt)
	SymbolPrs(DsgPrs_ArrowSide)

Returns:
	static void

Computes the interval position between two vertexs. FirstAttach,  
         SecondAttach are the returned extreme points of the interval.") ComputeTwoVerticesLength;
		static void ComputeTwoVerticesLength (const Handle_Prs3d_Presentation & aPresentation,const Handle_AIS_Drawer & aDrawer,const Standard_Real ArrowSize,const TopoDS_Vertex & FirstVertex,const TopoDS_Vertex & SecondVertex,const Handle_Geom_Plane & Plane,const Standard_Boolean AutomaticPos,const Standard_Boolean IsSetBndBox,const Bnd_Box & BndBox,const AIS_TypeOfDist TypeDist,gp_Pnt & Position,gp_Pnt & FirstAttach,gp_Pnt & SecondAttach,gp_Pnt & FirstExtreme,gp_Pnt & SecondExtreme,DsgPrs_ArrowSide & SymbolPrs);
		%feature("autodoc", "Args:
	aPresentation(Handle_Prs3d_Presentation)
	aDrawer(Handle_AIS_Drawer)
	ArrowSize(Standard_Real)
	FirstShape(TopoDS_Shape)
	SecondShape(TopoDS_Shape)
	Plane(Handle_Geom_Plane)
	AutomaticPos(Standard_Boolean)
	IsSetBndBox(Standard_Boolean)
	BndBox(Bnd_Box)
	Position(gp_Pnt)
	FirstAttach(gp_Pnt)
	SecondAttach(gp_Pnt)
	FirstExtreme(gp_Pnt)
	SecondExtreme(gp_Pnt)
	SymbolPrs(DsgPrs_ArrowSide)

Returns:
	static void

Compute the interval location between a vertex and an edge. Edge may be  
         a line or a circle.") ComputeOneEdgeOneVertexLength;
		static void ComputeOneEdgeOneVertexLength (const Handle_Prs3d_Presentation & aPresentation,const Handle_AIS_Drawer & aDrawer,const Standard_Real ArrowSize,const TopoDS_Shape & FirstShape,const TopoDS_Shape & SecondShape,const Handle_Geom_Plane & Plane,const Standard_Boolean AutomaticPos,const Standard_Boolean IsSetBndBox,const Bnd_Box & BndBox,gp_Pnt & Position,gp_Pnt & FirstAttach,gp_Pnt & SecondAttach,gp_Pnt & FirstExtreme,gp_Pnt & SecondExtreme,DsgPrs_ArrowSide & SymbolPrs);
};


%feature("shadow") AIS_EqualDistanceRelation::~AIS_EqualDistanceRelation %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend AIS_EqualDistanceRelation {
	void _kill_pointed() {
		delete $self;
	}
};
%extend AIS_EqualDistanceRelation {
	Handle_AIS_EqualDistanceRelation GetHandle() {
	return *(Handle_AIS_EqualDistanceRelation*) &$self;
	}
};

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
    AIS_EqualDistanceRelation* GetObject() {
    return (AIS_EqualDistanceRelation*)$self->Access();
    }
};
%feature("shadow") Handle_AIS_EqualDistanceRelation::~Handle_AIS_EqualDistanceRelation %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_AIS_EqualDistanceRelation {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor AIS_EqualRadiusRelation;
class AIS_EqualRadiusRelation : public AIS_Relation {
	public:
		%feature("autodoc", "Args:
	aFirstEdge(TopoDS_Edge)
	aSecondEdge(TopoDS_Edge)
	aPlane(Handle_Geom_Plane)

Returns:
	None

Creates equal relation of two arc's radiuses.  
         If one of edges is not in the given plane,  
//!	        the presentation method projects it onto the plane.") AIS_EqualRadiusRelation;
		 AIS_EqualRadiusRelation (const TopoDS_Edge & aFirstEdge,const TopoDS_Edge & aSecondEdge,const Handle_Geom_Plane & aPlane);
		%feature("autodoc", "Args:
	aProjector(Handle_Prs3d_Projector)
	aTrsf(Handle_Geom_Transformation)
	aPresentation(Handle_Prs3d_Presentation)

Returns:
	virtual void

computes the presentation according to a point of view  
         given by <aProjector>.  
         To be Used when the associated degenerated Presentations  
         have been transformed by <aTrsf> which is not a Pure  
         Translation. The HLR Prs can't be deducted automatically  
         WARNING :<aTrsf> must be applied  
         to the object to display before computation  !!!") Compute;
		virtual void Compute (const Handle_Prs3d_Projector & aProjector,const Handle_Geom_Transformation & aTrsf,const Handle_Prs3d_Presentation & aPresentation);
};


%feature("shadow") AIS_EqualRadiusRelation::~AIS_EqualRadiusRelation %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend AIS_EqualRadiusRelation {
	void _kill_pointed() {
		delete $self;
	}
};
%extend AIS_EqualRadiusRelation {
	Handle_AIS_EqualRadiusRelation GetHandle() {
	return *(Handle_AIS_EqualRadiusRelation*) &$self;
	}
};

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
    AIS_EqualRadiusRelation* GetObject() {
    return (AIS_EqualRadiusRelation*)$self->Access();
    }
};
%feature("shadow") Handle_AIS_EqualRadiusRelation::~Handle_AIS_EqualRadiusRelation %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_AIS_EqualRadiusRelation {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor AIS_FixRelation;
class AIS_FixRelation : public AIS_Relation {
	public:
		%feature("autodoc", "Args:
	aShape(TopoDS_Shape)
	aPlane(Handle_Geom_Plane)
	aWire(TopoDS_Wire)

Returns:
	None

initializes the vertex aShape, the  
  plane aPlane and the wire aWire, which connects  
  the two vertices in a fixed relation.") AIS_FixRelation;
		 AIS_FixRelation (const TopoDS_Shape & aShape,const Handle_Geom_Plane & aPlane,const TopoDS_Wire & aWire);
		%feature("autodoc", "Args:
	aShape(TopoDS_Shape)
	aPlane(Handle_Geom_Plane)
	aWire(TopoDS_Wire)
	aPosition(gp_Pnt)
	anArrowSize(Standard_Real)=0.01

Returns:
	None

initializes the vertex aShape, the  
  plane aPlane and the wire aWire, the position  
  aPosition, the arrow size anArrowSize and the  
wire aWire, which connects the two vertices in a fixed relation.") AIS_FixRelation;
		 AIS_FixRelation (const TopoDS_Shape & aShape,const Handle_Geom_Plane & aPlane,const TopoDS_Wire & aWire,const gp_Pnt & aPosition,const Standard_Real anArrowSize = 0.01);
		%feature("autodoc", "Args:
	aShape(TopoDS_Shape)
	aPlane(Handle_Geom_Plane)

Returns:
	None

initializes the edge aShape and the plane aPlane.") AIS_FixRelation;
		 AIS_FixRelation (const TopoDS_Shape & aShape,const Handle_Geom_Plane & aPlane);
		%feature("autodoc", "Args:
	aShape(TopoDS_Shape)
	aPlane(Handle_Geom_Plane)
	aPosition(gp_Pnt)
	anArrowSize(Standard_Real)=0.01

Returns:
	None

initializes the edge aShape, the  
  plane aPlane, the position aPosition and the arrow  
  size anArrowSize.") AIS_FixRelation;
		 AIS_FixRelation (const TopoDS_Shape & aShape,const Handle_Geom_Plane & aPlane,const gp_Pnt & aPosition,const Standard_Real anArrowSize = 0.01);
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Wire

Returns the wire which connects vertices in a fixed relation.") Wire;
		TopoDS_Wire Wire ();
		%feature("autodoc", "Args:
	aWire(TopoDS_Wire)

Returns:
	None

Constructs the wire aWire. This connects vertices  
which are in a fixed relation.") SetWire;
		void SetWire (const TopoDS_Wire & aWire);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns true if the Interactive Objects in the relation  
are movable.") IsMovable;
		Standard_Boolean IsMovable ();
		%feature("autodoc", "Args:
	aProjector(Handle_Prs3d_Projector)
	aTrsf(Handle_Geom_Transformation)
	aPresentation(Handle_Prs3d_Presentation)

Returns:
	virtual void

computes the presentation according to a point of view  
         given by <aProjector>.  
         To be Used when the associated degenerated Presentations  
         have been transformed by <aTrsf> which is not a Pure  
         Translation. The HLR Prs can't be deducted automatically  
         WARNING :<aTrsf> must be applied  
          to the object to display before computation  !!!") Compute;
		virtual void Compute (const Handle_Prs3d_Projector & aProjector,const Handle_Geom_Transformation & aTrsf,const Handle_Prs3d_Presentation & aPresentation);
};


%feature("shadow") AIS_FixRelation::~AIS_FixRelation %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend AIS_FixRelation {
	void _kill_pointed() {
		delete $self;
	}
};
%extend AIS_FixRelation {
	Handle_AIS_FixRelation GetHandle() {
	return *(Handle_AIS_FixRelation*) &$self;
	}
};

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
    AIS_FixRelation* GetObject() {
    return (AIS_FixRelation*)$self->Access();
    }
};
%feature("shadow") Handle_AIS_FixRelation::~Handle_AIS_FixRelation %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_AIS_FixRelation {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor AIS_IdenticRelation;
class AIS_IdenticRelation : public AIS_Relation {
	public:
		%feature("autodoc", "Args:
	FirstShape(TopoDS_Shape)
	SecondShape(TopoDS_Shape)
	aPlane(Handle_Geom_Plane)

Returns:
	None

Initializes the relation of identity between the two  
entities, FirstShape and SecondShape. The plane  
aPlane is initialized in case a visual reference is  
needed to show identity.") AIS_IdenticRelation;
		 AIS_IdenticRelation (const TopoDS_Shape & FirstShape,const TopoDS_Shape & SecondShape,const Handle_Geom_Plane & aPlane);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns true if the interactive object is movable.") IsMovable;
		Standard_Boolean IsMovable ();
		%feature("autodoc", "Args:
	aProjector(Handle_Prs3d_Projector)
	aTrsf(Handle_Geom_Transformation)
	aPresentation(Handle_Prs3d_Presentation)

Returns:
	virtual void

computes the presentation according to a point of view  
         given by <aProjector>.  
         To be Used when the associated degenerated Presentations  
         have been transformed by <aTrsf> which is not a Pure  
         Translation. The HLR Prs can't be deducted automatically  
         WARNING :<aTrsf> must be applied  
          to the object to display before computation  !!!") Compute;
		virtual void Compute (const Handle_Prs3d_Projector & aProjector,const Handle_Geom_Transformation & aTrsf,const Handle_Prs3d_Presentation & aPresentation);
};


%feature("shadow") AIS_IdenticRelation::~AIS_IdenticRelation %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend AIS_IdenticRelation {
	void _kill_pointed() {
		delete $self;
	}
};
%extend AIS_IdenticRelation {
	Handle_AIS_IdenticRelation GetHandle() {
	return *(Handle_AIS_IdenticRelation*) &$self;
	}
};

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
    AIS_IdenticRelation* GetObject() {
    return (AIS_IdenticRelation*)$self->Access();
    }
};
%feature("shadow") Handle_AIS_IdenticRelation::~Handle_AIS_IdenticRelation %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_AIS_IdenticRelation {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor AIS_LengthDimension;
class AIS_LengthDimension : public AIS_Dimension {
	public:
		%feature("autodoc", "Args:
	theFace(TopoDS_Face)
	theEdge(TopoDS_Edge)

Returns:
	None

Construct length dimension between face and edge.
Here dimension can be built without user-defined plane.
@param theFace [in] the face (first shape).
@param theEdge [in] the edge (second shape).") AIS_LengthDimension;
		 AIS_LengthDimension (const TopoDS_Face & theFace,const TopoDS_Edge & theEdge);
		%feature("autodoc", "Args:
	theFirstFace(TopoDS_Face)
	theSecondFace(TopoDS_Face)

Returns:
	None

Construct length dimension between two faces.
@param theFirstFace [in] the first face (first shape).
@param theSecondFace [in] the second face (second shape).") AIS_LengthDimension;
		 AIS_LengthDimension (const TopoDS_Face & theFirstFace,const TopoDS_Face & theSecondFace);
		%feature("autodoc", "Args:
	theFirstPoint(gp_Pnt)
	theSecondPoint(gp_Pnt)
	thePlane(gp_Pln)

Returns:
	None

Construct length dimension between two points in
the specified plane.
@param theFirstPoint [in] the first point.
@param theSecondPoint [in] the second point.
@param thePlane [in] the plane to orient dimension.") AIS_LengthDimension;
		 AIS_LengthDimension (const gp_Pnt & theFirstPoint,const gp_Pnt & theSecondPoint,const gp_Pln & thePlane);
		%feature("autodoc", "Args:
	theFirstShape(TopoDS_Shape)
	theSecondShape(TopoDS_Shape)
	thePlane(gp_Pln)

Returns:
	None

Construct length dimension between two arbitrary shapes in
the specified plane.
@param theFirstShape [in] the first shape.
@param theSecondShape [in] the second shape.
@param thePlane [in] the plane to orient dimension.") AIS_LengthDimension;
		 AIS_LengthDimension (const TopoDS_Shape & theFirstShape,const TopoDS_Shape & theSecondShape,const gp_Pln & thePlane);
		%feature("autodoc", "Args:
	theEdge(TopoDS_Edge)
	thePlane(gp_Pln)

Returns:
	None

Construct length dimension of linear edge.
@param theEdge [in] the edge to measure.
@param thePlane [in] the plane to orient dimension.") AIS_LengthDimension;
		 AIS_LengthDimension (const TopoDS_Edge & theEdge,const gp_Pln & thePlane);
		%feature("autodoc", "Args:
	None
Returns:
	gp_Pnt

@return first attachement point.") FirstPoint;
		const gp_Pnt & FirstPoint ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Pnt

@return second attachement point.") SecondPoint;
		const gp_Pnt & SecondPoint ();
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Shape

@return first attachement shape.") FirstShape;
		const TopoDS_Shape & FirstShape ();
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Shape

@return second attachement shape.") SecondShape;
		const TopoDS_Shape & SecondShape ();
		%feature("autodoc", "Args:
	theFirstPoint(gp_Pnt)
	theSecondPoint(gp_Pnt)
	thePlane(gp_Pln)

Returns:
	None

Measure distance between two points.
The dimension will become invalid if the new distance between
attachement points is less than Precision::Confusion().
@param theFirstPoint [in] the first point.
@param theSecondPoint [in] the second point.
@param thePlane [in] the user-defined plane") SetMeasuredGeometry;
		void SetMeasuredGeometry (const gp_Pnt & theFirstPoint,const gp_Pnt & theSecondPoint,const gp_Pln & thePlane);
		%feature("autodoc", "Args:
	theEdge(TopoDS_Edge)
	thePlane(gp_Pln)

Returns:
	None

Measure length of edge.
The dimension will become invalid if the new length of edge
is less than Precision::Confusion().
@param theEdge [in] the edge to measure.
@param thePlane [in] the user-defined plane") SetMeasuredGeometry;
		void SetMeasuredGeometry (const TopoDS_Edge & theEdge,const gp_Pln & thePlane);
		%feature("autodoc", "Args:
	theFirstFace(TopoDS_Face)
	theSecondFace(TopoDS_Face)

Returns:
	None

Measure distance between two faces.
The dimension will become invalid if the distance can not
be measured or it is less than Precision::Confusion().
@param theFirstFace [in] the first face (first shape).
@param theSecondFace [in] the second face (second shape).") SetMeasuredGeometry;
		void SetMeasuredGeometry (const TopoDS_Face & theFirstFace,const TopoDS_Face & theSecondFace);
		%feature("autodoc", "Args:
	theFace(TopoDS_Face)
	theEdge(TopoDS_Edge)

Returns:
	None

Measure distance between face and edge.
The dimension will become invalid if the distance can not
be measured or it is less than Precision::Confusion().
@param theFace [in] the face (first shape).
@param theEdge [in] the edge (second shape).") SetMeasuredGeometry;
		void SetMeasuredGeometry (const TopoDS_Face & theFace,const TopoDS_Edge & theEdge);
		%feature("autodoc", "Args:
	theFirstShape(TopoDS_Shape)
	theSecondShape(TopoDS_Shape)

Returns:
	None

Measure distance between generic pair of shapes (edges, vertices, length),
where measuring is applicable.
@param theFirstShape [in] the first shape.
@param theSecondShape [in] the second shape.") SetMeasuredShapes;
		void SetMeasuredShapes (const TopoDS_Shape & theFirstShape,const TopoDS_Shape & theSecondShape);
		%feature("autodoc", "Args:
	None
Returns:
	virtual  TCollection_AsciiString

@return the display units string.") GetDisplayUnits;
		virtual const TCollection_AsciiString & GetDisplayUnits ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual  TCollection_AsciiString

@return the model units string.") GetModelUnits;
		virtual const TCollection_AsciiString & GetModelUnits ();
		%feature("autodoc", "Args:
	theUnits(TCollection_AsciiString)

Returns:
	virtual void

No detailed docstring for this function.") SetDisplayUnits;
		virtual void SetDisplayUnits (const TCollection_AsciiString & theUnits);
		%feature("autodoc", "Args:
	theUnits(TCollection_AsciiString)

Returns:
	virtual void

No detailed docstring for this function.") SetModelUnits;
		virtual void SetModelUnits (const TCollection_AsciiString & theUnits);
		%feature("autodoc", "Args:
	theTextPos(gp_Pnt)

Returns:
	virtual void

No detailed docstring for this function.") SetTextPosition;
		virtual void SetTextPosition (const gp_Pnt & theTextPos);
		%feature("autodoc", "Args:
	None
Returns:
	virtual  gp_Pnt

No detailed docstring for this function.") GetTextPosition;
		virtual const gp_Pnt GetTextPosition ();
};


%feature("shadow") AIS_LengthDimension::~AIS_LengthDimension %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend AIS_LengthDimension {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor AIS_MidPointRelation;
class AIS_MidPointRelation : public AIS_Relation {
	public:
		%feature("autodoc", "Args:
	aSymmTool(TopoDS_Shape)
	FirstShape(TopoDS_Shape)
	SecondShape(TopoDS_Shape)
	aPlane(Handle_Geom_Plane)

Returns:
	None

No detailed docstring for this function.") AIS_MidPointRelation;
		 AIS_MidPointRelation (const TopoDS_Shape & aSymmTool,const TopoDS_Shape & FirstShape,const TopoDS_Shape & SecondShape,const Handle_Geom_Plane & aPlane);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsMovable;
		Standard_Boolean IsMovable ();
		%feature("autodoc", "Args:
	aMidPointTool(TopoDS_Shape)

Returns:
	None

No detailed docstring for this function.") SetTool;
		void SetTool (const TopoDS_Shape & aMidPointTool);
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Shape

No detailed docstring for this function.") GetTool;
		const TopoDS_Shape & GetTool ();
		%feature("autodoc", "Args:
	aProjector(Handle_Prs3d_Projector)
	aTrsf(Handle_Geom_Transformation)
	aPresentation(Handle_Prs3d_Presentation)

Returns:
	virtual void

Computes the presentation according to a point of view  
         given by <aProjector>.  
         To be Used when the associated degenerated Presentations  
         have been transformed by <aTrsf> which is not a Pure  
         Translation. The HLR Prs can't be deducted automatically  
         WARNING :<aTrsf> must be applied  
          to the object to display before computation  !!!") Compute;
		virtual void Compute (const Handle_Prs3d_Projector & aProjector,const Handle_Geom_Transformation & aTrsf,const Handle_Prs3d_Presentation & aPresentation);
};


%feature("shadow") AIS_MidPointRelation::~AIS_MidPointRelation %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend AIS_MidPointRelation {
	void _kill_pointed() {
		delete $self;
	}
};
%extend AIS_MidPointRelation {
	Handle_AIS_MidPointRelation GetHandle() {
	return *(Handle_AIS_MidPointRelation*) &$self;
	}
};

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
    AIS_MidPointRelation* GetObject() {
    return (AIS_MidPointRelation*)$self->Access();
    }
};
%feature("shadow") Handle_AIS_MidPointRelation::~Handle_AIS_MidPointRelation %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_AIS_MidPointRelation {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor AIS_MultipleConnectedShape;
class AIS_MultipleConnectedShape : public AIS_MultipleConnectedInteractive {
	public:
		%feature("autodoc", "Args:
	aShape(TopoDS_Shape)

Returns:
	None

Initializes the shape aShape, a multiple connected  
Interactive Object grouping different  
projector-dependent representations of an entity.") AIS_MultipleConnectedShape;
		 AIS_MultipleConnectedShape (const TopoDS_Shape & aShape);
		%feature("autodoc", "Args:
	None
Returns:
	virtual AIS_KindOfInteractive

No detailed docstring for this function.") Type;
		virtual AIS_KindOfInteractive Type ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual Standard_Integer

No detailed docstring for this function.") Signature;
		virtual Standard_Integer Signature ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual Standard_Boolean

Returns true is shape decomposition is accepted.") AcceptShapeDecomposition;
		virtual Standard_Boolean AcceptShapeDecomposition ();
		%feature("autodoc", "Args:
	ashap(TopoDS_Shape)

Returns:
	None

Constructs the reference shape ashap.") Set;
		void Set (const TopoDS_Shape & ashap);
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Shape

Returns the shape which is constructed in Set.") Shape;
		const TopoDS_Shape & Shape ();
};


%feature("shadow") AIS_MultipleConnectedShape::~AIS_MultipleConnectedShape %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend AIS_MultipleConnectedShape {
	void _kill_pointed() {
		delete $self;
	}
};
%extend AIS_MultipleConnectedShape {
	Handle_AIS_MultipleConnectedShape GetHandle() {
	return *(Handle_AIS_MultipleConnectedShape*) &$self;
	}
};

%nodefaultctor Handle_AIS_MultipleConnectedShape;
class Handle_AIS_MultipleConnectedShape : public Handle_AIS_MultipleConnectedInteractive {

    public:
        // constructors
        Handle_AIS_MultipleConnectedShape();
        Handle_AIS_MultipleConnectedShape(const Handle_AIS_MultipleConnectedShape &aHandle);
        Handle_AIS_MultipleConnectedShape(const AIS_MultipleConnectedShape *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_AIS_MultipleConnectedShape DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_AIS_MultipleConnectedShape {
    AIS_MultipleConnectedShape* GetObject() {
    return (AIS_MultipleConnectedShape*)$self->Access();
    }
};
%feature("shadow") Handle_AIS_MultipleConnectedShape::~Handle_AIS_MultipleConnectedShape %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_AIS_MultipleConnectedShape {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor AIS_OffsetDimension;
class AIS_OffsetDimension : public AIS_Relation {
	public:
		%feature("autodoc", "Args:
	FistShape(TopoDS_Shape)
	SecondShape(TopoDS_Shape)
	aVal(Standard_Real)
	aText(TCollection_ExtendedString)

Returns:
	None

Constructs the offset display object defined by the  
first shape aFShape, the second shape aSShape, the  
dimension aVal, and the text aText.") AIS_OffsetDimension;
		 AIS_OffsetDimension (const TopoDS_Shape & FistShape,const TopoDS_Shape & SecondShape,const Standard_Real aVal,const TCollection_ExtendedString & aText);
		%feature("autodoc", "Args:
	aProjector(Handle_Prs3d_Projector)
	aTrsf(Handle_Geom_Transformation)
	aPresentation(Handle_Prs3d_Presentation)

Returns:
	virtual void

computes the presentation according to a point of view  
         given by <aProjector>.  
         To be Used when the associated degenerated Presentations  
         have been transformed by <aTrsf> which is not a Pure  
         Translation. The HLR Prs can't be deducted automatically  
         WARNING :<aTrsf> must be applied  
          to the object to display before computation  !!!") Compute;
		virtual void Compute (const Handle_Prs3d_Projector & aProjector,const Handle_Geom_Transformation & aTrsf,const Handle_Prs3d_Presentation & aPresentation);
		%feature("autodoc", "Args:
	None
Returns:
	AIS_KindOfDimension

Indicates that the dimension we are concerned with is an offset.") KindOfDimension;
		AIS_KindOfDimension KindOfDimension ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns true if the offset datum is movable.") IsMovable;
		Standard_Boolean IsMovable ();
		%feature("autodoc", "Args:
	aTrsf(gp_Trsf)

Returns:
	None

Sets a transformation aTrsf for presentation and  
selection to a relative position.") SetRelativePos;
		void SetRelativePos (const gp_Trsf & aTrsf);
};


%feature("shadow") AIS_OffsetDimension::~AIS_OffsetDimension %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend AIS_OffsetDimension {
	void _kill_pointed() {
		delete $self;
	}
};
%extend AIS_OffsetDimension {
	Handle_AIS_OffsetDimension GetHandle() {
	return *(Handle_AIS_OffsetDimension*) &$self;
	}
};

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
    AIS_OffsetDimension* GetObject() {
    return (AIS_OffsetDimension*)$self->Access();
    }
};
%feature("shadow") Handle_AIS_OffsetDimension::~Handle_AIS_OffsetDimension %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_AIS_OffsetDimension {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor AIS_ParallelRelation;
class AIS_ParallelRelation : public AIS_Relation {
	public:
		%feature("autodoc", "Args:
	aFShape(TopoDS_Shape)
	aSShape(TopoDS_Shape)
	aPlane(Handle_Geom_Plane)

Returns:
	None

Constructs an object to display parallel constraints.  
This object is defined by the first shape aFShape and  
the second shape aSShape and the plane aPlane.") AIS_ParallelRelation;
		 AIS_ParallelRelation (const TopoDS_Shape & aFShape,const TopoDS_Shape & aSShape,const Handle_Geom_Plane & aPlane);
		%feature("autodoc", "Args:
	aFShape(TopoDS_Shape)
	aSShape(TopoDS_Shape)
	aPlane(Handle_Geom_Plane)
	aPosition(gp_Pnt)
	aSymbolPrs(DsgPrs_ArrowSide)
	anArrowSize(Standard_Real)=0.01

Returns:
	None

Constructs an object to display parallel constraints.  
This object is defined by the first shape aFShape and  
the second shape aSShape the plane aPlane, the  
position aPosition, the type of arrow, aSymbolPrs and  
its size anArrowSize.") AIS_ParallelRelation;
		 AIS_ParallelRelation (const TopoDS_Shape & aFShape,const TopoDS_Shape & aSShape,const Handle_Geom_Plane & aPlane,const gp_Pnt & aPosition,const DsgPrs_ArrowSide aSymbolPrs,const Standard_Real anArrowSize = 0.01);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns true if the parallelism is movable.") IsMovable;
		Standard_Boolean IsMovable ();
		%feature("autodoc", "Args:
	aProjector(Handle_Prs3d_Projector)
	aTrsf(Handle_Geom_Transformation)
	aPresentation(Handle_Prs3d_Presentation)

Returns:
	virtual void

computes the presentation according to a point of view  
         given by <aProjector>.  
         To be Used when the associated degenerated Presentations  
         have been transformed by <aTrsf> which is not a Pure  
         Translation. The HLR Prs can't be deducted automatically  
         WARNING :<aTrsf> must be applied  
          to the object to display before computation  !!!") Compute;
		virtual void Compute (const Handle_Prs3d_Projector & aProjector,const Handle_Geom_Transformation & aTrsf,const Handle_Prs3d_Presentation & aPresentation);
};


%feature("shadow") AIS_ParallelRelation::~AIS_ParallelRelation %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend AIS_ParallelRelation {
	void _kill_pointed() {
		delete $self;
	}
};
%extend AIS_ParallelRelation {
	Handle_AIS_ParallelRelation GetHandle() {
	return *(Handle_AIS_ParallelRelation*) &$self;
	}
};

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
    AIS_ParallelRelation* GetObject() {
    return (AIS_ParallelRelation*)$self->Access();
    }
};
%feature("shadow") Handle_AIS_ParallelRelation::~Handle_AIS_ParallelRelation %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_AIS_ParallelRelation {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor AIS_PerpendicularRelation;
class AIS_PerpendicularRelation : public AIS_Relation {
	public:
		%feature("autodoc", "Args:
	aFShape(TopoDS_Shape)
	aSShape(TopoDS_Shape)
	aPlane(Handle_Geom_Plane)

Returns:
	None

Constructs an object to display constraints of  
perpendicularity on shapes.  
This object is defined by a first shape aFShape, a  
second shape aSShape, and a plane aPlane.  
aPlane is the plane of reference to show and test the  
perpendicular relation between two shapes, at least  
one of which has a revolved surface.") AIS_PerpendicularRelation;
		 AIS_PerpendicularRelation (const TopoDS_Shape & aFShape,const TopoDS_Shape & aSShape,const Handle_Geom_Plane & aPlane);
		%feature("autodoc", "Args:
	aFShape(TopoDS_Shape)
	aSShape(TopoDS_Shape)

Returns:
	None

Constructs an object to display constraints of  
perpendicularity on shapes.  
This object is defined by a first shape aFShape and a  
second shape aSShape.") AIS_PerpendicularRelation;
		 AIS_PerpendicularRelation (const TopoDS_Shape & aFShape,const TopoDS_Shape & aSShape);
		%feature("autodoc", "Args:
	aProjector(Handle_Prs3d_Projector)
	aTrsf(Handle_Geom_Transformation)
	aPresentation(Handle_Prs3d_Presentation)

Returns:
	virtual void

computes the presentation according to a point of view  
         given by <aProjector>.  
         To be Used when the associated degenerated Presentations  
         have been transformed by <aTrsf> which is not a Pure  
         Translation. The HLR Prs can't be deducted automatically  
         WARNING :<aTrsf> must be applied  
          to the object to display before computation  !!!") Compute;
		virtual void Compute (const Handle_Prs3d_Projector & aProjector,const Handle_Geom_Transformation & aTrsf,const Handle_Prs3d_Presentation & aPresentation);
};


%feature("shadow") AIS_PerpendicularRelation::~AIS_PerpendicularRelation %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend AIS_PerpendicularRelation {
	void _kill_pointed() {
		delete $self;
	}
};
%extend AIS_PerpendicularRelation {
	Handle_AIS_PerpendicularRelation GetHandle() {
	return *(Handle_AIS_PerpendicularRelation*) &$self;
	}
};

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
    AIS_PerpendicularRelation* GetObject() {
    return (AIS_PerpendicularRelation*)$self->Access();
    }
};
%feature("shadow") Handle_AIS_PerpendicularRelation::~Handle_AIS_PerpendicularRelation %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_AIS_PerpendicularRelation {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor AIS_RadiusDimension;
class AIS_RadiusDimension : public AIS_Dimension {
	public:
		%feature("autodoc", "Args:
	theCircle(gp_Circ)

Returns:
	None

Create radius dimension for the circle geometry.
@param theCircle [in] the circle to measure.") AIS_RadiusDimension;
		 AIS_RadiusDimension (const gp_Circ & theCircle);
		%feature("autodoc", "Args:
	theCircle(gp_Circ)
	theAnchorPoint(gp_Pnt)

Returns:
	None

Create radius dimension for the circle geometry and define its
orientation by location of the first point on that circle.
@param theCircle [in] the circle to measure.
@param theAnchorPoint [in] the point to define the position
       of the dimension attachment on the circle.") AIS_RadiusDimension;
		 AIS_RadiusDimension (const gp_Circ & theCircle,const gp_Pnt & theAnchorPoint);
		%feature("autodoc", "Args:
	theShape(TopoDS_Shape)

Returns:
	None

Create radius dimension for the arbitrary shape (if possible).
@param theShape [in] the shape to measure.") AIS_RadiusDimension;
		 AIS_RadiusDimension (const TopoDS_Shape & theShape);
		%feature("autodoc", "Args:
	None
Returns:
	gp_Circ

@return measured geometry circle.") Circle;
		const gp_Circ & Circle ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Pnt

@return anchor point on circle for radius dimension.") AnchorPoint;
		const gp_Pnt & AnchorPoint ();
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Shape

@return the measured shape.") Shape;
		const TopoDS_Shape & Shape ();
		%feature("autodoc", "Args:
	theCircle(gp_Circ)

Returns:
	None

Measure radius of the circle.
The dimension will become invalid if the radius of the circle
is less than Precision::Confusion().
@param theCircle [in] the circle to measure.") SetMeasuredGeometry;
		void SetMeasuredGeometry (const gp_Circ & theCircle);
		%feature("autodoc", "Args:
	theCircle(gp_Circ)
	theAnchorPoint(gp_Pnt)

Returns:
	None

Measure radius of the circle and orient the dimension so
the dimension lines attaches to anchor point on the circle.
The dimension will become invalid if the radius of the circle
is less than Precision::Confusion().
@param theCircle [in] the circle to measure.
@param theAnchorPoint [in] the point to attach the dimension lines.") SetMeasuredGeometry;
		void SetMeasuredGeometry (const gp_Circ & theCircle,const gp_Pnt & theAnchorPoint);
		%feature("autodoc", "Args:
	theShape(TopoDS_Shape)

Returns:
	None

Measure radius on the passed shape, if applicable.
The dimension will become invalid if the passed shape is not
measurable or if measured diameter value is less than Precision::Confusion().
@param theShape [in] the shape to measure.") SetMeasuredGeometry;
		void SetMeasuredGeometry (const TopoDS_Shape & theShape);
		%feature("autodoc", "Args:
	None
Returns:
	virtual  TCollection_AsciiString

@return the display units string.") GetDisplayUnits;
		virtual const TCollection_AsciiString & GetDisplayUnits ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual  TCollection_AsciiString

@return the model units string.") GetModelUnits;
		virtual const TCollection_AsciiString & GetModelUnits ();
		%feature("autodoc", "Args:
	theUnits(TCollection_AsciiString)

Returns:
	virtual void

No detailed docstring for this function.") SetDisplayUnits;
		virtual void SetDisplayUnits (const TCollection_AsciiString & theUnits);
		%feature("autodoc", "Args:
	theUnits(TCollection_AsciiString)

Returns:
	virtual void

No detailed docstring for this function.") SetModelUnits;
		virtual void SetModelUnits (const TCollection_AsciiString & theUnits);
		%feature("autodoc", "Args:
	theTextPos(gp_Pnt)

Returns:
	virtual void

No detailed docstring for this function.") SetTextPosition;
		virtual void SetTextPosition (const gp_Pnt & theTextPos);
		%feature("autodoc", "Args:
	None
Returns:
	virtual  gp_Pnt

No detailed docstring for this function.") GetTextPosition;
		virtual const gp_Pnt GetTextPosition ();
};


%feature("shadow") AIS_RadiusDimension::~AIS_RadiusDimension %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend AIS_RadiusDimension {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor AIS_SymmetricRelation;
class AIS_SymmetricRelation : public AIS_Relation {
	public:
		%feature("autodoc", "Args:
	aSymmTool(TopoDS_Shape)
	FirstShape(TopoDS_Shape)
	SecondShape(TopoDS_Shape)
	aPlane(Handle_Geom_Plane)

Returns:
	None

Constructs an object to display constraints of symmetricity.  
This object is defined by a tool aSymmTool, a first  
shape FirstShape, a second shape SecondShape, and a plane aPlane.  
aPlane serves as the axis of symmetry.  
aSymmTool is the shape composed of FirstShape  
SecondShape and aPlane. It may be queried and  
edited using the functions GetTool and SetTool.  
The two shapes are typically two edges, two vertices or two points.") AIS_SymmetricRelation;
		 AIS_SymmetricRelation (const TopoDS_Shape & aSymmTool,const TopoDS_Shape & FirstShape,const TopoDS_Shape & SecondShape,const Handle_Geom_Plane & aPlane);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns true if the symmetric constraint display is movable.") IsMovable;
		Standard_Boolean IsMovable ();
		%feature("autodoc", "Args:
	aSymmetricTool(TopoDS_Shape)

Returns:
	None

Sets the tool aSymmetricTool composed of a first  
shape, a second shape, and a plane.  
This tool is initially created at construction time.") SetTool;
		void SetTool (const TopoDS_Shape & aSymmetricTool);
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Shape

Returns the tool composed of a first shape, a second  
shape, and a plane. This tool is created at construction time.") GetTool;
		const TopoDS_Shape & GetTool ();
		%feature("autodoc", "Args:
	aProjector(Handle_Prs3d_Projector)
	aTrsf(Handle_Geom_Transformation)
	aPresentation(Handle_Prs3d_Presentation)

Returns:
	virtual void

computes the presentation according to a point of view  
         given by <aProjector>.  
         To be Used when the associated degenerated Presentations  
         have been transformed by <aTrsf> which is not a Pure  
         Translation. The HLR Prs can't be deducted automatically  
         WARNING :<aTrsf> must be applied  
          to the object to display before computation  !!!") Compute;
		virtual void Compute (const Handle_Prs3d_Projector & aProjector,const Handle_Geom_Transformation & aTrsf,const Handle_Prs3d_Presentation & aPresentation);
};


%feature("shadow") AIS_SymmetricRelation::~AIS_SymmetricRelation %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend AIS_SymmetricRelation {
	void _kill_pointed() {
		delete $self;
	}
};
%extend AIS_SymmetricRelation {
	Handle_AIS_SymmetricRelation GetHandle() {
	return *(Handle_AIS_SymmetricRelation*) &$self;
	}
};

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
    AIS_SymmetricRelation* GetObject() {
    return (AIS_SymmetricRelation*)$self->Access();
    }
};
%feature("shadow") Handle_AIS_SymmetricRelation::~Handle_AIS_SymmetricRelation %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_AIS_SymmetricRelation {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor AIS_TangentRelation;
class AIS_TangentRelation : public AIS_Relation {
	public:
		%feature("autodoc", "Args:
	aFShape(TopoDS_Shape)
	aSShape(TopoDS_Shape)
	aPlane(Handle_Geom_Plane)
	anExternRef(Standard_Integer)=0

Returns:
	None

TwoFacesTangent or TwoEdgesTangent relation  Constructs an object to display tangency constraints.  
This object is defined by the first shape aFShape, the  
second shape aSShape, the plane aPlane and the index anExternRef.  
aPlane serves as an optional axis.  
anExternRef set to 0 indicates that there is no relation.") AIS_TangentRelation;
		 AIS_TangentRelation (const TopoDS_Shape & aFShape,const TopoDS_Shape & aSShape,const Handle_Geom_Plane & aPlane,const Standard_Integer anExternRef = 0);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Returns the external reference for tangency.  
The values are as follows:  
-   0 - there is no connection;  
-   1 - there is a connection to the first shape;  
-   2 - there is a connection to the second shape.  
  This reference is defined at construction time.") ExternRef;
		Standard_Integer ExternRef ();
		%feature("autodoc", "Args:
	aRef(Standard_Integer)

Returns:
	None

Sets the external reference for tangency, aRef.  
The values are as follows:  
-   0 - there is no connection;  
-   1 - there is a connection to the first shape;  
-   2 - there is a connection to the second shape.  
This reference is initially defined at construction time.") SetExternRef;
		void SetExternRef (const Standard_Integer aRef);
		%feature("autodoc", "Args:
	aProjector(Handle_Prs3d_Projector)
	aTrsf(Handle_Geom_Transformation)
	aPresentation(Handle_Prs3d_Presentation)

Returns:
	virtual void

computes the presentation according to a point of view  
         given by <aProjector>.  
         To be Used when the associated degenerated Presentations  
         have been transformed by <aTrsf> which is not a Pure  
         Translation. The HLR Prs can't be deducted automatically  
         WARNING :<aTrsf> must be applied  
          to the object to display before computation  !!!") Compute;
		virtual void Compute (const Handle_Prs3d_Projector & aProjector,const Handle_Geom_Transformation & aTrsf,const Handle_Prs3d_Presentation & aPresentation);
};


%feature("shadow") AIS_TangentRelation::~AIS_TangentRelation %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend AIS_TangentRelation {
	void _kill_pointed() {
		delete $self;
	}
};
%extend AIS_TangentRelation {
	Handle_AIS_TangentRelation GetHandle() {
	return *(Handle_AIS_TangentRelation*) &$self;
	}
};

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
    AIS_TangentRelation* GetObject() {
    return (AIS_TangentRelation*)$self->Access();
    }
};
%feature("shadow") Handle_AIS_TangentRelation::~Handle_AIS_TangentRelation %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_AIS_TangentRelation {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor AIS_TexturedShape;
class AIS_TexturedShape : public AIS_Shape {
	public:
		%feature("autodoc", "Args:
	theShape(TopoDS_Shape)

Returns:
	None

@name main methods
Initializes the textured shape.") AIS_TexturedShape;
		 AIS_TexturedShape (const TopoDS_Shape & theShape);
		%feature("autodoc", "Args:
	theTextureFileName(TCollection_AsciiString)

Returns:
	virtual void

Sets the texture source. <theTextureFileName> can specify path to texture image or one of the standard predefined textures.
The accepted file types are those used in Image_AlienPixMap with extensions such as rgb, png, jpg and more.
To specify the standard predefined texture, the <theTextureFileName> should contain integer - the Graphic3d_NameOfTexture2D enumeration index.
Setting texture source using this method resets the source pixmap (if was set previously).") SetTextureFileName;
		virtual void SetTextureFileName (const TCollection_AsciiString & theTextureFileName);
		%feature("autodoc", "Args:
	theTexturePixMap(Image_PixMap_Handle)

Returns:
	virtual void

Sets the texture source. <theTexturePixMap> specifies image data.
Please note that the data should be in Bottom-Up order, the flag of Image_PixMap::IsTopDown() will be ignored by graphic driver.
Setting texture source using this method resets the source by filename (if was set previously).") SetTexturePixMap;
		virtual void SetTexturePixMap (const Image_PixMap_Handle & theTexturePixMap);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

@return flag to control texture mapping (for presentation mode 3)") TextureMapState;
		Standard_Boolean TextureMapState ();
		%feature("autodoc", "Args:
	None
Returns:
	None

Enables texture mapping") SetTextureMapOn;
		void SetTextureMapOn ();
		%feature("autodoc", "Args:
	None
Returns:
	None

Disables texture mapping") SetTextureMapOff;
		void SetTextureMapOff ();
		%feature("autodoc", "Args:
	None
Returns:
	char *

@return path to the texture file") TextureFile;
		char * TextureFile ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Image_PixMap

@return the source pixmap for texture map") TexturePixMap;
		const Handle_Image_PixMap & TexturePixMap ();
		%feature("autodoc", "Args:
	None
Returns:
	None

@name methods to alter texture mapping properties
Use this method to display the textured shape without recomputing the whole presentation.
Use this method when ONLY the texture content has been changed.
If other parameters (ie: scale factors, texture origin, texture repeat...) have changed, the whole presentation has to be recomputed:
@code
if (myShape->DisplayMode() == 3)
{
  myAISContext->RecomputePrsOnly (myShape);
}
else
{
  myAISContext->SetDisplayMode (myShape, 3, Standard_False);
  myAISContext->Display        (myShape, Standard_True);
}
@endcode") UpdateAttributes;
		void UpdateAttributes ();
		%feature("autodoc", "Args:
	None
Returns:
	None

Enables texture modulation") EnableTextureModulate;
		void EnableTextureModulate ();
		%feature("autodoc", "Args:
	None
Returns:
	None

Disables texture modulation") DisableTextureModulate;
		void DisableTextureModulate ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

@return texture repeat flag") TextureRepeat;
		Standard_Boolean TextureRepeat ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

@return texture repeat U value") URepeat;
		Standard_Real URepeat ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

@return texture repeat V value") VRepeat;
		Standard_Real VRepeat ();
		%feature("autodoc", "Args:
	theToRepeat(Standard_Boolean)
	theURepeat(Standard_Real)=1.0
	theVRepeat(Standard_Real)=1.0

Returns:
	None

Sets the number of occurrences of the texture on each face. The texture itself is parameterized in (0,1) by (0,1).
Each face of the shape to be textured is parameterized in UV space (Umin,Umax) by (Vmin,Vmax).
If RepeatYN is set to false, texture coordinates are clamped in the range (0,1)x(0,1) of the face.") SetTextureRepeat;
		void SetTextureRepeat (const Standard_Boolean theToRepeat,const Standard_Real theURepeat = 1.0,const Standard_Real theVRepeat = 1.0);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

@return true if texture UV origin has been modified") TextureOrigin;
		Standard_Boolean TextureOrigin ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

@return texture origin U position (0.0 by default)") TextureUOrigin;
		Standard_Real TextureUOrigin ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

@return texture origin V position (0.0 by default)") TextureVOrigin;
		Standard_Real TextureVOrigin ();
		%feature("autodoc", "Args:
	theToSetTextureOrigin(Standard_Boolean)
	theUOrigin(Standard_Real)=0.0
	theVOrigin(Standard_Real)=0.0

Returns:
	None

Use this method to change the origin of the texture. The texel (0,0) will be mapped to the surface (UOrigin,VOrigin)") SetTextureOrigin;
		void SetTextureOrigin (const Standard_Boolean theToSetTextureOrigin,const Standard_Real theUOrigin = 0.0,const Standard_Real theVOrigin = 0.0);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

@return true if scale factor should be applied to texture mapping") TextureScale;
		Standard_Boolean TextureScale ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

@return scale factor for U coordinate (1.0 by default)") TextureScaleU;
		Standard_Real TextureScaleU ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

@return scale factor for V coordinate (1.0 by default)") TextureScaleV;
		Standard_Real TextureScaleV ();
		%feature("autodoc", "Args:
	theToSetTextureScale(Standard_Boolean)
	theScaleU(Standard_Real)=1.0
	theScaleV(Standard_Real)=1.0

Returns:
	None

Use this method to scale the texture (percent of the face).
You can specify a scale factor for both U and V.
Example: if you set ScaleU and ScaleV to 0.5 and you enable texture repeat,
         the texture will appear twice on the face in each direction.") SetTextureScale;
		void SetTextureScale (const Standard_Boolean theToSetTextureScale,const Standard_Real theScaleU = 1.0,const Standard_Real theScaleV = 1.0);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

@return true if texture color modulation is turned on") TextureModulate;
		Standard_Boolean TextureModulate ();
};


%feature("shadow") AIS_TexturedShape::~AIS_TexturedShape %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend AIS_TexturedShape {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor AIS_MaxRadiusDimension;
class AIS_MaxRadiusDimension : public AIS_EllipseRadiusDimension {
	public:
		%feature("autodoc", "Args:
	aShape(TopoDS_Shape)
	aVal(Standard_Real)
	aText(TCollection_ExtendedString)

Returns:
	None

Max  Ellipse  radius dimension  
 Shape  can  be  edge  ,  planar  face  or  cylindrical  face") AIS_MaxRadiusDimension;
		 AIS_MaxRadiusDimension (const TopoDS_Shape & aShape,const Standard_Real aVal,const TCollection_ExtendedString & aText);
		%feature("autodoc", "Args:
	aShape(TopoDS_Shape)
	aVal(Standard_Real)
	aText(TCollection_ExtendedString)
	aPosition(gp_Pnt)
	aSymbolPrs(DsgPrs_ArrowSide)
	anArrowSize(Standard_Real)=0.0

Returns:
	None

Max  Ellipse  radius dimension with  position  
 Shape  can  be  edge  ,  planar  face  or  cylindrical  face") AIS_MaxRadiusDimension;
		 AIS_MaxRadiusDimension (const TopoDS_Shape & aShape,const Standard_Real aVal,const TCollection_ExtendedString & aText,const gp_Pnt & aPosition,const DsgPrs_ArrowSide aSymbolPrs,const Standard_Real anArrowSize = 0.0);
		%feature("autodoc", "Args:
	aProjector(Handle_Prs3d_Projector)
	aTrsf(Handle_Geom_Transformation)
	aPresentation(Handle_Prs3d_Presentation)

Returns:
	virtual void

computes the presentation according to a point of view  
         given by <aProjector>.  
         To be Used when the associated degenerated Presentations  
         have been transformed by <aTrsf> which is not a Pure  
         Translation. The HLR Prs can't be deducted automatically  
         WARNING :<aTrsf> must be applied  
          to the object to display before computation  !!!") Compute;
		virtual void Compute (const Handle_Prs3d_Projector & aProjector,const Handle_Geom_Transformation & aTrsf,const Handle_Prs3d_Presentation & aPresentation);
};


%feature("shadow") AIS_MaxRadiusDimension::~AIS_MaxRadiusDimension %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend AIS_MaxRadiusDimension {
	void _kill_pointed() {
		delete $self;
	}
};
%extend AIS_MaxRadiusDimension {
	Handle_AIS_MaxRadiusDimension GetHandle() {
	return *(Handle_AIS_MaxRadiusDimension*) &$self;
	}
};

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
    AIS_MaxRadiusDimension* GetObject() {
    return (AIS_MaxRadiusDimension*)$self->Access();
    }
};
%feature("shadow") Handle_AIS_MaxRadiusDimension::~Handle_AIS_MaxRadiusDimension %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_AIS_MaxRadiusDimension {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor AIS_MinRadiusDimension;
class AIS_MinRadiusDimension : public AIS_EllipseRadiusDimension {
	public:
		%feature("autodoc", "Args:
	aShape(TopoDS_Shape)
	aVal(Standard_Real)
	aText(TCollection_ExtendedString)

Returns:
	None

Max  Ellipse  radius dimension  
 Shape  can  be  edge  ,  planar  face  or  cylindrical  face") AIS_MinRadiusDimension;
		 AIS_MinRadiusDimension (const TopoDS_Shape & aShape,const Standard_Real aVal,const TCollection_ExtendedString & aText);
		%feature("autodoc", "Args:
	aShape(TopoDS_Shape)
	aVal(Standard_Real)
	aText(TCollection_ExtendedString)
	aPosition(gp_Pnt)
	aSymbolPrs(DsgPrs_ArrowSide)
	anArrowSize(Standard_Real)=0.0

Returns:
	None

Max  Ellipse  radius dimension with  position  
 Shape  can  be  edge  ,  planar  face  or  cylindrical  face") AIS_MinRadiusDimension;
		 AIS_MinRadiusDimension (const TopoDS_Shape & aShape,const Standard_Real aVal,const TCollection_ExtendedString & aText,const gp_Pnt & aPosition,const DsgPrs_ArrowSide aSymbolPrs,const Standard_Real anArrowSize = 0.0);
		%feature("autodoc", "Args:
	aProjector(Handle_Prs3d_Projector)
	aTrsf(Handle_Geom_Transformation)
	aPresentation(Handle_Prs3d_Presentation)

Returns:
	virtual void

computes the presentation according to a point of view  
         given by <aProjector>.  
         To be Used when the associated degenerated Presentations  
         have been transformed by <aTrsf> which is not a Pure  
         Translation. The HLR Prs can't be deducted automatically  
         WARNING :<aTrsf> must be applied  
          to the object to display before computation  !!!") Compute;
		virtual void Compute (const Handle_Prs3d_Projector & aProjector,const Handle_Geom_Transformation & aTrsf,const Handle_Prs3d_Presentation & aPresentation);
};


%feature("shadow") AIS_MinRadiusDimension::~AIS_MinRadiusDimension %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend AIS_MinRadiusDimension {
	void _kill_pointed() {
		delete $self;
	}
};
%extend AIS_MinRadiusDimension {
	Handle_AIS_MinRadiusDimension GetHandle() {
	return *(Handle_AIS_MinRadiusDimension*) &$self;
	}
};

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
    AIS_MinRadiusDimension* GetObject() {
    return (AIS_MinRadiusDimension*)$self->Access();
    }
};
%feature("shadow") Handle_AIS_MinRadiusDimension::~Handle_AIS_MinRadiusDimension %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_AIS_MinRadiusDimension {
    void _kill_pointed() {
        delete $self;
    }
};

