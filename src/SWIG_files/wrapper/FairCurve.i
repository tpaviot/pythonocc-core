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
%define FAIRCURVEDOCSTRING
"FairCurve module, see official documentation at
https://dev.opencascade.org/doc/occt-7.8.0/refman/html/package_faircurve.html"
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
		/****** md5 signature: 380407de622a1c4cdbb02a5494e3f311 ******/
		%feature("compactdefaultargs") FairCurve_Batten;
		%feature("autodoc", "
Parameters
----------
P1: gp_Pnt2d
P2: gp_Pnt2d
Height: float
Slope: float (optional, default to 0)

Return
-------
None

Description
-----------
Constructor with the two points and the geometrical characteristics of the batten (elastic beam) height is the height of the deformation, and slope is the slope value, initialized at 0. the user can then supply the desired slope value by the method, setslope. other parameters are initialized as follow: - freesliding = false - constraintorder1 = 1 - constraintorder2 = 1 - angle1 = 0 - angle2 = 0 - slidingfactor = 1 exceptions negativevalue if height is less than or equal to 0. nullvalue if the distance between p1 and p2 is less than or equal to the tolerance value for distance in precision::confusion: p1.isequal(p2, precision::confusion()). the function gp_pnt2d::isequal tests to see if this is the case.
") FairCurve_Batten;
		 FairCurve_Batten(const gp_Pnt2d & P1, const gp_Pnt2d & P2, const Standard_Real Height, const Standard_Real Slope = 0);

		/****** FairCurve_Batten::Compute ******/
		/****** md5 signature: 859acceef7f0c7c74b5b50c52c471073 ******/
		%feature("compactdefaultargs") Compute;
		%feature("autodoc", "
Parameters
----------
NbIterations: int (optional, default to 50)
Tolerance: float (optional, default to 1.0e-3)

Return
-------
Code: FairCurve_AnalysisCode

Description
-----------
Performs the algorithm, using the arguments code, nbiterations and tolerance and computes the curve with respect to the constraints. code will have one of the following values: - ok - notconverged - infinitesliding - nullheight the parameters tolerance and nbiterations control how precise the computation is, and how long it will take.
") Compute;
		virtual Standard_Boolean Compute(FairCurve_AnalysisCode &OutValue, const Standard_Integer NbIterations = 50, const Standard_Real Tolerance = 1.0e-3);

		/****** FairCurve_Batten::Curve ******/
		/****** md5 signature: 1960069de54819d72fccc75ab85806ec ******/
		%feature("compactdefaultargs") Curve;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom2d_BSplineCurve>

Description
-----------
Returns the computed curve a 2d bspline.
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
Prints on the stream o information on the current state of the object. //! private methodes --------------------------------------.
") Dump;
		virtual void Dump(std::ostream &OutValue);

		/****** FairCurve_Batten::GetAngle1 ******/
		/****** md5 signature: 4d8e16f87d9a075ff3d1c86749675db9 ******/
		%feature("compactdefaultargs") GetAngle1;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the established first angle.
") GetAngle1;
		Standard_Real GetAngle1();

		/****** FairCurve_Batten::GetAngle2 ******/
		/****** md5 signature: 1b0116e759407aff13eea52f7386c84b ******/
		%feature("compactdefaultargs") GetAngle2;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the established second angle.
") GetAngle2;
		Standard_Real GetAngle2();

		/****** FairCurve_Batten::GetConstraintOrder1 ******/
		/****** md5 signature: c4b51bbe0bd7e6a31f685b79fe737211 ******/
		%feature("compactdefaultargs") GetConstraintOrder1;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the established first constraint order.
") GetConstraintOrder1;
		Standard_Integer GetConstraintOrder1();

		/****** FairCurve_Batten::GetConstraintOrder2 ******/
		/****** md5 signature: 75f9bf17465b91904e29b2d19da33e9e ******/
		%feature("compactdefaultargs") GetConstraintOrder2;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the established second constraint order.
") GetConstraintOrder2;
		Standard_Integer GetConstraintOrder2();

		/****** FairCurve_Batten::GetFreeSliding ******/
		/****** md5 signature: 8a10e85d9006392ce97c8cbdcb1440a3 ******/
		%feature("compactdefaultargs") GetFreeSliding;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns the initial free sliding value, false by default. free sliding is generally more aesthetically pleasing than constrained sliding. however, the computation can fail with values such as angles greater than pi/2. this is because the resulting batten length is theoretically infinite.
") GetFreeSliding;
		Standard_Boolean GetFreeSliding();

		/****** FairCurve_Batten::GetHeight ******/
		/****** md5 signature: cb55b42cbc9248a1048701c4dad2d0e9 ******/
		%feature("compactdefaultargs") GetHeight;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the thickness of the lathe.
") GetHeight;
		Standard_Real GetHeight();

		/****** FairCurve_Batten::GetP1 ******/
		/****** md5 signature: e3b7e23912656f86e80f8f709427d9f1 ******/
		%feature("compactdefaultargs") GetP1;
		%feature("autodoc", "Return
-------
gp_Pnt2d

Description
-----------
Returns the established location of the point p1.
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
Returns the established location of the point p2.
") GetP2;
		const gp_Pnt2d GetP2();

		/****** FairCurve_Batten::GetSlidingFactor ******/
		/****** md5 signature: 91085c4affe8e6adc614143ccbdd50be ******/
		%feature("compactdefaultargs") GetSlidingFactor;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the initial sliding factor.
") GetSlidingFactor;
		Standard_Real GetSlidingFactor();

		/****** FairCurve_Batten::GetSlope ******/
		/****** md5 signature: cb1e8d7130c876dd179aa3aea152fa51 ******/
		%feature("compactdefaultargs") GetSlope;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the established slope value.
") GetSlope;
		Standard_Real GetSlope();

		/****** FairCurve_Batten::SetAngle1 ******/
		/****** md5 signature: ccadb264eed86a01c5686f6aaf84bed3 ******/
		%feature("compactdefaultargs") SetAngle1;
		%feature("autodoc", "
Parameters
----------
Angle1: float

Return
-------
None

Description
-----------
Allows you to change the angle angle1 at the first point, p1. the default setting is 0.
") SetAngle1;
		void SetAngle1(const Standard_Real Angle1);

		/****** FairCurve_Batten::SetAngle2 ******/
		/****** md5 signature: b346b4f56583f36504e5d16d1c5ff35d ******/
		%feature("compactdefaultargs") SetAngle2;
		%feature("autodoc", "
Parameters
----------
Angle2: float

Return
-------
None

Description
-----------
Allows you to change the angle angle2 at the second point, p2. the default setting is 0.
") SetAngle2;
		void SetAngle2(const Standard_Real Angle2);

		/****** FairCurve_Batten::SetConstraintOrder1 ******/
		/****** md5 signature: 706157cb862e27fa9cb42242c8b68e2c ******/
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
Allows you to change the order of the constraint on the first point. constraintorder has the default setting of 1. the following settings are available: - 0-the curve must pass through a point - 1-the curve must pass through a point and have a given tangent - 2-the curve must pass through a point, have a given tangent and a given curvature. the third setting is only valid for faircurve_minimalvariation curves. these constraints, though geometric, represent the mechanical constraints due, for example, to the resistance of the material the actual physical batten is made of.
") SetConstraintOrder1;
		void SetConstraintOrder1(const Standard_Integer ConstraintOrder);

		/****** FairCurve_Batten::SetConstraintOrder2 ******/
		/****** md5 signature: 8f9a675e3b420569b88d1d934fc1e8d0 ******/
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
Allows you to change the order of the constraint on the second point. constraintorder is initialized with the default setting of 1. the following settings are available: - 0-the curve must pass through a point - 1-the curve must pass through a point and have a given tangent - 2-the curve must pass through a point, have a given tangent and a given curvature. the third setting is only valid for faircurve_minimalvariation curves. these constraints, though geometric, represent the mechanical constraints due, for example, to the resistance of the material the actual physical batten is made of.
") SetConstraintOrder2;
		void SetConstraintOrder2(const Standard_Integer ConstraintOrder);

		/****** FairCurve_Batten::SetFreeSliding ******/
		/****** md5 signature: fada5a85cef264052bf0479f2974be05 ******/
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
Freesliding is initialized with the default setting false. when freesliding is set to true and, as a result, sliding is free, the sliding factor is automatically computed to satisfy the equilibrium of the batten.
") SetFreeSliding;
		void SetFreeSliding(const Standard_Boolean FreeSliding);

		/****** FairCurve_Batten::SetHeight ******/
		/****** md5 signature: 229695ff1af7f3f1e8a3576f456b61c1 ******/
		%feature("compactdefaultargs") SetHeight;
		%feature("autodoc", "
Parameters
----------
Height: float

Return
-------
None

Description
-----------
Allows you to change the height of the deformation. raises negativevalue; -- if height <= 0 if height <= 0.
") SetHeight;
		void SetHeight(const Standard_Real Height);

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
Allows you to change the location of the point, p1, and in doing so, modify the curve. warning this method changes the angle as well as the point. exceptions nullvalue if the distance between p1 and p2 is less than or equal to the tolerance value for distance in precision::confusion: p1.isequal(p2, precision::confusion()). the function gp_pnt2d::isequal tests to see if this is the case.
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
Allows you to change the location of the point, p1, and in doing so, modify the curve. warning this method changes the angle as well as the point. exceptions nullvalue if the distance between p1 and p2 is less than or equal to the tolerance value for distance in precision::confusion: p1.isequal(p2, precision::confusion()). the function gp_pnt2d::isequal tests to see if this is the case.
") SetP2;
		void SetP2(const gp_Pnt2d & P2);

		/****** FairCurve_Batten::SetSlidingFactor ******/
		/****** md5 signature: 18d0d2495aa8aa622ba79db6133d2944 ******/
		%feature("compactdefaultargs") SetSlidingFactor;
		%feature("autodoc", "
Parameters
----------
SlidingFactor: float

Return
-------
None

Description
-----------
Allows you to change the ratio slidingfactor. this compares the length of the batten and the reference length, which is, in turn, a function of the constraints. this modification has one of the following two effects: - if you increase the value, it inflates the batten - if you decrease the value, it flattens the batten. when sliding is free, the sliding factor is automatically computed to satisfy the equilibrium of the batten. when sliding is imposed, a value is required for the sliding factor. slidingfactor is initialized with the default setting of 1.
") SetSlidingFactor;
		void SetSlidingFactor(const Standard_Real SlidingFactor);

		/****** FairCurve_Batten::SetSlope ******/
		/****** md5 signature: 454b326f397753f4b78e0ff55e205027 ******/
		%feature("compactdefaultargs") SetSlope;
		%feature("autodoc", "
Parameters
----------
Slope: float

Return
-------
None

Description
-----------
Allows you to set the slope value, slope.
") SetSlope;
		void SetSlope(const Standard_Real Slope);

		/****** FairCurve_Batten::SlidingOfReference ******/
		/****** md5 signature: 6fd1a7741882e63f841356aad5e67e34 ******/
		%feature("compactdefaultargs") SlidingOfReference;
		%feature("autodoc", "Return
-------
float

Description
-----------
Computes the real number value for length sliding of reference for new constraints. if you want to give a specific length to a batten curve, use the following syntax: b.setslidingfactor(l / b.slidingofreference()) where b is the name of the batten curve object.
") SlidingOfReference;
		Standard_Real SlidingOfReference();

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
		/****** md5 signature: 2dff18d7398fa7390870579151b00dda ******/
		%feature("compactdefaultargs") FairCurve_BattenLaw;
		%feature("autodoc", "
Parameters
----------
Heigth: float
Slope: float
Sliding: float

Return
-------
None

Description
-----------
Constructor of linear batten with heigth: the heigth at the middle point slope: the geometric slope of the batten sliding: active length of the batten without extension.
") FairCurve_BattenLaw;
		 FairCurve_BattenLaw(const Standard_Real Heigth, const Standard_Real Slope, const Standard_Real Sliding);

		/****** FairCurve_BattenLaw::SetHeigth ******/
		/****** md5 signature: 13fef69a8278fbf42dc5d1ec9f30efe8 ******/
		%feature("compactdefaultargs") SetHeigth;
		%feature("autodoc", "
Parameters
----------
Heigth: float

Return
-------
None

Description
-----------
Change the value of heigth at the middle point.
") SetHeigth;
		void SetHeigth(const Standard_Real Heigth);

		/****** FairCurve_BattenLaw::SetSliding ******/
		/****** md5 signature: d65baa74829661bf4b5edd29b88bfdc2 ******/
		%feature("compactdefaultargs") SetSliding;
		%feature("autodoc", "
Parameters
----------
Sliding: float

Return
-------
None

Description
-----------
Change the value of sliding.
") SetSliding;
		void SetSliding(const Standard_Real Sliding);

		/****** FairCurve_BattenLaw::SetSlope ******/
		/****** md5 signature: 454b326f397753f4b78e0ff55e205027 ******/
		%feature("compactdefaultargs") SetSlope;
		%feature("autodoc", "
Parameters
----------
Slope: float

Return
-------
None

Description
-----------
Change the value of the geometric slope.
") SetSlope;
		void SetSlope(const Standard_Real Slope);

		/****** FairCurve_BattenLaw::Value ******/
		/****** md5 signature: 9e6faca0f50ca085e868fe1cb096506b ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
T: float

Return
-------
THeigth: float

Description
-----------
Computes the value of the heigth for the parameter t on the neutral fibber.
") Value;
		virtual Standard_Boolean Value(const Standard_Real T, Standard_Real &OutValue);

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
		/****** md5 signature: 186743efcc98b222ef8f5159fb11b9d2 ******/
		%feature("compactdefaultargs") NbEquations;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of equations of the function.
") NbEquations;
		virtual Standard_Integer NbEquations();

		/****** FairCurve_DistributionOfEnergy::NbVariables ******/
		/****** md5 signature: 28ab91d0183585502101892aac2c5b98 ******/
		%feature("compactdefaultargs") NbVariables;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of variables of the function.
") NbVariables;
		virtual Standard_Integer NbVariables();

		/****** FairCurve_DistributionOfEnergy::SetDerivativeOrder ******/
		/****** md5 signature: 61a52ca37f217ee57d4348b2d158671b ******/
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
		void SetDerivativeOrder(const Standard_Integer DerivativeOrder);

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
		/****** md5 signature: 1a885d14faccb1c8d59b3f361f1c9167 ******/
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
Computes the gradient <g> of the energys for the variable <x>. returns true if the computation was done successfully, false otherwise.
") Gradient;
		virtual Standard_Boolean Gradient(const math_Vector & X, math_Vector & G);

		/****** FairCurve_Energy::NbVariables ******/
		/****** md5 signature: 28ab91d0183585502101892aac2c5b98 ******/
		%feature("compactdefaultargs") NbVariables;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of variables of the energy.
") NbVariables;
		virtual Standard_Integer NbVariables();

		/****** FairCurve_Energy::Poles ******/
		/****** md5 signature: 4a151d768c1822dfa99232d1389d5e79 ******/
		%feature("compactdefaultargs") Poles;
		%feature("autodoc", "Return
-------
opencascade::handle<TColgp_HArray1OfPnt2d>

Description
-----------
Return the poles.
") Poles;
		const opencascade::handle<TColgp_HArray1OfPnt2d> & Poles();

		/****** FairCurve_Energy::Value ******/
		/****** md5 signature: 309672a7cfa6f1105664cb95344f4bcc ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
X: math_Vector

Return
-------
E: float

Description
-----------
Computes the values of the energys e for the variable <x>. returns true if the computation was done successfully, false otherwise.
") Value;
		virtual Standard_Boolean Value(const math_Vector & X, Standard_Real &OutValue);

		/****** FairCurve_Energy::Values ******/
		/****** md5 signature: 10c7b2f720f30502e78b77290fcc0e35 ******/
		%feature("compactdefaultargs") Values;
		%feature("autodoc", "
Parameters
----------
X: math_Vector
G: math_Vector

Return
-------
E: float

Description
-----------
Computes the energy <e> and the gradient <g> of the energy for the variable <x>. returns true if the computation was done successfully, false otherwise.
") Values;
		virtual Standard_Boolean Values(const math_Vector & X, Standard_Real &OutValue, math_Vector & G);

		/****** FairCurve_Energy::Values ******/
		/****** md5 signature: f03bbcb06a95f87d927a152a25318980 ******/
		%feature("compactdefaultargs") Values;
		%feature("autodoc", "
Parameters
----------
X: math_Vector
G: math_Vector
H: math_Matrix

Return
-------
E: float

Description
-----------
Computes the energy <e>, the gradient <g> and the hessian <h> of the energy for the variable <x>. returns true if the computation was done successfully, false otherwise.
") Values;
		virtual Standard_Boolean Values(const math_Vector & X, Standard_Real &OutValue, math_Vector & G, math_Matrix & H);

		/****** FairCurve_Energy::Variable ******/
		/****** md5 signature: fa8df2d29e345b3cf776461e366afde6 ******/
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
Compute the variables <x> which correspond with the field <mypoles>.
") Variable;
		virtual Standard_Boolean Variable(math_Vector & X);

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
		/****** md5 signature: 9a2660a6c8e2c1dbddd3a05f6d65cbfa ******/
		%feature("compactdefaultargs") FairCurve_Newton;
		%feature("autodoc", "
Parameters
----------
theFunction: math_MultipleVarFunctionWithHessian
theSpatialTolerance: float (optional, default to 1.0e-7)
theCriteriumTolerance: float (optional, default to 1.0e-7)
theNbIterations: int (optional, default to 40)
theConvexity: float (optional, default to 1.0e-6)
theWithSingularity: bool (optional, default to Standard_True)

Return
-------
None

Description
-----------
The tolerance required on the solution is given by tolerance. iteration are stopped if (!withsingularity) and h(f(xi)) is not definite positive (if the smaller eigenvalue of h < convexity) or isconverged() returns true for 2 successives iterations. warning: this constructor do not computation.
") FairCurve_Newton;
		 FairCurve_Newton(const math_MultipleVarFunctionWithHessian & theFunction, const Standard_Real theSpatialTolerance = 1.0e-7, const Standard_Real theCriteriumTolerance = 1.0e-7, const Standard_Integer theNbIterations = 40, const Standard_Real theConvexity = 1.0e-6, const Standard_Boolean theWithSingularity = Standard_True);

		/****** FairCurve_Newton::IsConverged ******/
		/****** md5 signature: 1f771ed93f3c652c579f0d5bf4b5d4a5 ******/
		%feature("compactdefaultargs") IsConverged;
		%feature("autodoc", "Return
-------
bool

Description
-----------
This method is called at the end of each iteration to check the convergence: || xi+1 - xi || < spatialtolerance/100 or || xi+1 - xi || < spatialtolerance and |f(xi+1) - f(xi)| < criteriumtolerance * |f(xi)| it can be redefined in a sub-class to implement a specific test.
") IsConverged;
		virtual Standard_Boolean IsConverged();

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
		/****** md5 signature: 7e7584f0643d5cb994e495c5fce52166 ******/
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
		 FairCurve_DistributionOfJerk(const Standard_Integer BSplOrder, const opencascade::handle<TColStd_HArray1OfReal> & FlatKnots, const opencascade::handle<TColgp_HArray1OfPnt2d> & Poles, const Standard_Integer DerivativeOrder, const FairCurve_BattenLaw & Law, const Standard_Integer NbValAux = 0);

		/****** FairCurve_DistributionOfJerk::Value ******/
		/****** md5 signature: 0f8ab7140704c6b797e41dd63743f62b ******/
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
Computes the values <f> of the functions for the variable <x>. returns true if the computation was done successfully, false otherwise.
") Value;
		virtual Standard_Boolean Value(const math_Vector & X, math_Vector & F);

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
		/****** md5 signature: 89a4678163f0a066b64e7643c2a41501 ******/
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
		 FairCurve_DistributionOfSagging(const Standard_Integer BSplOrder, const opencascade::handle<TColStd_HArray1OfReal> & FlatKnots, const opencascade::handle<TColgp_HArray1OfPnt2d> & Poles, const Standard_Integer DerivativeOrder, const FairCurve_BattenLaw & Law, const Standard_Integer NbValAux = 0);

		/****** FairCurve_DistributionOfSagging::Value ******/
		/****** md5 signature: 0f8ab7140704c6b797e41dd63743f62b ******/
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
Computes the values <f> of the functions for the variable <x>. returns true if the computation was done successfully, false otherwise.
") Value;
		virtual Standard_Boolean Value(const math_Vector & X, math_Vector & F);

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
		/****** md5 signature: 28ac1783dc89f2e8a2ab0e2b2db5d32c ******/
		%feature("compactdefaultargs") FairCurve_DistributionOfTension;
		%feature("autodoc", "
Parameters
----------
BSplOrder: int
FlatKnots: TColStd_HArray1OfReal
Poles: TColgp_HArray1OfPnt2d
DerivativeOrder: int
LengthSliding: float
Law: FairCurve_BattenLaw
NbValAux: int (optional, default to 0)
Uniform: bool (optional, default to Standard_False)

Return
-------
None

Description
-----------
No available documentation.
") FairCurve_DistributionOfTension;
		 FairCurve_DistributionOfTension(const Standard_Integer BSplOrder, const opencascade::handle<TColStd_HArray1OfReal> & FlatKnots, const opencascade::handle<TColgp_HArray1OfPnt2d> & Poles, const Standard_Integer DerivativeOrder, const Standard_Real LengthSliding, const FairCurve_BattenLaw & Law, const Standard_Integer NbValAux = 0, const Standard_Boolean Uniform = Standard_False);

		/****** FairCurve_DistributionOfTension::SetLengthSliding ******/
		/****** md5 signature: 4e17a9d00916de919a874074fff25d1d ******/
		%feature("compactdefaultargs") SetLengthSliding;
		%feature("autodoc", "
Parameters
----------
LengthSliding: float

Return
-------
None

Description
-----------
Change the length sliding.
") SetLengthSliding;
		void SetLengthSliding(const Standard_Real LengthSliding);

		/****** FairCurve_DistributionOfTension::Value ******/
		/****** md5 signature: 0f8ab7140704c6b797e41dd63743f62b ******/
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
Computes the values <f> of the functions for the variable <x>. returns true if the computation was done successfully, false otherwise.
") Value;
		virtual Standard_Boolean Value(const math_Vector & X, math_Vector & F);

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
		/****** md5 signature: 4c2d6f4d88f3053d8cf08761865050dd ******/
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
LengthSliding: float
FreeSliding: bool (optional, default to Standard_True)
Angle1: float (optional, default to 0)
Angle2: float (optional, default to 0)

Return
-------
None

Description
-----------
Angles corresspond to the ox axis.
") FairCurve_EnergyOfBatten;
		 FairCurve_EnergyOfBatten(const Standard_Integer BSplOrder, const opencascade::handle<TColStd_HArray1OfReal> & FlatKnots, const opencascade::handle<TColgp_HArray1OfPnt2d> & Poles, const Standard_Integer ContrOrder1, const Standard_Integer ContrOrder2, const FairCurve_BattenLaw & Law, const Standard_Real LengthSliding, const Standard_Boolean FreeSliding = Standard_True, const Standard_Real Angle1 = 0, const Standard_Real Angle2 = 0);

		/****** FairCurve_EnergyOfBatten::LengthSliding ******/
		/****** md5 signature: 272f9ad7d0db8234f1a58e19b812a9fe ******/
		%feature("compactdefaultargs") LengthSliding;
		%feature("autodoc", "Return
-------
float

Description
-----------
Return the lengthsliding = p1p2 + sliding.
") LengthSliding;
		Standard_Real LengthSliding();

		/****** FairCurve_EnergyOfBatten::Status ******/
		/****** md5 signature: 12583fcd04e2709327135f855828d15d ******/
		%feature("compactdefaultargs") Status;
		%feature("autodoc", "Return
-------
FairCurve_AnalysisCode

Description
-----------
Return the status.
") Status;
		FairCurve_AnalysisCode Status();

		/****** FairCurve_EnergyOfBatten::Variable ******/
		/****** md5 signature: 6b3488daaca93e6e9325a2eab7fcdfd7 ******/
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
Compute the variables <x> which correspond with the field <mypoles>.
") Variable;
		virtual Standard_Boolean Variable(math_Vector & X);

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
		/****** md5 signature: de2177808d51e5df75076822e78b5709 ******/
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
PhysicalRatio: float
LengthSliding: float
FreeSliding: bool (optional, default to Standard_True)
Angle1: float (optional, default to 0)
Angle2: float (optional, default to 0)
Curvature1: float (optional, default to 0)
Curvature2: float (optional, default to 0)

Return
-------
None

Description
-----------
Angles corresspond to the ox axis.
") FairCurve_EnergyOfMVC;
		 FairCurve_EnergyOfMVC(const Standard_Integer BSplOrder, const opencascade::handle<TColStd_HArray1OfReal> & FlatKnots, const opencascade::handle<TColgp_HArray1OfPnt2d> & Poles, const Standard_Integer ContrOrder1, const Standard_Integer ContrOrder2, const FairCurve_BattenLaw & Law, const Standard_Real PhysicalRatio, const Standard_Real LengthSliding, const Standard_Boolean FreeSliding = Standard_True, const Standard_Real Angle1 = 0, const Standard_Real Angle2 = 0, const Standard_Real Curvature1 = 0, const Standard_Real Curvature2 = 0);

		/****** FairCurve_EnergyOfMVC::LengthSliding ******/
		/****** md5 signature: 272f9ad7d0db8234f1a58e19b812a9fe ******/
		%feature("compactdefaultargs") LengthSliding;
		%feature("autodoc", "Return
-------
float

Description
-----------
Return the lengthsliding = p1p2 + sliding.
") LengthSliding;
		Standard_Real LengthSliding();

		/****** FairCurve_EnergyOfMVC::Status ******/
		/****** md5 signature: 12583fcd04e2709327135f855828d15d ******/
		%feature("compactdefaultargs") Status;
		%feature("autodoc", "Return
-------
FairCurve_AnalysisCode

Description
-----------
Return the status.
") Status;
		FairCurve_AnalysisCode Status();

		/****** FairCurve_EnergyOfMVC::Variable ******/
		/****** md5 signature: 6b3488daaca93e6e9325a2eab7fcdfd7 ******/
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
Compute the variables <x> which correspond with the field <mypoles>.
") Variable;
		virtual Standard_Boolean Variable(math_Vector & X);

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
		/****** md5 signature: 15ec89a9e6a7c802ed5347068718d11a ******/
		%feature("compactdefaultargs") FairCurve_MinimalVariation;
		%feature("autodoc", "
Parameters
----------
P1: gp_Pnt2d
P2: gp_Pnt2d
Heigth: float
Slope: float (optional, default to 0)
PhysicalRatio: float (optional, default to 0)

Return
-------
None

Description
-----------
Constructs the two contact points p1 and p2 and the geometrical characteristics of the batten (elastic beam) these include the real number values for height of deformation height, slope value slope, and kind of energy physicalratio. the kinds of energy include: - jerk (0) - sagging (1). note that the default setting for physical ration is in faircurve_batten other parameters are initialized as follow: - freesliding = false - constraintorder1 = 1 - constraintorder2 = 1 - angle1 = 0 - angle2 = 0 - curvature1 = 0 - curvature2 = 0 - slidingfactor = 1 warning if physicalratio equals 1, you cannot impose constraints on curvature. exceptions negativevalue if height is less than or equal to 0. nullvalue if the distance between p1 and p2 is less than or equal to the tolerance value for distance in precision::confusion: p1.isequal(p2, precision::confusion()). the function gp_pnt2d::isequal tests to see if this is the case. definition of the geometricals constraints.
") FairCurve_MinimalVariation;
		 FairCurve_MinimalVariation(const gp_Pnt2d & P1, const gp_Pnt2d & P2, const Standard_Real Heigth, const Standard_Real Slope = 0, const Standard_Real PhysicalRatio = 0);

		/****** FairCurve_MinimalVariation::Compute ******/
		/****** md5 signature: 9d89354911c318a7bbdacd498c599c52 ******/
		%feature("compactdefaultargs") Compute;
		%feature("autodoc", "
Parameters
----------
NbIterations: int (optional, default to 50)
Tolerance: float (optional, default to 1.0e-3)

Return
-------
ACode: FairCurve_AnalysisCode

Description
-----------
Computes the curve with respect to the constraints, nbiterations and tolerance. the tolerance setting allows you to control the precision of computation, and the maximum number of iterations allows you to set a limit on computation time.
") Compute;
		virtual Standard_Boolean Compute(FairCurve_AnalysisCode &OutValue, const Standard_Integer NbIterations = 50, const Standard_Real Tolerance = 1.0e-3);

		/****** FairCurve_MinimalVariation::Dump ******/
		/****** md5 signature: b42defe2d7a7208961fa81b225a70479 ******/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "
Parameters
----------

Return
-------
o: Standard_OStream

Description
-----------
Prints on the stream o information on the current state of the object. is used to redefine the operator <<.
") Dump;
		virtual void Dump(std::ostream &OutValue);

		/****** FairCurve_MinimalVariation::GetCurvature1 ******/
		/****** md5 signature: 52b65eab76a83b1bbd4a765dc4226232 ******/
		%feature("compactdefaultargs") GetCurvature1;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the first established curvature.
") GetCurvature1;
		Standard_Real GetCurvature1();

		/****** FairCurve_MinimalVariation::GetCurvature2 ******/
		/****** md5 signature: 6b3b641177834a6f128d99403e9ac113 ******/
		%feature("compactdefaultargs") GetCurvature2;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the second established curvature.
") GetCurvature2;
		Standard_Real GetCurvature2();

		/****** FairCurve_MinimalVariation::GetPhysicalRatio ******/
		/****** md5 signature: 275978b7653383b1349cc68e46c8b622 ******/
		%feature("compactdefaultargs") GetPhysicalRatio;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the physical ratio, or kind of energy.
") GetPhysicalRatio;
		Standard_Real GetPhysicalRatio();

		/****** FairCurve_MinimalVariation::SetCurvature1 ******/
		/****** md5 signature: 93b3376ba676beeb67d10c6e0602a80a ******/
		%feature("compactdefaultargs") SetCurvature1;
		%feature("autodoc", "
Parameters
----------
Curvature: float

Return
-------
None

Description
-----------
Allows you to set a new constraint on curvature at the first point.
") SetCurvature1;
		void SetCurvature1(const Standard_Real Curvature);

		/****** FairCurve_MinimalVariation::SetCurvature2 ******/
		/****** md5 signature: ea0938f5c8643407fc679bf756ffb409 ******/
		%feature("compactdefaultargs") SetCurvature2;
		%feature("autodoc", "
Parameters
----------
Curvature: float

Return
-------
None

Description
-----------
Allows you to set a new constraint on curvature at the second point.
") SetCurvature2;
		void SetCurvature2(const Standard_Real Curvature);

		/****** FairCurve_MinimalVariation::SetPhysicalRatio ******/
		/****** md5 signature: 4f45863d9aa49df9742e861f722cf012 ******/
		%feature("compactdefaultargs") SetPhysicalRatio;
		%feature("autodoc", "
Parameters
----------
Ratio: float

Return
-------
None

Description
-----------
Allows you to set the physical ratio ratio. the kinds of energy which you can specify include: 0 is only 'jerk' energy 1 is only 'sagging' energy like batten warning: if ratio is 1 it is impossible to impose curvature constraints. raises domainerror if ratio < 0 or ratio > 1.
") SetPhysicalRatio;
		void SetPhysicalRatio(const Standard_Real Ratio);

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
