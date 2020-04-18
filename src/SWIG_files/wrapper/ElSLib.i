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
