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
%define INTANA2DDOCSTRING
"IntAna2d module, see official documentation at
https://www.opencascade.com/doc/occt-7.4.0/refman/html/package_intana2d.html"
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
%include ../common/Operators.i
%include ../common/OccHandle.i


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

/* python proy classes for enums */
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
		/****************** IntAna2d_AnaIntersection ******************/
		%feature("compactdefaultargs") IntAna2d_AnaIntersection;
		%feature("autodoc", "Empty constructor. isdone returns false.

Returns
-------
None
") IntAna2d_AnaIntersection;
		 IntAna2d_AnaIntersection();

		/****************** IntAna2d_AnaIntersection ******************/
		%feature("compactdefaultargs") IntAna2d_AnaIntersection;
		%feature("autodoc", "Intersection between two lines.

Parameters
----------
L1: gp_Lin2d
L2: gp_Lin2d

Returns
-------
None
") IntAna2d_AnaIntersection;
		 IntAna2d_AnaIntersection(const gp_Lin2d & L1, const gp_Lin2d & L2);

		/****************** IntAna2d_AnaIntersection ******************/
		%feature("compactdefaultargs") IntAna2d_AnaIntersection;
		%feature("autodoc", "Intersection between two circles.

Parameters
----------
C1: gp_Circ2d
C2: gp_Circ2d

Returns
-------
None
") IntAna2d_AnaIntersection;
		 IntAna2d_AnaIntersection(const gp_Circ2d & C1, const gp_Circ2d & C2);

		/****************** IntAna2d_AnaIntersection ******************/
		%feature("compactdefaultargs") IntAna2d_AnaIntersection;
		%feature("autodoc", "Intersection between a line and a circle.

Parameters
----------
L: gp_Lin2d
C: gp_Circ2d

Returns
-------
None
") IntAna2d_AnaIntersection;
		 IntAna2d_AnaIntersection(const gp_Lin2d & L, const gp_Circ2d & C);

		/****************** IntAna2d_AnaIntersection ******************/
		%feature("compactdefaultargs") IntAna2d_AnaIntersection;
		%feature("autodoc", "Intersection between a line and a conic.

Parameters
----------
L: gp_Lin2d
C: IntAna2d_Conic

Returns
-------
None
") IntAna2d_AnaIntersection;
		 IntAna2d_AnaIntersection(const gp_Lin2d & L, const IntAna2d_Conic & C);

		/****************** IntAna2d_AnaIntersection ******************/
		%feature("compactdefaultargs") IntAna2d_AnaIntersection;
		%feature("autodoc", "Intersection between a circle and another conic.

Parameters
----------
C: gp_Circ2d
Co: IntAna2d_Conic

Returns
-------
None
") IntAna2d_AnaIntersection;
		 IntAna2d_AnaIntersection(const gp_Circ2d & C, const IntAna2d_Conic & Co);

		/****************** IntAna2d_AnaIntersection ******************/
		%feature("compactdefaultargs") IntAna2d_AnaIntersection;
		%feature("autodoc", "Intersection between an ellipse and another conic.

Parameters
----------
E: gp_Elips2d
C: IntAna2d_Conic

Returns
-------
None
") IntAna2d_AnaIntersection;
		 IntAna2d_AnaIntersection(const gp_Elips2d & E, const IntAna2d_Conic & C);

		/****************** IntAna2d_AnaIntersection ******************/
		%feature("compactdefaultargs") IntAna2d_AnaIntersection;
		%feature("autodoc", "Intersection between a parabola and another conic.

Parameters
----------
P: gp_Parab2d
C: IntAna2d_Conic

Returns
-------
None
") IntAna2d_AnaIntersection;
		 IntAna2d_AnaIntersection(const gp_Parab2d & P, const IntAna2d_Conic & C);

		/****************** IntAna2d_AnaIntersection ******************/
		%feature("compactdefaultargs") IntAna2d_AnaIntersection;
		%feature("autodoc", "Intersection between an hyperbola and another conic.

Parameters
----------
H: gp_Hypr2d
C: IntAna2d_Conic

Returns
-------
None
") IntAna2d_AnaIntersection;
		 IntAna2d_AnaIntersection(const gp_Hypr2d & H, const IntAna2d_Conic & C);

		/****************** IdenticalElements ******************/
		%feature("compactdefaultargs") IdenticalElements;
		%feature("autodoc", "For the intersection between an element of gp and a conic known by an implicit equation, the result will be true if the element of gp verifies the implicit equation. for the intersection between two lin2d or two circ2d, the result will be true if the elements are identical. the function returns false in all the other cases.

Returns
-------
bool
") IdenticalElements;
		Standard_Boolean IdenticalElements();

		/****************** IsDone ******************/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Returns true if the computation was succesfull.

Returns
-------
bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** IsEmpty ******************/
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "Returns true when there is no intersection, i-e - no intersection point - the elements are not identical. the element may be parallel in this case.

Returns
-------
bool
") IsEmpty;
		Standard_Boolean IsEmpty();

		/****************** NbPoints ******************/
		%feature("compactdefaultargs") NbPoints;
		%feature("autodoc", "Returns the number of intpoint between the 2 curves.

Returns
-------
int
") NbPoints;
		Standard_Integer NbPoints();

		/****************** ParallelElements ******************/
		%feature("compactdefaultargs") ParallelElements;
		%feature("autodoc", "For the intersection between two lin2d or two circ2d, the function returns true if the elements are parallel. the function returns false in all the other cases.

Returns
-------
bool
") ParallelElements;
		Standard_Boolean ParallelElements();

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Intersection between two lines.

Parameters
----------
L1: gp_Lin2d
L2: gp_Lin2d

Returns
-------
None
") Perform;
		void Perform(const gp_Lin2d & L1, const gp_Lin2d & L2);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Intersection between two circles.

Parameters
----------
C1: gp_Circ2d
C2: gp_Circ2d

Returns
-------
None
") Perform;
		void Perform(const gp_Circ2d & C1, const gp_Circ2d & C2);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Intersection between a line and a circle.

Parameters
----------
L: gp_Lin2d
C: gp_Circ2d

Returns
-------
None
") Perform;
		void Perform(const gp_Lin2d & L, const gp_Circ2d & C);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Intersection between a line and a conic.

Parameters
----------
L: gp_Lin2d
C: IntAna2d_Conic

Returns
-------
None
") Perform;
		void Perform(const gp_Lin2d & L, const IntAna2d_Conic & C);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Intersection between a circle and another conic.

Parameters
----------
C: gp_Circ2d
Co: IntAna2d_Conic

Returns
-------
None
") Perform;
		void Perform(const gp_Circ2d & C, const IntAna2d_Conic & Co);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Intersection between an ellipse and another conic.

Parameters
----------
E: gp_Elips2d
C: IntAna2d_Conic

Returns
-------
None
") Perform;
		void Perform(const gp_Elips2d & E, const IntAna2d_Conic & C);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Intersection between a parabola and another conic.

Parameters
----------
P: gp_Parab2d
C: IntAna2d_Conic

Returns
-------
None
") Perform;
		void Perform(const gp_Parab2d & P, const IntAna2d_Conic & C);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Intersection between an hyperbola and another conic.

Parameters
----------
H: gp_Hypr2d
C: IntAna2d_Conic

Returns
-------
None
") Perform;
		void Perform(const gp_Hypr2d & H, const IntAna2d_Conic & C);

		/****************** Point ******************/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "Returns the intersection point of range n; if (n<=0) or (n>nbpoints), an exception is raised.

Parameters
----------
N: int

Returns
-------
IntAna2d_IntPoint
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
		/****************** IntAna2d_Conic ******************/
		%feature("compactdefaultargs") IntAna2d_Conic;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: gp_Circ2d

Returns
-------
None
") IntAna2d_Conic;
		 IntAna2d_Conic(const gp_Circ2d & C);

		/****************** IntAna2d_Conic ******************/
		%feature("compactdefaultargs") IntAna2d_Conic;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: gp_Lin2d

Returns
-------
None
") IntAna2d_Conic;
		 IntAna2d_Conic(const gp_Lin2d & C);

		/****************** IntAna2d_Conic ******************/
		%feature("compactdefaultargs") IntAna2d_Conic;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: gp_Parab2d

Returns
-------
None
") IntAna2d_Conic;
		 IntAna2d_Conic(const gp_Parab2d & C);

		/****************** IntAna2d_Conic ******************/
		%feature("compactdefaultargs") IntAna2d_Conic;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: gp_Hypr2d

Returns
-------
None
") IntAna2d_Conic;
		 IntAna2d_Conic(const gp_Hypr2d & C);

		/****************** IntAna2d_Conic ******************/
		%feature("compactdefaultargs") IntAna2d_Conic;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: gp_Elips2d

Returns
-------
None
") IntAna2d_Conic;
		 IntAna2d_Conic(const gp_Elips2d & C);

		/****************** Coefficients ******************/
		%feature("compactdefaultargs") Coefficients;
		%feature("autodoc", "Returns the coefficients of the polynomial equation wich defines the conic: a.x**2 + b.y**2 + 2.c.x*y + 2.d.x + 2.e.y + f = 0.

Parameters
----------

Returns
-------
A: float
B: float
C: float
D: float
E: float
F: float
") Coefficients;
		void Coefficients(Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** Grad ******************/
		%feature("compactdefaultargs") Grad;
		%feature("autodoc", "Returns the value of the gradient of f at the point x,y.

Parameters
----------
X: float
Y: float

Returns
-------
gp_XY
") Grad;
		gp_XY Grad(const Standard_Real X, const Standard_Real Y);

		/****************** NewCoefficients ******************/
		%feature("compactdefaultargs") NewCoefficients;
		%feature("autodoc", "Returns the coefficients of the polynomial equation ( written in the natural coordinates system ) a x x + b y y + 2 c x y + 2 d x + 2 e y + f in the local coordinates system defined by axis.

Parameters
----------
Axis: gp_Ax2d

Returns
-------
A: float
B: float
C: float
D: float
E: float
F: float
") NewCoefficients;
		void NewCoefficients(Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, const gp_Ax2d & Axis);

		/****************** ValAndGrad ******************/
		%feature("compactdefaultargs") ValAndGrad;
		%feature("autodoc", "Returns the value of the function and its gradient at the point x,y.

Parameters
----------
X: float
Y: float
Grd: gp_XY

Returns
-------
Val: float
") ValAndGrad;
		void ValAndGrad(const Standard_Real X, const Standard_Real Y, Standard_Real &OutValue, gp_XY & Grd);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Value of the function f at the point x,y.

Parameters
----------
X: float
Y: float

Returns
-------
float
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
		/****************** IntAna2d_IntPoint ******************/
		%feature("compactdefaultargs") IntAna2d_IntPoint;
		%feature("autodoc", "Create an intersection point between 2 parametric 2d lines. x,y are the coordinate of the point. u1 is the parameter on the first element, u2 the parameter on the second one.

Parameters
----------
X: float
Y: float
U1: float
U2: float

Returns
-------
None
") IntAna2d_IntPoint;
		 IntAna2d_IntPoint(const Standard_Real X, const Standard_Real Y, const Standard_Real U1, const Standard_Real U2);

		/****************** IntAna2d_IntPoint ******************/
		%feature("compactdefaultargs") IntAna2d_IntPoint;
		%feature("autodoc", "Create an intersection point between a parametric 2d line, and a line given by an implicit equation (implicitcurve). x,y are the coordinate of the point. u1 is the parameter on the parametric element. empty constructor. it's necessary to use one of the setvalue method after this one.

Parameters
----------
X: float
Y: float
U1: float

Returns
-------
None
") IntAna2d_IntPoint;
		 IntAna2d_IntPoint(const Standard_Real X, const Standard_Real Y, const Standard_Real U1);

		/****************** IntAna2d_IntPoint ******************/
		%feature("compactdefaultargs") IntAna2d_IntPoint;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") IntAna2d_IntPoint;
		 IntAna2d_IntPoint();

		/****************** ParamOnFirst ******************/
		%feature("compactdefaultargs") ParamOnFirst;
		%feature("autodoc", "Returns the parameter on the first element.

Returns
-------
float
") ParamOnFirst;
		Standard_Real ParamOnFirst();

		/****************** ParamOnSecond ******************/
		%feature("compactdefaultargs") ParamOnSecond;
		%feature("autodoc", "Returns the parameter on the second element. if the second element is an implicit curve, an exception is raised.

Returns
-------
float
") ParamOnSecond;
		Standard_Real ParamOnSecond();

		/****************** SecondIsImplicit ******************/
		%feature("compactdefaultargs") SecondIsImplicit;
		%feature("autodoc", "Returns true if the second curve is implicit.

Returns
-------
bool
") SecondIsImplicit;
		Standard_Boolean SecondIsImplicit();

		/****************** SetValue ******************/
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "Set the values for a 'non-implicit' point.

Parameters
----------
X: float
Y: float
U1: float
U2: float

Returns
-------
None
") SetValue;
		virtual void SetValue(const Standard_Real X, const Standard_Real Y, const Standard_Real U1, const Standard_Real U2);

		/****************** SetValue ******************/
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "Set the values for an 'implicit' point.

Parameters
----------
X: float
Y: float
U1: float

Returns
-------
None
") SetValue;
		virtual void SetValue(const Standard_Real X, const Standard_Real Y, const Standard_Real U1);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Returns the geometric point.

Returns
-------
gp_Pnt2d
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
