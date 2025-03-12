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
%define BSPLCLIBDOCSTRING
"BSplCLib module, see official documentation at
https://dev.opencascade.org/doc/occt-7.8.0/refman/html/package_bsplclib.html"
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
%include ../common/EnumTemplates.i
%include ../common/Operators.i
%include ../common/OccHandle.i
%include ../common/IOStream.i
%include ../common/ArrayMacros.i


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
enum BSplCLib_KnotDistribution {
	BSplCLib_NonUniform = 0,
	BSplCLib_Uniform = 1,
};

enum BSplCLib_MultDistribution {
	BSplCLib_NonConstant = 0,
	BSplCLib_Constant = 1,
	BSplCLib_QuasiConstant = 2,
};

/* end public enums declaration */

/* python proxy classes for enums */
%pythoncode {

class BSplCLib_KnotDistribution(IntEnum):
	BSplCLib_NonUniform = 0
	BSplCLib_Uniform = 1
BSplCLib_NonUniform = BSplCLib_KnotDistribution.BSplCLib_NonUniform
BSplCLib_Uniform = BSplCLib_KnotDistribution.BSplCLib_Uniform

class BSplCLib_MultDistribution(IntEnum):
	BSplCLib_NonConstant = 0
	BSplCLib_Constant = 1
	BSplCLib_QuasiConstant = 2
BSplCLib_NonConstant = BSplCLib_MultDistribution.BSplCLib_NonConstant
BSplCLib_Constant = BSplCLib_MultDistribution.BSplCLib_Constant
BSplCLib_QuasiConstant = BSplCLib_MultDistribution.BSplCLib_QuasiConstant
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
		/****** BSplCLib::AntiBoorScheme ******/
		/****** md5 signature: f2a15c1ab9b1fa3f3839f413b77c4060 ******/
		%feature("compactdefaultargs") AntiBoorScheme;
		%feature("autodoc", "
Parameters
----------
U: float
Degree: int
Dimension: int
Depth: int
Length: int
Tolerance: float

Return
-------
Knots: float
Poles: float

Description
-----------
Compute the content of Pole before the BoorScheme. This method is used to remove poles. //! U is the poles to remove, Knots should contains the knots of the curve after knot removal. //! The first and last poles do not change, the other poles are computed by averaging two possible values. The distance between the two possible poles is computed, if it is higher than <Tolerance> False is returned.
") AntiBoorScheme;
		static Standard_Boolean AntiBoorScheme(const Standard_Real U, const Standard_Integer Degree, Standard_Real &OutValue, const Standard_Integer Dimension, Standard_Real &OutValue, const Standard_Integer Depth, const Standard_Integer Length, const Standard_Real Tolerance);

		/****** BSplCLib::Bohm ******/
		/****** md5 signature: 84b7e6290b2939358c0b5fd95367ff2c ******/
		%feature("compactdefaultargs") Bohm;
		%feature("autodoc", "
Parameters
----------
U: float
Degree: int
N: int
Dimension: int

Return
-------
Knots: float
Poles: float

Description
-----------
Performs the Bohm Algorithm at parameter <U>. This algorithm computes the value and all the derivatives up to order N (N <= Degree). //! <Poles> is the original array of poles. //! The result in <Poles> is the value and the derivatives. Poles[0] is the value, Poles[Degree] is the last derivative.
") Bohm;
		static void Bohm(const Standard_Real U, const Standard_Integer Degree, const Standard_Integer N, Standard_Real &OutValue, const Standard_Integer Dimension, Standard_Real &OutValue);

		/****** BSplCLib::BoorIndex ******/
		/****** md5 signature: fe6c98ba2e3115fab44859a66dddd7d5 ******/
		%feature("compactdefaultargs") BoorIndex;
		%feature("autodoc", "
Parameters
----------
Index: int
Length: int
Depth: int

Return
-------
int

Description
-----------
Returns the index in the Boor result array of the poles <Index>. If the Boor algorithm was perform with <Length> and <Depth>.
") BoorIndex;
		static Standard_Integer BoorIndex(const Standard_Integer Index, const Standard_Integer Length, const Standard_Integer Depth);

		/****** BSplCLib::BoorScheme ******/
		/****** md5 signature: eefddfccb28bb41dfcee6873cbf310be ******/
		%feature("compactdefaultargs") BoorScheme;
		%feature("autodoc", "
Parameters
----------
U: float
Degree: int
Dimension: int
Depth: int
Length: int

Return
-------
Knots: float
Poles: float

Description
-----------
Performs the Boor Algorithm at parameter <U> with the given <Degree> and the array of <Knots> on the poles <Poles> of dimension <Dimension>. The schema is computed until level <Depth> on a basis of <Length+1> poles. //! * Knots is an array of reals of length: //! <Length> + <Degree> //! * Poles is an array of reals of length: //! (2 * <Length> + 1) * <Dimension> //! The poles values must be set in the array at the positions. //! 0..Dimension, //! 2 * Dimension .. 3 * Dimension //! 4 * Dimension .. 5 * Dimension //! ... //! The results are found in the array poles depending on the Depth. (See the method GetPole).
") BoorScheme;
		static void BoorScheme(const Standard_Real U, const Standard_Integer Degree, Standard_Real &OutValue, const Standard_Integer Dimension, Standard_Real &OutValue, const Standard_Integer Depth, const Standard_Integer Length);

		/****** BSplCLib::BuildBSpMatrix ******/
		/****** md5 signature: 4fca6c948c6dad78f4e6206c4ebe72d7 ******/
		%feature("compactdefaultargs") BuildBSpMatrix;
		%feature("autodoc", "
Parameters
----------
Parameters: TColStd_Array1OfReal
OrderArray: TColStd_Array1OfInteger
FlatKnots: TColStd_Array1OfReal
Degree: int
Matrix: math_Matrix

Return
-------
UpperBandWidth: int
LowerBandWidth: int

Description
-----------
This Builds a fully blown Matrix of (ni) Bi (tj) //! with i and j within 1..Order + NumPoles The integer ni is the ith slot of the array OrderArray, tj is the jth slot of the array Parameters.
") BuildBSpMatrix;
		static Standard_Integer BuildBSpMatrix(const TColStd_Array1OfReal & Parameters, const TColStd_Array1OfInteger & OrderArray, const TColStd_Array1OfReal & FlatKnots, const Standard_Integer Degree, math_Matrix & Matrix, Standard_Integer &OutValue, Standard_Integer &OutValue);

		/****** BSplCLib::BuildBoor ******/
		/****** md5 signature: f16cfb2a5992087302948523a5f30919 ******/
		%feature("compactdefaultargs") BuildBoor;
		%feature("autodoc", "
Parameters
----------
Index: int
Length: int
Dimension: int
Poles: TColStd_Array1OfReal

Return
-------
LP: float

Description
-----------
Copy in <LP> poles for <Dimension> Boor scheme. Starting from <Index> * <Dimension>, copy <Length+1> poles.
") BuildBoor;
		static void BuildBoor(const Standard_Integer Index, const Standard_Integer Length, const Standard_Integer Dimension, const TColStd_Array1OfReal & Poles, Standard_Real &OutValue);

		/****** BSplCLib::BuildCache ******/
		/****** md5 signature: 88f6db741b7bf40f8789b15b366aa19e ******/
		%feature("compactdefaultargs") BuildCache;
		%feature("autodoc", "
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

Return
-------
None

Description
-----------
Perform the evaluation of the Taylor expansion of the Bspline normalized between 0 and 1. If rational computes the homogeneous Taylor expansion for the numerator and stores it in CachePoles.
") BuildCache;
		static void BuildCache(const Standard_Real U, const Standard_Real InverseOfSpanDomain, const Standard_Boolean PeriodicFlag, const Standard_Integer Degree, const TColStd_Array1OfReal & FlatKnots, const TColgp_Array1OfPnt & Poles, const TColStd_Array1OfReal * Weights, TColgp_Array1OfPnt & CachePoles, TColStd_Array1OfReal * CacheWeights);

		/****** BSplCLib::BuildCache ******/
		/****** md5 signature: 45f22d8002fc8790ce5072ab4d067a4f ******/
		%feature("compactdefaultargs") BuildCache;
		%feature("autodoc", "
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

Return
-------
None

Description
-----------
Perform the evaluation of the Taylor expansion of the Bspline normalized between 0 and 1. If rational computes the homogeneous Taylor expansion for the numerator and stores it in CachePoles.
") BuildCache;
		static void BuildCache(const Standard_Real U, const Standard_Real InverseOfSpanDomain, const Standard_Boolean PeriodicFlag, const Standard_Integer Degree, const TColStd_Array1OfReal & FlatKnots, const TColgp_Array1OfPnt2d & Poles, const TColStd_Array1OfReal * Weights, TColgp_Array1OfPnt2d & CachePoles, TColStd_Array1OfReal * CacheWeights);

		/****** BSplCLib::BuildCache ******/
		/****** md5 signature: c515147b2f76ee70ec1b53736b32b6a3 ******/
		%feature("compactdefaultargs") BuildCache;
		%feature("autodoc", "
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

Return
-------
None

Description
-----------
Perform the evaluation of the Taylor expansion of the Bspline normalized between 0 and 1. Structure of result optimized for BSplCLib_Cache.
") BuildCache;
		static void BuildCache(const Standard_Real theParameter, const Standard_Real theSpanDomain, const Standard_Boolean thePeriodicFlag, const Standard_Integer theDegree, const Standard_Integer theSpanIndex, const TColStd_Array1OfReal & theFlatKnots, const TColgp_Array1OfPnt & thePoles, const TColStd_Array1OfReal * theWeights, TColStd_Array2OfReal & theCacheArray);

		/****** BSplCLib::BuildCache ******/
		/****** md5 signature: aa87bffa2b4787d68598fd1c4a7827a6 ******/
		%feature("compactdefaultargs") BuildCache;
		%feature("autodoc", "
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

Return
-------
None

Description
-----------
Perform the evaluation of the Taylor expansion of the Bspline normalized between 0 and 1. Structure of result optimized for BSplCLib_Cache.
") BuildCache;
		static void BuildCache(const Standard_Real theParameter, const Standard_Real theSpanDomain, const Standard_Boolean thePeriodicFlag, const Standard_Integer theDegree, const Standard_Integer theSpanIndex, const TColStd_Array1OfReal & theFlatKnots, const TColgp_Array1OfPnt2d & thePoles, const TColStd_Array1OfReal * theWeights, TColStd_Array2OfReal & theCacheArray);

		/****** BSplCLib::BuildEval ******/
		/****** md5 signature: f5bf26a19e3916875f66db135251f90e ******/
		%feature("compactdefaultargs") BuildEval;
		%feature("autodoc", "
Parameters
----------
Degree: int
Index: int
Poles: TColStd_Array1OfReal
Weights: TColStd_Array1OfReal *

Return
-------
LP: float

Description
-----------
No available documentation.
") BuildEval;
		static void BuildEval(const Standard_Integer Degree, const Standard_Integer Index, const TColStd_Array1OfReal & Poles, const TColStd_Array1OfReal * Weights, Standard_Real &OutValue);

		/****** BSplCLib::BuildEval ******/
		/****** md5 signature: 9494908cfef81ef91e3c3165373b276a ******/
		%feature("compactdefaultargs") BuildEval;
		%feature("autodoc", "
Parameters
----------
Degree: int
Index: int
Poles: TColgp_Array1OfPnt
Weights: TColStd_Array1OfReal *

Return
-------
LP: float

Description
-----------
No available documentation.
") BuildEval;
		static void BuildEval(const Standard_Integer Degree, const Standard_Integer Index, const TColgp_Array1OfPnt & Poles, const TColStd_Array1OfReal * Weights, Standard_Real &OutValue);

		/****** BSplCLib::BuildEval ******/
		/****** md5 signature: e7548b1cb6a5b267a1cdaa850de8e117 ******/
		%feature("compactdefaultargs") BuildEval;
		%feature("autodoc", "
Parameters
----------
Degree: int
Index: int
Poles: TColgp_Array1OfPnt2d
Weights: TColStd_Array1OfReal *

Return
-------
LP: float

Description
-----------
Copy in <LP> the poles and weights for the Eval scheme. starting from Poles(Poles.Lower()+Index).
") BuildEval;
		static void BuildEval(const Standard_Integer Degree, const Standard_Integer Index, const TColgp_Array1OfPnt2d & Poles, const TColStd_Array1OfReal * Weights, Standard_Real &OutValue);

		/****** BSplCLib::BuildKnots ******/
		/****** md5 signature: 5b526b765c0171416b4d6dfd6b2cfaf1 ******/
		%feature("compactdefaultargs") BuildKnots;
		%feature("autodoc", "
Parameters
----------
Degree: int
Index: int
Periodic: bool
Knots: TColStd_Array1OfReal
Mults: TColStd_Array1OfInteger *

Return
-------
LK: float

Description
-----------
Stores in LK the useful knots for the BoorSchem on the span Knots(Index) - Knots(Index+1).
") BuildKnots;
		static void BuildKnots(const Standard_Integer Degree, const Standard_Integer Index, const Standard_Boolean Periodic, const TColStd_Array1OfReal & Knots, const TColStd_Array1OfInteger * Mults, Standard_Real &OutValue);

		/****** BSplCLib::BuildSchoenbergPoints ******/
		/****** md5 signature: 7c7c6b34199d47b94798e9eaa18466de ******/
		%feature("compactdefaultargs") BuildSchoenbergPoints;
		%feature("autodoc", "
Parameters
----------
Degree: int
FlatKnots: TColStd_Array1OfReal
Parameters: TColStd_Array1OfReal

Return
-------
None

Description
-----------
builds the Schoenberg points from the flat knot used to interpolate a BSpline since the BSpline matrix is invertible.
") BuildSchoenbergPoints;
		static void BuildSchoenbergPoints(const Standard_Integer Degree, const TColStd_Array1OfReal & FlatKnots, TColStd_Array1OfReal & Parameters);

		/****** BSplCLib::CacheD0 ******/
		/****** md5 signature: 4b87a5084bd23695ffc6f5eb2dc1e975 ******/
		%feature("compactdefaultargs") CacheD0;
		%feature("autodoc", "
Parameters
----------
U: float
Degree: int
CacheParameter: float
SpanLenght: float
Poles: TColgp_Array1OfPnt
Weights: TColStd_Array1OfReal *
Point: gp_Pnt

Return
-------
None

Description
-----------
Perform the evaluation of the of the cache the parameter must be normalized between the 0 and 1 for the span. The Cache must be valid when calling this routine. Geom Package will insure that. and then multiplies by the weights this just evaluates the current point the CacheParameter is where the Cache was constructed the SpanLength is to normalize the polynomial in the cache to avoid bad conditioning effects.
") CacheD0;
		static void CacheD0(const Standard_Real U, const Standard_Integer Degree, const Standard_Real CacheParameter, const Standard_Real SpanLenght, const TColgp_Array1OfPnt & Poles, const TColStd_Array1OfReal * Weights, gp_Pnt & Point);

		/****** BSplCLib::CacheD0 ******/
		/****** md5 signature: e4f1a75a966531ff935a46ebf7e7f834 ******/
		%feature("compactdefaultargs") CacheD0;
		%feature("autodoc", "
Parameters
----------
U: float
Degree: int
CacheParameter: float
SpanLenght: float
Poles: TColgp_Array1OfPnt2d
Weights: TColStd_Array1OfReal *
Point: gp_Pnt2d

Return
-------
None

Description
-----------
Perform the evaluation of the Bspline Basis and then multiplies by the weights this just evaluates the current point the parameter must be normalized between the 0 and 1 for the span. The Cache must be valid when calling this routine. Geom Package will insure that. and then multiplies by the weights ththe CacheParameter is where the Cache was constructed the SpanLength is to normalize the polynomial in the cache to avoid bad conditioning effectsis just evaluates the current point.
") CacheD0;
		static void CacheD0(const Standard_Real U, const Standard_Integer Degree, const Standard_Real CacheParameter, const Standard_Real SpanLenght, const TColgp_Array1OfPnt2d & Poles, const TColStd_Array1OfReal * Weights, gp_Pnt2d & Point);

		/****** BSplCLib::CacheD1 ******/
		/****** md5 signature: ae504111826c0a9503f1e1e3c5414581 ******/
		%feature("compactdefaultargs") CacheD1;
		%feature("autodoc", "
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

Return
-------
None

Description
-----------
Perform the evaluation of the of the cache the parameter must be normalized between the 0 and 1 for the span. The Cache must be valid when calling this routine. Geom Package will insure that. and then multiplies by the weights this just evaluates the current point the CacheParameter is where the Cache was constructed the SpanLength is to normalize the polynomial in the cache to avoid bad conditioning effects.
") CacheD1;
		static void CacheD1(const Standard_Real U, const Standard_Integer Degree, const Standard_Real CacheParameter, const Standard_Real SpanLenght, const TColgp_Array1OfPnt & Poles, const TColStd_Array1OfReal * Weights, gp_Pnt & Point, gp_Vec & Vec);

		/****** BSplCLib::CacheD1 ******/
		/****** md5 signature: bd3f1e91dd444c350b31810eec8e7216 ******/
		%feature("compactdefaultargs") CacheD1;
		%feature("autodoc", "
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

Return
-------
None

Description
-----------
Perform the evaluation of the Bspline Basis and then multiplies by the weights this just evaluates the current point the parameter must be normalized between the 0 and 1 for the span. The Cache must be valid when calling this routine. Geom Package will insure that. and then multiplies by the weights ththe CacheParameter is where the Cache was constructed the SpanLength is to normalize the polynomial in the cache to avoid bad conditioning effectsis just evaluates the current point.
") CacheD1;
		static void CacheD1(const Standard_Real U, const Standard_Integer Degree, const Standard_Real CacheParameter, const Standard_Real SpanLenght, const TColgp_Array1OfPnt2d & Poles, const TColStd_Array1OfReal * Weights, gp_Pnt2d & Point, gp_Vec2d & Vec);

		/****** BSplCLib::CacheD2 ******/
		/****** md5 signature: 9f31e63202d02d8f93edddb5d118458f ******/
		%feature("compactdefaultargs") CacheD2;
		%feature("autodoc", "
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

Return
-------
None

Description
-----------
Perform the evaluation of the of the cache the parameter must be normalized between the 0 and 1 for the span. The Cache must be valid when calling this routine. Geom Package will insure that. and then multiplies by the weights this just evaluates the current point the CacheParameter is where the Cache was constructed the SpanLength is to normalize the polynomial in the cache to avoid bad conditioning effects.
") CacheD2;
		static void CacheD2(const Standard_Real U, const Standard_Integer Degree, const Standard_Real CacheParameter, const Standard_Real SpanLenght, const TColgp_Array1OfPnt & Poles, const TColStd_Array1OfReal * Weights, gp_Pnt & Point, gp_Vec & Vec1, gp_Vec & Vec2);

		/****** BSplCLib::CacheD2 ******/
		/****** md5 signature: ef6db7863626261e8a1f32874d2ed3bd ******/
		%feature("compactdefaultargs") CacheD2;
		%feature("autodoc", "
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

Return
-------
None

Description
-----------
Perform the evaluation of the Bspline Basis and then multiplies by the weights this just evaluates the current point the parameter must be normalized between the 0 and 1 for the span. The Cache must be valid when calling this routine. Geom Package will insure that. and then multiplies by the weights ththe CacheParameter is where the Cache was constructed the SpanLength is to normalize the polynomial in the cache to avoid bad conditioning effectsis just evaluates the current point.
") CacheD2;
		static void CacheD2(const Standard_Real U, const Standard_Integer Degree, const Standard_Real CacheParameter, const Standard_Real SpanLenght, const TColgp_Array1OfPnt2d & Poles, const TColStd_Array1OfReal * Weights, gp_Pnt2d & Point, gp_Vec2d & Vec1, gp_Vec2d & Vec2);

		/****** BSplCLib::CacheD3 ******/
		/****** md5 signature: 0a3f8637dbdbd34edf1705c597e300f0 ******/
		%feature("compactdefaultargs") CacheD3;
		%feature("autodoc", "
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

Return
-------
None

Description
-----------
Perform the evaluation of the of the cache the parameter must be normalized between the 0 and 1 for the span. The Cache must be valid when calling this routine. Geom Package will insure that. and then multiplies by the weights this just evaluates the current point the CacheParameter is where the Cache was constructed the SpanLength is to normalize the polynomial in the cache to avoid bad conditioning effects.
") CacheD3;
		static void CacheD3(const Standard_Real U, const Standard_Integer Degree, const Standard_Real CacheParameter, const Standard_Real SpanLenght, const TColgp_Array1OfPnt & Poles, const TColStd_Array1OfReal * Weights, gp_Pnt & Point, gp_Vec & Vec1, gp_Vec & Vec2, gp_Vec & Vec3);

		/****** BSplCLib::CacheD3 ******/
		/****** md5 signature: e5d96d09eb78ae6b9e6eddab8ceeacd5 ******/
		%feature("compactdefaultargs") CacheD3;
		%feature("autodoc", "
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

Return
-------
None

Description
-----------
Perform the evaluation of the Bspline Basis and then multiplies by the weights this just evaluates the current point the parameter must be normalized between the 0 and 1 for the span. The Cache must be valid when calling this routine. Geom Package will insure that. and then multiplies by the weights ththe CacheParameter is where the Cache was constructed the SpanLength is to normalize the polynomial in the cache to avoid bad conditioning effectsis just evaluates the current point.
") CacheD3;
		static void CacheD3(const Standard_Real U, const Standard_Integer Degree, const Standard_Real CacheParameter, const Standard_Real SpanLenght, const TColgp_Array1OfPnt2d & Poles, const TColStd_Array1OfReal * Weights, gp_Pnt2d & Point, gp_Vec2d & Vec1, gp_Vec2d & Vec2, gp_Vec2d & Vec3);

		/****** BSplCLib::CoefsD0 ******/
		/****** md5 signature: 18bf8e212b82477c8304e717ea65ad39 ******/
		%feature("compactdefaultargs") CoefsD0;
		%feature("autodoc", "
Parameters
----------
U: float
Poles: TColgp_Array1OfPnt
Weights: TColStd_Array1OfReal *
Point: gp_Pnt

Return
-------
None

Description
-----------
Calls CacheD0 for Bezier Curves Arrays computed with the method PolesCoefficients. Warning: To be used for Beziercurves ONLY!!!.
") CoefsD0;
		static void CoefsD0(const Standard_Real U, const TColgp_Array1OfPnt & Poles, const TColStd_Array1OfReal * Weights, gp_Pnt & Point);

		/****** BSplCLib::CoefsD0 ******/
		/****** md5 signature: 39bdd7ed41460b8569726669dbd4e7bb ******/
		%feature("compactdefaultargs") CoefsD0;
		%feature("autodoc", "
Parameters
----------
U: float
Poles: TColgp_Array1OfPnt2d
Weights: TColStd_Array1OfReal *
Point: gp_Pnt2d

Return
-------
None

Description
-----------
Calls CacheD0 for Bezier Curves Arrays computed with the method PolesCoefficients. Warning: To be used for Beziercurves ONLY!!!.
") CoefsD0;
		static void CoefsD0(const Standard_Real U, const TColgp_Array1OfPnt2d & Poles, const TColStd_Array1OfReal * Weights, gp_Pnt2d & Point);

		/****** BSplCLib::CoefsD1 ******/
		/****** md5 signature: 3242be6bc01e487f3d616e7a4fc09f58 ******/
		%feature("compactdefaultargs") CoefsD1;
		%feature("autodoc", "
Parameters
----------
U: float
Poles: TColgp_Array1OfPnt
Weights: TColStd_Array1OfReal *
Point: gp_Pnt
Vec: gp_Vec

Return
-------
None

Description
-----------
Calls CacheD1 for Bezier Curves Arrays computed with the method PolesCoefficients. Warning: To be used for Beziercurves ONLY!!!.
") CoefsD1;
		static void CoefsD1(const Standard_Real U, const TColgp_Array1OfPnt & Poles, const TColStd_Array1OfReal * Weights, gp_Pnt & Point, gp_Vec & Vec);

		/****** BSplCLib::CoefsD1 ******/
		/****** md5 signature: 003fec260a51b66354e299192f1a2acb ******/
		%feature("compactdefaultargs") CoefsD1;
		%feature("autodoc", "
Parameters
----------
U: float
Poles: TColgp_Array1OfPnt2d
Weights: TColStd_Array1OfReal *
Point: gp_Pnt2d
Vec: gp_Vec2d

Return
-------
None

Description
-----------
Calls CacheD1 for Bezier Curves Arrays computed with the method PolesCoefficients. Warning: To be used for Beziercurves ONLY!!!.
") CoefsD1;
		static void CoefsD1(const Standard_Real U, const TColgp_Array1OfPnt2d & Poles, const TColStd_Array1OfReal * Weights, gp_Pnt2d & Point, gp_Vec2d & Vec);

		/****** BSplCLib::CoefsD2 ******/
		/****** md5 signature: a760925979becb0846798bef7d4517a1 ******/
		%feature("compactdefaultargs") CoefsD2;
		%feature("autodoc", "
Parameters
----------
U: float
Poles: TColgp_Array1OfPnt
Weights: TColStd_Array1OfReal *
Point: gp_Pnt
Vec1: gp_Vec
Vec2: gp_Vec

Return
-------
None

Description
-----------
Calls CacheD1 for Bezier Curves Arrays computed with the method PolesCoefficients. Warning: To be used for Beziercurves ONLY!!!.
") CoefsD2;
		static void CoefsD2(const Standard_Real U, const TColgp_Array1OfPnt & Poles, const TColStd_Array1OfReal * Weights, gp_Pnt & Point, gp_Vec & Vec1, gp_Vec & Vec2);

		/****** BSplCLib::CoefsD2 ******/
		/****** md5 signature: 457c4121231654d520b6b729f5ded246 ******/
		%feature("compactdefaultargs") CoefsD2;
		%feature("autodoc", "
Parameters
----------
U: float
Poles: TColgp_Array1OfPnt2d
Weights: TColStd_Array1OfReal *
Point: gp_Pnt2d
Vec1: gp_Vec2d
Vec2: gp_Vec2d

Return
-------
None

Description
-----------
Calls CacheD1 for Bezier Curves Arrays computed with the method PolesCoefficients. Warning: To be used for Beziercurves ONLY!!!.
") CoefsD2;
		static void CoefsD2(const Standard_Real U, const TColgp_Array1OfPnt2d & Poles, const TColStd_Array1OfReal * Weights, gp_Pnt2d & Point, gp_Vec2d & Vec1, gp_Vec2d & Vec2);

		/****** BSplCLib::CoefsD3 ******/
		/****** md5 signature: c6ad727e15781fe3ca510ef85b7cfc4c ******/
		%feature("compactdefaultargs") CoefsD3;
		%feature("autodoc", "
Parameters
----------
U: float
Poles: TColgp_Array1OfPnt
Weights: TColStd_Array1OfReal *
Point: gp_Pnt
Vec1: gp_Vec
Vec2: gp_Vec
Vec3: gp_Vec

Return
-------
None

Description
-----------
Calls CacheD1 for Bezier Curves Arrays computed with the method PolesCoefficients. Warning: To be used for Beziercurves ONLY!!!.
") CoefsD3;
		static void CoefsD3(const Standard_Real U, const TColgp_Array1OfPnt & Poles, const TColStd_Array1OfReal * Weights, gp_Pnt & Point, gp_Vec & Vec1, gp_Vec & Vec2, gp_Vec & Vec3);

		/****** BSplCLib::CoefsD3 ******/
		/****** md5 signature: 6f91ff262a63e5b085eae5793d90d147 ******/
		%feature("compactdefaultargs") CoefsD3;
		%feature("autodoc", "
Parameters
----------
U: float
Poles: TColgp_Array1OfPnt2d
Weights: TColStd_Array1OfReal *
Point: gp_Pnt2d
Vec1: gp_Vec2d
Vec2: gp_Vec2d
Vec3: gp_Vec2d

Return
-------
None

Description
-----------
Calls CacheD1 for Bezier Curves Arrays computed with the method PolesCoefficients. Warning: To be used for Beziercurves ONLY!!!.
") CoefsD3;
		static void CoefsD3(const Standard_Real U, const TColgp_Array1OfPnt2d & Poles, const TColStd_Array1OfReal * Weights, gp_Pnt2d & Point, gp_Vec2d & Vec1, gp_Vec2d & Vec2, gp_Vec2d & Vec3);

		/****** BSplCLib::D0 ******/
		/****** md5 signature: 7561aecd85a8c1fd870660e7b2329d8c ******/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "
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

Return
-------
P: float

Description
-----------
No available documentation.
") D0;
		static void D0(const Standard_Real U, const Standard_Integer Index, const Standard_Integer Degree, const Standard_Boolean Periodic, const TColStd_Array1OfReal & Poles, const TColStd_Array1OfReal * Weights, const TColStd_Array1OfReal & Knots, const TColStd_Array1OfInteger * Mults, Standard_Real &OutValue);

		/****** BSplCLib::D0 ******/
		/****** md5 signature: 5a86ac63b280d12dc49149ab86701593 ******/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "
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

Return
-------
None

Description
-----------
No available documentation.
") D0;
		static void D0(const Standard_Real U, const Standard_Integer Index, const Standard_Integer Degree, const Standard_Boolean Periodic, const TColgp_Array1OfPnt & Poles, const TColStd_Array1OfReal * Weights, const TColStd_Array1OfReal & Knots, const TColStd_Array1OfInteger * Mults, gp_Pnt & P);

		/****** BSplCLib::D0 ******/
		/****** md5 signature: 732828ed2bf7b4c8007607b33b5017e6 ******/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "
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

Return
-------
None

Description
-----------
No available documentation.
") D0;
		static void D0(const Standard_Real U, const Standard_Integer UIndex, const Standard_Integer Degree, const Standard_Boolean Periodic, const TColgp_Array1OfPnt2d & Poles, const TColStd_Array1OfReal * Weights, const TColStd_Array1OfReal & Knots, const TColStd_Array1OfInteger * Mults, gp_Pnt2d & P);

		/****** BSplCLib::D0 ******/
		/****** md5 signature: 33d3e7f80011e8d41cfdf3310bf2746b ******/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "
Parameters
----------
U: float
Poles: TColgp_Array1OfPnt
Weights: TColStd_Array1OfReal *
P: gp_Pnt

Return
-------
None

Description
-----------
No available documentation.
") D0;
		static void D0(const Standard_Real U, const TColgp_Array1OfPnt & Poles, const TColStd_Array1OfReal * Weights, gp_Pnt & P);

		/****** BSplCLib::D0 ******/
		/****** md5 signature: 1ec2056c99d3c27e743528d574bd1b08 ******/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "
Parameters
----------
U: float
Poles: TColgp_Array1OfPnt2d
Weights: TColStd_Array1OfReal *
P: gp_Pnt2d

Return
-------
None

Description
-----------
No available documentation.
") D0;
		static void D0(const Standard_Real U, const TColgp_Array1OfPnt2d & Poles, const TColStd_Array1OfReal * Weights, gp_Pnt2d & P);

		/****** BSplCLib::D1 ******/
		/****** md5 signature: c5d4a5a42567bcbaa42a3a45f7913898 ******/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "
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

Return
-------
P: float
V: float

Description
-----------
No available documentation.
") D1;
		static void D1(const Standard_Real U, const Standard_Integer Index, const Standard_Integer Degree, const Standard_Boolean Periodic, const TColStd_Array1OfReal & Poles, const TColStd_Array1OfReal * Weights, const TColStd_Array1OfReal & Knots, const TColStd_Array1OfInteger * Mults, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** BSplCLib::D1 ******/
		/****** md5 signature: 8a5113bc308ff33804f33bdc1ed608ba ******/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "
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

Return
-------
None

Description
-----------
No available documentation.
") D1;
		static void D1(const Standard_Real U, const Standard_Integer Index, const Standard_Integer Degree, const Standard_Boolean Periodic, const TColgp_Array1OfPnt & Poles, const TColStd_Array1OfReal * Weights, const TColStd_Array1OfReal & Knots, const TColStd_Array1OfInteger * Mults, gp_Pnt & P, gp_Vec & V);

		/****** BSplCLib::D1 ******/
		/****** md5 signature: fd089236138b75127a4ad6b78bc6e10c ******/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "
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

Return
-------
None

Description
-----------
No available documentation.
") D1;
		static void D1(const Standard_Real U, const Standard_Integer UIndex, const Standard_Integer Degree, const Standard_Boolean Periodic, const TColgp_Array1OfPnt2d & Poles, const TColStd_Array1OfReal * Weights, const TColStd_Array1OfReal & Knots, const TColStd_Array1OfInteger * Mults, gp_Pnt2d & P, gp_Vec2d & V);

		/****** BSplCLib::D1 ******/
		/****** md5 signature: 87bba8d0c8b6927eb3568c326fc6fb48 ******/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "
Parameters
----------
U: float
Poles: TColgp_Array1OfPnt
Weights: TColStd_Array1OfReal *
P: gp_Pnt
V: gp_Vec

Return
-------
None

Description
-----------
No available documentation.
") D1;
		static void D1(const Standard_Real U, const TColgp_Array1OfPnt & Poles, const TColStd_Array1OfReal * Weights, gp_Pnt & P, gp_Vec & V);

		/****** BSplCLib::D1 ******/
		/****** md5 signature: 3b7b11ae9a40e85d080202fc6a53897a ******/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "
Parameters
----------
U: float
Poles: TColgp_Array1OfPnt2d
Weights: TColStd_Array1OfReal *
P: gp_Pnt2d
V: gp_Vec2d

Return
-------
None

Description
-----------
No available documentation.
") D1;
		static void D1(const Standard_Real U, const TColgp_Array1OfPnt2d & Poles, const TColStd_Array1OfReal * Weights, gp_Pnt2d & P, gp_Vec2d & V);

		/****** BSplCLib::D2 ******/
		/****** md5 signature: 687cea2fb0236f24716895fa76c91fd2 ******/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "
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

Return
-------
P: float
V1: float
V2: float

Description
-----------
No available documentation.
") D2;
		static void D2(const Standard_Real U, const Standard_Integer Index, const Standard_Integer Degree, const Standard_Boolean Periodic, const TColStd_Array1OfReal & Poles, const TColStd_Array1OfReal * Weights, const TColStd_Array1OfReal & Knots, const TColStd_Array1OfInteger * Mults, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** BSplCLib::D2 ******/
		/****** md5 signature: b73abb803e141f8dc4ec09df17e4c50e ******/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "
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

Return
-------
None

Description
-----------
No available documentation.
") D2;
		static void D2(const Standard_Real U, const Standard_Integer Index, const Standard_Integer Degree, const Standard_Boolean Periodic, const TColgp_Array1OfPnt & Poles, const TColStd_Array1OfReal * Weights, const TColStd_Array1OfReal & Knots, const TColStd_Array1OfInteger * Mults, gp_Pnt & P, gp_Vec & V1, gp_Vec & V2);

		/****** BSplCLib::D2 ******/
		/****** md5 signature: 6058645d1d031db231dada3d3a54b986 ******/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "
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

Return
-------
None

Description
-----------
No available documentation.
") D2;
		static void D2(const Standard_Real U, const Standard_Integer UIndex, const Standard_Integer Degree, const Standard_Boolean Periodic, const TColgp_Array1OfPnt2d & Poles, const TColStd_Array1OfReal * Weights, const TColStd_Array1OfReal & Knots, const TColStd_Array1OfInteger * Mults, gp_Pnt2d & P, gp_Vec2d & V1, gp_Vec2d & V2);

		/****** BSplCLib::D2 ******/
		/****** md5 signature: 63365348497a5b480b7839c0964e9d2e ******/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "
Parameters
----------
U: float
Poles: TColgp_Array1OfPnt
Weights: TColStd_Array1OfReal *
P: gp_Pnt
V1: gp_Vec
V2: gp_Vec

Return
-------
None

Description
-----------
No available documentation.
") D2;
		static void D2(const Standard_Real U, const TColgp_Array1OfPnt & Poles, const TColStd_Array1OfReal * Weights, gp_Pnt & P, gp_Vec & V1, gp_Vec & V2);

		/****** BSplCLib::D2 ******/
		/****** md5 signature: 8f777be84c1d31a5bc0c3ddef76c70c5 ******/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "
Parameters
----------
U: float
Poles: TColgp_Array1OfPnt2d
Weights: TColStd_Array1OfReal *
P: gp_Pnt2d
V1: gp_Vec2d
V2: gp_Vec2d

Return
-------
None

Description
-----------
No available documentation.
") D2;
		static void D2(const Standard_Real U, const TColgp_Array1OfPnt2d & Poles, const TColStd_Array1OfReal * Weights, gp_Pnt2d & P, gp_Vec2d & V1, gp_Vec2d & V2);

		/****** BSplCLib::D3 ******/
		/****** md5 signature: 8e56e662476d83277aff218518c2783b ******/
		%feature("compactdefaultargs") D3;
		%feature("autodoc", "
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

Return
-------
P: float
V1: float
V2: float
V3: float

Description
-----------
No available documentation.
") D3;
		static void D3(const Standard_Real U, const Standard_Integer Index, const Standard_Integer Degree, const Standard_Boolean Periodic, const TColStd_Array1OfReal & Poles, const TColStd_Array1OfReal * Weights, const TColStd_Array1OfReal & Knots, const TColStd_Array1OfInteger * Mults, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** BSplCLib::D3 ******/
		/****** md5 signature: 7c47b7eb8d5b8d180c4d45228f81647c ******/
		%feature("compactdefaultargs") D3;
		%feature("autodoc", "
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

Return
-------
None

Description
-----------
No available documentation.
") D3;
		static void D3(const Standard_Real U, const Standard_Integer Index, const Standard_Integer Degree, const Standard_Boolean Periodic, const TColgp_Array1OfPnt & Poles, const TColStd_Array1OfReal * Weights, const TColStd_Array1OfReal & Knots, const TColStd_Array1OfInteger * Mults, gp_Pnt & P, gp_Vec & V1, gp_Vec & V2, gp_Vec & V3);

		/****** BSplCLib::D3 ******/
		/****** md5 signature: 81bfef3adc8c0544d61a9b166341c5c9 ******/
		%feature("compactdefaultargs") D3;
		%feature("autodoc", "
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

Return
-------
None

Description
-----------
No available documentation.
") D3;
		static void D3(const Standard_Real U, const Standard_Integer UIndex, const Standard_Integer Degree, const Standard_Boolean Periodic, const TColgp_Array1OfPnt2d & Poles, const TColStd_Array1OfReal * Weights, const TColStd_Array1OfReal & Knots, const TColStd_Array1OfInteger * Mults, gp_Pnt2d & P, gp_Vec2d & V1, gp_Vec2d & V2, gp_Vec2d & V3);

		/****** BSplCLib::D3 ******/
		/****** md5 signature: f0a77f2c8079c2632af45d55df4473cb ******/
		%feature("compactdefaultargs") D3;
		%feature("autodoc", "
Parameters
----------
U: float
Poles: TColgp_Array1OfPnt
Weights: TColStd_Array1OfReal *
P: gp_Pnt
V1: gp_Vec
V2: gp_Vec
V3: gp_Vec

Return
-------
None

Description
-----------
No available documentation.
") D3;
		static void D3(const Standard_Real U, const TColgp_Array1OfPnt & Poles, const TColStd_Array1OfReal * Weights, gp_Pnt & P, gp_Vec & V1, gp_Vec & V2, gp_Vec & V3);

		/****** BSplCLib::D3 ******/
		/****** md5 signature: 3d0d0bbd88ac150dc6372f46c6dabd3e ******/
		%feature("compactdefaultargs") D3;
		%feature("autodoc", "
Parameters
----------
U: float
Poles: TColgp_Array1OfPnt2d
Weights: TColStd_Array1OfReal *
P: gp_Pnt2d
V1: gp_Vec2d
V2: gp_Vec2d
V3: gp_Vec2d

Return
-------
None

Description
-----------
No available documentation.
") D3;
		static void D3(const Standard_Real U, const TColgp_Array1OfPnt2d & Poles, const TColStd_Array1OfReal * Weights, gp_Pnt2d & P, gp_Vec2d & V1, gp_Vec2d & V2, gp_Vec2d & V3);

		/****** BSplCLib::Derivative ******/
		/****** md5 signature: 3e05b06fef7b008a06c0d9da82c6a38b ******/
		%feature("compactdefaultargs") Derivative;
		%feature("autodoc", "
Parameters
----------
Degree: int
Dimension: int
Length: int
Order: int

Return
-------
Knots: float
Poles: float

Description
-----------
Computes the poles of the BSpline giving the derivatives of order <Order>. //! The formula for the first order is //! Pole(i) = Degree * (Pole(i+1) - Pole(i)) / (Knots(i+Degree+1) - Knots(i+1)) //! This formula is repeated (Degree is decremented at each step).
") Derivative;
		static void Derivative(const Standard_Integer Degree, Standard_Real &OutValue, const Standard_Integer Dimension, const Standard_Integer Length, const Standard_Integer Order, Standard_Real &OutValue);

		/****** BSplCLib::Eval ******/
		/****** md5 signature: 306d3d56ab8e2e7587db79730d72385e ******/
		%feature("compactdefaultargs") Eval;
		%feature("autodoc", "
Parameters
----------
U: float
Degree: int
Dimension: int

Return
-------
Knots: float
Poles: float

Description
-----------
Perform the Boor algorithm to evaluate a point at parameter <U>, with <Degree> and <Dimension>. //! Poles is an array of Reals of size //! <Dimension> * <Degree>+1 //! Containing the poles. At the end <Poles> contains the current point.
") Eval;
		static void Eval(const Standard_Real U, const Standard_Integer Degree, Standard_Real &OutValue, const Standard_Integer Dimension, Standard_Real &OutValue);

		/****** BSplCLib::Eval ******/
		/****** md5 signature: 2650b9a2ce8101d2c64b1aa2dc7230ed ******/
		%feature("compactdefaultargs") Eval;
		%feature("autodoc", "
Parameters
----------
U: float
PeriodicFlag: bool
DerivativeRequest: int
Degree: int
FlatKnots: TColStd_Array1OfReal
ArrayDimension: int

Return
-------
ExtrapMode: int
Poles: float
Result: float

Description
-----------
Perform the De Boor algorithm to evaluate a point at parameter <U>, with <Degree> and <Dimension>. //! Poles is an array of Reals of size //! <Dimension> * <Degree>+1 //! Containing the poles. At the end <Poles> contains the current point. Poles Contain all the poles of the BsplineCurve, Knots also Contains all the knots of the BsplineCurve. ExtrapMode has two slots [0] = Degree used to extrapolate before the first knot [1] = Degre used to extrapolate after the last knot has to be between 1 and Degree.
") Eval;
		static void Eval(const Standard_Real U, const Standard_Boolean PeriodicFlag, const Standard_Integer DerivativeRequest, Standard_Integer &OutValue, const Standard_Integer Degree, const TColStd_Array1OfReal & FlatKnots, const Standard_Integer ArrayDimension, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** BSplCLib::Eval ******/
		/****** md5 signature: f042995c54d6c67df7af737079f079ff ******/
		%feature("compactdefaultargs") Eval;
		%feature("autodoc", "
Parameters
----------
U: float
PeriodicFlag: bool
DerivativeRequest: int
Degree: int
FlatKnots: TColStd_Array1OfReal
ArrayDimension: int

Return
-------
ExtrapMode: int
Poles: float
Weights: float
PolesResult: float
WeightsResult: float

Description
-----------
Perform the De Boor algorithm to evaluate a point at parameter <U>, with <Degree> and <Dimension>. Evaluates by multiplying the Poles by the Weights and gives the homogeneous result in PolesResult that is the results of the evaluation of the numerator once it has been multiplied by the weights and in WeightsResult one has the result of the evaluation of the denominator //! Warning: <PolesResult> and <WeightsResult> must be dimensioned properly.
") Eval;
		static void Eval(const Standard_Real U, const Standard_Boolean PeriodicFlag, const Standard_Integer DerivativeRequest, Standard_Integer &OutValue, const Standard_Integer Degree, const TColStd_Array1OfReal & FlatKnots, const Standard_Integer ArrayDimension, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** BSplCLib::Eval ******/
		/****** md5 signature: a0af3768f3f3d4eaf53ad9e5d73e72ef ******/
		%feature("compactdefaultargs") Eval;
		%feature("autodoc", "
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

Return
-------
ExtrapMode: int
Weight: float

Description
-----------
Perform the evaluation of the Bspline Basis and then multiplies by the weights this just evaluates the current point.
") Eval;
		static void Eval(const Standard_Real U, const Standard_Boolean PeriodicFlag, const Standard_Boolean HomogeneousFlag, Standard_Integer &OutValue, const Standard_Integer Degree, const TColStd_Array1OfReal & FlatKnots, const TColgp_Array1OfPnt & Poles, const TColStd_Array1OfReal & Weights, gp_Pnt & Point, Standard_Real &OutValue);

		/****** BSplCLib::Eval ******/
		/****** md5 signature: c2a3f21e913c7b4f811014d264cd4acd ******/
		%feature("compactdefaultargs") Eval;
		%feature("autodoc", "
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

Return
-------
ExtrapMode: int
Weight: float

Description
-----------
Perform the evaluation of the Bspline Basis and then multiplies by the weights this just evaluates the current point.
") Eval;
		static void Eval(const Standard_Real U, const Standard_Boolean PeriodicFlag, const Standard_Boolean HomogeneousFlag, Standard_Integer &OutValue, const Standard_Integer Degree, const TColStd_Array1OfReal & FlatKnots, const TColgp_Array1OfPnt2d & Poles, const TColStd_Array1OfReal & Weights, gp_Pnt2d & Point, Standard_Real &OutValue);

		/****** BSplCLib::EvalBsplineBasis ******/
		/****** md5 signature: 5ffbb07031177e5863ba3c71b6dfceec ******/
		%feature("compactdefaultargs") EvalBsplineBasis;
		%feature("autodoc", "
Parameters
----------
DerivativeOrder: int
Order: int
FlatKnots: TColStd_Array1OfReal
Parameter: float
BsplineBasis: math_Matrix
isPeriodic: bool (optional, default to Standard_False)

Return
-------
FirstNonZeroBsplineIndex: int

Description
-----------
This evaluates the Bspline Basis at a given parameter Parameter up to the requested DerivativeOrder and store the result in the array BsplineBasis in the following fashion BSplineBasis(1,1) = value of first non vanishing Bspline function which has Index FirstNonZeroBsplineIndex BsplineBasis(1,2) = value of second non vanishing Bspline function which has Index FirstNonZeroBsplineIndex + 1 BsplineBasis(1,n) = value of second non vanishing non vanishing Bspline function which has Index FirstNonZeroBsplineIndex + n (n <= Order) BSplineBasis(2,1) = value of derivative of first non vanishing Bspline function which has Index FirstNonZeroBsplineIndex BSplineBasis(N,1) = value of Nth derivative of first non vanishing Bspline function which has Index FirstNonZeroBsplineIndex if N <= DerivativeOrder + 1.
") EvalBsplineBasis;
		static Standard_Integer EvalBsplineBasis(const Standard_Integer DerivativeOrder, const Standard_Integer Order, const TColStd_Array1OfReal & FlatKnots, const Standard_Real Parameter, Standard_Integer &OutValue, math_Matrix & BsplineBasis, const Standard_Boolean isPeriodic = Standard_False);

		/****** BSplCLib::FactorBandedMatrix ******/
		/****** md5 signature: b32ee44a28437467b4b6bb1b6f9ef4d0 ******/
		%feature("compactdefaultargs") FactorBandedMatrix;
		%feature("autodoc", "
Parameters
----------
Matrix: math_Matrix
UpperBandWidth: int
LowerBandWidth: int

Return
-------
PivotIndexProblem: int

Description
-----------
this factors the Banded Matrix in the LU form with a Banded storage of components of the L matrix WARNING: do not use if the Matrix is totally positive (It is the case for Bspline matrices build as above with parameters being the Schoenberg points.
") FactorBandedMatrix;
		static Standard_Integer FactorBandedMatrix(math_Matrix & Matrix, const Standard_Integer UpperBandWidth, const Standard_Integer LowerBandWidth, Standard_Integer &OutValue);

		/****** BSplCLib::FirstUKnotIndex ******/
		/****** md5 signature: 4eeb8b33949edada004187702b6be02a ******/
		%feature("compactdefaultargs") FirstUKnotIndex;
		%feature("autodoc", "
Parameters
----------
Degree: int
Mults: TColStd_Array1OfInteger

Return
-------
int

Description
-----------
Computes the index of the knots value which gives the start point of the curve.
") FirstUKnotIndex;
		static Standard_Integer FirstUKnotIndex(const Standard_Integer Degree, const TColStd_Array1OfInteger & Mults);

		/****** BSplCLib::FlatBezierKnots ******/
		/****** md5 signature: 7b813d4199ab162a9445b273d2d7855c ******/
		%feature("compactdefaultargs") FlatBezierKnots;
		%feature("autodoc", "
Parameters
----------
Degree: int

Return
-------
float

Description
-----------
Returns pointer to statically allocated array representing flat knots for bezier curve of the specified degree. Raises OutOfRange if Degree > MaxDegree().
") FlatBezierKnots;
		static const Standard_Real & FlatBezierKnots(const Standard_Integer Degree);

		/****** BSplCLib::FlatIndex ******/
		/****** md5 signature: 04b9aa70b2a79e8eac7af6620d71a81c ******/
		%feature("compactdefaultargs") FlatIndex;
		%feature("autodoc", "
Parameters
----------
Degree: int
Index: int
Mults: TColStd_Array1OfInteger
Periodic: bool

Return
-------
int

Description
-----------
Computes the index of the flats knots sequence corresponding to <Index> in the knots sequence which multiplicities are <Mults>.
") FlatIndex;
		static Standard_Integer FlatIndex(const Standard_Integer Degree, const Standard_Integer Index, const TColStd_Array1OfInteger & Mults, const Standard_Boolean Periodic);

		/****** BSplCLib::FunctionMultiply ******/
		/****** md5 signature: d11350ab30e3e1a830d351b4bb9b3c45 ******/
		%feature("compactdefaultargs") FunctionMultiply;
		%feature("autodoc", "
Parameters
----------
Function: BSplCLib_EvaluatorFunction
BSplineDegree: int
BSplineFlatKnots: TColStd_Array1OfReal
PolesDimension: int
FlatKnots: TColStd_Array1OfReal
NewDegree: int

Return
-------
Poles: float
NewPoles: float
theStatus: int

Description
-----------
this will multiply a given Vectorial BSpline F(t) defined by its BSplineDegree and BSplineFlatKnotsl, its Poles array which are coded as an array of Real of the form [1..NumPoles][1..PolesDimension] by a function a(t) which is assumed to satisfy the following: 1. a(t) * F(t) is a polynomial BSpline that can be expressed exactly as a BSpline of degree NewDegree on the knots FlatKnots 2. the range of a(t) is the same as the range of F(t) Warning: it is the caller's responsibility to insure that conditions 1. and 2. above are satisfied: no check whatsoever is made in this method theStatus will return 0 if OK else it will return the pivot index of the matrix that was inverted to compute the multiplied BSpline: the method used is interpolation at Schoenenberg points of a(t)*F(t).
") FunctionMultiply;
		static void FunctionMultiply(const BSplCLib_EvaluatorFunction & Function, const Standard_Integer BSplineDegree, const TColStd_Array1OfReal & BSplineFlatKnots, const Standard_Integer PolesDimension, Standard_Real &OutValue, const TColStd_Array1OfReal & FlatKnots, const Standard_Integer NewDegree, Standard_Real &OutValue, Standard_Integer &OutValue);

		/****** BSplCLib::FunctionMultiply ******/
		/****** md5 signature: b75e7664cfee0abd3a4bb0f96527f5f0 ******/
		%feature("compactdefaultargs") FunctionMultiply;
		%feature("autodoc", "
Parameters
----------
Function: BSplCLib_EvaluatorFunction
BSplineDegree: int
BSplineFlatKnots: TColStd_Array1OfReal
Poles: TColStd_Array1OfReal
FlatKnots: TColStd_Array1OfReal
NewDegree: int
NewPoles: TColStd_Array1OfReal

Return
-------
theStatus: int

Description
-----------
this will multiply a given Vectorial BSpline F(t) defined by its BSplineDegree and BSplineFlatKnotsl, its Poles array which are coded as an array of Real of the form [1..NumPoles][1..PolesDimension] by a function a(t) which is assumed to satisfy the following: 1. a(t) * F(t) is a polynomial BSpline that can be expressed exactly as a BSpline of degree NewDegree on the knots FlatKnots 2. the range of a(t) is the same as the range of F(t) Warning: it is the caller's responsibility to insure that conditions 1. and 2. above are satisfied: no check whatsoever is made in this method theStatus will return 0 if OK else it will return the pivot index of the matrix that was inverted to compute the multiplied BSpline: the method used is interpolation at Schoenenberg points of a(t)*F(t).
") FunctionMultiply;
		static void FunctionMultiply(const BSplCLib_EvaluatorFunction & Function, const Standard_Integer BSplineDegree, const TColStd_Array1OfReal & BSplineFlatKnots, const TColStd_Array1OfReal & Poles, const TColStd_Array1OfReal & FlatKnots, const Standard_Integer NewDegree, TColStd_Array1OfReal & NewPoles, Standard_Integer &OutValue);

		/****** BSplCLib::FunctionMultiply ******/
		/****** md5 signature: 304af15d568488c4302864bfd1fe935b ******/
		%feature("compactdefaultargs") FunctionMultiply;
		%feature("autodoc", "
Parameters
----------
Function: BSplCLib_EvaluatorFunction
BSplineDegree: int
BSplineFlatKnots: TColStd_Array1OfReal
Poles: TColgp_Array1OfPnt2d
FlatKnots: TColStd_Array1OfReal
NewDegree: int
NewPoles: TColgp_Array1OfPnt2d

Return
-------
theStatus: int

Description
-----------
this will multiply a given Vectorial BSpline F(t) defined by its BSplineDegree and BSplineFlatKnotsl, its Poles array which are coded as an array of Real of the form [1..NumPoles][1..PolesDimension] by a function a(t) which is assumed to satisfy the following: 1. a(t) * F(t) is a polynomial BSpline that can be expressed exactly as a BSpline of degree NewDegree on the knots FlatKnots 2. the range of a(t) is the same as the range of F(t) Warning: it is the caller's responsibility to insure that conditions 1. and 2. above are satisfied: no check whatsoever is made in this method theStatus will return 0 if OK else it will return the pivot index of the matrix that was inverted to compute the multiplied BSpline: the method used is interpolation at Schoenenberg points of a(t)*F(t).
") FunctionMultiply;
		static void FunctionMultiply(const BSplCLib_EvaluatorFunction & Function, const Standard_Integer BSplineDegree, const TColStd_Array1OfReal & BSplineFlatKnots, const TColgp_Array1OfPnt2d & Poles, const TColStd_Array1OfReal & FlatKnots, const Standard_Integer NewDegree, TColgp_Array1OfPnt2d & NewPoles, Standard_Integer &OutValue);

		/****** BSplCLib::FunctionMultiply ******/
		/****** md5 signature: 2d5b01a1995bf4a63b4ac71a00fa384d ******/
		%feature("compactdefaultargs") FunctionMultiply;
		%feature("autodoc", "
Parameters
----------
Function: BSplCLib_EvaluatorFunction
BSplineDegree: int
BSplineFlatKnots: TColStd_Array1OfReal
Poles: TColgp_Array1OfPnt
FlatKnots: TColStd_Array1OfReal
NewDegree: int
NewPoles: TColgp_Array1OfPnt

Return
-------
theStatus: int

Description
-----------
this will multiply a given Vectorial BSpline F(t) defined by its BSplineDegree and BSplineFlatKnotsl, its Poles array which are coded as an array of Real of the form [1..NumPoles][1..PolesDimension] by a function a(t) which is assumed to satisfy the following: 1. a(t) * F(t) is a polynomial BSpline that can be expressed exactly as a BSpline of degree NewDegree on the knots FlatKnots 2. the range of a(t) is the same as the range of F(t) Warning: it is the caller's responsibility to insure that conditions 1. and 2. above are satisfied: no check whatsoever is made in this method theStatus will return 0 if OK else it will return the pivot index of the matrix that was inverted to compute the multiplied BSpline: the method used is interpolation at Schoenenberg points of a(t)*F(t).
") FunctionMultiply;
		static void FunctionMultiply(const BSplCLib_EvaluatorFunction & Function, const Standard_Integer BSplineDegree, const TColStd_Array1OfReal & BSplineFlatKnots, const TColgp_Array1OfPnt & Poles, const TColStd_Array1OfReal & FlatKnots, const Standard_Integer NewDegree, TColgp_Array1OfPnt & NewPoles, Standard_Integer &OutValue);

		/****** BSplCLib::FunctionReparameterise ******/
		/****** md5 signature: 276c4138358cfb806cbc5e4946b652e7 ******/
		%feature("compactdefaultargs") FunctionReparameterise;
		%feature("autodoc", "
Parameters
----------
Function: BSplCLib_EvaluatorFunction
BSplineDegree: int
BSplineFlatKnots: TColStd_Array1OfReal
PolesDimension: int
FlatKnots: TColStd_Array1OfReal
NewDegree: int

Return
-------
Poles: float
NewPoles: float
theStatus: int

Description
-----------
This function will compose a given Vectorial BSpline F(t) defined by its BSplineDegree and BSplineFlatKnotsl, its Poles array which are coded as an array of Real of the form [1..NumPoles][1..PolesDimension] with a function a(t) which is assumed to satisfy the following: //! 1. F(a(t)) is a polynomial BSpline that can be expressed exactly as a BSpline of degree NewDegree on the knots FlatKnots //! 2. a(t) defines a differentiable isomorphism between the range of FlatKnots to the range of BSplineFlatKnots which is the same as the range of F(t) //! Warning: it is the caller's responsibility to insure that conditions 1. and 2. above are satisfied: no check whatsoever is made in this method //! theStatus will return 0 if OK else it will return the pivot index of the matrix that was inverted to compute the multiplied BSpline: the method used is interpolation at Schoenenberg points of F(a(t)).
") FunctionReparameterise;
		static void FunctionReparameterise(const BSplCLib_EvaluatorFunction & Function, const Standard_Integer BSplineDegree, const TColStd_Array1OfReal & BSplineFlatKnots, const Standard_Integer PolesDimension, Standard_Real &OutValue, const TColStd_Array1OfReal & FlatKnots, const Standard_Integer NewDegree, Standard_Real &OutValue, Standard_Integer &OutValue);

		/****** BSplCLib::FunctionReparameterise ******/
		/****** md5 signature: fff0db2cdbcf124496ae30f263735931 ******/
		%feature("compactdefaultargs") FunctionReparameterise;
		%feature("autodoc", "
Parameters
----------
Function: BSplCLib_EvaluatorFunction
BSplineDegree: int
BSplineFlatKnots: TColStd_Array1OfReal
Poles: TColStd_Array1OfReal
FlatKnots: TColStd_Array1OfReal
NewDegree: int
NewPoles: TColStd_Array1OfReal

Return
-------
theStatus: int

Description
-----------
This function will compose a given Vectorial BSpline F(t) defined by its BSplineDegree and BSplineFlatKnotsl, its Poles array which are coded as an array of Real of the form [1..NumPoles][1..PolesDimension] with a function a(t) which is assumed to satisfy the following: //! 1. F(a(t)) is a polynomial BSpline that can be expressed exactly as a BSpline of degree NewDegree on the knots FlatKnots //! 2. a(t) defines a differentiable isomorphism between the range of FlatKnots to the range of BSplineFlatKnots which is the same as the range of F(t) //! Warning: it is the caller's responsibility to insure that conditions 1. and 2. above are satisfied: no check whatsoever is made in this method //! theStatus will return 0 if OK else it will return the pivot index of the matrix that was inverted to compute the multiplied BSpline: the method used is interpolation at Schoenenberg points of F(a(t)).
") FunctionReparameterise;
		static void FunctionReparameterise(const BSplCLib_EvaluatorFunction & Function, const Standard_Integer BSplineDegree, const TColStd_Array1OfReal & BSplineFlatKnots, const TColStd_Array1OfReal & Poles, const TColStd_Array1OfReal & FlatKnots, const Standard_Integer NewDegree, TColStd_Array1OfReal & NewPoles, Standard_Integer &OutValue);

		/****** BSplCLib::FunctionReparameterise ******/
		/****** md5 signature: 8482a00dea0cf23f29af3cb5e99182ea ******/
		%feature("compactdefaultargs") FunctionReparameterise;
		%feature("autodoc", "
Parameters
----------
Function: BSplCLib_EvaluatorFunction
BSplineDegree: int
BSplineFlatKnots: TColStd_Array1OfReal
Poles: TColgp_Array1OfPnt
FlatKnots: TColStd_Array1OfReal
NewDegree: int
NewPoles: TColgp_Array1OfPnt

Return
-------
theStatus: int

Description
-----------
this will compose a given Vectorial BSpline F(t) defined by its BSplineDegree and BSplineFlatKnotsl, its Poles array which are coded as an array of Real of the form [1..NumPoles][1..PolesDimension] with a function a(t) which is assumed to satisfy the following: 1. F(a(t)) is a polynomial BSpline that can be expressed exactly as a BSpline of degree NewDegree on the knots FlatKnots 2. a(t) defines a differentiable isomorphism between the range of FlatKnots to the range of BSplineFlatKnots which is the same as the range of F(t) Warning: it is the caller's responsibility to insure that conditions 1. and 2. above are satisfied: no check whatsoever is made in this method theStatus will return 0 if OK else it will return the pivot index of the matrix that was inverted to compute the multiplied BSpline: the method used is interpolation at Schoenenberg points of F(a(t)).
") FunctionReparameterise;
		static void FunctionReparameterise(const BSplCLib_EvaluatorFunction & Function, const Standard_Integer BSplineDegree, const TColStd_Array1OfReal & BSplineFlatKnots, const TColgp_Array1OfPnt & Poles, const TColStd_Array1OfReal & FlatKnots, const Standard_Integer NewDegree, TColgp_Array1OfPnt & NewPoles, Standard_Integer &OutValue);

		/****** BSplCLib::FunctionReparameterise ******/
		/****** md5 signature: 0681500ae08b1b57f6b23f3500cf8eb6 ******/
		%feature("compactdefaultargs") FunctionReparameterise;
		%feature("autodoc", "
Parameters
----------
Function: BSplCLib_EvaluatorFunction
BSplineDegree: int
BSplineFlatKnots: TColStd_Array1OfReal
Poles: TColgp_Array1OfPnt2d
FlatKnots: TColStd_Array1OfReal
NewDegree: int
NewPoles: TColgp_Array1OfPnt2d

Return
-------
theStatus: int

Description
-----------
this will compose a given Vectorial BSpline F(t) defined by its BSplineDegree and BSplineFlatKnotsl, its Poles array which are coded as an array of Real of the form [1..NumPoles][1..PolesDimension] with a function a(t) which is assumed to satisfy the following: 1. F(a(t)) is a polynomial BSpline that can be expressed exactly as a BSpline of degree NewDegree on the knots FlatKnots 2. a(t) defines a differentiable isomorphism between the range of FlatKnots to the range of BSplineFlatKnots which is the same as the range of F(t) Warning: it is the caller's responsibility to insure that conditions 1. and 2. above are satisfied: no check whatsoever is made in this method theStatus will return 0 if OK else it will return the pivot index of the matrix that was inverted to compute the multiplied BSpline: the method used is interpolation at Schoenenberg points of F(a(t)).
") FunctionReparameterise;
		static void FunctionReparameterise(const BSplCLib_EvaluatorFunction & Function, const Standard_Integer BSplineDegree, const TColStd_Array1OfReal & BSplineFlatKnots, const TColgp_Array1OfPnt2d & Poles, const TColStd_Array1OfReal & FlatKnots, const Standard_Integer NewDegree, TColgp_Array1OfPnt2d & NewPoles, Standard_Integer &OutValue);

		/****** BSplCLib::GetPole ******/
		/****** md5 signature: 801683e94bd4376a7e09453b2ffdb655 ******/
		%feature("compactdefaultargs") GetPole;
		%feature("autodoc", "
Parameters
----------
Index: int
Length: int
Depth: int
Dimension: int
Pole: TColStd_Array1OfReal

Return
-------
LocPoles: float
Position: int

Description
-----------
Copy the pole at position <Index> in the Boor scheme of dimension <Dimension> to <Position> in the array <Pole>. <Position> is updated.
") GetPole;
		static void GetPole(const Standard_Integer Index, const Standard_Integer Length, const Standard_Integer Depth, const Standard_Integer Dimension, Standard_Real &OutValue, Standard_Integer &OutValue, TColStd_Array1OfReal & Pole);

		/****** BSplCLib::Hunt ******/
		/****** md5 signature: 4314b3314e47859975535fbccf40e912 ******/
		%feature("compactdefaultargs") Hunt;
		%feature("autodoc", "
Parameters
----------
theArray: TColStd_Array1OfReal
theX: float

Return
-------
theXPos: int

Description
-----------
This routine searches the position of the real value theX in the monotonically increasing set of real values theArray using bisection algorithm. //! If the given value is out of range or array values, algorithm returns either theArray.Lower()-1 or theArray.Upper()+1 depending on theX position in the ordered set. //! This routine is used to locate a knot value in a set of knots.
") Hunt;
		static void Hunt(const TColStd_Array1OfReal & theArray, const Standard_Real theX, Standard_Integer &OutValue);

		/****** BSplCLib::IncreaseDegree ******/
		/****** md5 signature: 3cdd7098cdf1c731c23a659a3dafafad ******/
		%feature("compactdefaultargs") IncreaseDegree;
		%feature("autodoc", "
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

Return
-------
None

Description
-----------
No available documentation.
") IncreaseDegree;
		static void IncreaseDegree(const Standard_Integer Degree, const Standard_Integer NewDegree, const Standard_Boolean Periodic, const Standard_Integer Dimension, const TColStd_Array1OfReal & Poles, const TColStd_Array1OfReal & Knots, const TColStd_Array1OfInteger & Mults, TColStd_Array1OfReal & NewPoles, TColStd_Array1OfReal & NewKnots, TColStd_Array1OfInteger & NewMults);

		/****** BSplCLib::IncreaseDegree ******/
		/****** md5 signature: 9e287ffd60ca2b64f0c80bf8e906f987 ******/
		%feature("compactdefaultargs") IncreaseDegree;
		%feature("autodoc", "
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

Return
-------
None

Description
-----------
No available documentation.
") IncreaseDegree;
		static void IncreaseDegree(const Standard_Integer Degree, const Standard_Integer NewDegree, const Standard_Boolean Periodic, const TColgp_Array1OfPnt & Poles, const TColStd_Array1OfReal * Weights, const TColStd_Array1OfReal & Knots, const TColStd_Array1OfInteger & Mults, TColgp_Array1OfPnt & NewPoles, TColStd_Array1OfReal * NewWeights, TColStd_Array1OfReal & NewKnots, TColStd_Array1OfInteger & NewMults);

		/****** BSplCLib::IncreaseDegree ******/
		/****** md5 signature: de3d7e2f464ecd91afcc95a62f774187 ******/
		%feature("compactdefaultargs") IncreaseDegree;
		%feature("autodoc", "
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

Return
-------
None

Description
-----------
No available documentation.
") IncreaseDegree;
		static void IncreaseDegree(const Standard_Integer Degree, const Standard_Integer NewDegree, const Standard_Boolean Periodic, const TColgp_Array1OfPnt2d & Poles, const TColStd_Array1OfReal * Weights, const TColStd_Array1OfReal & Knots, const TColStd_Array1OfInteger & Mults, TColgp_Array1OfPnt2d & NewPoles, TColStd_Array1OfReal * NewWeights, TColStd_Array1OfReal & NewKnots, TColStd_Array1OfInteger & NewMults);

		/****** BSplCLib::IncreaseDegree ******/
		/****** md5 signature: 102e348aaf60f52be4a7ee5086788702 ******/
		%feature("compactdefaultargs") IncreaseDegree;
		%feature("autodoc", "
Parameters
----------
NewDegree: int
Poles: TColgp_Array1OfPnt
Weights: TColStd_Array1OfReal *
NewPoles: TColgp_Array1OfPnt
NewWeights: TColStd_Array1OfReal *

Return
-------
None

Description
-----------
No available documentation.
") IncreaseDegree;
		static void IncreaseDegree(const Standard_Integer NewDegree, const TColgp_Array1OfPnt & Poles, const TColStd_Array1OfReal * Weights, TColgp_Array1OfPnt & NewPoles, TColStd_Array1OfReal * NewWeights);

		/****** BSplCLib::IncreaseDegree ******/
		/****** md5 signature: 55f08fe0b94875d193f674df9e8d1f57 ******/
		%feature("compactdefaultargs") IncreaseDegree;
		%feature("autodoc", "
Parameters
----------
theNewDegree: int
thePoles: TColgp_Array1OfPnt2d
theWeights: TColStd_Array1OfReal *
theNewPoles: TColgp_Array1OfPnt2d
theNewWeights: TColStd_Array1OfReal *

Return
-------
None

Description
-----------
Increase the degree of a bspline (or bezier) curve of dimension theDimension form theDegree to theNewDegree. //! The number of poles in the new curve is: @code Poles.Length() + (NewDegree - Degree) * Number of spans @endcode Where the number of spans is: @code LastUKnotIndex(Mults) - FirstUKnotIndex(Mults) + 1 @endcode for a non-periodic curve, and @code Knots.Length() - 1 @endcode for a periodic curve. //! The multiplicities of all knots are increased by the degree elevation. //! The new knots are usually the same knots with the exception of a non-periodic curve with the first and last multiplicity not equal to Degree+1 where knots are removed form the start and the bottom until the sum of the multiplicities is equal to NewDegree+1 at the knots corresponding to the first and last parameters of the curve. //! Example: Suppose a curve of degree 3 starting with following knots and multiplicities: @code knot: 0. 1. 2. mult: 1 2 1 @endcode //! The FirstUKnot is 2.0 because the sum of multiplicities is @code Degree+1: 1 + 2 + 1 = 4 = 3 + 1 @endcode i.e. the first parameter of the curve is 2.0 and will still be 2.0 after degree elevation. Let raise this curve to degree 4. The multiplicities are increased by 2. //! They become 2 3 2. But we need a sum of multiplicities of 5 at knot 2. So the first knot is removed and the new knots are: @code knot: 1. 2. mult: 3 2 @endcode The multiplicity of the first knot may also be reduced if the sum is still too big. //! In the most common situations (periodic curve or curve with first and last multiplicities equals to Degree+1) the knots are knot changes. //! The method IncreaseDegreeCountKnots can be used to compute the new number of knots.
") IncreaseDegree;
		static void IncreaseDegree(const Standard_Integer theNewDegree, const TColgp_Array1OfPnt2d & thePoles, const TColStd_Array1OfReal * theWeights, TColgp_Array1OfPnt2d & theNewPoles, TColStd_Array1OfReal * theNewWeights);

		/****** BSplCLib::IncreaseDegreeCountKnots ******/
		/****** md5 signature: 2806348fce0f853dcd1a4c2e39086690 ******/
		%feature("compactdefaultargs") IncreaseDegreeCountKnots;
		%feature("autodoc", "
Parameters
----------
Degree: int
NewDegree: int
Periodic: bool
Mults: TColStd_Array1OfInteger

Return
-------
int

Description
-----------
Returns the number of knots of a curve with multiplicities <Mults> after elevating the degree from <Degree> to <NewDegree>. See the IncreaseDegree method for more comments.
") IncreaseDegreeCountKnots;
		static Standard_Integer IncreaseDegreeCountKnots(const Standard_Integer Degree, const Standard_Integer NewDegree, const Standard_Boolean Periodic, const TColStd_Array1OfInteger & Mults);

		/****** BSplCLib::InsertKnot ******/
		/****** md5 signature: b308d7bc26fadeb0415b09f7df66deed ******/
		%feature("compactdefaultargs") InsertKnot;
		%feature("autodoc", "
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

Return
-------
None

Description
-----------
No available documentation.
") InsertKnot;
		static void InsertKnot(const Standard_Integer UIndex, const Standard_Real U, const Standard_Integer UMult, const Standard_Integer Degree, const Standard_Boolean Periodic, const TColgp_Array1OfPnt & Poles, const TColStd_Array1OfReal * Weights, const TColStd_Array1OfReal & Knots, const TColStd_Array1OfInteger & Mults, TColgp_Array1OfPnt & NewPoles, TColStd_Array1OfReal * NewWeights);

		/****** BSplCLib::InsertKnot ******/
		/****** md5 signature: b3ed0ff475a71d3360f7c4c61b840029 ******/
		%feature("compactdefaultargs") InsertKnot;
		%feature("autodoc", "
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

Return
-------
None

Description
-----------
Insert a new knot U of multiplicity UMult in the knot sequence. //! The location of the new Knot should be given as an input data. UIndex locates the new knot U in the knot sequence and Knots (UIndex) < U < Knots (UIndex + 1). //! The new control points corresponding to this insertion are returned. Knots and Mults are not updated.
") InsertKnot;
		static void InsertKnot(const Standard_Integer UIndex, const Standard_Real U, const Standard_Integer UMult, const Standard_Integer Degree, const Standard_Boolean Periodic, const TColgp_Array1OfPnt2d & Poles, const TColStd_Array1OfReal * Weights, const TColStd_Array1OfReal & Knots, const TColStd_Array1OfInteger & Mults, TColgp_Array1OfPnt2d & NewPoles, TColStd_Array1OfReal * NewWeights);

		/****** BSplCLib::InsertKnots ******/
		/****** md5 signature: 013fe81e359b48ad63b87e4971860cb9 ******/
		%feature("compactdefaultargs") InsertKnots;
		%feature("autodoc", "
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
Add: bool (optional, default to Standard_True)

Return
-------
None

Description
-----------
No available documentation.
") InsertKnots;
		static void InsertKnots(const Standard_Integer Degree, const Standard_Boolean Periodic, const Standard_Integer Dimension, const TColStd_Array1OfReal & Poles, const TColStd_Array1OfReal & Knots, const TColStd_Array1OfInteger & Mults, const TColStd_Array1OfReal & AddKnots, const TColStd_Array1OfInteger * AddMults, TColStd_Array1OfReal & NewPoles, TColStd_Array1OfReal & NewKnots, TColStd_Array1OfInteger & NewMults, const Standard_Real Epsilon, const Standard_Boolean Add = Standard_True);

		/****** BSplCLib::InsertKnots ******/
		/****** md5 signature: 44e9b7452e759b97d179e5c2523ae6e6 ******/
		%feature("compactdefaultargs") InsertKnots;
		%feature("autodoc", "
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
Add: bool (optional, default to Standard_True)

Return
-------
None

Description
-----------
No available documentation.
") InsertKnots;
		static void InsertKnots(const Standard_Integer Degree, const Standard_Boolean Periodic, const TColgp_Array1OfPnt & Poles, const TColStd_Array1OfReal * Weights, const TColStd_Array1OfReal & Knots, const TColStd_Array1OfInteger & Mults, const TColStd_Array1OfReal & AddKnots, const TColStd_Array1OfInteger * AddMults, TColgp_Array1OfPnt & NewPoles, TColStd_Array1OfReal * NewWeights, TColStd_Array1OfReal & NewKnots, TColStd_Array1OfInteger & NewMults, const Standard_Real Epsilon, const Standard_Boolean Add = Standard_True);

		/****** BSplCLib::InsertKnots ******/
		/****** md5 signature: be67416d5cb4ecf2afefb17210b615c4 ******/
		%feature("compactdefaultargs") InsertKnots;
		%feature("autodoc", "
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
Add: bool (optional, default to Standard_True)

Return
-------
None

Description
-----------
Insert a sequence of knots <AddKnots> with multiplicities <AddMults>. <AddKnots> must be a non decreasing sequence and verifies: //! Knots(Knots.Lower()) <= AddKnots(AddKnots.Lower()) Knots(Knots.Upper()) >= AddKnots(AddKnots.Upper()) //! The NewPoles and NewWeights arrays must have a length: Poles.Length() + Sum(AddMults()) //! When a knot to insert is identic to an existing knot the multiplicities are added. //! Epsilon is used to test knots for equality. //! When AddMult is negative or null the knot is not inserted. No multiplicity will becomes higher than the degree. //! The new Knots and Multiplicities are copied in <NewKnots> and <NewMults>. //! All the New arrays should be correctly dimensioned. //! When all the new knots are existing knots, i.e. only the multiplicities will change it is safe to use the same arrays as input and output.
") InsertKnots;
		static void InsertKnots(const Standard_Integer Degree, const Standard_Boolean Periodic, const TColgp_Array1OfPnt2d & Poles, const TColStd_Array1OfReal * Weights, const TColStd_Array1OfReal & Knots, const TColStd_Array1OfInteger & Mults, const TColStd_Array1OfReal & AddKnots, const TColStd_Array1OfInteger * AddMults, TColgp_Array1OfPnt2d & NewPoles, TColStd_Array1OfReal * NewWeights, TColStd_Array1OfReal & NewKnots, TColStd_Array1OfInteger & NewMults, const Standard_Real Epsilon, const Standard_Boolean Add = Standard_True);

		/****** BSplCLib::Interpolate ******/
		/****** md5 signature: e2fa20a66c129381e33f3cb4e6ce9d21 ******/
		%feature("compactdefaultargs") Interpolate;
		%feature("autodoc", "
Parameters
----------
Degree: int
FlatKnots: TColStd_Array1OfReal
Parameters: TColStd_Array1OfReal
ContactOrderArray: TColStd_Array1OfInteger
Poles: TColgp_Array1OfPnt

Return
-------
InversionProblem: int

Description
-----------
Performs the interpolation of the data given in the Poles array according to the requests in ContactOrderArray that is:  if ContactOrderArray(i) has value d it means that Poles(i) contains the dth derivative of the function to be interpolated. The length L of the following arrays must be the same: Parameters, ContactOrderArray, Poles, The length of FlatKnots is Degree + L + 1 Warning: the method used to do that interpolation is gauss elimination WITHOUT pivoting. Thus if the diagonal is not dominant there is no guarantee that the algorithm will work. Nevertheless for Cubic interpolation or interpolation at Scheonberg points the method will work The InversionProblem will report 0 if there was no problem else it will give the index of the faulty pivot.
") Interpolate;
		static void Interpolate(const Standard_Integer Degree, const TColStd_Array1OfReal & FlatKnots, const TColStd_Array1OfReal & Parameters, const TColStd_Array1OfInteger & ContactOrderArray, TColgp_Array1OfPnt & Poles, Standard_Integer &OutValue);

		/****** BSplCLib::Interpolate ******/
		/****** md5 signature: fd5aeac99513f881ae37161394ea9685 ******/
		%feature("compactdefaultargs") Interpolate;
		%feature("autodoc", "
Parameters
----------
Degree: int
FlatKnots: TColStd_Array1OfReal
Parameters: TColStd_Array1OfReal
ContactOrderArray: TColStd_Array1OfInteger
Poles: TColgp_Array1OfPnt2d

Return
-------
InversionProblem: int

Description
-----------
Performs the interpolation of the data given in the Poles array according to the requests in ContactOrderArray that is:  if ContactOrderArray(i) has value d it means that Poles(i) contains the dth derivative of the function to be interpolated. The length L of the following arrays must be the same: Parameters, ContactOrderArray, Poles, The length of FlatKnots is Degree + L + 1 Warning: the method used to do that interpolation is gauss elimination WITHOUT pivoting. Thus if the diagonal is not dominant there is no guarantee that the algorithm will work. Nevertheless for Cubic interpolation at knots or interpolation at Scheonberg points the method will work. The InversionProblem w ll report 0 if there was no problem else it will give the index of the faulty pivot.
") Interpolate;
		static void Interpolate(const Standard_Integer Degree, const TColStd_Array1OfReal & FlatKnots, const TColStd_Array1OfReal & Parameters, const TColStd_Array1OfInteger & ContactOrderArray, TColgp_Array1OfPnt2d & Poles, Standard_Integer &OutValue);

		/****** BSplCLib::Interpolate ******/
		/****** md5 signature: 2212219c7508d74418481956ee1ddf0e ******/
		%feature("compactdefaultargs") Interpolate;
		%feature("autodoc", "
Parameters
----------
Degree: int
FlatKnots: TColStd_Array1OfReal
Parameters: TColStd_Array1OfReal
ContactOrderArray: TColStd_Array1OfInteger
Poles: TColgp_Array1OfPnt
Weights: TColStd_Array1OfReal

Return
-------
InversionProblem: int

Description
-----------
Performs the interpolation of the data given in the Poles array according to the requests in ContactOrderArray that is:  if ContactOrderArray(i) has value d it means that Poles(i) contains the dth derivative of the function to be interpolated. The length L of the following arrays must be the same: Parameters, ContactOrderArray, Poles, The length of FlatKnots is Degree + L + 1 Warning: the method used to do that interpolation is gauss elimination WITHOUT pivoting. Thus if the diagonal is not dominant there is no guarantee that the algorithm will work. Nevertheless for Cubic interpolation at knots or interpolation at Scheonberg points the method will work. The InversionProblem will report 0 if there was no problem else it will give the index of the faulty pivot.
") Interpolate;
		static void Interpolate(const Standard_Integer Degree, const TColStd_Array1OfReal & FlatKnots, const TColStd_Array1OfReal & Parameters, const TColStd_Array1OfInteger & ContactOrderArray, TColgp_Array1OfPnt & Poles, TColStd_Array1OfReal & Weights, Standard_Integer &OutValue);

		/****** BSplCLib::Interpolate ******/
		/****** md5 signature: 0cdd4d771c634dfeec3e69ce9529d617 ******/
		%feature("compactdefaultargs") Interpolate;
		%feature("autodoc", "
Parameters
----------
Degree: int
FlatKnots: TColStd_Array1OfReal
Parameters: TColStd_Array1OfReal
ContactOrderArray: TColStd_Array1OfInteger
Poles: TColgp_Array1OfPnt2d
Weights: TColStd_Array1OfReal

Return
-------
InversionProblem: int

Description
-----------
Performs the interpolation of the data given in the Poles array according to the requests in ContactOrderArray that is:  if ContactOrderArray(i) has value d it means that Poles(i) contains the dth derivative of the function to be interpolated. The length L of the following arrays must be the same: Parameters, ContactOrderArray, Poles, The length of FlatKnots is Degree + L + 1 Warning: the method used to do that interpolation is gauss elimination WITHOUT pivoting. Thus if the diagonal is not dominant there is no guarantee that the algorithm will work. Nevertheless for Cubic interpolation at knots or interpolation at Scheonberg points the method will work. The InversionProblem w ll report 0 if there was no problem else it will give the i.
") Interpolate;
		static void Interpolate(const Standard_Integer Degree, const TColStd_Array1OfReal & FlatKnots, const TColStd_Array1OfReal & Parameters, const TColStd_Array1OfInteger & ContactOrderArray, TColgp_Array1OfPnt2d & Poles, TColStd_Array1OfReal & Weights, Standard_Integer &OutValue);

		/****** BSplCLib::Interpolate ******/
		/****** md5 signature: b5cf60eb426c89a7bf0dd27c83c89e23 ******/
		%feature("compactdefaultargs") Interpolate;
		%feature("autodoc", "
Parameters
----------
Degree: int
FlatKnots: TColStd_Array1OfReal
Parameters: TColStd_Array1OfReal
ContactOrderArray: TColStd_Array1OfInteger
ArrayDimension: int

Return
-------
Poles: float
InversionProblem: int

Description
-----------
Performs the interpolation of the data given in the Poles array according to the requests in ContactOrderArray that is:  if ContactOrderArray(i) has value d it means that Poles(i) contains the dth derivative of the function to be interpolated. The length L of the following arrays must be the same: Parameters, ContactOrderArray The length of FlatKnots is Degree + L + 1 The PolesArray is an seen as an Array[1..N][1..ArrayDimension] with N = tge length of the parameters array Warning: the method used to do that interpolation is gauss elimination WITHOUT pivoting. Thus if the diagonal is not dominant there is no guarantee that the algorithm will work. Nevertheless for Cubic interpolation or interpolation at Scheonberg points the method will work The InversionProblem will report 0 if there was no problem else it will give the index of the faulty pivot.
") Interpolate;
		static void Interpolate(const Standard_Integer Degree, const TColStd_Array1OfReal & FlatKnots, const TColStd_Array1OfReal & Parameters, const TColStd_Array1OfInteger & ContactOrderArray, const Standard_Integer ArrayDimension, Standard_Real &OutValue, Standard_Integer &OutValue);

		/****** BSplCLib::Interpolate ******/
		/****** md5 signature: 4ae05d20a7d577aff2db78e9c82a018c ******/
		%feature("compactdefaultargs") Interpolate;
		%feature("autodoc", "
Parameters
----------
Degree: int
FlatKnots: TColStd_Array1OfReal
Parameters: TColStd_Array1OfReal
ContactOrderArray: TColStd_Array1OfInteger
ArrayDimension: int

Return
-------
Poles: float
Weights: float
InversionProblem: int

Description
-----------
No available documentation.
") Interpolate;
		static void Interpolate(const Standard_Integer Degree, const TColStd_Array1OfReal & FlatKnots, const TColStd_Array1OfReal & Parameters, const TColStd_Array1OfInteger & ContactOrderArray, const Standard_Integer ArrayDimension, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Integer &OutValue);

		/****** BSplCLib::Intervals ******/
		/****** md5 signature: 6005dd7b642eb153ae7f9293cf41ffb5 ******/
		%feature("compactdefaultargs") Intervals;
		%feature("autodoc", "
Parameters
----------
theKnots: TColStd_Array1OfReal
theMults: TColStd_Array1OfInteger
theDegree: int
isPeriodic: bool
theContinuity: int
theFirst: float
theLast: float
theTolerance: float
theIntervals: TColStd_Array1OfReal *

Return
-------
int

Description
-----------
Splits the given range to BSpline intervals of given continuity 
Input parameter: theKnots the knots of BSpline 
Input parameter: theMults the knots' multiplicities 
Input parameter: theDegree the degree of BSpline 
Input parameter: isPeriodic the periodicity of BSpline 
Input parameter: theContinuity the target interval's continuity 
Input parameter: theFirst the begin of the target range 
Input parameter: theLast the end of the target range 
Input parameter: theTolerance the tolerance @param[in,out] theIntervals the array to store intervals if isn't nullptr 
Return: the number of intervals.
") Intervals;
		static Standard_Integer Intervals(const TColStd_Array1OfReal & theKnots, const TColStd_Array1OfInteger & theMults, Standard_Integer theDegree, Standard_Boolean isPeriodic, Standard_Integer theContinuity, Standard_Real theFirst, Standard_Real theLast, Standard_Real theTolerance, TColStd_Array1OfReal * theIntervals);

		/****** BSplCLib::IsRational ******/
		/****** md5 signature: 5ee1bb4d64e0a78acc3cb994f1afcefa ******/
		%feature("compactdefaultargs") IsRational;
		%feature("autodoc", "
Parameters
----------
Weights: TColStd_Array1OfReal
I1: int
I2: int
Epsilon: float (optional, default to 0.0)

Return
-------
bool

Description
-----------
Returns False if all the weights of the array <Weights> between I1 an I2 are identic. Epsilon is used for comparing weights. If Epsilon is 0. the Epsilon of the first weight is used.
") IsRational;
		static Standard_Boolean IsRational(const TColStd_Array1OfReal & Weights, const Standard_Integer I1, const Standard_Integer I2, const Standard_Real Epsilon = 0.0);

		/****** BSplCLib::KnotAnalysis ******/
		/****** md5 signature: a6e80a652c2aafa8024e7fdc8544d77c ******/
		%feature("compactdefaultargs") KnotAnalysis;
		%feature("autodoc", "
Parameters
----------
Degree: int
Periodic: bool
CKnots: TColStd_Array1OfReal
CMults: TColStd_Array1OfInteger
KnotForm: GeomAbs_BSplKnotDistribution

Return
-------
MaxKnotMult: int

Description
-----------
Analyzes the array of knots. Returns the form and the maximum knot multiplicity.
") KnotAnalysis;
		static void KnotAnalysis(const Standard_Integer Degree, const Standard_Boolean Periodic, const TColStd_Array1OfReal & CKnots, const TColStd_Array1OfInteger & CMults, GeomAbs_BSplKnotDistribution & KnotForm, Standard_Integer &OutValue);

		/****** BSplCLib::KnotForm ******/
		/****** md5 signature: 0097f63f98647952ea3a1e8664501689 ******/
		%feature("compactdefaultargs") KnotForm;
		%feature("autodoc", "
Parameters
----------
Knots: TColStd_Array1OfReal
FromK1: int
ToK2: int

Return
-------
BSplCLib_KnotDistribution

Description
-----------
Analyses if the knots distribution is 'Uniform' or 'NonUniform' between the knot FromK1 and the knot ToK2. There is no repetition of knot in the knots'sequence <Knots>.
") KnotForm;
		static BSplCLib_KnotDistribution KnotForm(const TColStd_Array1OfReal & Knots, const Standard_Integer FromK1, const Standard_Integer ToK2);

		/****** BSplCLib::KnotSequence ******/
		/****** md5 signature: afb0a094a5f9cb7ee5196da7628bb20b ******/
		%feature("compactdefaultargs") KnotSequence;
		%feature("autodoc", "
Parameters
----------
Knots: TColStd_Array1OfReal
Mults: TColStd_Array1OfInteger
KnotSeq: TColStd_Array1OfReal
Periodic: bool (optional, default to Standard_False)

Return
-------
None

Description
-----------
No available documentation.
") KnotSequence;
		static void KnotSequence(const TColStd_Array1OfReal & Knots, const TColStd_Array1OfInteger & Mults, TColStd_Array1OfReal & KnotSeq, const Standard_Boolean Periodic = Standard_False);

		/****** BSplCLib::KnotSequence ******/
		/****** md5 signature: 935f3e64125f13f8b157c325e706c6c5 ******/
		%feature("compactdefaultargs") KnotSequence;
		%feature("autodoc", "
Parameters
----------
Knots: TColStd_Array1OfReal
Mults: TColStd_Array1OfInteger
Degree: int
Periodic: bool
KnotSeq: TColStd_Array1OfReal

Return
-------
None

Description
-----------
Computes the sequence of knots KnotSeq with repetition of the knots of multiplicity greater than 1. //! Length of KnotSeq must be KnotSequenceLength(Mults,Degree,Periodic).
") KnotSequence;
		static void KnotSequence(const TColStd_Array1OfReal & Knots, const TColStd_Array1OfInteger & Mults, const Standard_Integer Degree, const Standard_Boolean Periodic, TColStd_Array1OfReal & KnotSeq);

		/****** BSplCLib::KnotSequenceLength ******/
		/****** md5 signature: 0b0bae3397b7a20bdbf0907b980aa22a ******/
		%feature("compactdefaultargs") KnotSequenceLength;
		%feature("autodoc", "
Parameters
----------
Mults: TColStd_Array1OfInteger
Degree: int
Periodic: bool

Return
-------
int

Description
-----------
Returns the length of the sequence of knots with repetition. //! Periodic: //! Sum(Mults(i), i = Mults.Lower(); i <= Mults.Upper()); //! Non Periodic: //! Sum(Mults(i); i = Mults.Lower(); i < Mults.Upper()) + 2 * Degree.
") KnotSequenceLength;
		static Standard_Integer KnotSequenceLength(const TColStd_Array1OfInteger & Mults, const Standard_Integer Degree, const Standard_Boolean Periodic);

		/****** BSplCLib::Knots ******/
		/****** md5 signature: 70efd22fb93da2362599b5a577c6459d ******/
		%feature("compactdefaultargs") Knots;
		%feature("autodoc", "
Parameters
----------
KnotSeq: TColStd_Array1OfReal
Knots: TColStd_Array1OfReal
Mults: TColStd_Array1OfInteger
Periodic: bool (optional, default to Standard_False)

Return
-------
None

Description
-----------
Computes the sequence of knots Knots without repetition of the knots of multiplicity greater than 1. //! Length of <Knots> and <Mults> must be KnotsLength(KnotSequence,Periodic).
") Knots;
		static void Knots(const TColStd_Array1OfReal & KnotSeq, TColStd_Array1OfReal & Knots, TColStd_Array1OfInteger & Mults, const Standard_Boolean Periodic = Standard_False);

		/****** BSplCLib::KnotsLength ******/
		/****** md5 signature: f94187e02e0f1196d3a33404dd4beb1c ******/
		%feature("compactdefaultargs") KnotsLength;
		%feature("autodoc", "
Parameters
----------
KnotSeq: TColStd_Array1OfReal
Periodic: bool (optional, default to Standard_False)

Return
-------
int

Description
-----------
Returns the length of the sequence of knots (and Mults) without repetition.
") KnotsLength;
		static Standard_Integer KnotsLength(const TColStd_Array1OfReal & KnotSeq, const Standard_Boolean Periodic = Standard_False);

		/****** BSplCLib::LastUKnotIndex ******/
		/****** md5 signature: 91f9e1c94b860add3183ecd59eb8096a ******/
		%feature("compactdefaultargs") LastUKnotIndex;
		%feature("autodoc", "
Parameters
----------
Degree: int
Mults: TColStd_Array1OfInteger

Return
-------
int

Description
-----------
Computes the index of the knots value which gives the end point of the curve.
") LastUKnotIndex;
		static Standard_Integer LastUKnotIndex(const Standard_Integer Degree, const TColStd_Array1OfInteger & Mults);

		/****** BSplCLib::LocateParameter ******/
		/****** md5 signature: 24762308cb330e46f1844ce565eeb2b9 ******/
		%feature("compactdefaultargs") LocateParameter;
		%feature("autodoc", "
Parameters
----------
Degree: int
Knots: TColStd_Array1OfReal
Mults: TColStd_Array1OfInteger
U: float
IsPeriodic: bool
FromK1: int
ToK2: int

Return
-------
KnotIndex: int
NewU: float

Description
-----------
Locates the parametric value U in the knots sequence between the knot K1 and the knot K2. The value return in Index verifies. //! Knots(Index) <= U < Knots(Index + 1) if U <= Knots (K1) then Index = K1 if U >= Knots (K2) then Index = K2 - 1 //! If Periodic is True U may be modified to fit in the range Knots(K1), Knots(K2). In any case the correct value is returned in NewU. //! Warnings :Index is used as input data to initialize the searching function. Warning: Knots have to be 'with repetitions'.
") LocateParameter;
		static void LocateParameter(const Standard_Integer Degree, const TColStd_Array1OfReal & Knots, const TColStd_Array1OfInteger & Mults, const Standard_Real U, const Standard_Boolean IsPeriodic, const Standard_Integer FromK1, const Standard_Integer ToK2, Standard_Integer &OutValue, Standard_Real &OutValue);

		/****** BSplCLib::LocateParameter ******/
		/****** md5 signature: 84a2a9eb0a9f97bd685828ae0b21bc6e ******/
		%feature("compactdefaultargs") LocateParameter;
		%feature("autodoc", "
Parameters
----------
Degree: int
Knots: TColStd_Array1OfReal
U: float
IsPeriodic: bool
FromK1: int
ToK2: int

Return
-------
KnotIndex: int
NewU: float

Description
-----------
Locates the parametric value U in the knots sequence between the knot K1 and the knot K2. The value return in Index verifies. //! Knots(Index) <= U < Knots(Index + 1) if U <= Knots (K1) then Index = K1 if U >= Knots (K2) then Index = K2 - 1 //! If Periodic is True U may be modified to fit in the range Knots(K1), Knots(K2). In any case the correct value is returned in NewU. //! Warnings :Index is used as input data to initialize the searching function. Warning: Knots have to be 'flat'.
") LocateParameter;
		static void LocateParameter(const Standard_Integer Degree, const TColStd_Array1OfReal & Knots, const Standard_Real U, const Standard_Boolean IsPeriodic, const Standard_Integer FromK1, const Standard_Integer ToK2, Standard_Integer &OutValue, Standard_Real &OutValue);

		/****** BSplCLib::LocateParameter ******/
		/****** md5 signature: 7a22649239d0309e62561b711af4bd66 ******/
		%feature("compactdefaultargs") LocateParameter;
		%feature("autodoc", "
Parameters
----------
Degree: int
Knots: TColStd_Array1OfReal
Mults: TColStd_Array1OfInteger *
U: float
Periodic: bool

Return
-------
Index: int
NewU: float

Description
-----------
No available documentation.
") LocateParameter;
		static void LocateParameter(const Standard_Integer Degree, const TColStd_Array1OfReal & Knots, const TColStd_Array1OfInteger * Mults, const Standard_Real U, const Standard_Boolean Periodic, Standard_Integer &OutValue, Standard_Real &OutValue);

		/****** BSplCLib::MaxDegree ******/
		/****** md5 signature: 985314a0ed62b597a9bdf0f555b97bed ******/
		%feature("compactdefaultargs") MaxDegree;
		%feature("autodoc", "Return
-------
int

Description
-----------
returns the degree maxima for a BSplineCurve.
") MaxDegree;
		static Standard_Integer MaxDegree();

		/****** BSplCLib::MaxKnotMult ******/
		/****** md5 signature: ac65dfe55c0073e75792f284e56cd7aa ******/
		%feature("compactdefaultargs") MaxKnotMult;
		%feature("autodoc", "
Parameters
----------
Mults: TColStd_Array1OfInteger
K1: int
K2: int

Return
-------
int

Description
-----------
Finds the greatest multiplicity in a set of knots between K1 and K2. Mults is the multiplicity associated with each knot value.
") MaxKnotMult;
		static Standard_Integer MaxKnotMult(const TColStd_Array1OfInteger & Mults, const Standard_Integer K1, const Standard_Integer K2);

		/****** BSplCLib::MergeBSplineKnots ******/
		/****** md5 signature: effe499663badb4d232069dd652236c2 ******/
		%feature("compactdefaultargs") MergeBSplineKnots;
		%feature("autodoc", "
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

Return
-------
NumPoles: int

Description
-----------
Merges two knot vector by setting the starting and ending values to StartValue and EndValue.
") MergeBSplineKnots;
		static void MergeBSplineKnots(const Standard_Real Tolerance, const Standard_Real StartValue, const Standard_Real EndValue, const Standard_Integer Degree1, const TColStd_Array1OfReal & Knots1, const TColStd_Array1OfInteger & Mults1, const Standard_Integer Degree2, const TColStd_Array1OfReal & Knots2, const TColStd_Array1OfInteger & Mults2, Standard_Integer &OutValue, opencascade::handle<TColStd_HArray1OfReal> & NewKnots, opencascade::handle<TColStd_HArray1OfInteger> & NewMults);

		/****** BSplCLib::MinKnotMult ******/
		/****** md5 signature: 1a548fdbf5671589224d148d3a3a6b0d ******/
		%feature("compactdefaultargs") MinKnotMult;
		%feature("autodoc", "
Parameters
----------
Mults: TColStd_Array1OfInteger
K1: int
K2: int

Return
-------
int

Description
-----------
Finds the lowest multiplicity in a set of knots between K1 and K2. Mults is the multiplicity associated with each knot value.
") MinKnotMult;
		static Standard_Integer MinKnotMult(const TColStd_Array1OfInteger & Mults, const Standard_Integer K1, const Standard_Integer K2);

		/****** BSplCLib::MovePoint ******/
		/****** md5 signature: 258c43adb74db6c2cd76d84b353a498f ******/
		%feature("compactdefaultargs") MovePoint;
		%feature("autodoc", "
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

Return
-------
FirstIndex: int
LastIndex: int

Description
-----------
Find the new poles which allows an old point (with a given u as parameter) to reach a new position Index1 and Index2 indicate the range of poles we can move (1, NbPoles-1) or (2, NbPoles) -> no constraint for one side don't enter (1,NbPoles) -> error: rigid move (2, NbPoles-1) -> the ends are enforced (3, NbPoles-2) -> the ends and the tangency are enforced if Problem in BSplineBasis calculation, no change for the curve and FirstIndex, LastIndex = 0.
") MovePoint;
		static void MovePoint(const Standard_Real U, const gp_Vec2d & Displ, const Standard_Integer Index1, const Standard_Integer Index2, const Standard_Integer Degree, const TColgp_Array1OfPnt2d & Poles, const TColStd_Array1OfReal * Weights, const TColStd_Array1OfReal & FlatKnots, Standard_Integer &OutValue, Standard_Integer &OutValue, TColgp_Array1OfPnt2d & NewPoles);

		/****** BSplCLib::MovePoint ******/
		/****** md5 signature: c86875bcabde81f6d6d9eb1c7e44e5de ******/
		%feature("compactdefaultargs") MovePoint;
		%feature("autodoc", "
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

Return
-------
FirstIndex: int
LastIndex: int

Description
-----------
Find the new poles which allows an old point (with a given u as parameter) to reach a new position Index1 and Index2 indicate the range of poles we can move (1, NbPoles-1) or (2, NbPoles) -> no constraint for one side don't enter (1,NbPoles) -> error: rigid move (2, NbPoles-1) -> the ends are enforced (3, NbPoles-2) -> the ends and the tangency are enforced if Problem in BSplineBasis calculation, no change for the curve and FirstIndex, LastIndex = 0.
") MovePoint;
		static void MovePoint(const Standard_Real U, const gp_Vec & Displ, const Standard_Integer Index1, const Standard_Integer Index2, const Standard_Integer Degree, const TColgp_Array1OfPnt & Poles, const TColStd_Array1OfReal * Weights, const TColStd_Array1OfReal & FlatKnots, Standard_Integer &OutValue, Standard_Integer &OutValue, TColgp_Array1OfPnt & NewPoles);

		/****** BSplCLib::MovePointAndTangent ******/
		/****** md5 signature: f3528b941ebae064eb869dac3838fd8b ******/
		%feature("compactdefaultargs") MovePointAndTangent;
		%feature("autodoc", "
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

Return
-------
Delta: float
DeltaDerivative: float
Poles: float
NewPoles: float
ErrorStatus: int

Description
-----------
This is the dimension free version of the utility U is the parameter must be within the first FlatKnots and the last FlatKnots Delta is the amount the curve has to be moved DeltaDerivative is the amount the derivative has to be moved. Delta and DeltaDerivative must be array of dimension ArrayDimension Degree is the degree of the BSpline and the FlatKnots are the knots of the BSpline Starting Condition if = -1 means the starting point of the curve can move = 0 means the starting point of the curve cannot move but tangent starting point of the curve cannot move = 1 means the starting point and tangents cannot move = 2 means the starting point tangent and curvature cannot move = ... Same holds for EndingCondition Poles are the poles of the curve Weights are the weights of the curve if not NULL NewPoles are the poles of the deformed curve ErrorStatus will be 0 if no error happened 1 if there are not enough knots/poles the imposed conditions The way to solve this problem is to add knots to the BSpline If StartCondition = 1 and EndCondition = 1 then you need at least 4 + 2 = 6 poles so for example to have a C1 cubic you will need have at least 2 internal knots.
") MovePointAndTangent;
		static void MovePointAndTangent(const Standard_Real U, const Standard_Integer ArrayDimension, Standard_Real &OutValue, Standard_Real &OutValue, const Standard_Real Tolerance, const Standard_Integer Degree, const Standard_Integer StartingCondition, const Standard_Integer EndingCondition, Standard_Real &OutValue, const TColStd_Array1OfReal * Weights, const TColStd_Array1OfReal & FlatKnots, Standard_Real &OutValue, Standard_Integer &OutValue);

		/****** BSplCLib::MovePointAndTangent ******/
		/****** md5 signature: 84d0d45564e777fb1d986a7bc7085bd3 ******/
		%feature("compactdefaultargs") MovePointAndTangent;
		%feature("autodoc", "
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

Return
-------
ErrorStatus: int

Description
-----------
This is the dimension free version of the utility U is the parameter must be within the first FlatKnots and the last FlatKnots Delta is the amount the curve has to be moved DeltaDerivative is the amount the derivative has to be moved. Delta and DeltaDerivative must be array of dimension ArrayDimension Degree is the degree of the BSpline and the FlatKnots are the knots of the BSpline Starting Condition if = -1 means the starting point of the curve can move = 0 means the starting point of the curve cannot move but tangent starting point of the curve cannot move = 1 means the starting point and tangents cannot move = 2 means the starting point tangent and curvature cannot move = ... Same holds for EndingCondition Poles are the poles of the curve Weights are the weights of the curve if not NULL NewPoles are the poles of the deformed curve ErrorStatus will be 0 if no error happened 1 if there are not enough knots/poles the imposed conditions The way to solve this problem is to add knots to the BSpline If StartCondition = 1 and EndCondition = 1 then you need at least 4 + 2 = 6 poles so for example to have a C1 cubic you will need have at least 2 internal knots.
") MovePointAndTangent;
		static void MovePointAndTangent(const Standard_Real U, const gp_Vec & Delta, const gp_Vec & DeltaDerivative, const Standard_Real Tolerance, const Standard_Integer Degree, const Standard_Integer StartingCondition, const Standard_Integer EndingCondition, const TColgp_Array1OfPnt & Poles, const TColStd_Array1OfReal * Weights, const TColStd_Array1OfReal & FlatKnots, TColgp_Array1OfPnt & NewPoles, Standard_Integer &OutValue);

		/****** BSplCLib::MovePointAndTangent ******/
		/****** md5 signature: 4281391111a23f8a2fbca803f5519e35 ******/
		%feature("compactdefaultargs") MovePointAndTangent;
		%feature("autodoc", "
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

Return
-------
ErrorStatus: int

Description
-----------
This is the dimension free version of the utility U is the parameter must be within the first FlatKnots and the last FlatKnots Delta is the amount the curve has to be moved DeltaDerivative is the amount the derivative has to be moved. Delta and DeltaDerivative must be array of dimension ArrayDimension Degree is the degree of the BSpline and the FlatKnots are the knots of the BSpline Starting Condition if = -1 means the starting point of the curve can move = 0 means the starting point of the curve cannot move but tangent starting point of the curve cannot move = 1 means the starting point and tangents cannot move = 2 means the starting point tangent and curvature cannot move = ... Same holds for EndingCondition Poles are the poles of the curve Weights are the weights of the curve if not NULL NewPoles are the poles of the deformed curve ErrorStatus will be 0 if no error happened 1 if there are not enough knots/poles the imposed conditions The way to solve this problem is to add knots to the BSpline If StartCondition = 1 and EndCondition = 1 then you need at least 4 + 2 = 6 poles so for example to have a C1 cubic you will need have at least 2 internal knots.
") MovePointAndTangent;
		static void MovePointAndTangent(const Standard_Real U, const gp_Vec2d & Delta, const gp_Vec2d & DeltaDerivative, const Standard_Real Tolerance, const Standard_Integer Degree, const Standard_Integer StartingCondition, const Standard_Integer EndingCondition, const TColgp_Array1OfPnt2d & Poles, const TColStd_Array1OfReal * Weights, const TColStd_Array1OfReal & FlatKnots, TColgp_Array1OfPnt2d & NewPoles, Standard_Integer &OutValue);

		/****** BSplCLib::MultForm ******/
		/****** md5 signature: 85cc5e3d06d09a736fc529142891b46b ******/
		%feature("compactdefaultargs") MultForm;
		%feature("autodoc", "
Parameters
----------
Mults: TColStd_Array1OfInteger
FromK1: int
ToK2: int

Return
-------
BSplCLib_MultDistribution

Description
-----------
Analyses the distribution of multiplicities between the knot FromK1 and the Knot ToK2.
") MultForm;
		static BSplCLib_MultDistribution MultForm(const TColStd_Array1OfInteger & Mults, const Standard_Integer FromK1, const Standard_Integer ToK2);

		/****** BSplCLib::NbPoles ******/
		/****** md5 signature: c6d4161c26923bab1e3ce4d84d387cfe ******/
		%feature("compactdefaultargs") NbPoles;
		%feature("autodoc", "
Parameters
----------
Degree: int
Periodic: bool
Mults: TColStd_Array1OfInteger

Return
-------
int

Description
-----------
Returns the number of poles of the curve. Returns 0 if one of the multiplicities is incorrect. //! * Non positive. //! * Greater than Degree, or Degree+1 at the first and last knot of a non periodic curve. //! * The last periodicity on a periodic curve is not equal to the first.
") NbPoles;
		static Standard_Integer NbPoles(const Standard_Integer Degree, const Standard_Boolean Periodic, const TColStd_Array1OfInteger & Mults);

		/****** BSplCLib::NoMults ******/
		/****** md5 signature: 25ebd1add10620b7395bfd564aafb5c4 ******/
		%feature("compactdefaultargs") NoMults;
		%feature("autodoc", "Return
-------
TColStd_Array1OfInteger *

Description
-----------
Used as argument for a flatknots evaluation.
") NoMults;
		static TColStd_Array1OfInteger * NoMults();

		/****** BSplCLib::NoWeights ******/
		/****** md5 signature: bcccc7afe5a4725a5649ba0988d8696b ******/
		%feature("compactdefaultargs") NoWeights;
		%feature("autodoc", "Return
-------
TColStd_Array1OfReal *

Description
-----------
Used as argument for a non rational curve.
") NoWeights;
		static TColStd_Array1OfReal * NoWeights();

		/****** BSplCLib::PoleIndex ******/
		/****** md5 signature: 1ac0cbf47e8a95057f9b7585fb439d64 ******/
		%feature("compactdefaultargs") PoleIndex;
		%feature("autodoc", "
Parameters
----------
Degree: int
Index: int
Periodic: bool
Mults: TColStd_Array1OfInteger

Return
-------
int

Description
-----------
Return the index of the first Pole to use on the span Mults(Index) - Mults(Index+1). This index must be added to Poles.Lower().
") PoleIndex;
		static Standard_Integer PoleIndex(const Standard_Integer Degree, const Standard_Integer Index, const Standard_Boolean Periodic, const TColStd_Array1OfInteger & Mults);

		/****** BSplCLib::PolesCoefficients ******/
		/****** md5 signature: 511519c534e22ba40280528d5d1ef87e ******/
		%feature("compactdefaultargs") PolesCoefficients;
		%feature("autodoc", "
Parameters
----------
Poles: TColgp_Array1OfPnt2d
CachePoles: TColgp_Array1OfPnt2d

Return
-------
None

Description
-----------
No available documentation.
") PolesCoefficients;
		static void PolesCoefficients(const TColgp_Array1OfPnt2d & Poles, TColgp_Array1OfPnt2d & CachePoles);

		/****** BSplCLib::PolesCoefficients ******/
		/****** md5 signature: 405a5ce1920546314bea6ba5a6a3f98b ******/
		%feature("compactdefaultargs") PolesCoefficients;
		%feature("autodoc", "
Parameters
----------
Poles: TColgp_Array1OfPnt2d
Weights: TColStd_Array1OfReal *
CachePoles: TColgp_Array1OfPnt2d
CacheWeights: TColStd_Array1OfReal *

Return
-------
None

Description
-----------
No available documentation.
") PolesCoefficients;
		static void PolesCoefficients(const TColgp_Array1OfPnt2d & Poles, const TColStd_Array1OfReal * Weights, TColgp_Array1OfPnt2d & CachePoles, TColStd_Array1OfReal * CacheWeights);

		/****** BSplCLib::PolesCoefficients ******/
		/****** md5 signature: ee906c090873ca3443d5f58dda312bc9 ******/
		%feature("compactdefaultargs") PolesCoefficients;
		%feature("autodoc", "
Parameters
----------
Poles: TColgp_Array1OfPnt
CachePoles: TColgp_Array1OfPnt

Return
-------
None

Description
-----------
No available documentation.
") PolesCoefficients;
		static void PolesCoefficients(const TColgp_Array1OfPnt & Poles, TColgp_Array1OfPnt & CachePoles);

		/****** BSplCLib::PolesCoefficients ******/
		/****** md5 signature: eb7334dc15bb52330ce561fc1f10d66d ******/
		%feature("compactdefaultargs") PolesCoefficients;
		%feature("autodoc", "
Parameters
----------
Poles: TColgp_Array1OfPnt
Weights: TColStd_Array1OfReal *
CachePoles: TColgp_Array1OfPnt
CacheWeights: TColStd_Array1OfReal *

Return
-------
None

Description
-----------
Encapsulation of BuildCache to perform the evaluation of the Taylor expansion for beziercurves at parameter 0. Warning: To be used for Beziercurves ONLY!!!.
") PolesCoefficients;
		static void PolesCoefficients(const TColgp_Array1OfPnt & Poles, const TColStd_Array1OfReal * Weights, TColgp_Array1OfPnt & CachePoles, TColStd_Array1OfReal * CacheWeights);

		/****** BSplCLib::PrepareInsertKnots ******/
		/****** md5 signature: a44fd015e2f0b30470efd81b373c7ea8 ******/
		%feature("compactdefaultargs") PrepareInsertKnots;
		%feature("autodoc", "
Parameters
----------
Degree: int
Periodic: bool
Knots: TColStd_Array1OfReal
Mults: TColStd_Array1OfInteger
AddKnots: TColStd_Array1OfReal
AddMults: TColStd_Array1OfInteger *
Epsilon: float
Add: bool (optional, default to Standard_True)

Return
-------
NbPoles: int
NbKnots: int

Description
-----------
Returns in <NbPoles, NbKnots> the new number of poles and knots if the sequence of knots <AddKnots, AddMults> is inserted in the sequence <Knots, Mults>. //! Epsilon is used to compare knots for equality. //! If Add is True the multiplicities on equal knots are added. //! If Add is False the max value of the multiplicities is kept. //! Return False if: The knew knots are knot increasing. The new knots are not in the range.
") PrepareInsertKnots;
		static Standard_Boolean PrepareInsertKnots(const Standard_Integer Degree, const Standard_Boolean Periodic, const TColStd_Array1OfReal & Knots, const TColStd_Array1OfInteger & Mults, const TColStd_Array1OfReal & AddKnots, const TColStd_Array1OfInteger * AddMults, Standard_Integer &OutValue, Standard_Integer &OutValue, const Standard_Real Epsilon, const Standard_Boolean Add = Standard_True);

		/****** BSplCLib::PrepareTrimming ******/
		/****** md5 signature: 86f0fb4e064014ba01b07670c1d98634 ******/
		%feature("compactdefaultargs") PrepareTrimming;
		%feature("autodoc", "
Parameters
----------
Degree: int
Periodic: bool
Knots: TColStd_Array1OfReal
Mults: TColStd_Array1OfInteger
U1: float
U2: float

Return
-------
NbKnots: int
NbPoles: int

Description
-----------
Set in <NbKnots> and <NbPoles> the number of Knots and Poles of the curve resulting from the trimming of the BSplinecurve defined with <degree>, <knots>, <mults>.
") PrepareTrimming;
		static void PrepareTrimming(const Standard_Integer Degree, const Standard_Boolean Periodic, const TColStd_Array1OfReal & Knots, const TColStd_Array1OfInteger & Mults, const Standard_Real U1, const Standard_Real U2, Standard_Integer &OutValue, Standard_Integer &OutValue);

		/****** BSplCLib::PrepareUnperiodize ******/
		/****** md5 signature: 836730920827f9f48a170c9a6982c170 ******/
		%feature("compactdefaultargs") PrepareUnperiodize;
		%feature("autodoc", "
Parameters
----------
Degree: int
Mults: TColStd_Array1OfInteger

Return
-------
NbKnots: int
NbPoles: int

Description
-----------
Set in <NbKnots> and <NbPolesToAdd> the number of Knots and Poles of the NotPeriodic Curve identical at the periodic curve with a degree <Degree> , a knots-distribution with Multiplicities <Mults>.
") PrepareUnperiodize;
		static void PrepareUnperiodize(const Standard_Integer Degree, const TColStd_Array1OfInteger & Mults, Standard_Integer &OutValue, Standard_Integer &OutValue);

		/****** BSplCLib::RaiseMultiplicity ******/
		/****** md5 signature: 1946ad36bcb97331dfe37ade25ab9172 ******/
		%feature("compactdefaultargs") RaiseMultiplicity;
		%feature("autodoc", "
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

Return
-------
None

Description
-----------
No available documentation.
") RaiseMultiplicity;
		static void RaiseMultiplicity(const Standard_Integer KnotIndex, const Standard_Integer Mult, const Standard_Integer Degree, const Standard_Boolean Periodic, const TColgp_Array1OfPnt & Poles, const TColStd_Array1OfReal * Weights, const TColStd_Array1OfReal & Knots, const TColStd_Array1OfInteger & Mults, TColgp_Array1OfPnt & NewPoles, TColStd_Array1OfReal * NewWeights);

		/****** BSplCLib::RaiseMultiplicity ******/
		/****** md5 signature: 7b68620f8f079008bff0083627e99357 ******/
		%feature("compactdefaultargs") RaiseMultiplicity;
		%feature("autodoc", "
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

Return
-------
None

Description
-----------
Raise the multiplicity of knot to <UMult>. //! The new control points are returned. Knots and Mults are not updated.
") RaiseMultiplicity;
		static void RaiseMultiplicity(const Standard_Integer KnotIndex, const Standard_Integer Mult, const Standard_Integer Degree, const Standard_Boolean Periodic, const TColgp_Array1OfPnt2d & Poles, const TColStd_Array1OfReal * Weights, const TColStd_Array1OfReal & Knots, const TColStd_Array1OfInteger & Mults, TColgp_Array1OfPnt2d & NewPoles, TColStd_Array1OfReal * NewWeights);

		/****** BSplCLib::RemoveKnot ******/
		/****** md5 signature: f160cdfd0c6e8cbbd50655f8a175def1 ******/
		%feature("compactdefaultargs") RemoveKnot;
		%feature("autodoc", "
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

Return
-------
bool

Description
-----------
No available documentation.
") RemoveKnot;
		static Standard_Boolean RemoveKnot(const Standard_Integer Index, const Standard_Integer Mult, const Standard_Integer Degree, const Standard_Boolean Periodic, const Standard_Integer Dimension, const TColStd_Array1OfReal & Poles, const TColStd_Array1OfReal & Knots, const TColStd_Array1OfInteger & Mults, TColStd_Array1OfReal & NewPoles, TColStd_Array1OfReal & NewKnots, TColStd_Array1OfInteger & NewMults, const Standard_Real Tolerance);

		/****** BSplCLib::RemoveKnot ******/
		/****** md5 signature: 34bd46c8df0be561677c850a078d12f8 ******/
		%feature("compactdefaultargs") RemoveKnot;
		%feature("autodoc", "
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

Return
-------
bool

Description
-----------
No available documentation.
") RemoveKnot;
		static Standard_Boolean RemoveKnot(const Standard_Integer Index, const Standard_Integer Mult, const Standard_Integer Degree, const Standard_Boolean Periodic, const TColgp_Array1OfPnt & Poles, const TColStd_Array1OfReal * Weights, const TColStd_Array1OfReal & Knots, const TColStd_Array1OfInteger & Mults, TColgp_Array1OfPnt & NewPoles, TColStd_Array1OfReal * NewWeights, TColStd_Array1OfReal & NewKnots, TColStd_Array1OfInteger & NewMults, const Standard_Real Tolerance);

		/****** BSplCLib::RemoveKnot ******/
		/****** md5 signature: e71867ea0e8715093b5a4551f8fb6194 ******/
		%feature("compactdefaultargs") RemoveKnot;
		%feature("autodoc", "
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

Return
-------
bool

Description
-----------
Decrement the multiplicity of <Knots(Index)> to <Mult>. If <Mult> is null the knot is removed. //! As there are two ways to compute the new poles the midlle will be used as long as the distance is lower than Tolerance. //! If a distance is bigger than tolerance the methods returns False and the new arrays are not modified. //! A low tolerance can be used to test if the knot can be removed without modifying the curve. //! A high tolerance can be used to 'smooth' the curve.
") RemoveKnot;
		static Standard_Boolean RemoveKnot(const Standard_Integer Index, const Standard_Integer Mult, const Standard_Integer Degree, const Standard_Boolean Periodic, const TColgp_Array1OfPnt2d & Poles, const TColStd_Array1OfReal * Weights, const TColStd_Array1OfReal & Knots, const TColStd_Array1OfInteger & Mults, TColgp_Array1OfPnt2d & NewPoles, TColStd_Array1OfReal * NewWeights, TColStd_Array1OfReal & NewKnots, TColStd_Array1OfInteger & NewMults, const Standard_Real Tolerance);

		/****** BSplCLib::Reparametrize ******/
		/****** md5 signature: bbbfa1d8d52d7c2e9f0e7340e008bb30 ******/
		%feature("compactdefaultargs") Reparametrize;
		%feature("autodoc", "
Parameters
----------
U1: float
U2: float
Knots: TColStd_Array1OfReal

Return
-------
None

Description
-----------
Reparametrizes a B-spline curve to [U1, U2]. The knot values are recomputed such that Knots (Lower) = U1 and Knots (Upper) = U2 but the knot form is not modified. Warnings: In the array Knots the values must be in ascending order. U1 must not be equal to U2 to avoid division by zero.
") Reparametrize;
		static void Reparametrize(const Standard_Real U1, const Standard_Real U2, TColStd_Array1OfReal & Knots);

		/****** BSplCLib::Resolution ******/
		/****** md5 signature: de69ea6ca10e0ce95eff768774f1d362 ******/
		%feature("compactdefaultargs") Resolution;
		%feature("autodoc", "
Parameters
----------
ArrayDimension: int
NumPoles: int
Weights: TColStd_Array1OfReal *
FlatKnots: TColStd_Array1OfReal
Degree: int
Tolerance3D: float

Return
-------
PolesArray: float
UTolerance: float

Description
-----------
given a tolerance in 3D space returns a tolerance in U parameter space such that all u1 and u0 in the domain of the curve f(u) | u1 - u0 | < UTolerance and we have |f (u1) - f (u0)| < Tolerance3D.
") Resolution;
		static void Resolution(Standard_Real &OutValue, const Standard_Integer ArrayDimension, const Standard_Integer NumPoles, const TColStd_Array1OfReal * Weights, const TColStd_Array1OfReal & FlatKnots, const Standard_Integer Degree, const Standard_Real Tolerance3D, Standard_Real &OutValue);

		/****** BSplCLib::Resolution ******/
		/****** md5 signature: fd89dc61e5eb0f58d4d83427f246b2e2 ******/
		%feature("compactdefaultargs") Resolution;
		%feature("autodoc", "
Parameters
----------
Poles: TColgp_Array1OfPnt
Weights: TColStd_Array1OfReal *
NumPoles: int
FlatKnots: TColStd_Array1OfReal
Degree: int
Tolerance3D: float

Return
-------
UTolerance: float

Description
-----------
given a tolerance in 3D space returns a tolerance in U parameter space such that all u1 and u0 in the domain of the curve f(u) | u1 - u0 | < UTolerance and we have |f (u1) - f (u0)| < Tolerance3D.
") Resolution;
		static void Resolution(const TColgp_Array1OfPnt & Poles, const TColStd_Array1OfReal * Weights, const Standard_Integer NumPoles, const TColStd_Array1OfReal & FlatKnots, const Standard_Integer Degree, const Standard_Real Tolerance3D, Standard_Real &OutValue);

		/****** BSplCLib::Resolution ******/
		/****** md5 signature: 0c2d8874908243eb1c48ec7d26f9316f ******/
		%feature("compactdefaultargs") Resolution;
		%feature("autodoc", "
Parameters
----------
Poles: TColgp_Array1OfPnt2d
Weights: TColStd_Array1OfReal *
NumPoles: int
FlatKnots: TColStd_Array1OfReal
Degree: int
Tolerance3D: float

Return
-------
UTolerance: float

Description
-----------
given a tolerance in 3D space returns a tolerance in U parameter space such that all u1 and u0 in the domain of the curve f(u) | u1 - u0 | < UTolerance and we have |f (u1) - f (u0)| < Tolerance3D.
") Resolution;
		static void Resolution(const TColgp_Array1OfPnt2d & Poles, const TColStd_Array1OfReal * Weights, const Standard_Integer NumPoles, const TColStd_Array1OfReal & FlatKnots, const Standard_Integer Degree, const Standard_Real Tolerance3D, Standard_Real &OutValue);

		/****** BSplCLib::Reverse ******/
		/****** md5 signature: a57ac0e6f5478fd607e57b2d503d32c8 ******/
		%feature("compactdefaultargs") Reverse;
		%feature("autodoc", "
Parameters
----------
Knots: TColStd_Array1OfReal

Return
-------
None

Description
-----------
Reverses the array knots to become the knots sequence of the reversed curve.
") Reverse;
		static void Reverse(TColStd_Array1OfReal & Knots);

		/****** BSplCLib::Reverse ******/
		/****** md5 signature: c2e64bc5830d7c8e0576d2e63c1563a5 ******/
		%feature("compactdefaultargs") Reverse;
		%feature("autodoc", "
Parameters
----------
Mults: TColStd_Array1OfInteger

Return
-------
None

Description
-----------
Reverses the array of multiplicities.
") Reverse;
		static void Reverse(TColStd_Array1OfInteger & Mults);

		/****** BSplCLib::Reverse ******/
		/****** md5 signature: 69e198037b66038a66f7df106e5282f2 ******/
		%feature("compactdefaultargs") Reverse;
		%feature("autodoc", "
Parameters
----------
Poles: TColgp_Array1OfPnt
Last: int

Return
-------
None

Description
-----------
Reverses the array of poles. Last is the index of the new first pole. On a non periodic curve last is Poles.Upper(). On a periodic curve last is //! (number of flat knots - degree - 1) //! or //! (sum of multiplicities(but for the last) + degree - 1).
") Reverse;
		static void Reverse(TColgp_Array1OfPnt & Poles, const Standard_Integer Last);

		/****** BSplCLib::Reverse ******/
		/****** md5 signature: beac5e4762c742fc3695999616889a86 ******/
		%feature("compactdefaultargs") Reverse;
		%feature("autodoc", "
Parameters
----------
Poles: TColgp_Array1OfPnt2d
Last: int

Return
-------
None

Description
-----------
Reverses the array of poles.
") Reverse;
		static void Reverse(TColgp_Array1OfPnt2d & Poles, const Standard_Integer Last);

		/****** BSplCLib::Reverse ******/
		/****** md5 signature: fd8b3bb4d9426a07eb99e7597647bc3c ******/
		%feature("compactdefaultargs") Reverse;
		%feature("autodoc", "
Parameters
----------
Weights: TColStd_Array1OfReal
Last: int

Return
-------
None

Description
-----------
Reverses the array of poles.
") Reverse;
		static void Reverse(TColStd_Array1OfReal & Weights, const Standard_Integer Last);

		/****** BSplCLib::SolveBandedSystem ******/
		/****** md5 signature: 435953bec122c49c9cda2b95930416f9 ******/
		%feature("compactdefaultargs") SolveBandedSystem;
		%feature("autodoc", "
Parameters
----------
Matrix: math_Matrix
UpperBandWidth: int
LowerBandWidth: int
ArrayDimension: int

Return
-------
Array: float

Description
-----------
This solves the system Matrix.X = B with when Matrix is factored in LU form The Array is an seen as an Array[1..N][1..ArrayDimension] with N = the rank of the matrix Matrix. The result is stored in Array when each coordinate is solved that is B is the array whose values are B[i] = Array[i][p] for each p in 1..ArrayDimension.
") SolveBandedSystem;
		static Standard_Integer SolveBandedSystem(const math_Matrix & Matrix, const Standard_Integer UpperBandWidth, const Standard_Integer LowerBandWidth, const Standard_Integer ArrayDimension, Standard_Real &OutValue);

		/****** BSplCLib::SolveBandedSystem ******/
		/****** md5 signature: 55bf803527f642f5424d89c2b6d60155 ******/
		%feature("compactdefaultargs") SolveBandedSystem;
		%feature("autodoc", "
Parameters
----------
Matrix: math_Matrix
UpperBandWidth: int
LowerBandWidth: int
Array: TColgp_Array1OfPnt2d

Return
-------
int

Description
-----------
This solves the system Matrix.X = B with when Matrix is factored in LU form The Array has the length of the rank of the matrix Matrix. The result is stored in Array when each coordinate is solved that is B is the array whose values are B[i] = Array[i][p] for each p in 1..ArrayDimension.
") SolveBandedSystem;
		static Standard_Integer SolveBandedSystem(const math_Matrix & Matrix, const Standard_Integer UpperBandWidth, const Standard_Integer LowerBandWidth, TColgp_Array1OfPnt2d & Array);

		/****** BSplCLib::SolveBandedSystem ******/
		/****** md5 signature: cedb120aa0a87996dc1fe431f2a79558 ******/
		%feature("compactdefaultargs") SolveBandedSystem;
		%feature("autodoc", "
Parameters
----------
Matrix: math_Matrix
UpperBandWidth: int
LowerBandWidth: int
Array: TColgp_Array1OfPnt

Return
-------
int

Description
-----------
This solves the system Matrix.X = B with when Matrix is factored in LU form The Array has the length of the rank of the matrix Matrix. The result is stored in Array when each coordinate is solved that is B is the array whose values are B[i] = Array[i][p] for each p in 1..ArrayDimension.
") SolveBandedSystem;
		static Standard_Integer SolveBandedSystem(const math_Matrix & Matrix, const Standard_Integer UpperBandWidth, const Standard_Integer LowerBandWidth, TColgp_Array1OfPnt & Array);

		/****** BSplCLib::SolveBandedSystem ******/
		/****** md5 signature: 5571a92dbcd003f3cd215893f9c76410 ******/
		%feature("compactdefaultargs") SolveBandedSystem;
		%feature("autodoc", "
Parameters
----------
Matrix: math_Matrix
UpperBandWidth: int
LowerBandWidth: int
HomogenousFlag: bool
ArrayDimension: int

Return
-------
Array: float
Weights: float

Description
-----------
No available documentation.
") SolveBandedSystem;
		static Standard_Integer SolveBandedSystem(const math_Matrix & Matrix, const Standard_Integer UpperBandWidth, const Standard_Integer LowerBandWidth, const Standard_Boolean HomogenousFlag, const Standard_Integer ArrayDimension, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** BSplCLib::SolveBandedSystem ******/
		/****** md5 signature: c3b54f9241e23af58a316990c4c05c84 ******/
		%feature("compactdefaultargs") SolveBandedSystem;
		%feature("autodoc", "
Parameters
----------
Matrix: math_Matrix
UpperBandWidth: int
LowerBandWidth: int
HomogenousFlag: bool
Array: TColgp_Array1OfPnt2d
Weights: TColStd_Array1OfReal

Return
-------
int

Description
-----------
This solves the system Matrix.X = B with when Matrix is factored in LU form The Array is an seen as an Array[1..N][1..ArrayDimension] with N = the rank of the matrix Matrix. The result is stored in Array when each coordinate is solved that is B is the array whose values are B[i] = Array[i][p] for each p in 1..ArrayDimension. If HomogeneousFlag == 0 the Poles are multiplied by the Weights upon Entry and once interpolation is carried over the result of the poles are divided by the result of the interpolation of the weights. Otherwise if HomogenousFlag == 1 the Poles and Weights are treated homogeneously that is that those are interpolated as they are and result is returned without division by the interpolated weights.
") SolveBandedSystem;
		static Standard_Integer SolveBandedSystem(const math_Matrix & Matrix, const Standard_Integer UpperBandWidth, const Standard_Integer LowerBandWidth, const Standard_Boolean HomogenousFlag, TColgp_Array1OfPnt2d & Array, TColStd_Array1OfReal & Weights);

		/****** BSplCLib::SolveBandedSystem ******/
		/****** md5 signature: bf46510a32c49fb829ee5209d1191b72 ******/
		%feature("compactdefaultargs") SolveBandedSystem;
		%feature("autodoc", "
Parameters
----------
Matrix: math_Matrix
UpperBandWidth: int
LowerBandWidth: int
HomogeneousFlag: bool
Array: TColgp_Array1OfPnt
Weights: TColStd_Array1OfReal

Return
-------
int

Description
-----------
This solves the system Matrix.X = B with when Matrix is factored in LU form The Array is an seen as an Array[1..N][1..ArrayDimension] with N = the rank of the matrix Matrix. The result is stored in Array when each coordinate is solved that is B is the array whose values are B[i] = Array[i][p] for each p in 1..ArrayDimension If HomogeneousFlag == 0 the Poles are multiplied by the Weights upon Entry and once interpolation is carried over the result of the poles are divided by the result of the interpolation of the weights. Otherwise if HomogenousFlag == 1 the Poles and Weights are treated homogeneously that is that those are interpolated as they are and result is returned without division by the interpolated weights.
") SolveBandedSystem;
		static Standard_Integer SolveBandedSystem(const math_Matrix & Matrix, const Standard_Integer UpperBandWidth, const Standard_Integer LowerBandWidth, const Standard_Boolean HomogeneousFlag, TColgp_Array1OfPnt & Array, TColStd_Array1OfReal & Weights);

		/****** BSplCLib::TangExtendToConstraint ******/
		/****** md5 signature: b7146095fa28ab3e0edbfadc067c542f ******/
		%feature("compactdefaultargs") TangExtendToConstraint;
		%feature("autodoc", "
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

Return
-------
Poles: float
NbPolesResult: int
NbKnotsRsult: int
KnotsResult: float
PolesResult: float

Description
-----------
Extend a BSpline nD using the tangency map <C1Coefficient> is the coefficient of reparametrisation <Continuity> must be equal to 1, 2 or 3. <Degree> must be greater or equal than <Continuity> + 1. //! Warning: <KnotsResult> and <PolesResult> must be dimensioned properly.
") TangExtendToConstraint;
		static void TangExtendToConstraint(const TColStd_Array1OfReal & FlatKnots, const Standard_Real C1Coefficient, const Standard_Integer NumPoles, Standard_Real &OutValue, const Standard_Integer Dimension, const Standard_Integer Degree, const TColStd_Array1OfReal & ConstraintPoint, const Standard_Integer Continuity, const Standard_Boolean After, Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** BSplCLib::Trimming ******/
		/****** md5 signature: f2180a9ffc628aafc10d57997f0ab25d ******/
		%feature("compactdefaultargs") Trimming;
		%feature("autodoc", "
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

Return
-------
None

Description
-----------
No available documentation.
") Trimming;
		static void Trimming(const Standard_Integer Degree, const Standard_Boolean Periodic, const Standard_Integer Dimension, const TColStd_Array1OfReal & Knots, const TColStd_Array1OfInteger & Mults, const TColStd_Array1OfReal & Poles, const Standard_Real U1, const Standard_Real U2, TColStd_Array1OfReal & NewKnots, TColStd_Array1OfInteger & NewMults, TColStd_Array1OfReal & NewPoles);

		/****** BSplCLib::Trimming ******/
		/****** md5 signature: 9fe28b7ad9be71c6a1af6e80c38e8036 ******/
		%feature("compactdefaultargs") Trimming;
		%feature("autodoc", "
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

Return
-------
None

Description
-----------
No available documentation.
") Trimming;
		static void Trimming(const Standard_Integer Degree, const Standard_Boolean Periodic, const TColStd_Array1OfReal & Knots, const TColStd_Array1OfInteger & Mults, const TColgp_Array1OfPnt & Poles, const TColStd_Array1OfReal * Weights, const Standard_Real U1, const Standard_Real U2, TColStd_Array1OfReal & NewKnots, TColStd_Array1OfInteger & NewMults, TColgp_Array1OfPnt & NewPoles, TColStd_Array1OfReal * NewWeights);

		/****** BSplCLib::Trimming ******/
		/****** md5 signature: 81cf27d83e373b0ace7635f2fcda30fb ******/
		%feature("compactdefaultargs") Trimming;
		%feature("autodoc", "
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

Return
-------
None

Description
-----------
No available documentation.
") Trimming;
		static void Trimming(const Standard_Integer Degree, const Standard_Boolean Periodic, const TColStd_Array1OfReal & Knots, const TColStd_Array1OfInteger & Mults, const TColgp_Array1OfPnt2d & Poles, const TColStd_Array1OfReal * Weights, const Standard_Real U1, const Standard_Real U2, TColStd_Array1OfReal & NewKnots, TColStd_Array1OfInteger & NewMults, TColgp_Array1OfPnt2d & NewPoles, TColStd_Array1OfReal * NewWeights);

		/****** BSplCLib::Unperiodize ******/
		/****** md5 signature: abc1100a37dd462dd6a37ec73c9525d8 ******/
		%feature("compactdefaultargs") Unperiodize;
		%feature("autodoc", "
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

Return
-------
None

Description
-----------
No available documentation.
") Unperiodize;
		static void Unperiodize(const Standard_Integer Degree, const Standard_Integer Dimension, const TColStd_Array1OfInteger & Mults, const TColStd_Array1OfReal & Knots, const TColStd_Array1OfReal & Poles, TColStd_Array1OfInteger & NewMults, TColStd_Array1OfReal & NewKnots, TColStd_Array1OfReal & NewPoles);

		/****** BSplCLib::Unperiodize ******/
		/****** md5 signature: d1992345708ea61d4ff0e42760ddfbc4 ******/
		%feature("compactdefaultargs") Unperiodize;
		%feature("autodoc", "
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

Return
-------
None

Description
-----------
No available documentation.
") Unperiodize;
		static void Unperiodize(const Standard_Integer Degree, const TColStd_Array1OfInteger & Mults, const TColStd_Array1OfReal & Knots, const TColgp_Array1OfPnt & Poles, const TColStd_Array1OfReal * Weights, TColStd_Array1OfInteger & NewMults, TColStd_Array1OfReal & NewKnots, TColgp_Array1OfPnt & NewPoles, TColStd_Array1OfReal * NewWeights);

		/****** BSplCLib::Unperiodize ******/
		/****** md5 signature: abc855f8a13aa28d61372d2f6e249d88 ******/
		%feature("compactdefaultargs") Unperiodize;
		%feature("autodoc", "
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

Return
-------
None

Description
-----------
No available documentation.
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
		/****** BSplCLib_Cache::BSplCLib_Cache ******/
		/****** md5 signature: 1ec50ce3ef0f91a1b9421df2d746932f ******/
		%feature("compactdefaultargs") BSplCLib_Cache;
		%feature("autodoc", "
Parameters
----------
theDegree: int
thePeriodic: bool
theFlatKnots: TColStd_Array1OfReal
thePoles2d: TColgp_Array1OfPnt2d
theWeights: TColStd_Array1OfReal * (optional, default to NULL)

Return
-------
None

Description
-----------
Constructor, prepares data structures for caching values on a 2d curve. \param theDegree degree of the curve \param thePeriodic identify whether the curve is periodic \param theFlatKnots knots of Bezier/B-spline curve (with repetitions) \param thePoles2d array of poles of 2D curve \param theWeights array of weights of corresponding poles.
") BSplCLib_Cache;
		 BSplCLib_Cache(const Standard_Integer & theDegree, const Standard_Boolean & thePeriodic, const TColStd_Array1OfReal & theFlatKnots, const TColgp_Array1OfPnt2d & thePoles2d, const TColStd_Array1OfReal * theWeights = NULL);

		/****** BSplCLib_Cache::BSplCLib_Cache ******/
		/****** md5 signature: 112e58d863cf27a409215f9f9a35ff27 ******/
		%feature("compactdefaultargs") BSplCLib_Cache;
		%feature("autodoc", "
Parameters
----------
theDegree: int
thePeriodic: bool
theFlatKnots: TColStd_Array1OfReal
thePoles: TColgp_Array1OfPnt
theWeights: TColStd_Array1OfReal * (optional, default to NULL)

Return
-------
None

Description
-----------
Constructor, prepares data structures for caching values on a 3d curve. \param theDegree degree of the curve \param thePeriodic identify whether the curve is periodic \param theFlatKnots knots of Bezier/B-spline curve (with repetitions) \param thePoles array of poles of 3D curve \param theWeights array of weights of corresponding poles.
") BSplCLib_Cache;
		 BSplCLib_Cache(const Standard_Integer & theDegree, const Standard_Boolean & thePeriodic, const TColStd_Array1OfReal & theFlatKnots, const TColgp_Array1OfPnt & thePoles, const TColStd_Array1OfReal * theWeights = NULL);

		/****** BSplCLib_Cache::BuildCache ******/
		/****** md5 signature: 004becef4793ac2147bbccc9f21ed48e ******/
		%feature("compactdefaultargs") BuildCache;
		%feature("autodoc", "
Parameters
----------
theParameter: float
theFlatKnots: TColStd_Array1OfReal
thePoles2d: TColgp_Array1OfPnt2d
theWeights: TColStd_Array1OfReal *

Return
-------
None

Description
-----------
Recomputes the cache data for 2D curves. Does not verify validity of the cache \param theParameter the value on the knot's axis to identify the span \param theFlatKnots knots of Bezier/B-spline curve (with repetitions) \param thePoles2d array of poles of 2D curve \param theWeights array of weights of corresponding poles.
") BuildCache;
		void BuildCache(const Standard_Real & theParameter, const TColStd_Array1OfReal & theFlatKnots, const TColgp_Array1OfPnt2d & thePoles2d, const TColStd_Array1OfReal * theWeights);

		/****** BSplCLib_Cache::BuildCache ******/
		/****** md5 signature: 708c8206d06c2954f982bc24a07bbc07 ******/
		%feature("compactdefaultargs") BuildCache;
		%feature("autodoc", "
Parameters
----------
theParameter: float
theFlatKnots: TColStd_Array1OfReal
thePoles: TColgp_Array1OfPnt
theWeights: TColStd_Array1OfReal * (optional, default to NULL)

Return
-------
None

Description
-----------
Recomputes the cache data for 3D curves. Does not verify validity of the cache \param theParameter the value on the knot's axis to identify the span \param theFlatKnots knots of Bezier/B-spline curve (with repetitions) \param thePoles array of poles of 3D curve \param theWeights array of weights of corresponding poles.
") BuildCache;
		void BuildCache(const Standard_Real & theParameter, const TColStd_Array1OfReal & theFlatKnots, const TColgp_Array1OfPnt & thePoles, const TColStd_Array1OfReal * theWeights = NULL);

		/****** BSplCLib_Cache::D0 ******/
		/****** md5 signature: 821844347e34610caaa0b5bbfa0cf4d7 ******/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "
Parameters
----------
theParameter: float
thePoint: gp_Pnt2d

Return
-------
None

Description
-----------
Calculates the point on the curve in the specified parameter \param[in] theParameter parameter of calculation of the value \param[out] thePoint the result of calculation (the point on the curve).
") D0;
		void D0(const Standard_Real & theParameter, gp_Pnt2d & thePoint);

		/****** BSplCLib_Cache::D0 ******/
		/****** md5 signature: 4aeb2d0857a7db45a96aa1fec77d5445 ******/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "
Parameters
----------
theParameter: float
thePoint: gp_Pnt

Return
-------
None

Description
-----------
No available documentation.
") D0;
		void D0(const Standard_Real & theParameter, gp_Pnt & thePoint);

		/****** BSplCLib_Cache::D1 ******/
		/****** md5 signature: 1c2fb9815cecbaddf6ab913e1725d597 ******/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "
Parameters
----------
theParameter: float
thePoint: gp_Pnt2d
theTangent: gp_Vec2d

Return
-------
None

Description
-----------
Calculates the point on the curve and its first derivative in the specified parameter \param[in] theParameter parameter of calculation of the value \param[out] thePoint the result of calculation (the point on the curve) \param[out] theTangent tangent vector (first derivatives) for the curve in the calculated point.
") D1;
		void D1(const Standard_Real & theParameter, gp_Pnt2d & thePoint, gp_Vec2d & theTangent);

		/****** BSplCLib_Cache::D1 ******/
		/****** md5 signature: 9162e0f68e80a2c7ce80aafd532c64cb ******/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "
Parameters
----------
theParameter: float
thePoint: gp_Pnt
theTangent: gp_Vec

Return
-------
None

Description
-----------
No available documentation.
") D1;
		void D1(const Standard_Real & theParameter, gp_Pnt & thePoint, gp_Vec & theTangent);

		/****** BSplCLib_Cache::D2 ******/
		/****** md5 signature: cde9b4ade9c2395288cb140e226b4245 ******/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "
Parameters
----------
theParameter: float
thePoint: gp_Pnt2d
theTangent: gp_Vec2d
theCurvature: gp_Vec2d

Return
-------
None

Description
-----------
Calculates the point on the curve and two derivatives in the specified parameter \param[in] theParameter parameter of calculation of the value \param[out] thePoint the result of calculation (the point on the curve) \param[out] theTangent tangent vector (1st derivatives) for the curve in the calculated point \param[out] theCurvature curvature vector (2nd derivatives) for the curve in the calculated point.
") D2;
		void D2(const Standard_Real & theParameter, gp_Pnt2d & thePoint, gp_Vec2d & theTangent, gp_Vec2d & theCurvature);

		/****** BSplCLib_Cache::D2 ******/
		/****** md5 signature: 096890fee85d22526ec280b33e9b01d0 ******/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "
Parameters
----------
theParameter: float
thePoint: gp_Pnt
theTangent: gp_Vec
theCurvature: gp_Vec

Return
-------
None

Description
-----------
No available documentation.
") D2;
		void D2(const Standard_Real & theParameter, gp_Pnt & thePoint, gp_Vec & theTangent, gp_Vec & theCurvature);

		/****** BSplCLib_Cache::D3 ******/
		/****** md5 signature: 2966e3bc0512076dd282c4c044fbb4ce ******/
		%feature("compactdefaultargs") D3;
		%feature("autodoc", "
Parameters
----------
theParameter: float
thePoint: gp_Pnt2d
theTangent: gp_Vec2d
theCurvature: gp_Vec2d
theTorsion: gp_Vec2d

Return
-------
None

Description
-----------
Calculates the point on the curve and three derivatives in the specified parameter \param[in] theParameter parameter of calculation of the value \param[out] thePoint the result of calculation (the point on the curve) \param[out] theTangent tangent vector (1st derivatives) for the curve in the calculated point \param[out] theCurvature curvature vector (2nd derivatives) for the curve in the calculated point \param[out] theTorsion second curvature vector (3rd derivatives) for the curve in the calculated point.
") D3;
		void D3(const Standard_Real & theParameter, gp_Pnt2d & thePoint, gp_Vec2d & theTangent, gp_Vec2d & theCurvature, gp_Vec2d & theTorsion);

		/****** BSplCLib_Cache::D3 ******/
		/****** md5 signature: 7d9b71e69ccb4be4fe8edf3517a87d48 ******/
		%feature("compactdefaultargs") D3;
		%feature("autodoc", "
Parameters
----------
theParameter: float
thePoint: gp_Pnt
theTangent: gp_Vec
theCurvature: gp_Vec
theTorsion: gp_Vec

Return
-------
None

Description
-----------
No available documentation.
") D3;
		void D3(const Standard_Real & theParameter, gp_Pnt & thePoint, gp_Vec & theTangent, gp_Vec & theCurvature, gp_Vec & theTorsion);

		/****** BSplCLib_Cache::IsCacheValid ******/
		/****** md5 signature: 210fe9378d91587e36bde7d36f9a15e1 ******/
		%feature("compactdefaultargs") IsCacheValid;
		%feature("autodoc", "
Parameters
----------
theParameter: float

Return
-------
bool

Description
-----------
Verifies validity of the cache using flat parameter of the point \param theParameter parameter of the point placed in the span.
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
		/****** BSplCLib_CacheParams::BSplCLib_CacheParams ******/
		/****** md5 signature: 9dc6d39f5a0f6a64d0c5f2ef90fb4329 ******/
		%feature("compactdefaultargs") BSplCLib_CacheParams;
		%feature("autodoc", "
Parameters
----------
theDegree: int
thePeriodic: bool
theFlatKnots: TColStd_Array1OfReal

Return
-------
None

Description
-----------
Constructor, prepares data structures for caching. \param theDegree degree of the B-spline (or Bezier) \param thePeriodic identify whether the B-spline is periodic \param theFlatKnots knots of Bezier / B-spline parameterization.
") BSplCLib_CacheParams;
		 BSplCLib_CacheParams(Standard_Integer theDegree, Standard_Boolean thePeriodic, const TColStd_Array1OfReal & theFlatKnots);

		/****** BSplCLib_CacheParams::IsCacheValid ******/
		/****** md5 signature: 2640e4ed5e0bdb2780fab01a6614a67a ******/
		%feature("compactdefaultargs") IsCacheValid;
		%feature("autodoc", "
Parameters
----------
theParameter: float

Return
-------
bool

Description
-----------
Verifies validity of the cache using flat parameter of the point \param theParameter parameter of the point placed in the span.
") IsCacheValid;
		Standard_Boolean IsCacheValid(Standard_Real theParameter);

		/****** BSplCLib_CacheParams::LocateParameter ******/
		/****** md5 signature: 9d0335be5e67d75027256e3751327542 ******/
		%feature("compactdefaultargs") LocateParameter;
		%feature("autodoc", "
Parameters
----------
theFlatKnots: TColStd_Array1OfReal

Return
-------
theParameter: float

Description
-----------
Computes span for the specified parameter \param theParameter parameter of the point placed in the span \param theFlatKnots knots of Bezier / B-spline parameterization.
") LocateParameter;
		void LocateParameter(Standard_Real &OutValue, const TColStd_Array1OfReal & theFlatKnots);

		/****** BSplCLib_CacheParams::PeriodicNormalization ******/
		/****** md5 signature: f0c31ac0ad331d040f83cb12652abaed ******/
		%feature("compactdefaultargs") PeriodicNormalization;
		%feature("autodoc", "
Parameters
----------
theParameter: float

Return
-------
float

Description
-----------
Normalizes the parameter for periodic B-splines \param theParameter the value to be normalized into the knots array.
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
%nodefaultctor BSplCLib_EvaluatorFunction;
class BSplCLib_EvaluatorFunction {
	public:
		/****** BSplCLib_EvaluatorFunction::Evaluate ******/
		/****** md5 signature: 6d18f8c62d991decc4c1a3aca376d7bf ******/
		%feature("compactdefaultargs") Evaluate;
		%feature("autodoc", "
Parameters
----------
theDerivativeRequest: int
theStartEnd: float *
theParameter: float

Return
-------
theResult: float
theErrorCode: int

Description
-----------
Function evaluation method to be defined by descendant.
") Evaluate;
		virtual void Evaluate(const Standard_Integer theDerivativeRequest, const Standard_Real * theStartEnd, const Standard_Real theParameter, Standard_Real &OutValue, Standard_Integer &OutValue);

};


%extend BSplCLib_EvaluatorFunction {
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
def bsplclib_AntiBoorScheme(*args):
	return bsplclib.AntiBoorScheme(*args)

@deprecated
def bsplclib_Bohm(*args):
	return bsplclib.Bohm(*args)

@deprecated
def bsplclib_BoorIndex(*args):
	return bsplclib.BoorIndex(*args)

@deprecated
def bsplclib_BoorScheme(*args):
	return bsplclib.BoorScheme(*args)

@deprecated
def bsplclib_BuildBSpMatrix(*args):
	return bsplclib.BuildBSpMatrix(*args)

@deprecated
def bsplclib_BuildBoor(*args):
	return bsplclib.BuildBoor(*args)

@deprecated
def bsplclib_BuildCache(*args):
	return bsplclib.BuildCache(*args)

@deprecated
def bsplclib_BuildCache(*args):
	return bsplclib.BuildCache(*args)

@deprecated
def bsplclib_BuildCache(*args):
	return bsplclib.BuildCache(*args)

@deprecated
def bsplclib_BuildCache(*args):
	return bsplclib.BuildCache(*args)

@deprecated
def bsplclib_BuildEval(*args):
	return bsplclib.BuildEval(*args)

@deprecated
def bsplclib_BuildEval(*args):
	return bsplclib.BuildEval(*args)

@deprecated
def bsplclib_BuildEval(*args):
	return bsplclib.BuildEval(*args)

@deprecated
def bsplclib_BuildKnots(*args):
	return bsplclib.BuildKnots(*args)

@deprecated
def bsplclib_BuildSchoenbergPoints(*args):
	return bsplclib.BuildSchoenbergPoints(*args)

@deprecated
def bsplclib_CacheD0(*args):
	return bsplclib.CacheD0(*args)

@deprecated
def bsplclib_CacheD0(*args):
	return bsplclib.CacheD0(*args)

@deprecated
def bsplclib_CacheD1(*args):
	return bsplclib.CacheD1(*args)

@deprecated
def bsplclib_CacheD1(*args):
	return bsplclib.CacheD1(*args)

@deprecated
def bsplclib_CacheD2(*args):
	return bsplclib.CacheD2(*args)

@deprecated
def bsplclib_CacheD2(*args):
	return bsplclib.CacheD2(*args)

@deprecated
def bsplclib_CacheD3(*args):
	return bsplclib.CacheD3(*args)

@deprecated
def bsplclib_CacheD3(*args):
	return bsplclib.CacheD3(*args)

@deprecated
def bsplclib_CoefsD0(*args):
	return bsplclib.CoefsD0(*args)

@deprecated
def bsplclib_CoefsD0(*args):
	return bsplclib.CoefsD0(*args)

@deprecated
def bsplclib_CoefsD1(*args):
	return bsplclib.CoefsD1(*args)

@deprecated
def bsplclib_CoefsD1(*args):
	return bsplclib.CoefsD1(*args)

@deprecated
def bsplclib_CoefsD2(*args):
	return bsplclib.CoefsD2(*args)

@deprecated
def bsplclib_CoefsD2(*args):
	return bsplclib.CoefsD2(*args)

@deprecated
def bsplclib_CoefsD3(*args):
	return bsplclib.CoefsD3(*args)

@deprecated
def bsplclib_CoefsD3(*args):
	return bsplclib.CoefsD3(*args)

@deprecated
def bsplclib_D0(*args):
	return bsplclib.D0(*args)

@deprecated
def bsplclib_D0(*args):
	return bsplclib.D0(*args)

@deprecated
def bsplclib_D0(*args):
	return bsplclib.D0(*args)

@deprecated
def bsplclib_D0(*args):
	return bsplclib.D0(*args)

@deprecated
def bsplclib_D0(*args):
	return bsplclib.D0(*args)

@deprecated
def bsplclib_D1(*args):
	return bsplclib.D1(*args)

@deprecated
def bsplclib_D1(*args):
	return bsplclib.D1(*args)

@deprecated
def bsplclib_D1(*args):
	return bsplclib.D1(*args)

@deprecated
def bsplclib_D1(*args):
	return bsplclib.D1(*args)

@deprecated
def bsplclib_D1(*args):
	return bsplclib.D1(*args)

@deprecated
def bsplclib_D2(*args):
	return bsplclib.D2(*args)

@deprecated
def bsplclib_D2(*args):
	return bsplclib.D2(*args)

@deprecated
def bsplclib_D2(*args):
	return bsplclib.D2(*args)

@deprecated
def bsplclib_D2(*args):
	return bsplclib.D2(*args)

@deprecated
def bsplclib_D2(*args):
	return bsplclib.D2(*args)

@deprecated
def bsplclib_D3(*args):
	return bsplclib.D3(*args)

@deprecated
def bsplclib_D3(*args):
	return bsplclib.D3(*args)

@deprecated
def bsplclib_D3(*args):
	return bsplclib.D3(*args)

@deprecated
def bsplclib_D3(*args):
	return bsplclib.D3(*args)

@deprecated
def bsplclib_D3(*args):
	return bsplclib.D3(*args)

@deprecated
def bsplclib_Derivative(*args):
	return bsplclib.Derivative(*args)

@deprecated
def bsplclib_Eval(*args):
	return bsplclib.Eval(*args)

@deprecated
def bsplclib_Eval(*args):
	return bsplclib.Eval(*args)

@deprecated
def bsplclib_Eval(*args):
	return bsplclib.Eval(*args)

@deprecated
def bsplclib_Eval(*args):
	return bsplclib.Eval(*args)

@deprecated
def bsplclib_Eval(*args):
	return bsplclib.Eval(*args)

@deprecated
def bsplclib_EvalBsplineBasis(*args):
	return bsplclib.EvalBsplineBasis(*args)

@deprecated
def bsplclib_FactorBandedMatrix(*args):
	return bsplclib.FactorBandedMatrix(*args)

@deprecated
def bsplclib_FirstUKnotIndex(*args):
	return bsplclib.FirstUKnotIndex(*args)

@deprecated
def bsplclib_FlatBezierKnots(*args):
	return bsplclib.FlatBezierKnots(*args)

@deprecated
def bsplclib_FlatIndex(*args):
	return bsplclib.FlatIndex(*args)

@deprecated
def bsplclib_FunctionMultiply(*args):
	return bsplclib.FunctionMultiply(*args)

@deprecated
def bsplclib_FunctionMultiply(*args):
	return bsplclib.FunctionMultiply(*args)

@deprecated
def bsplclib_FunctionMultiply(*args):
	return bsplclib.FunctionMultiply(*args)

@deprecated
def bsplclib_FunctionMultiply(*args):
	return bsplclib.FunctionMultiply(*args)

@deprecated
def bsplclib_FunctionReparameterise(*args):
	return bsplclib.FunctionReparameterise(*args)

@deprecated
def bsplclib_FunctionReparameterise(*args):
	return bsplclib.FunctionReparameterise(*args)

@deprecated
def bsplclib_FunctionReparameterise(*args):
	return bsplclib.FunctionReparameterise(*args)

@deprecated
def bsplclib_FunctionReparameterise(*args):
	return bsplclib.FunctionReparameterise(*args)

@deprecated
def bsplclib_GetPole(*args):
	return bsplclib.GetPole(*args)

@deprecated
def bsplclib_Hunt(*args):
	return bsplclib.Hunt(*args)

@deprecated
def bsplclib_IncreaseDegree(*args):
	return bsplclib.IncreaseDegree(*args)

@deprecated
def bsplclib_IncreaseDegree(*args):
	return bsplclib.IncreaseDegree(*args)

@deprecated
def bsplclib_IncreaseDegree(*args):
	return bsplclib.IncreaseDegree(*args)

@deprecated
def bsplclib_IncreaseDegree(*args):
	return bsplclib.IncreaseDegree(*args)

@deprecated
def bsplclib_IncreaseDegree(*args):
	return bsplclib.IncreaseDegree(*args)

@deprecated
def bsplclib_IncreaseDegreeCountKnots(*args):
	return bsplclib.IncreaseDegreeCountKnots(*args)

@deprecated
def bsplclib_InsertKnot(*args):
	return bsplclib.InsertKnot(*args)

@deprecated
def bsplclib_InsertKnot(*args):
	return bsplclib.InsertKnot(*args)

@deprecated
def bsplclib_InsertKnots(*args):
	return bsplclib.InsertKnots(*args)

@deprecated
def bsplclib_InsertKnots(*args):
	return bsplclib.InsertKnots(*args)

@deprecated
def bsplclib_InsertKnots(*args):
	return bsplclib.InsertKnots(*args)

@deprecated
def bsplclib_Interpolate(*args):
	return bsplclib.Interpolate(*args)

@deprecated
def bsplclib_Interpolate(*args):
	return bsplclib.Interpolate(*args)

@deprecated
def bsplclib_Interpolate(*args):
	return bsplclib.Interpolate(*args)

@deprecated
def bsplclib_Interpolate(*args):
	return bsplclib.Interpolate(*args)

@deprecated
def bsplclib_Interpolate(*args):
	return bsplclib.Interpolate(*args)

@deprecated
def bsplclib_Interpolate(*args):
	return bsplclib.Interpolate(*args)

@deprecated
def bsplclib_Intervals(*args):
	return bsplclib.Intervals(*args)

@deprecated
def bsplclib_IsRational(*args):
	return bsplclib.IsRational(*args)

@deprecated
def bsplclib_KnotAnalysis(*args):
	return bsplclib.KnotAnalysis(*args)

@deprecated
def bsplclib_KnotForm(*args):
	return bsplclib.KnotForm(*args)

@deprecated
def bsplclib_KnotSequence(*args):
	return bsplclib.KnotSequence(*args)

@deprecated
def bsplclib_KnotSequence(*args):
	return bsplclib.KnotSequence(*args)

@deprecated
def bsplclib_KnotSequenceLength(*args):
	return bsplclib.KnotSequenceLength(*args)

@deprecated
def bsplclib_Knots(*args):
	return bsplclib.Knots(*args)

@deprecated
def bsplclib_KnotsLength(*args):
	return bsplclib.KnotsLength(*args)

@deprecated
def bsplclib_LastUKnotIndex(*args):
	return bsplclib.LastUKnotIndex(*args)

@deprecated
def bsplclib_LocateParameter(*args):
	return bsplclib.LocateParameter(*args)

@deprecated
def bsplclib_LocateParameter(*args):
	return bsplclib.LocateParameter(*args)

@deprecated
def bsplclib_LocateParameter(*args):
	return bsplclib.LocateParameter(*args)

@deprecated
def bsplclib_MaxDegree(*args):
	return bsplclib.MaxDegree(*args)

@deprecated
def bsplclib_MaxKnotMult(*args):
	return bsplclib.MaxKnotMult(*args)

@deprecated
def bsplclib_MergeBSplineKnots(*args):
	return bsplclib.MergeBSplineKnots(*args)

@deprecated
def bsplclib_MinKnotMult(*args):
	return bsplclib.MinKnotMult(*args)

@deprecated
def bsplclib_MovePoint(*args):
	return bsplclib.MovePoint(*args)

@deprecated
def bsplclib_MovePoint(*args):
	return bsplclib.MovePoint(*args)

@deprecated
def bsplclib_MovePointAndTangent(*args):
	return bsplclib.MovePointAndTangent(*args)

@deprecated
def bsplclib_MovePointAndTangent(*args):
	return bsplclib.MovePointAndTangent(*args)

@deprecated
def bsplclib_MovePointAndTangent(*args):
	return bsplclib.MovePointAndTangent(*args)

@deprecated
def bsplclib_MultForm(*args):
	return bsplclib.MultForm(*args)

@deprecated
def bsplclib_NbPoles(*args):
	return bsplclib.NbPoles(*args)

@deprecated
def bsplclib_NoMults(*args):
	return bsplclib.NoMults(*args)

@deprecated
def bsplclib_NoWeights(*args):
	return bsplclib.NoWeights(*args)

@deprecated
def bsplclib_PoleIndex(*args):
	return bsplclib.PoleIndex(*args)

@deprecated
def bsplclib_PolesCoefficients(*args):
	return bsplclib.PolesCoefficients(*args)

@deprecated
def bsplclib_PolesCoefficients(*args):
	return bsplclib.PolesCoefficients(*args)

@deprecated
def bsplclib_PolesCoefficients(*args):
	return bsplclib.PolesCoefficients(*args)

@deprecated
def bsplclib_PolesCoefficients(*args):
	return bsplclib.PolesCoefficients(*args)

@deprecated
def bsplclib_PrepareInsertKnots(*args):
	return bsplclib.PrepareInsertKnots(*args)

@deprecated
def bsplclib_PrepareTrimming(*args):
	return bsplclib.PrepareTrimming(*args)

@deprecated
def bsplclib_PrepareUnperiodize(*args):
	return bsplclib.PrepareUnperiodize(*args)

@deprecated
def bsplclib_RaiseMultiplicity(*args):
	return bsplclib.RaiseMultiplicity(*args)

@deprecated
def bsplclib_RaiseMultiplicity(*args):
	return bsplclib.RaiseMultiplicity(*args)

@deprecated
def bsplclib_RemoveKnot(*args):
	return bsplclib.RemoveKnot(*args)

@deprecated
def bsplclib_RemoveKnot(*args):
	return bsplclib.RemoveKnot(*args)

@deprecated
def bsplclib_RemoveKnot(*args):
	return bsplclib.RemoveKnot(*args)

@deprecated
def bsplclib_Reparametrize(*args):
	return bsplclib.Reparametrize(*args)

@deprecated
def bsplclib_Resolution(*args):
	return bsplclib.Resolution(*args)

@deprecated
def bsplclib_Resolution(*args):
	return bsplclib.Resolution(*args)

@deprecated
def bsplclib_Resolution(*args):
	return bsplclib.Resolution(*args)

@deprecated
def bsplclib_Reverse(*args):
	return bsplclib.Reverse(*args)

@deprecated
def bsplclib_Reverse(*args):
	return bsplclib.Reverse(*args)

@deprecated
def bsplclib_Reverse(*args):
	return bsplclib.Reverse(*args)

@deprecated
def bsplclib_Reverse(*args):
	return bsplclib.Reverse(*args)

@deprecated
def bsplclib_Reverse(*args):
	return bsplclib.Reverse(*args)

@deprecated
def bsplclib_SolveBandedSystem(*args):
	return bsplclib.SolveBandedSystem(*args)

@deprecated
def bsplclib_SolveBandedSystem(*args):
	return bsplclib.SolveBandedSystem(*args)

@deprecated
def bsplclib_SolveBandedSystem(*args):
	return bsplclib.SolveBandedSystem(*args)

@deprecated
def bsplclib_SolveBandedSystem(*args):
	return bsplclib.SolveBandedSystem(*args)

@deprecated
def bsplclib_SolveBandedSystem(*args):
	return bsplclib.SolveBandedSystem(*args)

@deprecated
def bsplclib_SolveBandedSystem(*args):
	return bsplclib.SolveBandedSystem(*args)

@deprecated
def bsplclib_TangExtendToConstraint(*args):
	return bsplclib.TangExtendToConstraint(*args)

@deprecated
def bsplclib_Trimming(*args):
	return bsplclib.Trimming(*args)

@deprecated
def bsplclib_Trimming(*args):
	return bsplclib.Trimming(*args)

@deprecated
def bsplclib_Trimming(*args):
	return bsplclib.Trimming(*args)

@deprecated
def bsplclib_Unperiodize(*args):
	return bsplclib.Unperiodize(*args)

@deprecated
def bsplclib_Unperiodize(*args):
	return bsplclib.Unperiodize(*args)

@deprecated
def bsplclib_Unperiodize(*args):
	return bsplclib.Unperiodize(*args)

}
