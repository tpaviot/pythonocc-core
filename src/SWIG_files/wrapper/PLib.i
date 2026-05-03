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
%define PLIBDOCSTRING
"PLib module, see official documentation at
https://dev.opencascade.org/doc/occt-7.9.0/refman/html/package_plib.html"
%enddef
%module (package="OCC.Core", docstring=PLIBDOCSTRING) PLib


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
#include<PLib_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<GeomAbs_module.hxx>
#include<math_module.hxx>
#include<Message_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import GeomAbs.i
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

/*************
* class PLib *
*************/
%rename(plib) PLib;
class PLib {
	public:
		/****** PLib::Bin ******/
		/****** md5 signature: abb814e8f6a55c6a917ff1afde29ca78 ******/
		%feature("compactdefaultargs") Bin;
		%feature("autodoc", "
Parameters
----------
N: int
P: int

Return
-------
double

Description
-----------
Returns the Binomial Cnp. N should be <= BSplCLib::MaxDegree().
") Bin;
		static double Bin(const int N, const int P);

		/****** PLib::CoefficientsPoles ******/
		/****** md5 signature: 4fb9f13014e0914defaf97614d16c609 ******/
		%feature("compactdefaultargs") CoefficientsPoles;
		%feature("autodoc", "
Parameters
----------
Coefs: NCollection_Array1<gp_Pnt>
WCoefs: NCollection_Array1<double> *
Poles: NCollection_Array1<gp_Pnt>
WPoles: NCollection_Array1<double> *

Return
-------
None

Description
-----------
No available documentation.
") CoefficientsPoles;
		static void CoefficientsPoles(const NCollection_Array1<gp_Pnt> & Coefs, const NCollection_Array1<double> * WCoefs, NCollection_Array1<gp_Pnt> & Poles, NCollection_Array1<double> * WPoles);

		/****** PLib::CoefficientsPoles ******/
		/****** md5 signature: f382289df3f3ce7431443f27bb052c51 ******/
		%feature("compactdefaultargs") CoefficientsPoles;
		%feature("autodoc", "
Parameters
----------
Coefs: NCollection_Array1<gp_Pnt2d>
WCoefs: NCollection_Array1<double> *
Poles: NCollection_Array1<gp_Pnt2d>
WPoles: NCollection_Array1<double> *

Return
-------
None

Description
-----------
No available documentation.
") CoefficientsPoles;
		static void CoefficientsPoles(const NCollection_Array1<gp_Pnt2d> & Coefs, const NCollection_Array1<double> * WCoefs, NCollection_Array1<gp_Pnt2d> & Poles, NCollection_Array1<double> * WPoles);

		/****** PLib::CoefficientsPoles ******/
		/****** md5 signature: acabd0c3a475323f6106fc38c4817001 ******/
		%feature("compactdefaultargs") CoefficientsPoles;
		%feature("autodoc", "
Parameters
----------
Coefs: NCollection_Array1<double>
WCoefs: NCollection_Array1<double> *
Poles: NCollection_Array1<double>
WPoles: NCollection_Array1<double> *

Return
-------
None

Description
-----------
No available documentation.
") CoefficientsPoles;
		static void CoefficientsPoles(const NCollection_Array1<double> & Coefs, const NCollection_Array1<double> * WCoefs, NCollection_Array1<double> & Poles, NCollection_Array1<double> * WPoles);

		/****** PLib::CoefficientsPoles ******/
		/****** md5 signature: 7c57b21989b7a6983fed41304fbe98ec ******/
		%feature("compactdefaultargs") CoefficientsPoles;
		%feature("autodoc", "
Parameters
----------
dim: int
Coefs: NCollection_Array1<double>
WCoefs: NCollection_Array1<double> *
Poles: NCollection_Array1<double>
WPoles: NCollection_Array1<double> *

Return
-------
None

Description
-----------
No available documentation.
") CoefficientsPoles;
		static void CoefficientsPoles(const int dim, const NCollection_Array1<double> & Coefs, const NCollection_Array1<double> * WCoefs, NCollection_Array1<double> & Poles, NCollection_Array1<double> * WPoles);

		/****** PLib::CoefficientsPoles ******/
		/****** md5 signature: b51817673f79597d3972d469c9699ea1 ******/
		%feature("compactdefaultargs") CoefficientsPoles;
		%feature("autodoc", "
Parameters
----------
Coefs: NCollection_Array2<gp_Pnt>
WCoefs: NCollection_Array2<double> *
Poles: NCollection_Array2<gp_Pnt>
WPoles: NCollection_Array2<double> *

Return
-------
None

Description
-----------
No available documentation.
") CoefficientsPoles;
		static void CoefficientsPoles(const NCollection_Array2<gp_Pnt> & Coefs, const NCollection_Array2<double> * WCoefs, NCollection_Array2<gp_Pnt> & Poles, NCollection_Array2<double> * WPoles);

		/****** PLib::ConstraintOrder ******/
		/****** md5 signature: 53256c7e66cc7da06be49e3f4b582e9f ******/
		%feature("compactdefaultargs") ConstraintOrder;
		%feature("autodoc", "
Parameters
----------
NivConstr: int

Return
-------
GeomAbs_Shape

Description
-----------
translates from Integer to GeomAbs_Shape.
") ConstraintOrder;
		static GeomAbs_Shape ConstraintOrder(const int NivConstr);

		/****** PLib::EvalCubicHermite ******/
		/****** md5 signature: d07e26180c8edc401ec266f8d11a4c16 ******/
		%feature("compactdefaultargs") EvalCubicHermite;
		%feature("autodoc", "
Parameters
----------
U: double
DerivativeOrder: int
Dimension: int

Return
-------
ValueArray: double
DerivativeArray: double
ParameterArray: double
Results: double

Description
-----------
Performs the Cubic Hermite Interpolation of given series of points with given parameters with the requested derivative order. ValueArray stores the value at the first and last parameter. It has the following format: @code [0], [Dimension-1] : value at first param [Dimension], [Dimension + Dimension-1]: value at last param @endcode Derivative array stores the value of the derivatives at the first parameter and at the last parameter in the following format @code [0], [Dimension-1] : derivative at @endcode first param @code [Dimension], [Dimension + Dimension-1]: derivative at @endcode last param //! ParameterArray stores the first and last parameter in the following format: @code [0]: first parameter [1]: last parameter @endcode //! Results will store things in the following format with d = DerivativeOrder @code [0], [Dimension-1] : value [Dimension], [Dimension + Dimension-1]: first derivative //! [d *Dimension], [d*Dimension + Dimension-1]: dth derivative @endcode.
") EvalCubicHermite;
		static int EvalCubicHermite(const double U, const int DerivativeOrder, const int Dimension, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** PLib::EvalLagrange ******/
		/****** md5 signature: 00f5eedc19b5250e7a73e082ac6f01e8 ******/
		%feature("compactdefaultargs") EvalLagrange;
		%feature("autodoc", "
Parameters
----------
U: double
DerivativeOrder: int
Degree: int
Dimension: int

Return
-------
ValueArray: double
ParameterArray: double
Results: double

Description
-----------
Performs the Lagrange Interpolation of given series of points with given parameters with the requested derivative order Results will store things in the following format with d = DerivativeOrder @code [0], [Dimension-1] : value [Dimension], [Dimension + Dimension-1]: first derivative //! [d *Dimension], [d*Dimension + Dimension-1]: dth derivative @endcode.
") EvalLagrange;
		static int EvalLagrange(const double U, const int DerivativeOrder, const int Degree, const int Dimension, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** PLib::EvalLength ******/
		/****** md5 signature: 92da66086e9f0c6d600432157d8cc71d ******/
		%feature("compactdefaultargs") EvalLength;
		%feature("autodoc", "
Parameters
----------
Degree: int
Dimension: int
U1: double
U2: double

Return
-------
PolynomialCoeff: double
Length: double

Description
-----------
No available documentation.
") EvalLength;
		static void EvalLength(const int Degree, const int Dimension, Standard_Real &OutValue, const double U1, const double U2, Standard_Real &OutValue);

		/****** PLib::EvalLength ******/
		/****** md5 signature: 4dd367249a3b582d747ef22b6da0ce08 ******/
		%feature("compactdefaultargs") EvalLength;
		%feature("autodoc", "
Parameters
----------
Degree: int
Dimension: int
U1: double
U2: double
Tol: double

Return
-------
PolynomialCoeff: double
Length: double
Error: double

Description
-----------
No available documentation.
") EvalLength;
		static void EvalLength(const int Degree, const int Dimension, Standard_Real &OutValue, const double U1, const double U2, const double Tol, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** PLib::EvalPoly2Var ******/
		/****** md5 signature: 9a9a7c5c03e76b4c80e1ac78be95b000 ******/
		%feature("compactdefaultargs") EvalPoly2Var;
		%feature("autodoc", "
Parameters
----------
U: double
V: double
UDerivativeOrder: int
VDerivativeOrder: int
UDegree: int
VDegree: int
Dimension: int

Return
-------
PolynomialCoeff: double
Results: double

Description
-----------
Applies EvalPolynomial twice to evaluate the derivative of orders UDerivativeOrder in U, VDerivativeOrder in V at parameters U,V //! PolynomialCoeff are stored in the following fashion @code c00(1) .... c00(Dimension) c10(1) .... c10(Dimension) .... cm0(1) .... cm0(Dimension) .... c01(1) .... c01(Dimension) c11(1) .... c11(Dimension) .... cm1(1) .... cm1(Dimension) .... c0n(1) .... c0n(Dimension) c1n(1) .... c1n(Dimension) .... cmn(1) .... cmn(Dimension) @endcode where the polynomial is defined as: @code 2  m c00 + c10 U + c20 U + .... + cm0 U 2  m + c01 V + c11 UV + c21 U V + .... + cm1 U V n m n + .... + c0n V + .... + cmn U V @endcode with m = UDegree and n = VDegree //! Results stores the result in the following format @code f(1) f(2) .... f(Dimension) @endcode Warning: <Results> and <PolynomialCoeff> must be dimensioned properly.
") EvalPoly2Var;
		static void EvalPoly2Var(const double U, const double V, const int UDerivativeOrder, const int VDerivativeOrder, const int UDegree, const int VDegree, const int Dimension, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** PLib::EvalPolynomial ******/
		/****** md5 signature: 91f6e5a774f80954b0f7dd60401b1fb1 ******/
		%feature("compactdefaultargs") EvalPolynomial;
		%feature("autodoc", "
Parameters
----------
U: double
DerivativeOrder: int
Degree: int
Dimension: int
PolynomialCoeff: double

Return
-------
Results: double

Description
-----------
Performs Horner method with synthetic division for derivatives parameter <U>, with <Degree> and <Dimension>. PolynomialCoeff are stored in the following fashion @code c0(1) c0(2) .... c0(Dimension) c1(1) c1(2) .... c1(Dimension) //! cDegree(1) cDegree(2) .... cDegree(Dimension) @endcode where the polynomial is defined as: @code 2 Degree c0 + c1 X + c2 X + .... cDegree X @endcode Results stores the result in the following format @code f(1) f(2) .... f(Dimension) (1)  (1)  (1) f (1) f (2) .... f (Dimension) //! (DerivativeRequest) (DerivativeRequest) f (1)  f (Dimension) @endcode this just evaluates the point at parameter U //! Warning: <Results> and <PolynomialCoeff> must be dimensioned properly.
") EvalPolynomial;
		static void EvalPolynomial(const double U, const int DerivativeOrder, const int Degree, const int Dimension, const double & PolynomialCoeff, Standard_Real &OutValue);

		/****** PLib::GetPoles ******/
		/****** md5 signature: f033b61d9f599856e6cf45392d2c8352 ******/
		%feature("compactdefaultargs") GetPoles;
		%feature("autodoc", "
Parameters
----------
FP: NCollection_Array1<double>
Poles: NCollection_Array1<gp_Pnt>

Return
-------
None

Description
-----------
Get from FP the coordinates of the poles.
") GetPoles;
		static void GetPoles(const NCollection_Array1<double> & FP, NCollection_Array1<gp_Pnt> & Poles);

		/****** PLib::GetPoles ******/
		/****** md5 signature: 15bf4add2b580bbd9b51cb3a13faa760 ******/
		%feature("compactdefaultargs") GetPoles;
		%feature("autodoc", "
Parameters
----------
FP: NCollection_Array1<double>
Poles: NCollection_Array1<gp_Pnt>
Weights: NCollection_Array1<double>

Return
-------
None

Description
-----------
Get from FP the coordinates of the poles.
") GetPoles;
		static void GetPoles(const NCollection_Array1<double> & FP, NCollection_Array1<gp_Pnt> & Poles, NCollection_Array1<double> & Weights);

		/****** PLib::GetPoles ******/
		/****** md5 signature: c615c0b90e7b56042e62cac30fa6a1de ******/
		%feature("compactdefaultargs") GetPoles;
		%feature("autodoc", "
Parameters
----------
FP: NCollection_Array1<double>
Poles: NCollection_Array1<gp_Pnt2d>

Return
-------
None

Description
-----------
Get from FP the coordinates of the poles.
") GetPoles;
		static void GetPoles(const NCollection_Array1<double> & FP, NCollection_Array1<gp_Pnt2d> & Poles);

		/****** PLib::GetPoles ******/
		/****** md5 signature: 0f9aee84e43ca03ab9594a05decabcd1 ******/
		%feature("compactdefaultargs") GetPoles;
		%feature("autodoc", "
Parameters
----------
FP: NCollection_Array1<double>
Poles: NCollection_Array1<gp_Pnt2d>
Weights: NCollection_Array1<double>

Return
-------
None

Description
-----------
Get from FP the coordinates of the poles.
") GetPoles;
		static void GetPoles(const NCollection_Array1<double> & FP, NCollection_Array1<gp_Pnt2d> & Poles, NCollection_Array1<double> & Weights);

		/****** PLib::HermiteCoefficients ******/
		/****** md5 signature: 301c094fc8303f9cf9a4e5a55d3097ed ******/
		%feature("compactdefaultargs") HermiteCoefficients;
		%feature("autodoc", "
Parameters
----------
FirstParameter: double
LastParameter: double
FirstOrder: int
LastOrder: int
MatrixCoefs: math_Matrix

Return
-------
bool

Description
-----------
This build the coefficient of Hermite's polynomes on [FirstParameter, LastParameter] //! if j <= FirstOrder+1 then //! MatrixCoefs[i, j] = ith coefficient of the polynome H0,j-1 //! else //! MatrixCoefs[i, j] = ith coefficient of the polynome H1,k with k = j - FirstOrder - 2 //! return false if - |FirstParameter| > 100 - |LastParameter| > 100 - |FirstParameter| +|LastParameter| < 1/100 - |LastParameter - FirstParameter| / (|FirstParameter| +|LastParameter|) < 1/100.
") HermiteCoefficients;
		static bool HermiteCoefficients(const double FirstParameter, const double LastParameter, const int FirstOrder, const int LastOrder, math_Matrix & MatrixCoefs);

		/****** PLib::HermiteInterpolate ******/
		/****** md5 signature: d5e52d68b619e1e7b5d061a091477218 ******/
		%feature("compactdefaultargs") HermiteInterpolate;
		%feature("autodoc", "
Parameters
----------
Dimension: int
FirstParameter: double
LastParameter: double
FirstOrder: int
LastOrder: int
FirstConstr: NCollection_Array2<double>
LastConstr: NCollection_Array2<double>
Coefficients: NCollection_Array1<double>

Return
-------
bool

Description
-----------
Compute the coefficients in the canonical base of the polynomial satisfying the given constraints at the given parameters The array FirstContr(i,j) i=1,Dimension j=0,FirstOrder contains the values of the constraint at parameter FirstParameter idem for LastConstr.
") HermiteInterpolate;
		static bool HermiteInterpolate(const int Dimension, const double FirstParameter, const double LastParameter, const int FirstOrder, const int LastOrder, const NCollection_Array2<double> & FirstConstr, const NCollection_Array2<double> & LastConstr, NCollection_Array1<double> & Coefficients);

		/****** PLib::JacobiParameters ******/
		/****** md5 signature: 86f02c298b2fd226b1d1f5f4c33484e7 ******/
		%feature("compactdefaultargs") JacobiParameters;
		%feature("autodoc", "
Parameters
----------
ConstraintOrder: GeomAbs_Shape
MaxDegree: int
Code: int

Return
-------
NbGaussPoints: int
WorkDegree: int

Description
-----------
Compute the number of points used for integral computations (NbGaussPoints) and the degree of Jacobi Polynomial (WorkDegree). ConstraintOrder has to be GeomAbs_C0, GeomAbs_C1 or GeomAbs_C2 Code: Code d' init. des parametres de discretisation. = -5 = -4 = -3 = -2 = -1 = 1 calcul rapide avec precision moyenne. = 2 calcul rapide avec meilleure precision. = 3 calcul un peu plus lent avec bonne precision. = 4 calcul lent avec la meilleure precision possible.
") JacobiParameters;
		static void JacobiParameters(const GeomAbs_Shape ConstraintOrder, const int MaxDegree, const int Code, Standard_Integer &OutValue, Standard_Integer &OutValue);

		/****** PLib::NivConstr ******/
		/****** md5 signature: a3ce91e63bf3e3cd006ffc4400902f54 ******/
		%feature("compactdefaultargs") NivConstr;
		%feature("autodoc", "
Parameters
----------
ConstraintOrder: GeomAbs_Shape

Return
-------
int

Description
-----------
translates from GeomAbs_Shape to Integer.
") NivConstr;
		static int NivConstr(const GeomAbs_Shape ConstraintOrder);

		/****** PLib::NoDerivativeEvalPolynomial ******/
		/****** md5 signature: d3ffafe7b38d701671227e9d49765080 ******/
		%feature("compactdefaultargs") NoDerivativeEvalPolynomial;
		%feature("autodoc", "
Parameters
----------
U: double
Degree: int
Dimension: int
DegreeDimension: int
PolynomialCoeff: double

Return
-------
Results: double

Description
-----------
Same as above with DerivativeOrder = 0;.
") NoDerivativeEvalPolynomial;
		static void NoDerivativeEvalPolynomial(const double U, const int Degree, const int Dimension, const int DegreeDimension, const double & PolynomialCoeff, Standard_Real &OutValue);

		/****** PLib::NoWeights ******/
		/****** md5 signature: 7a26bbf1f2d8272609016a3180722de3 ******/
		%feature("compactdefaultargs") NoWeights;
		%feature("autodoc", "Return
-------
NCollection_Array1<double> *

Description
-----------
Used as argument for a non rational functions.
") NoWeights;
		static NCollection_Array1<double> * NoWeights();

		/****** PLib::NoWeights2 ******/
		/****** md5 signature: feddbe29885696d729c6c2f04a8e16c3 ******/
		%feature("compactdefaultargs") NoWeights2;
		%feature("autodoc", "Return
-------
NCollection_Array2<double> *

Description
-----------
Used as argument for a non rational functions.
") NoWeights2;
		static NCollection_Array2<double> * NoWeights2();

		/****** PLib::RationalDerivative ******/
		/****** md5 signature: 3a625ab6c5cdc57337cbc1a47cc09d0b ******/
		%feature("compactdefaultargs") RationalDerivative;
		%feature("autodoc", "
Parameters
----------
Degree: int
N: int
Dimension: int
All: bool (optional, default to true)

Return
-------
Ders: double
RDers: double

Description
-----------
Computes the derivatives of a ratio at order <N> in dimension <Dimension>. //! <Ders> is an array containing the values of the input derivatives from 0 to std::min(<N>,<Degree>). For orders higher than <Degree> the inputcd /s2d1/BMDL/ derivatives are assumed to be 0. //! Content of <Ders>: //! x(1),x(2),...,x(Dimension),w x'(1),x'(2),...,x'(Dimension),w' x''(1),x''(2),...,x''(Dimension),w'' //! If <All> is false, only the derivative at order <N> is computed. <RDers> is an array of length Dimension which will contain the result: //! x(1)/w , x(2)/w , ... derivated <N> times //! If <All> is true all the derivatives up to order <N> are computed. <RDers> is an array of length Dimension * (N+1) which will contains: //! x(1)/w , x(2)/w , ... x(1)/w , x(2)/w , ... derivated <1> times x(1)/w , x(2)/w , ... derivated <2> times ... x(1)/w , x(2)/w , ... derivated <N> times //! Warning: <RDers> must be dimensioned properly.
") RationalDerivative;
		static void RationalDerivative(const int Degree, const int N, const int Dimension, Standard_Real &OutValue, Standard_Real &OutValue, const bool All = true);

		/****** PLib::RationalDerivatives ******/
		/****** md5 signature: 8db45f817bd8c91967e19e4a9cdf5a1d ******/
		%feature("compactdefaultargs") RationalDerivatives;
		%feature("autodoc", "
Parameters
----------
DerivativesRequest: int
Dimension: int

Return
-------
PolesDerivatives: double
WeightsDerivatives: double
RationalDerivates: double

Description
-----------
Computes DerivativesRequest derivatives of a ratio at of a BSpline function of degree <Degree> dimension <Dimension>. //! <PolesDerivatives> is an array containing the values of the input derivatives from 0 to <DerivativeRequest> For orders higher than <Degree> the input derivatives are assumed to be 0. //! Content of <PoleasDerivatives>: //! x(1),x(2),...,x(Dimension) x'(1),x'(2),...,x'(Dimension) x''(1),x''(2),...,x''(Dimension) //! WeightsDerivatives is an array that contains derivatives from 0 to <DerivativeRequest> After returning from the routine the array RationalDerivatives contains the following x(1)/w , x(2)/w , ... x(1)/w , x(2)/w , ... derivated once x(1)/w , x(2)/w , ... twice x(1)/w , x(2)/w , ... derivated <DerivativeRequest> times //! The array RationalDerivatives and PolesDerivatives can be same since the overwrite is non destructive within the algorithm //! Warning: <RationalDerivates> must be dimensioned properly.
") RationalDerivatives;
		static void RationalDerivatives(const int DerivativesRequest, const int Dimension, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** PLib::SetPoles ******/
		/****** md5 signature: 4cf5583422810dde91dbfa9ba8b6fa76 ******/
		%feature("compactdefaultargs") SetPoles;
		%feature("autodoc", "
Parameters
----------
Poles: NCollection_Array1<gp_Pnt>
FP: NCollection_Array1<double>

Return
-------
None

Description
-----------
Copy in FP the coordinates of the poles.
") SetPoles;
		static void SetPoles(const NCollection_Array1<gp_Pnt> & Poles, NCollection_Array1<double> & FP);

		/****** PLib::SetPoles ******/
		/****** md5 signature: 1488fd9550b2538ed825bcf9e8081410 ******/
		%feature("compactdefaultargs") SetPoles;
		%feature("autodoc", "
Parameters
----------
Poles: NCollection_Array1<gp_Pnt>
Weights: NCollection_Array1<double>
FP: NCollection_Array1<double>

Return
-------
None

Description
-----------
Copy in FP the coordinates of the poles.
") SetPoles;
		static void SetPoles(const NCollection_Array1<gp_Pnt> & Poles, const NCollection_Array1<double> & Weights, NCollection_Array1<double> & FP);

		/****** PLib::SetPoles ******/
		/****** md5 signature: 318f9bdc3fec77d2c36fcf7268e62de3 ******/
		%feature("compactdefaultargs") SetPoles;
		%feature("autodoc", "
Parameters
----------
Poles: NCollection_Array1<gp_Pnt2d>
FP: NCollection_Array1<double>

Return
-------
None

Description
-----------
Copy in FP the coordinates of the poles.
") SetPoles;
		static void SetPoles(const NCollection_Array1<gp_Pnt2d> & Poles, NCollection_Array1<double> & FP);

		/****** PLib::SetPoles ******/
		/****** md5 signature: aeafe2165453f3ca7de9a5bfcd56c1bc ******/
		%feature("compactdefaultargs") SetPoles;
		%feature("autodoc", "
Parameters
----------
Poles: NCollection_Array1<gp_Pnt2d>
Weights: NCollection_Array1<double>
FP: NCollection_Array1<double>

Return
-------
None

Description
-----------
Copy in FP the coordinates of the poles.
") SetPoles;
		static void SetPoles(const NCollection_Array1<gp_Pnt2d> & Poles, const NCollection_Array1<double> & Weights, NCollection_Array1<double> & FP);

		/****** PLib::Trimming ******/
		/****** md5 signature: 9496e203d3df4c29653ee1b84fc6891c ******/
		%feature("compactdefaultargs") Trimming;
		%feature("autodoc", "
Parameters
----------
U1: double
U2: double
Coeffs: NCollection_Array1<gp_Pnt>
WCoeffs: NCollection_Array1<double> *

Return
-------
None

Description
-----------
No available documentation.
") Trimming;
		static void Trimming(const double U1, const double U2, NCollection_Array1<gp_Pnt> & Coeffs, NCollection_Array1<double> * WCoeffs);

		/****** PLib::Trimming ******/
		/****** md5 signature: 477962736294656736a2e32c28e5aca4 ******/
		%feature("compactdefaultargs") Trimming;
		%feature("autodoc", "
Parameters
----------
U1: double
U2: double
Coeffs: NCollection_Array1<gp_Pnt2d>
WCoeffs: NCollection_Array1<double> *

Return
-------
None

Description
-----------
No available documentation.
") Trimming;
		static void Trimming(const double U1, const double U2, NCollection_Array1<gp_Pnt2d> & Coeffs, NCollection_Array1<double> * WCoeffs);

		/****** PLib::Trimming ******/
		/****** md5 signature: 0f22fcf5a054ee4eba42fbfc52954a67 ******/
		%feature("compactdefaultargs") Trimming;
		%feature("autodoc", "
Parameters
----------
U1: double
U2: double
Coeffs: NCollection_Array1<double>
WCoeffs: NCollection_Array1<double> *

Return
-------
None

Description
-----------
No available documentation.
") Trimming;
		static void Trimming(const double U1, const double U2, NCollection_Array1<double> & Coeffs, NCollection_Array1<double> * WCoeffs);

		/****** PLib::Trimming ******/
		/****** md5 signature: 7fa2288f7532005cc3584953fb96d8e4 ******/
		%feature("compactdefaultargs") Trimming;
		%feature("autodoc", "
Parameters
----------
U1: double
U2: double
dim: int
Coeffs: NCollection_Array1<double>
WCoeffs: NCollection_Array1<double> *

Return
-------
None

Description
-----------
No available documentation.
") Trimming;
		static void Trimming(const double U1, const double U2, const int dim, NCollection_Array1<double> & Coeffs, NCollection_Array1<double> * WCoeffs);

		/****** PLib::UTrimming ******/
		/****** md5 signature: 61bab091cc3b40371fa7a2d1acf4b6a8 ******/
		%feature("compactdefaultargs") UTrimming;
		%feature("autodoc", "
Parameters
----------
U1: double
U2: double
Coeffs: NCollection_Array2<gp_Pnt>
WCoeffs: NCollection_Array2<double> *

Return
-------
None

Description
-----------
No available documentation.
") UTrimming;
		static void UTrimming(const double U1, const double U2, NCollection_Array2<gp_Pnt> & Coeffs, NCollection_Array2<double> * WCoeffs);

		/****** PLib::VTrimming ******/
		/****** md5 signature: a02aaf1bed57cfb85379dfd6d72b156c ******/
		%feature("compactdefaultargs") VTrimming;
		%feature("autodoc", "
Parameters
----------
V1: double
V2: double
Coeffs: NCollection_Array2<gp_Pnt>
WCoeffs: NCollection_Array2<double> *

Return
-------
None

Description
-----------
No available documentation.
") VTrimming;
		static void VTrimming(const double V1, const double V2, NCollection_Array2<gp_Pnt> & Coeffs, NCollection_Array2<double> * WCoeffs);

};


%extend PLib {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************
* class PLib_HermitJacobi *
**************************/
class PLib_HermitJacobi {
	public:
		/****** PLib_HermitJacobi::PLib_HermitJacobi ******/
		/****** md5 signature: e02664de846891b1e98cce2e86db39ce ******/
		%feature("compactdefaultargs") PLib_HermitJacobi;
		%feature("autodoc", "
Parameters
----------
WorkDegree: int
ConstraintOrder: GeomAbs_Shape

Return
-------
None

Description
-----------
Initialize the polynomial class Degree has to be <= 30 ConstraintOrder has to be GeomAbs_C0 GeomAbs_C1 GeomAbs_C2.
") PLib_HermitJacobi;
		 PLib_HermitJacobi(const int WorkDegree, const GeomAbs_Shape ConstraintOrder);

		/****** PLib_HermitJacobi::AverageError ******/
		/****** md5 signature: f4c117ac41c80439938e8365f43cb82e ******/
		%feature("compactdefaultargs") AverageError;
		%feature("autodoc", "
Parameters
----------
Dimension: int
NewDegree: int

Return
-------
HermJacCoeff: double

Description
-----------
No available documentation.
") AverageError;
		double AverageError(const int Dimension, Standard_Real &OutValue, const int NewDegree);

		/****** PLib_HermitJacobi::D0 ******/
		/****** md5 signature: 89260b3fa42812405ab17a8015595b34 ******/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "
Parameters
----------
U: double
BasisValue: NCollection_Array1<double>

Return
-------
None

Description
-----------
Compute the values of the basis functions in u.
") D0;
		void D0(const double U, NCollection_Array1<double> & BasisValue);

		/****** PLib_HermitJacobi::D1 ******/
		/****** md5 signature: f090c5982a7a6615fe68d02cb2bb712e ******/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "
Parameters
----------
U: double
BasisValue: NCollection_Array1<double>
BasisD1: NCollection_Array1<double>

Return
-------
None

Description
-----------
Compute the values and the derivatives values of the basis functions in u.
") D1;
		void D1(const double U, NCollection_Array1<double> & BasisValue, NCollection_Array1<double> & BasisD1);

		/****** PLib_HermitJacobi::D2 ******/
		/****** md5 signature: 1b6d1a29b1a90e7f44fcbae2c437530d ******/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "
Parameters
----------
U: double
BasisValue: NCollection_Array1<double>
BasisD1: NCollection_Array1<double>
BasisD2: NCollection_Array1<double>

Return
-------
None

Description
-----------
Compute the values and the derivatives values of the basis functions in u.
") D2;
		void D2(const double U, NCollection_Array1<double> & BasisValue, NCollection_Array1<double> & BasisD1, NCollection_Array1<double> & BasisD2);

		/****** PLib_HermitJacobi::D3 ******/
		/****** md5 signature: 16711236530cfe9c4d9437ece3203179 ******/
		%feature("compactdefaultargs") D3;
		%feature("autodoc", "
Parameters
----------
U: double
BasisValue: NCollection_Array1<double>
BasisD1: NCollection_Array1<double>
BasisD2: NCollection_Array1<double>
BasisD3: NCollection_Array1<double>

Return
-------
None

Description
-----------
Compute the values and the derivatives values of the basis functions in u.
") D3;
		void D3(const double U, NCollection_Array1<double> & BasisValue, NCollection_Array1<double> & BasisD1, NCollection_Array1<double> & BasisD2, NCollection_Array1<double> & BasisD3);

		/****** PLib_HermitJacobi::MaxError ******/
		/****** md5 signature: 80c009615ef33c4ca8b8b35e4666f2bc ******/
		%feature("compactdefaultargs") MaxError;
		%feature("autodoc", "
Parameters
----------
Dimension: int
NewDegree: int

Return
-------
HermJacCoeff: double

Description
-----------
This method computes the maximum error on the polynomial W(t) Q(t) obtained by missing the coefficients of JacCoeff from NewDegree +1 to Degree.
") MaxError;
		double MaxError(const int Dimension, Standard_Real &OutValue, const int NewDegree);

		/****** PLib_HermitJacobi::NivConstr ******/
		/****** md5 signature: 793a61e158f469ee31fec0a872a16048 ******/
		%feature("compactdefaultargs") NivConstr;
		%feature("autodoc", "Return
-------
int

Description
-----------
returns NivConstr.
") NivConstr;
		int NivConstr();

		/****** PLib_HermitJacobi::ReduceDegree ******/
		/****** md5 signature: f448dfb5c4ffa489abdc7289acb72225 ******/
		%feature("compactdefaultargs") ReduceDegree;
		%feature("autodoc", "
Parameters
----------
Dimension: int
MaxDegree: int
Tol: double

Return
-------
HermJacCoeff: double
NewDegree: int
MaxError: double

Description
-----------
Compute NewDegree <= MaxDegree so that MaxError is lower than Tol. MaxError can be greater than Tol if it is not possible to find a NewDegree <= MaxDegree. In this case NewDegree = MaxDegree.
") ReduceDegree;
		void ReduceDegree(const int Dimension, const int MaxDegree, const double Tol, Standard_Real &OutValue, Standard_Integer &OutValue, Standard_Real &OutValue);

		/****** PLib_HermitJacobi::ToCoefficients ******/
		/****** md5 signature: 491c477fc4bf6984f782380085e9a613 ******/
		%feature("compactdefaultargs") ToCoefficients;
		%feature("autodoc", "
Parameters
----------
Dimension: int
Degree: int
HermJacCoeff: NCollection_Array1<double>
Coefficients: NCollection_Array1<double>

Return
-------
None

Description
-----------
Convert the polynomial P(t) = H(t) + W(t) Q(t) in the canonical base.
") ToCoefficients;
		void ToCoefficients(const int Dimension, const int Degree, const NCollection_Array1<double> & HermJacCoeff, NCollection_Array1<double> & Coefficients);

		/****** PLib_HermitJacobi::WorkDegree ******/
		/****** md5 signature: 8e747418952629034df0e450b81de8ba ******/
		%feature("compactdefaultargs") WorkDegree;
		%feature("autodoc", "Return
-------
int

Description
-----------
returns WorkDegree.
") WorkDegree;
		int WorkDegree();

};


%extend PLib_HermitJacobi {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************
* class PLib_JacobiPolynomial *
******************************/
class PLib_JacobiPolynomial {
	public:
		/****** PLib_JacobiPolynomial::PLib_JacobiPolynomial ******/
		/****** md5 signature: d13038fab5e8e1f2b1b50270a157f0ea ******/
		%feature("compactdefaultargs") PLib_JacobiPolynomial;
		%feature("autodoc", "
Parameters
----------
theWorkDegree: int
theConstraintOrder: GeomAbs_Shape

Return
-------
None

Description
-----------
Initialize the polynomial class Degree has to be <= 30 ConstraintOrder has to be GeomAbs_C0 GeomAbs_C1 GeomAbs_C2.
") PLib_JacobiPolynomial;
		 PLib_JacobiPolynomial(const int theWorkDegree, const GeomAbs_Shape theConstraintOrder);

		/****** PLib_JacobiPolynomial::AverageError ******/
		/****** md5 signature: 50ab02303a73d2e00b902552b16ac052 ******/
		%feature("compactdefaultargs") AverageError;
		%feature("autodoc", "
Parameters
----------
theDimension: int
theNewDegree: int

Return
-------
theJacCoeff: double

Description
-----------
No available documentation.
") AverageError;
		double AverageError(const int theDimension, Standard_Real &OutValue, const int theNewDegree);

		/****** PLib_JacobiPolynomial::D0 ******/
		/****** md5 signature: b869a3702dec7a8850c3b0f198275afa ******/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "
Parameters
----------
theU: double
theBasisValue: NCollection_Array1<double>

Return
-------
None

Description
-----------
Compute the values of the basis functions in u.
") D0;
		void D0(const double theU, NCollection_Array1<double> & theBasisValue);

		/****** PLib_JacobiPolynomial::D1 ******/
		/****** md5 signature: f7ff663a7314949d77f69a37f74f495c ******/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "
Parameters
----------
theU: double
theBasisValue: NCollection_Array1<double>
theBasisD1: NCollection_Array1<double>

Return
-------
None

Description
-----------
Compute the values and the derivatives values of the basis functions in u.
") D1;
		void D1(const double theU, NCollection_Array1<double> & theBasisValue, NCollection_Array1<double> & theBasisD1);

		/****** PLib_JacobiPolynomial::D2 ******/
		/****** md5 signature: 2b4754fcbd2caab02544cffee70a90c5 ******/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "
Parameters
----------
theU: double
theBasisValue: NCollection_Array1<double>
theBasisD1: NCollection_Array1<double>
theBasisD2: NCollection_Array1<double>

Return
-------
None

Description
-----------
Compute the values and the derivatives values of the basis functions in u.
") D2;
		void D2(const double theU, NCollection_Array1<double> & theBasisValue, NCollection_Array1<double> & theBasisD1, NCollection_Array1<double> & theBasisD2);

		/****** PLib_JacobiPolynomial::D3 ******/
		/****** md5 signature: 39b5d1a2b9f0a731c4248a61562aebb6 ******/
		%feature("compactdefaultargs") D3;
		%feature("autodoc", "
Parameters
----------
theU: double
theBasisValue: NCollection_Array1<double>
theBasisD1: NCollection_Array1<double>
theBasisD2: NCollection_Array1<double>
theBasisD3: NCollection_Array1<double>

Return
-------
None

Description
-----------
Compute the values and the derivatives values of the basis functions in u.
") D3;
		void D3(const double theU, NCollection_Array1<double> & theBasisValue, NCollection_Array1<double> & theBasisD1, NCollection_Array1<double> & theBasisD2, NCollection_Array1<double> & theBasisD3);

		/****** PLib_JacobiPolynomial::MaxError ******/
		/****** md5 signature: 7ae7426b62ac1c3511e98efa6bb7e1a4 ******/
		%feature("compactdefaultargs") MaxError;
		%feature("autodoc", "
Parameters
----------
theDimension: int
theNewDegree: int

Return
-------
theJacCoeff: double

Description
-----------
This method computes the maximum error on the polynomial W(t) Q(t) obtained by missing the coefficients of JacCoeff from NewDegree +1 to Degree.
") MaxError;
		double MaxError(const int theDimension, Standard_Real &OutValue, const int theNewDegree);

		/****** PLib_JacobiPolynomial::MaxValue ******/
		/****** md5 signature: 319dea4eefcb3fa3a64214d6cff769fe ******/
		%feature("compactdefaultargs") MaxValue;
		%feature("autodoc", "
Parameters
----------
theTabMax: NCollection_Array1<double>

Return
-------
None

Description
-----------
this method loads for k=0,q the maximum value of abs ( W(t)*Jk(t) ) for t bellonging to [-1,1] This values are loaded is the array TabMax(0,myWorkDegree-2*(myNivConst+1)) MaxValue ( me ; TabMaxPointer: in out Real );.
") MaxValue;
		void MaxValue(NCollection_Array1<double> & theTabMax);

		/****** PLib_JacobiPolynomial::NivConstr ******/
		/****** md5 signature: 793a61e158f469ee31fec0a872a16048 ******/
		%feature("compactdefaultargs") NivConstr;
		%feature("autodoc", "Return
-------
int

Description
-----------
returns NivConstr.
") NivConstr;
		int NivConstr();

		/****** PLib_JacobiPolynomial::Points ******/
		/****** md5 signature: 64bd1c7c286bfe4447333667288e7bdc ******/
		%feature("compactdefaultargs") Points;
		%feature("autodoc", "
Parameters
----------
theNbGaussPoints: int
theTabPoints: NCollection_Array1<double>

Return
-------
None

Description
-----------
returns the Jacobi Points for Gauss integration ie the positive values of the Legendre roots by increasing values NbGaussPoints is the number of points chosen for the integral computation. TabPoints (0,NbGaussPoints/2) TabPoints (0) is loaded only for the odd values of NbGaussPoints The possible values for NbGaussPoints are: 8, 10, 15, 20, 25, 30, 35, 40, 50, 61 NbGaussPoints must be greater than Degree.
") Points;
		void Points(const int theNbGaussPoints, NCollection_Array1<double> & theTabPoints);

		/****** PLib_JacobiPolynomial::ReduceDegree ******/
		/****** md5 signature: acfc511668abe7e8dda3d65ad67474a5 ******/
		%feature("compactdefaultargs") ReduceDegree;
		%feature("autodoc", "
Parameters
----------
theDimension: int
theMaxDegree: int
theTol: double

Return
-------
theJacCoeff: double
theNewDegree: int
theMaxError: double

Description
-----------
Compute NewDegree <= MaxDegree so that MaxError is lower than Tol. MaxError can be greater than Tol if it is not possible to find a NewDegree <= MaxDegree. In this case NewDegree = MaxDegree.
") ReduceDegree;
		void ReduceDegree(const int theDimension, const int theMaxDegree, const double theTol, Standard_Real &OutValue, Standard_Integer &OutValue, Standard_Real &OutValue);

		/****** PLib_JacobiPolynomial::ToCoefficients ******/
		/****** md5 signature: 8c290c72d8140288eba2ee5372732662 ******/
		%feature("compactdefaultargs") ToCoefficients;
		%feature("autodoc", "
Parameters
----------
theDimension: int
theDegree: int
theJacCoeff: NCollection_Array1<double>
theCoefficients: NCollection_Array1<double>

Return
-------
None

Description
-----------
Convert the polynomial P(t) = R(t) + W(t) Q(t) in the canonical base.
") ToCoefficients;
		void ToCoefficients(const int theDimension, const int theDegree, const NCollection_Array1<double> & theJacCoeff, NCollection_Array1<double> & theCoefficients);

		/****** PLib_JacobiPolynomial::Weights ******/
		/****** md5 signature: f29c29e807dcdd2e4d79acba6d0b7935 ******/
		%feature("compactdefaultargs") Weights;
		%feature("autodoc", "
Parameters
----------
theNbGaussPoints: int
theTabWeights: NCollection_Array2<double>

Return
-------
None

Description
-----------
returns the Jacobi weights for Gauss integration only for the positive values of the Legendre roots in the order they are given by the method Points NbGaussPoints is the number of points chosen for the integral computation. TabWeights (0,NbGaussPoints/2,0,Degree) TabWeights (0,.) are only loaded for the odd values of NbGaussPoints The possible values for NbGaussPoints are: 8, 10, 15, 20, 25, 30, 35, 40, 50, 61 NbGaussPoints must be greater than Degree.
") Weights;
		void Weights(const int theNbGaussPoints, NCollection_Array2<double> & theTabWeights);

		/****** PLib_JacobiPolynomial::WorkDegree ******/
		/****** md5 signature: 8e747418952629034df0e450b81de8ba ******/
		%feature("compactdefaultargs") WorkDegree;
		%feature("autodoc", "Return
-------
int

Description
-----------
returns WorkDegree.
") WorkDegree;
		int WorkDegree();

};


%extend PLib_JacobiPolynomial {
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
def plib_Bin(*args):
	return plib.Bin(*args)

@deprecated
def plib_CoefficientsPoles(*args):
	return plib.CoefficientsPoles(*args)

@deprecated
def plib_CoefficientsPoles(*args):
	return plib.CoefficientsPoles(*args)

@deprecated
def plib_CoefficientsPoles(*args):
	return plib.CoefficientsPoles(*args)

@deprecated
def plib_CoefficientsPoles(*args):
	return plib.CoefficientsPoles(*args)

@deprecated
def plib_CoefficientsPoles(*args):
	return plib.CoefficientsPoles(*args)

@deprecated
def plib_ConstraintOrder(*args):
	return plib.ConstraintOrder(*args)

@deprecated
def plib_EvalCubicHermite(*args):
	return plib.EvalCubicHermite(*args)

@deprecated
def plib_EvalLagrange(*args):
	return plib.EvalLagrange(*args)

@deprecated
def plib_EvalLength(*args):
	return plib.EvalLength(*args)

@deprecated
def plib_EvalLength(*args):
	return plib.EvalLength(*args)

@deprecated
def plib_EvalPoly2Var(*args):
	return plib.EvalPoly2Var(*args)

@deprecated
def plib_EvalPolynomial(*args):
	return plib.EvalPolynomial(*args)

@deprecated
def plib_GetPoles(*args):
	return plib.GetPoles(*args)

@deprecated
def plib_GetPoles(*args):
	return plib.GetPoles(*args)

@deprecated
def plib_GetPoles(*args):
	return plib.GetPoles(*args)

@deprecated
def plib_GetPoles(*args):
	return plib.GetPoles(*args)

@deprecated
def plib_HermiteCoefficients(*args):
	return plib.HermiteCoefficients(*args)

@deprecated
def plib_HermiteInterpolate(*args):
	return plib.HermiteInterpolate(*args)

@deprecated
def plib_JacobiParameters(*args):
	return plib.JacobiParameters(*args)

@deprecated
def plib_NivConstr(*args):
	return plib.NivConstr(*args)

@deprecated
def plib_NoDerivativeEvalPolynomial(*args):
	return plib.NoDerivativeEvalPolynomial(*args)

@deprecated
def plib_NoWeights(*args):
	return plib.NoWeights(*args)

@deprecated
def plib_NoWeights2(*args):
	return plib.NoWeights2(*args)

@deprecated
def plib_RationalDerivative(*args):
	return plib.RationalDerivative(*args)

@deprecated
def plib_RationalDerivatives(*args):
	return plib.RationalDerivatives(*args)

@deprecated
def plib_SetPoles(*args):
	return plib.SetPoles(*args)

@deprecated
def plib_SetPoles(*args):
	return plib.SetPoles(*args)

@deprecated
def plib_SetPoles(*args):
	return plib.SetPoles(*args)

@deprecated
def plib_SetPoles(*args):
	return plib.SetPoles(*args)

@deprecated
def plib_Trimming(*args):
	return plib.Trimming(*args)

@deprecated
def plib_Trimming(*args):
	return plib.Trimming(*args)

@deprecated
def plib_Trimming(*args):
	return plib.Trimming(*args)

@deprecated
def plib_Trimming(*args):
	return plib.Trimming(*args)

@deprecated
def plib_UTrimming(*args):
	return plib.UTrimming(*args)

@deprecated
def plib_VTrimming(*args):
	return plib.VTrimming(*args)

}
