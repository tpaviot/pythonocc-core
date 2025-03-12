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
%define BSPLSLIBDOCSTRING
"BSplSLib module, see official documentation at
https://dev.opencascade.org/doc/occt-7.8.0/refman/html/package_bsplslib.html"
%enddef
%module (package="OCC.Core", docstring=BSPLSLIBDOCSTRING) BSplSLib


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
#include<BSplSLib_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<TColStd_module.hxx>
#include<TColgp_module.hxx>
#include<gp_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import TColStd.i
%import TColgp.i
%import gp.i

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
%wrap_handle(BSplSLib_Cache)
/* end handles declaration */

/* templates */
/* end templates declaration */

/* typedefs */
/* end typedefs declaration */

/*****************
* class BSplSLib *
*****************/
%rename(bsplslib) BSplSLib;
class BSplSLib {
	public:
		/****** BSplSLib::BuildCache ******/
		/****** md5 signature: b598501ca418d77ff26d5d3e7ac37474 ******/
		%feature("compactdefaultargs") BuildCache;
		%feature("autodoc", "
Parameters
----------
U: float
V: float
USpanDomain: float
VSpanDomain: float
UPeriodicFlag: bool
VPeriodicFlag: bool
UDegree: int
VDegree: int
UIndex: int
VIndex: int
UFlatKnots: TColStd_Array1OfReal
VFlatKnots: TColStd_Array1OfReal
Poles: TColgp_Array2OfPnt
Weights: TColStd_Array2OfReal *
CachePoles: TColgp_Array2OfPnt
CacheWeights: TColStd_Array2OfReal *

Return
-------
None

Description
-----------
Perform the evaluation of the Taylor expansion of the Bspline normalized between 0 and 1. If rational computes the homogeneous Taylor expansion for the numerator and stores it in CachePoles.
") BuildCache;
		static void BuildCache(const Standard_Real U, const Standard_Real V, const Standard_Real USpanDomain, const Standard_Real VSpanDomain, const Standard_Boolean UPeriodicFlag, const Standard_Boolean VPeriodicFlag, const Standard_Integer UDegree, const Standard_Integer VDegree, const Standard_Integer UIndex, const Standard_Integer VIndex, const TColStd_Array1OfReal & UFlatKnots, const TColStd_Array1OfReal & VFlatKnots, const TColgp_Array2OfPnt & Poles, const TColStd_Array2OfReal * Weights, TColgp_Array2OfPnt & CachePoles, TColStd_Array2OfReal * CacheWeights);

		/****** BSplSLib::BuildCache ******/
		/****** md5 signature: 3f0ef8a507277eb8714774f073a6d864 ******/
		%feature("compactdefaultargs") BuildCache;
		%feature("autodoc", "
Parameters
----------
theU: float
theV: float
theUSpanDomain: float
theVSpanDomain: float
theUPeriodic: bool
theVPeriodic: bool
theUDegree: int
theVDegree: int
theUIndex: int
theVIndex: int
theUFlatKnots: TColStd_Array1OfReal
theVFlatKnots: TColStd_Array1OfReal
thePoles: TColgp_Array2OfPnt
theWeights: TColStd_Array2OfReal *
theCacheArray: TColStd_Array2OfReal

Return
-------
None

Description
-----------
Perform the evaluation of the Taylor expansion of the Bspline normalized between 0 and 1. Structure of result optimized for BSplSLib_Cache.
") BuildCache;
		static void BuildCache(const Standard_Real theU, const Standard_Real theV, const Standard_Real theUSpanDomain, const Standard_Real theVSpanDomain, const Standard_Boolean theUPeriodic, const Standard_Boolean theVPeriodic, const Standard_Integer theUDegree, const Standard_Integer theVDegree, const Standard_Integer theUIndex, const Standard_Integer theVIndex, const TColStd_Array1OfReal & theUFlatKnots, const TColStd_Array1OfReal & theVFlatKnots, const TColgp_Array2OfPnt & thePoles, const TColStd_Array2OfReal * theWeights, TColStd_Array2OfReal & theCacheArray);

		/****** BSplSLib::CacheD0 ******/
		/****** md5 signature: a0d811c68d31b607d6cc258bbce37e0a ******/
		%feature("compactdefaultargs") CacheD0;
		%feature("autodoc", "
Parameters
----------
U: float
V: float
UDegree: int
VDegree: int
UCacheParameter: float
VCacheParameter: float
USpanLenght: float
VSpanLength: float
Poles: TColgp_Array2OfPnt
Weights: TColStd_Array2OfReal *
Point: gp_Pnt

Return
-------
None

Description
-----------
Perform the evaluation of the of the cache the parameter must be normalized between the 0 and 1 for the span. The Cache must be valid when calling this routine. Geom Package will insure that. and then multiplies by the weights this just evaluates the current point the CacheParameter is where the Cache was constructed the SpanLength is to normalize the polynomial in the cache to avoid bad conditioning effects.
") CacheD0;
		static void CacheD0(const Standard_Real U, const Standard_Real V, const Standard_Integer UDegree, const Standard_Integer VDegree, const Standard_Real UCacheParameter, const Standard_Real VCacheParameter, const Standard_Real USpanLenght, const Standard_Real VSpanLength, const TColgp_Array2OfPnt & Poles, const TColStd_Array2OfReal * Weights, gp_Pnt & Point);

		/****** BSplSLib::CacheD1 ******/
		/****** md5 signature: 726982fe49caf163bec8c8874147ff78 ******/
		%feature("compactdefaultargs") CacheD1;
		%feature("autodoc", "
Parameters
----------
U: float
V: float
UDegree: int
VDegree: int
UCacheParameter: float
VCacheParameter: float
USpanLenght: float
VSpanLength: float
Poles: TColgp_Array2OfPnt
Weights: TColStd_Array2OfReal *
Point: gp_Pnt
VecU: gp_Vec
VecV: gp_Vec

Return
-------
None

Description
-----------
Perform the evaluation of the of the cache the parameter must be normalized between the 0 and 1 for the span. The Cache must be valid when calling this routine. Geom Package will insure that. and then multiplies by the weights this just evaluates the current point the CacheParameter is where the Cache was constructed the SpanLength is to normalize the polynomial in the cache to avoid bad conditioning effects.
") CacheD1;
		static void CacheD1(const Standard_Real U, const Standard_Real V, const Standard_Integer UDegree, const Standard_Integer VDegree, const Standard_Real UCacheParameter, const Standard_Real VCacheParameter, const Standard_Real USpanLenght, const Standard_Real VSpanLength, const TColgp_Array2OfPnt & Poles, const TColStd_Array2OfReal * Weights, gp_Pnt & Point, gp_Vec & VecU, gp_Vec & VecV);

		/****** BSplSLib::CacheD2 ******/
		/****** md5 signature: 8c09fde09eb6aefbb6282106a539418f ******/
		%feature("compactdefaultargs") CacheD2;
		%feature("autodoc", "
Parameters
----------
U: float
V: float
UDegree: int
VDegree: int
UCacheParameter: float
VCacheParameter: float
USpanLenght: float
VSpanLength: float
Poles: TColgp_Array2OfPnt
Weights: TColStd_Array2OfReal *
Point: gp_Pnt
VecU: gp_Vec
VecV: gp_Vec
VecUU: gp_Vec
VecUV: gp_Vec
VecVV: gp_Vec

Return
-------
None

Description
-----------
Perform the evaluation of the of the cache the parameter must be normalized between the 0 and 1 for the span. The Cache must be valid when calling this routine. Geom Package will insure that. and then multiplies by the weights this just evaluates the current point the CacheParameter is where the Cache was constructed the SpanLength is to normalize the polynomial in the cache to avoid bad conditioning effects.
") CacheD2;
		static void CacheD2(const Standard_Real U, const Standard_Real V, const Standard_Integer UDegree, const Standard_Integer VDegree, const Standard_Real UCacheParameter, const Standard_Real VCacheParameter, const Standard_Real USpanLenght, const Standard_Real VSpanLength, const TColgp_Array2OfPnt & Poles, const TColStd_Array2OfReal * Weights, gp_Pnt & Point, gp_Vec & VecU, gp_Vec & VecV, gp_Vec & VecUU, gp_Vec & VecUV, gp_Vec & VecVV);

		/****** BSplSLib::CoefsD0 ******/
		/****** md5 signature: 11885fde9811857e66b919e833f6d73a ******/
		%feature("compactdefaultargs") CoefsD0;
		%feature("autodoc", "
Parameters
----------
U: float
V: float
Poles: TColgp_Array2OfPnt
Weights: TColStd_Array2OfReal *
Point: gp_Pnt

Return
-------
None

Description
-----------
Calls CacheD0 for Bezier Surfaces Arrays computed with the method PolesCoefficients. Warning: To be used for BezierSurfaces ONLY!!!.
") CoefsD0;
		static void CoefsD0(const Standard_Real U, const Standard_Real V, const TColgp_Array2OfPnt & Poles, const TColStd_Array2OfReal * Weights, gp_Pnt & Point);

		/****** BSplSLib::CoefsD1 ******/
		/****** md5 signature: 1cb2123d3f6397ed2a00635ce8e7de93 ******/
		%feature("compactdefaultargs") CoefsD1;
		%feature("autodoc", "
Parameters
----------
U: float
V: float
Poles: TColgp_Array2OfPnt
Weights: TColStd_Array2OfReal *
Point: gp_Pnt
VecU: gp_Vec
VecV: gp_Vec

Return
-------
None

Description
-----------
Calls CacheD0 for Bezier Surfaces Arrays computed with the method PolesCoefficients. Warning: To be used for BezierSurfaces ONLY!!!.
") CoefsD1;
		static void CoefsD1(const Standard_Real U, const Standard_Real V, const TColgp_Array2OfPnt & Poles, const TColStd_Array2OfReal * Weights, gp_Pnt & Point, gp_Vec & VecU, gp_Vec & VecV);

		/****** BSplSLib::CoefsD2 ******/
		/****** md5 signature: 94747ffaf723b2a3eb214fc864501474 ******/
		%feature("compactdefaultargs") CoefsD2;
		%feature("autodoc", "
Parameters
----------
U: float
V: float
Poles: TColgp_Array2OfPnt
Weights: TColStd_Array2OfReal *
Point: gp_Pnt
VecU: gp_Vec
VecV: gp_Vec
VecUU: gp_Vec
VecUV: gp_Vec
VecVV: gp_Vec

Return
-------
None

Description
-----------
Calls CacheD0 for Bezier Surfaces Arrays computed with the method PolesCoefficients. Warning: To be used for BezierSurfaces ONLY!!!.
") CoefsD2;
		static void CoefsD2(const Standard_Real U, const Standard_Real V, const TColgp_Array2OfPnt & Poles, const TColStd_Array2OfReal * Weights, gp_Pnt & Point, gp_Vec & VecU, gp_Vec & VecV, gp_Vec & VecUU, gp_Vec & VecUV, gp_Vec & VecVV);

		/****** BSplSLib::D0 ******/
		/****** md5 signature: 62aa9eb91146b63fe60c422d76080445 ******/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "
Parameters
----------
U: float
V: float
UIndex: int
VIndex: int
Poles: TColgp_Array2OfPnt
Weights: TColStd_Array2OfReal *
UKnots: TColStd_Array1OfReal
VKnots: TColStd_Array1OfReal
UMults: TColStd_Array1OfInteger *
VMults: TColStd_Array1OfInteger *
UDegree: int
VDegree: int
URat: bool
VRat: bool
UPer: bool
VPer: bool
P: gp_Pnt

Return
-------
None

Description
-----------
No available documentation.
") D0;
		static void D0(const Standard_Real U, const Standard_Real V, const Standard_Integer UIndex, const Standard_Integer VIndex, const TColgp_Array2OfPnt & Poles, const TColStd_Array2OfReal * Weights, const TColStd_Array1OfReal & UKnots, const TColStd_Array1OfReal & VKnots, const TColStd_Array1OfInteger * UMults, const TColStd_Array1OfInteger * VMults, const Standard_Integer UDegree, const Standard_Integer VDegree, const Standard_Boolean URat, const Standard_Boolean VRat, const Standard_Boolean UPer, const Standard_Boolean VPer, gp_Pnt & P);

		/****** BSplSLib::D1 ******/
		/****** md5 signature: 45477aee62278c08011619e00b883b41 ******/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "
Parameters
----------
U: float
V: float
UIndex: int
VIndex: int
Poles: TColgp_Array2OfPnt
Weights: TColStd_Array2OfReal *
UKnots: TColStd_Array1OfReal
VKnots: TColStd_Array1OfReal
UMults: TColStd_Array1OfInteger *
VMults: TColStd_Array1OfInteger *
Degree: int
VDegree: int
URat: bool
VRat: bool
UPer: bool
VPer: bool
P: gp_Pnt
Vu: gp_Vec
Vv: gp_Vec

Return
-------
None

Description
-----------
No available documentation.
") D1;
		static void D1(const Standard_Real U, const Standard_Real V, const Standard_Integer UIndex, const Standard_Integer VIndex, const TColgp_Array2OfPnt & Poles, const TColStd_Array2OfReal * Weights, const TColStd_Array1OfReal & UKnots, const TColStd_Array1OfReal & VKnots, const TColStd_Array1OfInteger * UMults, const TColStd_Array1OfInteger * VMults, const Standard_Integer Degree, const Standard_Integer VDegree, const Standard_Boolean URat, const Standard_Boolean VRat, const Standard_Boolean UPer, const Standard_Boolean VPer, gp_Pnt & P, gp_Vec & Vu, gp_Vec & Vv);

		/****** BSplSLib::D2 ******/
		/****** md5 signature: 81164840d60e28eb069e53e33b276cb4 ******/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "
Parameters
----------
U: float
V: float
UIndex: int
VIndex: int
Poles: TColgp_Array2OfPnt
Weights: TColStd_Array2OfReal *
UKnots: TColStd_Array1OfReal
VKnots: TColStd_Array1OfReal
UMults: TColStd_Array1OfInteger *
VMults: TColStd_Array1OfInteger *
UDegree: int
VDegree: int
URat: bool
VRat: bool
UPer: bool
VPer: bool
P: gp_Pnt
Vu: gp_Vec
Vv: gp_Vec
Vuu: gp_Vec
Vvv: gp_Vec
Vuv: gp_Vec

Return
-------
None

Description
-----------
No available documentation.
") D2;
		static void D2(const Standard_Real U, const Standard_Real V, const Standard_Integer UIndex, const Standard_Integer VIndex, const TColgp_Array2OfPnt & Poles, const TColStd_Array2OfReal * Weights, const TColStd_Array1OfReal & UKnots, const TColStd_Array1OfReal & VKnots, const TColStd_Array1OfInteger * UMults, const TColStd_Array1OfInteger * VMults, const Standard_Integer UDegree, const Standard_Integer VDegree, const Standard_Boolean URat, const Standard_Boolean VRat, const Standard_Boolean UPer, const Standard_Boolean VPer, gp_Pnt & P, gp_Vec & Vu, gp_Vec & Vv, gp_Vec & Vuu, gp_Vec & Vvv, gp_Vec & Vuv);

		/****** BSplSLib::D3 ******/
		/****** md5 signature: 8f6bd55d707844a103766e7f41bb7a3f ******/
		%feature("compactdefaultargs") D3;
		%feature("autodoc", "
Parameters
----------
U: float
V: float
UIndex: int
VIndex: int
Poles: TColgp_Array2OfPnt
Weights: TColStd_Array2OfReal *
UKnots: TColStd_Array1OfReal
VKnots: TColStd_Array1OfReal
UMults: TColStd_Array1OfInteger *
VMults: TColStd_Array1OfInteger *
UDegree: int
VDegree: int
URat: bool
VRat: bool
UPer: bool
VPer: bool
P: gp_Pnt
Vu: gp_Vec
Vv: gp_Vec
Vuu: gp_Vec
Vvv: gp_Vec
Vuv: gp_Vec
Vuuu: gp_Vec
Vvvv: gp_Vec
Vuuv: gp_Vec
Vuvv: gp_Vec

Return
-------
None

Description
-----------
No available documentation.
") D3;
		static void D3(const Standard_Real U, const Standard_Real V, const Standard_Integer UIndex, const Standard_Integer VIndex, const TColgp_Array2OfPnt & Poles, const TColStd_Array2OfReal * Weights, const TColStd_Array1OfReal & UKnots, const TColStd_Array1OfReal & VKnots, const TColStd_Array1OfInteger * UMults, const TColStd_Array1OfInteger * VMults, const Standard_Integer UDegree, const Standard_Integer VDegree, const Standard_Boolean URat, const Standard_Boolean VRat, const Standard_Boolean UPer, const Standard_Boolean VPer, gp_Pnt & P, gp_Vec & Vu, gp_Vec & Vv, gp_Vec & Vuu, gp_Vec & Vvv, gp_Vec & Vuv, gp_Vec & Vuuu, gp_Vec & Vvvv, gp_Vec & Vuuv, gp_Vec & Vuvv);

		/****** BSplSLib::DN ******/
		/****** md5 signature: a87dd0fc5dec21e682e690ca4d1e0cb4 ******/
		%feature("compactdefaultargs") DN;
		%feature("autodoc", "
Parameters
----------
U: float
V: float
Nu: int
Nv: int
UIndex: int
VIndex: int
Poles: TColgp_Array2OfPnt
Weights: TColStd_Array2OfReal *
UKnots: TColStd_Array1OfReal
VKnots: TColStd_Array1OfReal
UMults: TColStd_Array1OfInteger *
VMults: TColStd_Array1OfInteger *
UDegree: int
VDegree: int
URat: bool
VRat: bool
UPer: bool
VPer: bool
Vn: gp_Vec

Return
-------
None

Description
-----------
No available documentation.
") DN;
		static void DN(const Standard_Real U, const Standard_Real V, const Standard_Integer Nu, const Standard_Integer Nv, const Standard_Integer UIndex, const Standard_Integer VIndex, const TColgp_Array2OfPnt & Poles, const TColStd_Array2OfReal * Weights, const TColStd_Array1OfReal & UKnots, const TColStd_Array1OfReal & VKnots, const TColStd_Array1OfInteger * UMults, const TColStd_Array1OfInteger * VMults, const Standard_Integer UDegree, const Standard_Integer VDegree, const Standard_Boolean URat, const Standard_Boolean VRat, const Standard_Boolean UPer, const Standard_Boolean VPer, gp_Vec & Vn);

		/****** BSplSLib::FunctionMultiply ******/
		/****** md5 signature: 45abca34df2cfa28f99d3579bc8a3b9c ******/
		%feature("compactdefaultargs") FunctionMultiply;
		%feature("autodoc", "
Parameters
----------
Function: BSplSLib_EvaluatorFunction
UBSplineDegree: int
VBSplineDegree: int
UBSplineKnots: TColStd_Array1OfReal
VBSplineKnots: TColStd_Array1OfReal
UMults: TColStd_Array1OfInteger *
VMults: TColStd_Array1OfInteger *
Poles: TColgp_Array2OfPnt
Weights: TColStd_Array2OfReal *
UFlatKnots: TColStd_Array1OfReal
VFlatKnots: TColStd_Array1OfReal
UNewDegree: int
VNewDegree: int
NewNumerator: TColgp_Array2OfPnt
NewDenominator: TColStd_Array2OfReal

Return
-------
theStatus: int

Description
-----------
this will multiply a given BSpline numerator N(u,v) and denominator D(u,v) defined by its U/VBSplineDegree and U/VBSplineKnots, and U/VMults. Its Poles and Weights are arrays which are coded as array2 of the form [1..UNumPoles][1..VNumPoles] by a function a(u,v) which is assumed to satisfy the following: 1. a(u,v) * N(u,v) and a(u,v) * D(u,v) is a polynomial BSpline that can be expressed exactly as a BSpline of degree U/VNewDegree on the knots U/VFlatKnots 2. the range of a(u,v) is the same as the range of N(u,v) or D(u,v) ---Warning: it is the caller's responsibility to insure that conditions 1. and 2. above are satisfied: no check whatsoever is made in this method -- theStatus will return 0 if OK else it will return the pivot index -- of the matrix that was inverted to compute the multiplied -- BSpline: the method used is interpolation at Schoenenberg -- points of a(u,v)* N(u,v) and a(u,v) * D(u,v) theStatus will return 0 if OK else it will return the pivot index of the matrix that was inverted to compute the multiplied BSpline: the method used is interpolation at Schoenenberg points of a(u,v)*F(u,v) --.
") FunctionMultiply;
		static void FunctionMultiply(const BSplSLib_EvaluatorFunction & Function, const Standard_Integer UBSplineDegree, const Standard_Integer VBSplineDegree, const TColStd_Array1OfReal & UBSplineKnots, const TColStd_Array1OfReal & VBSplineKnots, const TColStd_Array1OfInteger * UMults, const TColStd_Array1OfInteger * VMults, const TColgp_Array2OfPnt & Poles, const TColStd_Array2OfReal * Weights, const TColStd_Array1OfReal & UFlatKnots, const TColStd_Array1OfReal & VFlatKnots, const Standard_Integer UNewDegree, const Standard_Integer VNewDegree, TColgp_Array2OfPnt & NewNumerator, TColStd_Array2OfReal & NewDenominator, Standard_Integer &OutValue);

		/****** BSplSLib::GetPoles ******/
		/****** md5 signature: 4b7d9419718ea39ec1ce8b8cf045aefc ******/
		%feature("compactdefaultargs") GetPoles;
		%feature("autodoc", "
Parameters
----------
FP: TColStd_Array1OfReal
Poles: TColgp_Array2OfPnt
UDirection: bool

Return
-------
None

Description
-----------
Get from FP the coordinates of the poles.
") GetPoles;
		static void GetPoles(const TColStd_Array1OfReal & FP, TColgp_Array2OfPnt & Poles, const Standard_Boolean UDirection);

		/****** BSplSLib::GetPoles ******/
		/****** md5 signature: 5368b56b4f2bcd48e6ca348ba72bb56f ******/
		%feature("compactdefaultargs") GetPoles;
		%feature("autodoc", "
Parameters
----------
FP: TColStd_Array1OfReal
Poles: TColgp_Array2OfPnt
Weights: TColStd_Array2OfReal
UDirection: bool

Return
-------
None

Description
-----------
Get from FP the coordinates of the poles.
") GetPoles;
		static void GetPoles(const TColStd_Array1OfReal & FP, TColgp_Array2OfPnt & Poles, TColStd_Array2OfReal & Weights, const Standard_Boolean UDirection);

		/****** BSplSLib::HomogeneousD0 ******/
		/****** md5 signature: c1464f36ca57ea65694263beff510b16 ******/
		%feature("compactdefaultargs") HomogeneousD0;
		%feature("autodoc", "
Parameters
----------
U: float
V: float
UIndex: int
VIndex: int
Poles: TColgp_Array2OfPnt
Weights: TColStd_Array2OfReal *
UKnots: TColStd_Array1OfReal
VKnots: TColStd_Array1OfReal
UMults: TColStd_Array1OfInteger *
VMults: TColStd_Array1OfInteger *
UDegree: int
VDegree: int
URat: bool
VRat: bool
UPer: bool
VPer: bool
P: gp_Pnt

Return
-------
W: float

Description
-----------
Makes an homogeneous evaluation of Poles and Weights any and returns in P the Numerator value and in W the Denominator value if Weights are present otherwise returns 1.0e0.
") HomogeneousD0;
		static void HomogeneousD0(const Standard_Real U, const Standard_Real V, const Standard_Integer UIndex, const Standard_Integer VIndex, const TColgp_Array2OfPnt & Poles, const TColStd_Array2OfReal * Weights, const TColStd_Array1OfReal & UKnots, const TColStd_Array1OfReal & VKnots, const TColStd_Array1OfInteger * UMults, const TColStd_Array1OfInteger * VMults, const Standard_Integer UDegree, const Standard_Integer VDegree, const Standard_Boolean URat, const Standard_Boolean VRat, const Standard_Boolean UPer, const Standard_Boolean VPer, Standard_Real &OutValue, gp_Pnt & P);

		/****** BSplSLib::HomogeneousD1 ******/
		/****** md5 signature: b5575b9030b6a4dbac54e2abef295d93 ******/
		%feature("compactdefaultargs") HomogeneousD1;
		%feature("autodoc", "
Parameters
----------
U: float
V: float
UIndex: int
VIndex: int
Poles: TColgp_Array2OfPnt
Weights: TColStd_Array2OfReal *
UKnots: TColStd_Array1OfReal
VKnots: TColStd_Array1OfReal
UMults: TColStd_Array1OfInteger *
VMults: TColStd_Array1OfInteger *
UDegree: int
VDegree: int
URat: bool
VRat: bool
UPer: bool
VPer: bool
N: gp_Pnt
Nu: gp_Vec
Nv: gp_Vec

Return
-------
D: float
Du: float
Dv: float

Description
-----------
Makes an homogeneous evaluation of Poles and Weights any and returns in P the Numerator value and in W the Denominator value if Weights are present otherwise returns 1.0e0.
") HomogeneousD1;
		static void HomogeneousD1(const Standard_Real U, const Standard_Real V, const Standard_Integer UIndex, const Standard_Integer VIndex, const TColgp_Array2OfPnt & Poles, const TColStd_Array2OfReal * Weights, const TColStd_Array1OfReal & UKnots, const TColStd_Array1OfReal & VKnots, const TColStd_Array1OfInteger * UMults, const TColStd_Array1OfInteger * VMults, const Standard_Integer UDegree, const Standard_Integer VDegree, const Standard_Boolean URat, const Standard_Boolean VRat, const Standard_Boolean UPer, const Standard_Boolean VPer, gp_Pnt & N, gp_Vec & Nu, gp_Vec & Nv, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** BSplSLib::IncreaseDegree ******/
		/****** md5 signature: e662fc7ecac81af296838d57eaa19707 ******/
		%feature("compactdefaultargs") IncreaseDegree;
		%feature("autodoc", "
Parameters
----------
UDirection: bool
Degree: int
NewDegree: int
Periodic: bool
Poles: TColgp_Array2OfPnt
Weights: TColStd_Array2OfReal *
Knots: TColStd_Array1OfReal
Mults: TColStd_Array1OfInteger
NewPoles: TColgp_Array2OfPnt
NewWeights: TColStd_Array2OfReal *
NewKnots: TColStd_Array1OfReal
NewMults: TColStd_Array1OfInteger

Return
-------
None

Description
-----------
No available documentation.
") IncreaseDegree;
		static void IncreaseDegree(const Standard_Boolean UDirection, const Standard_Integer Degree, const Standard_Integer NewDegree, const Standard_Boolean Periodic, const TColgp_Array2OfPnt & Poles, const TColStd_Array2OfReal * Weights, const TColStd_Array1OfReal & Knots, const TColStd_Array1OfInteger & Mults, TColgp_Array2OfPnt & NewPoles, TColStd_Array2OfReal * NewWeights, TColStd_Array1OfReal & NewKnots, TColStd_Array1OfInteger & NewMults);

		/****** BSplSLib::InsertKnots ******/
		/****** md5 signature: a4b0ae1cc503e9e34d176066d51bb1cd ******/
		%feature("compactdefaultargs") InsertKnots;
		%feature("autodoc", "
Parameters
----------
UDirection: bool
Degree: int
Periodic: bool
Poles: TColgp_Array2OfPnt
Weights: TColStd_Array2OfReal *
Knots: TColStd_Array1OfReal
Mults: TColStd_Array1OfInteger
AddKnots: TColStd_Array1OfReal
AddMults: TColStd_Array1OfInteger *
NewPoles: TColgp_Array2OfPnt
NewWeights: TColStd_Array2OfReal *
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
		static void InsertKnots(const Standard_Boolean UDirection, const Standard_Integer Degree, const Standard_Boolean Periodic, const TColgp_Array2OfPnt & Poles, const TColStd_Array2OfReal * Weights, const TColStd_Array1OfReal & Knots, const TColStd_Array1OfInteger & Mults, const TColStd_Array1OfReal & AddKnots, const TColStd_Array1OfInteger * AddMults, TColgp_Array2OfPnt & NewPoles, TColStd_Array2OfReal * NewWeights, TColStd_Array1OfReal & NewKnots, TColStd_Array1OfInteger & NewMults, const Standard_Real Epsilon, const Standard_Boolean Add = Standard_True);

		/****** BSplSLib::Interpolate ******/
		/****** md5 signature: 0867844694d48835dc15751d35a365fc ******/
		%feature("compactdefaultargs") Interpolate;
		%feature("autodoc", "
Parameters
----------
UDegree: int
VDegree: int
UFlatKnots: TColStd_Array1OfReal
VFlatKnots: TColStd_Array1OfReal
UParameters: TColStd_Array1OfReal
VParameters: TColStd_Array1OfReal
Poles: TColgp_Array2OfPnt
Weights: TColStd_Array2OfReal

Return
-------
InversionProblem: int

Description
-----------
Performs the interpolation of the data points given in the Poles array in the form [1,...,RL][1,...,RC][1...PolesDimension] . The ColLength CL and the Length of UParameters must be the same. The length of VFlatKnots is VDegree + CL + 1. //! The RowLength RL and the Length of VParameters must be the same. The length of VFlatKnots is Degree + RL + 1. //! Warning: the method used to do that interpolation is gauss elimination WITHOUT pivoting. Thus if the diagonal is not dominant there is no guarantee that the algorithm will work. Nevertheless for Cubic interpolation at knots or interpolation at Scheonberg points the method will work. The InversionProblem will report 0 if there was no problem else it will give the index of the faulty pivot.
") Interpolate;
		static void Interpolate(const Standard_Integer UDegree, const Standard_Integer VDegree, const TColStd_Array1OfReal & UFlatKnots, const TColStd_Array1OfReal & VFlatKnots, const TColStd_Array1OfReal & UParameters, const TColStd_Array1OfReal & VParameters, TColgp_Array2OfPnt & Poles, TColStd_Array2OfReal & Weights, Standard_Integer &OutValue);

		/****** BSplSLib::Interpolate ******/
		/****** md5 signature: e9a7486732129ef41a89f7390fb7aaad ******/
		%feature("compactdefaultargs") Interpolate;
		%feature("autodoc", "
Parameters
----------
UDegree: int
VDegree: int
UFlatKnots: TColStd_Array1OfReal
VFlatKnots: TColStd_Array1OfReal
UParameters: TColStd_Array1OfReal
VParameters: TColStd_Array1OfReal
Poles: TColgp_Array2OfPnt

Return
-------
InversionProblem: int

Description
-----------
Performs the interpolation of the data points given in the Poles array. The ColLength CL and the Length of UParameters must be the same. The length of VFlatKnots is VDegree + CL + 1. //! The RowLength RL and the Length of VParameters must be the same. The length of VFlatKnots is Degree + RL + 1. //! Warning: the method used to do that interpolation is gauss elimination WITHOUT pivoting. Thus if the diagonal is not dominant there is no guarantee that the algorithm will work. Nevertheless for Cubic interpolation at knots or interpolation at Scheonberg points the method will work. The InversionProblem will report 0 if there was no problem else it will give the index of the faulty pivot.
") Interpolate;
		static void Interpolate(const Standard_Integer UDegree, const Standard_Integer VDegree, const TColStd_Array1OfReal & UFlatKnots, const TColStd_Array1OfReal & VFlatKnots, const TColStd_Array1OfReal & UParameters, const TColStd_Array1OfReal & VParameters, TColgp_Array2OfPnt & Poles, Standard_Integer &OutValue);

		/****** BSplSLib::IsRational ******/
		/****** md5 signature: 238ad45424fe7f4d227ac0cccdabfdf1 ******/
		%feature("compactdefaultargs") IsRational;
		%feature("autodoc", "
Parameters
----------
Weights: TColStd_Array2OfReal
I1: int
I2: int
J1: int
J2: int
Epsilon: float (optional, default to 0.0)

Return
-------
bool

Description
-----------
Returns False if all the weights of the array <Weights> in the area [I1,I2] * [J1,J2] are identic. Epsilon is used for comparing weights. If Epsilon is 0. the Epsilon of the first weight is used.
") IsRational;
		static Standard_Boolean IsRational(const TColStd_Array2OfReal & Weights, const Standard_Integer I1, const Standard_Integer I2, const Standard_Integer J1, const Standard_Integer J2, const Standard_Real Epsilon = 0.0);

		/****** BSplSLib::Iso ******/
		/****** md5 signature: 9e1124a641ae0d2850d147558b0e1be9 ******/
		%feature("compactdefaultargs") Iso;
		%feature("autodoc", "
Parameters
----------
Param: float
IsU: bool
Poles: TColgp_Array2OfPnt
Weights: TColStd_Array2OfReal *
Knots: TColStd_Array1OfReal
Mults: TColStd_Array1OfInteger *
Degree: int
Periodic: bool
CPoles: TColgp_Array1OfPnt
CWeights: TColStd_Array1OfReal *

Return
-------
None

Description
-----------
Computes the poles and weights of an isoparametric curve at parameter <Param> (UIso if <IsU> is True, VIso else).
") Iso;
		static void Iso(const Standard_Real Param, const Standard_Boolean IsU, const TColgp_Array2OfPnt & Poles, const TColStd_Array2OfReal * Weights, const TColStd_Array1OfReal & Knots, const TColStd_Array1OfInteger * Mults, const Standard_Integer Degree, const Standard_Boolean Periodic, TColgp_Array1OfPnt & CPoles, TColStd_Array1OfReal * CWeights);

		/****** BSplSLib::MovePoint ******/
		/****** md5 signature: 5f7743a036a141c9b8c4be1ccab23031 ******/
		%feature("compactdefaultargs") MovePoint;
		%feature("autodoc", "
Parameters
----------
U: float
V: float
Displ: gp_Vec
UIndex1: int
UIndex2: int
VIndex1: int
VIndex2: int
UDegree: int
VDegree: int
Rational: bool
Poles: TColgp_Array2OfPnt
Weights: TColStd_Array2OfReal
UFlatKnots: TColStd_Array1OfReal
VFlatKnots: TColStd_Array1OfReal
NewPoles: TColgp_Array2OfPnt

Return
-------
UFirstIndex: int
ULastIndex: int
VFirstIndex: int
VLastIndex: int

Description
-----------
Find the new poles which allows an old point (with a given u,v as parameters) to reach a new position UIndex1,UIndex2 indicate the range of poles we can move for U (1, UNbPoles-1) or (2, UNbPoles) -> no constraint for one side in U (2, UNbPoles-1) -> the ends are enforced for U don't enter (1,NbPoles) and (1,VNbPoles) -> error: rigid move if problem in BSplineBasis calculation, no change for the curve and UFirstIndex, VLastIndex = 0 VFirstIndex, VLastIndex = 0.
") MovePoint;
		static void MovePoint(const Standard_Real U, const Standard_Real V, const gp_Vec & Displ, const Standard_Integer UIndex1, const Standard_Integer UIndex2, const Standard_Integer VIndex1, const Standard_Integer VIndex2, const Standard_Integer UDegree, const Standard_Integer VDegree, const Standard_Boolean Rational, const TColgp_Array2OfPnt & Poles, const TColStd_Array2OfReal & Weights, const TColStd_Array1OfReal & UFlatKnots, const TColStd_Array1OfReal & VFlatKnots, Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue, TColgp_Array2OfPnt & NewPoles);

		/****** BSplSLib::NoWeights ******/
		/****** md5 signature: bbbdcbded0a182bef34c5ef8a588d7ad ******/
		%feature("compactdefaultargs") NoWeights;
		%feature("autodoc", "Return
-------
TColStd_Array2OfReal *

Description
-----------
Used as argument for a non rational curve.
") NoWeights;
		static TColStd_Array2OfReal * NoWeights();

		/****** BSplSLib::PolesCoefficients ******/
		/****** md5 signature: 65463c1f1f25e0a57953fd3f9ed494d8 ******/
		%feature("compactdefaultargs") PolesCoefficients;
		%feature("autodoc", "
Parameters
----------
Poles: TColgp_Array2OfPnt
CachePoles: TColgp_Array2OfPnt

Return
-------
None

Description
-----------
Warning! To be used for BezierSurfaces ONLY!!!.
") PolesCoefficients;
		static void PolesCoefficients(const TColgp_Array2OfPnt & Poles, TColgp_Array2OfPnt & CachePoles);

		/****** BSplSLib::PolesCoefficients ******/
		/****** md5 signature: 22743faa22774391b4fee45051eb0d44 ******/
		%feature("compactdefaultargs") PolesCoefficients;
		%feature("autodoc", "
Parameters
----------
Poles: TColgp_Array2OfPnt
Weights: TColStd_Array2OfReal *
CachePoles: TColgp_Array2OfPnt
CacheWeights: TColStd_Array2OfReal *

Return
-------
None

Description
-----------
Encapsulation of BuildCache to perform the evaluation of the Taylor expansion for beziersurfaces at parameters 0.,0.; Warning: To be used for BezierSurfaces ONLY!!!.
") PolesCoefficients;
		static void PolesCoefficients(const TColgp_Array2OfPnt & Poles, const TColStd_Array2OfReal * Weights, TColgp_Array2OfPnt & CachePoles, TColStd_Array2OfReal * CacheWeights);

		/****** BSplSLib::RationalDerivative ******/
		/****** md5 signature: 3e4a753d2a8aa1e4a38e26bfc421f4e9 ******/
		%feature("compactdefaultargs") RationalDerivative;
		%feature("autodoc", "
Parameters
----------
UDeg: int
VDeg: int
N: int
M: int
All: bool (optional, default to Standard_True)

Return
-------
Ders: float
RDers: float

Description
-----------
this is a one dimensional function typedef void (*EvaluatorFunction) ( Standard_Integer // Derivative Request Standard_Real * // StartEnd[2][2] // [0] = U // [1] = V // [0] = start // [1] = end Standard_Real // UParameter Standard_Real // VParamerer Standard_Real & // Result Standard_Integer &) ;// Error Code serves to multiply a given vectorial BSpline by a function Computes the derivatives of a ratio of two-variables functions x(u,v) / w(u,v) at orders <N,M>, x(u,v) is a vector in dimension <3>. //! <Ders> is an array containing the values of the input derivatives from 0 to Min(<N>,<UDeg>), 0 to Min(<M>,<VDeg>). For orders higher than <UDeg,VDeg> the input derivatives are assumed to be 0. //! The <Ders> is a 2d array and the dimension of the lines is always (<VDeg>+1) * (<3>+1), even if <N> is smaller than <Udeg> (the derivatives higher than <N> are not used). //! Content of <Ders>: //! x(i,j)[k] means: the composant k of x derivated (i) times in u and (j) times in v. //! ... First line ... //! x[1],x[2],...,x[3],w x(0,1)[1],...,x(0,1)[3],w(1,0) ... x(0,VDeg)[1],...,x(0,VDeg)[3],w(0,VDeg) //! ... Then second line ... //! x(1,0)[1],...,x(1,0)[3],w(1,0) x(1,1)[1],...,x(1,1)[3],w(1,1) ... x(1,VDeg)[1],...,x(1,VDeg)[3],w(1,VDeg) //! ... //! ... Last line ... //! x(UDeg,0)[1],...,x(UDeg,0)[3],w(UDeg,0) x(UDeg,1)[1],...,x(UDeg,1)[3],w(UDeg,1) ... x(Udeg,VDeg)[1],...,x(UDeg,VDeg)[3],w(Udeg,VDeg) //! If <All> is false, only the derivative at order <N,M> is computed. <RDers> is an array of length 3 which will contain the result: //! x(1)/w , x(2)/w , ... derivated <N> <M> times //! If <All> is true multiples derivatives are computed. All the derivatives (i,j) with 0 <= i+j <= Max(N,M) are computed. <RDers> is an array of length 3 * (<N>+1) * (<M>+1) which will contains: //! x(1)/w , x(2)/w , ... x(1)/w , x(2)/w , ... derivated <0,1> times x(1)/w , x(2)/w , ... derivated <0,2> times ... x(1)/w , x(2)/w , ... derivated <0,N> times //! x(1)/w , x(2)/w , ... derivated <1,0> times x(1)/w , x(2)/w , ... derivated <1,1> times ... x(1)/w , x(2)/w , ... derivated <1,N> times //! x(1)/w , x(2)/w , ... derivated <N,0> times .... Warning: <RDers> must be dimensioned properly.
") RationalDerivative;
		static void RationalDerivative(const Standard_Integer UDeg, const Standard_Integer VDeg, const Standard_Integer N, const Standard_Integer M, Standard_Real &OutValue, Standard_Real &OutValue, const Standard_Boolean All = Standard_True);

		/****** BSplSLib::RemoveKnot ******/
		/****** md5 signature: 1e14d1e66a2450406f9d61aa0978fec3 ******/
		%feature("compactdefaultargs") RemoveKnot;
		%feature("autodoc", "
Parameters
----------
UDirection: bool
Index: int
Mult: int
Degree: int
Periodic: bool
Poles: TColgp_Array2OfPnt
Weights: TColStd_Array2OfReal *
Knots: TColStd_Array1OfReal
Mults: TColStd_Array1OfInteger
NewPoles: TColgp_Array2OfPnt
NewWeights: TColStd_Array2OfReal *
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
		static Standard_Boolean RemoveKnot(const Standard_Boolean UDirection, const Standard_Integer Index, const Standard_Integer Mult, const Standard_Integer Degree, const Standard_Boolean Periodic, const TColgp_Array2OfPnt & Poles, const TColStd_Array2OfReal * Weights, const TColStd_Array1OfReal & Knots, const TColStd_Array1OfInteger & Mults, TColgp_Array2OfPnt & NewPoles, TColStd_Array2OfReal * NewWeights, TColStd_Array1OfReal & NewKnots, TColStd_Array1OfInteger & NewMults, const Standard_Real Tolerance);

		/****** BSplSLib::Resolution ******/
		/****** md5 signature: e527ac90571906a5630da56a0204b919 ******/
		%feature("compactdefaultargs") Resolution;
		%feature("autodoc", "
Parameters
----------
Poles: TColgp_Array2OfPnt
Weights: TColStd_Array2OfReal *
UKnots: TColStd_Array1OfReal
VKnots: TColStd_Array1OfReal
UMults: TColStd_Array1OfInteger
VMults: TColStd_Array1OfInteger
UDegree: int
VDegree: int
URat: bool
VRat: bool
UPer: bool
VPer: bool
Tolerance3D: float

Return
-------
UTolerance: float
VTolerance: float

Description
-----------
Given a tolerance in 3D space returns two tolerances, one in U one in V such that for all (u1,v1) and (u0,v0) in the domain of the surface f(u,v) we have: | u1 - u0 | < UTolerance and | v1 - v0 | < VTolerance we have |f (u1,v1) - f (u0,v0)| < Tolerance3D.
") Resolution;
		static void Resolution(const TColgp_Array2OfPnt & Poles, const TColStd_Array2OfReal * Weights, const TColStd_Array1OfReal & UKnots, const TColStd_Array1OfReal & VKnots, const TColStd_Array1OfInteger & UMults, const TColStd_Array1OfInteger & VMults, const Standard_Integer UDegree, const Standard_Integer VDegree, const Standard_Boolean URat, const Standard_Boolean VRat, const Standard_Boolean UPer, const Standard_Boolean VPer, const Standard_Real Tolerance3D, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** BSplSLib::Reverse ******/
		/****** md5 signature: 39ce17f23b5010ec411d98e4d1858323 ******/
		%feature("compactdefaultargs") Reverse;
		%feature("autodoc", "
Parameters
----------
Poles: TColgp_Array2OfPnt
Last: int
UDirection: bool

Return
-------
None

Description
-----------
Reverses the array of poles. Last is the Index of the new first Row( Col) of Poles. On a non periodic surface Last is Poles.Upper(). On a periodic curve last is (number of flat knots - degree - 1) or (sum of multiplicities(but for the last) + degree - 1).
") Reverse;
		static void Reverse(TColgp_Array2OfPnt & Poles, const Standard_Integer Last, const Standard_Boolean UDirection);

		/****** BSplSLib::Reverse ******/
		/****** md5 signature: 5819ffb0c18b7f4008d9b8b25ff98072 ******/
		%feature("compactdefaultargs") Reverse;
		%feature("autodoc", "
Parameters
----------
Weights: TColStd_Array2OfReal
Last: int
UDirection: bool

Return
-------
None

Description
-----------
Reverses the array of weights.
") Reverse;
		static void Reverse(TColStd_Array2OfReal & Weights, const Standard_Integer Last, const Standard_Boolean UDirection);

		/****** BSplSLib::SetPoles ******/
		/****** md5 signature: 9d458899241c684863dd75a17f9b5fd7 ******/
		%feature("compactdefaultargs") SetPoles;
		%feature("autodoc", "
Parameters
----------
Poles: TColgp_Array2OfPnt
FP: TColStd_Array1OfReal
UDirection: bool

Return
-------
None

Description
-----------
Copy in FP the coordinates of the poles.
") SetPoles;
		static void SetPoles(const TColgp_Array2OfPnt & Poles, TColStd_Array1OfReal & FP, const Standard_Boolean UDirection);

		/****** BSplSLib::SetPoles ******/
		/****** md5 signature: e3d166fb8bc62ca2eabdd84250aac1c0 ******/
		%feature("compactdefaultargs") SetPoles;
		%feature("autodoc", "
Parameters
----------
Poles: TColgp_Array2OfPnt
Weights: TColStd_Array2OfReal
FP: TColStd_Array1OfReal
UDirection: bool

Return
-------
None

Description
-----------
Copy in FP the coordinates of the poles.
") SetPoles;
		static void SetPoles(const TColgp_Array2OfPnt & Poles, const TColStd_Array2OfReal & Weights, TColStd_Array1OfReal & FP, const Standard_Boolean UDirection);

		/****** BSplSLib::Unperiodize ******/
		/****** md5 signature: 1d1f27b1521872db93340fa45dac9f60 ******/
		%feature("compactdefaultargs") Unperiodize;
		%feature("autodoc", "
Parameters
----------
UDirection: bool
Degree: int
Mults: TColStd_Array1OfInteger
Knots: TColStd_Array1OfReal
Poles: TColgp_Array2OfPnt
Weights: TColStd_Array2OfReal *
NewMults: TColStd_Array1OfInteger
NewKnots: TColStd_Array1OfReal
NewPoles: TColgp_Array2OfPnt
NewWeights: TColStd_Array2OfReal *

Return
-------
None

Description
-----------
No available documentation.
") Unperiodize;
		static void Unperiodize(const Standard_Boolean UDirection, const Standard_Integer Degree, const TColStd_Array1OfInteger & Mults, const TColStd_Array1OfReal & Knots, const TColgp_Array2OfPnt & Poles, const TColStd_Array2OfReal * Weights, TColStd_Array1OfInteger & NewMults, TColStd_Array1OfReal & NewKnots, TColgp_Array2OfPnt & NewPoles, TColStd_Array2OfReal * NewWeights);

};


%extend BSplSLib {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************
* class BSplSLib_Cache *
***********************/
class BSplSLib_Cache : public Standard_Transient {
	public:
		/****** BSplSLib_Cache::BSplSLib_Cache ******/
		/****** md5 signature: 5a0c5a66c6ece3fa3e4decf4242b70f0 ******/
		%feature("compactdefaultargs") BSplSLib_Cache;
		%feature("autodoc", "
Parameters
----------
theDegreeU: int
thePeriodicU: bool
theFlatKnotsU: TColStd_Array1OfReal
theDegreeV: int
thePeriodicV: bool
theFlatKnotsV: TColStd_Array1OfReal
theWeights: TColStd_Array2OfReal * (optional, default to NULL)

Return
-------
None

Description
-----------
Constructor for caching of the span for the surface \param theDegreeU degree along the first parameter (U) of the surface \param thePeriodicU identify the surface is periodical along U axis \param theFlatKnotsU knots of the surface (with repetition) along U axis \param theDegreeV degree along the second parameter (V) of the surface \param thePeriodicV identify the surface is periodical along V axis \param theFlatKnotsV knots of the surface (with repetition) along V axis \param theWeights array of weights of corresponding poles.
") BSplSLib_Cache;
		 BSplSLib_Cache(const Standard_Integer & theDegreeU, const Standard_Boolean & thePeriodicU, const TColStd_Array1OfReal & theFlatKnotsU, const Standard_Integer & theDegreeV, const Standard_Boolean & thePeriodicV, const TColStd_Array1OfReal & theFlatKnotsV, const TColStd_Array2OfReal * theWeights = NULL);

		/****** BSplSLib_Cache::BuildCache ******/
		/****** md5 signature: 96b423c64477b333b1d008bf9dc6f681 ******/
		%feature("compactdefaultargs") BuildCache;
		%feature("autodoc", "
Parameters
----------
theParameterU: float
theParameterV: float
theFlatKnotsU: TColStd_Array1OfReal
theFlatKnotsV: TColStd_Array1OfReal
thePoles: TColgp_Array2OfPnt
theWeights: TColStd_Array2OfReal * (optional, default to NULL)

Return
-------
None

Description
-----------
Recomputes the cache data. Does not verify validity of the cache \param theParameterU the parametric value on the U axis to identify the span \param theParameterV the parametric value on the V axis to identify the span \param theDegreeU degree along U axis \param thePeriodicU identify whether the surface is periodic along U axis \param theFlatKnotsU flat knots of the surface along U axis \param theDegreeV degree along V axis \param thePeriodicV identify whether the surface is periodic along V axis \param theFlatKnotsV flat knots of the surface along V axis \param thePoles array of poles of the surface \param theWeights array of weights of corresponding poles.
") BuildCache;
		void BuildCache(const Standard_Real & theParameterU, const Standard_Real & theParameterV, const TColStd_Array1OfReal & theFlatKnotsU, const TColStd_Array1OfReal & theFlatKnotsV, const TColgp_Array2OfPnt & thePoles, const TColStd_Array2OfReal * theWeights = NULL);

		/****** BSplSLib_Cache::D0 ******/
		/****** md5 signature: 943ab97ce1a5d88517242b8403789041 ******/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "
Parameters
----------
theU: float
theV: float
thePoint: gp_Pnt

Return
-------
None

Description
-----------
Calculates the point on the surface for specified parameters \param[in] theU first parameter for calculation of the value \param[in] theV second parameter for calculation of the value \param[out] thePoint the result of calculation (the point on the surface).
") D0;
		void D0(const Standard_Real & theU, const Standard_Real & theV, gp_Pnt & thePoint);

		/****** BSplSLib_Cache::D1 ******/
		/****** md5 signature: 39f51e39b845b43a5a354d6f6f09f6ca ******/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "
Parameters
----------
theU: float
theV: float
thePoint: gp_Pnt
theTangentU: gp_Vec
theTangentV: gp_Vec

Return
-------
None

Description
-----------
Calculates the point on the surface and its first derivative \param[in] theU first parameter of calculation of the value \param[in] theV second parameter of calculation of the value \param[out] thePoint the result of calculation (the point on the surface) \param[out] theTangentU tangent vector along U axis in the calculated point \param[out] theTangentV tangent vector along V axis in the calculated point.
") D1;
		void D1(const Standard_Real & theU, const Standard_Real & theV, gp_Pnt & thePoint, gp_Vec & theTangentU, gp_Vec & theTangentV);

		/****** BSplSLib_Cache::D2 ******/
		/****** md5 signature: 3021a8678a2ebc6f53147e41bc3036da ******/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "
Parameters
----------
theU: float
theV: float
thePoint: gp_Pnt
theTangentU: gp_Vec
theTangentV: gp_Vec
theCurvatureU: gp_Vec
theCurvatureV: gp_Vec
theCurvatureUV: gp_Vec

Return
-------
None

Description
-----------
Calculates the point on the surface and derivatives till second order \param[in] theU first parameter of calculation of the value \param[in] theV second parameter of calculation of the value \param[out] thePoint the result of calculation (the point on the surface) \param[out] theTangentU tangent vector along U axis in the calculated point \param[out] theTangentV tangent vector along V axis in the calculated point \param[out] theCurvatureU curvature vector (2nd derivative on U) along U axis \param[out] theCurvatureV curvature vector (2nd derivative on V) along V axis \param[out] theCurvatureUV 2nd mixed derivative on U anv V.
") D2;
		void D2(const Standard_Real & theU, const Standard_Real & theV, gp_Pnt & thePoint, gp_Vec & theTangentU, gp_Vec & theTangentV, gp_Vec & theCurvatureU, gp_Vec & theCurvatureV, gp_Vec & theCurvatureUV);

		/****** BSplSLib_Cache::IsCacheValid ******/
		/****** md5 signature: 2d848242b9372204ece31b0de70cdf17 ******/
		%feature("compactdefaultargs") IsCacheValid;
		%feature("autodoc", "
Parameters
----------
theParameterU: float
theParameterV: float

Return
-------
bool

Description
-----------
Verifies validity of the cache using parameters of the point \param theParameterU first parameter of the point placed in the span \param theParameterV second parameter of the point placed in the span.
") IsCacheValid;
		Standard_Boolean IsCacheValid(Standard_Real theParameterU, Standard_Real theParameterV);

};


%make_alias(BSplSLib_Cache)

%extend BSplSLib_Cache {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************************
* class BSplSLib_EvaluatorFunction *
***********************************/
%nodefaultctor BSplSLib_EvaluatorFunction;
class BSplSLib_EvaluatorFunction {
	public:
		/****** BSplSLib_EvaluatorFunction::Evaluate ******/
		/****** md5 signature: 1e372440244caef055e485ce59a6c276 ******/
		%feature("compactdefaultargs") Evaluate;
		%feature("autodoc", "
Parameters
----------
theDerivativeRequest: int
theUParameter: float
theVParameter: float

Return
-------
theResult: float
theErrorCode: int

Description
-----------
Function evaluation method to be defined by descendant.
") Evaluate;
		virtual void Evaluate(const Standard_Integer theDerivativeRequest, const Standard_Real theUParameter, const Standard_Real theVParameter, Standard_Real &OutValue, Standard_Integer &OutValue);

};


%extend BSplSLib_EvaluatorFunction {
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
def bsplslib_BuildCache(*args):
	return bsplslib.BuildCache(*args)

@deprecated
def bsplslib_BuildCache(*args):
	return bsplslib.BuildCache(*args)

@deprecated
def bsplslib_CacheD0(*args):
	return bsplslib.CacheD0(*args)

@deprecated
def bsplslib_CacheD1(*args):
	return bsplslib.CacheD1(*args)

@deprecated
def bsplslib_CacheD2(*args):
	return bsplslib.CacheD2(*args)

@deprecated
def bsplslib_CoefsD0(*args):
	return bsplslib.CoefsD0(*args)

@deprecated
def bsplslib_CoefsD1(*args):
	return bsplslib.CoefsD1(*args)

@deprecated
def bsplslib_CoefsD2(*args):
	return bsplslib.CoefsD2(*args)

@deprecated
def bsplslib_D0(*args):
	return bsplslib.D0(*args)

@deprecated
def bsplslib_D1(*args):
	return bsplslib.D1(*args)

@deprecated
def bsplslib_D2(*args):
	return bsplslib.D2(*args)

@deprecated
def bsplslib_D3(*args):
	return bsplslib.D3(*args)

@deprecated
def bsplslib_DN(*args):
	return bsplslib.DN(*args)

@deprecated
def bsplslib_FunctionMultiply(*args):
	return bsplslib.FunctionMultiply(*args)

@deprecated
def bsplslib_GetPoles(*args):
	return bsplslib.GetPoles(*args)

@deprecated
def bsplslib_GetPoles(*args):
	return bsplslib.GetPoles(*args)

@deprecated
def bsplslib_HomogeneousD0(*args):
	return bsplslib.HomogeneousD0(*args)

@deprecated
def bsplslib_HomogeneousD1(*args):
	return bsplslib.HomogeneousD1(*args)

@deprecated
def bsplslib_IncreaseDegree(*args):
	return bsplslib.IncreaseDegree(*args)

@deprecated
def bsplslib_InsertKnots(*args):
	return bsplslib.InsertKnots(*args)

@deprecated
def bsplslib_Interpolate(*args):
	return bsplslib.Interpolate(*args)

@deprecated
def bsplslib_Interpolate(*args):
	return bsplslib.Interpolate(*args)

@deprecated
def bsplslib_IsRational(*args):
	return bsplslib.IsRational(*args)

@deprecated
def bsplslib_Iso(*args):
	return bsplslib.Iso(*args)

@deprecated
def bsplslib_MovePoint(*args):
	return bsplslib.MovePoint(*args)

@deprecated
def bsplslib_NoWeights(*args):
	return bsplslib.NoWeights(*args)

@deprecated
def bsplslib_PolesCoefficients(*args):
	return bsplslib.PolesCoefficients(*args)

@deprecated
def bsplslib_PolesCoefficients(*args):
	return bsplslib.PolesCoefficients(*args)

@deprecated
def bsplslib_RationalDerivative(*args):
	return bsplslib.RationalDerivative(*args)

@deprecated
def bsplslib_RemoveKnot(*args):
	return bsplslib.RemoveKnot(*args)

@deprecated
def bsplslib_Resolution(*args):
	return bsplslib.Resolution(*args)

@deprecated
def bsplslib_Reverse(*args):
	return bsplslib.Reverse(*args)

@deprecated
def bsplslib_Reverse(*args):
	return bsplslib.Reverse(*args)

@deprecated
def bsplslib_SetPoles(*args):
	return bsplslib.SetPoles(*args)

@deprecated
def bsplslib_SetPoles(*args):
	return bsplslib.SetPoles(*args)

@deprecated
def bsplslib_Unperiodize(*args):
	return bsplslib.Unperiodize(*args)

}
