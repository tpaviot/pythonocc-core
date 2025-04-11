/*
Copyright 2008-2025 Thomas Paviot (tpaviot@gmail.com)

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
%define PRSDIMDOCSTRING
"PrsDim module, see official documentation at
https://dev.opencascade.org/doc/occt-7.9.0/refman/html/package_prsdim.html"
%enddef
%module (package="OCC.Core", docstring=PRSDIMDOCSTRING) PrsDim


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
#include<PrsDim_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<Geom_module.hxx>
#include<gp_module.hxx>
#include<TopoDS_module.hxx>
#include<Prs3d_module.hxx>
#include<Quantity_module.hxx>
#include<Aspect_module.hxx>
#include<Bnd_module.hxx>
#include<AIS_module.hxx>
#include<TCollection_module.hxx>
#include<SelectMgr_module.hxx>
#include<PrsMgr_module.hxx>
#include<DsgPrs_module.hxx>
#include<TColStd_module.hxx>
#include<V3d_module.hxx>
#include<Graphic3d_module.hxx>
#include<Message_module.hxx>
#include<StdSelect_module.hxx>
#include<TShort_module.hxx>
#include<Media_module.hxx>
#include<Poly_module.hxx>
#include<Select3D_module.hxx>
#include<TopTools_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import Geom.i
%import gp.i
%import TopoDS.i
%import Prs3d.i
%import Quantity.i
%import Aspect.i
%import Bnd.i
%import AIS.i
%import TCollection.i
%import SelectMgr.i
%import PrsMgr.i
%import DsgPrs.i
%import TColStd.i

%pythoncode {
from enum import IntEnum
from OCC.Core.Exception import *
};

/* public enums */
enum PrsDim_DimensionSelectionMode {
	PrsDim_DimensionSelectionMode_All = 0,
	PrsDim_DimensionSelectionMode_Line = 1,
	PrsDim_DimensionSelectionMode_Text = 2,
};

enum PrsDim_DisplaySpecialSymbol {
	PrsDim_DisplaySpecialSymbol_No = 0,
	PrsDim_DisplaySpecialSymbol_Before = 1,
	PrsDim_DisplaySpecialSymbol_After = 2,
};

enum PrsDim_KindOfDimension {
	PrsDim_KOD_NONE = 0,
	PrsDim_KOD_LENGTH = 1,
	PrsDim_KOD_PLANEANGLE = 2,
	PrsDim_KOD_SOLIDANGLE = 3,
	PrsDim_KOD_AREA = 4,
	PrsDim_KOD_VOLUME = 5,
	PrsDim_KOD_MASS = 6,
	PrsDim_KOD_TIME = 7,
	PrsDim_KOD_RADIUS = 8,
	PrsDim_KOD_DIAMETER = 9,
	PrsDim_KOD_CHAMF2D = 10,
	PrsDim_KOD_CHAMF3D = 11,
	PrsDim_KOD_OFFSET = 12,
	PrsDim_KOD_ELLIPSERADIUS = 13,
};

enum PrsDim_KindOfRelation {
	PrsDim_KOR_NONE = 0,
	PrsDim_KOR_CONCENTRIC = 1,
	PrsDim_KOR_EQUALDISTANCE = 2,
	PrsDim_KOR_EQUALRADIUS = 3,
	PrsDim_KOR_FIX = 4,
	PrsDim_KOR_IDENTIC = 5,
	PrsDim_KOR_OFFSET = 6,
	PrsDim_KOR_PARALLEL = 7,
	PrsDim_KOR_PERPENDICULAR = 8,
	PrsDim_KOR_TANGENT = 9,
	PrsDim_KOR_SYMMETRIC = 10,
};

enum PrsDim_KindOfSurface {
	PrsDim_KOS_Plane = 0,
	PrsDim_KOS_Cylinder = 1,
	PrsDim_KOS_Cone = 2,
	PrsDim_KOS_Sphere = 3,
	PrsDim_KOS_Torus = 4,
	PrsDim_KOS_Revolution = 5,
	PrsDim_KOS_Extrusion = 6,
	PrsDim_KOS_OtherSurface = 7,
};

enum PrsDim_TypeOfAngle {
	PrsDim_TypeOfAngle_Interior = 0,
	PrsDim_TypeOfAngle_Exterior = 1,
};

enum PrsDim_TypeOfAngleArrowVisibility {
	PrsDim_TypeOfAngleArrowVisibility_Both = 0,
	PrsDim_TypeOfAngleArrowVisibility_First = 1,
	PrsDim_TypeOfAngleArrowVisibility_Second = 2,
	PrsDim_TypeOfAngleArrowVisibility_None = 3,
};

enum PrsDim_TypeOfDist {
	PrsDim_TypeOfDist_Unknown = 0,
	PrsDim_TypeOfDist_Horizontal = 1,
	PrsDim_TypeOfDist_Vertical = 2,
};

/* end public enums declaration */

/* python proxy classes for enums */
%pythoncode {

class PrsDim_DimensionSelectionMode(IntEnum):
	PrsDim_DimensionSelectionMode_All = 0
	PrsDim_DimensionSelectionMode_Line = 1
	PrsDim_DimensionSelectionMode_Text = 2
PrsDim_DimensionSelectionMode_All = PrsDim_DimensionSelectionMode.PrsDim_DimensionSelectionMode_All
PrsDim_DimensionSelectionMode_Line = PrsDim_DimensionSelectionMode.PrsDim_DimensionSelectionMode_Line
PrsDim_DimensionSelectionMode_Text = PrsDim_DimensionSelectionMode.PrsDim_DimensionSelectionMode_Text

class PrsDim_DisplaySpecialSymbol(IntEnum):
	PrsDim_DisplaySpecialSymbol_No = 0
	PrsDim_DisplaySpecialSymbol_Before = 1
	PrsDim_DisplaySpecialSymbol_After = 2
PrsDim_DisplaySpecialSymbol_No = PrsDim_DisplaySpecialSymbol.PrsDim_DisplaySpecialSymbol_No
PrsDim_DisplaySpecialSymbol_Before = PrsDim_DisplaySpecialSymbol.PrsDim_DisplaySpecialSymbol_Before
PrsDim_DisplaySpecialSymbol_After = PrsDim_DisplaySpecialSymbol.PrsDim_DisplaySpecialSymbol_After

class PrsDim_KindOfDimension(IntEnum):
	PrsDim_KOD_NONE = 0
	PrsDim_KOD_LENGTH = 1
	PrsDim_KOD_PLANEANGLE = 2
	PrsDim_KOD_SOLIDANGLE = 3
	PrsDim_KOD_AREA = 4
	PrsDim_KOD_VOLUME = 5
	PrsDim_KOD_MASS = 6
	PrsDim_KOD_TIME = 7
	PrsDim_KOD_RADIUS = 8
	PrsDim_KOD_DIAMETER = 9
	PrsDim_KOD_CHAMF2D = 10
	PrsDim_KOD_CHAMF3D = 11
	PrsDim_KOD_OFFSET = 12
	PrsDim_KOD_ELLIPSERADIUS = 13
PrsDim_KOD_NONE = PrsDim_KindOfDimension.PrsDim_KOD_NONE
PrsDim_KOD_LENGTH = PrsDim_KindOfDimension.PrsDim_KOD_LENGTH
PrsDim_KOD_PLANEANGLE = PrsDim_KindOfDimension.PrsDim_KOD_PLANEANGLE
PrsDim_KOD_SOLIDANGLE = PrsDim_KindOfDimension.PrsDim_KOD_SOLIDANGLE
PrsDim_KOD_AREA = PrsDim_KindOfDimension.PrsDim_KOD_AREA
PrsDim_KOD_VOLUME = PrsDim_KindOfDimension.PrsDim_KOD_VOLUME
PrsDim_KOD_MASS = PrsDim_KindOfDimension.PrsDim_KOD_MASS
PrsDim_KOD_TIME = PrsDim_KindOfDimension.PrsDim_KOD_TIME
PrsDim_KOD_RADIUS = PrsDim_KindOfDimension.PrsDim_KOD_RADIUS
PrsDim_KOD_DIAMETER = PrsDim_KindOfDimension.PrsDim_KOD_DIAMETER
PrsDim_KOD_CHAMF2D = PrsDim_KindOfDimension.PrsDim_KOD_CHAMF2D
PrsDim_KOD_CHAMF3D = PrsDim_KindOfDimension.PrsDim_KOD_CHAMF3D
PrsDim_KOD_OFFSET = PrsDim_KindOfDimension.PrsDim_KOD_OFFSET
PrsDim_KOD_ELLIPSERADIUS = PrsDim_KindOfDimension.PrsDim_KOD_ELLIPSERADIUS

class PrsDim_KindOfRelation(IntEnum):
	PrsDim_KOR_NONE = 0
	PrsDim_KOR_CONCENTRIC = 1
	PrsDim_KOR_EQUALDISTANCE = 2
	PrsDim_KOR_EQUALRADIUS = 3
	PrsDim_KOR_FIX = 4
	PrsDim_KOR_IDENTIC = 5
	PrsDim_KOR_OFFSET = 6
	PrsDim_KOR_PARALLEL = 7
	PrsDim_KOR_PERPENDICULAR = 8
	PrsDim_KOR_TANGENT = 9
	PrsDim_KOR_SYMMETRIC = 10
PrsDim_KOR_NONE = PrsDim_KindOfRelation.PrsDim_KOR_NONE
PrsDim_KOR_CONCENTRIC = PrsDim_KindOfRelation.PrsDim_KOR_CONCENTRIC
PrsDim_KOR_EQUALDISTANCE = PrsDim_KindOfRelation.PrsDim_KOR_EQUALDISTANCE
PrsDim_KOR_EQUALRADIUS = PrsDim_KindOfRelation.PrsDim_KOR_EQUALRADIUS
PrsDim_KOR_FIX = PrsDim_KindOfRelation.PrsDim_KOR_FIX
PrsDim_KOR_IDENTIC = PrsDim_KindOfRelation.PrsDim_KOR_IDENTIC
PrsDim_KOR_OFFSET = PrsDim_KindOfRelation.PrsDim_KOR_OFFSET
PrsDim_KOR_PARALLEL = PrsDim_KindOfRelation.PrsDim_KOR_PARALLEL
PrsDim_KOR_PERPENDICULAR = PrsDim_KindOfRelation.PrsDim_KOR_PERPENDICULAR
PrsDim_KOR_TANGENT = PrsDim_KindOfRelation.PrsDim_KOR_TANGENT
PrsDim_KOR_SYMMETRIC = PrsDim_KindOfRelation.PrsDim_KOR_SYMMETRIC

class PrsDim_KindOfSurface(IntEnum):
	PrsDim_KOS_Plane = 0
	PrsDim_KOS_Cylinder = 1
	PrsDim_KOS_Cone = 2
	PrsDim_KOS_Sphere = 3
	PrsDim_KOS_Torus = 4
	PrsDim_KOS_Revolution = 5
	PrsDim_KOS_Extrusion = 6
	PrsDim_KOS_OtherSurface = 7
PrsDim_KOS_Plane = PrsDim_KindOfSurface.PrsDim_KOS_Plane
PrsDim_KOS_Cylinder = PrsDim_KindOfSurface.PrsDim_KOS_Cylinder
PrsDim_KOS_Cone = PrsDim_KindOfSurface.PrsDim_KOS_Cone
PrsDim_KOS_Sphere = PrsDim_KindOfSurface.PrsDim_KOS_Sphere
PrsDim_KOS_Torus = PrsDim_KindOfSurface.PrsDim_KOS_Torus
PrsDim_KOS_Revolution = PrsDim_KindOfSurface.PrsDim_KOS_Revolution
PrsDim_KOS_Extrusion = PrsDim_KindOfSurface.PrsDim_KOS_Extrusion
PrsDim_KOS_OtherSurface = PrsDim_KindOfSurface.PrsDim_KOS_OtherSurface

class PrsDim_TypeOfAngle(IntEnum):
	PrsDim_TypeOfAngle_Interior = 0
	PrsDim_TypeOfAngle_Exterior = 1
PrsDim_TypeOfAngle_Interior = PrsDim_TypeOfAngle.PrsDim_TypeOfAngle_Interior
PrsDim_TypeOfAngle_Exterior = PrsDim_TypeOfAngle.PrsDim_TypeOfAngle_Exterior

class PrsDim_TypeOfAngleArrowVisibility(IntEnum):
	PrsDim_TypeOfAngleArrowVisibility_Both = 0
	PrsDim_TypeOfAngleArrowVisibility_First = 1
	PrsDim_TypeOfAngleArrowVisibility_Second = 2
	PrsDim_TypeOfAngleArrowVisibility_None = 3
PrsDim_TypeOfAngleArrowVisibility_Both = PrsDim_TypeOfAngleArrowVisibility.PrsDim_TypeOfAngleArrowVisibility_Both
PrsDim_TypeOfAngleArrowVisibility_First = PrsDim_TypeOfAngleArrowVisibility.PrsDim_TypeOfAngleArrowVisibility_First
PrsDim_TypeOfAngleArrowVisibility_Second = PrsDim_TypeOfAngleArrowVisibility.PrsDim_TypeOfAngleArrowVisibility_Second
PrsDim_TypeOfAngleArrowVisibility_None = PrsDim_TypeOfAngleArrowVisibility.PrsDim_TypeOfAngleArrowVisibility_None

class PrsDim_TypeOfDist(IntEnum):
	PrsDim_TypeOfDist_Unknown = 0
	PrsDim_TypeOfDist_Horizontal = 1
	PrsDim_TypeOfDist_Vertical = 2
PrsDim_TypeOfDist_Unknown = PrsDim_TypeOfDist.PrsDim_TypeOfDist_Unknown
PrsDim_TypeOfDist_Horizontal = PrsDim_TypeOfDist.PrsDim_TypeOfDist_Horizontal
PrsDim_TypeOfDist_Vertical = PrsDim_TypeOfDist.PrsDim_TypeOfDist_Vertical
};
/* end python proxy for enums */

/* handles */
%wrap_handle(PrsDim_Dimension)
%wrap_handle(PrsDim_DimensionOwner)
%wrap_handle(PrsDim_Relation)
%wrap_handle(PrsDim_AngleDimension)
%wrap_handle(PrsDim_Chamf2dDimension)
%wrap_handle(PrsDim_Chamf3dDimension)
%wrap_handle(PrsDim_ConcentricRelation)
%wrap_handle(PrsDim_DiameterDimension)
%wrap_handle(PrsDim_EllipseRadiusDimension)
%wrap_handle(PrsDim_EqualDistanceRelation)
%wrap_handle(PrsDim_EqualRadiusRelation)
%wrap_handle(PrsDim_FixRelation)
%wrap_handle(PrsDim_IdenticRelation)
%wrap_handle(PrsDim_LengthDimension)
%wrap_handle(PrsDim_MidPointRelation)
%wrap_handle(PrsDim_OffsetDimension)
%wrap_handle(PrsDim_ParallelRelation)
%wrap_handle(PrsDim_PerpendicularRelation)
%wrap_handle(PrsDim_RadiusDimension)
%wrap_handle(PrsDim_SymmetricRelation)
%wrap_handle(PrsDim_TangentRelation)
%wrap_handle(PrsDim_MaxRadiusDimension)
%wrap_handle(PrsDim_MinRadiusDimension)
/* end handles declaration */

/* templates */
/* end templates declaration */

/* typedefs */
/* end typedefs declaration */

/***************
* class PrsDim *
***************/
%rename(prsdim) PrsDim;
class PrsDim {
	public:
		/****** PrsDim::ComputeGeomCurve ******/
		/****** md5 signature: 6cb69c4ea337cf6a19ea54e6c660e70a ******/
		%feature("compactdefaultargs") ComputeGeomCurve;
		%feature("autodoc", "
Parameters
----------
aCurve: Geom_Curve
first1: float
last1: float
FirstPnt1: gp_Pnt
LastPnt1: gp_Pnt
aPlane: Geom_Plane

Return
-------
isOnPlane: bool

Description
-----------
Checks if aCurve belongs to aPlane; if not, projects aCurve in aPlane and returns aCurve; Return True if ok.
") ComputeGeomCurve;
		static Standard_Boolean ComputeGeomCurve(opencascade::handle<Geom_Curve> & aCurve, const Standard_Real first1, const Standard_Real last1, gp_Pnt & FirstPnt1, gp_Pnt & LastPnt1, const opencascade::handle<Geom_Plane> & aPlane, Standard_Boolean &OutValue);

		/****** PrsDim::ComputeGeometry ******/
		/****** md5 signature: e8a575e5403a4ba0093cb9d2b31b2b98 ******/
		%feature("compactdefaultargs") ComputeGeometry;
		%feature("autodoc", "
Parameters
----------
theEdge: TopoDS_Edge
theCurve: Geom_Curve
theFirstPnt: gp_Pnt
theLastPnt: gp_Pnt

Return
-------
bool

Description
-----------
Used by 2d Relation only Computes the 3d geometry of <anEdge> in the current WorkingPlane and the extremities if any Return True if ok.
") ComputeGeometry;
		static Standard_Boolean ComputeGeometry(const TopoDS_Edge & theEdge, opencascade::handle<Geom_Curve> & theCurve, gp_Pnt & theFirstPnt, gp_Pnt & theLastPnt);

		/****** PrsDim::ComputeGeometry ******/
		/****** md5 signature: efd861838cb718f7744f62f9854ac012 ******/
		%feature("compactdefaultargs") ComputeGeometry;
		%feature("autodoc", "
Parameters
----------
theEdge: TopoDS_Edge
theCurve: Geom_Curve
theFirstPnt: gp_Pnt
theLastPnt: gp_Pnt

Return
-------
theIsInfinite: bool

Description
-----------
Used by dimensions only. Computes the 3d geometry of <anEdge>. Return True if ok.
") ComputeGeometry;
		static Standard_Boolean ComputeGeometry(const TopoDS_Edge & theEdge, opencascade::handle<Geom_Curve> & theCurve, gp_Pnt & theFirstPnt, gp_Pnt & theLastPnt, Standard_Boolean &OutValue);

		/****** PrsDim::ComputeGeometry ******/
		/****** md5 signature: 8b94e7eacd171a5f348b83aa3344f8e2 ******/
		%feature("compactdefaultargs") ComputeGeometry;
		%feature("autodoc", "
Parameters
----------
theEdge: TopoDS_Edge
theCurve: Geom_Curve
theFirstPnt: gp_Pnt
theLastPnt: gp_Pnt
theExtCurve: Geom_Curve
thePlane: Geom_Plane

Return
-------
theIsInfinite: bool
theIsOnPlane: bool

Description
-----------
Used by 2d Relation only Computes the 3d geometry of <anEdge> in the current WorkingPlane and the extremities if any. If <aCurve> is not in the current plane, <extCurve> contains the not projected curve associated to <anEdge>. If <anEdge> is infinite, <isinfinite> = true and the 2 parameters <FirstPnt> and <LastPnt> have no signification. Return True if ok.
") ComputeGeometry;
		static Standard_Boolean ComputeGeometry(const TopoDS_Edge & theEdge, opencascade::handle<Geom_Curve> & theCurve, gp_Pnt & theFirstPnt, gp_Pnt & theLastPnt, opencascade::handle<Geom_Curve> & theExtCurve, Standard_Boolean &OutValue, Standard_Boolean &OutValue, const opencascade::handle<Geom_Plane> & thePlane);

		/****** PrsDim::ComputeGeometry ******/
		/****** md5 signature: 8df8e467ff61bbb7f23d9cd9468ecad2 ******/
		%feature("compactdefaultargs") ComputeGeometry;
		%feature("autodoc", "
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

Return
-------
bool

Description
-----------
Used by 2d Relation only Computes the 3d geometry of <anEdge> in the current WorkingPlane and the extremities if any Return True if ok.
") ComputeGeometry;
		static Standard_Boolean ComputeGeometry(const TopoDS_Edge & theFirstEdge, const TopoDS_Edge & theSecondEdge, opencascade::handle<Geom_Curve> & theFirstCurve, opencascade::handle<Geom_Curve> & theSecondCurve, gp_Pnt & theFirstPnt1, gp_Pnt & theLastPnt1, gp_Pnt & theFirstPnt2, gp_Pnt & theLastPnt2, const opencascade::handle<Geom_Plane> & thePlane);

		/****** PrsDim::ComputeGeometry ******/
		/****** md5 signature: 0df198d142c4b96a61c095fd4bf2b68b ******/
		%feature("compactdefaultargs") ComputeGeometry;
		%feature("autodoc", "
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

Return
-------
theIsinfinite1: bool
theIsinfinite2: bool

Description
-----------
Used by dimensions only.Computes the 3d geometry of<anEdge1> and <anEdge2> and checks if they are infinite.
") ComputeGeometry;
		static Standard_Boolean ComputeGeometry(const TopoDS_Edge & theFirstEdge, const TopoDS_Edge & theSecondEdge, opencascade::handle<Geom_Curve> & theFirstCurve, opencascade::handle<Geom_Curve> & theSecondCurve, gp_Pnt & theFirstPnt1, gp_Pnt & theLastPnt1, gp_Pnt & theFirstPnt2, gp_Pnt & theLastPnt2, Standard_Boolean &OutValue, Standard_Boolean &OutValue);

		/****** PrsDim::ComputeGeometry ******/
		/****** md5 signature: b6be325805be1ce5c8ffac49b7ee1d13 ******/
		%feature("compactdefaultargs") ComputeGeometry;
		%feature("autodoc", "
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

Return
-------
theExtIndex: int
theIsinfinite1: bool
theIsinfinite2: bool

Description
-----------
Used by 2d Relation only Computes the 3d geometry of<anEdge1> and <anEdge2> in the current Plane and the extremities if any. Return in ExtCurve the 3d curve (not projected in the plane) of the first edge if <indexExt> =1 or of the 2nd edge if <indexExt> = 2. If <indexExt> = 0, ExtCurve is Null. if there is an edge external to the plane, <isinfinite> is true if this edge is infinite. So, the extremities of it are not significant. Return True if ok.
") ComputeGeometry;
		static Standard_Boolean ComputeGeometry(const TopoDS_Edge & theFirstEdge, const TopoDS_Edge & theSecondEdge, Standard_Integer &OutValue, opencascade::handle<Geom_Curve> & theFirstCurve, opencascade::handle<Geom_Curve> & theSecondCurve, gp_Pnt & theFirstPnt1, gp_Pnt & theLastPnt1, gp_Pnt & theFirstPnt2, gp_Pnt & theLastPnt2, opencascade::handle<Geom_Curve> & theExtCurve, Standard_Boolean &OutValue, Standard_Boolean &OutValue, const opencascade::handle<Geom_Plane> & thePlane);

		/****** PrsDim::ComputeGeometry ******/
		/****** md5 signature: 1b2f2da9052ca02b5e26e70990845489 ******/
		%feature("compactdefaultargs") ComputeGeometry;
		%feature("autodoc", "
Parameters
----------
aVertex: TopoDS_Vertex
point: gp_Pnt
aPlane: Geom_Plane

Return
-------
isOnPlane: bool

Description
-----------
No available documentation.
") ComputeGeometry;
		static Standard_Boolean ComputeGeometry(const TopoDS_Vertex & aVertex, gp_Pnt & point, const opencascade::handle<Geom_Plane> & aPlane, Standard_Boolean &OutValue);

		/****** PrsDim::ComputeProjEdgePresentation ******/
		/****** md5 signature: 48580268b98d21f047f2b8907f481c25 ******/
		%feature("compactdefaultargs") ComputeProjEdgePresentation;
		%feature("autodoc", "
Parameters
----------
aPres: Prs3d_Presentation
aDrawer: Prs3d_Drawer
anEdge: TopoDS_Edge
ProjCurve: Geom_Curve
FirstP: gp_Pnt
LastP: gp_Pnt
aColor: Quantity_NameOfColor (optional, default to Quantity_NOC_PURPLE)
aWidth: float (optional, default to 2)
aProjTOL: Aspect_TypeOfLine (optional, default to Aspect_TOL_DASH)
aCallTOL: Aspect_TypeOfLine (optional, default to Aspect_TOL_DOT)

Return
-------
None

Description
-----------
No available documentation.
") ComputeProjEdgePresentation;
		static void ComputeProjEdgePresentation(const opencascade::handle<Prs3d_Presentation> & aPres, const opencascade::handle<Prs3d_Drawer> & aDrawer, const TopoDS_Edge & anEdge, const opencascade::handle<Geom_Curve> & ProjCurve, const gp_Pnt & FirstP, const gp_Pnt & LastP, const Quantity_NameOfColor aColor = Quantity_NOC_PURPLE, const Standard_Real aWidth = 2, const Aspect_TypeOfLine aProjTOL = Aspect_TOL_DASH, const Aspect_TypeOfLine aCallTOL = Aspect_TOL_DOT);

		/****** PrsDim::ComputeProjVertexPresentation ******/
		/****** md5 signature: 6a04d97aa212bbd9e4e92a1cd57df632 ******/
		%feature("compactdefaultargs") ComputeProjVertexPresentation;
		%feature("autodoc", "
Parameters
----------
aPres: Prs3d_Presentation
aDrawer: Prs3d_Drawer
aVertex: TopoDS_Vertex
ProjPoint: gp_Pnt
aColor: Quantity_NameOfColor (optional, default to Quantity_NOC_PURPLE)
aWidth: float (optional, default to 2)
aProjTOM: Aspect_TypeOfMarker (optional, default to Aspect_TOM_PLUS)
aCallTOL: Aspect_TypeOfLine (optional, default to Aspect_TOL_DOT)

Return
-------
None

Description
-----------
No available documentation.
") ComputeProjVertexPresentation;
		static void ComputeProjVertexPresentation(const opencascade::handle<Prs3d_Presentation> & aPres, const opencascade::handle<Prs3d_Drawer> & aDrawer, const TopoDS_Vertex & aVertex, const gp_Pnt & ProjPoint, const Quantity_NameOfColor aColor = Quantity_NOC_PURPLE, const Standard_Real aWidth = 2, const Aspect_TypeOfMarker aProjTOM = Aspect_TOM_PLUS, const Aspect_TypeOfLine aCallTOL = Aspect_TOL_DOT);

		/****** PrsDim::DistanceFromApex ******/
		/****** md5 signature: 5ca9397fdee6875e346635084e849102 ******/
		%feature("compactdefaultargs") DistanceFromApex;
		%feature("autodoc", "
Parameters
----------
elips: gp_Elips
Apex: gp_Pnt
par: float

Return
-------
float

Description
-----------
computes length of ellipse arc in parametric units.
") DistanceFromApex;
		static Standard_Real DistanceFromApex(const gp_Elips & elips, const gp_Pnt & Apex, const Standard_Real par);

		/****** PrsDim::Farest ******/
		/****** md5 signature: 4711939cbf61dc61e0a31e90c0ba6574 ******/
		%feature("compactdefaultargs") Farest;
		%feature("autodoc", "
Parameters
----------
aShape: TopoDS_Shape
aPoint: gp_Pnt

Return
-------
gp_Pnt

Description
-----------
No available documentation.
") Farest;
		static gp_Pnt Farest(const TopoDS_Shape & aShape, const gp_Pnt & aPoint);

		/****** PrsDim::GetPlaneFromFace ******/
		/****** md5 signature: c8a73aacf44d22f63a4f6d51e7f9260b ******/
		%feature("compactdefaultargs") GetPlaneFromFace;
		%feature("autodoc", "
Parameters
----------
aFace: TopoDS_Face
aPlane: gp_Pln
aSurf: Geom_Surface

Return
-------
aSurfType: PrsDim_KindOfSurface
Offset: float

Description
-----------
Tries to get Plane from Face. Returns Surface of Face in aSurf. Returns Standard_True and Plane of Face in aPlane in following cases: Face is Plane, Offset of Plane, Extrusion of Line and Offset of Extrusion of Line Returns pure type of Surface which can be: Plane, Cylinder, Cone, Sphere, Torus, SurfaceOfRevolution, SurfaceOfExtrusion.
") GetPlaneFromFace;
		static Standard_Boolean GetPlaneFromFace(const TopoDS_Face & aFace, gp_Pln & aPlane, opencascade::handle<Geom_Surface> & aSurf, PrsDim_KindOfSurface &OutValue, Standard_Real &OutValue);

		/****** PrsDim::InDomain ******/
		/****** md5 signature: e1a93aaf6fc6d1a74b142e3804975f9e ******/
		%feature("compactdefaultargs") InDomain;
		%feature("autodoc", "
Parameters
----------
aFirstPar: float
aLastPar: float
anAttachPar: float

Return
-------
bool

Description
-----------
returns True if point with anAttachPar is in domain of arc.
") InDomain;
		static Standard_Boolean InDomain(const Standard_Real aFirstPar, const Standard_Real aLastPar, const Standard_Real anAttachPar);

		/****** PrsDim::InitAngleBetweenCurvilinearFaces ******/
		/****** md5 signature: 6f56d83ae228343607e66c3cf73a4663 ******/
		%feature("compactdefaultargs") InitAngleBetweenCurvilinearFaces;
		%feature("autodoc", "
Parameters
----------
theFirstFace: TopoDS_Face
theSecondFace: TopoDS_Face
theFirstSurfType: PrsDim_KindOfSurface
theSecondSurfType: PrsDim_KindOfSurface
theCenter: gp_Pnt
theFirstAttach: gp_Pnt
theSecondAttach: gp_Pnt
theIsFirstPointSet: bool (optional, default to Standard_False)

Return
-------
bool

Description
-----------
Finds three points for the angle dimension between two curvilinear surfaces.
") InitAngleBetweenCurvilinearFaces;
		static Standard_Boolean InitAngleBetweenCurvilinearFaces(const TopoDS_Face & theFirstFace, const TopoDS_Face & theSecondFace, const PrsDim_KindOfSurface theFirstSurfType, const PrsDim_KindOfSurface theSecondSurfType, gp_Pnt & theCenter, gp_Pnt & theFirstAttach, gp_Pnt & theSecondAttach, const Standard_Boolean theIsFirstPointSet = Standard_False);

		/****** PrsDim::InitAngleBetweenPlanarFaces ******/
		/****** md5 signature: f3f9d6eda2bc4626227a0a6044b9294f ******/
		%feature("compactdefaultargs") InitAngleBetweenPlanarFaces;
		%feature("autodoc", "
Parameters
----------
theFirstFace: TopoDS_Face
theSecondFace: TopoDS_Face
theCenter: gp_Pnt
theFirstAttach: gp_Pnt
theSecondAttach: gp_Pnt
theIsFirstPointSet: bool (optional, default to Standard_False)

Return
-------
bool

Description
-----------
Finds three points for the angle dimension between two planes.
") InitAngleBetweenPlanarFaces;
		static Standard_Boolean InitAngleBetweenPlanarFaces(const TopoDS_Face & theFirstFace, const TopoDS_Face & theSecondFace, gp_Pnt & theCenter, gp_Pnt & theFirstAttach, gp_Pnt & theSecondAttach, const Standard_Boolean theIsFirstPointSet = Standard_False);

		/****** PrsDim::InitFaceLength ******/
		/****** md5 signature: 4c6d797303c03fad5ebd7589763d97f8 ******/
		%feature("compactdefaultargs") InitFaceLength;
		%feature("autodoc", "
Parameters
----------
aFace: TopoDS_Face
aPlane: gp_Pln
aSurface: Geom_Surface

Return
-------
aSurfaceType: PrsDim_KindOfSurface
anOffset: float

Description
-----------
No available documentation.
") InitFaceLength;
		static void InitFaceLength(const TopoDS_Face & aFace, gp_Pln & aPlane, opencascade::handle<Geom_Surface> & aSurface, PrsDim_KindOfSurface &OutValue, Standard_Real &OutValue);

		/****** PrsDim::InitLengthBetweenCurvilinearFaces ******/
		/****** md5 signature: a415f028d8574f37e0030484cbbc493a ******/
		%feature("compactdefaultargs") InitLengthBetweenCurvilinearFaces;
		%feature("autodoc", "
Parameters
----------
theFirstFace: TopoDS_Face
theSecondFace: TopoDS_Face
theFirstSurf: Geom_Surface
theSecondSurf: Geom_Surface
theFirstAttach: gp_Pnt
theSecondAttach: gp_Pnt
theDirOnPlane: gp_Dir

Return
-------
None

Description
-----------
Finds attachment points on two curvilinear faces for length dimension. 
Input parameter: thePlaneDir the direction on the dimension plane to compute the plane automatically. It will not be taken into account if plane is defined by user.
") InitLengthBetweenCurvilinearFaces;
		static void InitLengthBetweenCurvilinearFaces(const TopoDS_Face & theFirstFace, const TopoDS_Face & theSecondFace, opencascade::handle<Geom_Surface> & theFirstSurf, opencascade::handle<Geom_Surface> & theSecondSurf, gp_Pnt & theFirstAttach, gp_Pnt & theSecondAttach, gp_Dir & theDirOnPlane);

		/****** PrsDim::Nearest ******/
		/****** md5 signature: ca941eb9deaee6d9850f4e04eff46172 ******/
		%feature("compactdefaultargs") Nearest;
		%feature("autodoc", "
Parameters
----------
aShape: TopoDS_Shape
aPoint: gp_Pnt

Return
-------
gp_Pnt

Description
-----------
Returns the nearest point in a shape. This is used by several classes in calculation of dimensions.
") Nearest;
		static gp_Pnt Nearest(const TopoDS_Shape & aShape, const gp_Pnt & aPoint);

		/****** PrsDim::Nearest ******/
		/****** md5 signature: ca517f1153f3874290b78263548ad358 ******/
		%feature("compactdefaultargs") Nearest;
		%feature("autodoc", "
Parameters
----------
theLine: gp_Lin
thePoint: gp_Pnt

Return
-------
gp_Pnt

Description
-----------
Return: the nearest point on the line.
") Nearest;
		static gp_Pnt Nearest(const gp_Lin & theLine, const gp_Pnt & thePoint);

		/****** PrsDim::Nearest ******/
		/****** md5 signature: e025c3fd731e2d20f08a2a452029e645 ******/
		%feature("compactdefaultargs") Nearest;
		%feature("autodoc", "
Parameters
----------
theCurve: Geom_Curve
thePoint: gp_Pnt
theFirstPoint: gp_Pnt
theLastPoint: gp_Pnt
theNearestPoint: gp_Pnt

Return
-------
bool

Description
-----------
For the given point finds nearest point on the curve, 
Return: True if found point is belongs to the curve and False otherwise.
") Nearest;
		static Standard_Boolean Nearest(const opencascade::handle<Geom_Curve> & theCurve, const gp_Pnt & thePoint, const gp_Pnt & theFirstPoint, const gp_Pnt & theLastPoint, gp_Pnt & theNearestPoint);

		/****** PrsDim::NearestApex ******/
		/****** md5 signature: 6c271d03667151d1766ac1e2b3ae1ee0 ******/
		%feature("compactdefaultargs") NearestApex;
		%feature("autodoc", "
Parameters
----------
elips: gp_Elips
pApex: gp_Pnt
nApex: gp_Pnt
fpara: float
lpara: float

Return
-------
IsInDomain: bool

Description
-----------
computes nearest to ellipse arc apex.
") NearestApex;
		static gp_Pnt NearestApex(const gp_Elips & elips, const gp_Pnt & pApex, const gp_Pnt & nApex, const Standard_Real fpara, const Standard_Real lpara, Standard_Boolean &OutValue);

		/****** PrsDim::ProjectPointOnLine ******/
		/****** md5 signature: ccd13eaf330359cd2d1963858612230a ******/
		%feature("compactdefaultargs") ProjectPointOnLine;
		%feature("autodoc", "
Parameters
----------
aPoint: gp_Pnt
aLine: gp_Lin

Return
-------
gp_Pnt

Description
-----------
No available documentation.
") ProjectPointOnLine;
		static gp_Pnt ProjectPointOnLine(const gp_Pnt & aPoint, const gp_Lin & aLine);

		/****** PrsDim::ProjectPointOnPlane ******/
		/****** md5 signature: bb162bd011a4b418ec144bcaa3106b38 ******/
		%feature("compactdefaultargs") ProjectPointOnPlane;
		%feature("autodoc", "
Parameters
----------
aPoint: gp_Pnt
aPlane: gp_Pln

Return
-------
gp_Pnt

Description
-----------
No available documentation.
") ProjectPointOnPlane;
		static gp_Pnt ProjectPointOnPlane(const gp_Pnt & aPoint, const gp_Pln & aPlane);

		/****** PrsDim::TranslatePointToBound ******/
		/****** md5 signature: 0f51e84cbfc1ab767a85d5ab839116dd ******/
		%feature("compactdefaultargs") TranslatePointToBound;
		%feature("autodoc", "
Parameters
----------
aPoint: gp_Pnt
aDir: gp_Dir
aBndBox: Bnd_Box

Return
-------
gp_Pnt

Description
-----------
No available documentation.
") TranslatePointToBound;
		static gp_Pnt TranslatePointToBound(const gp_Pnt & aPoint, const gp_Dir & aDir, const Bnd_Box & aBndBox);

};


%extend PrsDim {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************
* class PrsDim_Dimension *
*************************/
%nodefaultctor PrsDim_Dimension;
class PrsDim_Dimension : public AIS_InteractiveObject {
	public:
		class SelectionGeometry {};
/* public enums */
enum ComputeMode {
	ComputeMode_All = 0,
	ComputeMode_Line = 1,
	ComputeMode_Text = 2,
};

/* end public enums declaration */

/* python proxy classes for enums */
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

		/****** PrsDim_Dimension::AcceptDisplayMode ******/
		/****** md5 signature: 4c81f1c2cfc05fd196e1c09a383a3455 ******/
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
Returns true if the class of objects accepts the display mode theMode. The interactive context can have a default mode of representation for the set of Interactive Objects. This mode may not be accepted by object.
") AcceptDisplayMode;
		virtual Standard_Boolean AcceptDisplayMode(const Standard_Integer theMode);

		/****** PrsDim_Dimension::DimensionAspect ******/
		/****** md5 signature: 2f6e42d6c31db01e2bc6cd4dba206808 ******/
		%feature("compactdefaultargs") DimensionAspect;
		%feature("autodoc", "Return
-------
opencascade::handle<Prs3d_DimensionAspect>

Description
-----------
Gets the dimension aspect from AIS object drawer. Dimension aspect contains aspects of line, text and arrows for dimension presentation.
") DimensionAspect;
		opencascade::handle<Prs3d_DimensionAspect> DimensionAspect();

		/****** PrsDim_Dimension::DisplaySpecialSymbol ******/
		/****** md5 signature: 2873c800214f175c63b754232211e821 ******/
		%feature("compactdefaultargs") DisplaySpecialSymbol;
		%feature("autodoc", "Return
-------
PrsDim_DisplaySpecialSymbol

Description
-----------
Return: dimension special symbol display options.
") DisplaySpecialSymbol;
		PrsDim_DisplaySpecialSymbol DisplaySpecialSymbol();

		/****** PrsDim_Dimension::GetCustomValue ******/
		/****** md5 signature: 95e7dac6d1f2c02c95cf021ebebacfed ******/
		%feature("compactdefaultargs") GetCustomValue;
		%feature("autodoc", "Return
-------
TCollection_ExtendedString

Description
-----------
Gets user-defined dimension value. 
Return: dimension value string.
") GetCustomValue;
		const TCollection_ExtendedString & GetCustomValue();

		/****** PrsDim_Dimension::GetDisplayUnits ******/
		/****** md5 signature: ddc04b9c02a93ab070d76d081dd932f4 ******/
		%feature("compactdefaultargs") GetDisplayUnits;
		%feature("autodoc", "Return
-------
TCollection_AsciiString

Description
-----------
No available documentation.
") GetDisplayUnits;
		virtual const TCollection_AsciiString & GetDisplayUnits();

		/****** PrsDim_Dimension::GetFlyout ******/
		/****** md5 signature: eda99b4bc6964dc635fe0548f0e74f5c ******/
		%feature("compactdefaultargs") GetFlyout;
		%feature("autodoc", "Return
-------
float

Description
-----------
Return: flyout value for dimension.
") GetFlyout;
		Standard_Real GetFlyout();

		/****** PrsDim_Dimension::GetGeometryType ******/
		/****** md5 signature: 15c47df8128e11cd2512f3eef50b1555 ******/
		%feature("compactdefaultargs") GetGeometryType;
		%feature("autodoc", "Return
-------
int

Description
-----------
Geometry type defines type of shapes on which the dimension is to be built. 
Return: type of geometry on which the dimension will be built.
") GetGeometryType;
		Standard_Integer GetGeometryType();

		/****** PrsDim_Dimension::GetModelUnits ******/
		/****** md5 signature: 930ae9f0d86096fd7617e48776d468ed ******/
		%feature("compactdefaultargs") GetModelUnits;
		%feature("autodoc", "Return
-------
TCollection_AsciiString

Description
-----------
No available documentation.
") GetModelUnits;
		virtual const TCollection_AsciiString & GetModelUnits();

		/****** PrsDim_Dimension::GetPlane ******/
		/****** md5 signature: 0b04ebfc5d72ea55c9ed88dc6d33fea0 ******/
		%feature("compactdefaultargs") GetPlane;
		%feature("autodoc", "Return
-------
gp_Pln

Description
-----------
Get the dimension plane in which the 2D dimension presentation is computed. By default, if plane is not defined by user, it is computed automatically after dimension geometry is computed. If computed dimension geometry (points) can't be placed on the user-defined plane, dimension geometry was set as invalid (validity flag is set to false) and dimension presentation will not be computed. If user-defined plane allow geometry placement on it, it will be used for computing of the dimension presentation. 
Return: dimension plane used for presentation computing.
") GetPlane;
		const gp_Pln GetPlane();

		/****** PrsDim_Dimension::GetTextPosition ******/
		/****** md5 signature: 6ee8678e0a409f45918e038151dbde94 ******/
		%feature("compactdefaultargs") GetTextPosition;
		%feature("autodoc", "Return
-------
gp_Pnt

Description
-----------
Computes absolute text position from dimension parameters (flyout, plane and text alignment).
") GetTextPosition;
		virtual gp_Pnt GetTextPosition();

		/****** PrsDim_Dimension::GetValue ******/
		/****** md5 signature: d602b48d41f0ae37152aeb1633e13fb9 ******/
		%feature("compactdefaultargs") GetValue;
		%feature("autodoc", "Return
-------
float

Description
-----------
Gets dimension measurement value. If the value to display is not specified by user, then the dimension object is responsible to compute it on its own in model space coordinates. 
Return: the dimension value (in model units) which is used during display of the presentation.
") GetValue;
		Standard_Real GetValue();

		/****** PrsDim_Dimension::IsTextPositionCustom ******/
		/****** md5 signature: cb63adca34669ac6b14993304b5cec35 ******/
		%feature("compactdefaultargs") IsTextPositionCustom;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Return: True if text position is set by user with method SetTextPosition().
") IsTextPositionCustom;
		Standard_Boolean IsTextPositionCustom();

		/****** PrsDim_Dimension::IsValid ******/
		/****** md5 signature: 13a0f49072e992d80b7990c04d5ad580 ******/
		%feature("compactdefaultargs") IsValid;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Check that the input geometry for dimension is valid and the presentation can be successfully computed. 
Return: True if dimension geometry is ok.
") IsValid;
		virtual Standard_Boolean IsValid();

		/****** PrsDim_Dimension::KindOfDimension ******/
		/****** md5 signature: 7721fa2fb7dfc5fb3635c615f43c1fcd ******/
		%feature("compactdefaultargs") KindOfDimension;
		%feature("autodoc", "Return
-------
PrsDim_KindOfDimension

Description
-----------
Return: the kind of dimension.
") KindOfDimension;
		PrsDim_KindOfDimension KindOfDimension();

		/****** PrsDim_Dimension::SelToleranceForText2d ******/
		/****** md5 signature: 5e1f7b036e9e0c1b485c5d8da6b6286a ******/
		%feature("compactdefaultargs") SelToleranceForText2d;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns selection tolerance for text2d: For 2d text selection detection sensitive point with tolerance is used Important! Only for 2d text.
") SelToleranceForText2d;
		Standard_Real SelToleranceForText2d();

		/****** PrsDim_Dimension::SetComputedValue ******/
		/****** md5 signature: 74883cf4b8a353dfbc969645f6db6362 ******/
		%feature("compactdefaultargs") SetComputedValue;
		%feature("autodoc", "Return
-------
None

Description
-----------
Sets computed dimension value. Resets custom value mode if it was set.
") SetComputedValue;
		void SetComputedValue();

		/****** PrsDim_Dimension::SetCustomPlane ******/
		/****** md5 signature: a371fba2e87123f75db102d389dc8aeb ******/
		%feature("compactdefaultargs") SetCustomPlane;
		%feature("autodoc", "
Parameters
----------
thePlane: gp_Pln

Return
-------
None

Description
-----------
Sets user-defined plane where the 2D dimension presentation will be placed. Checks validity of this plane if geometry has been set already. Validity of the plane is checked according to the geometry set and has different criteria for different kinds of dimensions.
") SetCustomPlane;
		virtual void SetCustomPlane(const gp_Pln & thePlane);

		/****** PrsDim_Dimension::SetCustomValue ******/
		/****** md5 signature: e4767ba55ab2e4ffbdd6196bdb4a2e75 ******/
		%feature("compactdefaultargs") SetCustomValue;
		%feature("autodoc", "
Parameters
----------
theValue: float

Return
-------
None

Description
-----------
Sets user-defined dimension value. The user-defined dimension value is specified in model space, and affect by unit conversion during the display. 
Input parameter: theValue the user-defined value to display.
") SetCustomValue;
		void SetCustomValue(const Standard_Real theValue);

		/****** PrsDim_Dimension::SetCustomValue ******/
		/****** md5 signature: aa638ede9bd0fe424934618474a9c131 ******/
		%feature("compactdefaultargs") SetCustomValue;
		%feature("autodoc", "
Parameters
----------
theValue: str

Return
-------
None

Description
-----------
Sets user-defined dimension value. Unit conversion during the display is not applied. 
Input parameter: theValue the user-defined value to display.
") SetCustomValue;
		void SetCustomValue(TCollection_ExtendedString theValue);

		/****** PrsDim_Dimension::SetDimensionAspect ******/
		/****** md5 signature: 653cffb5413acf12c0dc78f7606b5fb6 ******/
		%feature("compactdefaultargs") SetDimensionAspect;
		%feature("autodoc", "
Parameters
----------
theDimensionAspect: Prs3d_DimensionAspect

Return
-------
None

Description
-----------
Sets new dimension aspect for the interactive object drawer. The dimension aspect provides dynamic properties which are generally used during computation of dimension presentations.
") SetDimensionAspect;
		void SetDimensionAspect(const opencascade::handle<Prs3d_DimensionAspect> & theDimensionAspect);

		/****** PrsDim_Dimension::SetDisplaySpecialSymbol ******/
		/****** md5 signature: 0969631dd0d04e693d6eb1858740a67f ******/
		%feature("compactdefaultargs") SetDisplaySpecialSymbol;
		%feature("autodoc", "
Parameters
----------
theDisplaySpecSymbol: PrsDim_DisplaySpecialSymbol

Return
-------
None

Description
-----------
Specifies whether to display special symbol or not.
") SetDisplaySpecialSymbol;
		void SetDisplaySpecialSymbol(const PrsDim_DisplaySpecialSymbol theDisplaySpecSymbol);

		/****** PrsDim_Dimension::SetDisplayUnits ******/
		/****** md5 signature: 7c4ef2629b83770e3b1f5cd4e63cfe14 ******/
		%feature("compactdefaultargs") SetDisplayUnits;
		%feature("autodoc", "
Parameters
----------
&: str

Return
-------
None

Description
-----------
No available documentation.
") SetDisplayUnits;
		virtual void SetDisplayUnits(const TCollection_AsciiString &);

		/****** PrsDim_Dimension::SetFlyout ******/
		/****** md5 signature: 4a01b6b05617128166d05bb9d7623eae ******/
		%feature("compactdefaultargs") SetFlyout;
		%feature("autodoc", "
Parameters
----------
theFlyout: float

Return
-------
None

Description
-----------
Sets flyout value for dimension.
") SetFlyout;
		void SetFlyout(const Standard_Real theFlyout);

		/****** PrsDim_Dimension::SetModelUnits ******/
		/****** md5 signature: ff93ccdd85e84f0afae8a4d40959d10a ******/
		%feature("compactdefaultargs") SetModelUnits;
		%feature("autodoc", "
Parameters
----------
&: str

Return
-------
None

Description
-----------
No available documentation.
") SetModelUnits;
		virtual void SetModelUnits(const TCollection_AsciiString &);

		/****** PrsDim_Dimension::SetSelToleranceForText2d ******/
		/****** md5 signature: 537173bd79d28c6fa1429de304305501 ******/
		%feature("compactdefaultargs") SetSelToleranceForText2d;
		%feature("autodoc", "
Parameters
----------
theTol: float

Return
-------
None

Description
-----------
Sets selection tolerance for text2d: For 2d text selection detection sensitive point with tolerance is used to change this tolerance use this method Important! Only for 2d text.
") SetSelToleranceForText2d;
		void SetSelToleranceForText2d(const Standard_Real theTol);

		/****** PrsDim_Dimension::SetSpecialSymbol ******/
		/****** md5 signature: 9f205d745c9301fbbd3129b43fd8deb5 ******/
		%feature("compactdefaultargs") SetSpecialSymbol;
		%feature("autodoc", "
Parameters
----------
theSpecialSymbol: Standard_ExtCharacter

Return
-------
None

Description
-----------
Specifies special symbol.
") SetSpecialSymbol;
		void SetSpecialSymbol(const Standard_ExtCharacter theSpecialSymbol);

		/****** PrsDim_Dimension::SetTextPosition ******/
		/****** md5 signature: a461f493832c6de5dbec73ad9e2da9a0 ******/
		%feature("compactdefaultargs") SetTextPosition;
		%feature("autodoc", "
Parameters
----------
&: gp_Pnt

Return
-------
None

Description
-----------
Fixes the absolute text position and adjusts flyout, plane and text alignment according to it. Updates presentation if the text position is valid. ATTENTION! It does not change vertical text alignment. 
Input parameter: theTextPos the point of text position.
") SetTextPosition;
		virtual void SetTextPosition(const gp_Pnt &);

		/****** PrsDim_Dimension::SpecialSymbol ******/
		/****** md5 signature: 29a0ed47fd42ba819648af4ecd1c15a4 ******/
		%feature("compactdefaultargs") SpecialSymbol;
		%feature("autodoc", "Return
-------
Standard_ExtCharacter

Description
-----------
Return: special symbol.
") SpecialSymbol;
		Standard_ExtCharacter SpecialSymbol();

		/****** PrsDim_Dimension::Type ******/
		/****** md5 signature: bf4aea6b24d0b584b57c781f208134ec ******/
		%feature("compactdefaultargs") Type;
		%feature("autodoc", "Return
-------
AIS_KindOfInteractive

Description
-----------
Return: the kind of interactive.
") Type;
		virtual AIS_KindOfInteractive Type();

		/****** PrsDim_Dimension::UnsetCustomPlane ******/
		/****** md5 signature: 0545e29e8f1f4729d3901ed8c8f7965d ******/
		%feature("compactdefaultargs") UnsetCustomPlane;
		%feature("autodoc", "Return
-------
None

Description
-----------
Unsets user-defined plane. Therefore the plane for dimension will be computed automatically.
") UnsetCustomPlane;
		void UnsetCustomPlane();

		/****** PrsDim_Dimension::UnsetFixedTextPosition ******/
		/****** md5 signature: d8406cc4e1101ee7ff26d8abf793d532 ******/
		%feature("compactdefaultargs") UnsetFixedTextPosition;
		%feature("autodoc", "Return
-------
None

Description
-----------
Unsets user defined text positioning and enables text positioning by other parameters: text alignment, extension size, flyout and custom plane.
") UnsetFixedTextPosition;
		void UnsetFixedTextPosition();

};


%make_alias(PrsDim_Dimension)

%extend PrsDim_Dimension {
	%pythoncode {
	__repr__ = _dumps_object

	@methodnotwrapped
	def PrsDim_Dimension(self):
		pass
	}
};

/******************************
* class PrsDim_DimensionOwner *
******************************/
class PrsDim_DimensionOwner : public SelectMgr_EntityOwner {
	public:
		/****** PrsDim_DimensionOwner::PrsDim_DimensionOwner ******/
		/****** md5 signature: 0f78da7ae2bbeb967e6a5f23b16758b6 ******/
		%feature("compactdefaultargs") PrsDim_DimensionOwner;
		%feature("autodoc", "
Parameters
----------
theSelObject: SelectMgr_SelectableObject
theSelMode: PrsDim_DimensionSelectionMode
thePriority: int (optional, default to 0)

Return
-------
None

Description
-----------
Initializes the dimension owner, theSO, and attributes it the priority, thePriority.
") PrsDim_DimensionOwner;
		 PrsDim_DimensionOwner(const opencascade::handle<SelectMgr_SelectableObject> & theSelObject, const PrsDim_DimensionSelectionMode theSelMode, const Standard_Integer thePriority = 0);

		/****** PrsDim_DimensionOwner::HilightWithColor ******/
		/****** md5 signature: ff872ded3a30d3b368f40f78eef3d5d8 ******/
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
		virtual void HilightWithColor(const opencascade::handle<PrsMgr_PresentationManager> & thePM, const opencascade::handle<Prs3d_Drawer> & theStyle, const Standard_Integer theMode);

		/****** PrsDim_DimensionOwner::IsHilighted ******/
		/****** md5 signature: 47cdfcd94ad9e17a52e4b8d49964f328 ******/
		%feature("compactdefaultargs") IsHilighted;
		%feature("autodoc", "
Parameters
----------
thePM: PrsMgr_PresentationManager
theMode: int (optional, default to 0)

Return
-------
bool

Description
-----------
Returns true if an object with the selection mode aMode is highlighted in the presentation manager aPM.
") IsHilighted;
		virtual Standard_Boolean IsHilighted(const opencascade::handle<PrsMgr_PresentationManager> & thePM, const Standard_Integer theMode = 0);

		/****** PrsDim_DimensionOwner::SelectionMode ******/
		/****** md5 signature: 030647867bb4f5b297cabad21f1f01b3 ******/
		%feature("compactdefaultargs") SelectionMode;
		%feature("autodoc", "Return
-------
PrsDim_DimensionSelectionMode

Description
-----------
No available documentation.
") SelectionMode;
		PrsDim_DimensionSelectionMode SelectionMode();

		/****** PrsDim_DimensionOwner::Unhilight ******/
		/****** md5 signature: cbfa3741ba9c5eeac22e43360132f4ee ******/
		%feature("compactdefaultargs") Unhilight;
		%feature("autodoc", "
Parameters
----------
thePM: PrsMgr_PresentationManager
theMode: int (optional, default to 0)

Return
-------
None

Description
-----------
Removes highlighting from the selected part of dimension.
") Unhilight;
		virtual void Unhilight(const opencascade::handle<PrsMgr_PresentationManager> & thePM, const Standard_Integer theMode = 0);

};


%make_alias(PrsDim_DimensionOwner)

%extend PrsDim_DimensionOwner {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************
* class PrsDim_Relation *
************************/
%nodefaultctor PrsDim_Relation;
class PrsDim_Relation : public AIS_InteractiveObject {
	public:
		/****** PrsDim_Relation::AcceptDisplayMode ******/
		/****** md5 signature: 4c81f1c2cfc05fd196e1c09a383a3455 ******/
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
Returns true if the display mode aMode is accepted for the Interactive Objects in the relation. ComputeProjPresentation(me; aPres: Presentation from Prs3d; Curve1: Curve from Geom; Curve2: Curve from Geom; FirstP1: Pnt from gp; LastP1: Pnt from gp; FirstP2: Pnt from gp; LastP2: Pnt from gp; aColor: NameOfColor from Quantity = Quantity_NOC_PURPLE; aWidth: Real  from Standard = 2; aProjTOL: TypeOfLine  from Aspect = Aspect_TOL_DASH; aCallTOL: TypeOfLine  from Aspect = Aspect_TOL_DOT).
") AcceptDisplayMode;
		virtual Standard_Boolean AcceptDisplayMode(const Standard_Integer theMode);

		/****** PrsDim_Relation::ArrowSize ******/
		/****** md5 signature: 1c64631a05987281258edff790436577 ******/
		%feature("compactdefaultargs") ArrowSize;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the value for the size of the arrow identifying the relation between the two shapes.
") ArrowSize;
		Standard_Real ArrowSize();

		/****** PrsDim_Relation::AutomaticPosition ******/
		/****** md5 signature: 4069aa0ccd84519a8254a311ab36e427 ******/
		%feature("compactdefaultargs") AutomaticPosition;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") AutomaticPosition;
		Standard_Boolean AutomaticPosition();

		/****** PrsDim_Relation::ExtShape ******/
		/****** md5 signature: ba3f30014ebd951754e2319eb6678935 ******/
		%feature("compactdefaultargs") ExtShape;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the status index of the extension shape.
") ExtShape;
		Standard_Integer ExtShape();

		/****** PrsDim_Relation::FirstShape ******/
		/****** md5 signature: 0052eba922702f3e525649e52d93f4e7 ******/
		%feature("compactdefaultargs") FirstShape;
		%feature("autodoc", "Return
-------
TopoDS_Shape

Description
-----------
No available documentation.
") FirstShape;
		const TopoDS_Shape FirstShape();

		/****** PrsDim_Relation::IsMovable ******/
		/****** md5 signature: ecafaf47b8ef8a68ada41232f33d6a22 ******/
		%feature("compactdefaultargs") IsMovable;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if the interactive object is movable.
") IsMovable;
		virtual Standard_Boolean IsMovable();

		/****** PrsDim_Relation::KindOfDimension ******/
		/****** md5 signature: b37803c776d1eca88db8e43e3a5728c2 ******/
		%feature("compactdefaultargs") KindOfDimension;
		%feature("autodoc", "Return
-------
PrsDim_KindOfDimension

Description
-----------
Indicates that the type of dimension is unknown.
") KindOfDimension;
		virtual PrsDim_KindOfDimension KindOfDimension();

		/****** PrsDim_Relation::Plane ******/
		/****** md5 signature: 94aa2880e5105df8ee475ace1dfe0bd2 ******/
		%feature("compactdefaultargs") Plane;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom_Plane>

Description
-----------
Returns the plane.
") Plane;
		const opencascade::handle<Geom_Plane> & Plane();

		/****** PrsDim_Relation::Position ******/
		/****** md5 signature: 0ab08d371c89be0cb1eecbddf304bb77 ******/
		%feature("compactdefaultargs") Position;
		%feature("autodoc", "Return
-------
gp_Pnt

Description
-----------
Returns the position set using SetPosition.
") Position;
		const gp_Pnt Position();

		/****** PrsDim_Relation::SecondShape ******/
		/****** md5 signature: 3c9d5f80bfbcac42f6848475061ecf61 ******/
		%feature("compactdefaultargs") SecondShape;
		%feature("autodoc", "Return
-------
TopoDS_Shape

Description
-----------
Returns the second shape.
") SecondShape;
		const TopoDS_Shape SecondShape();

		/****** PrsDim_Relation::SetArrowSize ******/
		/****** md5 signature: 7f29c9d69ed4995251718b45132ef44a ******/
		%feature("compactdefaultargs") SetArrowSize;
		%feature("autodoc", "
Parameters
----------
theArrowSize: float

Return
-------
None

Description
-----------
Allows you to provide settings for the size of the arrow theArrowSize identifying the relation between the two shapes.
") SetArrowSize;
		void SetArrowSize(const Standard_Real theArrowSize);

		/****** PrsDim_Relation::SetAutomaticPosition ******/
		/****** md5 signature: eb2707fc0c7ac0140ed8fd4c80f28b34 ******/
		%feature("compactdefaultargs") SetAutomaticPosition;
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
") SetAutomaticPosition;
		void SetAutomaticPosition(const Standard_Boolean theStatus);

		/****** PrsDim_Relation::SetBndBox ******/
		/****** md5 signature: 7c3556dffd56ab1f14ecdaaf0953820a ******/
		%feature("compactdefaultargs") SetBndBox;
		%feature("autodoc", "
Parameters
----------
theXmin: float
theYmin: float
theZmin: float
theXmax: float
theYmax: float
theZmax: float

Return
-------
None

Description
-----------
No available documentation.
") SetBndBox;
		void SetBndBox(const Standard_Real theXmin, const Standard_Real theYmin, const Standard_Real theZmin, const Standard_Real theXmax, const Standard_Real theYmax, const Standard_Real theZmax);

		/****** PrsDim_Relation::SetColor ******/
		/****** md5 signature: 7e02f3e04e30cfab690f414e5d7614ca ******/
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
Allows you to provide settings for the color theColor of the lines representing the relation between the two shapes.
") SetColor;
		void SetColor(const Quantity_Color & theColor);

		/****** PrsDim_Relation::SetExtShape ******/
		/****** md5 signature: 86fc35735d1c517597a5d532e3f8521a ******/
		%feature("compactdefaultargs") SetExtShape;
		%feature("autodoc", "
Parameters
----------
theIndex: int

Return
-------
None

Description
-----------
Allows you to set the status of the extension shape by the index aIndex. The status will be one of the following: - 0 - there is no connection to a shape; - 1 - there is a connection to the first shape; - 2 - there is a connection to the second shape.
") SetExtShape;
		void SetExtShape(const Standard_Integer theIndex);

		/****** PrsDim_Relation::SetFirstShape ******/
		/****** md5 signature: f7c0b3fbbd537f19dc1e43a4c280284b ******/
		%feature("compactdefaultargs") SetFirstShape;
		%feature("autodoc", "
Parameters
----------
aFShape: TopoDS_Shape

Return
-------
None

Description
-----------
No available documentation.
") SetFirstShape;
		virtual void SetFirstShape(const TopoDS_Shape & aFShape);

		/****** PrsDim_Relation::SetPlane ******/
		/****** md5 signature: 950afcbb12a962d6ac501f5bcd6b2945 ******/
		%feature("compactdefaultargs") SetPlane;
		%feature("autodoc", "
Parameters
----------
thePlane: Geom_Plane

Return
-------
None

Description
-----------
Allows you to set the plane thePlane. This is used to define relations and dimensions in several daughter classes.
") SetPlane;
		void SetPlane(const opencascade::handle<Geom_Plane> & thePlane);

		/****** PrsDim_Relation::SetPosition ******/
		/****** md5 signature: 2f8cb3df196eb538026858474c42a042 ******/
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
Allows you to provide the objects in the relation with settings for a non-default position.
") SetPosition;
		void SetPosition(const gp_Pnt & thePosition);

		/****** PrsDim_Relation::SetSecondShape ******/
		/****** md5 signature: 54157e780f59d54d926c6850c9f86357 ******/
		%feature("compactdefaultargs") SetSecondShape;
		%feature("autodoc", "
Parameters
----------
aSShape: TopoDS_Shape

Return
-------
None

Description
-----------
Allows you to identify the second shape aSShape relative to the first.
") SetSecondShape;
		virtual void SetSecondShape(const TopoDS_Shape & aSShape);

		/****** PrsDim_Relation::SetSymbolPrs ******/
		/****** md5 signature: 703c256ba420e65c94dac6b87e3d6047 ******/
		%feature("compactdefaultargs") SetSymbolPrs;
		%feature("autodoc", "
Parameters
----------
theSymbolPrs: DsgPrs_ArrowSide

Return
-------
None

Description
-----------
Allows you to provide settings for the symbol presentation.
") SetSymbolPrs;
		void SetSymbolPrs(const DsgPrs_ArrowSide theSymbolPrs);

		/****** PrsDim_Relation::SetText ******/
		/****** md5 signature: b6056cb56568f8909dbeaac438ef83aa ******/
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
Allows you to provide the settings theText for text aspect.
") SetText;
		void SetText(TCollection_ExtendedString theText);

		/****** PrsDim_Relation::SetValue ******/
		/****** md5 signature: 5be0c2680e760a4f92ac7b7d3ae78786 ******/
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "
Parameters
----------
theVal: float

Return
-------
None

Description
-----------
Allows you to provide settings for the value theVal for each object in the relation.
") SetValue;
		void SetValue(const Standard_Real theVal);

		/****** PrsDim_Relation::SymbolPrs ******/
		/****** md5 signature: 7b81240b7c5c019dedce9d08539b00f1 ******/
		%feature("compactdefaultargs") SymbolPrs;
		%feature("autodoc", "Return
-------
DsgPrs_ArrowSide

Description
-----------
Returns the value of the symbol presentation. This will be one of: - AS_NONE - none - AS_FIRSTAR - first arrow - AS_LASTAR - last arrow - AS_BOTHAR - both arrows - AS_FIRSTPT - first point - AS_LASTPT - last point - AS_BOTHPT - both points - AS_FIRSTAR_LASTPT - first arrow, last point - AS_FIRSTPT_LASTAR - first point, last arrow.
") SymbolPrs;
		DsgPrs_ArrowSide SymbolPrs();

		/****** PrsDim_Relation::Text ******/
		/****** md5 signature: 72bf6306b0638727f5e5c6cb054bb79f ******/
		%feature("compactdefaultargs") Text;
		%feature("autodoc", "Return
-------
TCollection_ExtendedString

Description
-----------
Returns settings for text aspect.
") Text;
		const TCollection_ExtendedString & Text();

		/****** PrsDim_Relation::Type ******/
		/****** md5 signature: bf4aea6b24d0b584b57c781f208134ec ******/
		%feature("compactdefaultargs") Type;
		%feature("autodoc", "Return
-------
AIS_KindOfInteractive

Description
-----------
No available documentation.
") Type;
		virtual AIS_KindOfInteractive Type();

		/****** PrsDim_Relation::UnsetBndBox ******/
		/****** md5 signature: c3c34a2be55a0808b9eae7a500b23e3b ******/
		%feature("compactdefaultargs") UnsetBndBox;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") UnsetBndBox;
		void UnsetBndBox();

		/****** PrsDim_Relation::UnsetColor ******/
		/****** md5 signature: 305de4c541ce8067f3ff456f9ec26b55 ******/
		%feature("compactdefaultargs") UnsetColor;
		%feature("autodoc", "Return
-------
None

Description
-----------
Allows you to remove settings for the color of the lines representing the relation between the two shapes.
") UnsetColor;
		void UnsetColor();

		/****** PrsDim_Relation::Value ******/
		/****** md5 signature: 246826be964a300c707aadb5d0b62468 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the value of each object in the relation.
") Value;
		Standard_Real Value();

};


%make_alias(PrsDim_Relation)

%extend PrsDim_Relation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************
* class PrsDim_AngleDimension *
******************************/
class PrsDim_AngleDimension : public PrsDim_Dimension {
	public:
		/****** PrsDim_AngleDimension::PrsDim_AngleDimension ******/
		/****** md5 signature: bf03164e7fa61b2419edc5521a74c29a ******/
		%feature("compactdefaultargs") PrsDim_AngleDimension;
		%feature("autodoc", "
Parameters
----------
theFirstEdge: TopoDS_Edge
theSecondEdge: TopoDS_Edge

Return
-------
None

Description
-----------
Constructs minimum angle dimension between two linear edges (where possible). These two edges should be intersected by each other. Otherwise the geometry is not valid. 
Input parameter: theFirstEdge the first edge. 
Input parameter: theSecondEdge the second edge.
") PrsDim_AngleDimension;
		 PrsDim_AngleDimension(const TopoDS_Edge & theFirstEdge, const TopoDS_Edge & theSecondEdge);

		/****** PrsDim_AngleDimension::PrsDim_AngleDimension ******/
		/****** md5 signature: d124b521b92e8f56d45bee4f27d28998 ******/
		%feature("compactdefaultargs") PrsDim_AngleDimension;
		%feature("autodoc", "
Parameters
----------
theFirstPoint: gp_Pnt
theSecondPoint: gp_Pnt
theThirdPoint: gp_Pnt

Return
-------
None

Description
-----------
Constructs the angle display object defined by three points. 
Input parameter: theFirstPoint the first point (point on first angle flyout). 
Input parameter: theSecondPoint the center point of angle dimension. 
Input parameter: theThirdPoint the second point (point on second angle flyout).
") PrsDim_AngleDimension;
		 PrsDim_AngleDimension(const gp_Pnt & theFirstPoint, const gp_Pnt & theSecondPoint, const gp_Pnt & theThirdPoint);

		/****** PrsDim_AngleDimension::PrsDim_AngleDimension ******/
		/****** md5 signature: 22cddb7b3a3ff9cf81c69c4f7732968d ******/
		%feature("compactdefaultargs") PrsDim_AngleDimension;
		%feature("autodoc", "
Parameters
----------
theFirstVertex: TopoDS_Vertex
theSecondVertex: TopoDS_Vertex
theThirdVertex: TopoDS_Vertex

Return
-------
None

Description
-----------
Constructs the angle display object defined by three vertices. 
Input parameter: theFirstVertex the first vertex (vertex for first angle flyout). 
Input parameter: theSecondVertex the center vertex of angle dimension. 
Input parameter: theThirdPoint the second vertex (vertex for second angle flyout).
") PrsDim_AngleDimension;
		 PrsDim_AngleDimension(const TopoDS_Vertex & theFirstVertex, const TopoDS_Vertex & theSecondVertex, const TopoDS_Vertex & theThirdVertex);

		/****** PrsDim_AngleDimension::PrsDim_AngleDimension ******/
		/****** md5 signature: 8d326d750479ca2e859b83b8ce0591d4 ******/
		%feature("compactdefaultargs") PrsDim_AngleDimension;
		%feature("autodoc", "
Parameters
----------
theCone: TopoDS_Face

Return
-------
None

Description
-----------
Constructs angle dimension for the cone face. 
Input parameter: theCone the conical face.
") PrsDim_AngleDimension;
		 PrsDim_AngleDimension(const TopoDS_Face & theCone);

		/****** PrsDim_AngleDimension::PrsDim_AngleDimension ******/
		/****** md5 signature: d8f3a6ca0fc04a0ccadf8c1705db3dfa ******/
		%feature("compactdefaultargs") PrsDim_AngleDimension;
		%feature("autodoc", "
Parameters
----------
theFirstFace: TopoDS_Face
theSecondFace: TopoDS_Face

Return
-------
None

Description
-----------
Constructs angle dimension between two planar faces. 
Input parameter: theFirstFace the first face. 
Input parameter: theSecondFace the second face.
") PrsDim_AngleDimension;
		 PrsDim_AngleDimension(const TopoDS_Face & theFirstFace, const TopoDS_Face & theSecondFace);

		/****** PrsDim_AngleDimension::PrsDim_AngleDimension ******/
		/****** md5 signature: 43724685c047e9a14625bb3a31900efe ******/
		%feature("compactdefaultargs") PrsDim_AngleDimension;
		%feature("autodoc", "
Parameters
----------
theFirstFace: TopoDS_Face
theSecondFace: TopoDS_Face
thePoint: gp_Pnt

Return
-------
None

Description
-----------
Constructs angle dimension between two planar faces. 
Input parameter: theFirstFace the first face. 
Input parameter: theSecondFace the second face. 
Input parameter: thePoint the point which the dimension plane should pass through. This point can lay on the one of the faces or not.
") PrsDim_AngleDimension;
		 PrsDim_AngleDimension(const TopoDS_Face & theFirstFace, const TopoDS_Face & theSecondFace, const gp_Pnt & thePoint);

		/****** PrsDim_AngleDimension::CenterPoint ******/
		/****** md5 signature: 376d48ef89b723bce96dea4dcf286eaf ******/
		%feature("compactdefaultargs") CenterPoint;
		%feature("autodoc", "Return
-------
gp_Pnt

Description
-----------
Return: center point forming the angle.
") CenterPoint;
		const gp_Pnt CenterPoint();

		/****** PrsDim_AngleDimension::FirstPoint ******/
		/****** md5 signature: ce6daac63a94ae39a0d0bfa7edc5f3cd ******/
		%feature("compactdefaultargs") FirstPoint;
		%feature("autodoc", "Return
-------
gp_Pnt

Description
-----------
Return: first point forming the angle.
") FirstPoint;
		const gp_Pnt FirstPoint();

		/****** PrsDim_AngleDimension::FirstShape ******/
		/****** md5 signature: 0052eba922702f3e525649e52d93f4e7 ******/
		%feature("compactdefaultargs") FirstShape;
		%feature("autodoc", "Return
-------
TopoDS_Shape

Description
-----------
Return: first argument shape.
") FirstShape;
		const TopoDS_Shape FirstShape();

		/****** PrsDim_AngleDimension::GetArrowsVisibility ******/
		/****** md5 signature: 46cba3cb29a78865c51874e00db3f36b ******/
		%feature("compactdefaultargs") GetArrowsVisibility;
		%feature("autodoc", "Return
-------
PrsDim_TypeOfAngleArrowVisibility

Description
-----------
Return: the type of visibility of arrows.
") GetArrowsVisibility;
		PrsDim_TypeOfAngleArrowVisibility GetArrowsVisibility();

		/****** PrsDim_AngleDimension::GetDisplayUnits ******/
		/****** md5 signature: 6fbf70f12ad85e7a1835a85781f8abb8 ******/
		%feature("compactdefaultargs") GetDisplayUnits;
		%feature("autodoc", "Return
-------
TCollection_AsciiString

Description
-----------
Return: the display units string.
") GetDisplayUnits;
		virtual const TCollection_AsciiString & GetDisplayUnits();

		/****** PrsDim_AngleDimension::GetModelUnits ******/
		/****** md5 signature: 27dbe0cf13d3ca82bbb0bf570025f3a8 ******/
		%feature("compactdefaultargs") GetModelUnits;
		%feature("autodoc", "Return
-------
TCollection_AsciiString

Description
-----------
Return: the model units string.
") GetModelUnits;
		virtual const TCollection_AsciiString & GetModelUnits();

		/****** PrsDim_AngleDimension::GetTextPosition ******/
		/****** md5 signature: 62f290d0c1a25a3579f77b31be4010f2 ******/
		%feature("compactdefaultargs") GetTextPosition;
		%feature("autodoc", "Return
-------
gp_Pnt

Description
-----------
No available documentation.
") GetTextPosition;
		virtual gp_Pnt GetTextPosition();

		/****** PrsDim_AngleDimension::GetType ******/
		/****** md5 signature: 53492e82f74aaeb8eb534503e3b56f99 ******/
		%feature("compactdefaultargs") GetType;
		%feature("autodoc", "Return
-------
PrsDim_TypeOfAngle

Description
-----------
Return: the current angle type.
") GetType;
		PrsDim_TypeOfAngle GetType();

		/****** PrsDim_AngleDimension::SecondPoint ******/
		/****** md5 signature: 66319c8fbdc379c409c2efa67f6e79e2 ******/
		%feature("compactdefaultargs") SecondPoint;
		%feature("autodoc", "Return
-------
gp_Pnt

Description
-----------
Return: second point forming the angle.
") SecondPoint;
		const gp_Pnt SecondPoint();

		/****** PrsDim_AngleDimension::SecondShape ******/
		/****** md5 signature: 3c9d5f80bfbcac42f6848475061ecf61 ******/
		%feature("compactdefaultargs") SecondShape;
		%feature("autodoc", "Return
-------
TopoDS_Shape

Description
-----------
Return: second argument shape.
") SecondShape;
		const TopoDS_Shape SecondShape();

		/****** PrsDim_AngleDimension::SetArrowsVisibility ******/
		/****** md5 signature: 05364bdc4330c3e39178bd5550429736 ******/
		%feature("compactdefaultargs") SetArrowsVisibility;
		%feature("autodoc", "
Parameters
----------
theType: PrsDim_TypeOfAngleArrowVisibility

Return
-------
None

Description
-----------
Sets visible arrows type 
Input parameter: theType the type of visibility of arrows.
") SetArrowsVisibility;
		void SetArrowsVisibility(const PrsDim_TypeOfAngleArrowVisibility & theType);

		/****** PrsDim_AngleDimension::SetDisplayUnits ******/
		/****** md5 signature: afe69b618dcd1bcf849c7c525bd3f1db ******/
		%feature("compactdefaultargs") SetDisplayUnits;
		%feature("autodoc", "
Parameters
----------
theUnits: str

Return
-------
None

Description
-----------
No available documentation.
") SetDisplayUnits;
		virtual void SetDisplayUnits(TCollection_AsciiString theUnits);

		/****** PrsDim_AngleDimension::SetMeasuredGeometry ******/
		/****** md5 signature: bd2a1958aebc184ac052f65310544456 ******/
		%feature("compactdefaultargs") SetMeasuredGeometry;
		%feature("autodoc", "
Parameters
----------
theFirstEdge: TopoDS_Edge
theSecondEdge: TopoDS_Edge

Return
-------
None

Description
-----------
Measures minimum angle dimension between two linear edges. These two edges should be intersected by each other. Otherwise the geometry is not valid. 
Input parameter: theFirstEdge the first edge. 
Input parameter: theSecondEdge the second edge.
") SetMeasuredGeometry;
		void SetMeasuredGeometry(const TopoDS_Edge & theFirstEdge, const TopoDS_Edge & theSecondEdge);

		/****** PrsDim_AngleDimension::SetMeasuredGeometry ******/
		/****** md5 signature: 8370d49fd8b758a25710cc639a9511cd ******/
		%feature("compactdefaultargs") SetMeasuredGeometry;
		%feature("autodoc", "
Parameters
----------
theFirstPoint: gp_Pnt
theSecondPoint: gp_Pnt
theThridPoint: gp_Pnt

Return
-------
None

Description
-----------
Measures angle defined by three points. 
Input parameter: theFirstPoint the first point (point on first angle flyout). 
Input parameter: theSecondPoint the center point of angle dimension. 
Input parameter: theThirdPoint the second point (point on second angle flyout).
") SetMeasuredGeometry;
		void SetMeasuredGeometry(const gp_Pnt & theFirstPoint, const gp_Pnt & theSecondPoint, const gp_Pnt & theThridPoint);

		/****** PrsDim_AngleDimension::SetMeasuredGeometry ******/
		/****** md5 signature: 250b7a4fbb3059f28c11f7363968850b ******/
		%feature("compactdefaultargs") SetMeasuredGeometry;
		%feature("autodoc", "
Parameters
----------
theFirstVertex: TopoDS_Vertex
theSecondVertex: TopoDS_Vertex
theThirdVertex: TopoDS_Vertex

Return
-------
None

Description
-----------
Measures angle defined by three vertices. 
Input parameter: theFirstVertex the first vertex (vertex for first angle flyout). 
Input parameter: theSecondVertex the center vertex of angle dimension. 
Input parameter: theThirdPoint the second vertex (vertex for second angle flyout).
") SetMeasuredGeometry;
		void SetMeasuredGeometry(const TopoDS_Vertex & theFirstVertex, const TopoDS_Vertex & theSecondVertex, const TopoDS_Vertex & theThirdVertex);

		/****** PrsDim_AngleDimension::SetMeasuredGeometry ******/
		/****** md5 signature: 05157dc0a85dc9fbcd1befa60e9f98ee ******/
		%feature("compactdefaultargs") SetMeasuredGeometry;
		%feature("autodoc", "
Parameters
----------
theCone: TopoDS_Face

Return
-------
None

Description
-----------
Measures angle of conical face. 
Input parameter: theCone the shape to measure.
") SetMeasuredGeometry;
		void SetMeasuredGeometry(const TopoDS_Face & theCone);

		/****** PrsDim_AngleDimension::SetMeasuredGeometry ******/
		/****** md5 signature: bfe5f7ff6a46076a22cbf50a395e204f ******/
		%feature("compactdefaultargs") SetMeasuredGeometry;
		%feature("autodoc", "
Parameters
----------
theFirstFace: TopoDS_Face
theSecondFace: TopoDS_Face

Return
-------
None

Description
-----------
Measures angle between two planar faces. 
Input parameter: theFirstFace the first face. 
Input parameter: theSecondFace the second face..
") SetMeasuredGeometry;
		void SetMeasuredGeometry(const TopoDS_Face & theFirstFace, const TopoDS_Face & theSecondFace);

		/****** PrsDim_AngleDimension::SetMeasuredGeometry ******/
		/****** md5 signature: 1ba045d48067d962f09980869f2f63bf ******/
		%feature("compactdefaultargs") SetMeasuredGeometry;
		%feature("autodoc", "
Parameters
----------
theFirstFace: TopoDS_Face
theSecondFace: TopoDS_Face
thePoint: gp_Pnt

Return
-------
None

Description
-----------
Measures angle between two planar faces. 
Input parameter: theFirstFace the first face. 
Input parameter: theSecondFace the second face. 
Input parameter: thePoint the point which the dimension plane should pass through. This point can lay on the one of the faces or not.
") SetMeasuredGeometry;
		void SetMeasuredGeometry(const TopoDS_Face & theFirstFace, const TopoDS_Face & theSecondFace, const gp_Pnt & thePoint);

		/****** PrsDim_AngleDimension::SetModelUnits ******/
		/****** md5 signature: bac7da9c21ed70bf629179ea24a5af0c ******/
		%feature("compactdefaultargs") SetModelUnits;
		%feature("autodoc", "
Parameters
----------
theUnits: str

Return
-------
None

Description
-----------
No available documentation.
") SetModelUnits;
		virtual void SetModelUnits(TCollection_AsciiString theUnits);

		/****** PrsDim_AngleDimension::SetTextPosition ******/
		/****** md5 signature: f1658ae61229bf1e77ff3828626b747f ******/
		%feature("compactdefaultargs") SetTextPosition;
		%feature("autodoc", "
Parameters
----------
theTextPos: gp_Pnt

Return
-------
None

Description
-----------
Principle of horizontal text alignment settings: - divide circle into two halves according to attachment points - if aTextPos is between attach points -> Center + positive flyout - if aTextPos is not between attach points but in this half -> Left or Right + positive flyout - if aTextPos is between reflections of attach points -> Center + negative flyout - if aTextPos is not between reflections of attach points -> Left or Right + negative flyout.
") SetTextPosition;
		virtual void SetTextPosition(const gp_Pnt & theTextPos);

		/****** PrsDim_AngleDimension::SetType ******/
		/****** md5 signature: 28a8c9d530531365adf7a6cbf39408b9 ******/
		%feature("compactdefaultargs") SetType;
		%feature("autodoc", "
Parameters
----------
theType: PrsDim_TypeOfAngle

Return
-------
None

Description
-----------
Sets angle type. 
Input parameter: theType the type value.
") SetType;
		void SetType(const PrsDim_TypeOfAngle theType);

		/****** PrsDim_AngleDimension::ThirdShape ******/
		/****** md5 signature: bdef6863310cc2c387933980e76c0b33 ******/
		%feature("compactdefaultargs") ThirdShape;
		%feature("autodoc", "Return
-------
TopoDS_Shape

Description
-----------
Return: third argument shape.
") ThirdShape;
		const TopoDS_Shape ThirdShape();

};


%make_alias(PrsDim_AngleDimension)

%extend PrsDim_AngleDimension {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************
* class PrsDim_Chamf2dDimension *
********************************/
class PrsDim_Chamf2dDimension : public PrsDim_Relation {
	public:
		/****** PrsDim_Chamf2dDimension::PrsDim_Chamf2dDimension ******/
		/****** md5 signature: 0712755e6f89ca287a3362bbf4c04e44 ******/
		%feature("compactdefaultargs") PrsDim_Chamf2dDimension;
		%feature("autodoc", "
Parameters
----------
aFShape: TopoDS_Shape
aPlane: Geom_Plane
aVal: float
aText: str

Return
-------
None

Description
-----------
Constructs the display object for 2D chamfers. This object is defined by the face aFShape, the dimension aVal, the plane aPlane and the text aText.
") PrsDim_Chamf2dDimension;
		 PrsDim_Chamf2dDimension(const TopoDS_Shape & aFShape, const opencascade::handle<Geom_Plane> & aPlane, const Standard_Real aVal, TCollection_ExtendedString aText);

		/****** PrsDim_Chamf2dDimension::PrsDim_Chamf2dDimension ******/
		/****** md5 signature: 50cb8ca97e253bfa32a7e7efb9b6a289 ******/
		%feature("compactdefaultargs") PrsDim_Chamf2dDimension;
		%feature("autodoc", "
Parameters
----------
aFShape: TopoDS_Shape
aPlane: Geom_Plane
aVal: float
aText: str
aPosition: gp_Pnt
aSymbolPrs: DsgPrs_ArrowSide
anArrowSize: float (optional, default to 0.0)

Return
-------
None

Description
-----------
Constructs the display object for 2D chamfers. This object is defined by the face aFShape, the plane aPlane, the dimension aVal, the position aPosition, the type of arrow aSymbolPrs with the size anArrowSize, and the text aText.
") PrsDim_Chamf2dDimension;
		 PrsDim_Chamf2dDimension(const TopoDS_Shape & aFShape, const opencascade::handle<Geom_Plane> & aPlane, const Standard_Real aVal, TCollection_ExtendedString aText, const gp_Pnt & aPosition, const DsgPrs_ArrowSide aSymbolPrs, const Standard_Real anArrowSize = 0.0);

		/****** PrsDim_Chamf2dDimension::IsMovable ******/
		/****** md5 signature: f6ba7e60b1b3f70d71d7fe5631d123a5 ******/
		%feature("compactdefaultargs") IsMovable;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if the 2d chamfer dimension is movable.
") IsMovable;
		virtual Standard_Boolean IsMovable();

		/****** PrsDim_Chamf2dDimension::KindOfDimension ******/
		/****** md5 signature: d9fe1ab2881bf16089f50e785bf13209 ******/
		%feature("compactdefaultargs") KindOfDimension;
		%feature("autodoc", "Return
-------
PrsDim_KindOfDimension

Description
-----------
Indicates that we are concerned with a 2d length.
") KindOfDimension;
		virtual PrsDim_KindOfDimension KindOfDimension();

};


%make_alias(PrsDim_Chamf2dDimension)

%extend PrsDim_Chamf2dDimension {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************
* class PrsDim_Chamf3dDimension *
********************************/
class PrsDim_Chamf3dDimension : public PrsDim_Relation {
	public:
		/****** PrsDim_Chamf3dDimension::PrsDim_Chamf3dDimension ******/
		/****** md5 signature: cc0174a5707cf7ecb7a1e19732683825 ******/
		%feature("compactdefaultargs") PrsDim_Chamf3dDimension;
		%feature("autodoc", "
Parameters
----------
aFShape: TopoDS_Shape
aVal: float
aText: str

Return
-------
None

Description
-----------
Constructs a display object for 3D chamfers. This object is defined by the shape aFShape, the dimension aVal and the text aText.
") PrsDim_Chamf3dDimension;
		 PrsDim_Chamf3dDimension(const TopoDS_Shape & aFShape, const Standard_Real aVal, TCollection_ExtendedString aText);

		/****** PrsDim_Chamf3dDimension::PrsDim_Chamf3dDimension ******/
		/****** md5 signature: 485f32758f4c90220dd128f21c767125 ******/
		%feature("compactdefaultargs") PrsDim_Chamf3dDimension;
		%feature("autodoc", "
Parameters
----------
aFShape: TopoDS_Shape
aVal: float
aText: str
aPosition: gp_Pnt
aSymbolPrs: DsgPrs_ArrowSide
anArrowSize: float (optional, default to 0.0)

Return
-------
None

Description
-----------
Constructs a display object for 3D chamfers. This object is defined by the shape aFShape, the dimension aVal, the text aText, the point of origin of the chamfer aPosition, the type of arrow aSymbolPrs with the size anArrowSize.
") PrsDim_Chamf3dDimension;
		 PrsDim_Chamf3dDimension(const TopoDS_Shape & aFShape, const Standard_Real aVal, TCollection_ExtendedString aText, const gp_Pnt & aPosition, const DsgPrs_ArrowSide aSymbolPrs, const Standard_Real anArrowSize = 0.0);

		/****** PrsDim_Chamf3dDimension::IsMovable ******/
		/****** md5 signature: f6ba7e60b1b3f70d71d7fe5631d123a5 ******/
		%feature("compactdefaultargs") IsMovable;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if the 3d chamfer dimension is movable.
") IsMovable;
		virtual Standard_Boolean IsMovable();

		/****** PrsDim_Chamf3dDimension::KindOfDimension ******/
		/****** md5 signature: d9fe1ab2881bf16089f50e785bf13209 ******/
		%feature("compactdefaultargs") KindOfDimension;
		%feature("autodoc", "Return
-------
PrsDim_KindOfDimension

Description
-----------
Indicates that we are concerned with a 3d length.
") KindOfDimension;
		virtual PrsDim_KindOfDimension KindOfDimension();

};


%make_alias(PrsDim_Chamf3dDimension)

%extend PrsDim_Chamf3dDimension {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************************
* class PrsDim_ConcentricRelation *
**********************************/
class PrsDim_ConcentricRelation : public PrsDim_Relation {
	public:
		/****** PrsDim_ConcentricRelation::PrsDim_ConcentricRelation ******/
		/****** md5 signature: 869509701791277168c3b554d85b4bd2 ******/
		%feature("compactdefaultargs") PrsDim_ConcentricRelation;
		%feature("autodoc", "
Parameters
----------
aFShape: TopoDS_Shape
aSShape: TopoDS_Shape
aPlane: Geom_Plane

Return
-------
None

Description
-----------
Constructs the display object for concentric relations between shapes. This object is defined by the two shapes, aFShape and aSShape and the plane aPlane. aPlane is provided to create an axis along which the relation of concentricity can be extended.
") PrsDim_ConcentricRelation;
		 PrsDim_ConcentricRelation(const TopoDS_Shape & aFShape, const TopoDS_Shape & aSShape, const opencascade::handle<Geom_Plane> & aPlane);

};


%make_alias(PrsDim_ConcentricRelation)

%extend PrsDim_ConcentricRelation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************
* class PrsDim_DiameterDimension *
*********************************/
class PrsDim_DiameterDimension : public PrsDim_Dimension {
	public:
		/****** PrsDim_DiameterDimension::PrsDim_DiameterDimension ******/
		/****** md5 signature: 4d6e682d3504d2fa30b05cfdfc9256f9 ******/
		%feature("compactdefaultargs") PrsDim_DiameterDimension;
		%feature("autodoc", "
Parameters
----------
theCircle: gp_Circ

Return
-------
None

Description
-----------
Construct diameter dimension for the circle. 
Input parameter: theCircle the circle to measure.
") PrsDim_DiameterDimension;
		 PrsDim_DiameterDimension(const gp_Circ & theCircle);

		/****** PrsDim_DiameterDimension::PrsDim_DiameterDimension ******/
		/****** md5 signature: 3d81b47b28524dc65c959bcc5c959fd4 ******/
		%feature("compactdefaultargs") PrsDim_DiameterDimension;
		%feature("autodoc", "
Parameters
----------
theCircle: gp_Circ
thePlane: gp_Pln

Return
-------
None

Description
-----------
Construct diameter dimension for the circle and orient it correspondingly to the passed plane. 
Input parameter: theCircle the circle to measure. 
Input parameter: thePlane the plane defining preferred orientation for dimension.
") PrsDim_DiameterDimension;
		 PrsDim_DiameterDimension(const gp_Circ & theCircle, const gp_Pln & thePlane);

		/****** PrsDim_DiameterDimension::PrsDim_DiameterDimension ******/
		/****** md5 signature: 4a1cf23da6b5862081f203f8e54205de ******/
		%feature("compactdefaultargs") PrsDim_DiameterDimension;
		%feature("autodoc", "
Parameters
----------
theShape: TopoDS_Shape

Return
-------
None

Description
-----------
Construct diameter on the passed shape, if applicable. 
Input parameter: theShape the shape to measure.
") PrsDim_DiameterDimension;
		 PrsDim_DiameterDimension(const TopoDS_Shape & theShape);

		/****** PrsDim_DiameterDimension::PrsDim_DiameterDimension ******/
		/****** md5 signature: 1f81cad559daecd01fa67a0c212e25e5 ******/
		%feature("compactdefaultargs") PrsDim_DiameterDimension;
		%feature("autodoc", "
Parameters
----------
theShape: TopoDS_Shape
thePlane: gp_Pln

Return
-------
None

Description
-----------
Construct diameter on the passed shape, if applicable - and define the preferred plane to orient the dimension. 
Input parameter: theShape the shape to measure. 
Input parameter: thePlane the plane defining preferred orientation for dimension.
") PrsDim_DiameterDimension;
		 PrsDim_DiameterDimension(const TopoDS_Shape & theShape, const gp_Pln & thePlane);

		/****** PrsDim_DiameterDimension::AnchorPoint ******/
		/****** md5 signature: 92adc8b9baf75c6634009a53820f63a3 ******/
		%feature("compactdefaultargs") AnchorPoint;
		%feature("autodoc", "Return
-------
gp_Pnt

Description
-----------
Return: anchor point on circle for diameter dimension.
") AnchorPoint;
		gp_Pnt AnchorPoint();

		/****** PrsDim_DiameterDimension::Circle ******/
		/****** md5 signature: 1eaea6bdc97e0fc2fac6cefd24825e1a ******/
		%feature("compactdefaultargs") Circle;
		%feature("autodoc", "Return
-------
gp_Circ

Description
-----------
Return: measured geometry circle.
") Circle;
		const gp_Circ Circle();

		/****** PrsDim_DiameterDimension::GetDisplayUnits ******/
		/****** md5 signature: 6fbf70f12ad85e7a1835a85781f8abb8 ******/
		%feature("compactdefaultargs") GetDisplayUnits;
		%feature("autodoc", "Return
-------
TCollection_AsciiString

Description
-----------
Return: the display units string.
") GetDisplayUnits;
		virtual const TCollection_AsciiString & GetDisplayUnits();

		/****** PrsDim_DiameterDimension::GetModelUnits ******/
		/****** md5 signature: 27dbe0cf13d3ca82bbb0bf570025f3a8 ******/
		%feature("compactdefaultargs") GetModelUnits;
		%feature("autodoc", "Return
-------
TCollection_AsciiString

Description
-----------
Return: the model units string.
") GetModelUnits;
		virtual const TCollection_AsciiString & GetModelUnits();

		/****** PrsDim_DiameterDimension::GetTextPosition ******/
		/****** md5 signature: 62f290d0c1a25a3579f77b31be4010f2 ******/
		%feature("compactdefaultargs") GetTextPosition;
		%feature("autodoc", "Return
-------
gp_Pnt

Description
-----------
No available documentation.
") GetTextPosition;
		virtual gp_Pnt GetTextPosition();

		/****** PrsDim_DiameterDimension::SetDisplayUnits ******/
		/****** md5 signature: afe69b618dcd1bcf849c7c525bd3f1db ******/
		%feature("compactdefaultargs") SetDisplayUnits;
		%feature("autodoc", "
Parameters
----------
theUnits: str

Return
-------
None

Description
-----------
No available documentation.
") SetDisplayUnits;
		virtual void SetDisplayUnits(TCollection_AsciiString theUnits);

		/****** PrsDim_DiameterDimension::SetMeasuredGeometry ******/
		/****** md5 signature: c1b9a4fe27f3e19a1218bcbc41264af8 ******/
		%feature("compactdefaultargs") SetMeasuredGeometry;
		%feature("autodoc", "
Parameters
----------
theCircle: gp_Circ

Return
-------
None

Description
-----------
Measure diameter of the circle. The actual dimension plane is used for determining anchor points on the circle to attach the dimension lines to. The dimension will become invalid if the diameter of the circle is less than Precision::Confusion(). 
Input parameter: theCircle the circle to measure.
") SetMeasuredGeometry;
		void SetMeasuredGeometry(const gp_Circ & theCircle);

		/****** PrsDim_DiameterDimension::SetMeasuredGeometry ******/
		/****** md5 signature: 38eeeac1c934d2bc9090d5e208e54b6e ******/
		%feature("compactdefaultargs") SetMeasuredGeometry;
		%feature("autodoc", "
Parameters
----------
theShape: TopoDS_Shape

Return
-------
None

Description
-----------
Measure diameter on the passed shape, if applicable. The dimension will become invalid if the passed shape is not measurable or if measured diameter value is less than Precision::Confusion(). 
Input parameter: theShape the shape to measure.
") SetMeasuredGeometry;
		void SetMeasuredGeometry(const TopoDS_Shape & theShape);

		/****** PrsDim_DiameterDimension::SetModelUnits ******/
		/****** md5 signature: bac7da9c21ed70bf629179ea24a5af0c ******/
		%feature("compactdefaultargs") SetModelUnits;
		%feature("autodoc", "
Parameters
----------
theUnits: str

Return
-------
None

Description
-----------
No available documentation.
") SetModelUnits;
		virtual void SetModelUnits(TCollection_AsciiString theUnits);

		/****** PrsDim_DiameterDimension::SetTextPosition ******/
		/****** md5 signature: f1658ae61229bf1e77ff3828626b747f ******/
		%feature("compactdefaultargs") SetTextPosition;
		%feature("autodoc", "
Parameters
----------
theTextPos: gp_Pnt

Return
-------
None

Description
-----------
No available documentation.
") SetTextPosition;
		virtual void SetTextPosition(const gp_Pnt & theTextPos);

		/****** PrsDim_DiameterDimension::Shape ******/
		/****** md5 signature: 1058569f5d639354fedf11e73741b7df ******/
		%feature("compactdefaultargs") Shape;
		%feature("autodoc", "Return
-------
TopoDS_Shape

Description
-----------
Return: the measured shape.
") Shape;
		const TopoDS_Shape Shape();

};


%make_alias(PrsDim_DiameterDimension)

%extend PrsDim_DiameterDimension {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************************
* class PrsDim_EllipseRadiusDimension *
**************************************/
%nodefaultctor PrsDim_EllipseRadiusDimension;
class PrsDim_EllipseRadiusDimension : public PrsDim_Relation {
	public:
		/****** PrsDim_EllipseRadiusDimension::ComputeGeometry ******/
		/****** md5 signature: 690247bb657a85c155cdc17b6745df6a ******/
		%feature("compactdefaultargs") ComputeGeometry;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") ComputeGeometry;
		void ComputeGeometry();

		/****** PrsDim_EllipseRadiusDimension::IsMovable ******/
		/****** md5 signature: f6ba7e60b1b3f70d71d7fe5631d123a5 ******/
		%feature("compactdefaultargs") IsMovable;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsMovable;
		virtual Standard_Boolean IsMovable();

		/****** PrsDim_EllipseRadiusDimension::KindOfDimension ******/
		/****** md5 signature: d9fe1ab2881bf16089f50e785bf13209 ******/
		%feature("compactdefaultargs") KindOfDimension;
		%feature("autodoc", "Return
-------
PrsDim_KindOfDimension

Description
-----------
No available documentation.
") KindOfDimension;
		virtual PrsDim_KindOfDimension KindOfDimension();

};


%make_alias(PrsDim_EllipseRadiusDimension)

%extend PrsDim_EllipseRadiusDimension {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************************
* class PrsDim_EqualDistanceRelation *
*************************************/
class PrsDim_EqualDistanceRelation : public PrsDim_Relation {
	public:
		/****** PrsDim_EqualDistanceRelation::PrsDim_EqualDistanceRelation ******/
		/****** md5 signature: 177d5bcd8d5434054f860081ea28e08e ******/
		%feature("compactdefaultargs") PrsDim_EqualDistanceRelation;
		%feature("autodoc", "
Parameters
----------
aShape1: TopoDS_Shape
aShape2: TopoDS_Shape
aShape3: TopoDS_Shape
aShape4: TopoDS_Shape
aPlane: Geom_Plane

Return
-------
None

Description
-----------
Constructs a framework to display equivalent distances between the shapes aShape1, aShape2, aShape3, aShape4 and the plane aPlane. The distance is the length of a projection from the shape to the plane.
") PrsDim_EqualDistanceRelation;
		 PrsDim_EqualDistanceRelation(const TopoDS_Shape & aShape1, const TopoDS_Shape & aShape2, const TopoDS_Shape & aShape3, const TopoDS_Shape & aShape4, const opencascade::handle<Geom_Plane> & aPlane);

		/****** PrsDim_EqualDistanceRelation::ComputeOneEdgeOneVertexLength ******/
		/****** md5 signature: c8433bd8e1b8b43c506c26453cfea334 ******/
		%feature("compactdefaultargs") ComputeOneEdgeOneVertexLength;
		%feature("autodoc", "
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

Return
-------
SymbolPrs: DsgPrs_ArrowSide

Description
-----------
Compute the interval location between a vertex and an edge. Edge may be a line or a circle.
") ComputeOneEdgeOneVertexLength;
		static void ComputeOneEdgeOneVertexLength(const opencascade::handle<Prs3d_Presentation> & aPresentation, const opencascade::handle<Prs3d_Drawer> & aDrawer, const Standard_Real ArrowSize, const TopoDS_Shape & FirstShape, const TopoDS_Shape & SecondShape, const opencascade::handle<Geom_Plane> & Plane, const Standard_Boolean AutomaticPos, const Standard_Boolean IsSetBndBox, const Bnd_Box & BndBox, gp_Pnt & Position, gp_Pnt & FirstAttach, gp_Pnt & SecondAttach, gp_Pnt & FirstExtreme, gp_Pnt & SecondExtreme, DsgPrs_ArrowSide &OutValue);

		/****** PrsDim_EqualDistanceRelation::ComputeTwoEdgesLength ******/
		/****** md5 signature: 8f004ba6dc5773a9742094e3b3f3f885 ******/
		%feature("compactdefaultargs") ComputeTwoEdgesLength;
		%feature("autodoc", "
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

Return
-------
SymbolPrs: DsgPrs_ArrowSide

Description
-----------
Computes the location of an intreval between between two edges. FirstAttach , SecondAttach are the returned extreme points of the interval.
") ComputeTwoEdgesLength;
		static void ComputeTwoEdgesLength(const opencascade::handle<Prs3d_Presentation> & aPresentation, const opencascade::handle<Prs3d_Drawer> & aDrawer, const Standard_Real ArrowSize, const TopoDS_Edge & FirstEdge, const TopoDS_Edge & SecondEdge, const opencascade::handle<Geom_Plane> & Plane, const Standard_Boolean AutomaticPos, const Standard_Boolean IsSetBndBox, const Bnd_Box & BndBox, gp_Pnt & Position, gp_Pnt & FirstAttach, gp_Pnt & SecondAttach, gp_Pnt & FirstExtreme, gp_Pnt & SecondExtreme, DsgPrs_ArrowSide &OutValue);

		/****** PrsDim_EqualDistanceRelation::ComputeTwoVerticesLength ******/
		/****** md5 signature: c2cf26f4f3674622aff9461abba45f4c ******/
		%feature("compactdefaultargs") ComputeTwoVerticesLength;
		%feature("autodoc", "
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
TypeDist: PrsDim_TypeOfDist
Position: gp_Pnt
FirstAttach: gp_Pnt
SecondAttach: gp_Pnt
FirstExtreme: gp_Pnt
SecondExtreme: gp_Pnt

Return
-------
SymbolPrs: DsgPrs_ArrowSide

Description
-----------
Computes the interval position between two vertexs. FirstAttach, SecondAttach are the returned extreme points of the interval.
") ComputeTwoVerticesLength;
		static void ComputeTwoVerticesLength(const opencascade::handle<Prs3d_Presentation> & aPresentation, const opencascade::handle<Prs3d_Drawer> & aDrawer, const Standard_Real ArrowSize, const TopoDS_Vertex & FirstVertex, const TopoDS_Vertex & SecondVertex, const opencascade::handle<Geom_Plane> & Plane, const Standard_Boolean AutomaticPos, const Standard_Boolean IsSetBndBox, const Bnd_Box & BndBox, const PrsDim_TypeOfDist TypeDist, gp_Pnt & Position, gp_Pnt & FirstAttach, gp_Pnt & SecondAttach, gp_Pnt & FirstExtreme, gp_Pnt & SecondExtreme, DsgPrs_ArrowSide &OutValue);

		/****** PrsDim_EqualDistanceRelation::SetShape3 ******/
		/****** md5 signature: 0a91376bd67771bc8ca45b6e52a2dec0 ******/
		%feature("compactdefaultargs") SetShape3;
		%feature("autodoc", "
Parameters
----------
aShape: TopoDS_Shape

Return
-------
None

Description
-----------
Sets the shape aShape to be used as the shape aShape3 in the framework created at construction time.
") SetShape3;
		void SetShape3(const TopoDS_Shape & aShape);

		/****** PrsDim_EqualDistanceRelation::SetShape4 ******/
		/****** md5 signature: f543a54216be5af8a263607fd632ceac ******/
		%feature("compactdefaultargs") SetShape4;
		%feature("autodoc", "
Parameters
----------
aShape: TopoDS_Shape

Return
-------
None

Description
-----------
Sets the shape aShape to be used as the shape aShape4 in the framework created at construction time.
") SetShape4;
		void SetShape4(const TopoDS_Shape & aShape);

		/****** PrsDim_EqualDistanceRelation::Shape3 ******/
		/****** md5 signature: ea136b7f794b164fd01f6891c7e8b287 ******/
		%feature("compactdefaultargs") Shape3;
		%feature("autodoc", "Return
-------
TopoDS_Shape

Description
-----------
Returns the shape aShape3 from the framework created at construction time.
") Shape3;
		const TopoDS_Shape Shape3();

		/****** PrsDim_EqualDistanceRelation::Shape4 ******/
		/****** md5 signature: 1022108095550fde66494c51385f1649 ******/
		%feature("compactdefaultargs") Shape4;
		%feature("autodoc", "Return
-------
TopoDS_Shape

Description
-----------
Returns the shape aShape4 from the framework created at construction time.
") Shape4;
		const TopoDS_Shape Shape4();

};


%make_alias(PrsDim_EqualDistanceRelation)

%extend PrsDim_EqualDistanceRelation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************************
* class PrsDim_EqualRadiusRelation *
***********************************/
class PrsDim_EqualRadiusRelation : public PrsDim_Relation {
	public:
		/****** PrsDim_EqualRadiusRelation::PrsDim_EqualRadiusRelation ******/
		/****** md5 signature: 4b46dbada063b2999b7ff8e714bab44f ******/
		%feature("compactdefaultargs") PrsDim_EqualRadiusRelation;
		%feature("autodoc", "
Parameters
----------
aFirstEdge: TopoDS_Edge
aSecondEdge: TopoDS_Edge
aPlane: Geom_Plane

Return
-------
None

Description
-----------
Creates equal relation of two arc's radiuses. If one of edges is not in the given plane, the presentation method projects it onto the plane.
") PrsDim_EqualRadiusRelation;
		 PrsDim_EqualRadiusRelation(const TopoDS_Edge & aFirstEdge, const TopoDS_Edge & aSecondEdge, const opencascade::handle<Geom_Plane> & aPlane);

};


%make_alias(PrsDim_EqualRadiusRelation)

%extend PrsDim_EqualRadiusRelation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************
* class PrsDim_FixRelation *
***************************/
class PrsDim_FixRelation : public PrsDim_Relation {
	public:
		/****** PrsDim_FixRelation::PrsDim_FixRelation ******/
		/****** md5 signature: 2f1406036f8ae3877ac72ec3ff9b1158 ******/
		%feature("compactdefaultargs") PrsDim_FixRelation;
		%feature("autodoc", "
Parameters
----------
aShape: TopoDS_Shape
aPlane: Geom_Plane
aWire: TopoDS_Wire

Return
-------
None

Description
-----------
initializes the vertex aShape, the plane aPlane and the wire aWire, which connects the two vertices in a fixed relation.
") PrsDim_FixRelation;
		 PrsDim_FixRelation(const TopoDS_Shape & aShape, const opencascade::handle<Geom_Plane> & aPlane, const TopoDS_Wire & aWire);

		/****** PrsDim_FixRelation::PrsDim_FixRelation ******/
		/****** md5 signature: 8119c428e8ad02c160e25cb8f441f83f ******/
		%feature("compactdefaultargs") PrsDim_FixRelation;
		%feature("autodoc", "
Parameters
----------
aShape: TopoDS_Shape
aPlane: Geom_Plane
aWire: TopoDS_Wire
aPosition: gp_Pnt
anArrowSize: float (optional, default to 0.01)

Return
-------
None

Description
-----------
initializes the vertex aShape, the plane aPlane and the wire aWire, the position aPosition, the arrow size anArrowSize and the wire aWire, which connects the two vertices in a fixed relation.
") PrsDim_FixRelation;
		 PrsDim_FixRelation(const TopoDS_Shape & aShape, const opencascade::handle<Geom_Plane> & aPlane, const TopoDS_Wire & aWire, const gp_Pnt & aPosition, const Standard_Real anArrowSize = 0.01);

		/****** PrsDim_FixRelation::PrsDim_FixRelation ******/
		/****** md5 signature: ae700fea0e3dd07875d6262addb682db ******/
		%feature("compactdefaultargs") PrsDim_FixRelation;
		%feature("autodoc", "
Parameters
----------
aShape: TopoDS_Shape
aPlane: Geom_Plane

Return
-------
None

Description
-----------
initializes the edge aShape and the plane aPlane.
") PrsDim_FixRelation;
		 PrsDim_FixRelation(const TopoDS_Shape & aShape, const opencascade::handle<Geom_Plane> & aPlane);

		/****** PrsDim_FixRelation::PrsDim_FixRelation ******/
		/****** md5 signature: a2cbe852faae05e93fca70a7045165ee ******/
		%feature("compactdefaultargs") PrsDim_FixRelation;
		%feature("autodoc", "
Parameters
----------
aShape: TopoDS_Shape
aPlane: Geom_Plane
aPosition: gp_Pnt
anArrowSize: float (optional, default to 0.01)

Return
-------
None

Description
-----------
initializes the edge aShape, the plane aPlane, the position aPosition and the arrow size anArrowSize.
") PrsDim_FixRelation;
		 PrsDim_FixRelation(const TopoDS_Shape & aShape, const opencascade::handle<Geom_Plane> & aPlane, const gp_Pnt & aPosition, const Standard_Real anArrowSize = 0.01);

		/****** PrsDim_FixRelation::IsMovable ******/
		/****** md5 signature: f6ba7e60b1b3f70d71d7fe5631d123a5 ******/
		%feature("compactdefaultargs") IsMovable;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if the Interactive Objects in the relation are movable.
") IsMovable;
		virtual Standard_Boolean IsMovable();

		/****** PrsDim_FixRelation::SetWire ******/
		/****** md5 signature: 1e6ab77bc57c7750fc9b90fbf0c4cfc5 ******/
		%feature("compactdefaultargs") SetWire;
		%feature("autodoc", "
Parameters
----------
aWire: TopoDS_Wire

Return
-------
None

Description
-----------
Constructs the wire aWire. This connects vertices which are in a fixed relation.
") SetWire;
		void SetWire(const TopoDS_Wire & aWire);

		/****** PrsDim_FixRelation::Wire ******/
		/****** md5 signature: 305c9a4b8bd30e0b3d180ae1912b1938 ******/
		%feature("compactdefaultargs") Wire;
		%feature("autodoc", "Return
-------
TopoDS_Wire

Description
-----------
Returns the wire which connects vertices in a fixed relation.
") Wire;
		const TopoDS_Wire Wire();

};


%make_alias(PrsDim_FixRelation)

%extend PrsDim_FixRelation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************
* class PrsDim_IdenticRelation *
*******************************/
class PrsDim_IdenticRelation : public PrsDim_Relation {
	public:
		/****** PrsDim_IdenticRelation::PrsDim_IdenticRelation ******/
		/****** md5 signature: 608c13eec6054dfc49a137c537516651 ******/
		%feature("compactdefaultargs") PrsDim_IdenticRelation;
		%feature("autodoc", "
Parameters
----------
FirstShape: TopoDS_Shape
SecondShape: TopoDS_Shape
aPlane: Geom_Plane

Return
-------
None

Description
-----------
Initializes the relation of identity between the two entities, FirstShape and SecondShape. The plane aPlane is initialized in case a visual reference is needed to show identity.
") PrsDim_IdenticRelation;
		 PrsDim_IdenticRelation(const TopoDS_Shape & FirstShape, const TopoDS_Shape & SecondShape, const opencascade::handle<Geom_Plane> & aPlane);

		/****** PrsDim_IdenticRelation::AddUser ******/
		/****** md5 signature: 96e81e223c191f89f7f54782a86a0e55 ******/
		%feature("compactdefaultargs") AddUser;
		%feature("autodoc", "
Parameters
----------
theUser: Standard_Transient

Return
-------
None

Description
-----------
No available documentation.
") AddUser;
		void AddUser(const opencascade::handle<Standard_Transient> & theUser);

		/****** PrsDim_IdenticRelation::ClearUsers ******/
		/****** md5 signature: f911b16400daf995643262aaebb56bf9 ******/
		%feature("compactdefaultargs") ClearUsers;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") ClearUsers;
		void ClearUsers();

		/****** PrsDim_IdenticRelation::HasUsers ******/
		/****** md5 signature: aedf7f0293a5ad9e45c4f97ca68483fb ******/
		%feature("compactdefaultargs") HasUsers;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") HasUsers;
		Standard_Boolean HasUsers();

		/****** PrsDim_IdenticRelation::IsMovable ******/
		/****** md5 signature: f6ba7e60b1b3f70d71d7fe5631d123a5 ******/
		%feature("compactdefaultargs") IsMovable;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if the interactive object is movable.
") IsMovable;
		virtual Standard_Boolean IsMovable();

		/****** PrsDim_IdenticRelation::Users ******/
		/****** md5 signature: 65858c69a6e24c72829560eee6991487 ******/
		%feature("compactdefaultargs") Users;
		%feature("autodoc", "Return
-------
TColStd_ListOfTransient

Description
-----------
No available documentation.
") Users;
		const TColStd_ListOfTransient & Users();

};


%make_alias(PrsDim_IdenticRelation)

%extend PrsDim_IdenticRelation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************
* class PrsDim_LengthDimension *
*******************************/
class PrsDim_LengthDimension : public PrsDim_Dimension {
	public:
		/****** PrsDim_LengthDimension::PrsDim_LengthDimension ******/
		/****** md5 signature: 76e262900b82f282d533e9d72cd330de ******/
		%feature("compactdefaultargs") PrsDim_LengthDimension;
		%feature("autodoc", "Return
-------
None

Description
-----------
Construct an empty length dimension. 
See also: SetMeasuredGeometry(), SetMeasuredShapes() for initialization.
") PrsDim_LengthDimension;
		 PrsDim_LengthDimension();

		/****** PrsDim_LengthDimension::PrsDim_LengthDimension ******/
		/****** md5 signature: b8d2bd968153bc92dd94147ef64017a0 ******/
		%feature("compactdefaultargs") PrsDim_LengthDimension;
		%feature("autodoc", "
Parameters
----------
theFace: TopoDS_Face
theEdge: TopoDS_Edge

Return
-------
None

Description
-----------
Construct length dimension between face and edge. Here dimension can be built without user-defined plane. 
Input parameter: theFace the face (first shape). 
Input parameter: theEdge the edge (second shape).
") PrsDim_LengthDimension;
		 PrsDim_LengthDimension(const TopoDS_Face & theFace, const TopoDS_Edge & theEdge);

		/****** PrsDim_LengthDimension::PrsDim_LengthDimension ******/
		/****** md5 signature: 97c54af5deffc3eb1b9f7af615285832 ******/
		%feature("compactdefaultargs") PrsDim_LengthDimension;
		%feature("autodoc", "
Parameters
----------
theFirstFace: TopoDS_Face
theSecondFace: TopoDS_Face

Return
-------
None

Description
-----------
Construct length dimension between two faces. 
Input parameter: theFirstFace the first face (first shape). 
Input parameter: theSecondFace the second face (second shape).
") PrsDim_LengthDimension;
		 PrsDim_LengthDimension(const TopoDS_Face & theFirstFace, const TopoDS_Face & theSecondFace);

		/****** PrsDim_LengthDimension::PrsDim_LengthDimension ******/
		/****** md5 signature: 8e4e73b42a947e7324da17452cfb1d99 ******/
		%feature("compactdefaultargs") PrsDim_LengthDimension;
		%feature("autodoc", "
Parameters
----------
theFirstPoint: gp_Pnt
theSecondPoint: gp_Pnt
thePlane: gp_Pln

Return
-------
None

Description
-----------
Construct length dimension between two points in the specified plane. 
Input parameter: theFirstPoint the first point. 
Input parameter: theSecondPoint the second point. 
Input parameter: thePlane the plane to orient dimension.
") PrsDim_LengthDimension;
		 PrsDim_LengthDimension(const gp_Pnt & theFirstPoint, const gp_Pnt & theSecondPoint, const gp_Pln & thePlane);

		/****** PrsDim_LengthDimension::PrsDim_LengthDimension ******/
		/****** md5 signature: 5a8e9abcc01c6c25a54bee8294ae78cb ******/
		%feature("compactdefaultargs") PrsDim_LengthDimension;
		%feature("autodoc", "
Parameters
----------
theFirstShape: TopoDS_Shape
theSecondShape: TopoDS_Shape
thePlane: gp_Pln

Return
-------
None

Description
-----------
Construct length dimension between two arbitrary shapes in the specified plane. 
Input parameter: theFirstShape the first shape. 
Input parameter: theSecondShape the second shape. 
Input parameter: thePlane the plane to orient dimension.
") PrsDim_LengthDimension;
		 PrsDim_LengthDimension(const TopoDS_Shape & theFirstShape, const TopoDS_Shape & theSecondShape, const gp_Pln & thePlane);

		/****** PrsDim_LengthDimension::PrsDim_LengthDimension ******/
		/****** md5 signature: c07a85297e79d8b1c20f3250308c66df ******/
		%feature("compactdefaultargs") PrsDim_LengthDimension;
		%feature("autodoc", "
Parameters
----------
theEdge: TopoDS_Edge
thePlane: gp_Pln

Return
-------
None

Description
-----------
Construct length dimension of linear edge. 
Input parameter: theEdge the edge to measure. 
Input parameter: thePlane the plane to orient dimension.
") PrsDim_LengthDimension;
		 PrsDim_LengthDimension(const TopoDS_Edge & theEdge, const gp_Pln & thePlane);

		/****** PrsDim_LengthDimension::FirstPoint ******/
		/****** md5 signature: ce6daac63a94ae39a0d0bfa7edc5f3cd ******/
		%feature("compactdefaultargs") FirstPoint;
		%feature("autodoc", "Return
-------
gp_Pnt

Description
-----------
Return: first attachment point.
") FirstPoint;
		const gp_Pnt FirstPoint();

		/****** PrsDim_LengthDimension::FirstShape ******/
		/****** md5 signature: 0052eba922702f3e525649e52d93f4e7 ******/
		%feature("compactdefaultargs") FirstShape;
		%feature("autodoc", "Return
-------
TopoDS_Shape

Description
-----------
Return: first attachment shape.
") FirstShape;
		const TopoDS_Shape FirstShape();

		/****** PrsDim_LengthDimension::GetDisplayUnits ******/
		/****** md5 signature: 6fbf70f12ad85e7a1835a85781f8abb8 ******/
		%feature("compactdefaultargs") GetDisplayUnits;
		%feature("autodoc", "Return
-------
TCollection_AsciiString

Description
-----------
Return: the display units string.
") GetDisplayUnits;
		virtual const TCollection_AsciiString & GetDisplayUnits();

		/****** PrsDim_LengthDimension::GetModelUnits ******/
		/****** md5 signature: 27dbe0cf13d3ca82bbb0bf570025f3a8 ******/
		%feature("compactdefaultargs") GetModelUnits;
		%feature("autodoc", "Return
-------
TCollection_AsciiString

Description
-----------
Return: the model units string.
") GetModelUnits;
		virtual const TCollection_AsciiString & GetModelUnits();

		/****** PrsDim_LengthDimension::GetTextPosition ******/
		/****** md5 signature: 62f290d0c1a25a3579f77b31be4010f2 ******/
		%feature("compactdefaultargs") GetTextPosition;
		%feature("autodoc", "Return
-------
gp_Pnt

Description
-----------
No available documentation.
") GetTextPosition;
		virtual gp_Pnt GetTextPosition();

		/****** PrsDim_LengthDimension::SecondPoint ******/
		/****** md5 signature: 66319c8fbdc379c409c2efa67f6e79e2 ******/
		%feature("compactdefaultargs") SecondPoint;
		%feature("autodoc", "Return
-------
gp_Pnt

Description
-----------
Return: second attachment point.
") SecondPoint;
		const gp_Pnt SecondPoint();

		/****** PrsDim_LengthDimension::SecondShape ******/
		/****** md5 signature: 3c9d5f80bfbcac42f6848475061ecf61 ******/
		%feature("compactdefaultargs") SecondShape;
		%feature("autodoc", "Return
-------
TopoDS_Shape

Description
-----------
Return: second attachment shape.
") SecondShape;
		const TopoDS_Shape SecondShape();

		/****** PrsDim_LengthDimension::SetDirection ******/
		/****** md5 signature: fdd4b1217edc47b9493c5cf7f462b2e9 ******/
		%feature("compactdefaultargs") SetDirection;
		%feature("autodoc", "
Parameters
----------
theDirection: gp_Dir
theUseDirection: bool (optional, default to Standard_True)

Return
-------
None

Description
-----------
Set custom direction for dimension. If it is not set, the direction is obtained from the measured geometry (e.g. line between points of dimension) The direction does not change flyout direction of dimension. 
Input parameter: theDirection the dimension direction. 
Input parameter: theUseDirection boolean value if custom direction should be used.
") SetDirection;
		void SetDirection(const gp_Dir & theDirection, const Standard_Boolean theUseDirection = Standard_True);

		/****** PrsDim_LengthDimension::SetDisplayUnits ******/
		/****** md5 signature: afe69b618dcd1bcf849c7c525bd3f1db ******/
		%feature("compactdefaultargs") SetDisplayUnits;
		%feature("autodoc", "
Parameters
----------
theUnits: str

Return
-------
None

Description
-----------
No available documentation.
") SetDisplayUnits;
		virtual void SetDisplayUnits(TCollection_AsciiString theUnits);

		/****** PrsDim_LengthDimension::SetMeasuredGeometry ******/
		/****** md5 signature: cef07b2afa7411d338e4348d1fb09cb3 ******/
		%feature("compactdefaultargs") SetMeasuredGeometry;
		%feature("autodoc", "
Parameters
----------
theFirstPoint: gp_Pnt
theSecondPoint: gp_Pnt
thePlane: gp_Pln

Return
-------
None

Description
-----------
Measure distance between two points. The dimension will become invalid if the new distance between attachment points is less than Precision::Confusion(). 
Input parameter: theFirstPoint the first point. 
Input parameter: theSecondPoint the second point. 
Input parameter: thePlane the user-defined plane.
") SetMeasuredGeometry;
		void SetMeasuredGeometry(const gp_Pnt & theFirstPoint, const gp_Pnt & theSecondPoint, const gp_Pln & thePlane);

		/****** PrsDim_LengthDimension::SetMeasuredGeometry ******/
		/****** md5 signature: ab814d79ff07f7269fe3cb037f48b9a8 ******/
		%feature("compactdefaultargs") SetMeasuredGeometry;
		%feature("autodoc", "
Parameters
----------
theEdge: TopoDS_Edge
thePlane: gp_Pln

Return
-------
None

Description
-----------
Measure length of edge. The dimension will become invalid if the new length of edge is less than Precision::Confusion(). 
Input parameter: theEdge the edge to measure. 
Input parameter: thePlane the user-defined plane.
") SetMeasuredGeometry;
		void SetMeasuredGeometry(const TopoDS_Edge & theEdge, const gp_Pln & thePlane);

		/****** PrsDim_LengthDimension::SetMeasuredGeometry ******/
		/****** md5 signature: bfe5f7ff6a46076a22cbf50a395e204f ******/
		%feature("compactdefaultargs") SetMeasuredGeometry;
		%feature("autodoc", "
Parameters
----------
theFirstFace: TopoDS_Face
theSecondFace: TopoDS_Face

Return
-------
None

Description
-----------
Measure distance between two faces. The dimension will become invalid if the distance can not be measured or it is less than Precision::Confusion(). 
Input parameter: theFirstFace the first face (first shape). 
Input parameter: theSecondFace the second face (second shape).
") SetMeasuredGeometry;
		void SetMeasuredGeometry(const TopoDS_Face & theFirstFace, const TopoDS_Face & theSecondFace);

		/****** PrsDim_LengthDimension::SetMeasuredGeometry ******/
		/****** md5 signature: 7c671ce46d9bfe5c6d511144762d0662 ******/
		%feature("compactdefaultargs") SetMeasuredGeometry;
		%feature("autodoc", "
Parameters
----------
theFace: TopoDS_Face
theEdge: TopoDS_Edge

Return
-------
None

Description
-----------
Measure distance between face and edge. The dimension will become invalid if the distance can not be measured or it is less than Precision::Confusion(). 
Input parameter: theFace the face (first shape). 
Input parameter: theEdge the edge (second shape).
") SetMeasuredGeometry;
		void SetMeasuredGeometry(const TopoDS_Face & theFace, const TopoDS_Edge & theEdge);

		/****** PrsDim_LengthDimension::SetMeasuredShapes ******/
		/****** md5 signature: 27e960b24f38031999030c9d7d2242ae ******/
		%feature("compactdefaultargs") SetMeasuredShapes;
		%feature("autodoc", "
Parameters
----------
theFirstShape: TopoDS_Shape
theSecondShape: TopoDS_Shape

Return
-------
None

Description
-----------
Measure distance between generic pair of shapes (edges, vertices, length), where measuring is applicable. 
Input parameter: theFirstShape the first shape. 
Input parameter: theSecondShape the second shape.
") SetMeasuredShapes;
		void SetMeasuredShapes(const TopoDS_Shape & theFirstShape, const TopoDS_Shape & theSecondShape);

		/****** PrsDim_LengthDimension::SetModelUnits ******/
		/****** md5 signature: bac7da9c21ed70bf629179ea24a5af0c ******/
		%feature("compactdefaultargs") SetModelUnits;
		%feature("autodoc", "
Parameters
----------
theUnits: str

Return
-------
None

Description
-----------
No available documentation.
") SetModelUnits;
		virtual void SetModelUnits(TCollection_AsciiString theUnits);

		/****** PrsDim_LengthDimension::SetTextPosition ******/
		/****** md5 signature: f1658ae61229bf1e77ff3828626b747f ******/
		%feature("compactdefaultargs") SetTextPosition;
		%feature("autodoc", "
Parameters
----------
theTextPos: gp_Pnt

Return
-------
None

Description
-----------
No available documentation.
") SetTextPosition;
		virtual void SetTextPosition(const gp_Pnt & theTextPos);

};


%make_alias(PrsDim_LengthDimension)

%extend PrsDim_LengthDimension {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************
* class PrsDim_MidPointRelation *
********************************/
class PrsDim_MidPointRelation : public PrsDim_Relation {
	public:
		/****** PrsDim_MidPointRelation::PrsDim_MidPointRelation ******/
		/****** md5 signature: 122b11133f44e6cc04b101a5ae52dbbd ******/
		%feature("compactdefaultargs") PrsDim_MidPointRelation;
		%feature("autodoc", "
Parameters
----------
aSymmTool: TopoDS_Shape
FirstShape: TopoDS_Shape
SecondShape: TopoDS_Shape
aPlane: Geom_Plane

Return
-------
None

Description
-----------
No available documentation.
") PrsDim_MidPointRelation;
		 PrsDim_MidPointRelation(const TopoDS_Shape & aSymmTool, const TopoDS_Shape & FirstShape, const TopoDS_Shape & SecondShape, const opencascade::handle<Geom_Plane> & aPlane);

		/****** PrsDim_MidPointRelation::GetTool ******/
		/****** md5 signature: ec6944b3d25bda4f64b24ac26b67c01b ******/
		%feature("compactdefaultargs") GetTool;
		%feature("autodoc", "Return
-------
TopoDS_Shape

Description
-----------
No available documentation.
") GetTool;
		const TopoDS_Shape GetTool();

		/****** PrsDim_MidPointRelation::IsMovable ******/
		/****** md5 signature: f6ba7e60b1b3f70d71d7fe5631d123a5 ******/
		%feature("compactdefaultargs") IsMovable;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsMovable;
		virtual Standard_Boolean IsMovable();

		/****** PrsDim_MidPointRelation::SetTool ******/
		/****** md5 signature: dc00fdc2d218f714ef699466eca37a6d ******/
		%feature("compactdefaultargs") SetTool;
		%feature("autodoc", "
Parameters
----------
aMidPointTool: TopoDS_Shape

Return
-------
None

Description
-----------
No available documentation.
") SetTool;
		void SetTool(const TopoDS_Shape & aMidPointTool);

};


%make_alias(PrsDim_MidPointRelation)

%extend PrsDim_MidPointRelation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************
* class PrsDim_OffsetDimension *
*******************************/
class PrsDim_OffsetDimension : public PrsDim_Relation {
	public:
		/****** PrsDim_OffsetDimension::PrsDim_OffsetDimension ******/
		/****** md5 signature: fdb908efcbf3f34cfd3053ec5267a22d ******/
		%feature("compactdefaultargs") PrsDim_OffsetDimension;
		%feature("autodoc", "
Parameters
----------
FistShape: TopoDS_Shape
SecondShape: TopoDS_Shape
aVal: float
aText: str

Return
-------
None

Description
-----------
Constructs the offset display object defined by the first shape aFShape, the second shape aSShape, the dimension aVal, and the text aText.
") PrsDim_OffsetDimension;
		 PrsDim_OffsetDimension(const TopoDS_Shape & FistShape, const TopoDS_Shape & SecondShape, const Standard_Real aVal, TCollection_ExtendedString aText);

		/****** PrsDim_OffsetDimension::IsMovable ******/
		/****** md5 signature: f6ba7e60b1b3f70d71d7fe5631d123a5 ******/
		%feature("compactdefaultargs") IsMovable;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if the offset datum is movable.
") IsMovable;
		virtual Standard_Boolean IsMovable();

		/****** PrsDim_OffsetDimension::KindOfDimension ******/
		/****** md5 signature: d9fe1ab2881bf16089f50e785bf13209 ******/
		%feature("compactdefaultargs") KindOfDimension;
		%feature("autodoc", "Return
-------
PrsDim_KindOfDimension

Description
-----------
Indicates that the dimension we are concerned with is an offset.
") KindOfDimension;
		virtual PrsDim_KindOfDimension KindOfDimension();

		/****** PrsDim_OffsetDimension::SetRelativePos ******/
		/****** md5 signature: 058adecd19d5d119b92c090176de5f20 ******/
		%feature("compactdefaultargs") SetRelativePos;
		%feature("autodoc", "
Parameters
----------
aTrsf: gp_Trsf

Return
-------
None

Description
-----------
Sets a transformation aTrsf for presentation and selection to a relative position.
") SetRelativePos;
		void SetRelativePos(const gp_Trsf & aTrsf);

};


%make_alias(PrsDim_OffsetDimension)

%extend PrsDim_OffsetDimension {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************
* class PrsDim_ParallelRelation *
********************************/
class PrsDim_ParallelRelation : public PrsDim_Relation {
	public:
		/****** PrsDim_ParallelRelation::PrsDim_ParallelRelation ******/
		/****** md5 signature: 2e942a41c243c6dd642ebdcd5b41d5b6 ******/
		%feature("compactdefaultargs") PrsDim_ParallelRelation;
		%feature("autodoc", "
Parameters
----------
aFShape: TopoDS_Shape
aSShape: TopoDS_Shape
aPlane: Geom_Plane

Return
-------
None

Description
-----------
Constructs an object to display parallel constraints. This object is defined by the first shape aFShape and the second shape aSShape and the plane aPlane.
") PrsDim_ParallelRelation;
		 PrsDim_ParallelRelation(const TopoDS_Shape & aFShape, const TopoDS_Shape & aSShape, const opencascade::handle<Geom_Plane> & aPlane);

		/****** PrsDim_ParallelRelation::PrsDim_ParallelRelation ******/
		/****** md5 signature: fc9d4db97f2cca719f37b1180eb0d365 ******/
		%feature("compactdefaultargs") PrsDim_ParallelRelation;
		%feature("autodoc", "
Parameters
----------
aFShape: TopoDS_Shape
aSShape: TopoDS_Shape
aPlane: Geom_Plane
aPosition: gp_Pnt
aSymbolPrs: DsgPrs_ArrowSide
anArrowSize: float (optional, default to 0.01)

Return
-------
None

Description
-----------
Constructs an object to display parallel constraints. This object is defined by the first shape aFShape and the second shape aSShape the plane aPlane, the position aPosition, the type of arrow, aSymbolPrs and its size anArrowSize.
") PrsDim_ParallelRelation;
		 PrsDim_ParallelRelation(const TopoDS_Shape & aFShape, const TopoDS_Shape & aSShape, const opencascade::handle<Geom_Plane> & aPlane, const gp_Pnt & aPosition, const DsgPrs_ArrowSide aSymbolPrs, const Standard_Real anArrowSize = 0.01);

		/****** PrsDim_ParallelRelation::IsMovable ******/
		/****** md5 signature: f6ba7e60b1b3f70d71d7fe5631d123a5 ******/
		%feature("compactdefaultargs") IsMovable;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if the parallelism is movable.
") IsMovable;
		virtual Standard_Boolean IsMovable();

};


%make_alias(PrsDim_ParallelRelation)

%extend PrsDim_ParallelRelation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************************
* class PrsDim_PerpendicularRelation *
*************************************/
class PrsDim_PerpendicularRelation : public PrsDim_Relation {
	public:
		/****** PrsDim_PerpendicularRelation::PrsDim_PerpendicularRelation ******/
		/****** md5 signature: 7cc3eb79f6af7eebc9cb1b6a784b6400 ******/
		%feature("compactdefaultargs") PrsDim_PerpendicularRelation;
		%feature("autodoc", "
Parameters
----------
aFShape: TopoDS_Shape
aSShape: TopoDS_Shape
aPlane: Geom_Plane

Return
-------
None

Description
-----------
Constructs an object to display constraints of perpendicularity on shapes. This object is defined by a first shape aFShape, a second shape aSShape, and a plane aPlane. aPlane is the plane of reference to show and test the perpendicular relation between two shapes, at least one of which has a revolved surface.
") PrsDim_PerpendicularRelation;
		 PrsDim_PerpendicularRelation(const TopoDS_Shape & aFShape, const TopoDS_Shape & aSShape, const opencascade::handle<Geom_Plane> & aPlane);

		/****** PrsDim_PerpendicularRelation::PrsDim_PerpendicularRelation ******/
		/****** md5 signature: 640c64c4d5e70c0bccc2af2dc39448d2 ******/
		%feature("compactdefaultargs") PrsDim_PerpendicularRelation;
		%feature("autodoc", "
Parameters
----------
aFShape: TopoDS_Shape
aSShape: TopoDS_Shape

Return
-------
None

Description
-----------
Constructs an object to display constraints of perpendicularity on shapes. This object is defined by a first shape aFShape and a second shape aSShape.
") PrsDim_PerpendicularRelation;
		 PrsDim_PerpendicularRelation(const TopoDS_Shape & aFShape, const TopoDS_Shape & aSShape);

};


%make_alias(PrsDim_PerpendicularRelation)

%extend PrsDim_PerpendicularRelation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************
* class PrsDim_RadiusDimension *
*******************************/
class PrsDim_RadiusDimension : public PrsDim_Dimension {
	public:
		/****** PrsDim_RadiusDimension::PrsDim_RadiusDimension ******/
		/****** md5 signature: cfea829146713be1d9e4130e7ad678ff ******/
		%feature("compactdefaultargs") PrsDim_RadiusDimension;
		%feature("autodoc", "
Parameters
----------
theCircle: gp_Circ

Return
-------
None

Description
-----------
Create radius dimension for the circle geometry. 
Input parameter: theCircle the circle to measure.
") PrsDim_RadiusDimension;
		 PrsDim_RadiusDimension(const gp_Circ & theCircle);

		/****** PrsDim_RadiusDimension::PrsDim_RadiusDimension ******/
		/****** md5 signature: 8805a0ae2122e5acc11bd9490e47039c ******/
		%feature("compactdefaultargs") PrsDim_RadiusDimension;
		%feature("autodoc", "
Parameters
----------
theCircle: gp_Circ
theAnchorPoint: gp_Pnt

Return
-------
None

Description
-----------
Create radius dimension for the circle geometry and define its orientation by location of the first point on that circle. 
Input parameter: theCircle the circle to measure. 
Input parameter: theAnchorPoint the point to define the position of the dimension attachment on the circle.
") PrsDim_RadiusDimension;
		 PrsDim_RadiusDimension(const gp_Circ & theCircle, const gp_Pnt & theAnchorPoint);

		/****** PrsDim_RadiusDimension::PrsDim_RadiusDimension ******/
		/****** md5 signature: 9ec6cb0a403ac2a19ad90c538c3a5e36 ******/
		%feature("compactdefaultargs") PrsDim_RadiusDimension;
		%feature("autodoc", "
Parameters
----------
theShape: TopoDS_Shape

Return
-------
None

Description
-----------
Create radius dimension for the arbitrary shape (if possible). 
Input parameter: theShape the shape to measure.
") PrsDim_RadiusDimension;
		 PrsDim_RadiusDimension(const TopoDS_Shape & theShape);

		/****** PrsDim_RadiusDimension::AnchorPoint ******/
		/****** md5 signature: e00b76aa30ec48768c82c1a07e620981 ******/
		%feature("compactdefaultargs") AnchorPoint;
		%feature("autodoc", "Return
-------
gp_Pnt

Description
-----------
Return: anchor point on circle for radius dimension.
") AnchorPoint;
		const gp_Pnt AnchorPoint();

		/****** PrsDim_RadiusDimension::Circle ******/
		/****** md5 signature: 1eaea6bdc97e0fc2fac6cefd24825e1a ******/
		%feature("compactdefaultargs") Circle;
		%feature("autodoc", "Return
-------
gp_Circ

Description
-----------
Return: measured geometry circle.
") Circle;
		const gp_Circ Circle();

		/****** PrsDim_RadiusDimension::GetDisplayUnits ******/
		/****** md5 signature: 6fbf70f12ad85e7a1835a85781f8abb8 ******/
		%feature("compactdefaultargs") GetDisplayUnits;
		%feature("autodoc", "Return
-------
TCollection_AsciiString

Description
-----------
Return: the display units string.
") GetDisplayUnits;
		virtual const TCollection_AsciiString & GetDisplayUnits();

		/****** PrsDim_RadiusDimension::GetModelUnits ******/
		/****** md5 signature: 27dbe0cf13d3ca82bbb0bf570025f3a8 ******/
		%feature("compactdefaultargs") GetModelUnits;
		%feature("autodoc", "Return
-------
TCollection_AsciiString

Description
-----------
Return: the model units string.
") GetModelUnits;
		virtual const TCollection_AsciiString & GetModelUnits();

		/****** PrsDim_RadiusDimension::GetTextPosition ******/
		/****** md5 signature: 62f290d0c1a25a3579f77b31be4010f2 ******/
		%feature("compactdefaultargs") GetTextPosition;
		%feature("autodoc", "Return
-------
gp_Pnt

Description
-----------
No available documentation.
") GetTextPosition;
		virtual gp_Pnt GetTextPosition();

		/****** PrsDim_RadiusDimension::SetDisplayUnits ******/
		/****** md5 signature: afe69b618dcd1bcf849c7c525bd3f1db ******/
		%feature("compactdefaultargs") SetDisplayUnits;
		%feature("autodoc", "
Parameters
----------
theUnits: str

Return
-------
None

Description
-----------
No available documentation.
") SetDisplayUnits;
		virtual void SetDisplayUnits(TCollection_AsciiString theUnits);

		/****** PrsDim_RadiusDimension::SetMeasuredGeometry ******/
		/****** md5 signature: 20f5d2af27af2754cd354025e857b6b0 ******/
		%feature("compactdefaultargs") SetMeasuredGeometry;
		%feature("autodoc", "
Parameters
----------
theCircle: gp_Circ

Return
-------
None

Description
-----------
Measure radius of the circle. The dimension will become invalid if the radius of the circle is less than Precision::Confusion(). 
Input parameter: theCircle the circle to measure.
") SetMeasuredGeometry;
		void SetMeasuredGeometry(const gp_Circ & theCircle);

		/****** PrsDim_RadiusDimension::SetMeasuredGeometry ******/
		/****** md5 signature: c108135e71c04f939442708481e8be34 ******/
		%feature("compactdefaultargs") SetMeasuredGeometry;
		%feature("autodoc", "
Parameters
----------
theCircle: gp_Circ
theAnchorPoint: gp_Pnt
theHasAnchor: bool (optional, default to Standard_True)

Return
-------
None

Description
-----------
Measure radius of the circle and orient the dimension so the dimension lines attaches to anchor point on the circle. The dimension will become invalid if the radius of the circle is less than Precision::Confusion(). 
Input parameter: theCircle the circle to measure. 
Input parameter: theAnchorPoint the point to attach the dimension lines, should be on the circle 
Input parameter: theHasAnchor should be set True if theAnchorPoint should be used.
") SetMeasuredGeometry;
		void SetMeasuredGeometry(const gp_Circ & theCircle, const gp_Pnt & theAnchorPoint, const Standard_Boolean theHasAnchor = Standard_True);

		/****** PrsDim_RadiusDimension::SetMeasuredGeometry ******/
		/****** md5 signature: ad36f6541ba8fd4bb2abf0ec1ff6c97e ******/
		%feature("compactdefaultargs") SetMeasuredGeometry;
		%feature("autodoc", "
Parameters
----------
theShape: TopoDS_Shape

Return
-------
None

Description
-----------
Measure radius on the passed shape, if applicable. The dimension will become invalid if the passed shape is not measurable or if measured diameter value is less than Precision::Confusion(). 
Input parameter: theShape the shape to measure.
") SetMeasuredGeometry;
		void SetMeasuredGeometry(const TopoDS_Shape & theShape);

		/****** PrsDim_RadiusDimension::SetMeasuredGeometry ******/
		/****** md5 signature: 47558a720aeeb8c5e6f999e8e591bac0 ******/
		%feature("compactdefaultargs") SetMeasuredGeometry;
		%feature("autodoc", "
Parameters
----------
theShape: TopoDS_Shape
theAnchorPoint: gp_Pnt
theHasAnchor: bool (optional, default to Standard_True)

Return
-------
None

Description
-----------
Measure radius on the passed shape, if applicable. The dimension will become invalid if the passed shape is not measurable or if measured diameter value is less than Precision::Confusion(). 
Input parameter: theShape the shape to measure. 
Input parameter: theAnchorPoint the point to attach the dimension lines, should be on the circle 
Input parameter: theHasAnchor should be set True if theAnchorPoint should be used.
") SetMeasuredGeometry;
		void SetMeasuredGeometry(const TopoDS_Shape & theShape, const gp_Pnt & theAnchorPoint, const Standard_Boolean theHasAnchor = Standard_True);

		/****** PrsDim_RadiusDimension::SetModelUnits ******/
		/****** md5 signature: bac7da9c21ed70bf629179ea24a5af0c ******/
		%feature("compactdefaultargs") SetModelUnits;
		%feature("autodoc", "
Parameters
----------
theUnits: str

Return
-------
None

Description
-----------
No available documentation.
") SetModelUnits;
		virtual void SetModelUnits(TCollection_AsciiString theUnits);

		/****** PrsDim_RadiusDimension::SetTextPosition ******/
		/****** md5 signature: f1658ae61229bf1e77ff3828626b747f ******/
		%feature("compactdefaultargs") SetTextPosition;
		%feature("autodoc", "
Parameters
----------
theTextPos: gp_Pnt

Return
-------
None

Description
-----------
No available documentation.
") SetTextPosition;
		virtual void SetTextPosition(const gp_Pnt & theTextPos);

		/****** PrsDim_RadiusDimension::Shape ******/
		/****** md5 signature: 1058569f5d639354fedf11e73741b7df ******/
		%feature("compactdefaultargs") Shape;
		%feature("autodoc", "Return
-------
TopoDS_Shape

Description
-----------
Return: the measured shape.
") Shape;
		const TopoDS_Shape Shape();

};


%make_alias(PrsDim_RadiusDimension)

%extend PrsDim_RadiusDimension {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************
* class PrsDim_SymmetricRelation *
*********************************/
class PrsDim_SymmetricRelation : public PrsDim_Relation {
	public:
		/****** PrsDim_SymmetricRelation::PrsDim_SymmetricRelation ******/
		/****** md5 signature: 645a643bff4a9e0e8fd2ade4864624ad ******/
		%feature("compactdefaultargs") PrsDim_SymmetricRelation;
		%feature("autodoc", "
Parameters
----------
aSymmTool: TopoDS_Shape
FirstShape: TopoDS_Shape
SecondShape: TopoDS_Shape
aPlane: Geom_Plane

Return
-------
None

Description
-----------
Constructs an object to display constraints of symmetricity. This object is defined by a tool aSymmTool, a first shape FirstShape, a second shape SecondShape, and a plane aPlane. aPlane serves as the axis of symmetry. aSymmTool is the shape composed of FirstShape SecondShape and aPlane. It may be queried and edited using the functions GetTool and SetTool. The two shapes are typically two edges, two vertices or two points.
") PrsDim_SymmetricRelation;
		 PrsDim_SymmetricRelation(const TopoDS_Shape & aSymmTool, const TopoDS_Shape & FirstShape, const TopoDS_Shape & SecondShape, const opencascade::handle<Geom_Plane> & aPlane);

		/****** PrsDim_SymmetricRelation::GetTool ******/
		/****** md5 signature: ec6944b3d25bda4f64b24ac26b67c01b ******/
		%feature("compactdefaultargs") GetTool;
		%feature("autodoc", "Return
-------
TopoDS_Shape

Description
-----------
Returns the tool composed of a first shape, a second shape, and a plane. This tool is created at construction time.
") GetTool;
		const TopoDS_Shape GetTool();

		/****** PrsDim_SymmetricRelation::IsMovable ******/
		/****** md5 signature: f6ba7e60b1b3f70d71d7fe5631d123a5 ******/
		%feature("compactdefaultargs") IsMovable;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if the symmetric constraint display is movable.
") IsMovable;
		virtual Standard_Boolean IsMovable();

		/****** PrsDim_SymmetricRelation::SetTool ******/
		/****** md5 signature: 816479e3edeb279cf3b82a00c0d00a2d ******/
		%feature("compactdefaultargs") SetTool;
		%feature("autodoc", "
Parameters
----------
aSymmetricTool: TopoDS_Shape

Return
-------
None

Description
-----------
Sets the tool aSymmetricTool composed of a first shape, a second shape, and a plane. This tool is initially created at construction time.
") SetTool;
		void SetTool(const TopoDS_Shape & aSymmetricTool);

};


%make_alias(PrsDim_SymmetricRelation)

%extend PrsDim_SymmetricRelation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************
* class PrsDim_TangentRelation *
*******************************/
class PrsDim_TangentRelation : public PrsDim_Relation {
	public:
		/****** PrsDim_TangentRelation::PrsDim_TangentRelation ******/
		/****** md5 signature: d032a6f245c872be074dcae3bd0608db ******/
		%feature("compactdefaultargs") PrsDim_TangentRelation;
		%feature("autodoc", "
Parameters
----------
aFShape: TopoDS_Shape
aSShape: TopoDS_Shape
aPlane: Geom_Plane
anExternRef: int (optional, default to 0)

Return
-------
None

Description
-----------
TwoFacesTangent or TwoEdgesTangent relation Constructs an object to display tangency constraints. This object is defined by the first shape aFShape, the second shape aSShape, the plane aPlane and the index anExternRef. aPlane serves as an optional axis. anExternRef set to 0 indicates that there is no relation.
") PrsDim_TangentRelation;
		 PrsDim_TangentRelation(const TopoDS_Shape & aFShape, const TopoDS_Shape & aSShape, const opencascade::handle<Geom_Plane> & aPlane, const Standard_Integer anExternRef = 0);

		/****** PrsDim_TangentRelation::ExternRef ******/
		/****** md5 signature: 76cf8e64b0c656db756364b81297da17 ******/
		%feature("compactdefaultargs") ExternRef;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the external reference for tangency. The values are as follows: - 0 - there is no connection; - 1 - there is a connection to the first shape; - 2 - there is a connection to the second shape. This reference is defined at construction time.
") ExternRef;
		Standard_Integer ExternRef();

		/****** PrsDim_TangentRelation::SetExternRef ******/
		/****** md5 signature: 586a4a6230d10739270f4e5a188d9bfa ******/
		%feature("compactdefaultargs") SetExternRef;
		%feature("autodoc", "
Parameters
----------
aRef: int

Return
-------
None

Description
-----------
Sets the external reference for tangency, aRef. The values are as follows: - 0 - there is no connection; - 1 - there is a connection to the first shape; - 2 - there is a connection to the second shape. This reference is initially defined at construction time.
") SetExternRef;
		void SetExternRef(const Standard_Integer aRef);

};


%make_alias(PrsDim_TangentRelation)

%extend PrsDim_TangentRelation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************************
* class PrsDim_MaxRadiusDimension *
**********************************/
class PrsDim_MaxRadiusDimension : public PrsDim_EllipseRadiusDimension {
	public:
		/****** PrsDim_MaxRadiusDimension::PrsDim_MaxRadiusDimension ******/
		/****** md5 signature: d980757c5468e00e0bf9166d80e0ffdc ******/
		%feature("compactdefaultargs") PrsDim_MaxRadiusDimension;
		%feature("autodoc", "
Parameters
----------
aShape: TopoDS_Shape
aVal: float
aText: str

Return
-------
None

Description
-----------
Max Ellipse radius dimension Shape can be edge , planar face or cylindrical face.
") PrsDim_MaxRadiusDimension;
		 PrsDim_MaxRadiusDimension(const TopoDS_Shape & aShape, const Standard_Real aVal, TCollection_ExtendedString aText);

		/****** PrsDim_MaxRadiusDimension::PrsDim_MaxRadiusDimension ******/
		/****** md5 signature: e7d293361b5fa36a3871cea6bba086cf ******/
		%feature("compactdefaultargs") PrsDim_MaxRadiusDimension;
		%feature("autodoc", "
Parameters
----------
aShape: TopoDS_Shape
aVal: float
aText: str
aPosition: gp_Pnt
aSymbolPrs: DsgPrs_ArrowSide
anArrowSize: float (optional, default to 0.0)

Return
-------
None

Description
-----------
Max Ellipse radius dimension with position Shape can be edge , planar face or cylindrical face.
") PrsDim_MaxRadiusDimension;
		 PrsDim_MaxRadiusDimension(const TopoDS_Shape & aShape, const Standard_Real aVal, TCollection_ExtendedString aText, const gp_Pnt & aPosition, const DsgPrs_ArrowSide aSymbolPrs, const Standard_Real anArrowSize = 0.0);

};


%make_alias(PrsDim_MaxRadiusDimension)

%extend PrsDim_MaxRadiusDimension {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************************
* class PrsDim_MinRadiusDimension *
**********************************/
class PrsDim_MinRadiusDimension : public PrsDim_EllipseRadiusDimension {
	public:
		/****** PrsDim_MinRadiusDimension::PrsDim_MinRadiusDimension ******/
		/****** md5 signature: 167835a1410022f28c578bd8e77eaae2 ******/
		%feature("compactdefaultargs") PrsDim_MinRadiusDimension;
		%feature("autodoc", "
Parameters
----------
aShape: TopoDS_Shape
aVal: float
aText: str

Return
-------
None

Description
-----------
Max Ellipse radius dimension Shape can be edge , planar face or cylindrical face.
") PrsDim_MinRadiusDimension;
		 PrsDim_MinRadiusDimension(const TopoDS_Shape & aShape, const Standard_Real aVal, TCollection_ExtendedString aText);

		/****** PrsDim_MinRadiusDimension::PrsDim_MinRadiusDimension ******/
		/****** md5 signature: 141213159afe170ab0fead5219510652 ******/
		%feature("compactdefaultargs") PrsDim_MinRadiusDimension;
		%feature("autodoc", "
Parameters
----------
aShape: TopoDS_Shape
aVal: float
aText: str
aPosition: gp_Pnt
aSymbolPrs: DsgPrs_ArrowSide
anArrowSize: float (optional, default to 0.0)

Return
-------
None

Description
-----------
Max Ellipse radius dimension with position Shape can be edge , planar face or cylindrical face.
") PrsDim_MinRadiusDimension;
		 PrsDim_MinRadiusDimension(const TopoDS_Shape & aShape, const Standard_Real aVal, TCollection_ExtendedString aText, const gp_Pnt & aPosition, const DsgPrs_ArrowSide aSymbolPrs, const Standard_Real anArrowSize = 0.0);

};


%make_alias(PrsDim_MinRadiusDimension)

%extend PrsDim_MinRadiusDimension {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* harray1 classes */
/* harray2 classes */
/* hsequence classes */
/* class aliases */
%pythoncode {
}
/* deprecated methods */
%pythoncode {
@deprecated
def prsdim_ComputeGeomCurve(*args):
	return prsdim.ComputeGeomCurve(*args)

@deprecated
def prsdim_ComputeGeometry(*args):
	return prsdim.ComputeGeometry(*args)

@deprecated
def prsdim_ComputeGeometry(*args):
	return prsdim.ComputeGeometry(*args)

@deprecated
def prsdim_ComputeGeometry(*args):
	return prsdim.ComputeGeometry(*args)

@deprecated
def prsdim_ComputeGeometry(*args):
	return prsdim.ComputeGeometry(*args)

@deprecated
def prsdim_ComputeGeometry(*args):
	return prsdim.ComputeGeometry(*args)

@deprecated
def prsdim_ComputeGeometry(*args):
	return prsdim.ComputeGeometry(*args)

@deprecated
def prsdim_ComputeGeometry(*args):
	return prsdim.ComputeGeometry(*args)

@deprecated
def prsdim_ComputeProjEdgePresentation(*args):
	return prsdim.ComputeProjEdgePresentation(*args)

@deprecated
def prsdim_ComputeProjVertexPresentation(*args):
	return prsdim.ComputeProjVertexPresentation(*args)

@deprecated
def prsdim_DistanceFromApex(*args):
	return prsdim.DistanceFromApex(*args)

@deprecated
def prsdim_Farest(*args):
	return prsdim.Farest(*args)

@deprecated
def prsdim_GetPlaneFromFace(*args):
	return prsdim.GetPlaneFromFace(*args)

@deprecated
def prsdim_InDomain(*args):
	return prsdim.InDomain(*args)

@deprecated
def prsdim_InitAngleBetweenCurvilinearFaces(*args):
	return prsdim.InitAngleBetweenCurvilinearFaces(*args)

@deprecated
def prsdim_InitAngleBetweenPlanarFaces(*args):
	return prsdim.InitAngleBetweenPlanarFaces(*args)

@deprecated
def prsdim_InitFaceLength(*args):
	return prsdim.InitFaceLength(*args)

@deprecated
def prsdim_InitLengthBetweenCurvilinearFaces(*args):
	return prsdim.InitLengthBetweenCurvilinearFaces(*args)

@deprecated
def prsdim_Nearest(*args):
	return prsdim.Nearest(*args)

@deprecated
def prsdim_Nearest(*args):
	return prsdim.Nearest(*args)

@deprecated
def prsdim_Nearest(*args):
	return prsdim.Nearest(*args)

@deprecated
def prsdim_NearestApex(*args):
	return prsdim.NearestApex(*args)

@deprecated
def prsdim_ProjectPointOnLine(*args):
	return prsdim.ProjectPointOnLine(*args)

@deprecated
def prsdim_ProjectPointOnPlane(*args):
	return prsdim.ProjectPointOnPlane(*args)

@deprecated
def prsdim_TranslatePointToBound(*args):
	return prsdim.TranslatePointToBound(*args)

@deprecated
def PrsDim_EqualDistanceRelation_ComputeOneEdgeOneVertexLength(*args):
	return PrsDim_EqualDistanceRelation.ComputeOneEdgeOneVertexLength(*args)

@deprecated
def PrsDim_EqualDistanceRelation_ComputeTwoEdgesLength(*args):
	return PrsDim_EqualDistanceRelation.ComputeTwoEdgesLength(*args)

@deprecated
def PrsDim_EqualDistanceRelation_ComputeTwoVerticesLength(*args):
	return PrsDim_EqualDistanceRelation.ComputeTwoVerticesLength(*args)

}
