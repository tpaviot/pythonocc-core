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
%define GEOM2DADAPTORDOCSTRING
"Geom2dAdaptor module, see official documentation at
https://www.opencascade.com/doc/occt-7.4.0/refman/html/package_geom2dadaptor.html"
%enddef
%module (package="OCC.Core", docstring=GEOM2DADAPTORDOCSTRING) Geom2dAdaptor


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
#include<Geom2dAdaptor_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<Adaptor2d_module.hxx>
#include<Geom2d_module.hxx>
#include<gp_module.hxx>
#include<GeomAbs_module.hxx>
#include<TColStd_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import Adaptor2d.i
%import Geom2d.i
%import gp.i
%import GeomAbs.i
%import TColStd.i
/* public enums */
/* end public enums declaration */

/* handles */
%wrap_handle(Geom2dAdaptor_GHCurve)
%wrap_handle(Geom2dAdaptor_HCurve)
/* end handles declaration */

/* templates */
/* end templates declaration */

/* typedefs */
/* end typedefs declaration */

/**********************
* class Geom2dAdaptor *
**********************/
%rename(geom2dadaptor) Geom2dAdaptor;
class Geom2dAdaptor {
	public:
		/****************** MakeCurve ******************/
		%feature("compactdefaultargs") MakeCurve;
		%feature("autodoc", "* Inherited from GHCurve. Provides a curve handled by reference. Creates a 2d curve from a HCurve2d. This cannot process the OtherCurves.
	:param HC:
	:type HC: Adaptor2d_Curve2d
	:rtype: opencascade::handle<Geom2d_Curve>") MakeCurve;
		static opencascade::handle<Geom2d_Curve> MakeCurve (const Adaptor2d_Curve2d & HC);

};


%extend Geom2dAdaptor {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************
* class Geom2dAdaptor_Curve *
****************************/
class Geom2dAdaptor_Curve : public Adaptor2d_Curve2d {
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
		gp_Circ2d Circle ();

		/****************** Continuity ******************/
		%feature("compactdefaultargs") Continuity;
		%feature("autodoc", ":rtype: GeomAbs_Shape") Continuity;
		GeomAbs_Shape Continuity ();

		/****************** Curve ******************/
		%feature("compactdefaultargs") Curve;
		%feature("autodoc", ":rtype: opencascade::handle<Geom2d_Curve>") Curve;
		const opencascade::handle<Geom2d_Curve> & Curve ();

		/****************** D0 ******************/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "* Computes the point of parameter U.
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

		/****************** Geom2dAdaptor_Curve ******************/
		%feature("compactdefaultargs") Geom2dAdaptor_Curve;
		%feature("autodoc", ":rtype: None") Geom2dAdaptor_Curve;
		 Geom2dAdaptor_Curve ();

		/****************** Geom2dAdaptor_Curve ******************/
		%feature("compactdefaultargs") Geom2dAdaptor_Curve;
		%feature("autodoc", ":param C:
	:type C: Geom2d_Curve
	:rtype: None") Geom2dAdaptor_Curve;
		 Geom2dAdaptor_Curve (const opencascade::handle<Geom2d_Curve> & C);

		/****************** Geom2dAdaptor_Curve ******************/
		%feature("compactdefaultargs") Geom2dAdaptor_Curve;
		%feature("autodoc", "* ConstructionError is raised if Ufirst>Ulast
	:param C:
	:type C: Geom2d_Curve
	:param UFirst:
	:type UFirst: float
	:param ULast:
	:type ULast: float
	:rtype: None") Geom2dAdaptor_Curve;
		 Geom2dAdaptor_Curve (const opencascade::handle<Geom2d_Curve> & C,const Standard_Real UFirst,const Standard_Real ULast);

		/****************** GetType ******************/
		%feature("compactdefaultargs") GetType;
		%feature("autodoc", ":rtype: GeomAbs_CurveType") GetType;
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

		/****************** Load ******************/
		%feature("compactdefaultargs") Load;
		%feature("autodoc", ":param C:
	:type C: Geom2d_Curve
	:rtype: None") Load;
		void Load (const opencascade::handle<Geom2d_Curve> & C);

		/****************** Load ******************/
		%feature("compactdefaultargs") Load;
		%feature("autodoc", "* ConstructionError is raised if Ufirst>Ulast
	:param C:
	:type C: Geom2d_Curve
	:param UFirst:
	:type UFirst: float
	:param ULast:
	:type ULast: float
	:rtype: None") Load;
		void Load (const opencascade::handle<Geom2d_Curve> & C,const Standard_Real UFirst,const Standard_Real ULast);

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

		/****************** NbSamples ******************/
		%feature("compactdefaultargs") NbSamples;
		%feature("autodoc", ":rtype: int") NbSamples;
		virtual Standard_Integer NbSamples ();

		/****************** Parabola ******************/
		%feature("compactdefaultargs") Parabola;
		%feature("autodoc", ":rtype: gp_Parab2d") Parabola;
		gp_Parab2d Parabola ();

		/****************** Period ******************/
		%feature("compactdefaultargs") Period;
		%feature("autodoc", ":rtype: float") Period;
		Standard_Real Period ();

		/****************** Reset ******************/
		%feature("compactdefaultargs") Reset;
		%feature("autodoc", "* Reset currently loaded curve (undone Load()).
	:rtype: None") Reset;
		void Reset ();

		/****************** Resolution ******************/
		%feature("compactdefaultargs") Resolution;
		%feature("autodoc", "* returns the parametric resolution
	:param Ruv:
	:type Ruv: float
	:rtype: float") Resolution;
		Standard_Real Resolution (const Standard_Real Ruv);

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
		%feature("autodoc", "* Computes the point of parameter U on the curve
	:param U:
	:type U: float
	:rtype: gp_Pnt2d") Value;
		gp_Pnt2d Value (const Standard_Real U);

};


%extend Geom2dAdaptor_Curve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************
* class Geom2dAdaptor_GHCurve *
******************************/
class Geom2dAdaptor_GHCurve : public Adaptor2d_HCurve2d {
	public:
		/****************** ChangeCurve2d ******************/
		%feature("compactdefaultargs") ChangeCurve2d;
		%feature("autodoc", "* Returns the curve used to create the GenHCurve.
	:rtype: Geom2dAdaptor_Curve") ChangeCurve2d;
		Geom2dAdaptor_Curve & ChangeCurve2d ();

		/****************** Curve2d ******************/
		%feature("compactdefaultargs") Curve2d;
		%feature("autodoc", "* Returns the curve used to create the GenHCurve2d. This is redefined from HCurve2d, cannot be inline.
	:rtype: Adaptor2d_Curve2d") Curve2d;
		const Adaptor2d_Curve2d & Curve2d ();

		/****************** Geom2dAdaptor_GHCurve ******************/
		%feature("compactdefaultargs") Geom2dAdaptor_GHCurve;
		%feature("autodoc", "* Creates an empty GenHCurve2d.
	:rtype: None") Geom2dAdaptor_GHCurve;
		 Geom2dAdaptor_GHCurve ();

		/****************** Geom2dAdaptor_GHCurve ******************/
		%feature("compactdefaultargs") Geom2dAdaptor_GHCurve;
		%feature("autodoc", "* Creates a GenHCurve2d from a Curve
	:param C:
	:type C: Geom2dAdaptor_Curve
	:rtype: None") Geom2dAdaptor_GHCurve;
		 Geom2dAdaptor_GHCurve (const Geom2dAdaptor_Curve & C);

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "* Sets the field of the GenHCurve2d.
	:param C:
	:type C: Geom2dAdaptor_Curve
	:rtype: None") Set;
		void Set (const Geom2dAdaptor_Curve & C);

};


%make_alias(Geom2dAdaptor_GHCurve)

%extend Geom2dAdaptor_GHCurve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************
* class Geom2dAdaptor_HCurve *
*****************************/
class Geom2dAdaptor_HCurve : public Geom2dAdaptor_GHCurve {
	public:
		/****************** Geom2dAdaptor_HCurve ******************/
		%feature("compactdefaultargs") Geom2dAdaptor_HCurve;
		%feature("autodoc", ":rtype: None") Geom2dAdaptor_HCurve;
		 Geom2dAdaptor_HCurve ();

		/****************** Geom2dAdaptor_HCurve ******************/
		%feature("compactdefaultargs") Geom2dAdaptor_HCurve;
		%feature("autodoc", ":param AS:
	:type AS: Geom2dAdaptor_Curve
	:rtype: None") Geom2dAdaptor_HCurve;
		 Geom2dAdaptor_HCurve (const Geom2dAdaptor_Curve & AS);

		/****************** Geom2dAdaptor_HCurve ******************/
		%feature("compactdefaultargs") Geom2dAdaptor_HCurve;
		%feature("autodoc", ":param S:
	:type S: Geom2d_Curve
	:rtype: None") Geom2dAdaptor_HCurve;
		 Geom2dAdaptor_HCurve (const opencascade::handle<Geom2d_Curve> & S);

		/****************** Geom2dAdaptor_HCurve ******************/
		%feature("compactdefaultargs") Geom2dAdaptor_HCurve;
		%feature("autodoc", "* ConstructionError is raised if UFirst>ULast or VFirst>VLast
	:param S:
	:type S: Geom2d_Curve
	:param UFirst:
	:type UFirst: float
	:param ULast:
	:type ULast: float
	:rtype: None") Geom2dAdaptor_HCurve;
		 Geom2dAdaptor_HCurve (const opencascade::handle<Geom2d_Curve> & S,const Standard_Real UFirst,const Standard_Real ULast);

};


%make_alias(Geom2dAdaptor_HCurve)

%extend Geom2dAdaptor_HCurve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* harray1 classes */
/* harray2 classes */
/* hsequence classes */
