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
%define FAIRCURVEDOCSTRING
"FairCurve module, see official documentation at
https://dev.opencascade.org/doc/occt-7.9.0/refman/html/package_faircurve.html"
%enddef
%module (package="OCC.Core", docstring=FAIRCURVEDOCSTRING) FairCurve


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
#include<FairCurve_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<gp_module.hxx>
#include<Geom2d_module.hxx>
#include<math_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<Message_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import gp.i
%import Geom2d.i
%import math.i
%import TColgp.i
%import TColStd.i

%pythoncode {
from enum import IntEnum
from OCC.Core.Exception import *
};

/* public enums */
enum FairCurve_AnalysisCode {
	FairCurve_OK = 0,
	FairCurve_NotConverged = 1,
	FairCurve_InfiniteSliding = 2,
	FairCurve_NullHeight = 3,
};

/* end public enums declaration */

/* python proxy classes for enums */
%pythoncode {

class FairCurve_AnalysisCode(IntEnum):
	FairCurve_OK = 0
	FairCurve_NotConverged = 1
	FairCurve_InfiniteSliding = 2
	FairCurve_NullHeight = 3
FairCurve_OK = FairCurve_AnalysisCode.FairCurve_OK
FairCurve_NotConverged = FairCurve_AnalysisCode.FairCurve_NotConverged
FairCurve_InfiniteSliding = FairCurve_AnalysisCode.FairCurve_InfiniteSliding
FairCurve_NullHeight = FairCurve_AnalysisCode.FairCurve_NullHeight
};
/* end python proxy for enums */

/* handles */
/* end handles declaration */

/* templates */
/* end templates declaration */

/* typedefs */
/* end typedefs declaration */

/*************************
* class FairCurve_Batten *
*************************/
class FairCurve_Batten {
	public:
		/****** FairCurve_Batten::FairCurve_Batten ******/
		/****** md5 signature: b977aacb2439d9bc62055936885846fb ******/
		%feature("compactdefaultargs") FairCurve_Batten;
		%feature("autodoc", "
Parameters
----------
P1: gp_Pnt2d
P2: gp_Pnt2d
Height: double
Slope: double (optional, default to 0)

Return
-------
None

Description
-----------
Constructor with the two points and the geometrical characteristics of the batten (elastic beam) Height is the height of the deformation, and Slope is the slope value, initialized at 0. The user can then supply the desired slope value by the method, SetSlope. Other parameters are initialized as follow: - FreeSliding = False - ConstraintOrder1 = 1 - ConstraintOrder2 = 1 - Angle1 = 0 - Angle2 = 0 - SlidingFactor = 1 Exceptions NegativeValue if Height is less than or equal to 0. NullValue if the distance between P1 and P2 is less than or equal to the tolerance value for distance in Precision::Confusion: P1.IsEqual(P2, Precision::Confusion()). The function gp_Pnt2d::IsEqual tests to see if this is the case.
") FairCurve_Batten;
		 FairCurve_Batten(const gp_Pnt2d & P1, const gp_Pnt2d & P2, const double Height, const double Slope = 0);

		/****** FairCurve_Batten::Compute ******/
		/****** md5 signature: d00238c9078e4eecc790a8b7e9d39af3 ******/
		%feature("compactdefaultargs") Compute;
		%feature("autodoc", "
Parameters
----------
NbIterations: int (optional, default to 50)
Tolerance: double (optional, default to 1.0e-3)

Return
-------
Code: FairCurve_AnalysisCode

Description
-----------
Performs the algorithm, using the arguments Code, NbIterations and Tolerance and computes the curve with respect to the constraints. Code will have one of the following values: - OK - NotConverged - InfiniteSliding - NullHeight The parameters Tolerance and NbIterations control how precise the computation is, and how long it will take.
") Compute;
		virtual bool Compute(FairCurve_AnalysisCode &OutValue, const int NbIterations = 50, const double Tolerance = 1.0e-3);

		/****** FairCurve_Batten::Curve ******/
		/****** md5 signature: 1960069de54819d72fccc75ab85806ec ******/
		%feature("compactdefaultargs") Curve;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom2d_BSplineCurve>

Description
-----------
Returns the computed curve a 2d BSpline.
") Curve;
		opencascade::handle<Geom2d_BSplineCurve> Curve();

		/****** FairCurve_Batten::Dump ******/
		/****** md5 signature: 3285fe47a669df0eece9c96593dad879 ******/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "
Parameters
----------

Return
-------
o: Standard_OStream

Description
-----------
Prints on the stream o information on the current state of the object. //! Private methodes --------------------------------------.
") Dump;
		virtual void Dump(std::ostream &OutValue);

		/****** FairCurve_Batten::GetAngle1 ******/
		/****** md5 signature: 9f76c71806a0e17e5b9cf7c14bc79418 ******/
		%feature("compactdefaultargs") GetAngle1;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns the established first angle.
") GetAngle1;
		double GetAngle1();

		/****** FairCurve_Batten::GetAngle2 ******/
		/****** md5 signature: 270af563eee4d7ab19606bba5e5dea7a ******/
		%feature("compactdefaultargs") GetAngle2;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns the established second angle.
") GetAngle2;
		double GetAngle2();

		/****** FairCurve_Batten::GetConstraintOrder1 ******/
		/****** md5 signature: 68ce162caca35ad2d532825af19e300a ******/
		%feature("compactdefaultargs") GetConstraintOrder1;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the established first constraint order.
") GetConstraintOrder1;
		int GetConstraintOrder1();

		/****** FairCurve_Batten::GetConstraintOrder2 ******/
		/****** md5 signature: 01b67f31a667337739d6a6ec90b7dd50 ******/
		%feature("compactdefaultargs") GetConstraintOrder2;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the established second constraint order.
") GetConstraintOrder2;
		int GetConstraintOrder2();

		/****** FairCurve_Batten::GetFreeSliding ******/
		/****** md5 signature: f23850b1a92a9003dff05f21ce5bf7c3 ******/
		%feature("compactdefaultargs") GetFreeSliding;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns the initial free sliding value, false by default. Free sliding is generally more aesthetically pleasing than constrained sliding. However, the computation can fail with values such as angles greater than PI/2. This is because the resulting batten length is theoretically infinite.
") GetFreeSliding;
		bool GetFreeSliding();

		/****** FairCurve_Batten::GetHeight ******/
		/****** md5 signature: 614c56a5370db026a1c8697071236705 ******/
		%feature("compactdefaultargs") GetHeight;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns the thickness of the lathe.
") GetHeight;
		double GetHeight();

		/****** FairCurve_Batten::GetP1 ******/
		/****** md5 signature: e3b7e23912656f86e80f8f709427d9f1 ******/
		%feature("compactdefaultargs") GetP1;
		%feature("autodoc", "Return
-------
gp_Pnt2d

Description
-----------
Returns the established location of the point P1.
") GetP1;
		const gp_Pnt2d GetP1();

		/****** FairCurve_Batten::GetP2 ******/
		/****** md5 signature: 4a93f246135056c78ef62df8b0634c6b ******/
		%feature("compactdefaultargs") GetP2;
		%feature("autodoc", "Return
-------
gp_Pnt2d

Description
-----------
Returns the established location of the point P2.
") GetP2;
		const gp_Pnt2d GetP2();

		/****** FairCurve_Batten::GetSlidingFactor ******/
		/****** md5 signature: 08558ad495a65fda46254366bf0ade6a ******/
		%feature("compactdefaultargs") GetSlidingFactor;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns the initial sliding factor.
") GetSlidingFactor;
		double GetSlidingFactor();

		/****** FairCurve_Batten::GetSlope ******/
		/****** md5 signature: 458d432338198e94d828e1a7497b6ea6 ******/
		%feature("compactdefaultargs") GetSlope;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns the established slope value.
") GetSlope;
		double GetSlope();

		/****** FairCurve_Batten::SetAngle1 ******/
		/****** md5 signature: 778af9c696947e14351846d93239f9e9 ******/
		%feature("compactdefaultargs") SetAngle1;
		%feature("autodoc", "
Parameters
----------
Angle1: double

Return
-------
None

Description
-----------
Allows you to change the angle Angle1 at the first point, P1. The default setting is 0.
") SetAngle1;
		void SetAngle1(const double Angle1);

		/****** FairCurve_Batten::SetAngle2 ******/
		/****** md5 signature: 6417f6ff5ae05e1df6e68c743d630c0a ******/
		%feature("compactdefaultargs") SetAngle2;
		%feature("autodoc", "
Parameters
----------
Angle2: double

Return
-------
None

Description
-----------
Allows you to change the angle Angle2 at the second point, P2. The default setting is 0.
") SetAngle2;
		void SetAngle2(const double Angle2);

		/****** FairCurve_Batten::SetConstraintOrder1 ******/
		/****** md5 signature: 17865e9d1a299cdf94fc5810be100933 ******/
		%feature("compactdefaultargs") SetConstraintOrder1;
		%feature("autodoc", "
Parameters
----------
ConstraintOrder: int

Return
-------
None

Description
-----------
Allows you to change the order of the constraint on the first point. ConstraintOrder has the default setting of 1. The following settings are available: - 0-the curve must pass through a point - 1-the curve must pass through a point and have a given tangent - 2-the curve must pass through a point, have a given tangent and a given curvature. The third setting is only valid for FairCurve_MinimalVariation curves. These constraints, though geometric, represent the mechanical constraints due, for example, to the resistance of the material the actual physical batten is made of.
") SetConstraintOrder1;
		void SetConstraintOrder1(const int ConstraintOrder);

		/****** FairCurve_Batten::SetConstraintOrder2 ******/
		/****** md5 signature: 4c9f54cbd428a48e70b187d671067305 ******/
		%feature("compactdefaultargs") SetConstraintOrder2;
		%feature("autodoc", "
Parameters
----------
ConstraintOrder: int

Return
-------
None

Description
-----------
Allows you to change the order of the constraint on the second point. ConstraintOrder is initialized with the default setting of 1. The following settings are available: - 0-the curve must pass through a point - 1-the curve must pass through a point and have a given tangent - 2-the curve must pass through a point, have a given tangent and a given curvature. The third setting is only valid for FairCurve_MinimalVariation curves. These constraints, though geometric, represent the mechanical constraints due, for example, to the resistance of the material the actual physical batten is made of.
") SetConstraintOrder2;
		void SetConstraintOrder2(const int ConstraintOrder);

		/****** FairCurve_Batten::SetFreeSliding ******/
		/****** md5 signature: 46ad8559149c1f1f3398b229a4eb18ed ******/
		%feature("compactdefaultargs") SetFreeSliding;
		%feature("autodoc", "
Parameters
----------
FreeSliding: bool

Return
-------
None

Description
-----------
Freesliding is initialized with the default setting false. When Freesliding is set to true and, as a result, sliding is free, the sliding factor is automatically computed to satisfy the equilibrium of the batten.
") SetFreeSliding;
		void SetFreeSliding(const bool FreeSliding);

		/****** FairCurve_Batten::SetHeight ******/
		/****** md5 signature: 824e4e866c615b9e18be2338716259a1 ******/
		%feature("compactdefaultargs") SetHeight;
		%feature("autodoc", "
Parameters
----------
Height: double

Return
-------
None

Description
-----------
Allows you to change the height of the deformation. Raises NegativeValue; -- if Height <= 0 if Height <= 0.
") SetHeight;
		void SetHeight(const double Height);

		/****** FairCurve_Batten::SetP1 ******/
		/****** md5 signature: 0dfcde59302bc2af29fd06cfd3a3752c ******/
		%feature("compactdefaultargs") SetP1;
		%feature("autodoc", "
Parameters
----------
P1: gp_Pnt2d

Return
-------
None

Description
-----------
Allows you to change the location of the point, P1, and in doing so, modify the curve. Warning This method changes the angle as well as the point. Exceptions NullValue if the distance between P1 and P2 is less than or equal to the tolerance value for distance in Precision::Confusion: P1.IsEqual(P2, Precision::Confusion()). The function gp_Pnt2d::IsEqual tests to see if this is the case.
") SetP1;
		void SetP1(const gp_Pnt2d & P1);

		/****** FairCurve_Batten::SetP2 ******/
		/****** md5 signature: 9821cfec95b527b4a62190a7cf154a6f ******/
		%feature("compactdefaultargs") SetP2;
		%feature("autodoc", "
Parameters
----------
P2: gp_Pnt2d

Return
-------
None

Description
-----------
Allows you to change the location of the point, P1, and in doing so, modify the curve. Warning This method changes the angle as well as the point. Exceptions NullValue if the distance between P1 and P2 is less than or equal to the tolerance value for distance in Precision::Confusion: P1.IsEqual(P2, Precision::Confusion()). The function gp_Pnt2d::IsEqual tests to see if this is the case.
") SetP2;
		void SetP2(const gp_Pnt2d & P2);

		/****** FairCurve_Batten::SetSlidingFactor ******/
		/****** md5 signature: 57416de43f6224fd2779aa154fe4376f ******/
		%feature("compactdefaultargs") SetSlidingFactor;
		%feature("autodoc", "
Parameters
----------
SlidingFactor: double

Return
-------
None

Description
-----------
Allows you to change the ratio SlidingFactor. This compares the length of the batten and the reference length, which is, in turn, a function of the constraints. This modification has one of the following two effects: - if you increase the value, it inflates the batten - if you decrease the value, it flattens the batten. When sliding is free, the sliding factor is automatically computed to satisfy the equilibrium of the batten. When sliding is imposed, a value is required for the sliding factor. SlidingFactor is initialized with the default setting of 1.
") SetSlidingFactor;
		void SetSlidingFactor(const double SlidingFactor);

		/****** FairCurve_Batten::SetSlope ******/
		/****** md5 signature: b60756715a3035ea0e96a84892254a95 ******/
		%feature("compactdefaultargs") SetSlope;
		%feature("autodoc", "
Parameters
----------
Slope: double

Return
-------
None

Description
-----------
Allows you to set the slope value, Slope.
") SetSlope;
		void SetSlope(const double Slope);

		/****** FairCurve_Batten::SlidingOfReference ******/
		/****** md5 signature: 0ba869e844363c3c577bc55a60336722 ******/
		%feature("compactdefaultargs") SlidingOfReference;
		%feature("autodoc", "Return
-------
double

Description
-----------
Computes the real number value for length Sliding of Reference for new constraints. If you want to give a specific length to a batten curve, use the following syntax: b.SetSlidingFactor(L / b.SlidingOfReference()) where b is the name of the batten curve object.
") SlidingOfReference;
		double SlidingOfReference();

};


%extend FairCurve_Batten {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************
* class FairCurve_BattenLaw *
****************************/
class FairCurve_BattenLaw : public math_Function {
	public:
		/****** FairCurve_BattenLaw::FairCurve_BattenLaw ******/
		/****** md5 signature: 94900983e6d03e13b6035862059e7ee4 ******/
		%feature("compactdefaultargs") FairCurve_BattenLaw;
		%feature("autodoc", "
Parameters
----------
Heigth: double
Slope: double
Sliding: double

Return
-------
None

Description
-----------
Constructor of linear batten with Heigth: the Heigth at the middle point Slope: the geometric slope of the batten Sliding: Active Length of the batten without extension.
") FairCurve_BattenLaw;
		 FairCurve_BattenLaw(const double Heigth, const double Slope, const double Sliding);

		/****** FairCurve_BattenLaw::SetHeigth ******/
		/****** md5 signature: 1ff5d521721118892f64e13052a2d6d0 ******/
		%feature("compactdefaultargs") SetHeigth;
		%feature("autodoc", "
Parameters
----------
Heigth: double

Return
-------
None

Description
-----------
Change the value of Heigth at the middle point.
") SetHeigth;
		void SetHeigth(const double Heigth);

		/****** FairCurve_BattenLaw::SetSliding ******/
		/****** md5 signature: 4f5266154d5961171a810e3d31d9a0ca ******/
		%feature("compactdefaultargs") SetSliding;
		%feature("autodoc", "
Parameters
----------
Sliding: double

Return
-------
None

Description
-----------
Change the value of sliding.
") SetSliding;
		void SetSliding(const double Sliding);

		/****** FairCurve_BattenLaw::SetSlope ******/
		/****** md5 signature: b60756715a3035ea0e96a84892254a95 ******/
		%feature("compactdefaultargs") SetSlope;
		%feature("autodoc", "
Parameters
----------
Slope: double

Return
-------
None

Description
-----------
Change the value of the geometric slope.
") SetSlope;
		void SetSlope(const double Slope);

		/****** FairCurve_BattenLaw::Value ******/
		/****** md5 signature: 1aa50fc9a0f27ff94d82c2e1ac7ed8e4 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
T: double

Return
-------
THeigth: double

Description
-----------
computes the value of the heigth for the parameter T on the neutral fibber.
") Value;
		bool Value(const double T, Standard_Real &OutValue);

};


%extend FairCurve_BattenLaw {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************************
* class FairCurve_DistributionOfEnergy *
***************************************/
%nodefaultctor FairCurve_DistributionOfEnergy;
class FairCurve_DistributionOfEnergy : public math_FunctionSet {
	public:
		/****** FairCurve_DistributionOfEnergy::NbEquations ******/
		/****** md5 signature: d96db90f938251af5669711b5ae9a95b ******/
		%feature("compactdefaultargs") NbEquations;
		%feature("autodoc", "Return
-------
int

Description
-----------
returns the number of equations of the function.
") NbEquations;
		int NbEquations();

		/****** FairCurve_DistributionOfEnergy::NbVariables ******/
		/****** md5 signature: ac9e90c594b52fb2529a5f6212b74800 ******/
		%feature("compactdefaultargs") NbVariables;
		%feature("autodoc", "Return
-------
int

Description
-----------
returns the number of variables of the function.
") NbVariables;
		int NbVariables();

		/****** FairCurve_DistributionOfEnergy::SetDerivativeOrder ******/
		/****** md5 signature: b6c529d321ab7b539e1e9ce05f3b481c ******/
		%feature("compactdefaultargs") SetDerivativeOrder;
		%feature("autodoc", "
Parameters
----------
DerivativeOrder: int

Return
-------
None

Description
-----------
No available documentation.
") SetDerivativeOrder;
		void SetDerivativeOrder(const int DerivativeOrder);

};


%extend FairCurve_DistributionOfEnergy {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************
* class FairCurve_Energy *
*************************/
%nodefaultctor FairCurve_Energy;
class FairCurve_Energy : public math_MultipleVarFunctionWithHessian {
	public:
		/****** FairCurve_Energy::Gradient ******/
		/****** md5 signature: 5a8a1d40b699db9ffadb1f48516992a9 ******/
		%feature("compactdefaultargs") Gradient;
		%feature("autodoc", "
Parameters
----------
X: math_Vector
G: math_Vector

Return
-------
bool

Description
-----------
computes the gradient <G> of the energys for the variable <X>. Returns True if the computation was done successfully, False otherwise.
") Gradient;
		bool Gradient(const math_Vector & X, math_Vector & G);

		/****** FairCurve_Energy::NbVariables ******/
		/****** md5 signature: ac9e90c594b52fb2529a5f6212b74800 ******/
		%feature("compactdefaultargs") NbVariables;
		%feature("autodoc", "Return
-------
int

Description
-----------
returns the number of variables of the energy.
") NbVariables;
		int NbVariables();

		/****** FairCurve_Energy::Poles ******/
		/****** md5 signature: 613bd70a9a75e11d80606a0eafb9b257 ******/
		%feature("compactdefaultargs") Poles;
		%feature("autodoc", "Return
-------
opencascade::handle<TColgp_HArray1OfPnt2d>

Description
-----------
return the poles.
") Poles;
		const opencascade::handle<TColgp_HArray1OfPnt2d> & Poles();

		/****** FairCurve_Energy::Value ******/
		/****** md5 signature: a76cb02434bec60c18ea5eede648a0e3 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
X: math_Vector

Return
-------
E: double

Description
-----------
computes the values of the Energys E for the variable <X>. Returns True if the computation was done successfully, False otherwise.
") Value;
		bool Value(const math_Vector & X, Standard_Real &OutValue);

		/****** FairCurve_Energy::Values ******/
		/****** md5 signature: 5c46408e4c4fff3c78764de90e23fbbb ******/
		%feature("compactdefaultargs") Values;
		%feature("autodoc", "
Parameters
----------
X: math_Vector
G: math_Vector

Return
-------
E: double

Description
-----------
computes the Energy <E> and the gradient <G> of the energy for the variable <X>. Returns True if the computation was done successfully, False otherwise.
") Values;
		bool Values(const math_Vector & X, Standard_Real &OutValue, math_Vector & G);

		/****** FairCurve_Energy::Values ******/
		/****** md5 signature: bf6c6ce31890fd6cbbd00ee26fd82a37 ******/
		%feature("compactdefaultargs") Values;
		%feature("autodoc", "
Parameters
----------
X: math_Vector
G: math_Vector
H: math_Matrix

Return
-------
E: double

Description
-----------
computes the Energy <E>, the gradient <G> and the Hessian <H> of the energy for the variable <X>. Returns True if the computation was done successfully, False otherwise.
") Values;
		bool Values(const math_Vector & X, Standard_Real &OutValue, math_Vector & G, math_Matrix & H);

		/****** FairCurve_Energy::Variable ******/
		/****** md5 signature: 5c400edfcc0b63c6446300ce04f559fe ******/
		%feature("compactdefaultargs") Variable;
		%feature("autodoc", "
Parameters
----------
X: math_Vector

Return
-------
bool

Description
-----------
compute the variables <X> which correspond with the field <MyPoles>.
") Variable;
		virtual bool Variable(math_Vector & X);

};


%extend FairCurve_Energy {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************
* class FairCurve_Newton *
*************************/
class FairCurve_Newton : public math_NewtonMinimum {
	public:
		/****** FairCurve_Newton::FairCurve_Newton ******/
		/****** md5 signature: 2acdb02714c034dab33a3e8e5945f419 ******/
		%feature("compactdefaultargs") FairCurve_Newton;
		%feature("autodoc", "
Parameters
----------
theFunction: math_MultipleVarFunctionWithHessian
theSpatialTolerance: double (optional, default to 1.0e-7)
theCriteriumTolerance: double (optional, default to 1.0e-7)
theNbIterations: int (optional, default to 40)
theConvexity: double (optional, default to 1.0e-6)
theWithSingularity: bool (optional, default to true)

Return
-------
None

Description
-----------
The tolerance required on the solution is given by Tolerance. Iteration are stopped if (!WithSingularity) and H(F(Xi)) is not definite positive (if the smaller eigenvalue of H < Convexity) or IsConverged() returns True for 2 successives Iterations. Warning: This constructor do not computation.
") FairCurve_Newton;
		 FairCurve_Newton(const math_MultipleVarFunctionWithHessian & theFunction, const double theSpatialTolerance = 1.0e-7, const double theCriteriumTolerance = 1.0e-7, const int theNbIterations = 40, const double theConvexity = 1.0e-6, const bool theWithSingularity = true);

		/****** FairCurve_Newton::IsConverged ******/
		/****** md5 signature: 8bbcd129778b5d55bcd317a2c89ea745 ******/
		%feature("compactdefaultargs") IsConverged;
		%feature("autodoc", "Return
-------
bool

Description
-----------
This method is called at the end of each iteration to check the convergence: || Xi+1 - Xi || < SpatialTolerance/100 Or || Xi+1 - Xi || < SpatialTolerance and |F(Xi+1) - F(Xi)| < CriteriumTolerance * |F(xi)| It can be redefined in a sub-class to implement a specific test.
") IsConverged;
		bool IsConverged();

};


%extend FairCurve_Newton {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************************
* class FairCurve_DistributionOfJerk *
*************************************/
class FairCurve_DistributionOfJerk : public FairCurve_DistributionOfEnergy {
	public:
		/****** FairCurve_DistributionOfJerk::FairCurve_DistributionOfJerk ******/
		/****** md5 signature: 5797dc40eb39388f0c37884119953fd7 ******/
		%feature("compactdefaultargs") FairCurve_DistributionOfJerk;
		%feature("autodoc", "
Parameters
----------
BSplOrder: int
FlatKnots: TColStd_HArray1OfReal
Poles: TColgp_HArray1OfPnt2d
DerivativeOrder: int
Law: FairCurve_BattenLaw
NbValAux: int (optional, default to 0)

Return
-------
None

Description
-----------
No available documentation.
") FairCurve_DistributionOfJerk;
		 FairCurve_DistributionOfJerk(const int BSplOrder, const opencascade::handle<TColStd_HArray1OfReal> & FlatKnots, const opencascade::handle<TColgp_HArray1OfPnt2d> & Poles, const int DerivativeOrder, const FairCurve_BattenLaw & Law, const int NbValAux = 0);

		/****** FairCurve_DistributionOfJerk::Value ******/
		/****** md5 signature: 0c7370340ec5630e535d5a2268027fba ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
X: math_Vector
F: math_Vector

Return
-------
bool

Description
-----------
computes the values <F> of the functions for the variable <X>. returns True if the computation was done successfully, False otherwise.
") Value;
		bool Value(const math_Vector & X, math_Vector & F);

};


%extend FairCurve_DistributionOfJerk {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************************
* class FairCurve_DistributionOfSagging *
****************************************/
class FairCurve_DistributionOfSagging : public FairCurve_DistributionOfEnergy {
	public:
		/****** FairCurve_DistributionOfSagging::FairCurve_DistributionOfSagging ******/
		/****** md5 signature: d6304ca04491f440a5a56f38336f24e9 ******/
		%feature("compactdefaultargs") FairCurve_DistributionOfSagging;
		%feature("autodoc", "
Parameters
----------
BSplOrder: int
FlatKnots: TColStd_HArray1OfReal
Poles: TColgp_HArray1OfPnt2d
DerivativeOrder: int
Law: FairCurve_BattenLaw
NbValAux: int (optional, default to 0)

Return
-------
None

Description
-----------
No available documentation.
") FairCurve_DistributionOfSagging;
		 FairCurve_DistributionOfSagging(const int BSplOrder, const opencascade::handle<TColStd_HArray1OfReal> & FlatKnots, const opencascade::handle<TColgp_HArray1OfPnt2d> & Poles, const int DerivativeOrder, const FairCurve_BattenLaw & Law, const int NbValAux = 0);

		/****** FairCurve_DistributionOfSagging::Value ******/
		/****** md5 signature: 0c7370340ec5630e535d5a2268027fba ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
X: math_Vector
F: math_Vector

Return
-------
bool

Description
-----------
computes the values <F> of the functions for the variable <X>. returns True if the computation was done successfully, False otherwise.
") Value;
		bool Value(const math_Vector & X, math_Vector & F);

};


%extend FairCurve_DistributionOfSagging {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************************
* class FairCurve_DistributionOfTension *
****************************************/
class FairCurve_DistributionOfTension : public FairCurve_DistributionOfEnergy {
	public:
		/****** FairCurve_DistributionOfTension::FairCurve_DistributionOfTension ******/
		/****** md5 signature: 6f3a80a1a4432c8a7c1311a0168e4207 ******/
		%feature("compactdefaultargs") FairCurve_DistributionOfTension;
		%feature("autodoc", "
Parameters
----------
BSplOrder: int
FlatKnots: TColStd_HArray1OfReal
Poles: TColgp_HArray1OfPnt2d
DerivativeOrder: int
LengthSliding: double
Law: FairCurve_BattenLaw
NbValAux: int (optional, default to 0)
Uniform: bool (optional, default to false)

Return
-------
None

Description
-----------
No available documentation.
") FairCurve_DistributionOfTension;
		 FairCurve_DistributionOfTension(const int BSplOrder, const opencascade::handle<TColStd_HArray1OfReal> & FlatKnots, const opencascade::handle<TColgp_HArray1OfPnt2d> & Poles, const int DerivativeOrder, const double LengthSliding, const FairCurve_BattenLaw & Law, const int NbValAux = 0, const bool Uniform = false);

		/****** FairCurve_DistributionOfTension::SetLengthSliding ******/
		/****** md5 signature: b2e6ec88d081bdee92288e409dbf6b29 ******/
		%feature("compactdefaultargs") SetLengthSliding;
		%feature("autodoc", "
Parameters
----------
LengthSliding: double

Return
-------
None

Description
-----------
change the length sliding.
") SetLengthSliding;
		void SetLengthSliding(const double LengthSliding);

		/****** FairCurve_DistributionOfTension::Value ******/
		/****** md5 signature: 0c7370340ec5630e535d5a2268027fba ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
X: math_Vector
F: math_Vector

Return
-------
bool

Description
-----------
computes the values <F> of the functions for the variable <X>. returns True if the computation was done successfully, False otherwise.
") Value;
		bool Value(const math_Vector & X, math_Vector & F);

};


%extend FairCurve_DistributionOfTension {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************
* class FairCurve_EnergyOfBatten *
*********************************/
class FairCurve_EnergyOfBatten : public FairCurve_Energy {
	public:
		/****** FairCurve_EnergyOfBatten::FairCurve_EnergyOfBatten ******/
		/****** md5 signature: e671259e46ea0a6cf73adb49789992ef ******/
		%feature("compactdefaultargs") FairCurve_EnergyOfBatten;
		%feature("autodoc", "
Parameters
----------
BSplOrder: int
FlatKnots: TColStd_HArray1OfReal
Poles: TColgp_HArray1OfPnt2d
ContrOrder1: int
ContrOrder2: int
Law: FairCurve_BattenLaw
LengthSliding: double
FreeSliding: bool (optional, default to true)
Angle1: double (optional, default to 0)
Angle2: double (optional, default to 0)

Return
-------
None

Description
-----------
Angles correspond to the Ox axis.
") FairCurve_EnergyOfBatten;
		 FairCurve_EnergyOfBatten(const int BSplOrder, const opencascade::handle<TColStd_HArray1OfReal> & FlatKnots, const opencascade::handle<TColgp_HArray1OfPnt2d> & Poles, const int ContrOrder1, const int ContrOrder2, const FairCurve_BattenLaw & Law, const double LengthSliding, const bool FreeSliding = true, const double Angle1 = 0, const double Angle2 = 0);

		/****** FairCurve_EnergyOfBatten::LengthSliding ******/
		/****** md5 signature: 11484c3b60e3aad6790ca4483662a526 ******/
		%feature("compactdefaultargs") LengthSliding;
		%feature("autodoc", "Return
-------
double

Description
-----------
return the lengthSliding = P1P2 + Sliding.
") LengthSliding;
		double LengthSliding();

		/****** FairCurve_EnergyOfBatten::Status ******/
		/****** md5 signature: 12583fcd04e2709327135f855828d15d ******/
		%feature("compactdefaultargs") Status;
		%feature("autodoc", "Return
-------
FairCurve_AnalysisCode

Description
-----------
return the status.
") Status;
		FairCurve_AnalysisCode Status();

		/****** FairCurve_EnergyOfBatten::Variable ******/
		/****** md5 signature: 273330c331364af01c072df10b163000 ******/
		%feature("compactdefaultargs") Variable;
		%feature("autodoc", "
Parameters
----------
X: math_Vector

Return
-------
bool

Description
-----------
compute the variables <X> which correspond with the field <MyPoles>.
") Variable;
		bool Variable(math_Vector & X);

};


%extend FairCurve_EnergyOfBatten {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************
* class FairCurve_EnergyOfMVC *
******************************/
class FairCurve_EnergyOfMVC : public FairCurve_Energy {
	public:
		/****** FairCurve_EnergyOfMVC::FairCurve_EnergyOfMVC ******/
		/****** md5 signature: 0518fa3c150864914c0890989cfcb799 ******/
		%feature("compactdefaultargs") FairCurve_EnergyOfMVC;
		%feature("autodoc", "
Parameters
----------
BSplOrder: int
FlatKnots: TColStd_HArray1OfReal
Poles: TColgp_HArray1OfPnt2d
ContrOrder1: int
ContrOrder2: int
Law: FairCurve_BattenLaw
PhysicalRatio: double
LengthSliding: double
FreeSliding: bool (optional, default to true)
Angle1: double (optional, default to 0)
Angle2: double (optional, default to 0)
Curvature1: double (optional, default to 0)
Curvature2: double (optional, default to 0)

Return
-------
None

Description
-----------
Angles correspond to the Ox axis.
") FairCurve_EnergyOfMVC;
		 FairCurve_EnergyOfMVC(const int BSplOrder, const opencascade::handle<TColStd_HArray1OfReal> & FlatKnots, const opencascade::handle<TColgp_HArray1OfPnt2d> & Poles, const int ContrOrder1, const int ContrOrder2, const FairCurve_BattenLaw & Law, const double PhysicalRatio, const double LengthSliding, const bool FreeSliding = true, const double Angle1 = 0, const double Angle2 = 0, const double Curvature1 = 0, const double Curvature2 = 0);

		/****** FairCurve_EnergyOfMVC::LengthSliding ******/
		/****** md5 signature: 11484c3b60e3aad6790ca4483662a526 ******/
		%feature("compactdefaultargs") LengthSliding;
		%feature("autodoc", "Return
-------
double

Description
-----------
return the lengthSliding = P1P2 + Sliding.
") LengthSliding;
		double LengthSliding();

		/****** FairCurve_EnergyOfMVC::Status ******/
		/****** md5 signature: 12583fcd04e2709327135f855828d15d ******/
		%feature("compactdefaultargs") Status;
		%feature("autodoc", "Return
-------
FairCurve_AnalysisCode

Description
-----------
return the status.
") Status;
		FairCurve_AnalysisCode Status();

		/****** FairCurve_EnergyOfMVC::Variable ******/
		/****** md5 signature: 273330c331364af01c072df10b163000 ******/
		%feature("compactdefaultargs") Variable;
		%feature("autodoc", "
Parameters
----------
X: math_Vector

Return
-------
bool

Description
-----------
compute the variables <X> which correspond with the field <MyPoles>.
") Variable;
		bool Variable(math_Vector & X);

};


%extend FairCurve_EnergyOfMVC {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************************
* class FairCurve_MinimalVariation *
***********************************/
class FairCurve_MinimalVariation : public FairCurve_Batten {
	public:
		/****** FairCurve_MinimalVariation::FairCurve_MinimalVariation ******/
		/****** md5 signature: 47ffd403aed61700a67b553ee63214e0 ******/
		%feature("compactdefaultargs") FairCurve_MinimalVariation;
		%feature("autodoc", "
Parameters
----------
P1: gp_Pnt2d
P2: gp_Pnt2d
Heigth: double
Slope: double (optional, default to 0)
PhysicalRatio: double (optional, default to 0)

Return
-------
None

Description
-----------
Constructs the two contact points P1 and P2 and the geometrical characteristics of the batten (elastic beam) These include the real number values for height of deformation Height, slope value Slope, and kind of energy PhysicalRatio. The kinds of energy include: - Jerk (0) - Sagging (1). Note that the default setting for Physical Ration is in FairCurve_Batten Other parameters are initialized as follow: - FreeSliding = False - ConstraintOrder1 = 1 - ConstraintOrder2 = 1 - Angle1 = 0 - Angle2 = 0 - Curvature1 = 0 - Curvature2 = 0 - SlidingFactor = 1 Warning If PhysicalRatio equals 1, you cannot impose constraints on curvature. Exceptions NegativeValue if Height is less than or equal to 0. NullValue if the distance between P1 and P2 is less than or equal to the tolerance value for distance in Precision::Confusion: P1.IsEqual(P2, Precision::Confusion()). The function gp_Pnt2d::IsEqual tests to see if this is the case. Definition of the geometricals constraints.
") FairCurve_MinimalVariation;
		 FairCurve_MinimalVariation(const gp_Pnt2d & P1, const gp_Pnt2d & P2, const double Heigth, const double Slope = 0, const double PhysicalRatio = 0);

		/****** FairCurve_MinimalVariation::Compute ******/
		/****** md5 signature: 4f1939fcbf30caab9ac0fd38e34c79d3 ******/
		%feature("compactdefaultargs") Compute;
		%feature("autodoc", "
Parameters
----------
NbIterations: int (optional, default to 50)
Tolerance: double (optional, default to 1.0e-3)

Return
-------
ACode: FairCurve_AnalysisCode

Description
-----------
Computes the curve with respect to the constraints, NbIterations and Tolerance. The tolerance setting allows you to control the precision of computation, and the maximum number of iterations allows you to set a limit on computation time.
") Compute;
		bool Compute(FairCurve_AnalysisCode &OutValue, const int NbIterations = 50, const double Tolerance = 1.0e-3);

		/****** FairCurve_MinimalVariation::Dump ******/
		/****** md5 signature: 3c2a1f639f47eaff57a9bcd4d3fb612a ******/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "
Parameters
----------

Return
-------
o: Standard_OStream

Description
-----------
Prints on the stream o information on the current state of the object. Is used to redefine the operator <<.
") Dump;
		void Dump(std::ostream &OutValue);

		/****** FairCurve_MinimalVariation::GetCurvature1 ******/
		/****** md5 signature: 0907bcc5134506bf6ff3409e9c9831d6 ******/
		%feature("compactdefaultargs") GetCurvature1;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns the first established curvature.
") GetCurvature1;
		double GetCurvature1();

		/****** FairCurve_MinimalVariation::GetCurvature2 ******/
		/****** md5 signature: f08038ca5ffefd47f8ca311cfa6dbc3f ******/
		%feature("compactdefaultargs") GetCurvature2;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns the second established curvature.
") GetCurvature2;
		double GetCurvature2();

		/****** FairCurve_MinimalVariation::GetPhysicalRatio ******/
		/****** md5 signature: 147166d64b19b6d9f0b68d156e0575d0 ******/
		%feature("compactdefaultargs") GetPhysicalRatio;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns the physical ratio, or kind of energy.
") GetPhysicalRatio;
		double GetPhysicalRatio();

		/****** FairCurve_MinimalVariation::SetCurvature1 ******/
		/****** md5 signature: 6c1f5e2b1fc853411df4eb784abd3e7e ******/
		%feature("compactdefaultargs") SetCurvature1;
		%feature("autodoc", "
Parameters
----------
Curvature: double

Return
-------
None

Description
-----------
Allows you to set a new constraint on curvature at the first point.
") SetCurvature1;
		void SetCurvature1(const double Curvature);

		/****** FairCurve_MinimalVariation::SetCurvature2 ******/
		/****** md5 signature: 6962dcc67c20ba6af5601d840e87e63c ******/
		%feature("compactdefaultargs") SetCurvature2;
		%feature("autodoc", "
Parameters
----------
Curvature: double

Return
-------
None

Description
-----------
Allows you to set a new constraint on curvature at the second point.
") SetCurvature2;
		void SetCurvature2(const double Curvature);

		/****** FairCurve_MinimalVariation::SetPhysicalRatio ******/
		/****** md5 signature: 5db75a33241654f6cd563c40f4c64c84 ******/
		%feature("compactdefaultargs") SetPhysicalRatio;
		%feature("autodoc", "
Parameters
----------
Ratio: double

Return
-------
None

Description
-----------
Allows you to set the physical ratio Ratio. The kinds of energy which you can specify include: 0 is only 'Jerk' Energy 1 is only 'Sagging' Energy like batten Warning: if Ratio is 1 it is impossible to impose curvature constraints. Raises DomainError if Ratio < 0 or Ratio > 1.
") SetPhysicalRatio;
		void SetPhysicalRatio(const double Ratio);

};


%extend FairCurve_MinimalVariation {
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
