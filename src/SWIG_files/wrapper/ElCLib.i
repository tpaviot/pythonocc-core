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
%define ELCLIBDOCSTRING
"ElCLib module, see official documentation at
https://dev.opencascade.org/doc/occt-7.9.0/refman/html/package_elclib.html"
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
		/****** md5 signature: 092b4e32b5d8e91aa914ddae2e316ab0 ******/
		%feature("compactdefaultargs") AdjustPeriodic;
		%feature("autodoc", "
Parameters
----------
UFirst: double
ULast: double
Precision: double

Return
-------
U1: double
U2: double

Description
-----------
Adjust U1 and U2 in the parametric range UFirst Ulast of a periodic curve, where ULast - UFirst is its period. To do this, this function: - sets U1 in the range [ UFirst, ULast ] by adding/removing the period to/from the value U1, then - sets U2 in the range [ U1, U1 + period ] by adding/removing the period to/from the value U2. Precision is used to test the equalities.
") AdjustPeriodic;
		static void AdjustPeriodic(const double UFirst, const double ULast, const double Precision, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** ElCLib::CircleD1 ******/
		/****** md5 signature: 010e4036545c831f406320b236ab327b ******/
		%feature("compactdefaultargs") CircleD1;
		%feature("autodoc", "
Parameters
----------
U: double
Pos: gp_Ax2
Radius: double
P: gp_Pnt
V1: gp_Vec

Return
-------
None

Description
-----------
No available documentation.
") CircleD1;
		static void CircleD1(const double U, const gp_Ax2 & Pos, const double Radius, gp_Pnt & P, gp_Vec & V1);

		/****** ElCLib::CircleD1 ******/
		/****** md5 signature: 71f571303481825d8655876c008c1801 ******/
		%feature("compactdefaultargs") CircleD1;
		%feature("autodoc", "
Parameters
----------
U: double
Pos: gp_Ax22d
Radius: double
P: gp_Pnt2d
V1: gp_Vec2d

Return
-------
None

Description
-----------
No available documentation.
") CircleD1;
		static void CircleD1(const double U, const gp_Ax22d & Pos, const double Radius, gp_Pnt2d & P, gp_Vec2d & V1);

		/****** ElCLib::CircleD2 ******/
		/****** md5 signature: cceaf7fb898e5f54dee3d80089821fed ******/
		%feature("compactdefaultargs") CircleD2;
		%feature("autodoc", "
Parameters
----------
U: double
Pos: gp_Ax2
Radius: double
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
		static void CircleD2(const double U, const gp_Ax2 & Pos, const double Radius, gp_Pnt & P, gp_Vec & V1, gp_Vec & V2);

		/****** ElCLib::CircleD2 ******/
		/****** md5 signature: 1ccea5270cf07a4c6c20a1a4be83e456 ******/
		%feature("compactdefaultargs") CircleD2;
		%feature("autodoc", "
Parameters
----------
U: double
Pos: gp_Ax22d
Radius: double
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
		static void CircleD2(const double U, const gp_Ax22d & Pos, const double Radius, gp_Pnt2d & P, gp_Vec2d & V1, gp_Vec2d & V2);

		/****** ElCLib::CircleD3 ******/
		/****** md5 signature: 93416e8fc7d684ee06ca8d0f35c4f287 ******/
		%feature("compactdefaultargs") CircleD3;
		%feature("autodoc", "
Parameters
----------
U: double
Pos: gp_Ax2
Radius: double
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
		static void CircleD3(const double U, const gp_Ax2 & Pos, const double Radius, gp_Pnt & P, gp_Vec & V1, gp_Vec & V2, gp_Vec & V3);

		/****** ElCLib::CircleD3 ******/
		/****** md5 signature: 57dcad300f24b16c78c0984592eca6e3 ******/
		%feature("compactdefaultargs") CircleD3;
		%feature("autodoc", "
Parameters
----------
U: double
Pos: gp_Ax22d
Radius: double
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
		static void CircleD3(const double U, const gp_Ax22d & Pos, const double Radius, gp_Pnt2d & P, gp_Vec2d & V1, gp_Vec2d & V2, gp_Vec2d & V3);

		/****** ElCLib::CircleDN ******/
		/****** md5 signature: 49af4700c2f06d8ab464175f448dfc52 ******/
		%feature("compactdefaultargs") CircleDN;
		%feature("autodoc", "
Parameters
----------
U: double
Pos: gp_Ax2
Radius: double
N: int

Return
-------
gp_Vec

Description
-----------
No available documentation.
") CircleDN;
		static gp_Vec CircleDN(const double U, const gp_Ax2 & Pos, const double Radius, const int N);

		/****** ElCLib::CircleDN ******/
		/****** md5 signature: 5ab8b0bdaa4b64ce7b8b329e5cd39646 ******/
		%feature("compactdefaultargs") CircleDN;
		%feature("autodoc", "
Parameters
----------
U: double
Pos: gp_Ax22d
Radius: double
N: int

Return
-------
gp_Vec2d

Description
-----------
No available documentation.
") CircleDN;
		static gp_Vec2d CircleDN(const double U, const gp_Ax22d & Pos, const double Radius, const int N);

		/****** ElCLib::CircleParameter ******/
		/****** md5 signature: b607b7c1d8325a956d39981282d626db ******/
		%feature("compactdefaultargs") CircleParameter;
		%feature("autodoc", "
Parameters
----------
Pos: gp_Ax2
P: gp_Pnt

Return
-------
double

Description
-----------
No available documentation.
") CircleParameter;
		static double CircleParameter(const gp_Ax2 & Pos, const gp_Pnt & P);

		/****** ElCLib::CircleParameter ******/
		/****** md5 signature: 82a191cb28202a8bc33d7c3a36c89c76 ******/
		%feature("compactdefaultargs") CircleParameter;
		%feature("autodoc", "
Parameters
----------
Pos: gp_Ax22d
P: gp_Pnt2d

Return
-------
double

Description
-----------
Pos is the Axis of the Circle parametrization In the local coordinate system of the circle X (U) = Radius * Cos (U) Y (U) = Radius * Sin (U).
") CircleParameter;
		static double CircleParameter(const gp_Ax22d & Pos, const gp_Pnt2d & P);

		/****** ElCLib::CircleValue ******/
		/****** md5 signature: c6c5643b1d268bd05860c9d396e37f8e ******/
		%feature("compactdefaultargs") CircleValue;
		%feature("autodoc", "
Parameters
----------
U: double
Pos: gp_Ax2
Radius: double

Return
-------
gp_Pnt

Description
-----------
No available documentation.
") CircleValue;
		static gp_Pnt CircleValue(const double U, const gp_Ax2 & Pos, const double Radius);

		/****** ElCLib::CircleValue ******/
		/****** md5 signature: d2d1d6cd291c56d0e5fe05779e35e75f ******/
		%feature("compactdefaultargs") CircleValue;
		%feature("autodoc", "
Parameters
----------
U: double
Pos: gp_Ax22d
Radius: double

Return
-------
gp_Pnt2d

Description
-----------
No available documentation.
") CircleValue;
		static gp_Pnt2d CircleValue(const double U, const gp_Ax22d & Pos, const double Radius);

		/****** ElCLib::D1 ******/
		/****** md5 signature: 7f45247243ec94ac5812fc563c082b7b ******/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "
Parameters
----------
U: double
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
		static void D1(const double U, const gp_Lin & L, gp_Pnt & P, gp_Vec & V1);

		/****** ElCLib::D1 ******/
		/****** md5 signature: c83470d3e8e4b69f546e1cca16d302e0 ******/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "
Parameters
----------
U: double
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
		static void D1(const double U, const gp_Circ & C, gp_Pnt & P, gp_Vec & V1);

		/****** ElCLib::D1 ******/
		/****** md5 signature: 8582e2255a85ccb4d36095cb0875d156 ******/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "
Parameters
----------
U: double
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
		static void D1(const double U, const gp_Elips & E, gp_Pnt & P, gp_Vec & V1);

		/****** ElCLib::D1 ******/
		/****** md5 signature: 8d4ce2a859106fbb9429141a7b8ec664 ******/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "
Parameters
----------
U: double
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
		static void D1(const double U, const gp_Hypr & H, gp_Pnt & P, gp_Vec & V1);

		/****** ElCLib::D1 ******/
		/****** md5 signature: 37305de77b4d2e7b63ab046a2c80ed3e ******/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "
Parameters
----------
U: double
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
		static void D1(const double U, const gp_Parab & Prb, gp_Pnt & P, gp_Vec & V1);

		/****** ElCLib::D1 ******/
		/****** md5 signature: 2f8fbd819a7ea2551941ca6f1db31526 ******/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "
Parameters
----------
U: double
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
		static void D1(const double U, const gp_Lin2d & L, gp_Pnt2d & P, gp_Vec2d & V1);

		/****** ElCLib::D1 ******/
		/****** md5 signature: ff0a96b26c62d8964584e40edcaea1b3 ******/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "
Parameters
----------
U: double
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
		static void D1(const double U, const gp_Circ2d & C, gp_Pnt2d & P, gp_Vec2d & V1);

		/****** ElCLib::D1 ******/
		/****** md5 signature: 0cca542da2c5247ffe00fff437d4b536 ******/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "
Parameters
----------
U: double
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
		static void D1(const double U, const gp_Elips2d & E, gp_Pnt2d & P, gp_Vec2d & V1);

		/****** ElCLib::D1 ******/
		/****** md5 signature: 18744e67200dc534e1d8086deb717449 ******/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "
Parameters
----------
U: double
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
		static void D1(const double U, const gp_Hypr2d & H, gp_Pnt2d & P, gp_Vec2d & V1);

		/****** ElCLib::D1 ******/
		/****** md5 signature: 790c0dce272400feec5fa30299db68b3 ******/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "
Parameters
----------
U: double
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
		static void D1(const double U, const gp_Parab2d & Prb, gp_Pnt2d & P, gp_Vec2d & V1);

		/****** ElCLib::D2 ******/
		/****** md5 signature: f15fc8ff2128e9c2d0420e90dd47de3b ******/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "
Parameters
----------
U: double
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
		static void D2(const double U, const gp_Circ & C, gp_Pnt & P, gp_Vec & V1, gp_Vec & V2);

		/****** ElCLib::D2 ******/
		/****** md5 signature: 9eb181df78517c20c9f2f8e52d7da6e0 ******/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "
Parameters
----------
U: double
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
		static void D2(const double U, const gp_Elips & E, gp_Pnt & P, gp_Vec & V1, gp_Vec & V2);

		/****** ElCLib::D2 ******/
		/****** md5 signature: c7142eee93d67f7bd09f95195cdad39a ******/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "
Parameters
----------
U: double
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
		static void D2(const double U, const gp_Hypr & H, gp_Pnt & P, gp_Vec & V1, gp_Vec & V2);

		/****** ElCLib::D2 ******/
		/****** md5 signature: 9eb777097c64a1d5d60d3c931f70663f ******/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "
Parameters
----------
U: double
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
		static void D2(const double U, const gp_Parab & Prb, gp_Pnt & P, gp_Vec & V1, gp_Vec & V2);

		/****** ElCLib::D2 ******/
		/****** md5 signature: 636c2dc6ef527e04d46d4e1a778fa073 ******/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "
Parameters
----------
U: double
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
		static void D2(const double U, const gp_Circ2d & C, gp_Pnt2d & P, gp_Vec2d & V1, gp_Vec2d & V2);

		/****** ElCLib::D2 ******/
		/****** md5 signature: 12c86134920de4b34dbea493329dba92 ******/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "
Parameters
----------
U: double
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
		static void D2(const double U, const gp_Elips2d & E, gp_Pnt2d & P, gp_Vec2d & V1, gp_Vec2d & V2);

		/****** ElCLib::D2 ******/
		/****** md5 signature: b6e62b3f53fba17592700061970306aa ******/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "
Parameters
----------
U: double
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
		static void D2(const double U, const gp_Hypr2d & H, gp_Pnt2d & P, gp_Vec2d & V1, gp_Vec2d & V2);

		/****** ElCLib::D2 ******/
		/****** md5 signature: 2deab0c89b85d8160841478042e5c7b8 ******/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "
Parameters
----------
U: double
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
		static void D2(const double U, const gp_Parab2d & Prb, gp_Pnt2d & P, gp_Vec2d & V1, gp_Vec2d & V2);

		/****** ElCLib::D3 ******/
		/****** md5 signature: 82897212ad6b945770bf4fcb3f8164e7 ******/
		%feature("compactdefaultargs") D3;
		%feature("autodoc", "
Parameters
----------
U: double
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
		static void D3(const double U, const gp_Circ & C, gp_Pnt & P, gp_Vec & V1, gp_Vec & V2, gp_Vec & V3);

		/****** ElCLib::D3 ******/
		/****** md5 signature: 16363302676f20cf8838da117b40f90c ******/
		%feature("compactdefaultargs") D3;
		%feature("autodoc", "
Parameters
----------
U: double
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
		static void D3(const double U, const gp_Elips & E, gp_Pnt & P, gp_Vec & V1, gp_Vec & V2, gp_Vec & V3);

		/****** ElCLib::D3 ******/
		/****** md5 signature: 9ded4bb4847f1b036d2f1a95fb9c12ea ******/
		%feature("compactdefaultargs") D3;
		%feature("autodoc", "
Parameters
----------
U: double
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
		static void D3(const double U, const gp_Hypr & H, gp_Pnt & P, gp_Vec & V1, gp_Vec & V2, gp_Vec & V3);

		/****** ElCLib::D3 ******/
		/****** md5 signature: 572f3f2e0eefd6f87354972b92e5474d ******/
		%feature("compactdefaultargs") D3;
		%feature("autodoc", "
Parameters
----------
U: double
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
		static void D3(const double U, const gp_Circ2d & C, gp_Pnt2d & P, gp_Vec2d & V1, gp_Vec2d & V2, gp_Vec2d & V3);

		/****** ElCLib::D3 ******/
		/****** md5 signature: efe6988e6f5cb83354e35bc5d2b65637 ******/
		%feature("compactdefaultargs") D3;
		%feature("autodoc", "
Parameters
----------
U: double
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
		static void D3(const double U, const gp_Elips2d & E, gp_Pnt2d & P, gp_Vec2d & V1, gp_Vec2d & V2, gp_Vec2d & V3);

		/****** ElCLib::D3 ******/
		/****** md5 signature: c03c372272dbfabc659071ada2903391 ******/
		%feature("compactdefaultargs") D3;
		%feature("autodoc", "
Parameters
----------
U: double
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
		static void D3(const double U, const gp_Hypr2d & H, gp_Pnt2d & P, gp_Vec2d & V1, gp_Vec2d & V2, gp_Vec2d & V3);

		/****** ElCLib::DN ******/
		/****** md5 signature: 32b459e0fef3f55c51aa79bea09867db ******/
		%feature("compactdefaultargs") DN;
		%feature("autodoc", "
Parameters
----------
U: double
L: gp_Lin
N: int

Return
-------
gp_Vec

Description
-----------
For elementary curves (lines, circles and conics) from the gp package, computes the vector corresponding to the Nth derivative at the point of parameter U. The result is either: - a gp_Vec vector for a curve in 3D space, or - a gp_Vec2d vector for a curve in 2D space. In the following functions N is the order of derivation and should be greater than 0.
") DN;
		static gp_Vec DN(const double U, const gp_Lin & L, const int N);

		/****** ElCLib::DN ******/
		/****** md5 signature: eae3bc48eef2b310d2ff5279ba777009 ******/
		%feature("compactdefaultargs") DN;
		%feature("autodoc", "
Parameters
----------
U: double
C: gp_Circ
N: int

Return
-------
gp_Vec

Description
-----------
No available documentation.
") DN;
		static gp_Vec DN(const double U, const gp_Circ & C, const int N);

		/****** ElCLib::DN ******/
		/****** md5 signature: 4a65a619583a1592042457e292b41903 ******/
		%feature("compactdefaultargs") DN;
		%feature("autodoc", "
Parameters
----------
U: double
E: gp_Elips
N: int

Return
-------
gp_Vec

Description
-----------
No available documentation.
") DN;
		static gp_Vec DN(const double U, const gp_Elips & E, const int N);

		/****** ElCLib::DN ******/
		/****** md5 signature: 22152ba15446ea58c262cdfa04b83211 ******/
		%feature("compactdefaultargs") DN;
		%feature("autodoc", "
Parameters
----------
U: double
H: gp_Hypr
N: int

Return
-------
gp_Vec

Description
-----------
No available documentation.
") DN;
		static gp_Vec DN(const double U, const gp_Hypr & H, const int N);

		/****** ElCLib::DN ******/
		/****** md5 signature: 7fcfe54e6a69431b4ec226ccebb7921d ******/
		%feature("compactdefaultargs") DN;
		%feature("autodoc", "
Parameters
----------
U: double
Prb: gp_Parab
N: int

Return
-------
gp_Vec

Description
-----------
No available documentation.
") DN;
		static gp_Vec DN(const double U, const gp_Parab & Prb, const int N);

		/****** ElCLib::DN ******/
		/****** md5 signature: 87dd1880f0e88c8f47769277b6516993 ******/
		%feature("compactdefaultargs") DN;
		%feature("autodoc", "
Parameters
----------
U: double
L: gp_Lin2d
N: int

Return
-------
gp_Vec2d

Description
-----------
No available documentation.
") DN;
		static gp_Vec2d DN(const double U, const gp_Lin2d & L, const int N);

		/****** ElCLib::DN ******/
		/****** md5 signature: 577e3e079ac32eb5a22abc3c7da5efb3 ******/
		%feature("compactdefaultargs") DN;
		%feature("autodoc", "
Parameters
----------
U: double
C: gp_Circ2d
N: int

Return
-------
gp_Vec2d

Description
-----------
No available documentation.
") DN;
		static gp_Vec2d DN(const double U, const gp_Circ2d & C, const int N);

		/****** ElCLib::DN ******/
		/****** md5 signature: 628e233f8e2b8e7ad7715ddab5a21d4c ******/
		%feature("compactdefaultargs") DN;
		%feature("autodoc", "
Parameters
----------
U: double
E: gp_Elips2d
N: int

Return
-------
gp_Vec2d

Description
-----------
No available documentation.
") DN;
		static gp_Vec2d DN(const double U, const gp_Elips2d & E, const int N);

		/****** ElCLib::DN ******/
		/****** md5 signature: e3533df59f8de8e0f0ea6740d77abea3 ******/
		%feature("compactdefaultargs") DN;
		%feature("autodoc", "
Parameters
----------
U: double
H: gp_Hypr2d
N: int

Return
-------
gp_Vec2d

Description
-----------
No available documentation.
") DN;
		static gp_Vec2d DN(const double U, const gp_Hypr2d & H, const int N);

		/****** ElCLib::DN ******/
		/****** md5 signature: f67061f7c6aff9a35025605810563f22 ******/
		%feature("compactdefaultargs") DN;
		%feature("autodoc", "
Parameters
----------
U: double
Prb: gp_Parab2d
N: int

Return
-------
gp_Vec2d

Description
-----------
No available documentation.
") DN;
		static gp_Vec2d DN(const double U, const gp_Parab2d & Prb, const int N);

		/****** ElCLib::EllipseD1 ******/
		/****** md5 signature: f9b072c7e20897087dc1b13a72709fa1 ******/
		%feature("compactdefaultargs") EllipseD1;
		%feature("autodoc", "
Parameters
----------
U: double
Pos: gp_Ax2
MajorRadius: double
MinorRadius: double
P: gp_Pnt
V1: gp_Vec

Return
-------
None

Description
-----------
No available documentation.
") EllipseD1;
		static void EllipseD1(const double U, const gp_Ax2 & Pos, const double MajorRadius, const double MinorRadius, gp_Pnt & P, gp_Vec & V1);

		/****** ElCLib::EllipseD1 ******/
		/****** md5 signature: 7f6385340a653eedda8ff7381ded6fd0 ******/
		%feature("compactdefaultargs") EllipseD1;
		%feature("autodoc", "
Parameters
----------
U: double
Pos: gp_Ax22d
MajorRadius: double
MinorRadius: double
P: gp_Pnt2d
V1: gp_Vec2d

Return
-------
None

Description
-----------
No available documentation.
") EllipseD1;
		static void EllipseD1(const double U, const gp_Ax22d & Pos, const double MajorRadius, const double MinorRadius, gp_Pnt2d & P, gp_Vec2d & V1);

		/****** ElCLib::EllipseD2 ******/
		/****** md5 signature: 869f0ebef242417f02f902f141417310 ******/
		%feature("compactdefaultargs") EllipseD2;
		%feature("autodoc", "
Parameters
----------
U: double
Pos: gp_Ax2
MajorRadius: double
MinorRadius: double
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
		static void EllipseD2(const double U, const gp_Ax2 & Pos, const double MajorRadius, const double MinorRadius, gp_Pnt & P, gp_Vec & V1, gp_Vec & V2);

		/****** ElCLib::EllipseD2 ******/
		/****** md5 signature: 7448f770ca3471838e90cdf3416cb227 ******/
		%feature("compactdefaultargs") EllipseD2;
		%feature("autodoc", "
Parameters
----------
U: double
Pos: gp_Ax22d
MajorRadius: double
MinorRadius: double
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
		static void EllipseD2(const double U, const gp_Ax22d & Pos, const double MajorRadius, const double MinorRadius, gp_Pnt2d & P, gp_Vec2d & V1, gp_Vec2d & V2);

		/****** ElCLib::EllipseD3 ******/
		/****** md5 signature: 09e25f02563c28c964fcdb303cbbd2f9 ******/
		%feature("compactdefaultargs") EllipseD3;
		%feature("autodoc", "
Parameters
----------
U: double
Pos: gp_Ax2
MajorRadius: double
MinorRadius: double
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
		static void EllipseD3(const double U, const gp_Ax2 & Pos, const double MajorRadius, const double MinorRadius, gp_Pnt & P, gp_Vec & V1, gp_Vec & V2, gp_Vec & V3);

		/****** ElCLib::EllipseD3 ******/
		/****** md5 signature: a579403cfbdc42de90655f1640388d2f ******/
		%feature("compactdefaultargs") EllipseD3;
		%feature("autodoc", "
Parameters
----------
U: double
Pos: gp_Ax22d
MajorRadius: double
MinorRadius: double
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
		static void EllipseD3(const double U, const gp_Ax22d & Pos, const double MajorRadius, const double MinorRadius, gp_Pnt2d & P, gp_Vec2d & V1, gp_Vec2d & V2, gp_Vec2d & V3);

		/****** ElCLib::EllipseDN ******/
		/****** md5 signature: dc6951856bce90e1a6e48fe3a358d546 ******/
		%feature("compactdefaultargs") EllipseDN;
		%feature("autodoc", "
Parameters
----------
U: double
Pos: gp_Ax2
MajorRadius: double
MinorRadius: double
N: int

Return
-------
gp_Vec

Description
-----------
No available documentation.
") EllipseDN;
		static gp_Vec EllipseDN(const double U, const gp_Ax2 & Pos, const double MajorRadius, const double MinorRadius, const int N);

		/****** ElCLib::EllipseDN ******/
		/****** md5 signature: 0baf40d3108c9595d0312daa553e28af ******/
		%feature("compactdefaultargs") EllipseDN;
		%feature("autodoc", "
Parameters
----------
U: double
Pos: gp_Ax22d
MajorRadius: double
MinorRadius: double
N: int

Return
-------
gp_Vec2d

Description
-----------
No available documentation.
") EllipseDN;
		static gp_Vec2d EllipseDN(const double U, const gp_Ax22d & Pos, const double MajorRadius, const double MinorRadius, const int N);

		/****** ElCLib::EllipseParameter ******/
		/****** md5 signature: 7b7965108e2da776fe34c915d7184c02 ******/
		%feature("compactdefaultargs") EllipseParameter;
		%feature("autodoc", "
Parameters
----------
Pos: gp_Ax2
MajorRadius: double
MinorRadius: double
P: gp_Pnt

Return
-------
double

Description
-----------
No available documentation.
") EllipseParameter;
		static double EllipseParameter(const gp_Ax2 & Pos, const double MajorRadius, const double MinorRadius, const gp_Pnt & P);

		/****** ElCLib::EllipseParameter ******/
		/****** md5 signature: 97160f3d5a9a23b3dd3c7ef3592d436c ******/
		%feature("compactdefaultargs") EllipseParameter;
		%feature("autodoc", "
Parameters
----------
Pos: gp_Ax22d
MajorRadius: double
MinorRadius: double
P: gp_Pnt2d

Return
-------
double

Description
-----------
Pos is the Axis of the Ellipse parametrization In the local coordinate system of the Ellipse X (U) = MajorRadius * Cos (U) Y (U) = MinorRadius * Sin (U).
") EllipseParameter;
		static double EllipseParameter(const gp_Ax22d & Pos, const double MajorRadius, const double MinorRadius, const gp_Pnt2d & P);

		/****** ElCLib::EllipseValue ******/
		/****** md5 signature: 1dc43c05caf59930c0f35e90d141badb ******/
		%feature("compactdefaultargs") EllipseValue;
		%feature("autodoc", "
Parameters
----------
U: double
Pos: gp_Ax2
MajorRadius: double
MinorRadius: double

Return
-------
gp_Pnt

Description
-----------
No available documentation.
") EllipseValue;
		static gp_Pnt EllipseValue(const double U, const gp_Ax2 & Pos, const double MajorRadius, const double MinorRadius);

		/****** ElCLib::EllipseValue ******/
		/****** md5 signature: 4c105953c7f48ef36bb79f85d4688370 ******/
		%feature("compactdefaultargs") EllipseValue;
		%feature("autodoc", "
Parameters
----------
U: double
Pos: gp_Ax22d
MajorRadius: double
MinorRadius: double

Return
-------
gp_Pnt2d

Description
-----------
No available documentation.
") EllipseValue;
		static gp_Pnt2d EllipseValue(const double U, const gp_Ax22d & Pos, const double MajorRadius, const double MinorRadius);

		/****** ElCLib::HyperbolaD1 ******/
		/****** md5 signature: 6ec07764ff9d7de95ced85f0ca95c4ce ******/
		%feature("compactdefaultargs") HyperbolaD1;
		%feature("autodoc", "
Parameters
----------
U: double
Pos: gp_Ax2
MajorRadius: double
MinorRadius: double
P: gp_Pnt
V1: gp_Vec

Return
-------
None

Description
-----------
No available documentation.
") HyperbolaD1;
		static void HyperbolaD1(const double U, const gp_Ax2 & Pos, const double MajorRadius, const double MinorRadius, gp_Pnt & P, gp_Vec & V1);

		/****** ElCLib::HyperbolaD1 ******/
		/****** md5 signature: a5e070dbfc43f40267458a4f515dc763 ******/
		%feature("compactdefaultargs") HyperbolaD1;
		%feature("autodoc", "
Parameters
----------
U: double
Pos: gp_Ax22d
MajorRadius: double
MinorRadius: double
P: gp_Pnt2d
V1: gp_Vec2d

Return
-------
None

Description
-----------
No available documentation.
") HyperbolaD1;
		static void HyperbolaD1(const double U, const gp_Ax22d & Pos, const double MajorRadius, const double MinorRadius, gp_Pnt2d & P, gp_Vec2d & V1);

		/****** ElCLib::HyperbolaD2 ******/
		/****** md5 signature: d1929f8ee4b6922e55e1c533448e31b6 ******/
		%feature("compactdefaultargs") HyperbolaD2;
		%feature("autodoc", "
Parameters
----------
U: double
Pos: gp_Ax2
MajorRadius: double
MinorRadius: double
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
		static void HyperbolaD2(const double U, const gp_Ax2 & Pos, const double MajorRadius, const double MinorRadius, gp_Pnt & P, gp_Vec & V1, gp_Vec & V2);

		/****** ElCLib::HyperbolaD2 ******/
		/****** md5 signature: d83c5cd3d847b3732058456cb09ee383 ******/
		%feature("compactdefaultargs") HyperbolaD2;
		%feature("autodoc", "
Parameters
----------
U: double
Pos: gp_Ax22d
MajorRadius: double
MinorRadius: double
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
		static void HyperbolaD2(const double U, const gp_Ax22d & Pos, const double MajorRadius, const double MinorRadius, gp_Pnt2d & P, gp_Vec2d & V1, gp_Vec2d & V2);

		/****** ElCLib::HyperbolaD3 ******/
		/****** md5 signature: f77b7980d52d271d23af6851f73f6afa ******/
		%feature("compactdefaultargs") HyperbolaD3;
		%feature("autodoc", "
Parameters
----------
U: double
Pos: gp_Ax2
MajorRadius: double
MinorRadius: double
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
		static void HyperbolaD3(const double U, const gp_Ax2 & Pos, const double MajorRadius, const double MinorRadius, gp_Pnt & P, gp_Vec & V1, gp_Vec & V2, gp_Vec & V3);

		/****** ElCLib::HyperbolaD3 ******/
		/****** md5 signature: 799c0e4de1918b3091bbb79b22092338 ******/
		%feature("compactdefaultargs") HyperbolaD3;
		%feature("autodoc", "
Parameters
----------
U: double
Pos: gp_Ax22d
MajorRadius: double
MinorRadius: double
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
		static void HyperbolaD3(const double U, const gp_Ax22d & Pos, const double MajorRadius, const double MinorRadius, gp_Pnt2d & P, gp_Vec2d & V1, gp_Vec2d & V2, gp_Vec2d & V3);

		/****** ElCLib::HyperbolaDN ******/
		/****** md5 signature: fa66133012dcf1bfa94529dc58306ddd ******/
		%feature("compactdefaultargs") HyperbolaDN;
		%feature("autodoc", "
Parameters
----------
U: double
Pos: gp_Ax2
MajorRadius: double
MinorRadius: double
N: int

Return
-------
gp_Vec

Description
-----------
No available documentation.
") HyperbolaDN;
		static gp_Vec HyperbolaDN(const double U, const gp_Ax2 & Pos, const double MajorRadius, const double MinorRadius, const int N);

		/****** ElCLib::HyperbolaDN ******/
		/****** md5 signature: 7cfa2e99b8e579e0b0c08669805f09f3 ******/
		%feature("compactdefaultargs") HyperbolaDN;
		%feature("autodoc", "
Parameters
----------
U: double
Pos: gp_Ax22d
MajorRadius: double
MinorRadius: double
N: int

Return
-------
gp_Vec2d

Description
-----------
No available documentation.
") HyperbolaDN;
		static gp_Vec2d HyperbolaDN(const double U, const gp_Ax22d & Pos, const double MajorRadius, const double MinorRadius, const int N);

		/****** ElCLib::HyperbolaParameter ******/
		/****** md5 signature: ee562dce5ed79862f0db91ed22435326 ******/
		%feature("compactdefaultargs") HyperbolaParameter;
		%feature("autodoc", "
Parameters
----------
Pos: gp_Ax2
MajorRadius: double
MinorRadius: double
P: gp_Pnt

Return
-------
double

Description
-----------
No available documentation.
") HyperbolaParameter;
		static double HyperbolaParameter(const gp_Ax2 & Pos, const double MajorRadius, const double MinorRadius, const gp_Pnt & P);

		/****** ElCLib::HyperbolaParameter ******/
		/****** md5 signature: 67e024504c059438e51990989196fcb5 ******/
		%feature("compactdefaultargs") HyperbolaParameter;
		%feature("autodoc", "
Parameters
----------
Pos: gp_Ax22d
MajorRadius: double
MinorRadius: double
P: gp_Pnt2d

Return
-------
double

Description
-----------
Pos is the Axis of the Hyperbola parametrization In the local coordinate system of the Hyperbola X (U) = MajorRadius * Ch (U) Y (U) = MinorRadius * Sh (U).
") HyperbolaParameter;
		static double HyperbolaParameter(const gp_Ax22d & Pos, const double MajorRadius, const double MinorRadius, const gp_Pnt2d & P);

		/****** ElCLib::HyperbolaValue ******/
		/****** md5 signature: eca7b42c5ac036cef50ddd3926837345 ******/
		%feature("compactdefaultargs") HyperbolaValue;
		%feature("autodoc", "
Parameters
----------
U: double
Pos: gp_Ax2
MajorRadius: double
MinorRadius: double

Return
-------
gp_Pnt

Description
-----------
No available documentation.
") HyperbolaValue;
		static gp_Pnt HyperbolaValue(const double U, const gp_Ax2 & Pos, const double MajorRadius, const double MinorRadius);

		/****** ElCLib::HyperbolaValue ******/
		/****** md5 signature: f70d9022c15e774314ce7472f1a34f60 ******/
		%feature("compactdefaultargs") HyperbolaValue;
		%feature("autodoc", "
Parameters
----------
U: double
Pos: gp_Ax22d
MajorRadius: double
MinorRadius: double

Return
-------
gp_Pnt2d

Description
-----------
No available documentation.
") HyperbolaValue;
		static gp_Pnt2d HyperbolaValue(const double U, const gp_Ax22d & Pos, const double MajorRadius, const double MinorRadius);

		/****** ElCLib::InPeriod ******/
		/****** md5 signature: 156815e0463b571c74fa9ce5815b9d9b ******/
		%feature("compactdefaultargs") InPeriod;
		%feature("autodoc", "
Parameters
----------
U: double
UFirst: double
ULast: double

Return
-------
double

Description
-----------
Return a value in the range <UFirst, ULast> by adding or removing the period <ULast - UFirst> to <U>. ATTENTION!!! It is expected but not checked that (ULast > UFirst).
") InPeriod;
		static double InPeriod(const double U, const double UFirst, const double ULast);

		/****** ElCLib::LineD1 ******/
		/****** md5 signature: 935a349438b52068d3df30b8bd93082c ******/
		%feature("compactdefaultargs") LineD1;
		%feature("autodoc", "
Parameters
----------
U: double
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
		static void LineD1(const double U, const gp_Ax1 & Pos, gp_Pnt & P, gp_Vec & V1);

		/****** ElCLib::LineD1 ******/
		/****** md5 signature: a108bd8f057236aa490a566097116f88 ******/
		%feature("compactdefaultargs") LineD1;
		%feature("autodoc", "
Parameters
----------
U: double
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
		static void LineD1(const double U, const gp_Ax2d & Pos, gp_Pnt2d & P, gp_Vec2d & V1);

		/****** ElCLib::LineDN ******/
		/****** md5 signature: 575669a098d1aa92fe7d20103dea0487 ******/
		%feature("compactdefaultargs") LineDN;
		%feature("autodoc", "
Parameters
----------
U: double
Pos: gp_Ax1
N: int

Return
-------
gp_Vec

Description
-----------
In the following functions N is the order of derivation and should be greater than 0.
") LineDN;
		static gp_Vec LineDN(const double U, const gp_Ax1 & Pos, const int N);

		/****** ElCLib::LineDN ******/
		/****** md5 signature: 63864729b40810549b4758534eb5d408 ******/
		%feature("compactdefaultargs") LineDN;
		%feature("autodoc", "
Parameters
----------
U: double
Pos: gp_Ax2d
N: int

Return
-------
gp_Vec2d

Description
-----------
No available documentation.
") LineDN;
		static gp_Vec2d LineDN(const double U, const gp_Ax2d & Pos, const int N);

		/****** ElCLib::LineParameter ******/
		/****** md5 signature: 342830d9aa982b09554bdd58eb2b0598 ******/
		%feature("compactdefaultargs") LineParameter;
		%feature("autodoc", "
Parameters
----------
Pos: gp_Ax1
P: gp_Pnt

Return
-------
double

Description
-----------
No available documentation.
") LineParameter;
		static double LineParameter(const gp_Ax1 & Pos, const gp_Pnt & P);

		/****** ElCLib::LineParameter ******/
		/****** md5 signature: 3219d0902f120f2cd4ed37b23c0868d5 ******/
		%feature("compactdefaultargs") LineParameter;
		%feature("autodoc", "
Parameters
----------
Pos: gp_Ax2d
P: gp_Pnt2d

Return
-------
double

Description
-----------
parametrization P (U) = L.Location() + U * L.Direction().
") LineParameter;
		static double LineParameter(const gp_Ax2d & Pos, const gp_Pnt2d & P);

		/****** ElCLib::LineValue ******/
		/****** md5 signature: 890eb5810e1d76a4a35c3a9d1fb98fce ******/
		%feature("compactdefaultargs") LineValue;
		%feature("autodoc", "
Parameters
----------
U: double
Pos: gp_Ax1

Return
-------
gp_Pnt

Description
-----------
Curve evaluation The following basis functions compute the derivatives on elementary curves defined by their geometric characteristics. These functions can be called without constructing a conic from package gp. They are called by the previous functions. Example: A circle is defined by its position and its radius.
") LineValue;
		static gp_Pnt LineValue(const double U, const gp_Ax1 & Pos);

		/****** ElCLib::LineValue ******/
		/****** md5 signature: b2d0246dee1bdca2ad9fd5570e1a947a ******/
		%feature("compactdefaultargs") LineValue;
		%feature("autodoc", "
Parameters
----------
U: double
Pos: gp_Ax2d

Return
-------
gp_Pnt2d

Description
-----------
No available documentation.
") LineValue;
		static gp_Pnt2d LineValue(const double U, const gp_Ax2d & Pos);

		/****** ElCLib::ParabolaD1 ******/
		/****** md5 signature: 1d057c5c1b0f0569113d33b538907856 ******/
		%feature("compactdefaultargs") ParabolaD1;
		%feature("autodoc", "
Parameters
----------
U: double
Pos: gp_Ax2
Focal: double
P: gp_Pnt
V1: gp_Vec

Return
-------
None

Description
-----------
No available documentation.
") ParabolaD1;
		static void ParabolaD1(const double U, const gp_Ax2 & Pos, const double Focal, gp_Pnt & P, gp_Vec & V1);

		/****** ElCLib::ParabolaD1 ******/
		/****** md5 signature: 1226ba7150e46ac03b981a3b37025385 ******/
		%feature("compactdefaultargs") ParabolaD1;
		%feature("autodoc", "
Parameters
----------
U: double
Pos: gp_Ax22d
Focal: double
P: gp_Pnt2d
V1: gp_Vec2d

Return
-------
None

Description
-----------
No available documentation.
") ParabolaD1;
		static void ParabolaD1(const double U, const gp_Ax22d & Pos, const double Focal, gp_Pnt2d & P, gp_Vec2d & V1);

		/****** ElCLib::ParabolaD2 ******/
		/****** md5 signature: c87a8a076bb36a8b983f0caf54bb2b2d ******/
		%feature("compactdefaultargs") ParabolaD2;
		%feature("autodoc", "
Parameters
----------
U: double
Pos: gp_Ax2
Focal: double
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
		static void ParabolaD2(const double U, const gp_Ax2 & Pos, const double Focal, gp_Pnt & P, gp_Vec & V1, gp_Vec & V2);

		/****** ElCLib::ParabolaD2 ******/
		/****** md5 signature: 1942f26f01b492f0bf1697af1fdd3e05 ******/
		%feature("compactdefaultargs") ParabolaD2;
		%feature("autodoc", "
Parameters
----------
U: double
Pos: gp_Ax22d
Focal: double
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
		static void ParabolaD2(const double U, const gp_Ax22d & Pos, const double Focal, gp_Pnt2d & P, gp_Vec2d & V1, gp_Vec2d & V2);

		/****** ElCLib::ParabolaDN ******/
		/****** md5 signature: 8ea84efba483a7aa30fa4d3de6a7d250 ******/
		%feature("compactdefaultargs") ParabolaDN;
		%feature("autodoc", "
Parameters
----------
U: double
Pos: gp_Ax2
Focal: double
N: int

Return
-------
gp_Vec

Description
-----------
No available documentation.
") ParabolaDN;
		static gp_Vec ParabolaDN(const double U, const gp_Ax2 & Pos, const double Focal, const int N);

		/****** ElCLib::ParabolaDN ******/
		/****** md5 signature: 032b1fa27c3d39247625e8529b085707 ******/
		%feature("compactdefaultargs") ParabolaDN;
		%feature("autodoc", "
Parameters
----------
U: double
Pos: gp_Ax22d
Focal: double
N: int

Return
-------
gp_Vec2d

Description
-----------
The following functions compute the parametric value corresponding to a given point on a elementary curve. The point should be on the curve.
") ParabolaDN;
		static gp_Vec2d ParabolaDN(const double U, const gp_Ax22d & Pos, const double Focal, const int N);

		/****** ElCLib::ParabolaParameter ******/
		/****** md5 signature: 7f4b3418db4d9a7025b2f209132d8610 ******/
		%feature("compactdefaultargs") ParabolaParameter;
		%feature("autodoc", "
Parameters
----------
Pos: gp_Ax2
P: gp_Pnt

Return
-------
double

Description
-----------
No available documentation.
") ParabolaParameter;
		static double ParabolaParameter(const gp_Ax2 & Pos, const gp_Pnt & P);

		/****** ElCLib::ParabolaParameter ******/
		/****** md5 signature: 94cc6940d47ed52c73f8bdaf871f5acb ******/
		%feature("compactdefaultargs") ParabolaParameter;
		%feature("autodoc", "
Parameters
----------
Pos: gp_Ax22d
P: gp_Pnt2d

Return
-------
double

Description
-----------
Pos is the mirror axis of the parabola parametrization In the local coordinate system of the parabola Y**2 = (2*P) * X where P is the distance between the focus and the directrix. The following functions build a 3d curve from a 2d curve at a given position defined with an Ax2.
") ParabolaParameter;
		static double ParabolaParameter(const gp_Ax22d & Pos, const gp_Pnt2d & P);

		/****** ElCLib::ParabolaValue ******/
		/****** md5 signature: 904d01a39c8d766cbfc735b8aea3a0d8 ******/
		%feature("compactdefaultargs") ParabolaValue;
		%feature("autodoc", "
Parameters
----------
U: double
Pos: gp_Ax2
Focal: double

Return
-------
gp_Pnt

Description
-----------
No available documentation.
") ParabolaValue;
		static gp_Pnt ParabolaValue(const double U, const gp_Ax2 & Pos, const double Focal);

		/****** ElCLib::ParabolaValue ******/
		/****** md5 signature: 3de15e1bec57487d27a1d4fe000548bf ******/
		%feature("compactdefaultargs") ParabolaValue;
		%feature("autodoc", "
Parameters
----------
U: double
Pos: gp_Ax22d
Focal: double

Return
-------
gp_Pnt2d

Description
-----------
No available documentation.
") ParabolaValue;
		static gp_Pnt2d ParabolaValue(const double U, const gp_Ax22d & Pos, const double Focal);

		/****** ElCLib::Parameter ******/
		/****** md5 signature: 50f7487c9b5d892c71b135b0dfc385da ******/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "
Parameters
----------
L: gp_Lin
P: gp_Pnt

Return
-------
double

Description
-----------
Computes the parameter value of the point P on the given curve. Note: In its local coordinate system, the parametric equation of the curve is given by the following: - for the line L: P(U) = Po + U*Vo where Po is the origin and Vo the unit vector of its positioning axis. - for the circle C: X(U) = Radius*std::cos(U), Y(U) = Radius*Sin(U) - for the ellipse E: X(U) = MajorRadius*std::cos(U). Y(U) = MinorRadius*Sin(U) - for the hyperbola H: X(U) = MajorRadius*Ch(U), Y(U) = MinorRadius*Sh(U) - for the parabola Prb: X(U) = U**2 / (2*p) Y(U) = U where p is the distance between the focus and the directrix. Warning The point P must be on the curve. These functions are not protected, however, and if point P is not on the curve, an exception may be raised.
") Parameter;
		static double Parameter(const gp_Lin & L, const gp_Pnt & P);

		/****** ElCLib::Parameter ******/
		/****** md5 signature: e305f547ac2ccaeb8ec3784be658d2da ******/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "
Parameters
----------
L: gp_Lin2d
P: gp_Pnt2d

Return
-------
double

Description
-----------
parametrization P (U) = L.Location() + U * L.Direction().
") Parameter;
		static double Parameter(const gp_Lin2d & L, const gp_Pnt2d & P);

		/****** ElCLib::Parameter ******/
		/****** md5 signature: cf28408eb5ccb916005d371dcf25eeda ******/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "
Parameters
----------
C: gp_Circ
P: gp_Pnt

Return
-------
double

Description
-----------
No available documentation.
") Parameter;
		static double Parameter(const gp_Circ & C, const gp_Pnt & P);

		/****** ElCLib::Parameter ******/
		/****** md5 signature: 5f12ec07f0555c4709b61f751227abd7 ******/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "
Parameters
----------
C: gp_Circ2d
P: gp_Pnt2d

Return
-------
double

Description
-----------
parametrization In the local coordinate system of the circle X (U) = Radius * Cos (U) Y (U) = Radius * Sin (U).
") Parameter;
		static double Parameter(const gp_Circ2d & C, const gp_Pnt2d & P);

		/****** ElCLib::Parameter ******/
		/****** md5 signature: 27440734b2dc4f9032e2d7704a945c1f ******/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "
Parameters
----------
E: gp_Elips
P: gp_Pnt

Return
-------
double

Description
-----------
No available documentation.
") Parameter;
		static double Parameter(const gp_Elips & E, const gp_Pnt & P);

		/****** ElCLib::Parameter ******/
		/****** md5 signature: 91cf72390adf427e5295d139fed217f4 ******/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "
Parameters
----------
E: gp_Elips2d
P: gp_Pnt2d

Return
-------
double

Description
-----------
parametrization In the local coordinate system of the Ellipse X (U) = MajorRadius * Cos (U) Y (U) = MinorRadius * Sin (U).
") Parameter;
		static double Parameter(const gp_Elips2d & E, const gp_Pnt2d & P);

		/****** ElCLib::Parameter ******/
		/****** md5 signature: a3842e471947b39a06182d3a5e910d3a ******/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "
Parameters
----------
H: gp_Hypr
P: gp_Pnt

Return
-------
double

Description
-----------
No available documentation.
") Parameter;
		static double Parameter(const gp_Hypr & H, const gp_Pnt & P);

		/****** ElCLib::Parameter ******/
		/****** md5 signature: 30f4a0f4c5755d97d947e81cdbdb5b43 ******/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "
Parameters
----------
H: gp_Hypr2d
P: gp_Pnt2d

Return
-------
double

Description
-----------
parametrization In the local coordinate system of the Hyperbola X (U) = MajorRadius * Ch (U) Y (U) = MinorRadius * Sh (U).
") Parameter;
		static double Parameter(const gp_Hypr2d & H, const gp_Pnt2d & P);

		/****** ElCLib::Parameter ******/
		/****** md5 signature: 089a53646566046b07d5b2cd3a5c8311 ******/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "
Parameters
----------
Prb: gp_Parab
P: gp_Pnt

Return
-------
double

Description
-----------
No available documentation.
") Parameter;
		static double Parameter(const gp_Parab & Prb, const gp_Pnt & P);

		/****** ElCLib::Parameter ******/
		/****** md5 signature: ccf779afc0886b4f27f0a80b60e2db06 ******/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "
Parameters
----------
Prb: gp_Parab2d
P: gp_Pnt2d

Return
-------
double

Description
-----------
parametrization In the local coordinate system of the parabola Y**2 = (2*P) * X where P is the distance between the focus and the directrix.
") Parameter;
		static double Parameter(const gp_Parab2d & Prb, const gp_Pnt2d & P);

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
		/****** md5 signature: f78347f964eef6b44643a42dfb3db49b ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
U: double
L: gp_Lin

Return
-------
gp_Pnt

Description
-----------
For elementary curves (lines, circles and conics) from the gp package, computes the point of parameter U. The result is either: - a gp_Pnt point for a curve in 3D space, or - a gp_Pnt2d point for a curve in 2D space.
") Value;
		static gp_Pnt Value(const double U, const gp_Lin & L);

		/****** ElCLib::Value ******/
		/****** md5 signature: 055d88ee15f8f48f8d5228ed267a74c6 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
U: double
C: gp_Circ

Return
-------
gp_Pnt

Description
-----------
No available documentation.
") Value;
		static gp_Pnt Value(const double U, const gp_Circ & C);

		/****** ElCLib::Value ******/
		/****** md5 signature: 604b46a3f3eeac3bef20a8c68ef28d88 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
U: double
E: gp_Elips

Return
-------
gp_Pnt

Description
-----------
No available documentation.
") Value;
		static gp_Pnt Value(const double U, const gp_Elips & E);

		/****** ElCLib::Value ******/
		/****** md5 signature: d554ebf53096b4e6c781610ee294782c ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
U: double
H: gp_Hypr

Return
-------
gp_Pnt

Description
-----------
No available documentation.
") Value;
		static gp_Pnt Value(const double U, const gp_Hypr & H);

		/****** ElCLib::Value ******/
		/****** md5 signature: bd11da38a587af2de62c1c21d3a32395 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
U: double
Prb: gp_Parab

Return
-------
gp_Pnt

Description
-----------
No available documentation.
") Value;
		static gp_Pnt Value(const double U, const gp_Parab & Prb);

		/****** ElCLib::Value ******/
		/****** md5 signature: c2f71cf7fdad70e14cd5cce3bcd0603a ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
U: double
L: gp_Lin2d

Return
-------
gp_Pnt2d

Description
-----------
No available documentation.
") Value;
		static gp_Pnt2d Value(const double U, const gp_Lin2d & L);

		/****** ElCLib::Value ******/
		/****** md5 signature: ba80b655eacbf81b69b4fe987027dccd ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
U: double
C: gp_Circ2d

Return
-------
gp_Pnt2d

Description
-----------
No available documentation.
") Value;
		static gp_Pnt2d Value(const double U, const gp_Circ2d & C);

		/****** ElCLib::Value ******/
		/****** md5 signature: 35a0e8af6a8efd3c5420fcb9c495ef27 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
U: double
E: gp_Elips2d

Return
-------
gp_Pnt2d

Description
-----------
No available documentation.
") Value;
		static gp_Pnt2d Value(const double U, const gp_Elips2d & E);

		/****** ElCLib::Value ******/
		/****** md5 signature: 28d66172595ee27422f3094e89ffefb8 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
U: double
H: gp_Hypr2d

Return
-------
gp_Pnt2d

Description
-----------
No available documentation.
") Value;
		static gp_Pnt2d Value(const double U, const gp_Hypr2d & H);

		/****** ElCLib::Value ******/
		/****** md5 signature: 9e36f701a839898056f755b31fe83107 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
U: double
Prb: gp_Parab2d

Return
-------
gp_Pnt2d

Description
-----------
No available documentation.
") Value;
		static gp_Pnt2d Value(const double U, const gp_Parab2d & Prb);

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
