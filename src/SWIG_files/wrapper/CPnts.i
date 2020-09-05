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
%define CPNTSDOCSTRING
"CPnts module, see official documentation at
https://www.opencascade.com/doc/occt-7.4.0/refman/html/package_cpnts.html"
%enddef
%module (package="OCC.Core", docstring=CPNTSDOCSTRING) CPnts


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
#include<CPnts_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<Adaptor3d_module.hxx>
#include<Adaptor2d_module.hxx>
#include<math_module.hxx>
#include<gp_module.hxx>
#include<Geom_module.hxx>
#include<Geom2d_module.hxx>
#include<Message_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import Adaptor3d.i
%import Adaptor2d.i
%import math.i
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
typedef Standard_Real ( * CPnts_RealFunction ) ( const Standard_Real, const Standard_Address );
/* end typedefs declaration */

/****************************
* class CPnts_AbscissaPoint *
****************************/
class CPnts_AbscissaPoint {
	public:
		/****************** CPnts_AbscissaPoint ******************/
		/**** md5 signature: 565b68db0c8347723f0d4d0ebae69cc2 ****/
		%feature("compactdefaultargs") CPnts_AbscissaPoint;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") CPnts_AbscissaPoint;
		 CPnts_AbscissaPoint();

		/****************** CPnts_AbscissaPoint ******************/
		/**** md5 signature: dcc9a717899dec558afa4d9cafe504b2 ****/
		%feature("compactdefaultargs") CPnts_AbscissaPoint;
		%feature("autodoc", "The algorithm computes a point on a curve <curve> at the distance <abscissa> from the point of parameter <u0>. <resolution> is the error allowed in the computation. the computed point can be outside of the curve 's bounds.

Parameters
----------
C: Adaptor3d_Curve
Abscissa: float
U0: float
Resolution: float

Returns
-------
None
") CPnts_AbscissaPoint;
		 CPnts_AbscissaPoint(const Adaptor3d_Curve & C, const Standard_Real Abscissa, const Standard_Real U0, const Standard_Real Resolution);

		/****************** CPnts_AbscissaPoint ******************/
		/**** md5 signature: f61108658c8a9b1f7e88a63a0a95e128 ****/
		%feature("compactdefaultargs") CPnts_AbscissaPoint;
		%feature("autodoc", "The algorithm computes a point on a curve <curve> at the distance <abscissa> from the point of parameter <u0>. <resolution> is the error allowed in the computation. the computed point can be outside of the curve 's bounds.

Parameters
----------
C: Adaptor2d_Curve2d
Abscissa: float
U0: float
Resolution: float

Returns
-------
None
") CPnts_AbscissaPoint;
		 CPnts_AbscissaPoint(const Adaptor2d_Curve2d & C, const Standard_Real Abscissa, const Standard_Real U0, const Standard_Real Resolution);

		/****************** CPnts_AbscissaPoint ******************/
		/**** md5 signature: 4b965b4c1e38cd5c5c61839c0aa0c443 ****/
		%feature("compactdefaultargs") CPnts_AbscissaPoint;
		%feature("autodoc", "The algorithm computes a point on a curve <curve> at the distance <abscissa> from the point of parameter <u0>. <ui> is the starting value used in the iterative process which find the solution, it must be closed to the final solution <resolution> is the error allowed in the computation. the computed point can be outside of the curve 's bounds.

Parameters
----------
C: Adaptor3d_Curve
Abscissa: float
U0: float
Ui: float
Resolution: float

Returns
-------
None
") CPnts_AbscissaPoint;
		 CPnts_AbscissaPoint(const Adaptor3d_Curve & C, const Standard_Real Abscissa, const Standard_Real U0, const Standard_Real Ui, const Standard_Real Resolution);

		/****************** CPnts_AbscissaPoint ******************/
		/**** md5 signature: 55d5c42afa69db1719eeacb7e8767154 ****/
		%feature("compactdefaultargs") CPnts_AbscissaPoint;
		%feature("autodoc", "The algorithm computes a point on a curve <curve> at the distance <abscissa> from the point of parameter <u0>. <ui> is the starting value used in the iterative process which find the solution, it must be closed to the final solution <resolution> is the error allowed in the computation. the computed point can be outside of the curve 's bounds.

Parameters
----------
C: Adaptor2d_Curve2d
Abscissa: float
U0: float
Ui: float
Resolution: float

Returns
-------
None
") CPnts_AbscissaPoint;
		 CPnts_AbscissaPoint(const Adaptor2d_Curve2d & C, const Standard_Real Abscissa, const Standard_Real U0, const Standard_Real Ui, const Standard_Real Resolution);

		/****************** AdvPerform ******************/
		/**** md5 signature: 951d7d00a89f35f930b917ffe12a10e6 ****/
		%feature("compactdefaultargs") AdvPerform;
		%feature("autodoc", "Computes the point at the distance <abscissa> of the curve; performs more appropriate tolerance managment; to use this method in right way it is necessary to call empty consructor. then call method init with tolerance = resolution, then call advpermorm. u0 is the parameter of the point from which the distance is measured and ui is the starting value for the iterative process (should be close to the final solution).

Parameters
----------
Abscissa: float
U0: float
Ui: float
Resolution: float

Returns
-------
None
") AdvPerform;
		void AdvPerform(const Standard_Real Abscissa, const Standard_Real U0, const Standard_Real Ui, const Standard_Real Resolution);

		/****************** Init ******************/
		/**** md5 signature: 05d67a73334304f898ea37473bae91e6 ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Initializes the resolution function with <c>.

Parameters
----------
C: Adaptor3d_Curve

Returns
-------
None
") Init;
		void Init(const Adaptor3d_Curve & C);

		/****************** Init ******************/
		/**** md5 signature: ce4e00d59388afb7768b24cb988bf1fb ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Initializes the resolution function with <c>.

Parameters
----------
C: Adaptor2d_Curve2d

Returns
-------
None
") Init;
		void Init(const Adaptor2d_Curve2d & C);

		/****************** Init ******************/
		/**** md5 signature: e92216eb760349ca106506e6088e055d ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Initializes the resolution function with <c>.

Parameters
----------
C: Adaptor3d_Curve
Tol: float

Returns
-------
None
") Init;
		void Init(const Adaptor3d_Curve & C, const Standard_Real Tol);

		/****************** Init ******************/
		/**** md5 signature: 939717cae9848f8ded250dc6fa561c85 ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Initializes the resolution function with <c>.

Parameters
----------
C: Adaptor2d_Curve2d
Tol: float

Returns
-------
None
") Init;
		void Init(const Adaptor2d_Curve2d & C, const Standard_Real Tol);

		/****************** Init ******************/
		/**** md5 signature: 87ca1eea65e2958f5df2b13a0b5e6780 ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Initializes the resolution function with <c> between u1 and u2.

Parameters
----------
C: Adaptor3d_Curve
U1: float
U2: float

Returns
-------
None
") Init;
		void Init(const Adaptor3d_Curve & C, const Standard_Real U1, const Standard_Real U2);

		/****************** Init ******************/
		/**** md5 signature: b77983d5b38237e26121dc1c95e5c88b ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Initializes the resolution function with <c> between u1 and u2.

Parameters
----------
C: Adaptor2d_Curve2d
U1: float
U2: float

Returns
-------
None
") Init;
		void Init(const Adaptor2d_Curve2d & C, const Standard_Real U1, const Standard_Real U2);

		/****************** Init ******************/
		/**** md5 signature: cb69652f51f723a9243f4f750acb1157 ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Initializes the resolution function with <c> between u1 and u2.

Parameters
----------
C: Adaptor3d_Curve
U1: float
U2: float
Tol: float

Returns
-------
None
") Init;
		void Init(const Adaptor3d_Curve & C, const Standard_Real U1, const Standard_Real U2, const Standard_Real Tol);

		/****************** Init ******************/
		/**** md5 signature: 3e59992846d9e8300e2f40695942e4c6 ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Initializes the resolution function with <c> between u1 and u2.

Parameters
----------
C: Adaptor2d_Curve2d
U1: float
U2: float
Tol: float

Returns
-------
None
") Init;
		void Init(const Adaptor2d_Curve2d & C, const Standard_Real U1, const Standard_Real U2, const Standard_Real Tol);

		/****************** IsDone ******************/
		/**** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ****/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "True if the computation was successful, false otherwise.

Returns
-------
bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** Length ******************/
		/**** md5 signature: eba769e16675af7987425cafd53458ca ****/
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "Computes the length of the curve <c>.

Parameters
----------
C: Adaptor3d_Curve

Returns
-------
float
") Length;
		static Standard_Real Length(const Adaptor3d_Curve & C);

		/****************** Length ******************/
		/**** md5 signature: 765cbebd0c62408a590e139d7941ff63 ****/
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "Computes the length of the curve <c>.

Parameters
----------
C: Adaptor2d_Curve2d

Returns
-------
float
") Length;
		static Standard_Real Length(const Adaptor2d_Curve2d & C);

		/****************** Length ******************/
		/**** md5 signature: 0c294f64dbc0f6a4115eef7dd6094c0a ****/
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "Computes the length of the curve <c> with the given tolerance.

Parameters
----------
C: Adaptor3d_Curve
Tol: float

Returns
-------
float
") Length;
		static Standard_Real Length(const Adaptor3d_Curve & C, const Standard_Real Tol);

		/****************** Length ******************/
		/**** md5 signature: 2369489a44197d1ca38f55d75b7ed4bb ****/
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "Computes the length of the curve <c> with the given tolerance.

Parameters
----------
C: Adaptor2d_Curve2d
Tol: float

Returns
-------
float
") Length;
		static Standard_Real Length(const Adaptor2d_Curve2d & C, const Standard_Real Tol);

		/****************** Length ******************/
		/**** md5 signature: 0ff9ac31546f5bd02057bb36f563f5d4 ****/
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "Computes the length of the curve <c> between <u1> and <u2>.

Parameters
----------
C: Adaptor3d_Curve
U1: float
U2: float

Returns
-------
float
") Length;
		static Standard_Real Length(const Adaptor3d_Curve & C, const Standard_Real U1, const Standard_Real U2);

		/****************** Length ******************/
		/**** md5 signature: 1e46daf657fccb259b7d9f58dc7e413b ****/
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "Computes the length of the curve <c> between <u1> and <u2>.

Parameters
----------
C: Adaptor2d_Curve2d
U1: float
U2: float

Returns
-------
float
") Length;
		static Standard_Real Length(const Adaptor2d_Curve2d & C, const Standard_Real U1, const Standard_Real U2);

		/****************** Length ******************/
		/**** md5 signature: 2e36ed9a5703e01dfe14dffcfd406a78 ****/
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "Computes the length of the curve <c> between <u1> and <u2> with the given tolerance.

Parameters
----------
C: Adaptor3d_Curve
U1: float
U2: float
Tol: float

Returns
-------
float
") Length;
		static Standard_Real Length(const Adaptor3d_Curve & C, const Standard_Real U1, const Standard_Real U2, const Standard_Real Tol);

		/****************** Length ******************/
		/**** md5 signature: 01305edaf2437396737fa3c58ad94127 ****/
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "Computes the length of the curve <c> between <u1> and <u2> with the given tolerance. creation of a indefinite abscissapoint.

Parameters
----------
C: Adaptor2d_Curve2d
U1: float
U2: float
Tol: float

Returns
-------
float
") Length;
		static Standard_Real Length(const Adaptor2d_Curve2d & C, const Standard_Real U1, const Standard_Real U2, const Standard_Real Tol);

		/****************** Parameter ******************/
		/**** md5 signature: ecccdeaeaa0deed24f47e61ad75d24f1 ****/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "Returns the parameter of the solution.

Returns
-------
float
") Parameter;
		Standard_Real Parameter();

		/****************** Perform ******************/
		/**** md5 signature: 2e65ba72858d674b8c44518b7193d998 ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Computes the point at the distance <abscissa> of the curve. u0 is the parameter of the point from which the distance is measured.

Parameters
----------
Abscissa: float
U0: float
Resolution: float

Returns
-------
None
") Perform;
		void Perform(const Standard_Real Abscissa, const Standard_Real U0, const Standard_Real Resolution);

		/****************** Perform ******************/
		/**** md5 signature: 022ad22512c6b945dc45153665cc57d8 ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Computes the point at the distance <abscissa> of the curve. u0 is the parameter of the point from which the distance is measured and ui is the starting value for the iterative process (should be close to the final solution).

Parameters
----------
Abscissa: float
U0: float
Ui: float
Resolution: float

Returns
-------
None
") Perform;
		void Perform(const Standard_Real Abscissa, const Standard_Real U0, const Standard_Real Ui, const Standard_Real Resolution);

		/****************** SetParameter ******************/
		/**** md5 signature: d3a5f0f306e71f1174aeb726bf74eacc ****/
		%feature("compactdefaultargs") SetParameter;
		%feature("autodoc", "Enforce the solution, used by gcpnts.

Parameters
----------
P: float

Returns
-------
None
") SetParameter;
		void SetParameter(const Standard_Real P);

};


%extend CPnts_AbscissaPoint {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************
* class CPnts_MyGaussFunction *
******************************/
class CPnts_MyGaussFunction : public math_Function {
	public:
		/****************** CPnts_MyGaussFunction ******************/
		/**** md5 signature: f30ae6546be9a0f114d2ac5c57bb772c ****/
		%feature("compactdefaultargs") CPnts_MyGaussFunction;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") CPnts_MyGaussFunction;
		 CPnts_MyGaussFunction();

		/****************** Init ******************/
		/**** md5 signature: 39f39a8070dd6270a565421459f5d889 ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "F is a pointer on a function d is a client data //! each value is computed with f(d).

Parameters
----------
F: CPnts_RealFunction
D: Standard_Address

Returns
-------
None
") Init;
		void Init(const CPnts_RealFunction & F, const Standard_Address D);

		/****************** Value ******************/
		/**** md5 signature: 860bcc3da162e9f9f232f07518550196 ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "No available documentation.

Parameters
----------
X: float

Returns
-------
F: float
") Value;
		Standard_Boolean Value(const Standard_Real X, Standard_Real &OutValue);

};


%extend CPnts_MyGaussFunction {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************
* class CPnts_MyRootFunction *
*****************************/
class CPnts_MyRootFunction : public math_FunctionWithDerivative {
	public:
		/****************** CPnts_MyRootFunction ******************/
		/**** md5 signature: d6e7e5bf2fd8d0eb826cd67d903c4dec ****/
		%feature("compactdefaultargs") CPnts_MyRootFunction;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") CPnts_MyRootFunction;
		 CPnts_MyRootFunction();

		/****************** Derivative ******************/
		/**** md5 signature: 07088c713b316ad61988ae53e107d4d9 ****/
		%feature("compactdefaultargs") Derivative;
		%feature("autodoc", "This is f(x,d).

Parameters
----------
X: float

Returns
-------
Df: float
") Derivative;
		Standard_Boolean Derivative(const Standard_Real X, Standard_Real &OutValue);

		/****************** Init ******************/
		/**** md5 signature: 5f1c4dc9119754c59956235d7e867190 ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "F is a pointer on a function d is a client data order is the order of integration to use.

Parameters
----------
F: CPnts_RealFunction
D: Standard_Address
Order: int

Returns
-------
None
") Init;
		void Init(const CPnts_RealFunction & F, const Standard_Address D, const Standard_Integer Order);

		/****************** Init ******************/
		/**** md5 signature: fe427beeb4a20724629011bcd7029afd ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "We want to solve integral(x0,x,f(x,d)) = l.

Parameters
----------
X0: float
L: float

Returns
-------
None
") Init;
		void Init(const Standard_Real X0, const Standard_Real L);

		/****************** Init ******************/
		/**** md5 signature: 5f72356df0e880274ae4484b7237a98d ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "We want to solve integral(x0,x,f(x,d)) = l with given tolerance.

Parameters
----------
X0: float
L: float
Tol: float

Returns
-------
None
") Init;
		void Init(const Standard_Real X0, const Standard_Real L, const Standard_Real Tol);

		/****************** Value ******************/
		/**** md5 signature: 860bcc3da162e9f9f232f07518550196 ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "This is integral(x0,x,f(x,d)) - l.

Parameters
----------
X: float

Returns
-------
F: float
") Value;
		Standard_Boolean Value(const Standard_Real X, Standard_Real &OutValue);

		/****************** Values ******************/
		/**** md5 signature: c949600f2bbcaa0e904a51394da59e1d ****/
		%feature("compactdefaultargs") Values;
		%feature("autodoc", "No available documentation.

Parameters
----------
X: float

Returns
-------
F: float
Df: float
") Values;
		Standard_Boolean Values(const Standard_Real X, Standard_Real &OutValue, Standard_Real &OutValue);

};


%extend CPnts_MyRootFunction {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************
* class CPnts_UniformDeflection *
********************************/
class CPnts_UniformDeflection {
	public:
		/****************** CPnts_UniformDeflection ******************/
		/**** md5 signature: 1536f4244052fbb6d354dccdb7754fe1 ****/
		%feature("compactdefaultargs") CPnts_UniformDeflection;
		%feature("autodoc", "Creation of a indefinite uniformdeflection.

Returns
-------
None
") CPnts_UniformDeflection;
		 CPnts_UniformDeflection();

		/****************** CPnts_UniformDeflection ******************/
		/**** md5 signature: 84fa75f241a11f8ce3c7710f14125eee ****/
		%feature("compactdefaultargs") CPnts_UniformDeflection;
		%feature("autodoc", "Computes a uniform deflection distribution of points on the curve <c>. <deflection> defines the constant deflection value. the algorithm computes the number of points and the points. the curve <c> must be at least c2 else the computation can fail. if just some parts of the curve is c2 it is better to give the parameters bounds and to use the below constructor . if <withcontrol> is true, the algorithm controls the estimate deflection when the curve is singular at the point p(u),the algorithm computes the next point as p(u + max(currentstep,abs(lastparameter-firstparameter))) if the singularity is at the first point ,the next point calculated is the p(lastparameter).

Parameters
----------
C: Adaptor3d_Curve
Deflection: float
Resolution: float
WithControl: bool

Returns
-------
None
") CPnts_UniformDeflection;
		 CPnts_UniformDeflection(const Adaptor3d_Curve & C, const Standard_Real Deflection, const Standard_Real Resolution, const Standard_Boolean WithControl);

		/****************** CPnts_UniformDeflection ******************/
		/**** md5 signature: 7b383059323db954be890e733e314990 ****/
		%feature("compactdefaultargs") CPnts_UniformDeflection;
		%feature("autodoc", "As above with 2d curve.

Parameters
----------
C: Adaptor2d_Curve2d
Deflection: float
Resolution: float
WithControl: bool

Returns
-------
None
") CPnts_UniformDeflection;
		 CPnts_UniformDeflection(const Adaptor2d_Curve2d & C, const Standard_Real Deflection, const Standard_Real Resolution, const Standard_Boolean WithControl);

		/****************** CPnts_UniformDeflection ******************/
		/**** md5 signature: 350f6bae333ae018e0b9fb1eb1188e09 ****/
		%feature("compactdefaultargs") CPnts_UniformDeflection;
		%feature("autodoc", "Computes an uniform deflection distribution of points on a part of the curve <c>. deflection defines the step between the points. <u1> and <u2> define the distribution span. <u1> and <u2> must be in the parametric range of the curve.

Parameters
----------
C: Adaptor3d_Curve
Deflection: float
U1: float
U2: float
Resolution: float
WithControl: bool

Returns
-------
None
") CPnts_UniformDeflection;
		 CPnts_UniformDeflection(const Adaptor3d_Curve & C, const Standard_Real Deflection, const Standard_Real U1, const Standard_Real U2, const Standard_Real Resolution, const Standard_Boolean WithControl);

		/****************** CPnts_UniformDeflection ******************/
		/**** md5 signature: b92aad6ac27525ef3e2fa6be7730b792 ****/
		%feature("compactdefaultargs") CPnts_UniformDeflection;
		%feature("autodoc", "As above with 2d curve.

Parameters
----------
C: Adaptor2d_Curve2d
Deflection: float
U1: float
U2: float
Resolution: float
WithControl: bool

Returns
-------
None
") CPnts_UniformDeflection;
		 CPnts_UniformDeflection(const Adaptor2d_Curve2d & C, const Standard_Real Deflection, const Standard_Real U1, const Standard_Real U2, const Standard_Real Resolution, const Standard_Boolean WithControl);

		/****************** Initialize ******************/
		/**** md5 signature: 3e04248745b7abf1ca127fe927a9d03a ****/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "Initialize the algoritms with <c>, <deflection>, <ustep>, <resolution> and <withcontrol>.

Parameters
----------
C: Adaptor3d_Curve
Deflection: float
Resolution: float
WithControl: bool

Returns
-------
None
") Initialize;
		void Initialize(const Adaptor3d_Curve & C, const Standard_Real Deflection, const Standard_Real Resolution, const Standard_Boolean WithControl);

		/****************** Initialize ******************/
		/**** md5 signature: fc394fce795394d63421de08f8720ec8 ****/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "Initialize the algoritms with <c>, <deflection>, <ustep>, <resolution> and <withcontrol>.

Parameters
----------
C: Adaptor2d_Curve2d
Deflection: float
Resolution: float
WithControl: bool

Returns
-------
None
") Initialize;
		void Initialize(const Adaptor2d_Curve2d & C, const Standard_Real Deflection, const Standard_Real Resolution, const Standard_Boolean WithControl);

		/****************** Initialize ******************/
		/**** md5 signature: c3c016d21ea4c112d829bfcc114f78d4 ****/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "Initialize the algoritms with <c>, <deflection>, <ustep>, <u1>, <u2> and <withcontrol>.

Parameters
----------
C: Adaptor3d_Curve
Deflection: float
U1: float
U2: float
Resolution: float
WithControl: bool

Returns
-------
None
") Initialize;
		void Initialize(const Adaptor3d_Curve & C, const Standard_Real Deflection, const Standard_Real U1, const Standard_Real U2, const Standard_Real Resolution, const Standard_Boolean WithControl);

		/****************** Initialize ******************/
		/**** md5 signature: 6d52d63715b1ed7bea1f720001bbd8d5 ****/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "Initialize the algoritms with <c>, <deflection>, <ustep>, <u1>, <u2> and <withcontrol>.

Parameters
----------
C: Adaptor2d_Curve2d
Deflection: float
U1: float
U2: float
Resolution: float
WithControl: bool

Returns
-------
None
") Initialize;
		void Initialize(const Adaptor2d_Curve2d & C, const Standard_Real Deflection, const Standard_Real U1, const Standard_Real U2, const Standard_Real Resolution, const Standard_Boolean WithControl);

		/****************** IsAllDone ******************/
		/**** md5 signature: de15cae0f4e93766f724af4c65c32370 ****/
		%feature("compactdefaultargs") IsAllDone;
		%feature("autodoc", "To know if all the calculus were done successfully (ie all the points have been computed). the calculus can fail if the curve is not c1 in the considered domain. returns true if the calculus was successful.

Returns
-------
bool
") IsAllDone;
		Standard_Boolean IsAllDone();

		/****************** More ******************/
		/**** md5 signature: f2144011648ae849666b28430a27a0ea ****/
		%feature("compactdefaultargs") More;
		%feature("autodoc", "Returns true if it exists a next point.

Returns
-------
bool
") More;
		Standard_Boolean More();

		/****************** Next ******************/
		/**** md5 signature: f35c0df5f1d7c877986db18081404532 ****/
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "Go to the next point.

Returns
-------
None
") Next;
		void Next();

		/****************** Point ******************/
		/**** md5 signature: aacd847206090cc43a493e5072f97000 ****/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "Return the computed parameter.

Returns
-------
gp_Pnt
") Point;
		gp_Pnt Point();

		/****************** Value ******************/
		/**** md5 signature: 52655a2fb6642856b2c68a9331826787 ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Return the computed parameter.

Returns
-------
float
") Value;
		Standard_Real Value();

};


%extend CPnts_UniformDeflection {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* harray1 classes */
/* harray2 classes */
/* hsequence classes */
