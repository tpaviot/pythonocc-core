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
%define PROJLIBDOCSTRING
"ProjLib module, see official documentation at
https://www.opencascade.com/doc/occt-7.4.0/refman/html/package_projlib.html"
%enddef
%module (package="OCC.Core", docstring=PROJLIBDOCSTRING) ProjLib


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
#include<ProjLib_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<TColgp_module.hxx>
#include<Adaptor3d_module.hxx>
#include<Geom2d_module.hxx>
#include<gp_module.hxx>
#include<Adaptor2d_module.hxx>
#include<GeomAbs_module.hxx>
#include<TColStd_module.hxx>
#include<AppParCurves_module.hxx>
#include<math_module.hxx>
#include<Geom_module.hxx>
#include<GeomAdaptor_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import TColgp.i
%import Adaptor3d.i
%import Geom2d.i
%import gp.i
%import Adaptor2d.i
%import GeomAbs.i
%import TColStd.i
%import AppParCurves.i
%import math.i
%import Geom.i
%import GeomAdaptor.i
/* public enums */
/* end public enums declaration */

/* handles */
%wrap_handle(ProjLib_HCompProjectedCurve)
%wrap_handle(ProjLib_HProjectedCurve)
%wrap_handle(ProjLib_HSequenceOfHSequenceOfPnt)
/* end handles declaration */

/* templates */
%template(ProjLib_SequenceOfHSequenceOfPnt) NCollection_Sequence <opencascade::handle <TColgp_HSequenceOfPnt>>;
/* end templates declaration */

/* typedefs */
typedef NCollection_Sequence <opencascade::handle <TColgp_HSequenceOfPnt>> ProjLib_SequenceOfHSequenceOfPnt;
/* end typedefs declaration */

/****************
* class ProjLib *
****************/
%rename(projlib) ProjLib;
class ProjLib {
	public:
		/****************** IsAnaSurf ******************/
		%feature("compactdefaultargs") IsAnaSurf;
		%feature("autodoc", "* Returns 'true' if surface is analytical, that is it can be Plane, Cylinder, Cone, Sphere, Torus. For all other types of surface method returns 'false'.
	:param theAS:
	:type theAS: Adaptor3d_HSurface
	:rtype: bool") IsAnaSurf;
		static Standard_Boolean IsAnaSurf (const opencascade::handle<Adaptor3d_HSurface> & theAS);

		/****************** MakePCurveOfType ******************/
		%feature("compactdefaultargs") MakePCurveOfType;
		%feature("autodoc", "* Make empty P-Curve <aC> of relevant to <PC> type
	:param PC:
	:type PC: ProjLib_ProjectedCurve
	:param aC:
	:type aC: Geom2d_Curve
	:rtype: void") MakePCurveOfType;
		static void MakePCurveOfType (const ProjLib_ProjectedCurve & PC,opencascade::handle<Geom2d_Curve> & aC);

		/****************** Project ******************/
		%feature("compactdefaultargs") Project;
		%feature("autodoc", ":param Pl:
	:type Pl: gp_Pln
	:param P:
	:type P: gp_Pnt
	:rtype: gp_Pnt2d") Project;
		static gp_Pnt2d Project (const gp_Pln & Pl,const gp_Pnt & P);

		/****************** Project ******************/
		%feature("compactdefaultargs") Project;
		%feature("autodoc", ":param Pl:
	:type Pl: gp_Pln
	:param L:
	:type L: gp_Lin
	:rtype: gp_Lin2d") Project;
		static gp_Lin2d Project (const gp_Pln & Pl,const gp_Lin & L);

		/****************** Project ******************/
		%feature("compactdefaultargs") Project;
		%feature("autodoc", ":param Pl:
	:type Pl: gp_Pln
	:param C:
	:type C: gp_Circ
	:rtype: gp_Circ2d") Project;
		static gp_Circ2d Project (const gp_Pln & Pl,const gp_Circ & C);

		/****************** Project ******************/
		%feature("compactdefaultargs") Project;
		%feature("autodoc", ":param Pl:
	:type Pl: gp_Pln
	:param E:
	:type E: gp_Elips
	:rtype: gp_Elips2d") Project;
		static gp_Elips2d Project (const gp_Pln & Pl,const gp_Elips & E);

		/****************** Project ******************/
		%feature("compactdefaultargs") Project;
		%feature("autodoc", ":param Pl:
	:type Pl: gp_Pln
	:param P:
	:type P: gp_Parab
	:rtype: gp_Parab2d") Project;
		static gp_Parab2d Project (const gp_Pln & Pl,const gp_Parab & P);

		/****************** Project ******************/
		%feature("compactdefaultargs") Project;
		%feature("autodoc", ":param Pl:
	:type Pl: gp_Pln
	:param H:
	:type H: gp_Hypr
	:rtype: gp_Hypr2d") Project;
		static gp_Hypr2d Project (const gp_Pln & Pl,const gp_Hypr & H);

		/****************** Project ******************/
		%feature("compactdefaultargs") Project;
		%feature("autodoc", ":param Cy:
	:type Cy: gp_Cylinder
	:param P:
	:type P: gp_Pnt
	:rtype: gp_Pnt2d") Project;
		static gp_Pnt2d Project (const gp_Cylinder & Cy,const gp_Pnt & P);

		/****************** Project ******************/
		%feature("compactdefaultargs") Project;
		%feature("autodoc", ":param Cy:
	:type Cy: gp_Cylinder
	:param L:
	:type L: gp_Lin
	:rtype: gp_Lin2d") Project;
		static gp_Lin2d Project (const gp_Cylinder & Cy,const gp_Lin & L);

		/****************** Project ******************/
		%feature("compactdefaultargs") Project;
		%feature("autodoc", ":param Cy:
	:type Cy: gp_Cylinder
	:param Ci:
	:type Ci: gp_Circ
	:rtype: gp_Lin2d") Project;
		static gp_Lin2d Project (const gp_Cylinder & Cy,const gp_Circ & Ci);

		/****************** Project ******************/
		%feature("compactdefaultargs") Project;
		%feature("autodoc", ":param Co:
	:type Co: gp_Cone
	:param P:
	:type P: gp_Pnt
	:rtype: gp_Pnt2d") Project;
		static gp_Pnt2d Project (const gp_Cone & Co,const gp_Pnt & P);

		/****************** Project ******************/
		%feature("compactdefaultargs") Project;
		%feature("autodoc", ":param Co:
	:type Co: gp_Cone
	:param L:
	:type L: gp_Lin
	:rtype: gp_Lin2d") Project;
		static gp_Lin2d Project (const gp_Cone & Co,const gp_Lin & L);

		/****************** Project ******************/
		%feature("compactdefaultargs") Project;
		%feature("autodoc", ":param Co:
	:type Co: gp_Cone
	:param Ci:
	:type Ci: gp_Circ
	:rtype: gp_Lin2d") Project;
		static gp_Lin2d Project (const gp_Cone & Co,const gp_Circ & Ci);

		/****************** Project ******************/
		%feature("compactdefaultargs") Project;
		%feature("autodoc", ":param Sp:
	:type Sp: gp_Sphere
	:param P:
	:type P: gp_Pnt
	:rtype: gp_Pnt2d") Project;
		static gp_Pnt2d Project (const gp_Sphere & Sp,const gp_Pnt & P);

		/****************** Project ******************/
		%feature("compactdefaultargs") Project;
		%feature("autodoc", ":param Sp:
	:type Sp: gp_Sphere
	:param Ci:
	:type Ci: gp_Circ
	:rtype: gp_Lin2d") Project;
		static gp_Lin2d Project (const gp_Sphere & Sp,const gp_Circ & Ci);

		/****************** Project ******************/
		%feature("compactdefaultargs") Project;
		%feature("autodoc", ":param To:
	:type To: gp_Torus
	:param P:
	:type P: gp_Pnt
	:rtype: gp_Pnt2d") Project;
		static gp_Pnt2d Project (const gp_Torus & To,const gp_Pnt & P);

		/****************** Project ******************/
		%feature("compactdefaultargs") Project;
		%feature("autodoc", ":param To:
	:type To: gp_Torus
	:param Ci:
	:type Ci: gp_Circ
	:rtype: gp_Lin2d") Project;
		static gp_Lin2d Project (const gp_Torus & To,const gp_Circ & Ci);

};


%extend ProjLib {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************************
* class ProjLib_CompProjectedCurve *
***********************************/
class ProjLib_CompProjectedCurve : public Adaptor2d_Curve2d {
	public:
		/****************** Bounds ******************/
		%feature("compactdefaultargs") Bounds;
		%feature("autodoc", "* returns the bounds of the continuous part corresponding to Index
	:param Index:
	:type Index: int
	:param Udeb:
	:type Udeb: float
	:param Ufin:
	:type Ufin: float
	:rtype: None") Bounds;
		void Bounds (const Standard_Integer Index,Standard_Real &OutValue,Standard_Real &OutValue);

		/****************** D0 ******************/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "* Computes the point of parameter U on the curve.
	:param U:
	:type U: float
	:param P:
	:type P: gp_Pnt2d
	:rtype: None") D0;
		void D0 (const Standard_Real U,gp_Pnt2d & P);

		/****************** D1 ******************/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "* Computes the point of parameter U on the curve with its first derivative. Raised if the continuity of the current interval is not C1.
	:param U:
	:type U: float
	:param P:
	:type P: gp_Pnt2d
	:param V:
	:type V: gp_Vec2d
	:rtype: None") D1;
		void D1 (const Standard_Real U,gp_Pnt2d & P,gp_Vec2d & V);

		/****************** D2 ******************/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "* Returns the point P of parameter U, the first and second derivatives V1 and V2. Raised if the continuity of the current interval is not C2.
	:param U:
	:type U: float
	:param P:
	:type P: gp_Pnt2d
	:param V1:
	:type V1: gp_Vec2d
	:param V2:
	:type V2: gp_Vec2d
	:rtype: None") D2;
		void D2 (const Standard_Real U,gp_Pnt2d & P,gp_Vec2d & V1,gp_Vec2d & V2);

		/****************** DN ******************/
		%feature("compactdefaultargs") DN;
		%feature("autodoc", "* The returned vector gives the value of the derivative for the order of derivation N. Raised if N < 1. Raised if N > 2.
	:param U:
	:type U: float
	:param N:
	:type N: int
	:rtype: gp_Vec2d") DN;
		gp_Vec2d DN (const Standard_Real U,const Standard_Integer N);

		/****************** FirstParameter ******************/
		%feature("compactdefaultargs") FirstParameter;
		%feature("autodoc", "* Returns the first parameter of the curve C which has a projection on S.
	:rtype: float") FirstParameter;
		Standard_Real FirstParameter ();

		/****************** GetCurve ******************/
		%feature("compactdefaultargs") GetCurve;
		%feature("autodoc", ":rtype: opencascade::handle<Adaptor3d_HCurve>") GetCurve;
		const opencascade::handle<Adaptor3d_HCurve> & GetCurve ();

		/****************** GetSequence ******************/
		%feature("compactdefaultargs") GetSequence;
		%feature("autodoc", ":rtype: opencascade::handle<ProjLib_HSequenceOfHSequenceOfPnt>") GetSequence;
		const opencascade::handle<ProjLib_HSequenceOfHSequenceOfPnt> & GetSequence ();

		/****************** GetSurface ******************/
		%feature("compactdefaultargs") GetSurface;
		%feature("autodoc", ":rtype: opencascade::handle<Adaptor3d_HSurface>") GetSurface;
		const opencascade::handle<Adaptor3d_HSurface> & GetSurface ();

		/****************** GetTolerance ******************/
		%feature("compactdefaultargs") GetTolerance;
		%feature("autodoc", ":param TolU:
	:type TolU: float
	:param TolV:
	:type TolV: float
	:rtype: None") GetTolerance;
		void GetTolerance (Standard_Real &OutValue,Standard_Real &OutValue);

		/****************** GetType ******************/
		%feature("compactdefaultargs") GetType;
		%feature("autodoc", "* Returns the type of the curve in the current interval : Line, Circle, Ellipse, Hyperbola, Parabola, BezierCurve, BSplineCurve, OtherCurve.
	:rtype: GeomAbs_CurveType") GetType;
		GeomAbs_CurveType GetType ();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "* computes a set of projected point and determine the continuous parts of the projected curves. The points corresponding to a projection on the bounds of the surface are included in this set of points.
	:rtype: None") Init;
		void Init ();

		/****************** Intervals ******************/
		%feature("compactdefaultargs") Intervals;
		%feature("autodoc", "* Returns the parameters corresponding to S discontinuities. //! The array must provide enough room to accommodate for the parameters. i.e. T.Length() > NbIntervals()
	:param T:
	:type T: TColStd_Array1OfReal
	:param S:
	:type S: GeomAbs_Shape
	:rtype: None") Intervals;
		void Intervals (TColStd_Array1OfReal & T,const GeomAbs_Shape S);

		/****************** IsSinglePnt ******************/
		%feature("compactdefaultargs") IsSinglePnt;
		%feature("autodoc", "* returns True if part of projection with number Index is a single point and writes its coordinates in P
	:param Index:
	:type Index: int
	:param P:
	:type P: gp_Pnt2d
	:rtype: bool") IsSinglePnt;
		Standard_Boolean IsSinglePnt (const Standard_Integer Index,gp_Pnt2d & P);

		/****************** IsUIso ******************/
		%feature("compactdefaultargs") IsUIso;
		%feature("autodoc", "* returns True if part of projection with number Index is an u-isoparametric curve of input surface
	:param Index:
	:type Index: int
	:param U:
	:type U: float
	:rtype: bool") IsUIso;
		Standard_Boolean IsUIso (const Standard_Integer Index,Standard_Real &OutValue);

		/****************** IsVIso ******************/
		%feature("compactdefaultargs") IsVIso;
		%feature("autodoc", "* returns True if part of projection with number Index is an v-isoparametric curve of input surface
	:param Index:
	:type Index: int
	:param V:
	:type V: float
	:rtype: bool") IsVIso;
		Standard_Boolean IsVIso (const Standard_Integer Index,Standard_Real &OutValue);

		/****************** LastParameter ******************/
		%feature("compactdefaultargs") LastParameter;
		%feature("autodoc", "* Returns the last parameter of the curve C which has a projection on S.
	:rtype: float") LastParameter;
		Standard_Real LastParameter ();

		/****************** Load ******************/
		%feature("compactdefaultargs") Load;
		%feature("autodoc", "* Changes the surface.
	:param S:
	:type S: Adaptor3d_HSurface
	:rtype: None") Load;
		void Load (const opencascade::handle<Adaptor3d_HSurface> & S);

		/****************** Load ******************/
		%feature("compactdefaultargs") Load;
		%feature("autodoc", "* Changes the curve.
	:param C:
	:type C: Adaptor3d_HCurve
	:rtype: None") Load;
		void Load (const opencascade::handle<Adaptor3d_HCurve> & C);

		/****************** MaxDistance ******************/
		%feature("compactdefaultargs") MaxDistance;
		%feature("autodoc", "* returns the maximum distance between curve to project and surface
	:param Index:
	:type Index: int
	:rtype: float") MaxDistance;
		Standard_Real MaxDistance (const Standard_Integer Index);

		/****************** NbCurves ******************/
		%feature("compactdefaultargs") NbCurves;
		%feature("autodoc", "* returns the number of continuous part of the projected curve
	:rtype: int") NbCurves;
		Standard_Integer NbCurves ();

		/****************** NbIntervals ******************/
		%feature("compactdefaultargs") NbIntervals;
		%feature("autodoc", "* Returns the number of intervals which define an S continuous part of the projected curve
	:param S:
	:type S: GeomAbs_Shape
	:rtype: int") NbIntervals;
		Standard_Integer NbIntervals (const GeomAbs_Shape S);

		/****************** ProjLib_CompProjectedCurve ******************/
		%feature("compactdefaultargs") ProjLib_CompProjectedCurve;
		%feature("autodoc", ":rtype: None") ProjLib_CompProjectedCurve;
		 ProjLib_CompProjectedCurve ();

		/****************** ProjLib_CompProjectedCurve ******************/
		%feature("compactdefaultargs") ProjLib_CompProjectedCurve;
		%feature("autodoc", "* try to find all solutions
	:param S:
	:type S: Adaptor3d_HSurface
	:param C:
	:type C: Adaptor3d_HCurve
	:param TolU:
	:type TolU: float
	:param TolV:
	:type TolV: float
	:rtype: None") ProjLib_CompProjectedCurve;
		 ProjLib_CompProjectedCurve (const opencascade::handle<Adaptor3d_HSurface> & S,const opencascade::handle<Adaptor3d_HCurve> & C,const Standard_Real TolU,const Standard_Real TolV);

		/****************** ProjLib_CompProjectedCurve ******************/
		%feature("compactdefaultargs") ProjLib_CompProjectedCurve;
		%feature("autodoc", "* this constructor tries to optimize the search using the assumption that maximum distance between surface and curve less or equal then MaxDist. if MaxDist < 0 then algorithm works as above.
	:param S:
	:type S: Adaptor3d_HSurface
	:param C:
	:type C: Adaptor3d_HCurve
	:param TolU:
	:type TolU: float
	:param TolV:
	:type TolV: float
	:param MaxDist:
	:type MaxDist: float
	:rtype: None") ProjLib_CompProjectedCurve;
		 ProjLib_CompProjectedCurve (const opencascade::handle<Adaptor3d_HSurface> & S,const opencascade::handle<Adaptor3d_HCurve> & C,const Standard_Real TolU,const Standard_Real TolV,const Standard_Real MaxDist);

		/****************** Trim ******************/
		%feature("compactdefaultargs") Trim;
		%feature("autodoc", "* Returns a curve equivalent of <self> between parameters <First> and <Last>. <Tol> is used to test for 2d points confusion. If <First> >= <Last>
	:param FirstParam:
	:type FirstParam: float
	:param LastParam:
	:type LastParam: float
	:param Tol:
	:type Tol: float
	:rtype: opencascade::handle<Adaptor2d_HCurve2d>") Trim;
		opencascade::handle<Adaptor2d_HCurve2d> Trim (const Standard_Real FirstParam,const Standard_Real LastParam,const Standard_Real Tol);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "* Computes the point of parameter U on the curve.
	:param U:
	:type U: float
	:rtype: gp_Pnt2d") Value;
		gp_Pnt2d Value (const Standard_Real U);

};


%extend ProjLib_CompProjectedCurve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************
* class ProjLib_ComputeApprox *
******************************/
class ProjLib_ComputeApprox {
	public:
		/****************** BSpline ******************/
		%feature("compactdefaultargs") BSpline;
		%feature("autodoc", ":rtype: opencascade::handle<Geom2d_BSplineCurve>") BSpline;
		opencascade::handle<Geom2d_BSplineCurve> BSpline ();

		/****************** Bezier ******************/
		%feature("compactdefaultargs") Bezier;
		%feature("autodoc", ":rtype: opencascade::handle<Geom2d_BezierCurve>") Bezier;
		opencascade::handle<Geom2d_BezierCurve> Bezier ();

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "* Performs projecting. In case of approximation current values of parameters are used: default values or set by corresponding methods Set...
	:param C:
	:type C: Adaptor3d_HCurve
	:param S:
	:type S: Adaptor3d_HSurface
	:rtype: None") Perform;
		void Perform (const opencascade::handle<Adaptor3d_HCurve> & C,const opencascade::handle<Adaptor3d_HSurface> & S);

		/****************** ProjLib_ComputeApprox ******************/
		%feature("compactdefaultargs") ProjLib_ComputeApprox;
		%feature("autodoc", "* Empty constructor, it only sets some initial values for class fields.
	:rtype: None") ProjLib_ComputeApprox;
		 ProjLib_ComputeApprox ();

		/****************** ProjLib_ComputeApprox ******************/
		%feature("compactdefaultargs") ProjLib_ComputeApprox;
		%feature("autodoc", "* <Tol> is the tolerance with which the approximation is performed. Other parameters for approximation have default values.
	:param C:
	:type C: Adaptor3d_HCurve
	:param S:
	:type S: Adaptor3d_HSurface
	:param Tol:
	:type Tol: float
	:rtype: None") ProjLib_ComputeApprox;
		 ProjLib_ComputeApprox (const opencascade::handle<Adaptor3d_HCurve> & C,const opencascade::handle<Adaptor3d_HSurface> & S,const Standard_Real Tol);

		/****************** SetBndPnt ******************/
		%feature("compactdefaultargs") SetBndPnt;
		%feature("autodoc", "* Set the parameter, which defines type of boundary condition between segments during approximation. It can be AppParCurves_PassPoint or AppParCurves_TangencyPoint. Default value is AppParCurves_TangencyPoint;
	:param theBndPnt:
	:type theBndPnt: AppParCurves_Constraint
	:rtype: None") SetBndPnt;
		void SetBndPnt (const AppParCurves_Constraint theBndPnt);

		/****************** SetDegree ******************/
		%feature("compactdefaultargs") SetDegree;
		%feature("autodoc", "* Set min and max possible degree of result BSpline curve2d, which is got by approximation. If theDegMin/Max < 0, algorithm uses values that are chosen depending of types curve 3d and surface.
	:param theDegMin:
	:type theDegMin: int
	:param theDegMax:
	:type theDegMax: int
	:rtype: None") SetDegree;
		void SetDegree (const Standard_Integer theDegMin,const Standard_Integer theDegMax);

		/****************** SetMaxSegments ******************/
		%feature("compactdefaultargs") SetMaxSegments;
		%feature("autodoc", "* Set the parameter, which defines maximal value of parametric intervals the projected curve can be cut for approximation. If theMaxSegments < 0, algorithm uses default value = 1000.
	:param theMaxSegments:
	:type theMaxSegments: int
	:rtype: None") SetMaxSegments;
		void SetMaxSegments (const Standard_Integer theMaxSegments);

		/****************** SetTolerance ******************/
		%feature("compactdefaultargs") SetTolerance;
		%feature("autodoc", "* Set tolerance of approximation. Default value is Precision::Confusion().
	:param theTolerance:
	:type theTolerance: float
	:rtype: None") SetTolerance;
		void SetTolerance (const Standard_Real theTolerance);

		/****************** Tolerance ******************/
		%feature("compactdefaultargs") Tolerance;
		%feature("autodoc", "* returns the reached Tolerance.
	:rtype: float") Tolerance;
		Standard_Real Tolerance ();

};


%extend ProjLib_ComputeApprox {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************************
* class ProjLib_ComputeApproxOnPolarSurface *
********************************************/
class ProjLib_ComputeApproxOnPolarSurface {
	public:
		/****************** BSpline ******************/
		%feature("compactdefaultargs") BSpline;
		%feature("autodoc", "* Returns result curve 2d.
	:rtype: opencascade::handle<Geom2d_BSplineCurve>") BSpline;
		opencascade::handle<Geom2d_BSplineCurve> BSpline ();

		/****************** BuildInitialCurve2d ******************/
		%feature("compactdefaultargs") BuildInitialCurve2d;
		%feature("autodoc", "* Builds initial 2d curve as BSpline with degree = 1 using Extrema algoritm. Method is used in method Perform(...).
	:param Curve:
	:type Curve: Adaptor3d_HCurve
	:param S:
	:type S: Adaptor3d_HSurface
	:rtype: opencascade::handle<Adaptor2d_HCurve2d>") BuildInitialCurve2d;
		opencascade::handle<Adaptor2d_HCurve2d> BuildInitialCurve2d (const opencascade::handle<Adaptor3d_HCurve> & Curve,const opencascade::handle<Adaptor3d_HSurface> & S);

		/****************** Curve2d ******************/
		%feature("compactdefaultargs") Curve2d;
		%feature("autodoc", "* Returns second 2d curve.
	:rtype: opencascade::handle<Geom2d_Curve>") Curve2d;
		opencascade::handle<Geom2d_Curve> Curve2d ();

		/****************** IsDone ******************/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", ":rtype: bool") IsDone;
		Standard_Boolean IsDone ();

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "* Method, which performs projecting, using default values of parameters or they must be set by corresponding methods before using.
	:param C:
	:type C: Adaptor3d_HCurve
	:param S:
	:type S: Adaptor3d_HSurface
	:rtype: None") Perform;
		void Perform (const opencascade::handle<Adaptor3d_HCurve> & C,const opencascade::handle<Adaptor3d_HSurface> & S);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "* Method, which performs projecting, using default values of parameters or they must be set by corresponding methods before using. Parameter InitCurve2d is any rough estimation of 2d result curve.
	:param InitCurve2d:
	:type InitCurve2d: Adaptor2d_HCurve2d
	:param C:
	:type C: Adaptor3d_HCurve
	:param S:
	:type S: Adaptor3d_HSurface
	:rtype: opencascade::handle<Geom2d_BSplineCurve>") Perform;
		opencascade::handle<Geom2d_BSplineCurve> Perform (const opencascade::handle<Adaptor2d_HCurve2d> & InitCurve2d,const opencascade::handle<Adaptor3d_HCurve> & C,const opencascade::handle<Adaptor3d_HSurface> & S);

		/****************** ProjLib_ComputeApproxOnPolarSurface ******************/
		%feature("compactdefaultargs") ProjLib_ComputeApproxOnPolarSurface;
		%feature("autodoc", "* Empty constructor, it only sets some initial values for class fields.
	:rtype: None") ProjLib_ComputeApproxOnPolarSurface;
		 ProjLib_ComputeApproxOnPolarSurface ();

		/****************** ProjLib_ComputeApproxOnPolarSurface ******************/
		%feature("compactdefaultargs") ProjLib_ComputeApproxOnPolarSurface;
		%feature("autodoc", "* Constructor, which performs projecting.
	:param C:
	:type C: Adaptor3d_HCurve
	:param S:
	:type S: Adaptor3d_HSurface
	:param Tol: default value is 1.0e-4
	:type Tol: float
	:rtype: None") ProjLib_ComputeApproxOnPolarSurface;
		 ProjLib_ComputeApproxOnPolarSurface (const opencascade::handle<Adaptor3d_HCurve> & C,const opencascade::handle<Adaptor3d_HSurface> & S,const Standard_Real Tol = 1.0e-4);

		/****************** ProjLib_ComputeApproxOnPolarSurface ******************/
		%feature("compactdefaultargs") ProjLib_ComputeApproxOnPolarSurface;
		%feature("autodoc", "* Constructor, which performs projecting, using initial curve 2d InitCurve2d, which is any rough approximation of result curve. Parameter Tol is 3d tolerance of approximation.
	:param InitCurve2d:
	:type InitCurve2d: Adaptor2d_HCurve2d
	:param C:
	:type C: Adaptor3d_HCurve
	:param S:
	:type S: Adaptor3d_HSurface
	:param Tol:
	:type Tol: float
	:rtype: None") ProjLib_ComputeApproxOnPolarSurface;
		 ProjLib_ComputeApproxOnPolarSurface (const opencascade::handle<Adaptor2d_HCurve2d> & InitCurve2d,const opencascade::handle<Adaptor3d_HCurve> & C,const opencascade::handle<Adaptor3d_HSurface> & S,const Standard_Real Tol);

		/****************** ProjLib_ComputeApproxOnPolarSurface ******************/
		%feature("compactdefaultargs") ProjLib_ComputeApproxOnPolarSurface;
		%feature("autodoc", "* Constructor, which performs projecting, using two initial curves 2d: InitCurve2d and InitCurve2dBis that are any rough approximations of result curves. This constructor is used to get two pcurves for seem edge. Parameter Tol is 3d tolerance of approximation.
	:param InitCurve2d:
	:type InitCurve2d: Adaptor2d_HCurve2d
	:param InitCurve2dBis:
	:type InitCurve2dBis: Adaptor2d_HCurve2d
	:param C:
	:type C: Adaptor3d_HCurve
	:param S:
	:type S: Adaptor3d_HSurface
	:param Tol:
	:type Tol: float
	:rtype: None") ProjLib_ComputeApproxOnPolarSurface;
		 ProjLib_ComputeApproxOnPolarSurface (const opencascade::handle<Adaptor2d_HCurve2d> & InitCurve2d,const opencascade::handle<Adaptor2d_HCurve2d> & InitCurve2dBis,const opencascade::handle<Adaptor3d_HCurve> & C,const opencascade::handle<Adaptor3d_HSurface> & S,const Standard_Real Tol);

		/****************** ProjectUsingInitialCurve2d ******************/
		%feature("compactdefaultargs") ProjectUsingInitialCurve2d;
		%feature("autodoc", "* Method, which performs projecting. Method is used in method Perform(...).
	:param Curve:
	:type Curve: Adaptor3d_HCurve
	:param S:
	:type S: Adaptor3d_HSurface
	:param InitCurve2d:
	:type InitCurve2d: Adaptor2d_HCurve2d
	:rtype: opencascade::handle<Geom2d_BSplineCurve>") ProjectUsingInitialCurve2d;
		opencascade::handle<Geom2d_BSplineCurve> ProjectUsingInitialCurve2d (const opencascade::handle<Adaptor3d_HCurve> & Curve,const opencascade::handle<Adaptor3d_HSurface> & S,const opencascade::handle<Adaptor2d_HCurve2d> & InitCurve2d);

		/****************** SetBndPnt ******************/
		%feature("compactdefaultargs") SetBndPnt;
		%feature("autodoc", "* Set the parameter, which defines type of boundary condition between segments during approximation. It can be AppParCurves_PassPoint or AppParCurves_TangencyPoint. Default value is AppParCurves_TangencyPoint.
	:param theBndPnt:
	:type theBndPnt: AppParCurves_Constraint
	:rtype: None") SetBndPnt;
		void SetBndPnt (const AppParCurves_Constraint theBndPnt);

		/****************** SetDegree ******************/
		%feature("compactdefaultargs") SetDegree;
		%feature("autodoc", "* Set min and max possible degree of result BSpline curve2d, which is got by approximation. If theDegMin/Max < 0, algorithm uses values min = 2, max = 8.
	:param theDegMin:
	:type theDegMin: int
	:param theDegMax:
	:type theDegMax: int
	:rtype: None") SetDegree;
		void SetDegree (const Standard_Integer theDegMin,const Standard_Integer theDegMax);

		/****************** SetMaxDist ******************/
		%feature("compactdefaultargs") SetMaxDist;
		%feature("autodoc", "* Set the parameter, which defines maximal possible distance between projected curve and surface. It is used only for projecting on not analytical surfaces. If theMaxDist < 0, algoritm uses default value 100.*Tolerance. If real distance between curve and surface more then theMaxDist, algorithm stops working.
	:param theMaxDist:
	:type theMaxDist: float
	:rtype: None") SetMaxDist;
		void SetMaxDist (const Standard_Real theMaxDist);

		/****************** SetMaxSegments ******************/
		%feature("compactdefaultargs") SetMaxSegments;
		%feature("autodoc", "* Set the parameter, which defines maximal value of parametric intervals the projected curve can be cut for approximation. If theMaxSegments < 0, algorithm uses default value = 1000.
	:param theMaxSegments:
	:type theMaxSegments: int
	:rtype: None") SetMaxSegments;
		void SetMaxSegments (const Standard_Integer theMaxSegments);

		/****************** SetTolerance ******************/
		%feature("compactdefaultargs") SetTolerance;
		%feature("autodoc", "* Set the tolerance used to project the curve on the surface. Default value is Precision::Approximation().
	:param theTolerance:
	:type theTolerance: float
	:rtype: None") SetTolerance;
		void SetTolerance (const Standard_Real theTolerance);

		/****************** Tolerance ******************/
		%feature("compactdefaultargs") Tolerance;
		%feature("autodoc", "* returns the reached Tolerance.
	:rtype: float") Tolerance;
		Standard_Real Tolerance ();

};


%extend ProjLib_ComputeApproxOnPolarSurface {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************************
* class ProjLib_HCompProjectedCurve *
************************************/
class ProjLib_HCompProjectedCurve : public Adaptor2d_HCurve2d {
	public:
		/****************** ChangeCurve2d ******************/
		%feature("compactdefaultargs") ChangeCurve2d;
		%feature("autodoc", "* Returns the curve used to create the GenHCurve.
	:rtype: ProjLib_CompProjectedCurve") ChangeCurve2d;
		ProjLib_CompProjectedCurve & ChangeCurve2d ();

		/****************** Curve2d ******************/
		%feature("compactdefaultargs") Curve2d;
		%feature("autodoc", "* Returns the curve used to create the GenHCurve2d. This is redefined from HCurve2d, cannot be inline.
	:rtype: Adaptor2d_Curve2d") Curve2d;
		const Adaptor2d_Curve2d & Curve2d ();

		/****************** ProjLib_HCompProjectedCurve ******************/
		%feature("compactdefaultargs") ProjLib_HCompProjectedCurve;
		%feature("autodoc", "* Creates an empty GenHCurve2d.
	:rtype: None") ProjLib_HCompProjectedCurve;
		 ProjLib_HCompProjectedCurve ();

		/****************** ProjLib_HCompProjectedCurve ******************/
		%feature("compactdefaultargs") ProjLib_HCompProjectedCurve;
		%feature("autodoc", "* Creates a GenHCurve2d from a Curve
	:param C:
	:type C: ProjLib_CompProjectedCurve
	:rtype: None") ProjLib_HCompProjectedCurve;
		 ProjLib_HCompProjectedCurve (const ProjLib_CompProjectedCurve & C);

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "* Sets the field of the GenHCurve2d.
	:param C:
	:type C: ProjLib_CompProjectedCurve
	:rtype: None") Set;
		void Set (const ProjLib_CompProjectedCurve & C);

};


%make_alias(ProjLib_HCompProjectedCurve)

%extend ProjLib_HCompProjectedCurve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************
* class ProjLib_HProjectedCurve *
********************************/
class ProjLib_HProjectedCurve : public Adaptor2d_HCurve2d {
	public:
		/****************** ChangeCurve2d ******************/
		%feature("compactdefaultargs") ChangeCurve2d;
		%feature("autodoc", "* Returns the curve used to create the GenHCurve.
	:rtype: ProjLib_ProjectedCurve") ChangeCurve2d;
		ProjLib_ProjectedCurve & ChangeCurve2d ();

		/****************** Curve2d ******************/
		%feature("compactdefaultargs") Curve2d;
		%feature("autodoc", "* Returns the curve used to create the GenHCurve2d. This is redefined from HCurve2d, cannot be inline.
	:rtype: Adaptor2d_Curve2d") Curve2d;
		const Adaptor2d_Curve2d & Curve2d ();

		/****************** ProjLib_HProjectedCurve ******************/
		%feature("compactdefaultargs") ProjLib_HProjectedCurve;
		%feature("autodoc", "* Creates an empty GenHCurve2d.
	:rtype: None") ProjLib_HProjectedCurve;
		 ProjLib_HProjectedCurve ();

		/****************** ProjLib_HProjectedCurve ******************/
		%feature("compactdefaultargs") ProjLib_HProjectedCurve;
		%feature("autodoc", "* Creates a GenHCurve2d from a Curve
	:param C:
	:type C: ProjLib_ProjectedCurve
	:rtype: None") ProjLib_HProjectedCurve;
		 ProjLib_HProjectedCurve (const ProjLib_ProjectedCurve & C);

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "* Sets the field of the GenHCurve2d.
	:param C:
	:type C: ProjLib_ProjectedCurve
	:rtype: None") Set;
		void Set (const ProjLib_ProjectedCurve & C);

};


%make_alias(ProjLib_HProjectedCurve)

%extend ProjLib_HProjectedCurve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************
* class ProjLib_PrjFunc *
************************/
class ProjLib_PrjFunc : public math_FunctionSetWithDerivatives {
	public:
		/****************** Derivatives ******************/
		%feature("compactdefaultargs") Derivatives;
		%feature("autodoc", "* returns the values <D> of the derivatives for the variable <X>. Returns True if the computation was done successfully, False otherwise.
	:param X:
	:type X: math_Vector
	:param D:
	:type D: math_Matrix
	:rtype: bool") Derivatives;
		Standard_Boolean Derivatives (const math_Vector & X,math_Matrix & D);

		/****************** NbEquations ******************/
		%feature("compactdefaultargs") NbEquations;
		%feature("autodoc", "* returns the number of equations of the function.
	:rtype: int") NbEquations;
		Standard_Integer NbEquations ();

		/****************** NbVariables ******************/
		%feature("compactdefaultargs") NbVariables;
		%feature("autodoc", "* returns the number of variables of the function.
	:rtype: int") NbVariables;
		Standard_Integer NbVariables ();

		/****************** ProjLib_PrjFunc ******************/
		%feature("compactdefaultargs") ProjLib_PrjFunc;
		%feature("autodoc", ":param C:
	:type C: Adaptor3d_CurvePtr
	:param FixVal:
	:type FixVal: float
	:param S:
	:type S: Adaptor3d_SurfacePtr
	:param Fix:
	:type Fix: int
	:rtype: None") ProjLib_PrjFunc;
		 ProjLib_PrjFunc (const Adaptor3d_CurvePtr & C,const Standard_Real FixVal,const Adaptor3d_SurfacePtr & S,const Standard_Integer Fix);

		/****************** Solution ******************/
		%feature("compactdefaultargs") Solution;
		%feature("autodoc", "* returns point on surface
	:rtype: gp_Pnt2d") Solution;
		gp_Pnt2d Solution ();

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "* computes the values <F> of the Functions for the variable <X>. Returns True if the computation was done successfully, False otherwise.
	:param X:
	:type X: math_Vector
	:param F:
	:type F: math_Vector
	:rtype: bool") Value;
		Standard_Boolean Value (const math_Vector & X,math_Vector & F);

		/****************** Values ******************/
		%feature("compactdefaultargs") Values;
		%feature("autodoc", "* returns the values <F> of the functions and the derivatives <D> for the variable <X>. Returns True if the computation was done successfully, False otherwise.
	:param X:
	:type X: math_Vector
	:param F:
	:type F: math_Vector
	:param D:
	:type D: math_Matrix
	:rtype: bool") Values;
		Standard_Boolean Values (const math_Vector & X,math_Vector & F,math_Matrix & D);

};


%extend ProjLib_PrjFunc {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************
* class ProjLib_PrjResolve *
***************************/
class ProjLib_PrjResolve {
	public:
		/****************** IsDone ******************/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "* Returns True if the distance is found.
	:rtype: bool") IsDone;
		Standard_Boolean IsDone ();

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "* Calculates the ort from C(t) to S with a close point. The close point is defined by the parameter values U0 and V0. The function F(u,v)=distance(S(u,v),C(t)) has an extremum when gradient(F)=0. The algorithm searchs a zero near the close point.
	:param t:
	:type t: float
	:param U:
	:type U: float
	:param V:
	:type V: float
	:param Tol:
	:type Tol: gp_Pnt2d
	:param Inf:
	:type Inf: gp_Pnt2d
	:param Sup:
	:type Sup: gp_Pnt2d
	:param FTol: default value is -1
	:type FTol: float
	:param StrictInside: default value is Standard_False
	:type StrictInside: bool
	:rtype: None") Perform;
		void Perform (const Standard_Real t,const Standard_Real U,const Standard_Real V,const gp_Pnt2d & Tol,const gp_Pnt2d & Inf,const gp_Pnt2d & Sup,const Standard_Real FTol = -1,const Standard_Boolean StrictInside = Standard_False);

		/****************** ProjLib_PrjResolve ******************/
		%feature("compactdefaultargs") ProjLib_PrjResolve;
		%feature("autodoc", ":param C:
	:type C: Adaptor3d_Curve
	:param S:
	:type S: Adaptor3d_Surface
	:param Fix:
	:type Fix: int
	:rtype: None") ProjLib_PrjResolve;
		 ProjLib_PrjResolve (const Adaptor3d_Curve & C,const Adaptor3d_Surface & S,const Standard_Integer Fix);

		/****************** Solution ******************/
		%feature("compactdefaultargs") Solution;
		%feature("autodoc", "* Returns the point of the extremum distance.
	:rtype: gp_Pnt2d") Solution;
		gp_Pnt2d Solution ();

};


%extend ProjLib_PrjResolve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************
* class ProjLib_ProjectOnPlane *
*******************************/
class ProjLib_ProjectOnPlane : public Adaptor3d_Curve {
	public:
		/****************** BSpline ******************/
		%feature("compactdefaultargs") BSpline;
		%feature("autodoc", "* Warning ! this will NOT make a copy of the BSpline Curve : If you want to modify the Curve please make a copy yourself Also it will NOT trim the surface to myFirst/Last.
	:rtype: opencascade::handle<Geom_BSplineCurve>") BSpline;
		opencascade::handle<Geom_BSplineCurve> BSpline ();

		/****************** Bezier ******************/
		%feature("compactdefaultargs") Bezier;
		%feature("autodoc", "* Warning ! this will NOT make a copy of the Bezier Curve : If you want to modify the Curve please make a copy yourself Also it will NOT trim the surface to myFirst/Last.
	:rtype: opencascade::handle<Geom_BezierCurve>") Bezier;
		opencascade::handle<Geom_BezierCurve> Bezier ();

		/****************** Circle ******************/
		%feature("compactdefaultargs") Circle;
		%feature("autodoc", ":rtype: gp_Circ") Circle;
		gp_Circ Circle ();

		/****************** Continuity ******************/
		%feature("compactdefaultargs") Continuity;
		%feature("autodoc", ":rtype: GeomAbs_Shape") Continuity;
		GeomAbs_Shape Continuity ();

		/****************** D0 ******************/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "* Computes the point of parameter U on the curve.
	:param U:
	:type U: float
	:param P:
	:type P: gp_Pnt
	:rtype: None") D0;
		void D0 (const Standard_Real U,gp_Pnt & P);

		/****************** D1 ******************/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "* Computes the point of parameter U on the curve with its first derivative. Raised if the continuity of the current interval is not C1.
	:param U:
	:type U: float
	:param P:
	:type P: gp_Pnt
	:param V:
	:type V: gp_Vec
	:rtype: None") D1;
		void D1 (const Standard_Real U,gp_Pnt & P,gp_Vec & V);

		/****************** D2 ******************/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "* Returns the point P of parameter U, the first and second derivatives V1 and V2. Raised if the continuity of the current interval is not C2.
	:param U:
	:type U: float
	:param P:
	:type P: gp_Pnt
	:param V1:
	:type V1: gp_Vec
	:param V2:
	:type V2: gp_Vec
	:rtype: None") D2;
		void D2 (const Standard_Real U,gp_Pnt & P,gp_Vec & V1,gp_Vec & V2);

		/****************** D3 ******************/
		%feature("compactdefaultargs") D3;
		%feature("autodoc", "* Returns the point P of parameter U, the first, the second and the third derivative. Raised if the continuity of the current interval is not C3.
	:param U:
	:type U: float
	:param P:
	:type P: gp_Pnt
	:param V1:
	:type V1: gp_Vec
	:param V2:
	:type V2: gp_Vec
	:param V3:
	:type V3: gp_Vec
	:rtype: None") D3;
		void D3 (const Standard_Real U,gp_Pnt & P,gp_Vec & V1,gp_Vec & V2,gp_Vec & V3);

		/****************** DN ******************/
		%feature("compactdefaultargs") DN;
		%feature("autodoc", "* The returned vector gives the value of the derivative for the order of derivation N. Raised if the continuity of the current interval is not CN. Raised if N < 1.
	:param U:
	:type U: float
	:param N:
	:type N: int
	:rtype: gp_Vec") DN;
		gp_Vec DN (const Standard_Real U,const Standard_Integer N);

		/****************** Degree ******************/
		%feature("compactdefaultargs") Degree;
		%feature("autodoc", ":rtype: int") Degree;
		Standard_Integer Degree ();

		/****************** Ellipse ******************/
		%feature("compactdefaultargs") Ellipse;
		%feature("autodoc", ":rtype: gp_Elips") Ellipse;
		gp_Elips Ellipse ();

		/****************** FirstParameter ******************/
		%feature("compactdefaultargs") FirstParameter;
		%feature("autodoc", ":rtype: float") FirstParameter;
		Standard_Real FirstParameter ();

		/****************** GetCurve ******************/
		%feature("compactdefaultargs") GetCurve;
		%feature("autodoc", ":rtype: opencascade::handle<Adaptor3d_HCurve>") GetCurve;
		const opencascade::handle<Adaptor3d_HCurve> & GetCurve ();

		/****************** GetDirection ******************/
		%feature("compactdefaultargs") GetDirection;
		%feature("autodoc", ":rtype: gp_Dir") GetDirection;
		const gp_Dir  GetDirection ();

		/****************** GetPlane ******************/
		%feature("compactdefaultargs") GetPlane;
		%feature("autodoc", ":rtype: gp_Ax3") GetPlane;
		const gp_Ax3  GetPlane ();

		/****************** GetResult ******************/
		%feature("compactdefaultargs") GetResult;
		%feature("autodoc", ":rtype: opencascade::handle<GeomAdaptor_HCurve>") GetResult;
		const opencascade::handle<GeomAdaptor_HCurve> & GetResult ();

		/****************** GetType ******************/
		%feature("compactdefaultargs") GetType;
		%feature("autodoc", "* Returns the type of the curve in the current interval : Line, Circle, Ellipse, Hyperbola, Parabola, BezierCurve, BSplineCurve, OtherCurve.
	:rtype: GeomAbs_CurveType") GetType;
		GeomAbs_CurveType GetType ();

		/****************** Hyperbola ******************/
		%feature("compactdefaultargs") Hyperbola;
		%feature("autodoc", ":rtype: gp_Hypr") Hyperbola;
		gp_Hypr Hyperbola ();

		/****************** Intervals ******************/
		%feature("compactdefaultargs") Intervals;
		%feature("autodoc", "* Stores in <T> the parameters bounding the intervals of continuity <S>. //! The array must provide enough room to accomodate for the parameters. i.e. T.Length() > NbIntervals()
	:param T:
	:type T: TColStd_Array1OfReal
	:param S:
	:type S: GeomAbs_Shape
	:rtype: None") Intervals;
		void Intervals (TColStd_Array1OfReal & T,const GeomAbs_Shape S);

		/****************** IsClosed ******************/
		%feature("compactdefaultargs") IsClosed;
		%feature("autodoc", ":rtype: bool") IsClosed;
		Standard_Boolean IsClosed ();

		/****************** IsPeriodic ******************/
		%feature("compactdefaultargs") IsPeriodic;
		%feature("autodoc", ":rtype: bool") IsPeriodic;
		Standard_Boolean IsPeriodic ();

		/****************** IsRational ******************/
		%feature("compactdefaultargs") IsRational;
		%feature("autodoc", ":rtype: bool") IsRational;
		Standard_Boolean IsRational ();

		/****************** LastParameter ******************/
		%feature("compactdefaultargs") LastParameter;
		%feature("autodoc", ":rtype: float") LastParameter;
		Standard_Real LastParameter ();

		/****************** Line ******************/
		%feature("compactdefaultargs") Line;
		%feature("autodoc", ":rtype: gp_Lin") Line;
		gp_Lin Line ();

		/****************** Load ******************/
		%feature("compactdefaultargs") Load;
		%feature("autodoc", "* Sets the Curve and perform the projection. if <KeepParametrization> is true, the parametrization of the Projected Curve <PC> will be the same as the parametrization of the initial curve <C>. It meens: proj(C(u)) = PC(u) for each u. Otherwize, the parametrization may change.
	:param C:
	:type C: Adaptor3d_HCurve
	:param Tolerance:
	:type Tolerance: float
	:param KeepParametrization: default value is Standard_True
	:type KeepParametrization: bool
	:rtype: None") Load;
		void Load (const opencascade::handle<Adaptor3d_HCurve> & C,const Standard_Real Tolerance,const Standard_Boolean KeepParametrization = Standard_True);

		/****************** NbIntervals ******************/
		%feature("compactdefaultargs") NbIntervals;
		%feature("autodoc", "* If necessary, breaks the curve in intervals of continuity <S>. And returns the number of intervals.
	:param S:
	:type S: GeomAbs_Shape
	:rtype: int") NbIntervals;
		Standard_Integer NbIntervals (const GeomAbs_Shape S);

		/****************** NbKnots ******************/
		%feature("compactdefaultargs") NbKnots;
		%feature("autodoc", ":rtype: int") NbKnots;
		Standard_Integer NbKnots ();

		/****************** NbPoles ******************/
		%feature("compactdefaultargs") NbPoles;
		%feature("autodoc", ":rtype: int") NbPoles;
		Standard_Integer NbPoles ();

		/****************** Parabola ******************/
		%feature("compactdefaultargs") Parabola;
		%feature("autodoc", ":rtype: gp_Parab") Parabola;
		gp_Parab Parabola ();

		/****************** Period ******************/
		%feature("compactdefaultargs") Period;
		%feature("autodoc", ":rtype: float") Period;
		Standard_Real Period ();

		/****************** ProjLib_ProjectOnPlane ******************/
		%feature("compactdefaultargs") ProjLib_ProjectOnPlane;
		%feature("autodoc", "* Empty constructor.
	:rtype: None") ProjLib_ProjectOnPlane;
		 ProjLib_ProjectOnPlane ();

		/****************** ProjLib_ProjectOnPlane ******************/
		%feature("compactdefaultargs") ProjLib_ProjectOnPlane;
		%feature("autodoc", "* The projection will be normal to the Plane defined by the Ax3 <Pl>.
	:param Pl:
	:type Pl: gp_Ax3
	:rtype: None") ProjLib_ProjectOnPlane;
		 ProjLib_ProjectOnPlane (const gp_Ax3 & Pl);

		/****************** ProjLib_ProjectOnPlane ******************/
		%feature("compactdefaultargs") ProjLib_ProjectOnPlane;
		%feature("autodoc", "* The projection will be along the direction <D> on the plane defined by the Ax3 <Pl>. raises if the direction <D> is parallel to the plane <Pl>.
	:param Pl:
	:type Pl: gp_Ax3
	:param D:
	:type D: gp_Dir
	:rtype: None") ProjLib_ProjectOnPlane;
		 ProjLib_ProjectOnPlane (const gp_Ax3 & Pl,const gp_Dir & D);

		/****************** Resolution ******************/
		%feature("compactdefaultargs") Resolution;
		%feature("autodoc", "* Returns the parametric resolution corresponding to the real space resolution <R3d>.
	:param R3d:
	:type R3d: float
	:rtype: float") Resolution;
		Standard_Real Resolution (const Standard_Real R3d);

		/****************** Trim ******************/
		%feature("compactdefaultargs") Trim;
		%feature("autodoc", "* Returns a curve equivalent of <self> between parameters <First> and <Last>. <Tol> is used to test for 3d points confusion. If <First> >= <Last>
	:param First:
	:type First: float
	:param Last:
	:type Last: float
	:param Tol:
	:type Tol: float
	:rtype: opencascade::handle<Adaptor3d_HCurve>") Trim;
		opencascade::handle<Adaptor3d_HCurve> Trim (const Standard_Real First,const Standard_Real Last,const Standard_Real Tol);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "* Computes the point of parameter U on the curve.
	:param U:
	:type U: float
	:rtype: gp_Pnt") Value;
		gp_Pnt Value (const Standard_Real U);

};


%extend ProjLib_ProjectOnPlane {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************
* class ProjLib_ProjectOnSurface *
*********************************/
class ProjLib_ProjectOnSurface {
	public:
		/****************** BSpline ******************/
		%feature("compactdefaultargs") BSpline;
		%feature("autodoc", ":rtype: opencascade::handle<Geom_BSplineCurve>") BSpline;
		opencascade::handle<Geom_BSplineCurve> BSpline ();

		/****************** IsDone ******************/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", ":rtype: bool") IsDone;
		Standard_Boolean IsDone ();

		/****************** ProjLib_ProjectOnSurface ******************/
		%feature("compactdefaultargs") ProjLib_ProjectOnSurface;
		%feature("autodoc", "* Create an empty projector.
	:rtype: None") ProjLib_ProjectOnSurface;
		 ProjLib_ProjectOnSurface ();

		/****************** ProjLib_ProjectOnSurface ******************/
		%feature("compactdefaultargs") ProjLib_ProjectOnSurface;
		%feature("autodoc", "* Create a projector normaly to the surface <S>.
	:param S:
	:type S: Adaptor3d_HSurface
	:rtype: None") ProjLib_ProjectOnSurface;
		 ProjLib_ProjectOnSurface (const opencascade::handle<Adaptor3d_HSurface> & S);

};


%extend ProjLib_ProjectOnSurface {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************
* class ProjLib_ProjectedCurve *
*******************************/
class ProjLib_ProjectedCurve : public Adaptor2d_Curve2d {
	public:
		/****************** BSpline ******************/
		%feature("compactdefaultargs") BSpline;
		%feature("autodoc", "* Warning ! This will NOT make a copy of the BSpline Curve - If you want to modify the Curve please make a copy yourself Also it will NOT trim the surface to myFirst/Last.
	:rtype: opencascade::handle<Geom2d_BSplineCurve>") BSpline;
		opencascade::handle<Geom2d_BSplineCurve> BSpline ();

		/****************** Bezier ******************/
		%feature("compactdefaultargs") Bezier;
		%feature("autodoc", "* Warning ! This will NOT make a copy of the -- Bezier Curve - If you want to modify -- the Curve please make a copy yourself -- Also it will NOT trim the surface to -- myFirst/Last.
	:rtype: opencascade::handle<Geom2d_BezierCurve>") Bezier;
		opencascade::handle<Geom2d_BezierCurve> Bezier ();

		/****************** Circle ******************/
		%feature("compactdefaultargs") Circle;
		%feature("autodoc", ":rtype: gp_Circ2d") Circle;
		gp_Circ2d Circle ();

		/****************** Continuity ******************/
		%feature("compactdefaultargs") Continuity;
		%feature("autodoc", ":rtype: GeomAbs_Shape") Continuity;
		GeomAbs_Shape Continuity ();

		/****************** D0 ******************/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "* Computes the point of parameter U on the curve.
	:param U:
	:type U: float
	:param P:
	:type P: gp_Pnt2d
	:rtype: None") D0;
		void D0 (const Standard_Real U,gp_Pnt2d & P);

		/****************** D1 ******************/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "* Computes the point of parameter U on the curve with its first derivative. Raised if the continuity of the current interval is not C1.
	:param U:
	:type U: float
	:param P:
	:type P: gp_Pnt2d
	:param V:
	:type V: gp_Vec2d
	:rtype: None") D1;
		void D1 (const Standard_Real U,gp_Pnt2d & P,gp_Vec2d & V);

		/****************** D2 ******************/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "* Returns the point P of parameter U, the first and second derivatives V1 and V2. Raised if the continuity of the current interval is not C2.
	:param U:
	:type U: float
	:param P:
	:type P: gp_Pnt2d
	:param V1:
	:type V1: gp_Vec2d
	:param V2:
	:type V2: gp_Vec2d
	:rtype: None") D2;
		void D2 (const Standard_Real U,gp_Pnt2d & P,gp_Vec2d & V1,gp_Vec2d & V2);

		/****************** D3 ******************/
		%feature("compactdefaultargs") D3;
		%feature("autodoc", "* Returns the point P of parameter U, the first, the second and the third derivative. Raised if the continuity of the current interval is not C3.
	:param U:
	:type U: float
	:param P:
	:type P: gp_Pnt2d
	:param V1:
	:type V1: gp_Vec2d
	:param V2:
	:type V2: gp_Vec2d
	:param V3:
	:type V3: gp_Vec2d
	:rtype: None") D3;
		void D3 (const Standard_Real U,gp_Pnt2d & P,gp_Vec2d & V1,gp_Vec2d & V2,gp_Vec2d & V3);

		/****************** DN ******************/
		%feature("compactdefaultargs") DN;
		%feature("autodoc", "* The returned vector gives the value of the derivative for the order of derivation N. Raised if the continuity of the current interval is not CN. Raised if N < 1.
	:param U:
	:type U: float
	:param N:
	:type N: int
	:rtype: gp_Vec2d") DN;
		gp_Vec2d DN (const Standard_Real U,const Standard_Integer N);

		/****************** Degree ******************/
		%feature("compactdefaultargs") Degree;
		%feature("autodoc", ":rtype: int") Degree;
		Standard_Integer Degree ();

		/****************** Ellipse ******************/
		%feature("compactdefaultargs") Ellipse;
		%feature("autodoc", ":rtype: gp_Elips2d") Ellipse;
		gp_Elips2d Ellipse ();

		/****************** FirstParameter ******************/
		%feature("compactdefaultargs") FirstParameter;
		%feature("autodoc", ":rtype: float") FirstParameter;
		Standard_Real FirstParameter ();

		/****************** GetCurve ******************/
		%feature("compactdefaultargs") GetCurve;
		%feature("autodoc", ":rtype: opencascade::handle<Adaptor3d_HCurve>") GetCurve;
		const opencascade::handle<Adaptor3d_HCurve> & GetCurve ();

		/****************** GetSurface ******************/
		%feature("compactdefaultargs") GetSurface;
		%feature("autodoc", ":rtype: opencascade::handle<Adaptor3d_HSurface>") GetSurface;
		const opencascade::handle<Adaptor3d_HSurface> & GetSurface ();

		/****************** GetTolerance ******************/
		%feature("compactdefaultargs") GetTolerance;
		%feature("autodoc", "* returns the tolerance reached if an approximation is Done.
	:rtype: float") GetTolerance;
		Standard_Real GetTolerance ();

		/****************** GetType ******************/
		%feature("compactdefaultargs") GetType;
		%feature("autodoc", "* Returns the type of the curve in the current interval : Line, Circle, Ellipse, Hyperbola, Parabola, BezierCurve, BSplineCurve, OtherCurve.
	:rtype: GeomAbs_CurveType") GetType;
		GeomAbs_CurveType GetType ();

		/****************** Hyperbola ******************/
		%feature("compactdefaultargs") Hyperbola;
		%feature("autodoc", ":rtype: gp_Hypr2d") Hyperbola;
		gp_Hypr2d Hyperbola ();

		/****************** Intervals ******************/
		%feature("compactdefaultargs") Intervals;
		%feature("autodoc", "* Stores in <T> the parameters bounding the intervals of continuity <S>. //! The array must provide enough room to accomodate for the parameters. i.e. T.Length() > NbIntervals()
	:param T:
	:type T: TColStd_Array1OfReal
	:param S:
	:type S: GeomAbs_Shape
	:rtype: None") Intervals;
		void Intervals (TColStd_Array1OfReal & T,const GeomAbs_Shape S);

		/****************** IsClosed ******************/
		%feature("compactdefaultargs") IsClosed;
		%feature("autodoc", ":rtype: bool") IsClosed;
		Standard_Boolean IsClosed ();

		/****************** IsPeriodic ******************/
		%feature("compactdefaultargs") IsPeriodic;
		%feature("autodoc", ":rtype: bool") IsPeriodic;
		Standard_Boolean IsPeriodic ();

		/****************** IsRational ******************/
		%feature("compactdefaultargs") IsRational;
		%feature("autodoc", ":rtype: bool") IsRational;
		Standard_Boolean IsRational ();

		/****************** LastParameter ******************/
		%feature("compactdefaultargs") LastParameter;
		%feature("autodoc", ":rtype: float") LastParameter;
		Standard_Real LastParameter ();

		/****************** Line ******************/
		%feature("compactdefaultargs") Line;
		%feature("autodoc", ":rtype: gp_Lin2d") Line;
		gp_Lin2d Line ();

		/****************** NbIntervals ******************/
		%feature("compactdefaultargs") NbIntervals;
		%feature("autodoc", "* If necessary, breaks the curve in intervals of continuity <S>. And returns the number of intervals.
	:param S:
	:type S: GeomAbs_Shape
	:rtype: int") NbIntervals;
		Standard_Integer NbIntervals (const GeomAbs_Shape S);

		/****************** NbKnots ******************/
		%feature("compactdefaultargs") NbKnots;
		%feature("autodoc", ":rtype: int") NbKnots;
		Standard_Integer NbKnots ();

		/****************** NbPoles ******************/
		%feature("compactdefaultargs") NbPoles;
		%feature("autodoc", ":rtype: int") NbPoles;
		Standard_Integer NbPoles ();

		/****************** Parabola ******************/
		%feature("compactdefaultargs") Parabola;
		%feature("autodoc", ":rtype: gp_Parab2d") Parabola;
		gp_Parab2d Parabola ();

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "* Performs projecting for given curve. If projecting uses approximation, approximation parameters can be set before by corresponding methods SetDegree(...), SetMaxSegmets(...), SetBndPnt(...), SetMaxDist(...)
	:param C:
	:type C: Adaptor3d_HCurve
	:rtype: None") Perform;
		void Perform (const opencascade::handle<Adaptor3d_HCurve> & C);

		/****************** Period ******************/
		%feature("compactdefaultargs") Period;
		%feature("autodoc", ":rtype: float") Period;
		Standard_Real Period ();

		/****************** ProjLib_ProjectedCurve ******************/
		%feature("compactdefaultargs") ProjLib_ProjectedCurve;
		%feature("autodoc", "* Empty constructor, it only sets some initial values for class fields.
	:rtype: None") ProjLib_ProjectedCurve;
		 ProjLib_ProjectedCurve ();

		/****************** ProjLib_ProjectedCurve ******************/
		%feature("compactdefaultargs") ProjLib_ProjectedCurve;
		%feature("autodoc", "* Constructor with initialisation field mySurface
	:param S:
	:type S: Adaptor3d_HSurface
	:rtype: None") ProjLib_ProjectedCurve;
		 ProjLib_ProjectedCurve (const opencascade::handle<Adaptor3d_HSurface> & S);

		/****************** ProjLib_ProjectedCurve ******************/
		%feature("compactdefaultargs") ProjLib_ProjectedCurve;
		%feature("autodoc", "* Constructor, which performs projecting. If projecting uses approximation, default parameters are used, in particular, 3d tolerance of approximation is Precision::Confusion()
	:param S:
	:type S: Adaptor3d_HSurface
	:param C:
	:type C: Adaptor3d_HCurve
	:rtype: None") ProjLib_ProjectedCurve;
		 ProjLib_ProjectedCurve (const opencascade::handle<Adaptor3d_HSurface> & S,const opencascade::handle<Adaptor3d_HCurve> & C);

		/****************** ProjLib_ProjectedCurve ******************/
		%feature("compactdefaultargs") ProjLib_ProjectedCurve;
		%feature("autodoc", "* Constructor, which performs projecting. If projecting uses approximation, 3d tolerance is Tol, default parameters are used,
	:param S:
	:type S: Adaptor3d_HSurface
	:param C:
	:type C: Adaptor3d_HCurve
	:param Tol:
	:type Tol: float
	:rtype: None") ProjLib_ProjectedCurve;
		 ProjLib_ProjectedCurve (const opencascade::handle<Adaptor3d_HSurface> & S,const opencascade::handle<Adaptor3d_HCurve> & C,const Standard_Real Tol);

		/****************** Resolution ******************/
		%feature("compactdefaultargs") Resolution;
		%feature("autodoc", "* Returns the parametric resolution corresponding to the real space resolution <R3d>.
	:param R3d:
	:type R3d: float
	:rtype: float") Resolution;
		Standard_Real Resolution (const Standard_Real R3d);

		/****************** SetBndPnt ******************/
		%feature("compactdefaultargs") SetBndPnt;
		%feature("autodoc", "* Set the parameter, which defines type of boundary condition between segments during approximation. It can be AppParCurves_PassPoint or AppParCurves_TangencyPoint. Default value is AppParCurves_TangencyPoint;
	:param theBndPnt:
	:type theBndPnt: AppParCurves_Constraint
	:rtype: None") SetBndPnt;
		void SetBndPnt (const AppParCurves_Constraint theBndPnt);

		/****************** SetDegree ******************/
		%feature("compactdefaultargs") SetDegree;
		%feature("autodoc", "* Set min and max possible degree of result BSpline curve2d, which is got by approximation. If theDegMin/Max < 0, algorithm uses values that are chosen depending of types curve 3d and surface.
	:param theDegMin:
	:type theDegMin: int
	:param theDegMax:
	:type theDegMax: int
	:rtype: None") SetDegree;
		void SetDegree (const Standard_Integer theDegMin,const Standard_Integer theDegMax);

		/****************** SetMaxDist ******************/
		%feature("compactdefaultargs") SetMaxDist;
		%feature("autodoc", "* Set the parameter, which degines maximal possible distance between projected curve and surface. It uses only for projecting on not analytical surfaces. If theMaxDist < 0, algoritm uses default value 100.*Tolerance. If real distance between curve and surface more then theMaxDist, algorithm stops working.
	:param theMaxDist:
	:type theMaxDist: float
	:rtype: None") SetMaxDist;
		void SetMaxDist (const Standard_Real theMaxDist);

		/****************** SetMaxSegments ******************/
		%feature("compactdefaultargs") SetMaxSegments;
		%feature("autodoc", "* Set the parameter, which defines maximal value of parametric intervals the projected curve can be cut for approximation. If theMaxSegments < 0, algorithm uses default value = 1000.
	:param theMaxSegments:
	:type theMaxSegments: int
	:rtype: None") SetMaxSegments;
		void SetMaxSegments (const Standard_Integer theMaxSegments);

		/****************** Trim ******************/
		%feature("compactdefaultargs") Trim;
		%feature("autodoc", "* Returns a curve equivalent of <self> between parameters <First> and <Last>. <Tol> is used to test for 3d points confusion. If <First> >= <Last>
	:param First:
	:type First: float
	:param Last:
	:type Last: float
	:param Tol:
	:type Tol: float
	:rtype: opencascade::handle<Adaptor2d_HCurve2d>") Trim;
		opencascade::handle<Adaptor2d_HCurve2d> Trim (const Standard_Real First,const Standard_Real Last,const Standard_Real Tol);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "* Computes the point of parameter U on the curve.
	:param U:
	:type U: float
	:rtype: gp_Pnt2d") Value;
		gp_Pnt2d Value (const Standard_Real U);

};


%extend ProjLib_ProjectedCurve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************
* class ProjLib_Projector *
**************************/
class ProjLib_Projector {
	public:
		/****************** BSpline ******************/
		%feature("compactdefaultargs") BSpline;
		%feature("autodoc", ":rtype: opencascade::handle<Geom2d_BSplineCurve>") BSpline;
		opencascade::handle<Geom2d_BSplineCurve> BSpline ();

		/****************** Bezier ******************/
		%feature("compactdefaultargs") Bezier;
		%feature("autodoc", ":rtype: opencascade::handle<Geom2d_BezierCurve>") Bezier;
		opencascade::handle<Geom2d_BezierCurve> Bezier ();

		/****************** Circle ******************/
		%feature("compactdefaultargs") Circle;
		%feature("autodoc", ":rtype: gp_Circ2d") Circle;
		const gp_Circ2d  Circle ();

		/****************** Done ******************/
		%feature("compactdefaultargs") Done;
		%feature("autodoc", "* Set isDone = Standard_True;
	:rtype: None") Done;
		void Done ();

		/****************** Ellipse ******************/
		%feature("compactdefaultargs") Ellipse;
		%feature("autodoc", ":rtype: gp_Elips2d") Ellipse;
		const gp_Elips2d  Ellipse ();

		/****************** GetType ******************/
		%feature("compactdefaultargs") GetType;
		%feature("autodoc", ":rtype: GeomAbs_CurveType") GetType;
		GeomAbs_CurveType GetType ();

		/****************** Hyperbola ******************/
		%feature("compactdefaultargs") Hyperbola;
		%feature("autodoc", ":rtype: gp_Hypr2d") Hyperbola;
		const gp_Hypr2d  Hyperbola ();

		/****************** IsDone ******************/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", ":rtype: bool") IsDone;
		Standard_Boolean IsDone ();

		/****************** IsPeriodic ******************/
		%feature("compactdefaultargs") IsPeriodic;
		%feature("autodoc", ":rtype: bool") IsPeriodic;
		Standard_Boolean IsPeriodic ();

		/****************** Line ******************/
		%feature("compactdefaultargs") Line;
		%feature("autodoc", ":rtype: gp_Lin2d") Line;
		const gp_Lin2d  Line ();

		/****************** Parabola ******************/
		%feature("compactdefaultargs") Parabola;
		%feature("autodoc", ":rtype: gp_Parab2d") Parabola;
		const gp_Parab2d  Parabola ();

		/****************** ProjLib_Projector ******************/
		%feature("compactdefaultargs") ProjLib_Projector;
		%feature("autodoc", "* Sets the type to OtherCurve
	:rtype: None") ProjLib_Projector;
		 ProjLib_Projector ();

		/****************** Project ******************/
		%feature("compactdefaultargs") Project;
		%feature("autodoc", ":param L:
	:type L: gp_Lin
	:rtype: void") Project;
		virtual void Project (const gp_Lin & L);

		/****************** Project ******************/
		%feature("compactdefaultargs") Project;
		%feature("autodoc", ":param C:
	:type C: gp_Circ
	:rtype: void") Project;
		virtual void Project (const gp_Circ & C);

		/****************** Project ******************/
		%feature("compactdefaultargs") Project;
		%feature("autodoc", ":param E:
	:type E: gp_Elips
	:rtype: void") Project;
		virtual void Project (const gp_Elips & E);

		/****************** Project ******************/
		%feature("compactdefaultargs") Project;
		%feature("autodoc", ":param P:
	:type P: gp_Parab
	:rtype: void") Project;
		virtual void Project (const gp_Parab & P);

		/****************** Project ******************/
		%feature("compactdefaultargs") Project;
		%feature("autodoc", ":param H:
	:type H: gp_Hypr
	:rtype: void") Project;
		virtual void Project (const gp_Hypr & H);

		/****************** SetBSpline ******************/
		%feature("compactdefaultargs") SetBSpline;
		%feature("autodoc", ":param C:
	:type C: Geom2d_BSplineCurve
	:rtype: None") SetBSpline;
		void SetBSpline (const opencascade::handle<Geom2d_BSplineCurve> & C);

		/****************** SetBezier ******************/
		%feature("compactdefaultargs") SetBezier;
		%feature("autodoc", ":param C:
	:type C: Geom2d_BezierCurve
	:rtype: None") SetBezier;
		void SetBezier (const opencascade::handle<Geom2d_BezierCurve> & C);

		/****************** SetPeriodic ******************/
		%feature("compactdefaultargs") SetPeriodic;
		%feature("autodoc", ":rtype: None") SetPeriodic;
		void SetPeriodic ();

		/****************** SetType ******************/
		%feature("compactdefaultargs") SetType;
		%feature("autodoc", ":param Type:
	:type Type: GeomAbs_CurveType
	:rtype: None") SetType;
		void SetType (const GeomAbs_CurveType Type);

		/****************** UFrame ******************/
		%feature("compactdefaultargs") UFrame;
		%feature("autodoc", "* Translates the 2d curve to set the part of the curve [CFirst, CLast] in the range [ UFirst, UFirst + Period [
	:param CFirst:
	:type CFirst: float
	:param CLast:
	:type CLast: float
	:param UFirst:
	:type UFirst: float
	:param Period:
	:type Period: float
	:rtype: None") UFrame;
		void UFrame (const Standard_Real CFirst,const Standard_Real CLast,const Standard_Real UFirst,const Standard_Real Period);

		/****************** VFrame ******************/
		%feature("compactdefaultargs") VFrame;
		%feature("autodoc", "* Translates the 2d curve to set the part of the curve [CFirst, CLast] in the range [ VFirst, VFirst + Period [
	:param CFirst:
	:type CFirst: float
	:param CLast:
	:type CLast: float
	:param VFirst:
	:type VFirst: float
	:param Period:
	:type Period: float
	:rtype: None") VFrame;
		void VFrame (const Standard_Real CFirst,const Standard_Real CLast,const Standard_Real VFirst,const Standard_Real Period);

};


%extend ProjLib_Projector {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************
* class ProjLib_Cone *
*********************/
class ProjLib_Cone : public ProjLib_Projector {
	public:
		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", ":param Co:
	:type Co: gp_Cone
	:rtype: None") Init;
		void Init (const gp_Cone & Co);

		/****************** ProjLib_Cone ******************/
		%feature("compactdefaultargs") ProjLib_Cone;
		%feature("autodoc", "* Undefined projection.
	:rtype: None") ProjLib_Cone;
		 ProjLib_Cone ();

		/****************** ProjLib_Cone ******************/
		%feature("compactdefaultargs") ProjLib_Cone;
		%feature("autodoc", "* Projection on the cone <Co>.
	:param Co:
	:type Co: gp_Cone
	:rtype: None") ProjLib_Cone;
		 ProjLib_Cone (const gp_Cone & Co);

		/****************** ProjLib_Cone ******************/
		%feature("compactdefaultargs") ProjLib_Cone;
		%feature("autodoc", "* Projection of the line <L> on the cone <Co>.
	:param Co:
	:type Co: gp_Cone
	:param L:
	:type L: gp_Lin
	:rtype: None") ProjLib_Cone;
		 ProjLib_Cone (const gp_Cone & Co,const gp_Lin & L);

		/****************** ProjLib_Cone ******************/
		%feature("compactdefaultargs") ProjLib_Cone;
		%feature("autodoc", "* Projection of the circle <C> on the cone <Co>.
	:param Co:
	:type Co: gp_Cone
	:param C:
	:type C: gp_Circ
	:rtype: None") ProjLib_Cone;
		 ProjLib_Cone (const gp_Cone & Co,const gp_Circ & C);

		/****************** Project ******************/
		%feature("compactdefaultargs") Project;
		%feature("autodoc", ":param L:
	:type L: gp_Lin
	:rtype: void") Project;
		virtual void Project (const gp_Lin & L);

		/****************** Project ******************/
		%feature("compactdefaultargs") Project;
		%feature("autodoc", ":param C:
	:type C: gp_Circ
	:rtype: void") Project;
		virtual void Project (const gp_Circ & C);

		/****************** Project ******************/
		%feature("compactdefaultargs") Project;
		%feature("autodoc", ":param E:
	:type E: gp_Elips
	:rtype: void") Project;
		virtual void Project (const gp_Elips & E);

		/****************** Project ******************/
		%feature("compactdefaultargs") Project;
		%feature("autodoc", ":param P:
	:type P: gp_Parab
	:rtype: void") Project;
		virtual void Project (const gp_Parab & P);

		/****************** Project ******************/
		%feature("compactdefaultargs") Project;
		%feature("autodoc", ":param H:
	:type H: gp_Hypr
	:rtype: void") Project;
		virtual void Project (const gp_Hypr & H);

};


%extend ProjLib_Cone {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************
* class ProjLib_Cylinder *
*************************/
class ProjLib_Cylinder : public ProjLib_Projector {
	public:
		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", ":param Cyl:
	:type Cyl: gp_Cylinder
	:rtype: None") Init;
		void Init (const gp_Cylinder & Cyl);

		/****************** ProjLib_Cylinder ******************/
		%feature("compactdefaultargs") ProjLib_Cylinder;
		%feature("autodoc", "* Undefined projection.
	:rtype: None") ProjLib_Cylinder;
		 ProjLib_Cylinder ();

		/****************** ProjLib_Cylinder ******************/
		%feature("compactdefaultargs") ProjLib_Cylinder;
		%feature("autodoc", "* Projection on the cylinder <Cyl>.
	:param Cyl:
	:type Cyl: gp_Cylinder
	:rtype: None") ProjLib_Cylinder;
		 ProjLib_Cylinder (const gp_Cylinder & Cyl);

		/****************** ProjLib_Cylinder ******************/
		%feature("compactdefaultargs") ProjLib_Cylinder;
		%feature("autodoc", "* Projection of the line <L> on the cylinder <Cyl>.
	:param Cyl:
	:type Cyl: gp_Cylinder
	:param L:
	:type L: gp_Lin
	:rtype: None") ProjLib_Cylinder;
		 ProjLib_Cylinder (const gp_Cylinder & Cyl,const gp_Lin & L);

		/****************** ProjLib_Cylinder ******************/
		%feature("compactdefaultargs") ProjLib_Cylinder;
		%feature("autodoc", "* Projection of the circle <C> on the cylinder <Cyl>.
	:param Cyl:
	:type Cyl: gp_Cylinder
	:param C:
	:type C: gp_Circ
	:rtype: None") ProjLib_Cylinder;
		 ProjLib_Cylinder (const gp_Cylinder & Cyl,const gp_Circ & C);

		/****************** ProjLib_Cylinder ******************/
		%feature("compactdefaultargs") ProjLib_Cylinder;
		%feature("autodoc", "* Projection of the ellipse <E> on the cylinder <Cyl>.
	:param Cyl:
	:type Cyl: gp_Cylinder
	:param E:
	:type E: gp_Elips
	:rtype: None") ProjLib_Cylinder;
		 ProjLib_Cylinder (const gp_Cylinder & Cyl,const gp_Elips & E);

		/****************** Project ******************/
		%feature("compactdefaultargs") Project;
		%feature("autodoc", ":param L:
	:type L: gp_Lin
	:rtype: void") Project;
		virtual void Project (const gp_Lin & L);

		/****************** Project ******************/
		%feature("compactdefaultargs") Project;
		%feature("autodoc", ":param C:
	:type C: gp_Circ
	:rtype: void") Project;
		virtual void Project (const gp_Circ & C);

		/****************** Project ******************/
		%feature("compactdefaultargs") Project;
		%feature("autodoc", ":param E:
	:type E: gp_Elips
	:rtype: void") Project;
		virtual void Project (const gp_Elips & E);

		/****************** Project ******************/
		%feature("compactdefaultargs") Project;
		%feature("autodoc", ":param P:
	:type P: gp_Parab
	:rtype: void") Project;
		virtual void Project (const gp_Parab & P);

		/****************** Project ******************/
		%feature("compactdefaultargs") Project;
		%feature("autodoc", ":param H:
	:type H: gp_Hypr
	:rtype: void") Project;
		virtual void Project (const gp_Hypr & H);

};


%extend ProjLib_Cylinder {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************
* class ProjLib_Plane *
**********************/
class ProjLib_Plane : public ProjLib_Projector {
	public:
		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", ":param Pl:
	:type Pl: gp_Pln
	:rtype: None") Init;
		void Init (const gp_Pln & Pl);

		/****************** ProjLib_Plane ******************/
		%feature("compactdefaultargs") ProjLib_Plane;
		%feature("autodoc", "* Undefined projection.
	:rtype: None") ProjLib_Plane;
		 ProjLib_Plane ();

		/****************** ProjLib_Plane ******************/
		%feature("compactdefaultargs") ProjLib_Plane;
		%feature("autodoc", "* Projection on the plane <Pl>.
	:param Pl:
	:type Pl: gp_Pln
	:rtype: None") ProjLib_Plane;
		 ProjLib_Plane (const gp_Pln & Pl);

		/****************** ProjLib_Plane ******************/
		%feature("compactdefaultargs") ProjLib_Plane;
		%feature("autodoc", "* Projection of the line <L> on the plane <Pl>.
	:param Pl:
	:type Pl: gp_Pln
	:param L:
	:type L: gp_Lin
	:rtype: None") ProjLib_Plane;
		 ProjLib_Plane (const gp_Pln & Pl,const gp_Lin & L);

		/****************** ProjLib_Plane ******************/
		%feature("compactdefaultargs") ProjLib_Plane;
		%feature("autodoc", "* Projection of the circle <C> on the plane <Pl>.
	:param Pl:
	:type Pl: gp_Pln
	:param C:
	:type C: gp_Circ
	:rtype: None") ProjLib_Plane;
		 ProjLib_Plane (const gp_Pln & Pl,const gp_Circ & C);

		/****************** ProjLib_Plane ******************/
		%feature("compactdefaultargs") ProjLib_Plane;
		%feature("autodoc", "* Projection of the ellipse <E> on the plane <Pl>.
	:param Pl:
	:type Pl: gp_Pln
	:param E:
	:type E: gp_Elips
	:rtype: None") ProjLib_Plane;
		 ProjLib_Plane (const gp_Pln & Pl,const gp_Elips & E);

		/****************** ProjLib_Plane ******************/
		%feature("compactdefaultargs") ProjLib_Plane;
		%feature("autodoc", "* Projection of the parabola <P> on the plane <Pl>.
	:param Pl:
	:type Pl: gp_Pln
	:param P:
	:type P: gp_Parab
	:rtype: None") ProjLib_Plane;
		 ProjLib_Plane (const gp_Pln & Pl,const gp_Parab & P);

		/****************** ProjLib_Plane ******************/
		%feature("compactdefaultargs") ProjLib_Plane;
		%feature("autodoc", "* Projection of the hyperbola <H> on the plane <Pl>.
	:param Pl:
	:type Pl: gp_Pln
	:param H:
	:type H: gp_Hypr
	:rtype: None") ProjLib_Plane;
		 ProjLib_Plane (const gp_Pln & Pl,const gp_Hypr & H);

		/****************** Project ******************/
		%feature("compactdefaultargs") Project;
		%feature("autodoc", ":param L:
	:type L: gp_Lin
	:rtype: void") Project;
		virtual void Project (const gp_Lin & L);

		/****************** Project ******************/
		%feature("compactdefaultargs") Project;
		%feature("autodoc", ":param C:
	:type C: gp_Circ
	:rtype: void") Project;
		virtual void Project (const gp_Circ & C);

		/****************** Project ******************/
		%feature("compactdefaultargs") Project;
		%feature("autodoc", ":param E:
	:type E: gp_Elips
	:rtype: void") Project;
		virtual void Project (const gp_Elips & E);

		/****************** Project ******************/
		%feature("compactdefaultargs") Project;
		%feature("autodoc", ":param P:
	:type P: gp_Parab
	:rtype: void") Project;
		virtual void Project (const gp_Parab & P);

		/****************** Project ******************/
		%feature("compactdefaultargs") Project;
		%feature("autodoc", ":param H:
	:type H: gp_Hypr
	:rtype: void") Project;
		virtual void Project (const gp_Hypr & H);

};


%extend ProjLib_Plane {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************
* class ProjLib_Sphere *
***********************/
class ProjLib_Sphere : public ProjLib_Projector {
	public:
		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", ":param Sp:
	:type Sp: gp_Sphere
	:rtype: None") Init;
		void Init (const gp_Sphere & Sp);

		/****************** ProjLib_Sphere ******************/
		%feature("compactdefaultargs") ProjLib_Sphere;
		%feature("autodoc", "* Undefined projection.
	:rtype: None") ProjLib_Sphere;
		 ProjLib_Sphere ();

		/****************** ProjLib_Sphere ******************/
		%feature("compactdefaultargs") ProjLib_Sphere;
		%feature("autodoc", "* Projection on the sphere <Sp>.
	:param Sp:
	:type Sp: gp_Sphere
	:rtype: None") ProjLib_Sphere;
		 ProjLib_Sphere (const gp_Sphere & Sp);

		/****************** ProjLib_Sphere ******************/
		%feature("compactdefaultargs") ProjLib_Sphere;
		%feature("autodoc", "* Projection of the circle <C> on the sphere <Sp>.
	:param Sp:
	:type Sp: gp_Sphere
	:param C:
	:type C: gp_Circ
	:rtype: None") ProjLib_Sphere;
		 ProjLib_Sphere (const gp_Sphere & Sp,const gp_Circ & C);

		/****************** Project ******************/
		%feature("compactdefaultargs") Project;
		%feature("autodoc", ":param L:
	:type L: gp_Lin
	:rtype: void") Project;
		virtual void Project (const gp_Lin & L);

		/****************** Project ******************/
		%feature("compactdefaultargs") Project;
		%feature("autodoc", ":param C:
	:type C: gp_Circ
	:rtype: void") Project;
		virtual void Project (const gp_Circ & C);

		/****************** Project ******************/
		%feature("compactdefaultargs") Project;
		%feature("autodoc", ":param E:
	:type E: gp_Elips
	:rtype: void") Project;
		virtual void Project (const gp_Elips & E);

		/****************** Project ******************/
		%feature("compactdefaultargs") Project;
		%feature("autodoc", ":param P:
	:type P: gp_Parab
	:rtype: void") Project;
		virtual void Project (const gp_Parab & P);

		/****************** Project ******************/
		%feature("compactdefaultargs") Project;
		%feature("autodoc", ":param H:
	:type H: gp_Hypr
	:rtype: void") Project;
		virtual void Project (const gp_Hypr & H);

		/****************** SetInBounds ******************/
		%feature("compactdefaultargs") SetInBounds;
		%feature("autodoc", "* Set the point of parameter U on C in the natural restrictions of the sphere.
	:param U:
	:type U: float
	:rtype: None") SetInBounds;
		void SetInBounds (const Standard_Real U);

};


%extend ProjLib_Sphere {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************
* class ProjLib_Torus *
**********************/
class ProjLib_Torus : public ProjLib_Projector {
	public:
		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", ":param To:
	:type To: gp_Torus
	:rtype: None") Init;
		void Init (const gp_Torus & To);

		/****************** ProjLib_Torus ******************/
		%feature("compactdefaultargs") ProjLib_Torus;
		%feature("autodoc", "* Undefined projection.
	:rtype: None") ProjLib_Torus;
		 ProjLib_Torus ();

		/****************** ProjLib_Torus ******************/
		%feature("compactdefaultargs") ProjLib_Torus;
		%feature("autodoc", "* Projection on the torus <To>.
	:param To:
	:type To: gp_Torus
	:rtype: None") ProjLib_Torus;
		 ProjLib_Torus (const gp_Torus & To);

		/****************** ProjLib_Torus ******************/
		%feature("compactdefaultargs") ProjLib_Torus;
		%feature("autodoc", "* Projection of the circle <C> on the torus <To>.
	:param To:
	:type To: gp_Torus
	:param C:
	:type C: gp_Circ
	:rtype: None") ProjLib_Torus;
		 ProjLib_Torus (const gp_Torus & To,const gp_Circ & C);

		/****************** Project ******************/
		%feature("compactdefaultargs") Project;
		%feature("autodoc", ":param L:
	:type L: gp_Lin
	:rtype: void") Project;
		virtual void Project (const gp_Lin & L);

		/****************** Project ******************/
		%feature("compactdefaultargs") Project;
		%feature("autodoc", ":param C:
	:type C: gp_Circ
	:rtype: void") Project;
		virtual void Project (const gp_Circ & C);

		/****************** Project ******************/
		%feature("compactdefaultargs") Project;
		%feature("autodoc", ":param E:
	:type E: gp_Elips
	:rtype: void") Project;
		virtual void Project (const gp_Elips & E);

		/****************** Project ******************/
		%feature("compactdefaultargs") Project;
		%feature("autodoc", ":param P:
	:type P: gp_Parab
	:rtype: void") Project;
		virtual void Project (const gp_Parab & P);

		/****************** Project ******************/
		%feature("compactdefaultargs") Project;
		%feature("autodoc", ":param H:
	:type H: gp_Hypr
	:rtype: void") Project;
		virtual void Project (const gp_Hypr & H);

};


%extend ProjLib_Torus {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* harray1 classes */
/* harray2 classes */
/* hsequence classes */
class ProjLib_HSequenceOfHSequenceOfPnt : public  ProjLib_SequenceOfHSequenceOfPnt, public Standard_Transient {
  public:
    ProjLib_HSequenceOfHSequenceOfPnt();
    ProjLib_HSequenceOfHSequenceOfPnt(const  ProjLib_SequenceOfHSequenceOfPnt& theOther);
    const  ProjLib_SequenceOfHSequenceOfPnt& Sequence();
    void Append (const  ProjLib_SequenceOfHSequenceOfPnt::value_type& theItem);
    void Append ( ProjLib_SequenceOfHSequenceOfPnt& theSequence);
     ProjLib_SequenceOfHSequenceOfPnt& ChangeSequence();
};
%make_alias(ProjLib_HSequenceOfHSequenceOfPnt)


