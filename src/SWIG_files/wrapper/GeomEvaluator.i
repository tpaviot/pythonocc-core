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
%define GEOMEVALUATORDOCSTRING
"GeomEvaluator module, see official documentation at
https://www.opencascade.com/doc/occt-7.4.0/refman/html/package_geomevaluator.html"
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
%include ../common/Operators.i
%include ../common/OccHandle.i


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

/* python proy classes for enums */
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
		/****************** D0 ******************/
		/**** md5 signature: 746da35370896ff17a6001b63a637f21 ****/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "Value of 3d curve.

Parameters
----------
theU: float
theValue: gp_Pnt

Returns
-------
None
") D0;
		virtual void D0(const Standard_Real theU, gp_Pnt & theValue);

		/****************** D1 ******************/
		/**** md5 signature: bc585642e9efc7f923dc9609fa8449f9 ****/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "Value and first derivatives of curve.

Parameters
----------
theU: float
theValue: gp_Pnt
theD1: gp_Vec

Returns
-------
None
") D1;
		virtual void D1(const Standard_Real theU, gp_Pnt & theValue, gp_Vec & theD1);

		/****************** D2 ******************/
		/**** md5 signature: be5ad77d75f0e9e83b09cafed5376e77 ****/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "Value, first and second derivatives of curve.

Parameters
----------
theU: float
theValue: gp_Pnt
theD1: gp_Vec
theD2: gp_Vec

Returns
-------
None
") D2;
		virtual void D2(const Standard_Real theU, gp_Pnt & theValue, gp_Vec & theD1, gp_Vec & theD2);

		/****************** D3 ******************/
		/**** md5 signature: 3cdcd7f890afa95c2858b7b1185c95dd ****/
		%feature("compactdefaultargs") D3;
		%feature("autodoc", "Value, first, second and third derivatives of curve.

Parameters
----------
theU: float
theValue: gp_Pnt
theD1: gp_Vec
theD2: gp_Vec
theD3: gp_Vec

Returns
-------
None
") D3;
		virtual void D3(const Standard_Real theU, gp_Pnt & theValue, gp_Vec & theD1, gp_Vec & theD2, gp_Vec & theD3);

		/****************** DN ******************/
		/**** md5 signature: e534d902338ab19561f4b339de53b57d ****/
		%feature("compactdefaultargs") DN;
		%feature("autodoc", "Calculates n-th derivatives of curve, where n = thederu. raises if n < 1.

Parameters
----------
theU: float
theDerU: int

Returns
-------
gp_Vec
") DN;
		virtual gp_Vec DN(const Standard_Real theU, const Standard_Integer theDerU);

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
		/****************** D0 ******************/
		/**** md5 signature: 28f3f8227c1f19f0ca123dc63d72beab ****/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "Value of surface.

Parameters
----------
theU: float
theV: float
theValue: gp_Pnt

Returns
-------
None
") D0;
		virtual void D0(const Standard_Real theU, const Standard_Real theV, gp_Pnt & theValue);

		/****************** D1 ******************/
		/**** md5 signature: d72b3ce46e021168c8c8908d8a0f8f5f ****/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "Value and first derivatives of surface.

Parameters
----------
theU: float
theV: float
theValue: gp_Pnt
theD1U: gp_Vec
theD1V: gp_Vec

Returns
-------
None
") D1;
		virtual void D1(const Standard_Real theU, const Standard_Real theV, gp_Pnt & theValue, gp_Vec & theD1U, gp_Vec & theD1V);

		/****************** D2 ******************/
		/**** md5 signature: 80dee925b5bda94bb05a95824c3ab611 ****/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "Value, first and second derivatives of surface.

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

Returns
-------
None
") D2;
		virtual void D2(const Standard_Real theU, const Standard_Real theV, gp_Pnt & theValue, gp_Vec & theD1U, gp_Vec & theD1V, gp_Vec & theD2U, gp_Vec & theD2V, gp_Vec & theD2UV);

		/****************** D3 ******************/
		/**** md5 signature: d0a97233c6a934217820824209e6d50a ****/
		%feature("compactdefaultargs") D3;
		%feature("autodoc", "Value, first, second and third derivatives of surface.

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

Returns
-------
None
") D3;
		virtual void D3(const Standard_Real theU, const Standard_Real theV, gp_Pnt & theValue, gp_Vec & theD1U, gp_Vec & theD1V, gp_Vec & theD2U, gp_Vec & theD2V, gp_Vec & theD2UV, gp_Vec & theD3U, gp_Vec & theD3V, gp_Vec & theD3UUV, gp_Vec & theD3UVV);

		/****************** DN ******************/
		/**** md5 signature: 5435d2f1e43ba841a8a8a3814f03c6cb ****/
		%feature("compactdefaultargs") DN;
		%feature("autodoc", "Calculates n-th derivatives of surface, where n = thederu + thederv. //! raises if n < 1 or thederu < 0 or thederv < 0.

Parameters
----------
theU: float
theV: float
theDerU: int
theDerV: int

Returns
-------
gp_Vec
") DN;
		virtual gp_Vec DN(const Standard_Real theU, const Standard_Real theV, const Standard_Integer theDerU, const Standard_Integer theDerV);

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
		/****************** GeomEvaluator_OffsetCurve ******************/
		/**** md5 signature: 2566a84ab011d3456edd3ecfeed95ade ****/
		%feature("compactdefaultargs") GeomEvaluator_OffsetCurve;
		%feature("autodoc", "Initialize evaluator by curve.

Parameters
----------
theBase: Geom_Curve
theOffset: float
theDirection: gp_Dir

Returns
-------
None
") GeomEvaluator_OffsetCurve;
		 GeomEvaluator_OffsetCurve(const opencascade::handle<Geom_Curve> & theBase, const Standard_Real theOffset, const gp_Dir & theDirection);

		/****************** GeomEvaluator_OffsetCurve ******************/
		/**** md5 signature: 59defa2d450255c06571ebdefa7e2895 ****/
		%feature("compactdefaultargs") GeomEvaluator_OffsetCurve;
		%feature("autodoc", "Initialize evaluator by curve adaptor.

Parameters
----------
theBase: GeomAdaptor_HCurve
theOffset: float
theDirection: gp_Dir

Returns
-------
None
") GeomEvaluator_OffsetCurve;
		 GeomEvaluator_OffsetCurve(const opencascade::handle<GeomAdaptor_HCurve> & theBase, const Standard_Real theOffset, const gp_Dir & theDirection);

		/****************** D0 ******************/
		/**** md5 signature: 66474176b3d6e773fa82e2e75db9adbb ****/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "Value of curve.

Parameters
----------
theU: float
theValue: gp_Pnt

Returns
-------
None
") D0;
		void D0(const Standard_Real theU, gp_Pnt & theValue);

		/****************** D1 ******************/
		/**** md5 signature: e96d41cf42350bc1dcbb7992bfffd9ec ****/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "Value and first derivatives of curve.

Parameters
----------
theU: float
theValue: gp_Pnt
theD1: gp_Vec

Returns
-------
None
") D1;
		void D1(const Standard_Real theU, gp_Pnt & theValue, gp_Vec & theD1);

		/****************** D2 ******************/
		/**** md5 signature: 23e61b74d05ad8f718526eefa7754d47 ****/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "Value, first and second derivatives of curve.

Parameters
----------
theU: float
theValue: gp_Pnt
theD1: gp_Vec
theD2: gp_Vec

Returns
-------
None
") D2;
		void D2(const Standard_Real theU, gp_Pnt & theValue, gp_Vec & theD1, gp_Vec & theD2);

		/****************** D3 ******************/
		/**** md5 signature: 989c0f9e45a005ca9fa4652fb525a4e3 ****/
		%feature("compactdefaultargs") D3;
		%feature("autodoc", "Value, first, second and third derivatives of curve.

Parameters
----------
theU: float
theValue: gp_Pnt
theD1: gp_Vec
theD2: gp_Vec
theD3: gp_Vec

Returns
-------
None
") D3;
		void D3(const Standard_Real theU, gp_Pnt & theValue, gp_Vec & theD1, gp_Vec & theD2, gp_Vec & theD3);

		/****************** DN ******************/
		/**** md5 signature: ed7b981f4c22948574d702d532333fea ****/
		%feature("compactdefaultargs") DN;
		%feature("autodoc", "Calculates n-th derivatives of curve, where n = thederiv. raises if n < 1.

Parameters
----------
theU: float
theDeriv: int

Returns
-------
gp_Vec
") DN;
		gp_Vec DN(const Standard_Real theU, const Standard_Integer theDeriv);

		/****************** SetOffsetDirection ******************/
		/**** md5 signature: 17569b0102b44b0960ea08936e2845af ****/
		%feature("compactdefaultargs") SetOffsetDirection;
		%feature("autodoc", "No available documentation.

Parameters
----------
theDirection: gp_Dir

Returns
-------
None
") SetOffsetDirection;
		void SetOffsetDirection(const gp_Dir & theDirection);

		/****************** SetOffsetValue ******************/
		/**** md5 signature: 548afc85f8e72630a916fe190a2fc526 ****/
		%feature("compactdefaultargs") SetOffsetValue;
		%feature("autodoc", "Change the offset value.

Parameters
----------
theOffset: float

Returns
-------
None
") SetOffsetValue;
		void SetOffsetValue(Standard_Real theOffset);

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
		/****************** GeomEvaluator_OffsetSurface ******************/
		/**** md5 signature: 4d7c3bf711d1b6d259802ef57b452513 ****/
		%feature("compactdefaultargs") GeomEvaluator_OffsetSurface;
		%feature("autodoc", "Initialize evaluator by surface.

Parameters
----------
theBase: Geom_Surface
theOffset: float
theOscSurf: Geom_OsculatingSurface,optional
	default value is opencascade::handle<Geom_OsculatingSurface>()

Returns
-------
None
") GeomEvaluator_OffsetSurface;
		 GeomEvaluator_OffsetSurface(const opencascade::handle<Geom_Surface> & theBase, const Standard_Real theOffset, const opencascade::handle<Geom_OsculatingSurface> & theOscSurf = opencascade::handle<Geom_OsculatingSurface>());

		/****************** GeomEvaluator_OffsetSurface ******************/
		/**** md5 signature: 856f854074e0d8dd5a4515eac8f4836e ****/
		%feature("compactdefaultargs") GeomEvaluator_OffsetSurface;
		%feature("autodoc", "Initialize evaluator by surface adaptor.

Parameters
----------
theBase: GeomAdaptor_HSurface
theOffset: float
theOscSurf: Geom_OsculatingSurface,optional
	default value is opencascade::handle<Geom_OsculatingSurface>()

Returns
-------
None
") GeomEvaluator_OffsetSurface;
		 GeomEvaluator_OffsetSurface(const opencascade::handle<GeomAdaptor_HSurface> & theBase, const Standard_Real theOffset, const opencascade::handle<Geom_OsculatingSurface> & theOscSurf = opencascade::handle<Geom_OsculatingSurface>());

		/****************** D0 ******************/
		/**** md5 signature: 2d6a7e09cbdc01a4df050802195d3171 ****/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "Value of surface.

Parameters
----------
theU: float
theV: float
theValue: gp_Pnt

Returns
-------
None
") D0;
		void D0(const Standard_Real theU, const Standard_Real theV, gp_Pnt & theValue);

		/****************** D1 ******************/
		/**** md5 signature: 3b3d2c9c0dc9beb616d2945ae2a7c9c7 ****/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "Value and first derivatives of surface.

Parameters
----------
theU: float
theV: float
theValue: gp_Pnt
theD1U: gp_Vec
theD1V: gp_Vec

Returns
-------
None
") D1;
		void D1(const Standard_Real theU, const Standard_Real theV, gp_Pnt & theValue, gp_Vec & theD1U, gp_Vec & theD1V);

		/****************** D2 ******************/
		/**** md5 signature: aac577d0db0df7fbead5f8a72afb2a29 ****/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "Value, first and second derivatives of surface.

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

Returns
-------
None
") D2;
		void D2(const Standard_Real theU, const Standard_Real theV, gp_Pnt & theValue, gp_Vec & theD1U, gp_Vec & theD1V, gp_Vec & theD2U, gp_Vec & theD2V, gp_Vec & theD2UV);

		/****************** D3 ******************/
		/**** md5 signature: c38285b0561ae3aedece5bc2ddb140bc ****/
		%feature("compactdefaultargs") D3;
		%feature("autodoc", "Value, first, second and third derivatives of surface.

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

Returns
-------
None
") D3;
		void D3(const Standard_Real theU, const Standard_Real theV, gp_Pnt & theValue, gp_Vec & theD1U, gp_Vec & theD1V, gp_Vec & theD2U, gp_Vec & theD2V, gp_Vec & theD2UV, gp_Vec & theD3U, gp_Vec & theD3V, gp_Vec & theD3UUV, gp_Vec & theD3UVV);

		/****************** DN ******************/
		/**** md5 signature: 2f26fde6dd2535ddcb6fdca1b00f06c7 ****/
		%feature("compactdefaultargs") DN;
		%feature("autodoc", "Calculates n-th derivatives of surface, where n = thederu + thederv. //! raises if n < 1 or thederu < 0 or thederv < 0.

Parameters
----------
theU: float
theV: float
theDerU: int
theDerV: int

Returns
-------
gp_Vec
") DN;
		gp_Vec DN(const Standard_Real theU, const Standard_Real theV, const Standard_Integer theDerU, const Standard_Integer theDerV);

		/****************** SetOffsetValue ******************/
		/**** md5 signature: 548afc85f8e72630a916fe190a2fc526 ****/
		%feature("compactdefaultargs") SetOffsetValue;
		%feature("autodoc", "Change the offset value.

Parameters
----------
theOffset: float

Returns
-------
None
") SetOffsetValue;
		void SetOffsetValue(Standard_Real theOffset);

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
		/****************** GeomEvaluator_SurfaceOfExtrusion ******************/
		/**** md5 signature: 027d7da117e9a6df658ed7f2f2a87e3f ****/
		%feature("compactdefaultargs") GeomEvaluator_SurfaceOfExtrusion;
		%feature("autodoc", "Initialize evaluator by surface.

Parameters
----------
theBase: Geom_Curve
theExtrusionDir: gp_Dir

Returns
-------
None
") GeomEvaluator_SurfaceOfExtrusion;
		 GeomEvaluator_SurfaceOfExtrusion(const opencascade::handle<Geom_Curve> & theBase, const gp_Dir & theExtrusionDir);

		/****************** GeomEvaluator_SurfaceOfExtrusion ******************/
		/**** md5 signature: 9f58f1181fd474e6af39b7510a9797d7 ****/
		%feature("compactdefaultargs") GeomEvaluator_SurfaceOfExtrusion;
		%feature("autodoc", "Initialize evaluator by surface adaptor.

Parameters
----------
theBase: Adaptor3d_HCurve
theExtrusionDir: gp_Dir

Returns
-------
None
") GeomEvaluator_SurfaceOfExtrusion;
		 GeomEvaluator_SurfaceOfExtrusion(const opencascade::handle<Adaptor3d_HCurve> & theBase, const gp_Dir & theExtrusionDir);

		/****************** D0 ******************/
		/**** md5 signature: 2d6a7e09cbdc01a4df050802195d3171 ****/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "Value of surface.

Parameters
----------
theU: float
theV: float
theValue: gp_Pnt

Returns
-------
None
") D0;
		void D0(const Standard_Real theU, const Standard_Real theV, gp_Pnt & theValue);

		/****************** D1 ******************/
		/**** md5 signature: 3b3d2c9c0dc9beb616d2945ae2a7c9c7 ****/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "Value and first derivatives of surface.

Parameters
----------
theU: float
theV: float
theValue: gp_Pnt
theD1U: gp_Vec
theD1V: gp_Vec

Returns
-------
None
") D1;
		void D1(const Standard_Real theU, const Standard_Real theV, gp_Pnt & theValue, gp_Vec & theD1U, gp_Vec & theD1V);

		/****************** D2 ******************/
		/**** md5 signature: aac577d0db0df7fbead5f8a72afb2a29 ****/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "Value, first and second derivatives of surface.

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

Returns
-------
None
") D2;
		void D2(const Standard_Real theU, const Standard_Real theV, gp_Pnt & theValue, gp_Vec & theD1U, gp_Vec & theD1V, gp_Vec & theD2U, gp_Vec & theD2V, gp_Vec & theD2UV);

		/****************** D3 ******************/
		/**** md5 signature: c38285b0561ae3aedece5bc2ddb140bc ****/
		%feature("compactdefaultargs") D3;
		%feature("autodoc", "Value, first, second and third derivatives of surface.

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

Returns
-------
None
") D3;
		void D3(const Standard_Real theU, const Standard_Real theV, gp_Pnt & theValue, gp_Vec & theD1U, gp_Vec & theD1V, gp_Vec & theD2U, gp_Vec & theD2V, gp_Vec & theD2UV, gp_Vec & theD3U, gp_Vec & theD3V, gp_Vec & theD3UUV, gp_Vec & theD3UVV);

		/****************** DN ******************/
		/**** md5 signature: 2f26fde6dd2535ddcb6fdca1b00f06c7 ****/
		%feature("compactdefaultargs") DN;
		%feature("autodoc", "Calculates n-th derivatives of surface, where n = thederu + thederv. //! raises if n < 1 or thederu < 0 or thederv < 0.

Parameters
----------
theU: float
theV: float
theDerU: int
theDerV: int

Returns
-------
gp_Vec
") DN;
		gp_Vec DN(const Standard_Real theU, const Standard_Real theV, const Standard_Integer theDerU, const Standard_Integer theDerV);

		/****************** SetDirection ******************/
		/**** md5 signature: 03e096726d774182cbdd6e00d0d20499 ****/
		%feature("compactdefaultargs") SetDirection;
		%feature("autodoc", "/changes the direction of extrusion.

Parameters
----------
theDirection: gp_Dir

Returns
-------
None
") SetDirection;
		void SetDirection(const gp_Dir & theDirection);

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
		/****************** GeomEvaluator_SurfaceOfRevolution ******************/
		/**** md5 signature: 8832b9c3887d3ff766e516c6cd21463d ****/
		%feature("compactdefaultargs") GeomEvaluator_SurfaceOfRevolution;
		%feature("autodoc", "Initialize evaluator by revolved curve, the axis of revolution and the location.

Parameters
----------
theBase: Geom_Curve
theRevolDir: gp_Dir
theRevolLoc: gp_Pnt

Returns
-------
None
") GeomEvaluator_SurfaceOfRevolution;
		 GeomEvaluator_SurfaceOfRevolution(const opencascade::handle<Geom_Curve> & theBase, const gp_Dir & theRevolDir, const gp_Pnt & theRevolLoc);

		/****************** GeomEvaluator_SurfaceOfRevolution ******************/
		/**** md5 signature: 485936d71c59e278d1d488c847ebe986 ****/
		%feature("compactdefaultargs") GeomEvaluator_SurfaceOfRevolution;
		%feature("autodoc", "Initialize evaluator by adaptor of the revolved curve, the axis of revolution and the location.

Parameters
----------
theBase: Adaptor3d_HCurve
theRevolDir: gp_Dir
theRevolLoc: gp_Pnt

Returns
-------
None
") GeomEvaluator_SurfaceOfRevolution;
		 GeomEvaluator_SurfaceOfRevolution(const opencascade::handle<Adaptor3d_HCurve> & theBase, const gp_Dir & theRevolDir, const gp_Pnt & theRevolLoc);

		/****************** D0 ******************/
		/**** md5 signature: 2d6a7e09cbdc01a4df050802195d3171 ****/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "Value of surface.

Parameters
----------
theU: float
theV: float
theValue: gp_Pnt

Returns
-------
None
") D0;
		void D0(const Standard_Real theU, const Standard_Real theV, gp_Pnt & theValue);

		/****************** D1 ******************/
		/**** md5 signature: 3b3d2c9c0dc9beb616d2945ae2a7c9c7 ****/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "Value and first derivatives of surface.

Parameters
----------
theU: float
theV: float
theValue: gp_Pnt
theD1U: gp_Vec
theD1V: gp_Vec

Returns
-------
None
") D1;
		void D1(const Standard_Real theU, const Standard_Real theV, gp_Pnt & theValue, gp_Vec & theD1U, gp_Vec & theD1V);

		/****************** D2 ******************/
		/**** md5 signature: aac577d0db0df7fbead5f8a72afb2a29 ****/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "Value, first and second derivatives of surface.

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

Returns
-------
None
") D2;
		void D2(const Standard_Real theU, const Standard_Real theV, gp_Pnt & theValue, gp_Vec & theD1U, gp_Vec & theD1V, gp_Vec & theD2U, gp_Vec & theD2V, gp_Vec & theD2UV);

		/****************** D3 ******************/
		/**** md5 signature: c38285b0561ae3aedece5bc2ddb140bc ****/
		%feature("compactdefaultargs") D3;
		%feature("autodoc", "Value, first, second and third derivatives of surface.

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

Returns
-------
None
") D3;
		void D3(const Standard_Real theU, const Standard_Real theV, gp_Pnt & theValue, gp_Vec & theD1U, gp_Vec & theD1V, gp_Vec & theD2U, gp_Vec & theD2V, gp_Vec & theD2UV, gp_Vec & theD3U, gp_Vec & theD3V, gp_Vec & theD3UUV, gp_Vec & theD3UVV);

		/****************** DN ******************/
		/**** md5 signature: 2f26fde6dd2535ddcb6fdca1b00f06c7 ****/
		%feature("compactdefaultargs") DN;
		%feature("autodoc", "Calculates n-th derivatives of surface, where n = thederu + thederv. //! raises if n < 1 or thederu < 0 or thederv < 0.

Parameters
----------
theU: float
theV: float
theDerU: int
theDerV: int

Returns
-------
gp_Vec
") DN;
		gp_Vec DN(const Standard_Real theU, const Standard_Real theV, const Standard_Integer theDerU, const Standard_Integer theDerV);

		/****************** SetAxis ******************/
		/**** md5 signature: 3e4d4cf0a38b798ede2d2c35caaa9626 ****/
		%feature("compactdefaultargs") SetAxis;
		%feature("autodoc", "Change the axis of revolution.

Parameters
----------
theAxis: gp_Ax1

Returns
-------
None
") SetAxis;
		void SetAxis(const gp_Ax1 & theAxis);

		/****************** SetDirection ******************/
		/**** md5 signature: 03e096726d774182cbdd6e00d0d20499 ****/
		%feature("compactdefaultargs") SetDirection;
		%feature("autodoc", "Change direction of the axis of revolution.

Parameters
----------
theDirection: gp_Dir

Returns
-------
None
") SetDirection;
		void SetDirection(const gp_Dir & theDirection);

		/****************** SetLocation ******************/
		/**** md5 signature: 49b73879adebd078faa244b518af4276 ****/
		%feature("compactdefaultargs") SetLocation;
		%feature("autodoc", "Change location of the axis of revolution.

Parameters
----------
theLocation: gp_Pnt

Returns
-------
None
") SetLocation;
		void SetLocation(const gp_Pnt & theLocation);

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
