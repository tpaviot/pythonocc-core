/*
Copyright 2008-2025 Thomas Paviot (tpaviot@gmail.com)

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
%define BREPLPROPDOCSTRING
"BRepLProp module, see official documentation at
https://dev.opencascade.org/doc/occt-7.9.0/refman/html/package_breplprop.html"
%enddef
%module (package="OCC.Core", docstring=BREPLPROPDOCSTRING) BRepLProp


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
#include<BRepLProp_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<BRepAdaptor_module.hxx>
#include<GeomAbs_module.hxx>
#include<gp_module.hxx>
#include<GeomAdaptor_module.hxx>
#include<Geom_module.hxx>
#include<Geom2d_module.hxx>
#include<TopLoc_module.hxx>
#include<Adaptor3d_module.hxx>
#include<TopoDS_module.hxx>
#include<Adaptor2d_module.hxx>
#include<Geom2dAdaptor_module.hxx>
#include<Message_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import BRepAdaptor.i
%import GeomAbs.i
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
/* end handles declaration */

/* templates */
/* end templates declaration */

/* typedefs */
/* end typedefs declaration */

/******************
* class BRepLProp *
******************/
%rename(breplprop) BRepLProp;
class BRepLProp {
	public:
		/****** BRepLProp::Continuity ******/
		/****** md5 signature: 118e941a56db8246021914c9d19cb859 ******/
		%feature("compactdefaultargs") Continuity;
		%feature("autodoc", "
Parameters
----------
C1: BRepAdaptor_Curve
C2: BRepAdaptor_Curve
u1: double
u2: double
tl: double
ta: double

Return
-------
GeomAbs_Shape

Description
-----------
Computes the regularity at the junction between C1 and C2. The point u1 on C1 and the point u2 on C2 must be confused. tl and ta are the linear and angular tolerance used two compare the derivative.
") Continuity;
		static GeomAbs_Shape Continuity(const BRepAdaptor_Curve & C1, const BRepAdaptor_Curve & C2, const double u1, const double u2, const double tl, const double ta);

		/****** BRepLProp::Continuity ******/
		/****** md5 signature: 3681125d2d1d2401f405fdc53903d783 ******/
		%feature("compactdefaultargs") Continuity;
		%feature("autodoc", "
Parameters
----------
C1: BRepAdaptor_Curve
C2: BRepAdaptor_Curve
u1: double
u2: double

Return
-------
GeomAbs_Shape

Description
-----------
The same as preceding but using the standard tolerances from package Precision.
") Continuity;
		static GeomAbs_Shape Continuity(const BRepAdaptor_Curve & C1, const BRepAdaptor_Curve & C2, const double u1, const double u2);

};


%extend BRepLProp {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************
* class BRepLProp_SurfaceTool *
******************************/
class BRepLProp_SurfaceTool {
	public:
		/****** BRepLProp_SurfaceTool::Bounds ******/
		/****** md5 signature: c7d5a820def1e01a8f195d3724c98da5 ******/
		%feature("compactdefaultargs") Bounds;
		%feature("autodoc", "
Parameters
----------
S: BRepAdaptor_Surface

Return
-------
U1: double
V1: double
U2: double
V2: double

Description
-----------
returns the bounds of the Surface.
") Bounds;
		static void Bounds(const BRepAdaptor_Surface & S, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** BRepLProp_SurfaceTool::Continuity ******/
		/****** md5 signature: c83992bc05d4ea7d5255110bb59a00e4 ******/
		%feature("compactdefaultargs") Continuity;
		%feature("autodoc", "
Parameters
----------
S: BRepAdaptor_Surface

Return
-------
int

Description
-----------
returns the order of continuity of the Surface <S>. returns 1: first derivative only is computable returns 2: first and second derivative only are computable.
") Continuity;
		static int Continuity(const BRepAdaptor_Surface & S);

		/****** BRepLProp_SurfaceTool::D1 ******/
		/****** md5 signature: dffe14f018f256d94455a00cd21309ad ******/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "
Parameters
----------
S: BRepAdaptor_Surface
U: double
V: double
P: gp_Pnt
D1U: gp_Vec
D1V: gp_Vec

Return
-------
None

Description
-----------
Computes the point <P> and first derivative <D1*> of parameter <U> and <V> on the Surface <S>.
") D1;
		static void D1(const BRepAdaptor_Surface & S, const double U, const double V, gp_Pnt & P, gp_Vec & D1U, gp_Vec & D1V);

		/****** BRepLProp_SurfaceTool::D2 ******/
		/****** md5 signature: 03524dc53d49775912f96bd37cdcb57c ******/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "
Parameters
----------
S: BRepAdaptor_Surface
U: double
V: double
P: gp_Pnt
D1U: gp_Vec
D1V: gp_Vec
D2U: gp_Vec
D2V: gp_Vec
DUV: gp_Vec

Return
-------
None

Description
-----------
Computes the point <P>, the first derivative <D1*> and second derivative <D2*> of parameter <U> and <V> on the Surface <S>.
") D2;
		static void D2(const BRepAdaptor_Surface & S, const double U, const double V, gp_Pnt & P, gp_Vec & D1U, gp_Vec & D1V, gp_Vec & D2U, gp_Vec & D2V, gp_Vec & DUV);

		/****** BRepLProp_SurfaceTool::DN ******/
		/****** md5 signature: 41c0d45f86a5f541675de49f5a76424a ******/
		%feature("compactdefaultargs") DN;
		%feature("autodoc", "
Parameters
----------
S: BRepAdaptor_Surface
U: double
V: double
IU: int
IV: int

Return
-------
gp_Vec

Description
-----------
No available documentation.
") DN;
		static gp_Vec DN(const BRepAdaptor_Surface & S, const double U, const double V, const int IU, const int IV);

		/****** BRepLProp_SurfaceTool::Value ******/
		/****** md5 signature: 645e12c8feb19524aa03fd49a3baa73e ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
S: BRepAdaptor_Surface
U: double
V: double
P: gp_Pnt

Return
-------
None

Description
-----------
Computes the point <P> of parameter <U> and <V> on the Surface <S>.
") Value;
		static void Value(const BRepAdaptor_Surface & S, const double U, const double V, gp_Pnt & P);

};


%extend BRepLProp_SurfaceTool {
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
def breplprop_Continuity(*args):
	return breplprop.Continuity(*args)

@deprecated
def breplprop_Continuity(*args):
	return breplprop.Continuity(*args)

@deprecated
def BRepLProp_SurfaceTool_Bounds(*args):
	return BRepLProp_SurfaceTool.Bounds(*args)

@deprecated
def BRepLProp_SurfaceTool_Continuity(*args):
	return BRepLProp_SurfaceTool.Continuity(*args)

@deprecated
def BRepLProp_SurfaceTool_D1(*args):
	return BRepLProp_SurfaceTool.D1(*args)

@deprecated
def BRepLProp_SurfaceTool_D2(*args):
	return BRepLProp_SurfaceTool.D2(*args)

@deprecated
def BRepLProp_SurfaceTool_DN(*args):
	return BRepLProp_SurfaceTool.DN(*args)

@deprecated
def BRepLProp_SurfaceTool_Value(*args):
	return BRepLProp_SurfaceTool.Value(*args)

}
