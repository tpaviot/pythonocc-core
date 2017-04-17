/*
Copyright 2008-2017 Thomas Paviot (tpaviot@gmail.com)


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
%module (package="OCC") ElSLib

#pragma SWIG nowarn=504,325,503

%{
#ifdef WNT
#pragma warning(disable : 4716)
#endif
%}

%include ../common/CommonIncludes.i
%include ../common/ExceptionCatcher.i
%include ../common/FunctionTransformers.i
%include ../common/Operators.i


%include ElSLib_headers.i


%pythoncode {
def register_handle(handle, base_object):
    """
    Inserts the handle into the base object to
    prevent memory corruption in certain cases
    """
    try:
        if base_object.IsKind("Standard_Transient"):
            base_object.thisHandle = handle
            base_object.thisown = False
    except:
        pass
};

/* typedefs */
/* end typedefs declaration */

/* public enums */
/* end public enums declaration */

%rename(elslib) ElSLib;
class ElSLib {
	public:
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	* For elementary surfaces from the gp package (planes, cones, cylinders, spheres and tori), computes the point of parameters (U, V).

	:param U:
	:type U: float
	:param V:
	:type V: float
	:param Pl:
	:type Pl: gp_Pln
	:rtype: gp_Pnt
") Value;
		static gp_Pnt Value (const Standard_Real U,const Standard_Real V,const gp_Pln & Pl);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param U:
	:type U: float
	:param V:
	:type V: float
	:param C:
	:type C: gp_Cone
	:rtype: gp_Pnt
") Value;
		static gp_Pnt Value (const Standard_Real U,const Standard_Real V,const gp_Cone & C);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param U:
	:type U: float
	:param V:
	:type V: float
	:param C:
	:type C: gp_Cylinder
	:rtype: gp_Pnt
") Value;
		static gp_Pnt Value (const Standard_Real U,const Standard_Real V,const gp_Cylinder & C);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param U:
	:type U: float
	:param V:
	:type V: float
	:param S:
	:type S: gp_Sphere
	:rtype: gp_Pnt
") Value;
		static gp_Pnt Value (const Standard_Real U,const Standard_Real V,const gp_Sphere & S);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param U:
	:type U: float
	:param V:
	:type V: float
	:param T:
	:type T: gp_Torus
	:rtype: gp_Pnt
") Value;
		static gp_Pnt Value (const Standard_Real U,const Standard_Real V,const gp_Torus & T);
		%feature("compactdefaultargs") DN;
		%feature("autodoc", "	* For elementary surfaces from the gp package (planes, cones, cylinders, spheres and tori), computes the derivative vector of order Nu and Nv in the u and v parametric directions respectively, at the point of parameters (U, V).

	:param U:
	:type U: float
	:param V:
	:type V: float
	:param Pl:
	:type Pl: gp_Pln
	:param Nu:
	:type Nu: int
	:param Nv:
	:type Nv: int
	:rtype: gp_Vec
") DN;
		static gp_Vec DN (const Standard_Real U,const Standard_Real V,const gp_Pln & Pl,const Standard_Integer Nu,const Standard_Integer Nv);
		%feature("compactdefaultargs") DN;
		%feature("autodoc", "	:param U:
	:type U: float
	:param V:
	:type V: float
	:param C:
	:type C: gp_Cone
	:param Nu:
	:type Nu: int
	:param Nv:
	:type Nv: int
	:rtype: gp_Vec
") DN;
		static gp_Vec DN (const Standard_Real U,const Standard_Real V,const gp_Cone & C,const Standard_Integer Nu,const Standard_Integer Nv);
		%feature("compactdefaultargs") DN;
		%feature("autodoc", "	:param U:
	:type U: float
	:param V:
	:type V: float
	:param C:
	:type C: gp_Cylinder
	:param Nu:
	:type Nu: int
	:param Nv:
	:type Nv: int
	:rtype: gp_Vec
") DN;
		static gp_Vec DN (const Standard_Real U,const Standard_Real V,const gp_Cylinder & C,const Standard_Integer Nu,const Standard_Integer Nv);
		%feature("compactdefaultargs") DN;
		%feature("autodoc", "	:param U:
	:type U: float
	:param V:
	:type V: float
	:param S:
	:type S: gp_Sphere
	:param Nu:
	:type Nu: int
	:param Nv:
	:type Nv: int
	:rtype: gp_Vec
") DN;
		static gp_Vec DN (const Standard_Real U,const Standard_Real V,const gp_Sphere & S,const Standard_Integer Nu,const Standard_Integer Nv);
		%feature("compactdefaultargs") DN;
		%feature("autodoc", "	:param U:
	:type U: float
	:param V:
	:type V: float
	:param T:
	:type T: gp_Torus
	:param Nu:
	:type Nu: int
	:param Nv:
	:type Nv: int
	:rtype: gp_Vec
") DN;
		static gp_Vec DN (const Standard_Real U,const Standard_Real V,const gp_Torus & T,const Standard_Integer Nu,const Standard_Integer Nv);
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "	* For elementary surfaces from the gp package (planes, cones, cylinders, spheres and tori), computes the point P of parameters (U, V).inline

	:param U:
	:type U: float
	:param V:
	:type V: float
	:param Pl:
	:type Pl: gp_Pln
	:param P:
	:type P: gp_Pnt
	:rtype: void
") D0;
		static void D0 (const Standard_Real U,const Standard_Real V,const gp_Pln & Pl,gp_Pnt & P);
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "	:param U:
	:type U: float
	:param V:
	:type V: float
	:param C:
	:type C: gp_Cone
	:param P:
	:type P: gp_Pnt
	:rtype: void
") D0;
		static void D0 (const Standard_Real U,const Standard_Real V,const gp_Cone & C,gp_Pnt & P);
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "	:param U:
	:type U: float
	:param V:
	:type V: float
	:param C:
	:type C: gp_Cylinder
	:param P:
	:type P: gp_Pnt
	:rtype: void
") D0;
		static void D0 (const Standard_Real U,const Standard_Real V,const gp_Cylinder & C,gp_Pnt & P);
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "	:param U:
	:type U: float
	:param V:
	:type V: float
	:param S:
	:type S: gp_Sphere
	:param P:
	:type P: gp_Pnt
	:rtype: void
") D0;
		static void D0 (const Standard_Real U,const Standard_Real V,const gp_Sphere & S,gp_Pnt & P);
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "	:param U:
	:type U: float
	:param V:
	:type V: float
	:param T:
	:type T: gp_Torus
	:param P:
	:type P: gp_Pnt
	:rtype: void
") D0;
		static void D0 (const Standard_Real U,const Standard_Real V,const gp_Torus & T,gp_Pnt & P);
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "	* For elementary surfaces from the gp package (planes, cones, cylinders, spheres and tori), computes: - the point P of parameters (U, V), and - the first derivative vectors Vu and Vv at this point in the u and v parametric directions respectively.

	:param U:
	:type U: float
	:param V:
	:type V: float
	:param Pl:
	:type Pl: gp_Pln
	:param P:
	:type P: gp_Pnt
	:param Vu:
	:type Vu: gp_Vec
	:param Vv:
	:type Vv: gp_Vec
	:rtype: void
") D1;
		static void D1 (const Standard_Real U,const Standard_Real V,const gp_Pln & Pl,gp_Pnt & P,gp_Vec & Vu,gp_Vec & Vv);
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "	:param U:
	:type U: float
	:param V:
	:type V: float
	:param C:
	:type C: gp_Cone
	:param P:
	:type P: gp_Pnt
	:param Vu:
	:type Vu: gp_Vec
	:param Vv:
	:type Vv: gp_Vec
	:rtype: void
") D1;
		static void D1 (const Standard_Real U,const Standard_Real V,const gp_Cone & C,gp_Pnt & P,gp_Vec & Vu,gp_Vec & Vv);
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "	:param U:
	:type U: float
	:param V:
	:type V: float
	:param C:
	:type C: gp_Cylinder
	:param P:
	:type P: gp_Pnt
	:param Vu:
	:type Vu: gp_Vec
	:param Vv:
	:type Vv: gp_Vec
	:rtype: void
") D1;
		static void D1 (const Standard_Real U,const Standard_Real V,const gp_Cylinder & C,gp_Pnt & P,gp_Vec & Vu,gp_Vec & Vv);
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "	:param U:
	:type U: float
	:param V:
	:type V: float
	:param S:
	:type S: gp_Sphere
	:param P:
	:type P: gp_Pnt
	:param Vu:
	:type Vu: gp_Vec
	:param Vv:
	:type Vv: gp_Vec
	:rtype: void
") D1;
		static void D1 (const Standard_Real U,const Standard_Real V,const gp_Sphere & S,gp_Pnt & P,gp_Vec & Vu,gp_Vec & Vv);
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "	:param U:
	:type U: float
	:param V:
	:type V: float
	:param T:
	:type T: gp_Torus
	:param P:
	:type P: gp_Pnt
	:param Vu:
	:type Vu: gp_Vec
	:param Vv:
	:type Vv: gp_Vec
	:rtype: void
") D1;
		static void D1 (const Standard_Real U,const Standard_Real V,const gp_Torus & T,gp_Pnt & P,gp_Vec & Vu,gp_Vec & Vv);
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "	* For elementary surfaces from the gp package (cones, cylinders, spheres and tori), computes: - the point P of parameters (U, V), and - the first derivative vectors Vu and Vv at this point in the u and v parametric directions respectively, and - the second derivative vectors Vuu, Vvv and Vuv at this point.

	:param U:
	:type U: float
	:param V:
	:type V: float
	:param C:
	:type C: gp_Cone
	:param P:
	:type P: gp_Pnt
	:param Vu:
	:type Vu: gp_Vec
	:param Vv:
	:type Vv: gp_Vec
	:param Vuu:
	:type Vuu: gp_Vec
	:param Vvv:
	:type Vvv: gp_Vec
	:param Vuv:
	:type Vuv: gp_Vec
	:rtype: void
") D2;
		static void D2 (const Standard_Real U,const Standard_Real V,const gp_Cone & C,gp_Pnt & P,gp_Vec & Vu,gp_Vec & Vv,gp_Vec & Vuu,gp_Vec & Vvv,gp_Vec & Vuv);
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "	:param U:
	:type U: float
	:param V:
	:type V: float
	:param C:
	:type C: gp_Cylinder
	:param P:
	:type P: gp_Pnt
	:param Vu:
	:type Vu: gp_Vec
	:param Vv:
	:type Vv: gp_Vec
	:param Vuu:
	:type Vuu: gp_Vec
	:param Vvv:
	:type Vvv: gp_Vec
	:param Vuv:
	:type Vuv: gp_Vec
	:rtype: void
") D2;
		static void D2 (const Standard_Real U,const Standard_Real V,const gp_Cylinder & C,gp_Pnt & P,gp_Vec & Vu,gp_Vec & Vv,gp_Vec & Vuu,gp_Vec & Vvv,gp_Vec & Vuv);
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "	:param U:
	:type U: float
	:param V:
	:type V: float
	:param S:
	:type S: gp_Sphere
	:param P:
	:type P: gp_Pnt
	:param Vu:
	:type Vu: gp_Vec
	:param Vv:
	:type Vv: gp_Vec
	:param Vuu:
	:type Vuu: gp_Vec
	:param Vvv:
	:type Vvv: gp_Vec
	:param Vuv:
	:type Vuv: gp_Vec
	:rtype: void
") D2;
		static void D2 (const Standard_Real U,const Standard_Real V,const gp_Sphere & S,gp_Pnt & P,gp_Vec & Vu,gp_Vec & Vv,gp_Vec & Vuu,gp_Vec & Vvv,gp_Vec & Vuv);
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "	:param U:
	:type U: float
	:param V:
	:type V: float
	:param T:
	:type T: gp_Torus
	:param P:
	:type P: gp_Pnt
	:param Vu:
	:type Vu: gp_Vec
	:param Vv:
	:type Vv: gp_Vec
	:param Vuu:
	:type Vuu: gp_Vec
	:param Vvv:
	:type Vvv: gp_Vec
	:param Vuv:
	:type Vuv: gp_Vec
	:rtype: void
") D2;
		static void D2 (const Standard_Real U,const Standard_Real V,const gp_Torus & T,gp_Pnt & P,gp_Vec & Vu,gp_Vec & Vv,gp_Vec & Vuu,gp_Vec & Vvv,gp_Vec & Vuv);
		%feature("compactdefaultargs") D3;
		%feature("autodoc", "	* For elementary surfaces from the gp package (cones, cylinders, spheres and tori), computes: - the point P of parameters (U,V), and - the first derivative vectors Vu and Vv at this point in the u and v parametric directions respectively, and - the second derivative vectors Vuu, Vvv and Vuv at this point, and - the third derivative vectors Vuuu, Vvvv, Vuuv and Vuvv at this point.

	:param U:
	:type U: float
	:param V:
	:type V: float
	:param C:
	:type C: gp_Cone
	:param P:
	:type P: gp_Pnt
	:param Vu:
	:type Vu: gp_Vec
	:param Vv:
	:type Vv: gp_Vec
	:param Vuu:
	:type Vuu: gp_Vec
	:param Vvv:
	:type Vvv: gp_Vec
	:param Vuv:
	:type Vuv: gp_Vec
	:param Vuuu:
	:type Vuuu: gp_Vec
	:param Vvvv:
	:type Vvvv: gp_Vec
	:param Vuuv:
	:type Vuuv: gp_Vec
	:param Vuvv:
	:type Vuvv: gp_Vec
	:rtype: void
") D3;
		static void D3 (const Standard_Real U,const Standard_Real V,const gp_Cone & C,gp_Pnt & P,gp_Vec & Vu,gp_Vec & Vv,gp_Vec & Vuu,gp_Vec & Vvv,gp_Vec & Vuv,gp_Vec & Vuuu,gp_Vec & Vvvv,gp_Vec & Vuuv,gp_Vec & Vuvv);
		%feature("compactdefaultargs") D3;
		%feature("autodoc", "	:param U:
	:type U: float
	:param V:
	:type V: float
	:param C:
	:type C: gp_Cylinder
	:param P:
	:type P: gp_Pnt
	:param Vu:
	:type Vu: gp_Vec
	:param Vv:
	:type Vv: gp_Vec
	:param Vuu:
	:type Vuu: gp_Vec
	:param Vvv:
	:type Vvv: gp_Vec
	:param Vuv:
	:type Vuv: gp_Vec
	:param Vuuu:
	:type Vuuu: gp_Vec
	:param Vvvv:
	:type Vvvv: gp_Vec
	:param Vuuv:
	:type Vuuv: gp_Vec
	:param Vuvv:
	:type Vuvv: gp_Vec
	:rtype: void
") D3;
		static void D3 (const Standard_Real U,const Standard_Real V,const gp_Cylinder & C,gp_Pnt & P,gp_Vec & Vu,gp_Vec & Vv,gp_Vec & Vuu,gp_Vec & Vvv,gp_Vec & Vuv,gp_Vec & Vuuu,gp_Vec & Vvvv,gp_Vec & Vuuv,gp_Vec & Vuvv);
		%feature("compactdefaultargs") D3;
		%feature("autodoc", "	:param U:
	:type U: float
	:param V:
	:type V: float
	:param S:
	:type S: gp_Sphere
	:param P:
	:type P: gp_Pnt
	:param Vu:
	:type Vu: gp_Vec
	:param Vv:
	:type Vv: gp_Vec
	:param Vuu:
	:type Vuu: gp_Vec
	:param Vvv:
	:type Vvv: gp_Vec
	:param Vuv:
	:type Vuv: gp_Vec
	:param Vuuu:
	:type Vuuu: gp_Vec
	:param Vvvv:
	:type Vvvv: gp_Vec
	:param Vuuv:
	:type Vuuv: gp_Vec
	:param Vuvv:
	:type Vuvv: gp_Vec
	:rtype: void
") D3;
		static void D3 (const Standard_Real U,const Standard_Real V,const gp_Sphere & S,gp_Pnt & P,gp_Vec & Vu,gp_Vec & Vv,gp_Vec & Vuu,gp_Vec & Vvv,gp_Vec & Vuv,gp_Vec & Vuuu,gp_Vec & Vvvv,gp_Vec & Vuuv,gp_Vec & Vuvv);
		%feature("compactdefaultargs") D3;
		%feature("autodoc", "	* Surface evaluation The following functions compute the point and the derivatives on elementary surfaces defined with their geometric characterisitics. You don't need to create the surface to use these functions. These functions are called by the previous ones. Example : A cylinder is defined with its position and its radius.

	:param U:
	:type U: float
	:param V:
	:type V: float
	:param T:
	:type T: gp_Torus
	:param P:
	:type P: gp_Pnt
	:param Vu:
	:type Vu: gp_Vec
	:param Vv:
	:type Vv: gp_Vec
	:param Vuu:
	:type Vuu: gp_Vec
	:param Vvv:
	:type Vvv: gp_Vec
	:param Vuv:
	:type Vuv: gp_Vec
	:param Vuuu:
	:type Vuuu: gp_Vec
	:param Vvvv:
	:type Vvvv: gp_Vec
	:param Vuuv:
	:type Vuuv: gp_Vec
	:param Vuvv:
	:type Vuvv: gp_Vec
	:rtype: void
") D3;
		static void D3 (const Standard_Real U,const Standard_Real V,const gp_Torus & T,gp_Pnt & P,gp_Vec & Vu,gp_Vec & Vv,gp_Vec & Vuu,gp_Vec & Vvv,gp_Vec & Vuv,gp_Vec & Vuuu,gp_Vec & Vvvv,gp_Vec & Vuuv,gp_Vec & Vuvv);
		%feature("compactdefaultargs") PlaneValue;
		%feature("autodoc", "	:param U:
	:type U: float
	:param V:
	:type V: float
	:param Pos:
	:type Pos: gp_Ax3
	:rtype: gp_Pnt
") PlaneValue;
		static gp_Pnt PlaneValue (const Standard_Real U,const Standard_Real V,const gp_Ax3 & Pos);
		%feature("compactdefaultargs") CylinderValue;
		%feature("autodoc", "	:param U:
	:type U: float
	:param V:
	:type V: float
	:param Pos:
	:type Pos: gp_Ax3
	:param Radius:
	:type Radius: float
	:rtype: gp_Pnt
") CylinderValue;
		static gp_Pnt CylinderValue (const Standard_Real U,const Standard_Real V,const gp_Ax3 & Pos,const Standard_Real Radius);
		%feature("compactdefaultargs") ConeValue;
		%feature("autodoc", "	:param U:
	:type U: float
	:param V:
	:type V: float
	:param Pos:
	:type Pos: gp_Ax3
	:param Radius:
	:type Radius: float
	:param SAngle:
	:type SAngle: float
	:rtype: gp_Pnt
") ConeValue;
		static gp_Pnt ConeValue (const Standard_Real U,const Standard_Real V,const gp_Ax3 & Pos,const Standard_Real Radius,const Standard_Real SAngle);
		%feature("compactdefaultargs") SphereValue;
		%feature("autodoc", "	:param U:
	:type U: float
	:param V:
	:type V: float
	:param Pos:
	:type Pos: gp_Ax3
	:param Radius:
	:type Radius: float
	:rtype: gp_Pnt
") SphereValue;
		static gp_Pnt SphereValue (const Standard_Real U,const Standard_Real V,const gp_Ax3 & Pos,const Standard_Real Radius);
		%feature("compactdefaultargs") TorusValue;
		%feature("autodoc", "	:param U:
	:type U: float
	:param V:
	:type V: float
	:param Pos:
	:type Pos: gp_Ax3
	:param MajorRadius:
	:type MajorRadius: float
	:param MinorRadius:
	:type MinorRadius: float
	:rtype: gp_Pnt
") TorusValue;
		static gp_Pnt TorusValue (const Standard_Real U,const Standard_Real V,const gp_Ax3 & Pos,const Standard_Real MajorRadius,const Standard_Real MinorRadius);
		%feature("compactdefaultargs") PlaneDN;
		%feature("autodoc", "	:param U:
	:type U: float
	:param V:
	:type V: float
	:param Pos:
	:type Pos: gp_Ax3
	:param Nu:
	:type Nu: int
	:param Nv:
	:type Nv: int
	:rtype: gp_Vec
") PlaneDN;
		static gp_Vec PlaneDN (const Standard_Real U,const Standard_Real V,const gp_Ax3 & Pos,const Standard_Integer Nu,const Standard_Integer Nv);
		%feature("compactdefaultargs") CylinderDN;
		%feature("autodoc", "	:param U:
	:type U: float
	:param V:
	:type V: float
	:param Pos:
	:type Pos: gp_Ax3
	:param Radius:
	:type Radius: float
	:param Nu:
	:type Nu: int
	:param Nv:
	:type Nv: int
	:rtype: gp_Vec
") CylinderDN;
		static gp_Vec CylinderDN (const Standard_Real U,const Standard_Real V,const gp_Ax3 & Pos,const Standard_Real Radius,const Standard_Integer Nu,const Standard_Integer Nv);
		%feature("compactdefaultargs") ConeDN;
		%feature("autodoc", "	:param U:
	:type U: float
	:param V:
	:type V: float
	:param Pos:
	:type Pos: gp_Ax3
	:param Radius:
	:type Radius: float
	:param SAngle:
	:type SAngle: float
	:param Nu:
	:type Nu: int
	:param Nv:
	:type Nv: int
	:rtype: gp_Vec
") ConeDN;
		static gp_Vec ConeDN (const Standard_Real U,const Standard_Real V,const gp_Ax3 & Pos,const Standard_Real Radius,const Standard_Real SAngle,const Standard_Integer Nu,const Standard_Integer Nv);
		%feature("compactdefaultargs") SphereDN;
		%feature("autodoc", "	:param U:
	:type U: float
	:param V:
	:type V: float
	:param Pos:
	:type Pos: gp_Ax3
	:param Radius:
	:type Radius: float
	:param Nu:
	:type Nu: int
	:param Nv:
	:type Nv: int
	:rtype: gp_Vec
") SphereDN;
		static gp_Vec SphereDN (const Standard_Real U,const Standard_Real V,const gp_Ax3 & Pos,const Standard_Real Radius,const Standard_Integer Nu,const Standard_Integer Nv);
		%feature("compactdefaultargs") TorusDN;
		%feature("autodoc", "	:param U:
	:type U: float
	:param V:
	:type V: float
	:param Pos:
	:type Pos: gp_Ax3
	:param MajorRadius:
	:type MajorRadius: float
	:param MinorRadius:
	:type MinorRadius: float
	:param Nu:
	:type Nu: int
	:param Nv:
	:type Nv: int
	:rtype: gp_Vec
") TorusDN;
		static gp_Vec TorusDN (const Standard_Real U,const Standard_Real V,const gp_Ax3 & Pos,const Standard_Real MajorRadius,const Standard_Real MinorRadius,const Standard_Integer Nu,const Standard_Integer Nv);
		%feature("compactdefaultargs") PlaneD0;
		%feature("autodoc", "	:param U:
	:type U: float
	:param V:
	:type V: float
	:param Pos:
	:type Pos: gp_Ax3
	:param P:
	:type P: gp_Pnt
	:rtype: void
") PlaneD0;
		static void PlaneD0 (const Standard_Real U,const Standard_Real V,const gp_Ax3 & Pos,gp_Pnt & P);
		%feature("compactdefaultargs") ConeD0;
		%feature("autodoc", "	:param U:
	:type U: float
	:param V:
	:type V: float
	:param Pos:
	:type Pos: gp_Ax3
	:param Radius:
	:type Radius: float
	:param SAngle:
	:type SAngle: float
	:param P:
	:type P: gp_Pnt
	:rtype: void
") ConeD0;
		static void ConeD0 (const Standard_Real U,const Standard_Real V,const gp_Ax3 & Pos,const Standard_Real Radius,const Standard_Real SAngle,gp_Pnt & P);
		%feature("compactdefaultargs") CylinderD0;
		%feature("autodoc", "	:param U:
	:type U: float
	:param V:
	:type V: float
	:param Pos:
	:type Pos: gp_Ax3
	:param Radius:
	:type Radius: float
	:param P:
	:type P: gp_Pnt
	:rtype: void
") CylinderD0;
		static void CylinderD0 (const Standard_Real U,const Standard_Real V,const gp_Ax3 & Pos,const Standard_Real Radius,gp_Pnt & P);
		%feature("compactdefaultargs") SphereD0;
		%feature("autodoc", "	:param U:
	:type U: float
	:param V:
	:type V: float
	:param Pos:
	:type Pos: gp_Ax3
	:param Radius:
	:type Radius: float
	:param P:
	:type P: gp_Pnt
	:rtype: void
") SphereD0;
		static void SphereD0 (const Standard_Real U,const Standard_Real V,const gp_Ax3 & Pos,const Standard_Real Radius,gp_Pnt & P);
		%feature("compactdefaultargs") TorusD0;
		%feature("autodoc", "	:param U:
	:type U: float
	:param V:
	:type V: float
	:param Pos:
	:type Pos: gp_Ax3
	:param MajorRadius:
	:type MajorRadius: float
	:param MinorRadius:
	:type MinorRadius: float
	:param P:
	:type P: gp_Pnt
	:rtype: void
") TorusD0;
		static void TorusD0 (const Standard_Real U,const Standard_Real V,const gp_Ax3 & Pos,const Standard_Real MajorRadius,const Standard_Real MinorRadius,gp_Pnt & P);
		%feature("compactdefaultargs") PlaneD1;
		%feature("autodoc", "	:param U:
	:type U: float
	:param V:
	:type V: float
	:param Pos:
	:type Pos: gp_Ax3
	:param P:
	:type P: gp_Pnt
	:param Vu:
	:type Vu: gp_Vec
	:param Vv:
	:type Vv: gp_Vec
	:rtype: void
") PlaneD1;
		static void PlaneD1 (const Standard_Real U,const Standard_Real V,const gp_Ax3 & Pos,gp_Pnt & P,gp_Vec & Vu,gp_Vec & Vv);
		%feature("compactdefaultargs") ConeD1;
		%feature("autodoc", "	:param U:
	:type U: float
	:param V:
	:type V: float
	:param Pos:
	:type Pos: gp_Ax3
	:param Radius:
	:type Radius: float
	:param SAngle:
	:type SAngle: float
	:param P:
	:type P: gp_Pnt
	:param Vu:
	:type Vu: gp_Vec
	:param Vv:
	:type Vv: gp_Vec
	:rtype: void
") ConeD1;
		static void ConeD1 (const Standard_Real U,const Standard_Real V,const gp_Ax3 & Pos,const Standard_Real Radius,const Standard_Real SAngle,gp_Pnt & P,gp_Vec & Vu,gp_Vec & Vv);
		%feature("compactdefaultargs") CylinderD1;
		%feature("autodoc", "	:param U:
	:type U: float
	:param V:
	:type V: float
	:param Pos:
	:type Pos: gp_Ax3
	:param Radius:
	:type Radius: float
	:param P:
	:type P: gp_Pnt
	:param Vu:
	:type Vu: gp_Vec
	:param Vv:
	:type Vv: gp_Vec
	:rtype: void
") CylinderD1;
		static void CylinderD1 (const Standard_Real U,const Standard_Real V,const gp_Ax3 & Pos,const Standard_Real Radius,gp_Pnt & P,gp_Vec & Vu,gp_Vec & Vv);
		%feature("compactdefaultargs") SphereD1;
		%feature("autodoc", "	:param U:
	:type U: float
	:param V:
	:type V: float
	:param Pos:
	:type Pos: gp_Ax3
	:param Radius:
	:type Radius: float
	:param P:
	:type P: gp_Pnt
	:param Vu:
	:type Vu: gp_Vec
	:param Vv:
	:type Vv: gp_Vec
	:rtype: void
") SphereD1;
		static void SphereD1 (const Standard_Real U,const Standard_Real V,const gp_Ax3 & Pos,const Standard_Real Radius,gp_Pnt & P,gp_Vec & Vu,gp_Vec & Vv);
		%feature("compactdefaultargs") TorusD1;
		%feature("autodoc", "	:param U:
	:type U: float
	:param V:
	:type V: float
	:param Pos:
	:type Pos: gp_Ax3
	:param MajorRadius:
	:type MajorRadius: float
	:param MinorRadius:
	:type MinorRadius: float
	:param P:
	:type P: gp_Pnt
	:param Vu:
	:type Vu: gp_Vec
	:param Vv:
	:type Vv: gp_Vec
	:rtype: void
") TorusD1;
		static void TorusD1 (const Standard_Real U,const Standard_Real V,const gp_Ax3 & Pos,const Standard_Real MajorRadius,const Standard_Real MinorRadius,gp_Pnt & P,gp_Vec & Vu,gp_Vec & Vv);
		%feature("compactdefaultargs") ConeD2;
		%feature("autodoc", "	:param U:
	:type U: float
	:param V:
	:type V: float
	:param Pos:
	:type Pos: gp_Ax3
	:param Radius:
	:type Radius: float
	:param SAngle:
	:type SAngle: float
	:param P:
	:type P: gp_Pnt
	:param Vu:
	:type Vu: gp_Vec
	:param Vv:
	:type Vv: gp_Vec
	:param Vuu:
	:type Vuu: gp_Vec
	:param Vvv:
	:type Vvv: gp_Vec
	:param Vuv:
	:type Vuv: gp_Vec
	:rtype: void
") ConeD2;
		static void ConeD2 (const Standard_Real U,const Standard_Real V,const gp_Ax3 & Pos,const Standard_Real Radius,const Standard_Real SAngle,gp_Pnt & P,gp_Vec & Vu,gp_Vec & Vv,gp_Vec & Vuu,gp_Vec & Vvv,gp_Vec & Vuv);
		%feature("compactdefaultargs") CylinderD2;
		%feature("autodoc", "	:param U:
	:type U: float
	:param V:
	:type V: float
	:param Pos:
	:type Pos: gp_Ax3
	:param Radius:
	:type Radius: float
	:param P:
	:type P: gp_Pnt
	:param Vu:
	:type Vu: gp_Vec
	:param Vv:
	:type Vv: gp_Vec
	:param Vuu:
	:type Vuu: gp_Vec
	:param Vvv:
	:type Vvv: gp_Vec
	:param Vuv:
	:type Vuv: gp_Vec
	:rtype: void
") CylinderD2;
		static void CylinderD2 (const Standard_Real U,const Standard_Real V,const gp_Ax3 & Pos,const Standard_Real Radius,gp_Pnt & P,gp_Vec & Vu,gp_Vec & Vv,gp_Vec & Vuu,gp_Vec & Vvv,gp_Vec & Vuv);
		%feature("compactdefaultargs") SphereD2;
		%feature("autodoc", "	:param U:
	:type U: float
	:param V:
	:type V: float
	:param Pos:
	:type Pos: gp_Ax3
	:param Radius:
	:type Radius: float
	:param P:
	:type P: gp_Pnt
	:param Vu:
	:type Vu: gp_Vec
	:param Vv:
	:type Vv: gp_Vec
	:param Vuu:
	:type Vuu: gp_Vec
	:param Vvv:
	:type Vvv: gp_Vec
	:param Vuv:
	:type Vuv: gp_Vec
	:rtype: void
") SphereD2;
		static void SphereD2 (const Standard_Real U,const Standard_Real V,const gp_Ax3 & Pos,const Standard_Real Radius,gp_Pnt & P,gp_Vec & Vu,gp_Vec & Vv,gp_Vec & Vuu,gp_Vec & Vvv,gp_Vec & Vuv);
		%feature("compactdefaultargs") TorusD2;
		%feature("autodoc", "	:param U:
	:type U: float
	:param V:
	:type V: float
	:param Pos:
	:type Pos: gp_Ax3
	:param MajorRadius:
	:type MajorRadius: float
	:param MinorRadius:
	:type MinorRadius: float
	:param P:
	:type P: gp_Pnt
	:param Vu:
	:type Vu: gp_Vec
	:param Vv:
	:type Vv: gp_Vec
	:param Vuu:
	:type Vuu: gp_Vec
	:param Vvv:
	:type Vvv: gp_Vec
	:param Vuv:
	:type Vuv: gp_Vec
	:rtype: void
") TorusD2;
		static void TorusD2 (const Standard_Real U,const Standard_Real V,const gp_Ax3 & Pos,const Standard_Real MajorRadius,const Standard_Real MinorRadius,gp_Pnt & P,gp_Vec & Vu,gp_Vec & Vv,gp_Vec & Vuu,gp_Vec & Vvv,gp_Vec & Vuv);
		%feature("compactdefaultargs") ConeD3;
		%feature("autodoc", "	:param U:
	:type U: float
	:param V:
	:type V: float
	:param Pos:
	:type Pos: gp_Ax3
	:param Radius:
	:type Radius: float
	:param SAngle:
	:type SAngle: float
	:param P:
	:type P: gp_Pnt
	:param Vu:
	:type Vu: gp_Vec
	:param Vv:
	:type Vv: gp_Vec
	:param Vuu:
	:type Vuu: gp_Vec
	:param Vvv:
	:type Vvv: gp_Vec
	:param Vuv:
	:type Vuv: gp_Vec
	:param Vuuu:
	:type Vuuu: gp_Vec
	:param Vvvv:
	:type Vvvv: gp_Vec
	:param Vuuv:
	:type Vuuv: gp_Vec
	:param Vuvv:
	:type Vuvv: gp_Vec
	:rtype: void
") ConeD3;
		static void ConeD3 (const Standard_Real U,const Standard_Real V,const gp_Ax3 & Pos,const Standard_Real Radius,const Standard_Real SAngle,gp_Pnt & P,gp_Vec & Vu,gp_Vec & Vv,gp_Vec & Vuu,gp_Vec & Vvv,gp_Vec & Vuv,gp_Vec & Vuuu,gp_Vec & Vvvv,gp_Vec & Vuuv,gp_Vec & Vuvv);
		%feature("compactdefaultargs") CylinderD3;
		%feature("autodoc", "	:param U:
	:type U: float
	:param V:
	:type V: float
	:param Pos:
	:type Pos: gp_Ax3
	:param Radius:
	:type Radius: float
	:param P:
	:type P: gp_Pnt
	:param Vu:
	:type Vu: gp_Vec
	:param Vv:
	:type Vv: gp_Vec
	:param Vuu:
	:type Vuu: gp_Vec
	:param Vvv:
	:type Vvv: gp_Vec
	:param Vuv:
	:type Vuv: gp_Vec
	:param Vuuu:
	:type Vuuu: gp_Vec
	:param Vvvv:
	:type Vvvv: gp_Vec
	:param Vuuv:
	:type Vuuv: gp_Vec
	:param Vuvv:
	:type Vuvv: gp_Vec
	:rtype: void
") CylinderD3;
		static void CylinderD3 (const Standard_Real U,const Standard_Real V,const gp_Ax3 & Pos,const Standard_Real Radius,gp_Pnt & P,gp_Vec & Vu,gp_Vec & Vv,gp_Vec & Vuu,gp_Vec & Vvv,gp_Vec & Vuv,gp_Vec & Vuuu,gp_Vec & Vvvv,gp_Vec & Vuuv,gp_Vec & Vuvv);
		%feature("compactdefaultargs") SphereD3;
		%feature("autodoc", "	:param U:
	:type U: float
	:param V:
	:type V: float
	:param Pos:
	:type Pos: gp_Ax3
	:param Radius:
	:type Radius: float
	:param P:
	:type P: gp_Pnt
	:param Vu:
	:type Vu: gp_Vec
	:param Vv:
	:type Vv: gp_Vec
	:param Vuu:
	:type Vuu: gp_Vec
	:param Vvv:
	:type Vvv: gp_Vec
	:param Vuv:
	:type Vuv: gp_Vec
	:param Vuuu:
	:type Vuuu: gp_Vec
	:param Vvvv:
	:type Vvvv: gp_Vec
	:param Vuuv:
	:type Vuuv: gp_Vec
	:param Vuvv:
	:type Vuvv: gp_Vec
	:rtype: void
") SphereD3;
		static void SphereD3 (const Standard_Real U,const Standard_Real V,const gp_Ax3 & Pos,const Standard_Real Radius,gp_Pnt & P,gp_Vec & Vu,gp_Vec & Vv,gp_Vec & Vuu,gp_Vec & Vvv,gp_Vec & Vuv,gp_Vec & Vuuu,gp_Vec & Vvvv,gp_Vec & Vuuv,gp_Vec & Vuvv);
		%feature("compactdefaultargs") TorusD3;
		%feature("autodoc", "	* The following functions compute the parametric values corresponding to a given point on a elementary surface. The point should be on the surface.

	:param U:
	:type U: float
	:param V:
	:type V: float
	:param Pos:
	:type Pos: gp_Ax3
	:param MajorRadius:
	:type MajorRadius: float
	:param MinorRadius:
	:type MinorRadius: float
	:param P:
	:type P: gp_Pnt
	:param Vu:
	:type Vu: gp_Vec
	:param Vv:
	:type Vv: gp_Vec
	:param Vuu:
	:type Vuu: gp_Vec
	:param Vvv:
	:type Vvv: gp_Vec
	:param Vuv:
	:type Vuv: gp_Vec
	:param Vuuu:
	:type Vuuu: gp_Vec
	:param Vvvv:
	:type Vvvv: gp_Vec
	:param Vuuv:
	:type Vuuv: gp_Vec
	:param Vuvv:
	:type Vuvv: gp_Vec
	:rtype: void
") TorusD3;
		static void TorusD3 (const Standard_Real U,const Standard_Real V,const gp_Ax3 & Pos,const Standard_Real MajorRadius,const Standard_Real MinorRadius,gp_Pnt & P,gp_Vec & Vu,gp_Vec & Vv,gp_Vec & Vuu,gp_Vec & Vvv,gp_Vec & Vuv,gp_Vec & Vuuu,gp_Vec & Vvvv,gp_Vec & Vuuv,gp_Vec & Vuvv);
		%feature("compactdefaultargs") Parameters;
		%feature("autodoc", "	* parametrization P (U, V) = Pl.Location() + U * Pl.XDirection() + V * Pl.YDirection()

	:param Pl:
	:type Pl: gp_Pln
	:param P:
	:type P: gp_Pnt
	:param U:
	:type U: float &
	:param V:
	:type V: float &
	:rtype: void
") Parameters;
		static void Parameters (const gp_Pln & Pl,const gp_Pnt & P,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") Parameters;
		%feature("autodoc", "	* parametrization P (U, V) = Location + V * ZDirection + Radius * (Cos(U) * XDirection + Sin (U) * YDirection)

	:param C:
	:type C: gp_Cylinder
	:param P:
	:type P: gp_Pnt
	:param U:
	:type U: float &
	:param V:
	:type V: float &
	:rtype: void
") Parameters;
		static void Parameters (const gp_Cylinder & C,const gp_Pnt & P,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") Parameters;
		%feature("autodoc", "	* parametrization P (U, V) = Location + V * ZDirection + (Radius + V * Tan (SemiAngle)) * (Cos(U) * XDirection + Sin(U) * YDirection)

	:param C:
	:type C: gp_Cone
	:param P:
	:type P: gp_Pnt
	:param U:
	:type U: float &
	:param V:
	:type V: float &
	:rtype: void
") Parameters;
		static void Parameters (const gp_Cone & C,const gp_Pnt & P,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") Parameters;
		%feature("autodoc", "	* parametrization P (U, V) = Location + Radius * Cos (V) * (Cos (U) * XDirection + Sin (U) * YDirection) + Radius * Sin (V) * ZDirection

	:param S:
	:type S: gp_Sphere
	:param P:
	:type P: gp_Pnt
	:param U:
	:type U: float &
	:param V:
	:type V: float &
	:rtype: void
") Parameters;
		static void Parameters (const gp_Sphere & S,const gp_Pnt & P,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") Parameters;
		%feature("autodoc", "	* parametrization P (U, V) = Location + (MajorRadius + MinorRadius * Cos(U)) * (Cos(V) * XDirection - Sin(V) * YDirection) + MinorRadius * Sin(U) * ZDirection

	:param T:
	:type T: gp_Torus
	:param P:
	:type P: gp_Pnt
	:param U:
	:type U: float &
	:param V:
	:type V: float &
	:rtype: void
") Parameters;
		static void Parameters (const gp_Torus & T,const gp_Pnt & P,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") PlaneParameters;
		%feature("autodoc", "	* parametrization P (U, V) = Pl.Location() + U * Pl.XDirection() + V * Pl.YDirection()

	:param Pos:
	:type Pos: gp_Ax3
	:param P:
	:type P: gp_Pnt
	:param U:
	:type U: float &
	:param V:
	:type V: float &
	:rtype: void
") PlaneParameters;
		static void PlaneParameters (const gp_Ax3 & Pos,const gp_Pnt & P,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") CylinderParameters;
		%feature("autodoc", "	* parametrization P (U, V) = Location + V * ZDirection + Radius * (Cos(U) * XDirection + Sin (U) * YDirection)

	:param Pos:
	:type Pos: gp_Ax3
	:param Radius:
	:type Radius: float
	:param P:
	:type P: gp_Pnt
	:param U:
	:type U: float &
	:param V:
	:type V: float &
	:rtype: void
") CylinderParameters;
		static void CylinderParameters (const gp_Ax3 & Pos,const Standard_Real Radius,const gp_Pnt & P,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") ConeParameters;
		%feature("autodoc", "	* parametrization P (U, V) = Location + V * ZDirection + (Radius + V * Tan (SemiAngle)) * (Cos(U) * XDirection + Sin(U) * YDirection)

	:param Pos:
	:type Pos: gp_Ax3
	:param Radius:
	:type Radius: float
	:param SAngle:
	:type SAngle: float
	:param P:
	:type P: gp_Pnt
	:param U:
	:type U: float &
	:param V:
	:type V: float &
	:rtype: void
") ConeParameters;
		static void ConeParameters (const gp_Ax3 & Pos,const Standard_Real Radius,const Standard_Real SAngle,const gp_Pnt & P,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") SphereParameters;
		%feature("autodoc", "	* parametrization P (U, V) = Location + Radius * Cos (V) * (Cos (U) * XDirection + Sin (U) * YDirection) + Radius * Sin (V) * ZDirection

	:param Pos:
	:type Pos: gp_Ax3
	:param Radius:
	:type Radius: float
	:param P:
	:type P: gp_Pnt
	:param U:
	:type U: float &
	:param V:
	:type V: float &
	:rtype: void
") SphereParameters;
		static void SphereParameters (const gp_Ax3 & Pos,const Standard_Real Radius,const gp_Pnt & P,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") TorusParameters;
		%feature("autodoc", "	* parametrization P (U, V) = Location + (MajorRadius + MinorRadius * Cos(U)) * (Cos(V) * XDirection - Sin(V) * YDirection) + MinorRadius * Sin(U) * ZDirection

	:param Pos:
	:type Pos: gp_Ax3
	:param MajorRadius:
	:type MajorRadius: float
	:param MinorRadius:
	:type MinorRadius: float
	:param P:
	:type P: gp_Pnt
	:param U:
	:type U: float &
	:param V:
	:type V: float &
	:rtype: void
") TorusParameters;
		static void TorusParameters (const gp_Ax3 & Pos,const Standard_Real MajorRadius,const Standard_Real MinorRadius,const gp_Pnt & P,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") PlaneUIso;
		%feature("autodoc", "	* compute the U Isoparametric gp_Lin of the plane.

	:param Pos:
	:type Pos: gp_Ax3
	:param U:
	:type U: float
	:rtype: gp_Lin
") PlaneUIso;
		static gp_Lin PlaneUIso (const gp_Ax3 & Pos,const Standard_Real U);
		%feature("compactdefaultargs") CylinderUIso;
		%feature("autodoc", "	* compute the U Isoparametric gp_Lin of the cylinder.

	:param Pos:
	:type Pos: gp_Ax3
	:param Radius:
	:type Radius: float
	:param U:
	:type U: float
	:rtype: gp_Lin
") CylinderUIso;
		static gp_Lin CylinderUIso (const gp_Ax3 & Pos,const Standard_Real Radius,const Standard_Real U);
		%feature("compactdefaultargs") ConeUIso;
		%feature("autodoc", "	* compute the U Isoparametric gp_Lin of the cone.

	:param Pos:
	:type Pos: gp_Ax3
	:param Radius:
	:type Radius: float
	:param SAngle:
	:type SAngle: float
	:param U:
	:type U: float
	:rtype: gp_Lin
") ConeUIso;
		static gp_Lin ConeUIso (const gp_Ax3 & Pos,const Standard_Real Radius,const Standard_Real SAngle,const Standard_Real U);
		%feature("compactdefaultargs") SphereUIso;
		%feature("autodoc", "	* compute the U Isoparametric gp_Circ of the sphere, (the meridian is not trimmed).

	:param Pos:
	:type Pos: gp_Ax3
	:param Radius:
	:type Radius: float
	:param U:
	:type U: float
	:rtype: gp_Circ
") SphereUIso;
		static gp_Circ SphereUIso (const gp_Ax3 & Pos,const Standard_Real Radius,const Standard_Real U);
		%feature("compactdefaultargs") TorusUIso;
		%feature("autodoc", "	* compute the U Isoparametric gp_Circ of the torus.

	:param Pos:
	:type Pos: gp_Ax3
	:param MajorRadius:
	:type MajorRadius: float
	:param MinorRadius:
	:type MinorRadius: float
	:param U:
	:type U: float
	:rtype: gp_Circ
") TorusUIso;
		static gp_Circ TorusUIso (const gp_Ax3 & Pos,const Standard_Real MajorRadius,const Standard_Real MinorRadius,const Standard_Real U);
		%feature("compactdefaultargs") PlaneVIso;
		%feature("autodoc", "	* compute the V Isoparametric gp_Lin of the plane.

	:param Pos:
	:type Pos: gp_Ax3
	:param V:
	:type V: float
	:rtype: gp_Lin
") PlaneVIso;
		static gp_Lin PlaneVIso (const gp_Ax3 & Pos,const Standard_Real V);
		%feature("compactdefaultargs") CylinderVIso;
		%feature("autodoc", "	* compute the V Isoparametric gp_Circ of the cylinder.

	:param Pos:
	:type Pos: gp_Ax3
	:param Radius:
	:type Radius: float
	:param V:
	:type V: float
	:rtype: gp_Circ
") CylinderVIso;
		static gp_Circ CylinderVIso (const gp_Ax3 & Pos,const Standard_Real Radius,const Standard_Real V);
		%feature("compactdefaultargs") ConeVIso;
		%feature("autodoc", "	* compute the V Isoparametric gp_Circ of the cone.

	:param Pos:
	:type Pos: gp_Ax3
	:param Radius:
	:type Radius: float
	:param SAngle:
	:type SAngle: float
	:param V:
	:type V: float
	:rtype: gp_Circ
") ConeVIso;
		static gp_Circ ConeVIso (const gp_Ax3 & Pos,const Standard_Real Radius,const Standard_Real SAngle,const Standard_Real V);
		%feature("compactdefaultargs") SphereVIso;
		%feature("autodoc", "	* compute the V Isoparametric gp_Circ of the sphere, (the meridian is not trimmed).

	:param Pos:
	:type Pos: gp_Ax3
	:param Radius:
	:type Radius: float
	:param V:
	:type V: float
	:rtype: gp_Circ
") SphereVIso;
		static gp_Circ SphereVIso (const gp_Ax3 & Pos,const Standard_Real Radius,const Standard_Real V);
		%feature("compactdefaultargs") TorusVIso;
		%feature("autodoc", "	* compute the V Isoparametric gp_Circ of the torus.

	:param Pos:
	:type Pos: gp_Ax3
	:param MajorRadius:
	:type MajorRadius: float
	:param MinorRadius:
	:type MinorRadius: float
	:param V:
	:type V: float
	:rtype: gp_Circ
") TorusVIso;
		static gp_Circ TorusVIso (const gp_Ax3 & Pos,const Standard_Real MajorRadius,const Standard_Real MinorRadius,const Standard_Real V);
};


%extend ElSLib {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
