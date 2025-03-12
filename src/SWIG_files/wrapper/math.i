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
%define MATHDOCSTRING
"math module, see official documentation at
https://dev.opencascade.org/doc/occt-7.8.0/refman/html/package_math.html"
%enddef
%module (package="OCC.Core", docstring=MATHDOCSTRING) math


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
#include<math_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<TColStd_module.hxx>
#include<Message_module.hxx>
#include<gp_module.hxx>
#include<Adaptor3d_module.hxx>
#include<Precision_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import TColStd.i
%import Message.i
%import gp.i

%pythoncode {
from enum import IntEnum
from OCC.Core.Exception import *
};


%include "math_VectorBase.hxx";
%template(math_Vector) math_VectorBase<double>;
typedef math_VectorBase<double> math_Vector;
/* public enums */
enum math_Status {
	math_OK = 0,
	math_TooManyIterations = 1,
	math_FunctionError = 2,
	math_DirectionSearchError = 3,
	math_NotBracketed = 4,
};

/* end public enums declaration */

/* python proxy classes for enums */
%pythoncode {

class math_Status(IntEnum):
	math_OK = 0
	math_TooManyIterations = 1
	math_FunctionError = 2
	math_DirectionSearchError = 3
	math_NotBracketed = 4
math_OK = math_Status.math_OK
math_TooManyIterations = math_Status.math_TooManyIterations
math_FunctionError = math_Status.math_FunctionError
math_DirectionSearchError = math_Status.math_DirectionSearchError
math_NotBracketed = math_Status.math_NotBracketed
};
/* end python proxy for enums */

/* handles */
/* end handles declaration */

/* templates */
%template(math_Array1OfValueAndWeight) NCollection_Array1<math_ValueAndWeight>;
Array1ExtendIter(math_ValueAndWeight)

/* end templates declaration */

/* typedefs */
typedef NCollection_Array1<math_ValueAndWeight> math_Array1OfValueAndWeight;
/* end typedefs declaration */

/*********************
* class PSO_Particle *
*********************/
/*************
* class math *
*************/
%rename(math) math;
class math {
	public:
		/****** math::GaussPoints ******/
		/****** md5 signature: 446a90f3001d7ded069143d0209104bf ******/
		%feature("compactdefaultargs") GaussPoints;
		%feature("autodoc", "
Parameters
----------
Index: int
Points: math_Vector

Return
-------
None

Description
-----------
No available documentation.
") GaussPoints;
		static void GaussPoints(const Standard_Integer Index, math_Vector & Points);

		/****** math::GaussPointsMax ******/
		/****** md5 signature: 021532a8fefc3658153f6c8c5f78eb5a ******/
		%feature("compactdefaultargs") GaussPointsMax;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") GaussPointsMax;
		static Standard_Integer GaussPointsMax();

		/****** math::GaussWeights ******/
		/****** md5 signature: 5d66427e1e084482b8ee69ca83d5849c ******/
		%feature("compactdefaultargs") GaussWeights;
		%feature("autodoc", "
Parameters
----------
Index: int
Weights: math_Vector

Return
-------
None

Description
-----------
No available documentation.
") GaussWeights;
		static void GaussWeights(const Standard_Integer Index, math_Vector & Weights);

		/****** math::KronrodPointsAndWeights ******/
		/****** md5 signature: 99c3b88d38de525c6d1eefdbb7333a1f ******/
		%feature("compactdefaultargs") KronrodPointsAndWeights;
		%feature("autodoc", "
Parameters
----------
Index: int
Points: math_Vector
Weights: math_Vector

Return
-------
bool

Description
-----------
Returns a vector of Kronrod points and a vector of their weights for Gauss-Kronrod computation method. Index should be odd and greater then or equal to 3, as the number of Kronrod points is equal to 2*N + 1, where N is a number of Gauss points. Points and Weights should have the size equal to Index. Each even element of Points represents a Gauss point value of N-th Gauss quadrature. The values from Index equal to 3 to 123 are stored in a table (see the file math_Kronrod.cxx). If Index is greater, then points and weights will be computed. Returns Standard_True if Index is odd, it is equal to the size of Points and Weights and the computation of Points and Weights is performed successfully. Otherwise this method returns Standard_False.
") KronrodPointsAndWeights;
		static Standard_Boolean KronrodPointsAndWeights(const Standard_Integer Index, math_Vector & Points, math_Vector & Weights);

		/****** math::KronrodPointsMax ******/
		/****** md5 signature: 9877451b96fc7394956a8fd6d14372a7 ******/
		%feature("compactdefaultargs") KronrodPointsMax;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the maximal number of points for that the values are stored in the table. If the number is greater then KronrodPointsMax, the points will be computed.
") KronrodPointsMax;
		static Standard_Integer KronrodPointsMax();

		/****** math::OrderedGaussPointsAndWeights ******/
		/****** md5 signature: 6c74a30dedcd119fddcf50d75dbcb349 ******/
		%feature("compactdefaultargs") OrderedGaussPointsAndWeights;
		%feature("autodoc", "
Parameters
----------
Index: int
Points: math_Vector
Weights: math_Vector

Return
-------
bool

Description
-----------
Returns a vector of Gauss points and a vector of their weights. The difference with the method GaussPoints is the following: - the points are returned in increasing order. - if Index is greater then GaussPointsMax, the points are computed. Returns Standard_True if Index is positive, Points' and Weights' length is equal to Index, Points and Weights are successfully computed.
") OrderedGaussPointsAndWeights;
		static Standard_Boolean OrderedGaussPointsAndWeights(const Standard_Integer Index, math_Vector & Points, math_Vector & Weights);

};


%extend math {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************
* class math_BFGS *
******************/
class math_BFGS {
	public:
		/****** math_BFGS::math_BFGS ******/
		/****** md5 signature: f148c060e15332eef81439ed868d8841 ******/
		%feature("compactdefaultargs") math_BFGS;
		%feature("autodoc", "
Parameters
----------
NbVariables: int
Tolerance: float (optional, default to 1.0e-8)
NbIterations: int (optional, default to 200)
ZEPS: float (optional, default to 1.0e-12)

Return
-------
None

Description
-----------
Initializes the computation of the minimum of a function with NbVariables. Tolerance, ZEPS and NbIterations are described in the method Perform. Warning: A call to the Perform method must be made after this initialization to effectively compute the minimum of the function F.
") math_BFGS;
		 math_BFGS(const Standard_Integer NbVariables, const Standard_Real Tolerance = 1.0e-8, const Standard_Integer NbIterations = 200, const Standard_Real ZEPS = 1.0e-12);

		/****** math_BFGS::Dump ******/
		/****** md5 signature: d37b43e0b2386dc096d5d707876db157 ******/
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

		/****** math_BFGS::Gradient ******/
		/****** md5 signature: 6c3691fb2b0bb6085965955bdcce0a12 ******/
		%feature("compactdefaultargs") Gradient;
		%feature("autodoc", "Return
-------
math_Vector

Description
-----------
Returns the gradient vector at the minimum. Exception NotDone is raised if the minimum was not found.
") Gradient;
		const math_Vector & Gradient();

		/****** math_BFGS::Gradient ******/
		/****** md5 signature: d04c1575bb29bb8c6afa62dba0106edc ******/
		%feature("compactdefaultargs") Gradient;
		%feature("autodoc", "
Parameters
----------
Grad: math_Vector

Return
-------
None

Description
-----------
Returns the value of the gradient vector at the minimum in Grad. Exception NotDone is raised if the minimum was not found. Exception DimensionError is raised if the range of Grad is not equal to the range of the StartingPoint.
") Gradient;
		void Gradient(math_Vector & Grad);

		/****** math_BFGS::IsDone ******/
		/****** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if the computations are successful, otherwise returns false.
") IsDone;
		Standard_Boolean IsDone();

		/****** math_BFGS::IsSolutionReached ******/
		/****** md5 signature: aaa562131a0a88c1d1917423041f858d ******/
		%feature("compactdefaultargs") IsSolutionReached;
		%feature("autodoc", "
Parameters
----------
F: math_MultipleVarFunctionWithGradient

Return
-------
bool

Description
-----------
This method is called at the end of each iteration to check if the solution is found. It can be redefined in a sub-class to implement a specific test to stop the iterations.
") IsSolutionReached;
		virtual Standard_Boolean IsSolutionReached(math_MultipleVarFunctionWithGradient & F);

		/****** math_BFGS::Location ******/
		/****** md5 signature: 5a88ac2c95c5682bdeb613bd0a6c6d51 ******/
		%feature("compactdefaultargs") Location;
		%feature("autodoc", "Return
-------
math_Vector

Description
-----------
returns the location vector of the minimum. Exception NotDone is raised if the minimum was not found.
") Location;
		const math_Vector & Location();

		/****** math_BFGS::Location ******/
		/****** md5 signature: c2f6dc7227af27a93b49ddbc87dfbc1a ******/
		%feature("compactdefaultargs") Location;
		%feature("autodoc", "
Parameters
----------
Loc: math_Vector

Return
-------
None

Description
-----------
outputs the location vector of the minimum in Loc. Exception NotDone is raised if the minimum was not found. Exception DimensionError is raised if the range of Loc is not equal to the range of the StartingPoint.
") Location;
		void Location(math_Vector & Loc);

		/****** math_BFGS::Minimum ******/
		/****** md5 signature: c6e52c305b40f67530895542ef579d78 ******/
		%feature("compactdefaultargs") Minimum;
		%feature("autodoc", "Return
-------
float

Description
-----------
returns the value of the minimum. Exception NotDone is raised if the minimum was not found.
") Minimum;
		Standard_Real Minimum();

		/****** math_BFGS::NbIterations ******/
		/****** md5 signature: 05334f1e34f7c858ac022754e906f2bf ******/
		%feature("compactdefaultargs") NbIterations;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of iterations really done in the calculation of the minimum. The exception NotDone is raised if the minimum was not found.
") NbIterations;
		Standard_Integer NbIterations();

		/****** math_BFGS::Perform ******/
		/****** md5 signature: fd260abe732f3e3a63d8ede80f882039 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
F: math_MultipleVarFunctionWithGradient
StartingPoint: math_Vector

Return
-------
None

Description
-----------
Given the starting point StartingPoint, minimization is done on the function F. The solution F = Fi is found when: 2.0 * abs(Fi - Fi-1) <= Tolerance * (abs(Fi) + abs(Fi-1) + ZEPS). Tolerance, ZEPS and maximum number of iterations are given in the constructor.
") Perform;
		void Perform(math_MultipleVarFunctionWithGradient & F, const math_Vector & StartingPoint);

		/****** math_BFGS::SetBoundary ******/
		/****** md5 signature: 3dc06701c9c41177e0e859238df70613 ******/
		%feature("compactdefaultargs") SetBoundary;
		%feature("autodoc", "
Parameters
----------
theLeftBorder: math_Vector
theRightBorder: math_Vector

Return
-------
None

Description
-----------
Set boundaries for conditional optimization. The expected indices range of vectors is [1, NbVariables].
") SetBoundary;
		void SetBoundary(const math_Vector & theLeftBorder, const math_Vector & theRightBorder);

};


%extend math_BFGS {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************
* class math_BissecNewton *
**************************/
class math_BissecNewton {
	public:
		/****** math_BissecNewton::math_BissecNewton ******/
		/****** md5 signature: 294795766c1064cda2aaf334b2e0c502 ******/
		%feature("compactdefaultargs") math_BissecNewton;
		%feature("autodoc", "
Parameters
----------
theXTolerance: float

Return
-------
None

Description
-----------
Constructor. 
Parameter theXTolerance - algorithm tolerance.
") math_BissecNewton;
		 math_BissecNewton(const Standard_Real theXTolerance);

		/****** math_BissecNewton::Derivative ******/
		/****** md5 signature: 63ea99dea8601c9ed801e924cf6ad25a ******/
		%feature("compactdefaultargs") Derivative;
		%feature("autodoc", "Return
-------
float

Description
-----------
returns the value of the derivative at the root. Exception NotDone is raised if the minimum was not found.
") Derivative;
		Standard_Real Derivative();

		/****** math_BissecNewton::Dump ******/
		/****** md5 signature: d37b43e0b2386dc096d5d707876db157 ******/
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

		/****** math_BissecNewton::IsDone ******/
		/****** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Tests is the root has been successfully found.
") IsDone;
		Standard_Boolean IsDone();

		/****** math_BissecNewton::IsSolutionReached ******/
		/****** md5 signature: 6882ef34f833632bbf1cecda440ca8e3 ******/
		%feature("compactdefaultargs") IsSolutionReached;
		%feature("autodoc", "
Parameters
----------
theFunction: math_FunctionWithDerivative

Return
-------
bool

Description
-----------
This method is called at the end of each iteration to check if the solution has been found. It can be redefined in a sub-class to implement a specific test to stop the iterations.
") IsSolutionReached;
		virtual Standard_Boolean IsSolutionReached(math_FunctionWithDerivative & theFunction);

		/****** math_BissecNewton::Perform ******/
		/****** md5 signature: 91a3a6746b682eb243be44708127c09d ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
F: math_FunctionWithDerivative
Bound1: float
Bound2: float
NbIterations: int (optional, default to 100)

Return
-------
None

Description
-----------
A combination of Newton-Raphson and bissection methods is done to find the root of the function F between the bounds Bound1 and Bound2 on the function F. The tolerance required on the root is given by TolX. The solution is found when: abs(Xi - Xi-1) <= TolX and F(Xi) * F(Xi-1) <= 0 The maximum number of iterations allowed is given by NbIterations.
") Perform;
		void Perform(math_FunctionWithDerivative & F, const Standard_Real Bound1, const Standard_Real Bound2, const Standard_Integer NbIterations = 100);

		/****** math_BissecNewton::Root ******/
		/****** md5 signature: 1f1a437be6bd034392962de6cf04ded1 ******/
		%feature("compactdefaultargs") Root;
		%feature("autodoc", "Return
-------
float

Description
-----------
returns the value of the root. Exception NotDone is raised if the minimum was not found.
") Root;
		Standard_Real Root();

		/****** math_BissecNewton::Value ******/
		/****** md5 signature: 52655a2fb6642856b2c68a9331826787 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Return
-------
float

Description
-----------
returns the value of the function at the root. Exception NotDone is raised if the minimum was not found.
") Value;
		Standard_Real Value();

};


%extend math_BissecNewton {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************
* class math_BracketMinimum *
****************************/
class math_BracketMinimum {
	public:
		/****** math_BracketMinimum::math_BracketMinimum ******/
		/****** md5 signature: f1f4af70be6dc77d556ee2c41cc63355 ******/
		%feature("compactdefaultargs") math_BracketMinimum;
		%feature("autodoc", "
Parameters
----------
A: float
B: float

Return
-------
None

Description
-----------
Constructor preparing A and B parameters only. It does not perform the job.
") math_BracketMinimum;
		 math_BracketMinimum(const Standard_Real A, const Standard_Real B);

		/****** math_BracketMinimum::math_BracketMinimum ******/
		/****** md5 signature: e18e44b489b22bad963980abf271eb94 ******/
		%feature("compactdefaultargs") math_BracketMinimum;
		%feature("autodoc", "
Parameters
----------
F: math_Function
A: float
B: float

Return
-------
None

Description
-----------
Given two initial values this class computes a bracketing triplet of abscissae Ax, Bx, Cx (such that Bx is between Ax and Cx, F(Bx) is less than both F(Bx) and F(Cx)) the Brent minimization is done on the function F.
") math_BracketMinimum;
		 math_BracketMinimum(math_Function & F, const Standard_Real A, const Standard_Real B);

		/****** math_BracketMinimum::math_BracketMinimum ******/
		/****** md5 signature: 0ee9a1303656829bfe5bf5f526946996 ******/
		%feature("compactdefaultargs") math_BracketMinimum;
		%feature("autodoc", "
Parameters
----------
F: math_Function
A: float
B: float
FA: float

Return
-------
None

Description
-----------
Given two initial values this class computes a bracketing triplet of abscissae Ax, Bx, Cx (such that Bx is between Ax and Cx, F(Bx) is less than both F(Bx) and F(Cx)) the Brent minimization is done on the function F. This constructor has to be used if F(A) is known.
") math_BracketMinimum;
		 math_BracketMinimum(math_Function & F, const Standard_Real A, const Standard_Real B, const Standard_Real FA);

		/****** math_BracketMinimum::math_BracketMinimum ******/
		/****** md5 signature: a9d765656525593c5665b19f977d8062 ******/
		%feature("compactdefaultargs") math_BracketMinimum;
		%feature("autodoc", "
Parameters
----------
F: math_Function
A: float
B: float
FA: float
FB: float

Return
-------
None

Description
-----------
Given two initial values this class computes a bracketing triplet of abscissae Ax, Bx, Cx (such that Bx is between Ax and Cx, F(Bx) is less than both F(Bx) and F(Cx)) the Brent minimization is done on the function F. This constructor has to be used if F(A) and F(B) are known.
") math_BracketMinimum;
		 math_BracketMinimum(math_Function & F, const Standard_Real A, const Standard_Real B, const Standard_Real FA, const Standard_Real FB);

		/****** math_BracketMinimum::Dump ******/
		/****** md5 signature: d37b43e0b2386dc096d5d707876db157 ******/
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

		/****** math_BracketMinimum::FunctionValues ******/
		/****** md5 signature: 1c73efc8bd333bc361f9878adf3d2f5e ******/
		%feature("compactdefaultargs") FunctionValues;
		%feature("autodoc", "
Parameters
----------

Return
-------
FA: float
FB: float
FC: float

Description
-----------
returns the bracketed triplet function values. Exceptions StdFail_NotDone if the algorithm fails (and IsDone returns false).
") FunctionValues;
		void FunctionValues(Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** math_BracketMinimum::IsDone ******/
		/****** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if the computations are successful, otherwise returns false.
") IsDone;
		Standard_Boolean IsDone();

		/****** math_BracketMinimum::Perform ******/
		/****** md5 signature: 5f24d0600029702cc66b5c9352636cdd ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
F: math_Function

Return
-------
None

Description
-----------
The method performing the job. It is called automatically by constructors with the function.
") Perform;
		void Perform(math_Function & F);

		/****** math_BracketMinimum::SetFA ******/
		/****** md5 signature: 0d2056ad2385a7bd7b3ce105e529078d ******/
		%feature("compactdefaultargs") SetFA;
		%feature("autodoc", "
Parameters
----------
theValue: float

Return
-------
None

Description
-----------
Set function value at A.
") SetFA;
		void SetFA(const Standard_Real theValue);

		/****** math_BracketMinimum::SetFB ******/
		/****** md5 signature: 795bbf2f054392ffc5b0674d1d822dcc ******/
		%feature("compactdefaultargs") SetFB;
		%feature("autodoc", "
Parameters
----------
theValue: float

Return
-------
None

Description
-----------
Set function value at B.
") SetFB;
		void SetFB(const Standard_Real theValue);

		/****** math_BracketMinimum::SetLimits ******/
		/****** md5 signature: 244ce499a1293dceaf0e98e832ce5b8d ******/
		%feature("compactdefaultargs") SetLimits;
		%feature("autodoc", "
Parameters
----------
theLeft: float
theRight: float

Return
-------
None

Description
-----------
Set limits of the parameter. By default no limits are applied to the parameter change. If no minimum is found in limits then IsDone() will return false. The user is in charge of providing A and B to be in limits.
") SetLimits;
		void SetLimits(const Standard_Real theLeft, const Standard_Real theRight);

		/****** math_BracketMinimum::Values ******/
		/****** md5 signature: baabf4c49592a0df3dc04019ef8d908e ******/
		%feature("compactdefaultargs") Values;
		%feature("autodoc", "
Parameters
----------

Return
-------
A: float
B: float
C: float

Description
-----------
Returns the bracketed triplet of abscissae. Exceptions StdFail_NotDone if the algorithm fails (and IsDone returns false).
") Values;
		void Values(Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

};


%extend math_BracketMinimum {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************
* class math_BracketedRoot *
***************************/
class math_BracketedRoot {
	public:
		/****** math_BracketedRoot::math_BracketedRoot ******/
		/****** md5 signature: d40b8328cf4dbbdcc928ef30e6f10368 ******/
		%feature("compactdefaultargs") math_BracketedRoot;
		%feature("autodoc", "
Parameters
----------
F: math_Function
Bound1: float
Bound2: float
Tolerance: float
NbIterations: int (optional, default to 100)
ZEPS: float (optional, default to 1.0e-12)

Return
-------
None

Description
-----------
The Brent method is used to find the root of the function F between the bounds Bound1 and Bound2 on the function F. If F(Bound1)*F(Bound2) >0 the Brent method fails. The tolerance required for the root is given by Tolerance. The solution is found when: abs(Xi - Xi-1) <= Tolerance; The maximum number of iterations allowed is given by NbIterations.
") math_BracketedRoot;
		 math_BracketedRoot(math_Function & F, const Standard_Real Bound1, const Standard_Real Bound2, const Standard_Real Tolerance, const Standard_Integer NbIterations = 100, const Standard_Real ZEPS = 1.0e-12);

		/****** math_BracketedRoot::Dump ******/
		/****** md5 signature: d37b43e0b2386dc096d5d707876db157 ******/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "
Parameters
----------

Return
-------
o: Standard_OStream

Description
-----------
Prints on the stream o information on the current state of the object.
") Dump;
		void Dump(std::ostream &OutValue);

		/****** math_BracketedRoot::IsDone ******/
		/****** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if the computations are successful, otherwise returns false.
") IsDone;
		Standard_Boolean IsDone();

		/****** math_BracketedRoot::NbIterations ******/
		/****** md5 signature: 05334f1e34f7c858ac022754e906f2bf ******/
		%feature("compactdefaultargs") NbIterations;
		%feature("autodoc", "Return
-------
int

Description
-----------
returns the number of iterations really done during the computation of the Root. Exception NotDone is raised if the minimum was not found.
") NbIterations;
		Standard_Integer NbIterations();

		/****** math_BracketedRoot::Root ******/
		/****** md5 signature: 1f1a437be6bd034392962de6cf04ded1 ******/
		%feature("compactdefaultargs") Root;
		%feature("autodoc", "Return
-------
float

Description
-----------
returns the value of the root. Exception NotDone is raised if the minimum was not found.
") Root;
		Standard_Real Root();

		/****** math_BracketedRoot::Value ******/
		/****** md5 signature: 52655a2fb6642856b2c68a9331826787 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Return
-------
float

Description
-----------
returns the value of the function at the root. Exception NotDone is raised if the minimum was not found.
") Value;
		Standard_Real Value();

};


%extend math_BracketedRoot {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************
* class math_BrentMinimum *
**************************/
class math_BrentMinimum {
	public:
		/****** math_BrentMinimum::math_BrentMinimum ******/
		/****** md5 signature: 2417b805a0283037e8f6d6abe4401da0 ******/
		%feature("compactdefaultargs") math_BrentMinimum;
		%feature("autodoc", "
Parameters
----------
TolX: float
NbIterations: int (optional, default to 100)
ZEPS: float (optional, default to 1.0e-12)

Return
-------
None

Description
-----------
This constructor should be used in a sub-class to initialize correctly all the fields of this class.
") math_BrentMinimum;
		 math_BrentMinimum(const Standard_Real TolX, const Standard_Integer NbIterations = 100, const Standard_Real ZEPS = 1.0e-12);

		/****** math_BrentMinimum::math_BrentMinimum ******/
		/****** md5 signature: 83d66f919c7527f0bc6b52773adc6880 ******/
		%feature("compactdefaultargs") math_BrentMinimum;
		%feature("autodoc", "
Parameters
----------
TolX: float
Fbx: float
NbIterations: int (optional, default to 100)
ZEPS: float (optional, default to 1.0e-12)

Return
-------
None

Description
-----------
This constructor should be used in a sub-class to initialize correctly all the fields of this class. It has to be used if F(Bx) is known.
") math_BrentMinimum;
		 math_BrentMinimum(const Standard_Real TolX, const Standard_Real Fbx, const Standard_Integer NbIterations = 100, const Standard_Real ZEPS = 1.0e-12);

		/****** math_BrentMinimum::Dump ******/
		/****** md5 signature: d37b43e0b2386dc096d5d707876db157 ******/
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

		/****** math_BrentMinimum::IsDone ******/
		/****** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if the computations are successful, otherwise returns false.
") IsDone;
		Standard_Boolean IsDone();

		/****** math_BrentMinimum::IsSolutionReached ******/
		/****** md5 signature: 8c387e7d2be0b3045be6372a308b524d ******/
		%feature("compactdefaultargs") IsSolutionReached;
		%feature("autodoc", "
Parameters
----------
theFunction: math_Function

Return
-------
bool

Description
-----------
This method is called at the end of each iteration to check if the solution is found. It can be redefined in a sub-class to implement a specific test to stop the iterations.
") IsSolutionReached;
		virtual Standard_Boolean IsSolutionReached(math_Function & theFunction);

		/****** math_BrentMinimum::Location ******/
		/****** md5 signature: b4f000468710d05c1f656dc631d278d7 ******/
		%feature("compactdefaultargs") Location;
		%feature("autodoc", "Return
-------
float

Description
-----------
returns the location value of the minimum. Exception NotDone is raised if the minimum was not found.
") Location;
		Standard_Real Location();

		/****** math_BrentMinimum::Minimum ******/
		/****** md5 signature: c6e52c305b40f67530895542ef579d78 ******/
		%feature("compactdefaultargs") Minimum;
		%feature("autodoc", "Return
-------
float

Description
-----------
returns the value of the minimum. Exception NotDone is raised if the minimum was not found.
") Minimum;
		Standard_Real Minimum();

		/****** math_BrentMinimum::NbIterations ******/
		/****** md5 signature: 05334f1e34f7c858ac022754e906f2bf ******/
		%feature("compactdefaultargs") NbIterations;
		%feature("autodoc", "Return
-------
int

Description
-----------
returns the number of iterations really done during the computation of the minimum. Exception NotDone is raised if the minimum was not found.
") NbIterations;
		Standard_Integer NbIterations();

		/****** math_BrentMinimum::Perform ******/
		/****** md5 signature: 57ce13ea45e8519cbe4160a5190bb346 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
F: math_Function
Ax: float
Bx: float
Cx: float

Return
-------
None

Description
-----------
Brent minimization is performed on function F from a given bracketing triplet of abscissas Ax, Bx, Cx (such that Bx is between Ax and Cx, F(Bx) is less than both F(Bx) and F(Cx)) The solution is found when: abs(Xi - Xi-1) <= TolX * abs(Xi) + ZEPS;.
") Perform;
		void Perform(math_Function & F, const Standard_Real Ax, const Standard_Real Bx, const Standard_Real Cx);

};


%extend math_BrentMinimum {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************
* class math_BullardGenerator *
******************************/
class math_BullardGenerator {
	public:
		/****** math_BullardGenerator::math_BullardGenerator ******/
		/****** md5 signature: 07a559474d096973d7f90362f8ec9a2b ******/
		%feature("compactdefaultargs") math_BullardGenerator;
		%feature("autodoc", "
Parameters
----------
theSeed: unsigned int (optional, default to 1)

Return
-------
None

Description
-----------
Creates new Xorshift 64-bit RNG.
") math_BullardGenerator;
		 math_BullardGenerator(unsigned int theSeed = 1);

		/****** math_BullardGenerator::NextInt ******/
		/****** md5 signature: ea144b3b3f31717d76be8c78ee0cdda2 ******/
		%feature("compactdefaultargs") NextInt;
		%feature("autodoc", "Return
-------
unsigned int

Description
-----------
Generates new 64-bit integer value.
") NextInt;
		unsigned int NextInt();

		/****** math_BullardGenerator::NextReal ******/
		/****** md5 signature: 518bd5bd33c549f94c41aadf30a5c1af ******/
		%feature("compactdefaultargs") NextReal;
		%feature("autodoc", "Return
-------
float

Description
-----------
Generates new floating-point value.
") NextReal;
		Standard_Real NextReal();

		/****** math_BullardGenerator::SetSeed ******/
		/****** md5 signature: 2e05b7e10b8ef82dc91203e7d39fee0f ******/
		%feature("compactdefaultargs") SetSeed;
		%feature("autodoc", "
Parameters
----------
theSeed: unsigned int (optional, default to 1)

Return
-------
None

Description
-----------
Setup new seed / reset defaults.
") SetSeed;
		void SetSeed(unsigned int theSeed = 1);

};


%extend math_BullardGenerator {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************************
* class math_ComputeGaussPointsAndWeights *
******************************************/
class math_ComputeGaussPointsAndWeights {
	public:
		/****** math_ComputeGaussPointsAndWeights::math_ComputeGaussPointsAndWeights ******/
		/****** md5 signature: 4fab9d77c66048ba64a4b362e69803e4 ******/
		%feature("compactdefaultargs") math_ComputeGaussPointsAndWeights;
		%feature("autodoc", "
Parameters
----------
Number: int

Return
-------
None

Description
-----------
No available documentation.
") math_ComputeGaussPointsAndWeights;
		 math_ComputeGaussPointsAndWeights(const Standard_Integer Number);

		/****** math_ComputeGaussPointsAndWeights::IsDone ******/
		/****** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsDone;
		Standard_Boolean IsDone();

		/****** math_ComputeGaussPointsAndWeights::Points ******/
		/****** md5 signature: 8d8263eda279f3bc27a032c0bc14bb35 ******/
		%feature("compactdefaultargs") Points;
		%feature("autodoc", "Return
-------
math_Vector

Description
-----------
No available documentation.
") Points;
		math_Vector Points();

		/****** math_ComputeGaussPointsAndWeights::Weights ******/
		/****** md5 signature: 747bc1b76638516a5f353931c8f0bb19 ******/
		%feature("compactdefaultargs") Weights;
		%feature("autodoc", "Return
-------
math_Vector

Description
-----------
No available documentation.
") Weights;
		math_Vector Weights();

};


%extend math_ComputeGaussPointsAndWeights {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************************
* class math_ComputeKronrodPointsAndWeights *
********************************************/
class math_ComputeKronrodPointsAndWeights {
	public:
		/****** math_ComputeKronrodPointsAndWeights::math_ComputeKronrodPointsAndWeights ******/
		/****** md5 signature: 1dad53e47976ca58567676ceb4bdd042 ******/
		%feature("compactdefaultargs") math_ComputeKronrodPointsAndWeights;
		%feature("autodoc", "
Parameters
----------
Number: int

Return
-------
None

Description
-----------
No available documentation.
") math_ComputeKronrodPointsAndWeights;
		 math_ComputeKronrodPointsAndWeights(const Standard_Integer Number);

		/****** math_ComputeKronrodPointsAndWeights::IsDone ******/
		/****** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsDone;
		Standard_Boolean IsDone();

		/****** math_ComputeKronrodPointsAndWeights::Points ******/
		/****** md5 signature: 8d8263eda279f3bc27a032c0bc14bb35 ******/
		%feature("compactdefaultargs") Points;
		%feature("autodoc", "Return
-------
math_Vector

Description
-----------
No available documentation.
") Points;
		math_Vector Points();

		/****** math_ComputeKronrodPointsAndWeights::Weights ******/
		/****** md5 signature: 747bc1b76638516a5f353931c8f0bb19 ******/
		%feature("compactdefaultargs") Weights;
		%feature("autodoc", "Return
-------
math_Vector

Description
-----------
No available documentation.
") Weights;
		math_Vector Weights();

};


%extend math_ComputeKronrodPointsAndWeights {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************
* class math_Crout *
*******************/
class math_Crout {
	public:
		/****** math_Crout::math_Crout ******/
		/****** md5 signature: b1d44e1db688e6194254f0528e6dcfe0 ******/
		%feature("compactdefaultargs") math_Crout;
		%feature("autodoc", "
Parameters
----------
A: math_Matrix
MinPivot: float (optional, default to 1.0e-20)

Return
-------
None

Description
-----------
Given an input matrix A, this algorithm inverts A by the Crout algorithm. The user can give only the inferior triangle for the implementation. A can be decomposed like this: A = L * D * T(L) where L is triangular inferior and D is diagonal. If one element of A is less than MinPivot, A is considered as singular. Exception NotSquare is raised if A is not a square matrix.
") math_Crout;
		 math_Crout(const math_Matrix & A, const Standard_Real MinPivot = 1.0e-20);

		/****** math_Crout::Determinant ******/
		/****** md5 signature: 5ac8cd01bd8c7b44a3e7395b4e2f6518 ******/
		%feature("compactdefaultargs") Determinant;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the value of the determinant of the previously LU decomposed matrix A. Zero is returned if the matrix A is considered as singular. Exceptions StdFail_NotDone if the algorithm fails (and IsDone returns false).
") Determinant;
		Standard_Real Determinant();

		/****** math_Crout::Dump ******/
		/****** md5 signature: d37b43e0b2386dc096d5d707876db157 ******/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "
Parameters
----------

Return
-------
o: Standard_OStream

Description
-----------
Prints on the stream o information on the current state of the object.
") Dump;
		void Dump(std::ostream &OutValue);

		/****** math_Crout::Inverse ******/
		/****** md5 signature: 3ac969006d2d462bc1e6ea2d7d8929e6 ******/
		%feature("compactdefaultargs") Inverse;
		%feature("autodoc", "Return
-------
math_Matrix

Description
-----------
returns the inverse matrix of A. Only the inferior triangle is returned. Exception NotDone is raised if NotDone.
") Inverse;
		const math_Matrix & Inverse();

		/****** math_Crout::Invert ******/
		/****** md5 signature: 3042934a9caa618d22aceb841b1bb048 ******/
		%feature("compactdefaultargs") Invert;
		%feature("autodoc", "
Parameters
----------
Inv: math_Matrix

Return
-------
None

Description
-----------
returns in Inv the inverse matrix of A. Only the inferior triangle is returned. Exception NotDone is raised if NotDone.
") Invert;
		void Invert(math_Matrix & Inv);

		/****** math_Crout::IsDone ******/
		/****** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if all has been correctly done.
") IsDone;
		Standard_Boolean IsDone();

		/****** math_Crout::Solve ******/
		/****** md5 signature: ee147e7d65a116bd9db2ac0eb3018d6f ******/
		%feature("compactdefaultargs") Solve;
		%feature("autodoc", "
Parameters
----------
B: math_Vector
X: math_Vector

Return
-------
None

Description
-----------
Given an input vector <B>, this routine returns the solution of the set of linear equations A . X = B. Exception NotDone is raised if the decomposition was not done successfully. Exception DimensionError is raised if the range of B is not equal to the rowrange of A.
") Solve;
		void Solve(const math_Vector & B, math_Vector & X);

};


%extend math_Crout {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************************
* class math_DirectPolynomialRoots *
***********************************/
class math_DirectPolynomialRoots {
	public:
		/****** math_DirectPolynomialRoots::math_DirectPolynomialRoots ******/
		/****** md5 signature: 4b89fc095312b7ac31ee64733ec53978 ******/
		%feature("compactdefaultargs") math_DirectPolynomialRoots;
		%feature("autodoc", "
Parameters
----------
A: float
B: float
C: float
D: float
E: float

Return
-------
None

Description
-----------
computes all the real roots of the polynomial Ax4 + Bx3 + Cx2 + Dx + E using a direct method.
") math_DirectPolynomialRoots;
		 math_DirectPolynomialRoots(const Standard_Real A, const Standard_Real B, const Standard_Real C, const Standard_Real D, const Standard_Real E);

		/****** math_DirectPolynomialRoots::math_DirectPolynomialRoots ******/
		/****** md5 signature: 7f953a82c8476f2e56307f4856455483 ******/
		%feature("compactdefaultargs") math_DirectPolynomialRoots;
		%feature("autodoc", "
Parameters
----------
A: float
B: float
C: float
D: float

Return
-------
None

Description
-----------
computes all the real roots of the polynomial Ax3 + Bx2 + Cx + D using a direct method.
") math_DirectPolynomialRoots;
		 math_DirectPolynomialRoots(const Standard_Real A, const Standard_Real B, const Standard_Real C, const Standard_Real D);

		/****** math_DirectPolynomialRoots::math_DirectPolynomialRoots ******/
		/****** md5 signature: ef36e58d27a5dba6bcaaf03fec6d38f1 ******/
		%feature("compactdefaultargs") math_DirectPolynomialRoots;
		%feature("autodoc", "
Parameters
----------
A: float
B: float
C: float

Return
-------
None

Description
-----------
computes all the real roots of the polynomial Ax2 + Bx + C using a direct method.
") math_DirectPolynomialRoots;
		 math_DirectPolynomialRoots(const Standard_Real A, const Standard_Real B, const Standard_Real C);

		/****** math_DirectPolynomialRoots::math_DirectPolynomialRoots ******/
		/****** md5 signature: 5acbed2e722c829a79af8a81f7bed988 ******/
		%feature("compactdefaultargs") math_DirectPolynomialRoots;
		%feature("autodoc", "
Parameters
----------
A: float
B: float

Return
-------
None

Description
-----------
computes the real root of the polynomial Ax + B.
") math_DirectPolynomialRoots;
		 math_DirectPolynomialRoots(const Standard_Real A, const Standard_Real B);

		/****** math_DirectPolynomialRoots::Dump ******/
		/****** md5 signature: d37b43e0b2386dc096d5d707876db157 ******/
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

		/****** math_DirectPolynomialRoots::InfiniteRoots ******/
		/****** md5 signature: 6c844bee82586a7c3f4a33590d02fc3c ******/
		%feature("compactdefaultargs") InfiniteRoots;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if there is an infinity of roots, otherwise returns false.
") InfiniteRoots;
		Standard_Boolean InfiniteRoots();

		/****** math_DirectPolynomialRoots::IsDone ******/
		/****** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if the computations are successful, otherwise returns false.
") IsDone;
		Standard_Boolean IsDone();

		/****** math_DirectPolynomialRoots::NbSolutions ******/
		/****** md5 signature: 02fdbddb1f7eff080419f602203d8f8b ******/
		%feature("compactdefaultargs") NbSolutions;
		%feature("autodoc", "Return
-------
int

Description
-----------
returns the number of solutions. An exception is raised if there are an infinity of roots.
") NbSolutions;
		Standard_Integer NbSolutions();

		/****** math_DirectPolynomialRoots::Value ******/
		/****** md5 signature: ce64f743863f7841a0200359c4eca81a ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
Nieme: int

Return
-------
float

Description
-----------
returns the value of the Nieme root. An exception is raised if there are an infinity of roots. Exception RangeError is raised if Nieme is < 1 or Nieme > NbSolutions.
") Value;
		Standard_Real Value(const Standard_Integer Nieme);

};


%extend math_DirectPolynomialRoots {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************
* class math_DoubleTab *
***********************/
class math_DoubleTab {
	public:
		/****** math_DoubleTab::math_DoubleTab ******/
		/****** md5 signature: dd62dc7a503b4e9ead3497c539a154c9 ******/
		%feature("compactdefaultargs") math_DoubleTab;
		%feature("autodoc", "
Parameters
----------
LowerRow: int
UpperRow: int
LowerCol: int
UpperCol: int

Return
-------
None

Description
-----------
No available documentation.
") math_DoubleTab;
		 math_DoubleTab(const Standard_Integer LowerRow, const Standard_Integer UpperRow, const Standard_Integer LowerCol, const Standard_Integer UpperCol);

		/****** math_DoubleTab::math_DoubleTab ******/
		/****** md5 signature: 718f878a1d36f54a6b5077cc2090da04 ******/
		%feature("compactdefaultargs") math_DoubleTab;
		%feature("autodoc", "
Parameters
----------
Tab: Standard_Address
LowerRow: int
UpperRow: int
LowerCol: int
UpperCol: int

Return
-------
None

Description
-----------
No available documentation.
") math_DoubleTab;
		 math_DoubleTab(const Standard_Address Tab, const Standard_Integer LowerRow, const Standard_Integer UpperRow, const Standard_Integer LowerCol, const Standard_Integer UpperCol);

		/****** math_DoubleTab::math_DoubleTab ******/
		/****** md5 signature: f723304f2213117bdd24c71e050bd649 ******/
		%feature("compactdefaultargs") math_DoubleTab;
		%feature("autodoc", "
Parameters
----------
Other: math_DoubleTab

Return
-------
None

Description
-----------
No available documentation.
") math_DoubleTab;
		 math_DoubleTab(const math_DoubleTab & Other);

		/****** math_DoubleTab::Copy ******/
		/****** md5 signature: e7e1b8d80620906bbc481a937d0b33da ******/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "
Parameters
----------
Other: math_DoubleTab

Return
-------
None

Description
-----------
No available documentation.
") Copy;
		void Copy(math_DoubleTab & Other);

		/****** math_DoubleTab::Free ******/
		/****** md5 signature: adf04b00a0d9dc585c1f31bcdbc395bf ******/
		%feature("compactdefaultargs") Free;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Free;
		void Free();

		/****** math_DoubleTab::Init ******/
		/****** md5 signature: 408522793f4cf840b93ec255a9edba4e ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
InitValue: float

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const Standard_Real InitValue);

		/****** math_DoubleTab::SetLowerCol ******/
		/****** md5 signature: 493e3ef08fa74bceb5c3e382aadd7a03 ******/
		%feature("compactdefaultargs") SetLowerCol;
		%feature("autodoc", "
Parameters
----------
LowerCol: int

Return
-------
None

Description
-----------
No available documentation.
") SetLowerCol;
		void SetLowerCol(const Standard_Integer LowerCol);

		/****** math_DoubleTab::SetLowerRow ******/
		/****** md5 signature: e72a8f19553efe52063a6089415a0532 ******/
		%feature("compactdefaultargs") SetLowerRow;
		%feature("autodoc", "
Parameters
----------
LowerRow: int

Return
-------
None

Description
-----------
No available documentation.
") SetLowerRow;
		void SetLowerRow(const Standard_Integer LowerRow);


        %feature("autodoc","1");
        %extend {
            Standard_Real GetValue(const Standard_Integer RowIndex,const Standard_Integer ColIndex) {
            return (Standard_Real) $self->Value(RowIndex,ColIndex);
            }
        };
        %feature("autodoc","1");
        %extend {
            void SetValue(const Standard_Integer RowIndex,const Standard_Integer ColIndex,Standard_Real value) {
            $self->Value(RowIndex,ColIndex)=value;
            }
        };
};


%extend math_DoubleTab {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************
* class math_EigenValuesSearcher *
*********************************/
class math_EigenValuesSearcher {
	public:
		/****** math_EigenValuesSearcher::math_EigenValuesSearcher ******/
		/****** md5 signature: 2120d48f824288d3987ddb5fd3ca1421 ******/
		%feature("compactdefaultargs") math_EigenValuesSearcher;
		%feature("autodoc", "
Parameters
----------
Diagonal: TColStd_Array1OfReal
Subdiagonal: TColStd_Array1OfReal

Return
-------
None

Description
-----------
No available documentation.
") math_EigenValuesSearcher;
		 math_EigenValuesSearcher(const TColStd_Array1OfReal & Diagonal, const TColStd_Array1OfReal & Subdiagonal);

		/****** math_EigenValuesSearcher::Dimension ******/
		/****** md5 signature: e4bdde894007391dd45dcb2fa38eb0af ******/
		%feature("compactdefaultargs") Dimension;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the dimension of matrix.
") Dimension;
		Standard_Integer Dimension();

		/****** math_EigenValuesSearcher::EigenValue ******/
		/****** md5 signature: 0ab1fd10421232a0a802aadf342fdf04 ******/
		%feature("compactdefaultargs") EigenValue;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
float

Description
-----------
Returns the Index_th eigen value of matrix Index must be in [1, Dimension()].
") EigenValue;
		Standard_Real EigenValue(const Standard_Integer Index);

		/****** math_EigenValuesSearcher::EigenVector ******/
		/****** md5 signature: 73ae866c64caa8314d69872926c396c5 ******/
		%feature("compactdefaultargs") EigenVector;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
math_Vector

Description
-----------
Returns the Index_th eigen vector of matrix Index must be in [1, Dimension()].
") EigenVector;
		math_Vector EigenVector(const Standard_Integer Index);

		/****** math_EigenValuesSearcher::IsDone ******/
		/****** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns Standard_True if computation is performed successfully.
") IsDone;
		Standard_Boolean IsDone();

};


%extend math_EigenValuesSearcher {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************
* class math_FRPR *
******************/
class math_FRPR {
	public:
		/****** math_FRPR::math_FRPR ******/
		/****** md5 signature: a66fe8e5bfed9e9c8162762a301a19ba ******/
		%feature("compactdefaultargs") math_FRPR;
		%feature("autodoc", "
Parameters
----------
theFunction: math_MultipleVarFunctionWithGradient
theTolerance: float
theNbIterations: int (optional, default to 200)
theZEPS: float (optional, default to 1.0e-12)

Return
-------
None

Description
-----------
Initializes the computation of the minimum of F. Warning: constructor does not perform computations.
") math_FRPR;
		 math_FRPR(const math_MultipleVarFunctionWithGradient & theFunction, const Standard_Real theTolerance, const Standard_Integer theNbIterations = 200, const Standard_Real theZEPS = 1.0e-12);

		/****** math_FRPR::Dump ******/
		/****** md5 signature: d37b43e0b2386dc096d5d707876db157 ******/
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

		/****** math_FRPR::Gradient ******/
		/****** md5 signature: 6c3691fb2b0bb6085965955bdcce0a12 ******/
		%feature("compactdefaultargs") Gradient;
		%feature("autodoc", "Return
-------
math_Vector

Description
-----------
returns the gradient vector at the minimum. Exception NotDone is raised if the minimum was not found.
") Gradient;
		const math_Vector & Gradient();

		/****** math_FRPR::Gradient ******/
		/****** md5 signature: d04c1575bb29bb8c6afa62dba0106edc ******/
		%feature("compactdefaultargs") Gradient;
		%feature("autodoc", "
Parameters
----------
Grad: math_Vector

Return
-------
None

Description
-----------
outputs the gradient vector at the minimum in Grad. Exception NotDone is raised if the minimum was not found. Exception DimensionError is raised if the range of Grad is not equal to the range of the StartingPoint.
") Gradient;
		void Gradient(math_Vector & Grad);

		/****** math_FRPR::IsDone ******/
		/****** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if the computations are successful, otherwise returns false.
") IsDone;
		Standard_Boolean IsDone();

		/****** math_FRPR::IsSolutionReached ******/
		/****** md5 signature: 7ba44d3080e2281d0c476dff3710be5e ******/
		%feature("compactdefaultargs") IsSolutionReached;
		%feature("autodoc", "
Parameters
----------
theFunction: math_MultipleVarFunctionWithGradient

Return
-------
bool

Description
-----------
The solution F = Fi is found when: 2.0 * abs(Fi - Fi-1) <= Tolerance * (abs(Fi) + abs(Fi-1)) + ZEPS. The maximum number of iterations allowed is given by NbIterations.
") IsSolutionReached;
		virtual Standard_Boolean IsSolutionReached(math_MultipleVarFunctionWithGradient & theFunction);

		/****** math_FRPR::Location ******/
		/****** md5 signature: 5a88ac2c95c5682bdeb613bd0a6c6d51 ******/
		%feature("compactdefaultargs") Location;
		%feature("autodoc", "Return
-------
math_Vector

Description
-----------
returns the location vector of the minimum. Exception NotDone is raised if the minimum was not found.
") Location;
		const math_Vector & Location();

		/****** math_FRPR::Location ******/
		/****** md5 signature: c2f6dc7227af27a93b49ddbc87dfbc1a ******/
		%feature("compactdefaultargs") Location;
		%feature("autodoc", "
Parameters
----------
Loc: math_Vector

Return
-------
None

Description
-----------
outputs the location vector of the minimum in Loc. Exception NotDone is raised if the minimum was not found. Exception DimensionError is raised if the range of Loc is not equal to the range of the StartingPoint.
") Location;
		void Location(math_Vector & Loc);

		/****** math_FRPR::Minimum ******/
		/****** md5 signature: c6e52c305b40f67530895542ef579d78 ******/
		%feature("compactdefaultargs") Minimum;
		%feature("autodoc", "Return
-------
float

Description
-----------
returns the value of the minimum. Exception NotDone is raised if the minimum was not found.
") Minimum;
		Standard_Real Minimum();

		/****** math_FRPR::NbIterations ******/
		/****** md5 signature: 05334f1e34f7c858ac022754e906f2bf ******/
		%feature("compactdefaultargs") NbIterations;
		%feature("autodoc", "Return
-------
int

Description
-----------
returns the number of iterations really done during the computation of the minimum. Exception NotDone is raised if the minimum was not found.
") NbIterations;
		Standard_Integer NbIterations();

		/****** math_FRPR::Perform ******/
		/****** md5 signature: 0868ba98170667ca3228919fdb674a2e ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
theFunction: math_MultipleVarFunctionWithGradient
theStartingPoint: math_Vector

Return
-------
None

Description
-----------
The solution F = Fi is found when 2.0 * abs(Fi - Fi-1) <= Tolerance * (abs(Fi) + abs(Fi-1) + ZEPS).
") Perform;
		void Perform(math_MultipleVarFunctionWithGradient & theFunction, const math_Vector & theStartingPoint);

};


%extend math_FRPR {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************
* class math_Function *
**********************/
%nodefaultctor math_Function;
class math_Function {
	public:
		/****** math_Function::GetStateNumber ******/
		/****** md5 signature: 72c7d030f77e2ffa21bc582e871fee3f ******/
		%feature("compactdefaultargs") GetStateNumber;
		%feature("autodoc", "Return
-------
int

Description
-----------
returns the state of the function corresponding to the latest call of any methods associated with the function. This function is called by each of the algorithms described later which defined the function Integer Algorithm::StateNumber(). The algorithm has the responsibility to call this function when it has found a solution (i.e. a root or a minimum) and has to maintain the association between the solution found and this StateNumber. Byu default, this method returns 0 (which means for the algorithm: no state has been saved). It is the responsibility of the programmer to decide if he needs to save the current state of the function and to return an Integer that allows retrieval of the state.
") GetStateNumber;
		virtual Standard_Integer GetStateNumber();

		/****** math_Function::Value ******/
		/****** md5 signature: 4743230a1413804c068db1aa9417569d ******/
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
Computes the value of the function <F> for a given value of variable <X>. returns True if the computation was done successfully, False otherwise.
") Value;
		virtual Standard_Boolean Value(const Standard_Real X, Standard_Real &OutValue);

};


%extend math_Function {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************
* class math_FunctionAllRoots *
******************************/
class math_FunctionAllRoots {
	public:
		/****** math_FunctionAllRoots::math_FunctionAllRoots ******/
		/****** md5 signature: 39adf3c78fcbd13d7730434fbc1708cd ******/
		%feature("compactdefaultargs") math_FunctionAllRoots;
		%feature("autodoc", "
Parameters
----------
F: math_FunctionWithDerivative
S: math_FunctionSample
EpsX: float
EpsF: float
EpsNul: float

Return
-------
None

Description
-----------
The algorithm uses the sample to find intervals on which the function is null. An interval is found if, for at least two consecutive points of the sample, Ui and Ui+1, we get |F(Ui)|<=EpsNul and |F(Ui+1)|<=EpsNul. The real bounds of an interval are computed with the FunctionRoots. algorithm. Between two intervals, the roots of the function F are calculated using the FunctionRoots algorithm.
") math_FunctionAllRoots;
		 math_FunctionAllRoots(math_FunctionWithDerivative & F, const math_FunctionSample & S, const Standard_Real EpsX, const Standard_Real EpsF, const Standard_Real EpsNul);

		/****** math_FunctionAllRoots::Dump ******/
		/****** md5 signature: d37b43e0b2386dc096d5d707876db157 ******/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "
Parameters
----------

Return
-------
o: Standard_OStream

Description
-----------
Prints on the stream o information on the current state of the object.
") Dump;
		void Dump(std::ostream &OutValue);

		/****** math_FunctionAllRoots::GetInterval ******/
		/****** md5 signature: 6687e7adaceb5b49c509c22d7f0c75d8 ******/
		%feature("compactdefaultargs") GetInterval;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
A: float
B: float

Description
-----------
Returns the interval of parameter of range Index. An exception is raised if IsDone returns False; An exception is raised if Index<=0 or Index >Nbintervals.
") GetInterval;
		void GetInterval(const Standard_Integer Index, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** math_FunctionAllRoots::GetIntervalState ******/
		/****** md5 signature: e71f08c028a1b0bade4b8d80ac40b26a ******/
		%feature("compactdefaultargs") GetIntervalState;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
IFirst: int
ILast: int

Description
-----------
returns the State Number associated to the interval Index. An exception is raised if IsDone returns False; An exception is raised if Index<=0 or Index >Nbintervals.
") GetIntervalState;
		void GetIntervalState(const Standard_Integer Index, Standard_Integer &OutValue, Standard_Integer &OutValue);

		/****** math_FunctionAllRoots::GetPoint ******/
		/****** md5 signature: 0305e05ec1e18bd3c210afc18b48917e ******/
		%feature("compactdefaultargs") GetPoint;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
float

Description
-----------
Returns the parameter of the point of range Index. An exception is raised if IsDone returns False; An exception is raised if Index<=0 or Index >NbPoints.
") GetPoint;
		Standard_Real GetPoint(const Standard_Integer Index);

		/****** math_FunctionAllRoots::GetPointState ******/
		/****** md5 signature: ae45bebd132b6cfea2959aaa813e38f7 ******/
		%feature("compactdefaultargs") GetPointState;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
int

Description
-----------
returns the State Number associated to the point Index. An exception is raised if IsDone returns False; An exception is raised if Index<=0 or Index >Nbintervals.
") GetPointState;
		Standard_Integer GetPointState(const Standard_Integer Index);

		/****** math_FunctionAllRoots::IsDone ******/
		/****** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if the computation has been done successfully.
") IsDone;
		Standard_Boolean IsDone();

		/****** math_FunctionAllRoots::NbIntervals ******/
		/****** md5 signature: 64f54fde4d9752772b52d73d27261bcb ******/
		%feature("compactdefaultargs") NbIntervals;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of intervals on which the function is Null. An exception is raised if IsDone returns False.
") NbIntervals;
		Standard_Integer NbIntervals();

		/****** math_FunctionAllRoots::NbPoints ******/
		/****** md5 signature: 1d4bbbd7c4dda4f1e56c00ae994bedbe ******/
		%feature("compactdefaultargs") NbPoints;
		%feature("autodoc", "Return
-------
int

Description
-----------
returns the number of points where the function is Null. An exception is raised if IsDone returns False.
") NbPoints;
		Standard_Integer NbPoints();

};


%extend math_FunctionAllRoots {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************
* class math_FunctionRoot *
**************************/
class math_FunctionRoot {
	public:
		/****** math_FunctionRoot::math_FunctionRoot ******/
		/****** md5 signature: 545a447b64e5b6f379c749f9310c1f5e ******/
		%feature("compactdefaultargs") math_FunctionRoot;
		%feature("autodoc", "
Parameters
----------
F: math_FunctionWithDerivative
Guess: float
Tolerance: float
NbIterations: int (optional, default to 100)

Return
-------
None

Description
-----------
The Newton-Raphson method is done to find the root of the function F from the initial guess Guess.The tolerance required on the root is given by Tolerance. Iterations are stopped if the expected solution does not stay in the range A..B. The solution is found when abs(Xi - Xi-1) <= Tolerance; The maximum number of iterations allowed is given by NbIterations.
") math_FunctionRoot;
		 math_FunctionRoot(math_FunctionWithDerivative & F, const Standard_Real Guess, const Standard_Real Tolerance, const Standard_Integer NbIterations = 100);

		/****** math_FunctionRoot::math_FunctionRoot ******/
		/****** md5 signature: f0d284eec7b2ebd629f92df29c4b7b65 ******/
		%feature("compactdefaultargs") math_FunctionRoot;
		%feature("autodoc", "
Parameters
----------
F: math_FunctionWithDerivative
Guess: float
Tolerance: float
A: float
B: float
NbIterations: int (optional, default to 100)

Return
-------
None

Description
-----------
The Newton-Raphson method is done to find the root of the function F from the initial guess Guess. The tolerance required on the root is given by Tolerance. Iterations are stopped if the expected solution does not stay in the range A..B The solution is found when abs(Xi - Xi-1) <= Tolerance; The maximum number of iterations allowed is given by NbIterations.
") math_FunctionRoot;
		 math_FunctionRoot(math_FunctionWithDerivative & F, const Standard_Real Guess, const Standard_Real Tolerance, const Standard_Real A, const Standard_Real B, const Standard_Integer NbIterations = 100);

		/****** math_FunctionRoot::Derivative ******/
		/****** md5 signature: 63ea99dea8601c9ed801e924cf6ad25a ******/
		%feature("compactdefaultargs") Derivative;
		%feature("autodoc", "Return
-------
float

Description
-----------
returns the value of the derivative at the root. Exception NotDone is raised if the root was not found.
") Derivative;
		Standard_Real Derivative();

		/****** math_FunctionRoot::Dump ******/
		/****** md5 signature: d37b43e0b2386dc096d5d707876db157 ******/
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

		/****** math_FunctionRoot::IsDone ******/
		/****** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if the computations are successful, otherwise returns false.
") IsDone;
		Standard_Boolean IsDone();

		/****** math_FunctionRoot::NbIterations ******/
		/****** md5 signature: 05334f1e34f7c858ac022754e906f2bf ******/
		%feature("compactdefaultargs") NbIterations;
		%feature("autodoc", "Return
-------
int

Description
-----------
returns the number of iterations really done on the computation of the Root. Exception NotDone is raised if the root was not found.
") NbIterations;
		Standard_Integer NbIterations();

		/****** math_FunctionRoot::Root ******/
		/****** md5 signature: 1f1a437be6bd034392962de6cf04ded1 ******/
		%feature("compactdefaultargs") Root;
		%feature("autodoc", "Return
-------
float

Description
-----------
returns the value of the root. Exception NotDone is raised if the root was not found.
") Root;
		Standard_Real Root();

		/****** math_FunctionRoot::Value ******/
		/****** md5 signature: 52655a2fb6642856b2c68a9331826787 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Return
-------
float

Description
-----------
returns the value of the function at the root. Exception NotDone is raised if the root was not found.
") Value;
		Standard_Real Value();

};


%extend math_FunctionRoot {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************
* class math_FunctionRoots *
***************************/
class math_FunctionRoots {
	public:
		/****** math_FunctionRoots::math_FunctionRoots ******/
		/****** md5 signature: abf707bf72f290b30f6f389c3c53da02 ******/
		%feature("compactdefaultargs") math_FunctionRoots;
		%feature("autodoc", "
Parameters
----------
F: math_FunctionWithDerivative
A: float
B: float
NbSample: int
EpsX: float (optional, default to 0.0)
EpsF: float (optional, default to 0.0)
EpsNull: float (optional, default to 0.0)
K: float (optional, default to 0.0)

Return
-------
None

Description
-----------
Calculates all the real roots of a function F-K within the range A..B. without conditions on A and B A solution X is found when abs(Xi - Xi-1) <= Epsx and abs(F(Xi)-K) <= EpsF. The function is considered as null between A and B if abs(F-K) <= EpsNull within this range.
") math_FunctionRoots;
		 math_FunctionRoots(math_FunctionWithDerivative & F, const Standard_Real A, const Standard_Real B, const Standard_Integer NbSample, const Standard_Real EpsX = 0.0, const Standard_Real EpsF = 0.0, const Standard_Real EpsNull = 0.0, const Standard_Real K = 0.0);

		/****** math_FunctionRoots::Dump ******/
		/****** md5 signature: d37b43e0b2386dc096d5d707876db157 ******/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "
Parameters
----------

Return
-------
o: Standard_OStream

Description
-----------
Prints on the stream o information on the current state of the object.
") Dump;
		void Dump(std::ostream &OutValue);

		/****** math_FunctionRoots::IsAllNull ******/
		/****** md5 signature: e00a1caef8eb3e9a54836fe956196c51 ******/
		%feature("compactdefaultargs") IsAllNull;
		%feature("autodoc", "Return
-------
bool

Description
-----------
returns true if the function is considered as null between A and B. Exceptions StdFail_NotDone if the algorithm fails (and IsDone returns false).
") IsAllNull;
		Standard_Boolean IsAllNull();

		/****** math_FunctionRoots::IsDone ******/
		/****** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if the computations are successful, otherwise returns false.
") IsDone;
		Standard_Boolean IsDone();

		/****** math_FunctionRoots::NbSolutions ******/
		/****** md5 signature: 02fdbddb1f7eff080419f602203d8f8b ******/
		%feature("compactdefaultargs") NbSolutions;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of solutions found. Exceptions StdFail_NotDone if the algorithm fails (and IsDone returns false).
") NbSolutions;
		Standard_Integer NbSolutions();

		/****** math_FunctionRoots::StateNumber ******/
		/****** md5 signature: d20185d797d6ee1ddfa25e8eb9f4c38f ******/
		%feature("compactdefaultargs") StateNumber;
		%feature("autodoc", "
Parameters
----------
Nieme: int

Return
-------
int

Description
-----------
returns the StateNumber of the Nieme root. Exception RangeError is raised if Nieme is < 1 or Nieme > NbSolutions.
") StateNumber;
		Standard_Integer StateNumber(const Standard_Integer Nieme);

		/****** math_FunctionRoots::Value ******/
		/****** md5 signature: ce64f743863f7841a0200359c4eca81a ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
Nieme: int

Return
-------
float

Description
-----------
Returns the Nth value of the root of function F. Exceptions StdFail_NotDone if the algorithm fails (and IsDone returns false).
") Value;
		Standard_Real Value(const Standard_Integer Nieme);

};


%extend math_FunctionRoots {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************
* class math_FunctionSample *
****************************/
class math_FunctionSample {
	public:
		/****** math_FunctionSample::math_FunctionSample ******/
		/****** md5 signature: ca41d1216a18facca22beb41ec5f7052 ******/
		%feature("compactdefaultargs") math_FunctionSample;
		%feature("autodoc", "
Parameters
----------
A: float
B: float
N: int

Return
-------
None

Description
-----------
No available documentation.
") math_FunctionSample;
		 math_FunctionSample(const Standard_Real A, const Standard_Real B, const Standard_Integer N);

		/****** math_FunctionSample::Bounds ******/
		/****** md5 signature: 04ba7e6cd4378e996946f1d9439d3da5 ******/
		%feature("compactdefaultargs") Bounds;
		%feature("autodoc", "
Parameters
----------

Return
-------
A: float
B: float

Description
-----------
Returns the bounds of parameters.
") Bounds;
		virtual void Bounds(Standard_Real &OutValue, Standard_Real &OutValue);

		/****** math_FunctionSample::GetParameter ******/
		/****** md5 signature: ee75993f5910b04b1fbdbaf2e5bb8839 ******/
		%feature("compactdefaultargs") GetParameter;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
float

Description
-----------
Returns the value of parameter of the point of range Index: A + ((Index-1)/(NbPoints-1))*B. An exception is raised if Index<=0 or Index>NbPoints.
") GetParameter;
		virtual Standard_Real GetParameter(const Standard_Integer Index);

		/****** math_FunctionSample::NbPoints ******/
		/****** md5 signature: 1d4bbbd7c4dda4f1e56c00ae994bedbe ******/
		%feature("compactdefaultargs") NbPoints;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of sample points.
") NbPoints;
		Standard_Integer NbPoints();

};


%extend math_FunctionSample {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************
* class math_FunctionSet *
*************************/
%nodefaultctor math_FunctionSet;
class math_FunctionSet {
	public:
		/****** math_FunctionSet::GetStateNumber ******/
		/****** md5 signature: 72c7d030f77e2ffa21bc582e871fee3f ******/
		%feature("compactdefaultargs") GetStateNumber;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the state of the function corresponding to the latestcall of any methods associated with the function. This function is called by each of the algorithms described later which define the function Integer Algorithm::StateNumber(). The algorithm has the responsibility to call this function when it has found a solution (i.e. a root or a minimum) and has to maintain the association between the solution found and this StateNumber. Byu default, this method returns 0 (which means for the algorithm: no state has been saved). It is the responsibility of the programmer to decide if he needs to save the current state of the function and to return an Integer that allows retrieval of the state.
") GetStateNumber;
		virtual Standard_Integer GetStateNumber();

		/****** math_FunctionSet::NbEquations ******/
		/****** md5 signature: ba4fd9483f383d968d2ec54d4ae3fbf1 ******/
		%feature("compactdefaultargs") NbEquations;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of equations of the function.
") NbEquations;
		virtual Standard_Integer NbEquations();

		/****** math_FunctionSet::NbVariables ******/
		/****** md5 signature: 9592108ebf305562827d51d05d64eecc ******/
		%feature("compactdefaultargs") NbVariables;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of variables of the function.
") NbVariables;
		virtual Standard_Integer NbVariables();

		/****** math_FunctionSet::Value ******/
		/****** md5 signature: fbdd70146ff924dbae65883aeb76c6f7 ******/
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
Computes the values <F> of the functions for the variable <X>. returns True if the computation was done successfully, False otherwise.
") Value;
		virtual Standard_Boolean Value(const math_Vector & X, math_Vector & F);

};


%extend math_FunctionSet {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************
* class math_FunctionSetRoot *
*****************************/
class math_FunctionSetRoot {
	public:
		/****** math_FunctionSetRoot::math_FunctionSetRoot ******/
		/****** md5 signature: 414ab675eefb861155019331ee3dd3b5 ******/
		%feature("compactdefaultargs") math_FunctionSetRoot;
		%feature("autodoc", "
Parameters
----------
F: math_FunctionSetWithDerivatives
Tolerance: math_Vector
NbIterations: int (optional, default to 100)

Return
-------
None

Description
-----------
is used in a sub-class to initialize correctly all the fields of this class. The range (1, F.NbVariables()) must be especially respected for all vectors and matrix declarations.
") math_FunctionSetRoot;
		 math_FunctionSetRoot(math_FunctionSetWithDerivatives & F, const math_Vector & Tolerance, const Standard_Integer NbIterations = 100);

		/****** math_FunctionSetRoot::math_FunctionSetRoot ******/
		/****** md5 signature: d03ee6cdc8f09be698f4adb5d6369bef ******/
		%feature("compactdefaultargs") math_FunctionSetRoot;
		%feature("autodoc", "
Parameters
----------
F: math_FunctionSetWithDerivatives
NbIterations: int (optional, default to 100)

Return
-------
None

Description
-----------
is used in a sub-class to initialize correctly all the fields of this class. The range (1, F.NbVariables()) must be especially respected for all vectors and matrix declarations. The method SetTolerance must be called after this constructor.
") math_FunctionSetRoot;
		 math_FunctionSetRoot(math_FunctionSetWithDerivatives & F, const Standard_Integer NbIterations = 100);

		/****** math_FunctionSetRoot::Derivative ******/
		/****** md5 signature: fcd9ef2e33cbc01b115f3add2846c468 ******/
		%feature("compactdefaultargs") Derivative;
		%feature("autodoc", "Return
-------
math_Matrix

Description
-----------
Returns the matrix value of the derivative at the root. Exception NotDone is raised if the root was not found.
") Derivative;
		const math_Matrix & Derivative();

		/****** math_FunctionSetRoot::Derivative ******/
		/****** md5 signature: 7c4478e7f2c54768ee35dbf6b4914076 ******/
		%feature("compactdefaultargs") Derivative;
		%feature("autodoc", "
Parameters
----------
Der: math_Matrix

Return
-------
None

Description
-----------
outputs the matrix value of the derivative at the root in Der. Exception NotDone is raised if the root was not found. Exception DimensionError is raised if the column range of <Der> is not equal to the range of the startingPoint.
") Derivative;
		void Derivative(math_Matrix & Der);

		/****** math_FunctionSetRoot::Dump ******/
		/****** md5 signature: d37b43e0b2386dc096d5d707876db157 ******/
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

		/****** math_FunctionSetRoot::FunctionSetErrors ******/
		/****** md5 signature: 5c3b5fe11df662477290ea4121b545af ******/
		%feature("compactdefaultargs") FunctionSetErrors;
		%feature("autodoc", "Return
-------
math_Vector

Description
-----------
returns the vector value of the error done on the functions at the root. Exception NotDone is raised if the root was not found.
") FunctionSetErrors;
		const math_Vector & FunctionSetErrors();

		/****** math_FunctionSetRoot::FunctionSetErrors ******/
		/****** md5 signature: 42d5fb93e272f054a74fbe4bd77ad1f2 ******/
		%feature("compactdefaultargs") FunctionSetErrors;
		%feature("autodoc", "
Parameters
----------
Err: math_Vector

Return
-------
None

Description
-----------
outputs the vector value of the error done on the functions at the root in Err. Exception NotDone is raised if the root was not found. Exception DimensionError is raised if the range of Err is not equal to the range of the StartingPoint.
") FunctionSetErrors;
		void FunctionSetErrors(math_Vector & Err);

		/****** math_FunctionSetRoot::IsDivergent ******/
		/****** md5 signature: 96410564fded70ab52b25d92b739e5b8 ******/
		%feature("compactdefaultargs") IsDivergent;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsDivergent;
		Standard_Boolean IsDivergent();

		/****** math_FunctionSetRoot::IsDone ******/
		/****** md5 signature: e385477ab1bec806154173d4a550fd68 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if the computations are successful, otherwise returns false.
") IsDone;
		Standard_Boolean IsDone();

		/****** math_FunctionSetRoot::IsSolutionReached ******/
		/****** md5 signature: 2a9a392515a38070b5013e85c5f9b31f ******/
		%feature("compactdefaultargs") IsSolutionReached;
		%feature("autodoc", "
Parameters
----------
&: math_FunctionSetWithDerivatives

Return
-------
bool

Description
-----------
This routine is called at the end of each iteration to check if the solution was found. It can be redefined in a sub-class to implement a specific test to stop the iterations. In this case, the solution is found when: abs(Xi - Xi-1) <= Tolerance for all unknowns.
") IsSolutionReached;
		virtual Standard_Boolean IsSolutionReached(math_FunctionSetWithDerivatives &);

		/****** math_FunctionSetRoot::NbIterations ******/
		/****** md5 signature: afa9e692e88494ad7998dd4619f3c08a ******/
		%feature("compactdefaultargs") NbIterations;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of iterations really done during the computation of the root. Exception NotDone is raised if the root was not found.
") NbIterations;
		Standard_Integer NbIterations();

		/****** math_FunctionSetRoot::Perform ******/
		/****** md5 signature: 65314f15eb332ce8899089638e7703dd ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
theFunction: math_FunctionSetWithDerivatives
theStartingPoint: math_Vector
theStopOnDivergent: bool (optional, default to Standard_False)

Return
-------
None

Description
-----------
Improves the root of function from the initial guess point. The infinum and supremum may be given to constrain the solution. In this case, the solution is found when: abs(Xi - Xi-1)(j) <= Tolerance(j) for all unknowns.
") Perform;
		void Perform(math_FunctionSetWithDerivatives & theFunction, const math_Vector & theStartingPoint, const Standard_Boolean theStopOnDivergent = Standard_False);

		/****** math_FunctionSetRoot::Perform ******/
		/****** md5 signature: 242967ab11990758c7cab15d7ad9aa30 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
theFunction: math_FunctionSetWithDerivatives
theStartingPoint: math_Vector
theInfBound: math_Vector
theSupBound: math_Vector
theStopOnDivergent: bool (optional, default to Standard_False)

Return
-------
None

Description
-----------
Improves the root of function from the initial guess point. The infinum and supremum may be given to constrain the solution. In this case, the solution is found when: abs(Xi - Xi-1) <= Tolerance for all unknowns.
") Perform;
		void Perform(math_FunctionSetWithDerivatives & theFunction, const math_Vector & theStartingPoint, const math_Vector & theInfBound, const math_Vector & theSupBound, const Standard_Boolean theStopOnDivergent = Standard_False);

		/****** math_FunctionSetRoot::Root ******/
		/****** md5 signature: 467f474c854f954a53bf30f3d82b793e ******/
		%feature("compactdefaultargs") Root;
		%feature("autodoc", "Return
-------
math_Vector

Description
-----------
Returns the value of the root of function F. Exception NotDone is raised if the root was not found.
") Root;
		const math_Vector & Root();

		/****** math_FunctionSetRoot::Root ******/
		/****** md5 signature: a6e973993b4c58ebb2497c195b8005ce ******/
		%feature("compactdefaultargs") Root;
		%feature("autodoc", "
Parameters
----------
Root: math_Vector

Return
-------
None

Description
-----------
Outputs the root vector in Root. Exception NotDone is raised if the root was not found. Exception DimensionError is raised if the range of Root is not equal to the range of the StartingPoint.
") Root;
		void Root(math_Vector & Root);

		/****** math_FunctionSetRoot::SetTolerance ******/
		/****** md5 signature: 250dc0de55bf130c92f097c07324b042 ******/
		%feature("compactdefaultargs") SetTolerance;
		%feature("autodoc", "
Parameters
----------
Tolerance: math_Vector

Return
-------
None

Description
-----------
Initializes the tolerance values.
") SetTolerance;
		void SetTolerance(const math_Vector & Tolerance);

		/****** math_FunctionSetRoot::StateNumber ******/
		/****** md5 signature: f01709bfa944492be6fea9699946cca6 ******/
		%feature("compactdefaultargs") StateNumber;
		%feature("autodoc", "Return
-------
int

Description
-----------
returns the stateNumber (as returned by F.GetStateNumber()) associated to the root found.
") StateNumber;
		Standard_Integer StateNumber();

};


%extend math_FunctionSetRoot {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************
* class math_Gauss *
*******************/
class math_Gauss {
	public:
		/****** math_Gauss::math_Gauss ******/
		/****** md5 signature: 73ea5f1f86c396552a8862c45d31d1e4 ******/
		%feature("compactdefaultargs") math_Gauss;
		%feature("autodoc", "
Parameters
----------
A: math_Matrix
MinPivot: float (optional, default to 1.0e-20)
theProgress: Message_ProgressRange (optional, default to Message_ProgressRange())

Return
-------
None

Description
-----------
Given an input n X n matrix A this constructor performs its LU decomposition with partial pivoting (interchange of rows). This LU decomposition is stored internally and may be used to do subsequent calculation. If the largest pivot found is less than MinPivot the matrix A is considered as singular. Exception NotSquare is raised if A is not a square matrix.
") math_Gauss;
		 math_Gauss(const math_Matrix & A, const Standard_Real MinPivot = 1.0e-20, const Message_ProgressRange & theProgress = Message_ProgressRange());

		/****** math_Gauss::Determinant ******/
		/****** md5 signature: 5ac8cd01bd8c7b44a3e7395b4e2f6518 ******/
		%feature("compactdefaultargs") Determinant;
		%feature("autodoc", "Return
-------
float

Description
-----------
This routine returns the value of the determinant of the previously LU decomposed matrix A. Exception NotDone may be raised if the decomposition of A was not done successfully, zero is returned if the matrix A was considered as singular.
") Determinant;
		Standard_Real Determinant();

		/****** math_Gauss::Dump ******/
		/****** md5 signature: d37b43e0b2386dc096d5d707876db157 ******/
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

		/****** math_Gauss::Invert ******/
		/****** md5 signature: 3042934a9caa618d22aceb841b1bb048 ******/
		%feature("compactdefaultargs") Invert;
		%feature("autodoc", "
Parameters
----------
Inv: math_Matrix

Return
-------
None

Description
-----------
This routine outputs Inv the inverse of the previously LU decomposed matrix A. Exception DimensionError is raised if the ranges of B are not equal to the ranges of A.
") Invert;
		void Invert(math_Matrix & Inv);

		/****** math_Gauss::IsDone ******/
		/****** md5 signature: e385477ab1bec806154173d4a550fd68 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if the computations are successful, otherwise returns false.
") IsDone;
		Standard_Boolean IsDone();

		/****** math_Gauss::Solve ******/
		/****** md5 signature: ee147e7d65a116bd9db2ac0eb3018d6f ******/
		%feature("compactdefaultargs") Solve;
		%feature("autodoc", "
Parameters
----------
B: math_Vector
X: math_Vector

Return
-------
None

Description
-----------
Given the input Vector B this routine returns the solution X of the set of linear equations A . X = B. Exception NotDone is raised if the decomposition of A was not done successfully. Exception DimensionError is raised if the range of B is not equal to the number of rows of A.
") Solve;
		void Solve(const math_Vector & B, math_Vector & X);

		/****** math_Gauss::Solve ******/
		/****** md5 signature: ffb635af399b50012aab56eaf9ca4225 ******/
		%feature("compactdefaultargs") Solve;
		%feature("autodoc", "
Parameters
----------
B: math_Vector

Return
-------
None

Description
-----------
Given the input Vector B this routine solves the set of linear equations A . X = B. B is replaced by the vector solution X. Exception NotDone is raised if the decomposition of A was not done successfully. Exception DimensionError is raised if the range of B is not equal to the number of rows of A.
") Solve;
		void Solve(math_Vector & B);

};


%extend math_Gauss {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************
* class math_GaussLeastSquare *
******************************/
class math_GaussLeastSquare {
	public:
		/****** math_GaussLeastSquare::math_GaussLeastSquare ******/
		/****** md5 signature: f2803bab78676aba3ad0384c8579aa81 ******/
		%feature("compactdefaultargs") math_GaussLeastSquare;
		%feature("autodoc", "
Parameters
----------
A: math_Matrix
MinPivot: float (optional, default to 1.0e-20)

Return
-------
None

Description
-----------
Given an input n X m matrix A with n >= m this constructor performs the LU decomposition with partial pivoting (interchange of rows) of the matrix AA = A.Transposed() * A; This LU decomposition is stored internally and may be used to do subsequent calculation. If the largest pivot found is less than MinPivot the matrix <A> is considered as singular.
") math_GaussLeastSquare;
		 math_GaussLeastSquare(const math_Matrix & A, const Standard_Real MinPivot = 1.0e-20);

		/****** math_GaussLeastSquare::Dump ******/
		/****** md5 signature: d37b43e0b2386dc096d5d707876db157 ******/
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

		/****** math_GaussLeastSquare::IsDone ******/
		/****** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if the computations are successful, otherwise returns false.e.
") IsDone;
		Standard_Boolean IsDone();

		/****** math_GaussLeastSquare::Solve ******/
		/****** md5 signature: ee147e7d65a116bd9db2ac0eb3018d6f ******/
		%feature("compactdefaultargs") Solve;
		%feature("autodoc", "
Parameters
----------
B: math_Vector
X: math_Vector

Return
-------
None

Description
-----------
Given the input Vector <B> this routine solves the set of linear equations A . X = B. Exception NotDone is raised if the decomposition of A was not done successfully. Exception DimensionError is raised if the range of B Inv is not equal to the rowrange of A. Exception DimensionError is raised if the range of X Inv is not equal to the colrange of A.
") Solve;
		void Solve(const math_Vector & B, math_Vector & X);

};


%extend math_GaussLeastSquare {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************************
* class math_GaussMultipleIntegration *
**************************************/
class math_GaussMultipleIntegration {
	public:
		/****** math_GaussMultipleIntegration::math_GaussMultipleIntegration ******/
		/****** md5 signature: 70f32a9670faa17902d312aaf809dc84 ******/
		%feature("compactdefaultargs") math_GaussMultipleIntegration;
		%feature("autodoc", "
Parameters
----------
F: math_MultipleVarFunction
Lower: math_Vector
Upper: math_Vector
Order: math_IntegerVector

Return
-------
None

Description
-----------
The Gauss-Legendre integration with Order = points of integration for each unknown, is done on the function F between the bounds Lower and Upper.
") math_GaussMultipleIntegration;
		 math_GaussMultipleIntegration(math_MultipleVarFunction & F, const math_Vector & Lower, const math_Vector & Upper, const math_IntegerVector & Order);

		/****** math_GaussMultipleIntegration::Dump ******/
		/****** md5 signature: d37b43e0b2386dc096d5d707876db157 ******/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "
Parameters
----------

Return
-------
o: Standard_OStream

Description
-----------
Prints information on the current state of the object.
") Dump;
		void Dump(std::ostream &OutValue);

		/****** math_GaussMultipleIntegration::IsDone ******/
		/****** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
returns True if all has been correctly done.
") IsDone;
		Standard_Boolean IsDone();

		/****** math_GaussMultipleIntegration::Value ******/
		/****** md5 signature: 52655a2fb6642856b2c68a9331826787 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Return
-------
float

Description
-----------
returns the value of the integral.
") Value;
		Standard_Real Value();

};


%extend math_GaussMultipleIntegration {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************
* class math_GaussSetIntegration *
*********************************/
class math_GaussSetIntegration {
	public:
		/****** math_GaussSetIntegration::math_GaussSetIntegration ******/
		/****** md5 signature: ccc7194f05e1d20cdc9dff8f00019009 ******/
		%feature("compactdefaultargs") math_GaussSetIntegration;
		%feature("autodoc", "
Parameters
----------
F: math_FunctionSet
Lower: math_Vector
Upper: math_Vector
Order: math_IntegerVector

Return
-------
None

Description
-----------
The Gauss-Legendre integration with Order = points of integration for each unknown, is done on the function F between the bounds Lower and Upper.
") math_GaussSetIntegration;
		 math_GaussSetIntegration(math_FunctionSet & F, const math_Vector & Lower, const math_Vector & Upper, const math_IntegerVector & Order);

		/****** math_GaussSetIntegration::Dump ******/
		/****** md5 signature: d37b43e0b2386dc096d5d707876db157 ******/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "
Parameters
----------

Return
-------
o: Standard_OStream

Description
-----------
Prints information on the current state of the object.
") Dump;
		void Dump(std::ostream &OutValue);

		/****** math_GaussSetIntegration::IsDone ******/
		/****** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
returns True if all has been correctly done.
") IsDone;
		Standard_Boolean IsDone();

		/****** math_GaussSetIntegration::Value ******/
		/****** md5 signature: da451945ce62c2e97eedc01217c3028f ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Return
-------
math_Vector

Description
-----------
returns the value of the integral.
") Value;
		const math_Vector & Value();

};


%extend math_GaussSetIntegration {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************************
* class math_GaussSingleIntegration *
************************************/
class math_GaussSingleIntegration {
	public:
		/****** math_GaussSingleIntegration::math_GaussSingleIntegration ******/
		/****** md5 signature: 97916529d16b246659c2539c47b5f077 ******/
		%feature("compactdefaultargs") math_GaussSingleIntegration;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") math_GaussSingleIntegration;
		 math_GaussSingleIntegration();

		/****** math_GaussSingleIntegration::math_GaussSingleIntegration ******/
		/****** md5 signature: 51a1434ce735fb74c6227fcecf43d1e3 ******/
		%feature("compactdefaultargs") math_GaussSingleIntegration;
		%feature("autodoc", "
Parameters
----------
F: math_Function
Lower: float
Upper: float
Order: int

Return
-------
None

Description
-----------
The Gauss-Legendre integration with N = Order points of integration, is done on the function F between the bounds Lower and Upper.
") math_GaussSingleIntegration;
		 math_GaussSingleIntegration(math_Function & F, const Standard_Real Lower, const Standard_Real Upper, const Standard_Integer Order);

		/****** math_GaussSingleIntegration::math_GaussSingleIntegration ******/
		/****** md5 signature: 97b50fd948af172f5a0f143ab8773768 ******/
		%feature("compactdefaultargs") math_GaussSingleIntegration;
		%feature("autodoc", "
Parameters
----------
F: math_Function
Lower: float
Upper: float
Order: int
Tol: float

Return
-------
None

Description
-----------
The Gauss-Legendre integration with N = Order points of integration and given tolerance = Tol is done on the function F between the bounds Lower and Upper.
") math_GaussSingleIntegration;
		 math_GaussSingleIntegration(math_Function & F, const Standard_Real Lower, const Standard_Real Upper, const Standard_Integer Order, const Standard_Real Tol);

		/****** math_GaussSingleIntegration::Dump ******/
		/****** md5 signature: d37b43e0b2386dc096d5d707876db157 ******/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "
Parameters
----------

Return
-------
o: Standard_OStream

Description
-----------
Prints information on the current state of the object.
") Dump;
		void Dump(std::ostream &OutValue);

		/****** math_GaussSingleIntegration::IsDone ******/
		/****** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
returns True if all has been correctly done.
") IsDone;
		Standard_Boolean IsDone();

		/****** math_GaussSingleIntegration::Value ******/
		/****** md5 signature: 52655a2fb6642856b2c68a9331826787 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Return
-------
float

Description
-----------
returns the value of the integral.
") Value;
		Standard_Real Value();

};


%extend math_GaussSingleIntegration {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************
* class math_GlobOptMin *
************************/
class math_GlobOptMin {
	public:
		class NCollection_CellFilter_Inspector {};
		/****** math_GlobOptMin::math_GlobOptMin ******/
		/****** md5 signature: ca64c1e0567a10f058ead911634be37a ******/
		%feature("compactdefaultargs") math_GlobOptMin;
		%feature("autodoc", "
Parameters
----------
theFunc: math_MultipleVarFunction *
theLowerBorder: math_Vector
theUpperBorder: math_Vector
theC: float (optional, default to 9)
theDiscretizationTol: float (optional, default to 1.0e-2)
theSameTol: float (optional, default to 1.0e-7)

Return
-------
None

Description
-----------
Constructor. Perform method is not called from it. 
Parameter theFunc - objective functional. 
Parameter theLowerBorder - lower corner of the search box. 
Parameter theUpperBorder - upper corner of the search box. 
Parameter theC - Lipschitz constant. 
Parameter theDiscretizationTol - parameter space discretization tolerance. 
Parameter theSameTol - functional value space indifference tolerance.
") math_GlobOptMin;
		 math_GlobOptMin(math_MultipleVarFunction * theFunc, const math_Vector & theLowerBorder, const math_Vector & theUpperBorder, const Standard_Real theC = 9, const Standard_Real theDiscretizationTol = 1.0e-2, const Standard_Real theSameTol = 1.0e-7);

		/****** math_GlobOptMin::GetContinuity ******/
		/****** md5 signature: 8fc1a115d32e6c038011baa4542ce9ee ******/
		%feature("compactdefaultargs") GetContinuity;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") GetContinuity;
		Standard_Integer GetContinuity();

		/****** math_GlobOptMin::GetF ******/
		/****** md5 signature: e2d80181d22382966f76c2b7388843b5 ******/
		%feature("compactdefaultargs") GetF;
		%feature("autodoc", "Return
-------
float

Description
-----------
Get best functional value.
") GetF;
		Standard_Real GetF();

		/****** math_GlobOptMin::GetFunctionalMinimalValue ******/
		/****** md5 signature: 3fda6f005c0b7a9cc05bcc067e5af42a ******/
		%feature("compactdefaultargs") GetFunctionalMinimalValue;
		%feature("autodoc", "Return
-------
float

Description
-----------
No available documentation.
") GetFunctionalMinimalValue;
		Standard_Real GetFunctionalMinimalValue();

		/****** math_GlobOptMin::GetLipConstState ******/
		/****** md5 signature: c4288e61ff39bf6e928aa9d8e66b8b8e ******/
		%feature("compactdefaultargs") GetLipConstState;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") GetLipConstState;
		Standard_Boolean GetLipConstState();

		/****** math_GlobOptMin::GetTol ******/
		/****** md5 signature: 93891d3ae67f7376cfc9fdc8a29db359 ******/
		%feature("compactdefaultargs") GetTol;
		%feature("autodoc", "
Parameters
----------

Return
-------
theDiscretizationTol: float
theSameTol: float

Description
-----------
Method to get tolerances. 
Parameter theDiscretizationTol - parameter space discretization tolerance. 
Parameter theSameTol - functional value space indifference tolerance.
") GetTol;
		void GetTol(Standard_Real &OutValue, Standard_Real &OutValue);

		/****** math_GlobOptMin::NbExtrema ******/
		/****** md5 signature: 57a2ec9f9d1fe41ee91c407be12b9e2e ******/
		%feature("compactdefaultargs") NbExtrema;
		%feature("autodoc", "Return
-------
int

Description
-----------
Return count of global extremas.
") NbExtrema;
		Standard_Integer NbExtrema();

		/****** math_GlobOptMin::Perform ******/
		/****** md5 signature: 10db8f17c813777ba5d8d5249b5e8807 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
isFindSingleSolution: bool (optional, default to Standard_False)

Return
-------
None

Description
-----------
Parameter isFindSingleSolution - defines whether to find single solution or all solutions.
") Perform;
		void Perform(const Standard_Boolean isFindSingleSolution = Standard_False);

		/****** math_GlobOptMin::Points ******/
		/****** md5 signature: bee54730807c8349111572ee6d330ea8 ******/
		%feature("compactdefaultargs") Points;
		%feature("autodoc", "
Parameters
----------
theIndex: int
theSol: math_Vector

Return
-------
None

Description
-----------
Return solution theIndex, 1 <= theIndex <= NbExtrema.
") Points;
		void Points(const Standard_Integer theIndex, math_Vector & theSol);

		/****** math_GlobOptMin::SetContinuity ******/
		/****** md5 signature: 1f10150f24d207b042da65493c81cb45 ******/
		%feature("compactdefaultargs") SetContinuity;
		%feature("autodoc", "
Parameters
----------
theCont: int

Return
-------
None

Description
-----------
Set / Get continuity of local borders splits (0 ~ C0, 1 ~ C1, 2 ~ C2).
") SetContinuity;
		void SetContinuity(const Standard_Integer theCont);

		/****** math_GlobOptMin::SetFunctionalMinimalValue ******/
		/****** md5 signature: 29b24164c13be9e8a33b2433d137b35b ******/
		%feature("compactdefaultargs") SetFunctionalMinimalValue;
		%feature("autodoc", "
Parameters
----------
theMinimalValue: float

Return
-------
None

Description
-----------
Set / Get functional minimal value.
") SetFunctionalMinimalValue;
		void SetFunctionalMinimalValue(const Standard_Real theMinimalValue);

		/****** math_GlobOptMin::SetGlobalParams ******/
		/****** md5 signature: 1e821fc9cd49a39a8aa5598e35144696 ******/
		%feature("compactdefaultargs") SetGlobalParams;
		%feature("autodoc", "
Parameters
----------
theFunc: math_MultipleVarFunction *
theLowerBorder: math_Vector
theUpperBorder: math_Vector
theC: float (optional, default to 9)
theDiscretizationTol: float (optional, default to 1.0e-2)
theSameTol: float (optional, default to 1.0e-7)

Return
-------
None

Description
-----------
Parameter theFunc - objective functional. 
Parameter theLowerBorder - lower corner of the search box. 
Parameter theUpperBorder - upper corner of the search box. 
Parameter theC - Lipschitz constant. 
Parameter theDiscretizationTol - parameter space discretization tolerance. 
Parameter theSameTol - functional value space indifference tolerance.
") SetGlobalParams;
		void SetGlobalParams(math_MultipleVarFunction * theFunc, const math_Vector & theLowerBorder, const math_Vector & theUpperBorder, const Standard_Real theC = 9, const Standard_Real theDiscretizationTol = 1.0e-2, const Standard_Real theSameTol = 1.0e-7);

		/****** math_GlobOptMin::SetLipConstState ******/
		/****** md5 signature: 7d78882b77454ea2717bf8982269eba2 ******/
		%feature("compactdefaultargs") SetLipConstState;
		%feature("autodoc", "
Parameters
----------
theFlag: bool

Return
-------
None

Description
-----------
Set / Get Lipchitz constant modification state. True means that the constant is locked and unlocked otherwise.
") SetLipConstState;
		void SetLipConstState(const Standard_Boolean theFlag);

		/****** math_GlobOptMin::SetLocalParams ******/
		/****** md5 signature: 97018be93cbbbef470df3a2b89577642 ******/
		%feature("compactdefaultargs") SetLocalParams;
		%feature("autodoc", "
Parameters
----------
theLocalA: math_Vector
theLocalB: math_Vector

Return
-------
None

Description
-----------
Method to reduce bounding box. Perform will use this box. 
Parameter theLocalA - lower corner of the local box. 
Parameter theLocalB - upper corner of the local box.
") SetLocalParams;
		void SetLocalParams(const math_Vector & theLocalA, const math_Vector & theLocalB);

		/****** math_GlobOptMin::SetTol ******/
		/****** md5 signature: 098d9b82c9cd87d7fa9e6bc3f44418f3 ******/
		%feature("compactdefaultargs") SetTol;
		%feature("autodoc", "
Parameters
----------
theDiscretizationTol: float
theSameTol: float

Return
-------
None

Description
-----------
Method to set tolerances. 
Parameter theDiscretizationTol - parameter space discretization tolerance. 
Parameter theSameTol - functional value space indifference tolerance.
") SetTol;
		void SetTol(const Standard_Real theDiscretizationTol, const Standard_Real theSameTol);

		/****** math_GlobOptMin::isDone ******/
		/****** md5 signature: fbb42ba7dccdaf2fe81e0200c743c59b ******/
		%feature("compactdefaultargs") isDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Return computation state of the algorithm.
") isDone;
		Standard_Boolean isDone();

};


%extend math_GlobOptMin {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************
* class math_Householder *
*************************/
class math_Householder {
	public:
		/****** math_Householder::math_Householder ******/
		/****** md5 signature: 0977a727cabb6b46a670fe908eb1753f ******/
		%feature("compactdefaultargs") math_Householder;
		%feature("autodoc", "
Parameters
----------
A: math_Matrix
B: math_Matrix
EPS: float (optional, default to 1.0e-20)

Return
-------
None

Description
-----------
Given an input matrix A with n>= m, given an input matrix B this constructor performs the least square resolution of the set of linear equations A.X = B for each column of B. If a column norm is less than EPS, the resolution can't be done. Exception DimensionError is raised if the row number of B is different from the A row number.
") math_Householder;
		 math_Householder(const math_Matrix & A, const math_Matrix & B, const Standard_Real EPS = 1.0e-20);

		/****** math_Householder::math_Householder ******/
		/****** md5 signature: 6b08abf2667048b63bf62cc4cec6098a ******/
		%feature("compactdefaultargs") math_Householder;
		%feature("autodoc", "
Parameters
----------
A: math_Matrix
B: math_Matrix
lowerArow: int
upperArow: int
lowerAcol: int
upperAcol: int
EPS: float (optional, default to 1.0e-20)

Return
-------
None

Description
-----------
Given an input matrix A with n>= m, given an input matrix B this constructor performs the least square resolution of the set of linear equations A.X = B for each column of B. If a column norm is less than EPS, the resolution can't be done. Exception DimensionError is raised if the row number of B is different from the A row number.
") math_Householder;
		 math_Householder(const math_Matrix & A, const math_Matrix & B, const Standard_Integer lowerArow, const Standard_Integer upperArow, const Standard_Integer lowerAcol, const Standard_Integer upperAcol, const Standard_Real EPS = 1.0e-20);

		/****** math_Householder::math_Householder ******/
		/****** md5 signature: 31207a701d238011e64bcf4e903940ce ******/
		%feature("compactdefaultargs") math_Householder;
		%feature("autodoc", "
Parameters
----------
A: math_Matrix
B: math_Vector
EPS: float (optional, default to 1.0e-20)

Return
-------
None

Description
-----------
Given an input matrix A with n>= m, given an input vector B this constructor performs the least square resolution of the set of linear equations A.X = B. If a column norm is less than EPS, the resolution can't be done. Exception DimensionError is raised if the length of B is different from the A row number.
") math_Householder;
		 math_Householder(const math_Matrix & A, const math_Vector & B, const Standard_Real EPS = 1.0e-20);

		/****** math_Householder::AllValues ******/
		/****** md5 signature: 85ad23fce3cb1532a0b9d97b8d567ff9 ******/
		%feature("compactdefaultargs") AllValues;
		%feature("autodoc", "Return
-------
math_Matrix

Description
-----------
Returns the matrix sol of all the solutions of the system A.X = B. Exception NotDone is raised is the resolution has not be done.
") AllValues;
		const math_Matrix & AllValues();

		/****** math_Householder::Dump ******/
		/****** md5 signature: d37b43e0b2386dc096d5d707876db157 ******/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "
Parameters
----------

Return
-------
o: Standard_OStream

Description
-----------
Prints information on the current state of the object.
") Dump;
		void Dump(std::ostream &OutValue);

		/****** math_Householder::IsDone ******/
		/****** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if the computations are successful, otherwise returns false.
") IsDone;
		Standard_Boolean IsDone();

		/****** math_Householder::Value ******/
		/****** md5 signature: 2cffcf970207b968b9176f9228ed9f20 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
sol: math_Vector
Index: int (optional, default to 1)

Return
-------
None

Description
-----------
Given the integer Index, this routine returns the corresponding least square solution sol. Exception NotDone is raised if the resolution has not be done. Exception OutOfRange is raised if Index <=0 or Index is more than the number of columns of B.
") Value;
		void Value(math_Vector & sol, const Standard_Integer Index = 1);

};


%extend math_Householder {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************
* class math_Jacobi *
********************/
class math_Jacobi {
	public:
		/****** math_Jacobi::math_Jacobi ******/
		/****** md5 signature: dbe9c44ec68782c2201b136544699648 ******/
		%feature("compactdefaultargs") math_Jacobi;
		%feature("autodoc", "
Parameters
----------
A: math_Matrix

Return
-------
None

Description
-----------
Given a Real n X n matrix A, this constructor computes all its eigenvalues and eigenvectors using the Jacobi method. The exception NotSquare is raised if the matrix is not square. No verification that the matrix A is really symmetric is done.
") math_Jacobi;
		 math_Jacobi(const math_Matrix & A);

		/****** math_Jacobi::Dump ******/
		/****** md5 signature: d37b43e0b2386dc096d5d707876db157 ******/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "
Parameters
----------

Return
-------
o: Standard_OStream

Description
-----------
Prints information on the current state of the object. Is used to redefine the operator <<.
") Dump;
		void Dump(std::ostream &OutValue);

		/****** math_Jacobi::IsDone ******/
		/****** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if the computations are successful, otherwise returns false.
") IsDone;
		Standard_Boolean IsDone();

		/****** math_Jacobi::Value ******/
		/****** md5 signature: 53bb8972bd4da05157e4a1056aa328d4 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
Num: int

Return
-------
float

Description
-----------
returns the eigenvalue number Num. Eigenvalues are in the range (1..n). Exception NotDone is raised if calculation is not done successfully.
") Value;
		Standard_Real Value(const Standard_Integer Num);

		/****** math_Jacobi::Values ******/
		/****** md5 signature: 1f3e7a703e9049ee2a39cf978bc23008 ******/
		%feature("compactdefaultargs") Values;
		%feature("autodoc", "Return
-------
math_Vector

Description
-----------
Returns the eigenvalues vector. Exception NotDone is raised if calculation is not done successfully.
") Values;
		const math_Vector & Values();

		/****** math_Jacobi::Vector ******/
		/****** md5 signature: 9be1949a91bcbaff6496d57366bfbce6 ******/
		%feature("compactdefaultargs") Vector;
		%feature("autodoc", "
Parameters
----------
Num: int
V: math_Vector

Return
-------
None

Description
-----------
Returns the eigenvector V of number Num. Eigenvectors are in the range (1..n). Exception NotDone is raised if calculation is not done successfully.
") Vector;
		void Vector(const Standard_Integer Num, math_Vector & V);

		/****** math_Jacobi::Vectors ******/
		/****** md5 signature: bc7346809ab0765e767d728f947796ab ******/
		%feature("compactdefaultargs") Vectors;
		%feature("autodoc", "Return
-------
math_Matrix

Description
-----------
returns the eigenvectors matrix. Exception NotDone is raised if calculation is not done successfully.
") Vectors;
		const math_Matrix & Vectors();

};


%extend math_Jacobi {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************************
* class math_KronrodSingleIntegration *
**************************************/
class math_KronrodSingleIntegration {
	public:
		/****** math_KronrodSingleIntegration::math_KronrodSingleIntegration ******/
		/****** md5 signature: 6c28c1aa6ae7385685203db01214f7bb ******/
		%feature("compactdefaultargs") math_KronrodSingleIntegration;
		%feature("autodoc", "Return
-------
None

Description
-----------
An empty constructor.
") math_KronrodSingleIntegration;
		 math_KronrodSingleIntegration();

		/****** math_KronrodSingleIntegration::math_KronrodSingleIntegration ******/
		/****** md5 signature: a66c4825bcfe0bf8105de9a70846a04e ******/
		%feature("compactdefaultargs") math_KronrodSingleIntegration;
		%feature("autodoc", "
Parameters
----------
theFunction: math_Function
theLower: float
theUpper: float
theNbPnts: int

Return
-------
None

Description
-----------
Constructor. Takes the function, the lower and upper bound values, the initial number of Kronrod points.
") math_KronrodSingleIntegration;
		 math_KronrodSingleIntegration(math_Function & theFunction, const Standard_Real theLower, const Standard_Real theUpper, const Standard_Integer theNbPnts);

		/****** math_KronrodSingleIntegration::math_KronrodSingleIntegration ******/
		/****** md5 signature: 1264541d674ab723d8959b4f0f38f3d6 ******/
		%feature("compactdefaultargs") math_KronrodSingleIntegration;
		%feature("autodoc", "
Parameters
----------
theFunction: math_Function
theLower: float
theUpper: float
theNbPnts: int
theTolerance: float
theMaxNbIter: int

Return
-------
None

Description
-----------
Constructor. Takes the function, the lower and upper bound values, the initial number of Kronrod points, the tolerance value and the maximal number of iterations as parameters.
") math_KronrodSingleIntegration;
		 math_KronrodSingleIntegration(math_Function & theFunction, const Standard_Real theLower, const Standard_Real theUpper, const Standard_Integer theNbPnts, const Standard_Real theTolerance, const Standard_Integer theMaxNbIter);

		/****** math_KronrodSingleIntegration::AbsolutError ******/
		/****** md5 signature: 12eadedd827c6f2cfdee466e4014e7d9 ******/
		%feature("compactdefaultargs") AbsolutError;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the value of the relative error reached.
") AbsolutError;
		Standard_Real AbsolutError();

		/****** math_KronrodSingleIntegration::ErrorReached ******/
		/****** md5 signature: a07cf8273fa0f4cf4aae707ac80776ec ******/
		%feature("compactdefaultargs") ErrorReached;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the value of the relative error reached.
") ErrorReached;
		Standard_Real ErrorReached();

		/****** math_KronrodSingleIntegration::GKRule ******/
		/****** md5 signature: 61b8d48e5fac2843be361258297f0961 ******/
		%feature("compactdefaultargs") GKRule;
		%feature("autodoc", "
Parameters
----------
theFunction: math_Function
theLower: float
theUpper: float
theGaussP: math_Vector
theGaussW: math_Vector
theKronrodP: math_Vector
theKronrodW: math_Vector

Return
-------
theValue: float
theError: float

Description
-----------
No available documentation.
") GKRule;
		static Standard_Boolean GKRule(math_Function & theFunction, const Standard_Real theLower, const Standard_Real theUpper, const math_Vector & theGaussP, const math_Vector & theGaussW, const math_Vector & theKronrodP, const math_Vector & theKronrodW, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** math_KronrodSingleIntegration::IsDone ******/
		/****** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns Standard_True if computation is performed successfully.
") IsDone;
		Standard_Boolean IsDone();

		/****** math_KronrodSingleIntegration::NbIterReached ******/
		/****** md5 signature: 92f9acbb3ab54b8a9084b8719f071226 ******/
		%feature("compactdefaultargs") NbIterReached;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of iterations that were made to compute result.
") NbIterReached;
		Standard_Integer NbIterReached();

		/****** math_KronrodSingleIntegration::OrderReached ******/
		/****** md5 signature: 3f413ca7400668120c788e0d2f9e7a27 ******/
		%feature("compactdefaultargs") OrderReached;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of Kronrod points for which the result is computed.
") OrderReached;
		Standard_Integer OrderReached();

		/****** math_KronrodSingleIntegration::Perform ******/
		/****** md5 signature: 989ad1288ab87ac0016e952911251bca ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
theFunction: math_Function
theLower: float
theUpper: float
theNbPnts: int

Return
-------
None

Description
-----------
Computation of the integral. Takes the function, the lower and upper bound values, the initial number of Kronrod points, the relative tolerance value and the maximal number of iterations as parameters. theNbPnts should be odd and greater then or equal to 3.
") Perform;
		void Perform(math_Function & theFunction, const Standard_Real theLower, const Standard_Real theUpper, const Standard_Integer theNbPnts);

		/****** math_KronrodSingleIntegration::Perform ******/
		/****** md5 signature: 6a268e5eb0ffc5edb0663c67fce729e1 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
theFunction: math_Function
theLower: float
theUpper: float
theNbPnts: int
theTolerance: float
theMaxNbIter: int

Return
-------
None

Description
-----------
Computation of the integral. Takes the function, the lower and upper bound values, the initial number of Kronrod points, the relative tolerance value and the maximal number of iterations as parameters. theNbPnts should be odd and greater then or equal to 3. Note that theTolerance is relative, i.e. the criterion of solution reaching is: Abs(Kronrod - Gauss)/Abs(Kronrod) < theTolerance. theTolerance should be positive.
") Perform;
		void Perform(math_Function & theFunction, const Standard_Real theLower, const Standard_Real theUpper, const Standard_Integer theNbPnts, const Standard_Real theTolerance, const Standard_Integer theMaxNbIter);

		/****** math_KronrodSingleIntegration::Value ******/
		/****** md5 signature: 52655a2fb6642856b2c68a9331826787 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the value of the integral.
") Value;
		Standard_Real Value();

};


%extend math_KronrodSingleIntegration {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************
* class math_Matrix *
********************/
class math_Matrix {
	public:
		/****** math_Matrix::math_Matrix ******/
		/****** md5 signature: e6c257a1326c79f05d592f14f249809c ******/
		%feature("compactdefaultargs") math_Matrix;
		%feature("autodoc", "
Parameters
----------
LowerRow: int
UpperRow: int
LowerCol: int
UpperCol: int

Return
-------
None

Description
-----------
Constructs a non-initialized matrix of range [LowerRow..UpperRow, LowerCol..UpperCol] For the constructed matrix: - LowerRow and UpperRow are the indexes of the lower and upper bounds of a row, and - LowerCol and UpperCol are the indexes of the lower and upper bounds of a column.
") math_Matrix;
		 math_Matrix(const Standard_Integer LowerRow, const Standard_Integer UpperRow, const Standard_Integer LowerCol, const Standard_Integer UpperCol);

		/****** math_Matrix::math_Matrix ******/
		/****** md5 signature: 2e3ba9a1a05f36775951a59cfae5bccc ******/
		%feature("compactdefaultargs") math_Matrix;
		%feature("autodoc", "
Parameters
----------
LowerRow: int
UpperRow: int
LowerCol: int
UpperCol: int
InitialValue: float

Return
-------
None

Description
-----------
constructs a non-initialized matrix of range [LowerRow..UpperRow, LowerCol..UpperCol] whose values are all initialized with the value InitialValue.
") math_Matrix;
		 math_Matrix(const Standard_Integer LowerRow, const Standard_Integer UpperRow, const Standard_Integer LowerCol, const Standard_Integer UpperCol, const Standard_Real InitialValue);

		/****** math_Matrix::math_Matrix ******/
		/****** md5 signature: 9f8c3bd86fe8da9d6d6b64eab3dff60b ******/
		%feature("compactdefaultargs") math_Matrix;
		%feature("autodoc", "
Parameters
----------
Tab: Standard_Address
LowerRow: int
UpperRow: int
LowerCol: int
UpperCol: int

Return
-------
None

Description
-----------
constructs a matrix of range [LowerRow..UpperRow, LowerCol..UpperCol] Sharing data with a 'C array' pointed by Tab.
") math_Matrix;
		 math_Matrix(const Standard_Address Tab, const Standard_Integer LowerRow, const Standard_Integer UpperRow, const Standard_Integer LowerCol, const Standard_Integer UpperCol);

		/****** math_Matrix::math_Matrix ******/
		/****** md5 signature: c9b9654b93f2e87132a71fd62bf87827 ******/
		%feature("compactdefaultargs") math_Matrix;
		%feature("autodoc", "
Parameters
----------
Other: math_Matrix

Return
-------
None

Description
-----------
constructs a matrix for copy in initialization. An exception is raised if the matrixes have not the same dimensions.
") math_Matrix;
		 math_Matrix(const math_Matrix & Other);

		/****** math_Matrix::Add ******/
		/****** md5 signature: f63e613c825158d23dec52e65c62c754 ******/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
Right: math_Matrix

Return
-------
None

Description
-----------
adds the matrix <Right> to a matrix. An exception is raised if the dimensions are different. Warning In order to save time when copying matrices, it is preferable to use operator += or the function Add whenever possible.
") Add;
		void Add(const math_Matrix & Right);

		/****** math_Matrix::Add ******/
		/****** md5 signature: 3c03201502470f5e631695a6b502c51f ******/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
Left: math_Matrix
Right: math_Matrix

Return
-------
None

Description
-----------
sets a matrix to the addition of <Left> and <Right>. An exception is raised if the dimensions are different.
") Add;
		void Add(const math_Matrix & Left, const math_Matrix & Right);

		/****** math_Matrix::Added ******/
		/****** md5 signature: 62864dd8ca25f20a23a9d9397c81b927 ******/
		%feature("compactdefaultargs") Added;
		%feature("autodoc", "
Parameters
----------
Right: math_Matrix

Return
-------
math_Matrix

Description
-----------
adds the matrix <Right> to a matrix. An exception is raised if the dimensions are different.
") Added;
		math_Matrix Added(const math_Matrix & Right);

		/****** math_Matrix::Col ******/
		/****** md5 signature: b15846fb1b6a2c6ec09ca6168bece890 ******/
		%feature("compactdefaultargs") Col;
		%feature("autodoc", "
Parameters
----------
Col: int

Return
-------
math_VectorBase<>

Description
-----------
Returns the column of index <Col> of a matrix.
") Col;
		math_VectorBase<> Col(const Standard_Integer Col);

		/****** math_Matrix::ColNumber ******/
		/****** md5 signature: 882aa03dc37daf0f801ae41010e2da38 ******/
		%feature("compactdefaultargs") ColNumber;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of rows of this matrix. Note that for a matrix A you always have the following relations: - A.RowNumber() = A.UpperRow() - A.LowerRow() + 1 - A.ColNumber() = A.UpperCol() - A.LowerCol() + 1 - the length of a row of A is equal to the number of columns of A, - the length of a column of A is equal to the number of rows of A.returns the row range of a matrix.
") ColNumber;
		Standard_Integer ColNumber();

		/****** math_Matrix::Determinant ******/
		/****** md5 signature: 5ac8cd01bd8c7b44a3e7395b4e2f6518 ******/
		%feature("compactdefaultargs") Determinant;
		%feature("autodoc", "Return
-------
float

Description
-----------
Computes the determinant of a matrix. An exception is raised if the matrix is not a square matrix.
") Determinant;
		Standard_Real Determinant();

		/****** math_Matrix::Divide ******/
		/****** md5 signature: e99b8d923ead06b4e09fb05a953ab970 ******/
		%feature("compactdefaultargs") Divide;
		%feature("autodoc", "
Parameters
----------
Right: float

Return
-------
None

Description
-----------
divides all the elements of a matrix by the value <Right>. An exception is raised if <Right> = 0.
") Divide;
		void Divide(const Standard_Real Right);

		/****** math_Matrix::Divided ******/
		/****** md5 signature: 80da7af5d5ad686bdccea67e378cdef5 ******/
		%feature("compactdefaultargs") Divided;
		%feature("autodoc", "
Parameters
----------
Right: float

Return
-------
math_Matrix

Description
-----------
divides all the elements of a matrix by the value <Right>. An exception is raised if <Right> = 0.
") Divided;
		math_Matrix Divided(const Standard_Real Right);

		/****** math_Matrix::Dump ******/
		/****** md5 signature: d37b43e0b2386dc096d5d707876db157 ******/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "
Parameters
----------

Return
-------
o: Standard_OStream

Description
-----------
Prints information on the current state of the object. Is used to redefine the operator <<.
") Dump;
		void Dump(std::ostream &OutValue);

		/****** math_Matrix::Init ******/
		/****** md5 signature: 6aef026ef1fcb18a844e723ac935cd4b ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
InitialValue: float

Return
-------
None

Description
-----------
Initialize all the elements of a matrix to InitialValue.
") Init;
		void Init(const Standard_Real InitialValue);

		/****** math_Matrix::Initialized ******/
		/****** md5 signature: aa19c52ca7ffa72391b02d4d20747655 ******/
		%feature("compactdefaultargs") Initialized;
		%feature("autodoc", "
Parameters
----------
Other: math_Matrix

Return
-------
math_Matrix

Description
-----------
Matrixes are copied through assignment. An exception is raised if the dimensions are different.
") Initialized;
		math_Matrix & Initialized(const math_Matrix & Other);

		/****** math_Matrix::Inverse ******/
		/****** md5 signature: 3d871314de3df1e3c9068e85ee518e52 ******/
		%feature("compactdefaultargs") Inverse;
		%feature("autodoc", "Return
-------
math_Matrix

Description
-----------
Returns the inverse of a matrix. Exception NotSquare is raised if the matrix is not square. Exception SingularMatrix is raised if the matrix is singular.
") Inverse;
		math_Matrix Inverse();

		/****** math_Matrix::Invert ******/
		/****** md5 signature: 980f166f600d23a8c77565829af2eeff ******/
		%feature("compactdefaultargs") Invert;
		%feature("autodoc", "Return
-------
None

Description
-----------
Inverts a matrix using Gauss algorithm. Exception NotSquare is raised if the matrix is not square. Exception SingularMatrix is raised if the matrix is singular.
") Invert;
		void Invert();

		/****** math_Matrix::LowerCol ******/
		/****** md5 signature: 4c2a41c02b1ff4c33920db1e311c338b ******/
		%feature("compactdefaultargs") LowerCol;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the value of the Lower index of the column range of a matrix.
") LowerCol;
		Standard_Integer LowerCol();

		/****** math_Matrix::LowerRow ******/
		/****** md5 signature: 9ef9e3c2b8df37b89b31fc7702cbfb15 ******/
		%feature("compactdefaultargs") LowerRow;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the value of the Lower index of the row range of a matrix.
") LowerRow;
		Standard_Integer LowerRow();

		/****** math_Matrix::Multiplied ******/
		/****** md5 signature: f803a3d07f6f5abb1363c72949c30611 ******/
		%feature("compactdefaultargs") Multiplied;
		%feature("autodoc", "
Parameters
----------
Right: float

Return
-------
math_Matrix

Description
-----------
multiplies all the elements of a matrix by the value <Right>.
") Multiplied;
		math_Matrix Multiplied(const Standard_Real Right);

		/****** math_Matrix::Multiplied ******/
		/****** md5 signature: 3de6fa529aceeb63c22334e7f62681cb ******/
		%feature("compactdefaultargs") Multiplied;
		%feature("autodoc", "
Parameters
----------
Right: math_Matrix

Return
-------
math_Matrix

Description
-----------
Returns the product of 2 matrices. An exception is raised if the dimensions are different.
") Multiplied;
		math_Matrix Multiplied(const math_Matrix & Right);

		/****** math_Matrix::Multiplied ******/
		/****** md5 signature: b4056adc3e5c0bf27ded58aa21ef6614 ******/
		%feature("compactdefaultargs") Multiplied;
		%feature("autodoc", "
Parameters
----------
Right: math_VectorBase<>

Return
-------
math_VectorBase<>

Description
-----------
Returns the product of a matrix by a vector. An exception is raised if the dimensions are different.
") Multiplied;
		math_VectorBase<> Multiplied(const math_VectorBase<> & Right);

		/****** math_Matrix::Multiply ******/
		/****** md5 signature: 5ee084e97968bb7d941b7910877f1660 ******/
		%feature("compactdefaultargs") Multiply;
		%feature("autodoc", "
Parameters
----------
Right: float

Return
-------
None

Description
-----------
Sets this matrix to the product of the matrix Left, and the matrix Right. Example math_Matrix A (1, 3, 1, 3); math_Matrix B (1, 3, 1, 3); // A = ... , B = ... math_Matrix C (1, 3, 1, 3); C.Multiply(A, B); Exceptions Standard_DimensionError if matrices are of incompatible dimensions, i.e. if: - the number of columns of matrix Left, or the number of rows of matrix TLeft is not equal to the number of rows of matrix Right, or - the number of rows of matrix Left, or the number of columns of matrix TLeft is not equal to the number of rows of this matrix, or - the number of columns of matrix Right is not equal to the number of columns of this matrix.
") Multiply;
		void Multiply(const Standard_Real Right);

		/****** math_Matrix::Multiply ******/
		/****** md5 signature: d757e89d1f4c06521af7618e8d61d820 ******/
		%feature("compactdefaultargs") Multiply;
		%feature("autodoc", "
Parameters
----------
Left: math_VectorBase<>
Right: math_VectorBase<>

Return
-------
None

Description
-----------
Computes a matrix as the product of 2 vectors. An exception is raised if the dimensions are different. <self> = <Left> * <Right>.
") Multiply;
		void Multiply(const math_VectorBase<> & Left, const math_VectorBase<> & Right);

		/****** math_Matrix::Multiply ******/
		/****** md5 signature: a18f56da5b6c06519b2e3307243df1fb ******/
		%feature("compactdefaultargs") Multiply;
		%feature("autodoc", "
Parameters
----------
Left: math_Matrix
Right: math_Matrix

Return
-------
None

Description
-----------
Computes a matrix as the product of 2 matrixes. An exception is raised if the dimensions are different.
") Multiply;
		void Multiply(const math_Matrix & Left, const math_Matrix & Right);

		/****** math_Matrix::Multiply ******/
		/****** md5 signature: 4887d31c871b6222fda620adc6ad11af ******/
		%feature("compactdefaultargs") Multiply;
		%feature("autodoc", "
Parameters
----------
Right: math_Matrix

Return
-------
None

Description
-----------
Returns the product of 2 matrices. An exception is raised if the dimensions are different.
") Multiply;
		void Multiply(const math_Matrix & Right);

		/****** math_Matrix::Opposite ******/
		/****** md5 signature: d64b136dfbe29f763b0dd75f4193688f ******/
		%feature("compactdefaultargs") Opposite;
		%feature("autodoc", "Return
-------
math_Matrix

Description
-----------
Returns the opposite of a matrix. An exception is raised if the dimensions are different.
") Opposite;
		math_Matrix Opposite();

		/****** math_Matrix::Row ******/
		/****** md5 signature: 31d2c0c130b883eeacb01ccac9c5e91f ******/
		%feature("compactdefaultargs") Row;
		%feature("autodoc", "
Parameters
----------
Row: int

Return
-------
math_VectorBase<>

Description
-----------
Returns the row of index Row of a matrix.
") Row;
		math_VectorBase<> Row(const Standard_Integer Row);

		/****** math_Matrix::RowNumber ******/
		/****** md5 signature: de7ecc828bda324cd39ec9c186cfcef4 ******/
		%feature("compactdefaultargs") RowNumber;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of rows of this matrix. Note that for a matrix A you always have the following relations: - A.RowNumber() = A.UpperRow() - A.LowerRow() + 1 - A.ColNumber() = A.UpperCol() - A.LowerCol() + 1 - the length of a row of A is equal to the number of columns of A, - the length of a column of A is equal to the number of rows of A.returns the row range of a matrix.
") RowNumber;
		Standard_Integer RowNumber();

		/****** math_Matrix::Set ******/
		/****** md5 signature: afc74df81c6a660ac88469cf2c7645c4 ******/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
I1: int
I2: int
J1: int
J2: int
M: math_Matrix

Return
-------
None

Description
-----------
Sets the values of this matrix, - from index I1 to index I2 on the row dimension, and - from index J1 to index J2 on the column dimension, to those of matrix M. Exceptions Standard_DimensionError if: - I1 is less than the index of the lower row bound of this matrix, or - I2 is greater than the index of the upper row bound of this matrix, or - J1 is less than the index of the lower column bound of this matrix, or - J2 is greater than the index of the upper column bound of this matrix, or - I2 - I1 + 1 is not equal to the number of rows of matrix M, or - J2 - J1 + 1 is not equal to the number of columns of matrix M.
") Set;
		void Set(const Standard_Integer I1, const Standard_Integer I2, const Standard_Integer J1, const Standard_Integer J2, const math_Matrix & M);

		/****** math_Matrix::SetCol ******/
		/****** md5 signature: b5eace4866b0933fa40ccb4cf957535b ******/
		%feature("compactdefaultargs") SetCol;
		%feature("autodoc", "
Parameters
----------
Col: int
V: math_VectorBase<>

Return
-------
None

Description
-----------
Sets the column of index Col of a matrix to the vector <V>. An exception is raised if the dimensions are different. An exception is raises if <Col> is inferior to the lower column of the matrix or <Col> is superior to the upper column.
") SetCol;
		void SetCol(const Standard_Integer Col, const math_VectorBase<> & V);

		/****** math_Matrix::SetDiag ******/
		/****** md5 signature: b58618439e80c58e9a1a8322d9250ac3 ******/
		%feature("compactdefaultargs") SetDiag;
		%feature("autodoc", "
Parameters
----------
Value: float

Return
-------
None

Description
-----------
Sets the diagonal of a matrix to the value <Value>. An exception is raised if the matrix is not square.
") SetDiag;
		void SetDiag(const Standard_Real Value);

		/****** math_Matrix::SetRow ******/
		/****** md5 signature: 2ae66ea842007fa5172475960bd4693f ******/
		%feature("compactdefaultargs") SetRow;
		%feature("autodoc", "
Parameters
----------
Row: int
V: math_VectorBase<>

Return
-------
None

Description
-----------
Sets the row of index Row of a matrix to the vector <V>. An exception is raised if the dimensions are different. An exception is raises if <Row> is inferior to the lower row of the matrix or <Row> is superior to the upper row.
") SetRow;
		void SetRow(const Standard_Integer Row, const math_VectorBase<> & V);

		/****** math_Matrix::Subtract ******/
		/****** md5 signature: 57225649e8bf41e040f2022e6ddd9393 ******/
		%feature("compactdefaultargs") Subtract;
		%feature("autodoc", "
Parameters
----------
Right: math_Matrix

Return
-------
None

Description
-----------
Subtracts the matrix <Right> from <self>. An exception is raised if the dimensions are different. Warning In order to avoid time-consuming copying of matrices, it is preferable to use operator -= or the function Subtract whenever possible.
") Subtract;
		void Subtract(const math_Matrix & Right);

		/****** math_Matrix::Subtract ******/
		/****** md5 signature: 6dc59a1d8237c700094c97827f937e9a ******/
		%feature("compactdefaultargs") Subtract;
		%feature("autodoc", "
Parameters
----------
Left: math_Matrix
Right: math_Matrix

Return
-------
None

Description
-----------
Sets a matrix to the Subtraction of the matrix <Right> from the matrix <Left>. An exception is raised if the dimensions are different.
") Subtract;
		void Subtract(const math_Matrix & Left, const math_Matrix & Right);

		/****** math_Matrix::Subtracted ******/
		/****** md5 signature: 1c7b865b38ba73875bfcca9e64263fbe ******/
		%feature("compactdefaultargs") Subtracted;
		%feature("autodoc", "
Parameters
----------
Right: math_Matrix

Return
-------
math_Matrix

Description
-----------
Returns the result of the subtraction of <Right> from <self>. An exception is raised if the dimensions are different.
") Subtracted;
		math_Matrix Subtracted(const math_Matrix & Right);

		/****** math_Matrix::SwapCol ******/
		/****** md5 signature: 695fc375e2866be90db8ba670587a8a6 ******/
		%feature("compactdefaultargs") SwapCol;
		%feature("autodoc", "
Parameters
----------
Col1: int
Col2: int

Return
-------
None

Description
-----------
Swaps the columns of index <Col1> and <Col2>. An exception is raised if <Col1> or <Col2> is out of range.
") SwapCol;
		void SwapCol(const Standard_Integer Col1, const Standard_Integer Col2);

		/****** math_Matrix::SwapRow ******/
		/****** md5 signature: 3d6847fdc6234f7cf4d74bcfc2394511 ******/
		%feature("compactdefaultargs") SwapRow;
		%feature("autodoc", "
Parameters
----------
Row1: int
Row2: int

Return
-------
None

Description
-----------
Swaps the rows of index Row1 and Row2. An exception is raised if <Row1> or <Row2> is out of range.
") SwapRow;
		void SwapRow(const Standard_Integer Row1, const Standard_Integer Row2);

		/****** math_Matrix::TMultiplied ******/
		/****** md5 signature: 6734da006117430718ea39422d9c8295 ******/
		%feature("compactdefaultargs") TMultiplied;
		%feature("autodoc", "
Parameters
----------
Right: float

Return
-------
math_Matrix

Description
-----------
Sets this matrix to the product of the transposed matrix TLeft, and the matrix Right. Example math_Matrix A (1, 3, 1, 3); math_Matrix B (1, 3, 1, 3); // A = ... , B = ... math_Matrix C (1, 3, 1, 3); C.Multiply(A, B); Exceptions Standard_DimensionError if matrices are of incompatible dimensions, i.e. if: - the number of columns of matrix Left, or the number of rows of matrix TLeft is not equal to the number of rows of matrix Right, or - the number of rows of matrix Left, or the number of columns of matrix TLeft is not equal to the number of rows of this matrix, or - the number of columns of matrix Right is not equal to the number of columns of this matrix.
") TMultiplied;
		math_Matrix TMultiplied(const Standard_Real Right);

		/****** math_Matrix::TMultiply ******/
		/****** md5 signature: da28cb0adee88390ab8e0de9ae52879b ******/
		%feature("compactdefaultargs") TMultiply;
		%feature("autodoc", "
Parameters
----------
Right: math_Matrix

Return
-------
math_Matrix

Description
-----------
Returns the product of the transpose of a matrix with the matrix <Right>. An exception is raised if the dimensions are different.
") TMultiply;
		math_Matrix TMultiply(const math_Matrix & Right);

		/****** math_Matrix::TMultiply ******/
		/****** md5 signature: 2210b40e1b8db02f71e11cd9d230547e ******/
		%feature("compactdefaultargs") TMultiply;
		%feature("autodoc", "
Parameters
----------
TLeft: math_Matrix
Right: math_Matrix

Return
-------
None

Description
-----------
Computes a matrix to the product of the transpose of the matrix <TLeft> with the matrix <Right>. An exception is raised if the dimensions are different.
") TMultiply;
		void TMultiply(const math_Matrix & TLeft, const math_Matrix & Right);

		/****** math_Matrix::Transpose ******/
		/****** md5 signature: 70e27025c56428cd3bbca609f0f0cfbd ******/
		%feature("compactdefaultargs") Transpose;
		%feature("autodoc", "Return
-------
None

Description
-----------
Transposes a given matrix. An exception is raised if the matrix is not a square matrix.
") Transpose;
		void Transpose();

		/****** math_Matrix::Transposed ******/
		/****** md5 signature: f93a0b9293ece867193dfa5c1e4d1e3b ******/
		%feature("compactdefaultargs") Transposed;
		%feature("autodoc", "Return
-------
math_Matrix

Description
-----------
Teturns the transposed of a matrix. An exception is raised if the matrix is not a square matrix.
") Transposed;
		math_Matrix Transposed();

		/****** math_Matrix::UpperCol ******/
		/****** md5 signature: 27fb568327f7fec9e573bed9b0afa9ac ******/
		%feature("compactdefaultargs") UpperCol;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the value of the upper index of the column range of a matrix.
") UpperCol;
		Standard_Integer UpperCol();

		/****** math_Matrix::UpperRow ******/
		/****** md5 signature: d1af30a15a728feb822efd58349a197c ******/
		%feature("compactdefaultargs") UpperRow;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the Upper index of the row range of a matrix.
") UpperRow;
		Standard_Integer UpperRow();


        %feature("autodoc","1");
        %extend {
            Standard_Real GetValue(const Standard_Integer Row,const Standard_Integer Col) {
            return (Standard_Real) $self->Value(Row,Col);
            }
        };
        %feature("autodoc","1");
        %extend {
            void SetValue(const Standard_Integer Row,const Standard_Integer Col,Standard_Real value) {
            $self->Value(Row,Col)=value;
            }
        };
		/****** math_Matrix::operator * ******/
		/****** md5 signature: 94d5051ab11d88189a0139728702f340 ******/
		%feature("compactdefaultargs") operator *;
		%feature("autodoc", "
Parameters
----------
Right: float

Return
-------
math_Matrix

Description
-----------
No available documentation.
") operator *;
		math_Matrix operator *(const Standard_Real Right);

		/****** math_Matrix::operator * ******/
		/****** md5 signature: fef22e813061d79dcc8f586587289d48 ******/
		%feature("compactdefaultargs") operator *;
		%feature("autodoc", "
Parameters
----------
Right: math_Matrix

Return
-------
math_Matrix

Description
-----------
No available documentation.
") operator *;
		math_Matrix operator *(const math_Matrix & Right);

		/****** math_Matrix::operator * ******/
		/****** md5 signature: c0a9ea7843feb8ee31a4f8ef5d1efe6c ******/
		%feature("compactdefaultargs") operator *;
		%feature("autodoc", "
Parameters
----------
Right: math_VectorBase<>

Return
-------
math_VectorBase<>

Description
-----------
No available documentation.
") operator *;
		math_VectorBase<> operator *(const math_VectorBase<> & Right);


%extend{
    void __imul_wrapper__(const Standard_Real other) {
    *self *= other;
    }
}
%pythoncode {
def __imul__(self, right):
    self.__imul_wrapper__(right)
    return self
}

%extend{
    void __imul_wrapper__(const math_Matrix other) {
    *self *= other;
    }
}
%pythoncode {
def __imul__(self, right):
    self.__imul_wrapper__(right)
    return self
}
		/****** math_Matrix::operator + ******/
		/****** md5 signature: f10c070428896ea481b284cdeb5d91d2 ******/
		%feature("compactdefaultargs") operator +;
		%feature("autodoc", "
Parameters
----------
Right: math_Matrix

Return
-------
math_Matrix

Description
-----------
No available documentation.
") operator +;
		math_Matrix operator +(const math_Matrix & Right);


%extend{
    void __iadd_wrapper__(const math_Matrix other) {
    *self += other;
    }
}
%pythoncode {
def __iadd__(self, right):
    self.__iadd_wrapper__(right)
    return self
}
		/****** math_Matrix::operator - ******/
		/****** md5 signature: 3ca481947ee5dec077f4109d6e290a68 ******/
		%feature("compactdefaultargs") operator -;
		%feature("autodoc", "
Parameters
----------
Right: math_Matrix

Return
-------
math_Matrix

Description
-----------
No available documentation.
") operator -;
		math_Matrix operator -(const math_Matrix & Right);

		/****** math_Matrix::operator - ******/
		/****** md5 signature: af35ddcee22eff379d56dba02133b505 ******/
		%feature("compactdefaultargs") operator -;
		%feature("autodoc", "Return
-------
math_Matrix

Description
-----------
No available documentation.
") operator -;
		math_Matrix operator -();


%extend{
    void __isub_wrapper__(const math_Matrix other) {
    *self -= other;
    }
}
%pythoncode {
def __isub__(self, right):
    self.__isub_wrapper__(right)
    return self
}
		/****** math_Matrix::operator / ******/
		/****** md5 signature: 46fa5987c594ac10ecb471fa453a05b7 ******/
		%feature("compactdefaultargs") operator /;
		%feature("autodoc", "
Parameters
----------
Right: float

Return
-------
math_Matrix

Description
-----------
No available documentation.
") operator /;
		math_Matrix operator /(const Standard_Real Right);


%extend{
    void __itruediv_wrapper__(const Standard_Real other) {
    *self /= other;
    }
}
%pythoncode {
def __itruediv__(self, right):
    self.__itruediv_wrapper__(right)
    return self
}
};


%extend math_Matrix {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************
* class math_MultipleVarFunction *
*********************************/
%nodefaultctor math_MultipleVarFunction;
class math_MultipleVarFunction {
	public:
		/****** math_MultipleVarFunction::GetStateNumber ******/
		/****** md5 signature: 72c7d030f77e2ffa21bc582e871fee3f ******/
		%feature("compactdefaultargs") GetStateNumber;
		%feature("autodoc", "Return
-------
int

Description
-----------
return the state of the function corresponding to the latestt call of any methods associated to the function. This function is called by each of the algorithms described later which define the function Integer Algorithm::StateNumber(). The algorithm has the responsibility to call this function when it has found a solution (i.e. a root or a minimum) and has to maintain the association between the solution found and this StateNumber. Byu default, this method returns 0 (which means for the algorithm: no state has been saved). It is the responsibility of the programmer to decide if he needs to save the current state of the function and to return an Integer that allows retrieval of the state.
") GetStateNumber;
		virtual Standard_Integer GetStateNumber();

		/****** math_MultipleVarFunction::NbVariables ******/
		/****** md5 signature: 9592108ebf305562827d51d05d64eecc ******/
		%feature("compactdefaultargs") NbVariables;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of variables of the function.
") NbVariables;
		virtual Standard_Integer NbVariables();

		/****** math_MultipleVarFunction::Value ******/
		/****** md5 signature: e09b772d60bf0c815be5e84388582a5f ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
X: math_Vector

Return
-------
F: float

Description
-----------
Computes the values of the Functions <F> for the variable <X>. returns True if the computation was done successfully, otherwise false.
") Value;
		virtual Standard_Boolean Value(const math_Vector & X, Standard_Real &OutValue);

};


%extend math_MultipleVarFunction {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************
* class math_NewtonFunctionRoot *
********************************/
class math_NewtonFunctionRoot {
	public:
		/****** math_NewtonFunctionRoot::math_NewtonFunctionRoot ******/
		/****** md5 signature: d6e160697bc830d86b40da2e4b705301 ******/
		%feature("compactdefaultargs") math_NewtonFunctionRoot;
		%feature("autodoc", "
Parameters
----------
F: math_FunctionWithDerivative
Guess: float
EpsX: float
EpsF: float
NbIterations: int (optional, default to 100)

Return
-------
None

Description
-----------
The Newton method is done to find the root of the function F from the initial guess Guess. The tolerance required on the root is given by Tolerance. The solution is found when: abs(Xi - Xi-1) <= EpsX and abs(F(Xi))<= EpsF The maximum number of iterations allowed is given by NbIterations.
") math_NewtonFunctionRoot;
		 math_NewtonFunctionRoot(math_FunctionWithDerivative & F, const Standard_Real Guess, const Standard_Real EpsX, const Standard_Real EpsF, const Standard_Integer NbIterations = 100);

		/****** math_NewtonFunctionRoot::math_NewtonFunctionRoot ******/
		/****** md5 signature: 6b40a66ed0702090abb8012862f650a6 ******/
		%feature("compactdefaultargs") math_NewtonFunctionRoot;
		%feature("autodoc", "
Parameters
----------
F: math_FunctionWithDerivative
Guess: float
EpsX: float
EpsF: float
A: float
B: float
NbIterations: int (optional, default to 100)

Return
-------
None

Description
-----------
The Newton method is done to find the root of the function F from the initial guess Guess. The solution must be inside the interval [A, B]. The tolerance required on the root is given by Tolerance. The solution is found when: abs(Xi - Xi-1) <= EpsX and abs(F(Xi))<= EpsF The maximum number of iterations allowed is given by NbIterations.
") math_NewtonFunctionRoot;
		 math_NewtonFunctionRoot(math_FunctionWithDerivative & F, const Standard_Real Guess, const Standard_Real EpsX, const Standard_Real EpsF, const Standard_Real A, const Standard_Real B, const Standard_Integer NbIterations = 100);

		/****** math_NewtonFunctionRoot::math_NewtonFunctionRoot ******/
		/****** md5 signature: 0b3c1bbcfcbb81923f6b4fa9faa9c962 ******/
		%feature("compactdefaultargs") math_NewtonFunctionRoot;
		%feature("autodoc", "
Parameters
----------
A: float
B: float
EpsX: float
EpsF: float
NbIterations: int (optional, default to 100)

Return
-------
None

Description
-----------
is used in a sub-class to initialize correctly all the fields of this class.
") math_NewtonFunctionRoot;
		 math_NewtonFunctionRoot(const Standard_Real A, const Standard_Real B, const Standard_Real EpsX, const Standard_Real EpsF, const Standard_Integer NbIterations = 100);

		/****** math_NewtonFunctionRoot::Derivative ******/
		/****** md5 signature: 63ea99dea8601c9ed801e924cf6ad25a ******/
		%feature("compactdefaultargs") Derivative;
		%feature("autodoc", "Return
-------
float

Description
-----------
returns the value of the derivative at the root. Exception NotDone is raised if the root was not found.
") Derivative;
		Standard_Real Derivative();

		/****** math_NewtonFunctionRoot::Dump ******/
		/****** md5 signature: d37b43e0b2386dc096d5d707876db157 ******/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "
Parameters
----------

Return
-------
o: Standard_OStream

Description
-----------
Prints information on the current state of the object.
") Dump;
		void Dump(std::ostream &OutValue);

		/****** math_NewtonFunctionRoot::IsDone ******/
		/****** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if the computations are successful, otherwise returns false.
") IsDone;
		Standard_Boolean IsDone();

		/****** math_NewtonFunctionRoot::NbIterations ******/
		/****** md5 signature: 05334f1e34f7c858ac022754e906f2bf ******/
		%feature("compactdefaultargs") NbIterations;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of iterations really done on the computation of the Root. Exception NotDone is raised if the root was not found.
") NbIterations;
		Standard_Integer NbIterations();

		/****** math_NewtonFunctionRoot::Perform ******/
		/****** md5 signature: 2a3a4e22e33b2c347173e53d44f4b810 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
F: math_FunctionWithDerivative
Guess: float

Return
-------
None

Description
-----------
is used internally by the constructors.
") Perform;
		void Perform(math_FunctionWithDerivative & F, const Standard_Real Guess);

		/****** math_NewtonFunctionRoot::Root ******/
		/****** md5 signature: 1f1a437be6bd034392962de6cf04ded1 ******/
		%feature("compactdefaultargs") Root;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the value of the root of function <F>. Exception NotDone is raised if the root was not found.
") Root;
		Standard_Real Root();

		/****** math_NewtonFunctionRoot::Value ******/
		/****** md5 signature: 52655a2fb6642856b2c68a9331826787 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Return
-------
float

Description
-----------
returns the value of the function at the root. Exception NotDone is raised if the root was not found.
") Value;
		Standard_Real Value();

};


%extend math_NewtonFunctionRoot {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************************
* class math_NewtonFunctionSetRoot *
***********************************/
class math_NewtonFunctionSetRoot {
	public:
		/****** math_NewtonFunctionSetRoot::math_NewtonFunctionSetRoot ******/
		/****** md5 signature: d24c05e7550e56e32eff3a37a3caf780 ******/
		%feature("compactdefaultargs") math_NewtonFunctionSetRoot;
		%feature("autodoc", "
Parameters
----------
theFunction: math_FunctionSetWithDerivatives
theXTolerance: math_Vector
theFTolerance: float
tehNbIterations: int (optional, default to 100)

Return
-------
None

Description
-----------
Initialize correctly all the fields of this class. The range (1, F.NbVariables()) must be especially respected for all vectors and matrix declarations.
") math_NewtonFunctionSetRoot;
		 math_NewtonFunctionSetRoot(math_FunctionSetWithDerivatives & theFunction, const math_Vector & theXTolerance, const Standard_Real theFTolerance, const Standard_Integer tehNbIterations = 100);

		/****** math_NewtonFunctionSetRoot::math_NewtonFunctionSetRoot ******/
		/****** md5 signature: 0190b478f77c6bc3b2dde39b95386dae ******/
		%feature("compactdefaultargs") math_NewtonFunctionSetRoot;
		%feature("autodoc", "
Parameters
----------
theFunction: math_FunctionSetWithDerivatives
theFTolerance: float
theNbIterations: int (optional, default to 100)

Return
-------
None

Description
-----------
This constructor should be used in a sub-class to initialize correctly all the fields of this class. The range (1, F.NbVariables()) must be especially respected for all vectors and matrix declarations. The method SetTolerance must be called before performing the algorithm.
") math_NewtonFunctionSetRoot;
		 math_NewtonFunctionSetRoot(math_FunctionSetWithDerivatives & theFunction, const Standard_Real theFTolerance, const Standard_Integer theNbIterations = 100);

		/****** math_NewtonFunctionSetRoot::Derivative ******/
		/****** md5 signature: 3dcf53e070495d3f965a044124317010 ******/
		%feature("compactdefaultargs") Derivative;
		%feature("autodoc", "Return
-------
math_Matrix

Description
-----------
Returns the matrix value of the derivative at the root. Exception NotDone is raised if the root was not found.
") Derivative;
		const math_Matrix & Derivative();

		/****** math_NewtonFunctionSetRoot::Derivative ******/
		/****** md5 signature: a541fd37b04e5a32f186e9bd160ab411 ******/
		%feature("compactdefaultargs") Derivative;
		%feature("autodoc", "
Parameters
----------
Der: math_Matrix

Return
-------
None

Description
-----------
Outputs the matrix value of the derivative at the root in Der. Exception NotDone is raised if the root was not found. Exception DimensionError is raised if the range of Der is not equal to the range of the StartingPoint.
") Derivative;
		void Derivative(math_Matrix & Der);

		/****** math_NewtonFunctionSetRoot::Dump ******/
		/****** md5 signature: d37b43e0b2386dc096d5d707876db157 ******/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "
Parameters
----------

Return
-------
o: Standard_OStream

Description
-----------
Prints information on the current state of the object. Is used to redefine the operator <<.
") Dump;
		void Dump(std::ostream &OutValue);

		/****** math_NewtonFunctionSetRoot::FunctionSetErrors ******/
		/****** md5 signature: f60cf743c92edccf04b38617ec21af42 ******/
		%feature("compactdefaultargs") FunctionSetErrors;
		%feature("autodoc", "Return
-------
math_Vector

Description
-----------
Returns the vector value of the error done on the functions at the root. Exception NotDone is raised if the root was not found.
") FunctionSetErrors;
		const math_Vector & FunctionSetErrors();

		/****** math_NewtonFunctionSetRoot::FunctionSetErrors ******/
		/****** md5 signature: 42d5fb93e272f054a74fbe4bd77ad1f2 ******/
		%feature("compactdefaultargs") FunctionSetErrors;
		%feature("autodoc", "
Parameters
----------
Err: math_Vector

Return
-------
None

Description
-----------
Outputs the vector value of the error done on the functions at the root in Err. Exception NotDone is raised if the root was not found. Exception DimensionError is raised if the range of Err is not equal to the range of the StartingPoint.
") FunctionSetErrors;
		void FunctionSetErrors(math_Vector & Err);

		/****** math_NewtonFunctionSetRoot::IsDone ******/
		/****** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if the computations are successful, otherwise returns false.
") IsDone;
		Standard_Boolean IsDone();

		/****** math_NewtonFunctionSetRoot::IsSolutionReached ******/
		/****** md5 signature: 8f22da97fa90e99c4558e184c58d5b3e ******/
		%feature("compactdefaultargs") IsSolutionReached;
		%feature("autodoc", "
Parameters
----------
F: math_FunctionSetWithDerivatives

Return
-------
bool

Description
-----------
This method is called at the end of each iteration to check if the solution is found. Vectors DeltaX, Fvalues and Jacobian Matrix are consistent with the possible solution Vector Sol and can be inspected to decide whether the solution is reached or not.
") IsSolutionReached;
		virtual Standard_Boolean IsSolutionReached(math_FunctionSetWithDerivatives & F);

		/****** math_NewtonFunctionSetRoot::NbIterations ******/
		/****** md5 signature: 05334f1e34f7c858ac022754e906f2bf ******/
		%feature("compactdefaultargs") NbIterations;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of iterations really done during the computation of the Root. Exception NotDone is raised if the root was not found.
") NbIterations;
		Standard_Integer NbIterations();

		/****** math_NewtonFunctionSetRoot::Perform ******/
		/****** md5 signature: c614619ebede1b055764f4e9fdc50f92 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
theFunction: math_FunctionSetWithDerivatives
theStartingPoint: math_Vector

Return
-------
None

Description
-----------
The Newton method is done to improve the root of the function from the initial guess point. The solution is found when: abs(Xj - Xj-1)(i) <= XTol(i) and abs(Fi) <= FTol for all i;.
") Perform;
		void Perform(math_FunctionSetWithDerivatives & theFunction, const math_Vector & theStartingPoint);

		/****** math_NewtonFunctionSetRoot::Perform ******/
		/****** md5 signature: 9cda40df6a87705d9732c4f2ff942f5b ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
theFunction: math_FunctionSetWithDerivatives
theStartingPoint: math_Vector
theInfBound: math_Vector
theSupBound: math_Vector

Return
-------
None

Description
-----------
The Newton method is done to improve the root of the function from the initial guess point. Bounds may be given, to constrain the solution. The solution is found when: abs(Xj - Xj-1)(i) <= XTol(i) and abs(Fi) <= FTol for all i;.
") Perform;
		void Perform(math_FunctionSetWithDerivatives & theFunction, const math_Vector & theStartingPoint, const math_Vector & theInfBound, const math_Vector & theSupBound);

		/****** math_NewtonFunctionSetRoot::Root ******/
		/****** md5 signature: 877a7a2963433958443904730046ad0c ******/
		%feature("compactdefaultargs") Root;
		%feature("autodoc", "Return
-------
math_Vector

Description
-----------
Returns the value of the root of function F. Exceptions StdFail_NotDone if the algorithm fails (and IsDone returns false).
") Root;
		const math_Vector & Root();

		/****** math_NewtonFunctionSetRoot::Root ******/
		/****** md5 signature: a6e973993b4c58ebb2497c195b8005ce ******/
		%feature("compactdefaultargs") Root;
		%feature("autodoc", "
Parameters
----------
Root: math_Vector

Return
-------
None

Description
-----------
outputs the root vector in Root. Exception NotDone is raised if the root was not found. Exception DimensionError is raised if the range of Root is not equal to the range of the StartingPoint.
") Root;
		void Root(math_Vector & Root);

		/****** math_NewtonFunctionSetRoot::SetTolerance ******/
		/****** md5 signature: ced3627353aa25004d5c42e4296b4972 ******/
		%feature("compactdefaultargs") SetTolerance;
		%feature("autodoc", "
Parameters
----------
XTol: math_Vector

Return
-------
None

Description
-----------
Initializes the tolerance values for the unknowns.
") SetTolerance;
		void SetTolerance(const math_Vector & XTol);

};


%extend math_NewtonFunctionSetRoot {
	%pythoncode {
	__repr__ = _dumps_object

	@methodnotwrapped
	def StateNumber(self):
		pass
	}
};

/***************************
* class math_NewtonMinimum *
***************************/
class math_NewtonMinimum {
	public:
		/****** math_NewtonMinimum::math_NewtonMinimum ******/
		/****** md5 signature: d6a72f1f3500ef9a43d96e7b87a82899 ******/
		%feature("compactdefaultargs") math_NewtonMinimum;
		%feature("autodoc", "
Parameters
----------
theFunction: math_MultipleVarFunctionWithHessian
theTolerance: float (optional, default to Precision::Confusion())
theNbIterations: int (optional, default to 40)
theConvexity: float (optional, default to 1.0e-6)
theWithSingularity: bool (optional, default to Standard_True)

Return
-------
None

Description
-----------
The tolerance required on the solution is given by Tolerance. Iteration are stopped if (!WithSingularity) and H(F(Xi)) is not definite positive (if the smaller eigenvalue of H < Convexity) or IsConverged() returns True for 2 successives Iterations. Warning: This constructor does not perform computation.
") math_NewtonMinimum;
		 math_NewtonMinimum(const math_MultipleVarFunctionWithHessian & theFunction, const Standard_Real theTolerance = Precision::Confusion(), const Standard_Integer theNbIterations = 40, const Standard_Real theConvexity = 1.0e-6, const Standard_Boolean theWithSingularity = Standard_True);

		/****** math_NewtonMinimum::Dump ******/
		/****** md5 signature: d37b43e0b2386dc096d5d707876db157 ******/
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

		/****** math_NewtonMinimum::GetStatus ******/
		/****** md5 signature: f0121c820ebe3b5d3aba6ff3efc32974 ******/
		%feature("compactdefaultargs") GetStatus;
		%feature("autodoc", "Return
-------
math_Status

Description
-----------
Returns the Status of computation. The exception NotDone is raised if an error has occurred.
") GetStatus;
		math_Status GetStatus();

		/****** math_NewtonMinimum::Gradient ******/
		/****** md5 signature: 6c3691fb2b0bb6085965955bdcce0a12 ******/
		%feature("compactdefaultargs") Gradient;
		%feature("autodoc", "Return
-------
math_Vector

Description
-----------
returns the gradient vector at the minimum. Exception NotDone is raised if an error has occurred. The minimum was not found.
") Gradient;
		const math_Vector & Gradient();

		/****** math_NewtonMinimum::Gradient ******/
		/****** md5 signature: d04c1575bb29bb8c6afa62dba0106edc ******/
		%feature("compactdefaultargs") Gradient;
		%feature("autodoc", "
Parameters
----------
Grad: math_Vector

Return
-------
None

Description
-----------
outputs the gradient vector at the minimum in Grad. Exception NotDone is raised if the minimum was not found. Exception DimensionError is raised if the range of Grad is not equal to the range of the StartingPoint.
") Gradient;
		void Gradient(math_Vector & Grad);

		/****** math_NewtonMinimum::IsConverged ******/
		/****** md5 signature: 8a5091a170ea2ddc20fb6c2c7be99ac2 ******/
		%feature("compactdefaultargs") IsConverged;
		%feature("autodoc", "Return
-------
bool

Description
-----------
This method is called at the end of each iteration to check the convergence: || Xi+1 - Xi || < Tolerance or || F(Xi+1) - F(Xi)|| < Tolerance * || F(Xi) || It can be redefined in a sub-class to implement a specific test.
") IsConverged;
		virtual Standard_Boolean IsConverged();

		/****** math_NewtonMinimum::IsDone ******/
		/****** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Tests if an error has occurred.
") IsDone;
		Standard_Boolean IsDone();

		/****** math_NewtonMinimum::Location ******/
		/****** md5 signature: 5a88ac2c95c5682bdeb613bd0a6c6d51 ******/
		%feature("compactdefaultargs") Location;
		%feature("autodoc", "Return
-------
math_Vector

Description
-----------
returns the location vector of the minimum. Exception NotDone is raised if an error has occurred.
") Location;
		const math_Vector & Location();

		/****** math_NewtonMinimum::Location ******/
		/****** md5 signature: c2f6dc7227af27a93b49ddbc87dfbc1a ******/
		%feature("compactdefaultargs") Location;
		%feature("autodoc", "
Parameters
----------
Loc: math_Vector

Return
-------
None

Description
-----------
outputs the location vector of the minimum in Loc. Exception NotDone is raised if an error has occurred. Exception DimensionError is raised if the range of Loc is not equal to the range of the StartingPoint.
") Location;
		void Location(math_Vector & Loc);

		/****** math_NewtonMinimum::Minimum ******/
		/****** md5 signature: c6e52c305b40f67530895542ef579d78 ******/
		%feature("compactdefaultargs") Minimum;
		%feature("autodoc", "Return
-------
float

Description
-----------
returns the value of the minimum. Exception NotDone is raised if the minimum was not found.
") Minimum;
		Standard_Real Minimum();

		/****** math_NewtonMinimum::NbIterations ******/
		/****** md5 signature: 05334f1e34f7c858ac022754e906f2bf ******/
		%feature("compactdefaultargs") NbIterations;
		%feature("autodoc", "Return
-------
int

Description
-----------
returns the number of iterations really done in the calculation of the minimum. The exception NotDone is raised if an error has occurred.
") NbIterations;
		Standard_Integer NbIterations();

		/****** math_NewtonMinimum::Perform ******/
		/****** md5 signature: 4deb554464317c5391e1d57f8d2daf73 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
theFunction: math_MultipleVarFunctionWithHessian
theStartingPoint: math_Vector

Return
-------
None

Description
-----------
Search the solution.
") Perform;
		void Perform(math_MultipleVarFunctionWithHessian & theFunction, const math_Vector & theStartingPoint);

		/****** math_NewtonMinimum::SetBoundary ******/
		/****** md5 signature: 3dc06701c9c41177e0e859238df70613 ******/
		%feature("compactdefaultargs") SetBoundary;
		%feature("autodoc", "
Parameters
----------
theLeftBorder: math_Vector
theRightBorder: math_Vector

Return
-------
None

Description
-----------
Set boundaries.
") SetBoundary;
		void SetBoundary(const math_Vector & theLeftBorder, const math_Vector & theRightBorder);

};


%extend math_NewtonMinimum {
	%pythoncode {
	__repr__ = _dumps_object

	@methodnotwrapped
	def IsConvex(self):
		pass
	}
};

/*****************
* class math_PSO *
*****************/
class math_PSO {
	public:
		/****** math_PSO::math_PSO ******/
		/****** md5 signature: 50337c0ea7368dc9053e65f47cfd7161 ******/
		%feature("compactdefaultargs") math_PSO;
		%feature("autodoc", "
Parameters
----------
theFunc: math_MultipleVarFunction *
theLowBorder: math_Vector
theUppBorder: math_Vector
theSteps: math_Vector
theNbParticles: int (optional, default to 32)
theNbIter: int (optional, default to 100)

Return
-------
None

Description
-----------
/** * Constructor. * * 
Parameter theFunc defines the objective function. It should exist during all lifetime of class instance. * 
Parameter theLowBorder defines lower border of search space. * 
Parameter theUppBorder defines upper border of search space. * 
Parameter theSteps defines steps of regular grid, used for particle generation. This parameter used to define stop condition (TerminalVelocity). * 
Parameter theNbParticles defines number of particles. * 
Parameter theNbIter defines maximum number of iterations. */.
") math_PSO;
		 math_PSO(math_MultipleVarFunction * theFunc, const math_Vector & theLowBorder, const math_Vector & theUppBorder, const math_Vector & theSteps, const Standard_Integer theNbParticles = 32, const Standard_Integer theNbIter = 100);

		/****** math_PSO::Perform ******/
		/****** md5 signature: 2b0127c0c1b76a56baebd4478c0811b2 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
theSteps: math_Vector
theOutPnt: math_Vector
theNbIter: int (optional, default to 100)

Return
-------
theValue: float

Description
-----------
Perform computations, particles array is constructed inside of this function.
") Perform;
		void Perform(const math_Vector & theSteps, Standard_Real &OutValue, math_Vector & theOutPnt, const Standard_Integer theNbIter = 100);

		/****** math_PSO::Perform ******/
		/****** md5 signature: e0494583c5e220768a488ee80a1d2718 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
theParticles: math_PSOParticlesPool
theNbParticles: int
theOutPnt: math_Vector
theNbIter: int (optional, default to 100)

Return
-------
theValue: float

Description
-----------
Perform computations with given particles array.
") Perform;
		void Perform(math_PSOParticlesPool & theParticles, Standard_Integer theNbParticles, Standard_Real &OutValue, math_Vector & theOutPnt, const Standard_Integer theNbIter = 100);

};


%extend math_PSO {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************
* class math_PSOParticlesPool *
******************************/
class math_PSOParticlesPool {
	public:
		/****** math_PSOParticlesPool::math_PSOParticlesPool ******/
		/****** md5 signature: 6bdccc4659b6eeb09fcb2f7c33868cc9 ******/
		%feature("compactdefaultargs") math_PSOParticlesPool;
		%feature("autodoc", "
Parameters
----------
theParticlesCount: int
theDimensionCount: int

Return
-------
None

Description
-----------
No available documentation.
") math_PSOParticlesPool;
		 math_PSOParticlesPool(const Standard_Integer theParticlesCount, const Standard_Integer theDimensionCount);

		/****** math_PSOParticlesPool::GetBestParticle ******/
		/****** md5 signature: c1ad171b33359090f394624dee5690f1 ******/
		%feature("compactdefaultargs") GetBestParticle;
		%feature("autodoc", "Return
-------
PSO_Particle *

Description
-----------
No available documentation.
") GetBestParticle;
		PSO_Particle * GetBestParticle();

		/****** math_PSOParticlesPool::GetParticle ******/
		/****** md5 signature: 2379a9e46b95b9c2895b7e30dc6ab8c1 ******/
		%feature("compactdefaultargs") GetParticle;
		%feature("autodoc", "
Parameters
----------
theIdx: int

Return
-------
PSO_Particle *

Description
-----------
No available documentation.
") GetParticle;
		PSO_Particle * GetParticle(const Standard_Integer theIdx);

		/****** math_PSOParticlesPool::GetWorstParticle ******/
		/****** md5 signature: ab984308bec609f60880b6017559c01b ******/
		%feature("compactdefaultargs") GetWorstParticle;
		%feature("autodoc", "Return
-------
PSO_Particle *

Description
-----------
No available documentation.
") GetWorstParticle;
		PSO_Particle * GetWorstParticle();

};


%extend math_PSOParticlesPool {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************
* class math_Powell *
********************/
class math_Powell {
	public:
		/****** math_Powell::math_Powell ******/
		/****** md5 signature: a0dd15bd610dd1a4afa67a302c7a6f98 ******/
		%feature("compactdefaultargs") math_Powell;
		%feature("autodoc", "
Parameters
----------
theFunction: math_MultipleVarFunction
theTolerance: float
theNbIterations: int (optional, default to 200)
theZEPS: float (optional, default to 1.0e-12)

Return
-------
None

Description
-----------
Constructor. Initialize new entity.
") math_Powell;
		 math_Powell(const math_MultipleVarFunction & theFunction, const Standard_Real theTolerance, const Standard_Integer theNbIterations = 200, const Standard_Real theZEPS = 1.0e-12);

		/****** math_Powell::Dump ******/
		/****** md5 signature: d37b43e0b2386dc096d5d707876db157 ******/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "
Parameters
----------

Return
-------
o: Standard_OStream

Description
-----------
Prints information on the current state of the object. Is used to redefine the operator <<.
") Dump;
		void Dump(std::ostream &OutValue);

		/****** math_Powell::IsDone ******/
		/****** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if the computations are successful, otherwise returns false.
") IsDone;
		Standard_Boolean IsDone();

		/****** math_Powell::IsSolutionReached ******/
		/****** md5 signature: f1df7a4d688b6a042fa4101f95c896f6 ******/
		%feature("compactdefaultargs") IsSolutionReached;
		%feature("autodoc", "
Parameters
----------
theFunction: math_MultipleVarFunction

Return
-------
bool

Description
-----------
Solution F = Fi is found when: 2.0 * abs(Fi - Fi-1) <= Tolerance * (abs(Fi) + abs(Fi-1)) + ZEPS. The maximum number of iterations allowed is given by NbIterations.
") IsSolutionReached;
		virtual Standard_Boolean IsSolutionReached(math_MultipleVarFunction & theFunction);

		/****** math_Powell::Location ******/
		/****** md5 signature: 5a88ac2c95c5682bdeb613bd0a6c6d51 ******/
		%feature("compactdefaultargs") Location;
		%feature("autodoc", "Return
-------
math_Vector

Description
-----------
returns the location vector of the minimum. Exception NotDone is raised if the minimum was not found.
") Location;
		const math_Vector & Location();

		/****** math_Powell::Location ******/
		/****** md5 signature: c2f6dc7227af27a93b49ddbc87dfbc1a ******/
		%feature("compactdefaultargs") Location;
		%feature("autodoc", "
Parameters
----------
Loc: math_Vector

Return
-------
None

Description
-----------
outputs the location vector of the minimum in Loc. Exception NotDone is raised if the minimum was not found. Exception DimensionError is raised if the range of Loc is not equal to the range of the StartingPoint.
") Location;
		void Location(math_Vector & Loc);

		/****** math_Powell::Minimum ******/
		/****** md5 signature: c6e52c305b40f67530895542ef579d78 ******/
		%feature("compactdefaultargs") Minimum;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the value of the minimum. Exception NotDone is raised if the minimum was not found.
") Minimum;
		Standard_Real Minimum();

		/****** math_Powell::NbIterations ******/
		/****** md5 signature: 05334f1e34f7c858ac022754e906f2bf ******/
		%feature("compactdefaultargs") NbIterations;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of iterations really done during the computation of the minimum. Exception NotDone is raised if the minimum was not found.
") NbIterations;
		Standard_Integer NbIterations();

		/****** math_Powell::Perform ******/
		/****** md5 signature: 594513f2b2079305698a7173e88ec674 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
theFunction: math_MultipleVarFunction
theStartingPoint: math_Vector
theStartingDirections: math_Matrix

Return
-------
None

Description
-----------
Computes Powell minimization on the function F given theStartingPoint, and an initial matrix theStartingDirection whose columns contain the initial set of directions. The solution F = Fi is found when: 2.0 * abs(Fi - Fi-1) =< Tolerance * (abs(Fi) + abs(Fi-1) + ZEPS).
") Perform;
		void Perform(math_MultipleVarFunction & theFunction, const math_Vector & theStartingPoint, const math_Matrix & theStartingDirections);

};


%extend math_Powell {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************
* class math_SVD *
*****************/
class math_SVD {
	public:
		/****** math_SVD::math_SVD ******/
		/****** md5 signature: 2abb6816df2a6f5ebaa98984acfa09ae ******/
		%feature("compactdefaultargs") math_SVD;
		%feature("autodoc", "
Parameters
----------
A: math_Matrix

Return
-------
None

Description
-----------
Given as input an n X m matrix A with n < m, n = m or n > m this constructor performs the Singular Value Decomposition.
") math_SVD;
		 math_SVD(const math_Matrix & A);

		/****** math_SVD::Dump ******/
		/****** md5 signature: d37b43e0b2386dc096d5d707876db157 ******/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "
Parameters
----------

Return
-------
o: Standard_OStream

Description
-----------
Prints information on the current state of the object. Is used to redefine the operator <<.
") Dump;
		void Dump(std::ostream &OutValue);

		/****** math_SVD::IsDone ******/
		/****** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if the computations are successful, otherwise returns false.
") IsDone;
		Standard_Boolean IsDone();

		/****** math_SVD::PseudoInverse ******/
		/****** md5 signature: 8b61c132ab3d5c44d7d8d13a4ad9e96a ******/
		%feature("compactdefaultargs") PseudoInverse;
		%feature("autodoc", "
Parameters
----------
Inv: math_Matrix
Eps: float (optional, default to 1.0e-6)

Return
-------
None

Description
-----------
Computes the inverse Inv of matrix A such as A * Inverse = Identity. Exceptions StdFail_NotDone if the algorithm fails (and IsDone returns false). Standard_DimensionError if the ranges of Inv are compatible with the ranges of A.
") PseudoInverse;
		void PseudoInverse(math_Matrix & Inv, const Standard_Real Eps = 1.0e-6);

		/****** math_SVD::Solve ******/
		/****** md5 signature: ae383619aac7a447c04f9f6dd08278c2 ******/
		%feature("compactdefaultargs") Solve;
		%feature("autodoc", "
Parameters
----------
B: math_Vector
X: math_Vector
Eps: float (optional, default to 1.0e-6)

Return
-------
None

Description
-----------
Given the input Vector B this routine solves the set of linear equations A . X = B. Exception NotDone is raised if the decomposition of A was not done successfully. Exception DimensionError is raised if the range of B is not equal to the rowrange of A. Exception DimensionError is raised if the range of X is not equal to the colrange of A.
") Solve;
		void Solve(const math_Vector & B, math_Vector & X, const Standard_Real Eps = 1.0e-6);

};


%extend math_SVD {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************************
* class math_TrigonometricFunctionRoots *
****************************************/
class math_TrigonometricFunctionRoots {
	public:
		/****** math_TrigonometricFunctionRoots::math_TrigonometricFunctionRoots ******/
		/****** md5 signature: 8d69005b1ba6172420b1c41415105411 ******/
		%feature("compactdefaultargs") math_TrigonometricFunctionRoots;
		%feature("autodoc", "
Parameters
----------
A: float
B: float
C: float
D: float
E: float
InfBound: float
SupBound: float

Return
-------
None

Description
-----------
Given coefficients a, b, c, d , e, this constructor performs the resolution of the equation above. The solutions must be contained in [InfBound, SupBound]. InfBound and SupBound can be set by default to 0 and 2*PI.
") math_TrigonometricFunctionRoots;
		 math_TrigonometricFunctionRoots(const Standard_Real A, const Standard_Real B, const Standard_Real C, const Standard_Real D, const Standard_Real E, const Standard_Real InfBound, const Standard_Real SupBound);

		/****** math_TrigonometricFunctionRoots::math_TrigonometricFunctionRoots ******/
		/****** md5 signature: aab49f4c137e8339a57610f302d5a8b6 ******/
		%feature("compactdefaultargs") math_TrigonometricFunctionRoots;
		%feature("autodoc", "
Parameters
----------
D: float
E: float
InfBound: float
SupBound: float

Return
-------
None

Description
-----------
Given the two coefficients d and e, it performs the resolution of d*sin(x) + e = 0. The solutions must be contained in [InfBound, SupBound]. InfBound and SupBound can be set by default to 0 and 2*PI.
") math_TrigonometricFunctionRoots;
		 math_TrigonometricFunctionRoots(const Standard_Real D, const Standard_Real E, const Standard_Real InfBound, const Standard_Real SupBound);

		/****** math_TrigonometricFunctionRoots::math_TrigonometricFunctionRoots ******/
		/****** md5 signature: d99b73ff2ce9f7321872801ce3213f8b ******/
		%feature("compactdefaultargs") math_TrigonometricFunctionRoots;
		%feature("autodoc", "
Parameters
----------
C: float
D: float
E: float
InfBound: float
SupBound: float

Return
-------
None

Description
-----------
Given the three coefficients c, d and e, it performs the resolution of c*Cos(x) + d*sin(x) + e = 0. The solutions must be contained in [InfBound, SupBound]. InfBound and SupBound can be set by default to 0 and 2*PI.
") math_TrigonometricFunctionRoots;
		 math_TrigonometricFunctionRoots(const Standard_Real C, const Standard_Real D, const Standard_Real E, const Standard_Real InfBound, const Standard_Real SupBound);

		/****** math_TrigonometricFunctionRoots::Dump ******/
		/****** md5 signature: d37b43e0b2386dc096d5d707876db157 ******/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "
Parameters
----------

Return
-------
o: Standard_OStream

Description
-----------
Prints information on the current state of the object.
") Dump;
		void Dump(std::ostream &OutValue);

		/****** math_TrigonometricFunctionRoots::InfiniteRoots ******/
		/****** md5 signature: 6c844bee82586a7c3f4a33590d02fc3c ******/
		%feature("compactdefaultargs") InfiniteRoots;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if there is an infinity of roots, otherwise returns false.
") InfiniteRoots;
		Standard_Boolean InfiniteRoots();

		/****** math_TrigonometricFunctionRoots::IsDone ******/
		/****** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if the computations are successful, otherwise returns false.
") IsDone;
		Standard_Boolean IsDone();

		/****** math_TrigonometricFunctionRoots::NbSolutions ******/
		/****** md5 signature: 02fdbddb1f7eff080419f602203d8f8b ******/
		%feature("compactdefaultargs") NbSolutions;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of solutions found. An exception is raised if NotDone. An exception is raised if there is an infinity of solutions.
") NbSolutions;
		Standard_Integer NbSolutions();

		/****** math_TrigonometricFunctionRoots::Value ******/
		/****** md5 signature: 848ebada0b45fc838235de2b6b6e8d07 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
float

Description
-----------
Returns the solution of range Index. An exception is raised if NotDone. An exception is raised if Index>NbSolutions. An exception is raised if there is an infinity of solutions.
") Value;
		Standard_Real Value(const Standard_Integer Index);

};


%extend math_TrigonometricFunctionRoots {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************
* class math_Uzawa *
*******************/
class math_Uzawa {
	public:
		/****** math_Uzawa::math_Uzawa ******/
		/****** md5 signature: ce8a643cc052d25710c36d089c8860f4 ******/
		%feature("compactdefaultargs") math_Uzawa;
		%feature("autodoc", "
Parameters
----------
Cont: math_Matrix
Secont: math_Vector
StartingPoint: math_Vector
EpsLix: float (optional, default to 1.0e-06)
EpsLic: float (optional, default to 1.0e-06)
NbIterations: int (optional, default to 500)

Return
-------
None

Description
-----------
Given an input matrix Cont, two input vectors Secont and StartingPoint, it solves Cont*X = Secont (only = equations) with a minimization of Norme(X-X0). The maximum iterations number allowed is fixed to NbIterations. The tolerance EpsLic is fixed for the dual variable convergence. The tolerance EpsLix is used for the convergence of X. Exception ConstructionError is raised if the line number of Cont is different from the length of Secont.
") math_Uzawa;
		 math_Uzawa(const math_Matrix & Cont, const math_Vector & Secont, const math_Vector & StartingPoint, const Standard_Real EpsLix = 1.0e-06, const Standard_Real EpsLic = 1.0e-06, const Standard_Integer NbIterations = 500);

		/****** math_Uzawa::math_Uzawa ******/
		/****** md5 signature: fbff15989748ebd19e9916a271b6e5a5 ******/
		%feature("compactdefaultargs") math_Uzawa;
		%feature("autodoc", "
Parameters
----------
Cont: math_Matrix
Secont: math_Vector
StartingPoint: math_Vector
Nci: int
Nce: int
EpsLix: float (optional, default to 1.0e-06)
EpsLic: float (optional, default to 1.0e-06)
NbIterations: int (optional, default to 500)

Return
-------
None

Description
-----------
Given an input matrix Cont, two input vectors Secont and StartingPoint, it solves Cont*X = Secont (the Nce first equations are equal equations and the Nci last equations are inequalities <) with a minimization of Norme(X-X0). The maximum iterations number allowed is fixed to NbIterations. The tolerance EpsLic is fixed for the dual variable convergence. The tolerance EpsLix is used for the convergence of X. There are no conditions on Nce and Nci. Exception ConstructionError is raised if the line number of Cont is different from the length of Secont and from Nce + Nci.
") math_Uzawa;
		 math_Uzawa(const math_Matrix & Cont, const math_Vector & Secont, const math_Vector & StartingPoint, const Standard_Integer Nci, const Standard_Integer Nce, const Standard_Real EpsLix = 1.0e-06, const Standard_Real EpsLic = 1.0e-06, const Standard_Integer NbIterations = 500);

		/****** math_Uzawa::Duale ******/
		/****** md5 signature: 589ba6062fab0f7485d5c8c4ec2bb4d0 ******/
		%feature("compactdefaultargs") Duale;
		%feature("autodoc", "
Parameters
----------
V: math_Vector

Return
-------
None

Description
-----------
returns the duale variables V of the systeme.
") Duale;
		void Duale(math_Vector & V);

		/****** math_Uzawa::Dump ******/
		/****** md5 signature: d37b43e0b2386dc096d5d707876db157 ******/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "
Parameters
----------

Return
-------
o: Standard_OStream

Description
-----------
Prints information on the current state of the object.
") Dump;
		void Dump(std::ostream &OutValue);

		/****** math_Uzawa::Error ******/
		/****** md5 signature: b1e838c6dcbfa6a1bf16d1bc7e40df88 ******/
		%feature("compactdefaultargs") Error;
		%feature("autodoc", "Return
-------
math_Vector

Description
-----------
Returns the difference between X solution and the StartingPoint. An exception is raised if NotDone.
") Error;
		const math_Vector & Error();

		/****** math_Uzawa::InitialError ******/
		/****** md5 signature: 19b0771443c6d4e606e07be01091d26b ******/
		%feature("compactdefaultargs") InitialError;
		%feature("autodoc", "Return
-------
math_Vector

Description
-----------
Returns the initial error Cont*StartingPoint-Secont. An exception is raised if NotDone.
") InitialError;
		const math_Vector & InitialError();

		/****** math_Uzawa::InverseCont ******/
		/****** md5 signature: 5332e8442d4899802d6f96b564a47a7e ******/
		%feature("compactdefaultargs") InverseCont;
		%feature("autodoc", "Return
-------
math_Matrix

Description
-----------
returns the inverse matrix of (C * Transposed(C)). This result is needed for the computation of the gradient when approximating a curve.
") InverseCont;
		const math_Matrix & InverseCont();

		/****** math_Uzawa::IsDone ******/
		/****** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if the computations are successful, otherwise returns false.
") IsDone;
		Standard_Boolean IsDone();

		/****** math_Uzawa::NbIterations ******/
		/****** md5 signature: 05334f1e34f7c858ac022754e906f2bf ******/
		%feature("compactdefaultargs") NbIterations;
		%feature("autodoc", "Return
-------
int

Description
-----------
returns the number of iterations really done. An exception is raised if NotDone.
") NbIterations;
		Standard_Integer NbIterations();

		/****** math_Uzawa::Value ******/
		/****** md5 signature: da451945ce62c2e97eedc01217c3028f ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Return
-------
math_Vector

Description
-----------
Returns the vector solution of the system above. An exception is raised if NotDone.
") Value;
		const math_Vector & Value();

};


%extend math_Uzawa {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************
* class math_ValueAndWeight *
****************************/
class math_ValueAndWeight {
	public:
		/****** math_ValueAndWeight::math_ValueAndWeight ******/
		/****** md5 signature: c4cb905212fb4ef5bdeb4a4ab2ec90a9 ******/
		%feature("compactdefaultargs") math_ValueAndWeight;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") math_ValueAndWeight;
		 math_ValueAndWeight();

		/****** math_ValueAndWeight::math_ValueAndWeight ******/
		/****** md5 signature: 96e398fa5fd0fba94549e32703ffcb63 ******/
		%feature("compactdefaultargs") math_ValueAndWeight;
		%feature("autodoc", "
Parameters
----------
theValue: float
theWeight: float

Return
-------
None

Description
-----------
No available documentation.
") math_ValueAndWeight;
		 math_ValueAndWeight(Standard_Real theValue, Standard_Real theWeight);

		/****** math_ValueAndWeight::Value ******/
		/****** md5 signature: 246826be964a300c707aadb5d0b62468 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Return
-------
float

Description
-----------
No available documentation.
") Value;
		Standard_Real Value();

		/****** math_ValueAndWeight::Weight ******/
		/****** md5 signature: c95436d315e786d321996425ae21ef9e ******/
		%feature("compactdefaultargs") Weight;
		%feature("autodoc", "Return
-------
float

Description
-----------
No available documentation.
") Weight;
		Standard_Real Weight();

};


%extend math_ValueAndWeight {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************
* class math_VectorBase *
************************/
class math_VectorBase {
	public:
		/****** math_VectorBase::math_VectorBase ******/
		/****** md5 signature: 7686b4feb365f437bc9a18125aa19da4 ******/
		%feature("compactdefaultargs") math_VectorBase;
		%feature("autodoc", "
Parameters
----------
theLower: int
theUpper: int

Return
-------
None

Description
-----------
Constructs a non-initialized vector in the range [theLower..theUpper] 'theLower' and 'theUpper' are the indexes of the lower and upper bounds of the constructed vector.
") math_VectorBase;
		 math_VectorBase(const Standard_Integer theLower, const Standard_Integer theUpper);

		/****** math_VectorBase::math_VectorBase ******/
		/****** md5 signature: 2d03fad9ab30b62c9dcd67c7637e8461 ******/
		%feature("compactdefaultargs") math_VectorBase;
		%feature("autodoc", "
Parameters
----------
theLower: int
theUpper: int
theInitialValue: TheItemType

Return
-------
None

Description
-----------
Constructs a vector in the range [theLower..theUpper] whose values are all initialized with the value 'theInitialValue'.
") math_VectorBase;
		 math_VectorBase(const Standard_Integer theLower, const Standard_Integer theUpper, const TheItemType theInitialValue);

		/****** math_VectorBase::math_VectorBase ******/
		/****** md5 signature: 0f2151b4c598679afa77d119814cb20a ******/
		%feature("compactdefaultargs") math_VectorBase;
		%feature("autodoc", "
Parameters
----------
theTab: TheItemType *
theLower: int
theUpper: int

Return
-------
None

Description
-----------
Constructs a vector in the range [theLower..theUpper] whose values are all initialized with the value 'theInitialValue'.
") math_VectorBase;
		 math_VectorBase(const TheItemType * theTab, const Standard_Integer theLower, const Standard_Integer theUpper);

		/****** math_VectorBase::math_VectorBase ******/
		/****** md5 signature: 1a770cae0421dedd586122ec2fab579a ******/
		%feature("compactdefaultargs") math_VectorBase;
		%feature("autodoc", "
Parameters
----------
Other: gp_XY

Return
-------
None

Description
-----------
Constructor for converting gp_XY to math_VectorBase.
") math_VectorBase;
		 math_VectorBase(const gp_XY & Other);

		/****** math_VectorBase::math_VectorBase ******/
		/****** md5 signature: 14142c413558f31e3a412a73f8d54dae ******/
		%feature("compactdefaultargs") math_VectorBase;
		%feature("autodoc", "
Parameters
----------
Other: gp_XYZ

Return
-------
None

Description
-----------
Constructor for converting gp_XYZ to math_VectorBase.
") math_VectorBase;
		 math_VectorBase(const gp_XYZ & Other);

		/****** math_VectorBase::math_VectorBase ******/
		/****** md5 signature: d18900ccf21bb37ad65886a18ac2d697 ******/
		%feature("compactdefaultargs") math_VectorBase;
		%feature("autodoc", "
Parameters
----------
theOther: math_VectorBase

Return
-------
None

Description
-----------
Constructs a copy for initialization. An exception is raised if the lengths of the vectors are different.
") math_VectorBase;
		 math_VectorBase(const math_VectorBase & theOther);

		/****** math_VectorBase::Add ******/
		/****** md5 signature: 406ad6a980d99822c293c6e3a9d4cb70 ******/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
theRight: math_VectorBase

Return
-------
None

Description
-----------
adds the vector 'theRight' to a vector. An exception is raised if the vectors have not the same length. Warning In order to avoid time-consuming copying of vectors, it is preferable to use operator += or the function Add whenever possible.
") Add;
		void Add(const math_VectorBase & theRight);

		/****** math_VectorBase::Add ******/
		/****** md5 signature: 640c27ff88206df2d3ad3ceea356dedc ******/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
theLeft: math_VectorBase
theRight: math_VectorBase

Return
-------
None

Description
-----------
sets a vector to the sum of the vector 'theLeft' and the vector 'theRight'. An exception is raised if the lengths are different.
") Add;
		void Add(const math_VectorBase & theLeft, const math_VectorBase & theRight);

		/****** math_VectorBase::Added ******/
		/****** md5 signature: c3351e889dda3cb36cc692883cc3fb3c ******/
		%feature("compactdefaultargs") Added;
		%feature("autodoc", "
Parameters
----------
theRight: math_VectorBase

Return
-------
math_VectorBase

Description
-----------
Returns new vector as adding current vector with the value 'theRight'. An exception is raised if the vectors do not have the same length. An exception is raised if the lengths are not equal.
") Added;
		math_VectorBase Added(const math_VectorBase & theRight);

		/****** math_VectorBase::Divide ******/
		/****** md5 signature: 4c38226132921225dc3efb92899de892 ******/
		%feature("compactdefaultargs") Divide;
		%feature("autodoc", "
Parameters
----------
theRight: TheItemType

Return
-------
None

Description
-----------
divides a vector by the value 'theRight'. An exception is raised if 'theRight' = 0.
") Divide;
		void Divide(const TheItemType theRight);

		/****** math_VectorBase::Divided ******/
		/****** md5 signature: 41a1c2fa8886e8bff755ba30a36c75d3 ******/
		%feature("compactdefaultargs") Divided;
		%feature("autodoc", "
Parameters
----------
theRight: TheItemType

Return
-------
math_VectorBase

Description
-----------
Returns new vector as dividing current vector with the value 'theRight'. An exception is raised if 'theRight' = 0.
") Divided;
		math_VectorBase Divided(const TheItemType theRight);

		/****** math_VectorBase::Dump ******/
		/****** md5 signature: 35eee087c3e3933aebbdeb4f86b6bc00 ******/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "
Parameters
----------

Return
-------
theO: Standard_OStream

Description
-----------
Prints information on the current state of the object. Is used to redefine the operator <<.
") Dump;
		void Dump(std::ostream &OutValue);

		/****** math_VectorBase::Init ******/
		/****** md5 signature: a0223922650b6ede02b379a08b9c110b ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
theInitialValue: TheItemType

Return
-------
None

Description
-----------
Initialize all the elements of a vector with 'theInitialValue'.
") Init;
		void Init(const TheItemType theInitialValue);

		/****** math_VectorBase::Initialized ******/
		/****** md5 signature: f12410610a77ebebcfb2e36b8f1704d1 ******/
		%feature("compactdefaultargs") Initialized;
		%feature("autodoc", "
Parameters
----------
theOther: math_VectorBase

Return
-------
math_VectorBase

Description
-----------
Initialises a vector by copying 'theOther'. An exception is raised if the Lengths are different.
") Initialized;
		math_VectorBase & Initialized(const math_VectorBase & theOther);

		/****** math_VectorBase::Inverse ******/
		/****** md5 signature: 2fb034194d4b55ea5739f844697023bc ******/
		%feature("compactdefaultargs") Inverse;
		%feature("autodoc", "Return
-------
math_VectorBase

Description
-----------
Inverts this vector and creates a new vector.
") Inverse;
		math_VectorBase Inverse();

		/****** math_VectorBase::Invert ******/
		/****** md5 signature: 9a8aecae0e33749c0966f8f73d6470a3 ******/
		%feature("compactdefaultargs") Invert;
		%feature("autodoc", "Return
-------
None

Description
-----------
Inverts this vector and assigns the result to this vector.
") Invert;
		void Invert();

		/****** math_VectorBase::Length ******/
		/****** md5 signature: 6b6369fdcfb9287d25c91be73ca43a4f ******/
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the length of a vector.
") Length;
		Standard_Integer Length();

		/****** math_VectorBase::Lower ******/
		/****** md5 signature: 6c38bb0c1489e359c874ded75054c1be ******/
		%feature("compactdefaultargs") Lower;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the lower index of the vector.
") Lower;
		Standard_Integer Lower();

		/****** math_VectorBase::Max ******/
		/****** md5 signature: 47905521473c8d5ef278f16432367e67 ******/
		%feature("compactdefaultargs") Max;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the index of the maximum element of a vector. (first found).
") Max;
		Standard_Integer Max();

		/****** math_VectorBase::Min ******/
		/****** md5 signature: 9ee266bc01938069e46d023cc25e59f0 ******/
		%feature("compactdefaultargs") Min;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the index of the minimum element of a vector. (first found).
") Min;
		Standard_Integer Min();

		/****** math_VectorBase::Multiplied ******/
		/****** md5 signature: 76e6ff92fc8b61378a2e9df99fc75405 ******/
		%feature("compactdefaultargs") Multiplied;
		%feature("autodoc", "
Parameters
----------
theRight: TheItemType

Return
-------
math_VectorBase

Description
-----------
returns the product of a vector and a real value.
") Multiplied;
		math_VectorBase Multiplied(const TheItemType theRight);

		/****** math_VectorBase::Multiplied ******/
		/****** md5 signature: 75cb970c73bc29d38fb2f128bafec327 ******/
		%feature("compactdefaultargs") Multiplied;
		%feature("autodoc", "
Parameters
----------
theRight: math_VectorBase

Return
-------
TheItemType

Description
-----------
returns the inner product of 2 vectors. An exception is raised if the lengths are not equal.
") Multiplied;
		TheItemType Multiplied(const math_VectorBase & theRight);

		/****** math_VectorBase::Multiplied ******/
		/****** md5 signature: 10ad2b0e6a89e08058ee0f39ff893d49 ******/
		%feature("compactdefaultargs") Multiplied;
		%feature("autodoc", "
Parameters
----------
theRight: math_Matrix

Return
-------
math_VectorBase

Description
-----------
returns the product of a vector by a matrix.
") Multiplied;
		math_VectorBase Multiplied(const math_Matrix & theRight);

		/****** math_VectorBase::Multiply ******/
		/****** md5 signature: b9f27f49a3f6736805012129156c9d9d ******/
		%feature("compactdefaultargs") Multiply;
		%feature("autodoc", "
Parameters
----------
theRight: TheItemType

Return
-------
None

Description
-----------
Updates current vector by multiplying each element on current value.
") Multiply;
		void Multiply(const TheItemType theRight);

		/****** math_VectorBase::Multiply ******/
		/****** md5 signature: c2795ae734d8e01d57e2a78af486b449 ******/
		%feature("compactdefaultargs") Multiply;
		%feature("autodoc", "
Parameters
----------
theLeft: math_VectorBase
theRight: math_Matrix

Return
-------
None

Description
-----------
sets a vector to the product of the vector 'theLeft' with the matrix 'theRight'.
") Multiply;
		void Multiply(const math_VectorBase & theLeft, const math_Matrix & theRight);

		/****** math_VectorBase::Multiply ******/
		/****** md5 signature: 31c76d87f171ace0160968d13426b791 ******/
		%feature("compactdefaultargs") Multiply;
		%feature("autodoc", "
Parameters
----------
theLeft: math_Matrix
theRight: math_VectorBase

Return
-------
None

Description
-----------
sets a vector to the product of the matrix 'theLeft' with the vector 'theRight'.
") Multiply;
		void Multiply(const math_Matrix & theLeft, const math_VectorBase & theRight);

		/****** math_VectorBase::Multiply ******/
		/****** md5 signature: 8cad65698ed17e73c4dea7fe27d379e3 ******/
		%feature("compactdefaultargs") Multiply;
		%feature("autodoc", "
Parameters
----------
theLeft: TheItemType
theRight: math_VectorBase

Return
-------
None

Description
-----------
returns the multiplication of a real by a vector. 'me' = 'theLeft' * 'theRight'.
") Multiply;
		void Multiply(const TheItemType theLeft, const math_VectorBase & theRight);

		/****** math_VectorBase::Norm ******/
		/****** md5 signature: 6dc5ad9590bf60f4194e824ee34dfd92 ******/
		%feature("compactdefaultargs") Norm;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the value or the square of the norm of this vector.
") Norm;
		Standard_Real Norm();

		/****** math_VectorBase::Norm2 ******/
		/****** md5 signature: 015f3c35df9e248d3352ccc59186890c ******/
		%feature("compactdefaultargs") Norm2;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the value of the square of the norm of a vector.
") Norm2;
		Standard_Real Norm2();

		/****** math_VectorBase::Normalize ******/
		/****** md5 signature: fb41beeacae8c73221eb233b282f51e2 ******/
		%feature("compactdefaultargs") Normalize;
		%feature("autodoc", "Return
-------
None

Description
-----------
Normalizes this vector (the norm of the result is equal to 1.0) and assigns the result to this vector Exceptions Standard_NullValue if this vector is null (i.e. if its norm is less than or equal to Standard_Real::RealEpsilon().
") Normalize;
		void Normalize();

		/****** math_VectorBase::Normalized ******/
		/****** md5 signature: 2b064f64c103c167de66f0764377c508 ******/
		%feature("compactdefaultargs") Normalized;
		%feature("autodoc", "Return
-------
math_VectorBase

Description
-----------
Normalizes this vector (the norm of the result is equal to 1.0) and creates a new vector Exceptions Standard_NullValue if this vector is null (i.e. if its norm is less than or equal to Standard_Real::RealEpsilon().
") Normalized;
		math_VectorBase Normalized();

		/****** math_VectorBase::Opposite ******/
		/****** md5 signature: d5552f58a791312c2d11b926119859a7 ******/
		%feature("compactdefaultargs") Opposite;
		%feature("autodoc", "Return
-------
math_VectorBase

Description
-----------
returns the opposite of a vector.
") Opposite;
		math_VectorBase Opposite();

		/****** math_VectorBase::Set ******/
		/****** md5 signature: 830a48b15d65db27497e146bf86f4516 ******/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
theI1: int
theI2: int
theV: math_VectorBase

Return
-------
None

Description
-----------
sets a vector from 'theI1' to 'theI2' to the vector 'theV'; An exception is raised if 'theI1' is less than 'LowerIndex' or 'theI2' is greater than 'UpperIndex' or 'theI1' is greater than 'theI2'. An exception is raised if 'theI2-theI1+1' is different from the 'Length' of 'theV'.
") Set;
		void Set(const Standard_Integer theI1, const Standard_Integer theI2, const math_VectorBase & theV);

		/****** math_VectorBase::Slice ******/
		/****** md5 signature: 8c4254c203c7c45e0b179a38d2dbc99e ******/
		%feature("compactdefaultargs") Slice;
		%feature("autodoc", "
Parameters
----------
theI1: int
theI2: int

Return
-------
math_VectorBase

Description
-----------
Creates a new vector by inverting the values of this vector between indexes 'theI1' and 'theI2'. If the values of this vector were (1., 2., 3., 4.,5., 6.), by slicing it between indexes 2 and 5 the values of the resulting vector are (1., 5., 4., 3., 2., 6.).
") Slice;
		math_VectorBase Slice(const Standard_Integer theI1, const Standard_Integer theI2);

		/****** math_VectorBase::Subtract ******/
		/****** md5 signature: b32c188ee5360b0cd12b1b6672df7e79 ******/
		%feature("compactdefaultargs") Subtract;
		%feature("autodoc", "
Parameters
----------
theLeft: math_VectorBase
theRight: math_VectorBase

Return
-------
None

Description
-----------
sets a vector to the Subtraction of the vector theRight from the vector theLeft. An exception is raised if the vectors have not the same length. Warning In order to avoid time-consuming copying of vectors, it is preferable to use operator -= or the function Subtract whenever possible.
") Subtract;
		void Subtract(const math_VectorBase & theLeft, const math_VectorBase & theRight);

		/****** math_VectorBase::Subtract ******/
		/****** md5 signature: 4f0daa1e70b1e132b8c9b9a8d52ccd39 ******/
		%feature("compactdefaultargs") Subtract;
		%feature("autodoc", "
Parameters
----------
theRight: math_VectorBase

Return
-------
None

Description
-----------
returns the subtraction of 'theRight' from 'me'. An exception is raised if the vectors have not the same length.
") Subtract;
		void Subtract(const math_VectorBase & theRight);

		/****** math_VectorBase::Subtracted ******/
		/****** md5 signature: a61fbab5df591d9b1e911c61d9a33a2a ******/
		%feature("compactdefaultargs") Subtracted;
		%feature("autodoc", "
Parameters
----------
theRight: math_VectorBase

Return
-------
math_VectorBase

Description
-----------
returns the subtraction of 'theRight' from 'me'. An exception is raised if the vectors have not the same length.
") Subtracted;
		math_VectorBase Subtracted(const math_VectorBase & theRight);

		/****** math_VectorBase::TMultiplied ******/
		/****** md5 signature: 678f7a48be8d557310f69d186c1254f5 ******/
		%feature("compactdefaultargs") TMultiplied;
		%feature("autodoc", "
Parameters
----------
theRight: TheItemType

Return
-------
math_VectorBase

Description
-----------
returns the product of a vector and a real value.
") TMultiplied;
		math_VectorBase TMultiplied(const TheItemType theRight);

		/****** math_VectorBase::TMultiply ******/
		/****** md5 signature: 2805d50d59fefec5c37586eaba852930 ******/
		%feature("compactdefaultargs") TMultiply;
		%feature("autodoc", "
Parameters
----------
theTLeft: math_Matrix
theRight: math_VectorBase

Return
-------
None

Description
-----------
sets a vector to the product of the transpose of the matrix 'theTLeft' by the vector 'theRight'.
") TMultiply;
		void TMultiply(const math_Matrix & theTLeft, const math_VectorBase & theRight);

		/****** math_VectorBase::TMultiply ******/
		/****** md5 signature: f516d448889e1ae7326efd958a1dbd12 ******/
		%feature("compactdefaultargs") TMultiply;
		%feature("autodoc", "
Parameters
----------
theLeft: math_VectorBase
theTRight: math_Matrix

Return
-------
None

Description
-----------
sets a vector to the product of the vector 'theLeft' by the transpose of the matrix 'theTRight'.
") TMultiply;
		void TMultiply(const math_VectorBase & theLeft, const math_Matrix & theTRight);

		/****** math_VectorBase::Upper ******/
		/****** md5 signature: 049ea67a2fce112afef7cc7f87f4a43d ******/
		%feature("compactdefaultargs") Upper;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the upper index of the vector.
") Upper;
		Standard_Integer Upper();

		/****** math_VectorBase::Value ******/
		/****** md5 signature: 6dee698cd6f46f729700853e54d6930f ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
theNum: int

Return
-------
TheItemType

Description
-----------
accesses the value of index 'theNum' of a vector.
") Value;
		const TheItemType & Value(const Standard_Integer theNum);

		/****** math_VectorBase::Value ******/
		/****** md5 signature: f417184bccf4dce48f252e224d5df03e ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
theNum: int

Return
-------
TheItemType

Description
-----------
accesses (in read or write mode) the value of index 'theNum' of a vector.
") Value;
		TheItemType & Value(const Standard_Integer theNum);

		/****** math_VectorBase::operator * ******/
		/****** md5 signature: 8dfcf1e91fc509d4a307b07a5bca2638 ******/
		%feature("compactdefaultargs") operator *;
		%feature("autodoc", "
Parameters
----------
theRight: TheItemType

Return
-------
math_VectorBase

Description
-----------
No available documentation.
") operator *;
		math_VectorBase operator *(const TheItemType theRight);

		/****** math_VectorBase::operator * ******/
		/****** md5 signature: fda9687607ed3a7eea56e85639fa4ce8 ******/
		%feature("compactdefaultargs") operator *;
		%feature("autodoc", "
Parameters
----------
theRight: math_VectorBase

Return
-------
TheItemType

Description
-----------
No available documentation.
") operator *;
		TheItemType operator *(const math_VectorBase & theRight);

		/****** math_VectorBase::operator * ******/
		/****** md5 signature: 138b8b1209dec3f877e1eb092ad470f7 ******/
		%feature("compactdefaultargs") operator *;
		%feature("autodoc", "
Parameters
----------
theRight: math_Matrix

Return
-------
math_VectorBase

Description
-----------
No available documentation.
") operator *;
		math_VectorBase operator *(const math_Matrix & theRight);


%extend{
    void __imul_wrapper__(const TheItemType other) {
    *self *= other;
    }
}
%pythoncode {
def __imul__(self, right):
    self.__imul_wrapper__(right)
    return self
}
		/****** math_VectorBase::operator + ******/
		/****** md5 signature: 95089290e7711a5bf90619699b701c2e ******/
		%feature("compactdefaultargs") operator +;
		%feature("autodoc", "
Parameters
----------
theRight: math_VectorBase

Return
-------
math_VectorBase

Description
-----------
No available documentation.
") operator +;
		math_VectorBase operator +(const math_VectorBase & theRight);


%extend{
    void __iadd_wrapper__(const math_VectorBase other) {
    *self += other;
    }
}
%pythoncode {
def __iadd__(self, right):
    self.__iadd_wrapper__(right)
    return self
}
		/****** math_VectorBase::operator - ******/
		/****** md5 signature: 57aafa6ca11843dd9f4862a50a2f234b ******/
		%feature("compactdefaultargs") operator -;
		%feature("autodoc", "Return
-------
math_VectorBase

Description
-----------
No available documentation.
") operator -;
		math_VectorBase operator -();

		/****** math_VectorBase::operator - ******/
		/****** md5 signature: f36827c7b63741cabac85d1c6aaaee3f ******/
		%feature("compactdefaultargs") operator -;
		%feature("autodoc", "
Parameters
----------
theRight: math_VectorBase

Return
-------
math_VectorBase

Description
-----------
No available documentation.
") operator -;
		math_VectorBase operator -(const math_VectorBase & theRight);


%extend{
    void __isub_wrapper__(const math_VectorBase other) {
    *self -= other;
    }
}
%pythoncode {
def __isub__(self, right):
    self.__isub_wrapper__(right)
    return self
}
		/****** math_VectorBase::operator / ******/
		/****** md5 signature: c4cf88a6a3686a711cc3c45185eec507 ******/
		%feature("compactdefaultargs") operator /;
		%feature("autodoc", "
Parameters
----------
theRight: TheItemType

Return
-------
math_VectorBase

Description
-----------
No available documentation.
") operator /;
		math_VectorBase operator /(const TheItemType theRight);


%extend{
    void __itruediv_wrapper__(const TheItemType other) {
    *self /= other;
    }
}
%pythoncode {
def __itruediv__(self, right):
    self.__itruediv_wrapper__(right)
    return self
}
};


%extend math_VectorBase {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************************
* class math_FunctionSetWithDerivatives *
****************************************/
%nodefaultctor math_FunctionSetWithDerivatives;
class math_FunctionSetWithDerivatives : public math_FunctionSet {
	public:
		/****** math_FunctionSetWithDerivatives::Derivatives ******/
		/****** md5 signature: 91510de453ada53b30c3a8ed85022935 ******/
		%feature("compactdefaultargs") Derivatives;
		%feature("autodoc", "
Parameters
----------
X: math_Vector
D: math_Matrix

Return
-------
bool

Description
-----------
Returns the values <D> of the derivatives for the variable <X>. Returns True if the computation was done successfully, False otherwise.
") Derivatives;
		virtual Standard_Boolean Derivatives(const math_Vector & X, math_Matrix & D);

		/****** math_FunctionSetWithDerivatives::NbEquations ******/
		/****** md5 signature: ba4fd9483f383d968d2ec54d4ae3fbf1 ******/
		%feature("compactdefaultargs") NbEquations;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of equations of the function.
") NbEquations;
		virtual Standard_Integer NbEquations();

		/****** math_FunctionSetWithDerivatives::NbVariables ******/
		/****** md5 signature: 9592108ebf305562827d51d05d64eecc ******/
		%feature("compactdefaultargs") NbVariables;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of variables of the function.
") NbVariables;
		virtual Standard_Integer NbVariables();

		/****** math_FunctionSetWithDerivatives::Value ******/
		/****** md5 signature: fbdd70146ff924dbae65883aeb76c6f7 ******/
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
Computes the values <F> of the Functions for the variable <X>. Returns True if the computation was done successfully, False otherwise.
") Value;
		virtual Standard_Boolean Value(const math_Vector & X, math_Vector & F);

		/****** math_FunctionSetWithDerivatives::Values ******/
		/****** md5 signature: 4dca620a1b80d0862f0bc5ceb7679845 ******/
		%feature("compactdefaultargs") Values;
		%feature("autodoc", "
Parameters
----------
X: math_Vector
F: math_Vector
D: math_Matrix

Return
-------
bool

Description
-----------
returns the values <F> of the functions and the derivatives <D> for the variable <X>. Returns True if the computation was done successfully, False otherwise.
") Values;
		virtual Standard_Boolean Values(const math_Vector & X, math_Vector & F, math_Matrix & D);

};


%extend math_FunctionSetWithDerivatives {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************************
* class math_FunctionWithDerivative *
************************************/
%nodefaultctor math_FunctionWithDerivative;
class math_FunctionWithDerivative : public math_Function {
	public:
		/****** math_FunctionWithDerivative::Derivative ******/
		/****** md5 signature: 40ab57db3219619aba9b35535ca68e03 ******/
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
Computes the derivative <D> of the function for the variable <X>. Returns True if the calculation were successfully done, False otherwise.
") Derivative;
		virtual Standard_Boolean Derivative(const Standard_Real X, Standard_Real &OutValue);

		/****** math_FunctionWithDerivative::Value ******/
		/****** md5 signature: 4743230a1413804c068db1aa9417569d ******/
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
Computes the value <F>of the function for the variable <X>. Returns True if the calculation were successfully done, False otherwise.
") Value;
		virtual Standard_Boolean Value(const Standard_Real X, Standard_Real &OutValue);

		/****** math_FunctionWithDerivative::Values ******/
		/****** md5 signature: eaa75d14c72df373abc3e87e5a083867 ******/
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
Computes the value <F> and the derivative <D> of the function for the variable <X>. Returns True if the calculation were successfully done, False otherwise.
") Values;
		virtual Standard_Boolean Values(const Standard_Real X, Standard_Real &OutValue, Standard_Real &OutValue);

};


%extend math_FunctionWithDerivative {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************************
* class math_MultipleVarFunctionWithGradient *
*********************************************/
%nodefaultctor math_MultipleVarFunctionWithGradient;
class math_MultipleVarFunctionWithGradient : public math_MultipleVarFunction {
	public:
		/****** math_MultipleVarFunctionWithGradient::Gradient ******/
		/****** md5 signature: e0bc7ea3007ece37bf4721c0d5ae82b7 ******/
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
Computes the gradient <G> of the functions for the variable <X>. Returns True if the computation was done successfully, False otherwise.
") Gradient;
		virtual Standard_Boolean Gradient(const math_Vector & X, math_Vector & G);

		/****** math_MultipleVarFunctionWithGradient::NbVariables ******/
		/****** md5 signature: 9592108ebf305562827d51d05d64eecc ******/
		%feature("compactdefaultargs") NbVariables;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of variables of the function.
") NbVariables;
		virtual Standard_Integer NbVariables();

		/****** math_MultipleVarFunctionWithGradient::Value ******/
		/****** md5 signature: e09b772d60bf0c815be5e84388582a5f ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
X: math_Vector

Return
-------
F: float

Description
-----------
Computes the values of the Functions <F> for the variable <X>. Returns True if the computation was done successfully, False otherwise.
") Value;
		virtual Standard_Boolean Value(const math_Vector & X, Standard_Real &OutValue);

		/****** math_MultipleVarFunctionWithGradient::Values ******/
		/****** md5 signature: ef61fe0ba1a3ca66590ca01b8b3bae9a ******/
		%feature("compactdefaultargs") Values;
		%feature("autodoc", "
Parameters
----------
X: math_Vector
G: math_Vector

Return
-------
F: float

Description
-----------
computes the value <F> and the gradient <G> of the functions for the variable <X>. Returns True if the computation was done successfully, False otherwise.
") Values;
		virtual Standard_Boolean Values(const math_Vector & X, Standard_Real &OutValue, math_Vector & G);

};


%extend math_MultipleVarFunctionWithGradient {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************************
* class math_MultipleVarFunctionWithHessian *
********************************************/
%nodefaultctor math_MultipleVarFunctionWithHessian;
class math_MultipleVarFunctionWithHessian : public math_MultipleVarFunctionWithGradient {
	public:
		/****** math_MultipleVarFunctionWithHessian::Gradient ******/
		/****** md5 signature: e0bc7ea3007ece37bf4721c0d5ae82b7 ******/
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
computes the gradient <G> of the functions for the variable <X>. Returns True if the computation was done successfully, False otherwise.
") Gradient;
		virtual Standard_Boolean Gradient(const math_Vector & X, math_Vector & G);

		/****** math_MultipleVarFunctionWithHessian::NbVariables ******/
		/****** md5 signature: 9592108ebf305562827d51d05d64eecc ******/
		%feature("compactdefaultargs") NbVariables;
		%feature("autodoc", "Return
-------
int

Description
-----------
returns the number of variables of the function.
") NbVariables;
		virtual Standard_Integer NbVariables();

		/****** math_MultipleVarFunctionWithHessian::Value ******/
		/****** md5 signature: e09b772d60bf0c815be5e84388582a5f ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
X: math_Vector

Return
-------
F: float

Description
-----------
computes the values of the Functions <F> for the variable <X>. Returns True if the computation was done successfully, False otherwise.
") Value;
		virtual Standard_Boolean Value(const math_Vector & X, Standard_Real &OutValue);

		/****** math_MultipleVarFunctionWithHessian::Values ******/
		/****** md5 signature: ef61fe0ba1a3ca66590ca01b8b3bae9a ******/
		%feature("compactdefaultargs") Values;
		%feature("autodoc", "
Parameters
----------
X: math_Vector
G: math_Vector

Return
-------
F: float

Description
-----------
computes the value <F> and the gradient <G> of the functions for the variable <X>. Returns True if the computation was done successfully, False otherwise.
") Values;
		virtual Standard_Boolean Values(const math_Vector & X, Standard_Real &OutValue, math_Vector & G);

		/****** math_MultipleVarFunctionWithHessian::Values ******/
		/****** md5 signature: b7ff4bd8ea7684f523e0627cf93c1752 ******/
		%feature("compactdefaultargs") Values;
		%feature("autodoc", "
Parameters
----------
X: math_Vector
G: math_Vector
H: math_Matrix

Return
-------
F: float

Description
-----------
computes the value <F>, the gradient <G> and the hessian <H> of the functions for the variable <X>. Returns True if the computation was done successfully, False otherwise.
") Values;
		virtual Standard_Boolean Values(const math_Vector & X, Standard_Real &OutValue, math_Vector & G, math_Matrix & H);

};


%extend math_MultipleVarFunctionWithHessian {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************************
* class math_TrigonometricEquationFunction *
*******************************************/
class math_TrigonometricEquationFunction : public math_FunctionWithDerivative {
	public:
		/****** math_TrigonometricEquationFunction::math_TrigonometricEquationFunction ******/
		/****** md5 signature: 141c3811e3d80f125700d93b57169917 ******/
		%feature("compactdefaultargs") math_TrigonometricEquationFunction;
		%feature("autodoc", "
Parameters
----------
A: float
B: float
C: float
D: float
E: float

Return
-------
None

Description
-----------
No available documentation.
") math_TrigonometricEquationFunction;
		 math_TrigonometricEquationFunction(const Standard_Real A, const Standard_Real B, const Standard_Real C, const Standard_Real D, const Standard_Real E);

		/****** math_TrigonometricEquationFunction::Derivative ******/
		/****** md5 signature: fbad9244af593cced88564a1c61facc9 ******/
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
No available documentation.
") Derivative;
		Standard_Boolean Derivative(const Standard_Real X, Standard_Real &OutValue);

		/****** math_TrigonometricEquationFunction::Value ******/
		/****** md5 signature: f9554f9cb760d260e7457d0979cf74e6 ******/
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
No available documentation.
") Value;
		Standard_Boolean Value(const Standard_Real X, Standard_Real &OutValue);

		/****** math_TrigonometricEquationFunction::Values ******/
		/****** md5 signature: 6988fca4824de7b40b37d6540b751f8f ******/
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
No available documentation.
") Values;
		Standard_Boolean Values(const Standard_Real X, Standard_Real &OutValue, Standard_Real &OutValue);

};


%extend math_TrigonometricEquationFunction {
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
def math_GaussPoints(*args):
	return math.GaussPoints(*args)

@deprecated
def math_GaussPointsMax(*args):
	return math.GaussPointsMax(*args)

@deprecated
def math_GaussWeights(*args):
	return math.GaussWeights(*args)

@deprecated
def math_KronrodPointsAndWeights(*args):
	return math.KronrodPointsAndWeights(*args)

@deprecated
def math_KronrodPointsMax(*args):
	return math.KronrodPointsMax(*args)

@deprecated
def math_OrderedGaussPointsAndWeights(*args):
	return math.OrderedGaussPointsAndWeights(*args)

@deprecated
def math_KronrodSingleIntegration_GKRule(*args):
	return math_KronrodSingleIntegration.GKRule(*args)

}
