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
%define SHAPECONSTRUCTDOCSTRING
"ShapeConstruct module, see official documentation at
https://www.opencascade.com/doc/occt-7.4.0/refman/html/package_shapeconstruct.html"
%enddef
%module (package="OCC.Core", docstring=SHAPECONSTRUCTDOCSTRING) ShapeConstruct


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
#include<ShapeConstruct_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<Geom_module.hxx>
#include<GeomAbs_module.hxx>
#include<Geom2d_module.hxx>
#include<TopAbs_module.hxx>
#include<TopTools_module.hxx>
#include<TopoDS_module.hxx>
#include<gp_module.hxx>
#include<TColStd_module.hxx>
#include<BRepBuilderAPI_module.hxx>
#include<TColgp_module.hxx>
#include<ShapeAnalysis_module.hxx>
#include<ShapeExtend_module.hxx>
#include<TCollection_module.hxx>
#include<BRep_module.hxx>
#include<Bnd_module.hxx>
#include<Adaptor2d_module.hxx>
#include<TColGeom_module.hxx>
#include<Adaptor3d_module.hxx>
#include<TopLoc_module.hxx>
#include<TShort_module.hxx>
#include<Message_module.hxx>
#include<Poly_module.hxx>
#include<BRepTools_module.hxx>
#include<IntRes2d_module.hxx>
#include<BRepBuilderAPI_module.hxx>
#include<GeomAdaptor_module.hxx>
#include<ShapeAnalysis_module.hxx>
#include<Geom_module.hxx>
#include<TopTools_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import Geom.i
%import GeomAbs.i
%import Geom2d.i
%import TopAbs.i
%import TopTools.i
%import TopoDS.i
%import gp.i
%import TColStd.i
%import BRepBuilderAPI.i
%import TColgp.i
%import ShapeAnalysis.i
%import ShapeExtend.i

%pythoncode {
from enum import IntEnum
from OCC.Core.Exception import *
};

/* public enums */
/* end public enums declaration */

/* python proy classes for enums */
%pythoncode {
};
/* end python proxy for enums */

/* handles */
%wrap_handle(ShapeConstruct_ProjectCurveOnSurface)
/* end handles declaration */

/* templates */
/* end templates declaration */

/* typedefs */
/* end typedefs declaration */

/***********************
* class ShapeConstruct *
***********************/
%rename(shapeconstruct) ShapeConstruct;
class ShapeConstruct {
	public:
		/****************** ConvertCurveToBSpline ******************/
		/**** md5 signature: e96a2bc2620f51a54c516074790b0c2a ****/
		%feature("compactdefaultargs") ConvertCurveToBSpline;
		%feature("autodoc", "Tool for wire triangulation.

Parameters
----------
C3D: Geom_Curve
First: float
Last: float
Tol3d: float
Continuity: GeomAbs_Shape
MaxSegments: int
MaxDegree: int

Returns
-------
opencascade::handle<Geom_BSplineCurve>
") ConvertCurveToBSpline;
		static opencascade::handle<Geom_BSplineCurve> ConvertCurveToBSpline(const opencascade::handle<Geom_Curve> & C3D, const Standard_Real First, const Standard_Real Last, const Standard_Real Tol3d, const GeomAbs_Shape Continuity, const Standard_Integer MaxSegments, const Standard_Integer MaxDegree);

		/****************** ConvertCurveToBSpline ******************/
		/**** md5 signature: 6affa3a8972ff115e6414cc34e8d7653 ****/
		%feature("compactdefaultargs") ConvertCurveToBSpline;
		%feature("autodoc", "No available documentation.

Parameters
----------
C2D: Geom2d_Curve
First: float
Last: float
Tol2d: float
Continuity: GeomAbs_Shape
MaxSegments: int
MaxDegree: int

Returns
-------
opencascade::handle<Geom2d_BSplineCurve>
") ConvertCurveToBSpline;
		static opencascade::handle<Geom2d_BSplineCurve> ConvertCurveToBSpline(const opencascade::handle<Geom2d_Curve> & C2D, const Standard_Real First, const Standard_Real Last, const Standard_Real Tol2d, const GeomAbs_Shape Continuity, const Standard_Integer MaxSegments, const Standard_Integer MaxDegree);

		/****************** ConvertSurfaceToBSpline ******************/
		/**** md5 signature: 56c3fbc2fcbd52cf0207750979158da5 ****/
		%feature("compactdefaultargs") ConvertSurfaceToBSpline;
		%feature("autodoc", "No available documentation.

Parameters
----------
surf: Geom_Surface
UF: float
UL: float
VF: float
VL: float
Tol3d: float
Continuity: GeomAbs_Shape
MaxSegments: int
MaxDegree: int

Returns
-------
opencascade::handle<Geom_BSplineSurface>
") ConvertSurfaceToBSpline;
		static opencascade::handle<Geom_BSplineSurface> ConvertSurfaceToBSpline(const opencascade::handle<Geom_Surface> & surf, const Standard_Real UF, const Standard_Real UL, const Standard_Real VF, const Standard_Real VL, const Standard_Real Tol3d, const GeomAbs_Shape Continuity, const Standard_Integer MaxSegments, const Standard_Integer MaxDegree);

		/****************** JoinCurves ******************/
		/**** md5 signature: 42f6c6d994f5046d227e89efea81a64e ****/
		%feature("compactdefaultargs") JoinCurves;
		%feature("autodoc", "Method for joininig curves 3d. parameters : c3d1,ac3d2 - initial curves orient1, orient2 - initial edges orientations. first1,last1,first2,last2 - parameters for trimming curves (re-calculate with account of orientation edges) c3dout - result curve isrev1,isrev2 - out parameters indicative on possible errors. return value : true - if curves were joined successfully, else - false.

Parameters
----------
c3d1: Geom_Curve
ac3d2: Geom_Curve
Orient1: TopAbs_Orientation
Orient2: TopAbs_Orientation
c3dOut: Geom_Curve

Returns
-------
first1: float
last1: float
first2: float
last2: float
isRev1: bool
isRev2: bool
") JoinCurves;
		static Standard_Boolean JoinCurves(const opencascade::handle<Geom_Curve> & c3d1, const opencascade::handle<Geom_Curve> & ac3d2, const TopAbs_Orientation Orient1, const TopAbs_Orientation Orient2, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, opencascade::handle<Geom_Curve> & c3dOut, Standard_Boolean &OutValue, Standard_Boolean &OutValue);

		/****************** JoinCurves ******************/
		/**** md5 signature: b94c3f264bbba3ef8c7cb35ad5f19df9 ****/
		%feature("compactdefaultargs") JoinCurves;
		%feature("autodoc", "Method for joininig curves 3d. parameters : c3d1,ac3d2 - initial curves orient1, orient2 - initial edges orientations. first1,last1,first2,last2 - parameters for trimming curves (re-calculate with account of orientation edges) c3dout - result curve isrev1,isrev2 - out parameters indicative on possible errors. iserror - input parameter indicative possible errors due to that one from edges have one vertex return value : true - if curves were joined successfully, else - false.

Parameters
----------
c2d1: Geom2d_Curve
ac2d2: Geom2d_Curve
Orient1: TopAbs_Orientation
Orient2: TopAbs_Orientation
c2dOut: Geom2d_Curve
isError: bool,optional
	default value is Standard_False

Returns
-------
first1: float
last1: float
first2: float
last2: float
isRev1: bool
isRev2: bool
") JoinCurves;
		static Standard_Boolean JoinCurves(const opencascade::handle<Geom2d_Curve> & c2d1, const opencascade::handle<Geom2d_Curve> & ac2d2, const TopAbs_Orientation Orient1, const TopAbs_Orientation Orient2, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, opencascade::handle<Geom2d_Curve> & c2dOut, Standard_Boolean &OutValue, Standard_Boolean &OutValue, const Standard_Boolean isError = Standard_False);

		/****************** JoinPCurves ******************/
		/**** md5 signature: e9caa72c09cd9d39fbc1b7c2c547c6cd ****/
		%feature("compactdefaultargs") JoinPCurves;
		%feature("autodoc", "Join pcurves of the <theedge> on the <theface> try to use pcurves from originas edges <theedges> returns false if cannot join pcurves.

Parameters
----------
theEdges: TopTools_HSequenceOfShape
theFace: TopoDS_Face
theEdge: TopoDS_Edge

Returns
-------
bool
") JoinPCurves;
		static Standard_Boolean JoinPCurves(const opencascade::handle<TopTools_HSequenceOfShape> & theEdges, const TopoDS_Face & theFace, TopoDS_Edge & theEdge);

};


%extend ShapeConstruct {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************
* class ShapeConstruct_Curve *
*****************************/
class ShapeConstruct_Curve {
	public:
		/****************** AdjustCurve ******************/
		/**** md5 signature: 1f7d7c10e6b8249c15e41e423ec5f10e ****/
		%feature("compactdefaultargs") AdjustCurve;
		%feature("autodoc", "Modifies a curve in order to make its bounds confused with given points. works only on lines and b-splines, returns true in this case, else returns false. for line considers both bounding points, for b-splines only specified. //! warning : does not check if curve should be reversed.

Parameters
----------
C3D: Geom_Curve
P1: gp_Pnt
P2: gp_Pnt
take1: bool,optional
	default value is Standard_True
take2: bool,optional
	default value is Standard_True

Returns
-------
bool
") AdjustCurve;
		Standard_Boolean AdjustCurve(const opencascade::handle<Geom_Curve> & C3D, const gp_Pnt & P1, const gp_Pnt & P2, const Standard_Boolean take1 = Standard_True, const Standard_Boolean take2 = Standard_True);

		/****************** AdjustCurve2d ******************/
		/**** md5 signature: 0ed4029b1e71b0f5f025a693259e9542 ****/
		%feature("compactdefaultargs") AdjustCurve2d;
		%feature("autodoc", "Modifies a curve in order to make its bounds confused with given points. works only on lines and b-splines, returns true in this case, else returns false. //! for line considers both bounding points, for b-splines only specified. //! warning : does not check if curve should be reversed.

Parameters
----------
C2D: Geom2d_Curve
P1: gp_Pnt2d
P2: gp_Pnt2d
take1: bool,optional
	default value is Standard_True
take2: bool,optional
	default value is Standard_True

Returns
-------
bool
") AdjustCurve2d;
		Standard_Boolean AdjustCurve2d(const opencascade::handle<Geom2d_Curve> & C2D, const gp_Pnt2d & P1, const gp_Pnt2d & P2, const Standard_Boolean take1 = Standard_True, const Standard_Boolean take2 = Standard_True);

		/****************** AdjustCurveSegment ******************/
		/**** md5 signature: 55a46b78ba47eac061ad1db867f897d3 ****/
		%feature("compactdefaultargs") AdjustCurveSegment;
		%feature("autodoc", "Modifies a curve in order to make its bounds confused with given points. works only on lines and b-splines. //! for lines works as previous method, b-splines are segmented at the given values and then are adjusted to the points.

Parameters
----------
C3D: Geom_Curve
P1: gp_Pnt
P2: gp_Pnt
U1: float
U2: float

Returns
-------
bool
") AdjustCurveSegment;
		Standard_Boolean AdjustCurveSegment(const opencascade::handle<Geom_Curve> & C3D, const gp_Pnt & P1, const gp_Pnt & P2, const Standard_Real U1, const Standard_Real U2);

		/****************** ConvertToBSpline ******************/
		/**** md5 signature: 19376ff893525dcd6cf5e373ee85abb9 ****/
		%feature("compactdefaultargs") ConvertToBSpline;
		%feature("autodoc", "Converts a curve of any type (only part from first to last) to bspline. the method of conversion depends on the type of original curve: bspline -> c.segment(first,last) bezier and line -> geomconvert::curvetobsplinecurve(c).segment(first,last) conic and other -> approx_curve3d(c[first,last],prec,c1,9,1000).

Parameters
----------
C: Geom_Curve
first: float
last: float
prec: float

Returns
-------
opencascade::handle<Geom_BSplineCurve>
") ConvertToBSpline;
		opencascade::handle<Geom_BSplineCurve> ConvertToBSpline(const opencascade::handle<Geom_Curve> & C, const Standard_Real first, const Standard_Real last, const Standard_Real prec);

		/****************** ConvertToBSpline ******************/
		/**** md5 signature: 67e22df5c9b6aa1af20547791bd07c17 ****/
		%feature("compactdefaultargs") ConvertToBSpline;
		%feature("autodoc", "Converts a curve of any type (only part from first to last) to bspline. the method of conversion depends on the type of original curve: bspline -> c.segment(first,last) bezier and line -> geomconvert::curvetobsplinecurve(c).segment(first,last) conic and other -> approx_curve2d(c[first,last],prec,c1,9,1000).

Parameters
----------
C: Geom2d_Curve
first: float
last: float
prec: float

Returns
-------
opencascade::handle<Geom2d_BSplineCurve>
") ConvertToBSpline;
		opencascade::handle<Geom2d_BSplineCurve> ConvertToBSpline(const opencascade::handle<Geom2d_Curve> & C, const Standard_Real first, const Standard_Real last, const Standard_Real prec);

		/****************** FixKnots ******************/
		/**** md5 signature: 2d6b81e7c20061f8b14bd4eab45dd379 ****/
		%feature("compactdefaultargs") FixKnots;
		%feature("autodoc", "No available documentation.

Parameters
----------
knots: TColStd_HArray1OfReal

Returns
-------
bool
") FixKnots;
		static Standard_Boolean FixKnots(opencascade::handle<TColStd_HArray1OfReal> & knots);

		/****************** FixKnots ******************/
		/**** md5 signature: b95e53e8ec1c41f8c3c30eaff8ebc9e3 ****/
		%feature("compactdefaultargs") FixKnots;
		%feature("autodoc", "Fix bspline knots to ensure that there is enough gap between neighbouring values returns true if something fixed (by shifting knot).

Parameters
----------
knots: TColStd_Array1OfReal

Returns
-------
bool
") FixKnots;
		static Standard_Boolean FixKnots(TColStd_Array1OfReal & knots);

};


%extend ShapeConstruct_Curve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************************
* class ShapeConstruct_MakeTriangulation *
*****************************************/
class ShapeConstruct_MakeTriangulation : public BRepBuilderAPI_MakeShape {
	public:
		/****************** ShapeConstruct_MakeTriangulation ******************/
		/**** md5 signature: a1d799816fdb6a068fe983d47396aaee ****/
		%feature("compactdefaultargs") ShapeConstruct_MakeTriangulation;
		%feature("autodoc", "No available documentation.

Parameters
----------
pnts: TColgp_Array1OfPnt
prec: float,optional
	default value is 0.0

Returns
-------
None
") ShapeConstruct_MakeTriangulation;
		 ShapeConstruct_MakeTriangulation(const TColgp_Array1OfPnt & pnts, const Standard_Real prec = 0.0);

		/****************** ShapeConstruct_MakeTriangulation ******************/
		/**** md5 signature: 268d8bbbc20b03fa4d66d26585d7d055 ****/
		%feature("compactdefaultargs") ShapeConstruct_MakeTriangulation;
		%feature("autodoc", "No available documentation.

Parameters
----------
wire: TopoDS_Wire
prec: float,optional
	default value is 0.0

Returns
-------
None
") ShapeConstruct_MakeTriangulation;
		 ShapeConstruct_MakeTriangulation(const TopoDS_Wire & wire, const Standard_Real prec = 0.0);

		/****************** Build ******************/
		/**** md5 signature: 5ad4569f96377eec0c61c7f10d7c7aa9 ****/
		%feature("compactdefaultargs") Build;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Build;
		virtual void Build();

		/****************** IsDone ******************/
		/**** md5 signature: e2af43c18fdd9d21f5f5de9eae7fc9de ****/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsDone;
		virtual Standard_Boolean IsDone();

};


%extend ShapeConstruct_MakeTriangulation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************************
* class ShapeConstruct_ProjectCurveOnSurface *
*********************************************/
class ShapeConstruct_ProjectCurveOnSurface : public Standard_Transient {
	public:
		/****************** ShapeConstruct_ProjectCurveOnSurface ******************/
		/**** md5 signature: 4cb4d694dc4ad9b3f95b8440d3b8b9bc ****/
		%feature("compactdefaultargs") ShapeConstruct_ProjectCurveOnSurface;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") ShapeConstruct_ProjectCurveOnSurface;
		 ShapeConstruct_ProjectCurveOnSurface();


        %feature("autodoc","1");
        %extend {
            Standard_Integer GetAdjustOverDegenMode() {
            return (Standard_Integer) $self->AdjustOverDegenMode();
            }
        };
        %feature("autodoc","1");
        %extend {
            void SetAdjustOverDegenMode(Standard_Integer value) {
            $self->AdjustOverDegenMode()=value;
            }
        };

        %feature("autodoc","1");
        %extend {
            Standard_Boolean GetBuildCurveMode() {
            return (Standard_Boolean) $self->BuildCurveMode();
            }
        };
        %feature("autodoc","1");
        %extend {
            void SetBuildCurveMode(Standard_Boolean value) {
            $self->BuildCurveMode()=value;
            }
        };
		/****************** Init ******************/
		/**** md5 signature: 1f582cc2d24023b4359dab08f603d2dd ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Initializes the object with all necessary parameters, i.e. surface and precision.

Parameters
----------
surf: Geom_Surface
preci: float

Returns
-------
None
") Init;
		virtual void Init(const opencascade::handle<Geom_Surface> & surf, const Standard_Real preci);

		/****************** Init ******************/
		/**** md5 signature: bf33f56618306090b1bb182cce883fc5 ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Initializes the object with all necessary parameters, i.e. surface and precision.

Parameters
----------
surf: ShapeAnalysis_Surface
preci: float

Returns
-------
None
") Init;
		virtual void Init(const opencascade::handle<ShapeAnalysis_Surface> & surf, const Standard_Real preci);

		/****************** Perform ******************/
		/**** md5 signature: 9d4fd560cded5434d94dcb5871e6e101 ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Computes the projection of 3d curve onto a surface using the specialized algorithm. returns false if projector fails, otherwise, if pcurve computed successfully, returns true. the output curve 2d is guaranteed to be same-parameter with input curve 3d on the interval [first, last]. if the output curve lies on a direct line the infinite line is returned, in the case same-parameter condition is satisfied. tolfirst and tollast are the tolerances at the ends of input curve 3d.

Parameters
----------
c3d: Geom_Curve
First: float
Last: float
c2d: Geom2d_Curve
TolFirst: float,optional
	default value is -1
TolLast: float,optional
	default value is -1

Returns
-------
bool
") Perform;
		virtual Standard_Boolean Perform(opencascade::handle<Geom_Curve> & c3d, const Standard_Real First, const Standard_Real Last, opencascade::handle<Geom2d_Curve> & c2d, const Standard_Real TolFirst = -1, const Standard_Real TolLast = -1);

		/****************** PerformByProjLib ******************/
		/**** md5 signature: 90451a772b63955977e470cddd05bd72 ****/
		%feature("compactdefaultargs") PerformByProjLib;
		%feature("autodoc", "Computes the projection of 3d curve onto a surface using the standard algorithm from projlib. returns false if standard projector fails or raises an exception or cuts the curve by parametrical bounds of the surface. else, if pcurve computed successfully, returns true. the continuity, maxdeg and nbinterval are parameters of call to approx_curveonsurface. if nbinterval is equal to -1 (default), this value is computed depending on source 3d curve and surface.

Parameters
----------
c3d: Geom_Curve
First: float
Last: float
c2d: Geom2d_Curve
continuity: GeomAbs_Shape,optional
	default value is GeomAbs_C1
maxdeg: int,optional
	default value is 12
nbinterval: int,optional
	default value is -1

Returns
-------
bool
") PerformByProjLib;
		Standard_Boolean PerformByProjLib(opencascade::handle<Geom_Curve> & c3d, const Standard_Real First, const Standard_Real Last, opencascade::handle<Geom2d_Curve> & c2d, const GeomAbs_Shape continuity = GeomAbs_C1, const Standard_Integer maxdeg = 12, const Standard_Integer nbinterval = -1);

		/****************** SetPrecision ******************/
		/**** md5 signature: a601cf881702916ad1a5bcd1fec314c4 ****/
		%feature("compactdefaultargs") SetPrecision;
		%feature("autodoc", "Sets value for current precision.

Parameters
----------
preci: float

Returns
-------
None
") SetPrecision;
		void SetPrecision(const Standard_Real preci);

		/****************** SetSurface ******************/
		/**** md5 signature: ef3c30882af3f3cdd5459f6b9a1a3525 ****/
		%feature("compactdefaultargs") SetSurface;
		%feature("autodoc", "Loads a surface (in the form of geom_surface) to project on.

Parameters
----------
surf: Geom_Surface

Returns
-------
None
") SetSurface;
		void SetSurface(const opencascade::handle<Geom_Surface> & surf);

		/****************** SetSurface ******************/
		/**** md5 signature: a6a6097a9a1f4fb18a1495928444e79b ****/
		%feature("compactdefaultargs") SetSurface;
		%feature("autodoc", "Loads a surface (in the form of shapeanalysis_surface) to project on.

Parameters
----------
surf: ShapeAnalysis_Surface

Returns
-------
None
") SetSurface;
		void SetSurface(const opencascade::handle<ShapeAnalysis_Surface> & surf);

		/****************** Status ******************/
		/**** md5 signature: 03f2df8a606eef2de1cd56a4ae73f0f0 ****/
		%feature("compactdefaultargs") Status;
		%feature("autodoc", "Returns the status of last peform.

Parameters
----------
theStatus: ShapeExtend_Status

Returns
-------
bool
") Status;
		Standard_Boolean Status(const ShapeExtend_Status theStatus);

};


%make_alias(ShapeConstruct_ProjectCurveOnSurface)

%extend ShapeConstruct_ProjectCurveOnSurface {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* harray1 classes */
/* harray2 classes */
/* hsequence classes */
