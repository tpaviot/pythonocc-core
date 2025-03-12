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
%define GEOM2DEVALUATORDOCSTRING
"Geom2dEvaluator module, see official documentation at
https://dev.opencascade.org/doc/occt-7.8.0/refman/html/package_geom2devaluator.html"
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
%include ../common/EnumTemplates.i
%include ../common/Operators.i
%include ../common/OccHandle.i
%include ../common/IOStream.i
%include ../common/ArrayMacros.i


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

/* python proxy classes for enums */
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

/************************
* class Geom2dEvaluator *
************************/
%rename(geom2devaluator) Geom2dEvaluator;
class Geom2dEvaluator {
	public:
		/****** Geom2dEvaluator::CalculateD0 ******/
		/****** md5 signature: 63f751ea1921e17ebeec14db722cc24a ******/
		%feature("compactdefaultargs") CalculateD0;
		%feature("autodoc", "
Parameters
----------
theValue: gp_Pnt2d
theD1: gp_Vec2d
theOffset: float

Return
-------
None

Description
-----------
Recalculate D1 values of base curve into D0 value of offset curve.
") CalculateD0;
		static void CalculateD0(gp_Pnt2d & theValue, const gp_Vec2d & theD1, const Standard_Real theOffset);

		/****** Geom2dEvaluator::CalculateD1 ******/
		/****** md5 signature: a51f97f7d8b02ea6f8296d4e357a3a06 ******/
		%feature("compactdefaultargs") CalculateD1;
		%feature("autodoc", "
Parameters
----------
theValue: gp_Pnt2d
theD1: gp_Vec2d
theD2: gp_Vec2d
theOffset: float

Return
-------
None

Description
-----------
Recalculate D2 values of base curve into D1 values of offset curve.
") CalculateD1;
		static void CalculateD1(gp_Pnt2d & theValue, gp_Vec2d & theD1, const gp_Vec2d & theD2, const Standard_Real theOffset);

		/****** Geom2dEvaluator::CalculateD2 ******/
		/****** md5 signature: 8d2505ddf222e59cb962a96f89da9b14 ******/
		%feature("compactdefaultargs") CalculateD2;
		%feature("autodoc", "
Parameters
----------
theValue: gp_Pnt2d
theD1: gp_Vec2d
theD2: gp_Vec2d
theD3: gp_Vec2d
theIsDirChange: bool
theOffset: float

Return
-------
None

Description
-----------
Recalculate D3 values of base curve into D2 values of offset curve.
") CalculateD2;
		static void CalculateD2(gp_Pnt2d & theValue, gp_Vec2d & theD1, gp_Vec2d & theD2, const gp_Vec2d & theD3, const Standard_Boolean theIsDirChange, const Standard_Real theOffset);

		/****** Geom2dEvaluator::CalculateD3 ******/
		/****** md5 signature: 934e2058ec6d1116e1228678ef71f07b ******/
		%feature("compactdefaultargs") CalculateD3;
		%feature("autodoc", "
Parameters
----------
theValue: gp_Pnt2d
theD1: gp_Vec2d
theD2: gp_Vec2d
theD3: gp_Vec2d
theD4: gp_Vec2d
theIsDirChange: bool
theOffset: float

Return
-------
None

Description
-----------
Recalculate D3 values of base curve into D3 values of offset curve.
") CalculateD3;
		static void CalculateD3(gp_Pnt2d & theValue, gp_Vec2d & theD1, gp_Vec2d & theD2, gp_Vec2d & theD3, const gp_Vec2d & theD4, const Standard_Boolean theIsDirChange, const Standard_Real theOffset);

};


%extend Geom2dEvaluator {
	%pythoncode {
	__repr__ = _dumps_object

	@methodnotwrapped
	def A(self):
		pass

	@methodnotwrapped
	def d(self):
		pass

	@methodnotwrapped
	def j(self):
		pass

	@methodnotwrapped
	def u(self):
		pass

	@methodnotwrapped
	def s(self):
		pass

	@methodnotwrapped
	def t(self):
		pass

	@methodnotwrapped
	def D(self):
		pass

	@methodnotwrapped
	def e(self):
		pass

	@methodnotwrapped
	def r(self):
		pass

	@methodnotwrapped
	def i(self):
		pass

	@methodnotwrapped
	def v(self):
		pass

	@methodnotwrapped
	def a(self):
		pass

	@methodnotwrapped
	def t(self):
		pass

	@methodnotwrapped
	def i(self):
		pass

	@methodnotwrapped
	def v(self):
		pass

	@methodnotwrapped
	def e(self):
		pass
	}
};

/******************************
* class Geom2dEvaluator_Curve *
******************************/
%nodefaultctor Geom2dEvaluator_Curve;
class Geom2dEvaluator_Curve : public Standard_Transient {
	public:
		/****** Geom2dEvaluator_Curve::D0 ******/
		/****** md5 signature: f734c09c90c10699f808ed83731f1241 ******/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "
Parameters
----------
theU: float
theValue: gp_Pnt2d

Return
-------
None

Description
-----------
Value of 2D curve.
") D0;
		virtual void D0(const Standard_Real theU, gp_Pnt2d & theValue);

		/****** Geom2dEvaluator_Curve::D1 ******/
		/****** md5 signature: 0a0121222e8914702b82d0e287c62ac4 ******/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "
Parameters
----------
theU: float
theValue: gp_Pnt2d
theD1: gp_Vec2d

Return
-------
None

Description
-----------
Value and first derivatives of curve.
") D1;
		virtual void D1(const Standard_Real theU, gp_Pnt2d & theValue, gp_Vec2d & theD1);

		/****** Geom2dEvaluator_Curve::D2 ******/
		/****** md5 signature: 024ee3603a0f43a6bfe55da908e93c3a ******/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "
Parameters
----------
theU: float
theValue: gp_Pnt2d
theD1: gp_Vec2d
theD2: gp_Vec2d

Return
-------
None

Description
-----------
Value, first and second derivatives of curve.
") D2;
		virtual void D2(const Standard_Real theU, gp_Pnt2d & theValue, gp_Vec2d & theD1, gp_Vec2d & theD2);

		/****** Geom2dEvaluator_Curve::D3 ******/
		/****** md5 signature: 54ff6e9c3edeee73a8cef1723abd22c3 ******/
		%feature("compactdefaultargs") D3;
		%feature("autodoc", "
Parameters
----------
theU: float
theValue: gp_Pnt2d
theD1: gp_Vec2d
theD2: gp_Vec2d
theD3: gp_Vec2d

Return
-------
None

Description
-----------
Value, first, second and third derivatives of curve.
") D3;
		virtual void D3(const Standard_Real theU, gp_Pnt2d & theValue, gp_Vec2d & theD1, gp_Vec2d & theD2, gp_Vec2d & theD3);

		/****** Geom2dEvaluator_Curve::DN ******/
		/****** md5 signature: bb88732e1133b0b1613d0c311f12f1e9 ******/
		%feature("compactdefaultargs") DN;
		%feature("autodoc", "
Parameters
----------
theU: float
theDerU: int

Return
-------
gp_Vec2d

Description
-----------
Calculates N-th derivatives of curve, where N = theDerU. Raises if N < 1.
") DN;
		virtual gp_Vec2d DN(const Standard_Real theU, const Standard_Integer theDerU);

		/****** Geom2dEvaluator_Curve::ShallowCopy ******/
		/****** md5 signature: 825da69d96edfccc6885dc4769e6c133 ******/
		%feature("compactdefaultargs") ShallowCopy;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom2dEvaluator_Curve>

Description
-----------
No available documentation.
") ShallowCopy;
		virtual opencascade::handle<Geom2dEvaluator_Curve> ShallowCopy();

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
		/****** Geom2dEvaluator_OffsetCurve::Geom2dEvaluator_OffsetCurve ******/
		/****** md5 signature: 9010ab0c6bfda989192ffbe65a1ccbc5 ******/
		%feature("compactdefaultargs") Geom2dEvaluator_OffsetCurve;
		%feature("autodoc", "
Parameters
----------
theBase: Geom2d_Curve
theOffset: float

Return
-------
None

Description
-----------
Initialize evaluator by curve.
") Geom2dEvaluator_OffsetCurve;
		 Geom2dEvaluator_OffsetCurve(const opencascade::handle<Geom2d_Curve> & theBase, const Standard_Real theOffset);

		/****** Geom2dEvaluator_OffsetCurve::Geom2dEvaluator_OffsetCurve ******/
		/****** md5 signature: 3388eba04f937ebc239e3d148abc5d3a ******/
		%feature("compactdefaultargs") Geom2dEvaluator_OffsetCurve;
		%feature("autodoc", "
Parameters
----------
theBase: Geom2dAdaptor_Curve
theOffset: float

Return
-------
None

Description
-----------
Initialize evaluator by curve adaptor.
") Geom2dEvaluator_OffsetCurve;
		 Geom2dEvaluator_OffsetCurve(const opencascade::handle<Geom2dAdaptor_Curve> & theBase, const Standard_Real theOffset);

		/****** Geom2dEvaluator_OffsetCurve::D0 ******/
		/****** md5 signature: 9cca4337d408090f3abc160255ae26e1 ******/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "
Parameters
----------
theU: float
theValue: gp_Pnt2d

Return
-------
None

Description
-----------
Value of curve.
") D0;
		void D0(const Standard_Real theU, gp_Pnt2d & theValue);

		/****** Geom2dEvaluator_OffsetCurve::D1 ******/
		/****** md5 signature: 6ac52a63a28bf0019332b2304d1ad6e5 ******/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "
Parameters
----------
theU: float
theValue: gp_Pnt2d
theD1: gp_Vec2d

Return
-------
None

Description
-----------
Value and first derivatives of curve.
") D1;
		void D1(const Standard_Real theU, gp_Pnt2d & theValue, gp_Vec2d & theD1);

		/****** Geom2dEvaluator_OffsetCurve::D2 ******/
		/****** md5 signature: b437a11394e67627b458e3613f899d98 ******/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "
Parameters
----------
theU: float
theValue: gp_Pnt2d
theD1: gp_Vec2d
theD2: gp_Vec2d

Return
-------
None

Description
-----------
Value, first and second derivatives of curve.
") D2;
		void D2(const Standard_Real theU, gp_Pnt2d & theValue, gp_Vec2d & theD1, gp_Vec2d & theD2);

		/****** Geom2dEvaluator_OffsetCurve::D3 ******/
		/****** md5 signature: 7ec2bda0e7a7ada3241c38d8733ce22c ******/
		%feature("compactdefaultargs") D3;
		%feature("autodoc", "
Parameters
----------
theU: float
theValue: gp_Pnt2d
theD1: gp_Vec2d
theD2: gp_Vec2d
theD3: gp_Vec2d

Return
-------
None

Description
-----------
Value, first, second and third derivatives of curve.
") D3;
		void D3(const Standard_Real theU, gp_Pnt2d & theValue, gp_Vec2d & theD1, gp_Vec2d & theD2, gp_Vec2d & theD3);

		/****** Geom2dEvaluator_OffsetCurve::DN ******/
		/****** md5 signature: 469c25b71ec08796bfed138071fc68cc ******/
		%feature("compactdefaultargs") DN;
		%feature("autodoc", "
Parameters
----------
theU: float
theDeriv: int

Return
-------
gp_Vec2d

Description
-----------
Calculates N-th derivatives of curve, where N = theDeriv. Raises if N < 1.
") DN;
		gp_Vec2d DN(const Standard_Real theU, const Standard_Integer theDeriv);

		/****** Geom2dEvaluator_OffsetCurve::SetOffsetValue ******/
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

		/****** Geom2dEvaluator_OffsetCurve::ShallowCopy ******/
		/****** md5 signature: 47c85d6b9554037d49c1048fbd4345b2 ******/
		%feature("compactdefaultargs") ShallowCopy;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom2dEvaluator_Curve>

Description
-----------
No available documentation.
") ShallowCopy;
		opencascade::handle<Geom2dEvaluator_Curve> ShallowCopy();

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
/* class aliases */
%pythoncode {
}
/* deprecated methods */
%pythoncode {
@deprecated
def geom2devaluator_CalculateD0(*args):
	return geom2devaluator.CalculateD0(*args)

@deprecated
def geom2devaluator_CalculateD1(*args):
	return geom2devaluator.CalculateD1(*args)

@deprecated
def geom2devaluator_CalculateD2(*args):
	return geom2devaluator.CalculateD2(*args)

@deprecated
def geom2devaluator_CalculateD3(*args):
	return geom2devaluator.CalculateD3(*args)

}
