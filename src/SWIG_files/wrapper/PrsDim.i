/*
Copyright 2008-2022 Thomas Paviot (tpaviot@gmail.com)

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
https://www.opencascade.com/doc/occt-7.6.0/refman/html/package_prsdim.html"
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

enum PrsDim_TypeOfDist {
	PrsDim_TypeOfDist_Unknown = 0,
	PrsDim_TypeOfDist_Horizontal = 1,
	PrsDim_TypeOfDist_Vertical = 2,
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

enum PrsDim_TypeOfAngleArrowVisibility {
	PrsDim_TypeOfAngleArrowVisibility_Both = 0,
	PrsDim_TypeOfAngleArrowVisibility_First = 1,
	PrsDim_TypeOfAngleArrowVisibility_Second = 2,
	PrsDim_TypeOfAngleArrowVisibility_None = 3,
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

enum PrsDim_DisplaySpecialSymbol {
	PrsDim_DisplaySpecialSymbol_No = 0,
	PrsDim_DisplaySpecialSymbol_Before = 1,
	PrsDim_DisplaySpecialSymbol_After = 2,
};

enum PrsDim_TypeOfAngle {
	PrsDim_TypeOfAngle_Interior = 0,
	PrsDim_TypeOfAngle_Exterior = 1,
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

class PrsDim_TypeOfDist(IntEnum):
	PrsDim_TypeOfDist_Unknown = 0
	PrsDim_TypeOfDist_Horizontal = 1
	PrsDim_TypeOfDist_Vertical = 2
PrsDim_TypeOfDist_Unknown = PrsDim_TypeOfDist.PrsDim_TypeOfDist_Unknown
PrsDim_TypeOfDist_Horizontal = PrsDim_TypeOfDist.PrsDim_TypeOfDist_Horizontal
PrsDim_TypeOfDist_Vertical = PrsDim_TypeOfDist.PrsDim_TypeOfDist_Vertical

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

class PrsDim_TypeOfAngleArrowVisibility(IntEnum):
	PrsDim_TypeOfAngleArrowVisibility_Both = 0
	PrsDim_TypeOfAngleArrowVisibility_First = 1
	PrsDim_TypeOfAngleArrowVisibility_Second = 2
	PrsDim_TypeOfAngleArrowVisibility_None = 3
PrsDim_TypeOfAngleArrowVisibility_Both = PrsDim_TypeOfAngleArrowVisibility.PrsDim_TypeOfAngleArrowVisibility_Both
PrsDim_TypeOfAngleArrowVisibility_First = PrsDim_TypeOfAngleArrowVisibility.PrsDim_TypeOfAngleArrowVisibility_First
PrsDim_TypeOfAngleArrowVisibility_Second = PrsDim_TypeOfAngleArrowVisibility.PrsDim_TypeOfAngleArrowVisibility_Second
PrsDim_TypeOfAngleArrowVisibility_None = PrsDim_TypeOfAngleArrowVisibility.PrsDim_TypeOfAngleArrowVisibility_None

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

class PrsDim_DisplaySpecialSymbol(IntEnum):
	PrsDim_DisplaySpecialSymbol_No = 0
	PrsDim_DisplaySpecialSymbol_Before = 1
	PrsDim_DisplaySpecialSymbol_After = 2
PrsDim_DisplaySpecialSymbol_No = PrsDim_DisplaySpecialSymbol.PrsDim_DisplaySpecialSymbol_No
PrsDim_DisplaySpecialSymbol_Before = PrsDim_DisplaySpecialSymbol.PrsDim_DisplaySpecialSymbol_Before
PrsDim_DisplaySpecialSymbol_After = PrsDim_DisplaySpecialSymbol.PrsDim_DisplaySpecialSymbol_After

class PrsDim_TypeOfAngle(IntEnum):
	PrsDim_TypeOfAngle_Interior = 0
	PrsDim_TypeOfAngle_Exterior = 1
PrsDim_TypeOfAngle_Interior = PrsDim_TypeOfAngle.PrsDim_TypeOfAngle_Interior
PrsDim_TypeOfAngle_Exterior = PrsDim_TypeOfAngle.PrsDim_TypeOfAngle_Exterior
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
		/**** md5 signature: c8a73aacf44d22f63a4f6d51e7f9260b ****/
		%feature("compactdefaultargs") GetPlaneFromFace;
		%feature("autodoc", "Tryes to get plane from face. returns surface of face in asurf. returns standard_true and plane of face in aplane in following cases: face is plane, offset of plane, extrusion of line and offset of extrusion of line returns pure type of surface which can be: plane, cylinder, cone, sphere, torus, surfaceofrevolution, surfaceofextrusion.

Parameters
----------
aFace: TopoDS_Face
aPlane: gp_Pln
aSurf: Geom_Surface

Returns
-------
aSurfType: PrsDim_KindOfSurface
Offset: float
") GetPlaneFromFace;
		static Standard_Boolean GetPlaneFromFace(const TopoDS_Face & aFace, gp_Pln & aPlane, opencascade::handle<Geom_Surface> & aSurf, PrsDim_KindOfSurface &OutValue, Standard_Real &OutValue);

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
		/**** md5 signature: 6f56d83ae228343607e66c3cf73a4663 ****/
		%feature("compactdefaultargs") InitAngleBetweenCurvilinearFaces;
		%feature("autodoc", "Finds three points for the angle dimension between two curvilinear surfaces.

Parameters
----------
theFirstFace: TopoDS_Face
theSecondFace: TopoDS_Face
theFirstSurfType: PrsDim_KindOfSurface
theSecondSurfType: PrsDim_KindOfSurface
theCenter: gp_Pnt
theFirstAttach: gp_Pnt
theSecondAttach: gp_Pnt
theIsFirstPointSet: bool,optional
	default value is Standard_False

Returns
-------
bool
") InitAngleBetweenCurvilinearFaces;
		static Standard_Boolean InitAngleBetweenCurvilinearFaces(const TopoDS_Face & theFirstFace, const TopoDS_Face & theSecondFace, const PrsDim_KindOfSurface theFirstSurfType, const PrsDim_KindOfSurface theSecondSurfType, gp_Pnt & theCenter, gp_Pnt & theFirstAttach, gp_Pnt & theSecondAttach, const Standard_Boolean theIsFirstPointSet = Standard_False);

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
		/**** md5 signature: 4c6d797303c03fad5ebd7589763d97f8 ****/
		%feature("compactdefaultargs") InitFaceLength;
		%feature("autodoc", "No available documentation.

Parameters
----------
aFace: TopoDS_Face
aPlane: gp_Pln
aSurface: Geom_Surface

Returns
-------
aSurfaceType: PrsDim_KindOfSurface
anOffset: float
") InitFaceLength;
		static void InitFaceLength(const TopoDS_Face & aFace, gp_Pln & aPlane, opencascade::handle<Geom_Surface> & aSurface, PrsDim_KindOfSurface &OutValue, Standard_Real &OutValue);

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
		/**** md5 signature: 2873c800214f175c63b754232211e821 ****/
		%feature("compactdefaultargs") DisplaySpecialSymbol;
		%feature("autodoc", "Returns dimension special symbol display options.

Returns
-------
PrsDim_DisplaySpecialSymbol
") DisplaySpecialSymbol;
		PrsDim_DisplaySpecialSymbol DisplaySpecialSymbol();

		/****************** GetCustomValue ******************/
		/**** md5 signature: 95e7dac6d1f2c02c95cf021ebebacfed ****/
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
		/**** md5 signature: 0b04ebfc5d72ea55c9ed88dc6d33fea0 ****/
		%feature("compactdefaultargs") GetPlane;
		%feature("autodoc", "Get the dimension plane in which the 2d dimension presentation is computed. by default, if plane is not defined by user, it is computed automatically after dimension geometry is computed. if computed dimension geometry (points) can't be placed on the user-defined plane, dimension geometry was set as invalid (validity flag is set to false) and dimension presentation will not be computed. if user-defined plane allow geometry placement on it, it will be used for computing of the dimension presentation. returns dimension plane used for presentation computing.

Returns
-------
gp_Pln
") GetPlane;
		const gp_Pln GetPlane();

		/****************** GetTextPosition ******************/
		/**** md5 signature: 6ee8678e0a409f45918e038151dbde94 ****/
		%feature("compactdefaultargs") GetTextPosition;
		%feature("autodoc", "Computes absolute text position from dimension parameters (flyout, plane and text alignment).

Returns
-------
gp_Pnt
") GetTextPosition;
		virtual gp_Pnt GetTextPosition();

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
		/**** md5 signature: 7721fa2fb7dfc5fb3635c615f43c1fcd ****/
		%feature("compactdefaultargs") KindOfDimension;
		%feature("autodoc", "Returns the kind of dimension.

Returns
-------
PrsDim_KindOfDimension
") KindOfDimension;
		PrsDim_KindOfDimension KindOfDimension();

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
		%feature("autodoc", "Sets user-defined dimension value. unit conversion during the display is not applied. @param thevalue [in] the user-defined value to display.

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
		/**** md5 signature: 0969631dd0d04e693d6eb1858740a67f ****/
		%feature("compactdefaultargs") SetDisplaySpecialSymbol;
		%feature("autodoc", "Specifies whether to display special symbol or not.

Parameters
----------
theDisplaySpecSymbol: PrsDim_DisplaySpecialSymbol

Returns
-------
None
") SetDisplaySpecialSymbol;
		void SetDisplaySpecialSymbol(const PrsDim_DisplaySpecialSymbol theDisplaySpecSymbol);

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
		/****************** PrsDim_DimensionOwner ******************/
		/**** md5 signature: 0f78da7ae2bbeb967e6a5f23b16758b6 ****/
		%feature("compactdefaultargs") PrsDim_DimensionOwner;
		%feature("autodoc", "Initializes the dimension owner, theso, and attributes it the priority, thepriority.

Parameters
----------
theSelObject: SelectMgr_SelectableObject
theSelMode: PrsDim_DimensionSelectionMode
thePriority: int,optional
	default value is 0

Returns
-------
None
") PrsDim_DimensionOwner;
		 PrsDim_DimensionOwner(const opencascade::handle<SelectMgr_SelectableObject> & theSelObject, const PrsDim_DimensionSelectionMode theSelMode, const Standard_Integer thePriority = 0);

		/****************** HilightWithColor ******************/
		/**** md5 signature: ff872ded3a30d3b368f40f78eef3d5d8 ****/
		%feature("compactdefaultargs") HilightWithColor;
		%feature("autodoc", "No available documentation.

Parameters
----------
thePM: PrsMgr_PresentationManager
theStyle: Prs3d_Drawer
theMode: int

Returns
-------
None
") HilightWithColor;
		virtual void HilightWithColor(const opencascade::handle<PrsMgr_PresentationManager> & thePM, const opencascade::handle<Prs3d_Drawer> & theStyle, const Standard_Integer theMode);

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
		/**** md5 signature: 030647867bb4f5b297cabad21f1f01b3 ****/
		%feature("compactdefaultargs") SelectionMode;
		%feature("autodoc", "No available documentation.

Returns
-------
PrsDim_DimensionSelectionMode
") SelectionMode;
		PrsDim_DimensionSelectionMode SelectionMode();

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
		/****************** AcceptDisplayMode ******************/
		/**** md5 signature: 4c81f1c2cfc05fd196e1c09a383a3455 ****/
		%feature("compactdefaultargs") AcceptDisplayMode;
		%feature("autodoc", "Returns true if the display mode amode is accepted for the interactive objects in the relation. computeprojpresentation(me; apres : presentation from prs3d; curve1 : curve from geom; curve2 : curve from geom; firstp1 : pnt from gp; lastp1 : pnt from gp; firstp2 : pnt from gp; lastp2 : pnt from gp; acolor : nameofcolor from quantity = quantity_noc_purple; awidth : real  from standard = 2; aprojtol : typeofline  from aspect = aspect_tol_dash; acalltol : typeofline  from aspect = aspect_tol_dot).

Parameters
----------
theMode: int

Returns
-------
bool
") AcceptDisplayMode;
		virtual Standard_Boolean AcceptDisplayMode(const Standard_Integer theMode);

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
		/**** md5 signature: ecafaf47b8ef8a68ada41232f33d6a22 ****/
		%feature("compactdefaultargs") IsMovable;
		%feature("autodoc", "Returns true if the interactive object is movable.

Returns
-------
bool
") IsMovable;
		virtual Standard_Boolean IsMovable();

		/****************** KindOfDimension ******************/
		/**** md5 signature: b37803c776d1eca88db8e43e3a5728c2 ****/
		%feature("compactdefaultargs") KindOfDimension;
		%feature("autodoc", "Indicates that the type of dimension is unknown.

Returns
-------
PrsDim_KindOfDimension
") KindOfDimension;
		virtual PrsDim_KindOfDimension KindOfDimension();

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
		/**** md5 signature: f7c0b3fbbd537f19dc1e43a4c280284b ****/
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
		/**** md5 signature: 54157e780f59d54d926c6850c9f86357 ****/
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
		/****************** PrsDim_AngleDimension ******************/
		/**** md5 signature: bf03164e7fa61b2419edc5521a74c29a ****/
		%feature("compactdefaultargs") PrsDim_AngleDimension;
		%feature("autodoc", "Constructs minimum angle dimension between two linear edges (where possible). these two edges should be intersected by each other. otherwise the geometry is not valid. @param thefirstedge [in] the first edge. @param thesecondedge [in] the second edge.

Parameters
----------
theFirstEdge: TopoDS_Edge
theSecondEdge: TopoDS_Edge

Returns
-------
None
") PrsDim_AngleDimension;
		 PrsDim_AngleDimension(const TopoDS_Edge & theFirstEdge, const TopoDS_Edge & theSecondEdge);

		/****************** PrsDim_AngleDimension ******************/
		/**** md5 signature: d124b521b92e8f56d45bee4f27d28998 ****/
		%feature("compactdefaultargs") PrsDim_AngleDimension;
		%feature("autodoc", "Constructs the angle display object defined by three points. @param thefirstpoint [in] the first point (point on first angle flyout). @param thesecondpoint [in] the center point of angle dimension. @param thethirdpoint [in] the second point (point on second angle flyout).

Parameters
----------
theFirstPoint: gp_Pnt
theSecondPoint: gp_Pnt
theThirdPoint: gp_Pnt

Returns
-------
None
") PrsDim_AngleDimension;
		 PrsDim_AngleDimension(const gp_Pnt & theFirstPoint, const gp_Pnt & theSecondPoint, const gp_Pnt & theThirdPoint);

		/****************** PrsDim_AngleDimension ******************/
		/**** md5 signature: 22cddb7b3a3ff9cf81c69c4f7732968d ****/
		%feature("compactdefaultargs") PrsDim_AngleDimension;
		%feature("autodoc", "Constructs the angle display object defined by three vertices. @param thefirstvertex [in] the first vertex (vertex for first angle flyout). @param thesecondvertex [in] the center vertex of angle dimension. @param thethirdpoint [in] the second vertex (vertex for second angle flyout).

Parameters
----------
theFirstVertex: TopoDS_Vertex
theSecondVertex: TopoDS_Vertex
theThirdVertex: TopoDS_Vertex

Returns
-------
None
") PrsDim_AngleDimension;
		 PrsDim_AngleDimension(const TopoDS_Vertex & theFirstVertex, const TopoDS_Vertex & theSecondVertex, const TopoDS_Vertex & theThirdVertex);

		/****************** PrsDim_AngleDimension ******************/
		/**** md5 signature: 8d326d750479ca2e859b83b8ce0591d4 ****/
		%feature("compactdefaultargs") PrsDim_AngleDimension;
		%feature("autodoc", "Constructs angle dimension for the cone face. @param thecone [in] the conical face.

Parameters
----------
theCone: TopoDS_Face

Returns
-------
None
") PrsDim_AngleDimension;
		 PrsDim_AngleDimension(const TopoDS_Face & theCone);

		/****************** PrsDim_AngleDimension ******************/
		/**** md5 signature: d8f3a6ca0fc04a0ccadf8c1705db3dfa ****/
		%feature("compactdefaultargs") PrsDim_AngleDimension;
		%feature("autodoc", "Constructs angle dimension between two planar faces. @param thefirstface [in] the first face. @param thesecondface [in] the second face.

Parameters
----------
theFirstFace: TopoDS_Face
theSecondFace: TopoDS_Face

Returns
-------
None
") PrsDim_AngleDimension;
		 PrsDim_AngleDimension(const TopoDS_Face & theFirstFace, const TopoDS_Face & theSecondFace);

		/****************** PrsDim_AngleDimension ******************/
		/**** md5 signature: 43724685c047e9a14625bb3a31900efe ****/
		%feature("compactdefaultargs") PrsDim_AngleDimension;
		%feature("autodoc", "Constructs angle dimension between two planar faces. @param thefirstface [in] the first face. @param thesecondface [in] the second face. @param thepoint [in] the point which the dimension plane should pass through. this point can lay on the one of the faces or not.

Parameters
----------
theFirstFace: TopoDS_Face
theSecondFace: TopoDS_Face
thePoint: gp_Pnt

Returns
-------
None
") PrsDim_AngleDimension;
		 PrsDim_AngleDimension(const TopoDS_Face & theFirstFace, const TopoDS_Face & theSecondFace, const gp_Pnt & thePoint);

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
		/**** md5 signature: 46cba3cb29a78865c51874e00db3f36b ****/
		%feature("compactdefaultargs") GetArrowsVisibility;
		%feature("autodoc", "Returns the type of visibility of arrows.

Returns
-------
PrsDim_TypeOfAngleArrowVisibility
") GetArrowsVisibility;
		PrsDim_TypeOfAngleArrowVisibility GetArrowsVisibility();

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
		/**** md5 signature: 62f290d0c1a25a3579f77b31be4010f2 ****/
		%feature("compactdefaultargs") GetTextPosition;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Pnt
") GetTextPosition;
		virtual gp_Pnt GetTextPosition();

		/****************** GetType ******************/
		/**** md5 signature: 53492e82f74aaeb8eb534503e3b56f99 ****/
		%feature("compactdefaultargs") GetType;
		%feature("autodoc", "Returns the current angle type.

Returns
-------
PrsDim_TypeOfAngle
") GetType;
		PrsDim_TypeOfAngle GetType();

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
		/**** md5 signature: 05364bdc4330c3e39178bd5550429736 ****/
		%feature("compactdefaultargs") SetArrowsVisibility;
		%feature("autodoc", "Sets visible arrows type @param thetype [in] the type of visibility of arrows.

Parameters
----------
theType: PrsDim_TypeOfAngleArrowVisibility

Returns
-------
None
") SetArrowsVisibility;
		void SetArrowsVisibility(const PrsDim_TypeOfAngleArrowVisibility & theType);

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
		/**** md5 signature: 28a8c9d530531365adf7a6cbf39408b9 ****/
		%feature("compactdefaultargs") SetType;
		%feature("autodoc", "Sets angle type. @param thetype [in] the type value.

Parameters
----------
theType: PrsDim_TypeOfAngle

Returns
-------
None
") SetType;
		void SetType(const PrsDim_TypeOfAngle theType);

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
		/****************** PrsDim_Chamf2dDimension ******************/
		/**** md5 signature: 0712755e6f89ca287a3362bbf4c04e44 ****/
		%feature("compactdefaultargs") PrsDim_Chamf2dDimension;
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
") PrsDim_Chamf2dDimension;
		 PrsDim_Chamf2dDimension(const TopoDS_Shape & aFShape, const opencascade::handle<Geom_Plane> & aPlane, const Standard_Real aVal, const TCollection_ExtendedString & aText);

		/****************** PrsDim_Chamf2dDimension ******************/
		/**** md5 signature: 50cb8ca97e253bfa32a7e7efb9b6a289 ****/
		%feature("compactdefaultargs") PrsDim_Chamf2dDimension;
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
") PrsDim_Chamf2dDimension;
		 PrsDim_Chamf2dDimension(const TopoDS_Shape & aFShape, const opencascade::handle<Geom_Plane> & aPlane, const Standard_Real aVal, const TCollection_ExtendedString & aText, const gp_Pnt & aPosition, const DsgPrs_ArrowSide aSymbolPrs, const Standard_Real anArrowSize = 0.0);

		/****************** IsMovable ******************/
		/**** md5 signature: f6ba7e60b1b3f70d71d7fe5631d123a5 ****/
		%feature("compactdefaultargs") IsMovable;
		%feature("autodoc", "Returns true if the 2d chamfer dimension is movable.

Returns
-------
bool
") IsMovable;
		virtual Standard_Boolean IsMovable();

		/****************** KindOfDimension ******************/
		/**** md5 signature: d9fe1ab2881bf16089f50e785bf13209 ****/
		%feature("compactdefaultargs") KindOfDimension;
		%feature("autodoc", "Indicates that we are concerned with a 2d length.

Returns
-------
PrsDim_KindOfDimension
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
		/****************** PrsDim_Chamf3dDimension ******************/
		/**** md5 signature: cc0174a5707cf7ecb7a1e19732683825 ****/
		%feature("compactdefaultargs") PrsDim_Chamf3dDimension;
		%feature("autodoc", "Constructs a display object for 3d chamfers. this object is defined by the shape afshape, the dimension aval and the text atext.

Parameters
----------
aFShape: TopoDS_Shape
aVal: float
aText: TCollection_ExtendedString

Returns
-------
None
") PrsDim_Chamf3dDimension;
		 PrsDim_Chamf3dDimension(const TopoDS_Shape & aFShape, const Standard_Real aVal, const TCollection_ExtendedString & aText);

		/****************** PrsDim_Chamf3dDimension ******************/
		/**** md5 signature: 485f32758f4c90220dd128f21c767125 ****/
		%feature("compactdefaultargs") PrsDim_Chamf3dDimension;
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
") PrsDim_Chamf3dDimension;
		 PrsDim_Chamf3dDimension(const TopoDS_Shape & aFShape, const Standard_Real aVal, const TCollection_ExtendedString & aText, const gp_Pnt & aPosition, const DsgPrs_ArrowSide aSymbolPrs, const Standard_Real anArrowSize = 0.0);

		/****************** IsMovable ******************/
		/**** md5 signature: f6ba7e60b1b3f70d71d7fe5631d123a5 ****/
		%feature("compactdefaultargs") IsMovable;
		%feature("autodoc", "Returns true if the 3d chamfer dimension is movable.

Returns
-------
bool
") IsMovable;
		virtual Standard_Boolean IsMovable();

		/****************** KindOfDimension ******************/
		/**** md5 signature: d9fe1ab2881bf16089f50e785bf13209 ****/
		%feature("compactdefaultargs") KindOfDimension;
		%feature("autodoc", "Indicates that we are concerned with a 3d length.

Returns
-------
PrsDim_KindOfDimension
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
		/****************** PrsDim_ConcentricRelation ******************/
		/**** md5 signature: 869509701791277168c3b554d85b4bd2 ****/
		%feature("compactdefaultargs") PrsDim_ConcentricRelation;
		%feature("autodoc", "Constructs the display object for concentric relations between shapes. this object is defined by the two shapes, afshape and asshape and the plane aplane. aplane is provided to create an axis along which the relation of concentricity can be extended.

Parameters
----------
aFShape: TopoDS_Shape
aSShape: TopoDS_Shape
aPlane: Geom_Plane

Returns
-------
None
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
		/****************** PrsDim_DiameterDimension ******************/
		/**** md5 signature: 4d6e682d3504d2fa30b05cfdfc9256f9 ****/
		%feature("compactdefaultargs") PrsDim_DiameterDimension;
		%feature("autodoc", "Construct diameter dimension for the circle. @param thecircle [in] the circle to measure.

Parameters
----------
theCircle: gp_Circ

Returns
-------
None
") PrsDim_DiameterDimension;
		 PrsDim_DiameterDimension(const gp_Circ & theCircle);

		/****************** PrsDim_DiameterDimension ******************/
		/**** md5 signature: 3d81b47b28524dc65c959bcc5c959fd4 ****/
		%feature("compactdefaultargs") PrsDim_DiameterDimension;
		%feature("autodoc", "Construct diameter dimension for the circle and orient it correspondingly to the passed plane. @param thecircle [in] the circle to measure. @param theplane [in] the plane defining preferred orientation for dimension.

Parameters
----------
theCircle: gp_Circ
thePlane: gp_Pln

Returns
-------
None
") PrsDim_DiameterDimension;
		 PrsDim_DiameterDimension(const gp_Circ & theCircle, const gp_Pln & thePlane);

		/****************** PrsDim_DiameterDimension ******************/
		/**** md5 signature: 4a1cf23da6b5862081f203f8e54205de ****/
		%feature("compactdefaultargs") PrsDim_DiameterDimension;
		%feature("autodoc", "Construct diameter on the passed shape, if applicable. @param theshape [in] the shape to measure.

Parameters
----------
theShape: TopoDS_Shape

Returns
-------
None
") PrsDim_DiameterDimension;
		 PrsDim_DiameterDimension(const TopoDS_Shape & theShape);

		/****************** PrsDim_DiameterDimension ******************/
		/**** md5 signature: 1f81cad559daecd01fa67a0c212e25e5 ****/
		%feature("compactdefaultargs") PrsDim_DiameterDimension;
		%feature("autodoc", "Construct diameter on the passed shape, if applicable - and define the preferred plane to orient the dimension. @param theshape [in] the shape to measure. @param theplane [in] the plane defining preferred orientation for dimension.

Parameters
----------
theShape: TopoDS_Shape
thePlane: gp_Pln

Returns
-------
None
") PrsDim_DiameterDimension;
		 PrsDim_DiameterDimension(const TopoDS_Shape & theShape, const gp_Pln & thePlane);

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
		/**** md5 signature: 62f290d0c1a25a3579f77b31be4010f2 ****/
		%feature("compactdefaultargs") GetTextPosition;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Pnt
") GetTextPosition;
		virtual gp_Pnt GetTextPosition();

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
		/**** md5 signature: f6ba7e60b1b3f70d71d7fe5631d123a5 ****/
		%feature("compactdefaultargs") IsMovable;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsMovable;
		virtual Standard_Boolean IsMovable();

		/****************** KindOfDimension ******************/
		/**** md5 signature: d9fe1ab2881bf16089f50e785bf13209 ****/
		%feature("compactdefaultargs") KindOfDimension;
		%feature("autodoc", "No available documentation.

Returns
-------
PrsDim_KindOfDimension
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
		/****************** PrsDim_EqualDistanceRelation ******************/
		/**** md5 signature: 177d5bcd8d5434054f860081ea28e08e ****/
		%feature("compactdefaultargs") PrsDim_EqualDistanceRelation;
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
") PrsDim_EqualDistanceRelation;
		 PrsDim_EqualDistanceRelation(const TopoDS_Shape & aShape1, const TopoDS_Shape & aShape2, const TopoDS_Shape & aShape3, const TopoDS_Shape & aShape4, const opencascade::handle<Geom_Plane> & aPlane);

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

Returns
-------
SymbolPrs: DsgPrs_ArrowSide
") ComputeOneEdgeOneVertexLength;
		static void ComputeOneEdgeOneVertexLength(const opencascade::handle<Prs3d_Presentation> & aPresentation, const opencascade::handle<Prs3d_Drawer> & aDrawer, const Standard_Real ArrowSize, const TopoDS_Shape & FirstShape, const TopoDS_Shape & SecondShape, const opencascade::handle<Geom_Plane> & Plane, const Standard_Boolean AutomaticPos, const Standard_Boolean IsSetBndBox, const Bnd_Box & BndBox, gp_Pnt & Position, gp_Pnt & FirstAttach, gp_Pnt & SecondAttach, gp_Pnt & FirstExtreme, gp_Pnt & SecondExtreme, DsgPrs_ArrowSide &OutValue);

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

Returns
-------
SymbolPrs: DsgPrs_ArrowSide
") ComputeTwoEdgesLength;
		static void ComputeTwoEdgesLength(const opencascade::handle<Prs3d_Presentation> & aPresentation, const opencascade::handle<Prs3d_Drawer> & aDrawer, const Standard_Real ArrowSize, const TopoDS_Edge & FirstEdge, const TopoDS_Edge & SecondEdge, const opencascade::handle<Geom_Plane> & Plane, const Standard_Boolean AutomaticPos, const Standard_Boolean IsSetBndBox, const Bnd_Box & BndBox, gp_Pnt & Position, gp_Pnt & FirstAttach, gp_Pnt & SecondAttach, gp_Pnt & FirstExtreme, gp_Pnt & SecondExtreme, DsgPrs_ArrowSide &OutValue);

		/****************** ComputeTwoVerticesLength ******************/
		/**** md5 signature: c2cf26f4f3674622aff9461abba45f4c ****/
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
TypeDist: PrsDim_TypeOfDist
Position: gp_Pnt
FirstAttach: gp_Pnt
SecondAttach: gp_Pnt
FirstExtreme: gp_Pnt
SecondExtreme: gp_Pnt

Returns
-------
SymbolPrs: DsgPrs_ArrowSide
") ComputeTwoVerticesLength;
		static void ComputeTwoVerticesLength(const opencascade::handle<Prs3d_Presentation> & aPresentation, const opencascade::handle<Prs3d_Drawer> & aDrawer, const Standard_Real ArrowSize, const TopoDS_Vertex & FirstVertex, const TopoDS_Vertex & SecondVertex, const opencascade::handle<Geom_Plane> & Plane, const Standard_Boolean AutomaticPos, const Standard_Boolean IsSetBndBox, const Bnd_Box & BndBox, const PrsDim_TypeOfDist TypeDist, gp_Pnt & Position, gp_Pnt & FirstAttach, gp_Pnt & SecondAttach, gp_Pnt & FirstExtreme, gp_Pnt & SecondExtreme, DsgPrs_ArrowSide &OutValue);

		/****************** SetShape3 ******************/
		/**** md5 signature: 0a91376bd67771bc8ca45b6e52a2dec0 ****/
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
		/**** md5 signature: f543a54216be5af8a263607fd632ceac ****/
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
		/**** md5 signature: ea136b7f794b164fd01f6891c7e8b287 ****/
		%feature("compactdefaultargs") Shape3;
		%feature("autodoc", "Returns the shape ashape3 from the framework created at construction time.

Returns
-------
TopoDS_Shape
") Shape3;
		const TopoDS_Shape Shape3();

		/****************** Shape4 ******************/
		/**** md5 signature: 1022108095550fde66494c51385f1649 ****/
		%feature("compactdefaultargs") Shape4;
		%feature("autodoc", "Returns the shape ashape4 from the framework created at construction time.

Returns
-------
TopoDS_Shape
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
		/****************** PrsDim_EqualRadiusRelation ******************/
		/**** md5 signature: 4b46dbada063b2999b7ff8e714bab44f ****/
		%feature("compactdefaultargs") PrsDim_EqualRadiusRelation;
		%feature("autodoc", "Creates equal relation of two arc's radiuses. if one of edges is not in the given plane, the presentation method projects it onto the plane.

Parameters
----------
aFirstEdge: TopoDS_Edge
aSecondEdge: TopoDS_Edge
aPlane: Geom_Plane

Returns
-------
None
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
		/****************** PrsDim_FixRelation ******************/
		/**** md5 signature: 2f1406036f8ae3877ac72ec3ff9b1158 ****/
		%feature("compactdefaultargs") PrsDim_FixRelation;
		%feature("autodoc", "Initializes the vertex ashape, the plane aplane and the wire awire, which connects the two vertices in a fixed relation.

Parameters
----------
aShape: TopoDS_Shape
aPlane: Geom_Plane
aWire: TopoDS_Wire

Returns
-------
None
") PrsDim_FixRelation;
		 PrsDim_FixRelation(const TopoDS_Shape & aShape, const opencascade::handle<Geom_Plane> & aPlane, const TopoDS_Wire & aWire);

		/****************** PrsDim_FixRelation ******************/
		/**** md5 signature: 8119c428e8ad02c160e25cb8f441f83f ****/
		%feature("compactdefaultargs") PrsDim_FixRelation;
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
") PrsDim_FixRelation;
		 PrsDim_FixRelation(const TopoDS_Shape & aShape, const opencascade::handle<Geom_Plane> & aPlane, const TopoDS_Wire & aWire, const gp_Pnt & aPosition, const Standard_Real anArrowSize = 0.01);

		/****************** PrsDim_FixRelation ******************/
		/**** md5 signature: ae700fea0e3dd07875d6262addb682db ****/
		%feature("compactdefaultargs") PrsDim_FixRelation;
		%feature("autodoc", "Initializes the edge ashape and the plane aplane.

Parameters
----------
aShape: TopoDS_Shape
aPlane: Geom_Plane

Returns
-------
None
") PrsDim_FixRelation;
		 PrsDim_FixRelation(const TopoDS_Shape & aShape, const opencascade::handle<Geom_Plane> & aPlane);

		/****************** PrsDim_FixRelation ******************/
		/**** md5 signature: a2cbe852faae05e93fca70a7045165ee ****/
		%feature("compactdefaultargs") PrsDim_FixRelation;
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
") PrsDim_FixRelation;
		 PrsDim_FixRelation(const TopoDS_Shape & aShape, const opencascade::handle<Geom_Plane> & aPlane, const gp_Pnt & aPosition, const Standard_Real anArrowSize = 0.01);

		/****************** IsMovable ******************/
		/**** md5 signature: f6ba7e60b1b3f70d71d7fe5631d123a5 ****/
		%feature("compactdefaultargs") IsMovable;
		%feature("autodoc", "Returns true if the interactive objects in the relation are movable.

Returns
-------
bool
") IsMovable;
		virtual Standard_Boolean IsMovable();

		/****************** SetWire ******************/
		/**** md5 signature: 1e6ab77bc57c7750fc9b90fbf0c4cfc5 ****/
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
		/**** md5 signature: 305c9a4b8bd30e0b3d180ae1912b1938 ****/
		%feature("compactdefaultargs") Wire;
		%feature("autodoc", "Returns the wire which connects vertices in a fixed relation.

Returns
-------
TopoDS_Wire
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
		/****************** PrsDim_IdenticRelation ******************/
		/**** md5 signature: 608c13eec6054dfc49a137c537516651 ****/
		%feature("compactdefaultargs") PrsDim_IdenticRelation;
		%feature("autodoc", "Initializes the relation of identity between the two entities, firstshape and secondshape. the plane aplane is initialized in case a visual reference is needed to show identity.

Parameters
----------
FirstShape: TopoDS_Shape
SecondShape: TopoDS_Shape
aPlane: Geom_Plane

Returns
-------
None
") PrsDim_IdenticRelation;
		 PrsDim_IdenticRelation(const TopoDS_Shape & FirstShape, const TopoDS_Shape & SecondShape, const opencascade::handle<Geom_Plane> & aPlane);

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
		/**** md5 signature: f6ba7e60b1b3f70d71d7fe5631d123a5 ****/
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
		/****************** PrsDim_LengthDimension ******************/
		/**** md5 signature: 76e262900b82f282d533e9d72cd330de ****/
		%feature("compactdefaultargs") PrsDim_LengthDimension;
		%feature("autodoc", "Construct an empty length dimension. @sa setmeasuredgeometry(), setmeasuredshapes() for initialization.

Returns
-------
None
") PrsDim_LengthDimension;
		 PrsDim_LengthDimension();

		/****************** PrsDim_LengthDimension ******************/
		/**** md5 signature: b8d2bd968153bc92dd94147ef64017a0 ****/
		%feature("compactdefaultargs") PrsDim_LengthDimension;
		%feature("autodoc", "Construct length dimension between face and edge. here dimension can be built without user-defined plane. @param theface [in] the face (first shape). @param theedge [in] the edge (second shape).

Parameters
----------
theFace: TopoDS_Face
theEdge: TopoDS_Edge

Returns
-------
None
") PrsDim_LengthDimension;
		 PrsDim_LengthDimension(const TopoDS_Face & theFace, const TopoDS_Edge & theEdge);

		/****************** PrsDim_LengthDimension ******************/
		/**** md5 signature: 97c54af5deffc3eb1b9f7af615285832 ****/
		%feature("compactdefaultargs") PrsDim_LengthDimension;
		%feature("autodoc", "Construct length dimension between two faces. @param thefirstface [in] the first face (first shape). @param thesecondface [in] the second face (second shape).

Parameters
----------
theFirstFace: TopoDS_Face
theSecondFace: TopoDS_Face

Returns
-------
None
") PrsDim_LengthDimension;
		 PrsDim_LengthDimension(const TopoDS_Face & theFirstFace, const TopoDS_Face & theSecondFace);

		/****************** PrsDim_LengthDimension ******************/
		/**** md5 signature: 8e4e73b42a947e7324da17452cfb1d99 ****/
		%feature("compactdefaultargs") PrsDim_LengthDimension;
		%feature("autodoc", "Construct length dimension between two points in the specified plane. @param thefirstpoint [in] the first point. @param thesecondpoint [in] the second point. @param theplane [in] the plane to orient dimension.

Parameters
----------
theFirstPoint: gp_Pnt
theSecondPoint: gp_Pnt
thePlane: gp_Pln

Returns
-------
None
") PrsDim_LengthDimension;
		 PrsDim_LengthDimension(const gp_Pnt & theFirstPoint, const gp_Pnt & theSecondPoint, const gp_Pln & thePlane);

		/****************** PrsDim_LengthDimension ******************/
		/**** md5 signature: 5a8e9abcc01c6c25a54bee8294ae78cb ****/
		%feature("compactdefaultargs") PrsDim_LengthDimension;
		%feature("autodoc", "Construct length dimension between two arbitrary shapes in the specified plane. @param thefirstshape [in] the first shape. @param thesecondshape [in] the second shape. @param theplane [in] the plane to orient dimension.

Parameters
----------
theFirstShape: TopoDS_Shape
theSecondShape: TopoDS_Shape
thePlane: gp_Pln

Returns
-------
None
") PrsDim_LengthDimension;
		 PrsDim_LengthDimension(const TopoDS_Shape & theFirstShape, const TopoDS_Shape & theSecondShape, const gp_Pln & thePlane);

		/****************** PrsDim_LengthDimension ******************/
		/**** md5 signature: c07a85297e79d8b1c20f3250308c66df ****/
		%feature("compactdefaultargs") PrsDim_LengthDimension;
		%feature("autodoc", "Construct length dimension of linear edge. @param theedge [in] the edge to measure. @param theplane [in] the plane to orient dimension.

Parameters
----------
theEdge: TopoDS_Edge
thePlane: gp_Pln

Returns
-------
None
") PrsDim_LengthDimension;
		 PrsDim_LengthDimension(const TopoDS_Edge & theEdge, const gp_Pln & thePlane);

		/****************** FirstPoint ******************/
		/**** md5 signature: ce6daac63a94ae39a0d0bfa7edc5f3cd ****/
		%feature("compactdefaultargs") FirstPoint;
		%feature("autodoc", "Returns first attachment point.

Returns
-------
gp_Pnt
") FirstPoint;
		const gp_Pnt FirstPoint();

		/****************** FirstShape ******************/
		/**** md5 signature: 0052eba922702f3e525649e52d93f4e7 ****/
		%feature("compactdefaultargs") FirstShape;
		%feature("autodoc", "Returns first attachment shape.

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
		/**** md5 signature: 62f290d0c1a25a3579f77b31be4010f2 ****/
		%feature("compactdefaultargs") GetTextPosition;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Pnt
") GetTextPosition;
		virtual gp_Pnt GetTextPosition();

		/****************** SecondPoint ******************/
		/**** md5 signature: 66319c8fbdc379c409c2efa67f6e79e2 ****/
		%feature("compactdefaultargs") SecondPoint;
		%feature("autodoc", "Returns second attachment point.

Returns
-------
gp_Pnt
") SecondPoint;
		const gp_Pnt SecondPoint();

		/****************** SecondShape ******************/
		/**** md5 signature: 3c9d5f80bfbcac42f6848475061ecf61 ****/
		%feature("compactdefaultargs") SecondShape;
		%feature("autodoc", "Returns second attachment shape.

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
		%feature("autodoc", "Measure distance between two points. the dimension will become invalid if the new distance between attachment points is less than precision::confusion(). @param thefirstpoint [in] the first point. @param thesecondpoint [in] the second point. @param theplane [in] the user-defined plane.

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
		/****************** PrsDim_MidPointRelation ******************/
		/**** md5 signature: 122b11133f44e6cc04b101a5ae52dbbd ****/
		%feature("compactdefaultargs") PrsDim_MidPointRelation;
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
") PrsDim_MidPointRelation;
		 PrsDim_MidPointRelation(const TopoDS_Shape & aSymmTool, const TopoDS_Shape & FirstShape, const TopoDS_Shape & SecondShape, const opencascade::handle<Geom_Plane> & aPlane);

		/****************** GetTool ******************/
		/**** md5 signature: ec6944b3d25bda4f64b24ac26b67c01b ****/
		%feature("compactdefaultargs") GetTool;
		%feature("autodoc", "No available documentation.

Returns
-------
TopoDS_Shape
") GetTool;
		const TopoDS_Shape GetTool();

		/****************** IsMovable ******************/
		/**** md5 signature: f6ba7e60b1b3f70d71d7fe5631d123a5 ****/
		%feature("compactdefaultargs") IsMovable;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsMovable;
		virtual Standard_Boolean IsMovable();

		/****************** SetTool ******************/
		/**** md5 signature: dc00fdc2d218f714ef699466eca37a6d ****/
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
		/****************** PrsDim_OffsetDimension ******************/
		/**** md5 signature: fdb908efcbf3f34cfd3053ec5267a22d ****/
		%feature("compactdefaultargs") PrsDim_OffsetDimension;
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
") PrsDim_OffsetDimension;
		 PrsDim_OffsetDimension(const TopoDS_Shape & FistShape, const TopoDS_Shape & SecondShape, const Standard_Real aVal, const TCollection_ExtendedString & aText);

		/****************** IsMovable ******************/
		/**** md5 signature: f6ba7e60b1b3f70d71d7fe5631d123a5 ****/
		%feature("compactdefaultargs") IsMovable;
		%feature("autodoc", "Returns true if the offset datum is movable.

Returns
-------
bool
") IsMovable;
		virtual Standard_Boolean IsMovable();

		/****************** KindOfDimension ******************/
		/**** md5 signature: d9fe1ab2881bf16089f50e785bf13209 ****/
		%feature("compactdefaultargs") KindOfDimension;
		%feature("autodoc", "Indicates that the dimension we are concerned with is an offset.

Returns
-------
PrsDim_KindOfDimension
") KindOfDimension;
		virtual PrsDim_KindOfDimension KindOfDimension();

		/****************** SetRelativePos ******************/
		/**** md5 signature: 058adecd19d5d119b92c090176de5f20 ****/
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
		/****************** PrsDim_ParallelRelation ******************/
		/**** md5 signature: 2e942a41c243c6dd642ebdcd5b41d5b6 ****/
		%feature("compactdefaultargs") PrsDim_ParallelRelation;
		%feature("autodoc", "Constructs an object to display parallel constraints. this object is defined by the first shape afshape and the second shape asshape and the plane aplane.

Parameters
----------
aFShape: TopoDS_Shape
aSShape: TopoDS_Shape
aPlane: Geom_Plane

Returns
-------
None
") PrsDim_ParallelRelation;
		 PrsDim_ParallelRelation(const TopoDS_Shape & aFShape, const TopoDS_Shape & aSShape, const opencascade::handle<Geom_Plane> & aPlane);

		/****************** PrsDim_ParallelRelation ******************/
		/**** md5 signature: fc9d4db97f2cca719f37b1180eb0d365 ****/
		%feature("compactdefaultargs") PrsDim_ParallelRelation;
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
") PrsDim_ParallelRelation;
		 PrsDim_ParallelRelation(const TopoDS_Shape & aFShape, const TopoDS_Shape & aSShape, const opencascade::handle<Geom_Plane> & aPlane, const gp_Pnt & aPosition, const DsgPrs_ArrowSide aSymbolPrs, const Standard_Real anArrowSize = 0.01);

		/****************** IsMovable ******************/
		/**** md5 signature: f6ba7e60b1b3f70d71d7fe5631d123a5 ****/
		%feature("compactdefaultargs") IsMovable;
		%feature("autodoc", "Returns true if the parallelism is movable.

Returns
-------
bool
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
		/****************** PrsDim_PerpendicularRelation ******************/
		/**** md5 signature: 7cc3eb79f6af7eebc9cb1b6a784b6400 ****/
		%feature("compactdefaultargs") PrsDim_PerpendicularRelation;
		%feature("autodoc", "Constructs an object to display constraints of perpendicularity on shapes. this object is defined by a first shape afshape, a second shape asshape, and a plane aplane. aplane is the plane of reference to show and test the perpendicular relation between two shapes, at least one of which has a revolved surface.

Parameters
----------
aFShape: TopoDS_Shape
aSShape: TopoDS_Shape
aPlane: Geom_Plane

Returns
-------
None
") PrsDim_PerpendicularRelation;
		 PrsDim_PerpendicularRelation(const TopoDS_Shape & aFShape, const TopoDS_Shape & aSShape, const opencascade::handle<Geom_Plane> & aPlane);

		/****************** PrsDim_PerpendicularRelation ******************/
		/**** md5 signature: 640c64c4d5e70c0bccc2af2dc39448d2 ****/
		%feature("compactdefaultargs") PrsDim_PerpendicularRelation;
		%feature("autodoc", "Constructs an object to display constraints of perpendicularity on shapes. this object is defined by a first shape afshape and a second shape asshape.

Parameters
----------
aFShape: TopoDS_Shape
aSShape: TopoDS_Shape

Returns
-------
None
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
		/****************** PrsDim_RadiusDimension ******************/
		/**** md5 signature: cfea829146713be1d9e4130e7ad678ff ****/
		%feature("compactdefaultargs") PrsDim_RadiusDimension;
		%feature("autodoc", "Create radius dimension for the circle geometry. @param thecircle [in] the circle to measure.

Parameters
----------
theCircle: gp_Circ

Returns
-------
None
") PrsDim_RadiusDimension;
		 PrsDim_RadiusDimension(const gp_Circ & theCircle);

		/****************** PrsDim_RadiusDimension ******************/
		/**** md5 signature: 8805a0ae2122e5acc11bd9490e47039c ****/
		%feature("compactdefaultargs") PrsDim_RadiusDimension;
		%feature("autodoc", "Create radius dimension for the circle geometry and define its orientation by location of the first point on that circle. @param thecircle [in] the circle to measure. @param theanchorpoint [in] the point to define the position of the dimension attachment on the circle.

Parameters
----------
theCircle: gp_Circ
theAnchorPoint: gp_Pnt

Returns
-------
None
") PrsDim_RadiusDimension;
		 PrsDim_RadiusDimension(const gp_Circ & theCircle, const gp_Pnt & theAnchorPoint);

		/****************** PrsDim_RadiusDimension ******************/
		/**** md5 signature: 9ec6cb0a403ac2a19ad90c538c3a5e36 ****/
		%feature("compactdefaultargs") PrsDim_RadiusDimension;
		%feature("autodoc", "Create radius dimension for the arbitrary shape (if possible). @param theshape [in] the shape to measure.

Parameters
----------
theShape: TopoDS_Shape

Returns
-------
None
") PrsDim_RadiusDimension;
		 PrsDim_RadiusDimension(const TopoDS_Shape & theShape);

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
		/**** md5 signature: 62f290d0c1a25a3579f77b31be4010f2 ****/
		%feature("compactdefaultargs") GetTextPosition;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Pnt
") GetTextPosition;
		virtual gp_Pnt GetTextPosition();

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
		/****************** PrsDim_SymmetricRelation ******************/
		/**** md5 signature: 645a643bff4a9e0e8fd2ade4864624ad ****/
		%feature("compactdefaultargs") PrsDim_SymmetricRelation;
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
") PrsDim_SymmetricRelation;
		 PrsDim_SymmetricRelation(const TopoDS_Shape & aSymmTool, const TopoDS_Shape & FirstShape, const TopoDS_Shape & SecondShape, const opencascade::handle<Geom_Plane> & aPlane);

		/****************** GetTool ******************/
		/**** md5 signature: ec6944b3d25bda4f64b24ac26b67c01b ****/
		%feature("compactdefaultargs") GetTool;
		%feature("autodoc", "Returns the tool composed of a first shape, a second shape, and a plane. this tool is created at construction time.

Returns
-------
TopoDS_Shape
") GetTool;
		const TopoDS_Shape GetTool();

		/****************** IsMovable ******************/
		/**** md5 signature: f6ba7e60b1b3f70d71d7fe5631d123a5 ****/
		%feature("compactdefaultargs") IsMovable;
		%feature("autodoc", "Returns true if the symmetric constraint display is movable.

Returns
-------
bool
") IsMovable;
		virtual Standard_Boolean IsMovable();

		/****************** SetTool ******************/
		/**** md5 signature: 816479e3edeb279cf3b82a00c0d00a2d ****/
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
		/****************** PrsDim_TangentRelation ******************/
		/**** md5 signature: d032a6f245c872be074dcae3bd0608db ****/
		%feature("compactdefaultargs") PrsDim_TangentRelation;
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
") PrsDim_TangentRelation;
		 PrsDim_TangentRelation(const TopoDS_Shape & aFShape, const TopoDS_Shape & aSShape, const opencascade::handle<Geom_Plane> & aPlane, const Standard_Integer anExternRef = 0);

		/****************** ExternRef ******************/
		/**** md5 signature: 76cf8e64b0c656db756364b81297da17 ****/
		%feature("compactdefaultargs") ExternRef;
		%feature("autodoc", "Returns the external reference for tangency. the values are as follows: - 0 - there is no connection; - 1 - there is a connection to the first shape; - 2 - there is a connection to the second shape. this reference is defined at construction time.

Returns
-------
int
") ExternRef;
		Standard_Integer ExternRef();

		/****************** SetExternRef ******************/
		/**** md5 signature: 586a4a6230d10739270f4e5a188d9bfa ****/
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
		/****************** PrsDim_MaxRadiusDimension ******************/
		/**** md5 signature: d980757c5468e00e0bf9166d80e0ffdc ****/
		%feature("compactdefaultargs") PrsDim_MaxRadiusDimension;
		%feature("autodoc", "Max ellipse radius dimension shape can be edge , planar face or cylindrical face.

Parameters
----------
aShape: TopoDS_Shape
aVal: float
aText: TCollection_ExtendedString

Returns
-------
None
") PrsDim_MaxRadiusDimension;
		 PrsDim_MaxRadiusDimension(const TopoDS_Shape & aShape, const Standard_Real aVal, const TCollection_ExtendedString & aText);

		/****************** PrsDim_MaxRadiusDimension ******************/
		/**** md5 signature: e7d293361b5fa36a3871cea6bba086cf ****/
		%feature("compactdefaultargs") PrsDim_MaxRadiusDimension;
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
") PrsDim_MaxRadiusDimension;
		 PrsDim_MaxRadiusDimension(const TopoDS_Shape & aShape, const Standard_Real aVal, const TCollection_ExtendedString & aText, const gp_Pnt & aPosition, const DsgPrs_ArrowSide aSymbolPrs, const Standard_Real anArrowSize = 0.0);

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
		/****************** PrsDim_MinRadiusDimension ******************/
		/**** md5 signature: 167835a1410022f28c578bd8e77eaae2 ****/
		%feature("compactdefaultargs") PrsDim_MinRadiusDimension;
		%feature("autodoc", "Max ellipse radius dimension shape can be edge , planar face or cylindrical face.

Parameters
----------
aShape: TopoDS_Shape
aVal: float
aText: TCollection_ExtendedString

Returns
-------
None
") PrsDim_MinRadiusDimension;
		 PrsDim_MinRadiusDimension(const TopoDS_Shape & aShape, const Standard_Real aVal, const TCollection_ExtendedString & aText);

		/****************** PrsDim_MinRadiusDimension ******************/
		/**** md5 signature: 141213159afe170ab0fead5219510652 ****/
		%feature("compactdefaultargs") PrsDim_MinRadiusDimension;
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
") PrsDim_MinRadiusDimension;
		 PrsDim_MinRadiusDimension(const TopoDS_Shape & aShape, const Standard_Real aVal, const TCollection_ExtendedString & aText, const gp_Pnt & aPosition, const DsgPrs_ArrowSide aSymbolPrs, const Standard_Real anArrowSize = 0.0);

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
