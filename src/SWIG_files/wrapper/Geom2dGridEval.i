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
%define GEOM2DGRIDEVALDOCSTRING
"Geom2dGridEval module, see official documentation at
https://dev.opencascade.org/doc/occt-7.9.0/refman/html/package_geom2dgrideval.html"
%enddef
%module (package="OCC.Core", docstring=GEOM2DGRIDEVALDOCSTRING) Geom2dGridEval


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
#include<Geom2dGridEval_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<Geom2d_module.hxx>
#include<TColStd_module.hxx>
#include<Adaptor2d_module.hxx>
#include<GeomAbs_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
#include<OSD_module.hxx>
#include<Bnd_module.hxx>
#include<TopTools_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import Geom2d.i
%import TColStd.i
%import Adaptor2d.i
%import GeomAbs.i

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
/* end handles declaration */

/* templates */
/* end templates declaration */

/* typedefs */
/* end typedefs declaration */

/****************
* class CurveD1 *
****************/
/****************
* class CurveD2 *
****************/
/****************
* class CurveD3 *
****************/
/************************************
* class Geom2dGridEval_BSplineCurve *
************************************/
class Geom2dGridEval_BSplineCurve {
	public:
		/****** Geom2dGridEval_BSplineCurve::Geom2dGridEval_BSplineCurve ******/
		/****** md5 signature: c6042f2bad1dff1184eed3cb07c33a73 ******/
		%feature("compactdefaultargs") Geom2dGridEval_BSplineCurve;
		%feature("autodoc", "
Parameters
----------
theCurve: Geom2d_BSplineCurve

Return
-------
None

Description
-----------
Constructor with geometry. 
Parameter theCurve the 2D B-spline curve to evaluate.
") Geom2dGridEval_BSplineCurve;
		 Geom2dGridEval_BSplineCurve(const opencascade::handle<Geom2d_BSplineCurve> & theCurve);

		/****** Geom2dGridEval_BSplineCurve::EvaluateGrid ******/
		/****** md5 signature: 6c6acd79462dbb4b548da3f972909071 ******/
		%feature("compactdefaultargs") EvaluateGrid;
		%feature("autodoc", "
Parameters
----------
theParams: TColStd_Array1OfReal

Return
-------
NCollection_Array1<gp_Pnt2d >

Description
-----------
Evaluate all grid points. Points are evaluated in span-grouped order to minimize cache rebuilds. 
Parameter theParams array of parameter values 
Return: array of evaluated points (1-based indexing), or empty array if geometry is null or no parameters.
") EvaluateGrid;
		NCollection_Array1<gp_Pnt2d > EvaluateGrid(const TColStd_Array1OfReal & theParams);

		/****** Geom2dGridEval_BSplineCurve::EvaluateGridD1 ******/
		/****** md5 signature: e196ad674b5ccd8ecd17d0af013242d3 ******/
		%feature("compactdefaultargs") EvaluateGridD1;
		%feature("autodoc", "
Parameters
----------
theParams: TColStd_Array1OfReal

Return
-------
NCollection_Array1<Geom2dGridEval::CurveD1 >

Description
-----------
Evaluate all grid points with first derivative. 
Parameter theParams array of parameter values 
Return: array of CurveD1 (1-based indexing), or empty array if geometry is null or no parameters.
") EvaluateGridD1;
		NCollection_Array1<Geom2dGridEval::CurveD1 > EvaluateGridD1(const TColStd_Array1OfReal & theParams);

		/****** Geom2dGridEval_BSplineCurve::EvaluateGridD2 ******/
		/****** md5 signature: 7a3a1631560bce8bba862324c6d61f30 ******/
		%feature("compactdefaultargs") EvaluateGridD2;
		%feature("autodoc", "
Parameters
----------
theParams: TColStd_Array1OfReal

Return
-------
NCollection_Array1<Geom2dGridEval::CurveD2 >

Description
-----------
Evaluate all grid points with first and second derivatives. 
Parameter theParams array of parameter values 
Return: array of CurveD2 (1-based indexing), or empty array if geometry is null or no parameters.
") EvaluateGridD2;
		NCollection_Array1<Geom2dGridEval::CurveD2 > EvaluateGridD2(const TColStd_Array1OfReal & theParams);

		/****** Geom2dGridEval_BSplineCurve::EvaluateGridD3 ******/
		/****** md5 signature: 22ac82d3414d7e2f839431d26fb91039 ******/
		%feature("compactdefaultargs") EvaluateGridD3;
		%feature("autodoc", "
Parameters
----------
theParams: TColStd_Array1OfReal

Return
-------
NCollection_Array1<Geom2dGridEval::CurveD3 >

Description
-----------
Evaluate all grid points with first, second, and third derivatives. 
Parameter theParams array of parameter values 
Return: array of CurveD3 (1-based indexing), or empty array if geometry is null or no parameters.
") EvaluateGridD3;
		NCollection_Array1<Geom2dGridEval::CurveD3 > EvaluateGridD3(const TColStd_Array1OfReal & theParams);

		/****** Geom2dGridEval_BSplineCurve::EvaluateGridDN ******/
		/****** md5 signature: e0a5283861089feb19adf43e601d7ab2 ******/
		%feature("compactdefaultargs") EvaluateGridDN;
		%feature("autodoc", "
Parameters
----------
theParams: TColStd_Array1OfReal
theN: int

Return
-------
NCollection_Array1<gp_Vec2d >

Description
-----------
Evaluate Nth derivative at all grid points. For orders 1-3, reuses EvaluateGridD1/D2/D3. For orders > 3, uses BSplCLib::DN. 
Parameter theParams array of parameter values 
Parameter theN derivative order (N >= 1) 
Return: array of derivative vectors (1-based indexing).
") EvaluateGridDN;
		NCollection_Array1<gp_Vec2d > EvaluateGridDN(const TColStd_Array1OfReal & theParams, int theN);

		/****** Geom2dGridEval_BSplineCurve::Geometry ******/
		/****** md5 signature: 90de0bb87d4fea894217a4fc44634b46 ******/
		%feature("compactdefaultargs") Geometry;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom2d_BSplineCurve>

Description
-----------
Returns the geometry handle.
") Geometry;
		const opencascade::handle<Geom2d_BSplineCurve> & Geometry();

};


%extend Geom2dGridEval_BSplineCurve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************************
* class Geom2dGridEval_BezierCurve *
***********************************/
class Geom2dGridEval_BezierCurve {
	public:
		/****** Geom2dGridEval_BezierCurve::Geom2dGridEval_BezierCurve ******/
		/****** md5 signature: e6e3f7ebb22269379941a3184cfe220f ******/
		%feature("compactdefaultargs") Geom2dGridEval_BezierCurve;
		%feature("autodoc", "
Parameters
----------
theBezier: Geom2d_BezierCurve

Return
-------
None

Description
-----------
Constructor with geometry. 
Parameter theBezier the 2D bezier curve geometry to evaluate.
") Geom2dGridEval_BezierCurve;
		 Geom2dGridEval_BezierCurve(const opencascade::handle<Geom2d_BezierCurve> & theBezier);

		/****** Geom2dGridEval_BezierCurve::EvaluateGrid ******/
		/****** md5 signature: 6c6acd79462dbb4b548da3f972909071 ******/
		%feature("compactdefaultargs") EvaluateGrid;
		%feature("autodoc", "
Parameters
----------
theParams: TColStd_Array1OfReal

Return
-------
NCollection_Array1<gp_Pnt2d >

Description
-----------
Evaluate all grid points. 
Parameter theParams array of parameter values 
Return: array of evaluated points (1-based indexing), or empty array if geometry is null or no parameters.
") EvaluateGrid;
		NCollection_Array1<gp_Pnt2d > EvaluateGrid(const TColStd_Array1OfReal & theParams);

		/****** Geom2dGridEval_BezierCurve::EvaluateGridD1 ******/
		/****** md5 signature: e196ad674b5ccd8ecd17d0af013242d3 ******/
		%feature("compactdefaultargs") EvaluateGridD1;
		%feature("autodoc", "
Parameters
----------
theParams: TColStd_Array1OfReal

Return
-------
NCollection_Array1<Geom2dGridEval::CurveD1 >

Description
-----------
Evaluate all grid points with first derivative. 
Parameter theParams array of parameter values 
Return: array of CurveD1 (1-based indexing).
") EvaluateGridD1;
		NCollection_Array1<Geom2dGridEval::CurveD1 > EvaluateGridD1(const TColStd_Array1OfReal & theParams);

		/****** Geom2dGridEval_BezierCurve::EvaluateGridD2 ******/
		/****** md5 signature: 7a3a1631560bce8bba862324c6d61f30 ******/
		%feature("compactdefaultargs") EvaluateGridD2;
		%feature("autodoc", "
Parameters
----------
theParams: TColStd_Array1OfReal

Return
-------
NCollection_Array1<Geom2dGridEval::CurveD2 >

Description
-----------
Evaluate all grid points with first and second derivatives. 
Parameter theParams array of parameter values 
Return: array of CurveD2 (1-based indexing).
") EvaluateGridD2;
		NCollection_Array1<Geom2dGridEval::CurveD2 > EvaluateGridD2(const TColStd_Array1OfReal & theParams);

		/****** Geom2dGridEval_BezierCurve::EvaluateGridD3 ******/
		/****** md5 signature: 22ac82d3414d7e2f839431d26fb91039 ******/
		%feature("compactdefaultargs") EvaluateGridD3;
		%feature("autodoc", "
Parameters
----------
theParams: TColStd_Array1OfReal

Return
-------
NCollection_Array1<Geom2dGridEval::CurveD3 >

Description
-----------
Evaluate all grid points with first, second, and third derivatives. 
Parameter theParams array of parameter values 
Return: array of CurveD3 (1-based indexing).
") EvaluateGridD3;
		NCollection_Array1<Geom2dGridEval::CurveD3 > EvaluateGridD3(const TColStd_Array1OfReal & theParams);

		/****** Geom2dGridEval_BezierCurve::EvaluateGridDN ******/
		/****** md5 signature: e0a5283861089feb19adf43e601d7ab2 ******/
		%feature("compactdefaultargs") EvaluateGridDN;
		%feature("autodoc", "
Parameters
----------
theParams: TColStd_Array1OfReal
theN: int

Return
-------
NCollection_Array1<gp_Vec2d >

Description
-----------
Evaluate Nth derivative at all grid points. For orders 1-3, reuses EvaluateGridD1/D2/D3. For orders > 3, uses BSplCLib::DN. 
Parameter theParams array of parameter values 
Parameter theN derivative order (N >= 1) 
Return: array of derivative vectors (1-based indexing).
") EvaluateGridDN;
		NCollection_Array1<gp_Vec2d > EvaluateGridDN(const TColStd_Array1OfReal & theParams, int theN);

		/****** Geom2dGridEval_BezierCurve::Geometry ******/
		/****** md5 signature: 90f182325cb637da6ef594d6aad90032 ******/
		%feature("compactdefaultargs") Geometry;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom2d_BezierCurve>

Description
-----------
Returns the geometry handle.
") Geometry;
		const opencascade::handle<Geom2d_BezierCurve> & Geometry();

};


%extend Geom2dGridEval_BezierCurve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************
* class Geom2dGridEval_Circle *
******************************/
class Geom2dGridEval_Circle {
	public:
		/****** Geom2dGridEval_Circle::Geom2dGridEval_Circle ******/
		/****** md5 signature: 7ad52a826c8b7d1a66acdc362a7475e1 ******/
		%feature("compactdefaultargs") Geom2dGridEval_Circle;
		%feature("autodoc", "
Parameters
----------
theCircle: Geom2d_Circle

Return
-------
None

Description
-----------
Constructor with geometry. 
Parameter theCircle the 2D circle geometry to evaluate.
") Geom2dGridEval_Circle;
		 Geom2dGridEval_Circle(const opencascade::handle<Geom2d_Circle> & theCircle);

		/****** Geom2dGridEval_Circle::EvaluateGrid ******/
		/****** md5 signature: 6c6acd79462dbb4b548da3f972909071 ******/
		%feature("compactdefaultargs") EvaluateGrid;
		%feature("autodoc", "
Parameters
----------
theParams: TColStd_Array1OfReal

Return
-------
NCollection_Array1<gp_Pnt2d >

Description
-----------
Evaluate all grid points. 
Parameter theParams array of parameter values (angles in radians) 
Return: array of evaluated points (1-based indexing), or empty array if geometry is null or no parameters.
") EvaluateGrid;
		NCollection_Array1<gp_Pnt2d > EvaluateGrid(const TColStd_Array1OfReal & theParams);

		/****** Geom2dGridEval_Circle::EvaluateGridD1 ******/
		/****** md5 signature: e196ad674b5ccd8ecd17d0af013242d3 ******/
		%feature("compactdefaultargs") EvaluateGridD1;
		%feature("autodoc", "
Parameters
----------
theParams: TColStd_Array1OfReal

Return
-------
NCollection_Array1<Geom2dGridEval::CurveD1 >

Description
-----------
Evaluate all grid points with first derivative. D1 = R * (-sin(u) * XDir + cos(u) * YDir) 
Parameter theParams array of parameter values 
Return: array of CurveD1 (1-based indexing), or empty array if geometry is null or no parameters.
") EvaluateGridD1;
		NCollection_Array1<Geom2dGridEval::CurveD1 > EvaluateGridD1(const TColStd_Array1OfReal & theParams);

		/****** Geom2dGridEval_Circle::EvaluateGridD2 ******/
		/****** md5 signature: 7a3a1631560bce8bba862324c6d61f30 ******/
		%feature("compactdefaultargs") EvaluateGridD2;
		%feature("autodoc", "
Parameters
----------
theParams: TColStd_Array1OfReal

Return
-------
NCollection_Array1<Geom2dGridEval::CurveD2 >

Description
-----------
Evaluate all grid points with first and second derivatives. D2 = R * (-cos(u) * XDir - sin(u) * YDir) = -P (relative to center) 
Parameter theParams array of parameter values 
Return: array of CurveD2 (1-based indexing), or empty array if geometry is null or no parameters.
") EvaluateGridD2;
		NCollection_Array1<Geom2dGridEval::CurveD2 > EvaluateGridD2(const TColStd_Array1OfReal & theParams);

		/****** Geom2dGridEval_Circle::EvaluateGridD3 ******/
		/****** md5 signature: 22ac82d3414d7e2f839431d26fb91039 ******/
		%feature("compactdefaultargs") EvaluateGridD3;
		%feature("autodoc", "
Parameters
----------
theParams: TColStd_Array1OfReal

Return
-------
NCollection_Array1<Geom2dGridEval::CurveD3 >

Description
-----------
Evaluate all grid points with first, second, and third derivatives. D3 = R * (sin(u) * XDir - cos(u) * YDir) = -D1 
Parameter theParams array of parameter values 
Return: array of CurveD3 (1-based indexing), or empty array if geometry is null or no parameters.
") EvaluateGridD3;
		NCollection_Array1<Geom2dGridEval::CurveD3 > EvaluateGridD3(const TColStd_Array1OfReal & theParams);

		/****** Geom2dGridEval_Circle::EvaluateGridDN ******/
		/****** md5 signature: e0a5283861089feb19adf43e601d7ab2 ******/
		%feature("compactdefaultargs") EvaluateGridDN;
		%feature("autodoc", "
Parameters
----------
theParams: TColStd_Array1OfReal
theN: int

Return
-------
NCollection_Array1<gp_Vec2d >

Description
-----------
Evaluate Nth derivative at all grid points. Circle has cyclic derivatives with period 4: D1 = R * (-sin(u) * X + cos(u) * Y) D2 = R * (-cos(u) * X - sin(u) * Y) D3 = R * (sin(u) * X - cos(u) * Y) D4 = R * (cos(u) * X + sin(u) * Y) = D0, then repeats 
Parameter theParams array of parameter values 
Parameter theN derivative order (N >= 1) 
Return: array of derivative vectors (1-based indexing), or empty array if geometry is null or no parameters.
") EvaluateGridDN;
		NCollection_Array1<gp_Vec2d > EvaluateGridDN(const TColStd_Array1OfReal & theParams, int theN);

		/****** Geom2dGridEval_Circle::Geometry ******/
		/****** md5 signature: 773c23ef1ce3ba31799f772e2bea27ec ******/
		%feature("compactdefaultargs") Geometry;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom2d_Circle>

Description
-----------
Returns the geometry handle.
") Geometry;
		const opencascade::handle<Geom2d_Circle> & Geometry();

};


%extend Geom2dGridEval_Circle {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************
* class Geom2dGridEval_Curve *
*****************************/
class Geom2dGridEval_Curve {
	public:
		/****** Geom2dGridEval_Curve::Geom2dGridEval_Curve ******/
		/****** md5 signature: 00a1968d2914c1f121eff45d4d8fb214 ******/
		%feature("compactdefaultargs") Geom2dGridEval_Curve;
		%feature("autodoc", "
Parameters
----------
theCurve: Adaptor2d_Curve2d

Return
-------
None

Description
-----------
Construct from 2D adaptor reference (auto-detects curve type). For Geom2dAdaptor_Curve, extracts underlying Geom2d_Curve for optimized evaluation. For other adaptors, stores reference for fallback evaluation. @note The curve adaptor reference must remain valid during the lifetime of this evaluator when using fallback evaluation. 
Input parameter: theCurve 2D curve adaptor reference to evaluate.
") Geom2dGridEval_Curve;
		 Geom2dGridEval_Curve(const Adaptor2d_Curve2d & theCurve);

		/****** Geom2dGridEval_Curve::Geom2dGridEval_Curve ******/
		/****** md5 signature: 6d43a4b516d81b9db600bad86224cf6c ******/
		%feature("compactdefaultargs") Geom2dGridEval_Curve;
		%feature("autodoc", "
Parameters
----------
theCurve: Geom2d_Curve

Return
-------
None

Description
-----------
Construct from geometry handle (auto-detects curve type). 
Input parameter: theCurve 2D geometry to evaluate.
") Geom2dGridEval_Curve;
		 Geom2dGridEval_Curve(const opencascade::handle<Geom2d_Curve> & theCurve);

		/****** Geom2dGridEval_Curve::EvaluateGrid ******/
		/****** md5 signature: 6c6acd79462dbb4b548da3f972909071 ******/
		%feature("compactdefaultargs") EvaluateGrid;
		%feature("autodoc", "
Parameters
----------
theParams: TColStd_Array1OfReal

Return
-------
NCollection_Array1<gp_Pnt2d >

Description
-----------
Evaluate grid points at all parameters. 
Parameter theParams array of parameter values 
Return: array of 2D points (1-based indexing).
") EvaluateGrid;
		NCollection_Array1<gp_Pnt2d > EvaluateGrid(const TColStd_Array1OfReal & theParams);

		/****** Geom2dGridEval_Curve::EvaluateGridD1 ******/
		/****** md5 signature: e196ad674b5ccd8ecd17d0af013242d3 ******/
		%feature("compactdefaultargs") EvaluateGridD1;
		%feature("autodoc", "
Parameters
----------
theParams: TColStd_Array1OfReal

Return
-------
NCollection_Array1<Geom2dGridEval::CurveD1 >

Description
-----------
Evaluate grid points with first derivative. 
Parameter theParams array of parameter values 
Return: array of CurveD1 (1-based indexing).
") EvaluateGridD1;
		NCollection_Array1<Geom2dGridEval::CurveD1 > EvaluateGridD1(const TColStd_Array1OfReal & theParams);

		/****** Geom2dGridEval_Curve::EvaluateGridD2 ******/
		/****** md5 signature: 7a3a1631560bce8bba862324c6d61f30 ******/
		%feature("compactdefaultargs") EvaluateGridD2;
		%feature("autodoc", "
Parameters
----------
theParams: TColStd_Array1OfReal

Return
-------
NCollection_Array1<Geom2dGridEval::CurveD2 >

Description
-----------
Evaluate grid points with first and second derivatives. 
Parameter theParams array of parameter values 
Return: array of CurveD2 (1-based indexing).
") EvaluateGridD2;
		NCollection_Array1<Geom2dGridEval::CurveD2 > EvaluateGridD2(const TColStd_Array1OfReal & theParams);

		/****** Geom2dGridEval_Curve::EvaluateGridD3 ******/
		/****** md5 signature: 22ac82d3414d7e2f839431d26fb91039 ******/
		%feature("compactdefaultargs") EvaluateGridD3;
		%feature("autodoc", "
Parameters
----------
theParams: TColStd_Array1OfReal

Return
-------
NCollection_Array1<Geom2dGridEval::CurveD3 >

Description
-----------
Evaluate grid points with first, second, and third derivatives. 
Parameter theParams array of parameter values 
Return: array of CurveD3 (1-based indexing).
") EvaluateGridD3;
		NCollection_Array1<Geom2dGridEval::CurveD3 > EvaluateGridD3(const TColStd_Array1OfReal & theParams);

		/****** Geom2dGridEval_Curve::EvaluateGridDN ******/
		/****** md5 signature: e0a5283861089feb19adf43e601d7ab2 ******/
		%feature("compactdefaultargs") EvaluateGridDN;
		%feature("autodoc", "
Parameters
----------
theParams: TColStd_Array1OfReal
theN: int

Return
-------
NCollection_Array1<gp_Vec2d >

Description
-----------
Evaluate Nth derivative at all grid points. 
Parameter theParams array of parameter values 
Parameter theN derivative order (N >= 1) 
Return: array of derivative vectors (1-based indexing).
") EvaluateGridDN;
		NCollection_Array1<gp_Vec2d > EvaluateGridDN(const TColStd_Array1OfReal & theParams, int theN);

		/****** Geom2dGridEval_Curve::GetType ******/
		/****** md5 signature: 3226ee98f21e859ede8900c53e096e36 ******/
		%feature("compactdefaultargs") GetType;
		%feature("autodoc", "Return
-------
GeomAbs_CurveType

Description
-----------
Returns the detected curve type.
") GetType;
		GeomAbs_CurveType GetType();

};


%extend Geom2dGridEval_Curve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************
* class Geom2dGridEval_Ellipse *
*******************************/
class Geom2dGridEval_Ellipse {
	public:
		/****** Geom2dGridEval_Ellipse::Geom2dGridEval_Ellipse ******/
		/****** md5 signature: 798b349558dbc2e7379dbb1eafb0afaf ******/
		%feature("compactdefaultargs") Geom2dGridEval_Ellipse;
		%feature("autodoc", "
Parameters
----------
theEllipse: Geom2d_Ellipse

Return
-------
None

Description
-----------
Constructor with geometry. 
Parameter theEllipse the 2D ellipse geometry to evaluate.
") Geom2dGridEval_Ellipse;
		 Geom2dGridEval_Ellipse(const opencascade::handle<Geom2d_Ellipse> & theEllipse);

		/****** Geom2dGridEval_Ellipse::EvaluateGrid ******/
		/****** md5 signature: 6c6acd79462dbb4b548da3f972909071 ******/
		%feature("compactdefaultargs") EvaluateGrid;
		%feature("autodoc", "
Parameters
----------
theParams: TColStd_Array1OfReal

Return
-------
NCollection_Array1<gp_Pnt2d >

Description
-----------
Evaluate all grid points. 
Parameter theParams array of parameter values 
Return: array of evaluated points (1-based indexing), or empty array if geometry is null or no parameters.
") EvaluateGrid;
		NCollection_Array1<gp_Pnt2d > EvaluateGrid(const TColStd_Array1OfReal & theParams);

		/****** Geom2dGridEval_Ellipse::EvaluateGridD1 ******/
		/****** md5 signature: e196ad674b5ccd8ecd17d0af013242d3 ******/
		%feature("compactdefaultargs") EvaluateGridD1;
		%feature("autodoc", "
Parameters
----------
theParams: TColStd_Array1OfReal

Return
-------
NCollection_Array1<Geom2dGridEval::CurveD1 >

Description
-----------
Evaluate all grid points with first derivative. 
Parameter theParams array of parameter values 
Return: array of CurveD1 (1-based indexing), or empty array if geometry is null or no parameters.
") EvaluateGridD1;
		NCollection_Array1<Geom2dGridEval::CurveD1 > EvaluateGridD1(const TColStd_Array1OfReal & theParams);

		/****** Geom2dGridEval_Ellipse::EvaluateGridD2 ******/
		/****** md5 signature: 7a3a1631560bce8bba862324c6d61f30 ******/
		%feature("compactdefaultargs") EvaluateGridD2;
		%feature("autodoc", "
Parameters
----------
theParams: TColStd_Array1OfReal

Return
-------
NCollection_Array1<Geom2dGridEval::CurveD2 >

Description
-----------
Evaluate all grid points with first and second derivatives. 
Parameter theParams array of parameter values 
Return: array of CurveD2 (1-based indexing), or empty array if geometry is null or no parameters.
") EvaluateGridD2;
		NCollection_Array1<Geom2dGridEval::CurveD2 > EvaluateGridD2(const TColStd_Array1OfReal & theParams);

		/****** Geom2dGridEval_Ellipse::EvaluateGridD3 ******/
		/****** md5 signature: 22ac82d3414d7e2f839431d26fb91039 ******/
		%feature("compactdefaultargs") EvaluateGridD3;
		%feature("autodoc", "
Parameters
----------
theParams: TColStd_Array1OfReal

Return
-------
NCollection_Array1<Geom2dGridEval::CurveD3 >

Description
-----------
Evaluate all grid points with first, second, and third derivatives. 
Parameter theParams array of parameter values 
Return: array of CurveD3 (1-based indexing), or empty array if geometry is null or no parameters.
") EvaluateGridD3;
		NCollection_Array1<Geom2dGridEval::CurveD3 > EvaluateGridD3(const TColStd_Array1OfReal & theParams);

		/****** Geom2dGridEval_Ellipse::EvaluateGridDN ******/
		/****** md5 signature: e0a5283861089feb19adf43e601d7ab2 ******/
		%feature("compactdefaultargs") EvaluateGridDN;
		%feature("autodoc", "
Parameters
----------
theParams: TColStd_Array1OfReal
theN: int

Return
-------
NCollection_Array1<gp_Vec2d >

Description
-----------
Evaluate Nth derivative at all grid points. Ellipse has cyclic derivatives with period 4: D1 = -MajR * sin(u) * X + MinR * cos(u) * Y D2 = -MajR * cos(u) * X - MinR * sin(u) * Y D3 = MajR * sin(u) * X - MinR * cos(u) * Y D4 = MajR * cos(u) * X + MinR * sin(u) * Y = D0, then repeats 
Parameter theParams array of parameter values 
Parameter theN derivative order (N >= 1) 
Return: array of derivative vectors (1-based indexing), or empty array if geometry is null or no parameters.
") EvaluateGridDN;
		NCollection_Array1<gp_Vec2d > EvaluateGridDN(const TColStd_Array1OfReal & theParams, int theN);

		/****** Geom2dGridEval_Ellipse::Geometry ******/
		/****** md5 signature: 13b5db93fafad3b99732eb4da9e12987 ******/
		%feature("compactdefaultargs") Geometry;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom2d_Ellipse>

Description
-----------
Returns the geometry handle.
") Geometry;
		const opencascade::handle<Geom2d_Ellipse> & Geometry();

};


%extend Geom2dGridEval_Ellipse {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************
* class Geom2dGridEval_Hyperbola *
*********************************/
class Geom2dGridEval_Hyperbola {
	public:
		/****** Geom2dGridEval_Hyperbola::Geom2dGridEval_Hyperbola ******/
		/****** md5 signature: a1a3fad85ae224824d1c7526441f9242 ******/
		%feature("compactdefaultargs") Geom2dGridEval_Hyperbola;
		%feature("autodoc", "
Parameters
----------
theHyperbola: Geom2d_Hyperbola

Return
-------
None

Description
-----------
Constructor with geometry. 
Parameter theHyperbola the 2D hyperbola geometry to evaluate.
") Geom2dGridEval_Hyperbola;
		 Geom2dGridEval_Hyperbola(const opencascade::handle<Geom2d_Hyperbola> & theHyperbola);

		/****** Geom2dGridEval_Hyperbola::EvaluateGrid ******/
		/****** md5 signature: 6c6acd79462dbb4b548da3f972909071 ******/
		%feature("compactdefaultargs") EvaluateGrid;
		%feature("autodoc", "
Parameters
----------
theParams: TColStd_Array1OfReal

Return
-------
NCollection_Array1<gp_Pnt2d >

Description
-----------
Evaluate all grid points. 
Parameter theParams array of parameter values 
Return: array of evaluated points (1-based indexing), or empty array if geometry is null or no parameters.
") EvaluateGrid;
		NCollection_Array1<gp_Pnt2d > EvaluateGrid(const TColStd_Array1OfReal & theParams);

		/****** Geom2dGridEval_Hyperbola::EvaluateGridD1 ******/
		/****** md5 signature: e196ad674b5ccd8ecd17d0af013242d3 ******/
		%feature("compactdefaultargs") EvaluateGridD1;
		%feature("autodoc", "
Parameters
----------
theParams: TColStd_Array1OfReal

Return
-------
NCollection_Array1<Geom2dGridEval::CurveD1 >

Description
-----------
Evaluate all grid points with first derivative. 
Parameter theParams array of parameter values 
Return: array of CurveD1 (1-based indexing).
") EvaluateGridD1;
		NCollection_Array1<Geom2dGridEval::CurveD1 > EvaluateGridD1(const TColStd_Array1OfReal & theParams);

		/****** Geom2dGridEval_Hyperbola::EvaluateGridD2 ******/
		/****** md5 signature: 7a3a1631560bce8bba862324c6d61f30 ******/
		%feature("compactdefaultargs") EvaluateGridD2;
		%feature("autodoc", "
Parameters
----------
theParams: TColStd_Array1OfReal

Return
-------
NCollection_Array1<Geom2dGridEval::CurveD2 >

Description
-----------
Evaluate all grid points with first and second derivatives. 
Parameter theParams array of parameter values 
Return: array of CurveD2 (1-based indexing).
") EvaluateGridD2;
		NCollection_Array1<Geom2dGridEval::CurveD2 > EvaluateGridD2(const TColStd_Array1OfReal & theParams);

		/****** Geom2dGridEval_Hyperbola::EvaluateGridD3 ******/
		/****** md5 signature: 22ac82d3414d7e2f839431d26fb91039 ******/
		%feature("compactdefaultargs") EvaluateGridD3;
		%feature("autodoc", "
Parameters
----------
theParams: TColStd_Array1OfReal

Return
-------
NCollection_Array1<Geom2dGridEval::CurveD3 >

Description
-----------
Evaluate all grid points with first, second, and third derivatives. 
Parameter theParams array of parameter values 
Return: array of CurveD3 (1-based indexing).
") EvaluateGridD3;
		NCollection_Array1<Geom2dGridEval::CurveD3 > EvaluateGridD3(const TColStd_Array1OfReal & theParams);

		/****** Geom2dGridEval_Hyperbola::EvaluateGridDN ******/
		/****** md5 signature: e0a5283861089feb19adf43e601d7ab2 ******/
		%feature("compactdefaultargs") EvaluateGridDN;
		%feature("autodoc", "
Parameters
----------
theParams: TColStd_Array1OfReal
theN: int

Return
-------
NCollection_Array1<gp_Vec2d >

Description
-----------
Evaluate Nth derivative at all grid points. Hyperbola has cyclic derivatives with period 2: D1 = MajR * sinh(u) * X + MinR * cosh(u) * Y D2 = MajR * cosh(u) * X + MinR * sinh(u) * Y = D0 D3 = D1, D4 = D0, etc. 
Parameter theParams array of parameter values 
Parameter theN derivative order (N >= 1) 
Return: array of derivative vectors (1-based indexing).
") EvaluateGridDN;
		NCollection_Array1<gp_Vec2d > EvaluateGridDN(const TColStd_Array1OfReal & theParams, int theN);

		/****** Geom2dGridEval_Hyperbola::Geometry ******/
		/****** md5 signature: 4aa1cdf86aa2f358e0e6e1ee96a785ea ******/
		%feature("compactdefaultargs") Geometry;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom2d_Hyperbola>

Description
-----------
Returns the geometry handle.
") Geometry;
		const opencascade::handle<Geom2d_Hyperbola> & Geometry();

};


%extend Geom2dGridEval_Hyperbola {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************
* class Geom2dGridEval_Line *
****************************/
class Geom2dGridEval_Line {
	public:
		/****** Geom2dGridEval_Line::Geom2dGridEval_Line ******/
		/****** md5 signature: 4477421bf496b196ed5f0b1c28108079 ******/
		%feature("compactdefaultargs") Geom2dGridEval_Line;
		%feature("autodoc", "
Parameters
----------
theLine: Geom2d_Line

Return
-------
None

Description
-----------
Constructor with geometry. 
Parameter theLine the 2D line geometry to evaluate.
") Geom2dGridEval_Line;
		 Geom2dGridEval_Line(const opencascade::handle<Geom2d_Line> & theLine);

		/****** Geom2dGridEval_Line::EvaluateGrid ******/
		/****** md5 signature: 6ae0293cd10e770f032c1626462da3a1 ******/
		%feature("compactdefaultargs") EvaluateGrid;
		%feature("autodoc", "
Parameters
----------
theParams: TColStd_Array1OfReal

Return
-------
NCollection_Array1<gp_Pnt2d >

Description
-----------
Evaluate all grid points. 
Parameter theParams array of parameter values 
Return: array of evaluated points (1-based indexing), or empty array if geometry is null or no parameters.
") EvaluateGrid;
		NCollection_Array1<gp_Pnt2d > EvaluateGrid(const TColStd_Array1OfReal & theParams);

		/****** Geom2dGridEval_Line::EvaluateGridD1 ******/
		/****** md5 signature: f98a02ac1a7597774efdad611f6552aa ******/
		%feature("compactdefaultargs") EvaluateGridD1;
		%feature("autodoc", "
Parameters
----------
theParams: TColStd_Array1OfReal

Return
-------
NCollection_Array1<Geom2dGridEval::CurveD1 >

Description
-----------
Evaluate all grid points with first derivative. For a line, D1 is constant (the direction vector). 
Parameter theParams array of parameter values 
Return: array of CurveD1 (1-based indexing), or empty array if geometry is null or no parameters.
") EvaluateGridD1;
		NCollection_Array1<Geom2dGridEval::CurveD1 > EvaluateGridD1(const TColStd_Array1OfReal & theParams);

		/****** Geom2dGridEval_Line::EvaluateGridD2 ******/
		/****** md5 signature: 93f24bd215c329a1117aaf00982d20cc ******/
		%feature("compactdefaultargs") EvaluateGridD2;
		%feature("autodoc", "
Parameters
----------
theParams: TColStd_Array1OfReal

Return
-------
NCollection_Array1<Geom2dGridEval::CurveD2 >

Description
-----------
Evaluate all grid points with first and second derivatives. For a line, D1 is constant and D2 is zero. 
Parameter theParams array of parameter values 
Return: array of CurveD2 (1-based indexing), or empty array if geometry is null or no parameters.
") EvaluateGridD2;
		NCollection_Array1<Geom2dGridEval::CurveD2 > EvaluateGridD2(const TColStd_Array1OfReal & theParams);

		/****** Geom2dGridEval_Line::EvaluateGridD3 ******/
		/****** md5 signature: 2dda68ee8723901e427337140fc6f313 ******/
		%feature("compactdefaultargs") EvaluateGridD3;
		%feature("autodoc", "
Parameters
----------
theParams: TColStd_Array1OfReal

Return
-------
NCollection_Array1<Geom2dGridEval::CurveD3 >

Description
-----------
Evaluate all grid points with first, second, and third derivatives. For a line, D1 is constant, D2 and D3 are zero. 
Parameter theParams array of parameter values 
Return: array of CurveD3 (1-based indexing), or empty array if geometry is null or no parameters.
") EvaluateGridD3;
		NCollection_Array1<Geom2dGridEval::CurveD3 > EvaluateGridD3(const TColStd_Array1OfReal & theParams);

		/****** Geom2dGridEval_Line::EvaluateGridDN ******/
		/****** md5 signature: 238ea122f1da93b4010d51fabdd727e8 ******/
		%feature("compactdefaultargs") EvaluateGridDN;
		%feature("autodoc", "
Parameters
----------
theParams: TColStd_Array1OfReal
theN: int

Return
-------
NCollection_Array1<gp_Vec2d >

Description
-----------
Evaluate Nth derivative at all grid points. For a line: D1 = Direction, DN = 0 for N > 1. 
Parameter theParams array of parameter values 
Parameter theN derivative order (N >= 1) 
Return: array of derivative vectors (1-based indexing), or empty array if geometry is null or no parameters.
") EvaluateGridDN;
		NCollection_Array1<gp_Vec2d > EvaluateGridDN(const TColStd_Array1OfReal & theParams, int theN);

		/****** Geom2dGridEval_Line::Geometry ******/
		/****** md5 signature: 15ff60b314fa261eecf74d0c8938c7ff ******/
		%feature("compactdefaultargs") Geometry;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom2d_Line>

Description
-----------
Returns the geometry handle.
") Geometry;
		const opencascade::handle<Geom2d_Line> & Geometry();

};


%extend Geom2dGridEval_Line {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************************
* class Geom2dGridEval_OffsetCurve *
***********************************/
class Geom2dGridEval_OffsetCurve {
	public:
		/****** Geom2dGridEval_OffsetCurve::Geom2dGridEval_OffsetCurve ******/
		/****** md5 signature: 47f5765b6f8ee45ff4a3334b00dcfa7f ******/
		%feature("compactdefaultargs") Geom2dGridEval_OffsetCurve;
		%feature("autodoc", "
Parameters
----------
theOffset: Geom2d_OffsetCurve

Return
-------
None

Description
-----------
Constructor with geometry. 
Parameter theOffset the 2D offset curve geometry to evaluate.
") Geom2dGridEval_OffsetCurve;
		 Geom2dGridEval_OffsetCurve(const opencascade::handle<Geom2d_OffsetCurve> & theOffset);

		/****** Geom2dGridEval_OffsetCurve::EvaluateGrid ******/
		/****** md5 signature: 6c6acd79462dbb4b548da3f972909071 ******/
		%feature("compactdefaultargs") EvaluateGrid;
		%feature("autodoc", "
Parameters
----------
theParams: TColStd_Array1OfReal

Return
-------
NCollection_Array1<gp_Pnt2d >

Description
-----------
Evaluate all grid points. 
Parameter theParams array of parameter values 
Return: array of evaluated points (1-based indexing), or empty array if geometry is null or no parameters.
") EvaluateGrid;
		NCollection_Array1<gp_Pnt2d > EvaluateGrid(const TColStd_Array1OfReal & theParams);

		/****** Geom2dGridEval_OffsetCurve::EvaluateGridD1 ******/
		/****** md5 signature: e196ad674b5ccd8ecd17d0af013242d3 ******/
		%feature("compactdefaultargs") EvaluateGridD1;
		%feature("autodoc", "
Parameters
----------
theParams: TColStd_Array1OfReal

Return
-------
NCollection_Array1<Geom2dGridEval::CurveD1 >

Description
-----------
Evaluate all grid points with first derivative. 
Parameter theParams array of parameter values 
Return: array of CurveD1 (1-based indexing), or empty array if geometry is null or no parameters.
") EvaluateGridD1;
		NCollection_Array1<Geom2dGridEval::CurveD1 > EvaluateGridD1(const TColStd_Array1OfReal & theParams);

		/****** Geom2dGridEval_OffsetCurve::EvaluateGridD2 ******/
		/****** md5 signature: 7a3a1631560bce8bba862324c6d61f30 ******/
		%feature("compactdefaultargs") EvaluateGridD2;
		%feature("autodoc", "
Parameters
----------
theParams: TColStd_Array1OfReal

Return
-------
NCollection_Array1<Geom2dGridEval::CurveD2 >

Description
-----------
Evaluate all grid points with first and second derivatives. 
Parameter theParams array of parameter values 
Return: array of CurveD2 (1-based indexing), or empty array if geometry is null or no parameters.
") EvaluateGridD2;
		NCollection_Array1<Geom2dGridEval::CurveD2 > EvaluateGridD2(const TColStd_Array1OfReal & theParams);

		/****** Geom2dGridEval_OffsetCurve::EvaluateGridD3 ******/
		/****** md5 signature: 22ac82d3414d7e2f839431d26fb91039 ******/
		%feature("compactdefaultargs") EvaluateGridD3;
		%feature("autodoc", "
Parameters
----------
theParams: TColStd_Array1OfReal

Return
-------
NCollection_Array1<Geom2dGridEval::CurveD3 >

Description
-----------
Evaluate all grid points with derivatives up to third order. 
Parameter theParams array of parameter values 
Return: array of CurveD3 (1-based indexing), or empty array if geometry is null or no parameters.
") EvaluateGridD3;
		NCollection_Array1<Geom2dGridEval::CurveD3 > EvaluateGridD3(const TColStd_Array1OfReal & theParams);

		/****** Geom2dGridEval_OffsetCurve::EvaluateGridDN ******/
		/****** md5 signature: e0a5283861089feb19adf43e601d7ab2 ******/
		%feature("compactdefaultargs") EvaluateGridDN;
		%feature("autodoc", "
Parameters
----------
theParams: TColStd_Array1OfReal
theN: int

Return
-------
NCollection_Array1<gp_Vec2d >

Description
-----------
Evaluate Nth derivative at all grid points. For orders 1-3, reuses EvaluateGridD1/D2/D3. For orders > 3, uses basis curve DN method. 
Parameter theParams array of parameter values 
Parameter theN derivative order (N >= 1) 
Return: array of derivative vectors (1-based indexing).
") EvaluateGridDN;
		NCollection_Array1<gp_Vec2d > EvaluateGridDN(const TColStd_Array1OfReal & theParams, int theN);

		/****** Geom2dGridEval_OffsetCurve::Geometry ******/
		/****** md5 signature: 693e8d5330f15a18b779cb729bb2e32c ******/
		%feature("compactdefaultargs") Geometry;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom2d_OffsetCurve>

Description
-----------
Returns the geometry handle.
") Geometry;
		const opencascade::handle<Geom2d_OffsetCurve> & Geometry();

};


%extend Geom2dGridEval_OffsetCurve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************************
* class Geom2dGridEval_OtherCurve *
**********************************/
class Geom2dGridEval_OtherCurve {
	public:
		/****** Geom2dGridEval_OtherCurve::Geom2dGridEval_OtherCurve ******/
		/****** md5 signature: 344ac0d3309184017f2bb4e9e1e18cf9 ******/
		%feature("compactdefaultargs") Geom2dGridEval_OtherCurve;
		%feature("autodoc", "
Parameters
----------
theCurve: Adaptor2d_Curve2d

Return
-------
None

Description
-----------
Constructor with curve adaptor reference. 
Parameter theCurve reference to 2D curve adaptor (must remain valid).
") Geom2dGridEval_OtherCurve;
		 Geom2dGridEval_OtherCurve(const Adaptor2d_Curve2d & theCurve);

		/****** Geom2dGridEval_OtherCurve::Curve ******/
		/****** md5 signature: 337a0184957b1748c7b22dc21ba4fa2f ******/
		%feature("compactdefaultargs") Curve;
		%feature("autodoc", "Return
-------
Adaptor2d_Curve2d

Description
-----------
Returns the curve adaptor reference.
") Curve;
		Adaptor2d_Curve2d Curve();

		/****** Geom2dGridEval_OtherCurve::EvaluateGrid ******/
		/****** md5 signature: 6c6acd79462dbb4b548da3f972909071 ******/
		%feature("compactdefaultargs") EvaluateGrid;
		%feature("autodoc", "
Parameters
----------
theParams: TColStd_Array1OfReal

Return
-------
NCollection_Array1<gp_Pnt2d >

Description
-----------
Evaluate all grid points. 
Parameter theParams array of parameter values 
Return: array of evaluated points (1-based indexing), or empty array if no parameters.
") EvaluateGrid;
		NCollection_Array1<gp_Pnt2d > EvaluateGrid(const TColStd_Array1OfReal & theParams);

		/****** Geom2dGridEval_OtherCurve::EvaluateGridD1 ******/
		/****** md5 signature: e196ad674b5ccd8ecd17d0af013242d3 ******/
		%feature("compactdefaultargs") EvaluateGridD1;
		%feature("autodoc", "
Parameters
----------
theParams: TColStd_Array1OfReal

Return
-------
NCollection_Array1<Geom2dGridEval::CurveD1 >

Description
-----------
Evaluate all grid points with first derivative. 
Parameter theParams array of parameter values 
Return: array of CurveD1 (1-based indexing), or empty array if no parameters.
") EvaluateGridD1;
		NCollection_Array1<Geom2dGridEval::CurveD1 > EvaluateGridD1(const TColStd_Array1OfReal & theParams);

		/****** Geom2dGridEval_OtherCurve::EvaluateGridD2 ******/
		/****** md5 signature: 7a3a1631560bce8bba862324c6d61f30 ******/
		%feature("compactdefaultargs") EvaluateGridD2;
		%feature("autodoc", "
Parameters
----------
theParams: TColStd_Array1OfReal

Return
-------
NCollection_Array1<Geom2dGridEval::CurveD2 >

Description
-----------
Evaluate all grid points with first and second derivatives. 
Parameter theParams array of parameter values 
Return: array of CurveD2 (1-based indexing), or empty array if no parameters.
") EvaluateGridD2;
		NCollection_Array1<Geom2dGridEval::CurveD2 > EvaluateGridD2(const TColStd_Array1OfReal & theParams);

		/****** Geom2dGridEval_OtherCurve::EvaluateGridD3 ******/
		/****** md5 signature: 22ac82d3414d7e2f839431d26fb91039 ******/
		%feature("compactdefaultargs") EvaluateGridD3;
		%feature("autodoc", "
Parameters
----------
theParams: TColStd_Array1OfReal

Return
-------
NCollection_Array1<Geom2dGridEval::CurveD3 >

Description
-----------
Evaluate all grid points with first, second, and third derivatives. 
Parameter theParams array of parameter values 
Return: array of CurveD3 (1-based indexing), or empty array if no parameters.
") EvaluateGridD3;
		NCollection_Array1<Geom2dGridEval::CurveD3 > EvaluateGridD3(const TColStd_Array1OfReal & theParams);

		/****** Geom2dGridEval_OtherCurve::EvaluateGridDN ******/
		/****** md5 signature: e0a5283861089feb19adf43e601d7ab2 ******/
		%feature("compactdefaultargs") EvaluateGridDN;
		%feature("autodoc", "
Parameters
----------
theParams: TColStd_Array1OfReal
theN: int

Return
-------
NCollection_Array1<gp_Vec2d >

Description
-----------
Evaluate Nth derivative at all grid points. For orders 1-3, reuses EvaluateGridD1/D2/D3. For orders > 3, uses adaptor DN method. 
Parameter theParams array of parameter values 
Parameter theN derivative order (N >= 1) 
Return: array of derivative vectors (1-based indexing).
") EvaluateGridDN;
		NCollection_Array1<gp_Vec2d > EvaluateGridDN(const TColStd_Array1OfReal & theParams, int theN);

};


%extend Geom2dGridEval_OtherCurve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************
* class Geom2dGridEval_Parabola *
********************************/
class Geom2dGridEval_Parabola {
	public:
		/****** Geom2dGridEval_Parabola::Geom2dGridEval_Parabola ******/
		/****** md5 signature: 41473fc99bfe14d0b88362101a0d94f1 ******/
		%feature("compactdefaultargs") Geom2dGridEval_Parabola;
		%feature("autodoc", "
Parameters
----------
theParabola: Geom2d_Parabola

Return
-------
None

Description
-----------
Constructor with geometry. 
Parameter theParabola the 2D parabola geometry to evaluate.
") Geom2dGridEval_Parabola;
		 Geom2dGridEval_Parabola(const opencascade::handle<Geom2d_Parabola> & theParabola);

		/****** Geom2dGridEval_Parabola::EvaluateGrid ******/
		/****** md5 signature: 6c6acd79462dbb4b548da3f972909071 ******/
		%feature("compactdefaultargs") EvaluateGrid;
		%feature("autodoc", "
Parameters
----------
theParams: TColStd_Array1OfReal

Return
-------
NCollection_Array1<gp_Pnt2d >

Description
-----------
Evaluate all grid points. 
Parameter theParams array of parameter values 
Return: array of evaluated points (1-based indexing), or empty array if geometry is null or no parameters.
") EvaluateGrid;
		NCollection_Array1<gp_Pnt2d > EvaluateGrid(const TColStd_Array1OfReal & theParams);

		/****** Geom2dGridEval_Parabola::EvaluateGridD1 ******/
		/****** md5 signature: e196ad674b5ccd8ecd17d0af013242d3 ******/
		%feature("compactdefaultargs") EvaluateGridD1;
		%feature("autodoc", "
Parameters
----------
theParams: TColStd_Array1OfReal

Return
-------
NCollection_Array1<Geom2dGridEval::CurveD1 >

Description
-----------
Evaluate all grid points with first derivative. 
Parameter theParams array of parameter values 
Return: array of CurveD1 (1-based indexing).
") EvaluateGridD1;
		NCollection_Array1<Geom2dGridEval::CurveD1 > EvaluateGridD1(const TColStd_Array1OfReal & theParams);

		/****** Geom2dGridEval_Parabola::EvaluateGridD2 ******/
		/****** md5 signature: 7a3a1631560bce8bba862324c6d61f30 ******/
		%feature("compactdefaultargs") EvaluateGridD2;
		%feature("autodoc", "
Parameters
----------
theParams: TColStd_Array1OfReal

Return
-------
NCollection_Array1<Geom2dGridEval::CurveD2 >

Description
-----------
Evaluate all grid points with first and second derivatives. 
Parameter theParams array of parameter values 
Return: array of CurveD2 (1-based indexing).
") EvaluateGridD2;
		NCollection_Array1<Geom2dGridEval::CurveD2 > EvaluateGridD2(const TColStd_Array1OfReal & theParams);

		/****** Geom2dGridEval_Parabola::EvaluateGridD3 ******/
		/****** md5 signature: 22ac82d3414d7e2f839431d26fb91039 ******/
		%feature("compactdefaultargs") EvaluateGridD3;
		%feature("autodoc", "
Parameters
----------
theParams: TColStd_Array1OfReal

Return
-------
NCollection_Array1<Geom2dGridEval::CurveD3 >

Description
-----------
Evaluate all grid points with first, second, and third derivatives. 
Parameter theParams array of parameter values 
Return: array of CurveD3 (1-based indexing).
") EvaluateGridD3;
		NCollection_Array1<Geom2dGridEval::CurveD3 > EvaluateGridD3(const TColStd_Array1OfReal & theParams);

		/****** Geom2dGridEval_Parabola::EvaluateGridDN ******/
		/****** md5 signature: e0a5283861089feb19adf43e601d7ab2 ******/
		%feature("compactdefaultargs") EvaluateGridDN;
		%feature("autodoc", "
Parameters
----------
theParams: TColStd_Array1OfReal
theN: int

Return
-------
NCollection_Array1<gp_Vec2d >

Description
-----------
Evaluate Nth derivative at all grid points. Parabola: P = Center + (u^2/4F) * X + u * Y D1 = (u/2F) * X + Y (depends on u) D2 = (1/2F) * X (constant) DN = 0 for N >= 3 
Parameter theParams array of parameter values 
Parameter theN derivative order (N >= 1) 
Return: array of derivative vectors (1-based indexing).
") EvaluateGridDN;
		NCollection_Array1<gp_Vec2d > EvaluateGridDN(const TColStd_Array1OfReal & theParams, int theN);

		/****** Geom2dGridEval_Parabola::Geometry ******/
		/****** md5 signature: c69adbc759c5245885a12ed5c0880fbe ******/
		%feature("compactdefaultargs") Geometry;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom2d_Parabola>

Description
-----------
Returns the geometry handle.
") Geometry;
		const opencascade::handle<Geom2d_Parabola> & Geometry();

};


%extend Geom2dGridEval_Parabola {
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
