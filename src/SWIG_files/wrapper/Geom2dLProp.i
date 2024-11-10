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
%define GEOM2DLPROPDOCSTRING
"Geom2dLProp module, see official documentation at
https://dev.opencascade.org/doc/occt-7.7.0/refman/html/package_geom2dlprop.html"
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
%include ../common/EnumTemplates.i
%include ../common/Operators.i
%include ../common/OccHandle.i
%include ../common/IOStream.i
%include ../common/ArrayMacros.i


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

/******************************
* class Geom2dLProp_CLProps2d *
******************************/
class Geom2dLProp_CLProps2d {
	public:
		/****************** Geom2dLProp_CLProps2d ******************/
		/**** md5 signature: 60237b4a6658b74a6cd64ded0755c301 ****/
		%feature("compactdefaultargs") Geom2dLProp_CLProps2d;
		%feature("autodoc", "
Parameters
----------
C: Geom2d_Curve
N: int
Resolution: float

Return
-------
None

Description
-----------
Initializes the local properties of the curve <c> the current point and the derivatives are computed at the same time, which allows an optimization of the computation time. <n> indicates the maximum number of derivations to be done (0, 1, 2 or 3). for example, to compute only the tangent, n should be equal to 1. <resolution> is the linear tolerance (it is used to test if a vector is null).
") Geom2dLProp_CLProps2d;
		 Geom2dLProp_CLProps2d(const opencascade::handle<Geom2d_Curve> & C, const Standard_Integer N, const Standard_Real Resolution);

		/****************** Geom2dLProp_CLProps2d ******************/
		/**** md5 signature: a07184f40b0441741408668abcbc5e3f ****/
		%feature("compactdefaultargs") Geom2dLProp_CLProps2d;
		%feature("autodoc", "
Parameters
----------
C: Geom2d_Curve
U: float
N: int
Resolution: float

Return
-------
None

Description
-----------
Same as previous constructor but here the parameter is set to the value <u>. all the computations done will be related to <c> and <u>.
") Geom2dLProp_CLProps2d;
		 Geom2dLProp_CLProps2d(const opencascade::handle<Geom2d_Curve> & C, const Standard_Real U, const Standard_Integer N, const Standard_Real Resolution);

		/****************** Geom2dLProp_CLProps2d ******************/
		/**** md5 signature: 1b95bdbf8ac383857a198aa644940fa0 ****/
		%feature("compactdefaultargs") Geom2dLProp_CLProps2d;
		%feature("autodoc", "
Parameters
----------
N: int
Resolution: float

Return
-------
None

Description
-----------
Same as previous constructor but here the parameter is set to the value <u> and the curve is set with setcurve. the curve can have a empty constructor all the computations done will be related to <c> and <u> when the functions 'set' will be done.
") Geom2dLProp_CLProps2d;
		 Geom2dLProp_CLProps2d(const Standard_Integer N, const Standard_Real Resolution);

		/****************** CentreOfCurvature ******************/
		/**** md5 signature: 626d695d5de587ba5c831f0811118d8d ****/
		%feature("compactdefaultargs") CentreOfCurvature;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt2d

Return
-------
None

Description
-----------
Returns the centre of curvature <p>.
") CentreOfCurvature;
		void CentreOfCurvature(gp_Pnt2d & P);

		/****************** Curvature ******************/
		/**** md5 signature: 4886f38d109c8344d719e9973cfea7e1 ****/
		%feature("compactdefaultargs") Curvature;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the curvature.
") Curvature;
		Standard_Real Curvature();

		/****************** D1 ******************/
		/**** md5 signature: 400251dec252a18ea516927809341fa7 ****/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "Return
-------
gp_Vec2d

Description
-----------
Returns the first derivative. the derivative is computed if it has not been yet.
") D1;
		const gp_Vec2d D1();

		/****************** D2 ******************/
		/**** md5 signature: 14a212b020ed6e6189286e37088e41e7 ****/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "Return
-------
gp_Vec2d

Description
-----------
Returns the second derivative. the derivative is computed if it has not been yet.
") D2;
		const gp_Vec2d D2();

		/****************** D3 ******************/
		/**** md5 signature: a13380eb2e77ee845c4ad05a4d86bd7b ****/
		%feature("compactdefaultargs") D3;
		%feature("autodoc", "Return
-------
gp_Vec2d

Description
-----------
Returns the third derivative. the derivative is computed if it has not been yet.
") D3;
		const gp_Vec2d D3();

		/****************** IsTangentDefined ******************/
		/**** md5 signature: 96b1d1e7ead0e227ec7d76f9ad798ae8 ****/
		%feature("compactdefaultargs") IsTangentDefined;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if the tangent is defined. for example, the tangent is not defined if the three first derivatives are all null.
") IsTangentDefined;
		Standard_Boolean IsTangentDefined();

		/****************** Normal ******************/
		/**** md5 signature: 4d525a8e066324f482e1de5d65bdd7c5 ****/
		%feature("compactdefaultargs") Normal;
		%feature("autodoc", "
Parameters
----------
N: gp_Dir2d

Return
-------
None

Description
-----------
Returns the normal direction <n>.
") Normal;
		void Normal(gp_Dir2d & N);

		/****************** SetCurve ******************/
		/**** md5 signature: 742ee8e4dc5f19c05a80fb958d6fead8 ****/
		%feature("compactdefaultargs") SetCurve;
		%feature("autodoc", "
Parameters
----------
C: Geom2d_Curve

Return
-------
None

Description
-----------
Initializes the local properties of the curve for the new curve.
") SetCurve;
		void SetCurve(const opencascade::handle<Geom2d_Curve> & C);

		/****************** SetParameter ******************/
		/**** md5 signature: 6d7d0a8f07175b76bb327cfdc33d2266 ****/
		%feature("compactdefaultargs") SetParameter;
		%feature("autodoc", "
Parameters
----------
U: float

Return
-------
None

Description
-----------
Initializes the local properties of the curve for the parameter value <u>.
") SetParameter;
		void SetParameter(const Standard_Real U);

		/****************** Tangent ******************/
		/**** md5 signature: 2adaff97f5d84c22114b84a6e5def58d ****/
		%feature("compactdefaultargs") Tangent;
		%feature("autodoc", "
Parameters
----------
D: gp_Dir2d

Return
-------
None

Description
-----------
Output the tangent direction <d>.
") Tangent;
		void Tangent(gp_Dir2d & D);

		/****************** Value ******************/
		/**** md5 signature: 01b97600ad700e4edb97bc6008ad0c9b ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Return
-------
gp_Pnt2d

Description
-----------
Returns the point.
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
		/**** md5 signature: 1d2411829f94361db69a471e7487752d ****/
		%feature("compactdefaultargs") Geom2dLProp_CurAndInf2d;
		%feature("autodoc", "Return
-------
None

Description
-----------
Initializes the framework. note: the curve on which the local properties are computed is defined using one of the following functions: perform, performcurext or performinf.
") Geom2dLProp_CurAndInf2d;
		 Geom2dLProp_CurAndInf2d();

		/****************** IsDone ******************/
		/**** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ****/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
True if the solutions are found.
") IsDone;
		Standard_Boolean IsDone();

		/****************** Perform ******************/
		/**** md5 signature: 73c4da745f6865598366f5736e497c1a ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
C: Geom2d_Curve

Return
-------
None

Description
-----------
For the curve c, computes both the inflection points and the maximum and minimum curvatures.
") Perform;
		void Perform(const opencascade::handle<Geom2d_Curve> & C);

		/****************** PerformCurExt ******************/
		/**** md5 signature: 0581e10445ee1f46584d14d92dfd7071 ****/
		%feature("compactdefaultargs") PerformCurExt;
		%feature("autodoc", "
Parameters
----------
C: Geom2d_Curve

Return
-------
None

Description
-----------
For the curve c, computes the locals extremas of curvature.
") PerformCurExt;
		void PerformCurExt(const opencascade::handle<Geom2d_Curve> & C);

		/****************** PerformInf ******************/
		/**** md5 signature: eed298f24ef1721b5df8387520329d0e ****/
		%feature("compactdefaultargs") PerformInf;
		%feature("autodoc", "
Parameters
----------
C: Geom2d_Curve

Return
-------
None

Description
-----------
For the curve c, computes the inflections. after computation, the following functions can be used: - isdone to check if the computation was successful - nbpoints to obtain the number of computed particular points - parameter to obtain the parameter on the curve for each particular point - type to check if the point is an inflection point or an extremum of curvature of the curve c. warning these functions can be used to analyze a series of curves, however it is necessary to clear the table of results between each computation.
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
		/**** md5 signature: 397f3c91efac72538943ef299594983d ****/
		%feature("compactdefaultargs") Continuity;
		%feature("autodoc", "
Parameters
----------
C: Geom2d_Curve

Return
-------
int

Description
-----------
Returns the order of continuity of the curve <c>. returns 1: first derivative only is computable returns 2: first and second derivative only are computable. returns 3: first, second and third are computable.
") Continuity;
		static Standard_Integer Continuity(const opencascade::handle<Geom2d_Curve> & C);

		/****************** D1 ******************/
		/**** md5 signature: 59fd3af50a9979f7693ac93b81c08d9d ****/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "
Parameters
----------
C: Geom2d_Curve
U: float
P: gp_Pnt2d
V1: gp_Vec2d

Return
-------
None

Description
-----------
Computes the point <p> and first derivative <v1> of parameter <u> on the curve <c>.
") D1;
		static void D1(const opencascade::handle<Geom2d_Curve> & C, const Standard_Real U, gp_Pnt2d & P, gp_Vec2d & V1);

		/****************** D2 ******************/
		/**** md5 signature: d63205a4754794f1b9d9e8ef7cdc1232 ****/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "
Parameters
----------
C: Geom2d_Curve
U: float
P: gp_Pnt2d
V1: gp_Vec2d
V2: gp_Vec2d

Return
-------
None

Description
-----------
Computes the point <p>, the first derivative <v1> and second derivative <v2> of parameter <u> on the curve <c>.
") D2;
		static void D2(const opencascade::handle<Geom2d_Curve> & C, const Standard_Real U, gp_Pnt2d & P, gp_Vec2d & V1, gp_Vec2d & V2);

		/****************** D3 ******************/
		/**** md5 signature: eb6753dea2cbc1e513e0dae67597ec96 ****/
		%feature("compactdefaultargs") D3;
		%feature("autodoc", "
Parameters
----------
C: Geom2d_Curve
U: float
P: gp_Pnt2d
V1: gp_Vec2d
V2: gp_Vec2d
V3: gp_Vec2d

Return
-------
None

Description
-----------
Computes the point <p>, the first derivative <v1>, the second derivative <v2> and third derivative <v3> of parameter <u> on the curve <c>.
") D3;
		static void D3(const opencascade::handle<Geom2d_Curve> & C, const Standard_Real U, gp_Pnt2d & P, gp_Vec2d & V1, gp_Vec2d & V2, gp_Vec2d & V3);

		/****************** FirstParameter ******************/
		/**** md5 signature: 4e34d0fb98f1d854c0e5caa004bcf5a6 ****/
		%feature("compactdefaultargs") FirstParameter;
		%feature("autodoc", "
Parameters
----------
C: Geom2d_Curve

Return
-------
float

Description
-----------
Returns the first parameter bound of the curve.
") FirstParameter;
		static Standard_Real FirstParameter(const opencascade::handle<Geom2d_Curve> & C);

		/****************** LastParameter ******************/
		/**** md5 signature: 2df990ab4c653a046b7a3e5f65e015a1 ****/
		%feature("compactdefaultargs") LastParameter;
		%feature("autodoc", "
Parameters
----------
C: Geom2d_Curve

Return
-------
float

Description
-----------
Returns the last parameter bound of the curve. firstparameter must be less than lastparameter.
") LastParameter;
		static Standard_Real LastParameter(const opencascade::handle<Geom2d_Curve> & C);

		/****************** Value ******************/
		/**** md5 signature: 08ee3d411ce1ba322e19d237e64191cf ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
C: Geom2d_Curve
U: float
P: gp_Pnt2d

Return
-------
None

Description
-----------
Computes the point <p> of parameter <u> on the curve <c>.
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
		/**** md5 signature: 2fe94539d010aa6f04163472509fb07c ****/
		%feature("compactdefaultargs") Geom2dLProp_FuncCurExt;
		%feature("autodoc", "
Parameters
----------
C: Geom2d_Curve
Tol: float

Return
-------
None

Description
-----------
No available documentation.
") Geom2dLProp_FuncCurExt;
		 Geom2dLProp_FuncCurExt(const opencascade::handle<Geom2d_Curve> & C, const Standard_Real Tol);

		/****************** Derivative ******************/
		/**** md5 signature: 95e91729f1fb548d9a62f690b302c323 ****/
		%feature("compactdefaultargs") Derivative;
		%feature("autodoc", "
Parameters
----------
X: float

Return
-------
D: float

Description
-----------
Returns the derivative for the variable <x>.
") Derivative;
		Standard_Boolean Derivative(const Standard_Real X, Standard_Real &OutValue);

		/****************** IsMinKC ******************/
		/**** md5 signature: bc0d23d880fb1dbf78df8669a901eb80 ****/
		%feature("compactdefaultargs") IsMinKC;
		%feature("autodoc", "
Parameters
----------
Param: float

Return
-------
bool

Description
-----------
True if param corresponds to a minus of the radius of curvature.
") IsMinKC;
		Standard_Boolean IsMinKC(const Standard_Real Param);

		/****************** Value ******************/
		/**** md5 signature: 860bcc3da162e9f9f232f07518550196 ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
X: float

Return
-------
F: float

Description
-----------
Returns the value for the variable <x>.
") Value;
		Standard_Boolean Value(const Standard_Real X, Standard_Real &OutValue);

		/****************** Values ******************/
		/**** md5 signature: fd71eb9a1a2bd16185bbb032c3d29afc ****/
		%feature("compactdefaultargs") Values;
		%feature("autodoc", "
Parameters
----------
X: float

Return
-------
F: float
D: float

Description
-----------
Returns the value of the function and the derivative for the variable <x>.
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
		/**** md5 signature: 691dcd387ac9aaa1287f251129a890d7 ****/
		%feature("compactdefaultargs") Geom2dLProp_FuncCurNul;
		%feature("autodoc", "
Parameters
----------
C: Geom2d_Curve

Return
-------
None

Description
-----------
No available documentation.
") Geom2dLProp_FuncCurNul;
		 Geom2dLProp_FuncCurNul(const opencascade::handle<Geom2d_Curve> & C);

		/****************** Derivative ******************/
		/**** md5 signature: 95e91729f1fb548d9a62f690b302c323 ****/
		%feature("compactdefaultargs") Derivative;
		%feature("autodoc", "
Parameters
----------
X: float

Return
-------
D: float

Description
-----------
Returns the derivative for the variable <x>.
") Derivative;
		Standard_Boolean Derivative(const Standard_Real X, Standard_Real &OutValue);

		/****************** Value ******************/
		/**** md5 signature: 860bcc3da162e9f9f232f07518550196 ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
X: float

Return
-------
F: float

Description
-----------
Returns the value for the variable <x>.
") Value;
		Standard_Boolean Value(const Standard_Real X, Standard_Real &OutValue);

		/****************** Values ******************/
		/**** md5 signature: fd71eb9a1a2bd16185bbb032c3d29afc ****/
		%feature("compactdefaultargs") Values;
		%feature("autodoc", "
Parameters
----------
X: float

Return
-------
F: float
D: float

Description
-----------
Returns the value of the function and the derivative for the variable <x>.
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
		/**** md5 signature: aee6174eab6dd715ed1732694e61bacb ****/
		%feature("compactdefaultargs") Geom2dLProp_NumericCurInf2d;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Geom2dLProp_NumericCurInf2d;
		 Geom2dLProp_NumericCurInf2d();

		/****************** IsDone ******************/
		/**** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ****/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
True if the solutions are found.
") IsDone;
		Standard_Boolean IsDone();

		/****************** PerformCurExt ******************/
		/**** md5 signature: cff7de6bb45828bfc0a45db246b9dfcc ****/
		%feature("compactdefaultargs") PerformCurExt;
		%feature("autodoc", "
Parameters
----------
C: Geom2d_Curve
Result: LProp_CurAndInf

Return
-------
None

Description
-----------
Computes the locals extremas of curvature.
") PerformCurExt;
		void PerformCurExt(const opencascade::handle<Geom2d_Curve> & C, LProp_CurAndInf & Result);

		/****************** PerformCurExt ******************/
		/**** md5 signature: 8d4a271f7ea31764c51bc7d5d6517548 ****/
		%feature("compactdefaultargs") PerformCurExt;
		%feature("autodoc", "
Parameters
----------
C: Geom2d_Curve
UMin: float
UMax: float
Result: LProp_CurAndInf

Return
-------
None

Description
-----------
Computes the locals extremas of curvature. in the interval of parameters [umin,umax].
") PerformCurExt;
		void PerformCurExt(const opencascade::handle<Geom2d_Curve> & C, const Standard_Real UMin, const Standard_Real UMax, LProp_CurAndInf & Result);

		/****************** PerformInf ******************/
		/**** md5 signature: fb2a22e3f2253813d31cb1a8fd636e72 ****/
		%feature("compactdefaultargs") PerformInf;
		%feature("autodoc", "
Parameters
----------
C: Geom2d_Curve
Result: LProp_CurAndInf

Return
-------
None

Description
-----------
Computes the inflections.
") PerformInf;
		void PerformInf(const opencascade::handle<Geom2d_Curve> & C, LProp_CurAndInf & Result);

		/****************** PerformInf ******************/
		/**** md5 signature: 4ccd98235aecb6f55130f7303d06d7cd ****/
		%feature("compactdefaultargs") PerformInf;
		%feature("autodoc", "
Parameters
----------
C: Geom2d_Curve
UMin: float
UMax: float
Result: LProp_CurAndInf

Return
-------
None

Description
-----------
Computes the inflections in the interval of parameters [umin,umax].
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
/* class aliases */
%pythoncode {
}
/* deprecated methods */
%pythoncode {
@deprecated
def Geom2dLProp_Curve2dTool_Continuity(*args):
	return Geom2dLProp_Curve2dTool.Continuity(*args)

@deprecated
def Geom2dLProp_Curve2dTool_D1(*args):
	return Geom2dLProp_Curve2dTool.D1(*args)

@deprecated
def Geom2dLProp_Curve2dTool_D2(*args):
	return Geom2dLProp_Curve2dTool.D2(*args)

@deprecated
def Geom2dLProp_Curve2dTool_D3(*args):
	return Geom2dLProp_Curve2dTool.D3(*args)

@deprecated
def Geom2dLProp_Curve2dTool_FirstParameter(*args):
	return Geom2dLProp_Curve2dTool.FirstParameter(*args)

@deprecated
def Geom2dLProp_Curve2dTool_LastParameter(*args):
	return Geom2dLProp_Curve2dTool.LastParameter(*args)

@deprecated
def Geom2dLProp_Curve2dTool_Value(*args):
	return Geom2dLProp_Curve2dTool.Value(*args)

}
