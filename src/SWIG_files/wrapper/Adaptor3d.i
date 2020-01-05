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
%define ADAPTOR3DDOCSTRING
"Adaptor3d module, see official documentation at
https://www.opencascade.com/doc/occt-7.4.0/refman/html/package_adaptor3d.html"
%enddef
%module (package="OCC.Core", docstring=ADAPTOR3DDOCSTRING) Adaptor3d


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
#include<Adaptor2d_HCurve2d.hxx>
#include<Adaptor3d_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<Geom_module.hxx>
#include<gp_module.hxx>
#include<GeomAbs_module.hxx>
#include<TColStd_module.hxx>
#include<TopAbs_module.hxx>
#include<Adaptor2d_module.hxx>
#include<math_module.hxx>
#include<Geom2d_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import Geom.i
%import gp.i
%import GeomAbs.i
%import TColStd.i
%import TopAbs.i
%import Adaptor2d.i
%import math.i
/* public enums */
/* end public enums declaration */

/* handles */
%wrap_handle(Adaptor3d_HCurve)
%wrap_handle(Adaptor3d_HSurface)
%wrap_handle(Adaptor3d_HVertex)
%wrap_handle(Adaptor3d_TopolTool)
%wrap_handle(Adaptor3d_HCurveOnSurface)
%wrap_handle(Adaptor3d_HIsoCurve)
/* end handles declaration */

/* templates */
/* end templates declaration */

/* typedefs */
typedef Adaptor3d_Curve * Adaptor3d_CurvePtr;
typedef Adaptor3d_Surface * Adaptor3d_SurfacePtr;
typedef Adaptor3d_CurveOnSurface * Adaptor3d_CurveOnSurfacePtr;
/* end typedefs declaration */

/************************
* class Adaptor3d_Curve *
************************/
class Adaptor3d_Curve {
	public:
		/****************** BSpline ******************/
		%feature("compactdefaultargs") BSpline;
		%feature("autodoc", ":rtype: opencascade::handle<Geom_BSplineCurve>") BSpline;
		virtual opencascade::handle<Geom_BSplineCurve> BSpline ();

		/****************** Bezier ******************/
		%feature("compactdefaultargs") Bezier;
		%feature("autodoc", ":rtype: opencascade::handle<Geom_BezierCurve>") Bezier;
		virtual opencascade::handle<Geom_BezierCurve> Bezier ();

		/****************** Circle ******************/
		%feature("compactdefaultargs") Circle;
		%feature("autodoc", ":rtype: gp_Circ") Circle;
		virtual gp_Circ Circle ();

		/****************** Continuity ******************/
		%feature("compactdefaultargs") Continuity;
		%feature("autodoc", ":rtype: GeomAbs_Shape") Continuity;
		virtual GeomAbs_Shape Continuity ();

		/****************** D0 ******************/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "* Computes the point of parameter U on the curve.
	:param U:
	:type U: float
	:param P:
	:type P: gp_Pnt
	:rtype: void") D0;
		virtual void D0 (const Standard_Real U,gp_Pnt & P);

		/****************** D1 ******************/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "* Computes the point of parameter U on the curve with its first derivative. Raised if the continuity of the current interval is not C1.
	:param U:
	:type U: float
	:param P:
	:type P: gp_Pnt
	:param V:
	:type V: gp_Vec
	:rtype: void") D1;
		virtual void D1 (const Standard_Real U,gp_Pnt & P,gp_Vec & V);

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
	:rtype: void") D2;
		virtual void D2 (const Standard_Real U,gp_Pnt & P,gp_Vec & V1,gp_Vec & V2);

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
	:rtype: void") D3;
		virtual void D3 (const Standard_Real U,gp_Pnt & P,gp_Vec & V1,gp_Vec & V2,gp_Vec & V3);

		/****************** DN ******************/
		%feature("compactdefaultargs") DN;
		%feature("autodoc", "* The returned vector gives the value of the derivative for the order of derivation N. Raised if the continuity of the current interval is not CN. Raised if N < 1.
	:param U:
	:type U: float
	:param N:
	:type N: int
	:rtype: gp_Vec") DN;
		virtual gp_Vec DN (const Standard_Real U,const Standard_Integer N);

		/****************** Degree ******************/
		%feature("compactdefaultargs") Degree;
		%feature("autodoc", ":rtype: int") Degree;
		virtual Standard_Integer Degree ();

		/****************** Ellipse ******************/
		%feature("compactdefaultargs") Ellipse;
		%feature("autodoc", ":rtype: gp_Elips") Ellipse;
		virtual gp_Elips Ellipse ();

		/****************** FirstParameter ******************/
		%feature("compactdefaultargs") FirstParameter;
		%feature("autodoc", ":rtype: float") FirstParameter;
		virtual Standard_Real FirstParameter ();

		/****************** GetType ******************/
		%feature("compactdefaultargs") GetType;
		%feature("autodoc", "* Returns the type of the curve in the current interval : Line, Circle, Ellipse, Hyperbola, Parabola, BezierCurve, BSplineCurve, OtherCurve.
	:rtype: GeomAbs_CurveType") GetType;
		virtual GeomAbs_CurveType GetType ();

		/****************** Hyperbola ******************/
		%feature("compactdefaultargs") Hyperbola;
		%feature("autodoc", ":rtype: gp_Hypr") Hyperbola;
		virtual gp_Hypr Hyperbola ();

		/****************** Intervals ******************/
		%feature("compactdefaultargs") Intervals;
		%feature("autodoc", "* Stores in <T> the parameters bounding the intervals of continuity <S>. //! The array must provide enough room to accomodate for the parameters. i.e. T.Length() > NbIntervals()
	:param T:
	:type T: TColStd_Array1OfReal
	:param S:
	:type S: GeomAbs_Shape
	:rtype: void") Intervals;
		virtual void Intervals (TColStd_Array1OfReal & T,const GeomAbs_Shape S);

		/****************** IsClosed ******************/
		%feature("compactdefaultargs") IsClosed;
		%feature("autodoc", ":rtype: bool") IsClosed;
		virtual Standard_Boolean IsClosed ();

		/****************** IsPeriodic ******************/
		%feature("compactdefaultargs") IsPeriodic;
		%feature("autodoc", ":rtype: bool") IsPeriodic;
		virtual Standard_Boolean IsPeriodic ();

		/****************** IsRational ******************/
		%feature("compactdefaultargs") IsRational;
		%feature("autodoc", ":rtype: bool") IsRational;
		virtual Standard_Boolean IsRational ();

		/****************** LastParameter ******************/
		%feature("compactdefaultargs") LastParameter;
		%feature("autodoc", ":rtype: float") LastParameter;
		virtual Standard_Real LastParameter ();

		/****************** Line ******************/
		%feature("compactdefaultargs") Line;
		%feature("autodoc", ":rtype: gp_Lin") Line;
		virtual gp_Lin Line ();

		/****************** NbIntervals ******************/
		%feature("compactdefaultargs") NbIntervals;
		%feature("autodoc", "* Returns the number of intervals for continuity <S>. May be one if Continuity(me) >= <S>
	:param S:
	:type S: GeomAbs_Shape
	:rtype: int") NbIntervals;
		virtual Standard_Integer NbIntervals (const GeomAbs_Shape S);

		/****************** NbKnots ******************/
		%feature("compactdefaultargs") NbKnots;
		%feature("autodoc", ":rtype: int") NbKnots;
		virtual Standard_Integer NbKnots ();

		/****************** NbPoles ******************/
		%feature("compactdefaultargs") NbPoles;
		%feature("autodoc", ":rtype: int") NbPoles;
		virtual Standard_Integer NbPoles ();

		/****************** OffsetCurve ******************/
		%feature("compactdefaultargs") OffsetCurve;
		%feature("autodoc", ":rtype: opencascade::handle<Geom_OffsetCurve>") OffsetCurve;
		virtual opencascade::handle<Geom_OffsetCurve> OffsetCurve ();

		/****************** Parabola ******************/
		%feature("compactdefaultargs") Parabola;
		%feature("autodoc", ":rtype: gp_Parab") Parabola;
		virtual gp_Parab Parabola ();

		/****************** Period ******************/
		%feature("compactdefaultargs") Period;
		%feature("autodoc", ":rtype: float") Period;
		virtual Standard_Real Period ();

		/****************** Resolution ******************/
		%feature("compactdefaultargs") Resolution;
		%feature("autodoc", "* Returns the parametric resolution corresponding to the real space resolution <R3d>.
	:param R3d:
	:type R3d: float
	:rtype: float") Resolution;
		virtual Standard_Real Resolution (const Standard_Real R3d);

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
		virtual opencascade::handle<Adaptor3d_HCurve> Trim (const Standard_Real First,const Standard_Real Last,const Standard_Real Tol);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "* Computes the point of parameter U on the curve.
	:param U:
	:type U: float
	:rtype: gp_Pnt") Value;
		virtual gp_Pnt Value (const Standard_Real U);

};


%extend Adaptor3d_Curve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************
* class Adaptor3d_HCurve *
*************************/
%nodefaultctor Adaptor3d_HCurve;
class Adaptor3d_HCurve : public Standard_Transient {
	public:
		/****************** BSpline ******************/
		%feature("compactdefaultargs") BSpline;
		%feature("autodoc", ":rtype: opencascade::handle<Geom_BSplineCurve>") BSpline;
		opencascade::handle<Geom_BSplineCurve> BSpline ();

		/****************** Bezier ******************/
		%feature("compactdefaultargs") Bezier;
		%feature("autodoc", ":rtype: opencascade::handle<Geom_BezierCurve>") Bezier;
		opencascade::handle<Geom_BezierCurve> Bezier ();

		/****************** Circle ******************/
		%feature("compactdefaultargs") Circle;
		%feature("autodoc", ":rtype: gp_Circ") Circle;
		gp_Circ Circle ();

		/****************** Continuity ******************/
		%feature("compactdefaultargs") Continuity;
		%feature("autodoc", ":rtype: GeomAbs_Shape") Continuity;
		GeomAbs_Shape Continuity ();

		/****************** Curve ******************/
		%feature("compactdefaultargs") Curve;
		%feature("autodoc", "* Returns a pointer to the Curve inside the HCurve.
	:rtype: Adaptor3d_Curve") Curve;
		virtual const Adaptor3d_Curve & Curve ();

		/****************** D0 ******************/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", ":param U:
	:type U: float
	:param P:
	:type P: gp_Pnt
	:rtype: None") D0;
		void D0 (const Standard_Real U,gp_Pnt & P);

		/****************** D1 ******************/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", ":param U:
	:type U: float
	:param P:
	:type P: gp_Pnt
	:param V:
	:type V: gp_Vec
	:rtype: None") D1;
		void D1 (const Standard_Real U,gp_Pnt & P,gp_Vec & V);

		/****************** D2 ******************/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", ":param U:
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
		%feature("autodoc", ":param U:
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
		%feature("autodoc", ":param U:
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
		%feature("autodoc", "* Returns a pointer to the Curve inside the HCurve.
	:rtype: Adaptor3d_Curve") GetCurve;
		virtual Adaptor3d_Curve & GetCurve ();

		/****************** GetType ******************/
		%feature("compactdefaultargs") GetType;
		%feature("autodoc", ":rtype: GeomAbs_CurveType") GetType;
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

		/****************** NbIntervals ******************/
		%feature("compactdefaultargs") NbIntervals;
		%feature("autodoc", ":param S:
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

		/****************** OffsetCurve ******************/
		%feature("compactdefaultargs") OffsetCurve;
		%feature("autodoc", ":rtype: opencascade::handle<Geom_OffsetCurve>") OffsetCurve;
		opencascade::handle<Geom_OffsetCurve> OffsetCurve ();

		/****************** Parabola ******************/
		%feature("compactdefaultargs") Parabola;
		%feature("autodoc", ":rtype: gp_Parab") Parabola;
		gp_Parab Parabola ();

		/****************** Period ******************/
		%feature("compactdefaultargs") Period;
		%feature("autodoc", ":rtype: float") Period;
		Standard_Real Period ();

		/****************** Resolution ******************/
		%feature("compactdefaultargs") Resolution;
		%feature("autodoc", ":param R3d:
	:type R3d: float
	:rtype: float") Resolution;
		Standard_Real Resolution (const Standard_Real R3d);

		/****************** Trim ******************/
		%feature("compactdefaultargs") Trim;
		%feature("autodoc", "* Returns a curve equivalent of <self> between parameters <First> and <Last>. <Tol> is used to test for 3d points confusion. //! If <First> >= <Last>
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
		%feature("autodoc", ":param U:
	:type U: float
	:rtype: gp_Pnt") Value;
		gp_Pnt Value (const Standard_Real U);

};


%make_alias(Adaptor3d_HCurve)

%extend Adaptor3d_HCurve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************
* class Adaptor3d_HSurface *
***************************/
%nodefaultctor Adaptor3d_HSurface;
class Adaptor3d_HSurface : public Standard_Transient {
	public:
		/****************** AxeOfRevolution ******************/
		%feature("compactdefaultargs") AxeOfRevolution;
		%feature("autodoc", ":rtype: gp_Ax1") AxeOfRevolution;
		gp_Ax1 AxeOfRevolution ();

		/****************** BSpline ******************/
		%feature("compactdefaultargs") BSpline;
		%feature("autodoc", ":rtype: opencascade::handle<Geom_BSplineSurface>") BSpline;
		opencascade::handle<Geom_BSplineSurface> BSpline ();

		/****************** BasisCurve ******************/
		%feature("compactdefaultargs") BasisCurve;
		%feature("autodoc", ":rtype: opencascade::handle<Adaptor3d_HCurve>") BasisCurve;
		opencascade::handle<Adaptor3d_HCurve> BasisCurve ();

		/****************** BasisSurface ******************/
		%feature("compactdefaultargs") BasisSurface;
		%feature("autodoc", ":rtype: opencascade::handle<Adaptor3d_HSurface>") BasisSurface;
		opencascade::handle<Adaptor3d_HSurface> BasisSurface ();

		/****************** Bezier ******************/
		%feature("compactdefaultargs") Bezier;
		%feature("autodoc", ":rtype: opencascade::handle<Geom_BezierSurface>") Bezier;
		opencascade::handle<Geom_BezierSurface> Bezier ();

		/****************** Cone ******************/
		%feature("compactdefaultargs") Cone;
		%feature("autodoc", ":rtype: gp_Cone") Cone;
		gp_Cone Cone ();

		/****************** Cylinder ******************/
		%feature("compactdefaultargs") Cylinder;
		%feature("autodoc", ":rtype: gp_Cylinder") Cylinder;
		gp_Cylinder Cylinder ();

		/****************** D0 ******************/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", ":param U:
	:type U: float
	:param V:
	:type V: float
	:param P:
	:type P: gp_Pnt
	:rtype: None") D0;
		void D0 (const Standard_Real U,const Standard_Real V,gp_Pnt & P);

		/****************** D1 ******************/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", ":param U:
	:type U: float
	:param V:
	:type V: float
	:param P:
	:type P: gp_Pnt
	:param D1U:
	:type D1U: gp_Vec
	:param D1V:
	:type D1V: gp_Vec
	:rtype: None") D1;
		void D1 (const Standard_Real U,const Standard_Real V,gp_Pnt & P,gp_Vec & D1U,gp_Vec & D1V);

		/****************** D2 ******************/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", ":param U:
	:type U: float
	:param V:
	:type V: float
	:param P:
	:type P: gp_Pnt
	:param D1U:
	:type D1U: gp_Vec
	:param D1V:
	:type D1V: gp_Vec
	:param D2U:
	:type D2U: gp_Vec
	:param D2V:
	:type D2V: gp_Vec
	:param D2UV:
	:type D2UV: gp_Vec
	:rtype: None") D2;
		void D2 (const Standard_Real U,const Standard_Real V,gp_Pnt & P,gp_Vec & D1U,gp_Vec & D1V,gp_Vec & D2U,gp_Vec & D2V,gp_Vec & D2UV);

		/****************** D3 ******************/
		%feature("compactdefaultargs") D3;
		%feature("autodoc", ":param U:
	:type U: float
	:param V:
	:type V: float
	:param P:
	:type P: gp_Pnt
	:param D1U:
	:type D1U: gp_Vec
	:param D1V:
	:type D1V: gp_Vec
	:param D2U:
	:type D2U: gp_Vec
	:param D2V:
	:type D2V: gp_Vec
	:param D2UV:
	:type D2UV: gp_Vec
	:param D3U:
	:type D3U: gp_Vec
	:param D3V:
	:type D3V: gp_Vec
	:param D3UUV:
	:type D3UUV: gp_Vec
	:param D3UVV:
	:type D3UVV: gp_Vec
	:rtype: None") D3;
		void D3 (const Standard_Real U,const Standard_Real V,gp_Pnt & P,gp_Vec & D1U,gp_Vec & D1V,gp_Vec & D2U,gp_Vec & D2V,gp_Vec & D2UV,gp_Vec & D3U,gp_Vec & D3V,gp_Vec & D3UUV,gp_Vec & D3UVV);

		/****************** DN ******************/
		%feature("compactdefaultargs") DN;
		%feature("autodoc", ":param U:
	:type U: float
	:param V:
	:type V: float
	:param Nu:
	:type Nu: int
	:param Nv:
	:type Nv: int
	:rtype: gp_Vec") DN;
		gp_Vec DN (const Standard_Real U,const Standard_Real V,const Standard_Integer Nu,const Standard_Integer Nv);

		/****************** Direction ******************/
		%feature("compactdefaultargs") Direction;
		%feature("autodoc", ":rtype: gp_Dir") Direction;
		gp_Dir Direction ();

		/****************** FirstUParameter ******************/
		%feature("compactdefaultargs") FirstUParameter;
		%feature("autodoc", ":rtype: float") FirstUParameter;
		Standard_Real FirstUParameter ();

		/****************** FirstVParameter ******************/
		%feature("compactdefaultargs") FirstVParameter;
		%feature("autodoc", ":rtype: float") FirstVParameter;
		Standard_Real FirstVParameter ();

		/****************** GetType ******************/
		%feature("compactdefaultargs") GetType;
		%feature("autodoc", ":rtype: GeomAbs_SurfaceType") GetType;
		GeomAbs_SurfaceType GetType ();

		/****************** IsUClosed ******************/
		%feature("compactdefaultargs") IsUClosed;
		%feature("autodoc", ":rtype: bool") IsUClosed;
		Standard_Boolean IsUClosed ();

		/****************** IsUPeriodic ******************/
		%feature("compactdefaultargs") IsUPeriodic;
		%feature("autodoc", ":rtype: bool") IsUPeriodic;
		Standard_Boolean IsUPeriodic ();

		/****************** IsURational ******************/
		%feature("compactdefaultargs") IsURational;
		%feature("autodoc", ":rtype: bool") IsURational;
		Standard_Boolean IsURational ();

		/****************** IsVClosed ******************/
		%feature("compactdefaultargs") IsVClosed;
		%feature("autodoc", ":rtype: bool") IsVClosed;
		Standard_Boolean IsVClosed ();

		/****************** IsVPeriodic ******************/
		%feature("compactdefaultargs") IsVPeriodic;
		%feature("autodoc", ":rtype: bool") IsVPeriodic;
		Standard_Boolean IsVPeriodic ();

		/****************** IsVRational ******************/
		%feature("compactdefaultargs") IsVRational;
		%feature("autodoc", ":rtype: bool") IsVRational;
		Standard_Boolean IsVRational ();

		/****************** LastUParameter ******************/
		%feature("compactdefaultargs") LastUParameter;
		%feature("autodoc", ":rtype: float") LastUParameter;
		Standard_Real LastUParameter ();

		/****************** LastVParameter ******************/
		%feature("compactdefaultargs") LastVParameter;
		%feature("autodoc", ":rtype: float") LastVParameter;
		Standard_Real LastVParameter ();

		/****************** NbUIntervals ******************/
		%feature("compactdefaultargs") NbUIntervals;
		%feature("autodoc", ":param S:
	:type S: GeomAbs_Shape
	:rtype: int") NbUIntervals;
		Standard_Integer NbUIntervals (const GeomAbs_Shape S);

		/****************** NbUKnots ******************/
		%feature("compactdefaultargs") NbUKnots;
		%feature("autodoc", ":rtype: int") NbUKnots;
		Standard_Integer NbUKnots ();

		/****************** NbUPoles ******************/
		%feature("compactdefaultargs") NbUPoles;
		%feature("autodoc", ":rtype: int") NbUPoles;
		Standard_Integer NbUPoles ();

		/****************** NbVIntervals ******************/
		%feature("compactdefaultargs") NbVIntervals;
		%feature("autodoc", ":param S:
	:type S: GeomAbs_Shape
	:rtype: int") NbVIntervals;
		Standard_Integer NbVIntervals (const GeomAbs_Shape S);

		/****************** NbVKnots ******************/
		%feature("compactdefaultargs") NbVKnots;
		%feature("autodoc", ":rtype: int") NbVKnots;
		Standard_Integer NbVKnots ();

		/****************** NbVPoles ******************/
		%feature("compactdefaultargs") NbVPoles;
		%feature("autodoc", ":rtype: int") NbVPoles;
		Standard_Integer NbVPoles ();

		/****************** OffsetValue ******************/
		%feature("compactdefaultargs") OffsetValue;
		%feature("autodoc", ":rtype: float") OffsetValue;
		Standard_Real OffsetValue ();

		/****************** Plane ******************/
		%feature("compactdefaultargs") Plane;
		%feature("autodoc", ":rtype: gp_Pln") Plane;
		gp_Pln Plane ();

		/****************** Sphere ******************/
		%feature("compactdefaultargs") Sphere;
		%feature("autodoc", ":rtype: gp_Sphere") Sphere;
		gp_Sphere Sphere ();

		/****************** Surface ******************/
		%feature("compactdefaultargs") Surface;
		%feature("autodoc", "* Returns a reference to the Surface inside the HSurface.
	:rtype: Adaptor3d_Surface") Surface;
		virtual const Adaptor3d_Surface & Surface ();

		/****************** Torus ******************/
		%feature("compactdefaultargs") Torus;
		%feature("autodoc", ":rtype: gp_Torus") Torus;
		gp_Torus Torus ();

		/****************** UContinuity ******************/
		%feature("compactdefaultargs") UContinuity;
		%feature("autodoc", ":rtype: GeomAbs_Shape") UContinuity;
		GeomAbs_Shape UContinuity ();

		/****************** UDegree ******************/
		%feature("compactdefaultargs") UDegree;
		%feature("autodoc", ":rtype: int") UDegree;
		Standard_Integer UDegree ();

		/****************** UIntervals ******************/
		%feature("compactdefaultargs") UIntervals;
		%feature("autodoc", ":param T:
	:type T: TColStd_Array1OfReal
	:param S:
	:type S: GeomAbs_Shape
	:rtype: None") UIntervals;
		void UIntervals (TColStd_Array1OfReal & T,const GeomAbs_Shape S);

		/****************** UPeriod ******************/
		%feature("compactdefaultargs") UPeriod;
		%feature("autodoc", ":rtype: float") UPeriod;
		Standard_Real UPeriod ();

		/****************** UResolution ******************/
		%feature("compactdefaultargs") UResolution;
		%feature("autodoc", ":param R3d:
	:type R3d: float
	:rtype: float") UResolution;
		Standard_Real UResolution (const Standard_Real R3d);

		/****************** UTrim ******************/
		%feature("compactdefaultargs") UTrim;
		%feature("autodoc", ":param First:
	:type First: float
	:param Last:
	:type Last: float
	:param Tol:
	:type Tol: float
	:rtype: opencascade::handle<Adaptor3d_HSurface>") UTrim;
		opencascade::handle<Adaptor3d_HSurface> UTrim (const Standard_Real First,const Standard_Real Last,const Standard_Real Tol);

		/****************** VContinuity ******************/
		%feature("compactdefaultargs") VContinuity;
		%feature("autodoc", ":rtype: GeomAbs_Shape") VContinuity;
		GeomAbs_Shape VContinuity ();

		/****************** VDegree ******************/
		%feature("compactdefaultargs") VDegree;
		%feature("autodoc", ":rtype: int") VDegree;
		Standard_Integer VDegree ();

		/****************** VIntervals ******************/
		%feature("compactdefaultargs") VIntervals;
		%feature("autodoc", ":param T:
	:type T: TColStd_Array1OfReal
	:param S:
	:type S: GeomAbs_Shape
	:rtype: None") VIntervals;
		void VIntervals (TColStd_Array1OfReal & T,const GeomAbs_Shape S);

		/****************** VPeriod ******************/
		%feature("compactdefaultargs") VPeriod;
		%feature("autodoc", ":rtype: float") VPeriod;
		Standard_Real VPeriod ();

		/****************** VResolution ******************/
		%feature("compactdefaultargs") VResolution;
		%feature("autodoc", ":param R3d:
	:type R3d: float
	:rtype: float") VResolution;
		Standard_Real VResolution (const Standard_Real R3d);

		/****************** VTrim ******************/
		%feature("compactdefaultargs") VTrim;
		%feature("autodoc", ":param First:
	:type First: float
	:param Last:
	:type Last: float
	:param Tol:
	:type Tol: float
	:rtype: opencascade::handle<Adaptor3d_HSurface>") VTrim;
		opencascade::handle<Adaptor3d_HSurface> VTrim (const Standard_Real First,const Standard_Real Last,const Standard_Real Tol);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", ":param U:
	:type U: float
	:param V:
	:type V: float
	:rtype: gp_Pnt") Value;
		gp_Pnt Value (const Standard_Real U,const Standard_Real V);

};


%make_alias(Adaptor3d_HSurface)

%extend Adaptor3d_HSurface {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************
* class Adaptor3d_HSurfaceTool *
*******************************/
class Adaptor3d_HSurfaceTool {
	public:
		/****************** AxeOfRevolution ******************/
		%feature("compactdefaultargs") AxeOfRevolution;
		%feature("autodoc", ":param S:
	:type S: Adaptor3d_HSurface
	:rtype: gp_Ax1") AxeOfRevolution;
		static gp_Ax1 AxeOfRevolution (const opencascade::handle<Adaptor3d_HSurface> & S);

		/****************** BSpline ******************/
		%feature("compactdefaultargs") BSpline;
		%feature("autodoc", ":param S:
	:type S: Adaptor3d_HSurface
	:rtype: opencascade::handle<Geom_BSplineSurface>") BSpline;
		static opencascade::handle<Geom_BSplineSurface> BSpline (const opencascade::handle<Adaptor3d_HSurface> & S);

		/****************** BasisCurve ******************/
		%feature("compactdefaultargs") BasisCurve;
		%feature("autodoc", ":param S:
	:type S: Adaptor3d_HSurface
	:rtype: opencascade::handle<Adaptor3d_HCurve>") BasisCurve;
		static opencascade::handle<Adaptor3d_HCurve> BasisCurve (const opencascade::handle<Adaptor3d_HSurface> & S);

		/****************** BasisSurface ******************/
		%feature("compactdefaultargs") BasisSurface;
		%feature("autodoc", ":param S:
	:type S: Adaptor3d_HSurface
	:rtype: opencascade::handle<Adaptor3d_HSurface>") BasisSurface;
		static opencascade::handle<Adaptor3d_HSurface> BasisSurface (const opencascade::handle<Adaptor3d_HSurface> & S);

		/****************** Bezier ******************/
		%feature("compactdefaultargs") Bezier;
		%feature("autodoc", ":param S:
	:type S: Adaptor3d_HSurface
	:rtype: opencascade::handle<Geom_BezierSurface>") Bezier;
		static opencascade::handle<Geom_BezierSurface> Bezier (const opencascade::handle<Adaptor3d_HSurface> & S);

		/****************** Cone ******************/
		%feature("compactdefaultargs") Cone;
		%feature("autodoc", ":param S:
	:type S: Adaptor3d_HSurface
	:rtype: gp_Cone") Cone;
		static gp_Cone Cone (const opencascade::handle<Adaptor3d_HSurface> & S);

		/****************** Cylinder ******************/
		%feature("compactdefaultargs") Cylinder;
		%feature("autodoc", ":param S:
	:type S: Adaptor3d_HSurface
	:rtype: gp_Cylinder") Cylinder;
		static gp_Cylinder Cylinder (const opencascade::handle<Adaptor3d_HSurface> & S);

		/****************** D0 ******************/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", ":param S:
	:type S: Adaptor3d_HSurface
	:param u:
	:type u: float
	:param v:
	:type v: float
	:param P:
	:type P: gp_Pnt
	:rtype: None") D0;
		static void D0 (const opencascade::handle<Adaptor3d_HSurface> & S,const Standard_Real u,const Standard_Real v,gp_Pnt & P);

		/****************** D1 ******************/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", ":param S:
	:type S: Adaptor3d_HSurface
	:param u:
	:type u: float
	:param v:
	:type v: float
	:param P:
	:type P: gp_Pnt
	:param D1u:
	:type D1u: gp_Vec
	:param D1v:
	:type D1v: gp_Vec
	:rtype: None") D1;
		static void D1 (const opencascade::handle<Adaptor3d_HSurface> & S,const Standard_Real u,const Standard_Real v,gp_Pnt & P,gp_Vec & D1u,gp_Vec & D1v);

		/****************** D2 ******************/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", ":param S:
	:type S: Adaptor3d_HSurface
	:param u:
	:type u: float
	:param v:
	:type v: float
	:param P:
	:type P: gp_Pnt
	:param D1U:
	:type D1U: gp_Vec
	:param D1V:
	:type D1V: gp_Vec
	:param D2U:
	:type D2U: gp_Vec
	:param D2V:
	:type D2V: gp_Vec
	:param D2UV:
	:type D2UV: gp_Vec
	:rtype: None") D2;
		static void D2 (const opencascade::handle<Adaptor3d_HSurface> & S,const Standard_Real u,const Standard_Real v,gp_Pnt & P,gp_Vec & D1U,gp_Vec & D1V,gp_Vec & D2U,gp_Vec & D2V,gp_Vec & D2UV);

		/****************** D3 ******************/
		%feature("compactdefaultargs") D3;
		%feature("autodoc", ":param S:
	:type S: Adaptor3d_HSurface
	:param u:
	:type u: float
	:param v:
	:type v: float
	:param P:
	:type P: gp_Pnt
	:param D1U:
	:type D1U: gp_Vec
	:param D1V:
	:type D1V: gp_Vec
	:param D2U:
	:type D2U: gp_Vec
	:param D2V:
	:type D2V: gp_Vec
	:param D2UV:
	:type D2UV: gp_Vec
	:param D3U:
	:type D3U: gp_Vec
	:param D3V:
	:type D3V: gp_Vec
	:param D3UUV:
	:type D3UUV: gp_Vec
	:param D3UVV:
	:type D3UVV: gp_Vec
	:rtype: None") D3;
		static void D3 (const opencascade::handle<Adaptor3d_HSurface> & S,const Standard_Real u,const Standard_Real v,gp_Pnt & P,gp_Vec & D1U,gp_Vec & D1V,gp_Vec & D2U,gp_Vec & D2V,gp_Vec & D2UV,gp_Vec & D3U,gp_Vec & D3V,gp_Vec & D3UUV,gp_Vec & D3UVV);

		/****************** DN ******************/
		%feature("compactdefaultargs") DN;
		%feature("autodoc", ":param S:
	:type S: Adaptor3d_HSurface
	:param u:
	:type u: float
	:param v:
	:type v: float
	:param Nu:
	:type Nu: int
	:param Nv:
	:type Nv: int
	:rtype: gp_Vec") DN;
		static gp_Vec DN (const opencascade::handle<Adaptor3d_HSurface> & S,const Standard_Real u,const Standard_Real v,const Standard_Integer Nu,const Standard_Integer Nv);

		/****************** Direction ******************/
		%feature("compactdefaultargs") Direction;
		%feature("autodoc", ":param S:
	:type S: Adaptor3d_HSurface
	:rtype: gp_Dir") Direction;
		static gp_Dir Direction (const opencascade::handle<Adaptor3d_HSurface> & S);

		/****************** FirstUParameter ******************/
		%feature("compactdefaultargs") FirstUParameter;
		%feature("autodoc", ":param S:
	:type S: Adaptor3d_HSurface
	:rtype: float") FirstUParameter;
		static Standard_Real FirstUParameter (const opencascade::handle<Adaptor3d_HSurface> & S);

		/****************** FirstVParameter ******************/
		%feature("compactdefaultargs") FirstVParameter;
		%feature("autodoc", ":param S:
	:type S: Adaptor3d_HSurface
	:rtype: float") FirstVParameter;
		static Standard_Real FirstVParameter (const opencascade::handle<Adaptor3d_HSurface> & S);

		/****************** GetType ******************/
		%feature("compactdefaultargs") GetType;
		%feature("autodoc", ":param S:
	:type S: Adaptor3d_HSurface
	:rtype: GeomAbs_SurfaceType") GetType;
		static GeomAbs_SurfaceType GetType (const opencascade::handle<Adaptor3d_HSurface> & S);

		/****************** IsUClosed ******************/
		%feature("compactdefaultargs") IsUClosed;
		%feature("autodoc", ":param S:
	:type S: Adaptor3d_HSurface
	:rtype: bool") IsUClosed;
		static Standard_Boolean IsUClosed (const opencascade::handle<Adaptor3d_HSurface> & S);

		/****************** IsUPeriodic ******************/
		%feature("compactdefaultargs") IsUPeriodic;
		%feature("autodoc", ":param S:
	:type S: Adaptor3d_HSurface
	:rtype: bool") IsUPeriodic;
		static Standard_Boolean IsUPeriodic (const opencascade::handle<Adaptor3d_HSurface> & S);

		/****************** IsVClosed ******************/
		%feature("compactdefaultargs") IsVClosed;
		%feature("autodoc", ":param S:
	:type S: Adaptor3d_HSurface
	:rtype: bool") IsVClosed;
		static Standard_Boolean IsVClosed (const opencascade::handle<Adaptor3d_HSurface> & S);

		/****************** IsVPeriodic ******************/
		%feature("compactdefaultargs") IsVPeriodic;
		%feature("autodoc", ":param S:
	:type S: Adaptor3d_HSurface
	:rtype: bool") IsVPeriodic;
		static Standard_Boolean IsVPeriodic (const opencascade::handle<Adaptor3d_HSurface> & S);

		/****************** LastUParameter ******************/
		%feature("compactdefaultargs") LastUParameter;
		%feature("autodoc", ":param S:
	:type S: Adaptor3d_HSurface
	:rtype: float") LastUParameter;
		static Standard_Real LastUParameter (const opencascade::handle<Adaptor3d_HSurface> & S);

		/****************** LastVParameter ******************/
		%feature("compactdefaultargs") LastVParameter;
		%feature("autodoc", ":param S:
	:type S: Adaptor3d_HSurface
	:rtype: float") LastVParameter;
		static Standard_Real LastVParameter (const opencascade::handle<Adaptor3d_HSurface> & S);

		/****************** NbSamplesU ******************/
		%feature("compactdefaultargs") NbSamplesU;
		%feature("autodoc", ":param S:
	:type S: Adaptor3d_HSurface
	:rtype: int") NbSamplesU;
		static Standard_Integer NbSamplesU (const opencascade::handle<Adaptor3d_HSurface> & S);

		/****************** NbSamplesU ******************/
		%feature("compactdefaultargs") NbSamplesU;
		%feature("autodoc", ":param S:
	:type S: Adaptor3d_HSurface
	:param u1:
	:type u1: float
	:param u2:
	:type u2: float
	:rtype: int") NbSamplesU;
		static Standard_Integer NbSamplesU (const opencascade::handle<Adaptor3d_HSurface> & S,const Standard_Real u1,const Standard_Real u2);

		/****************** NbSamplesV ******************/
		%feature("compactdefaultargs") NbSamplesV;
		%feature("autodoc", ":param S:
	:type S: Adaptor3d_HSurface
	:rtype: int") NbSamplesV;
		static Standard_Integer NbSamplesV (const opencascade::handle<Adaptor3d_HSurface> & S);

		/****************** NbSamplesV ******************/
		%feature("compactdefaultargs") NbSamplesV;
		%feature("autodoc", ":param S:
	:type S: Adaptor3d_HSurface
	:param v1:
	:type v1: float
	:param v2:
	:type v2: float
	:rtype: int") NbSamplesV;
		static Standard_Integer NbSamplesV (const opencascade::handle<Adaptor3d_HSurface> & S,const Standard_Real v1,const Standard_Real v2);

		/****************** NbUIntervals ******************/
		%feature("compactdefaultargs") NbUIntervals;
		%feature("autodoc", ":param S:
	:type S: Adaptor3d_HSurface
	:param Sh:
	:type Sh: GeomAbs_Shape
	:rtype: int") NbUIntervals;
		static Standard_Integer NbUIntervals (const opencascade::handle<Adaptor3d_HSurface> & S,const GeomAbs_Shape Sh);

		/****************** NbVIntervals ******************/
		%feature("compactdefaultargs") NbVIntervals;
		%feature("autodoc", ":param S:
	:type S: Adaptor3d_HSurface
	:param Sh:
	:type Sh: GeomAbs_Shape
	:rtype: int") NbVIntervals;
		static Standard_Integer NbVIntervals (const opencascade::handle<Adaptor3d_HSurface> & S,const GeomAbs_Shape Sh);

		/****************** OffsetValue ******************/
		%feature("compactdefaultargs") OffsetValue;
		%feature("autodoc", ":param S:
	:type S: Adaptor3d_HSurface
	:rtype: float") OffsetValue;
		static Standard_Real OffsetValue (const opencascade::handle<Adaptor3d_HSurface> & S);

		/****************** Plane ******************/
		%feature("compactdefaultargs") Plane;
		%feature("autodoc", ":param S:
	:type S: Adaptor3d_HSurface
	:rtype: gp_Pln") Plane;
		static gp_Pln Plane (const opencascade::handle<Adaptor3d_HSurface> & S);

		/****************** Sphere ******************/
		%feature("compactdefaultargs") Sphere;
		%feature("autodoc", ":param S:
	:type S: Adaptor3d_HSurface
	:rtype: gp_Sphere") Sphere;
		static gp_Sphere Sphere (const opencascade::handle<Adaptor3d_HSurface> & S);

		/****************** Torus ******************/
		%feature("compactdefaultargs") Torus;
		%feature("autodoc", ":param S:
	:type S: Adaptor3d_HSurface
	:rtype: gp_Torus") Torus;
		static gp_Torus Torus (const opencascade::handle<Adaptor3d_HSurface> & S);

		/****************** UIntervals ******************/
		%feature("compactdefaultargs") UIntervals;
		%feature("autodoc", ":param S:
	:type S: Adaptor3d_HSurface
	:param T:
	:type T: TColStd_Array1OfReal
	:param Sh:
	:type Sh: GeomAbs_Shape
	:rtype: None") UIntervals;
		static void UIntervals (const opencascade::handle<Adaptor3d_HSurface> & S,TColStd_Array1OfReal & T,const GeomAbs_Shape Sh);

		/****************** UPeriod ******************/
		%feature("compactdefaultargs") UPeriod;
		%feature("autodoc", ":param S:
	:type S: Adaptor3d_HSurface
	:rtype: float") UPeriod;
		static Standard_Real UPeriod (const opencascade::handle<Adaptor3d_HSurface> & S);

		/****************** UResolution ******************/
		%feature("compactdefaultargs") UResolution;
		%feature("autodoc", ":param S:
	:type S: Adaptor3d_HSurface
	:param R3d:
	:type R3d: float
	:rtype: float") UResolution;
		static Standard_Real UResolution (const opencascade::handle<Adaptor3d_HSurface> & S,const Standard_Real R3d);

		/****************** UTrim ******************/
		%feature("compactdefaultargs") UTrim;
		%feature("autodoc", "* If <First> >= <Last>
	:param S:
	:type S: Adaptor3d_HSurface
	:param First:
	:type First: float
	:param Last:
	:type Last: float
	:param Tol:
	:type Tol: float
	:rtype: opencascade::handle<Adaptor3d_HSurface>") UTrim;
		static opencascade::handle<Adaptor3d_HSurface> UTrim (const opencascade::handle<Adaptor3d_HSurface> & S,const Standard_Real First,const Standard_Real Last,const Standard_Real Tol);

		/****************** VIntervals ******************/
		%feature("compactdefaultargs") VIntervals;
		%feature("autodoc", ":param S:
	:type S: Adaptor3d_HSurface
	:param T:
	:type T: TColStd_Array1OfReal
	:param Sh:
	:type Sh: GeomAbs_Shape
	:rtype: None") VIntervals;
		static void VIntervals (const opencascade::handle<Adaptor3d_HSurface> & S,TColStd_Array1OfReal & T,const GeomAbs_Shape Sh);

		/****************** VPeriod ******************/
		%feature("compactdefaultargs") VPeriod;
		%feature("autodoc", ":param S:
	:type S: Adaptor3d_HSurface
	:rtype: float") VPeriod;
		static Standard_Real VPeriod (const opencascade::handle<Adaptor3d_HSurface> & S);

		/****************** VResolution ******************/
		%feature("compactdefaultargs") VResolution;
		%feature("autodoc", ":param S:
	:type S: Adaptor3d_HSurface
	:param R3d:
	:type R3d: float
	:rtype: float") VResolution;
		static Standard_Real VResolution (const opencascade::handle<Adaptor3d_HSurface> & S,const Standard_Real R3d);

		/****************** VTrim ******************/
		%feature("compactdefaultargs") VTrim;
		%feature("autodoc", "* If <First> >= <Last>
	:param S:
	:type S: Adaptor3d_HSurface
	:param First:
	:type First: float
	:param Last:
	:type Last: float
	:param Tol:
	:type Tol: float
	:rtype: opencascade::handle<Adaptor3d_HSurface>") VTrim;
		static opencascade::handle<Adaptor3d_HSurface> VTrim (const opencascade::handle<Adaptor3d_HSurface> & S,const Standard_Real First,const Standard_Real Last,const Standard_Real Tol);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", ":param S:
	:type S: Adaptor3d_HSurface
	:param u:
	:type u: float
	:param v:
	:type v: float
	:rtype: gp_Pnt") Value;
		static gp_Pnt Value (const opencascade::handle<Adaptor3d_HSurface> & S,const Standard_Real u,const Standard_Real v);

};


%extend Adaptor3d_HSurfaceTool {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************
* class Adaptor3d_HVertex *
**************************/
class Adaptor3d_HVertex : public Standard_Transient {
	public:
		/****************** Adaptor3d_HVertex ******************/
		%feature("compactdefaultargs") Adaptor3d_HVertex;
		%feature("autodoc", ":rtype: None") Adaptor3d_HVertex;
		 Adaptor3d_HVertex ();

		/****************** Adaptor3d_HVertex ******************/
		%feature("compactdefaultargs") Adaptor3d_HVertex;
		%feature("autodoc", ":param P:
	:type P: gp_Pnt2d
	:param Ori:
	:type Ori: TopAbs_Orientation
	:param Resolution:
	:type Resolution: float
	:rtype: None") Adaptor3d_HVertex;
		 Adaptor3d_HVertex (const gp_Pnt2d & P,const TopAbs_Orientation Ori,const Standard_Real Resolution);

		/****************** IsSame ******************/
		%feature("compactdefaultargs") IsSame;
		%feature("autodoc", ":param Other:
	:type Other: Adaptor3d_HVertex
	:rtype: bool") IsSame;
		virtual Standard_Boolean IsSame (const opencascade::handle<Adaptor3d_HVertex> & Other);

		/****************** Orientation ******************/
		%feature("compactdefaultargs") Orientation;
		%feature("autodoc", ":rtype: TopAbs_Orientation") Orientation;
		virtual TopAbs_Orientation Orientation ();

		/****************** Parameter ******************/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", ":param C:
	:type C: Adaptor2d_HCurve2d
	:rtype: float") Parameter;
		virtual Standard_Real Parameter (const opencascade::handle<Adaptor2d_HCurve2d> & C);

		/****************** Resolution ******************/
		%feature("compactdefaultargs") Resolution;
		%feature("autodoc", "* Parametric resolution (2d).
	:param C:
	:type C: Adaptor2d_HCurve2d
	:rtype: float") Resolution;
		virtual Standard_Real Resolution (const opencascade::handle<Adaptor2d_HCurve2d> & C);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", ":rtype: gp_Pnt2d") Value;
		virtual gp_Pnt2d Value ();

};


%make_alias(Adaptor3d_HVertex)

%extend Adaptor3d_HVertex {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************
* class Adaptor3d_InterFunc *
****************************/
class Adaptor3d_InterFunc : public math_FunctionWithDerivative {
	public:
		/****************** Adaptor3d_InterFunc ******************/
		%feature("compactdefaultargs") Adaptor3d_InterFunc;
		%feature("autodoc", "* build the function U(t)=FixVal if Fix =1 or V(t)=FixVal if Fix=2
	:param C:
	:type C: Adaptor2d_HCurve2d
	:param FixVal:
	:type FixVal: float
	:param Fix:
	:type Fix: int
	:rtype: None") Adaptor3d_InterFunc;
		 Adaptor3d_InterFunc (const opencascade::handle<Adaptor2d_HCurve2d> & C,const Standard_Real FixVal,const Standard_Integer Fix);

		/****************** Derivative ******************/
		%feature("compactdefaultargs") Derivative;
		%feature("autodoc", "* computes the derivative <D> of the function for the variable <X>. Returns True if the calculation were successfully done, False otherwise.
	:param X:
	:type X: float
	:param D:
	:type D: float
	:rtype: bool") Derivative;
		Standard_Boolean Derivative (const Standard_Real X,Standard_Real &OutValue);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "* computes the value <F>of the function for the variable <X>. Returns True if the calculation were successfully done, False otherwise.
	:param X:
	:type X: float
	:param F:
	:type F: float
	:rtype: bool") Value;
		Standard_Boolean Value (const Standard_Real X,Standard_Real &OutValue);

		/****************** Values ******************/
		%feature("compactdefaultargs") Values;
		%feature("autodoc", "* computes the value <F> and the derivative <D> of the function for the variable <X>. Returns True if the calculation were successfully done, False otherwise.
	:param X:
	:type X: float
	:param F:
	:type F: float
	:param D:
	:type D: float
	:rtype: bool") Values;
		Standard_Boolean Values (const Standard_Real X,Standard_Real &OutValue,Standard_Real &OutValue);

};


%extend Adaptor3d_InterFunc {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************
* class Adaptor3d_Surface *
**************************/
class Adaptor3d_Surface {
	public:
		/****************** AxeOfRevolution ******************/
		%feature("compactdefaultargs") AxeOfRevolution;
		%feature("autodoc", ":rtype: gp_Ax1") AxeOfRevolution;
		virtual gp_Ax1 AxeOfRevolution ();

		/****************** BSpline ******************/
		%feature("compactdefaultargs") BSpline;
		%feature("autodoc", ":rtype: opencascade::handle<Geom_BSplineSurface>") BSpline;
		virtual opencascade::handle<Geom_BSplineSurface> BSpline ();

		/****************** BasisCurve ******************/
		%feature("compactdefaultargs") BasisCurve;
		%feature("autodoc", ":rtype: opencascade::handle<Adaptor3d_HCurve>") BasisCurve;
		virtual opencascade::handle<Adaptor3d_HCurve> BasisCurve ();

		/****************** BasisSurface ******************/
		%feature("compactdefaultargs") BasisSurface;
		%feature("autodoc", ":rtype: opencascade::handle<Adaptor3d_HSurface>") BasisSurface;
		virtual opencascade::handle<Adaptor3d_HSurface> BasisSurface ();

		/****************** Bezier ******************/
		%feature("compactdefaultargs") Bezier;
		%feature("autodoc", ":rtype: opencascade::handle<Geom_BezierSurface>") Bezier;
		virtual opencascade::handle<Geom_BezierSurface> Bezier ();

		/****************** Cone ******************/
		%feature("compactdefaultargs") Cone;
		%feature("autodoc", ":rtype: gp_Cone") Cone;
		virtual gp_Cone Cone ();

		/****************** Cylinder ******************/
		%feature("compactdefaultargs") Cylinder;
		%feature("autodoc", ":rtype: gp_Cylinder") Cylinder;
		virtual gp_Cylinder Cylinder ();

		/****************** D0 ******************/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "* Computes the point of parameters U,V on the surface.
	:param U:
	:type U: float
	:param V:
	:type V: float
	:param P:
	:type P: gp_Pnt
	:rtype: void") D0;
		virtual void D0 (const Standard_Real U,const Standard_Real V,gp_Pnt & P);

		/****************** D1 ******************/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "* Computes the point and the first derivatives on the surface. Raised if the continuity of the current intervals is not C1.
	:param U:
	:type U: float
	:param V:
	:type V: float
	:param P:
	:type P: gp_Pnt
	:param D1U:
	:type D1U: gp_Vec
	:param D1V:
	:type D1V: gp_Vec
	:rtype: void") D1;
		virtual void D1 (const Standard_Real U,const Standard_Real V,gp_Pnt & P,gp_Vec & D1U,gp_Vec & D1V);

		/****************** D2 ******************/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "* Computes the point, the first and second derivatives on the surface. Raised if the continuity of the current intervals is not C2.
	:param U:
	:type U: float
	:param V:
	:type V: float
	:param P:
	:type P: gp_Pnt
	:param D1U:
	:type D1U: gp_Vec
	:param D1V:
	:type D1V: gp_Vec
	:param D2U:
	:type D2U: gp_Vec
	:param D2V:
	:type D2V: gp_Vec
	:param D2UV:
	:type D2UV: gp_Vec
	:rtype: void") D2;
		virtual void D2 (const Standard_Real U,const Standard_Real V,gp_Pnt & P,gp_Vec & D1U,gp_Vec & D1V,gp_Vec & D2U,gp_Vec & D2V,gp_Vec & D2UV);

		/****************** D3 ******************/
		%feature("compactdefaultargs") D3;
		%feature("autodoc", "* Computes the point, the first, second and third derivatives on the surface. Raised if the continuity of the current intervals is not C3.
	:param U:
	:type U: float
	:param V:
	:type V: float
	:param P:
	:type P: gp_Pnt
	:param D1U:
	:type D1U: gp_Vec
	:param D1V:
	:type D1V: gp_Vec
	:param D2U:
	:type D2U: gp_Vec
	:param D2V:
	:type D2V: gp_Vec
	:param D2UV:
	:type D2UV: gp_Vec
	:param D3U:
	:type D3U: gp_Vec
	:param D3V:
	:type D3V: gp_Vec
	:param D3UUV:
	:type D3UUV: gp_Vec
	:param D3UVV:
	:type D3UVV: gp_Vec
	:rtype: void") D3;
		virtual void D3 (const Standard_Real U,const Standard_Real V,gp_Pnt & P,gp_Vec & D1U,gp_Vec & D1V,gp_Vec & D2U,gp_Vec & D2V,gp_Vec & D2UV,gp_Vec & D3U,gp_Vec & D3V,gp_Vec & D3UUV,gp_Vec & D3UVV);

		/****************** DN ******************/
		%feature("compactdefaultargs") DN;
		%feature("autodoc", "* Computes the derivative of order Nu in the direction U and Nv in the direction V at the point P(U, V). Raised if the current U interval is not not CNu and the current V interval is not CNv. Raised if Nu + Nv < 1 or Nu < 0 or Nv < 0.
	:param U:
	:type U: float
	:param V:
	:type V: float
	:param Nu:
	:type Nu: int
	:param Nv:
	:type Nv: int
	:rtype: gp_Vec") DN;
		virtual gp_Vec DN (const Standard_Real U,const Standard_Real V,const Standard_Integer Nu,const Standard_Integer Nv);

		/****************** Direction ******************/
		%feature("compactdefaultargs") Direction;
		%feature("autodoc", ":rtype: gp_Dir") Direction;
		virtual gp_Dir Direction ();

		/****************** FirstUParameter ******************/
		%feature("compactdefaultargs") FirstUParameter;
		%feature("autodoc", ":rtype: float") FirstUParameter;
		virtual Standard_Real FirstUParameter ();

		/****************** FirstVParameter ******************/
		%feature("compactdefaultargs") FirstVParameter;
		%feature("autodoc", ":rtype: float") FirstVParameter;
		virtual Standard_Real FirstVParameter ();

		/****************** GetType ******************/
		%feature("compactdefaultargs") GetType;
		%feature("autodoc", "* Returns the type of the surface : Plane, Cylinder, Cone, Sphere, Torus, BezierSurface, BSplineSurface, SurfaceOfRevolution, SurfaceOfExtrusion, OtherSurface
	:rtype: GeomAbs_SurfaceType") GetType;
		virtual GeomAbs_SurfaceType GetType ();

		/****************** IsUClosed ******************/
		%feature("compactdefaultargs") IsUClosed;
		%feature("autodoc", ":rtype: bool") IsUClosed;
		virtual Standard_Boolean IsUClosed ();

		/****************** IsUPeriodic ******************/
		%feature("compactdefaultargs") IsUPeriodic;
		%feature("autodoc", ":rtype: bool") IsUPeriodic;
		virtual Standard_Boolean IsUPeriodic ();

		/****************** IsURational ******************/
		%feature("compactdefaultargs") IsURational;
		%feature("autodoc", ":rtype: bool") IsURational;
		virtual Standard_Boolean IsURational ();

		/****************** IsVClosed ******************/
		%feature("compactdefaultargs") IsVClosed;
		%feature("autodoc", ":rtype: bool") IsVClosed;
		virtual Standard_Boolean IsVClosed ();

		/****************** IsVPeriodic ******************/
		%feature("compactdefaultargs") IsVPeriodic;
		%feature("autodoc", ":rtype: bool") IsVPeriodic;
		virtual Standard_Boolean IsVPeriodic ();

		/****************** IsVRational ******************/
		%feature("compactdefaultargs") IsVRational;
		%feature("autodoc", ":rtype: bool") IsVRational;
		virtual Standard_Boolean IsVRational ();

		/****************** LastUParameter ******************/
		%feature("compactdefaultargs") LastUParameter;
		%feature("autodoc", ":rtype: float") LastUParameter;
		virtual Standard_Real LastUParameter ();

		/****************** LastVParameter ******************/
		%feature("compactdefaultargs") LastVParameter;
		%feature("autodoc", ":rtype: float") LastVParameter;
		virtual Standard_Real LastVParameter ();

		/****************** NbUIntervals ******************/
		%feature("compactdefaultargs") NbUIntervals;
		%feature("autodoc", "* Returns the number of U intervals for continuity <S>. May be one if UContinuity(me) >= <S>
	:param S:
	:type S: GeomAbs_Shape
	:rtype: int") NbUIntervals;
		virtual Standard_Integer NbUIntervals (const GeomAbs_Shape S);

		/****************** NbUKnots ******************/
		%feature("compactdefaultargs") NbUKnots;
		%feature("autodoc", ":rtype: int") NbUKnots;
		virtual Standard_Integer NbUKnots ();

		/****************** NbUPoles ******************/
		%feature("compactdefaultargs") NbUPoles;
		%feature("autodoc", ":rtype: int") NbUPoles;
		virtual Standard_Integer NbUPoles ();

		/****************** NbVIntervals ******************/
		%feature("compactdefaultargs") NbVIntervals;
		%feature("autodoc", "* Returns the number of V intervals for continuity <S>. May be one if VContinuity(me) >= <S>
	:param S:
	:type S: GeomAbs_Shape
	:rtype: int") NbVIntervals;
		virtual Standard_Integer NbVIntervals (const GeomAbs_Shape S);

		/****************** NbVKnots ******************/
		%feature("compactdefaultargs") NbVKnots;
		%feature("autodoc", ":rtype: int") NbVKnots;
		virtual Standard_Integer NbVKnots ();

		/****************** NbVPoles ******************/
		%feature("compactdefaultargs") NbVPoles;
		%feature("autodoc", ":rtype: int") NbVPoles;
		virtual Standard_Integer NbVPoles ();

		/****************** OffsetValue ******************/
		%feature("compactdefaultargs") OffsetValue;
		%feature("autodoc", ":rtype: float") OffsetValue;
		virtual Standard_Real OffsetValue ();

		/****************** Plane ******************/
		%feature("compactdefaultargs") Plane;
		%feature("autodoc", ":rtype: gp_Pln") Plane;
		virtual gp_Pln Plane ();

		/****************** Sphere ******************/
		%feature("compactdefaultargs") Sphere;
		%feature("autodoc", ":rtype: gp_Sphere") Sphere;
		virtual gp_Sphere Sphere ();

		/****************** Torus ******************/
		%feature("compactdefaultargs") Torus;
		%feature("autodoc", ":rtype: gp_Torus") Torus;
		virtual gp_Torus Torus ();

		/****************** UContinuity ******************/
		%feature("compactdefaultargs") UContinuity;
		%feature("autodoc", ":rtype: GeomAbs_Shape") UContinuity;
		virtual GeomAbs_Shape UContinuity ();

		/****************** UDegree ******************/
		%feature("compactdefaultargs") UDegree;
		%feature("autodoc", ":rtype: int") UDegree;
		virtual Standard_Integer UDegree ();

		/****************** UIntervals ******************/
		%feature("compactdefaultargs") UIntervals;
		%feature("autodoc", "* Returns the intervals with the requested continuity in the U direction.
	:param T:
	:type T: TColStd_Array1OfReal
	:param S:
	:type S: GeomAbs_Shape
	:rtype: void") UIntervals;
		virtual void UIntervals (TColStd_Array1OfReal & T,const GeomAbs_Shape S);

		/****************** UPeriod ******************/
		%feature("compactdefaultargs") UPeriod;
		%feature("autodoc", ":rtype: float") UPeriod;
		virtual Standard_Real UPeriod ();

		/****************** UResolution ******************/
		%feature("compactdefaultargs") UResolution;
		%feature("autodoc", "* Returns the parametric U resolution corresponding to the real space resolution <R3d>.
	:param R3d:
	:type R3d: float
	:rtype: float") UResolution;
		virtual Standard_Real UResolution (const Standard_Real R3d);

		/****************** UTrim ******************/
		%feature("compactdefaultargs") UTrim;
		%feature("autodoc", "* Returns a surface trimmed in the U direction equivalent of <self> between parameters <First> and <Last>. <Tol> is used to test for 3d points confusion. If <First> >= <Last>
	:param First:
	:type First: float
	:param Last:
	:type Last: float
	:param Tol:
	:type Tol: float
	:rtype: opencascade::handle<Adaptor3d_HSurface>") UTrim;
		virtual opencascade::handle<Adaptor3d_HSurface> UTrim (const Standard_Real First,const Standard_Real Last,const Standard_Real Tol);

		/****************** VContinuity ******************/
		%feature("compactdefaultargs") VContinuity;
		%feature("autodoc", ":rtype: GeomAbs_Shape") VContinuity;
		virtual GeomAbs_Shape VContinuity ();

		/****************** VDegree ******************/
		%feature("compactdefaultargs") VDegree;
		%feature("autodoc", ":rtype: int") VDegree;
		virtual Standard_Integer VDegree ();

		/****************** VIntervals ******************/
		%feature("compactdefaultargs") VIntervals;
		%feature("autodoc", "* Returns the intervals with the requested continuity in the V direction.
	:param T:
	:type T: TColStd_Array1OfReal
	:param S:
	:type S: GeomAbs_Shape
	:rtype: void") VIntervals;
		virtual void VIntervals (TColStd_Array1OfReal & T,const GeomAbs_Shape S);

		/****************** VPeriod ******************/
		%feature("compactdefaultargs") VPeriod;
		%feature("autodoc", ":rtype: float") VPeriod;
		virtual Standard_Real VPeriod ();

		/****************** VResolution ******************/
		%feature("compactdefaultargs") VResolution;
		%feature("autodoc", "* Returns the parametric V resolution corresponding to the real space resolution <R3d>.
	:param R3d:
	:type R3d: float
	:rtype: float") VResolution;
		virtual Standard_Real VResolution (const Standard_Real R3d);

		/****************** VTrim ******************/
		%feature("compactdefaultargs") VTrim;
		%feature("autodoc", "* Returns a surface trimmed in the V direction between parameters <First> and <Last>. <Tol> is used to test for 3d points confusion. If <First> >= <Last>
	:param First:
	:type First: float
	:param Last:
	:type Last: float
	:param Tol:
	:type Tol: float
	:rtype: opencascade::handle<Adaptor3d_HSurface>") VTrim;
		virtual opencascade::handle<Adaptor3d_HSurface> VTrim (const Standard_Real First,const Standard_Real Last,const Standard_Real Tol);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "* Computes the point of parameters U,V on the surface.
	:param U:
	:type U: float
	:param V:
	:type V: float
	:rtype: gp_Pnt") Value;
		virtual gp_Pnt Value (const Standard_Real U,const Standard_Real V);

};


%extend Adaptor3d_Surface {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************
* class Adaptor3d_TopolTool *
****************************/
class Adaptor3d_TopolTool : public Standard_Transient {
	public:
		/****************** Adaptor3d_TopolTool ******************/
		%feature("compactdefaultargs") Adaptor3d_TopolTool;
		%feature("autodoc", ":rtype: None") Adaptor3d_TopolTool;
		 Adaptor3d_TopolTool ();

		/****************** Adaptor3d_TopolTool ******************/
		%feature("compactdefaultargs") Adaptor3d_TopolTool;
		%feature("autodoc", ":param Surface:
	:type Surface: Adaptor3d_HSurface
	:rtype: None") Adaptor3d_TopolTool;
		 Adaptor3d_TopolTool (const opencascade::handle<Adaptor3d_HSurface> & Surface);

		/****************** BSplSamplePnts ******************/
		%feature("compactdefaultargs") BSplSamplePnts;
		%feature("autodoc", "* compute the sample-points for the intersections algorithms by adaptive algorithm for BSpline surfaces - is used in SamplePnts theDefl is a requred deflection theNUmin, theNVmin are minimal nb points for U and V.
	:param theDefl:
	:type theDefl: float
	:param theNUmin:
	:type theNUmin: int
	:param theNVmin:
	:type theNVmin: int
	:rtype: void") BSplSamplePnts;
		virtual void BSplSamplePnts (const Standard_Real theDefl,const Standard_Integer theNUmin,const Standard_Integer theNVmin);

		/****************** Classify ******************/
		%feature("compactdefaultargs") Classify;
		%feature("autodoc", ":param P:
	:type P: gp_Pnt2d
	:param Tol:
	:type Tol: float
	:param ReacdreOnPeriodic: default value is Standard_True
	:type ReacdreOnPeriodic: bool
	:rtype: TopAbs_State") Classify;
		virtual TopAbs_State Classify (const gp_Pnt2d & P,const Standard_Real Tol,const Standard_Boolean ReacdreOnPeriodic = Standard_True);

		/****************** ComputeSamplePoints ******************/
		%feature("compactdefaultargs") ComputeSamplePoints;
		%feature("autodoc", ":rtype: void") ComputeSamplePoints;
		virtual void ComputeSamplePoints ();

		/****************** DomainIsInfinite ******************/
		%feature("compactdefaultargs") DomainIsInfinite;
		%feature("autodoc", ":rtype: bool") DomainIsInfinite;
		virtual Standard_Boolean DomainIsInfinite ();

		/****************** Edge ******************/
		%feature("compactdefaultargs") Edge;
		%feature("autodoc", ":rtype: Standard_Address") Edge;
		virtual Standard_Address Edge ();

		/****************** Has3d ******************/
		%feature("compactdefaultargs") Has3d;
		%feature("autodoc", "* answers if arcs and vertices may have 3d representations, so that we could use Tol3d and Pnt methods.
	:rtype: bool") Has3d;
		virtual Standard_Boolean Has3d ();

		/****************** Identical ******************/
		%feature("compactdefaultargs") Identical;
		%feature("autodoc", "* Returns True if the vertices V1 and V2 are identical. This method does not take the orientation of the vertices in account.
	:param V1:
	:type V1: Adaptor3d_HVertex
	:param V2:
	:type V2: Adaptor3d_HVertex
	:rtype: bool") Identical;
		virtual Standard_Boolean Identical (const opencascade::handle<Adaptor3d_HVertex> & V1,const opencascade::handle<Adaptor3d_HVertex> & V2);

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", ":rtype: void") Init;
		virtual void Init ();

		/****************** InitVertexIterator ******************/
		%feature("compactdefaultargs") InitVertexIterator;
		%feature("autodoc", ":rtype: void") InitVertexIterator;
		virtual void InitVertexIterator ();

		/****************** Initialize ******************/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", ":rtype: void") Initialize;
		virtual void Initialize ();

		/****************** Initialize ******************/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", ":param S:
	:type S: Adaptor3d_HSurface
	:rtype: void") Initialize;
		virtual void Initialize (const opencascade::handle<Adaptor3d_HSurface> & S);

		/****************** Initialize ******************/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", ":param Curve:
	:type Curve: Adaptor2d_HCurve2d
	:rtype: void") Initialize;
		virtual void Initialize (const opencascade::handle<Adaptor2d_HCurve2d> & Curve);

		/****************** IsThePointOn ******************/
		%feature("compactdefaultargs") IsThePointOn;
		%feature("autodoc", ":param P:
	:type P: gp_Pnt2d
	:param Tol:
	:type Tol: float
	:param ReacdreOnPeriodic: default value is Standard_True
	:type ReacdreOnPeriodic: bool
	:rtype: bool") IsThePointOn;
		virtual Standard_Boolean IsThePointOn (const gp_Pnt2d & P,const Standard_Real Tol,const Standard_Boolean ReacdreOnPeriodic = Standard_True);

		/****************** IsUniformSampling ******************/
		%feature("compactdefaultargs") IsUniformSampling;
		%feature("autodoc", "* Returns true if provide uniform sampling of points.
	:rtype: bool") IsUniformSampling;
		virtual Standard_Boolean IsUniformSampling ();

		/****************** More ******************/
		%feature("compactdefaultargs") More;
		%feature("autodoc", ":rtype: bool") More;
		virtual Standard_Boolean More ();

		/****************** MoreVertex ******************/
		%feature("compactdefaultargs") MoreVertex;
		%feature("autodoc", ":rtype: bool") MoreVertex;
		virtual Standard_Boolean MoreVertex ();

		/****************** NbSamples ******************/
		%feature("compactdefaultargs") NbSamples;
		%feature("autodoc", "* compute the sample-points for the intersections algorithms
	:rtype: int") NbSamples;
		virtual Standard_Integer NbSamples ();

		/****************** NbSamplesU ******************/
		%feature("compactdefaultargs") NbSamplesU;
		%feature("autodoc", "* compute the sample-points for the intersections algorithms
	:rtype: int") NbSamplesU;
		virtual Standard_Integer NbSamplesU ();

		/****************** NbSamplesV ******************/
		%feature("compactdefaultargs") NbSamplesV;
		%feature("autodoc", "* compute the sample-points for the intersections algorithms
	:rtype: int") NbSamplesV;
		virtual Standard_Integer NbSamplesV ();

		/****************** Next ******************/
		%feature("compactdefaultargs") Next;
		%feature("autodoc", ":rtype: void") Next;
		virtual void Next ();

		/****************** NextVertex ******************/
		%feature("compactdefaultargs") NextVertex;
		%feature("autodoc", ":rtype: void") NextVertex;
		virtual void NextVertex ();

		/****************** Orientation ******************/
		%feature("compactdefaultargs") Orientation;
		%feature("autodoc", "* If the function returns the orientation of the arc. If the orientation is FORWARD or REVERSED, the arc is a 'real' limit of the surface. If the orientation is INTERNAL or EXTERNAL, the arc is considered as an arc on the surface.
	:param C:
	:type C: Adaptor2d_HCurve2d
	:rtype: TopAbs_Orientation") Orientation;
		virtual TopAbs_Orientation Orientation (const opencascade::handle<Adaptor2d_HCurve2d> & C);

		/****************** Orientation ******************/
		%feature("compactdefaultargs") Orientation;
		%feature("autodoc", "* Returns the orientation of the vertex V. The vertex has been found with an exploration on a given arc. The orientation is the orientation of the vertex on this arc.
	:param V:
	:type V: Adaptor3d_HVertex
	:rtype: TopAbs_Orientation") Orientation;
		virtual TopAbs_Orientation Orientation (const opencascade::handle<Adaptor3d_HVertex> & V);

		/****************** Pnt ******************/
		%feature("compactdefaultargs") Pnt;
		%feature("autodoc", "* returns 3d point of the vertex V
	:param V:
	:type V: Adaptor3d_HVertex
	:rtype: gp_Pnt") Pnt;
		virtual gp_Pnt Pnt (const opencascade::handle<Adaptor3d_HVertex> & V);

		/****************** SamplePnts ******************/
		%feature("compactdefaultargs") SamplePnts;
		%feature("autodoc", "* compute the sample-points for the intersections algorithms by adaptive algorithm for BSpline surfaces. For other surfaces algorithm is the same as in method ComputeSamplePoints(), but only fill arrays of U and V sample parameters; theDefl is a requred deflection theNUmin, theNVmin are minimal nb points for U and V.
	:param theDefl:
	:type theDefl: float
	:param theNUmin:
	:type theNUmin: int
	:param theNVmin:
	:type theNVmin: int
	:rtype: void") SamplePnts;
		virtual void SamplePnts (const Standard_Real theDefl,const Standard_Integer theNUmin,const Standard_Integer theNVmin);

		/****************** SamplePoint ******************/
		%feature("compactdefaultargs") SamplePoint;
		%feature("autodoc", ":param Index:
	:type Index: int
	:param P2d:
	:type P2d: gp_Pnt2d
	:param P3d:
	:type P3d: gp_Pnt
	:rtype: void") SamplePoint;
		virtual void SamplePoint (const Standard_Integer Index,gp_Pnt2d & P2d,gp_Pnt & P3d);

		/****************** Tol3d ******************/
		%feature("compactdefaultargs") Tol3d;
		%feature("autodoc", "* returns 3d tolerance of the arc C
	:param C:
	:type C: Adaptor2d_HCurve2d
	:rtype: float") Tol3d;
		virtual Standard_Real Tol3d (const opencascade::handle<Adaptor2d_HCurve2d> & C);

		/****************** Tol3d ******************/
		%feature("compactdefaultargs") Tol3d;
		%feature("autodoc", "* returns 3d tolerance of the vertex V
	:param V:
	:type V: Adaptor3d_HVertex
	:rtype: float") Tol3d;
		virtual Standard_Real Tol3d (const opencascade::handle<Adaptor3d_HVertex> & V);

		/****************** UParameters ******************/
		%feature("compactdefaultargs") UParameters;
		%feature("autodoc", "* return the set of U parameters on the surface obtained by the method SamplePnts
	:param theArray:
	:type theArray: TColStd_Array1OfReal
	:rtype: None") UParameters;
		void UParameters (TColStd_Array1OfReal & theArray);

		/****************** VParameters ******************/
		%feature("compactdefaultargs") VParameters;
		%feature("autodoc", "* return the set of V parameters on the surface obtained by the method SamplePnts
	:param theArray:
	:type theArray: TColStd_Array1OfReal
	:rtype: None") VParameters;
		void VParameters (TColStd_Array1OfReal & theArray);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", ":rtype: opencascade::handle<Adaptor2d_HCurve2d>") Value;
		virtual opencascade::handle<Adaptor2d_HCurve2d> Value ();

		/****************** Vertex ******************/
		%feature("compactdefaultargs") Vertex;
		%feature("autodoc", ":rtype: opencascade::handle<Adaptor3d_HVertex>") Vertex;
		virtual opencascade::handle<Adaptor3d_HVertex> Vertex ();

};


%make_alias(Adaptor3d_TopolTool)

%extend Adaptor3d_TopolTool {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************
* class Adaptor3d_CurveOnSurface *
*********************************/
class Adaptor3d_CurveOnSurface : public Adaptor3d_Curve {
	public:
		/****************** Adaptor3d_CurveOnSurface ******************/
		%feature("compactdefaultargs") Adaptor3d_CurveOnSurface;
		%feature("autodoc", ":rtype: None") Adaptor3d_CurveOnSurface;
		 Adaptor3d_CurveOnSurface ();

		/****************** Adaptor3d_CurveOnSurface ******************/
		%feature("compactdefaultargs") Adaptor3d_CurveOnSurface;
		%feature("autodoc", ":param S:
	:type S: Adaptor3d_HSurface
	:rtype: None") Adaptor3d_CurveOnSurface;
		 Adaptor3d_CurveOnSurface (const opencascade::handle<Adaptor3d_HSurface> & S);

		/****************** Adaptor3d_CurveOnSurface ******************/
		%feature("compactdefaultargs") Adaptor3d_CurveOnSurface;
		%feature("autodoc", "* Creates a CurveOnSurface from the 2d curve <C> and the surface <S>.
	:param C:
	:type C: Adaptor2d_HCurve2d
	:param S:
	:type S: Adaptor3d_HSurface
	:rtype: None") Adaptor3d_CurveOnSurface;
		 Adaptor3d_CurveOnSurface (const opencascade::handle<Adaptor2d_HCurve2d> & C,const opencascade::handle<Adaptor3d_HSurface> & S);

		/****************** BSpline ******************/
		%feature("compactdefaultargs") BSpline;
		%feature("autodoc", ":rtype: opencascade::handle<Geom_BSplineCurve>") BSpline;
		opencascade::handle<Geom_BSplineCurve> BSpline ();

		/****************** Bezier ******************/
		%feature("compactdefaultargs") Bezier;
		%feature("autodoc", ":rtype: opencascade::handle<Geom_BezierCurve>") Bezier;
		opencascade::handle<Geom_BezierCurve> Bezier ();

		/****************** ChangeCurve ******************/
		%feature("compactdefaultargs") ChangeCurve;
		%feature("autodoc", ":rtype: opencascade::handle<Adaptor2d_HCurve2d>") ChangeCurve;
		opencascade::handle<Adaptor2d_HCurve2d> & ChangeCurve ();

		/****************** ChangeSurface ******************/
		%feature("compactdefaultargs") ChangeSurface;
		%feature("autodoc", ":rtype: opencascade::handle<Adaptor3d_HSurface>") ChangeSurface;
		opencascade::handle<Adaptor3d_HSurface> & ChangeSurface ();

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
		%feature("autodoc", ":rtype: opencascade::handle<Adaptor2d_HCurve2d>") GetCurve;
		const opencascade::handle<Adaptor2d_HCurve2d> & GetCurve ();

		/****************** GetSurface ******************/
		%feature("compactdefaultargs") GetSurface;
		%feature("autodoc", ":rtype: opencascade::handle<Adaptor3d_HSurface>") GetSurface;
		const opencascade::handle<Adaptor3d_HSurface> & GetSurface ();

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
		%feature("autodoc", "* Changes the surface.
	:param S:
	:type S: Adaptor3d_HSurface
	:rtype: None") Load;
		void Load (const opencascade::handle<Adaptor3d_HSurface> & S);

		/****************** Load ******************/
		%feature("compactdefaultargs") Load;
		%feature("autodoc", "* Changes the 2d curve.
	:param C:
	:type C: Adaptor2d_HCurve2d
	:rtype: None") Load;
		void Load (const opencascade::handle<Adaptor2d_HCurve2d> & C);

		/****************** Load ******************/
		%feature("compactdefaultargs") Load;
		%feature("autodoc", "* Load both curve and surface.
	:param C:
	:type C: Adaptor2d_HCurve2d
	:param S:
	:type S: Adaptor3d_HSurface
	:rtype: None") Load;
		void Load (const opencascade::handle<Adaptor2d_HCurve2d> & C,const opencascade::handle<Adaptor3d_HSurface> & S);

		/****************** NbIntervals ******************/
		%feature("compactdefaultargs") NbIntervals;
		%feature("autodoc", "* Returns the number of intervals for continuity <S>. May be one if Continuity(me) >= <S>
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


%extend Adaptor3d_CurveOnSurface {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************************
* class Adaptor3d_HCurveOnSurface *
**********************************/
class Adaptor3d_HCurveOnSurface : public Adaptor3d_HCurve {
	public:
		/****************** Adaptor3d_HCurveOnSurface ******************/
		%feature("compactdefaultargs") Adaptor3d_HCurveOnSurface;
		%feature("autodoc", "* Creates an empty GenHCurve.
	:rtype: None") Adaptor3d_HCurveOnSurface;
		 Adaptor3d_HCurveOnSurface ();

		/****************** Adaptor3d_HCurveOnSurface ******************/
		%feature("compactdefaultargs") Adaptor3d_HCurveOnSurface;
		%feature("autodoc", "* Creates a GenHCurve from a Curve
	:param C:
	:type C: Adaptor3d_CurveOnSurface
	:rtype: None") Adaptor3d_HCurveOnSurface;
		 Adaptor3d_HCurveOnSurface (const Adaptor3d_CurveOnSurface & C);

		/****************** ChangeCurve ******************/
		%feature("compactdefaultargs") ChangeCurve;
		%feature("autodoc", "* Returns the curve used to create the GenHCurve.
	:rtype: Adaptor3d_CurveOnSurface") ChangeCurve;
		Adaptor3d_CurveOnSurface & ChangeCurve ();

		/****************** Curve ******************/
		%feature("compactdefaultargs") Curve;
		%feature("autodoc", "* Returns the curve used to create the GenHCurve. This is redefined from HCurve, cannot be inline.
	:rtype: Adaptor3d_Curve") Curve;
		const Adaptor3d_Curve & Curve ();

		/****************** GetCurve ******************/
		%feature("compactdefaultargs") GetCurve;
		%feature("autodoc", "* Returns the curve used to create the GenHCurve. This is redefined from HCurve, cannot be inline.
	:rtype: Adaptor3d_Curve") GetCurve;
		Adaptor3d_Curve & GetCurve ();

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "* Sets the field of the GenHCurve.
	:param C:
	:type C: Adaptor3d_CurveOnSurface
	:rtype: None") Set;
		void Set (const Adaptor3d_CurveOnSurface & C);

};


%make_alias(Adaptor3d_HCurveOnSurface)

%extend Adaptor3d_HCurveOnSurface {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************
* class Adaptor3d_HIsoCurve *
****************************/
class Adaptor3d_HIsoCurve : public Adaptor3d_HCurve {
	public:
		/****************** Adaptor3d_HIsoCurve ******************/
		%feature("compactdefaultargs") Adaptor3d_HIsoCurve;
		%feature("autodoc", "* Creates an empty GenHCurve.
	:rtype: None") Adaptor3d_HIsoCurve;
		 Adaptor3d_HIsoCurve ();

		/****************** Adaptor3d_HIsoCurve ******************/
		%feature("compactdefaultargs") Adaptor3d_HIsoCurve;
		%feature("autodoc", "* Creates a GenHCurve from a Curve
	:param C:
	:type C: Adaptor3d_IsoCurve
	:rtype: None") Adaptor3d_HIsoCurve;
		 Adaptor3d_HIsoCurve (const Adaptor3d_IsoCurve & C);

		/****************** ChangeCurve ******************/
		%feature("compactdefaultargs") ChangeCurve;
		%feature("autodoc", "* Returns the curve used to create the GenHCurve.
	:rtype: Adaptor3d_IsoCurve") ChangeCurve;
		Adaptor3d_IsoCurve & ChangeCurve ();

		/****************** Curve ******************/
		%feature("compactdefaultargs") Curve;
		%feature("autodoc", "* Returns the curve used to create the GenHCurve. This is redefined from HCurve, cannot be inline.
	:rtype: Adaptor3d_Curve") Curve;
		const Adaptor3d_Curve & Curve ();

		/****************** GetCurve ******************/
		%feature("compactdefaultargs") GetCurve;
		%feature("autodoc", "* Returns the curve used to create the GenHCurve. This is redefined from HCurve, cannot be inline.
	:rtype: Adaptor3d_Curve") GetCurve;
		Adaptor3d_Curve & GetCurve ();

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "* Sets the field of the GenHCurve.
	:param C:
	:type C: Adaptor3d_IsoCurve
	:rtype: None") Set;
		void Set (const Adaptor3d_IsoCurve & C);

};


%make_alias(Adaptor3d_HIsoCurve)

%extend Adaptor3d_HIsoCurve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************
* class Adaptor3d_IsoCurve *
***************************/
class Adaptor3d_IsoCurve : public Adaptor3d_Curve {
	public:
		/****************** Adaptor3d_IsoCurve ******************/
		%feature("compactdefaultargs") Adaptor3d_IsoCurve;
		%feature("autodoc", "* The iso is set to NoneIso.
	:rtype: None") Adaptor3d_IsoCurve;
		 Adaptor3d_IsoCurve ();

		/****************** Adaptor3d_IsoCurve ******************/
		%feature("compactdefaultargs") Adaptor3d_IsoCurve;
		%feature("autodoc", "* The surface is loaded. The iso is set to NoneIso.
	:param S:
	:type S: Adaptor3d_HSurface
	:rtype: None") Adaptor3d_IsoCurve;
		 Adaptor3d_IsoCurve (const opencascade::handle<Adaptor3d_HSurface> & S);

		/****************** Adaptor3d_IsoCurve ******************/
		%feature("compactdefaultargs") Adaptor3d_IsoCurve;
		%feature("autodoc", "* Creates an IsoCurve curve. Iso defines the type (isoU or isoU) Param defines the value of the iso. The bounds of the iso are the bounds of the surface.
	:param S:
	:type S: Adaptor3d_HSurface
	:param Iso:
	:type Iso: GeomAbs_IsoType
	:param Param:
	:type Param: float
	:rtype: None") Adaptor3d_IsoCurve;
		 Adaptor3d_IsoCurve (const opencascade::handle<Adaptor3d_HSurface> & S,const GeomAbs_IsoType Iso,const Standard_Real Param);

		/****************** Adaptor3d_IsoCurve ******************/
		%feature("compactdefaultargs") Adaptor3d_IsoCurve;
		%feature("autodoc", "* Create an IsoCurve curve. Iso defines the type (isoU or isov). Param defines the value of the iso. WFirst,WLast define the bounds of the iso.
	:param S:
	:type S: Adaptor3d_HSurface
	:param Iso:
	:type Iso: GeomAbs_IsoType
	:param Param:
	:type Param: float
	:param WFirst:
	:type WFirst: float
	:param WLast:
	:type WLast: float
	:rtype: None") Adaptor3d_IsoCurve;
		 Adaptor3d_IsoCurve (const opencascade::handle<Adaptor3d_HSurface> & S,const GeomAbs_IsoType Iso,const Standard_Real Param,const Standard_Real WFirst,const Standard_Real WLast);

		/****************** BSpline ******************/
		%feature("compactdefaultargs") BSpline;
		%feature("autodoc", ":rtype: opencascade::handle<Geom_BSplineCurve>") BSpline;
		opencascade::handle<Geom_BSplineCurve> BSpline ();

		/****************** Bezier ******************/
		%feature("compactdefaultargs") Bezier;
		%feature("autodoc", ":rtype: opencascade::handle<Geom_BezierCurve>") Bezier;
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

		/****************** Iso ******************/
		%feature("compactdefaultargs") Iso;
		%feature("autodoc", ":rtype: GeomAbs_IsoType") Iso;
		GeomAbs_IsoType Iso ();

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
		%feature("autodoc", "* Changes the surface. The iso is reset to NoneIso.
	:param S:
	:type S: Adaptor3d_HSurface
	:rtype: None") Load;
		void Load (const opencascade::handle<Adaptor3d_HSurface> & S);

		/****************** Load ******************/
		%feature("compactdefaultargs") Load;
		%feature("autodoc", "* Changes the iso on the current surface.
	:param Iso:
	:type Iso: GeomAbs_IsoType
	:param Param:
	:type Param: float
	:rtype: None") Load;
		void Load (const GeomAbs_IsoType Iso,const Standard_Real Param);

		/****************** Load ******************/
		%feature("compactdefaultargs") Load;
		%feature("autodoc", "* Changes the iso on the current surface.
	:param Iso:
	:type Iso: GeomAbs_IsoType
	:param Param:
	:type Param: float
	:param WFirst:
	:type WFirst: float
	:param WLast:
	:type WLast: float
	:rtype: None") Load;
		void Load (const GeomAbs_IsoType Iso,const Standard_Real Param,const Standard_Real WFirst,const Standard_Real WLast);

		/****************** NbIntervals ******************/
		%feature("compactdefaultargs") NbIntervals;
		%feature("autodoc", "* Returns the number of intervals for continuity <S>. May be one if Continuity(me) >= <S>
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

		/****************** Parameter ******************/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", ":rtype: float") Parameter;
		Standard_Real Parameter ();

		/****************** Period ******************/
		%feature("compactdefaultargs") Period;
		%feature("autodoc", ":rtype: float") Period;
		Standard_Real Period ();

		/****************** Resolution ******************/
		%feature("compactdefaultargs") Resolution;
		%feature("autodoc", "* Returns the parametric resolution corresponding to the real space resolution <R3d>.
	:param R3d:
	:type R3d: float
	:rtype: float") Resolution;
		Standard_Real Resolution (const Standard_Real R3d);

		/****************** Surface ******************/
		%feature("compactdefaultargs") Surface;
		%feature("autodoc", ":rtype: opencascade::handle<Adaptor3d_HSurface>") Surface;
		const opencascade::handle<Adaptor3d_HSurface> & Surface ();

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


%extend Adaptor3d_IsoCurve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* harray1 classes */
/* harray2 classes */
/* hsequence classes */
