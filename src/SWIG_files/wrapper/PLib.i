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
%define PLIBDOCSTRING
"PLib module, see official documentation at
https://dev.opencascade.org/doc/occt-7.8.0/refman/html/package_plib.html"
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
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
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
%import TColgp.i
%import TColStd.i
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
%wrap_handle(PLib_Base)
%wrap_handle(PLib_HermitJacobi)
%wrap_handle(PLib_JacobiPolynomial)
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
		/****** md5 signature: e4b9b3840dd91f636abfcd255a208497 ******/
		%feature("compactdefaultargs") Bin;
		%feature("autodoc", "
Parameters
----------
N: int
P: int

Return
-------
float

Description
-----------
Returns the Binomial Cnp. N should be <= BSplCLib::MaxDegree().
") Bin;
		static Standard_Real Bin(const Standard_Integer N, const Standard_Integer P);

		/****** PLib::CoefficientsPoles ******/
		/****** md5 signature: 195b25b4fc3f47a2d3abcac292c0176f ******/
		%feature("compactdefaultargs") CoefficientsPoles;
		%feature("autodoc", "
Parameters
----------
Coefs: TColgp_Array1OfPnt
WCoefs: TColStd_Array1OfReal *
Poles: TColgp_Array1OfPnt
WPoles: TColStd_Array1OfReal *

Return
-------
None

Description
-----------
No available documentation.
") CoefficientsPoles;
		static void CoefficientsPoles(const TColgp_Array1OfPnt & Coefs, const TColStd_Array1OfReal * WCoefs, TColgp_Array1OfPnt & Poles, TColStd_Array1OfReal * WPoles);

		/****** PLib::CoefficientsPoles ******/
		/****** md5 signature: 63a65fa5260f82dd66eaf7230614332f ******/
		%feature("compactdefaultargs") CoefficientsPoles;
		%feature("autodoc", "
Parameters
----------
Coefs: TColgp_Array1OfPnt2d
WCoefs: TColStd_Array1OfReal *
Poles: TColgp_Array1OfPnt2d
WPoles: TColStd_Array1OfReal *

Return
-------
None

Description
-----------
No available documentation.
") CoefficientsPoles;
		static void CoefficientsPoles(const TColgp_Array1OfPnt2d & Coefs, const TColStd_Array1OfReal * WCoefs, TColgp_Array1OfPnt2d & Poles, TColStd_Array1OfReal * WPoles);

		/****** PLib::CoefficientsPoles ******/
		/****** md5 signature: c17e5fac9521597fee289a3e908c8f4a ******/
		%feature("compactdefaultargs") CoefficientsPoles;
		%feature("autodoc", "
Parameters
----------
Coefs: TColStd_Array1OfReal
WCoefs: TColStd_Array1OfReal *
Poles: TColStd_Array1OfReal
WPoles: TColStd_Array1OfReal *

Return
-------
None

Description
-----------
No available documentation.
") CoefficientsPoles;
		static void CoefficientsPoles(const TColStd_Array1OfReal & Coefs, const TColStd_Array1OfReal * WCoefs, TColStd_Array1OfReal & Poles, TColStd_Array1OfReal * WPoles);

		/****** PLib::CoefficientsPoles ******/
		/****** md5 signature: a1c040d1c8b25e8ca6d970e69ba4cb59 ******/
		%feature("compactdefaultargs") CoefficientsPoles;
		%feature("autodoc", "
Parameters
----------
dim: int
Coefs: TColStd_Array1OfReal
WCoefs: TColStd_Array1OfReal *
Poles: TColStd_Array1OfReal
WPoles: TColStd_Array1OfReal *

Return
-------
None

Description
-----------
No available documentation.
") CoefficientsPoles;
		static void CoefficientsPoles(const Standard_Integer dim, const TColStd_Array1OfReal & Coefs, const TColStd_Array1OfReal * WCoefs, TColStd_Array1OfReal & Poles, TColStd_Array1OfReal * WPoles);

		/****** PLib::CoefficientsPoles ******/
		/****** md5 signature: 1928d807b7a7d000457f8323ac17dd0b ******/
		%feature("compactdefaultargs") CoefficientsPoles;
		%feature("autodoc", "
Parameters
----------
Coefs: TColgp_Array2OfPnt
WCoefs: TColStd_Array2OfReal *
Poles: TColgp_Array2OfPnt
WPoles: TColStd_Array2OfReal *

Return
-------
None

Description
-----------
No available documentation.
") CoefficientsPoles;
		static void CoefficientsPoles(const TColgp_Array2OfPnt & Coefs, const TColStd_Array2OfReal * WCoefs, TColgp_Array2OfPnt & Poles, TColStd_Array2OfReal * WPoles);

		/****** PLib::ConstraintOrder ******/
		/****** md5 signature: c3e04cc0436b2e274987d2c1758747ef ******/
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
		static GeomAbs_Shape ConstraintOrder(const Standard_Integer NivConstr);

		/****** PLib::EvalCubicHermite ******/
		/****** md5 signature: 70b5084cb477532383770ec1daed2d40 ******/
		%feature("compactdefaultargs") EvalCubicHermite;
		%feature("autodoc", "
Parameters
----------
U: float
DerivativeOrder: int
Dimension: int

Return
-------
ValueArray: float
DerivativeArray: float
ParameterArray: float
Results: float

Description
-----------
Performs the Cubic Hermite Interpolation of given series of points with given parameters with the requested derivative order. ValueArray stores the value at the first and last parameter. It has the following format: @code [0], [Dimension-1] : value at first param [Dimension], [Dimension + Dimension-1]: value at last param @endcode Derivative array stores the value of the derivatives at the first parameter and at the last parameter in the following format @code [0], [Dimension-1] : derivative at @endcode first param @code [Dimension], [Dimension + Dimension-1]: derivative at @endcode last param //! ParameterArray stores the first and last parameter in the following format: @code [0]: first parameter [1]: last parameter @endcode //! Results will store things in the following format with d = DerivativeOrder @code [0], [Dimension-1] : value [Dimension], [Dimension + Dimension-1]: first derivative //! [d *Dimension], [d*Dimension + Dimension-1]: dth derivative @endcode.
") EvalCubicHermite;
		static Standard_Integer EvalCubicHermite(const Standard_Real U, const Standard_Integer DerivativeOrder, const Standard_Integer Dimension, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** PLib::EvalLagrange ******/
		/****** md5 signature: db70dc230b872e9d346e3aab66b28d83 ******/
		%feature("compactdefaultargs") EvalLagrange;
		%feature("autodoc", "
Parameters
----------
U: float
DerivativeOrder: int
Degree: int
Dimension: int

Return
-------
ValueArray: float
ParameterArray: float
Results: float

Description
-----------
Performs the Lagrange Interpolation of given series of points with given parameters with the requested derivative order Results will store things in the following format with d = DerivativeOrder @code [0], [Dimension-1] : value [Dimension], [Dimension + Dimension-1]: first derivative //! [d *Dimension], [d*Dimension + Dimension-1]: dth derivative @endcode.
") EvalLagrange;
		static Standard_Integer EvalLagrange(const Standard_Real U, const Standard_Integer DerivativeOrder, const Standard_Integer Degree, const Standard_Integer Dimension, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** PLib::EvalLength ******/
		/****** md5 signature: 3aa31ba2f2ab37b1f6fc9b8bdcf6816f ******/
		%feature("compactdefaultargs") EvalLength;
		%feature("autodoc", "
Parameters
----------
Degree: int
Dimension: int
U1: float
U2: float

Return
-------
PolynomialCoeff: float
Length: float

Description
-----------
No available documentation.
") EvalLength;
		static void EvalLength(const Standard_Integer Degree, const Standard_Integer Dimension, Standard_Real &OutValue, const Standard_Real U1, const Standard_Real U2, Standard_Real &OutValue);

		/****** PLib::EvalLength ******/
		/****** md5 signature: 267e4cccfb903dd0fdb924058dd1468b ******/
		%feature("compactdefaultargs") EvalLength;
		%feature("autodoc", "
Parameters
----------
Degree: int
Dimension: int
U1: float
U2: float
Tol: float

Return
-------
PolynomialCoeff: float
Length: float
Error: float

Description
-----------
No available documentation.
") EvalLength;
		static void EvalLength(const Standard_Integer Degree, const Standard_Integer Dimension, Standard_Real &OutValue, const Standard_Real U1, const Standard_Real U2, const Standard_Real Tol, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** PLib::EvalPoly2Var ******/
		/****** md5 signature: f820034b111d664eb87d8d6417e36fc7 ******/
		%feature("compactdefaultargs") EvalPoly2Var;
		%feature("autodoc", "
Parameters
----------
U: float
V: float
UDerivativeOrder: int
VDerivativeOrder: int
UDegree: int
VDegree: int
Dimension: int

Return
-------
PolynomialCoeff: float
Results: float

Description
-----------
Applies EvalPolynomial twice to evaluate the derivative of orders UDerivativeOrder in U, VDerivativeOrder in V at parameters U,V //! PolynomialCoeff are stored in the following fashion @code c00(1) .... c00(Dimension) c10(1) .... c10(Dimension) .... cm0(1) .... cm0(Dimension) .... c01(1) .... c01(Dimension) c11(1) .... c11(Dimension) .... cm1(1) .... cm1(Dimension) .... c0n(1) .... c0n(Dimension) c1n(1) .... c1n(Dimension) .... cmn(1) .... cmn(Dimension) @endcode where the polynomial is defined as: @code 2  m c00 + c10 U + c20 U + .... + cm0 U 2  m + c01 V + c11 UV + c21 U V + .... + cm1 U V n m n + .... + c0n V + .... + cmn U V @endcode with m = UDegree and n = VDegree //! Results stores the result in the following format @code f(1) f(2) .... f(Dimension) @endcode Warning: <Results> and <PolynomialCoeff> must be dimensioned properly.
") EvalPoly2Var;
		static void EvalPoly2Var(const Standard_Real U, const Standard_Real V, const Standard_Integer UDerivativeOrder, const Standard_Integer VDerivativeOrder, const Standard_Integer UDegree, const Standard_Integer VDegree, const Standard_Integer Dimension, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** PLib::EvalPolynomial ******/
		/****** md5 signature: ab7638add7201ad9dc7d8b63cb124efa ******/
		%feature("compactdefaultargs") EvalPolynomial;
		%feature("autodoc", "
Parameters
----------
U: float
DerivativeOrder: int
Degree: int
Dimension: int

Return
-------
PolynomialCoeff: float
Results: float

Description
-----------
Performs Horner method with synthetic division for derivatives parameter <U>, with <Degree> and <Dimension>. PolynomialCoeff are stored in the following fashion @code c0(1) c0(2) .... c0(Dimension) c1(1) c1(2) .... c1(Dimension) //! cDegree(1) cDegree(2) .... cDegree(Dimension) @endcode where the polynomial is defined as: @code 2 Degree c0 + c1 X + c2 X + .... cDegree X @endcode Results stores the result in the following format @code f(1) f(2) .... f(Dimension) (1)  (1)  (1) f (1) f (2) .... f (Dimension) //! (DerivativeRequest) (DerivativeRequest) f (1)  f (Dimension) @endcode this just evaluates the point at parameter U //! Warning: <Results> and <PolynomialCoeff> must be dimensioned properly.
") EvalPolynomial;
		static void EvalPolynomial(const Standard_Real U, const Standard_Integer DerivativeOrder, const Standard_Integer Degree, const Standard_Integer Dimension, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** PLib::GetPoles ******/
		/****** md5 signature: 2874b68a426f530b41fb67400bb8aae7 ******/
		%feature("compactdefaultargs") GetPoles;
		%feature("autodoc", "
Parameters
----------
FP: TColStd_Array1OfReal
Poles: TColgp_Array1OfPnt

Return
-------
None

Description
-----------
Get from FP the coordinates of the poles.
") GetPoles;
		static void GetPoles(const TColStd_Array1OfReal & FP, TColgp_Array1OfPnt & Poles);

		/****** PLib::GetPoles ******/
		/****** md5 signature: c37f131df7c30bbe3fca9344aa3fc8da ******/
		%feature("compactdefaultargs") GetPoles;
		%feature("autodoc", "
Parameters
----------
FP: TColStd_Array1OfReal
Poles: TColgp_Array1OfPnt
Weights: TColStd_Array1OfReal

Return
-------
None

Description
-----------
Get from FP the coordinates of the poles.
") GetPoles;
		static void GetPoles(const TColStd_Array1OfReal & FP, TColgp_Array1OfPnt & Poles, TColStd_Array1OfReal & Weights);

		/****** PLib::GetPoles ******/
		/****** md5 signature: ddf0d332e656e1c3a043920fe83ffb70 ******/
		%feature("compactdefaultargs") GetPoles;
		%feature("autodoc", "
Parameters
----------
FP: TColStd_Array1OfReal
Poles: TColgp_Array1OfPnt2d

Return
-------
None

Description
-----------
Get from FP the coordinates of the poles.
") GetPoles;
		static void GetPoles(const TColStd_Array1OfReal & FP, TColgp_Array1OfPnt2d & Poles);

		/****** PLib::GetPoles ******/
		/****** md5 signature: b34f0e2297a04885105b1f320932d644 ******/
		%feature("compactdefaultargs") GetPoles;
		%feature("autodoc", "
Parameters
----------
FP: TColStd_Array1OfReal
Poles: TColgp_Array1OfPnt2d
Weights: TColStd_Array1OfReal

Return
-------
None

Description
-----------
Get from FP the coordinates of the poles.
") GetPoles;
		static void GetPoles(const TColStd_Array1OfReal & FP, TColgp_Array1OfPnt2d & Poles, TColStd_Array1OfReal & Weights);

		/****** PLib::HermiteCoefficients ******/
		/****** md5 signature: f870a248c586ad640a2195fe36341a77 ******/
		%feature("compactdefaultargs") HermiteCoefficients;
		%feature("autodoc", "
Parameters
----------
FirstParameter: float
LastParameter: float
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
		static Standard_Boolean HermiteCoefficients(const Standard_Real FirstParameter, const Standard_Real LastParameter, const Standard_Integer FirstOrder, const Standard_Integer LastOrder, math_Matrix & MatrixCoefs);

		/****** PLib::HermiteInterpolate ******/
		/****** md5 signature: 46e9dad0babe6a2a789abf9623adf18f ******/
		%feature("compactdefaultargs") HermiteInterpolate;
		%feature("autodoc", "
Parameters
----------
Dimension: int
FirstParameter: float
LastParameter: float
FirstOrder: int
LastOrder: int
FirstConstr: TColStd_Array2OfReal
LastConstr: TColStd_Array2OfReal
Coefficients: TColStd_Array1OfReal

Return
-------
bool

Description
-----------
Compute the coefficients in the canonical base of the polynomial satisfying the given constraints at the given parameters The array FirstContr(i,j) i=1,Dimension j=0,FirstOrder contains the values of the constraint at parameter FirstParameter idem for LastConstr.
") HermiteInterpolate;
		static Standard_Boolean HermiteInterpolate(const Standard_Integer Dimension, const Standard_Real FirstParameter, const Standard_Real LastParameter, const Standard_Integer FirstOrder, const Standard_Integer LastOrder, const TColStd_Array2OfReal & FirstConstr, const TColStd_Array2OfReal & LastConstr, TColStd_Array1OfReal & Coefficients);

		/****** PLib::JacobiParameters ******/
		/****** md5 signature: 16abc4702f8918e99ae70cddff5b364d ******/
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
		static void JacobiParameters(const GeomAbs_Shape ConstraintOrder, const Standard_Integer MaxDegree, const Standard_Integer Code, Standard_Integer &OutValue, Standard_Integer &OutValue);

		/****** PLib::NivConstr ******/
		/****** md5 signature: 0da399a2a4094066f87aa5554c588dfe ******/
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
		static Standard_Integer NivConstr(const GeomAbs_Shape ConstraintOrder);

		/****** PLib::NoDerivativeEvalPolynomial ******/
		/****** md5 signature: b734aed0c3d7b9e9e322b362cd422d18 ******/
		%feature("compactdefaultargs") NoDerivativeEvalPolynomial;
		%feature("autodoc", "
Parameters
----------
U: float
Degree: int
Dimension: int
DegreeDimension: int

Return
-------
PolynomialCoeff: float
Results: float

Description
-----------
Same as above with DerivativeOrder = 0;.
") NoDerivativeEvalPolynomial;
		static void NoDerivativeEvalPolynomial(const Standard_Real U, const Standard_Integer Degree, const Standard_Integer Dimension, const Standard_Integer DegreeDimension, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** PLib::NoWeights ******/
		/****** md5 signature: c62456e1087764e789de71e3c64f70ac ******/
		%feature("compactdefaultargs") NoWeights;
		%feature("autodoc", "Return
-------
TColStd_Array1OfReal *

Description
-----------
Used as argument for a non rational functions.
") NoWeights;
		static TColStd_Array1OfReal * NoWeights();

		/****** PLib::NoWeights2 ******/
		/****** md5 signature: 4e85666f7316eb9ea248be00715a2600 ******/
		%feature("compactdefaultargs") NoWeights2;
		%feature("autodoc", "Return
-------
TColStd_Array2OfReal *

Description
-----------
Used as argument for a non rational functions.
") NoWeights2;
		static TColStd_Array2OfReal * NoWeights2();

		/****** PLib::RationalDerivative ******/
		/****** md5 signature: 73b52c09f25fc1cb9a4f36df7003b108 ******/
		%feature("compactdefaultargs") RationalDerivative;
		%feature("autodoc", "
Parameters
----------
Degree: int
N: int
Dimension: int
All: bool (optional, default to Standard_True)

Return
-------
Ders: float
RDers: float

Description
-----------
Computes the derivatives of a ratio at order <N> in dimension <Dimension>. //! <Ders> is an array containing the values of the input derivatives from 0 to Min(<N>,<Degree>). For orders higher than <Degree> the inputcd /s2d1/BMDL/ derivatives are assumed to be 0. //! Content of <Ders>: //! x(1),x(2),...,x(Dimension),w x'(1),x'(2),...,x'(Dimension),w' x''(1),x''(2),...,x''(Dimension),w'' //! If <All> is false, only the derivative at order <N> is computed. <RDers> is an array of length Dimension which will contain the result: //! x(1)/w , x(2)/w , ... derivated <N> times //! If <All> is true all the derivatives up to order <N> are computed. <RDers> is an array of length Dimension * (N+1) which will contains: //! x(1)/w , x(2)/w , ... x(1)/w , x(2)/w , ... derivated <1> times x(1)/w , x(2)/w , ... derivated <2> times ... x(1)/w , x(2)/w , ... derivated <N> times //! Warning: <RDers> must be dimensioned properly.
") RationalDerivative;
		static void RationalDerivative(const Standard_Integer Degree, const Standard_Integer N, const Standard_Integer Dimension, Standard_Real &OutValue, Standard_Real &OutValue, const Standard_Boolean All = Standard_True);

		/****** PLib::RationalDerivatives ******/
		/****** md5 signature: 181f56d901cd67387121827789aa2d4b ******/
		%feature("compactdefaultargs") RationalDerivatives;
		%feature("autodoc", "
Parameters
----------
DerivativesRequest: int
Dimension: int

Return
-------
PolesDerivatives: float
WeightsDerivatives: float
RationalDerivates: float

Description
-----------
Computes DerivativesRequest derivatives of a ratio at of a BSpline function of degree <Degree> dimension <Dimension>. //! <PolesDerivatives> is an array containing the values of the input derivatives from 0 to <DerivativeRequest> For orders higher than <Degree> the input derivatives are assumed to be 0. //! Content of <PoleasDerivatives>: //! x(1),x(2),...,x(Dimension) x'(1),x'(2),...,x'(Dimension) x''(1),x''(2),...,x''(Dimension) //! WeightsDerivatives is an array that contains derivatives from 0 to <DerivativeRequest> After returning from the routine the array RationalDerivatives contains the following x(1)/w , x(2)/w , ... x(1)/w , x(2)/w , ... derivated once x(1)/w , x(2)/w , ... twice x(1)/w , x(2)/w , ... derivated <DerivativeRequest> times //! The array RationalDerivatives and PolesDerivatives can be same since the overwrite is non destructive within the algorithm //! Warning: <RationalDerivates> must be dimensioned properly.
") RationalDerivatives;
		static void RationalDerivatives(const Standard_Integer DerivativesRequest, const Standard_Integer Dimension, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** PLib::SetPoles ******/
		/****** md5 signature: 6863d9194c7fb66b1688878d0f0370ef ******/
		%feature("compactdefaultargs") SetPoles;
		%feature("autodoc", "
Parameters
----------
Poles: TColgp_Array1OfPnt
FP: TColStd_Array1OfReal

Return
-------
None

Description
-----------
Copy in FP the coordinates of the poles.
") SetPoles;
		static void SetPoles(const TColgp_Array1OfPnt & Poles, TColStd_Array1OfReal & FP);

		/****** PLib::SetPoles ******/
		/****** md5 signature: a37c76776d33a974dd4d6d361b465857 ******/
		%feature("compactdefaultargs") SetPoles;
		%feature("autodoc", "
Parameters
----------
Poles: TColgp_Array1OfPnt
Weights: TColStd_Array1OfReal
FP: TColStd_Array1OfReal

Return
-------
None

Description
-----------
Copy in FP the coordinates of the poles.
") SetPoles;
		static void SetPoles(const TColgp_Array1OfPnt & Poles, const TColStd_Array1OfReal & Weights, TColStd_Array1OfReal & FP);

		/****** PLib::SetPoles ******/
		/****** md5 signature: cdcb170a2456b522559c0a3585f22913 ******/
		%feature("compactdefaultargs") SetPoles;
		%feature("autodoc", "
Parameters
----------
Poles: TColgp_Array1OfPnt2d
FP: TColStd_Array1OfReal

Return
-------
None

Description
-----------
Copy in FP the coordinates of the poles.
") SetPoles;
		static void SetPoles(const TColgp_Array1OfPnt2d & Poles, TColStd_Array1OfReal & FP);

		/****** PLib::SetPoles ******/
		/****** md5 signature: f375797a6c7bf3162c62e48364aecaec ******/
		%feature("compactdefaultargs") SetPoles;
		%feature("autodoc", "
Parameters
----------
Poles: TColgp_Array1OfPnt2d
Weights: TColStd_Array1OfReal
FP: TColStd_Array1OfReal

Return
-------
None

Description
-----------
Copy in FP the coordinates of the poles.
") SetPoles;
		static void SetPoles(const TColgp_Array1OfPnt2d & Poles, const TColStd_Array1OfReal & Weights, TColStd_Array1OfReal & FP);

		/****** PLib::Trimming ******/
		/****** md5 signature: 6609651055bd7c0e00841abc195f1706 ******/
		%feature("compactdefaultargs") Trimming;
		%feature("autodoc", "
Parameters
----------
U1: float
U2: float
Coeffs: TColgp_Array1OfPnt
WCoeffs: TColStd_Array1OfReal *

Return
-------
None

Description
-----------
No available documentation.
") Trimming;
		static void Trimming(const Standard_Real U1, const Standard_Real U2, TColgp_Array1OfPnt & Coeffs, TColStd_Array1OfReal * WCoeffs);

		/****** PLib::Trimming ******/
		/****** md5 signature: 7eeab872da522f8774bfc35b5b5f5919 ******/
		%feature("compactdefaultargs") Trimming;
		%feature("autodoc", "
Parameters
----------
U1: float
U2: float
Coeffs: TColgp_Array1OfPnt2d
WCoeffs: TColStd_Array1OfReal *

Return
-------
None

Description
-----------
No available documentation.
") Trimming;
		static void Trimming(const Standard_Real U1, const Standard_Real U2, TColgp_Array1OfPnt2d & Coeffs, TColStd_Array1OfReal * WCoeffs);

		/****** PLib::Trimming ******/
		/****** md5 signature: 974b1a36e127e05843f89ecf24f7ba7b ******/
		%feature("compactdefaultargs") Trimming;
		%feature("autodoc", "
Parameters
----------
U1: float
U2: float
Coeffs: TColStd_Array1OfReal
WCoeffs: TColStd_Array1OfReal *

Return
-------
None

Description
-----------
No available documentation.
") Trimming;
		static void Trimming(const Standard_Real U1, const Standard_Real U2, TColStd_Array1OfReal & Coeffs, TColStd_Array1OfReal * WCoeffs);

		/****** PLib::Trimming ******/
		/****** md5 signature: 988ea67a983cad3e330deec4dd65618a ******/
		%feature("compactdefaultargs") Trimming;
		%feature("autodoc", "
Parameters
----------
U1: float
U2: float
dim: int
Coeffs: TColStd_Array1OfReal
WCoeffs: TColStd_Array1OfReal *

Return
-------
None

Description
-----------
No available documentation.
") Trimming;
		static void Trimming(const Standard_Real U1, const Standard_Real U2, const Standard_Integer dim, TColStd_Array1OfReal & Coeffs, TColStd_Array1OfReal * WCoeffs);

		/****** PLib::UTrimming ******/
		/****** md5 signature: ccff40edf0e7de4bc4a182d01d29bccc ******/
		%feature("compactdefaultargs") UTrimming;
		%feature("autodoc", "
Parameters
----------
U1: float
U2: float
Coeffs: TColgp_Array2OfPnt
WCoeffs: TColStd_Array2OfReal *

Return
-------
None

Description
-----------
No available documentation.
") UTrimming;
		static void UTrimming(const Standard_Real U1, const Standard_Real U2, TColgp_Array2OfPnt & Coeffs, TColStd_Array2OfReal * WCoeffs);

		/****** PLib::VTrimming ******/
		/****** md5 signature: 788469a98a448c44619d0216add2bfd5 ******/
		%feature("compactdefaultargs") VTrimming;
		%feature("autodoc", "
Parameters
----------
V1: float
V2: float
Coeffs: TColgp_Array2OfPnt
WCoeffs: TColStd_Array2OfReal *

Return
-------
None

Description
-----------
No available documentation.
") VTrimming;
		static void VTrimming(const Standard_Real V1, const Standard_Real V2, TColgp_Array2OfPnt & Coeffs, TColStd_Array2OfReal * WCoeffs);

};


%extend PLib {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************
* class PLib_Base *
******************/
%nodefaultctor PLib_Base;
class PLib_Base : public Standard_Transient {
	public:
		/****** PLib_Base::D0 ******/
		/****** md5 signature: f5babd3072a7b188ca9fffa004c97654 ******/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "
Parameters
----------
U: float
BasisValue: TColStd_Array1OfReal

Return
-------
None

Description
-----------
Compute the values of the basis functions in u.
") D0;
		virtual void D0(const Standard_Real U, TColStd_Array1OfReal & BasisValue);

		/****** PLib_Base::D1 ******/
		/****** md5 signature: d9d9a58968cf2d0e1e57a17f029b9b19 ******/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "
Parameters
----------
U: float
BasisValue: TColStd_Array1OfReal
BasisD1: TColStd_Array1OfReal

Return
-------
None

Description
-----------
Compute the values and the derivatives values of the basis functions in u.
") D1;
		virtual void D1(const Standard_Real U, TColStd_Array1OfReal & BasisValue, TColStd_Array1OfReal & BasisD1);

		/****** PLib_Base::D2 ******/
		/****** md5 signature: 134c337bf429a01cef36366523309f86 ******/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "
Parameters
----------
U: float
BasisValue: TColStd_Array1OfReal
BasisD1: TColStd_Array1OfReal
BasisD2: TColStd_Array1OfReal

Return
-------
None

Description
-----------
Compute the values and the derivatives values of the basis functions in u.
") D2;
		virtual void D2(const Standard_Real U, TColStd_Array1OfReal & BasisValue, TColStd_Array1OfReal & BasisD1, TColStd_Array1OfReal & BasisD2);

		/****** PLib_Base::D3 ******/
		/****** md5 signature: 66c75b8d20f2e32609ebd575117d6026 ******/
		%feature("compactdefaultargs") D3;
		%feature("autodoc", "
Parameters
----------
U: float
BasisValue: TColStd_Array1OfReal
BasisD1: TColStd_Array1OfReal
BasisD2: TColStd_Array1OfReal
BasisD3: TColStd_Array1OfReal

Return
-------
None

Description
-----------
Compute the values and the derivatives values of the basis functions in u.
") D3;
		virtual void D3(const Standard_Real U, TColStd_Array1OfReal & BasisValue, TColStd_Array1OfReal & BasisD1, TColStd_Array1OfReal & BasisD2, TColStd_Array1OfReal & BasisD3);

		/****** PLib_Base::ReduceDegree ******/
		/****** md5 signature: ca1b70fa2f327261ff1d4aea96cde1e7 ******/
		%feature("compactdefaultargs") ReduceDegree;
		%feature("autodoc", "
Parameters
----------
Dimension: int
MaxDegree: int
Tol: float

Return
-------
BaseCoeff: float
NewDegree: int
MaxError: float

Description
-----------
Compute NewDegree <= MaxDegree so that MaxError is lower than Tol. MaxError can be greater than Tol if it is not possible to find a NewDegree <= MaxDegree. In this case NewDegree = MaxDegree.
") ReduceDegree;
		virtual void ReduceDegree(const Standard_Integer Dimension, const Standard_Integer MaxDegree, const Standard_Real Tol, Standard_Real &OutValue, Standard_Integer &OutValue, Standard_Real &OutValue);

		/****** PLib_Base::ToCoefficients ******/
		/****** md5 signature: f782a7c383866602d159de31b8e68112 ******/
		%feature("compactdefaultargs") ToCoefficients;
		%feature("autodoc", "
Parameters
----------
Dimension: int
Degree: int
CoeffinBase: TColStd_Array1OfReal
Coefficients: TColStd_Array1OfReal

Return
-------
None

Description
-----------
Convert the polynomial P(t) in the canonical base.
") ToCoefficients;
		virtual void ToCoefficients(const Standard_Integer Dimension, const Standard_Integer Degree, const TColStd_Array1OfReal & CoeffinBase, TColStd_Array1OfReal & Coefficients);

		/****** PLib_Base::WorkDegree ******/
		/****** md5 signature: 9a1ca2a01d0260cba5c5864a0622a4bb ******/
		%feature("compactdefaultargs") WorkDegree;
		%feature("autodoc", "Return
-------
int

Description
-----------
returns WorkDegree.
") WorkDegree;
		virtual Standard_Integer WorkDegree();

};


%make_alias(PLib_Base)

%extend PLib_Base {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************************
* class PLib_DoubleJacobiPolynomial *
************************************/
class PLib_DoubleJacobiPolynomial {
	public:
		/****** PLib_DoubleJacobiPolynomial::PLib_DoubleJacobiPolynomial ******/
		/****** md5 signature: de463bd0cd7c05a53bea601d0037764a ******/
		%feature("compactdefaultargs") PLib_DoubleJacobiPolynomial;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") PLib_DoubleJacobiPolynomial;
		 PLib_DoubleJacobiPolynomial();

		/****** PLib_DoubleJacobiPolynomial::PLib_DoubleJacobiPolynomial ******/
		/****** md5 signature: 49f9338666d135519dabf31bcc8c23e3 ******/
		%feature("compactdefaultargs") PLib_DoubleJacobiPolynomial;
		%feature("autodoc", "
Parameters
----------
JacPolU: PLib_JacobiPolynomial
JacPolV: PLib_JacobiPolynomial

Return
-------
None

Description
-----------
No available documentation.
") PLib_DoubleJacobiPolynomial;
		 PLib_DoubleJacobiPolynomial(const opencascade::handle<PLib_JacobiPolynomial> & JacPolU, const opencascade::handle<PLib_JacobiPolynomial> & JacPolV);

		/****** PLib_DoubleJacobiPolynomial::AverageError ******/
		/****** md5 signature: 59c1f819623f1745c15ea941a534a3c6 ******/
		%feature("compactdefaultargs") AverageError;
		%feature("autodoc", "
Parameters
----------
Dimension: int
DegreeU: int
DegreeV: int
dJacCoeff: int
JacCoeff: TColStd_Array1OfReal

Return
-------
float

Description
-----------
No available documentation.
") AverageError;
		Standard_Real AverageError(const Standard_Integer Dimension, const Standard_Integer DegreeU, const Standard_Integer DegreeV, const Standard_Integer dJacCoeff, const TColStd_Array1OfReal & JacCoeff);

		/****** PLib_DoubleJacobiPolynomial::MaxError ******/
		/****** md5 signature: bc59636dbf7a805929772dcec393550a ******/
		%feature("compactdefaultargs") MaxError;
		%feature("autodoc", "
Parameters
----------
Dimension: int
MinDegreeU: int
MaxDegreeU: int
MinDegreeV: int
MaxDegreeV: int
dJacCoeff: int
JacCoeff: TColStd_Array1OfReal
Error: float

Return
-------
float

Description
-----------
No available documentation.
") MaxError;
		Standard_Real MaxError(const Standard_Integer Dimension, const Standard_Integer MinDegreeU, const Standard_Integer MaxDegreeU, const Standard_Integer MinDegreeV, const Standard_Integer MaxDegreeV, const Standard_Integer dJacCoeff, const TColStd_Array1OfReal & JacCoeff, const Standard_Real Error);

		/****** PLib_DoubleJacobiPolynomial::MaxErrorU ******/
		/****** md5 signature: fa1c1a1b84cc2387af19de3d28c7f149 ******/
		%feature("compactdefaultargs") MaxErrorU;
		%feature("autodoc", "
Parameters
----------
Dimension: int
DegreeU: int
DegreeV: int
dJacCoeff: int
JacCoeff: TColStd_Array1OfReal

Return
-------
float

Description
-----------
No available documentation.
") MaxErrorU;
		Standard_Real MaxErrorU(const Standard_Integer Dimension, const Standard_Integer DegreeU, const Standard_Integer DegreeV, const Standard_Integer dJacCoeff, const TColStd_Array1OfReal & JacCoeff);

		/****** PLib_DoubleJacobiPolynomial::MaxErrorV ******/
		/****** md5 signature: 24a809baa701e14e9eeacba743288173 ******/
		%feature("compactdefaultargs") MaxErrorV;
		%feature("autodoc", "
Parameters
----------
Dimension: int
DegreeU: int
DegreeV: int
dJacCoeff: int
JacCoeff: TColStd_Array1OfReal

Return
-------
float

Description
-----------
No available documentation.
") MaxErrorV;
		Standard_Real MaxErrorV(const Standard_Integer Dimension, const Standard_Integer DegreeU, const Standard_Integer DegreeV, const Standard_Integer dJacCoeff, const TColStd_Array1OfReal & JacCoeff);

		/****** PLib_DoubleJacobiPolynomial::ReduceDegree ******/
		/****** md5 signature: 77ba30a13eb302f19648d95566fd2879 ******/
		%feature("compactdefaultargs") ReduceDegree;
		%feature("autodoc", "
Parameters
----------
Dimension: int
MinDegreeU: int
MaxDegreeU: int
MinDegreeV: int
MaxDegreeV: int
dJacCoeff: int
JacCoeff: TColStd_Array1OfReal
EpmsCut: float

Return
-------
MaxError: float
NewDegreeU: int
NewDegreeV: int

Description
-----------
No available documentation.
") ReduceDegree;
		void ReduceDegree(const Standard_Integer Dimension, const Standard_Integer MinDegreeU, const Standard_Integer MaxDegreeU, const Standard_Integer MinDegreeV, const Standard_Integer MaxDegreeV, const Standard_Integer dJacCoeff, const TColStd_Array1OfReal & JacCoeff, const Standard_Real EpmsCut, Standard_Real &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue);

		/****** PLib_DoubleJacobiPolynomial::TabMaxU ******/
		/****** md5 signature: fc95031f2fdeddc86d00107cc1fea84d ******/
		%feature("compactdefaultargs") TabMaxU;
		%feature("autodoc", "Return
-------
opencascade::handle<TColStd_HArray1OfReal>

Description
-----------
returns myTabMaxU;.
") TabMaxU;
		opencascade::handle<TColStd_HArray1OfReal> TabMaxU();

		/****** PLib_DoubleJacobiPolynomial::TabMaxV ******/
		/****** md5 signature: 3eced45af4cd28d8005f62873ad702f4 ******/
		%feature("compactdefaultargs") TabMaxV;
		%feature("autodoc", "Return
-------
opencascade::handle<TColStd_HArray1OfReal>

Description
-----------
returns myTabMaxV;.
") TabMaxV;
		opencascade::handle<TColStd_HArray1OfReal> TabMaxV();

		/****** PLib_DoubleJacobiPolynomial::U ******/
		/****** md5 signature: 888b3c693208ad6e93cd32ea973e39b6 ******/
		%feature("compactdefaultargs") U;
		%feature("autodoc", "Return
-------
opencascade::handle<PLib_JacobiPolynomial>

Description
-----------
returns myJacPolU;.
") U;
		opencascade::handle<PLib_JacobiPolynomial> U();

		/****** PLib_DoubleJacobiPolynomial::V ******/
		/****** md5 signature: 948c918cfc3846192241d6b03888e5d8 ******/
		%feature("compactdefaultargs") V;
		%feature("autodoc", "Return
-------
opencascade::handle<PLib_JacobiPolynomial>

Description
-----------
returns myJacPolV;.
") V;
		opencascade::handle<PLib_JacobiPolynomial> V();

		/****** PLib_DoubleJacobiPolynomial::WDoubleJacobiToCoefficients ******/
		/****** md5 signature: 7486e56c849e6ee4aaca40f890784054 ******/
		%feature("compactdefaultargs") WDoubleJacobiToCoefficients;
		%feature("autodoc", "
Parameters
----------
Dimension: int
DegreeU: int
DegreeV: int
JacCoeff: TColStd_Array1OfReal
Coefficients: TColStd_Array1OfReal

Return
-------
None

Description
-----------
No available documentation.
") WDoubleJacobiToCoefficients;
		void WDoubleJacobiToCoefficients(const Standard_Integer Dimension, const Standard_Integer DegreeU, const Standard_Integer DegreeV, const TColStd_Array1OfReal & JacCoeff, TColStd_Array1OfReal & Coefficients);

};


%extend PLib_DoubleJacobiPolynomial {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************
* class PLib_HermitJacobi *
**************************/
class PLib_HermitJacobi : public PLib_Base {
	public:
		/****** PLib_HermitJacobi::PLib_HermitJacobi ******/
		/****** md5 signature: cba66df678b1af8e782a27e59df85c21 ******/
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
		 PLib_HermitJacobi(const Standard_Integer WorkDegree, const GeomAbs_Shape ConstraintOrder);

		/****** PLib_HermitJacobi::AverageError ******/
		/****** md5 signature: a9a12575c7d1c3a88bf0b0575c067ea1 ******/
		%feature("compactdefaultargs") AverageError;
		%feature("autodoc", "
Parameters
----------
Dimension: int
NewDegree: int

Return
-------
HermJacCoeff: float

Description
-----------
No available documentation.
") AverageError;
		Standard_Real AverageError(const Standard_Integer Dimension, Standard_Real &OutValue, const Standard_Integer NewDegree);

		/****** PLib_HermitJacobi::D0 ******/
		/****** md5 signature: 09c80be2d04ee5a218e542ce631154a4 ******/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "
Parameters
----------
U: float
BasisValue: TColStd_Array1OfReal

Return
-------
None

Description
-----------
Compute the values of the basis functions in u.
") D0;
		void D0(const Standard_Real U, TColStd_Array1OfReal & BasisValue);

		/****** PLib_HermitJacobi::D1 ******/
		/****** md5 signature: b03786188171580f3cb776bc09557910 ******/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "
Parameters
----------
U: float
BasisValue: TColStd_Array1OfReal
BasisD1: TColStd_Array1OfReal

Return
-------
None

Description
-----------
Compute the values and the derivatives values of the basis functions in u.
") D1;
		void D1(const Standard_Real U, TColStd_Array1OfReal & BasisValue, TColStd_Array1OfReal & BasisD1);

		/****** PLib_HermitJacobi::D2 ******/
		/****** md5 signature: 8351d01efc2c719802b2311de6c56189 ******/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "
Parameters
----------
U: float
BasisValue: TColStd_Array1OfReal
BasisD1: TColStd_Array1OfReal
BasisD2: TColStd_Array1OfReal

Return
-------
None

Description
-----------
Compute the values and the derivatives values of the basis functions in u.
") D2;
		void D2(const Standard_Real U, TColStd_Array1OfReal & BasisValue, TColStd_Array1OfReal & BasisD1, TColStd_Array1OfReal & BasisD2);

		/****** PLib_HermitJacobi::D3 ******/
		/****** md5 signature: 4dc2082da716976d329ea0bb061d0924 ******/
		%feature("compactdefaultargs") D3;
		%feature("autodoc", "
Parameters
----------
U: float
BasisValue: TColStd_Array1OfReal
BasisD1: TColStd_Array1OfReal
BasisD2: TColStd_Array1OfReal
BasisD3: TColStd_Array1OfReal

Return
-------
None

Description
-----------
Compute the values and the derivatives values of the basis functions in u.
") D3;
		void D3(const Standard_Real U, TColStd_Array1OfReal & BasisValue, TColStd_Array1OfReal & BasisD1, TColStd_Array1OfReal & BasisD2, TColStd_Array1OfReal & BasisD3);

		/****** PLib_HermitJacobi::MaxError ******/
		/****** md5 signature: 2345d026ce40e07d223c7963b1e4404d ******/
		%feature("compactdefaultargs") MaxError;
		%feature("autodoc", "
Parameters
----------
Dimension: int
NewDegree: int

Return
-------
HermJacCoeff: float

Description
-----------
This method computes the maximum error on the polynomial W(t) Q(t) obtained by missing the coefficients of JacCoeff from NewDegree +1 to Degree.
") MaxError;
		Standard_Real MaxError(const Standard_Integer Dimension, Standard_Real &OutValue, const Standard_Integer NewDegree);

		/****** PLib_HermitJacobi::NivConstr ******/
		/****** md5 signature: f6a2f8af8bbecc140e8868581b3445e5 ******/
		%feature("compactdefaultargs") NivConstr;
		%feature("autodoc", "Return
-------
int

Description
-----------
returns NivConstr.
") NivConstr;
		Standard_Integer NivConstr();

		/****** PLib_HermitJacobi::ReduceDegree ******/
		/****** md5 signature: ff23be12c9df448943274c01cf909a73 ******/
		%feature("compactdefaultargs") ReduceDegree;
		%feature("autodoc", "
Parameters
----------
Dimension: int
MaxDegree: int
Tol: float

Return
-------
HermJacCoeff: float
NewDegree: int
MaxError: float

Description
-----------
Compute NewDegree <= MaxDegree so that MaxError is lower than Tol. MaxError can be greater than Tol if it is not possible to find a NewDegree <= MaxDegree. In this case NewDegree = MaxDegree.
") ReduceDegree;
		void ReduceDegree(const Standard_Integer Dimension, const Standard_Integer MaxDegree, const Standard_Real Tol, Standard_Real &OutValue, Standard_Integer &OutValue, Standard_Real &OutValue);

		/****** PLib_HermitJacobi::ToCoefficients ******/
		/****** md5 signature: a251e30979bee64ba1fd366e4690d6f2 ******/
		%feature("compactdefaultargs") ToCoefficients;
		%feature("autodoc", "
Parameters
----------
Dimension: int
Degree: int
HermJacCoeff: TColStd_Array1OfReal
Coefficients: TColStd_Array1OfReal

Return
-------
None

Description
-----------
Convert the polynomial P(t) = H(t) + W(t) Q(t) in the canonical base.
") ToCoefficients;
		void ToCoefficients(const Standard_Integer Dimension, const Standard_Integer Degree, const TColStd_Array1OfReal & HermJacCoeff, TColStd_Array1OfReal & Coefficients);

		/****** PLib_HermitJacobi::WorkDegree ******/
		/****** md5 signature: 0fafe1aec89490c754959fbbbd4a6908 ******/
		%feature("compactdefaultargs") WorkDegree;
		%feature("autodoc", "Return
-------
int

Description
-----------
returns WorkDegree.
") WorkDegree;
		Standard_Integer WorkDegree();

};


%make_alias(PLib_HermitJacobi)

%extend PLib_HermitJacobi {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************
* class PLib_JacobiPolynomial *
******************************/
class PLib_JacobiPolynomial : public PLib_Base {
	public:
		/****** PLib_JacobiPolynomial::PLib_JacobiPolynomial ******/
		/****** md5 signature: be57bd43ad8816e1ff65244f66d15a7d ******/
		%feature("compactdefaultargs") PLib_JacobiPolynomial;
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
") PLib_JacobiPolynomial;
		 PLib_JacobiPolynomial(const Standard_Integer WorkDegree, const GeomAbs_Shape ConstraintOrder);

		/****** PLib_JacobiPolynomial::AverageError ******/
		/****** md5 signature: 105a3adb8c2438de6a03a39558a2fdf7 ******/
		%feature("compactdefaultargs") AverageError;
		%feature("autodoc", "
Parameters
----------
Dimension: int
NewDegree: int

Return
-------
JacCoeff: float

Description
-----------
No available documentation.
") AverageError;
		Standard_Real AverageError(const Standard_Integer Dimension, Standard_Real &OutValue, const Standard_Integer NewDegree);

		/****** PLib_JacobiPolynomial::D0 ******/
		/****** md5 signature: 09c80be2d04ee5a218e542ce631154a4 ******/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "
Parameters
----------
U: float
BasisValue: TColStd_Array1OfReal

Return
-------
None

Description
-----------
Compute the values of the basis functions in u.
") D0;
		void D0(const Standard_Real U, TColStd_Array1OfReal & BasisValue);

		/****** PLib_JacobiPolynomial::D1 ******/
		/****** md5 signature: b03786188171580f3cb776bc09557910 ******/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "
Parameters
----------
U: float
BasisValue: TColStd_Array1OfReal
BasisD1: TColStd_Array1OfReal

Return
-------
None

Description
-----------
Compute the values and the derivatives values of the basis functions in u.
") D1;
		void D1(const Standard_Real U, TColStd_Array1OfReal & BasisValue, TColStd_Array1OfReal & BasisD1);

		/****** PLib_JacobiPolynomial::D2 ******/
		/****** md5 signature: 8351d01efc2c719802b2311de6c56189 ******/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "
Parameters
----------
U: float
BasisValue: TColStd_Array1OfReal
BasisD1: TColStd_Array1OfReal
BasisD2: TColStd_Array1OfReal

Return
-------
None

Description
-----------
Compute the values and the derivatives values of the basis functions in u.
") D2;
		void D2(const Standard_Real U, TColStd_Array1OfReal & BasisValue, TColStd_Array1OfReal & BasisD1, TColStd_Array1OfReal & BasisD2);

		/****** PLib_JacobiPolynomial::D3 ******/
		/****** md5 signature: 4dc2082da716976d329ea0bb061d0924 ******/
		%feature("compactdefaultargs") D3;
		%feature("autodoc", "
Parameters
----------
U: float
BasisValue: TColStd_Array1OfReal
BasisD1: TColStd_Array1OfReal
BasisD2: TColStd_Array1OfReal
BasisD3: TColStd_Array1OfReal

Return
-------
None

Description
-----------
Compute the values and the derivatives values of the basis functions in u.
") D3;
		void D3(const Standard_Real U, TColStd_Array1OfReal & BasisValue, TColStd_Array1OfReal & BasisD1, TColStd_Array1OfReal & BasisD2, TColStd_Array1OfReal & BasisD3);

		/****** PLib_JacobiPolynomial::MaxError ******/
		/****** md5 signature: 53f6b08ebe2907b85f487eb8d618147c ******/
		%feature("compactdefaultargs") MaxError;
		%feature("autodoc", "
Parameters
----------
Dimension: int
NewDegree: int

Return
-------
JacCoeff: float

Description
-----------
This method computes the maximum error on the polynomial W(t) Q(t) obtained by missing the coefficients of JacCoeff from NewDegree +1 to Degree.
") MaxError;
		Standard_Real MaxError(const Standard_Integer Dimension, Standard_Real &OutValue, const Standard_Integer NewDegree);

		/****** PLib_JacobiPolynomial::MaxValue ******/
		/****** md5 signature: fada13e95068e5e093ec1e3d3bdbd555 ******/
		%feature("compactdefaultargs") MaxValue;
		%feature("autodoc", "
Parameters
----------
TabMax: TColStd_Array1OfReal

Return
-------
None

Description
-----------
this method loads for k=0,q the maximum value of abs ( W(t)*Jk(t) )for t bellonging to [-1,1] This values are loaded is the array TabMax(0,myWorkDegree-2*(myNivConst+1)) MaxValue ( me ; TabMaxPointer: in out Real );.
") MaxValue;
		void MaxValue(TColStd_Array1OfReal & TabMax);

		/****** PLib_JacobiPolynomial::NivConstr ******/
		/****** md5 signature: f6a2f8af8bbecc140e8868581b3445e5 ******/
		%feature("compactdefaultargs") NivConstr;
		%feature("autodoc", "Return
-------
int

Description
-----------
returns NivConstr.
") NivConstr;
		Standard_Integer NivConstr();

		/****** PLib_JacobiPolynomial::Points ******/
		/****** md5 signature: 653579675c537b457b38505106af2c77 ******/
		%feature("compactdefaultargs") Points;
		%feature("autodoc", "
Parameters
----------
NbGaussPoints: int
TabPoints: TColStd_Array1OfReal

Return
-------
None

Description
-----------
returns the Jacobi Points for Gauss integration ie the positive values of the Legendre roots by increasing values NbGaussPoints is the number of points chosen for the integral computation. TabPoints (0,NbGaussPoints/2) TabPoints (0) is loaded only for the odd values of NbGaussPoints The possible values for NbGaussPoints are: 8, 10, 15, 20, 25, 30, 35, 40, 50, 61 NbGaussPoints must be greater than Degree.
") Points;
		void Points(const Standard_Integer NbGaussPoints, TColStd_Array1OfReal & TabPoints);

		/****** PLib_JacobiPolynomial::ReduceDegree ******/
		/****** md5 signature: f3d1d0bcdf80f3699f0ff0a659fee202 ******/
		%feature("compactdefaultargs") ReduceDegree;
		%feature("autodoc", "
Parameters
----------
Dimension: int
MaxDegree: int
Tol: float

Return
-------
JacCoeff: float
NewDegree: int
MaxError: float

Description
-----------
Compute NewDegree <= MaxDegree so that MaxError is lower than Tol. MaxError can be greater than Tol if it is not possible to find a NewDegree <= MaxDegree. In this case NewDegree = MaxDegree.
") ReduceDegree;
		void ReduceDegree(const Standard_Integer Dimension, const Standard_Integer MaxDegree, const Standard_Real Tol, Standard_Real &OutValue, Standard_Integer &OutValue, Standard_Real &OutValue);

		/****** PLib_JacobiPolynomial::ToCoefficients ******/
		/****** md5 signature: ff80fc0ff0d7e1c4e5d1180709a294be ******/
		%feature("compactdefaultargs") ToCoefficients;
		%feature("autodoc", "
Parameters
----------
Dimension: int
Degree: int
JacCoeff: TColStd_Array1OfReal
Coefficients: TColStd_Array1OfReal

Return
-------
None

Description
-----------
Convert the polynomial P(t) = R(t) + W(t) Q(t) in the canonical base.
") ToCoefficients;
		void ToCoefficients(const Standard_Integer Dimension, const Standard_Integer Degree, const TColStd_Array1OfReal & JacCoeff, TColStd_Array1OfReal & Coefficients);

		/****** PLib_JacobiPolynomial::Weights ******/
		/****** md5 signature: 4ae0ffe39406097290e31be2570d9f0d ******/
		%feature("compactdefaultargs") Weights;
		%feature("autodoc", "
Parameters
----------
NbGaussPoints: int
TabWeights: TColStd_Array2OfReal

Return
-------
None

Description
-----------
returns the Jacobi weights for Gauss integration only for the positive values of the Legendre roots in the order they are given by the method Points NbGaussPoints is the number of points chosen for the integral computation. TabWeights (0,NbGaussPoints/2,0,Degree) TabWeights (0,.) are only loaded for the odd values of NbGaussPoints The possible values for NbGaussPoints are: 8 , 10 , 15 ,20 ,25 , 30, 35 , 40 , 50 , 61 NbGaussPoints must be greater than Degree.
") Weights;
		void Weights(const Standard_Integer NbGaussPoints, TColStd_Array2OfReal & TabWeights);

		/****** PLib_JacobiPolynomial::WorkDegree ******/
		/****** md5 signature: 0fafe1aec89490c754959fbbbd4a6908 ******/
		%feature("compactdefaultargs") WorkDegree;
		%feature("autodoc", "Return
-------
int

Description
-----------
returns WorkDegree.
") WorkDegree;
		Standard_Integer WorkDegree();

};


%make_alias(PLib_JacobiPolynomial)

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
