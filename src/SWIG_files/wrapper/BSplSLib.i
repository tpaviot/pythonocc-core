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
%define BSPLSLIBDOCSTRING
"BSplSLib module, see official documentation at
https://www.opencascade.com/doc/occt-7.4.0/refman/html/package_bsplslib.html"
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
%include ../common/Operators.i
%include ../common/OccHandle.i


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

/* python proy classes for enums */
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
		/****************** BuildCache ******************/
		/**** md5 signature: b598501ca418d77ff26d5d3e7ac37474 ****/
		%feature("compactdefaultargs") BuildCache;
		%feature("autodoc", "Perform the evaluation of the taylor expansion of the bspline normalized between 0 and 1. if rational computes the homogeneous taylor expension for the numerator and stores it in cachepoles.

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

Returns
-------
None
") BuildCache;
		static void BuildCache(const Standard_Real U, const Standard_Real V, const Standard_Real USpanDomain, const Standard_Real VSpanDomain, const Standard_Boolean UPeriodicFlag, const Standard_Boolean VPeriodicFlag, const Standard_Integer UDegree, const Standard_Integer VDegree, const Standard_Integer UIndex, const Standard_Integer VIndex, const TColStd_Array1OfReal & UFlatKnots, const TColStd_Array1OfReal & VFlatKnots, const TColgp_Array2OfPnt & Poles, const TColStd_Array2OfReal * Weights, TColgp_Array2OfPnt & CachePoles, TColStd_Array2OfReal * CacheWeights);

		/****************** BuildCache ******************/
		/**** md5 signature: 3f0ef8a507277eb8714774f073a6d864 ****/
		%feature("compactdefaultargs") BuildCache;
		%feature("autodoc", "Perform the evaluation of the taylor expansion of the bspline normalized between 0 and 1. structure of result optimized for bsplslib_cache.

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

Returns
-------
None
") BuildCache;
		static void BuildCache(const Standard_Real theU, const Standard_Real theV, const Standard_Real theUSpanDomain, const Standard_Real theVSpanDomain, const Standard_Boolean theUPeriodic, const Standard_Boolean theVPeriodic, const Standard_Integer theUDegree, const Standard_Integer theVDegree, const Standard_Integer theUIndex, const Standard_Integer theVIndex, const TColStd_Array1OfReal & theUFlatKnots, const TColStd_Array1OfReal & theVFlatKnots, const TColgp_Array2OfPnt & thePoles, const TColStd_Array2OfReal * theWeights, TColStd_Array2OfReal & theCacheArray);

		/****************** CacheD0 ******************/
		/**** md5 signature: a0d811c68d31b607d6cc258bbce37e0a ****/
		%feature("compactdefaultargs") CacheD0;
		%feature("autodoc", "Perform the evaluation of the of the cache the parameter must be normalized between the 0 and 1 for the span. the cache must be valid when calling this routine. geom package will insure that. and then multiplies by the weights this just evaluates the current point the cacheparameter is where the cache was constructed the spanlength is to normalize the polynomial in the cache to avoid bad conditioning effects.

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

Returns
-------
None
") CacheD0;
		static void CacheD0(const Standard_Real U, const Standard_Real V, const Standard_Integer UDegree, const Standard_Integer VDegree, const Standard_Real UCacheParameter, const Standard_Real VCacheParameter, const Standard_Real USpanLenght, const Standard_Real VSpanLength, const TColgp_Array2OfPnt & Poles, const TColStd_Array2OfReal * Weights, gp_Pnt & Point);

		/****************** CacheD1 ******************/
		/**** md5 signature: 726982fe49caf163bec8c8874147ff78 ****/
		%feature("compactdefaultargs") CacheD1;
		%feature("autodoc", "Perform the evaluation of the of the cache the parameter must be normalized between the 0 and 1 for the span. the cache must be valid when calling this routine. geom package will insure that. and then multiplies by the weights this just evaluates the current point the cacheparameter is where the cache was constructed the spanlength is to normalize the polynomial in the cache to avoid bad conditioning effects.

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

Returns
-------
None
") CacheD1;
		static void CacheD1(const Standard_Real U, const Standard_Real V, const Standard_Integer UDegree, const Standard_Integer VDegree, const Standard_Real UCacheParameter, const Standard_Real VCacheParameter, const Standard_Real USpanLenght, const Standard_Real VSpanLength, const TColgp_Array2OfPnt & Poles, const TColStd_Array2OfReal * Weights, gp_Pnt & Point, gp_Vec & VecU, gp_Vec & VecV);

		/****************** CacheD2 ******************/
		/**** md5 signature: 8c09fde09eb6aefbb6282106a539418f ****/
		%feature("compactdefaultargs") CacheD2;
		%feature("autodoc", "Perform the evaluation of the of the cache the parameter must be normalized between the 0 and 1 for the span. the cache must be valid when calling this routine. geom package will insure that. and then multiplies by the weights this just evaluates the current point the cacheparameter is where the cache was constructed the spanlength is to normalize the polynomial in the cache to avoid bad conditioning effects.

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

Returns
-------
None
") CacheD2;
		static void CacheD2(const Standard_Real U, const Standard_Real V, const Standard_Integer UDegree, const Standard_Integer VDegree, const Standard_Real UCacheParameter, const Standard_Real VCacheParameter, const Standard_Real USpanLenght, const Standard_Real VSpanLength, const TColgp_Array2OfPnt & Poles, const TColStd_Array2OfReal * Weights, gp_Pnt & Point, gp_Vec & VecU, gp_Vec & VecV, gp_Vec & VecUU, gp_Vec & VecUV, gp_Vec & VecVV);

		/****************** CoefsD0 ******************/
		/**** md5 signature: 11885fde9811857e66b919e833f6d73a ****/
		%feature("compactdefaultargs") CoefsD0;
		%feature("autodoc", "Calls cached0 for bezier surfaces arrays computed with the method polescoefficients. warning: to be used for beziersurfaces only!!!.

Parameters
----------
U: float
V: float
Poles: TColgp_Array2OfPnt
Weights: TColStd_Array2OfReal *
Point: gp_Pnt

Returns
-------
None
") CoefsD0;
		static void CoefsD0(const Standard_Real U, const Standard_Real V, const TColgp_Array2OfPnt & Poles, const TColStd_Array2OfReal * Weights, gp_Pnt & Point);

		/****************** CoefsD1 ******************/
		/**** md5 signature: 1cb2123d3f6397ed2a00635ce8e7de93 ****/
		%feature("compactdefaultargs") CoefsD1;
		%feature("autodoc", "Calls cached0 for bezier surfaces arrays computed with the method polescoefficients. warning: to be used for beziersurfaces only!!!.

Parameters
----------
U: float
V: float
Poles: TColgp_Array2OfPnt
Weights: TColStd_Array2OfReal *
Point: gp_Pnt
VecU: gp_Vec
VecV: gp_Vec

Returns
-------
None
") CoefsD1;
		static void CoefsD1(const Standard_Real U, const Standard_Real V, const TColgp_Array2OfPnt & Poles, const TColStd_Array2OfReal * Weights, gp_Pnt & Point, gp_Vec & VecU, gp_Vec & VecV);

		/****************** CoefsD2 ******************/
		/**** md5 signature: 94747ffaf723b2a3eb214fc864501474 ****/
		%feature("compactdefaultargs") CoefsD2;
		%feature("autodoc", "Calls cached0 for bezier surfaces arrays computed with the method polescoefficients. warning: to be used for beziersurfaces only!!!.

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

Returns
-------
None
") CoefsD2;
		static void CoefsD2(const Standard_Real U, const Standard_Real V, const TColgp_Array2OfPnt & Poles, const TColStd_Array2OfReal * Weights, gp_Pnt & Point, gp_Vec & VecU, gp_Vec & VecV, gp_Vec & VecUU, gp_Vec & VecUV, gp_Vec & VecVV);

		/****************** D0 ******************/
		/**** md5 signature: 62aa9eb91146b63fe60c422d76080445 ****/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "No available documentation.

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

Returns
-------
None
") D0;
		static void D0(const Standard_Real U, const Standard_Real V, const Standard_Integer UIndex, const Standard_Integer VIndex, const TColgp_Array2OfPnt & Poles, const TColStd_Array2OfReal * Weights, const TColStd_Array1OfReal & UKnots, const TColStd_Array1OfReal & VKnots, const TColStd_Array1OfInteger * UMults, const TColStd_Array1OfInteger * VMults, const Standard_Integer UDegree, const Standard_Integer VDegree, const Standard_Boolean URat, const Standard_Boolean VRat, const Standard_Boolean UPer, const Standard_Boolean VPer, gp_Pnt & P);

		/****************** D1 ******************/
		/**** md5 signature: 45477aee62278c08011619e00b883b41 ****/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "No available documentation.

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

Returns
-------
None
") D1;
		static void D1(const Standard_Real U, const Standard_Real V, const Standard_Integer UIndex, const Standard_Integer VIndex, const TColgp_Array2OfPnt & Poles, const TColStd_Array2OfReal * Weights, const TColStd_Array1OfReal & UKnots, const TColStd_Array1OfReal & VKnots, const TColStd_Array1OfInteger * UMults, const TColStd_Array1OfInteger * VMults, const Standard_Integer Degree, const Standard_Integer VDegree, const Standard_Boolean URat, const Standard_Boolean VRat, const Standard_Boolean UPer, const Standard_Boolean VPer, gp_Pnt & P, gp_Vec & Vu, gp_Vec & Vv);

		/****************** D2 ******************/
		/**** md5 signature: 81164840d60e28eb069e53e33b276cb4 ****/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "No available documentation.

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

Returns
-------
None
") D2;
		static void D2(const Standard_Real U, const Standard_Real V, const Standard_Integer UIndex, const Standard_Integer VIndex, const TColgp_Array2OfPnt & Poles, const TColStd_Array2OfReal * Weights, const TColStd_Array1OfReal & UKnots, const TColStd_Array1OfReal & VKnots, const TColStd_Array1OfInteger * UMults, const TColStd_Array1OfInteger * VMults, const Standard_Integer UDegree, const Standard_Integer VDegree, const Standard_Boolean URat, const Standard_Boolean VRat, const Standard_Boolean UPer, const Standard_Boolean VPer, gp_Pnt & P, gp_Vec & Vu, gp_Vec & Vv, gp_Vec & Vuu, gp_Vec & Vvv, gp_Vec & Vuv);

		/****************** D3 ******************/
		/**** md5 signature: 8f6bd55d707844a103766e7f41bb7a3f ****/
		%feature("compactdefaultargs") D3;
		%feature("autodoc", "No available documentation.

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

Returns
-------
None
") D3;
		static void D3(const Standard_Real U, const Standard_Real V, const Standard_Integer UIndex, const Standard_Integer VIndex, const TColgp_Array2OfPnt & Poles, const TColStd_Array2OfReal * Weights, const TColStd_Array1OfReal & UKnots, const TColStd_Array1OfReal & VKnots, const TColStd_Array1OfInteger * UMults, const TColStd_Array1OfInteger * VMults, const Standard_Integer UDegree, const Standard_Integer VDegree, const Standard_Boolean URat, const Standard_Boolean VRat, const Standard_Boolean UPer, const Standard_Boolean VPer, gp_Pnt & P, gp_Vec & Vu, gp_Vec & Vv, gp_Vec & Vuu, gp_Vec & Vvv, gp_Vec & Vuv, gp_Vec & Vuuu, gp_Vec & Vvvv, gp_Vec & Vuuv, gp_Vec & Vuvv);

		/****************** DN ******************/
		/**** md5 signature: a87dd0fc5dec21e682e690ca4d1e0cb4 ****/
		%feature("compactdefaultargs") DN;
		%feature("autodoc", "No available documentation.

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

Returns
-------
None
") DN;
		static void DN(const Standard_Real U, const Standard_Real V, const Standard_Integer Nu, const Standard_Integer Nv, const Standard_Integer UIndex, const Standard_Integer VIndex, const TColgp_Array2OfPnt & Poles, const TColStd_Array2OfReal * Weights, const TColStd_Array1OfReal & UKnots, const TColStd_Array1OfReal & VKnots, const TColStd_Array1OfInteger * UMults, const TColStd_Array1OfInteger * VMults, const Standard_Integer UDegree, const Standard_Integer VDegree, const Standard_Boolean URat, const Standard_Boolean VRat, const Standard_Boolean UPer, const Standard_Boolean VPer, gp_Vec & Vn);

		/****************** FunctionMultiply ******************/
		/**** md5 signature: 45abca34df2cfa28f99d3579bc8a3b9c ****/
		%feature("compactdefaultargs") FunctionMultiply;
		%feature("autodoc", "This will multiply a given bspline numerator n(u,v) and denominator d(u,v) defined by its u/vbsplinedegree and u/vbsplineknots, and u/vmults. its poles and weights are arrays which are coded as array2 of the form [1..unumpoles][1..vnumpoles] by a function a(u,v) which is assumed to satisfy the following : 1. a(u,v) * n(u,v) and a(u,v) * d(u,v) is a polynomial bspline that can be expressed exactly as a bspline of degree u/vnewdegree on the knots u/vflatknots 2. the range of a(u,v) is the same as the range of n(u,v) or d(u,v) ---warning: it is the caller's responsability to insure that conditions 1. and 2. above are satisfied : no check whatsoever is made in this method -- thestatus will return 0 if ok else it will return the pivot index -- of the matrix that was inverted to compute the multiplied -- bspline : the method used is interpolation at schoenenberg -- points of a(u,v)* n(u,v) and a(u,v) * d(u,v) thestatus will return 0 if ok else it will return the pivot index of the matrix that was inverted to compute the multiplied bspline : the method used is interpolation at schoenenberg points of a(u,v)*f(u,v) --.

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

Returns
-------
theStatus: int
") FunctionMultiply;
		static void FunctionMultiply(const BSplSLib_EvaluatorFunction & Function, const Standard_Integer UBSplineDegree, const Standard_Integer VBSplineDegree, const TColStd_Array1OfReal & UBSplineKnots, const TColStd_Array1OfReal & VBSplineKnots, const TColStd_Array1OfInteger * UMults, const TColStd_Array1OfInteger * VMults, const TColgp_Array2OfPnt & Poles, const TColStd_Array2OfReal * Weights, const TColStd_Array1OfReal & UFlatKnots, const TColStd_Array1OfReal & VFlatKnots, const Standard_Integer UNewDegree, const Standard_Integer VNewDegree, TColgp_Array2OfPnt & NewNumerator, TColStd_Array2OfReal & NewDenominator, Standard_Integer &OutValue);

		/****************** GetPoles ******************/
		/**** md5 signature: 4b7d9419718ea39ec1ce8b8cf045aefc ****/
		%feature("compactdefaultargs") GetPoles;
		%feature("autodoc", "Get from fp the coordinates of the poles.

Parameters
----------
FP: TColStd_Array1OfReal
Poles: TColgp_Array2OfPnt
UDirection: bool

Returns
-------
None
") GetPoles;
		static void GetPoles(const TColStd_Array1OfReal & FP, TColgp_Array2OfPnt & Poles, const Standard_Boolean UDirection);

		/****************** GetPoles ******************/
		/**** md5 signature: 5368b56b4f2bcd48e6ca348ba72bb56f ****/
		%feature("compactdefaultargs") GetPoles;
		%feature("autodoc", "Get from fp the coordinates of the poles.

Parameters
----------
FP: TColStd_Array1OfReal
Poles: TColgp_Array2OfPnt
Weights: TColStd_Array2OfReal
UDirection: bool

Returns
-------
None
") GetPoles;
		static void GetPoles(const TColStd_Array1OfReal & FP, TColgp_Array2OfPnt & Poles, TColStd_Array2OfReal & Weights, const Standard_Boolean UDirection);

		/****************** HomogeneousD0 ******************/
		/**** md5 signature: c1464f36ca57ea65694263beff510b16 ****/
		%feature("compactdefaultargs") HomogeneousD0;
		%feature("autodoc", "Makes an homogeneous evaluation of poles and weights any and returns in p the numerator value and in w the denominator value if weights are present otherwise returns 1.0e0.

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

Returns
-------
W: float
") HomogeneousD0;
		static void HomogeneousD0(const Standard_Real U, const Standard_Real V, const Standard_Integer UIndex, const Standard_Integer VIndex, const TColgp_Array2OfPnt & Poles, const TColStd_Array2OfReal * Weights, const TColStd_Array1OfReal & UKnots, const TColStd_Array1OfReal & VKnots, const TColStd_Array1OfInteger * UMults, const TColStd_Array1OfInteger * VMults, const Standard_Integer UDegree, const Standard_Integer VDegree, const Standard_Boolean URat, const Standard_Boolean VRat, const Standard_Boolean UPer, const Standard_Boolean VPer, Standard_Real &OutValue, gp_Pnt & P);

		/****************** HomogeneousD1 ******************/
		/**** md5 signature: b5575b9030b6a4dbac54e2abef295d93 ****/
		%feature("compactdefaultargs") HomogeneousD1;
		%feature("autodoc", "Makes an homogeneous evaluation of poles and weights any and returns in p the numerator value and in w the denominator value if weights are present otherwise returns 1.0e0.

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

Returns
-------
D: float
Du: float
Dv: float
") HomogeneousD1;
		static void HomogeneousD1(const Standard_Real U, const Standard_Real V, const Standard_Integer UIndex, const Standard_Integer VIndex, const TColgp_Array2OfPnt & Poles, const TColStd_Array2OfReal * Weights, const TColStd_Array1OfReal & UKnots, const TColStd_Array1OfReal & VKnots, const TColStd_Array1OfInteger * UMults, const TColStd_Array1OfInteger * VMults, const Standard_Integer UDegree, const Standard_Integer VDegree, const Standard_Boolean URat, const Standard_Boolean VRat, const Standard_Boolean UPer, const Standard_Boolean VPer, gp_Pnt & N, gp_Vec & Nu, gp_Vec & Nv, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** IncreaseDegree ******************/
		/**** md5 signature: e662fc7ecac81af296838d57eaa19707 ****/
		%feature("compactdefaultargs") IncreaseDegree;
		%feature("autodoc", "No available documentation.

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

Returns
-------
None
") IncreaseDegree;
		static void IncreaseDegree(const Standard_Boolean UDirection, const Standard_Integer Degree, const Standard_Integer NewDegree, const Standard_Boolean Periodic, const TColgp_Array2OfPnt & Poles, const TColStd_Array2OfReal * Weights, const TColStd_Array1OfReal & Knots, const TColStd_Array1OfInteger & Mults, TColgp_Array2OfPnt & NewPoles, TColStd_Array2OfReal * NewWeights, TColStd_Array1OfReal & NewKnots, TColStd_Array1OfInteger & NewMults);

		/****************** InsertKnots ******************/
		/**** md5 signature: a4b0ae1cc503e9e34d176066d51bb1cd ****/
		%feature("compactdefaultargs") InsertKnots;
		%feature("autodoc", "No available documentation.

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
Add: bool,optional
	default value is Standard_True

Returns
-------
None
") InsertKnots;
		static void InsertKnots(const Standard_Boolean UDirection, const Standard_Integer Degree, const Standard_Boolean Periodic, const TColgp_Array2OfPnt & Poles, const TColStd_Array2OfReal * Weights, const TColStd_Array1OfReal & Knots, const TColStd_Array1OfInteger & Mults, const TColStd_Array1OfReal & AddKnots, const TColStd_Array1OfInteger * AddMults, TColgp_Array2OfPnt & NewPoles, TColStd_Array2OfReal * NewWeights, TColStd_Array1OfReal & NewKnots, TColStd_Array1OfInteger & NewMults, const Standard_Real Epsilon, const Standard_Boolean Add = Standard_True);

		/****************** Interpolate ******************/
		/**** md5 signature: 0867844694d48835dc15751d35a365fc ****/
		%feature("compactdefaultargs") Interpolate;
		%feature("autodoc", "Performs the interpolation of the data points given in the poles array in the form [1,...,rl][1,...,rc][1...polesdimension] . the collength cl and the length of uparameters must be the same. the length of vflatknots is vdegree + cl + 1. //! the rowlength rl and the length of vparameters must be the same. the length of vflatknots is degree + rl + 1. //! warning: the method used to do that interpolation is gauss elimination without pivoting. thus if the diagonal is not dominant there is no guarantee that the algorithm will work. nevertheless for cubic interpolation at knots or interpolation at scheonberg points the method will work. the inversionproblem will report 0 if there was no problem else it will give the index of the faulty pivot.

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

Returns
-------
InversionProblem: int
") Interpolate;
		static void Interpolate(const Standard_Integer UDegree, const Standard_Integer VDegree, const TColStd_Array1OfReal & UFlatKnots, const TColStd_Array1OfReal & VFlatKnots, const TColStd_Array1OfReal & UParameters, const TColStd_Array1OfReal & VParameters, TColgp_Array2OfPnt & Poles, TColStd_Array2OfReal & Weights, Standard_Integer &OutValue);

		/****************** Interpolate ******************/
		/**** md5 signature: e9a7486732129ef41a89f7390fb7aaad ****/
		%feature("compactdefaultargs") Interpolate;
		%feature("autodoc", "Performs the interpolation of the data points given in the poles array. the collength cl and the length of uparameters must be the same. the length of vflatknots is vdegree + cl + 1. //! the rowlength rl and the length of vparameters must be the same. the length of vflatknots is degree + rl + 1. //! warning: the method used to do that interpolation is gauss elimination without pivoting. thus if the diagonal is not dominant there is no guarantee that the algorithm will work. nevertheless for cubic interpolation at knots or interpolation at scheonberg points the method will work. the inversionproblem will report 0 if there was no problem else it will give the index of the faulty pivot.

Parameters
----------
UDegree: int
VDegree: int
UFlatKnots: TColStd_Array1OfReal
VFlatKnots: TColStd_Array1OfReal
UParameters: TColStd_Array1OfReal
VParameters: TColStd_Array1OfReal
Poles: TColgp_Array2OfPnt

Returns
-------
InversionProblem: int
") Interpolate;
		static void Interpolate(const Standard_Integer UDegree, const Standard_Integer VDegree, const TColStd_Array1OfReal & UFlatKnots, const TColStd_Array1OfReal & VFlatKnots, const TColStd_Array1OfReal & UParameters, const TColStd_Array1OfReal & VParameters, TColgp_Array2OfPnt & Poles, Standard_Integer &OutValue);

		/****************** IsRational ******************/
		/**** md5 signature: 238ad45424fe7f4d227ac0cccdabfdf1 ****/
		%feature("compactdefaultargs") IsRational;
		%feature("autodoc", "Returns false if all the weights of the array <weights> in the area [i1,i2] * [j1,j2] are identic. epsilon is used for comparing weights. if epsilon is 0. the epsilon of the first weight is used.

Parameters
----------
Weights: TColStd_Array2OfReal
I1: int
I2: int
J1: int
J2: int
Epsilon: float,optional
	default value is 0.0

Returns
-------
bool
") IsRational;
		static Standard_Boolean IsRational(const TColStd_Array2OfReal & Weights, const Standard_Integer I1, const Standard_Integer I2, const Standard_Integer J1, const Standard_Integer J2, const Standard_Real Epsilon = 0.0);

		/****************** Iso ******************/
		/**** md5 signature: 9e1124a641ae0d2850d147558b0e1be9 ****/
		%feature("compactdefaultargs") Iso;
		%feature("autodoc", "Computes the poles and weights of an isoparametric curve at parameter <param> (uiso if <isu> is true, viso else).

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

Returns
-------
None
") Iso;
		static void Iso(const Standard_Real Param, const Standard_Boolean IsU, const TColgp_Array2OfPnt & Poles, const TColStd_Array2OfReal * Weights, const TColStd_Array1OfReal & Knots, const TColStd_Array1OfInteger * Mults, const Standard_Integer Degree, const Standard_Boolean Periodic, TColgp_Array1OfPnt & CPoles, TColStd_Array1OfReal * CWeights);

		/****************** MovePoint ******************/
		/**** md5 signature: 5f7743a036a141c9b8c4be1ccab23031 ****/
		%feature("compactdefaultargs") MovePoint;
		%feature("autodoc", "Find the new poles which allows an old point (with a given u,v as parameters) to reach a new position uindex1,uindex2 indicate the range of poles we can move for u (1, unbpoles-1) or (2, unbpoles) -> no constraint for one side in u (2, unbpoles-1) -> the ends are enforced for u don't enter (1,nbpoles) and (1,vnbpoles) -> error: rigid move if problem in bsplinebasis calculation, no change for the curve and ufirstindex, vlastindex = 0 vfirstindex, vlastindex = 0.

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

Returns
-------
UFirstIndex: int
ULastIndex: int
VFirstIndex: int
VLastIndex: int
") MovePoint;
		static void MovePoint(const Standard_Real U, const Standard_Real V, const gp_Vec & Displ, const Standard_Integer UIndex1, const Standard_Integer UIndex2, const Standard_Integer VIndex1, const Standard_Integer VIndex2, const Standard_Integer UDegree, const Standard_Integer VDegree, const Standard_Boolean Rational, const TColgp_Array2OfPnt & Poles, const TColStd_Array2OfReal & Weights, const TColStd_Array1OfReal & UFlatKnots, const TColStd_Array1OfReal & VFlatKnots, Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue, TColgp_Array2OfPnt & NewPoles);

		/****************** NoWeights ******************/
		/**** md5 signature: bbbdcbded0a182bef34c5ef8a588d7ad ****/
		%feature("compactdefaultargs") NoWeights;
		%feature("autodoc", "Used as argument for a non rational curve.

Returns
-------
TColStd_Array2OfReal *
") NoWeights;
		static TColStd_Array2OfReal * NoWeights();

		/****************** PolesCoefficients ******************/
		/**** md5 signature: 65463c1f1f25e0a57953fd3f9ed494d8 ****/
		%feature("compactdefaultargs") PolesCoefficients;
		%feature("autodoc", "Warning! to be used for beziersurfaces only!!!.

Parameters
----------
Poles: TColgp_Array2OfPnt
CachePoles: TColgp_Array2OfPnt

Returns
-------
None
") PolesCoefficients;
		static void PolesCoefficients(const TColgp_Array2OfPnt & Poles, TColgp_Array2OfPnt & CachePoles);

		/****************** PolesCoefficients ******************/
		/**** md5 signature: 22743faa22774391b4fee45051eb0d44 ****/
		%feature("compactdefaultargs") PolesCoefficients;
		%feature("autodoc", "Encapsulation of buildcache to perform the evaluation of the taylor expansion for beziersurfaces at parameters 0.,0.; warning: to be used for beziersurfaces only!!!.

Parameters
----------
Poles: TColgp_Array2OfPnt
Weights: TColStd_Array2OfReal *
CachePoles: TColgp_Array2OfPnt
CacheWeights: TColStd_Array2OfReal *

Returns
-------
None
") PolesCoefficients;
		static void PolesCoefficients(const TColgp_Array2OfPnt & Poles, const TColStd_Array2OfReal * Weights, TColgp_Array2OfPnt & CachePoles, TColStd_Array2OfReal * CacheWeights);

		/****************** RationalDerivative ******************/
		/**** md5 signature: 3e4a753d2a8aa1e4a38e26bfc421f4e9 ****/
		%feature("compactdefaultargs") RationalDerivative;
		%feature("autodoc", "This is a one dimensional function typedef void (*evaluatorfunction) ( standard_integer // derivative request standard_real * // startend[2][2] // [0] = u // [1] = v // [0] = start // [1] = end standard_real // uparameter standard_real // vparamerer standard_real & // result standard_integer &) ;// error code serves to multiply a given vectorial bspline by a function computes the derivatives of a ratio of two-variables functions x(u,v) / w(u,v) at orders <n,m>, x(u,v) is a vector in dimension <3>. //! <ders> is an array containing the values of the input derivatives from 0 to min(<n>,<udeg>), 0 to min(<m>,<vdeg>). for orders higher than <udeg,vdeg> the input derivatives are assumed to be 0. //! the <ders> is a 2d array and the dimension of the lines is always (<vdeg>+1) * (<3>+1), even if <n> is smaller than <udeg> (the derivatives higher than <n> are not used). //! content of <ders> : //! x(i,j)[k] means : the composant k of x derivated (i) times in u and (j) times in v. //! ... first line ... //! x[1],x[2],...,x[3],w x(0,1)[1],...,x(0,1)[3],w(1,0) ... x(0,vdeg)[1],...,x(0,vdeg)[3],w(0,vdeg) //! ... then second line ... //! x(1,0)[1],...,x(1,0)[3],w(1,0) x(1,1)[1],...,x(1,1)[3],w(1,1) ... x(1,vdeg)[1],...,x(1,vdeg)[3],w(1,vdeg) //! ... //! ... last line ... //! x(udeg,0)[1],...,x(udeg,0)[3],w(udeg,0) x(udeg,1)[1],...,x(udeg,1)[3],w(udeg,1) ... x(udeg,vdeg)[1],...,x(udeg,vdeg)[3],w(udeg,vdeg) //! if <all> is false, only the derivative at order <n,m> is computed. <rders> is an array of length 3 which will contain the result : //! x(1)/w , x(2)/w , ... derivated <n> <m> times //! if <all> is true multiples derivatives are computed. all the derivatives (i,j) with 0 <= i+j <= max(n,m) are computed. <rders> is an array of length 3 * (<n>+1) * (<m>+1) which will contains : //! x(1)/w , x(2)/w , ... x(1)/w , x(2)/w , ... derivated <0,1> times x(1)/w , x(2)/w , ... derivated <0,2> times ... x(1)/w , x(2)/w , ... derivated <0,n> times //! x(1)/w , x(2)/w , ... derivated <1,0> times x(1)/w , x(2)/w , ... derivated <1,1> times ... x(1)/w , x(2)/w , ... derivated <1,n> times //! x(1)/w , x(2)/w , ... derivated <n,0> times .... warning: <rders> must be dimensionned properly.

Parameters
----------
UDeg: int
VDeg: int
N: int
M: int
All: bool,optional
	default value is Standard_True

Returns
-------
Ders: float
RDers: float
") RationalDerivative;
		static void RationalDerivative(const Standard_Integer UDeg, const Standard_Integer VDeg, const Standard_Integer N, const Standard_Integer M, Standard_Real &OutValue, Standard_Real &OutValue, const Standard_Boolean All = Standard_True);

		/****************** RemoveKnot ******************/
		/**** md5 signature: 1e14d1e66a2450406f9d61aa0978fec3 ****/
		%feature("compactdefaultargs") RemoveKnot;
		%feature("autodoc", "No available documentation.

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

Returns
-------
bool
") RemoveKnot;
		static Standard_Boolean RemoveKnot(const Standard_Boolean UDirection, const Standard_Integer Index, const Standard_Integer Mult, const Standard_Integer Degree, const Standard_Boolean Periodic, const TColgp_Array2OfPnt & Poles, const TColStd_Array2OfReal * Weights, const TColStd_Array1OfReal & Knots, const TColStd_Array1OfInteger & Mults, TColgp_Array2OfPnt & NewPoles, TColStd_Array2OfReal * NewWeights, TColStd_Array1OfReal & NewKnots, TColStd_Array1OfInteger & NewMults, const Standard_Real Tolerance);

		/****************** Resolution ******************/
		/**** md5 signature: e527ac90571906a5630da56a0204b919 ****/
		%feature("compactdefaultargs") Resolution;
		%feature("autodoc", "Given a tolerance in 3d space returns two tolerances, one in u one in v such that for all (u1,v1) and (u0,v0) in the domain of the surface f(u,v) we have : | u1 - u0 | < utolerance and | v1 - v0 | < vtolerance we have |f (u1,v1) - f (u0,v0)| < tolerance3d.

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

Returns
-------
UTolerance: float
VTolerance: float
") Resolution;
		static void Resolution(const TColgp_Array2OfPnt & Poles, const TColStd_Array2OfReal * Weights, const TColStd_Array1OfReal & UKnots, const TColStd_Array1OfReal & VKnots, const TColStd_Array1OfInteger & UMults, const TColStd_Array1OfInteger & VMults, const Standard_Integer UDegree, const Standard_Integer VDegree, const Standard_Boolean URat, const Standard_Boolean VRat, const Standard_Boolean UPer, const Standard_Boolean VPer, const Standard_Real Tolerance3D, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** Reverse ******************/
		/**** md5 signature: 39ce17f23b5010ec411d98e4d1858323 ****/
		%feature("compactdefaultargs") Reverse;
		%feature("autodoc", "Reverses the array of poles. last is the index of the new first row( col) of poles. on a non periodic surface last is poles.upper(). on a periodic curve last is (number of flat knots - degree - 1) or (sum of multiplicities(but for the last) + degree - 1).

Parameters
----------
Poles: TColgp_Array2OfPnt
Last: int
UDirection: bool

Returns
-------
None
") Reverse;
		static void Reverse(TColgp_Array2OfPnt & Poles, const Standard_Integer Last, const Standard_Boolean UDirection);

		/****************** Reverse ******************/
		/**** md5 signature: 5819ffb0c18b7f4008d9b8b25ff98072 ****/
		%feature("compactdefaultargs") Reverse;
		%feature("autodoc", "Reverses the array of weights.

Parameters
----------
Weights: TColStd_Array2OfReal
Last: int
UDirection: bool

Returns
-------
None
") Reverse;
		static void Reverse(TColStd_Array2OfReal & Weights, const Standard_Integer Last, const Standard_Boolean UDirection);

		/****************** SetPoles ******************/
		/**** md5 signature: 9d458899241c684863dd75a17f9b5fd7 ****/
		%feature("compactdefaultargs") SetPoles;
		%feature("autodoc", "Copy in fp the coordinates of the poles.

Parameters
----------
Poles: TColgp_Array2OfPnt
FP: TColStd_Array1OfReal
UDirection: bool

Returns
-------
None
") SetPoles;
		static void SetPoles(const TColgp_Array2OfPnt & Poles, TColStd_Array1OfReal & FP, const Standard_Boolean UDirection);

		/****************** SetPoles ******************/
		/**** md5 signature: e3d166fb8bc62ca2eabdd84250aac1c0 ****/
		%feature("compactdefaultargs") SetPoles;
		%feature("autodoc", "Copy in fp the coordinates of the poles.

Parameters
----------
Poles: TColgp_Array2OfPnt
Weights: TColStd_Array2OfReal
FP: TColStd_Array1OfReal
UDirection: bool

Returns
-------
None
") SetPoles;
		static void SetPoles(const TColgp_Array2OfPnt & Poles, const TColStd_Array2OfReal & Weights, TColStd_Array1OfReal & FP, const Standard_Boolean UDirection);

		/****************** Unperiodize ******************/
		/**** md5 signature: 1d1f27b1521872db93340fa45dac9f60 ****/
		%feature("compactdefaultargs") Unperiodize;
		%feature("autodoc", "No available documentation.

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

Returns
-------
None
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
		/****************** BSplSLib_Cache ******************/
		/**** md5 signature: 5a0c5a66c6ece3fa3e4decf4242b70f0 ****/
		%feature("compactdefaultargs") BSplSLib_Cache;
		%feature("autodoc", "Constructor for caching of the span for the surface \param thedegreeu degree along the first parameter (u) of the surface \param theperiodicu identify the surface is periodical along u axis \param theflatknotsu knots of the surface (with repetition) along u axis \param thedegreev degree alogn the second parameter (v) of the surface \param theperiodicv identify the surface is periodical along v axis \param theflatknotsv knots of the surface (with repetition) along v axis \param theweights array of weights of corresponding poles.

Parameters
----------
theDegreeU: int
thePeriodicU: bool
theFlatKnotsU: TColStd_Array1OfReal
theDegreeV: int
thePeriodicV: bool
theFlatKnotsV: TColStd_Array1OfReal
theWeights: TColStd_Array2OfReal *,optional
	default value is NULL

Returns
-------
None
") BSplSLib_Cache;
		 BSplSLib_Cache(const Standard_Integer & theDegreeU, const Standard_Boolean & thePeriodicU, const TColStd_Array1OfReal & theFlatKnotsU, const Standard_Integer & theDegreeV, const Standard_Boolean & thePeriodicV, const TColStd_Array1OfReal & theFlatKnotsV, const TColStd_Array2OfReal * theWeights = NULL);

		/****************** BuildCache ******************/
		/**** md5 signature: 96b423c64477b333b1d008bf9dc6f681 ****/
		%feature("compactdefaultargs") BuildCache;
		%feature("autodoc", "Recomputes the cache data. does not verify validity of the cache \param theparameteru the parametric value on the u axis to identify the span \param theparameterv the parametric value on the v axis to identify the span \param thedegreeu degree along u axis \param theperiodicu identify whether the surface is periodic along u axis \param theflatknotsu flat knots of the surface along u axis \param thedegreev degree along v axis \param theperiodicv identify whether the surface is periodic along v axis \param theflatknotsv flat knots of the surface along v axis \param thepoles array of poles of the surface \param theweights array of weights of corresponding poles.

Parameters
----------
theParameterU: float
theParameterV: float
theFlatKnotsU: TColStd_Array1OfReal
theFlatKnotsV: TColStd_Array1OfReal
thePoles: TColgp_Array2OfPnt
theWeights: TColStd_Array2OfReal *,optional
	default value is NULL

Returns
-------
None
") BuildCache;
		void BuildCache(const Standard_Real & theParameterU, const Standard_Real & theParameterV, const TColStd_Array1OfReal & theFlatKnotsU, const TColStd_Array1OfReal & theFlatKnotsV, const TColgp_Array2OfPnt & thePoles, const TColStd_Array2OfReal * theWeights = NULL);

		/****************** D0 ******************/
		/**** md5 signature: 943ab97ce1a5d88517242b8403789041 ****/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "Calculates the point on the surface for specified parameters \param[in] theu first parameter for calculation of the value \param[in] thev second parameter for calculation of the value \param[out] thepoint the result of calculation (the point on the surface).

Parameters
----------
theU: float
theV: float
thePoint: gp_Pnt

Returns
-------
None
") D0;
		void D0(const Standard_Real & theU, const Standard_Real & theV, gp_Pnt & thePoint);

		/****************** D1 ******************/
		/**** md5 signature: 39f51e39b845b43a5a354d6f6f09f6ca ****/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "Calculates the point on the surface and its first derivative \param[in] theu first parameter of calculation of the value \param[in] thev second parameter of calculation of the value \param[out] thepoint the result of calculation (the point on the surface) \param[out] thetangentu tangent vector along u axis in the calculated point \param[out] thetangentv tangent vector along v axis in the calculated point.

Parameters
----------
theU: float
theV: float
thePoint: gp_Pnt
theTangentU: gp_Vec
theTangentV: gp_Vec

Returns
-------
None
") D1;
		void D1(const Standard_Real & theU, const Standard_Real & theV, gp_Pnt & thePoint, gp_Vec & theTangentU, gp_Vec & theTangentV);

		/****************** D2 ******************/
		/**** md5 signature: 3021a8678a2ebc6f53147e41bc3036da ****/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "Calculates the point on the surface and derivatives till second order \param[in] theu first parameter of calculation of the value \param[in] thev second parameter of calculation of the value \param[out] thepoint the result of calculation (the point on the surface) \param[out] thetangentu tangent vector along u axis in the calculated point \param[out] thetangentv tangent vector along v axis in the calculated point \param[out] thecurvatureu curvature vector (2nd derivative on u) along u axis \param[out] thecurvaturev curvature vector (2nd derivative on v) along v axis \param[out] thecurvatureuv 2nd mixed derivative on u anv v.

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

Returns
-------
None
") D2;
		void D2(const Standard_Real & theU, const Standard_Real & theV, gp_Pnt & thePoint, gp_Vec & theTangentU, gp_Vec & theTangentV, gp_Vec & theCurvatureU, gp_Vec & theCurvatureV, gp_Vec & theCurvatureUV);

		/****************** IsCacheValid ******************/
		/**** md5 signature: 2d848242b9372204ece31b0de70cdf17 ****/
		%feature("compactdefaultargs") IsCacheValid;
		%feature("autodoc", "Verifies validity of the cache using parameters of the point \param theparameteru first parameter of the point placed in the span \param theparameterv second parameter of the point placed in the span.

Parameters
----------
theParameterU: float
theParameterV: float

Returns
-------
bool
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
/* python proxy for excluded classes */
%pythoncode {
@classnotwrapped
class BSplSLib_EvaluatorFunction:
	pass

}
/* end python proxy for excluded classes */
/* harray1 classes */
/* harray2 classes */
/* hsequence classes */
