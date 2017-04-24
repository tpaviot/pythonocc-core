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
%module (package="OCC") BndLib

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


%include BndLib_headers.i


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

%rename(bndlib) BndLib;
class BndLib {
	public:
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "	* Bounding box for a surface trimmed or not Adds the segment of the line L limited by the two parameter values P1 and P2, to the bounding box B, and then enlarges B by the tolerance value Tol. Tol is the tolerance value to enlarge the minimun and maximum dimension P1 and P2 may represent infinite values. Exceptions Standard_Failure if P1 and P2 are either two negative infinite real numbers, or two positive infinite real numbers.

	:param L:
	:type L: gp_Lin
	:param P1:
	:type P1: float
	:param P2:
	:type P2: float
	:param Tol:
	:type Tol: float
	:param B:
	:type B: Bnd_Box &
	:rtype: void
") Add;
		static void Add (const gp_Lin & L,const Standard_Real P1,const Standard_Real P2,const Standard_Real Tol,Bnd_Box & B);
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "	:param L:
	:type L: gp_Lin2d
	:param P1:
	:type P1: float
	:param P2:
	:type P2: float
	:param Tol:
	:type Tol: float
	:param B:
	:type B: Bnd_Box2d &
	:rtype: void
") Add;
		static void Add (const gp_Lin2d & L,const Standard_Real P1,const Standard_Real P2,const Standard_Real Tol,Bnd_Box2d & B);
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "	:param C:
	:type C: gp_Circ
	:param Tol:
	:type Tol: float
	:param B:
	:type B: Bnd_Box &
	:rtype: void
") Add;
		static void Add (const gp_Circ & C,const Standard_Real Tol,Bnd_Box & B);
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "	* P2-P1 can be in [0,2*pi]

	:param C:
	:type C: gp_Circ
	:param P1:
	:type P1: float
	:param P2:
	:type P2: float
	:param Tol:
	:type Tol: float
	:param B:
	:type B: Bnd_Box &
	:rtype: void
") Add;
		static void Add (const gp_Circ & C,const Standard_Real P1,const Standard_Real P2,const Standard_Real Tol,Bnd_Box & B);
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "	:param C:
	:type C: gp_Circ2d
	:param Tol:
	:type Tol: float
	:param B:
	:type B: Bnd_Box2d &
	:rtype: void
") Add;
		static void Add (const gp_Circ2d & C,const Standard_Real Tol,Bnd_Box2d & B);
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "	* Adds the circle C, or the arc of the circle C limited by the two parameter values P1 and P2, to the bounding box B, and then enlarges B by the tolerance value Tol. P2-P1 can be in [0,2*pi]

	:param C:
	:type C: gp_Circ2d
	:param P1:
	:type P1: float
	:param P2:
	:type P2: float
	:param Tol:
	:type Tol: float
	:param B:
	:type B: Bnd_Box2d &
	:rtype: void
") Add;
		static void Add (const gp_Circ2d & C,const Standard_Real P1,const Standard_Real P2,const Standard_Real Tol,Bnd_Box2d & B);
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "	:param C:
	:type C: gp_Elips
	:param Tol:
	:type Tol: float
	:param B:
	:type B: Bnd_Box &
	:rtype: void
") Add;
		static void Add (const gp_Elips & C,const Standard_Real Tol,Bnd_Box & B);
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "	* P2-P1 can be in [0,2*pi]

	:param C:
	:type C: gp_Elips
	:param P1:
	:type P1: float
	:param P2:
	:type P2: float
	:param Tol:
	:type Tol: float
	:param B:
	:type B: Bnd_Box &
	:rtype: void
") Add;
		static void Add (const gp_Elips & C,const Standard_Real P1,const Standard_Real P2,const Standard_Real Tol,Bnd_Box & B);
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "	:param C:
	:type C: gp_Elips2d
	:param Tol:
	:type Tol: float
	:param B:
	:type B: Bnd_Box2d &
	:rtype: void
") Add;
		static void Add (const gp_Elips2d & C,const Standard_Real Tol,Bnd_Box2d & B);
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "	* Adds the ellipse E, or the arc of the ellipse E limited by the two parameter values P1 and P2, to the bounding box B, and then enlarges B by the tolerance value Tol. P2-P1 can be in [0,2*pi]

	:param C:
	:type C: gp_Elips2d
	:param P1:
	:type P1: float
	:param P2:
	:type P2: float
	:param Tol:
	:type Tol: float
	:param B:
	:type B: Bnd_Box2d &
	:rtype: void
") Add;
		static void Add (const gp_Elips2d & C,const Standard_Real P1,const Standard_Real P2,const Standard_Real Tol,Bnd_Box2d & B);
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "	:param P:
	:type P: gp_Parab
	:param P1:
	:type P1: float
	:param P2:
	:type P2: float
	:param Tol:
	:type Tol: float
	:param B:
	:type B: Bnd_Box &
	:rtype: void
") Add;
		static void Add (const gp_Parab & P,const Standard_Real P1,const Standard_Real P2,const Standard_Real Tol,Bnd_Box & B);
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "	* Adds the arc of the parabola P limited by the two parameter values P1 and P2, to the bounding box B, and then enlarges B by the tolerance value Tol. P1 and P2 may represent infinite values. Exceptions Standard_Failure if P1 and P2 are either two negative infinite real numbers, or two positive infinite real numbers.

	:param P:
	:type P: gp_Parab2d
	:param P1:
	:type P1: float
	:param P2:
	:type P2: float
	:param Tol:
	:type Tol: float
	:param B:
	:type B: Bnd_Box2d &
	:rtype: void
") Add;
		static void Add (const gp_Parab2d & P,const Standard_Real P1,const Standard_Real P2,const Standard_Real Tol,Bnd_Box2d & B);
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "	:param H:
	:type H: gp_Hypr
	:param P1:
	:type P1: float
	:param P2:
	:type P2: float
	:param Tol:
	:type Tol: float
	:param B:
	:type B: Bnd_Box &
	:rtype: void
") Add;
		static void Add (const gp_Hypr & H,const Standard_Real P1,const Standard_Real P2,const Standard_Real Tol,Bnd_Box & B);
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "	* Adds the arc of the branch of hyperbola H limited by the two parameter values P1 and P2, to the bounding box B, and then enlarges B by the tolerance value Tol. P1 and P2 may represent infinite values. Exceptions Standard_Failure if P1 and P2 are either two negative infinite real numbers, or two positive infinite real numbers.

	:param H:
	:type H: gp_Hypr2d
	:param P1:
	:type P1: float
	:param P2:
	:type P2: float
	:param Tol:
	:type Tol: float
	:param B:
	:type B: Bnd_Box2d &
	:rtype: void
") Add;
		static void Add (const gp_Hypr2d & H,const Standard_Real P1,const Standard_Real P2,const Standard_Real Tol,Bnd_Box2d & B);
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "	* UMax -UMin can be in [0,2*pi]

	:param S:
	:type S: gp_Cylinder
	:param UMin:
	:type UMin: float
	:param UMax:
	:type UMax: float
	:param VMin:
	:type VMin: float
	:param VMax:
	:type VMax: float
	:param Tol:
	:type Tol: float
	:param B:
	:type B: Bnd_Box &
	:rtype: void
") Add;
		static void Add (const gp_Cylinder & S,const Standard_Real UMin,const Standard_Real UMax,const Standard_Real VMin,const Standard_Real VMax,const Standard_Real Tol,Bnd_Box & B);
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "	* Adds to the bounding box B, the patch of the cylinder S limited - in the v parametric direction, by the two parameter values VMin and VMax - and optionally in the u parametric direction, by the two parameter values UMin and UMax. B is then enlarged by the tolerance value Tol. VMin and VMax may represent infinite values. Exceptions Standard_Failure if VMin and VMax are either two negative infinite real numbers, or two positive infinite real numbers.

	:param S:
	:type S: gp_Cylinder
	:param VMin:
	:type VMin: float
	:param VMax:
	:type VMax: float
	:param Tol:
	:type Tol: float
	:param B:
	:type B: Bnd_Box &
	:rtype: void
") Add;
		static void Add (const gp_Cylinder & S,const Standard_Real VMin,const Standard_Real VMax,const Standard_Real Tol,Bnd_Box & B);
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "	* UMax-UMin can be in [0,2*pi]

	:param S:
	:type S: gp_Cone
	:param UMin:
	:type UMin: float
	:param UMax:
	:type UMax: float
	:param VMin:
	:type VMin: float
	:param VMax:
	:type VMax: float
	:param Tol:
	:type Tol: float
	:param B:
	:type B: Bnd_Box &
	:rtype: void
") Add;
		static void Add (const gp_Cone & S,const Standard_Real UMin,const Standard_Real UMax,const Standard_Real VMin,const Standard_Real VMax,const Standard_Real Tol,Bnd_Box & B);
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "	* Adds to the bounding box B, the patch of the cone S limited - in the v parametric direction, by the two parameter values VMin and VMax - and optionally in the u parametric direction, by the two parameter values UMin and UMax, B is then enlarged by the tolerance value Tol. VMin and VMax may represent infinite values. Exceptions Standard_Failure if VMin and VMax are either two negative infinite real numbers, or two positive infinite real numbers.

	:param S:
	:type S: gp_Cone
	:param VMin:
	:type VMin: float
	:param VMax:
	:type VMax: float
	:param Tol:
	:type Tol: float
	:param B:
	:type B: Bnd_Box &
	:rtype: void
") Add;
		static void Add (const gp_Cone & S,const Standard_Real VMin,const Standard_Real VMax,const Standard_Real Tol,Bnd_Box & B);
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "	:param S:
	:type S: gp_Sphere
	:param Tol:
	:type Tol: float
	:param B:
	:type B: Bnd_Box &
	:rtype: void
") Add;
		static void Add (const gp_Sphere & S,const Standard_Real Tol,Bnd_Box & B);
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "	* Adds to the bounding box B the sphere S, or - the patch of the sphere S, limited in the u parametric direction, by the two parameter values UMin and UMax, and in the v parametric direction, by the two parameter values VMin and VMax. B is then enlarged by the tolerance value Tol. UMax-UMin can be in [0,2*pi] VMin,VMax can be [-pi/2,pi/2]

	:param S:
	:type S: gp_Sphere
	:param UMin:
	:type UMin: float
	:param UMax:
	:type UMax: float
	:param VMin:
	:type VMin: float
	:param VMax:
	:type VMax: float
	:param Tol:
	:type Tol: float
	:param B:
	:type B: Bnd_Box &
	:rtype: void
") Add;
		static void Add (const gp_Sphere & S,const Standard_Real UMin,const Standard_Real UMax,const Standard_Real VMin,const Standard_Real VMax,const Standard_Real Tol,Bnd_Box & B);
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "	:param P:
	:type P: gp_Torus
	:param Tol:
	:type Tol: float
	:param B:
	:type B: Bnd_Box &
	:rtype: void
") Add;
		static void Add (const gp_Torus & P,const Standard_Real Tol,Bnd_Box & B);
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "	* Adds to the bounding box B - the torus S, or - the patch of the torus S, limited in the u parametric direction, by the two parameter values UMin and UMax, and in the v parametric direction, by the two parameter values VMin and VMax. B is then enlarged by the tolerance value Tol. UMax-UMin can be in [0,2*pi], VMin,VMax can be [-pi/2,pi/2]

	:param P:
	:type P: gp_Torus
	:param UMin:
	:type UMin: float
	:param UMax:
	:type UMax: float
	:param VMin:
	:type VMin: float
	:param VMax:
	:type VMax: float
	:param Tol:
	:type Tol: float
	:param B:
	:type B: Bnd_Box &
	:rtype: void
") Add;
		static void Add (const gp_Torus & P,const Standard_Real UMin,const Standard_Real UMax,const Standard_Real VMin,const Standard_Real VMax,const Standard_Real Tol,Bnd_Box & B);
};


%extend BndLib {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
class BndLib_Add2dCurve {
	public:
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "	* Adds to the bounding box B the curve C B is then enlarged by the tolerance value Tol. Note: depending on the type of curve, one of the following representations of the curve C is used to include it in the bounding box B: - an exact representation if C is built from a line, a circle or a conic curve, - the poles of the curve if C is built from a Bezier curve or a BSpline curve, - if not, the points of an approximation of the curve C. Warning C is an adapted curve, that is, an object which is an interface between: - the services provided by a 2D curve from the package Geom2d - and those required of the curve by the computation algorithm. The adapted curve is created in the following way: Handle_Geom2d_Curve mycurve = ... ; Geom2dAdaptor_Curve C(mycurve); The bounding box B is then enlarged by adding it: Bnd_Box2d B; // ... Standard_Real Tol = ... ; Add2dCurve::Add ( C, Tol, B ); Exceptions Standard_Failure if the curve is built from: - a Geom_Line, or - a Geom_Parabola, or - a Geom_Hyperbola, and P1 and P2 are either two negative infinite real numbers, or two positive infinite real numbers.

	:param C:
	:type C: Adaptor2d_Curve2d &
	:param Tol:
	:type Tol: float
	:param B:
	:type B: Bnd_Box2d &
	:rtype: void
") Add;
		static void Add (const Adaptor2d_Curve2d & C,const Standard_Real Tol,Bnd_Box2d & B);
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "	* Adds to the bounding box Bthe arc of the curve C limited by the two parameter values P1 and P2. B is then enlarged by the tolerance value Tol. Note: depending on the type of curve, one of the following representations of the curve C is used to include it in the bounding box B: - an exact representation if C is built from a line, a circle or a conic curve, - the poles of the curve if C is built from a Bezier curve or a BSpline curve, - if not, the points of an approximation of the curve C. Warning C is an adapted curve, that is, an object which is an interface between: - the services provided by a 2D curve from the package Geom2d - and those required of the curve by the computation algorithm. The adapted curve is created in the following way: Handle_Geom2d_Curve mycurve = ... ; Geom2dAdaptor_Curve C(mycurve); The bounding box B is then enlarged by adding it: Bnd_Box2d B; // ... Standard_Real Tol = ... ; Add2dCurve::Add ( C, Tol, B ); Exceptions Standard_Failure if the curve is built from: - a Geom_Line, or - a Geom_Parabola, or - a Geom_Hyperbola, and P1 and P2 are either two negative infinite real numbers, or two positive infinite real numbers.

	:param C:
	:type C: Adaptor2d_Curve2d &
	:param U1:
	:type U1: float
	:param U2:
	:type U2: float
	:param Tol:
	:type Tol: float
	:param B:
	:type B: Bnd_Box2d &
	:rtype: void
") Add;
		static void Add (const Adaptor2d_Curve2d & C,const Standard_Real U1,const Standard_Real U2,const Standard_Real Tol,Bnd_Box2d & B);
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "	* Adds to the bounding box B the curve C B is then enlarged by the tolerance value Tol. Note: depending on the type of curve, one of the following representations of the curve C is used to include it in the bounding box B: - an exact representation if C is built from a line, a circle or a conic curve, - the poles of the curve if C is built from a Bezier curve or a BSpline curve, - if not, the points of an approximation of the curve C.

	:param C:
	:type C: Handle_Geom2d_Curve &
	:param Tol:
	:type Tol: float
	:param Box:
	:type Box: Bnd_Box2d &
	:rtype: void
") Add;
		static void Add (const Handle_Geom2d_Curve & C,const Standard_Real Tol,Bnd_Box2d & Box);
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "	* Adds to the bounding box B the part of curve C B is then enlarged by the tolerance value Tol. U1, U2 - the parametric range to comute the bounding box; Note: depending on the type of curve, one of the following representations of the curve C is used to include it in the bounding box B: - an exact representation if C is built from a line, a circle or a conic curve, - the poles of the curve if C is built from a Bezier curve or a BSpline curve, - if not, the points of an approximation of the curve C.

	:param C:
	:type C: Handle_Geom2d_Curve &
	:param U1:
	:type U1: float
	:param U2:
	:type U2: float
	:param Tol:
	:type Tol: float
	:param B:
	:type B: Bnd_Box2d &
	:rtype: void
") Add;
		static void Add (const Handle_Geom2d_Curve & C,const Standard_Real U1,const Standard_Real U2,const Standard_Real Tol,Bnd_Box2d & B);
};


%extend BndLib_Add2dCurve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
class BndLib_Add3dCurve {
	public:
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "	* Adds to the bounding box B the curve C B is then enlarged by the tolerance value Tol. Note: depending on the type of curve, one of the following representations of the curve C is used to include it in the bounding box B: - an exact representation if C is built from a line, a circle or a conic curve, - the poles of the curve if C is built from a Bezier curve or a BSpline curve, if not, the points of an approximation of the curve C. Warning C is an adapted curve, that is, an object which is an interface between: - the services provided by a 3D curve from the package Geom - and those required of the curve by the computation algorithm. The adapted curve is created in the following way: Handle_Geom_Curve mycurve = ... ; GeomAdaptor_Curve C(mycurve); The bounding box B is then enlarged by adding it: Bnd_Box B; // ... Standard_Real Tol = ... ; Add3dCurve::Add ( C, Tol, B ); Exceptions Standard_Failure if the curve is built from: - a Geom_Line, or - a Geom_Parabola, or - a Geom_Hyperbola, and P1 and P2 are either two negative infinite real numbers, or two positive infinite real numbers.

	:param C:
	:type C: Adaptor3d_Curve &
	:param Tol:
	:type Tol: float
	:param B:
	:type B: Bnd_Box &
	:rtype: void
") Add;
		static void Add (const Adaptor3d_Curve & C,const Standard_Real Tol,Bnd_Box & B);
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "	* Adds to the bounding box B the curve C the arc of the curve C limited by the two parameter values P1 and P2. Note: depending on the type of curve, one of the following representations of the curve C is used to include it in the bounding box B: - an exact representation if C is built from a line, a circle or a conic curve, - the poles of the curve if C is built from a Bezier curve or a BSpline curve, if not, the points of an approximation of the curve C. Warning C is an adapted curve, that is, an object which is an interface between: - the services provided by a 3D curve from the package Geom - and those required of the curve by the computation algorithm. The adapted curve is created in the following way: Handle_Geom_Curve mycurve = ... ; GeomAdaptor_Curve C(mycurve); The bounding box B is then enlarged by adding it: Bnd_Box B; // ... Standard_Real Tol = ... ; Add3dCurve::Add ( C, Tol, B ); Exceptions Standard_Failure if the curve is built from: - a Geom_Line, or - a Geom_Parabola, or - a Geom_Hyperbola, and P1 and P2 are either two negative infinite real numbers, or two positive infinite real numbers.

	:param C:
	:type C: Adaptor3d_Curve &
	:param U1:
	:type U1: float
	:param U2:
	:type U2: float
	:param Tol:
	:type Tol: float
	:param B:
	:type B: Bnd_Box &
	:rtype: void
") Add;
		static void Add (const Adaptor3d_Curve & C,const Standard_Real U1,const Standard_Real U2,const Standard_Real Tol,Bnd_Box & B);
};


%extend BndLib_Add3dCurve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
class BndLib_AddSurface {
	public:
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "	* Adds to the bounding box B the surface S B is then enlarged by the tolerance value Tol. Note: depending on the type of curve, one of the following representations of the surface S is used to include it in the bounding box B: - an exact representation if S is built from a plane, a cylinder, a cone, a sphere or a torus, - the poles of the surface if S is built from a Bezier surface or a BSpline surface, - the points of an approximation of the surface S in cases other than offset surfaces; - in the case of an offset surface, the basis surface is first included according to the previous rules; then the bounding box is enlarged by the offset value. Warning Do not use these functions to add a non-finite surface to the bounding box B. If UMin, UMax, VMin or VMax is an infinite value B will become WholeSpace. S is an adapted surface, that is, an object which is an interface between: - the services provided by a surface from the package Geom - and those required of the surface by the computation algorithm. The adapted surface is created in the following way: Handle_Geom_Surface mysurface = ... ; GeomAdaptor_Surface S(mysurface); The bounding box B is then enlarged by adding this surface: Bnd_Box B; // ... Standard_Real Tol = ... ; AddSurface::Add ( S, Tol, B );

	:param S:
	:type S: Adaptor3d_Surface &
	:param Tol:
	:type Tol: float
	:param B:
	:type B: Bnd_Box &
	:rtype: void
") Add;
		static void Add (const Adaptor3d_Surface & S,const Standard_Real Tol,Bnd_Box & B);
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "	* Adds to the bounding box B the surface S the patch of the surface S limited in the u parametric direction by the two parameter values UMin, UMax, and in the v parametric direction by the two parameter values VMin, VMax. Note: depending on the type of curve, one of the following representations of the surface S is used to include it in the bounding box B: - an exact representation if S is built from a plane, a cylinder, a cone, a sphere or a torus, - the poles of the surface if S is built from a Bezier surface or a BSpline surface, - the points of an approximation of the surface S in cases other than offset surfaces; - in the case of an offset surface, the basis surface is first included according to the previous rules; then the bounding box is enlarged by the offset value. Warning Do not use these functions to add a non-finite surface to the bounding box B. If UMin, UMax, VMin or VMax is an infinite value B will become WholeSpace. S is an adapted surface, that is, an object which is an interface between: - the services provided by a surface from the package Geom - and those required of the surface by the computation algorithm. The adapted surface is created in the following way: Handle_Geom_Surface mysurface = ... ; GeomAdaptor_Surface S(mysurface); The bounding box B is then enlarged by adding this surface: Bnd_Box B; // ... Standard_Real Tol = ... ; AddSurface::Add ( S, Tol, B );

	:param S:
	:type S: Adaptor3d_Surface &
	:param UMin:
	:type UMin: float
	:param UMax:
	:type UMax: float
	:param VMin:
	:type VMin: float
	:param VMax:
	:type VMax: float
	:param Tol:
	:type Tol: float
	:param B:
	:type B: Bnd_Box &
	:rtype: void
") Add;
		static void Add (const Adaptor3d_Surface & S,const Standard_Real UMin,const Standard_Real UMax,const Standard_Real VMin,const Standard_Real VMax,const Standard_Real Tol,Bnd_Box & B);
};


%extend BndLib_AddSurface {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
