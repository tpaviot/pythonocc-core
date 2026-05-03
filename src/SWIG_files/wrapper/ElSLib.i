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
%define ELSLIBDOCSTRING
"ElSLib module, see official documentation at
https://dev.opencascade.org/doc/occt-7.9.0/refman/html/package_elslib.html"
%enddef
%module (package="OCC.Core", docstring=ELSLIBDOCSTRING) ElSLib


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
#include<ElSLib_module.hxx>

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
* class ElSLib *
***************/
%rename(elslib) ElSLib;
class ElSLib {
	public:
		/****** ElSLib::ConeD0 ******/
		/****** md5 signature: d7bb5434520d3c2bdf1137c637e23347 ******/
		%feature("compactdefaultargs") ConeD0;
		%feature("autodoc", "
Parameters
----------
U: double
V: double
Pos: gp_Ax3
Radius: double
SAngle: double
P: gp_Pnt

Return
-------
None

Description
-----------
No available documentation.
") ConeD0;
		static void ConeD0(const double U, const double V, const gp_Ax3 & Pos, const double Radius, const double SAngle, gp_Pnt & P);

		/****** ElSLib::ConeD1 ******/
		/****** md5 signature: 417527b799f68abf5ea61b807842ceba ******/
		%feature("compactdefaultargs") ConeD1;
		%feature("autodoc", "
Parameters
----------
U: double
V: double
Pos: gp_Ax3
Radius: double
SAngle: double
P: gp_Pnt
Vu: gp_Vec
Vv: gp_Vec

Return
-------
None

Description
-----------
No available documentation.
") ConeD1;
		static void ConeD1(const double U, const double V, const gp_Ax3 & Pos, const double Radius, const double SAngle, gp_Pnt & P, gp_Vec & Vu, gp_Vec & Vv);

		/****** ElSLib::ConeD2 ******/
		/****** md5 signature: 4d7e0b37db68b73a4c91863701e3bc6b ******/
		%feature("compactdefaultargs") ConeD2;
		%feature("autodoc", "
Parameters
----------
U: double
V: double
Pos: gp_Ax3
Radius: double
SAngle: double
P: gp_Pnt
Vu: gp_Vec
Vv: gp_Vec
Vuu: gp_Vec
Vvv: gp_Vec
Vuv: gp_Vec

Return
-------
None

Description
-----------
No available documentation.
") ConeD2;
		static void ConeD2(const double U, const double V, const gp_Ax3 & Pos, const double Radius, const double SAngle, gp_Pnt & P, gp_Vec & Vu, gp_Vec & Vv, gp_Vec & Vuu, gp_Vec & Vvv, gp_Vec & Vuv);

		/****** ElSLib::ConeD3 ******/
		/****** md5 signature: 0e15160a2b1a57d1067228f331aaccf0 ******/
		%feature("compactdefaultargs") ConeD3;
		%feature("autodoc", "
Parameters
----------
U: double
V: double
Pos: gp_Ax3
Radius: double
SAngle: double
P: gp_Pnt
Vu: gp_Vec
Vv: gp_Vec
Vuu: gp_Vec
Vvv: gp_Vec
Vuv: gp_Vec
Vuuu: gp_Vec
Vvvv: gp_Vec
Vuuv: gp_Vec
Vuvv: gp_Vec

Return
-------
None

Description
-----------
No available documentation.
") ConeD3;
		static void ConeD3(const double U, const double V, const gp_Ax3 & Pos, const double Radius, const double SAngle, gp_Pnt & P, gp_Vec & Vu, gp_Vec & Vv, gp_Vec & Vuu, gp_Vec & Vvv, gp_Vec & Vuv, gp_Vec & Vuuu, gp_Vec & Vvvv, gp_Vec & Vuuv, gp_Vec & Vuvv);

		/****** ElSLib::ConeDN ******/
		/****** md5 signature: cba378843b47286ce8cc2e5a2190c93b ******/
		%feature("compactdefaultargs") ConeDN;
		%feature("autodoc", "
Parameters
----------
U: double
V: double
Pos: gp_Ax3
Radius: double
SAngle: double
Nu: int
Nv: int

Return
-------
gp_Vec

Description
-----------
No available documentation.
") ConeDN;
		static gp_Vec ConeDN(const double U, const double V, const gp_Ax3 & Pos, const double Radius, const double SAngle, const int Nu, const int Nv);

		/****** ElSLib::ConeParameters ******/
		/****** md5 signature: a3a27eeb09e773a9efdb2c12679d921c ******/
		%feature("compactdefaultargs") ConeParameters;
		%feature("autodoc", "
Parameters
----------
Pos: gp_Ax3
Radius: double
SAngle: double
P: gp_Pnt

Return
-------
U: double
V: double

Description
-----------
parametrization P (U, V) = Location + V * ZDirection + (Radius + V * Tan (SemiAngle)) * (std::cos(U) * XDirection + std::sin(U) * YDirection).
") ConeParameters;
		static void ConeParameters(const gp_Ax3 & Pos, const double Radius, const double SAngle, const gp_Pnt & P, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** ElSLib::ConeUIso ******/
		/****** md5 signature: e526687a863f4f5c08849a805cc265f9 ******/
		%feature("compactdefaultargs") ConeUIso;
		%feature("autodoc", "
Parameters
----------
Pos: gp_Ax3
Radius: double
SAngle: double
U: double

Return
-------
gp_Lin

Description
-----------
compute the U Isoparametric gp_Lin of the cone.
") ConeUIso;
		static gp_Lin ConeUIso(const gp_Ax3 & Pos, const double Radius, const double SAngle, const double U);

		/****** ElSLib::ConeVIso ******/
		/****** md5 signature: c71b544d0d65cc3026edd8d9e92c44c8 ******/
		%feature("compactdefaultargs") ConeVIso;
		%feature("autodoc", "
Parameters
----------
Pos: gp_Ax3
Radius: double
SAngle: double
V: double

Return
-------
gp_Circ

Description
-----------
compute the V Isoparametric gp_Circ of the cone.
") ConeVIso;
		static gp_Circ ConeVIso(const gp_Ax3 & Pos, const double Radius, const double SAngle, const double V);

		/****** ElSLib::ConeValue ******/
		/****** md5 signature: 472783287e51147024612ae16784cf4b ******/
		%feature("compactdefaultargs") ConeValue;
		%feature("autodoc", "
Parameters
----------
U: double
V: double
Pos: gp_Ax3
Radius: double
SAngle: double

Return
-------
gp_Pnt

Description
-----------
No available documentation.
") ConeValue;
		static gp_Pnt ConeValue(const double U, const double V, const gp_Ax3 & Pos, const double Radius, const double SAngle);

		/****** ElSLib::CylinderD0 ******/
		/****** md5 signature: a40a2290c30bacc6d319a16d3b1d1bb5 ******/
		%feature("compactdefaultargs") CylinderD0;
		%feature("autodoc", "
Parameters
----------
U: double
V: double
Pos: gp_Ax3
Radius: double
P: gp_Pnt

Return
-------
None

Description
-----------
No available documentation.
") CylinderD0;
		static void CylinderD0(const double U, const double V, const gp_Ax3 & Pos, const double Radius, gp_Pnt & P);

		/****** ElSLib::CylinderD1 ******/
		/****** md5 signature: b56a52206c1acc73917cc4ed9b866135 ******/
		%feature("compactdefaultargs") CylinderD1;
		%feature("autodoc", "
Parameters
----------
U: double
V: double
Pos: gp_Ax3
Radius: double
P: gp_Pnt
Vu: gp_Vec
Vv: gp_Vec

Return
-------
None

Description
-----------
No available documentation.
") CylinderD1;
		static void CylinderD1(const double U, const double V, const gp_Ax3 & Pos, const double Radius, gp_Pnt & P, gp_Vec & Vu, gp_Vec & Vv);

		/****** ElSLib::CylinderD2 ******/
		/****** md5 signature: 8913cb2c34a27708f6df43587c260436 ******/
		%feature("compactdefaultargs") CylinderD2;
		%feature("autodoc", "
Parameters
----------
U: double
V: double
Pos: gp_Ax3
Radius: double
P: gp_Pnt
Vu: gp_Vec
Vv: gp_Vec
Vuu: gp_Vec
Vvv: gp_Vec
Vuv: gp_Vec

Return
-------
None

Description
-----------
No available documentation.
") CylinderD2;
		static void CylinderD2(const double U, const double V, const gp_Ax3 & Pos, const double Radius, gp_Pnt & P, gp_Vec & Vu, gp_Vec & Vv, gp_Vec & Vuu, gp_Vec & Vvv, gp_Vec & Vuv);

		/****** ElSLib::CylinderD3 ******/
		/****** md5 signature: 68f865a7805c46b93951cf6cba73f8d7 ******/
		%feature("compactdefaultargs") CylinderD3;
		%feature("autodoc", "
Parameters
----------
U: double
V: double
Pos: gp_Ax3
Radius: double
P: gp_Pnt
Vu: gp_Vec
Vv: gp_Vec
Vuu: gp_Vec
Vvv: gp_Vec
Vuv: gp_Vec
Vuuu: gp_Vec
Vvvv: gp_Vec
Vuuv: gp_Vec
Vuvv: gp_Vec

Return
-------
None

Description
-----------
No available documentation.
") CylinderD3;
		static void CylinderD3(const double U, const double V, const gp_Ax3 & Pos, const double Radius, gp_Pnt & P, gp_Vec & Vu, gp_Vec & Vv, gp_Vec & Vuu, gp_Vec & Vvv, gp_Vec & Vuv, gp_Vec & Vuuu, gp_Vec & Vvvv, gp_Vec & Vuuv, gp_Vec & Vuvv);

		/****** ElSLib::CylinderDN ******/
		/****** md5 signature: f2d34144084a2c97ff0a92ee505924e3 ******/
		%feature("compactdefaultargs") CylinderDN;
		%feature("autodoc", "
Parameters
----------
U: double
V: double
Pos: gp_Ax3
Radius: double
Nu: int
Nv: int

Return
-------
gp_Vec

Description
-----------
No available documentation.
") CylinderDN;
		static gp_Vec CylinderDN(const double U, const double V, const gp_Ax3 & Pos, const double Radius, const int Nu, const int Nv);

		/****** ElSLib::CylinderParameters ******/
		/****** md5 signature: b6857eb7ad41fdaa45df05ba8e5ad687 ******/
		%feature("compactdefaultargs") CylinderParameters;
		%feature("autodoc", "
Parameters
----------
Pos: gp_Ax3
Radius: double
P: gp_Pnt

Return
-------
U: double
V: double

Description
-----------
parametrization P (U, V) = Location + V * ZDirection + Radius * (std::cos(U) * XDirection + Sin (U) * YDirection).
") CylinderParameters;
		static void CylinderParameters(const gp_Ax3 & Pos, const double Radius, const gp_Pnt & P, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** ElSLib::CylinderUIso ******/
		/****** md5 signature: 495060d81ddb8aadcb3461e0021ec783 ******/
		%feature("compactdefaultargs") CylinderUIso;
		%feature("autodoc", "
Parameters
----------
Pos: gp_Ax3
Radius: double
U: double

Return
-------
gp_Lin

Description
-----------
compute the U Isoparametric gp_Lin of the cylinder.
") CylinderUIso;
		static gp_Lin CylinderUIso(const gp_Ax3 & Pos, const double Radius, const double U);

		/****** ElSLib::CylinderVIso ******/
		/****** md5 signature: 8f147d71d7e005cfe7f5f0e6246e4b5c ******/
		%feature("compactdefaultargs") CylinderVIso;
		%feature("autodoc", "
Parameters
----------
Pos: gp_Ax3
Radius: double
V: double

Return
-------
gp_Circ

Description
-----------
compute the V Isoparametric gp_Circ of the cylinder.
") CylinderVIso;
		static gp_Circ CylinderVIso(const gp_Ax3 & Pos, const double Radius, const double V);

		/****** ElSLib::CylinderValue ******/
		/****** md5 signature: fc56de51a0a5bac5c095fb6f44f736e0 ******/
		%feature("compactdefaultargs") CylinderValue;
		%feature("autodoc", "
Parameters
----------
U: double
V: double
Pos: gp_Ax3
Radius: double

Return
-------
gp_Pnt

Description
-----------
No available documentation.
") CylinderValue;
		static gp_Pnt CylinderValue(const double U, const double V, const gp_Ax3 & Pos, const double Radius);

		/****** ElSLib::D0 ******/
		/****** md5 signature: 48af646a95a2ce0835cb7bb762332198 ******/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "
Parameters
----------
U: double
V: double
Pl: gp_Pln
P: gp_Pnt

Return
-------
None

Description
-----------
For elementary surfaces from the gp package (planes, cones, cylinders, spheres and tori), computes the point P of parameters (U, V).inline.
") D0;
		static void D0(const double U, const double V, const gp_Pln & Pl, gp_Pnt & P);

		/****** ElSLib::D0 ******/
		/****** md5 signature: ba266bf754a7333100250ce3d3a47e07 ******/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "
Parameters
----------
U: double
V: double
C: gp_Cone
P: gp_Pnt

Return
-------
None

Description
-----------
No available documentation.
") D0;
		static void D0(const double U, const double V, const gp_Cone & C, gp_Pnt & P);

		/****** ElSLib::D0 ******/
		/****** md5 signature: 73c918517791c38eccc8c7b88c7c37cf ******/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "
Parameters
----------
U: double
V: double
C: gp_Cylinder
P: gp_Pnt

Return
-------
None

Description
-----------
No available documentation.
") D0;
		static void D0(const double U, const double V, const gp_Cylinder & C, gp_Pnt & P);

		/****** ElSLib::D0 ******/
		/****** md5 signature: c0d6ce527c7786bd00cc444add1e14da ******/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "
Parameters
----------
U: double
V: double
S: gp_Sphere
P: gp_Pnt

Return
-------
None

Description
-----------
No available documentation.
") D0;
		static void D0(const double U, const double V, const gp_Sphere & S, gp_Pnt & P);

		/****** ElSLib::D0 ******/
		/****** md5 signature: 35f945bc82d7b4c9549d321b9a312366 ******/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "
Parameters
----------
U: double
V: double
T: gp_Torus
P: gp_Pnt

Return
-------
None

Description
-----------
No available documentation.
") D0;
		static void D0(const double U, const double V, const gp_Torus & T, gp_Pnt & P);

		/****** ElSLib::D1 ******/
		/****** md5 signature: 63d33748cff4bd5ee3209bc06c222b0c ******/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "
Parameters
----------
U: double
V: double
Pl: gp_Pln
P: gp_Pnt
Vu: gp_Vec
Vv: gp_Vec

Return
-------
None

Description
-----------
For elementary surfaces from the gp package (planes, cones, cylinders, spheres and tori), computes: - the point P of parameters (U, V), and - the first derivative vectors Vu and Vv at this point in the u and v parametric directions respectively.
") D1;
		static void D1(const double U, const double V, const gp_Pln & Pl, gp_Pnt & P, gp_Vec & Vu, gp_Vec & Vv);

		/****** ElSLib::D1 ******/
		/****** md5 signature: 5f62af0d272391e362ab94b26501a111 ******/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "
Parameters
----------
U: double
V: double
C: gp_Cone
P: gp_Pnt
Vu: gp_Vec
Vv: gp_Vec

Return
-------
None

Description
-----------
No available documentation.
") D1;
		static void D1(const double U, const double V, const gp_Cone & C, gp_Pnt & P, gp_Vec & Vu, gp_Vec & Vv);

		/****** ElSLib::D1 ******/
		/****** md5 signature: 1f5d33af983c20f025b3215a789e6da8 ******/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "
Parameters
----------
U: double
V: double
C: gp_Cylinder
P: gp_Pnt
Vu: gp_Vec
Vv: gp_Vec

Return
-------
None

Description
-----------
No available documentation.
") D1;
		static void D1(const double U, const double V, const gp_Cylinder & C, gp_Pnt & P, gp_Vec & Vu, gp_Vec & Vv);

		/****** ElSLib::D1 ******/
		/****** md5 signature: 6855973e2879f3ccbc45c90be53b25bd ******/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "
Parameters
----------
U: double
V: double
S: gp_Sphere
P: gp_Pnt
Vu: gp_Vec
Vv: gp_Vec

Return
-------
None

Description
-----------
No available documentation.
") D1;
		static void D1(const double U, const double V, const gp_Sphere & S, gp_Pnt & P, gp_Vec & Vu, gp_Vec & Vv);

		/****** ElSLib::D1 ******/
		/****** md5 signature: a9132fc4562c07b38f9d5cdb8179c519 ******/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "
Parameters
----------
U: double
V: double
T: gp_Torus
P: gp_Pnt
Vu: gp_Vec
Vv: gp_Vec

Return
-------
None

Description
-----------
No available documentation.
") D1;
		static void D1(const double U, const double V, const gp_Torus & T, gp_Pnt & P, gp_Vec & Vu, gp_Vec & Vv);

		/****** ElSLib::D2 ******/
		/****** md5 signature: bf4cbb5b7bab717922d08efa4f141885 ******/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "
Parameters
----------
U: double
V: double
C: gp_Cone
P: gp_Pnt
Vu: gp_Vec
Vv: gp_Vec
Vuu: gp_Vec
Vvv: gp_Vec
Vuv: gp_Vec

Return
-------
None

Description
-----------
For elementary surfaces from the gp package (cones, cylinders, spheres and tori), computes: - the point P of parameters (U, V), and - the first derivative vectors Vu and Vv at this point in the u and v parametric directions respectively, and - the second derivative vectors Vuu, Vvv and Vuv at this point.
") D2;
		static void D2(const double U, const double V, const gp_Cone & C, gp_Pnt & P, gp_Vec & Vu, gp_Vec & Vv, gp_Vec & Vuu, gp_Vec & Vvv, gp_Vec & Vuv);

		/****** ElSLib::D2 ******/
		/****** md5 signature: 6e60809c365d2cd3b11ee8def75f9785 ******/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "
Parameters
----------
U: double
V: double
C: gp_Cylinder
P: gp_Pnt
Vu: gp_Vec
Vv: gp_Vec
Vuu: gp_Vec
Vvv: gp_Vec
Vuv: gp_Vec

Return
-------
None

Description
-----------
No available documentation.
") D2;
		static void D2(const double U, const double V, const gp_Cylinder & C, gp_Pnt & P, gp_Vec & Vu, gp_Vec & Vv, gp_Vec & Vuu, gp_Vec & Vvv, gp_Vec & Vuv);

		/****** ElSLib::D2 ******/
		/****** md5 signature: 1b81890eae266335273d1307f28b3259 ******/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "
Parameters
----------
U: double
V: double
S: gp_Sphere
P: gp_Pnt
Vu: gp_Vec
Vv: gp_Vec
Vuu: gp_Vec
Vvv: gp_Vec
Vuv: gp_Vec

Return
-------
None

Description
-----------
No available documentation.
") D2;
		static void D2(const double U, const double V, const gp_Sphere & S, gp_Pnt & P, gp_Vec & Vu, gp_Vec & Vv, gp_Vec & Vuu, gp_Vec & Vvv, gp_Vec & Vuv);

		/****** ElSLib::D2 ******/
		/****** md5 signature: 875d5489f4bee6edba354cc5e487d0cf ******/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "
Parameters
----------
U: double
V: double
T: gp_Torus
P: gp_Pnt
Vu: gp_Vec
Vv: gp_Vec
Vuu: gp_Vec
Vvv: gp_Vec
Vuv: gp_Vec

Return
-------
None

Description
-----------
No available documentation.
") D2;
		static void D2(const double U, const double V, const gp_Torus & T, gp_Pnt & P, gp_Vec & Vu, gp_Vec & Vv, gp_Vec & Vuu, gp_Vec & Vvv, gp_Vec & Vuv);

		/****** ElSLib::D3 ******/
		/****** md5 signature: 9a08e94ce4b2ca11cd124e81e769b4c8 ******/
		%feature("compactdefaultargs") D3;
		%feature("autodoc", "
Parameters
----------
U: double
V: double
C: gp_Cone
P: gp_Pnt
Vu: gp_Vec
Vv: gp_Vec
Vuu: gp_Vec
Vvv: gp_Vec
Vuv: gp_Vec
Vuuu: gp_Vec
Vvvv: gp_Vec
Vuuv: gp_Vec
Vuvv: gp_Vec

Return
-------
None

Description
-----------
For elementary surfaces from the gp package (cones, cylinders, spheres and tori), computes: - the point P of parameters (U,V), and - the first derivative vectors Vu and Vv at this point in the u and v parametric directions respectively, and - the second derivative vectors Vuu, Vvv and Vuv at this point, and - the third derivative vectors Vuuu, Vvvv, Vuuv and Vuvv at this point.
") D3;
		static void D3(const double U, const double V, const gp_Cone & C, gp_Pnt & P, gp_Vec & Vu, gp_Vec & Vv, gp_Vec & Vuu, gp_Vec & Vvv, gp_Vec & Vuv, gp_Vec & Vuuu, gp_Vec & Vvvv, gp_Vec & Vuuv, gp_Vec & Vuvv);

		/****** ElSLib::D3 ******/
		/****** md5 signature: fd8c21592a5d765733457bedff4e4db6 ******/
		%feature("compactdefaultargs") D3;
		%feature("autodoc", "
Parameters
----------
U: double
V: double
C: gp_Cylinder
P: gp_Pnt
Vu: gp_Vec
Vv: gp_Vec
Vuu: gp_Vec
Vvv: gp_Vec
Vuv: gp_Vec
Vuuu: gp_Vec
Vvvv: gp_Vec
Vuuv: gp_Vec
Vuvv: gp_Vec

Return
-------
None

Description
-----------
No available documentation.
") D3;
		static void D3(const double U, const double V, const gp_Cylinder & C, gp_Pnt & P, gp_Vec & Vu, gp_Vec & Vv, gp_Vec & Vuu, gp_Vec & Vvv, gp_Vec & Vuv, gp_Vec & Vuuu, gp_Vec & Vvvv, gp_Vec & Vuuv, gp_Vec & Vuvv);

		/****** ElSLib::D3 ******/
		/****** md5 signature: cef0fa07656e27ce242b111b2098f7fd ******/
		%feature("compactdefaultargs") D3;
		%feature("autodoc", "
Parameters
----------
U: double
V: double
S: gp_Sphere
P: gp_Pnt
Vu: gp_Vec
Vv: gp_Vec
Vuu: gp_Vec
Vvv: gp_Vec
Vuv: gp_Vec
Vuuu: gp_Vec
Vvvv: gp_Vec
Vuuv: gp_Vec
Vuvv: gp_Vec

Return
-------
None

Description
-----------
No available documentation.
") D3;
		static void D3(const double U, const double V, const gp_Sphere & S, gp_Pnt & P, gp_Vec & Vu, gp_Vec & Vv, gp_Vec & Vuu, gp_Vec & Vvv, gp_Vec & Vuv, gp_Vec & Vuuu, gp_Vec & Vvvv, gp_Vec & Vuuv, gp_Vec & Vuvv);

		/****** ElSLib::D3 ******/
		/****** md5 signature: 21921e8247cc4241a9a11e6a25f05b2f ******/
		%feature("compactdefaultargs") D3;
		%feature("autodoc", "
Parameters
----------
U: double
V: double
T: gp_Torus
P: gp_Pnt
Vu: gp_Vec
Vv: gp_Vec
Vuu: gp_Vec
Vvv: gp_Vec
Vuv: gp_Vec
Vuuu: gp_Vec
Vvvv: gp_Vec
Vuuv: gp_Vec
Vuvv: gp_Vec

Return
-------
None

Description
-----------
Surface evaluation The following functions compute the point and the derivatives on elementary surfaces defined with their geometric characteristics. You don't need to create the surface to use these functions. These functions are called by the previous ones. Example: A cylinder is defined with its position and its radius.
") D3;
		static void D3(const double U, const double V, const gp_Torus & T, gp_Pnt & P, gp_Vec & Vu, gp_Vec & Vv, gp_Vec & Vuu, gp_Vec & Vvv, gp_Vec & Vuv, gp_Vec & Vuuu, gp_Vec & Vvvv, gp_Vec & Vuuv, gp_Vec & Vuvv);

		/****** ElSLib::DN ******/
		/****** md5 signature: 065a64d3a199f905f67d908eeaf2ab11 ******/
		%feature("compactdefaultargs") DN;
		%feature("autodoc", "
Parameters
----------
U: double
V: double
Pl: gp_Pln
Nu: int
Nv: int

Return
-------
gp_Vec

Description
-----------
For elementary surfaces from the gp package (planes, cones, cylinders, spheres and tori), computes the derivative vector of order Nu and Nv in the u and v parametric directions respectively, at the point of parameters (U, V).
") DN;
		static gp_Vec DN(const double U, const double V, const gp_Pln & Pl, const int Nu, const int Nv);

		/****** ElSLib::DN ******/
		/****** md5 signature: 9bc7aca19a4456bfd0a7348bbdd9a39d ******/
		%feature("compactdefaultargs") DN;
		%feature("autodoc", "
Parameters
----------
U: double
V: double
C: gp_Cone
Nu: int
Nv: int

Return
-------
gp_Vec

Description
-----------
No available documentation.
") DN;
		static gp_Vec DN(const double U, const double V, const gp_Cone & C, const int Nu, const int Nv);

		/****** ElSLib::DN ******/
		/****** md5 signature: 434c64a4dddd058d4720725595742964 ******/
		%feature("compactdefaultargs") DN;
		%feature("autodoc", "
Parameters
----------
U: double
V: double
C: gp_Cylinder
Nu: int
Nv: int

Return
-------
gp_Vec

Description
-----------
No available documentation.
") DN;
		static gp_Vec DN(const double U, const double V, const gp_Cylinder & C, const int Nu, const int Nv);

		/****** ElSLib::DN ******/
		/****** md5 signature: 424040c17792aab47d732368f766da8a ******/
		%feature("compactdefaultargs") DN;
		%feature("autodoc", "
Parameters
----------
U: double
V: double
S: gp_Sphere
Nu: int
Nv: int

Return
-------
gp_Vec

Description
-----------
No available documentation.
") DN;
		static gp_Vec DN(const double U, const double V, const gp_Sphere & S, const int Nu, const int Nv);

		/****** ElSLib::DN ******/
		/****** md5 signature: 687509b57bfaabef38e40a5d34fbe98f ******/
		%feature("compactdefaultargs") DN;
		%feature("autodoc", "
Parameters
----------
U: double
V: double
T: gp_Torus
Nu: int
Nv: int

Return
-------
gp_Vec

Description
-----------
No available documentation.
") DN;
		static gp_Vec DN(const double U, const double V, const gp_Torus & T, const int Nu, const int Nv);

		/****** ElSLib::Parameters ******/
		/****** md5 signature: 761a5ce7ebe09a5aeae40854ef7beb36 ******/
		%feature("compactdefaultargs") Parameters;
		%feature("autodoc", "
Parameters
----------
Pl: gp_Pln
P: gp_Pnt

Return
-------
U: double
V: double

Description
-----------
parametrization P (U, V) = Pl.Location() + U * Pl.XDirection() + V * Pl.YDirection().
") Parameters;
		static void Parameters(const gp_Pln & Pl, const gp_Pnt & P, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** ElSLib::Parameters ******/
		/****** md5 signature: c669e44cb84b6b72ba13e84c67ac0286 ******/
		%feature("compactdefaultargs") Parameters;
		%feature("autodoc", "
Parameters
----------
C: gp_Cylinder
P: gp_Pnt

Return
-------
U: double
V: double

Description
-----------
parametrization P (U, V) = Location + V * ZDirection + Radius * (std::cos(U) * XDirection + Sin (U) * YDirection).
") Parameters;
		static void Parameters(const gp_Cylinder & C, const gp_Pnt & P, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** ElSLib::Parameters ******/
		/****** md5 signature: f928e71ed5559fa1e23a562e5106f25a ******/
		%feature("compactdefaultargs") Parameters;
		%feature("autodoc", "
Parameters
----------
C: gp_Cone
P: gp_Pnt

Return
-------
U: double
V: double

Description
-----------
parametrization P (U, V) = Location + V * ZDirection + (Radius + V * Tan (SemiAngle)) * (std::cos(U) * XDirection + std::sin(U) * YDirection).
") Parameters;
		static void Parameters(const gp_Cone & C, const gp_Pnt & P, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** ElSLib::Parameters ******/
		/****** md5 signature: 0b8c1a6a4ac1ee340a384b5ccbf54f49 ******/
		%feature("compactdefaultargs") Parameters;
		%feature("autodoc", "
Parameters
----------
S: gp_Sphere
P: gp_Pnt

Return
-------
U: double
V: double

Description
-----------
parametrization P (U, V) = Location + Radius * Cos (V) * (Cos (U) * XDirection + Sin (U) * YDirection) + Radius * Sin (V) * ZDirection.
") Parameters;
		static void Parameters(const gp_Sphere & S, const gp_Pnt & P, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** ElSLib::Parameters ******/
		/****** md5 signature: 9a65eb0039de7ba87356bbe2903b1149 ******/
		%feature("compactdefaultargs") Parameters;
		%feature("autodoc", "
Parameters
----------
T: gp_Torus
P: gp_Pnt

Return
-------
U: double
V: double

Description
-----------
parametrization P (U, V) = Location + (MajorRadius + MinorRadius * std::cos(U)) * (std::cos(V) * XDirection - std::sin(V) * YDirection) + MinorRadius * std::sin(U) * ZDirection.
") Parameters;
		static void Parameters(const gp_Torus & T, const gp_Pnt & P, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** ElSLib::PlaneD0 ******/
		/****** md5 signature: c94f15c7420ed2a52af59227119cfde7 ******/
		%feature("compactdefaultargs") PlaneD0;
		%feature("autodoc", "
Parameters
----------
U: double
V: double
Pos: gp_Ax3
P: gp_Pnt

Return
-------
None

Description
-----------
No available documentation.
") PlaneD0;
		static void PlaneD0(const double U, const double V, const gp_Ax3 & Pos, gp_Pnt & P);

		/****** ElSLib::PlaneD1 ******/
		/****** md5 signature: 37bf33653a9b6ee32a0adcc70d7f1b90 ******/
		%feature("compactdefaultargs") PlaneD1;
		%feature("autodoc", "
Parameters
----------
U: double
V: double
Pos: gp_Ax3
P: gp_Pnt
Vu: gp_Vec
Vv: gp_Vec

Return
-------
None

Description
-----------
No available documentation.
") PlaneD1;
		static void PlaneD1(const double U, const double V, const gp_Ax3 & Pos, gp_Pnt & P, gp_Vec & Vu, gp_Vec & Vv);

		/****** ElSLib::PlaneDN ******/
		/****** md5 signature: a5fea910cce37eb2e5f063d6ccd58882 ******/
		%feature("compactdefaultargs") PlaneDN;
		%feature("autodoc", "
Parameters
----------
U: double
V: double
Pos: gp_Ax3
Nu: int
Nv: int

Return
-------
gp_Vec

Description
-----------
No available documentation.
") PlaneDN;
		static gp_Vec PlaneDN(const double U, const double V, const gp_Ax3 & Pos, const int Nu, const int Nv);

		/****** ElSLib::PlaneParameters ******/
		/****** md5 signature: ae0d4e16da8e0cfcf3b8ed5eb32110d9 ******/
		%feature("compactdefaultargs") PlaneParameters;
		%feature("autodoc", "
Parameters
----------
Pos: gp_Ax3
P: gp_Pnt

Return
-------
U: double
V: double

Description
-----------
parametrization P (U, V) = Pl.Location() + U * Pl.XDirection() + V * Pl.YDirection().
") PlaneParameters;
		static void PlaneParameters(const gp_Ax3 & Pos, const gp_Pnt & P, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** ElSLib::PlaneUIso ******/
		/****** md5 signature: 506d4ee7fd233987df8c619bb549d3ce ******/
		%feature("compactdefaultargs") PlaneUIso;
		%feature("autodoc", "
Parameters
----------
Pos: gp_Ax3
U: double

Return
-------
gp_Lin

Description
-----------
compute the U Isoparametric gp_Lin of the plane.
") PlaneUIso;
		static gp_Lin PlaneUIso(const gp_Ax3 & Pos, const double U);

		/****** ElSLib::PlaneVIso ******/
		/****** md5 signature: 8c593b142691c7c40882a578a48f6eaa ******/
		%feature("compactdefaultargs") PlaneVIso;
		%feature("autodoc", "
Parameters
----------
Pos: gp_Ax3
V: double

Return
-------
gp_Lin

Description
-----------
compute the V Isoparametric gp_Lin of the plane.
") PlaneVIso;
		static gp_Lin PlaneVIso(const gp_Ax3 & Pos, const double V);

		/****** ElSLib::PlaneValue ******/
		/****** md5 signature: f85fd223c3842b2e6851e06c16b5d891 ******/
		%feature("compactdefaultargs") PlaneValue;
		%feature("autodoc", "
Parameters
----------
U: double
V: double
Pos: gp_Ax3

Return
-------
gp_Pnt

Description
-----------
No available documentation.
") PlaneValue;
		static gp_Pnt PlaneValue(const double U, const double V, const gp_Ax3 & Pos);

		/****** ElSLib::SphereD0 ******/
		/****** md5 signature: a6a5f48dcf30b326f8b306a453171996 ******/
		%feature("compactdefaultargs") SphereD0;
		%feature("autodoc", "
Parameters
----------
U: double
V: double
Pos: gp_Ax3
Radius: double
P: gp_Pnt

Return
-------
None

Description
-----------
No available documentation.
") SphereD0;
		static void SphereD0(const double U, const double V, const gp_Ax3 & Pos, const double Radius, gp_Pnt & P);

		/****** ElSLib::SphereD1 ******/
		/****** md5 signature: 7778cee603667f95ee9c1deaee2ed1ff ******/
		%feature("compactdefaultargs") SphereD1;
		%feature("autodoc", "
Parameters
----------
U: double
V: double
Pos: gp_Ax3
Radius: double
P: gp_Pnt
Vu: gp_Vec
Vv: gp_Vec

Return
-------
None

Description
-----------
No available documentation.
") SphereD1;
		static void SphereD1(const double U, const double V, const gp_Ax3 & Pos, const double Radius, gp_Pnt & P, gp_Vec & Vu, gp_Vec & Vv);

		/****** ElSLib::SphereD2 ******/
		/****** md5 signature: 65d334b7b8bcf9837200f52116664a0e ******/
		%feature("compactdefaultargs") SphereD2;
		%feature("autodoc", "
Parameters
----------
U: double
V: double
Pos: gp_Ax3
Radius: double
P: gp_Pnt
Vu: gp_Vec
Vv: gp_Vec
Vuu: gp_Vec
Vvv: gp_Vec
Vuv: gp_Vec

Return
-------
None

Description
-----------
No available documentation.
") SphereD2;
		static void SphereD2(const double U, const double V, const gp_Ax3 & Pos, const double Radius, gp_Pnt & P, gp_Vec & Vu, gp_Vec & Vv, gp_Vec & Vuu, gp_Vec & Vvv, gp_Vec & Vuv);

		/****** ElSLib::SphereD3 ******/
		/****** md5 signature: 1450116c60c4e189cd94a891c03dbc95 ******/
		%feature("compactdefaultargs") SphereD3;
		%feature("autodoc", "
Parameters
----------
U: double
V: double
Pos: gp_Ax3
Radius: double
P: gp_Pnt
Vu: gp_Vec
Vv: gp_Vec
Vuu: gp_Vec
Vvv: gp_Vec
Vuv: gp_Vec
Vuuu: gp_Vec
Vvvv: gp_Vec
Vuuv: gp_Vec
Vuvv: gp_Vec

Return
-------
None

Description
-----------
No available documentation.
") SphereD3;
		static void SphereD3(const double U, const double V, const gp_Ax3 & Pos, const double Radius, gp_Pnt & P, gp_Vec & Vu, gp_Vec & Vv, gp_Vec & Vuu, gp_Vec & Vvv, gp_Vec & Vuv, gp_Vec & Vuuu, gp_Vec & Vvvv, gp_Vec & Vuuv, gp_Vec & Vuvv);

		/****** ElSLib::SphereDN ******/
		/****** md5 signature: f564b3801ad5daa211c43f121ba7f53e ******/
		%feature("compactdefaultargs") SphereDN;
		%feature("autodoc", "
Parameters
----------
U: double
V: double
Pos: gp_Ax3
Radius: double
Nu: int
Nv: int

Return
-------
gp_Vec

Description
-----------
No available documentation.
") SphereDN;
		static gp_Vec SphereDN(const double U, const double V, const gp_Ax3 & Pos, const double Radius, const int Nu, const int Nv);

		/****** ElSLib::SphereParameters ******/
		/****** md5 signature: 49b3ac7c2ea5d27e6a7782264184b594 ******/
		%feature("compactdefaultargs") SphereParameters;
		%feature("autodoc", "
Parameters
----------
Pos: gp_Ax3
Radius: double
P: gp_Pnt

Return
-------
U: double
V: double

Description
-----------
parametrization P (U, V) = Location + Radius * Cos (V) * (Cos (U) * XDirection + Sin (U) * YDirection) + Radius * Sin (V) * ZDirection.
") SphereParameters;
		static void SphereParameters(const gp_Ax3 & Pos, const double Radius, const gp_Pnt & P, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** ElSLib::SphereUIso ******/
		/****** md5 signature: 6d17f1a2c37e6ca6f8420c444fc3a2ff ******/
		%feature("compactdefaultargs") SphereUIso;
		%feature("autodoc", "
Parameters
----------
Pos: gp_Ax3
Radius: double
U: double

Return
-------
gp_Circ

Description
-----------
compute the U Isoparametric gp_Circ of the sphere, (the meridian is not trimmed).
") SphereUIso;
		static gp_Circ SphereUIso(const gp_Ax3 & Pos, const double Radius, const double U);

		/****** ElSLib::SphereVIso ******/
		/****** md5 signature: d522f1078b8f5fca7ecbb9fc6d2cbf64 ******/
		%feature("compactdefaultargs") SphereVIso;
		%feature("autodoc", "
Parameters
----------
Pos: gp_Ax3
Radius: double
V: double

Return
-------
gp_Circ

Description
-----------
compute the V Isoparametric gp_Circ of the sphere, (the meridian is not trimmed).
") SphereVIso;
		static gp_Circ SphereVIso(const gp_Ax3 & Pos, const double Radius, const double V);

		/****** ElSLib::SphereValue ******/
		/****** md5 signature: 341ee5f78a686602623d902a720a2d18 ******/
		%feature("compactdefaultargs") SphereValue;
		%feature("autodoc", "
Parameters
----------
U: double
V: double
Pos: gp_Ax3
Radius: double

Return
-------
gp_Pnt

Description
-----------
No available documentation.
") SphereValue;
		static gp_Pnt SphereValue(const double U, const double V, const gp_Ax3 & Pos, const double Radius);

		/****** ElSLib::TorusD0 ******/
		/****** md5 signature: 4c4eb0121cd4f123efe05ffe7765fd68 ******/
		%feature("compactdefaultargs") TorusD0;
		%feature("autodoc", "
Parameters
----------
U: double
V: double
Pos: gp_Ax3
MajorRadius: double
MinorRadius: double
P: gp_Pnt

Return
-------
None

Description
-----------
No available documentation.
") TorusD0;
		static void TorusD0(const double U, const double V, const gp_Ax3 & Pos, const double MajorRadius, const double MinorRadius, gp_Pnt & P);

		/****** ElSLib::TorusD1 ******/
		/****** md5 signature: ed1fc75687079eac19146d4179985120 ******/
		%feature("compactdefaultargs") TorusD1;
		%feature("autodoc", "
Parameters
----------
U: double
V: double
Pos: gp_Ax3
MajorRadius: double
MinorRadius: double
P: gp_Pnt
Vu: gp_Vec
Vv: gp_Vec

Return
-------
None

Description
-----------
No available documentation.
") TorusD1;
		static void TorusD1(const double U, const double V, const gp_Ax3 & Pos, const double MajorRadius, const double MinorRadius, gp_Pnt & P, gp_Vec & Vu, gp_Vec & Vv);

		/****** ElSLib::TorusD2 ******/
		/****** md5 signature: c5c7e368b3acbf83aeec3f2657142aca ******/
		%feature("compactdefaultargs") TorusD2;
		%feature("autodoc", "
Parameters
----------
U: double
V: double
Pos: gp_Ax3
MajorRadius: double
MinorRadius: double
P: gp_Pnt
Vu: gp_Vec
Vv: gp_Vec
Vuu: gp_Vec
Vvv: gp_Vec
Vuv: gp_Vec

Return
-------
None

Description
-----------
No available documentation.
") TorusD2;
		static void TorusD2(const double U, const double V, const gp_Ax3 & Pos, const double MajorRadius, const double MinorRadius, gp_Pnt & P, gp_Vec & Vu, gp_Vec & Vv, gp_Vec & Vuu, gp_Vec & Vvv, gp_Vec & Vuv);

		/****** ElSLib::TorusD3 ******/
		/****** md5 signature: 33c1f22851f55b69538e006185d903b2 ******/
		%feature("compactdefaultargs") TorusD3;
		%feature("autodoc", "
Parameters
----------
U: double
V: double
Pos: gp_Ax3
MajorRadius: double
MinorRadius: double
P: gp_Pnt
Vu: gp_Vec
Vv: gp_Vec
Vuu: gp_Vec
Vvv: gp_Vec
Vuv: gp_Vec
Vuuu: gp_Vec
Vvvv: gp_Vec
Vuuv: gp_Vec
Vuvv: gp_Vec

Return
-------
None

Description
-----------
The following functions compute the parametric values corresponding to a given point on a elementary surface. The point should be on the surface.
") TorusD3;
		static void TorusD3(const double U, const double V, const gp_Ax3 & Pos, const double MajorRadius, const double MinorRadius, gp_Pnt & P, gp_Vec & Vu, gp_Vec & Vv, gp_Vec & Vuu, gp_Vec & Vvv, gp_Vec & Vuv, gp_Vec & Vuuu, gp_Vec & Vvvv, gp_Vec & Vuuv, gp_Vec & Vuvv);

		/****** ElSLib::TorusDN ******/
		/****** md5 signature: ea030371054a1d560a7b611e447a4133 ******/
		%feature("compactdefaultargs") TorusDN;
		%feature("autodoc", "
Parameters
----------
U: double
V: double
Pos: gp_Ax3
MajorRadius: double
MinorRadius: double
Nu: int
Nv: int

Return
-------
gp_Vec

Description
-----------
No available documentation.
") TorusDN;
		static gp_Vec TorusDN(const double U, const double V, const gp_Ax3 & Pos, const double MajorRadius, const double MinorRadius, const int Nu, const int Nv);

		/****** ElSLib::TorusParameters ******/
		/****** md5 signature: b55d0b0d22c592306cb4158c730fe159 ******/
		%feature("compactdefaultargs") TorusParameters;
		%feature("autodoc", "
Parameters
----------
Pos: gp_Ax3
MajorRadius: double
MinorRadius: double
P: gp_Pnt

Return
-------
U: double
V: double

Description
-----------
parametrization P (U, V) = Location + (MajorRadius + MinorRadius * std::cos(U)) * (std::cos(V) * XDirection - std::sin(V) * YDirection) + MinorRadius * std::sin(U) * ZDirection.
") TorusParameters;
		static void TorusParameters(const gp_Ax3 & Pos, const double MajorRadius, const double MinorRadius, const gp_Pnt & P, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** ElSLib::TorusUIso ******/
		/****** md5 signature: 9305ae7e3c7d18d960d8991454fe3318 ******/
		%feature("compactdefaultargs") TorusUIso;
		%feature("autodoc", "
Parameters
----------
Pos: gp_Ax3
MajorRadius: double
MinorRadius: double
U: double

Return
-------
gp_Circ

Description
-----------
compute the U Isoparametric gp_Circ of the torus.
") TorusUIso;
		static gp_Circ TorusUIso(const gp_Ax3 & Pos, const double MajorRadius, const double MinorRadius, const double U);

		/****** ElSLib::TorusVIso ******/
		/****** md5 signature: dabb468d749950e30ad23ddcdc5d28d4 ******/
		%feature("compactdefaultargs") TorusVIso;
		%feature("autodoc", "
Parameters
----------
Pos: gp_Ax3
MajorRadius: double
MinorRadius: double
V: double

Return
-------
gp_Circ

Description
-----------
compute the V Isoparametric gp_Circ of the torus.
") TorusVIso;
		static gp_Circ TorusVIso(const gp_Ax3 & Pos, const double MajorRadius, const double MinorRadius, const double V);

		/****** ElSLib::TorusValue ******/
		/****** md5 signature: 383c8e1e02d45f6bf2c540ae533ca2be ******/
		%feature("compactdefaultargs") TorusValue;
		%feature("autodoc", "
Parameters
----------
U: double
V: double
Pos: gp_Ax3
MajorRadius: double
MinorRadius: double

Return
-------
gp_Pnt

Description
-----------
No available documentation.
") TorusValue;
		static gp_Pnt TorusValue(const double U, const double V, const gp_Ax3 & Pos, const double MajorRadius, const double MinorRadius);

		/****** ElSLib::Value ******/
		/****** md5 signature: 4379e1cff962992cf231a182f488cb6b ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
U: double
V: double
Pl: gp_Pln

Return
-------
gp_Pnt

Description
-----------
For elementary surfaces from the gp package (planes, cones, cylinders, spheres and tori), computes the point of parameters (U, V).
") Value;
		static gp_Pnt Value(const double U, const double V, const gp_Pln & Pl);

		/****** ElSLib::Value ******/
		/****** md5 signature: b3130e24b9346696b5d9e734672ae7c2 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
U: double
V: double
C: gp_Cone

Return
-------
gp_Pnt

Description
-----------
No available documentation.
") Value;
		static gp_Pnt Value(const double U, const double V, const gp_Cone & C);

		/****** ElSLib::Value ******/
		/****** md5 signature: d19e98bde011629f8aeb8e7b894dec9e ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
U: double
V: double
C: gp_Cylinder

Return
-------
gp_Pnt

Description
-----------
No available documentation.
") Value;
		static gp_Pnt Value(const double U, const double V, const gp_Cylinder & C);

		/****** ElSLib::Value ******/
		/****** md5 signature: cc8e2cfb5dd5e71df73221c0a3580a67 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
U: double
V: double
S: gp_Sphere

Return
-------
gp_Pnt

Description
-----------
No available documentation.
") Value;
		static gp_Pnt Value(const double U, const double V, const gp_Sphere & S);

		/****** ElSLib::Value ******/
		/****** md5 signature: 073b79a9089119b4a0171c2f6e0c8312 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
U: double
V: double
T: gp_Torus

Return
-------
gp_Pnt

Description
-----------
No available documentation.
") Value;
		static gp_Pnt Value(const double U, const double V, const gp_Torus & T);

};


%extend ElSLib {
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
def elslib_ConeD0(*args):
	return elslib.ConeD0(*args)

@deprecated
def elslib_ConeD1(*args):
	return elslib.ConeD1(*args)

@deprecated
def elslib_ConeD2(*args):
	return elslib.ConeD2(*args)

@deprecated
def elslib_ConeD3(*args):
	return elslib.ConeD3(*args)

@deprecated
def elslib_ConeDN(*args):
	return elslib.ConeDN(*args)

@deprecated
def elslib_ConeParameters(*args):
	return elslib.ConeParameters(*args)

@deprecated
def elslib_ConeUIso(*args):
	return elslib.ConeUIso(*args)

@deprecated
def elslib_ConeVIso(*args):
	return elslib.ConeVIso(*args)

@deprecated
def elslib_ConeValue(*args):
	return elslib.ConeValue(*args)

@deprecated
def elslib_CylinderD0(*args):
	return elslib.CylinderD0(*args)

@deprecated
def elslib_CylinderD1(*args):
	return elslib.CylinderD1(*args)

@deprecated
def elslib_CylinderD2(*args):
	return elslib.CylinderD2(*args)

@deprecated
def elslib_CylinderD3(*args):
	return elslib.CylinderD3(*args)

@deprecated
def elslib_CylinderDN(*args):
	return elslib.CylinderDN(*args)

@deprecated
def elslib_CylinderParameters(*args):
	return elslib.CylinderParameters(*args)

@deprecated
def elslib_CylinderUIso(*args):
	return elslib.CylinderUIso(*args)

@deprecated
def elslib_CylinderVIso(*args):
	return elslib.CylinderVIso(*args)

@deprecated
def elslib_CylinderValue(*args):
	return elslib.CylinderValue(*args)

@deprecated
def elslib_D0(*args):
	return elslib.D0(*args)

@deprecated
def elslib_D0(*args):
	return elslib.D0(*args)

@deprecated
def elslib_D0(*args):
	return elslib.D0(*args)

@deprecated
def elslib_D0(*args):
	return elslib.D0(*args)

@deprecated
def elslib_D0(*args):
	return elslib.D0(*args)

@deprecated
def elslib_D1(*args):
	return elslib.D1(*args)

@deprecated
def elslib_D1(*args):
	return elslib.D1(*args)

@deprecated
def elslib_D1(*args):
	return elslib.D1(*args)

@deprecated
def elslib_D1(*args):
	return elslib.D1(*args)

@deprecated
def elslib_D1(*args):
	return elslib.D1(*args)

@deprecated
def elslib_D2(*args):
	return elslib.D2(*args)

@deprecated
def elslib_D2(*args):
	return elslib.D2(*args)

@deprecated
def elslib_D2(*args):
	return elslib.D2(*args)

@deprecated
def elslib_D2(*args):
	return elslib.D2(*args)

@deprecated
def elslib_D3(*args):
	return elslib.D3(*args)

@deprecated
def elslib_D3(*args):
	return elslib.D3(*args)

@deprecated
def elslib_D3(*args):
	return elslib.D3(*args)

@deprecated
def elslib_D3(*args):
	return elslib.D3(*args)

@deprecated
def elslib_DN(*args):
	return elslib.DN(*args)

@deprecated
def elslib_DN(*args):
	return elslib.DN(*args)

@deprecated
def elslib_DN(*args):
	return elslib.DN(*args)

@deprecated
def elslib_DN(*args):
	return elslib.DN(*args)

@deprecated
def elslib_DN(*args):
	return elslib.DN(*args)

@deprecated
def elslib_Parameters(*args):
	return elslib.Parameters(*args)

@deprecated
def elslib_Parameters(*args):
	return elslib.Parameters(*args)

@deprecated
def elslib_Parameters(*args):
	return elslib.Parameters(*args)

@deprecated
def elslib_Parameters(*args):
	return elslib.Parameters(*args)

@deprecated
def elslib_Parameters(*args):
	return elslib.Parameters(*args)

@deprecated
def elslib_PlaneD0(*args):
	return elslib.PlaneD0(*args)

@deprecated
def elslib_PlaneD1(*args):
	return elslib.PlaneD1(*args)

@deprecated
def elslib_PlaneDN(*args):
	return elslib.PlaneDN(*args)

@deprecated
def elslib_PlaneParameters(*args):
	return elslib.PlaneParameters(*args)

@deprecated
def elslib_PlaneUIso(*args):
	return elslib.PlaneUIso(*args)

@deprecated
def elslib_PlaneVIso(*args):
	return elslib.PlaneVIso(*args)

@deprecated
def elslib_PlaneValue(*args):
	return elslib.PlaneValue(*args)

@deprecated
def elslib_SphereD0(*args):
	return elslib.SphereD0(*args)

@deprecated
def elslib_SphereD1(*args):
	return elslib.SphereD1(*args)

@deprecated
def elslib_SphereD2(*args):
	return elslib.SphereD2(*args)

@deprecated
def elslib_SphereD3(*args):
	return elslib.SphereD3(*args)

@deprecated
def elslib_SphereDN(*args):
	return elslib.SphereDN(*args)

@deprecated
def elslib_SphereParameters(*args):
	return elslib.SphereParameters(*args)

@deprecated
def elslib_SphereUIso(*args):
	return elslib.SphereUIso(*args)

@deprecated
def elslib_SphereVIso(*args):
	return elslib.SphereVIso(*args)

@deprecated
def elslib_SphereValue(*args):
	return elslib.SphereValue(*args)

@deprecated
def elslib_TorusD0(*args):
	return elslib.TorusD0(*args)

@deprecated
def elslib_TorusD1(*args):
	return elslib.TorusD1(*args)

@deprecated
def elslib_TorusD2(*args):
	return elslib.TorusD2(*args)

@deprecated
def elslib_TorusD3(*args):
	return elslib.TorusD3(*args)

@deprecated
def elslib_TorusDN(*args):
	return elslib.TorusDN(*args)

@deprecated
def elslib_TorusParameters(*args):
	return elslib.TorusParameters(*args)

@deprecated
def elslib_TorusUIso(*args):
	return elslib.TorusUIso(*args)

@deprecated
def elslib_TorusVIso(*args):
	return elslib.TorusVIso(*args)

@deprecated
def elslib_TorusValue(*args):
	return elslib.TorusValue(*args)

@deprecated
def elslib_Value(*args):
	return elslib.Value(*args)

@deprecated
def elslib_Value(*args):
	return elslib.Value(*args)

@deprecated
def elslib_Value(*args):
	return elslib.Value(*args)

@deprecated
def elslib_Value(*args):
	return elslib.Value(*args)

@deprecated
def elslib_Value(*args):
	return elslib.Value(*args)

}
