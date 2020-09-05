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
%define PLIBDOCSTRING
"PLib module, see official documentation at
https://www.opencascade.com/doc/occt-7.4.0/refman/html/package_plib.html"
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
%include ../common/Operators.i
%include ../common/OccHandle.i


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

/* python proy classes for enums */
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
		/****************** Bin ******************/
		/**** md5 signature: e4b9b3840dd91f636abfcd255a208497 ****/
		%feature("compactdefaultargs") Bin;
		%feature("autodoc", "Returns the binomial cnp. n should be <= bsplclib::maxdegree().

Parameters
----------
N: int
P: int

Returns
-------
float
") Bin;
		static Standard_Real Bin(const Standard_Integer N, const Standard_Integer P);

		/****************** CoefficientsPoles ******************/
		/**** md5 signature: 195b25b4fc3f47a2d3abcac292c0176f ****/
		%feature("compactdefaultargs") CoefficientsPoles;
		%feature("autodoc", "No available documentation.

Parameters
----------
Coefs: TColgp_Array1OfPnt
WCoefs: TColStd_Array1OfReal *
Poles: TColgp_Array1OfPnt
WPoles: TColStd_Array1OfReal *

Returns
-------
None
") CoefficientsPoles;
		static void CoefficientsPoles(const TColgp_Array1OfPnt & Coefs, const TColStd_Array1OfReal * WCoefs, TColgp_Array1OfPnt & Poles, TColStd_Array1OfReal * WPoles);

		/****************** CoefficientsPoles ******************/
		/**** md5 signature: 63a65fa5260f82dd66eaf7230614332f ****/
		%feature("compactdefaultargs") CoefficientsPoles;
		%feature("autodoc", "No available documentation.

Parameters
----------
Coefs: TColgp_Array1OfPnt2d
WCoefs: TColStd_Array1OfReal *
Poles: TColgp_Array1OfPnt2d
WPoles: TColStd_Array1OfReal *

Returns
-------
None
") CoefficientsPoles;
		static void CoefficientsPoles(const TColgp_Array1OfPnt2d & Coefs, const TColStd_Array1OfReal * WCoefs, TColgp_Array1OfPnt2d & Poles, TColStd_Array1OfReal * WPoles);

		/****************** CoefficientsPoles ******************/
		/**** md5 signature: c17e5fac9521597fee289a3e908c8f4a ****/
		%feature("compactdefaultargs") CoefficientsPoles;
		%feature("autodoc", "No available documentation.

Parameters
----------
Coefs: TColStd_Array1OfReal
WCoefs: TColStd_Array1OfReal *
Poles: TColStd_Array1OfReal
WPoles: TColStd_Array1OfReal *

Returns
-------
None
") CoefficientsPoles;
		static void CoefficientsPoles(const TColStd_Array1OfReal & Coefs, const TColStd_Array1OfReal * WCoefs, TColStd_Array1OfReal & Poles, TColStd_Array1OfReal * WPoles);

		/****************** CoefficientsPoles ******************/
		/**** md5 signature: a1c040d1c8b25e8ca6d970e69ba4cb59 ****/
		%feature("compactdefaultargs") CoefficientsPoles;
		%feature("autodoc", "No available documentation.

Parameters
----------
dim: int
Coefs: TColStd_Array1OfReal
WCoefs: TColStd_Array1OfReal *
Poles: TColStd_Array1OfReal
WPoles: TColStd_Array1OfReal *

Returns
-------
None
") CoefficientsPoles;
		static void CoefficientsPoles(const Standard_Integer dim, const TColStd_Array1OfReal & Coefs, const TColStd_Array1OfReal * WCoefs, TColStd_Array1OfReal & Poles, TColStd_Array1OfReal * WPoles);

		/****************** CoefficientsPoles ******************/
		/**** md5 signature: 1928d807b7a7d000457f8323ac17dd0b ****/
		%feature("compactdefaultargs") CoefficientsPoles;
		%feature("autodoc", "No available documentation.

Parameters
----------
Coefs: TColgp_Array2OfPnt
WCoefs: TColStd_Array2OfReal *
Poles: TColgp_Array2OfPnt
WPoles: TColStd_Array2OfReal *

Returns
-------
None
") CoefficientsPoles;
		static void CoefficientsPoles(const TColgp_Array2OfPnt & Coefs, const TColStd_Array2OfReal * WCoefs, TColgp_Array2OfPnt & Poles, TColStd_Array2OfReal * WPoles);

		/****************** ConstraintOrder ******************/
		/**** md5 signature: c3e04cc0436b2e274987d2c1758747ef ****/
		%feature("compactdefaultargs") ConstraintOrder;
		%feature("autodoc", "Translates from integer to geomabs_shape.

Parameters
----------
NivConstr: int

Returns
-------
GeomAbs_Shape
") ConstraintOrder;
		static GeomAbs_Shape ConstraintOrder(const Standard_Integer NivConstr);

		/****************** EvalCubicHermite ******************/
		/**** md5 signature: 70b5084cb477532383770ec1daed2d40 ****/
		%feature("compactdefaultargs") EvalCubicHermite;
		%feature("autodoc", "Performs the cubic hermite interpolation of given series of points with given parameters with the requested derivative order. valuearray stores the value at the first and last parameter. it has the following format : [0], [dimension-1]  : value at first param [dimension], [dimension + dimension-1] : value at last param derivative array stores the value of the derivatives at the first parameter and at the last parameter in the following format [0], [dimension-1]  : derivative at first param [dimension], [dimension + dimension-1] : derivative at last param //! parameterarray stores the first and last parameter in the following format : [0] : first parameter [1] : last parameter //! results will store things in the following format with d = derivativeorder //! [0], [dimension-1]  : value [dimension], [dimension + dimension-1] : first derivative //! [d *dimension], [d*dimension + dimension-1]: dth derivative.

Parameters
----------
U: float
DerivativeOrder: int
Dimension: int

Returns
-------
ValueArray: float
DerivativeArray: float
ParameterArray: float
Results: float
") EvalCubicHermite;
		static Standard_Integer EvalCubicHermite(const Standard_Real U, const Standard_Integer DerivativeOrder, const Standard_Integer Dimension, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** EvalLagrange ******************/
		/**** md5 signature: db70dc230b872e9d346e3aab66b28d83 ****/
		%feature("compactdefaultargs") EvalLagrange;
		%feature("autodoc", "Performs the lagrange interpolation of given series of points with given parameters with the requested derivative order results will store things in the following format with d = derivativeorder //! [0], [dimension-1]  : value [dimension], [dimension + dimension-1] : first derivative //! [d *dimension], [d*dimension + dimension-1]: dth derivative.

Parameters
----------
U: float
DerivativeOrder: int
Degree: int
Dimension: int

Returns
-------
ValueArray: float
ParameterArray: float
Results: float
") EvalLagrange;
		static Standard_Integer EvalLagrange(const Standard_Real U, const Standard_Integer DerivativeOrder, const Standard_Integer Degree, const Standard_Integer Dimension, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** EvalLength ******************/
		/**** md5 signature: 3aa31ba2f2ab37b1f6fc9b8bdcf6816f ****/
		%feature("compactdefaultargs") EvalLength;
		%feature("autodoc", "No available documentation.

Parameters
----------
Degree: int
Dimension: int
U1: float
U2: float

Returns
-------
PolynomialCoeff: float
Length: float
") EvalLength;
		static void EvalLength(const Standard_Integer Degree, const Standard_Integer Dimension, Standard_Real &OutValue, const Standard_Real U1, const Standard_Real U2, Standard_Real &OutValue);

		/****************** EvalLength ******************/
		/**** md5 signature: 267e4cccfb903dd0fdb924058dd1468b ****/
		%feature("compactdefaultargs") EvalLength;
		%feature("autodoc", "No available documentation.

Parameters
----------
Degree: int
Dimension: int
U1: float
U2: float
Tol: float

Returns
-------
PolynomialCoeff: float
Length: float
Error: float
") EvalLength;
		static void EvalLength(const Standard_Integer Degree, const Standard_Integer Dimension, Standard_Real &OutValue, const Standard_Real U1, const Standard_Real U2, const Standard_Real Tol, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** EvalPoly2Var ******************/
		/**** md5 signature: f820034b111d664eb87d8d6417e36fc7 ****/
		%feature("compactdefaultargs") EvalPoly2Var;
		%feature("autodoc", "Applies evalpolynomial twice to evaluate the derivative of orders uderivativeorder in u, vderivativeorder in v at parameters u,v //! polynomialcoeff are stored in the following fashion c00(1) .... c00(dimension) c10(1) .... c10(dimension) .... cm0(1) .... cm0(dimension) .... c01(1) .... c01(dimension) c11(1) .... c11(dimension) .... cm1(1) .... cm1(dimension) .... c0n(1) .... c0n(dimension) c1n(1) .... c1n(dimension) .... cmn(1) .... cmn(dimension) //! where the polynomial is defined as : 2  m c00 + c10 u + c20 u + .... + cm0 u 2  m + c01 v + c11 uv + c21 u v + .... + cm1 u v n m n + .... + c0n v + .... + cmn u v //! with m = udegree and n = vdegree //! results stores the result in the following format //! f(1) f(2) .... f(dimension) //! warning: <results> and <polynomialcoeff> must be dimensioned properly.

Parameters
----------
U: float
V: float
UDerivativeOrder: int
VDerivativeOrder: int
UDegree: int
VDegree: int
Dimension: int

Returns
-------
PolynomialCoeff: float
Results: float
") EvalPoly2Var;
		static void EvalPoly2Var(const Standard_Real U, const Standard_Real V, const Standard_Integer UDerivativeOrder, const Standard_Integer VDerivativeOrder, const Standard_Integer UDegree, const Standard_Integer VDegree, const Standard_Integer Dimension, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** EvalPolynomial ******************/
		/**** md5 signature: ab7638add7201ad9dc7d8b63cb124efa ****/
		%feature("compactdefaultargs") EvalPolynomial;
		%feature("autodoc", "Performs horner method with synthethic division for derivatives parameter <u>, with <degree> and <dimension>. polynomialcoeff are stored in the following fashion c0(1) c0(2) .... c0(dimension) c1(1) c1(2) .... c1(dimension) //! cdegree(1) cdegree(2) .... cdegree(dimension) where the polynomial is defined as : //! 2 degree c0 + c1 x + c2 x + .... cdegree x //! results stores the result in the following format //! f(1) f(2) .... f(dimension) (1)  (1)  (1) f (1) f (2) .... f (dimension) //! (derivativerequest) (derivativerequest) f (1)  f (dimension) //! this just evaluates the point at parameter u //! warning: <results> and <polynomialcoeff> must be dimensioned properly.

Parameters
----------
U: float
DerivativeOrder: int
Degree: int
Dimension: int

Returns
-------
PolynomialCoeff: float
Results: float
") EvalPolynomial;
		static void EvalPolynomial(const Standard_Real U, const Standard_Integer DerivativeOrder, const Standard_Integer Degree, const Standard_Integer Dimension, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** GetPoles ******************/
		/**** md5 signature: 2874b68a426f530b41fb67400bb8aae7 ****/
		%feature("compactdefaultargs") GetPoles;
		%feature("autodoc", "Get from fp the coordinates of the poles.

Parameters
----------
FP: TColStd_Array1OfReal
Poles: TColgp_Array1OfPnt

Returns
-------
None
") GetPoles;
		static void GetPoles(const TColStd_Array1OfReal & FP, TColgp_Array1OfPnt & Poles);

		/****************** GetPoles ******************/
		/**** md5 signature: c37f131df7c30bbe3fca9344aa3fc8da ****/
		%feature("compactdefaultargs") GetPoles;
		%feature("autodoc", "Get from fp the coordinates of the poles.

Parameters
----------
FP: TColStd_Array1OfReal
Poles: TColgp_Array1OfPnt
Weights: TColStd_Array1OfReal

Returns
-------
None
") GetPoles;
		static void GetPoles(const TColStd_Array1OfReal & FP, TColgp_Array1OfPnt & Poles, TColStd_Array1OfReal & Weights);

		/****************** GetPoles ******************/
		/**** md5 signature: ddf0d332e656e1c3a043920fe83ffb70 ****/
		%feature("compactdefaultargs") GetPoles;
		%feature("autodoc", "Get from fp the coordinates of the poles.

Parameters
----------
FP: TColStd_Array1OfReal
Poles: TColgp_Array1OfPnt2d

Returns
-------
None
") GetPoles;
		static void GetPoles(const TColStd_Array1OfReal & FP, TColgp_Array1OfPnt2d & Poles);

		/****************** GetPoles ******************/
		/**** md5 signature: b34f0e2297a04885105b1f320932d644 ****/
		%feature("compactdefaultargs") GetPoles;
		%feature("autodoc", "Get from fp the coordinates of the poles.

Parameters
----------
FP: TColStd_Array1OfReal
Poles: TColgp_Array1OfPnt2d
Weights: TColStd_Array1OfReal

Returns
-------
None
") GetPoles;
		static void GetPoles(const TColStd_Array1OfReal & FP, TColgp_Array1OfPnt2d & Poles, TColStd_Array1OfReal & Weights);

		/****************** HermiteCoefficients ******************/
		/**** md5 signature: f870a248c586ad640a2195fe36341a77 ****/
		%feature("compactdefaultargs") HermiteCoefficients;
		%feature("autodoc", "This build the coefficient of hermite's polynomes on [firstparameter, lastparameter] //! if j <= firstorder+1 then //! matrixcoefs[i, j] = ith coefficient of the polynome h0,j-1 //! else //! matrixcoefs[i, j] = ith coefficient of the polynome h1,k with k = j - firstorder - 2 //! return false if - |firstparameter| > 100 - |lastparameter| > 100 - |firstparameter| +|lastparameter| < 1/100 - |lastparameter - firstparameter| / (|firstparameter| +|lastparameter|) < 1/100.

Parameters
----------
FirstParameter: float
LastParameter: float
FirstOrder: int
LastOrder: int
MatrixCoefs: math_Matrix

Returns
-------
bool
") HermiteCoefficients;
		static Standard_Boolean HermiteCoefficients(const Standard_Real FirstParameter, const Standard_Real LastParameter, const Standard_Integer FirstOrder, const Standard_Integer LastOrder, math_Matrix & MatrixCoefs);

		/****************** HermiteInterpolate ******************/
		/**** md5 signature: 46e9dad0babe6a2a789abf9623adf18f ****/
		%feature("compactdefaultargs") HermiteInterpolate;
		%feature("autodoc", "Compute the coefficients in the canonical base of the polynomial satisfying the given constraints at the given parameters the array firstcontr(i,j) i=1,dimension j=0,firstorder contains the values of the constraint at parameter firstparameter idem for lastconstr.

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

Returns
-------
bool
") HermiteInterpolate;
		static Standard_Boolean HermiteInterpolate(const Standard_Integer Dimension, const Standard_Real FirstParameter, const Standard_Real LastParameter, const Standard_Integer FirstOrder, const Standard_Integer LastOrder, const TColStd_Array2OfReal & FirstConstr, const TColStd_Array2OfReal & LastConstr, TColStd_Array1OfReal & Coefficients);

		/****************** JacobiParameters ******************/
		/**** md5 signature: 16abc4702f8918e99ae70cddff5b364d ****/
		%feature("compactdefaultargs") JacobiParameters;
		%feature("autodoc", "Compute the number of points used for integral computations (nbgausspoints) and the degree of jacobi polynomial (workdegree). constraintorder has to be geomabs_c0, geomabs_c1 or geomabs_c2 code: code d' init. des parametres de discretisation. = -5 = -4 = -3 = -2 = -1 = 1 calcul rapide avec precision moyenne. = 2 calcul rapide avec meilleure precision. = 3 calcul un peu plus lent avec bonne precision. = 4 calcul lent avec la meilleure precision possible.

Parameters
----------
ConstraintOrder: GeomAbs_Shape
MaxDegree: int
Code: int

Returns
-------
NbGaussPoints: int
WorkDegree: int
") JacobiParameters;
		static void JacobiParameters(const GeomAbs_Shape ConstraintOrder, const Standard_Integer MaxDegree, const Standard_Integer Code, Standard_Integer &OutValue, Standard_Integer &OutValue);

		/****************** NivConstr ******************/
		/**** md5 signature: 0da399a2a4094066f87aa5554c588dfe ****/
		%feature("compactdefaultargs") NivConstr;
		%feature("autodoc", "Translates from geomabs_shape to integer.

Parameters
----------
ConstraintOrder: GeomAbs_Shape

Returns
-------
int
") NivConstr;
		static Standard_Integer NivConstr(const GeomAbs_Shape ConstraintOrder);

		/****************** NoDerivativeEvalPolynomial ******************/
		/**** md5 signature: b734aed0c3d7b9e9e322b362cd422d18 ****/
		%feature("compactdefaultargs") NoDerivativeEvalPolynomial;
		%feature("autodoc", "Same as above with derivativeorder = 0;.

Parameters
----------
U: float
Degree: int
Dimension: int
DegreeDimension: int

Returns
-------
PolynomialCoeff: float
Results: float
") NoDerivativeEvalPolynomial;
		static void NoDerivativeEvalPolynomial(const Standard_Real U, const Standard_Integer Degree, const Standard_Integer Dimension, const Standard_Integer DegreeDimension, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** NoWeights ******************/
		/**** md5 signature: c62456e1087764e789de71e3c64f70ac ****/
		%feature("compactdefaultargs") NoWeights;
		%feature("autodoc", "Used as argument for a non rational functions.

Returns
-------
TColStd_Array1OfReal *
") NoWeights;
		static TColStd_Array1OfReal * NoWeights();

		/****************** NoWeights2 ******************/
		/**** md5 signature: 4e85666f7316eb9ea248be00715a2600 ****/
		%feature("compactdefaultargs") NoWeights2;
		%feature("autodoc", "Used as argument for a non rational functions.

Returns
-------
TColStd_Array2OfReal *
") NoWeights2;
		static TColStd_Array2OfReal * NoWeights2();

		/****************** RationalDerivative ******************/
		/**** md5 signature: 73b52c09f25fc1cb9a4f36df7003b108 ****/
		%feature("compactdefaultargs") RationalDerivative;
		%feature("autodoc", "Computes the derivatives of a ratio at order <n> in dimension <dimension>. //! <ders> is an array containing the values of the input derivatives from 0 to min(<n>,<degree>). for orders higher than <degree> the inputcd /s2d1/bmdl/ derivatives are assumed to be 0. //! content of <ders> : //! x(1),x(2),...,x(dimension),w x'(1),x'(2),...,x'(dimension),w' x''(1),x''(2),...,x''(dimension),w'' //! if <all> is false, only the derivative at order <n> is computed. <rders> is an array of length dimension which will contain the result : //! x(1)/w , x(2)/w , ... derivated <n> times //! if <all> is true all the derivatives up to order <n> are computed. <rders> is an array of length dimension * (n+1) which will contains : //! x(1)/w , x(2)/w , ... x(1)/w , x(2)/w , ... derivated <1> times x(1)/w , x(2)/w , ... derivated <2> times ... x(1)/w , x(2)/w , ... derivated <n> times //! warning: <rders> must be dimensionned properly.

Parameters
----------
Degree: int
N: int
Dimension: int
All: bool,optional
	default value is Standard_True

Returns
-------
Ders: float
RDers: float
") RationalDerivative;
		static void RationalDerivative(const Standard_Integer Degree, const Standard_Integer N, const Standard_Integer Dimension, Standard_Real &OutValue, Standard_Real &OutValue, const Standard_Boolean All = Standard_True);

		/****************** RationalDerivatives ******************/
		/**** md5 signature: 181f56d901cd67387121827789aa2d4b ****/
		%feature("compactdefaultargs") RationalDerivatives;
		%feature("autodoc", "Computes derivativesrequest derivatives of a ratio at of a bspline function of degree <degree> dimension <dimension>. //! <polesderivatives> is an array containing the values of the input derivatives from 0 to <derivativerequest> for orders higher than <degree> the input derivatives are assumed to be 0. //! content of <poleasderivatives> : //! x(1),x(2),...,x(dimension) x'(1),x'(2),...,x'(dimension) x''(1),x''(2),...,x''(dimension) //! weightsderivatives is an array that contains derivatives from 0 to <derivativerequest> after returning from the routine the array rationalderivatives contains the following x(1)/w , x(2)/w , ... x(1)/w , x(2)/w , ... derivated once x(1)/w , x(2)/w , ... twice x(1)/w , x(2)/w , ... derivated <derivativerequest> times //! the array rationalderivatives and polesderivatives can be same since the overwrite is non destructive within the algorithm //! warning: <rationalderivates> must be dimensionned properly.

Parameters
----------
DerivativesRequest: int
Dimension: int

Returns
-------
PolesDerivatives: float
WeightsDerivatives: float
RationalDerivates: float
") RationalDerivatives;
		static void RationalDerivatives(const Standard_Integer DerivativesRequest, const Standard_Integer Dimension, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** SetPoles ******************/
		/**** md5 signature: 6863d9194c7fb66b1688878d0f0370ef ****/
		%feature("compactdefaultargs") SetPoles;
		%feature("autodoc", "Copy in fp the coordinates of the poles.

Parameters
----------
Poles: TColgp_Array1OfPnt
FP: TColStd_Array1OfReal

Returns
-------
None
") SetPoles;
		static void SetPoles(const TColgp_Array1OfPnt & Poles, TColStd_Array1OfReal & FP);

		/****************** SetPoles ******************/
		/**** md5 signature: a37c76776d33a974dd4d6d361b465857 ****/
		%feature("compactdefaultargs") SetPoles;
		%feature("autodoc", "Copy in fp the coordinates of the poles.

Parameters
----------
Poles: TColgp_Array1OfPnt
Weights: TColStd_Array1OfReal
FP: TColStd_Array1OfReal

Returns
-------
None
") SetPoles;
		static void SetPoles(const TColgp_Array1OfPnt & Poles, const TColStd_Array1OfReal & Weights, TColStd_Array1OfReal & FP);

		/****************** SetPoles ******************/
		/**** md5 signature: cdcb170a2456b522559c0a3585f22913 ****/
		%feature("compactdefaultargs") SetPoles;
		%feature("autodoc", "Copy in fp the coordinates of the poles.

Parameters
----------
Poles: TColgp_Array1OfPnt2d
FP: TColStd_Array1OfReal

Returns
-------
None
") SetPoles;
		static void SetPoles(const TColgp_Array1OfPnt2d & Poles, TColStd_Array1OfReal & FP);

		/****************** SetPoles ******************/
		/**** md5 signature: f375797a6c7bf3162c62e48364aecaec ****/
		%feature("compactdefaultargs") SetPoles;
		%feature("autodoc", "Copy in fp the coordinates of the poles.

Parameters
----------
Poles: TColgp_Array1OfPnt2d
Weights: TColStd_Array1OfReal
FP: TColStd_Array1OfReal

Returns
-------
None
") SetPoles;
		static void SetPoles(const TColgp_Array1OfPnt2d & Poles, const TColStd_Array1OfReal & Weights, TColStd_Array1OfReal & FP);

		/****************** Trimming ******************/
		/**** md5 signature: 6609651055bd7c0e00841abc195f1706 ****/
		%feature("compactdefaultargs") Trimming;
		%feature("autodoc", "No available documentation.

Parameters
----------
U1: float
U2: float
Coeffs: TColgp_Array1OfPnt
WCoeffs: TColStd_Array1OfReal *

Returns
-------
None
") Trimming;
		static void Trimming(const Standard_Real U1, const Standard_Real U2, TColgp_Array1OfPnt & Coeffs, TColStd_Array1OfReal * WCoeffs);

		/****************** Trimming ******************/
		/**** md5 signature: 7eeab872da522f8774bfc35b5b5f5919 ****/
		%feature("compactdefaultargs") Trimming;
		%feature("autodoc", "No available documentation.

Parameters
----------
U1: float
U2: float
Coeffs: TColgp_Array1OfPnt2d
WCoeffs: TColStd_Array1OfReal *

Returns
-------
None
") Trimming;
		static void Trimming(const Standard_Real U1, const Standard_Real U2, TColgp_Array1OfPnt2d & Coeffs, TColStd_Array1OfReal * WCoeffs);

		/****************** Trimming ******************/
		/**** md5 signature: 974b1a36e127e05843f89ecf24f7ba7b ****/
		%feature("compactdefaultargs") Trimming;
		%feature("autodoc", "No available documentation.

Parameters
----------
U1: float
U2: float
Coeffs: TColStd_Array1OfReal
WCoeffs: TColStd_Array1OfReal *

Returns
-------
None
") Trimming;
		static void Trimming(const Standard_Real U1, const Standard_Real U2, TColStd_Array1OfReal & Coeffs, TColStd_Array1OfReal * WCoeffs);

		/****************** Trimming ******************/
		/**** md5 signature: 988ea67a983cad3e330deec4dd65618a ****/
		%feature("compactdefaultargs") Trimming;
		%feature("autodoc", "No available documentation.

Parameters
----------
U1: float
U2: float
dim: int
Coeffs: TColStd_Array1OfReal
WCoeffs: TColStd_Array1OfReal *

Returns
-------
None
") Trimming;
		static void Trimming(const Standard_Real U1, const Standard_Real U2, const Standard_Integer dim, TColStd_Array1OfReal & Coeffs, TColStd_Array1OfReal * WCoeffs);

		/****************** UTrimming ******************/
		/**** md5 signature: ccff40edf0e7de4bc4a182d01d29bccc ****/
		%feature("compactdefaultargs") UTrimming;
		%feature("autodoc", "No available documentation.

Parameters
----------
U1: float
U2: float
Coeffs: TColgp_Array2OfPnt
WCoeffs: TColStd_Array2OfReal *

Returns
-------
None
") UTrimming;
		static void UTrimming(const Standard_Real U1, const Standard_Real U2, TColgp_Array2OfPnt & Coeffs, TColStd_Array2OfReal * WCoeffs);

		/****************** VTrimming ******************/
		/**** md5 signature: 788469a98a448c44619d0216add2bfd5 ****/
		%feature("compactdefaultargs") VTrimming;
		%feature("autodoc", "No available documentation.

Parameters
----------
V1: float
V2: float
Coeffs: TColgp_Array2OfPnt
WCoeffs: TColStd_Array2OfReal *

Returns
-------
None
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
		/****************** D0 ******************/
		/**** md5 signature: f5babd3072a7b188ca9fffa004c97654 ****/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "Compute the values of the basis functions in u.

Parameters
----------
U: float
BasisValue: TColStd_Array1OfReal

Returns
-------
None
") D0;
		virtual void D0(const Standard_Real U, TColStd_Array1OfReal & BasisValue);

		/****************** D1 ******************/
		/**** md5 signature: d9d9a58968cf2d0e1e57a17f029b9b19 ****/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "Compute the values and the derivatives values of the basis functions in u.

Parameters
----------
U: float
BasisValue: TColStd_Array1OfReal
BasisD1: TColStd_Array1OfReal

Returns
-------
None
") D1;
		virtual void D1(const Standard_Real U, TColStd_Array1OfReal & BasisValue, TColStd_Array1OfReal & BasisD1);

		/****************** D2 ******************/
		/**** md5 signature: 134c337bf429a01cef36366523309f86 ****/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "Compute the values and the derivatives values of the basis functions in u.

Parameters
----------
U: float
BasisValue: TColStd_Array1OfReal
BasisD1: TColStd_Array1OfReal
BasisD2: TColStd_Array1OfReal

Returns
-------
None
") D2;
		virtual void D2(const Standard_Real U, TColStd_Array1OfReal & BasisValue, TColStd_Array1OfReal & BasisD1, TColStd_Array1OfReal & BasisD2);

		/****************** D3 ******************/
		/**** md5 signature: 66c75b8d20f2e32609ebd575117d6026 ****/
		%feature("compactdefaultargs") D3;
		%feature("autodoc", "Compute the values and the derivatives values of the basis functions in u.

Parameters
----------
U: float
BasisValue: TColStd_Array1OfReal
BasisD1: TColStd_Array1OfReal
BasisD2: TColStd_Array1OfReal
BasisD3: TColStd_Array1OfReal

Returns
-------
None
") D3;
		virtual void D3(const Standard_Real U, TColStd_Array1OfReal & BasisValue, TColStd_Array1OfReal & BasisD1, TColStd_Array1OfReal & BasisD2, TColStd_Array1OfReal & BasisD3);

		/****************** ReduceDegree ******************/
		/**** md5 signature: ca1b70fa2f327261ff1d4aea96cde1e7 ****/
		%feature("compactdefaultargs") ReduceDegree;
		%feature("autodoc", "Compute newdegree <= maxdegree so that maxerror is lower than tol. maxerror can be greater than tol if it is not possible to find a newdegree <= maxdegree. in this case newdegree = maxdegree.

Parameters
----------
Dimension: int
MaxDegree: int
Tol: float

Returns
-------
BaseCoeff: float
NewDegree: int
MaxError: float
") ReduceDegree;
		virtual void ReduceDegree(const Standard_Integer Dimension, const Standard_Integer MaxDegree, const Standard_Real Tol, Standard_Real &OutValue, Standard_Integer &OutValue, Standard_Real &OutValue);

		/****************** ToCoefficients ******************/
		/**** md5 signature: f782a7c383866602d159de31b8e68112 ****/
		%feature("compactdefaultargs") ToCoefficients;
		%feature("autodoc", "Convert the polynomial p(t) in the canonical base.

Parameters
----------
Dimension: int
Degree: int
CoeffinBase: TColStd_Array1OfReal
Coefficients: TColStd_Array1OfReal

Returns
-------
None
") ToCoefficients;
		virtual void ToCoefficients(const Standard_Integer Dimension, const Standard_Integer Degree, const TColStd_Array1OfReal & CoeffinBase, TColStd_Array1OfReal & Coefficients);

		/****************** WorkDegree ******************/
		/**** md5 signature: 9a1ca2a01d0260cba5c5864a0622a4bb ****/
		%feature("compactdefaultargs") WorkDegree;
		%feature("autodoc", "Returns workdegree.

Returns
-------
int
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
		/****************** PLib_DoubleJacobiPolynomial ******************/
		/**** md5 signature: de463bd0cd7c05a53bea601d0037764a ****/
		%feature("compactdefaultargs") PLib_DoubleJacobiPolynomial;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") PLib_DoubleJacobiPolynomial;
		 PLib_DoubleJacobiPolynomial();

		/****************** PLib_DoubleJacobiPolynomial ******************/
		/**** md5 signature: 49f9338666d135519dabf31bcc8c23e3 ****/
		%feature("compactdefaultargs") PLib_DoubleJacobiPolynomial;
		%feature("autodoc", "No available documentation.

Parameters
----------
JacPolU: PLib_JacobiPolynomial
JacPolV: PLib_JacobiPolynomial

Returns
-------
None
") PLib_DoubleJacobiPolynomial;
		 PLib_DoubleJacobiPolynomial(const opencascade::handle<PLib_JacobiPolynomial> & JacPolU, const opencascade::handle<PLib_JacobiPolynomial> & JacPolV);

		/****************** AverageError ******************/
		/**** md5 signature: 59c1f819623f1745c15ea941a534a3c6 ****/
		%feature("compactdefaultargs") AverageError;
		%feature("autodoc", "No available documentation.

Parameters
----------
Dimension: int
DegreeU: int
DegreeV: int
dJacCoeff: int
JacCoeff: TColStd_Array1OfReal

Returns
-------
float
") AverageError;
		Standard_Real AverageError(const Standard_Integer Dimension, const Standard_Integer DegreeU, const Standard_Integer DegreeV, const Standard_Integer dJacCoeff, const TColStd_Array1OfReal & JacCoeff);

		/****************** MaxError ******************/
		/**** md5 signature: bc59636dbf7a805929772dcec393550a ****/
		%feature("compactdefaultargs") MaxError;
		%feature("autodoc", "No available documentation.

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

Returns
-------
float
") MaxError;
		Standard_Real MaxError(const Standard_Integer Dimension, const Standard_Integer MinDegreeU, const Standard_Integer MaxDegreeU, const Standard_Integer MinDegreeV, const Standard_Integer MaxDegreeV, const Standard_Integer dJacCoeff, const TColStd_Array1OfReal & JacCoeff, const Standard_Real Error);

		/****************** MaxErrorU ******************/
		/**** md5 signature: fa1c1a1b84cc2387af19de3d28c7f149 ****/
		%feature("compactdefaultargs") MaxErrorU;
		%feature("autodoc", "No available documentation.

Parameters
----------
Dimension: int
DegreeU: int
DegreeV: int
dJacCoeff: int
JacCoeff: TColStd_Array1OfReal

Returns
-------
float
") MaxErrorU;
		Standard_Real MaxErrorU(const Standard_Integer Dimension, const Standard_Integer DegreeU, const Standard_Integer DegreeV, const Standard_Integer dJacCoeff, const TColStd_Array1OfReal & JacCoeff);

		/****************** MaxErrorV ******************/
		/**** md5 signature: 24a809baa701e14e9eeacba743288173 ****/
		%feature("compactdefaultargs") MaxErrorV;
		%feature("autodoc", "No available documentation.

Parameters
----------
Dimension: int
DegreeU: int
DegreeV: int
dJacCoeff: int
JacCoeff: TColStd_Array1OfReal

Returns
-------
float
") MaxErrorV;
		Standard_Real MaxErrorV(const Standard_Integer Dimension, const Standard_Integer DegreeU, const Standard_Integer DegreeV, const Standard_Integer dJacCoeff, const TColStd_Array1OfReal & JacCoeff);

		/****************** ReduceDegree ******************/
		/**** md5 signature: 77ba30a13eb302f19648d95566fd2879 ****/
		%feature("compactdefaultargs") ReduceDegree;
		%feature("autodoc", "No available documentation.

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

Returns
-------
MaxError: float
NewDegreeU: int
NewDegreeV: int
") ReduceDegree;
		void ReduceDegree(const Standard_Integer Dimension, const Standard_Integer MinDegreeU, const Standard_Integer MaxDegreeU, const Standard_Integer MinDegreeV, const Standard_Integer MaxDegreeV, const Standard_Integer dJacCoeff, const TColStd_Array1OfReal & JacCoeff, const Standard_Real EpmsCut, Standard_Real &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue);

		/****************** TabMaxU ******************/
		/**** md5 signature: fc95031f2fdeddc86d00107cc1fea84d ****/
		%feature("compactdefaultargs") TabMaxU;
		%feature("autodoc", "Returns mytabmaxu;.

Returns
-------
opencascade::handle<TColStd_HArray1OfReal>
") TabMaxU;
		opencascade::handle<TColStd_HArray1OfReal> TabMaxU();

		/****************** TabMaxV ******************/
		/**** md5 signature: 3eced45af4cd28d8005f62873ad702f4 ****/
		%feature("compactdefaultargs") TabMaxV;
		%feature("autodoc", "Returns mytabmaxv;.

Returns
-------
opencascade::handle<TColStd_HArray1OfReal>
") TabMaxV;
		opencascade::handle<TColStd_HArray1OfReal> TabMaxV();

		/****************** U ******************/
		/**** md5 signature: 888b3c693208ad6e93cd32ea973e39b6 ****/
		%feature("compactdefaultargs") U;
		%feature("autodoc", "Returns myjacpolu;.

Returns
-------
opencascade::handle<PLib_JacobiPolynomial>
") U;
		opencascade::handle<PLib_JacobiPolynomial> U();

		/****************** V ******************/
		/**** md5 signature: 948c918cfc3846192241d6b03888e5d8 ****/
		%feature("compactdefaultargs") V;
		%feature("autodoc", "Returns myjacpolv;.

Returns
-------
opencascade::handle<PLib_JacobiPolynomial>
") V;
		opencascade::handle<PLib_JacobiPolynomial> V();

		/****************** WDoubleJacobiToCoefficients ******************/
		/**** md5 signature: 7486e56c849e6ee4aaca40f890784054 ****/
		%feature("compactdefaultargs") WDoubleJacobiToCoefficients;
		%feature("autodoc", "No available documentation.

Parameters
----------
Dimension: int
DegreeU: int
DegreeV: int
JacCoeff: TColStd_Array1OfReal
Coefficients: TColStd_Array1OfReal

Returns
-------
None
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
		/****************** PLib_HermitJacobi ******************/
		/**** md5 signature: cba66df678b1af8e782a27e59df85c21 ****/
		%feature("compactdefaultargs") PLib_HermitJacobi;
		%feature("autodoc", "Initialize the polynomial class degree has to be <= 30 constraintorder has to be geomabs_c0 geomabs_c1 geomabs_c2.

Parameters
----------
WorkDegree: int
ConstraintOrder: GeomAbs_Shape

Returns
-------
None
") PLib_HermitJacobi;
		 PLib_HermitJacobi(const Standard_Integer WorkDegree, const GeomAbs_Shape ConstraintOrder);

		/****************** AverageError ******************/
		/**** md5 signature: a9a12575c7d1c3a88bf0b0575c067ea1 ****/
		%feature("compactdefaultargs") AverageError;
		%feature("autodoc", "No available documentation.

Parameters
----------
Dimension: int
NewDegree: int

Returns
-------
HermJacCoeff: float
") AverageError;
		Standard_Real AverageError(const Standard_Integer Dimension, Standard_Real &OutValue, const Standard_Integer NewDegree);

		/****************** D0 ******************/
		/**** md5 signature: 09c80be2d04ee5a218e542ce631154a4 ****/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "Compute the values of the basis functions in u.

Parameters
----------
U: float
BasisValue: TColStd_Array1OfReal

Returns
-------
None
") D0;
		void D0(const Standard_Real U, TColStd_Array1OfReal & BasisValue);

		/****************** D1 ******************/
		/**** md5 signature: b03786188171580f3cb776bc09557910 ****/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "Compute the values and the derivatives values of the basis functions in u.

Parameters
----------
U: float
BasisValue: TColStd_Array1OfReal
BasisD1: TColStd_Array1OfReal

Returns
-------
None
") D1;
		void D1(const Standard_Real U, TColStd_Array1OfReal & BasisValue, TColStd_Array1OfReal & BasisD1);

		/****************** D2 ******************/
		/**** md5 signature: 8351d01efc2c719802b2311de6c56189 ****/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "Compute the values and the derivatives values of the basis functions in u.

Parameters
----------
U: float
BasisValue: TColStd_Array1OfReal
BasisD1: TColStd_Array1OfReal
BasisD2: TColStd_Array1OfReal

Returns
-------
None
") D2;
		void D2(const Standard_Real U, TColStd_Array1OfReal & BasisValue, TColStd_Array1OfReal & BasisD1, TColStd_Array1OfReal & BasisD2);

		/****************** D3 ******************/
		/**** md5 signature: 4dc2082da716976d329ea0bb061d0924 ****/
		%feature("compactdefaultargs") D3;
		%feature("autodoc", "Compute the values and the derivatives values of the basis functions in u.

Parameters
----------
U: float
BasisValue: TColStd_Array1OfReal
BasisD1: TColStd_Array1OfReal
BasisD2: TColStd_Array1OfReal
BasisD3: TColStd_Array1OfReal

Returns
-------
None
") D3;
		void D3(const Standard_Real U, TColStd_Array1OfReal & BasisValue, TColStd_Array1OfReal & BasisD1, TColStd_Array1OfReal & BasisD2, TColStd_Array1OfReal & BasisD3);

		/****************** MaxError ******************/
		/**** md5 signature: 2345d026ce40e07d223c7963b1e4404d ****/
		%feature("compactdefaultargs") MaxError;
		%feature("autodoc", "This method computes the maximum error on the polynomial w(t) q(t) obtained by missing the coefficients of jaccoeff from newdegree +1 to degree.

Parameters
----------
Dimension: int
NewDegree: int

Returns
-------
HermJacCoeff: float
") MaxError;
		Standard_Real MaxError(const Standard_Integer Dimension, Standard_Real &OutValue, const Standard_Integer NewDegree);

		/****************** NivConstr ******************/
		/**** md5 signature: f6a2f8af8bbecc140e8868581b3445e5 ****/
		%feature("compactdefaultargs") NivConstr;
		%feature("autodoc", "Returns nivconstr.

Returns
-------
int
") NivConstr;
		Standard_Integer NivConstr();

		/****************** ReduceDegree ******************/
		/**** md5 signature: ff23be12c9df448943274c01cf909a73 ****/
		%feature("compactdefaultargs") ReduceDegree;
		%feature("autodoc", "Compute newdegree <= maxdegree so that maxerror is lower than tol. maxerror can be greater than tol if it is not possible to find a newdegree <= maxdegree. in this case newdegree = maxdegree.

Parameters
----------
Dimension: int
MaxDegree: int
Tol: float

Returns
-------
HermJacCoeff: float
NewDegree: int
MaxError: float
") ReduceDegree;
		void ReduceDegree(const Standard_Integer Dimension, const Standard_Integer MaxDegree, const Standard_Real Tol, Standard_Real &OutValue, Standard_Integer &OutValue, Standard_Real &OutValue);

		/****************** ToCoefficients ******************/
		/**** md5 signature: a251e30979bee64ba1fd366e4690d6f2 ****/
		%feature("compactdefaultargs") ToCoefficients;
		%feature("autodoc", "Convert the polynomial p(t) = h(t) + w(t) q(t) in the canonical base.

Parameters
----------
Dimension: int
Degree: int
HermJacCoeff: TColStd_Array1OfReal
Coefficients: TColStd_Array1OfReal

Returns
-------
None
") ToCoefficients;
		void ToCoefficients(const Standard_Integer Dimension, const Standard_Integer Degree, const TColStd_Array1OfReal & HermJacCoeff, TColStd_Array1OfReal & Coefficients);

		/****************** WorkDegree ******************/
		/**** md5 signature: 0fafe1aec89490c754959fbbbd4a6908 ****/
		%feature("compactdefaultargs") WorkDegree;
		%feature("autodoc", "Returns workdegree.

Returns
-------
int
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
		/****************** PLib_JacobiPolynomial ******************/
		/**** md5 signature: be57bd43ad8816e1ff65244f66d15a7d ****/
		%feature("compactdefaultargs") PLib_JacobiPolynomial;
		%feature("autodoc", "Initialize the polynomial class degree has to be <= 30 constraintorder has to be geomabs_c0 geomabs_c1 geomabs_c2.

Parameters
----------
WorkDegree: int
ConstraintOrder: GeomAbs_Shape

Returns
-------
None
") PLib_JacobiPolynomial;
		 PLib_JacobiPolynomial(const Standard_Integer WorkDegree, const GeomAbs_Shape ConstraintOrder);

		/****************** AverageError ******************/
		/**** md5 signature: 105a3adb8c2438de6a03a39558a2fdf7 ****/
		%feature("compactdefaultargs") AverageError;
		%feature("autodoc", "No available documentation.

Parameters
----------
Dimension: int
NewDegree: int

Returns
-------
JacCoeff: float
") AverageError;
		Standard_Real AverageError(const Standard_Integer Dimension, Standard_Real &OutValue, const Standard_Integer NewDegree);

		/****************** D0 ******************/
		/**** md5 signature: 09c80be2d04ee5a218e542ce631154a4 ****/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "Compute the values of the basis functions in u.

Parameters
----------
U: float
BasisValue: TColStd_Array1OfReal

Returns
-------
None
") D0;
		void D0(const Standard_Real U, TColStd_Array1OfReal & BasisValue);

		/****************** D1 ******************/
		/**** md5 signature: b03786188171580f3cb776bc09557910 ****/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "Compute the values and the derivatives values of the basis functions in u.

Parameters
----------
U: float
BasisValue: TColStd_Array1OfReal
BasisD1: TColStd_Array1OfReal

Returns
-------
None
") D1;
		void D1(const Standard_Real U, TColStd_Array1OfReal & BasisValue, TColStd_Array1OfReal & BasisD1);

		/****************** D2 ******************/
		/**** md5 signature: 8351d01efc2c719802b2311de6c56189 ****/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "Compute the values and the derivatives values of the basis functions in u.

Parameters
----------
U: float
BasisValue: TColStd_Array1OfReal
BasisD1: TColStd_Array1OfReal
BasisD2: TColStd_Array1OfReal

Returns
-------
None
") D2;
		void D2(const Standard_Real U, TColStd_Array1OfReal & BasisValue, TColStd_Array1OfReal & BasisD1, TColStd_Array1OfReal & BasisD2);

		/****************** D3 ******************/
		/**** md5 signature: 4dc2082da716976d329ea0bb061d0924 ****/
		%feature("compactdefaultargs") D3;
		%feature("autodoc", "Compute the values and the derivatives values of the basis functions in u.

Parameters
----------
U: float
BasisValue: TColStd_Array1OfReal
BasisD1: TColStd_Array1OfReal
BasisD2: TColStd_Array1OfReal
BasisD3: TColStd_Array1OfReal

Returns
-------
None
") D3;
		void D3(const Standard_Real U, TColStd_Array1OfReal & BasisValue, TColStd_Array1OfReal & BasisD1, TColStd_Array1OfReal & BasisD2, TColStd_Array1OfReal & BasisD3);

		/****************** MaxError ******************/
		/**** md5 signature: 53f6b08ebe2907b85f487eb8d618147c ****/
		%feature("compactdefaultargs") MaxError;
		%feature("autodoc", "This method computes the maximum error on the polynomial w(t) q(t) obtained by missing the coefficients of jaccoeff from newdegree +1 to degree.

Parameters
----------
Dimension: int
NewDegree: int

Returns
-------
JacCoeff: float
") MaxError;
		Standard_Real MaxError(const Standard_Integer Dimension, Standard_Real &OutValue, const Standard_Integer NewDegree);

		/****************** MaxValue ******************/
		/**** md5 signature: fada13e95068e5e093ec1e3d3bdbd555 ****/
		%feature("compactdefaultargs") MaxValue;
		%feature("autodoc", "This method loads for k=0,q the maximum value of abs ( w(t)*jk(t) )for t bellonging to [-1,1] this values are loaded is the array tabmax(0,myworkdegree-2*(mynivconst+1)) maxvalue ( me ; tabmaxpointer : in out real );.

Parameters
----------
TabMax: TColStd_Array1OfReal

Returns
-------
None
") MaxValue;
		void MaxValue(TColStd_Array1OfReal & TabMax);

		/****************** NivConstr ******************/
		/**** md5 signature: f6a2f8af8bbecc140e8868581b3445e5 ****/
		%feature("compactdefaultargs") NivConstr;
		%feature("autodoc", "Returns nivconstr.

Returns
-------
int
") NivConstr;
		Standard_Integer NivConstr();

		/****************** Points ******************/
		/**** md5 signature: 653579675c537b457b38505106af2c77 ****/
		%feature("compactdefaultargs") Points;
		%feature("autodoc", "Returns the jacobi points for gauss integration ie the positive values of the legendre roots by increasing values nbgausspoints is the number of points choosen for the integral computation. tabpoints (0,nbgausspoints/2) tabpoints (0) is loaded only for the odd values of nbgausspoints the possible values for nbgausspoints are : 8, 10, 15, 20, 25, 30, 35, 40, 50, 61 nbgausspoints must be greater than degree.

Parameters
----------
NbGaussPoints: int
TabPoints: TColStd_Array1OfReal

Returns
-------
None
") Points;
		void Points(const Standard_Integer NbGaussPoints, TColStd_Array1OfReal & TabPoints);

		/****************** ReduceDegree ******************/
		/**** md5 signature: f3d1d0bcdf80f3699f0ff0a659fee202 ****/
		%feature("compactdefaultargs") ReduceDegree;
		%feature("autodoc", "Compute newdegree <= maxdegree so that maxerror is lower than tol. maxerror can be greater than tol if it is not possible to find a newdegree <= maxdegree. in this case newdegree = maxdegree.

Parameters
----------
Dimension: int
MaxDegree: int
Tol: float

Returns
-------
JacCoeff: float
NewDegree: int
MaxError: float
") ReduceDegree;
		void ReduceDegree(const Standard_Integer Dimension, const Standard_Integer MaxDegree, const Standard_Real Tol, Standard_Real &OutValue, Standard_Integer &OutValue, Standard_Real &OutValue);

		/****************** ToCoefficients ******************/
		/**** md5 signature: ff80fc0ff0d7e1c4e5d1180709a294be ****/
		%feature("compactdefaultargs") ToCoefficients;
		%feature("autodoc", "Convert the polynomial p(t) = r(t) + w(t) q(t) in the canonical base.

Parameters
----------
Dimension: int
Degree: int
JacCoeff: TColStd_Array1OfReal
Coefficients: TColStd_Array1OfReal

Returns
-------
None
") ToCoefficients;
		void ToCoefficients(const Standard_Integer Dimension, const Standard_Integer Degree, const TColStd_Array1OfReal & JacCoeff, TColStd_Array1OfReal & Coefficients);

		/****************** Weights ******************/
		/**** md5 signature: 4ae0ffe39406097290e31be2570d9f0d ****/
		%feature("compactdefaultargs") Weights;
		%feature("autodoc", "Returns the jacobi weigths for gauss integration only for the positive values of the legendre roots in the order they are given by the method points nbgausspoints is the number of points choosen for the integral computation. tabweights (0,nbgausspoints/2,0,degree) tabweights (0,.) are only loaded for the odd values of nbgausspoints the possible values for nbgausspoints are : 8 , 10 , 15 ,20 ,25 , 30, 35 , 40 , 50 , 61 nbgausspoints must be greater than degree.

Parameters
----------
NbGaussPoints: int
TabWeights: TColStd_Array2OfReal

Returns
-------
None
") Weights;
		void Weights(const Standard_Integer NbGaussPoints, TColStd_Array2OfReal & TabWeights);

		/****************** WorkDegree ******************/
		/**** md5 signature: 0fafe1aec89490c754959fbbbd4a6908 ****/
		%feature("compactdefaultargs") WorkDegree;
		%feature("autodoc", "Returns workdegree.

Returns
-------
int
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
