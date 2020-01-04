/*
Copyright 2008-2019 Thomas Paviot (tpaviot@gmail.com)

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
/* public enums */
/* end public enums declaration */

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
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "* Value of 2D curve
	:param theU:
	:type theU: float
	:param theValue:
	:type theValue: gp_Pnt2d
	:rtype: None") D0;
		void D0 (const Standard_Real theU,gp_Pnt2d & theValue);

		/****************** D1 ******************/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "* Value and first derivatives of curve
	:param theU:
	:type theU: float
	:param theValue:
	:type theValue: gp_Pnt2d
	:param theD1:
	:type theD1: gp_Vec2d
	:rtype: None") D1;
		void D1 (const Standard_Real theU,gp_Pnt2d & theValue,gp_Vec2d & theD1);

		/****************** D2 ******************/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "* Value, first and second derivatives of curve
	:param theU:
	:type theU: float
	:param theValue:
	:type theValue: gp_Pnt2d
	:param theD1:
	:type theD1: gp_Vec2d
	:param theD2:
	:type theD2: gp_Vec2d
	:rtype: None") D2;
		void D2 (const Standard_Real theU,gp_Pnt2d & theValue,gp_Vec2d & theD1,gp_Vec2d & theD2);

		/****************** D3 ******************/
		%feature("compactdefaultargs") D3;
		%feature("autodoc", "* Value, first, second and third derivatives of curve
	:param theU:
	:type theU: float
	:param theValue:
	:type theValue: gp_Pnt2d
	:param theD1:
	:type theD1: gp_Vec2d
	:param theD2:
	:type theD2: gp_Vec2d
	:param theD3:
	:type theD3: gp_Vec2d
	:rtype: None") D3;
		void D3 (const Standard_Real theU,gp_Pnt2d & theValue,gp_Vec2d & theD1,gp_Vec2d & theD2,gp_Vec2d & theD3);

		/****************** DN ******************/
		%feature("compactdefaultargs") DN;
		%feature("autodoc", "* Calculates N-th derivatives of curve, where N = theDerU. Raises if N < 1
	:param theU:
	:type theU: float
	:param theDerU:
	:type theDerU: int
	:rtype: gp_Vec2d") DN;
		gp_Vec2d DN (const Standard_Real theU,const Standard_Integer theDerU);

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
		/****************** D0 ******************/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "* Value of curve
	:param theU:
	:type theU: float
	:param theValue:
	:type theValue: gp_Pnt2d
	:rtype: None") D0;
		void D0 (const Standard_Real theU,gp_Pnt2d & theValue);

		/****************** D1 ******************/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "* Value and first derivatives of curve
	:param theU:
	:type theU: float
	:param theValue:
	:type theValue: gp_Pnt2d
	:param theD1:
	:type theD1: gp_Vec2d
	:rtype: None") D1;
		void D1 (const Standard_Real theU,gp_Pnt2d & theValue,gp_Vec2d & theD1);

		/****************** D2 ******************/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "* Value, first and second derivatives of curve
	:param theU:
	:type theU: float
	:param theValue:
	:type theValue: gp_Pnt2d
	:param theD1:
	:type theD1: gp_Vec2d
	:param theD2:
	:type theD2: gp_Vec2d
	:rtype: None") D2;
		void D2 (const Standard_Real theU,gp_Pnt2d & theValue,gp_Vec2d & theD1,gp_Vec2d & theD2);

		/****************** D3 ******************/
		%feature("compactdefaultargs") D3;
		%feature("autodoc", "* Value, first, second and third derivatives of curve
	:param theU:
	:type theU: float
	:param theValue:
	:type theValue: gp_Pnt2d
	:param theD1:
	:type theD1: gp_Vec2d
	:param theD2:
	:type theD2: gp_Vec2d
	:param theD3:
	:type theD3: gp_Vec2d
	:rtype: None") D3;
		void D3 (const Standard_Real theU,gp_Pnt2d & theValue,gp_Vec2d & theD1,gp_Vec2d & theD2,gp_Vec2d & theD3);

		/****************** DN ******************/
		%feature("compactdefaultargs") DN;
		%feature("autodoc", "* Calculates N-th derivatives of curve, where N = theDeriv. Raises if N < 1
	:param theU:
	:type theU: float
	:param theDeriv:
	:type theDeriv: int
	:rtype: gp_Vec2d") DN;
		gp_Vec2d DN (const Standard_Real theU,const Standard_Integer theDeriv);

		/****************** Geom2dEvaluator_OffsetCurve ******************/
		%feature("compactdefaultargs") Geom2dEvaluator_OffsetCurve;
		%feature("autodoc", "* Initialize evaluator by curve
	:param theBase:
	:type theBase: Geom2d_Curve
	:param theOffset:
	:type theOffset: float
	:rtype: None") Geom2dEvaluator_OffsetCurve;
		 Geom2dEvaluator_OffsetCurve (const opencascade::handle<Geom2d_Curve> & theBase,const Standard_Real theOffset);

		/****************** Geom2dEvaluator_OffsetCurve ******************/
		%feature("compactdefaultargs") Geom2dEvaluator_OffsetCurve;
		%feature("autodoc", "* Initialize evaluator by curve adaptor
	:param theBase:
	:type theBase: Geom2dAdaptor_HCurve
	:param theOffset:
	:type theOffset: float
	:rtype: None") Geom2dEvaluator_OffsetCurve;
		 Geom2dEvaluator_OffsetCurve (const opencascade::handle<Geom2dAdaptor_HCurve> & theBase,const Standard_Real theOffset);

		/****************** SetOffsetValue ******************/
		%feature("compactdefaultargs") SetOffsetValue;
		%feature("autodoc", "* Change the offset value
	:param theOffset:
	:type theOffset: float
	:rtype: None") SetOffsetValue;
		void SetOffsetValue (Standard_Real theOffset);

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
