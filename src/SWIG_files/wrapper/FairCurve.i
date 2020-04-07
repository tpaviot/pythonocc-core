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
%define FAIRCURVEDOCSTRING
"FairCurve module, see official documentation at
https://www.opencascade.com/doc/occt-7.4.0/refman/html/package_faircurve.html"
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
%include ../common/Operators.i
%include ../common/OccHandle.i


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

/* python proy classes for enums */
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
		/****************** FairCurve_Batten ******************/
		%feature("compactdefaultargs") FairCurve_Batten;
		%feature("autodoc", "Constructor with the two points and the geometrical characteristics of the batten (elastic beam) height is the height of the deformation, and slope is the slope value, initialized at 0. the user can then supply the desired slope value by the method, setslope. other parameters are initialized as follow : - freesliding = false - constraintorder1 = 1 - constraintorder2 = 1 - angle1 = 0 - angle2 = 0 - slidingfactor = 1 exceptions negativevalue if height is less than or equal to 0. nullvalue if the distance between p1 and p2 is less than or equal to the tolerance value for distance in precision::confusion: p1.isequal(p2, precision::confusion()). the function gp_pnt2d::isequal tests to see if this is the case.

Parameters
----------
P1: gp_Pnt2d
P2: gp_Pnt2d
Height: float
Slope: float,optional
	default value is 0

Returns
-------
None
") FairCurve_Batten;
		 FairCurve_Batten(const gp_Pnt2d & P1, const gp_Pnt2d & P2, const Standard_Real Height, const Standard_Real Slope = 0);

		/****************** Compute ******************/
		%feature("compactdefaultargs") Compute;
		%feature("autodoc", "Performs the algorithm, using the arguments code, nbiterations and tolerance and computes the curve with respect to the constraints. code will have one of the following values: - ok - notconverged - infinitesliding - nullheight the parameters tolerance and nbiterations control how precise the computation is, and how long it will take.

Parameters
----------
NbIterations: int,optional
	default value is 50
Tolerance: float,optional
	default value is 1.0e-3

Returns
-------
Code: FairCurve_AnalysisCode
") Compute;
		virtual Standard_Boolean Compute(FairCurve_AnalysisCode &OutValue, const Standard_Integer NbIterations = 50, const Standard_Real Tolerance = 1.0e-3);

		/****************** Curve ******************/
		%feature("compactdefaultargs") Curve;
		%feature("autodoc", "Returns the computed curve a 2d bspline.

Returns
-------
opencascade::handle<Geom2d_BSplineCurve>
") Curve;
		opencascade::handle<Geom2d_BSplineCurve> Curve();


        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
		/****************** GetAngle1 ******************/
		%feature("compactdefaultargs") GetAngle1;
		%feature("autodoc", "Returns the established first angle.

Returns
-------
float
") GetAngle1;
		Standard_Real GetAngle1();

		/****************** GetAngle2 ******************/
		%feature("compactdefaultargs") GetAngle2;
		%feature("autodoc", "Returns the established second angle.

Returns
-------
float
") GetAngle2;
		Standard_Real GetAngle2();

		/****************** GetConstraintOrder1 ******************/
		%feature("compactdefaultargs") GetConstraintOrder1;
		%feature("autodoc", "Returns the established first constraint order.

Returns
-------
int
") GetConstraintOrder1;
		Standard_Integer GetConstraintOrder1();

		/****************** GetConstraintOrder2 ******************/
		%feature("compactdefaultargs") GetConstraintOrder2;
		%feature("autodoc", "Returns the established second constraint order.

Returns
-------
int
") GetConstraintOrder2;
		Standard_Integer GetConstraintOrder2();

		/****************** GetFreeSliding ******************/
		%feature("compactdefaultargs") GetFreeSliding;
		%feature("autodoc", "Returns the initial free sliding value, false by default. free sliding is generally more aesthetically pleasing than constrained sliding. however, the computation can fail with values such as angles greater than pi/2. this is because the resulting batten length is theoretically infinite.

Returns
-------
bool
") GetFreeSliding;
		Standard_Boolean GetFreeSliding();

		/****************** GetHeight ******************/
		%feature("compactdefaultargs") GetHeight;
		%feature("autodoc", "Returns the thickness of the lathe.

Returns
-------
float
") GetHeight;
		Standard_Real GetHeight();

		/****************** GetP1 ******************/
		%feature("compactdefaultargs") GetP1;
		%feature("autodoc", "Returns the established location of the point p1.

Returns
-------
gp_Pnt2d
") GetP1;
		const gp_Pnt2d GetP1();

		/****************** GetP2 ******************/
		%feature("compactdefaultargs") GetP2;
		%feature("autodoc", "Returns the established location of the point p2.

Returns
-------
gp_Pnt2d
") GetP2;
		const gp_Pnt2d GetP2();

		/****************** GetSlidingFactor ******************/
		%feature("compactdefaultargs") GetSlidingFactor;
		%feature("autodoc", "Returns the initial sliding factor.

Returns
-------
float
") GetSlidingFactor;
		Standard_Real GetSlidingFactor();

		/****************** GetSlope ******************/
		%feature("compactdefaultargs") GetSlope;
		%feature("autodoc", "Returns the established slope value.

Returns
-------
float
") GetSlope;
		Standard_Real GetSlope();

		/****************** SetAngle1 ******************/
		%feature("compactdefaultargs") SetAngle1;
		%feature("autodoc", "Allows you to change the angle angle1 at the first point, p1. the default setting is 0.

Parameters
----------
Angle1: float

Returns
-------
None
") SetAngle1;
		void SetAngle1(const Standard_Real Angle1);

		/****************** SetAngle2 ******************/
		%feature("compactdefaultargs") SetAngle2;
		%feature("autodoc", "Allows you to change the angle angle2 at the second point, p2. the default setting is 0.

Parameters
----------
Angle2: float

Returns
-------
None
") SetAngle2;
		void SetAngle2(const Standard_Real Angle2);

		/****************** SetConstraintOrder1 ******************/
		%feature("compactdefaultargs") SetConstraintOrder1;
		%feature("autodoc", "Allows you to change the order of the constraint on the first point. constraintorder has the default setting of 1. the following settings are available: - 0-the curve must pass through a point - 1-the curve must pass through a point and have a given tangent - 2-the curve must pass through a point, have a given tangent and a given curvature. the third setting is only valid for faircurve_minimalvariation curves. these constraints, though geometric, represent the mechanical constraints due, for example, to the resistance of the material the actual physical batten is made of.

Parameters
----------
ConstraintOrder: int

Returns
-------
None
") SetConstraintOrder1;
		void SetConstraintOrder1(const Standard_Integer ConstraintOrder);

		/****************** SetConstraintOrder2 ******************/
		%feature("compactdefaultargs") SetConstraintOrder2;
		%feature("autodoc", "Allows you to change the order of the constraint on the second point. constraintorder is initialized with the default setting of 1. the following settings are available: - 0-the curve must pass through a point - 1-the curve must pass through a point and have a given tangent - 2-the curve must pass through a point, have a given tangent and a given curvature. the third setting is only valid for faircurve_minimalvariation curves. these constraints, though geometric, represent the mechanical constraints due, for example, to the resistance of the material the actual physical batten is made of.

Parameters
----------
ConstraintOrder: int

Returns
-------
None
") SetConstraintOrder2;
		void SetConstraintOrder2(const Standard_Integer ConstraintOrder);

		/****************** SetFreeSliding ******************/
		%feature("compactdefaultargs") SetFreeSliding;
		%feature("autodoc", "Freesliding is initialized with the default setting false. when freesliding is set to true and, as a result, sliding is free, the sliding factor is automatically computed to satisfy the equilibrium of the batten.

Parameters
----------
FreeSliding: bool

Returns
-------
None
") SetFreeSliding;
		void SetFreeSliding(const Standard_Boolean FreeSliding);

		/****************** SetHeight ******************/
		%feature("compactdefaultargs") SetHeight;
		%feature("autodoc", "Allows you to change the height of the deformation. raises negativevalue; -- if height <= 0 if height <= 0.

Parameters
----------
Height: float

Returns
-------
None
") SetHeight;
		void SetHeight(const Standard_Real Height);

		/****************** SetP1 ******************/
		%feature("compactdefaultargs") SetP1;
		%feature("autodoc", "Allows you to change the location of the point, p1, and in doing so, modify the curve. warning this method changes the angle as well as the point. exceptions nullvalue if the distance between p1 and p2 is less than or equal to the tolerance value for distance in precision::confusion: p1.isequal(p2, precision::confusion()). the function gp_pnt2d::isequal tests to see if this is the case.

Parameters
----------
P1: gp_Pnt2d

Returns
-------
None
") SetP1;
		void SetP1(const gp_Pnt2d & P1);

		/****************** SetP2 ******************/
		%feature("compactdefaultargs") SetP2;
		%feature("autodoc", "Allows you to change the location of the point, p1, and in doing so, modify the curve. warning this method changes the angle as well as the point. exceptions nullvalue if the distance between p1 and p2 is less than or equal to the tolerance value for distance in precision::confusion: p1.isequal(p2, precision::confusion()). the function gp_pnt2d::isequal tests to see if this is the case.

Parameters
----------
P2: gp_Pnt2d

Returns
-------
None
") SetP2;
		void SetP2(const gp_Pnt2d & P2);

		/****************** SetSlidingFactor ******************/
		%feature("compactdefaultargs") SetSlidingFactor;
		%feature("autodoc", "Allows you to change the ratio slidingfactor. this compares the length of the batten and the reference length, which is, in turn, a function of the constraints. this modification has one of the following two effects: - if you increase the value, it inflates the batten - if you decrease the value, it flattens the batten. when sliding is free, the sliding factor is automatically computed to satisfy the equilibrium of the batten. when sliding is imposed, a value is required for the sliding factor. slidingfactor is initialized with the default setting of 1.

Parameters
----------
SlidingFactor: float

Returns
-------
None
") SetSlidingFactor;
		void SetSlidingFactor(const Standard_Real SlidingFactor);

		/****************** SetSlope ******************/
		%feature("compactdefaultargs") SetSlope;
		%feature("autodoc", "Allows you to set the slope value, slope.

Parameters
----------
Slope: float

Returns
-------
None
") SetSlope;
		void SetSlope(const Standard_Real Slope);

		/****************** SlidingOfReference ******************/
		%feature("compactdefaultargs") SlidingOfReference;
		%feature("autodoc", "Computes the real number value for length sliding of reference for new constraints. if you want to give a specific length to a batten curve, use the following syntax: b.setslidingfactor(l / b.slidingofreference()) where b is the name of the batten curve object.

Returns
-------
float
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
		/****************** FairCurve_BattenLaw ******************/
		%feature("compactdefaultargs") FairCurve_BattenLaw;
		%feature("autodoc", "Constructor of linear batten with heigth : the heigth at the middle point slope : the geometric slope of the batten sliding : active length of the batten without extension.

Parameters
----------
Heigth: float
Slope: float
Sliding: float

Returns
-------
None
") FairCurve_BattenLaw;
		 FairCurve_BattenLaw(const Standard_Real Heigth, const Standard_Real Slope, const Standard_Real Sliding);

		/****************** SetHeigth ******************/
		%feature("compactdefaultargs") SetHeigth;
		%feature("autodoc", "Change the value of heigth at the middle point.

Parameters
----------
Heigth: float

Returns
-------
None
") SetHeigth;
		void SetHeigth(const Standard_Real Heigth);

		/****************** SetSliding ******************/
		%feature("compactdefaultargs") SetSliding;
		%feature("autodoc", "Change the value of sliding.

Parameters
----------
Sliding: float

Returns
-------
None
") SetSliding;
		void SetSliding(const Standard_Real Sliding);

		/****************** SetSlope ******************/
		%feature("compactdefaultargs") SetSlope;
		%feature("autodoc", "Change the value of the geometric slope.

Parameters
----------
Slope: float

Returns
-------
None
") SetSlope;
		void SetSlope(const Standard_Real Slope);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Computes the value of the heigth for the parameter t on the neutral fibber.

Parameters
----------
T: float

Returns
-------
THeigth: float
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
		/****************** NbEquations ******************/
		%feature("compactdefaultargs") NbEquations;
		%feature("autodoc", "Returns the number of equations of the function.

Returns
-------
int
") NbEquations;
		virtual Standard_Integer NbEquations();

		/****************** NbVariables ******************/
		%feature("compactdefaultargs") NbVariables;
		%feature("autodoc", "Returns the number of variables of the function.

Returns
-------
int
") NbVariables;
		virtual Standard_Integer NbVariables();

		/****************** SetDerivativeOrder ******************/
		%feature("compactdefaultargs") SetDerivativeOrder;
		%feature("autodoc", "No available documentation.

Parameters
----------
DerivativeOrder: int

Returns
-------
None
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
		/****************** Gradient ******************/
		%feature("compactdefaultargs") Gradient;
		%feature("autodoc", "Computes the gradient <g> of the energys for the variable <x>. returns true if the computation was done successfully, false otherwise.

Parameters
----------
X: math_Vector
G: math_Vector

Returns
-------
bool
") Gradient;
		virtual Standard_Boolean Gradient(const math_Vector & X, math_Vector & G);

		/****************** NbVariables ******************/
		%feature("compactdefaultargs") NbVariables;
		%feature("autodoc", "Returns the number of variables of the energy.

Returns
-------
int
") NbVariables;
		virtual Standard_Integer NbVariables();

		/****************** Poles ******************/
		%feature("compactdefaultargs") Poles;
		%feature("autodoc", "Return the poles.

Returns
-------
opencascade::handle<TColgp_HArray1OfPnt2d>
") Poles;
		const opencascade::handle<TColgp_HArray1OfPnt2d> & Poles();

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Computes the values of the energys e for the variable <x>. returns true if the computation was done successfully, false otherwise.

Parameters
----------
X: math_Vector

Returns
-------
E: float
") Value;
		virtual Standard_Boolean Value(const math_Vector & X, Standard_Real &OutValue);

		/****************** Values ******************/
		%feature("compactdefaultargs") Values;
		%feature("autodoc", "Computes the energy <e> and the gradient <g> of the energy for the variable <x>. returns true if the computation was done successfully, false otherwise.

Parameters
----------
X: math_Vector
G: math_Vector

Returns
-------
E: float
") Values;
		virtual Standard_Boolean Values(const math_Vector & X, Standard_Real &OutValue, math_Vector & G);

		/****************** Values ******************/
		%feature("compactdefaultargs") Values;
		%feature("autodoc", "Computes the energy <e>, the gradient <g> and the hessian <h> of the energy for the variable <x>. returns true if the computation was done successfully, false otherwise.

Parameters
----------
X: math_Vector
G: math_Vector
H: math_Matrix

Returns
-------
E: float
") Values;
		virtual Standard_Boolean Values(const math_Vector & X, Standard_Real &OutValue, math_Vector & G, math_Matrix & H);

		/****************** Variable ******************/
		%feature("compactdefaultargs") Variable;
		%feature("autodoc", "Compute the variables <x> wich correspond with the field <mypoles>.

Parameters
----------
X: math_Vector

Returns
-------
bool
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
		/****************** FairCurve_Newton ******************/
		%feature("compactdefaultargs") FairCurve_Newton;
		%feature("autodoc", "The tolerance required on the solution is given by tolerance. iteration are stopped if (!withsingularity) and h(f(xi)) is not definite positive (if the smaller eigenvalue of h < convexity) or isconverged() returns true for 2 successives iterations. warning: this constructor do not computation.

Parameters
----------
theFunction: math_MultipleVarFunctionWithHessian
theSpatialTolerance: float,optional
	default value is 1.0e-7
theCriteriumTolerance: float,optional
	default value is 1.0e-7
theNbIterations: int,optional
	default value is 40
theConvexity: float,optional
	default value is 1.0e-6
theWithSingularity: bool,optional
	default value is Standard_True

Returns
-------
None
") FairCurve_Newton;
		 FairCurve_Newton(const math_MultipleVarFunctionWithHessian & theFunction, const Standard_Real theSpatialTolerance = 1.0e-7, const Standard_Real theCriteriumTolerance = 1.0e-7, const Standard_Integer theNbIterations = 40, const Standard_Real theConvexity = 1.0e-6, const Standard_Boolean theWithSingularity = Standard_True);

		/****************** IsConverged ******************/
		%feature("compactdefaultargs") IsConverged;
		%feature("autodoc", "This method is called at the end of each iteration to check the convergence : || xi+1 - xi || < spatialtolerance/100 or || xi+1 - xi || < spatialtolerance and |f(xi+1) - f(xi)| < criteriumtolerance * |f(xi)| it can be redefined in a sub-class to implement a specific test.

Returns
-------
bool
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
		/****************** FairCurve_DistributionOfJerk ******************/
		%feature("compactdefaultargs") FairCurve_DistributionOfJerk;
		%feature("autodoc", "No available documentation.

Parameters
----------
BSplOrder: int
FlatKnots: TColStd_HArray1OfReal
Poles: TColgp_HArray1OfPnt2d
DerivativeOrder: int
Law: FairCurve_BattenLaw
NbValAux: int,optional
	default value is 0

Returns
-------
None
") FairCurve_DistributionOfJerk;
		 FairCurve_DistributionOfJerk(const Standard_Integer BSplOrder, const opencascade::handle<TColStd_HArray1OfReal> & FlatKnots, const opencascade::handle<TColgp_HArray1OfPnt2d> & Poles, const Standard_Integer DerivativeOrder, const FairCurve_BattenLaw & Law, const Standard_Integer NbValAux = 0);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Computes the values <f> of the functions for the variable <x>. returns true if the computation was done successfully, false otherwise.

Parameters
----------
X: math_Vector
F: math_Vector

Returns
-------
bool
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
		/****************** FairCurve_DistributionOfSagging ******************/
		%feature("compactdefaultargs") FairCurve_DistributionOfSagging;
		%feature("autodoc", "No available documentation.

Parameters
----------
BSplOrder: int
FlatKnots: TColStd_HArray1OfReal
Poles: TColgp_HArray1OfPnt2d
DerivativeOrder: int
Law: FairCurve_BattenLaw
NbValAux: int,optional
	default value is 0

Returns
-------
None
") FairCurve_DistributionOfSagging;
		 FairCurve_DistributionOfSagging(const Standard_Integer BSplOrder, const opencascade::handle<TColStd_HArray1OfReal> & FlatKnots, const opencascade::handle<TColgp_HArray1OfPnt2d> & Poles, const Standard_Integer DerivativeOrder, const FairCurve_BattenLaw & Law, const Standard_Integer NbValAux = 0);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Computes the values <f> of the functions for the variable <x>. returns true if the computation was done successfully, false otherwise.

Parameters
----------
X: math_Vector
F: math_Vector

Returns
-------
bool
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
		/****************** FairCurve_DistributionOfTension ******************/
		%feature("compactdefaultargs") FairCurve_DistributionOfTension;
		%feature("autodoc", "No available documentation.

Parameters
----------
BSplOrder: int
FlatKnots: TColStd_HArray1OfReal
Poles: TColgp_HArray1OfPnt2d
DerivativeOrder: int
LengthSliding: float
Law: FairCurve_BattenLaw
NbValAux: int,optional
	default value is 0
Uniform: bool,optional
	default value is Standard_False

Returns
-------
None
") FairCurve_DistributionOfTension;
		 FairCurve_DistributionOfTension(const Standard_Integer BSplOrder, const opencascade::handle<TColStd_HArray1OfReal> & FlatKnots, const opencascade::handle<TColgp_HArray1OfPnt2d> & Poles, const Standard_Integer DerivativeOrder, const Standard_Real LengthSliding, const FairCurve_BattenLaw & Law, const Standard_Integer NbValAux = 0, const Standard_Boolean Uniform = Standard_False);

		/****************** SetLengthSliding ******************/
		%feature("compactdefaultargs") SetLengthSliding;
		%feature("autodoc", "Change the length sliding.

Parameters
----------
LengthSliding: float

Returns
-------
None
") SetLengthSliding;
		void SetLengthSliding(const Standard_Real LengthSliding);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Computes the values <f> of the functions for the variable <x>. returns true if the computation was done successfully, false otherwise.

Parameters
----------
X: math_Vector
F: math_Vector

Returns
-------
bool
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
		/****************** FairCurve_EnergyOfBatten ******************/
		%feature("compactdefaultargs") FairCurve_EnergyOfBatten;
		%feature("autodoc", "Angles corresspond to the ox axis.

Parameters
----------
BSplOrder: int
FlatKnots: TColStd_HArray1OfReal
Poles: TColgp_HArray1OfPnt2d
ContrOrder1: int
ContrOrder2: int
Law: FairCurve_BattenLaw
LengthSliding: float
FreeSliding: bool,optional
	default value is Standard_True
Angle1: float,optional
	default value is 0
Angle2: float,optional
	default value is 0

Returns
-------
None
") FairCurve_EnergyOfBatten;
		 FairCurve_EnergyOfBatten(const Standard_Integer BSplOrder, const opencascade::handle<TColStd_HArray1OfReal> & FlatKnots, const opencascade::handle<TColgp_HArray1OfPnt2d> & Poles, const Standard_Integer ContrOrder1, const Standard_Integer ContrOrder2, const FairCurve_BattenLaw & Law, const Standard_Real LengthSliding, const Standard_Boolean FreeSliding = Standard_True, const Standard_Real Angle1 = 0, const Standard_Real Angle2 = 0);

		/****************** LengthSliding ******************/
		%feature("compactdefaultargs") LengthSliding;
		%feature("autodoc", "Return the lengthsliding = p1p2 + sliding.

Returns
-------
float
") LengthSliding;
		Standard_Real LengthSliding();

		/****************** Status ******************/
		%feature("compactdefaultargs") Status;
		%feature("autodoc", "Return the status.

Returns
-------
FairCurve_AnalysisCode
") Status;
		FairCurve_AnalysisCode Status();

		/****************** Variable ******************/
		%feature("compactdefaultargs") Variable;
		%feature("autodoc", "Compute the variables <x> wich correspond with the field <mypoles>.

Parameters
----------
X: math_Vector

Returns
-------
bool
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
		/****************** FairCurve_EnergyOfMVC ******************/
		%feature("compactdefaultargs") FairCurve_EnergyOfMVC;
		%feature("autodoc", "Angles corresspond to the ox axis.

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
FreeSliding: bool,optional
	default value is Standard_True
Angle1: float,optional
	default value is 0
Angle2: float,optional
	default value is 0
Curvature1: float,optional
	default value is 0
Curvature2: float,optional
	default value is 0

Returns
-------
None
") FairCurve_EnergyOfMVC;
		 FairCurve_EnergyOfMVC(const Standard_Integer BSplOrder, const opencascade::handle<TColStd_HArray1OfReal> & FlatKnots, const opencascade::handle<TColgp_HArray1OfPnt2d> & Poles, const Standard_Integer ContrOrder1, const Standard_Integer ContrOrder2, const FairCurve_BattenLaw & Law, const Standard_Real PhysicalRatio, const Standard_Real LengthSliding, const Standard_Boolean FreeSliding = Standard_True, const Standard_Real Angle1 = 0, const Standard_Real Angle2 = 0, const Standard_Real Curvature1 = 0, const Standard_Real Curvature2 = 0);

		/****************** LengthSliding ******************/
		%feature("compactdefaultargs") LengthSliding;
		%feature("autodoc", "Return the lengthsliding = p1p2 + sliding.

Returns
-------
float
") LengthSliding;
		Standard_Real LengthSliding();

		/****************** Status ******************/
		%feature("compactdefaultargs") Status;
		%feature("autodoc", "Return the status.

Returns
-------
FairCurve_AnalysisCode
") Status;
		FairCurve_AnalysisCode Status();

		/****************** Variable ******************/
		%feature("compactdefaultargs") Variable;
		%feature("autodoc", "Compute the variables <x> wich correspond with the field <mypoles>.

Parameters
----------
X: math_Vector

Returns
-------
bool
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
		/****************** FairCurve_MinimalVariation ******************/
		%feature("compactdefaultargs") FairCurve_MinimalVariation;
		%feature("autodoc", "Constructs the two contact points p1 and p2 and the geometrical characteristics of the batten (elastic beam) these include the real number values for height of deformation height, slope value slope, and kind of energy physicalratio. the kinds of energy include: - jerk (0) - sagging (1). note that the default setting for physical ration is in faircurve_batten other parameters are initialized as follow : - freesliding = false - constraintorder1 = 1 - constraintorder2 = 1 - angle1 = 0 - angle2 = 0 - curvature1 = 0 - curvature2 = 0 - slidingfactor = 1 warning if physicalratio equals 1, you cannot impose constraints on curvature. exceptions negativevalue if height is less than or equal to 0. nullvalue if the distance between p1 and p2 is less than or equal to the tolerance value for distance in precision::confusion: p1.isequal(p2, precision::confusion()). the function gp_pnt2d::isequal tests to see if this is the case. definition of the geometricals constraints.

Parameters
----------
P1: gp_Pnt2d
P2: gp_Pnt2d
Heigth: float
Slope: float,optional
	default value is 0
PhysicalRatio: float,optional
	default value is 0

Returns
-------
None
") FairCurve_MinimalVariation;
		 FairCurve_MinimalVariation(const gp_Pnt2d & P1, const gp_Pnt2d & P2, const Standard_Real Heigth, const Standard_Real Slope = 0, const Standard_Real PhysicalRatio = 0);

		/****************** Compute ******************/
		%feature("compactdefaultargs") Compute;
		%feature("autodoc", "Computes the curve with respect to the constraints, nbiterations and tolerance. the tolerance setting allows you to control the precision of computation, and the maximum number of iterations allows you to set a limit on computation time.

Parameters
----------
NbIterations: int,optional
	default value is 50
Tolerance: float,optional
	default value is 1.0e-3

Returns
-------
ACode: FairCurve_AnalysisCode
") Compute;
		virtual Standard_Boolean Compute(FairCurve_AnalysisCode &OutValue, const Standard_Integer NbIterations = 50, const Standard_Real Tolerance = 1.0e-3);


        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
		/****************** GetCurvature1 ******************/
		%feature("compactdefaultargs") GetCurvature1;
		%feature("autodoc", "Returns the first established curvature.

Returns
-------
float
") GetCurvature1;
		Standard_Real GetCurvature1();

		/****************** GetCurvature2 ******************/
		%feature("compactdefaultargs") GetCurvature2;
		%feature("autodoc", "Returns the second established curvature.

Returns
-------
float
") GetCurvature2;
		Standard_Real GetCurvature2();

		/****************** GetPhysicalRatio ******************/
		%feature("compactdefaultargs") GetPhysicalRatio;
		%feature("autodoc", "Returns the physical ratio, or kind of energy.

Returns
-------
float
") GetPhysicalRatio;
		Standard_Real GetPhysicalRatio();

		/****************** SetCurvature1 ******************/
		%feature("compactdefaultargs") SetCurvature1;
		%feature("autodoc", "Allows you to set a new constraint on curvature at the first point.

Parameters
----------
Curvature: float

Returns
-------
None
") SetCurvature1;
		void SetCurvature1(const Standard_Real Curvature);

		/****************** SetCurvature2 ******************/
		%feature("compactdefaultargs") SetCurvature2;
		%feature("autodoc", "Allows you to set a new constraint on curvature at the second point.

Parameters
----------
Curvature: float

Returns
-------
None
") SetCurvature2;
		void SetCurvature2(const Standard_Real Curvature);

		/****************** SetPhysicalRatio ******************/
		%feature("compactdefaultargs") SetPhysicalRatio;
		%feature("autodoc", "Allows you to set the physical ratio ratio. the kinds of energy which you can specify include: 0 is only 'jerk' energy 1 is only 'sagging' energy like batten warning: if ratio is 1 it is impossible to impose curvature constraints. raises domainerror if ratio < 0 or ratio > 1.

Parameters
----------
Ratio: float

Returns
-------
None
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
