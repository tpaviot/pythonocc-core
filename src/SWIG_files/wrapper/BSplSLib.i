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
%define BSPLSLIBDOCSTRING
"BSplSLib module, see official documentation at
https://dev.opencascade.org/doc/occt-7.9.0/refman/html/package_bsplslib.html"
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
		/****** md5 signature: ca329e77005d4963ddf647d98126f4de ******/
		%feature("compactdefaultargs") BuildCache;
		%feature("autodoc", "
Parameters
----------
U: double
V: double
USpanDomain: double
VSpanDomain: double
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
		static void BuildCache(const double U, const double V, const double USpanDomain, const double VSpanDomain, const bool UPeriodicFlag, const bool VPeriodicFlag, const int UDegree, const int VDegree, const int UIndex, const int VIndex, const TColStd_Array1OfReal & UFlatKnots, const TColStd_Array1OfReal & VFlatKnots, const TColgp_Array2OfPnt & Poles, const TColStd_Array2OfReal * Weights, TColgp_Array2OfPnt & CachePoles, TColStd_Array2OfReal * CacheWeights);

		/****** BSplSLib::BuildCache ******/
		/****** md5 signature: 566a7bbf764f0adace8ea66e2917ecd3 ******/
		%feature("compactdefaultargs") BuildCache;
		%feature("autodoc", "
Parameters
----------
theU: double
theV: double
theUSpanDomain: double
theVSpanDomain: double
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
		static void BuildCache(const double theU, const double theV, const double theUSpanDomain, const double theVSpanDomain, const bool theUPeriodic, const bool theVPeriodic, const int theUDegree, const int theVDegree, const int theUIndex, const int theVIndex, const TColStd_Array1OfReal & theUFlatKnots, const TColStd_Array1OfReal & theVFlatKnots, const TColgp_Array2OfPnt & thePoles, const TColStd_Array2OfReal * theWeights, TColStd_Array2OfReal & theCacheArray);

		/****** BSplSLib::CacheD0 ******/
		/****** md5 signature: 86a7276005f80c5c8379675c86157411 ******/
		%feature("compactdefaultargs") CacheD0;
		%feature("autodoc", "
Parameters
----------
U: double
V: double
UDegree: int
VDegree: int
UCacheParameter: double
VCacheParameter: double
USpanLenght: double
VSpanLength: double
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
		static void CacheD0(const double U, const double V, const int UDegree, const int VDegree, const double UCacheParameter, const double VCacheParameter, const double USpanLenght, const double VSpanLength, const TColgp_Array2OfPnt & Poles, const TColStd_Array2OfReal * Weights, gp_Pnt & Point);

		/****** BSplSLib::CacheD1 ******/
		/****** md5 signature: 0ff25d521b4a35b99a78cd94ab3a0e1d ******/
		%feature("compactdefaultargs") CacheD1;
		%feature("autodoc", "
Parameters
----------
U: double
V: double
UDegree: int
VDegree: int
UCacheParameter: double
VCacheParameter: double
USpanLenght: double
VSpanLength: double
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
		static void CacheD1(const double U, const double V, const int UDegree, const int VDegree, const double UCacheParameter, const double VCacheParameter, const double USpanLenght, const double VSpanLength, const TColgp_Array2OfPnt & Poles, const TColStd_Array2OfReal * Weights, gp_Pnt & Point, gp_Vec & VecU, gp_Vec & VecV);

		/****** BSplSLib::CacheD2 ******/
		/****** md5 signature: 69b6f18412bdee9b7bdec013ff6274dc ******/
		%feature("compactdefaultargs") CacheD2;
		%feature("autodoc", "
Parameters
----------
U: double
V: double
UDegree: int
VDegree: int
UCacheParameter: double
VCacheParameter: double
USpanLenght: double
VSpanLength: double
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
		static void CacheD2(const double U, const double V, const int UDegree, const int VDegree, const double UCacheParameter, const double VCacheParameter, const double USpanLenght, const double VSpanLength, const TColgp_Array2OfPnt & Poles, const TColStd_Array2OfReal * Weights, gp_Pnt & Point, gp_Vec & VecU, gp_Vec & VecV, gp_Vec & VecUU, gp_Vec & VecUV, gp_Vec & VecVV);

		/****** BSplSLib::CoefsD0 ******/
		/****** md5 signature: 14eb02383bd9db6b479034658e89c6c5 ******/
		%feature("compactdefaultargs") CoefsD0;
		%feature("autodoc", "
Parameters
----------
U: double
V: double
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
		static void CoefsD0(const double U, const double V, const TColgp_Array2OfPnt & Poles, const TColStd_Array2OfReal * Weights, gp_Pnt & Point);

		/****** BSplSLib::CoefsD1 ******/
		/****** md5 signature: 0bcf381068c6f137ddb2e714520f938e ******/
		%feature("compactdefaultargs") CoefsD1;
		%feature("autodoc", "
Parameters
----------
U: double
V: double
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
		static void CoefsD1(const double U, const double V, const TColgp_Array2OfPnt & Poles, const TColStd_Array2OfReal * Weights, gp_Pnt & Point, gp_Vec & VecU, gp_Vec & VecV);

		/****** BSplSLib::CoefsD2 ******/
		/****** md5 signature: bc2f930ec079c166ce5b4a3b6e8b9d99 ******/
		%feature("compactdefaultargs") CoefsD2;
		%feature("autodoc", "
Parameters
----------
U: double
V: double
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
		static void CoefsD2(const double U, const double V, const TColgp_Array2OfPnt & Poles, const TColStd_Array2OfReal * Weights, gp_Pnt & Point, gp_Vec & VecU, gp_Vec & VecV, gp_Vec & VecUU, gp_Vec & VecUV, gp_Vec & VecVV);

		/****** BSplSLib::D0 ******/
		/****** md5 signature: 0d31b117f0d9a9d22271a64afb84bdfc ******/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "
Parameters
----------
U: double
V: double
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
		static void D0(const double U, const double V, const int UIndex, const int VIndex, const TColgp_Array2OfPnt & Poles, const TColStd_Array2OfReal * Weights, const TColStd_Array1OfReal & UKnots, const TColStd_Array1OfReal & VKnots, const TColStd_Array1OfInteger * UMults, const TColStd_Array1OfInteger * VMults, const int UDegree, const int VDegree, const bool URat, const bool VRat, const bool UPer, const bool VPer, gp_Pnt & P);

		/****** BSplSLib::D1 ******/
		/****** md5 signature: b5828f51d94f1740242840d2e011c256 ******/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "
Parameters
----------
U: double
V: double
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
		static void D1(const double U, const double V, const int UIndex, const int VIndex, const TColgp_Array2OfPnt & Poles, const TColStd_Array2OfReal * Weights, const TColStd_Array1OfReal & UKnots, const TColStd_Array1OfReal & VKnots, const TColStd_Array1OfInteger * UMults, const TColStd_Array1OfInteger * VMults, const int Degree, const int VDegree, const bool URat, const bool VRat, const bool UPer, const bool VPer, gp_Pnt & P, gp_Vec & Vu, gp_Vec & Vv);

		/****** BSplSLib::D2 ******/
		/****** md5 signature: 6e4437143113dd3675532e623d96dadd ******/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "
Parameters
----------
U: double
V: double
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
		static void D2(const double U, const double V, const int UIndex, const int VIndex, const TColgp_Array2OfPnt & Poles, const TColStd_Array2OfReal * Weights, const TColStd_Array1OfReal & UKnots, const TColStd_Array1OfReal & VKnots, const TColStd_Array1OfInteger * UMults, const TColStd_Array1OfInteger * VMults, const int UDegree, const int VDegree, const bool URat, const bool VRat, const bool UPer, const bool VPer, gp_Pnt & P, gp_Vec & Vu, gp_Vec & Vv, gp_Vec & Vuu, gp_Vec & Vvv, gp_Vec & Vuv);

		/****** BSplSLib::D3 ******/
		/****** md5 signature: f6f43aabdf4dd0257634940987ba68e7 ******/
		%feature("compactdefaultargs") D3;
		%feature("autodoc", "
Parameters
----------
U: double
V: double
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
		static void D3(const double U, const double V, const int UIndex, const int VIndex, const TColgp_Array2OfPnt & Poles, const TColStd_Array2OfReal * Weights, const TColStd_Array1OfReal & UKnots, const TColStd_Array1OfReal & VKnots, const TColStd_Array1OfInteger * UMults, const TColStd_Array1OfInteger * VMults, const int UDegree, const int VDegree, const bool URat, const bool VRat, const bool UPer, const bool VPer, gp_Pnt & P, gp_Vec & Vu, gp_Vec & Vv, gp_Vec & Vuu, gp_Vec & Vvv, gp_Vec & Vuv, gp_Vec & Vuuu, gp_Vec & Vvvv, gp_Vec & Vuuv, gp_Vec & Vuvv);

		/****** BSplSLib::DN ******/
		/****** md5 signature: 6a3fbe07f893a62bb66f9d7e1510f8f4 ******/
		%feature("compactdefaultargs") DN;
		%feature("autodoc", "
Parameters
----------
U: double
V: double
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
		static void DN(const double U, const double V, const int Nu, const int Nv, const int UIndex, const int VIndex, const TColgp_Array2OfPnt & Poles, const TColStd_Array2OfReal * Weights, const TColStd_Array1OfReal & UKnots, const TColStd_Array1OfReal & VKnots, const TColStd_Array1OfInteger * UMults, const TColStd_Array1OfInteger * VMults, const int UDegree, const int VDegree, const bool URat, const bool VRat, const bool UPer, const bool VPer, gp_Vec & Vn);

		/****** BSplSLib::FunctionMultiply ******/
		/****** md5 signature: 8fa4b46b22fcbe0fcbabaef09142f934 ******/
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
this will multiply a given BSpline numerator N(u,v) and denominator D(u,v) defined by its U/VBSplineDegree and U/VBSplineKnots, and U/VMults. Its Poles and Weights are arrays which are coded as array2 of the form [1..UNumPoles][1..VNumPoles] by a function a(u,v) which is assumed to satisfy the following: 1. a(u,v) * N(u,v) and a(u,v) * D(u,v) is a polynomial BSpline that can be expressed exactly as a BSpline of degree U/VNewDegree on the knots U/VFlatKnots 2. the range of a(u,v) is the same as the range of N(u,v) or D(u,v) Warning: it is the caller's responsibility to insure that conditions 1. and 2. above are satisfied no check whatsoever is made in this method theStatus will return 0 if OK else it will return the pivot index of the matrix that was inverted to compute the multiplied BSpline: the method used is interpolation at Schoenenberg points of a(u,v)* N(u,v) and a(u,v) * D(u,v) theStatus will return 0 if OK else it will return the pivot index of the matrix that was inverted to compute the multiplied BSpline: the method used is interpolation at Schoenenberg points of a(u,v)*F(u,v) --.
") FunctionMultiply;
		static void FunctionMultiply(const BSplSLib_EvaluatorFunction & Function, const int UBSplineDegree, const int VBSplineDegree, const TColStd_Array1OfReal & UBSplineKnots, const TColStd_Array1OfReal & VBSplineKnots, const TColStd_Array1OfInteger * UMults, const TColStd_Array1OfInteger * VMults, const TColgp_Array2OfPnt & Poles, const TColStd_Array2OfReal * Weights, const TColStd_Array1OfReal & UFlatKnots, const TColStd_Array1OfReal & VFlatKnots, const int UNewDegree, const int VNewDegree, TColgp_Array2OfPnt & NewNumerator, TColStd_Array2OfReal & NewDenominator, Standard_Integer &OutValue);

		/****** BSplSLib::GetPoles ******/
		/****** md5 signature: 321c444246407c6670230f3d26fcebe1 ******/
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
		static void GetPoles(const TColStd_Array1OfReal & FP, TColgp_Array2OfPnt & Poles, const bool UDirection);

		/****** BSplSLib::GetPoles ******/
		/****** md5 signature: f2d08d6acb15d68211cb867a6d857fa3 ******/
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
		static void GetPoles(const TColStd_Array1OfReal & FP, TColgp_Array2OfPnt & Poles, TColStd_Array2OfReal & Weights, const bool UDirection);

		/****** BSplSLib::HomogeneousD0 ******/
		/****** md5 signature: 3496cb5b4136977673574416b98eca16 ******/
		%feature("compactdefaultargs") HomogeneousD0;
		%feature("autodoc", "
Parameters
----------
U: double
V: double
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
W: double

Description
-----------
Makes an homogeneous evaluation of Poles and Weights any and returns in P the Numerator value and in W the Denominator value if Weights are present otherwise returns 1.0e0.
") HomogeneousD0;
		static void HomogeneousD0(const double U, const double V, const int UIndex, const int VIndex, const TColgp_Array2OfPnt & Poles, const TColStd_Array2OfReal * Weights, const TColStd_Array1OfReal & UKnots, const TColStd_Array1OfReal & VKnots, const TColStd_Array1OfInteger * UMults, const TColStd_Array1OfInteger * VMults, const int UDegree, const int VDegree, const bool URat, const bool VRat, const bool UPer, const bool VPer, Standard_Real &OutValue, gp_Pnt & P);

		/****** BSplSLib::HomogeneousD1 ******/
		/****** md5 signature: 3b92fdaaff196dbb5849cf6dec62cca4 ******/
		%feature("compactdefaultargs") HomogeneousD1;
		%feature("autodoc", "
Parameters
----------
U: double
V: double
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
D: double
Du: double
Dv: double

Description
-----------
Makes an homogeneous evaluation of Poles and Weights any and returns in P the Numerator value and in W the Denominator value if Weights are present otherwise returns 1.0e0.
") HomogeneousD1;
		static void HomogeneousD1(const double U, const double V, const int UIndex, const int VIndex, const TColgp_Array2OfPnt & Poles, const TColStd_Array2OfReal * Weights, const TColStd_Array1OfReal & UKnots, const TColStd_Array1OfReal & VKnots, const TColStd_Array1OfInteger * UMults, const TColStd_Array1OfInteger * VMults, const int UDegree, const int VDegree, const bool URat, const bool VRat, const bool UPer, const bool VPer, gp_Pnt & N, gp_Vec & Nu, gp_Vec & Nv, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** BSplSLib::IncreaseDegree ******/
		/****** md5 signature: e6b421a94439b85ec26adadb5257f789 ******/
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
		static void IncreaseDegree(const bool UDirection, const int Degree, const int NewDegree, const bool Periodic, const TColgp_Array2OfPnt & Poles, const TColStd_Array2OfReal * Weights, const TColStd_Array1OfReal & Knots, const TColStd_Array1OfInteger & Mults, TColgp_Array2OfPnt & NewPoles, TColStd_Array2OfReal * NewWeights, TColStd_Array1OfReal & NewKnots, TColStd_Array1OfInteger & NewMults);

		/****** BSplSLib::InsertKnots ******/
		/****** md5 signature: 54202760515a3a20f992eccf58366157 ******/
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
Epsilon: double
Add: bool (optional, default to true)

Return
-------
None

Description
-----------
No available documentation.
") InsertKnots;
		static void InsertKnots(const bool UDirection, const int Degree, const bool Periodic, const TColgp_Array2OfPnt & Poles, const TColStd_Array2OfReal * Weights, const TColStd_Array1OfReal & Knots, const TColStd_Array1OfInteger & Mults, const TColStd_Array1OfReal & AddKnots, const TColStd_Array1OfInteger * AddMults, TColgp_Array2OfPnt & NewPoles, TColStd_Array2OfReal * NewWeights, TColStd_Array1OfReal & NewKnots, TColStd_Array1OfInteger & NewMults, const double Epsilon, const bool Add = true);

		/****** BSplSLib::Interpolate ******/
		/****** md5 signature: cbfb324bab1b146395bdf28c2a2c6343 ******/
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
Performs the interpolation of the data points given in the Poles array in the form [1,...,RL][1,...,RC][1...PolesDimension]. The ColLength CL and the Length of UParameters must be the same. The length of VFlatKnots is VDegree + CL + 1. //! The RowLength RL and the Length of VParameters must be the same. The length of VFlatKnots is Degree + RL + 1. //! Warning: the method used to do that interpolation is gauss elimination WITHOUT pivoting. Thus if the diagonal is not dominant there is no guarantee that the algorithm will work. Nevertheless for Cubic interpolation at knots or interpolation at Scheonberg points the method will work. The InversionProblem will report 0 if there was no problem else it will give the index of the faulty pivot.
") Interpolate;
		static void Interpolate(const int UDegree, const int VDegree, const TColStd_Array1OfReal & UFlatKnots, const TColStd_Array1OfReal & VFlatKnots, const TColStd_Array1OfReal & UParameters, const TColStd_Array1OfReal & VParameters, TColgp_Array2OfPnt & Poles, TColStd_Array2OfReal & Weights, Standard_Integer &OutValue);

		/****** BSplSLib::Interpolate ******/
		/****** md5 signature: 8613c67ee9d057da0a70c3c27ba3c4a1 ******/
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
		static void Interpolate(const int UDegree, const int VDegree, const TColStd_Array1OfReal & UFlatKnots, const TColStd_Array1OfReal & VFlatKnots, const TColStd_Array1OfReal & UParameters, const TColStd_Array1OfReal & VParameters, TColgp_Array2OfPnt & Poles, Standard_Integer &OutValue);

		/****** BSplSLib::IsRational ******/
		/****** md5 signature: 70ded0abd888d8daecce2db30dcde2a9 ******/
		%feature("compactdefaultargs") IsRational;
		%feature("autodoc", "
Parameters
----------
Weights: TColStd_Array2OfReal
I1: int
I2: int
J1: int
J2: int
Epsilon: double (optional, default to 0.0)

Return
-------
bool

Description
-----------
Returns False if all the weights of the array <Weights> in the area [I1,I2] * [J1,J2] are identic. Epsilon is used for comparing weights. If Epsilon is 0. the Epsilon of the first weight is used.
") IsRational;
		static bool IsRational(const TColStd_Array2OfReal & Weights, const int I1, const int I2, const int J1, const int J2, const double Epsilon = 0.0);

		/****** BSplSLib::Iso ******/
		/****** md5 signature: 4d58b5b2931d7e7e71df55086ec5a637 ******/
		%feature("compactdefaultargs") Iso;
		%feature("autodoc", "
Parameters
----------
Param: double
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
		static void Iso(const double Param, const bool IsU, const TColgp_Array2OfPnt & Poles, const TColStd_Array2OfReal * Weights, const TColStd_Array1OfReal & Knots, const TColStd_Array1OfInteger * Mults, const int Degree, const bool Periodic, TColgp_Array1OfPnt & CPoles, TColStd_Array1OfReal * CWeights);

		/****** BSplSLib::MovePoint ******/
		/****** md5 signature: c743405fc4da23db6dc68140b95e3530 ******/
		%feature("compactdefaultargs") MovePoint;
		%feature("autodoc", "
Parameters
----------
U: double
V: double
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
		static void MovePoint(const double U, const double V, const gp_Vec & Displ, const int UIndex1, const int UIndex2, const int VIndex1, const int VIndex2, const int UDegree, const int VDegree, const bool Rational, const TColgp_Array2OfPnt & Poles, const TColStd_Array2OfReal & Weights, const TColStd_Array1OfReal & UFlatKnots, const TColStd_Array1OfReal & VFlatKnots, Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue, TColgp_Array2OfPnt & NewPoles);

		/****** BSplSLib::NoWeights ******/
		/****** md5 signature: befccd5648a4b902cdc23e6d22b4bfc3 ******/
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
		/****** md5 signature: b7ded7ba41ee7e6980f8cf93659ede9e ******/
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
		/****** md5 signature: 4450ed0aebba9e1c3d1b990b0b093fb7 ******/
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
		/****** md5 signature: 573b19b4376f56c263fb5fb9bbe10892 ******/
		%feature("compactdefaultargs") RationalDerivative;
		%feature("autodoc", "
Parameters
----------
UDeg: int
VDeg: int
N: int
M: int
All: bool (optional, default to true)

Return
-------
Ders: double
RDers: double

Description
-----------
this is a one dimensional function typedef void (*EvaluatorFunction) ( int // Derivative Request double * // StartEnd[2][2] // [0] = U // [1] = V // [0] = start // [1] = end double // UParameter double // VParamerer double & // Result int &) ;// Error Code serves to multiply a given vectorial BSpline by a function Computes the derivatives of a ratio of two-variables functions x(u,v) / w(u,v) at orders <N,M>, x(u,v) is a vector in dimension <3>. //! <Ders> is an array containing the values of the input derivatives from 0 to std::min(<N>,<UDeg>), 0 to std::min(<M>,<VDeg>). For orders higher than <UDeg,VDeg> the input derivatives are assumed to be 0. //! The <Ders> is a 2d array and the dimension of the lines is always (<VDeg>+1) * (<3>+1), even if <N> is smaller than <Udeg> (the derivatives higher than <N> are not used). //! Content of <Ders>: //! x(i,j)[k] means: the composant k of x derivated (i) times in u and (j) times in v. //! ... First line ... //! x[1],x[2],...,x[3],w x(0,1)[1],...,x(0,1)[3],w(1,0) ... x(0,VDeg)[1],...,x(0,VDeg)[3],w(0,VDeg) //! ... Then second line ... //! x(1,0)[1],...,x(1,0)[3],w(1,0) x(1,1)[1],...,x(1,1)[3],w(1,1) ... x(1,VDeg)[1],...,x(1,VDeg)[3],w(1,VDeg) //! ... //! ... Last line ... //! x(UDeg,0)[1],...,x(UDeg,0)[3],w(UDeg,0) x(UDeg,1)[1],...,x(UDeg,1)[3],w(UDeg,1) ... x(Udeg,VDeg)[1],...,x(UDeg,VDeg)[3],w(Udeg,VDeg) //! If <All> is false, only the derivative at order <N,M> is computed. <RDers> is an array of length 3 which will contain the result: //! x(1)/w , x(2)/w , ... derivated <N> <M> times //! If <All> is true multiples derivatives are computed. All the derivatives (i,j) with 0 <= i+j <= std::max(N,M) are computed. <RDers> is an array of length 3 * (<N>+1) * (<M>+1) which will contains: //! x(1)/w , x(2)/w , ... x(1)/w , x(2)/w , ... derivated <0,1> times x(1)/w , x(2)/w , ... derivated <0,2> times ... x(1)/w , x(2)/w , ... derivated <0,N> times //! x(1)/w , x(2)/w , ... derivated <1,0> times x(1)/w , x(2)/w , ... derivated <1,1> times ... x(1)/w , x(2)/w , ... derivated <1,N> times //! x(1)/w , x(2)/w , ... derivated <N,0> times .... Warning: <RDers> must be dimensioned properly.
") RationalDerivative;
		static void RationalDerivative(const int UDeg, const int VDeg, const int N, const int M, Standard_Real &OutValue, Standard_Real &OutValue, const bool All = true);

		/****** BSplSLib::RemoveKnot ******/
		/****** md5 signature: 6dbbc8945990d4ecb58652bea5ca38c6 ******/
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
Tolerance: double

Return
-------
bool

Description
-----------
No available documentation.
") RemoveKnot;
		static bool RemoveKnot(const bool UDirection, const int Index, const int Mult, const int Degree, const bool Periodic, const TColgp_Array2OfPnt & Poles, const TColStd_Array2OfReal * Weights, const TColStd_Array1OfReal & Knots, const TColStd_Array1OfInteger & Mults, TColgp_Array2OfPnt & NewPoles, TColStd_Array2OfReal * NewWeights, TColStd_Array1OfReal & NewKnots, TColStd_Array1OfInteger & NewMults, const double Tolerance);

		/****** BSplSLib::Resolution ******/
		/****** md5 signature: c467966dd09c2a772a087b8255f2b760 ******/
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
Tolerance3D: double

Return
-------
UTolerance: double
VTolerance: double

Description
-----------
Given a tolerance in 3D space returns two tolerances, one in U one in V such that for all (u1,v1) and (u0,v0) in the domain of the surface f(u,v) we have: | u1 - u0 | < UTolerance and | v1 - v0 | < VTolerance we have |f (u1,v1) - f (u0,v0)| < Tolerance3D.
") Resolution;
		static void Resolution(const TColgp_Array2OfPnt & Poles, const TColStd_Array2OfReal * Weights, const TColStd_Array1OfReal & UKnots, const TColStd_Array1OfReal & VKnots, const TColStd_Array1OfInteger & UMults, const TColStd_Array1OfInteger & VMults, const int UDegree, const int VDegree, const bool URat, const bool VRat, const bool UPer, const bool VPer, const double Tolerance3D, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** BSplSLib::Reverse ******/
		/****** md5 signature: debddc40675ed6ee0de1eaae26c782b3 ******/
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
		static void Reverse(TColgp_Array2OfPnt & Poles, const int Last, const bool UDirection);

		/****** BSplSLib::Reverse ******/
		/****** md5 signature: 45e2f13136e676d105803f9789e9e5d5 ******/
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
		static void Reverse(TColStd_Array2OfReal & Weights, const int Last, const bool UDirection);

		/****** BSplSLib::SetPoles ******/
		/****** md5 signature: 4c68bcf424a37df69c6fdbd13ebe487c ******/
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
		static void SetPoles(const TColgp_Array2OfPnt & Poles, TColStd_Array1OfReal & FP, const bool UDirection);

		/****** BSplSLib::SetPoles ******/
		/****** md5 signature: a89383bbbab96fa9f95721c9c3194360 ******/
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
		static void SetPoles(const TColgp_Array2OfPnt & Poles, const TColStd_Array2OfReal & Weights, TColStd_Array1OfReal & FP, const bool UDirection);

		/****** BSplSLib::UnitWeights ******/
		/****** md5 signature: 7ba2470a2f3bd9b61797b58cc58f33a7 ******/
		%feature("compactdefaultargs") UnitWeights;
		%feature("autodoc", "
Parameters
----------
theNbUPoles: int
theNbVPoles: int

Return
-------
NCollection_Array2<double >

Description
-----------
Returns an NCollection_Array2<double> filled with 1.0 values. If theNbUPoles * theNbVPoles <= BSplCLib::MaxUnitWeightsSize(), references a pre-allocated global array (zero allocation). Otherwise, allocates a new array and fills with 1.0. @warning The returned array may reference global static memory -- do NOT modify elements. 
Input parameter: theNbUPoles number of poles in U direction 
Input parameter: theNbVPoles number of poles in V direction 
Return: array of unit weights with bounds [1, theNbUPoles] x [1, theNbVPoles].
") UnitWeights;
		static NCollection_Array2<double > UnitWeights(const int theNbUPoles, const int theNbVPoles);

		/****** BSplSLib::Unperiodize ******/
		/****** md5 signature: 869180594975fad63f053a66dc2c22d8 ******/
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
		static void Unperiodize(const bool UDirection, const int Degree, const TColStd_Array1OfInteger & Mults, const TColStd_Array1OfReal & Knots, const TColgp_Array2OfPnt & Poles, const TColStd_Array2OfReal * Weights, TColStd_Array1OfInteger & NewMults, TColStd_Array1OfReal & NewKnots, TColgp_Array2OfPnt & NewPoles, TColStd_Array2OfReal * NewWeights);

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
		/****** md5 signature: 9650db563866ec7a0e438f13fc28f53f ******/
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
theWeights: TColStd_Array2OfReal * (optional, default to nullptr)

Return
-------
None

Description
-----------
Constructor for caching of the span for the surface \param theDegreeU degree along the first parameter (U) of the surface \param thePeriodicU identify the surface is periodical along U axis \param theFlatKnotsU knots of the surface (with repetition) along U axis \param theDegreeV degree along the second parameter (V) of the surface \param thePeriodicV identify the surface is periodical along V axis \param theFlatKnotsV knots of the surface (with repetition) along V axis \param theWeights array of weights of corresponding poles.
") BSplSLib_Cache;
		 BSplSLib_Cache(const int & theDegreeU, const bool & thePeriodicU, const TColStd_Array1OfReal & theFlatKnotsU, const int & theDegreeV, const bool & thePeriodicV, const TColStd_Array1OfReal & theFlatKnotsV, const TColStd_Array2OfReal * theWeights = nullptr);

		/****** BSplSLib_Cache::BuildCache ******/
		/****** md5 signature: 97a103cee39ebdbd0d7ca303e0ba8208 ******/
		%feature("compactdefaultargs") BuildCache;
		%feature("autodoc", "
Parameters
----------
theParameterU: double
theParameterV: double
theFlatKnotsU: TColStd_Array1OfReal
theFlatKnotsV: TColStd_Array1OfReal
thePoles: TColgp_Array2OfPnt
theWeights: TColStd_Array2OfReal * (optional, default to nullptr)

Return
-------
None

Description
-----------
Recomputes the cache data. Does not verify validity of the cache \param theParameterU the parametric value on the U axis to identify the span \param theParameterV the parametric value on the V axis to identify the span \param theDegreeU degree along U axis \param thePeriodicU identify whether the surface is periodic along U axis \param theFlatKnotsU flat knots of the surface along U axis \param theDegreeV degree along V axis \param thePeriodicV identify whether the surface is periodic along V axis \param theFlatKnotsV flat knots of the surface along V axis \param thePoles array of poles of the surface \param theWeights array of weights of corresponding poles.
") BuildCache;
		void BuildCache(const double & theParameterU, const double & theParameterV, const TColStd_Array1OfReal & theFlatKnotsU, const TColStd_Array1OfReal & theFlatKnotsV, const TColgp_Array2OfPnt & thePoles, const TColStd_Array2OfReal * theWeights = nullptr);

		/****** BSplSLib_Cache::D0 ******/
		/****** md5 signature: 78b8a7e8dc843799eb1f6889bd0b9ff9 ******/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "
Parameters
----------
theU: double
theV: double
thePoint: gp_Pnt

Return
-------
None

Description
-----------
Calculates the point on the surface for specified parameters \param[in] theU first parameter for calculation of the value \param[in] theV second parameter for calculation of the value \param[out] thePoint the result of calculation (the point on the surface).
") D0;
		void D0(const double & theU, const double & theV, gp_Pnt & thePoint);

		/****** BSplSLib_Cache::D0Local ******/
		/****** md5 signature: 8416cd23b20cf02afea070b5fc2e61c2 ******/
		%feature("compactdefaultargs") D0Local;
		%feature("autodoc", "
Parameters
----------
theLocalU: double
theLocalV: double
thePoint: gp_Pnt

Return
-------
None

Description
-----------
Calculates the point using pre-computed local parameters in [-1, 1] range. This bypasses periodic normalization and local parameter calculation. 
Input parameter: theLocalU pre-computed local U parameter: (U - SpanMid) / SpanHalfLen 
Input parameter: theLocalV pre-computed local V parameter: (V - SpanMid) / SpanHalfLen @param[out] thePoint the result of calculation (the point on the surface).
") D0Local;
		void D0Local(double theLocalU, double theLocalV, gp_Pnt & thePoint);

		/****** BSplSLib_Cache::D1 ******/
		/****** md5 signature: d0a65140265394409720ac444ad795e5 ******/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "
Parameters
----------
theU: double
theV: double
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
		void D1(const double & theU, const double & theV, gp_Pnt & thePoint, gp_Vec & theTangentU, gp_Vec & theTangentV);

		/****** BSplSLib_Cache::D1Local ******/
		/****** md5 signature: c4557ce6b8d25eb0877046a28d5bde70 ******/
		%feature("compactdefaultargs") D1Local;
		%feature("autodoc", "
Parameters
----------
theLocalU: double
theLocalV: double
thePoint: gp_Pnt
theTangentU: gp_Vec
theTangentV: gp_Vec

Return
-------
None

Description
-----------
Calculates the point and first derivatives using pre-computed local parameters in [-1, 1] range. This bypasses periodic normalization and local parameter calculation. 
Input parameter: theLocalU pre-computed local U parameter: (U - SpanMid) / SpanHalfLen 
Input parameter: theLocalV pre-computed local V parameter: (V - SpanMid) / SpanHalfLen @param[out] thePoint the result of calculation (the point on the surface) @param[out] theTangentU tangent vector along U axis in the calculated point @param[out] theTangentV tangent vector along V axis in the calculated point.
") D1Local;
		void D1Local(double theLocalU, double theLocalV, gp_Pnt & thePoint, gp_Vec & theTangentU, gp_Vec & theTangentV);

		/****** BSplSLib_Cache::D2 ******/
		/****** md5 signature: 594a7a235c40f729425c17b69990d263 ******/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "
Parameters
----------
theU: double
theV: double
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
		void D2(const double & theU, const double & theV, gp_Pnt & thePoint, gp_Vec & theTangentU, gp_Vec & theTangentV, gp_Vec & theCurvatureU, gp_Vec & theCurvatureV, gp_Vec & theCurvatureUV);

		/****** BSplSLib_Cache::D2Local ******/
		/****** md5 signature: 5ebf8f2a8e6af3be62566be254d0ae29 ******/
		%feature("compactdefaultargs") D2Local;
		%feature("autodoc", "
Parameters
----------
theLocalU: double
theLocalV: double
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
Calculates the point and derivatives till second order using pre-computed local parameters. This bypasses periodic normalization and local parameter calculation. 
Input parameter: theLocalU pre-computed local U parameter: (U - SpanMid) / SpanHalfLen 
Input parameter: theLocalV pre-computed local V parameter: (V - SpanMid) / SpanHalfLen @param[out] thePoint the result of calculation (the point on the surface) @param[out] theTangentU tangent vector along U axis in the calculated point @param[out] theTangentV tangent vector along V axis in the calculated point @param[out] theCurvatureU curvature vector (2nd derivative on U) along U axis @param[out] theCurvatureV curvature vector (2nd derivative on V) along V axis @param[out] theCurvatureUV 2nd mixed derivative on U and V.
") D2Local;
		void D2Local(double theLocalU, double theLocalV, gp_Pnt & thePoint, gp_Vec & theTangentU, gp_Vec & theTangentV, gp_Vec & theCurvatureU, gp_Vec & theCurvatureV, gp_Vec & theCurvatureUV);

		/****** BSplSLib_Cache::IsCacheValid ******/
		/****** md5 signature: f3a1d3494f54972a0ac329abaddb9dbd ******/
		%feature("compactdefaultargs") IsCacheValid;
		%feature("autodoc", "
Parameters
----------
theParameterU: double
theParameterV: double

Return
-------
bool

Description
-----------
Verifies validity of the cache using parameters of the point \param theParameterU first parameter of the point placed in the span \param theParameterV second parameter of the point placed in the span.
") IsCacheValid;
		bool IsCacheValid(double theParameterU, double theParameterV);

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
		/****** md5 signature: 36951c9910a85a0fa5da7bd4ca9a7c4e ******/
		%feature("compactdefaultargs") Evaluate;
		%feature("autodoc", "
Parameters
----------
theDerivativeRequest: int
theUParameter: double
theVParameter: double

Return
-------
theResult: double
theErrorCode: int

Description
-----------
Function evaluation method to be defined by descendant.
") Evaluate;
		virtual void Evaluate(const int theDerivativeRequest, const double theUParameter, const double theVParameter, Standard_Real &OutValue, Standard_Integer &OutValue);

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
def bsplslib_UnitWeights(*args):
	return bsplslib.UnitWeights(*args)

@deprecated
def bsplslib_Unperiodize(*args):
	return bsplslib.Unperiodize(*args)

}
