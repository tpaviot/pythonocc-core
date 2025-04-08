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
%define ELCLIBDOCSTRING
"ElCLib module, see official documentation at
https://dev.opencascade.org/doc/occt-7.8.0/refman/html/package_elclib.html"
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
%include ../common/EnumTemplates.i
%include ../common/Operators.i
%include ../common/OccHandle.i
%include ../common/IOStream.i
%include ../common/ArrayMacros.i


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

/***************
* class ElCLib *
***************/
%rename(elclib) ElCLib;
class ElCLib {
	public:
		/****** ElCLib::AdjustPeriodic ******/
		/****** md5 signature: 7e4e736e11484939c8dff18f732b6618 ******/
		%feature("compactdefaultargs") AdjustPeriodic;
		%feature("autodoc", "
Parameters
----------
UFirst: float
ULast: float
Precision: float

Return
-------
U1: float
U2: float

Description
-----------
Adjust U1 and U2 in the parametric range UFirst Ulast of a periodic curve, where ULast - UFirst is its period. To do this, this function: - sets U1 in the range [ UFirst, ULast ] by adding/removing the period to/from the value U1, then - sets U2 in the range [ U1, U1 + period ] by adding/removing the period to/from the value U2. Precision is used to test the equalities.
") AdjustPeriodic;
		static void AdjustPeriodic(const Standard_Real UFirst, const Standard_Real ULast, const Standard_Real Precision, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** ElCLib::CircleD1 ******/
		/****** md5 signature: 1732223aff472369d5a24b4ce7e8c1b2 ******/
		%feature("compactdefaultargs") CircleD1;
		%feature("autodoc", "
Parameters
----------
U: float
Pos: gp_Ax2
Radius: float
P: gp_Pnt
V1: gp_Vec

Return
-------
None

Description
-----------
No available documentation.
") CircleD1;
		static void CircleD1(const Standard_Real U, const gp_Ax2 & Pos, const Standard_Real Radius, gp_Pnt & P, gp_Vec & V1);

		/****** ElCLib::CircleD1 ******/
		/****** md5 signature: 6044b15cc56f7cdb76cf5e9f3221b800 ******/
		%feature("compactdefaultargs") CircleD1;
		%feature("autodoc", "
Parameters
----------
U: float
Pos: gp_Ax22d
Radius: float
P: gp_Pnt2d
V1: gp_Vec2d

Return
-------
None

Description
-----------
No available documentation.
") CircleD1;
		static void CircleD1(const Standard_Real U, const gp_Ax22d & Pos, const Standard_Real Radius, gp_Pnt2d & P, gp_Vec2d & V1);

		/****** ElCLib::CircleD2 ******/
		/****** md5 signature: 061f949b4f38b316133e8a7030c1979a ******/
		%feature("compactdefaultargs") CircleD2;
		%feature("autodoc", "
Parameters
----------
U: float
Pos: gp_Ax2
Radius: float
P: gp_Pnt
V1: gp_Vec
V2: gp_Vec

Return
-------
None

Description
-----------
No available documentation.
") CircleD2;
		static void CircleD2(const Standard_Real U, const gp_Ax2 & Pos, const Standard_Real Radius, gp_Pnt & P, gp_Vec & V1, gp_Vec & V2);

		/****** ElCLib::CircleD2 ******/
		/****** md5 signature: 94490ed36a73babf84f582d37201ac87 ******/
		%feature("compactdefaultargs") CircleD2;
		%feature("autodoc", "
Parameters
----------
U: float
Pos: gp_Ax22d
Radius: float
P: gp_Pnt2d
V1: gp_Vec2d
V2: gp_Vec2d

Return
-------
None

Description
-----------
No available documentation.
") CircleD2;
		static void CircleD2(const Standard_Real U, const gp_Ax22d & Pos, const Standard_Real Radius, gp_Pnt2d & P, gp_Vec2d & V1, gp_Vec2d & V2);

		/****** ElCLib::CircleD3 ******/
		/****** md5 signature: 6e27ee9ae6fd48002ff421549b3557ae ******/
		%feature("compactdefaultargs") CircleD3;
		%feature("autodoc", "
Parameters
----------
U: float
Pos: gp_Ax2
Radius: float
P: gp_Pnt
V1: gp_Vec
V2: gp_Vec
V3: gp_Vec

Return
-------
None

Description
-----------
No available documentation.
") CircleD3;
		static void CircleD3(const Standard_Real U, const gp_Ax2 & Pos, const Standard_Real Radius, gp_Pnt & P, gp_Vec & V1, gp_Vec & V2, gp_Vec & V3);

		/****** ElCLib::CircleD3 ******/
		/****** md5 signature: abdeacc35ed48e6fde962dc0dceb8902 ******/
		%feature("compactdefaultargs") CircleD3;
		%feature("autodoc", "
Parameters
----------
U: float
Pos: gp_Ax22d
Radius: float
P: gp_Pnt2d
V1: gp_Vec2d
V2: gp_Vec2d
V3: gp_Vec2d

Return
-------
None

Description
-----------
No available documentation.
") CircleD3;
		static void CircleD3(const Standard_Real U, const gp_Ax22d & Pos, const Standard_Real Radius, gp_Pnt2d & P, gp_Vec2d & V1, gp_Vec2d & V2, gp_Vec2d & V3);

		/****** ElCLib::CircleDN ******/
		/****** md5 signature: 5c8adfb9e6b9466f039573c51d124f27 ******/
		%feature("compactdefaultargs") CircleDN;
		%feature("autodoc", "
Parameters
----------
U: float
Pos: gp_Ax2
Radius: float
N: int

Return
-------
gp_Vec

Description
-----------
No available documentation.
") CircleDN;
		static gp_Vec CircleDN(const Standard_Real U, const gp_Ax2 & Pos, const Standard_Real Radius, const Standard_Integer N);

		/****** ElCLib::CircleDN ******/
		/****** md5 signature: 7d799cf3237462c7e93916f300ba5a96 ******/
		%feature("compactdefaultargs") CircleDN;
		%feature("autodoc", "
Parameters
----------
U: float
Pos: gp_Ax22d
Radius: float
N: int

Return
-------
gp_Vec2d

Description
-----------
No available documentation.
") CircleDN;
		static gp_Vec2d CircleDN(const Standard_Real U, const gp_Ax22d & Pos, const Standard_Real Radius, const Standard_Integer N);

		/****** ElCLib::CircleParameter ******/
		/****** md5 signature: 26a6c62dffefcf8a3d41e5df4c618fb4 ******/
		%feature("compactdefaultargs") CircleParameter;
		%feature("autodoc", "
Parameters
----------
Pos: gp_Ax2
P: gp_Pnt

Return
-------
float

Description
-----------
No available documentation.
") CircleParameter;
		static Standard_Real CircleParameter(const gp_Ax2 & Pos, const gp_Pnt & P);

		/****** ElCLib::CircleParameter ******/
		/****** md5 signature: ba68b13a794fae7ac895861855220d57 ******/
		%feature("compactdefaultargs") CircleParameter;
		%feature("autodoc", "
Parameters
----------
Pos: gp_Ax22d
P: gp_Pnt2d

Return
-------
float

Description
-----------
Pos is the Axis of the Circle parametrization In the local coordinate system of the circle X (U) = Radius * Cos (U) Y (U) = Radius * Sin (U).
") CircleParameter;
		static Standard_Real CircleParameter(const gp_Ax22d & Pos, const gp_Pnt2d & P);

		/****** ElCLib::CircleValue ******/
		/****** md5 signature: f1c4f3dd63490877f61a734b1473fd15 ******/
		%feature("compactdefaultargs") CircleValue;
		%feature("autodoc", "
Parameters
----------
U: float
Pos: gp_Ax2
Radius: float

Return
-------
gp_Pnt

Description
-----------
No available documentation.
") CircleValue;
		static gp_Pnt CircleValue(const Standard_Real U, const gp_Ax2 & Pos, const Standard_Real Radius);

		/****** ElCLib::CircleValue ******/
		/****** md5 signature: a254ad35f2d5ff777499e60061cecbf0 ******/
		%feature("compactdefaultargs") CircleValue;
		%feature("autodoc", "
Parameters
----------
U: float
Pos: gp_Ax22d
Radius: float

Return
-------
gp_Pnt2d

Description
-----------
No available documentation.
") CircleValue;
		static gp_Pnt2d CircleValue(const Standard_Real U, const gp_Ax22d & Pos, const Standard_Real Radius);

		/****** ElCLib::D1 ******/
		/****** md5 signature: 2348e372c613ae0b91de8a60ff4c1d96 ******/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "
Parameters
----------
U: float
L: gp_Lin
P: gp_Pnt
V1: gp_Vec

Return
-------
None

Description
-----------
For elementary curves (lines, circles and conics) from the gp package, computes: - the point P of parameter U, and - the first derivative vector V1 at this point. The results P and V1 are either: - a gp_Pnt point and a gp_Vec vector, for a curve in 3D space, or - a gp_Pnt2d point and a gp_Vec2d vector, for a curve in 2D space.
") D1;
		static void D1(const Standard_Real U, const gp_Lin & L, gp_Pnt & P, gp_Vec & V1);

		/****** ElCLib::D1 ******/
		/****** md5 signature: 5764c3935590a35e746844167678c383 ******/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "
Parameters
----------
U: float
C: gp_Circ
P: gp_Pnt
V1: gp_Vec

Return
-------
None

Description
-----------
No available documentation.
") D1;
		static void D1(const Standard_Real U, const gp_Circ & C, gp_Pnt & P, gp_Vec & V1);

		/****** ElCLib::D1 ******/
		/****** md5 signature: 5aa41c2b42fa990f167d06b62da72a60 ******/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "
Parameters
----------
U: float
E: gp_Elips
P: gp_Pnt
V1: gp_Vec

Return
-------
None

Description
-----------
No available documentation.
") D1;
		static void D1(const Standard_Real U, const gp_Elips & E, gp_Pnt & P, gp_Vec & V1);

		/****** ElCLib::D1 ******/
		/****** md5 signature: f33366e613106b45ca1fa0b63ec1a193 ******/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "
Parameters
----------
U: float
H: gp_Hypr
P: gp_Pnt
V1: gp_Vec

Return
-------
None

Description
-----------
No available documentation.
") D1;
		static void D1(const Standard_Real U, const gp_Hypr & H, gp_Pnt & P, gp_Vec & V1);

		/****** ElCLib::D1 ******/
		/****** md5 signature: bcd87a30e4fb1b4185175041d43b84b4 ******/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "
Parameters
----------
U: float
Prb: gp_Parab
P: gp_Pnt
V1: gp_Vec

Return
-------
None

Description
-----------
No available documentation.
") D1;
		static void D1(const Standard_Real U, const gp_Parab & Prb, gp_Pnt & P, gp_Vec & V1);

		/****** ElCLib::D1 ******/
		/****** md5 signature: 5e08453e4d72f76c239039b9fcf805af ******/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "
Parameters
----------
U: float
L: gp_Lin2d
P: gp_Pnt2d
V1: gp_Vec2d

Return
-------
None

Description
-----------
No available documentation.
") D1;
		static void D1(const Standard_Real U, const gp_Lin2d & L, gp_Pnt2d & P, gp_Vec2d & V1);

		/****** ElCLib::D1 ******/
		/****** md5 signature: cb123a1582eec6ad30ae203aa5b3dd5b ******/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "
Parameters
----------
U: float
C: gp_Circ2d
P: gp_Pnt2d
V1: gp_Vec2d

Return
-------
None

Description
-----------
No available documentation.
") D1;
		static void D1(const Standard_Real U, const gp_Circ2d & C, gp_Pnt2d & P, gp_Vec2d & V1);

		/****** ElCLib::D1 ******/
		/****** md5 signature: 50be3a7f16ec4ee1e8cb046024b4e091 ******/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "
Parameters
----------
U: float
E: gp_Elips2d
P: gp_Pnt2d
V1: gp_Vec2d

Return
-------
None

Description
-----------
No available documentation.
") D1;
		static void D1(const Standard_Real U, const gp_Elips2d & E, gp_Pnt2d & P, gp_Vec2d & V1);

		/****** ElCLib::D1 ******/
		/****** md5 signature: 2c1cb396fe733147144fdabd58e5b9b8 ******/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "
Parameters
----------
U: float
H: gp_Hypr2d
P: gp_Pnt2d
V1: gp_Vec2d

Return
-------
None

Description
-----------
No available documentation.
") D1;
		static void D1(const Standard_Real U, const gp_Hypr2d & H, gp_Pnt2d & P, gp_Vec2d & V1);

		/****** ElCLib::D1 ******/
		/****** md5 signature: e3323af4d4584a4719fee23df6a2cfd1 ******/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "
Parameters
----------
U: float
Prb: gp_Parab2d
P: gp_Pnt2d
V1: gp_Vec2d

Return
-------
None

Description
-----------
No available documentation.
") D1;
		static void D1(const Standard_Real U, const gp_Parab2d & Prb, gp_Pnt2d & P, gp_Vec2d & V1);

		/****** ElCLib::D2 ******/
		/****** md5 signature: f220a759c5390f272acbdf7473bf89c5 ******/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "
Parameters
----------
U: float
C: gp_Circ
P: gp_Pnt
V1: gp_Vec
V2: gp_Vec

Return
-------
None

Description
-----------
For elementary curves (circles and conics) from the gp package, computes: - the point P of parameter U, and - the first and second derivative vectors V1 and V2 at this point. The results, P, V1 and V2, are either: - a gp_Pnt point and two gp_Vec vectors, for a curve in 3D space, or - a gp_Pnt2d point and two gp_Vec2d vectors, for a curve in 2D space.
") D2;
		static void D2(const Standard_Real U, const gp_Circ & C, gp_Pnt & P, gp_Vec & V1, gp_Vec & V2);

		/****** ElCLib::D2 ******/
		/****** md5 signature: 9f99502ea2bb4230feece4e7519388eb ******/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "
Parameters
----------
U: float
E: gp_Elips
P: gp_Pnt
V1: gp_Vec
V2: gp_Vec

Return
-------
None

Description
-----------
No available documentation.
") D2;
		static void D2(const Standard_Real U, const gp_Elips & E, gp_Pnt & P, gp_Vec & V1, gp_Vec & V2);

		/****** ElCLib::D2 ******/
		/****** md5 signature: ae81bfd7063ec89ba29dedd16adfa97c ******/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "
Parameters
----------
U: float
H: gp_Hypr
P: gp_Pnt
V1: gp_Vec
V2: gp_Vec

Return
-------
None

Description
-----------
No available documentation.
") D2;
		static void D2(const Standard_Real U, const gp_Hypr & H, gp_Pnt & P, gp_Vec & V1, gp_Vec & V2);

		/****** ElCLib::D2 ******/
		/****** md5 signature: af24c765387cb94b2673a43c40a395f3 ******/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "
Parameters
----------
U: float
Prb: gp_Parab
P: gp_Pnt
V1: gp_Vec
V2: gp_Vec

Return
-------
None

Description
-----------
No available documentation.
") D2;
		static void D2(const Standard_Real U, const gp_Parab & Prb, gp_Pnt & P, gp_Vec & V1, gp_Vec & V2);

		/****** ElCLib::D2 ******/
		/****** md5 signature: b71866e4b68be26ce3861d909a3db5ab ******/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "
Parameters
----------
U: float
C: gp_Circ2d
P: gp_Pnt2d
V1: gp_Vec2d
V2: gp_Vec2d

Return
-------
None

Description
-----------
No available documentation.
") D2;
		static void D2(const Standard_Real U, const gp_Circ2d & C, gp_Pnt2d & P, gp_Vec2d & V1, gp_Vec2d & V2);

		/****** ElCLib::D2 ******/
		/****** md5 signature: ef9a85e18324dde449ab962fe75d0de0 ******/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "
Parameters
----------
U: float
E: gp_Elips2d
P: gp_Pnt2d
V1: gp_Vec2d
V2: gp_Vec2d

Return
-------
None

Description
-----------
No available documentation.
") D2;
		static void D2(const Standard_Real U, const gp_Elips2d & E, gp_Pnt2d & P, gp_Vec2d & V1, gp_Vec2d & V2);

		/****** ElCLib::D2 ******/
		/****** md5 signature: 7e73a41bf37e135bd7dcd253f7c005f5 ******/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "
Parameters
----------
U: float
H: gp_Hypr2d
P: gp_Pnt2d
V1: gp_Vec2d
V2: gp_Vec2d

Return
-------
None

Description
-----------
No available documentation.
") D2;
		static void D2(const Standard_Real U, const gp_Hypr2d & H, gp_Pnt2d & P, gp_Vec2d & V1, gp_Vec2d & V2);

		/****** ElCLib::D2 ******/
		/****** md5 signature: c574c1139e0e7d2678634d07213fd831 ******/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "
Parameters
----------
U: float
Prb: gp_Parab2d
P: gp_Pnt2d
V1: gp_Vec2d
V2: gp_Vec2d

Return
-------
None

Description
-----------
No available documentation.
") D2;
		static void D2(const Standard_Real U, const gp_Parab2d & Prb, gp_Pnt2d & P, gp_Vec2d & V1, gp_Vec2d & V2);

		/****** ElCLib::D3 ******/
		/****** md5 signature: 88a0f31d8d88acd9379427f8056f536e ******/
		%feature("compactdefaultargs") D3;
		%feature("autodoc", "
Parameters
----------
U: float
C: gp_Circ
P: gp_Pnt
V1: gp_Vec
V2: gp_Vec
V3: gp_Vec

Return
-------
None

Description
-----------
For elementary curves (circles, ellipses and hyperbolae) from the gp package, computes: - the point P of parameter U, and - the first, second and third derivative vectors V1, V2 and V3 at this point. The results, P, V1, V2 and V3, are either: - a gp_Pnt point and three gp_Vec vectors, for a curve in 3D space, or - a gp_Pnt2d point and three gp_Vec2d vectors, for a curve in 2D space.
") D3;
		static void D3(const Standard_Real U, const gp_Circ & C, gp_Pnt & P, gp_Vec & V1, gp_Vec & V2, gp_Vec & V3);

		/****** ElCLib::D3 ******/
		/****** md5 signature: 3f664f004eb6420555d34db3336d8ffc ******/
		%feature("compactdefaultargs") D3;
		%feature("autodoc", "
Parameters
----------
U: float
E: gp_Elips
P: gp_Pnt
V1: gp_Vec
V2: gp_Vec
V3: gp_Vec

Return
-------
None

Description
-----------
No available documentation.
") D3;
		static void D3(const Standard_Real U, const gp_Elips & E, gp_Pnt & P, gp_Vec & V1, gp_Vec & V2, gp_Vec & V3);

		/****** ElCLib::D3 ******/
		/****** md5 signature: bf8de95ac722e89f12108e313766c3ca ******/
		%feature("compactdefaultargs") D3;
		%feature("autodoc", "
Parameters
----------
U: float
H: gp_Hypr
P: gp_Pnt
V1: gp_Vec
V2: gp_Vec
V3: gp_Vec

Return
-------
None

Description
-----------
No available documentation.
") D3;
		static void D3(const Standard_Real U, const gp_Hypr & H, gp_Pnt & P, gp_Vec & V1, gp_Vec & V2, gp_Vec & V3);

		/****** ElCLib::D3 ******/
		/****** md5 signature: 1ed246904267606ef73603a752190250 ******/
		%feature("compactdefaultargs") D3;
		%feature("autodoc", "
Parameters
----------
U: float
C: gp_Circ2d
P: gp_Pnt2d
V1: gp_Vec2d
V2: gp_Vec2d
V3: gp_Vec2d

Return
-------
None

Description
-----------
No available documentation.
") D3;
		static void D3(const Standard_Real U, const gp_Circ2d & C, gp_Pnt2d & P, gp_Vec2d & V1, gp_Vec2d & V2, gp_Vec2d & V3);

		/****** ElCLib::D3 ******/
		/****** md5 signature: f364e91b0c7b85480d4dc2f59acb2ef4 ******/
		%feature("compactdefaultargs") D3;
		%feature("autodoc", "
Parameters
----------
U: float
E: gp_Elips2d
P: gp_Pnt2d
V1: gp_Vec2d
V2: gp_Vec2d
V3: gp_Vec2d

Return
-------
None

Description
-----------
No available documentation.
") D3;
		static void D3(const Standard_Real U, const gp_Elips2d & E, gp_Pnt2d & P, gp_Vec2d & V1, gp_Vec2d & V2, gp_Vec2d & V3);

		/****** ElCLib::D3 ******/
		/****** md5 signature: 6f375725aae2577b37e04467cea54a5c ******/
		%feature("compactdefaultargs") D3;
		%feature("autodoc", "
Parameters
----------
U: float
H: gp_Hypr2d
P: gp_Pnt2d
V1: gp_Vec2d
V2: gp_Vec2d
V3: gp_Vec2d

Return
-------
None

Description
-----------
In the following functions N is the order of derivation and should be greater than 0.
") D3;
		static void D3(const Standard_Real U, const gp_Hypr2d & H, gp_Pnt2d & P, gp_Vec2d & V1, gp_Vec2d & V2, gp_Vec2d & V3);

		/****** ElCLib::DN ******/
		/****** md5 signature: 906dd97634ae8e18db20f8c3ba953acb ******/
		%feature("compactdefaultargs") DN;
		%feature("autodoc", "
Parameters
----------
U: float
L: gp_Lin
N: int

Return
-------
gp_Vec

Description
-----------
For elementary curves (lines, circles and conics) from the gp package, computes the vector corresponding to the Nth derivative at the point of parameter U. The result is either: - a gp_Vec vector for a curve in 3D space, or - a gp_Vec2d vector for a curve in 2D space. In the following functions N is the order of derivation and should be greater than 0.
") DN;
		static gp_Vec DN(const Standard_Real U, const gp_Lin & L, const Standard_Integer N);

		/****** ElCLib::DN ******/
		/****** md5 signature: 47f8242822c8cea0c08c698c6bbcdfe3 ******/
		%feature("compactdefaultargs") DN;
		%feature("autodoc", "
Parameters
----------
U: float
C: gp_Circ
N: int

Return
-------
gp_Vec

Description
-----------
No available documentation.
") DN;
		static gp_Vec DN(const Standard_Real U, const gp_Circ & C, const Standard_Integer N);

		/****** ElCLib::DN ******/
		/****** md5 signature: 5a6acea0b3373b42b9c4e893f6261cba ******/
		%feature("compactdefaultargs") DN;
		%feature("autodoc", "
Parameters
----------
U: float
E: gp_Elips
N: int

Return
-------
gp_Vec

Description
-----------
No available documentation.
") DN;
		static gp_Vec DN(const Standard_Real U, const gp_Elips & E, const Standard_Integer N);

		/****** ElCLib::DN ******/
		/****** md5 signature: 49583a74ba80488d4c4ad2e6926b78df ******/
		%feature("compactdefaultargs") DN;
		%feature("autodoc", "
Parameters
----------
U: float
H: gp_Hypr
N: int

Return
-------
gp_Vec

Description
-----------
No available documentation.
") DN;
		static gp_Vec DN(const Standard_Real U, const gp_Hypr & H, const Standard_Integer N);

		/****** ElCLib::DN ******/
		/****** md5 signature: 903db7d628a4fcb02e293930cab55cbd ******/
		%feature("compactdefaultargs") DN;
		%feature("autodoc", "
Parameters
----------
U: float
Prb: gp_Parab
N: int

Return
-------
gp_Vec

Description
-----------
No available documentation.
") DN;
		static gp_Vec DN(const Standard_Real U, const gp_Parab & Prb, const Standard_Integer N);

		/****** ElCLib::DN ******/
		/****** md5 signature: 17e6278397b957ffc39900585a83f3d3 ******/
		%feature("compactdefaultargs") DN;
		%feature("autodoc", "
Parameters
----------
U: float
L: gp_Lin2d
N: int

Return
-------
gp_Vec2d

Description
-----------
No available documentation.
") DN;
		static gp_Vec2d DN(const Standard_Real U, const gp_Lin2d & L, const Standard_Integer N);

		/****** ElCLib::DN ******/
		/****** md5 signature: 1a4ae9e4518239fc3f7b2739e72360c5 ******/
		%feature("compactdefaultargs") DN;
		%feature("autodoc", "
Parameters
----------
U: float
C: gp_Circ2d
N: int

Return
-------
gp_Vec2d

Description
-----------
No available documentation.
") DN;
		static gp_Vec2d DN(const Standard_Real U, const gp_Circ2d & C, const Standard_Integer N);

		/****** ElCLib::DN ******/
		/****** md5 signature: 8112c6ea5074c210244d783558f657af ******/
		%feature("compactdefaultargs") DN;
		%feature("autodoc", "
Parameters
----------
U: float
E: gp_Elips2d
N: int

Return
-------
gp_Vec2d

Description
-----------
No available documentation.
") DN;
		static gp_Vec2d DN(const Standard_Real U, const gp_Elips2d & E, const Standard_Integer N);

		/****** ElCLib::DN ******/
		/****** md5 signature: 0f4adb9b37809fe774928577eacfadd4 ******/
		%feature("compactdefaultargs") DN;
		%feature("autodoc", "
Parameters
----------
U: float
H: gp_Hypr2d
N: int

Return
-------
gp_Vec2d

Description
-----------
No available documentation.
") DN;
		static gp_Vec2d DN(const Standard_Real U, const gp_Hypr2d & H, const Standard_Integer N);

		/****** ElCLib::DN ******/
		/****** md5 signature: e67031172b84f3a3b132c1cfa1e007a5 ******/
		%feature("compactdefaultargs") DN;
		%feature("autodoc", "
Parameters
----------
U: float
Prb: gp_Parab2d
N: int

Return
-------
gp_Vec2d

Description
-----------
No available documentation.
") DN;
		static gp_Vec2d DN(const Standard_Real U, const gp_Parab2d & Prb, const Standard_Integer N);

		/****** ElCLib::EllipseD1 ******/
		/****** md5 signature: 6593b6832008eb1e08ba875629ec6f2d ******/
		%feature("compactdefaultargs") EllipseD1;
		%feature("autodoc", "
Parameters
----------
U: float
Pos: gp_Ax2
MajorRadius: float
MinorRadius: float
P: gp_Pnt
V1: gp_Vec

Return
-------
None

Description
-----------
No available documentation.
") EllipseD1;
		static void EllipseD1(const Standard_Real U, const gp_Ax2 & Pos, const Standard_Real MajorRadius, const Standard_Real MinorRadius, gp_Pnt & P, gp_Vec & V1);

		/****** ElCLib::EllipseD1 ******/
		/****** md5 signature: 093400b65d5ddd2d995df1f71658bd2f ******/
		%feature("compactdefaultargs") EllipseD1;
		%feature("autodoc", "
Parameters
----------
U: float
Pos: gp_Ax22d
MajorRadius: float
MinorRadius: float
P: gp_Pnt2d
V1: gp_Vec2d

Return
-------
None

Description
-----------
No available documentation.
") EllipseD1;
		static void EllipseD1(const Standard_Real U, const gp_Ax22d & Pos, const Standard_Real MajorRadius, const Standard_Real MinorRadius, gp_Pnt2d & P, gp_Vec2d & V1);

		/****** ElCLib::EllipseD2 ******/
		/****** md5 signature: 94e6352d82f5a718596085ae6192b0f4 ******/
		%feature("compactdefaultargs") EllipseD2;
		%feature("autodoc", "
Parameters
----------
U: float
Pos: gp_Ax2
MajorRadius: float
MinorRadius: float
P: gp_Pnt
V1: gp_Vec
V2: gp_Vec

Return
-------
None

Description
-----------
No available documentation.
") EllipseD2;
		static void EllipseD2(const Standard_Real U, const gp_Ax2 & Pos, const Standard_Real MajorRadius, const Standard_Real MinorRadius, gp_Pnt & P, gp_Vec & V1, gp_Vec & V2);

		/****** ElCLib::EllipseD2 ******/
		/****** md5 signature: f1ac8bac2488b01be483ca73b4d96525 ******/
		%feature("compactdefaultargs") EllipseD2;
		%feature("autodoc", "
Parameters
----------
U: float
Pos: gp_Ax22d
MajorRadius: float
MinorRadius: float
P: gp_Pnt2d
V1: gp_Vec2d
V2: gp_Vec2d

Return
-------
None

Description
-----------
No available documentation.
") EllipseD2;
		static void EllipseD2(const Standard_Real U, const gp_Ax22d & Pos, const Standard_Real MajorRadius, const Standard_Real MinorRadius, gp_Pnt2d & P, gp_Vec2d & V1, gp_Vec2d & V2);

		/****** ElCLib::EllipseD3 ******/
		/****** md5 signature: a8d0a37bfdd61c8132ad02bcd42abf97 ******/
		%feature("compactdefaultargs") EllipseD3;
		%feature("autodoc", "
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

Return
-------
None

Description
-----------
No available documentation.
") EllipseD3;
		static void EllipseD3(const Standard_Real U, const gp_Ax2 & Pos, const Standard_Real MajorRadius, const Standard_Real MinorRadius, gp_Pnt & P, gp_Vec & V1, gp_Vec & V2, gp_Vec & V3);

		/****** ElCLib::EllipseD3 ******/
		/****** md5 signature: bdd32b73f0c9829834faf35dd0229e32 ******/
		%feature("compactdefaultargs") EllipseD3;
		%feature("autodoc", "
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

Return
-------
None

Description
-----------
No available documentation.
") EllipseD3;
		static void EllipseD3(const Standard_Real U, const gp_Ax22d & Pos, const Standard_Real MajorRadius, const Standard_Real MinorRadius, gp_Pnt2d & P, gp_Vec2d & V1, gp_Vec2d & V2, gp_Vec2d & V3);

		/****** ElCLib::EllipseDN ******/
		/****** md5 signature: f8970908a0d6bbf296e004aee7c8dd5f ******/
		%feature("compactdefaultargs") EllipseDN;
		%feature("autodoc", "
Parameters
----------
U: float
Pos: gp_Ax2
MajorRadius: float
MinorRadius: float
N: int

Return
-------
gp_Vec

Description
-----------
No available documentation.
") EllipseDN;
		static gp_Vec EllipseDN(const Standard_Real U, const gp_Ax2 & Pos, const Standard_Real MajorRadius, const Standard_Real MinorRadius, const Standard_Integer N);

		/****** ElCLib::EllipseDN ******/
		/****** md5 signature: fa95cba3bb71049e0dbda3c5897cf3f7 ******/
		%feature("compactdefaultargs") EllipseDN;
		%feature("autodoc", "
Parameters
----------
U: float
Pos: gp_Ax22d
MajorRadius: float
MinorRadius: float
N: int

Return
-------
gp_Vec2d

Description
-----------
No available documentation.
") EllipseDN;
		static gp_Vec2d EllipseDN(const Standard_Real U, const gp_Ax22d & Pos, const Standard_Real MajorRadius, const Standard_Real MinorRadius, const Standard_Integer N);

		/****** ElCLib::EllipseParameter ******/
		/****** md5 signature: 7ea0af8a159007b224c805cd6b2750fb ******/
		%feature("compactdefaultargs") EllipseParameter;
		%feature("autodoc", "
Parameters
----------
Pos: gp_Ax2
MajorRadius: float
MinorRadius: float
P: gp_Pnt

Return
-------
float

Description
-----------
No available documentation.
") EllipseParameter;
		static Standard_Real EllipseParameter(const gp_Ax2 & Pos, const Standard_Real MajorRadius, const Standard_Real MinorRadius, const gp_Pnt & P);

		/****** ElCLib::EllipseParameter ******/
		/****** md5 signature: 9adc5af57d198107ea118e0a5118ff8b ******/
		%feature("compactdefaultargs") EllipseParameter;
		%feature("autodoc", "
Parameters
----------
Pos: gp_Ax22d
MajorRadius: float
MinorRadius: float
P: gp_Pnt2d

Return
-------
float

Description
-----------
Pos is the Axis of the Ellipse parametrization In the local coordinate system of the Ellipse X (U) = MajorRadius * Cos (U) Y (U) = MinorRadius * Sin (U).
") EllipseParameter;
		static Standard_Real EllipseParameter(const gp_Ax22d & Pos, const Standard_Real MajorRadius, const Standard_Real MinorRadius, const gp_Pnt2d & P);

		/****** ElCLib::EllipseValue ******/
		/****** md5 signature: d54582fecc06252f293f1a1e61001a89 ******/
		%feature("compactdefaultargs") EllipseValue;
		%feature("autodoc", "
Parameters
----------
U: float
Pos: gp_Ax2
MajorRadius: float
MinorRadius: float

Return
-------
gp_Pnt

Description
-----------
No available documentation.
") EllipseValue;
		static gp_Pnt EllipseValue(const Standard_Real U, const gp_Ax2 & Pos, const Standard_Real MajorRadius, const Standard_Real MinorRadius);

		/****** ElCLib::EllipseValue ******/
		/****** md5 signature: fa1d15069b68a59764b437be76d05088 ******/
		%feature("compactdefaultargs") EllipseValue;
		%feature("autodoc", "
Parameters
----------
U: float
Pos: gp_Ax22d
MajorRadius: float
MinorRadius: float

Return
-------
gp_Pnt2d

Description
-----------
No available documentation.
") EllipseValue;
		static gp_Pnt2d EllipseValue(const Standard_Real U, const gp_Ax22d & Pos, const Standard_Real MajorRadius, const Standard_Real MinorRadius);

		/****** ElCLib::HyperbolaD1 ******/
		/****** md5 signature: 033ede559cba6ac21a9fef26462ef8f3 ******/
		%feature("compactdefaultargs") HyperbolaD1;
		%feature("autodoc", "
Parameters
----------
U: float
Pos: gp_Ax2
MajorRadius: float
MinorRadius: float
P: gp_Pnt
V1: gp_Vec

Return
-------
None

Description
-----------
No available documentation.
") HyperbolaD1;
		static void HyperbolaD1(const Standard_Real U, const gp_Ax2 & Pos, const Standard_Real MajorRadius, const Standard_Real MinorRadius, gp_Pnt & P, gp_Vec & V1);

		/****** ElCLib::HyperbolaD1 ******/
		/****** md5 signature: 3a363cda94c2cd01407e26d1c78ade9f ******/
		%feature("compactdefaultargs") HyperbolaD1;
		%feature("autodoc", "
Parameters
----------
U: float
Pos: gp_Ax22d
MajorRadius: float
MinorRadius: float
P: gp_Pnt2d
V1: gp_Vec2d

Return
-------
None

Description
-----------
No available documentation.
") HyperbolaD1;
		static void HyperbolaD1(const Standard_Real U, const gp_Ax22d & Pos, const Standard_Real MajorRadius, const Standard_Real MinorRadius, gp_Pnt2d & P, gp_Vec2d & V1);

		/****** ElCLib::HyperbolaD2 ******/
		/****** md5 signature: 03a91b782355142e9ddd64b2e17c1677 ******/
		%feature("compactdefaultargs") HyperbolaD2;
		%feature("autodoc", "
Parameters
----------
U: float
Pos: gp_Ax2
MajorRadius: float
MinorRadius: float
P: gp_Pnt
V1: gp_Vec
V2: gp_Vec

Return
-------
None

Description
-----------
No available documentation.
") HyperbolaD2;
		static void HyperbolaD2(const Standard_Real U, const gp_Ax2 & Pos, const Standard_Real MajorRadius, const Standard_Real MinorRadius, gp_Pnt & P, gp_Vec & V1, gp_Vec & V2);

		/****** ElCLib::HyperbolaD2 ******/
		/****** md5 signature: b2e405bb7c4b37e6d87915716f83a4e8 ******/
		%feature("compactdefaultargs") HyperbolaD2;
		%feature("autodoc", "
Parameters
----------
U: float
Pos: gp_Ax22d
MajorRadius: float
MinorRadius: float
P: gp_Pnt2d
V1: gp_Vec2d
V2: gp_Vec2d

Return
-------
None

Description
-----------
No available documentation.
") HyperbolaD2;
		static void HyperbolaD2(const Standard_Real U, const gp_Ax22d & Pos, const Standard_Real MajorRadius, const Standard_Real MinorRadius, gp_Pnt2d & P, gp_Vec2d & V1, gp_Vec2d & V2);

		/****** ElCLib::HyperbolaD3 ******/
		/****** md5 signature: 238469a3dbbc424fea9a1937c9e00668 ******/
		%feature("compactdefaultargs") HyperbolaD3;
		%feature("autodoc", "
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

Return
-------
None

Description
-----------
No available documentation.
") HyperbolaD3;
		static void HyperbolaD3(const Standard_Real U, const gp_Ax2 & Pos, const Standard_Real MajorRadius, const Standard_Real MinorRadius, gp_Pnt & P, gp_Vec & V1, gp_Vec & V2, gp_Vec & V3);

		/****** ElCLib::HyperbolaD3 ******/
		/****** md5 signature: b906249598c170d7267f6ac98714d87f ******/
		%feature("compactdefaultargs") HyperbolaD3;
		%feature("autodoc", "
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

Return
-------
None

Description
-----------
In the following functions N is the order of derivation and should be greater than 0.
") HyperbolaD3;
		static void HyperbolaD3(const Standard_Real U, const gp_Ax22d & Pos, const Standard_Real MajorRadius, const Standard_Real MinorRadius, gp_Pnt2d & P, gp_Vec2d & V1, gp_Vec2d & V2, gp_Vec2d & V3);

		/****** ElCLib::HyperbolaDN ******/
		/****** md5 signature: 64606ed51d58295ebd5231b094c367fe ******/
		%feature("compactdefaultargs") HyperbolaDN;
		%feature("autodoc", "
Parameters
----------
U: float
Pos: gp_Ax2
MajorRadius: float
MinorRadius: float
N: int

Return
-------
gp_Vec

Description
-----------
No available documentation.
") HyperbolaDN;
		static gp_Vec HyperbolaDN(const Standard_Real U, const gp_Ax2 & Pos, const Standard_Real MajorRadius, const Standard_Real MinorRadius, const Standard_Integer N);

		/****** ElCLib::HyperbolaDN ******/
		/****** md5 signature: 3abfa8458baef677bbe28fcc2d8aa4f9 ******/
		%feature("compactdefaultargs") HyperbolaDN;
		%feature("autodoc", "
Parameters
----------
U: float
Pos: gp_Ax22d
MajorRadius: float
MinorRadius: float
N: int

Return
-------
gp_Vec2d

Description
-----------
No available documentation.
") HyperbolaDN;
		static gp_Vec2d HyperbolaDN(const Standard_Real U, const gp_Ax22d & Pos, const Standard_Real MajorRadius, const Standard_Real MinorRadius, const Standard_Integer N);

		/****** ElCLib::HyperbolaParameter ******/
		/****** md5 signature: 1ac7c151e92a90a9c54f6feecb124b3a ******/
		%feature("compactdefaultargs") HyperbolaParameter;
		%feature("autodoc", "
Parameters
----------
Pos: gp_Ax2
MajorRadius: float
MinorRadius: float
P: gp_Pnt

Return
-------
float

Description
-----------
No available documentation.
") HyperbolaParameter;
		static Standard_Real HyperbolaParameter(const gp_Ax2 & Pos, const Standard_Real MajorRadius, const Standard_Real MinorRadius, const gp_Pnt & P);

		/****** ElCLib::HyperbolaParameter ******/
		/****** md5 signature: 6f3595272e2a586d186798eb561dd223 ******/
		%feature("compactdefaultargs") HyperbolaParameter;
		%feature("autodoc", "
Parameters
----------
Pos: gp_Ax22d
MajorRadius: float
MinorRadius: float
P: gp_Pnt2d

Return
-------
float

Description
-----------
Pos is the Axis of the Hyperbola parametrization In the local coordinate system of the Hyperbola X (U) = MajorRadius * Ch (U) Y (U) = MinorRadius * Sh (U).
") HyperbolaParameter;
		static Standard_Real HyperbolaParameter(const gp_Ax22d & Pos, const Standard_Real MajorRadius, const Standard_Real MinorRadius, const gp_Pnt2d & P);

		/****** ElCLib::HyperbolaValue ******/
		/****** md5 signature: b83b776e2657cd56ddc82e5ef6298410 ******/
		%feature("compactdefaultargs") HyperbolaValue;
		%feature("autodoc", "
Parameters
----------
U: float
Pos: gp_Ax2
MajorRadius: float
MinorRadius: float

Return
-------
gp_Pnt

Description
-----------
No available documentation.
") HyperbolaValue;
		static gp_Pnt HyperbolaValue(const Standard_Real U, const gp_Ax2 & Pos, const Standard_Real MajorRadius, const Standard_Real MinorRadius);

		/****** ElCLib::HyperbolaValue ******/
		/****** md5 signature: c40c27b385ce364d0b3257da8e1ec87a ******/
		%feature("compactdefaultargs") HyperbolaValue;
		%feature("autodoc", "
Parameters
----------
U: float
Pos: gp_Ax22d
MajorRadius: float
MinorRadius: float

Return
-------
gp_Pnt2d

Description
-----------
No available documentation.
") HyperbolaValue;
		static gp_Pnt2d HyperbolaValue(const Standard_Real U, const gp_Ax22d & Pos, const Standard_Real MajorRadius, const Standard_Real MinorRadius);

		/****** ElCLib::InPeriod ******/
		/****** md5 signature: 883a590c13e6d39257033db941d4e702 ******/
		%feature("compactdefaultargs") InPeriod;
		%feature("autodoc", "
Parameters
----------
U: float
UFirst: float
ULast: float

Return
-------
float

Description
-----------
Return a value in the range <UFirst, ULast> by adding or removing the period <ULast - UFirst> to <U>. ATTENTION!!! It is expected but not checked that (ULast > UFirst).
") InPeriod;
		static Standard_Real InPeriod(const Standard_Real U, const Standard_Real UFirst, const Standard_Real ULast);

		/****** ElCLib::LineD1 ******/
		/****** md5 signature: fc625c5a3779023dffcf4cd338619ad5 ******/
		%feature("compactdefaultargs") LineD1;
		%feature("autodoc", "
Parameters
----------
U: float
Pos: gp_Ax1
P: gp_Pnt
V1: gp_Vec

Return
-------
None

Description
-----------
No available documentation.
") LineD1;
		static void LineD1(const Standard_Real U, const gp_Ax1 & Pos, gp_Pnt & P, gp_Vec & V1);

		/****** ElCLib::LineD1 ******/
		/****** md5 signature: 7b3ff7d2b0a92631a2175fb61f85c547 ******/
		%feature("compactdefaultargs") LineD1;
		%feature("autodoc", "
Parameters
----------
U: float
Pos: gp_Ax2d
P: gp_Pnt2d
V1: gp_Vec2d

Return
-------
None

Description
-----------
No available documentation.
") LineD1;
		static void LineD1(const Standard_Real U, const gp_Ax2d & Pos, gp_Pnt2d & P, gp_Vec2d & V1);

		/****** ElCLib::LineDN ******/
		/****** md5 signature: 37bccade86b2de011c381d69ff01cba7 ******/
		%feature("compactdefaultargs") LineDN;
		%feature("autodoc", "
Parameters
----------
U: float
Pos: gp_Ax1
N: int

Return
-------
gp_Vec

Description
-----------
In the following functions N is the order of derivation and should be greater than 0.
") LineDN;
		static gp_Vec LineDN(const Standard_Real U, const gp_Ax1 & Pos, const Standard_Integer N);

		/****** ElCLib::LineDN ******/
		/****** md5 signature: 04ba70295ad6b3d76adf99aacf99b805 ******/
		%feature("compactdefaultargs") LineDN;
		%feature("autodoc", "
Parameters
----------
U: float
Pos: gp_Ax2d
N: int

Return
-------
gp_Vec2d

Description
-----------
No available documentation.
") LineDN;
		static gp_Vec2d LineDN(const Standard_Real U, const gp_Ax2d & Pos, const Standard_Integer N);

		/****** ElCLib::LineParameter ******/
		/****** md5 signature: 3003b02b9d9b461587a6d0764b1f0102 ******/
		%feature("compactdefaultargs") LineParameter;
		%feature("autodoc", "
Parameters
----------
Pos: gp_Ax1
P: gp_Pnt

Return
-------
float

Description
-----------
No available documentation.
") LineParameter;
		static Standard_Real LineParameter(const gp_Ax1 & Pos, const gp_Pnt & P);

		/****** ElCLib::LineParameter ******/
		/****** md5 signature: ca1ba1d96b0875085e4ace212cd2d361 ******/
		%feature("compactdefaultargs") LineParameter;
		%feature("autodoc", "
Parameters
----------
Pos: gp_Ax2d
P: gp_Pnt2d

Return
-------
float

Description
-----------
parametrization P (U) = L.Location() + U * L.Direction().
") LineParameter;
		static Standard_Real LineParameter(const gp_Ax2d & Pos, const gp_Pnt2d & P);

		/****** ElCLib::LineValue ******/
		/****** md5 signature: 8c9d4a1bc40f1a7a796def7654c380b7 ******/
		%feature("compactdefaultargs") LineValue;
		%feature("autodoc", "
Parameters
----------
U: float
Pos: gp_Ax1

Return
-------
gp_Pnt

Description
-----------
Curve evaluation The following basis functions compute the derivatives on elementary curves defined by their geometric characteristics. These functions can be called without constructing a conic from package gp. They are called by the previous functions. Example: A circle is defined by its position and its radius.
") LineValue;
		static gp_Pnt LineValue(const Standard_Real U, const gp_Ax1 & Pos);

		/****** ElCLib::LineValue ******/
		/****** md5 signature: 1c0049b64e6c51ac6742eeba33f38305 ******/
		%feature("compactdefaultargs") LineValue;
		%feature("autodoc", "
Parameters
----------
U: float
Pos: gp_Ax2d

Return
-------
gp_Pnt2d

Description
-----------
No available documentation.
") LineValue;
		static gp_Pnt2d LineValue(const Standard_Real U, const gp_Ax2d & Pos);

		/****** ElCLib::ParabolaD1 ******/
		/****** md5 signature: 718d51678e2e5ee75203f96e49c438d5 ******/
		%feature("compactdefaultargs") ParabolaD1;
		%feature("autodoc", "
Parameters
----------
U: float
Pos: gp_Ax2
Focal: float
P: gp_Pnt
V1: gp_Vec

Return
-------
None

Description
-----------
No available documentation.
") ParabolaD1;
		static void ParabolaD1(const Standard_Real U, const gp_Ax2 & Pos, const Standard_Real Focal, gp_Pnt & P, gp_Vec & V1);

		/****** ElCLib::ParabolaD1 ******/
		/****** md5 signature: 4e1990f537afd932bc1ce130c0434488 ******/
		%feature("compactdefaultargs") ParabolaD1;
		%feature("autodoc", "
Parameters
----------
U: float
Pos: gp_Ax22d
Focal: float
P: gp_Pnt2d
V1: gp_Vec2d

Return
-------
None

Description
-----------
No available documentation.
") ParabolaD1;
		static void ParabolaD1(const Standard_Real U, const gp_Ax22d & Pos, const Standard_Real Focal, gp_Pnt2d & P, gp_Vec2d & V1);

		/****** ElCLib::ParabolaD2 ******/
		/****** md5 signature: 008f7fe7e97288063480d401ac72d77b ******/
		%feature("compactdefaultargs") ParabolaD2;
		%feature("autodoc", "
Parameters
----------
U: float
Pos: gp_Ax2
Focal: float
P: gp_Pnt
V1: gp_Vec
V2: gp_Vec

Return
-------
None

Description
-----------
No available documentation.
") ParabolaD2;
		static void ParabolaD2(const Standard_Real U, const gp_Ax2 & Pos, const Standard_Real Focal, gp_Pnt & P, gp_Vec & V1, gp_Vec & V2);

		/****** ElCLib::ParabolaD2 ******/
		/****** md5 signature: 343cbde8116c778c0b005be3bd8e560d ******/
		%feature("compactdefaultargs") ParabolaD2;
		%feature("autodoc", "
Parameters
----------
U: float
Pos: gp_Ax22d
Focal: float
P: gp_Pnt2d
V1: gp_Vec2d
V2: gp_Vec2d

Return
-------
None

Description
-----------
No available documentation.
") ParabolaD2;
		static void ParabolaD2(const Standard_Real U, const gp_Ax22d & Pos, const Standard_Real Focal, gp_Pnt2d & P, gp_Vec2d & V1, gp_Vec2d & V2);

		/****** ElCLib::ParabolaDN ******/
		/****** md5 signature: 98a7dc7df6cab966d8f5341e7a669ba6 ******/
		%feature("compactdefaultargs") ParabolaDN;
		%feature("autodoc", "
Parameters
----------
U: float
Pos: gp_Ax2
Focal: float
N: int

Return
-------
gp_Vec

Description
-----------
No available documentation.
") ParabolaDN;
		static gp_Vec ParabolaDN(const Standard_Real U, const gp_Ax2 & Pos, const Standard_Real Focal, const Standard_Integer N);

		/****** ElCLib::ParabolaDN ******/
		/****** md5 signature: 9000962510b0d389d586207e890fa5c7 ******/
		%feature("compactdefaultargs") ParabolaDN;
		%feature("autodoc", "
Parameters
----------
U: float
Pos: gp_Ax22d
Focal: float
N: int

Return
-------
gp_Vec2d

Description
-----------
The following functions compute the parametric value corresponding to a given point on a elementary curve. The point should be on the curve.
") ParabolaDN;
		static gp_Vec2d ParabolaDN(const Standard_Real U, const gp_Ax22d & Pos, const Standard_Real Focal, const Standard_Integer N);

		/****** ElCLib::ParabolaParameter ******/
		/****** md5 signature: be6a94c70eda2cca123aeff7e9c873f8 ******/
		%feature("compactdefaultargs") ParabolaParameter;
		%feature("autodoc", "
Parameters
----------
Pos: gp_Ax2
P: gp_Pnt

Return
-------
float

Description
-----------
No available documentation.
") ParabolaParameter;
		static Standard_Real ParabolaParameter(const gp_Ax2 & Pos, const gp_Pnt & P);

		/****** ElCLib::ParabolaParameter ******/
		/****** md5 signature: ac4ea60923b1662c5bc0e00811830d7c ******/
		%feature("compactdefaultargs") ParabolaParameter;
		%feature("autodoc", "
Parameters
----------
Pos: gp_Ax22d
P: gp_Pnt2d

Return
-------
float

Description
-----------
Pos is the mirror axis of the parabola parametrization In the local coordinate system of the parabola Y**2 = (2*P) * X where P is the distance between the focus and the directrix. The following functions build a 3d curve from a 2d curve at a given position defined with an Ax2.
") ParabolaParameter;
		static Standard_Real ParabolaParameter(const gp_Ax22d & Pos, const gp_Pnt2d & P);

		/****** ElCLib::ParabolaValue ******/
		/****** md5 signature: 79c5c33d9dcae654ec135813f37c9103 ******/
		%feature("compactdefaultargs") ParabolaValue;
		%feature("autodoc", "
Parameters
----------
U: float
Pos: gp_Ax2
Focal: float

Return
-------
gp_Pnt

Description
-----------
No available documentation.
") ParabolaValue;
		static gp_Pnt ParabolaValue(const Standard_Real U, const gp_Ax2 & Pos, const Standard_Real Focal);

		/****** ElCLib::ParabolaValue ******/
		/****** md5 signature: 44322c024bb31a8ed2cbdb18b7d8cc63 ******/
		%feature("compactdefaultargs") ParabolaValue;
		%feature("autodoc", "
Parameters
----------
U: float
Pos: gp_Ax22d
Focal: float

Return
-------
gp_Pnt2d

Description
-----------
No available documentation.
") ParabolaValue;
		static gp_Pnt2d ParabolaValue(const Standard_Real U, const gp_Ax22d & Pos, const Standard_Real Focal);

		/****** ElCLib::Parameter ******/
		/****** md5 signature: fdffb0a483b99135c55258f3f69dfd77 ******/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "
Parameters
----------
L: gp_Lin
P: gp_Pnt

Return
-------
float

Description
-----------
Computes the parameter value of the point P on the given curve. Note: In its local coordinate system, the parametric equation of the curve is given by the following: - for the line L: P(U) = Po + U*Vo where Po is the origin and Vo the unit vector of its positioning axis. - for the circle C: X(U) = Radius*Cos(U), Y(U) = Radius*Sin(U) - for the ellipse E: X(U) = MajorRadius*Cos(U). Y(U) = MinorRadius*Sin(U) - for the hyperbola H: X(U) = MajorRadius*Ch(U), Y(U) = MinorRadius*Sh(U) - for the parabola Prb: X(U) = U**2 / (2*p) Y(U) = U where p is the distance between the focus and the directrix. Warning The point P must be on the curve. These functions are not protected, however, and if point P is not on the curve, an exception may be raised.
") Parameter;
		static Standard_Real Parameter(const gp_Lin & L, const gp_Pnt & P);

		/****** ElCLib::Parameter ******/
		/****** md5 signature: 5c19b9d7339e4287f032225279193aac ******/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "
Parameters
----------
L: gp_Lin2d
P: gp_Pnt2d

Return
-------
float

Description
-----------
parametrization P (U) = L.Location() + U * L.Direction().
") Parameter;
		static Standard_Real Parameter(const gp_Lin2d & L, const gp_Pnt2d & P);

		/****** ElCLib::Parameter ******/
		/****** md5 signature: c0de9d224cc41db001d89345bb1cc0df ******/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "
Parameters
----------
C: gp_Circ
P: gp_Pnt

Return
-------
float

Description
-----------
No available documentation.
") Parameter;
		static Standard_Real Parameter(const gp_Circ & C, const gp_Pnt & P);

		/****** ElCLib::Parameter ******/
		/****** md5 signature: fc1445dfdc288aa7468073f96390f76e ******/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "
Parameters
----------
C: gp_Circ2d
P: gp_Pnt2d

Return
-------
float

Description
-----------
parametrization In the local coordinate system of the circle X (U) = Radius * Cos (U) Y (U) = Radius * Sin (U).
") Parameter;
		static Standard_Real Parameter(const gp_Circ2d & C, const gp_Pnt2d & P);

		/****** ElCLib::Parameter ******/
		/****** md5 signature: 7be9925318277a51229e05227e49261d ******/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "
Parameters
----------
E: gp_Elips
P: gp_Pnt

Return
-------
float

Description
-----------
No available documentation.
") Parameter;
		static Standard_Real Parameter(const gp_Elips & E, const gp_Pnt & P);

		/****** ElCLib::Parameter ******/
		/****** md5 signature: f94bcbce615e9d9dc64babd9d7146c29 ******/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "
Parameters
----------
E: gp_Elips2d
P: gp_Pnt2d

Return
-------
float

Description
-----------
parametrization In the local coordinate system of the Ellipse X (U) = MajorRadius * Cos (U) Y (U) = MinorRadius * Sin (U).
") Parameter;
		static Standard_Real Parameter(const gp_Elips2d & E, const gp_Pnt2d & P);

		/****** ElCLib::Parameter ******/
		/****** md5 signature: 9513c9d32e783629b14c8de9e6bd8a60 ******/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "
Parameters
----------
H: gp_Hypr
P: gp_Pnt

Return
-------
float

Description
-----------
No available documentation.
") Parameter;
		static Standard_Real Parameter(const gp_Hypr & H, const gp_Pnt & P);

		/****** ElCLib::Parameter ******/
		/****** md5 signature: 746f4ae2f34e8c146289569ee8698e24 ******/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "
Parameters
----------
H: gp_Hypr2d
P: gp_Pnt2d

Return
-------
float

Description
-----------
parametrization In the local coordinate system of the Hyperbola X (U) = MajorRadius * Ch (U) Y (U) = MinorRadius * Sh (U).
") Parameter;
		static Standard_Real Parameter(const gp_Hypr2d & H, const gp_Pnt2d & P);

		/****** ElCLib::Parameter ******/
		/****** md5 signature: 3bebf670839393a24ae1609893fd794b ******/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "
Parameters
----------
Prb: gp_Parab
P: gp_Pnt

Return
-------
float

Description
-----------
No available documentation.
") Parameter;
		static Standard_Real Parameter(const gp_Parab & Prb, const gp_Pnt & P);

		/****** ElCLib::Parameter ******/
		/****** md5 signature: b160c415b3cecd54564c3899672650ac ******/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "
Parameters
----------
Prb: gp_Parab2d
P: gp_Pnt2d

Return
-------
float

Description
-----------
parametrization In the local coordinate system of the parabola Y**2 = (2*P) * X where P is the distance between the focus and the directrix.
") Parameter;
		static Standard_Real Parameter(const gp_Parab2d & Prb, const gp_Pnt2d & P);

		/****** ElCLib::To3d ******/
		/****** md5 signature: d6eb46a2a80e30e827b5ec0546580b9d ******/
		%feature("compactdefaultargs") To3d;
		%feature("autodoc", "
Parameters
----------
Pos: gp_Ax2
P: gp_Pnt2d

Return
-------
gp_Pnt

Description
-----------
No available documentation.
") To3d;
		static gp_Pnt To3d(const gp_Ax2 & Pos, const gp_Pnt2d & P);

		/****** ElCLib::To3d ******/
		/****** md5 signature: 15e5d44014978eea4b234ce5f508823f ******/
		%feature("compactdefaultargs") To3d;
		%feature("autodoc", "
Parameters
----------
Pos: gp_Ax2
V: gp_Vec2d

Return
-------
gp_Vec

Description
-----------
No available documentation.
") To3d;
		static gp_Vec To3d(const gp_Ax2 & Pos, const gp_Vec2d & V);

		/****** ElCLib::To3d ******/
		/****** md5 signature: 46ba1c4acbf8e7dab865489fa639e50a ******/
		%feature("compactdefaultargs") To3d;
		%feature("autodoc", "
Parameters
----------
Pos: gp_Ax2
V: gp_Dir2d

Return
-------
gp_Dir

Description
-----------
No available documentation.
") To3d;
		static gp_Dir To3d(const gp_Ax2 & Pos, const gp_Dir2d & V);

		/****** ElCLib::To3d ******/
		/****** md5 signature: 00a2ff51c078ee9ef43b0bea27dbb9e0 ******/
		%feature("compactdefaultargs") To3d;
		%feature("autodoc", "
Parameters
----------
Pos: gp_Ax2
A: gp_Ax2d

Return
-------
gp_Ax1

Description
-----------
No available documentation.
") To3d;
		static gp_Ax1 To3d(const gp_Ax2 & Pos, const gp_Ax2d & A);

		/****** ElCLib::To3d ******/
		/****** md5 signature: 7fedb205d65f8314e451664c8d4353ea ******/
		%feature("compactdefaultargs") To3d;
		%feature("autodoc", "
Parameters
----------
Pos: gp_Ax2
A: gp_Ax22d

Return
-------
gp_Ax2

Description
-----------
No available documentation.
") To3d;
		static gp_Ax2 To3d(const gp_Ax2 & Pos, const gp_Ax22d & A);

		/****** ElCLib::To3d ******/
		/****** md5 signature: fe55e92c77173bf56a6e8c7d320e8aab ******/
		%feature("compactdefaultargs") To3d;
		%feature("autodoc", "
Parameters
----------
Pos: gp_Ax2
L: gp_Lin2d

Return
-------
gp_Lin

Description
-----------
No available documentation.
") To3d;
		static gp_Lin To3d(const gp_Ax2 & Pos, const gp_Lin2d & L);

		/****** ElCLib::To3d ******/
		/****** md5 signature: 02449a387fb4d966c889415557e3be6a ******/
		%feature("compactdefaultargs") To3d;
		%feature("autodoc", "
Parameters
----------
Pos: gp_Ax2
C: gp_Circ2d

Return
-------
gp_Circ

Description
-----------
No available documentation.
") To3d;
		static gp_Circ To3d(const gp_Ax2 & Pos, const gp_Circ2d & C);

		/****** ElCLib::To3d ******/
		/****** md5 signature: 892dcd694df22cd9b12c922cbdc0d21f ******/
		%feature("compactdefaultargs") To3d;
		%feature("autodoc", "
Parameters
----------
Pos: gp_Ax2
E: gp_Elips2d

Return
-------
gp_Elips

Description
-----------
No available documentation.
") To3d;
		static gp_Elips To3d(const gp_Ax2 & Pos, const gp_Elips2d & E);

		/****** ElCLib::To3d ******/
		/****** md5 signature: fc277359cfba379ecc2feaeef51e1347 ******/
		%feature("compactdefaultargs") To3d;
		%feature("autodoc", "
Parameters
----------
Pos: gp_Ax2
H: gp_Hypr2d

Return
-------
gp_Hypr

Description
-----------
No available documentation.
") To3d;
		static gp_Hypr To3d(const gp_Ax2 & Pos, const gp_Hypr2d & H);

		/****** ElCLib::To3d ******/
		/****** md5 signature: e01e1c5ea59a879b1c0401f677c2ef81 ******/
		%feature("compactdefaultargs") To3d;
		%feature("autodoc", "
Parameters
----------
Pos: gp_Ax2
Prb: gp_Parab2d

Return
-------
gp_Parab

Description
-----------
These functions build a 3D geometric entity from a 2D geometric entity. The 'X Axis' and the 'Y Axis' of the global coordinate system (i.e. 2D space) are lined up respectively with the 'X Axis' and 'Y Axis' of the 3D coordinate system, Pos.
") To3d;
		static gp_Parab To3d(const gp_Ax2 & Pos, const gp_Parab2d & Prb);

		/****** ElCLib::Value ******/
		/****** md5 signature: dcf0031761dcf8de0f57e41c946a0a5f ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
U: float
L: gp_Lin

Return
-------
gp_Pnt

Description
-----------
For elementary curves (lines, circles and conics) from the gp package, computes the point of parameter U. The result is either: - a gp_Pnt point for a curve in 3D space, or - a gp_Pnt2d point for a curve in 2D space.
") Value;
		static gp_Pnt Value(const Standard_Real U, const gp_Lin & L);

		/****** ElCLib::Value ******/
		/****** md5 signature: 06d8da1b31def39d978e12c20d64cef4 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
U: float
C: gp_Circ

Return
-------
gp_Pnt

Description
-----------
No available documentation.
") Value;
		static gp_Pnt Value(const Standard_Real U, const gp_Circ & C);

		/****** ElCLib::Value ******/
		/****** md5 signature: 7272c18d7bcfe733c7e239ca90ac9955 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
U: float
E: gp_Elips

Return
-------
gp_Pnt

Description
-----------
No available documentation.
") Value;
		static gp_Pnt Value(const Standard_Real U, const gp_Elips & E);

		/****** ElCLib::Value ******/
		/****** md5 signature: d8fb8620979138dd40196a5de32ada52 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
U: float
H: gp_Hypr

Return
-------
gp_Pnt

Description
-----------
No available documentation.
") Value;
		static gp_Pnt Value(const Standard_Real U, const gp_Hypr & H);

		/****** ElCLib::Value ******/
		/****** md5 signature: 3f0f5bf4def209401dc2e57b7d0239be ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
U: float
Prb: gp_Parab

Return
-------
gp_Pnt

Description
-----------
No available documentation.
") Value;
		static gp_Pnt Value(const Standard_Real U, const gp_Parab & Prb);

		/****** ElCLib::Value ******/
		/****** md5 signature: 199f386ede52debecf14f2ce0102af65 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
U: float
L: gp_Lin2d

Return
-------
gp_Pnt2d

Description
-----------
No available documentation.
") Value;
		static gp_Pnt2d Value(const Standard_Real U, const gp_Lin2d & L);

		/****** ElCLib::Value ******/
		/****** md5 signature: 7f145b21fc7cd102603b54537f61d4e6 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
U: float
C: gp_Circ2d

Return
-------
gp_Pnt2d

Description
-----------
No available documentation.
") Value;
		static gp_Pnt2d Value(const Standard_Real U, const gp_Circ2d & C);

		/****** ElCLib::Value ******/
		/****** md5 signature: 57bd1d0011f8440b0ceebcd59c246f6f ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
U: float
E: gp_Elips2d

Return
-------
gp_Pnt2d

Description
-----------
No available documentation.
") Value;
		static gp_Pnt2d Value(const Standard_Real U, const gp_Elips2d & E);

		/****** ElCLib::Value ******/
		/****** md5 signature: 05c2c0e307e223938751475ab1931ddb ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
U: float
H: gp_Hypr2d

Return
-------
gp_Pnt2d

Description
-----------
No available documentation.
") Value;
		static gp_Pnt2d Value(const Standard_Real U, const gp_Hypr2d & H);

		/****** ElCLib::Value ******/
		/****** md5 signature: 9c529c16c32a6c9cd0dd5cf18db9c33f ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
U: float
Prb: gp_Parab2d

Return
-------
gp_Pnt2d

Description
-----------
No available documentation.
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
/* class aliases */
%pythoncode {
}
/* deprecated methods */
%pythoncode {
@deprecated
def elclib_AdjustPeriodic(*args):
	return elclib.AdjustPeriodic(*args)

@deprecated
def elclib_CircleD1(*args):
	return elclib.CircleD1(*args)

@deprecated
def elclib_CircleD1(*args):
	return elclib.CircleD1(*args)

@deprecated
def elclib_CircleD2(*args):
	return elclib.CircleD2(*args)

@deprecated
def elclib_CircleD2(*args):
	return elclib.CircleD2(*args)

@deprecated
def elclib_CircleD3(*args):
	return elclib.CircleD3(*args)

@deprecated
def elclib_CircleD3(*args):
	return elclib.CircleD3(*args)

@deprecated
def elclib_CircleDN(*args):
	return elclib.CircleDN(*args)

@deprecated
def elclib_CircleDN(*args):
	return elclib.CircleDN(*args)

@deprecated
def elclib_CircleParameter(*args):
	return elclib.CircleParameter(*args)

@deprecated
def elclib_CircleParameter(*args):
	return elclib.CircleParameter(*args)

@deprecated
def elclib_CircleValue(*args):
	return elclib.CircleValue(*args)

@deprecated
def elclib_CircleValue(*args):
	return elclib.CircleValue(*args)

@deprecated
def elclib_D1(*args):
	return elclib.D1(*args)

@deprecated
def elclib_D1(*args):
	return elclib.D1(*args)

@deprecated
def elclib_D1(*args):
	return elclib.D1(*args)

@deprecated
def elclib_D1(*args):
	return elclib.D1(*args)

@deprecated
def elclib_D1(*args):
	return elclib.D1(*args)

@deprecated
def elclib_D1(*args):
	return elclib.D1(*args)

@deprecated
def elclib_D1(*args):
	return elclib.D1(*args)

@deprecated
def elclib_D1(*args):
	return elclib.D1(*args)

@deprecated
def elclib_D1(*args):
	return elclib.D1(*args)

@deprecated
def elclib_D1(*args):
	return elclib.D1(*args)

@deprecated
def elclib_D2(*args):
	return elclib.D2(*args)

@deprecated
def elclib_D2(*args):
	return elclib.D2(*args)

@deprecated
def elclib_D2(*args):
	return elclib.D2(*args)

@deprecated
def elclib_D2(*args):
	return elclib.D2(*args)

@deprecated
def elclib_D2(*args):
	return elclib.D2(*args)

@deprecated
def elclib_D2(*args):
	return elclib.D2(*args)

@deprecated
def elclib_D2(*args):
	return elclib.D2(*args)

@deprecated
def elclib_D2(*args):
	return elclib.D2(*args)

@deprecated
def elclib_D3(*args):
	return elclib.D3(*args)

@deprecated
def elclib_D3(*args):
	return elclib.D3(*args)

@deprecated
def elclib_D3(*args):
	return elclib.D3(*args)

@deprecated
def elclib_D3(*args):
	return elclib.D3(*args)

@deprecated
def elclib_D3(*args):
	return elclib.D3(*args)

@deprecated
def elclib_D3(*args):
	return elclib.D3(*args)

@deprecated
def elclib_DN(*args):
	return elclib.DN(*args)

@deprecated
def elclib_DN(*args):
	return elclib.DN(*args)

@deprecated
def elclib_DN(*args):
	return elclib.DN(*args)

@deprecated
def elclib_DN(*args):
	return elclib.DN(*args)

@deprecated
def elclib_DN(*args):
	return elclib.DN(*args)

@deprecated
def elclib_DN(*args):
	return elclib.DN(*args)

@deprecated
def elclib_DN(*args):
	return elclib.DN(*args)

@deprecated
def elclib_DN(*args):
	return elclib.DN(*args)

@deprecated
def elclib_DN(*args):
	return elclib.DN(*args)

@deprecated
def elclib_DN(*args):
	return elclib.DN(*args)

@deprecated
def elclib_EllipseD1(*args):
	return elclib.EllipseD1(*args)

@deprecated
def elclib_EllipseD1(*args):
	return elclib.EllipseD1(*args)

@deprecated
def elclib_EllipseD2(*args):
	return elclib.EllipseD2(*args)

@deprecated
def elclib_EllipseD2(*args):
	return elclib.EllipseD2(*args)

@deprecated
def elclib_EllipseD3(*args):
	return elclib.EllipseD3(*args)

@deprecated
def elclib_EllipseD3(*args):
	return elclib.EllipseD3(*args)

@deprecated
def elclib_EllipseDN(*args):
	return elclib.EllipseDN(*args)

@deprecated
def elclib_EllipseDN(*args):
	return elclib.EllipseDN(*args)

@deprecated
def elclib_EllipseParameter(*args):
	return elclib.EllipseParameter(*args)

@deprecated
def elclib_EllipseParameter(*args):
	return elclib.EllipseParameter(*args)

@deprecated
def elclib_EllipseValue(*args):
	return elclib.EllipseValue(*args)

@deprecated
def elclib_EllipseValue(*args):
	return elclib.EllipseValue(*args)

@deprecated
def elclib_HyperbolaD1(*args):
	return elclib.HyperbolaD1(*args)

@deprecated
def elclib_HyperbolaD1(*args):
	return elclib.HyperbolaD1(*args)

@deprecated
def elclib_HyperbolaD2(*args):
	return elclib.HyperbolaD2(*args)

@deprecated
def elclib_HyperbolaD2(*args):
	return elclib.HyperbolaD2(*args)

@deprecated
def elclib_HyperbolaD3(*args):
	return elclib.HyperbolaD3(*args)

@deprecated
def elclib_HyperbolaD3(*args):
	return elclib.HyperbolaD3(*args)

@deprecated
def elclib_HyperbolaDN(*args):
	return elclib.HyperbolaDN(*args)

@deprecated
def elclib_HyperbolaDN(*args):
	return elclib.HyperbolaDN(*args)

@deprecated
def elclib_HyperbolaParameter(*args):
	return elclib.HyperbolaParameter(*args)

@deprecated
def elclib_HyperbolaParameter(*args):
	return elclib.HyperbolaParameter(*args)

@deprecated
def elclib_HyperbolaValue(*args):
	return elclib.HyperbolaValue(*args)

@deprecated
def elclib_HyperbolaValue(*args):
	return elclib.HyperbolaValue(*args)

@deprecated
def elclib_InPeriod(*args):
	return elclib.InPeriod(*args)

@deprecated
def elclib_LineD1(*args):
	return elclib.LineD1(*args)

@deprecated
def elclib_LineD1(*args):
	return elclib.LineD1(*args)

@deprecated
def elclib_LineDN(*args):
	return elclib.LineDN(*args)

@deprecated
def elclib_LineDN(*args):
	return elclib.LineDN(*args)

@deprecated
def elclib_LineParameter(*args):
	return elclib.LineParameter(*args)

@deprecated
def elclib_LineParameter(*args):
	return elclib.LineParameter(*args)

@deprecated
def elclib_LineValue(*args):
	return elclib.LineValue(*args)

@deprecated
def elclib_LineValue(*args):
	return elclib.LineValue(*args)

@deprecated
def elclib_ParabolaD1(*args):
	return elclib.ParabolaD1(*args)

@deprecated
def elclib_ParabolaD1(*args):
	return elclib.ParabolaD1(*args)

@deprecated
def elclib_ParabolaD2(*args):
	return elclib.ParabolaD2(*args)

@deprecated
def elclib_ParabolaD2(*args):
	return elclib.ParabolaD2(*args)

@deprecated
def elclib_ParabolaDN(*args):
	return elclib.ParabolaDN(*args)

@deprecated
def elclib_ParabolaDN(*args):
	return elclib.ParabolaDN(*args)

@deprecated
def elclib_ParabolaParameter(*args):
	return elclib.ParabolaParameter(*args)

@deprecated
def elclib_ParabolaParameter(*args):
	return elclib.ParabolaParameter(*args)

@deprecated
def elclib_ParabolaValue(*args):
	return elclib.ParabolaValue(*args)

@deprecated
def elclib_ParabolaValue(*args):
	return elclib.ParabolaValue(*args)

@deprecated
def elclib_Parameter(*args):
	return elclib.Parameter(*args)

@deprecated
def elclib_Parameter(*args):
	return elclib.Parameter(*args)

@deprecated
def elclib_Parameter(*args):
	return elclib.Parameter(*args)

@deprecated
def elclib_Parameter(*args):
	return elclib.Parameter(*args)

@deprecated
def elclib_Parameter(*args):
	return elclib.Parameter(*args)

@deprecated
def elclib_Parameter(*args):
	return elclib.Parameter(*args)

@deprecated
def elclib_Parameter(*args):
	return elclib.Parameter(*args)

@deprecated
def elclib_Parameter(*args):
	return elclib.Parameter(*args)

@deprecated
def elclib_Parameter(*args):
	return elclib.Parameter(*args)

@deprecated
def elclib_Parameter(*args):
	return elclib.Parameter(*args)

@deprecated
def elclib_To3d(*args):
	return elclib.To3d(*args)

@deprecated
def elclib_To3d(*args):
	return elclib.To3d(*args)

@deprecated
def elclib_To3d(*args):
	return elclib.To3d(*args)

@deprecated
def elclib_To3d(*args):
	return elclib.To3d(*args)

@deprecated
def elclib_To3d(*args):
	return elclib.To3d(*args)

@deprecated
def elclib_To3d(*args):
	return elclib.To3d(*args)

@deprecated
def elclib_To3d(*args):
	return elclib.To3d(*args)

@deprecated
def elclib_To3d(*args):
	return elclib.To3d(*args)

@deprecated
def elclib_To3d(*args):
	return elclib.To3d(*args)

@deprecated
def elclib_To3d(*args):
	return elclib.To3d(*args)

@deprecated
def elclib_Value(*args):
	return elclib.Value(*args)

@deprecated
def elclib_Value(*args):
	return elclib.Value(*args)

@deprecated
def elclib_Value(*args):
	return elclib.Value(*args)

@deprecated
def elclib_Value(*args):
	return elclib.Value(*args)

@deprecated
def elclib_Value(*args):
	return elclib.Value(*args)

@deprecated
def elclib_Value(*args):
	return elclib.Value(*args)

@deprecated
def elclib_Value(*args):
	return elclib.Value(*args)

@deprecated
def elclib_Value(*args):
	return elclib.Value(*args)

@deprecated
def elclib_Value(*args):
	return elclib.Value(*args)

@deprecated
def elclib_Value(*args):
	return elclib.Value(*args)

}
