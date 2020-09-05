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
%define ELSLIBDOCSTRING
"ElSLib module, see official documentation at
https://www.opencascade.com/doc/occt-7.4.0/refman/html/package_elslib.html"
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
%include ../common/Operators.i
%include ../common/OccHandle.i


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
* class ElSLib *
***************/
%rename(elslib) ElSLib;
class ElSLib {
	public:
		/****************** ConeD0 ******************/
		/**** md5 signature: a6a8c3ca9b6ab93e831e6ddbb749417a ****/
		%feature("compactdefaultargs") ConeD0;
		%feature("autodoc", "No available documentation.

Parameters
----------
U: float
V: float
Pos: gp_Ax3
Radius: float
SAngle: float
P: gp_Pnt

Returns
-------
None
") ConeD0;
		static void ConeD0(const Standard_Real U, const Standard_Real V, const gp_Ax3 & Pos, const Standard_Real Radius, const Standard_Real SAngle, gp_Pnt & P);

		/****************** ConeD1 ******************/
		/**** md5 signature: b7922f6a69582ddcc606331f197ae875 ****/
		%feature("compactdefaultargs") ConeD1;
		%feature("autodoc", "No available documentation.

Parameters
----------
U: float
V: float
Pos: gp_Ax3
Radius: float
SAngle: float
P: gp_Pnt
Vu: gp_Vec
Vv: gp_Vec

Returns
-------
None
") ConeD1;
		static void ConeD1(const Standard_Real U, const Standard_Real V, const gp_Ax3 & Pos, const Standard_Real Radius, const Standard_Real SAngle, gp_Pnt & P, gp_Vec & Vu, gp_Vec & Vv);

		/****************** ConeD2 ******************/
		/**** md5 signature: f45870273e8a9027657f1e50e1d202ea ****/
		%feature("compactdefaultargs") ConeD2;
		%feature("autodoc", "No available documentation.

Parameters
----------
U: float
V: float
Pos: gp_Ax3
Radius: float
SAngle: float
P: gp_Pnt
Vu: gp_Vec
Vv: gp_Vec
Vuu: gp_Vec
Vvv: gp_Vec
Vuv: gp_Vec

Returns
-------
None
") ConeD2;
		static void ConeD2(const Standard_Real U, const Standard_Real V, const gp_Ax3 & Pos, const Standard_Real Radius, const Standard_Real SAngle, gp_Pnt & P, gp_Vec & Vu, gp_Vec & Vv, gp_Vec & Vuu, gp_Vec & Vvv, gp_Vec & Vuv);

		/****************** ConeD3 ******************/
		/**** md5 signature: 21e324e65c179f04c4743596117fa1d9 ****/
		%feature("compactdefaultargs") ConeD3;
		%feature("autodoc", "No available documentation.

Parameters
----------
U: float
V: float
Pos: gp_Ax3
Radius: float
SAngle: float
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

Returns
-------
None
") ConeD3;
		static void ConeD3(const Standard_Real U, const Standard_Real V, const gp_Ax3 & Pos, const Standard_Real Radius, const Standard_Real SAngle, gp_Pnt & P, gp_Vec & Vu, gp_Vec & Vv, gp_Vec & Vuu, gp_Vec & Vvv, gp_Vec & Vuv, gp_Vec & Vuuu, gp_Vec & Vvvv, gp_Vec & Vuuv, gp_Vec & Vuvv);

		/****************** ConeDN ******************/
		/**** md5 signature: e56054aeadff97b49c9f693dec864322 ****/
		%feature("compactdefaultargs") ConeDN;
		%feature("autodoc", "No available documentation.

Parameters
----------
U: float
V: float
Pos: gp_Ax3
Radius: float
SAngle: float
Nu: int
Nv: int

Returns
-------
gp_Vec
") ConeDN;
		static gp_Vec ConeDN(const Standard_Real U, const Standard_Real V, const gp_Ax3 & Pos, const Standard_Real Radius, const Standard_Real SAngle, const Standard_Integer Nu, const Standard_Integer Nv);

		/****************** ConeParameters ******************/
		/**** md5 signature: 233c5aeeea47852312c0008854f30810 ****/
		%feature("compactdefaultargs") ConeParameters;
		%feature("autodoc", "Parametrization p (u, v) = location + v * zdirection + (radius + v * tan (semiangle)) * (cos(u) * xdirection + sin(u) * ydirection).

Parameters
----------
Pos: gp_Ax3
Radius: float
SAngle: float
P: gp_Pnt

Returns
-------
U: float
V: float
") ConeParameters;
		static void ConeParameters(const gp_Ax3 & Pos, const Standard_Real Radius, const Standard_Real SAngle, const gp_Pnt & P, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** ConeUIso ******************/
		/**** md5 signature: 6c41af9a3679cbfa9dc777622fdc87b6 ****/
		%feature("compactdefaultargs") ConeUIso;
		%feature("autodoc", "Compute the u isoparametric gp_lin of the cone.

Parameters
----------
Pos: gp_Ax3
Radius: float
SAngle: float
U: float

Returns
-------
gp_Lin
") ConeUIso;
		static gp_Lin ConeUIso(const gp_Ax3 & Pos, const Standard_Real Radius, const Standard_Real SAngle, const Standard_Real U);

		/****************** ConeVIso ******************/
		/**** md5 signature: 7ecce60781ee68676bcc13f34b34a531 ****/
		%feature("compactdefaultargs") ConeVIso;
		%feature("autodoc", "Compute the v isoparametric gp_circ of the cone.

Parameters
----------
Pos: gp_Ax3
Radius: float
SAngle: float
V: float

Returns
-------
gp_Circ
") ConeVIso;
		static gp_Circ ConeVIso(const gp_Ax3 & Pos, const Standard_Real Radius, const Standard_Real SAngle, const Standard_Real V);

		/****************** ConeValue ******************/
		/**** md5 signature: 0fb9287ac9e0eb160f76d904ec3ce2c0 ****/
		%feature("compactdefaultargs") ConeValue;
		%feature("autodoc", "No available documentation.

Parameters
----------
U: float
V: float
Pos: gp_Ax3
Radius: float
SAngle: float

Returns
-------
gp_Pnt
") ConeValue;
		static gp_Pnt ConeValue(const Standard_Real U, const Standard_Real V, const gp_Ax3 & Pos, const Standard_Real Radius, const Standard_Real SAngle);

		/****************** CylinderD0 ******************/
		/**** md5 signature: ea8a8b240713a9b32d77bd11a8cbe0cc ****/
		%feature("compactdefaultargs") CylinderD0;
		%feature("autodoc", "No available documentation.

Parameters
----------
U: float
V: float
Pos: gp_Ax3
Radius: float
P: gp_Pnt

Returns
-------
None
") CylinderD0;
		static void CylinderD0(const Standard_Real U, const Standard_Real V, const gp_Ax3 & Pos, const Standard_Real Radius, gp_Pnt & P);

		/****************** CylinderD1 ******************/
		/**** md5 signature: 2d9a365abe021a49deec1726fb95f430 ****/
		%feature("compactdefaultargs") CylinderD1;
		%feature("autodoc", "No available documentation.

Parameters
----------
U: float
V: float
Pos: gp_Ax3
Radius: float
P: gp_Pnt
Vu: gp_Vec
Vv: gp_Vec

Returns
-------
None
") CylinderD1;
		static void CylinderD1(const Standard_Real U, const Standard_Real V, const gp_Ax3 & Pos, const Standard_Real Radius, gp_Pnt & P, gp_Vec & Vu, gp_Vec & Vv);

		/****************** CylinderD2 ******************/
		/**** md5 signature: 19b2a1ce1ec76472f8a729357b75a415 ****/
		%feature("compactdefaultargs") CylinderD2;
		%feature("autodoc", "No available documentation.

Parameters
----------
U: float
V: float
Pos: gp_Ax3
Radius: float
P: gp_Pnt
Vu: gp_Vec
Vv: gp_Vec
Vuu: gp_Vec
Vvv: gp_Vec
Vuv: gp_Vec

Returns
-------
None
") CylinderD2;
		static void CylinderD2(const Standard_Real U, const Standard_Real V, const gp_Ax3 & Pos, const Standard_Real Radius, gp_Pnt & P, gp_Vec & Vu, gp_Vec & Vv, gp_Vec & Vuu, gp_Vec & Vvv, gp_Vec & Vuv);

		/****************** CylinderD3 ******************/
		/**** md5 signature: 09aec245d3e6e8868d0b87ee908d919d ****/
		%feature("compactdefaultargs") CylinderD3;
		%feature("autodoc", "No available documentation.

Parameters
----------
U: float
V: float
Pos: gp_Ax3
Radius: float
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

Returns
-------
None
") CylinderD3;
		static void CylinderD3(const Standard_Real U, const Standard_Real V, const gp_Ax3 & Pos, const Standard_Real Radius, gp_Pnt & P, gp_Vec & Vu, gp_Vec & Vv, gp_Vec & Vuu, gp_Vec & Vvv, gp_Vec & Vuv, gp_Vec & Vuuu, gp_Vec & Vvvv, gp_Vec & Vuuv, gp_Vec & Vuvv);

		/****************** CylinderDN ******************/
		/**** md5 signature: 4c52237383cbad82b2472ee40223ecf2 ****/
		%feature("compactdefaultargs") CylinderDN;
		%feature("autodoc", "No available documentation.

Parameters
----------
U: float
V: float
Pos: gp_Ax3
Radius: float
Nu: int
Nv: int

Returns
-------
gp_Vec
") CylinderDN;
		static gp_Vec CylinderDN(const Standard_Real U, const Standard_Real V, const gp_Ax3 & Pos, const Standard_Real Radius, const Standard_Integer Nu, const Standard_Integer Nv);

		/****************** CylinderParameters ******************/
		/**** md5 signature: 4e8a0ab017ee9ab8c9fba1e2ddc8c606 ****/
		%feature("compactdefaultargs") CylinderParameters;
		%feature("autodoc", "Parametrization p (u, v) = location + v * zdirection + radius * (cos(u) * xdirection + sin (u) * ydirection).

Parameters
----------
Pos: gp_Ax3
Radius: float
P: gp_Pnt

Returns
-------
U: float
V: float
") CylinderParameters;
		static void CylinderParameters(const gp_Ax3 & Pos, const Standard_Real Radius, const gp_Pnt & P, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** CylinderUIso ******************/
		/**** md5 signature: 43a9a487a13558cdd650992d38ac68f4 ****/
		%feature("compactdefaultargs") CylinderUIso;
		%feature("autodoc", "Compute the u isoparametric gp_lin of the cylinder.

Parameters
----------
Pos: gp_Ax3
Radius: float
U: float

Returns
-------
gp_Lin
") CylinderUIso;
		static gp_Lin CylinderUIso(const gp_Ax3 & Pos, const Standard_Real Radius, const Standard_Real U);

		/****************** CylinderVIso ******************/
		/**** md5 signature: 98f6ae083ed3c528883c4b0f6baa1eb9 ****/
		%feature("compactdefaultargs") CylinderVIso;
		%feature("autodoc", "Compute the v isoparametric gp_circ of the cylinder.

Parameters
----------
Pos: gp_Ax3
Radius: float
V: float

Returns
-------
gp_Circ
") CylinderVIso;
		static gp_Circ CylinderVIso(const gp_Ax3 & Pos, const Standard_Real Radius, const Standard_Real V);

		/****************** CylinderValue ******************/
		/**** md5 signature: 80a7729f00abb41d21efa535b17256f9 ****/
		%feature("compactdefaultargs") CylinderValue;
		%feature("autodoc", "No available documentation.

Parameters
----------
U: float
V: float
Pos: gp_Ax3
Radius: float

Returns
-------
gp_Pnt
") CylinderValue;
		static gp_Pnt CylinderValue(const Standard_Real U, const Standard_Real V, const gp_Ax3 & Pos, const Standard_Real Radius);

		/****************** D0 ******************/
		/**** md5 signature: e5de4017e5ac69b3c6b1efee6459cb6e ****/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "For elementary surfaces from the gp package (planes, cones, cylinders, spheres and tori), computes the point p of parameters (u, v).inline.

Parameters
----------
U: float
V: float
Pl: gp_Pln
P: gp_Pnt

Returns
-------
None
") D0;
		static void D0(const Standard_Real U, const Standard_Real V, const gp_Pln & Pl, gp_Pnt & P);

		/****************** D0 ******************/
		/**** md5 signature: f24a8fddeb7cf76abdc6aa1f16455f69 ****/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "No available documentation.

Parameters
----------
U: float
V: float
C: gp_Cone
P: gp_Pnt

Returns
-------
None
") D0;
		static void D0(const Standard_Real U, const Standard_Real V, const gp_Cone & C, gp_Pnt & P);

		/****************** D0 ******************/
		/**** md5 signature: 72868a65a74f61d500769be079aa72ac ****/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "No available documentation.

Parameters
----------
U: float
V: float
C: gp_Cylinder
P: gp_Pnt

Returns
-------
None
") D0;
		static void D0(const Standard_Real U, const Standard_Real V, const gp_Cylinder & C, gp_Pnt & P);

		/****************** D0 ******************/
		/**** md5 signature: 85814fdc514b19c99627244373697036 ****/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "No available documentation.

Parameters
----------
U: float
V: float
S: gp_Sphere
P: gp_Pnt

Returns
-------
None
") D0;
		static void D0(const Standard_Real U, const Standard_Real V, const gp_Sphere & S, gp_Pnt & P);

		/****************** D0 ******************/
		/**** md5 signature: 77e6e855f630c8e2097641faa0df5fdc ****/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "No available documentation.

Parameters
----------
U: float
V: float
T: gp_Torus
P: gp_Pnt

Returns
-------
None
") D0;
		static void D0(const Standard_Real U, const Standard_Real V, const gp_Torus & T, gp_Pnt & P);

		/****************** D1 ******************/
		/**** md5 signature: 8b3e71c551e069e94861e33289a5d32b ****/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "For elementary surfaces from the gp package (planes, cones, cylinders, spheres and tori), computes: - the point p of parameters (u, v), and - the first derivative vectors vu and vv at this point in the u and v parametric directions respectively.

Parameters
----------
U: float
V: float
Pl: gp_Pln
P: gp_Pnt
Vu: gp_Vec
Vv: gp_Vec

Returns
-------
None
") D1;
		static void D1(const Standard_Real U, const Standard_Real V, const gp_Pln & Pl, gp_Pnt & P, gp_Vec & Vu, gp_Vec & Vv);

		/****************** D1 ******************/
		/**** md5 signature: 65987cf4ac86ea09cb0ec5c2c87fd6ec ****/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "No available documentation.

Parameters
----------
U: float
V: float
C: gp_Cone
P: gp_Pnt
Vu: gp_Vec
Vv: gp_Vec

Returns
-------
None
") D1;
		static void D1(const Standard_Real U, const Standard_Real V, const gp_Cone & C, gp_Pnt & P, gp_Vec & Vu, gp_Vec & Vv);

		/****************** D1 ******************/
		/**** md5 signature: a52113862081149395b44f081fc01663 ****/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "No available documentation.

Parameters
----------
U: float
V: float
C: gp_Cylinder
P: gp_Pnt
Vu: gp_Vec
Vv: gp_Vec

Returns
-------
None
") D1;
		static void D1(const Standard_Real U, const Standard_Real V, const gp_Cylinder & C, gp_Pnt & P, gp_Vec & Vu, gp_Vec & Vv);

		/****************** D1 ******************/
		/**** md5 signature: c0e7a883f69a28ac574298469f1245ed ****/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "No available documentation.

Parameters
----------
U: float
V: float
S: gp_Sphere
P: gp_Pnt
Vu: gp_Vec
Vv: gp_Vec

Returns
-------
None
") D1;
		static void D1(const Standard_Real U, const Standard_Real V, const gp_Sphere & S, gp_Pnt & P, gp_Vec & Vu, gp_Vec & Vv);

		/****************** D1 ******************/
		/**** md5 signature: 38cc310ed64bbeaf2e03bc1be5bdaba7 ****/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "No available documentation.

Parameters
----------
U: float
V: float
T: gp_Torus
P: gp_Pnt
Vu: gp_Vec
Vv: gp_Vec

Returns
-------
None
") D1;
		static void D1(const Standard_Real U, const Standard_Real V, const gp_Torus & T, gp_Pnt & P, gp_Vec & Vu, gp_Vec & Vv);

		/****************** D2 ******************/
		/**** md5 signature: ee5b1941fb35a973f76c57bcf41753b5 ****/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "For elementary surfaces from the gp package (cones, cylinders, spheres and tori), computes: - the point p of parameters (u, v), and - the first derivative vectors vu and vv at this point in the u and v parametric directions respectively, and - the second derivative vectors vuu, vvv and vuv at this point.

Parameters
----------
U: float
V: float
C: gp_Cone
P: gp_Pnt
Vu: gp_Vec
Vv: gp_Vec
Vuu: gp_Vec
Vvv: gp_Vec
Vuv: gp_Vec

Returns
-------
None
") D2;
		static void D2(const Standard_Real U, const Standard_Real V, const gp_Cone & C, gp_Pnt & P, gp_Vec & Vu, gp_Vec & Vv, gp_Vec & Vuu, gp_Vec & Vvv, gp_Vec & Vuv);

		/****************** D2 ******************/
		/**** md5 signature: 4e91bb4316b3387f47ca119242089a8d ****/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "No available documentation.

Parameters
----------
U: float
V: float
C: gp_Cylinder
P: gp_Pnt
Vu: gp_Vec
Vv: gp_Vec
Vuu: gp_Vec
Vvv: gp_Vec
Vuv: gp_Vec

Returns
-------
None
") D2;
		static void D2(const Standard_Real U, const Standard_Real V, const gp_Cylinder & C, gp_Pnt & P, gp_Vec & Vu, gp_Vec & Vv, gp_Vec & Vuu, gp_Vec & Vvv, gp_Vec & Vuv);

		/****************** D2 ******************/
		/**** md5 signature: 90f829908b1ed92bfaaceced09880949 ****/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "No available documentation.

Parameters
----------
U: float
V: float
S: gp_Sphere
P: gp_Pnt
Vu: gp_Vec
Vv: gp_Vec
Vuu: gp_Vec
Vvv: gp_Vec
Vuv: gp_Vec

Returns
-------
None
") D2;
		static void D2(const Standard_Real U, const Standard_Real V, const gp_Sphere & S, gp_Pnt & P, gp_Vec & Vu, gp_Vec & Vv, gp_Vec & Vuu, gp_Vec & Vvv, gp_Vec & Vuv);

		/****************** D2 ******************/
		/**** md5 signature: 9ee7f64fada1507c167eaac491c3986c ****/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "No available documentation.

Parameters
----------
U: float
V: float
T: gp_Torus
P: gp_Pnt
Vu: gp_Vec
Vv: gp_Vec
Vuu: gp_Vec
Vvv: gp_Vec
Vuv: gp_Vec

Returns
-------
None
") D2;
		static void D2(const Standard_Real U, const Standard_Real V, const gp_Torus & T, gp_Pnt & P, gp_Vec & Vu, gp_Vec & Vv, gp_Vec & Vuu, gp_Vec & Vvv, gp_Vec & Vuv);

		/****************** D3 ******************/
		/**** md5 signature: 87e2507fa9fe13340f6e34131e391d93 ****/
		%feature("compactdefaultargs") D3;
		%feature("autodoc", "For elementary surfaces from the gp package (cones, cylinders, spheres and tori), computes: - the point p of parameters (u,v), and - the first derivative vectors vu and vv at this point in the u and v parametric directions respectively, and - the second derivative vectors vuu, vvv and vuv at this point, and - the third derivative vectors vuuu, vvvv, vuuv and vuvv at this point.

Parameters
----------
U: float
V: float
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

Returns
-------
None
") D3;
		static void D3(const Standard_Real U, const Standard_Real V, const gp_Cone & C, gp_Pnt & P, gp_Vec & Vu, gp_Vec & Vv, gp_Vec & Vuu, gp_Vec & Vvv, gp_Vec & Vuv, gp_Vec & Vuuu, gp_Vec & Vvvv, gp_Vec & Vuuv, gp_Vec & Vuvv);

		/****************** D3 ******************/
		/**** md5 signature: 40555ae131b0b8299c2822d871d02d34 ****/
		%feature("compactdefaultargs") D3;
		%feature("autodoc", "No available documentation.

Parameters
----------
U: float
V: float
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

Returns
-------
None
") D3;
		static void D3(const Standard_Real U, const Standard_Real V, const gp_Cylinder & C, gp_Pnt & P, gp_Vec & Vu, gp_Vec & Vv, gp_Vec & Vuu, gp_Vec & Vvv, gp_Vec & Vuv, gp_Vec & Vuuu, gp_Vec & Vvvv, gp_Vec & Vuuv, gp_Vec & Vuvv);

		/****************** D3 ******************/
		/**** md5 signature: d3da98bd7eb606ecf52313afc32cec23 ****/
		%feature("compactdefaultargs") D3;
		%feature("autodoc", "No available documentation.

Parameters
----------
U: float
V: float
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

Returns
-------
None
") D3;
		static void D3(const Standard_Real U, const Standard_Real V, const gp_Sphere & S, gp_Pnt & P, gp_Vec & Vu, gp_Vec & Vv, gp_Vec & Vuu, gp_Vec & Vvv, gp_Vec & Vuv, gp_Vec & Vuuu, gp_Vec & Vvvv, gp_Vec & Vuuv, gp_Vec & Vuvv);

		/****************** D3 ******************/
		/**** md5 signature: d3305be8886796dce18f1f9e28e27d36 ****/
		%feature("compactdefaultargs") D3;
		%feature("autodoc", "Surface evaluation the following functions compute the point and the derivatives on elementary surfaces defined with their geometric characterisitics. you don't need to create the surface to use these functions. these functions are called by the previous ones. example : a cylinder is defined with its position and its radius.

Parameters
----------
U: float
V: float
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

Returns
-------
None
") D3;
		static void D3(const Standard_Real U, const Standard_Real V, const gp_Torus & T, gp_Pnt & P, gp_Vec & Vu, gp_Vec & Vv, gp_Vec & Vuu, gp_Vec & Vvv, gp_Vec & Vuv, gp_Vec & Vuuu, gp_Vec & Vvvv, gp_Vec & Vuuv, gp_Vec & Vuvv);

		/****************** DN ******************/
		/**** md5 signature: 20191fe8e2e8b71b3e6d1e05cb633204 ****/
		%feature("compactdefaultargs") DN;
		%feature("autodoc", "For elementary surfaces from the gp package (planes, cones, cylinders, spheres and tori), computes the derivative vector of order nu and nv in the u and v parametric directions respectively, at the point of parameters (u, v).

Parameters
----------
U: float
V: float
Pl: gp_Pln
Nu: int
Nv: int

Returns
-------
gp_Vec
") DN;
		static gp_Vec DN(const Standard_Real U, const Standard_Real V, const gp_Pln & Pl, const Standard_Integer Nu, const Standard_Integer Nv);

		/****************** DN ******************/
		/**** md5 signature: f989bb4492d90b0bd707a8e9089be97f ****/
		%feature("compactdefaultargs") DN;
		%feature("autodoc", "No available documentation.

Parameters
----------
U: float
V: float
C: gp_Cone
Nu: int
Nv: int

Returns
-------
gp_Vec
") DN;
		static gp_Vec DN(const Standard_Real U, const Standard_Real V, const gp_Cone & C, const Standard_Integer Nu, const Standard_Integer Nv);

		/****************** DN ******************/
		/**** md5 signature: d37980014b7e94fe985887936f027957 ****/
		%feature("compactdefaultargs") DN;
		%feature("autodoc", "No available documentation.

Parameters
----------
U: float
V: float
C: gp_Cylinder
Nu: int
Nv: int

Returns
-------
gp_Vec
") DN;
		static gp_Vec DN(const Standard_Real U, const Standard_Real V, const gp_Cylinder & C, const Standard_Integer Nu, const Standard_Integer Nv);

		/****************** DN ******************/
		/**** md5 signature: d19562bf3ca33f87ddbf950456b379fc ****/
		%feature("compactdefaultargs") DN;
		%feature("autodoc", "No available documentation.

Parameters
----------
U: float
V: float
S: gp_Sphere
Nu: int
Nv: int

Returns
-------
gp_Vec
") DN;
		static gp_Vec DN(const Standard_Real U, const Standard_Real V, const gp_Sphere & S, const Standard_Integer Nu, const Standard_Integer Nv);

		/****************** DN ******************/
		/**** md5 signature: 9b14e6145ecd0317362034ebe4985083 ****/
		%feature("compactdefaultargs") DN;
		%feature("autodoc", "No available documentation.

Parameters
----------
U: float
V: float
T: gp_Torus
Nu: int
Nv: int

Returns
-------
gp_Vec
") DN;
		static gp_Vec DN(const Standard_Real U, const Standard_Real V, const gp_Torus & T, const Standard_Integer Nu, const Standard_Integer Nv);

		/****************** Parameters ******************/
		/**** md5 signature: 1193daacb3600cf259746b1239ffd84b ****/
		%feature("compactdefaultargs") Parameters;
		%feature("autodoc", "Parametrization p (u, v) = pl.location() + u * pl.xdirection() + v * pl.ydirection().

Parameters
----------
Pl: gp_Pln
P: gp_Pnt

Returns
-------
U: float
V: float
") Parameters;
		static void Parameters(const gp_Pln & Pl, const gp_Pnt & P, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** Parameters ******************/
		/**** md5 signature: 2c6a3002278296bffd3e2c4a544464be ****/
		%feature("compactdefaultargs") Parameters;
		%feature("autodoc", "Parametrization p (u, v) = location + v * zdirection + radius * (cos(u) * xdirection + sin (u) * ydirection).

Parameters
----------
C: gp_Cylinder
P: gp_Pnt

Returns
-------
U: float
V: float
") Parameters;
		static void Parameters(const gp_Cylinder & C, const gp_Pnt & P, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** Parameters ******************/
		/**** md5 signature: 559ffec208c47755687b2596dd9eedc6 ****/
		%feature("compactdefaultargs") Parameters;
		%feature("autodoc", "Parametrization p (u, v) = location + v * zdirection + (radius + v * tan (semiangle)) * (cos(u) * xdirection + sin(u) * ydirection).

Parameters
----------
C: gp_Cone
P: gp_Pnt

Returns
-------
U: float
V: float
") Parameters;
		static void Parameters(const gp_Cone & C, const gp_Pnt & P, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** Parameters ******************/
		/**** md5 signature: cf74053fc0e62465fe9e58dedf8fe163 ****/
		%feature("compactdefaultargs") Parameters;
		%feature("autodoc", "Parametrization p (u, v) = location + radius * cos (v) * (cos (u) * xdirection + sin (u) * ydirection) + radius * sin (v) * zdirection.

Parameters
----------
S: gp_Sphere
P: gp_Pnt

Returns
-------
U: float
V: float
") Parameters;
		static void Parameters(const gp_Sphere & S, const gp_Pnt & P, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** Parameters ******************/
		/**** md5 signature: db68d4d53eec293d6506b9a27933bb12 ****/
		%feature("compactdefaultargs") Parameters;
		%feature("autodoc", "Parametrization p (u, v) = location + (majorradius + minorradius * cos(u)) * (cos(v) * xdirection - sin(v) * ydirection) + minorradius * sin(u) * zdirection.

Parameters
----------
T: gp_Torus
P: gp_Pnt

Returns
-------
U: float
V: float
") Parameters;
		static void Parameters(const gp_Torus & T, const gp_Pnt & P, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** PlaneD0 ******************/
		/**** md5 signature: 253b675d96876221a4c23c3f38091465 ****/
		%feature("compactdefaultargs") PlaneD0;
		%feature("autodoc", "No available documentation.

Parameters
----------
U: float
V: float
Pos: gp_Ax3
P: gp_Pnt

Returns
-------
None
") PlaneD0;
		static void PlaneD0(const Standard_Real U, const Standard_Real V, const gp_Ax3 & Pos, gp_Pnt & P);

		/****************** PlaneD1 ******************/
		/**** md5 signature: b931e31079446c1b6d26efe4cc18ba7d ****/
		%feature("compactdefaultargs") PlaneD1;
		%feature("autodoc", "No available documentation.

Parameters
----------
U: float
V: float
Pos: gp_Ax3
P: gp_Pnt
Vu: gp_Vec
Vv: gp_Vec

Returns
-------
None
") PlaneD1;
		static void PlaneD1(const Standard_Real U, const Standard_Real V, const gp_Ax3 & Pos, gp_Pnt & P, gp_Vec & Vu, gp_Vec & Vv);

		/****************** PlaneDN ******************/
		/**** md5 signature: 6f682d5eec64825b302a89b223c098b4 ****/
		%feature("compactdefaultargs") PlaneDN;
		%feature("autodoc", "No available documentation.

Parameters
----------
U: float
V: float
Pos: gp_Ax3
Nu: int
Nv: int

Returns
-------
gp_Vec
") PlaneDN;
		static gp_Vec PlaneDN(const Standard_Real U, const Standard_Real V, const gp_Ax3 & Pos, const Standard_Integer Nu, const Standard_Integer Nv);

		/****************** PlaneParameters ******************/
		/**** md5 signature: f18b35a9f1f722d9507197e90c3a49af ****/
		%feature("compactdefaultargs") PlaneParameters;
		%feature("autodoc", "Parametrization p (u, v) = pl.location() + u * pl.xdirection() + v * pl.ydirection().

Parameters
----------
Pos: gp_Ax3
P: gp_Pnt

Returns
-------
U: float
V: float
") PlaneParameters;
		static void PlaneParameters(const gp_Ax3 & Pos, const gp_Pnt & P, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** PlaneUIso ******************/
		/**** md5 signature: 2eb55c09f5910260707672fd56e8b9f1 ****/
		%feature("compactdefaultargs") PlaneUIso;
		%feature("autodoc", "Compute the u isoparametric gp_lin of the plane.

Parameters
----------
Pos: gp_Ax3
U: float

Returns
-------
gp_Lin
") PlaneUIso;
		static gp_Lin PlaneUIso(const gp_Ax3 & Pos, const Standard_Real U);

		/****************** PlaneVIso ******************/
		/**** md5 signature: e1f3e4b52efb38e446c9c7b9040390e2 ****/
		%feature("compactdefaultargs") PlaneVIso;
		%feature("autodoc", "Compute the v isoparametric gp_lin of the plane.

Parameters
----------
Pos: gp_Ax3
V: float

Returns
-------
gp_Lin
") PlaneVIso;
		static gp_Lin PlaneVIso(const gp_Ax3 & Pos, const Standard_Real V);

		/****************** PlaneValue ******************/
		/**** md5 signature: 86b5df7b2de0791c9a27036594c8ae20 ****/
		%feature("compactdefaultargs") PlaneValue;
		%feature("autodoc", "No available documentation.

Parameters
----------
U: float
V: float
Pos: gp_Ax3

Returns
-------
gp_Pnt
") PlaneValue;
		static gp_Pnt PlaneValue(const Standard_Real U, const Standard_Real V, const gp_Ax3 & Pos);

		/****************** SphereD0 ******************/
		/**** md5 signature: d1dc9191ac65f4903609f04bdd641611 ****/
		%feature("compactdefaultargs") SphereD0;
		%feature("autodoc", "No available documentation.

Parameters
----------
U: float
V: float
Pos: gp_Ax3
Radius: float
P: gp_Pnt

Returns
-------
None
") SphereD0;
		static void SphereD0(const Standard_Real U, const Standard_Real V, const gp_Ax3 & Pos, const Standard_Real Radius, gp_Pnt & P);

		/****************** SphereD1 ******************/
		/**** md5 signature: 207470e39b232cec2e472a84113ab7d8 ****/
		%feature("compactdefaultargs") SphereD1;
		%feature("autodoc", "No available documentation.

Parameters
----------
U: float
V: float
Pos: gp_Ax3
Radius: float
P: gp_Pnt
Vu: gp_Vec
Vv: gp_Vec

Returns
-------
None
") SphereD1;
		static void SphereD1(const Standard_Real U, const Standard_Real V, const gp_Ax3 & Pos, const Standard_Real Radius, gp_Pnt & P, gp_Vec & Vu, gp_Vec & Vv);

		/****************** SphereD2 ******************/
		/**** md5 signature: 4bd92282af1a9b5c82cc46da1f39465c ****/
		%feature("compactdefaultargs") SphereD2;
		%feature("autodoc", "No available documentation.

Parameters
----------
U: float
V: float
Pos: gp_Ax3
Radius: float
P: gp_Pnt
Vu: gp_Vec
Vv: gp_Vec
Vuu: gp_Vec
Vvv: gp_Vec
Vuv: gp_Vec

Returns
-------
None
") SphereD2;
		static void SphereD2(const Standard_Real U, const Standard_Real V, const gp_Ax3 & Pos, const Standard_Real Radius, gp_Pnt & P, gp_Vec & Vu, gp_Vec & Vv, gp_Vec & Vuu, gp_Vec & Vvv, gp_Vec & Vuv);

		/****************** SphereD3 ******************/
		/**** md5 signature: a0a2fd9756b3370dbafc0e80e4d512d3 ****/
		%feature("compactdefaultargs") SphereD3;
		%feature("autodoc", "No available documentation.

Parameters
----------
U: float
V: float
Pos: gp_Ax3
Radius: float
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

Returns
-------
None
") SphereD3;
		static void SphereD3(const Standard_Real U, const Standard_Real V, const gp_Ax3 & Pos, const Standard_Real Radius, gp_Pnt & P, gp_Vec & Vu, gp_Vec & Vv, gp_Vec & Vuu, gp_Vec & Vvv, gp_Vec & Vuv, gp_Vec & Vuuu, gp_Vec & Vvvv, gp_Vec & Vuuv, gp_Vec & Vuvv);

		/****************** SphereDN ******************/
		/**** md5 signature: e0c3a6a2cfaa57cd876b588a8a4e4902 ****/
		%feature("compactdefaultargs") SphereDN;
		%feature("autodoc", "No available documentation.

Parameters
----------
U: float
V: float
Pos: gp_Ax3
Radius: float
Nu: int
Nv: int

Returns
-------
gp_Vec
") SphereDN;
		static gp_Vec SphereDN(const Standard_Real U, const Standard_Real V, const gp_Ax3 & Pos, const Standard_Real Radius, const Standard_Integer Nu, const Standard_Integer Nv);

		/****************** SphereParameters ******************/
		/**** md5 signature: 45229f5876a988a1bb081b16af8eb894 ****/
		%feature("compactdefaultargs") SphereParameters;
		%feature("autodoc", "Parametrization p (u, v) = location + radius * cos (v) * (cos (u) * xdirection + sin (u) * ydirection) + radius * sin (v) * zdirection.

Parameters
----------
Pos: gp_Ax3
Radius: float
P: gp_Pnt

Returns
-------
U: float
V: float
") SphereParameters;
		static void SphereParameters(const gp_Ax3 & Pos, const Standard_Real Radius, const gp_Pnt & P, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** SphereUIso ******************/
		/**** md5 signature: 88af4242816cbc6f9872562706f513a7 ****/
		%feature("compactdefaultargs") SphereUIso;
		%feature("autodoc", "Compute the u isoparametric gp_circ of the sphere, (the meridian is not trimmed).

Parameters
----------
Pos: gp_Ax3
Radius: float
U: float

Returns
-------
gp_Circ
") SphereUIso;
		static gp_Circ SphereUIso(const gp_Ax3 & Pos, const Standard_Real Radius, const Standard_Real U);

		/****************** SphereVIso ******************/
		/**** md5 signature: b3543400820bba426bd59ea05e3789ac ****/
		%feature("compactdefaultargs") SphereVIso;
		%feature("autodoc", "Compute the v isoparametric gp_circ of the sphere, (the meridian is not trimmed).

Parameters
----------
Pos: gp_Ax3
Radius: float
V: float

Returns
-------
gp_Circ
") SphereVIso;
		static gp_Circ SphereVIso(const gp_Ax3 & Pos, const Standard_Real Radius, const Standard_Real V);

		/****************** SphereValue ******************/
		/**** md5 signature: 5749766342e62a530c2fa0e9811e748d ****/
		%feature("compactdefaultargs") SphereValue;
		%feature("autodoc", "No available documentation.

Parameters
----------
U: float
V: float
Pos: gp_Ax3
Radius: float

Returns
-------
gp_Pnt
") SphereValue;
		static gp_Pnt SphereValue(const Standard_Real U, const Standard_Real V, const gp_Ax3 & Pos, const Standard_Real Radius);

		/****************** TorusD0 ******************/
		/**** md5 signature: b65571b9cccdbe899c9ed0fa915d86d5 ****/
		%feature("compactdefaultargs") TorusD0;
		%feature("autodoc", "No available documentation.

Parameters
----------
U: float
V: float
Pos: gp_Ax3
MajorRadius: float
MinorRadius: float
P: gp_Pnt

Returns
-------
None
") TorusD0;
		static void TorusD0(const Standard_Real U, const Standard_Real V, const gp_Ax3 & Pos, const Standard_Real MajorRadius, const Standard_Real MinorRadius, gp_Pnt & P);

		/****************** TorusD1 ******************/
		/**** md5 signature: 05ad177c582f2bd47131f8512c9b3ecd ****/
		%feature("compactdefaultargs") TorusD1;
		%feature("autodoc", "No available documentation.

Parameters
----------
U: float
V: float
Pos: gp_Ax3
MajorRadius: float
MinorRadius: float
P: gp_Pnt
Vu: gp_Vec
Vv: gp_Vec

Returns
-------
None
") TorusD1;
		static void TorusD1(const Standard_Real U, const Standard_Real V, const gp_Ax3 & Pos, const Standard_Real MajorRadius, const Standard_Real MinorRadius, gp_Pnt & P, gp_Vec & Vu, gp_Vec & Vv);

		/****************** TorusD2 ******************/
		/**** md5 signature: 640c1bce6964f2d2dd8626a369c5d86c ****/
		%feature("compactdefaultargs") TorusD2;
		%feature("autodoc", "No available documentation.

Parameters
----------
U: float
V: float
Pos: gp_Ax3
MajorRadius: float
MinorRadius: float
P: gp_Pnt
Vu: gp_Vec
Vv: gp_Vec
Vuu: gp_Vec
Vvv: gp_Vec
Vuv: gp_Vec

Returns
-------
None
") TorusD2;
		static void TorusD2(const Standard_Real U, const Standard_Real V, const gp_Ax3 & Pos, const Standard_Real MajorRadius, const Standard_Real MinorRadius, gp_Pnt & P, gp_Vec & Vu, gp_Vec & Vv, gp_Vec & Vuu, gp_Vec & Vvv, gp_Vec & Vuv);

		/****************** TorusD3 ******************/
		/**** md5 signature: 42264545c46c4f2420a120c3477f0ab2 ****/
		%feature("compactdefaultargs") TorusD3;
		%feature("autodoc", "The following functions compute the parametric values corresponding to a given point on a elementary surface. the point should be on the surface.

Parameters
----------
U: float
V: float
Pos: gp_Ax3
MajorRadius: float
MinorRadius: float
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

Returns
-------
None
") TorusD3;
		static void TorusD3(const Standard_Real U, const Standard_Real V, const gp_Ax3 & Pos, const Standard_Real MajorRadius, const Standard_Real MinorRadius, gp_Pnt & P, gp_Vec & Vu, gp_Vec & Vv, gp_Vec & Vuu, gp_Vec & Vvv, gp_Vec & Vuv, gp_Vec & Vuuu, gp_Vec & Vvvv, gp_Vec & Vuuv, gp_Vec & Vuvv);

		/****************** TorusDN ******************/
		/**** md5 signature: 00b4b484ed3ba712a672d3596679e624 ****/
		%feature("compactdefaultargs") TorusDN;
		%feature("autodoc", "No available documentation.

Parameters
----------
U: float
V: float
Pos: gp_Ax3
MajorRadius: float
MinorRadius: float
Nu: int
Nv: int

Returns
-------
gp_Vec
") TorusDN;
		static gp_Vec TorusDN(const Standard_Real U, const Standard_Real V, const gp_Ax3 & Pos, const Standard_Real MajorRadius, const Standard_Real MinorRadius, const Standard_Integer Nu, const Standard_Integer Nv);

		/****************** TorusParameters ******************/
		/**** md5 signature: 1a64032b3e1405c9914a3b9c15478c78 ****/
		%feature("compactdefaultargs") TorusParameters;
		%feature("autodoc", "Parametrization p (u, v) = location + (majorradius + minorradius * cos(u)) * (cos(v) * xdirection - sin(v) * ydirection) + minorradius * sin(u) * zdirection.

Parameters
----------
Pos: gp_Ax3
MajorRadius: float
MinorRadius: float
P: gp_Pnt

Returns
-------
U: float
V: float
") TorusParameters;
		static void TorusParameters(const gp_Ax3 & Pos, const Standard_Real MajorRadius, const Standard_Real MinorRadius, const gp_Pnt & P, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** TorusUIso ******************/
		/**** md5 signature: 37fe7e3ec73cd2011b9cbf7dc39bd56b ****/
		%feature("compactdefaultargs") TorusUIso;
		%feature("autodoc", "Compute the u isoparametric gp_circ of the torus.

Parameters
----------
Pos: gp_Ax3
MajorRadius: float
MinorRadius: float
U: float

Returns
-------
gp_Circ
") TorusUIso;
		static gp_Circ TorusUIso(const gp_Ax3 & Pos, const Standard_Real MajorRadius, const Standard_Real MinorRadius, const Standard_Real U);

		/****************** TorusVIso ******************/
		/**** md5 signature: ab0c458ec8d335c887195482416c196d ****/
		%feature("compactdefaultargs") TorusVIso;
		%feature("autodoc", "Compute the v isoparametric gp_circ of the torus.

Parameters
----------
Pos: gp_Ax3
MajorRadius: float
MinorRadius: float
V: float

Returns
-------
gp_Circ
") TorusVIso;
		static gp_Circ TorusVIso(const gp_Ax3 & Pos, const Standard_Real MajorRadius, const Standard_Real MinorRadius, const Standard_Real V);

		/****************** TorusValue ******************/
		/**** md5 signature: 4c2a0ff740f61b4a46cea362acaa3364 ****/
		%feature("compactdefaultargs") TorusValue;
		%feature("autodoc", "No available documentation.

Parameters
----------
U: float
V: float
Pos: gp_Ax3
MajorRadius: float
MinorRadius: float

Returns
-------
gp_Pnt
") TorusValue;
		static gp_Pnt TorusValue(const Standard_Real U, const Standard_Real V, const gp_Ax3 & Pos, const Standard_Real MajorRadius, const Standard_Real MinorRadius);

		/****************** Value ******************/
		/**** md5 signature: 6f5bb1a556b8db99ba566296a1b87e73 ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "For elementary surfaces from the gp package (planes, cones, cylinders, spheres and tori), computes the point of parameters (u, v).

Parameters
----------
U: float
V: float
Pl: gp_Pln

Returns
-------
gp_Pnt
") Value;
		static gp_Pnt Value(const Standard_Real U, const Standard_Real V, const gp_Pln & Pl);

		/****************** Value ******************/
		/**** md5 signature: a373832afa323b501e93b7891b224ee1 ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "No available documentation.

Parameters
----------
U: float
V: float
C: gp_Cone

Returns
-------
gp_Pnt
") Value;
		static gp_Pnt Value(const Standard_Real U, const Standard_Real V, const gp_Cone & C);

		/****************** Value ******************/
		/**** md5 signature: 7c20fe60e441dc10e5d46525a67c4d1c ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "No available documentation.

Parameters
----------
U: float
V: float
C: gp_Cylinder

Returns
-------
gp_Pnt
") Value;
		static gp_Pnt Value(const Standard_Real U, const Standard_Real V, const gp_Cylinder & C);

		/****************** Value ******************/
		/**** md5 signature: f965d2cccc915fb129b4b68d50a21583 ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "No available documentation.

Parameters
----------
U: float
V: float
S: gp_Sphere

Returns
-------
gp_Pnt
") Value;
		static gp_Pnt Value(const Standard_Real U, const Standard_Real V, const gp_Sphere & S);

		/****************** Value ******************/
		/**** md5 signature: e8ae5be93a05a3539c4739aaa2248aab ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "No available documentation.

Parameters
----------
U: float
V: float
T: gp_Torus

Returns
-------
gp_Pnt
") Value;
		static gp_Pnt Value(const Standard_Real U, const Standard_Real V, const gp_Torus & T);

};


%extend ElSLib {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* harray1 classes */
/* harray2 classes */
/* hsequence classes */
