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
%define MATHDOCSTRING
"math module, see official documentation at
https://dev.opencascade.org/doc/occt-7.9.0/refman/html/package_math.html"
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
		/****** md5 signature: 7878720091a3bc0955872c7ee0afff1d ******/
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
		static void GaussPoints(const int Index, math_Vector & Points);

		/****** math::GaussPointsMax ******/
		/****** md5 signature: 8be136483232cd7068b5af8cdf497dbf ******/
		%feature("compactdefaultargs") GaussPointsMax;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") GaussPointsMax;
		static int GaussPointsMax();

		/****** math::GaussWeights ******/
		/****** md5 signature: 17376f6b5e3ca09c596dcc8ff0af015a ******/
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
		static void GaussWeights(const int Index, math_Vector & Weights);

		/****** math::KronrodPointsAndWeights ******/
		/****** md5 signature: 76a7a11d45665f10beb9653c9053ea9c ******/
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
Returns a vector of Kronrod points and a vector of their weights for Gauss-Kronrod computation method. Index should be odd and greater then or equal to 3, as the number of Kronrod points is equal to 2*N + 1, where N is a number of Gauss points. Points and Weights should have the size equal to Index. Each even element of Points represents a Gauss point value of N-th Gauss quadrature. The values from Index equal to 3 to 123 are stored in a table (see the file math_Kronrod.cxx). If Index is greater, then points and weights will be computed. Returns true if Index is odd, it is equal to the size of Points and Weights and the computation of Points and Weights is performed successfully. Otherwise this method returns false.
") KronrodPointsAndWeights;
		static bool KronrodPointsAndWeights(const int Index, math_Vector & Points, math_Vector & Weights);

		/****** math::KronrodPointsMax ******/
		/****** md5 signature: b002dbabad440ea7ee76e8b4c59bed70 ******/
		%feature("compactdefaultargs") KronrodPointsMax;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the maximal number of points for that the values are stored in the table. If the number is greater then KronrodPointsMax, the points will be computed.
") KronrodPointsMax;
		static int KronrodPointsMax();

		/****** math::OrderedGaussPointsAndWeights ******/
		/****** md5 signature: 69e33f005d50b4bd7dcc046b3514372f ******/
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
Returns a vector of Gauss points and a vector of their weights. The difference with the method GaussPoints is the following: - the points are returned in increasing order. - if Index is greater then GaussPointsMax, the points are computed. Returns true if Index is positive, Points' and Weights' length is equal to Index, Points and Weights are successfully computed.
") OrderedGaussPointsAndWeights;
		static bool OrderedGaussPointsAndWeights(const int Index, math_Vector & Points, math_Vector & Weights);

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
		/****** md5 signature: 6cbe423d101db078979a5ff6cde9ca9e ******/
		%feature("compactdefaultargs") math_BFGS;
		%feature("autodoc", "
Parameters
----------
NbVariables: int
Tolerance: double (optional, default to 1.0e-8)
NbIterations: int (optional, default to 200)
ZEPS: double (optional, default to 1.0e-12)

Return
-------
None

Description
-----------
Initializes the computation of the minimum of a function with NbVariables. Tolerance, ZEPS and NbIterations are described in the method Perform. Warning: A call to the Perform method must be made after this initialization to effectively compute the minimum of the function F.
") math_BFGS;
		 math_BFGS(const int NbVariables, const double Tolerance = 1.0e-8, const int NbIterations = 200, const double ZEPS = 1.0e-12);

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
		/****** md5 signature: 1e1ad145af7d8c16b253ee9a4b0d6a43 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if the computations are successful, otherwise returns false.
") IsDone;
		bool IsDone();

		/****** math_BFGS::IsSolutionReached ******/
		/****** md5 signature: d7a985ec68666f7192ec714ba43273fc ******/
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
		virtual bool IsSolutionReached(math_MultipleVarFunctionWithGradient & F);

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
		/****** md5 signature: 1125a6878024188eb4b06b555c7d51ea ******/
		%feature("compactdefaultargs") Minimum;
		%feature("autodoc", "Return
-------
double

Description
-----------
returns the value of the minimum. Exception NotDone is raised if the minimum was not found.
") Minimum;
		double Minimum();

		/****** math_BFGS::NbIterations ******/
		/****** md5 signature: e2122843ad4b16fe4df700a084f7f785 ******/
		%feature("compactdefaultargs") NbIterations;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of iterations really done in the calculation of the minimum. The exception NotDone is raised if the minimum was not found.
") NbIterations;
		int NbIterations();

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
		/****** md5 signature: 06d2093cdcc0ff7b28a59cb282ab6620 ******/
		%feature("compactdefaultargs") math_BissecNewton;
		%feature("autodoc", "
Parameters
----------
theXTolerance: double

Return
-------
None

Description
-----------
Constructor. 
Parameter theXTolerance - algorithm tolerance.
") math_BissecNewton;
		 math_BissecNewton(const double theXTolerance);

		/****** math_BissecNewton::Derivative ******/
		/****** md5 signature: ad7aa922d44855788fc0f7a4658094e3 ******/
		%feature("compactdefaultargs") Derivative;
		%feature("autodoc", "Return
-------
double

Description
-----------
returns the value of the derivative at the root. Exception NotDone is raised if the minimum was not found.
") Derivative;
		double Derivative();

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
		/****** md5 signature: 1e1ad145af7d8c16b253ee9a4b0d6a43 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Tests is the root has been successfully found.
") IsDone;
		bool IsDone();

		/****** math_BissecNewton::IsSolutionReached ******/
		/****** md5 signature: 32544e3f4fd013052487e62ea1dd325a ******/
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
		virtual bool IsSolutionReached(math_FunctionWithDerivative & theFunction);

		/****** math_BissecNewton::Perform ******/
		/****** md5 signature: 1a1b4674c8a105ccfe8c6e9ef1d6c50b ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
F: math_FunctionWithDerivative
Bound1: double
Bound2: double
NbIterations: int (optional, default to 100)

Return
-------
None

Description
-----------
A combination of Newton-Raphson and bissection methods is done to find the root of the function F between the bounds Bound1 and Bound2 on the function F. The tolerance required on the root is given by TolX. The solution is found when: abs(Xi - Xi-1) <= TolX and F(Xi) * F(Xi-1) <= 0 The maximum number of iterations allowed is given by NbIterations.
") Perform;
		void Perform(math_FunctionWithDerivative & F, const double Bound1, const double Bound2, const int NbIterations = 100);

		/****** math_BissecNewton::Root ******/
		/****** md5 signature: 4cac472ec2e8bbc115a694c59e4b1b4e ******/
		%feature("compactdefaultargs") Root;
		%feature("autodoc", "Return
-------
double

Description
-----------
returns the value of the root. Exception NotDone is raised if the minimum was not found.
") Root;
		double Root();

		/****** math_BissecNewton::Value ******/
		/****** md5 signature: dbdf6d9f5299cb6ef730d686d81d15db ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Return
-------
double

Description
-----------
returns the value of the function at the root. Exception NotDone is raised if the minimum was not found.
") Value;
		double Value();

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
		/****** md5 signature: b0bc261701353a54c064db4084536499 ******/
		%feature("compactdefaultargs") math_BracketMinimum;
		%feature("autodoc", "
Parameters
----------
A: double
B: double

Return
-------
None

Description
-----------
Constructor preparing A and B parameters only. It does not perform the job.
") math_BracketMinimum;
		 math_BracketMinimum(const double A, const double B);

		/****** math_BracketMinimum::math_BracketMinimum ******/
		/****** md5 signature: 720a1ff500bf04d25927f286fc50f56b ******/
		%feature("compactdefaultargs") math_BracketMinimum;
		%feature("autodoc", "
Parameters
----------
F: math_Function
A: double
B: double

Return
-------
None

Description
-----------
Given two initial values this class computes a bracketing triplet of abscissae Ax, Bx, Cx (such that Bx is between Ax and Cx, F(Bx) is less than both F(Bx) and F(Cx)) the Brent minimization is done on the function F.
") math_BracketMinimum;
		 math_BracketMinimum(math_Function & F, const double A, const double B);

		/****** math_BracketMinimum::math_BracketMinimum ******/
		/****** md5 signature: 5ba16f8112e2411539da4e1b6f755506 ******/
		%feature("compactdefaultargs") math_BracketMinimum;
		%feature("autodoc", "
Parameters
----------
F: math_Function
A: double
B: double
FA: double

Return
-------
None

Description
-----------
Given two initial values this class computes a bracketing triplet of abscissae Ax, Bx, Cx (such that Bx is between Ax and Cx, F(Bx) is less than both F(Bx) and F(Cx)) the Brent minimization is done on the function F. This constructor has to be used if F(A) is known.
") math_BracketMinimum;
		 math_BracketMinimum(math_Function & F, const double A, const double B, const double FA);

		/****** math_BracketMinimum::math_BracketMinimum ******/
		/****** md5 signature: e28b51751166767b54f4ab95d7d5ab55 ******/
		%feature("compactdefaultargs") math_BracketMinimum;
		%feature("autodoc", "
Parameters
----------
F: math_Function
A: double
B: double
FA: double
FB: double

Return
-------
None

Description
-----------
Given two initial values this class computes a bracketing triplet of abscissae Ax, Bx, Cx (such that Bx is between Ax and Cx, F(Bx) is less than both F(Bx) and F(Cx)) the Brent minimization is done on the function F. This constructor has to be used if F(A) and F(B) are known.
") math_BracketMinimum;
		 math_BracketMinimum(math_Function & F, const double A, const double B, const double FA, const double FB);

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
		/****** md5 signature: 669a8a07b8a8c2d6a6f00b3e771b742b ******/
		%feature("compactdefaultargs") FunctionValues;
		%feature("autodoc", "
Parameters
----------

Return
-------
FA: double
FB: double
FC: double

Description
-----------
returns the bracketed triplet function values. Exceptions StdFail_NotDone if the algorithm fails (and IsDone returns false).
") FunctionValues;
		void FunctionValues(Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** math_BracketMinimum::IsDone ******/
		/****** md5 signature: 1e1ad145af7d8c16b253ee9a4b0d6a43 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if the computations are successful, otherwise returns false.
") IsDone;
		bool IsDone();

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
		/****** md5 signature: 75703e536d67285c08855defbdd0005b ******/
		%feature("compactdefaultargs") SetFA;
		%feature("autodoc", "
Parameters
----------
theValue: double

Return
-------
None

Description
-----------
Set function value at A.
") SetFA;
		void SetFA(const double theValue);

		/****** math_BracketMinimum::SetFB ******/
		/****** md5 signature: ee3c7203e54f37167f84592a849bc6e4 ******/
		%feature("compactdefaultargs") SetFB;
		%feature("autodoc", "
Parameters
----------
theValue: double

Return
-------
None

Description
-----------
Set function value at B.
") SetFB;
		void SetFB(const double theValue);

		/****** math_BracketMinimum::SetLimits ******/
		/****** md5 signature: 3d301d22b9e3ec97c70dca47f3721f0c ******/
		%feature("compactdefaultargs") SetLimits;
		%feature("autodoc", "
Parameters
----------
theLeft: double
theRight: double

Return
-------
None

Description
-----------
Set limits of the parameter. By default no limits are applied to the parameter change. If no minimum is found in limits then IsDone() will return false. The user is in charge of providing A and B to be in limits.
") SetLimits;
		void SetLimits(const double theLeft, const double theRight);

		/****** math_BracketMinimum::Values ******/
		/****** md5 signature: 0c9195d3c17696468dd50ca3e0ac1c73 ******/
		%feature("compactdefaultargs") Values;
		%feature("autodoc", "
Parameters
----------

Return
-------
A: double
B: double
C: double

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
		/****** md5 signature: 66e8f82e2582873541e77b144e318853 ******/
		%feature("compactdefaultargs") math_BracketedRoot;
		%feature("autodoc", "
Parameters
----------
F: math_Function
Bound1: double
Bound2: double
Tolerance: double
NbIterations: int (optional, default to 100)
ZEPS: double (optional, default to 1.0e-12)

Return
-------
None

Description
-----------
The Brent method is used to find the root of the function F between the bounds Bound1 and Bound2 on the function F. If F(Bound1)*F(Bound2) >0 the Brent method fails. The tolerance required for the root is given by Tolerance. The solution is found when: abs(Xi - Xi-1) <= Tolerance; The maximum number of iterations allowed is given by NbIterations.
") math_BracketedRoot;
		 math_BracketedRoot(math_Function & F, const double Bound1, const double Bound2, const double Tolerance, const int NbIterations = 100, const double ZEPS = 1.0e-12);

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
		/****** md5 signature: 1e1ad145af7d8c16b253ee9a4b0d6a43 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if the computations are successful, otherwise returns false.
") IsDone;
		bool IsDone();

		/****** math_BracketedRoot::NbIterations ******/
		/****** md5 signature: e2122843ad4b16fe4df700a084f7f785 ******/
		%feature("compactdefaultargs") NbIterations;
		%feature("autodoc", "Return
-------
int

Description
-----------
returns the number of iterations really done during the computation of the Root. Exception NotDone is raised if the minimum was not found.
") NbIterations;
		int NbIterations();

		/****** math_BracketedRoot::Root ******/
		/****** md5 signature: 4cac472ec2e8bbc115a694c59e4b1b4e ******/
		%feature("compactdefaultargs") Root;
		%feature("autodoc", "Return
-------
double

Description
-----------
returns the value of the root. Exception NotDone is raised if the minimum was not found.
") Root;
		double Root();

		/****** math_BracketedRoot::Value ******/
		/****** md5 signature: dbdf6d9f5299cb6ef730d686d81d15db ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Return
-------
double

Description
-----------
returns the value of the function at the root. Exception NotDone is raised if the minimum was not found.
") Value;
		double Value();

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
		/****** md5 signature: add6b22eb6d9d9ec8fe05d52df12dc2f ******/
		%feature("compactdefaultargs") math_BrentMinimum;
		%feature("autodoc", "
Parameters
----------
TolX: double
NbIterations: int (optional, default to 100)
ZEPS: double (optional, default to 1.0e-12)

Return
-------
None

Description
-----------
This constructor should be used in a sub-class to initialize correctly all the fields of this class.
") math_BrentMinimum;
		 math_BrentMinimum(const double TolX, const int NbIterations = 100, const double ZEPS = 1.0e-12);

		/****** math_BrentMinimum::math_BrentMinimum ******/
		/****** md5 signature: 332c451481939a19c0fbffd0f0ba640c ******/
		%feature("compactdefaultargs") math_BrentMinimum;
		%feature("autodoc", "
Parameters
----------
TolX: double
Fbx: double
NbIterations: int (optional, default to 100)
ZEPS: double (optional, default to 1.0e-12)

Return
-------
None

Description
-----------
This constructor should be used in a sub-class to initialize correctly all the fields of this class. It has to be used if F(Bx) is known.
") math_BrentMinimum;
		 math_BrentMinimum(const double TolX, const double Fbx, const int NbIterations = 100, const double ZEPS = 1.0e-12);

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
		/****** md5 signature: 1e1ad145af7d8c16b253ee9a4b0d6a43 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if the computations are successful, otherwise returns false.
") IsDone;
		bool IsDone();

		/****** math_BrentMinimum::IsSolutionReached ******/
		/****** md5 signature: 47a9b0b6b5d4fa22208afddd40fdb7dd ******/
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
		virtual bool IsSolutionReached(math_Function & theFunction);

		/****** math_BrentMinimum::Location ******/
		/****** md5 signature: b31bf72ee9327e0796fc8b94922d7efb ******/
		%feature("compactdefaultargs") Location;
		%feature("autodoc", "Return
-------
double

Description
-----------
returns the location value of the minimum. Exception NotDone is raised if the minimum was not found.
") Location;
		double Location();

		/****** math_BrentMinimum::Minimum ******/
		/****** md5 signature: 1125a6878024188eb4b06b555c7d51ea ******/
		%feature("compactdefaultargs") Minimum;
		%feature("autodoc", "Return
-------
double

Description
-----------
returns the value of the minimum. Exception NotDone is raised if the minimum was not found.
") Minimum;
		double Minimum();

		/****** math_BrentMinimum::NbIterations ******/
		/****** md5 signature: e2122843ad4b16fe4df700a084f7f785 ******/
		%feature("compactdefaultargs") NbIterations;
		%feature("autodoc", "Return
-------
int

Description
-----------
returns the number of iterations really done during the computation of the minimum. Exception NotDone is raised if the minimum was not found.
") NbIterations;
		int NbIterations();

		/****** math_BrentMinimum::Perform ******/
		/****** md5 signature: 03352d077a590672d55b141ee3f982d7 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
F: math_Function
Ax: double
Bx: double
Cx: double

Return
-------
None

Description
-----------
Brent minimization is performed on function F from a given bracketing triplet of abscissas Ax, Bx, Cx (such that Bx is between Ax and Cx, F(Bx) is less than both F(Bx) and F(Cx)) The solution is found when: abs(Xi - Xi-1) <= TolX * abs(Xi) + ZEPS;.
") Perform;
		void Perform(math_Function & F, const double Ax, const double Bx, const double Cx);

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
		/****** md5 signature: c6859ce86427beabc82d24e3c4ede56f ******/
		%feature("compactdefaultargs") NextReal;
		%feature("autodoc", "Return
-------
double

Description
-----------
Generates new floating-point value.
") NextReal;
		double NextReal();

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
		/****** md5 signature: 5be3868ec5809977b011069cc5c46fe2 ******/
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
		 math_ComputeGaussPointsAndWeights(const int Number);

		/****** math_ComputeGaussPointsAndWeights::IsDone ******/
		/****** md5 signature: 1e1ad145af7d8c16b253ee9a4b0d6a43 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsDone;
		bool IsDone();

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
		/****** md5 signature: 38d5b9285eafc8a495d81bf28dc83dc1 ******/
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
		 math_ComputeKronrodPointsAndWeights(const int Number);

		/****** math_ComputeKronrodPointsAndWeights::IsDone ******/
		/****** md5 signature: 1e1ad145af7d8c16b253ee9a4b0d6a43 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsDone;
		bool IsDone();

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
		/****** md5 signature: 9cf71ae29ce34e737bc0aad37d563fa6 ******/
		%feature("compactdefaultargs") math_Crout;
		%feature("autodoc", "
Parameters
----------
A: math_Matrix
MinPivot: double (optional, default to 1.0e-20)

Return
-------
None

Description
-----------
Given an input matrix A, this algorithm inverts A by the Crout algorithm. The user can give only the inferior triangle for the implementation. A can be decomposed like this: A = L * D * T(L) where L is triangular inferior and D is diagonal. If one element of A is less than MinPivot, A is considered as singular. Exception NotSquare is raised if A is not a square matrix.
") math_Crout;
		 math_Crout(const math_Matrix & A, const double MinPivot = 1.0e-20);

		/****** math_Crout::Determinant ******/
		/****** md5 signature: dca8c88718c9dc26a7061fa9f80ceb38 ******/
		%feature("compactdefaultargs") Determinant;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns the value of the determinant of the previously LU decomposed matrix A. Zero is returned if the matrix A is considered as singular. Exceptions StdFail_NotDone if the algorithm fails (and IsDone returns false).
") Determinant;
		double Determinant();

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
		/****** md5 signature: 1e1ad145af7d8c16b253ee9a4b0d6a43 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if all has been correctly done.
") IsDone;
		bool IsDone();

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
		/****** md5 signature: b522113935c55485b8ce5dbb0430408f ******/
		%feature("compactdefaultargs") math_DirectPolynomialRoots;
		%feature("autodoc", "
Parameters
----------
theA: double
theB: double
theC: double
theD: double
theE: double

Return
-------
None

Description
-----------
Computes all the real roots of the quartic polynomial Ax^4 + Bx^3 + Cx^2 + Dx + E = 0 using Ferrari's method. //! The algorithm: 1. Checks for degree reduction (A ~= 0) 2. Normalizes and scales coefficients for numerical stability 3. Solves Ferrari's resolvent cubic equation 4. Factors quartic into two quadratic equations 5. Solves both quadratics independently 6. Refines all roots using Newton-Raphson method //! 
Parameter theA coefficient of x^4 term 
Parameter theB coefficient of x^3 term 
Parameter theC coefficient of x^2 term 
Parameter theD coefficient of x term 
Parameter theE constant term.
") math_DirectPolynomialRoots;
		 math_DirectPolynomialRoots(const double theA, const double theB, const double theC, const double theD, const double theE);

		/****** math_DirectPolynomialRoots::math_DirectPolynomialRoots ******/
		/****** md5 signature: e121ee3d70e9cce5eb6c68b088aac9ab ******/
		%feature("compactdefaultargs") math_DirectPolynomialRoots;
		%feature("autodoc", "
Parameters
----------
theA: double
theB: double
theC: double
theD: double

Return
-------
None

Description
-----------
Computes all the real roots of the cubic polynomial Ax^3 + Bx^2 + Cx + D = 0 using Cardano's method with Vieta substitution. //! The algorithm: 1. Transforms to depressed cubic t^3 + Pt + Q = 0 2. Computes discriminant Delta = -4P^3/27 - Q^2/4 3. Uses trigonometric method for Delta < 0 (three real roots) 4. Uses Cardano's formula for Delta > 0 (one real root) 5. Handles multiple roots when Delta = 0 6. Applies Newton-Raphson refinement //! 
Parameter theA coefficient of x^3 term 
Parameter theB coefficient of x^2 term 
Parameter theC coefficient of x term 
Parameter theD constant term.
") math_DirectPolynomialRoots;
		 math_DirectPolynomialRoots(const double theA, const double theB, const double theC, const double theD);

		/****** math_DirectPolynomialRoots::math_DirectPolynomialRoots ******/
		/****** md5 signature: 579a2b2f93452c6411e8ca4da5a89bd5 ******/
		%feature("compactdefaultargs") math_DirectPolynomialRoots;
		%feature("autodoc", "
Parameters
----------
theA: double
theB: double
theC: double

Return
-------
None

Description
-----------
Computes all the real roots of the quadratic polynomial Ax^2 + Bx + C = 0 using numerically stable formulas. //! The algorithm avoids catastrophic cancellation by using: - Discriminant with error bounds: Delta = B^2 - 4AC - Stable root formulas based on sign of B - Newton-Raphson refinement for improved accuracy //! 
Parameter theA coefficient of x^2 term 
Parameter theB coefficient of x term 
Parameter theC constant term.
") math_DirectPolynomialRoots;
		 math_DirectPolynomialRoots(const double theA, const double theB, const double theC);

		/****** math_DirectPolynomialRoots::math_DirectPolynomialRoots ******/
		/****** md5 signature: 020d003117c671fb42ea2478bf684591 ******/
		%feature("compactdefaultargs") math_DirectPolynomialRoots;
		%feature("autodoc", "
Parameters
----------
theA: double
theB: double

Return
-------
None

Description
-----------
Computes the real root of the linear equation Ax + B = 0. //! Handles all cases: - A != 0: unique solution x = -B/A - A = 0, B != 0: no solution (inconsistent) - A = 0, B = 0: infinite solutions (identity) //! 
Parameter theA coefficient of x term 
Parameter theB constant term.
") math_DirectPolynomialRoots;
		 math_DirectPolynomialRoots(const double theA, const double theB);

		/****** math_DirectPolynomialRoots::Dump ******/
		/****** md5 signature: c7b7f3310b5193de5f2365d935cd2c95 ******/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "
Parameters
----------

Return
-------
theStream: Standard_OStream

Description
-----------
Prints diagnostic information about the current state of the solver. Outputs computation status, number of roots, and individual root values. This method is used to redefine the operator << for debugging purposes. //! 
Parameter theStream output stream for diagnostic information.
") Dump;
		void Dump(std::ostream &OutValue);

		/****** math_DirectPolynomialRoots::InfiniteRoots ******/
		/****** md5 signature: d38ed7337c369cb41b94e9a63e2e510b ******/
		%feature("compactdefaultargs") InfiniteRoots;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if there is an infinity of roots, otherwise returns false. This occurs only for the degenerate linear case 0*x + 0 = 0.
") InfiniteRoots;
		bool InfiniteRoots();

		/****** math_DirectPolynomialRoots::IsDone ******/
		/****** md5 signature: 1e1ad145af7d8c16b253ee9a4b0d6a43 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if the computations are successful, otherwise returns false. Computations may fail due to numerical issues or overflow conditions.
") IsDone;
		bool IsDone();

		/****** math_DirectPolynomialRoots::NbSolutions ******/
		/****** md5 signature: 55162d50f2670468f6ab0d146e7a9b77 ******/
		%feature("compactdefaultargs") NbSolutions;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of distinct real roots found. An exception is raised if there are an infinity of roots. For multiple roots, this counts each root according to its multiplicity.
") NbSolutions;
		int NbSolutions();

		/****** math_DirectPolynomialRoots::Value ******/
		/****** md5 signature: 4596b10d4ac0de876dd589b0fb62c21d ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
theIndex: int

Return
-------
double

Description
-----------
Returns the value of the Nth root in default ordering. The default ordering may vary depending on the algorithm used. An exception is raised if there are an infinity of roots. Exception RangeError is raised if theIndex is < 1 or theIndex > NbSolutions. //! 
Parameter theIndex root index (1-based) 
Return: root value.
") Value;
		double Value(const int theIndex);

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
		/****** md5 signature: 552d2789738cac7002e5f0ec223159cd ******/
		%feature("compactdefaultargs") math_DoubleTab;
		%feature("autodoc", "
Parameters
----------
theLowerRow: int
theUpperRow: int
theLowerCol: int
theUpperCol: int

Return
-------
None

Description
-----------
Constructor for ranges [theLowerRow..theUpperRow, theLowerCol..theUpperCol].
") math_DoubleTab;
		 math_DoubleTab(const int theLowerRow, const int theUpperRow, const int theLowerCol, const int theUpperCol);

		/****** math_DoubleTab::math_DoubleTab ******/
		/****** md5 signature: 2563af2a9e356ab55de9d9f9d5c098f9 ******/
		%feature("compactdefaultargs") math_DoubleTab;
		%feature("autodoc", "
Parameters
----------
theTab: void *
theLowerRow: int
theUpperRow: int
theLowerCol: int
theUpperCol: int

Return
-------
None

Description
-----------
Constructor from external data array.
") math_DoubleTab;
		 math_DoubleTab(void * const theTab, const int theLowerRow, const int theUpperRow, const int theLowerCol, const int theUpperCol);

		/****** math_DoubleTab::math_DoubleTab ******/
		/****** md5 signature: 7026687fc3aa2bdfa2bbf649d155fd00 ******/
		%feature("compactdefaultargs") math_DoubleTab;
		%feature("autodoc", "
Parameters
----------
theOther: math_DoubleTab

Return
-------
None

Description
-----------
Copy constructor.
") math_DoubleTab;
		 math_DoubleTab(const math_DoubleTab & theOther);

		/****** math_DoubleTab::math_DoubleTab ******/
		/****** md5 signature: f48d9b2d1d7259b1d9b6891e4043911f ******/
		%feature("compactdefaultargs") math_DoubleTab;
		%feature("autodoc", "
Parameters
----------
theOther: math_DoubleTab

Return
-------
None

Description
-----------
Move constructor.
") math_DoubleTab;
		 math_DoubleTab(math_DoubleTab & theOther);

		/****** math_DoubleTab::Copy ******/
		/****** md5 signature: 87c3b036471bf1e65bf2dfffde9bb4b3 ******/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "
Parameters
----------
theOther: math_DoubleTab

Return
-------
None

Description
-----------
Copy data to theOther.
") Copy;
		void Copy(math_DoubleTab & theOther);

		/****** math_DoubleTab::Init ******/
		/****** md5 signature: 439bd85508c48864a04b973cb5cee132 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
theInitValue: double

Return
-------
None

Description
-----------
Initialize all elements with theInitValue.
") Init;
		void Init(const double theInitValue);

		/****** math_DoubleTab::IsDeletable ******/
		/****** md5 signature: 3fa1bb163023b48d81a8520f563a9f9e ******/
		%feature("compactdefaultargs") IsDeletable;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if the internal array is deletable (heap-allocated).
") IsDeletable;
		bool IsDeletable();

		/****** math_DoubleTab::LowerCol ******/
		/****** md5 signature: b02c56dc31bf0d86cbdc2b846d9336d9 ******/
		%feature("compactdefaultargs") LowerCol;
		%feature("autodoc", "Return
-------
int

Description
-----------
Get lower column index.
") LowerCol;
		int LowerCol();

		/****** math_DoubleTab::LowerRow ******/
		/****** md5 signature: b286bea943bfe97653c5edbdd4099547 ******/
		%feature("compactdefaultargs") LowerRow;
		%feature("autodoc", "Return
-------
int

Description
-----------
Get lower row index.
") LowerRow;
		int LowerRow();

		/****** math_DoubleTab::NbColumns ******/
		/****** md5 signature: 9b973b92c1b27cfa7818102ebf1b6ff6 ******/
		%feature("compactdefaultargs") NbColumns;
		%feature("autodoc", "Return
-------
int

Description
-----------
Get number of columns.
") NbColumns;
		int NbColumns();

		/****** math_DoubleTab::NbRows ******/
		/****** md5 signature: bff13bba5c7021c461c58d6e2e7077ca ******/
		%feature("compactdefaultargs") NbRows;
		%feature("autodoc", "Return
-------
int

Description
-----------
Get number of rows.
") NbRows;
		int NbRows();

		/****** math_DoubleTab::SetLowerCol ******/
		/****** md5 signature: 9a92f92a0b69f644c7c9c62dce1b0617 ******/
		%feature("compactdefaultargs") SetLowerCol;
		%feature("autodoc", "
Parameters
----------
theLowerCol: int

Return
-------
None

Description
-----------
Set lower column index.
") SetLowerCol;
		void SetLowerCol(const int theLowerCol);

		/****** math_DoubleTab::SetLowerRow ******/
		/****** md5 signature: 03244943c7b3c18a03be63ea559ae610 ******/
		%feature("compactdefaultargs") SetLowerRow;
		%feature("autodoc", "
Parameters
----------
theLowerRow: int

Return
-------
None

Description
-----------
Set lower row index.
") SetLowerRow;
		void SetLowerRow(const int theLowerRow);

		/****** math_DoubleTab::UpperCol ******/
		/****** md5 signature: bde8fdd8481682b0d3c87eb9dbb2180c ******/
		%feature("compactdefaultargs") UpperCol;
		%feature("autodoc", "Return
-------
int

Description
-----------
Get upper column index.
") UpperCol;
		int UpperCol();

		/****** math_DoubleTab::UpperRow ******/
		/****** md5 signature: 192004a05cfa31734f159b0713e6a280 ******/
		%feature("compactdefaultargs") UpperRow;
		%feature("autodoc", "Return
-------
int

Description
-----------
Get upper row index.
") UpperRow;
		int UpperRow();

		/****** math_DoubleTab::Value ******/
		/****** md5 signature: 97070f2a1f0af538cae3af29bbd2da91 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
theRowIndex: int
theColIndex: int

Return
-------
double

Description
-----------
Access element at (theRowIndex, theColIndex).
") Value;
		const double & Value(const int theRowIndex, const int theColIndex);

		/****** math_DoubleTab::Value ******/
		/****** md5 signature: 5ed15bf21adc7c6c190789159c76fdab ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
theRowIndex: int
theColIndex: int

Return
-------
double

Description
-----------
Change element at (theRowIndex, theColIndex).
") Value;
		double & Value(const int theRowIndex, const int theColIndex);

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
		/****** md5 signature: 281e9aaa09be061d95546e85aa7f7ba5 ******/
		%feature("compactdefaultargs") math_EigenValuesSearcher;
		%feature("autodoc", "
Parameters
----------
theDiagonal: TColStd_Array1OfReal
theSubdiagonal: TColStd_Array1OfReal

Return
-------
None

Description
-----------
No available documentation.
") math_EigenValuesSearcher;
		 math_EigenValuesSearcher(const TColStd_Array1OfReal & theDiagonal, const TColStd_Array1OfReal & theSubdiagonal);

		/****** math_EigenValuesSearcher::Dimension ******/
		/****** md5 signature: 5cba93441ea03389c5573c35c9c9e913 ******/
		%feature("compactdefaultargs") Dimension;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the dimension of the tridiagonal matrix.
") Dimension;
		int Dimension();

		/****** math_EigenValuesSearcher::EigenValue ******/
		/****** md5 signature: 24870eb53015964947170347de4e045a ******/
		%feature("compactdefaultargs") EigenValue;
		%feature("autodoc", "
Parameters
----------
theIndex: int

Return
-------
double

Description
-----------
Returns the specified eigenvalue. Eigenvalues are returned in the order they were computed by the algorithm, which may not be sorted. Use sorting if ordered eigenvalues are needed. //! 
Parameter theIndex index of the desired eigenvalue (1-based indexing) 
Return: the eigenvalue at the specified index.
") EigenValue;
		double EigenValue(const int theIndex);

		/****** math_EigenValuesSearcher::EigenVector ******/
		/****** md5 signature: 86f60f0aa6d37c1bb6f2225df3c14241 ******/
		%feature("compactdefaultargs") EigenVector;
		%feature("autodoc", "
Parameters
----------
theIndex: int

Return
-------
math_Vector

Description
-----------
Returns the specified eigenvector. The returned eigenvector is normalized and orthogonal to all other eigenvectors. The eigenvector satisfies: A * v = lambda * v, where A is the original matrix, v is the eigenvector, and lambda is the corresponding eigenvalue. //! 
Parameter theIndex index of the desired eigenvector (1-based indexing) 
Return: the normalized eigenvector corresponding to EigenValue(theIndex).
") EigenVector;
		math_Vector EigenVector(const int theIndex);

		/****** math_EigenValuesSearcher::IsDone ******/
		/****** md5 signature: 1e1ad145af7d8c16b253ee9a4b0d6a43 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if computation is performed successfully. Computation may fail due to numerical issues or invalid input.
") IsDone;
		bool IsDone();

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
		/****** md5 signature: 49931dc50321069976230f1aa4b7c7c9 ******/
		%feature("compactdefaultargs") math_FRPR;
		%feature("autodoc", "
Parameters
----------
theFunction: math_MultipleVarFunctionWithGradient
theTolerance: double
theNbIterations: int (optional, default to 200)
theZEPS: double (optional, default to 1.0e-12)

Return
-------
None

Description
-----------
Initializes the computation of the minimum of F. Warning: constructor does not perform computations.
") math_FRPR;
		 math_FRPR(const math_MultipleVarFunctionWithGradient & theFunction, const double theTolerance, const int theNbIterations = 200, const double theZEPS = 1.0e-12);

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
		/****** md5 signature: 1e1ad145af7d8c16b253ee9a4b0d6a43 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if the computations are successful, otherwise returns false.
") IsDone;
		bool IsDone();

		/****** math_FRPR::IsSolutionReached ******/
		/****** md5 signature: 22e5131bf3f7a59db4535302191bd7b4 ******/
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
		virtual bool IsSolutionReached(math_MultipleVarFunctionWithGradient & theFunction);

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
		/****** md5 signature: 1125a6878024188eb4b06b555c7d51ea ******/
		%feature("compactdefaultargs") Minimum;
		%feature("autodoc", "Return
-------
double

Description
-----------
returns the value of the minimum. Exception NotDone is raised if the minimum was not found.
") Minimum;
		double Minimum();

		/****** math_FRPR::NbIterations ******/
		/****** md5 signature: e2122843ad4b16fe4df700a084f7f785 ******/
		%feature("compactdefaultargs") NbIterations;
		%feature("autodoc", "Return
-------
int

Description
-----------
returns the number of iterations really done during the computation of the minimum. Exception NotDone is raised if the minimum was not found.
") NbIterations;
		int NbIterations();

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
		/****** md5 signature: acad3d2a092c98ec2e12739357a32247 ******/
		%feature("compactdefaultargs") GetStateNumber;
		%feature("autodoc", "Return
-------
int

Description
-----------
returns the state of the function corresponding to the latest call of any methods associated with the function. This function is called by each of the algorithms described later which defined the function Integer Algorithm::StateNumber(). The algorithm has the responsibility to call this function when it has found a solution (i.e. a root or a minimum) and has to maintain the association between the solution found and this StateNumber. Byu default, this method returns 0 (which means for the algorithm: no state has been saved). It is the responsibility of the programmer to decide if he needs to save the current state of the function and to return an Integer that allows retrieval of the state.
") GetStateNumber;
		virtual int GetStateNumber();

		/****** math_Function::Value ******/
		/****** md5 signature: f42cafdb42f561cc095c0083141ac713 ******/
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
Computes the value of the function <F> for a given value of variable <X>. returns True if the computation was done successfully, False otherwise.
") Value;
		virtual bool Value(const double X, Standard_Real &OutValue);

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
		/****** md5 signature: f6d5abc06d92829f5f7c97f2296741b3 ******/
		%feature("compactdefaultargs") math_FunctionAllRoots;
		%feature("autodoc", "
Parameters
----------
F: math_FunctionWithDerivative
S: math_FunctionSample
EpsX: double
EpsF: double
EpsNul: double

Return
-------
None

Description
-----------
The algorithm uses the sample to find intervals on which the function is null. An interval is found if, for at least two consecutive points of the sample, Ui and Ui+1, we get |F(Ui)|<=EpsNul and |F(Ui+1)|<=EpsNul. The real bounds of an interval are computed with the FunctionRoots. algorithm. Between two intervals, the roots of the function F are calculated using the FunctionRoots algorithm.
") math_FunctionAllRoots;
		 math_FunctionAllRoots(math_FunctionWithDerivative & F, const math_FunctionSample & S, const double EpsX, const double EpsF, const double EpsNul);

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
		/****** md5 signature: d886e54c148d1d9afcc215c1a73cf6a1 ******/
		%feature("compactdefaultargs") GetInterval;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
A: double
B: double

Description
-----------
Returns the interval of parameter of range Index. An exception is raised if IsDone returns False; An exception is raised if Index<=0 or Index >Nbintervals.
") GetInterval;
		void GetInterval(const int Index, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** math_FunctionAllRoots::GetIntervalState ******/
		/****** md5 signature: fbe603cfd57ae80b6cd82300024129df ******/
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
		void GetIntervalState(const int Index, Standard_Integer &OutValue, Standard_Integer &OutValue);

		/****** math_FunctionAllRoots::GetPoint ******/
		/****** md5 signature: 7fb79a9eaa4aa9e13d1ab352ab68abf1 ******/
		%feature("compactdefaultargs") GetPoint;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
double

Description
-----------
Returns the parameter of the point of range Index. An exception is raised if IsDone returns False; An exception is raised if Index<=0 or Index >NbPoints.
") GetPoint;
		double GetPoint(const int Index);

		/****** math_FunctionAllRoots::GetPointState ******/
		/****** md5 signature: 67454cb6e4c288a59a1d1678c53e1ae5 ******/
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
		int GetPointState(const int Index);

		/****** math_FunctionAllRoots::IsDone ******/
		/****** md5 signature: 1e1ad145af7d8c16b253ee9a4b0d6a43 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if the computation has been done successfully.
") IsDone;
		bool IsDone();

		/****** math_FunctionAllRoots::NbIntervals ******/
		/****** md5 signature: 487b014b9cd194c58d109502ca451d5e ******/
		%feature("compactdefaultargs") NbIntervals;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of intervals on which the function is Null. An exception is raised if IsDone returns False.
") NbIntervals;
		int NbIntervals();

		/****** math_FunctionAllRoots::NbPoints ******/
		/****** md5 signature: 0243a6484ef0942dcad871f7c247b5de ******/
		%feature("compactdefaultargs") NbPoints;
		%feature("autodoc", "Return
-------
int

Description
-----------
returns the number of points where the function is Null. An exception is raised if IsDone returns False.
") NbPoints;
		int NbPoints();

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
		/****** md5 signature: 21f4630d8f4a6749a5a0abe36adb308d ******/
		%feature("compactdefaultargs") math_FunctionRoot;
		%feature("autodoc", "
Parameters
----------
F: math_FunctionWithDerivative
Guess: double
Tolerance: double
NbIterations: int (optional, default to 100)

Return
-------
None

Description
-----------
The Newton-Raphson method is done to find the root of the function F from the initial guess Guess.The tolerance required on the root is given by Tolerance. Iterations are stopped if the expected solution does not stay in the range A..B. The solution is found when abs(Xi - Xi-1) <= Tolerance; The maximum number of iterations allowed is given by NbIterations.
") math_FunctionRoot;
		 math_FunctionRoot(math_FunctionWithDerivative & F, const double Guess, const double Tolerance, const int NbIterations = 100);

		/****** math_FunctionRoot::math_FunctionRoot ******/
		/****** md5 signature: 295a6fc5ab259d08266d31a8dcf8f4ce ******/
		%feature("compactdefaultargs") math_FunctionRoot;
		%feature("autodoc", "
Parameters
----------
F: math_FunctionWithDerivative
Guess: double
Tolerance: double
A: double
B: double
NbIterations: int (optional, default to 100)

Return
-------
None

Description
-----------
The Newton-Raphson method is done to find the root of the function F from the initial guess Guess. The tolerance required on the root is given by Tolerance. Iterations are stopped if the expected solution does not stay in the range A..B The solution is found when abs(Xi - Xi-1) <= Tolerance; The maximum number of iterations allowed is given by NbIterations.
") math_FunctionRoot;
		 math_FunctionRoot(math_FunctionWithDerivative & F, const double Guess, const double Tolerance, const double A, const double B, const int NbIterations = 100);

		/****** math_FunctionRoot::Derivative ******/
		/****** md5 signature: ad7aa922d44855788fc0f7a4658094e3 ******/
		%feature("compactdefaultargs") Derivative;
		%feature("autodoc", "Return
-------
double

Description
-----------
returns the value of the derivative at the root. Exception NotDone is raised if the root was not found.
") Derivative;
		double Derivative();

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
		/****** md5 signature: 1e1ad145af7d8c16b253ee9a4b0d6a43 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if the computations are successful, otherwise returns false.
") IsDone;
		bool IsDone();

		/****** math_FunctionRoot::NbIterations ******/
		/****** md5 signature: e2122843ad4b16fe4df700a084f7f785 ******/
		%feature("compactdefaultargs") NbIterations;
		%feature("autodoc", "Return
-------
int

Description
-----------
returns the number of iterations really done on the computation of the Root. Exception NotDone is raised if the root was not found.
") NbIterations;
		int NbIterations();

		/****** math_FunctionRoot::Root ******/
		/****** md5 signature: 4cac472ec2e8bbc115a694c59e4b1b4e ******/
		%feature("compactdefaultargs") Root;
		%feature("autodoc", "Return
-------
double

Description
-----------
returns the value of the root. Exception NotDone is raised if the root was not found.
") Root;
		double Root();

		/****** math_FunctionRoot::Value ******/
		/****** md5 signature: dbdf6d9f5299cb6ef730d686d81d15db ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Return
-------
double

Description
-----------
returns the value of the function at the root. Exception NotDone is raised if the root was not found.
") Value;
		double Value();

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
		/****** md5 signature: 31ce6973d2a8afcce2ddad8e1ad8d90b ******/
		%feature("compactdefaultargs") math_FunctionRoots;
		%feature("autodoc", "
Parameters
----------
F: math_FunctionWithDerivative
A: double
B: double
NbSample: int
EpsX: double (optional, default to 0.0)
EpsF: double (optional, default to 0.0)
EpsNull: double (optional, default to 0.0)
K: double (optional, default to 0.0)

Return
-------
None

Description
-----------
Calculates all the real roots of a function F-K within the range A..B. without conditions on A and B A solution X is found when abs(Xi - Xi-1) <= Epsx and abs(F(Xi)-K) <= EpsF. The function is considered as null between A and B if abs(F-K) <= EpsNull within this range.
") math_FunctionRoots;
		 math_FunctionRoots(math_FunctionWithDerivative & F, const double A, const double B, const int NbSample, const double EpsX = 0.0, const double EpsF = 0.0, const double EpsNull = 0.0, const double K = 0.0);

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
		/****** md5 signature: 706cfbaafc14573af884e51b876469ce ******/
		%feature("compactdefaultargs") IsAllNull;
		%feature("autodoc", "Return
-------
bool

Description
-----------
returns true if the function is considered as null between A and B. Exceptions StdFail_NotDone if the algorithm fails (and IsDone returns false).
") IsAllNull;
		bool IsAllNull();

		/****** math_FunctionRoots::IsDone ******/
		/****** md5 signature: 1e1ad145af7d8c16b253ee9a4b0d6a43 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if the computations are successful, otherwise returns false.
") IsDone;
		bool IsDone();

		/****** math_FunctionRoots::NbSolutions ******/
		/****** md5 signature: 55162d50f2670468f6ab0d146e7a9b77 ******/
		%feature("compactdefaultargs") NbSolutions;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of solutions found. Exceptions StdFail_NotDone if the algorithm fails (and IsDone returns false).
") NbSolutions;
		int NbSolutions();

		/****** math_FunctionRoots::StateNumber ******/
		/****** md5 signature: 162a4799c7d1f8e3f92385205e5b004a ******/
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
		int StateNumber(const int Nieme);

		/****** math_FunctionRoots::Value ******/
		/****** md5 signature: fe081412a7e8c36e7328a0038491e247 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
Nieme: int

Return
-------
double

Description
-----------
Returns the Nth value of the root of function F. Exceptions StdFail_NotDone if the algorithm fails (and IsDone returns false).
") Value;
		double Value(const int Nieme);

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
		/****** md5 signature: 7e344194f066c759e36e4605de81096a ******/
		%feature("compactdefaultargs") math_FunctionSample;
		%feature("autodoc", "
Parameters
----------
A: double
B: double
N: int

Return
-------
None

Description
-----------
No available documentation.
") math_FunctionSample;
		 math_FunctionSample(const double A, const double B, const int N);

		/****** math_FunctionSample::Bounds ******/
		/****** md5 signature: 33f9172ce034b57fd79196d6f40e242f ******/
		%feature("compactdefaultargs") Bounds;
		%feature("autodoc", "
Parameters
----------

Return
-------
A: double
B: double

Description
-----------
Returns the bounds of parameters.
") Bounds;
		virtual void Bounds(Standard_Real &OutValue, Standard_Real &OutValue);

		/****** math_FunctionSample::GetParameter ******/
		/****** md5 signature: a882cbe646dcd3b62a1389e7e6ad8a7c ******/
		%feature("compactdefaultargs") GetParameter;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
double

Description
-----------
Returns the value of parameter of the point of range Index: A + ((Index-1)/(NbPoints-1))*B. An exception is raised if Index<=0 or Index>NbPoints.
") GetParameter;
		virtual double GetParameter(const int Index);

		/****** math_FunctionSample::NbPoints ******/
		/****** md5 signature: 0243a6484ef0942dcad871f7c247b5de ******/
		%feature("compactdefaultargs") NbPoints;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of sample points.
") NbPoints;
		int NbPoints();

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
		/****** md5 signature: acad3d2a092c98ec2e12739357a32247 ******/
		%feature("compactdefaultargs") GetStateNumber;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the state of the function corresponding to the latestcall of any methods associated with the function. This function is called by each of the algorithms described later which define the function Integer Algorithm::StateNumber(). The algorithm has the responsibility to call this function when it has found a solution (i.e. a root or a minimum) and has to maintain the association between the solution found and this StateNumber. Byu default, this method returns 0 (which means for the algorithm: no state has been saved). It is the responsibility of the programmer to decide if he needs to save the current state of the function and to return an Integer that allows retrieval of the state.
") GetStateNumber;
		virtual int GetStateNumber();

		/****** math_FunctionSet::NbEquations ******/
		/****** md5 signature: 665f2b2d67f5ba2752b3f14be7928292 ******/
		%feature("compactdefaultargs") NbEquations;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of equations of the function.
") NbEquations;
		virtual int NbEquations();

		/****** math_FunctionSet::NbVariables ******/
		/****** md5 signature: 5687662cdeff0d84a0d6a0e5c2ae3cf4 ******/
		%feature("compactdefaultargs") NbVariables;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of variables of the function.
") NbVariables;
		virtual int NbVariables();

		/****** math_FunctionSet::Value ******/
		/****** md5 signature: 57f9c6c08ec6f1b85db6d8c7afe4c2ab ******/
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
		virtual bool Value(const math_Vector & X, math_Vector & F);

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
		/****** md5 signature: 15c3f26fb243fa71612ff1c3f9dd5ec7 ******/
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
		 math_FunctionSetRoot(math_FunctionSetWithDerivatives & F, const math_Vector & Tolerance, const int NbIterations = 100);

		/****** math_FunctionSetRoot::math_FunctionSetRoot ******/
		/****** md5 signature: 4f8bcca5091cc94027608617a8dc1d09 ******/
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
		 math_FunctionSetRoot(math_FunctionSetWithDerivatives & F, const int NbIterations = 100);

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
		/****** md5 signature: 9252a1c235af80e2945759815d36e6bd ******/
		%feature("compactdefaultargs") IsDivergent;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsDivergent;
		bool IsDivergent();

		/****** math_FunctionSetRoot::IsDone ******/
		/****** md5 signature: 05e29e49040d98b489fbc7af11aabb8e ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if the computations are successful, otherwise returns false.
") IsDone;
		bool IsDone();

		/****** math_FunctionSetRoot::IsSolutionReached ******/
		/****** md5 signature: 2ca564fcd1204506469703675a3e0097 ******/
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
		virtual bool IsSolutionReached(math_FunctionSetWithDerivatives &);

		/****** math_FunctionSetRoot::NbIterations ******/
		/****** md5 signature: afa339d4706aba4ac1e7ec3d58cd7e29 ******/
		%feature("compactdefaultargs") NbIterations;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of iterations really done during the computation of the root. Exception NotDone is raised if the root was not found.
") NbIterations;
		int NbIterations();

		/****** math_FunctionSetRoot::Perform ******/
		/****** md5 signature: 6d21746b49af083082dbb30938b1ce6c ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
theFunction: math_FunctionSetWithDerivatives
theStartingPoint: math_Vector
theStopOnDivergent: bool (optional, default to false)

Return
-------
None

Description
-----------
Improves the root of function from the initial guess point. The infinum and supremum may be given to constrain the solution. In this case, the solution is found when: abs(Xi - Xi-1)(j) <= Tolerance(j) for all unknowns.
") Perform;
		void Perform(math_FunctionSetWithDerivatives & theFunction, const math_Vector & theStartingPoint, const bool theStopOnDivergent = false);

		/****** math_FunctionSetRoot::Perform ******/
		/****** md5 signature: eda3c7defa6040d479cbab30c6707e61 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
theFunction: math_FunctionSetWithDerivatives
theStartingPoint: math_Vector
theInfBound: math_Vector
theSupBound: math_Vector
theStopOnDivergent: bool (optional, default to false)

Return
-------
None

Description
-----------
Improves the root of function from the initial guess point. The infinum and supremum may be given to constrain the solution. In this case, the solution is found when: abs(Xi - Xi-1) <= Tolerance for all unknowns.
") Perform;
		void Perform(math_FunctionSetWithDerivatives & theFunction, const math_Vector & theStartingPoint, const math_Vector & theInfBound, const math_Vector & theSupBound, const bool theStopOnDivergent = false);

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
		/****** md5 signature: 424acd825a28d5897930ad98840ce5ae ******/
		%feature("compactdefaultargs") StateNumber;
		%feature("autodoc", "Return
-------
int

Description
-----------
returns the stateNumber (as returned by F.GetStateNumber()) associated to the root found.
") StateNumber;
		int StateNumber();

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
		/****** md5 signature: 3f1c581bcded67885d3b0317686240b7 ******/
		%feature("compactdefaultargs") math_Gauss;
		%feature("autodoc", "
Parameters
----------
A: math_Matrix
MinPivot: double (optional, default to 1.0e-20)
theProgress: Message_ProgressRange (optional, default to Message_ProgressRange())

Return
-------
None

Description
-----------
Given an input n X n matrix A this constructor performs its LU decomposition with partial pivoting (interchange of rows). This LU decomposition is stored internally and may be used to do subsequent calculation. If the largest pivot found is less than MinPivot the matrix A is considered as singular. Exception NotSquare is raised if A is not a square matrix.
") math_Gauss;
		 math_Gauss(const math_Matrix & A, const double MinPivot = 1.0e-20, const Message_ProgressRange & theProgress = Message_ProgressRange());

		/****** math_Gauss::Determinant ******/
		/****** md5 signature: dca8c88718c9dc26a7061fa9f80ceb38 ******/
		%feature("compactdefaultargs") Determinant;
		%feature("autodoc", "Return
-------
double

Description
-----------
This routine returns the value of the determinant of the previously LU decomposed matrix A. Exception NotDone may be raised if the decomposition of A was not done successfully, zero is returned if the matrix A was considered as singular.
") Determinant;
		double Determinant();

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
		/****** md5 signature: 05e29e49040d98b489fbc7af11aabb8e ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if the computations are successful, otherwise returns false.
") IsDone;
		bool IsDone();

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
		/****** md5 signature: 6eabbdd7c4c37844b761a68aef7dd64b ******/
		%feature("compactdefaultargs") math_GaussLeastSquare;
		%feature("autodoc", "
Parameters
----------
A: math_Matrix
MinPivot: double (optional, default to 1.0e-20)

Return
-------
None

Description
-----------
Given an input n X m matrix A with n >= m this constructor performs the LU decomposition with partial pivoting (interchange of rows) of the matrix AA = A.Transposed() * A; This LU decomposition is stored internally and may be used to do subsequent calculation. If the largest pivot found is less than MinPivot the matrix <A> is considered as singular.
") math_GaussLeastSquare;
		 math_GaussLeastSquare(const math_Matrix & A, const double MinPivot = 1.0e-20);

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
		/****** md5 signature: 1e1ad145af7d8c16b253ee9a4b0d6a43 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if the computations are successful, otherwise returns false.e.
") IsDone;
		bool IsDone();

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
		/****** md5 signature: 1e1ad145af7d8c16b253ee9a4b0d6a43 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
returns True if all has been correctly done.
") IsDone;
		bool IsDone();

		/****** math_GaussMultipleIntegration::Value ******/
		/****** md5 signature: dbdf6d9f5299cb6ef730d686d81d15db ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Return
-------
double

Description
-----------
returns the value of the integral.
") Value;
		double Value();

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
		/****** md5 signature: 1e1ad145af7d8c16b253ee9a4b0d6a43 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
returns True if all has been correctly done.
") IsDone;
		bool IsDone();

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
		/****** md5 signature: b706f05139bbf12e869abd90cf6e2849 ******/
		%feature("compactdefaultargs") math_GaussSingleIntegration;
		%feature("autodoc", "
Parameters
----------
F: math_Function
Lower: double
Upper: double
Order: int

Return
-------
None

Description
-----------
The Gauss-Legendre integration with N = Order points of integration, is done on the function F between the bounds Lower and Upper.
") math_GaussSingleIntegration;
		 math_GaussSingleIntegration(math_Function & F, const double Lower, const double Upper, const int Order);

		/****** math_GaussSingleIntegration::math_GaussSingleIntegration ******/
		/****** md5 signature: f0fae129c35e91e36511b7a48be2b677 ******/
		%feature("compactdefaultargs") math_GaussSingleIntegration;
		%feature("autodoc", "
Parameters
----------
F: math_Function
Lower: double
Upper: double
Order: int
Tol: double

Return
-------
None

Description
-----------
The Gauss-Legendre integration with N = Order points of integration and given tolerance = Tol is done on the function F between the bounds Lower and Upper.
") math_GaussSingleIntegration;
		 math_GaussSingleIntegration(math_Function & F, const double Lower, const double Upper, const int Order, const double Tol);

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
		/****** md5 signature: 1e1ad145af7d8c16b253ee9a4b0d6a43 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
returns True if all has been correctly done.
") IsDone;
		bool IsDone();

		/****** math_GaussSingleIntegration::Value ******/
		/****** md5 signature: dbdf6d9f5299cb6ef730d686d81d15db ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Return
-------
double

Description
-----------
returns the value of the integral.
") Value;
		double Value();

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
		/****** md5 signature: 5d10c7ac5b023ea160d2e5e25fe98f1f ******/
		%feature("compactdefaultargs") math_GlobOptMin;
		%feature("autodoc", "
Parameters
----------
theFunc: math_MultipleVarFunction *
theLowerBorder: math_Vector
theUpperBorder: math_Vector
theC: double (optional, default to 9)
theDiscretizationTol: double (optional, default to 1.0e-2)
theSameTol: double (optional, default to 1.0e-7)

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
		 math_GlobOptMin(math_MultipleVarFunction * theFunc, const math_Vector & theLowerBorder, const math_Vector & theUpperBorder, const double theC = 9, const double theDiscretizationTol = 1.0e-2, const double theSameTol = 1.0e-7);

		/****** math_GlobOptMin::GetContinuity ******/
		/****** md5 signature: 31f69c7eaa0768545d41c391d759b47d ******/
		%feature("compactdefaultargs") GetContinuity;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") GetContinuity;
		int GetContinuity();

		/****** math_GlobOptMin::GetF ******/
		/****** md5 signature: 123bea81e5d58fee214d0b6022b2df39 ******/
		%feature("compactdefaultargs") GetF;
		%feature("autodoc", "Return
-------
double

Description
-----------
Get best functional value.
") GetF;
		double GetF();

		/****** math_GlobOptMin::GetFunctionalMinimalValue ******/
		/****** md5 signature: 85c97b8213afe7edc0892c9501efe8ec ******/
		%feature("compactdefaultargs") GetFunctionalMinimalValue;
		%feature("autodoc", "Return
-------
double

Description
-----------
No available documentation.
") GetFunctionalMinimalValue;
		double GetFunctionalMinimalValue();

		/****** math_GlobOptMin::GetLipConstState ******/
		/****** md5 signature: c60d15d70198ec187ffc35ff72782e34 ******/
		%feature("compactdefaultargs") GetLipConstState;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") GetLipConstState;
		bool GetLipConstState();

		/****** math_GlobOptMin::GetTol ******/
		/****** md5 signature: 665ba554f47e86f1ccfe08fa3515c4d9 ******/
		%feature("compactdefaultargs") GetTol;
		%feature("autodoc", "
Parameters
----------

Return
-------
theDiscretizationTol: double
theSameTol: double

Description
-----------
Method to get tolerances. 
Parameter theDiscretizationTol - parameter space discretization tolerance. 
Parameter theSameTol - functional value space indifference tolerance.
") GetTol;
		void GetTol(Standard_Real &OutValue, Standard_Real &OutValue);

		/****** math_GlobOptMin::NbExtrema ******/
		/****** md5 signature: 05485a1cfb6f0ed9b8faaff7cd88384e ******/
		%feature("compactdefaultargs") NbExtrema;
		%feature("autodoc", "Return
-------
int

Description
-----------
Return count of global extremas.
") NbExtrema;
		int NbExtrema();

		/****** math_GlobOptMin::Perform ******/
		/****** md5 signature: d49fe738088030eea94972cdcce25c24 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
isFindSingleSolution: bool (optional, default to false)

Return
-------
None

Description
-----------
Parameter isFindSingleSolution - defines whether to find single solution or all solutions.
") Perform;
		void Perform(const bool isFindSingleSolution = false);

		/****** math_GlobOptMin::Points ******/
		/****** md5 signature: 9ad8e36fa46ec79a0401effd1a626159 ******/
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
		void Points(const int theIndex, math_Vector & theSol);

		/****** math_GlobOptMin::SetContinuity ******/
		/****** md5 signature: ea61840f875b0ffaf39c9ee5370e2ef9 ******/
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
		void SetContinuity(const int theCont);

		/****** math_GlobOptMin::SetFunctionalMinimalValue ******/
		/****** md5 signature: e1e4f533967ffd6e6e156f612a3b4058 ******/
		%feature("compactdefaultargs") SetFunctionalMinimalValue;
		%feature("autodoc", "
Parameters
----------
theMinimalValue: double

Return
-------
None

Description
-----------
Set / Get functional minimal value.
") SetFunctionalMinimalValue;
		void SetFunctionalMinimalValue(const double theMinimalValue);

		/****** math_GlobOptMin::SetGlobalParams ******/
		/****** md5 signature: df7df37041496a8afd0201c58bfeb32a ******/
		%feature("compactdefaultargs") SetGlobalParams;
		%feature("autodoc", "
Parameters
----------
theFunc: math_MultipleVarFunction *
theLowerBorder: math_Vector
theUpperBorder: math_Vector
theC: double (optional, default to 9)
theDiscretizationTol: double (optional, default to 1.0e-2)
theSameTol: double (optional, default to 1.0e-7)

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
		void SetGlobalParams(math_MultipleVarFunction * theFunc, const math_Vector & theLowerBorder, const math_Vector & theUpperBorder, const double theC = 9, const double theDiscretizationTol = 1.0e-2, const double theSameTol = 1.0e-7);

		/****** math_GlobOptMin::SetLipConstState ******/
		/****** md5 signature: 9b7ffbf52721024a6e98a915cd1a3269 ******/
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
		void SetLipConstState(const bool theFlag);

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
		/****** md5 signature: dbd297c9eb5413abf0dbe84f22260745 ******/
		%feature("compactdefaultargs") SetTol;
		%feature("autodoc", "
Parameters
----------
theDiscretizationTol: double
theSameTol: double

Return
-------
None

Description
-----------
Method to set tolerances. 
Parameter theDiscretizationTol - parameter space discretization tolerance. 
Parameter theSameTol - functional value space indifference tolerance.
") SetTol;
		void SetTol(const double theDiscretizationTol, const double theSameTol);

		/****** math_GlobOptMin::isDone ******/
		/****** md5 signature: 5ec90ec09c96cc3e3e0f31aaf399e740 ******/
		%feature("compactdefaultargs") isDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Return computation state of the algorithm.
") isDone;
		bool isDone();

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
		/****** md5 signature: ea8fdd1968e095f9d5da7773d02e0ac1 ******/
		%feature("compactdefaultargs") math_Householder;
		%feature("autodoc", "
Parameters
----------
A: math_Matrix
B: math_Matrix
EPS: double (optional, default to 1.0e-20)

Return
-------
None

Description
-----------
Given an input matrix A with n>= m, given an input matrix B this constructor performs the least square resolution of the set of linear equations A.X = B for each column of B. If a column norm is less than EPS, the resolution can't be done. Exception DimensionError is raised if the row number of B is different from the A row number.
") math_Householder;
		 math_Householder(const math_Matrix & A, const math_Matrix & B, const double EPS = 1.0e-20);

		/****** math_Householder::math_Householder ******/
		/****** md5 signature: edda83968242eced6cc5513a8c56cc77 ******/
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
EPS: double (optional, default to 1.0e-20)

Return
-------
None

Description
-----------
Given an input matrix A with n>= m, given an input matrix B this constructor performs the least square resolution of the set of linear equations A.X = B for each column of B. If a column norm is less than EPS, the resolution can't be done. Exception DimensionError is raised if the row number of B is different from the A row number.
") math_Householder;
		 math_Householder(const math_Matrix & A, const math_Matrix & B, const int lowerArow, const int upperArow, const int lowerAcol, const int upperAcol, const double EPS = 1.0e-20);

		/****** math_Householder::math_Householder ******/
		/****** md5 signature: 1df9c236710724dddd812b71640a6a14 ******/
		%feature("compactdefaultargs") math_Householder;
		%feature("autodoc", "
Parameters
----------
A: math_Matrix
B: math_Vector
EPS: double (optional, default to 1.0e-20)

Return
-------
None

Description
-----------
Given an input matrix A with n>= m, given an input vector B this constructor performs the least square resolution of the set of linear equations A.X = B. If a column norm is less than EPS, the resolution can't be done. Exception DimensionError is raised if the length of B is different from the A row number.
") math_Householder;
		 math_Householder(const math_Matrix & A, const math_Vector & B, const double EPS = 1.0e-20);

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
		/****** md5 signature: 1e1ad145af7d8c16b253ee9a4b0d6a43 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if the computations are successful, otherwise returns false.
") IsDone;
		bool IsDone();

		/****** math_Householder::Value ******/
		/****** md5 signature: 3473f87414188848f7dfb0a71cb1933e ******/
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
		void Value(math_Vector & sol, const int Index = 1);

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
		/****** md5 signature: 1e1ad145af7d8c16b253ee9a4b0d6a43 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if the computations are successful, otherwise returns false.
") IsDone;
		bool IsDone();

		/****** math_Jacobi::Value ******/
		/****** md5 signature: 669e3614f6fbe69c2a5496ade4608ada ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
Num: int

Return
-------
double

Description
-----------
returns the eigenvalue number Num. Eigenvalues are in the range (1..n). Exception NotDone is raised if calculation is not done successfully.
") Value;
		double Value(const int Num);

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
		/****** md5 signature: 486df4ee0dc9c21d0770e64921689211 ******/
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
		void Vector(const int Num, math_Vector & V);

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
		/****** md5 signature: c74a52456ddd74678feb41310c419941 ******/
		%feature("compactdefaultargs") math_KronrodSingleIntegration;
		%feature("autodoc", "
Parameters
----------
theFunction: math_Function
theLower: double
theUpper: double
theNbPnts: int

Return
-------
None

Description
-----------
Constructor. Takes the function, the lower and upper bound values, the initial number of Kronrod points.
") math_KronrodSingleIntegration;
		 math_KronrodSingleIntegration(math_Function & theFunction, const double theLower, const double theUpper, const int theNbPnts);

		/****** math_KronrodSingleIntegration::math_KronrodSingleIntegration ******/
		/****** md5 signature: c42f7666eeff018ebef4e01f2b40f4c7 ******/
		%feature("compactdefaultargs") math_KronrodSingleIntegration;
		%feature("autodoc", "
Parameters
----------
theFunction: math_Function
theLower: double
theUpper: double
theNbPnts: int
theTolerance: double
theMaxNbIter: int

Return
-------
None

Description
-----------
Constructor. Takes the function, the lower and upper bound values, the initial number of Kronrod points, the tolerance value and the maximal number of iterations as parameters.
") math_KronrodSingleIntegration;
		 math_KronrodSingleIntegration(math_Function & theFunction, const double theLower, const double theUpper, const int theNbPnts, const double theTolerance, const int theMaxNbIter);

		/****** math_KronrodSingleIntegration::AbsolutError ******/
		/****** md5 signature: 2328fd8eec3b549c328876566dd49fa2 ******/
		%feature("compactdefaultargs") AbsolutError;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns the value of the relative error reached.
") AbsolutError;
		double AbsolutError();

		/****** math_KronrodSingleIntegration::ErrorReached ******/
		/****** md5 signature: 40ea359a63242ff0b6e74f9b041c3f68 ******/
		%feature("compactdefaultargs") ErrorReached;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns the value of the relative error reached.
") ErrorReached;
		double ErrorReached();

		/****** math_KronrodSingleIntegration::GKRule ******/
		/****** md5 signature: 7934f58ef18eb2fbe48e57e3777c5b72 ******/
		%feature("compactdefaultargs") GKRule;
		%feature("autodoc", "
Parameters
----------
theFunction: math_Function
theLower: double
theUpper: double
theGaussP: math_Vector
theGaussW: math_Vector
theKronrodP: math_Vector
theKronrodW: math_Vector

Return
-------
theValue: double
theError: double

Description
-----------
No available documentation.
") GKRule;
		static bool GKRule(math_Function & theFunction, const double theLower, const double theUpper, const math_Vector & theGaussP, const math_Vector & theGaussW, const math_Vector & theKronrodP, const math_Vector & theKronrodW, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** math_KronrodSingleIntegration::IsDone ******/
		/****** md5 signature: 1e1ad145af7d8c16b253ee9a4b0d6a43 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if computation is performed successfully.
") IsDone;
		bool IsDone();

		/****** math_KronrodSingleIntegration::NbIterReached ******/
		/****** md5 signature: 9184d242e1843f34fe09c2a9da59d379 ******/
		%feature("compactdefaultargs") NbIterReached;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of iterations that were made to compute result.
") NbIterReached;
		int NbIterReached();

		/****** math_KronrodSingleIntegration::OrderReached ******/
		/****** md5 signature: 7139ae823bbb73ae717b6017f4dda874 ******/
		%feature("compactdefaultargs") OrderReached;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of Kronrod points for which the result is computed.
") OrderReached;
		int OrderReached();

		/****** math_KronrodSingleIntegration::Perform ******/
		/****** md5 signature: f430bfec9a924266e87051806a6a162e ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
theFunction: math_Function
theLower: double
theUpper: double
theNbPnts: int

Return
-------
None

Description
-----------
Computation of the integral. Takes the function, the lower and upper bound values, the initial number of Kronrod points, the relative tolerance value and the maximal number of iterations as parameters. theNbPnts should be odd and greater then or equal to 3.
") Perform;
		void Perform(math_Function & theFunction, const double theLower, const double theUpper, const int theNbPnts);

		/****** math_KronrodSingleIntegration::Perform ******/
		/****** md5 signature: 0f1644d0ae22ca2f5c4a896d4bb295fe ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
theFunction: math_Function
theLower: double
theUpper: double
theNbPnts: int
theTolerance: double
theMaxNbIter: int

Return
-------
None

Description
-----------
Computation of the integral. Takes the function, the lower and upper bound values, the initial number of Kronrod points, the relative tolerance value and the maximal number of iterations as parameters. theNbPnts should be odd and greater then or equal to 3. Note that theTolerance is relative, i.e. the criterion of solution reaching is: std::abs(Kronrod - Gauss)/std::abs(Kronrod) < theTolerance. theTolerance should be positive.
") Perform;
		void Perform(math_Function & theFunction, const double theLower, const double theUpper, const int theNbPnts, const double theTolerance, const int theMaxNbIter);

		/****** math_KronrodSingleIntegration::Value ******/
		/****** md5 signature: dbdf6d9f5299cb6ef730d686d81d15db ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns the value of the integral.
") Value;
		double Value();

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
		/****** md5 signature: 53ab00f543b42047d30b3a4701d997b9 ******/
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
		 math_Matrix(const int LowerRow, const int UpperRow, const int LowerCol, const int UpperCol);

		/****** math_Matrix::math_Matrix ******/
		/****** md5 signature: bac5401874f81ebcd6f4292bcace61e1 ******/
		%feature("compactdefaultargs") math_Matrix;
		%feature("autodoc", "
Parameters
----------
LowerRow: int
UpperRow: int
LowerCol: int
UpperCol: int
InitialValue: double

Return
-------
None

Description
-----------
constructs a non-initialized matrix of range [LowerRow..UpperRow, LowerCol..UpperCol] whose values are all initialized with the value InitialValue.
") math_Matrix;
		 math_Matrix(const int LowerRow, const int UpperRow, const int LowerCol, const int UpperCol, const double InitialValue);

		/****** math_Matrix::math_Matrix ******/
		/****** md5 signature: e31559328bc5fb2c11c353161348f7a9 ******/
		%feature("compactdefaultargs") math_Matrix;
		%feature("autodoc", "
Parameters
----------
Tab: void *
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
		 math_Matrix(void * const Tab, const int LowerRow, const int UpperRow, const int LowerCol, const int UpperCol);

		/****** math_Matrix::math_Matrix ******/
		/****** md5 signature: 00df55c135a301ce44574229bc51bca8 ******/
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

		/****** math_Matrix::math_Matrix ******/
		/****** md5 signature: 6c138391eb04abf66e58c4bc505cfc89 ******/
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
Move constructor.
") math_Matrix;
		 math_Matrix(math_Matrix & Other);

		/****** math_Matrix::Add ******/
		/****** md5 signature: 87f4177fdbe163c96d8a51a770562f9d ******/
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
		/****** md5 signature: 28c2e839ac5c71f0376b1ad8c64cf8e9 ******/
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
		/****** md5 signature: 58367d54d6a80963c040900ad2215b45 ******/
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
		/****** md5 signature: 10425859fa8ae83557038b4d11e6e93b ******/
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
		math_VectorBase<> Col(const int Col);

		/****** math_Matrix::ColNumber ******/
		/****** md5 signature: b613ed0ada4ca1b47bc3f1fa0f6eb6bc ******/
		%feature("compactdefaultargs") ColNumber;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of rows of this matrix. Note that for a matrix A you always have the following relations: - A.RowNumber() = A.UpperRow() - A.LowerRow() + 1 - A.ColNumber() = A.UpperCol() - A.LowerCol() + 1 - the length of a row of A is equal to the number of columns of A, - the length of a column of A is equal to the number of rows of A.returns the row range of a matrix.
") ColNumber;
		int ColNumber();

		/****** math_Matrix::Determinant ******/
		/****** md5 signature: dca8c88718c9dc26a7061fa9f80ceb38 ******/
		%feature("compactdefaultargs") Determinant;
		%feature("autodoc", "Return
-------
double

Description
-----------
Computes the determinant of a matrix. An exception is raised if the matrix is not a square matrix.
") Determinant;
		double Determinant();

		/****** math_Matrix::Divide ******/
		/****** md5 signature: 86930af2f02bdcfbe25379d74397c171 ******/
		%feature("compactdefaultargs") Divide;
		%feature("autodoc", "
Parameters
----------
Right: double

Return
-------
None

Description
-----------
divides all the elements of a matrix by the value <Right>. An exception is raised if <Right> = 0.
") Divide;
		void Divide(const double Right);

		/****** math_Matrix::Divided ******/
		/****** md5 signature: 9a2b1db1d6ecc118dd7d6690b73dcc7d ******/
		%feature("compactdefaultargs") Divided;
		%feature("autodoc", "
Parameters
----------
Right: double

Return
-------
math_Matrix

Description
-----------
divides all the elements of a matrix by the value <Right>. An exception is raised if <Right> = 0.
") Divided;
		math_Matrix Divided(const double Right);

		/****** math_Matrix::Dump ******/
		/****** md5 signature: 30833bc6e8a9396b352ad751e657f8af ******/
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
		/****** md5 signature: dc9dcb2988d6e0c8ef01ef7f5a1a1fb4 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
InitialValue: double

Return
-------
None

Description
-----------
Initialize all the elements of a matrix to InitialValue.
") Init;
		void Init(const double InitialValue);

		/****** math_Matrix::Initialized ******/
		/****** md5 signature: 61b594241c6f91f9a44e2a038695bdfe ******/
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
		/****** md5 signature: 66fb35570ce08e9942fa5ca155cbf975 ******/
		%feature("compactdefaultargs") LowerCol;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the value of the Lower index of the column range of a matrix.
") LowerCol;
		int LowerCol();

		/****** math_Matrix::LowerRow ******/
		/****** md5 signature: a0970372396ba40ee0749d078af9913a ******/
		%feature("compactdefaultargs") LowerRow;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the value of the Lower index of the row range of a matrix.
") LowerRow;
		int LowerRow();

		/****** math_Matrix::Multiplied ******/
		/****** md5 signature: ba0236185bd6416f3c76738aee2a2f79 ******/
		%feature("compactdefaultargs") Multiplied;
		%feature("autodoc", "
Parameters
----------
Right: double

Return
-------
math_Matrix

Description
-----------
multiplies all the elements of a matrix by the value <Right>.
") Multiplied;
		math_Matrix Multiplied(const double Right);

		/****** math_Matrix::Multiplied ******/
		/****** md5 signature: f0f56699e10ef12f7fa29349867a189b ******/
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
		/****** md5 signature: 7609b90d22ebc393a973d9a48b56c8da ******/
		%feature("compactdefaultargs") Multiply;
		%feature("autodoc", "
Parameters
----------
Right: double

Return
-------
None

Description
-----------
Sets this matrix to the product of the matrix Left, and the matrix Right. Example math_Matrix A (1, 3, 1, 3); math_Matrix B (1, 3, 1, 3); // A = ... , B = ... math_Matrix C (1, 3, 1, 3); C.Multiply(A, B); Exceptions Standard_DimensionError if matrices are of incompatible dimensions, i.e. if: - the number of columns of matrix Left, or the number of rows of matrix TLeft is not equal to the number of rows of matrix Right, or - the number of rows of matrix Left, or the number of columns of matrix TLeft is not equal to the number of rows of this matrix, or - the number of columns of matrix Right is not equal to the number of columns of this matrix.
") Multiply;
		void Multiply(const double Right);

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
		/****** md5 signature: fa0ebcafaebe39a6764c1bd83b16c7b2 ******/
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
		/****** md5 signature: 045c6e216e26aa7c50f9fe697992d46c ******/
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
		/****** md5 signature: 34384ca2e05b1f10bb951ae43e47e134 ******/
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
		/****** md5 signature: 88c91837201e34afc098d8e32653b6f2 ******/
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
		math_VectorBase<> Row(const int Row);

		/****** math_Matrix::RowNumber ******/
		/****** md5 signature: 4474a2e1fff1c66ea1f8a797d3d1c7f4 ******/
		%feature("compactdefaultargs") RowNumber;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of rows of this matrix. Note that for a matrix A you always have the following relations: - A.RowNumber() = A.UpperRow() - A.LowerRow() + 1 - A.ColNumber() = A.UpperCol() - A.LowerCol() + 1 - the length of a row of A is equal to the number of columns of A, - the length of a column of A is equal to the number of rows of A.returns the row range of a matrix.
") RowNumber;
		int RowNumber();

		/****** math_Matrix::Set ******/
		/****** md5 signature: ab946cb6dadc0435be84166c7e7e72da ******/
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
		void Set(const int I1, const int I2, const int J1, const int J2, const math_Matrix & M);

		/****** math_Matrix::SetCol ******/
		/****** md5 signature: 9988c4d5186a951e7860863b8c68024a ******/
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
		void SetCol(const int Col, const math_VectorBase<> & V);

		/****** math_Matrix::SetDiag ******/
		/****** md5 signature: cf205fb42f4161d3e23c1c394ad125f3 ******/
		%feature("compactdefaultargs") SetDiag;
		%feature("autodoc", "
Parameters
----------
Value: double

Return
-------
None

Description
-----------
Sets the diagonal of a matrix to the value <Value>. An exception is raised if the matrix is not square.
") SetDiag;
		void SetDiag(const double Value);

		/****** math_Matrix::SetRow ******/
		/****** md5 signature: b01463894f10213fcdd35e5c52d1d68b ******/
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
		void SetRow(const int Row, const math_VectorBase<> & V);

		/****** math_Matrix::Subtract ******/
		/****** md5 signature: aacc09fe579518be9883763015b090f2 ******/
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
		/****** md5 signature: 7cf5d0149d2d8b57a6eb30cc340e7d2d ******/
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
		/****** md5 signature: 5fedb3dd55a1bd58f019bfba7f43f69d ******/
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
		/****** md5 signature: 285766d1ebbcfc3d909f193360b5557d ******/
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
		void SwapCol(const int Col1, const int Col2);

		/****** math_Matrix::SwapRow ******/
		/****** md5 signature: 9e2f075803870b308fcbcd437de5140a ******/
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
		void SwapRow(const int Row1, const int Row2);

		/****** math_Matrix::TMultiplied ******/
		/****** md5 signature: 99bc0fa9611d059742c8a31401710a9c ******/
		%feature("compactdefaultargs") TMultiplied;
		%feature("autodoc", "
Parameters
----------
Right: double

Return
-------
math_Matrix

Description
-----------
Sets this matrix to the product of the transposed matrix TLeft, and the matrix Right. Example math_Matrix A (1, 3, 1, 3); math_Matrix B (1, 3, 1, 3); // A = ... , B = ... math_Matrix C (1, 3, 1, 3); C.Multiply(A, B); Exceptions Standard_DimensionError if matrices are of incompatible dimensions, i.e. if: - the number of columns of matrix Left, or the number of rows of matrix TLeft is not equal to the number of rows of matrix Right, or - the number of rows of matrix Left, or the number of columns of matrix TLeft is not equal to the number of rows of this matrix, or - the number of columns of matrix Right is not equal to the number of columns of this matrix.
") TMultiplied;
		math_Matrix TMultiplied(const double Right);

		/****** math_Matrix::TMultiply ******/
		/****** md5 signature: 8af8eced1719e45e6f7974d2576805c4 ******/
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
		/****** md5 signature: 186ac841d104483d7545be43718c73de ******/
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
		/****** md5 signature: bc07613cc59add8383cfccb72c793ac6 ******/
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
		/****** md5 signature: 83eb622c6ba84eee124cd664f4ed03aa ******/
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
		/****** md5 signature: ab4fa82fe912b613c1b989f758dbef63 ******/
		%feature("compactdefaultargs") UpperCol;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the value of the upper index of the column range of a matrix.
") UpperCol;
		int UpperCol();

		/****** math_Matrix::UpperRow ******/
		/****** md5 signature: 58f748f5d3503c033014bfccc87ab1ba ******/
		%feature("compactdefaultargs") UpperRow;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the Upper index of the row range of a matrix.
") UpperRow;
		int UpperRow();

		/****** math_Matrix::Value ******/
		/****** md5 signature: 87e29194ce7512f991c3a85967f38e4c ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
Row: int
Col: int

Return
-------
double

Description
-----------
Accesses the value of index <Row> and <Col> of a matrix. An exception is raised if <Row> and <Col> are not in the correct range.
") Value;
		const double & Value(const int Row, const int Col);

		/****** math_Matrix::Value ******/
		/****** md5 signature: b827889a186ffd0f47afb7d45e27c1aa ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
Row: int
Col: int

Return
-------
double

Description
-----------
Accesses (in read or write mode) the value of index <Row> and <Col> of a matrix. An exception is raised if <Row> and <Col> are not in the correct range.
") Value;
		double & Value(const int Row, const int Col);

		/****** math_Matrix::operator * ******/
		/****** md5 signature: a4948ab122248eb039fd39ae71244fd2 ******/
		%feature("compactdefaultargs") operator *;
		%feature("autodoc", "
Parameters
----------
Right: double

Return
-------
math_Matrix

Description
-----------
No available documentation.
") operator *;
		math_Matrix operator *(const double Right);

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
    void __imul_wrapper__(const double other) {
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
		/****** md5 signature: 226f89245e85e0c1b70461839e0fb525 ******/
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
		/****** md5 signature: c786208e777084aa2504a2e24f21b5d1 ******/
		%feature("compactdefaultargs") operator /;
		%feature("autodoc", "
Parameters
----------
Right: double

Return
-------
math_Matrix

Description
-----------
No available documentation.
") operator /;
		math_Matrix operator /(const double Right);


%extend{
    void __itruediv_wrapper__(const double other) {
    *self /= other;
    }
}
%pythoncode {
def __itruediv__(self, right):
    self.__itruediv_wrapper__(right)
    return self
}
		%extend{
			double GetValue(int row, int col) const { return self->Value(row, col); }
			void SetValue(int row, int col, double v) { self->Value(row, col) = v; }
		};
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
		/****** md5 signature: acad3d2a092c98ec2e12739357a32247 ******/
		%feature("compactdefaultargs") GetStateNumber;
		%feature("autodoc", "Return
-------
int

Description
-----------
return the state of the function corresponding to the latestt call of any methods associated to the function. This function is called by each of the algorithms described later which define the function Integer Algorithm::StateNumber(). The algorithm has the responsibility to call this function when it has found a solution (i.e. a root or a minimum) and has to maintain the association between the solution found and this StateNumber. Byu default, this method returns 0 (which means for the algorithm: no state has been saved). It is the responsibility of the programmer to decide if he needs to save the current state of the function and to return an Integer that allows retrieval of the state.
") GetStateNumber;
		virtual int GetStateNumber();

		/****** math_MultipleVarFunction::NbVariables ******/
		/****** md5 signature: 5687662cdeff0d84a0d6a0e5c2ae3cf4 ******/
		%feature("compactdefaultargs") NbVariables;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of variables of the function.
") NbVariables;
		virtual int NbVariables();

		/****** math_MultipleVarFunction::Value ******/
		/****** md5 signature: 46a1bf965d9d361edfa711a1355f5705 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
X: math_Vector

Return
-------
F: double

Description
-----------
Computes the values of the Functions <F> for the variable <X>. returns True if the computation was done successfully, otherwise false.
") Value;
		virtual bool Value(const math_Vector & X, Standard_Real &OutValue);

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
		/****** md5 signature: 1573e6db8aff0b15f8f6297e2544852e ******/
		%feature("compactdefaultargs") math_NewtonFunctionRoot;
		%feature("autodoc", "
Parameters
----------
F: math_FunctionWithDerivative
Guess: double
EpsX: double
EpsF: double
NbIterations: int (optional, default to 100)

Return
-------
None

Description
-----------
The Newton method is done to find the root of the function F from the initial guess Guess. The tolerance required on the root is given by Tolerance. The solution is found when: abs(Xi - Xi-1) <= EpsX and abs(F(Xi))<= EpsF The maximum number of iterations allowed is given by NbIterations.
") math_NewtonFunctionRoot;
		 math_NewtonFunctionRoot(math_FunctionWithDerivative & F, const double Guess, const double EpsX, const double EpsF, const int NbIterations = 100);

		/****** math_NewtonFunctionRoot::math_NewtonFunctionRoot ******/
		/****** md5 signature: 6a9fba3fa8bca5143a3c6f01f7b9b2dc ******/
		%feature("compactdefaultargs") math_NewtonFunctionRoot;
		%feature("autodoc", "
Parameters
----------
F: math_FunctionWithDerivative
Guess: double
EpsX: double
EpsF: double
A: double
B: double
NbIterations: int (optional, default to 100)

Return
-------
None

Description
-----------
The Newton method is done to find the root of the function F from the initial guess Guess. The solution must be inside the interval [A, B]. The tolerance required on the root is given by Tolerance. The solution is found when: abs(Xi - Xi-1) <= EpsX and abs(F(Xi))<= EpsF The maximum number of iterations allowed is given by NbIterations.
") math_NewtonFunctionRoot;
		 math_NewtonFunctionRoot(math_FunctionWithDerivative & F, const double Guess, const double EpsX, const double EpsF, const double A, const double B, const int NbIterations = 100);

		/****** math_NewtonFunctionRoot::math_NewtonFunctionRoot ******/
		/****** md5 signature: faee7b56d470694ec1aebf4228d2cc5b ******/
		%feature("compactdefaultargs") math_NewtonFunctionRoot;
		%feature("autodoc", "
Parameters
----------
A: double
B: double
EpsX: double
EpsF: double
NbIterations: int (optional, default to 100)

Return
-------
None

Description
-----------
is used in a sub-class to initialize correctly all the fields of this class.
") math_NewtonFunctionRoot;
		 math_NewtonFunctionRoot(const double A, const double B, const double EpsX, const double EpsF, const int NbIterations = 100);

		/****** math_NewtonFunctionRoot::Derivative ******/
		/****** md5 signature: ad7aa922d44855788fc0f7a4658094e3 ******/
		%feature("compactdefaultargs") Derivative;
		%feature("autodoc", "Return
-------
double

Description
-----------
returns the value of the derivative at the root. Exception NotDone is raised if the root was not found.
") Derivative;
		double Derivative();

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
		/****** md5 signature: 1e1ad145af7d8c16b253ee9a4b0d6a43 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if the computations are successful, otherwise returns false.
") IsDone;
		bool IsDone();

		/****** math_NewtonFunctionRoot::NbIterations ******/
		/****** md5 signature: e2122843ad4b16fe4df700a084f7f785 ******/
		%feature("compactdefaultargs") NbIterations;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of iterations really done on the computation of the Root. Exception NotDone is raised if the root was not found.
") NbIterations;
		int NbIterations();

		/****** math_NewtonFunctionRoot::Perform ******/
		/****** md5 signature: f4a5a7b12c35e13df13ed95f3737424b ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
F: math_FunctionWithDerivative
Guess: double

Return
-------
None

Description
-----------
is used internally by the constructors.
") Perform;
		void Perform(math_FunctionWithDerivative & F, const double Guess);

		/****** math_NewtonFunctionRoot::Root ******/
		/****** md5 signature: 4cac472ec2e8bbc115a694c59e4b1b4e ******/
		%feature("compactdefaultargs") Root;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns the value of the root of function <F>. Exception NotDone is raised if the root was not found.
") Root;
		double Root();

		/****** math_NewtonFunctionRoot::Value ******/
		/****** md5 signature: dbdf6d9f5299cb6ef730d686d81d15db ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Return
-------
double

Description
-----------
returns the value of the function at the root. Exception NotDone is raised if the root was not found.
") Value;
		double Value();

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
		/****** md5 signature: 4b6c8fb3f7e2f62cb5181f44da62979d ******/
		%feature("compactdefaultargs") math_NewtonFunctionSetRoot;
		%feature("autodoc", "
Parameters
----------
theFunction: math_FunctionSetWithDerivatives
theXTolerance: math_Vector
theFTolerance: double
theNbIterations: int (optional, default to 100)

Return
-------
None

Description
-----------
Initialize correctly all the fields of this class. The range (1, F.NbVariables()) must be especially respected for all vectors and matrix declarations.
") math_NewtonFunctionSetRoot;
		 math_NewtonFunctionSetRoot(math_FunctionSetWithDerivatives & theFunction, const math_Vector & theXTolerance, const double theFTolerance, const int theNbIterations = 100);

		/****** math_NewtonFunctionSetRoot::math_NewtonFunctionSetRoot ******/
		/****** md5 signature: 21c744bfa813221b5ae428dad5577ace ******/
		%feature("compactdefaultargs") math_NewtonFunctionSetRoot;
		%feature("autodoc", "
Parameters
----------
theFunction: math_FunctionSetWithDerivatives
theFTolerance: double
theNbIterations: int (optional, default to 100)

Return
-------
None

Description
-----------
This constructor should be used in a sub-class to initialize correctly all the fields of this class. The range (1, F.NbVariables()) must be especially respected for all vectors and matrix declarations. The method SetTolerance must be called before performing the algorithm.
") math_NewtonFunctionSetRoot;
		 math_NewtonFunctionSetRoot(math_FunctionSetWithDerivatives & theFunction, const double theFTolerance, const int theNbIterations = 100);

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
		/****** md5 signature: 1e1ad145af7d8c16b253ee9a4b0d6a43 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if the computations are successful, otherwise returns false.
") IsDone;
		bool IsDone();

		/****** math_NewtonFunctionSetRoot::IsSolutionReached ******/
		/****** md5 signature: dda4d6e1773a3089bda24c9ac944db28 ******/
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
		virtual bool IsSolutionReached(math_FunctionSetWithDerivatives & F);

		/****** math_NewtonFunctionSetRoot::NbIterations ******/
		/****** md5 signature: e2122843ad4b16fe4df700a084f7f785 ******/
		%feature("compactdefaultargs") NbIterations;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of iterations really done during the computation of the Root. Exception NotDone is raised if the root was not found.
") NbIterations;
		int NbIterations();

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
		/****** md5 signature: 5f5b5e619d94be723ae0f511d2d43ed5 ******/
		%feature("compactdefaultargs") math_NewtonMinimum;
		%feature("autodoc", "
Parameters
----------
theFunction: math_MultipleVarFunctionWithHessian
theTolerance: double (optional, default to Precision::Confusion())
theNbIterations: int (optional, default to 40)
theConvexity: double (optional, default to 1.0e-6)
theWithSingularity: bool (optional, default to true)

Return
-------
None

Description
-----------
The tolerance required on the solution is given by Tolerance. Iteration are stopped if (!WithSingularity) and H(F(Xi)) is not definite positive (if the smaller eigenvalue of H < Convexity) or IsConverged() returns True for 2 successives Iterations. Warning: This constructor does not perform computation.
") math_NewtonMinimum;
		 math_NewtonMinimum(const math_MultipleVarFunctionWithHessian & theFunction, const double theTolerance = Precision::Confusion(), const int theNbIterations = 40, const double theConvexity = 1.0e-6, const bool theWithSingularity = true);

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
		/****** md5 signature: b5dbb105ff71e1288c5a57606ea67a36 ******/
		%feature("compactdefaultargs") IsConverged;
		%feature("autodoc", "Return
-------
bool

Description
-----------
This method is called at the end of each iteration to check the convergence: || Xi+1 - Xi || < Tolerance or || F(Xi+1) - F(Xi)|| < Tolerance * || F(Xi) || It can be redefined in a sub-class to implement a specific test.
") IsConverged;
		virtual bool IsConverged();

		/****** math_NewtonMinimum::IsDone ******/
		/****** md5 signature: 1e1ad145af7d8c16b253ee9a4b0d6a43 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Tests if an error has occurred.
") IsDone;
		bool IsDone();

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
		/****** md5 signature: 1125a6878024188eb4b06b555c7d51ea ******/
		%feature("compactdefaultargs") Minimum;
		%feature("autodoc", "Return
-------
double

Description
-----------
returns the value of the minimum. Exception NotDone is raised if the minimum was not found.
") Minimum;
		double Minimum();

		/****** math_NewtonMinimum::NbIterations ******/
		/****** md5 signature: e2122843ad4b16fe4df700a084f7f785 ******/
		%feature("compactdefaultargs") NbIterations;
		%feature("autodoc", "Return
-------
int

Description
-----------
returns the number of iterations really done in the calculation of the minimum. The exception NotDone is raised if an error has occurred.
") NbIterations;
		int NbIterations();

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
		/****** md5 signature: e88578dcbe64f5127ef9124fea954fe0 ******/
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
		 math_PSO(math_MultipleVarFunction * theFunc, const math_Vector & theLowBorder, const math_Vector & theUppBorder, const math_Vector & theSteps, const int theNbParticles = 32, const int theNbIter = 100);

		/****** math_PSO::Perform ******/
		/****** md5 signature: b5077e06ef78d71381573251071c3f83 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
theSteps: math_Vector
theOutPnt: math_Vector
theNbIter: int (optional, default to 100)

Return
-------
theValue: double

Description
-----------
Perform computations, particles array is constructed inside of this function.
") Perform;
		void Perform(const math_Vector & theSteps, Standard_Real &OutValue, math_Vector & theOutPnt, const int theNbIter = 100);

		/****** math_PSO::Perform ******/
		/****** md5 signature: ab033a70e6d755f8e780ce156a07b54d ******/
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
theValue: double

Description
-----------
Perform computations with given particles array.
") Perform;
		void Perform(math_PSOParticlesPool & theParticles, int theNbParticles, Standard_Real &OutValue, math_Vector & theOutPnt, const int theNbIter = 100);

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
		/****** md5 signature: f9a105d416a20e6e1238b3664a121bd8 ******/
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
		 math_PSOParticlesPool(const int theParticlesCount, const int theDimensionCount);

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
		/****** md5 signature: e4809651cf2ac0d587ba30321674769f ******/
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
		PSO_Particle * GetParticle(const int theIdx);

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
		/****** md5 signature: a6ba0fcbf6c21dd78a2d24eb77d8caf7 ******/
		%feature("compactdefaultargs") math_Powell;
		%feature("autodoc", "
Parameters
----------
theFunction: math_MultipleVarFunction
theTolerance: double
theNbIterations: int (optional, default to 200)
theZEPS: double (optional, default to 1.0e-12)

Return
-------
None

Description
-----------
Constructor. Initialize new entity.
") math_Powell;
		 math_Powell(const math_MultipleVarFunction & theFunction, const double theTolerance, const int theNbIterations = 200, const double theZEPS = 1.0e-12);

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
		/****** md5 signature: 1e1ad145af7d8c16b253ee9a4b0d6a43 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if the computations are successful, otherwise returns false.
") IsDone;
		bool IsDone();

		/****** math_Powell::IsSolutionReached ******/
		/****** md5 signature: 29267de7df856cb8ed632040fd5ddaae ******/
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
		virtual bool IsSolutionReached(math_MultipleVarFunction & theFunction);

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
		/****** md5 signature: 1125a6878024188eb4b06b555c7d51ea ******/
		%feature("compactdefaultargs") Minimum;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns the value of the minimum. Exception NotDone is raised if the minimum was not found.
") Minimum;
		double Minimum();

		/****** math_Powell::NbIterations ******/
		/****** md5 signature: e2122843ad4b16fe4df700a084f7f785 ******/
		%feature("compactdefaultargs") NbIterations;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of iterations really done during the computation of the minimum. Exception NotDone is raised if the minimum was not found.
") NbIterations;
		int NbIterations();

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
		/****** md5 signature: 1e1ad145af7d8c16b253ee9a4b0d6a43 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if the computations are successful, otherwise returns false.
") IsDone;
		bool IsDone();

		/****** math_SVD::PseudoInverse ******/
		/****** md5 signature: 6feef6a705a7d2d68a46543a0a762c15 ******/
		%feature("compactdefaultargs") PseudoInverse;
		%feature("autodoc", "
Parameters
----------
Inv: math_Matrix
Eps: double (optional, default to 1.0e-6)

Return
-------
None

Description
-----------
Computes the inverse Inv of matrix A such as A * Inverse = Identity. Exceptions StdFail_NotDone if the algorithm fails (and IsDone returns false). Standard_DimensionError if the ranges of Inv are compatible with the ranges of A.
") PseudoInverse;
		void PseudoInverse(math_Matrix & Inv, const double Eps = 1.0e-6);

		/****** math_SVD::Solve ******/
		/****** md5 signature: def77e60f7f0513a5cc589b572592cce ******/
		%feature("compactdefaultargs") Solve;
		%feature("autodoc", "
Parameters
----------
B: math_Vector
X: math_Vector
Eps: double (optional, default to 1.0e-6)

Return
-------
None

Description
-----------
Given the input Vector B this routine solves the set of linear equations A . X = B. Exception NotDone is raised if the decomposition of A was not done successfully. Exception DimensionError is raised if the range of B is not equal to the rowrange of A. Exception DimensionError is raised if the range of X is not equal to the colrange of A.
") Solve;
		void Solve(const math_Vector & B, math_Vector & X, const double Eps = 1.0e-6);

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
		/****** md5 signature: dfff6e2e21d1e52715c51fbd7c430801 ******/
		%feature("compactdefaultargs") math_TrigonometricFunctionRoots;
		%feature("autodoc", "
Parameters
----------
A: double
B: double
C: double
D: double
E: double
InfBound: double
SupBound: double

Return
-------
None

Description
-----------
Given coefficients a, b, c, d , e, this constructor performs the resolution of the equation above. The solutions must be contained in [InfBound, SupBound]. InfBound and SupBound can be set by default to 0 and 2*PI.
") math_TrigonometricFunctionRoots;
		 math_TrigonometricFunctionRoots(const double A, const double B, const double C, const double D, const double E, const double InfBound, const double SupBound);

		/****** math_TrigonometricFunctionRoots::math_TrigonometricFunctionRoots ******/
		/****** md5 signature: 68abeb7b3301891ddd4c9bd466048ebe ******/
		%feature("compactdefaultargs") math_TrigonometricFunctionRoots;
		%feature("autodoc", "
Parameters
----------
D: double
E: double
InfBound: double
SupBound: double

Return
-------
None

Description
-----------
Given the two coefficients d and e, it performs the resolution of d*sin(x) + e = 0. The solutions must be contained in [InfBound, SupBound]. InfBound and SupBound can be set by default to 0 and 2*PI.
") math_TrigonometricFunctionRoots;
		 math_TrigonometricFunctionRoots(const double D, const double E, const double InfBound, const double SupBound);

		/****** math_TrigonometricFunctionRoots::math_TrigonometricFunctionRoots ******/
		/****** md5 signature: bae83f2ff2f00d4c2c2f49d3a4196fdd ******/
		%feature("compactdefaultargs") math_TrigonometricFunctionRoots;
		%feature("autodoc", "
Parameters
----------
C: double
D: double
E: double
InfBound: double
SupBound: double

Return
-------
None

Description
-----------
Given the three coefficients c, d and e, it performs the resolution of c*std::cos(x) + d*sin(x) + e = 0. The solutions must be contained in [InfBound, SupBound]. InfBound and SupBound can be set by default to 0 and 2*PI.
") math_TrigonometricFunctionRoots;
		 math_TrigonometricFunctionRoots(const double C, const double D, const double E, const double InfBound, const double SupBound);

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
		/****** md5 signature: d38ed7337c369cb41b94e9a63e2e510b ******/
		%feature("compactdefaultargs") InfiniteRoots;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if there is an infinity of roots, otherwise returns false.
") InfiniteRoots;
		bool InfiniteRoots();

		/****** math_TrigonometricFunctionRoots::IsDone ******/
		/****** md5 signature: 1e1ad145af7d8c16b253ee9a4b0d6a43 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if the computations are successful, otherwise returns false.
") IsDone;
		bool IsDone();

		/****** math_TrigonometricFunctionRoots::NbSolutions ******/
		/****** md5 signature: 55162d50f2670468f6ab0d146e7a9b77 ******/
		%feature("compactdefaultargs") NbSolutions;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of solutions found. An exception is raised if NotDone. An exception is raised if there is an infinity of solutions.
") NbSolutions;
		int NbSolutions();

		/****** math_TrigonometricFunctionRoots::Value ******/
		/****** md5 signature: aff42ae108ec5c597d8f60d14b71f54d ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
double

Description
-----------
Returns the solution of range Index. An exception is raised if NotDone. An exception is raised if Index>NbSolutions. An exception is raised if there is an infinity of solutions.
") Value;
		double Value(const int Index);

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
		/****** md5 signature: f297246144f4bb14e2fbee0a7415c24e ******/
		%feature("compactdefaultargs") math_Uzawa;
		%feature("autodoc", "
Parameters
----------
Cont: math_Matrix
Secont: math_Vector
StartingPoint: math_Vector
EpsLix: double (optional, default to 1.0e-06)
EpsLic: double (optional, default to 1.0e-06)
NbIterations: int (optional, default to 500)

Return
-------
None

Description
-----------
Given an input matrix Cont, two input vectors Secont and StartingPoint, it solves Cont*X = Secont (only = equations) with a minimization of Norme(X-X0). The maximum iterations number allowed is fixed to NbIterations. The tolerance EpsLic is fixed for the dual variable convergence. The tolerance EpsLix is used for the convergence of X. Exception ConstructionError is raised if the line number of Cont is different from the length of Secont.
") math_Uzawa;
		 math_Uzawa(const math_Matrix & Cont, const math_Vector & Secont, const math_Vector & StartingPoint, const double EpsLix = 1.0e-06, const double EpsLic = 1.0e-06, const int NbIterations = 500);

		/****** math_Uzawa::math_Uzawa ******/
		/****** md5 signature: a2cfdaa40705f7adbc0927d9f5e72d93 ******/
		%feature("compactdefaultargs") math_Uzawa;
		%feature("autodoc", "
Parameters
----------
Cont: math_Matrix
Secont: math_Vector
StartingPoint: math_Vector
Nci: int
Nce: int
EpsLix: double (optional, default to 1.0e-06)
EpsLic: double (optional, default to 1.0e-06)
NbIterations: int (optional, default to 500)

Return
-------
None

Description
-----------
Given an input matrix Cont, two input vectors Secont and StartingPoint, it solves Cont*X = Secont (the Nce first equations are equal equations and the Nci last equations are inequalities <) with a minimization of Norme(X-X0). The maximum iterations number allowed is fixed to NbIterations. The tolerance EpsLic is fixed for the dual variable convergence. The tolerance EpsLix is used for the convergence of X. There are no conditions on Nce and Nci. Exception ConstructionError is raised if the line number of Cont is different from the length of Secont and from Nce + Nci.
") math_Uzawa;
		 math_Uzawa(const math_Matrix & Cont, const math_Vector & Secont, const math_Vector & StartingPoint, const int Nci, const int Nce, const double EpsLix = 1.0e-06, const double EpsLic = 1.0e-06, const int NbIterations = 500);

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
		/****** md5 signature: 1e1ad145af7d8c16b253ee9a4b0d6a43 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if the computations are successful, otherwise returns false.
") IsDone;
		bool IsDone();

		/****** math_Uzawa::NbIterations ******/
		/****** md5 signature: e2122843ad4b16fe4df700a084f7f785 ******/
		%feature("compactdefaultargs") NbIterations;
		%feature("autodoc", "Return
-------
int

Description
-----------
returns the number of iterations really done. An exception is raised if NotDone.
") NbIterations;
		int NbIterations();

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
		/****** md5 signature: 18016a1fabbca1c7e0b82559ee81f078 ******/
		%feature("compactdefaultargs") math_ValueAndWeight;
		%feature("autodoc", "
Parameters
----------
theValue: double
theWeight: double

Return
-------
None

Description
-----------
No available documentation.
") math_ValueAndWeight;
		 math_ValueAndWeight(double theValue, double theWeight);

		/****** math_ValueAndWeight::Value ******/
		/****** md5 signature: 22a617dfc5daa286b69c92ccf7672675 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Return
-------
double

Description
-----------
No available documentation.
") Value;
		double Value();

		/****** math_ValueAndWeight::Weight ******/
		/****** md5 signature: 91118e9597da178fb84751be00f33934 ******/
		%feature("compactdefaultargs") Weight;
		%feature("autodoc", "Return
-------
double

Description
-----------
No available documentation.
") Weight;
		double Weight();

};


%extend math_ValueAndWeight {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************
* class math_VectorBase *
************************/
/****************************************
* class math_FunctionSetWithDerivatives *
****************************************/
%nodefaultctor math_FunctionSetWithDerivatives;
class math_FunctionSetWithDerivatives : public math_FunctionSet {
	public:
		/****** math_FunctionSetWithDerivatives::Derivatives ******/
		/****** md5 signature: 01164ebb60c5b288b7ce1d425e721ae5 ******/
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
		virtual bool Derivatives(const math_Vector & X, math_Matrix & D);

		/****** math_FunctionSetWithDerivatives::NbEquations ******/
		/****** md5 signature: 746c3fc618e6d85fbd73ff7d2ecbde7d ******/
		%feature("compactdefaultargs") NbEquations;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of equations of the function.
") NbEquations;
		int NbEquations();

		/****** math_FunctionSetWithDerivatives::NbVariables ******/
		/****** md5 signature: cf9943f4a9947ddd2191834b3e7214eb ******/
		%feature("compactdefaultargs") NbVariables;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of variables of the function.
") NbVariables;
		int NbVariables();

		/****** math_FunctionSetWithDerivatives::Value ******/
		/****** md5 signature: 794c3bb5004c4e264fe0cc508be03e00 ******/
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
		bool Value(const math_Vector & X, math_Vector & F);

		/****** math_FunctionSetWithDerivatives::Values ******/
		/****** md5 signature: 035467084eef391ff0e16e782bd18547 ******/
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
		virtual bool Values(const math_Vector & X, math_Vector & F, math_Matrix & D);

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
		/****** md5 signature: 928a885a68af1bb834f443d030fe8bd5 ******/
		%feature("compactdefaultargs") Derivative;
		%feature("autodoc", "
Parameters
----------
X: double

Return
-------
D: double

Description
-----------
Computes the derivative <D> of the function for the variable <X>. Returns True if the calculation were successfully done, False otherwise.
") Derivative;
		virtual bool Derivative(const double X, Standard_Real &OutValue);

		/****** math_FunctionWithDerivative::Value ******/
		/****** md5 signature: 3c498e8a9149783c7c1d006f78d15c38 ******/
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
Computes the value <F>of the function for the variable <X>. Returns True if the calculation were successfully done, False otherwise.
") Value;
		bool Value(const double X, Standard_Real &OutValue);

		/****** math_FunctionWithDerivative::Values ******/
		/****** md5 signature: cb42caf7eef738bfe66dbcea244046f4 ******/
		%feature("compactdefaultargs") Values;
		%feature("autodoc", "
Parameters
----------
X: double

Return
-------
F: double
D: double

Description
-----------
Computes the value <F> and the derivative <D> of the function for the variable <X>. Returns True if the calculation were successfully done, False otherwise.
") Values;
		virtual bool Values(const double X, Standard_Real &OutValue, Standard_Real &OutValue);

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
		/****** md5 signature: 3cb2de0953acbf72ca02f03a765eca23 ******/
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
		virtual bool Gradient(const math_Vector & X, math_Vector & G);

		/****** math_MultipleVarFunctionWithGradient::NbVariables ******/
		/****** md5 signature: cf9943f4a9947ddd2191834b3e7214eb ******/
		%feature("compactdefaultargs") NbVariables;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of variables of the function.
") NbVariables;
		int NbVariables();

		/****** math_MultipleVarFunctionWithGradient::Value ******/
		/****** md5 signature: 1c817477ae4760739e47fd0899ce2e4f ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
X: math_Vector

Return
-------
F: double

Description
-----------
Computes the values of the Functions <F> for the variable <X>. Returns True if the computation was done successfully, False otherwise.
") Value;
		bool Value(const math_Vector & X, Standard_Real &OutValue);

		/****** math_MultipleVarFunctionWithGradient::Values ******/
		/****** md5 signature: 62b942c880cf35f1126b0fde9589edaa ******/
		%feature("compactdefaultargs") Values;
		%feature("autodoc", "
Parameters
----------
X: math_Vector
G: math_Vector

Return
-------
F: double

Description
-----------
computes the value <F> and the gradient <G> of the functions for the variable <X>. Returns True if the computation was done successfully, False otherwise.
") Values;
		virtual bool Values(const math_Vector & X, Standard_Real &OutValue, math_Vector & G);

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
		/****** md5 signature: d6d2c3992363c173da483f57504222d8 ******/
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
		bool Gradient(const math_Vector & X, math_Vector & G);

		/****** math_MultipleVarFunctionWithHessian::NbVariables ******/
		/****** md5 signature: cf9943f4a9947ddd2191834b3e7214eb ******/
		%feature("compactdefaultargs") NbVariables;
		%feature("autodoc", "Return
-------
int

Description
-----------
returns the number of variables of the function.
") NbVariables;
		int NbVariables();

		/****** math_MultipleVarFunctionWithHessian::Value ******/
		/****** md5 signature: 1c817477ae4760739e47fd0899ce2e4f ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
X: math_Vector

Return
-------
F: double

Description
-----------
computes the values of the Functions <F> for the variable <X>. Returns True if the computation was done successfully, False otherwise.
") Value;
		bool Value(const math_Vector & X, Standard_Real &OutValue);

		/****** math_MultipleVarFunctionWithHessian::Values ******/
		/****** md5 signature: 5f40d37af26b40b58961a891b0a62ac5 ******/
		%feature("compactdefaultargs") Values;
		%feature("autodoc", "
Parameters
----------
X: math_Vector
G: math_Vector

Return
-------
F: double

Description
-----------
computes the value <F> and the gradient <G> of the functions for the variable <X>. Returns True if the computation was done successfully, False otherwise.
") Values;
		bool Values(const math_Vector & X, Standard_Real &OutValue, math_Vector & G);

		/****** math_MultipleVarFunctionWithHessian::Values ******/
		/****** md5 signature: 5fc5344c7f3418d710472a70738b06d5 ******/
		%feature("compactdefaultargs") Values;
		%feature("autodoc", "
Parameters
----------
X: math_Vector
G: math_Vector
H: math_Matrix

Return
-------
F: double

Description
-----------
computes the value <F>, the gradient <G> and the hessian <H> of the functions for the variable <X>. Returns True if the computation was done successfully, False otherwise.
") Values;
		virtual bool Values(const math_Vector & X, Standard_Real &OutValue, math_Vector & G, math_Matrix & H);

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
		/****** md5 signature: 2aea7032a7c150a2e79eb0f25c223bd8 ******/
		%feature("compactdefaultargs") math_TrigonometricEquationFunction;
		%feature("autodoc", "
Parameters
----------
A: double
B: double
C: double
D: double
E: double

Return
-------
None

Description
-----------
No available documentation.
") math_TrigonometricEquationFunction;
		 math_TrigonometricEquationFunction(const double A, const double B, const double C, const double D, const double E);

		/****** math_TrigonometricEquationFunction::Derivative ******/
		/****** md5 signature: 542e1c0f76a33bdfc2ce4f079f0ea1f6 ******/
		%feature("compactdefaultargs") Derivative;
		%feature("autodoc", "
Parameters
----------
X: double

Return
-------
D: double

Description
-----------
No available documentation.
") Derivative;
		bool Derivative(const double X, Standard_Real &OutValue);

		/****** math_TrigonometricEquationFunction::Value ******/
		/****** md5 signature: 3303d9c7a6f197a1c8143979a8da73a4 ******/
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

		/****** math_TrigonometricEquationFunction::Values ******/
		/****** md5 signature: 310a3f89dae3b30ca4ed445db146a808 ******/
		%feature("compactdefaultargs") Values;
		%feature("autodoc", "
Parameters
----------
X: double

Return
-------
F: double
D: double

Description
-----------
No available documentation.
") Values;
		bool Values(const double X, Standard_Real &OutValue, Standard_Real &OutValue);

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
