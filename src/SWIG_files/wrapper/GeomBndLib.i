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
%define GEOMBNDLIBDOCSTRING
"GeomBndLib module, see official documentation at
https://dev.opencascade.org/doc/occt-7.9.0/refman/html/package_geombndlib.html"
%enddef
%module (package="OCC.Core", docstring=GEOMBNDLIBDOCSTRING) GeomBndLib


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
#include<GeomBndLib_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<Geom_module.hxx>
#include<Bnd_module.hxx>
#include<Geom2d_module.hxx>
#include<gp_module.hxx>
#include<Adaptor3d_module.hxx>
#include<GeomAbs_module.hxx>
#include<Adaptor2d_module.hxx>
#include<Message_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import Geom.i
%import Bnd.i
%import Geom2d.i
%import gp.i
%import Adaptor3d.i
%import GeomAbs.i
%import Adaptor2d.i

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

/********************************
* class GeomBndLib_BSplineCurve *
********************************/
class GeomBndLib_BSplineCurve {
	public:
		/****** GeomBndLib_BSplineCurve::GeomBndLib_BSplineCurve ******/
		/****** md5 signature: bdbe9b9009399885084c444e4bee1e02 ******/
		%feature("compactdefaultargs") GeomBndLib_BSplineCurve;
		%feature("autodoc", "
Parameters
----------
theCurve: Geom_BSplineCurve

Return
-------
None

Description
-----------
No available documentation.
") GeomBndLib_BSplineCurve;
		 GeomBndLib_BSplineCurve(const opencascade::handle<Geom_BSplineCurve> & theCurve);

		/****** GeomBndLib_BSplineCurve::Box ******/
		/****** md5 signature: 8e213c1812e4ec1a92dc64878f404c36 ******/
		%feature("compactdefaultargs") Box;
		%feature("autodoc", "
Parameters
----------
theTol: double

Return
-------
Bnd_Box

Description
-----------
Compute bounding box for full curve.
") Box;
		Bnd_Box Box(double theTol);

		/****** GeomBndLib_BSplineCurve::Box ******/
		/****** md5 signature: 385b16a150a20485f3d84b859d3fd18f ******/
		%feature("compactdefaultargs") Box;
		%feature("autodoc", "
Parameters
----------
theU1: double
theU2: double
theTol: double

Return
-------
Bnd_Box

Description
-----------
Compute bounding box for arc [theU1, theU2].
") Box;
		Bnd_Box Box(double theU1, double theU2, double theTol);

		/****** GeomBndLib_BSplineCurve::BoxOptimal ******/
		/****** md5 signature: e14175b3e4a4a9509a9971714e46a83c ******/
		%feature("compactdefaultargs") BoxOptimal;
		%feature("autodoc", "
Parameters
----------
theU1: double
theU2: double
theTol: double

Return
-------
Bnd_Box

Description
-----------
Compute precise bounding box using numerical optimization.
") BoxOptimal;
		Bnd_Box BoxOptimal(double theU1, double theU2, double theTol);

		/****** GeomBndLib_BSplineCurve::Geometry ******/
		/****** md5 signature: 438a2ab9c7d0a5f548ad3b663f581c74 ******/
		%feature("compactdefaultargs") Geometry;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom_BSplineCurve>

Description
-----------
No available documentation.
") Geometry;
		const opencascade::handle<Geom_BSplineCurve> & Geometry();

};


%extend GeomBndLib_BSplineCurve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************************
* class GeomBndLib_BSplineCurve2d *
**********************************/
class GeomBndLib_BSplineCurve2d {
	public:
		/****** GeomBndLib_BSplineCurve2d::GeomBndLib_BSplineCurve2d ******/
		/****** md5 signature: ac8ac98f688b848b1bbd42bda0bfacb8 ******/
		%feature("compactdefaultargs") GeomBndLib_BSplineCurve2d;
		%feature("autodoc", "
Parameters
----------
theCurve: Geom2d_BSplineCurve

Return
-------
None

Description
-----------
No available documentation.
") GeomBndLib_BSplineCurve2d;
		 GeomBndLib_BSplineCurve2d(const opencascade::handle<Geom2d_BSplineCurve> & theCurve);

		/****** GeomBndLib_BSplineCurve2d::Box ******/
		/****** md5 signature: 67777045e862a77e4ef0f0274513a286 ******/
		%feature("compactdefaultargs") Box;
		%feature("autodoc", "
Parameters
----------
theTol: double

Return
-------
Bnd_Box2d

Description
-----------
Compute bounding box for full curve.
") Box;
		Bnd_Box2d Box(double theTol);

		/****** GeomBndLib_BSplineCurve2d::Box ******/
		/****** md5 signature: 6e7a33d7e518329e6c7cef888fb57857 ******/
		%feature("compactdefaultargs") Box;
		%feature("autodoc", "
Parameters
----------
theU1: double
theU2: double
theTol: double

Return
-------
Bnd_Box2d

Description
-----------
Compute bounding box for arc [theU1, theU2].
") Box;
		Bnd_Box2d Box(double theU1, double theU2, double theTol);

		/****** GeomBndLib_BSplineCurve2d::BoxOptimal ******/
		/****** md5 signature: 2e8c0bcd75a33e35d701f16785b70909 ******/
		%feature("compactdefaultargs") BoxOptimal;
		%feature("autodoc", "
Parameters
----------
theU1: double
theU2: double
theTol: double

Return
-------
Bnd_Box2d

Description
-----------
Compute precise bounding box using numerical optimization.
") BoxOptimal;
		Bnd_Box2d BoxOptimal(double theU1, double theU2, double theTol);

		/****** GeomBndLib_BSplineCurve2d::Geometry ******/
		/****** md5 signature: 90de0bb87d4fea894217a4fc44634b46 ******/
		%feature("compactdefaultargs") Geometry;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom2d_BSplineCurve>

Description
-----------
No available documentation.
") Geometry;
		const opencascade::handle<Geom2d_BSplineCurve> & Geometry();

};


%extend GeomBndLib_BSplineCurve2d {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************************
* class GeomBndLib_BSplineSurface *
**********************************/
class GeomBndLib_BSplineSurface {
	public:
		/****** GeomBndLib_BSplineSurface::GeomBndLib_BSplineSurface ******/
		/****** md5 signature: d4becebc72c944607be1d3e10cf617a3 ******/
		%feature("compactdefaultargs") GeomBndLib_BSplineSurface;
		%feature("autodoc", "
Parameters
----------
theSurf: Geom_BSplineSurface

Return
-------
None

Description
-----------
No available documentation.
") GeomBndLib_BSplineSurface;
		 GeomBndLib_BSplineSurface(const opencascade::handle<Geom_BSplineSurface> & theSurf);

		/****** GeomBndLib_BSplineSurface::Box ******/
		/****** md5 signature: 8e213c1812e4ec1a92dc64878f404c36 ******/
		%feature("compactdefaultargs") Box;
		%feature("autodoc", "
Parameters
----------
theTol: double

Return
-------
Bnd_Box

Description
-----------
Compute bounding box for full surface.
") Box;
		Bnd_Box Box(double theTol);

		/****** GeomBndLib_BSplineSurface::Box ******/
		/****** md5 signature: 5fb9216448b9e30dabaca4078c99f1a8 ******/
		%feature("compactdefaultargs") Box;
		%feature("autodoc", "
Parameters
----------
theUMin: double
theUMax: double
theVMin: double
theVMax: double
theTol: double

Return
-------
Bnd_Box

Description
-----------
Compute bounding box for surface patch [theUMin, theUMax] x [theVMin, theVMax].
") Box;
		Bnd_Box Box(double theUMin, double theUMax, double theVMin, double theVMax, double theTol);

		/****** GeomBndLib_BSplineSurface::BoxOptimal ******/
		/****** md5 signature: d39e92310e0e73b2f76900a30e9b4128 ******/
		%feature("compactdefaultargs") BoxOptimal;
		%feature("autodoc", "
Parameters
----------
theTol: double

Return
-------
Bnd_Box

Description
-----------
Compute precise bounding box for full surface.
") BoxOptimal;
		Bnd_Box BoxOptimal(double theTol);

		/****** GeomBndLib_BSplineSurface::BoxOptimal ******/
		/****** md5 signature: 21e7055b32fe86aec4e261d9657317ee ******/
		%feature("compactdefaultargs") BoxOptimal;
		%feature("autodoc", "
Parameters
----------
theUMin: double
theUMax: double
theVMin: double
theVMax: double
theTol: double

Return
-------
Bnd_Box

Description
-----------
Compute precise bounding box using numerical optimization.
") BoxOptimal;
		Bnd_Box BoxOptimal(double theUMin, double theUMax, double theVMin, double theVMax, double theTol);

		/****** GeomBndLib_BSplineSurface::Geometry ******/
		/****** md5 signature: 45bc40013e6bae20ae1bd031537adf65 ******/
		%feature("compactdefaultargs") Geometry;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom_BSplineSurface>

Description
-----------
No available documentation.
") Geometry;
		const opencascade::handle<Geom_BSplineSurface> & Geometry();

};


%extend GeomBndLib_BSplineSurface {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************
* class GeomBndLib_BezierCurve *
*******************************/
class GeomBndLib_BezierCurve {
	public:
		/****** GeomBndLib_BezierCurve::GeomBndLib_BezierCurve ******/
		/****** md5 signature: b26f92225a789bce8ec7c36c4a63bdb9 ******/
		%feature("compactdefaultargs") GeomBndLib_BezierCurve;
		%feature("autodoc", "
Parameters
----------
theCurve: Geom_BezierCurve

Return
-------
None

Description
-----------
No available documentation.
") GeomBndLib_BezierCurve;
		 GeomBndLib_BezierCurve(const opencascade::handle<Geom_BezierCurve> & theCurve);

		/****** GeomBndLib_BezierCurve::Box ******/
		/****** md5 signature: 8e213c1812e4ec1a92dc64878f404c36 ******/
		%feature("compactdefaultargs") Box;
		%feature("autodoc", "
Parameters
----------
theTol: double

Return
-------
Bnd_Box

Description
-----------
Compute bounding box for full curve.
") Box;
		Bnd_Box Box(double theTol);

		/****** GeomBndLib_BezierCurve::Box ******/
		/****** md5 signature: 385b16a150a20485f3d84b859d3fd18f ******/
		%feature("compactdefaultargs") Box;
		%feature("autodoc", "
Parameters
----------
theU1: double
theU2: double
theTol: double

Return
-------
Bnd_Box

Description
-----------
Compute bounding box for arc [theU1, theU2].
") Box;
		Bnd_Box Box(double theU1, double theU2, double theTol);

		/****** GeomBndLib_BezierCurve::BoxOptimal ******/
		/****** md5 signature: e14175b3e4a4a9509a9971714e46a83c ******/
		%feature("compactdefaultargs") BoxOptimal;
		%feature("autodoc", "
Parameters
----------
theU1: double
theU2: double
theTol: double

Return
-------
Bnd_Box

Description
-----------
Compute precise bounding box using numerical optimization.
") BoxOptimal;
		Bnd_Box BoxOptimal(double theU1, double theU2, double theTol);

		/****** GeomBndLib_BezierCurve::Geometry ******/
		/****** md5 signature: 06b73e3aeb03775da6225911f808822b ******/
		%feature("compactdefaultargs") Geometry;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom_BezierCurve>

Description
-----------
No available documentation.
") Geometry;
		const opencascade::handle<Geom_BezierCurve> & Geometry();

};


%extend GeomBndLib_BezierCurve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************
* class GeomBndLib_BezierCurve2d *
*********************************/
class GeomBndLib_BezierCurve2d {
	public:
		/****** GeomBndLib_BezierCurve2d::GeomBndLib_BezierCurve2d ******/
		/****** md5 signature: 47d5b1a58d63385f00e917c447958b07 ******/
		%feature("compactdefaultargs") GeomBndLib_BezierCurve2d;
		%feature("autodoc", "
Parameters
----------
theCurve: Geom2d_BezierCurve

Return
-------
None

Description
-----------
No available documentation.
") GeomBndLib_BezierCurve2d;
		 GeomBndLib_BezierCurve2d(const opencascade::handle<Geom2d_BezierCurve> & theCurve);

		/****** GeomBndLib_BezierCurve2d::Box ******/
		/****** md5 signature: 67777045e862a77e4ef0f0274513a286 ******/
		%feature("compactdefaultargs") Box;
		%feature("autodoc", "
Parameters
----------
theTol: double

Return
-------
Bnd_Box2d

Description
-----------
Compute bounding box for full curve.
") Box;
		Bnd_Box2d Box(double theTol);

		/****** GeomBndLib_BezierCurve2d::Box ******/
		/****** md5 signature: 6e7a33d7e518329e6c7cef888fb57857 ******/
		%feature("compactdefaultargs") Box;
		%feature("autodoc", "
Parameters
----------
theU1: double
theU2: double
theTol: double

Return
-------
Bnd_Box2d

Description
-----------
Compute bounding box for arc [theU1, theU2].
") Box;
		Bnd_Box2d Box(double theU1, double theU2, double theTol);

		/****** GeomBndLib_BezierCurve2d::BoxOptimal ******/
		/****** md5 signature: 2e8c0bcd75a33e35d701f16785b70909 ******/
		%feature("compactdefaultargs") BoxOptimal;
		%feature("autodoc", "
Parameters
----------
theU1: double
theU2: double
theTol: double

Return
-------
Bnd_Box2d

Description
-----------
Compute precise bounding box using numerical optimization.
") BoxOptimal;
		Bnd_Box2d BoxOptimal(double theU1, double theU2, double theTol);

		/****** GeomBndLib_BezierCurve2d::Geometry ******/
		/****** md5 signature: 90f182325cb637da6ef594d6aad90032 ******/
		%feature("compactdefaultargs") Geometry;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom2d_BezierCurve>

Description
-----------
No available documentation.
") Geometry;
		const opencascade::handle<Geom2d_BezierCurve> & Geometry();

};


%extend GeomBndLib_BezierCurve2d {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************
* class GeomBndLib_BezierSurface *
*********************************/
class GeomBndLib_BezierSurface {
	public:
		/****** GeomBndLib_BezierSurface::GeomBndLib_BezierSurface ******/
		/****** md5 signature: 2c5bb4e2c9d909f3cc6cf3490f9738b9 ******/
		%feature("compactdefaultargs") GeomBndLib_BezierSurface;
		%feature("autodoc", "
Parameters
----------
theSurf: Geom_BezierSurface

Return
-------
None

Description
-----------
No available documentation.
") GeomBndLib_BezierSurface;
		 GeomBndLib_BezierSurface(const opencascade::handle<Geom_BezierSurface> & theSurf);

		/****** GeomBndLib_BezierSurface::Box ******/
		/****** md5 signature: 8e213c1812e4ec1a92dc64878f404c36 ******/
		%feature("compactdefaultargs") Box;
		%feature("autodoc", "
Parameters
----------
theTol: double

Return
-------
Bnd_Box

Description
-----------
Compute bounding box for full surface.
") Box;
		Bnd_Box Box(double theTol);

		/****** GeomBndLib_BezierSurface::Box ******/
		/****** md5 signature: 5fb9216448b9e30dabaca4078c99f1a8 ******/
		%feature("compactdefaultargs") Box;
		%feature("autodoc", "
Parameters
----------
theUMin: double
theUMax: double
theVMin: double
theVMax: double
theTol: double

Return
-------
Bnd_Box

Description
-----------
Compute bounding box for surface patch [theUMin, theUMax] x [theVMin, theVMax].
") Box;
		Bnd_Box Box(double theUMin, double theUMax, double theVMin, double theVMax, double theTol);

		/****** GeomBndLib_BezierSurface::BoxOptimal ******/
		/****** md5 signature: d39e92310e0e73b2f76900a30e9b4128 ******/
		%feature("compactdefaultargs") BoxOptimal;
		%feature("autodoc", "
Parameters
----------
theTol: double

Return
-------
Bnd_Box

Description
-----------
Compute precise bounding box for full surface.
") BoxOptimal;
		Bnd_Box BoxOptimal(double theTol);

		/****** GeomBndLib_BezierSurface::BoxOptimal ******/
		/****** md5 signature: 21e7055b32fe86aec4e261d9657317ee ******/
		%feature("compactdefaultargs") BoxOptimal;
		%feature("autodoc", "
Parameters
----------
theUMin: double
theUMax: double
theVMin: double
theVMax: double
theTol: double

Return
-------
Bnd_Box

Description
-----------
Compute precise bounding box using numerical optimization.
") BoxOptimal;
		Bnd_Box BoxOptimal(double theUMin, double theUMax, double theVMin, double theVMax, double theTol);

		/****** GeomBndLib_BezierSurface::Geometry ******/
		/****** md5 signature: 29fe6ac2dbffa73417781adc00c8a516 ******/
		%feature("compactdefaultargs") Geometry;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom_BezierSurface>

Description
-----------
No available documentation.
") Geometry;
		const opencascade::handle<Geom_BezierSurface> & Geometry();

};


%extend GeomBndLib_BezierSurface {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************
* class GeomBndLib_Circle *
**************************/
class GeomBndLib_Circle {
	public:
		/****** GeomBndLib_Circle::GeomBndLib_Circle ******/
		/****** md5 signature: b2ef5d8b988e3abfa0c030d37f236d71 ******/
		%feature("compactdefaultargs") GeomBndLib_Circle;
		%feature("autodoc", "
Parameters
----------
theCircle: Geom_Circle

Return
-------
None

Description
-----------
No available documentation.
") GeomBndLib_Circle;
		 GeomBndLib_Circle(const opencascade::handle<Geom_Circle> & theCircle);

		/****** GeomBndLib_Circle::Box ******/
		/****** md5 signature: d3df0713eb7da30826d22bf110a3c0f7 ******/
		%feature("compactdefaultargs") Box;
		%feature("autodoc", "
Parameters
----------
theTol: double

Return
-------
Bnd_Box

Description
-----------
Compute bounding box for full circle.
") Box;
		Bnd_Box Box(double theTol);

		/****** GeomBndLib_Circle::Box ******/
		/****** md5 signature: 8ef6839c8d750bad7991c14af811523d ******/
		%feature("compactdefaultargs") Box;
		%feature("autodoc", "
Parameters
----------
theU1: double
theU2: double
theTol: double

Return
-------
Bnd_Box

Description
-----------
Compute bounding box for arc [theU1, theU2].
") Box;
		Bnd_Box Box(double theU1, double theU2, double theTol);

		/****** GeomBndLib_Circle::Box ******/
		/****** md5 signature: 1dc9168022df8978d74a34b0fe03b239 ******/
		%feature("compactdefaultargs") Box;
		%feature("autodoc", "
Parameters
----------
theCirc: gp_Circ
theTol: double

Return
-------
Bnd_Box

Description
-----------
Compute bounding box for a full circle defined by gp_Circ.
") Box;
		static Bnd_Box Box(const gp_Circ & theCirc, double theTol);

		/****** GeomBndLib_Circle::Box ******/
		/****** md5 signature: a1f2344a77f1a0d384ff9822005d234d ******/
		%feature("compactdefaultargs") Box;
		%feature("autodoc", "
Parameters
----------
theCirc: gp_Circ
theU1: double
theU2: double
theTol: double

Return
-------
Bnd_Box

Description
-----------
Compute bounding box for a circle arc [theU1, theU2] defined by gp_Circ.
") Box;
		static Bnd_Box Box(const gp_Circ & theCirc, double theU1, double theU2, double theTol);

		/****** GeomBndLib_Circle::BoxOptimal ******/
		/****** md5 signature: 512d0631d26b1ae9d2aee6ec9a237ea9 ******/
		%feature("compactdefaultargs") BoxOptimal;
		%feature("autodoc", "
Parameters
----------
theU1: double
theU2: double
theTol: double

Return
-------
Bnd_Box

Description
-----------
For analytical curves, BoxOptimal is same as Box.
") BoxOptimal;
		Bnd_Box BoxOptimal(double theU1, double theU2, double theTol);

		/****** GeomBndLib_Circle::Geometry ******/
		/****** md5 signature: 82faf6fdc68806f4c09fa4891a54c9c2 ******/
		%feature("compactdefaultargs") Geometry;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom_Circle>

Description
-----------
No available documentation.
") Geometry;
		const opencascade::handle<Geom_Circle> & Geometry();

};


%extend GeomBndLib_Circle {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************
* class GeomBndLib_Circle2d *
****************************/
class GeomBndLib_Circle2d {
	public:
		/****** GeomBndLib_Circle2d::GeomBndLib_Circle2d ******/
		/****** md5 signature: 1521f4891806a29860e8460da29a05b3 ******/
		%feature("compactdefaultargs") GeomBndLib_Circle2d;
		%feature("autodoc", "
Parameters
----------
theCircle: Geom2d_Circle

Return
-------
None

Description
-----------
No available documentation.
") GeomBndLib_Circle2d;
		 GeomBndLib_Circle2d(const opencascade::handle<Geom2d_Circle> & theCircle);

		/****** GeomBndLib_Circle2d::Box ******/
		/****** md5 signature: 92c11988dccc4e1c999dd2af88fda459 ******/
		%feature("compactdefaultargs") Box;
		%feature("autodoc", "
Parameters
----------
theTol: double

Return
-------
Bnd_Box2d

Description
-----------
Compute bounding box for full circle.
") Box;
		Bnd_Box2d Box(double theTol);

		/****** GeomBndLib_Circle2d::Box ******/
		/****** md5 signature: 204e7692c3fd8c23ef5928c0a0aae32c ******/
		%feature("compactdefaultargs") Box;
		%feature("autodoc", "
Parameters
----------
theU1: double
theU2: double
theTol: double

Return
-------
Bnd_Box2d

Description
-----------
Compute bounding box for arc [theU1, theU2].
") Box;
		Bnd_Box2d Box(double theU1, double theU2, double theTol);

		/****** GeomBndLib_Circle2d::Box ******/
		/****** md5 signature: b3003a29d72d3febc57d39ea2b374fd9 ******/
		%feature("compactdefaultargs") Box;
		%feature("autodoc", "
Parameters
----------
theCirc: gp_Circ2d
theTol: double

Return
-------
Bnd_Box2d

Description
-----------
Compute bounding box for a full circle defined by gp_Circ2d.
") Box;
		static Bnd_Box2d Box(const gp_Circ2d & theCirc, double theTol);

		/****** GeomBndLib_Circle2d::Box ******/
		/****** md5 signature: dfb95d188358ba41d0b11801e519c540 ******/
		%feature("compactdefaultargs") Box;
		%feature("autodoc", "
Parameters
----------
theCirc: gp_Circ2d
theU1: double
theU2: double
theTol: double

Return
-------
Bnd_Box2d

Description
-----------
Compute bounding box for a circle arc [theU1, theU2] defined by gp_Circ2d.
") Box;
		static Bnd_Box2d Box(const gp_Circ2d & theCirc, double theU1, double theU2, double theTol);

		/****** GeomBndLib_Circle2d::BoxOptimal ******/
		/****** md5 signature: 939426dc89c2f53b7d23ecb28602c548 ******/
		%feature("compactdefaultargs") BoxOptimal;
		%feature("autodoc", "
Parameters
----------
theU1: double
theU2: double
theTol: double

Return
-------
Bnd_Box2d

Description
-----------
For analytical curves, BoxOptimal is same as Box.
") BoxOptimal;
		Bnd_Box2d BoxOptimal(double theU1, double theU2, double theTol);

		/****** GeomBndLib_Circle2d::Geometry ******/
		/****** md5 signature: 773c23ef1ce3ba31799f772e2bea27ec ******/
		%feature("compactdefaultargs") Geometry;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom2d_Circle>

Description
-----------
No available documentation.
") Geometry;
		const opencascade::handle<Geom2d_Circle> & Geometry();

};


%extend GeomBndLib_Circle2d {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************
* class GeomBndLib_Cone *
************************/
class GeomBndLib_Cone {
	public:
		/****** GeomBndLib_Cone::GeomBndLib_Cone ******/
		/****** md5 signature: da3d06f6e1658faa9d5431f8088c1af3 ******/
		%feature("compactdefaultargs") GeomBndLib_Cone;
		%feature("autodoc", "
Parameters
----------
theSurf: Geom_ConicalSurface

Return
-------
None

Description
-----------
No available documentation.
") GeomBndLib_Cone;
		 GeomBndLib_Cone(const opencascade::handle<Geom_ConicalSurface> & theSurf);

		/****** GeomBndLib_Cone::Box ******/
		/****** md5 signature: 8e213c1812e4ec1a92dc64878f404c36 ******/
		%feature("compactdefaultargs") Box;
		%feature("autodoc", "
Parameters
----------
theTol: double

Return
-------
Bnd_Box

Description
-----------
Compute bounding box for full cone.
") Box;
		Bnd_Box Box(double theTol);

		/****** GeomBndLib_Cone::Box ******/
		/****** md5 signature: 5fb9216448b9e30dabaca4078c99f1a8 ******/
		%feature("compactdefaultargs") Box;
		%feature("autodoc", "
Parameters
----------
theUMin: double
theUMax: double
theVMin: double
theVMax: double
theTol: double

Return
-------
Bnd_Box

Description
-----------
Compute bounding box for cone patch [theUMin, theUMax] x [theVMin, theVMax].
") Box;
		Bnd_Box Box(double theUMin, double theUMax, double theVMin, double theVMax, double theTol);

		/****** GeomBndLib_Cone::BoxOptimal ******/
		/****** md5 signature: 7ea06e9d73145e4911239b77a1bcd6eb ******/
		%feature("compactdefaultargs") BoxOptimal;
		%feature("autodoc", "
Parameters
----------
theUMin: double
theUMax: double
theVMin: double
theVMax: double
theTol: double

Return
-------
Bnd_Box

Description
-----------
For analytical surfaces, BoxOptimal is same as Box.
") BoxOptimal;
		Bnd_Box BoxOptimal(double theUMin, double theUMax, double theVMin, double theVMax, double theTol);

		/****** GeomBndLib_Cone::BoxOptimal ******/
		/****** md5 signature: 756d212d9dbe194f6e28cd7f7e1195c9 ******/
		%feature("compactdefaultargs") BoxOptimal;
		%feature("autodoc", "
Parameters
----------
theTol: double

Return
-------
Bnd_Box

Description
-----------
Compute optimal bounding box for full surface.
") BoxOptimal;
		Bnd_Box BoxOptimal(double theTol);

		/****** GeomBndLib_Cone::Geometry ******/
		/****** md5 signature: b8b4e0aa53555d98ff227bb13963e1b2 ******/
		%feature("compactdefaultargs") Geometry;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom_ConicalSurface>

Description
-----------
No available documentation.
") Geometry;
		const opencascade::handle<Geom_ConicalSurface> & Geometry();

};


%extend GeomBndLib_Cone {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************
* class GeomBndLib_Curve *
*************************/
%pythonappend GeomBndLib_Curve::GeomBndLib_Curve %{
    self._constructor_args = args
%}
class GeomBndLib_Curve {
	public:
		/****** GeomBndLib_Curve::GeomBndLib_Curve ******/
		/****** md5 signature: aacd2af9e04c7f00a4b57e601638dc86 ******/
		%feature("compactdefaultargs") GeomBndLib_Curve;
		%feature("autodoc", "
Parameters
----------
theCurve: Adaptor3d_Curve

Return
-------
None

Description
-----------
Construct from an adaptor curve.
") GeomBndLib_Curve;
		 GeomBndLib_Curve(const Adaptor3d_Curve & theCurve);

		/****** GeomBndLib_Curve::GeomBndLib_Curve ******/
		/****** md5 signature: 2e3b4a01e46841782ca9e3a895ade731 ******/
		%feature("compactdefaultargs") GeomBndLib_Curve;
		%feature("autodoc", "
Parameters
----------
theCurve: Geom_Curve

Return
-------
None

Description
-----------
Construct from a Geom_Curve handle.
") GeomBndLib_Curve;
		 GeomBndLib_Curve(const opencascade::handle<Geom_Curve> & theCurve);

		/****** GeomBndLib_Curve::Add ******/
		/****** md5 signature: 17af8bc28711309bba943ceb946398b1 ******/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
theTol: double
theBox: Bnd_Box

Return
-------
None

Description
-----------
Add bounding box for full curve.
") Add;
		void Add(double theTol, Bnd_Box & theBox);

		/****** GeomBndLib_Curve::Add ******/
		/****** md5 signature: 5a0b19a9b823c63a4b3c9695dcf2efae ******/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
theU1: double
theU2: double
theTol: double
theBox: Bnd_Box

Return
-------
None

Description
-----------
Add bounding box for arc [theU1, theU2].
") Add;
		void Add(double theU1, double theU2, double theTol, Bnd_Box & theBox);

		/****** GeomBndLib_Curve::AddOptimal ******/
		/****** md5 signature: d1dd57a302cfac30beecef2777d35532 ******/
		%feature("compactdefaultargs") AddOptimal;
		%feature("autodoc", "
Parameters
----------
theTol: double
theBox: Bnd_Box

Return
-------
None

Description
-----------
Add precise bounding box for full curve.
") AddOptimal;
		void AddOptimal(double theTol, Bnd_Box & theBox);

		/****** GeomBndLib_Curve::AddOptimal ******/
		/****** md5 signature: e69db8b9864dc30a7aacc61e2ff50f44 ******/
		%feature("compactdefaultargs") AddOptimal;
		%feature("autodoc", "
Parameters
----------
theU1: double
theU2: double
theTol: double
theBox: Bnd_Box

Return
-------
None

Description
-----------
Add precise bounding box for arc [theU1, theU2].
") AddOptimal;
		void AddOptimal(double theU1, double theU2, double theTol, Bnd_Box & theBox);

		/****** GeomBndLib_Curve::Box ******/
		/****** md5 signature: 8e213c1812e4ec1a92dc64878f404c36 ******/
		%feature("compactdefaultargs") Box;
		%feature("autodoc", "
Parameters
----------
theTol: double

Return
-------
Bnd_Box

Description
-----------
Compute bounding box for full curve.
") Box;
		Bnd_Box Box(double theTol);

		/****** GeomBndLib_Curve::Box ******/
		/****** md5 signature: 385b16a150a20485f3d84b859d3fd18f ******/
		%feature("compactdefaultargs") Box;
		%feature("autodoc", "
Parameters
----------
theU1: double
theU2: double
theTol: double

Return
-------
Bnd_Box

Description
-----------
Compute bounding box for arc [theU1, theU2].
") Box;
		Bnd_Box Box(double theU1, double theU2, double theTol);

		/****** GeomBndLib_Curve::BoxOptimal ******/
		/****** md5 signature: d39e92310e0e73b2f76900a30e9b4128 ******/
		%feature("compactdefaultargs") BoxOptimal;
		%feature("autodoc", "
Parameters
----------
theTol: double

Return
-------
Bnd_Box

Description
-----------
Compute precise bounding box for full curve.
") BoxOptimal;
		Bnd_Box BoxOptimal(double theTol);

		/****** GeomBndLib_Curve::BoxOptimal ******/
		/****** md5 signature: e14175b3e4a4a9509a9971714e46a83c ******/
		%feature("compactdefaultargs") BoxOptimal;
		%feature("autodoc", "
Parameters
----------
theU1: double
theU2: double
theTol: double

Return
-------
Bnd_Box

Description
-----------
Compute precise bounding box for arc [theU1, theU2].
") BoxOptimal;
		Bnd_Box BoxOptimal(double theU1, double theU2, double theTol);

		/****** GeomBndLib_Curve::GetType ******/
		/****** md5 signature: 3226ee98f21e859ede8900c53e096e36 ******/
		%feature("compactdefaultargs") GetType;
		%feature("autodoc", "Return
-------
GeomAbs_CurveType

Description
-----------
Return detected curve type.
") GetType;
		GeomAbs_CurveType GetType();

};


%extend GeomBndLib_Curve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************
* class GeomBndLib_Curve2d *
***************************/
%pythonappend GeomBndLib_Curve2d::GeomBndLib_Curve2d %{
    self._constructor_args = args
%}
class GeomBndLib_Curve2d {
	public:
		/****** GeomBndLib_Curve2d::GeomBndLib_Curve2d ******/
		/****** md5 signature: 1a5fdf8dc84d4a52e654f54c1c3b844f ******/
		%feature("compactdefaultargs") GeomBndLib_Curve2d;
		%feature("autodoc", "
Parameters
----------
theCurve: Adaptor2d_Curve2d

Return
-------
None

Description
-----------
Construct from an adaptor curve.
") GeomBndLib_Curve2d;
		 GeomBndLib_Curve2d(const Adaptor2d_Curve2d & theCurve);

		/****** GeomBndLib_Curve2d::GeomBndLib_Curve2d ******/
		/****** md5 signature: a46bcefba1967b86e40d40eada5f4d8f ******/
		%feature("compactdefaultargs") GeomBndLib_Curve2d;
		%feature("autodoc", "
Parameters
----------
theCurve: Geom2d_Curve

Return
-------
None

Description
-----------
Construct from a Geom2d_Curve handle.
") GeomBndLib_Curve2d;
		 GeomBndLib_Curve2d(const opencascade::handle<Geom2d_Curve> & theCurve);

		/****** GeomBndLib_Curve2d::Add ******/
		/****** md5 signature: c973b782b69bedf9c08775cb8cfcf707 ******/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
theTol: double
theBox: Bnd_Box2d

Return
-------
None

Description
-----------
Add bounding box for full curve.
") Add;
		void Add(double theTol, Bnd_Box2d & theBox);

		/****** GeomBndLib_Curve2d::Add ******/
		/****** md5 signature: 75546b376feac54782c27819bbb2ef2b ******/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
theU1: double
theU2: double
theTol: double
theBox: Bnd_Box2d

Return
-------
None

Description
-----------
Add bounding box for arc [theU1, theU2].
") Add;
		void Add(double theU1, double theU2, double theTol, Bnd_Box2d & theBox);

		/****** GeomBndLib_Curve2d::AddOptimal ******/
		/****** md5 signature: 30d79df28ec0e774014bb702f5aafc14 ******/
		%feature("compactdefaultargs") AddOptimal;
		%feature("autodoc", "
Parameters
----------
theTol: double
theBox: Bnd_Box2d

Return
-------
None

Description
-----------
Add precise bounding box for full curve.
") AddOptimal;
		void AddOptimal(double theTol, Bnd_Box2d & theBox);

		/****** GeomBndLib_Curve2d::AddOptimal ******/
		/****** md5 signature: c892bf69c41ab341a781e094c871d463 ******/
		%feature("compactdefaultargs") AddOptimal;
		%feature("autodoc", "
Parameters
----------
theU1: double
theU2: double
theTol: double
theBox: Bnd_Box2d

Return
-------
None

Description
-----------
Add precise bounding box for arc [theU1, theU2].
") AddOptimal;
		void AddOptimal(double theU1, double theU2, double theTol, Bnd_Box2d & theBox);

		/****** GeomBndLib_Curve2d::Box ******/
		/****** md5 signature: 67777045e862a77e4ef0f0274513a286 ******/
		%feature("compactdefaultargs") Box;
		%feature("autodoc", "
Parameters
----------
theTol: double

Return
-------
Bnd_Box2d

Description
-----------
Compute bounding box for full curve.
") Box;
		Bnd_Box2d Box(double theTol);

		/****** GeomBndLib_Curve2d::Box ******/
		/****** md5 signature: 6e7a33d7e518329e6c7cef888fb57857 ******/
		%feature("compactdefaultargs") Box;
		%feature("autodoc", "
Parameters
----------
theU1: double
theU2: double
theTol: double

Return
-------
Bnd_Box2d

Description
-----------
Compute bounding box for arc [theU1, theU2].
") Box;
		Bnd_Box2d Box(double theU1, double theU2, double theTol);

		/****** GeomBndLib_Curve2d::BoxOptimal ******/
		/****** md5 signature: 0a3b423397fe2294f5cc90061b6f7aaf ******/
		%feature("compactdefaultargs") BoxOptimal;
		%feature("autodoc", "
Parameters
----------
theTol: double

Return
-------
Bnd_Box2d

Description
-----------
Compute precise bounding box for full curve.
") BoxOptimal;
		Bnd_Box2d BoxOptimal(double theTol);

		/****** GeomBndLib_Curve2d::BoxOptimal ******/
		/****** md5 signature: 2e8c0bcd75a33e35d701f16785b70909 ******/
		%feature("compactdefaultargs") BoxOptimal;
		%feature("autodoc", "
Parameters
----------
theU1: double
theU2: double
theTol: double

Return
-------
Bnd_Box2d

Description
-----------
Compute precise bounding box for arc [theU1, theU2].
") BoxOptimal;
		Bnd_Box2d BoxOptimal(double theU1, double theU2, double theTol);

		/****** GeomBndLib_Curve2d::GetType ******/
		/****** md5 signature: 3226ee98f21e859ede8900c53e096e36 ******/
		%feature("compactdefaultargs") GetType;
		%feature("autodoc", "Return
-------
GeomAbs_CurveType

Description
-----------
Return detected curve type.
") GetType;
		GeomAbs_CurveType GetType();

};


%extend GeomBndLib_Curve2d {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************
* class GeomBndLib_Cylinder *
****************************/
class GeomBndLib_Cylinder {
	public:
		/****** GeomBndLib_Cylinder::GeomBndLib_Cylinder ******/
		/****** md5 signature: e055ea920bab5ebc795d03ae5576a08f ******/
		%feature("compactdefaultargs") GeomBndLib_Cylinder;
		%feature("autodoc", "
Parameters
----------
theSurf: Geom_CylindricalSurface

Return
-------
None

Description
-----------
No available documentation.
") GeomBndLib_Cylinder;
		 GeomBndLib_Cylinder(const opencascade::handle<Geom_CylindricalSurface> & theSurf);

		/****** GeomBndLib_Cylinder::Box ******/
		/****** md5 signature: 8e213c1812e4ec1a92dc64878f404c36 ******/
		%feature("compactdefaultargs") Box;
		%feature("autodoc", "
Parameters
----------
theTol: double

Return
-------
Bnd_Box

Description
-----------
Compute bounding box for full cylinder.
") Box;
		Bnd_Box Box(double theTol);

		/****** GeomBndLib_Cylinder::Box ******/
		/****** md5 signature: 5fb9216448b9e30dabaca4078c99f1a8 ******/
		%feature("compactdefaultargs") Box;
		%feature("autodoc", "
Parameters
----------
theUMin: double
theUMax: double
theVMin: double
theVMax: double
theTol: double

Return
-------
Bnd_Box

Description
-----------
Compute bounding box for cylinder patch [theUMin, theUMax] x [theVMin, theVMax].
") Box;
		Bnd_Box Box(double theUMin, double theUMax, double theVMin, double theVMax, double theTol);

		/****** GeomBndLib_Cylinder::BoxOptimal ******/
		/****** md5 signature: 7ea06e9d73145e4911239b77a1bcd6eb ******/
		%feature("compactdefaultargs") BoxOptimal;
		%feature("autodoc", "
Parameters
----------
theUMin: double
theUMax: double
theVMin: double
theVMax: double
theTol: double

Return
-------
Bnd_Box

Description
-----------
For analytical surfaces, BoxOptimal is same as Box.
") BoxOptimal;
		Bnd_Box BoxOptimal(double theUMin, double theUMax, double theVMin, double theVMax, double theTol);

		/****** GeomBndLib_Cylinder::BoxOptimal ******/
		/****** md5 signature: 756d212d9dbe194f6e28cd7f7e1195c9 ******/
		%feature("compactdefaultargs") BoxOptimal;
		%feature("autodoc", "
Parameters
----------
theTol: double

Return
-------
Bnd_Box

Description
-----------
Compute optimal bounding box for full surface.
") BoxOptimal;
		Bnd_Box BoxOptimal(double theTol);

		/****** GeomBndLib_Cylinder::Geometry ******/
		/****** md5 signature: 9745a57a86b4cae860a0862b948fa759 ******/
		%feature("compactdefaultargs") Geometry;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom_CylindricalSurface>

Description
-----------
No available documentation.
") Geometry;
		const opencascade::handle<Geom_CylindricalSurface> & Geometry();

};


%extend GeomBndLib_Cylinder {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************
* class GeomBndLib_Ellipse *
***************************/
class GeomBndLib_Ellipse {
	public:
		/****** GeomBndLib_Ellipse::GeomBndLib_Ellipse ******/
		/****** md5 signature: 899a096bbcfc5b4c34975f000e45aabc ******/
		%feature("compactdefaultargs") GeomBndLib_Ellipse;
		%feature("autodoc", "
Parameters
----------
theEllipse: Geom_Ellipse

Return
-------
None

Description
-----------
No available documentation.
") GeomBndLib_Ellipse;
		 GeomBndLib_Ellipse(const opencascade::handle<Geom_Ellipse> & theEllipse);

		/****** GeomBndLib_Ellipse::Box ******/
		/****** md5 signature: d3df0713eb7da30826d22bf110a3c0f7 ******/
		%feature("compactdefaultargs") Box;
		%feature("autodoc", "
Parameters
----------
theTol: double

Return
-------
Bnd_Box

Description
-----------
Compute bounding box for full ellipse.
") Box;
		Bnd_Box Box(double theTol);

		/****** GeomBndLib_Ellipse::Box ******/
		/****** md5 signature: 8ef6839c8d750bad7991c14af811523d ******/
		%feature("compactdefaultargs") Box;
		%feature("autodoc", "
Parameters
----------
theU1: double
theU2: double
theTol: double

Return
-------
Bnd_Box

Description
-----------
Compute bounding box for arc [theU1, theU2].
") Box;
		Bnd_Box Box(double theU1, double theU2, double theTol);

		/****** GeomBndLib_Ellipse::Box ******/
		/****** md5 signature: fd42c4c768b34695528fea89ce937758 ******/
		%feature("compactdefaultargs") Box;
		%feature("autodoc", "
Parameters
----------
theElips: gp_Elips
theTol: double

Return
-------
Bnd_Box

Description
-----------
Compute bounding box for a full ellipse defined by gp_Elips.
") Box;
		static Bnd_Box Box(const gp_Elips & theElips, double theTol);

		/****** GeomBndLib_Ellipse::Box ******/
		/****** md5 signature: f3dcb4753ce68189725601ae665784f1 ******/
		%feature("compactdefaultargs") Box;
		%feature("autodoc", "
Parameters
----------
theElips: gp_Elips
theU1: double
theU2: double
theTol: double

Return
-------
Bnd_Box

Description
-----------
Compute bounding box for an ellipse arc [theU1, theU2] defined by gp_Elips.
") Box;
		static Bnd_Box Box(const gp_Elips & theElips, double theU1, double theU2, double theTol);

		/****** GeomBndLib_Ellipse::BoxOptimal ******/
		/****** md5 signature: 512d0631d26b1ae9d2aee6ec9a237ea9 ******/
		%feature("compactdefaultargs") BoxOptimal;
		%feature("autodoc", "
Parameters
----------
theU1: double
theU2: double
theTol: double

Return
-------
Bnd_Box

Description
-----------
For analytical curves, BoxOptimal is same as Box.
") BoxOptimal;
		Bnd_Box BoxOptimal(double theU1, double theU2, double theTol);

		/****** GeomBndLib_Ellipse::Geometry ******/
		/****** md5 signature: c93b2255cb5afd7e70c8e5457a2425fa ******/
		%feature("compactdefaultargs") Geometry;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom_Ellipse>

Description
-----------
No available documentation.
") Geometry;
		const opencascade::handle<Geom_Ellipse> & Geometry();

};


%extend GeomBndLib_Ellipse {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************
* class GeomBndLib_Ellipse2d *
*****************************/
class GeomBndLib_Ellipse2d {
	public:
		/****** GeomBndLib_Ellipse2d::GeomBndLib_Ellipse2d ******/
		/****** md5 signature: 2639be87b2bddce021bdeb0627f1f271 ******/
		%feature("compactdefaultargs") GeomBndLib_Ellipse2d;
		%feature("autodoc", "
Parameters
----------
theEllipse: Geom2d_Ellipse

Return
-------
None

Description
-----------
No available documentation.
") GeomBndLib_Ellipse2d;
		 GeomBndLib_Ellipse2d(const opencascade::handle<Geom2d_Ellipse> & theEllipse);

		/****** GeomBndLib_Ellipse2d::Box ******/
		/****** md5 signature: 92c11988dccc4e1c999dd2af88fda459 ******/
		%feature("compactdefaultargs") Box;
		%feature("autodoc", "
Parameters
----------
theTol: double

Return
-------
Bnd_Box2d

Description
-----------
Compute bounding box for full ellipse.
") Box;
		Bnd_Box2d Box(double theTol);

		/****** GeomBndLib_Ellipse2d::Box ******/
		/****** md5 signature: 204e7692c3fd8c23ef5928c0a0aae32c ******/
		%feature("compactdefaultargs") Box;
		%feature("autodoc", "
Parameters
----------
theU1: double
theU2: double
theTol: double

Return
-------
Bnd_Box2d

Description
-----------
Compute bounding box for arc [theU1, theU2].
") Box;
		Bnd_Box2d Box(double theU1, double theU2, double theTol);

		/****** GeomBndLib_Ellipse2d::Box ******/
		/****** md5 signature: fd826ff91ccba37a27b26c31f1e37550 ******/
		%feature("compactdefaultargs") Box;
		%feature("autodoc", "
Parameters
----------
theElips: gp_Elips2d
theTol: double

Return
-------
Bnd_Box2d

Description
-----------
Compute bounding box for a full ellipse defined by gp_Elips2d.
") Box;
		static Bnd_Box2d Box(const gp_Elips2d & theElips, double theTol);

		/****** GeomBndLib_Ellipse2d::Box ******/
		/****** md5 signature: 9d1730e7c8bfe571f157b982ad8d3c12 ******/
		%feature("compactdefaultargs") Box;
		%feature("autodoc", "
Parameters
----------
theElips: gp_Elips2d
theU1: double
theU2: double
theTol: double

Return
-------
Bnd_Box2d

Description
-----------
Compute bounding box for an ellipse arc [theU1, theU2] defined by gp_Elips2d.
") Box;
		static Bnd_Box2d Box(const gp_Elips2d & theElips, double theU1, double theU2, double theTol);

		/****** GeomBndLib_Ellipse2d::BoxOptimal ******/
		/****** md5 signature: 939426dc89c2f53b7d23ecb28602c548 ******/
		%feature("compactdefaultargs") BoxOptimal;
		%feature("autodoc", "
Parameters
----------
theU1: double
theU2: double
theTol: double

Return
-------
Bnd_Box2d

Description
-----------
For analytical curves, BoxOptimal is same as Box.
") BoxOptimal;
		Bnd_Box2d BoxOptimal(double theU1, double theU2, double theTol);

		/****** GeomBndLib_Ellipse2d::Geometry ******/
		/****** md5 signature: 13b5db93fafad3b99732eb4da9e12987 ******/
		%feature("compactdefaultargs") Geometry;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom2d_Ellipse>

Description
-----------
No available documentation.
") Geometry;
		const opencascade::handle<Geom2d_Ellipse> & Geometry();

};


%extend GeomBndLib_Ellipse2d {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************
* class GeomBndLib_Hyperbola *
*****************************/
class GeomBndLib_Hyperbola {
	public:
		/****** GeomBndLib_Hyperbola::GeomBndLib_Hyperbola ******/
		/****** md5 signature: b5efe6e4fbb09090020d4adb98efef9d ******/
		%feature("compactdefaultargs") GeomBndLib_Hyperbola;
		%feature("autodoc", "
Parameters
----------
theHyperbola: Geom_Hyperbola

Return
-------
None

Description
-----------
No available documentation.
") GeomBndLib_Hyperbola;
		 GeomBndLib_Hyperbola(const opencascade::handle<Geom_Hyperbola> & theHyperbola);

		/****** GeomBndLib_Hyperbola::Box ******/
		/****** md5 signature: 8ef6839c8d750bad7991c14af811523d ******/
		%feature("compactdefaultargs") Box;
		%feature("autodoc", "
Parameters
----------
theU1: double
theU2: double
theTol: double

Return
-------
Bnd_Box

Description
-----------
Compute bounding box for arc [theU1, theU2].
") Box;
		Bnd_Box Box(double theU1, double theU2, double theTol);

		/****** GeomBndLib_Hyperbola::Box ******/
		/****** md5 signature: d3df0713eb7da30826d22bf110a3c0f7 ******/
		%feature("compactdefaultargs") Box;
		%feature("autodoc", "
Parameters
----------
theTol: double

Return
-------
Bnd_Box

Description
-----------
Compute bounding box for full curve.
") Box;
		Bnd_Box Box(double theTol);

		/****** GeomBndLib_Hyperbola::Box ******/
		/****** md5 signature: 15cd62497088ab814b68be318e786fcd ******/
		%feature("compactdefaultargs") Box;
		%feature("autodoc", "
Parameters
----------
theHypr: gp_Hypr
theU1: double
theU2: double
theTol: double

Return
-------
Bnd_Box

Description
-----------
Compute bounding box for a hyperbola arc [theU1, theU2] defined by gp_Hypr.
") Box;
		static Bnd_Box Box(const gp_Hypr & theHypr, double theU1, double theU2, double theTol);

		/****** GeomBndLib_Hyperbola::BoxOptimal ******/
		/****** md5 signature: 512d0631d26b1ae9d2aee6ec9a237ea9 ******/
		%feature("compactdefaultargs") BoxOptimal;
		%feature("autodoc", "
Parameters
----------
theU1: double
theU2: double
theTol: double

Return
-------
Bnd_Box

Description
-----------
For analytical curves, BoxOptimal is same as Box.
") BoxOptimal;
		Bnd_Box BoxOptimal(double theU1, double theU2, double theTol);

		/****** GeomBndLib_Hyperbola::Geometry ******/
		/****** md5 signature: 813530589c49441a650b1022ba5872d2 ******/
		%feature("compactdefaultargs") Geometry;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom_Hyperbola>

Description
-----------
No available documentation.
") Geometry;
		const opencascade::handle<Geom_Hyperbola> & Geometry();

};


%extend GeomBndLib_Hyperbola {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************
* class GeomBndLib_Hyperbola2d *
*******************************/
class GeomBndLib_Hyperbola2d {
	public:
		/****** GeomBndLib_Hyperbola2d::GeomBndLib_Hyperbola2d ******/
		/****** md5 signature: 87389208841fcb69e0521c5c124dd058 ******/
		%feature("compactdefaultargs") GeomBndLib_Hyperbola2d;
		%feature("autodoc", "
Parameters
----------
theHyperbola: Geom2d_Hyperbola

Return
-------
None

Description
-----------
No available documentation.
") GeomBndLib_Hyperbola2d;
		 GeomBndLib_Hyperbola2d(const opencascade::handle<Geom2d_Hyperbola> & theHyperbola);

		/****** GeomBndLib_Hyperbola2d::Box ******/
		/****** md5 signature: 204e7692c3fd8c23ef5928c0a0aae32c ******/
		%feature("compactdefaultargs") Box;
		%feature("autodoc", "
Parameters
----------
theU1: double
theU2: double
theTol: double

Return
-------
Bnd_Box2d

Description
-----------
Compute bounding box for arc [theU1, theU2].
") Box;
		Bnd_Box2d Box(double theU1, double theU2, double theTol);

		/****** GeomBndLib_Hyperbola2d::Box ******/
		/****** md5 signature: 92c11988dccc4e1c999dd2af88fda459 ******/
		%feature("compactdefaultargs") Box;
		%feature("autodoc", "
Parameters
----------
theTol: double

Return
-------
Bnd_Box2d

Description
-----------
Compute bounding box for full curve.
") Box;
		Bnd_Box2d Box(double theTol);

		/****** GeomBndLib_Hyperbola2d::Box ******/
		/****** md5 signature: 6e063b3671aa63bdb16d781f24b42614 ******/
		%feature("compactdefaultargs") Box;
		%feature("autodoc", "
Parameters
----------
theHypr: gp_Hypr2d
theU1: double
theU2: double
theTol: double

Return
-------
Bnd_Box2d

Description
-----------
Compute bounding box for a 2D hyperbola arc [theU1, theU2] defined by gp_Hypr2d.
") Box;
		static Bnd_Box2d Box(const gp_Hypr2d & theHypr, double theU1, double theU2, double theTol);

		/****** GeomBndLib_Hyperbola2d::BoxOptimal ******/
		/****** md5 signature: 939426dc89c2f53b7d23ecb28602c548 ******/
		%feature("compactdefaultargs") BoxOptimal;
		%feature("autodoc", "
Parameters
----------
theU1: double
theU2: double
theTol: double

Return
-------
Bnd_Box2d

Description
-----------
For analytical curves, BoxOptimal is same as Box.
") BoxOptimal;
		Bnd_Box2d BoxOptimal(double theU1, double theU2, double theTol);

		/****** GeomBndLib_Hyperbola2d::Geometry ******/
		/****** md5 signature: 4aa1cdf86aa2f358e0e6e1ee96a785ea ******/
		%feature("compactdefaultargs") Geometry;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom2d_Hyperbola>

Description
-----------
No available documentation.
") Geometry;
		const opencascade::handle<Geom2d_Hyperbola> & Geometry();

};


%extend GeomBndLib_Hyperbola2d {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************
* class GeomBndLib_Line *
************************/
class GeomBndLib_Line {
	public:
		/****** GeomBndLib_Line::GeomBndLib_Line ******/
		/****** md5 signature: 333174b1dffd945128030370134e016c ******/
		%feature("compactdefaultargs") GeomBndLib_Line;
		%feature("autodoc", "
Parameters
----------
theLine: Geom_Line

Return
-------
None

Description
-----------
No available documentation.
") GeomBndLib_Line;
		 GeomBndLib_Line(const opencascade::handle<Geom_Line> & theLine);

		/****** GeomBndLib_Line::Box ******/
		/****** md5 signature: 8ef6839c8d750bad7991c14af811523d ******/
		%feature("compactdefaultargs") Box;
		%feature("autodoc", "
Parameters
----------
theU1: double
theU2: double
theTol: double

Return
-------
Bnd_Box

Description
-----------
Compute bounding box for line segment [theU1, theU2].
") Box;
		Bnd_Box Box(double theU1, double theU2, double theTol);

		/****** GeomBndLib_Line::Box ******/
		/****** md5 signature: d3df0713eb7da30826d22bf110a3c0f7 ******/
		%feature("compactdefaultargs") Box;
		%feature("autodoc", "
Parameters
----------
theTol: double

Return
-------
Bnd_Box

Description
-----------
Compute bounding box for full curve.
") Box;
		Bnd_Box Box(double theTol);

		/****** GeomBndLib_Line::Box ******/
		/****** md5 signature: 929fde917d190cd46f46f1fc4e7e00de ******/
		%feature("compactdefaultargs") Box;
		%feature("autodoc", "
Parameters
----------
theLin: gp_Lin
theU1: double
theU2: double
theTol: double

Return
-------
Bnd_Box

Description
-----------
Compute bounding box for a line segment [theU1, theU2] defined by gp_Lin.
") Box;
		static Bnd_Box Box(const gp_Lin & theLin, double theU1, double theU2, double theTol);

		/****** GeomBndLib_Line::BoxOptimal ******/
		/****** md5 signature: 512d0631d26b1ae9d2aee6ec9a237ea9 ******/
		%feature("compactdefaultargs") BoxOptimal;
		%feature("autodoc", "
Parameters
----------
theU1: double
theU2: double
theTol: double

Return
-------
Bnd_Box

Description
-----------
For analytical curves, BoxOptimal is same as Box.
") BoxOptimal;
		Bnd_Box BoxOptimal(double theU1, double theU2, double theTol);

		/****** GeomBndLib_Line::Geometry ******/
		/****** md5 signature: 3a325185b0aaf4dbbf936f774e594464 ******/
		%feature("compactdefaultargs") Geometry;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom_Line>

Description
-----------
No available documentation.
") Geometry;
		const opencascade::handle<Geom_Line> & Geometry();

};


%extend GeomBndLib_Line {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************
* class GeomBndLib_Line2d *
**************************/
class GeomBndLib_Line2d {
	public:
		/****** GeomBndLib_Line2d::GeomBndLib_Line2d ******/
		/****** md5 signature: 71f9a3bc686dd9a7999ef08e3b3a066b ******/
		%feature("compactdefaultargs") GeomBndLib_Line2d;
		%feature("autodoc", "
Parameters
----------
theLine: Geom2d_Line

Return
-------
None

Description
-----------
No available documentation.
") GeomBndLib_Line2d;
		 GeomBndLib_Line2d(const opencascade::handle<Geom2d_Line> & theLine);

		/****** GeomBndLib_Line2d::Box ******/
		/****** md5 signature: 204e7692c3fd8c23ef5928c0a0aae32c ******/
		%feature("compactdefaultargs") Box;
		%feature("autodoc", "
Parameters
----------
theU1: double
theU2: double
theTol: double

Return
-------
Bnd_Box2d

Description
-----------
Compute bounding box for line segment [theU1, theU2].
") Box;
		Bnd_Box2d Box(double theU1, double theU2, double theTol);

		/****** GeomBndLib_Line2d::Box ******/
		/****** md5 signature: 92c11988dccc4e1c999dd2af88fda459 ******/
		%feature("compactdefaultargs") Box;
		%feature("autodoc", "
Parameters
----------
theTol: double

Return
-------
Bnd_Box2d

Description
-----------
Compute bounding box for full curve.
") Box;
		Bnd_Box2d Box(double theTol);

		/****** GeomBndLib_Line2d::Box ******/
		/****** md5 signature: 291049c81fc5dea59b2c4be63e94ed91 ******/
		%feature("compactdefaultargs") Box;
		%feature("autodoc", "
Parameters
----------
theLin: gp_Lin2d
theU1: double
theU2: double
theTol: double

Return
-------
Bnd_Box2d

Description
-----------
Compute bounding box for a 2D line segment [theU1, theU2] defined by gp_Lin2d.
") Box;
		static Bnd_Box2d Box(const gp_Lin2d & theLin, double theU1, double theU2, double theTol);

		/****** GeomBndLib_Line2d::BoxOptimal ******/
		/****** md5 signature: 939426dc89c2f53b7d23ecb28602c548 ******/
		%feature("compactdefaultargs") BoxOptimal;
		%feature("autodoc", "
Parameters
----------
theU1: double
theU2: double
theTol: double

Return
-------
Bnd_Box2d

Description
-----------
For analytical curves, BoxOptimal is same as Box.
") BoxOptimal;
		Bnd_Box2d BoxOptimal(double theU1, double theU2, double theTol);

		/****** GeomBndLib_Line2d::Geometry ******/
		/****** md5 signature: 15ff60b314fa261eecf74d0c8938c7ff ******/
		%feature("compactdefaultargs") Geometry;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom2d_Line>

Description
-----------
No available documentation.
") Geometry;
		const opencascade::handle<Geom2d_Line> & Geometry();

};


%extend GeomBndLib_Line2d {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************
* class GeomBndLib_OffsetCurve *
*******************************/
class GeomBndLib_OffsetCurve {
	public:
		/****** GeomBndLib_OffsetCurve::GeomBndLib_OffsetCurve ******/
		/****** md5 signature: c5c7e27d95165e668cd023e691d2e7f8 ******/
		%feature("compactdefaultargs") GeomBndLib_OffsetCurve;
		%feature("autodoc", "
Parameters
----------
theCurve: Geom_OffsetCurve

Return
-------
None

Description
-----------
No available documentation.
") GeomBndLib_OffsetCurve;
		 GeomBndLib_OffsetCurve(const opencascade::handle<Geom_OffsetCurve> & theCurve);

		/****** GeomBndLib_OffsetCurve::Box ******/
		/****** md5 signature: d3df0713eb7da30826d22bf110a3c0f7 ******/
		%feature("compactdefaultargs") Box;
		%feature("autodoc", "
Parameters
----------
theTol: double

Return
-------
Bnd_Box

Description
-----------
Compute bounding box for full curve.
") Box;
		Bnd_Box Box(double theTol);

		/****** GeomBndLib_OffsetCurve::Box ******/
		/****** md5 signature: 385b16a150a20485f3d84b859d3fd18f ******/
		%feature("compactdefaultargs") Box;
		%feature("autodoc", "
Parameters
----------
theU1: double
theU2: double
theTol: double

Return
-------
Bnd_Box

Description
-----------
Compute bounding box for arc [theU1, theU2].
") Box;
		Bnd_Box Box(double theU1, double theU2, double theTol);

		/****** GeomBndLib_OffsetCurve::BoxOptimal ******/
		/****** md5 signature: 756d212d9dbe194f6e28cd7f7e1195c9 ******/
		%feature("compactdefaultargs") BoxOptimal;
		%feature("autodoc", "
Parameters
----------
theTol: double

Return
-------
Bnd_Box

Description
-----------
Compute precise bounding box for full curve.
") BoxOptimal;
		Bnd_Box BoxOptimal(double theTol);

		/****** GeomBndLib_OffsetCurve::BoxOptimal ******/
		/****** md5 signature: e14175b3e4a4a9509a9971714e46a83c ******/
		%feature("compactdefaultargs") BoxOptimal;
		%feature("autodoc", "
Parameters
----------
theU1: double
theU2: double
theTol: double

Return
-------
Bnd_Box

Description
-----------
Compute precise bounding box for arc [theU1, theU2] by sampling the offset curve.
") BoxOptimal;
		Bnd_Box BoxOptimal(double theU1, double theU2, double theTol);

		/****** GeomBndLib_OffsetCurve::Geometry ******/
		/****** md5 signature: cc6f939b8e58f6ce10a574711e635e56 ******/
		%feature("compactdefaultargs") Geometry;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom_OffsetCurve>

Description
-----------
No available documentation.
") Geometry;
		const opencascade::handle<Geom_OffsetCurve> & Geometry();

};


%extend GeomBndLib_OffsetCurve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************
* class GeomBndLib_OffsetCurve2d *
*********************************/
class GeomBndLib_OffsetCurve2d {
	public:
		/****** GeomBndLib_OffsetCurve2d::GeomBndLib_OffsetCurve2d ******/
		/****** md5 signature: 7e98873e49668bcd8682eea9c1beeb32 ******/
		%feature("compactdefaultargs") GeomBndLib_OffsetCurve2d;
		%feature("autodoc", "
Parameters
----------
theCurve: Geom2d_OffsetCurve

Return
-------
None

Description
-----------
No available documentation.
") GeomBndLib_OffsetCurve2d;
		 GeomBndLib_OffsetCurve2d(const opencascade::handle<Geom2d_OffsetCurve> & theCurve);

		/****** GeomBndLib_OffsetCurve2d::Box ******/
		/****** md5 signature: 92c11988dccc4e1c999dd2af88fda459 ******/
		%feature("compactdefaultargs") Box;
		%feature("autodoc", "
Parameters
----------
theTol: double

Return
-------
Bnd_Box2d

Description
-----------
Compute bounding box for full curve.
") Box;
		Bnd_Box2d Box(double theTol);

		/****** GeomBndLib_OffsetCurve2d::Box ******/
		/****** md5 signature: 6e7a33d7e518329e6c7cef888fb57857 ******/
		%feature("compactdefaultargs") Box;
		%feature("autodoc", "
Parameters
----------
theU1: double
theU2: double
theTol: double

Return
-------
Bnd_Box2d

Description
-----------
Compute bounding box for arc [theU1, theU2].
") Box;
		Bnd_Box2d Box(double theU1, double theU2, double theTol);

		/****** GeomBndLib_OffsetCurve2d::BoxOptimal ******/
		/****** md5 signature: 1108a37b85620b4b9d1464431ac807af ******/
		%feature("compactdefaultargs") BoxOptimal;
		%feature("autodoc", "
Parameters
----------
theTol: double

Return
-------
Bnd_Box2d

Description
-----------
Compute precise bounding box for full curve.
") BoxOptimal;
		Bnd_Box2d BoxOptimal(double theTol);

		/****** GeomBndLib_OffsetCurve2d::BoxOptimal ******/
		/****** md5 signature: 2e8c0bcd75a33e35d701f16785b70909 ******/
		%feature("compactdefaultargs") BoxOptimal;
		%feature("autodoc", "
Parameters
----------
theU1: double
theU2: double
theTol: double

Return
-------
Bnd_Box2d

Description
-----------
Compute precise bounding box for arc [theU1, theU2] by sampling the offset curve.
") BoxOptimal;
		Bnd_Box2d BoxOptimal(double theU1, double theU2, double theTol);

		/****** GeomBndLib_OffsetCurve2d::Geometry ******/
		/****** md5 signature: 693e8d5330f15a18b779cb729bb2e32c ******/
		%feature("compactdefaultargs") Geometry;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom2d_OffsetCurve>

Description
-----------
No available documentation.
") Geometry;
		const opencascade::handle<Geom2d_OffsetCurve> & Geometry();

};


%extend GeomBndLib_OffsetCurve2d {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************
* class GeomBndLib_OffsetSurface *
*********************************/
class GeomBndLib_OffsetSurface {
	public:
		/****** GeomBndLib_OffsetSurface::GeomBndLib_OffsetSurface ******/
		/****** md5 signature: f95cf47220ea1d21c867300d9cc8de5b ******/
		%feature("compactdefaultargs") GeomBndLib_OffsetSurface;
		%feature("autodoc", "
Parameters
----------
theSurf: Geom_OffsetSurface

Return
-------
None

Description
-----------
No available documentation.
") GeomBndLib_OffsetSurface;
		 GeomBndLib_OffsetSurface(const opencascade::handle<Geom_OffsetSurface> & theSurf);

		/****** GeomBndLib_OffsetSurface::Box ******/
		/****** md5 signature: 8e213c1812e4ec1a92dc64878f404c36 ******/
		%feature("compactdefaultargs") Box;
		%feature("autodoc", "
Parameters
----------
theTol: double

Return
-------
Bnd_Box

Description
-----------
Compute bounding box for full surface.
") Box;
		Bnd_Box Box(double theTol);

		/****** GeomBndLib_OffsetSurface::Box ******/
		/****** md5 signature: 5fb9216448b9e30dabaca4078c99f1a8 ******/
		%feature("compactdefaultargs") Box;
		%feature("autodoc", "
Parameters
----------
theUMin: double
theUMax: double
theVMin: double
theVMax: double
theTol: double

Return
-------
Bnd_Box

Description
-----------
Compute bounding box for surface patch [theUMin, theUMax] x [theVMin, theVMax].
") Box;
		Bnd_Box Box(double theUMin, double theUMax, double theVMin, double theVMax, double theTol);

		/****** GeomBndLib_OffsetSurface::BoxOptimal ******/
		/****** md5 signature: 756d212d9dbe194f6e28cd7f7e1195c9 ******/
		%feature("compactdefaultargs") BoxOptimal;
		%feature("autodoc", "
Parameters
----------
theTol: double

Return
-------
Bnd_Box

Description
-----------
Compute precise bounding box for full surface.
") BoxOptimal;
		Bnd_Box BoxOptimal(double theTol);

		/****** GeomBndLib_OffsetSurface::BoxOptimal ******/
		/****** md5 signature: 21e7055b32fe86aec4e261d9657317ee ******/
		%feature("compactdefaultargs") BoxOptimal;
		%feature("autodoc", "
Parameters
----------
theUMin: double
theUMax: double
theVMin: double
theVMax: double
theTol: double

Return
-------
Bnd_Box

Description
-----------
Compute precise bounding box for surface patch using PSO numerical optimization.
") BoxOptimal;
		Bnd_Box BoxOptimal(double theUMin, double theUMax, double theVMin, double theVMax, double theTol);

		/****** GeomBndLib_OffsetSurface::Geometry ******/
		/****** md5 signature: 1334b5e3ab6aa5df8e1fdcd690d6ff9d ******/
		%feature("compactdefaultargs") Geometry;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom_OffsetSurface>

Description
-----------
No available documentation.
") Geometry;
		const opencascade::handle<Geom_OffsetSurface> & Geometry();

};


%extend GeomBndLib_OffsetSurface {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************
* class GeomBndLib_OtherCurve *
******************************/
%pythonappend GeomBndLib_OtherCurve::GeomBndLib_OtherCurve %{
    self._constructor_args = args
%}
class GeomBndLib_OtherCurve {
	public:
		/****** GeomBndLib_OtherCurve::GeomBndLib_OtherCurve ******/
		/****** md5 signature: 2f3dbc1e8a3c0bbbe5658cd7c24d7ccd ******/
		%feature("compactdefaultargs") GeomBndLib_OtherCurve;
		%feature("autodoc", "
Parameters
----------
theCurve: Adaptor3d_Curve

Return
-------
None

Description
-----------
No available documentation.
") GeomBndLib_OtherCurve;
		 GeomBndLib_OtherCurve(const Adaptor3d_Curve & theCurve);

		/****** GeomBndLib_OtherCurve::Box ******/
		/****** md5 signature: 8e213c1812e4ec1a92dc64878f404c36 ******/
		%feature("compactdefaultargs") Box;
		%feature("autodoc", "
Parameters
----------
theTol: double

Return
-------
Bnd_Box

Description
-----------
Compute bounding box for full curve.
") Box;
		Bnd_Box Box(double theTol);

		/****** GeomBndLib_OtherCurve::Box ******/
		/****** md5 signature: 385b16a150a20485f3d84b859d3fd18f ******/
		%feature("compactdefaultargs") Box;
		%feature("autodoc", "
Parameters
----------
theU1: double
theU2: double
theTol: double

Return
-------
Bnd_Box

Description
-----------
Compute bounding box for arc [theU1, theU2].
") Box;
		Bnd_Box Box(double theU1, double theU2, double theTol);

		/****** GeomBndLib_OtherCurve::BoxOptimal ******/
		/****** md5 signature: 756d212d9dbe194f6e28cd7f7e1195c9 ******/
		%feature("compactdefaultargs") BoxOptimal;
		%feature("autodoc", "
Parameters
----------
theTol: double

Return
-------
Bnd_Box

Description
-----------
Compute precise bounding box for full curve.
") BoxOptimal;
		Bnd_Box BoxOptimal(double theTol);

		/****** GeomBndLib_OtherCurve::BoxOptimal ******/
		/****** md5 signature: e14175b3e4a4a9509a9971714e46a83c ******/
		%feature("compactdefaultargs") BoxOptimal;
		%feature("autodoc", "
Parameters
----------
theU1: double
theU2: double
theTol: double

Return
-------
Bnd_Box

Description
-----------
Compute precise bounding box using PSO + Brent optimization.
") BoxOptimal;
		Bnd_Box BoxOptimal(double theU1, double theU2, double theTol);

};


%extend GeomBndLib_OtherCurve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************
* class GeomBndLib_OtherCurve2d *
********************************/
%pythonappend GeomBndLib_OtherCurve2d::GeomBndLib_OtherCurve2d %{
    self._constructor_args = args
%}
class GeomBndLib_OtherCurve2d {
	public:
		/****** GeomBndLib_OtherCurve2d::GeomBndLib_OtherCurve2d ******/
		/****** md5 signature: 4d6714e40c04e0b7cbae37b84018696b ******/
		%feature("compactdefaultargs") GeomBndLib_OtherCurve2d;
		%feature("autodoc", "
Parameters
----------
theCurve: Adaptor2d_Curve2d

Return
-------
None

Description
-----------
No available documentation.
") GeomBndLib_OtherCurve2d;
		 GeomBndLib_OtherCurve2d(const Adaptor2d_Curve2d & theCurve);

		/****** GeomBndLib_OtherCurve2d::Box ******/
		/****** md5 signature: 67777045e862a77e4ef0f0274513a286 ******/
		%feature("compactdefaultargs") Box;
		%feature("autodoc", "
Parameters
----------
theTol: double

Return
-------
Bnd_Box2d

Description
-----------
Compute bounding box for full curve.
") Box;
		Bnd_Box2d Box(double theTol);

		/****** GeomBndLib_OtherCurve2d::Box ******/
		/****** md5 signature: 6e7a33d7e518329e6c7cef888fb57857 ******/
		%feature("compactdefaultargs") Box;
		%feature("autodoc", "
Parameters
----------
theU1: double
theU2: double
theTol: double

Return
-------
Bnd_Box2d

Description
-----------
Compute bounding box for arc [theU1, theU2].
") Box;
		Bnd_Box2d Box(double theU1, double theU2, double theTol);

		/****** GeomBndLib_OtherCurve2d::BoxOptimal ******/
		/****** md5 signature: 1108a37b85620b4b9d1464431ac807af ******/
		%feature("compactdefaultargs") BoxOptimal;
		%feature("autodoc", "
Parameters
----------
theTol: double

Return
-------
Bnd_Box2d

Description
-----------
Compute precise bounding box for full curve.
") BoxOptimal;
		Bnd_Box2d BoxOptimal(double theTol);

		/****** GeomBndLib_OtherCurve2d::BoxOptimal ******/
		/****** md5 signature: 2e8c0bcd75a33e35d701f16785b70909 ******/
		%feature("compactdefaultargs") BoxOptimal;
		%feature("autodoc", "
Parameters
----------
theU1: double
theU2: double
theTol: double

Return
-------
Bnd_Box2d

Description
-----------
Compute precise bounding box using PSO + Brent optimization.
") BoxOptimal;
		Bnd_Box2d BoxOptimal(double theU1, double theU2, double theTol);

};


%extend GeomBndLib_OtherCurve2d {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************
* class GeomBndLib_OtherSurface *
********************************/
%pythonappend GeomBndLib_OtherSurface::GeomBndLib_OtherSurface %{
    self._constructor_args = args
%}
class GeomBndLib_OtherSurface {
	public:
		/****** GeomBndLib_OtherSurface::GeomBndLib_OtherSurface ******/
		/****** md5 signature: 5a09b4e323e0159a12bcd29eb64ff9de ******/
		%feature("compactdefaultargs") GeomBndLib_OtherSurface;
		%feature("autodoc", "
Parameters
----------
theSurf: Adaptor3d_Surface

Return
-------
None

Description
-----------
No available documentation.
") GeomBndLib_OtherSurface;
		 GeomBndLib_OtherSurface(const Adaptor3d_Surface & theSurf);

		/****** GeomBndLib_OtherSurface::Box ******/
		/****** md5 signature: 8e213c1812e4ec1a92dc64878f404c36 ******/
		%feature("compactdefaultargs") Box;
		%feature("autodoc", "
Parameters
----------
theTol: double

Return
-------
Bnd_Box

Description
-----------
Compute bounding box for full surface.
") Box;
		Bnd_Box Box(double theTol);

		/****** GeomBndLib_OtherSurface::Box ******/
		/****** md5 signature: 5fb9216448b9e30dabaca4078c99f1a8 ******/
		%feature("compactdefaultargs") Box;
		%feature("autodoc", "
Parameters
----------
theUMin: double
theUMax: double
theVMin: double
theVMax: double
theTol: double

Return
-------
Bnd_Box

Description
-----------
Compute bounding box for surface patch [theUMin, theUMax] x [theVMin, theVMax].
") Box;
		Bnd_Box Box(double theUMin, double theUMax, double theVMin, double theVMax, double theTol);

		/****** GeomBndLib_OtherSurface::BoxOptimal ******/
		/****** md5 signature: 756d212d9dbe194f6e28cd7f7e1195c9 ******/
		%feature("compactdefaultargs") BoxOptimal;
		%feature("autodoc", "
Parameters
----------
theTol: double

Return
-------
Bnd_Box

Description
-----------
Compute precise bounding box for full surface.
") BoxOptimal;
		Bnd_Box BoxOptimal(double theTol);

		/****** GeomBndLib_OtherSurface::BoxOptimal ******/
		/****** md5 signature: 21e7055b32fe86aec4e261d9657317ee ******/
		%feature("compactdefaultargs") BoxOptimal;
		%feature("autodoc", "
Parameters
----------
theUMin: double
theUMax: double
theVMin: double
theVMax: double
theTol: double

Return
-------
Bnd_Box

Description
-----------
Compute precise bounding box using PSO + Powell optimization.
") BoxOptimal;
		Bnd_Box BoxOptimal(double theUMin, double theUMax, double theVMin, double theVMax, double theTol);

};


%extend GeomBndLib_OtherSurface {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************
* class GeomBndLib_Parabola *
****************************/
class GeomBndLib_Parabola {
	public:
		/****** GeomBndLib_Parabola::GeomBndLib_Parabola ******/
		/****** md5 signature: 8bffc702b95d52d0e402439f04a42a0a ******/
		%feature("compactdefaultargs") GeomBndLib_Parabola;
		%feature("autodoc", "
Parameters
----------
theParabola: Geom_Parabola

Return
-------
None

Description
-----------
No available documentation.
") GeomBndLib_Parabola;
		 GeomBndLib_Parabola(const opencascade::handle<Geom_Parabola> & theParabola);

		/****** GeomBndLib_Parabola::Box ******/
		/****** md5 signature: 8ef6839c8d750bad7991c14af811523d ******/
		%feature("compactdefaultargs") Box;
		%feature("autodoc", "
Parameters
----------
theU1: double
theU2: double
theTol: double

Return
-------
Bnd_Box

Description
-----------
Compute bounding box for arc [theU1, theU2].
") Box;
		Bnd_Box Box(double theU1, double theU2, double theTol);

		/****** GeomBndLib_Parabola::Box ******/
		/****** md5 signature: d3df0713eb7da30826d22bf110a3c0f7 ******/
		%feature("compactdefaultargs") Box;
		%feature("autodoc", "
Parameters
----------
theTol: double

Return
-------
Bnd_Box

Description
-----------
Compute bounding box for full curve.
") Box;
		Bnd_Box Box(double theTol);

		/****** GeomBndLib_Parabola::Box ******/
		/****** md5 signature: 3960a22dd341ee217eb514d5515c9e74 ******/
		%feature("compactdefaultargs") Box;
		%feature("autodoc", "
Parameters
----------
theParab: gp_Parab
theU1: double
theU2: double
theTol: double

Return
-------
Bnd_Box

Description
-----------
Compute bounding box for a parabola arc [theU1, theU2] defined by gp_Parab.
") Box;
		static Bnd_Box Box(const gp_Parab & theParab, double theU1, double theU2, double theTol);

		/****** GeomBndLib_Parabola::BoxOptimal ******/
		/****** md5 signature: 512d0631d26b1ae9d2aee6ec9a237ea9 ******/
		%feature("compactdefaultargs") BoxOptimal;
		%feature("autodoc", "
Parameters
----------
theU1: double
theU2: double
theTol: double

Return
-------
Bnd_Box

Description
-----------
For analytical curves, BoxOptimal is same as Box.
") BoxOptimal;
		Bnd_Box BoxOptimal(double theU1, double theU2, double theTol);

		/****** GeomBndLib_Parabola::Geometry ******/
		/****** md5 signature: 5a279aa383f70e830ee8b75efb596417 ******/
		%feature("compactdefaultargs") Geometry;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom_Parabola>

Description
-----------
No available documentation.
") Geometry;
		const opencascade::handle<Geom_Parabola> & Geometry();

};


%extend GeomBndLib_Parabola {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************
* class GeomBndLib_Parabola2d *
******************************/
class GeomBndLib_Parabola2d {
	public:
		/****** GeomBndLib_Parabola2d::GeomBndLib_Parabola2d ******/
		/****** md5 signature: 82b3cac403396dddff6cd6af12b59121 ******/
		%feature("compactdefaultargs") GeomBndLib_Parabola2d;
		%feature("autodoc", "
Parameters
----------
theParabola: Geom2d_Parabola

Return
-------
None

Description
-----------
No available documentation.
") GeomBndLib_Parabola2d;
		 GeomBndLib_Parabola2d(const opencascade::handle<Geom2d_Parabola> & theParabola);

		/****** GeomBndLib_Parabola2d::Box ******/
		/****** md5 signature: 204e7692c3fd8c23ef5928c0a0aae32c ******/
		%feature("compactdefaultargs") Box;
		%feature("autodoc", "
Parameters
----------
theU1: double
theU2: double
theTol: double

Return
-------
Bnd_Box2d

Description
-----------
Compute bounding box for arc [theU1, theU2].
") Box;
		Bnd_Box2d Box(double theU1, double theU2, double theTol);

		/****** GeomBndLib_Parabola2d::Box ******/
		/****** md5 signature: 92c11988dccc4e1c999dd2af88fda459 ******/
		%feature("compactdefaultargs") Box;
		%feature("autodoc", "
Parameters
----------
theTol: double

Return
-------
Bnd_Box2d

Description
-----------
Compute bounding box for full curve.
") Box;
		Bnd_Box2d Box(double theTol);

		/****** GeomBndLib_Parabola2d::Box ******/
		/****** md5 signature: 2f56b50cdec68428f05c03c8b707e599 ******/
		%feature("compactdefaultargs") Box;
		%feature("autodoc", "
Parameters
----------
theParab: gp_Parab2d
theU1: double
theU2: double
theTol: double

Return
-------
Bnd_Box2d

Description
-----------
Compute bounding box for a 2D parabola arc [theU1, theU2] defined by gp_Parab2d.
") Box;
		static Bnd_Box2d Box(const gp_Parab2d & theParab, double theU1, double theU2, double theTol);

		/****** GeomBndLib_Parabola2d::BoxOptimal ******/
		/****** md5 signature: 939426dc89c2f53b7d23ecb28602c548 ******/
		%feature("compactdefaultargs") BoxOptimal;
		%feature("autodoc", "
Parameters
----------
theU1: double
theU2: double
theTol: double

Return
-------
Bnd_Box2d

Description
-----------
For analytical curves, BoxOptimal is same as Box.
") BoxOptimal;
		Bnd_Box2d BoxOptimal(double theU1, double theU2, double theTol);

		/****** GeomBndLib_Parabola2d::Geometry ******/
		/****** md5 signature: c69adbc759c5245885a12ed5c0880fbe ******/
		%feature("compactdefaultargs") Geometry;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom2d_Parabola>

Description
-----------
No available documentation.
") Geometry;
		const opencascade::handle<Geom2d_Parabola> & Geometry();

};


%extend GeomBndLib_Parabola2d {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************
* class GeomBndLib_Plane *
*************************/
class GeomBndLib_Plane {
	public:
		/****** GeomBndLib_Plane::GeomBndLib_Plane ******/
		/****** md5 signature: 1359110121da02fd60eed20234728266 ******/
		%feature("compactdefaultargs") GeomBndLib_Plane;
		%feature("autodoc", "
Parameters
----------
thePlane: Geom_Plane

Return
-------
None

Description
-----------
No available documentation.
") GeomBndLib_Plane;
		 GeomBndLib_Plane(const opencascade::handle<Geom_Plane> & thePlane);

		/****** GeomBndLib_Plane::Box ******/
		/****** md5 signature: d3df0713eb7da30826d22bf110a3c0f7 ******/
		%feature("compactdefaultargs") Box;
		%feature("autodoc", "
Parameters
----------
theTol: double

Return
-------
Bnd_Box

Description
-----------
Compute bounding box for full plane (infinite).
") Box;
		Bnd_Box Box(double theTol);

		/****** GeomBndLib_Plane::Box ******/
		/****** md5 signature: 414dcb0368ad538e5898721ab9197632 ******/
		%feature("compactdefaultargs") Box;
		%feature("autodoc", "
Parameters
----------
theUMin: double
theUMax: double
theVMin: double
theVMax: double
theTol: double

Return
-------
Bnd_Box

Description
-----------
Compute bounding box for plane patch [theUMin, theUMax] x [theVMin, theVMax].
") Box;
		Bnd_Box Box(double theUMin, double theUMax, double theVMin, double theVMax, double theTol);

		/****** GeomBndLib_Plane::BoxOptimal ******/
		/****** md5 signature: 7ea06e9d73145e4911239b77a1bcd6eb ******/
		%feature("compactdefaultargs") BoxOptimal;
		%feature("autodoc", "
Parameters
----------
theUMin: double
theUMax: double
theVMin: double
theVMax: double
theTol: double

Return
-------
Bnd_Box

Description
-----------
For analytical surfaces, BoxOptimal is same as Box.
") BoxOptimal;
		Bnd_Box BoxOptimal(double theUMin, double theUMax, double theVMin, double theVMax, double theTol);

		/****** GeomBndLib_Plane::BoxOptimal ******/
		/****** md5 signature: 756d212d9dbe194f6e28cd7f7e1195c9 ******/
		%feature("compactdefaultargs") BoxOptimal;
		%feature("autodoc", "
Parameters
----------
theTol: double

Return
-------
Bnd_Box

Description
-----------
Compute optimal bounding box for full surface.
") BoxOptimal;
		Bnd_Box BoxOptimal(double theTol);

		/****** GeomBndLib_Plane::Geometry ******/
		/****** md5 signature: 2500e974d65f3a32abeaea0318d77597 ******/
		%feature("compactdefaultargs") Geometry;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom_Plane>

Description
-----------
No available documentation.
") Geometry;
		const opencascade::handle<Geom_Plane> & Geometry();

};


%extend GeomBndLib_Plane {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************
* class GeomBndLib_Sphere *
**************************/
class GeomBndLib_Sphere {
	public:
		/****** GeomBndLib_Sphere::GeomBndLib_Sphere ******/
		/****** md5 signature: 14790d69148595a317e73d533f37c813 ******/
		%feature("compactdefaultargs") GeomBndLib_Sphere;
		%feature("autodoc", "
Parameters
----------
theSurf: Geom_SphericalSurface

Return
-------
None

Description
-----------
No available documentation.
") GeomBndLib_Sphere;
		 GeomBndLib_Sphere(const opencascade::handle<Geom_SphericalSurface> & theSurf);

		/****** GeomBndLib_Sphere::Box ******/
		/****** md5 signature: 8e213c1812e4ec1a92dc64878f404c36 ******/
		%feature("compactdefaultargs") Box;
		%feature("autodoc", "
Parameters
----------
theTol: double

Return
-------
Bnd_Box

Description
-----------
Compute bounding box for full sphere.
") Box;
		Bnd_Box Box(double theTol);

		/****** GeomBndLib_Sphere::Box ******/
		/****** md5 signature: 5fb9216448b9e30dabaca4078c99f1a8 ******/
		%feature("compactdefaultargs") Box;
		%feature("autodoc", "
Parameters
----------
theUMin: double
theUMax: double
theVMin: double
theVMax: double
theTol: double

Return
-------
Bnd_Box

Description
-----------
Compute bounding box for sphere patch [theUMin, theUMax] x [theVMin, theVMax].
") Box;
		Bnd_Box Box(double theUMin, double theUMax, double theVMin, double theVMax, double theTol);

		/****** GeomBndLib_Sphere::BoxOptimal ******/
		/****** md5 signature: 7ea06e9d73145e4911239b77a1bcd6eb ******/
		%feature("compactdefaultargs") BoxOptimal;
		%feature("autodoc", "
Parameters
----------
theUMin: double
theUMax: double
theVMin: double
theVMax: double
theTol: double

Return
-------
Bnd_Box

Description
-----------
For analytical surfaces, BoxOptimal is same as Box.
") BoxOptimal;
		Bnd_Box BoxOptimal(double theUMin, double theUMax, double theVMin, double theVMax, double theTol);

		/****** GeomBndLib_Sphere::BoxOptimal ******/
		/****** md5 signature: 756d212d9dbe194f6e28cd7f7e1195c9 ******/
		%feature("compactdefaultargs") BoxOptimal;
		%feature("autodoc", "
Parameters
----------
theTol: double

Return
-------
Bnd_Box

Description
-----------
Compute optimal bounding box for full surface.
") BoxOptimal;
		Bnd_Box BoxOptimal(double theTol);

		/****** GeomBndLib_Sphere::Geometry ******/
		/****** md5 signature: 9675f1509757af4fb44ef9414ec57a1d ******/
		%feature("compactdefaultargs") Geometry;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom_SphericalSurface>

Description
-----------
No available documentation.
") Geometry;
		const opencascade::handle<Geom_SphericalSurface> & Geometry();

};


%extend GeomBndLib_Sphere {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************
* class GeomBndLib_Surface *
***************************/
%pythonappend GeomBndLib_Surface::GeomBndLib_Surface %{
    self._constructor_args = args
%}
class GeomBndLib_Surface {
	public:
		/****** GeomBndLib_Surface::GeomBndLib_Surface ******/
		/****** md5 signature: 29691d6fc76326e7c465998f58cf92cd ******/
		%feature("compactdefaultargs") GeomBndLib_Surface;
		%feature("autodoc", "
Parameters
----------
theSurf: Adaptor3d_Surface

Return
-------
None

Description
-----------
Construct from an adaptor surface.
") GeomBndLib_Surface;
		 GeomBndLib_Surface(const Adaptor3d_Surface & theSurf);

		/****** GeomBndLib_Surface::GeomBndLib_Surface ******/
		/****** md5 signature: 8fa090581fcc3c348b1c2dd2841d25ba ******/
		%feature("compactdefaultargs") GeomBndLib_Surface;
		%feature("autodoc", "
Parameters
----------
theSurf: Geom_Surface

Return
-------
None

Description
-----------
Construct from a Geom_Surface handle.
") GeomBndLib_Surface;
		 GeomBndLib_Surface(const opencascade::handle<Geom_Surface> & theSurf);

		/****** GeomBndLib_Surface::Add ******/
		/****** md5 signature: 17af8bc28711309bba943ceb946398b1 ******/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
theTol: double
theBox: Bnd_Box

Return
-------
None

Description
-----------
Add bounding box for full surface.
") Add;
		void Add(double theTol, Bnd_Box & theBox);

		/****** GeomBndLib_Surface::Add ******/
		/****** md5 signature: 6574f6e41d6f97ba6aaa96202ce920ac ******/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
theUMin: double
theUMax: double
theVMin: double
theVMax: double
theTol: double
theBox: Bnd_Box

Return
-------
None

Description
-----------
Add bounding box for surface patch [theUMin, theUMax] x [theVMin, theVMax].
") Add;
		void Add(double theUMin, double theUMax, double theVMin, double theVMax, double theTol, Bnd_Box & theBox);

		/****** GeomBndLib_Surface::AddOptimal ******/
		/****** md5 signature: d1dd57a302cfac30beecef2777d35532 ******/
		%feature("compactdefaultargs") AddOptimal;
		%feature("autodoc", "
Parameters
----------
theTol: double
theBox: Bnd_Box

Return
-------
None

Description
-----------
Add precise bounding box for full surface.
") AddOptimal;
		void AddOptimal(double theTol, Bnd_Box & theBox);

		/****** GeomBndLib_Surface::AddOptimal ******/
		/****** md5 signature: ffc99f9a05eac9b9e366465e3f07581e ******/
		%feature("compactdefaultargs") AddOptimal;
		%feature("autodoc", "
Parameters
----------
theUMin: double
theUMax: double
theVMin: double
theVMax: double
theTol: double
theBox: Bnd_Box

Return
-------
None

Description
-----------
Add precise bounding box for surface patch [theUMin, theUMax] x [theVMin, theVMax].
") AddOptimal;
		void AddOptimal(double theUMin, double theUMax, double theVMin, double theVMax, double theTol, Bnd_Box & theBox);

		/****** GeomBndLib_Surface::Box ******/
		/****** md5 signature: 8e213c1812e4ec1a92dc64878f404c36 ******/
		%feature("compactdefaultargs") Box;
		%feature("autodoc", "
Parameters
----------
theTol: double

Return
-------
Bnd_Box

Description
-----------
Compute bounding box for full surface.
") Box;
		Bnd_Box Box(double theTol);

		/****** GeomBndLib_Surface::Box ******/
		/****** md5 signature: 5fb9216448b9e30dabaca4078c99f1a8 ******/
		%feature("compactdefaultargs") Box;
		%feature("autodoc", "
Parameters
----------
theUMin: double
theUMax: double
theVMin: double
theVMax: double
theTol: double

Return
-------
Bnd_Box

Description
-----------
Compute bounding box for surface patch [theUMin, theUMax] x [theVMin, theVMax].
") Box;
		Bnd_Box Box(double theUMin, double theUMax, double theVMin, double theVMax, double theTol);

		/****** GeomBndLib_Surface::BoxOptimal ******/
		/****** md5 signature: d39e92310e0e73b2f76900a30e9b4128 ******/
		%feature("compactdefaultargs") BoxOptimal;
		%feature("autodoc", "
Parameters
----------
theTol: double

Return
-------
Bnd_Box

Description
-----------
Compute precise bounding box for full surface.
") BoxOptimal;
		Bnd_Box BoxOptimal(double theTol);

		/****** GeomBndLib_Surface::BoxOptimal ******/
		/****** md5 signature: 21e7055b32fe86aec4e261d9657317ee ******/
		%feature("compactdefaultargs") BoxOptimal;
		%feature("autodoc", "
Parameters
----------
theUMin: double
theUMax: double
theVMin: double
theVMax: double
theTol: double

Return
-------
Bnd_Box

Description
-----------
Compute precise bounding box for surface patch [theUMin, theUMax] x [theVMin, theVMax].
") BoxOptimal;
		Bnd_Box BoxOptimal(double theUMin, double theUMax, double theVMin, double theVMax, double theTol);

		/****** GeomBndLib_Surface::GetType ******/
		/****** md5 signature: 15a6641661caf3717f91dedbeb64f9be ******/
		%feature("compactdefaultargs") GetType;
		%feature("autodoc", "Return
-------
GeomAbs_SurfaceType

Description
-----------
Return detected surface type.
") GetType;
		GeomAbs_SurfaceType GetType();

};


%extend GeomBndLib_Surface {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************************
* class GeomBndLib_SurfaceOfExtrusion *
**************************************/
class GeomBndLib_SurfaceOfExtrusion {
	public:
		/****** GeomBndLib_SurfaceOfExtrusion::GeomBndLib_SurfaceOfExtrusion ******/
		/****** md5 signature: a6296f0aff65eec11ccf0eead8fcf082 ******/
		%feature("compactdefaultargs") GeomBndLib_SurfaceOfExtrusion;
		%feature("autodoc", "
Parameters
----------
theSurf: Geom_SurfaceOfLinearExtrusion

Return
-------
None

Description
-----------
No available documentation.
") GeomBndLib_SurfaceOfExtrusion;
		 GeomBndLib_SurfaceOfExtrusion(const opencascade::handle<Geom_SurfaceOfLinearExtrusion> & theSurf);

		/****** GeomBndLib_SurfaceOfExtrusion::Box ******/
		/****** md5 signature: 8e213c1812e4ec1a92dc64878f404c36 ******/
		%feature("compactdefaultargs") Box;
		%feature("autodoc", "
Parameters
----------
theTol: double

Return
-------
Bnd_Box

Description
-----------
Compute bounding box for full surface.
") Box;
		Bnd_Box Box(double theTol);

		/****** GeomBndLib_SurfaceOfExtrusion::Box ******/
		/****** md5 signature: 5fb9216448b9e30dabaca4078c99f1a8 ******/
		%feature("compactdefaultargs") Box;
		%feature("autodoc", "
Parameters
----------
theUMin: double
theUMax: double
theVMin: double
theVMax: double
theTol: double

Return
-------
Bnd_Box

Description
-----------
Compute bounding box for surface patch [theUMin, theUMax] x [theVMin, theVMax].
") Box;
		Bnd_Box Box(double theUMin, double theUMax, double theVMin, double theVMax, double theTol);

		/****** GeomBndLib_SurfaceOfExtrusion::BoxOptimal ******/
		/****** md5 signature: 21e7055b32fe86aec4e261d9657317ee ******/
		%feature("compactdefaultargs") BoxOptimal;
		%feature("autodoc", "
Parameters
----------
theUMin: double
theUMax: double
theVMin: double
theVMax: double
theTol: double

Return
-------
Bnd_Box

Description
-----------
Compute precise bounding box using tight basis curve bounds.
") BoxOptimal;
		Bnd_Box BoxOptimal(double theUMin, double theUMax, double theVMin, double theVMax, double theTol);

		/****** GeomBndLib_SurfaceOfExtrusion::BoxOptimal ******/
		/****** md5 signature: 756d212d9dbe194f6e28cd7f7e1195c9 ******/
		%feature("compactdefaultargs") BoxOptimal;
		%feature("autodoc", "
Parameters
----------
theTol: double

Return
-------
Bnd_Box

Description
-----------
Compute precise bounding box for full surface.
") BoxOptimal;
		Bnd_Box BoxOptimal(double theTol);

		/****** GeomBndLib_SurfaceOfExtrusion::Geometry ******/
		/****** md5 signature: e9331b9d466af834b541e8248d07e64d ******/
		%feature("compactdefaultargs") Geometry;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom_SurfaceOfLinearExtrusion>

Description
-----------
No available documentation.
") Geometry;
		const opencascade::handle<Geom_SurfaceOfLinearExtrusion> & Geometry();

};


%extend GeomBndLib_SurfaceOfExtrusion {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************************
* class GeomBndLib_SurfaceOfRevolution *
***************************************/
class GeomBndLib_SurfaceOfRevolution {
	public:
		/****** GeomBndLib_SurfaceOfRevolution::GeomBndLib_SurfaceOfRevolution ******/
		/****** md5 signature: a5ed052ba6087219abeba60cf9c51dcc ******/
		%feature("compactdefaultargs") GeomBndLib_SurfaceOfRevolution;
		%feature("autodoc", "
Parameters
----------
theSurf: Geom_SurfaceOfRevolution

Return
-------
None

Description
-----------
No available documentation.
") GeomBndLib_SurfaceOfRevolution;
		 GeomBndLib_SurfaceOfRevolution(const opencascade::handle<Geom_SurfaceOfRevolution> & theSurf);

		/****** GeomBndLib_SurfaceOfRevolution::Box ******/
		/****** md5 signature: 8e213c1812e4ec1a92dc64878f404c36 ******/
		%feature("compactdefaultargs") Box;
		%feature("autodoc", "
Parameters
----------
theTol: double

Return
-------
Bnd_Box

Description
-----------
Compute bounding box for full surface.
") Box;
		Bnd_Box Box(double theTol);

		/****** GeomBndLib_SurfaceOfRevolution::Box ******/
		/****** md5 signature: 5fb9216448b9e30dabaca4078c99f1a8 ******/
		%feature("compactdefaultargs") Box;
		%feature("autodoc", "
Parameters
----------
theUMin: double
theUMax: double
theVMin: double
theVMax: double
theTol: double

Return
-------
Bnd_Box

Description
-----------
Compute bounding box for surface patch [theUMin, theUMax] x [theVMin, theVMax].
") Box;
		Bnd_Box Box(double theUMin, double theUMax, double theVMin, double theVMax, double theTol);

		/****** GeomBndLib_SurfaceOfRevolution::BoxOptimal ******/
		/****** md5 signature: 21e7055b32fe86aec4e261d9657317ee ******/
		%feature("compactdefaultargs") BoxOptimal;
		%feature("autodoc", "
Parameters
----------
theUMin: double
theUMax: double
theVMin: double
theVMax: double
theTol: double

Return
-------
Bnd_Box

Description
-----------
Compute precise bounding box using tight basis curve bounds.
") BoxOptimal;
		Bnd_Box BoxOptimal(double theUMin, double theUMax, double theVMin, double theVMax, double theTol);

		/****** GeomBndLib_SurfaceOfRevolution::BoxOptimal ******/
		/****** md5 signature: 756d212d9dbe194f6e28cd7f7e1195c9 ******/
		%feature("compactdefaultargs") BoxOptimal;
		%feature("autodoc", "
Parameters
----------
theTol: double

Return
-------
Bnd_Box

Description
-----------
Compute precise bounding box for full surface.
") BoxOptimal;
		Bnd_Box BoxOptimal(double theTol);

		/****** GeomBndLib_SurfaceOfRevolution::Geometry ******/
		/****** md5 signature: a08036bdce0016901e67ed8a54105fd6 ******/
		%feature("compactdefaultargs") Geometry;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom_SurfaceOfRevolution>

Description
-----------
No available documentation.
") Geometry;
		const opencascade::handle<Geom_SurfaceOfRevolution> & Geometry();

};


%extend GeomBndLib_SurfaceOfRevolution {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************
* class GeomBndLib_Torus *
*************************/
class GeomBndLib_Torus {
	public:
		/****** GeomBndLib_Torus::GeomBndLib_Torus ******/
		/****** md5 signature: 78a2ff44d9c598b9293da821f353e6a3 ******/
		%feature("compactdefaultargs") GeomBndLib_Torus;
		%feature("autodoc", "
Parameters
----------
theSurf: Geom_ToroidalSurface

Return
-------
None

Description
-----------
No available documentation.
") GeomBndLib_Torus;
		 GeomBndLib_Torus(const opencascade::handle<Geom_ToroidalSurface> & theSurf);

		/****** GeomBndLib_Torus::Box ******/
		/****** md5 signature: 8e213c1812e4ec1a92dc64878f404c36 ******/
		%feature("compactdefaultargs") Box;
		%feature("autodoc", "
Parameters
----------
theTol: double

Return
-------
Bnd_Box

Description
-----------
Compute bounding box for full torus.
") Box;
		Bnd_Box Box(double theTol);

		/****** GeomBndLib_Torus::Box ******/
		/****** md5 signature: 5fb9216448b9e30dabaca4078c99f1a8 ******/
		%feature("compactdefaultargs") Box;
		%feature("autodoc", "
Parameters
----------
theUMin: double
theUMax: double
theVMin: double
theVMax: double
theTol: double

Return
-------
Bnd_Box

Description
-----------
Compute bounding box for torus patch [theUMin, theUMax] x [theVMin, theVMax].
") Box;
		Bnd_Box Box(double theUMin, double theUMax, double theVMin, double theVMax, double theTol);

		/****** GeomBndLib_Torus::BoxOptimal ******/
		/****** md5 signature: 21e7055b32fe86aec4e261d9657317ee ******/
		%feature("compactdefaultargs") BoxOptimal;
		%feature("autodoc", "
Parameters
----------
theUMin: double
theUMax: double
theVMin: double
theVMax: double
theTol: double

Return
-------
Bnd_Box

Description
-----------
Compute precise bounding box for torus patch using PSO + Powell optimization.
") BoxOptimal;
		Bnd_Box BoxOptimal(double theUMin, double theUMax, double theVMin, double theVMax, double theTol);

		/****** GeomBndLib_Torus::BoxOptimal ******/
		/****** md5 signature: d39e92310e0e73b2f76900a30e9b4128 ******/
		%feature("compactdefaultargs") BoxOptimal;
		%feature("autodoc", "
Parameters
----------
theTol: double

Return
-------
Bnd_Box

Description
-----------
Compute precise bounding box for full torus.
") BoxOptimal;
		Bnd_Box BoxOptimal(double theTol);

		/****** GeomBndLib_Torus::Geometry ******/
		/****** md5 signature: 47e80b2312a9f1c9162e150a06fccdf2 ******/
		%feature("compactdefaultargs") Geometry;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom_ToroidalSurface>

Description
-----------
No available documentation.
") Geometry;
		const opencascade::handle<Geom_ToroidalSurface> & Geometry();

};


%extend GeomBndLib_Torus {
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
def GeomBndLib_Circle_Box(*args):
	return GeomBndLib_Circle.Box(*args)

@deprecated
def GeomBndLib_Circle_Box(*args):
	return GeomBndLib_Circle.Box(*args)

@deprecated
def GeomBndLib_Circle2d_Box(*args):
	return GeomBndLib_Circle2d.Box(*args)

@deprecated
def GeomBndLib_Circle2d_Box(*args):
	return GeomBndLib_Circle2d.Box(*args)

@deprecated
def GeomBndLib_Ellipse_Box(*args):
	return GeomBndLib_Ellipse.Box(*args)

@deprecated
def GeomBndLib_Ellipse_Box(*args):
	return GeomBndLib_Ellipse.Box(*args)

@deprecated
def GeomBndLib_Ellipse2d_Box(*args):
	return GeomBndLib_Ellipse2d.Box(*args)

@deprecated
def GeomBndLib_Ellipse2d_Box(*args):
	return GeomBndLib_Ellipse2d.Box(*args)

@deprecated
def GeomBndLib_Hyperbola_Box(*args):
	return GeomBndLib_Hyperbola.Box(*args)

@deprecated
def GeomBndLib_Hyperbola2d_Box(*args):
	return GeomBndLib_Hyperbola2d.Box(*args)

@deprecated
def GeomBndLib_Line_Box(*args):
	return GeomBndLib_Line.Box(*args)

@deprecated
def GeomBndLib_Line2d_Box(*args):
	return GeomBndLib_Line2d.Box(*args)

@deprecated
def GeomBndLib_Parabola_Box(*args):
	return GeomBndLib_Parabola.Box(*args)

@deprecated
def GeomBndLib_Parabola2d_Box(*args):
	return GeomBndLib_Parabola2d.Box(*args)

}
