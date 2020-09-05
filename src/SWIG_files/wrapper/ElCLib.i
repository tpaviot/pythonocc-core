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
%define ELCLIBDOCSTRING
"ElCLib module, see official documentation at
https://www.opencascade.com/doc/occt-7.4.0/refman/html/package_elclib.html"
%enddef
%module (package="OCC.Core", docstring=ELCLIBDOCSTRING) ElCLib


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
#include<ElCLib_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<gp_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
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
/* end handles declaration */

/* templates */
/* end templates declaration */

/* typedefs */
/* end typedefs declaration */

/***************
* class ElCLib *
***************/
%rename(elclib) ElCLib;
class ElCLib {
	public:
		/****************** AdjustPeriodic ******************/
		/**** md5 signature: 7e4e736e11484939c8dff18f732b6618 ****/
		%feature("compactdefaultargs") AdjustPeriodic;
		%feature("autodoc", "Adjust u1 and u2 in the parametric range ufirst ulast of a periodic curve, where ulast - ufirst is its period. to do this, this function: - sets u1 in the range [ ufirst, ulast ] by adding/removing the period to/from the value u1, then - sets u2 in the range [ u1, u1 + period ] by adding/removing the period to/from the value u2. precision is used to test the equalities.

Parameters
----------
UFirst: float
ULast: float
Precision: float

Returns
-------
U1: float
U2: float
") AdjustPeriodic;
		static void AdjustPeriodic(const Standard_Real UFirst, const Standard_Real ULast, const Standard_Real Precision, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** CircleD1 ******************/
		/**** md5 signature: 1732223aff472369d5a24b4ce7e8c1b2 ****/
		%feature("compactdefaultargs") CircleD1;
		%feature("autodoc", "No available documentation.

Parameters
----------
U: float
Pos: gp_Ax2
Radius: float
P: gp_Pnt
V1: gp_Vec

Returns
-------
None
") CircleD1;
		static void CircleD1(const Standard_Real U, const gp_Ax2 & Pos, const Standard_Real Radius, gp_Pnt & P, gp_Vec & V1);

		/****************** CircleD1 ******************/
		/**** md5 signature: 6044b15cc56f7cdb76cf5e9f3221b800 ****/
		%feature("compactdefaultargs") CircleD1;
		%feature("autodoc", "No available documentation.

Parameters
----------
U: float
Pos: gp_Ax22d
Radius: float
P: gp_Pnt2d
V1: gp_Vec2d

Returns
-------
None
") CircleD1;
		static void CircleD1(const Standard_Real U, const gp_Ax22d & Pos, const Standard_Real Radius, gp_Pnt2d & P, gp_Vec2d & V1);

		/****************** CircleD2 ******************/
		/**** md5 signature: 061f949b4f38b316133e8a7030c1979a ****/
		%feature("compactdefaultargs") CircleD2;
		%feature("autodoc", "No available documentation.

Parameters
----------
U: float
Pos: gp_Ax2
Radius: float
P: gp_Pnt
V1: gp_Vec
V2: gp_Vec

Returns
-------
None
") CircleD2;
		static void CircleD2(const Standard_Real U, const gp_Ax2 & Pos, const Standard_Real Radius, gp_Pnt & P, gp_Vec & V1, gp_Vec & V2);

		/****************** CircleD2 ******************/
		/**** md5 signature: 94490ed36a73babf84f582d37201ac87 ****/
		%feature("compactdefaultargs") CircleD2;
		%feature("autodoc", "No available documentation.

Parameters
----------
U: float
Pos: gp_Ax22d
Radius: float
P: gp_Pnt2d
V1: gp_Vec2d
V2: gp_Vec2d

Returns
-------
None
") CircleD2;
		static void CircleD2(const Standard_Real U, const gp_Ax22d & Pos, const Standard_Real Radius, gp_Pnt2d & P, gp_Vec2d & V1, gp_Vec2d & V2);

		/****************** CircleD3 ******************/
		/**** md5 signature: 6e27ee9ae6fd48002ff421549b3557ae ****/
		%feature("compactdefaultargs") CircleD3;
		%feature("autodoc", "No available documentation.

Parameters
----------
U: float
Pos: gp_Ax2
Radius: float
P: gp_Pnt
V1: gp_Vec
V2: gp_Vec
V3: gp_Vec

Returns
-------
None
") CircleD3;
		static void CircleD3(const Standard_Real U, const gp_Ax2 & Pos, const Standard_Real Radius, gp_Pnt & P, gp_Vec & V1, gp_Vec & V2, gp_Vec & V3);

		/****************** CircleD3 ******************/
		/**** md5 signature: abdeacc35ed48e6fde962dc0dceb8902 ****/
		%feature("compactdefaultargs") CircleD3;
		%feature("autodoc", "No available documentation.

Parameters
----------
U: float
Pos: gp_Ax22d
Radius: float
P: gp_Pnt2d
V1: gp_Vec2d
V2: gp_Vec2d
V3: gp_Vec2d

Returns
-------
None
") CircleD3;
		static void CircleD3(const Standard_Real U, const gp_Ax22d & Pos, const Standard_Real Radius, gp_Pnt2d & P, gp_Vec2d & V1, gp_Vec2d & V2, gp_Vec2d & V3);

		/****************** CircleDN ******************/
		/**** md5 signature: 5c8adfb9e6b9466f039573c51d124f27 ****/
		%feature("compactdefaultargs") CircleDN;
		%feature("autodoc", "No available documentation.

Parameters
----------
U: float
Pos: gp_Ax2
Radius: float
N: int

Returns
-------
gp_Vec
") CircleDN;
		static gp_Vec CircleDN(const Standard_Real U, const gp_Ax2 & Pos, const Standard_Real Radius, const Standard_Integer N);

		/****************** CircleDN ******************/
		/**** md5 signature: 7d799cf3237462c7e93916f300ba5a96 ****/
		%feature("compactdefaultargs") CircleDN;
		%feature("autodoc", "No available documentation.

Parameters
----------
U: float
Pos: gp_Ax22d
Radius: float
N: int

Returns
-------
gp_Vec2d
") CircleDN;
		static gp_Vec2d CircleDN(const Standard_Real U, const gp_Ax22d & Pos, const Standard_Real Radius, const Standard_Integer N);

		/****************** CircleParameter ******************/
		/**** md5 signature: 26a6c62dffefcf8a3d41e5df4c618fb4 ****/
		%feature("compactdefaultargs") CircleParameter;
		%feature("autodoc", "No available documentation.

Parameters
----------
Pos: gp_Ax2
P: gp_Pnt

Returns
-------
float
") CircleParameter;
		static Standard_Real CircleParameter(const gp_Ax2 & Pos, const gp_Pnt & P);

		/****************** CircleParameter ******************/
		/**** md5 signature: ba68b13a794fae7ac895861855220d57 ****/
		%feature("compactdefaultargs") CircleParameter;
		%feature("autodoc", "Pos is the axis of the circle parametrization in the local coordinate system of the circle x (u) = radius * cos (u) y (u) = radius * sin (u).

Parameters
----------
Pos: gp_Ax22d
P: gp_Pnt2d

Returns
-------
float
") CircleParameter;
		static Standard_Real CircleParameter(const gp_Ax22d & Pos, const gp_Pnt2d & P);

		/****************** CircleValue ******************/
		/**** md5 signature: f1c4f3dd63490877f61a734b1473fd15 ****/
		%feature("compactdefaultargs") CircleValue;
		%feature("autodoc", "No available documentation.

Parameters
----------
U: float
Pos: gp_Ax2
Radius: float

Returns
-------
gp_Pnt
") CircleValue;
		static gp_Pnt CircleValue(const Standard_Real U, const gp_Ax2 & Pos, const Standard_Real Radius);

		/****************** CircleValue ******************/
		/**** md5 signature: a254ad35f2d5ff777499e60061cecbf0 ****/
		%feature("compactdefaultargs") CircleValue;
		%feature("autodoc", "No available documentation.

Parameters
----------
U: float
Pos: gp_Ax22d
Radius: float

Returns
-------
gp_Pnt2d
") CircleValue;
		static gp_Pnt2d CircleValue(const Standard_Real U, const gp_Ax22d & Pos, const Standard_Real Radius);

		/****************** D1 ******************/
		/**** md5 signature: 2348e372c613ae0b91de8a60ff4c1d96 ****/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "For elementary curves (lines, circles and conics) from the gp package, computes: - the point p of parameter u, and - the first derivative vector v1 at this point. the results p and v1 are either: - a gp_pnt point and a gp_vec vector, for a curve in 3d space, or - a gp_pnt2d point and a gp_vec2d vector, for a curve in 2d space.

Parameters
----------
U: float
L: gp_Lin
P: gp_Pnt
V1: gp_Vec

Returns
-------
None
") D1;
		static void D1(const Standard_Real U, const gp_Lin & L, gp_Pnt & P, gp_Vec & V1);

		/****************** D1 ******************/
		/**** md5 signature: 5764c3935590a35e746844167678c383 ****/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "No available documentation.

Parameters
----------
U: float
C: gp_Circ
P: gp_Pnt
V1: gp_Vec

Returns
-------
None
") D1;
		static void D1(const Standard_Real U, const gp_Circ & C, gp_Pnt & P, gp_Vec & V1);

		/****************** D1 ******************/
		/**** md5 signature: 5aa41c2b42fa990f167d06b62da72a60 ****/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "No available documentation.

Parameters
----------
U: float
E: gp_Elips
P: gp_Pnt
V1: gp_Vec

Returns
-------
None
") D1;
		static void D1(const Standard_Real U, const gp_Elips & E, gp_Pnt & P, gp_Vec & V1);

		/****************** D1 ******************/
		/**** md5 signature: f33366e613106b45ca1fa0b63ec1a193 ****/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "No available documentation.

Parameters
----------
U: float
H: gp_Hypr
P: gp_Pnt
V1: gp_Vec

Returns
-------
None
") D1;
		static void D1(const Standard_Real U, const gp_Hypr & H, gp_Pnt & P, gp_Vec & V1);

		/****************** D1 ******************/
		/**** md5 signature: bcd87a30e4fb1b4185175041d43b84b4 ****/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "No available documentation.

Parameters
----------
U: float
Prb: gp_Parab
P: gp_Pnt
V1: gp_Vec

Returns
-------
None
") D1;
		static void D1(const Standard_Real U, const gp_Parab & Prb, gp_Pnt & P, gp_Vec & V1);

		/****************** D1 ******************/
		/**** md5 signature: 5e08453e4d72f76c239039b9fcf805af ****/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "No available documentation.

Parameters
----------
U: float
L: gp_Lin2d
P: gp_Pnt2d
V1: gp_Vec2d

Returns
-------
None
") D1;
		static void D1(const Standard_Real U, const gp_Lin2d & L, gp_Pnt2d & P, gp_Vec2d & V1);

		/****************** D1 ******************/
		/**** md5 signature: cb123a1582eec6ad30ae203aa5b3dd5b ****/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "No available documentation.

Parameters
----------
U: float
C: gp_Circ2d
P: gp_Pnt2d
V1: gp_Vec2d

Returns
-------
None
") D1;
		static void D1(const Standard_Real U, const gp_Circ2d & C, gp_Pnt2d & P, gp_Vec2d & V1);

		/****************** D1 ******************/
		/**** md5 signature: 50be3a7f16ec4ee1e8cb046024b4e091 ****/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "No available documentation.

Parameters
----------
U: float
E: gp_Elips2d
P: gp_Pnt2d
V1: gp_Vec2d

Returns
-------
None
") D1;
		static void D1(const Standard_Real U, const gp_Elips2d & E, gp_Pnt2d & P, gp_Vec2d & V1);

		/****************** D1 ******************/
		/**** md5 signature: 2c1cb396fe733147144fdabd58e5b9b8 ****/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "No available documentation.

Parameters
----------
U: float
H: gp_Hypr2d
P: gp_Pnt2d
V1: gp_Vec2d

Returns
-------
None
") D1;
		static void D1(const Standard_Real U, const gp_Hypr2d & H, gp_Pnt2d & P, gp_Vec2d & V1);

		/****************** D1 ******************/
		/**** md5 signature: e3323af4d4584a4719fee23df6a2cfd1 ****/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "No available documentation.

Parameters
----------
U: float
Prb: gp_Parab2d
P: gp_Pnt2d
V1: gp_Vec2d

Returns
-------
None
") D1;
		static void D1(const Standard_Real U, const gp_Parab2d & Prb, gp_Pnt2d & P, gp_Vec2d & V1);

		/****************** D2 ******************/
		/**** md5 signature: f220a759c5390f272acbdf7473bf89c5 ****/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "For elementary curves (circles and conics) from the gp package, computes: - the point p of parameter u, and - the first and second derivative vectors v1 and v2 at this point. the results, p, v1 and v2, are either: - a gp_pnt point and two gp_vec vectors, for a curve in 3d space, or - a gp_pnt2d point and two gp_vec2d vectors, for a curve in 2d space.

Parameters
----------
U: float
C: gp_Circ
P: gp_Pnt
V1: gp_Vec
V2: gp_Vec

Returns
-------
None
") D2;
		static void D2(const Standard_Real U, const gp_Circ & C, gp_Pnt & P, gp_Vec & V1, gp_Vec & V2);

		/****************** D2 ******************/
		/**** md5 signature: 9f99502ea2bb4230feece4e7519388eb ****/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "No available documentation.

Parameters
----------
U: float
E: gp_Elips
P: gp_Pnt
V1: gp_Vec
V2: gp_Vec

Returns
-------
None
") D2;
		static void D2(const Standard_Real U, const gp_Elips & E, gp_Pnt & P, gp_Vec & V1, gp_Vec & V2);

		/****************** D2 ******************/
		/**** md5 signature: ae81bfd7063ec89ba29dedd16adfa97c ****/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "No available documentation.

Parameters
----------
U: float
H: gp_Hypr
P: gp_Pnt
V1: gp_Vec
V2: gp_Vec

Returns
-------
None
") D2;
		static void D2(const Standard_Real U, const gp_Hypr & H, gp_Pnt & P, gp_Vec & V1, gp_Vec & V2);

		/****************** D2 ******************/
		/**** md5 signature: af24c765387cb94b2673a43c40a395f3 ****/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "No available documentation.

Parameters
----------
U: float
Prb: gp_Parab
P: gp_Pnt
V1: gp_Vec
V2: gp_Vec

Returns
-------
None
") D2;
		static void D2(const Standard_Real U, const gp_Parab & Prb, gp_Pnt & P, gp_Vec & V1, gp_Vec & V2);

		/****************** D2 ******************/
		/**** md5 signature: b71866e4b68be26ce3861d909a3db5ab ****/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "No available documentation.

Parameters
----------
U: float
C: gp_Circ2d
P: gp_Pnt2d
V1: gp_Vec2d
V2: gp_Vec2d

Returns
-------
None
") D2;
		static void D2(const Standard_Real U, const gp_Circ2d & C, gp_Pnt2d & P, gp_Vec2d & V1, gp_Vec2d & V2);

		/****************** D2 ******************/
		/**** md5 signature: ef9a85e18324dde449ab962fe75d0de0 ****/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "No available documentation.

Parameters
----------
U: float
E: gp_Elips2d
P: gp_Pnt2d
V1: gp_Vec2d
V2: gp_Vec2d

Returns
-------
None
") D2;
		static void D2(const Standard_Real U, const gp_Elips2d & E, gp_Pnt2d & P, gp_Vec2d & V1, gp_Vec2d & V2);

		/****************** D2 ******************/
		/**** md5 signature: 7e73a41bf37e135bd7dcd253f7c005f5 ****/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "No available documentation.

Parameters
----------
U: float
H: gp_Hypr2d
P: gp_Pnt2d
V1: gp_Vec2d
V2: gp_Vec2d

Returns
-------
None
") D2;
		static void D2(const Standard_Real U, const gp_Hypr2d & H, gp_Pnt2d & P, gp_Vec2d & V1, gp_Vec2d & V2);

		/****************** D2 ******************/
		/**** md5 signature: c574c1139e0e7d2678634d07213fd831 ****/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "No available documentation.

Parameters
----------
U: float
Prb: gp_Parab2d
P: gp_Pnt2d
V1: gp_Vec2d
V2: gp_Vec2d

Returns
-------
None
") D2;
		static void D2(const Standard_Real U, const gp_Parab2d & Prb, gp_Pnt2d & P, gp_Vec2d & V1, gp_Vec2d & V2);

		/****************** D3 ******************/
		/**** md5 signature: 88a0f31d8d88acd9379427f8056f536e ****/
		%feature("compactdefaultargs") D3;
		%feature("autodoc", "For elementary curves (circles, ellipses and hyperbolae) from the gp package, computes: - the point p of parameter u, and - the first, second and third derivative vectors v1, v2 and v3 at this point. the results, p, v1, v2 and v3, are either: - a gp_pnt point and three gp_vec vectors, for a curve in 3d space, or - a gp_pnt2d point and three gp_vec2d vectors, for a curve in 2d space.

Parameters
----------
U: float
C: gp_Circ
P: gp_Pnt
V1: gp_Vec
V2: gp_Vec
V3: gp_Vec

Returns
-------
None
") D3;
		static void D3(const Standard_Real U, const gp_Circ & C, gp_Pnt & P, gp_Vec & V1, gp_Vec & V2, gp_Vec & V3);

		/****************** D3 ******************/
		/**** md5 signature: 3f664f004eb6420555d34db3336d8ffc ****/
		%feature("compactdefaultargs") D3;
		%feature("autodoc", "No available documentation.

Parameters
----------
U: float
E: gp_Elips
P: gp_Pnt
V1: gp_Vec
V2: gp_Vec
V3: gp_Vec

Returns
-------
None
") D3;
		static void D3(const Standard_Real U, const gp_Elips & E, gp_Pnt & P, gp_Vec & V1, gp_Vec & V2, gp_Vec & V3);

		/****************** D3 ******************/
		/**** md5 signature: bf8de95ac722e89f12108e313766c3ca ****/
		%feature("compactdefaultargs") D3;
		%feature("autodoc", "No available documentation.

Parameters
----------
U: float
H: gp_Hypr
P: gp_Pnt
V1: gp_Vec
V2: gp_Vec
V3: gp_Vec

Returns
-------
None
") D3;
		static void D3(const Standard_Real U, const gp_Hypr & H, gp_Pnt & P, gp_Vec & V1, gp_Vec & V2, gp_Vec & V3);

		/****************** D3 ******************/
		/**** md5 signature: 1ed246904267606ef73603a752190250 ****/
		%feature("compactdefaultargs") D3;
		%feature("autodoc", "No available documentation.

Parameters
----------
U: float
C: gp_Circ2d
P: gp_Pnt2d
V1: gp_Vec2d
V2: gp_Vec2d
V3: gp_Vec2d

Returns
-------
None
") D3;
		static void D3(const Standard_Real U, const gp_Circ2d & C, gp_Pnt2d & P, gp_Vec2d & V1, gp_Vec2d & V2, gp_Vec2d & V3);

		/****************** D3 ******************/
		/**** md5 signature: f364e91b0c7b85480d4dc2f59acb2ef4 ****/
		%feature("compactdefaultargs") D3;
		%feature("autodoc", "No available documentation.

Parameters
----------
U: float
E: gp_Elips2d
P: gp_Pnt2d
V1: gp_Vec2d
V2: gp_Vec2d
V3: gp_Vec2d

Returns
-------
None
") D3;
		static void D3(const Standard_Real U, const gp_Elips2d & E, gp_Pnt2d & P, gp_Vec2d & V1, gp_Vec2d & V2, gp_Vec2d & V3);

		/****************** D3 ******************/
		/**** md5 signature: 6f375725aae2577b37e04467cea54a5c ****/
		%feature("compactdefaultargs") D3;
		%feature("autodoc", "In the following functions n is the order of derivation and should be greater than 0.

Parameters
----------
U: float
H: gp_Hypr2d
P: gp_Pnt2d
V1: gp_Vec2d
V2: gp_Vec2d
V3: gp_Vec2d

Returns
-------
None
") D3;
		static void D3(const Standard_Real U, const gp_Hypr2d & H, gp_Pnt2d & P, gp_Vec2d & V1, gp_Vec2d & V2, gp_Vec2d & V3);

		/****************** DN ******************/
		/**** md5 signature: 906dd97634ae8e18db20f8c3ba953acb ****/
		%feature("compactdefaultargs") DN;
		%feature("autodoc", "For elementary curves (lines, circles and conics) from the gp package, computes the vector corresponding to the nth derivative at the point of parameter u. the result is either: - a gp_vec vector for a curve in 3d space, or - a gp_vec2d vector for a curve in 2d space. in the following functions n is the order of derivation and should be greater than 0.

Parameters
----------
U: float
L: gp_Lin
N: int

Returns
-------
gp_Vec
") DN;
		static gp_Vec DN(const Standard_Real U, const gp_Lin & L, const Standard_Integer N);

		/****************** DN ******************/
		/**** md5 signature: 47f8242822c8cea0c08c698c6bbcdfe3 ****/
		%feature("compactdefaultargs") DN;
		%feature("autodoc", "No available documentation.

Parameters
----------
U: float
C: gp_Circ
N: int

Returns
-------
gp_Vec
") DN;
		static gp_Vec DN(const Standard_Real U, const gp_Circ & C, const Standard_Integer N);

		/****************** DN ******************/
		/**** md5 signature: 5a6acea0b3373b42b9c4e893f6261cba ****/
		%feature("compactdefaultargs") DN;
		%feature("autodoc", "No available documentation.

Parameters
----------
U: float
E: gp_Elips
N: int

Returns
-------
gp_Vec
") DN;
		static gp_Vec DN(const Standard_Real U, const gp_Elips & E, const Standard_Integer N);

		/****************** DN ******************/
		/**** md5 signature: 49583a74ba80488d4c4ad2e6926b78df ****/
		%feature("compactdefaultargs") DN;
		%feature("autodoc", "No available documentation.

Parameters
----------
U: float
H: gp_Hypr
N: int

Returns
-------
gp_Vec
") DN;
		static gp_Vec DN(const Standard_Real U, const gp_Hypr & H, const Standard_Integer N);

		/****************** DN ******************/
		/**** md5 signature: 903db7d628a4fcb02e293930cab55cbd ****/
		%feature("compactdefaultargs") DN;
		%feature("autodoc", "No available documentation.

Parameters
----------
U: float
Prb: gp_Parab
N: int

Returns
-------
gp_Vec
") DN;
		static gp_Vec DN(const Standard_Real U, const gp_Parab & Prb, const Standard_Integer N);

		/****************** DN ******************/
		/**** md5 signature: 17e6278397b957ffc39900585a83f3d3 ****/
		%feature("compactdefaultargs") DN;
		%feature("autodoc", "No available documentation.

Parameters
----------
U: float
L: gp_Lin2d
N: int

Returns
-------
gp_Vec2d
") DN;
		static gp_Vec2d DN(const Standard_Real U, const gp_Lin2d & L, const Standard_Integer N);

		/****************** DN ******************/
		/**** md5 signature: 1a4ae9e4518239fc3f7b2739e72360c5 ****/
		%feature("compactdefaultargs") DN;
		%feature("autodoc", "No available documentation.

Parameters
----------
U: float
C: gp_Circ2d
N: int

Returns
-------
gp_Vec2d
") DN;
		static gp_Vec2d DN(const Standard_Real U, const gp_Circ2d & C, const Standard_Integer N);

		/****************** DN ******************/
		/**** md5 signature: 8112c6ea5074c210244d783558f657af ****/
		%feature("compactdefaultargs") DN;
		%feature("autodoc", "No available documentation.

Parameters
----------
U: float
E: gp_Elips2d
N: int

Returns
-------
gp_Vec2d
") DN;
		static gp_Vec2d DN(const Standard_Real U, const gp_Elips2d & E, const Standard_Integer N);

		/****************** DN ******************/
		/**** md5 signature: 0f4adb9b37809fe774928577eacfadd4 ****/
		%feature("compactdefaultargs") DN;
		%feature("autodoc", "No available documentation.

Parameters
----------
U: float
H: gp_Hypr2d
N: int

Returns
-------
gp_Vec2d
") DN;
		static gp_Vec2d DN(const Standard_Real U, const gp_Hypr2d & H, const Standard_Integer N);

		/****************** DN ******************/
		/**** md5 signature: e67031172b84f3a3b132c1cfa1e007a5 ****/
		%feature("compactdefaultargs") DN;
		%feature("autodoc", "No available documentation.

Parameters
----------
U: float
Prb: gp_Parab2d
N: int

Returns
-------
gp_Vec2d
") DN;
		static gp_Vec2d DN(const Standard_Real U, const gp_Parab2d & Prb, const Standard_Integer N);

		/****************** EllipseD1 ******************/
		/**** md5 signature: 6593b6832008eb1e08ba875629ec6f2d ****/
		%feature("compactdefaultargs") EllipseD1;
		%feature("autodoc", "No available documentation.

Parameters
----------
U: float
Pos: gp_Ax2
MajorRadius: float
MinorRadius: float
P: gp_Pnt
V1: gp_Vec

Returns
-------
None
") EllipseD1;
		static void EllipseD1(const Standard_Real U, const gp_Ax2 & Pos, const Standard_Real MajorRadius, const Standard_Real MinorRadius, gp_Pnt & P, gp_Vec & V1);

		/****************** EllipseD1 ******************/
		/**** md5 signature: 093400b65d5ddd2d995df1f71658bd2f ****/
		%feature("compactdefaultargs") EllipseD1;
		%feature("autodoc", "No available documentation.

Parameters
----------
U: float
Pos: gp_Ax22d
MajorRadius: float
MinorRadius: float
P: gp_Pnt2d
V1: gp_Vec2d

Returns
-------
None
") EllipseD1;
		static void EllipseD1(const Standard_Real U, const gp_Ax22d & Pos, const Standard_Real MajorRadius, const Standard_Real MinorRadius, gp_Pnt2d & P, gp_Vec2d & V1);

		/****************** EllipseD2 ******************/
		/**** md5 signature: 94e6352d82f5a718596085ae6192b0f4 ****/
		%feature("compactdefaultargs") EllipseD2;
		%feature("autodoc", "No available documentation.

Parameters
----------
U: float
Pos: gp_Ax2
MajorRadius: float
MinorRadius: float
P: gp_Pnt
V1: gp_Vec
V2: gp_Vec

Returns
-------
None
") EllipseD2;
		static void EllipseD2(const Standard_Real U, const gp_Ax2 & Pos, const Standard_Real MajorRadius, const Standard_Real MinorRadius, gp_Pnt & P, gp_Vec & V1, gp_Vec & V2);

		/****************** EllipseD2 ******************/
		/**** md5 signature: f1ac8bac2488b01be483ca73b4d96525 ****/
		%feature("compactdefaultargs") EllipseD2;
		%feature("autodoc", "No available documentation.

Parameters
----------
U: float
Pos: gp_Ax22d
MajorRadius: float
MinorRadius: float
P: gp_Pnt2d
V1: gp_Vec2d
V2: gp_Vec2d

Returns
-------
None
") EllipseD2;
		static void EllipseD2(const Standard_Real U, const gp_Ax22d & Pos, const Standard_Real MajorRadius, const Standard_Real MinorRadius, gp_Pnt2d & P, gp_Vec2d & V1, gp_Vec2d & V2);

		/****************** EllipseD3 ******************/
		/**** md5 signature: a8d0a37bfdd61c8132ad02bcd42abf97 ****/
		%feature("compactdefaultargs") EllipseD3;
		%feature("autodoc", "No available documentation.

Parameters
----------
U: float
Pos: gp_Ax2
MajorRadius: float
MinorRadius: float
P: gp_Pnt
V1: gp_Vec
V2: gp_Vec
V3: gp_Vec

Returns
-------
None
") EllipseD3;
		static void EllipseD3(const Standard_Real U, const gp_Ax2 & Pos, const Standard_Real MajorRadius, const Standard_Real MinorRadius, gp_Pnt & P, gp_Vec & V1, gp_Vec & V2, gp_Vec & V3);

		/****************** EllipseD3 ******************/
		/**** md5 signature: bdd32b73f0c9829834faf35dd0229e32 ****/
		%feature("compactdefaultargs") EllipseD3;
		%feature("autodoc", "No available documentation.

Parameters
----------
U: float
Pos: gp_Ax22d
MajorRadius: float
MinorRadius: float
P: gp_Pnt2d
V1: gp_Vec2d
V2: gp_Vec2d
V3: gp_Vec2d

Returns
-------
None
") EllipseD3;
		static void EllipseD3(const Standard_Real U, const gp_Ax22d & Pos, const Standard_Real MajorRadius, const Standard_Real MinorRadius, gp_Pnt2d & P, gp_Vec2d & V1, gp_Vec2d & V2, gp_Vec2d & V3);

		/****************** EllipseDN ******************/
		/**** md5 signature: f8970908a0d6bbf296e004aee7c8dd5f ****/
		%feature("compactdefaultargs") EllipseDN;
		%feature("autodoc", "No available documentation.

Parameters
----------
U: float
Pos: gp_Ax2
MajorRadius: float
MinorRadius: float
N: int

Returns
-------
gp_Vec
") EllipseDN;
		static gp_Vec EllipseDN(const Standard_Real U, const gp_Ax2 & Pos, const Standard_Real MajorRadius, const Standard_Real MinorRadius, const Standard_Integer N);

		/****************** EllipseDN ******************/
		/**** md5 signature: fa95cba3bb71049e0dbda3c5897cf3f7 ****/
		%feature("compactdefaultargs") EllipseDN;
		%feature("autodoc", "No available documentation.

Parameters
----------
U: float
Pos: gp_Ax22d
MajorRadius: float
MinorRadius: float
N: int

Returns
-------
gp_Vec2d
") EllipseDN;
		static gp_Vec2d EllipseDN(const Standard_Real U, const gp_Ax22d & Pos, const Standard_Real MajorRadius, const Standard_Real MinorRadius, const Standard_Integer N);

		/****************** EllipseParameter ******************/
		/**** md5 signature: 7ea0af8a159007b224c805cd6b2750fb ****/
		%feature("compactdefaultargs") EllipseParameter;
		%feature("autodoc", "No available documentation.

Parameters
----------
Pos: gp_Ax2
MajorRadius: float
MinorRadius: float
P: gp_Pnt

Returns
-------
float
") EllipseParameter;
		static Standard_Real EllipseParameter(const gp_Ax2 & Pos, const Standard_Real MajorRadius, const Standard_Real MinorRadius, const gp_Pnt & P);

		/****************** EllipseParameter ******************/
		/**** md5 signature: 9adc5af57d198107ea118e0a5118ff8b ****/
		%feature("compactdefaultargs") EllipseParameter;
		%feature("autodoc", "Pos is the axis of the ellipse parametrization in the local coordinate system of the ellipse x (u) = majorradius * cos (u) y (u) = minorradius * sin (u).

Parameters
----------
Pos: gp_Ax22d
MajorRadius: float
MinorRadius: float
P: gp_Pnt2d

Returns
-------
float
") EllipseParameter;
		static Standard_Real EllipseParameter(const gp_Ax22d & Pos, const Standard_Real MajorRadius, const Standard_Real MinorRadius, const gp_Pnt2d & P);

		/****************** EllipseValue ******************/
		/**** md5 signature: d54582fecc06252f293f1a1e61001a89 ****/
		%feature("compactdefaultargs") EllipseValue;
		%feature("autodoc", "No available documentation.

Parameters
----------
U: float
Pos: gp_Ax2
MajorRadius: float
MinorRadius: float

Returns
-------
gp_Pnt
") EllipseValue;
		static gp_Pnt EllipseValue(const Standard_Real U, const gp_Ax2 & Pos, const Standard_Real MajorRadius, const Standard_Real MinorRadius);

		/****************** EllipseValue ******************/
		/**** md5 signature: fa1d15069b68a59764b437be76d05088 ****/
		%feature("compactdefaultargs") EllipseValue;
		%feature("autodoc", "No available documentation.

Parameters
----------
U: float
Pos: gp_Ax22d
MajorRadius: float
MinorRadius: float

Returns
-------
gp_Pnt2d
") EllipseValue;
		static gp_Pnt2d EllipseValue(const Standard_Real U, const gp_Ax22d & Pos, const Standard_Real MajorRadius, const Standard_Real MinorRadius);

		/****************** HyperbolaD1 ******************/
		/**** md5 signature: 033ede559cba6ac21a9fef26462ef8f3 ****/
		%feature("compactdefaultargs") HyperbolaD1;
		%feature("autodoc", "No available documentation.

Parameters
----------
U: float
Pos: gp_Ax2
MajorRadius: float
MinorRadius: float
P: gp_Pnt
V1: gp_Vec

Returns
-------
None
") HyperbolaD1;
		static void HyperbolaD1(const Standard_Real U, const gp_Ax2 & Pos, const Standard_Real MajorRadius, const Standard_Real MinorRadius, gp_Pnt & P, gp_Vec & V1);

		/****************** HyperbolaD1 ******************/
		/**** md5 signature: 3a363cda94c2cd01407e26d1c78ade9f ****/
		%feature("compactdefaultargs") HyperbolaD1;
		%feature("autodoc", "No available documentation.

Parameters
----------
U: float
Pos: gp_Ax22d
MajorRadius: float
MinorRadius: float
P: gp_Pnt2d
V1: gp_Vec2d

Returns
-------
None
") HyperbolaD1;
		static void HyperbolaD1(const Standard_Real U, const gp_Ax22d & Pos, const Standard_Real MajorRadius, const Standard_Real MinorRadius, gp_Pnt2d & P, gp_Vec2d & V1);

		/****************** HyperbolaD2 ******************/
		/**** md5 signature: 03a91b782355142e9ddd64b2e17c1677 ****/
		%feature("compactdefaultargs") HyperbolaD2;
		%feature("autodoc", "No available documentation.

Parameters
----------
U: float
Pos: gp_Ax2
MajorRadius: float
MinorRadius: float
P: gp_Pnt
V1: gp_Vec
V2: gp_Vec

Returns
-------
None
") HyperbolaD2;
		static void HyperbolaD2(const Standard_Real U, const gp_Ax2 & Pos, const Standard_Real MajorRadius, const Standard_Real MinorRadius, gp_Pnt & P, gp_Vec & V1, gp_Vec & V2);

		/****************** HyperbolaD2 ******************/
		/**** md5 signature: b2e405bb7c4b37e6d87915716f83a4e8 ****/
		%feature("compactdefaultargs") HyperbolaD2;
		%feature("autodoc", "No available documentation.

Parameters
----------
U: float
Pos: gp_Ax22d
MajorRadius: float
MinorRadius: float
P: gp_Pnt2d
V1: gp_Vec2d
V2: gp_Vec2d

Returns
-------
None
") HyperbolaD2;
		static void HyperbolaD2(const Standard_Real U, const gp_Ax22d & Pos, const Standard_Real MajorRadius, const Standard_Real MinorRadius, gp_Pnt2d & P, gp_Vec2d & V1, gp_Vec2d & V2);

		/****************** HyperbolaD3 ******************/
		/**** md5 signature: 238469a3dbbc424fea9a1937c9e00668 ****/
		%feature("compactdefaultargs") HyperbolaD3;
		%feature("autodoc", "No available documentation.

Parameters
----------
U: float
Pos: gp_Ax2
MajorRadius: float
MinorRadius: float
P: gp_Pnt
V1: gp_Vec
V2: gp_Vec
V3: gp_Vec

Returns
-------
None
") HyperbolaD3;
		static void HyperbolaD3(const Standard_Real U, const gp_Ax2 & Pos, const Standard_Real MajorRadius, const Standard_Real MinorRadius, gp_Pnt & P, gp_Vec & V1, gp_Vec & V2, gp_Vec & V3);

		/****************** HyperbolaD3 ******************/
		/**** md5 signature: b906249598c170d7267f6ac98714d87f ****/
		%feature("compactdefaultargs") HyperbolaD3;
		%feature("autodoc", "In the following functions n is the order of derivation and should be greater than 0.

Parameters
----------
U: float
Pos: gp_Ax22d
MajorRadius: float
MinorRadius: float
P: gp_Pnt2d
V1: gp_Vec2d
V2: gp_Vec2d
V3: gp_Vec2d

Returns
-------
None
") HyperbolaD3;
		static void HyperbolaD3(const Standard_Real U, const gp_Ax22d & Pos, const Standard_Real MajorRadius, const Standard_Real MinorRadius, gp_Pnt2d & P, gp_Vec2d & V1, gp_Vec2d & V2, gp_Vec2d & V3);

		/****************** HyperbolaDN ******************/
		/**** md5 signature: 64606ed51d58295ebd5231b094c367fe ****/
		%feature("compactdefaultargs") HyperbolaDN;
		%feature("autodoc", "No available documentation.

Parameters
----------
U: float
Pos: gp_Ax2
MajorRadius: float
MinorRadius: float
N: int

Returns
-------
gp_Vec
") HyperbolaDN;
		static gp_Vec HyperbolaDN(const Standard_Real U, const gp_Ax2 & Pos, const Standard_Real MajorRadius, const Standard_Real MinorRadius, const Standard_Integer N);

		/****************** HyperbolaDN ******************/
		/**** md5 signature: 3abfa8458baef677bbe28fcc2d8aa4f9 ****/
		%feature("compactdefaultargs") HyperbolaDN;
		%feature("autodoc", "No available documentation.

Parameters
----------
U: float
Pos: gp_Ax22d
MajorRadius: float
MinorRadius: float
N: int

Returns
-------
gp_Vec2d
") HyperbolaDN;
		static gp_Vec2d HyperbolaDN(const Standard_Real U, const gp_Ax22d & Pos, const Standard_Real MajorRadius, const Standard_Real MinorRadius, const Standard_Integer N);

		/****************** HyperbolaParameter ******************/
		/**** md5 signature: 1ac7c151e92a90a9c54f6feecb124b3a ****/
		%feature("compactdefaultargs") HyperbolaParameter;
		%feature("autodoc", "No available documentation.

Parameters
----------
Pos: gp_Ax2
MajorRadius: float
MinorRadius: float
P: gp_Pnt

Returns
-------
float
") HyperbolaParameter;
		static Standard_Real HyperbolaParameter(const gp_Ax2 & Pos, const Standard_Real MajorRadius, const Standard_Real MinorRadius, const gp_Pnt & P);

		/****************** HyperbolaParameter ******************/
		/**** md5 signature: 6f3595272e2a586d186798eb561dd223 ****/
		%feature("compactdefaultargs") HyperbolaParameter;
		%feature("autodoc", "Pos is the axis of the hyperbola parametrization in the local coordinate system of the hyperbola x (u) = majorradius * ch (u) y (u) = minorradius * sh (u).

Parameters
----------
Pos: gp_Ax22d
MajorRadius: float
MinorRadius: float
P: gp_Pnt2d

Returns
-------
float
") HyperbolaParameter;
		static Standard_Real HyperbolaParameter(const gp_Ax22d & Pos, const Standard_Real MajorRadius, const Standard_Real MinorRadius, const gp_Pnt2d & P);

		/****************** HyperbolaValue ******************/
		/**** md5 signature: b83b776e2657cd56ddc82e5ef6298410 ****/
		%feature("compactdefaultargs") HyperbolaValue;
		%feature("autodoc", "No available documentation.

Parameters
----------
U: float
Pos: gp_Ax2
MajorRadius: float
MinorRadius: float

Returns
-------
gp_Pnt
") HyperbolaValue;
		static gp_Pnt HyperbolaValue(const Standard_Real U, const gp_Ax2 & Pos, const Standard_Real MajorRadius, const Standard_Real MinorRadius);

		/****************** HyperbolaValue ******************/
		/**** md5 signature: c40c27b385ce364d0b3257da8e1ec87a ****/
		%feature("compactdefaultargs") HyperbolaValue;
		%feature("autodoc", "No available documentation.

Parameters
----------
U: float
Pos: gp_Ax22d
MajorRadius: float
MinorRadius: float

Returns
-------
gp_Pnt2d
") HyperbolaValue;
		static gp_Pnt2d HyperbolaValue(const Standard_Real U, const gp_Ax22d & Pos, const Standard_Real MajorRadius, const Standard_Real MinorRadius);

		/****************** InPeriod ******************/
		/**** md5 signature: 883a590c13e6d39257033db941d4e702 ****/
		%feature("compactdefaultargs") InPeriod;
		%feature("autodoc", "Return a value in the range <ufirst, ulast> by adding or removing the period <ulast - ufirst> to <u>. attention!!! it is expected but not checked that (ulast > ufirst).

Parameters
----------
U: float
UFirst: float
ULast: float

Returns
-------
float
") InPeriod;
		static Standard_Real InPeriod(const Standard_Real U, const Standard_Real UFirst, const Standard_Real ULast);

		/****************** LineD1 ******************/
		/**** md5 signature: fc625c5a3779023dffcf4cd338619ad5 ****/
		%feature("compactdefaultargs") LineD1;
		%feature("autodoc", "No available documentation.

Parameters
----------
U: float
Pos: gp_Ax1
P: gp_Pnt
V1: gp_Vec

Returns
-------
None
") LineD1;
		static void LineD1(const Standard_Real U, const gp_Ax1 & Pos, gp_Pnt & P, gp_Vec & V1);

		/****************** LineD1 ******************/
		/**** md5 signature: 7b3ff7d2b0a92631a2175fb61f85c547 ****/
		%feature("compactdefaultargs") LineD1;
		%feature("autodoc", "No available documentation.

Parameters
----------
U: float
Pos: gp_Ax2d
P: gp_Pnt2d
V1: gp_Vec2d

Returns
-------
None
") LineD1;
		static void LineD1(const Standard_Real U, const gp_Ax2d & Pos, gp_Pnt2d & P, gp_Vec2d & V1);

		/****************** LineDN ******************/
		/**** md5 signature: 37bccade86b2de011c381d69ff01cba7 ****/
		%feature("compactdefaultargs") LineDN;
		%feature("autodoc", "In the following functions n is the order of derivation and should be greater than 0.

Parameters
----------
U: float
Pos: gp_Ax1
N: int

Returns
-------
gp_Vec
") LineDN;
		static gp_Vec LineDN(const Standard_Real U, const gp_Ax1 & Pos, const Standard_Integer N);

		/****************** LineDN ******************/
		/**** md5 signature: 04ba70295ad6b3d76adf99aacf99b805 ****/
		%feature("compactdefaultargs") LineDN;
		%feature("autodoc", "No available documentation.

Parameters
----------
U: float
Pos: gp_Ax2d
N: int

Returns
-------
gp_Vec2d
") LineDN;
		static gp_Vec2d LineDN(const Standard_Real U, const gp_Ax2d & Pos, const Standard_Integer N);

		/****************** LineParameter ******************/
		/**** md5 signature: 3003b02b9d9b461587a6d0764b1f0102 ****/
		%feature("compactdefaultargs") LineParameter;
		%feature("autodoc", "No available documentation.

Parameters
----------
Pos: gp_Ax1
P: gp_Pnt

Returns
-------
float
") LineParameter;
		static Standard_Real LineParameter(const gp_Ax1 & Pos, const gp_Pnt & P);

		/****************** LineParameter ******************/
		/**** md5 signature: ca1ba1d96b0875085e4ace212cd2d361 ****/
		%feature("compactdefaultargs") LineParameter;
		%feature("autodoc", "Parametrization p (u) = l.location() + u * l.direction().

Parameters
----------
Pos: gp_Ax2d
P: gp_Pnt2d

Returns
-------
float
") LineParameter;
		static Standard_Real LineParameter(const gp_Ax2d & Pos, const gp_Pnt2d & P);

		/****************** LineValue ******************/
		/**** md5 signature: 8c9d4a1bc40f1a7a796def7654c380b7 ****/
		%feature("compactdefaultargs") LineValue;
		%feature("autodoc", "Curve evaluation the following basis functions compute the derivatives on elementary curves defined by their geometric characteristics. these functions can be called without constructing a conic from package gp. they are called by the previous functions. example : a circle is defined by its position and its radius.

Parameters
----------
U: float
Pos: gp_Ax1

Returns
-------
gp_Pnt
") LineValue;
		static gp_Pnt LineValue(const Standard_Real U, const gp_Ax1 & Pos);

		/****************** LineValue ******************/
		/**** md5 signature: 1c0049b64e6c51ac6742eeba33f38305 ****/
		%feature("compactdefaultargs") LineValue;
		%feature("autodoc", "No available documentation.

Parameters
----------
U: float
Pos: gp_Ax2d

Returns
-------
gp_Pnt2d
") LineValue;
		static gp_Pnt2d LineValue(const Standard_Real U, const gp_Ax2d & Pos);

		/****************** ParabolaD1 ******************/
		/**** md5 signature: 718d51678e2e5ee75203f96e49c438d5 ****/
		%feature("compactdefaultargs") ParabolaD1;
		%feature("autodoc", "No available documentation.

Parameters
----------
U: float
Pos: gp_Ax2
Focal: float
P: gp_Pnt
V1: gp_Vec

Returns
-------
None
") ParabolaD1;
		static void ParabolaD1(const Standard_Real U, const gp_Ax2 & Pos, const Standard_Real Focal, gp_Pnt & P, gp_Vec & V1);

		/****************** ParabolaD1 ******************/
		/**** md5 signature: 4e1990f537afd932bc1ce130c0434488 ****/
		%feature("compactdefaultargs") ParabolaD1;
		%feature("autodoc", "No available documentation.

Parameters
----------
U: float
Pos: gp_Ax22d
Focal: float
P: gp_Pnt2d
V1: gp_Vec2d

Returns
-------
None
") ParabolaD1;
		static void ParabolaD1(const Standard_Real U, const gp_Ax22d & Pos, const Standard_Real Focal, gp_Pnt2d & P, gp_Vec2d & V1);

		/****************** ParabolaD2 ******************/
		/**** md5 signature: 008f7fe7e97288063480d401ac72d77b ****/
		%feature("compactdefaultargs") ParabolaD2;
		%feature("autodoc", "No available documentation.

Parameters
----------
U: float
Pos: gp_Ax2
Focal: float
P: gp_Pnt
V1: gp_Vec
V2: gp_Vec

Returns
-------
None
") ParabolaD2;
		static void ParabolaD2(const Standard_Real U, const gp_Ax2 & Pos, const Standard_Real Focal, gp_Pnt & P, gp_Vec & V1, gp_Vec & V2);

		/****************** ParabolaD2 ******************/
		/**** md5 signature: 343cbde8116c778c0b005be3bd8e560d ****/
		%feature("compactdefaultargs") ParabolaD2;
		%feature("autodoc", "No available documentation.

Parameters
----------
U: float
Pos: gp_Ax22d
Focal: float
P: gp_Pnt2d
V1: gp_Vec2d
V2: gp_Vec2d

Returns
-------
None
") ParabolaD2;
		static void ParabolaD2(const Standard_Real U, const gp_Ax22d & Pos, const Standard_Real Focal, gp_Pnt2d & P, gp_Vec2d & V1, gp_Vec2d & V2);

		/****************** ParabolaDN ******************/
		/**** md5 signature: 98a7dc7df6cab966d8f5341e7a669ba6 ****/
		%feature("compactdefaultargs") ParabolaDN;
		%feature("autodoc", "No available documentation.

Parameters
----------
U: float
Pos: gp_Ax2
Focal: float
N: int

Returns
-------
gp_Vec
") ParabolaDN;
		static gp_Vec ParabolaDN(const Standard_Real U, const gp_Ax2 & Pos, const Standard_Real Focal, const Standard_Integer N);

		/****************** ParabolaDN ******************/
		/**** md5 signature: 9000962510b0d389d586207e890fa5c7 ****/
		%feature("compactdefaultargs") ParabolaDN;
		%feature("autodoc", "The following functions compute the parametric value corresponding to a given point on a elementary curve. the point should be on the curve.

Parameters
----------
U: float
Pos: gp_Ax22d
Focal: float
N: int

Returns
-------
gp_Vec2d
") ParabolaDN;
		static gp_Vec2d ParabolaDN(const Standard_Real U, const gp_Ax22d & Pos, const Standard_Real Focal, const Standard_Integer N);

		/****************** ParabolaParameter ******************/
		/**** md5 signature: be6a94c70eda2cca123aeff7e9c873f8 ****/
		%feature("compactdefaultargs") ParabolaParameter;
		%feature("autodoc", "No available documentation.

Parameters
----------
Pos: gp_Ax2
P: gp_Pnt

Returns
-------
float
") ParabolaParameter;
		static Standard_Real ParabolaParameter(const gp_Ax2 & Pos, const gp_Pnt & P);

		/****************** ParabolaParameter ******************/
		/**** md5 signature: ac4ea60923b1662c5bc0e00811830d7c ****/
		%feature("compactdefaultargs") ParabolaParameter;
		%feature("autodoc", "Pos is the mirror axis of the parabola parametrization in the local coordinate system of the parabola y**2 = (2*p) * x where p is the distance between the focus and the directrix. the following functions build a 3d curve from a 2d curve at a given position defined with an ax2.

Parameters
----------
Pos: gp_Ax22d
P: gp_Pnt2d

Returns
-------
float
") ParabolaParameter;
		static Standard_Real ParabolaParameter(const gp_Ax22d & Pos, const gp_Pnt2d & P);

		/****************** ParabolaValue ******************/
		/**** md5 signature: 79c5c33d9dcae654ec135813f37c9103 ****/
		%feature("compactdefaultargs") ParabolaValue;
		%feature("autodoc", "No available documentation.

Parameters
----------
U: float
Pos: gp_Ax2
Focal: float

Returns
-------
gp_Pnt
") ParabolaValue;
		static gp_Pnt ParabolaValue(const Standard_Real U, const gp_Ax2 & Pos, const Standard_Real Focal);

		/****************** ParabolaValue ******************/
		/**** md5 signature: 44322c024bb31a8ed2cbdb18b7d8cc63 ****/
		%feature("compactdefaultargs") ParabolaValue;
		%feature("autodoc", "No available documentation.

Parameters
----------
U: float
Pos: gp_Ax22d
Focal: float

Returns
-------
gp_Pnt2d
") ParabolaValue;
		static gp_Pnt2d ParabolaValue(const Standard_Real U, const gp_Ax22d & Pos, const Standard_Real Focal);

		/****************** Parameter ******************/
		/**** md5 signature: fdffb0a483b99135c55258f3f69dfd77 ****/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "Computes the parameter value of the point p on the given curve. note: in its local coordinate system, the parametric equation of the curve is given by the following: - for the line l: p(u) = po + u*vo where po is the origin and vo the unit vector of its positioning axis. - for the circle c: x(u) = radius*cos(u), y(u) = radius*sin(u) - for the ellipse e: x(u) = majorradius*cos(u). y(u) = minorradius*sin(u) - for the hyperbola h: x(u) = majorradius*ch(u), y(u) = minorradius*sh(u) - for the parabola prb: x(u) = u**2 / (2*p) y(u) = u where p is the distance between the focus and the directrix. warning the point p must be on the curve. these functions are not protected, however, and if point p is not on the curve, an exception may be raised.

Parameters
----------
L: gp_Lin
P: gp_Pnt

Returns
-------
float
") Parameter;
		static Standard_Real Parameter(const gp_Lin & L, const gp_Pnt & P);

		/****************** Parameter ******************/
		/**** md5 signature: 5c19b9d7339e4287f032225279193aac ****/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "Parametrization p (u) = l.location() + u * l.direction().

Parameters
----------
L: gp_Lin2d
P: gp_Pnt2d

Returns
-------
float
") Parameter;
		static Standard_Real Parameter(const gp_Lin2d & L, const gp_Pnt2d & P);

		/****************** Parameter ******************/
		/**** md5 signature: c0de9d224cc41db001d89345bb1cc0df ****/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: gp_Circ
P: gp_Pnt

Returns
-------
float
") Parameter;
		static Standard_Real Parameter(const gp_Circ & C, const gp_Pnt & P);

		/****************** Parameter ******************/
		/**** md5 signature: fc1445dfdc288aa7468073f96390f76e ****/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "Parametrization in the local coordinate system of the circle x (u) = radius * cos (u) y (u) = radius * sin (u).

Parameters
----------
C: gp_Circ2d
P: gp_Pnt2d

Returns
-------
float
") Parameter;
		static Standard_Real Parameter(const gp_Circ2d & C, const gp_Pnt2d & P);

		/****************** Parameter ******************/
		/**** md5 signature: 7be9925318277a51229e05227e49261d ****/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "No available documentation.

Parameters
----------
E: gp_Elips
P: gp_Pnt

Returns
-------
float
") Parameter;
		static Standard_Real Parameter(const gp_Elips & E, const gp_Pnt & P);

		/****************** Parameter ******************/
		/**** md5 signature: f94bcbce615e9d9dc64babd9d7146c29 ****/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "Parametrization in the local coordinate system of the ellipse x (u) = majorradius * cos (u) y (u) = minorradius * sin (u).

Parameters
----------
E: gp_Elips2d
P: gp_Pnt2d

Returns
-------
float
") Parameter;
		static Standard_Real Parameter(const gp_Elips2d & E, const gp_Pnt2d & P);

		/****************** Parameter ******************/
		/**** md5 signature: 9513c9d32e783629b14c8de9e6bd8a60 ****/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "No available documentation.

Parameters
----------
H: gp_Hypr
P: gp_Pnt

Returns
-------
float
") Parameter;
		static Standard_Real Parameter(const gp_Hypr & H, const gp_Pnt & P);

		/****************** Parameter ******************/
		/**** md5 signature: 746f4ae2f34e8c146289569ee8698e24 ****/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "Parametrization in the local coordinate system of the hyperbola x (u) = majorradius * ch (u) y (u) = minorradius * sh (u).

Parameters
----------
H: gp_Hypr2d
P: gp_Pnt2d

Returns
-------
float
") Parameter;
		static Standard_Real Parameter(const gp_Hypr2d & H, const gp_Pnt2d & P);

		/****************** Parameter ******************/
		/**** md5 signature: 3bebf670839393a24ae1609893fd794b ****/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "No available documentation.

Parameters
----------
Prb: gp_Parab
P: gp_Pnt

Returns
-------
float
") Parameter;
		static Standard_Real Parameter(const gp_Parab & Prb, const gp_Pnt & P);

		/****************** Parameter ******************/
		/**** md5 signature: b160c415b3cecd54564c3899672650ac ****/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "Parametrization in the local coordinate system of the parabola y**2 = (2*p) * x where p is the distance between the focus and the directrix.

Parameters
----------
Prb: gp_Parab2d
P: gp_Pnt2d

Returns
-------
float
") Parameter;
		static Standard_Real Parameter(const gp_Parab2d & Prb, const gp_Pnt2d & P);

		/****************** To3d ******************/
		/**** md5 signature: d6eb46a2a80e30e827b5ec0546580b9d ****/
		%feature("compactdefaultargs") To3d;
		%feature("autodoc", "No available documentation.

Parameters
----------
Pos: gp_Ax2
P: gp_Pnt2d

Returns
-------
gp_Pnt
") To3d;
		static gp_Pnt To3d(const gp_Ax2 & Pos, const gp_Pnt2d & P);

		/****************** To3d ******************/
		/**** md5 signature: 15e5d44014978eea4b234ce5f508823f ****/
		%feature("compactdefaultargs") To3d;
		%feature("autodoc", "No available documentation.

Parameters
----------
Pos: gp_Ax2
V: gp_Vec2d

Returns
-------
gp_Vec
") To3d;
		static gp_Vec To3d(const gp_Ax2 & Pos, const gp_Vec2d & V);

		/****************** To3d ******************/
		/**** md5 signature: 46ba1c4acbf8e7dab865489fa639e50a ****/
		%feature("compactdefaultargs") To3d;
		%feature("autodoc", "No available documentation.

Parameters
----------
Pos: gp_Ax2
V: gp_Dir2d

Returns
-------
gp_Dir
") To3d;
		static gp_Dir To3d(const gp_Ax2 & Pos, const gp_Dir2d & V);

		/****************** To3d ******************/
		/**** md5 signature: 00a2ff51c078ee9ef43b0bea27dbb9e0 ****/
		%feature("compactdefaultargs") To3d;
		%feature("autodoc", "No available documentation.

Parameters
----------
Pos: gp_Ax2
A: gp_Ax2d

Returns
-------
gp_Ax1
") To3d;
		static gp_Ax1 To3d(const gp_Ax2 & Pos, const gp_Ax2d & A);

		/****************** To3d ******************/
		/**** md5 signature: 7fedb205d65f8314e451664c8d4353ea ****/
		%feature("compactdefaultargs") To3d;
		%feature("autodoc", "No available documentation.

Parameters
----------
Pos: gp_Ax2
A: gp_Ax22d

Returns
-------
gp_Ax2
") To3d;
		static gp_Ax2 To3d(const gp_Ax2 & Pos, const gp_Ax22d & A);

		/****************** To3d ******************/
		/**** md5 signature: fe55e92c77173bf56a6e8c7d320e8aab ****/
		%feature("compactdefaultargs") To3d;
		%feature("autodoc", "No available documentation.

Parameters
----------
Pos: gp_Ax2
L: gp_Lin2d

Returns
-------
gp_Lin
") To3d;
		static gp_Lin To3d(const gp_Ax2 & Pos, const gp_Lin2d & L);

		/****************** To3d ******************/
		/**** md5 signature: 02449a387fb4d966c889415557e3be6a ****/
		%feature("compactdefaultargs") To3d;
		%feature("autodoc", "No available documentation.

Parameters
----------
Pos: gp_Ax2
C: gp_Circ2d

Returns
-------
gp_Circ
") To3d;
		static gp_Circ To3d(const gp_Ax2 & Pos, const gp_Circ2d & C);

		/****************** To3d ******************/
		/**** md5 signature: 892dcd694df22cd9b12c922cbdc0d21f ****/
		%feature("compactdefaultargs") To3d;
		%feature("autodoc", "No available documentation.

Parameters
----------
Pos: gp_Ax2
E: gp_Elips2d

Returns
-------
gp_Elips
") To3d;
		static gp_Elips To3d(const gp_Ax2 & Pos, const gp_Elips2d & E);

		/****************** To3d ******************/
		/**** md5 signature: fc277359cfba379ecc2feaeef51e1347 ****/
		%feature("compactdefaultargs") To3d;
		%feature("autodoc", "No available documentation.

Parameters
----------
Pos: gp_Ax2
H: gp_Hypr2d

Returns
-------
gp_Hypr
") To3d;
		static gp_Hypr To3d(const gp_Ax2 & Pos, const gp_Hypr2d & H);

		/****************** To3d ******************/
		/**** md5 signature: e01e1c5ea59a879b1c0401f677c2ef81 ****/
		%feature("compactdefaultargs") To3d;
		%feature("autodoc", "These functions build a 3d geometric entity from a 2d geometric entity. the 'x axis' and the 'y axis' of the global coordinate system (i.e. 2d space) are lined up respectively with the 'x axis' and 'y axis' of the 3d coordinate system, pos.

Parameters
----------
Pos: gp_Ax2
Prb: gp_Parab2d

Returns
-------
gp_Parab
") To3d;
		static gp_Parab To3d(const gp_Ax2 & Pos, const gp_Parab2d & Prb);

		/****************** Value ******************/
		/**** md5 signature: dcf0031761dcf8de0f57e41c946a0a5f ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "For elementary curves (lines, circles and conics) from the gp package, computes the point of parameter u. the result is either: - a gp_pnt point for a curve in 3d space, or - a gp_pnt2d point for a curve in 2d space.

Parameters
----------
U: float
L: gp_Lin

Returns
-------
gp_Pnt
") Value;
		static gp_Pnt Value(const Standard_Real U, const gp_Lin & L);

		/****************** Value ******************/
		/**** md5 signature: 06d8da1b31def39d978e12c20d64cef4 ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "No available documentation.

Parameters
----------
U: float
C: gp_Circ

Returns
-------
gp_Pnt
") Value;
		static gp_Pnt Value(const Standard_Real U, const gp_Circ & C);

		/****************** Value ******************/
		/**** md5 signature: 7272c18d7bcfe733c7e239ca90ac9955 ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "No available documentation.

Parameters
----------
U: float
E: gp_Elips

Returns
-------
gp_Pnt
") Value;
		static gp_Pnt Value(const Standard_Real U, const gp_Elips & E);

		/****************** Value ******************/
		/**** md5 signature: d8fb8620979138dd40196a5de32ada52 ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "No available documentation.

Parameters
----------
U: float
H: gp_Hypr

Returns
-------
gp_Pnt
") Value;
		static gp_Pnt Value(const Standard_Real U, const gp_Hypr & H);

		/****************** Value ******************/
		/**** md5 signature: 3f0f5bf4def209401dc2e57b7d0239be ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "No available documentation.

Parameters
----------
U: float
Prb: gp_Parab

Returns
-------
gp_Pnt
") Value;
		static gp_Pnt Value(const Standard_Real U, const gp_Parab & Prb);

		/****************** Value ******************/
		/**** md5 signature: 199f386ede52debecf14f2ce0102af65 ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "No available documentation.

Parameters
----------
U: float
L: gp_Lin2d

Returns
-------
gp_Pnt2d
") Value;
		static gp_Pnt2d Value(const Standard_Real U, const gp_Lin2d & L);

		/****************** Value ******************/
		/**** md5 signature: 7f145b21fc7cd102603b54537f61d4e6 ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "No available documentation.

Parameters
----------
U: float
C: gp_Circ2d

Returns
-------
gp_Pnt2d
") Value;
		static gp_Pnt2d Value(const Standard_Real U, const gp_Circ2d & C);

		/****************** Value ******************/
		/**** md5 signature: 57bd1d0011f8440b0ceebcd59c246f6f ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "No available documentation.

Parameters
----------
U: float
E: gp_Elips2d

Returns
-------
gp_Pnt2d
") Value;
		static gp_Pnt2d Value(const Standard_Real U, const gp_Elips2d & E);

		/****************** Value ******************/
		/**** md5 signature: 05c2c0e307e223938751475ab1931ddb ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "No available documentation.

Parameters
----------
U: float
H: gp_Hypr2d

Returns
-------
gp_Pnt2d
") Value;
		static gp_Pnt2d Value(const Standard_Real U, const gp_Hypr2d & H);

		/****************** Value ******************/
		/**** md5 signature: 9c529c16c32a6c9cd0dd5cf18db9c33f ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "No available documentation.

Parameters
----------
U: float
Prb: gp_Parab2d

Returns
-------
gp_Pnt2d
") Value;
		static gp_Pnt2d Value(const Standard_Real U, const gp_Parab2d & Prb);

};


%extend ElCLib {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* harray1 classes */
/* harray2 classes */
/* hsequence classes */
