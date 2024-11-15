/*
Copyright 2008-2024 Thomas Paviot (tpaviot@gmail.com)

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
%define INTANA2DDOCSTRING
"IntAna2d module, see official documentation at
https://dev.opencascade.org/doc/occt-7.8.0/refman/html/package_intana2d.html"
%enddef
%module (package="OCC.Core", docstring=INTANA2DDOCSTRING) IntAna2d


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
#include<IntAna2d_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<gp_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import gp.i

%pythoncode {
from enum import IntEnum
from OCC.Core.Exception import *
};

/* public enums */
/* end public enums declaration */

/* python proxy classes for enums */
%pythoncode {
};
/* end python proxy for enums */

/* handles */
/* end handles declaration */

/* templates */
/* end templates declaration */

/* typedefs */
/* end typedefs declaration */

/*********************************
* class IntAna2d_AnaIntersection *
*********************************/
class IntAna2d_AnaIntersection {
	public:
		/****** IntAna2d_AnaIntersection::IntAna2d_AnaIntersection ******/
		/****** md5 signature: f7460933df8ccbb6dde0d98470399f0d ******/
		%feature("compactdefaultargs") IntAna2d_AnaIntersection;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor. isdone returns false.
") IntAna2d_AnaIntersection;
		 IntAna2d_AnaIntersection();

		/****** IntAna2d_AnaIntersection::IntAna2d_AnaIntersection ******/
		/****** md5 signature: 766a04dab9fd25077304862e13bc32e0 ******/
		%feature("compactdefaultargs") IntAna2d_AnaIntersection;
		%feature("autodoc", "
Parameters
----------
L1: gp_Lin2d
L2: gp_Lin2d

Return
-------
None

Description
-----------
Intersection between two lines.
") IntAna2d_AnaIntersection;
		 IntAna2d_AnaIntersection(const gp_Lin2d & L1, const gp_Lin2d & L2);

		/****** IntAna2d_AnaIntersection::IntAna2d_AnaIntersection ******/
		/****** md5 signature: f6cd1e4e8d28fadfe2499a9bcd33c9b9 ******/
		%feature("compactdefaultargs") IntAna2d_AnaIntersection;
		%feature("autodoc", "
Parameters
----------
C1: gp_Circ2d
C2: gp_Circ2d

Return
-------
None

Description
-----------
Intersection between two circles.
") IntAna2d_AnaIntersection;
		 IntAna2d_AnaIntersection(const gp_Circ2d & C1, const gp_Circ2d & C2);

		/****** IntAna2d_AnaIntersection::IntAna2d_AnaIntersection ******/
		/****** md5 signature: 98010d250bfdf6dc147967a7f2a54671 ******/
		%feature("compactdefaultargs") IntAna2d_AnaIntersection;
		%feature("autodoc", "
Parameters
----------
L: gp_Lin2d
C: gp_Circ2d

Return
-------
None

Description
-----------
Intersection between a line and a circle.
") IntAna2d_AnaIntersection;
		 IntAna2d_AnaIntersection(const gp_Lin2d & L, const gp_Circ2d & C);

		/****** IntAna2d_AnaIntersection::IntAna2d_AnaIntersection ******/
		/****** md5 signature: f1d9bd80774edf3cdbae8bbb48d99107 ******/
		%feature("compactdefaultargs") IntAna2d_AnaIntersection;
		%feature("autodoc", "
Parameters
----------
L: gp_Lin2d
C: IntAna2d_Conic

Return
-------
None

Description
-----------
Intersection between a line and a conic.
") IntAna2d_AnaIntersection;
		 IntAna2d_AnaIntersection(const gp_Lin2d & L, const IntAna2d_Conic & C);

		/****** IntAna2d_AnaIntersection::IntAna2d_AnaIntersection ******/
		/****** md5 signature: 72be04d84075f23c13d3849a60ad5abf ******/
		%feature("compactdefaultargs") IntAna2d_AnaIntersection;
		%feature("autodoc", "
Parameters
----------
C: gp_Circ2d
Co: IntAna2d_Conic

Return
-------
None

Description
-----------
Intersection between a circle and another conic.
") IntAna2d_AnaIntersection;
		 IntAna2d_AnaIntersection(const gp_Circ2d & C, const IntAna2d_Conic & Co);

		/****** IntAna2d_AnaIntersection::IntAna2d_AnaIntersection ******/
		/****** md5 signature: d9bf753b2bd37ce0ce2a1c1c9b7a1f5b ******/
		%feature("compactdefaultargs") IntAna2d_AnaIntersection;
		%feature("autodoc", "
Parameters
----------
E: gp_Elips2d
C: IntAna2d_Conic

Return
-------
None

Description
-----------
Intersection between an ellipse and another conic.
") IntAna2d_AnaIntersection;
		 IntAna2d_AnaIntersection(const gp_Elips2d & E, const IntAna2d_Conic & C);

		/****** IntAna2d_AnaIntersection::IntAna2d_AnaIntersection ******/
		/****** md5 signature: f70318521422776524454b5bd846e0db ******/
		%feature("compactdefaultargs") IntAna2d_AnaIntersection;
		%feature("autodoc", "
Parameters
----------
P: gp_Parab2d
C: IntAna2d_Conic

Return
-------
None

Description
-----------
Intersection between a parabola and another conic.
") IntAna2d_AnaIntersection;
		 IntAna2d_AnaIntersection(const gp_Parab2d & P, const IntAna2d_Conic & C);

		/****** IntAna2d_AnaIntersection::IntAna2d_AnaIntersection ******/
		/****** md5 signature: a05847187be59244b51d602737ca6a46 ******/
		%feature("compactdefaultargs") IntAna2d_AnaIntersection;
		%feature("autodoc", "
Parameters
----------
H: gp_Hypr2d
C: IntAna2d_Conic

Return
-------
None

Description
-----------
Intersection between an hyperbola and another conic.
") IntAna2d_AnaIntersection;
		 IntAna2d_AnaIntersection(const gp_Hypr2d & H, const IntAna2d_Conic & C);

		/****** IntAna2d_AnaIntersection::IdenticalElements ******/
		/****** md5 signature: a9624e3d4423fe2affeb799176bb8c2b ******/
		%feature("compactdefaultargs") IdenticalElements;
		%feature("autodoc", "Return
-------
bool

Description
-----------
For the intersection between an element of gp and a conic known by an implicit equation, the result will be true if the element of gp verifies the implicit equation. for the intersection between two lin2d or two circ2d, the result will be true if the elements are identical. the function returns false in all the other cases.
") IdenticalElements;
		Standard_Boolean IdenticalElements();

		/****** IntAna2d_AnaIntersection::IsDone ******/
		/****** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if the computation was successful.
") IsDone;
		Standard_Boolean IsDone();

		/****** IntAna2d_AnaIntersection::IsEmpty ******/
		/****** md5 signature: 6ab5e1ad63f93168856ab126dd374b81 ******/
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true when there is no intersection, i-e - no intersection point - the elements are not identical. the element may be parallel in this case.
") IsEmpty;
		Standard_Boolean IsEmpty();

		/****** IntAna2d_AnaIntersection::NbPoints ******/
		/****** md5 signature: 1d4bbbd7c4dda4f1e56c00ae994bedbe ******/
		%feature("compactdefaultargs") NbPoints;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of intpoint between the 2 curves.
") NbPoints;
		Standard_Integer NbPoints();

		/****** IntAna2d_AnaIntersection::ParallelElements ******/
		/****** md5 signature: d684784e6c92c9afbd75a5695cf89008 ******/
		%feature("compactdefaultargs") ParallelElements;
		%feature("autodoc", "Return
-------
bool

Description
-----------
For the intersection between two lin2d or two circ2d, the function returns true if the elements are parallel. the function returns false in all the other cases.
") ParallelElements;
		Standard_Boolean ParallelElements();

		/****** IntAna2d_AnaIntersection::Perform ******/
		/****** md5 signature: 68a557d76af2bf603b9335a9b9e7213c ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
L1: gp_Lin2d
L2: gp_Lin2d

Return
-------
None

Description
-----------
Intersection between two lines.
") Perform;
		void Perform(const gp_Lin2d & L1, const gp_Lin2d & L2);

		/****** IntAna2d_AnaIntersection::Perform ******/
		/****** md5 signature: 5dea5f6755b51974cad27697ed150a04 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
C1: gp_Circ2d
C2: gp_Circ2d

Return
-------
None

Description
-----------
Intersection between two circles.
") Perform;
		void Perform(const gp_Circ2d & C1, const gp_Circ2d & C2);

		/****** IntAna2d_AnaIntersection::Perform ******/
		/****** md5 signature: 68e244b736a096ca28ee6bc64f1c5407 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
L: gp_Lin2d
C: gp_Circ2d

Return
-------
None

Description
-----------
Intersection between a line and a circle.
") Perform;
		void Perform(const gp_Lin2d & L, const gp_Circ2d & C);

		/****** IntAna2d_AnaIntersection::Perform ******/
		/****** md5 signature: 07b2c27e14a0a9e91269ca3b6b6a01fc ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
L: gp_Lin2d
C: IntAna2d_Conic

Return
-------
None

Description
-----------
Intersection between a line and a conic.
") Perform;
		void Perform(const gp_Lin2d & L, const IntAna2d_Conic & C);

		/****** IntAna2d_AnaIntersection::Perform ******/
		/****** md5 signature: a30825cc98ccd7af46e4514cbd1cf741 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
C: gp_Circ2d
Co: IntAna2d_Conic

Return
-------
None

Description
-----------
Intersection between a circle and another conic.
") Perform;
		void Perform(const gp_Circ2d & C, const IntAna2d_Conic & Co);

		/****** IntAna2d_AnaIntersection::Perform ******/
		/****** md5 signature: 70d3d46e223d3617c83d86165a4a5dbe ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
E: gp_Elips2d
C: IntAna2d_Conic

Return
-------
None

Description
-----------
Intersection between an ellipse and another conic.
") Perform;
		void Perform(const gp_Elips2d & E, const IntAna2d_Conic & C);

		/****** IntAna2d_AnaIntersection::Perform ******/
		/****** md5 signature: 1bba1a8bc0514590d74eed38fb3360a7 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
P: gp_Parab2d
C: IntAna2d_Conic

Return
-------
None

Description
-----------
Intersection between a parabola and another conic.
") Perform;
		void Perform(const gp_Parab2d & P, const IntAna2d_Conic & C);

		/****** IntAna2d_AnaIntersection::Perform ******/
		/****** md5 signature: 8ca4776fa1c8da0d81ea62a9bf30252b ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
H: gp_Hypr2d
C: IntAna2d_Conic

Return
-------
None

Description
-----------
Intersection between an hyperbola and another conic.
") Perform;
		void Perform(const gp_Hypr2d & H, const IntAna2d_Conic & C);

		/****** IntAna2d_AnaIntersection::Point ******/
		/****** md5 signature: 96fe594c35303839dc8b316efb1f60aa ******/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "
Parameters
----------
N: int

Return
-------
IntAna2d_IntPoint

Description
-----------
Returns the intersection point of range n; if (n<=0) or (n>nbpoints), an exception is raised.
") Point;
		const IntAna2d_IntPoint & Point(const Standard_Integer N);

};


%extend IntAna2d_AnaIntersection {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************
* class IntAna2d_Conic *
***********************/
class IntAna2d_Conic {
	public:
		/****** IntAna2d_Conic::IntAna2d_Conic ******/
		/****** md5 signature: 99d1b5457b4d66ce743c5151442b6eb5 ******/
		%feature("compactdefaultargs") IntAna2d_Conic;
		%feature("autodoc", "
Parameters
----------
C: gp_Circ2d

Return
-------
None

Description
-----------
No available documentation.
") IntAna2d_Conic;
		 IntAna2d_Conic(const gp_Circ2d & C);

		/****** IntAna2d_Conic::IntAna2d_Conic ******/
		/****** md5 signature: cc8c237d698de704f0c311935e6a006e ******/
		%feature("compactdefaultargs") IntAna2d_Conic;
		%feature("autodoc", "
Parameters
----------
C: gp_Lin2d

Return
-------
None

Description
-----------
No available documentation.
") IntAna2d_Conic;
		 IntAna2d_Conic(const gp_Lin2d & C);

		/****** IntAna2d_Conic::IntAna2d_Conic ******/
		/****** md5 signature: dc3d401a476c17ef729e92b901b6832a ******/
		%feature("compactdefaultargs") IntAna2d_Conic;
		%feature("autodoc", "
Parameters
----------
C: gp_Parab2d

Return
-------
None

Description
-----------
No available documentation.
") IntAna2d_Conic;
		 IntAna2d_Conic(const gp_Parab2d & C);

		/****** IntAna2d_Conic::IntAna2d_Conic ******/
		/****** md5 signature: c49b080858a00dce94792032daf89a73 ******/
		%feature("compactdefaultargs") IntAna2d_Conic;
		%feature("autodoc", "
Parameters
----------
C: gp_Hypr2d

Return
-------
None

Description
-----------
No available documentation.
") IntAna2d_Conic;
		 IntAna2d_Conic(const gp_Hypr2d & C);

		/****** IntAna2d_Conic::IntAna2d_Conic ******/
		/****** md5 signature: 9149df4da63ebac775adf949448bc8bc ******/
		%feature("compactdefaultargs") IntAna2d_Conic;
		%feature("autodoc", "
Parameters
----------
C: gp_Elips2d

Return
-------
None

Description
-----------
No available documentation.
") IntAna2d_Conic;
		 IntAna2d_Conic(const gp_Elips2d & C);

		/****** IntAna2d_Conic::Coefficients ******/
		/****** md5 signature: 2252ad010357f4e043a3c6dac4c3923c ******/
		%feature("compactdefaultargs") Coefficients;
		%feature("autodoc", "
Parameters
----------

Return
-------
A: float
B: float
C: float
D: float
E: float
F: float

Description
-----------
Returns the coefficients of the polynomial equation which defines the conic: a.x**2 + b.y**2 + 2.c.x*y + 2.d.x + 2.e.y + f = 0.
") Coefficients;
		void Coefficients(Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** IntAna2d_Conic::Grad ******/
		/****** md5 signature: fab3408de5afb58dce99f6aa5c4152b5 ******/
		%feature("compactdefaultargs") Grad;
		%feature("autodoc", "
Parameters
----------
X: float
Y: float

Return
-------
gp_XY

Description
-----------
Returns the value of the gradient of f at the point x,y.
") Grad;
		gp_XY Grad(const Standard_Real X, const Standard_Real Y);

		/****** IntAna2d_Conic::NewCoefficients ******/
		/****** md5 signature: 43b20979287d85f479f134cdb2bdaffb ******/
		%feature("compactdefaultargs") NewCoefficients;
		%feature("autodoc", "
Parameters
----------
Axis: gp_Ax2d

Return
-------
A: float
B: float
C: float
D: float
E: float
F: float

Description
-----------
Returns the coefficients of the polynomial equation ( written in the natural coordinates system ) a x x + b y y + 2 c x y + 2 d x + 2 e y + f in the local coordinates system defined by axis.
") NewCoefficients;
		void NewCoefficients(Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, const gp_Ax2d & Axis);

		/****** IntAna2d_Conic::ValAndGrad ******/
		/****** md5 signature: 4cccd607a6ebffe725629234066d2690 ******/
		%feature("compactdefaultargs") ValAndGrad;
		%feature("autodoc", "
Parameters
----------
X: float
Y: float
Grd: gp_XY

Return
-------
Val: float

Description
-----------
Returns the value of the function and its gradient at the point x,y.
") ValAndGrad;
		void ValAndGrad(const Standard_Real X, const Standard_Real Y, Standard_Real &OutValue, gp_XY & Grd);

		/****** IntAna2d_Conic::Value ******/
		/****** md5 signature: d4751a3c04cb161e61d710136c8f19f8 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
X: float
Y: float

Return
-------
float

Description
-----------
Value of the function f at the point x,y.
") Value;
		Standard_Real Value(const Standard_Real X, const Standard_Real Y);

};


%extend IntAna2d_Conic {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************
* class IntAna2d_IntPoint *
**************************/
class IntAna2d_IntPoint {
	public:
		/****** IntAna2d_IntPoint::IntAna2d_IntPoint ******/
		/****** md5 signature: a664088fc837857304d02def190138cc ******/
		%feature("compactdefaultargs") IntAna2d_IntPoint;
		%feature("autodoc", "
Parameters
----------
X: float
Y: float
U1: float
U2: float

Return
-------
None

Description
-----------
Create an intersection point between 2 parametric 2d lines. x,y are the coordinate of the point. u1 is the parameter on the first element, u2 the parameter on the second one.
") IntAna2d_IntPoint;
		 IntAna2d_IntPoint(const Standard_Real X, const Standard_Real Y, const Standard_Real U1, const Standard_Real U2);

		/****** IntAna2d_IntPoint::IntAna2d_IntPoint ******/
		/****** md5 signature: 395e78f829b07814c3d801cec5fdb0a4 ******/
		%feature("compactdefaultargs") IntAna2d_IntPoint;
		%feature("autodoc", "
Parameters
----------
X: float
Y: float
U1: float

Return
-------
None

Description
-----------
Create an intersection point between a parametric 2d line, and a line given by an implicit equation (implicitcurve). x,y are the coordinate of the point. u1 is the parameter on the parametric element. empty constructor. it's necessary to use one of the setvalue method after this one.
") IntAna2d_IntPoint;
		 IntAna2d_IntPoint(const Standard_Real X, const Standard_Real Y, const Standard_Real U1);

		/****** IntAna2d_IntPoint::IntAna2d_IntPoint ******/
		/****** md5 signature: fac6b176d68e164064e5809245a81d6f ******/
		%feature("compactdefaultargs") IntAna2d_IntPoint;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") IntAna2d_IntPoint;
		 IntAna2d_IntPoint();

		/****** IntAna2d_IntPoint::ParamOnFirst ******/
		/****** md5 signature: c1af1fad86dcc6635235f3d2a2efda3a ******/
		%feature("compactdefaultargs") ParamOnFirst;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the parameter on the first element.
") ParamOnFirst;
		Standard_Real ParamOnFirst();

		/****** IntAna2d_IntPoint::ParamOnSecond ******/
		/****** md5 signature: 4cf4e18e7ca9aa68a1f4328994d835d7 ******/
		%feature("compactdefaultargs") ParamOnSecond;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the parameter on the second element. if the second element is an implicit curve, an exception is raised.
") ParamOnSecond;
		Standard_Real ParamOnSecond();

		/****** IntAna2d_IntPoint::SecondIsImplicit ******/
		/****** md5 signature: d91e86ec9ad759069f09f0c15a313307 ******/
		%feature("compactdefaultargs") SecondIsImplicit;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if the second curve is implicit.
") SecondIsImplicit;
		Standard_Boolean SecondIsImplicit();

		/****** IntAna2d_IntPoint::SetValue ******/
		/****** md5 signature: 161ed5d10041650cc5f51b4c516e645b ******/
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "
Parameters
----------
X: float
Y: float
U1: float
U2: float

Return
-------
None

Description
-----------
Set the values for a 'non-implicit' point.
") SetValue;
		virtual void SetValue(const Standard_Real X, const Standard_Real Y, const Standard_Real U1, const Standard_Real U2);

		/****** IntAna2d_IntPoint::SetValue ******/
		/****** md5 signature: 32aee4519c3bd8ef006fa6e74c4c2db4 ******/
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "
Parameters
----------
X: float
Y: float
U1: float

Return
-------
None

Description
-----------
Set the values for an 'implicit' point.
") SetValue;
		virtual void SetValue(const Standard_Real X, const Standard_Real Y, const Standard_Real U1);

		/****** IntAna2d_IntPoint::Value ******/
		/****** md5 signature: 01b97600ad700e4edb97bc6008ad0c9b ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Return
-------
gp_Pnt2d

Description
-----------
Returns the geometric point.
") Value;
		const gp_Pnt2d Value();

};


%extend IntAna2d_IntPoint {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************
* class MyDirectPolynomialRoots *
********************************/
/* harray1 classes */
/* harray2 classes */
/* hsequence classes */
/* class aliases */
%pythoncode {
}
