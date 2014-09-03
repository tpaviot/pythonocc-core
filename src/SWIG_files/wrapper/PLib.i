/*
Copyright 2008-2014 Thomas Paviot (tpaviot@gmail.com)


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
%include ../common/StandardDefines.i
%include ../common/ExceptionCatcher.i
%include ../common/FunctionTransformers.i
%include ../common/Operators.i

%include PLib_headers.i

/* typedefs */
/* end typedefs declaration */

/* public enums */
/* end public enums declaration */

%rename(plib) PLib;
%nodefaultctor PLib;
class PLib {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	static TColStd_Array1OfReal

Used as argument for a non rational functions") NoWeights;
		static TColStd_Array1OfReal & NoWeights ();
		%feature("autodoc", "Args:
	None
Returns:
	static TColStd_Array2OfReal

Used as argument for a non rational functions") NoWeights2;
		static TColStd_Array2OfReal & NoWeights2 ();
		%feature("autodoc", "Args:
	Poles(TColgp_Array1OfPnt)
	FP(TColStd_Array1OfReal)

Returns:
	static void

Copy in FP the coordinates of the poles.") SetPoles;
		static void SetPoles (const TColgp_Array1OfPnt & Poles,TColStd_Array1OfReal & FP);
		%feature("autodoc", "Args:
	Poles(TColgp_Array1OfPnt)
	Weights(TColStd_Array1OfReal)
	FP(TColStd_Array1OfReal)

Returns:
	static void

Copy in FP the coordinates of the poles.") SetPoles;
		static void SetPoles (const TColgp_Array1OfPnt & Poles,const TColStd_Array1OfReal & Weights,TColStd_Array1OfReal & FP);
		%feature("autodoc", "Args:
	FP(TColStd_Array1OfReal)
	Poles(TColgp_Array1OfPnt)

Returns:
	static void

Get from FP the coordinates of the poles.") GetPoles;
		static void GetPoles (const TColStd_Array1OfReal & FP,TColgp_Array1OfPnt & Poles);
		%feature("autodoc", "Args:
	FP(TColStd_Array1OfReal)
	Poles(TColgp_Array1OfPnt)
	Weights(TColStd_Array1OfReal)

Returns:
	static void

Get from FP the coordinates of the poles.") GetPoles;
		static void GetPoles (const TColStd_Array1OfReal & FP,TColgp_Array1OfPnt & Poles,TColStd_Array1OfReal & Weights);
		%feature("autodoc", "Args:
	Poles(TColgp_Array1OfPnt2d)
	FP(TColStd_Array1OfReal)

Returns:
	static void

Copy in FP the coordinates of the poles.") SetPoles;
		static void SetPoles (const TColgp_Array1OfPnt2d & Poles,TColStd_Array1OfReal & FP);
		%feature("autodoc", "Args:
	Poles(TColgp_Array1OfPnt2d)
	Weights(TColStd_Array1OfReal)
	FP(TColStd_Array1OfReal)

Returns:
	static void

Copy in FP the coordinates of the poles.") SetPoles;
		static void SetPoles (const TColgp_Array1OfPnt2d & Poles,const TColStd_Array1OfReal & Weights,TColStd_Array1OfReal & FP);
		%feature("autodoc", "Args:
	FP(TColStd_Array1OfReal)
	Poles(TColgp_Array1OfPnt2d)

Returns:
	static void

Get from FP the coordinates of the poles.") GetPoles;
		static void GetPoles (const TColStd_Array1OfReal & FP,TColgp_Array1OfPnt2d & Poles);
		%feature("autodoc", "Args:
	FP(TColStd_Array1OfReal)
	Poles(TColgp_Array1OfPnt2d)
	Weights(TColStd_Array1OfReal)

Returns:
	static void

Get from FP the coordinates of the poles.") GetPoles;
		static void GetPoles (const TColStd_Array1OfReal & FP,TColgp_Array1OfPnt2d & Poles,TColStd_Array1OfReal & Weights);
		%feature("autodoc", "Args:
	N(Standard_Integer)
	P(Standard_Integer)

Returns:
	static Standard_Real

Returns the Binomial Cnp. N should be <= BSplCLib::MaxDegree().") Bin;
		static Standard_Real Bin (const Standard_Integer N,const Standard_Integer P);
		%feature("autodoc", "Args:
	Degree(Standard_Integer)
	N(Standard_Integer)
	Dimension(Standard_Integer)
	Ders(Standard_Real)
	RDers(Standard_Real)
	All(Standard_Boolean)=Standard_True

Returns:
	static void

Computes the derivatives of a ratio at order  
         <N> in dimension <Dimension>.  
 
         <Ders> is an  array containing the  values  of the  
         input   derivatives from  0 to  Min(<N>,<Degree>).  
         For   orders   higher  than <Degree>    the  inputcd /s2d1/BMDL/  
         derivatives   are assumed to be  0.  
 
         Content of <Ders> :  
 
         x(1),x(2),...,x(Dimension),w  
         x'(1),x'(2),...,x'(Dimension),w'  
         x''(1),x''(2),...,x''(Dimension),w''  
 
         If  <All> is false, only the   derivative at order  
         <N> is computed.  <RDers>  is an array   of length  
         Dimension which will contain the result :  
 
         x(1)/w , x(2)/w ,  ... derivated <N> times  
 
         If <All> is  true all the  derivatives up to order  
         <N> are computed.   <RDers> is an array of  length  
         Dimension * (N+1) which will contains :  
 
         x(1)/w , x(2)/w ,  ...  
         x(1)/w , x(2)/w ,  ... derivated <1> times  
         x(1)/w , x(2)/w ,  ... derivated <2> times  
         ...  
         x(1)/w , x(2)/w ,  ... derivated <N> times  
 
 Warning: <RDers> must be dimensionned properly.") RationalDerivative;
		static void RationalDerivative (const Standard_Integer Degree,const Standard_Integer N,const Standard_Integer Dimension,Standard_Real &OutValue,Standard_Real &OutValue,const Standard_Boolean All = Standard_True);
		%feature("autodoc", "Args:
	DerivativesRequest(Standard_Integer)
	Dimension(Standard_Integer)
	PolesDerivatives(Standard_Real)
	WeightsDerivatives(Standard_Real)
	RationalDerivates(Standard_Real)

Returns:
	static void

Computes DerivativesRequest derivatives of a ratio at  
         of a BSpline function of degree <Degree>  
         dimension <Dimension>.  
 
         <PolesDerivatives> is an  array containing the  values  
         of the input   derivatives from  0 to  <DerivativeRequest>  
         For   orders   higher  than <Degree>    the  input  
         derivatives   are assumed to be  0.  
 
         Content of <PoleasDerivatives> :  
 
         x(1),x(2),...,x(Dimension)  
         x'(1),x'(2),...,x'(Dimension)  
         x''(1),x''(2),...,x''(Dimension)  
 
 
         WeightsDerivatives is an array that contains derivatives  
         from 0 to  <DerivativeRequest>  
         After returning from the routine the array  
         RationalDerivatives contains the following  
         x(1)/w , x(2)/w ,  ...  
         x(1)/w , x(2)/w ,  ...   derivated once  
         x(1)/w , x(2)/w ,  ...   twice  
         x(1)/w , x(2)/w ,  ... derivated <DerivativeRequest> times  
 
         The array RationalDerivatives and PolesDerivatives  
         can be same since the overwrite is non destructive within  
         the algorithm  
 
 Warning: <RationalDerivates> must be dimensionned properly.") RationalDerivatives;
		static void RationalDerivatives (const Standard_Integer DerivativesRequest,const Standard_Integer Dimension,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	U(Standard_Real)
	DerivativeOrder(Standard_Integer)
	Degree(Standard_Integer)
	Dimension(Standard_Integer)
	PolynomialCoeff(Standard_Real)
	Results(Standard_Real)

Returns:
	static void

Performs Horner method with synthethic division  
         for derivatives  
         parameter <U>, with <Degree> and <Dimension>.  
         PolynomialCoeff are stored in the following fashion  
         c0(1)      c0(2) ....       c0(Dimension)  
         c1(1)      c1(2) ....       c1(Dimension)  
 
 
         cDegree(1) cDegree(2) ....  cDegree(Dimension)  
         where the polynomial is defined as :  
 
                         2                     Degree  
         c0 + c1 X + c2 X  +  ....   cDegree X  
 
         Results stores the result in the following format  
 
         f(1)             f(2)  ....     f(Dimension)  
          (1)           (1)              (1)  
         f  (1)        f   (2) ....     f   (Dimension)  
 
          (DerivativeRequest)            (DerivativeRequest)  
         f  (1)                         f   (Dimension)  
 
         this just evaluates the point at parameter U  
 
 Warning: <Results> and <PolynomialCoeff> must be dimensioned properly") EvalPolynomial;
		static void EvalPolynomial (const Standard_Real U,const Standard_Integer DerivativeOrder,const Standard_Integer Degree,const Standard_Integer Dimension,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	U(Standard_Real)
	Degree(Standard_Integer)
	Dimension(Standard_Integer)
	DegreeDimension(Standard_Integer)
	PolynomialCoeff(Standard_Real)
	Results(Standard_Real)

Returns:
	static void

Same as above with DerivativeOrder = 0;") NoDerivativeEvalPolynomial;
		static void NoDerivativeEvalPolynomial (const Standard_Real U,const Standard_Integer Degree,const Standard_Integer Dimension,const Standard_Integer DegreeDimension,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	U(Standard_Real)
	V(Standard_Real)
	UDerivativeOrder(Standard_Integer)
	VDerivativeOrder(Standard_Integer)
	UDegree(Standard_Integer)
	VDegree(Standard_Integer)
	Dimension(Standard_Integer)
	PolynomialCoeff(Standard_Real)
	Results(Standard_Real)

Returns:
	static void

Applies EvalPolynomial twice to evaluate the derivative  
         of orders UDerivativeOrder in U, VDerivativeOrder in V  
         at parameters U,V  
 
 
         PolynomialCoeff are stored in the following fashion  
         c00(1)  ....       c00(Dimension)  
         c10(1)  ....       c10(Dimension)  
         ....  
         cm0(1)  ....       cm0(Dimension)  
         ....  
         c01(1)  ....       c01(Dimension)  
         c11(1)  ....       c11(Dimension)  
         ....  
         cm1(1)  ....       cm1(Dimension)  
         ....  
         c0n(1)  ....       c0n(Dimension)  
         c1n(1)  ....       c1n(Dimension)  
         ....  
         cmn(1)  ....       cmn(Dimension)  
 
 
         where the polynomial is defined as :  
                            2                 m  
         c00 + c10 U + c20 U  +  ....  + cm0 U  
                                 2                   m  
         + c01 V + c11 UV + c21 U V  +  ....  + cm1 U  V  
                        n               m n  
         + .... + c0n V +  ....  + cmn U V  
 
         with m = UDegree and n = VDegree  
 
         Results stores the result in the following format  
 
         f(1)             f(2)  ....     f(Dimension)  
 
 Warning: <Results> and <PolynomialCoeff> must be dimensioned properly") EvalPoly2Var;
		static void EvalPoly2Var (const Standard_Real U,const Standard_Real V,const Standard_Integer UDerivativeOrder,const Standard_Integer VDerivativeOrder,const Standard_Integer UDegree,const Standard_Integer VDegree,const Standard_Integer Dimension,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	U(Standard_Real)
	DerivativeOrder(Standard_Integer)
	Degree(Standard_Integer)
	Dimension(Standard_Integer)
	ValueArray(Standard_Real)
	ParameterArray(Standard_Real)
	Results(Standard_Real)

Returns:
	static Standard_Integer

Performs the Lagrange Interpolation of  
         given series of points with given parameters  
         with the requested derivative order  
         Results will store things in the following format  
         with d = DerivativeOrder  
 
[0],             [Dimension-1]              : value  
[Dimension],     [Dimension  + Dimension-1] : first derivative  
 
[d *Dimension],  [d*Dimension + Dimension-1]: dth   derivative") EvalLagrange;
		static Standard_Integer EvalLagrange (const Standard_Real U,const Standard_Integer DerivativeOrder,const Standard_Integer Degree,const Standard_Integer Dimension,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	U(Standard_Real)
	DerivativeOrder(Standard_Integer)
	Dimension(Standard_Integer)
	ValueArray(Standard_Real)
	DerivativeArray(Standard_Real)
	ParameterArray(Standard_Real)
	Results(Standard_Real)

Returns:
	static Standard_Integer

Performs the Cubic Hermite Interpolation of  
         given series of points with given parameters  
         with the requested derivative order.  
         ValueArray stores the value at the first and  
         last parameter. It has the following format :  
[0],             [Dimension-1]              : value at first param  
[Dimension],     [Dimension  + Dimension-1] : value at last param  
          Derivative array stores the value of the derivatives  
          at the first parameter and at the last parameter  
          in the following format  
[0],             [Dimension-1]              : derivative at  
                                              first param  
[Dimension],     [Dimension  + Dimension-1] : derivative at  
                                              last param  
 
         ParameterArray  stores the first and last parameter  
         in the following format :  
         [0] : first parameter  
         [1] : last  parameter  
 
         Results will store things in the following format  
         with d = DerivativeOrder  
 
[0],             [Dimension-1]              : value  
[Dimension],     [Dimension  + Dimension-1] : first derivative  
 
[d *Dimension],  [d*Dimension + Dimension-1]: dth   derivative") EvalCubicHermite;
		static Standard_Integer EvalCubicHermite (const Standard_Real U,const Standard_Integer DerivativeOrder,const Standard_Integer Dimension,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	FirstParameter(Standard_Real)
	LastParameter(Standard_Real)
	FirstOrder(Standard_Integer)
	LastOrder(Standard_Integer)
	MatrixCoefs(math_Matrix)

Returns:
	static Standard_Boolean

This build the coefficient of Hermite's polynomes on  
         [FirstParameter, LastParameter]  
 
         if j <= FirstOrder+1 then  
 
         MatrixCoefs[i, j] = ith coefficient of the polynome H0,j-1  
 
         else  
 
         MatrixCoefs[i, j] = ith coefficient of the polynome H1,k  
           with k = j - FirstOrder - 2  
 
         return false if  
         - |FirstParameter| > 100  
         - |LastParameter| > 100  
         - |FirstParameter| +|LastParameter| < 1/100  
         -   |LastParameter - FirstParameter|  
           / (|FirstParameter| +|LastParameter|)  < 1/100") HermiteCoefficients;
		static Standard_Boolean HermiteCoefficients (const Standard_Real FirstParameter,const Standard_Real LastParameter,const Standard_Integer FirstOrder,const Standard_Integer LastOrder,math_Matrix & MatrixCoefs);
		%feature("autodoc", "Args:
	Coefs(TColgp_Array1OfPnt)
	WCoefs(TColStd_Array1OfReal)
	Poles(TColgp_Array1OfPnt)
	WPoles(TColStd_Array1OfReal)

Returns:
	static void

No detailed docstring for this function.") CoefficientsPoles;
		static void CoefficientsPoles (const TColgp_Array1OfPnt & Coefs,const TColStd_Array1OfReal & WCoefs,TColgp_Array1OfPnt & Poles,TColStd_Array1OfReal & WPoles);
		%feature("autodoc", "Args:
	Coefs(TColgp_Array1OfPnt2d)
	WCoefs(TColStd_Array1OfReal)
	Poles(TColgp_Array1OfPnt2d)
	WPoles(TColStd_Array1OfReal)

Returns:
	static void

No detailed docstring for this function.") CoefficientsPoles;
		static void CoefficientsPoles (const TColgp_Array1OfPnt2d & Coefs,const TColStd_Array1OfReal & WCoefs,TColgp_Array1OfPnt2d & Poles,TColStd_Array1OfReal & WPoles);
		%feature("autodoc", "Args:
	Coefs(TColStd_Array1OfReal)
	WCoefs(TColStd_Array1OfReal)
	Poles(TColStd_Array1OfReal)
	WPoles(TColStd_Array1OfReal)

Returns:
	static void

No detailed docstring for this function.") CoefficientsPoles;
		static void CoefficientsPoles (const TColStd_Array1OfReal & Coefs,const TColStd_Array1OfReal & WCoefs,TColStd_Array1OfReal & Poles,TColStd_Array1OfReal & WPoles);
		%feature("autodoc", "Args:
	dim(Standard_Integer)
	Coefs(TColStd_Array1OfReal)
	WCoefs(TColStd_Array1OfReal)
	Poles(TColStd_Array1OfReal)
	WPoles(TColStd_Array1OfReal)

Returns:
	static void

No detailed docstring for this function.") CoefficientsPoles;
		static void CoefficientsPoles (const Standard_Integer dim,const TColStd_Array1OfReal & Coefs,const TColStd_Array1OfReal & WCoefs,TColStd_Array1OfReal & Poles,TColStd_Array1OfReal & WPoles);
		%feature("autodoc", "Args:
	U1(Standard_Real)
	U2(Standard_Real)
	Coeffs(TColgp_Array1OfPnt)
	WCoeffs(TColStd_Array1OfReal)

Returns:
	static void

No detailed docstring for this function.") Trimming;
		static void Trimming (const Standard_Real U1,const Standard_Real U2,TColgp_Array1OfPnt & Coeffs,TColStd_Array1OfReal & WCoeffs);
		%feature("autodoc", "Args:
	U1(Standard_Real)
	U2(Standard_Real)
	Coeffs(TColgp_Array1OfPnt2d)
	WCoeffs(TColStd_Array1OfReal)

Returns:
	static void

No detailed docstring for this function.") Trimming;
		static void Trimming (const Standard_Real U1,const Standard_Real U2,TColgp_Array1OfPnt2d & Coeffs,TColStd_Array1OfReal & WCoeffs);
		%feature("autodoc", "Args:
	U1(Standard_Real)
	U2(Standard_Real)
	Coeffs(TColStd_Array1OfReal)
	WCoeffs(TColStd_Array1OfReal)

Returns:
	static void

No detailed docstring for this function.") Trimming;
		static void Trimming (const Standard_Real U1,const Standard_Real U2,TColStd_Array1OfReal & Coeffs,TColStd_Array1OfReal & WCoeffs);
		%feature("autodoc", "Args:
	U1(Standard_Real)
	U2(Standard_Real)
	dim(Standard_Integer)
	Coeffs(TColStd_Array1OfReal)
	WCoeffs(TColStd_Array1OfReal)

Returns:
	static void

No detailed docstring for this function.") Trimming;
		static void Trimming (const Standard_Real U1,const Standard_Real U2,const Standard_Integer dim,TColStd_Array1OfReal & Coeffs,TColStd_Array1OfReal & WCoeffs);
		%feature("autodoc", "Args:
	Coefs(TColgp_Array2OfPnt)
	WCoefs(TColStd_Array2OfReal)
	Poles(TColgp_Array2OfPnt)
	WPoles(TColStd_Array2OfReal)

Returns:
	static void

No detailed docstring for this function.") CoefficientsPoles;
		static void CoefficientsPoles (const TColgp_Array2OfPnt & Coefs,const TColStd_Array2OfReal & WCoefs,TColgp_Array2OfPnt & Poles,TColStd_Array2OfReal & WPoles);
		%feature("autodoc", "Args:
	U1(Standard_Real)
	U2(Standard_Real)
	Coeffs(TColgp_Array2OfPnt)
	WCoeffs(TColStd_Array2OfReal)

Returns:
	static void

No detailed docstring for this function.") UTrimming;
		static void UTrimming (const Standard_Real U1,const Standard_Real U2,TColgp_Array2OfPnt & Coeffs,TColStd_Array2OfReal & WCoeffs);
		%feature("autodoc", "Args:
	V1(Standard_Real)
	V2(Standard_Real)
	Coeffs(TColgp_Array2OfPnt)
	WCoeffs(TColStd_Array2OfReal)

Returns:
	static void

No detailed docstring for this function.") VTrimming;
		static void VTrimming (const Standard_Real V1,const Standard_Real V2,TColgp_Array2OfPnt & Coeffs,TColStd_Array2OfReal & WCoeffs);
		%feature("autodoc", "Args:
	Dimension(Standard_Integer)
	FirstParameter(Standard_Real)
	LastParameter(Standard_Real)
	FirstOrder(Standard_Integer)
	LastOrder(Standard_Integer)
	FirstConstr(TColStd_Array2OfReal)
	LastConstr(TColStd_Array2OfReal)
	Coefficients(TColStd_Array1OfReal)

Returns:
	static Standard_Boolean

Compute the coefficients in the canonical base of the  
        polynomial satisfying the given constraints  
        at the given parameters  
        The array FirstContr(i,j) i=1,Dimension j=0,FirstOrder  
        contains the values of the constraint at parameter FirstParameter  
        idem for LastConstr") HermiteInterpolate;
		static Standard_Boolean HermiteInterpolate (const Standard_Integer Dimension,const Standard_Real FirstParameter,const Standard_Real LastParameter,const Standard_Integer FirstOrder,const Standard_Integer LastOrder,const TColStd_Array2OfReal & FirstConstr,const TColStd_Array2OfReal & LastConstr,TColStd_Array1OfReal & Coefficients);
		%feature("autodoc", "Args:
	ConstraintOrder(GeomAbs_Shape)
	MaxDegree(Standard_Integer)
	Code(Standard_Integer)
	NbGaussPoints(Standard_Integer)
	WorkDegree(Standard_Integer)

Returns:
	static void

Compute the number of points used for integral  
        computations (NbGaussPoints) and the degree of Jacobi  
        Polynomial (WorkDegree).  
        ConstraintOrder has to be GeomAbs_C0, GeomAbs_C1 or GeomAbs_C2  
        Code: Code d' init. des parametres de discretisation.  
           = -5  
           = -4  
           = -3  
           = -2  
           = -1  
           =  1 calcul rapide avec precision moyenne.  
           =  2 calcul rapide avec meilleure precision.  
           =  3 calcul un peu plus lent avec bonne precision.  
           =  4 calcul lent avec la meilleure precision possible.") JacobiParameters;
		static void JacobiParameters (const GeomAbs_Shape ConstraintOrder,const Standard_Integer MaxDegree,const Standard_Integer Code,Standard_Integer &OutValue,Standard_Integer &OutValue);
		%feature("autodoc", "Args:
	ConstraintOrder(GeomAbs_Shape)

Returns:
	static Standard_Integer

translates from GeomAbs_Shape to Integer") NivConstr;
		static Standard_Integer NivConstr (const GeomAbs_Shape ConstraintOrder);
		%feature("autodoc", "Args:
	NivConstr(Standard_Integer)

Returns:
	static GeomAbs_Shape

translates from Integer to GeomAbs_Shape") ConstraintOrder;
		static GeomAbs_Shape ConstraintOrder (const Standard_Integer NivConstr);
		%feature("autodoc", "Args:
	Degree(Standard_Integer)
	Dimension(Standard_Integer)
	PolynomialCoeff(Standard_Real)
	U1(Standard_Real)
	U2(Standard_Real)
	Length(Standard_Real)

Returns:
	static void

No detailed docstring for this function.") EvalLength;
		static void EvalLength (const Standard_Integer Degree,const Standard_Integer Dimension,Standard_Real &OutValue,const Standard_Real U1,const Standard_Real U2,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	Degree(Standard_Integer)
	Dimension(Standard_Integer)
	PolynomialCoeff(Standard_Real)
	U1(Standard_Real)
	U2(Standard_Real)
	Tol(Standard_Real)
	Length(Standard_Real)
	Error(Standard_Real)

Returns:
	static void

No detailed docstring for this function.") EvalLength;
		static void EvalLength (const Standard_Integer Degree,const Standard_Integer Dimension,Standard_Real &OutValue,const Standard_Real U1,const Standard_Real U2,const Standard_Real Tol,Standard_Real &OutValue,Standard_Real &OutValue);
};


%feature("shadow") PLib::~PLib %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend PLib {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor PLib_Base;
class PLib_Base : public MMgt_TShared {
	public:
		%feature("autodoc", "Args:
	Dimension(Standard_Integer)
	Degree(Standard_Integer)
	CoeffinBase(TColStd_Array1OfReal)
	Coefficients(TColStd_Array1OfReal)

Returns:
	virtual void

Convert the polynomial P(t) in the canonical base.") ToCoefficients;
		virtual void ToCoefficients (const Standard_Integer Dimension,const Standard_Integer Degree,const TColStd_Array1OfReal & CoeffinBase,TColStd_Array1OfReal & Coefficients);
		%feature("autodoc", "Args:
	U(Standard_Real)
	BasisValue(TColStd_Array1OfReal)

Returns:
	virtual void

Compute the values of the basis functions in u") D0;
		virtual void D0 (const Standard_Real U,TColStd_Array1OfReal & BasisValue);
		%feature("autodoc", "Args:
	U(Standard_Real)
	BasisValue(TColStd_Array1OfReal)
	BasisD1(TColStd_Array1OfReal)

Returns:
	virtual void

Compute the values and the derivatives values of  
         the basis functions in u") D1;
		virtual void D1 (const Standard_Real U,TColStd_Array1OfReal & BasisValue,TColStd_Array1OfReal & BasisD1);
		%feature("autodoc", "Args:
	U(Standard_Real)
	BasisValue(TColStd_Array1OfReal)
	BasisD1(TColStd_Array1OfReal)
	BasisD2(TColStd_Array1OfReal)

Returns:
	virtual void

Compute the values and the derivatives values of  
         the basis functions in u") D2;
		virtual void D2 (const Standard_Real U,TColStd_Array1OfReal & BasisValue,TColStd_Array1OfReal & BasisD1,TColStd_Array1OfReal & BasisD2);
		%feature("autodoc", "Args:
	U(Standard_Real)
	BasisValue(TColStd_Array1OfReal)
	BasisD1(TColStd_Array1OfReal)
	BasisD2(TColStd_Array1OfReal)
	BasisD3(TColStd_Array1OfReal)

Returns:
	virtual void

Compute the values and the derivatives values of  
         the basis functions in u") D3;
		virtual void D3 (const Standard_Real U,TColStd_Array1OfReal & BasisValue,TColStd_Array1OfReal & BasisD1,TColStd_Array1OfReal & BasisD2,TColStd_Array1OfReal & BasisD3);
		%feature("autodoc", "Args:
	None
Returns:
	virtual Standard_Integer

returns WorkDegree") WorkDegree;
		virtual Standard_Integer WorkDegree ();
		%feature("autodoc", "Args:
	Dimension(Standard_Integer)
	MaxDegree(Standard_Integer)
	Tol(Standard_Real)
	BaseCoeff(Standard_Real)
	NewDegree(Standard_Integer)
	MaxError(Standard_Real)

Returns:
	virtual void

Compute NewDegree <= MaxDegree so that MaxError is lower  
  than Tol.  
  MaxError can be greater than Tol if it is not possible  
  to find a NewDegree <= MaxDegree.  
  In this case NewDegree = MaxDegree") ReduceDegree;
		virtual void ReduceDegree (const Standard_Integer Dimension,const Standard_Integer MaxDegree,const Standard_Real Tol,Standard_Real &OutValue,Standard_Integer &OutValue,Standard_Real &OutValue);
};


%feature("shadow") PLib_Base::~PLib_Base %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend PLib_Base {
	void _kill_pointed() {
		delete $self;
	}
};
%extend PLib_Base {
	Handle_PLib_Base GetHandle() {
	return *(Handle_PLib_Base*) &$self;
	}
};

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
    PLib_Base* GetObject() {
    return (PLib_Base*)$self->Access();
    }
};
%feature("shadow") Handle_PLib_Base::~Handle_PLib_Base %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_PLib_Base {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor PLib_DoubleJacobiPolynomial;
class PLib_DoubleJacobiPolynomial {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") PLib_DoubleJacobiPolynomial;
		 PLib_DoubleJacobiPolynomial ();
		%feature("autodoc", "Args:
	JacPolU(Handle_PLib_JacobiPolynomial)
	JacPolV(Handle_PLib_JacobiPolynomial)

Returns:
	None

No detailed docstring for this function.") PLib_DoubleJacobiPolynomial;
		 PLib_DoubleJacobiPolynomial (const Handle_PLib_JacobiPolynomial & JacPolU,const Handle_PLib_JacobiPolynomial & JacPolV);
		%feature("autodoc", "Args:
	Dimension(Standard_Integer)
	DegreeU(Standard_Integer)
	DegreeV(Standard_Integer)
	dJacCoeff(Standard_Integer)
	JacCoeff(TColStd_Array1OfReal)

Returns:
	Standard_Real

No detailed docstring for this function.") MaxErrorU;
		Standard_Real MaxErrorU (const Standard_Integer Dimension,const Standard_Integer DegreeU,const Standard_Integer DegreeV,const Standard_Integer dJacCoeff,const TColStd_Array1OfReal & JacCoeff);
		%feature("autodoc", "Args:
	Dimension(Standard_Integer)
	DegreeU(Standard_Integer)
	DegreeV(Standard_Integer)
	dJacCoeff(Standard_Integer)
	JacCoeff(TColStd_Array1OfReal)

Returns:
	Standard_Real

No detailed docstring for this function.") MaxErrorV;
		Standard_Real MaxErrorV (const Standard_Integer Dimension,const Standard_Integer DegreeU,const Standard_Integer DegreeV,const Standard_Integer dJacCoeff,const TColStd_Array1OfReal & JacCoeff);
		%feature("autodoc", "Args:
	Dimension(Standard_Integer)
	MinDegreeU(Standard_Integer)
	MaxDegreeU(Standard_Integer)
	MinDegreeV(Standard_Integer)
	MaxDegreeV(Standard_Integer)
	dJacCoeff(Standard_Integer)
	JacCoeff(TColStd_Array1OfReal)
	Error(Standard_Real)

Returns:
	Standard_Real

No detailed docstring for this function.") MaxError;
		Standard_Real MaxError (const Standard_Integer Dimension,const Standard_Integer MinDegreeU,const Standard_Integer MaxDegreeU,const Standard_Integer MinDegreeV,const Standard_Integer MaxDegreeV,const Standard_Integer dJacCoeff,const TColStd_Array1OfReal & JacCoeff,const Standard_Real Error);
		%feature("autodoc", "Args:
	Dimension(Standard_Integer)
	MinDegreeU(Standard_Integer)
	MaxDegreeU(Standard_Integer)
	MinDegreeV(Standard_Integer)
	MaxDegreeV(Standard_Integer)
	dJacCoeff(Standard_Integer)
	JacCoeff(TColStd_Array1OfReal)
	EpmsCut(Standard_Real)
	MaxError(Standard_Real)
	NewDegreeU(Standard_Integer)
	NewDegreeV(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") ReduceDegree;
		void ReduceDegree (const Standard_Integer Dimension,const Standard_Integer MinDegreeU,const Standard_Integer MaxDegreeU,const Standard_Integer MinDegreeV,const Standard_Integer MaxDegreeV,const Standard_Integer dJacCoeff,const TColStd_Array1OfReal & JacCoeff,const Standard_Real EpmsCut,Standard_Real &OutValue,Standard_Integer &OutValue,Standard_Integer &OutValue);
		%feature("autodoc", "Args:
	Dimension(Standard_Integer)
	DegreeU(Standard_Integer)
	DegreeV(Standard_Integer)
	dJacCoeff(Standard_Integer)
	JacCoeff(TColStd_Array1OfReal)

Returns:
	Standard_Real

No detailed docstring for this function.") AverageError;
		Standard_Real AverageError (const Standard_Integer Dimension,const Standard_Integer DegreeU,const Standard_Integer DegreeV,const Standard_Integer dJacCoeff,const TColStd_Array1OfReal & JacCoeff);
		%feature("autodoc", "Args:
	Dimension(Standard_Integer)
	DegreeU(Standard_Integer)
	DegreeV(Standard_Integer)
	JacCoeff(TColStd_Array1OfReal)
	Coefficients(TColStd_Array1OfReal)

Returns:
	None

No detailed docstring for this function.") WDoubleJacobiToCoefficients;
		void WDoubleJacobiToCoefficients (const Standard_Integer Dimension,const Standard_Integer DegreeU,const Standard_Integer DegreeV,const TColStd_Array1OfReal & JacCoeff,TColStd_Array1OfReal & Coefficients);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_PLib_JacobiPolynomial

returns myJacPolU;") U;
		Handle_PLib_JacobiPolynomial U ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_PLib_JacobiPolynomial

returns myJacPolV;") V;
		Handle_PLib_JacobiPolynomial V ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_TColStd_HArray1OfReal

returns myTabMaxU;") TabMaxU;
		Handle_TColStd_HArray1OfReal TabMaxU ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_TColStd_HArray1OfReal

returns myTabMaxV;") TabMaxV;
		Handle_TColStd_HArray1OfReal TabMaxV ();
};


%feature("shadow") PLib_DoubleJacobiPolynomial::~PLib_DoubleJacobiPolynomial %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend PLib_DoubleJacobiPolynomial {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor PLib_JacobiPolynomial;
class PLib_JacobiPolynomial : public PLib_Base {
	public:
		%feature("autodoc", "Args:
	WorkDegree(Standard_Integer)
	ConstraintOrder(GeomAbs_Shape)

Returns:
	None

Initialize the polynomial class  
  Degree has to be <= 30  
  ConstraintOrder has to be GeomAbs_C0  
                            GeomAbs_C1  
                            GeomAbs_C2") PLib_JacobiPolynomial;
		 PLib_JacobiPolynomial (const Standard_Integer WorkDegree,const GeomAbs_Shape ConstraintOrder);
		%feature("autodoc", "Args:
	NbGaussPoints(Standard_Integer)
	TabPoints(TColStd_Array1OfReal)

Returns:
	None

returns  the  Jacobi  Points   for  Gauss  integration ie  
  the positive values of the Legendre roots by increasing values  
  NbGaussPoints is the number of   points choosen for the  integral  
  computation.  
  TabPoints (0,NbGaussPoints/2)  
  TabPoints (0) is loaded only for the odd values of NbGaussPoints  
  The possible values for NbGaussPoints are : 8, 10,  
  15, 20, 25, 30, 35, 40, 50, 61  
  NbGaussPoints must be greater than Degree") Points;
		void Points (const Standard_Integer NbGaussPoints,TColStd_Array1OfReal & TabPoints);
		%feature("autodoc", "Args:
	NbGaussPoints(Standard_Integer)
	TabWeights(TColStd_Array2OfReal)

Returns:
	None

returns the Jacobi weigths for Gauss integration only for  
 the positive    values of the  Legendre roots   in the order they  
are given by the method Points  
 NbGaussPoints   is the number of points choosen   for  the integral  
 computation.  
 TabWeights  (0,NbGaussPoints/2,0,Degree)  
 TabWeights (0,.) are only loaded for the odd values of NbGaussPoints  
 The possible values for NbGaussPoints are : 8 , 10 , 15 ,20 ,25 , 30,  
 35 , 40 , 50 , 61 NbGaussPoints must be greater than Degree") Weights;
		void Weights (const Standard_Integer NbGaussPoints,TColStd_Array2OfReal & TabWeights);
		%feature("autodoc", "Args:
	TabMax(TColStd_Array1OfReal)

Returns:
	None

this method loads for k=0,q the maximum value of  
  abs ( W(t)*Jk(t) )for t bellonging to [-1,1]  
  This values are loaded is the array TabMax(0,myWorkDegree-2*(myNivConst+1))  
  MaxValue ( me ; TabMaxPointer : in  out  Real );") MaxValue;
		void MaxValue (TColStd_Array1OfReal & TabMax);
		%feature("autodoc", "Args:
	Dimension(Standard_Integer)
	JacCoeff(Standard_Real)
	NewDegree(Standard_Integer)

Returns:
	Standard_Real

This  method computes the  maximum  error on the polynomial  
  W(t) Q(t)  obtained  by   missing  the   coefficients of  JacCoeff   from  
  NewDegree +1 to Degree") MaxError;
		Standard_Real MaxError (const Standard_Integer Dimension,Standard_Real &OutValue,const Standard_Integer NewDegree);
		%feature("autodoc", "Args:
	Dimension(Standard_Integer)
	MaxDegree(Standard_Integer)
	Tol(Standard_Real)
	JacCoeff(Standard_Real)
	NewDegree(Standard_Integer)
	MaxError(Standard_Real)

Returns:
	None

Compute NewDegree <= MaxDegree  so that MaxError is lower  
  than Tol.  
  MaxError can be greater than Tol  if it is not possible  
  to find a NewDegree <= MaxDegree.  
  In this case NewDegree = MaxDegree") ReduceDegree;
		void ReduceDegree (const Standard_Integer Dimension,const Standard_Integer MaxDegree,const Standard_Real Tol,Standard_Real &OutValue,Standard_Integer &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	Dimension(Standard_Integer)
	JacCoeff(Standard_Real)
	NewDegree(Standard_Integer)

Returns:
	Standard_Real

No detailed docstring for this function.") AverageError;
		Standard_Real AverageError (const Standard_Integer Dimension,Standard_Real &OutValue,const Standard_Integer NewDegree);
		%feature("autodoc", "Args:
	Dimension(Standard_Integer)
	Degree(Standard_Integer)
	JacCoeff(TColStd_Array1OfReal)
	Coefficients(TColStd_Array1OfReal)

Returns:
	None

Convert the polynomial P(t) = R(t) + W(t) Q(t) in the canonical base.") ToCoefficients;
		void ToCoefficients (const Standard_Integer Dimension,const Standard_Integer Degree,const TColStd_Array1OfReal & JacCoeff,TColStd_Array1OfReal & Coefficients);
		%feature("autodoc", "Args:
	U(Standard_Real)
	BasisValue(TColStd_Array1OfReal)

Returns:
	None

Compute the values of the basis functions in u") D0;
		void D0 (const Standard_Real U,TColStd_Array1OfReal & BasisValue);
		%feature("autodoc", "Args:
	U(Standard_Real)
	BasisValue(TColStd_Array1OfReal)
	BasisD1(TColStd_Array1OfReal)

Returns:
	None

Compute the values and the derivatives values of  
         the basis functions in u") D1;
		void D1 (const Standard_Real U,TColStd_Array1OfReal & BasisValue,TColStd_Array1OfReal & BasisD1);
		%feature("autodoc", "Args:
	U(Standard_Real)
	BasisValue(TColStd_Array1OfReal)
	BasisD1(TColStd_Array1OfReal)
	BasisD2(TColStd_Array1OfReal)

Returns:
	None

Compute the values and the derivatives values of  
         the basis functions in u") D2;
		void D2 (const Standard_Real U,TColStd_Array1OfReal & BasisValue,TColStd_Array1OfReal & BasisD1,TColStd_Array1OfReal & BasisD2);
		%feature("autodoc", "Args:
	U(Standard_Real)
	BasisValue(TColStd_Array1OfReal)
	BasisD1(TColStd_Array1OfReal)
	BasisD2(TColStd_Array1OfReal)
	BasisD3(TColStd_Array1OfReal)

Returns:
	None

Compute the values and the derivatives values of  
         the basis functions in u") D3;
		void D3 (const Standard_Real U,TColStd_Array1OfReal & BasisValue,TColStd_Array1OfReal & BasisD1,TColStd_Array1OfReal & BasisD2,TColStd_Array1OfReal & BasisD3);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

returns WorkDegree") WorkDegree;
		Standard_Integer WorkDegree ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

returns NivConstr") NivConstr;
		Standard_Integer NivConstr ();
};


%feature("shadow") PLib_JacobiPolynomial::~PLib_JacobiPolynomial %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend PLib_JacobiPolynomial {
	void _kill_pointed() {
		delete $self;
	}
};
%extend PLib_JacobiPolynomial {
	Handle_PLib_JacobiPolynomial GetHandle() {
	return *(Handle_PLib_JacobiPolynomial*) &$self;
	}
};

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
    PLib_JacobiPolynomial* GetObject() {
    return (PLib_JacobiPolynomial*)$self->Access();
    }
};
%feature("shadow") Handle_PLib_JacobiPolynomial::~Handle_PLib_JacobiPolynomial %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_PLib_JacobiPolynomial {
    void _kill_pointed() {
        delete $self;
    }
};

