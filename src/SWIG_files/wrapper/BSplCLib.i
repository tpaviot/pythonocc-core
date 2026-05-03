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
%define BSPLCLIBDOCSTRING
"BSplCLib module, see official documentation at
https://dev.opencascade.org/doc/occt-7.9.0/refman/html/package_bsplclib.html"
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
#include<math_module.hxx>
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
%import math.i
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
		/****** md5 signature: 317c01343e2896e4cc5d05b3fa628f1a ******/
		%feature("compactdefaultargs") AntiBoorScheme;
		%feature("autodoc", "
Parameters
----------
U: double
Degree: int
Dimension: int
Depth: int
Length: int
Tolerance: double

Return
-------
Knots: double
Poles: double

Description
-----------
Compute the content of Pole before the BoorScheme. This method is used to remove poles. //! U is the poles to remove, Knots should contains the knots of the curve after knot removal. //! The first and last poles do not change, the other poles are computed by averaging two possible values. The distance between the two possible poles is computed, if it is higher than <Tolerance> False is returned.
") AntiBoorScheme;
		static bool AntiBoorScheme(const double U, const int Degree, Standard_Real &OutValue, const int Dimension, Standard_Real &OutValue, const int Depth, const int Length, const double Tolerance);

		/****** BSplCLib::Bohm ******/
		/****** md5 signature: e096ea9a96a4dfe1e1b0217d0bce4003 ******/
		%feature("compactdefaultargs") Bohm;
		%feature("autodoc", "
Parameters
----------
U: double
Degree: int
N: int
Dimension: int

Return
-------
Knots: double
Poles: double

Description
-----------
Performs the Bohm Algorithm at parameter <U>. This algorithm computes the value and all the derivatives up to order N (N <= Degree). //! <Poles> is the original array of poles. //! The result in <Poles> is the value and the derivatives. Poles[0] is the value, Poles[Degree] is the last derivative.
") Bohm;
		static void Bohm(const double U, const int Degree, const int N, Standard_Real &OutValue, const int Dimension, Standard_Real &OutValue);

		/****** BSplCLib::BoorIndex ******/
		/****** md5 signature: 23fc6da5ae77e72328d9cc61d291797e ******/
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
		static int BoorIndex(const int Index, const int Length, const int Depth);

		/****** BSplCLib::BoorScheme ******/
		/****** md5 signature: a1ee7a2a21c0a76b01c3091feb13a403 ******/
		%feature("compactdefaultargs") BoorScheme;
		%feature("autodoc", "
Parameters
----------
U: double
Degree: int
Dimension: int
Depth: int
Length: int

Return
-------
Knots: double
Poles: double

Description
-----------
Performs the Boor Algorithm at parameter <U> with the given <Degree> and the array of <Knots> on the poles <Poles> of dimension <Dimension>. The schema is computed until level <Depth> on a basis of <Length+1> poles. //! * Knots is an array of reals of length: //! <Length> + <Degree> //! * Poles is an array of reals of length: //! (2 * <Length> + 1) * <Dimension> //! The poles values must be set in the array at the positions. //! 0..Dimension, //! 2 * Dimension .. 3 * Dimension //! 4 * Dimension .. 5 * Dimension //! ... //! The results are found in the array poles depending on the Depth. (See the method GetPole).
") BoorScheme;
		static void BoorScheme(const double U, const int Degree, Standard_Real &OutValue, const int Dimension, Standard_Real &OutValue, const int Depth, const int Length);

		/****** BSplCLib::BuildBSpMatrix ******/
		/****** md5 signature: 83639d7545c1820c05e4efad532d05de ******/
		%feature("compactdefaultargs") BuildBSpMatrix;
		%feature("autodoc", "
Parameters
----------
Parameters: NCollection_Array1<double>
OrderArray: NCollection_Array1<int>
FlatKnots: NCollection_Array1<double>
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
		static int BuildBSpMatrix(const NCollection_Array1<double> & Parameters, const NCollection_Array1<int> & OrderArray, const NCollection_Array1<double> & FlatKnots, const int Degree, math_Matrix & Matrix, Standard_Integer &OutValue, Standard_Integer &OutValue);

		/****** BSplCLib::BuildBoor ******/
		/****** md5 signature: c46c4789d73422cbf3a20f23c1fb8233 ******/
		%feature("compactdefaultargs") BuildBoor;
		%feature("autodoc", "
Parameters
----------
Index: int
Length: int
Dimension: int
Poles: NCollection_Array1<double>

Return
-------
LP: double

Description
-----------
Copy in <LP> poles for <Dimension> Boor scheme. Starting from <Index> * <Dimension>, copy <Length+1> poles.
") BuildBoor;
		static void BuildBoor(const int Index, const int Length, const int Dimension, const NCollection_Array1<double> & Poles, Standard_Real &OutValue);

		/****** BSplCLib::BuildCache ******/
		/****** md5 signature: 5debbf7f8d71e788d7caf60067645259 ******/
		%feature("compactdefaultargs") BuildCache;
		%feature("autodoc", "
Parameters
----------
U: double
InverseOfSpanDomain: double
PeriodicFlag: bool
Degree: int
FlatKnots: NCollection_Array1<double>
Poles: NCollection_Array1<gp_Pnt>
Weights: NCollection_Array1<double> *
CachePoles: NCollection_Array1<gp_Pnt>
CacheWeights: NCollection_Array1<double> *

Return
-------
None

Description
-----------
Perform the evaluation of the Taylor expansion of the Bspline normalized between 0 and 1. If rational computes the homogeneous Taylor expansion for the numerator and stores it in CachePoles.
") BuildCache;
		static void BuildCache(const double U, const double InverseOfSpanDomain, const bool PeriodicFlag, const int Degree, const NCollection_Array1<double> & FlatKnots, const NCollection_Array1<gp_Pnt> & Poles, const NCollection_Array1<double> * Weights, NCollection_Array1<gp_Pnt> & CachePoles, NCollection_Array1<double> * CacheWeights);

		/****** BSplCLib::BuildCache ******/
		/****** md5 signature: 347aced39bbca69a3bc76387e2420773 ******/
		%feature("compactdefaultargs") BuildCache;
		%feature("autodoc", "
Parameters
----------
U: double
InverseOfSpanDomain: double
PeriodicFlag: bool
Degree: int
FlatKnots: NCollection_Array1<double>
Poles: NCollection_Array1<gp_Pnt2d>
Weights: NCollection_Array1<double> *
CachePoles: NCollection_Array1<gp_Pnt2d>
CacheWeights: NCollection_Array1<double> *

Return
-------
None

Description
-----------
Perform the evaluation of the Taylor expansion of the Bspline normalized between 0 and 1. If rational computes the homogeneous Taylor expansion for the numerator and stores it in CachePoles.
") BuildCache;
		static void BuildCache(const double U, const double InverseOfSpanDomain, const bool PeriodicFlag, const int Degree, const NCollection_Array1<double> & FlatKnots, const NCollection_Array1<gp_Pnt2d> & Poles, const NCollection_Array1<double> * Weights, NCollection_Array1<gp_Pnt2d> & CachePoles, NCollection_Array1<double> * CacheWeights);

		/****** BSplCLib::BuildCache ******/
		/****** md5 signature: 8a525a25b5bcb8a99f2cefa94851be8c ******/
		%feature("compactdefaultargs") BuildCache;
		%feature("autodoc", "
Parameters
----------
theParameter: double
theSpanDomain: double
thePeriodicFlag: bool
theDegree: int
theSpanIndex: int
theFlatKnots: NCollection_Array1<double>
thePoles: NCollection_Array1<gp_Pnt>
theWeights: NCollection_Array1<double> *
theCacheArray: NCollection_Array2<double>

Return
-------
None

Description
-----------
Perform the evaluation of the Taylor expansion of the Bspline normalized between 0 and 1. Structure of result optimized for BSplCLib_Cache.
") BuildCache;
		static void BuildCache(const double theParameter, const double theSpanDomain, const bool thePeriodicFlag, const int theDegree, const int theSpanIndex, const NCollection_Array1<double> & theFlatKnots, const NCollection_Array1<gp_Pnt> & thePoles, const NCollection_Array1<double> * theWeights, NCollection_Array2<double> & theCacheArray);

		/****** BSplCLib::BuildCache ******/
		/****** md5 signature: 3bb6f8adfda2b1a12b85bbf5036ceed3 ******/
		%feature("compactdefaultargs") BuildCache;
		%feature("autodoc", "
Parameters
----------
theParameter: double
theSpanDomain: double
thePeriodicFlag: bool
theDegree: int
theSpanIndex: int
theFlatKnots: NCollection_Array1<double>
thePoles: NCollection_Array1<gp_Pnt2d>
theWeights: NCollection_Array1<double> *
theCacheArray: NCollection_Array2<double>

Return
-------
None

Description
-----------
Perform the evaluation of the Taylor expansion of the Bspline normalized between 0 and 1. Structure of result optimized for BSplCLib_Cache.
") BuildCache;
		static void BuildCache(const double theParameter, const double theSpanDomain, const bool thePeriodicFlag, const int theDegree, const int theSpanIndex, const NCollection_Array1<double> & theFlatKnots, const NCollection_Array1<gp_Pnt2d> & thePoles, const NCollection_Array1<double> * theWeights, NCollection_Array2<double> & theCacheArray);

		/****** BSplCLib::BuildEval ******/
		/****** md5 signature: 3294f5ed7ab7fdc94c776f2cc17bad12 ******/
		%feature("compactdefaultargs") BuildEval;
		%feature("autodoc", "
Parameters
----------
Degree: int
Index: int
Poles: NCollection_Array1<double>
Weights: NCollection_Array1<double> *

Return
-------
LP: double

Description
-----------
No available documentation.
") BuildEval;
		static void BuildEval(const int Degree, const int Index, const NCollection_Array1<double> & Poles, const NCollection_Array1<double> * Weights, Standard_Real &OutValue);

		/****** BSplCLib::BuildEval ******/
		/****** md5 signature: cda04e299b3a8cab853c90aad738f9ac ******/
		%feature("compactdefaultargs") BuildEval;
		%feature("autodoc", "
Parameters
----------
Degree: int
Index: int
Poles: NCollection_Array1<gp_Pnt>
Weights: NCollection_Array1<double> *

Return
-------
LP: double

Description
-----------
No available documentation.
") BuildEval;
		static void BuildEval(const int Degree, const int Index, const NCollection_Array1<gp_Pnt> & Poles, const NCollection_Array1<double> * Weights, Standard_Real &OutValue);

		/****** BSplCLib::BuildEval ******/
		/****** md5 signature: 27cd862be9771c50e9aab3a002fb5584 ******/
		%feature("compactdefaultargs") BuildEval;
		%feature("autodoc", "
Parameters
----------
Degree: int
Index: int
Poles: NCollection_Array1<gp_Pnt2d>
Weights: NCollection_Array1<double> *

Return
-------
LP: double

Description
-----------
Copy in <LP> the poles and weights for the Eval scheme. starting from Poles(Poles.Lower()+Index).
") BuildEval;
		static void BuildEval(const int Degree, const int Index, const NCollection_Array1<gp_Pnt2d> & Poles, const NCollection_Array1<double> * Weights, Standard_Real &OutValue);

		/****** BSplCLib::BuildKnots ******/
		/****** md5 signature: 122df8fb2c39c06c40883f78b0f2300b ******/
		%feature("compactdefaultargs") BuildKnots;
		%feature("autodoc", "
Parameters
----------
Degree: int
Index: int
Periodic: bool
Knots: NCollection_Array1<double>
Mults: NCollection_Array1<int> *

Return
-------
LK: double

Description
-----------
Stores in LK the useful knots for the BoorSchem on the span Knots(Index) - Knots(Index+1).
") BuildKnots;
		static void BuildKnots(const int Degree, const int Index, const bool Periodic, const NCollection_Array1<double> & Knots, const NCollection_Array1<int> * Mults, Standard_Real &OutValue);

		/****** BSplCLib::BuildSchoenbergPoints ******/
		/****** md5 signature: 05f6e36dbf8642a04f28a5c5900db51a ******/
		%feature("compactdefaultargs") BuildSchoenbergPoints;
		%feature("autodoc", "
Parameters
----------
Degree: int
FlatKnots: NCollection_Array1<double>
Parameters: NCollection_Array1<double>

Return
-------
None

Description
-----------
builds the Schoenberg points from the flat knot used to interpolate a BSpline since the BSpline matrix is invertible.
") BuildSchoenbergPoints;
		static void BuildSchoenbergPoints(const int Degree, const NCollection_Array1<double> & FlatKnots, NCollection_Array1<double> & Parameters);

		/****** BSplCLib::CacheD0 ******/
		/****** md5 signature: 87cf8ca605183b641fb14a490d2ec83a ******/
		%feature("compactdefaultargs") CacheD0;
		%feature("autodoc", "
Parameters
----------
U: double
Degree: int
CacheParameter: double
SpanLenght: double
Poles: NCollection_Array1<gp_Pnt>
Weights: NCollection_Array1<double> *
Point: gp_Pnt

Return
-------
None

Description
-----------
Perform the evaluation of the of the cache the parameter must be normalized between the 0 and 1 for the span. The Cache must be valid when calling this routine. Geom Package will insure that. and then multiplies by the weights this just evaluates the current point the CacheParameter is where the Cache was constructed the SpanLength is to normalize the polynomial in the cache to avoid bad conditioning effects.
") CacheD0;
		static void CacheD0(const double U, const int Degree, const double CacheParameter, const double SpanLenght, const NCollection_Array1<gp_Pnt> & Poles, const NCollection_Array1<double> * Weights, gp_Pnt & Point);

		/****** BSplCLib::CacheD0 ******/
		/****** md5 signature: 4b34dc1893bd5c92ea43af66dfa6e5cf ******/
		%feature("compactdefaultargs") CacheD0;
		%feature("autodoc", "
Parameters
----------
U: double
Degree: int
CacheParameter: double
SpanLenght: double
Poles: NCollection_Array1<gp_Pnt2d>
Weights: NCollection_Array1<double> *
Point: gp_Pnt2d

Return
-------
None

Description
-----------
Perform the evaluation of the Bspline Basis and then multiplies by the weights this just evaluates the current point the parameter must be normalized between the 0 and 1 for the span. The Cache must be valid when calling this routine. Geom Package will insure that. and then multiplies by the weights ththe CacheParameter is where the Cache was constructed the SpanLength is to normalize the polynomial in the cache to avoid bad conditioning effectsis just evaluates the current point.
") CacheD0;
		static void CacheD0(const double U, const int Degree, const double CacheParameter, const double SpanLenght, const NCollection_Array1<gp_Pnt2d> & Poles, const NCollection_Array1<double> * Weights, gp_Pnt2d & Point);

		/****** BSplCLib::CacheD1 ******/
		/****** md5 signature: a07e73852900dba02806efff98ac6290 ******/
		%feature("compactdefaultargs") CacheD1;
		%feature("autodoc", "
Parameters
----------
U: double
Degree: int
CacheParameter: double
SpanLenght: double
Poles: NCollection_Array1<gp_Pnt>
Weights: NCollection_Array1<double> *
Point: gp_Pnt
Vec: gp_Vec

Return
-------
None

Description
-----------
Perform the evaluation of the of the cache the parameter must be normalized between the 0 and 1 for the span. The Cache must be valid when calling this routine. Geom Package will insure that. and then multiplies by the weights this just evaluates the current point the CacheParameter is where the Cache was constructed the SpanLength is to normalize the polynomial in the cache to avoid bad conditioning effects.
") CacheD1;
		static void CacheD1(const double U, const int Degree, const double CacheParameter, const double SpanLenght, const NCollection_Array1<gp_Pnt> & Poles, const NCollection_Array1<double> * Weights, gp_Pnt & Point, gp_Vec & Vec);

		/****** BSplCLib::CacheD1 ******/
		/****** md5 signature: a3112ee03a6d5a8cdb405989d79c7917 ******/
		%feature("compactdefaultargs") CacheD1;
		%feature("autodoc", "
Parameters
----------
U: double
Degree: int
CacheParameter: double
SpanLenght: double
Poles: NCollection_Array1<gp_Pnt2d>
Weights: NCollection_Array1<double> *
Point: gp_Pnt2d
Vec: gp_Vec2d

Return
-------
None

Description
-----------
Perform the evaluation of the Bspline Basis and then multiplies by the weights this just evaluates the current point the parameter must be normalized between the 0 and 1 for the span. The Cache must be valid when calling this routine. Geom Package will insure that. and then multiplies by the weights ththe CacheParameter is where the Cache was constructed the SpanLength is to normalize the polynomial in the cache to avoid bad conditioning effectsis just evaluates the current point.
") CacheD1;
		static void CacheD1(const double U, const int Degree, const double CacheParameter, const double SpanLenght, const NCollection_Array1<gp_Pnt2d> & Poles, const NCollection_Array1<double> * Weights, gp_Pnt2d & Point, gp_Vec2d & Vec);

		/****** BSplCLib::CacheD2 ******/
		/****** md5 signature: 5924a7bf8203c893754fb53e52742f72 ******/
		%feature("compactdefaultargs") CacheD2;
		%feature("autodoc", "
Parameters
----------
U: double
Degree: int
CacheParameter: double
SpanLenght: double
Poles: NCollection_Array1<gp_Pnt>
Weights: NCollection_Array1<double> *
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
		static void CacheD2(const double U, const int Degree, const double CacheParameter, const double SpanLenght, const NCollection_Array1<gp_Pnt> & Poles, const NCollection_Array1<double> * Weights, gp_Pnt & Point, gp_Vec & Vec1, gp_Vec & Vec2);

		/****** BSplCLib::CacheD2 ******/
		/****** md5 signature: 826ac44a16308f5e2052c9ccd4e5936b ******/
		%feature("compactdefaultargs") CacheD2;
		%feature("autodoc", "
Parameters
----------
U: double
Degree: int
CacheParameter: double
SpanLenght: double
Poles: NCollection_Array1<gp_Pnt2d>
Weights: NCollection_Array1<double> *
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
		static void CacheD2(const double U, const int Degree, const double CacheParameter, const double SpanLenght, const NCollection_Array1<gp_Pnt2d> & Poles, const NCollection_Array1<double> * Weights, gp_Pnt2d & Point, gp_Vec2d & Vec1, gp_Vec2d & Vec2);

		/****** BSplCLib::CacheD3 ******/
		/****** md5 signature: 037f047bb27a39731e6f16f73c31b57c ******/
		%feature("compactdefaultargs") CacheD3;
		%feature("autodoc", "
Parameters
----------
U: double
Degree: int
CacheParameter: double
SpanLenght: double
Poles: NCollection_Array1<gp_Pnt>
Weights: NCollection_Array1<double> *
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
		static void CacheD3(const double U, const int Degree, const double CacheParameter, const double SpanLenght, const NCollection_Array1<gp_Pnt> & Poles, const NCollection_Array1<double> * Weights, gp_Pnt & Point, gp_Vec & Vec1, gp_Vec & Vec2, gp_Vec & Vec3);

		/****** BSplCLib::CacheD3 ******/
		/****** md5 signature: deb7a323c7c0ee3375c1e6065661fe27 ******/
		%feature("compactdefaultargs") CacheD3;
		%feature("autodoc", "
Parameters
----------
U: double
Degree: int
CacheParameter: double
SpanLenght: double
Poles: NCollection_Array1<gp_Pnt2d>
Weights: NCollection_Array1<double> *
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
		static void CacheD3(const double U, const int Degree, const double CacheParameter, const double SpanLenght, const NCollection_Array1<gp_Pnt2d> & Poles, const NCollection_Array1<double> * Weights, gp_Pnt2d & Point, gp_Vec2d & Vec1, gp_Vec2d & Vec2, gp_Vec2d & Vec3);

		/****** BSplCLib::CoefsD0 ******/
		/****** md5 signature: 83be13699ce59e138f792b0891efabdc ******/
		%feature("compactdefaultargs") CoefsD0;
		%feature("autodoc", "
Parameters
----------
U: double
Poles: NCollection_Array1<gp_Pnt>
Weights: NCollection_Array1<double> *
Point: gp_Pnt

Return
-------
None

Description
-----------
Calls CacheD0 for Bezier Curves Arrays computed with the method PolesCoefficients. Warning: To be used for Beziercurves ONLY!!!.
") CoefsD0;
		static void CoefsD0(const double U, const NCollection_Array1<gp_Pnt> & Poles, const NCollection_Array1<double> * Weights, gp_Pnt & Point);

		/****** BSplCLib::CoefsD0 ******/
		/****** md5 signature: 952b58747c08a0664193d01e3919dd8a ******/
		%feature("compactdefaultargs") CoefsD0;
		%feature("autodoc", "
Parameters
----------
U: double
Poles: NCollection_Array1<gp_Pnt2d>
Weights: NCollection_Array1<double> *
Point: gp_Pnt2d

Return
-------
None

Description
-----------
Calls CacheD0 for Bezier Curves Arrays computed with the method PolesCoefficients. Warning: To be used for Beziercurves ONLY!!!.
") CoefsD0;
		static void CoefsD0(const double U, const NCollection_Array1<gp_Pnt2d> & Poles, const NCollection_Array1<double> * Weights, gp_Pnt2d & Point);

		/****** BSplCLib::CoefsD1 ******/
		/****** md5 signature: f1fceb7e39ffeb9246220e15561b8b56 ******/
		%feature("compactdefaultargs") CoefsD1;
		%feature("autodoc", "
Parameters
----------
U: double
Poles: NCollection_Array1<gp_Pnt>
Weights: NCollection_Array1<double> *
Point: gp_Pnt
Vec: gp_Vec

Return
-------
None

Description
-----------
Calls CacheD1 for Bezier Curves Arrays computed with the method PolesCoefficients. Warning: To be used for Beziercurves ONLY!!!.
") CoefsD1;
		static void CoefsD1(const double U, const NCollection_Array1<gp_Pnt> & Poles, const NCollection_Array1<double> * Weights, gp_Pnt & Point, gp_Vec & Vec);

		/****** BSplCLib::CoefsD1 ******/
		/****** md5 signature: 490f19ba3f8b46f6065b0064e4691738 ******/
		%feature("compactdefaultargs") CoefsD1;
		%feature("autodoc", "
Parameters
----------
U: double
Poles: NCollection_Array1<gp_Pnt2d>
Weights: NCollection_Array1<double> *
Point: gp_Pnt2d
Vec: gp_Vec2d

Return
-------
None

Description
-----------
Calls CacheD1 for Bezier Curves Arrays computed with the method PolesCoefficients. Warning: To be used for Beziercurves ONLY!!!.
") CoefsD1;
		static void CoefsD1(const double U, const NCollection_Array1<gp_Pnt2d> & Poles, const NCollection_Array1<double> * Weights, gp_Pnt2d & Point, gp_Vec2d & Vec);

		/****** BSplCLib::CoefsD2 ******/
		/****** md5 signature: fce24b1a98d4657b7105ab66631fef1b ******/
		%feature("compactdefaultargs") CoefsD2;
		%feature("autodoc", "
Parameters
----------
U: double
Poles: NCollection_Array1<gp_Pnt>
Weights: NCollection_Array1<double> *
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
		static void CoefsD2(const double U, const NCollection_Array1<gp_Pnt> & Poles, const NCollection_Array1<double> * Weights, gp_Pnt & Point, gp_Vec & Vec1, gp_Vec & Vec2);

		/****** BSplCLib::CoefsD2 ******/
		/****** md5 signature: 665afd4969302b4e51c145d1defdc072 ******/
		%feature("compactdefaultargs") CoefsD2;
		%feature("autodoc", "
Parameters
----------
U: double
Poles: NCollection_Array1<gp_Pnt2d>
Weights: NCollection_Array1<double> *
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
		static void CoefsD2(const double U, const NCollection_Array1<gp_Pnt2d> & Poles, const NCollection_Array1<double> * Weights, gp_Pnt2d & Point, gp_Vec2d & Vec1, gp_Vec2d & Vec2);

		/****** BSplCLib::CoefsD3 ******/
		/****** md5 signature: 076abd7259f777162c350217590431ea ******/
		%feature("compactdefaultargs") CoefsD3;
		%feature("autodoc", "
Parameters
----------
U: double
Poles: NCollection_Array1<gp_Pnt>
Weights: NCollection_Array1<double> *
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
		static void CoefsD3(const double U, const NCollection_Array1<gp_Pnt> & Poles, const NCollection_Array1<double> * Weights, gp_Pnt & Point, gp_Vec & Vec1, gp_Vec & Vec2, gp_Vec & Vec3);

		/****** BSplCLib::CoefsD3 ******/
		/****** md5 signature: 450ee603c54e99d98d6e29e1ecb977c3 ******/
		%feature("compactdefaultargs") CoefsD3;
		%feature("autodoc", "
Parameters
----------
U: double
Poles: NCollection_Array1<gp_Pnt2d>
Weights: NCollection_Array1<double> *
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
		static void CoefsD3(const double U, const NCollection_Array1<gp_Pnt2d> & Poles, const NCollection_Array1<double> * Weights, gp_Pnt2d & Point, gp_Vec2d & Vec1, gp_Vec2d & Vec2, gp_Vec2d & Vec3);

		/****** BSplCLib::D0 ******/
		/****** md5 signature: 404cf0a7d7d8f850804b5e41ff0897f6 ******/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "
Parameters
----------
U: double
Index: int
Degree: int
Periodic: bool
Poles: NCollection_Array1<double>
Weights: NCollection_Array1<double> *
Knots: NCollection_Array1<double>
Mults: NCollection_Array1<int> *

Return
-------
P: double

Description
-----------
No available documentation.
") D0;
		static void D0(const double U, const int Index, const int Degree, const bool Periodic, const NCollection_Array1<double> & Poles, const NCollection_Array1<double> * Weights, const NCollection_Array1<double> & Knots, const NCollection_Array1<int> * Mults, Standard_Real &OutValue);

		/****** BSplCLib::D0 ******/
		/****** md5 signature: 6f2617cff0cca48a1e6f6a5af0c31a09 ******/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "
Parameters
----------
U: double
Index: int
Degree: int
Periodic: bool
Poles: NCollection_Array1<gp_Pnt>
Weights: NCollection_Array1<double> *
Knots: NCollection_Array1<double>
Mults: NCollection_Array1<int> *
P: gp_Pnt

Return
-------
None

Description
-----------
No available documentation.
") D0;
		static void D0(const double U, const int Index, const int Degree, const bool Periodic, const NCollection_Array1<gp_Pnt> & Poles, const NCollection_Array1<double> * Weights, const NCollection_Array1<double> & Knots, const NCollection_Array1<int> * Mults, gp_Pnt & P);

		/****** BSplCLib::D0 ******/
		/****** md5 signature: 46b5d26c42c8fc3684f1da22e4b0412e ******/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "
Parameters
----------
U: double
UIndex: int
Degree: int
Periodic: bool
Poles: NCollection_Array1<gp_Pnt2d>
Weights: NCollection_Array1<double> *
Knots: NCollection_Array1<double>
Mults: NCollection_Array1<int> *
P: gp_Pnt2d

Return
-------
None

Description
-----------
No available documentation.
") D0;
		static void D0(const double U, const int UIndex, const int Degree, const bool Periodic, const NCollection_Array1<gp_Pnt2d> & Poles, const NCollection_Array1<double> * Weights, const NCollection_Array1<double> & Knots, const NCollection_Array1<int> * Mults, gp_Pnt2d & P);

		/****** BSplCLib::D0 ******/
		/****** md5 signature: d1f9c64b2bead5ff6bd29fe19674f1e7 ******/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "
Parameters
----------
U: double
Poles: NCollection_Array1<gp_Pnt>
Weights: NCollection_Array1<double> *
P: gp_Pnt

Return
-------
None

Description
-----------
No available documentation.
") D0;
		static void D0(const double U, const NCollection_Array1<gp_Pnt> & Poles, const NCollection_Array1<double> * Weights, gp_Pnt & P);

		/****** BSplCLib::D0 ******/
		/****** md5 signature: 57673d7d0b53a5c8e156148a23cc64e4 ******/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "
Parameters
----------
U: double
Poles: NCollection_Array1<gp_Pnt2d>
Weights: NCollection_Array1<double> *
P: gp_Pnt2d

Return
-------
None

Description
-----------
No available documentation.
") D0;
		static void D0(const double U, const NCollection_Array1<gp_Pnt2d> & Poles, const NCollection_Array1<double> * Weights, gp_Pnt2d & P);

		/****** BSplCLib::D1 ******/
		/****** md5 signature: 6dc3168b2187988769ae762ad2decaf7 ******/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "
Parameters
----------
U: double
Index: int
Degree: int
Periodic: bool
Poles: NCollection_Array1<double>
Weights: NCollection_Array1<double> *
Knots: NCollection_Array1<double>
Mults: NCollection_Array1<int> *

Return
-------
P: double
V: double

Description
-----------
No available documentation.
") D1;
		static void D1(const double U, const int Index, const int Degree, const bool Periodic, const NCollection_Array1<double> & Poles, const NCollection_Array1<double> * Weights, const NCollection_Array1<double> & Knots, const NCollection_Array1<int> * Mults, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** BSplCLib::D1 ******/
		/****** md5 signature: 9f3f3d549163bf60893e262c8650d76e ******/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "
Parameters
----------
U: double
Index: int
Degree: int
Periodic: bool
Poles: NCollection_Array1<gp_Pnt>
Weights: NCollection_Array1<double> *
Knots: NCollection_Array1<double>
Mults: NCollection_Array1<int> *
P: gp_Pnt
V: gp_Vec

Return
-------
None

Description
-----------
No available documentation.
") D1;
		static void D1(const double U, const int Index, const int Degree, const bool Periodic, const NCollection_Array1<gp_Pnt> & Poles, const NCollection_Array1<double> * Weights, const NCollection_Array1<double> & Knots, const NCollection_Array1<int> * Mults, gp_Pnt & P, gp_Vec & V);

		/****** BSplCLib::D1 ******/
		/****** md5 signature: b18b2ce3539bd1bdd83808784eef9c1d ******/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "
Parameters
----------
U: double
UIndex: int
Degree: int
Periodic: bool
Poles: NCollection_Array1<gp_Pnt2d>
Weights: NCollection_Array1<double> *
Knots: NCollection_Array1<double>
Mults: NCollection_Array1<int> *
P: gp_Pnt2d
V: gp_Vec2d

Return
-------
None

Description
-----------
No available documentation.
") D1;
		static void D1(const double U, const int UIndex, const int Degree, const bool Periodic, const NCollection_Array1<gp_Pnt2d> & Poles, const NCollection_Array1<double> * Weights, const NCollection_Array1<double> & Knots, const NCollection_Array1<int> * Mults, gp_Pnt2d & P, gp_Vec2d & V);

		/****** BSplCLib::D1 ******/
		/****** md5 signature: 6ea0fb73df8d8dece537b7e37c633ac7 ******/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "
Parameters
----------
U: double
Poles: NCollection_Array1<gp_Pnt>
Weights: NCollection_Array1<double> *
P: gp_Pnt
V: gp_Vec

Return
-------
None

Description
-----------
No available documentation.
") D1;
		static void D1(const double U, const NCollection_Array1<gp_Pnt> & Poles, const NCollection_Array1<double> * Weights, gp_Pnt & P, gp_Vec & V);

		/****** BSplCLib::D1 ******/
		/****** md5 signature: 062c34063a1e9e809fee2bbc521184f4 ******/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "
Parameters
----------
U: double
Poles: NCollection_Array1<gp_Pnt2d>
Weights: NCollection_Array1<double> *
P: gp_Pnt2d
V: gp_Vec2d

Return
-------
None

Description
-----------
No available documentation.
") D1;
		static void D1(const double U, const NCollection_Array1<gp_Pnt2d> & Poles, const NCollection_Array1<double> * Weights, gp_Pnt2d & P, gp_Vec2d & V);

		/****** BSplCLib::D2 ******/
		/****** md5 signature: bf342f73f7ccfbb9cb7b766861440ba7 ******/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "
Parameters
----------
U: double
Index: int
Degree: int
Periodic: bool
Poles: NCollection_Array1<double>
Weights: NCollection_Array1<double> *
Knots: NCollection_Array1<double>
Mults: NCollection_Array1<int> *

Return
-------
P: double
V1: double
V2: double

Description
-----------
No available documentation.
") D2;
		static void D2(const double U, const int Index, const int Degree, const bool Periodic, const NCollection_Array1<double> & Poles, const NCollection_Array1<double> * Weights, const NCollection_Array1<double> & Knots, const NCollection_Array1<int> * Mults, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** BSplCLib::D2 ******/
		/****** md5 signature: 355e99a7d3f533062f155342b7fcb709 ******/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "
Parameters
----------
U: double
Index: int
Degree: int
Periodic: bool
Poles: NCollection_Array1<gp_Pnt>
Weights: NCollection_Array1<double> *
Knots: NCollection_Array1<double>
Mults: NCollection_Array1<int> *
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
		static void D2(const double U, const int Index, const int Degree, const bool Periodic, const NCollection_Array1<gp_Pnt> & Poles, const NCollection_Array1<double> * Weights, const NCollection_Array1<double> & Knots, const NCollection_Array1<int> * Mults, gp_Pnt & P, gp_Vec & V1, gp_Vec & V2);

		/****** BSplCLib::D2 ******/
		/****** md5 signature: d36cce6e427f36fe50c6c3d96d43adb2 ******/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "
Parameters
----------
U: double
UIndex: int
Degree: int
Periodic: bool
Poles: NCollection_Array1<gp_Pnt2d>
Weights: NCollection_Array1<double> *
Knots: NCollection_Array1<double>
Mults: NCollection_Array1<int> *
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
		static void D2(const double U, const int UIndex, const int Degree, const bool Periodic, const NCollection_Array1<gp_Pnt2d> & Poles, const NCollection_Array1<double> * Weights, const NCollection_Array1<double> & Knots, const NCollection_Array1<int> * Mults, gp_Pnt2d & P, gp_Vec2d & V1, gp_Vec2d & V2);

		/****** BSplCLib::D2 ******/
		/****** md5 signature: 9b2f889b8e0bc2f376ebd25d5eee6cfc ******/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "
Parameters
----------
U: double
Poles: NCollection_Array1<gp_Pnt>
Weights: NCollection_Array1<double> *
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
		static void D2(const double U, const NCollection_Array1<gp_Pnt> & Poles, const NCollection_Array1<double> * Weights, gp_Pnt & P, gp_Vec & V1, gp_Vec & V2);

		/****** BSplCLib::D2 ******/
		/****** md5 signature: 41f23ca8056bb7d28854b234d2842cb1 ******/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "
Parameters
----------
U: double
Poles: NCollection_Array1<gp_Pnt2d>
Weights: NCollection_Array1<double> *
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
		static void D2(const double U, const NCollection_Array1<gp_Pnt2d> & Poles, const NCollection_Array1<double> * Weights, gp_Pnt2d & P, gp_Vec2d & V1, gp_Vec2d & V2);

		/****** BSplCLib::D3 ******/
		/****** md5 signature: 338d635e7466cc9aa16dc944a6c67e7a ******/
		%feature("compactdefaultargs") D3;
		%feature("autodoc", "
Parameters
----------
U: double
Index: int
Degree: int
Periodic: bool
Poles: NCollection_Array1<double>
Weights: NCollection_Array1<double> *
Knots: NCollection_Array1<double>
Mults: NCollection_Array1<int> *

Return
-------
P: double
V1: double
V2: double
V3: double

Description
-----------
No available documentation.
") D3;
		static void D3(const double U, const int Index, const int Degree, const bool Periodic, const NCollection_Array1<double> & Poles, const NCollection_Array1<double> * Weights, const NCollection_Array1<double> & Knots, const NCollection_Array1<int> * Mults, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** BSplCLib::D3 ******/
		/****** md5 signature: c10024ef49a6dc201dd96d60c70124bf ******/
		%feature("compactdefaultargs") D3;
		%feature("autodoc", "
Parameters
----------
U: double
Index: int
Degree: int
Periodic: bool
Poles: NCollection_Array1<gp_Pnt>
Weights: NCollection_Array1<double> *
Knots: NCollection_Array1<double>
Mults: NCollection_Array1<int> *
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
		static void D3(const double U, const int Index, const int Degree, const bool Periodic, const NCollection_Array1<gp_Pnt> & Poles, const NCollection_Array1<double> * Weights, const NCollection_Array1<double> & Knots, const NCollection_Array1<int> * Mults, gp_Pnt & P, gp_Vec & V1, gp_Vec & V2, gp_Vec & V3);

		/****** BSplCLib::D3 ******/
		/****** md5 signature: f106fd809dedbab84ea4fea3ea0f099c ******/
		%feature("compactdefaultargs") D3;
		%feature("autodoc", "
Parameters
----------
U: double
UIndex: int
Degree: int
Periodic: bool
Poles: NCollection_Array1<gp_Pnt2d>
Weights: NCollection_Array1<double> *
Knots: NCollection_Array1<double>
Mults: NCollection_Array1<int> *
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
		static void D3(const double U, const int UIndex, const int Degree, const bool Periodic, const NCollection_Array1<gp_Pnt2d> & Poles, const NCollection_Array1<double> * Weights, const NCollection_Array1<double> & Knots, const NCollection_Array1<int> * Mults, gp_Pnt2d & P, gp_Vec2d & V1, gp_Vec2d & V2, gp_Vec2d & V3);

		/****** BSplCLib::D3 ******/
		/****** md5 signature: 6689abe1184fbf799b5946b467f05d1b ******/
		%feature("compactdefaultargs") D3;
		%feature("autodoc", "
Parameters
----------
U: double
Poles: NCollection_Array1<gp_Pnt>
Weights: NCollection_Array1<double> *
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
		static void D3(const double U, const NCollection_Array1<gp_Pnt> & Poles, const NCollection_Array1<double> * Weights, gp_Pnt & P, gp_Vec & V1, gp_Vec & V2, gp_Vec & V3);

		/****** BSplCLib::D3 ******/
		/****** md5 signature: 7d4c5a41ef06241b73a6eee149fc4be7 ******/
		%feature("compactdefaultargs") D3;
		%feature("autodoc", "
Parameters
----------
U: double
Poles: NCollection_Array1<gp_Pnt2d>
Weights: NCollection_Array1<double> *
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
		static void D3(const double U, const NCollection_Array1<gp_Pnt2d> & Poles, const NCollection_Array1<double> * Weights, gp_Pnt2d & P, gp_Vec2d & V1, gp_Vec2d & V2, gp_Vec2d & V3);

		/****** BSplCLib::Derivative ******/
		/****** md5 signature: 5e52517228cbb7352a60ca74ac2bb065 ******/
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
Knots: double
Poles: double

Description
-----------
Computes the poles of the BSpline giving the derivatives of order <Order>. //! The formula for the first order is //! Pole(i) = Degree * (Pole(i+1) - Pole(i)) / (Knots(i+Degree+1) - Knots(i+1)) //! This formula is repeated (Degree is decremented at each step).
") Derivative;
		static void Derivative(const int Degree, Standard_Real &OutValue, const int Dimension, const int Length, const int Order, Standard_Real &OutValue);

		/****** BSplCLib::Eval ******/
		/****** md5 signature: 54919f71e6807f6030cae34e54296e01 ******/
		%feature("compactdefaultargs") Eval;
		%feature("autodoc", "
Parameters
----------
U: double
Degree: int
Dimension: int

Return
-------
Knots: double
Poles: double

Description
-----------
Perform the Boor algorithm to evaluate a point at parameter <U>, with <Degree> and <Dimension>. //! Poles is an array of Reals of size //! <Dimension> * <Degree>+1 //! Containing the poles. At the end <Poles> contains the current point.
") Eval;
		static void Eval(const double U, const int Degree, Standard_Real &OutValue, const int Dimension, Standard_Real &OutValue);

		/****** BSplCLib::Eval ******/
		/****** md5 signature: d3e42c00ec7c0142a3d2b01a251ae5be ******/
		%feature("compactdefaultargs") Eval;
		%feature("autodoc", "
Parameters
----------
U: double
PeriodicFlag: bool
DerivativeRequest: int
Degree: int
FlatKnots: NCollection_Array1<double>
ArrayDimension: int

Return
-------
ExtrapMode: int
Poles: double
Result: double

Description
-----------
Perform the De Boor algorithm to evaluate a point at parameter <U>, with <Degree> and <Dimension>. //! Poles is an array of Reals of size //! <Dimension> * <Degree>+1 //! Containing the poles. At the end <Poles> contains the current point. Poles Contain all the poles of the BsplineCurve, Knots also Contains all the knots of the BsplineCurve. ExtrapMode has two slots [0] = Degree used to extrapolate before the first knot [1] = Degre used to extrapolate after the last knot has to be between 1 and Degree.
") Eval;
		static void Eval(const double U, const bool PeriodicFlag, const int DerivativeRequest, Standard_Integer &OutValue, const int Degree, const NCollection_Array1<double> & FlatKnots, const int ArrayDimension, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** BSplCLib::Eval ******/
		/****** md5 signature: 907fd9886ea05dcf0ed2f608b279620d ******/
		%feature("compactdefaultargs") Eval;
		%feature("autodoc", "
Parameters
----------
U: double
PeriodicFlag: bool
DerivativeRequest: int
Degree: int
FlatKnots: NCollection_Array1<double>
ArrayDimension: int

Return
-------
ExtrapMode: int
Poles: double
Weights: double
PolesResult: double
WeightsResult: double

Description
-----------
Perform the De Boor algorithm to evaluate a point at parameter <U>, with <Degree> and <Dimension>. Evaluates by multiplying the Poles by the Weights and gives the homogeneous result in PolesResult that is the results of the evaluation of the numerator once it has been multiplied by the weights and in WeightsResult one has the result of the evaluation of the denominator //! Warning: <PolesResult> and <WeightsResult> must be dimensioned properly.
") Eval;
		static void Eval(const double U, const bool PeriodicFlag, const int DerivativeRequest, Standard_Integer &OutValue, const int Degree, const NCollection_Array1<double> & FlatKnots, const int ArrayDimension, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** BSplCLib::Eval ******/
		/****** md5 signature: 0c1587686950825e20f84df544d85bb2 ******/
		%feature("compactdefaultargs") Eval;
		%feature("autodoc", "
Parameters
----------
U: double
PeriodicFlag: bool
HomogeneousFlag: bool
Degree: int
FlatKnots: NCollection_Array1<double>
Poles: NCollection_Array1<gp_Pnt>
Weights: NCollection_Array1<double>
Point: gp_Pnt

Return
-------
ExtrapMode: int
Weight: double

Description
-----------
Perform the evaluation of the Bspline Basis and then multiplies by the weights this just evaluates the current point.
") Eval;
		static void Eval(const double U, const bool PeriodicFlag, const bool HomogeneousFlag, Standard_Integer &OutValue, const int Degree, const NCollection_Array1<double> & FlatKnots, const NCollection_Array1<gp_Pnt> & Poles, const NCollection_Array1<double> & Weights, gp_Pnt & Point, Standard_Real &OutValue);

		/****** BSplCLib::Eval ******/
		/****** md5 signature: b2a5a27d536f96461bb38a46f68a9812 ******/
		%feature("compactdefaultargs") Eval;
		%feature("autodoc", "
Parameters
----------
U: double
PeriodicFlag: bool
HomogeneousFlag: bool
Degree: int
FlatKnots: NCollection_Array1<double>
Poles: NCollection_Array1<gp_Pnt2d>
Weights: NCollection_Array1<double>
Point: gp_Pnt2d

Return
-------
ExtrapMode: int
Weight: double

Description
-----------
Perform the evaluation of the Bspline Basis and then multiplies by the weights this just evaluates the current point.
") Eval;
		static void Eval(const double U, const bool PeriodicFlag, const bool HomogeneousFlag, Standard_Integer &OutValue, const int Degree, const NCollection_Array1<double> & FlatKnots, const NCollection_Array1<gp_Pnt2d> & Poles, const NCollection_Array1<double> & Weights, gp_Pnt2d & Point, Standard_Real &OutValue);

		/****** BSplCLib::EvalBsplineBasis ******/
		/****** md5 signature: afe1952f049ae59d42e9d5144a616151 ******/
		%feature("compactdefaultargs") EvalBsplineBasis;
		%feature("autodoc", "
Parameters
----------
DerivativeOrder: int
Order: int
FlatKnots: NCollection_Array1<double>
Parameter: double
BsplineBasis: math_Matrix
isPeriodic: bool (optional, default to false)

Return
-------
FirstNonZeroBsplineIndex: int

Description
-----------
This evaluates the Bspline Basis at a given parameter Parameter up to the requested DerivativeOrder and store the result in the array BsplineBasis in the following fashion BSplineBasis(1,1) = value of first non vanishing Bspline function which has Index FirstNonZeroBsplineIndex BsplineBasis(1,2) = value of second non vanishing Bspline function which has Index FirstNonZeroBsplineIndex + 1 BsplineBasis(1,n) = value of second non vanishing non vanishing Bspline function which has Index FirstNonZeroBsplineIndex + n (n <= Order) BSplineBasis(2,1) = value of derivative of first non vanishing Bspline function which has Index FirstNonZeroBsplineIndex BSplineBasis(N,1) = value of Nth derivative of first non vanishing Bspline function which has Index FirstNonZeroBsplineIndex if N <= DerivativeOrder + 1.
") EvalBsplineBasis;
		static int EvalBsplineBasis(const int DerivativeOrder, const int Order, const NCollection_Array1<double> & FlatKnots, const double Parameter, Standard_Integer &OutValue, math_Matrix & BsplineBasis, const bool isPeriodic = false);

		/****** BSplCLib::FactorBandedMatrix ******/
		/****** md5 signature: 1ec21a8ebf64a9ddbf9754e631498f17 ******/
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
		static int FactorBandedMatrix(math_Matrix & Matrix, const int UpperBandWidth, const int LowerBandWidth, Standard_Integer &OutValue);

		/****** BSplCLib::FirstUKnotIndex ******/
		/****** md5 signature: d87ba45417392314031ed331662411f0 ******/
		%feature("compactdefaultargs") FirstUKnotIndex;
		%feature("autodoc", "
Parameters
----------
Degree: int
Mults: NCollection_Array1<int>

Return
-------
int

Description
-----------
Computes the index of the knots value which gives the start point of the curve.
") FirstUKnotIndex;
		static int FirstUKnotIndex(const int Degree, const NCollection_Array1<int> & Mults);

		/****** BSplCLib::FlatBezierKnots ******/
		/****** md5 signature: b1845c0e4c454144f07f08ff324a27be ******/
		%feature("compactdefaultargs") FlatBezierKnots;
		%feature("autodoc", "
Parameters
----------
Degree: int

Return
-------
double

Description
-----------
Returns pointer to statically allocated array representing flat knots for bezier curve of the specified degree. Raises OutOfRange if Degree > MaxDegree().
") FlatBezierKnots;
		static const double & FlatBezierKnots(const int Degree);

		/****** BSplCLib::FlatIndex ******/
		/****** md5 signature: f6d7622a961674d61b026f395f25e30d ******/
		%feature("compactdefaultargs") FlatIndex;
		%feature("autodoc", "
Parameters
----------
Degree: int
Index: int
Mults: NCollection_Array1<int>
Periodic: bool

Return
-------
int

Description
-----------
Computes the index of the flats knots sequence corresponding to <Index> in the knots sequence which multiplicities are <Mults>.
") FlatIndex;
		static int FlatIndex(const int Degree, const int Index, const NCollection_Array1<int> & Mults, const bool Periodic);

		/****** BSplCLib::FunctionMultiply ******/
		/****** md5 signature: 031288cf7c5e1ecbe3a53ea1b2515121 ******/
		%feature("compactdefaultargs") FunctionMultiply;
		%feature("autodoc", "
Parameters
----------
Function: BSplCLib_EvaluatorFunction
BSplineDegree: int
BSplineFlatKnots: NCollection_Array1<double>
PolesDimension: int
FlatKnots: NCollection_Array1<double>
NewDegree: int

Return
-------
Poles: double
NewPoles: double
theStatus: int

Description
-----------
this will multiply a given Vectorial BSpline F(t) defined by its BSplineDegree and BSplineFlatKnotsl, its Poles array which are coded as an array of Real of the form [1..NumPoles][1..PolesDimension] by a function a(t) which is assumed to satisfy the following: 1. a(t) * F(t) is a polynomial BSpline that can be expressed exactly as a BSpline of degree NewDegree on the knots FlatKnots 2. the range of a(t) is the same as the range of F(t) Warning: it is the caller's responsibility to insure that conditions 1. and 2. above are satisfied: no check whatsoever is made in this method theStatus will return 0 if OK else it will return the pivot index of the matrix that was inverted to compute the multiplied BSpline: the method used is interpolation at Schoenenberg points of a(t)*F(t).
") FunctionMultiply;
		static void FunctionMultiply(const BSplCLib_EvaluatorFunction & Function, const int BSplineDegree, const NCollection_Array1<double> & BSplineFlatKnots, const int PolesDimension, Standard_Real &OutValue, const NCollection_Array1<double> & FlatKnots, const int NewDegree, Standard_Real &OutValue, Standard_Integer &OutValue);

		/****** BSplCLib::FunctionMultiply ******/
		/****** md5 signature: fe1fdc830572c4a6f5fd8bce6de45eaa ******/
		%feature("compactdefaultargs") FunctionMultiply;
		%feature("autodoc", "
Parameters
----------
Function: BSplCLib_EvaluatorFunction
BSplineDegree: int
BSplineFlatKnots: NCollection_Array1<double>
Poles: NCollection_Array1<double>
FlatKnots: NCollection_Array1<double>
NewDegree: int
NewPoles: NCollection_Array1<double>

Return
-------
theStatus: int

Description
-----------
this will multiply a given Vectorial BSpline F(t) defined by its BSplineDegree and BSplineFlatKnotsl, its Poles array which are coded as an array of Real of the form [1..NumPoles][1..PolesDimension] by a function a(t) which is assumed to satisfy the following: 1. a(t) * F(t) is a polynomial BSpline that can be expressed exactly as a BSpline of degree NewDegree on the knots FlatKnots 2. the range of a(t) is the same as the range of F(t) Warning: it is the caller's responsibility to insure that conditions 1. and 2. above are satisfied: no check whatsoever is made in this method theStatus will return 0 if OK else it will return the pivot index of the matrix that was inverted to compute the multiplied BSpline: the method used is interpolation at Schoenenberg points of a(t)*F(t).
") FunctionMultiply;
		static void FunctionMultiply(const BSplCLib_EvaluatorFunction & Function, const int BSplineDegree, const NCollection_Array1<double> & BSplineFlatKnots, const NCollection_Array1<double> & Poles, const NCollection_Array1<double> & FlatKnots, const int NewDegree, NCollection_Array1<double> & NewPoles, Standard_Integer &OutValue);

		/****** BSplCLib::FunctionMultiply ******/
		/****** md5 signature: 11d7f0d7a9e14fba98666c75456f2926 ******/
		%feature("compactdefaultargs") FunctionMultiply;
		%feature("autodoc", "
Parameters
----------
Function: BSplCLib_EvaluatorFunction
BSplineDegree: int
BSplineFlatKnots: NCollection_Array1<double>
Poles: NCollection_Array1<gp_Pnt2d>
FlatKnots: NCollection_Array1<double>
NewDegree: int
NewPoles: NCollection_Array1<gp_Pnt2d>

Return
-------
theStatus: int

Description
-----------
this will multiply a given Vectorial BSpline F(t) defined by its BSplineDegree and BSplineFlatKnotsl, its Poles array which are coded as an array of Real of the form [1..NumPoles][1..PolesDimension] by a function a(t) which is assumed to satisfy the following: 1. a(t) * F(t) is a polynomial BSpline that can be expressed exactly as a BSpline of degree NewDegree on the knots FlatKnots 2. the range of a(t) is the same as the range of F(t) Warning: it is the caller's responsibility to insure that conditions 1. and 2. above are satisfied: no check whatsoever is made in this method theStatus will return 0 if OK else it will return the pivot index of the matrix that was inverted to compute the multiplied BSpline: the method used is interpolation at Schoenenberg points of a(t)*F(t).
") FunctionMultiply;
		static void FunctionMultiply(const BSplCLib_EvaluatorFunction & Function, const int BSplineDegree, const NCollection_Array1<double> & BSplineFlatKnots, const NCollection_Array1<gp_Pnt2d> & Poles, const NCollection_Array1<double> & FlatKnots, const int NewDegree, NCollection_Array1<gp_Pnt2d> & NewPoles, Standard_Integer &OutValue);

		/****** BSplCLib::FunctionMultiply ******/
		/****** md5 signature: a70e296c3cde5aeb88a70509278c9256 ******/
		%feature("compactdefaultargs") FunctionMultiply;
		%feature("autodoc", "
Parameters
----------
Function: BSplCLib_EvaluatorFunction
BSplineDegree: int
BSplineFlatKnots: NCollection_Array1<double>
Poles: NCollection_Array1<gp_Pnt>
FlatKnots: NCollection_Array1<double>
NewDegree: int
NewPoles: NCollection_Array1<gp_Pnt>

Return
-------
theStatus: int

Description
-----------
this will multiply a given Vectorial BSpline F(t) defined by its BSplineDegree and BSplineFlatKnotsl, its Poles array which are coded as an array of Real of the form [1..NumPoles][1..PolesDimension] by a function a(t) which is assumed to satisfy the following: 1. a(t) * F(t) is a polynomial BSpline that can be expressed exactly as a BSpline of degree NewDegree on the knots FlatKnots 2. the range of a(t) is the same as the range of F(t) Warning: it is the caller's responsibility to insure that conditions 1. and 2. above are satisfied: no check whatsoever is made in this method theStatus will return 0 if OK else it will return the pivot index of the matrix that was inverted to compute the multiplied BSpline: the method used is interpolation at Schoenenberg points of a(t)*F(t).
") FunctionMultiply;
		static void FunctionMultiply(const BSplCLib_EvaluatorFunction & Function, const int BSplineDegree, const NCollection_Array1<double> & BSplineFlatKnots, const NCollection_Array1<gp_Pnt> & Poles, const NCollection_Array1<double> & FlatKnots, const int NewDegree, NCollection_Array1<gp_Pnt> & NewPoles, Standard_Integer &OutValue);

		/****** BSplCLib::FunctionReparameterise ******/
		/****** md5 signature: 7bbe44e2badd29df3ccd8f21ef7f7288 ******/
		%feature("compactdefaultargs") FunctionReparameterise;
		%feature("autodoc", "
Parameters
----------
Function: BSplCLib_EvaluatorFunction
BSplineDegree: int
BSplineFlatKnots: NCollection_Array1<double>
PolesDimension: int
FlatKnots: NCollection_Array1<double>
NewDegree: int

Return
-------
Poles: double
NewPoles: double
theStatus: int

Description
-----------
This function will compose a given Vectorial BSpline F(t) defined by its BSplineDegree and BSplineFlatKnotsl, its Poles array which are coded as an array of Real of the form [1..NumPoles][1..PolesDimension] with a function a(t) which is assumed to satisfy the following: //! 1. F(a(t)) is a polynomial BSpline that can be expressed exactly as a BSpline of degree NewDegree on the knots FlatKnots //! 2. a(t) defines a differentiable isomorphism between the range of FlatKnots to the range of BSplineFlatKnots which is the same as the range of F(t) //! Warning: it is the caller's responsibility to insure that conditions 1. and 2. above are satisfied: no check whatsoever is made in this method //! theStatus will return 0 if OK else it will return the pivot index of the matrix that was inverted to compute the multiplied BSpline: the method used is interpolation at Schoenenberg points of F(a(t)).
") FunctionReparameterise;
		static void FunctionReparameterise(const BSplCLib_EvaluatorFunction & Function, const int BSplineDegree, const NCollection_Array1<double> & BSplineFlatKnots, const int PolesDimension, Standard_Real &OutValue, const NCollection_Array1<double> & FlatKnots, const int NewDegree, Standard_Real &OutValue, Standard_Integer &OutValue);

		/****** BSplCLib::FunctionReparameterise ******/
		/****** md5 signature: 37890e7bdb4c8885099b5440802f24af ******/
		%feature("compactdefaultargs") FunctionReparameterise;
		%feature("autodoc", "
Parameters
----------
Function: BSplCLib_EvaluatorFunction
BSplineDegree: int
BSplineFlatKnots: NCollection_Array1<double>
Poles: NCollection_Array1<double>
FlatKnots: NCollection_Array1<double>
NewDegree: int
NewPoles: NCollection_Array1<double>

Return
-------
theStatus: int

Description
-----------
This function will compose a given Vectorial BSpline F(t) defined by its BSplineDegree and BSplineFlatKnotsl, its Poles array which are coded as an array of Real of the form [1..NumPoles][1..PolesDimension] with a function a(t) which is assumed to satisfy the following: //! 1. F(a(t)) is a polynomial BSpline that can be expressed exactly as a BSpline of degree NewDegree on the knots FlatKnots //! 2. a(t) defines a differentiable isomorphism between the range of FlatKnots to the range of BSplineFlatKnots which is the same as the range of F(t) //! Warning: it is the caller's responsibility to insure that conditions 1. and 2. above are satisfied: no check whatsoever is made in this method //! theStatus will return 0 if OK else it will return the pivot index of the matrix that was inverted to compute the multiplied BSpline: the method used is interpolation at Schoenenberg points of F(a(t)).
") FunctionReparameterise;
		static void FunctionReparameterise(const BSplCLib_EvaluatorFunction & Function, const int BSplineDegree, const NCollection_Array1<double> & BSplineFlatKnots, const NCollection_Array1<double> & Poles, const NCollection_Array1<double> & FlatKnots, const int NewDegree, NCollection_Array1<double> & NewPoles, Standard_Integer &OutValue);

		/****** BSplCLib::FunctionReparameterise ******/
		/****** md5 signature: fbfd30f022d2da7f8c88588c325268ad ******/
		%feature("compactdefaultargs") FunctionReparameterise;
		%feature("autodoc", "
Parameters
----------
Function: BSplCLib_EvaluatorFunction
BSplineDegree: int
BSplineFlatKnots: NCollection_Array1<double>
Poles: NCollection_Array1<gp_Pnt>
FlatKnots: NCollection_Array1<double>
NewDegree: int
NewPoles: NCollection_Array1<gp_Pnt>

Return
-------
theStatus: int

Description
-----------
this will compose a given Vectorial BSpline F(t) defined by its BSplineDegree and BSplineFlatKnotsl, its Poles array which are coded as an array of Real of the form [1..NumPoles][1..PolesDimension] with a function a(t) which is assumed to satisfy the following: 1. F(a(t)) is a polynomial BSpline that can be expressed exactly as a BSpline of degree NewDegree on the knots FlatKnots 2. a(t) defines a differentiable isomorphism between the range of FlatKnots to the range of BSplineFlatKnots which is the same as the range of F(t) Warning: it is the caller's responsibility to insure that conditions 1. and 2. above are satisfied: no check whatsoever is made in this method theStatus will return 0 if OK else it will return the pivot index of the matrix that was inverted to compute the multiplied BSpline: the method used is interpolation at Schoenenberg points of F(a(t)).
") FunctionReparameterise;
		static void FunctionReparameterise(const BSplCLib_EvaluatorFunction & Function, const int BSplineDegree, const NCollection_Array1<double> & BSplineFlatKnots, const NCollection_Array1<gp_Pnt> & Poles, const NCollection_Array1<double> & FlatKnots, const int NewDegree, NCollection_Array1<gp_Pnt> & NewPoles, Standard_Integer &OutValue);

		/****** BSplCLib::FunctionReparameterise ******/
		/****** md5 signature: 64a3829372eeb01bf2aa1d2c3124fa09 ******/
		%feature("compactdefaultargs") FunctionReparameterise;
		%feature("autodoc", "
Parameters
----------
Function: BSplCLib_EvaluatorFunction
BSplineDegree: int
BSplineFlatKnots: NCollection_Array1<double>
Poles: NCollection_Array1<gp_Pnt2d>
FlatKnots: NCollection_Array1<double>
NewDegree: int
NewPoles: NCollection_Array1<gp_Pnt2d>

Return
-------
theStatus: int

Description
-----------
this will compose a given Vectorial BSpline F(t) defined by its BSplineDegree and BSplineFlatKnotsl, its Poles array which are coded as an array of Real of the form [1..NumPoles][1..PolesDimension] with a function a(t) which is assumed to satisfy the following: 1. F(a(t)) is a polynomial BSpline that can be expressed exactly as a BSpline of degree NewDegree on the knots FlatKnots 2. a(t) defines a differentiable isomorphism between the range of FlatKnots to the range of BSplineFlatKnots which is the same as the range of F(t) Warning: it is the caller's responsibility to insure that conditions 1. and 2. above are satisfied: no check whatsoever is made in this method theStatus will return 0 if OK else it will return the pivot index of the matrix that was inverted to compute the multiplied BSpline: the method used is interpolation at Schoenenberg points of F(a(t)).
") FunctionReparameterise;
		static void FunctionReparameterise(const BSplCLib_EvaluatorFunction & Function, const int BSplineDegree, const NCollection_Array1<double> & BSplineFlatKnots, const NCollection_Array1<gp_Pnt2d> & Poles, const NCollection_Array1<double> & FlatKnots, const int NewDegree, NCollection_Array1<gp_Pnt2d> & NewPoles, Standard_Integer &OutValue);

		/****** BSplCLib::GetPole ******/
		/****** md5 signature: 6a63cd71122a4e413ae7d4657fc60bc3 ******/
		%feature("compactdefaultargs") GetPole;
		%feature("autodoc", "
Parameters
----------
Index: int
Length: int
Depth: int
Dimension: int
Pole: NCollection_Array1<double>

Return
-------
LocPoles: double
Position: int

Description
-----------
Copy the pole at position <Index> in the Boor scheme of dimension <Dimension> to <Position> in the array <Pole>. <Position> is updated.
") GetPole;
		static void GetPole(const int Index, const int Length, const int Depth, const int Dimension, Standard_Real &OutValue, Standard_Integer &OutValue, NCollection_Array1<double> & Pole);

		/****** BSplCLib::Hunt ******/
		/****** md5 signature: e367223826eabc57a1398638bb6a04e0 ******/
		%feature("compactdefaultargs") Hunt;
		%feature("autodoc", "
Parameters
----------
theArray: NCollection_Array1<double>
theX: double

Return
-------
theXPos: int

Description
-----------
This routine searches the position of the real value theX in the monotonically increasing set of real values theArray using bisection algorithm. //! If the given value is out of range or array values, algorithm returns either theArray.Lower()-1 or theArray.Upper()+1 depending on theX position in the ordered set. //! This routine is used to locate a knot value in a set of knots.
") Hunt;
		static void Hunt(const NCollection_Array1<double> & theArray, const double theX, Standard_Integer &OutValue);

		/****** BSplCLib::IncreaseDegree ******/
		/****** md5 signature: 1e30057c388cf208eb08f6f8bab5c811 ******/
		%feature("compactdefaultargs") IncreaseDegree;
		%feature("autodoc", "
Parameters
----------
Degree: int
NewDegree: int
Periodic: bool
Dimension: int
Poles: NCollection_Array1<double>
Knots: NCollection_Array1<double>
Mults: NCollection_Array1<int>
NewPoles: NCollection_Array1<double>
NewKnots: NCollection_Array1<double>
NewMults: NCollection_Array1<int>

Return
-------
None

Description
-----------
No available documentation.
") IncreaseDegree;
		static void IncreaseDegree(const int Degree, const int NewDegree, const bool Periodic, const int Dimension, const NCollection_Array1<double> & Poles, const NCollection_Array1<double> & Knots, const NCollection_Array1<int> & Mults, NCollection_Array1<double> & NewPoles, NCollection_Array1<double> & NewKnots, NCollection_Array1<int> & NewMults);

		/****** BSplCLib::IncreaseDegree ******/
		/****** md5 signature: 8ae1a0a0d5d04a79236e80fca12fba9d ******/
		%feature("compactdefaultargs") IncreaseDegree;
		%feature("autodoc", "
Parameters
----------
Degree: int
NewDegree: int
Periodic: bool
Poles: NCollection_Array1<gp_Pnt>
Weights: NCollection_Array1<double> *
Knots: NCollection_Array1<double>
Mults: NCollection_Array1<int>
NewPoles: NCollection_Array1<gp_Pnt>
NewWeights: NCollection_Array1<double> *
NewKnots: NCollection_Array1<double>
NewMults: NCollection_Array1<int>

Return
-------
None

Description
-----------
No available documentation.
") IncreaseDegree;
		static void IncreaseDegree(const int Degree, const int NewDegree, const bool Periodic, const NCollection_Array1<gp_Pnt> & Poles, const NCollection_Array1<double> * Weights, const NCollection_Array1<double> & Knots, const NCollection_Array1<int> & Mults, NCollection_Array1<gp_Pnt> & NewPoles, NCollection_Array1<double> * NewWeights, NCollection_Array1<double> & NewKnots, NCollection_Array1<int> & NewMults);

		/****** BSplCLib::IncreaseDegree ******/
		/****** md5 signature: bd43bf7d863dd2080b8f1b6dba3b431f ******/
		%feature("compactdefaultargs") IncreaseDegree;
		%feature("autodoc", "
Parameters
----------
Degree: int
NewDegree: int
Periodic: bool
Poles: NCollection_Array1<gp_Pnt2d>
Weights: NCollection_Array1<double> *
Knots: NCollection_Array1<double>
Mults: NCollection_Array1<int>
NewPoles: NCollection_Array1<gp_Pnt2d>
NewWeights: NCollection_Array1<double> *
NewKnots: NCollection_Array1<double>
NewMults: NCollection_Array1<int>

Return
-------
None

Description
-----------
No available documentation.
") IncreaseDegree;
		static void IncreaseDegree(const int Degree, const int NewDegree, const bool Periodic, const NCollection_Array1<gp_Pnt2d> & Poles, const NCollection_Array1<double> * Weights, const NCollection_Array1<double> & Knots, const NCollection_Array1<int> & Mults, NCollection_Array1<gp_Pnt2d> & NewPoles, NCollection_Array1<double> * NewWeights, NCollection_Array1<double> & NewKnots, NCollection_Array1<int> & NewMults);

		/****** BSplCLib::IncreaseDegree ******/
		/****** md5 signature: 2d21975a117da7f9d73a1c85bb9b4be1 ******/
		%feature("compactdefaultargs") IncreaseDegree;
		%feature("autodoc", "
Parameters
----------
NewDegree: int
Poles: NCollection_Array1<gp_Pnt>
Weights: NCollection_Array1<double> *
NewPoles: NCollection_Array1<gp_Pnt>
NewWeights: NCollection_Array1<double> *

Return
-------
None

Description
-----------
No available documentation.
") IncreaseDegree;
		static void IncreaseDegree(const int NewDegree, const NCollection_Array1<gp_Pnt> & Poles, const NCollection_Array1<double> * Weights, NCollection_Array1<gp_Pnt> & NewPoles, NCollection_Array1<double> * NewWeights);

		/****** BSplCLib::IncreaseDegree ******/
		/****** md5 signature: 834654507bb0f01391eed095595d3ef5 ******/
		%feature("compactdefaultargs") IncreaseDegree;
		%feature("autodoc", "
Parameters
----------
theNewDegree: int
thePoles: NCollection_Array1<gp_Pnt2d>
theWeights: NCollection_Array1<double> *
theNewPoles: NCollection_Array1<gp_Pnt2d>
theNewWeights: NCollection_Array1<double> *

Return
-------
None

Description
-----------
Increase the degree of a bspline (or bezier) curve of dimension theDimension form theDegree to theNewDegree. //! The number of poles in the new curve is: @code Poles.Length() + (NewDegree - Degree) * Number of spans @endcode Where the number of spans is: @code LastUKnotIndex(Mults) - FirstUKnotIndex(Mults) + 1 @endcode for a non-periodic curve, and @code Knots.Length() - 1 @endcode for a periodic curve. //! The multiplicities of all knots are increased by the degree elevation. //! The new knots are usually the same knots with the exception of a non-periodic curve with the first and last multiplicity not equal to Degree+1 where knots are removed form the start and the bottom until the sum of the multiplicities is equal to NewDegree+1 at the knots corresponding to the first and last parameters of the curve. //! Example: Suppose a curve of degree 3 starting with following knots and multiplicities: @code knot: 0. 1. 2. mult: 1 2 1 @endcode //! The FirstUKnot is 2.0 because the sum of multiplicities is @code Degree+1: 1 + 2 + 1 = 4 = 3 + 1 @endcode i.e. the first parameter of the curve is 2.0 and will still be 2.0 after degree elevation. Let raise this curve to degree 4. The multiplicities are increased by 2. //! They become 2 3 2. But we need a sum of multiplicities of 5 at knot 2. So the first knot is removed and the new knots are: @code knot: 1. 2. mult: 3 2 @endcode The multiplicity of the first knot may also be reduced if the sum is still too big. //! In the most common situations (periodic curve or curve with first and last multiplicities equals to Degree+1) the knots are knot changes. //! The method IncreaseDegreeCountKnots can be used to compute the new number of knots.
") IncreaseDegree;
		static void IncreaseDegree(const int theNewDegree, const NCollection_Array1<gp_Pnt2d> & thePoles, const NCollection_Array1<double> * theWeights, NCollection_Array1<gp_Pnt2d> & theNewPoles, NCollection_Array1<double> * theNewWeights);

		/****** BSplCLib::IncreaseDegreeCountKnots ******/
		/****** md5 signature: 54576c15efdc4595a968fbc33722d8a3 ******/
		%feature("compactdefaultargs") IncreaseDegreeCountKnots;
		%feature("autodoc", "
Parameters
----------
Degree: int
NewDegree: int
Periodic: bool
Mults: NCollection_Array1<int>

Return
-------
int

Description
-----------
Returns the number of knots of a curve with multiplicities <Mults> after elevating the degree from <Degree> to <NewDegree>. See the IncreaseDegree method for more comments.
") IncreaseDegreeCountKnots;
		static int IncreaseDegreeCountKnots(const int Degree, const int NewDegree, const bool Periodic, const NCollection_Array1<int> & Mults);

		/****** BSplCLib::InsertKnot ******/
		/****** md5 signature: 351efe4f03de8fdf7a3f57573519e55b ******/
		%feature("compactdefaultargs") InsertKnot;
		%feature("autodoc", "
Parameters
----------
UIndex: int
U: double
UMult: int
Degree: int
Periodic: bool
Poles: NCollection_Array1<gp_Pnt>
Weights: NCollection_Array1<double> *
Knots: NCollection_Array1<double>
Mults: NCollection_Array1<int>
NewPoles: NCollection_Array1<gp_Pnt>
NewWeights: NCollection_Array1<double> *

Return
-------
None

Description
-----------
No available documentation.
") InsertKnot;
		static void InsertKnot(const int UIndex, const double U, const int UMult, const int Degree, const bool Periodic, const NCollection_Array1<gp_Pnt> & Poles, const NCollection_Array1<double> * Weights, const NCollection_Array1<double> & Knots, const NCollection_Array1<int> & Mults, NCollection_Array1<gp_Pnt> & NewPoles, NCollection_Array1<double> * NewWeights);

		/****** BSplCLib::InsertKnot ******/
		/****** md5 signature: 1cd9c19ec4abf34aae79c55006cad836 ******/
		%feature("compactdefaultargs") InsertKnot;
		%feature("autodoc", "
Parameters
----------
UIndex: int
U: double
UMult: int
Degree: int
Periodic: bool
Poles: NCollection_Array1<gp_Pnt2d>
Weights: NCollection_Array1<double> *
Knots: NCollection_Array1<double>
Mults: NCollection_Array1<int>
NewPoles: NCollection_Array1<gp_Pnt2d>
NewWeights: NCollection_Array1<double> *

Return
-------
None

Description
-----------
Insert a new knot U of multiplicity UMult in the knot sequence. //! The location of the new Knot should be given as an input data. UIndex locates the new knot U in the knot sequence and Knots (UIndex) < U < Knots (UIndex + 1). //! The new control points corresponding to this insertion are returned. Knots and Mults are not updated.
") InsertKnot;
		static void InsertKnot(const int UIndex, const double U, const int UMult, const int Degree, const bool Periodic, const NCollection_Array1<gp_Pnt2d> & Poles, const NCollection_Array1<double> * Weights, const NCollection_Array1<double> & Knots, const NCollection_Array1<int> & Mults, NCollection_Array1<gp_Pnt2d> & NewPoles, NCollection_Array1<double> * NewWeights);

		/****** BSplCLib::InsertKnots ******/
		/****** md5 signature: b9b7f9d993ccde102b2ab1719fe2d4f3 ******/
		%feature("compactdefaultargs") InsertKnots;
		%feature("autodoc", "
Parameters
----------
Degree: int
Periodic: bool
Dimension: int
Poles: NCollection_Array1<double>
Knots: NCollection_Array1<double>
Mults: NCollection_Array1<int>
AddKnots: NCollection_Array1<double>
AddMults: NCollection_Array1<int> *
NewPoles: NCollection_Array1<double>
NewKnots: NCollection_Array1<double>
NewMults: NCollection_Array1<int>
Epsilon: double
Add: bool (optional, default to true)

Return
-------
None

Description
-----------
No available documentation.
") InsertKnots;
		static void InsertKnots(const int Degree, const bool Periodic, const int Dimension, const NCollection_Array1<double> & Poles, const NCollection_Array1<double> & Knots, const NCollection_Array1<int> & Mults, const NCollection_Array1<double> & AddKnots, const NCollection_Array1<int> * AddMults, NCollection_Array1<double> & NewPoles, NCollection_Array1<double> & NewKnots, NCollection_Array1<int> & NewMults, const double Epsilon, const bool Add = true);

		/****** BSplCLib::InsertKnots ******/
		/****** md5 signature: 61d3a8643f95edf711bf5e759ae8628e ******/
		%feature("compactdefaultargs") InsertKnots;
		%feature("autodoc", "
Parameters
----------
Degree: int
Periodic: bool
Poles: NCollection_Array1<gp_Pnt>
Weights: NCollection_Array1<double> *
Knots: NCollection_Array1<double>
Mults: NCollection_Array1<int>
AddKnots: NCollection_Array1<double>
AddMults: NCollection_Array1<int> *
NewPoles: NCollection_Array1<gp_Pnt>
NewWeights: NCollection_Array1<double> *
NewKnots: NCollection_Array1<double>
NewMults: NCollection_Array1<int>
Epsilon: double
Add: bool (optional, default to true)

Return
-------
None

Description
-----------
No available documentation.
") InsertKnots;
		static void InsertKnots(const int Degree, const bool Periodic, const NCollection_Array1<gp_Pnt> & Poles, const NCollection_Array1<double> * Weights, const NCollection_Array1<double> & Knots, const NCollection_Array1<int> & Mults, const NCollection_Array1<double> & AddKnots, const NCollection_Array1<int> * AddMults, NCollection_Array1<gp_Pnt> & NewPoles, NCollection_Array1<double> * NewWeights, NCollection_Array1<double> & NewKnots, NCollection_Array1<int> & NewMults, const double Epsilon, const bool Add = true);

		/****** BSplCLib::InsertKnots ******/
		/****** md5 signature: 504cf1c677925385b429c7fc08de6042 ******/
		%feature("compactdefaultargs") InsertKnots;
		%feature("autodoc", "
Parameters
----------
Degree: int
Periodic: bool
Poles: NCollection_Array1<gp_Pnt2d>
Weights: NCollection_Array1<double> *
Knots: NCollection_Array1<double>
Mults: NCollection_Array1<int>
AddKnots: NCollection_Array1<double>
AddMults: NCollection_Array1<int> *
NewPoles: NCollection_Array1<gp_Pnt2d>
NewWeights: NCollection_Array1<double> *
NewKnots: NCollection_Array1<double>
NewMults: NCollection_Array1<int>
Epsilon: double
Add: bool (optional, default to true)

Return
-------
None

Description
-----------
Insert a sequence of knots <AddKnots> with multiplicities <AddMults>. <AddKnots> must be a non decreasing sequence and verifies: //! Knots(Knots.Lower()) <= AddKnots(AddKnots.Lower()) Knots(Knots.Upper()) >= AddKnots(AddKnots.Upper()) //! The NewPoles and NewWeights arrays must have a length: Poles.Length() + Sum(AddMults()) //! When a knot to insert is identic to an existing knot the multiplicities are added. //! Epsilon is used to test knots for equality. //! When AddMult is negative or null the knot is not inserted. No multiplicity will becomes higher than the degree. //! The new Knots and Multiplicities are copied in <NewKnots> and <NewMults>. //! All the New arrays should be correctly dimensioned. //! When all the new knots are existing knots, i.e. only the multiplicities will change it is safe to use the same arrays as input and output.
") InsertKnots;
		static void InsertKnots(const int Degree, const bool Periodic, const NCollection_Array1<gp_Pnt2d> & Poles, const NCollection_Array1<double> * Weights, const NCollection_Array1<double> & Knots, const NCollection_Array1<int> & Mults, const NCollection_Array1<double> & AddKnots, const NCollection_Array1<int> * AddMults, NCollection_Array1<gp_Pnt2d> & NewPoles, NCollection_Array1<double> * NewWeights, NCollection_Array1<double> & NewKnots, NCollection_Array1<int> & NewMults, const double Epsilon, const bool Add = true);

		/****** BSplCLib::Interpolate ******/
		/****** md5 signature: f409420224a74ecbaec7e017716212e5 ******/
		%feature("compactdefaultargs") Interpolate;
		%feature("autodoc", "
Parameters
----------
Degree: int
FlatKnots: NCollection_Array1<double>
Parameters: NCollection_Array1<double>
ContactOrderArray: NCollection_Array1<int>
Poles: NCollection_Array1<gp_Pnt>

Return
-------
InversionProblem: int

Description
-----------
Performs the interpolation of the data given in the Poles array according to the requests in ContactOrderArray that is: if ContactOrderArray(i) has value d it means that Poles(i) contains the dth derivative of the function to be interpolated. The length L of the following arrays must be the same: Parameters, ContactOrderArray, Poles, The length of FlatKnots is Degree + L + 1 Warning: the method used to do that interpolation is gauss elimination WITHOUT pivoting. Thus if the diagonal is not dominant there is no guarantee that the algorithm will work. Nevertheless for Cubic interpolation or interpolation at Scheonberg points the method will work The InversionProblem will report 0 if there was no problem else it will give the index of the faulty pivot.
") Interpolate;
		static void Interpolate(const int Degree, const NCollection_Array1<double> & FlatKnots, const NCollection_Array1<double> & Parameters, const NCollection_Array1<int> & ContactOrderArray, NCollection_Array1<gp_Pnt> & Poles, Standard_Integer &OutValue);

		/****** BSplCLib::Interpolate ******/
		/****** md5 signature: 4ca9cfa487e905140e8d7c5d52ba79a7 ******/
		%feature("compactdefaultargs") Interpolate;
		%feature("autodoc", "
Parameters
----------
Degree: int
FlatKnots: NCollection_Array1<double>
Parameters: NCollection_Array1<double>
ContactOrderArray: NCollection_Array1<int>
Poles: NCollection_Array1<gp_Pnt2d>

Return
-------
InversionProblem: int

Description
-----------
Performs the interpolation of the data given in the Poles array according to the requests in ContactOrderArray that is: if ContactOrderArray(i) has value d it means that Poles(i) contains the dth derivative of the function to be interpolated. The length L of the following arrays must be the same: Parameters, ContactOrderArray, Poles, The length of FlatKnots is Degree + L + 1 Warning: the method used to do that interpolation is gauss elimination WITHOUT pivoting. Thus if the diagonal is not dominant there is no guarantee that the algorithm will work. Nevertheless for Cubic interpolation at knots or interpolation at Scheonberg points the method will work. The InversionProblem will report 0 if there was no problem else it will give the index of the faulty pivot.
") Interpolate;
		static void Interpolate(const int Degree, const NCollection_Array1<double> & FlatKnots, const NCollection_Array1<double> & Parameters, const NCollection_Array1<int> & ContactOrderArray, NCollection_Array1<gp_Pnt2d> & Poles, Standard_Integer &OutValue);

		/****** BSplCLib::Interpolate ******/
		/****** md5 signature: e2df752eaef0572fb5977d568f089368 ******/
		%feature("compactdefaultargs") Interpolate;
		%feature("autodoc", "
Parameters
----------
Degree: int
FlatKnots: NCollection_Array1<double>
Parameters: NCollection_Array1<double>
ContactOrderArray: NCollection_Array1<int>
Poles: NCollection_Array1<gp_Pnt>
Weights: NCollection_Array1<double>

Return
-------
InversionProblem: int

Description
-----------
Performs the interpolation of the data given in the Poles array according to the requests in ContactOrderArray that is: if ContactOrderArray(i) has value d it means that Poles(i) contains the dth derivative of the function to be interpolated. The length L of the following arrays must be the same: Parameters, ContactOrderArray, Poles, The length of FlatKnots is Degree + L + 1 Warning: the method used to do that interpolation is gauss elimination WITHOUT pivoting. Thus if the diagonal is not dominant there is no guarantee that the algorithm will work. Nevertheless for Cubic interpolation at knots or interpolation at Scheonberg points the method will work. The InversionProblem will report 0 if there was no problem else it will give the index of the faulty pivot.
") Interpolate;
		static void Interpolate(const int Degree, const NCollection_Array1<double> & FlatKnots, const NCollection_Array1<double> & Parameters, const NCollection_Array1<int> & ContactOrderArray, NCollection_Array1<gp_Pnt> & Poles, NCollection_Array1<double> & Weights, Standard_Integer &OutValue);

		/****** BSplCLib::Interpolate ******/
		/****** md5 signature: 739983ab24ca7a1c03404f3a62b8293f ******/
		%feature("compactdefaultargs") Interpolate;
		%feature("autodoc", "
Parameters
----------
Degree: int
FlatKnots: NCollection_Array1<double>
Parameters: NCollection_Array1<double>
ContactOrderArray: NCollection_Array1<int>
Poles: NCollection_Array1<gp_Pnt2d>
Weights: NCollection_Array1<double>

Return
-------
InversionProblem: int

Description
-----------
Performs the interpolation of the data given in the Poles array according to the requests in ContactOrderArray that is: if ContactOrderArray(i) has value d it means that Poles(i) contains the dth derivative of the function to be interpolated. The length L of the following arrays must be the same: Parameters, ContactOrderArray, Poles, The length of FlatKnots is Degree + L + 1 Warning: the method used to do that interpolation is gauss elimination WITHOUT pivoting. Thus if the diagonal is not dominant there is no guarantee that the algorithm will work. Nevertheless for Cubic interpolation at knots or interpolation at Scheonberg points the method will work. The InversionProblem will report 0 if there was no problem else it will give the i.
") Interpolate;
		static void Interpolate(const int Degree, const NCollection_Array1<double> & FlatKnots, const NCollection_Array1<double> & Parameters, const NCollection_Array1<int> & ContactOrderArray, NCollection_Array1<gp_Pnt2d> & Poles, NCollection_Array1<double> & Weights, Standard_Integer &OutValue);

		/****** BSplCLib::Interpolate ******/
		/****** md5 signature: fb97a54a5ab501f529db4ffe9b9672f1 ******/
		%feature("compactdefaultargs") Interpolate;
		%feature("autodoc", "
Parameters
----------
Degree: int
FlatKnots: NCollection_Array1<double>
Parameters: NCollection_Array1<double>
ContactOrderArray: NCollection_Array1<int>
ArrayDimension: int

Return
-------
Poles: double
InversionProblem: int

Description
-----------
Performs the interpolation of the data given in the Poles array according to the requests in ContactOrderArray that is: if ContactOrderArray(i) has value d it means that Poles(i) contains the dth derivative of the function to be interpolated. The length L of the following arrays must be the same: Parameters, ContactOrderArray The length of FlatKnots is Degree + L + 1 The PolesArray is an seen as an Array[1..N][1..ArrayDimension] with N = tge length of the parameters array Warning: the method used to do that interpolation is gauss elimination WITHOUT pivoting. Thus if the diagonal is not dominant there is no guarantee that the algorithm will work. Nevertheless for Cubic interpolation or interpolation at Scheonberg points the method will work The InversionProblem will report 0 if there was no problem else it will give the index of the faulty pivot.
") Interpolate;
		static void Interpolate(const int Degree, const NCollection_Array1<double> & FlatKnots, const NCollection_Array1<double> & Parameters, const NCollection_Array1<int> & ContactOrderArray, const int ArrayDimension, Standard_Real &OutValue, Standard_Integer &OutValue);

		/****** BSplCLib::Interpolate ******/
		/****** md5 signature: 780d4515e195a1cbde334ea2e0586c51 ******/
		%feature("compactdefaultargs") Interpolate;
		%feature("autodoc", "
Parameters
----------
Degree: int
FlatKnots: NCollection_Array1<double>
Parameters: NCollection_Array1<double>
ContactOrderArray: NCollection_Array1<int>
ArrayDimension: int

Return
-------
Poles: double
Weights: double
InversionProblem: int

Description
-----------
No available documentation.
") Interpolate;
		static void Interpolate(const int Degree, const NCollection_Array1<double> & FlatKnots, const NCollection_Array1<double> & Parameters, const NCollection_Array1<int> & ContactOrderArray, const int ArrayDimension, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Integer &OutValue);

		/****** BSplCLib::Intervals ******/
		/****** md5 signature: 407b0cff97f3b0adf109f4cd54edfb99 ******/
		%feature("compactdefaultargs") Intervals;
		%feature("autodoc", "
Parameters
----------
theKnots: NCollection_Array1<double>
theMults: NCollection_Array1<int>
theDegree: int
isPeriodic: bool
theContinuity: int
theFirst: double
theLast: double
theTolerance: double
theIntervals: NCollection_Array1<double> *

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
		static int Intervals(const NCollection_Array1<double> & theKnots, const NCollection_Array1<int> & theMults, int theDegree, bool isPeriodic, int theContinuity, double theFirst, double theLast, double theTolerance, NCollection_Array1<double> * theIntervals);

		/****** BSplCLib::IsRational ******/
		/****** md5 signature: 00e4aa25a78ffed93b6064b4e0245d3a ******/
		%feature("compactdefaultargs") IsRational;
		%feature("autodoc", "
Parameters
----------
Weights: NCollection_Array1<double>
I1: int
I2: int
Epsilon: double (optional, default to 0.0)

Return
-------
bool

Description
-----------
Returns False if all the weights of the array <Weights> between I1 an I2 are identic. Epsilon is used for comparing weights. If Epsilon is 0. the Epsilon of the first weight is used.
") IsRational;
		static bool IsRational(const NCollection_Array1<double> & Weights, const int I1, const int I2, const double Epsilon = 0.0);

		/****** BSplCLib::KnotAnalysis ******/
		/****** md5 signature: 60baf5cca805bb33239510c706cdaa78 ******/
		%feature("compactdefaultargs") KnotAnalysis;
		%feature("autodoc", "
Parameters
----------
Degree: int
Periodic: bool
CKnots: NCollection_Array1<double>
CMults: NCollection_Array1<int>
KnotForm: GeomAbs_BSplKnotDistribution

Return
-------
MaxKnotMult: int

Description
-----------
Analyzes the array of knots. Returns the form and the maximum knot multiplicity.
") KnotAnalysis;
		static void KnotAnalysis(const int Degree, const bool Periodic, const NCollection_Array1<double> & CKnots, const NCollection_Array1<int> & CMults, GeomAbs_BSplKnotDistribution & KnotForm, Standard_Integer &OutValue);

		/****** BSplCLib::KnotForm ******/
		/****** md5 signature: e6f22b03260a479442cfcd1a49f536a4 ******/
		%feature("compactdefaultargs") KnotForm;
		%feature("autodoc", "
Parameters
----------
Knots: NCollection_Array1<double>
FromK1: int
ToK2: int

Return
-------
BSplCLib_KnotDistribution

Description
-----------
Analyses if the knots distribution is 'Uniform' or 'NonUniform' between the knot FromK1 and the knot ToK2. There is no repetition of knot in the knots'sequence <Knots>.
") KnotForm;
		static BSplCLib_KnotDistribution KnotForm(const NCollection_Array1<double> & Knots, const int FromK1, const int ToK2);

		/****** BSplCLib::KnotSequence ******/
		/****** md5 signature: 5befcb304afe0b45ac498b75c1628014 ******/
		%feature("compactdefaultargs") KnotSequence;
		%feature("autodoc", "
Parameters
----------
Knots: NCollection_Array1<double>
Mults: NCollection_Array1<int>
KnotSeq: NCollection_Array1<double>
Periodic: bool (optional, default to false)

Return
-------
None

Description
-----------
No available documentation.
") KnotSequence;
		static void KnotSequence(const NCollection_Array1<double> & Knots, const NCollection_Array1<int> & Mults, NCollection_Array1<double> & KnotSeq, const bool Periodic = false);

		/****** BSplCLib::KnotSequence ******/
		/****** md5 signature: 53295fa09231d0234deaf76cc6acac12 ******/
		%feature("compactdefaultargs") KnotSequence;
		%feature("autodoc", "
Parameters
----------
Knots: NCollection_Array1<double>
Mults: NCollection_Array1<int>
Degree: int
Periodic: bool
KnotSeq: NCollection_Array1<double>

Return
-------
None

Description
-----------
Computes the sequence of knots KnotSeq with repetition of the knots of multiplicity greater than 1. //! Length of KnotSeq must be KnotSequenceLength(Mults,Degree,Periodic).
") KnotSequence;
		static void KnotSequence(const NCollection_Array1<double> & Knots, const NCollection_Array1<int> & Mults, const int Degree, const bool Periodic, NCollection_Array1<double> & KnotSeq);

		/****** BSplCLib::KnotSequenceLength ******/
		/****** md5 signature: efa2328923c108d5020bc8c2bf96549a ******/
		%feature("compactdefaultargs") KnotSequenceLength;
		%feature("autodoc", "
Parameters
----------
Mults: NCollection_Array1<int>
Degree: int
Periodic: bool

Return
-------
int

Description
-----------
Returns the length of the sequence of knots with repetition. //! Periodic: //! Sum(Mults(i), i = Mults.Lower(); i <= Mults.Upper()); //! Non Periodic: //! Sum(Mults(i); i = Mults.Lower(); i < Mults.Upper()) + 2 * Degree.
") KnotSequenceLength;
		static int KnotSequenceLength(const NCollection_Array1<int> & Mults, const int Degree, const bool Periodic);

		/****** BSplCLib::Knots ******/
		/****** md5 signature: af44ac492f56adc11a854bc254f194ee ******/
		%feature("compactdefaultargs") Knots;
		%feature("autodoc", "
Parameters
----------
KnotSeq: NCollection_Array1<double>
Knots: NCollection_Array1<double>
Mults: NCollection_Array1<int>
Periodic: bool (optional, default to false)

Return
-------
None

Description
-----------
Computes the sequence of knots Knots without repetition of the knots of multiplicity greater than 1. //! Length of <Knots> and <Mults> must be KnotsLength(KnotSequence,Periodic).
") Knots;
		static void Knots(const NCollection_Array1<double> & KnotSeq, NCollection_Array1<double> & Knots, NCollection_Array1<int> & Mults, const bool Periodic = false);

		/****** BSplCLib::KnotsLength ******/
		/****** md5 signature: f40a24946ae1a69065b09adb1c711c81 ******/
		%feature("compactdefaultargs") KnotsLength;
		%feature("autodoc", "
Parameters
----------
KnotSeq: NCollection_Array1<double>
Periodic: bool (optional, default to false)

Return
-------
int

Description
-----------
Returns thelength of the sequence of knots (and Mults) without repetition.
") KnotsLength;
		static int KnotsLength(const NCollection_Array1<double> & KnotSeq, const bool Periodic = false);

		/****** BSplCLib::LastUKnotIndex ******/
		/****** md5 signature: 1b5289fbc4b6ee553c20e799545d1a30 ******/
		%feature("compactdefaultargs") LastUKnotIndex;
		%feature("autodoc", "
Parameters
----------
Degree: int
Mults: NCollection_Array1<int>

Return
-------
int

Description
-----------
Computes the index of the knots value which gives the end point of the curve.
") LastUKnotIndex;
		static int LastUKnotIndex(const int Degree, const NCollection_Array1<int> & Mults);

		/****** BSplCLib::LocateParameter ******/
		/****** md5 signature: 235a65dbddc8fcba4206d434525e022b ******/
		%feature("compactdefaultargs") LocateParameter;
		%feature("autodoc", "
Parameters
----------
Degree: int
Knots: NCollection_Array1<double>
Mults: NCollection_Array1<int>
U: double
IsPeriodic: bool
FromK1: int
ToK2: int

Return
-------
KnotIndex: int
NewU: double

Description
-----------
Locates the parametric value U in the knots sequence between the knot K1 and the knot K2. The value return in Index verifies. //! Knots(Index) <= U < Knots(Index + 1) if U <= Knots (K1) then Index = K1 if U >= Knots (K2) then Index = K2 - 1 //! If Periodic is True U may be modified to fit in the range Knots(K1), Knots(K2). In any case the correct value is returned in NewU. //! Warnings: Index is used as input data to initialize the searching function. Warning: Knots have to be 'with repetitions'.
") LocateParameter;
		static void LocateParameter(const int Degree, const NCollection_Array1<double> & Knots, const NCollection_Array1<int> & Mults, const double U, const bool IsPeriodic, const int FromK1, const int ToK2, Standard_Integer &OutValue, Standard_Real &OutValue);

		/****** BSplCLib::LocateParameter ******/
		/****** md5 signature: 27fda83f3f172e929438d4ce26868d21 ******/
		%feature("compactdefaultargs") LocateParameter;
		%feature("autodoc", "
Parameters
----------
Degree: int
Knots: NCollection_Array1<double>
U: double
IsPeriodic: bool
FromK1: int
ToK2: int

Return
-------
KnotIndex: int
NewU: double

Description
-----------
Locates the parametric value U in the knots sequence between the knot K1 and the knot K2. The value return in Index verifies. //! Knots(Index) <= U < Knots(Index + 1) if U <= Knots (K1) then Index = K1 if U >= Knots (K2) then Index = K2 - 1 //! If Periodic is True U may be modified to fit in the range Knots(K1), Knots(K2). In any case the correct value is returned in NewU. //! Warnings: Index is used as input data to initialize the searching function. Warning: Knots have to be 'flat'.
") LocateParameter;
		static void LocateParameter(const int Degree, const NCollection_Array1<double> & Knots, const double U, const bool IsPeriodic, const int FromK1, const int ToK2, Standard_Integer &OutValue, Standard_Real &OutValue);

		/****** BSplCLib::LocateParameter ******/
		/****** md5 signature: 69f47f15d5f4455717c4c3aee97bf920 ******/
		%feature("compactdefaultargs") LocateParameter;
		%feature("autodoc", "
Parameters
----------
Degree: int
Knots: NCollection_Array1<double>
Mults: NCollection_Array1<int> *
U: double
Periodic: bool

Return
-------
Index: int
NewU: double

Description
-----------
No available documentation.
") LocateParameter;
		static void LocateParameter(const int Degree, const NCollection_Array1<double> & Knots, const NCollection_Array1<int> * Mults, const double U, const bool Periodic, Standard_Integer &OutValue, Standard_Real &OutValue);

		/****** BSplCLib::MaxDegree ******/
		/****** md5 signature: 88089bb9c3b2a23c0cb823cd83b36e06 ******/
		%feature("compactdefaultargs") MaxDegree;
		%feature("autodoc", "Return
-------
int

Description
-----------
returns the degree maxima for a BSplineCurve.
") MaxDegree;
		static int MaxDegree();

		/****** BSplCLib::MaxKnotMult ******/
		/****** md5 signature: d53240d2fc66e0fdb11b5d85f8dc9579 ******/
		%feature("compactdefaultargs") MaxKnotMult;
		%feature("autodoc", "
Parameters
----------
Mults: NCollection_Array1<int>
K1: int
K2: int

Return
-------
int

Description
-----------
Finds the greatest multiplicity in a set of knots between K1 and K2. Mults is the multiplicity associated with each knot value.
") MaxKnotMult;
		static int MaxKnotMult(const NCollection_Array1<int> & Mults, const int K1, const int K2);

		/****** BSplCLib::MaxUnitWeightsSize ******/
		/****** md5 signature: 45d23fd5749328f8943a881b326ed227 ******/
		%feature("compactdefaultargs") MaxUnitWeightsSize;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the maximum number of elements supported by the pre-allocated unit weights array (2049). For sizes larger than this, UnitWeights() will allocate a new array.
") MaxUnitWeightsSize;
		static int MaxUnitWeightsSize();

		/****** BSplCLib::MergeBSplineKnots ******/
		/****** md5 signature: dc360db669c92848c3ab36e3afbfca48 ******/
		%feature("compactdefaultargs") MergeBSplineKnots;
		%feature("autodoc", "
Parameters
----------
Tolerance: double
StartValue: double
EndValue: double
Degree1: int
Knots1: NCollection_Array1<double>
Mults1: NCollection_Array1<int>
Degree2: int
Knots2: NCollection_Array1<double>
Mults2: NCollection_Array1<int>
NewKnots: NCollection_HArray1<double
NewMults: NCollection_HArray1<int

Return
-------
NumPoles: int

Description
-----------
Merges two knot vector by setting the starting and ending values to StartValue and EndValue.
") MergeBSplineKnots;
		static void MergeBSplineKnots(const double Tolerance, const double StartValue, const double EndValue, const int Degree1, const NCollection_Array1<double> & Knots1, const NCollection_Array1<int> & Mults1, const int Degree2, const NCollection_Array1<double> & Knots2, const NCollection_Array1<int> & Mults2, Standard_Integer &OutValue, opencascade::handle<NCollection_HArray1<double> > & NewKnots, opencascade::handle<NCollection_HArray1<int> > & NewMults);

		/****** BSplCLib::MinKnotMult ******/
		/****** md5 signature: f3bc91a7edf7229538a883759ecaa245 ******/
		%feature("compactdefaultargs") MinKnotMult;
		%feature("autodoc", "
Parameters
----------
Mults: NCollection_Array1<int>
K1: int
K2: int

Return
-------
int

Description
-----------
Finds the lowest multiplicity in a set of knots between K1 and K2. Mults is the multiplicity associated with each knot value.
") MinKnotMult;
		static int MinKnotMult(const NCollection_Array1<int> & Mults, const int K1, const int K2);

		/****** BSplCLib::MovePoint ******/
		/****** md5 signature: 9523abea54d085a88b244bab294b6053 ******/
		%feature("compactdefaultargs") MovePoint;
		%feature("autodoc", "
Parameters
----------
U: double
Displ: gp_Vec2d
Index1: int
Index2: int
Degree: int
Poles: NCollection_Array1<gp_Pnt2d>
Weights: NCollection_Array1<double> *
FlatKnots: NCollection_Array1<double>
NewPoles: NCollection_Array1<gp_Pnt2d>

Return
-------
FirstIndex: int
LastIndex: int

Description
-----------
Find the new poles which allows an old point (with a given <u> as parameter) to reach a new position Index1 and Index2 indicate the range of poles we can move (1, NbPoles-1) or (2, NbPoles) -> no constraint for one side don't enter (1,NbPoles) -> error: rigid move (2, NbPoles-1) -> the ends are enforced (3, NbPoles-2) -> the ends and the tangency are enforced if Problem in BSplineBasis calculation, no change for the curve and FirstIndex, LastIndex = 0.
") MovePoint;
		static void MovePoint(const double U, const gp_Vec2d & Displ, const int Index1, const int Index2, const int Degree, const NCollection_Array1<gp_Pnt2d> & Poles, const NCollection_Array1<double> * Weights, const NCollection_Array1<double> & FlatKnots, Standard_Integer &OutValue, Standard_Integer &OutValue, NCollection_Array1<gp_Pnt2d> & NewPoles);

		/****** BSplCLib::MovePoint ******/
		/****** md5 signature: 2f385a3f21f2930b3152ce40b45fd878 ******/
		%feature("compactdefaultargs") MovePoint;
		%feature("autodoc", "
Parameters
----------
U: double
Displ: gp_Vec
Index1: int
Index2: int
Degree: int
Poles: NCollection_Array1<gp_Pnt>
Weights: NCollection_Array1<double> *
FlatKnots: NCollection_Array1<double>
NewPoles: NCollection_Array1<gp_Pnt>

Return
-------
FirstIndex: int
LastIndex: int

Description
-----------
Find the new poles which allows an old point (with a given <u> as parameter) to reach a new position Index1 and Index2 indicate the range of poles we can move (1, NbPoles-1) or (2, NbPoles) -> no constraint for one side don't enter (1,NbPoles) -> error: rigid move (2, NbPoles-1) -> the ends are enforced (3, NbPoles-2) -> the ends and the tangency are enforced if Problem in BSplineBasis calculation, no change for the curve and FirstIndex, LastIndex = 0.
") MovePoint;
		static void MovePoint(const double U, const gp_Vec & Displ, const int Index1, const int Index2, const int Degree, const NCollection_Array1<gp_Pnt> & Poles, const NCollection_Array1<double> * Weights, const NCollection_Array1<double> & FlatKnots, Standard_Integer &OutValue, Standard_Integer &OutValue, NCollection_Array1<gp_Pnt> & NewPoles);

		/****** BSplCLib::MovePointAndTangent ******/
		/****** md5 signature: d064d73a2859d1ca4bce7c4337e06fa3 ******/
		%feature("compactdefaultargs") MovePointAndTangent;
		%feature("autodoc", "
Parameters
----------
U: double
ArrayDimension: int
Tolerance: double
Degree: int
StartingCondition: int
EndingCondition: int
Weights: NCollection_Array1<double> *
FlatKnots: NCollection_Array1<double>

Return
-------
Delta: double
DeltaDerivative: double
Poles: double
NewPoles: double
ErrorStatus: int

Description
-----------
This is the dimension free version of the utility U is the parameter must be within the first FlatKnots and the last FlatKnots Delta is the amount the curve has to be moved DeltaDerivative is the amount the derivative has to be moved. Delta and DeltaDerivative must be array of dimension ArrayDimension Degree is the degree of the BSpline and the FlatKnots are the knots of the BSpline Starting Condition if = -1 means the starting point of the curve can move = 0 means the starting point of the curve cannot move but tangent starting point of the curve cannot move = 1 means the starting point and tangents cannot move = 2 means the starting point tangent and curvature cannot move = ... Same holds for EndingCondition Poles are the poles of the curve Weights are the weights of the curve if not NULL NewPoles are the poles of the deformed curve ErrorStatus will be 0 if no error happened 1 if there are not enough knots/poles the imposed conditions The way to solve this problem is to add knots to the BSpline If StartCondition = 1 and EndCondition = 1 then you need at least 4 + 2 = 6 poles so for example to have a C1 cubic you will need have at least 2 internal knots.
") MovePointAndTangent;
		static void MovePointAndTangent(const double U, const int ArrayDimension, Standard_Real &OutValue, Standard_Real &OutValue, const double Tolerance, const int Degree, const int StartingCondition, const int EndingCondition, Standard_Real &OutValue, const NCollection_Array1<double> * Weights, const NCollection_Array1<double> & FlatKnots, Standard_Real &OutValue, Standard_Integer &OutValue);

		/****** BSplCLib::MovePointAndTangent ******/
		/****** md5 signature: 23023ed0ba18d3bfdd08ad0a917d8c0b ******/
		%feature("compactdefaultargs") MovePointAndTangent;
		%feature("autodoc", "
Parameters
----------
U: double
Delta: gp_Vec
DeltaDerivative: gp_Vec
Tolerance: double
Degree: int
StartingCondition: int
EndingCondition: int
Poles: NCollection_Array1<gp_Pnt>
Weights: NCollection_Array1<double> *
FlatKnots: NCollection_Array1<double>
NewPoles: NCollection_Array1<gp_Pnt>

Return
-------
ErrorStatus: int

Description
-----------
This is the dimension free version of the utility U is the parameter must be within the first FlatKnots and the last FlatKnots Delta is the amount the curve has to be moved DeltaDerivative is the amount the derivative has to be moved. Delta and DeltaDerivative must be array of dimension ArrayDimension Degree is the degree of the BSpline and the FlatKnots are the knots of the BSpline Starting Condition if = -1 means the starting point of the curve can move = 0 means the starting point of the curve cannot move but tangent starting point of the curve cannot move = 1 means the starting point and tangents cannot move = 2 means the starting point tangent and curvature cannot move = ... Same holds for EndingCondition Poles are the poles of the curve Weights are the weights of the curve if not NULL NewPoles are the poles of the deformed curve ErrorStatus will be 0 if no error happened 1 if there are not enough knots/poles the imposed conditions The way to solve this problem is to add knots to the BSpline If StartCondition = 1 and EndCondition = 1 then you need at least 4 + 2 = 6 poles so for example to have a C1 cubic you will need have at least 2 internal knots.
") MovePointAndTangent;
		static void MovePointAndTangent(const double U, const gp_Vec & Delta, const gp_Vec & DeltaDerivative, const double Tolerance, const int Degree, const int StartingCondition, const int EndingCondition, const NCollection_Array1<gp_Pnt> & Poles, const NCollection_Array1<double> * Weights, const NCollection_Array1<double> & FlatKnots, NCollection_Array1<gp_Pnt> & NewPoles, Standard_Integer &OutValue);

		/****** BSplCLib::MovePointAndTangent ******/
		/****** md5 signature: e86ace21279bc65714292e26ba607ced ******/
		%feature("compactdefaultargs") MovePointAndTangent;
		%feature("autodoc", "
Parameters
----------
U: double
Delta: gp_Vec2d
DeltaDerivative: gp_Vec2d
Tolerance: double
Degree: int
StartingCondition: int
EndingCondition: int
Poles: NCollection_Array1<gp_Pnt2d>
Weights: NCollection_Array1<double> *
FlatKnots: NCollection_Array1<double>
NewPoles: NCollection_Array1<gp_Pnt2d>

Return
-------
ErrorStatus: int

Description
-----------
This is the dimension free version of the utility U is the parameter must be within the first FlatKnots and the last FlatKnots Delta is the amount the curve has to be moved DeltaDerivative is the amount the derivative has to be moved. Delta and DeltaDerivative must be array of dimension ArrayDimension Degree is the degree of the BSpline and the FlatKnots are the knots of the BSpline Starting Condition if = -1 means the starting point of the curve can move = 0 means the starting point of the curve cannot move but tangent starting point of the curve cannot move = 1 means the starting point and tangents cannot move = 2 means the starting point tangent and curvature cannot move = ... Same holds for EndingCondition Poles are the poles of the curve Weights are the weights of the curve if not NULL NewPoles are the poles of the deformed curve ErrorStatus will be 0 if no error happened 1 if there are not enough knots/poles the imposed conditions The way to solve this problem is to add knots to the BSpline If StartCondition = 1 and EndCondition = 1 then you need at least 4 + 2 = 6 poles so for example to have a C1 cubic you will need have at least 2 internal knots.
") MovePointAndTangent;
		static void MovePointAndTangent(const double U, const gp_Vec2d & Delta, const gp_Vec2d & DeltaDerivative, const double Tolerance, const int Degree, const int StartingCondition, const int EndingCondition, const NCollection_Array1<gp_Pnt2d> & Poles, const NCollection_Array1<double> * Weights, const NCollection_Array1<double> & FlatKnots, NCollection_Array1<gp_Pnt2d> & NewPoles, Standard_Integer &OutValue);

		/****** BSplCLib::MultForm ******/
		/****** md5 signature: ae3331d77ca8825968c886b5232f2a9d ******/
		%feature("compactdefaultargs") MultForm;
		%feature("autodoc", "
Parameters
----------
Mults: NCollection_Array1<int>
FromK1: int
ToK2: int

Return
-------
BSplCLib_MultDistribution

Description
-----------
Analyses the distribution of multiplicities between the knot FromK1 and the Knot ToK2.
") MultForm;
		static BSplCLib_MultDistribution MultForm(const NCollection_Array1<int> & Mults, const int FromK1, const int ToK2);

		/****** BSplCLib::NbPoles ******/
		/****** md5 signature: ce27447dcd760658d907f394c1736653 ******/
		%feature("compactdefaultargs") NbPoles;
		%feature("autodoc", "
Parameters
----------
Degree: int
Periodic: bool
Mults: NCollection_Array1<int>

Return
-------
int

Description
-----------
Returns the number of poles of the curve. Returns 0 if one of the multiplicities is incorrect. //! * Non positive. //! * Greater than Degree, or Degree+1 at the first and last knot of a non periodic curve. //! * The last periodicity on a periodic curve is not equal to the first.
") NbPoles;
		static int NbPoles(const int Degree, const bool Periodic, const NCollection_Array1<int> & Mults);

		/****** BSplCLib::NoMults ******/
		/****** md5 signature: 201f782b460a00d724c2c12741112544 ******/
		%feature("compactdefaultargs") NoMults;
		%feature("autodoc", "Return
-------
NCollection_Array1<int> *

Description
-----------
Used as argument for a flatknots evaluation.
") NoMults;
		static NCollection_Array1<int> * NoMults();

		/****** BSplCLib::NoWeights ******/
		/****** md5 signature: 92aedb658cced8a52effdd7906442c7b ******/
		%feature("compactdefaultargs") NoWeights;
		%feature("autodoc", "Return
-------
NCollection_Array1<double> *

Description
-----------
Used as argument for a non rational curve.
") NoWeights;
		static NCollection_Array1<double> * NoWeights();

		/****** BSplCLib::PoleIndex ******/
		/****** md5 signature: 0ba166a6663046539e7e0088c969ecea ******/
		%feature("compactdefaultargs") PoleIndex;
		%feature("autodoc", "
Parameters
----------
Degree: int
Index: int
Periodic: bool
Mults: NCollection_Array1<int>

Return
-------
int

Description
-----------
Return the index of the first Pole to use on the span Mults(Index) - Mults(Index+1). This index must be added to Poles.Lower().
") PoleIndex;
		static int PoleIndex(const int Degree, const int Index, const bool Periodic, const NCollection_Array1<int> & Mults);

		/****** BSplCLib::PolesCoefficients ******/
		/****** md5 signature: 19808068b0cec1e9ca4d4682e99bdcbc ******/
		%feature("compactdefaultargs") PolesCoefficients;
		%feature("autodoc", "
Parameters
----------
Poles: NCollection_Array1<gp_Pnt2d>
CachePoles: NCollection_Array1<gp_Pnt2d>

Return
-------
None

Description
-----------
No available documentation.
") PolesCoefficients;
		static void PolesCoefficients(const NCollection_Array1<gp_Pnt2d> & Poles, NCollection_Array1<gp_Pnt2d> & CachePoles);

		/****** BSplCLib::PolesCoefficients ******/
		/****** md5 signature: 25463173aef9471e25f1c8c49ccea29c ******/
		%feature("compactdefaultargs") PolesCoefficients;
		%feature("autodoc", "
Parameters
----------
Poles: NCollection_Array1<gp_Pnt2d>
Weights: NCollection_Array1<double> *
CachePoles: NCollection_Array1<gp_Pnt2d>
CacheWeights: NCollection_Array1<double> *

Return
-------
None

Description
-----------
No available documentation.
") PolesCoefficients;
		static void PolesCoefficients(const NCollection_Array1<gp_Pnt2d> & Poles, const NCollection_Array1<double> * Weights, NCollection_Array1<gp_Pnt2d> & CachePoles, NCollection_Array1<double> * CacheWeights);

		/****** BSplCLib::PolesCoefficients ******/
		/****** md5 signature: 73318ae0c9a3d89e98b5834a0b7abbe4 ******/
		%feature("compactdefaultargs") PolesCoefficients;
		%feature("autodoc", "
Parameters
----------
Poles: NCollection_Array1<gp_Pnt>
CachePoles: NCollection_Array1<gp_Pnt>

Return
-------
None

Description
-----------
No available documentation.
") PolesCoefficients;
		static void PolesCoefficients(const NCollection_Array1<gp_Pnt> & Poles, NCollection_Array1<gp_Pnt> & CachePoles);

		/****** BSplCLib::PolesCoefficients ******/
		/****** md5 signature: 0c0a6af007f0f30391192d745c42f1b9 ******/
		%feature("compactdefaultargs") PolesCoefficients;
		%feature("autodoc", "
Parameters
----------
Poles: NCollection_Array1<gp_Pnt>
Weights: NCollection_Array1<double> *
CachePoles: NCollection_Array1<gp_Pnt>
CacheWeights: NCollection_Array1<double> *

Return
-------
None

Description
-----------
Encapsulation of BuildCache to perform the evaluation of the Taylor expansion for beziercurves at parameter 0. Warning: To be used for Beziercurves ONLY!!!.
") PolesCoefficients;
		static void PolesCoefficients(const NCollection_Array1<gp_Pnt> & Poles, const NCollection_Array1<double> * Weights, NCollection_Array1<gp_Pnt> & CachePoles, NCollection_Array1<double> * CacheWeights);

		/****** BSplCLib::PrepareInsertKnots ******/
		/****** md5 signature: fb40c888618f6d9a55af35c36a2d1eab ******/
		%feature("compactdefaultargs") PrepareInsertKnots;
		%feature("autodoc", "
Parameters
----------
Degree: int
Periodic: bool
Knots: NCollection_Array1<double>
Mults: NCollection_Array1<int>
AddKnots: NCollection_Array1<double>
AddMults: NCollection_Array1<int> *
Epsilon: double
Add: bool (optional, default to true)

Return
-------
NbPoles: int
NbKnots: int

Description
-----------
Returns in <NbPoles, NbKnots> the new number of poles and knots if the sequence of knots <AddKnots, AddMults> is inserted in the sequence <Knots, Mults>. //! Epsilon is used to compare knots for equality. //! If Add is True the multiplicities on equal knots are added. //! If Add is False the max value of the multiplicities is kept. //! Return False if: The knew knots are knot increasing. The new knots are not in the range.
") PrepareInsertKnots;
		static bool PrepareInsertKnots(const int Degree, const bool Periodic, const NCollection_Array1<double> & Knots, const NCollection_Array1<int> & Mults, const NCollection_Array1<double> & AddKnots, const NCollection_Array1<int> * AddMults, Standard_Integer &OutValue, Standard_Integer &OutValue, const double Epsilon, const bool Add = true);

		/****** BSplCLib::PrepareTrimming ******/
		/****** md5 signature: 7b0e51aad6fe7cb528eff36c2d933892 ******/
		%feature("compactdefaultargs") PrepareTrimming;
		%feature("autodoc", "
Parameters
----------
Degree: int
Periodic: bool
Knots: NCollection_Array1<double>
Mults: NCollection_Array1<int>
U1: double
U2: double

Return
-------
NbKnots: int
NbPoles: int

Description
-----------
Set in <NbKnots> and <NbPoles> the number of Knots and Poles of the curve resulting from the trimming of the BSplinecurve defined with <degree>, <knots>, <mults>.
") PrepareTrimming;
		static void PrepareTrimming(const int Degree, const bool Periodic, const NCollection_Array1<double> & Knots, const NCollection_Array1<int> & Mults, const double U1, const double U2, Standard_Integer &OutValue, Standard_Integer &OutValue);

		/****** BSplCLib::PrepareUnperiodize ******/
		/****** md5 signature: 1403796fb4781b1a777c106a72a932bb ******/
		%feature("compactdefaultargs") PrepareUnperiodize;
		%feature("autodoc", "
Parameters
----------
Degree: int
Mults: NCollection_Array1<int>

Return
-------
NbKnots: int
NbPoles: int

Description
-----------
Set in <NbKnots> and <NbPolesToAdd> the number of Knots and Poles of the NotPeriodic Curve identical at the periodic curve with a degree <Degree>, a knots-distribution with Multiplicities <Mults>.
") PrepareUnperiodize;
		static void PrepareUnperiodize(const int Degree, const NCollection_Array1<int> & Mults, Standard_Integer &OutValue, Standard_Integer &OutValue);

		/****** BSplCLib::RaiseMultiplicity ******/
		/****** md5 signature: 406b3669f49677f13bbb04ba3ee29a9c ******/
		%feature("compactdefaultargs") RaiseMultiplicity;
		%feature("autodoc", "
Parameters
----------
KnotIndex: int
Mult: int
Degree: int
Periodic: bool
Poles: NCollection_Array1<gp_Pnt>
Weights: NCollection_Array1<double> *
Knots: NCollection_Array1<double>
Mults: NCollection_Array1<int>
NewPoles: NCollection_Array1<gp_Pnt>
NewWeights: NCollection_Array1<double> *

Return
-------
None

Description
-----------
No available documentation.
") RaiseMultiplicity;
		static void RaiseMultiplicity(const int KnotIndex, const int Mult, const int Degree, const bool Periodic, const NCollection_Array1<gp_Pnt> & Poles, const NCollection_Array1<double> * Weights, const NCollection_Array1<double> & Knots, const NCollection_Array1<int> & Mults, NCollection_Array1<gp_Pnt> & NewPoles, NCollection_Array1<double> * NewWeights);

		/****** BSplCLib::RaiseMultiplicity ******/
		/****** md5 signature: 8442ffbb492558261ce873354dcf03fe ******/
		%feature("compactdefaultargs") RaiseMultiplicity;
		%feature("autodoc", "
Parameters
----------
KnotIndex: int
Mult: int
Degree: int
Periodic: bool
Poles: NCollection_Array1<gp_Pnt2d>
Weights: NCollection_Array1<double> *
Knots: NCollection_Array1<double>
Mults: NCollection_Array1<int>
NewPoles: NCollection_Array1<gp_Pnt2d>
NewWeights: NCollection_Array1<double> *

Return
-------
None

Description
-----------
Raise the multiplicity of knot to <UMult>. //! The new control points are returned. Knots and Mults are not updated.
") RaiseMultiplicity;
		static void RaiseMultiplicity(const int KnotIndex, const int Mult, const int Degree, const bool Periodic, const NCollection_Array1<gp_Pnt2d> & Poles, const NCollection_Array1<double> * Weights, const NCollection_Array1<double> & Knots, const NCollection_Array1<int> & Mults, NCollection_Array1<gp_Pnt2d> & NewPoles, NCollection_Array1<double> * NewWeights);

		/****** BSplCLib::RemoveKnot ******/
		/****** md5 signature: 02589c7f188d43b6dcb2d94b431617bc ******/
		%feature("compactdefaultargs") RemoveKnot;
		%feature("autodoc", "
Parameters
----------
Index: int
Mult: int
Degree: int
Periodic: bool
Dimension: int
Poles: NCollection_Array1<double>
Knots: NCollection_Array1<double>
Mults: NCollection_Array1<int>
NewPoles: NCollection_Array1<double>
NewKnots: NCollection_Array1<double>
NewMults: NCollection_Array1<int>
Tolerance: double

Return
-------
bool

Description
-----------
No available documentation.
") RemoveKnot;
		static bool RemoveKnot(const int Index, const int Mult, const int Degree, const bool Periodic, const int Dimension, const NCollection_Array1<double> & Poles, const NCollection_Array1<double> & Knots, const NCollection_Array1<int> & Mults, NCollection_Array1<double> & NewPoles, NCollection_Array1<double> & NewKnots, NCollection_Array1<int> & NewMults, const double Tolerance);

		/****** BSplCLib::RemoveKnot ******/
		/****** md5 signature: 9789e4e2cfdfcc0a7dd4a89850ab839a ******/
		%feature("compactdefaultargs") RemoveKnot;
		%feature("autodoc", "
Parameters
----------
Index: int
Mult: int
Degree: int
Periodic: bool
Poles: NCollection_Array1<gp_Pnt>
Weights: NCollection_Array1<double> *
Knots: NCollection_Array1<double>
Mults: NCollection_Array1<int>
NewPoles: NCollection_Array1<gp_Pnt>
NewWeights: NCollection_Array1<double> *
NewKnots: NCollection_Array1<double>
NewMults: NCollection_Array1<int>
Tolerance: double

Return
-------
bool

Description
-----------
No available documentation.
") RemoveKnot;
		static bool RemoveKnot(const int Index, const int Mult, const int Degree, const bool Periodic, const NCollection_Array1<gp_Pnt> & Poles, const NCollection_Array1<double> * Weights, const NCollection_Array1<double> & Knots, const NCollection_Array1<int> & Mults, NCollection_Array1<gp_Pnt> & NewPoles, NCollection_Array1<double> * NewWeights, NCollection_Array1<double> & NewKnots, NCollection_Array1<int> & NewMults, const double Tolerance);

		/****** BSplCLib::RemoveKnot ******/
		/****** md5 signature: bff12d670d08e4c7bb37f8e7988c5ae8 ******/
		%feature("compactdefaultargs") RemoveKnot;
		%feature("autodoc", "
Parameters
----------
Index: int
Mult: int
Degree: int
Periodic: bool
Poles: NCollection_Array1<gp_Pnt2d>
Weights: NCollection_Array1<double> *
Knots: NCollection_Array1<double>
Mults: NCollection_Array1<int>
NewPoles: NCollection_Array1<gp_Pnt2d>
NewWeights: NCollection_Array1<double> *
NewKnots: NCollection_Array1<double>
NewMults: NCollection_Array1<int>
Tolerance: double

Return
-------
bool

Description
-----------
Decrement the multiplicity of <Knots(Index)> to <Mult>. If <Mult> is null the knot is removed. //! As there are two ways to compute the new poles the midlle will be used as long as the distance is lower than Tolerance. //! If a distance is bigger than tolerance the methods returns False and the new arrays are not modified. //! A low tolerance can be used to test if the knot can be removed without modifying the curve. //! A high tolerance can be used to 'smooth' the curve.
") RemoveKnot;
		static bool RemoveKnot(const int Index, const int Mult, const int Degree, const bool Periodic, const NCollection_Array1<gp_Pnt2d> & Poles, const NCollection_Array1<double> * Weights, const NCollection_Array1<double> & Knots, const NCollection_Array1<int> & Mults, NCollection_Array1<gp_Pnt2d> & NewPoles, NCollection_Array1<double> * NewWeights, NCollection_Array1<double> & NewKnots, NCollection_Array1<int> & NewMults, const double Tolerance);

		/****** BSplCLib::Reparametrize ******/
		/****** md5 signature: 80b5061ee1013b4cbece9f91962c34fc ******/
		%feature("compactdefaultargs") Reparametrize;
		%feature("autodoc", "
Parameters
----------
U1: double
U2: double
Knots: NCollection_Array1<double>

Return
-------
None

Description
-----------
Reparametrizes a B-spline curve to [U1, U2]. The knot values are recomputed such that Knots (Lower) = U1 and Knots (Upper) = U2 but the knot form is not modified. Warnings: In the array Knots the values must be in ascending order. U1 must not be equal to U2 to avoid division by zero.
") Reparametrize;
		static void Reparametrize(const double U1, const double U2, NCollection_Array1<double> & Knots);

		/****** BSplCLib::Resolution ******/
		/****** md5 signature: f43eb0f99241ab62e54e46aa421fabe7 ******/
		%feature("compactdefaultargs") Resolution;
		%feature("autodoc", "
Parameters
----------
ArrayDimension: int
NumPoles: int
Weights: NCollection_Array1<double> *
FlatKnots: NCollection_Array1<double>
Degree: int
Tolerance3D: double

Return
-------
PolesArray: double
UTolerance: double

Description
-----------
given a tolerance in 3D space returns a tolerance in U parameter space such that all u1 and u0 in the domain of the curve f(u) | u1 - u0 | < UTolerance and we have |f (u1) - f (u0)| < Tolerance3D.
") Resolution;
		static void Resolution(Standard_Real &OutValue, const int ArrayDimension, const int NumPoles, const NCollection_Array1<double> * Weights, const NCollection_Array1<double> & FlatKnots, const int Degree, const double Tolerance3D, Standard_Real &OutValue);

		/****** BSplCLib::Resolution ******/
		/****** md5 signature: 1e280883aa90580694771ea0e9e91d08 ******/
		%feature("compactdefaultargs") Resolution;
		%feature("autodoc", "
Parameters
----------
Poles: NCollection_Array1<gp_Pnt>
Weights: NCollection_Array1<double> *
NumPoles: int
FlatKnots: NCollection_Array1<double>
Degree: int
Tolerance3D: double

Return
-------
UTolerance: double

Description
-----------
given a tolerance in 3D space returns a tolerance in U parameter space such that all u1 and u0 in the domain of the curve f(u) | u1 - u0 | < UTolerance and we have |f (u1) - f (u0)| < Tolerance3D.
") Resolution;
		static void Resolution(const NCollection_Array1<gp_Pnt> & Poles, const NCollection_Array1<double> * Weights, const int NumPoles, const NCollection_Array1<double> & FlatKnots, const int Degree, const double Tolerance3D, Standard_Real &OutValue);

		/****** BSplCLib::Resolution ******/
		/****** md5 signature: 849dc3cbd7c43768d60f9feff7171a51 ******/
		%feature("compactdefaultargs") Resolution;
		%feature("autodoc", "
Parameters
----------
Poles: NCollection_Array1<gp_Pnt2d>
Weights: NCollection_Array1<double> *
NumPoles: int
FlatKnots: NCollection_Array1<double>
Degree: int
Tolerance3D: double

Return
-------
UTolerance: double

Description
-----------
given a tolerance in 3D space returns a tolerance in U parameter space such that all u1 and u0 in the domain of the curve f(u) | u1 - u0 | < UTolerance and we have |f (u1) - f (u0)| < Tolerance3D.
") Resolution;
		static void Resolution(const NCollection_Array1<gp_Pnt2d> & Poles, const NCollection_Array1<double> * Weights, const int NumPoles, const NCollection_Array1<double> & FlatKnots, const int Degree, const double Tolerance3D, Standard_Real &OutValue);

		/****** BSplCLib::Reverse ******/
		/****** md5 signature: 96a63fde26d7b9857e76b9b836807658 ******/
		%feature("compactdefaultargs") Reverse;
		%feature("autodoc", "
Parameters
----------
Knots: NCollection_Array1<double>

Return
-------
None

Description
-----------
Reverses the array knots to become the knots sequence of the reversed curve.
") Reverse;
		static void Reverse(NCollection_Array1<double> & Knots);

		/****** BSplCLib::Reverse ******/
		/****** md5 signature: dfcaa50054603c1c8ad4d2bc7b949253 ******/
		%feature("compactdefaultargs") Reverse;
		%feature("autodoc", "
Parameters
----------
Mults: NCollection_Array1<int>

Return
-------
None

Description
-----------
Reverses the array of multiplicities.
") Reverse;
		static void Reverse(NCollection_Array1<int> & Mults);

		/****** BSplCLib::Reverse ******/
		/****** md5 signature: 90ad3f9e8b13ac6dd665fd5047137b18 ******/
		%feature("compactdefaultargs") Reverse;
		%feature("autodoc", "
Parameters
----------
Poles: NCollection_Array1<gp_Pnt>
Last: int

Return
-------
None

Description
-----------
Reverses the array of poles. Last is the index of the new first pole. On a non periodic curve last is Poles.Upper(). On a periodic curve last is //! (number of flat knots - degree - 1) //! or //! (sum of multiplicities(but for the last) + degree - 1).
") Reverse;
		static void Reverse(NCollection_Array1<gp_Pnt> & Poles, const int Last);

		/****** BSplCLib::Reverse ******/
		/****** md5 signature: 006b50d16623921c31e7871c459041ea ******/
		%feature("compactdefaultargs") Reverse;
		%feature("autodoc", "
Parameters
----------
Poles: NCollection_Array1<gp_Pnt2d>
Last: int

Return
-------
None

Description
-----------
Reverses the array of poles.
") Reverse;
		static void Reverse(NCollection_Array1<gp_Pnt2d> & Poles, const int Last);

		/****** BSplCLib::Reverse ******/
		/****** md5 signature: 76a2dba983dbe98378062e5e6c07eaf5 ******/
		%feature("compactdefaultargs") Reverse;
		%feature("autodoc", "
Parameters
----------
Weights: NCollection_Array1<double>
Last: int

Return
-------
None

Description
-----------
Reverses the array of poles.
") Reverse;
		static void Reverse(NCollection_Array1<double> & Weights, const int Last);

		/****** BSplCLib::SolveBandedSystem ******/
		/****** md5 signature: b94b18269784c6456227fb0a5dfc66bd ******/
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
Array: double

Description
-----------
This solves the system Matrix.X = B with when Matrix is factored in LU form The Array is an seen as an Array[1..N][1..ArrayDimension] with N = the rank of the matrix Matrix. The result is stored in Array when each coordinate is solved that is B is the array whose values are B[i] = Array[i][p] for each p in 1..ArrayDimension.
") SolveBandedSystem;
		static int SolveBandedSystem(const math_Matrix & Matrix, const int UpperBandWidth, const int LowerBandWidth, const int ArrayDimension, Standard_Real &OutValue);

		/****** BSplCLib::SolveBandedSystem ******/
		/****** md5 signature: e6aac904675e09a01293bd8cd7a231fb ******/
		%feature("compactdefaultargs") SolveBandedSystem;
		%feature("autodoc", "
Parameters
----------
Matrix: math_Matrix
UpperBandWidth: int
LowerBandWidth: int
Array: NCollection_Array1<gp_Pnt2d>

Return
-------
int

Description
-----------
This solves the system Matrix.X = B with when Matrix is factored in LU form The Array has the length of the rank of the matrix Matrix. The result is stored in Array when each coordinate is solved that is B is the array whose values are B[i] = Array[i][p] for each p in 1..ArrayDimension.
") SolveBandedSystem;
		static int SolveBandedSystem(const math_Matrix & Matrix, const int UpperBandWidth, const int LowerBandWidth, NCollection_Array1<gp_Pnt2d> & Array);

		/****** BSplCLib::SolveBandedSystem ******/
		/****** md5 signature: f772b838b6d3cd46d0b6369b6c5e8862 ******/
		%feature("compactdefaultargs") SolveBandedSystem;
		%feature("autodoc", "
Parameters
----------
Matrix: math_Matrix
UpperBandWidth: int
LowerBandWidth: int
Array: NCollection_Array1<gp_Pnt>

Return
-------
int

Description
-----------
This solves the system Matrix.X = B with when Matrix is factored in LU form The Array has the length of the rank of the matrix Matrix. The result is stored in Array when each coordinate is solved that is B is the array whose values are B[i] = Array[i][p] for each p in 1..ArrayDimension.
") SolveBandedSystem;
		static int SolveBandedSystem(const math_Matrix & Matrix, const int UpperBandWidth, const int LowerBandWidth, NCollection_Array1<gp_Pnt> & Array);

		/****** BSplCLib::SolveBandedSystem ******/
		/****** md5 signature: 385d8efc5adf66024d620ab1cab24997 ******/
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
Array: double
Weights: double

Description
-----------
No available documentation.
") SolveBandedSystem;
		static int SolveBandedSystem(const math_Matrix & Matrix, const int UpperBandWidth, const int LowerBandWidth, const bool HomogenousFlag, const int ArrayDimension, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** BSplCLib::SolveBandedSystem ******/
		/****** md5 signature: 26e754b0eb5006411f1c7d5e453df910 ******/
		%feature("compactdefaultargs") SolveBandedSystem;
		%feature("autodoc", "
Parameters
----------
Matrix: math_Matrix
UpperBandWidth: int
LowerBandWidth: int
HomogenousFlag: bool
Array: NCollection_Array1<gp_Pnt2d>
Weights: NCollection_Array1<double>

Return
-------
int

Description
-----------
This solves the system Matrix.X = B with when Matrix is factored in LU form The Array is an seen as an Array[1..N][1..ArrayDimension] with N = the rank of the matrix Matrix. The result is stored in Array when each coordinate is solved that is B is the array whose values are B[i] = Array[i][p] for each p in 1..ArrayDimension. If HomogeneousFlag == 0 the Poles are multiplied by the Weights upon Entry and once interpolation is carried over the result of the poles are divided by the result of the interpolation of the weights. Otherwise if HomogenousFlag == 1 the Poles and Weights are treated homogeneously that is that those are interpolated as they are and result is returned without division by the interpolated weights.
") SolveBandedSystem;
		static int SolveBandedSystem(const math_Matrix & Matrix, const int UpperBandWidth, const int LowerBandWidth, const bool HomogenousFlag, NCollection_Array1<gp_Pnt2d> & Array, NCollection_Array1<double> & Weights);

		/****** BSplCLib::SolveBandedSystem ******/
		/****** md5 signature: 3fda7081a0b8ccfe5653aa9375930c29 ******/
		%feature("compactdefaultargs") SolveBandedSystem;
		%feature("autodoc", "
Parameters
----------
Matrix: math_Matrix
UpperBandWidth: int
LowerBandWidth: int
HomogeneousFlag: bool
Array: NCollection_Array1<gp_Pnt>
Weights: NCollection_Array1<double>

Return
-------
int

Description
-----------
This solves the system Matrix.X = B with when Matrix is factored in LU form The Array is an seen as an Array[1..N][1..ArrayDimension] with N = the rank of the matrix Matrix. The result is stored in Array when each coordinate is solved that is B is the array whose values are B[i] = Array[i][p] for each p in 1..ArrayDimension If HomogeneousFlag == 0 the Poles are multiplied by the Weights upon Entry and once interpolation is carried over the result of the poles are divided by the result of the interpolation of the weights. Otherwise if HomogenousFlag == 1 the Poles and Weights are treated homogeneously that is that those are interpolated as they are and result is returned without division by the interpolated weights.
") SolveBandedSystem;
		static int SolveBandedSystem(const math_Matrix & Matrix, const int UpperBandWidth, const int LowerBandWidth, const bool HomogeneousFlag, NCollection_Array1<gp_Pnt> & Array, NCollection_Array1<double> & Weights);

		/****** BSplCLib::TangExtendToConstraint ******/
		/****** md5 signature: 72d0b825d9653a3912af646f6f3d566b ******/
		%feature("compactdefaultargs") TangExtendToConstraint;
		%feature("autodoc", "
Parameters
----------
FlatKnots: NCollection_Array1<double>
C1Coefficient: double
NumPoles: int
Dimension: int
Degree: int
ConstraintPoint: NCollection_Array1<double>
Continuity: int
After: bool

Return
-------
Poles: double
NbPolesResult: int
NbKnotsRsult: int
KnotsResult: double
PolesResult: double

Description
-----------
Extend a BSpline nD using the tangency map <C1Coefficient> is the coefficient of reparametrisation <Continuity> must be equal to 1, 2 or 3. <Degree> must be greater or equal than <Continuity> + 1. //! Warning: <KnotsResult> and <PolesResult> must be dimensioned properly.
") TangExtendToConstraint;
		static void TangExtendToConstraint(const NCollection_Array1<double> & FlatKnots, const double C1Coefficient, const int NumPoles, Standard_Real &OutValue, const int Dimension, const int Degree, const NCollection_Array1<double> & ConstraintPoint, const int Continuity, const bool After, Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** BSplCLib::Trimming ******/
		/****** md5 signature: 502a5214cd1e6f655cb857842058c9cd ******/
		%feature("compactdefaultargs") Trimming;
		%feature("autodoc", "
Parameters
----------
Degree: int
Periodic: bool
Dimension: int
Knots: NCollection_Array1<double>
Mults: NCollection_Array1<int>
Poles: NCollection_Array1<double>
U1: double
U2: double
NewKnots: NCollection_Array1<double>
NewMults: NCollection_Array1<int>
NewPoles: NCollection_Array1<double>

Return
-------
None

Description
-----------
No available documentation.
") Trimming;
		static void Trimming(const int Degree, const bool Periodic, const int Dimension, const NCollection_Array1<double> & Knots, const NCollection_Array1<int> & Mults, const NCollection_Array1<double> & Poles, const double U1, const double U2, NCollection_Array1<double> & NewKnots, NCollection_Array1<int> & NewMults, NCollection_Array1<double> & NewPoles);

		/****** BSplCLib::Trimming ******/
		/****** md5 signature: 7c654ce22eef2e3b3dcaa248555297c9 ******/
		%feature("compactdefaultargs") Trimming;
		%feature("autodoc", "
Parameters
----------
Degree: int
Periodic: bool
Knots: NCollection_Array1<double>
Mults: NCollection_Array1<int>
Poles: NCollection_Array1<gp_Pnt>
Weights: NCollection_Array1<double> *
U1: double
U2: double
NewKnots: NCollection_Array1<double>
NewMults: NCollection_Array1<int>
NewPoles: NCollection_Array1<gp_Pnt>
NewWeights: NCollection_Array1<double> *

Return
-------
None

Description
-----------
No available documentation.
") Trimming;
		static void Trimming(const int Degree, const bool Periodic, const NCollection_Array1<double> & Knots, const NCollection_Array1<int> & Mults, const NCollection_Array1<gp_Pnt> & Poles, const NCollection_Array1<double> * Weights, const double U1, const double U2, NCollection_Array1<double> & NewKnots, NCollection_Array1<int> & NewMults, NCollection_Array1<gp_Pnt> & NewPoles, NCollection_Array1<double> * NewWeights);

		/****** BSplCLib::Trimming ******/
		/****** md5 signature: 3871fa358f86f73eab8bfcca19f715b7 ******/
		%feature("compactdefaultargs") Trimming;
		%feature("autodoc", "
Parameters
----------
Degree: int
Periodic: bool
Knots: NCollection_Array1<double>
Mults: NCollection_Array1<int>
Poles: NCollection_Array1<gp_Pnt2d>
Weights: NCollection_Array1<double> *
U1: double
U2: double
NewKnots: NCollection_Array1<double>
NewMults: NCollection_Array1<int>
NewPoles: NCollection_Array1<gp_Pnt2d>
NewWeights: NCollection_Array1<double> *

Return
-------
None

Description
-----------
No available documentation.
") Trimming;
		static void Trimming(const int Degree, const bool Periodic, const NCollection_Array1<double> & Knots, const NCollection_Array1<int> & Mults, const NCollection_Array1<gp_Pnt2d> & Poles, const NCollection_Array1<double> * Weights, const double U1, const double U2, NCollection_Array1<double> & NewKnots, NCollection_Array1<int> & NewMults, NCollection_Array1<gp_Pnt2d> & NewPoles, NCollection_Array1<double> * NewWeights);

		/****** BSplCLib::UnitWeights ******/
		/****** md5 signature: 973a3666d63138060f560663338e281a ******/
		%feature("compactdefaultargs") UnitWeights;
		%feature("autodoc", "
Parameters
----------
theNbElems: int

Return
-------
NCollection_Array1<double >

Description
-----------
Returns an NCollection_Array1<double> filled with 1.0 values. If theNbElems <= MaxUnitWeightsSize(), references a pre-allocated global array (zero allocation). Otherwise, allocates a new array and fills with 1.0. @warning The returned array may reference global static memory -- do NOT modify elements. 
Input parameter: theNbElems the number of elements in the returned array 
Return: array of unit weights with bounds [1, theNbElems].
") UnitWeights;
		static NCollection_Array1<double > UnitWeights(const int theNbElems);

		/****** BSplCLib::UnitWeightsData ******/
		/****** md5 signature: 1e58cca77c2bdfd3dfaa751ce1259f62 ******/
		%feature("compactdefaultargs") UnitWeightsData;
		%feature("autodoc", "Return
-------
double *

Description
-----------
Returns a pointer to the pre-allocated unit weights static array. The array contains MaxUnitWeightsSize() elements, all equal to 1.0. @warning Do NOT modify elements through this pointer. 
Return: pointer to the first element of the static unit weights array.
") UnitWeightsData;
		static const double * UnitWeightsData();

		/****** BSplCLib::Unperiodize ******/
		/****** md5 signature: 95d6ba37a243bfd94da40ae3fd3c2457 ******/
		%feature("compactdefaultargs") Unperiodize;
		%feature("autodoc", "
Parameters
----------
Degree: int
Dimension: int
Mults: NCollection_Array1<int>
Knots: NCollection_Array1<double>
Poles: NCollection_Array1<double>
NewMults: NCollection_Array1<int>
NewKnots: NCollection_Array1<double>
NewPoles: NCollection_Array1<double>

Return
-------
None

Description
-----------
No available documentation.
") Unperiodize;
		static void Unperiodize(const int Degree, const int Dimension, const NCollection_Array1<int> & Mults, const NCollection_Array1<double> & Knots, const NCollection_Array1<double> & Poles, NCollection_Array1<int> & NewMults, NCollection_Array1<double> & NewKnots, NCollection_Array1<double> & NewPoles);

		/****** BSplCLib::Unperiodize ******/
		/****** md5 signature: 5a5abe8e7a50cfb3870abcc3adb8bb7a ******/
		%feature("compactdefaultargs") Unperiodize;
		%feature("autodoc", "
Parameters
----------
Degree: int
Mults: NCollection_Array1<int>
Knots: NCollection_Array1<double>
Poles: NCollection_Array1<gp_Pnt>
Weights: NCollection_Array1<double> *
NewMults: NCollection_Array1<int>
NewKnots: NCollection_Array1<double>
NewPoles: NCollection_Array1<gp_Pnt>
NewWeights: NCollection_Array1<double> *

Return
-------
None

Description
-----------
No available documentation.
") Unperiodize;
		static void Unperiodize(const int Degree, const NCollection_Array1<int> & Mults, const NCollection_Array1<double> & Knots, const NCollection_Array1<gp_Pnt> & Poles, const NCollection_Array1<double> * Weights, NCollection_Array1<int> & NewMults, NCollection_Array1<double> & NewKnots, NCollection_Array1<gp_Pnt> & NewPoles, NCollection_Array1<double> * NewWeights);

		/****** BSplCLib::Unperiodize ******/
		/****** md5 signature: c860d18783013ce5d77cf0679b9e1bac ******/
		%feature("compactdefaultargs") Unperiodize;
		%feature("autodoc", "
Parameters
----------
Degree: int
Mults: NCollection_Array1<int>
Knots: NCollection_Array1<double>
Poles: NCollection_Array1<gp_Pnt2d>
Weights: NCollection_Array1<double> *
NewMults: NCollection_Array1<int>
NewKnots: NCollection_Array1<double>
NewPoles: NCollection_Array1<gp_Pnt2d>
NewWeights: NCollection_Array1<double> *

Return
-------
None

Description
-----------
No available documentation.
") Unperiodize;
		static void Unperiodize(const int Degree, const NCollection_Array1<int> & Mults, const NCollection_Array1<double> & Knots, const NCollection_Array1<gp_Pnt2d> & Poles, const NCollection_Array1<double> * Weights, NCollection_Array1<int> & NewMults, NCollection_Array1<double> & NewKnots, NCollection_Array1<gp_Pnt2d> & NewPoles, NCollection_Array1<double> * NewWeights);

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
		/****** md5 signature: 273caef97bda33c63c978c1f06e6f517 ******/
		%feature("compactdefaultargs") BSplCLib_Cache;
		%feature("autodoc", "
Parameters
----------
theDegree: int
thePeriodic: bool
theFlatKnots: NCollection_Array1<double>
thePoles2d: NCollection_Array1<gp_Pnt2d>
theWeights: NCollection_Array1<double> * (optional, default to nullptr)

Return
-------
None

Description
-----------
Constructor, prepares data structures for caching values on a 2d curve. \param theDegree degree of the curve \param thePeriodic identify whether the curve is periodic \param theFlatKnots knots of Bezier/B-spline curve (with repetitions) \param thePoles2d array of poles of 2D curve \param theWeights array of weights of corresponding poles.
") BSplCLib_Cache;
		 BSplCLib_Cache(const int & theDegree, const bool & thePeriodic, const NCollection_Array1<double> & theFlatKnots, const NCollection_Array1<gp_Pnt2d> & thePoles2d, const NCollection_Array1<double> * theWeights = nullptr);

		/****** BSplCLib_Cache::BSplCLib_Cache ******/
		/****** md5 signature: 8c94c3f41b0b14f114690fb71a0fe7ff ******/
		%feature("compactdefaultargs") BSplCLib_Cache;
		%feature("autodoc", "
Parameters
----------
theDegree: int
thePeriodic: bool
theFlatKnots: NCollection_Array1<double>
thePoles: NCollection_Array1<gp_Pnt>
theWeights: NCollection_Array1<double> * (optional, default to nullptr)

Return
-------
None

Description
-----------
Constructor, prepares data structures for caching values on a 3d curve. \param theDegree degree of the curve \param thePeriodic identify whether the curve is periodic \param theFlatKnots knots of Bezier/B-spline curve (with repetitions) \param thePoles array of poles of 3D curve \param theWeights array of weights of corresponding poles.
") BSplCLib_Cache;
		 BSplCLib_Cache(const int & theDegree, const bool & thePeriodic, const NCollection_Array1<double> & theFlatKnots, const NCollection_Array1<gp_Pnt> & thePoles, const NCollection_Array1<double> * theWeights = nullptr);

		/****** BSplCLib_Cache::BuildCache ******/
		/****** md5 signature: d87b5058e425537d188232d7edc33185 ******/
		%feature("compactdefaultargs") BuildCache;
		%feature("autodoc", "
Parameters
----------
theParameter: double
theFlatKnots: NCollection_Array1<double>
thePoles2d: NCollection_Array1<gp_Pnt2d>
theWeights: NCollection_Array1<double> *

Return
-------
None

Description
-----------
Recomputes the cache data for 2D curves. Does not verify validity of the cache \param theParameter the value on the knot's axis to identify the span \param theFlatKnots knots of Bezier/B-spline curve (with repetitions) \param thePoles2d array of poles of 2D curve \param theWeights array of weights of corresponding poles.
") BuildCache;
		void BuildCache(const double & theParameter, const NCollection_Array1<double> & theFlatKnots, const NCollection_Array1<gp_Pnt2d> & thePoles2d, const NCollection_Array1<double> * theWeights);

		/****** BSplCLib_Cache::BuildCache ******/
		/****** md5 signature: d7812158414173d19f77aae37ca031aa ******/
		%feature("compactdefaultargs") BuildCache;
		%feature("autodoc", "
Parameters
----------
theParameter: double
theFlatKnots: NCollection_Array1<double>
thePoles: NCollection_Array1<gp_Pnt>
theWeights: NCollection_Array1<double> * (optional, default to nullptr)

Return
-------
None

Description
-----------
Recomputes the cache data for 3D curves. Does not verify validity of the cache \param theParameter the value on the knot's axis to identify the span \param theFlatKnots knots of Bezier/B-spline curve (with repetitions) \param thePoles array of poles of 3D curve \param theWeights array of weights of corresponding poles.
") BuildCache;
		void BuildCache(const double & theParameter, const NCollection_Array1<double> & theFlatKnots, const NCollection_Array1<gp_Pnt> & thePoles, const NCollection_Array1<double> * theWeights = nullptr);

		/****** BSplCLib_Cache::D0 ******/
		/****** md5 signature: a26533dce1d3e0742117b0c711d50d25 ******/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "
Parameters
----------
theParameter: double
thePoint: gp_Pnt2d

Return
-------
None

Description
-----------
Calculates the point on the curve in the specified parameter \param[in] theParameter parameter of calculation of the value \param[out] thePoint the result of calculation (the point on the curve).
") D0;
		void D0(const double & theParameter, gp_Pnt2d & thePoint);

		/****** BSplCLib_Cache::D0 ******/
		/****** md5 signature: 5715b45a044fc93662d63b68d27cb150 ******/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "
Parameters
----------
theParameter: double
thePoint: gp_Pnt

Return
-------
None

Description
-----------
No available documentation.
") D0;
		void D0(const double & theParameter, gp_Pnt & thePoint);

		/****** BSplCLib_Cache::D0Local ******/
		/****** md5 signature: 70207c8bc8360321ed718dc64bd2a9f2 ******/
		%feature("compactdefaultargs") D0Local;
		%feature("autodoc", "
Parameters
----------
theLocalParam: double
thePoint: gp_Pnt

Return
-------
None

Description
-----------
Calculates the 3D point using pre-computed local parameter in [0, 1] range. This bypasses periodic normalization and local parameter calculation. 
Input parameter: theLocalParam pre-computed local parameter: (Param - SpanStart) / SpanLength @param[out] thePoint the result of calculation (the point on the curve).
") D0Local;
		void D0Local(double theLocalParam, gp_Pnt & thePoint);

		/****** BSplCLib_Cache::D0Local ******/
		/****** md5 signature: e2114b18132811fdbfe451ad4ae3765f ******/
		%feature("compactdefaultargs") D0Local;
		%feature("autodoc", "
Parameters
----------
theLocalParam: double
thePoint: gp_Pnt2d

Return
-------
None

Description
-----------
Calculates the 2D point using pre-computed local parameter in [0, 1] range. This bypasses periodic normalization and local parameter calculation. 
Input parameter: theLocalParam pre-computed local parameter: (Param - SpanStart) / SpanLength @param[out] thePoint the result of calculation (the point on the curve).
") D0Local;
		void D0Local(double theLocalParam, gp_Pnt2d & thePoint);

		/****** BSplCLib_Cache::D1 ******/
		/****** md5 signature: 4ec8155eddce4fa9d1658e0308ff8473 ******/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "
Parameters
----------
theParameter: double
thePoint: gp_Pnt2d
theTangent: gp_Vec2d

Return
-------
None

Description
-----------
Calculates the point on the curve and its first derivative in the specified parameter \param[in] theParameter parameter of calculation of the value \param[out] thePoint the result of calculation (the point on the curve) \param[out] theTangent tangent vector (first derivatives) for the curve in the calculated point.
") D1;
		void D1(const double & theParameter, gp_Pnt2d & thePoint, gp_Vec2d & theTangent);

		/****** BSplCLib_Cache::D1 ******/
		/****** md5 signature: 14ec0675e5734d579aea0240ba805c95 ******/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "
Parameters
----------
theParameter: double
thePoint: gp_Pnt
theTangent: gp_Vec

Return
-------
None

Description
-----------
No available documentation.
") D1;
		void D1(const double & theParameter, gp_Pnt & thePoint, gp_Vec & theTangent);

		/****** BSplCLib_Cache::D1Local ******/
		/****** md5 signature: 69ed4f53ee7f76f6b323431bf1450bb0 ******/
		%feature("compactdefaultargs") D1Local;
		%feature("autodoc", "
Parameters
----------
theLocalParam: double
thePoint: gp_Pnt
theTangent: gp_Vec

Return
-------
None

Description
-----------
Calculates the 3D point and first derivative using pre-computed local parameter. 
Input parameter: theLocalParam pre-computed local parameter: (Param - SpanStart) / SpanLength @param[out] thePoint the point on the curve @param[out] theTangent first derivative (tangent vector).
") D1Local;
		void D1Local(double theLocalParam, gp_Pnt & thePoint, gp_Vec & theTangent);

		/****** BSplCLib_Cache::D1Local ******/
		/****** md5 signature: 87ffc3d78b063b3e95237f1307b0793c ******/
		%feature("compactdefaultargs") D1Local;
		%feature("autodoc", "
Parameters
----------
theLocalParam: double
thePoint: gp_Pnt2d
theTangent: gp_Vec2d

Return
-------
None

Description
-----------
Calculates the 2D point and first derivative using pre-computed local parameter. 
Input parameter: theLocalParam pre-computed local parameter: (Param - SpanStart) / SpanLength @param[out] thePoint the point on the curve @param[out] theTangent first derivative (tangent vector).
") D1Local;
		void D1Local(double theLocalParam, gp_Pnt2d & thePoint, gp_Vec2d & theTangent);

		/****** BSplCLib_Cache::D2 ******/
		/****** md5 signature: 8597b82558c69e73be9f9a4ddda7563f ******/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "
Parameters
----------
theParameter: double
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
		void D2(const double & theParameter, gp_Pnt2d & thePoint, gp_Vec2d & theTangent, gp_Vec2d & theCurvature);

		/****** BSplCLib_Cache::D2 ******/
		/****** md5 signature: b9b307d12ff31e808eeceb95b65a7e71 ******/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "
Parameters
----------
theParameter: double
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
		void D2(const double & theParameter, gp_Pnt & thePoint, gp_Vec & theTangent, gp_Vec & theCurvature);

		/****** BSplCLib_Cache::D2Local ******/
		/****** md5 signature: e7874d7d0bed9c5373a83f04042ab8b2 ******/
		%feature("compactdefaultargs") D2Local;
		%feature("autodoc", "
Parameters
----------
theLocalParam: double
thePoint: gp_Pnt
theTangent: gp_Vec
theCurvature: gp_Vec

Return
-------
None

Description
-----------
Calculates the 3D point, first and second derivatives using pre-computed local parameter. 
Input parameter: theLocalParam pre-computed local parameter: (Param - SpanStart) / SpanLength @param[out] thePoint the point on the curve @param[out] theTangent first derivative (tangent vector) @param[out] theCurvature second derivative (curvature vector).
") D2Local;
		void D2Local(double theLocalParam, gp_Pnt & thePoint, gp_Vec & theTangent, gp_Vec & theCurvature);

		/****** BSplCLib_Cache::D2Local ******/
		/****** md5 signature: 3f568249d6107eac1b773dd4114f1ebf ******/
		%feature("compactdefaultargs") D2Local;
		%feature("autodoc", "
Parameters
----------
theLocalParam: double
thePoint: gp_Pnt2d
theTangent: gp_Vec2d
theCurvature: gp_Vec2d

Return
-------
None

Description
-----------
Calculates the 2D point, first and second derivatives using pre-computed local parameter. 
Input parameter: theLocalParam pre-computed local parameter: (Param - SpanStart) / SpanLength @param[out] thePoint the point on the curve @param[out] theTangent first derivative (tangent vector) @param[out] theCurvature second derivative (curvature vector).
") D2Local;
		void D2Local(double theLocalParam, gp_Pnt2d & thePoint, gp_Vec2d & theTangent, gp_Vec2d & theCurvature);

		/****** BSplCLib_Cache::D3 ******/
		/****** md5 signature: 46d94b26df84bd3f18aa5d51a2fc62f1 ******/
		%feature("compactdefaultargs") D3;
		%feature("autodoc", "
Parameters
----------
theParameter: double
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
		void D3(const double & theParameter, gp_Pnt2d & thePoint, gp_Vec2d & theTangent, gp_Vec2d & theCurvature, gp_Vec2d & theTorsion);

		/****** BSplCLib_Cache::D3 ******/
		/****** md5 signature: 8f8f7d2cb2e0ff7ca31ba19581a033f1 ******/
		%feature("compactdefaultargs") D3;
		%feature("autodoc", "
Parameters
----------
theParameter: double
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
		void D3(const double & theParameter, gp_Pnt & thePoint, gp_Vec & theTangent, gp_Vec & theCurvature, gp_Vec & theTorsion);

		/****** BSplCLib_Cache::D3Local ******/
		/****** md5 signature: aa812afe67104f8c609346c89f7c58c9 ******/
		%feature("compactdefaultargs") D3Local;
		%feature("autodoc", "
Parameters
----------
theLocalParam: double
thePoint: gp_Pnt
theTangent: gp_Vec
theCurvature: gp_Vec
theTorsion: gp_Vec

Return
-------
None

Description
-----------
Calculates the 3D point, first, second and third derivatives using pre-computed local parameter. 
Input parameter: theLocalParam pre-computed local parameter: (Param - SpanStart) / SpanLength @param[out] thePoint the point on the curve @param[out] theTangent first derivative (tangent vector) @param[out] theCurvature second derivative (curvature vector) @param[out] theTorsion third derivative (torsion vector).
") D3Local;
		void D3Local(double theLocalParam, gp_Pnt & thePoint, gp_Vec & theTangent, gp_Vec & theCurvature, gp_Vec & theTorsion);

		/****** BSplCLib_Cache::D3Local ******/
		/****** md5 signature: c827d6253370fad2c734c9b2eed96a20 ******/
		%feature("compactdefaultargs") D3Local;
		%feature("autodoc", "
Parameters
----------
theLocalParam: double
thePoint: gp_Pnt2d
theTangent: gp_Vec2d
theCurvature: gp_Vec2d
theTorsion: gp_Vec2d

Return
-------
None

Description
-----------
Calculates the 2D point, first, second and third derivatives using pre-computed local parameter. 
Input parameter: theLocalParam pre-computed local parameter: (Param - SpanStart) / SpanLength @param[out] thePoint the point on the curve @param[out] theTangent first derivative (tangent vector) @param[out] theCurvature second derivative (curvature vector) @param[out] theTorsion third derivative (torsion vector).
") D3Local;
		void D3Local(double theLocalParam, gp_Pnt2d & thePoint, gp_Vec2d & theTangent, gp_Vec2d & theCurvature, gp_Vec2d & theTorsion);

		/****** BSplCLib_Cache::IsCacheValid ******/
		/****** md5 signature: e1bbb1b15bafa48eef6252ab646ec546 ******/
		%feature("compactdefaultargs") IsCacheValid;
		%feature("autodoc", "
Parameters
----------
theParameter: double

Return
-------
bool

Description
-----------
Verifies validity of the cache using flat parameter of the point \param theParameter parameter of the point placed in the span.
") IsCacheValid;
		bool IsCacheValid(double theParameter);

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
/***********************************
* class BSplCLib_EvaluatorFunction *
***********************************/
%nodefaultctor BSplCLib_EvaluatorFunction;
class BSplCLib_EvaluatorFunction {
	public:
		/****** BSplCLib_EvaluatorFunction::Evaluate ******/
		/****** md5 signature: e13c186b823299cfe2ad8c37b4231978 ******/
		%feature("compactdefaultargs") Evaluate;
		%feature("autodoc", "
Parameters
----------
theDerivativeRequest: int
theStartEnd: double *
theParameter: double

Return
-------
theResult: double
theErrorCode: int

Description
-----------
Function evaluation method to be defined by descendant.
") Evaluate;
		virtual void Evaluate(const int theDerivativeRequest, const double * theStartEnd, const double theParameter, Standard_Real &OutValue, Standard_Integer &OutValue);

};


%extend BSplCLib_EvaluatorFunction {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* python proxy for excluded classes */
%pythoncode {
@classnotwrapped
class BSplCLib_CacheParams:
	pass

}
/* end python proxy for excluded classes */
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
def bsplclib_MaxUnitWeightsSize(*args):
	return bsplclib.MaxUnitWeightsSize(*args)

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
def bsplclib_UnitWeights(*args):
	return bsplclib.UnitWeights(*args)

@deprecated
def bsplclib_UnitWeightsData(*args):
	return bsplclib.UnitWeightsData(*args)

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
