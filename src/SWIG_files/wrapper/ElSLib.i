/*
Copyright 2008-2014 Thomas Paviot (tpaviot@gmail.com)


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
%module ElSLib

#pragma SWIG nowarn=504,325,503

%{
#ifdef WNT
#pragma warning(disable : 4716)
#endif
%}

%include ../common/CommonIncludes.i
%include ../common/StandardDefines.i
%include ../common/ExceptionCatcher.i
%include ../common/FunctionTransformers.i
%include ../common/Operators.i

%include ElSLib_required_python_modules.i
%include ElSLib_headers.i

/* typedefs */
/* end typedefs declaration */

/* public enums */
/* end public enums declaration */

%rename(elslib) ElSLib;
%nodefaultctor ElSLib;
class ElSLib {
	public:
		%feature("autodoc", "Args:
	U(Standard_Real)
	V(Standard_Real)
	Pl(gp_Pln)

Returns:
	static gp_Pnt

For elementary surfaces from the gp package (planes,  
cones, cylinders, spheres and tori), computes the point  
of parameters (U, V).") Value;
		static gp_Pnt Value (const Standard_Real U,const Standard_Real V,const gp_Pln & Pl);
		%feature("autodoc", "Args:
	U(Standard_Real)
	V(Standard_Real)
	C(gp_Cone)

Returns:
	static gp_Pnt

No detailed docstring for this function.") Value;
		static gp_Pnt Value (const Standard_Real U,const Standard_Real V,const gp_Cone & C);
		%feature("autodoc", "Args:
	U(Standard_Real)
	V(Standard_Real)
	C(gp_Cylinder)

Returns:
	static gp_Pnt

No detailed docstring for this function.") Value;
		static gp_Pnt Value (const Standard_Real U,const Standard_Real V,const gp_Cylinder & C);
		%feature("autodoc", "Args:
	U(Standard_Real)
	V(Standard_Real)
	S(gp_Sphere)

Returns:
	static gp_Pnt

No detailed docstring for this function.") Value;
		static gp_Pnt Value (const Standard_Real U,const Standard_Real V,const gp_Sphere & S);
		%feature("autodoc", "Args:
	U(Standard_Real)
	V(Standard_Real)
	T(gp_Torus)

Returns:
	static gp_Pnt

No detailed docstring for this function.") Value;
		static gp_Pnt Value (const Standard_Real U,const Standard_Real V,const gp_Torus & T);
		%feature("autodoc", "Args:
	U(Standard_Real)
	V(Standard_Real)
	Pl(gp_Pln)
	Nu(Standard_Integer)
	Nv(Standard_Integer)

Returns:
	static gp_Vec

For elementary surfaces from the gp package (planes,  
cones, cylinders, spheres and tori), computes the  
derivative vector of order Nu and Nv in the u and v  
parametric directions respectively, at the point of  
parameters (U, V).") DN;
		static gp_Vec DN (const Standard_Real U,const Standard_Real V,const gp_Pln & Pl,const Standard_Integer Nu,const Standard_Integer Nv);
		%feature("autodoc", "Args:
	U(Standard_Real)
	V(Standard_Real)
	C(gp_Cone)
	Nu(Standard_Integer)
	Nv(Standard_Integer)

Returns:
	static gp_Vec

No detailed docstring for this function.") DN;
		static gp_Vec DN (const Standard_Real U,const Standard_Real V,const gp_Cone & C,const Standard_Integer Nu,const Standard_Integer Nv);
		%feature("autodoc", "Args:
	U(Standard_Real)
	V(Standard_Real)
	C(gp_Cylinder)
	Nu(Standard_Integer)
	Nv(Standard_Integer)

Returns:
	static gp_Vec

No detailed docstring for this function.") DN;
		static gp_Vec DN (const Standard_Real U,const Standard_Real V,const gp_Cylinder & C,const Standard_Integer Nu,const Standard_Integer Nv);
		%feature("autodoc", "Args:
	U(Standard_Real)
	V(Standard_Real)
	S(gp_Sphere)
	Nu(Standard_Integer)
	Nv(Standard_Integer)

Returns:
	static gp_Vec

No detailed docstring for this function.") DN;
		static gp_Vec DN (const Standard_Real U,const Standard_Real V,const gp_Sphere & S,const Standard_Integer Nu,const Standard_Integer Nv);
		%feature("autodoc", "Args:
	U(Standard_Real)
	V(Standard_Real)
	T(gp_Torus)
	Nu(Standard_Integer)
	Nv(Standard_Integer)

Returns:
	static gp_Vec

No detailed docstring for this function.") DN;
		static gp_Vec DN (const Standard_Real U,const Standard_Real V,const gp_Torus & T,const Standard_Integer Nu,const Standard_Integer Nv);
		%feature("autodoc", "Args:
	U(Standard_Real)
	V(Standard_Real)
	Pl(gp_Pln)
	P(gp_Pnt)

Returns:
	static void

For elementary surfaces from the gp package (planes,  
cones, cylinders, spheres and tori), computes the point P  
of parameters (U, V).inline") D0;
		static void D0 (const Standard_Real U,const Standard_Real V,const gp_Pln & Pl,gp_Pnt & P);
		%feature("autodoc", "Args:
	U(Standard_Real)
	V(Standard_Real)
	C(gp_Cone)
	P(gp_Pnt)

Returns:
	static void

No detailed docstring for this function.") D0;
		static void D0 (const Standard_Real U,const Standard_Real V,const gp_Cone & C,gp_Pnt & P);
		%feature("autodoc", "Args:
	U(Standard_Real)
	V(Standard_Real)
	C(gp_Cylinder)
	P(gp_Pnt)

Returns:
	static void

No detailed docstring for this function.") D0;
		static void D0 (const Standard_Real U,const Standard_Real V,const gp_Cylinder & C,gp_Pnt & P);
		%feature("autodoc", "Args:
	U(Standard_Real)
	V(Standard_Real)
	S(gp_Sphere)
	P(gp_Pnt)

Returns:
	static void

No detailed docstring for this function.") D0;
		static void D0 (const Standard_Real U,const Standard_Real V,const gp_Sphere & S,gp_Pnt & P);
		%feature("autodoc", "Args:
	U(Standard_Real)
	V(Standard_Real)
	T(gp_Torus)
	P(gp_Pnt)

Returns:
	static void

No detailed docstring for this function.") D0;
		static void D0 (const Standard_Real U,const Standard_Real V,const gp_Torus & T,gp_Pnt & P);
		%feature("autodoc", "Args:
	U(Standard_Real)
	V(Standard_Real)
	Pl(gp_Pln)
	P(gp_Pnt)
	Vu(gp_Vec)
	Vv(gp_Vec)

Returns:
	static void

For elementary surfaces from the gp package (planes,  
cones, cylinders, spheres and tori), computes:  
-   the point P of parameters (U, V), and  
-   the first derivative vectors Vu and Vv at this point in  
  the u and v parametric directions respectively.") D1;
		static void D1 (const Standard_Real U,const Standard_Real V,const gp_Pln & Pl,gp_Pnt & P,gp_Vec & Vu,gp_Vec & Vv);
		%feature("autodoc", "Args:
	U(Standard_Real)
	V(Standard_Real)
	C(gp_Cone)
	P(gp_Pnt)
	Vu(gp_Vec)
	Vv(gp_Vec)

Returns:
	static void

No detailed docstring for this function.") D1;
		static void D1 (const Standard_Real U,const Standard_Real V,const gp_Cone & C,gp_Pnt & P,gp_Vec & Vu,gp_Vec & Vv);
		%feature("autodoc", "Args:
	U(Standard_Real)
	V(Standard_Real)
	C(gp_Cylinder)
	P(gp_Pnt)
	Vu(gp_Vec)
	Vv(gp_Vec)

Returns:
	static void

No detailed docstring for this function.") D1;
		static void D1 (const Standard_Real U,const Standard_Real V,const gp_Cylinder & C,gp_Pnt & P,gp_Vec & Vu,gp_Vec & Vv);
		%feature("autodoc", "Args:
	U(Standard_Real)
	V(Standard_Real)
	S(gp_Sphere)
	P(gp_Pnt)
	Vu(gp_Vec)
	Vv(gp_Vec)

Returns:
	static void

No detailed docstring for this function.") D1;
		static void D1 (const Standard_Real U,const Standard_Real V,const gp_Sphere & S,gp_Pnt & P,gp_Vec & Vu,gp_Vec & Vv);
		%feature("autodoc", "Args:
	U(Standard_Real)
	V(Standard_Real)
	T(gp_Torus)
	P(gp_Pnt)
	Vu(gp_Vec)
	Vv(gp_Vec)

Returns:
	static void

No detailed docstring for this function.") D1;
		static void D1 (const Standard_Real U,const Standard_Real V,const gp_Torus & T,gp_Pnt & P,gp_Vec & Vu,gp_Vec & Vv);
		%feature("autodoc", "Args:
	U(Standard_Real)
	V(Standard_Real)
	C(gp_Cone)
	P(gp_Pnt)
	Vu(gp_Vec)
	Vv(gp_Vec)
	Vuu(gp_Vec)
	Vvv(gp_Vec)
	Vuv(gp_Vec)

Returns:
	static void

For elementary surfaces from the gp package (cones,  
cylinders, spheres and tori), computes:  
-   the point P of parameters (U, V), and  
-   the first derivative vectors Vu and Vv at this point in  
  the u and v parametric directions respectively, and  
-   the second derivative vectors Vuu, Vvv and Vuv at this point.") D2;
		static void D2 (const Standard_Real U,const Standard_Real V,const gp_Cone & C,gp_Pnt & P,gp_Vec & Vu,gp_Vec & Vv,gp_Vec & Vuu,gp_Vec & Vvv,gp_Vec & Vuv);
		%feature("autodoc", "Args:
	U(Standard_Real)
	V(Standard_Real)
	C(gp_Cylinder)
	P(gp_Pnt)
	Vu(gp_Vec)
	Vv(gp_Vec)
	Vuu(gp_Vec)
	Vvv(gp_Vec)
	Vuv(gp_Vec)

Returns:
	static void

No detailed docstring for this function.") D2;
		static void D2 (const Standard_Real U,const Standard_Real V,const gp_Cylinder & C,gp_Pnt & P,gp_Vec & Vu,gp_Vec & Vv,gp_Vec & Vuu,gp_Vec & Vvv,gp_Vec & Vuv);
		%feature("autodoc", "Args:
	U(Standard_Real)
	V(Standard_Real)
	S(gp_Sphere)
	P(gp_Pnt)
	Vu(gp_Vec)
	Vv(gp_Vec)
	Vuu(gp_Vec)
	Vvv(gp_Vec)
	Vuv(gp_Vec)

Returns:
	static void

No detailed docstring for this function.") D2;
		static void D2 (const Standard_Real U,const Standard_Real V,const gp_Sphere & S,gp_Pnt & P,gp_Vec & Vu,gp_Vec & Vv,gp_Vec & Vuu,gp_Vec & Vvv,gp_Vec & Vuv);
		%feature("autodoc", "Args:
	U(Standard_Real)
	V(Standard_Real)
	T(gp_Torus)
	P(gp_Pnt)
	Vu(gp_Vec)
	Vv(gp_Vec)
	Vuu(gp_Vec)
	Vvv(gp_Vec)
	Vuv(gp_Vec)

Returns:
	static void

No detailed docstring for this function.") D2;
		static void D2 (const Standard_Real U,const Standard_Real V,const gp_Torus & T,gp_Pnt & P,gp_Vec & Vu,gp_Vec & Vv,gp_Vec & Vuu,gp_Vec & Vvv,gp_Vec & Vuv);
		%feature("autodoc", "Args:
	U(Standard_Real)
	V(Standard_Real)
	C(gp_Cone)
	P(gp_Pnt)
	Vu(gp_Vec)
	Vv(gp_Vec)
	Vuu(gp_Vec)
	Vvv(gp_Vec)
	Vuv(gp_Vec)
	Vuuu(gp_Vec)
	Vvvv(gp_Vec)
	Vuuv(gp_Vec)
	Vuvv(gp_Vec)

Returns:
	static void

For elementary surfaces from the gp package (cones,  
cylinders, spheres and tori), computes:  
-   the point P of parameters (U,V), and  
-   the first derivative vectors Vu and Vv at this point in  
  the u and v parametric directions respectively, and  
-   the second derivative vectors Vuu, Vvv and Vuv at  
  this point, and  
-   the third derivative vectors Vuuu, Vvvv, Vuuv and  
  Vuvv at this point.") D3;
		static void D3 (const Standard_Real U,const Standard_Real V,const gp_Cone & C,gp_Pnt & P,gp_Vec & Vu,gp_Vec & Vv,gp_Vec & Vuu,gp_Vec & Vvv,gp_Vec & Vuv,gp_Vec & Vuuu,gp_Vec & Vvvv,gp_Vec & Vuuv,gp_Vec & Vuvv);
		%feature("autodoc", "Args:
	U(Standard_Real)
	V(Standard_Real)
	C(gp_Cylinder)
	P(gp_Pnt)
	Vu(gp_Vec)
	Vv(gp_Vec)
	Vuu(gp_Vec)
	Vvv(gp_Vec)
	Vuv(gp_Vec)
	Vuuu(gp_Vec)
	Vvvv(gp_Vec)
	Vuuv(gp_Vec)
	Vuvv(gp_Vec)

Returns:
	static void

No detailed docstring for this function.") D3;
		static void D3 (const Standard_Real U,const Standard_Real V,const gp_Cylinder & C,gp_Pnt & P,gp_Vec & Vu,gp_Vec & Vv,gp_Vec & Vuu,gp_Vec & Vvv,gp_Vec & Vuv,gp_Vec & Vuuu,gp_Vec & Vvvv,gp_Vec & Vuuv,gp_Vec & Vuvv);
		%feature("autodoc", "Args:
	U(Standard_Real)
	V(Standard_Real)
	S(gp_Sphere)
	P(gp_Pnt)
	Vu(gp_Vec)
	Vv(gp_Vec)
	Vuu(gp_Vec)
	Vvv(gp_Vec)
	Vuv(gp_Vec)
	Vuuu(gp_Vec)
	Vvvv(gp_Vec)
	Vuuv(gp_Vec)
	Vuvv(gp_Vec)

Returns:
	static void

No detailed docstring for this function.") D3;
		static void D3 (const Standard_Real U,const Standard_Real V,const gp_Sphere & S,gp_Pnt & P,gp_Vec & Vu,gp_Vec & Vv,gp_Vec & Vuu,gp_Vec & Vvv,gp_Vec & Vuv,gp_Vec & Vuuu,gp_Vec & Vvvv,gp_Vec & Vuuv,gp_Vec & Vuvv);
		%feature("autodoc", "Args:
	U(Standard_Real)
	V(Standard_Real)
	T(gp_Torus)
	P(gp_Pnt)
	Vu(gp_Vec)
	Vv(gp_Vec)
	Vuu(gp_Vec)
	Vvv(gp_Vec)
	Vuv(gp_Vec)
	Vuuu(gp_Vec)
	Vvvv(gp_Vec)
	Vuuv(gp_Vec)
	Vuvv(gp_Vec)

Returns:
	static void

Surface evaluation  
 The following functions compute the point and the  
 derivatives on elementary surfaces defined with their  
 geometric characterisitics.  
 You don't need to create the surface to use these functions.  
 These functions are called by the previous  ones.  
Example :  
 A cylinder is defined with its position and its radius.") D3;
		static void D3 (const Standard_Real U,const Standard_Real V,const gp_Torus & T,gp_Pnt & P,gp_Vec & Vu,gp_Vec & Vv,gp_Vec & Vuu,gp_Vec & Vvv,gp_Vec & Vuv,gp_Vec & Vuuu,gp_Vec & Vvvv,gp_Vec & Vuuv,gp_Vec & Vuvv);
		%feature("autodoc", "Args:
	U(Standard_Real)
	V(Standard_Real)
	Pos(gp_Ax3)

Returns:
	static gp_Pnt

No detailed docstring for this function.") PlaneValue;
		static gp_Pnt PlaneValue (const Standard_Real U,const Standard_Real V,const gp_Ax3 & Pos);
		%feature("autodoc", "Args:
	U(Standard_Real)
	V(Standard_Real)
	Pos(gp_Ax3)
	Radius(Standard_Real)

Returns:
	static gp_Pnt

No detailed docstring for this function.") CylinderValue;
		static gp_Pnt CylinderValue (const Standard_Real U,const Standard_Real V,const gp_Ax3 & Pos,const Standard_Real Radius);
		%feature("autodoc", "Args:
	U(Standard_Real)
	V(Standard_Real)
	Pos(gp_Ax3)
	Radius(Standard_Real)
	SAngle(Standard_Real)

Returns:
	static gp_Pnt

No detailed docstring for this function.") ConeValue;
		static gp_Pnt ConeValue (const Standard_Real U,const Standard_Real V,const gp_Ax3 & Pos,const Standard_Real Radius,const Standard_Real SAngle);
		%feature("autodoc", "Args:
	U(Standard_Real)
	V(Standard_Real)
	Pos(gp_Ax3)
	Radius(Standard_Real)

Returns:
	static gp_Pnt

No detailed docstring for this function.") SphereValue;
		static gp_Pnt SphereValue (const Standard_Real U,const Standard_Real V,const gp_Ax3 & Pos,const Standard_Real Radius);
		%feature("autodoc", "Args:
	U(Standard_Real)
	V(Standard_Real)
	Pos(gp_Ax3)
	MajorRadius(Standard_Real)
	MinorRadius(Standard_Real)

Returns:
	static gp_Pnt

No detailed docstring for this function.") TorusValue;
		static gp_Pnt TorusValue (const Standard_Real U,const Standard_Real V,const gp_Ax3 & Pos,const Standard_Real MajorRadius,const Standard_Real MinorRadius);
		%feature("autodoc", "Args:
	U(Standard_Real)
	V(Standard_Real)
	Pos(gp_Ax3)
	Nu(Standard_Integer)
	Nv(Standard_Integer)

Returns:
	static gp_Vec

No detailed docstring for this function.") PlaneDN;
		static gp_Vec PlaneDN (const Standard_Real U,const Standard_Real V,const gp_Ax3 & Pos,const Standard_Integer Nu,const Standard_Integer Nv);
		%feature("autodoc", "Args:
	U(Standard_Real)
	V(Standard_Real)
	Pos(gp_Ax3)
	Radius(Standard_Real)
	Nu(Standard_Integer)
	Nv(Standard_Integer)

Returns:
	static gp_Vec

No detailed docstring for this function.") CylinderDN;
		static gp_Vec CylinderDN (const Standard_Real U,const Standard_Real V,const gp_Ax3 & Pos,const Standard_Real Radius,const Standard_Integer Nu,const Standard_Integer Nv);
		%feature("autodoc", "Args:
	U(Standard_Real)
	V(Standard_Real)
	Pos(gp_Ax3)
	Radius(Standard_Real)
	SAngle(Standard_Real)
	Nu(Standard_Integer)
	Nv(Standard_Integer)

Returns:
	static gp_Vec

No detailed docstring for this function.") ConeDN;
		static gp_Vec ConeDN (const Standard_Real U,const Standard_Real V,const gp_Ax3 & Pos,const Standard_Real Radius,const Standard_Real SAngle,const Standard_Integer Nu,const Standard_Integer Nv);
		%feature("autodoc", "Args:
	U(Standard_Real)
	V(Standard_Real)
	Pos(gp_Ax3)
	Radius(Standard_Real)
	Nu(Standard_Integer)
	Nv(Standard_Integer)

Returns:
	static gp_Vec

No detailed docstring for this function.") SphereDN;
		static gp_Vec SphereDN (const Standard_Real U,const Standard_Real V,const gp_Ax3 & Pos,const Standard_Real Radius,const Standard_Integer Nu,const Standard_Integer Nv);
		%feature("autodoc", "Args:
	U(Standard_Real)
	V(Standard_Real)
	Pos(gp_Ax3)
	MajorRadius(Standard_Real)
	MinorRadius(Standard_Real)
	Nu(Standard_Integer)
	Nv(Standard_Integer)

Returns:
	static gp_Vec

No detailed docstring for this function.") TorusDN;
		static gp_Vec TorusDN (const Standard_Real U,const Standard_Real V,const gp_Ax3 & Pos,const Standard_Real MajorRadius,const Standard_Real MinorRadius,const Standard_Integer Nu,const Standard_Integer Nv);
		%feature("autodoc", "Args:
	U(Standard_Real)
	V(Standard_Real)
	Pos(gp_Ax3)
	P(gp_Pnt)

Returns:
	static void

No detailed docstring for this function.") PlaneD0;
		static void PlaneD0 (const Standard_Real U,const Standard_Real V,const gp_Ax3 & Pos,gp_Pnt & P);
		%feature("autodoc", "Args:
	U(Standard_Real)
	V(Standard_Real)
	Pos(gp_Ax3)
	Radius(Standard_Real)
	SAngle(Standard_Real)
	P(gp_Pnt)

Returns:
	static void

No detailed docstring for this function.") ConeD0;
		static void ConeD0 (const Standard_Real U,const Standard_Real V,const gp_Ax3 & Pos,const Standard_Real Radius,const Standard_Real SAngle,gp_Pnt & P);
		%feature("autodoc", "Args:
	U(Standard_Real)
	V(Standard_Real)
	Pos(gp_Ax3)
	Radius(Standard_Real)
	P(gp_Pnt)

Returns:
	static void

No detailed docstring for this function.") CylinderD0;
		static void CylinderD0 (const Standard_Real U,const Standard_Real V,const gp_Ax3 & Pos,const Standard_Real Radius,gp_Pnt & P);
		%feature("autodoc", "Args:
	U(Standard_Real)
	V(Standard_Real)
	Pos(gp_Ax3)
	Radius(Standard_Real)
	P(gp_Pnt)

Returns:
	static void

No detailed docstring for this function.") SphereD0;
		static void SphereD0 (const Standard_Real U,const Standard_Real V,const gp_Ax3 & Pos,const Standard_Real Radius,gp_Pnt & P);
		%feature("autodoc", "Args:
	U(Standard_Real)
	V(Standard_Real)
	Pos(gp_Ax3)
	MajorRadius(Standard_Real)
	MinorRadius(Standard_Real)
	P(gp_Pnt)

Returns:
	static void

No detailed docstring for this function.") TorusD0;
		static void TorusD0 (const Standard_Real U,const Standard_Real V,const gp_Ax3 & Pos,const Standard_Real MajorRadius,const Standard_Real MinorRadius,gp_Pnt & P);
		%feature("autodoc", "Args:
	U(Standard_Real)
	V(Standard_Real)
	Pos(gp_Ax3)
	P(gp_Pnt)
	Vu(gp_Vec)
	Vv(gp_Vec)

Returns:
	static void

No detailed docstring for this function.") PlaneD1;
		static void PlaneD1 (const Standard_Real U,const Standard_Real V,const gp_Ax3 & Pos,gp_Pnt & P,gp_Vec & Vu,gp_Vec & Vv);
		%feature("autodoc", "Args:
	U(Standard_Real)
	V(Standard_Real)
	Pos(gp_Ax3)
	Radius(Standard_Real)
	SAngle(Standard_Real)
	P(gp_Pnt)
	Vu(gp_Vec)
	Vv(gp_Vec)

Returns:
	static void

No detailed docstring for this function.") ConeD1;
		static void ConeD1 (const Standard_Real U,const Standard_Real V,const gp_Ax3 & Pos,const Standard_Real Radius,const Standard_Real SAngle,gp_Pnt & P,gp_Vec & Vu,gp_Vec & Vv);
		%feature("autodoc", "Args:
	U(Standard_Real)
	V(Standard_Real)
	Pos(gp_Ax3)
	Radius(Standard_Real)
	P(gp_Pnt)
	Vu(gp_Vec)
	Vv(gp_Vec)

Returns:
	static void

No detailed docstring for this function.") CylinderD1;
		static void CylinderD1 (const Standard_Real U,const Standard_Real V,const gp_Ax3 & Pos,const Standard_Real Radius,gp_Pnt & P,gp_Vec & Vu,gp_Vec & Vv);
		%feature("autodoc", "Args:
	U(Standard_Real)
	V(Standard_Real)
	Pos(gp_Ax3)
	Radius(Standard_Real)
	P(gp_Pnt)
	Vu(gp_Vec)
	Vv(gp_Vec)

Returns:
	static void

No detailed docstring for this function.") SphereD1;
		static void SphereD1 (const Standard_Real U,const Standard_Real V,const gp_Ax3 & Pos,const Standard_Real Radius,gp_Pnt & P,gp_Vec & Vu,gp_Vec & Vv);
		%feature("autodoc", "Args:
	U(Standard_Real)
	V(Standard_Real)
	Pos(gp_Ax3)
	MajorRadius(Standard_Real)
	MinorRadius(Standard_Real)
	P(gp_Pnt)
	Vu(gp_Vec)
	Vv(gp_Vec)

Returns:
	static void

No detailed docstring for this function.") TorusD1;
		static void TorusD1 (const Standard_Real U,const Standard_Real V,const gp_Ax3 & Pos,const Standard_Real MajorRadius,const Standard_Real MinorRadius,gp_Pnt & P,gp_Vec & Vu,gp_Vec & Vv);
		%feature("autodoc", "Args:
	U(Standard_Real)
	V(Standard_Real)
	Pos(gp_Ax3)
	Radius(Standard_Real)
	SAngle(Standard_Real)
	P(gp_Pnt)
	Vu(gp_Vec)
	Vv(gp_Vec)
	Vuu(gp_Vec)
	Vvv(gp_Vec)
	Vuv(gp_Vec)

Returns:
	static void

No detailed docstring for this function.") ConeD2;
		static void ConeD2 (const Standard_Real U,const Standard_Real V,const gp_Ax3 & Pos,const Standard_Real Radius,const Standard_Real SAngle,gp_Pnt & P,gp_Vec & Vu,gp_Vec & Vv,gp_Vec & Vuu,gp_Vec & Vvv,gp_Vec & Vuv);
		%feature("autodoc", "Args:
	U(Standard_Real)
	V(Standard_Real)
	Pos(gp_Ax3)
	Radius(Standard_Real)
	P(gp_Pnt)
	Vu(gp_Vec)
	Vv(gp_Vec)
	Vuu(gp_Vec)
	Vvv(gp_Vec)
	Vuv(gp_Vec)

Returns:
	static void

No detailed docstring for this function.") CylinderD2;
		static void CylinderD2 (const Standard_Real U,const Standard_Real V,const gp_Ax3 & Pos,const Standard_Real Radius,gp_Pnt & P,gp_Vec & Vu,gp_Vec & Vv,gp_Vec & Vuu,gp_Vec & Vvv,gp_Vec & Vuv);
		%feature("autodoc", "Args:
	U(Standard_Real)
	V(Standard_Real)
	Pos(gp_Ax3)
	Radius(Standard_Real)
	P(gp_Pnt)
	Vu(gp_Vec)
	Vv(gp_Vec)
	Vuu(gp_Vec)
	Vvv(gp_Vec)
	Vuv(gp_Vec)

Returns:
	static void

No detailed docstring for this function.") SphereD2;
		static void SphereD2 (const Standard_Real U,const Standard_Real V,const gp_Ax3 & Pos,const Standard_Real Radius,gp_Pnt & P,gp_Vec & Vu,gp_Vec & Vv,gp_Vec & Vuu,gp_Vec & Vvv,gp_Vec & Vuv);
		%feature("autodoc", "Args:
	U(Standard_Real)
	V(Standard_Real)
	Pos(gp_Ax3)
	MajorRadius(Standard_Real)
	MinorRadius(Standard_Real)
	P(gp_Pnt)
	Vu(gp_Vec)
	Vv(gp_Vec)
	Vuu(gp_Vec)
	Vvv(gp_Vec)
	Vuv(gp_Vec)

Returns:
	static void

No detailed docstring for this function.") TorusD2;
		static void TorusD2 (const Standard_Real U,const Standard_Real V,const gp_Ax3 & Pos,const Standard_Real MajorRadius,const Standard_Real MinorRadius,gp_Pnt & P,gp_Vec & Vu,gp_Vec & Vv,gp_Vec & Vuu,gp_Vec & Vvv,gp_Vec & Vuv);
		%feature("autodoc", "Args:
	U(Standard_Real)
	V(Standard_Real)
	Pos(gp_Ax3)
	Radius(Standard_Real)
	SAngle(Standard_Real)
	P(gp_Pnt)
	Vu(gp_Vec)
	Vv(gp_Vec)
	Vuu(gp_Vec)
	Vvv(gp_Vec)
	Vuv(gp_Vec)
	Vuuu(gp_Vec)
	Vvvv(gp_Vec)
	Vuuv(gp_Vec)
	Vuvv(gp_Vec)

Returns:
	static void

No detailed docstring for this function.") ConeD3;
		static void ConeD3 (const Standard_Real U,const Standard_Real V,const gp_Ax3 & Pos,const Standard_Real Radius,const Standard_Real SAngle,gp_Pnt & P,gp_Vec & Vu,gp_Vec & Vv,gp_Vec & Vuu,gp_Vec & Vvv,gp_Vec & Vuv,gp_Vec & Vuuu,gp_Vec & Vvvv,gp_Vec & Vuuv,gp_Vec & Vuvv);
		%feature("autodoc", "Args:
	U(Standard_Real)
	V(Standard_Real)
	Pos(gp_Ax3)
	Radius(Standard_Real)
	P(gp_Pnt)
	Vu(gp_Vec)
	Vv(gp_Vec)
	Vuu(gp_Vec)
	Vvv(gp_Vec)
	Vuv(gp_Vec)
	Vuuu(gp_Vec)
	Vvvv(gp_Vec)
	Vuuv(gp_Vec)
	Vuvv(gp_Vec)

Returns:
	static void

No detailed docstring for this function.") CylinderD3;
		static void CylinderD3 (const Standard_Real U,const Standard_Real V,const gp_Ax3 & Pos,const Standard_Real Radius,gp_Pnt & P,gp_Vec & Vu,gp_Vec & Vv,gp_Vec & Vuu,gp_Vec & Vvv,gp_Vec & Vuv,gp_Vec & Vuuu,gp_Vec & Vvvv,gp_Vec & Vuuv,gp_Vec & Vuvv);
		%feature("autodoc", "Args:
	U(Standard_Real)
	V(Standard_Real)
	Pos(gp_Ax3)
	Radius(Standard_Real)
	P(gp_Pnt)
	Vu(gp_Vec)
	Vv(gp_Vec)
	Vuu(gp_Vec)
	Vvv(gp_Vec)
	Vuv(gp_Vec)
	Vuuu(gp_Vec)
	Vvvv(gp_Vec)
	Vuuv(gp_Vec)
	Vuvv(gp_Vec)

Returns:
	static void

No detailed docstring for this function.") SphereD3;
		static void SphereD3 (const Standard_Real U,const Standard_Real V,const gp_Ax3 & Pos,const Standard_Real Radius,gp_Pnt & P,gp_Vec & Vu,gp_Vec & Vv,gp_Vec & Vuu,gp_Vec & Vvv,gp_Vec & Vuv,gp_Vec & Vuuu,gp_Vec & Vvvv,gp_Vec & Vuuv,gp_Vec & Vuvv);
		%feature("autodoc", "Args:
	U(Standard_Real)
	V(Standard_Real)
	Pos(gp_Ax3)
	MajorRadius(Standard_Real)
	MinorRadius(Standard_Real)
	P(gp_Pnt)
	Vu(gp_Vec)
	Vv(gp_Vec)
	Vuu(gp_Vec)
	Vvv(gp_Vec)
	Vuv(gp_Vec)
	Vuuu(gp_Vec)
	Vvvv(gp_Vec)
	Vuuv(gp_Vec)
	Vuvv(gp_Vec)

Returns:
	static void

The following functions compute the parametric values  
 corresponding to a given point on a elementary surface.  
 The point should be on the surface.") TorusD3;
		static void TorusD3 (const Standard_Real U,const Standard_Real V,const gp_Ax3 & Pos,const Standard_Real MajorRadius,const Standard_Real MinorRadius,gp_Pnt & P,gp_Vec & Vu,gp_Vec & Vv,gp_Vec & Vuu,gp_Vec & Vvv,gp_Vec & Vuv,gp_Vec & Vuuu,gp_Vec & Vvvv,gp_Vec & Vuuv,gp_Vec & Vuvv);
		%feature("autodoc", "Args:
	Pl(gp_Pln)
	P(gp_Pnt)
	U(Standard_Real)
	V(Standard_Real)

Returns:
	static void

parametrization  
 P (U, V) =  
 Pl.Location() + U * Pl.XDirection() + V * Pl.YDirection()") Parameters;
		static void Parameters (const gp_Pln & Pl,const gp_Pnt & P,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	C(gp_Cylinder)
	P(gp_Pnt)
	U(Standard_Real)
	V(Standard_Real)

Returns:
	static void

parametrization  
 P (U, V) = Location + V * ZDirection +  
 Radius * (Cos(U) * XDirection + Sin (U) * YDirection)") Parameters;
		static void Parameters (const gp_Cylinder & C,const gp_Pnt & P,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	C(gp_Cone)
	P(gp_Pnt)
	U(Standard_Real)
	V(Standard_Real)

Returns:
	static void

parametrization  
 P (U, V) =  Location + V * ZDirection +  
 (Radius + V * Tan (SemiAngle)) *  
 (Cos(U) * XDirection + Sin(U) * YDirection)") Parameters;
		static void Parameters (const gp_Cone & C,const gp_Pnt & P,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	S(gp_Sphere)
	P(gp_Pnt)
	U(Standard_Real)
	V(Standard_Real)

Returns:
	static void

parametrization  
 P (U, V) = Location +  
 Radius * Cos (V) * (Cos (U) * XDirection + Sin (U) * YDirection) +  
 Radius * Sin (V) * ZDirection") Parameters;
		static void Parameters (const gp_Sphere & S,const gp_Pnt & P,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	T(gp_Torus)
	P(gp_Pnt)
	U(Standard_Real)
	V(Standard_Real)

Returns:
	static void

parametrization  
 P (U, V) = Location +  
 (MajorRadius + MinorRadius * Cos(U)) *  
 (Cos(V) * XDirection - Sin(V) * YDirection) +  
 MinorRadius * Sin(U) * ZDirection") Parameters;
		static void Parameters (const gp_Torus & T,const gp_Pnt & P,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	Pos(gp_Ax3)
	P(gp_Pnt)
	U(Standard_Real)
	V(Standard_Real)

Returns:
	static void

parametrization  
 P (U, V) =  
 Pl.Location() + U * Pl.XDirection() + V * Pl.YDirection()") PlaneParameters;
		static void PlaneParameters (const gp_Ax3 & Pos,const gp_Pnt & P,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	Pos(gp_Ax3)
	Radius(Standard_Real)
	P(gp_Pnt)
	U(Standard_Real)
	V(Standard_Real)

Returns:
	static void

parametrization  
 P (U, V) = Location + V * ZDirection +  
 Radius * (Cos(U) * XDirection + Sin (U) * YDirection)") CylinderParameters;
		static void CylinderParameters (const gp_Ax3 & Pos,const Standard_Real Radius,const gp_Pnt & P,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	Pos(gp_Ax3)
	Radius(Standard_Real)
	SAngle(Standard_Real)
	P(gp_Pnt)
	U(Standard_Real)
	V(Standard_Real)

Returns:
	static void

parametrization  
 P (U, V) =  Location + V * ZDirection +  
 (Radius + V * Tan (SemiAngle)) *  
 (Cos(U) * XDirection + Sin(U) * YDirection)") ConeParameters;
		static void ConeParameters (const gp_Ax3 & Pos,const Standard_Real Radius,const Standard_Real SAngle,const gp_Pnt & P,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	Pos(gp_Ax3)
	Radius(Standard_Real)
	P(gp_Pnt)
	U(Standard_Real)
	V(Standard_Real)

Returns:
	static void

parametrization  
 P (U, V) = Location +  
 Radius * Cos (V) * (Cos (U) * XDirection + Sin (U) * YDirection) +  
 Radius * Sin (V) * ZDirection") SphereParameters;
		static void SphereParameters (const gp_Ax3 & Pos,const Standard_Real Radius,const gp_Pnt & P,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	Pos(gp_Ax3)
	MajorRadius(Standard_Real)
	MinorRadius(Standard_Real)
	P(gp_Pnt)
	U(Standard_Real)
	V(Standard_Real)

Returns:
	static void

parametrization  
 P (U, V) = Location +  
 (MajorRadius + MinorRadius * Cos(U)) *  
 (Cos(V) * XDirection - Sin(V) * YDirection) +  
 MinorRadius * Sin(U) * ZDirection") TorusParameters;
		static void TorusParameters (const gp_Ax3 & Pos,const Standard_Real MajorRadius,const Standard_Real MinorRadius,const gp_Pnt & P,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	Pos(gp_Ax3)
	U(Standard_Real)

Returns:
	static gp_Lin

compute the U Isoparametric gp_Lin of the plane.") PlaneUIso;
		static gp_Lin PlaneUIso (const gp_Ax3 & Pos,const Standard_Real U);
		%feature("autodoc", "Args:
	Pos(gp_Ax3)
	Radius(Standard_Real)
	U(Standard_Real)

Returns:
	static gp_Lin

compute the U Isoparametric gp_Lin of the cylinder.") CylinderUIso;
		static gp_Lin CylinderUIso (const gp_Ax3 & Pos,const Standard_Real Radius,const Standard_Real U);
		%feature("autodoc", "Args:
	Pos(gp_Ax3)
	Radius(Standard_Real)
	SAngle(Standard_Real)
	U(Standard_Real)

Returns:
	static gp_Lin

compute the U Isoparametric gp_Lin of the cone.") ConeUIso;
		static gp_Lin ConeUIso (const gp_Ax3 & Pos,const Standard_Real Radius,const Standard_Real SAngle,const Standard_Real U);
		%feature("autodoc", "Args:
	Pos(gp_Ax3)
	Radius(Standard_Real)
	U(Standard_Real)

Returns:
	static gp_Circ

compute the U Isoparametric gp_Circ of the sphere,  
 (the meridian is not trimmed).") SphereUIso;
		static gp_Circ SphereUIso (const gp_Ax3 & Pos,const Standard_Real Radius,const Standard_Real U);
		%feature("autodoc", "Args:
	Pos(gp_Ax3)
	MajorRadius(Standard_Real)
	MinorRadius(Standard_Real)
	U(Standard_Real)

Returns:
	static gp_Circ

compute the U Isoparametric gp_Circ of the torus.") TorusUIso;
		static gp_Circ TorusUIso (const gp_Ax3 & Pos,const Standard_Real MajorRadius,const Standard_Real MinorRadius,const Standard_Real U);
		%feature("autodoc", "Args:
	Pos(gp_Ax3)
	V(Standard_Real)

Returns:
	static gp_Lin

compute the V Isoparametric gp_Lin of the plane.") PlaneVIso;
		static gp_Lin PlaneVIso (const gp_Ax3 & Pos,const Standard_Real V);
		%feature("autodoc", "Args:
	Pos(gp_Ax3)
	Radius(Standard_Real)
	V(Standard_Real)

Returns:
	static gp_Circ

compute the V Isoparametric gp_Circ of the cylinder.") CylinderVIso;
		static gp_Circ CylinderVIso (const gp_Ax3 & Pos,const Standard_Real Radius,const Standard_Real V);
		%feature("autodoc", "Args:
	Pos(gp_Ax3)
	Radius(Standard_Real)
	SAngle(Standard_Real)
	V(Standard_Real)

Returns:
	static gp_Circ

compute the V Isoparametric gp_Circ of the cone.") ConeVIso;
		static gp_Circ ConeVIso (const gp_Ax3 & Pos,const Standard_Real Radius,const Standard_Real SAngle,const Standard_Real V);
		%feature("autodoc", "Args:
	Pos(gp_Ax3)
	Radius(Standard_Real)
	V(Standard_Real)

Returns:
	static gp_Circ

compute the V Isoparametric gp_Circ of the sphere,  
 (the meridian is not trimmed).") SphereVIso;
		static gp_Circ SphereVIso (const gp_Ax3 & Pos,const Standard_Real Radius,const Standard_Real V);
		%feature("autodoc", "Args:
	Pos(gp_Ax3)
	MajorRadius(Standard_Real)
	MinorRadius(Standard_Real)
	V(Standard_Real)

Returns:
	static gp_Circ

compute the V Isoparametric gp_Circ of the torus.") TorusVIso;
		static gp_Circ TorusVIso (const gp_Ax3 & Pos,const Standard_Real MajorRadius,const Standard_Real MinorRadius,const Standard_Real V);
};


%feature("shadow") ElSLib::~ElSLib %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend ElSLib {
	void _kill_pointed() {
		delete $self;
	}
};
