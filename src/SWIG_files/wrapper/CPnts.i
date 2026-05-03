/*
Copyright 2008-2025 Thomas Paviot (tpaviot@gmail.com)

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
https://dev.opencascade.org/doc/occt-7.9.0/refman/html/package_cpnts.html"
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
%include ../common/EnumTemplates.i
%include ../common/Operators.i
%include ../common/OccHandle.i
%include ../common/IOStream.i
%include ../common/ArrayMacros.i


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

/****************************
* class CPnts_AbscissaPoint *
****************************/
class CPnts_AbscissaPoint {
	public:
		/****** CPnts_AbscissaPoint::CPnts_AbscissaPoint ******/
		/****** md5 signature: 565b68db0c8347723f0d4d0ebae69cc2 ******/
		%feature("compactdefaultargs") CPnts_AbscissaPoint;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") CPnts_AbscissaPoint;
		 CPnts_AbscissaPoint();

		/****** CPnts_AbscissaPoint::CPnts_AbscissaPoint ******/
		/****** md5 signature: 78f93d7507e8525e065d7c0d4ea04a0b ******/
		%feature("compactdefaultargs") CPnts_AbscissaPoint;
		%feature("autodoc", "
Parameters
----------
C: Adaptor3d_Curve
Abscissa: double
U0: double
Resolution: double

Return
-------
None

Description
-----------
the algorithm computes a point on a curve <Curve> at the distance <Abscissa> from the point of parameter <U0>. <Resolution> is the error allowed in the computation. The computed point can be outside of the curve 's bounds.
") CPnts_AbscissaPoint;
		 CPnts_AbscissaPoint(const Adaptor3d_Curve & C, const double Abscissa, const double U0, const double Resolution);

		/****** CPnts_AbscissaPoint::CPnts_AbscissaPoint ******/
		/****** md5 signature: a5b928b9d053ac7035cd098bc92f415b ******/
		%feature("compactdefaultargs") CPnts_AbscissaPoint;
		%feature("autodoc", "
Parameters
----------
C: Adaptor2d_Curve2d
Abscissa: double
U0: double
Resolution: double

Return
-------
None

Description
-----------
the algorithm computes a point on a curve <Curve> at the distance <Abscissa> from the point of parameter <U0>. <Resolution> is the error allowed in the computation. The computed point can be outside of the curve 's bounds.
") CPnts_AbscissaPoint;
		 CPnts_AbscissaPoint(const Adaptor2d_Curve2d & C, const double Abscissa, const double U0, const double Resolution);

		/****** CPnts_AbscissaPoint::CPnts_AbscissaPoint ******/
		/****** md5 signature: 60e4e5e0d194193389d8aca4a867dd54 ******/
		%feature("compactdefaultargs") CPnts_AbscissaPoint;
		%feature("autodoc", "
Parameters
----------
C: Adaptor3d_Curve
Abscissa: double
U0: double
Ui: double
Resolution: double

Return
-------
None

Description
-----------
the algorithm computes a point on a curve <Curve> at the distance <Abscissa> from the point of parameter <U0>. <Ui> is the starting value used in the iterative process which find the solution, it must be closed to the final solution <Resolution> is the error allowed in the computation. The computed point can be outside of the curve 's bounds.
") CPnts_AbscissaPoint;
		 CPnts_AbscissaPoint(const Adaptor3d_Curve & C, const double Abscissa, const double U0, const double Ui, const double Resolution);

		/****** CPnts_AbscissaPoint::CPnts_AbscissaPoint ******/
		/****** md5 signature: 67aeac24cbf279ec2544ed18106a7c82 ******/
		%feature("compactdefaultargs") CPnts_AbscissaPoint;
		%feature("autodoc", "
Parameters
----------
C: Adaptor2d_Curve2d
Abscissa: double
U0: double
Ui: double
Resolution: double

Return
-------
None

Description
-----------
the algorithm computes a point on a curve <Curve> at the distance <Abscissa> from the point of parameter <U0>. <Ui> is the starting value used in the iterative process which find the solution, it must be closed to the final solution <Resolution> is the error allowed in the computation. The computed point can be outside of the curve 's bounds.
") CPnts_AbscissaPoint;
		 CPnts_AbscissaPoint(const Adaptor2d_Curve2d & C, const double Abscissa, const double U0, const double Ui, const double Resolution);

		/****** CPnts_AbscissaPoint::AdvPerform ******/
		/****** md5 signature: 9195200405286577d6341df83bc6a549 ******/
		%feature("compactdefaultargs") AdvPerform;
		%feature("autodoc", "
Parameters
----------
Abscissa: double
U0: double
Ui: double
Resolution: double

Return
-------
None

Description
-----------
Computes the point at the distance <Abscissa> of the curve; performs more appropriate tolerance management; to use this method in right way it is necessary to call empty constructor. then call method Init with Tolerance = Resolution, then call AdvPermorm. U0 is the parameter of the point from which the distance is measured and Ui is the starting value for the iterative process (should be close to the final solution).
") AdvPerform;
		void AdvPerform(const double Abscissa, const double U0, const double Ui, const double Resolution);

		/****** CPnts_AbscissaPoint::Init ******/
		/****** md5 signature: 05d67a73334304f898ea37473bae91e6 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
C: Adaptor3d_Curve

Return
-------
None

Description
-----------
Initializes the resolution function with <C>.
") Init;
		void Init(const Adaptor3d_Curve & C);

		/****** CPnts_AbscissaPoint::Init ******/
		/****** md5 signature: ce4e00d59388afb7768b24cb988bf1fb ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
C: Adaptor2d_Curve2d

Return
-------
None

Description
-----------
Initializes the resolution function with <C>.
") Init;
		void Init(const Adaptor2d_Curve2d & C);

		/****** CPnts_AbscissaPoint::Init ******/
		/****** md5 signature: 5ca4f321333231bee1b09578e66c6a5d ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
C: Adaptor3d_Curve
Tol: double

Return
-------
None

Description
-----------
Initializes the resolution function with <C>.
") Init;
		void Init(const Adaptor3d_Curve & C, const double Tol);

		/****** CPnts_AbscissaPoint::Init ******/
		/****** md5 signature: 4251e69b64449bb1ea596845cd8b7499 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
C: Adaptor2d_Curve2d
Tol: double

Return
-------
None

Description
-----------
Initializes the resolution function with <C>.
") Init;
		void Init(const Adaptor2d_Curve2d & C, const double Tol);

		/****** CPnts_AbscissaPoint::Init ******/
		/****** md5 signature: 32805f629285b43dee81b0007b592e16 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
C: Adaptor3d_Curve
U1: double
U2: double

Return
-------
None

Description
-----------
Initializes the resolution function with <C> between U1 and U2.
") Init;
		void Init(const Adaptor3d_Curve & C, const double U1, const double U2);

		/****** CPnts_AbscissaPoint::Init ******/
		/****** md5 signature: 17e4f882eb7573108266bb632e6221b4 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
C: Adaptor2d_Curve2d
U1: double
U2: double

Return
-------
None

Description
-----------
Initializes the resolution function with <C> between U1 and U2.
") Init;
		void Init(const Adaptor2d_Curve2d & C, const double U1, const double U2);

		/****** CPnts_AbscissaPoint::Init ******/
		/****** md5 signature: 286f5442e7fb51ab4d9ce9195df5fa71 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
C: Adaptor3d_Curve
U1: double
U2: double
Tol: double

Return
-------
None

Description
-----------
Initializes the resolution function with <C> between U1 and U2.
") Init;
		void Init(const Adaptor3d_Curve & C, const double U1, const double U2, const double Tol);

		/****** CPnts_AbscissaPoint::Init ******/
		/****** md5 signature: b777b31c142fd81177759778f7c36dc1 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
C: Adaptor2d_Curve2d
U1: double
U2: double
Tol: double

Return
-------
None

Description
-----------
Initializes the resolution function with <C> between U1 and U2.
") Init;
		void Init(const Adaptor2d_Curve2d & C, const double U1, const double U2, const double Tol);

		/****** CPnts_AbscissaPoint::IsDone ******/
		/****** md5 signature: 1e1ad145af7d8c16b253ee9a4b0d6a43 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
True if the computation was successful, False otherwise.
") IsDone;
		bool IsDone();

		/****** CPnts_AbscissaPoint::Length ******/
		/****** md5 signature: eb99b0a8ffc8925f7a4f50cfbd35e468 ******/
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "
Parameters
----------
C: Adaptor3d_Curve

Return
-------
double

Description
-----------
Computes the length of the Curve <C>.
") Length;
		static double Length(const Adaptor3d_Curve & C);

		/****** CPnts_AbscissaPoint::Length ******/
		/****** md5 signature: 1f93a819e1bb8009279f51ee9409df3a ******/
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "
Parameters
----------
C: Adaptor2d_Curve2d

Return
-------
double

Description
-----------
Computes the length of the Curve <C>.
") Length;
		static double Length(const Adaptor2d_Curve2d & C);

		/****** CPnts_AbscissaPoint::Length ******/
		/****** md5 signature: 173c6253b9a5cd18720fb3d27ae78877 ******/
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "
Parameters
----------
C: Adaptor3d_Curve
Tol: double

Return
-------
double

Description
-----------
Computes the length of the Curve <C> with the given tolerance.
") Length;
		static double Length(const Adaptor3d_Curve & C, const double Tol);

		/****** CPnts_AbscissaPoint::Length ******/
		/****** md5 signature: 50f5b916c4ffe1bba1cee830c676995c ******/
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "
Parameters
----------
C: Adaptor2d_Curve2d
Tol: double

Return
-------
double

Description
-----------
Computes the length of the Curve <C> with the given tolerance.
") Length;
		static double Length(const Adaptor2d_Curve2d & C, const double Tol);

		/****** CPnts_AbscissaPoint::Length ******/
		/****** md5 signature: dc899bf3d31ed4bbb1b5a0390465a33d ******/
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "
Parameters
----------
C: Adaptor3d_Curve
U1: double
U2: double

Return
-------
double

Description
-----------
Computes the length of the Curve <C> between <U1> and <U2>.
") Length;
		static double Length(const Adaptor3d_Curve & C, const double U1, const double U2);

		/****** CPnts_AbscissaPoint::Length ******/
		/****** md5 signature: 0b3d34d6f1f4ac16af86f54cd4b51cf3 ******/
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "
Parameters
----------
C: Adaptor2d_Curve2d
U1: double
U2: double

Return
-------
double

Description
-----------
Computes the length of the Curve <C> between <U1> and <U2>.
") Length;
		static double Length(const Adaptor2d_Curve2d & C, const double U1, const double U2);

		/****** CPnts_AbscissaPoint::Length ******/
		/****** md5 signature: a86d3d8abc982575488914842f7a1f5d ******/
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "
Parameters
----------
C: Adaptor3d_Curve
U1: double
U2: double
Tol: double

Return
-------
double

Description
-----------
Computes the length of the Curve <C> between <U1> and <U2> with the given tolerance.
") Length;
		static double Length(const Adaptor3d_Curve & C, const double U1, const double U2, const double Tol);

		/****** CPnts_AbscissaPoint::Length ******/
		/****** md5 signature: 2c7deb9a4583a33f181c08c74d66f766 ******/
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "
Parameters
----------
C: Adaptor2d_Curve2d
U1: double
U2: double
Tol: double

Return
-------
double

Description
-----------
Computes the length of the Curve <C> between <U1> and <U2> with the given tolerance. creation of a indefinite AbscissaPoint.
") Length;
		static double Length(const Adaptor2d_Curve2d & C, const double U1, const double U2, const double Tol);

		/****** CPnts_AbscissaPoint::Parameter ******/
		/****** md5 signature: 28e42519a120bf741c23eca7aaca5525 ******/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns the parameter of the solution.
") Parameter;
		double Parameter();

		/****** CPnts_AbscissaPoint::Perform ******/
		/****** md5 signature: 0fb81dcabee49b5b08c114bab0f99b52 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
Abscissa: double
U0: double
Resolution: double

Return
-------
None

Description
-----------
Computes the point at the distance <Abscissa> of the curve. U0 is the parameter of the point from which the distance is measured.
") Perform;
		void Perform(const double Abscissa, const double U0, const double Resolution);

		/****** CPnts_AbscissaPoint::Perform ******/
		/****** md5 signature: 97dcd9d8099cc63230f50840bdca1cb9 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
Abscissa: double
U0: double
Ui: double
Resolution: double

Return
-------
None

Description
-----------
Computes the point at the distance <Abscissa> of the curve. U0 is the parameter of the point from which the distance is measured and Ui is the starting value for the iterative process (should be close to the final solution).
") Perform;
		void Perform(const double Abscissa, const double U0, const double Ui, const double Resolution);

		/****** CPnts_AbscissaPoint::SetParameter ******/
		/****** md5 signature: 939d553102839b2fc01bf3b02107e2ec ******/
		%feature("compactdefaultargs") SetParameter;
		%feature("autodoc", "
Parameters
----------
P: double

Return
-------
None

Description
-----------
Enforce the solution, used by GCPnts.
") SetParameter;
		void SetParameter(const double P);

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
		/****** CPnts_MyGaussFunction::CPnts_MyGaussFunction ******/
		/****** md5 signature: f30ae6546be9a0f114d2ac5c57bb772c ******/
		%feature("compactdefaultargs") CPnts_MyGaussFunction;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") CPnts_MyGaussFunction;
		 CPnts_MyGaussFunction();

		/****** CPnts_MyGaussFunction::Init ******/
		/****** md5 signature: 1fe3fef6b6f0d3d1f9e39a407f000848 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
F: CPnts_RealFunction
D: void *

Return
-------
None

Description
-----------
F is a pointer on a function D is a client data //! Each value is computed with F(D).
") Init;
		void Init(const CPnts_RealFunction & F, void * const D);

		/****** CPnts_MyGaussFunction::Value ******/
		/****** md5 signature: 2fdd0f48acb4882f76bbbe432a18ac3a ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
X: double

Return
-------
F: double

Description
-----------
No available documentation.
") Value;
		bool Value(const double X, Standard_Real &OutValue);

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
		/****** CPnts_MyRootFunction::CPnts_MyRootFunction ******/
		/****** md5 signature: d6e7e5bf2fd8d0eb826cd67d903c4dec ******/
		%feature("compactdefaultargs") CPnts_MyRootFunction;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") CPnts_MyRootFunction;
		 CPnts_MyRootFunction();

		/****** CPnts_MyRootFunction::Derivative ******/
		/****** md5 signature: b3cc0bc1a26f87426c2cc5e0a0f03d9e ******/
		%feature("compactdefaultargs") Derivative;
		%feature("autodoc", "
Parameters
----------
X: double

Return
-------
Df: double

Description
-----------
This is F(X,D).
") Derivative;
		bool Derivative(const double X, Standard_Real &OutValue);

		/****** CPnts_MyRootFunction::Init ******/
		/****** md5 signature: d48596e814230d9934975a633edab7da ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
F: CPnts_RealFunction
D: void *
Order: int

Return
-------
None

Description
-----------
F is a pointer on a function D is a client data Order is the order of integration to use.
") Init;
		void Init(const CPnts_RealFunction & F, void * const D, const int Order);

		/****** CPnts_MyRootFunction::Init ******/
		/****** md5 signature: 5df5ace0fb1f6b8397ad3b99d04bc149 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
X0: double
L: double

Return
-------
None

Description
-----------
We want to solve Integral(X0,X,F(X,D)) = L.
") Init;
		void Init(const double X0, const double L);

		/****** CPnts_MyRootFunction::Init ******/
		/****** md5 signature: b2a815c575ee18e55aa5d88856866d0e ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
X0: double
L: double
Tol: double

Return
-------
None

Description
-----------
We want to solve Integral(X0,X,F(X,D)) = L with given tolerance.
") Init;
		void Init(const double X0, const double L, const double Tol);

		/****** CPnts_MyRootFunction::Value ******/
		/****** md5 signature: 2fdd0f48acb4882f76bbbe432a18ac3a ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
X: double

Return
-------
F: double

Description
-----------
This is Integral(X0,X,F(X,D)) - L.
") Value;
		bool Value(const double X, Standard_Real &OutValue);

		/****** CPnts_MyRootFunction::Values ******/
		/****** md5 signature: cfc6e99471ff562cf6b64a7652afb3b1 ******/
		%feature("compactdefaultargs") Values;
		%feature("autodoc", "
Parameters
----------
X: double

Return
-------
F: double
Df: double

Description
-----------
No available documentation.
") Values;
		bool Values(const double X, Standard_Real &OutValue, Standard_Real &OutValue);

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
		/****** CPnts_UniformDeflection::CPnts_UniformDeflection ******/
		/****** md5 signature: 1536f4244052fbb6d354dccdb7754fe1 ******/
		%feature("compactdefaultargs") CPnts_UniformDeflection;
		%feature("autodoc", "Return
-------
None

Description
-----------
creation of a indefinite UniformDeflection.
") CPnts_UniformDeflection;
		 CPnts_UniformDeflection();

		/****** CPnts_UniformDeflection::CPnts_UniformDeflection ******/
		/****** md5 signature: 5c1e69d2f9ee112dca868ba9b7e629f3 ******/
		%feature("compactdefaultargs") CPnts_UniformDeflection;
		%feature("autodoc", "
Parameters
----------
C: Adaptor3d_Curve
Deflection: double
Resolution: double
WithControl: bool

Return
-------
None

Description
-----------
Computes a uniform deflection distribution of points on the curve <C>. <Deflection> defines the constant deflection value. The algorithm computes the number of points and the points. The curve <C> must be at least C2 else the computation can fail. If just some parts of the curve is C2 it is better to give the parameters bounds and to use the below constructor . if <WithControl> is True, the algorithm controls the estimate deflection when the curve is singular at the point P(u),the algorithm computes the next point as P(u + std::max(CurrentStep,std::abs(LastParameter-FirstParameter))) if the singularity is at the first point ,the next point calculated is the P(LastParameter).
") CPnts_UniformDeflection;
		 CPnts_UniformDeflection(const Adaptor3d_Curve & C, const double Deflection, const double Resolution, const bool WithControl);

		/****** CPnts_UniformDeflection::CPnts_UniformDeflection ******/
		/****** md5 signature: 4c32d72cb1630a95394b38f7a40e03c5 ******/
		%feature("compactdefaultargs") CPnts_UniformDeflection;
		%feature("autodoc", "
Parameters
----------
C: Adaptor2d_Curve2d
Deflection: double
Resolution: double
WithControl: bool

Return
-------
None

Description
-----------
As above with 2d curve.
") CPnts_UniformDeflection;
		 CPnts_UniformDeflection(const Adaptor2d_Curve2d & C, const double Deflection, const double Resolution, const bool WithControl);

		/****** CPnts_UniformDeflection::CPnts_UniformDeflection ******/
		/****** md5 signature: f5db0f7b4eaf005e84a3df14162022f7 ******/
		%feature("compactdefaultargs") CPnts_UniformDeflection;
		%feature("autodoc", "
Parameters
----------
C: Adaptor3d_Curve
Deflection: double
U1: double
U2: double
Resolution: double
WithControl: bool

Return
-------
None

Description
-----------
Computes an uniform deflection distribution of points on a part of the curve <C>. Deflection defines the step between the points. <U1> and <U2> define the distribution span. <U1> and <U2> must be in the parametric range of the curve.
") CPnts_UniformDeflection;
		 CPnts_UniformDeflection(const Adaptor3d_Curve & C, const double Deflection, const double U1, const double U2, const double Resolution, const bool WithControl);

		/****** CPnts_UniformDeflection::CPnts_UniformDeflection ******/
		/****** md5 signature: 4f398c04c2675c64679b3c7c81a28eff ******/
		%feature("compactdefaultargs") CPnts_UniformDeflection;
		%feature("autodoc", "
Parameters
----------
C: Adaptor2d_Curve2d
Deflection: double
U1: double
U2: double
Resolution: double
WithControl: bool

Return
-------
None

Description
-----------
As above with 2d curve.
") CPnts_UniformDeflection;
		 CPnts_UniformDeflection(const Adaptor2d_Curve2d & C, const double Deflection, const double U1, const double U2, const double Resolution, const bool WithControl);

		/****** CPnts_UniformDeflection::Initialize ******/
		/****** md5 signature: 377205f099e4111e99cde1118159891a ******/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "
Parameters
----------
C: Adaptor3d_Curve
Deflection: double
Resolution: double
WithControl: bool

Return
-------
None

Description
-----------
Initialize the algorithms with <C>, <Deflection>, <UStep>, <Resolution> and <WithControl>.
") Initialize;
		void Initialize(const Adaptor3d_Curve & C, const double Deflection, const double Resolution, const bool WithControl);

		/****** CPnts_UniformDeflection::Initialize ******/
		/****** md5 signature: b3fd5c53c26cca98419dfbd3f0d55c73 ******/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "
Parameters
----------
C: Adaptor2d_Curve2d
Deflection: double
Resolution: double
WithControl: bool

Return
-------
None

Description
-----------
Initialize the algorithms with <C>, <Deflection>, <UStep>, <Resolution> and <WithControl>.
") Initialize;
		void Initialize(const Adaptor2d_Curve2d & C, const double Deflection, const double Resolution, const bool WithControl);

		/****** CPnts_UniformDeflection::Initialize ******/
		/****** md5 signature: 3aee533832489aad857b1efbc0e4070e ******/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "
Parameters
----------
C: Adaptor3d_Curve
Deflection: double
U1: double
U2: double
Resolution: double
WithControl: bool

Return
-------
None

Description
-----------
Initialize the algorithms with <C>, <Deflection>, <UStep>, <U1>, <U2> and <WithControl>.
") Initialize;
		void Initialize(const Adaptor3d_Curve & C, const double Deflection, const double U1, const double U2, const double Resolution, const bool WithControl);

		/****** CPnts_UniformDeflection::Initialize ******/
		/****** md5 signature: 41e32ef92b2a2fa686f79cc535845a14 ******/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "
Parameters
----------
C: Adaptor2d_Curve2d
Deflection: double
U1: double
U2: double
Resolution: double
WithControl: bool

Return
-------
None

Description
-----------
Initialize the algorithms with <C>, <Deflection>, <UStep>, <U1>, <U2> and <WithControl>.
") Initialize;
		void Initialize(const Adaptor2d_Curve2d & C, const double Deflection, const double U1, const double U2, const double Resolution, const bool WithControl);

		/****** CPnts_UniformDeflection::IsAllDone ******/
		/****** md5 signature: 8628f0fdaac2626da36270f440fd1258 ******/
		%feature("compactdefaultargs") IsAllDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
To know if all the calculus were done successfully (ie all the points have been computed). The calculus can fail if the Curve is not C1 in the considered domain. Returns True if the calculus was successful.
") IsAllDone;
		bool IsAllDone();

		/****** CPnts_UniformDeflection::More ******/
		/****** md5 signature: 72440e10f19bd09dac0550f651b9d3a2 ******/
		%feature("compactdefaultargs") More;
		%feature("autodoc", "Return
-------
bool

Description
-----------
returns True if it exists a next Point.
") More;
		bool More();

		/****** CPnts_UniformDeflection::Next ******/
		/****** md5 signature: f35c0df5f1d7c877986db18081404532 ******/
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "Return
-------
None

Description
-----------
go to the next Point.
") Next;
		void Next();

		/****** CPnts_UniformDeflection::Point ******/
		/****** md5 signature: aacd847206090cc43a493e5072f97000 ******/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "Return
-------
gp_Pnt

Description
-----------
return the computed parameter.
") Point;
		gp_Pnt Point();

		/****** CPnts_UniformDeflection::Value ******/
		/****** md5 signature: dbdf6d9f5299cb6ef730d686d81d15db ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Return
-------
double

Description
-----------
return the computed parameter.
") Value;
		double Value();

};


%extend CPnts_UniformDeflection {
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
def CPnts_AbscissaPoint_Length(*args):
	return CPnts_AbscissaPoint.Length(*args)

@deprecated
def CPnts_AbscissaPoint_Length(*args):
	return CPnts_AbscissaPoint.Length(*args)

@deprecated
def CPnts_AbscissaPoint_Length(*args):
	return CPnts_AbscissaPoint.Length(*args)

@deprecated
def CPnts_AbscissaPoint_Length(*args):
	return CPnts_AbscissaPoint.Length(*args)

@deprecated
def CPnts_AbscissaPoint_Length(*args):
	return CPnts_AbscissaPoint.Length(*args)

@deprecated
def CPnts_AbscissaPoint_Length(*args):
	return CPnts_AbscissaPoint.Length(*args)

@deprecated
def CPnts_AbscissaPoint_Length(*args):
	return CPnts_AbscissaPoint.Length(*args)

@deprecated
def CPnts_AbscissaPoint_Length(*args):
	return CPnts_AbscissaPoint.Length(*args)

}
