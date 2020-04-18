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
%define GEOM2DLPROPDOCSTRING
"Geom2dLProp module, see official documentation at
https://www.opencascade.com/doc/occt-7.4.0/refman/html/package_geom2dlprop.html"
%enddef
%module (package="OCC.Core", docstring=GEOM2DLPROPDOCSTRING) Geom2dLProp


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
#include<Geom2dLProp_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<Geom2d_module.hxx>
#include<gp_module.hxx>
#include<LProp_module.hxx>
#include<math_module.hxx>
#include<Message_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import Geom2d.i
%import gp.i
%import LProp.i
%import math.i

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

/******************************
* class Geom2dLProp_CLProps2d *
******************************/
class Geom2dLProp_CLProps2d {
	public:
		/****************** Geom2dLProp_CLProps2d ******************/
		%feature("compactdefaultargs") Geom2dLProp_CLProps2d;
		%feature("autodoc", "Initializes the local properties of the curve <c> the current point and the derivatives are computed at the same time, which allows an optimization of the computation time. <n> indicates the maximum number of derivations to be done (0, 1, 2 or 3). for example, to compute only the tangent, n should be equal to 1. <resolution> is the linear tolerance (it is used to test if a vector is null).

Parameters
----------
C: Geom2d_Curve
N: int
Resolution: float

Returns
-------
None
") Geom2dLProp_CLProps2d;
		 Geom2dLProp_CLProps2d(const opencascade::handle<Geom2d_Curve> & C, const Standard_Integer N, const Standard_Real Resolution);

		/****************** Geom2dLProp_CLProps2d ******************/
		%feature("compactdefaultargs") Geom2dLProp_CLProps2d;
		%feature("autodoc", "Same as previous constructor but here the parameter is set to the value <u>. all the computations done will be related to <c> and <u>.

Parameters
----------
C: Geom2d_Curve
U: float
N: int
Resolution: float

Returns
-------
None
") Geom2dLProp_CLProps2d;
		 Geom2dLProp_CLProps2d(const opencascade::handle<Geom2d_Curve> & C, const Standard_Real U, const Standard_Integer N, const Standard_Real Resolution);

		/****************** Geom2dLProp_CLProps2d ******************/
		%feature("compactdefaultargs") Geom2dLProp_CLProps2d;
		%feature("autodoc", "Same as previous constructor but here the parameter is set to the value <u> and the curve is set with setcurve. the curve can have a empty constructor all the computations done will be related to <c> and <u> when the functions 'set' will be done.

Parameters
----------
N: int
Resolution: float

Returns
-------
None
") Geom2dLProp_CLProps2d;
		 Geom2dLProp_CLProps2d(const Standard_Integer N, const Standard_Real Resolution);

		/****************** CentreOfCurvature ******************/
		%feature("compactdefaultargs") CentreOfCurvature;
		%feature("autodoc", "Returns the centre of curvature <p>.

Parameters
----------
P: gp_Pnt2d

Returns
-------
None
") CentreOfCurvature;
		void CentreOfCurvature(gp_Pnt2d & P);

		/****************** Curvature ******************/
		%feature("compactdefaultargs") Curvature;
		%feature("autodoc", "Returns the curvature.

Returns
-------
float
") Curvature;
		Standard_Real Curvature();

		/****************** D1 ******************/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "Returns the first derivative. the derivative is computed if it has not been yet.

Returns
-------
gp_Vec2d
") D1;
		const gp_Vec2d D1();

		/****************** D2 ******************/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "Returns the second derivative. the derivative is computed if it has not been yet.

Returns
-------
gp_Vec2d
") D2;
		const gp_Vec2d D2();

		/****************** D3 ******************/
		%feature("compactdefaultargs") D3;
		%feature("autodoc", "Returns the third derivative. the derivative is computed if it has not been yet.

Returns
-------
gp_Vec2d
") D3;
		const gp_Vec2d D3();

		/****************** IsTangentDefined ******************/
		%feature("compactdefaultargs") IsTangentDefined;
		%feature("autodoc", "Returns true if the tangent is defined. for example, the tangent is not defined if the three first derivatives are all null.

Returns
-------
bool
") IsTangentDefined;
		Standard_Boolean IsTangentDefined();

		/****************** Normal ******************/
		%feature("compactdefaultargs") Normal;
		%feature("autodoc", "Returns the normal direction <n>.

Parameters
----------
N: gp_Dir2d

Returns
-------
None
") Normal;
		void Normal(gp_Dir2d & N);

		/****************** SetCurve ******************/
		%feature("compactdefaultargs") SetCurve;
		%feature("autodoc", "Initializes the local properties of the curve for the new curve.

Parameters
----------
C: Geom2d_Curve

Returns
-------
None
") SetCurve;
		void SetCurve(const opencascade::handle<Geom2d_Curve> & C);

		/****************** SetParameter ******************/
		%feature("compactdefaultargs") SetParameter;
		%feature("autodoc", "Initializes the local properties of the curve for the parameter value <u>.

Parameters
----------
U: float

Returns
-------
None
") SetParameter;
		void SetParameter(const Standard_Real U);

		/****************** Tangent ******************/
		%feature("compactdefaultargs") Tangent;
		%feature("autodoc", "Output the tangent direction <d>.

Parameters
----------
D: gp_Dir2d

Returns
-------
None
") Tangent;
		void Tangent(gp_Dir2d & D);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Returns the point.

Returns
-------
gp_Pnt2d
") Value;
		const gp_Pnt2d Value();

};


%extend Geom2dLProp_CLProps2d {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************
* class Geom2dLProp_CurAndInf2d *
********************************/
class Geom2dLProp_CurAndInf2d : public LProp_CurAndInf {
	public:
		/****************** Geom2dLProp_CurAndInf2d ******************/
		%feature("compactdefaultargs") Geom2dLProp_CurAndInf2d;
		%feature("autodoc", "Initializes the framework. note: the curve on which the local properties are computed is defined using one of the following functions: perform, performcurext or performinf.

Returns
-------
None
") Geom2dLProp_CurAndInf2d;
		 Geom2dLProp_CurAndInf2d();

		/****************** IsDone ******************/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "True if the solutions are found.

Returns
-------
bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "For the curve c, computes both the inflection points and the maximum and minimum curvatures.

Parameters
----------
C: Geom2d_Curve

Returns
-------
None
") Perform;
		void Perform(const opencascade::handle<Geom2d_Curve> & C);

		/****************** PerformCurExt ******************/
		%feature("compactdefaultargs") PerformCurExt;
		%feature("autodoc", "For the curve c, computes the locals extremas of curvature.

Parameters
----------
C: Geom2d_Curve

Returns
-------
None
") PerformCurExt;
		void PerformCurExt(const opencascade::handle<Geom2d_Curve> & C);

		/****************** PerformInf ******************/
		%feature("compactdefaultargs") PerformInf;
		%feature("autodoc", "For the curve c, computes the inflections. after computation, the following functions can be used: - isdone to check if the computation was successful - nbpoints to obtain the number of computed particular points - parameter to obtain the parameter on the curve for each particular point - type to check if the point is an inflection point or an extremum of curvature of the curve c. warning these functions can be used to analyze a series of curves, however it is necessary to clear the table of results between each computation.

Parameters
----------
C: Geom2d_Curve

Returns
-------
None
") PerformInf;
		void PerformInf(const opencascade::handle<Geom2d_Curve> & C);

};


%extend Geom2dLProp_CurAndInf2d {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************
* class Geom2dLProp_Curve2dTool *
********************************/
class Geom2dLProp_Curve2dTool {
	public:
		/****************** Continuity ******************/
		%feature("compactdefaultargs") Continuity;
		%feature("autodoc", "Returns the order of continuity of the curve <c>. returns 1 : first derivative only is computable returns 2 : first and second derivative only are computable. returns 3 : first, second and third are computable.

Parameters
----------
C: Geom2d_Curve

Returns
-------
int
") Continuity;
		static Standard_Integer Continuity(const opencascade::handle<Geom2d_Curve> & C);

		/****************** D1 ******************/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "Computes the point <p> and first derivative <v1> of parameter <u> on the curve <c>.

Parameters
----------
C: Geom2d_Curve
U: float
P: gp_Pnt2d
V1: gp_Vec2d

Returns
-------
None
") D1;
		static void D1(const opencascade::handle<Geom2d_Curve> & C, const Standard_Real U, gp_Pnt2d & P, gp_Vec2d & V1);

		/****************** D2 ******************/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "Computes the point <p>, the first derivative <v1> and second derivative <v2> of parameter <u> on the curve <c>.

Parameters
----------
C: Geom2d_Curve
U: float
P: gp_Pnt2d
V1: gp_Vec2d
V2: gp_Vec2d

Returns
-------
None
") D2;
		static void D2(const opencascade::handle<Geom2d_Curve> & C, const Standard_Real U, gp_Pnt2d & P, gp_Vec2d & V1, gp_Vec2d & V2);

		/****************** D3 ******************/
		%feature("compactdefaultargs") D3;
		%feature("autodoc", "Computes the point <p>, the first derivative <v1>, the second derivative <v2> and third derivative <v3> of parameter <u> on the curve <c>.

Parameters
----------
C: Geom2d_Curve
U: float
P: gp_Pnt2d
V1: gp_Vec2d
V2: gp_Vec2d
V3: gp_Vec2d

Returns
-------
None
") D3;
		static void D3(const opencascade::handle<Geom2d_Curve> & C, const Standard_Real U, gp_Pnt2d & P, gp_Vec2d & V1, gp_Vec2d & V2, gp_Vec2d & V3);

		/****************** FirstParameter ******************/
		%feature("compactdefaultargs") FirstParameter;
		%feature("autodoc", "Returns the first parameter bound of the curve.

Parameters
----------
C: Geom2d_Curve

Returns
-------
float
") FirstParameter;
		static Standard_Real FirstParameter(const opencascade::handle<Geom2d_Curve> & C);

		/****************** LastParameter ******************/
		%feature("compactdefaultargs") LastParameter;
		%feature("autodoc", "Returns the last parameter bound of the curve. firstparameter must be less than lastparameter.

Parameters
----------
C: Geom2d_Curve

Returns
-------
float
") LastParameter;
		static Standard_Real LastParameter(const opencascade::handle<Geom2d_Curve> & C);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Computes the point <p> of parameter <u> on the curve <c>.

Parameters
----------
C: Geom2d_Curve
U: float
P: gp_Pnt2d

Returns
-------
None
") Value;
		static void Value(const opencascade::handle<Geom2d_Curve> & C, const Standard_Real U, gp_Pnt2d & P);

};


%extend Geom2dLProp_Curve2dTool {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************
* class Geom2dLProp_FuncCurExt *
*******************************/
class Geom2dLProp_FuncCurExt : public math_FunctionWithDerivative {
	public:
		/****************** Geom2dLProp_FuncCurExt ******************/
		%feature("compactdefaultargs") Geom2dLProp_FuncCurExt;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: Geom2d_Curve
Tol: float

Returns
-------
None
") Geom2dLProp_FuncCurExt;
		 Geom2dLProp_FuncCurExt(const opencascade::handle<Geom2d_Curve> & C, const Standard_Real Tol);

		/****************** Derivative ******************/
		%feature("compactdefaultargs") Derivative;
		%feature("autodoc", "Returns the derivative for the variable <x>.

Parameters
----------
X: float

Returns
-------
D: float
") Derivative;
		Standard_Boolean Derivative(const Standard_Real X, Standard_Real &OutValue);

		/****************** IsMinKC ******************/
		%feature("compactdefaultargs") IsMinKC;
		%feature("autodoc", "True if param corresponds to a minus of the radius of curvature.

Parameters
----------
Param: float

Returns
-------
bool
") IsMinKC;
		Standard_Boolean IsMinKC(const Standard_Real Param);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Returns the value for the variable <x>.

Parameters
----------
X: float

Returns
-------
F: float
") Value;
		Standard_Boolean Value(const Standard_Real X, Standard_Real &OutValue);

		/****************** Values ******************/
		%feature("compactdefaultargs") Values;
		%feature("autodoc", "Returns the value of the function and the derivative for the variable <x>.

Parameters
----------
X: float

Returns
-------
F: float
D: float
") Values;
		Standard_Boolean Values(const Standard_Real X, Standard_Real &OutValue, Standard_Real &OutValue);

};


%extend Geom2dLProp_FuncCurExt {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************
* class Geom2dLProp_FuncCurNul *
*******************************/
class Geom2dLProp_FuncCurNul : public math_FunctionWithDerivative {
	public:
		/****************** Geom2dLProp_FuncCurNul ******************/
		%feature("compactdefaultargs") Geom2dLProp_FuncCurNul;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: Geom2d_Curve

Returns
-------
None
") Geom2dLProp_FuncCurNul;
		 Geom2dLProp_FuncCurNul(const opencascade::handle<Geom2d_Curve> & C);

		/****************** Derivative ******************/
		%feature("compactdefaultargs") Derivative;
		%feature("autodoc", "Returns the derivative for the variable <x>.

Parameters
----------
X: float

Returns
-------
D: float
") Derivative;
		Standard_Boolean Derivative(const Standard_Real X, Standard_Real &OutValue);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Returns the value for the variable <x>.

Parameters
----------
X: float

Returns
-------
F: float
") Value;
		Standard_Boolean Value(const Standard_Real X, Standard_Real &OutValue);

		/****************** Values ******************/
		%feature("compactdefaultargs") Values;
		%feature("autodoc", "Returns the value of the function and the derivative for the variable <x>.

Parameters
----------
X: float

Returns
-------
F: float
D: float
") Values;
		Standard_Boolean Values(const Standard_Real X, Standard_Real &OutValue, Standard_Real &OutValue);

};


%extend Geom2dLProp_FuncCurNul {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************************
* class Geom2dLProp_NumericCurInf2d *
************************************/
class Geom2dLProp_NumericCurInf2d {
	public:
		/****************** Geom2dLProp_NumericCurInf2d ******************/
		%feature("compactdefaultargs") Geom2dLProp_NumericCurInf2d;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Geom2dLProp_NumericCurInf2d;
		 Geom2dLProp_NumericCurInf2d();

		/****************** IsDone ******************/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "True if the solutions are found.

Returns
-------
bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** PerformCurExt ******************/
		%feature("compactdefaultargs") PerformCurExt;
		%feature("autodoc", "Computes the locals extremas of curvature.

Parameters
----------
C: Geom2d_Curve
Result: LProp_CurAndInf

Returns
-------
None
") PerformCurExt;
		void PerformCurExt(const opencascade::handle<Geom2d_Curve> & C, LProp_CurAndInf & Result);

		/****************** PerformCurExt ******************/
		%feature("compactdefaultargs") PerformCurExt;
		%feature("autodoc", "Computes the locals extremas of curvature. in the interval of parmeters [umin,umax].

Parameters
----------
C: Geom2d_Curve
UMin: float
UMax: float
Result: LProp_CurAndInf

Returns
-------
None
") PerformCurExt;
		void PerformCurExt(const opencascade::handle<Geom2d_Curve> & C, const Standard_Real UMin, const Standard_Real UMax, LProp_CurAndInf & Result);

		/****************** PerformInf ******************/
		%feature("compactdefaultargs") PerformInf;
		%feature("autodoc", "Computes the inflections.

Parameters
----------
C: Geom2d_Curve
Result: LProp_CurAndInf

Returns
-------
None
") PerformInf;
		void PerformInf(const opencascade::handle<Geom2d_Curve> & C, LProp_CurAndInf & Result);

		/****************** PerformInf ******************/
		%feature("compactdefaultargs") PerformInf;
		%feature("autodoc", "Computes the inflections in the interval of parmeters [umin,umax].

Parameters
----------
C: Geom2d_Curve
UMin: float
UMax: float
Result: LProp_CurAndInf

Returns
-------
None
") PerformInf;
		void PerformInf(const opencascade::handle<Geom2d_Curve> & C, const Standard_Real UMin, const Standard_Real UMax, LProp_CurAndInf & Result);

};


%extend Geom2dLProp_NumericCurInf2d {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* harray1 classes */
/* harray2 classes */
/* hsequence classes */
