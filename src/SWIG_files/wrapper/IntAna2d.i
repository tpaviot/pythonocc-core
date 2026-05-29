/*
Copyright 2008-2026 Thomas Paviot (tpaviot@gmail.com)

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
https://dev.opencascade.org/doc/occt-7.9.0/refman/html/package_intana2d.html"
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
Empty constructor. IsDone returns False.
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
		/****** md5 signature: 39f98348f556a7b58c7b4a84a940baee ******/
		%feature("compactdefaultargs") IdenticalElements;
		%feature("autodoc", "Return
-------
bool

Description
-----------
For the intersection between an element of gp and a conic known by an implicit equation, the result will be True if the element of gp verifies the implicit equation. For the intersection between two Lin2d or two Circ2d, the result will be True if the elements are identical. The function returns False in all the other cases.
") IdenticalElements;
		bool IdenticalElements();

		/****** IntAna2d_AnaIntersection::IsDone ******/
		/****** md5 signature: 1e1ad145af7d8c16b253ee9a4b0d6a43 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if the computation was successful.
") IsDone;
		bool IsDone();

		/****** IntAna2d_AnaIntersection::IsEmpty ******/
		/****** md5 signature: 03c43b1186186edcd7d757f16ac1f505 ******/
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True when there is no intersection, i-e - no intersection point - the elements are not identical. The element may be parallel in this case.
") IsEmpty;
		bool IsEmpty();

		/****** IntAna2d_AnaIntersection::NbPoints ******/
		/****** md5 signature: 0243a6484ef0942dcad871f7c247b5de ******/
		%feature("compactdefaultargs") NbPoints;
		%feature("autodoc", "Return
-------
int

Description
-----------
returns the number of IntPoint between the 2 curves.
") NbPoints;
		int NbPoints();

		/****** IntAna2d_AnaIntersection::ParallelElements ******/
		/****** md5 signature: 90fddaf9ca62f63e0fac2841b170b581 ******/
		%feature("compactdefaultargs") ParallelElements;
		%feature("autodoc", "Return
-------
bool

Description
-----------
For the intersection between two Lin2d or two Circ2d, the function returns True if the elements are parallel. The function returns False in all the other cases.
") ParallelElements;
		bool ParallelElements();

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
		/****** md5 signature: 22aab88373074b7cecbed0f295b0b7d5 ******/
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
returns the intersection point of range N; If (N<=0) or (N>NbPoints), an exception is raised.
") Point;
		const IntAna2d_IntPoint & Point(const int N);

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
		/****** md5 signature: df4d22732c5ce1c6300c798a446c6774 ******/
		%feature("compactdefaultargs") Coefficients;
		%feature("autodoc", "
Parameters
----------

Return
-------
A: double
B: double
C: double
D: double
E: double
F: double

Description
-----------
returns the coefficients of the polynomial equation which defines the conic: A.X**2 + B.Y**2 + 2.C.X*Y + 2.D.X + 2.E.Y + F = 0.
") Coefficients;
		void Coefficients(Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** IntAna2d_Conic::Grad ******/
		/****** md5 signature: 1888bc418a7aff0c037dff7db130c0b6 ******/
		%feature("compactdefaultargs") Grad;
		%feature("autodoc", "
Parameters
----------
X: double
Y: double

Return
-------
gp_XY

Description
-----------
returns the value of the gradient of F at the point X,Y.
") Grad;
		gp_XY Grad(const double X, const double Y);

		/****** IntAna2d_Conic::NewCoefficients ******/
		/****** md5 signature: fdc91b5e96d6ebc22c69bac06f950a84 ******/
		%feature("compactdefaultargs") NewCoefficients;
		%feature("autodoc", "
Parameters
----------
Axis: gp_Ax2d

Return
-------
A: double
B: double
C: double
D: double
E: double
F: double

Description
-----------
Returns the coefficients of the polynomial equation ( written in the natural coordinates system ) A x x + B y y + 2 C x y + 2 D x + 2 E y + F in the local coordinates system defined by Axis.
") NewCoefficients;
		void NewCoefficients(Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, const gp_Ax2d & Axis);

		/****** IntAna2d_Conic::ValAndGrad ******/
		/****** md5 signature: aadb62dd80daa6d4fa5a7cdf7f85c1c9 ******/
		%feature("compactdefaultargs") ValAndGrad;
		%feature("autodoc", "
Parameters
----------
X: double
Y: double
Grd: gp_XY

Return
-------
Val: double

Description
-----------
Returns the value of the function and its gradient at the point X,Y.
") ValAndGrad;
		void ValAndGrad(const double X, const double Y, Standard_Real &OutValue, gp_XY & Grd);

		/****** IntAna2d_Conic::Value ******/
		/****** md5 signature: b45cdad5f35d818d45f06bc275bc8b13 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
X: double
Y: double

Return
-------
double

Description
-----------
value of the function F at the point X,Y.
") Value;
		double Value(const double X, const double Y);

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
		/****** md5 signature: e33f82e0621de2abdadf813f407021dc ******/
		%feature("compactdefaultargs") IntAna2d_IntPoint;
		%feature("autodoc", "
Parameters
----------
X: double
Y: double
U1: double
U2: double

Return
-------
None

Description
-----------
Create an intersection point between 2 parametric 2d lines. X,Y are the coordinate of the point. U1 is the parameter on the first element, U2 the parameter on the second one.
") IntAna2d_IntPoint;
		 IntAna2d_IntPoint(const double X, const double Y, const double U1, const double U2);

		/****** IntAna2d_IntPoint::IntAna2d_IntPoint ******/
		/****** md5 signature: 7fd7c66dd2364c93979dea725e6cdce5 ******/
		%feature("compactdefaultargs") IntAna2d_IntPoint;
		%feature("autodoc", "
Parameters
----------
X: double
Y: double
U1: double

Return
-------
None

Description
-----------
Create an intersection point between a parametric 2d line, and a line given by an implicit equation (ImplicitCurve). X,Y are the coordinate of the point. U1 is the parameter on the parametric element. Empty constructor. It's necessary to use one of the SetValue method after this one.
") IntAna2d_IntPoint;
		 IntAna2d_IntPoint(const double X, const double Y, const double U1);

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
		/****** md5 signature: 2f88afb75508f4b380339ca1dd478625 ******/
		%feature("compactdefaultargs") ParamOnFirst;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns the parameter on the first element.
") ParamOnFirst;
		double ParamOnFirst();

		/****** IntAna2d_IntPoint::ParamOnSecond ******/
		/****** md5 signature: 6368db0882aa68546b85e64558fde976 ******/
		%feature("compactdefaultargs") ParamOnSecond;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns the parameter on the second element. If the second element is an implicit curve, an exception is raised.
") ParamOnSecond;
		double ParamOnSecond();

		/****** IntAna2d_IntPoint::SecondIsImplicit ******/
		/****** md5 signature: 8571fc9febe69124b0523f8383bb3a4b ******/
		%feature("compactdefaultargs") SecondIsImplicit;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if the second curve is implicit.
") SecondIsImplicit;
		bool SecondIsImplicit();

		/****** IntAna2d_IntPoint::SetValue ******/
		/****** md5 signature: e93699215fc0b195b3b91a3ff3dce8b8 ******/
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "
Parameters
----------
X: double
Y: double
U1: double
U2: double

Return
-------
None

Description
-----------
Set the values for a 'non-implicit' point.
") SetValue;
		virtual void SetValue(const double X, const double Y, const double U1, const double U2);

		/****** IntAna2d_IntPoint::SetValue ******/
		/****** md5 signature: f7b5be71406fbb707941e212d43625de ******/
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "
Parameters
----------
X: double
Y: double
U1: double

Return
-------
None

Description
-----------
Set the values for an 'implicit' point.
") SetValue;
		virtual void SetValue(const double X, const double Y, const double U1);

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
