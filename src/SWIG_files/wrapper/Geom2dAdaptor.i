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

%pythoncode {
from OCC.Core.Exception import *
};

/* public enums */
/* end public enums declaration */

/* python proy classes for enums */
%pythoncode {
};
/* end python proxy for enums */

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
		%feature("autodoc", "Inherited from ghcurve. provides a curve handled by reference. creates a 2d curve from a hcurve2d. this cannot process the othercurves.

Parameters
----------
HC: Adaptor2d_Curve2d

Returns
-------
opencascade::handle<Geom2d_Curve>
") MakeCurve;
		static opencascade::handle<Geom2d_Curve> MakeCurve(const Adaptor2d_Curve2d & HC);

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
		/****************** Geom2dAdaptor_Curve ******************/
		%feature("compactdefaultargs") Geom2dAdaptor_Curve;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Geom2dAdaptor_Curve;
		 Geom2dAdaptor_Curve();

		/****************** Geom2dAdaptor_Curve ******************/
		%feature("compactdefaultargs") Geom2dAdaptor_Curve;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: Geom2d_Curve

Returns
-------
None
") Geom2dAdaptor_Curve;
		 Geom2dAdaptor_Curve(const opencascade::handle<Geom2d_Curve> & C);

		/****************** Geom2dAdaptor_Curve ******************/
		%feature("compactdefaultargs") Geom2dAdaptor_Curve;
		%feature("autodoc", "Constructionerror is raised if ufirst>ulast.

Parameters
----------
C: Geom2d_Curve
UFirst: float
ULast: float

Returns
-------
None
") Geom2dAdaptor_Curve;
		 Geom2dAdaptor_Curve(const opencascade::handle<Geom2d_Curve> & C, const Standard_Real UFirst, const Standard_Real ULast);

		/****************** BSpline ******************/
		%feature("compactdefaultargs") BSpline;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<Geom2d_BSplineCurve>
") BSpline;
		opencascade::handle<Geom2d_BSplineCurve> BSpline();

		/****************** Bezier ******************/
		%feature("compactdefaultargs") Bezier;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<Geom2d_BezierCurve>
") Bezier;
		opencascade::handle<Geom2d_BezierCurve> Bezier();

		/****************** Circle ******************/
		%feature("compactdefaultargs") Circle;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Circ2d
") Circle;
		gp_Circ2d Circle();

		/****************** Continuity ******************/
		%feature("compactdefaultargs") Continuity;
		%feature("autodoc", "No available documentation.

Returns
-------
GeomAbs_Shape
") Continuity;
		GeomAbs_Shape Continuity();

		/****************** Curve ******************/
		%feature("compactdefaultargs") Curve;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<Geom2d_Curve>
") Curve;
		const opencascade::handle<Geom2d_Curve> & Curve();

		/****************** D0 ******************/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "Computes the point of parameter u.

Parameters
----------
U: float
P: gp_Pnt2d

Returns
-------
None
") D0;
		void D0(const Standard_Real U, gp_Pnt2d & P);

		/****************** D1 ******************/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "Computes the point of parameter u on the curve with its first derivative. raised if the continuity of the current interval is not c1.

Parameters
----------
U: float
P: gp_Pnt2d
V: gp_Vec2d

Returns
-------
None
") D1;
		void D1(const Standard_Real U, gp_Pnt2d & P, gp_Vec2d & V);

		/****************** D2 ******************/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "Returns the point p of parameter u, the first and second derivatives v1 and v2. raised if the continuity of the current interval is not c2.

Parameters
----------
U: float
P: gp_Pnt2d
V1: gp_Vec2d
V2: gp_Vec2d

Returns
-------
None
") D2;
		void D2(const Standard_Real U, gp_Pnt2d & P, gp_Vec2d & V1, gp_Vec2d & V2);

		/****************** D3 ******************/
		%feature("compactdefaultargs") D3;
		%feature("autodoc", "Returns the point p of parameter u, the first, the second and the third derivative. raised if the continuity of the current interval is not c3.

Parameters
----------
U: float
P: gp_Pnt2d
V1: gp_Vec2d
V2: gp_Vec2d
V3: gp_Vec2d

Returns
-------
None
") D3;
		void D3(const Standard_Real U, gp_Pnt2d & P, gp_Vec2d & V1, gp_Vec2d & V2, gp_Vec2d & V3);

		/****************** DN ******************/
		%feature("compactdefaultargs") DN;
		%feature("autodoc", "The returned vector gives the value of the derivative for the order of derivation n. raised if the continuity of the current interval is not cn. raised if n < 1.

Parameters
----------
U: float
N: int

Returns
-------
gp_Vec2d
") DN;
		gp_Vec2d DN(const Standard_Real U, const Standard_Integer N);

		/****************** Degree ******************/
		%feature("compactdefaultargs") Degree;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") Degree;
		Standard_Integer Degree();

		/****************** Ellipse ******************/
		%feature("compactdefaultargs") Ellipse;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Elips2d
") Ellipse;
		gp_Elips2d Ellipse();

		/****************** FirstParameter ******************/
		%feature("compactdefaultargs") FirstParameter;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") FirstParameter;
		Standard_Real FirstParameter();

		/****************** GetType ******************/
		%feature("compactdefaultargs") GetType;
		%feature("autodoc", "No available documentation.

Returns
-------
GeomAbs_CurveType
") GetType;
		GeomAbs_CurveType GetType();

		/****************** Hyperbola ******************/
		%feature("compactdefaultargs") Hyperbola;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Hypr2d
") Hyperbola;
		gp_Hypr2d Hyperbola();

		/****************** Intervals ******************/
		%feature("compactdefaultargs") Intervals;
		%feature("autodoc", "Stores in <t> the parameters bounding the intervals of continuity <s>. //! the array must provide enough room to accomodate for the parameters. i.e. t.length() > nbintervals().

Parameters
----------
T: TColStd_Array1OfReal
S: GeomAbs_Shape

Returns
-------
None
") Intervals;
		void Intervals(TColStd_Array1OfReal & T, const GeomAbs_Shape S);

		/****************** IsClosed ******************/
		%feature("compactdefaultargs") IsClosed;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsClosed;
		Standard_Boolean IsClosed();

		/****************** IsPeriodic ******************/
		%feature("compactdefaultargs") IsPeriodic;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsPeriodic;
		Standard_Boolean IsPeriodic();

		/****************** IsRational ******************/
		%feature("compactdefaultargs") IsRational;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsRational;
		Standard_Boolean IsRational();

		/****************** LastParameter ******************/
		%feature("compactdefaultargs") LastParameter;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") LastParameter;
		Standard_Real LastParameter();

		/****************** Line ******************/
		%feature("compactdefaultargs") Line;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Lin2d
") Line;
		gp_Lin2d Line();

		/****************** Load ******************/
		%feature("compactdefaultargs") Load;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: Geom2d_Curve

Returns
-------
None
") Load;
		void Load(const opencascade::handle<Geom2d_Curve> & C);

		/****************** Load ******************/
		%feature("compactdefaultargs") Load;
		%feature("autodoc", "Constructionerror is raised if ufirst>ulast.

Parameters
----------
C: Geom2d_Curve
UFirst: float
ULast: float

Returns
-------
None
") Load;
		void Load(const opencascade::handle<Geom2d_Curve> & C, const Standard_Real UFirst, const Standard_Real ULast);

		/****************** NbIntervals ******************/
		%feature("compactdefaultargs") NbIntervals;
		%feature("autodoc", "If necessary, breaks the curve in intervals of continuity <s>. and returns the number of intervals.

Parameters
----------
S: GeomAbs_Shape

Returns
-------
int
") NbIntervals;
		Standard_Integer NbIntervals(const GeomAbs_Shape S);

		/****************** NbKnots ******************/
		%feature("compactdefaultargs") NbKnots;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbKnots;
		Standard_Integer NbKnots();

		/****************** NbPoles ******************/
		%feature("compactdefaultargs") NbPoles;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbPoles;
		Standard_Integer NbPoles();

		/****************** NbSamples ******************/
		%feature("compactdefaultargs") NbSamples;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbSamples;
		virtual Standard_Integer NbSamples();

		/****************** Parabola ******************/
		%feature("compactdefaultargs") Parabola;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Parab2d
") Parabola;
		gp_Parab2d Parabola();

		/****************** Period ******************/
		%feature("compactdefaultargs") Period;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") Period;
		Standard_Real Period();

		/****************** Reset ******************/
		%feature("compactdefaultargs") Reset;
		%feature("autodoc", "Reset currently loaded curve (undone load()).

Returns
-------
None
") Reset;
		void Reset();

		/****************** Resolution ******************/
		%feature("compactdefaultargs") Resolution;
		%feature("autodoc", "Returns the parametric resolution.

Parameters
----------
Ruv: float

Returns
-------
float
") Resolution;
		Standard_Real Resolution(const Standard_Real Ruv);

		/****************** Trim ******************/
		%feature("compactdefaultargs") Trim;
		%feature("autodoc", "Returns a curve equivalent of <self> between parameters <first> and <last>. <tol> is used to test for 3d points confusion. if <first> >= <last>.

Parameters
----------
First: float
Last: float
Tol: float

Returns
-------
opencascade::handle<Adaptor2d_HCurve2d>
") Trim;
		opencascade::handle<Adaptor2d_HCurve2d> Trim(const Standard_Real First, const Standard_Real Last, const Standard_Real Tol);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Computes the point of parameter u on the curve.

Parameters
----------
U: float

Returns
-------
gp_Pnt2d
") Value;
		gp_Pnt2d Value(const Standard_Real U);

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
		/****************** Geom2dAdaptor_GHCurve ******************/
		%feature("compactdefaultargs") Geom2dAdaptor_GHCurve;
		%feature("autodoc", "Creates an empty genhcurve2d.

Returns
-------
None
") Geom2dAdaptor_GHCurve;
		 Geom2dAdaptor_GHCurve();

		/****************** Geom2dAdaptor_GHCurve ******************/
		%feature("compactdefaultargs") Geom2dAdaptor_GHCurve;
		%feature("autodoc", "Creates a genhcurve2d from a curve.

Parameters
----------
C: Geom2dAdaptor_Curve

Returns
-------
None
") Geom2dAdaptor_GHCurve;
		 Geom2dAdaptor_GHCurve(const Geom2dAdaptor_Curve & C);

		/****************** ChangeCurve2d ******************/
		%feature("compactdefaultargs") ChangeCurve2d;
		%feature("autodoc", "Returns the curve used to create the genhcurve.

Returns
-------
Geom2dAdaptor_Curve
") ChangeCurve2d;
		Geom2dAdaptor_Curve & ChangeCurve2d();

		/****************** Curve2d ******************/
		%feature("compactdefaultargs") Curve2d;
		%feature("autodoc", "Returns the curve used to create the genhcurve2d. this is redefined from hcurve2d, cannot be inline.

Returns
-------
Adaptor2d_Curve2d
") Curve2d;
		const Adaptor2d_Curve2d & Curve2d();

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "Sets the field of the genhcurve2d.

Parameters
----------
C: Geom2dAdaptor_Curve

Returns
-------
None
") Set;
		void Set(const Geom2dAdaptor_Curve & C);

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
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Geom2dAdaptor_HCurve;
		 Geom2dAdaptor_HCurve();

		/****************** Geom2dAdaptor_HCurve ******************/
		%feature("compactdefaultargs") Geom2dAdaptor_HCurve;
		%feature("autodoc", "No available documentation.

Parameters
----------
AS: Geom2dAdaptor_Curve

Returns
-------
None
") Geom2dAdaptor_HCurve;
		 Geom2dAdaptor_HCurve(const Geom2dAdaptor_Curve & AS);

		/****************** Geom2dAdaptor_HCurve ******************/
		%feature("compactdefaultargs") Geom2dAdaptor_HCurve;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: Geom2d_Curve

Returns
-------
None
") Geom2dAdaptor_HCurve;
		 Geom2dAdaptor_HCurve(const opencascade::handle<Geom2d_Curve> & S);

		/****************** Geom2dAdaptor_HCurve ******************/
		%feature("compactdefaultargs") Geom2dAdaptor_HCurve;
		%feature("autodoc", "Constructionerror is raised if ufirst>ulast or vfirst>vlast.

Parameters
----------
S: Geom2d_Curve
UFirst: float
ULast: float

Returns
-------
None
") Geom2dAdaptor_HCurve;
		 Geom2dAdaptor_HCurve(const opencascade::handle<Geom2d_Curve> & S, const Standard_Real UFirst, const Standard_Real ULast);

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
