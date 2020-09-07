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
%define GEOM2DEVALUATORDOCSTRING
"Geom2dEvaluator module, see official documentation at
https://www.opencascade.com/doc/occt-7.4.0/refman/html/package_geom2devaluator.html"
%enddef
%module (package="OCC.Core", docstring=GEOM2DEVALUATORDOCSTRING) Geom2dEvaluator


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
#include<Geom2dEvaluator_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<gp_module.hxx>
#include<Geom2d_module.hxx>
#include<Geom2dAdaptor_module.hxx>
#include<Adaptor2d_module.hxx>
#include<Geom2dAdaptor_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import gp.i
%import Geom2d.i
%import Geom2dAdaptor.i

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
%wrap_handle(Geom2dEvaluator_Curve)
%wrap_handle(Geom2dEvaluator_OffsetCurve)
/* end handles declaration */

/* templates */
/* end templates declaration */

/* typedefs */
/* end typedefs declaration */

/******************************
* class Geom2dEvaluator_Curve *
******************************/
%nodefaultctor Geom2dEvaluator_Curve;
class Geom2dEvaluator_Curve : public Standard_Transient {
	public:
		/****************** D0 ******************/
		/**** md5 signature: f734c09c90c10699f808ed83731f1241 ****/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "Value of 2d curve.

Parameters
----------
theU: float
theValue: gp_Pnt2d

Returns
-------
None
") D0;
		virtual void D0(const Standard_Real theU, gp_Pnt2d & theValue);

		/****************** D1 ******************/
		/**** md5 signature: 0a0121222e8914702b82d0e287c62ac4 ****/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "Value and first derivatives of curve.

Parameters
----------
theU: float
theValue: gp_Pnt2d
theD1: gp_Vec2d

Returns
-------
None
") D1;
		virtual void D1(const Standard_Real theU, gp_Pnt2d & theValue, gp_Vec2d & theD1);

		/****************** D2 ******************/
		/**** md5 signature: 024ee3603a0f43a6bfe55da908e93c3a ****/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "Value, first and second derivatives of curve.

Parameters
----------
theU: float
theValue: gp_Pnt2d
theD1: gp_Vec2d
theD2: gp_Vec2d

Returns
-------
None
") D2;
		virtual void D2(const Standard_Real theU, gp_Pnt2d & theValue, gp_Vec2d & theD1, gp_Vec2d & theD2);

		/****************** D3 ******************/
		/**** md5 signature: 54ff6e9c3edeee73a8cef1723abd22c3 ****/
		%feature("compactdefaultargs") D3;
		%feature("autodoc", "Value, first, second and third derivatives of curve.

Parameters
----------
theU: float
theValue: gp_Pnt2d
theD1: gp_Vec2d
theD2: gp_Vec2d
theD3: gp_Vec2d

Returns
-------
None
") D3;
		virtual void D3(const Standard_Real theU, gp_Pnt2d & theValue, gp_Vec2d & theD1, gp_Vec2d & theD2, gp_Vec2d & theD3);

		/****************** DN ******************/
		/**** md5 signature: bb88732e1133b0b1613d0c311f12f1e9 ****/
		%feature("compactdefaultargs") DN;
		%feature("autodoc", "Calculates n-th derivatives of curve, where n = thederu. raises if n < 1.

Parameters
----------
theU: float
theDerU: int

Returns
-------
gp_Vec2d
") DN;
		virtual gp_Vec2d DN(const Standard_Real theU, const Standard_Integer theDerU);

};


%make_alias(Geom2dEvaluator_Curve)

%extend Geom2dEvaluator_Curve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************************
* class Geom2dEvaluator_OffsetCurve *
************************************/
class Geom2dEvaluator_OffsetCurve : public Geom2dEvaluator_Curve {
	public:
		/****************** Geom2dEvaluator_OffsetCurve ******************/
		/**** md5 signature: 9010ab0c6bfda989192ffbe65a1ccbc5 ****/
		%feature("compactdefaultargs") Geom2dEvaluator_OffsetCurve;
		%feature("autodoc", "Initialize evaluator by curve.

Parameters
----------
theBase: Geom2d_Curve
theOffset: float

Returns
-------
None
") Geom2dEvaluator_OffsetCurve;
		 Geom2dEvaluator_OffsetCurve(const opencascade::handle<Geom2d_Curve> & theBase, const Standard_Real theOffset);

		/****************** Geom2dEvaluator_OffsetCurve ******************/
		/**** md5 signature: 8ce815f243f2cfc044f385720d494d24 ****/
		%feature("compactdefaultargs") Geom2dEvaluator_OffsetCurve;
		%feature("autodoc", "Initialize evaluator by curve adaptor.

Parameters
----------
theBase: Geom2dAdaptor_HCurve
theOffset: float

Returns
-------
None
") Geom2dEvaluator_OffsetCurve;
		 Geom2dEvaluator_OffsetCurve(const opencascade::handle<Geom2dAdaptor_HCurve> & theBase, const Standard_Real theOffset);

		/****************** D0 ******************/
		/**** md5 signature: 9cca4337d408090f3abc160255ae26e1 ****/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "Value of curve.

Parameters
----------
theU: float
theValue: gp_Pnt2d

Returns
-------
None
") D0;
		void D0(const Standard_Real theU, gp_Pnt2d & theValue);

		/****************** D1 ******************/
		/**** md5 signature: 6ac52a63a28bf0019332b2304d1ad6e5 ****/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "Value and first derivatives of curve.

Parameters
----------
theU: float
theValue: gp_Pnt2d
theD1: gp_Vec2d

Returns
-------
None
") D1;
		void D1(const Standard_Real theU, gp_Pnt2d & theValue, gp_Vec2d & theD1);

		/****************** D2 ******************/
		/**** md5 signature: b437a11394e67627b458e3613f899d98 ****/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "Value, first and second derivatives of curve.

Parameters
----------
theU: float
theValue: gp_Pnt2d
theD1: gp_Vec2d
theD2: gp_Vec2d

Returns
-------
None
") D2;
		void D2(const Standard_Real theU, gp_Pnt2d & theValue, gp_Vec2d & theD1, gp_Vec2d & theD2);

		/****************** D3 ******************/
		/**** md5 signature: 7ec2bda0e7a7ada3241c38d8733ce22c ****/
		%feature("compactdefaultargs") D3;
		%feature("autodoc", "Value, first, second and third derivatives of curve.

Parameters
----------
theU: float
theValue: gp_Pnt2d
theD1: gp_Vec2d
theD2: gp_Vec2d
theD3: gp_Vec2d

Returns
-------
None
") D3;
		void D3(const Standard_Real theU, gp_Pnt2d & theValue, gp_Vec2d & theD1, gp_Vec2d & theD2, gp_Vec2d & theD3);

		/****************** DN ******************/
		/**** md5 signature: 469c25b71ec08796bfed138071fc68cc ****/
		%feature("compactdefaultargs") DN;
		%feature("autodoc", "Calculates n-th derivatives of curve, where n = thederiv. raises if n < 1.

Parameters
----------
theU: float
theDeriv: int

Returns
-------
gp_Vec2d
") DN;
		gp_Vec2d DN(const Standard_Real theU, const Standard_Integer theDeriv);

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


%make_alias(Geom2dEvaluator_OffsetCurve)

%extend Geom2dEvaluator_OffsetCurve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* harray1 classes */
/* harray2 classes */
/* hsequence classes */
