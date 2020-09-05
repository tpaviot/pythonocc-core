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
%define BSPLCLIBDOCSTRING
"BSplCLib module, see official documentation at
https://www.opencascade.com/doc/occt-7.4.0/refman/html/package_bsplclib.html"
%enddef
%module (package="OCC.Core", docstring=BSPLCLIBDOCSTRING) BSplCLib


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
#include<BSplCLib_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<TColStd_module.hxx>
#include<math_module.hxx>
#include<TColgp_module.hxx>
#include<gp_module.hxx>
#include<GeomAbs_module.hxx>
#include<Message_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import TColStd.i
%import math.i
%import TColgp.i
%import gp.i
%import GeomAbs.i

%pythoncode {
from enum import IntEnum
from OCC.Core.Exception import *
};

/* public enums */
enum BSplCLib_MultDistribution {
	BSplCLib_NonConstant = 0,
	BSplCLib_Constant = 1,
	BSplCLib_QuasiConstant = 2,
};

enum BSplCLib_KnotDistribution {
	BSplCLib_NonUniform = 0,
	BSplCLib_Uniform = 1,
};

/* end public enums declaration */

/* python proy classes for enums */
%pythoncode {

class BSplCLib_MultDistribution(IntEnum):
	BSplCLib_NonConstant = 0
	BSplCLib_Constant = 1
	BSplCLib_QuasiConstant = 2
BSplCLib_NonConstant = BSplCLib_MultDistribution.BSplCLib_NonConstant
BSplCLib_Constant = BSplCLib_MultDistribution.BSplCLib_Constant
BSplCLib_QuasiConstant = BSplCLib_MultDistribution.BSplCLib_QuasiConstant

class BSplCLib_KnotDistribution(IntEnum):
	BSplCLib_NonUniform = 0
	BSplCLib_Uniform = 1
BSplCLib_NonUniform = BSplCLib_KnotDistribution.BSplCLib_NonUniform
BSplCLib_Uniform = BSplCLib_KnotDistribution.BSplCLib_Uniform
};
/* end python proxy for enums */

/* handles */
%wrap_handle(BSplCLib_Cache)
/* end handles declaration */

/* templates */
/* end templates declaration */

/* typedefs */
/* end typedefs declaration */

/*****************
* class BSplCLib *
*****************/
%rename(bsplclib) BSplCLib;
class BSplCLib {
	public:
		/****************** AntiBoorScheme ******************/
		/**** md5 signature: f2a15c1ab9b1fa3f3839f413b77c4060 ****/
		%feature("compactdefaultargs") AntiBoorScheme;
		%feature("autodoc", "Compute the content of pole before the boorscheme. this method is used to remove poles. //! u is the poles to remove, knots should contains the knots of the curve after knot removal. //! the first and last poles do not change, the other poles are computed by averaging two possible values. the distance between the two possible poles is computed, if it is higher than <tolerance> false is returned.

Parameters
----------
U: float
Degree: int
Dimension: int
Depth: int
Length: int
Tolerance: float

Returns
-------
Knots: float
Poles: float
") AntiBoorScheme;
		static Standard_Boolean AntiBoorScheme(const Standard_Real U, const Standard_Integer Degree, Standard_Real &OutValue, const Standard_Integer Dimension, Standard_Real &OutValue, const Standard_Integer Depth, const Standard_Integer Length, const Standard_Real Tolerance);

		/****************** Bohm ******************/
		/**** md5 signature: 84b7e6290b2939358c0b5fd95367ff2c ****/
		%feature("compactdefaultargs") Bohm;
		%feature("autodoc", "Performs the bohm algorithm at parameter <u>. this algorithm computes the value and all the derivatives up to order n (n <= degree). //! <poles> is the original array of poles. //! the result in <poles> is the value and the derivatives. poles[0] is the value, poles[degree] is the last derivative.

Parameters
----------
U: float
Degree: int
N: int
Dimension: int

Returns
-------
Knots: float
Poles: float
") Bohm;
		static void Bohm(const Standard_Real U, const Standard_Integer Degree, const Standard_Integer N, Standard_Real &OutValue, const Standard_Integer Dimension, Standard_Real &OutValue);

		/****************** BoorIndex ******************/
		/**** md5 signature: fe6c98ba2e3115fab44859a66dddd7d5 ****/
		%feature("compactdefaultargs") BoorIndex;
		%feature("autodoc", "Returns the index in the boor result array of the poles <index>. if the boor algorithm was perform with <length> and <depth>.

Parameters
----------
Index: int
Length: int
Depth: int

Returns
-------
int
") BoorIndex;
		static Standard_Integer BoorIndex(const Standard_Integer Index, const Standard_Integer Length, const Standard_Integer Depth);

		/****************** BoorScheme ******************/
		/**** md5 signature: eefddfccb28bb41dfcee6873cbf310be ****/
		%feature("compactdefaultargs") BoorScheme;
		%feature("autodoc", "Performs the boor algorithm at parameter <u> with the given <degree> and the array of <knots> on the poles <poles> of dimension <dimension>. the schema is computed until level <depth> on a basis of <length+1> poles. //! * knots is an array of reals of length : //! <length> + <degree> //! * poles is an array of reals of length : //! (2 * <length> + 1) * <dimension> //! the poles values must be set in the array at the positions. //! 0..dimension, //! 2 * dimension .. 3 * dimension //! 4 * dimension .. 5 * dimension //! ... //! the results are found in the array poles depending on the depth. (see the method getpole).

Parameters
----------
U: float
Degree: int
Dimension: int
Depth: int
Length: int

Returns
-------
Knots: float
Poles: float
") BoorScheme;
		static void BoorScheme(const Standard_Real U, const Standard_Integer Degree, Standard_Real &OutValue, const Standard_Integer Dimension, Standard_Real &OutValue, const Standard_Integer Depth, const Standard_Integer Length);

		/****************** BuildBSpMatrix ******************/
		/**** md5 signature: 4fca6c948c6dad78f4e6206c4ebe72d7 ****/
		%feature("compactdefaultargs") BuildBSpMatrix;
		%feature("autodoc", "This builds a fully blown matrix of (ni) bi (tj) //! with i and j within 1..order + numpoles the integer ni is the ith slot of the array orderarray, tj is the jth slot of the array parameters.

Parameters
----------
Parameters: TColStd_Array1OfReal
OrderArray: TColStd_Array1OfInteger
FlatKnots: TColStd_Array1OfReal
Degree: int
Matrix: math_Matrix

Returns
-------
UpperBandWidth: int
LowerBandWidth: int
") BuildBSpMatrix;
		static Standard_Integer BuildBSpMatrix(const TColStd_Array1OfReal & Parameters, const TColStd_Array1OfInteger & OrderArray, const TColStd_Array1OfReal & FlatKnots, const Standard_Integer Degree, math_Matrix & Matrix, Standard_Integer &OutValue, Standard_Integer &OutValue);

		/****************** BuildBoor ******************/
		/**** md5 signature: f16cfb2a5992087302948523a5f30919 ****/
		%feature("compactdefaultargs") BuildBoor;
		%feature("autodoc", "Copy in <lp> poles for <dimension> boor scheme. starting from <index> * <dimension>, copy <length+1> poles.

Parameters
----------
Index: int
Length: int
Dimension: int
Poles: TColStd_Array1OfReal

Returns
-------
LP: float
") BuildBoor;
		static void BuildBoor(const Standard_Integer Index, const Standard_Integer Length, const Standard_Integer Dimension, const TColStd_Array1OfReal & Poles, Standard_Real &OutValue);

		/****************** BuildCache ******************/
		/**** md5 signature: 88f6db741b7bf40f8789b15b366aa19e ****/
		%feature("compactdefaultargs") BuildCache;
		%feature("autodoc", "Perform the evaluation of the taylor expansion of the bspline normalized between 0 and 1. if rational computes the homogeneous taylor expension for the numerator and stores it in cachepoles.

Parameters
----------
U: float
InverseOfSpanDomain: float
PeriodicFlag: bool
Degree: int
FlatKnots: TColStd_Array1OfReal
Poles: TColgp_Array1OfPnt
Weights: TColStd_Array1OfReal *
CachePoles: TColgp_Array1OfPnt
CacheWeights: TColStd_Array1OfReal *

Returns
-------
None
") BuildCache;
		static void BuildCache(const Standard_Real U, const Standard_Real InverseOfSpanDomain, const Standard_Boolean PeriodicFlag, const Standard_Integer Degree, const TColStd_Array1OfReal & FlatKnots, const TColgp_Array1OfPnt & Poles, const TColStd_Array1OfReal * Weights, TColgp_Array1OfPnt & CachePoles, TColStd_Array1OfReal * CacheWeights);

		/****************** BuildCache ******************/
		/**** md5 signature: 45f22d8002fc8790ce5072ab4d067a4f ****/
		%feature("compactdefaultargs") BuildCache;
		%feature("autodoc", "Perform the evaluation of the taylor expansion of the bspline normalized between 0 and 1. if rational computes the homogeneous taylor expension for the numerator and stores it in cachepoles.

Parameters
----------
U: float
InverseOfSpanDomain: float
PeriodicFlag: bool
Degree: int
FlatKnots: TColStd_Array1OfReal
Poles: TColgp_Array1OfPnt2d
Weights: TColStd_Array1OfReal *
CachePoles: TColgp_Array1OfPnt2d
CacheWeights: TColStd_Array1OfReal *

Returns
-------
None
") BuildCache;
		static void BuildCache(const Standard_Real U, const Standard_Real InverseOfSpanDomain, const Standard_Boolean PeriodicFlag, const Standard_Integer Degree, const TColStd_Array1OfReal & FlatKnots, const TColgp_Array1OfPnt2d & Poles, const TColStd_Array1OfReal * Weights, TColgp_Array1OfPnt2d & CachePoles, TColStd_Array1OfReal * CacheWeights);

		/****************** BuildCache ******************/
		/**** md5 signature: c515147b2f76ee70ec1b53736b32b6a3 ****/
		%feature("compactdefaultargs") BuildCache;
		%feature("autodoc", "Perform the evaluation of the taylor expansion of the bspline normalized between 0 and 1. structure of result optimized for bsplclib_cache.

Parameters
----------
theParameter: float
theSpanDomain: float
thePeriodicFlag: bool
theDegree: int
theSpanIndex: int
theFlatKnots: TColStd_Array1OfReal
thePoles: TColgp_Array1OfPnt
theWeights: TColStd_Array1OfReal *
theCacheArray: TColStd_Array2OfReal

Returns
-------
None
") BuildCache;
		static void BuildCache(const Standard_Real theParameter, const Standard_Real theSpanDomain, const Standard_Boolean thePeriodicFlag, const Standard_Integer theDegree, const Standard_Integer theSpanIndex, const TColStd_Array1OfReal & theFlatKnots, const TColgp_Array1OfPnt & thePoles, const TColStd_Array1OfReal * theWeights, TColStd_Array2OfReal & theCacheArray);

		/****************** BuildCache ******************/
		/**** md5 signature: aa87bffa2b4787d68598fd1c4a7827a6 ****/
		%feature("compactdefaultargs") BuildCache;
		%feature("autodoc", "Perform the evaluation of the taylor expansion of the bspline normalized between 0 and 1. structure of result optimized for bsplclib_cache.

Parameters
----------
theParameter: float
theSpanDomain: float
thePeriodicFlag: bool
theDegree: int
theSpanIndex: int
theFlatKnots: TColStd_Array1OfReal
thePoles: TColgp_Array1OfPnt2d
theWeights: TColStd_Array1OfReal *
theCacheArray: TColStd_Array2OfReal

Returns
-------
None
") BuildCache;
		static void BuildCache(const Standard_Real theParameter, const Standard_Real theSpanDomain, const Standard_Boolean thePeriodicFlag, const Standard_Integer theDegree, const Standard_Integer theSpanIndex, const TColStd_Array1OfReal & theFlatKnots, const TColgp_Array1OfPnt2d & thePoles, const TColStd_Array1OfReal * theWeights, TColStd_Array2OfReal & theCacheArray);

		/****************** BuildEval ******************/
		/**** md5 signature: f5bf26a19e3916875f66db135251f90e ****/
		%feature("compactdefaultargs") BuildEval;
		%feature("autodoc", "No available documentation.

Parameters
----------
Degree: int
Index: int
Poles: TColStd_Array1OfReal
Weights: TColStd_Array1OfReal *

Returns
-------
LP: float
") BuildEval;
		static void BuildEval(const Standard_Integer Degree, const Standard_Integer Index, const TColStd_Array1OfReal & Poles, const TColStd_Array1OfReal * Weights, Standard_Real &OutValue);

		/****************** BuildEval ******************/
		/**** md5 signature: 9494908cfef81ef91e3c3165373b276a ****/
		%feature("compactdefaultargs") BuildEval;
		%feature("autodoc", "No available documentation.

Parameters
----------
Degree: int
Index: int
Poles: TColgp_Array1OfPnt
Weights: TColStd_Array1OfReal *

Returns
-------
LP: float
") BuildEval;
		static void BuildEval(const Standard_Integer Degree, const Standard_Integer Index, const TColgp_Array1OfPnt & Poles, const TColStd_Array1OfReal * Weights, Standard_Real &OutValue);

		/****************** BuildEval ******************/
		/**** md5 signature: e7548b1cb6a5b267a1cdaa850de8e117 ****/
		%feature("compactdefaultargs") BuildEval;
		%feature("autodoc", "Copy in <lp> the poles and weights for the eval scheme. starting from poles(poles.lower()+index).

Parameters
----------
Degree: int
Index: int
Poles: TColgp_Array1OfPnt2d
Weights: TColStd_Array1OfReal *

Returns
-------
LP: float
") BuildEval;
		static void BuildEval(const Standard_Integer Degree, const Standard_Integer Index, const TColgp_Array1OfPnt2d & Poles, const TColStd_Array1OfReal * Weights, Standard_Real &OutValue);

		/****************** BuildKnots ******************/
		/**** md5 signature: 5b526b765c0171416b4d6dfd6b2cfaf1 ****/
		%feature("compactdefaultargs") BuildKnots;
		%feature("autodoc", "Stores in lk the usefull knots for the boorschem on the span knots(index) - knots(index+1).

Parameters
----------
Degree: int
Index: int
Periodic: bool
Knots: TColStd_Array1OfReal
Mults: TColStd_Array1OfInteger *

Returns
-------
LK: float
") BuildKnots;
		static void BuildKnots(const Standard_Integer Degree, const Standard_Integer Index, const Standard_Boolean Periodic, const TColStd_Array1OfReal & Knots, const TColStd_Array1OfInteger * Mults, Standard_Real &OutValue);

		/****************** BuildSchoenbergPoints ******************/
		/**** md5 signature: 7c7c6b34199d47b94798e9eaa18466de ****/
		%feature("compactdefaultargs") BuildSchoenbergPoints;
		%feature("autodoc", "Builds the schoenberg points from the flat knot used to interpolate a bspline since the bspline matrix is invertible.

Parameters
----------
Degree: int
FlatKnots: TColStd_Array1OfReal
Parameters: TColStd_Array1OfReal

Returns
-------
None
") BuildSchoenbergPoints;
		static void BuildSchoenbergPoints(const Standard_Integer Degree, const TColStd_Array1OfReal & FlatKnots, TColStd_Array1OfReal & Parameters);

		/****************** CacheD0 ******************/
		/**** md5 signature: 4b87a5084bd23695ffc6f5eb2dc1e975 ****/
		%feature("compactdefaultargs") CacheD0;
		%feature("autodoc", "Perform the evaluation of the of the cache the parameter must be normalized between the 0 and 1 for the span. the cache must be valid when calling this routine. geom package will insure that. and then multiplies by the weights this just evaluates the current point the cacheparameter is where the cache was constructed the spanlength is to normalize the polynomial in the cache to avoid bad conditioning effects.

Parameters
----------
U: float
Degree: int
CacheParameter: float
SpanLenght: float
Poles: TColgp_Array1OfPnt
Weights: TColStd_Array1OfReal *
Point: gp_Pnt

Returns
-------
None
") CacheD0;
		static void CacheD0(const Standard_Real U, const Standard_Integer Degree, const Standard_Real CacheParameter, const Standard_Real SpanLenght, const TColgp_Array1OfPnt & Poles, const TColStd_Array1OfReal * Weights, gp_Pnt & Point);

		/****************** CacheD0 ******************/
		/**** md5 signature: e4f1a75a966531ff935a46ebf7e7f834 ****/
		%feature("compactdefaultargs") CacheD0;
		%feature("autodoc", "Perform the evaluation of the bspline basis and then multiplies by the weights this just evaluates the current point the parameter must be normalized between the 0 and 1 for the span. the cache must be valid when calling this routine. geom package will insure that. and then multiplies by the weights ththe cacheparameter is where the cache was constructed the spanlength is to normalize the polynomial in the cache to avoid bad conditioning effectsis just evaluates the current point.

Parameters
----------
U: float
Degree: int
CacheParameter: float
SpanLenght: float
Poles: TColgp_Array1OfPnt2d
Weights: TColStd_Array1OfReal *
Point: gp_Pnt2d

Returns
-------
None
") CacheD0;
		static void CacheD0(const Standard_Real U, const Standard_Integer Degree, const Standard_Real CacheParameter, const Standard_Real SpanLenght, const TColgp_Array1OfPnt2d & Poles, const TColStd_Array1OfReal * Weights, gp_Pnt2d & Point);

		/****************** CacheD1 ******************/
		/**** md5 signature: ae504111826c0a9503f1e1e3c5414581 ****/
		%feature("compactdefaultargs") CacheD1;
		%feature("autodoc", "Perform the evaluation of the of the cache the parameter must be normalized between the 0 and 1 for the span. the cache must be valid when calling this routine. geom package will insure that. and then multiplies by the weights this just evaluates the current point the cacheparameter is where the cache was constructed the spanlength is to normalize the polynomial in the cache to avoid bad conditioning effects.

Parameters
----------
U: float
Degree: int
CacheParameter: float
SpanLenght: float
Poles: TColgp_Array1OfPnt
Weights: TColStd_Array1OfReal *
Point: gp_Pnt
Vec: gp_Vec

Returns
-------
None
") CacheD1;
		static void CacheD1(const Standard_Real U, const Standard_Integer Degree, const Standard_Real CacheParameter, const Standard_Real SpanLenght, const TColgp_Array1OfPnt & Poles, const TColStd_Array1OfReal * Weights, gp_Pnt & Point, gp_Vec & Vec);

		/****************** CacheD1 ******************/
		/**** md5 signature: bd3f1e91dd444c350b31810eec8e7216 ****/
		%feature("compactdefaultargs") CacheD1;
		%feature("autodoc", "Perform the evaluation of the bspline basis and then multiplies by the weights this just evaluates the current point the parameter must be normalized between the 0 and 1 for the span. the cache must be valid when calling this routine. geom package will insure that. and then multiplies by the weights ththe cacheparameter is where the cache was constructed the spanlength is to normalize the polynomial in the cache to avoid bad conditioning effectsis just evaluates the current point.

Parameters
----------
U: float
Degree: int
CacheParameter: float
SpanLenght: float
Poles: TColgp_Array1OfPnt2d
Weights: TColStd_Array1OfReal *
Point: gp_Pnt2d
Vec: gp_Vec2d

Returns
-------
None
") CacheD1;
		static void CacheD1(const Standard_Real U, const Standard_Integer Degree, const Standard_Real CacheParameter, const Standard_Real SpanLenght, const TColgp_Array1OfPnt2d & Poles, const TColStd_Array1OfReal * Weights, gp_Pnt2d & Point, gp_Vec2d & Vec);

		/****************** CacheD2 ******************/
		/**** md5 signature: 9f31e63202d02d8f93edddb5d118458f ****/
		%feature("compactdefaultargs") CacheD2;
		%feature("autodoc", "Perform the evaluation of the of the cache the parameter must be normalized between the 0 and 1 for the span. the cache must be valid when calling this routine. geom package will insure that. and then multiplies by the weights this just evaluates the current point the cacheparameter is where the cache was constructed the spanlength is to normalize the polynomial in the cache to avoid bad conditioning effects.

Parameters
----------
U: float
Degree: int
CacheParameter: float
SpanLenght: float
Poles: TColgp_Array1OfPnt
Weights: TColStd_Array1OfReal *
Point: gp_Pnt
Vec1: gp_Vec
Vec2: gp_Vec

Returns
-------
None
") CacheD2;
		static void CacheD2(const Standard_Real U, const Standard_Integer Degree, const Standard_Real CacheParameter, const Standard_Real SpanLenght, const TColgp_Array1OfPnt & Poles, const TColStd_Array1OfReal * Weights, gp_Pnt & Point, gp_Vec & Vec1, gp_Vec & Vec2);

		/****************** CacheD2 ******************/
		/**** md5 signature: ef6db7863626261e8a1f32874d2ed3bd ****/
		%feature("compactdefaultargs") CacheD2;
		%feature("autodoc", "Perform the evaluation of the bspline basis and then multiplies by the weights this just evaluates the current point the parameter must be normalized between the 0 and 1 for the span. the cache must be valid when calling this routine. geom package will insure that. and then multiplies by the weights ththe cacheparameter is where the cache was constructed the spanlength is to normalize the polynomial in the cache to avoid bad conditioning effectsis just evaluates the current point.

Parameters
----------
U: float
Degree: int
CacheParameter: float
SpanLenght: float
Poles: TColgp_Array1OfPnt2d
Weights: TColStd_Array1OfReal *
Point: gp_Pnt2d
Vec1: gp_Vec2d
Vec2: gp_Vec2d

Returns
-------
None
") CacheD2;
		static void CacheD2(const Standard_Real U, const Standard_Integer Degree, const Standard_Real CacheParameter, const Standard_Real SpanLenght, const TColgp_Array1OfPnt2d & Poles, const TColStd_Array1OfReal * Weights, gp_Pnt2d & Point, gp_Vec2d & Vec1, gp_Vec2d & Vec2);

		/****************** CacheD3 ******************/
		/**** md5 signature: 0a3f8637dbdbd34edf1705c597e300f0 ****/
		%feature("compactdefaultargs") CacheD3;
		%feature("autodoc", "Perform the evaluation of the of the cache the parameter must be normalized between the 0 and 1 for the span. the cache must be valid when calling this routine. geom package will insure that. and then multiplies by the weights this just evaluates the current point the cacheparameter is where the cache was constructed the spanlength is to normalize the polynomial in the cache to avoid bad conditioning effects.

Parameters
----------
U: float
Degree: int
CacheParameter: float
SpanLenght: float
Poles: TColgp_Array1OfPnt
Weights: TColStd_Array1OfReal *
Point: gp_Pnt
Vec1: gp_Vec
Vec2: gp_Vec
Vec3: gp_Vec

Returns
-------
None
") CacheD3;
		static void CacheD3(const Standard_Real U, const Standard_Integer Degree, const Standard_Real CacheParameter, const Standard_Real SpanLenght, const TColgp_Array1OfPnt & Poles, const TColStd_Array1OfReal * Weights, gp_Pnt & Point, gp_Vec & Vec1, gp_Vec & Vec2, gp_Vec & Vec3);

		/****************** CacheD3 ******************/
		/**** md5 signature: e5d96d09eb78ae6b9e6eddab8ceeacd5 ****/
		%feature("compactdefaultargs") CacheD3;
		%feature("autodoc", "Perform the evaluation of the bspline basis and then multiplies by the weights this just evaluates the current point the parameter must be normalized between the 0 and 1 for the span. the cache must be valid when calling this routine. geom package will insure that. and then multiplies by the weights ththe cacheparameter is where the cache was constructed the spanlength is to normalize the polynomial in the cache to avoid bad conditioning effectsis just evaluates the current point.

Parameters
----------
U: float
Degree: int
CacheParameter: float
SpanLenght: float
Poles: TColgp_Array1OfPnt2d
Weights: TColStd_Array1OfReal *
Point: gp_Pnt2d
Vec1: gp_Vec2d
Vec2: gp_Vec2d
Vec3: gp_Vec2d

Returns
-------
None
") CacheD3;
		static void CacheD3(const Standard_Real U, const Standard_Integer Degree, const Standard_Real CacheParameter, const Standard_Real SpanLenght, const TColgp_Array1OfPnt2d & Poles, const TColStd_Array1OfReal * Weights, gp_Pnt2d & Point, gp_Vec2d & Vec1, gp_Vec2d & Vec2, gp_Vec2d & Vec3);

		/****************** CoefsD0 ******************/
		/**** md5 signature: 18bf8e212b82477c8304e717ea65ad39 ****/
		%feature("compactdefaultargs") CoefsD0;
		%feature("autodoc", "Calls cached0 for bezier curves arrays computed with the method polescoefficients. warning: to be used for beziercurves only!!!.

Parameters
----------
U: float
Poles: TColgp_Array1OfPnt
Weights: TColStd_Array1OfReal *
Point: gp_Pnt

Returns
-------
None
") CoefsD0;
		static void CoefsD0(const Standard_Real U, const TColgp_Array1OfPnt & Poles, const TColStd_Array1OfReal * Weights, gp_Pnt & Point);

		/****************** CoefsD0 ******************/
		/**** md5 signature: 39bdd7ed41460b8569726669dbd4e7bb ****/
		%feature("compactdefaultargs") CoefsD0;
		%feature("autodoc", "Calls cached0 for bezier curves arrays computed with the method polescoefficients. warning: to be used for beziercurves only!!!.

Parameters
----------
U: float
Poles: TColgp_Array1OfPnt2d
Weights: TColStd_Array1OfReal *
Point: gp_Pnt2d

Returns
-------
None
") CoefsD0;
		static void CoefsD0(const Standard_Real U, const TColgp_Array1OfPnt2d & Poles, const TColStd_Array1OfReal * Weights, gp_Pnt2d & Point);

		/****************** CoefsD1 ******************/
		/**** md5 signature: 3242be6bc01e487f3d616e7a4fc09f58 ****/
		%feature("compactdefaultargs") CoefsD1;
		%feature("autodoc", "Calls cached1 for bezier curves arrays computed with the method polescoefficients. warning: to be used for beziercurves only!!!.

Parameters
----------
U: float
Poles: TColgp_Array1OfPnt
Weights: TColStd_Array1OfReal *
Point: gp_Pnt
Vec: gp_Vec

Returns
-------
None
") CoefsD1;
		static void CoefsD1(const Standard_Real U, const TColgp_Array1OfPnt & Poles, const TColStd_Array1OfReal * Weights, gp_Pnt & Point, gp_Vec & Vec);

		/****************** CoefsD1 ******************/
		/**** md5 signature: 003fec260a51b66354e299192f1a2acb ****/
		%feature("compactdefaultargs") CoefsD1;
		%feature("autodoc", "Calls cached1 for bezier curves arrays computed with the method polescoefficients. warning: to be used for beziercurves only!!!.

Parameters
----------
U: float
Poles: TColgp_Array1OfPnt2d
Weights: TColStd_Array1OfReal *
Point: gp_Pnt2d
Vec: gp_Vec2d

Returns
-------
None
") CoefsD1;
		static void CoefsD1(const Standard_Real U, const TColgp_Array1OfPnt2d & Poles, const TColStd_Array1OfReal * Weights, gp_Pnt2d & Point, gp_Vec2d & Vec);

		/****************** CoefsD2 ******************/
		/**** md5 signature: a760925979becb0846798bef7d4517a1 ****/
		%feature("compactdefaultargs") CoefsD2;
		%feature("autodoc", "Calls cached1 for bezier curves arrays computed with the method polescoefficients. warning: to be used for beziercurves only!!!.

Parameters
----------
U: float
Poles: TColgp_Array1OfPnt
Weights: TColStd_Array1OfReal *
Point: gp_Pnt
Vec1: gp_Vec
Vec2: gp_Vec

Returns
-------
None
") CoefsD2;
		static void CoefsD2(const Standard_Real U, const TColgp_Array1OfPnt & Poles, const TColStd_Array1OfReal * Weights, gp_Pnt & Point, gp_Vec & Vec1, gp_Vec & Vec2);

		/****************** CoefsD2 ******************/
		/**** md5 signature: 457c4121231654d520b6b729f5ded246 ****/
		%feature("compactdefaultargs") CoefsD2;
		%feature("autodoc", "Calls cached1 for bezier curves arrays computed with the method polescoefficients. warning: to be used for beziercurves only!!!.

Parameters
----------
U: float
Poles: TColgp_Array1OfPnt2d
Weights: TColStd_Array1OfReal *
Point: gp_Pnt2d
Vec1: gp_Vec2d
Vec2: gp_Vec2d

Returns
-------
None
") CoefsD2;
		static void CoefsD2(const Standard_Real U, const TColgp_Array1OfPnt2d & Poles, const TColStd_Array1OfReal * Weights, gp_Pnt2d & Point, gp_Vec2d & Vec1, gp_Vec2d & Vec2);

		/****************** CoefsD3 ******************/
		/**** md5 signature: c6ad727e15781fe3ca510ef85b7cfc4c ****/
		%feature("compactdefaultargs") CoefsD3;
		%feature("autodoc", "Calls cached1 for bezier curves arrays computed with the method polescoefficients. warning: to be used for beziercurves only!!!.

Parameters
----------
U: float
Poles: TColgp_Array1OfPnt
Weights: TColStd_Array1OfReal *
Point: gp_Pnt
Vec1: gp_Vec
Vec2: gp_Vec
Vec3: gp_Vec

Returns
-------
None
") CoefsD3;
		static void CoefsD3(const Standard_Real U, const TColgp_Array1OfPnt & Poles, const TColStd_Array1OfReal * Weights, gp_Pnt & Point, gp_Vec & Vec1, gp_Vec & Vec2, gp_Vec & Vec3);

		/****************** CoefsD3 ******************/
		/**** md5 signature: 6f91ff262a63e5b085eae5793d90d147 ****/
		%feature("compactdefaultargs") CoefsD3;
		%feature("autodoc", "Calls cached1 for bezier curves arrays computed with the method polescoefficients. warning: to be used for beziercurves only!!!.

Parameters
----------
U: float
Poles: TColgp_Array1OfPnt2d
Weights: TColStd_Array1OfReal *
Point: gp_Pnt2d
Vec1: gp_Vec2d
Vec2: gp_Vec2d
Vec3: gp_Vec2d

Returns
-------
None
") CoefsD3;
		static void CoefsD3(const Standard_Real U, const TColgp_Array1OfPnt2d & Poles, const TColStd_Array1OfReal * Weights, gp_Pnt2d & Point, gp_Vec2d & Vec1, gp_Vec2d & Vec2, gp_Vec2d & Vec3);

		/****************** D0 ******************/
		/**** md5 signature: 7561aecd85a8c1fd870660e7b2329d8c ****/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "No available documentation.

Parameters
----------
U: float
Index: int
Degree: int
Periodic: bool
Poles: TColStd_Array1OfReal
Weights: TColStd_Array1OfReal *
Knots: TColStd_Array1OfReal
Mults: TColStd_Array1OfInteger *

Returns
-------
P: float
") D0;
		static void D0(const Standard_Real U, const Standard_Integer Index, const Standard_Integer Degree, const Standard_Boolean Periodic, const TColStd_Array1OfReal & Poles, const TColStd_Array1OfReal * Weights, const TColStd_Array1OfReal & Knots, const TColStd_Array1OfInteger * Mults, Standard_Real &OutValue);

		/****************** D0 ******************/
		/**** md5 signature: 5a86ac63b280d12dc49149ab86701593 ****/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "No available documentation.

Parameters
----------
U: float
Index: int
Degree: int
Periodic: bool
Poles: TColgp_Array1OfPnt
Weights: TColStd_Array1OfReal *
Knots: TColStd_Array1OfReal
Mults: TColStd_Array1OfInteger *
P: gp_Pnt

Returns
-------
None
") D0;
		static void D0(const Standard_Real U, const Standard_Integer Index, const Standard_Integer Degree, const Standard_Boolean Periodic, const TColgp_Array1OfPnt & Poles, const TColStd_Array1OfReal * Weights, const TColStd_Array1OfReal & Knots, const TColStd_Array1OfInteger * Mults, gp_Pnt & P);

		/****************** D0 ******************/
		/**** md5 signature: 732828ed2bf7b4c8007607b33b5017e6 ****/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "No available documentation.

Parameters
----------
U: float
UIndex: int
Degree: int
Periodic: bool
Poles: TColgp_Array1OfPnt2d
Weights: TColStd_Array1OfReal *
Knots: TColStd_Array1OfReal
Mults: TColStd_Array1OfInteger *
P: gp_Pnt2d

Returns
-------
None
") D0;
		static void D0(const Standard_Real U, const Standard_Integer UIndex, const Standard_Integer Degree, const Standard_Boolean Periodic, const TColgp_Array1OfPnt2d & Poles, const TColStd_Array1OfReal * Weights, const TColStd_Array1OfReal & Knots, const TColStd_Array1OfInteger * Mults, gp_Pnt2d & P);

		/****************** D0 ******************/
		/**** md5 signature: 33d3e7f80011e8d41cfdf3310bf2746b ****/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "No available documentation.

Parameters
----------
U: float
Poles: TColgp_Array1OfPnt
Weights: TColStd_Array1OfReal *
P: gp_Pnt

Returns
-------
None
") D0;
		static void D0(const Standard_Real U, const TColgp_Array1OfPnt & Poles, const TColStd_Array1OfReal * Weights, gp_Pnt & P);

		/****************** D0 ******************/
		/**** md5 signature: 1ec2056c99d3c27e743528d574bd1b08 ****/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "No available documentation.

Parameters
----------
U: float
Poles: TColgp_Array1OfPnt2d
Weights: TColStd_Array1OfReal *
P: gp_Pnt2d

Returns
-------
None
") D0;
		static void D0(const Standard_Real U, const TColgp_Array1OfPnt2d & Poles, const TColStd_Array1OfReal * Weights, gp_Pnt2d & P);

		/****************** D1 ******************/
		/**** md5 signature: c5d4a5a42567bcbaa42a3a45f7913898 ****/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "No available documentation.

Parameters
----------
U: float
Index: int
Degree: int
Periodic: bool
Poles: TColStd_Array1OfReal
Weights: TColStd_Array1OfReal *
Knots: TColStd_Array1OfReal
Mults: TColStd_Array1OfInteger *

Returns
-------
P: float
V: float
") D1;
		static void D1(const Standard_Real U, const Standard_Integer Index, const Standard_Integer Degree, const Standard_Boolean Periodic, const TColStd_Array1OfReal & Poles, const TColStd_Array1OfReal * Weights, const TColStd_Array1OfReal & Knots, const TColStd_Array1OfInteger * Mults, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** D1 ******************/
		/**** md5 signature: 8a5113bc308ff33804f33bdc1ed608ba ****/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "No available documentation.

Parameters
----------
U: float
Index: int
Degree: int
Periodic: bool
Poles: TColgp_Array1OfPnt
Weights: TColStd_Array1OfReal *
Knots: TColStd_Array1OfReal
Mults: TColStd_Array1OfInteger *
P: gp_Pnt
V: gp_Vec

Returns
-------
None
") D1;
		static void D1(const Standard_Real U, const Standard_Integer Index, const Standard_Integer Degree, const Standard_Boolean Periodic, const TColgp_Array1OfPnt & Poles, const TColStd_Array1OfReal * Weights, const TColStd_Array1OfReal & Knots, const TColStd_Array1OfInteger * Mults, gp_Pnt & P, gp_Vec & V);

		/****************** D1 ******************/
		/**** md5 signature: fd089236138b75127a4ad6b78bc6e10c ****/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "No available documentation.

Parameters
----------
U: float
UIndex: int
Degree: int
Periodic: bool
Poles: TColgp_Array1OfPnt2d
Weights: TColStd_Array1OfReal *
Knots: TColStd_Array1OfReal
Mults: TColStd_Array1OfInteger *
P: gp_Pnt2d
V: gp_Vec2d

Returns
-------
None
") D1;
		static void D1(const Standard_Real U, const Standard_Integer UIndex, const Standard_Integer Degree, const Standard_Boolean Periodic, const TColgp_Array1OfPnt2d & Poles, const TColStd_Array1OfReal * Weights, const TColStd_Array1OfReal & Knots, const TColStd_Array1OfInteger * Mults, gp_Pnt2d & P, gp_Vec2d & V);

		/****************** D1 ******************/
		/**** md5 signature: 87bba8d0c8b6927eb3568c326fc6fb48 ****/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "No available documentation.

Parameters
----------
U: float
Poles: TColgp_Array1OfPnt
Weights: TColStd_Array1OfReal *
P: gp_Pnt
V: gp_Vec

Returns
-------
None
") D1;
		static void D1(const Standard_Real U, const TColgp_Array1OfPnt & Poles, const TColStd_Array1OfReal * Weights, gp_Pnt & P, gp_Vec & V);

		/****************** D1 ******************/
		/**** md5 signature: 3b7b11ae9a40e85d080202fc6a53897a ****/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "No available documentation.

Parameters
----------
U: float
Poles: TColgp_Array1OfPnt2d
Weights: TColStd_Array1OfReal *
P: gp_Pnt2d
V: gp_Vec2d

Returns
-------
None
") D1;
		static void D1(const Standard_Real U, const TColgp_Array1OfPnt2d & Poles, const TColStd_Array1OfReal * Weights, gp_Pnt2d & P, gp_Vec2d & V);

		/****************** D2 ******************/
		/**** md5 signature: 687cea2fb0236f24716895fa76c91fd2 ****/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "No available documentation.

Parameters
----------
U: float
Index: int
Degree: int
Periodic: bool
Poles: TColStd_Array1OfReal
Weights: TColStd_Array1OfReal *
Knots: TColStd_Array1OfReal
Mults: TColStd_Array1OfInteger *

Returns
-------
P: float
V1: float
V2: float
") D2;
		static void D2(const Standard_Real U, const Standard_Integer Index, const Standard_Integer Degree, const Standard_Boolean Periodic, const TColStd_Array1OfReal & Poles, const TColStd_Array1OfReal * Weights, const TColStd_Array1OfReal & Knots, const TColStd_Array1OfInteger * Mults, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** D2 ******************/
		/**** md5 signature: b73abb803e141f8dc4ec09df17e4c50e ****/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "No available documentation.

Parameters
----------
U: float
Index: int
Degree: int
Periodic: bool
Poles: TColgp_Array1OfPnt
Weights: TColStd_Array1OfReal *
Knots: TColStd_Array1OfReal
Mults: TColStd_Array1OfInteger *
P: gp_Pnt
V1: gp_Vec
V2: gp_Vec

Returns
-------
None
") D2;
		static void D2(const Standard_Real U, const Standard_Integer Index, const Standard_Integer Degree, const Standard_Boolean Periodic, const TColgp_Array1OfPnt & Poles, const TColStd_Array1OfReal * Weights, const TColStd_Array1OfReal & Knots, const TColStd_Array1OfInteger * Mults, gp_Pnt & P, gp_Vec & V1, gp_Vec & V2);

		/****************** D2 ******************/
		/**** md5 signature: 6058645d1d031db231dada3d3a54b986 ****/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "No available documentation.

Parameters
----------
U: float
UIndex: int
Degree: int
Periodic: bool
Poles: TColgp_Array1OfPnt2d
Weights: TColStd_Array1OfReal *
Knots: TColStd_Array1OfReal
Mults: TColStd_Array1OfInteger *
P: gp_Pnt2d
V1: gp_Vec2d
V2: gp_Vec2d

Returns
-------
None
") D2;
		static void D2(const Standard_Real U, const Standard_Integer UIndex, const Standard_Integer Degree, const Standard_Boolean Periodic, const TColgp_Array1OfPnt2d & Poles, const TColStd_Array1OfReal * Weights, const TColStd_Array1OfReal & Knots, const TColStd_Array1OfInteger * Mults, gp_Pnt2d & P, gp_Vec2d & V1, gp_Vec2d & V2);

		/****************** D2 ******************/
		/**** md5 signature: 63365348497a5b480b7839c0964e9d2e ****/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "No available documentation.

Parameters
----------
U: float
Poles: TColgp_Array1OfPnt
Weights: TColStd_Array1OfReal *
P: gp_Pnt
V1: gp_Vec
V2: gp_Vec

Returns
-------
None
") D2;
		static void D2(const Standard_Real U, const TColgp_Array1OfPnt & Poles, const TColStd_Array1OfReal * Weights, gp_Pnt & P, gp_Vec & V1, gp_Vec & V2);

		/****************** D2 ******************/
		/**** md5 signature: 8f777be84c1d31a5bc0c3ddef76c70c5 ****/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "No available documentation.

Parameters
----------
U: float
Poles: TColgp_Array1OfPnt2d
Weights: TColStd_Array1OfReal *
P: gp_Pnt2d
V1: gp_Vec2d
V2: gp_Vec2d

Returns
-------
None
") D2;
		static void D2(const Standard_Real U, const TColgp_Array1OfPnt2d & Poles, const TColStd_Array1OfReal * Weights, gp_Pnt2d & P, gp_Vec2d & V1, gp_Vec2d & V2);

		/****************** D3 ******************/
		/**** md5 signature: 8e56e662476d83277aff218518c2783b ****/
		%feature("compactdefaultargs") D3;
		%feature("autodoc", "No available documentation.

Parameters
----------
U: float
Index: int
Degree: int
Periodic: bool
Poles: TColStd_Array1OfReal
Weights: TColStd_Array1OfReal *
Knots: TColStd_Array1OfReal
Mults: TColStd_Array1OfInteger *

Returns
-------
P: float
V1: float
V2: float
V3: float
") D3;
		static void D3(const Standard_Real U, const Standard_Integer Index, const Standard_Integer Degree, const Standard_Boolean Periodic, const TColStd_Array1OfReal & Poles, const TColStd_Array1OfReal * Weights, const TColStd_Array1OfReal & Knots, const TColStd_Array1OfInteger * Mults, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** D3 ******************/
		/**** md5 signature: 7c47b7eb8d5b8d180c4d45228f81647c ****/
		%feature("compactdefaultargs") D3;
		%feature("autodoc", "No available documentation.

Parameters
----------
U: float
Index: int
Degree: int
Periodic: bool
Poles: TColgp_Array1OfPnt
Weights: TColStd_Array1OfReal *
Knots: TColStd_Array1OfReal
Mults: TColStd_Array1OfInteger *
P: gp_Pnt
V1: gp_Vec
V2: gp_Vec
V3: gp_Vec

Returns
-------
None
") D3;
		static void D3(const Standard_Real U, const Standard_Integer Index, const Standard_Integer Degree, const Standard_Boolean Periodic, const TColgp_Array1OfPnt & Poles, const TColStd_Array1OfReal * Weights, const TColStd_Array1OfReal & Knots, const TColStd_Array1OfInteger * Mults, gp_Pnt & P, gp_Vec & V1, gp_Vec & V2, gp_Vec & V3);

		/****************** D3 ******************/
		/**** md5 signature: 81bfef3adc8c0544d61a9b166341c5c9 ****/
		%feature("compactdefaultargs") D3;
		%feature("autodoc", "No available documentation.

Parameters
----------
U: float
UIndex: int
Degree: int
Periodic: bool
Poles: TColgp_Array1OfPnt2d
Weights: TColStd_Array1OfReal *
Knots: TColStd_Array1OfReal
Mults: TColStd_Array1OfInteger *
P: gp_Pnt2d
V1: gp_Vec2d
V2: gp_Vec2d
V3: gp_Vec2d

Returns
-------
None
") D3;
		static void D3(const Standard_Real U, const Standard_Integer UIndex, const Standard_Integer Degree, const Standard_Boolean Periodic, const TColgp_Array1OfPnt2d & Poles, const TColStd_Array1OfReal * Weights, const TColStd_Array1OfReal & Knots, const TColStd_Array1OfInteger * Mults, gp_Pnt2d & P, gp_Vec2d & V1, gp_Vec2d & V2, gp_Vec2d & V3);

		/****************** D3 ******************/
		/**** md5 signature: f0a77f2c8079c2632af45d55df4473cb ****/
		%feature("compactdefaultargs") D3;
		%feature("autodoc", "No available documentation.

Parameters
----------
U: float
Poles: TColgp_Array1OfPnt
Weights: TColStd_Array1OfReal *
P: gp_Pnt
V1: gp_Vec
V2: gp_Vec
V3: gp_Vec

Returns
-------
None
") D3;
		static void D3(const Standard_Real U, const TColgp_Array1OfPnt & Poles, const TColStd_Array1OfReal * Weights, gp_Pnt & P, gp_Vec & V1, gp_Vec & V2, gp_Vec & V3);

		/****************** D3 ******************/
		/**** md5 signature: 3d0d0bbd88ac150dc6372f46c6dabd3e ****/
		%feature("compactdefaultargs") D3;
		%feature("autodoc", "No available documentation.

Parameters
----------
U: float
Poles: TColgp_Array1OfPnt2d
Weights: TColStd_Array1OfReal *
P: gp_Pnt2d
V1: gp_Vec2d
V2: gp_Vec2d
V3: gp_Vec2d

Returns
-------
None
") D3;
		static void D3(const Standard_Real U, const TColgp_Array1OfPnt2d & Poles, const TColStd_Array1OfReal * Weights, gp_Pnt2d & P, gp_Vec2d & V1, gp_Vec2d & V2, gp_Vec2d & V3);

		/****************** Derivative ******************/
		/**** md5 signature: 3e05b06fef7b008a06c0d9da82c6a38b ****/
		%feature("compactdefaultargs") Derivative;
		%feature("autodoc", "Computes the poles of the bspline giving the derivatives of order <order>. //! the formula for the first order is //! pole(i) = degree * (pole(i+1) - pole(i)) / (knots(i+degree+1) - knots(i+1)) //! this formula is repeated (degree is decremented at each step).

Parameters
----------
Degree: int
Dimension: int
Length: int
Order: int

Returns
-------
Knots: float
Poles: float
") Derivative;
		static void Derivative(const Standard_Integer Degree, Standard_Real &OutValue, const Standard_Integer Dimension, const Standard_Integer Length, const Standard_Integer Order, Standard_Real &OutValue);

		/****************** Eval ******************/
		/**** md5 signature: 306d3d56ab8e2e7587db79730d72385e ****/
		%feature("compactdefaultargs") Eval;
		%feature("autodoc", "Perform the boor algorithm to evaluate a point at parameter <u>, with <degree> and <dimension>. //! poles is an array of reals of size //! <dimension> * <degree>+1 //! containing the poles. at the end <poles> contains the current point.

Parameters
----------
U: float
Degree: int
Dimension: int

Returns
-------
Knots: float
Poles: float
") Eval;
		static void Eval(const Standard_Real U, const Standard_Integer Degree, Standard_Real &OutValue, const Standard_Integer Dimension, Standard_Real &OutValue);

		/****************** Eval ******************/
		/**** md5 signature: 2650b9a2ce8101d2c64b1aa2dc7230ed ****/
		%feature("compactdefaultargs") Eval;
		%feature("autodoc", "Perform the de boor algorithm to evaluate a point at parameter <u>, with <degree> and <dimension>. //! poles is an array of reals of size //! <dimension> * <degree>+1 //! containing the poles. at the end <poles> contains the current point. poles contain all the poles of the bsplinecurve, knots also contains all the knots of the bsplinecurve. extrapmode has two slots [0] = degree used to extrapolate before the first knot [1] = degre used to extrapolate after the last knot has to be between 1 and degree.

Parameters
----------
U: float
PeriodicFlag: bool
DerivativeRequest: int
Degree: int
FlatKnots: TColStd_Array1OfReal
ArrayDimension: int

Returns
-------
ExtrapMode: int
Poles: float
Result: float
") Eval;
		static void Eval(const Standard_Real U, const Standard_Boolean PeriodicFlag, const Standard_Integer DerivativeRequest, Standard_Integer &OutValue, const Standard_Integer Degree, const TColStd_Array1OfReal & FlatKnots, const Standard_Integer ArrayDimension, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** Eval ******************/
		/**** md5 signature: f042995c54d6c67df7af737079f079ff ****/
		%feature("compactdefaultargs") Eval;
		%feature("autodoc", "Perform the de boor algorithm to evaluate a point at parameter <u>, with <degree> and <dimension>. evaluates by multiplying the poles by the weights and gives the homogeneous result in polesresult that is the results of the evaluation of the numerator once it has been multiplied by the weights and in weightsresult one has the result of the evaluation of the denominator //! warning: <polesresult> and <weightsresult> must be dimensionned properly.

Parameters
----------
U: float
PeriodicFlag: bool
DerivativeRequest: int
Degree: int
FlatKnots: TColStd_Array1OfReal
ArrayDimension: int

Returns
-------
ExtrapMode: int
Poles: float
Weights: float
PolesResult: float
WeightsResult: float
") Eval;
		static void Eval(const Standard_Real U, const Standard_Boolean PeriodicFlag, const Standard_Integer DerivativeRequest, Standard_Integer &OutValue, const Standard_Integer Degree, const TColStd_Array1OfReal & FlatKnots, const Standard_Integer ArrayDimension, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** Eval ******************/
		/**** md5 signature: a0af3768f3f3d4eaf53ad9e5d73e72ef ****/
		%feature("compactdefaultargs") Eval;
		%feature("autodoc", "Perform the evaluation of the bspline basis and then multiplies by the weights this just evaluates the current point.

Parameters
----------
U: float
PeriodicFlag: bool
HomogeneousFlag: bool
Degree: int
FlatKnots: TColStd_Array1OfReal
Poles: TColgp_Array1OfPnt
Weights: TColStd_Array1OfReal
Point: gp_Pnt

Returns
-------
ExtrapMode: int
Weight: float
") Eval;
		static void Eval(const Standard_Real U, const Standard_Boolean PeriodicFlag, const Standard_Boolean HomogeneousFlag, Standard_Integer &OutValue, const Standard_Integer Degree, const TColStd_Array1OfReal & FlatKnots, const TColgp_Array1OfPnt & Poles, const TColStd_Array1OfReal & Weights, gp_Pnt & Point, Standard_Real &OutValue);

		/****************** Eval ******************/
		/**** md5 signature: c2a3f21e913c7b4f811014d264cd4acd ****/
		%feature("compactdefaultargs") Eval;
		%feature("autodoc", "Perform the evaluation of the bspline basis and then multiplies by the weights this just evaluates the current point.

Parameters
----------
U: float
PeriodicFlag: bool
HomogeneousFlag: bool
Degree: int
FlatKnots: TColStd_Array1OfReal
Poles: TColgp_Array1OfPnt2d
Weights: TColStd_Array1OfReal
Point: gp_Pnt2d

Returns
-------
ExtrapMode: int
Weight: float
") Eval;
		static void Eval(const Standard_Real U, const Standard_Boolean PeriodicFlag, const Standard_Boolean HomogeneousFlag, Standard_Integer &OutValue, const Standard_Integer Degree, const TColStd_Array1OfReal & FlatKnots, const TColgp_Array1OfPnt2d & Poles, const TColStd_Array1OfReal & Weights, gp_Pnt2d & Point, Standard_Real &OutValue);

		/****************** EvalBsplineBasis ******************/
		/**** md5 signature: 5ffbb07031177e5863ba3c71b6dfceec ****/
		%feature("compactdefaultargs") EvalBsplineBasis;
		%feature("autodoc", "This evaluates the bspline basis at a given parameter parameter up to the requested derivativeorder and store the result in the array bsplinebasis in the following fashion bsplinebasis(1,1) = value of first non vanishing bspline function which has index firstnonzerobsplineindex bsplinebasis(1,2) = value of second non vanishing bspline function which has index firstnonzerobsplineindex + 1 bsplinebasis(1,n) = value of second non vanishing non vanishing bspline function which has index firstnonzerobsplineindex + n (n <= order) bsplinebasis(2,1) = value of derivative of first non vanishing bspline function which has index firstnonzerobsplineindex bsplinebasis(n,1) = value of nth derivative of first non vanishing bspline function which has index firstnonzerobsplineindex if n <= derivativeorder + 1.

Parameters
----------
DerivativeOrder: int
Order: int
FlatKnots: TColStd_Array1OfReal
Parameter: float
BsplineBasis: math_Matrix
isPeriodic: bool,optional
	default value is Standard_False

Returns
-------
FirstNonZeroBsplineIndex: int
") EvalBsplineBasis;
		static Standard_Integer EvalBsplineBasis(const Standard_Integer DerivativeOrder, const Standard_Integer Order, const TColStd_Array1OfReal & FlatKnots, const Standard_Real Parameter, Standard_Integer &OutValue, math_Matrix & BsplineBasis, const Standard_Boolean isPeriodic = Standard_False);

		/****************** FactorBandedMatrix ******************/
		/**** md5 signature: b32ee44a28437467b4b6bb1b6f9ef4d0 ****/
		%feature("compactdefaultargs") FactorBandedMatrix;
		%feature("autodoc", "This factors the banded matrix in the lu form with a banded storage of components of the l matrix warning : do not use if the matrix is totally positive (it is the case for bspline matrices build as above with parameters being the schoenberg points.

Parameters
----------
Matrix: math_Matrix
UpperBandWidth: int
LowerBandWidth: int

Returns
-------
PivotIndexProblem: int
") FactorBandedMatrix;
		static Standard_Integer FactorBandedMatrix(math_Matrix & Matrix, const Standard_Integer UpperBandWidth, const Standard_Integer LowerBandWidth, Standard_Integer &OutValue);

		/****************** FirstUKnotIndex ******************/
		/**** md5 signature: 4eeb8b33949edada004187702b6be02a ****/
		%feature("compactdefaultargs") FirstUKnotIndex;
		%feature("autodoc", "Computes the index of the knots value which gives the start point of the curve.

Parameters
----------
Degree: int
Mults: TColStd_Array1OfInteger

Returns
-------
int
") FirstUKnotIndex;
		static Standard_Integer FirstUKnotIndex(const Standard_Integer Degree, const TColStd_Array1OfInteger & Mults);

		/****************** FlatBezierKnots ******************/
		/**** md5 signature: 7b813d4199ab162a9445b273d2d7855c ****/
		%feature("compactdefaultargs") FlatBezierKnots;
		%feature("autodoc", "Returns pointer to statically allocated array representing flat knots for bezier curve of the specified degree. raises outofrange if degree > maxdegree().

Parameters
----------
Degree: int

Returns
-------
float
") FlatBezierKnots;
		static const Standard_Real & FlatBezierKnots(const Standard_Integer Degree);

		/****************** FlatIndex ******************/
		/**** md5 signature: 04b9aa70b2a79e8eac7af6620d71a81c ****/
		%feature("compactdefaultargs") FlatIndex;
		%feature("autodoc", "Computes the index of the flats knots sequence corresponding to <index> in the knots sequence which multiplicities are <mults>.

Parameters
----------
Degree: int
Index: int
Mults: TColStd_Array1OfInteger
Periodic: bool

Returns
-------
int
") FlatIndex;
		static Standard_Integer FlatIndex(const Standard_Integer Degree, const Standard_Integer Index, const TColStd_Array1OfInteger & Mults, const Standard_Boolean Periodic);

		/****************** FunctionMultiply ******************/
		/**** md5 signature: d11350ab30e3e1a830d351b4bb9b3c45 ****/
		%feature("compactdefaultargs") FunctionMultiply;
		%feature("autodoc", "This will multiply a given vectorial bspline f(t) defined by its bsplinedegree and bsplineflatknotsl, its poles array which are coded as an array of real of the form [1..numpoles][1..polesdimension] by a function a(t) which is assumed to satisfy the following : 1. a(t) * f(t) is a polynomial bspline that can be expressed exactly as a bspline of degree newdegree on the knots flatknots 2. the range of a(t) is the same as the range of f(t) warning: it is the caller's responsability to insure that conditions 1. and 2. above are satisfied : no check whatsoever is made in this method thestatus will return 0 if ok else it will return the pivot index of the matrix that was inverted to compute the multiplied bspline : the method used is interpolation at schoenenberg points of a(t)*f(t).

Parameters
----------
Function: BSplCLib_EvaluatorFunction
BSplineDegree: int
BSplineFlatKnots: TColStd_Array1OfReal
PolesDimension: int
FlatKnots: TColStd_Array1OfReal
NewDegree: int

Returns
-------
Poles: float
NewPoles: float
theStatus: int
") FunctionMultiply;
		static void FunctionMultiply(const BSplCLib_EvaluatorFunction & Function, const Standard_Integer BSplineDegree, const TColStd_Array1OfReal & BSplineFlatKnots, const Standard_Integer PolesDimension, Standard_Real &OutValue, const TColStd_Array1OfReal & FlatKnots, const Standard_Integer NewDegree, Standard_Real &OutValue, Standard_Integer &OutValue);

		/****************** FunctionMultiply ******************/
		/**** md5 signature: b75e7664cfee0abd3a4bb0f96527f5f0 ****/
		%feature("compactdefaultargs") FunctionMultiply;
		%feature("autodoc", "This will multiply a given vectorial bspline f(t) defined by its bsplinedegree and bsplineflatknotsl, its poles array which are coded as an array of real of the form [1..numpoles][1..polesdimension] by a function a(t) which is assumed to satisfy the following : 1. a(t) * f(t) is a polynomial bspline that can be expressed exactly as a bspline of degree newdegree on the knots flatknots 2. the range of a(t) is the same as the range of f(t) warning: it is the caller's responsability to insure that conditions 1. and 2. above are satisfied : no check whatsoever is made in this method thestatus will return 0 if ok else it will return the pivot index of the matrix that was inverted to compute the multiplied bspline : the method used is interpolation at schoenenberg points of a(t)*f(t).

Parameters
----------
Function: BSplCLib_EvaluatorFunction
BSplineDegree: int
BSplineFlatKnots: TColStd_Array1OfReal
Poles: TColStd_Array1OfReal
FlatKnots: TColStd_Array1OfReal
NewDegree: int
NewPoles: TColStd_Array1OfReal

Returns
-------
theStatus: int
") FunctionMultiply;
		static void FunctionMultiply(const BSplCLib_EvaluatorFunction & Function, const Standard_Integer BSplineDegree, const TColStd_Array1OfReal & BSplineFlatKnots, const TColStd_Array1OfReal & Poles, const TColStd_Array1OfReal & FlatKnots, const Standard_Integer NewDegree, TColStd_Array1OfReal & NewPoles, Standard_Integer &OutValue);

		/****************** FunctionMultiply ******************/
		/**** md5 signature: 304af15d568488c4302864bfd1fe935b ****/
		%feature("compactdefaultargs") FunctionMultiply;
		%feature("autodoc", "This will multiply a given vectorial bspline f(t) defined by its bsplinedegree and bsplineflatknotsl, its poles array which are coded as an array of real of the form [1..numpoles][1..polesdimension] by a function a(t) which is assumed to satisfy the following : 1. a(t) * f(t) is a polynomial bspline that can be expressed exactly as a bspline of degree newdegree on the knots flatknots 2. the range of a(t) is the same as the range of f(t) warning: it is the caller's responsability to insure that conditions 1. and 2. above are satisfied : no check whatsoever is made in this method thestatus will return 0 if ok else it will return the pivot index of the matrix that was inverted to compute the multiplied bspline : the method used is interpolation at schoenenberg points of a(t)*f(t).

Parameters
----------
Function: BSplCLib_EvaluatorFunction
BSplineDegree: int
BSplineFlatKnots: TColStd_Array1OfReal
Poles: TColgp_Array1OfPnt2d
FlatKnots: TColStd_Array1OfReal
NewDegree: int
NewPoles: TColgp_Array1OfPnt2d

Returns
-------
theStatus: int
") FunctionMultiply;
		static void FunctionMultiply(const BSplCLib_EvaluatorFunction & Function, const Standard_Integer BSplineDegree, const TColStd_Array1OfReal & BSplineFlatKnots, const TColgp_Array1OfPnt2d & Poles, const TColStd_Array1OfReal & FlatKnots, const Standard_Integer NewDegree, TColgp_Array1OfPnt2d & NewPoles, Standard_Integer &OutValue);

		/****************** FunctionMultiply ******************/
		/**** md5 signature: 2d5b01a1995bf4a63b4ac71a00fa384d ****/
		%feature("compactdefaultargs") FunctionMultiply;
		%feature("autodoc", "This will multiply a given vectorial bspline f(t) defined by its bsplinedegree and bsplineflatknotsl, its poles array which are coded as an array of real of the form [1..numpoles][1..polesdimension] by a function a(t) which is assumed to satisfy the following : 1. a(t) * f(t) is a polynomial bspline that can be expressed exactly as a bspline of degree newdegree on the knots flatknots 2. the range of a(t) is the same as the range of f(t) warning: it is the caller's responsability to insure that conditions 1. and 2. above are satisfied : no check whatsoever is made in this method thestatus will return 0 if ok else it will return the pivot index of the matrix that was inverted to compute the multiplied bspline : the method used is interpolation at schoenenberg points of a(t)*f(t).

Parameters
----------
Function: BSplCLib_EvaluatorFunction
BSplineDegree: int
BSplineFlatKnots: TColStd_Array1OfReal
Poles: TColgp_Array1OfPnt
FlatKnots: TColStd_Array1OfReal
NewDegree: int
NewPoles: TColgp_Array1OfPnt

Returns
-------
theStatus: int
") FunctionMultiply;
		static void FunctionMultiply(const BSplCLib_EvaluatorFunction & Function, const Standard_Integer BSplineDegree, const TColStd_Array1OfReal & BSplineFlatKnots, const TColgp_Array1OfPnt & Poles, const TColStd_Array1OfReal & FlatKnots, const Standard_Integer NewDegree, TColgp_Array1OfPnt & NewPoles, Standard_Integer &OutValue);

		/****************** FunctionReparameterise ******************/
		/**** md5 signature: 276c4138358cfb806cbc5e4946b652e7 ****/
		%feature("compactdefaultargs") FunctionReparameterise;
		%feature("autodoc", "This function will compose a given vectorial bspline f(t) defined by its bsplinedegree and bsplineflatknotsl, its poles array which are coded as an array of real of the form [1..numpoles][1..polesdimension] with a function a(t) which is assumed to satisfy the following: //! 1. f(a(t)) is a polynomial bspline that can be expressed exactly as a bspline of degree newdegree on the knots flatknots //! 2. a(t) defines a differentiable isomorphism between the range of flatknots to the range of bsplineflatknots which is the same as the range of f(t) //! warning: it is the caller's responsability to insure that conditions 1. and 2. above are satisfied : no check whatsoever is made in this method //! thestatus will return 0 if ok else it will return the pivot index of the matrix that was inverted to compute the multiplied bspline : the method used is interpolation at schoenenberg points of f(a(t)).

Parameters
----------
Function: BSplCLib_EvaluatorFunction
BSplineDegree: int
BSplineFlatKnots: TColStd_Array1OfReal
PolesDimension: int
FlatKnots: TColStd_Array1OfReal
NewDegree: int

Returns
-------
Poles: float
NewPoles: float
theStatus: int
") FunctionReparameterise;
		static void FunctionReparameterise(const BSplCLib_EvaluatorFunction & Function, const Standard_Integer BSplineDegree, const TColStd_Array1OfReal & BSplineFlatKnots, const Standard_Integer PolesDimension, Standard_Real &OutValue, const TColStd_Array1OfReal & FlatKnots, const Standard_Integer NewDegree, Standard_Real &OutValue, Standard_Integer &OutValue);

		/****************** FunctionReparameterise ******************/
		/**** md5 signature: fff0db2cdbcf124496ae30f263735931 ****/
		%feature("compactdefaultargs") FunctionReparameterise;
		%feature("autodoc", "This function will compose a given vectorial bspline f(t) defined by its bsplinedegree and bsplineflatknotsl, its poles array which are coded as an array of real of the form [1..numpoles][1..polesdimension] with a function a(t) which is assumed to satisfy the following: //! 1. f(a(t)) is a polynomial bspline that can be expressed exactly as a bspline of degree newdegree on the knots flatknots //! 2. a(t) defines a differentiable isomorphism between the range of flatknots to the range of bsplineflatknots which is the same as the range of f(t) //! warning: it is the caller's responsability to insure that conditions 1. and 2. above are satisfied : no check whatsoever is made in this method //! thestatus will return 0 if ok else it will return the pivot index of the matrix that was inverted to compute the multiplied bspline : the method used is interpolation at schoenenberg points of f(a(t)).

Parameters
----------
Function: BSplCLib_EvaluatorFunction
BSplineDegree: int
BSplineFlatKnots: TColStd_Array1OfReal
Poles: TColStd_Array1OfReal
FlatKnots: TColStd_Array1OfReal
NewDegree: int
NewPoles: TColStd_Array1OfReal

Returns
-------
theStatus: int
") FunctionReparameterise;
		static void FunctionReparameterise(const BSplCLib_EvaluatorFunction & Function, const Standard_Integer BSplineDegree, const TColStd_Array1OfReal & BSplineFlatKnots, const TColStd_Array1OfReal & Poles, const TColStd_Array1OfReal & FlatKnots, const Standard_Integer NewDegree, TColStd_Array1OfReal & NewPoles, Standard_Integer &OutValue);

		/****************** FunctionReparameterise ******************/
		/**** md5 signature: 8482a00dea0cf23f29af3cb5e99182ea ****/
		%feature("compactdefaultargs") FunctionReparameterise;
		%feature("autodoc", "This will compose a given vectorial bspline f(t) defined by its bsplinedegree and bsplineflatknotsl, its poles array which are coded as an array of real of the form [1..numpoles][1..polesdimension] with a function a(t) which is assumed to satisfy the following : 1. f(a(t)) is a polynomial bspline that can be expressed exactly as a bspline of degree newdegree on the knots flatknots 2. a(t) defines a differentiable isomorphism between the range of flatknots to the range of bsplineflatknots which is the same as the range of f(t) warning: it is the caller's responsability to insure that conditions 1. and 2. above are satisfied : no check whatsoever is made in this method thestatus will return 0 if ok else it will return the pivot index of the matrix that was inverted to compute the multiplied bspline : the method used is interpolation at schoenenberg points of f(a(t)).

Parameters
----------
Function: BSplCLib_EvaluatorFunction
BSplineDegree: int
BSplineFlatKnots: TColStd_Array1OfReal
Poles: TColgp_Array1OfPnt
FlatKnots: TColStd_Array1OfReal
NewDegree: int
NewPoles: TColgp_Array1OfPnt

Returns
-------
theStatus: int
") FunctionReparameterise;
		static void FunctionReparameterise(const BSplCLib_EvaluatorFunction & Function, const Standard_Integer BSplineDegree, const TColStd_Array1OfReal & BSplineFlatKnots, const TColgp_Array1OfPnt & Poles, const TColStd_Array1OfReal & FlatKnots, const Standard_Integer NewDegree, TColgp_Array1OfPnt & NewPoles, Standard_Integer &OutValue);

		/****************** FunctionReparameterise ******************/
		/**** md5 signature: 0681500ae08b1b57f6b23f3500cf8eb6 ****/
		%feature("compactdefaultargs") FunctionReparameterise;
		%feature("autodoc", "This will compose a given vectorial bspline f(t) defined by its bsplinedegree and bsplineflatknotsl, its poles array which are coded as an array of real of the form [1..numpoles][1..polesdimension] with a function a(t) which is assumed to satisfy the following : 1. f(a(t)) is a polynomial bspline that can be expressed exactly as a bspline of degree newdegree on the knots flatknots 2. a(t) defines a differentiable isomorphism between the range of flatknots to the range of bsplineflatknots which is the same as the range of f(t) warning: it is the caller's responsability to insure that conditions 1. and 2. above are satisfied : no check whatsoever is made in this method thestatus will return 0 if ok else it will return the pivot index of the matrix that was inverted to compute the multiplied bspline : the method used is interpolation at schoenenberg points of f(a(t)).

Parameters
----------
Function: BSplCLib_EvaluatorFunction
BSplineDegree: int
BSplineFlatKnots: TColStd_Array1OfReal
Poles: TColgp_Array1OfPnt2d
FlatKnots: TColStd_Array1OfReal
NewDegree: int
NewPoles: TColgp_Array1OfPnt2d

Returns
-------
theStatus: int
") FunctionReparameterise;
		static void FunctionReparameterise(const BSplCLib_EvaluatorFunction & Function, const Standard_Integer BSplineDegree, const TColStd_Array1OfReal & BSplineFlatKnots, const TColgp_Array1OfPnt2d & Poles, const TColStd_Array1OfReal & FlatKnots, const Standard_Integer NewDegree, TColgp_Array1OfPnt2d & NewPoles, Standard_Integer &OutValue);

		/****************** GetPole ******************/
		/**** md5 signature: 801683e94bd4376a7e09453b2ffdb655 ****/
		%feature("compactdefaultargs") GetPole;
		%feature("autodoc", "Copy the pole at position <index> in the boor scheme of dimension <dimension> to <position> in the array <pole>. <position> is updated.

Parameters
----------
Index: int
Length: int
Depth: int
Dimension: int
Pole: TColStd_Array1OfReal

Returns
-------
LocPoles: float
Position: int
") GetPole;
		static void GetPole(const Standard_Integer Index, const Standard_Integer Length, const Standard_Integer Depth, const Standard_Integer Dimension, Standard_Real &OutValue, Standard_Integer &OutValue, TColStd_Array1OfReal & Pole);

		/****************** Hunt ******************/
		/**** md5 signature: 4314b3314e47859975535fbccf40e912 ****/
		%feature("compactdefaultargs") Hunt;
		%feature("autodoc", "This routine searches the position of the real value thex in the monotonically increasing set of real values thearray using bisection algorithm. //! if the given value is out of range or array values, algorithm returns either thearray.lower()-1 or thearray.upper()+1 depending on thex position in the ordered set. //! this routine is used to locate a knot value in a set of knots.

Parameters
----------
theArray: TColStd_Array1OfReal
theX: float

Returns
-------
theXPos: int
") Hunt;
		static void Hunt(const TColStd_Array1OfReal & theArray, const Standard_Real theX, Standard_Integer &OutValue);

		/****************** IncreaseDegree ******************/
		/**** md5 signature: 3cdd7098cdf1c731c23a659a3dafafad ****/
		%feature("compactdefaultargs") IncreaseDegree;
		%feature("autodoc", "No available documentation.

Parameters
----------
Degree: int
NewDegree: int
Periodic: bool
Dimension: int
Poles: TColStd_Array1OfReal
Knots: TColStd_Array1OfReal
Mults: TColStd_Array1OfInteger
NewPoles: TColStd_Array1OfReal
NewKnots: TColStd_Array1OfReal
NewMults: TColStd_Array1OfInteger

Returns
-------
None
") IncreaseDegree;
		static void IncreaseDegree(const Standard_Integer Degree, const Standard_Integer NewDegree, const Standard_Boolean Periodic, const Standard_Integer Dimension, const TColStd_Array1OfReal & Poles, const TColStd_Array1OfReal & Knots, const TColStd_Array1OfInteger & Mults, TColStd_Array1OfReal & NewPoles, TColStd_Array1OfReal & NewKnots, TColStd_Array1OfInteger & NewMults);

		/****************** IncreaseDegree ******************/
		/**** md5 signature: 9e287ffd60ca2b64f0c80bf8e906f987 ****/
		%feature("compactdefaultargs") IncreaseDegree;
		%feature("autodoc", "No available documentation.

Parameters
----------
Degree: int
NewDegree: int
Periodic: bool
Poles: TColgp_Array1OfPnt
Weights: TColStd_Array1OfReal *
Knots: TColStd_Array1OfReal
Mults: TColStd_Array1OfInteger
NewPoles: TColgp_Array1OfPnt
NewWeights: TColStd_Array1OfReal *
NewKnots: TColStd_Array1OfReal
NewMults: TColStd_Array1OfInteger

Returns
-------
None
") IncreaseDegree;
		static void IncreaseDegree(const Standard_Integer Degree, const Standard_Integer NewDegree, const Standard_Boolean Periodic, const TColgp_Array1OfPnt & Poles, const TColStd_Array1OfReal * Weights, const TColStd_Array1OfReal & Knots, const TColStd_Array1OfInteger & Mults, TColgp_Array1OfPnt & NewPoles, TColStd_Array1OfReal * NewWeights, TColStd_Array1OfReal & NewKnots, TColStd_Array1OfInteger & NewMults);

		/****************** IncreaseDegree ******************/
		/**** md5 signature: de3d7e2f464ecd91afcc95a62f774187 ****/
		%feature("compactdefaultargs") IncreaseDegree;
		%feature("autodoc", "No available documentation.

Parameters
----------
Degree: int
NewDegree: int
Periodic: bool
Poles: TColgp_Array1OfPnt2d
Weights: TColStd_Array1OfReal *
Knots: TColStd_Array1OfReal
Mults: TColStd_Array1OfInteger
NewPoles: TColgp_Array1OfPnt2d
NewWeights: TColStd_Array1OfReal *
NewKnots: TColStd_Array1OfReal
NewMults: TColStd_Array1OfInteger

Returns
-------
None
") IncreaseDegree;
		static void IncreaseDegree(const Standard_Integer Degree, const Standard_Integer NewDegree, const Standard_Boolean Periodic, const TColgp_Array1OfPnt2d & Poles, const TColStd_Array1OfReal * Weights, const TColStd_Array1OfReal & Knots, const TColStd_Array1OfInteger & Mults, TColgp_Array1OfPnt2d & NewPoles, TColStd_Array1OfReal * NewWeights, TColStd_Array1OfReal & NewKnots, TColStd_Array1OfInteger & NewMults);

		/****************** IncreaseDegree ******************/
		/**** md5 signature: 102e348aaf60f52be4a7ee5086788702 ****/
		%feature("compactdefaultargs") IncreaseDegree;
		%feature("autodoc", "No available documentation.

Parameters
----------
NewDegree: int
Poles: TColgp_Array1OfPnt
Weights: TColStd_Array1OfReal *
NewPoles: TColgp_Array1OfPnt
NewWeights: TColStd_Array1OfReal *

Returns
-------
None
") IncreaseDegree;
		static void IncreaseDegree(const Standard_Integer NewDegree, const TColgp_Array1OfPnt & Poles, const TColStd_Array1OfReal * Weights, TColgp_Array1OfPnt & NewPoles, TColStd_Array1OfReal * NewWeights);

		/****************** IncreaseDegree ******************/
		/**** md5 signature: 3184972da800dade86b84a98f59c7c20 ****/
		%feature("compactdefaultargs") IncreaseDegree;
		%feature("autodoc", "Increase the degree of a bspline (or bezier) curve of dimension <dimension> form <degree> to <newdegree>. //! the number of poles in the new curve is : //! poles.length() + (newdegree - degree) * number of spans //! where the number of spans is : //! lastuknotindex(mults) - firstuknotindex(mults) + 1 //! for a non-periodic curve //! and knots.length() - 1 for a periodic curve. //! the multiplicities of all knots are increased by the degree elevation. //! the new knots are usually the same knots with the exception of a non-periodic curve with the first and last multiplicity not equal to degree+1 where knots are removed form the start and the bottom untils the sum of the multiplicities is equal to newdegree+1 at the knots corresponding to the first and last parameters of the curve. //! example : suppose a curve of degree 3 starting with following knots and multiplicities : //! knot : 0. 1. 2. mult : 1 2 1 //! the firstuknot is 2. because the sum of multiplicities is degree+1 : 1 + 2 + 1 = 4 = 3 + 1 //! i.e. the first parameter of the curve is 2. and will still be 2. after degree elevation. let raises this curve to degree 4. the multiplicities are increased by 2. //! they become 2 3 2. but we need a sum of multiplicities of 5 at knot 2. so the first knot is removed and the new knots are : //! knot : 1. 2. mult : 3 2 //! the multipicity of the first knot may also be reduced if the sum is still to big. //! in the most common situations (periodic curve or curve with first and last multiplicities equals to degree+1) the knots are knot changes. //! the method increasedegreecountknots can be used to compute the new number of knots.

Parameters
----------
NewDegree: int
Poles: TColgp_Array1OfPnt2d
Weights: TColStd_Array1OfReal *
NewPoles: TColgp_Array1OfPnt2d
NewWeights: TColStd_Array1OfReal *

Returns
-------
None
") IncreaseDegree;
		static void IncreaseDegree(const Standard_Integer NewDegree, const TColgp_Array1OfPnt2d & Poles, const TColStd_Array1OfReal * Weights, TColgp_Array1OfPnt2d & NewPoles, TColStd_Array1OfReal * NewWeights);

		/****************** IncreaseDegreeCountKnots ******************/
		/**** md5 signature: 2806348fce0f853dcd1a4c2e39086690 ****/
		%feature("compactdefaultargs") IncreaseDegreeCountKnots;
		%feature("autodoc", "Returns the number of knots of a curve with multiplicities <mults> after elevating the degree from <degree> to <newdegree>. see the increasedegree method for more comments.

Parameters
----------
Degree: int
NewDegree: int
Periodic: bool
Mults: TColStd_Array1OfInteger

Returns
-------
int
") IncreaseDegreeCountKnots;
		static Standard_Integer IncreaseDegreeCountKnots(const Standard_Integer Degree, const Standard_Integer NewDegree, const Standard_Boolean Periodic, const TColStd_Array1OfInteger & Mults);

		/****************** InsertKnot ******************/
		/**** md5 signature: b308d7bc26fadeb0415b09f7df66deed ****/
		%feature("compactdefaultargs") InsertKnot;
		%feature("autodoc", "No available documentation.

Parameters
----------
UIndex: int
U: float
UMult: int
Degree: int
Periodic: bool
Poles: TColgp_Array1OfPnt
Weights: TColStd_Array1OfReal *
Knots: TColStd_Array1OfReal
Mults: TColStd_Array1OfInteger
NewPoles: TColgp_Array1OfPnt
NewWeights: TColStd_Array1OfReal *

Returns
-------
None
") InsertKnot;
		static void InsertKnot(const Standard_Integer UIndex, const Standard_Real U, const Standard_Integer UMult, const Standard_Integer Degree, const Standard_Boolean Periodic, const TColgp_Array1OfPnt & Poles, const TColStd_Array1OfReal * Weights, const TColStd_Array1OfReal & Knots, const TColStd_Array1OfInteger & Mults, TColgp_Array1OfPnt & NewPoles, TColStd_Array1OfReal * NewWeights);

		/****************** InsertKnot ******************/
		/**** md5 signature: b3ed0ff475a71d3360f7c4c61b840029 ****/
		%feature("compactdefaultargs") InsertKnot;
		%feature("autodoc", "Insert a new knot u of multiplicity umult in the knot sequence. //! the location of the new knot should be given as an input data. uindex locates the new knot u in the knot sequence and knots (uindex) < u < knots (uindex + 1). //! the new control points corresponding to this insertion are returned. knots and mults are not updated.

Parameters
----------
UIndex: int
U: float
UMult: int
Degree: int
Periodic: bool
Poles: TColgp_Array1OfPnt2d
Weights: TColStd_Array1OfReal *
Knots: TColStd_Array1OfReal
Mults: TColStd_Array1OfInteger
NewPoles: TColgp_Array1OfPnt2d
NewWeights: TColStd_Array1OfReal *

Returns
-------
None
") InsertKnot;
		static void InsertKnot(const Standard_Integer UIndex, const Standard_Real U, const Standard_Integer UMult, const Standard_Integer Degree, const Standard_Boolean Periodic, const TColgp_Array1OfPnt2d & Poles, const TColStd_Array1OfReal * Weights, const TColStd_Array1OfReal & Knots, const TColStd_Array1OfInteger & Mults, TColgp_Array1OfPnt2d & NewPoles, TColStd_Array1OfReal * NewWeights);

		/****************** InsertKnots ******************/
		/**** md5 signature: 013fe81e359b48ad63b87e4971860cb9 ****/
		%feature("compactdefaultargs") InsertKnots;
		%feature("autodoc", "No available documentation.

Parameters
----------
Degree: int
Periodic: bool
Dimension: int
Poles: TColStd_Array1OfReal
Knots: TColStd_Array1OfReal
Mults: TColStd_Array1OfInteger
AddKnots: TColStd_Array1OfReal
AddMults: TColStd_Array1OfInteger *
NewPoles: TColStd_Array1OfReal
NewKnots: TColStd_Array1OfReal
NewMults: TColStd_Array1OfInteger
Epsilon: float
Add: bool,optional
	default value is Standard_True

Returns
-------
None
") InsertKnots;
		static void InsertKnots(const Standard_Integer Degree, const Standard_Boolean Periodic, const Standard_Integer Dimension, const TColStd_Array1OfReal & Poles, const TColStd_Array1OfReal & Knots, const TColStd_Array1OfInteger & Mults, const TColStd_Array1OfReal & AddKnots, const TColStd_Array1OfInteger * AddMults, TColStd_Array1OfReal & NewPoles, TColStd_Array1OfReal & NewKnots, TColStd_Array1OfInteger & NewMults, const Standard_Real Epsilon, const Standard_Boolean Add = Standard_True);

		/****************** InsertKnots ******************/
		/**** md5 signature: 44e9b7452e759b97d179e5c2523ae6e6 ****/
		%feature("compactdefaultargs") InsertKnots;
		%feature("autodoc", "No available documentation.

Parameters
----------
Degree: int
Periodic: bool
Poles: TColgp_Array1OfPnt
Weights: TColStd_Array1OfReal *
Knots: TColStd_Array1OfReal
Mults: TColStd_Array1OfInteger
AddKnots: TColStd_Array1OfReal
AddMults: TColStd_Array1OfInteger *
NewPoles: TColgp_Array1OfPnt
NewWeights: TColStd_Array1OfReal *
NewKnots: TColStd_Array1OfReal
NewMults: TColStd_Array1OfInteger
Epsilon: float
Add: bool,optional
	default value is Standard_True

Returns
-------
None
") InsertKnots;
		static void InsertKnots(const Standard_Integer Degree, const Standard_Boolean Periodic, const TColgp_Array1OfPnt & Poles, const TColStd_Array1OfReal * Weights, const TColStd_Array1OfReal & Knots, const TColStd_Array1OfInteger & Mults, const TColStd_Array1OfReal & AddKnots, const TColStd_Array1OfInteger * AddMults, TColgp_Array1OfPnt & NewPoles, TColStd_Array1OfReal * NewWeights, TColStd_Array1OfReal & NewKnots, TColStd_Array1OfInteger & NewMults, const Standard_Real Epsilon, const Standard_Boolean Add = Standard_True);

		/****************** InsertKnots ******************/
		/**** md5 signature: be67416d5cb4ecf2afefb17210b615c4 ****/
		%feature("compactdefaultargs") InsertKnots;
		%feature("autodoc", "Insert a sequence of knots <addknots> with multiplicities <addmults>. <addknots> must be a non decreasing sequence and verifies : //! knots(knots.lower()) <= addknots(addknots.lower()) knots(knots.upper()) >= addknots(addknots.upper()) //! the newpoles and newweights arrays must have a length : poles.length() + sum(addmults()) //! when a knot to insert is identic to an existing knot the multiplicities are added. //! epsilon is used to test knots for equality. //! when addmult is negative or null the knot is not inserted. no multiplicity will becomes higher than the degree. //! the new knots and multiplicities are copied in <newknots> and <newmults>. //! all the new arrays should be correctly dimensioned. //! when all the new knots are existing knots, i.e. only the multiplicities will change it is safe to use the same arrays as input and output.

Parameters
----------
Degree: int
Periodic: bool
Poles: TColgp_Array1OfPnt2d
Weights: TColStd_Array1OfReal *
Knots: TColStd_Array1OfReal
Mults: TColStd_Array1OfInteger
AddKnots: TColStd_Array1OfReal
AddMults: TColStd_Array1OfInteger *
NewPoles: TColgp_Array1OfPnt2d
NewWeights: TColStd_Array1OfReal *
NewKnots: TColStd_Array1OfReal
NewMults: TColStd_Array1OfInteger
Epsilon: float
Add: bool,optional
	default value is Standard_True

Returns
-------
None
") InsertKnots;
		static void InsertKnots(const Standard_Integer Degree, const Standard_Boolean Periodic, const TColgp_Array1OfPnt2d & Poles, const TColStd_Array1OfReal * Weights, const TColStd_Array1OfReal & Knots, const TColStd_Array1OfInteger & Mults, const TColStd_Array1OfReal & AddKnots, const TColStd_Array1OfInteger * AddMults, TColgp_Array1OfPnt2d & NewPoles, TColStd_Array1OfReal * NewWeights, TColStd_Array1OfReal & NewKnots, TColStd_Array1OfInteger & NewMults, const Standard_Real Epsilon, const Standard_Boolean Add = Standard_True);

		/****************** Interpolate ******************/
		/**** md5 signature: e2fa20a66c129381e33f3cb4e6ce9d21 ****/
		%feature("compactdefaultargs") Interpolate;
		%feature("autodoc", "Performs the interpolation of the data given in the poles array according to the requests in contactorderarray that is :  if contactorderarray(i) has value d it means that poles(i) containes the dth derivative of the function to be interpolated. the length l of the following arrays must be the same : parameters, contactorderarray, poles, the length of flatknots is degree + l + 1 warning: the method used to do that interpolation is gauss elimination without pivoting. thus if the diagonal is not dominant there is no guarantee that the algorithm will work. nevertheless for cubic interpolation or interpolation at scheonberg points the method will work the inversionproblem will report 0 if there was no problem else it will give the index of the faulty pivot.

Parameters
----------
Degree: int
FlatKnots: TColStd_Array1OfReal
Parameters: TColStd_Array1OfReal
ContactOrderArray: TColStd_Array1OfInteger
Poles: TColgp_Array1OfPnt

Returns
-------
InversionProblem: int
") Interpolate;
		static void Interpolate(const Standard_Integer Degree, const TColStd_Array1OfReal & FlatKnots, const TColStd_Array1OfReal & Parameters, const TColStd_Array1OfInteger & ContactOrderArray, TColgp_Array1OfPnt & Poles, Standard_Integer &OutValue);

		/****************** Interpolate ******************/
		/**** md5 signature: fd5aeac99513f881ae37161394ea9685 ****/
		%feature("compactdefaultargs") Interpolate;
		%feature("autodoc", "Performs the interpolation of the data given in the poles array according to the requests in contactorderarray that is :  if contactorderarray(i) has value d it means that poles(i) containes the dth derivative of the function to be interpolated. the length l of the following arrays must be the same : parameters, contactorderarray, poles, the length of flatknots is degree + l + 1 warning: the method used to do that interpolation is gauss elimination without pivoting. thus if the diagonal is not dominant there is no guarantee that the algorithm will work. nevertheless for cubic interpolation at knots or interpolation at scheonberg points the method will work. the inversionproblem w ll report 0 if there was no problem else it will give the index of the faulty pivot.

Parameters
----------
Degree: int
FlatKnots: TColStd_Array1OfReal
Parameters: TColStd_Array1OfReal
ContactOrderArray: TColStd_Array1OfInteger
Poles: TColgp_Array1OfPnt2d

Returns
-------
InversionProblem: int
") Interpolate;
		static void Interpolate(const Standard_Integer Degree, const TColStd_Array1OfReal & FlatKnots, const TColStd_Array1OfReal & Parameters, const TColStd_Array1OfInteger & ContactOrderArray, TColgp_Array1OfPnt2d & Poles, Standard_Integer &OutValue);

		/****************** Interpolate ******************/
		/**** md5 signature: 2212219c7508d74418481956ee1ddf0e ****/
		%feature("compactdefaultargs") Interpolate;
		%feature("autodoc", "Performs the interpolation of the data given in the poles array according to the requests in contactorderarray that is :  if contactorderarray(i) has value d it means that poles(i) containes the dth derivative of the function to be interpolated. the length l of the following arrays must be the same : parameters, contactorderarray, poles, the length of flatknots is degree + l + 1 warning: the method used to do that interpolation is gauss elimination without pivoting. thus if the diagonal is not dominant there is no guarantee that the algorithm will work. nevertheless for cubic interpolation at knots or interpolation at scheonberg points the method will work. the inversionproblem will report 0 if there was no problem else it will give the index of the faulty pivot.

Parameters
----------
Degree: int
FlatKnots: TColStd_Array1OfReal
Parameters: TColStd_Array1OfReal
ContactOrderArray: TColStd_Array1OfInteger
Poles: TColgp_Array1OfPnt
Weights: TColStd_Array1OfReal

Returns
-------
InversionProblem: int
") Interpolate;
		static void Interpolate(const Standard_Integer Degree, const TColStd_Array1OfReal & FlatKnots, const TColStd_Array1OfReal & Parameters, const TColStd_Array1OfInteger & ContactOrderArray, TColgp_Array1OfPnt & Poles, TColStd_Array1OfReal & Weights, Standard_Integer &OutValue);

		/****************** Interpolate ******************/
		/**** md5 signature: 0cdd4d771c634dfeec3e69ce9529d617 ****/
		%feature("compactdefaultargs") Interpolate;
		%feature("autodoc", "Performs the interpolation of the data given in the poles array according to the requests in contactorderarray that is :  if contactorderarray(i) has value d it means that poles(i) containes the dth derivative of the function to be interpolated. the length l of the following arrays must be the same : parameters, contactorderarray, poles, the length of flatknots is degree + l + 1 warning: the method used to do that interpolation is gauss elimination without pivoting. thus if the diagonal is not dominant there is no guarantee that the algorithm will work. nevertheless for cubic interpolation at knots or interpolation at scheonberg points the method will work. the inversionproblem w ll report 0 if there was no problem else it will give the i.

Parameters
----------
Degree: int
FlatKnots: TColStd_Array1OfReal
Parameters: TColStd_Array1OfReal
ContactOrderArray: TColStd_Array1OfInteger
Poles: TColgp_Array1OfPnt2d
Weights: TColStd_Array1OfReal

Returns
-------
InversionProblem: int
") Interpolate;
		static void Interpolate(const Standard_Integer Degree, const TColStd_Array1OfReal & FlatKnots, const TColStd_Array1OfReal & Parameters, const TColStd_Array1OfInteger & ContactOrderArray, TColgp_Array1OfPnt2d & Poles, TColStd_Array1OfReal & Weights, Standard_Integer &OutValue);

		/****************** Interpolate ******************/
		/**** md5 signature: b5cf60eb426c89a7bf0dd27c83c89e23 ****/
		%feature("compactdefaultargs") Interpolate;
		%feature("autodoc", "Performs the interpolation of the data given in the poles array according to the requests in contactorderarray that is :  if contactorderarray(i) has value d it means that poles(i) containes the dth derivative of the function to be interpolated. the length l of the following arrays must be the same : parameters, contactorderarray the length of flatknots is degree + l + 1 the polesarray is an seen as an array[1..n][1..arraydimension] with n = tge length of the parameters array warning: the method used to do that interpolation is gauss elimination without pivoting. thus if the diagonal is not dominant there is no guarantee that the algorithm will work. nevertheless for cubic interpolation or interpolation at scheonberg points the method will work the inversionproblem will report 0 if there was no problem else it will give the index of the faulty pivot.

Parameters
----------
Degree: int
FlatKnots: TColStd_Array1OfReal
Parameters: TColStd_Array1OfReal
ContactOrderArray: TColStd_Array1OfInteger
ArrayDimension: int

Returns
-------
Poles: float
InversionProblem: int
") Interpolate;
		static void Interpolate(const Standard_Integer Degree, const TColStd_Array1OfReal & FlatKnots, const TColStd_Array1OfReal & Parameters, const TColStd_Array1OfInteger & ContactOrderArray, const Standard_Integer ArrayDimension, Standard_Real &OutValue, Standard_Integer &OutValue);

		/****************** Interpolate ******************/
		/**** md5 signature: 4ae05d20a7d577aff2db78e9c82a018c ****/
		%feature("compactdefaultargs") Interpolate;
		%feature("autodoc", "No available documentation.

Parameters
----------
Degree: int
FlatKnots: TColStd_Array1OfReal
Parameters: TColStd_Array1OfReal
ContactOrderArray: TColStd_Array1OfInteger
ArrayDimension: int

Returns
-------
Poles: float
Weights: float
InversionProblem: int
") Interpolate;
		static void Interpolate(const Standard_Integer Degree, const TColStd_Array1OfReal & FlatKnots, const TColStd_Array1OfReal & Parameters, const TColStd_Array1OfInteger & ContactOrderArray, const Standard_Integer ArrayDimension, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Integer &OutValue);

		/****************** IsRational ******************/
		/**** md5 signature: 5ee1bb4d64e0a78acc3cb994f1afcefa ****/
		%feature("compactdefaultargs") IsRational;
		%feature("autodoc", "Returns false if all the weights of the array <weights> between i1 an i2 are identic. epsilon is used for comparing weights. if epsilon is 0. the epsilon of the first weight is used.

Parameters
----------
Weights: TColStd_Array1OfReal
I1: int
I2: int
Epsilon: float,optional
	default value is 0.0

Returns
-------
bool
") IsRational;
		static Standard_Boolean IsRational(const TColStd_Array1OfReal & Weights, const Standard_Integer I1, const Standard_Integer I2, const Standard_Real Epsilon = 0.0);

		/****************** KnotAnalysis ******************/
		/**** md5 signature: a6e80a652c2aafa8024e7fdc8544d77c ****/
		%feature("compactdefaultargs") KnotAnalysis;
		%feature("autodoc", "Analyzes the array of knots. returns the form and the maximum knot multiplicity.

Parameters
----------
Degree: int
Periodic: bool
CKnots: TColStd_Array1OfReal
CMults: TColStd_Array1OfInteger
KnotForm: GeomAbs_BSplKnotDistribution

Returns
-------
MaxKnotMult: int
") KnotAnalysis;
		static void KnotAnalysis(const Standard_Integer Degree, const Standard_Boolean Periodic, const TColStd_Array1OfReal & CKnots, const TColStd_Array1OfInteger & CMults, GeomAbs_BSplKnotDistribution & KnotForm, Standard_Integer &OutValue);

		/****************** KnotForm ******************/
		/**** md5 signature: 0097f63f98647952ea3a1e8664501689 ****/
		%feature("compactdefaultargs") KnotForm;
		%feature("autodoc", "Analyses if the knots distribution is 'uniform' or 'nonuniform' between the knot fromk1 and the knot tok2. there is no repetition of knot in the knots'sequence <knots>.

Parameters
----------
Knots: TColStd_Array1OfReal
FromK1: int
ToK2: int

Returns
-------
BSplCLib_KnotDistribution
") KnotForm;
		static BSplCLib_KnotDistribution KnotForm(const TColStd_Array1OfReal & Knots, const Standard_Integer FromK1, const Standard_Integer ToK2);

		/****************** KnotSequence ******************/
		/**** md5 signature: afb0a094a5f9cb7ee5196da7628bb20b ****/
		%feature("compactdefaultargs") KnotSequence;
		%feature("autodoc", "No available documentation.

Parameters
----------
Knots: TColStd_Array1OfReal
Mults: TColStd_Array1OfInteger
KnotSeq: TColStd_Array1OfReal
Periodic: bool,optional
	default value is Standard_False

Returns
-------
None
") KnotSequence;
		static void KnotSequence(const TColStd_Array1OfReal & Knots, const TColStd_Array1OfInteger & Mults, TColStd_Array1OfReal & KnotSeq, const Standard_Boolean Periodic = Standard_False);

		/****************** KnotSequence ******************/
		/**** md5 signature: 935f3e64125f13f8b157c325e706c6c5 ****/
		%feature("compactdefaultargs") KnotSequence;
		%feature("autodoc", "Computes the sequence of knots knotseq with repetition of the knots of multiplicity greater than 1. //! length of knotseq must be knotsequencelength(mults,degree,periodic).

Parameters
----------
Knots: TColStd_Array1OfReal
Mults: TColStd_Array1OfInteger
Degree: int
Periodic: bool
KnotSeq: TColStd_Array1OfReal

Returns
-------
None
") KnotSequence;
		static void KnotSequence(const TColStd_Array1OfReal & Knots, const TColStd_Array1OfInteger & Mults, const Standard_Integer Degree, const Standard_Boolean Periodic, TColStd_Array1OfReal & KnotSeq);

		/****************** KnotSequenceLength ******************/
		/**** md5 signature: 0b0bae3397b7a20bdbf0907b980aa22a ****/
		%feature("compactdefaultargs") KnotSequenceLength;
		%feature("autodoc", "Returns the length of the sequence of knots with repetition. //! periodic : //! sum(mults(i), i = mults.lower(); i <= mults.upper()); //! non periodic : //! sum(mults(i); i = mults.lower(); i < mults.upper()) + 2 * degree.

Parameters
----------
Mults: TColStd_Array1OfInteger
Degree: int
Periodic: bool

Returns
-------
int
") KnotSequenceLength;
		static Standard_Integer KnotSequenceLength(const TColStd_Array1OfInteger & Mults, const Standard_Integer Degree, const Standard_Boolean Periodic);

		/****************** Knots ******************/
		/**** md5 signature: 70efd22fb93da2362599b5a577c6459d ****/
		%feature("compactdefaultargs") Knots;
		%feature("autodoc", "Computes the sequence of knots knots without repetition of the knots of multiplicity greater than 1. //! length of <knots> and <mults> must be knotslength(knotsequence,periodic).

Parameters
----------
KnotSeq: TColStd_Array1OfReal
Knots: TColStd_Array1OfReal
Mults: TColStd_Array1OfInteger
Periodic: bool,optional
	default value is Standard_False

Returns
-------
None
") Knots;
		static void Knots(const TColStd_Array1OfReal & KnotSeq, TColStd_Array1OfReal & Knots, TColStd_Array1OfInteger & Mults, const Standard_Boolean Periodic = Standard_False);

		/****************** KnotsLength ******************/
		/**** md5 signature: f94187e02e0f1196d3a33404dd4beb1c ****/
		%feature("compactdefaultargs") KnotsLength;
		%feature("autodoc", "Returns the length of the sequence of knots (and mults) without repetition.

Parameters
----------
KnotSeq: TColStd_Array1OfReal
Periodic: bool,optional
	default value is Standard_False

Returns
-------
int
") KnotsLength;
		static Standard_Integer KnotsLength(const TColStd_Array1OfReal & KnotSeq, const Standard_Boolean Periodic = Standard_False);

		/****************** LastUKnotIndex ******************/
		/**** md5 signature: 91f9e1c94b860add3183ecd59eb8096a ****/
		%feature("compactdefaultargs") LastUKnotIndex;
		%feature("autodoc", "Computes the index of the knots value which gives the end point of the curve.

Parameters
----------
Degree: int
Mults: TColStd_Array1OfInteger

Returns
-------
int
") LastUKnotIndex;
		static Standard_Integer LastUKnotIndex(const Standard_Integer Degree, const TColStd_Array1OfInteger & Mults);

		/****************** LocateParameter ******************/
		/**** md5 signature: 24762308cb330e46f1844ce565eeb2b9 ****/
		%feature("compactdefaultargs") LocateParameter;
		%feature("autodoc", "Locates the parametric value u in the knots sequence between the knot k1 and the knot k2. the value return in index verifies. //! knots(index) <= u < knots(index + 1) if u <= knots (k1) then index = k1 if u >= knots (k2) then index = k2 - 1 //! if periodic is true u may be modified to fit in the range knots(k1), knots(k2). in any case the correct value is returned in newu. //! warnings :index is used as input data to initialize the searching function. warning: knots have to be 'withe repetitions'.

Parameters
----------
Degree: int
Knots: TColStd_Array1OfReal
Mults: TColStd_Array1OfInteger
U: float
IsPeriodic: bool
FromK1: int
ToK2: int

Returns
-------
KnotIndex: int
NewU: float
") LocateParameter;
		static void LocateParameter(const Standard_Integer Degree, const TColStd_Array1OfReal & Knots, const TColStd_Array1OfInteger & Mults, const Standard_Real U, const Standard_Boolean IsPeriodic, const Standard_Integer FromK1, const Standard_Integer ToK2, Standard_Integer &OutValue, Standard_Real &OutValue);

		/****************** LocateParameter ******************/
		/**** md5 signature: 84a2a9eb0a9f97bd685828ae0b21bc6e ****/
		%feature("compactdefaultargs") LocateParameter;
		%feature("autodoc", "Locates the parametric value u in the knots sequence between the knot k1 and the knot k2. the value return in index verifies. //! knots(index) <= u < knots(index + 1) if u <= knots (k1) then index = k1 if u >= knots (k2) then index = k2 - 1 //! if periodic is true u may be modified to fit in the range knots(k1), knots(k2). in any case the correct value is returned in newu. //! warnings :index is used as input data to initialize the searching function. warning: knots have to be 'flat'.

Parameters
----------
Degree: int
Knots: TColStd_Array1OfReal
U: float
IsPeriodic: bool
FromK1: int
ToK2: int

Returns
-------
KnotIndex: int
NewU: float
") LocateParameter;
		static void LocateParameter(const Standard_Integer Degree, const TColStd_Array1OfReal & Knots, const Standard_Real U, const Standard_Boolean IsPeriodic, const Standard_Integer FromK1, const Standard_Integer ToK2, Standard_Integer &OutValue, Standard_Real &OutValue);

		/****************** LocateParameter ******************/
		/**** md5 signature: 7a22649239d0309e62561b711af4bd66 ****/
		%feature("compactdefaultargs") LocateParameter;
		%feature("autodoc", "No available documentation.

Parameters
----------
Degree: int
Knots: TColStd_Array1OfReal
Mults: TColStd_Array1OfInteger *
U: float
Periodic: bool

Returns
-------
Index: int
NewU: float
") LocateParameter;
		static void LocateParameter(const Standard_Integer Degree, const TColStd_Array1OfReal & Knots, const TColStd_Array1OfInteger * Mults, const Standard_Real U, const Standard_Boolean Periodic, Standard_Integer &OutValue, Standard_Real &OutValue);

		/****************** MaxDegree ******************/
		/**** md5 signature: 985314a0ed62b597a9bdf0f555b97bed ****/
		%feature("compactdefaultargs") MaxDegree;
		%feature("autodoc", "Returns the degree maxima for a bsplinecurve.

Returns
-------
int
") MaxDegree;
		static Standard_Integer MaxDegree();

		/****************** MaxKnotMult ******************/
		/**** md5 signature: ac65dfe55c0073e75792f284e56cd7aa ****/
		%feature("compactdefaultargs") MaxKnotMult;
		%feature("autodoc", "Finds the greatest multiplicity in a set of knots between k1 and k2. mults is the multiplicity associated with each knot value.

Parameters
----------
Mults: TColStd_Array1OfInteger
K1: int
K2: int

Returns
-------
int
") MaxKnotMult;
		static Standard_Integer MaxKnotMult(const TColStd_Array1OfInteger & Mults, const Standard_Integer K1, const Standard_Integer K2);

		/****************** MergeBSplineKnots ******************/
		/**** md5 signature: effe499663badb4d232069dd652236c2 ****/
		%feature("compactdefaultargs") MergeBSplineKnots;
		%feature("autodoc", "Merges two knot vector by setting the starting and ending values to startvalue and endvalue.

Parameters
----------
Tolerance: float
StartValue: float
EndValue: float
Degree1: int
Knots1: TColStd_Array1OfReal
Mults1: TColStd_Array1OfInteger
Degree2: int
Knots2: TColStd_Array1OfReal
Mults2: TColStd_Array1OfInteger
NewKnots: TColStd_HArray1OfReal
NewMults: TColStd_HArray1OfInteger

Returns
-------
NumPoles: int
") MergeBSplineKnots;
		static void MergeBSplineKnots(const Standard_Real Tolerance, const Standard_Real StartValue, const Standard_Real EndValue, const Standard_Integer Degree1, const TColStd_Array1OfReal & Knots1, const TColStd_Array1OfInteger & Mults1, const Standard_Integer Degree2, const TColStd_Array1OfReal & Knots2, const TColStd_Array1OfInteger & Mults2, Standard_Integer &OutValue, opencascade::handle<TColStd_HArray1OfReal> & NewKnots, opencascade::handle<TColStd_HArray1OfInteger> & NewMults);

		/****************** MinKnotMult ******************/
		/**** md5 signature: 1a548fdbf5671589224d148d3a3a6b0d ****/
		%feature("compactdefaultargs") MinKnotMult;
		%feature("autodoc", "Finds the lowest multiplicity in a set of knots between k1 and k2. mults is the multiplicity associated with each knot value.

Parameters
----------
Mults: TColStd_Array1OfInteger
K1: int
K2: int

Returns
-------
int
") MinKnotMult;
		static Standard_Integer MinKnotMult(const TColStd_Array1OfInteger & Mults, const Standard_Integer K1, const Standard_Integer K2);

		/****************** MovePoint ******************/
		/**** md5 signature: 258c43adb74db6c2cd76d84b353a498f ****/
		%feature("compactdefaultargs") MovePoint;
		%feature("autodoc", "Find the new poles which allows an old point (with a given u as parameter) to reach a new position index1 and index2 indicate the range of poles we can move (1, nbpoles-1) or (2, nbpoles) -> no constraint for one side don't enter (1,nbpoles) -> error: rigid move (2, nbpoles-1) -> the ends are enforced (3, nbpoles-2) -> the ends and the tangency are enforced if problem in bsplinebasis calculation, no change for the curve and firstindex, lastindex = 0.

Parameters
----------
U: float
Displ: gp_Vec2d
Index1: int
Index2: int
Degree: int
Poles: TColgp_Array1OfPnt2d
Weights: TColStd_Array1OfReal *
FlatKnots: TColStd_Array1OfReal
NewPoles: TColgp_Array1OfPnt2d

Returns
-------
FirstIndex: int
LastIndex: int
") MovePoint;
		static void MovePoint(const Standard_Real U, const gp_Vec2d & Displ, const Standard_Integer Index1, const Standard_Integer Index2, const Standard_Integer Degree, const TColgp_Array1OfPnt2d & Poles, const TColStd_Array1OfReal * Weights, const TColStd_Array1OfReal & FlatKnots, Standard_Integer &OutValue, Standard_Integer &OutValue, TColgp_Array1OfPnt2d & NewPoles);

		/****************** MovePoint ******************/
		/**** md5 signature: c86875bcabde81f6d6d9eb1c7e44e5de ****/
		%feature("compactdefaultargs") MovePoint;
		%feature("autodoc", "Find the new poles which allows an old point (with a given u as parameter) to reach a new position index1 and index2 indicate the range of poles we can move (1, nbpoles-1) or (2, nbpoles) -> no constraint for one side don't enter (1,nbpoles) -> error: rigid move (2, nbpoles-1) -> the ends are enforced (3, nbpoles-2) -> the ends and the tangency are enforced if problem in bsplinebasis calculation, no change for the curve and firstindex, lastindex = 0.

Parameters
----------
U: float
Displ: gp_Vec
Index1: int
Index2: int
Degree: int
Poles: TColgp_Array1OfPnt
Weights: TColStd_Array1OfReal *
FlatKnots: TColStd_Array1OfReal
NewPoles: TColgp_Array1OfPnt

Returns
-------
FirstIndex: int
LastIndex: int
") MovePoint;
		static void MovePoint(const Standard_Real U, const gp_Vec & Displ, const Standard_Integer Index1, const Standard_Integer Index2, const Standard_Integer Degree, const TColgp_Array1OfPnt & Poles, const TColStd_Array1OfReal * Weights, const TColStd_Array1OfReal & FlatKnots, Standard_Integer &OutValue, Standard_Integer &OutValue, TColgp_Array1OfPnt & NewPoles);

		/****************** MovePointAndTangent ******************/
		/**** md5 signature: f3528b941ebae064eb869dac3838fd8b ****/
		%feature("compactdefaultargs") MovePointAndTangent;
		%feature("autodoc", "This is the dimension free version of the utility u is the parameter must be within the first flatknots and the last flatknots delta is the amount the curve has to be moved deltaderivative is the amount the derivative has to be moved. delta and deltaderivative must be array of dimension arraydimension degree is the degree of the bspline and the flatknots are the knots of the bspline starting condition if = -1 means the starting point of the curve can move = 0 means the starting point of the cuve cannot move but tangen starting point of the curve cannot move = 1 means the starting point and tangents cannot move = 2 means the starting point tangent and curvature cannot move = ... same holds for endingcondition poles are the poles of the curve weights are the weights of the curve if not null newpoles are the poles of the deformed curve errorstatus will be 0 if no error happened 1 if there are not enough knots/poles the imposed conditions the way to solve this problem is to add knots to the bspline if startcondition = 1 and endcondition = 1 then you need at least 4 + 2 = 6 poles so for example to have a c1 cubic you will need have at least 2 internal knots.

Parameters
----------
U: float
ArrayDimension: int
Tolerance: float
Degree: int
StartingCondition: int
EndingCondition: int
Weights: TColStd_Array1OfReal *
FlatKnots: TColStd_Array1OfReal

Returns
-------
Delta: float
DeltaDerivative: float
Poles: float
NewPoles: float
ErrorStatus: int
") MovePointAndTangent;
		static void MovePointAndTangent(const Standard_Real U, const Standard_Integer ArrayDimension, Standard_Real &OutValue, Standard_Real &OutValue, const Standard_Real Tolerance, const Standard_Integer Degree, const Standard_Integer StartingCondition, const Standard_Integer EndingCondition, Standard_Real &OutValue, const TColStd_Array1OfReal * Weights, const TColStd_Array1OfReal & FlatKnots, Standard_Real &OutValue, Standard_Integer &OutValue);

		/****************** MovePointAndTangent ******************/
		/**** md5 signature: 84d0d45564e777fb1d986a7bc7085bd3 ****/
		%feature("compactdefaultargs") MovePointAndTangent;
		%feature("autodoc", "This is the dimension free version of the utility u is the parameter must be within the first flatknots and the last flatknots delta is the amount the curve has to be moved deltaderivative is the amount the derivative has to be moved. delta and deltaderivative must be array of dimension arraydimension degree is the degree of the bspline and the flatknots are the knots of the bspline starting condition if = -1 means the starting point of the curve can move = 0 means the starting point of the cuve cannot move but tangen starting point of the curve cannot move = 1 means the starting point and tangents cannot move = 2 means the starting point tangent and curvature cannot move = ... same holds for endingcondition poles are the poles of the curve weights are the weights of the curve if not null newpoles are the poles of the deformed curve errorstatus will be 0 if no error happened 1 if there are not enough knots/poles the imposed conditions the way to solve this problem is to add knots to the bspline if startcondition = 1 and endcondition = 1 then you need at least 4 + 2 = 6 poles so for example to have a c1 cubic you will need have at least 2 internal knots.

Parameters
----------
U: float
Delta: gp_Vec
DeltaDerivative: gp_Vec
Tolerance: float
Degree: int
StartingCondition: int
EndingCondition: int
Poles: TColgp_Array1OfPnt
Weights: TColStd_Array1OfReal *
FlatKnots: TColStd_Array1OfReal
NewPoles: TColgp_Array1OfPnt

Returns
-------
ErrorStatus: int
") MovePointAndTangent;
		static void MovePointAndTangent(const Standard_Real U, const gp_Vec & Delta, const gp_Vec & DeltaDerivative, const Standard_Real Tolerance, const Standard_Integer Degree, const Standard_Integer StartingCondition, const Standard_Integer EndingCondition, const TColgp_Array1OfPnt & Poles, const TColStd_Array1OfReal * Weights, const TColStd_Array1OfReal & FlatKnots, TColgp_Array1OfPnt & NewPoles, Standard_Integer &OutValue);

		/****************** MovePointAndTangent ******************/
		/**** md5 signature: 4281391111a23f8a2fbca803f5519e35 ****/
		%feature("compactdefaultargs") MovePointAndTangent;
		%feature("autodoc", "This is the dimension free version of the utility u is the parameter must be within the first flatknots and the last flatknots delta is the amount the curve has to be moved deltaderivative is the amount the derivative has to be moved. delta and deltaderivative must be array of dimension arraydimension degree is the degree of the bspline and the flatknots are the knots of the bspline starting condition if = -1 means the starting point of the curve can move = 0 means the starting point of the cuve cannot move but tangen starting point of the curve cannot move = 1 means the starting point and tangents cannot move = 2 means the starting point tangent and curvature cannot move = ... same holds for endingcondition poles are the poles of the curve weights are the weights of the curve if not null newpoles are the poles of the deformed curve errorstatus will be 0 if no error happened 1 if there are not enough knots/poles the imposed conditions the way to solve this problem is to add knots to the bspline if startcondition = 1 and endcondition = 1 then you need at least 4 + 2 = 6 poles so for example to have a c1 cubic you will need have at least 2 internal knots.

Parameters
----------
U: float
Delta: gp_Vec2d
DeltaDerivative: gp_Vec2d
Tolerance: float
Degree: int
StartingCondition: int
EndingCondition: int
Poles: TColgp_Array1OfPnt2d
Weights: TColStd_Array1OfReal *
FlatKnots: TColStd_Array1OfReal
NewPoles: TColgp_Array1OfPnt2d

Returns
-------
ErrorStatus: int
") MovePointAndTangent;
		static void MovePointAndTangent(const Standard_Real U, const gp_Vec2d & Delta, const gp_Vec2d & DeltaDerivative, const Standard_Real Tolerance, const Standard_Integer Degree, const Standard_Integer StartingCondition, const Standard_Integer EndingCondition, const TColgp_Array1OfPnt2d & Poles, const TColStd_Array1OfReal * Weights, const TColStd_Array1OfReal & FlatKnots, TColgp_Array1OfPnt2d & NewPoles, Standard_Integer &OutValue);

		/****************** MultForm ******************/
		/**** md5 signature: 85cc5e3d06d09a736fc529142891b46b ****/
		%feature("compactdefaultargs") MultForm;
		%feature("autodoc", "Analyses the distribution of multiplicities between the knot fromk1 and the knot tok2.

Parameters
----------
Mults: TColStd_Array1OfInteger
FromK1: int
ToK2: int

Returns
-------
BSplCLib_MultDistribution
") MultForm;
		static BSplCLib_MultDistribution MultForm(const TColStd_Array1OfInteger & Mults, const Standard_Integer FromK1, const Standard_Integer ToK2);

		/****************** NbPoles ******************/
		/**** md5 signature: c6d4161c26923bab1e3ce4d84d387cfe ****/
		%feature("compactdefaultargs") NbPoles;
		%feature("autodoc", "Returns the number of poles of the curve. returns 0 if one of the multiplicities is incorrect. //! * non positive. //! * greater than degree, or degree+1 at the first and last knot of a non periodic curve. //! * the last periodicity on a periodic curve is not equal to the first.

Parameters
----------
Degree: int
Periodic: bool
Mults: TColStd_Array1OfInteger

Returns
-------
int
") NbPoles;
		static Standard_Integer NbPoles(const Standard_Integer Degree, const Standard_Boolean Periodic, const TColStd_Array1OfInteger & Mults);

		/****************** NoMults ******************/
		/**** md5 signature: 25ebd1add10620b7395bfd564aafb5c4 ****/
		%feature("compactdefaultargs") NoMults;
		%feature("autodoc", "Used as argument for a flatknots evaluation.

Returns
-------
TColStd_Array1OfInteger *
") NoMults;
		static TColStd_Array1OfInteger * NoMults();

		/****************** NoWeights ******************/
		/**** md5 signature: bcccc7afe5a4725a5649ba0988d8696b ****/
		%feature("compactdefaultargs") NoWeights;
		%feature("autodoc", "Used as argument for a non rational curve.

Returns
-------
TColStd_Array1OfReal *
") NoWeights;
		static TColStd_Array1OfReal * NoWeights();

		/****************** PoleIndex ******************/
		/**** md5 signature: 1ac0cbf47e8a95057f9b7585fb439d64 ****/
		%feature("compactdefaultargs") PoleIndex;
		%feature("autodoc", "Return the index of the first pole to use on the span mults(index) - mults(index+1). this index must be added to poles.lower().

Parameters
----------
Degree: int
Index: int
Periodic: bool
Mults: TColStd_Array1OfInteger

Returns
-------
int
") PoleIndex;
		static Standard_Integer PoleIndex(const Standard_Integer Degree, const Standard_Integer Index, const Standard_Boolean Periodic, const TColStd_Array1OfInteger & Mults);

		/****************** PolesCoefficients ******************/
		/**** md5 signature: 511519c534e22ba40280528d5d1ef87e ****/
		%feature("compactdefaultargs") PolesCoefficients;
		%feature("autodoc", "No available documentation.

Parameters
----------
Poles: TColgp_Array1OfPnt2d
CachePoles: TColgp_Array1OfPnt2d

Returns
-------
None
") PolesCoefficients;
		static void PolesCoefficients(const TColgp_Array1OfPnt2d & Poles, TColgp_Array1OfPnt2d & CachePoles);

		/****************** PolesCoefficients ******************/
		/**** md5 signature: 405a5ce1920546314bea6ba5a6a3f98b ****/
		%feature("compactdefaultargs") PolesCoefficients;
		%feature("autodoc", "No available documentation.

Parameters
----------
Poles: TColgp_Array1OfPnt2d
Weights: TColStd_Array1OfReal *
CachePoles: TColgp_Array1OfPnt2d
CacheWeights: TColStd_Array1OfReal *

Returns
-------
None
") PolesCoefficients;
		static void PolesCoefficients(const TColgp_Array1OfPnt2d & Poles, const TColStd_Array1OfReal * Weights, TColgp_Array1OfPnt2d & CachePoles, TColStd_Array1OfReal * CacheWeights);

		/****************** PolesCoefficients ******************/
		/**** md5 signature: ee906c090873ca3443d5f58dda312bc9 ****/
		%feature("compactdefaultargs") PolesCoefficients;
		%feature("autodoc", "No available documentation.

Parameters
----------
Poles: TColgp_Array1OfPnt
CachePoles: TColgp_Array1OfPnt

Returns
-------
None
") PolesCoefficients;
		static void PolesCoefficients(const TColgp_Array1OfPnt & Poles, TColgp_Array1OfPnt & CachePoles);

		/****************** PolesCoefficients ******************/
		/**** md5 signature: eb7334dc15bb52330ce561fc1f10d66d ****/
		%feature("compactdefaultargs") PolesCoefficients;
		%feature("autodoc", "Encapsulation of buildcache to perform the evaluation of the taylor expansion for beziercurves at parameter 0. warning: to be used for beziercurves only!!!.

Parameters
----------
Poles: TColgp_Array1OfPnt
Weights: TColStd_Array1OfReal *
CachePoles: TColgp_Array1OfPnt
CacheWeights: TColStd_Array1OfReal *

Returns
-------
None
") PolesCoefficients;
		static void PolesCoefficients(const TColgp_Array1OfPnt & Poles, const TColStd_Array1OfReal * Weights, TColgp_Array1OfPnt & CachePoles, TColStd_Array1OfReal * CacheWeights);

		/****************** PrepareInsertKnots ******************/
		/**** md5 signature: a44fd015e2f0b30470efd81b373c7ea8 ****/
		%feature("compactdefaultargs") PrepareInsertKnots;
		%feature("autodoc", "Returns in <nbpoles, nbknots> the new number of poles and knots if the sequence of knots <addknots, addmults> is inserted in the sequence <knots, mults>. //! epsilon is used to compare knots for equality. //! if add is true the multiplicities on equal knots are added. //! if add is false the max value of the multiplicities is kept. //! return false if : the knew knots are knot increasing. the new knots are not in the range.

Parameters
----------
Degree: int
Periodic: bool
Knots: TColStd_Array1OfReal
Mults: TColStd_Array1OfInteger
AddKnots: TColStd_Array1OfReal
AddMults: TColStd_Array1OfInteger *
Epsilon: float
Add: bool,optional
	default value is Standard_True

Returns
-------
NbPoles: int
NbKnots: int
") PrepareInsertKnots;
		static Standard_Boolean PrepareInsertKnots(const Standard_Integer Degree, const Standard_Boolean Periodic, const TColStd_Array1OfReal & Knots, const TColStd_Array1OfInteger & Mults, const TColStd_Array1OfReal & AddKnots, const TColStd_Array1OfInteger * AddMults, Standard_Integer &OutValue, Standard_Integer &OutValue, const Standard_Real Epsilon, const Standard_Boolean Add = Standard_True);

		/****************** PrepareTrimming ******************/
		/**** md5 signature: 86f0fb4e064014ba01b07670c1d98634 ****/
		%feature("compactdefaultargs") PrepareTrimming;
		%feature("autodoc", "Set in <nbknots> and <nbpoles> the number of knots and poles of the curve resulting of the trimming of the bsplinecurve definded with <degree>, <knots>, <mults>.

Parameters
----------
Degree: int
Periodic: bool
Knots: TColStd_Array1OfReal
Mults: TColStd_Array1OfInteger
U1: float
U2: float

Returns
-------
NbKnots: int
NbPoles: int
") PrepareTrimming;
		static void PrepareTrimming(const Standard_Integer Degree, const Standard_Boolean Periodic, const TColStd_Array1OfReal & Knots, const TColStd_Array1OfInteger & Mults, const Standard_Real U1, const Standard_Real U2, Standard_Integer &OutValue, Standard_Integer &OutValue);

		/****************** PrepareUnperiodize ******************/
		/**** md5 signature: 836730920827f9f48a170c9a6982c170 ****/
		%feature("compactdefaultargs") PrepareUnperiodize;
		%feature("autodoc", "Set in <nbknots> and <nbpolestoadd> the number of knots and poles of the notperiodic curve identical at the periodic curve with a degree <degree> , a knots-distribution with multiplicities <mults>.

Parameters
----------
Degree: int
Mults: TColStd_Array1OfInteger

Returns
-------
NbKnots: int
NbPoles: int
") PrepareUnperiodize;
		static void PrepareUnperiodize(const Standard_Integer Degree, const TColStd_Array1OfInteger & Mults, Standard_Integer &OutValue, Standard_Integer &OutValue);

		/****************** RaiseMultiplicity ******************/
		/**** md5 signature: 1946ad36bcb97331dfe37ade25ab9172 ****/
		%feature("compactdefaultargs") RaiseMultiplicity;
		%feature("autodoc", "No available documentation.

Parameters
----------
KnotIndex: int
Mult: int
Degree: int
Periodic: bool
Poles: TColgp_Array1OfPnt
Weights: TColStd_Array1OfReal *
Knots: TColStd_Array1OfReal
Mults: TColStd_Array1OfInteger
NewPoles: TColgp_Array1OfPnt
NewWeights: TColStd_Array1OfReal *

Returns
-------
None
") RaiseMultiplicity;
		static void RaiseMultiplicity(const Standard_Integer KnotIndex, const Standard_Integer Mult, const Standard_Integer Degree, const Standard_Boolean Periodic, const TColgp_Array1OfPnt & Poles, const TColStd_Array1OfReal * Weights, const TColStd_Array1OfReal & Knots, const TColStd_Array1OfInteger & Mults, TColgp_Array1OfPnt & NewPoles, TColStd_Array1OfReal * NewWeights);

		/****************** RaiseMultiplicity ******************/
		/**** md5 signature: 7b68620f8f079008bff0083627e99357 ****/
		%feature("compactdefaultargs") RaiseMultiplicity;
		%feature("autodoc", "Raise the multiplicity of knot to <umult>. //! the new control points are returned. knots and mults are not updated.

Parameters
----------
KnotIndex: int
Mult: int
Degree: int
Periodic: bool
Poles: TColgp_Array1OfPnt2d
Weights: TColStd_Array1OfReal *
Knots: TColStd_Array1OfReal
Mults: TColStd_Array1OfInteger
NewPoles: TColgp_Array1OfPnt2d
NewWeights: TColStd_Array1OfReal *

Returns
-------
None
") RaiseMultiplicity;
		static void RaiseMultiplicity(const Standard_Integer KnotIndex, const Standard_Integer Mult, const Standard_Integer Degree, const Standard_Boolean Periodic, const TColgp_Array1OfPnt2d & Poles, const TColStd_Array1OfReal * Weights, const TColStd_Array1OfReal & Knots, const TColStd_Array1OfInteger & Mults, TColgp_Array1OfPnt2d & NewPoles, TColStd_Array1OfReal * NewWeights);

		/****************** RemoveKnot ******************/
		/**** md5 signature: f160cdfd0c6e8cbbd50655f8a175def1 ****/
		%feature("compactdefaultargs") RemoveKnot;
		%feature("autodoc", "No available documentation.

Parameters
----------
Index: int
Mult: int
Degree: int
Periodic: bool
Dimension: int
Poles: TColStd_Array1OfReal
Knots: TColStd_Array1OfReal
Mults: TColStd_Array1OfInteger
NewPoles: TColStd_Array1OfReal
NewKnots: TColStd_Array1OfReal
NewMults: TColStd_Array1OfInteger
Tolerance: float

Returns
-------
bool
") RemoveKnot;
		static Standard_Boolean RemoveKnot(const Standard_Integer Index, const Standard_Integer Mult, const Standard_Integer Degree, const Standard_Boolean Periodic, const Standard_Integer Dimension, const TColStd_Array1OfReal & Poles, const TColStd_Array1OfReal & Knots, const TColStd_Array1OfInteger & Mults, TColStd_Array1OfReal & NewPoles, TColStd_Array1OfReal & NewKnots, TColStd_Array1OfInteger & NewMults, const Standard_Real Tolerance);

		/****************** RemoveKnot ******************/
		/**** md5 signature: 34bd46c8df0be561677c850a078d12f8 ****/
		%feature("compactdefaultargs") RemoveKnot;
		%feature("autodoc", "No available documentation.

Parameters
----------
Index: int
Mult: int
Degree: int
Periodic: bool
Poles: TColgp_Array1OfPnt
Weights: TColStd_Array1OfReal *
Knots: TColStd_Array1OfReal
Mults: TColStd_Array1OfInteger
NewPoles: TColgp_Array1OfPnt
NewWeights: TColStd_Array1OfReal *
NewKnots: TColStd_Array1OfReal
NewMults: TColStd_Array1OfInteger
Tolerance: float

Returns
-------
bool
") RemoveKnot;
		static Standard_Boolean RemoveKnot(const Standard_Integer Index, const Standard_Integer Mult, const Standard_Integer Degree, const Standard_Boolean Periodic, const TColgp_Array1OfPnt & Poles, const TColStd_Array1OfReal * Weights, const TColStd_Array1OfReal & Knots, const TColStd_Array1OfInteger & Mults, TColgp_Array1OfPnt & NewPoles, TColStd_Array1OfReal * NewWeights, TColStd_Array1OfReal & NewKnots, TColStd_Array1OfInteger & NewMults, const Standard_Real Tolerance);

		/****************** RemoveKnot ******************/
		/**** md5 signature: e71867ea0e8715093b5a4551f8fb6194 ****/
		%feature("compactdefaultargs") RemoveKnot;
		%feature("autodoc", "Decrement the multiplicity of <knots(index)> to <mult>. if <mult> is null the knot is removed. //! as there are two ways to compute the new poles the midlle will be used as long as the distance is lower than tolerance. //! if a distance is bigger than tolerance the methods returns false and the new arrays are not modified. //! a low tolerance can be used to test if the knot can be removed without modifying the curve. //! a high tolerance can be used to 'smooth' the curve.

Parameters
----------
Index: int
Mult: int
Degree: int
Periodic: bool
Poles: TColgp_Array1OfPnt2d
Weights: TColStd_Array1OfReal *
Knots: TColStd_Array1OfReal
Mults: TColStd_Array1OfInteger
NewPoles: TColgp_Array1OfPnt2d
NewWeights: TColStd_Array1OfReal *
NewKnots: TColStd_Array1OfReal
NewMults: TColStd_Array1OfInteger
Tolerance: float

Returns
-------
bool
") RemoveKnot;
		static Standard_Boolean RemoveKnot(const Standard_Integer Index, const Standard_Integer Mult, const Standard_Integer Degree, const Standard_Boolean Periodic, const TColgp_Array1OfPnt2d & Poles, const TColStd_Array1OfReal * Weights, const TColStd_Array1OfReal & Knots, const TColStd_Array1OfInteger & Mults, TColgp_Array1OfPnt2d & NewPoles, TColStd_Array1OfReal * NewWeights, TColStd_Array1OfReal & NewKnots, TColStd_Array1OfInteger & NewMults, const Standard_Real Tolerance);

		/****************** Reparametrize ******************/
		/**** md5 signature: bbbfa1d8d52d7c2e9f0e7340e008bb30 ****/
		%feature("compactdefaultargs") Reparametrize;
		%feature("autodoc", "Reparametrizes a b-spline curve to [u1, u2]. the knot values are recomputed such that knots (lower) = u1 and knots (upper) = u2 but the knot form is not modified. warnings : in the array knots the values must be in ascending order. u1 must not be equal to u2 to avoid division by zero.

Parameters
----------
U1: float
U2: float
Knots: TColStd_Array1OfReal

Returns
-------
None
") Reparametrize;
		static void Reparametrize(const Standard_Real U1, const Standard_Real U2, TColStd_Array1OfReal & Knots);

		/****************** Resolution ******************/
		/**** md5 signature: de69ea6ca10e0ce95eff768774f1d362 ****/
		%feature("compactdefaultargs") Resolution;
		%feature("autodoc", "Given a tolerance in 3d space returns a tolerance in u parameter space such that all u1 and u0 in the domain of the curve f(u) | u1 - u0 | < utolerance and we have |f (u1) - f (u0)| < tolerance3d.

Parameters
----------
ArrayDimension: int
NumPoles: int
Weights: TColStd_Array1OfReal *
FlatKnots: TColStd_Array1OfReal
Degree: int
Tolerance3D: float

Returns
-------
PolesArray: float
UTolerance: float
") Resolution;
		static void Resolution(Standard_Real &OutValue, const Standard_Integer ArrayDimension, const Standard_Integer NumPoles, const TColStd_Array1OfReal * Weights, const TColStd_Array1OfReal & FlatKnots, const Standard_Integer Degree, const Standard_Real Tolerance3D, Standard_Real &OutValue);

		/****************** Resolution ******************/
		/**** md5 signature: fd89dc61e5eb0f58d4d83427f246b2e2 ****/
		%feature("compactdefaultargs") Resolution;
		%feature("autodoc", "Given a tolerance in 3d space returns a tolerance in u parameter space such that all u1 and u0 in the domain of the curve f(u) | u1 - u0 | < utolerance and we have |f (u1) - f (u0)| < tolerance3d.

Parameters
----------
Poles: TColgp_Array1OfPnt
Weights: TColStd_Array1OfReal *
NumPoles: int
FlatKnots: TColStd_Array1OfReal
Degree: int
Tolerance3D: float

Returns
-------
UTolerance: float
") Resolution;
		static void Resolution(const TColgp_Array1OfPnt & Poles, const TColStd_Array1OfReal * Weights, const Standard_Integer NumPoles, const TColStd_Array1OfReal & FlatKnots, const Standard_Integer Degree, const Standard_Real Tolerance3D, Standard_Real &OutValue);

		/****************** Resolution ******************/
		/**** md5 signature: 0c2d8874908243eb1c48ec7d26f9316f ****/
		%feature("compactdefaultargs") Resolution;
		%feature("autodoc", "Given a tolerance in 3d space returns a tolerance in u parameter space such that all u1 and u0 in the domain of the curve f(u) | u1 - u0 | < utolerance and we have |f (u1) - f (u0)| < tolerance3d.

Parameters
----------
Poles: TColgp_Array1OfPnt2d
Weights: TColStd_Array1OfReal *
NumPoles: int
FlatKnots: TColStd_Array1OfReal
Degree: int
Tolerance3D: float

Returns
-------
UTolerance: float
") Resolution;
		static void Resolution(const TColgp_Array1OfPnt2d & Poles, const TColStd_Array1OfReal * Weights, const Standard_Integer NumPoles, const TColStd_Array1OfReal & FlatKnots, const Standard_Integer Degree, const Standard_Real Tolerance3D, Standard_Real &OutValue);

		/****************** Reverse ******************/
		/**** md5 signature: a57ac0e6f5478fd607e57b2d503d32c8 ****/
		%feature("compactdefaultargs") Reverse;
		%feature("autodoc", "Reverses the array knots to become the knots sequence of the reversed curve.

Parameters
----------
Knots: TColStd_Array1OfReal

Returns
-------
None
") Reverse;
		static void Reverse(TColStd_Array1OfReal & Knots);

		/****************** Reverse ******************/
		/**** md5 signature: c2e64bc5830d7c8e0576d2e63c1563a5 ****/
		%feature("compactdefaultargs") Reverse;
		%feature("autodoc", "Reverses the array of multiplicities.

Parameters
----------
Mults: TColStd_Array1OfInteger

Returns
-------
None
") Reverse;
		static void Reverse(TColStd_Array1OfInteger & Mults);

		/****************** Reverse ******************/
		/**** md5 signature: 69e198037b66038a66f7df106e5282f2 ****/
		%feature("compactdefaultargs") Reverse;
		%feature("autodoc", "Reverses the array of poles. last is the index of the new first pole. on a non periodic curve last is poles.upper(). on a periodic curve last is //! (number of flat knots - degree - 1) //! or //! (sum of multiplicities(but for the last) + degree - 1).

Parameters
----------
Poles: TColgp_Array1OfPnt
Last: int

Returns
-------
None
") Reverse;
		static void Reverse(TColgp_Array1OfPnt & Poles, const Standard_Integer Last);

		/****************** Reverse ******************/
		/**** md5 signature: beac5e4762c742fc3695999616889a86 ****/
		%feature("compactdefaultargs") Reverse;
		%feature("autodoc", "Reverses the array of poles.

Parameters
----------
Poles: TColgp_Array1OfPnt2d
Last: int

Returns
-------
None
") Reverse;
		static void Reverse(TColgp_Array1OfPnt2d & Poles, const Standard_Integer Last);

		/****************** Reverse ******************/
		/**** md5 signature: fd8b3bb4d9426a07eb99e7597647bc3c ****/
		%feature("compactdefaultargs") Reverse;
		%feature("autodoc", "Reverses the array of poles.

Parameters
----------
Weights: TColStd_Array1OfReal
Last: int

Returns
-------
None
") Reverse;
		static void Reverse(TColStd_Array1OfReal & Weights, const Standard_Integer Last);

		/****************** SolveBandedSystem ******************/
		/**** md5 signature: 435953bec122c49c9cda2b95930416f9 ****/
		%feature("compactdefaultargs") SolveBandedSystem;
		%feature("autodoc", "This solves the system matrix.x = b with when matrix is factored in lu form the array is an seen as an array[1..n][1..arraydimension] with n = the rank of the matrix matrix. the result is stored in array when each coordinate is solved that is b is the array whose values are b[i] = array[i][p] for each p in 1..arraydimension.

Parameters
----------
Matrix: math_Matrix
UpperBandWidth: int
LowerBandWidth: int
ArrayDimension: int

Returns
-------
Array: float
") SolveBandedSystem;
		static Standard_Integer SolveBandedSystem(const math_Matrix & Matrix, const Standard_Integer UpperBandWidth, const Standard_Integer LowerBandWidth, const Standard_Integer ArrayDimension, Standard_Real &OutValue);

		/****************** SolveBandedSystem ******************/
		/**** md5 signature: 55bf803527f642f5424d89c2b6d60155 ****/
		%feature("compactdefaultargs") SolveBandedSystem;
		%feature("autodoc", "This solves the system matrix.x = b with when matrix is factored in lu form the array has the length of the rank of the matrix matrix. the result is stored in array when each coordinate is solved that is b is the array whose values are b[i] = array[i][p] for each p in 1..arraydimension.

Parameters
----------
Matrix: math_Matrix
UpperBandWidth: int
LowerBandWidth: int
Array: TColgp_Array1OfPnt2d

Returns
-------
int
") SolveBandedSystem;
		static Standard_Integer SolveBandedSystem(const math_Matrix & Matrix, const Standard_Integer UpperBandWidth, const Standard_Integer LowerBandWidth, TColgp_Array1OfPnt2d & Array);

		/****************** SolveBandedSystem ******************/
		/**** md5 signature: cedb120aa0a87996dc1fe431f2a79558 ****/
		%feature("compactdefaultargs") SolveBandedSystem;
		%feature("autodoc", "This solves the system matrix.x = b with when matrix is factored in lu form the array has the length of the rank of the matrix matrix. the result is stored in array when each coordinate is solved that is b is the array whose values are b[i] = array[i][p] for each p in 1..arraydimension.

Parameters
----------
Matrix: math_Matrix
UpperBandWidth: int
LowerBandWidth: int
Array: TColgp_Array1OfPnt

Returns
-------
int
") SolveBandedSystem;
		static Standard_Integer SolveBandedSystem(const math_Matrix & Matrix, const Standard_Integer UpperBandWidth, const Standard_Integer LowerBandWidth, TColgp_Array1OfPnt & Array);

		/****************** SolveBandedSystem ******************/
		/**** md5 signature: 5571a92dbcd003f3cd215893f9c76410 ****/
		%feature("compactdefaultargs") SolveBandedSystem;
		%feature("autodoc", "No available documentation.

Parameters
----------
Matrix: math_Matrix
UpperBandWidth: int
LowerBandWidth: int
HomogenousFlag: bool
ArrayDimension: int

Returns
-------
Array: float
Weights: float
") SolveBandedSystem;
		static Standard_Integer SolveBandedSystem(const math_Matrix & Matrix, const Standard_Integer UpperBandWidth, const Standard_Integer LowerBandWidth, const Standard_Boolean HomogenousFlag, const Standard_Integer ArrayDimension, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** SolveBandedSystem ******************/
		/**** md5 signature: c3b54f9241e23af58a316990c4c05c84 ****/
		%feature("compactdefaultargs") SolveBandedSystem;
		%feature("autodoc", "This solves the system matrix.x = b with when matrix is factored in lu form the array is an seen as an array[1..n][1..arraydimension] with n = the rank of the matrix matrix. the result is stored in array when each coordinate is solved that is b is the array whose values are b[i] = array[i][p] for each p in 1..arraydimension. if homogeneousflag == 0 the poles are multiplied by the weights uppon entry and once interpolation is carried over the result of the poles are divided by the result of the interpolation of the weights. otherwise if homogenousflag == 1 the poles and weigths are treated homogenously that is that those are interpolated as they are and result is returned without division by the interpolated weigths.

Parameters
----------
Matrix: math_Matrix
UpperBandWidth: int
LowerBandWidth: int
HomogenousFlag: bool
Array: TColgp_Array1OfPnt2d
Weights: TColStd_Array1OfReal

Returns
-------
int
") SolveBandedSystem;
		static Standard_Integer SolveBandedSystem(const math_Matrix & Matrix, const Standard_Integer UpperBandWidth, const Standard_Integer LowerBandWidth, const Standard_Boolean HomogenousFlag, TColgp_Array1OfPnt2d & Array, TColStd_Array1OfReal & Weights);

		/****************** SolveBandedSystem ******************/
		/**** md5 signature: bf46510a32c49fb829ee5209d1191b72 ****/
		%feature("compactdefaultargs") SolveBandedSystem;
		%feature("autodoc", "This solves the system matrix.x = b with when matrix is factored in lu form the array is an seen as an array[1..n][1..arraydimension] with n = the rank of the matrix matrix. the result is stored in array when each coordinate is solved that is b is the array whose values are b[i] = array[i][p] for each p in 1..arraydimension if homogeneousflag == 0 the poles are multiplied by the weights uppon entry and once interpolation is carried over the result of the poles are divided by the result of the interpolation of the weights. otherwise if homogenousflag == 1 the poles and weigths are treated homogenously that is that those are interpolated as they are and result is returned without division by the interpolated weigths.

Parameters
----------
Matrix: math_Matrix
UpperBandWidth: int
LowerBandWidth: int
HomogeneousFlag: bool
Array: TColgp_Array1OfPnt
Weights: TColStd_Array1OfReal

Returns
-------
int
") SolveBandedSystem;
		static Standard_Integer SolveBandedSystem(const math_Matrix & Matrix, const Standard_Integer UpperBandWidth, const Standard_Integer LowerBandWidth, const Standard_Boolean HomogeneousFlag, TColgp_Array1OfPnt & Array, TColStd_Array1OfReal & Weights);

		/****************** TangExtendToConstraint ******************/
		/**** md5 signature: b7146095fa28ab3e0edbfadc067c542f ****/
		%feature("compactdefaultargs") TangExtendToConstraint;
		%feature("autodoc", "Extend a bspline nd using the tangency map <c1coefficient> is the coefficient of reparametrisation <continuity> must be equal to 1, 2 or 3. <degree> must be greater or equal than <continuity> + 1. //! warning: <knotsresult> and <polesresult> must be dimensionned properly.

Parameters
----------
FlatKnots: TColStd_Array1OfReal
C1Coefficient: float
NumPoles: int
Dimension: int
Degree: int
ConstraintPoint: TColStd_Array1OfReal
Continuity: int
After: bool

Returns
-------
Poles: float
NbPolesResult: int
NbKnotsRsult: int
KnotsResult: float
PolesResult: float
") TangExtendToConstraint;
		static void TangExtendToConstraint(const TColStd_Array1OfReal & FlatKnots, const Standard_Real C1Coefficient, const Standard_Integer NumPoles, Standard_Real &OutValue, const Standard_Integer Dimension, const Standard_Integer Degree, const TColStd_Array1OfReal & ConstraintPoint, const Standard_Integer Continuity, const Standard_Boolean After, Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** Trimming ******************/
		/**** md5 signature: f2180a9ffc628aafc10d57997f0ab25d ****/
		%feature("compactdefaultargs") Trimming;
		%feature("autodoc", "No available documentation.

Parameters
----------
Degree: int
Periodic: bool
Dimension: int
Knots: TColStd_Array1OfReal
Mults: TColStd_Array1OfInteger
Poles: TColStd_Array1OfReal
U1: float
U2: float
NewKnots: TColStd_Array1OfReal
NewMults: TColStd_Array1OfInteger
NewPoles: TColStd_Array1OfReal

Returns
-------
None
") Trimming;
		static void Trimming(const Standard_Integer Degree, const Standard_Boolean Periodic, const Standard_Integer Dimension, const TColStd_Array1OfReal & Knots, const TColStd_Array1OfInteger & Mults, const TColStd_Array1OfReal & Poles, const Standard_Real U1, const Standard_Real U2, TColStd_Array1OfReal & NewKnots, TColStd_Array1OfInteger & NewMults, TColStd_Array1OfReal & NewPoles);

		/****************** Trimming ******************/
		/**** md5 signature: 9fe28b7ad9be71c6a1af6e80c38e8036 ****/
		%feature("compactdefaultargs") Trimming;
		%feature("autodoc", "No available documentation.

Parameters
----------
Degree: int
Periodic: bool
Knots: TColStd_Array1OfReal
Mults: TColStd_Array1OfInteger
Poles: TColgp_Array1OfPnt
Weights: TColStd_Array1OfReal *
U1: float
U2: float
NewKnots: TColStd_Array1OfReal
NewMults: TColStd_Array1OfInteger
NewPoles: TColgp_Array1OfPnt
NewWeights: TColStd_Array1OfReal *

Returns
-------
None
") Trimming;
		static void Trimming(const Standard_Integer Degree, const Standard_Boolean Periodic, const TColStd_Array1OfReal & Knots, const TColStd_Array1OfInteger & Mults, const TColgp_Array1OfPnt & Poles, const TColStd_Array1OfReal * Weights, const Standard_Real U1, const Standard_Real U2, TColStd_Array1OfReal & NewKnots, TColStd_Array1OfInteger & NewMults, TColgp_Array1OfPnt & NewPoles, TColStd_Array1OfReal * NewWeights);

		/****************** Trimming ******************/
		/**** md5 signature: 81cf27d83e373b0ace7635f2fcda30fb ****/
		%feature("compactdefaultargs") Trimming;
		%feature("autodoc", "No available documentation.

Parameters
----------
Degree: int
Periodic: bool
Knots: TColStd_Array1OfReal
Mults: TColStd_Array1OfInteger
Poles: TColgp_Array1OfPnt2d
Weights: TColStd_Array1OfReal *
U1: float
U2: float
NewKnots: TColStd_Array1OfReal
NewMults: TColStd_Array1OfInteger
NewPoles: TColgp_Array1OfPnt2d
NewWeights: TColStd_Array1OfReal *

Returns
-------
None
") Trimming;
		static void Trimming(const Standard_Integer Degree, const Standard_Boolean Periodic, const TColStd_Array1OfReal & Knots, const TColStd_Array1OfInteger & Mults, const TColgp_Array1OfPnt2d & Poles, const TColStd_Array1OfReal * Weights, const Standard_Real U1, const Standard_Real U2, TColStd_Array1OfReal & NewKnots, TColStd_Array1OfInteger & NewMults, TColgp_Array1OfPnt2d & NewPoles, TColStd_Array1OfReal * NewWeights);

		/****************** Unperiodize ******************/
		/**** md5 signature: abc1100a37dd462dd6a37ec73c9525d8 ****/
		%feature("compactdefaultargs") Unperiodize;
		%feature("autodoc", "No available documentation.

Parameters
----------
Degree: int
Dimension: int
Mults: TColStd_Array1OfInteger
Knots: TColStd_Array1OfReal
Poles: TColStd_Array1OfReal
NewMults: TColStd_Array1OfInteger
NewKnots: TColStd_Array1OfReal
NewPoles: TColStd_Array1OfReal

Returns
-------
None
") Unperiodize;
		static void Unperiodize(const Standard_Integer Degree, const Standard_Integer Dimension, const TColStd_Array1OfInteger & Mults, const TColStd_Array1OfReal & Knots, const TColStd_Array1OfReal & Poles, TColStd_Array1OfInteger & NewMults, TColStd_Array1OfReal & NewKnots, TColStd_Array1OfReal & NewPoles);

		/****************** Unperiodize ******************/
		/**** md5 signature: d1992345708ea61d4ff0e42760ddfbc4 ****/
		%feature("compactdefaultargs") Unperiodize;
		%feature("autodoc", "No available documentation.

Parameters
----------
Degree: int
Mults: TColStd_Array1OfInteger
Knots: TColStd_Array1OfReal
Poles: TColgp_Array1OfPnt
Weights: TColStd_Array1OfReal *
NewMults: TColStd_Array1OfInteger
NewKnots: TColStd_Array1OfReal
NewPoles: TColgp_Array1OfPnt
NewWeights: TColStd_Array1OfReal *

Returns
-------
None
") Unperiodize;
		static void Unperiodize(const Standard_Integer Degree, const TColStd_Array1OfInteger & Mults, const TColStd_Array1OfReal & Knots, const TColgp_Array1OfPnt & Poles, const TColStd_Array1OfReal * Weights, TColStd_Array1OfInteger & NewMults, TColStd_Array1OfReal & NewKnots, TColgp_Array1OfPnt & NewPoles, TColStd_Array1OfReal * NewWeights);

		/****************** Unperiodize ******************/
		/**** md5 signature: abc855f8a13aa28d61372d2f6e249d88 ****/
		%feature("compactdefaultargs") Unperiodize;
		%feature("autodoc", "No available documentation.

Parameters
----------
Degree: int
Mults: TColStd_Array1OfInteger
Knots: TColStd_Array1OfReal
Poles: TColgp_Array1OfPnt2d
Weights: TColStd_Array1OfReal *
NewMults: TColStd_Array1OfInteger
NewKnots: TColStd_Array1OfReal
NewPoles: TColgp_Array1OfPnt2d
NewWeights: TColStd_Array1OfReal *

Returns
-------
None
") Unperiodize;
		static void Unperiodize(const Standard_Integer Degree, const TColStd_Array1OfInteger & Mults, const TColStd_Array1OfReal & Knots, const TColgp_Array1OfPnt2d & Poles, const TColStd_Array1OfReal * Weights, TColStd_Array1OfInteger & NewMults, TColStd_Array1OfReal & NewKnots, TColgp_Array1OfPnt2d & NewPoles, TColStd_Array1OfReal * NewWeights);

};


%extend BSplCLib {
	%pythoncode {
	__repr__ = _dumps_object

	@methodnotwrapped
	def DN(self):
		pass
	}
};

/***********************
* class BSplCLib_Cache *
***********************/
class BSplCLib_Cache : public Standard_Transient {
	public:
		/****************** BSplCLib_Cache ******************/
		/**** md5 signature: 1ec50ce3ef0f91a1b9421df2d746932f ****/
		%feature("compactdefaultargs") BSplCLib_Cache;
		%feature("autodoc", "Constructor, prepares data structures for caching values on a 2d curve. \param thedegree degree of the curve \param theperiodic identify whether the curve is periodic \param theflatknots knots of bezier/b-spline curve (with repetitions) \param thepoles2d array of poles of 2d curve \param theweights array of weights of corresponding poles.

Parameters
----------
theDegree: int
thePeriodic: bool
theFlatKnots: TColStd_Array1OfReal
thePoles2d: TColgp_Array1OfPnt2d
theWeights: TColStd_Array1OfReal *,optional
	default value is NULL

Returns
-------
None
") BSplCLib_Cache;
		 BSplCLib_Cache(const Standard_Integer & theDegree, const Standard_Boolean & thePeriodic, const TColStd_Array1OfReal & theFlatKnots, const TColgp_Array1OfPnt2d & thePoles2d, const TColStd_Array1OfReal * theWeights = NULL);

		/****************** BSplCLib_Cache ******************/
		/**** md5 signature: 112e58d863cf27a409215f9f9a35ff27 ****/
		%feature("compactdefaultargs") BSplCLib_Cache;
		%feature("autodoc", "Constructor, prepares data structures for caching values on a 3d curve. \param thedegree degree of the curve \param theperiodic identify whether the curve is periodic \param theflatknots knots of bezier/b-spline curve (with repetitions) \param thepoles array of poles of 3d curve \param theweights array of weights of corresponding poles.

Parameters
----------
theDegree: int
thePeriodic: bool
theFlatKnots: TColStd_Array1OfReal
thePoles: TColgp_Array1OfPnt
theWeights: TColStd_Array1OfReal *,optional
	default value is NULL

Returns
-------
None
") BSplCLib_Cache;
		 BSplCLib_Cache(const Standard_Integer & theDegree, const Standard_Boolean & thePeriodic, const TColStd_Array1OfReal & theFlatKnots, const TColgp_Array1OfPnt & thePoles, const TColStd_Array1OfReal * theWeights = NULL);

		/****************** BuildCache ******************/
		/**** md5 signature: 004becef4793ac2147bbccc9f21ed48e ****/
		%feature("compactdefaultargs") BuildCache;
		%feature("autodoc", "Recomputes the cache data for 2d curves. does not verify validity of the cache \param theparameter the value on the knot's axis to identify the span \param theflatknots knots of bezier/b-spline curve (with repetitions) \param thepoles2d array of poles of 2d curve \param theweights array of weights of corresponding poles.

Parameters
----------
theParameter: float
theFlatKnots: TColStd_Array1OfReal
thePoles2d: TColgp_Array1OfPnt2d
theWeights: TColStd_Array1OfReal *

Returns
-------
None
") BuildCache;
		void BuildCache(const Standard_Real & theParameter, const TColStd_Array1OfReal & theFlatKnots, const TColgp_Array1OfPnt2d & thePoles2d, const TColStd_Array1OfReal * theWeights);

		/****************** BuildCache ******************/
		/**** md5 signature: 708c8206d06c2954f982bc24a07bbc07 ****/
		%feature("compactdefaultargs") BuildCache;
		%feature("autodoc", "Recomputes the cache data for 3d curves. does not verify validity of the cache \param theparameter the value on the knot's axis to identify the span \param theflatknots knots of bezier/b-spline curve (with repetitions) \param thepoles array of poles of 3d curve \param theweights array of weights of corresponding poles.

Parameters
----------
theParameter: float
theFlatKnots: TColStd_Array1OfReal
thePoles: TColgp_Array1OfPnt
theWeights: TColStd_Array1OfReal *,optional
	default value is NULL

Returns
-------
None
") BuildCache;
		void BuildCache(const Standard_Real & theParameter, const TColStd_Array1OfReal & theFlatKnots, const TColgp_Array1OfPnt & thePoles, const TColStd_Array1OfReal * theWeights = NULL);

		/****************** D0 ******************/
		/**** md5 signature: 821844347e34610caaa0b5bbfa0cf4d7 ****/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "Calculates the point on the curve in the specified parameter \param[in] theparameter parameter of calculation of the value \param[out] thepoint the result of calculation (the point on the curve).

Parameters
----------
theParameter: float
thePoint: gp_Pnt2d

Returns
-------
None
") D0;
		void D0(const Standard_Real & theParameter, gp_Pnt2d & thePoint);

		/****************** D0 ******************/
		/**** md5 signature: 4aeb2d0857a7db45a96aa1fec77d5445 ****/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "No available documentation.

Parameters
----------
theParameter: float
thePoint: gp_Pnt

Returns
-------
None
") D0;
		void D0(const Standard_Real & theParameter, gp_Pnt & thePoint);

		/****************** D1 ******************/
		/**** md5 signature: 1c2fb9815cecbaddf6ab913e1725d597 ****/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "Calculates the point on the curve and its first derivative in the specified parameter \param[in] theparameter parameter of calculation of the value \param[out] thepoint the result of calculation (the point on the curve) \param[out] thetangent tangent vector (first derivatives) for the curve in the calculated point.

Parameters
----------
theParameter: float
thePoint: gp_Pnt2d
theTangent: gp_Vec2d

Returns
-------
None
") D1;
		void D1(const Standard_Real & theParameter, gp_Pnt2d & thePoint, gp_Vec2d & theTangent);

		/****************** D1 ******************/
		/**** md5 signature: 9162e0f68e80a2c7ce80aafd532c64cb ****/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "No available documentation.

Parameters
----------
theParameter: float
thePoint: gp_Pnt
theTangent: gp_Vec

Returns
-------
None
") D1;
		void D1(const Standard_Real & theParameter, gp_Pnt & thePoint, gp_Vec & theTangent);

		/****************** D2 ******************/
		/**** md5 signature: cde9b4ade9c2395288cb140e226b4245 ****/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "Calculates the point on the curve and two derivatives in the specified parameter \param[in] theparameter parameter of calculation of the value \param[out] thepoint the result of calculation (the point on the curve) \param[out] thetangent tangent vector (1st derivatives) for the curve in the calculated point \param[out] thecurvature curvature vector (2nd derivatives) for the curve in the calculated point.

Parameters
----------
theParameter: float
thePoint: gp_Pnt2d
theTangent: gp_Vec2d
theCurvature: gp_Vec2d

Returns
-------
None
") D2;
		void D2(const Standard_Real & theParameter, gp_Pnt2d & thePoint, gp_Vec2d & theTangent, gp_Vec2d & theCurvature);

		/****************** D2 ******************/
		/**** md5 signature: 096890fee85d22526ec280b33e9b01d0 ****/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "No available documentation.

Parameters
----------
theParameter: float
thePoint: gp_Pnt
theTangent: gp_Vec
theCurvature: gp_Vec

Returns
-------
None
") D2;
		void D2(const Standard_Real & theParameter, gp_Pnt & thePoint, gp_Vec & theTangent, gp_Vec & theCurvature);

		/****************** D3 ******************/
		/**** md5 signature: 2966e3bc0512076dd282c4c044fbb4ce ****/
		%feature("compactdefaultargs") D3;
		%feature("autodoc", "Calculates the point on the curve and three derivatives in the specified parameter \param[in] theparameter parameter of calculation of the value \param[out] thepoint the result of calculation (the point on the curve) \param[out] thetangent tangent vector (1st derivatives) for the curve in the calculated point \param[out] thecurvature curvature vector (2nd derivatives) for the curve in the calculated point \param[out] thetorsion second curvature vector (3rd derivatives) for the curve in the calculated point.

Parameters
----------
theParameter: float
thePoint: gp_Pnt2d
theTangent: gp_Vec2d
theCurvature: gp_Vec2d
theTorsion: gp_Vec2d

Returns
-------
None
") D3;
		void D3(const Standard_Real & theParameter, gp_Pnt2d & thePoint, gp_Vec2d & theTangent, gp_Vec2d & theCurvature, gp_Vec2d & theTorsion);

		/****************** D3 ******************/
		/**** md5 signature: 7d9b71e69ccb4be4fe8edf3517a87d48 ****/
		%feature("compactdefaultargs") D3;
		%feature("autodoc", "No available documentation.

Parameters
----------
theParameter: float
thePoint: gp_Pnt
theTangent: gp_Vec
theCurvature: gp_Vec
theTorsion: gp_Vec

Returns
-------
None
") D3;
		void D3(const Standard_Real & theParameter, gp_Pnt & thePoint, gp_Vec & theTangent, gp_Vec & theCurvature, gp_Vec & theTorsion);

		/****************** IsCacheValid ******************/
		/**** md5 signature: 210fe9378d91587e36bde7d36f9a15e1 ****/
		%feature("compactdefaultargs") IsCacheValid;
		%feature("autodoc", "Verifies validity of the cache using flat parameter of the point \param theparameter parameter of the point placed in the span.

Parameters
----------
theParameter: float

Returns
-------
bool
") IsCacheValid;
		Standard_Boolean IsCacheValid(Standard_Real theParameter);

};


%make_alias(BSplCLib_Cache)

%extend BSplCLib_Cache {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************
* class BSplCLib_CacheParams *
*****************************/
class BSplCLib_CacheParams {
	public:
		float SpanStart;
		float SpanLength;
		int SpanIndex;
		/****************** BSplCLib_CacheParams ******************/
		/**** md5 signature: 9dc6d39f5a0f6a64d0c5f2ef90fb4329 ****/
		%feature("compactdefaultargs") BSplCLib_CacheParams;
		%feature("autodoc", "Constructor, prepares data structures for caching. \param thedegree degree of the b-spline (or bezier) \param theperiodic identify whether the b-spline is periodic \param theflatknots knots of bezier / b-spline parameterization.

Parameters
----------
theDegree: int
thePeriodic: bool
theFlatKnots: TColStd_Array1OfReal

Returns
-------
None
") BSplCLib_CacheParams;
		 BSplCLib_CacheParams(Standard_Integer theDegree, Standard_Boolean thePeriodic, const TColStd_Array1OfReal & theFlatKnots);

		/****************** IsCacheValid ******************/
		/**** md5 signature: 2640e4ed5e0bdb2780fab01a6614a67a ****/
		%feature("compactdefaultargs") IsCacheValid;
		%feature("autodoc", "Verifies validity of the cache using flat parameter of the point \param theparameter parameter of the point placed in the span.

Parameters
----------
theParameter: float

Returns
-------
bool
") IsCacheValid;
		Standard_Boolean IsCacheValid(Standard_Real theParameter);

		/****************** LocateParameter ******************/
		/**** md5 signature: 9d0335be5e67d75027256e3751327542 ****/
		%feature("compactdefaultargs") LocateParameter;
		%feature("autodoc", "Computes span for the specified parameter \param theparameter parameter of the point placed in the span \param theflatknots knots of bezier / b-spline parameterization.

Parameters
----------
theFlatKnots: TColStd_Array1OfReal

Returns
-------
theParameter: float
") LocateParameter;
		void LocateParameter(Standard_Real &OutValue, const TColStd_Array1OfReal & theFlatKnots);

		/****************** PeriodicNormalization ******************/
		/**** md5 signature: f0c31ac0ad331d040f83cb12652abaed ****/
		%feature("compactdefaultargs") PeriodicNormalization;
		%feature("autodoc", "Normalizes the parameter for periodic b-splines \param theparameter the value to be normalized into the knots array.

Parameters
----------
theParameter: float

Returns
-------
float
") PeriodicNormalization;
		Standard_Real PeriodicNormalization(Standard_Real theParameter);

};


%extend BSplCLib_CacheParams {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************************
* class BSplCLib_EvaluatorFunction *
***********************************/
/* python proxy for excluded classes */
%pythoncode {
@classnotwrapped
class BSplCLib_EvaluatorFunction:
	pass

}
/* end python proxy for excluded classes */
/* harray1 classes */
/* harray2 classes */
/* hsequence classes */
