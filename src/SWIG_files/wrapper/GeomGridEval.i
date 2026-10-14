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
%define GEOMGRIDEVALDOCSTRING
"GeomGridEval module, see official documentation at
https://dev.opencascade.org/doc/occt-7.9.0/refman/html/package_geomgrideval.html"
%enddef
%module (package="OCC.Core", docstring=GEOMGRIDEVALDOCSTRING) GeomGridEval


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
#include<GeomGridEval_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<Geom_module.hxx>
#include<TColStd_module.hxx>
#include<Adaptor3d_module.hxx>
#include<GeomAbs_module.hxx>
#include<Adaptor2d_module.hxx>
#include<Geom2d_module.hxx>
#include<Message_module.hxx>
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
%import Geom.i
%import TColStd.i
%import Adaptor3d.i
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
typedef Geom_Curve::ResD1 GeomGridEval::CurveD1;
typedef Geom_Curve::ResD2 GeomGridEval::CurveD2;
typedef Geom_Curve::ResD3 GeomGridEval::CurveD3;
typedef Geom_Surface::ResD1 GeomGridEval::SurfD1;
typedef Geom_Surface::ResD2 GeomGridEval::SurfD2;
typedef Geom_Surface::ResD3 GeomGridEval::SurfD3;
/* end typedefs declaration */

/**********************************
* class GeomGridEval_BSplineCurve *
**********************************/
class GeomGridEval_BSplineCurve {
	public:
		/****** GeomGridEval_BSplineCurve::GeomGridEval_BSplineCurve ******/
		/****** md5 signature: 2670a1ddbf44ab99e37ce66a0ea38733 ******/
		%feature("compactdefaultargs") GeomGridEval_BSplineCurve;
		%feature("autodoc", "
Parameters
----------
theCurve: Geom_BSplineCurve

Return
-------
None

Description
-----------
Constructor with geometry. 
Parameter theCurve the B-spline curve to evaluate.
") GeomGridEval_BSplineCurve;
		 GeomGridEval_BSplineCurve(const opencascade::handle<Geom_BSplineCurve> & theCurve);

		/****** GeomGridEval_BSplineCurve::EvaluateGrid ******/
		/****** md5 signature: f92ee9a0e7514e0ca74fc94b534f9a94 ******/
		%feature("compactdefaultargs") EvaluateGrid;
		%feature("autodoc", "
Parameters
----------
theParams: TColStd_Array1OfReal

Return
-------
NCollection_Array1<gp_Pnt >

Description
-----------
Evaluate all grid points. Points are evaluated in span-grouped order to minimize cache rebuilds. 
Parameter theParams array of parameter values 
Return: array of evaluated points (1-based indexing), or empty array if geometry is null or no parameters.
") EvaluateGrid;
		NCollection_Array1<gp_Pnt > EvaluateGrid(const TColStd_Array1OfReal & theParams);

		/****** GeomGridEval_BSplineCurve::EvaluateGridD1 ******/
		/****** md5 signature: 56a96d714c4025da05b031d7a4376d88 ******/
		%feature("compactdefaultargs") EvaluateGridD1;
		%feature("autodoc", "
Parameters
----------
theParams: TColStd_Array1OfReal

Return
-------
NCollection_Array1<GeomGridEval::CurveD1 >

Description
-----------
Evaluate all grid points with first derivative. 
Parameter theParams array of parameter values 
Return: array of CurveD1 (1-based indexing), or empty array if geometry is null or no parameters.
") EvaluateGridD1;
		NCollection_Array1<GeomGridEval::CurveD1 > EvaluateGridD1(const TColStd_Array1OfReal & theParams);

		/****** GeomGridEval_BSplineCurve::EvaluateGridD2 ******/
		/****** md5 signature: a2ca4df7dbaf37524e734cb3d28f01a6 ******/
		%feature("compactdefaultargs") EvaluateGridD2;
		%feature("autodoc", "
Parameters
----------
theParams: TColStd_Array1OfReal

Return
-------
NCollection_Array1<GeomGridEval::CurveD2 >

Description
-----------
Evaluate all grid points with first and second derivatives. 
Parameter theParams array of parameter values 
Return: array of CurveD2 (1-based indexing), or empty array if geometry is null or no parameters.
") EvaluateGridD2;
		NCollection_Array1<GeomGridEval::CurveD2 > EvaluateGridD2(const TColStd_Array1OfReal & theParams);

		/****** GeomGridEval_BSplineCurve::EvaluateGridD3 ******/
		/****** md5 signature: b0a1316ee078e14b02f25df019c02eec ******/
		%feature("compactdefaultargs") EvaluateGridD3;
		%feature("autodoc", "
Parameters
----------
theParams: TColStd_Array1OfReal

Return
-------
NCollection_Array1<GeomGridEval::CurveD3 >

Description
-----------
Evaluate all grid points with first, second, and third derivatives. 
Parameter theParams array of parameter values 
Return: array of CurveD3 (1-based indexing), or empty array if geometry is null or no parameters.
") EvaluateGridD3;
		NCollection_Array1<GeomGridEval::CurveD3 > EvaluateGridD3(const TColStd_Array1OfReal & theParams);

		/****** GeomGridEval_BSplineCurve::EvaluateGridDN ******/
		/****** md5 signature: 94480de11385d33bdb1f3592abeec9d4 ******/
		%feature("compactdefaultargs") EvaluateGridDN;
		%feature("autodoc", "
Parameters
----------
theParams: TColStd_Array1OfReal
theN: int

Return
-------
NCollection_Array1<gp_Vec >

Description
-----------
Evaluate Nth derivative at all grid points. For orders 1-3, reuses EvaluateGridD1/D2/D3. For orders > 3, uses geometry DN method. 
Parameter theParams array of parameter values 
Parameter theN derivative order (N >= 1) 
Return: array of derivative vectors (1-based indexing).
") EvaluateGridDN;
		NCollection_Array1<gp_Vec > EvaluateGridDN(const TColStd_Array1OfReal & theParams, int theN);

		/****** GeomGridEval_BSplineCurve::Geometry ******/
		/****** md5 signature: 438a2ab9c7d0a5f548ad3b663f581c74 ******/
		%feature("compactdefaultargs") Geometry;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom_BSplineCurve>

Description
-----------
Returns the geometry handle.
") Geometry;
		const opencascade::handle<Geom_BSplineCurve> & Geometry();

};


%extend GeomGridEval_BSplineCurve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************************
* class GeomGridEval_BSplineSurface *
************************************/
class GeomGridEval_BSplineSurface {
	public:
		/****** GeomGridEval_BSplineSurface::GeomGridEval_BSplineSurface ******/
		/****** md5 signature: a33ae4cd75fae4a0a8ff19929c14e2f7 ******/
		%feature("compactdefaultargs") GeomGridEval_BSplineSurface;
		%feature("autodoc", "
Parameters
----------
theSurface: Geom_BSplineSurface

Return
-------
None

Description
-----------
Constructor with geometry. 
Parameter theSurface the B-spline surface to evaluate.
") GeomGridEval_BSplineSurface;
		 GeomGridEval_BSplineSurface(const opencascade::handle<Geom_BSplineSurface> & theSurface);

		/****** GeomGridEval_BSplineSurface::EvaluateGrid ******/
		/****** md5 signature: 6d2a3b471accd06cd07e1de5ae544aa8 ******/
		%feature("compactdefaultargs") EvaluateGrid;
		%feature("autodoc", "
Parameters
----------
theUParams: TColStd_Array1OfReal
theVParams: TColStd_Array1OfReal

Return
-------
NCollection_Array2<gp_Pnt >

Description
-----------
Evaluate grid points at Cartesian product of U and V parameters. Points are evaluated in span-grouped order to minimize cache rebuilds. 
Parameter theUParams array of U parameter values 
Parameter theVParams array of V parameter values 
Return: 2D array of evaluated points (1-based indexing), or empty array if geometry is null or parameters empty.
") EvaluateGrid;
		NCollection_Array2<gp_Pnt > EvaluateGrid(const TColStd_Array1OfReal & theUParams, const TColStd_Array1OfReal & theVParams);

		/****** GeomGridEval_BSplineSurface::EvaluateGridD1 ******/
		/****** md5 signature: fadc5d6269d67e8eef910732d08109f4 ******/
		%feature("compactdefaultargs") EvaluateGridD1;
		%feature("autodoc", "
Parameters
----------
theUParams: TColStd_Array1OfReal
theVParams: TColStd_Array1OfReal

Return
-------
NCollection_Array2<GeomGridEval::SurfD1 >

Description
-----------
Evaluate grid points with first partial derivatives. 
Parameter theUParams array of U parameter values 
Parameter theVParams array of V parameter values 
Return: 2D array of SurfD1 (1-based indexing), or empty array if geometry is null or parameters empty.
") EvaluateGridD1;
		NCollection_Array2<GeomGridEval::SurfD1 > EvaluateGridD1(const TColStd_Array1OfReal & theUParams, const TColStd_Array1OfReal & theVParams);

		/****** GeomGridEval_BSplineSurface::EvaluateGridD2 ******/
		/****** md5 signature: 43a3b86f1ecc11df7e4d6df5371f7426 ******/
		%feature("compactdefaultargs") EvaluateGridD2;
		%feature("autodoc", "
Parameters
----------
theUParams: TColStd_Array1OfReal
theVParams: TColStd_Array1OfReal

Return
-------
NCollection_Array2<GeomGridEval::SurfD2 >

Description
-----------
Evaluate grid points with first and second partial derivatives. 
Parameter theUParams array of U parameter values 
Parameter theVParams array of V parameter values 
Return: 2D array of SurfD2 (1-based indexing), or empty array if geometry is null or parameters empty.
") EvaluateGridD2;
		NCollection_Array2<GeomGridEval::SurfD2 > EvaluateGridD2(const TColStd_Array1OfReal & theUParams, const TColStd_Array1OfReal & theVParams);

		/****** GeomGridEval_BSplineSurface::EvaluateGridD3 ******/
		/****** md5 signature: 3479c5bbc9b8cbc349f17b1e52f99ee4 ******/
		%feature("compactdefaultargs") EvaluateGridD3;
		%feature("autodoc", "
Parameters
----------
theUParams: TColStd_Array1OfReal
theVParams: TColStd_Array1OfReal

Return
-------
NCollection_Array2<GeomGridEval::SurfD3 >

Description
-----------
Evaluate grid points with derivatives up to third order. Uses direct BSplSLib::D3 evaluation (no caching for D3). 
Parameter theUParams array of U parameter values 
Parameter theVParams array of V parameter values 
Return: 2D array of SurfD3 (1-based indexing), or empty array if geometry is null or parameters empty.
") EvaluateGridD3;
		NCollection_Array2<GeomGridEval::SurfD3 > EvaluateGridD3(const TColStd_Array1OfReal & theUParams, const TColStd_Array1OfReal & theVParams);

		/****** GeomGridEval_BSplineSurface::EvaluateGridDN ******/
		/****** md5 signature: d718439a98b8eb6dc8103ade82de4018 ******/
		%feature("compactdefaultargs") EvaluateGridDN;
		%feature("autodoc", "
Parameters
----------
theUParams: TColStd_Array1OfReal
theVParams: TColStd_Array1OfReal
theNU: int
theNV: int

Return
-------
NCollection_Array2<gp_Vec >

Description
-----------
Evaluate partial derivative d^(NU+NV)S/(dU^NU dV^NV) at all grid points. For orders > degree in either direction, returns zero. Uses direct geometry DN method. 
Parameter theUParams array of U parameter values 
Parameter theVParams array of V parameter values 
Parameter theNU derivative order in U direction 
Parameter theNV derivative order in V direction 
Return: 2D array of derivative vectors (1-based indexing).
") EvaluateGridDN;
		NCollection_Array2<gp_Vec > EvaluateGridDN(const TColStd_Array1OfReal & theUParams, const TColStd_Array1OfReal & theVParams, int theNU, int theNV);

		/****** GeomGridEval_BSplineSurface::Geometry ******/
		/****** md5 signature: 45bc40013e6bae20ae1bd031537adf65 ******/
		%feature("compactdefaultargs") Geometry;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom_BSplineSurface>

Description
-----------
Returns the geometry handle.
") Geometry;
		const opencascade::handle<Geom_BSplineSurface> & Geometry();

};


%extend GeomGridEval_BSplineSurface {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************
* class GeomGridEval_BezierCurve *
*********************************/
class GeomGridEval_BezierCurve {
	public:
		/****** GeomGridEval_BezierCurve::GeomGridEval_BezierCurve ******/
		/****** md5 signature: 07294273fd7a3a02aad0d7d40cfed7c3 ******/
		%feature("compactdefaultargs") GeomGridEval_BezierCurve;
		%feature("autodoc", "
Parameters
----------
theBezier: Geom_BezierCurve

Return
-------
None

Description
-----------
Constructor with geometry. 
Parameter theBezier the bezier curve geometry to evaluate.
") GeomGridEval_BezierCurve;
		 GeomGridEval_BezierCurve(const opencascade::handle<Geom_BezierCurve> & theBezier);

		/****** GeomGridEval_BezierCurve::EvaluateGrid ******/
		/****** md5 signature: f92ee9a0e7514e0ca74fc94b534f9a94 ******/
		%feature("compactdefaultargs") EvaluateGrid;
		%feature("autodoc", "
Parameters
----------
theParams: TColStd_Array1OfReal

Return
-------
NCollection_Array1<gp_Pnt >

Description
-----------
Evaluate all grid points. 
Parameter theParams array of parameter values 
Return: array of evaluated points (1-based indexing), or empty array if geometry is null or no parameters.
") EvaluateGrid;
		NCollection_Array1<gp_Pnt > EvaluateGrid(const TColStd_Array1OfReal & theParams);

		/****** GeomGridEval_BezierCurve::EvaluateGridD1 ******/
		/****** md5 signature: 56a96d714c4025da05b031d7a4376d88 ******/
		%feature("compactdefaultargs") EvaluateGridD1;
		%feature("autodoc", "
Parameters
----------
theParams: TColStd_Array1OfReal

Return
-------
NCollection_Array1<GeomGridEval::CurveD1 >

Description
-----------
Evaluate all grid points with first derivative. 
Parameter theParams array of parameter values 
Return: array of CurveD1 (1-based indexing).
") EvaluateGridD1;
		NCollection_Array1<GeomGridEval::CurveD1 > EvaluateGridD1(const TColStd_Array1OfReal & theParams);

		/****** GeomGridEval_BezierCurve::EvaluateGridD2 ******/
		/****** md5 signature: a2ca4df7dbaf37524e734cb3d28f01a6 ******/
		%feature("compactdefaultargs") EvaluateGridD2;
		%feature("autodoc", "
Parameters
----------
theParams: TColStd_Array1OfReal

Return
-------
NCollection_Array1<GeomGridEval::CurveD2 >

Description
-----------
Evaluate all grid points with first and second derivatives. 
Parameter theParams array of parameter values 
Return: array of CurveD2 (1-based indexing).
") EvaluateGridD2;
		NCollection_Array1<GeomGridEval::CurveD2 > EvaluateGridD2(const TColStd_Array1OfReal & theParams);

		/****** GeomGridEval_BezierCurve::EvaluateGridD3 ******/
		/****** md5 signature: b0a1316ee078e14b02f25df019c02eec ******/
		%feature("compactdefaultargs") EvaluateGridD3;
		%feature("autodoc", "
Parameters
----------
theParams: TColStd_Array1OfReal

Return
-------
NCollection_Array1<GeomGridEval::CurveD3 >

Description
-----------
Evaluate all grid points with first, second, and third derivatives. 
Parameter theParams array of parameter values 
Return: array of CurveD3 (1-based indexing).
") EvaluateGridD3;
		NCollection_Array1<GeomGridEval::CurveD3 > EvaluateGridD3(const TColStd_Array1OfReal & theParams);

		/****** GeomGridEval_BezierCurve::EvaluateGridDN ******/
		/****** md5 signature: 94480de11385d33bdb1f3592abeec9d4 ******/
		%feature("compactdefaultargs") EvaluateGridDN;
		%feature("autodoc", "
Parameters
----------
theParams: TColStd_Array1OfReal
theN: int

Return
-------
NCollection_Array1<gp_Vec >

Description
-----------
Evaluate Nth derivative at all grid points. For orders 1-3, reuses EvaluateGridD1/D2/D3. For orders > 3, uses BSplCLib::DN. 
Parameter theParams array of parameter values 
Parameter theN derivative order (N >= 1) 
Return: array of derivative vectors (1-based indexing).
") EvaluateGridDN;
		NCollection_Array1<gp_Vec > EvaluateGridDN(const TColStd_Array1OfReal & theParams, int theN);

		/****** GeomGridEval_BezierCurve::Geometry ******/
		/****** md5 signature: 06b73e3aeb03775da6225911f808822b ******/
		%feature("compactdefaultargs") Geometry;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom_BezierCurve>

Description
-----------
Returns the geometry handle.
") Geometry;
		const opencascade::handle<Geom_BezierCurve> & Geometry();

};


%extend GeomGridEval_BezierCurve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************************
* class GeomGridEval_BezierSurface *
***********************************/
class GeomGridEval_BezierSurface {
	public:
		/****** GeomGridEval_BezierSurface::GeomGridEval_BezierSurface ******/
		/****** md5 signature: 55d9ed5269e6143cf18d8d231cca6a0d ******/
		%feature("compactdefaultargs") GeomGridEval_BezierSurface;
		%feature("autodoc", "
Parameters
----------
theBezier: Geom_BezierSurface

Return
-------
None

Description
-----------
Constructor with geometry. 
Parameter theBezier the bezier surface geometry to evaluate.
") GeomGridEval_BezierSurface;
		 GeomGridEval_BezierSurface(const opencascade::handle<Geom_BezierSurface> & theBezier);

		/****** GeomGridEval_BezierSurface::EvaluateGrid ******/
		/****** md5 signature: 6d2a3b471accd06cd07e1de5ae544aa8 ******/
		%feature("compactdefaultargs") EvaluateGrid;
		%feature("autodoc", "
Parameters
----------
theUParams: TColStd_Array1OfReal
theVParams: TColStd_Array1OfReal

Return
-------
NCollection_Array2<gp_Pnt >

Description
-----------
Evaluate all grid points. 
Input parameter: theUParams array of U parameter values 
Input parameter: theVParams array of V parameter values 
Return: 2D array of evaluated points (1-based indexing), or empty array if geometry is null or no parameters set.
") EvaluateGrid;
		NCollection_Array2<gp_Pnt > EvaluateGrid(const TColStd_Array1OfReal & theUParams, const TColStd_Array1OfReal & theVParams);

		/****** GeomGridEval_BezierSurface::EvaluateGridD1 ******/
		/****** md5 signature: fadc5d6269d67e8eef910732d08109f4 ******/
		%feature("compactdefaultargs") EvaluateGridD1;
		%feature("autodoc", "
Parameters
----------
theUParams: TColStd_Array1OfReal
theVParams: TColStd_Array1OfReal

Return
-------
NCollection_Array2<GeomGridEval::SurfD1 >

Description
-----------
Evaluate all grid points with first partial derivatives. 
Input parameter: theUParams array of U parameter values 
Input parameter: theVParams array of V parameter values 
Return: 2D array of SurfD1 (1-based indexing), or empty array if geometry is null or no parameters set.
") EvaluateGridD1;
		NCollection_Array2<GeomGridEval::SurfD1 > EvaluateGridD1(const TColStd_Array1OfReal & theUParams, const TColStd_Array1OfReal & theVParams);

		/****** GeomGridEval_BezierSurface::EvaluateGridD2 ******/
		/****** md5 signature: 43a3b86f1ecc11df7e4d6df5371f7426 ******/
		%feature("compactdefaultargs") EvaluateGridD2;
		%feature("autodoc", "
Parameters
----------
theUParams: TColStd_Array1OfReal
theVParams: TColStd_Array1OfReal

Return
-------
NCollection_Array2<GeomGridEval::SurfD2 >

Description
-----------
Evaluate all grid points with first and second partial derivatives. 
Input parameter: theUParams array of U parameter values 
Input parameter: theVParams array of V parameter values 
Return: 2D array of SurfD2 (1-based indexing), or empty array if geometry is null or no parameters set.
") EvaluateGridD2;
		NCollection_Array2<GeomGridEval::SurfD2 > EvaluateGridD2(const TColStd_Array1OfReal & theUParams, const TColStd_Array1OfReal & theVParams);

		/****** GeomGridEval_BezierSurface::EvaluateGridD3 ******/
		/****** md5 signature: 3479c5bbc9b8cbc349f17b1e52f99ee4 ******/
		%feature("compactdefaultargs") EvaluateGridD3;
		%feature("autodoc", "
Parameters
----------
theUParams: TColStd_Array1OfReal
theVParams: TColStd_Array1OfReal

Return
-------
NCollection_Array2<GeomGridEval::SurfD3 >

Description
-----------
Evaluate all grid points with derivatives up to third order. Uses direct Geom_BezierSurface::D3 evaluation. 
Input parameter: theUParams array of U parameter values 
Input parameter: theVParams array of V parameter values 
Return: 2D array of SurfD3 (1-based indexing), or empty array if geometry is null or no parameters set.
") EvaluateGridD3;
		NCollection_Array2<GeomGridEval::SurfD3 > EvaluateGridD3(const TColStd_Array1OfReal & theUParams, const TColStd_Array1OfReal & theVParams);

		/****** GeomGridEval_BezierSurface::EvaluateGridDN ******/
		/****** md5 signature: d718439a98b8eb6dc8103ade82de4018 ******/
		%feature("compactdefaultargs") EvaluateGridDN;
		%feature("autodoc", "
Parameters
----------
theUParams: TColStd_Array1OfReal
theVParams: TColStd_Array1OfReal
theNU: int
theNV: int

Return
-------
NCollection_Array2<gp_Vec >

Description
-----------
Evaluate partial derivative d^(NU+NV)S/(dU^NU dV^NV) at all grid points. For orders 1-3, reuses EvaluateGridD1/D2/D3. For orders > 3, uses geometry DN method. 
Input parameter: theUParams array of U parameter values 
Input parameter: theVParams array of V parameter values 
Input parameter: theNU derivative order in U direction 
Input parameter: theNV derivative order in V direction 
Return: 2D array of derivative vectors (1-based indexing).
") EvaluateGridDN;
		NCollection_Array2<gp_Vec > EvaluateGridDN(const TColStd_Array1OfReal & theUParams, const TColStd_Array1OfReal & theVParams, int theNU, int theNV);

		/****** GeomGridEval_BezierSurface::Geometry ******/
		/****** md5 signature: 29fe6ac2dbffa73417781adc00c8a516 ******/
		%feature("compactdefaultargs") Geometry;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom_BezierSurface>

Description
-----------
Returns the geometry handle.
") Geometry;
		const opencascade::handle<Geom_BezierSurface> & Geometry();

};


%extend GeomGridEval_BezierSurface {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************
* class GeomGridEval_Circle *
****************************/
class GeomGridEval_Circle {
	public:
		/****** GeomGridEval_Circle::GeomGridEval_Circle ******/
		/****** md5 signature: ff0d19942e81791b62742ae3f3f9fe87 ******/
		%feature("compactdefaultargs") GeomGridEval_Circle;
		%feature("autodoc", "
Parameters
----------
theCircle: Geom_Circle

Return
-------
None

Description
-----------
Constructor with geometry. 
Parameter theCircle the circle geometry to evaluate.
") GeomGridEval_Circle;
		 GeomGridEval_Circle(const opencascade::handle<Geom_Circle> & theCircle);

		/****** GeomGridEval_Circle::EvaluateGrid ******/
		/****** md5 signature: f92ee9a0e7514e0ca74fc94b534f9a94 ******/
		%feature("compactdefaultargs") EvaluateGrid;
		%feature("autodoc", "
Parameters
----------
theParams: TColStd_Array1OfReal

Return
-------
NCollection_Array1<gp_Pnt >

Description
-----------
Evaluate all grid points. 
Parameter theParams array of parameter values (angles in radians) 
Return: array of evaluated points (1-based indexing), or empty array if geometry is null or no parameters.
") EvaluateGrid;
		NCollection_Array1<gp_Pnt > EvaluateGrid(const TColStd_Array1OfReal & theParams);

		/****** GeomGridEval_Circle::EvaluateGridD1 ******/
		/****** md5 signature: 56a96d714c4025da05b031d7a4376d88 ******/
		%feature("compactdefaultargs") EvaluateGridD1;
		%feature("autodoc", "
Parameters
----------
theParams: TColStd_Array1OfReal

Return
-------
NCollection_Array1<GeomGridEval::CurveD1 >

Description
-----------
Evaluate all grid points with first derivative. D1 = R * (-sin(u) * XDir + cos(u) * YDir) 
Parameter theParams array of parameter values 
Return: array of CurveD1 (1-based indexing), or empty array if geometry is null or no parameters.
") EvaluateGridD1;
		NCollection_Array1<GeomGridEval::CurveD1 > EvaluateGridD1(const TColStd_Array1OfReal & theParams);

		/****** GeomGridEval_Circle::EvaluateGridD2 ******/
		/****** md5 signature: a2ca4df7dbaf37524e734cb3d28f01a6 ******/
		%feature("compactdefaultargs") EvaluateGridD2;
		%feature("autodoc", "
Parameters
----------
theParams: TColStd_Array1OfReal

Return
-------
NCollection_Array1<GeomGridEval::CurveD2 >

Description
-----------
Evaluate all grid points with first and second derivatives. D2 = R * (-cos(u) * XDir - sin(u) * YDir) = -P (relative to center) 
Parameter theParams array of parameter values 
Return: array of CurveD2 (1-based indexing), or empty array if geometry is null or no parameters.
") EvaluateGridD2;
		NCollection_Array1<GeomGridEval::CurveD2 > EvaluateGridD2(const TColStd_Array1OfReal & theParams);

		/****** GeomGridEval_Circle::EvaluateGridD3 ******/
		/****** md5 signature: b0a1316ee078e14b02f25df019c02eec ******/
		%feature("compactdefaultargs") EvaluateGridD3;
		%feature("autodoc", "
Parameters
----------
theParams: TColStd_Array1OfReal

Return
-------
NCollection_Array1<GeomGridEval::CurveD3 >

Description
-----------
Evaluate all grid points with first, second, and third derivatives. D3 = R * (sin(u) * XDir - cos(u) * YDir) = -D1 
Parameter theParams array of parameter values 
Return: array of CurveD3 (1-based indexing), or empty array if geometry is null or no parameters.
") EvaluateGridD3;
		NCollection_Array1<GeomGridEval::CurveD3 > EvaluateGridD3(const TColStd_Array1OfReal & theParams);

		/****** GeomGridEval_Circle::EvaluateGridDN ******/
		/****** md5 signature: 94480de11385d33bdb1f3592abeec9d4 ******/
		%feature("compactdefaultargs") EvaluateGridDN;
		%feature("autodoc", "
Parameters
----------
theParams: TColStd_Array1OfReal
theN: int

Return
-------
NCollection_Array1<gp_Vec >

Description
-----------
Evaluate Nth derivative at all grid points. Circle has cyclic derivatives with period 4: D1 = R * (-sin(u) * X + cos(u) * Y) D2 = R * (-cos(u) * X - sin(u) * Y) D3 = R * (sin(u) * X - cos(u) * Y) D4 = R * (cos(u) * X + sin(u) * Y) = D0, then repeats 
Parameter theParams array of parameter values 
Parameter theN derivative order (N >= 1) 
Return: array of derivative vectors (1-based indexing), or empty array if geometry is null or no parameters.
") EvaluateGridDN;
		NCollection_Array1<gp_Vec > EvaluateGridDN(const TColStd_Array1OfReal & theParams, int theN);

		/****** GeomGridEval_Circle::Geometry ******/
		/****** md5 signature: 82faf6fdc68806f4c09fa4891a54c9c2 ******/
		%feature("compactdefaultargs") Geometry;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom_Circle>

Description
-----------
Returns the geometry handle.
") Geometry;
		const opencascade::handle<Geom_Circle> & Geometry();

};


%extend GeomGridEval_Circle {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************
* class GeomGridEval_Cone *
**************************/
class GeomGridEval_Cone {
	public:
		class Data {};
		class UContext {};
		/****** GeomGridEval_Cone::GeomGridEval_Cone ******/
		/****** md5 signature: 566f78a93d87f682fffb3acc59d7f179 ******/
		%feature("compactdefaultargs") GeomGridEval_Cone;
		%feature("autodoc", "
Parameters
----------
theCone: Geom_ConicalSurface

Return
-------
None

Description
-----------
Constructor with geometry. 
Parameter theCone the conical surface geometry to evaluate.
") GeomGridEval_Cone;
		 GeomGridEval_Cone(const opencascade::handle<Geom_ConicalSurface> & theCone);

		/****** GeomGridEval_Cone::EvaluateGrid ******/
		/****** md5 signature: 6d2a3b471accd06cd07e1de5ae544aa8 ******/
		%feature("compactdefaultargs") EvaluateGrid;
		%feature("autodoc", "
Parameters
----------
theUParams: TColStd_Array1OfReal
theVParams: TColStd_Array1OfReal

Return
-------
NCollection_Array2<gp_Pnt >

Description
-----------
Evaluate grid points at Cartesian product of U and V parameters. 
Parameter theUParams array of U parameter values (angle) 
Parameter theVParams array of V parameter values (linear along ruling) 
Return: 2D array of evaluated points (1-based indexing).
") EvaluateGrid;
		NCollection_Array2<gp_Pnt > EvaluateGrid(const TColStd_Array1OfReal & theUParams, const TColStd_Array1OfReal & theVParams);

		/****** GeomGridEval_Cone::EvaluateGridD1 ******/
		/****** md5 signature: fadc5d6269d67e8eef910732d08109f4 ******/
		%feature("compactdefaultargs") EvaluateGridD1;
		%feature("autodoc", "
Parameters
----------
theUParams: TColStd_Array1OfReal
theVParams: TColStd_Array1OfReal

Return
-------
NCollection_Array2<GeomGridEval::SurfD1 >

Description
-----------
Evaluate grid points with first partial derivatives. 
Parameter theUParams array of U parameter values (angle) 
Parameter theVParams array of V parameter values (linear along ruling) 
Return: 2D array of SurfD1 (1-based indexing).
") EvaluateGridD1;
		NCollection_Array2<GeomGridEval::SurfD1 > EvaluateGridD1(const TColStd_Array1OfReal & theUParams, const TColStd_Array1OfReal & theVParams);

		/****** GeomGridEval_Cone::EvaluateGridD2 ******/
		/****** md5 signature: 43a3b86f1ecc11df7e4d6df5371f7426 ******/
		%feature("compactdefaultargs") EvaluateGridD2;
		%feature("autodoc", "
Parameters
----------
theUParams: TColStd_Array1OfReal
theVParams: TColStd_Array1OfReal

Return
-------
NCollection_Array2<GeomGridEval::SurfD2 >

Description
-----------
Evaluate grid points with first and second partial derivatives. 
Parameter theUParams array of U parameter values (angle) 
Parameter theVParams array of V parameter values (linear along ruling) 
Return: 2D array of SurfD2 (1-based indexing).
") EvaluateGridD2;
		NCollection_Array2<GeomGridEval::SurfD2 > EvaluateGridD2(const TColStd_Array1OfReal & theUParams, const TColStd_Array1OfReal & theVParams);

		/****** GeomGridEval_Cone::EvaluateGridD3 ******/
		/****** md5 signature: 3479c5bbc9b8cbc349f17b1e52f99ee4 ******/
		%feature("compactdefaultargs") EvaluateGridD3;
		%feature("autodoc", "
Parameters
----------
theUParams: TColStd_Array1OfReal
theVParams: TColStd_Array1OfReal

Return
-------
NCollection_Array2<GeomGridEval::SurfD3 >

Description
-----------
Evaluate grid points with derivatives up to third order. 
Parameter theUParams array of U parameter values (angle) 
Parameter theVParams array of V parameter values (linear along ruling) 
Return: 2D array of SurfD3 (1-based indexing).
") EvaluateGridD3;
		NCollection_Array2<GeomGridEval::SurfD3 > EvaluateGridD3(const TColStd_Array1OfReal & theUParams, const TColStd_Array1OfReal & theVParams);

		/****** GeomGridEval_Cone::EvaluateGridDN ******/
		/****** md5 signature: d718439a98b8eb6dc8103ade82de4018 ******/
		%feature("compactdefaultargs") EvaluateGridDN;
		%feature("autodoc", "
Parameters
----------
theUParams: TColStd_Array1OfReal
theVParams: TColStd_Array1OfReal
theNU: int
theNV: int

Return
-------
NCollection_Array2<gp_Vec >

Description
-----------
Evaluate partial derivative d^(NU+NV)S/(dU^NU dV^NV) at all grid points. For orders 1-3, reuses EvaluateGridD1/D2/D3. For orders > 3, uses geometry DN method. 
Parameter theUParams array of U parameter values (angle) 
Parameter theVParams array of V parameter values (linear along ruling) 
Parameter theNU derivative order in U direction 
Parameter theNV derivative order in V direction 
Return: 2D array of derivative vectors (1-based indexing).
") EvaluateGridDN;
		NCollection_Array2<gp_Vec > EvaluateGridDN(const TColStd_Array1OfReal & theUParams, const TColStd_Array1OfReal & theVParams, int theNU, int theNV);

		/****** GeomGridEval_Cone::Geometry ******/
		/****** md5 signature: b8b4e0aa53555d98ff227bb13963e1b2 ******/
		%feature("compactdefaultargs") Geometry;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom_ConicalSurface>

Description
-----------
Returns the geometry handle.
") Geometry;
		const opencascade::handle<Geom_ConicalSurface> & Geometry();

};


%extend GeomGridEval_Cone {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************
* class GeomGridEval_Curve *
***************************/
class GeomGridEval_Curve {
	public:
		/****** GeomGridEval_Curve::GeomGridEval_Curve ******/
		/****** md5 signature: e6b435a983f1cbc60884db711d69f45e ******/
		%feature("compactdefaultargs") GeomGridEval_Curve;
		%feature("autodoc", "
Parameters
----------
theCurve: Adaptor3d_Curve

Return
-------
None

Description
-----------
Construct from adaptor reference (auto-detects curve type). For GeomAdaptor_Curve, extracts underlying Geom_Curve for optimized evaluation. For other adaptors, stores reference for fallback evaluation. @note The curve adaptor reference must remain valid during the lifetime of this evaluator when using fallback evaluation. 
Input parameter: theCurve curve adaptor reference to evaluate.
") GeomGridEval_Curve;
		 GeomGridEval_Curve(const Adaptor3d_Curve & theCurve);

		/****** GeomGridEval_Curve::GeomGridEval_Curve ******/
		/****** md5 signature: a15514fa89e7ce305f28cea3c3c914a9 ******/
		%feature("compactdefaultargs") GeomGridEval_Curve;
		%feature("autodoc", "
Parameters
----------
theCurve: Geom_Curve

Return
-------
None

Description
-----------
Construct from geometry handle (auto-detects curve type). 
Input parameter: theCurve geometry to evaluate.
") GeomGridEval_Curve;
		 GeomGridEval_Curve(const opencascade::handle<Geom_Curve> & theCurve);

		/****** GeomGridEval_Curve::EvaluateGrid ******/
		/****** md5 signature: f92ee9a0e7514e0ca74fc94b534f9a94 ******/
		%feature("compactdefaultargs") EvaluateGrid;
		%feature("autodoc", "
Parameters
----------
theParams: TColStd_Array1OfReal

Return
-------
NCollection_Array1<gp_Pnt >

Description
-----------
Evaluate grid points at all parameters. 
Parameter theParams array of parameter values 
Return: array of 3D points (1-based indexing).
") EvaluateGrid;
		NCollection_Array1<gp_Pnt > EvaluateGrid(const TColStd_Array1OfReal & theParams);

		/****** GeomGridEval_Curve::EvaluateGridD1 ******/
		/****** md5 signature: 56a96d714c4025da05b031d7a4376d88 ******/
		%feature("compactdefaultargs") EvaluateGridD1;
		%feature("autodoc", "
Parameters
----------
theParams: TColStd_Array1OfReal

Return
-------
NCollection_Array1<GeomGridEval::CurveD1 >

Description
-----------
Evaluate grid points with first derivative. 
Parameter theParams array of parameter values 
Return: array of CurveD1 (1-based indexing).
") EvaluateGridD1;
		NCollection_Array1<GeomGridEval::CurveD1 > EvaluateGridD1(const TColStd_Array1OfReal & theParams);

		/****** GeomGridEval_Curve::EvaluateGridD2 ******/
		/****** md5 signature: a2ca4df7dbaf37524e734cb3d28f01a6 ******/
		%feature("compactdefaultargs") EvaluateGridD2;
		%feature("autodoc", "
Parameters
----------
theParams: TColStd_Array1OfReal

Return
-------
NCollection_Array1<GeomGridEval::CurveD2 >

Description
-----------
Evaluate grid points with first and second derivatives. 
Parameter theParams array of parameter values 
Return: array of CurveD2 (1-based indexing).
") EvaluateGridD2;
		NCollection_Array1<GeomGridEval::CurveD2 > EvaluateGridD2(const TColStd_Array1OfReal & theParams);

		/****** GeomGridEval_Curve::EvaluateGridD3 ******/
		/****** md5 signature: b0a1316ee078e14b02f25df019c02eec ******/
		%feature("compactdefaultargs") EvaluateGridD3;
		%feature("autodoc", "
Parameters
----------
theParams: TColStd_Array1OfReal

Return
-------
NCollection_Array1<GeomGridEval::CurveD3 >

Description
-----------
Evaluate grid points with first, second, and third derivatives. 
Parameter theParams array of parameter values 
Return: array of CurveD3 (1-based indexing).
") EvaluateGridD3;
		NCollection_Array1<GeomGridEval::CurveD3 > EvaluateGridD3(const TColStd_Array1OfReal & theParams);

		/****** GeomGridEval_Curve::EvaluateGridDN ******/
		/****** md5 signature: 94480de11385d33bdb1f3592abeec9d4 ******/
		%feature("compactdefaultargs") EvaluateGridDN;
		%feature("autodoc", "
Parameters
----------
theParams: TColStd_Array1OfReal
theN: int

Return
-------
NCollection_Array1<gp_Vec >

Description
-----------
Evaluate Nth derivative at all grid points. 
Parameter theParams array of parameter values 
Parameter theN derivative order (N >= 1) 
Return: array of derivative vectors (1-based indexing).
") EvaluateGridDN;
		NCollection_Array1<gp_Vec > EvaluateGridDN(const TColStd_Array1OfReal & theParams, int theN);

		/****** GeomGridEval_Curve::GetType ******/
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


%extend GeomGridEval_Curve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************
* class GeomGridEval_Cylinder *
******************************/
class GeomGridEval_Cylinder {
	public:
		class Data {};
		class UContext {};
		/****** GeomGridEval_Cylinder::GeomGridEval_Cylinder ******/
		/****** md5 signature: 699d46b492141e83f3b5a6be3651b8dc ******/
		%feature("compactdefaultargs") GeomGridEval_Cylinder;
		%feature("autodoc", "
Parameters
----------
theCylinder: Geom_CylindricalSurface

Return
-------
None

Description
-----------
Constructor with geometry. 
Parameter theCylinder the cylindrical surface geometry to evaluate.
") GeomGridEval_Cylinder;
		 GeomGridEval_Cylinder(const opencascade::handle<Geom_CylindricalSurface> & theCylinder);

		/****** GeomGridEval_Cylinder::EvaluateGrid ******/
		/****** md5 signature: 6d2a3b471accd06cd07e1de5ae544aa8 ******/
		%feature("compactdefaultargs") EvaluateGrid;
		%feature("autodoc", "
Parameters
----------
theUParams: TColStd_Array1OfReal
theVParams: TColStd_Array1OfReal

Return
-------
NCollection_Array2<gp_Pnt >

Description
-----------
Evaluate grid points at Cartesian product of U and V parameters. 
Parameter theUParams array of U parameter values (angle) 
Parameter theVParams array of V parameter values (height) 
Return: 2D array of evaluated points (1-based indexing).
") EvaluateGrid;
		NCollection_Array2<gp_Pnt > EvaluateGrid(const TColStd_Array1OfReal & theUParams, const TColStd_Array1OfReal & theVParams);

		/****** GeomGridEval_Cylinder::EvaluateGridD1 ******/
		/****** md5 signature: fadc5d6269d67e8eef910732d08109f4 ******/
		%feature("compactdefaultargs") EvaluateGridD1;
		%feature("autodoc", "
Parameters
----------
theUParams: TColStd_Array1OfReal
theVParams: TColStd_Array1OfReal

Return
-------
NCollection_Array2<GeomGridEval::SurfD1 >

Description
-----------
Evaluate grid points with first partial derivatives. 
Parameter theUParams array of U parameter values (angle) 
Parameter theVParams array of V parameter values (height) 
Return: 2D array of SurfD1 (1-based indexing).
") EvaluateGridD1;
		NCollection_Array2<GeomGridEval::SurfD1 > EvaluateGridD1(const TColStd_Array1OfReal & theUParams, const TColStd_Array1OfReal & theVParams);

		/****** GeomGridEval_Cylinder::EvaluateGridD2 ******/
		/****** md5 signature: 43a3b86f1ecc11df7e4d6df5371f7426 ******/
		%feature("compactdefaultargs") EvaluateGridD2;
		%feature("autodoc", "
Parameters
----------
theUParams: TColStd_Array1OfReal
theVParams: TColStd_Array1OfReal

Return
-------
NCollection_Array2<GeomGridEval::SurfD2 >

Description
-----------
Evaluate grid points with first and second partial derivatives. 
Parameter theUParams array of U parameter values (angle) 
Parameter theVParams array of V parameter values (height) 
Return: 2D array of SurfD2 (1-based indexing).
") EvaluateGridD2;
		NCollection_Array2<GeomGridEval::SurfD2 > EvaluateGridD2(const TColStd_Array1OfReal & theUParams, const TColStd_Array1OfReal & theVParams);

		/****** GeomGridEval_Cylinder::EvaluateGridD3 ******/
		/****** md5 signature: 3479c5bbc9b8cbc349f17b1e52f99ee4 ******/
		%feature("compactdefaultargs") EvaluateGridD3;
		%feature("autodoc", "
Parameters
----------
theUParams: TColStd_Array1OfReal
theVParams: TColStd_Array1OfReal

Return
-------
NCollection_Array2<GeomGridEval::SurfD3 >

Description
-----------
Evaluate grid points with derivatives up to third order. 
Parameter theUParams array of U parameter values (angle) 
Parameter theVParams array of V parameter values (height) 
Return: 2D array of SurfD3 (1-based indexing).
") EvaluateGridD3;
		NCollection_Array2<GeomGridEval::SurfD3 > EvaluateGridD3(const TColStd_Array1OfReal & theUParams, const TColStd_Array1OfReal & theVParams);

		/****** GeomGridEval_Cylinder::EvaluateGridDN ******/
		/****** md5 signature: d718439a98b8eb6dc8103ade82de4018 ******/
		%feature("compactdefaultargs") EvaluateGridDN;
		%feature("autodoc", "
Parameters
----------
theUParams: TColStd_Array1OfReal
theVParams: TColStd_Array1OfReal
theNU: int
theNV: int

Return
-------
NCollection_Array2<gp_Vec >

Description
-----------
Evaluate partial derivative d^(NU+NV)S/(dU^NU dV^NV) at all grid points. For a cylinder: - U derivatives are cyclic (period 4): D_nU = R * (cyclic trig) - V derivatives: D1V = ZDir, higher = 0 - Mixed: D_{nu,nv} = 0 for nv > 1 
Parameter theUParams array of U parameter values (angle) 
Parameter theVParams array of V parameter values (height) 
Parameter theNU derivative order in U direction 
Parameter theNV derivative order in V direction 
Return: 2D array of derivative vectors (1-based indexing).
") EvaluateGridDN;
		NCollection_Array2<gp_Vec > EvaluateGridDN(const TColStd_Array1OfReal & theUParams, const TColStd_Array1OfReal & theVParams, int theNU, int theNV);

		/****** GeomGridEval_Cylinder::Geometry ******/
		/****** md5 signature: 9745a57a86b4cae860a0862b948fa759 ******/
		%feature("compactdefaultargs") Geometry;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom_CylindricalSurface>

Description
-----------
Returns the geometry handle.
") Geometry;
		const opencascade::handle<Geom_CylindricalSurface> & Geometry();

};


%extend GeomGridEval_Cylinder {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************
* class GeomGridEval_Ellipse *
*****************************/
class GeomGridEval_Ellipse {
	public:
		/****** GeomGridEval_Ellipse::GeomGridEval_Ellipse ******/
		/****** md5 signature: ca94caa29283d834ddfda5e6ed1d97c8 ******/
		%feature("compactdefaultargs") GeomGridEval_Ellipse;
		%feature("autodoc", "
Parameters
----------
theEllipse: Geom_Ellipse

Return
-------
None

Description
-----------
Constructor with geometry. 
Parameter theEllipse the ellipse geometry to evaluate.
") GeomGridEval_Ellipse;
		 GeomGridEval_Ellipse(const opencascade::handle<Geom_Ellipse> & theEllipse);

		/****** GeomGridEval_Ellipse::EvaluateGrid ******/
		/****** md5 signature: f92ee9a0e7514e0ca74fc94b534f9a94 ******/
		%feature("compactdefaultargs") EvaluateGrid;
		%feature("autodoc", "
Parameters
----------
theParams: TColStd_Array1OfReal

Return
-------
NCollection_Array1<gp_Pnt >

Description
-----------
Evaluate all grid points. 
Parameter theParams array of parameter values 
Return: array of evaluated points (1-based indexing), or empty array if geometry is null or no parameters.
") EvaluateGrid;
		NCollection_Array1<gp_Pnt > EvaluateGrid(const TColStd_Array1OfReal & theParams);

		/****** GeomGridEval_Ellipse::EvaluateGridD1 ******/
		/****** md5 signature: 56a96d714c4025da05b031d7a4376d88 ******/
		%feature("compactdefaultargs") EvaluateGridD1;
		%feature("autodoc", "
Parameters
----------
theParams: TColStd_Array1OfReal

Return
-------
NCollection_Array1<GeomGridEval::CurveD1 >

Description
-----------
Evaluate all grid points with first derivative. 
Parameter theParams array of parameter values 
Return: array of CurveD1 (1-based indexing).
") EvaluateGridD1;
		NCollection_Array1<GeomGridEval::CurveD1 > EvaluateGridD1(const TColStd_Array1OfReal & theParams);

		/****** GeomGridEval_Ellipse::EvaluateGridD2 ******/
		/****** md5 signature: a2ca4df7dbaf37524e734cb3d28f01a6 ******/
		%feature("compactdefaultargs") EvaluateGridD2;
		%feature("autodoc", "
Parameters
----------
theParams: TColStd_Array1OfReal

Return
-------
NCollection_Array1<GeomGridEval::CurveD2 >

Description
-----------
Evaluate all grid points with first and second derivatives. 
Parameter theParams array of parameter values 
Return: array of CurveD2 (1-based indexing).
") EvaluateGridD2;
		NCollection_Array1<GeomGridEval::CurveD2 > EvaluateGridD2(const TColStd_Array1OfReal & theParams);

		/****** GeomGridEval_Ellipse::EvaluateGridD3 ******/
		/****** md5 signature: b0a1316ee078e14b02f25df019c02eec ******/
		%feature("compactdefaultargs") EvaluateGridD3;
		%feature("autodoc", "
Parameters
----------
theParams: TColStd_Array1OfReal

Return
-------
NCollection_Array1<GeomGridEval::CurveD3 >

Description
-----------
Evaluate all grid points with first, second, and third derivatives. 
Parameter theParams array of parameter values 
Return: array of CurveD3 (1-based indexing).
") EvaluateGridD3;
		NCollection_Array1<GeomGridEval::CurveD3 > EvaluateGridD3(const TColStd_Array1OfReal & theParams);

		/****** GeomGridEval_Ellipse::EvaluateGridDN ******/
		/****** md5 signature: 94480de11385d33bdb1f3592abeec9d4 ******/
		%feature("compactdefaultargs") EvaluateGridDN;
		%feature("autodoc", "
Parameters
----------
theParams: TColStd_Array1OfReal
theN: int

Return
-------
NCollection_Array1<gp_Vec >

Description
-----------
Evaluate Nth derivative at all grid points. Ellipse has cyclic derivatives with period 4: D1 = -MajR * sin(u) * X + MinR * cos(u) * Y D2 = -MajR * cos(u) * X - MinR * sin(u) * Y D3 = MajR * sin(u) * X - MinR * cos(u) * Y D4 = MajR * cos(u) * X + MinR * sin(u) * Y = D0, then repeats 
Parameter theParams array of parameter values 
Parameter theN derivative order (N >= 1) 
Return: array of derivative vectors (1-based indexing).
") EvaluateGridDN;
		NCollection_Array1<gp_Vec > EvaluateGridDN(const TColStd_Array1OfReal & theParams, int theN);

		/****** GeomGridEval_Ellipse::Geometry ******/
		/****** md5 signature: c93b2255cb5afd7e70c8e5457a2425fa ******/
		%feature("compactdefaultargs") Geometry;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom_Ellipse>

Description
-----------
Returns the geometry handle.
") Geometry;
		const opencascade::handle<Geom_Ellipse> & Geometry();

};


%extend GeomGridEval_Ellipse {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************
* class GeomGridEval_Hyperbola *
*******************************/
class GeomGridEval_Hyperbola {
	public:
		/****** GeomGridEval_Hyperbola::GeomGridEval_Hyperbola ******/
		/****** md5 signature: d64b7ceabf6b4fda7316fefcb82424e9 ******/
		%feature("compactdefaultargs") GeomGridEval_Hyperbola;
		%feature("autodoc", "
Parameters
----------
theHyperbola: Geom_Hyperbola

Return
-------
None

Description
-----------
Constructor with geometry. 
Parameter theHyperbola the hyperbola geometry to evaluate.
") GeomGridEval_Hyperbola;
		 GeomGridEval_Hyperbola(const opencascade::handle<Geom_Hyperbola> & theHyperbola);

		/****** GeomGridEval_Hyperbola::EvaluateGrid ******/
		/****** md5 signature: f92ee9a0e7514e0ca74fc94b534f9a94 ******/
		%feature("compactdefaultargs") EvaluateGrid;
		%feature("autodoc", "
Parameters
----------
theParams: TColStd_Array1OfReal

Return
-------
NCollection_Array1<gp_Pnt >

Description
-----------
Evaluate all grid points. 
Parameter theParams array of parameter values 
Return: array of evaluated points (1-based indexing), or empty array if geometry is null or no parameters.
") EvaluateGrid;
		NCollection_Array1<gp_Pnt > EvaluateGrid(const TColStd_Array1OfReal & theParams);

		/****** GeomGridEval_Hyperbola::EvaluateGridD1 ******/
		/****** md5 signature: 56a96d714c4025da05b031d7a4376d88 ******/
		%feature("compactdefaultargs") EvaluateGridD1;
		%feature("autodoc", "
Parameters
----------
theParams: TColStd_Array1OfReal

Return
-------
NCollection_Array1<GeomGridEval::CurveD1 >

Description
-----------
Evaluate all grid points with first derivative. 
Parameter theParams array of parameter values 
Return: array of CurveD1 (1-based indexing).
") EvaluateGridD1;
		NCollection_Array1<GeomGridEval::CurveD1 > EvaluateGridD1(const TColStd_Array1OfReal & theParams);

		/****** GeomGridEval_Hyperbola::EvaluateGridD2 ******/
		/****** md5 signature: a2ca4df7dbaf37524e734cb3d28f01a6 ******/
		%feature("compactdefaultargs") EvaluateGridD2;
		%feature("autodoc", "
Parameters
----------
theParams: TColStd_Array1OfReal

Return
-------
NCollection_Array1<GeomGridEval::CurveD2 >

Description
-----------
Evaluate all grid points with first and second derivatives. 
Parameter theParams array of parameter values 
Return: array of CurveD2 (1-based indexing).
") EvaluateGridD2;
		NCollection_Array1<GeomGridEval::CurveD2 > EvaluateGridD2(const TColStd_Array1OfReal & theParams);

		/****** GeomGridEval_Hyperbola::EvaluateGridD3 ******/
		/****** md5 signature: b0a1316ee078e14b02f25df019c02eec ******/
		%feature("compactdefaultargs") EvaluateGridD3;
		%feature("autodoc", "
Parameters
----------
theParams: TColStd_Array1OfReal

Return
-------
NCollection_Array1<GeomGridEval::CurveD3 >

Description
-----------
Evaluate all grid points with first, second, and third derivatives. 
Parameter theParams array of parameter values 
Return: array of CurveD3 (1-based indexing).
") EvaluateGridD3;
		NCollection_Array1<GeomGridEval::CurveD3 > EvaluateGridD3(const TColStd_Array1OfReal & theParams);

		/****** GeomGridEval_Hyperbola::EvaluateGridDN ******/
		/****** md5 signature: 94480de11385d33bdb1f3592abeec9d4 ******/
		%feature("compactdefaultargs") EvaluateGridDN;
		%feature("autodoc", "
Parameters
----------
theParams: TColStd_Array1OfReal
theN: int

Return
-------
NCollection_Array1<gp_Vec >

Description
-----------
Evaluate Nth derivative at all grid points. Hyperbola has cyclic derivatives with period 2: D1 = MajR * sinh(u) * X + MinR * cosh(u) * Y D2 = MajR * cosh(u) * X + MinR * sinh(u) * Y = D0 D3 = D1, D4 = D0, etc. 
Parameter theParams array of parameter values 
Parameter theN derivative order (N >= 1) 
Return: array of derivative vectors (1-based indexing).
") EvaluateGridDN;
		NCollection_Array1<gp_Vec > EvaluateGridDN(const TColStd_Array1OfReal & theParams, int theN);

		/****** GeomGridEval_Hyperbola::Geometry ******/
		/****** md5 signature: 813530589c49441a650b1022ba5872d2 ******/
		%feature("compactdefaultargs") Geometry;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom_Hyperbola>

Description
-----------
Returns the geometry handle.
") Geometry;
		const opencascade::handle<Geom_Hyperbola> & Geometry();

};


%extend GeomGridEval_Hyperbola {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************
* class GeomGridEval_Line *
**************************/
class GeomGridEval_Line {
	public:
		/****** GeomGridEval_Line::GeomGridEval_Line ******/
		/****** md5 signature: 069a1d8d1aa0bd9bfbf4ca060f8d93dc ******/
		%feature("compactdefaultargs") GeomGridEval_Line;
		%feature("autodoc", "
Parameters
----------
theLine: Geom_Line

Return
-------
None

Description
-----------
Constructor with geometry. 
Parameter theLine the line geometry to evaluate.
") GeomGridEval_Line;
		 GeomGridEval_Line(const opencascade::handle<Geom_Line> & theLine);

		/****** GeomGridEval_Line::EvaluateGrid ******/
		/****** md5 signature: 7a13063ffcd4f861492eb09d42802484 ******/
		%feature("compactdefaultargs") EvaluateGrid;
		%feature("autodoc", "
Parameters
----------
theParams: TColStd_Array1OfReal

Return
-------
NCollection_Array1<gp_Pnt >

Description
-----------
Evaluate all grid points. 
Parameter theParams array of parameter values 
Return: array of evaluated points (1-based indexing), or empty array if geometry is null or no parameters.
") EvaluateGrid;
		NCollection_Array1<gp_Pnt > EvaluateGrid(const TColStd_Array1OfReal & theParams);

		/****** GeomGridEval_Line::EvaluateGridD1 ******/
		/****** md5 signature: 76eafb9a32283512df00136c29d36b81 ******/
		%feature("compactdefaultargs") EvaluateGridD1;
		%feature("autodoc", "
Parameters
----------
theParams: TColStd_Array1OfReal

Return
-------
NCollection_Array1<GeomGridEval::CurveD1 >

Description
-----------
Evaluate all grid points with first derivative. For a line, D1 is constant (the direction vector). 
Parameter theParams array of parameter values 
Return: array of CurveD1 (1-based indexing), or empty array if geometry is null or no parameters.
") EvaluateGridD1;
		NCollection_Array1<GeomGridEval::CurveD1 > EvaluateGridD1(const TColStd_Array1OfReal & theParams);

		/****** GeomGridEval_Line::EvaluateGridD2 ******/
		/****** md5 signature: 3a92c41797e0446963ffe8ca64a4a2ca ******/
		%feature("compactdefaultargs") EvaluateGridD2;
		%feature("autodoc", "
Parameters
----------
theParams: TColStd_Array1OfReal

Return
-------
NCollection_Array1<GeomGridEval::CurveD2 >

Description
-----------
Evaluate all grid points with first and second derivatives. For a line, D1 is constant and D2 is zero. 
Parameter theParams array of parameter values 
Return: array of CurveD2 (1-based indexing), or empty array if geometry is null or no parameters.
") EvaluateGridD2;
		NCollection_Array1<GeomGridEval::CurveD2 > EvaluateGridD2(const TColStd_Array1OfReal & theParams);

		/****** GeomGridEval_Line::EvaluateGridD3 ******/
		/****** md5 signature: b5157bf66582a629dfc2275a7819895c ******/
		%feature("compactdefaultargs") EvaluateGridD3;
		%feature("autodoc", "
Parameters
----------
theParams: TColStd_Array1OfReal

Return
-------
NCollection_Array1<GeomGridEval::CurveD3 >

Description
-----------
Evaluate all grid points with first, second, and third derivatives. For a line, D1 is constant, D2 and D3 are zero. 
Parameter theParams array of parameter values 
Return: array of CurveD3 (1-based indexing), or empty array if geometry is null or no parameters.
") EvaluateGridD3;
		NCollection_Array1<GeomGridEval::CurveD3 > EvaluateGridD3(const TColStd_Array1OfReal & theParams);

		/****** GeomGridEval_Line::EvaluateGridDN ******/
		/****** md5 signature: 44304a0331cac8ffd693c200a96ec10d ******/
		%feature("compactdefaultargs") EvaluateGridDN;
		%feature("autodoc", "
Parameters
----------
theParams: TColStd_Array1OfReal
theN: int

Return
-------
NCollection_Array1<gp_Vec >

Description
-----------
Evaluate Nth derivative at all grid points. For a line: D1 = Direction, DN = 0 for N > 1. 
Parameter theParams array of parameter values 
Parameter theN derivative order (N >= 1) 
Return: array of derivative vectors (1-based indexing), or empty array if geometry is null or no parameters.
") EvaluateGridDN;
		NCollection_Array1<gp_Vec > EvaluateGridDN(const TColStd_Array1OfReal & theParams, int theN);

		/****** GeomGridEval_Line::Geometry ******/
		/****** md5 signature: 3a325185b0aaf4dbbf936f774e594464 ******/
		%feature("compactdefaultargs") Geometry;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom_Line>

Description
-----------
Returns the geometry handle.
") Geometry;
		const opencascade::handle<Geom_Line> & Geometry();

};


%extend GeomGridEval_Line {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************
* class GeomGridEval_OffsetCurve *
*********************************/
class GeomGridEval_OffsetCurve {
	public:
		/****** GeomGridEval_OffsetCurve::GeomGridEval_OffsetCurve ******/
		/****** md5 signature: 235f068d8ed9d1eadda9c4e563c14198 ******/
		%feature("compactdefaultargs") GeomGridEval_OffsetCurve;
		%feature("autodoc", "
Parameters
----------
theOffset: Geom_OffsetCurve

Return
-------
None

Description
-----------
Constructor with geometry. 
Parameter theOffset the offset curve geometry to evaluate.
") GeomGridEval_OffsetCurve;
		 GeomGridEval_OffsetCurve(const opencascade::handle<Geom_OffsetCurve> & theOffset);

		/****** GeomGridEval_OffsetCurve::EvaluateGrid ******/
		/****** md5 signature: f92ee9a0e7514e0ca74fc94b534f9a94 ******/
		%feature("compactdefaultargs") EvaluateGrid;
		%feature("autodoc", "
Parameters
----------
theParams: TColStd_Array1OfReal

Return
-------
NCollection_Array1<gp_Pnt >

Description
-----------
Evaluate all grid points. 
Parameter theParams array of parameter values 
Return: array of evaluated points (1-based indexing), or empty array if geometry is null or no parameters.
") EvaluateGrid;
		NCollection_Array1<gp_Pnt > EvaluateGrid(const TColStd_Array1OfReal & theParams);

		/****** GeomGridEval_OffsetCurve::EvaluateGridD1 ******/
		/****** md5 signature: 56a96d714c4025da05b031d7a4376d88 ******/
		%feature("compactdefaultargs") EvaluateGridD1;
		%feature("autodoc", "
Parameters
----------
theParams: TColStd_Array1OfReal

Return
-------
NCollection_Array1<GeomGridEval::CurveD1 >

Description
-----------
Evaluate all grid points with first derivative. 
Parameter theParams array of parameter values 
Return: array of CurveD1 (1-based indexing), or empty array if geometry is null or no parameters.
") EvaluateGridD1;
		NCollection_Array1<GeomGridEval::CurveD1 > EvaluateGridD1(const TColStd_Array1OfReal & theParams);

		/****** GeomGridEval_OffsetCurve::EvaluateGridD2 ******/
		/****** md5 signature: a2ca4df7dbaf37524e734cb3d28f01a6 ******/
		%feature("compactdefaultargs") EvaluateGridD2;
		%feature("autodoc", "
Parameters
----------
theParams: TColStd_Array1OfReal

Return
-------
NCollection_Array1<GeomGridEval::CurveD2 >

Description
-----------
Evaluate all grid points with first and second derivatives. 
Parameter theParams array of parameter values 
Return: array of CurveD2 (1-based indexing), or empty array if geometry is null or no parameters.
") EvaluateGridD2;
		NCollection_Array1<GeomGridEval::CurveD2 > EvaluateGridD2(const TColStd_Array1OfReal & theParams);

		/****** GeomGridEval_OffsetCurve::EvaluateGridD3 ******/
		/****** md5 signature: b0a1316ee078e14b02f25df019c02eec ******/
		%feature("compactdefaultargs") EvaluateGridD3;
		%feature("autodoc", "
Parameters
----------
theParams: TColStd_Array1OfReal

Return
-------
NCollection_Array1<GeomGridEval::CurveD3 >

Description
-----------
Evaluate all grid points with derivatives up to third order. Uses GeomAdaptor_Curve::D3 for evaluation. 
Parameter theParams array of parameter values 
Return: array of CurveD3 (1-based indexing), or empty array if geometry is null or no parameters.
") EvaluateGridD3;
		NCollection_Array1<GeomGridEval::CurveD3 > EvaluateGridD3(const TColStd_Array1OfReal & theParams);

		/****** GeomGridEval_OffsetCurve::EvaluateGridDN ******/
		/****** md5 signature: 94480de11385d33bdb1f3592abeec9d4 ******/
		%feature("compactdefaultargs") EvaluateGridDN;
		%feature("autodoc", "
Parameters
----------
theParams: TColStd_Array1OfReal
theN: int

Return
-------
NCollection_Array1<gp_Vec >

Description
-----------
Evaluate Nth derivative at all grid points. For orders 1-3, reuses EvaluateGridD1/D2/D3. For orders > 3, uses geometry DN method. 
Parameter theParams array of parameter values 
Parameter theN derivative order (N >= 1) 
Return: array of derivative vectors (1-based indexing).
") EvaluateGridDN;
		NCollection_Array1<gp_Vec > EvaluateGridDN(const TColStd_Array1OfReal & theParams, int theN);

		/****** GeomGridEval_OffsetCurve::Geometry ******/
		/****** md5 signature: cc6f939b8e58f6ce10a574711e635e56 ******/
		%feature("compactdefaultargs") Geometry;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom_OffsetCurve>

Description
-----------
Returns the geometry handle.
") Geometry;
		const opencascade::handle<Geom_OffsetCurve> & Geometry();

};


%extend GeomGridEval_OffsetCurve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************************
* class GeomGridEval_OffsetSurface *
***********************************/
class GeomGridEval_OffsetSurface {
	public:
		/****** GeomGridEval_OffsetSurface::GeomGridEval_OffsetSurface ******/
		/****** md5 signature: eb6aeeaa43c43d74e7873beb1eaa9819 ******/
		%feature("compactdefaultargs") GeomGridEval_OffsetSurface;
		%feature("autodoc", "
Parameters
----------
theOffset: Geom_OffsetSurface

Return
-------
None

Description
-----------
Constructor with geometry. 
Parameter theOffset the offset surface geometry to evaluate.
") GeomGridEval_OffsetSurface;
		 GeomGridEval_OffsetSurface(const opencascade::handle<Geom_OffsetSurface> & theOffset);

		/****** GeomGridEval_OffsetSurface::EvaluateGrid ******/
		/****** md5 signature: 6d2a3b471accd06cd07e1de5ae544aa8 ******/
		%feature("compactdefaultargs") EvaluateGrid;
		%feature("autodoc", "
Parameters
----------
theUParams: TColStd_Array1OfReal
theVParams: TColStd_Array1OfReal

Return
-------
NCollection_Array2<gp_Pnt >

Description
-----------
Evaluate all grid points. 
Input parameter: theUParams array of U parameter values 
Input parameter: theVParams array of V parameter values 
Return: 2D array of evaluated points (1-based indexing), or empty array if geometry is null or no parameters set.
") EvaluateGrid;
		NCollection_Array2<gp_Pnt > EvaluateGrid(const TColStd_Array1OfReal & theUParams, const TColStd_Array1OfReal & theVParams);

		/****** GeomGridEval_OffsetSurface::EvaluateGridD1 ******/
		/****** md5 signature: fadc5d6269d67e8eef910732d08109f4 ******/
		%feature("compactdefaultargs") EvaluateGridD1;
		%feature("autodoc", "
Parameters
----------
theUParams: TColStd_Array1OfReal
theVParams: TColStd_Array1OfReal

Return
-------
NCollection_Array2<GeomGridEval::SurfD1 >

Description
-----------
Evaluate all grid points with first partial derivatives. 
Input parameter: theUParams array of U parameter values 
Input parameter: theVParams array of V parameter values 
Return: 2D array of SurfD1 (1-based indexing), or empty array if geometry is null or no parameters set.
") EvaluateGridD1;
		NCollection_Array2<GeomGridEval::SurfD1 > EvaluateGridD1(const TColStd_Array1OfReal & theUParams, const TColStd_Array1OfReal & theVParams);

		/****** GeomGridEval_OffsetSurface::EvaluateGridD2 ******/
		/****** md5 signature: 43a3b86f1ecc11df7e4d6df5371f7426 ******/
		%feature("compactdefaultargs") EvaluateGridD2;
		%feature("autodoc", "
Parameters
----------
theUParams: TColStd_Array1OfReal
theVParams: TColStd_Array1OfReal

Return
-------
NCollection_Array2<GeomGridEval::SurfD2 >

Description
-----------
Evaluate all grid points with first and second partial derivatives. 
Input parameter: theUParams array of U parameter values 
Input parameter: theVParams array of V parameter values 
Return: 2D array of SurfD2 (1-based indexing), or empty array if geometry is null or no parameters set.
") EvaluateGridD2;
		NCollection_Array2<GeomGridEval::SurfD2 > EvaluateGridD2(const TColStd_Array1OfReal & theUParams, const TColStd_Array1OfReal & theVParams);

		/****** GeomGridEval_OffsetSurface::EvaluateGridD3 ******/
		/****** md5 signature: 3479c5bbc9b8cbc349f17b1e52f99ee4 ******/
		%feature("compactdefaultargs") EvaluateGridD3;
		%feature("autodoc", "
Parameters
----------
theUParams: TColStd_Array1OfReal
theVParams: TColStd_Array1OfReal

Return
-------
NCollection_Array2<GeomGridEval::SurfD3 >

Description
-----------
Evaluate all grid points with derivatives up to third order. Uses GeomAdaptor_Surface::D3 for evaluation. 
Input parameter: theUParams array of U parameter values 
Input parameter: theVParams array of V parameter values 
Return: 2D array of SurfD3 (1-based indexing), or empty array if geometry is null or no parameters set.
") EvaluateGridD3;
		NCollection_Array2<GeomGridEval::SurfD3 > EvaluateGridD3(const TColStd_Array1OfReal & theUParams, const TColStd_Array1OfReal & theVParams);

		/****** GeomGridEval_OffsetSurface::EvaluateGridDN ******/
		/****** md5 signature: d718439a98b8eb6dc8103ade82de4018 ******/
		%feature("compactdefaultargs") EvaluateGridDN;
		%feature("autodoc", "
Parameters
----------
theUParams: TColStd_Array1OfReal
theVParams: TColStd_Array1OfReal
theNU: int
theNV: int

Return
-------
NCollection_Array2<gp_Vec >

Description
-----------
Evaluate partial derivative d^(NU+NV)S/(dU^NU dV^NV) at all grid points. Uses geometry DN method. 
Input parameter: theUParams array of U parameter values 
Input parameter: theVParams array of V parameter values 
Input parameter: theNU derivative order in U direction 
Input parameter: theNV derivative order in V direction 
Return: 2D array of derivative vectors (1-based indexing).
") EvaluateGridDN;
		NCollection_Array2<gp_Vec > EvaluateGridDN(const TColStd_Array1OfReal & theUParams, const TColStd_Array1OfReal & theVParams, int theNU, int theNV);

		/****** GeomGridEval_OffsetSurface::Geometry ******/
		/****** md5 signature: 1334b5e3ab6aa5df8e1fdcd690d6ff9d ******/
		%feature("compactdefaultargs") Geometry;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom_OffsetSurface>

Description
-----------
Returns the geometry handle.
") Geometry;
		const opencascade::handle<Geom_OffsetSurface> & Geometry();

};


%extend GeomGridEval_OffsetSurface {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************
* class GeomGridEval_OtherCurve *
********************************/
class GeomGridEval_OtherCurve {
	public:
		/****** GeomGridEval_OtherCurve::GeomGridEval_OtherCurve ******/
		/****** md5 signature: ec7981fda4c91089b49bb747507e6582 ******/
		%feature("compactdefaultargs") GeomGridEval_OtherCurve;
		%feature("autodoc", "
Parameters
----------
theCurve: Adaptor3d_Curve

Return
-------
None

Description
-----------
Constructor with curve adaptor reference. 
Parameter theCurve reference to curve adaptor (must remain valid).
") GeomGridEval_OtherCurve;
		 GeomGridEval_OtherCurve(const Adaptor3d_Curve & theCurve);

		/****** GeomGridEval_OtherCurve::Curve ******/
		/****** md5 signature: 181ebe9f056efcde889a19930cbfa991 ******/
		%feature("compactdefaultargs") Curve;
		%feature("autodoc", "Return
-------
Adaptor3d_Curve

Description
-----------
Returns the curve adaptor reference.
") Curve;
		Adaptor3d_Curve Curve();

		/****** GeomGridEval_OtherCurve::EvaluateGrid ******/
		/****** md5 signature: f92ee9a0e7514e0ca74fc94b534f9a94 ******/
		%feature("compactdefaultargs") EvaluateGrid;
		%feature("autodoc", "
Parameters
----------
theParams: TColStd_Array1OfReal

Return
-------
NCollection_Array1<gp_Pnt >

Description
-----------
Evaluate all grid points. 
Parameter theParams array of parameter values 
Return: array of evaluated points (1-based indexing), or empty array if no parameters.
") EvaluateGrid;
		NCollection_Array1<gp_Pnt > EvaluateGrid(const TColStd_Array1OfReal & theParams);

		/****** GeomGridEval_OtherCurve::EvaluateGridD1 ******/
		/****** md5 signature: 56a96d714c4025da05b031d7a4376d88 ******/
		%feature("compactdefaultargs") EvaluateGridD1;
		%feature("autodoc", "
Parameters
----------
theParams: TColStd_Array1OfReal

Return
-------
NCollection_Array1<GeomGridEval::CurveD1 >

Description
-----------
Evaluate all grid points with first derivative. 
Parameter theParams array of parameter values 
Return: array of CurveD1 (1-based indexing), or empty array if no parameters.
") EvaluateGridD1;
		NCollection_Array1<GeomGridEval::CurveD1 > EvaluateGridD1(const TColStd_Array1OfReal & theParams);

		/****** GeomGridEval_OtherCurve::EvaluateGridD2 ******/
		/****** md5 signature: a2ca4df7dbaf37524e734cb3d28f01a6 ******/
		%feature("compactdefaultargs") EvaluateGridD2;
		%feature("autodoc", "
Parameters
----------
theParams: TColStd_Array1OfReal

Return
-------
NCollection_Array1<GeomGridEval::CurveD2 >

Description
-----------
Evaluate all grid points with first and second derivatives. 
Parameter theParams array of parameter values 
Return: array of CurveD2 (1-based indexing), or empty array if no parameters.
") EvaluateGridD2;
		NCollection_Array1<GeomGridEval::CurveD2 > EvaluateGridD2(const TColStd_Array1OfReal & theParams);

		/****** GeomGridEval_OtherCurve::EvaluateGridD3 ******/
		/****** md5 signature: b0a1316ee078e14b02f25df019c02eec ******/
		%feature("compactdefaultargs") EvaluateGridD3;
		%feature("autodoc", "
Parameters
----------
theParams: TColStd_Array1OfReal

Return
-------
NCollection_Array1<GeomGridEval::CurveD3 >

Description
-----------
Evaluate all grid points with first, second, and third derivatives. 
Parameter theParams array of parameter values 
Return: array of CurveD3 (1-based indexing), or empty array if no parameters.
") EvaluateGridD3;
		NCollection_Array1<GeomGridEval::CurveD3 > EvaluateGridD3(const TColStd_Array1OfReal & theParams);

		/****** GeomGridEval_OtherCurve::EvaluateGridDN ******/
		/****** md5 signature: 94480de11385d33bdb1f3592abeec9d4 ******/
		%feature("compactdefaultargs") EvaluateGridDN;
		%feature("autodoc", "
Parameters
----------
theParams: TColStd_Array1OfReal
theN: int

Return
-------
NCollection_Array1<gp_Vec >

Description
-----------
Evaluate Nth derivative at all grid points. For orders 1-3, reuses EvaluateGridD1/D2/D3. For orders > 3, uses adaptor DN method. 
Parameter theParams array of parameter values 
Parameter theN derivative order (N >= 1) 
Return: array of derivative vectors (1-based indexing).
") EvaluateGridDN;
		NCollection_Array1<gp_Vec > EvaluateGridDN(const TColStd_Array1OfReal & theParams, int theN);

};


%extend GeomGridEval_OtherCurve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************************
* class GeomGridEval_OtherSurface *
**********************************/
class GeomGridEval_OtherSurface {
	public:
		/****** GeomGridEval_OtherSurface::GeomGridEval_OtherSurface ******/
		/****** md5 signature: df271d9aee076faca6df7b7366b13ef1 ******/
		%feature("compactdefaultargs") GeomGridEval_OtherSurface;
		%feature("autodoc", "
Parameters
----------
theSurface: Adaptor3d_Surface *

Return
-------
None

Description
-----------
Constructor with surface adaptor pointer. 
Parameter theSurface pointer to surface adaptor (must remain valid).
") GeomGridEval_OtherSurface;
		 GeomGridEval_OtherSurface(const Adaptor3d_Surface * theSurface);

		/****** GeomGridEval_OtherSurface::GeomGridEval_OtherSurface ******/
		/****** md5 signature: a148f9756a5672b5624f3a7ada2d995f ******/
		%feature("compactdefaultargs") GeomGridEval_OtherSurface;
		%feature("autodoc", "
Parameters
----------
theSurface: Geom_Surface

Return
-------
None

Description
-----------
Constructor with geometry handle. 
Parameter theSurface handle to Geom_Surface.
") GeomGridEval_OtherSurface;
		 GeomGridEval_OtherSurface(const opencascade::handle<Geom_Surface> & theSurface);

		/****** GeomGridEval_OtherSurface::EvaluateGrid ******/
		/****** md5 signature: 6d2a3b471accd06cd07e1de5ae544aa8 ******/
		%feature("compactdefaultargs") EvaluateGrid;
		%feature("autodoc", "
Parameters
----------
theUParams: TColStd_Array1OfReal
theVParams: TColStd_Array1OfReal

Return
-------
NCollection_Array2<gp_Pnt >

Description
-----------
Evaluate grid points at Cartesian product of U and V parameters. 
Parameter theUParams array of U parameter values 
Parameter theVParams array of V parameter values 
Return: 2D array of evaluated points (1-based indexing).
") EvaluateGrid;
		NCollection_Array2<gp_Pnt > EvaluateGrid(const TColStd_Array1OfReal & theUParams, const TColStd_Array1OfReal & theVParams);

		/****** GeomGridEval_OtherSurface::EvaluateGridD1 ******/
		/****** md5 signature: fadc5d6269d67e8eef910732d08109f4 ******/
		%feature("compactdefaultargs") EvaluateGridD1;
		%feature("autodoc", "
Parameters
----------
theUParams: TColStd_Array1OfReal
theVParams: TColStd_Array1OfReal

Return
-------
NCollection_Array2<GeomGridEval::SurfD1 >

Description
-----------
Evaluate grid points with first partial derivatives. 
Parameter theUParams array of U parameter values 
Parameter theVParams array of V parameter values 
Return: 2D array of SurfD1 (1-based indexing).
") EvaluateGridD1;
		NCollection_Array2<GeomGridEval::SurfD1 > EvaluateGridD1(const TColStd_Array1OfReal & theUParams, const TColStd_Array1OfReal & theVParams);

		/****** GeomGridEval_OtherSurface::EvaluateGridD2 ******/
		/****** md5 signature: 43a3b86f1ecc11df7e4d6df5371f7426 ******/
		%feature("compactdefaultargs") EvaluateGridD2;
		%feature("autodoc", "
Parameters
----------
theUParams: TColStd_Array1OfReal
theVParams: TColStd_Array1OfReal

Return
-------
NCollection_Array2<GeomGridEval::SurfD2 >

Description
-----------
Evaluate grid points with first and second partial derivatives. 
Parameter theUParams array of U parameter values 
Parameter theVParams array of V parameter values 
Return: 2D array of SurfD2 (1-based indexing).
") EvaluateGridD2;
		NCollection_Array2<GeomGridEval::SurfD2 > EvaluateGridD2(const TColStd_Array1OfReal & theUParams, const TColStd_Array1OfReal & theVParams);

		/****** GeomGridEval_OtherSurface::EvaluateGridD3 ******/
		/****** md5 signature: 3479c5bbc9b8cbc349f17b1e52f99ee4 ******/
		%feature("compactdefaultargs") EvaluateGridD3;
		%feature("autodoc", "
Parameters
----------
theUParams: TColStd_Array1OfReal
theVParams: TColStd_Array1OfReal

Return
-------
NCollection_Array2<GeomGridEval::SurfD3 >

Description
-----------
Evaluate grid points with derivatives up to third order. 
Parameter theUParams array of U parameter values 
Parameter theVParams array of V parameter values 
Return: 2D array of SurfD3 (1-based indexing).
") EvaluateGridD3;
		NCollection_Array2<GeomGridEval::SurfD3 > EvaluateGridD3(const TColStd_Array1OfReal & theUParams, const TColStd_Array1OfReal & theVParams);

		/****** GeomGridEval_OtherSurface::EvaluateGridDN ******/
		/****** md5 signature: d718439a98b8eb6dc8103ade82de4018 ******/
		%feature("compactdefaultargs") EvaluateGridDN;
		%feature("autodoc", "
Parameters
----------
theUParams: TColStd_Array1OfReal
theVParams: TColStd_Array1OfReal
theNU: int
theNV: int

Return
-------
NCollection_Array2<gp_Vec >

Description
-----------
Evaluate partial derivative at all grid points. 
Parameter theUParams array of U parameter values 
Parameter theVParams array of V parameter values 
Parameter theNU derivative order in U direction 
Parameter theNV derivative order in V direction 
Return: 2D array of derivative vectors (1-based indexing).
") EvaluateGridDN;
		NCollection_Array2<gp_Vec > EvaluateGridDN(const TColStd_Array1OfReal & theUParams, const TColStd_Array1OfReal & theVParams, int theNU, int theNV);

};


%extend GeomGridEval_OtherSurface {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************
* class GeomGridEval_Parabola *
******************************/
class GeomGridEval_Parabola {
	public:
		/****** GeomGridEval_Parabola::GeomGridEval_Parabola ******/
		/****** md5 signature: f749d3662082ce7922d66530baabefb6 ******/
		%feature("compactdefaultargs") GeomGridEval_Parabola;
		%feature("autodoc", "
Parameters
----------
theParabola: Geom_Parabola

Return
-------
None

Description
-----------
Constructor with geometry. 
Parameter theParabola the parabola geometry to evaluate.
") GeomGridEval_Parabola;
		 GeomGridEval_Parabola(const opencascade::handle<Geom_Parabola> & theParabola);

		/****** GeomGridEval_Parabola::EvaluateGrid ******/
		/****** md5 signature: f92ee9a0e7514e0ca74fc94b534f9a94 ******/
		%feature("compactdefaultargs") EvaluateGrid;
		%feature("autodoc", "
Parameters
----------
theParams: TColStd_Array1OfReal

Return
-------
NCollection_Array1<gp_Pnt >

Description
-----------
Evaluate all grid points. 
Parameter theParams array of parameter values 
Return: array of evaluated points (1-based indexing), or empty array if geometry is null or no parameters.
") EvaluateGrid;
		NCollection_Array1<gp_Pnt > EvaluateGrid(const TColStd_Array1OfReal & theParams);

		/****** GeomGridEval_Parabola::EvaluateGridD1 ******/
		/****** md5 signature: 56a96d714c4025da05b031d7a4376d88 ******/
		%feature("compactdefaultargs") EvaluateGridD1;
		%feature("autodoc", "
Parameters
----------
theParams: TColStd_Array1OfReal

Return
-------
NCollection_Array1<GeomGridEval::CurveD1 >

Description
-----------
Evaluate all grid points with first derivative. 
Parameter theParams array of parameter values 
Return: array of CurveD1 (1-based indexing).
") EvaluateGridD1;
		NCollection_Array1<GeomGridEval::CurveD1 > EvaluateGridD1(const TColStd_Array1OfReal & theParams);

		/****** GeomGridEval_Parabola::EvaluateGridD2 ******/
		/****** md5 signature: a2ca4df7dbaf37524e734cb3d28f01a6 ******/
		%feature("compactdefaultargs") EvaluateGridD2;
		%feature("autodoc", "
Parameters
----------
theParams: TColStd_Array1OfReal

Return
-------
NCollection_Array1<GeomGridEval::CurveD2 >

Description
-----------
Evaluate all grid points with first and second derivatives. 
Parameter theParams array of parameter values 
Return: array of CurveD2 (1-based indexing).
") EvaluateGridD2;
		NCollection_Array1<GeomGridEval::CurveD2 > EvaluateGridD2(const TColStd_Array1OfReal & theParams);

		/****** GeomGridEval_Parabola::EvaluateGridD3 ******/
		/****** md5 signature: b0a1316ee078e14b02f25df019c02eec ******/
		%feature("compactdefaultargs") EvaluateGridD3;
		%feature("autodoc", "
Parameters
----------
theParams: TColStd_Array1OfReal

Return
-------
NCollection_Array1<GeomGridEval::CurveD3 >

Description
-----------
Evaluate all grid points with first, second, and third derivatives. 
Parameter theParams array of parameter values 
Return: array of CurveD3 (1-based indexing).
") EvaluateGridD3;
		NCollection_Array1<GeomGridEval::CurveD3 > EvaluateGridD3(const TColStd_Array1OfReal & theParams);

		/****** GeomGridEval_Parabola::EvaluateGridDN ******/
		/****** md5 signature: 94480de11385d33bdb1f3592abeec9d4 ******/
		%feature("compactdefaultargs") EvaluateGridDN;
		%feature("autodoc", "
Parameters
----------
theParams: TColStd_Array1OfReal
theN: int

Return
-------
NCollection_Array1<gp_Vec >

Description
-----------
Evaluate Nth derivative at all grid points. Parabola: P = Center + (u^2/4F) * X + u * Y D1 = (u/2F) * X + Y (depends on u) D2 = (1/2F) * X (constant) DN = 0 for N >= 3 
Parameter theParams array of parameter values 
Parameter theN derivative order (N >= 1) 
Return: array of derivative vectors (1-based indexing).
") EvaluateGridDN;
		NCollection_Array1<gp_Vec > EvaluateGridDN(const TColStd_Array1OfReal & theParams, int theN);

		/****** GeomGridEval_Parabola::Geometry ******/
		/****** md5 signature: 5a279aa383f70e830ee8b75efb596417 ******/
		%feature("compactdefaultargs") Geometry;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom_Parabola>

Description
-----------
Returns the geometry handle.
") Geometry;
		const opencascade::handle<Geom_Parabola> & Geometry();

};


%extend GeomGridEval_Parabola {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************
* class GeomGridEval_Plane *
***************************/
class GeomGridEval_Plane {
	public:
		/****** GeomGridEval_Plane::GeomGridEval_Plane ******/
		/****** md5 signature: 3ee3c5349e355d5665bf27e3dceead7d ******/
		%feature("compactdefaultargs") GeomGridEval_Plane;
		%feature("autodoc", "
Parameters
----------
thePlane: Geom_Plane

Return
-------
None

Description
-----------
Constructor with geometry. 
Parameter thePlane the plane geometry to evaluate.
") GeomGridEval_Plane;
		 GeomGridEval_Plane(const opencascade::handle<Geom_Plane> & thePlane);

		/****** GeomGridEval_Plane::EvaluateGrid ******/
		/****** md5 signature: 0473dfc5f0bcdf8299dc3ed77bc4eb96 ******/
		%feature("compactdefaultargs") EvaluateGrid;
		%feature("autodoc", "
Parameters
----------
theUParams: TColStd_Array1OfReal
theVParams: TColStd_Array1OfReal

Return
-------
NCollection_Array2<gp_Pnt >

Description
-----------
Evaluate grid points at Cartesian product of U and V parameters. 
Parameter theUParams array of U parameter values 
Parameter theVParams array of V parameter values 
Return: 2D array of evaluated points (1-based indexing).
") EvaluateGrid;
		NCollection_Array2<gp_Pnt > EvaluateGrid(const TColStd_Array1OfReal & theUParams, const TColStd_Array1OfReal & theVParams);

		/****** GeomGridEval_Plane::EvaluateGridD1 ******/
		/****** md5 signature: 3d0c5a2628b3f11f2af8308c81ecdbe5 ******/
		%feature("compactdefaultargs") EvaluateGridD1;
		%feature("autodoc", "
Parameters
----------
theUParams: TColStd_Array1OfReal
theVParams: TColStd_Array1OfReal

Return
-------
NCollection_Array2<GeomGridEval::SurfD1 >

Description
-----------
Evaluate grid points with first partial derivatives. 
Parameter theUParams array of U parameter values 
Parameter theVParams array of V parameter values 
Return: 2D array of SurfD1 (1-based indexing).
") EvaluateGridD1;
		NCollection_Array2<GeomGridEval::SurfD1 > EvaluateGridD1(const TColStd_Array1OfReal & theUParams, const TColStd_Array1OfReal & theVParams);

		/****** GeomGridEval_Plane::EvaluateGridD2 ******/
		/****** md5 signature: 7d9667d3ea1e193d10282995ac490e9d ******/
		%feature("compactdefaultargs") EvaluateGridD2;
		%feature("autodoc", "
Parameters
----------
theUParams: TColStd_Array1OfReal
theVParams: TColStd_Array1OfReal

Return
-------
NCollection_Array2<GeomGridEval::SurfD2 >

Description
-----------
Evaluate grid points with first and second partial derivatives. 
Parameter theUParams array of U parameter values 
Parameter theVParams array of V parameter values 
Return: 2D array of SurfD2 (1-based indexing).
") EvaluateGridD2;
		NCollection_Array2<GeomGridEval::SurfD2 > EvaluateGridD2(const TColStd_Array1OfReal & theUParams, const TColStd_Array1OfReal & theVParams);

		/****** GeomGridEval_Plane::EvaluateGridD3 ******/
		/****** md5 signature: d72dd67fd68bd3451b4dd27132d84bde ******/
		%feature("compactdefaultargs") EvaluateGridD3;
		%feature("autodoc", "
Parameters
----------
theUParams: TColStd_Array1OfReal
theVParams: TColStd_Array1OfReal

Return
-------
NCollection_Array2<GeomGridEval::SurfD3 >

Description
-----------
Evaluate grid points with derivatives up to third order. 
Parameter theUParams array of U parameter values 
Parameter theVParams array of V parameter values 
Return: 2D array of SurfD3 (1-based indexing).
") EvaluateGridD3;
		NCollection_Array2<GeomGridEval::SurfD3 > EvaluateGridD3(const TColStd_Array1OfReal & theUParams, const TColStd_Array1OfReal & theVParams);

		/****** GeomGridEval_Plane::EvaluateGridDN ******/
		/****** md5 signature: 4a7d678264abce04e545b69bb7a3307f ******/
		%feature("compactdefaultargs") EvaluateGridDN;
		%feature("autodoc", "
Parameters
----------
theUParams: TColStd_Array1OfReal
theVParams: TColStd_Array1OfReal
theNU: int
theNV: int

Return
-------
NCollection_Array2<gp_Vec >

Description
-----------
Evaluate partial derivative d^(NU+NV)S/(dU^NU dV^NV) at all grid points. 
Parameter theUParams array of U parameter values 
Parameter theVParams array of V parameter values 
Parameter theNU derivative order in U direction 
Parameter theNV derivative order in V direction 
Return: 2D array of derivative vectors (1-based indexing).
") EvaluateGridDN;
		NCollection_Array2<gp_Vec > EvaluateGridDN(const TColStd_Array1OfReal & theUParams, const TColStd_Array1OfReal & theVParams, int theNU, int theNV);

		/****** GeomGridEval_Plane::Geometry ******/
		/****** md5 signature: 2500e974d65f3a32abeaea0318d77597 ******/
		%feature("compactdefaultargs") Geometry;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom_Plane>

Description
-----------
Returns the geometry handle.
") Geometry;
		const opencascade::handle<Geom_Plane> & Geometry();

};


%extend GeomGridEval_Plane {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************
* class GeomGridEval_Sphere *
****************************/
class GeomGridEval_Sphere {
	public:
		class Data {};
		class UContext {};
		/****** GeomGridEval_Sphere::GeomGridEval_Sphere ******/
		/****** md5 signature: a8d664075026dfb73106e5aa8a8cb5a2 ******/
		%feature("compactdefaultargs") GeomGridEval_Sphere;
		%feature("autodoc", "
Parameters
----------
theSphere: Geom_SphericalSurface

Return
-------
None

Description
-----------
Constructor with geometry. 
Parameter theSphere the spherical surface geometry to evaluate.
") GeomGridEval_Sphere;
		 GeomGridEval_Sphere(const opencascade::handle<Geom_SphericalSurface> & theSphere);

		/****** GeomGridEval_Sphere::EvaluateGrid ******/
		/****** md5 signature: 6d2a3b471accd06cd07e1de5ae544aa8 ******/
		%feature("compactdefaultargs") EvaluateGrid;
		%feature("autodoc", "
Parameters
----------
theUParams: TColStd_Array1OfReal
theVParams: TColStd_Array1OfReal

Return
-------
NCollection_Array2<gp_Pnt >

Description
-----------
Evaluate grid points at Cartesian product of U and V parameters. 
Parameter theUParams array of U parameter values (longitude) 
Parameter theVParams array of V parameter values (latitude) 
Return: 2D array of evaluated points (1-based indexing).
") EvaluateGrid;
		NCollection_Array2<gp_Pnt > EvaluateGrid(const TColStd_Array1OfReal & theUParams, const TColStd_Array1OfReal & theVParams);

		/****** GeomGridEval_Sphere::EvaluateGridD1 ******/
		/****** md5 signature: fadc5d6269d67e8eef910732d08109f4 ******/
		%feature("compactdefaultargs") EvaluateGridD1;
		%feature("autodoc", "
Parameters
----------
theUParams: TColStd_Array1OfReal
theVParams: TColStd_Array1OfReal

Return
-------
NCollection_Array2<GeomGridEval::SurfD1 >

Description
-----------
Evaluate grid points with first partial derivatives. 
Parameter theUParams array of U parameter values (longitude) 
Parameter theVParams array of V parameter values (latitude) 
Return: 2D array of SurfD1 (1-based indexing).
") EvaluateGridD1;
		NCollection_Array2<GeomGridEval::SurfD1 > EvaluateGridD1(const TColStd_Array1OfReal & theUParams, const TColStd_Array1OfReal & theVParams);

		/****** GeomGridEval_Sphere::EvaluateGridD2 ******/
		/****** md5 signature: 43a3b86f1ecc11df7e4d6df5371f7426 ******/
		%feature("compactdefaultargs") EvaluateGridD2;
		%feature("autodoc", "
Parameters
----------
theUParams: TColStd_Array1OfReal
theVParams: TColStd_Array1OfReal

Return
-------
NCollection_Array2<GeomGridEval::SurfD2 >

Description
-----------
Evaluate grid points with first and second partial derivatives. 
Parameter theUParams array of U parameter values (longitude) 
Parameter theVParams array of V parameter values (latitude) 
Return: 2D array of SurfD2 (1-based indexing).
") EvaluateGridD2;
		NCollection_Array2<GeomGridEval::SurfD2 > EvaluateGridD2(const TColStd_Array1OfReal & theUParams, const TColStd_Array1OfReal & theVParams);

		/****** GeomGridEval_Sphere::EvaluateGridD3 ******/
		/****** md5 signature: 3479c5bbc9b8cbc349f17b1e52f99ee4 ******/
		%feature("compactdefaultargs") EvaluateGridD3;
		%feature("autodoc", "
Parameters
----------
theUParams: TColStd_Array1OfReal
theVParams: TColStd_Array1OfReal

Return
-------
NCollection_Array2<GeomGridEval::SurfD3 >

Description
-----------
Evaluate grid points with derivatives up to third order. 
Parameter theUParams array of U parameter values (longitude) 
Parameter theVParams array of V parameter values (latitude) 
Return: 2D array of SurfD3 (1-based indexing).
") EvaluateGridD3;
		NCollection_Array2<GeomGridEval::SurfD3 > EvaluateGridD3(const TColStd_Array1OfReal & theUParams, const TColStd_Array1OfReal & theVParams);

		/****** GeomGridEval_Sphere::EvaluateGridDN ******/
		/****** md5 signature: d718439a98b8eb6dc8103ade82de4018 ******/
		%feature("compactdefaultargs") EvaluateGridDN;
		%feature("autodoc", "
Parameters
----------
theUParams: TColStd_Array1OfReal
theVParams: TColStd_Array1OfReal
theNU: int
theNV: int

Return
-------
NCollection_Array2<gp_Vec >

Description
-----------
Evaluate partial derivative d^(NU+NV)S/(dU^NU dV^NV) at all grid points. For orders 1-3, reuses EvaluateGridD1/D2/D3. For orders > 3, uses geometry DN method. 
Parameter theUParams array of U parameter values (longitude) 
Parameter theVParams array of V parameter values (latitude) 
Parameter theNU derivative order in U direction 
Parameter theNV derivative order in V direction 
Return: 2D array of derivative vectors (1-based indexing).
") EvaluateGridDN;
		NCollection_Array2<gp_Vec > EvaluateGridDN(const TColStd_Array1OfReal & theUParams, const TColStd_Array1OfReal & theVParams, int theNU, int theNV);

		/****** GeomGridEval_Sphere::Geometry ******/
		/****** md5 signature: 9675f1509757af4fb44ef9414ec57a1d ******/
		%feature("compactdefaultargs") Geometry;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom_SphericalSurface>

Description
-----------
Returns the geometry handle.
") Geometry;
		const opencascade::handle<Geom_SphericalSurface> & Geometry();

};


%extend GeomGridEval_Sphere {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************
* class GeomGridEval_Surface *
*****************************/
class GeomGridEval_Surface {
	public:
		/****** GeomGridEval_Surface::GeomGridEval_Surface ******/
		/****** md5 signature: 096eba5805d51e419a77ee79266d9f49 ******/
		%feature("compactdefaultargs") GeomGridEval_Surface;
		%feature("autodoc", "
Parameters
----------
theSurface: Adaptor3d_Surface

Return
-------
None

Description
-----------
Construct from adaptor reference (auto-detects surface type). For GeomAdaptor_Surface, extracts underlying Geom_Surface for optimized evaluation. For other adaptors, stores reference for fallback evaluation. @note The surface adaptor reference must remain valid during the lifetime of this evaluator when using fallback evaluation. 
Input parameter: theSurface surface adaptor reference to evaluate.
") GeomGridEval_Surface;
		 GeomGridEval_Surface(const Adaptor3d_Surface & theSurface);

		/****** GeomGridEval_Surface::GeomGridEval_Surface ******/
		/****** md5 signature: 7c4c4bfd6b261eab5fddd94e2b3a3f4b ******/
		%feature("compactdefaultargs") GeomGridEval_Surface;
		%feature("autodoc", "
Parameters
----------
theSurface: Geom_Surface

Return
-------
None

Description
-----------
Construct from geometry handle (auto-detects surface type). 
Input parameter: theSurface geometry to evaluate.
") GeomGridEval_Surface;
		 GeomGridEval_Surface(const opencascade::handle<Geom_Surface> & theSurface);

		/****** GeomGridEval_Surface::EvaluateGrid ******/
		/****** md5 signature: 6d2a3b471accd06cd07e1de5ae544aa8 ******/
		%feature("compactdefaultargs") EvaluateGrid;
		%feature("autodoc", "
Parameters
----------
theUParams: TColStd_Array1OfReal
theVParams: TColStd_Array1OfReal

Return
-------
NCollection_Array2<gp_Pnt >

Description
-----------
Evaluate grid points at all specified parameters. 
Input parameter: theUParams array of U parameter values 
Input parameter: theVParams array of V parameter values 
Return: 2D array of 3D points (1-based indexing).
") EvaluateGrid;
		NCollection_Array2<gp_Pnt > EvaluateGrid(const TColStd_Array1OfReal & theUParams, const TColStd_Array1OfReal & theVParams);

		/****** GeomGridEval_Surface::EvaluateGridD1 ******/
		/****** md5 signature: fadc5d6269d67e8eef910732d08109f4 ******/
		%feature("compactdefaultargs") EvaluateGridD1;
		%feature("autodoc", "
Parameters
----------
theUParams: TColStd_Array1OfReal
theVParams: TColStd_Array1OfReal

Return
-------
NCollection_Array2<GeomGridEval::SurfD1 >

Description
-----------
Evaluate grid points with first partial derivatives. 
Input parameter: theUParams array of U parameter values 
Input parameter: theVParams array of V parameter values 
Return: 2D array of SurfD1 (1-based indexing).
") EvaluateGridD1;
		NCollection_Array2<GeomGridEval::SurfD1 > EvaluateGridD1(const TColStd_Array1OfReal & theUParams, const TColStd_Array1OfReal & theVParams);

		/****** GeomGridEval_Surface::EvaluateGridD2 ******/
		/****** md5 signature: 43a3b86f1ecc11df7e4d6df5371f7426 ******/
		%feature("compactdefaultargs") EvaluateGridD2;
		%feature("autodoc", "
Parameters
----------
theUParams: TColStd_Array1OfReal
theVParams: TColStd_Array1OfReal

Return
-------
NCollection_Array2<GeomGridEval::SurfD2 >

Description
-----------
Evaluate grid points with first and second partial derivatives. 
Input parameter: theUParams array of U parameter values 
Input parameter: theVParams array of V parameter values 
Return: 2D array of SurfD2 (1-based indexing).
") EvaluateGridD2;
		NCollection_Array2<GeomGridEval::SurfD2 > EvaluateGridD2(const TColStd_Array1OfReal & theUParams, const TColStd_Array1OfReal & theVParams);

		/****** GeomGridEval_Surface::EvaluateGridD3 ******/
		/****** md5 signature: 3479c5bbc9b8cbc349f17b1e52f99ee4 ******/
		%feature("compactdefaultargs") EvaluateGridD3;
		%feature("autodoc", "
Parameters
----------
theUParams: TColStd_Array1OfReal
theVParams: TColStd_Array1OfReal

Return
-------
NCollection_Array2<GeomGridEval::SurfD3 >

Description
-----------
Evaluate grid points with derivatives up to third order. 
Input parameter: theUParams array of U parameter values 
Input parameter: theVParams array of V parameter values 
Return: 2D array of SurfD3 (1-based indexing).
") EvaluateGridD3;
		NCollection_Array2<GeomGridEval::SurfD3 > EvaluateGridD3(const TColStd_Array1OfReal & theUParams, const TColStd_Array1OfReal & theVParams);

		/****** GeomGridEval_Surface::EvaluateGridDN ******/
		/****** md5 signature: d718439a98b8eb6dc8103ade82de4018 ******/
		%feature("compactdefaultargs") EvaluateGridDN;
		%feature("autodoc", "
Parameters
----------
theUParams: TColStd_Array1OfReal
theVParams: TColStd_Array1OfReal
theNU: int
theNV: int

Return
-------
NCollection_Array2<gp_Vec >

Description
-----------
Evaluate partial derivative d^(NU+NV)S/(dU^NU dV^NV) at all grid points. 
Input parameter: theUParams array of U parameter values 
Input parameter: theVParams array of V parameter values 
Input parameter: theNU derivative order in U direction 
Input parameter: theNV derivative order in V direction 
Return: 2D array of derivative vectors (1-based indexing).
") EvaluateGridDN;
		NCollection_Array2<gp_Vec > EvaluateGridDN(const TColStd_Array1OfReal & theUParams, const TColStd_Array1OfReal & theVParams, int theNU, int theNV);

		/****** GeomGridEval_Surface::GetTransformation ******/
		/****** md5 signature: 687ff1ded16db0c49908d1708be78078 ******/
		%feature("compactdefaultargs") GetTransformation;
		%feature("autodoc", "Return
-------
std::optional<gp_Trsf>

Description
-----------
Returns the transformation (empty if not set).
") GetTransformation;
		const std::optional<gp_Trsf> GetTransformation();

		/****** GeomGridEval_Surface::GetType ******/
		/****** md5 signature: 15a6641661caf3717f91dedbeb64f9be ******/
		%feature("compactdefaultargs") GetType;
		%feature("autodoc", "Return
-------
GeomAbs_SurfaceType

Description
-----------
Returns the detected surface type.
") GetType;
		GeomAbs_SurfaceType GetType();

		/****** GeomGridEval_Surface::HasTransformation ******/
		/****** md5 signature: b8328431b78409c944beaf886dc9a10e ******/
		%feature("compactdefaultargs") HasTransformation;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if a transformation is applied.
") HasTransformation;
		bool HasTransformation();

};


%extend GeomGridEval_Surface {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************************
* class GeomGridEval_SurfaceOfExtrusion *
****************************************/
class GeomGridEval_SurfaceOfExtrusion {
	public:
		/****** GeomGridEval_SurfaceOfExtrusion::GeomGridEval_SurfaceOfExtrusion ******/
		/****** md5 signature: b417e7f428b100860ded4d8ae2cf163e ******/
		%feature("compactdefaultargs") GeomGridEval_SurfaceOfExtrusion;
		%feature("autodoc", "
Parameters
----------
theExtrusion: Geom_SurfaceOfLinearExtrusion

Return
-------
None

Description
-----------
Constructor with geometry. 
Parameter theExtrusion the extrusion surface geometry to evaluate.
") GeomGridEval_SurfaceOfExtrusion;
		 GeomGridEval_SurfaceOfExtrusion(const opencascade::handle<Geom_SurfaceOfLinearExtrusion> & theExtrusion);

		/****** GeomGridEval_SurfaceOfExtrusion::EvaluateGrid ******/
		/****** md5 signature: 6d2a3b471accd06cd07e1de5ae544aa8 ******/
		%feature("compactdefaultargs") EvaluateGrid;
		%feature("autodoc", "
Parameters
----------
theUParams: TColStd_Array1OfReal
theVParams: TColStd_Array1OfReal

Return
-------
NCollection_Array2<gp_Pnt >

Description
-----------
Evaluate all grid points. 
Input parameter: theUParams array of U parameter values (curve parameter) 
Input parameter: theVParams array of V parameter values (extrusion distance) 
Return: 2D array of evaluated points (1-based indexing), or empty array if geometry is null or no parameters set.
") EvaluateGrid;
		NCollection_Array2<gp_Pnt > EvaluateGrid(const TColStd_Array1OfReal & theUParams, const TColStd_Array1OfReal & theVParams);

		/****** GeomGridEval_SurfaceOfExtrusion::EvaluateGridD1 ******/
		/****** md5 signature: fadc5d6269d67e8eef910732d08109f4 ******/
		%feature("compactdefaultargs") EvaluateGridD1;
		%feature("autodoc", "
Parameters
----------
theUParams: TColStd_Array1OfReal
theVParams: TColStd_Array1OfReal

Return
-------
NCollection_Array2<GeomGridEval::SurfD1 >

Description
-----------
Evaluate all grid points with first partial derivatives. 
Input parameter: theUParams array of U parameter values (curve parameter) 
Input parameter: theVParams array of V parameter values (extrusion distance) 
Return: 2D array of SurfD1 (1-based indexing), or empty array if geometry is null or no parameters set.
") EvaluateGridD1;
		NCollection_Array2<GeomGridEval::SurfD1 > EvaluateGridD1(const TColStd_Array1OfReal & theUParams, const TColStd_Array1OfReal & theVParams);

		/****** GeomGridEval_SurfaceOfExtrusion::EvaluateGridD2 ******/
		/****** md5 signature: 43a3b86f1ecc11df7e4d6df5371f7426 ******/
		%feature("compactdefaultargs") EvaluateGridD2;
		%feature("autodoc", "
Parameters
----------
theUParams: TColStd_Array1OfReal
theVParams: TColStd_Array1OfReal

Return
-------
NCollection_Array2<GeomGridEval::SurfD2 >

Description
-----------
Evaluate all grid points with first and second partial derivatives. 
Input parameter: theUParams array of U parameter values (curve parameter) 
Input parameter: theVParams array of V parameter values (extrusion distance) 
Return: 2D array of SurfD2 (1-based indexing), or empty array if geometry is null or no parameters set.
") EvaluateGridD2;
		NCollection_Array2<GeomGridEval::SurfD2 > EvaluateGridD2(const TColStd_Array1OfReal & theUParams, const TColStd_Array1OfReal & theVParams);

		/****** GeomGridEval_SurfaceOfExtrusion::EvaluateGridD3 ******/
		/****** md5 signature: 3479c5bbc9b8cbc349f17b1e52f99ee4 ******/
		%feature("compactdefaultargs") EvaluateGridD3;
		%feature("autodoc", "
Parameters
----------
theUParams: TColStd_Array1OfReal
theVParams: TColStd_Array1OfReal

Return
-------
NCollection_Array2<GeomGridEval::SurfD3 >

Description
-----------
Evaluate all grid points with derivatives up to third order. 
Input parameter: theUParams array of U parameter values (curve parameter) 
Input parameter: theVParams array of V parameter values (extrusion distance) 
Return: 2D array of SurfD3 (1-based indexing), or empty array if geometry is null or no parameters set.
") EvaluateGridD3;
		NCollection_Array2<GeomGridEval::SurfD3 > EvaluateGridD3(const TColStd_Array1OfReal & theUParams, const TColStd_Array1OfReal & theVParams);

		/****** GeomGridEval_SurfaceOfExtrusion::EvaluateGridDN ******/
		/****** md5 signature: d718439a98b8eb6dc8103ade82de4018 ******/
		%feature("compactdefaultargs") EvaluateGridDN;
		%feature("autodoc", "
Parameters
----------
theUParams: TColStd_Array1OfReal
theVParams: TColStd_Array1OfReal
theNU: int
theNV: int

Return
-------
NCollection_Array2<gp_Vec >

Description
-----------
Evaluate partial derivative d^(NU+NV)S/(dU^NU dV^NV) at all grid points. 
Input parameter: theUParams array of U parameter values (curve parameter) 
Input parameter: theVParams array of V parameter values (extrusion distance) 
Input parameter: theNU derivative order in U direction 
Input parameter: theNV derivative order in V direction 
Return: 2D array of derivative vectors (1-based indexing).
") EvaluateGridDN;
		NCollection_Array2<gp_Vec > EvaluateGridDN(const TColStd_Array1OfReal & theUParams, const TColStd_Array1OfReal & theVParams, int theNU, int theNV);

		/****** GeomGridEval_SurfaceOfExtrusion::Geometry ******/
		/****** md5 signature: e9331b9d466af834b541e8248d07e64d ******/
		%feature("compactdefaultargs") Geometry;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom_SurfaceOfLinearExtrusion>

Description
-----------
Returns the geometry handle.
") Geometry;
		const opencascade::handle<Geom_SurfaceOfLinearExtrusion> & Geometry();

};


%extend GeomGridEval_SurfaceOfExtrusion {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************************
* class GeomGridEval_SurfaceOfRevolution *
*****************************************/
class GeomGridEval_SurfaceOfRevolution {
	public:
		/****** GeomGridEval_SurfaceOfRevolution::GeomGridEval_SurfaceOfRevolution ******/
		/****** md5 signature: 647a63789791d73a1120eac70eb481c8 ******/
		%feature("compactdefaultargs") GeomGridEval_SurfaceOfRevolution;
		%feature("autodoc", "
Parameters
----------
theRevolution: Geom_SurfaceOfRevolution

Return
-------
None

Description
-----------
Constructor with geometry. 
Parameter theRevolution the revolution surface geometry to evaluate.
") GeomGridEval_SurfaceOfRevolution;
		 GeomGridEval_SurfaceOfRevolution(const opencascade::handle<Geom_SurfaceOfRevolution> & theRevolution);

		/****** GeomGridEval_SurfaceOfRevolution::EvaluateGrid ******/
		/****** md5 signature: 6d2a3b471accd06cd07e1de5ae544aa8 ******/
		%feature("compactdefaultargs") EvaluateGrid;
		%feature("autodoc", "
Parameters
----------
theUParams: TColStd_Array1OfReal
theVParams: TColStd_Array1OfReal

Return
-------
NCollection_Array2<gp_Pnt >

Description
-----------
Evaluate all grid points. 
Input parameter: theUParams array of U parameter values (rotation angle) 
Input parameter: theVParams array of V parameter values (curve parameter) 
Return: 2D array of evaluated points (1-based indexing), or empty array if geometry is null or no parameters set.
") EvaluateGrid;
		NCollection_Array2<gp_Pnt > EvaluateGrid(const TColStd_Array1OfReal & theUParams, const TColStd_Array1OfReal & theVParams);

		/****** GeomGridEval_SurfaceOfRevolution::EvaluateGridD1 ******/
		/****** md5 signature: fadc5d6269d67e8eef910732d08109f4 ******/
		%feature("compactdefaultargs") EvaluateGridD1;
		%feature("autodoc", "
Parameters
----------
theUParams: TColStd_Array1OfReal
theVParams: TColStd_Array1OfReal

Return
-------
NCollection_Array2<GeomGridEval::SurfD1 >

Description
-----------
Evaluate all grid points with first partial derivatives. 
Input parameter: theUParams array of U parameter values (rotation angle) 
Input parameter: theVParams array of V parameter values (curve parameter) 
Return: 2D array of SurfD1 (1-based indexing), or empty array if geometry is null or no parameters set.
") EvaluateGridD1;
		NCollection_Array2<GeomGridEval::SurfD1 > EvaluateGridD1(const TColStd_Array1OfReal & theUParams, const TColStd_Array1OfReal & theVParams);

		/****** GeomGridEval_SurfaceOfRevolution::EvaluateGridD2 ******/
		/****** md5 signature: 43a3b86f1ecc11df7e4d6df5371f7426 ******/
		%feature("compactdefaultargs") EvaluateGridD2;
		%feature("autodoc", "
Parameters
----------
theUParams: TColStd_Array1OfReal
theVParams: TColStd_Array1OfReal

Return
-------
NCollection_Array2<GeomGridEval::SurfD2 >

Description
-----------
Evaluate all grid points with first and second partial derivatives. 
Input parameter: theUParams array of U parameter values (rotation angle) 
Input parameter: theVParams array of V parameter values (curve parameter) 
Return: 2D array of SurfD2 (1-based indexing), or empty array if geometry is null or no parameters set.
") EvaluateGridD2;
		NCollection_Array2<GeomGridEval::SurfD2 > EvaluateGridD2(const TColStd_Array1OfReal & theUParams, const TColStd_Array1OfReal & theVParams);

		/****** GeomGridEval_SurfaceOfRevolution::EvaluateGridD3 ******/
		/****** md5 signature: 3479c5bbc9b8cbc349f17b1e52f99ee4 ******/
		%feature("compactdefaultargs") EvaluateGridD3;
		%feature("autodoc", "
Parameters
----------
theUParams: TColStd_Array1OfReal
theVParams: TColStd_Array1OfReal

Return
-------
NCollection_Array2<GeomGridEval::SurfD3 >

Description
-----------
Evaluate all grid points with derivatives up to third order. 
Input parameter: theUParams array of U parameter values (rotation angle) 
Input parameter: theVParams array of V parameter values (curve parameter) 
Return: 2D array of SurfD3 (1-based indexing), or empty array if geometry is null or no parameters set.
") EvaluateGridD3;
		NCollection_Array2<GeomGridEval::SurfD3 > EvaluateGridD3(const TColStd_Array1OfReal & theUParams, const TColStd_Array1OfReal & theVParams);

		/****** GeomGridEval_SurfaceOfRevolution::EvaluateGridDN ******/
		/****** md5 signature: d718439a98b8eb6dc8103ade82de4018 ******/
		%feature("compactdefaultargs") EvaluateGridDN;
		%feature("autodoc", "
Parameters
----------
theUParams: TColStd_Array1OfReal
theVParams: TColStd_Array1OfReal
theNU: int
theNV: int

Return
-------
NCollection_Array2<gp_Vec >

Description
-----------
Evaluate partial derivative d^(NU+NV)S/(dU^NU dV^NV) at all grid points. 
Input parameter: theUParams array of U parameter values (rotation angle) 
Input parameter: theVParams array of V parameter values (curve parameter) 
Input parameter: theNU derivative order in U direction 
Input parameter: theNV derivative order in V direction 
Return: 2D array of derivative vectors (1-based indexing).
") EvaluateGridDN;
		NCollection_Array2<gp_Vec > EvaluateGridDN(const TColStd_Array1OfReal & theUParams, const TColStd_Array1OfReal & theVParams, int theNU, int theNV);

		/****** GeomGridEval_SurfaceOfRevolution::Geometry ******/
		/****** md5 signature: a08036bdce0016901e67ed8a54105fd6 ******/
		%feature("compactdefaultargs") Geometry;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom_SurfaceOfRevolution>

Description
-----------
Returns the geometry handle.
") Geometry;
		const opencascade::handle<Geom_SurfaceOfRevolution> & Geometry();

};


%extend GeomGridEval_SurfaceOfRevolution {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************
* class GeomGridEval_Torus *
***************************/
class GeomGridEval_Torus {
	public:
		class Data {};
		class UContext {};
		/****** GeomGridEval_Torus::GeomGridEval_Torus ******/
		/****** md5 signature: 15c4b7f82109834f2276ecec4d109169 ******/
		%feature("compactdefaultargs") GeomGridEval_Torus;
		%feature("autodoc", "
Parameters
----------
theTorus: Geom_ToroidalSurface

Return
-------
None

Description
-----------
Constructor with geometry. 
Parameter theTorus the toroidal surface geometry to evaluate.
") GeomGridEval_Torus;
		 GeomGridEval_Torus(const opencascade::handle<Geom_ToroidalSurface> & theTorus);

		/****** GeomGridEval_Torus::EvaluateGrid ******/
		/****** md5 signature: 6d2a3b471accd06cd07e1de5ae544aa8 ******/
		%feature("compactdefaultargs") EvaluateGrid;
		%feature("autodoc", "
Parameters
----------
theUParams: TColStd_Array1OfReal
theVParams: TColStd_Array1OfReal

Return
-------
NCollection_Array2<gp_Pnt >

Description
-----------
Evaluate grid points at Cartesian product of U and V parameters. 
Parameter theUParams array of U parameter values (major angle) 
Parameter theVParams array of V parameter values (minor angle) 
Return: 2D array of evaluated points (1-based indexing).
") EvaluateGrid;
		NCollection_Array2<gp_Pnt > EvaluateGrid(const TColStd_Array1OfReal & theUParams, const TColStd_Array1OfReal & theVParams);

		/****** GeomGridEval_Torus::EvaluateGridD1 ******/
		/****** md5 signature: fadc5d6269d67e8eef910732d08109f4 ******/
		%feature("compactdefaultargs") EvaluateGridD1;
		%feature("autodoc", "
Parameters
----------
theUParams: TColStd_Array1OfReal
theVParams: TColStd_Array1OfReal

Return
-------
NCollection_Array2<GeomGridEval::SurfD1 >

Description
-----------
Evaluate grid points with first partial derivatives. 
Parameter theUParams array of U parameter values (major angle) 
Parameter theVParams array of V parameter values (minor angle) 
Return: 2D array of SurfD1 (1-based indexing).
") EvaluateGridD1;
		NCollection_Array2<GeomGridEval::SurfD1 > EvaluateGridD1(const TColStd_Array1OfReal & theUParams, const TColStd_Array1OfReal & theVParams);

		/****** GeomGridEval_Torus::EvaluateGridD2 ******/
		/****** md5 signature: 43a3b86f1ecc11df7e4d6df5371f7426 ******/
		%feature("compactdefaultargs") EvaluateGridD2;
		%feature("autodoc", "
Parameters
----------
theUParams: TColStd_Array1OfReal
theVParams: TColStd_Array1OfReal

Return
-------
NCollection_Array2<GeomGridEval::SurfD2 >

Description
-----------
Evaluate grid points with first and second partial derivatives. 
Parameter theUParams array of U parameter values (major angle) 
Parameter theVParams array of V parameter values (minor angle) 
Return: 2D array of SurfD2 (1-based indexing).
") EvaluateGridD2;
		NCollection_Array2<GeomGridEval::SurfD2 > EvaluateGridD2(const TColStd_Array1OfReal & theUParams, const TColStd_Array1OfReal & theVParams);

		/****** GeomGridEval_Torus::EvaluateGridD3 ******/
		/****** md5 signature: 3479c5bbc9b8cbc349f17b1e52f99ee4 ******/
		%feature("compactdefaultargs") EvaluateGridD3;
		%feature("autodoc", "
Parameters
----------
theUParams: TColStd_Array1OfReal
theVParams: TColStd_Array1OfReal

Return
-------
NCollection_Array2<GeomGridEval::SurfD3 >

Description
-----------
Evaluate grid points with derivatives up to third order. 
Parameter theUParams array of U parameter values (major angle) 
Parameter theVParams array of V parameter values (minor angle) 
Return: 2D array of SurfD3 (1-based indexing).
") EvaluateGridD3;
		NCollection_Array2<GeomGridEval::SurfD3 > EvaluateGridD3(const TColStd_Array1OfReal & theUParams, const TColStd_Array1OfReal & theVParams);

		/****** GeomGridEval_Torus::EvaluateGridDN ******/
		/****** md5 signature: d718439a98b8eb6dc8103ade82de4018 ******/
		%feature("compactdefaultargs") EvaluateGridDN;
		%feature("autodoc", "
Parameters
----------
theUParams: TColStd_Array1OfReal
theVParams: TColStd_Array1OfReal
theNU: int
theNV: int

Return
-------
NCollection_Array2<gp_Vec >

Description
-----------
Evaluate partial derivative d^(NU+NV)S/(dU^NU dV^NV) at all grid points. For orders 1-3, reuses EvaluateGridD1/D2/D3. For orders > 3, uses geometry DN method. 
Parameter theUParams array of U parameter values (major angle) 
Parameter theVParams array of V parameter values (minor angle) 
Parameter theNU derivative order in U direction 
Parameter theNV derivative order in V direction 
Return: 2D array of derivative vectors (1-based indexing).
") EvaluateGridDN;
		NCollection_Array2<gp_Vec > EvaluateGridDN(const TColStd_Array1OfReal & theUParams, const TColStd_Array1OfReal & theVParams, int theNU, int theNV);

		/****** GeomGridEval_Torus::Geometry ******/
		/****** md5 signature: 47e80b2312a9f1c9162e150a06fccdf2 ******/
		%feature("compactdefaultargs") Geometry;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom_ToroidalSurface>

Description
-----------
Returns the geometry handle.
") Geometry;
		const opencascade::handle<Geom_ToroidalSurface> & Geometry();

};


%extend GeomGridEval_Torus {
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
