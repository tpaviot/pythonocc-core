/*
Copyright 2008-2017 Thomas Paviot (tpaviot@gmail.com)


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
%module (package="OCC") PLib

#pragma SWIG nowarn=504,325,503

%{
#ifdef WNT
#pragma warning(disable : 4716)
#endif
%}

%include ../common/CommonIncludes.i
%include ../common/ExceptionCatcher.i
%include ../common/FunctionTransformers.i
%include ../common/Operators.i


%include PLib_headers.i


%pythoncode {
def register_handle(handle, base_object):
    """
    Inserts the handle into the base object to
    prevent memory corruption in certain cases
    """
    try:
        if base_object.IsKind("Standard_Transient"):
            base_object.thisHandle = handle
            base_object.thisown = False
    except:
        pass
};

/* typedefs */
/* end typedefs declaration */

/* public enums */
/* end public enums declaration */

%rename(plib) PLib;
class PLib {
	public:
		%feature("compactdefaultargs") NoWeights;
		%feature("autodoc", "	* Used as argument for a non rational functions

	:rtype: TColStd_Array1OfReal
") NoWeights;
		static TColStd_Array1OfReal & NoWeights ();
		%feature("compactdefaultargs") NoWeights2;
		%feature("autodoc", "	* Used as argument for a non rational functions

	:rtype: TColStd_Array2OfReal
") NoWeights2;
		static TColStd_Array2OfReal & NoWeights2 ();
		%feature("compactdefaultargs") SetPoles;
		%feature("autodoc", "	* Copy in FP the coordinates of the poles.

	:param Poles:
	:type Poles: TColgp_Array1OfPnt
	:param FP:
	:type FP: TColStd_Array1OfReal &
	:rtype: void
") SetPoles;
		static void SetPoles (const TColgp_Array1OfPnt & Poles,TColStd_Array1OfReal & FP);
		%feature("compactdefaultargs") SetPoles;
		%feature("autodoc", "	* Copy in FP the coordinates of the poles.

	:param Poles:
	:type Poles: TColgp_Array1OfPnt
	:param Weights:
	:type Weights: TColStd_Array1OfReal &
	:param FP:
	:type FP: TColStd_Array1OfReal &
	:rtype: void
") SetPoles;
		static void SetPoles (const TColgp_Array1OfPnt & Poles,const TColStd_Array1OfReal & Weights,TColStd_Array1OfReal & FP);
		%feature("compactdefaultargs") GetPoles;
		%feature("autodoc", "	* Get from FP the coordinates of the poles.

	:param FP:
	:type FP: TColStd_Array1OfReal &
	:param Poles:
	:type Poles: TColgp_Array1OfPnt
	:rtype: void
") GetPoles;
		static void GetPoles (const TColStd_Array1OfReal & FP,TColgp_Array1OfPnt & Poles);
		%feature("compactdefaultargs") GetPoles;
		%feature("autodoc", "	* Get from FP the coordinates of the poles.

	:param FP:
	:type FP: TColStd_Array1OfReal &
	:param Poles:
	:type Poles: TColgp_Array1OfPnt
	:param Weights:
	:type Weights: TColStd_Array1OfReal &
	:rtype: void
") GetPoles;
		static void GetPoles (const TColStd_Array1OfReal & FP,TColgp_Array1OfPnt & Poles,TColStd_Array1OfReal & Weights);
		%feature("compactdefaultargs") SetPoles;
		%feature("autodoc", "	* Copy in FP the coordinates of the poles.

	:param Poles:
	:type Poles: TColgp_Array1OfPnt2d
	:param FP:
	:type FP: TColStd_Array1OfReal &
	:rtype: void
") SetPoles;
		static void SetPoles (const TColgp_Array1OfPnt2d & Poles,TColStd_Array1OfReal & FP);
		%feature("compactdefaultargs") SetPoles;
		%feature("autodoc", "	* Copy in FP the coordinates of the poles.

	:param Poles:
	:type Poles: TColgp_Array1OfPnt2d
	:param Weights:
	:type Weights: TColStd_Array1OfReal &
	:param FP:
	:type FP: TColStd_Array1OfReal &
	:rtype: void
") SetPoles;
		static void SetPoles (const TColgp_Array1OfPnt2d & Poles,const TColStd_Array1OfReal & Weights,TColStd_Array1OfReal & FP);
		%feature("compactdefaultargs") GetPoles;
		%feature("autodoc", "	* Get from FP the coordinates of the poles.

	:param FP:
	:type FP: TColStd_Array1OfReal &
	:param Poles:
	:type Poles: TColgp_Array1OfPnt2d
	:rtype: void
") GetPoles;
		static void GetPoles (const TColStd_Array1OfReal & FP,TColgp_Array1OfPnt2d & Poles);
		%feature("compactdefaultargs") GetPoles;
		%feature("autodoc", "	* Get from FP the coordinates of the poles.

	:param FP:
	:type FP: TColStd_Array1OfReal &
	:param Poles:
	:type Poles: TColgp_Array1OfPnt2d
	:param Weights:
	:type Weights: TColStd_Array1OfReal &
	:rtype: void
") GetPoles;
		static void GetPoles (const TColStd_Array1OfReal & FP,TColgp_Array1OfPnt2d & Poles,TColStd_Array1OfReal & Weights);
		%feature("compactdefaultargs") Bin;
		%feature("autodoc", "	* Returns the Binomial Cnp. N should be <= BSplCLib::MaxDegree().

	:param N:
	:type N: int
	:param P:
	:type P: int
	:rtype: float
") Bin;
		static Standard_Real Bin (const Standard_Integer N,const Standard_Integer P);
		%feature("compactdefaultargs") RationalDerivative;
		%feature("autodoc", "	* Computes the derivatives of a ratio at order <N> in dimension <Dimension>. //! <Ders> is an array containing the values of the input derivatives from 0 to Min(<N>,<Degree>). For orders higher than <Degree> the inputcd /s2d1/BMDL/ derivatives are assumed to be 0. //! Content of <Ders> : //! x(1),x(2),...,x(Dimension),w x'(1),x'(2),...,x'(Dimension),w' x''(1),x''(2),...,x''(Dimension),w'' //! If <All> is false, only the derivative at order <N> is computed. <RDers> is an array of length Dimension which will contain the result : //! x(1)/w , x(2)/w , ... derivated <N> times //! If <All> is true all the derivatives up to order <N> are computed. <RDers> is an array of length Dimension * (N+1) which will contains : //! x(1)/w , x(2)/w , ... x(1)/w , x(2)/w , ... derivated <1> times x(1)/w , x(2)/w , ... derivated <2> times ... x(1)/w , x(2)/w , ... derivated <N> times //! Warning: <RDers> must be dimensionned properly.

	:param Degree:
	:type Degree: int
	:param N:
	:type N: int
	:param Dimension:
	:type Dimension: int
	:param Ders:
	:type Ders: float &
	:param RDers:
	:type RDers: float &
	:param All: default value is Standard_True
	:type All: bool
	:rtype: void
") RationalDerivative;
		static void RationalDerivative (const Standard_Integer Degree,const Standard_Integer N,const Standard_Integer Dimension,Standard_Real &OutValue,Standard_Real &OutValue,const Standard_Boolean All = Standard_True);
		%feature("compactdefaultargs") RationalDerivatives;
		%feature("autodoc", "	* Computes DerivativesRequest derivatives of a ratio at of a BSpline function of degree <Degree> dimension <Dimension>. //! <PolesDerivatives> is an array containing the values of the input derivatives from 0 to <DerivativeRequest> For orders higher than <Degree> the input derivatives are assumed to be 0. //! Content of <PoleasDerivatives> : //! x(1),x(2),...,x(Dimension) x'(1),x'(2),...,x'(Dimension) x''(1),x''(2),...,x''(Dimension) //! WeightsDerivatives is an array that contains derivatives from 0 to <DerivativeRequest> After returning from the routine the array RationalDerivatives contains the following x(1)/w , x(2)/w , ... x(1)/w , x(2)/w , ... derivated once x(1)/w , x(2)/w , ... twice x(1)/w , x(2)/w , ... derivated <DerivativeRequest> times //! The array RationalDerivatives and PolesDerivatives can be same since the overwrite is non destructive within the algorithm //! Warning: <RationalDerivates> must be dimensionned properly.

	:param DerivativesRequest:
	:type DerivativesRequest: int
	:param Dimension:
	:type Dimension: int
	:param PolesDerivatives:
	:type PolesDerivatives: float &
	:param WeightsDerivatives:
	:type WeightsDerivatives: float &
	:param RationalDerivates:
	:type RationalDerivates: float &
	:rtype: void
") RationalDerivatives;
		static void RationalDerivatives (const Standard_Integer DerivativesRequest,const Standard_Integer Dimension,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") EvalPolynomial;
		%feature("autodoc", "	* Performs Horner method with synthethic division for derivatives parameter <U>, with <Degree> and <Dimension>. PolynomialCoeff are stored in the following fashion c0(1) c0(2) .... c0(Dimension) c1(1) c1(2) .... c1(Dimension) //! cDegree(1) cDegree(2) .... cDegree(Dimension) where the polynomial is defined as : //! 2 Degree c0 + c1 X + c2 X + .... cDegree X //! Results stores the result in the following format //! f(1) f(2) .... f(Dimension) (1)  (1)  (1) f (1) f (2) .... f (Dimension) //! (DerivativeRequest) (DerivativeRequest) f (1)  f (Dimension) //! this just evaluates the point at parameter U //! Warning: <Results> and <PolynomialCoeff> must be dimensioned properly

	:param U:
	:type U: float
	:param DerivativeOrder:
	:type DerivativeOrder: int
	:param Degree:
	:type Degree: int
	:param Dimension:
	:type Dimension: int
	:param PolynomialCoeff:
	:type PolynomialCoeff: float &
	:param Results:
	:type Results: float &
	:rtype: void
") EvalPolynomial;
		static void EvalPolynomial (const Standard_Real U,const Standard_Integer DerivativeOrder,const Standard_Integer Degree,const Standard_Integer Dimension,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") NoDerivativeEvalPolynomial;
		%feature("autodoc", "	* Same as above with DerivativeOrder = 0;

	:param U:
	:type U: float
	:param Degree:
	:type Degree: int
	:param Dimension:
	:type Dimension: int
	:param DegreeDimension:
	:type DegreeDimension: int
	:param PolynomialCoeff:
	:type PolynomialCoeff: float &
	:param Results:
	:type Results: float &
	:rtype: void
") NoDerivativeEvalPolynomial;
		static void NoDerivativeEvalPolynomial (const Standard_Real U,const Standard_Integer Degree,const Standard_Integer Dimension,const Standard_Integer DegreeDimension,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") EvalPoly2Var;
		%feature("autodoc", "	* Applies EvalPolynomial twice to evaluate the derivative of orders UDerivativeOrder in U, VDerivativeOrder in V at parameters U,V //! PolynomialCoeff are stored in the following fashion c00(1) .... c00(Dimension) c10(1) .... c10(Dimension) .... cm0(1) .... cm0(Dimension) .... c01(1) .... c01(Dimension) c11(1) .... c11(Dimension) .... cm1(1) .... cm1(Dimension) .... c0n(1) .... c0n(Dimension) c1n(1) .... c1n(Dimension) .... cmn(1) .... cmn(Dimension) //! where the polynomial is defined as : 2  m c00 + c10 U + c20 U + .... + cm0 U 2  m + c01 V + c11 UV + c21 U V + .... + cm1 U V n m n + .... + c0n V + .... + cmn U V //! with m = UDegree and n = VDegree //! Results stores the result in the following format //! f(1) f(2) .... f(Dimension) //! Warning: <Results> and <PolynomialCoeff> must be dimensioned properly

	:param U:
	:type U: float
	:param V:
	:type V: float
	:param UDerivativeOrder:
	:type UDerivativeOrder: int
	:param VDerivativeOrder:
	:type VDerivativeOrder: int
	:param UDegree:
	:type UDegree: int
	:param VDegree:
	:type VDegree: int
	:param Dimension:
	:type Dimension: int
	:param PolynomialCoeff:
	:type PolynomialCoeff: float &
	:param Results:
	:type Results: float &
	:rtype: void
") EvalPoly2Var;
		static void EvalPoly2Var (const Standard_Real U,const Standard_Real V,const Standard_Integer UDerivativeOrder,const Standard_Integer VDerivativeOrder,const Standard_Integer UDegree,const Standard_Integer VDegree,const Standard_Integer Dimension,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") EvalLagrange;
		%feature("autodoc", "	* Performs the Lagrange Interpolation of given series of points with given parameters with the requested derivative order Results will store things in the following format with d = DerivativeOrder //! [0], [Dimension-1]  : value [Dimension], [Dimension + Dimension-1] : first derivative //! [d *Dimension], [d*Dimension + Dimension-1]: dth derivative

	:param U:
	:type U: float
	:param DerivativeOrder:
	:type DerivativeOrder: int
	:param Degree:
	:type Degree: int
	:param Dimension:
	:type Dimension: int
	:param ValueArray:
	:type ValueArray: float &
	:param ParameterArray:
	:type ParameterArray: float &
	:param Results:
	:type Results: float &
	:rtype: int
") EvalLagrange;
		static Standard_Integer EvalLagrange (const Standard_Real U,const Standard_Integer DerivativeOrder,const Standard_Integer Degree,const Standard_Integer Dimension,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") EvalCubicHermite;
		%feature("autodoc", "	* Performs the Cubic Hermite Interpolation of given series of points with given parameters with the requested derivative order. ValueArray stores the value at the first and last parameter. It has the following format : [0], [Dimension-1]  : value at first param [Dimension], [Dimension + Dimension-1] : value at last param Derivative array stores the value of the derivatives at the first parameter and at the last parameter in the following format [0], [Dimension-1]  : derivative at first param [Dimension], [Dimension + Dimension-1] : derivative at last param //! ParameterArray stores the first and last parameter in the following format : [0] : first parameter [1] : last parameter //! Results will store things in the following format with d = DerivativeOrder //! [0], [Dimension-1]  : value [Dimension], [Dimension + Dimension-1] : first derivative //! [d *Dimension], [d*Dimension + Dimension-1]: dth derivative

	:param U:
	:type U: float
	:param DerivativeOrder:
	:type DerivativeOrder: int
	:param Dimension:
	:type Dimension: int
	:param ValueArray:
	:type ValueArray: float &
	:param DerivativeArray:
	:type DerivativeArray: float &
	:param ParameterArray:
	:type ParameterArray: float &
	:param Results:
	:type Results: float &
	:rtype: int
") EvalCubicHermite;
		static Standard_Integer EvalCubicHermite (const Standard_Real U,const Standard_Integer DerivativeOrder,const Standard_Integer Dimension,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") HermiteCoefficients;
		%feature("autodoc", "	* This build the coefficient of Hermite's polynomes on [FirstParameter, LastParameter] //! if j <= FirstOrder+1 then //! MatrixCoefs[i, j] = ith coefficient of the polynome H0,j-1 //! else //! MatrixCoefs[i, j] = ith coefficient of the polynome H1,k with k = j - FirstOrder - 2 //! return false if - |FirstParameter| > 100 - |LastParameter| > 100 - |FirstParameter| +|LastParameter| < 1/100 - |LastParameter - FirstParameter| / (|FirstParameter| +|LastParameter|) < 1/100

	:param FirstParameter:
	:type FirstParameter: float
	:param LastParameter:
	:type LastParameter: float
	:param FirstOrder:
	:type FirstOrder: int
	:param LastOrder:
	:type LastOrder: int
	:param MatrixCoefs:
	:type MatrixCoefs: math_Matrix &
	:rtype: bool
") HermiteCoefficients;
		static Standard_Boolean HermiteCoefficients (const Standard_Real FirstParameter,const Standard_Real LastParameter,const Standard_Integer FirstOrder,const Standard_Integer LastOrder,math_Matrix & MatrixCoefs);
		%feature("compactdefaultargs") CoefficientsPoles;
		%feature("autodoc", "	:param Coefs:
	:type Coefs: TColgp_Array1OfPnt
	:param WCoefs:
	:type WCoefs: TColStd_Array1OfReal &
	:param Poles:
	:type Poles: TColgp_Array1OfPnt
	:param WPoles:
	:type WPoles: TColStd_Array1OfReal &
	:rtype: void
") CoefficientsPoles;
		static void CoefficientsPoles (const TColgp_Array1OfPnt & Coefs,const TColStd_Array1OfReal & WCoefs,TColgp_Array1OfPnt & Poles,TColStd_Array1OfReal & WPoles);
		%feature("compactdefaultargs") CoefficientsPoles;
		%feature("autodoc", "	:param Coefs:
	:type Coefs: TColgp_Array1OfPnt2d
	:param WCoefs:
	:type WCoefs: TColStd_Array1OfReal &
	:param Poles:
	:type Poles: TColgp_Array1OfPnt2d
	:param WPoles:
	:type WPoles: TColStd_Array1OfReal &
	:rtype: void
") CoefficientsPoles;
		static void CoefficientsPoles (const TColgp_Array1OfPnt2d & Coefs,const TColStd_Array1OfReal & WCoefs,TColgp_Array1OfPnt2d & Poles,TColStd_Array1OfReal & WPoles);
		%feature("compactdefaultargs") CoefficientsPoles;
		%feature("autodoc", "	:param Coefs:
	:type Coefs: TColStd_Array1OfReal &
	:param WCoefs:
	:type WCoefs: TColStd_Array1OfReal &
	:param Poles:
	:type Poles: TColStd_Array1OfReal &
	:param WPoles:
	:type WPoles: TColStd_Array1OfReal &
	:rtype: void
") CoefficientsPoles;
		static void CoefficientsPoles (const TColStd_Array1OfReal & Coefs,const TColStd_Array1OfReal & WCoefs,TColStd_Array1OfReal & Poles,TColStd_Array1OfReal & WPoles);
		%feature("compactdefaultargs") CoefficientsPoles;
		%feature("autodoc", "	:param dim:
	:type dim: int
	:param Coefs:
	:type Coefs: TColStd_Array1OfReal &
	:param WCoefs:
	:type WCoefs: TColStd_Array1OfReal &
	:param Poles:
	:type Poles: TColStd_Array1OfReal &
	:param WPoles:
	:type WPoles: TColStd_Array1OfReal &
	:rtype: void
") CoefficientsPoles;
		static void CoefficientsPoles (const Standard_Integer dim,const TColStd_Array1OfReal & Coefs,const TColStd_Array1OfReal & WCoefs,TColStd_Array1OfReal & Poles,TColStd_Array1OfReal & WPoles);
		%feature("compactdefaultargs") Trimming;
		%feature("autodoc", "	:param U1:
	:type U1: float
	:param U2:
	:type U2: float
	:param Coeffs:
	:type Coeffs: TColgp_Array1OfPnt
	:param WCoeffs:
	:type WCoeffs: TColStd_Array1OfReal &
	:rtype: void
") Trimming;
		static void Trimming (const Standard_Real U1,const Standard_Real U2,TColgp_Array1OfPnt & Coeffs,TColStd_Array1OfReal & WCoeffs);
		%feature("compactdefaultargs") Trimming;
		%feature("autodoc", "	:param U1:
	:type U1: float
	:param U2:
	:type U2: float
	:param Coeffs:
	:type Coeffs: TColgp_Array1OfPnt2d
	:param WCoeffs:
	:type WCoeffs: TColStd_Array1OfReal &
	:rtype: void
") Trimming;
		static void Trimming (const Standard_Real U1,const Standard_Real U2,TColgp_Array1OfPnt2d & Coeffs,TColStd_Array1OfReal & WCoeffs);
		%feature("compactdefaultargs") Trimming;
		%feature("autodoc", "	:param U1:
	:type U1: float
	:param U2:
	:type U2: float
	:param Coeffs:
	:type Coeffs: TColStd_Array1OfReal &
	:param WCoeffs:
	:type WCoeffs: TColStd_Array1OfReal &
	:rtype: void
") Trimming;
		static void Trimming (const Standard_Real U1,const Standard_Real U2,TColStd_Array1OfReal & Coeffs,TColStd_Array1OfReal & WCoeffs);
		%feature("compactdefaultargs") Trimming;
		%feature("autodoc", "	:param U1:
	:type U1: float
	:param U2:
	:type U2: float
	:param dim:
	:type dim: int
	:param Coeffs:
	:type Coeffs: TColStd_Array1OfReal &
	:param WCoeffs:
	:type WCoeffs: TColStd_Array1OfReal &
	:rtype: void
") Trimming;
		static void Trimming (const Standard_Real U1,const Standard_Real U2,const Standard_Integer dim,TColStd_Array1OfReal & Coeffs,TColStd_Array1OfReal & WCoeffs);
		%feature("compactdefaultargs") CoefficientsPoles;
		%feature("autodoc", "	:param Coefs:
	:type Coefs: TColgp_Array2OfPnt
	:param WCoefs:
	:type WCoefs: TColStd_Array2OfReal &
	:param Poles:
	:type Poles: TColgp_Array2OfPnt
	:param WPoles:
	:type WPoles: TColStd_Array2OfReal &
	:rtype: void
") CoefficientsPoles;
		static void CoefficientsPoles (const TColgp_Array2OfPnt & Coefs,const TColStd_Array2OfReal & WCoefs,TColgp_Array2OfPnt & Poles,TColStd_Array2OfReal & WPoles);
		%feature("compactdefaultargs") UTrimming;
		%feature("autodoc", "	:param U1:
	:type U1: float
	:param U2:
	:type U2: float
	:param Coeffs:
	:type Coeffs: TColgp_Array2OfPnt
	:param WCoeffs:
	:type WCoeffs: TColStd_Array2OfReal &
	:rtype: void
") UTrimming;
		static void UTrimming (const Standard_Real U1,const Standard_Real U2,TColgp_Array2OfPnt & Coeffs,TColStd_Array2OfReal & WCoeffs);
		%feature("compactdefaultargs") VTrimming;
		%feature("autodoc", "	:param V1:
	:type V1: float
	:param V2:
	:type V2: float
	:param Coeffs:
	:type Coeffs: TColgp_Array2OfPnt
	:param WCoeffs:
	:type WCoeffs: TColStd_Array2OfReal &
	:rtype: void
") VTrimming;
		static void VTrimming (const Standard_Real V1,const Standard_Real V2,TColgp_Array2OfPnt & Coeffs,TColStd_Array2OfReal & WCoeffs);
		%feature("compactdefaultargs") HermiteInterpolate;
		%feature("autodoc", "	* Compute the coefficients in the canonical base of the polynomial satisfying the given constraints at the given parameters The array FirstContr(i,j) i=1,Dimension j=0,FirstOrder contains the values of the constraint at parameter FirstParameter idem for LastConstr

	:param Dimension:
	:type Dimension: int
	:param FirstParameter:
	:type FirstParameter: float
	:param LastParameter:
	:type LastParameter: float
	:param FirstOrder:
	:type FirstOrder: int
	:param LastOrder:
	:type LastOrder: int
	:param FirstConstr:
	:type FirstConstr: TColStd_Array2OfReal &
	:param LastConstr:
	:type LastConstr: TColStd_Array2OfReal &
	:param Coefficients:
	:type Coefficients: TColStd_Array1OfReal &
	:rtype: bool
") HermiteInterpolate;
		static Standard_Boolean HermiteInterpolate (const Standard_Integer Dimension,const Standard_Real FirstParameter,const Standard_Real LastParameter,const Standard_Integer FirstOrder,const Standard_Integer LastOrder,const TColStd_Array2OfReal & FirstConstr,const TColStd_Array2OfReal & LastConstr,TColStd_Array1OfReal & Coefficients);
		%feature("compactdefaultargs") JacobiParameters;
		%feature("autodoc", "	* Compute the number of points used for integral computations (NbGaussPoints) and the degree of Jacobi Polynomial (WorkDegree). ConstraintOrder has to be GeomAbs_C0, GeomAbs_C1 or GeomAbs_C2 Code: Code d' init. des parametres de discretisation. = -5 = -4 = -3 = -2 = -1 = 1 calcul rapide avec precision moyenne. = 2 calcul rapide avec meilleure precision. = 3 calcul un peu plus lent avec bonne precision. = 4 calcul lent avec la meilleure precision possible.

	:param ConstraintOrder:
	:type ConstraintOrder: GeomAbs_Shape
	:param MaxDegree:
	:type MaxDegree: int
	:param Code:
	:type Code: int
	:param NbGaussPoints:
	:type NbGaussPoints: int &
	:param WorkDegree:
	:type WorkDegree: int &
	:rtype: void
") JacobiParameters;
		static void JacobiParameters (const GeomAbs_Shape ConstraintOrder,const Standard_Integer MaxDegree,const Standard_Integer Code,Standard_Integer &OutValue,Standard_Integer &OutValue);
		%feature("compactdefaultargs") NivConstr;
		%feature("autodoc", "	* translates from GeomAbs_Shape to Integer

	:param ConstraintOrder:
	:type ConstraintOrder: GeomAbs_Shape
	:rtype: int
") NivConstr;
		static Standard_Integer NivConstr (const GeomAbs_Shape ConstraintOrder);
		%feature("compactdefaultargs") ConstraintOrder;
		%feature("autodoc", "	* translates from Integer to GeomAbs_Shape

	:param NivConstr:
	:type NivConstr: int
	:rtype: GeomAbs_Shape
") ConstraintOrder;
		static GeomAbs_Shape ConstraintOrder (const Standard_Integer NivConstr);
		%feature("compactdefaultargs") EvalLength;
		%feature("autodoc", "	:param Degree:
	:type Degree: int
	:param Dimension:
	:type Dimension: int
	:param PolynomialCoeff:
	:type PolynomialCoeff: float &
	:param U1:
	:type U1: float
	:param U2:
	:type U2: float
	:param Length:
	:type Length: float &
	:rtype: void
") EvalLength;
		static void EvalLength (const Standard_Integer Degree,const Standard_Integer Dimension,Standard_Real &OutValue,const Standard_Real U1,const Standard_Real U2,Standard_Real &OutValue);
		%feature("compactdefaultargs") EvalLength;
		%feature("autodoc", "	:param Degree:
	:type Degree: int
	:param Dimension:
	:type Dimension: int
	:param PolynomialCoeff:
	:type PolynomialCoeff: float &
	:param U1:
	:type U1: float
	:param U2:
	:type U2: float
	:param Tol:
	:type Tol: float
	:param Length:
	:type Length: float &
	:param Error:
	:type Error: float &
	:rtype: void
") EvalLength;
		static void EvalLength (const Standard_Integer Degree,const Standard_Integer Dimension,Standard_Real &OutValue,const Standard_Real U1,const Standard_Real U2,const Standard_Real Tol,Standard_Real &OutValue,Standard_Real &OutValue);
};


%extend PLib {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor PLib_Base;
class PLib_Base : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") ToCoefficients;
		%feature("autodoc", "	* Convert the polynomial P(t) in the canonical base.

	:param Dimension:
	:type Dimension: int
	:param Degree:
	:type Degree: int
	:param CoeffinBase:
	:type CoeffinBase: TColStd_Array1OfReal &
	:param Coefficients:
	:type Coefficients: TColStd_Array1OfReal &
	:rtype: void
") ToCoefficients;
		virtual void ToCoefficients (const Standard_Integer Dimension,const Standard_Integer Degree,const TColStd_Array1OfReal & CoeffinBase,TColStd_Array1OfReal & Coefficients);
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "	* Compute the values of the basis functions in u

	:param U:
	:type U: float
	:param BasisValue:
	:type BasisValue: TColStd_Array1OfReal &
	:rtype: void
") D0;
		virtual void D0 (const Standard_Real U,TColStd_Array1OfReal & BasisValue);
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "	* Compute the values and the derivatives values of the basis functions in u

	:param U:
	:type U: float
	:param BasisValue:
	:type BasisValue: TColStd_Array1OfReal &
	:param BasisD1:
	:type BasisD1: TColStd_Array1OfReal &
	:rtype: void
") D1;
		virtual void D1 (const Standard_Real U,TColStd_Array1OfReal & BasisValue,TColStd_Array1OfReal & BasisD1);
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "	* Compute the values and the derivatives values of the basis functions in u

	:param U:
	:type U: float
	:param BasisValue:
	:type BasisValue: TColStd_Array1OfReal &
	:param BasisD1:
	:type BasisD1: TColStd_Array1OfReal &
	:param BasisD2:
	:type BasisD2: TColStd_Array1OfReal &
	:rtype: void
") D2;
		virtual void D2 (const Standard_Real U,TColStd_Array1OfReal & BasisValue,TColStd_Array1OfReal & BasisD1,TColStd_Array1OfReal & BasisD2);
		%feature("compactdefaultargs") D3;
		%feature("autodoc", "	* Compute the values and the derivatives values of the basis functions in u

	:param U:
	:type U: float
	:param BasisValue:
	:type BasisValue: TColStd_Array1OfReal &
	:param BasisD1:
	:type BasisD1: TColStd_Array1OfReal &
	:param BasisD2:
	:type BasisD2: TColStd_Array1OfReal &
	:param BasisD3:
	:type BasisD3: TColStd_Array1OfReal &
	:rtype: void
") D3;
		virtual void D3 (const Standard_Real U,TColStd_Array1OfReal & BasisValue,TColStd_Array1OfReal & BasisD1,TColStd_Array1OfReal & BasisD2,TColStd_Array1OfReal & BasisD3);
		%feature("compactdefaultargs") WorkDegree;
		%feature("autodoc", "	* returns WorkDegree

	:rtype: int
") WorkDegree;
		virtual Standard_Integer WorkDegree ();
		%feature("compactdefaultargs") ReduceDegree;
		%feature("autodoc", "	* Compute NewDegree <= MaxDegree so that MaxError is lower than Tol. MaxError can be greater than Tol if it is not possible to find a NewDegree <= MaxDegree. In this case NewDegree = MaxDegree

	:param Dimension:
	:type Dimension: int
	:param MaxDegree:
	:type MaxDegree: int
	:param Tol:
	:type Tol: float
	:param BaseCoeff:
	:type BaseCoeff: float &
	:param NewDegree:
	:type NewDegree: int &
	:param MaxError:
	:type MaxError: float &
	:rtype: void
") ReduceDegree;
		virtual void ReduceDegree (const Standard_Integer Dimension,const Standard_Integer MaxDegree,const Standard_Real Tol,Standard_Real &OutValue,Standard_Integer &OutValue,Standard_Real &OutValue);
};


%extend PLib_Base {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_PLib_Base(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_PLib_Base::Handle_PLib_Base %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_PLib_Base;
class Handle_PLib_Base : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_PLib_Base();
        Handle_PLib_Base(const Handle_PLib_Base &aHandle);
        Handle_PLib_Base(const PLib_Base *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_PLib_Base DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_PLib_Base {
    PLib_Base* _get_reference() {
    return (PLib_Base*)$self->Access();
    }
};

%extend Handle_PLib_Base {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend PLib_Base {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor PLib_DoubleJacobiPolynomial;
class PLib_DoubleJacobiPolynomial {
	public:
		%feature("compactdefaultargs") PLib_DoubleJacobiPolynomial;
		%feature("autodoc", "	:rtype: None
") PLib_DoubleJacobiPolynomial;
		 PLib_DoubleJacobiPolynomial ();
		%feature("compactdefaultargs") PLib_DoubleJacobiPolynomial;
		%feature("autodoc", "	:param JacPolU:
	:type JacPolU: Handle_PLib_JacobiPolynomial &
	:param JacPolV:
	:type JacPolV: Handle_PLib_JacobiPolynomial &
	:rtype: None
") PLib_DoubleJacobiPolynomial;
		 PLib_DoubleJacobiPolynomial (const Handle_PLib_JacobiPolynomial & JacPolU,const Handle_PLib_JacobiPolynomial & JacPolV);
		%feature("compactdefaultargs") MaxErrorU;
		%feature("autodoc", "	:param Dimension:
	:type Dimension: int
	:param DegreeU:
	:type DegreeU: int
	:param DegreeV:
	:type DegreeV: int
	:param dJacCoeff:
	:type dJacCoeff: int
	:param JacCoeff:
	:type JacCoeff: TColStd_Array1OfReal &
	:rtype: float
") MaxErrorU;
		Standard_Real MaxErrorU (const Standard_Integer Dimension,const Standard_Integer DegreeU,const Standard_Integer DegreeV,const Standard_Integer dJacCoeff,const TColStd_Array1OfReal & JacCoeff);
		%feature("compactdefaultargs") MaxErrorV;
		%feature("autodoc", "	:param Dimension:
	:type Dimension: int
	:param DegreeU:
	:type DegreeU: int
	:param DegreeV:
	:type DegreeV: int
	:param dJacCoeff:
	:type dJacCoeff: int
	:param JacCoeff:
	:type JacCoeff: TColStd_Array1OfReal &
	:rtype: float
") MaxErrorV;
		Standard_Real MaxErrorV (const Standard_Integer Dimension,const Standard_Integer DegreeU,const Standard_Integer DegreeV,const Standard_Integer dJacCoeff,const TColStd_Array1OfReal & JacCoeff);
		%feature("compactdefaultargs") MaxError;
		%feature("autodoc", "	:param Dimension:
	:type Dimension: int
	:param MinDegreeU:
	:type MinDegreeU: int
	:param MaxDegreeU:
	:type MaxDegreeU: int
	:param MinDegreeV:
	:type MinDegreeV: int
	:param MaxDegreeV:
	:type MaxDegreeV: int
	:param dJacCoeff:
	:type dJacCoeff: int
	:param JacCoeff:
	:type JacCoeff: TColStd_Array1OfReal &
	:param Error:
	:type Error: float
	:rtype: float
") MaxError;
		Standard_Real MaxError (const Standard_Integer Dimension,const Standard_Integer MinDegreeU,const Standard_Integer MaxDegreeU,const Standard_Integer MinDegreeV,const Standard_Integer MaxDegreeV,const Standard_Integer dJacCoeff,const TColStd_Array1OfReal & JacCoeff,const Standard_Real Error);
		%feature("compactdefaultargs") ReduceDegree;
		%feature("autodoc", "	:param Dimension:
	:type Dimension: int
	:param MinDegreeU:
	:type MinDegreeU: int
	:param MaxDegreeU:
	:type MaxDegreeU: int
	:param MinDegreeV:
	:type MinDegreeV: int
	:param MaxDegreeV:
	:type MaxDegreeV: int
	:param dJacCoeff:
	:type dJacCoeff: int
	:param JacCoeff:
	:type JacCoeff: TColStd_Array1OfReal &
	:param EpmsCut:
	:type EpmsCut: float
	:param MaxError:
	:type MaxError: float &
	:param NewDegreeU:
	:type NewDegreeU: int &
	:param NewDegreeV:
	:type NewDegreeV: int &
	:rtype: None
") ReduceDegree;
		void ReduceDegree (const Standard_Integer Dimension,const Standard_Integer MinDegreeU,const Standard_Integer MaxDegreeU,const Standard_Integer MinDegreeV,const Standard_Integer MaxDegreeV,const Standard_Integer dJacCoeff,const TColStd_Array1OfReal & JacCoeff,const Standard_Real EpmsCut,Standard_Real &OutValue,Standard_Integer &OutValue,Standard_Integer &OutValue);
		%feature("compactdefaultargs") AverageError;
		%feature("autodoc", "	:param Dimension:
	:type Dimension: int
	:param DegreeU:
	:type DegreeU: int
	:param DegreeV:
	:type DegreeV: int
	:param dJacCoeff:
	:type dJacCoeff: int
	:param JacCoeff:
	:type JacCoeff: TColStd_Array1OfReal &
	:rtype: float
") AverageError;
		Standard_Real AverageError (const Standard_Integer Dimension,const Standard_Integer DegreeU,const Standard_Integer DegreeV,const Standard_Integer dJacCoeff,const TColStd_Array1OfReal & JacCoeff);
		%feature("compactdefaultargs") WDoubleJacobiToCoefficients;
		%feature("autodoc", "	:param Dimension:
	:type Dimension: int
	:param DegreeU:
	:type DegreeU: int
	:param DegreeV:
	:type DegreeV: int
	:param JacCoeff:
	:type JacCoeff: TColStd_Array1OfReal &
	:param Coefficients:
	:type Coefficients: TColStd_Array1OfReal &
	:rtype: None
") WDoubleJacobiToCoefficients;
		void WDoubleJacobiToCoefficients (const Standard_Integer Dimension,const Standard_Integer DegreeU,const Standard_Integer DegreeV,const TColStd_Array1OfReal & JacCoeff,TColStd_Array1OfReal & Coefficients);
		%feature("compactdefaultargs") U;
		%feature("autodoc", "	* returns myJacPolU;

	:rtype: Handle_PLib_JacobiPolynomial
") U;
		Handle_PLib_JacobiPolynomial U ();
		%feature("compactdefaultargs") V;
		%feature("autodoc", "	* returns myJacPolV;

	:rtype: Handle_PLib_JacobiPolynomial
") V;
		Handle_PLib_JacobiPolynomial V ();
		%feature("compactdefaultargs") TabMaxU;
		%feature("autodoc", "	* returns myTabMaxU;

	:rtype: Handle_TColStd_HArray1OfReal
") TabMaxU;
		Handle_TColStd_HArray1OfReal TabMaxU ();
		%feature("compactdefaultargs") TabMaxV;
		%feature("autodoc", "	* returns myTabMaxV;

	:rtype: Handle_TColStd_HArray1OfReal
") TabMaxV;
		Handle_TColStd_HArray1OfReal TabMaxV ();
};


%extend PLib_DoubleJacobiPolynomial {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor PLib_HermitJacobi;
class PLib_HermitJacobi : public PLib_Base {
	public:
		%feature("compactdefaultargs") PLib_HermitJacobi;
		%feature("autodoc", "	* Initialize the polynomial class Degree has to be <= 30 ConstraintOrder has to be GeomAbs_C0 GeomAbs_C1 GeomAbs_C2

	:param WorkDegree:
	:type WorkDegree: int
	:param ConstraintOrder:
	:type ConstraintOrder: GeomAbs_Shape
	:rtype: None
") PLib_HermitJacobi;
		 PLib_HermitJacobi (const Standard_Integer WorkDegree,const GeomAbs_Shape ConstraintOrder);
		%feature("compactdefaultargs") MaxError;
		%feature("autodoc", "	* This method computes the maximum error on the polynomial W(t) Q(t) obtained by missing the coefficients of JacCoeff from NewDegree +1 to Degree

	:param Dimension:
	:type Dimension: int
	:param HermJacCoeff:
	:type HermJacCoeff: float &
	:param NewDegree:
	:type NewDegree: int
	:rtype: float
") MaxError;
		Standard_Real MaxError (const Standard_Integer Dimension,Standard_Real &OutValue,const Standard_Integer NewDegree);
		%feature("compactdefaultargs") ReduceDegree;
		%feature("autodoc", "	* Compute NewDegree <= MaxDegree so that MaxError is lower than Tol. MaxError can be greater than Tol if it is not possible to find a NewDegree <= MaxDegree. In this case NewDegree = MaxDegree

	:param Dimension:
	:type Dimension: int
	:param MaxDegree:
	:type MaxDegree: int
	:param Tol:
	:type Tol: float
	:param HermJacCoeff:
	:type HermJacCoeff: float &
	:param NewDegree:
	:type NewDegree: int &
	:param MaxError:
	:type MaxError: float &
	:rtype: None
") ReduceDegree;
		void ReduceDegree (const Standard_Integer Dimension,const Standard_Integer MaxDegree,const Standard_Real Tol,Standard_Real &OutValue,Standard_Integer &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") AverageError;
		%feature("autodoc", "	:param Dimension:
	:type Dimension: int
	:param HermJacCoeff:
	:type HermJacCoeff: float &
	:param NewDegree:
	:type NewDegree: int
	:rtype: float
") AverageError;
		Standard_Real AverageError (const Standard_Integer Dimension,Standard_Real &OutValue,const Standard_Integer NewDegree);
		%feature("compactdefaultargs") ToCoefficients;
		%feature("autodoc", "	* Convert the polynomial P(t) = H(t) + W(t) Q(t) in the canonical base.

	:param Dimension:
	:type Dimension: int
	:param Degree:
	:type Degree: int
	:param HermJacCoeff:
	:type HermJacCoeff: TColStd_Array1OfReal &
	:param Coefficients:
	:type Coefficients: TColStd_Array1OfReal &
	:rtype: None
") ToCoefficients;
		void ToCoefficients (const Standard_Integer Dimension,const Standard_Integer Degree,const TColStd_Array1OfReal & HermJacCoeff,TColStd_Array1OfReal & Coefficients);
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "	* Compute the values of the basis functions in u

	:param U:
	:type U: float
	:param BasisValue:
	:type BasisValue: TColStd_Array1OfReal &
	:rtype: None
") D0;
		void D0 (const Standard_Real U,TColStd_Array1OfReal & BasisValue);
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "	* Compute the values and the derivatives values of the basis functions in u

	:param U:
	:type U: float
	:param BasisValue:
	:type BasisValue: TColStd_Array1OfReal &
	:param BasisD1:
	:type BasisD1: TColStd_Array1OfReal &
	:rtype: None
") D1;
		void D1 (const Standard_Real U,TColStd_Array1OfReal & BasisValue,TColStd_Array1OfReal & BasisD1);
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "	* Compute the values and the derivatives values of the basis functions in u

	:param U:
	:type U: float
	:param BasisValue:
	:type BasisValue: TColStd_Array1OfReal &
	:param BasisD1:
	:type BasisD1: TColStd_Array1OfReal &
	:param BasisD2:
	:type BasisD2: TColStd_Array1OfReal &
	:rtype: None
") D2;
		void D2 (const Standard_Real U,TColStd_Array1OfReal & BasisValue,TColStd_Array1OfReal & BasisD1,TColStd_Array1OfReal & BasisD2);
		%feature("compactdefaultargs") D3;
		%feature("autodoc", "	* Compute the values and the derivatives values of the basis functions in u

	:param U:
	:type U: float
	:param BasisValue:
	:type BasisValue: TColStd_Array1OfReal &
	:param BasisD1:
	:type BasisD1: TColStd_Array1OfReal &
	:param BasisD2:
	:type BasisD2: TColStd_Array1OfReal &
	:param BasisD3:
	:type BasisD3: TColStd_Array1OfReal &
	:rtype: None
") D3;
		void D3 (const Standard_Real U,TColStd_Array1OfReal & BasisValue,TColStd_Array1OfReal & BasisD1,TColStd_Array1OfReal & BasisD2,TColStd_Array1OfReal & BasisD3);
		%feature("compactdefaultargs") WorkDegree;
		%feature("autodoc", "	* returns WorkDegree

	:rtype: int
") WorkDegree;
		Standard_Integer WorkDegree ();
		%feature("compactdefaultargs") NivConstr;
		%feature("autodoc", "	* returns NivConstr

	:rtype: int
") NivConstr;
		Standard_Integer NivConstr ();
};


%extend PLib_HermitJacobi {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_PLib_HermitJacobi(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_PLib_HermitJacobi::Handle_PLib_HermitJacobi %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_PLib_HermitJacobi;
class Handle_PLib_HermitJacobi : public Handle_PLib_Base {

    public:
        // constructors
        Handle_PLib_HermitJacobi();
        Handle_PLib_HermitJacobi(const Handle_PLib_HermitJacobi &aHandle);
        Handle_PLib_HermitJacobi(const PLib_HermitJacobi *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_PLib_HermitJacobi DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_PLib_HermitJacobi {
    PLib_HermitJacobi* _get_reference() {
    return (PLib_HermitJacobi*)$self->Access();
    }
};

%extend Handle_PLib_HermitJacobi {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend PLib_HermitJacobi {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor PLib_JacobiPolynomial;
class PLib_JacobiPolynomial : public PLib_Base {
	public:
		%feature("compactdefaultargs") PLib_JacobiPolynomial;
		%feature("autodoc", "	* Initialize the polynomial class Degree has to be <= 30 ConstraintOrder has to be GeomAbs_C0 GeomAbs_C1 GeomAbs_C2

	:param WorkDegree:
	:type WorkDegree: int
	:param ConstraintOrder:
	:type ConstraintOrder: GeomAbs_Shape
	:rtype: None
") PLib_JacobiPolynomial;
		 PLib_JacobiPolynomial (const Standard_Integer WorkDegree,const GeomAbs_Shape ConstraintOrder);
		%feature("compactdefaultargs") Points;
		%feature("autodoc", "	* returns the Jacobi Points for Gauss integration ie the positive values of the Legendre roots by increasing values NbGaussPoints is the number of points choosen for the integral computation. TabPoints (0,NbGaussPoints/2) TabPoints (0) is loaded only for the odd values of NbGaussPoints The possible values for NbGaussPoints are : 8, 10, 15, 20, 25, 30, 35, 40, 50, 61 NbGaussPoints must be greater than Degree

	:param NbGaussPoints:
	:type NbGaussPoints: int
	:param TabPoints:
	:type TabPoints: TColStd_Array1OfReal &
	:rtype: None
") Points;
		void Points (const Standard_Integer NbGaussPoints,TColStd_Array1OfReal & TabPoints);
		%feature("compactdefaultargs") Weights;
		%feature("autodoc", "	* returns the Jacobi weigths for Gauss integration only for the positive values of the Legendre roots in the order they are given by the method Points NbGaussPoints is the number of points choosen for the integral computation. TabWeights (0,NbGaussPoints/2,0,Degree) TabWeights (0,.) are only loaded for the odd values of NbGaussPoints The possible values for NbGaussPoints are : 8 , 10 , 15 ,20 ,25 , 30, 35 , 40 , 50 , 61 NbGaussPoints must be greater than Degree

	:param NbGaussPoints:
	:type NbGaussPoints: int
	:param TabWeights:
	:type TabWeights: TColStd_Array2OfReal &
	:rtype: None
") Weights;
		void Weights (const Standard_Integer NbGaussPoints,TColStd_Array2OfReal & TabWeights);
		%feature("compactdefaultargs") MaxValue;
		%feature("autodoc", "	* this method loads for k=0,q the maximum value of abs ( W(t)*Jk(t) )for t bellonging to [-1,1] This values are loaded is the array TabMax(0,myWorkDegree-2*(myNivConst+1)) MaxValue ( me ; TabMaxPointer : in out Real );

	:param TabMax:
	:type TabMax: TColStd_Array1OfReal &
	:rtype: None
") MaxValue;
		void MaxValue (TColStd_Array1OfReal & TabMax);
		%feature("compactdefaultargs") MaxError;
		%feature("autodoc", "	* This method computes the maximum error on the polynomial W(t) Q(t) obtained by missing the coefficients of JacCoeff from NewDegree +1 to Degree

	:param Dimension:
	:type Dimension: int
	:param JacCoeff:
	:type JacCoeff: float &
	:param NewDegree:
	:type NewDegree: int
	:rtype: float
") MaxError;
		Standard_Real MaxError (const Standard_Integer Dimension,Standard_Real &OutValue,const Standard_Integer NewDegree);
		%feature("compactdefaultargs") ReduceDegree;
		%feature("autodoc", "	* Compute NewDegree <= MaxDegree so that MaxError is lower than Tol. MaxError can be greater than Tol if it is not possible to find a NewDegree <= MaxDegree. In this case NewDegree = MaxDegree

	:param Dimension:
	:type Dimension: int
	:param MaxDegree:
	:type MaxDegree: int
	:param Tol:
	:type Tol: float
	:param JacCoeff:
	:type JacCoeff: float &
	:param NewDegree:
	:type NewDegree: int &
	:param MaxError:
	:type MaxError: float &
	:rtype: None
") ReduceDegree;
		void ReduceDegree (const Standard_Integer Dimension,const Standard_Integer MaxDegree,const Standard_Real Tol,Standard_Real &OutValue,Standard_Integer &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") AverageError;
		%feature("autodoc", "	:param Dimension:
	:type Dimension: int
	:param JacCoeff:
	:type JacCoeff: float &
	:param NewDegree:
	:type NewDegree: int
	:rtype: float
") AverageError;
		Standard_Real AverageError (const Standard_Integer Dimension,Standard_Real &OutValue,const Standard_Integer NewDegree);
		%feature("compactdefaultargs") ToCoefficients;
		%feature("autodoc", "	* Convert the polynomial P(t) = R(t) + W(t) Q(t) in the canonical base.

	:param Dimension:
	:type Dimension: int
	:param Degree:
	:type Degree: int
	:param JacCoeff:
	:type JacCoeff: TColStd_Array1OfReal &
	:param Coefficients:
	:type Coefficients: TColStd_Array1OfReal &
	:rtype: None
") ToCoefficients;
		void ToCoefficients (const Standard_Integer Dimension,const Standard_Integer Degree,const TColStd_Array1OfReal & JacCoeff,TColStd_Array1OfReal & Coefficients);
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "	* Compute the values of the basis functions in u

	:param U:
	:type U: float
	:param BasisValue:
	:type BasisValue: TColStd_Array1OfReal &
	:rtype: None
") D0;
		void D0 (const Standard_Real U,TColStd_Array1OfReal & BasisValue);
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "	* Compute the values and the derivatives values of the basis functions in u

	:param U:
	:type U: float
	:param BasisValue:
	:type BasisValue: TColStd_Array1OfReal &
	:param BasisD1:
	:type BasisD1: TColStd_Array1OfReal &
	:rtype: None
") D1;
		void D1 (const Standard_Real U,TColStd_Array1OfReal & BasisValue,TColStd_Array1OfReal & BasisD1);
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "	* Compute the values and the derivatives values of the basis functions in u

	:param U:
	:type U: float
	:param BasisValue:
	:type BasisValue: TColStd_Array1OfReal &
	:param BasisD1:
	:type BasisD1: TColStd_Array1OfReal &
	:param BasisD2:
	:type BasisD2: TColStd_Array1OfReal &
	:rtype: None
") D2;
		void D2 (const Standard_Real U,TColStd_Array1OfReal & BasisValue,TColStd_Array1OfReal & BasisD1,TColStd_Array1OfReal & BasisD2);
		%feature("compactdefaultargs") D3;
		%feature("autodoc", "	* Compute the values and the derivatives values of the basis functions in u

	:param U:
	:type U: float
	:param BasisValue:
	:type BasisValue: TColStd_Array1OfReal &
	:param BasisD1:
	:type BasisD1: TColStd_Array1OfReal &
	:param BasisD2:
	:type BasisD2: TColStd_Array1OfReal &
	:param BasisD3:
	:type BasisD3: TColStd_Array1OfReal &
	:rtype: None
") D3;
		void D3 (const Standard_Real U,TColStd_Array1OfReal & BasisValue,TColStd_Array1OfReal & BasisD1,TColStd_Array1OfReal & BasisD2,TColStd_Array1OfReal & BasisD3);
		%feature("compactdefaultargs") WorkDegree;
		%feature("autodoc", "	* returns WorkDegree

	:rtype: int
") WorkDegree;
		Standard_Integer WorkDegree ();
		%feature("compactdefaultargs") NivConstr;
		%feature("autodoc", "	* returns NivConstr

	:rtype: int
") NivConstr;
		Standard_Integer NivConstr ();
};


%extend PLib_JacobiPolynomial {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_PLib_JacobiPolynomial(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_PLib_JacobiPolynomial::Handle_PLib_JacobiPolynomial %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_PLib_JacobiPolynomial;
class Handle_PLib_JacobiPolynomial : public Handle_PLib_Base {

    public:
        // constructors
        Handle_PLib_JacobiPolynomial();
        Handle_PLib_JacobiPolynomial(const Handle_PLib_JacobiPolynomial &aHandle);
        Handle_PLib_JacobiPolynomial(const PLib_JacobiPolynomial *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_PLib_JacobiPolynomial DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_PLib_JacobiPolynomial {
    PLib_JacobiPolynomial* _get_reference() {
    return (PLib_JacobiPolynomial*)$self->Access();
    }
};

%extend Handle_PLib_JacobiPolynomial {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend PLib_JacobiPolynomial {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
