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
%define GEOMEVALUATORDOCSTRING
"GeomEvaluator module, see official documentation at
https://dev.opencascade.org/doc/occt-7.8.0/refman/html/package_geomevaluator.html"
%enddef
%module (package="OCC.Core", docstring=GEOMEVALUATORDOCSTRING) GeomEvaluator


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
#include<GeomEvaluator_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<gp_module.hxx>
#include<Geom_module.hxx>
#include<GeomAdaptor_module.hxx>
#include<Adaptor3d_module.hxx>
#include<Geom2d_module.hxx>
#include<Adaptor2d_module.hxx>
#include<GeomAdaptor_module.hxx>
#include<Message_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import gp.i
%import Geom.i
%import GeomAdaptor.i
%import Adaptor3d.i

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
%wrap_handle(GeomEvaluator_Curve)
%wrap_handle(GeomEvaluator_Surface)
%wrap_handle(GeomEvaluator_OffsetCurve)
%wrap_handle(GeomEvaluator_OffsetSurface)
%wrap_handle(GeomEvaluator_SurfaceOfExtrusion)
%wrap_handle(GeomEvaluator_SurfaceOfRevolution)
/* end handles declaration */

/* templates */
/* end templates declaration */

/* typedefs */
/* end typedefs declaration */

/****************************
* class GeomEvaluator_Curve *
****************************/
%nodefaultctor GeomEvaluator_Curve;
class GeomEvaluator_Curve : public Standard_Transient {
	public:
		/****** GeomEvaluator_Curve::D0 ******/
		/****** md5 signature: 746da35370896ff17a6001b63a637f21 ******/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "
Parameters
----------
theU: float
theValue: gp_Pnt

Return
-------
None

Description
-----------
Value of 3D curve.
") D0;
		virtual void D0(const Standard_Real theU, gp_Pnt & theValue);

		/****** GeomEvaluator_Curve::D1 ******/
		/****** md5 signature: bc585642e9efc7f923dc9609fa8449f9 ******/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "
Parameters
----------
theU: float
theValue: gp_Pnt
theD1: gp_Vec

Return
-------
None

Description
-----------
Value and first derivatives of curve.
") D1;
		virtual void D1(const Standard_Real theU, gp_Pnt & theValue, gp_Vec & theD1);

		/****** GeomEvaluator_Curve::D2 ******/
		/****** md5 signature: be5ad77d75f0e9e83b09cafed5376e77 ******/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "
Parameters
----------
theU: float
theValue: gp_Pnt
theD1: gp_Vec
theD2: gp_Vec

Return
-------
None

Description
-----------
Value, first and second derivatives of curve.
") D2;
		virtual void D2(const Standard_Real theU, gp_Pnt & theValue, gp_Vec & theD1, gp_Vec & theD2);

		/****** GeomEvaluator_Curve::D3 ******/
		/****** md5 signature: 3cdcd7f890afa95c2858b7b1185c95dd ******/
		%feature("compactdefaultargs") D3;
		%feature("autodoc", "
Parameters
----------
theU: float
theValue: gp_Pnt
theD1: gp_Vec
theD2: gp_Vec
theD3: gp_Vec

Return
-------
None

Description
-----------
Value, first, second and third derivatives of curve.
") D3;
		virtual void D3(const Standard_Real theU, gp_Pnt & theValue, gp_Vec & theD1, gp_Vec & theD2, gp_Vec & theD3);

		/****** GeomEvaluator_Curve::DN ******/
		/****** md5 signature: e534d902338ab19561f4b339de53b57d ******/
		%feature("compactdefaultargs") DN;
		%feature("autodoc", "
Parameters
----------
theU: float
theDerU: int

Return
-------
gp_Vec

Description
-----------
Calculates N-th derivatives of curve, where N = theDerU. Raises if N < 1.
") DN;
		virtual gp_Vec DN(const Standard_Real theU, const Standard_Integer theDerU);

		/****** GeomEvaluator_Curve::ShallowCopy ******/
		/****** md5 signature: fe124b26167bed39ff3eec7e218a1392 ******/
		%feature("compactdefaultargs") ShallowCopy;
		%feature("autodoc", "Return
-------
opencascade::handle<GeomEvaluator_Curve>

Description
-----------
No available documentation.
") ShallowCopy;
		virtual opencascade::handle<GeomEvaluator_Curve> ShallowCopy();

};


%make_alias(GeomEvaluator_Curve)

%extend GeomEvaluator_Curve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************
* class GeomEvaluator_Surface *
******************************/
%nodefaultctor GeomEvaluator_Surface;
class GeomEvaluator_Surface : public Standard_Transient {
	public:
		/****** GeomEvaluator_Surface::D0 ******/
		/****** md5 signature: 28f3f8227c1f19f0ca123dc63d72beab ******/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "
Parameters
----------
theU: float
theV: float
theValue: gp_Pnt

Return
-------
None

Description
-----------
Value of surface.
") D0;
		virtual void D0(const Standard_Real theU, const Standard_Real theV, gp_Pnt & theValue);

		/****** GeomEvaluator_Surface::D1 ******/
		/****** md5 signature: d72b3ce46e021168c8c8908d8a0f8f5f ******/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "
Parameters
----------
theU: float
theV: float
theValue: gp_Pnt
theD1U: gp_Vec
theD1V: gp_Vec

Return
-------
None

Description
-----------
Value and first derivatives of surface.
") D1;
		virtual void D1(const Standard_Real theU, const Standard_Real theV, gp_Pnt & theValue, gp_Vec & theD1U, gp_Vec & theD1V);

		/****** GeomEvaluator_Surface::D2 ******/
		/****** md5 signature: 80dee925b5bda94bb05a95824c3ab611 ******/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "
Parameters
----------
theU: float
theV: float
theValue: gp_Pnt
theD1U: gp_Vec
theD1V: gp_Vec
theD2U: gp_Vec
theD2V: gp_Vec
theD2UV: gp_Vec

Return
-------
None

Description
-----------
Value, first and second derivatives of surface.
") D2;
		virtual void D2(const Standard_Real theU, const Standard_Real theV, gp_Pnt & theValue, gp_Vec & theD1U, gp_Vec & theD1V, gp_Vec & theD2U, gp_Vec & theD2V, gp_Vec & theD2UV);

		/****** GeomEvaluator_Surface::D3 ******/
		/****** md5 signature: d0a97233c6a934217820824209e6d50a ******/
		%feature("compactdefaultargs") D3;
		%feature("autodoc", "
Parameters
----------
theU: float
theV: float
theValue: gp_Pnt
theD1U: gp_Vec
theD1V: gp_Vec
theD2U: gp_Vec
theD2V: gp_Vec
theD2UV: gp_Vec
theD3U: gp_Vec
theD3V: gp_Vec
theD3UUV: gp_Vec
theD3UVV: gp_Vec

Return
-------
None

Description
-----------
Value, first, second and third derivatives of surface.
") D3;
		virtual void D3(const Standard_Real theU, const Standard_Real theV, gp_Pnt & theValue, gp_Vec & theD1U, gp_Vec & theD1V, gp_Vec & theD2U, gp_Vec & theD2V, gp_Vec & theD2UV, gp_Vec & theD3U, gp_Vec & theD3V, gp_Vec & theD3UUV, gp_Vec & theD3UVV);

		/****** GeomEvaluator_Surface::DN ******/
		/****** md5 signature: 5435d2f1e43ba841a8a8a3814f03c6cb ******/
		%feature("compactdefaultargs") DN;
		%feature("autodoc", "
Parameters
----------
theU: float
theV: float
theDerU: int
theDerV: int

Return
-------
gp_Vec

Description
-----------
Calculates N-th derivatives of surface, where N = theDerU + theDerV. //! Raises if N < 1 or theDerU < 0 or theDerV < 0.
") DN;
		virtual gp_Vec DN(const Standard_Real theU, const Standard_Real theV, const Standard_Integer theDerU, const Standard_Integer theDerV);

		/****** GeomEvaluator_Surface::ShallowCopy ******/
		/****** md5 signature: ac67d92775466f864dab9cc14e400cb7 ******/
		%feature("compactdefaultargs") ShallowCopy;
		%feature("autodoc", "Return
-------
opencascade::handle<GeomEvaluator_Surface>

Description
-----------
No available documentation.
") ShallowCopy;
		virtual opencascade::handle<GeomEvaluator_Surface> ShallowCopy();

};


%make_alias(GeomEvaluator_Surface)

%extend GeomEvaluator_Surface {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************************
* class GeomEvaluator_OffsetCurve *
**********************************/
class GeomEvaluator_OffsetCurve : public GeomEvaluator_Curve {
	public:
		/****** GeomEvaluator_OffsetCurve::GeomEvaluator_OffsetCurve ******/
		/****** md5 signature: 2566a84ab011d3456edd3ecfeed95ade ******/
		%feature("compactdefaultargs") GeomEvaluator_OffsetCurve;
		%feature("autodoc", "
Parameters
----------
theBase: Geom_Curve
theOffset: float
theDirection: gp_Dir

Return
-------
None

Description
-----------
Initialize evaluator by curve.
") GeomEvaluator_OffsetCurve;
		 GeomEvaluator_OffsetCurve(const opencascade::handle<Geom_Curve> & theBase, const Standard_Real theOffset, const gp_Dir & theDirection);

		/****** GeomEvaluator_OffsetCurve::GeomEvaluator_OffsetCurve ******/
		/****** md5 signature: 8420eeb2fd48f6a959e9185e74f5fbe5 ******/
		%feature("compactdefaultargs") GeomEvaluator_OffsetCurve;
		%feature("autodoc", "
Parameters
----------
theBase: GeomAdaptor_Curve
theOffset: float
theDirection: gp_Dir

Return
-------
None

Description
-----------
Initialize evaluator by curve adaptor.
") GeomEvaluator_OffsetCurve;
		 GeomEvaluator_OffsetCurve(const opencascade::handle<GeomAdaptor_Curve> & theBase, const Standard_Real theOffset, const gp_Dir & theDirection);

		/****** GeomEvaluator_OffsetCurve::D0 ******/
		/****** md5 signature: 66474176b3d6e773fa82e2e75db9adbb ******/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "
Parameters
----------
theU: float
theValue: gp_Pnt

Return
-------
None

Description
-----------
Value of curve.
") D0;
		void D0(const Standard_Real theU, gp_Pnt & theValue);

		/****** GeomEvaluator_OffsetCurve::D1 ******/
		/****** md5 signature: e96d41cf42350bc1dcbb7992bfffd9ec ******/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "
Parameters
----------
theU: float
theValue: gp_Pnt
theD1: gp_Vec

Return
-------
None

Description
-----------
Value and first derivatives of curve.
") D1;
		void D1(const Standard_Real theU, gp_Pnt & theValue, gp_Vec & theD1);

		/****** GeomEvaluator_OffsetCurve::D2 ******/
		/****** md5 signature: 23e61b74d05ad8f718526eefa7754d47 ******/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "
Parameters
----------
theU: float
theValue: gp_Pnt
theD1: gp_Vec
theD2: gp_Vec

Return
-------
None

Description
-----------
Value, first and second derivatives of curve.
") D2;
		void D2(const Standard_Real theU, gp_Pnt & theValue, gp_Vec & theD1, gp_Vec & theD2);

		/****** GeomEvaluator_OffsetCurve::D3 ******/
		/****** md5 signature: 989c0f9e45a005ca9fa4652fb525a4e3 ******/
		%feature("compactdefaultargs") D3;
		%feature("autodoc", "
Parameters
----------
theU: float
theValue: gp_Pnt
theD1: gp_Vec
theD2: gp_Vec
theD3: gp_Vec

Return
-------
None

Description
-----------
Value, first, second and third derivatives of curve.
") D3;
		void D3(const Standard_Real theU, gp_Pnt & theValue, gp_Vec & theD1, gp_Vec & theD2, gp_Vec & theD3);

		/****** GeomEvaluator_OffsetCurve::DN ******/
		/****** md5 signature: ed7b981f4c22948574d702d532333fea ******/
		%feature("compactdefaultargs") DN;
		%feature("autodoc", "
Parameters
----------
theU: float
theDeriv: int

Return
-------
gp_Vec

Description
-----------
Calculates N-th derivatives of curve, where N = theDeriv. Raises if N < 1.
") DN;
		gp_Vec DN(const Standard_Real theU, const Standard_Integer theDeriv);

		/****** GeomEvaluator_OffsetCurve::SetOffsetDirection ******/
		/****** md5 signature: 17569b0102b44b0960ea08936e2845af ******/
		%feature("compactdefaultargs") SetOffsetDirection;
		%feature("autodoc", "
Parameters
----------
theDirection: gp_Dir

Return
-------
None

Description
-----------
No available documentation.
") SetOffsetDirection;
		void SetOffsetDirection(const gp_Dir & theDirection);

		/****** GeomEvaluator_OffsetCurve::SetOffsetValue ******/
		/****** md5 signature: 548afc85f8e72630a916fe190a2fc526 ******/
		%feature("compactdefaultargs") SetOffsetValue;
		%feature("autodoc", "
Parameters
----------
theOffset: float

Return
-------
None

Description
-----------
Change the offset value.
") SetOffsetValue;
		void SetOffsetValue(Standard_Real theOffset);

		/****** GeomEvaluator_OffsetCurve::ShallowCopy ******/
		/****** md5 signature: 3f4f479803591b29cc1a58914798e6e1 ******/
		%feature("compactdefaultargs") ShallowCopy;
		%feature("autodoc", "Return
-------
opencascade::handle<GeomEvaluator_Curve>

Description
-----------
No available documentation.
") ShallowCopy;
		virtual opencascade::handle<GeomEvaluator_Curve> ShallowCopy();

};


%make_alias(GeomEvaluator_OffsetCurve)

%extend GeomEvaluator_OffsetCurve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************************
* class GeomEvaluator_OffsetSurface *
************************************/
class GeomEvaluator_OffsetSurface : public GeomEvaluator_Surface {
	public:
		/****** GeomEvaluator_OffsetSurface::GeomEvaluator_OffsetSurface ******/
		/****** md5 signature: 4d7c3bf711d1b6d259802ef57b452513 ******/
		%feature("compactdefaultargs") GeomEvaluator_OffsetSurface;
		%feature("autodoc", "
Parameters
----------
theBase: Geom_Surface
theOffset: float
theOscSurf: Geom_OsculatingSurface (optional, default to opencascade::handle<Geom_OsculatingSurface>())

Return
-------
None

Description
-----------
Initialize evaluator by surface.
") GeomEvaluator_OffsetSurface;
		 GeomEvaluator_OffsetSurface(const opencascade::handle<Geom_Surface> & theBase, const Standard_Real theOffset, const opencascade::handle<Geom_OsculatingSurface> & theOscSurf = opencascade::handle<Geom_OsculatingSurface>());

		/****** GeomEvaluator_OffsetSurface::GeomEvaluator_OffsetSurface ******/
		/****** md5 signature: e3bc6f3b2d5210513e3b544eee3ebaa6 ******/
		%feature("compactdefaultargs") GeomEvaluator_OffsetSurface;
		%feature("autodoc", "
Parameters
----------
theBase: GeomAdaptor_Surface
theOffset: float
theOscSurf: Geom_OsculatingSurface (optional, default to opencascade::handle<Geom_OsculatingSurface>())

Return
-------
None

Description
-----------
Initialize evaluator by surface adaptor.
") GeomEvaluator_OffsetSurface;
		 GeomEvaluator_OffsetSurface(const opencascade::handle<GeomAdaptor_Surface> & theBase, const Standard_Real theOffset, const opencascade::handle<Geom_OsculatingSurface> & theOscSurf = opencascade::handle<Geom_OsculatingSurface>());

		/****** GeomEvaluator_OffsetSurface::D0 ******/
		/****** md5 signature: 2d6a7e09cbdc01a4df050802195d3171 ******/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "
Parameters
----------
theU: float
theV: float
theValue: gp_Pnt

Return
-------
None

Description
-----------
Value of surface.
") D0;
		void D0(const Standard_Real theU, const Standard_Real theV, gp_Pnt & theValue);

		/****** GeomEvaluator_OffsetSurface::D1 ******/
		/****** md5 signature: 3b3d2c9c0dc9beb616d2945ae2a7c9c7 ******/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "
Parameters
----------
theU: float
theV: float
theValue: gp_Pnt
theD1U: gp_Vec
theD1V: gp_Vec

Return
-------
None

Description
-----------
Value and first derivatives of surface.
") D1;
		void D1(const Standard_Real theU, const Standard_Real theV, gp_Pnt & theValue, gp_Vec & theD1U, gp_Vec & theD1V);

		/****** GeomEvaluator_OffsetSurface::D2 ******/
		/****** md5 signature: aac577d0db0df7fbead5f8a72afb2a29 ******/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "
Parameters
----------
theU: float
theV: float
theValue: gp_Pnt
theD1U: gp_Vec
theD1V: gp_Vec
theD2U: gp_Vec
theD2V: gp_Vec
theD2UV: gp_Vec

Return
-------
None

Description
-----------
Value, first and second derivatives of surface.
") D2;
		void D2(const Standard_Real theU, const Standard_Real theV, gp_Pnt & theValue, gp_Vec & theD1U, gp_Vec & theD1V, gp_Vec & theD2U, gp_Vec & theD2V, gp_Vec & theD2UV);

		/****** GeomEvaluator_OffsetSurface::D3 ******/
		/****** md5 signature: c38285b0561ae3aedece5bc2ddb140bc ******/
		%feature("compactdefaultargs") D3;
		%feature("autodoc", "
Parameters
----------
theU: float
theV: float
theValue: gp_Pnt
theD1U: gp_Vec
theD1V: gp_Vec
theD2U: gp_Vec
theD2V: gp_Vec
theD2UV: gp_Vec
theD3U: gp_Vec
theD3V: gp_Vec
theD3UUV: gp_Vec
theD3UVV: gp_Vec

Return
-------
None

Description
-----------
Value, first, second and third derivatives of surface.
") D3;
		void D3(const Standard_Real theU, const Standard_Real theV, gp_Pnt & theValue, gp_Vec & theD1U, gp_Vec & theD1V, gp_Vec & theD2U, gp_Vec & theD2V, gp_Vec & theD2UV, gp_Vec & theD3U, gp_Vec & theD3V, gp_Vec & theD3UUV, gp_Vec & theD3UVV);

		/****** GeomEvaluator_OffsetSurface::DN ******/
		/****** md5 signature: 2f26fde6dd2535ddcb6fdca1b00f06c7 ******/
		%feature("compactdefaultargs") DN;
		%feature("autodoc", "
Parameters
----------
theU: float
theV: float
theDerU: int
theDerV: int

Return
-------
gp_Vec

Description
-----------
Calculates N-th derivatives of surface, where N = theDerU + theDerV. //! Raises if N < 1 or theDerU < 0 or theDerV < 0.
") DN;
		gp_Vec DN(const Standard_Real theU, const Standard_Real theV, const Standard_Integer theDerU, const Standard_Integer theDerV);

		/****** GeomEvaluator_OffsetSurface::SetOffsetValue ******/
		/****** md5 signature: 548afc85f8e72630a916fe190a2fc526 ******/
		%feature("compactdefaultargs") SetOffsetValue;
		%feature("autodoc", "
Parameters
----------
theOffset: float

Return
-------
None

Description
-----------
Change the offset value.
") SetOffsetValue;
		void SetOffsetValue(Standard_Real theOffset);

		/****** GeomEvaluator_OffsetSurface::ShallowCopy ******/
		/****** md5 signature: fbd80b36cea42259d24868636d99709b ******/
		%feature("compactdefaultargs") ShallowCopy;
		%feature("autodoc", "Return
-------
opencascade::handle<GeomEvaluator_Surface>

Description
-----------
No available documentation.
") ShallowCopy;
		opencascade::handle<GeomEvaluator_Surface> ShallowCopy();

};


%make_alias(GeomEvaluator_OffsetSurface)

%extend GeomEvaluator_OffsetSurface {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************************
* class GeomEvaluator_SurfaceOfExtrusion *
*****************************************/
class GeomEvaluator_SurfaceOfExtrusion : public GeomEvaluator_Surface {
	public:
		/****** GeomEvaluator_SurfaceOfExtrusion::GeomEvaluator_SurfaceOfExtrusion ******/
		/****** md5 signature: 027d7da117e9a6df658ed7f2f2a87e3f ******/
		%feature("compactdefaultargs") GeomEvaluator_SurfaceOfExtrusion;
		%feature("autodoc", "
Parameters
----------
theBase: Geom_Curve
theExtrusionDir: gp_Dir

Return
-------
None

Description
-----------
Initialize evaluator by surface.
") GeomEvaluator_SurfaceOfExtrusion;
		 GeomEvaluator_SurfaceOfExtrusion(const opencascade::handle<Geom_Curve> & theBase, const gp_Dir & theExtrusionDir);

		/****** GeomEvaluator_SurfaceOfExtrusion::GeomEvaluator_SurfaceOfExtrusion ******/
		/****** md5 signature: e3cfee6ab38d3d48bacd1ea362d5426a ******/
		%feature("compactdefaultargs") GeomEvaluator_SurfaceOfExtrusion;
		%feature("autodoc", "
Parameters
----------
theBase: Adaptor3d_Curve
theExtrusionDir: gp_Dir

Return
-------
None

Description
-----------
Initialize evaluator by surface adaptor.
") GeomEvaluator_SurfaceOfExtrusion;
		 GeomEvaluator_SurfaceOfExtrusion(const opencascade::handle<Adaptor3d_Curve> & theBase, const gp_Dir & theExtrusionDir);

		/****** GeomEvaluator_SurfaceOfExtrusion::D0 ******/
		/****** md5 signature: 2d6a7e09cbdc01a4df050802195d3171 ******/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "
Parameters
----------
theU: float
theV: float
theValue: gp_Pnt

Return
-------
None

Description
-----------
Value of surface.
") D0;
		void D0(const Standard_Real theU, const Standard_Real theV, gp_Pnt & theValue);

		/****** GeomEvaluator_SurfaceOfExtrusion::D1 ******/
		/****** md5 signature: 3b3d2c9c0dc9beb616d2945ae2a7c9c7 ******/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "
Parameters
----------
theU: float
theV: float
theValue: gp_Pnt
theD1U: gp_Vec
theD1V: gp_Vec

Return
-------
None

Description
-----------
Value and first derivatives of surface.
") D1;
		void D1(const Standard_Real theU, const Standard_Real theV, gp_Pnt & theValue, gp_Vec & theD1U, gp_Vec & theD1V);

		/****** GeomEvaluator_SurfaceOfExtrusion::D2 ******/
		/****** md5 signature: aac577d0db0df7fbead5f8a72afb2a29 ******/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "
Parameters
----------
theU: float
theV: float
theValue: gp_Pnt
theD1U: gp_Vec
theD1V: gp_Vec
theD2U: gp_Vec
theD2V: gp_Vec
theD2UV: gp_Vec

Return
-------
None

Description
-----------
Value, first and second derivatives of surface.
") D2;
		void D2(const Standard_Real theU, const Standard_Real theV, gp_Pnt & theValue, gp_Vec & theD1U, gp_Vec & theD1V, gp_Vec & theD2U, gp_Vec & theD2V, gp_Vec & theD2UV);

		/****** GeomEvaluator_SurfaceOfExtrusion::D3 ******/
		/****** md5 signature: c38285b0561ae3aedece5bc2ddb140bc ******/
		%feature("compactdefaultargs") D3;
		%feature("autodoc", "
Parameters
----------
theU: float
theV: float
theValue: gp_Pnt
theD1U: gp_Vec
theD1V: gp_Vec
theD2U: gp_Vec
theD2V: gp_Vec
theD2UV: gp_Vec
theD3U: gp_Vec
theD3V: gp_Vec
theD3UUV: gp_Vec
theD3UVV: gp_Vec

Return
-------
None

Description
-----------
Value, first, second and third derivatives of surface.
") D3;
		void D3(const Standard_Real theU, const Standard_Real theV, gp_Pnt & theValue, gp_Vec & theD1U, gp_Vec & theD1V, gp_Vec & theD2U, gp_Vec & theD2V, gp_Vec & theD2UV, gp_Vec & theD3U, gp_Vec & theD3V, gp_Vec & theD3UUV, gp_Vec & theD3UVV);

		/****** GeomEvaluator_SurfaceOfExtrusion::DN ******/
		/****** md5 signature: 2f26fde6dd2535ddcb6fdca1b00f06c7 ******/
		%feature("compactdefaultargs") DN;
		%feature("autodoc", "
Parameters
----------
theU: float
theV: float
theDerU: int
theDerV: int

Return
-------
gp_Vec

Description
-----------
Calculates N-th derivatives of surface, where N = theDerU + theDerV. //! Raises if N < 1 or theDerU < 0 or theDerV < 0.
") DN;
		gp_Vec DN(const Standard_Real theU, const Standard_Real theV, const Standard_Integer theDerU, const Standard_Integer theDerV);

		/****** GeomEvaluator_SurfaceOfExtrusion::SetDirection ******/
		/****** md5 signature: 03e096726d774182cbdd6e00d0d20499 ******/
		%feature("compactdefaultargs") SetDirection;
		%feature("autodoc", "
Parameters
----------
theDirection: gp_Dir

Return
-------
None

Description
-----------
/Changes the direction of extrusion.
") SetDirection;
		void SetDirection(const gp_Dir & theDirection);

		/****** GeomEvaluator_SurfaceOfExtrusion::ShallowCopy ******/
		/****** md5 signature: fbd80b36cea42259d24868636d99709b ******/
		%feature("compactdefaultargs") ShallowCopy;
		%feature("autodoc", "Return
-------
opencascade::handle<GeomEvaluator_Surface>

Description
-----------
No available documentation.
") ShallowCopy;
		opencascade::handle<GeomEvaluator_Surface> ShallowCopy();

};


%make_alias(GeomEvaluator_SurfaceOfExtrusion)

%extend GeomEvaluator_SurfaceOfExtrusion {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************************
* class GeomEvaluator_SurfaceOfRevolution *
******************************************/
class GeomEvaluator_SurfaceOfRevolution : public GeomEvaluator_Surface {
	public:
		/****** GeomEvaluator_SurfaceOfRevolution::GeomEvaluator_SurfaceOfRevolution ******/
		/****** md5 signature: 8832b9c3887d3ff766e516c6cd21463d ******/
		%feature("compactdefaultargs") GeomEvaluator_SurfaceOfRevolution;
		%feature("autodoc", "
Parameters
----------
theBase: Geom_Curve
theRevolDir: gp_Dir
theRevolLoc: gp_Pnt

Return
-------
None

Description
-----------
Initialize evaluator by revolved curve, the axis of revolution and the location.
") GeomEvaluator_SurfaceOfRevolution;
		 GeomEvaluator_SurfaceOfRevolution(const opencascade::handle<Geom_Curve> & theBase, const gp_Dir & theRevolDir, const gp_Pnt & theRevolLoc);

		/****** GeomEvaluator_SurfaceOfRevolution::GeomEvaluator_SurfaceOfRevolution ******/
		/****** md5 signature: c0d248a0845d27bb2b25e4ec8a363cc5 ******/
		%feature("compactdefaultargs") GeomEvaluator_SurfaceOfRevolution;
		%feature("autodoc", "
Parameters
----------
theBase: Adaptor3d_Curve
theRevolDir: gp_Dir
theRevolLoc: gp_Pnt

Return
-------
None

Description
-----------
Initialize evaluator by adaptor of the revolved curve, the axis of revolution and the location.
") GeomEvaluator_SurfaceOfRevolution;
		 GeomEvaluator_SurfaceOfRevolution(const opencascade::handle<Adaptor3d_Curve> & theBase, const gp_Dir & theRevolDir, const gp_Pnt & theRevolLoc);

		/****** GeomEvaluator_SurfaceOfRevolution::D0 ******/
		/****** md5 signature: 2d6a7e09cbdc01a4df050802195d3171 ******/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "
Parameters
----------
theU: float
theV: float
theValue: gp_Pnt

Return
-------
None

Description
-----------
Value of surface.
") D0;
		void D0(const Standard_Real theU, const Standard_Real theV, gp_Pnt & theValue);

		/****** GeomEvaluator_SurfaceOfRevolution::D1 ******/
		/****** md5 signature: 3b3d2c9c0dc9beb616d2945ae2a7c9c7 ******/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "
Parameters
----------
theU: float
theV: float
theValue: gp_Pnt
theD1U: gp_Vec
theD1V: gp_Vec

Return
-------
None

Description
-----------
Value and first derivatives of surface.
") D1;
		void D1(const Standard_Real theU, const Standard_Real theV, gp_Pnt & theValue, gp_Vec & theD1U, gp_Vec & theD1V);

		/****** GeomEvaluator_SurfaceOfRevolution::D2 ******/
		/****** md5 signature: aac577d0db0df7fbead5f8a72afb2a29 ******/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "
Parameters
----------
theU: float
theV: float
theValue: gp_Pnt
theD1U: gp_Vec
theD1V: gp_Vec
theD2U: gp_Vec
theD2V: gp_Vec
theD2UV: gp_Vec

Return
-------
None

Description
-----------
Value, first and second derivatives of surface.
") D2;
		void D2(const Standard_Real theU, const Standard_Real theV, gp_Pnt & theValue, gp_Vec & theD1U, gp_Vec & theD1V, gp_Vec & theD2U, gp_Vec & theD2V, gp_Vec & theD2UV);

		/****** GeomEvaluator_SurfaceOfRevolution::D3 ******/
		/****** md5 signature: c38285b0561ae3aedece5bc2ddb140bc ******/
		%feature("compactdefaultargs") D3;
		%feature("autodoc", "
Parameters
----------
theU: float
theV: float
theValue: gp_Pnt
theD1U: gp_Vec
theD1V: gp_Vec
theD2U: gp_Vec
theD2V: gp_Vec
theD2UV: gp_Vec
theD3U: gp_Vec
theD3V: gp_Vec
theD3UUV: gp_Vec
theD3UVV: gp_Vec

Return
-------
None

Description
-----------
Value, first, second and third derivatives of surface.
") D3;
		void D3(const Standard_Real theU, const Standard_Real theV, gp_Pnt & theValue, gp_Vec & theD1U, gp_Vec & theD1V, gp_Vec & theD2U, gp_Vec & theD2V, gp_Vec & theD2UV, gp_Vec & theD3U, gp_Vec & theD3V, gp_Vec & theD3UUV, gp_Vec & theD3UVV);

		/****** GeomEvaluator_SurfaceOfRevolution::DN ******/
		/****** md5 signature: 2f26fde6dd2535ddcb6fdca1b00f06c7 ******/
		%feature("compactdefaultargs") DN;
		%feature("autodoc", "
Parameters
----------
theU: float
theV: float
theDerU: int
theDerV: int

Return
-------
gp_Vec

Description
-----------
Calculates N-th derivatives of surface, where N = theDerU + theDerV. //! Raises if N < 1 or theDerU < 0 or theDerV < 0.
") DN;
		gp_Vec DN(const Standard_Real theU, const Standard_Real theV, const Standard_Integer theDerU, const Standard_Integer theDerV);

		/****** GeomEvaluator_SurfaceOfRevolution::SetAxis ******/
		/****** md5 signature: 3e4d4cf0a38b798ede2d2c35caaa9626 ******/
		%feature("compactdefaultargs") SetAxis;
		%feature("autodoc", "
Parameters
----------
theAxis: gp_Ax1

Return
-------
None

Description
-----------
Change the axis of revolution.
") SetAxis;
		void SetAxis(const gp_Ax1 & theAxis);

		/****** GeomEvaluator_SurfaceOfRevolution::SetDirection ******/
		/****** md5 signature: 03e096726d774182cbdd6e00d0d20499 ******/
		%feature("compactdefaultargs") SetDirection;
		%feature("autodoc", "
Parameters
----------
theDirection: gp_Dir

Return
-------
None

Description
-----------
Change direction of the axis of revolution.
") SetDirection;
		void SetDirection(const gp_Dir & theDirection);

		/****** GeomEvaluator_SurfaceOfRevolution::SetLocation ******/
		/****** md5 signature: 49b73879adebd078faa244b518af4276 ******/
		%feature("compactdefaultargs") SetLocation;
		%feature("autodoc", "
Parameters
----------
theLocation: gp_Pnt

Return
-------
None

Description
-----------
Change location of the axis of revolution.
") SetLocation;
		void SetLocation(const gp_Pnt & theLocation);

		/****** GeomEvaluator_SurfaceOfRevolution::ShallowCopy ******/
		/****** md5 signature: fbd80b36cea42259d24868636d99709b ******/
		%feature("compactdefaultargs") ShallowCopy;
		%feature("autodoc", "Return
-------
opencascade::handle<GeomEvaluator_Surface>

Description
-----------
No available documentation.
") ShallowCopy;
		opencascade::handle<GeomEvaluator_Surface> ShallowCopy();

};


%make_alias(GeomEvaluator_SurfaceOfRevolution)

%extend GeomEvaluator_SurfaceOfRevolution {
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
