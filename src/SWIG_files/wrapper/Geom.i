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
%define GEOMDOCSTRING
"Geom module, see official documentation at
https://www.opencascade.com/doc/occt-7.4.0/refman/html/package_geom.html"
%enddef
%module (package="OCC.Core", docstring=GEOMDOCSTRING) Geom


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
#include<Geom_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<gp_module.hxx>
#include<GeomAbs_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import gp.i
%import GeomAbs.i
%import TColgp.i
%import TColStd.i

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
%wrap_handle(Geom_Geometry)
%wrap_handle(Geom_OsculatingSurface)
%wrap_handle(Geom_Transformation)
%wrap_handle(Geom_AxisPlacement)
%wrap_handle(Geom_Curve)
%wrap_handle(Geom_Point)
%wrap_handle(Geom_Surface)
%wrap_handle(Geom_Vector)
%wrap_handle(Geom_Axis1Placement)
%wrap_handle(Geom_Axis2Placement)
%wrap_handle(Geom_BoundedCurve)
%wrap_handle(Geom_BoundedSurface)
%wrap_handle(Geom_CartesianPoint)
%wrap_handle(Geom_Conic)
%wrap_handle(Geom_Direction)
%wrap_handle(Geom_ElementarySurface)
%wrap_handle(Geom_Line)
%wrap_handle(Geom_OffsetCurve)
%wrap_handle(Geom_OffsetSurface)
%wrap_handle(Geom_SweptSurface)
%wrap_handle(Geom_VectorWithMagnitude)
%wrap_handle(Geom_BSplineCurve)
%wrap_handle(Geom_BSplineSurface)
%wrap_handle(Geom_BezierCurve)
%wrap_handle(Geom_BezierSurface)
%wrap_handle(Geom_Circle)
%wrap_handle(Geom_ConicalSurface)
%wrap_handle(Geom_CylindricalSurface)
%wrap_handle(Geom_Ellipse)
%wrap_handle(Geom_Hyperbola)
%wrap_handle(Geom_Parabola)
%wrap_handle(Geom_Plane)
%wrap_handle(Geom_RectangularTrimmedSurface)
%wrap_handle(Geom_SphericalSurface)
%wrap_handle(Geom_SurfaceOfLinearExtrusion)
%wrap_handle(Geom_SurfaceOfRevolution)
%wrap_handle(Geom_ToroidalSurface)
%wrap_handle(Geom_TrimmedCurve)
%wrap_handle(Geom_HSequenceOfBSplineSurface)
/* end handles declaration */

/* templates */
%template(Geom_SequenceOfBSplineSurface) NCollection_Sequence<opencascade::handle<Geom_BSplineSurface>>;
/* end templates declaration */

/* typedefs */
typedef NCollection_Sequence<opencascade::handle<Geom_BSplineSurface>> Geom_SequenceOfBSplineSurface;
/* end typedefs declaration */

/**********************
* class Geom_Geometry *
**********************/
%nodefaultctor Geom_Geometry;
class Geom_Geometry : public Standard_Transient {
	public:
		/****************** Copy ******************/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "Creates a new object which is a copy of this geometric object.

Returns
-------
opencascade::handle<Geom_Geometry>
") Copy;
		virtual opencascade::handle<Geom_Geometry> Copy();

		/****************** Mirror ******************/
		%feature("compactdefaultargs") Mirror;
		%feature("autodoc", "Performs the symmetrical transformation of a geometry with respect to the point p which is the center of the symmetry.

Parameters
----------
P: gp_Pnt

Returns
-------
None
") Mirror;
		void Mirror(const gp_Pnt & P);

		/****************** Mirror ******************/
		%feature("compactdefaultargs") Mirror;
		%feature("autodoc", "Performs the symmetrical transformation of a geometry with respect to an axis placement which is the axis of the symmetry.

Parameters
----------
A1: gp_Ax1

Returns
-------
None
") Mirror;
		void Mirror(const gp_Ax1 & A1);

		/****************** Mirror ******************/
		%feature("compactdefaultargs") Mirror;
		%feature("autodoc", "Performs the symmetrical transformation of a geometry with respect to a plane. the axis placement a2 locates the plane of the symmetry : (location, xdirection, ydirection).

Parameters
----------
A2: gp_Ax2

Returns
-------
None
") Mirror;
		void Mirror(const gp_Ax2 & A2);

		/****************** Mirrored ******************/
		%feature("compactdefaultargs") Mirrored;
		%feature("autodoc", "No available documentation.

Parameters
----------
P: gp_Pnt

Returns
-------
opencascade::handle<Geom_Geometry>
") Mirrored;
		opencascade::handle<Geom_Geometry> Mirrored(const gp_Pnt & P);

		/****************** Mirrored ******************/
		%feature("compactdefaultargs") Mirrored;
		%feature("autodoc", "No available documentation.

Parameters
----------
A1: gp_Ax1

Returns
-------
opencascade::handle<Geom_Geometry>
") Mirrored;
		opencascade::handle<Geom_Geometry> Mirrored(const gp_Ax1 & A1);

		/****************** Mirrored ******************/
		%feature("compactdefaultargs") Mirrored;
		%feature("autodoc", "No available documentation.

Parameters
----------
A2: gp_Ax2

Returns
-------
opencascade::handle<Geom_Geometry>
") Mirrored;
		opencascade::handle<Geom_Geometry> Mirrored(const gp_Ax2 & A2);

		/****************** Rotate ******************/
		%feature("compactdefaultargs") Rotate;
		%feature("autodoc", "Rotates a geometry. a1 is the axis of the rotation. ang is the angular value of the rotation in radians.

Parameters
----------
A1: gp_Ax1
Ang: float

Returns
-------
None
") Rotate;
		void Rotate(const gp_Ax1 & A1, const Standard_Real Ang);

		/****************** Rotated ******************/
		%feature("compactdefaultargs") Rotated;
		%feature("autodoc", "No available documentation.

Parameters
----------
A1: gp_Ax1
Ang: float

Returns
-------
opencascade::handle<Geom_Geometry>
") Rotated;
		opencascade::handle<Geom_Geometry> Rotated(const gp_Ax1 & A1, const Standard_Real Ang);

		/****************** Scale ******************/
		%feature("compactdefaultargs") Scale;
		%feature("autodoc", "Scales a geometry. s is the scaling value.

Parameters
----------
P: gp_Pnt
S: float

Returns
-------
None
") Scale;
		void Scale(const gp_Pnt & P, const Standard_Real S);

		/****************** Scaled ******************/
		%feature("compactdefaultargs") Scaled;
		%feature("autodoc", "No available documentation.

Parameters
----------
P: gp_Pnt
S: float

Returns
-------
opencascade::handle<Geom_Geometry>
") Scaled;
		opencascade::handle<Geom_Geometry> Scaled(const gp_Pnt & P, const Standard_Real S);

		/****************** Transform ******************/
		%feature("compactdefaultargs") Transform;
		%feature("autodoc", "Transformation of a geometric object. this tansformation can be a translation, a rotation, a symmetry, a scaling or a complex transformation obtained by combination of the previous elementaries transformations. (see class transformation of the package geom).

Parameters
----------
T: gp_Trsf

Returns
-------
None
") Transform;
		virtual void Transform(const gp_Trsf & T);

		/****************** Transformed ******************/
		%feature("compactdefaultargs") Transformed;
		%feature("autodoc", "No available documentation.

Parameters
----------
T: gp_Trsf

Returns
-------
opencascade::handle<Geom_Geometry>
") Transformed;
		opencascade::handle<Geom_Geometry> Transformed(const gp_Trsf & T);

		/****************** Translate ******************/
		%feature("compactdefaultargs") Translate;
		%feature("autodoc", "Translates a geometry. v is the vector of the tanslation.

Parameters
----------
V: gp_Vec

Returns
-------
None
") Translate;
		void Translate(const gp_Vec & V);

		/****************** Translate ******************/
		%feature("compactdefaultargs") Translate;
		%feature("autodoc", "Translates a geometry from the point p1 to the point p2.

Parameters
----------
P1: gp_Pnt
P2: gp_Pnt

Returns
-------
None
") Translate;
		void Translate(const gp_Pnt & P1, const gp_Pnt & P2);

		/****************** Translated ******************/
		%feature("compactdefaultargs") Translated;
		%feature("autodoc", "No available documentation.

Parameters
----------
V: gp_Vec

Returns
-------
opencascade::handle<Geom_Geometry>
") Translated;
		opencascade::handle<Geom_Geometry> Translated(const gp_Vec & V);

		/****************** Translated ******************/
		%feature("compactdefaultargs") Translated;
		%feature("autodoc", "No available documentation.

Parameters
----------
P1: gp_Pnt
P2: gp_Pnt

Returns
-------
opencascade::handle<Geom_Geometry>
") Translated;
		opencascade::handle<Geom_Geometry> Translated(const gp_Pnt & P1, const gp_Pnt & P2);

};


%make_alias(Geom_Geometry)

%extend Geom_Geometry {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************
* class Geom_OsculatingSurface *
*******************************/
class Geom_OsculatingSurface : public Standard_Transient {
	public:
		/****************** Geom_OsculatingSurface ******************/
		%feature("compactdefaultargs") Geom_OsculatingSurface;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Geom_OsculatingSurface;
		 Geom_OsculatingSurface();

		/****************** Geom_OsculatingSurface ******************/
		%feature("compactdefaultargs") Geom_OsculatingSurface;
		%feature("autodoc", "Detects if the surface has punctual u or v isoparametric curve along on the bounds of the surface relativly to the tolerance tol and builds the corresponding osculating surfaces.

Parameters
----------
BS: Geom_Surface
Tol: float

Returns
-------
None
") Geom_OsculatingSurface;
		 Geom_OsculatingSurface(const opencascade::handle<Geom_Surface> & BS, const Standard_Real Tol);

		/****************** BasisSurface ******************/
		%feature("compactdefaultargs") BasisSurface;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<Geom_Surface>
") BasisSurface;
		opencascade::handle<Geom_Surface> BasisSurface();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
BS: Geom_Surface
Tol: float

Returns
-------
None
") Init;
		void Init(const opencascade::handle<Geom_Surface> & BS, const Standard_Real Tol);

		/****************** Tolerance ******************/
		%feature("compactdefaultargs") Tolerance;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") Tolerance;
		Standard_Real Tolerance();

		/****************** UOscSurf ******************/
		%feature("compactdefaultargs") UOscSurf;
		%feature("autodoc", "If standard_true, l is the local osculating surface along u at the point u,v.

Parameters
----------
U: float
V: float
L: Geom_BSplineSurface

Returns
-------
t: bool
") UOscSurf;
		Standard_Boolean UOscSurf(const Standard_Real U, const Standard_Real V, Standard_Boolean &OutValue, opencascade::handle<Geom_BSplineSurface> & L);

		/****************** VOscSurf ******************/
		%feature("compactdefaultargs") VOscSurf;
		%feature("autodoc", "If standard_true, l is the local osculating surface along v at the point u,v.

Parameters
----------
U: float
V: float
L: Geom_BSplineSurface

Returns
-------
t: bool
") VOscSurf;
		Standard_Boolean VOscSurf(const Standard_Real U, const Standard_Real V, Standard_Boolean &OutValue, opencascade::handle<Geom_BSplineSurface> & L);

};


%make_alias(Geom_OsculatingSurface)

%extend Geom_OsculatingSurface {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************
* class Geom_Transformation *
****************************/
class Geom_Transformation : public Standard_Transient {
	public:
		/****************** Geom_Transformation ******************/
		%feature("compactdefaultargs") Geom_Transformation;
		%feature("autodoc", "Creates an identity transformation.

Returns
-------
None
") Geom_Transformation;
		 Geom_Transformation();

		/****************** Geom_Transformation ******************/
		%feature("compactdefaultargs") Geom_Transformation;
		%feature("autodoc", "Creates a transient copy of t.

Parameters
----------
T: gp_Trsf

Returns
-------
None
") Geom_Transformation;
		 Geom_Transformation(const gp_Trsf & T);

		/****************** Copy ******************/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "Creates a new object which is a copy of this transformation.

Returns
-------
opencascade::handle<Geom_Transformation>
") Copy;
		opencascade::handle<Geom_Transformation> Copy();

		/****************** Form ******************/
		%feature("compactdefaultargs") Form;
		%feature("autodoc", "Returns the nature of this transformation as a value of the gp_trsfform enumeration.

Returns
-------
gp_TrsfForm
") Form;
		gp_TrsfForm Form();

		/****************** Invert ******************/
		%feature("compactdefaultargs") Invert;
		%feature("autodoc", "Raised if the the transformation is singular. this means that the scalefactor is lower or equal to resolution from package gp.

Returns
-------
None
") Invert;
		void Invert();

		/****************** Inverted ******************/
		%feature("compactdefaultargs") Inverted;
		%feature("autodoc", "Raised if the the transformation is singular. this means that the scalefactor is lower or equal to resolution from package gp.

Returns
-------
opencascade::handle<Geom_Transformation>
") Inverted;
		opencascade::handle<Geom_Transformation> Inverted();

		/****************** IsNegative ******************/
		%feature("compactdefaultargs") IsNegative;
		%feature("autodoc", "Checks whether this transformation is an indirect transformation: returns true if the determinant of the matrix of the vectorial part of the transformation is less than 0.

Returns
-------
bool
") IsNegative;
		Standard_Boolean IsNegative();

		/****************** Multiplied ******************/
		%feature("compactdefaultargs") Multiplied;
		%feature("autodoc", "Computes the transformation composed with other and <self>. <self> * other. returns a new transformation.

Parameters
----------
Other: Geom_Transformation

Returns
-------
opencascade::handle<Geom_Transformation>
") Multiplied;
		opencascade::handle<Geom_Transformation> Multiplied(const opencascade::handle<Geom_Transformation> & Other);

		/****************** Multiply ******************/
		%feature("compactdefaultargs") Multiply;
		%feature("autodoc", "Computes the transformation composed with other and <self> . <self> = <self> * other.

Parameters
----------
theOther: Geom_Transformation

Returns
-------
None
") Multiply;
		void Multiply(const opencascade::handle<Geom_Transformation> & theOther);

		/****************** Power ******************/
		%feature("compactdefaultargs") Power;
		%feature("autodoc", "Computes the following composition of transformations if n > 0 <self> * <self> * .......* <self>. if n = 0 identity if n < 0 <self>.invert() * .........* <self>.invert() //! raised if n < 0 and if the transformation is not inversible.

Parameters
----------
N: int

Returns
-------
None
") Power;
		void Power(const Standard_Integer N);

		/****************** Powered ******************/
		%feature("compactdefaultargs") Powered;
		%feature("autodoc", "Raised if n < 0 and if the transformation is not inversible.

Parameters
----------
N: int

Returns
-------
opencascade::handle<Geom_Transformation>
") Powered;
		opencascade::handle<Geom_Transformation> Powered(const Standard_Integer N);

		/****************** PreMultiply ******************/
		%feature("compactdefaultargs") PreMultiply;
		%feature("autodoc", "Computes the matrix of the transformation composed with <self> and other. <self> = other * <self>.

Parameters
----------
Other: Geom_Transformation

Returns
-------
None
") PreMultiply;
		void PreMultiply(const opencascade::handle<Geom_Transformation> & Other);

		/****************** ScaleFactor ******************/
		%feature("compactdefaultargs") ScaleFactor;
		%feature("autodoc", "Returns the scale value of the transformation.

Returns
-------
float
") ScaleFactor;
		Standard_Real ScaleFactor();

		/****************** SetMirror ******************/
		%feature("compactdefaultargs") SetMirror;
		%feature("autodoc", "Makes the transformation into a symmetrical transformation with respect to a point p. p is the center of the symmetry.

Parameters
----------
thePnt: gp_Pnt

Returns
-------
None
") SetMirror;
		void SetMirror(const gp_Pnt & thePnt);

		/****************** SetMirror ******************/
		%feature("compactdefaultargs") SetMirror;
		%feature("autodoc", "Makes the transformation into a symmetrical transformation with respect to an axis a1. a1 is the center of the axial symmetry.

Parameters
----------
theA1: gp_Ax1

Returns
-------
None
") SetMirror;
		void SetMirror(const gp_Ax1 & theA1);

		/****************** SetMirror ******************/
		%feature("compactdefaultargs") SetMirror;
		%feature("autodoc", "Makes the transformation into a symmetrical transformation with respect to a plane. the plane of the symmetry is defined with the axis placement a2. it is the plane (location, xdirection, ydirection).

Parameters
----------
theA2: gp_Ax2

Returns
-------
None
") SetMirror;
		void SetMirror(const gp_Ax2 & theA2);

		/****************** SetRotation ******************/
		%feature("compactdefaultargs") SetRotation;
		%feature("autodoc", "Makes the transformation into a rotation. a1 is the axis rotation and ang is the angular value of the rotation in radians.

Parameters
----------
theA1: gp_Ax1
theAng: float

Returns
-------
None
") SetRotation;
		void SetRotation(const gp_Ax1 & theA1, const Standard_Real theAng);

		/****************** SetScale ******************/
		%feature("compactdefaultargs") SetScale;
		%feature("autodoc", "Makes the transformation into a scale. p is the center of the scale and s is the scaling value.

Parameters
----------
thePnt: gp_Pnt
theScale: float

Returns
-------
None
") SetScale;
		void SetScale(const gp_Pnt & thePnt, const Standard_Real theScale);

		/****************** SetTransformation ******************/
		%feature("compactdefaultargs") SetTransformation;
		%feature("autodoc", "Makes a transformation allowing passage from the coordinate system 'fromsystem1' to the coordinate system 'tosystem2'. example : in a c++ implementation : real x1, y1, z1; // are the coordinates of a point in the // local system fromsystem1 real x2, y2, z2; // are the coordinates of a point in the // local system tosystem2 gp_pnt p1 (x1, y1, z1) geom_transformation t; t.settransformation (fromsystem1, tosystem2); gp_pnt p2 = p1.transformed (t); p2.coord (x2, y2, z2);.

Parameters
----------
theFromSystem1: gp_Ax3
theToSystem2: gp_Ax3

Returns
-------
None
") SetTransformation;
		void SetTransformation(const gp_Ax3 & theFromSystem1, const gp_Ax3 & theToSystem2);

		/****************** SetTransformation ******************/
		%feature("compactdefaultargs") SetTransformation;
		%feature("autodoc", "Makes the transformation allowing passage from the basic coordinate system {p(0.,0.,0.), vx (1.,0.,0.), vy (0.,1.,0.), vz (0., 0. ,1.) } to the local coordinate system defined with the ax2 tosystem. same utilisation as the previous method. fromsystem1 is defaulted to the absolute coordinate system.

Parameters
----------
theToSystem: gp_Ax3

Returns
-------
None
") SetTransformation;
		void SetTransformation(const gp_Ax3 & theToSystem);

		/****************** SetTranslation ******************/
		%feature("compactdefaultargs") SetTranslation;
		%feature("autodoc", "Makes the transformation into a translation. v is the vector of the translation.

Parameters
----------
theVec: gp_Vec

Returns
-------
None
") SetTranslation;
		void SetTranslation(const gp_Vec & theVec);

		/****************** SetTranslation ******************/
		%feature("compactdefaultargs") SetTranslation;
		%feature("autodoc", "Makes the transformation into a translation from the point p1 to the point p2.

Parameters
----------
P1: gp_Pnt
P2: gp_Pnt

Returns
-------
None
") SetTranslation;
		void SetTranslation(const gp_Pnt & P1, const gp_Pnt & P2);

		/****************** SetTrsf ******************/
		%feature("compactdefaultargs") SetTrsf;
		%feature("autodoc", "Converts the gp_trsf transformation t into this transformation.

Parameters
----------
theTrsf: gp_Trsf

Returns
-------
None
") SetTrsf;
		void SetTrsf(const gp_Trsf & theTrsf);

		/****************** Transforms ******************/
		%feature("compactdefaultargs") Transforms;
		%feature("autodoc", "Applies the transformation <self> to the triplet {x, y, z}.

Parameters
----------

Returns
-------
theX: float
theY: float
theZ: float
") Transforms;
		void Transforms(Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** Trsf ******************/
		%feature("compactdefaultargs") Trsf;
		%feature("autodoc", "Returns a non transient copy of <self>.

Returns
-------
gp_Trsf
") Trsf;
		const gp_Trsf Trsf();

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Returns the coefficients of the global matrix of transformation. it is a 3 rows x 4 columns matrix. //! raised if row < 1 or row > 3 or col < 1 or col > 4.

Parameters
----------
theRow: int
theCol: int

Returns
-------
float
") Value;
		Standard_Real Value(const Standard_Integer theRow, const Standard_Integer theCol);

};


%make_alias(Geom_Transformation)

%extend Geom_Transformation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************
* class Geom_AxisPlacement *
***************************/
%nodefaultctor Geom_AxisPlacement;
class Geom_AxisPlacement : public Geom_Geometry {
	public:
		/****************** Angle ******************/
		%feature("compactdefaultargs") Angle;
		%feature("autodoc", "Computes the angular value, in radians, between the 'main direction' of this positioning system and that of positioning system other. the result is a value between 0 and pi.

Parameters
----------
Other: Geom_AxisPlacement

Returns
-------
float
") Angle;
		Standard_Real Angle(const opencascade::handle<Geom_AxisPlacement> & Other);

		/****************** Axis ******************/
		%feature("compactdefaultargs") Axis;
		%feature("autodoc", "Returns the main axis of the axis placement. for an 'axis2placement' it is the main axis (location, direction ). for an 'axis1placement' this method returns a copy of <self>.

Returns
-------
gp_Ax1
") Axis;
		const gp_Ax1 Axis();

		/****************** Direction ******************/
		%feature("compactdefaultargs") Direction;
		%feature("autodoc", "Returns the main 'direction' of an axis placement.

Returns
-------
gp_Dir
") Direction;
		gp_Dir Direction();

		/****************** Location ******************/
		%feature("compactdefaultargs") Location;
		%feature("autodoc", "Returns the location point (origin) of the axis placement.

Returns
-------
gp_Pnt
") Location;
		gp_Pnt Location();

		/****************** SetAxis ******************/
		%feature("compactdefaultargs") SetAxis;
		%feature("autodoc", "Assigns a1 as the 'main axis' of this positioning system. this modifies - its origin, and - its 'main direction'. if this positioning system is a geom_axis2placement, then its 'x direction' and 'y direction' are recomputed. exceptions for a geom_axis2placement: standard_constructionerror if a1 and the previous 'x direction' of the coordinate system are parallel.

Parameters
----------
A1: gp_Ax1

Returns
-------
None
") SetAxis;
		void SetAxis(const gp_Ax1 & A1);

		/****************** SetDirection ******************/
		%feature("compactdefaultargs") SetDirection;
		%feature("autodoc", "Changes the direction of the axis placement. if <self> is an axis placement two axis the main 'direction' is modified and the 'xdirection' and 'ydirection' are recomputed. raises constructionerror only for an axis placement two axis if v and the previous 'xdirection' are parallel because it is not possible to calculate the new 'xdirection' and the new 'ydirection'.

Parameters
----------
V: gp_Dir

Returns
-------
None
") SetDirection;
		virtual void SetDirection(const gp_Dir & V);

		/****************** SetLocation ******************/
		%feature("compactdefaultargs") SetLocation;
		%feature("autodoc", "Assigns the point p as the origin of this positioning system.

Parameters
----------
P: gp_Pnt

Returns
-------
None
") SetLocation;
		void SetLocation(const gp_Pnt & P);

};


%make_alias(Geom_AxisPlacement)

%extend Geom_AxisPlacement {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************
* class Geom_Curve *
*******************/
%nodefaultctor Geom_Curve;
class Geom_Curve : public Geom_Geometry {
	public:
		/****************** Continuity ******************/
		%feature("compactdefaultargs") Continuity;
		%feature("autodoc", "It is the global continuity of the curve c0 : only geometric continuity, c1 : continuity of the first derivative all along the curve, c2 : continuity of the second derivative all along the curve, c3 : continuity of the third derivative all along the curve, g1 : tangency continuity all along the curve, g2 : curvature continuity all along the curve, cn : the order of continuity is infinite.

Returns
-------
GeomAbs_Shape
") Continuity;
		virtual GeomAbs_Shape Continuity();

		/****************** D0 ******************/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "Returns in p the point of parameter u. if the curve is periodic then the returned point is p(u) with u = ustart + (u - uend) where ustart and uend are the parametric bounds of the curve. //! raised only for the 'offsetcurve' if it is not possible to compute the current point. for example when the first derivative on the basis curve and the offset direction are parallel.

Parameters
----------
U: float
P: gp_Pnt

Returns
-------
None
") D0;
		virtual void D0(const Standard_Real U, gp_Pnt & P);

		/****************** D1 ******************/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "Returns the point p of parameter u and the first derivative v1. raised if the continuity of the curve is not c1.

Parameters
----------
U: float
P: gp_Pnt
V1: gp_Vec

Returns
-------
None
") D1;
		virtual void D1(const Standard_Real U, gp_Pnt & P, gp_Vec & V1);

		/****************** D2 ******************/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "Returns the point p of parameter u, the first and second derivatives v1 and v2. raised if the continuity of the curve is not c2.

Parameters
----------
U: float
P: gp_Pnt
V1: gp_Vec
V2: gp_Vec

Returns
-------
None
") D2;
		virtual void D2(const Standard_Real U, gp_Pnt & P, gp_Vec & V1, gp_Vec & V2);

		/****************** D3 ******************/
		%feature("compactdefaultargs") D3;
		%feature("autodoc", "Returns the point p of parameter u, the first, the second and the third derivative. raised if the continuity of the curve is not c3.

Parameters
----------
U: float
P: gp_Pnt
V1: gp_Vec
V2: gp_Vec
V3: gp_Vec

Returns
-------
None
") D3;
		virtual void D3(const Standard_Real U, gp_Pnt & P, gp_Vec & V1, gp_Vec & V2, gp_Vec & V3);

		/****************** DN ******************/
		%feature("compactdefaultargs") DN;
		%feature("autodoc", "The returned vector gives the value of the derivative for the order of derivation n. raised if the continuity of the curve is not cn. //! raised if the derivative cannot be computed easily. e.g. rational bspline and n > 3. raised if n < 1.

Parameters
----------
U: float
N: int

Returns
-------
gp_Vec
") DN;
		virtual gp_Vec DN(const Standard_Real U, const Standard_Integer N);

		/****************** FirstParameter ******************/
		%feature("compactdefaultargs") FirstParameter;
		%feature("autodoc", "Returns the value of the first parameter. warnings : it can be realfirst from package standard if the curve is infinite.

Returns
-------
float
") FirstParameter;
		virtual Standard_Real FirstParameter();

		/****************** IsCN ******************/
		%feature("compactdefaultargs") IsCN;
		%feature("autodoc", "Returns true if the degree of continuity of this curve is at least n. exceptions - standard_rangeerror if n is less than 0.

Parameters
----------
N: int

Returns
-------
bool
") IsCN;
		virtual Standard_Boolean IsCN(const Standard_Integer N);

		/****************** IsClosed ******************/
		%feature("compactdefaultargs") IsClosed;
		%feature("autodoc", "Returns true if the curve is closed. some curves such as circle are always closed, others such as line are never closed (by definition). some curves such as offsetcurve can be closed or not. these curves are considered as closed if the distance between the first point and the last point of the curve is lower or equal to the resolution from package gp wich is a fixed criterion independant of the application.

Returns
-------
bool
") IsClosed;
		virtual Standard_Boolean IsClosed();

		/****************** IsPeriodic ******************/
		%feature("compactdefaultargs") IsPeriodic;
		%feature("autodoc", "Is the parametrization of the curve periodic ? it is possible only if the curve is closed and if the following relation is satisfied : for each parametric value u the distance between the point p(u) and the point p (u + t) is lower or equal to resolution from package gp, t is the period and must be a constant. there are three possibilities : . the curve is never periodic by definition (segmentline) . the curve is always periodic by definition (circle) . the curve can be defined as periodic (bspline). in this case a function setperiodic allows you to give the shape of the curve. the general rule for this case is : if a curve can be periodic or not the default periodicity set is non periodic and you have to turn (explicitly) the curve into a periodic curve if you want the curve to be periodic.

Returns
-------
bool
") IsPeriodic;
		virtual Standard_Boolean IsPeriodic();

		/****************** LastParameter ******************/
		%feature("compactdefaultargs") LastParameter;
		%feature("autodoc", "Returns the value of the last parameter. warnings : it can be reallast from package standard if the curve is infinite.

Returns
-------
float
") LastParameter;
		virtual Standard_Real LastParameter();

		/****************** ParametricTransformation ******************/
		%feature("compactdefaultargs") ParametricTransformation;
		%feature("autodoc", "Returns a coefficient to compute the parameter on the transformed curve for the transform of the point on <self>. //! transformed(t)->value(u * parametrictransformation(t)) //! is the same point as //! value(u).transformed(t) //! this methods returns 1. //! it can be redefined. for example on the line.

Parameters
----------
T: gp_Trsf

Returns
-------
float
") ParametricTransformation;
		virtual Standard_Real ParametricTransformation(const gp_Trsf & T);

		/****************** Period ******************/
		%feature("compactdefaultargs") Period;
		%feature("autodoc", "Returns the period of this curve. exceptions standard_nosuchobject if this curve is not periodic.

Returns
-------
float
") Period;
		virtual Standard_Real Period();

		/****************** Reverse ******************/
		%feature("compactdefaultargs") Reverse;
		%feature("autodoc", "Changes the direction of parametrization of <self>. the 'firstparameter' and the 'lastparameter' are not changed but the orientation of the curve is modified. if the curve is bounded the startpoint of the initial curve becomes the endpoint of the reversed curve and the endpoint of the initial curve becomes the startpoint of the reversed curve.

Returns
-------
None
") Reverse;
		virtual void Reverse();

		/****************** Reversed ******************/
		%feature("compactdefaultargs") Reversed;
		%feature("autodoc", "Returns a copy of <self> reversed.

Returns
-------
opencascade::handle<Geom_Curve>
") Reversed;
		opencascade::handle<Geom_Curve> Reversed();

		/****************** ReversedParameter ******************/
		%feature("compactdefaultargs") ReversedParameter;
		%feature("autodoc", "Returns the parameter on the reversed curve for the point of parameter u on <self>. //! me->reversed()->value(me->reversedparameter(u)) //! is the same point as //! me->value(u).

Parameters
----------
U: float

Returns
-------
float
") ReversedParameter;
		virtual Standard_Real ReversedParameter(const Standard_Real U);

		/****************** TransformedParameter ******************/
		%feature("compactdefaultargs") TransformedParameter;
		%feature("autodoc", "Returns the parameter on the transformed curve for the transform of the point of parameter u on <self>. //! me->transformed(t)->value(me->transformedparameter(u,t)) //! is the same point as //! me->value(u).transformed(t) //! this methods returns <u> //! it can be redefined. for example on the line.

Parameters
----------
U: float
T: gp_Trsf

Returns
-------
float
") TransformedParameter;
		virtual Standard_Real TransformedParameter(const Standard_Real U, const gp_Trsf & T);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Computes the point of parameter u on <self>. if the curve is periodic then the returned point is p(u) with u = ustart + (u - uend) where ustart and uend are the parametric bounds of the curve. it is implemented with d0. //! raised only for the 'offsetcurve' if it is not possible to compute the current point. for example when the first derivative on the basis curve and the offset direction are parallel.

Parameters
----------
U: float

Returns
-------
gp_Pnt
") Value;
		gp_Pnt Value(const Standard_Real U);

};


%make_alias(Geom_Curve)

%extend Geom_Curve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************
* class Geom_Point *
*******************/
%nodefaultctor Geom_Point;
class Geom_Point : public Geom_Geometry {
	public:
		/****************** Coord ******************/
		%feature("compactdefaultargs") Coord;
		%feature("autodoc", "Returns the coordinates of <self>.

Parameters
----------

Returns
-------
X: float
Y: float
Z: float
") Coord;
		virtual void Coord(Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** Distance ******************/
		%feature("compactdefaultargs") Distance;
		%feature("autodoc", "Computes the distance between <self> and <other>.

Parameters
----------
Other: Geom_Point

Returns
-------
float
") Distance;
		Standard_Real Distance(const opencascade::handle<Geom_Point> & Other);

		/****************** Pnt ******************/
		%feature("compactdefaultargs") Pnt;
		%feature("autodoc", "Returns a non transient copy of <self>.

Returns
-------
gp_Pnt
") Pnt;
		virtual gp_Pnt Pnt();

		/****************** SquareDistance ******************/
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "Computes the square distance between <self> and <other>.

Parameters
----------
Other: Geom_Point

Returns
-------
float
") SquareDistance;
		Standard_Real SquareDistance(const opencascade::handle<Geom_Point> & Other);

		/****************** X ******************/
		%feature("compactdefaultargs") X;
		%feature("autodoc", "Returns the x coordinate of <self>.

Returns
-------
float
") X;
		virtual Standard_Real X();

		/****************** Y ******************/
		%feature("compactdefaultargs") Y;
		%feature("autodoc", "Returns the y coordinate of <self>.

Returns
-------
float
") Y;
		virtual Standard_Real Y();

		/****************** Z ******************/
		%feature("compactdefaultargs") Z;
		%feature("autodoc", "Returns the z coordinate of <self>.

Returns
-------
float
") Z;
		virtual Standard_Real Z();

};


%make_alias(Geom_Point)

%extend Geom_Point {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************
* class Geom_Surface *
*********************/
%nodefaultctor Geom_Surface;
class Geom_Surface : public Geom_Geometry {
	public:
		/****************** Bounds ******************/
		%feature("compactdefaultargs") Bounds;
		%feature("autodoc", "Returns the parametric bounds u1, u2, v1 and v2 of this surface. if the surface is infinite, this function can return a value equal to precision::infinite: instead of standard_real::lastreal.

Parameters
----------

Returns
-------
U1: float
U2: float
V1: float
V2: float
") Bounds;
		virtual void Bounds(Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** Continuity ******************/
		%feature("compactdefaultargs") Continuity;
		%feature("autodoc", "Returns the global continuity of the surface in direction u and v : c0 : only geometric continuity, c1 : continuity of the first derivative all along the surface, c2 : continuity of the second derivative all along the surface, c3 : continuity of the third derivative all along the surface, g1 : tangency continuity all along the surface, g2 : curvature continuity all along the surface, cn : the order of continuity is infinite. example : if the surface is c1 in the v parametric direction and c2 in the u parametric direction shape = c1.

Returns
-------
GeomAbs_Shape
") Continuity;
		virtual GeomAbs_Shape Continuity();

		/****************** D0 ******************/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "Computes the point of parameter u,v on the surface. //! raised only for an 'offsetsurface' if it is not possible to compute the current point.

Parameters
----------
U: float
V: float
P: gp_Pnt

Returns
-------
None
") D0;
		virtual void D0(const Standard_Real U, const Standard_Real V, gp_Pnt & P);

		/****************** D1 ******************/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "Computes the point p and the first derivatives in the directions u and v at this point. raised if the continuity of the surface is not c1.

Parameters
----------
U: float
V: float
P: gp_Pnt
D1U: gp_Vec
D1V: gp_Vec

Returns
-------
None
") D1;
		virtual void D1(const Standard_Real U, const Standard_Real V, gp_Pnt & P, gp_Vec & D1U, gp_Vec & D1V);

		/****************** D2 ******************/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "Computes the point p, the first and the second derivatives in the directions u and v at this point. raised if the continuity of the surface is not c2.

Parameters
----------
U: float
V: float
P: gp_Pnt
D1U: gp_Vec
D1V: gp_Vec
D2U: gp_Vec
D2V: gp_Vec
D2UV: gp_Vec

Returns
-------
None
") D2;
		virtual void D2(const Standard_Real U, const Standard_Real V, gp_Pnt & P, gp_Vec & D1U, gp_Vec & D1V, gp_Vec & D2U, gp_Vec & D2V, gp_Vec & D2UV);

		/****************** D3 ******************/
		%feature("compactdefaultargs") D3;
		%feature("autodoc", "Computes the point p, the first,the second and the third derivatives in the directions u and v at this point. raised if the continuity of the surface is not c2.

Parameters
----------
U: float
V: float
P: gp_Pnt
D1U: gp_Vec
D1V: gp_Vec
D2U: gp_Vec
D2V: gp_Vec
D2UV: gp_Vec
D3U: gp_Vec
D3V: gp_Vec
D3UUV: gp_Vec
D3UVV: gp_Vec

Returns
-------
None
") D3;
		virtual void D3(const Standard_Real U, const Standard_Real V, gp_Pnt & P, gp_Vec & D1U, gp_Vec & D1V, gp_Vec & D2U, gp_Vec & D2V, gp_Vec & D2UV, gp_Vec & D3U, gp_Vec & D3V, gp_Vec & D3UUV, gp_Vec & D3UVV);

		/****************** DN ******************/
		%feature("compactdefaultargs") DN;
		%feature("autodoc", "---purpose ; computes the derivative of order nu in the direction u and nv in the direction v at the point p(u, v). //! raised if the continuity of the surface is not cnu in the u direction or not cnv in the v direction. raised if nu + nv < 1 or nu < 0 or nv < 0.

Parameters
----------
U: float
V: float
Nu: int
Nv: int

Returns
-------
gp_Vec
") DN;
		virtual gp_Vec DN(const Standard_Real U, const Standard_Real V, const Standard_Integer Nu, const Standard_Integer Nv);

		/****************** IsCNu ******************/
		%feature("compactdefaultargs") IsCNu;
		%feature("autodoc", "Returns the order of continuity of the surface in the u parametric direction. raised if n < 0.

Parameters
----------
N: int

Returns
-------
bool
") IsCNu;
		virtual Standard_Boolean IsCNu(const Standard_Integer N);

		/****************** IsCNv ******************/
		%feature("compactdefaultargs") IsCNv;
		%feature("autodoc", "Returns the order of continuity of the surface in the v parametric direction. raised if n < 0.

Parameters
----------
N: int

Returns
-------
bool
") IsCNv;
		virtual Standard_Boolean IsCNv(const Standard_Integer N);

		/****************** IsUClosed ******************/
		%feature("compactdefaultargs") IsUClosed;
		%feature("autodoc", "Checks whether this surface is closed in the u parametric direction. returns true if, in the u parametric direction: taking ufirst and ulast as the parametric bounds in the u parametric direction, for each parameter v, the distance between the points p(ufirst, v) and p(ulast, v) is less than or equal to gp::resolution().

Returns
-------
bool
") IsUClosed;
		virtual Standard_Boolean IsUClosed();

		/****************** IsUPeriodic ******************/
		%feature("compactdefaultargs") IsUPeriodic;
		%feature("autodoc", "Checks if this surface is periodic in the u parametric direction. returns true if: - this surface is closed in the u parametric direction, and - there is a constant t such that the distance between the points p (u, v) and p (u + t, v) (or the points p (u, v) and p (u, v + t)) is less than or equal to gp::resolution(). note: t is the parametric period in the u parametric direction.

Returns
-------
bool
") IsUPeriodic;
		virtual Standard_Boolean IsUPeriodic();

		/****************** IsVClosed ******************/
		%feature("compactdefaultargs") IsVClosed;
		%feature("autodoc", "Checks whether this surface is closed in the u parametric direction. returns true if, in the v parametric direction: taking vfirst and vlast as the parametric bounds in the v parametric direction, for each parameter u, the distance between the points p(u, vfirst) and p(u, vlast) is less than or equal to gp::resolution().

Returns
-------
bool
") IsVClosed;
		virtual Standard_Boolean IsVClosed();

		/****************** IsVPeriodic ******************/
		%feature("compactdefaultargs") IsVPeriodic;
		%feature("autodoc", "Checks if this surface is periodic in the v parametric direction. returns true if: - this surface is closed in the v parametric direction, and - there is a constant t such that the distance between the points p (u, v) and p (u + t, v) (or the points p (u, v) and p (u, v + t)) is less than or equal to gp::resolution(). note: t is the parametric period in the v parametric direction.

Returns
-------
bool
") IsVPeriodic;
		virtual Standard_Boolean IsVPeriodic();

		/****************** ParametricTransformation ******************/
		%feature("compactdefaultargs") ParametricTransformation;
		%feature("autodoc", "Returns a 2d transformation used to find the new parameters of a point on the transformed surface. //! me->transformed(t)->value(u',v') //! is the same point as //! me->value(u,v).transformed(t) //! where u',v' are obtained by transforming u,v with th 2d transformation returned by //! me->parametrictransformation(t) //! this methods returns an identity transformation //! it can be redefined. for example on the plane, cylinder, cone, revolved and extruded surfaces.

Parameters
----------
T: gp_Trsf

Returns
-------
gp_GTrsf2d
") ParametricTransformation;
		virtual gp_GTrsf2d ParametricTransformation(const gp_Trsf & T);

		/****************** TransformParameters ******************/
		%feature("compactdefaultargs") TransformParameters;
		%feature("autodoc", "Computes the parameters on the transformed surface for the transform of the point of parameters u,v on <self>. //! me->transformed(t)->value(u',v') //! is the same point as //! me->value(u,v).transformed(t) //! where u',v' are the new values of u,v after calling //! me->tranformparameters(u,v,t) //! this methods does not change <u> and <v> //! it can be redefined. for example on the plane, cylinder, cone, revolved and extruded surfaces.

Parameters
----------
T: gp_Trsf

Returns
-------
U: float
V: float
") TransformParameters;
		virtual void TransformParameters(Standard_Real &OutValue, Standard_Real &OutValue, const gp_Trsf & T);

		/****************** UIso ******************/
		%feature("compactdefaultargs") UIso;
		%feature("autodoc", "Computes the u isoparametric curve.

Parameters
----------
U: float

Returns
-------
opencascade::handle<Geom_Curve>
") UIso;
		virtual opencascade::handle<Geom_Curve> UIso(const Standard_Real U);

		/****************** UPeriod ******************/
		%feature("compactdefaultargs") UPeriod;
		%feature("autodoc", "Returns the period of this surface in the u parametric direction. raises if the surface is not uperiodic.

Returns
-------
float
") UPeriod;
		virtual Standard_Real UPeriod();

		/****************** UReverse ******************/
		%feature("compactdefaultargs") UReverse;
		%feature("autodoc", "Reverses the u direction of parametrization of <self>. the bounds of the surface are not modified.

Returns
-------
None
") UReverse;
		virtual void UReverse();

		/****************** UReversed ******************/
		%feature("compactdefaultargs") UReversed;
		%feature("autodoc", "Reverses the u direction of parametrization of <self>. the bounds of the surface are not modified. a copy of <self> is returned.

Returns
-------
opencascade::handle<Geom_Surface>
") UReversed;
		opencascade::handle<Geom_Surface> UReversed();

		/****************** UReversedParameter ******************/
		%feature("compactdefaultargs") UReversedParameter;
		%feature("autodoc", "Returns the parameter on the ureversed surface for the point of parameter u on <self>. //! me->ureversed()->value(me->ureversedparameter(u),v) //! is the same point as //! me->value(u,v).

Parameters
----------
U: float

Returns
-------
float
") UReversedParameter;
		virtual Standard_Real UReversedParameter(const Standard_Real U);

		/****************** VIso ******************/
		%feature("compactdefaultargs") VIso;
		%feature("autodoc", "Computes the v isoparametric curve.

Parameters
----------
V: float

Returns
-------
opencascade::handle<Geom_Curve>
") VIso;
		virtual opencascade::handle<Geom_Curve> VIso(const Standard_Real V);

		/****************** VPeriod ******************/
		%feature("compactdefaultargs") VPeriod;
		%feature("autodoc", "Returns the period of this surface in the v parametric direction. raises if the surface is not vperiodic.

Returns
-------
float
") VPeriod;
		virtual Standard_Real VPeriod();

		/****************** VReverse ******************/
		%feature("compactdefaultargs") VReverse;
		%feature("autodoc", "Reverses the v direction of parametrization of <self>. the bounds of the surface are not modified.

Returns
-------
None
") VReverse;
		virtual void VReverse();

		/****************** VReversed ******************/
		%feature("compactdefaultargs") VReversed;
		%feature("autodoc", "Reverses the v direction of parametrization of <self>. the bounds of the surface are not modified. a copy of <self> is returned.

Returns
-------
opencascade::handle<Geom_Surface>
") VReversed;
		opencascade::handle<Geom_Surface> VReversed();

		/****************** VReversedParameter ******************/
		%feature("compactdefaultargs") VReversedParameter;
		%feature("autodoc", "Returns the parameter on the vreversed surface for the point of parameter v on <self>. //! me->vreversed()->value(u,me->vreversedparameter(v)) //! is the same point as //! me->value(u,v).

Parameters
----------
V: float

Returns
-------
float
") VReversedParameter;
		virtual Standard_Real VReversedParameter(const Standard_Real V);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Computes the point of parameter u on the surface. //! it is implemented with d0 //! raised only for an 'offsetsurface' if it is not possible to compute the current point.

Parameters
----------
U: float
V: float

Returns
-------
gp_Pnt
") Value;
		gp_Pnt Value(const Standard_Real U, const Standard_Real V);

};


%make_alias(Geom_Surface)

%extend Geom_Surface {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************
* class Geom_Vector *
********************/
%nodefaultctor Geom_Vector;
class Geom_Vector : public Geom_Geometry {
	public:
		/****************** Angle ******************/
		%feature("compactdefaultargs") Angle;
		%feature("autodoc", "Computes the angular value, in radians, between this vector and vector other. the result is a value between 0 and pi. exceptions gp_vectorwithnullmagnitude if: - the magnitude of this vector is less than or equal to gp::resolution(), or - the magnitude of vector other is less than or equal to gp::resolution().

Parameters
----------
Other: Geom_Vector

Returns
-------
float
") Angle;
		Standard_Real Angle(const opencascade::handle<Geom_Vector> & Other);

		/****************** AngleWithRef ******************/
		%feature("compactdefaultargs") AngleWithRef;
		%feature("autodoc", "Computes the angular value, in radians, between this vector and vector other. the result is a value between -pi and pi. the vector vref defines the positive sense of rotation: the angular value is positive if the cross product this ^ other has the same orientation as vref (in relation to the plane defined by this vector and vector other). otherwise, it is negative. exceptions standard_domainerror if this vector, vector other and vector vref are coplanar, except if this vector and vector other are parallel. gp_vectorwithnullmagnitude if the magnitude of this vector, vector other or vector vref is less than or equal to gp::resolution().

Parameters
----------
Other: Geom_Vector
VRef: Geom_Vector

Returns
-------
float
") AngleWithRef;
		Standard_Real AngleWithRef(const opencascade::handle<Geom_Vector> & Other, const opencascade::handle<Geom_Vector> & VRef);

		/****************** Coord ******************/
		%feature("compactdefaultargs") Coord;
		%feature("autodoc", "Returns the coordinates x, y and z of this vector.

Parameters
----------

Returns
-------
X: float
Y: float
Z: float
") Coord;
		void Coord(Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** Cross ******************/
		%feature("compactdefaultargs") Cross;
		%feature("autodoc", "Computes the cross product between <self> and <other>. //! raised if <self> is a 'direction' and if <self> and <other> are parallel because it is not possible to build a 'direction' with null length.

Parameters
----------
Other: Geom_Vector

Returns
-------
None
") Cross;
		virtual void Cross(const opencascade::handle<Geom_Vector> & Other);

		/****************** CrossCross ******************/
		%feature("compactdefaultargs") CrossCross;
		%feature("autodoc", "Computes the triple vector product <self> ^(v1 ^ v2). //! raised if <self> is a 'direction' and if v1 and v2 are parallel or <self> and (v1 ^ v2) are parallel.

Parameters
----------
V1: Geom_Vector
V2: Geom_Vector

Returns
-------
None
") CrossCross;
		virtual void CrossCross(const opencascade::handle<Geom_Vector> & V1, const opencascade::handle<Geom_Vector> & V2);

		/****************** CrossCrossed ******************/
		%feature("compactdefaultargs") CrossCrossed;
		%feature("autodoc", "Computes the triple vector product <self> ^(v1 ^ v2). //! raised if <self> is a direction and if v1 and v2 are parallel or <self> and (v1 ^ v2) are parallel.

Parameters
----------
V1: Geom_Vector
V2: Geom_Vector

Returns
-------
opencascade::handle<Geom_Vector>
") CrossCrossed;
		virtual opencascade::handle<Geom_Vector> CrossCrossed(const opencascade::handle<Geom_Vector> & V1, const opencascade::handle<Geom_Vector> & V2);

		/****************** Crossed ******************/
		%feature("compactdefaultargs") Crossed;
		%feature("autodoc", "Computes the cross product between <self> and <other>. a new direction is returned. //! raised if <self> is a 'direction' and if the two vectors are parallel because it is not possible to create a 'direction' with null length.

Parameters
----------
Other: Geom_Vector

Returns
-------
opencascade::handle<Geom_Vector>
") Crossed;
		virtual opencascade::handle<Geom_Vector> Crossed(const opencascade::handle<Geom_Vector> & Other);

		/****************** Dot ******************/
		%feature("compactdefaultargs") Dot;
		%feature("autodoc", "Computes the scalar product of this vector and vector other.

Parameters
----------
Other: Geom_Vector

Returns
-------
float
") Dot;
		Standard_Real Dot(const opencascade::handle<Geom_Vector> & Other);

		/****************** DotCross ******************/
		%feature("compactdefaultargs") DotCross;
		%feature("autodoc", "Computes the triple scalar product. returns me . (v1 ^ v2).

Parameters
----------
V1: Geom_Vector
V2: Geom_Vector

Returns
-------
float
") DotCross;
		Standard_Real DotCross(const opencascade::handle<Geom_Vector> & V1, const opencascade::handle<Geom_Vector> & V2);

		/****************** Magnitude ******************/
		%feature("compactdefaultargs") Magnitude;
		%feature("autodoc", "Returns the magnitude of <self>.

Returns
-------
float
") Magnitude;
		virtual Standard_Real Magnitude();

		/****************** Reverse ******************/
		%feature("compactdefaultargs") Reverse;
		%feature("autodoc", "Reverses the vector <self>.

Returns
-------
None
") Reverse;
		void Reverse();

		/****************** Reversed ******************/
		%feature("compactdefaultargs") Reversed;
		%feature("autodoc", "Returns a copy of <self> reversed.

Returns
-------
opencascade::handle<Geom_Vector>
") Reversed;
		opencascade::handle<Geom_Vector> Reversed();

		/****************** SquareMagnitude ******************/
		%feature("compactdefaultargs") SquareMagnitude;
		%feature("autodoc", "Returns the square magnitude of <self>.

Returns
-------
float
") SquareMagnitude;
		virtual Standard_Real SquareMagnitude();

		/****************** Vec ******************/
		%feature("compactdefaultargs") Vec;
		%feature("autodoc", "Converts this vector into a gp_vec vector.

Returns
-------
gp_Vec
") Vec;
		const gp_Vec Vec();

		/****************** X ******************/
		%feature("compactdefaultargs") X;
		%feature("autodoc", "Returns the x coordinate of <self>.

Returns
-------
float
") X;
		Standard_Real X();

		/****************** Y ******************/
		%feature("compactdefaultargs") Y;
		%feature("autodoc", "Returns the y coordinate of <self>.

Returns
-------
float
") Y;
		Standard_Real Y();

		/****************** Z ******************/
		%feature("compactdefaultargs") Z;
		%feature("autodoc", "Returns the z coordinate of <self>.

Returns
-------
float
") Z;
		Standard_Real Z();

};


%make_alias(Geom_Vector)

%extend Geom_Vector {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************
* class Geom_Axis1Placement *
****************************/
class Geom_Axis1Placement : public Geom_AxisPlacement {
	public:
		/****************** Geom_Axis1Placement ******************/
		%feature("compactdefaultargs") Geom_Axis1Placement;
		%feature("autodoc", "Returns a transient copy of a1.

Parameters
----------
A1: gp_Ax1

Returns
-------
None
") Geom_Axis1Placement;
		 Geom_Axis1Placement(const gp_Ax1 & A1);

		/****************** Geom_Axis1Placement ******************/
		%feature("compactdefaultargs") Geom_Axis1Placement;
		%feature("autodoc", "P is the origin of the axis placement and v is the direction of the axis placement.

Parameters
----------
P: gp_Pnt
V: gp_Dir

Returns
-------
None
") Geom_Axis1Placement;
		 Geom_Axis1Placement(const gp_Pnt & P, const gp_Dir & V);

		/****************** Ax1 ******************/
		%feature("compactdefaultargs") Ax1;
		%feature("autodoc", "Returns a non transient copy of <self>.

Returns
-------
gp_Ax1
") Ax1;
		const gp_Ax1 Ax1();

		/****************** Copy ******************/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "Creates a new object, which is a copy of this axis.

Returns
-------
opencascade::handle<Geom_Geometry>
") Copy;
		opencascade::handle<Geom_Geometry> Copy();

		/****************** Reverse ******************/
		%feature("compactdefaultargs") Reverse;
		%feature("autodoc", "Reverses the direction of the axis placement.

Returns
-------
None
") Reverse;
		void Reverse();

		/****************** Reversed ******************/
		%feature("compactdefaultargs") Reversed;
		%feature("autodoc", "Returns a copy of <self> reversed.

Returns
-------
opencascade::handle<Geom_Axis1Placement>
") Reversed;
		opencascade::handle<Geom_Axis1Placement> Reversed();

		/****************** SetDirection ******************/
		%feature("compactdefaultargs") SetDirection;
		%feature("autodoc", "Assigns v to the unit vector of this axis.

Parameters
----------
V: gp_Dir

Returns
-------
None
") SetDirection;
		void SetDirection(const gp_Dir & V);

		/****************** Transform ******************/
		%feature("compactdefaultargs") Transform;
		%feature("autodoc", "Applies the transformation t to this axis.

Parameters
----------
T: gp_Trsf

Returns
-------
None
") Transform;
		void Transform(const gp_Trsf & T);

};


%make_alias(Geom_Axis1Placement)

%extend Geom_Axis1Placement {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************
* class Geom_Axis2Placement *
****************************/
class Geom_Axis2Placement : public Geom_AxisPlacement {
	public:
		/****************** Geom_Axis2Placement ******************/
		%feature("compactdefaultargs") Geom_Axis2Placement;
		%feature("autodoc", "Returns a transient copy of a2.

Parameters
----------
A2: gp_Ax2

Returns
-------
None
") Geom_Axis2Placement;
		 Geom_Axis2Placement(const gp_Ax2 & A2);

		/****************** Geom_Axis2Placement ******************/
		%feature("compactdefaultargs") Geom_Axis2Placement;
		%feature("autodoc", "P is the origin of the axis placement, n is the main direction of the axis placement and vx is the 'xdirection'. if the two directions n and vx are not orthogonal the 'xdirection' is computed as follow : xdirection = n ^ (vx ^ n). raised if n and vx are parallel.

Parameters
----------
P: gp_Pnt
N: gp_Dir
Vx: gp_Dir

Returns
-------
None
") Geom_Axis2Placement;
		 Geom_Axis2Placement(const gp_Pnt & P, const gp_Dir & N, const gp_Dir & Vx);

		/****************** Ax2 ******************/
		%feature("compactdefaultargs") Ax2;
		%feature("autodoc", "Returns a non transient copy of <self>.

Returns
-------
gp_Ax2
") Ax2;
		gp_Ax2 Ax2();

		/****************** Copy ******************/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "Creates a new object which is a copy of this coordinate system.

Returns
-------
opencascade::handle<Geom_Geometry>
") Copy;
		opencascade::handle<Geom_Geometry> Copy();

		/****************** SetAx2 ******************/
		%feature("compactdefaultargs") SetAx2;
		%feature("autodoc", "Assigns the origin and the three unit vectors of a2 to this coordinate system.

Parameters
----------
A2: gp_Ax2

Returns
-------
None
") SetAx2;
		void SetAx2(const gp_Ax2 & A2);

		/****************** SetDirection ******************/
		%feature("compactdefaultargs") SetDirection;
		%feature("autodoc", "Changes the main direction of the axis placement. the 'xdirection' is modified : new xdirection = v ^ (previous_xdirection ^ v). //! raised if v and the previous 'xdirection' are parallel because it is impossible to calculate the new 'xdirection' and the new 'ydirection'.

Parameters
----------
V: gp_Dir

Returns
-------
None
") SetDirection;
		void SetDirection(const gp_Dir & V);

		/****************** SetXDirection ******************/
		%feature("compactdefaultargs") SetXDirection;
		%feature("autodoc", "Changes the 'xdirection' of the axis placement, vx is the new 'xdirection'. if vx is not normal to the main direction then 'xdirection' is computed as follow : xdirection = direction ^ ( vx ^ direction). the main direction is not modified. raised if vx and 'direction' are parallel.

Parameters
----------
Vx: gp_Dir

Returns
-------
None
") SetXDirection;
		void SetXDirection(const gp_Dir & Vx);

		/****************** SetYDirection ******************/
		%feature("compactdefaultargs") SetYDirection;
		%feature("autodoc", "Changes the 'ydirection' of the axis placement, vy is the new 'ydirection'. if vy is not normal to the main direction then 'ydirection' is computed as follow : ydirection = direction ^ ( vy ^ direction). the main direction is not modified. the 'xdirection' is modified. raised if vy and the main direction are parallel.

Parameters
----------
Vy: gp_Dir

Returns
-------
None
") SetYDirection;
		void SetYDirection(const gp_Dir & Vy);

		/****************** Transform ******************/
		%feature("compactdefaultargs") Transform;
		%feature("autodoc", "Transforms an axis placement with a trsf. the 'location' point, the 'xdirection' and the 'ydirection' are transformed with t. the resulting main 'direction' of <self> is the cross product between the 'xdirection' and the 'ydirection' after transformation.

Parameters
----------
T: gp_Trsf

Returns
-------
None
") Transform;
		void Transform(const gp_Trsf & T);

		/****************** XDirection ******************/
		%feature("compactdefaultargs") XDirection;
		%feature("autodoc", "Returns the 'xdirection'. this is a unit vector.

Returns
-------
gp_Dir
") XDirection;
		const gp_Dir XDirection();

		/****************** YDirection ******************/
		%feature("compactdefaultargs") YDirection;
		%feature("autodoc", "Returns the 'ydirection'. this is a unit vector.

Returns
-------
gp_Dir
") YDirection;
		const gp_Dir YDirection();

};


%make_alias(Geom_Axis2Placement)

%extend Geom_Axis2Placement {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************
* class Geom_BoundedCurve *
**************************/
%nodefaultctor Geom_BoundedCurve;
class Geom_BoundedCurve : public Geom_Curve {
	public:
		/****************** EndPoint ******************/
		%feature("compactdefaultargs") EndPoint;
		%feature("autodoc", "Returns the end point of the curve.

Returns
-------
gp_Pnt
") EndPoint;
		virtual gp_Pnt EndPoint();

		/****************** StartPoint ******************/
		%feature("compactdefaultargs") StartPoint;
		%feature("autodoc", "Returns the start point of the curve.

Returns
-------
gp_Pnt
") StartPoint;
		virtual gp_Pnt StartPoint();

};


%make_alias(Geom_BoundedCurve)

%extend Geom_BoundedCurve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************
* class Geom_BoundedSurface *
****************************/
%nodefaultctor Geom_BoundedSurface;
class Geom_BoundedSurface : public Geom_Surface {
	public:
};


%make_alias(Geom_BoundedSurface)

%extend Geom_BoundedSurface {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************
* class Geom_CartesianPoint *
****************************/
class Geom_CartesianPoint : public Geom_Point {
	public:
		/****************** Geom_CartesianPoint ******************/
		%feature("compactdefaultargs") Geom_CartesianPoint;
		%feature("autodoc", "Returns a transient copy of p.

Parameters
----------
P: gp_Pnt

Returns
-------
None
") Geom_CartesianPoint;
		 Geom_CartesianPoint(const gp_Pnt & P);

		/****************** Geom_CartesianPoint ******************/
		%feature("compactdefaultargs") Geom_CartesianPoint;
		%feature("autodoc", "Constructs a point defined by its three cartesian coordinates x, y and z.

Parameters
----------
X: float
Y: float
Z: float

Returns
-------
None
") Geom_CartesianPoint;
		 Geom_CartesianPoint(const Standard_Real X, const Standard_Real Y, const Standard_Real Z);

		/****************** Coord ******************/
		%feature("compactdefaultargs") Coord;
		%feature("autodoc", "Returns the coordinates of <self>.

Parameters
----------

Returns
-------
X: float
Y: float
Z: float
") Coord;
		void Coord(Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** Copy ******************/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "Creates a new object which is a copy of this point.

Returns
-------
opencascade::handle<Geom_Geometry>
") Copy;
		opencascade::handle<Geom_Geometry> Copy();

		/****************** Pnt ******************/
		%feature("compactdefaultargs") Pnt;
		%feature("autodoc", "Returns a non transient cartesian point with the same coordinates as <self>.

Returns
-------
gp_Pnt
") Pnt;
		gp_Pnt Pnt();

		/****************** SetCoord ******************/
		%feature("compactdefaultargs") SetCoord;
		%feature("autodoc", "Assigns the coordinates x, y and z to this point.

Parameters
----------
X: float
Y: float
Z: float

Returns
-------
None
") SetCoord;
		void SetCoord(const Standard_Real X, const Standard_Real Y, const Standard_Real Z);

		/****************** SetPnt ******************/
		%feature("compactdefaultargs") SetPnt;
		%feature("autodoc", "Set <self> to p.x(), p.y(), p.z() coordinates.

Parameters
----------
P: gp_Pnt

Returns
-------
None
") SetPnt;
		void SetPnt(const gp_Pnt & P);

		/****************** SetX ******************/
		%feature("compactdefaultargs") SetX;
		%feature("autodoc", "Changes the x coordinate of me.

Parameters
----------
X: float

Returns
-------
None
") SetX;
		void SetX(const Standard_Real X);

		/****************** SetY ******************/
		%feature("compactdefaultargs") SetY;
		%feature("autodoc", "Changes the y coordinate of me.

Parameters
----------
Y: float

Returns
-------
None
") SetY;
		void SetY(const Standard_Real Y);

		/****************** SetZ ******************/
		%feature("compactdefaultargs") SetZ;
		%feature("autodoc", "Changes the z coordinate of me.

Parameters
----------
Z: float

Returns
-------
None
") SetZ;
		void SetZ(const Standard_Real Z);

		/****************** Transform ******************/
		%feature("compactdefaultargs") Transform;
		%feature("autodoc", "Applies the transformation t to this point.

Parameters
----------
T: gp_Trsf

Returns
-------
None
") Transform;
		void Transform(const gp_Trsf & T);

		/****************** X ******************/
		%feature("compactdefaultargs") X;
		%feature("autodoc", "Returns the x coordinate of <self>.

Returns
-------
float
") X;
		Standard_Real X();

		/****************** Y ******************/
		%feature("compactdefaultargs") Y;
		%feature("autodoc", "Returns the y coordinate of <self>.

Returns
-------
float
") Y;
		Standard_Real Y();

		/****************** Z ******************/
		%feature("compactdefaultargs") Z;
		%feature("autodoc", "Returns the z coordinate of <self>.

Returns
-------
float
") Z;
		Standard_Real Z();

};


%make_alias(Geom_CartesianPoint)

%extend Geom_CartesianPoint {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************
* class Geom_Conic *
*******************/
%nodefaultctor Geom_Conic;
class Geom_Conic : public Geom_Curve {
	public:
		/****************** Axis ******************/
		%feature("compactdefaultargs") Axis;
		%feature("autodoc", "Returns the 'main axis' of this conic. this axis is normal to the plane of the conic.

Returns
-------
gp_Ax1
") Axis;
		gp_Ax1 Axis();

		/****************** Continuity ******************/
		%feature("compactdefaultargs") Continuity;
		%feature("autodoc", "The continuity of the conic is cn.

Returns
-------
GeomAbs_Shape
") Continuity;
		GeomAbs_Shape Continuity();

		/****************** Eccentricity ******************/
		%feature("compactdefaultargs") Eccentricity;
		%feature("autodoc", "Returns the eccentricity value of the conic e. e = 0 for a circle 0 < e < 1 for an ellipse (e = 0 if majorradius = minorradius) e > 1 for a hyperbola e = 1 for a parabola exceptions standard_domainerror in the case of a hyperbola if its major radius is null.

Returns
-------
float
") Eccentricity;
		virtual Standard_Real Eccentricity();

		/****************** IsCN ******************/
		%feature("compactdefaultargs") IsCN;
		%feature("autodoc", "Returns true. raised if n < 0.

Parameters
----------
N: int

Returns
-------
bool
") IsCN;
		Standard_Boolean IsCN(const Standard_Integer N);

		/****************** Location ******************/
		%feature("compactdefaultargs") Location;
		%feature("autodoc", "Returns the location point of the conic. for the circle, the ellipse and the hyperbola it is the center of the conic. for the parabola it is the apex of the parabola.

Returns
-------
gp_Pnt
") Location;
		gp_Pnt Location();

		/****************** Position ******************/
		%feature("compactdefaultargs") Position;
		%feature("autodoc", "Returns the local coordinates system of the conic. the main direction of the axis2placement is normal to the plane of the conic. the x direction of the axis2placement is in the plane of the conic and corresponds to the origin for the conic's parametric value u.

Returns
-------
gp_Ax2
") Position;
		const gp_Ax2 Position();

		/****************** Reverse ******************/
		%feature("compactdefaultargs") Reverse;
		%feature("autodoc", "Reverses the direction of parameterization of <self>. the local coordinate system of the conic is modified.

Returns
-------
None
") Reverse;
		void Reverse();

		/****************** ReversedParameter ******************/
		%feature("compactdefaultargs") ReversedParameter;
		%feature("autodoc", "Returns the parameter on the reversed curve for the point of parameter u on <self>.

Parameters
----------
U: float

Returns
-------
float
") ReversedParameter;
		virtual Standard_Real ReversedParameter(const Standard_Real U);

		/****************** SetAxis ******************/
		%feature("compactdefaultargs") SetAxis;
		%feature("autodoc", "Changes the orientation of the conic's plane. the normal axis to the plane is a1. the xaxis and the yaxis are recomputed. //! raised if the a1 is parallel to the xaxis of the conic.

Parameters
----------
A1: gp_Ax1

Returns
-------
None
") SetAxis;
		void SetAxis(const gp_Ax1 & A1);

		/****************** SetLocation ******************/
		%feature("compactdefaultargs") SetLocation;
		%feature("autodoc", "Changes the location point of the conic.

Parameters
----------
P: gp_Pnt

Returns
-------
None
") SetLocation;
		void SetLocation(const gp_Pnt & P);

		/****************** SetPosition ******************/
		%feature("compactdefaultargs") SetPosition;
		%feature("autodoc", "Changes the local coordinate system of the conic.

Parameters
----------
A2: gp_Ax2

Returns
-------
None
") SetPosition;
		void SetPosition(const gp_Ax2 & A2);

		/****************** XAxis ******************/
		%feature("compactdefaultargs") XAxis;
		%feature("autodoc", "Returns the xaxis of the conic. this axis defines the origin of parametrization of the conic. this axis is perpendicular to the axis of the conic. this axis and the yaxis define the plane of the conic.

Returns
-------
gp_Ax1
") XAxis;
		gp_Ax1 XAxis();

		/****************** YAxis ******************/
		%feature("compactdefaultargs") YAxis;
		%feature("autodoc", "Returns the yaxis of the conic. the yaxis is perpendicular to the xaxis. this axis and the xaxis define the plane of the conic.

Returns
-------
gp_Ax1
") YAxis;
		gp_Ax1 YAxis();

};


%make_alias(Geom_Conic)

%extend Geom_Conic {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************
* class Geom_Direction *
***********************/
class Geom_Direction : public Geom_Vector {
	public:
		/****************** Geom_Direction ******************/
		%feature("compactdefaultargs") Geom_Direction;
		%feature("autodoc", "Creates a unit vector with it 3 cartesian coordinates. //! raised if sqrt( x*x + y*y + z*z) <= resolution from gp.

Parameters
----------
X: float
Y: float
Z: float

Returns
-------
None
") Geom_Direction;
		 Geom_Direction(const Standard_Real X, const Standard_Real Y, const Standard_Real Z);

		/****************** Geom_Direction ******************/
		%feature("compactdefaultargs") Geom_Direction;
		%feature("autodoc", "Creates a transient copy of <self>.

Parameters
----------
V: gp_Dir

Returns
-------
None
") Geom_Direction;
		 Geom_Direction(const gp_Dir & V);

		/****************** Copy ******************/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "Creates a new object which is a copy of this unit vector.

Returns
-------
opencascade::handle<Geom_Geometry>
") Copy;
		opencascade::handle<Geom_Geometry> Copy();

		/****************** Cross ******************/
		%feature("compactdefaultargs") Cross;
		%feature("autodoc", "Computes the cross product between <self> and <other>. //! raised if the two vectors are parallel because it is not possible to have a direction with null length.

Parameters
----------
Other: Geom_Vector

Returns
-------
None
") Cross;
		void Cross(const opencascade::handle<Geom_Vector> & Other);

		/****************** CrossCross ******************/
		%feature("compactdefaultargs") CrossCross;
		%feature("autodoc", "Computes the triple vector product <self> ^(v1 ^ v2). //! raised if v1 and v2 are parallel or <self> and (v1 ^ v2) are parallel.

Parameters
----------
V1: Geom_Vector
V2: Geom_Vector

Returns
-------
None
") CrossCross;
		void CrossCross(const opencascade::handle<Geom_Vector> & V1, const opencascade::handle<Geom_Vector> & V2);

		/****************** CrossCrossed ******************/
		%feature("compactdefaultargs") CrossCrossed;
		%feature("autodoc", "Computes the triple vector product <self> ^(v1 ^ v2). //! raised if v1 and v2 are parallel or <self> and (v1 ^ v2) are parallel.

Parameters
----------
V1: Geom_Vector
V2: Geom_Vector

Returns
-------
opencascade::handle<Geom_Vector>
") CrossCrossed;
		opencascade::handle<Geom_Vector> CrossCrossed(const opencascade::handle<Geom_Vector> & V1, const opencascade::handle<Geom_Vector> & V2);

		/****************** Crossed ******************/
		%feature("compactdefaultargs") Crossed;
		%feature("autodoc", "Computes the cross product between <self> and <other>. a new direction is returned. //! raised if the two vectors are parallel because it is not possible to have a direction with null length.

Parameters
----------
Other: Geom_Vector

Returns
-------
opencascade::handle<Geom_Vector>
") Crossed;
		opencascade::handle<Geom_Vector> Crossed(const opencascade::handle<Geom_Vector> & Other);

		/****************** Dir ******************/
		%feature("compactdefaultargs") Dir;
		%feature("autodoc", "Returns the non transient direction with the same coordinates as <self>.

Returns
-------
gp_Dir
") Dir;
		gp_Dir Dir();

		/****************** Magnitude ******************/
		%feature("compactdefaultargs") Magnitude;
		%feature("autodoc", "Returns 1.0 which is the magnitude of any unit vector.

Returns
-------
float
") Magnitude;
		Standard_Real Magnitude();

		/****************** SetCoord ******************/
		%feature("compactdefaultargs") SetCoord;
		%feature("autodoc", "Sets <self> to x,y,z coordinates. //! raised if sqrt( x*x + y*y + z*z) <= resolution from gp.

Parameters
----------
X: float
Y: float
Z: float

Returns
-------
None
") SetCoord;
		void SetCoord(const Standard_Real X, const Standard_Real Y, const Standard_Real Z);

		/****************** SetDir ******************/
		%feature("compactdefaultargs") SetDir;
		%feature("autodoc", "Converts the gp_dir unit vector v into this unit vector.

Parameters
----------
V: gp_Dir

Returns
-------
None
") SetDir;
		void SetDir(const gp_Dir & V);

		/****************** SetX ******************/
		%feature("compactdefaultargs") SetX;
		%feature("autodoc", "Changes the x coordinate of <self>. //! raised if sqrt( x*x + y*y + z*z) <= resolution from gp.

Parameters
----------
X: float

Returns
-------
None
") SetX;
		void SetX(const Standard_Real X);

		/****************** SetY ******************/
		%feature("compactdefaultargs") SetY;
		%feature("autodoc", "Changes the y coordinate of <self>. //! raised if sqrt( x*x + y*y + z*z) <= resolution from gp.

Parameters
----------
Y: float

Returns
-------
None
") SetY;
		void SetY(const Standard_Real Y);

		/****************** SetZ ******************/
		%feature("compactdefaultargs") SetZ;
		%feature("autodoc", "Changes the z coordinate of <self>. //! raised if sqrt( x*x + y*y + z*z) <= resolution from gp.

Parameters
----------
Z: float

Returns
-------
None
") SetZ;
		void SetZ(const Standard_Real Z);

		/****************** SquareMagnitude ******************/
		%feature("compactdefaultargs") SquareMagnitude;
		%feature("autodoc", "Returns 1.0 which is the square magnitude of any unit vector.

Returns
-------
float
") SquareMagnitude;
		Standard_Real SquareMagnitude();

		/****************** Transform ******************/
		%feature("compactdefaultargs") Transform;
		%feature("autodoc", "Applies the transformation t to this unit vector, then normalizes it.

Parameters
----------
T: gp_Trsf

Returns
-------
None
") Transform;
		void Transform(const gp_Trsf & T);

};


%make_alias(Geom_Direction)

%extend Geom_Direction {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************
* class Geom_ElementarySurface *
*******************************/
%nodefaultctor Geom_ElementarySurface;
class Geom_ElementarySurface : public Geom_Surface {
	public:
		/****************** Axis ******************/
		%feature("compactdefaultargs") Axis;
		%feature("autodoc", "Returns the main axis of the surface (zaxis).

Returns
-------
gp_Ax1
") Axis;
		gp_Ax1 Axis();

		/****************** Continuity ******************/
		%feature("compactdefaultargs") Continuity;
		%feature("autodoc", "Returns geomabs_cn, the global continuity of any elementary surface.

Returns
-------
GeomAbs_Shape
") Continuity;
		GeomAbs_Shape Continuity();

		/****************** IsCNu ******************/
		%feature("compactdefaultargs") IsCNu;
		%feature("autodoc", "Returns true.

Parameters
----------
N: int

Returns
-------
bool
") IsCNu;
		Standard_Boolean IsCNu(const Standard_Integer N);

		/****************** IsCNv ******************/
		%feature("compactdefaultargs") IsCNv;
		%feature("autodoc", "Returns true.

Parameters
----------
N: int

Returns
-------
bool
") IsCNv;
		Standard_Boolean IsCNv(const Standard_Integer N);

		/****************** Location ******************/
		%feature("compactdefaultargs") Location;
		%feature("autodoc", "Returns the location point of the local coordinate system of the surface.

Returns
-------
gp_Pnt
") Location;
		gp_Pnt Location();

		/****************** Position ******************/
		%feature("compactdefaultargs") Position;
		%feature("autodoc", "Returns the local coordinates system of the surface.

Returns
-------
gp_Ax3
") Position;
		const gp_Ax3 Position();

		/****************** SetAxis ******************/
		%feature("compactdefaultargs") SetAxis;
		%feature("autodoc", "Changes the main axis (zaxis) of the elementary surface. //! raised if the direction of a1 is parallel to the xaxis of the coordinate system of the surface.

Parameters
----------
A1: gp_Ax1

Returns
-------
None
") SetAxis;
		void SetAxis(const gp_Ax1 & A1);

		/****************** SetLocation ******************/
		%feature("compactdefaultargs") SetLocation;
		%feature("autodoc", "Changes the location of the local coordinates system of the surface.

Parameters
----------
Loc: gp_Pnt

Returns
-------
None
") SetLocation;
		void SetLocation(const gp_Pnt & Loc);

		/****************** SetPosition ******************/
		%feature("compactdefaultargs") SetPosition;
		%feature("autodoc", "Changes the local coordinates system of the surface.

Parameters
----------
A3: gp_Ax3

Returns
-------
None
") SetPosition;
		void SetPosition(const gp_Ax3 & A3);

		/****************** UReverse ******************/
		%feature("compactdefaultargs") UReverse;
		%feature("autodoc", "Reverses the u parametric direction of the surface.

Returns
-------
None
") UReverse;
		virtual void UReverse();

		/****************** UReversedParameter ******************/
		%feature("compactdefaultargs") UReversedParameter;
		%feature("autodoc", "Return the parameter on the ureversed surface for the point of parameter u on <self>. //! me->ureversed()->value(me->ureversedparameter(u),v) is the same point as me->value(u,v).

Parameters
----------
U: float

Returns
-------
float
") UReversedParameter;
		virtual Standard_Real UReversedParameter(const Standard_Real U);

		/****************** VReverse ******************/
		%feature("compactdefaultargs") VReverse;
		%feature("autodoc", "Reverses the v parametric direction of the surface.

Returns
-------
None
") VReverse;
		virtual void VReverse();

		/****************** VReversedParameter ******************/
		%feature("compactdefaultargs") VReversedParameter;
		%feature("autodoc", "Return the parameter on the vreversed surface for the point of parameter v on <self>. //! me->vreversed()->value(u,me->vreversedparameter(v)) is the same point as me->value(u,v).

Parameters
----------
V: float

Returns
-------
float
") VReversedParameter;
		virtual Standard_Real VReversedParameter(const Standard_Real V);

};


%make_alias(Geom_ElementarySurface)

%extend Geom_ElementarySurface {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************
* class Geom_Line *
******************/
class Geom_Line : public Geom_Curve {
	public:
		/****************** Geom_Line ******************/
		%feature("compactdefaultargs") Geom_Line;
		%feature("autodoc", "Creates a line located in 3d space with the axis placement a1. the location of a1 is the origin of the line.

Parameters
----------
A1: gp_Ax1

Returns
-------
None
") Geom_Line;
		 Geom_Line(const gp_Ax1 & A1);

		/****************** Geom_Line ******************/
		%feature("compactdefaultargs") Geom_Line;
		%feature("autodoc", "Creates a line from a non transient line from package gp.

Parameters
----------
L: gp_Lin

Returns
-------
None
") Geom_Line;
		 Geom_Line(const gp_Lin & L);

		/****************** Geom_Line ******************/
		%feature("compactdefaultargs") Geom_Line;
		%feature("autodoc", "Constructs a line passing through point p and parallel to vector v (p and v are, respectively, the origin and the unit vector of the positioning axis of the line).

Parameters
----------
P: gp_Pnt
V: gp_Dir

Returns
-------
None
") Geom_Line;
		 Geom_Line(const gp_Pnt & P, const gp_Dir & V);

		/****************** Continuity ******************/
		%feature("compactdefaultargs") Continuity;
		%feature("autodoc", "Returns geomabs_cn, which is the global continuity of any line.

Returns
-------
GeomAbs_Shape
") Continuity;
		GeomAbs_Shape Continuity();

		/****************** Copy ******************/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "Creates a new object which is a copy of this line.

Returns
-------
opencascade::handle<Geom_Geometry>
") Copy;
		opencascade::handle<Geom_Geometry> Copy();

		/****************** D0 ******************/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "Returns in p the point of parameter u. p (u) = o + u * dir where o is the 'location' point of the line and dir the direction of the line.

Parameters
----------
U: float
P: gp_Pnt

Returns
-------
None
") D0;
		void D0(const Standard_Real U, gp_Pnt & P);

		/****************** D1 ******************/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "Returns the point p of parameter u and the first derivative v1.

Parameters
----------
U: float
P: gp_Pnt
V1: gp_Vec

Returns
-------
None
") D1;
		void D1(const Standard_Real U, gp_Pnt & P, gp_Vec & V1);

		/****************** D2 ******************/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "Returns the point p of parameter u, the first and second derivatives v1 and v2. v2 is a vector with null magnitude for a line.

Parameters
----------
U: float
P: gp_Pnt
V1: gp_Vec
V2: gp_Vec

Returns
-------
None
") D2;
		void D2(const Standard_Real U, gp_Pnt & P, gp_Vec & V1, gp_Vec & V2);

		/****************** D3 ******************/
		%feature("compactdefaultargs") D3;
		%feature("autodoc", "V2 and v3 are vectors with null magnitude for a line.

Parameters
----------
U: float
P: gp_Pnt
V1: gp_Vec
V2: gp_Vec
V3: gp_Vec

Returns
-------
None
") D3;
		void D3(const Standard_Real U, gp_Pnt & P, gp_Vec & V1, gp_Vec & V2, gp_Vec & V3);

		/****************** DN ******************/
		%feature("compactdefaultargs") DN;
		%feature("autodoc", "The returned vector gives the value of the derivative for the order of derivation n. raised if n < 1.

Parameters
----------
U: float
N: int

Returns
-------
gp_Vec
") DN;
		gp_Vec DN(const Standard_Real U, const Standard_Integer N);

		/****************** FirstParameter ******************/
		%feature("compactdefaultargs") FirstParameter;
		%feature("autodoc", "Returns the value of the first parameter of this line. this is standard_real::realfirst().

Returns
-------
float
") FirstParameter;
		Standard_Real FirstParameter();

		/****************** IsCN ******************/
		%feature("compactdefaultargs") IsCN;
		%feature("autodoc", "Returns true. raised if n < 0.

Parameters
----------
N: int

Returns
-------
bool
") IsCN;
		Standard_Boolean IsCN(const Standard_Integer N);

		/****************** IsClosed ******************/
		%feature("compactdefaultargs") IsClosed;
		%feature("autodoc", "Returns false.

Returns
-------
bool
") IsClosed;
		Standard_Boolean IsClosed();

		/****************** IsPeriodic ******************/
		%feature("compactdefaultargs") IsPeriodic;
		%feature("autodoc", "Returns false.

Returns
-------
bool
") IsPeriodic;
		Standard_Boolean IsPeriodic();

		/****************** LastParameter ******************/
		%feature("compactdefaultargs") LastParameter;
		%feature("autodoc", "Returns the value of the last parameter of this line. this is standard_real::reallast().

Returns
-------
float
") LastParameter;
		Standard_Real LastParameter();

		/****************** Lin ******************/
		%feature("compactdefaultargs") Lin;
		%feature("autodoc", "Returns non transient line from gp with the same geometric properties as <self>.

Returns
-------
gp_Lin
") Lin;
		gp_Lin Lin();

		/****************** ParametricTransformation ******************/
		%feature("compactdefaultargs") ParametricTransformation;
		%feature("autodoc", "Returns a coefficient to compute the parameter on the transformed curve for the transform of the point on <self>. //! transformed(t)->value(u * parametrictransformation(t)) //! is the same point as //! value(u).transformed(t) //! this methods returns t.scalefactor().

Parameters
----------
T: gp_Trsf

Returns
-------
float
") ParametricTransformation;
		virtual Standard_Real ParametricTransformation(const gp_Trsf & T);

		/****************** Position ******************/
		%feature("compactdefaultargs") Position;
		%feature("autodoc", "Returns the positioning axis of this line; this is also its local coordinate system.

Returns
-------
gp_Ax1
") Position;
		const gp_Ax1 Position();

		/****************** Reverse ******************/
		%feature("compactdefaultargs") Reverse;
		%feature("autodoc", "Changes the orientation of this line. as a result, the unit vector of the positioning axis of this line is reversed.

Returns
-------
None
") Reverse;
		void Reverse();

		/****************** ReversedParameter ******************/
		%feature("compactdefaultargs") ReversedParameter;
		%feature("autodoc", "Computes the parameter on the reversed line for the point of parameter u on this line. for a line, the returned value is -u.

Parameters
----------
U: float

Returns
-------
float
") ReversedParameter;
		Standard_Real ReversedParameter(const Standard_Real U);

		/****************** SetDirection ******************/
		%feature("compactdefaultargs") SetDirection;
		%feature("autodoc", "Changes the direction of the line.

Parameters
----------
V: gp_Dir

Returns
-------
None
") SetDirection;
		void SetDirection(const gp_Dir & V);

		/****************** SetLin ******************/
		%feature("compactdefaultargs") SetLin;
		%feature("autodoc", "Set <self> so that <self> has the same geometric properties as l.

Parameters
----------
L: gp_Lin

Returns
-------
None
") SetLin;
		void SetLin(const gp_Lin & L);

		/****************** SetLocation ******************/
		%feature("compactdefaultargs") SetLocation;
		%feature("autodoc", "Changes the 'location' point (origin) of the line.

Parameters
----------
P: gp_Pnt

Returns
-------
None
") SetLocation;
		void SetLocation(const gp_Pnt & P);

		/****************** SetPosition ******************/
		%feature("compactdefaultargs") SetPosition;
		%feature("autodoc", "Changes the 'location' and a the 'direction' of <self>.

Parameters
----------
A1: gp_Ax1

Returns
-------
None
") SetPosition;
		void SetPosition(const gp_Ax1 & A1);

		/****************** Transform ******************/
		%feature("compactdefaultargs") Transform;
		%feature("autodoc", "Applies the transformation t to this line.

Parameters
----------
T: gp_Trsf

Returns
-------
None
") Transform;
		void Transform(const gp_Trsf & T);

		/****************** TransformedParameter ******************/
		%feature("compactdefaultargs") TransformedParameter;
		%feature("autodoc", "Returns the parameter on the transformed curve for the transform of the point of parameter u on <self>. //! me->transformed(t)->value(me->transformedparameter(u,t)) //! is the same point as //! me->value(u).transformed(t) //! this methods returns <u> * t.scalefactor().

Parameters
----------
U: float
T: gp_Trsf

Returns
-------
float
") TransformedParameter;
		virtual Standard_Real TransformedParameter(const Standard_Real U, const gp_Trsf & T);

};


%make_alias(Geom_Line)

%extend Geom_Line {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************
* class Geom_OffsetCurve *
*************************/
class Geom_OffsetCurve : public Geom_Curve {
	public:
		/****************** Geom_OffsetCurve ******************/
		%feature("compactdefaultargs") Geom_OffsetCurve;
		%feature("autodoc", "C is the basis curve, offset is the distance between <self> and the basis curve at any point. v defines the fixed reference direction (offset direction). if p is a point on the basis curve and t the first derivative with non zero length at this point, the corresponding point on the offset curve is in the direction of the vector-product n = v ^ t where n is a unitary vector. if isnotcheckc0 = true checking if basis curve has c0-continuity is not made. warnings : in this package the entities are not shared. the offsetcurve is built with a copy of the curve c. so when c is modified the offsetcurve is not modified //! raised if the basis curve c is not at least c1. warnings : no check is done to know if ||v^t|| != 0.0 at any point.

Parameters
----------
C: Geom_Curve
Offset: float
V: gp_Dir
isNotCheckC0: bool,optional
	default value is Standard_False

Returns
-------
None
") Geom_OffsetCurve;
		 Geom_OffsetCurve(const opencascade::handle<Geom_Curve> & C, const Standard_Real Offset, const gp_Dir & V, const Standard_Boolean isNotCheckC0 = Standard_False);

		/****************** BasisCurve ******************/
		%feature("compactdefaultargs") BasisCurve;
		%feature("autodoc", "Returns the basis curve of this offset curve. note: the basis curve can be an offset curve.

Returns
-------
opencascade::handle<Geom_Curve>
") BasisCurve;
		opencascade::handle<Geom_Curve> BasisCurve();

		/****************** Continuity ******************/
		%feature("compactdefaultargs") Continuity;
		%feature("autodoc", "Returns the global continuity of this offset curve as a value of the geomabs_shape enumeration. the degree of continuity of this offset curve is equal to the degree of continuity of the basis curve minus 1. continuity of the offset curve : c0 : only geometric continuity, c1 : continuity of the first derivative all along the curve, c2 : continuity of the second derivative all along the curve, c3 : continuity of the third derivative all along the curve, g1 : tangency continuity all along the curve, g2 : curvature continuity all along the curve, cn : the order of continuity is infinite. warnings : returns the continuity of the basis curve - 1. the offset curve must have a unique offset direction defined at any point.

Returns
-------
GeomAbs_Shape
") Continuity;
		GeomAbs_Shape Continuity();

		/****************** Copy ******************/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "Creates a new object which is a copy of this offset curve.

Returns
-------
opencascade::handle<Geom_Geometry>
") Copy;
		opencascade::handle<Geom_Geometry> Copy();

		/****************** D0 ******************/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "Warning! this should not be called if the basis curve is not at least c1. nevertheless if used on portion where the curve is c1, it is ok.

Parameters
----------
U: float
P: gp_Pnt

Returns
-------
None
") D0;
		void D0(const Standard_Real U, gp_Pnt & P);

		/****************** D1 ******************/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "Warning! this should not be called if the continuity of the basis curve is not c2. nevertheless, it's ok to use it on portion where the curve is c2.

Parameters
----------
U: float
P: gp_Pnt
V1: gp_Vec

Returns
-------
None
") D1;
		void D1(const Standard_Real U, gp_Pnt & P, gp_Vec & V1);

		/****************** D2 ******************/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "Warning! this should not be called if the continuity of the basis curve is not c3. nevertheless, it's ok to use it on portion where the curve is c3.

Parameters
----------
U: float
P: gp_Pnt
V1: gp_Vec
V2: gp_Vec

Returns
-------
None
") D2;
		void D2(const Standard_Real U, gp_Pnt & P, gp_Vec & V1, gp_Vec & V2);

		/****************** D3 ******************/
		%feature("compactdefaultargs") D3;
		%feature("autodoc", "No available documentation.

Parameters
----------
U: float
P: gp_Pnt
V1: gp_Vec
V2: gp_Vec
V3: gp_Vec

Returns
-------
None
") D3;
		void D3(const Standard_Real U, gp_Pnt & P, gp_Vec & V1, gp_Vec & V2, gp_Vec & V3);

		/****************** DN ******************/
		%feature("compactdefaultargs") DN;
		%feature("autodoc", "The returned vector gives the value of the derivative for the order of derivation n. //! the following functions compute the value and derivatives on the offset curve and returns the derivatives on the basis curve too. the computation of the value and derivatives on the basis curve are used to evaluate the offset curve //! warning: the exception undefinedvalue or undefinedderivative is raised if it is not possible to compute a unique offset direction. raised if n < 1.

Parameters
----------
U: float
N: int

Returns
-------
gp_Vec
") DN;
		gp_Vec DN(const Standard_Real U, const Standard_Integer N);

		/****************** Direction ******************/
		%feature("compactdefaultargs") Direction;
		%feature("autodoc", "Returns the reference vector of this offset curve. value and derivatives warnings : the exception undefinedvalue or undefinedderivative is raised if it is not possible to compute a unique offset direction. if t is the first derivative with not null length and v the offset direction the relation ||t(u) ^ v|| != 0 must be satisfied to evaluate the offset curve. no check is done at the creation time and we suppose in this package that the offset curve is well defined.

Returns
-------
gp_Dir
") Direction;
		const gp_Dir Direction();

		/****************** FirstParameter ******************/
		%feature("compactdefaultargs") FirstParameter;
		%feature("autodoc", "Returns the value of the first parameter of this offset curve. the first parameter corresponds to the start point of the curve. note: the first and last parameters of this offset curve are also the ones of its basis curve.

Returns
-------
float
") FirstParameter;
		Standard_Real FirstParameter();

		/****************** GetBasisCurveContinuity ******************/
		%feature("compactdefaultargs") GetBasisCurveContinuity;
		%feature("autodoc", "Returns continuity of the basis curve.

Returns
-------
GeomAbs_Shape
") GetBasisCurveContinuity;
		GeomAbs_Shape GetBasisCurveContinuity();

		/****************** IsCN ******************/
		%feature("compactdefaultargs") IsCN;
		%feature("autodoc", "Returns true if the degree of continuity of the basis curve of this offset curve is at least n + 1. this method answer true if the continuity of the basis curve is n + 1. we suppose in this class that a normal direction to the basis curve (used to compute the offset curve) is defined at any point on the basis curve. raised if n < 0.

Parameters
----------
N: int

Returns
-------
bool
") IsCN;
		Standard_Boolean IsCN(const Standard_Integer N);

		/****************** IsClosed ******************/
		%feature("compactdefaultargs") IsClosed;
		%feature("autodoc", "Returns true if the distance between the start point and the end point of the curve is lower or equal to resolution from package gp.

Returns
-------
bool
") IsClosed;
		Standard_Boolean IsClosed();

		/****************** IsPeriodic ******************/
		%feature("compactdefaultargs") IsPeriodic;
		%feature("autodoc", "Returns true if this offset curve is periodic, i.e. if the basis curve of this offset curve is periodic.

Returns
-------
bool
") IsPeriodic;
		Standard_Boolean IsPeriodic();

		/****************** LastParameter ******************/
		%feature("compactdefaultargs") LastParameter;
		%feature("autodoc", "Returns the value of the last parameter of this offset curve. the last parameter corresponds to the end point. note: the first and last parameters of this offset curve are also the ones of its basis curve.

Returns
-------
float
") LastParameter;
		Standard_Real LastParameter();

		/****************** Offset ******************/
		%feature("compactdefaultargs") Offset;
		%feature("autodoc", "Returns the offset value of this offset curve.

Returns
-------
float
") Offset;
		Standard_Real Offset();

		/****************** ParametricTransformation ******************/
		%feature("compactdefaultargs") ParametricTransformation;
		%feature("autodoc", "Returns a coefficient to compute the parameter on the transformed curve for the transform of the point on <self>. //! transformed(t)->value(u * parametrictransformation(t)) is the same point as value(u).transformed(t) this methods calls the basis curve method.

Parameters
----------
T: gp_Trsf

Returns
-------
float
") ParametricTransformation;
		virtual Standard_Real ParametricTransformation(const gp_Trsf & T);

		/****************** Period ******************/
		%feature("compactdefaultargs") Period;
		%feature("autodoc", "Returns the period of this offset curve, i.e. the period of the basis curve of this offset curve. exceptions standard_nosuchobject if the basis curve is not periodic.

Returns
-------
float
") Period;
		virtual Standard_Real Period();

		/****************** Reverse ******************/
		%feature("compactdefaultargs") Reverse;
		%feature("autodoc", "Changes the orientation of this offset curve. as a result: - the basis curve is reversed, - the start point of the initial curve becomes the end point of the reversed curve, - the end point of the initial curve becomes the start point of the reversed curve, and - the first and last parameters are recomputed.

Returns
-------
None
") Reverse;
		void Reverse();

		/****************** ReversedParameter ******************/
		%feature("compactdefaultargs") ReversedParameter;
		%feature("autodoc", "Computes the parameter on the reversed curve for the point of parameter u on this offset curve.

Parameters
----------
U: float

Returns
-------
float
") ReversedParameter;
		Standard_Real ReversedParameter(const Standard_Real U);

		/****************** SetBasisCurve ******************/
		%feature("compactdefaultargs") SetBasisCurve;
		%feature("autodoc", "Changes this offset curve by assigning c as the basis curve from which it is built. if isnotcheckc0 = true checking if basis curve has c0-continuity is not made. exceptions standard_constructionerror if the curve c is not at least 'c1' continuous.

Parameters
----------
C: Geom_Curve
isNotCheckC0: bool,optional
	default value is Standard_False

Returns
-------
None
") SetBasisCurve;
		void SetBasisCurve(const opencascade::handle<Geom_Curve> & C, const Standard_Boolean isNotCheckC0 = Standard_False);

		/****************** SetDirection ******************/
		%feature("compactdefaultargs") SetDirection;
		%feature("autodoc", "Changes this offset curve by assigning v as the reference vector used to compute the offset direction.

Parameters
----------
V: gp_Dir

Returns
-------
None
") SetDirection;
		void SetDirection(const gp_Dir & V);

		/****************** SetOffsetValue ******************/
		%feature("compactdefaultargs") SetOffsetValue;
		%feature("autodoc", "Changes this offset curve by assigning d as the offset value.

Parameters
----------
D: float

Returns
-------
None
") SetOffsetValue;
		void SetOffsetValue(const Standard_Real D);

		/****************** Transform ******************/
		%feature("compactdefaultargs") Transform;
		%feature("autodoc", "Applies the transformation t to this offset curve. note: the basis curve is also modified.

Parameters
----------
T: gp_Trsf

Returns
-------
None
") Transform;
		void Transform(const gp_Trsf & T);

		/****************** TransformedParameter ******************/
		%feature("compactdefaultargs") TransformedParameter;
		%feature("autodoc", "Returns the parameter on the transformed curve for the transform of the point of parameter u on <self>. me->transformed(t)->value(me->transformedparameter(u,t)) is the same point as me->value(u).transformed(t) this methods calls the basis curve method.

Parameters
----------
U: float
T: gp_Trsf

Returns
-------
float
") TransformedParameter;
		virtual Standard_Real TransformedParameter(const Standard_Real U, const gp_Trsf & T);

};


%make_alias(Geom_OffsetCurve)

%extend Geom_OffsetCurve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************
* class Geom_OffsetSurface *
***************************/
class Geom_OffsetSurface : public Geom_Surface {
	public:
		/****************** Geom_OffsetSurface ******************/
		%feature("compactdefaultargs") Geom_OffsetSurface;
		%feature("autodoc", "Constructs a surface offset from the basis surface s, where offset is the distance between the offset surface and the basis surface at any point. a point on the offset surface is built by measuring the offset value along a normal vector at a point on s. this normal vector is given by the cross product d1u^d1v, where d1u and d1v are the vectors tangential to the basis surface in the u and v parametric directions at this point. the side of s on which the offset value is measured is indicated by this normal vector if offset is positive, or is the inverse sense if offset is negative. if isnotcheckc0 = true checking if basis surface has c0-continuity is not made. warnings : - the offset surface is built with a copy of the surface s. therefore, when s is modified the offset surface is not modified. - no check is made at the time of construction to detect points on s with multiple possible normal directions. raised if s is not at least c1. warnings : no check is done to verify that a unique normal direction is defined at any point of the basis surface s.

Parameters
----------
S: Geom_Surface
Offset: float
isNotCheckC0: bool,optional
	default value is Standard_False

Returns
-------
None
") Geom_OffsetSurface;
		 Geom_OffsetSurface(const opencascade::handle<Geom_Surface> & S, const Standard_Real Offset, const Standard_Boolean isNotCheckC0 = Standard_False);

		/****************** BasisSurface ******************/
		%feature("compactdefaultargs") BasisSurface;
		%feature("autodoc", "Returns the basis surface of this offset surface. note: the basis surface can be an offset surface.

Returns
-------
opencascade::handle<Geom_Surface>
") BasisSurface;
		const opencascade::handle<Geom_Surface> & BasisSurface();

		/****************** Bounds ******************/
		%feature("compactdefaultargs") Bounds;
		%feature("autodoc", "Returns the parametric bounds u1, u2, v1 and v2 of this offset surface. if the surface is infinite, this function can return: - standard_real::realfirst(), or - standard_real::reallast().

Parameters
----------

Returns
-------
U1: float
U2: float
V1: float
V2: float
") Bounds;
		void Bounds(Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** Continuity ******************/
		%feature("compactdefaultargs") Continuity;
		%feature("autodoc", "This method returns the continuity of the basis surface - 1. continuity of the offset surface : c0 : only geometric continuity, c1 : continuity of the first derivative all along the surface, c2 : continuity of the second derivative all along the surface, c3 : continuity of the third derivative all along the surface, cn : the order of continuity is infinite. example : if the basis surface is c2 in the v direction and c3 in the u direction shape = c1. warnings : if the basis surface has a unique normal direction defined at any point this method gives the continuity of the offset surface otherwise the effective continuity can be lower than the continuity of the basis surface - 1.

Returns
-------
GeomAbs_Shape
") Continuity;
		GeomAbs_Shape Continuity();

		/****************** Copy ******************/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "Creates a new object which is a copy of this offset surface.

Returns
-------
opencascade::handle<Geom_Geometry>
") Copy;
		opencascade::handle<Geom_Geometry> Copy();

		/****************** D0 ******************/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "P (u, v) = pbasis + offset * ndir where ndir = d1ubasis ^ d1vbasis / ||d1ubasis ^ d1vbasis|| is the normal direction of the basis surface. pbasis, d1ubasis, d1vbasis are the point and the first derivatives on the basis surface. if ndir is undefined this method computes an approched normal direction using the following limited development : ndir = n0 + dndir/du + dndir/dv + eps with eps->0 which requires to compute the second derivatives on the basis surface. if the normal direction cannot be approximate for this order of derivation the exception undefinedvalue is raised. //! raised if the continuity of the basis surface is not c1. raised if the order of derivation required to compute the normal direction is greater than the second order.

Parameters
----------
U: float
V: float
P: gp_Pnt

Returns
-------
None
") D0;
		void D0(const Standard_Real U, const Standard_Real V, gp_Pnt & P);

		/****************** D1 ******************/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "Raised if the continuity of the basis surface is not c2.

Parameters
----------
U: float
V: float
P: gp_Pnt
D1U: gp_Vec
D1V: gp_Vec

Returns
-------
None
") D1;
		void D1(const Standard_Real U, const Standard_Real V, gp_Pnt & P, gp_Vec & D1U, gp_Vec & D1V);

		/****************** D2 ******************/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "---purpose ; raised if the continuity of the basis surface is not c3.

Parameters
----------
U: float
V: float
P: gp_Pnt
D1U: gp_Vec
D1V: gp_Vec
D2U: gp_Vec
D2V: gp_Vec
D2UV: gp_Vec

Returns
-------
None
") D2;
		void D2(const Standard_Real U, const Standard_Real V, gp_Pnt & P, gp_Vec & D1U, gp_Vec & D1V, gp_Vec & D2U, gp_Vec & D2V, gp_Vec & D2UV);

		/****************** D3 ******************/
		%feature("compactdefaultargs") D3;
		%feature("autodoc", "Raised if the continuity of the basis surface is not c4.

Parameters
----------
U: float
V: float
P: gp_Pnt
D1U: gp_Vec
D1V: gp_Vec
D2U: gp_Vec
D2V: gp_Vec
D2UV: gp_Vec
D3U: gp_Vec
D3V: gp_Vec
D3UUV: gp_Vec
D3UVV: gp_Vec

Returns
-------
None
") D3;
		void D3(const Standard_Real U, const Standard_Real V, gp_Pnt & P, gp_Vec & D1U, gp_Vec & D1V, gp_Vec & D2U, gp_Vec & D2V, gp_Vec & D2UV, gp_Vec & D3U, gp_Vec & D3V, gp_Vec & D3UUV, gp_Vec & D3UVV);

		/****************** DN ******************/
		%feature("compactdefaultargs") DN;
		%feature("autodoc", "Computes the derivative of order nu in the direction u and nv in the direction v. ---purpose ; raised if the continuity of the basis surface is not cnu + 1 in the u direction and cnv + 1 in the v direction. raised if nu + nv < 1 or nu < 0 or nv < 0. //! the following methods compute the value and derivatives on the offset surface and returns the derivatives on the basis surface too. the computation of the value and derivatives on the basis surface are used to evaluate the offset surface. //! warnings : the exception undefinedvalue or undefinedderivative is raised if it is not possible to compute a unique offset direction.

Parameters
----------
U: float
V: float
Nu: int
Nv: int

Returns
-------
gp_Vec
") DN;
		gp_Vec DN(const Standard_Real U, const Standard_Real V, const Standard_Integer Nu, const Standard_Integer Nv);

		/****************** GetBasisSurfContinuity ******************/
		%feature("compactdefaultargs") GetBasisSurfContinuity;
		%feature("autodoc", "Returns continuity of the basis surface.

Returns
-------
GeomAbs_Shape
") GetBasisSurfContinuity;
		GeomAbs_Shape GetBasisSurfContinuity();

		/****************** IsCNu ******************/
		%feature("compactdefaultargs") IsCNu;
		%feature("autodoc", "This method answer true if the continuity of the basis surface is n + 1 in the u parametric direction. we suppose in this class that a unique normal is defined at any point on the basis surface. raised if n <0.

Parameters
----------
N: int

Returns
-------
bool
") IsCNu;
		Standard_Boolean IsCNu(const Standard_Integer N);

		/****************** IsCNv ******************/
		%feature("compactdefaultargs") IsCNv;
		%feature("autodoc", "This method answer true if the continuity of the basis surface is n + 1 in the v parametric direction. we suppose in this class that a unique normal is defined at any point on the basis surface. raised if n <0.

Parameters
----------
N: int

Returns
-------
bool
") IsCNv;
		Standard_Boolean IsCNv(const Standard_Integer N);

		/****************** IsUClosed ******************/
		%feature("compactdefaultargs") IsUClosed;
		%feature("autodoc", "Checks whether this offset surface is closed in the u parametric direction. returns true if, taking ufirst and ulast as the parametric bounds in the u parametric direction, the distance between the points p(ufirst,v) and p(ulast,v) is less than or equal to gp::resolution() for each value of the parameter v.

Returns
-------
bool
") IsUClosed;
		Standard_Boolean IsUClosed();

		/****************** IsUPeriodic ******************/
		%feature("compactdefaultargs") IsUPeriodic;
		%feature("autodoc", "Returns true if this offset surface is periodic in the u parametric direction, i.e. if the basis surface of this offset surface is periodic in this direction.

Returns
-------
bool
") IsUPeriodic;
		Standard_Boolean IsUPeriodic();

		/****************** IsVClosed ******************/
		%feature("compactdefaultargs") IsVClosed;
		%feature("autodoc", "Checks whether this offset surface is closed in the u or v parametric direction. returns true if taking vfirst and vlast as the parametric bounds in the v parametric direction, the distance between the points p(u,vfirst) and p(u,vlast) is less than or equal to gp::resolution() for each value of the parameter u.

Returns
-------
bool
") IsVClosed;
		Standard_Boolean IsVClosed();

		/****************** IsVPeriodic ******************/
		%feature("compactdefaultargs") IsVPeriodic;
		%feature("autodoc", "Returns true if this offset surface is periodic in the v parametric direction, i.e. if the basis surface of this offset surface is periodic in this direction.

Returns
-------
bool
") IsVPeriodic;
		Standard_Boolean IsVPeriodic();

		/****************** Offset ******************/
		%feature("compactdefaultargs") Offset;
		%feature("autodoc", "Returns the offset value of this offset surface.

Returns
-------
float
") Offset;
		Standard_Real Offset();

		/****************** OsculatingSurface ******************/
		%feature("compactdefaultargs") OsculatingSurface;
		%feature("autodoc", "Returns osculating surface if base surface is b-spline or bezier.

Returns
-------
opencascade::handle<Geom_OsculatingSurface>
") OsculatingSurface;
		const opencascade::handle<Geom_OsculatingSurface> & OsculatingSurface();

		/****************** ParametricTransformation ******************/
		%feature("compactdefaultargs") ParametricTransformation;
		%feature("autodoc", "Returns a 2d transformation used to find the new parameters of a point on the transformed surface. //! me->transformed(t)->value(u',v') //! is the same point as //! me->value(u,v).transformed(t) //! where u',v' are obtained by transforming u,v with th 2d transformation returned by //! me->parametrictransformation(t) //! this methods calls the basis surface method.

Parameters
----------
T: gp_Trsf

Returns
-------
gp_GTrsf2d
") ParametricTransformation;
		virtual gp_GTrsf2d ParametricTransformation(const gp_Trsf & T);

		/****************** SetBasisSurface ******************/
		%feature("compactdefaultargs") SetBasisSurface;
		%feature("autodoc", "Raised if s is not at least c1. warnings : no check is done to verify that a unique normal direction is defined at any point of the basis surface s. if isnotcheckc0 = true checking if basis surface has c0-continuity is not made. exceptions standard_constructionerror if the surface s is not at least 'c1' continuous.

Parameters
----------
S: Geom_Surface
isNotCheckC0: bool,optional
	default value is Standard_False

Returns
-------
None
") SetBasisSurface;
		void SetBasisSurface(const opencascade::handle<Geom_Surface> & S, const Standard_Boolean isNotCheckC0 = Standard_False);

		/****************** SetOffsetValue ******************/
		%feature("compactdefaultargs") SetOffsetValue;
		%feature("autodoc", "Changes this offset surface by assigning d as the offset value.

Parameters
----------
D: float

Returns
-------
None
") SetOffsetValue;
		void SetOffsetValue(const Standard_Real D);

		/****************** Surface ******************/
		%feature("compactdefaultargs") Surface;
		%feature("autodoc", "Returns an equivalent surface of the offset surface when the basis surface is a canonic surface or a rectangular limited surface on canonic surface or if the offset is null.

Returns
-------
opencascade::handle<Geom_Surface>
") Surface;
		opencascade::handle<Geom_Surface> Surface();

		/****************** Transform ******************/
		%feature("compactdefaultargs") Transform;
		%feature("autodoc", "Applies the transformation t to this offset surface. note: the basis surface is also modified.

Parameters
----------
T: gp_Trsf

Returns
-------
None
") Transform;
		void Transform(const gp_Trsf & T);

		/****************** TransformParameters ******************/
		%feature("compactdefaultargs") TransformParameters;
		%feature("autodoc", "Computes the parameters on the transformed surface for the transform of the point of parameters u,v on <self>. //! me->transformed(t)->value(u',v') //! is the same point as //! me->value(u,v).transformed(t) //! where u',v' are the new values of u,v after calling //! me->tranformparameters(u,v,t) this methods calls the basis surface method.

Parameters
----------
T: gp_Trsf

Returns
-------
U: float
V: float
") TransformParameters;
		virtual void TransformParameters(Standard_Real &OutValue, Standard_Real &OutValue, const gp_Trsf & T);

		/****************** UIso ******************/
		%feature("compactdefaultargs") UIso;
		%feature("autodoc", "Computes the u isoparametric curve.

Parameters
----------
U: float

Returns
-------
opencascade::handle<Geom_Curve>
") UIso;
		opencascade::handle<Geom_Curve> UIso(const Standard_Real U);

		/****************** UOsculatingSurface ******************/
		%feature("compactdefaultargs") UOsculatingSurface;
		%feature("autodoc", "If standard_true, l is the local osculating surface along u at the point u,v. it means that dl/du is collinear to ds/du . if isopposite == standard_true these vectors have opposite direction.

Parameters
----------
U: float
V: float
UOsculSurf: Geom_BSplineSurface

Returns
-------
IsOpposite: bool
") UOsculatingSurface;
		Standard_Boolean UOsculatingSurface(const Standard_Real U, const Standard_Real V, Standard_Boolean &OutValue, opencascade::handle<Geom_BSplineSurface> & UOsculSurf);

		/****************** UPeriod ******************/
		%feature("compactdefaultargs") UPeriod;
		%feature("autodoc", "Returns the period of this offset surface in the u parametric direction respectively, i.e. the period of the basis surface of this offset surface in this parametric direction. raises if the surface is not uperiodic.

Returns
-------
float
") UPeriod;
		virtual Standard_Real UPeriod();

		/****************** UReverse ******************/
		%feature("compactdefaultargs") UReverse;
		%feature("autodoc", "Changes the orientation of this offset surface in the u parametric direction. the bounds of the surface are not changed but the given parametric direction is reversed.

Returns
-------
None
") UReverse;
		void UReverse();

		/****************** UReversedParameter ******************/
		%feature("compactdefaultargs") UReversedParameter;
		%feature("autodoc", "Computes the u parameter on the modified surface, produced by reversing the u parametric direction of this offset surface, for any point of u parameter u on this offset surface.

Parameters
----------
U: float

Returns
-------
float
") UReversedParameter;
		Standard_Real UReversedParameter(const Standard_Real U);

		/****************** VIso ******************/
		%feature("compactdefaultargs") VIso;
		%feature("autodoc", "Computes the v isoparametric curve. //! te followings methods compute value and derivatives. //! warnings an exception is raised if a unique normal vector is not defined on the basis surface for the parametric value (u,v). no check is done at the creation time and we suppose in this package that the offset surface can be defined at any point.

Parameters
----------
V: float

Returns
-------
opencascade::handle<Geom_Curve>
") VIso;
		opencascade::handle<Geom_Curve> VIso(const Standard_Real V);

		/****************** VOsculatingSurface ******************/
		%feature("compactdefaultargs") VOsculatingSurface;
		%feature("autodoc", "If standard_true, l is the local osculating surface along v at the point u,v. it means that dl/dv is collinear to ds/dv . if isopposite == standard_true these vectors have opposite direction.

Parameters
----------
U: float
V: float
VOsculSurf: Geom_BSplineSurface

Returns
-------
IsOpposite: bool
") VOsculatingSurface;
		Standard_Boolean VOsculatingSurface(const Standard_Real U, const Standard_Real V, Standard_Boolean &OutValue, opencascade::handle<Geom_BSplineSurface> & VOsculSurf);

		/****************** VPeriod ******************/
		%feature("compactdefaultargs") VPeriod;
		%feature("autodoc", "Returns the period of this offset surface in the v parametric direction respectively, i.e. the period of the basis surface of this offset surface in this parametric direction. raises if the surface is not vperiodic.

Returns
-------
float
") VPeriod;
		virtual Standard_Real VPeriod();

		/****************** VReverse ******************/
		%feature("compactdefaultargs") VReverse;
		%feature("autodoc", "Changes the orientation of this offset surface in the v parametric direction. the bounds of the surface are not changed but the given parametric direction is reversed.

Returns
-------
None
") VReverse;
		void VReverse();

		/****************** VReversedParameter ******************/
		%feature("compactdefaultargs") VReversedParameter;
		%feature("autodoc", "Computes the v parameter on the modified surface, produced by reversing the or v parametric direction of this offset surface, for any point of v parameter v on this offset surface.

Parameters
----------
V: float

Returns
-------
float
") VReversedParameter;
		Standard_Real VReversedParameter(const Standard_Real V);

};


%make_alias(Geom_OffsetSurface)

%extend Geom_OffsetSurface {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************
* class Geom_SweptSurface *
**************************/
%nodefaultctor Geom_SweptSurface;
class Geom_SweptSurface : public Geom_Surface {
	public:
		/****************** BasisCurve ******************/
		%feature("compactdefaultargs") BasisCurve;
		%feature("autodoc", "Returns the referenced curve of the surface. for a surface of revolution it is the revolution curve, for a surface of linear extrusion it is the extruded curve.

Returns
-------
opencascade::handle<Geom_Curve>
") BasisCurve;
		opencascade::handle<Geom_Curve> BasisCurve();

		/****************** Continuity ******************/
		%feature("compactdefaultargs") Continuity;
		%feature("autodoc", "Returns the continuity of the surface : c0 : only geometric continuity, c1 : continuity of the first derivative all along the surface, c2 : continuity of the second derivative all along the surface, c3 : continuity of the third derivative all along the surface, g1 : tangency continuity all along the surface, g2 : curvature continuity all along the surface, cn : the order of continuity is infinite.

Returns
-------
GeomAbs_Shape
") Continuity;
		GeomAbs_Shape Continuity();

		/****************** Direction ******************/
		%feature("compactdefaultargs") Direction;
		%feature("autodoc", "Returns the reference direction of the swept surface. for a surface of revolution it is the direction of the revolution axis, for a surface of linear extrusion it is the direction of extrusion.

Returns
-------
gp_Dir
") Direction;
		const gp_Dir Direction();

};


%make_alias(Geom_SweptSurface)

%extend Geom_SweptSurface {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************
* class Geom_VectorWithMagnitude *
*********************************/
class Geom_VectorWithMagnitude : public Geom_Vector {
	public:
		/****************** Geom_VectorWithMagnitude ******************/
		%feature("compactdefaultargs") Geom_VectorWithMagnitude;
		%feature("autodoc", "Creates a transient copy of v.

Parameters
----------
V: gp_Vec

Returns
-------
None
") Geom_VectorWithMagnitude;
		 Geom_VectorWithMagnitude(const gp_Vec & V);

		/****************** Geom_VectorWithMagnitude ******************/
		%feature("compactdefaultargs") Geom_VectorWithMagnitude;
		%feature("autodoc", "Creates a vector with three cartesian coordinates.

Parameters
----------
X: float
Y: float
Z: float

Returns
-------
None
") Geom_VectorWithMagnitude;
		 Geom_VectorWithMagnitude(const Standard_Real X, const Standard_Real Y, const Standard_Real Z);

		/****************** Geom_VectorWithMagnitude ******************/
		%feature("compactdefaultargs") Geom_VectorWithMagnitude;
		%feature("autodoc", "Creates a vector from the point p1 to the point p2. the magnitude of the vector is the distance between p1 and p2.

Parameters
----------
P1: gp_Pnt
P2: gp_Pnt

Returns
-------
None
") Geom_VectorWithMagnitude;
		 Geom_VectorWithMagnitude(const gp_Pnt & P1, const gp_Pnt & P2);

		/****************** Add ******************/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "Adds the vector other to <self>.

Parameters
----------
Other: Geom_Vector

Returns
-------
None
") Add;
		void Add(const opencascade::handle<Geom_Vector> & Other);

		/****************** Added ******************/
		%feature("compactdefaultargs") Added;
		%feature("autodoc", "Adds the vector other to <self>.

Parameters
----------
Other: Geom_Vector

Returns
-------
opencascade::handle<Geom_VectorWithMagnitude>
") Added;
		opencascade::handle<Geom_VectorWithMagnitude> Added(const opencascade::handle<Geom_Vector> & Other);

		/****************** Copy ******************/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "Creates a new object which is a copy of this vector.

Returns
-------
opencascade::handle<Geom_Geometry>
") Copy;
		opencascade::handle<Geom_Geometry> Copy();

		/****************** Cross ******************/
		%feature("compactdefaultargs") Cross;
		%feature("autodoc", "Computes the cross product between <self> and other <self> ^ other.

Parameters
----------
Other: Geom_Vector

Returns
-------
None
") Cross;
		void Cross(const opencascade::handle<Geom_Vector> & Other);

		/****************** CrossCross ******************/
		%feature("compactdefaultargs") CrossCross;
		%feature("autodoc", "Computes the triple vector product <self> ^ (v1 ^ v2).

Parameters
----------
V1: Geom_Vector
V2: Geom_Vector

Returns
-------
None
") CrossCross;
		void CrossCross(const opencascade::handle<Geom_Vector> & V1, const opencascade::handle<Geom_Vector> & V2);

		/****************** CrossCrossed ******************/
		%feature("compactdefaultargs") CrossCrossed;
		%feature("autodoc", "Computes the triple vector product <self> ^ (v1 ^ v2). a new vector is returned.

Parameters
----------
V1: Geom_Vector
V2: Geom_Vector

Returns
-------
opencascade::handle<Geom_Vector>
") CrossCrossed;
		opencascade::handle<Geom_Vector> CrossCrossed(const opencascade::handle<Geom_Vector> & V1, const opencascade::handle<Geom_Vector> & V2);

		/****************** Crossed ******************/
		%feature("compactdefaultargs") Crossed;
		%feature("autodoc", "Computes the cross product between <self> and other <self> ^ other. a new vector is returned.

Parameters
----------
Other: Geom_Vector

Returns
-------
opencascade::handle<Geom_Vector>
") Crossed;
		opencascade::handle<Geom_Vector> Crossed(const opencascade::handle<Geom_Vector> & Other);

		/****************** Divide ******************/
		%feature("compactdefaultargs") Divide;
		%feature("autodoc", "Divides <self> by a scalar.

Parameters
----------
Scalar: float

Returns
-------
None
") Divide;
		void Divide(const Standard_Real Scalar);

		/****************** Divided ******************/
		%feature("compactdefaultargs") Divided;
		%feature("autodoc", "Divides <self> by a scalar. a new vector is returned.

Parameters
----------
Scalar: float

Returns
-------
opencascade::handle<Geom_VectorWithMagnitude>
") Divided;
		opencascade::handle<Geom_VectorWithMagnitude> Divided(const Standard_Real Scalar);

		/****************** Magnitude ******************/
		%feature("compactdefaultargs") Magnitude;
		%feature("autodoc", "Returns the magnitude of <self>.

Returns
-------
float
") Magnitude;
		Standard_Real Magnitude();

		/****************** Multiplied ******************/
		%feature("compactdefaultargs") Multiplied;
		%feature("autodoc", "Computes the product of the vector <self> by a scalar. a new vector is returned.

Parameters
----------
Scalar: float

Returns
-------
opencascade::handle<Geom_VectorWithMagnitude>
") Multiplied;
		opencascade::handle<Geom_VectorWithMagnitude> Multiplied(const Standard_Real Scalar);

		/****************** Multiply ******************/
		%feature("compactdefaultargs") Multiply;
		%feature("autodoc", "Computes the product of the vector <self> by a scalar.

Parameters
----------
Scalar: float

Returns
-------
None
") Multiply;
		void Multiply(const Standard_Real Scalar);

		/****************** Normalize ******************/
		%feature("compactdefaultargs") Normalize;
		%feature("autodoc", "Normalizes <self>. //! raised if the magnitude of the vector is lower or equal to resolution from package gp.

Returns
-------
None
") Normalize;
		void Normalize();

		/****************** Normalized ******************/
		%feature("compactdefaultargs") Normalized;
		%feature("autodoc", "Returns a copy of <self> normalized. //! raised if the magnitude of the vector is lower or equal to resolution from package gp.

Returns
-------
opencascade::handle<Geom_VectorWithMagnitude>
") Normalized;
		opencascade::handle<Geom_VectorWithMagnitude> Normalized();

		/****************** SetCoord ******************/
		%feature("compactdefaultargs") SetCoord;
		%feature("autodoc", "Assigns the values x, y and z to the coordinates of this vector.

Parameters
----------
X: float
Y: float
Z: float

Returns
-------
None
") SetCoord;
		void SetCoord(const Standard_Real X, const Standard_Real Y, const Standard_Real Z);

		/****************** SetVec ******************/
		%feature("compactdefaultargs") SetVec;
		%feature("autodoc", "Converts the gp_vec vector v into this vector.

Parameters
----------
V: gp_Vec

Returns
-------
None
") SetVec;
		void SetVec(const gp_Vec & V);

		/****************** SetX ******************/
		%feature("compactdefaultargs") SetX;
		%feature("autodoc", "Changes the x coordinate of <self>.

Parameters
----------
X: float

Returns
-------
None
") SetX;
		void SetX(const Standard_Real X);

		/****************** SetY ******************/
		%feature("compactdefaultargs") SetY;
		%feature("autodoc", "Changes the y coordinate of <self>.

Parameters
----------
Y: float

Returns
-------
None
") SetY;
		void SetY(const Standard_Real Y);

		/****************** SetZ ******************/
		%feature("compactdefaultargs") SetZ;
		%feature("autodoc", "Changes the z coordinate of <self>.

Parameters
----------
Z: float

Returns
-------
None
") SetZ;
		void SetZ(const Standard_Real Z);

		/****************** SquareMagnitude ******************/
		%feature("compactdefaultargs") SquareMagnitude;
		%feature("autodoc", "Returns the square magnitude of <self>.

Returns
-------
float
") SquareMagnitude;
		Standard_Real SquareMagnitude();

		/****************** Subtract ******************/
		%feature("compactdefaultargs") Subtract;
		%feature("autodoc", "Subtracts the vector other to <self>.

Parameters
----------
Other: Geom_Vector

Returns
-------
None
") Subtract;
		void Subtract(const opencascade::handle<Geom_Vector> & Other);

		/****************** Subtracted ******************/
		%feature("compactdefaultargs") Subtracted;
		%feature("autodoc", "No available documentation.

Parameters
----------
Other: Geom_Vector

Returns
-------
opencascade::handle<Geom_VectorWithMagnitude>
") Subtracted;
		opencascade::handle<Geom_VectorWithMagnitude> Subtracted(const opencascade::handle<Geom_Vector> & Other);

		/****************** Transform ******************/
		%feature("compactdefaultargs") Transform;
		%feature("autodoc", "Applies the transformation t to this vector.

Parameters
----------
T: gp_Trsf

Returns
-------
None
") Transform;
		void Transform(const gp_Trsf & T);

};


%make_alias(Geom_VectorWithMagnitude)

%extend Geom_VectorWithMagnitude {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************
* class Geom_BSplineCurve *
**************************/
class Geom_BSplineCurve : public Geom_BoundedCurve {
	public:
		/****************** Geom_BSplineCurve ******************/
		%feature("compactdefaultargs") Geom_BSplineCurve;
		%feature("autodoc", "Creates a non-rational b_spline curve on the basis <knots, multiplicities> of degree <degree>.

Parameters
----------
Poles: TColgp_Array1OfPnt
Knots: TColStd_Array1OfReal
Multiplicities: TColStd_Array1OfInteger
Degree: int
Periodic: bool,optional
	default value is Standard_False

Returns
-------
None
") Geom_BSplineCurve;
		 Geom_BSplineCurve(const TColgp_Array1OfPnt & Poles, const TColStd_Array1OfReal & Knots, const TColStd_Array1OfInteger & Multiplicities, const Standard_Integer Degree, const Standard_Boolean Periodic = Standard_False);

		/****************** Geom_BSplineCurve ******************/
		%feature("compactdefaultargs") Geom_BSplineCurve;
		%feature("autodoc", "Creates a rational b_spline curve on the basis <knots, multiplicities> of degree <degree>. raises constructionerror subject to the following conditions 0 < degree <= maxdegree. //! weights.length() == poles.length() //! knots.length() == mults.length() >= 2 //! knots(i) < knots(i+1) (knots are increasing) //! 1 <= mults(i) <= degree //! on a non periodic curve the first and last multiplicities may be degree+1 (this is even recommanded if you want the curve to start and finish on the first and last pole). //! on a periodic curve the first and the last multicities must be the same. //! on non-periodic curves //! poles.length() == sum(mults(i)) - degree - 1 >= 2 //! on periodic curves //! poles.length() == sum(mults(i)) except the first or last.

Parameters
----------
Poles: TColgp_Array1OfPnt
Weights: TColStd_Array1OfReal
Knots: TColStd_Array1OfReal
Multiplicities: TColStd_Array1OfInteger
Degree: int
Periodic: bool,optional
	default value is Standard_False
CheckRational: bool,optional
	default value is Standard_True

Returns
-------
None
") Geom_BSplineCurve;
		 Geom_BSplineCurve(const TColgp_Array1OfPnt & Poles, const TColStd_Array1OfReal & Weights, const TColStd_Array1OfReal & Knots, const TColStd_Array1OfInteger & Multiplicities, const Standard_Integer Degree, const Standard_Boolean Periodic = Standard_False, const Standard_Boolean CheckRational = Standard_True);

		/****************** Continuity ******************/
		%feature("compactdefaultargs") Continuity;
		%feature("autodoc", "Returns the global continuity of the curve : c0 : only geometric continuity, c1 : continuity of the first derivative all along the curve, c2 : continuity of the second derivative all along the curve, c3 : continuity of the third derivative all along the curve, cn : the order of continuity is infinite. for a b-spline curve of degree d if a knot ui has a multiplicity p the b-spline curve is only cd-p continuous at ui. so the global continuity of the curve can't be greater than cd-p where p is the maximum multiplicity of the interior knots. in the interior of a knot span the curve is infinitely continuously differentiable.

Returns
-------
GeomAbs_Shape
") Continuity;
		GeomAbs_Shape Continuity();

		/****************** Copy ******************/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "Creates a new object which is a copy of this bspline curve.

Returns
-------
opencascade::handle<Geom_Geometry>
") Copy;
		opencascade::handle<Geom_Geometry> Copy();

		/****************** D0 ******************/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "Returns in p the point of parameter u.

Parameters
----------
U: float
P: gp_Pnt

Returns
-------
None
") D0;
		void D0(const Standard_Real U, gp_Pnt & P);

		/****************** D1 ******************/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "Raised if the continuity of the curve is not c1.

Parameters
----------
U: float
P: gp_Pnt
V1: gp_Vec

Returns
-------
None
") D1;
		void D1(const Standard_Real U, gp_Pnt & P, gp_Vec & V1);

		/****************** D2 ******************/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "Raised if the continuity of the curve is not c2.

Parameters
----------
U: float
P: gp_Pnt
V1: gp_Vec
V2: gp_Vec

Returns
-------
None
") D2;
		void D2(const Standard_Real U, gp_Pnt & P, gp_Vec & V1, gp_Vec & V2);

		/****************** D3 ******************/
		%feature("compactdefaultargs") D3;
		%feature("autodoc", "Raised if the continuity of the curve is not c3.

Parameters
----------
U: float
P: gp_Pnt
V1: gp_Vec
V2: gp_Vec
V3: gp_Vec

Returns
-------
None
") D3;
		void D3(const Standard_Real U, gp_Pnt & P, gp_Vec & V1, gp_Vec & V2, gp_Vec & V3);

		/****************** DN ******************/
		%feature("compactdefaultargs") DN;
		%feature("autodoc", "For the point of parameter u of this bspline curve, computes the vector corresponding to the nth derivative. warning on a point where the continuity of the curve is not the one requested, this function impacts the part defined by the parameter with a value greater than u, i.e. the part of the curve to the 'right' of the singularity. exceptions standard_rangeerror if n is less than 1. //! the following functions compute the point of parameter u and the derivatives at this point on the b-spline curve arc defined between the knot fromk1 and the knot tok2. u can be out of bounds [knot (fromk1), knot (tok2)] but for the computation we only use the definition of the curve between these two knots. this method is useful to compute local derivative, if the order of continuity of the whole curve is not greater enough. inside the parametric domain knot (fromk1), knot (tok2) the evaluations are the same as if we consider the whole definition of the curve. of course the evaluations are different outside this parametric domain.

Parameters
----------
U: float
N: int

Returns
-------
gp_Vec
") DN;
		gp_Vec DN(const Standard_Real U, const Standard_Integer N);

		/****************** Degree ******************/
		%feature("compactdefaultargs") Degree;
		%feature("autodoc", "Returns the degree of this bspline curve. the degree of a geom_bsplinecurve curve cannot be greater than geom_bsplinecurve::maxdegree(). computation of value and derivatives.

Returns
-------
int
") Degree;
		Standard_Integer Degree();

		/****************** EndPoint ******************/
		%feature("compactdefaultargs") EndPoint;
		%feature("autodoc", "Returns the last point of the curve. warnings : the last point of the curve is different from the last pole of the curve if the multiplicity of the last knot is lower than degree.

Returns
-------
gp_Pnt
") EndPoint;
		gp_Pnt EndPoint();

		/****************** FirstParameter ******************/
		%feature("compactdefaultargs") FirstParameter;
		%feature("autodoc", "Returns the value of the first parameter of this bspline curve. this is a knot value. the first parameter is the one of the start point of the bspline curve.

Returns
-------
float
") FirstParameter;
		Standard_Real FirstParameter();

		/****************** FirstUKnotIndex ******************/
		%feature("compactdefaultargs") FirstUKnotIndex;
		%feature("autodoc", "Returns the index in the knot array of the knot corresponding to the first or last parameter of this bspline curve. for a bspline curve, the first (or last) parameter (which gives the start (or end) point of the curve) is a knot value. however, if the multiplicity of the first (or last) knot is less than degree + 1, where degree is the degree of the curve, it is not the first (or last) knot of the curve.

Returns
-------
int
") FirstUKnotIndex;
		Standard_Integer FirstUKnotIndex();

		/****************** IncreaseDegree ******************/
		%feature("compactdefaultargs") IncreaseDegree;
		%feature("autodoc", "Increases the degree of this bspline curve to degree. as a result, the poles, weights and multiplicities tables are modified; the knots table is not changed. nothing is done if degree is less than or equal to the current degree. exceptions standard_constructionerror if degree is greater than geom_bsplinecurve::maxdegree().

Parameters
----------
Degree: int

Returns
-------
None
") IncreaseDegree;
		void IncreaseDegree(const Standard_Integer Degree);

		/****************** IncreaseMultiplicity ******************/
		%feature("compactdefaultargs") IncreaseMultiplicity;
		%feature("autodoc", "Increases the multiplicity of the knot <index> to <m>. //! if <m> is lower or equal to the current multiplicity nothing is done. if <m> is higher than the degree the degree is used. if <index> is not in [firstuknotindex, lastuknotindex].

Parameters
----------
Index: int
M: int

Returns
-------
None
") IncreaseMultiplicity;
		void IncreaseMultiplicity(const Standard_Integer Index, const Standard_Integer M);

		/****************** IncreaseMultiplicity ******************/
		%feature("compactdefaultargs") IncreaseMultiplicity;
		%feature("autodoc", "Increases the multiplicities of the knots in [i1,i2] to <m>. //! for each knot if <m> is lower or equal to the current multiplicity nothing is done. if <m> is higher than the degree the degree is used. if <i1,i2> are not in [firstuknotindex, lastuknotindex].

Parameters
----------
I1: int
I2: int
M: int

Returns
-------
None
") IncreaseMultiplicity;
		void IncreaseMultiplicity(const Standard_Integer I1, const Standard_Integer I2, const Standard_Integer M);

		/****************** IncrementMultiplicity ******************/
		%feature("compactdefaultargs") IncrementMultiplicity;
		%feature("autodoc", "Increment the multiplicities of the knots in [i1,i2] by <m>. //! if <m> is not positive nithing is done. //! for each knot the resulting multiplicity is limited to the degree. if <i1,i2> are not in [firstuknotindex, lastuknotindex].

Parameters
----------
I1: int
I2: int
M: int

Returns
-------
None
") IncrementMultiplicity;
		void IncrementMultiplicity(const Standard_Integer I1, const Standard_Integer I2, const Standard_Integer M);

		/****************** InsertKnot ******************/
		%feature("compactdefaultargs") InsertKnot;
		%feature("autodoc", "Inserts a knot value in the sequence of knots. if <u> is an existing knot the multiplicity is increased by <m>. //! if u is not on the parameter range nothing is done. //! if the multiplicity is negative or null nothing is done. the new multiplicity is limited to the degree. //! the tolerance criterion for knots equality is the max of epsilon(u) and parametrictolerance.

Parameters
----------
U: float
M: int,optional
	default value is 1
ParametricTolerance: float,optional
	default value is 0.0
Add: bool,optional
	default value is Standard_True

Returns
-------
None
") InsertKnot;
		void InsertKnot(const Standard_Real U, const Standard_Integer M = 1, const Standard_Real ParametricTolerance = 0.0, const Standard_Boolean Add = Standard_True);

		/****************** InsertKnots ******************/
		%feature("compactdefaultargs") InsertKnots;
		%feature("autodoc", "Inserts a set of knots values in the sequence of knots. //! for each u = knots(i), m = mults(i) //! if <u> is an existing knot the multiplicity is increased by <m> if <add> is true, increased to <m> if <add> is false. //! if u is not on the parameter range nothing is done. //! if the multiplicity is negative or null nothing is done. the new multiplicity is limited to the degree. //! the tolerance criterion for knots equality is the max of epsilon(u) and parametrictolerance.

Parameters
----------
Knots: TColStd_Array1OfReal
Mults: TColStd_Array1OfInteger
ParametricTolerance: float,optional
	default value is 0.0
Add: bool,optional
	default value is Standard_False

Returns
-------
None
") InsertKnots;
		void InsertKnots(const TColStd_Array1OfReal & Knots, const TColStd_Array1OfInteger & Mults, const Standard_Real ParametricTolerance = 0.0, const Standard_Boolean Add = Standard_False);

		/****************** IsCN ******************/
		%feature("compactdefaultargs") IsCN;
		%feature("autodoc", "Returns the continuity of the curve, the curve is at least c0. raised if n < 0.

Parameters
----------
N: int

Returns
-------
bool
") IsCN;
		Standard_Boolean IsCN(const Standard_Integer N);

		/****************** IsClosed ******************/
		%feature("compactdefaultargs") IsClosed;
		%feature("autodoc", "Returns true if the distance between the first point and the last point of the curve is lower or equal to resolution from package gp. warnings : the first and the last point can be different from the first pole and the last pole of the curve.

Returns
-------
bool
") IsClosed;
		Standard_Boolean IsClosed();

		/****************** IsEqual ******************/
		%feature("compactdefaultargs") IsEqual;
		%feature("autodoc", "Comapare two bspline curve on identity;.

Parameters
----------
theOther: Geom_BSplineCurve
thePreci: float

Returns
-------
bool
") IsEqual;
		Standard_Boolean IsEqual(const opencascade::handle<Geom_BSplineCurve> & theOther, const Standard_Real thePreci);

		/****************** IsG1 ******************/
		%feature("compactdefaultargs") IsG1;
		%feature("autodoc", "Check if curve has at least g1 continuity in interval [thetf, thetl] returns true if iscn(1) or angle betweem 'left' and 'right' first derivatives at knots with c0 continuity is less then theangtol only knots in interval [thetf, thetl] is checked.

Parameters
----------
theTf: float
theTl: float
theAngTol: float

Returns
-------
bool
") IsG1;
		Standard_Boolean IsG1(const Standard_Real theTf, const Standard_Real theTl, const Standard_Real theAngTol);

		/****************** IsPeriodic ******************/
		%feature("compactdefaultargs") IsPeriodic;
		%feature("autodoc", "Returns true if the curve is periodic.

Returns
-------
bool
") IsPeriodic;
		Standard_Boolean IsPeriodic();

		/****************** IsRational ******************/
		%feature("compactdefaultargs") IsRational;
		%feature("autodoc", "Returns true if the weights are not identical. the tolerance criterion is epsilon of the class real.

Returns
-------
bool
") IsRational;
		Standard_Boolean IsRational();

		/****************** Knot ******************/
		%feature("compactdefaultargs") Knot;
		%feature("autodoc", "Returns the knot of range index. when there is a knot with a multiplicity greater than 1 the knot is not repeated. the method multiplicity can be used to get the multiplicity of the knot. raised if index < 1 or index > nbknots.

Parameters
----------
Index: int

Returns
-------
float
") Knot;
		Standard_Real Knot(const Standard_Integer Index);

		/****************** KnotDistribution ******************/
		%feature("compactdefaultargs") KnotDistribution;
		%feature("autodoc", "Returns nonuniform or uniform or quasiuniform or piecewisebezier. if all the knots differ by a positive constant from the preceding knot the bspline curve can be : - uniform if all the knots are of multiplicity 1, - quasiuniform if all the knots are of multiplicity 1 except for the first and last knot which are of multiplicity degree + 1, - piecewisebezier if the first and last knots have multiplicity degree + 1 and if interior knots have multiplicity degree a piecewise bezier with only two knots is a beziercurve. else the curve is non uniform. the tolerance criterion is epsilon from class real.

Returns
-------
GeomAbs_BSplKnotDistribution
") KnotDistribution;
		GeomAbs_BSplKnotDistribution KnotDistribution();

		/****************** KnotSequence ******************/
		%feature("compactdefaultargs") KnotSequence;
		%feature("autodoc", "Returns k, the knots sequence of this bspline curve. in this sequence, knots with a multiplicity greater than 1 are repeated. in the case of a non-periodic curve the length of the sequence must be equal to the sum of the nbknots multiplicities of the knots of the curve (where nbknots is the number of knots of this bspline curve). this sum is also equal to : nbpoles + degree + 1 where nbpoles is the number of poles and degree the degree of this bspline curve. in the case of a periodic curve, if there are k periodic knots, the period is knot(k+1) - knot(1). the initial sequence is built by writing knots 1 to k+1, which are repeated according to their corresponding multiplicities. if degree is the degree of the curve, the degree of continuity of the curve at the knot of index 1 (or k+1) is equal to c = degree + 1 - mult(1). c knots are then inserted at the beginning and end of the initial sequence: - the c values of knots preceding the first item knot(k+1) in the initial sequence are inserted at the beginning; the period is subtracted from these c values; - the c values of knots following the last item knot(1) in the initial sequence are inserted at the end; the period is added to these c values. the length of the sequence must therefore be equal to: nbpoles + 2*degree - mult(1) + 2. example for a non-periodic bspline curve of degree 2 where: - the array of knots is: { k1 k2 k3 k4 }, - with associated multiplicities: { 3 1 2 3 }, the knot sequence is: k = { k1 k1 k1 k2 k3 k3 k4 k4 k4 } for a periodic bspline curve of degree 4 , which is 'c1' continuous at the first knot, and where : - the periodic knots are: { k1 k2 k3 (k4) } (3 periodic knots: the points of parameter k1 and k4 are identical, the period is p = k4 - k1), - with associated multiplicities: { 3 1 2 (3) }, the degree of continuity at knots k1 and k4 is: degree + 1 - mult(i) = 2. 2 supplementary knots are added at the beginning and end of the sequence: - at the beginning: the 2 knots preceding k4 minus the period; in this example, this is k3 - p both times; - at the end: the 2 knots following k1 plus the period; in this example, this is k2 + p and k3 + p. the knot sequence is therefore: k = { k3-p k3-p k1 k1 k1 k2 k3 k3 k4 k4 k4 k2+p k3+p } exceptions raised if k.lower() is less than number of first knot in knot sequence with repetitions or k.upper() is more than number of last knot in knot sequence with repetitions.

Parameters
----------
K: TColStd_Array1OfReal

Returns
-------
None
") KnotSequence;
		void KnotSequence(TColStd_Array1OfReal & K);

		/****************** KnotSequence ******************/
		%feature("compactdefaultargs") KnotSequence;
		%feature("autodoc", "Returns the knots of the b-spline curve. knots with multiplicit greater than 1 are repeated.

Returns
-------
TColStd_Array1OfReal
") KnotSequence;
		const TColStd_Array1OfReal & KnotSequence();

		/****************** Knots ******************/
		%feature("compactdefaultargs") Knots;
		%feature("autodoc", "Returns the knot values of the b-spline curve; warning a knot with a multiplicity greater than 1 is not repeated in the knot table. the multiplicity function can be used to obtain the multiplicity of each knot. //! raised k.lower() is less than number of first knot or k.upper() is more than number of last knot.

Parameters
----------
K: TColStd_Array1OfReal

Returns
-------
None
") Knots;
		void Knots(TColStd_Array1OfReal & K);

		/****************** Knots ******************/
		%feature("compactdefaultargs") Knots;
		%feature("autodoc", "Returns the knot values of the b-spline curve; warning a knot with a multiplicity greater than 1 is not repeated in the knot table. the multiplicity function can be used to obtain the multiplicity of each knot.

Returns
-------
TColStd_Array1OfReal
") Knots;
		const TColStd_Array1OfReal & Knots();

		/****************** LastParameter ******************/
		%feature("compactdefaultargs") LastParameter;
		%feature("autodoc", "Computes the parametric value of the end point of the curve. it is a knot value.

Returns
-------
float
") LastParameter;
		Standard_Real LastParameter();

		/****************** LastUKnotIndex ******************/
		%feature("compactdefaultargs") LastUKnotIndex;
		%feature("autodoc", "For a bspline curve the last parameter (which gives the end point of the curve) is a knot value but if the multiplicity of the last knot index is lower than degree + 1 it is not the last knot of the curve. this method computes the index of the knot corresponding to the last parameter.

Returns
-------
int
") LastUKnotIndex;
		Standard_Integer LastUKnotIndex();

		/****************** LocalD0 ******************/
		%feature("compactdefaultargs") LocalD0;
		%feature("autodoc", "Raised if fromk1 = tok2.

Parameters
----------
U: float
FromK1: int
ToK2: int
P: gp_Pnt

Returns
-------
None
") LocalD0;
		void LocalD0(const Standard_Real U, const Standard_Integer FromK1, const Standard_Integer ToK2, gp_Pnt & P);

		/****************** LocalD1 ******************/
		%feature("compactdefaultargs") LocalD1;
		%feature("autodoc", "Raised if the local continuity of the curve is not c1 between the knot k1 and the knot k2. raised if fromk1 = tok2.

Parameters
----------
U: float
FromK1: int
ToK2: int
P: gp_Pnt
V1: gp_Vec

Returns
-------
None
") LocalD1;
		void LocalD1(const Standard_Real U, const Standard_Integer FromK1, const Standard_Integer ToK2, gp_Pnt & P, gp_Vec & V1);

		/****************** LocalD2 ******************/
		%feature("compactdefaultargs") LocalD2;
		%feature("autodoc", "Raised if the local continuity of the curve is not c2 between the knot k1 and the knot k2. raised if fromk1 = tok2.

Parameters
----------
U: float
FromK1: int
ToK2: int
P: gp_Pnt
V1: gp_Vec
V2: gp_Vec

Returns
-------
None
") LocalD2;
		void LocalD2(const Standard_Real U, const Standard_Integer FromK1, const Standard_Integer ToK2, gp_Pnt & P, gp_Vec & V1, gp_Vec & V2);

		/****************** LocalD3 ******************/
		%feature("compactdefaultargs") LocalD3;
		%feature("autodoc", "Raised if the local continuity of the curve is not c3 between the knot k1 and the knot k2. raised if fromk1 = tok2.

Parameters
----------
U: float
FromK1: int
ToK2: int
P: gp_Pnt
V1: gp_Vec
V2: gp_Vec
V3: gp_Vec

Returns
-------
None
") LocalD3;
		void LocalD3(const Standard_Real U, const Standard_Integer FromK1, const Standard_Integer ToK2, gp_Pnt & P, gp_Vec & V1, gp_Vec & V2, gp_Vec & V3);

		/****************** LocalDN ******************/
		%feature("compactdefaultargs") LocalDN;
		%feature("autodoc", "Raised if the local continuity of the curve is not cn between the knot k1 and the knot k2. raised if fromk1 = tok2. raised if n < 1.

Parameters
----------
U: float
FromK1: int
ToK2: int
N: int

Returns
-------
gp_Vec
") LocalDN;
		gp_Vec LocalDN(const Standard_Real U, const Standard_Integer FromK1, const Standard_Integer ToK2, const Standard_Integer N);

		/****************** LocalValue ******************/
		%feature("compactdefaultargs") LocalValue;
		%feature("autodoc", "Raised if fromk1 = tok2.

Parameters
----------
U: float
FromK1: int
ToK2: int

Returns
-------
gp_Pnt
") LocalValue;
		gp_Pnt LocalValue(const Standard_Real U, const Standard_Integer FromK1, const Standard_Integer ToK2);

		/****************** LocateU ******************/
		%feature("compactdefaultargs") LocateU;
		%feature("autodoc", "Locates the parametric value u in the sequence of knots. if 'withknotrepetition' is true we consider the knot's representation with repetition of multiple knot value, otherwise we consider the knot's representation with no repetition of multiple knot values. knots (i1) <= u <= knots (i2) . if i1 = i2 u is a knot value (the tolerance criterion parametrictolerance is used). . if i1 < 1 => u < knots (1) - abs(parametrictolerance) . if i2 > nbknots => u > knots (nbknots) + abs(parametrictolerance).

Parameters
----------
U: float
ParametricTolerance: float
WithKnotRepetition: bool,optional
	default value is Standard_False

Returns
-------
I1: int
I2: int
") LocateU;
		void LocateU(const Standard_Real U, const Standard_Real ParametricTolerance, Standard_Integer &OutValue, Standard_Integer &OutValue, const Standard_Boolean WithKnotRepetition = Standard_False);

		/****************** MaxDegree ******************/
		%feature("compactdefaultargs") MaxDegree;
		%feature("autodoc", "Returns the value of the maximum degree of the normalized b-spline basis functions in this package.

Returns
-------
int
") MaxDegree;
		static Standard_Integer MaxDegree();

		/****************** MovePoint ******************/
		%feature("compactdefaultargs") MovePoint;
		%feature("autodoc", "Moves the point of parameter u of this bspline curve to p. index1 and index2 are the indexes in the table of poles of this bspline curve of the first and last poles designated to be moved. firstmodifiedpole and lastmodifiedpole are the indexes of the first and last poles which are effectively modified. in the event of incompatibility between index1, index2 and the value u: - no change is made to this bspline curve, and - the firstmodifiedpole and lastmodifiedpole are returned null. exceptions standard_outofrange if: - index1 is greater than or equal to index2, or - index1 or index2 is less than 1 or greater than the number of poles of this bspline curve.

Parameters
----------
U: float
P: gp_Pnt
Index1: int
Index2: int

Returns
-------
FirstModifiedPole: int
LastModifiedPole: int
") MovePoint;
		void MovePoint(const Standard_Real U, const gp_Pnt & P, const Standard_Integer Index1, const Standard_Integer Index2, Standard_Integer &OutValue, Standard_Integer &OutValue);

		/****************** MovePointAndTangent ******************/
		%feature("compactdefaultargs") MovePointAndTangent;
		%feature("autodoc", "Move a point with parameter u to p. and makes it tangent at u be tangent. startingcondition = -1 means first can move endingcondition = -1 means last point can move startingcondition = 0 means the first point cannot move endingcondition = 0 means the last point cannot move startingcondition = 1 means the first point and tangent cannot move endingcondition = 1 means the last point and tangent cannot move and so forth errorstatus != 0 means that there are not enought degree of freedom with the constrain to deform the curve accordingly.

Parameters
----------
U: float
P: gp_Pnt
Tangent: gp_Vec
Tolerance: float
StartingCondition: int
EndingCondition: int

Returns
-------
ErrorStatus: int
") MovePointAndTangent;
		void MovePointAndTangent(const Standard_Real U, const gp_Pnt & P, const gp_Vec & Tangent, const Standard_Real Tolerance, const Standard_Integer StartingCondition, const Standard_Integer EndingCondition, Standard_Integer &OutValue);

		/****************** Multiplicities ******************/
		%feature("compactdefaultargs") Multiplicities;
		%feature("autodoc", "Returns the multiplicity of the knots of the curve. //! raised if the length of m is not equal to nbknots.

Parameters
----------
M: TColStd_Array1OfInteger

Returns
-------
None
") Multiplicities;
		void Multiplicities(TColStd_Array1OfInteger & M);

		/****************** Multiplicities ******************/
		%feature("compactdefaultargs") Multiplicities;
		%feature("autodoc", "Returns the multiplicity of the knots of the curve.

Returns
-------
TColStd_Array1OfInteger
") Multiplicities;
		const TColStd_Array1OfInteger & Multiplicities();

		/****************** Multiplicity ******************/
		%feature("compactdefaultargs") Multiplicity;
		%feature("autodoc", "Returns the multiplicity of the knots of range index. raised if index < 1 or index > nbknots.

Parameters
----------
Index: int

Returns
-------
int
") Multiplicity;
		Standard_Integer Multiplicity(const Standard_Integer Index);

		/****************** NbKnots ******************/
		%feature("compactdefaultargs") NbKnots;
		%feature("autodoc", "Returns the number of knots. this method returns the number of knot without repetition of multiple knots.

Returns
-------
int
") NbKnots;
		Standard_Integer NbKnots();

		/****************** NbPoles ******************/
		%feature("compactdefaultargs") NbPoles;
		%feature("autodoc", "Returns the number of poles.

Returns
-------
int
") NbPoles;
		Standard_Integer NbPoles();

		/****************** PeriodicNormalization ******************/
		%feature("compactdefaultargs") PeriodicNormalization;
		%feature("autodoc", "Returns the parameter normalized within the period if the curve is periodic : otherwise does not do anything.

Parameters
----------

Returns
-------
U: float
") PeriodicNormalization;
		void PeriodicNormalization(Standard_Real &OutValue);

		/****************** Pole ******************/
		%feature("compactdefaultargs") Pole;
		%feature("autodoc", "Returns the pole of range index. raised if index < 1 or index > nbpoles.

Parameters
----------
Index: int

Returns
-------
gp_Pnt
") Pole;
		const gp_Pnt Pole(const Standard_Integer Index);

		/****************** Poles ******************/
		%feature("compactdefaultargs") Poles;
		%feature("autodoc", "Returns the poles of the b-spline curve; //! raised if the length of p is not equal to the number of poles.

Parameters
----------
P: TColgp_Array1OfPnt

Returns
-------
None
") Poles;
		void Poles(TColgp_Array1OfPnt & P);

		/****************** Poles ******************/
		%feature("compactdefaultargs") Poles;
		%feature("autodoc", "Returns the poles of the b-spline curve;.

Returns
-------
TColgp_Array1OfPnt
") Poles;
		const TColgp_Array1OfPnt & Poles();

		/****************** RemoveKnot ******************/
		%feature("compactdefaultargs") RemoveKnot;
		%feature("autodoc", "Reduces the multiplicity of the knot of index index to m. if m is equal to 0, the knot is removed. with a modification of this type, the array of poles is also modified. two different algorithms are systematically used to compute the new poles of the curve. if, for each pole, the distance between the pole calculated using the first algorithm and the same pole calculated using the second algorithm, is less than tolerance, this ensures that the curve is not modified by more than tolerance. under these conditions, true is returned; otherwise, false is returned. a low tolerance is used to prevent modification of the curve. a high tolerance is used to 'smooth' the curve. exceptions standard_outofrange if index is outside the bounds of the knots table. pole insertion and pole removing this operation is limited to the uniform or quasiuniform bsplinecurve. the knot values are modified . if the bspline is nonuniform or piecewise bezier an exception construction error is raised.

Parameters
----------
Index: int
M: int
Tolerance: float

Returns
-------
bool
") RemoveKnot;
		Standard_Boolean RemoveKnot(const Standard_Integer Index, const Standard_Integer M, const Standard_Real Tolerance);

		/****************** Resolution ******************/
		%feature("compactdefaultargs") Resolution;
		%feature("autodoc", "Computes for this bspline curve the parametric tolerance utolerance for a given 3d tolerance tolerance3d. if f(t) is the equation of this bspline curve, utolerance ensures that: | t1 - t0| < utolerance ===> |f(t1) - f(t0)| < tolerance3d.

Parameters
----------
Tolerance3D: float

Returns
-------
UTolerance: float
") Resolution;
		void Resolution(const Standard_Real Tolerance3D, Standard_Real &OutValue);

		/****************** Reverse ******************/
		%feature("compactdefaultargs") Reverse;
		%feature("autodoc", "Changes the direction of parametrization of <self>. the knot sequence is modified, the firstparameter and the lastparameter are not modified. the startpoint of the initial curve becomes the endpoint of the reversed curve and the endpoint of the initial curve becomes the startpoint of the reversed curve.

Returns
-------
None
") Reverse;
		void Reverse();

		/****************** ReversedParameter ******************/
		%feature("compactdefaultargs") ReversedParameter;
		%feature("autodoc", "Returns the parameter on the reversed curve for the point of parameter u on <self>. //! returns ufirst + ulast - u.

Parameters
----------
U: float

Returns
-------
float
") ReversedParameter;
		Standard_Real ReversedParameter(const Standard_Real U);

		/****************** Segment ******************/
		%feature("compactdefaultargs") Segment;
		%feature("autodoc", "Modifies this bspline curve by segmenting it between u1 and u2. either of these values can be outside the bounds of the curve, but u2 must be greater than u1. all data structure tables of this bspline curve are modified, but the knots located between u1 and u2 are retained. the degree of the curve is not modified. //! parameter thetolerance defines the possible proximity of the segment boundaries and b-spline knots to treat them as equal. //! warnings : even if <self> is not closed it can become closed after the segmentation for example if u1 or u2 are out of the bounds of the curve <self> or if the curve makes loop. after the segmentation the length of a curve can be null. raises if u2 < u1. standard_domainerror if u2 - u1 exceeds the period for periodic curves. i.e. ((u2 - u1) - period) > precision::pconfusion().

Parameters
----------
U1: float
U2: float
theTolerance: float,optional
	default value is Precision::PConfusion()

Returns
-------
None
") Segment;
		void Segment(const Standard_Real U1, const Standard_Real U2, const Standard_Real theTolerance = Precision::PConfusion());

		/****************** SetKnot ******************/
		%feature("compactdefaultargs") SetKnot;
		%feature("autodoc", "Modifies this bspline curve by assigning the value k to the knot of index index in the knots table. this is a relatively local modification because k must be such that: knots(index - 1) < k < knots(index + 1) the second syntax allows you also to increase the multiplicity of the knot to m (but it is not possible to decrease the multiplicity of the knot with this function). standard_constructionerror if: - k is not such that: knots(index - 1) < k < knots(index + 1) - m is greater than the degree of this bspline curve or lower than the previous multiplicity of knot of index index in the knots table. standard_outofrange if index is outside the bounds of the knots table.

Parameters
----------
Index: int
K: float

Returns
-------
None
") SetKnot;
		void SetKnot(const Standard_Integer Index, const Standard_Real K);

		/****************** SetKnot ******************/
		%feature("compactdefaultargs") SetKnot;
		%feature("autodoc", "Changes the knot of range index with its multiplicity. you can increase the multiplicity of a knot but it is not allowed to decrease the multiplicity of an existing knot. //! raised if k >= knots(index+1) or k <= knots(index-1). raised if m is greater than degree or lower than the previous multiplicity of knot of range index. raised if index < 1 || index > nbknots.

Parameters
----------
Index: int
K: float
M: int

Returns
-------
None
") SetKnot;
		void SetKnot(const Standard_Integer Index, const Standard_Real K, const Standard_Integer M);

		/****************** SetKnots ******************/
		%feature("compactdefaultargs") SetKnots;
		%feature("autodoc", "Modifies this bspline curve by assigning the array k to its knots table. the multiplicity of the knots is not modified. exceptions standard_constructionerror if the values in the array k are not in ascending order. standard_outofrange if the bounds of the array k are not respectively 1 and the number of knots of this bspline curve.

Parameters
----------
K: TColStd_Array1OfReal

Returns
-------
None
") SetKnots;
		void SetKnots(const TColStd_Array1OfReal & K);

		/****************** SetNotPeriodic ******************/
		%feature("compactdefaultargs") SetNotPeriodic;
		%feature("autodoc", "Changes this bspline curve into a non-periodic curve. if this curve is already non-periodic, it is not modified. note: the poles and knots tables are modified. warning if this curve is periodic, as the multiplicity of the first and last knots is not modified, and is not equal to degree + 1, where degree is the degree of this bspline curve, the start and end points of the curve are not its first and last poles.

Returns
-------
None
") SetNotPeriodic;
		void SetNotPeriodic();

		/****************** SetOrigin ******************/
		%feature("compactdefaultargs") SetOrigin;
		%feature("autodoc", "Assigns the knot of index index in the knots table as the origin of this periodic bspline curve. as a consequence, the knots and poles tables are modified. exceptions standard_nosuchobject if this curve is not periodic. standard_domainerror if index is outside the bounds of the knots table.

Parameters
----------
Index: int

Returns
-------
None
") SetOrigin;
		void SetOrigin(const Standard_Integer Index);

		/****************** SetOrigin ******************/
		%feature("compactdefaultargs") SetOrigin;
		%feature("autodoc", "Set the origin of a periodic curve at knot u. if u is not a knot of the bspline a new knot is inseted. knotvector and poles are modified. raised if the curve is not periodic.

Parameters
----------
U: float
Tol: float

Returns
-------
None
") SetOrigin;
		void SetOrigin(const Standard_Real U, const Standard_Real Tol);

		/****************** SetPeriodic ******************/
		%feature("compactdefaultargs") SetPeriodic;
		%feature("autodoc", "Changes this bspline curve into a periodic curve. to become periodic, the curve must first be closed. next, the knot sequence must be periodic. for this, firstuknotindex and lastuknotindex are used to compute i1 and i2, the indexes in the knots array of the knots corresponding to the first and last parameters of this bspline curve. the period is therefore: knots(i2) - knots(i1). consequently, the knots and poles tables are modified. exceptions standard_constructionerror if this bspline curve is not closed.

Returns
-------
None
") SetPeriodic;
		void SetPeriodic();

		/****************** SetPole ******************/
		%feature("compactdefaultargs") SetPole;
		%feature("autodoc", "Modifies this bspline curve by assigning p to the pole of index index in the poles table. exceptions standard_outofrange if index is outside the bounds of the poles table. standard_constructionerror if weight is negative or null.

Parameters
----------
Index: int
P: gp_Pnt

Returns
-------
None
") SetPole;
		void SetPole(const Standard_Integer Index, const gp_Pnt & P);

		/****************** SetPole ******************/
		%feature("compactdefaultargs") SetPole;
		%feature("autodoc", "Modifies this bspline curve by assigning p to the pole of index index in the poles table. this syntax also allows you to modify the weight of the modified pole, which becomes weight. in this case, if this bspline curve is non-rational, it can become rational and vice versa. exceptions standard_outofrange if index is outside the bounds of the poles table. standard_constructionerror if weight is negative or null.

Parameters
----------
Index: int
P: gp_Pnt
Weight: float

Returns
-------
None
") SetPole;
		void SetPole(const Standard_Integer Index, const gp_Pnt & P, const Standard_Real Weight);

		/****************** SetWeight ******************/
		%feature("compactdefaultargs") SetWeight;
		%feature("autodoc", "Changes the weight for the pole of range index. if the curve was non rational it can become rational. if the curve was rational it can become non rational. //! raised if index < 1 || index > nbpoles raised if weight <= 0.0.

Parameters
----------
Index: int
Weight: float

Returns
-------
None
") SetWeight;
		void SetWeight(const Standard_Integer Index, const Standard_Real Weight);

		/****************** StartPoint ******************/
		%feature("compactdefaultargs") StartPoint;
		%feature("autodoc", "Returns the start point of the curve. warnings : this point is different from the first pole of the curve if the multiplicity of the first knot is lower than degree.

Returns
-------
gp_Pnt
") StartPoint;
		gp_Pnt StartPoint();

		/****************** Transform ******************/
		%feature("compactdefaultargs") Transform;
		%feature("autodoc", "Applies the transformation t to this bspline curve.

Parameters
----------
T: gp_Trsf

Returns
-------
None
") Transform;
		void Transform(const gp_Trsf & T);

		/****************** Weight ******************/
		%feature("compactdefaultargs") Weight;
		%feature("autodoc", "Returns the weight of the pole of range index . raised if index < 1 or index > nbpoles.

Parameters
----------
Index: int

Returns
-------
float
") Weight;
		Standard_Real Weight(const Standard_Integer Index);

		/****************** Weights ******************/
		%feature("compactdefaultargs") Weights;
		%feature("autodoc", "Returns the weights of the b-spline curve; //! raised if the length of w is not equal to nbpoles.

Parameters
----------
W: TColStd_Array1OfReal

Returns
-------
None
") Weights;
		void Weights(TColStd_Array1OfReal & W);

		/****************** Weights ******************/
		%feature("compactdefaultargs") Weights;
		%feature("autodoc", "Returns the weights of the b-spline curve;.

Returns
-------
TColStd_Array1OfReal *
") Weights;
		const TColStd_Array1OfReal * Weights();

};


%make_alias(Geom_BSplineCurve)

%extend Geom_BSplineCurve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************
* class Geom_BSplineSurface *
****************************/
class Geom_BSplineSurface : public Geom_BoundedSurface {
	public:
		/****************** Geom_BSplineSurface ******************/
		%feature("compactdefaultargs") Geom_BSplineSurface;
		%feature("autodoc", "Creates a non-rational b-spline surface (weights default value is 1.). the following conditions must be verified. 0 < udegree <= maxdegree. uknots.length() == umults.length() >= 2 uknots(i) < uknots(i+1) (knots are increasing) 1 <= umults(i) <= udegree on a non uperiodic surface the first and last umultiplicities may be udegree+1 (this is even recommanded if you want the curve to start and finish on the first and last pole). on a uperiodic surface the first and the last umultiplicities must be the same. on non-uperiodic surfaces poles.collength() == sum(umults(i)) - udegree - 1 >= 2 on uperiodic surfaces poles.collength() == sum(umults(i)) except the first or last the previous conditions for u holds also for v, with the rowlength of the poles.

Parameters
----------
Poles: TColgp_Array2OfPnt
UKnots: TColStd_Array1OfReal
VKnots: TColStd_Array1OfReal
UMults: TColStd_Array1OfInteger
VMults: TColStd_Array1OfInteger
UDegree: int
VDegree: int
UPeriodic: bool,optional
	default value is Standard_False
VPeriodic: bool,optional
	default value is Standard_False

Returns
-------
None
") Geom_BSplineSurface;
		 Geom_BSplineSurface(const TColgp_Array2OfPnt & Poles, const TColStd_Array1OfReal & UKnots, const TColStd_Array1OfReal & VKnots, const TColStd_Array1OfInteger & UMults, const TColStd_Array1OfInteger & VMults, const Standard_Integer UDegree, const Standard_Integer VDegree, const Standard_Boolean UPeriodic = Standard_False, const Standard_Boolean VPeriodic = Standard_False);

		/****************** Geom_BSplineSurface ******************/
		%feature("compactdefaultargs") Geom_BSplineSurface;
		%feature("autodoc", "Creates a non-rational b-spline surface (weights default value is 1.). //! the following conditions must be verified. 0 < udegree <= maxdegree. //! uknots.length() == umults.length() >= 2 //! uknots(i) < uknots(i+1) (knots are increasing) 1 <= umults(i) <= udegree //! on a non uperiodic surface the first and last umultiplicities may be udegree+1 (this is even recommanded if you want the curve to start and finish on the first and last pole). //! on a uperiodic surface the first and the last umultiplicities must be the same. //! on non-uperiodic surfaces //! poles.collength() == sum(umults(i)) - udegree - 1 >= 2 //! on uperiodic surfaces //! poles.collength() == sum(umults(i)) except the first or last //! the previous conditions for u holds also for v, with the rowlength of the poles.

Parameters
----------
Poles: TColgp_Array2OfPnt
Weights: TColStd_Array2OfReal
UKnots: TColStd_Array1OfReal
VKnots: TColStd_Array1OfReal
UMults: TColStd_Array1OfInteger
VMults: TColStd_Array1OfInteger
UDegree: int
VDegree: int
UPeriodic: bool,optional
	default value is Standard_False
VPeriodic: bool,optional
	default value is Standard_False

Returns
-------
None
") Geom_BSplineSurface;
		 Geom_BSplineSurface(const TColgp_Array2OfPnt & Poles, const TColStd_Array2OfReal & Weights, const TColStd_Array1OfReal & UKnots, const TColStd_Array1OfReal & VKnots, const TColStd_Array1OfInteger & UMults, const TColStd_Array1OfInteger & VMults, const Standard_Integer UDegree, const Standard_Integer VDegree, const Standard_Boolean UPeriodic = Standard_False, const Standard_Boolean VPeriodic = Standard_False);

		/****************** Bounds ******************/
		%feature("compactdefaultargs") Bounds;
		%feature("autodoc", "Returns the parametric bounds of the surface. warnings : these parametric values are the bounds of the array of knots uknots and vknots only if the first knots and the last knots have a multiplicity equal to udegree + 1 or vdegree + 1.

Parameters
----------

Returns
-------
U1: float
U2: float
V1: float
V2: float
") Bounds;
		void Bounds(Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** CheckAndSegment ******************/
		%feature("compactdefaultargs") CheckAndSegment;
		%feature("autodoc", "Segments the surface between u1 and u2 in the u-direction. between v1 and v2 in the v-direction. //! same as segment but do nothing if u1 and u2 (resp. v1 and v2) are equal to the bounds in u (resp. in v) of <self>. for example, if <self> is periodic in v, it will be always periodic in v after the segmentation if the bounds in v are unchanged //! parameters theutolerance, thevtolerance define the possible proximity along the correponding direction of the segment boundaries and b-spline knots to treat them as equal. //! warnings : even if <self> is not closed it can become closed after the segmentation for example if u1 or u2 are out of the bounds of the surface <self> or if the surface makes loop. raises if u2 < u1 or v2 < v1. standard_domainerror if u2 - u1 exceeds the uperiod for uperiodic surfaces. i.e. ((u2 - u1) - uperiod) > precision::pconfusion(). standard_domainerror if v2 - v1 exceeds the vperiod for vperiodic surfaces. i.e. ((v2 - v1) - vperiod) > precision::pconfusion()).

Parameters
----------
U1: float
U2: float
V1: float
V2: float
theUTolerance: float,optional
	default value is Precision::PConfusion()
theVTolerance: float,optional
	default value is Precision::PConfusion()

Returns
-------
None
") CheckAndSegment;
		void CheckAndSegment(const Standard_Real U1, const Standard_Real U2, const Standard_Real V1, const Standard_Real V2, const Standard_Real theUTolerance = Precision::PConfusion(), const Standard_Real theVTolerance = Precision::PConfusion());

		/****************** Continuity ******************/
		%feature("compactdefaultargs") Continuity;
		%feature("autodoc", "Returns the continuity of the surface : c0 : only geometric continuity, c1 : continuity of the first derivative all along the surface, c2 : continuity of the second derivative all along the surface, c3 : continuity of the third derivative all along the surface, cn : the order of continuity is infinite. a b-spline surface is infinitely continuously differentiable for the couple of parameters u, v such thats u != uknots(i) and v != vknots(i). the continuity of the surface at a knot value depends on the multiplicity of this knot. example : if the surface is c1 in the v direction and c2 in the u direction this function returns shape = c1.

Returns
-------
GeomAbs_Shape
") Continuity;
		GeomAbs_Shape Continuity();

		/****************** Copy ******************/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "Creates a new object which is a copy of this bspline surface.

Returns
-------
opencascade::handle<Geom_Geometry>
") Copy;
		opencascade::handle<Geom_Geometry> Copy();

		/****************** D0 ******************/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "No available documentation.

Parameters
----------
U: float
V: float
P: gp_Pnt

Returns
-------
None
") D0;
		void D0(const Standard_Real U, const Standard_Real V, gp_Pnt & P);

		/****************** D1 ******************/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "Raised if the continuity of the surface is not c1.

Parameters
----------
U: float
V: float
P: gp_Pnt
D1U: gp_Vec
D1V: gp_Vec

Returns
-------
None
") D1;
		void D1(const Standard_Real U, const Standard_Real V, gp_Pnt & P, gp_Vec & D1U, gp_Vec & D1V);

		/****************** D2 ******************/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "Raised if the continuity of the surface is not c2.

Parameters
----------
U: float
V: float
P: gp_Pnt
D1U: gp_Vec
D1V: gp_Vec
D2U: gp_Vec
D2V: gp_Vec
D2UV: gp_Vec

Returns
-------
None
") D2;
		void D2(const Standard_Real U, const Standard_Real V, gp_Pnt & P, gp_Vec & D1U, gp_Vec & D1V, gp_Vec & D2U, gp_Vec & D2V, gp_Vec & D2UV);

		/****************** D3 ******************/
		%feature("compactdefaultargs") D3;
		%feature("autodoc", "Raised if the continuity of the surface is not c3.

Parameters
----------
U: float
V: float
P: gp_Pnt
D1U: gp_Vec
D1V: gp_Vec
D2U: gp_Vec
D2V: gp_Vec
D2UV: gp_Vec
D3U: gp_Vec
D3V: gp_Vec
D3UUV: gp_Vec
D3UVV: gp_Vec

Returns
-------
None
") D3;
		void D3(const Standard_Real U, const Standard_Real V, gp_Pnt & P, gp_Vec & D1U, gp_Vec & D1V, gp_Vec & D2U, gp_Vec & D2V, gp_Vec & D2UV, gp_Vec & D3U, gp_Vec & D3V, gp_Vec & D3UUV, gp_Vec & D3UVV);

		/****************** DN ******************/
		%feature("compactdefaultargs") DN;
		%feature("autodoc", "Nu is the order of derivation in the u parametric direction and nv is the order of derivation in the v parametric direction. //! raised if the continuity of the surface is not cnu in the u direction and cnv in the v direction. //! raised if nu + nv < 1 or nu < 0 or nv < 0. //! the following functions computes the point for the parametric values (u, v) and the derivatives at this point on the b-spline surface patch delimited with the knots fromuk1, fromvk1 and the knots touk2, tovk2. (u, v) can be out of these parametric bounds but for the computation we only use the definition of the surface between these knots. this method is useful to compute local derivative, if the order of continuity of the whole surface is not greater enough. inside the parametric knot's domain previously defined the evaluations are the same as if we consider the whole definition of the surface. of course the evaluations are different outside this parametric domain.

Parameters
----------
U: float
V: float
Nu: int
Nv: int

Returns
-------
gp_Vec
") DN;
		gp_Vec DN(const Standard_Real U, const Standard_Real V, const Standard_Integer Nu, const Standard_Integer Nv);

		/****************** ExchangeUV ******************/
		%feature("compactdefaultargs") ExchangeUV;
		%feature("autodoc", "Exchanges the u and v parametric directions on this bspline surface. as a consequence: - the poles and weights tables are transposed, - the knots and multiplicities tables are exchanged, - degrees of continuity, and rational, periodic and uniform characteristics are exchanged, and - the orientation of the surface is inverted.

Returns
-------
None
") ExchangeUV;
		void ExchangeUV();

		/****************** FirstUKnotIndex ******************/
		%feature("compactdefaultargs") FirstUKnotIndex;
		%feature("autodoc", "Computes the index of the uknots which gives the first parametric value of the surface in the u direction. the uiso curve corresponding to this value is a boundary curve of the surface.

Returns
-------
int
") FirstUKnotIndex;
		Standard_Integer FirstUKnotIndex();

		/****************** FirstVKnotIndex ******************/
		%feature("compactdefaultargs") FirstVKnotIndex;
		%feature("autodoc", "Computes the index of the vknots which gives the first parametric value of the surface in the v direction. the viso curve corresponding to this knot is a boundary curve of the surface.

Returns
-------
int
") FirstVKnotIndex;
		Standard_Integer FirstVKnotIndex();

		/****************** IncreaseDegree ******************/
		%feature("compactdefaultargs") IncreaseDegree;
		%feature("autodoc", "Increases the degrees of this bspline surface to udegree and vdegree in the u and v parametric directions respectively. as a result, the tables of poles, weights and multiplicities are modified. the tables of knots is not changed. note: nothing is done if the given degree is less than or equal to the current degree in the corresponding parametric direction. exceptions standard_constructionerror if udegree or vdegree is greater than geom_bsplinesurface::maxdegree().

Parameters
----------
UDegree: int
VDegree: int

Returns
-------
None
") IncreaseDegree;
		void IncreaseDegree(const Standard_Integer UDegree, const Standard_Integer VDegree);

		/****************** IncreaseUMultiplicity ******************/
		%feature("compactdefaultargs") IncreaseUMultiplicity;
		%feature("autodoc", "Increases the multiplicity of the knot of range uindex in the uknots sequence. m is the new multiplicity. m must be greater than the previous multiplicity and lower or equal to the degree of the surface in the u parametric direction. raised if m is not in the range [1, udegree] //! raised if uindex is not in the range [firstuknotindex, lastuknotindex] given by the methods with the same name.

Parameters
----------
UIndex: int
M: int

Returns
-------
None
") IncreaseUMultiplicity;
		void IncreaseUMultiplicity(const Standard_Integer UIndex, const Standard_Integer M);

		/****************** IncreaseUMultiplicity ******************/
		%feature("compactdefaultargs") IncreaseUMultiplicity;
		%feature("autodoc", "Increases until order m the multiplicity of the set of knots fromi1,...., toi2 in the u direction. this method can be used to make a b_spline surface into a piecewisebezier b_spline surface. if <self> was uniform, it can become non uniform. //! raised if fromi1 or toi2 is out of the range [firstuknotindex, lastuknotindex]. //! m should be greater than the previous multiplicity of the all the knots fromi1,..., toi2 and lower or equal to the degree of the surface in the u parametric direction.

Parameters
----------
FromI1: int
ToI2: int
M: int

Returns
-------
None
") IncreaseUMultiplicity;
		void IncreaseUMultiplicity(const Standard_Integer FromI1, const Standard_Integer ToI2, const Standard_Integer M);

		/****************** IncreaseVMultiplicity ******************/
		%feature("compactdefaultargs") IncreaseVMultiplicity;
		%feature("autodoc", "Increases the multiplicity of a knot in the v direction. m is the new multiplicity. //! m should be greater than the previous multiplicity and lower than the degree of the surface in the v parametric direction. //! raised if vindex is not in the range [firstvknotindex, lastvknotindex] given by the methods with the same name.

Parameters
----------
VIndex: int
M: int

Returns
-------
None
") IncreaseVMultiplicity;
		void IncreaseVMultiplicity(const Standard_Integer VIndex, const Standard_Integer M);

		/****************** IncreaseVMultiplicity ******************/
		%feature("compactdefaultargs") IncreaseVMultiplicity;
		%feature("autodoc", "Increases until order m the multiplicity of the set of knots fromi1,...., toi2 in the v direction. this method can be used to make a bsplinesurface into a piecewisebezier b_spline surface. if <self> was uniform, it can become non-uniform. //! raised if fromi1 or toi2 is out of the range [firstvknotindex, lastvknotindex] given by the methods with the same name. //! m should be greater than the previous multiplicity of the all the knots fromi1,..., toi2 and lower or equal to the degree of the surface in the v parametric direction.

Parameters
----------
FromI1: int
ToI2: int
M: int

Returns
-------
None
") IncreaseVMultiplicity;
		void IncreaseVMultiplicity(const Standard_Integer FromI1, const Standard_Integer ToI2, const Standard_Integer M);

		/****************** IncrementUMultiplicity ******************/
		%feature("compactdefaultargs") IncrementUMultiplicity;
		%feature("autodoc", "Increments the multiplicity of the consecutives uknots fromi1..toi2 by step. the multiplicity of each knot fromi1,.....,toi2 must be lower or equal to the udegree of the b_spline. //! raised if fromi1 or toi2 is not in the range [firstuknotindex, lastuknotindex] //! raised if one knot has a multiplicity greater than udegree.

Parameters
----------
FromI1: int
ToI2: int
Step: int

Returns
-------
None
") IncrementUMultiplicity;
		void IncrementUMultiplicity(const Standard_Integer FromI1, const Standard_Integer ToI2, const Standard_Integer Step);

		/****************** IncrementVMultiplicity ******************/
		%feature("compactdefaultargs") IncrementVMultiplicity;
		%feature("autodoc", "Increments the multiplicity of the consecutives vknots fromi1..toi2 by step. the multiplicity of each knot fromi1,.....,toi2 must be lower or equal to the vdegree of the b_spline. //! raised if fromi1 or toi2 is not in the range [firstvknotindex, lastvknotindex] //! raised if one knot has a multiplicity greater than vdegree.

Parameters
----------
FromI1: int
ToI2: int
Step: int

Returns
-------
None
") IncrementVMultiplicity;
		void IncrementVMultiplicity(const Standard_Integer FromI1, const Standard_Integer ToI2, const Standard_Integer Step);

		/****************** InsertUKnot ******************/
		%feature("compactdefaultargs") InsertUKnot;
		%feature("autodoc", "Inserts a knot value in the sequence of uknots. if u is a knot value this method increases the multiplicity of the knot if the previous multiplicity was lower than m else it does nothing. the tolerance criterion is parametrictolerance. parametrictolerance should be greater or equal than resolution from package gp. //! raised if u is out of the bounds [u1, u2] given by the methods bounds, the criterion parametrictolerance is used. raised if m is not in the range [1, udegree].

Parameters
----------
U: float
M: int
ParametricTolerance: float
Add: bool,optional
	default value is Standard_True

Returns
-------
None
") InsertUKnot;
		void InsertUKnot(const Standard_Real U, const Standard_Integer M, const Standard_Real ParametricTolerance, const Standard_Boolean Add = Standard_True);

		/****************** InsertUKnots ******************/
		%feature("compactdefaultargs") InsertUKnots;
		%feature("autodoc", "Inserts into the knots table for the u parametric direction of this bspline surface: - the values of the array knots, with their respective multiplicities, mults. if the knot value to insert already exists in the table, its multiplicity is: - increased by m, if add is true (the default), or - increased to m, if add is false. the tolerance criterion used to check the equality of the knots is the larger of the values parametrictolerance and standard_real::epsilon(val), where val is the knot value to be inserted. warning - if a given multiplicity coefficient is null, or negative, nothing is done. - the new multiplicity of a knot is limited to the degree of this bspline surface in the corresponding parametric direction. exceptions standard_constructionerror if a knot value to insert is outside the bounds of this bspline surface in the specified parametric direction. the comparison uses the precision criterion parametrictolerance.

Parameters
----------
Knots: TColStd_Array1OfReal
Mults: TColStd_Array1OfInteger
ParametricTolerance: float,optional
	default value is 0.0
Add: bool,optional
	default value is Standard_True

Returns
-------
None
") InsertUKnots;
		void InsertUKnots(const TColStd_Array1OfReal & Knots, const TColStd_Array1OfInteger & Mults, const Standard_Real ParametricTolerance = 0.0, const Standard_Boolean Add = Standard_True);

		/****************** InsertVKnot ******************/
		%feature("compactdefaultargs") InsertVKnot;
		%feature("autodoc", "Inserts a knot value in the sequence of vknots. if v is a knot value this method increases the multiplicity of the knot if the previous multiplicity was lower than m otherwise it does nothing. the tolerance criterion is parametrictolerance. parametrictolerance should be greater or equal than resolution from package gp. //! raises if v is out of the bounds [v1, v2] given by the methods bounds, the criterion parametrictolerance is used. raises if m is not in the range [1, vdegree].

Parameters
----------
V: float
M: int
ParametricTolerance: float
Add: bool,optional
	default value is Standard_True

Returns
-------
None
") InsertVKnot;
		void InsertVKnot(const Standard_Real V, const Standard_Integer M, const Standard_Real ParametricTolerance, const Standard_Boolean Add = Standard_True);

		/****************** InsertVKnots ******************/
		%feature("compactdefaultargs") InsertVKnots;
		%feature("autodoc", "Inserts into the knots table for the v parametric direction of this bspline surface: - the values of the array knots, with their respective multiplicities, mults. if the knot value to insert already exists in the table, its multiplicity is: - increased by m, if add is true (the default), or - increased to m, if add is false. the tolerance criterion used to check the equality of the knots is the larger of the values parametrictolerance and standard_real::epsilon(val), where val is the knot value to be inserted. warning - if a given multiplicity coefficient is null, or negative, nothing is done. - the new multiplicity of a knot is limited to the degree of this bspline surface in the corresponding parametric direction. exceptions standard_constructionerror if a knot value to insert is outside the bounds of this bspline surface in the specified parametric direction. the comparison uses the precision criterion parametrictolerance.

Parameters
----------
Knots: TColStd_Array1OfReal
Mults: TColStd_Array1OfInteger
ParametricTolerance: float,optional
	default value is 0.0
Add: bool,optional
	default value is Standard_True

Returns
-------
None
") InsertVKnots;
		void InsertVKnots(const TColStd_Array1OfReal & Knots, const TColStd_Array1OfInteger & Mults, const Standard_Real ParametricTolerance = 0.0, const Standard_Boolean Add = Standard_True);

		/****************** IsCNu ******************/
		%feature("compactdefaultargs") IsCNu;
		%feature("autodoc", "Returns true if the order of continuity of the surface in the u direction is n. raised if n < 0.

Parameters
----------
N: int

Returns
-------
bool
") IsCNu;
		Standard_Boolean IsCNu(const Standard_Integer N);

		/****************** IsCNv ******************/
		%feature("compactdefaultargs") IsCNv;
		%feature("autodoc", "Returns true if the order of continuity of the surface in the v direction is n. raised if n < 0.

Parameters
----------
N: int

Returns
-------
bool
") IsCNv;
		Standard_Boolean IsCNv(const Standard_Integer N);

		/****************** IsUClosed ******************/
		%feature("compactdefaultargs") IsUClosed;
		%feature("autodoc", "Returns true if the first control points row and the last control points row are identical. the tolerance criterion is resolution from package gp.

Returns
-------
bool
") IsUClosed;
		Standard_Boolean IsUClosed();

		/****************** IsUPeriodic ******************/
		%feature("compactdefaultargs") IsUPeriodic;
		%feature("autodoc", "Returns true if the surface is closed in the u direction and if the b-spline has been turned into a periodic surface using the function setuperiodic.

Returns
-------
bool
") IsUPeriodic;
		Standard_Boolean IsUPeriodic();

		/****************** IsURational ******************/
		%feature("compactdefaultargs") IsURational;
		%feature("autodoc", "Returns false if for each row of weights all the weights are identical. the tolerance criterion is resolution from package gp. example : |1.0, 1.0, 1.0| if weights = |0.5, 0.5, 0.5| returns false |2.0, 2.0, 2.0|.

Returns
-------
bool
") IsURational;
		Standard_Boolean IsURational();

		/****************** IsVClosed ******************/
		%feature("compactdefaultargs") IsVClosed;
		%feature("autodoc", "Returns true if the first control points column and the last last control points column are identical. the tolerance criterion is resolution from package gp.

Returns
-------
bool
") IsVClosed;
		Standard_Boolean IsVClosed();

		/****************** IsVPeriodic ******************/
		%feature("compactdefaultargs") IsVPeriodic;
		%feature("autodoc", "Returns true if the surface is closed in the v direction and if the b-spline has been turned into a periodic surface using the function setvperiodic.

Returns
-------
bool
") IsVPeriodic;
		Standard_Boolean IsVPeriodic();

		/****************** IsVRational ******************/
		%feature("compactdefaultargs") IsVRational;
		%feature("autodoc", "Returns false if for each column of weights all the weights are identical. the tolerance criterion is resolution from package gp. examples : |1.0, 2.0, 0.5| if weights = |1.0, 2.0, 0.5| returns false |1.0, 2.0, 0.5|.

Returns
-------
bool
") IsVRational;
		Standard_Boolean IsVRational();

		/****************** LastUKnotIndex ******************/
		%feature("compactdefaultargs") LastUKnotIndex;
		%feature("autodoc", "Computes the index of the uknots which gives the last parametric value of the surface in the u direction. the uiso curve corresponding to this knot is a boundary curve of the surface.

Returns
-------
int
") LastUKnotIndex;
		Standard_Integer LastUKnotIndex();

		/****************** LastVKnotIndex ******************/
		%feature("compactdefaultargs") LastVKnotIndex;
		%feature("autodoc", "Computes the index of the vknots which gives the last parametric value of the surface in the v direction. the viso curve corresponding to this knot is a boundary curve of the surface.

Returns
-------
int
") LastVKnotIndex;
		Standard_Integer LastVKnotIndex();

		/****************** LocalD0 ******************/
		%feature("compactdefaultargs") LocalD0;
		%feature("autodoc", "Raised if fromuk1 = touk2 or fromvk1 = tovk2.

Parameters
----------
U: float
V: float
FromUK1: int
ToUK2: int
FromVK1: int
ToVK2: int
P: gp_Pnt

Returns
-------
None
") LocalD0;
		void LocalD0(const Standard_Real U, const Standard_Real V, const Standard_Integer FromUK1, const Standard_Integer ToUK2, const Standard_Integer FromVK1, const Standard_Integer ToVK2, gp_Pnt & P);

		/****************** LocalD1 ******************/
		%feature("compactdefaultargs") LocalD1;
		%feature("autodoc", "Raised if the local continuity of the surface is not c1 between the knots fromuk1, touk2 and fromvk1, tovk2. raised if fromuk1 = touk2 or fromvk1 = tovk2.

Parameters
----------
U: float
V: float
FromUK1: int
ToUK2: int
FromVK1: int
ToVK2: int
P: gp_Pnt
D1U: gp_Vec
D1V: gp_Vec

Returns
-------
None
") LocalD1;
		void LocalD1(const Standard_Real U, const Standard_Real V, const Standard_Integer FromUK1, const Standard_Integer ToUK2, const Standard_Integer FromVK1, const Standard_Integer ToVK2, gp_Pnt & P, gp_Vec & D1U, gp_Vec & D1V);

		/****************** LocalD2 ******************/
		%feature("compactdefaultargs") LocalD2;
		%feature("autodoc", "Raised if the local continuity of the surface is not c2 between the knots fromuk1, touk2 and fromvk1, tovk2. raised if fromuk1 = touk2 or fromvk1 = tovk2.

Parameters
----------
U: float
V: float
FromUK1: int
ToUK2: int
FromVK1: int
ToVK2: int
P: gp_Pnt
D1U: gp_Vec
D1V: gp_Vec
D2U: gp_Vec
D2V: gp_Vec
D2UV: gp_Vec

Returns
-------
None
") LocalD2;
		void LocalD2(const Standard_Real U, const Standard_Real V, const Standard_Integer FromUK1, const Standard_Integer ToUK2, const Standard_Integer FromVK1, const Standard_Integer ToVK2, gp_Pnt & P, gp_Vec & D1U, gp_Vec & D1V, gp_Vec & D2U, gp_Vec & D2V, gp_Vec & D2UV);

		/****************** LocalD3 ******************/
		%feature("compactdefaultargs") LocalD3;
		%feature("autodoc", "Raised if the local continuity of the surface is not c3 between the knots fromuk1, touk2 and fromvk1, tovk2. raised if fromuk1 = touk2 or fromvk1 = tovk2.

Parameters
----------
U: float
V: float
FromUK1: int
ToUK2: int
FromVK1: int
ToVK2: int
P: gp_Pnt
D1U: gp_Vec
D1V: gp_Vec
D2U: gp_Vec
D2V: gp_Vec
D2UV: gp_Vec
D3U: gp_Vec
D3V: gp_Vec
D3UUV: gp_Vec
D3UVV: gp_Vec

Returns
-------
None
") LocalD3;
		void LocalD3(const Standard_Real U, const Standard_Real V, const Standard_Integer FromUK1, const Standard_Integer ToUK2, const Standard_Integer FromVK1, const Standard_Integer ToVK2, gp_Pnt & P, gp_Vec & D1U, gp_Vec & D1V, gp_Vec & D2U, gp_Vec & D2V, gp_Vec & D2UV, gp_Vec & D3U, gp_Vec & D3V, gp_Vec & D3UUV, gp_Vec & D3UVV);

		/****************** LocalDN ******************/
		%feature("compactdefaultargs") LocalDN;
		%feature("autodoc", "Raised if the local continuity of the surface is not cnu between the knots fromuk1, touk2 and cnv between the knots fromvk1, tovk2. raised if fromuk1 = touk2 or fromvk1 = tovk2.

Parameters
----------
U: float
V: float
FromUK1: int
ToUK2: int
FromVK1: int
ToVK2: int
Nu: int
Nv: int

Returns
-------
gp_Vec
") LocalDN;
		gp_Vec LocalDN(const Standard_Real U, const Standard_Real V, const Standard_Integer FromUK1, const Standard_Integer ToUK2, const Standard_Integer FromVK1, const Standard_Integer ToVK2, const Standard_Integer Nu, const Standard_Integer Nv);

		/****************** LocalValue ******************/
		%feature("compactdefaultargs") LocalValue;
		%feature("autodoc", "Computes the point of parameter u, v on the bspline surface patch defines between the knots uk1 uk2, vk1, vk2. u can be out of the bounds [knot uk1, knot uk2] and v can be outof the bounds [knot vk1, knot vk2] but for the computation we only use the definition of the surface between these knot values. raises if fromuk1 = touk2 or fromvk1 = tovk2.

Parameters
----------
U: float
V: float
FromUK1: int
ToUK2: int
FromVK1: int
ToVK2: int

Returns
-------
gp_Pnt
") LocalValue;
		gp_Pnt LocalValue(const Standard_Real U, const Standard_Real V, const Standard_Integer FromUK1, const Standard_Integer ToUK2, const Standard_Integer FromVK1, const Standard_Integer ToVK2);

		/****************** LocateU ******************/
		%feature("compactdefaultargs") LocateU;
		%feature("autodoc", "Locates the parametric value u in the sequence of uknots. if 'withknotrepetition' is true we consider the knot's representation with repetition of multiple knot value, otherwise we consider the knot's representation with no repetition of multiple knot values. uknots (i1) <= u <= uknots (i2) . if i1 = i2 u is a knot value (the tolerance criterion parametrictolerance is used). . if i1 < 1 => u < uknots(1) - abs(parametrictolerance) . if i2 > nbuknots => u > uknots(nbuknots)+abs(parametrictolerance).

Parameters
----------
U: float
ParametricTolerance: float
WithKnotRepetition: bool,optional
	default value is Standard_False

Returns
-------
I1: int
I2: int
") LocateU;
		void LocateU(const Standard_Real U, const Standard_Real ParametricTolerance, Standard_Integer &OutValue, Standard_Integer &OutValue, const Standard_Boolean WithKnotRepetition = Standard_False);

		/****************** LocateV ******************/
		%feature("compactdefaultargs") LocateV;
		%feature("autodoc", "Locates the parametric value v in the sequence of knots. if 'withknotrepetition' is true we consider the knot's representation with repetition of multiple knot value, otherwise we consider the knot's representation with no repetition of multiple knot values. vknots (i1) <= v <= vknots (i2) . if i1 = i2 v is a knot value (the tolerance criterion parametrictolerance is used). . if i1 < 1 => v < vknots(1) - abs(parametrictolerance) . if i2 > nbvknots => v > vknots(nbvknots)+abs(parametrictolerance) poles insertion and removing the following methods are available only if the surface is uniform or quasiuniform in the considered direction the knot repartition is modified.

Parameters
----------
V: float
ParametricTolerance: float
WithKnotRepetition: bool,optional
	default value is Standard_False

Returns
-------
I1: int
I2: int
") LocateV;
		void LocateV(const Standard_Real V, const Standard_Real ParametricTolerance, Standard_Integer &OutValue, Standard_Integer &OutValue, const Standard_Boolean WithKnotRepetition = Standard_False);

		/****************** MaxDegree ******************/
		%feature("compactdefaultargs") MaxDegree;
		%feature("autodoc", "Returns the value of the maximum degree of the normalized b-spline basis functions in the u and v directions.

Returns
-------
int
") MaxDegree;
		static Standard_Integer MaxDegree();

		/****************** MovePoint ******************/
		%feature("compactdefaultargs") MovePoint;
		%feature("autodoc", "Move a point with parameter u and v to p. given u,v as parameters) to reach a new position uindex1, uindex2, vindex1, vindex2: indicates the poles which can be moved if problem in bsplinebasis calculation, no change for the curve and ufirstindex, vlastindex = 0 vfirstindex, vlastindex = 0 //! raised if uindex1 < uindex2 or vindex1 < vindex2 or uindex1 < 1 || uindex1 > nbupoles or uindex2 < 1 || uindex2 > nbupoles vindex1 < 1 || vindex1 > nbvpoles or vindex2 < 1 || vindex2 > nbvpoles characteristics of the surface.

Parameters
----------
U: float
V: float
P: gp_Pnt
UIndex1: int
UIndex2: int
VIndex1: int
VIndex2: int

Returns
-------
UFirstIndex: int
ULastIndex: int
VFirstIndex: int
VLastIndex: int
") MovePoint;
		void MovePoint(const Standard_Real U, const Standard_Real V, const gp_Pnt & P, const Standard_Integer UIndex1, const Standard_Integer UIndex2, const Standard_Integer VIndex1, const Standard_Integer VIndex2, Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue);

		/****************** NbUKnots ******************/
		%feature("compactdefaultargs") NbUKnots;
		%feature("autodoc", "Returns the number of knots in the u direction.

Returns
-------
int
") NbUKnots;
		Standard_Integer NbUKnots();

		/****************** NbUPoles ******************/
		%feature("compactdefaultargs") NbUPoles;
		%feature("autodoc", "Returns number of poles in the u direction.

Returns
-------
int
") NbUPoles;
		Standard_Integer NbUPoles();

		/****************** NbVKnots ******************/
		%feature("compactdefaultargs") NbVKnots;
		%feature("autodoc", "Returns the number of knots in the v direction.

Returns
-------
int
") NbVKnots;
		Standard_Integer NbVKnots();

		/****************** NbVPoles ******************/
		%feature("compactdefaultargs") NbVPoles;
		%feature("autodoc", "Returns the number of poles in the v direction.

Returns
-------
int
") NbVPoles;
		Standard_Integer NbVPoles();

		/****************** PeriodicNormalization ******************/
		%feature("compactdefaultargs") PeriodicNormalization;
		%feature("autodoc", "Returns the parameter normalized within the period if the surface is periodic : otherwise does not do anything.

Parameters
----------

Returns
-------
U: float
V: float
") PeriodicNormalization;
		void PeriodicNormalization(Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** Pole ******************/
		%feature("compactdefaultargs") Pole;
		%feature("autodoc", "Returns the pole of range (uindex, vindex). //! raised if uindex < 1 or uindex > nbupoles or vindex < 1 or vindex > nbvpoles.

Parameters
----------
UIndex: int
VIndex: int

Returns
-------
gp_Pnt
") Pole;
		const gp_Pnt Pole(const Standard_Integer UIndex, const Standard_Integer VIndex);

		/****************** Poles ******************/
		%feature("compactdefaultargs") Poles;
		%feature("autodoc", "Returns the poles of the b-spline surface. //! raised if the length of p in the u and v direction is not equal to nbupoles and nbvpoles.

Parameters
----------
P: TColgp_Array2OfPnt

Returns
-------
None
") Poles;
		void Poles(TColgp_Array2OfPnt & P);

		/****************** Poles ******************/
		%feature("compactdefaultargs") Poles;
		%feature("autodoc", "Returns the poles of the b-spline surface.

Returns
-------
TColgp_Array2OfPnt
") Poles;
		const TColgp_Array2OfPnt & Poles();

		/****************** RemoveUKnot ******************/
		%feature("compactdefaultargs") RemoveUKnot;
		%feature("autodoc", "Reduces to m the multiplicity of the knot of index index in the u parametric direction. if m is 0, the knot is removed. with a modification of this type, the table of poles is also modified. two different algorithms are used systematically to compute the new poles of the surface. for each pole, the distance between the pole calculated using the first algorithm and the same pole calculated using the second algorithm, is checked. if this distance is less than tolerance it ensures that the surface is not modified by more than tolerance. under these conditions, the function returns true; otherwise, it returns false. a low tolerance prevents modification of the surface. a high tolerance 'smoothes' the surface. exceptions standard_outofrange if index is outside the bounds of the knots table of this bspline surface.

Parameters
----------
Index: int
M: int
Tolerance: float

Returns
-------
bool
") RemoveUKnot;
		Standard_Boolean RemoveUKnot(const Standard_Integer Index, const Standard_Integer M, const Standard_Real Tolerance);

		/****************** RemoveVKnot ******************/
		%feature("compactdefaultargs") RemoveVKnot;
		%feature("autodoc", "Reduces to m the multiplicity of the knot of index index in the v parametric direction. if m is 0, the knot is removed. with a modification of this type, the table of poles is also modified. two different algorithms are used systematically to compute the new poles of the surface. for each pole, the distance between the pole calculated using the first algorithm and the same pole calculated using the second algorithm, is checked. if this distance is less than tolerance it ensures that the surface is not modified by more than tolerance. under these conditions, the function returns true; otherwise, it returns false. a low tolerance prevents modification of the surface. a high tolerance 'smoothes' the surface. exceptions standard_outofrange if index is outside the bounds of the knots table of this bspline surface.

Parameters
----------
Index: int
M: int
Tolerance: float

Returns
-------
bool
") RemoveVKnot;
		Standard_Boolean RemoveVKnot(const Standard_Integer Index, const Standard_Integer M, const Standard_Real Tolerance);

		/****************** Resolution ******************/
		%feature("compactdefaultargs") Resolution;
		%feature("autodoc", "Computes two tolerance values for this bspline surface, based on the given tolerance in 3d space tolerance3d. the tolerances computed are: - utolerance in the u parametric direction, and - vtolerance in the v parametric direction. if f(u,v) is the equation of this bspline surface, utolerance and vtolerance guarantee that : | u1 - u0 | < utolerance and | v1 - v0 | < vtolerance ====> |f (u1,v1) - f (u0,v0)| < tolerance3d.

Parameters
----------
Tolerance3D: float

Returns
-------
UTolerance: float
VTolerance: float
") Resolution;
		void Resolution(const Standard_Real Tolerance3D, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** Segment ******************/
		%feature("compactdefaultargs") Segment;
		%feature("autodoc", "Segments the surface between u1 and u2 in the u-direction. between v1 and v2 in the v-direction. the control points are modified, the first and the last point are not the same. //! parameters theutolerance, thevtolerance define the possible proximity along the correponding direction of the segment boundaries and b-spline knots to treat them as equal. //! warnings : even if <self> is not closed it can become closed after the segmentation for example if u1 or u2 are out of the bounds of the surface <self> or if the surface makes loop. raises if u2 < u1 or v2 < v1. standard_domainerror if u2 - u1 exceeds the uperiod for uperiodic surfaces. i.e. ((u2 - u1) - uperiod) > precision::pconfusion(). standard_domainerror if v2 - v1 exceeds the vperiod for vperiodic surfaces. i.e. ((v2 - v1) - vperiod) > precision::pconfusion()).

Parameters
----------
U1: float
U2: float
V1: float
V2: float
theUTolerance: float,optional
	default value is Precision::PConfusion()
theVTolerance: float,optional
	default value is Precision::PConfusion()

Returns
-------
None
") Segment;
		void Segment(const Standard_Real U1, const Standard_Real U2, const Standard_Real V1, const Standard_Real V2, const Standard_Real theUTolerance = Precision::PConfusion(), const Standard_Real theVTolerance = Precision::PConfusion());

		/****************** SetPole ******************/
		%feature("compactdefaultargs") SetPole;
		%feature("autodoc", "Substitutes the pole of range (uindex, vindex) with p. if the surface is rational the weight of range (uindex, vindex) is not modified. //! raised if uindex < 1 or uindex > nbupoles or vindex < 1 or vindex > nbvpoles.

Parameters
----------
UIndex: int
VIndex: int
P: gp_Pnt

Returns
-------
None
") SetPole;
		void SetPole(const Standard_Integer UIndex, const Standard_Integer VIndex, const gp_Pnt & P);

		/****************** SetPole ******************/
		%feature("compactdefaultargs") SetPole;
		%feature("autodoc", "Substitutes the pole and the weight of range (uindex, vindex) with p and w. //! raised if uindex < 1 or uindex > nbupoles or vindex < 1 or vindex > nbvpoles. raised if weight <= resolution from package gp.

Parameters
----------
UIndex: int
VIndex: int
P: gp_Pnt
Weight: float

Returns
-------
None
") SetPole;
		void SetPole(const Standard_Integer UIndex, const Standard_Integer VIndex, const gp_Pnt & P, const Standard_Real Weight);

		/****************** SetPoleCol ******************/
		%feature("compactdefaultargs") SetPoleCol;
		%feature("autodoc", "Changes a column of poles or a part of this column. raised if vindex < 1 or vindex > nbvpoles. //! raised if cpoles.lower() < 1 or cpoles.upper() > nbupoles.

Parameters
----------
VIndex: int
CPoles: TColgp_Array1OfPnt

Returns
-------
None
") SetPoleCol;
		void SetPoleCol(const Standard_Integer VIndex, const TColgp_Array1OfPnt & CPoles);

		/****************** SetPoleCol ******************/
		%feature("compactdefaultargs") SetPoleCol;
		%feature("autodoc", "Changes a column of poles or a part of this column with the corresponding weights. if the surface was rational it can become non rational. if the surface was non rational it can become rational. raised if vindex < 1 or vindex > nbvpoles. //! raised if cpoles.lower() < 1 or cpoles.upper() > nbupoles raised if the bounds of cpoleweights are not the same as the bounds of cpoles. raised if one of the weight value of cpoleweights is lower or equal to resolution from package gp.

Parameters
----------
VIndex: int
CPoles: TColgp_Array1OfPnt
CPoleWeights: TColStd_Array1OfReal

Returns
-------
None
") SetPoleCol;
		void SetPoleCol(const Standard_Integer VIndex, const TColgp_Array1OfPnt & CPoles, const TColStd_Array1OfReal & CPoleWeights);

		/****************** SetPoleRow ******************/
		%feature("compactdefaultargs") SetPoleRow;
		%feature("autodoc", "Changes a row of poles or a part of this row with the corresponding weights. if the surface was rational it can become non rational. if the surface was non rational it can become rational. raised if uindex < 1 or uindex > nbupoles. //! raised if cpoles.lower() < 1 or cpoles.upper() > nbvpoles raises if the bounds of cpoleweights are not the same as the bounds of cpoles. raised if one of the weight value of cpoleweights is lower or equal to resolution from package gp.

Parameters
----------
UIndex: int
CPoles: TColgp_Array1OfPnt
CPoleWeights: TColStd_Array1OfReal

Returns
-------
None
") SetPoleRow;
		void SetPoleRow(const Standard_Integer UIndex, const TColgp_Array1OfPnt & CPoles, const TColStd_Array1OfReal & CPoleWeights);

		/****************** SetPoleRow ******************/
		%feature("compactdefaultargs") SetPoleRow;
		%feature("autodoc", "Changes a row of poles or a part of this row. raised if uindex < 1 or uindex > nbupoles. //! raised if cpoles.lower() < 1 or cpoles.upper() > nbvpoles.

Parameters
----------
UIndex: int
CPoles: TColgp_Array1OfPnt

Returns
-------
None
") SetPoleRow;
		void SetPoleRow(const Standard_Integer UIndex, const TColgp_Array1OfPnt & CPoles);

		/****************** SetUKnot ******************/
		%feature("compactdefaultargs") SetUKnot;
		%feature("autodoc", "Substitutes the uknots of range uindex with k. //! raised if uindex < 1 or uindex > nbuknots //! raised if k >= uknots(uindex+1) or k <= uknots(uindex-1).

Parameters
----------
UIndex: int
K: float

Returns
-------
None
") SetUKnot;
		void SetUKnot(const Standard_Integer UIndex, const Standard_Real K);

		/****************** SetUKnot ******************/
		%feature("compactdefaultargs") SetUKnot;
		%feature("autodoc", "Changes the value of the uknots of range uindex and increases its multiplicity. //! raised if uindex is not in the range [firstuknotindex, lastuknotindex] given by the methods with the same name. //! raised if k >= uknots(uindex+1) or k <= uknots(uindex-1) m must be lower than udegree and greater than the previous multiplicity of the knot of range uindex.

Parameters
----------
UIndex: int
K: float
M: int

Returns
-------
None
") SetUKnot;
		void SetUKnot(const Standard_Integer UIndex, const Standard_Real K, const Standard_Integer M);

		/****************** SetUKnots ******************/
		%feature("compactdefaultargs") SetUKnots;
		%feature("autodoc", "Changes all the u-knots of the surface. the multiplicity of the knots are not modified. //! raised if there is an index such that uk (index+1) <= uk (index). //! raised if uk.lower() < 1 or uk.upper() > nbuknots.

Parameters
----------
UK: TColStd_Array1OfReal

Returns
-------
None
") SetUKnots;
		void SetUKnots(const TColStd_Array1OfReal & UK);

		/****************** SetUNotPeriodic ******************/
		%feature("compactdefaultargs") SetUNotPeriodic;
		%feature("autodoc", "Sets the surface u not periodic. changes this bspline surface into a non-periodic surface along u direction. if this surface is already non-periodic, it is not modified. note: the poles and knots tables are modified.

Returns
-------
None
") SetUNotPeriodic;
		void SetUNotPeriodic();

		/****************** SetUOrigin ******************/
		%feature("compactdefaultargs") SetUOrigin;
		%feature("autodoc", "Assigns the knot of index index in the knots table in the corresponding parametric direction to be the origin of this periodic bspline surface. as a consequence, the knots and poles tables are modified. exceptions standard_nosuchobject if this bspline surface is not periodic in the given parametric direction. standard_domainerror if index is outside the bounds of the knots table in the given parametric direction.

Parameters
----------
Index: int

Returns
-------
None
") SetUOrigin;
		void SetUOrigin(const Standard_Integer Index);

		/****************** SetUPeriodic ******************/
		%feature("compactdefaultargs") SetUPeriodic;
		%feature("autodoc", "Sets the surface u periodic. modifies this surface to be periodic in the u parametric direction. to become periodic in a given parametric direction a surface must be closed in that parametric direction, and the knot sequence relative to that direction must be periodic. to generate this periodic sequence of knots, the functions firstuknotindex and lastuknotindex are used to compute i1 and i2. these are the indexes, in the knot array associated with the given parametric direction, of the knots that correspond to the first and last parameters of this bspline surface in the given parametric direction. hence the period is: knots(i1) - knots(i2) as a result, the knots and poles tables are modified. exceptions standard_constructionerror if the surface is not closed in the given parametric direction.

Returns
-------
None
") SetUPeriodic;
		void SetUPeriodic();

		/****************** SetVKnot ******************/
		%feature("compactdefaultargs") SetVKnot;
		%feature("autodoc", "Substitutes the vknots of range vindex with k. //! raised if vindex < 1 or vindex > nbvknots //! raised if k >= vknots(vindex+1) or k <= vknots(vindex-1).

Parameters
----------
VIndex: int
K: float

Returns
-------
None
") SetVKnot;
		void SetVKnot(const Standard_Integer VIndex, const Standard_Real K);

		/****************** SetVKnot ******************/
		%feature("compactdefaultargs") SetVKnot;
		%feature("autodoc", "Changes the value of the vknots of range vindex and increases its multiplicity. //! raised if vindex is not in the range [firstvknotindex, lastvknotindex] given by the methods with the same name. //! raised if k >= vknots(vindex+1) or k <= vknots(vindex-1) m must be lower than vdegree and greater than the previous multiplicity of the knot of range vindex.

Parameters
----------
VIndex: int
K: float
M: int

Returns
-------
None
") SetVKnot;
		void SetVKnot(const Standard_Integer VIndex, const Standard_Real K, const Standard_Integer M);

		/****************** SetVKnots ******************/
		%feature("compactdefaultargs") SetVKnots;
		%feature("autodoc", "Changes all the v-knots of the surface. the multiplicity of the knots are not modified. //! raised if there is an index such that vk (index+1) <= vk (index). //! raised if vk.lower() < 1 or vk.upper() > nbvknots.

Parameters
----------
VK: TColStd_Array1OfReal

Returns
-------
None
") SetVKnots;
		void SetVKnots(const TColStd_Array1OfReal & VK);

		/****************** SetVNotPeriodic ******************/
		%feature("compactdefaultargs") SetVNotPeriodic;
		%feature("autodoc", "Sets the surface v not periodic. changes this bspline surface into a non-periodic surface along v direction. if this surface is already non-periodic, it is not modified. note: the poles and knots tables are modified.

Returns
-------
None
") SetVNotPeriodic;
		void SetVNotPeriodic();

		/****************** SetVOrigin ******************/
		%feature("compactdefaultargs") SetVOrigin;
		%feature("autodoc", "Assigns the knot of index index in the knots table in the corresponding parametric direction to be the origin of this periodic bspline surface. as a consequence, the knots and poles tables are modified. exceptions standard_nosuchobject if this bspline surface is not periodic in the given parametric direction. standard_domainerror if index is outside the bounds of the knots table in the given parametric direction.

Parameters
----------
Index: int

Returns
-------
None
") SetVOrigin;
		void SetVOrigin(const Standard_Integer Index);

		/****************** SetVPeriodic ******************/
		%feature("compactdefaultargs") SetVPeriodic;
		%feature("autodoc", "Sets the surface v periodic. modifies this surface to be periodic in the v parametric direction. to become periodic in a given parametric direction a surface must be closed in that parametric direction, and the knot sequence relative to that direction must be periodic. to generate this periodic sequence of knots, the functions firstvknotindex and lastvknotindex are used to compute i1 and i2. these are the indexes, in the knot array associated with the given parametric direction, of the knots that correspond to the first and last parameters of this bspline surface in the given parametric direction. hence the period is: knots(i1) - knots(i2) as a result, the knots and poles tables are modified. exceptions standard_constructionerror if the surface is not closed in the given parametric direction.

Returns
-------
None
") SetVPeriodic;
		void SetVPeriodic();

		/****************** SetWeight ******************/
		%feature("compactdefaultargs") SetWeight;
		%feature("autodoc", "Changes the weight of the pole of range uindex, vindex. if the surface was non rational it can become rational. if the surface was rational it can become non rational. //! raised if uindex < 1 or uindex > nbupoles or vindex < 1 or vindex > nbvpoles //! raised if weight is lower or equal to resolution from package gp.

Parameters
----------
UIndex: int
VIndex: int
Weight: float

Returns
-------
None
") SetWeight;
		void SetWeight(const Standard_Integer UIndex, const Standard_Integer VIndex, const Standard_Real Weight);

		/****************** SetWeightCol ******************/
		%feature("compactdefaultargs") SetWeightCol;
		%feature("autodoc", "Changes a column of weights of a part of this column. //! raised if vindex < 1 or vindex > nbvpoles //! raised if cpoleweights.lower() < 1 or cpoleweights.upper() > nbupoles. raised if a weight value is lower or equal to resolution from package gp.

Parameters
----------
VIndex: int
CPoleWeights: TColStd_Array1OfReal

Returns
-------
None
") SetWeightCol;
		void SetWeightCol(const Standard_Integer VIndex, const TColStd_Array1OfReal & CPoleWeights);

		/****************** SetWeightRow ******************/
		%feature("compactdefaultargs") SetWeightRow;
		%feature("autodoc", "Changes a row of weights or a part of this row. //! raised if uindex < 1 or uindex > nbupoles //! raised if cpoleweights.lower() < 1 or cpoleweights.upper() > nbvpoles. raised if a weight value is lower or equal to resolution from package gp.

Parameters
----------
UIndex: int
CPoleWeights: TColStd_Array1OfReal

Returns
-------
None
") SetWeightRow;
		void SetWeightRow(const Standard_Integer UIndex, const TColStd_Array1OfReal & CPoleWeights);

		/****************** Transform ******************/
		%feature("compactdefaultargs") Transform;
		%feature("autodoc", "Applies the transformation t to this bspline surface.

Parameters
----------
T: gp_Trsf

Returns
-------
None
") Transform;
		void Transform(const gp_Trsf & T);

		/****************** UDegree ******************/
		%feature("compactdefaultargs") UDegree;
		%feature("autodoc", "Returns the degree of the normalized b-splines ni,n in the u direction.

Returns
-------
int
") UDegree;
		Standard_Integer UDegree();

		/****************** UIso ******************/
		%feature("compactdefaultargs") UIso;
		%feature("autodoc", "Computes the u isoparametric curve. a b-spline curve is returned.

Parameters
----------
U: float

Returns
-------
opencascade::handle<Geom_Curve>
") UIso;
		opencascade::handle<Geom_Curve> UIso(const Standard_Real U);

		/****************** UIso ******************/
		%feature("compactdefaultargs") UIso;
		%feature("autodoc", "Computes the u isoparametric curve. if checkrational=false, no try to make it non-rational. a b-spline curve is returned.

Parameters
----------
U: float
CheckRational: bool

Returns
-------
opencascade::handle<Geom_Curve>
") UIso;
		opencascade::handle<Geom_Curve> UIso(const Standard_Real U, const Standard_Boolean CheckRational);

		/****************** UKnot ******************/
		%feature("compactdefaultargs") UKnot;
		%feature("autodoc", "Returns the knot value of range uindex. raised if uindex < 1 or uindex > nbuknots.

Parameters
----------
UIndex: int

Returns
-------
float
") UKnot;
		Standard_Real UKnot(const Standard_Integer UIndex);

		/****************** UKnotDistribution ******************/
		%feature("compactdefaultargs") UKnotDistribution;
		%feature("autodoc", "Returns nonuniform or uniform or quasiuniform or piecewisebezier. if all the knots differ by a positive constant from the preceding knot in the u direction the b-spline surface can be : - uniform if all the knots are of multiplicity 1, - quasiuniform if all the knots are of multiplicity 1 except for the first and last knot which are of multiplicity degree + 1, - piecewisebezier if the first and last knots have multiplicity degree + 1 and if interior knots have multiplicity degree otherwise the surface is non uniform in the u direction the tolerance criterion is resolution from package gp.

Returns
-------
GeomAbs_BSplKnotDistribution
") UKnotDistribution;
		GeomAbs_BSplKnotDistribution UKnotDistribution();

		/****************** UKnotSequence ******************/
		%feature("compactdefaultargs") UKnotSequence;
		%feature("autodoc", "Returns the uknots sequence. in this sequence the knots with a multiplicity greater than 1 are repeated. example : ku = {k1, k1, k1, k2, k3, k3, k4, k4, k4} //! raised if the length of ku is not equal to nbupoles + udegree + 1.

Parameters
----------
Ku: TColStd_Array1OfReal

Returns
-------
None
") UKnotSequence;
		void UKnotSequence(TColStd_Array1OfReal & Ku);

		/****************** UKnotSequence ******************/
		%feature("compactdefaultargs") UKnotSequence;
		%feature("autodoc", "Returns the uknots sequence. in this sequence the knots with a multiplicity greater than 1 are repeated. example : ku = {k1, k1, k1, k2, k3, k3, k4, k4, k4}.

Returns
-------
TColStd_Array1OfReal
") UKnotSequence;
		const TColStd_Array1OfReal & UKnotSequence();

		/****************** UKnots ******************/
		%feature("compactdefaultargs") UKnots;
		%feature("autodoc", "Returns the knots in the u direction. //! raised if the length of ku is not equal to the number of knots in the u direction.

Parameters
----------
Ku: TColStd_Array1OfReal

Returns
-------
None
") UKnots;
		void UKnots(TColStd_Array1OfReal & Ku);

		/****************** UKnots ******************/
		%feature("compactdefaultargs") UKnots;
		%feature("autodoc", "Returns the knots in the u direction.

Returns
-------
TColStd_Array1OfReal
") UKnots;
		const TColStd_Array1OfReal & UKnots();

		/****************** UMultiplicities ******************/
		%feature("compactdefaultargs") UMultiplicities;
		%feature("autodoc", "Returns the multiplicities of the knots in the u direction. //! raised if the length of mu is not equal to the number of knots in the u direction.

Parameters
----------
Mu: TColStd_Array1OfInteger

Returns
-------
None
") UMultiplicities;
		void UMultiplicities(TColStd_Array1OfInteger & Mu);

		/****************** UMultiplicities ******************/
		%feature("compactdefaultargs") UMultiplicities;
		%feature("autodoc", "Returns the multiplicities of the knots in the u direction.

Returns
-------
TColStd_Array1OfInteger
") UMultiplicities;
		const TColStd_Array1OfInteger & UMultiplicities();

		/****************** UMultiplicity ******************/
		%feature("compactdefaultargs") UMultiplicity;
		%feature("autodoc", "Returns the multiplicity value of knot of range uindex in the u direction. raised if uindex < 1 or uindex > nbuknots.

Parameters
----------
UIndex: int

Returns
-------
int
") UMultiplicity;
		Standard_Integer UMultiplicity(const Standard_Integer UIndex);

		/****************** UReverse ******************/
		%feature("compactdefaultargs") UReverse;
		%feature("autodoc", "Changes the orientation of this bspline surface in the u parametric direction. the bounds of the surface are not changed but the given parametric direction is reversed. hence the orientation of the surface is reversed. the knots and poles tables are modified.

Returns
-------
None
") UReverse;
		void UReverse();

		/****************** UReversedParameter ******************/
		%feature("compactdefaultargs") UReversedParameter;
		%feature("autodoc", "Computes the u parameter on the modified surface, produced by reversing its u parametric direction, for the point of u parameter u, on this bspline surface. for a bspline surface, these functions return respectively: - ufirst + ulast - u, where ufirst, ulast are the values of the first and last parameters of this bspline surface, in the u parametric directions.

Parameters
----------
U: float

Returns
-------
float
") UReversedParameter;
		Standard_Real UReversedParameter(const Standard_Real U);

		/****************** VDegree ******************/
		%feature("compactdefaultargs") VDegree;
		%feature("autodoc", "Returns the degree of the normalized b-splines ni,d in the v direction.

Returns
-------
int
") VDegree;
		Standard_Integer VDegree();

		/****************** VIso ******************/
		%feature("compactdefaultargs") VIso;
		%feature("autodoc", "Computes the v isoparametric curve. a b-spline curve is returned.

Parameters
----------
V: float

Returns
-------
opencascade::handle<Geom_Curve>
") VIso;
		opencascade::handle<Geom_Curve> VIso(const Standard_Real V);

		/****************** VIso ******************/
		%feature("compactdefaultargs") VIso;
		%feature("autodoc", "Computes the v isoparametric curve. if checkrational=false, no try to make it non-rational. a b-spline curve is returned. transformations.

Parameters
----------
V: float
CheckRational: bool

Returns
-------
opencascade::handle<Geom_Curve>
") VIso;
		opencascade::handle<Geom_Curve> VIso(const Standard_Real V, const Standard_Boolean CheckRational);

		/****************** VKnot ******************/
		%feature("compactdefaultargs") VKnot;
		%feature("autodoc", "Returns the knot value of range vindex. raised if vindex < 1 or vindex > nbvknots.

Parameters
----------
VIndex: int

Returns
-------
float
") VKnot;
		Standard_Real VKnot(const Standard_Integer VIndex);

		/****************** VKnotDistribution ******************/
		%feature("compactdefaultargs") VKnotDistribution;
		%feature("autodoc", "Returns nonuniform or uniform or quasiuniform or piecewisebezier. if all the knots differ by a positive constant from the preceding knot in the v direction the b-spline surface can be : - uniform if all the knots are of multiplicity 1, - quasiuniform if all the knots are of multiplicity 1 except for the first and last knot which are of multiplicity degree + 1, - piecewisebezier if the first and last knots have multiplicity degree + 1 and if interior knots have multiplicity degree otherwise the surface is non uniform in the v direction. the tolerance criterion is resolution from package gp.

Returns
-------
GeomAbs_BSplKnotDistribution
") VKnotDistribution;
		GeomAbs_BSplKnotDistribution VKnotDistribution();

		/****************** VKnotSequence ******************/
		%feature("compactdefaultargs") VKnotSequence;
		%feature("autodoc", "Returns the vknots sequence. in this sequence the knots with a multiplicity greater than 1 are repeated. example : kv = {k1, k1, k1, k2, k3, k3, k4, k4, k4} //! raised if the length of kv is not equal to nbvpoles + vdegree + 1.

Parameters
----------
Kv: TColStd_Array1OfReal

Returns
-------
None
") VKnotSequence;
		void VKnotSequence(TColStd_Array1OfReal & Kv);

		/****************** VKnotSequence ******************/
		%feature("compactdefaultargs") VKnotSequence;
		%feature("autodoc", "Returns the vknots sequence. in this sequence the knots with a multiplicity greater than 1 are repeated. example : ku = {k1, k1, k1, k2, k3, k3, k4, k4, k4}.

Returns
-------
TColStd_Array1OfReal
") VKnotSequence;
		const TColStd_Array1OfReal & VKnotSequence();

		/****************** VKnots ******************/
		%feature("compactdefaultargs") VKnots;
		%feature("autodoc", "Returns the knots in the v direction. //! raised if the length of kv is not equal to the number of knots in the v direction.

Parameters
----------
Kv: TColStd_Array1OfReal

Returns
-------
None
") VKnots;
		void VKnots(TColStd_Array1OfReal & Kv);

		/****************** VKnots ******************/
		%feature("compactdefaultargs") VKnots;
		%feature("autodoc", "Returns the knots in the v direction.

Returns
-------
TColStd_Array1OfReal
") VKnots;
		const TColStd_Array1OfReal & VKnots();

		/****************** VMultiplicities ******************/
		%feature("compactdefaultargs") VMultiplicities;
		%feature("autodoc", "Returns the multiplicities of the knots in the v direction. //! raised if the length of mv is not equal to the number of knots in the v direction.

Parameters
----------
Mv: TColStd_Array1OfInteger

Returns
-------
None
") VMultiplicities;
		void VMultiplicities(TColStd_Array1OfInteger & Mv);

		/****************** VMultiplicities ******************/
		%feature("compactdefaultargs") VMultiplicities;
		%feature("autodoc", "Returns the multiplicities of the knots in the v direction.

Returns
-------
TColStd_Array1OfInteger
") VMultiplicities;
		const TColStd_Array1OfInteger & VMultiplicities();

		/****************** VMultiplicity ******************/
		%feature("compactdefaultargs") VMultiplicity;
		%feature("autodoc", "Returns the multiplicity value of knot of range vindex in the v direction. raised if vindex < 1 or vindex > nbvknots.

Parameters
----------
VIndex: int

Returns
-------
int
") VMultiplicity;
		Standard_Integer VMultiplicity(const Standard_Integer VIndex);

		/****************** VReverse ******************/
		%feature("compactdefaultargs") VReverse;
		%feature("autodoc", "Changes the orientation of this bspline surface in the v parametric direction. the bounds of the surface are not changed but the given parametric direction is reversed. hence the orientation of the surface is reversed. the knots and poles tables are modified.

Returns
-------
None
") VReverse;
		void VReverse();

		/****************** VReversedParameter ******************/
		%feature("compactdefaultargs") VReversedParameter;
		%feature("autodoc", "Computes the v parameter on the modified surface, produced by reversing its v parametric direction, for the point of v parameter v on this bspline surface. for a bspline surface, these functions return respectively: - vfirst + vlast - v, vfirst and vlast are the values of the first and last parameters of this bspline surface, in the v pametric directions.

Parameters
----------
V: float

Returns
-------
float
") VReversedParameter;
		Standard_Real VReversedParameter(const Standard_Real V);

		/****************** Weight ******************/
		%feature("compactdefaultargs") Weight;
		%feature("autodoc", "Returns the weight value of range uindex, vindex. //! raised if uindex < 1 or uindex > nbupoles or vindex < 1 or vindex > nbvpoles.

Parameters
----------
UIndex: int
VIndex: int

Returns
-------
float
") Weight;
		Standard_Real Weight(const Standard_Integer UIndex, const Standard_Integer VIndex);

		/****************** Weights ******************/
		%feature("compactdefaultargs") Weights;
		%feature("autodoc", "Returns the weights of the b-spline surface. //! raised if the length of w in the u and v direction is not equal to nbupoles and nbvpoles.

Parameters
----------
W: TColStd_Array2OfReal

Returns
-------
None
") Weights;
		void Weights(TColStd_Array2OfReal & W);

		/****************** Weights ******************/
		%feature("compactdefaultargs") Weights;
		%feature("autodoc", "Returns the weights of the b-spline surface. value and derivatives computation.

Returns
-------
TColStd_Array2OfReal *
") Weights;
		const TColStd_Array2OfReal * Weights();

};


%make_alias(Geom_BSplineSurface)

%extend Geom_BSplineSurface {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************
* class Geom_BezierCurve *
*************************/
class Geom_BezierCurve : public Geom_BoundedCurve {
	public:
		/****************** Geom_BezierCurve ******************/
		%feature("compactdefaultargs") Geom_BezierCurve;
		%feature("autodoc", "Creates a non rational bezier curve with a set of poles curvepoles. the weights are defaulted to all being 1. raises constructionerror if the number of poles is greater than maxdegree + 1 or lower than 2.

Parameters
----------
CurvePoles: TColgp_Array1OfPnt

Returns
-------
None
") Geom_BezierCurve;
		 Geom_BezierCurve(const TColgp_Array1OfPnt & CurvePoles);

		/****************** Geom_BezierCurve ******************/
		%feature("compactdefaultargs") Geom_BezierCurve;
		%feature("autodoc", "Creates a rational bezier curve with the set of poles curvepoles and the set of weights poleweights . if all the weights are identical the curve is considered as non rational. raises constructionerror if the number of poles is greater than maxdegree + 1 or lower than 2 or curvepoles and curveweights have not the same length or one weight value is lower or equal to resolution from package gp.

Parameters
----------
CurvePoles: TColgp_Array1OfPnt
PoleWeights: TColStd_Array1OfReal

Returns
-------
None
") Geom_BezierCurve;
		 Geom_BezierCurve(const TColgp_Array1OfPnt & CurvePoles, const TColStd_Array1OfReal & PoleWeights);

		/****************** Continuity ******************/
		%feature("compactdefaultargs") Continuity;
		%feature("autodoc", "A bezier curve is cn.

Returns
-------
GeomAbs_Shape
") Continuity;
		GeomAbs_Shape Continuity();

		/****************** Copy ******************/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "Creates a new object which is a copy of this bezier curve.

Returns
-------
opencascade::handle<Geom_Geometry>
") Copy;
		opencascade::handle<Geom_Geometry> Copy();

		/****************** D0 ******************/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "No available documentation.

Parameters
----------
U: float
P: gp_Pnt

Returns
-------
None
") D0;
		void D0(const Standard_Real U, gp_Pnt & P);

		/****************** D1 ******************/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "No available documentation.

Parameters
----------
U: float
P: gp_Pnt
V1: gp_Vec

Returns
-------
None
") D1;
		void D1(const Standard_Real U, gp_Pnt & P, gp_Vec & V1);

		/****************** D2 ******************/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "No available documentation.

Parameters
----------
U: float
P: gp_Pnt
V1: gp_Vec
V2: gp_Vec

Returns
-------
None
") D2;
		void D2(const Standard_Real U, gp_Pnt & P, gp_Vec & V1, gp_Vec & V2);

		/****************** D3 ******************/
		%feature("compactdefaultargs") D3;
		%feature("autodoc", "For this bezier curve, computes - the point p of parameter u, or - the point p and one or more of the following values: - v1, the first derivative vector, - v2, the second derivative vector, - v3, the third derivative vector. note: the parameter u can be outside the bounds of the curve.

Parameters
----------
U: float
P: gp_Pnt
V1: gp_Vec
V2: gp_Vec
V3: gp_Vec

Returns
-------
None
") D3;
		void D3(const Standard_Real U, gp_Pnt & P, gp_Vec & V1, gp_Vec & V2, gp_Vec & V3);

		/****************** DN ******************/
		%feature("compactdefaultargs") DN;
		%feature("autodoc", "For the point of parameter u of this bezier curve, computes the vector corresponding to the nth derivative. note: the parameter u can be outside the bounds of the curve. exceptions standard_rangeerror if n is less than 1.

Parameters
----------
U: float
N: int

Returns
-------
gp_Vec
") DN;
		gp_Vec DN(const Standard_Real U, const Standard_Integer N);

		/****************** Degree ******************/
		%feature("compactdefaultargs") Degree;
		%feature("autodoc", "Returns the polynomial degree of the curve. it is the number of poles - 1 point p and derivatives (v1, v2, v3) computation the bezier curve has a polynomial representation so the parameter u can be out of the bounds of the curve.

Returns
-------
int
") Degree;
		Standard_Integer Degree();

		/****************** EndPoint ******************/
		%feature("compactdefaultargs") EndPoint;
		%feature("autodoc", "Returns value (u=1.), it is the last control point of the bezier curve.

Returns
-------
gp_Pnt
") EndPoint;
		gp_Pnt EndPoint();

		/****************** FirstParameter ******************/
		%feature("compactdefaultargs") FirstParameter;
		%feature("autodoc", "Returns the value of the first parameter of this bezier curve. this is 0.0, which gives the start point of this bezier curve.

Returns
-------
float
") FirstParameter;
		Standard_Real FirstParameter();

		/****************** Increase ******************/
		%feature("compactdefaultargs") Increase;
		%feature("autodoc", "Increases the degree of a bezier curve. degree is the new degree of <self>. raises constructionerror if degree is greater than maxdegree or lower than 2 or lower than the initial degree of <self>.

Parameters
----------
Degree: int

Returns
-------
None
") Increase;
		void Increase(const Standard_Integer Degree);

		/****************** InsertPoleAfter ******************/
		%feature("compactdefaultargs") InsertPoleAfter;
		%feature("autodoc", "Inserts a pole p after the pole of range index. if the curve <self> is rational the weight value for the new pole of range index is 1.0. raised if index is not in the range [1, nbpoles] //! raised if the resulting number of poles is greater than maxdegree + 1.

Parameters
----------
Index: int
P: gp_Pnt

Returns
-------
None
") InsertPoleAfter;
		void InsertPoleAfter(const Standard_Integer Index, const gp_Pnt & P);

		/****************** InsertPoleAfter ******************/
		%feature("compactdefaultargs") InsertPoleAfter;
		%feature("autodoc", "Inserts a pole with its weight in the set of poles after the pole of range index. if the curve was non rational it can become rational if all the weights are not identical. raised if index is not in the range [1, nbpoles] //! raised if the resulting number of poles is greater than maxdegree + 1. raised if weight is lower or equal to resolution from package gp.

Parameters
----------
Index: int
P: gp_Pnt
Weight: float

Returns
-------
None
") InsertPoleAfter;
		void InsertPoleAfter(const Standard_Integer Index, const gp_Pnt & P, const Standard_Real Weight);

		/****************** InsertPoleBefore ******************/
		%feature("compactdefaultargs") InsertPoleBefore;
		%feature("autodoc", "Inserts a pole p before the pole of range index. if the curve <self> is rational the weight value for the new pole of range index is 1.0. raised if index is not in the range [1, nbpoles] //! raised if the resulting number of poles is greater than maxdegree + 1.

Parameters
----------
Index: int
P: gp_Pnt

Returns
-------
None
") InsertPoleBefore;
		void InsertPoleBefore(const Standard_Integer Index, const gp_Pnt & P);

		/****************** InsertPoleBefore ******************/
		%feature("compactdefaultargs") InsertPoleBefore;
		%feature("autodoc", "Inserts a pole with its weight in the set of poles after the pole of range index. if the curve was non rational it can become rational if all the weights are not identical. raised if index is not in the range [1, nbpoles] //! raised if the resulting number of poles is greater than maxdegree + 1. raised if weight is lower or equal to resolution from package gp.

Parameters
----------
Index: int
P: gp_Pnt
Weight: float

Returns
-------
None
") InsertPoleBefore;
		void InsertPoleBefore(const Standard_Integer Index, const gp_Pnt & P, const Standard_Real Weight);

		/****************** IsCN ******************/
		%feature("compactdefaultargs") IsCN;
		%feature("autodoc", "Continuity of the curve, returns true.

Parameters
----------
N: int

Returns
-------
bool
") IsCN;
		Standard_Boolean IsCN(const Standard_Integer N);

		/****************** IsClosed ******************/
		%feature("compactdefaultargs") IsClosed;
		%feature("autodoc", "Returns true if the distance between the first point and the last point of the curve is lower or equal to the resolution from package gp.

Returns
-------
bool
") IsClosed;
		Standard_Boolean IsClosed();

		/****************** IsPeriodic ******************/
		%feature("compactdefaultargs") IsPeriodic;
		%feature("autodoc", "Returns true if the parametrization of a curve is periodic. (p(u) = p(u + t) t = constante).

Returns
-------
bool
") IsPeriodic;
		Standard_Boolean IsPeriodic();

		/****************** IsRational ******************/
		%feature("compactdefaultargs") IsRational;
		%feature("autodoc", "Returns false if all the weights are identical. the tolerance criterion is resolution from package gp.

Returns
-------
bool
") IsRational;
		Standard_Boolean IsRational();

		/****************** LastParameter ******************/
		%feature("compactdefaultargs") LastParameter;
		%feature("autodoc", "Returns the value of the last parameter of this bezier curve. this is 1.0, which gives the end point of this bezier curve.

Returns
-------
float
") LastParameter;
		Standard_Real LastParameter();

		/****************** MaxDegree ******************/
		%feature("compactdefaultargs") MaxDegree;
		%feature("autodoc", "Returns the value of the maximum polynomial degree of any geom_beziercurve curve. this value is 25.

Returns
-------
int
") MaxDegree;
		static Standard_Integer MaxDegree();

		/****************** NbPoles ******************/
		%feature("compactdefaultargs") NbPoles;
		%feature("autodoc", "Returns the number of poles of this bezier curve.

Returns
-------
int
") NbPoles;
		Standard_Integer NbPoles();

		/****************** Pole ******************/
		%feature("compactdefaultargs") Pole;
		%feature("autodoc", "Returns the pole of range index. raised if index is not in the range [1, nbpoles].

Parameters
----------
Index: int

Returns
-------
gp_Pnt
") Pole;
		const gp_Pnt Pole(const Standard_Integer Index);

		/****************** Poles ******************/
		%feature("compactdefaultargs") Poles;
		%feature("autodoc", "Returns all the poles of the curve. //! raised if the length of p is not equal to the number of poles.

Parameters
----------
P: TColgp_Array1OfPnt

Returns
-------
None
") Poles;
		void Poles(TColgp_Array1OfPnt & P);

		/****************** Poles ******************/
		%feature("compactdefaultargs") Poles;
		%feature("autodoc", "Returns all the poles of the curve.

Returns
-------
TColgp_Array1OfPnt
") Poles;
		const TColgp_Array1OfPnt & Poles();

		/****************** RemovePole ******************/
		%feature("compactdefaultargs") RemovePole;
		%feature("autodoc", "Removes the pole of range index. if the curve was rational it can become non rational. raised if index is not in the range [1, nbpoles] raised if degree is lower than 2.

Parameters
----------
Index: int

Returns
-------
None
") RemovePole;
		void RemovePole(const Standard_Integer Index);

		/****************** Resolution ******************/
		%feature("compactdefaultargs") Resolution;
		%feature("autodoc", "Computes for this bezier curve the parametric tolerance utolerance for a given 3d tolerance tolerance3d. if f(t) is the equation of this bezier curve, utolerance ensures that: |t1-t0| < utolerance ===> |f(t1)-f(t0)| < tolerance3d.

Parameters
----------
Tolerance3D: float

Returns
-------
UTolerance: float
") Resolution;
		void Resolution(const Standard_Real Tolerance3D, Standard_Real &OutValue);

		/****************** Reverse ******************/
		%feature("compactdefaultargs") Reverse;
		%feature("autodoc", "Reverses the direction of parametrization of <self> value (newu) = value (1 - oldu).

Returns
-------
None
") Reverse;
		void Reverse();

		/****************** ReversedParameter ******************/
		%feature("compactdefaultargs") ReversedParameter;
		%feature("autodoc", "Returns the parameter on the reversed curve for the point of parameter u on <self>. //! returns 1-u.

Parameters
----------
U: float

Returns
-------
float
") ReversedParameter;
		Standard_Real ReversedParameter(const Standard_Real U);

		/****************** Segment ******************/
		%feature("compactdefaultargs") Segment;
		%feature("autodoc", "Segments the curve between u1 and u2 which can be out of the bounds of the curve. the curve is oriented from u1 to u2. the control points are modified, the first and the last point are not the same but the parametrization range is [0, 1] else it could not be a bezier curve. warnings : even if <self> is not closed it can become closed after the segmentation for example if u1 or u2 are out of the bounds of the curve <self> or if the curve makes loop. after the segmentation the length of a curve can be null.

Parameters
----------
U1: float
U2: float

Returns
-------
None
") Segment;
		void Segment(const Standard_Real U1, const Standard_Real U2);

		/****************** SetPole ******************/
		%feature("compactdefaultargs") SetPole;
		%feature("autodoc", "Substitutes the pole of range index with p. if the curve <self> is rational the weight of range index is not modified. raised if index is not in the range [1, nbpoles].

Parameters
----------
Index: int
P: gp_Pnt

Returns
-------
None
") SetPole;
		void SetPole(const Standard_Integer Index, const gp_Pnt & P);

		/****************** SetPole ******************/
		%feature("compactdefaultargs") SetPole;
		%feature("autodoc", "Substitutes the pole and the weights of range index. if the curve <self> is not rational it can become rational if all the weights are not identical. if the curve was rational it can become non rational if all the weights are identical. raised if index is not in the range [1, nbpoles] raised if weight <= resolution from package gp.

Parameters
----------
Index: int
P: gp_Pnt
Weight: float

Returns
-------
None
") SetPole;
		void SetPole(const Standard_Integer Index, const gp_Pnt & P, const Standard_Real Weight);

		/****************** SetWeight ******************/
		%feature("compactdefaultargs") SetWeight;
		%feature("autodoc", "Changes the weight of the pole of range index. if the curve <self> is not rational it can become rational if all the weights are not identical. if the curve was rational it can become non rational if all the weights are identical. raised if index is not in the range [1, nbpoles] raised if weight <= resolution from package gp.

Parameters
----------
Index: int
Weight: float

Returns
-------
None
") SetWeight;
		void SetWeight(const Standard_Integer Index, const Standard_Real Weight);

		/****************** StartPoint ******************/
		%feature("compactdefaultargs") StartPoint;
		%feature("autodoc", "Returns value (u=0.), it is the first control point of the curve.

Returns
-------
gp_Pnt
") StartPoint;
		gp_Pnt StartPoint();

		/****************** Transform ******************/
		%feature("compactdefaultargs") Transform;
		%feature("autodoc", "Applies the transformation t to this bezier curve.

Parameters
----------
T: gp_Trsf

Returns
-------
None
") Transform;
		void Transform(const gp_Trsf & T);

		/****************** Weight ******************/
		%feature("compactdefaultargs") Weight;
		%feature("autodoc", "Returns the weight of range index. raised if index is not in the range [1, nbpoles].

Parameters
----------
Index: int

Returns
-------
float
") Weight;
		Standard_Real Weight(const Standard_Integer Index);

		/****************** Weights ******************/
		%feature("compactdefaultargs") Weights;
		%feature("autodoc", "Returns all the weights of the curve. //! raised if the length of w is not equal to the number of poles.

Parameters
----------
W: TColStd_Array1OfReal

Returns
-------
None
") Weights;
		void Weights(TColStd_Array1OfReal & W);

		/****************** Weights ******************/
		%feature("compactdefaultargs") Weights;
		%feature("autodoc", "Returns all the weights of the curve.

Returns
-------
TColStd_Array1OfReal *
") Weights;
		const TColStd_Array1OfReal * Weights();

};


%make_alias(Geom_BezierCurve)

%extend Geom_BezierCurve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************
* class Geom_BezierSurface *
***************************/
class Geom_BezierSurface : public Geom_BoundedSurface {
	public:
		/****************** Geom_BezierSurface ******************/
		%feature("compactdefaultargs") Geom_BezierSurface;
		%feature("autodoc", "Creates a non-rational bezier surface with a set of poles. control points representation : spoles(uorigin,vorigin) ...................spoles(uorigin,vend) .  . .  . spoles(uend, vorigin) .....................spoles(uend, vend) for the double array the row indice corresponds to the parametric u direction and the columns indice corresponds to the parametric v direction. the weights are defaulted to all being 1. //! raised if the number of poles of the surface is lower than 2 or greater than maxdegree + 1 in one of the two directions u or v.

Parameters
----------
SurfacePoles: TColgp_Array2OfPnt

Returns
-------
None
") Geom_BezierSurface;
		 Geom_BezierSurface(const TColgp_Array2OfPnt & SurfacePoles);

		/****************** Geom_BezierSurface ******************/
		%feature("compactdefaultargs") Geom_BezierSurface;
		%feature("autodoc", "---purpose creates a rational bezier surface with a set of poles and a set of weights. for the double array the row indice corresponds to the parametric u direction and the columns indice corresponds to the parametric v direction. if all the weights are identical the surface is considered as non-rational (the tolerance criterion is resolution from package gp). //! raised if surfacepoles and poleweights have not the same rowlength or have not the same collength. raised if poleweights (i, j) <= resolution from gp; raised if the number of poles of the surface is lower than 2 or greater than maxdegree + 1 in one of the two directions u or v.

Parameters
----------
SurfacePoles: TColgp_Array2OfPnt
PoleWeights: TColStd_Array2OfReal

Returns
-------
None
") Geom_BezierSurface;
		 Geom_BezierSurface(const TColgp_Array2OfPnt & SurfacePoles, const TColStd_Array2OfReal & PoleWeights);

		/****************** Bounds ******************/
		%feature("compactdefaultargs") Bounds;
		%feature("autodoc", "Returns the parametric bounds u1, u2, v1 and v2 of this bezier surface. in the case of a bezier surface, this function returns u1 = 0, v1 = 0, u2 = 1, v2 = 1.

Parameters
----------

Returns
-------
U1: float
U2: float
V1: float
V2: float
") Bounds;
		void Bounds(Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** Continuity ******************/
		%feature("compactdefaultargs") Continuity;
		%feature("autodoc", "Returns the continuity of the surface cn : the order of continuity is infinite.

Returns
-------
GeomAbs_Shape
") Continuity;
		GeomAbs_Shape Continuity();

		/****************** Copy ******************/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "Creates a new object which is a copy of this bezier surface.

Returns
-------
opencascade::handle<Geom_Geometry>
") Copy;
		opencascade::handle<Geom_Geometry> Copy();

		/****************** D0 ******************/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "No available documentation.

Parameters
----------
U: float
V: float
P: gp_Pnt

Returns
-------
None
") D0;
		void D0(const Standard_Real U, const Standard_Real V, gp_Pnt & P);

		/****************** D1 ******************/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "No available documentation.

Parameters
----------
U: float
V: float
P: gp_Pnt
D1U: gp_Vec
D1V: gp_Vec

Returns
-------
None
") D1;
		void D1(const Standard_Real U, const Standard_Real V, gp_Pnt & P, gp_Vec & D1U, gp_Vec & D1V);

		/****************** D2 ******************/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "No available documentation.

Parameters
----------
U: float
V: float
P: gp_Pnt
D1U: gp_Vec
D1V: gp_Vec
D2U: gp_Vec
D2V: gp_Vec
D2UV: gp_Vec

Returns
-------
None
") D2;
		void D2(const Standard_Real U, const Standard_Real V, gp_Pnt & P, gp_Vec & D1U, gp_Vec & D1V, gp_Vec & D2U, gp_Vec & D2V, gp_Vec & D2UV);

		/****************** D3 ******************/
		%feature("compactdefaultargs") D3;
		%feature("autodoc", "Computes p, the point of parameters (u, v) of this bezier surface, and - one or more of the following sets of vectors: - d1u and d1v, the first derivative vectors at this point, - d2u, d2v and d2uv, the second derivative vectors at this point, - d3u, d3v, d3uuv and d3uvv, the third derivative vectors at this point. note: the parameters u and v can be outside the bounds of the surface.

Parameters
----------
U: float
V: float
P: gp_Pnt
D1U: gp_Vec
D1V: gp_Vec
D2U: gp_Vec
D2V: gp_Vec
D2UV: gp_Vec
D3U: gp_Vec
D3V: gp_Vec
D3UUV: gp_Vec
D3UVV: gp_Vec

Returns
-------
None
") D3;
		void D3(const Standard_Real U, const Standard_Real V, gp_Pnt & P, gp_Vec & D1U, gp_Vec & D1V, gp_Vec & D2U, gp_Vec & D2V, gp_Vec & D2UV, gp_Vec & D3U, gp_Vec & D3V, gp_Vec & D3UUV, gp_Vec & D3UVV);

		/****************** DN ******************/
		%feature("compactdefaultargs") DN;
		%feature("autodoc", "Computes the derivative of order nu in the u parametric direction, and nv in the v parametric direction, at the point of parameters (u, v) of this bezier surface. note: the parameters u and v can be outside the bounds of the surface. exceptions standard_rangeerror if: - nu + nv is less than 1, or nu or nv is negative.

Parameters
----------
U: float
V: float
Nu: int
Nv: int

Returns
-------
gp_Vec
") DN;
		gp_Vec DN(const Standard_Real U, const Standard_Real V, const Standard_Integer Nu, const Standard_Integer Nv);

		/****************** ExchangeUV ******************/
		%feature("compactdefaultargs") ExchangeUV;
		%feature("autodoc", "Exchanges the direction u and v on a bezier surface as a consequence: - the poles and weights tables are transposed, - degrees, rational characteristics and so on are exchanged between the two parametric directions, and - the orientation of the surface is reversed.

Returns
-------
None
") ExchangeUV;
		void ExchangeUV();

		/****************** Increase ******************/
		%feature("compactdefaultargs") Increase;
		%feature("autodoc", "Increases the degree of this bezier surface in the two parametric directions. //! raised if udegree < udegree <self> or vdegree < vdegree <self> raised if the degree of the surface is greater than maxdegree in one of the two directions u or v.

Parameters
----------
UDeg: int
VDeg: int

Returns
-------
None
") Increase;
		void Increase(const Standard_Integer UDeg, const Standard_Integer VDeg);

		/****************** InsertPoleColAfter ******************/
		%feature("compactdefaultargs") InsertPoleColAfter;
		%feature("autodoc", "Inserts a column of poles. if the surface is rational the weights values associated with cpoles are equal defaulted to 1. //! raised if vindex < 1 or vindex > nbvpoles. //! raises if vdegree is greater than maxdegree. raises if the length of cpoles is not equal to nbupoles.

Parameters
----------
VIndex: int
CPoles: TColgp_Array1OfPnt

Returns
-------
None
") InsertPoleColAfter;
		void InsertPoleColAfter(const Standard_Integer VIndex, const TColgp_Array1OfPnt & CPoles);

		/****************** InsertPoleColAfter ******************/
		%feature("compactdefaultargs") InsertPoleColAfter;
		%feature("autodoc", "Inserts a column of poles and weights. if the surface was non-rational it can become rational. //! raised if vindex < 1 or vindex > nbvpoles. raised if . vdegree is greater than maxdegree. . the length of cpoles is not equal to nbupoles . a weight value is lower or equal to resolution from package gp.

Parameters
----------
VIndex: int
CPoles: TColgp_Array1OfPnt
CPoleWeights: TColStd_Array1OfReal

Returns
-------
None
") InsertPoleColAfter;
		void InsertPoleColAfter(const Standard_Integer VIndex, const TColgp_Array1OfPnt & CPoles, const TColStd_Array1OfReal & CPoleWeights);

		/****************** InsertPoleColBefore ******************/
		%feature("compactdefaultargs") InsertPoleColBefore;
		%feature("autodoc", "Inserts a column of poles. if the surface is rational the weights values associated with cpoles are equal defaulted to 1. //! raised if vindex < 1 or vindex > nbvpoles. //! raised if vdegree is greater than maxdegree. raised if the length of cpoles is not equal to nbupoles.

Parameters
----------
VIndex: int
CPoles: TColgp_Array1OfPnt

Returns
-------
None
") InsertPoleColBefore;
		void InsertPoleColBefore(const Standard_Integer VIndex, const TColgp_Array1OfPnt & CPoles);

		/****************** InsertPoleColBefore ******************/
		%feature("compactdefaultargs") InsertPoleColBefore;
		%feature("autodoc", "Inserts a column of poles and weights. if the surface was non-rational it can become rational. //! raised if vindex < 1 or vindex > nbvpoles. raised if : . vdegree is greater than maxdegree. . the length of cpoles is not equal to nbupoles . a weight value is lower or equal to resolution from package gp.

Parameters
----------
VIndex: int
CPoles: TColgp_Array1OfPnt
CPoleWeights: TColStd_Array1OfReal

Returns
-------
None
") InsertPoleColBefore;
		void InsertPoleColBefore(const Standard_Integer VIndex, const TColgp_Array1OfPnt & CPoles, const TColStd_Array1OfReal & CPoleWeights);

		/****************** InsertPoleRowAfter ******************/
		%feature("compactdefaultargs") InsertPoleRowAfter;
		%feature("autodoc", "Inserts a row of poles. if the surface is rational the weights values associated with cpoles are equal defaulted to 1. //! raised if uindex < 1 or uindex > nbupoles. //! raised if udegree is greater than maxdegree. raised if the length of cpoles is not equal to nbvpoles.

Parameters
----------
UIndex: int
CPoles: TColgp_Array1OfPnt

Returns
-------
None
") InsertPoleRowAfter;
		void InsertPoleRowAfter(const Standard_Integer UIndex, const TColgp_Array1OfPnt & CPoles);

		/****************** InsertPoleRowAfter ******************/
		%feature("compactdefaultargs") InsertPoleRowAfter;
		%feature("autodoc", "Inserts a row of poles and weights. if the surface was non-rational it can become rational. //! raised if uindex < 1 or uindex > nbupoles. raised if : . udegree is greater than maxdegree. . the length of cpoles is not equal to nbvpoles . a weight value is lower or equal to resolution from package gp.

Parameters
----------
UIndex: int
CPoles: TColgp_Array1OfPnt
CPoleWeights: TColStd_Array1OfReal

Returns
-------
None
") InsertPoleRowAfter;
		void InsertPoleRowAfter(const Standard_Integer UIndex, const TColgp_Array1OfPnt & CPoles, const TColStd_Array1OfReal & CPoleWeights);

		/****************** InsertPoleRowBefore ******************/
		%feature("compactdefaultargs") InsertPoleRowBefore;
		%feature("autodoc", "Inserts a row of poles. if the surface is rational the weights values associated with cpoles are equal defaulted to 1. //! raised if uindex < 1 or uindex > nbupoles. //! raised if udegree is greater than maxdegree. raised if the length of cpoles is not equal to nbvpoles.

Parameters
----------
UIndex: int
CPoles: TColgp_Array1OfPnt

Returns
-------
None
") InsertPoleRowBefore;
		void InsertPoleRowBefore(const Standard_Integer UIndex, const TColgp_Array1OfPnt & CPoles);

		/****************** InsertPoleRowBefore ******************/
		%feature("compactdefaultargs") InsertPoleRowBefore;
		%feature("autodoc", "Inserts a row of poles and weights. if the surface was non-rational it can become rational. //! raised if uindex < 1 or uindex > nbupoles. raised if : . udegree is greater than maxdegree. . the length of cpoles is not equal to nbvpoles . a weight value is lower or equal to resolution from pacakage gp.

Parameters
----------
UIndex: int
CPoles: TColgp_Array1OfPnt
CPoleWeights: TColStd_Array1OfReal

Returns
-------
None
") InsertPoleRowBefore;
		void InsertPoleRowBefore(const Standard_Integer UIndex, const TColgp_Array1OfPnt & CPoles, const TColStd_Array1OfReal & CPoleWeights);

		/****************** IsCNu ******************/
		%feature("compactdefaultargs") IsCNu;
		%feature("autodoc", "Returns true, a bezier surface is always cn.

Parameters
----------
N: int

Returns
-------
bool
") IsCNu;
		Standard_Boolean IsCNu(const Standard_Integer N);

		/****************** IsCNv ******************/
		%feature("compactdefaultargs") IsCNv;
		%feature("autodoc", "Returns true, a beziersurface is always cn.

Parameters
----------
N: int

Returns
-------
bool
") IsCNv;
		Standard_Boolean IsCNv(const Standard_Integer N);

		/****************** IsUClosed ******************/
		%feature("compactdefaultargs") IsUClosed;
		%feature("autodoc", "Returns true if the first control points row and the last control points row are identical. the tolerance criterion is resolution from package gp.

Returns
-------
bool
") IsUClosed;
		Standard_Boolean IsUClosed();

		/****************** IsUPeriodic ******************/
		%feature("compactdefaultargs") IsUPeriodic;
		%feature("autodoc", "Returns false.

Returns
-------
bool
") IsUPeriodic;
		Standard_Boolean IsUPeriodic();

		/****************** IsURational ******************/
		%feature("compactdefaultargs") IsURational;
		%feature("autodoc", "Returns false if the weights are identical in the u direction, the tolerance criterion is resolution from package gp. example : |1.0, 1.0, 1.0| if weights = |0.5, 0.5, 0.5| returns false |2.0, 2.0, 2.0|.

Returns
-------
bool
") IsURational;
		Standard_Boolean IsURational();

		/****************** IsVClosed ******************/
		%feature("compactdefaultargs") IsVClosed;
		%feature("autodoc", "Returns true if the first control points column and the last control points column are identical. the tolerance criterion is resolution from package gp.

Returns
-------
bool
") IsVClosed;
		Standard_Boolean IsVClosed();

		/****************** IsVPeriodic ******************/
		%feature("compactdefaultargs") IsVPeriodic;
		%feature("autodoc", "Returns false.

Returns
-------
bool
") IsVPeriodic;
		Standard_Boolean IsVPeriodic();

		/****************** IsVRational ******************/
		%feature("compactdefaultargs") IsVRational;
		%feature("autodoc", "Returns false if the weights are identical in the v direction, the tolerance criterion is resolution from package gp. example : |1.0, 2.0, 0.5| if weights = |1.0, 2.0, 0.5| returns false |1.0, 2.0, 0.5|.

Returns
-------
bool
") IsVRational;
		Standard_Boolean IsVRational();

		/****************** MaxDegree ******************/
		%feature("compactdefaultargs") MaxDegree;
		%feature("autodoc", "Returns the value of the maximum polynomial degree of a bezier surface. this value is 25.

Returns
-------
int
") MaxDegree;
		static Standard_Integer MaxDegree();

		/****************** NbUPoles ******************/
		%feature("compactdefaultargs") NbUPoles;
		%feature("autodoc", "Returns the number of poles in the u direction.

Returns
-------
int
") NbUPoles;
		Standard_Integer NbUPoles();

		/****************** NbVPoles ******************/
		%feature("compactdefaultargs") NbVPoles;
		%feature("autodoc", "Returns the number of poles in the v direction.

Returns
-------
int
") NbVPoles;
		Standard_Integer NbVPoles();

		/****************** Pole ******************/
		%feature("compactdefaultargs") Pole;
		%feature("autodoc", "Returns the pole of range uindex, vindex raised if uindex < 1 or uindex > nbupoles, or vindex < 1 or vindex > nbvpoles.

Parameters
----------
UIndex: int
VIndex: int

Returns
-------
gp_Pnt
") Pole;
		const gp_Pnt Pole(const Standard_Integer UIndex, const Standard_Integer VIndex);

		/****************** Poles ******************/
		%feature("compactdefaultargs") Poles;
		%feature("autodoc", "Returns the poles of the bezier surface. //! raised if the length of p in the u an v direction is not equal to nbupoles and nbvpoles.

Parameters
----------
P: TColgp_Array2OfPnt

Returns
-------
None
") Poles;
		void Poles(TColgp_Array2OfPnt & P);

		/****************** Poles ******************/
		%feature("compactdefaultargs") Poles;
		%feature("autodoc", "Returns the poles of the bezier surface.

Returns
-------
TColgp_Array2OfPnt
") Poles;
		const TColgp_Array2OfPnt & Poles();

		/****************** RemovePoleCol ******************/
		%feature("compactdefaultargs") RemovePoleCol;
		%feature("autodoc", "Removes a column of poles. if the surface was rational it can become non-rational. //! raised if nbvpoles <= 2 after removing, a bezier surface must have at least two columns of poles. raised if vindex < 1 or vindex > nbvpoles.

Parameters
----------
VIndex: int

Returns
-------
None
") RemovePoleCol;
		void RemovePoleCol(const Standard_Integer VIndex);

		/****************** RemovePoleRow ******************/
		%feature("compactdefaultargs") RemovePoleRow;
		%feature("autodoc", "Removes a row of poles. if the surface was rational it can become non-rational. //! raised if nbupoles <= 2 after removing, a bezier surface must have at least two rows of poles. raised if uindex < 1 or uindex > nbupoles.

Parameters
----------
UIndex: int

Returns
-------
None
") RemovePoleRow;
		void RemovePoleRow(const Standard_Integer UIndex);

		/****************** Resolution ******************/
		%feature("compactdefaultargs") Resolution;
		%feature("autodoc", "Computes two tolerance values for this bezier surface, based on the given tolerance in 3d space tolerance3d. the tolerances computed are: - utolerance in the u parametric direction, and - vtolerance in the v parametric direction. if f(u,v) is the equation of this bezier surface, utolerance and vtolerance guarantee that: | u1 - u0 | < utolerance and | v1 - v0 | < vtolerance ====> |f (u1,v1) - f (u0,v0)| < tolerance3d.

Parameters
----------
Tolerance3D: float

Returns
-------
UTolerance: float
VTolerance: float
") Resolution;
		void Resolution(const Standard_Real Tolerance3D, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** Segment ******************/
		%feature("compactdefaultargs") Segment;
		%feature("autodoc", "Modifies this bezier surface by segmenting it between u1 and u2 in the u parametric direction, and between v1 and v2 in the v parametric direction. u1, u2, v1, and v2 can be outside the bounds of this surface. - u1 and u2 isoparametric bezier curves, segmented between v1 and v2, become the two bounds of the surface in the v parametric direction (0. and 1. u isoparametric curves). - v1 and v2 isoparametric bezier curves, segmented between u1 and u2, become the two bounds of the surface in the u parametric direction (0. and 1. v isoparametric curves). the poles and weights tables are modified, but the degree of this surface in the u and v parametric directions does not change. u1 can be greater than u2, and v1 can be greater than v2. in these cases, the corresponding parametric direction is inverted. the orientation of the surface is inverted if one (and only one) parametric direction is inverted.

Parameters
----------
U1: float
U2: float
V1: float
V2: float

Returns
-------
None
") Segment;
		void Segment(const Standard_Real U1, const Standard_Real U2, const Standard_Real V1, const Standard_Real V2);

		/****************** SetPole ******************/
		%feature("compactdefaultargs") SetPole;
		%feature("autodoc", "Modifies a pole value. if the surface is rational the weight of range (uindex, vindex) is not modified. //! raised if uindex < 1 or uindex > nbupoles or vindex < 1 or vindex > nbvpoles.

Parameters
----------
UIndex: int
VIndex: int
P: gp_Pnt

Returns
-------
None
") SetPole;
		void SetPole(const Standard_Integer UIndex, const Standard_Integer VIndex, const gp_Pnt & P);

		/****************** SetPole ******************/
		%feature("compactdefaultargs") SetPole;
		%feature("autodoc", "Substitutes the pole and the weight of range uindex, vindex. if the surface <self> is not rational it can become rational. if the surface was rational it can become non-rational. //! raises if uindex < 1 or uindex > nbupoles or vindex < 1 or vindex > nbvpoles. raised if weight <= resolution from package gp.

Parameters
----------
UIndex: int
VIndex: int
P: gp_Pnt
Weight: float

Returns
-------
None
") SetPole;
		void SetPole(const Standard_Integer UIndex, const Standard_Integer VIndex, const gp_Pnt & P, const Standard_Real Weight);

		/****************** SetPoleCol ******************/
		%feature("compactdefaultargs") SetPoleCol;
		%feature("autodoc", "Modifies a column of poles. the length of cpoles can be lower but not greater than nbupoles so you can modify just a part of the column. raised if vindex < 1 or vindex > nbvpoles //! raised if cpoles.lower() < 1 or cpoles.upper() > nbupoles.

Parameters
----------
VIndex: int
CPoles: TColgp_Array1OfPnt

Returns
-------
None
") SetPoleCol;
		void SetPoleCol(const Standard_Integer VIndex, const TColgp_Array1OfPnt & CPoles);

		/****************** SetPoleCol ******************/
		%feature("compactdefaultargs") SetPoleCol;
		%feature("autodoc", "Modifies a column of poles. if the surface was rational it can become non-rational if the surface was non-rational it can become rational. the length of cpoles can be lower but not greater than nbupoles so you can modify just a part of the column. raised if vindex < 1 or vindex > nbvpoles //! raised if cpoles.lower() < 1 or cpoles.upper() > nbupoles raised if cpoleweights and cpoles have not the same bounds. raised if one of the weight value cpoleweights (i) is lower or equal to resolution from package gp.

Parameters
----------
VIndex: int
CPoles: TColgp_Array1OfPnt
CPoleWeights: TColStd_Array1OfReal

Returns
-------
None
") SetPoleCol;
		void SetPoleCol(const Standard_Integer VIndex, const TColgp_Array1OfPnt & CPoles, const TColStd_Array1OfReal & CPoleWeights);

		/****************** SetPoleRow ******************/
		%feature("compactdefaultargs") SetPoleRow;
		%feature("autodoc", "Modifies a row of poles. the length of cpoles can be lower but not greater than nbvpoles so you can modify just a part of the row. raised if uindex < 1 or uindex > nbupoles //! raised if cpoles.lower() < 1 or cpoles.upper() > nbvpoles.

Parameters
----------
UIndex: int
CPoles: TColgp_Array1OfPnt

Returns
-------
None
") SetPoleRow;
		void SetPoleRow(const Standard_Integer UIndex, const TColgp_Array1OfPnt & CPoles);

		/****************** SetPoleRow ******************/
		%feature("compactdefaultargs") SetPoleRow;
		%feature("autodoc", "Modifies a row of poles and weights. if the surface was rational it can become non-rational. if the surface was non-rational it can become rational. the length of cpoles can be lower but not greater than nbvpoles so you can modify just a part of the row. raised if uindex < 1 or uindex > nbupoles //! raised if cpoles.lower() < 1 or cpoles.upper() > nbvpoles raised if cpoleweights and cpoles have not the same bounds. raised if one of the weight value cpoleweights (i) is lower or equal to resolution from gp.

Parameters
----------
UIndex: int
CPoles: TColgp_Array1OfPnt
CPoleWeights: TColStd_Array1OfReal

Returns
-------
None
") SetPoleRow;
		void SetPoleRow(const Standard_Integer UIndex, const TColgp_Array1OfPnt & CPoles, const TColStd_Array1OfReal & CPoleWeights);

		/****************** SetWeight ******************/
		%feature("compactdefaultargs") SetWeight;
		%feature("autodoc", "Modifies the weight of the pole of range uindex, vindex. if the surface was non-rational it can become rational. if the surface was rational it can become non-rational. //! raised if uindex < 1 or uindex > nbupoles or vindex < 1 or vindex > nbvpoles. raised if weight <= resolution from package gp.

Parameters
----------
UIndex: int
VIndex: int
Weight: float

Returns
-------
None
") SetWeight;
		void SetWeight(const Standard_Integer UIndex, const Standard_Integer VIndex, const Standard_Real Weight);

		/****************** SetWeightCol ******************/
		%feature("compactdefaultargs") SetWeightCol;
		%feature("autodoc", "Modifies a column of weights. if the surface was rational it can become non-rational. if the surface was non-rational it can become rational. the length of cpoleweights can be lower but not greater than nbupoles. raised if vindex < 1 or vindex > nbvpoles //! raised if cpoleweights.lower() < 1 or cpoleweights.upper() > nbupoles raised if one of the weight value cpoleweights (i) is lower or equal to resolution from package gp.

Parameters
----------
VIndex: int
CPoleWeights: TColStd_Array1OfReal

Returns
-------
None
") SetWeightCol;
		void SetWeightCol(const Standard_Integer VIndex, const TColStd_Array1OfReal & CPoleWeights);

		/****************** SetWeightRow ******************/
		%feature("compactdefaultargs") SetWeightRow;
		%feature("autodoc", "Modifies a row of weights. if the surface was rational it can become non-rational. if the surface was non-rational it can become rational. the length of cpoleweights can be lower but not greater than nbvpoles. raised if uindex < 1 or uindex > nbupoles //! raised if cpoleweights.lower() < 1 or cpoleweights.upper() > nbvpoles raised if one of the weight value cpoleweights (i) is lower or equal to resolution from package gp.

Parameters
----------
UIndex: int
CPoleWeights: TColStd_Array1OfReal

Returns
-------
None
") SetWeightRow;
		void SetWeightRow(const Standard_Integer UIndex, const TColStd_Array1OfReal & CPoleWeights);

		/****************** Transform ******************/
		%feature("compactdefaultargs") Transform;
		%feature("autodoc", "Applies the transformation t to this bezier surface.

Parameters
----------
T: gp_Trsf

Returns
-------
None
") Transform;
		void Transform(const gp_Trsf & T);

		/****************** UDegree ******************/
		%feature("compactdefaultargs") UDegree;
		%feature("autodoc", "Returns the degree of the surface in the u direction it is nbupoles - 1.

Returns
-------
int
") UDegree;
		Standard_Integer UDegree();

		/****************** UIso ******************/
		%feature("compactdefaultargs") UIso;
		%feature("autodoc", "Computes the u isoparametric curve. for a bezier surface the uiso curve is a bezier curve.

Parameters
----------
U: float

Returns
-------
opencascade::handle<Geom_Curve>
") UIso;
		opencascade::handle<Geom_Curve> UIso(const Standard_Real U);

		/****************** UReverse ******************/
		%feature("compactdefaultargs") UReverse;
		%feature("autodoc", "Changes the orientation of this bezier surface in the u parametric direction. the bounds of the surface are not changed, but the given parametric direction is reversed. hence, the orientation of the surface is reversed.

Returns
-------
None
") UReverse;
		void UReverse();

		/****************** UReversedParameter ******************/
		%feature("compactdefaultargs") UReversedParameter;
		%feature("autodoc", "Computes the u (or v) parameter on the modified surface, produced by reversing its u (or v) parametric direction, for any point of u parameter u (or of v parameter v) on this bezier surface. in the case of a bezier surface, these functions return respectively: - 1.-u, or 1.-v.

Parameters
----------
U: float

Returns
-------
float
") UReversedParameter;
		Standard_Real UReversedParameter(const Standard_Real U);

		/****************** VDegree ******************/
		%feature("compactdefaultargs") VDegree;
		%feature("autodoc", "Returns the degree of the surface in the v direction it is nbvpoles - 1.

Returns
-------
int
") VDegree;
		Standard_Integer VDegree();

		/****************** VIso ******************/
		%feature("compactdefaultargs") VIso;
		%feature("autodoc", "Computes the v isoparametric curve. for a bezier surface the viso curve is a bezier curve.

Parameters
----------
V: float

Returns
-------
opencascade::handle<Geom_Curve>
") VIso;
		opencascade::handle<Geom_Curve> VIso(const Standard_Real V);

		/****************** VReverse ******************/
		%feature("compactdefaultargs") VReverse;
		%feature("autodoc", "Changes the orientation of this bezier surface in the v parametric direction. the bounds of the surface are not changed, but the given parametric direction is reversed. hence, the orientation of the surface is reversed.

Returns
-------
None
") VReverse;
		void VReverse();

		/****************** VReversedParameter ******************/
		%feature("compactdefaultargs") VReversedParameter;
		%feature("autodoc", "Computes the u (or v) parameter on the modified surface, produced by reversing its u (or v) parametric direction, for any point of u parameter u (or of v parameter v) on this bezier surface. in the case of a bezier surface, these functions return respectively: - 1.-u, or 1.-v.

Parameters
----------
V: float

Returns
-------
float
") VReversedParameter;
		Standard_Real VReversedParameter(const Standard_Real V);

		/****************** Weight ******************/
		%feature("compactdefaultargs") Weight;
		%feature("autodoc", "Returns the weight of range uindex, vindex //! raised if uindex < 1 or uindex > nbupoles, or vindex < 1 or vindex > nbvpoles.

Parameters
----------
UIndex: int
VIndex: int

Returns
-------
float
") Weight;
		Standard_Real Weight(const Standard_Integer UIndex, const Standard_Integer VIndex);

		/****************** Weights ******************/
		%feature("compactdefaultargs") Weights;
		%feature("autodoc", "Returns the weights of the bezier surface. //! raised if the length of w in the u an v direction is not equal to nbupoles and nbvpoles.

Parameters
----------
W: TColStd_Array2OfReal

Returns
-------
None
") Weights;
		void Weights(TColStd_Array2OfReal & W);

		/****************** Weights ******************/
		%feature("compactdefaultargs") Weights;
		%feature("autodoc", "Returns the weights of the bezier surface.

Returns
-------
TColStd_Array2OfReal *
") Weights;
		const TColStd_Array2OfReal * Weights();

};


%make_alias(Geom_BezierSurface)

%extend Geom_BezierSurface {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************
* class Geom_Circle *
********************/
class Geom_Circle : public Geom_Conic {
	public:
		/****************** Geom_Circle ******************/
		%feature("compactdefaultargs") Geom_Circle;
		%feature("autodoc", "Constructs a circle by conversion of the gp_circ circle c.

Parameters
----------
C: gp_Circ

Returns
-------
None
") Geom_Circle;
		 Geom_Circle(const gp_Circ & C);

		/****************** Geom_Circle ******************/
		%feature("compactdefaultargs") Geom_Circle;
		%feature("autodoc", "Constructs a circle of radius radius, where a2 locates the circle and defines its orientation in 3d space such that: - the center of the circle is the origin of a2, - the origin, 'x direction' and 'y direction' of a2 define the plane of the circle, - a2 is the local coordinate system of the circle. note: it is possible to create a circle where radius is equal to 0.0. raised if radius < 0.

Parameters
----------
A2: gp_Ax2
Radius: float

Returns
-------
None
") Geom_Circle;
		 Geom_Circle(const gp_Ax2 & A2, const Standard_Real Radius);

		/****************** Circ ******************/
		%feature("compactdefaultargs") Circ;
		%feature("autodoc", "Returns the non transient circle from gp with the same geometric properties as <self>.

Returns
-------
gp_Circ
") Circ;
		gp_Circ Circ();

		/****************** Copy ******************/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "Creates a new object which is a copy of this circle.

Returns
-------
opencascade::handle<Geom_Geometry>
") Copy;
		opencascade::handle<Geom_Geometry> Copy();

		/****************** D0 ******************/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "Returns in p the point of parameter u. p = c + r * cos (u) * xdir + r * sin (u) * ydir where c is the center of the circle , xdir the xdirection and ydir the ydirection of the circle's local coordinate system.

Parameters
----------
U: float
P: gp_Pnt

Returns
-------
None
") D0;
		void D0(const Standard_Real U, gp_Pnt & P);

		/****************** D1 ******************/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "Returns the point p of parameter u and the first derivative v1.

Parameters
----------
U: float
P: gp_Pnt
V1: gp_Vec

Returns
-------
None
") D1;
		void D1(const Standard_Real U, gp_Pnt & P, gp_Vec & V1);

		/****************** D2 ******************/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "Returns the point p of parameter u, the first and second derivatives v1 and v2.

Parameters
----------
U: float
P: gp_Pnt
V1: gp_Vec
V2: gp_Vec

Returns
-------
None
") D2;
		void D2(const Standard_Real U, gp_Pnt & P, gp_Vec & V1, gp_Vec & V2);

		/****************** D3 ******************/
		%feature("compactdefaultargs") D3;
		%feature("autodoc", "Returns the point p of parameter u, the first second and third derivatives v1 v2 and v3.

Parameters
----------
U: float
P: gp_Pnt
V1: gp_Vec
V2: gp_Vec
V3: gp_Vec

Returns
-------
None
") D3;
		void D3(const Standard_Real U, gp_Pnt & P, gp_Vec & V1, gp_Vec & V2, gp_Vec & V3);

		/****************** DN ******************/
		%feature("compactdefaultargs") DN;
		%feature("autodoc", "The returned vector gives the value of the derivative for the order of derivation n. raised if n < 1.

Parameters
----------
U: float
N: int

Returns
-------
gp_Vec
") DN;
		gp_Vec DN(const Standard_Real U, const Standard_Integer N);

		/****************** Eccentricity ******************/
		%feature("compactdefaultargs") Eccentricity;
		%feature("autodoc", "Returns the eccentricity e = 0 for a circle.

Returns
-------
float
") Eccentricity;
		Standard_Real Eccentricity();

		/****************** FirstParameter ******************/
		%feature("compactdefaultargs") FirstParameter;
		%feature("autodoc", "Returns the value of the first parameter of this circle. this is 0.0, which gives the start point of this circle, or the start point and end point of a circle are coincident.

Returns
-------
float
") FirstParameter;
		Standard_Real FirstParameter();

		/****************** IsClosed ******************/
		%feature("compactdefaultargs") IsClosed;
		%feature("autodoc", "Returns true.

Returns
-------
bool
") IsClosed;
		Standard_Boolean IsClosed();

		/****************** IsPeriodic ******************/
		%feature("compactdefaultargs") IsPeriodic;
		%feature("autodoc", "Returns true.

Returns
-------
bool
") IsPeriodic;
		Standard_Boolean IsPeriodic();

		/****************** LastParameter ******************/
		%feature("compactdefaultargs") LastParameter;
		%feature("autodoc", "Returns the value of the last parameter of this circle. this is 2.*pi, which gives the end point of this circle. the start point and end point of a circle are coincident.

Returns
-------
float
") LastParameter;
		Standard_Real LastParameter();

		/****************** Radius ******************/
		%feature("compactdefaultargs") Radius;
		%feature("autodoc", "Returns the radius of this circle.

Returns
-------
float
") Radius;
		Standard_Real Radius();

		/****************** ReversedParameter ******************/
		%feature("compactdefaultargs") ReversedParameter;
		%feature("autodoc", "Computes the parameter on the reversed circle for the point of parameter u on this circle. for a circle, the returned value is: 2.*pi - u.

Parameters
----------
U: float

Returns
-------
float
") ReversedParameter;
		Standard_Real ReversedParameter(const Standard_Real U);

		/****************** SetCirc ******************/
		%feature("compactdefaultargs") SetCirc;
		%feature("autodoc", "Set <self> so that <self> has the same geometric properties as c.

Parameters
----------
C: gp_Circ

Returns
-------
None
") SetCirc;
		void SetCirc(const gp_Circ & C);

		/****************** SetRadius ******************/
		%feature("compactdefaultargs") SetRadius;
		%feature("autodoc", "Assigns the value r to the radius of this circle. note: it is possible to have a circle with a radius equal to 0.0. exceptions - standard_constructionerror if r is negative.

Parameters
----------
R: float

Returns
-------
None
") SetRadius;
		void SetRadius(const Standard_Real R);

		/****************** Transform ******************/
		%feature("compactdefaultargs") Transform;
		%feature("autodoc", "Applies the transformation t to this circle.

Parameters
----------
T: gp_Trsf

Returns
-------
None
") Transform;
		void Transform(const gp_Trsf & T);

};


%make_alias(Geom_Circle)

%extend Geom_Circle {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************
* class Geom_ConicalSurface *
****************************/
class Geom_ConicalSurface : public Geom_ElementarySurface {
	public:
		/****************** Geom_ConicalSurface ******************/
		%feature("compactdefaultargs") Geom_ConicalSurface;
		%feature("autodoc", "A3 defines the local coordinate system of the conical surface. ang is the conical surface semi-angle. its absolute value is in range ]0, pi/2[. radius is the radius of the circle viso in the placement plane of the conical surface defined with 'xaxis' and 'yaxis'. the 'zdirection' of a3 defines the direction of the surface's axis of symmetry. if the location point of a3 is the apex of the surface radius = 0 . at the creation the parametrization of the surface is defined such that the normal vector (n = d1u ^ d1v) is oriented towards the 'outside region' of the surface. //! raised if radius < 0.0 or abs(ang) < resolution from gp or abs(ang) >= pi/2 - resolution.

Parameters
----------
A3: gp_Ax3
Ang: float
Radius: float

Returns
-------
None
") Geom_ConicalSurface;
		 Geom_ConicalSurface(const gp_Ax3 & A3, const Standard_Real Ang, const Standard_Real Radius);

		/****************** Geom_ConicalSurface ******************/
		%feature("compactdefaultargs") Geom_ConicalSurface;
		%feature("autodoc", "Creates a conicalsurface from a non transient cone from package gp.

Parameters
----------
C: gp_Cone

Returns
-------
None
") Geom_ConicalSurface;
		 Geom_ConicalSurface(const gp_Cone & C);

		/****************** Apex ******************/
		%feature("compactdefaultargs") Apex;
		%feature("autodoc", "Computes the apex of this cone. it is on the negative side of the axis of revolution of this cone if the half-angle at the apex is positive, and on the positive side of the 'main axis' if the half-angle is negative.

Returns
-------
gp_Pnt
") Apex;
		gp_Pnt Apex();

		/****************** Bounds ******************/
		%feature("compactdefaultargs") Bounds;
		%feature("autodoc", "The conical surface is infinite in the v direction so v1 = realfirst from standard and v2 = reallast. u1 = 0 and u2 = 2*pi.

Parameters
----------

Returns
-------
U1: float
U2: float
V1: float
V2: float
") Bounds;
		void Bounds(Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** Coefficients ******************/
		%feature("compactdefaultargs") Coefficients;
		%feature("autodoc", "Returns the coefficients of the implicit equation of the quadric in the absolute cartesian coordinate system : these coefficients are normalized. a1.x**2 + a2.y**2 + a3.z**2 + 2.(b1.x.y + b2.x.z + b3.y.z) + 2.(c1.x + c2.y + c3.z) + d = 0.0.

Parameters
----------

Returns
-------
A1: float
A2: float
A3: float
B1: float
B2: float
B3: float
C1: float
C2: float
C3: float
D: float
") Coefficients;
		void Coefficients(Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** Cone ******************/
		%feature("compactdefaultargs") Cone;
		%feature("autodoc", "Returns a non transient cone with the same geometric properties as <self>.

Returns
-------
gp_Cone
") Cone;
		gp_Cone Cone();

		/****************** Copy ******************/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "Creates a new object which is a copy of this cone.

Returns
-------
opencascade::handle<Geom_Geometry>
") Copy;
		opencascade::handle<Geom_Geometry> Copy();

		/****************** D0 ******************/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "Computes the point p (u, v) on the surface. p (u, v) = loc + (refradius + v * sin (semi-angle)) * (cos (u) * xdir + sin (u) * ydir) + v * cos (semi-angle) * zdir where loc is the origin of the placement plane (xaxis, yaxis) xdir is the direction of the xaxis and ydir the direction of the yaxis.

Parameters
----------
U: float
V: float
P: gp_Pnt

Returns
-------
None
") D0;
		void D0(const Standard_Real U, const Standard_Real V, gp_Pnt & P);

		/****************** D1 ******************/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "Computes the current point and the first derivatives in the directions u and v.

Parameters
----------
U: float
V: float
P: gp_Pnt
D1U: gp_Vec
D1V: gp_Vec

Returns
-------
None
") D1;
		void D1(const Standard_Real U, const Standard_Real V, gp_Pnt & P, gp_Vec & D1U, gp_Vec & D1V);

		/****************** D2 ******************/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "Computes the current point, the first and the second derivatives in the directions u and v.

Parameters
----------
U: float
V: float
P: gp_Pnt
D1U: gp_Vec
D1V: gp_Vec
D2U: gp_Vec
D2V: gp_Vec
D2UV: gp_Vec

Returns
-------
None
") D2;
		void D2(const Standard_Real U, const Standard_Real V, gp_Pnt & P, gp_Vec & D1U, gp_Vec & D1V, gp_Vec & D2U, gp_Vec & D2V, gp_Vec & D2UV);

		/****************** D3 ******************/
		%feature("compactdefaultargs") D3;
		%feature("autodoc", "Computes the current point, the first,the second and the third derivatives in the directions u and v.

Parameters
----------
U: float
V: float
P: gp_Pnt
D1U: gp_Vec
D1V: gp_Vec
D2U: gp_Vec
D2V: gp_Vec
D2UV: gp_Vec
D3U: gp_Vec
D3V: gp_Vec
D3UUV: gp_Vec
D3UVV: gp_Vec

Returns
-------
None
") D3;
		void D3(const Standard_Real U, const Standard_Real V, gp_Pnt & P, gp_Vec & D1U, gp_Vec & D1V, gp_Vec & D2U, gp_Vec & D2V, gp_Vec & D2UV, gp_Vec & D3U, gp_Vec & D3V, gp_Vec & D3UUV, gp_Vec & D3UVV);

		/****************** DN ******************/
		%feature("compactdefaultargs") DN;
		%feature("autodoc", "Computes the derivative of order nu in the u parametric direction, and nv in the v parametric direction at the point of parameters (u, v) of this cone. exceptions standard_rangeerror if: - nu + nv is less than 1, - nu or nv is negative.

Parameters
----------
U: float
V: float
Nu: int
Nv: int

Returns
-------
gp_Vec
") DN;
		gp_Vec DN(const Standard_Real U, const Standard_Real V, const Standard_Integer Nu, const Standard_Integer Nv);

		/****************** IsUClosed ******************/
		%feature("compactdefaultargs") IsUClosed;
		%feature("autodoc", "Returns true.

Returns
-------
bool
") IsUClosed;
		Standard_Boolean IsUClosed();

		/****************** IsUPeriodic ******************/
		%feature("compactdefaultargs") IsUPeriodic;
		%feature("autodoc", "Returns true.

Returns
-------
bool
") IsUPeriodic;
		Standard_Boolean IsUPeriodic();

		/****************** IsVClosed ******************/
		%feature("compactdefaultargs") IsVClosed;
		%feature("autodoc", "Returns false.

Returns
-------
bool
") IsVClosed;
		Standard_Boolean IsVClosed();

		/****************** IsVPeriodic ******************/
		%feature("compactdefaultargs") IsVPeriodic;
		%feature("autodoc", "Returns false.

Returns
-------
bool
") IsVPeriodic;
		Standard_Boolean IsVPeriodic();

		/****************** ParametricTransformation ******************/
		%feature("compactdefaultargs") ParametricTransformation;
		%feature("autodoc", "Returns a 2d transformation used to find the new parameters of a point on the transformed surface. //! me->transformed(t)->value(u',v') //! is the same point as //! me->value(u,v).transformed(t) //! where u',v' are obtained by transforming u,v with th 2d transformation returned by //! me->parametrictransformation(t) //! this methods returns a scale centered on the u axis with t.scalefactor.

Parameters
----------
T: gp_Trsf

Returns
-------
gp_GTrsf2d
") ParametricTransformation;
		virtual gp_GTrsf2d ParametricTransformation(const gp_Trsf & T);

		/****************** RefRadius ******************/
		%feature("compactdefaultargs") RefRadius;
		%feature("autodoc", "Returns the reference radius of this cone. the reference radius is the radius of the circle formed by the intersection of this cone and its reference plane (i.e. the plane defined by the origin, 'x direction' and 'y direction' of the local coordinate system of this cone). if the apex of this cone is on the origin of the local coordinate system of this cone, the returned value is 0.

Returns
-------
float
") RefRadius;
		Standard_Real RefRadius();

		/****************** SemiAngle ******************/
		%feature("compactdefaultargs") SemiAngle;
		%feature("autodoc", "Returns the semi-angle at the apex of this cone. attention! semi-angle can be negative.

Returns
-------
float
") SemiAngle;
		Standard_Real SemiAngle();

		/****************** SetCone ******************/
		%feature("compactdefaultargs") SetCone;
		%feature("autodoc", "Set <self> so that <self> has the same geometric properties as c.

Parameters
----------
C: gp_Cone

Returns
-------
None
") SetCone;
		void SetCone(const gp_Cone & C);

		/****************** SetRadius ******************/
		%feature("compactdefaultargs") SetRadius;
		%feature("autodoc", "Changes the radius of the conical surface in the placement plane (z = 0, v = 0). the local coordinate system is not modified. raised if r < 0.0.

Parameters
----------
R: float

Returns
-------
None
") SetRadius;
		void SetRadius(const Standard_Real R);

		/****************** SetSemiAngle ******************/
		%feature("compactdefaultargs") SetSemiAngle;
		%feature("autodoc", "Changes the semi angle of the conical surface. semi-angle can be negative. its absolute value abs(ang) is in range ]0,pi/2[. raises constructionerror if abs(ang) < resolution from gp or abs(ang) >= pi/2 - resolution.

Parameters
----------
Ang: float

Returns
-------
None
") SetSemiAngle;
		void SetSemiAngle(const Standard_Real Ang);

		/****************** Transform ******************/
		%feature("compactdefaultargs") Transform;
		%feature("autodoc", "Applies the transformation t to this cone.

Parameters
----------
T: gp_Trsf

Returns
-------
None
") Transform;
		void Transform(const gp_Trsf & T);

		/****************** TransformParameters ******************/
		%feature("compactdefaultargs") TransformParameters;
		%feature("autodoc", "Computes the parameters on the transformed surface for the transform of the point of parameters u,v on <self>. //! me->transformed(t)->value(u',v') //! is the same point as //! me->value(u,v).transformed(t) //! where u',v' are the new values of u,v after calling //! me->tranformparameters(u,v,t) //! this methods multiplies v by t.scalefactor().

Parameters
----------
T: gp_Trsf

Returns
-------
U: float
V: float
") TransformParameters;
		virtual void TransformParameters(Standard_Real &OutValue, Standard_Real &OutValue, const gp_Trsf & T);

		/****************** UIso ******************/
		%feature("compactdefaultargs") UIso;
		%feature("autodoc", "Builds the u isoparametric line of this cone. the origin of this line is on the reference plane of this cone (i.e. the plane defined by the origin, 'x direction' and 'y direction' of the local coordinate system of this cone).

Parameters
----------
U: float

Returns
-------
opencascade::handle<Geom_Curve>
") UIso;
		opencascade::handle<Geom_Curve> UIso(const Standard_Real U);

		/****************** UReversedParameter ******************/
		%feature("compactdefaultargs") UReversedParameter;
		%feature("autodoc", "Return 2.pi - u.

Parameters
----------
U: float

Returns
-------
float
") UReversedParameter;
		Standard_Real UReversedParameter(const Standard_Real U);

		/****************** VIso ******************/
		%feature("compactdefaultargs") VIso;
		%feature("autodoc", "Builds the v isoparametric circle of this cone. it is the circle on this cone, located in the plane of z coordinate v*cos(semi-angle) in the local coordinate system of this cone. the 'axis' of this circle is the axis of revolution of this cone. its starting point is defined by the 'x direction' of this cone. warning if the v isoparametric circle is close to the apex of this cone, the radius of the circle becomes very small. it is possible to have a circle with radius equal to 0.0.

Parameters
----------
V: float

Returns
-------
opencascade::handle<Geom_Curve>
") VIso;
		opencascade::handle<Geom_Curve> VIso(const Standard_Real V);

		/****************** VReverse ******************/
		%feature("compactdefaultargs") VReverse;
		%feature("autodoc", "Changes the orientation of this cone in the v parametric direction. the bounds of the surface are not changed but the v parametric direction is reversed. as a consequence, for a cone: - the 'main direction' of the local coordinate system is reversed, and - the half-angle at the apex is inverted.

Returns
-------
None
") VReverse;
		virtual void VReverse();

		/****************** VReversedParameter ******************/
		%feature("compactdefaultargs") VReversedParameter;
		%feature("autodoc", "Computes the u (or v) parameter on the modified surface, when reversing its u (or v) parametric direction, for any point of u parameter u (or of v parameter v) on this cone. in the case of a cone, these functions return respectively: - 2.*pi - u, -v.

Parameters
----------
V: float

Returns
-------
float
") VReversedParameter;
		Standard_Real VReversedParameter(const Standard_Real V);

};


%make_alias(Geom_ConicalSurface)

%extend Geom_ConicalSurface {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************
* class Geom_CylindricalSurface *
********************************/
class Geom_CylindricalSurface : public Geom_ElementarySurface {
	public:
		/****************** Geom_CylindricalSurface ******************/
		%feature("compactdefaultargs") Geom_CylindricalSurface;
		%feature("autodoc", "A3 defines the local coordinate system of the cylindrical surface. the 'zdirection' of a3 defines the direction of the surface's axis of symmetry. at the creation the parametrization of the surface is defined such that the normal vector (n = d1u ^ d1v) is oriented towards the 'outside region' of the surface. warnings : it is not forbidden to create a cylindrical surface with radius = 0.0 raised if radius < 0.0.

Parameters
----------
A3: gp_Ax3
Radius: float

Returns
-------
None
") Geom_CylindricalSurface;
		 Geom_CylindricalSurface(const gp_Ax3 & A3, const Standard_Real Radius);

		/****************** Geom_CylindricalSurface ******************/
		%feature("compactdefaultargs") Geom_CylindricalSurface;
		%feature("autodoc", "Creates a cylindricalsurface from a non transient cylinder from package gp.

Parameters
----------
C: gp_Cylinder

Returns
-------
None
") Geom_CylindricalSurface;
		 Geom_CylindricalSurface(const gp_Cylinder & C);

		/****************** Bounds ******************/
		%feature("compactdefaultargs") Bounds;
		%feature("autodoc", "The cylindricalsurface is infinite in the v direction so v1 = realfirst, v2 = reallast from package standard. u1 = 0 and u2 = 2*pi.

Parameters
----------

Returns
-------
U1: float
U2: float
V1: float
V2: float
") Bounds;
		void Bounds(Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** Coefficients ******************/
		%feature("compactdefaultargs") Coefficients;
		%feature("autodoc", "Returns the coefficients of the implicit equation of the quadric in the absolute cartesian coordinate system : these coefficients are normalized. a1.x**2 + a2.y**2 + a3.z**2 + 2.(b1.x.y + b2.x.z + b3.y.z) + 2.(c1.x + c2.y + c3.z) + d = 0.0.

Parameters
----------

Returns
-------
A1: float
A2: float
A3: float
B1: float
B2: float
B3: float
C1: float
C2: float
C3: float
D: float
") Coefficients;
		void Coefficients(Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** Copy ******************/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "Creates a new object which is a copy of this cylinder.

Returns
-------
opencascade::handle<Geom_Geometry>
") Copy;
		opencascade::handle<Geom_Geometry> Copy();

		/****************** Cylinder ******************/
		%feature("compactdefaultargs") Cylinder;
		%feature("autodoc", "Returns a non transient cylinder with the same geometric properties as <self>.

Returns
-------
gp_Cylinder
") Cylinder;
		gp_Cylinder Cylinder();

		/****************** D0 ******************/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "Computes the point p (u, v) on the surface. p (u, v) = loc + radius * (cos (u) * xdir + sin (u) * ydir) + v * zdir where loc is the origin of the placement plane (xaxis, yaxis) xdir is the direction of the xaxis and ydir the direction of the yaxis.

Parameters
----------
U: float
V: float
P: gp_Pnt

Returns
-------
None
") D0;
		void D0(const Standard_Real U, const Standard_Real V, gp_Pnt & P);

		/****************** D1 ******************/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "Computes the current point and the first derivatives in the directions u and v.

Parameters
----------
U: float
V: float
P: gp_Pnt
D1U: gp_Vec
D1V: gp_Vec

Returns
-------
None
") D1;
		void D1(const Standard_Real U, const Standard_Real V, gp_Pnt & P, gp_Vec & D1U, gp_Vec & D1V);

		/****************** D2 ******************/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "Computes the current point, the first and the second derivatives in the directions u and v.

Parameters
----------
U: float
V: float
P: gp_Pnt
D1U: gp_Vec
D1V: gp_Vec
D2U: gp_Vec
D2V: gp_Vec
D2UV: gp_Vec

Returns
-------
None
") D2;
		void D2(const Standard_Real U, const Standard_Real V, gp_Pnt & P, gp_Vec & D1U, gp_Vec & D1V, gp_Vec & D2U, gp_Vec & D2V, gp_Vec & D2UV);

		/****************** D3 ******************/
		%feature("compactdefaultargs") D3;
		%feature("autodoc", "Computes the current point, the first, the second and the third derivatives in the directions u and v.

Parameters
----------
U: float
V: float
P: gp_Pnt
D1U: gp_Vec
D1V: gp_Vec
D2U: gp_Vec
D2V: gp_Vec
D2UV: gp_Vec
D3U: gp_Vec
D3V: gp_Vec
D3UUV: gp_Vec
D3UVV: gp_Vec

Returns
-------
None
") D3;
		void D3(const Standard_Real U, const Standard_Real V, gp_Pnt & P, gp_Vec & D1U, gp_Vec & D1V, gp_Vec & D2U, gp_Vec & D2V, gp_Vec & D2UV, gp_Vec & D3U, gp_Vec & D3V, gp_Vec & D3UUV, gp_Vec & D3UVV);

		/****************** DN ******************/
		%feature("compactdefaultargs") DN;
		%feature("autodoc", "Computes the derivative of order nu in the direction u and nv in the direction v. raised if nu + nv < 1 or nu < 0 or nv < 0.

Parameters
----------
U: float
V: float
Nu: int
Nv: int

Returns
-------
gp_Vec
") DN;
		gp_Vec DN(const Standard_Real U, const Standard_Real V, const Standard_Integer Nu, const Standard_Integer Nv);

		/****************** IsUClosed ******************/
		%feature("compactdefaultargs") IsUClosed;
		%feature("autodoc", "Returns true.

Returns
-------
bool
") IsUClosed;
		Standard_Boolean IsUClosed();

		/****************** IsUPeriodic ******************/
		%feature("compactdefaultargs") IsUPeriodic;
		%feature("autodoc", "Returns true.

Returns
-------
bool
") IsUPeriodic;
		Standard_Boolean IsUPeriodic();

		/****************** IsVClosed ******************/
		%feature("compactdefaultargs") IsVClosed;
		%feature("autodoc", "Returns false.

Returns
-------
bool
") IsVClosed;
		Standard_Boolean IsVClosed();

		/****************** IsVPeriodic ******************/
		%feature("compactdefaultargs") IsVPeriodic;
		%feature("autodoc", "Returns false.

Returns
-------
bool
") IsVPeriodic;
		Standard_Boolean IsVPeriodic();

		/****************** ParametricTransformation ******************/
		%feature("compactdefaultargs") ParametricTransformation;
		%feature("autodoc", "Returns a 2d transformation used to find the new parameters of a point on the transformed surface. me->transformed(t)->value(u',v') is the same point as me->value(u,v).transformed(t) where u',v' are obtained by transforming u,v with th 2d transformation returned by me->parametrictransformation(t) this methods returns a scale centered on the u axis with t.scalefactor.

Parameters
----------
T: gp_Trsf

Returns
-------
gp_GTrsf2d
") ParametricTransformation;
		virtual gp_GTrsf2d ParametricTransformation(const gp_Trsf & T);

		/****************** Radius ******************/
		%feature("compactdefaultargs") Radius;
		%feature("autodoc", "Returns the radius of this cylinder.

Returns
-------
float
") Radius;
		Standard_Real Radius();

		/****************** SetCylinder ******************/
		%feature("compactdefaultargs") SetCylinder;
		%feature("autodoc", "Set <self> so that <self> has the same geometric properties as c.

Parameters
----------
C: gp_Cylinder

Returns
-------
None
") SetCylinder;
		void SetCylinder(const gp_Cylinder & C);

		/****************** SetRadius ******************/
		%feature("compactdefaultargs") SetRadius;
		%feature("autodoc", "Changes the radius of the cylinder. raised if r < 0.0.

Parameters
----------
R: float

Returns
-------
None
") SetRadius;
		void SetRadius(const Standard_Real R);

		/****************** Transform ******************/
		%feature("compactdefaultargs") Transform;
		%feature("autodoc", "Applies the transformation t to this cylinder.

Parameters
----------
T: gp_Trsf

Returns
-------
None
") Transform;
		void Transform(const gp_Trsf & T);

		/****************** TransformParameters ******************/
		%feature("compactdefaultargs") TransformParameters;
		%feature("autodoc", "Computes the parameters on the transformed surface for the transform of the point of parameters u,v on <self>. me->transformed(t)->value(u',v') is the same point as me->value(u,v).transformed(t) where u',v' are the new values of u,v after calling me->tranformparameters(u,v,t) this methods multiplies v by t.scalefactor().

Parameters
----------
T: gp_Trsf

Returns
-------
U: float
V: float
") TransformParameters;
		virtual void TransformParameters(Standard_Real &OutValue, Standard_Real &OutValue, const gp_Trsf & T);

		/****************** UIso ******************/
		%feature("compactdefaultargs") UIso;
		%feature("autodoc", "The uiso curve is a line. the location point of this line is on the placement plane (xaxis, yaxis) of the surface. this line is parallel to the axis of symmetry of the surface.

Parameters
----------
U: float

Returns
-------
opencascade::handle<Geom_Curve>
") UIso;
		opencascade::handle<Geom_Curve> UIso(const Standard_Real U);

		/****************** UReversedParameter ******************/
		%feature("compactdefaultargs") UReversedParameter;
		%feature("autodoc", "Return the parameter on the ureversed surface for the point of parameter u on <self>. return 2.pi - u.

Parameters
----------
U: float

Returns
-------
float
") UReversedParameter;
		Standard_Real UReversedParameter(const Standard_Real U);

		/****************** VIso ******************/
		%feature("compactdefaultargs") VIso;
		%feature("autodoc", "The viso curve is a circle. the start point of this circle (u = 0) is defined with the 'xaxis' of the surface. the center of the circle is on the symmetry axis.

Parameters
----------
V: float

Returns
-------
opencascade::handle<Geom_Curve>
") VIso;
		opencascade::handle<Geom_Curve> VIso(const Standard_Real V);

		/****************** VReversedParameter ******************/
		%feature("compactdefaultargs") VReversedParameter;
		%feature("autodoc", "Return the parameter on the vreversed surface for the point of parameter v on <self>. return -v.

Parameters
----------
V: float

Returns
-------
float
") VReversedParameter;
		Standard_Real VReversedParameter(const Standard_Real V);

};


%make_alias(Geom_CylindricalSurface)

%extend Geom_CylindricalSurface {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************
* class Geom_Ellipse *
*********************/
class Geom_Ellipse : public Geom_Conic {
	public:
		/****************** Geom_Ellipse ******************/
		%feature("compactdefaultargs") Geom_Ellipse;
		%feature("autodoc", "Constructs an ellipse by conversion of the gp_elips ellipse e.

Parameters
----------
E: gp_Elips

Returns
-------
None
") Geom_Ellipse;
		 Geom_Ellipse(const gp_Elips & E);

		/****************** Geom_Ellipse ******************/
		%feature("compactdefaultargs") Geom_Ellipse;
		%feature("autodoc", "Constructs an ellipse defined by its major and minor radii, majorradius and minorradius, where a2 locates the ellipse and defines its orientation in 3d space such that: - the center of the ellipse is the origin of a2, - the 'x direction' of a2 defines the major axis of the ellipse, i.e. the major radius majorradius is measured along this axis, - the 'y direction' of a2 defines the minor axis of the ellipse, i.e. the minor radius minorradius is measured along this axis, - a2 is the local coordinate system of the ellipse. exceptions standard_constructionerror if: - majorradius is less than minorradius, or - minorradius is less than 0. warning the geom package does not prevent the construction of an ellipse where majorradius and minorradius are equal.

Parameters
----------
A2: gp_Ax2
MajorRadius: float
MinorRadius: float

Returns
-------
None
") Geom_Ellipse;
		 Geom_Ellipse(const gp_Ax2 & A2, const Standard_Real MajorRadius, const Standard_Real MinorRadius);

		/****************** Copy ******************/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "Creates a new object which is a copy of this ellipse.

Returns
-------
opencascade::handle<Geom_Geometry>
") Copy;
		opencascade::handle<Geom_Geometry> Copy();

		/****************** D0 ******************/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "Returns in p the point of parameter u. p = c + majorradius * cos (u) * xdir + minorradius * sin (u) * ydir where c is the center of the ellipse , xdir the direction of the 'xaxis' and 'ydir' the 'yaxis' of the ellipse.

Parameters
----------
U: float
P: gp_Pnt

Returns
-------
None
") D0;
		void D0(const Standard_Real U, gp_Pnt & P);

		/****************** D1 ******************/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "No available documentation.

Parameters
----------
U: float
P: gp_Pnt
V1: gp_Vec

Returns
-------
None
") D1;
		void D1(const Standard_Real U, gp_Pnt & P, gp_Vec & V1);

		/****************** D2 ******************/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "Returns the point p of parameter u. the vectors v1 and v2 are the first and second derivatives at this point.

Parameters
----------
U: float
P: gp_Pnt
V1: gp_Vec
V2: gp_Vec

Returns
-------
None
") D2;
		void D2(const Standard_Real U, gp_Pnt & P, gp_Vec & V1, gp_Vec & V2);

		/****************** D3 ******************/
		%feature("compactdefaultargs") D3;
		%feature("autodoc", "Returns the point p of parameter u, the first second and third derivatives v1 v2 and v3.

Parameters
----------
U: float
P: gp_Pnt
V1: gp_Vec
V2: gp_Vec
V3: gp_Vec

Returns
-------
None
") D3;
		void D3(const Standard_Real U, gp_Pnt & P, gp_Vec & V1, gp_Vec & V2, gp_Vec & V3);

		/****************** DN ******************/
		%feature("compactdefaultargs") DN;
		%feature("autodoc", "For the point of parameter u of this ellipse, computes the vector corresponding to the nth derivative. exceptions standard_rangeerror if n is less than 1.

Parameters
----------
U: float
N: int

Returns
-------
gp_Vec
") DN;
		gp_Vec DN(const Standard_Real U, const Standard_Integer N);

		/****************** Directrix1 ******************/
		%feature("compactdefaultargs") Directrix1;
		%feature("autodoc", "This directrix is the line normal to the xaxis of the ellipse in the local plane (z = 0) at a distance d = majorradius / e from the center of the ellipse, where e is the eccentricity of the ellipse. this line is parallel to the 'yaxis'. the intersection point between directrix1 and the 'xaxis' is the 'location' point of the directrix1. this point is on the positive side of the 'xaxis'. raised if eccentricity = 0.0. (the ellipse degenerates into a circle).

Returns
-------
gp_Ax1
") Directrix1;
		gp_Ax1 Directrix1();

		/****************** Directrix2 ******************/
		%feature("compactdefaultargs") Directrix2;
		%feature("autodoc", "This line is obtained by the symmetrical transformation of 'directrix1' with respect to the 'yaxis' of the ellipse. //! raised if eccentricity = 0.0. (the ellipse degenerates into a circle).

Returns
-------
gp_Ax1
") Directrix2;
		gp_Ax1 Directrix2();

		/****************** Eccentricity ******************/
		%feature("compactdefaultargs") Eccentricity;
		%feature("autodoc", "Returns the eccentricity of the ellipse between 0.0 and 1.0 if f is the distance between the center of the ellipse and the focus1 then the eccentricity e = f / majorradius. returns 0 if majorradius = 0.

Returns
-------
float
") Eccentricity;
		Standard_Real Eccentricity();

		/****************** Elips ******************/
		%feature("compactdefaultargs") Elips;
		%feature("autodoc", "Returns the non transient ellipse from gp with the same.

Returns
-------
gp_Elips
") Elips;
		gp_Elips Elips();

		/****************** FirstParameter ******************/
		%feature("compactdefaultargs") FirstParameter;
		%feature("autodoc", "Returns the value of the first parameter of this ellipse. this is respectively: - 0.0, which gives the start point of this ellipse, or the start point and end point of an ellipse are coincident.

Returns
-------
float
") FirstParameter;
		Standard_Real FirstParameter();

		/****************** Focal ******************/
		%feature("compactdefaultargs") Focal;
		%feature("autodoc", "Computes the focal distance. it is the distance between the the two focus of the ellipse.

Returns
-------
float
") Focal;
		Standard_Real Focal();

		/****************** Focus1 ******************/
		%feature("compactdefaultargs") Focus1;
		%feature("autodoc", "Returns the first focus of the ellipse. this focus is on the positive side of the 'xaxis' of the ellipse.

Returns
-------
gp_Pnt
") Focus1;
		gp_Pnt Focus1();

		/****************** Focus2 ******************/
		%feature("compactdefaultargs") Focus2;
		%feature("autodoc", "Returns the second focus of the ellipse. this focus is on the negative side of the 'xaxis' of the ellipse.

Returns
-------
gp_Pnt
") Focus2;
		gp_Pnt Focus2();

		/****************** IsClosed ******************/
		%feature("compactdefaultargs") IsClosed;
		%feature("autodoc", "Return true.

Returns
-------
bool
") IsClosed;
		Standard_Boolean IsClosed();

		/****************** IsPeriodic ******************/
		%feature("compactdefaultargs") IsPeriodic;
		%feature("autodoc", "Return true.

Returns
-------
bool
") IsPeriodic;
		Standard_Boolean IsPeriodic();

		/****************** LastParameter ******************/
		%feature("compactdefaultargs") LastParameter;
		%feature("autodoc", "Returns the value of the last parameter of this ellipse. this is respectively: - 2.*pi, which gives the end point of this ellipse. the start point and end point of an ellipse are coincident.

Returns
-------
float
") LastParameter;
		Standard_Real LastParameter();

		/****************** MajorRadius ******************/
		%feature("compactdefaultargs") MajorRadius;
		%feature("autodoc", "Returns the major radius of this ellipse.

Returns
-------
float
") MajorRadius;
		Standard_Real MajorRadius();

		/****************** MinorRadius ******************/
		%feature("compactdefaultargs") MinorRadius;
		%feature("autodoc", "Returns the minor radius of this ellipse.

Returns
-------
float
") MinorRadius;
		Standard_Real MinorRadius();

		/****************** Parameter ******************/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "Returns p = (1 - e * e) * majorradius where e is the eccentricity of the ellipse. returns 0 if majorradius = 0.

Returns
-------
float
") Parameter;
		Standard_Real Parameter();

		/****************** ReversedParameter ******************/
		%feature("compactdefaultargs") ReversedParameter;
		%feature("autodoc", "Computes the parameter on the reversed ellipse for the point of parameter u on this ellipse. for an ellipse, the returned value is: 2.*pi - u.

Parameters
----------
U: float

Returns
-------
float
") ReversedParameter;
		Standard_Real ReversedParameter(const Standard_Real U);

		/****************** SetElips ******************/
		%feature("compactdefaultargs") SetElips;
		%feature("autodoc", "Converts the gp_elips ellipse e into this ellipse.

Parameters
----------
E: gp_Elips

Returns
-------
None
") SetElips;
		void SetElips(const gp_Elips & E);

		/****************** SetMajorRadius ******************/
		%feature("compactdefaultargs") SetMajorRadius;
		%feature("autodoc", "Assigns a value to the major radius of this ellipse. constructionerror raised if majorradius < minorradius.

Parameters
----------
MajorRadius: float

Returns
-------
None
") SetMajorRadius;
		void SetMajorRadius(const Standard_Real MajorRadius);

		/****************** SetMinorRadius ******************/
		%feature("compactdefaultargs") SetMinorRadius;
		%feature("autodoc", "Assigns a value to the minor radius of this ellipse. constructionerror raised if majorradius < minorradius or if minorradius < 0.

Parameters
----------
MinorRadius: float

Returns
-------
None
") SetMinorRadius;
		void SetMinorRadius(const Standard_Real MinorRadius);

		/****************** Transform ******************/
		%feature("compactdefaultargs") Transform;
		%feature("autodoc", "Applies the transformation t to this ellipse.

Parameters
----------
T: gp_Trsf

Returns
-------
None
") Transform;
		void Transform(const gp_Trsf & T);

};


%make_alias(Geom_Ellipse)

%extend Geom_Ellipse {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************
* class Geom_Hyperbola *
***********************/
class Geom_Hyperbola : public Geom_Conic {
	public:
		/****************** Geom_Hyperbola ******************/
		%feature("compactdefaultargs") Geom_Hyperbola;
		%feature("autodoc", "Constructs a hyperbola by conversion of the gp_hypr hyperbola h.

Parameters
----------
H: gp_Hypr

Returns
-------
None
") Geom_Hyperbola;
		 Geom_Hyperbola(const gp_Hypr & H);

		/****************** Geom_Hyperbola ******************/
		%feature("compactdefaultargs") Geom_Hyperbola;
		%feature("autodoc", "Constructs a hyperbola defined by its major and minor radii, majorradius and minorradius, where a2 locates the hyperbola and defines its orientation in 3d space such that: - the center of the hyperbola is the origin of a2, - the 'x direction' of a2 defines the major axis of the hyperbola, i.e. the major radius majorradius is measured along this axis, - the 'y direction' of a2 defines the minor axis of the hyperbola, i.e. the minor radius minorradius is measured along this axis, - a2 is the local coordinate system of the hyperbola. exceptions standard_constructionerror if: - majorradius is less than 0.0, - minorradius is less than 0.0.

Parameters
----------
A2: gp_Ax2
MajorRadius: float
MinorRadius: float

Returns
-------
None
") Geom_Hyperbola;
		 Geom_Hyperbola(const gp_Ax2 & A2, const Standard_Real MajorRadius, const Standard_Real MinorRadius);

		/****************** Asymptote1 ******************/
		%feature("compactdefaultargs") Asymptote1;
		%feature("autodoc", "In the local coordinate system of the hyperbola the equation of the hyperbola is (x*x)/(a*a) - (y*y)/(b*b) = 1.0 and the equation of the first asymptote is y = (b/a)*x. raises constructionerror if majorradius = 0.0.

Returns
-------
gp_Ax1
") Asymptote1;
		gp_Ax1 Asymptote1();

		/****************** Asymptote2 ******************/
		%feature("compactdefaultargs") Asymptote2;
		%feature("autodoc", "In the local coordinate system of the hyperbola the equation of the hyperbola is (x*x)/(a*a) - (y*y)/(b*b) = 1.0 and the equation of the first asymptote is y = -(b/a)*x. raises constructionerror if majorradius = 0.0.

Returns
-------
gp_Ax1
") Asymptote2;
		gp_Ax1 Asymptote2();

		/****************** ConjugateBranch1 ******************/
		%feature("compactdefaultargs") ConjugateBranch1;
		%feature("autodoc", "This branch of hyperbola is on the positive side of the yaxis of <self>.

Returns
-------
gp_Hypr
") ConjugateBranch1;
		gp_Hypr ConjugateBranch1();

		/****************** ConjugateBranch2 ******************/
		%feature("compactdefaultargs") ConjugateBranch2;
		%feature("autodoc", "This branch of hyperbola is on the negative side of the yaxis of <self>. note: the diagram given under the class purpose indicates where these two branches of hyperbola are positioned in relation to this branch of hyperbola.

Returns
-------
gp_Hypr
") ConjugateBranch2;
		gp_Hypr ConjugateBranch2();

		/****************** Copy ******************/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "Creates a new object which is a copy of this hyperbola.

Returns
-------
opencascade::handle<Geom_Geometry>
") Copy;
		opencascade::handle<Geom_Geometry> Copy();

		/****************** D0 ******************/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "Returns in p the point of parameter u. p = c + majorradius * cosh (u) * xdir + minorradius * sinh (u) * ydir where c is the center of the hyperbola , xdir the xdirection and ydir the ydirection of the hyperbola's local coordinate system.

Parameters
----------
U: float
P: gp_Pnt

Returns
-------
None
") D0;
		void D0(const Standard_Real U, gp_Pnt & P);

		/****************** D1 ******************/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "Returns the point p of parameter u and the first derivative v1.

Parameters
----------
U: float
P: gp_Pnt
V1: gp_Vec

Returns
-------
None
") D1;
		void D1(const Standard_Real U, gp_Pnt & P, gp_Vec & V1);

		/****************** D2 ******************/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "Returns the point p of parameter u, the first and second derivatives v1 and v2.

Parameters
----------
U: float
P: gp_Pnt
V1: gp_Vec
V2: gp_Vec

Returns
-------
None
") D2;
		void D2(const Standard_Real U, gp_Pnt & P, gp_Vec & V1, gp_Vec & V2);

		/****************** D3 ******************/
		%feature("compactdefaultargs") D3;
		%feature("autodoc", "Returns the point p of parameter u, the first second and third derivatives v1 v2 and v3.

Parameters
----------
U: float
P: gp_Pnt
V1: gp_Vec
V2: gp_Vec
V3: gp_Vec

Returns
-------
None
") D3;
		void D3(const Standard_Real U, gp_Pnt & P, gp_Vec & V1, gp_Vec & V2, gp_Vec & V3);

		/****************** DN ******************/
		%feature("compactdefaultargs") DN;
		%feature("autodoc", "The returned vector gives the value of the derivative for the order of derivation n. raised if n < 1.

Parameters
----------
U: float
N: int

Returns
-------
gp_Vec
") DN;
		gp_Vec DN(const Standard_Real U, const Standard_Integer N);

		/****************** Directrix1 ******************/
		%feature("compactdefaultargs") Directrix1;
		%feature("autodoc", "This directrix is the line normal to the xaxis of the hyperbola in the local plane (z = 0) at a distance d = majorradius / e from the center of the hyperbola, where e is the eccentricity of the hyperbola. this line is parallel to the yaxis. the intersection point between directrix1 and the xaxis is the location point of the directrix1. this point is on the positive side of the xaxis.

Returns
-------
gp_Ax1
") Directrix1;
		gp_Ax1 Directrix1();

		/****************** Directrix2 ******************/
		%feature("compactdefaultargs") Directrix2;
		%feature("autodoc", "This line is obtained by the symmetrical transformation of 'directrix1' with respect to the yaxis of the hyperbola.

Returns
-------
gp_Ax1
") Directrix2;
		gp_Ax1 Directrix2();

		/****************** Eccentricity ******************/
		%feature("compactdefaultargs") Eccentricity;
		%feature("autodoc", "Returns the excentricity of the hyperbola (e > 1). if f is the distance between the location of the hyperbola and the focus1 then the eccentricity e = f / majorradius. raised if majorradius = 0.0.

Returns
-------
float
") Eccentricity;
		Standard_Real Eccentricity();

		/****************** FirstParameter ******************/
		%feature("compactdefaultargs") FirstParameter;
		%feature("autodoc", "Returns realfirst from standard.

Returns
-------
float
") FirstParameter;
		Standard_Real FirstParameter();

		/****************** Focal ******************/
		%feature("compactdefaultargs") Focal;
		%feature("autodoc", "Computes the focal distance. it is the distance between the two focus of the hyperbola.

Returns
-------
float
") Focal;
		Standard_Real Focal();

		/****************** Focus1 ******************/
		%feature("compactdefaultargs") Focus1;
		%feature("autodoc", "Returns the first focus of the hyperbola. this focus is on the positive side of the xaxis of the hyperbola.

Returns
-------
gp_Pnt
") Focus1;
		gp_Pnt Focus1();

		/****************** Focus2 ******************/
		%feature("compactdefaultargs") Focus2;
		%feature("autodoc", "Returns the second focus of the hyperbola. this focus is on the negative side of the xaxis of the hyperbola.

Returns
-------
gp_Pnt
") Focus2;
		gp_Pnt Focus2();

		/****************** Hypr ******************/
		%feature("compactdefaultargs") Hypr;
		%feature("autodoc", "Returns the non transient parabola from gp with the same geometric properties as <self>.

Returns
-------
gp_Hypr
") Hypr;
		gp_Hypr Hypr();

		/****************** IsClosed ******************/
		%feature("compactdefaultargs") IsClosed;
		%feature("autodoc", "Returns false.

Returns
-------
bool
") IsClosed;
		Standard_Boolean IsClosed();

		/****************** IsPeriodic ******************/
		%feature("compactdefaultargs") IsPeriodic;
		%feature("autodoc", "Return false for an hyperbola.

Returns
-------
bool
") IsPeriodic;
		Standard_Boolean IsPeriodic();

		/****************** LastParameter ******************/
		%feature("compactdefaultargs") LastParameter;
		%feature("autodoc", "Returns reallast from standard.

Returns
-------
float
") LastParameter;
		Standard_Real LastParameter();

		/****************** MajorRadius ******************/
		%feature("compactdefaultargs") MajorRadius;
		%feature("autodoc", "Returns the major or minor radius of this hyperbola. the major radius is also the distance between the center of the hyperbola and the apex of the main branch (located on the 'x axis' of the hyperbola).

Returns
-------
float
") MajorRadius;
		Standard_Real MajorRadius();

		/****************** MinorRadius ******************/
		%feature("compactdefaultargs") MinorRadius;
		%feature("autodoc", "Returns the major or minor radius of this hyperbola. the minor radius is also the distance between the center of the hyperbola and the apex of a conjugate branch (located on the 'y axis' of the hyperbola).

Returns
-------
float
") MinorRadius;
		Standard_Real MinorRadius();

		/****************** OtherBranch ******************/
		%feature("compactdefaultargs") OtherBranch;
		%feature("autodoc", "Computes the 'other' branch of this hyperbola. this is the symmetrical branch with respect to the center of this hyperbola. note: the diagram given under the class purpose indicates where the 'other' branch is positioned in relation to this branch of the hyperbola.

Returns
-------
gp_Hypr
") OtherBranch;
		gp_Hypr OtherBranch();

		/****************** Parameter ******************/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "Returns p = (e * e - 1) * majorradius where e is the eccentricity of the hyperbola. raised if majorradius = 0.0.

Returns
-------
float
") Parameter;
		Standard_Real Parameter();

		/****************** ReversedParameter ******************/
		%feature("compactdefaultargs") ReversedParameter;
		%feature("autodoc", "Computes the parameter on the reversed hyperbola, for the point of parameter u on this hyperbola. for a hyperbola, the returned value is: -u.

Parameters
----------
U: float

Returns
-------
float
") ReversedParameter;
		Standard_Real ReversedParameter(const Standard_Real U);

		/****************** SetHypr ******************/
		%feature("compactdefaultargs") SetHypr;
		%feature("autodoc", "Converts the gp_hypr hyperbola h into this hyperbola.

Parameters
----------
H: gp_Hypr

Returns
-------
None
") SetHypr;
		void SetHypr(const gp_Hypr & H);

		/****************** SetMajorRadius ******************/
		%feature("compactdefaultargs") SetMajorRadius;
		%feature("autodoc", "Assigns a value to the major radius of this hyperbola. exceptions standard_constructionerror if: - majorradius is less than 0.0, or - minorradius is less than 0.0.raised if majorradius < 0.0.

Parameters
----------
MajorRadius: float

Returns
-------
None
") SetMajorRadius;
		void SetMajorRadius(const Standard_Real MajorRadius);

		/****************** SetMinorRadius ******************/
		%feature("compactdefaultargs") SetMinorRadius;
		%feature("autodoc", "Assigns a value to the minor radius of this hyperbola. exceptions standard_constructionerror if: - majorradius is less than 0.0, or - minorradius is less than 0.0.raised if majorradius < 0.0.

Parameters
----------
MinorRadius: float

Returns
-------
None
") SetMinorRadius;
		void SetMinorRadius(const Standard_Real MinorRadius);

		/****************** Transform ******************/
		%feature("compactdefaultargs") Transform;
		%feature("autodoc", "Applies the transformation t to this hyperbola.

Parameters
----------
T: gp_Trsf

Returns
-------
None
") Transform;
		void Transform(const gp_Trsf & T);

};


%make_alias(Geom_Hyperbola)

%extend Geom_Hyperbola {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************
* class Geom_Parabola *
**********************/
class Geom_Parabola : public Geom_Conic {
	public:
		/****************** Geom_Parabola ******************/
		%feature("compactdefaultargs") Geom_Parabola;
		%feature("autodoc", "Creates a parabola from a non transient one.

Parameters
----------
Prb: gp_Parab

Returns
-------
None
") Geom_Parabola;
		 Geom_Parabola(const gp_Parab & Prb);

		/****************** Geom_Parabola ******************/
		%feature("compactdefaultargs") Geom_Parabola;
		%feature("autodoc", "Creates a parabola with its local coordinate system 'a2' and it's focal length 'focal'. the xdirection of a2 defines the axis of symmetry of the parabola. the ydirection of a2 is parallel to the directrix of the parabola. the location point of a2 is the vertex of the parabola raised if focal < 0.0.

Parameters
----------
A2: gp_Ax2
Focal: float

Returns
-------
None
") Geom_Parabola;
		 Geom_Parabola(const gp_Ax2 & A2, const Standard_Real Focal);

		/****************** Geom_Parabola ******************/
		%feature("compactdefaultargs") Geom_Parabola;
		%feature("autodoc", "D is the directrix of the parabola and f the focus point. the symmetry axis (xaxis) of the parabola is normal to the directrix and pass through the focus point f, but its location point is the vertex of the parabola. the yaxis of the parabola is parallel to d and its location point is the vertex of the parabola. the normal to the plane of the parabola is the cross product between the xaxis and the yaxis.

Parameters
----------
D: gp_Ax1
F: gp_Pnt

Returns
-------
None
") Geom_Parabola;
		 Geom_Parabola(const gp_Ax1 & D, const gp_Pnt & F);

		/****************** Copy ******************/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "Creates a new object which is a copy of this parabola.

Returns
-------
opencascade::handle<Geom_Geometry>
") Copy;
		opencascade::handle<Geom_Geometry> Copy();

		/****************** D0 ******************/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "Returns in p the point of parameter u. if u = 0 the returned point is the origin of the xaxis and the yaxis of the parabola and it is the vertex of the parabola. p = s + f * (u * u * xdir + * u * ydir) where s is the vertex of the parabola, xdir the xdirection and ydir the ydirection of the parabola's local coordinate system.

Parameters
----------
U: float
P: gp_Pnt

Returns
-------
None
") D0;
		void D0(const Standard_Real U, gp_Pnt & P);

		/****************** D1 ******************/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "Returns the point p of parameter u and the first derivative v1.

Parameters
----------
U: float
P: gp_Pnt
V1: gp_Vec

Returns
-------
None
") D1;
		void D1(const Standard_Real U, gp_Pnt & P, gp_Vec & V1);

		/****************** D2 ******************/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "Returns the point p of parameter u, the first and second derivatives v1 and v2.

Parameters
----------
U: float
P: gp_Pnt
V1: gp_Vec
V2: gp_Vec

Returns
-------
None
") D2;
		void D2(const Standard_Real U, gp_Pnt & P, gp_Vec & V1, gp_Vec & V2);

		/****************** D3 ******************/
		%feature("compactdefaultargs") D3;
		%feature("autodoc", "Returns the point p of parameter u, the first second and third derivatives v1 v2 and v3.

Parameters
----------
U: float
P: gp_Pnt
V1: gp_Vec
V2: gp_Vec
V3: gp_Vec

Returns
-------
None
") D3;
		void D3(const Standard_Real U, gp_Pnt & P, gp_Vec & V1, gp_Vec & V2, gp_Vec & V3);

		/****************** DN ******************/
		%feature("compactdefaultargs") DN;
		%feature("autodoc", "For the point of parameter u of this parabola, computes the vector corresponding to the nth derivative. exceptions standard_rangeerror if n is less than 1.

Parameters
----------
U: float
N: int

Returns
-------
gp_Vec
") DN;
		gp_Vec DN(const Standard_Real U, const Standard_Integer N);

		/****************** Directrix ******************/
		%feature("compactdefaultargs") Directrix;
		%feature("autodoc", "Computes the directrix of this parabola. this is a line normal to the axis of symmetry, in the plane of this parabola, located on the negative side of its axis of symmetry, at a distance from the apex equal to the focal length. the directrix is returned as an axis (gp_ax1 object), where the origin is located on the 'x axis' of this parabola.

Returns
-------
gp_Ax1
") Directrix;
		gp_Ax1 Directrix();

		/****************** Eccentricity ******************/
		%feature("compactdefaultargs") Eccentricity;
		%feature("autodoc", "Returns 1. (which is the eccentricity of any parabola).

Returns
-------
float
") Eccentricity;
		Standard_Real Eccentricity();

		/****************** FirstParameter ******************/
		%feature("compactdefaultargs") FirstParameter;
		%feature("autodoc", "Returns the value of the first or last parameter of this parabola. this is, respectively: - standard_real::realfirst(), or - standard_real::reallast().

Returns
-------
float
") FirstParameter;
		Standard_Real FirstParameter();

		/****************** Focal ******************/
		%feature("compactdefaultargs") Focal;
		%feature("autodoc", "Computes the focal distance of this parabola the focal distance is the distance between the apex and the focus of the parabola.

Returns
-------
float
") Focal;
		Standard_Real Focal();

		/****************** Focus ******************/
		%feature("compactdefaultargs") Focus;
		%feature("autodoc", "Computes the focus of this parabola. the focus is on the positive side of the 'x axis' of the local coordinate system of the parabola.

Returns
-------
gp_Pnt
") Focus;
		gp_Pnt Focus();

		/****************** IsClosed ******************/
		%feature("compactdefaultargs") IsClosed;
		%feature("autodoc", "Returns false.

Returns
-------
bool
") IsClosed;
		Standard_Boolean IsClosed();

		/****************** IsPeriodic ******************/
		%feature("compactdefaultargs") IsPeriodic;
		%feature("autodoc", "Returns false.

Returns
-------
bool
") IsPeriodic;
		Standard_Boolean IsPeriodic();

		/****************** LastParameter ******************/
		%feature("compactdefaultargs") LastParameter;
		%feature("autodoc", "Returns the value of the first or last parameter of this parabola. this is, respectively: - standard_real::realfirst(), or - standard_real::reallast().

Returns
-------
float
") LastParameter;
		Standard_Real LastParameter();

		/****************** Parab ******************/
		%feature("compactdefaultargs") Parab;
		%feature("autodoc", "Returns the non transient parabola from gp with the same geometric properties as <self>.

Returns
-------
gp_Parab
") Parab;
		gp_Parab Parab();

		/****************** Parameter ******************/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "Computes the parameter of this parabola which is the distance between its focus and its directrix. this distance is twice the focal length. if p is the parameter of the parabola, the equation of the parabola in its local coordinate system is: y**2 = 2.*p*x.

Returns
-------
float
") Parameter;
		Standard_Real Parameter();

		/****************** ParametricTransformation ******************/
		%feature("compactdefaultargs") ParametricTransformation;
		%feature("autodoc", "Returns a coefficient to compute the parameter on the transformed curve for the transform of the point on <self>. //! transformed(t)->value(u * parametrictransformation(t)) //! is the same point as //! value(u).transformed(t) //! this methods returns t.scalefactor().

Parameters
----------
T: gp_Trsf

Returns
-------
float
") ParametricTransformation;
		Standard_Real ParametricTransformation(const gp_Trsf & T);

		/****************** ReversedParameter ******************/
		%feature("compactdefaultargs") ReversedParameter;
		%feature("autodoc", "Computes the parameter on the reversed parabola, for the point of parameter u on this parabola. for a parabola, the returned value is: -u.

Parameters
----------
U: float

Returns
-------
float
") ReversedParameter;
		Standard_Real ReversedParameter(const Standard_Real U);

		/****************** SetFocal ******************/
		%feature("compactdefaultargs") SetFocal;
		%feature("autodoc", "Assigns the value focal to the focal distance of this parabola. exceptions standard_constructionerror if focal is negative.

Parameters
----------
Focal: float

Returns
-------
None
") SetFocal;
		void SetFocal(const Standard_Real Focal);

		/****************** SetParab ******************/
		%feature("compactdefaultargs") SetParab;
		%feature("autodoc", "Converts the gp_parab parabola prb into this parabola.

Parameters
----------
Prb: gp_Parab

Returns
-------
None
") SetParab;
		void SetParab(const gp_Parab & Prb);

		/****************** Transform ******************/
		%feature("compactdefaultargs") Transform;
		%feature("autodoc", "Applies the transformation t to this parabola.

Parameters
----------
T: gp_Trsf

Returns
-------
None
") Transform;
		void Transform(const gp_Trsf & T);

		/****************** TransformedParameter ******************/
		%feature("compactdefaultargs") TransformedParameter;
		%feature("autodoc", "Returns the parameter on the transformed curve for the transform of the point of parameter u on <self>. //! me->transformed(t)->value(me->transformedparameter(u,t)) //! is the same point as //! me->value(u).transformed(t) //! this methods returns <u> * t.scalefactor().

Parameters
----------
U: float
T: gp_Trsf

Returns
-------
float
") TransformedParameter;
		Standard_Real TransformedParameter(const Standard_Real U, const gp_Trsf & T);

};


%make_alias(Geom_Parabola)

%extend Geom_Parabola {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************
* class Geom_Plane *
*******************/
class Geom_Plane : public Geom_ElementarySurface {
	public:
		/****************** Geom_Plane ******************/
		%feature("compactdefaultargs") Geom_Plane;
		%feature("autodoc", "Creates a plane located in 3d space with an axis placement three axis. the 'zdirection' of 'a3' is the direction normal to the plane. the 'location' point of 'a3' is the origin of the plane. the 'xdirection' and 'ydirection' of 'a3' define the directions of the u isoparametric and v isoparametric curves.

Parameters
----------
A3: gp_Ax3

Returns
-------
None
") Geom_Plane;
		 Geom_Plane(const gp_Ax3 & A3);

		/****************** Geom_Plane ******************/
		%feature("compactdefaultargs") Geom_Plane;
		%feature("autodoc", "Creates a plane from a non transient plane from package gp.

Parameters
----------
Pl: gp_Pln

Returns
-------
None
") Geom_Plane;
		 Geom_Plane(const gp_Pln & Pl);

		/****************** Geom_Plane ******************/
		%feature("compactdefaultargs") Geom_Plane;
		%feature("autodoc", "P is the 'location' point or origin of the plane. v is the direction normal to the plane.

Parameters
----------
P: gp_Pnt
V: gp_Dir

Returns
-------
None
") Geom_Plane;
		 Geom_Plane(const gp_Pnt & P, const gp_Dir & V);

		/****************** Geom_Plane ******************/
		%feature("compactdefaultargs") Geom_Plane;
		%feature("autodoc", "Creates a plane from its cartesian equation : ax + by + cz + d = 0.0 //! raised if sqrt (a*a + b*b + c*c) <= resolution from gp.

Parameters
----------
A: float
B: float
C: float
D: float

Returns
-------
None
") Geom_Plane;
		 Geom_Plane(const Standard_Real A, const Standard_Real B, const Standard_Real C, const Standard_Real D);

		/****************** Bounds ******************/
		%feature("compactdefaultargs") Bounds;
		%feature("autodoc", "Returns the parametric bounds u1, u2, v1 and v2 of this plane. because a plane is an infinite surface, the following is always true: - u1 = v1 = standard_real::realfirst() - u2 = v2 = standard_real::reallast().

Parameters
----------

Returns
-------
U1: float
U2: float
V1: float
V2: float
") Bounds;
		void Bounds(Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** Coefficients ******************/
		%feature("compactdefaultargs") Coefficients;
		%feature("autodoc", "Computes the normalized coefficients of the plane's cartesian equation : ax + by + cz + d = 0.0.

Parameters
----------

Returns
-------
A: float
B: float
C: float
D: float
") Coefficients;
		void Coefficients(Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** Copy ******************/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "Creates a new object which is a copy of this plane.

Returns
-------
opencascade::handle<Geom_Geometry>
") Copy;
		opencascade::handle<Geom_Geometry> Copy();

		/****************** D0 ******************/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "Computes the point p (u, v) on <self>. p = o + u * xdir + v * ydir. where o is the 'location' point of the plane, xdir the 'xdirection' and ydir the 'ydirection' of the plane's local coordinate system.

Parameters
----------
U: float
V: float
P: gp_Pnt

Returns
-------
None
") D0;
		void D0(const Standard_Real U, const Standard_Real V, gp_Pnt & P);

		/****************** D1 ******************/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "Computes the current point and the first derivatives in the directions u and v.

Parameters
----------
U: float
V: float
P: gp_Pnt
D1U: gp_Vec
D1V: gp_Vec

Returns
-------
None
") D1;
		void D1(const Standard_Real U, const Standard_Real V, gp_Pnt & P, gp_Vec & D1U, gp_Vec & D1V);

		/****************** D2 ******************/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "Computes the current point, the first and the second derivatives in the directions u and v.

Parameters
----------
U: float
V: float
P: gp_Pnt
D1U: gp_Vec
D1V: gp_Vec
D2U: gp_Vec
D2V: gp_Vec
D2UV: gp_Vec

Returns
-------
None
") D2;
		void D2(const Standard_Real U, const Standard_Real V, gp_Pnt & P, gp_Vec & D1U, gp_Vec & D1V, gp_Vec & D2U, gp_Vec & D2V, gp_Vec & D2UV);

		/****************** D3 ******************/
		%feature("compactdefaultargs") D3;
		%feature("autodoc", "Computes the current point, the first,the second and the third derivatives in the directions u and v.

Parameters
----------
U: float
V: float
P: gp_Pnt
D1U: gp_Vec
D1V: gp_Vec
D2U: gp_Vec
D2V: gp_Vec
D2UV: gp_Vec
D3U: gp_Vec
D3V: gp_Vec
D3UUV: gp_Vec
D3UVV: gp_Vec

Returns
-------
None
") D3;
		void D3(const Standard_Real U, const Standard_Real V, gp_Pnt & P, gp_Vec & D1U, gp_Vec & D1V, gp_Vec & D2U, gp_Vec & D2V, gp_Vec & D2UV, gp_Vec & D3U, gp_Vec & D3V, gp_Vec & D3UUV, gp_Vec & D3UVV);

		/****************** DN ******************/
		%feature("compactdefaultargs") DN;
		%feature("autodoc", "Computes the derivative of order nu in the direction u and nv in the direction v. raised if nu + nv < 1 or nu < 0 or nv < 0.

Parameters
----------
U: float
V: float
Nu: int
Nv: int

Returns
-------
gp_Vec
") DN;
		gp_Vec DN(const Standard_Real U, const Standard_Real V, const Standard_Integer Nu, const Standard_Integer Nv);

		/****************** IsUClosed ******************/
		%feature("compactdefaultargs") IsUClosed;
		%feature("autodoc", "Return false.

Returns
-------
bool
") IsUClosed;
		Standard_Boolean IsUClosed();

		/****************** IsUPeriodic ******************/
		%feature("compactdefaultargs") IsUPeriodic;
		%feature("autodoc", "Return false.

Returns
-------
bool
") IsUPeriodic;
		Standard_Boolean IsUPeriodic();

		/****************** IsVClosed ******************/
		%feature("compactdefaultargs") IsVClosed;
		%feature("autodoc", "Return false.

Returns
-------
bool
") IsVClosed;
		Standard_Boolean IsVClosed();

		/****************** IsVPeriodic ******************/
		%feature("compactdefaultargs") IsVPeriodic;
		%feature("autodoc", "Return false.

Returns
-------
bool
") IsVPeriodic;
		Standard_Boolean IsVPeriodic();

		/****************** ParametricTransformation ******************/
		%feature("compactdefaultargs") ParametricTransformation;
		%feature("autodoc", "Returns a 2d transformation used to find the new parameters of a point on the transformed surface. me->transformed(t)->value(u',v') is the same point as me->value(u,v).transformed(t) where u',v' are obtained by transforming u,v with th 2d transformation returned by me->parametrictransformation(t) this methods returns a scale centered on the origin with t.scalefactor.

Parameters
----------
T: gp_Trsf

Returns
-------
gp_GTrsf2d
") ParametricTransformation;
		virtual gp_GTrsf2d ParametricTransformation(const gp_Trsf & T);

		/****************** Pln ******************/
		%feature("compactdefaultargs") Pln;
		%feature("autodoc", "Converts this plane into a gp_pln plane.

Returns
-------
gp_Pln
") Pln;
		gp_Pln Pln();

		/****************** SetPln ******************/
		%feature("compactdefaultargs") SetPln;
		%feature("autodoc", "Set <self> so that <self> has the same geometric properties as pl.

Parameters
----------
Pl: gp_Pln

Returns
-------
None
") SetPln;
		void SetPln(const gp_Pln & Pl);

		/****************** Transform ******************/
		%feature("compactdefaultargs") Transform;
		%feature("autodoc", "Applies the transformation t to this plane.

Parameters
----------
T: gp_Trsf

Returns
-------
None
") Transform;
		void Transform(const gp_Trsf & T);

		/****************** TransformParameters ******************/
		%feature("compactdefaultargs") TransformParameters;
		%feature("autodoc", "Computes the parameters on the transformed surface for the transform of the point of parameters u,v on <self>. me->transformed(t)->value(u',v') is the same point as me->value(u,v).transformed(t) where u',v' are the new values of u,v after calling me->tranformparameters(u,v,t) this methods multiplies u and v by t.scalefactor().

Parameters
----------
T: gp_Trsf

Returns
-------
U: float
V: float
") TransformParameters;
		virtual void TransformParameters(Standard_Real &OutValue, Standard_Real &OutValue, const gp_Trsf & T);

		/****************** UIso ******************/
		%feature("compactdefaultargs") UIso;
		%feature("autodoc", "Computes the u isoparametric curve. this is a line parallel to the yaxis of the plane.

Parameters
----------
U: float

Returns
-------
opencascade::handle<Geom_Curve>
") UIso;
		opencascade::handle<Geom_Curve> UIso(const Standard_Real U);

		/****************** UReverse ******************/
		%feature("compactdefaultargs") UReverse;
		%feature("autodoc", "Changes the orientation of this plane in the u (or v) parametric direction. the bounds of the plane are not changed but the given parametric direction is reversed. hence the orientation of the surface is reversed.

Returns
-------
None
") UReverse;
		virtual void UReverse();

		/****************** UReversedParameter ******************/
		%feature("compactdefaultargs") UReversedParameter;
		%feature("autodoc", "Computes the u parameter on the modified plane, produced when reversing the u parametric of this plane, for any point of u parameter u on this plane. in the case of a plane, these methods return - -u.

Parameters
----------
U: float

Returns
-------
float
") UReversedParameter;
		Standard_Real UReversedParameter(const Standard_Real U);

		/****************** VIso ******************/
		%feature("compactdefaultargs") VIso;
		%feature("autodoc", "Computes the v isoparametric curve. this is a line parallel to the xaxis of the plane.

Parameters
----------
V: float

Returns
-------
opencascade::handle<Geom_Curve>
") VIso;
		opencascade::handle<Geom_Curve> VIso(const Standard_Real V);

		/****************** VReverse ******************/
		%feature("compactdefaultargs") VReverse;
		%feature("autodoc", "Changes the orientation of this plane in the u (or v) parametric direction. the bounds of the plane are not changed but the given parametric direction is reversed. hence the orientation of the surface is reversed.

Returns
-------
None
") VReverse;
		virtual void VReverse();

		/****************** VReversedParameter ******************/
		%feature("compactdefaultargs") VReversedParameter;
		%feature("autodoc", "Computes the v parameter on the modified plane, produced when reversing the v parametric of this plane, for any point of v parameter v on this plane. in the case of a plane, these methods return -v.

Parameters
----------
V: float

Returns
-------
float
") VReversedParameter;
		Standard_Real VReversedParameter(const Standard_Real V);

};


%make_alias(Geom_Plane)

%extend Geom_Plane {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************************
* class Geom_RectangularTrimmedSurface *
***************************************/
class Geom_RectangularTrimmedSurface : public Geom_BoundedSurface {
	public:
		/****************** Geom_RectangularTrimmedSurface ******************/
		%feature("compactdefaultargs") Geom_RectangularTrimmedSurface;
		%feature("autodoc", "The u parametric direction of the surface is oriented from u1 to u2. the v parametric direction of the surface is oriented from v1 to v2. these two directions define the orientation of the surface (normal). if the surface is not periodic usense and vsense are not used for the construction. if the surface s is periodic in one direction usense and vsense give the available part of the surface. by default in this case the surface has the same orientation as the basis surface s. the returned surface is not closed and not periodic. constructionerror raised if s is not periodic in the udirection and u1 or u2 are out of the bounds of s. s is not periodic in the vdirection and v1 or v2 are out of the bounds of s. u1 = u2 or v1 = v2.

Parameters
----------
S: Geom_Surface
U1: float
U2: float
V1: float
V2: float
USense: bool,optional
	default value is Standard_True
VSense: bool,optional
	default value is Standard_True

Returns
-------
None
") Geom_RectangularTrimmedSurface;
		 Geom_RectangularTrimmedSurface(const opencascade::handle<Geom_Surface> & S, const Standard_Real U1, const Standard_Real U2, const Standard_Real V1, const Standard_Real V2, const Standard_Boolean USense = Standard_True, const Standard_Boolean VSense = Standard_True);

		/****************** Geom_RectangularTrimmedSurface ******************/
		%feature("compactdefaultargs") Geom_RectangularTrimmedSurface;
		%feature("autodoc", "The basis surface s is only trim in one parametric direction. if utrim = true the surface is trimmed in the u parametric direction else the surface is trimmed in the v parametric direction. in the considered parametric direction the resulting surface is oriented from param1 to param2. if s is periodic sense gives the available part of the surface. by default the trimmed surface has the same orientation as the basis surface s in the considered parametric direction (sense = true). if the basis surface s is closed or periodic in the parametric direction opposite to the trimming direction the trimmed surface has the same characteristics as the surface s in this direction. warnings : in this package the entities are not shared. the rectangulartrimmedsurface is built with a copy of the surface s. so when s is modified the rectangulartrimmedsurface is not modified raised if s is not periodic in the considered parametric direction and param1 or param2 are out of the bounds of s. param1 = param2.

Parameters
----------
S: Geom_Surface
Param1: float
Param2: float
UTrim: bool
Sense: bool,optional
	default value is Standard_True

Returns
-------
None
") Geom_RectangularTrimmedSurface;
		 Geom_RectangularTrimmedSurface(const opencascade::handle<Geom_Surface> & S, const Standard_Real Param1, const Standard_Real Param2, const Standard_Boolean UTrim, const Standard_Boolean Sense = Standard_True);

		/****************** BasisSurface ******************/
		%feature("compactdefaultargs") BasisSurface;
		%feature("autodoc", "Returns the basis surface of <self>.

Returns
-------
opencascade::handle<Geom_Surface>
") BasisSurface;
		opencascade::handle<Geom_Surface> BasisSurface();

		/****************** Bounds ******************/
		%feature("compactdefaultargs") Bounds;
		%feature("autodoc", "Returns the parametric bounds u1, u2, v1 and v2 of this patch.

Parameters
----------

Returns
-------
U1: float
U2: float
V1: float
V2: float
") Bounds;
		void Bounds(Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** Continuity ******************/
		%feature("compactdefaultargs") Continuity;
		%feature("autodoc", "Returns the continuity of the surface : c0 : only geometric continuity, c1 : continuity of the first derivative all along the surface, c2 : continuity of the second derivative all along the surface, c3 : continuity of the third derivative all along the surface, cn : the order of continuity is infinite.

Returns
-------
GeomAbs_Shape
") Continuity;
		GeomAbs_Shape Continuity();

		/****************** Copy ******************/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "Creates a new object which is a copy of this patch.

Returns
-------
opencascade::handle<Geom_Geometry>
") Copy;
		opencascade::handle<Geom_Geometry> Copy();

		/****************** D0 ******************/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "Can be raised if the basis surface is an offsetsurface.

Parameters
----------
U: float
V: float
P: gp_Pnt

Returns
-------
None
") D0;
		void D0(const Standard_Real U, const Standard_Real V, gp_Pnt & P);

		/****************** D1 ******************/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "The returned derivatives have the same orientation as the derivatives of the basis surface even if the trimmed surface has not the same parametric orientation. warning! undefinedderivative raised if the continuity of the surface is not c1.

Parameters
----------
U: float
V: float
P: gp_Pnt
D1U: gp_Vec
D1V: gp_Vec

Returns
-------
None
") D1;
		void D1(const Standard_Real U, const Standard_Real V, gp_Pnt & P, gp_Vec & D1U, gp_Vec & D1V);

		/****************** D2 ******************/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "The returned derivatives have the same orientation as the derivatives of the basis surface even if the trimmed surface has not the same parametric orientation. warning! undefinedderivative raised if the continuity of the surface is not c2.

Parameters
----------
U: float
V: float
P: gp_Pnt
D1U: gp_Vec
D1V: gp_Vec
D2U: gp_Vec
D2V: gp_Vec
D2UV: gp_Vec

Returns
-------
None
") D2;
		void D2(const Standard_Real U, const Standard_Real V, gp_Pnt & P, gp_Vec & D1U, gp_Vec & D1V, gp_Vec & D2U, gp_Vec & D2V, gp_Vec & D2UV);

		/****************** D3 ******************/
		%feature("compactdefaultargs") D3;
		%feature("autodoc", "The returned derivatives have the same orientation as the derivatives of the basis surface even if the trimmed surface has not the same parametric orientation. warning undefinedderivative raised if the continuity of the surface is not c3.

Parameters
----------
U: float
V: float
P: gp_Pnt
D1U: gp_Vec
D1V: gp_Vec
D2U: gp_Vec
D2V: gp_Vec
D2UV: gp_Vec
D3U: gp_Vec
D3V: gp_Vec
D3UUV: gp_Vec
D3UVV: gp_Vec

Returns
-------
None
") D3;
		void D3(const Standard_Real U, const Standard_Real V, gp_Pnt & P, gp_Vec & D1U, gp_Vec & D1V, gp_Vec & D2U, gp_Vec & D2V, gp_Vec & D2UV, gp_Vec & D3U, gp_Vec & D3V, gp_Vec & D3UUV, gp_Vec & D3UVV);

		/****************** DN ******************/
		%feature("compactdefaultargs") DN;
		%feature("autodoc", "The returned derivative has the same orientation as the derivative of the basis surface even if the trimmed surface has not the same parametric orientation. warning! undefinedderivative raised if the continuity of the surface is not cnu in the u parametric direction and cnv in the v parametric direction. rangeerror raised if nu + nv < 1 or nu < 0 or nv < 0.

Parameters
----------
U: float
V: float
Nu: int
Nv: int

Returns
-------
gp_Vec
") DN;
		gp_Vec DN(const Standard_Real U, const Standard_Real V, const Standard_Integer Nu, const Standard_Integer Nv);

		/****************** IsCNu ******************/
		%feature("compactdefaultargs") IsCNu;
		%feature("autodoc", "Returns true if the order of derivation in the u parametric direction is n. raised if n < 0.

Parameters
----------
N: int

Returns
-------
bool
") IsCNu;
		Standard_Boolean IsCNu(const Standard_Integer N);

		/****************** IsCNv ******************/
		%feature("compactdefaultargs") IsCNv;
		%feature("autodoc", "Returns true if the order of derivation in the v parametric direction is n. raised if n < 0.

Parameters
----------
N: int

Returns
-------
bool
") IsCNv;
		Standard_Boolean IsCNv(const Standard_Integer N);

		/****************** IsUClosed ******************/
		%feature("compactdefaultargs") IsUClosed;
		%feature("autodoc", "Returns true if this patch is closed in the given parametric direction.

Returns
-------
bool
") IsUClosed;
		Standard_Boolean IsUClosed();

		/****************** IsUPeriodic ******************/
		%feature("compactdefaultargs") IsUPeriodic;
		%feature("autodoc", "Returns true if this patch is periodic and not trimmed in the given parametric direction.

Returns
-------
bool
") IsUPeriodic;
		Standard_Boolean IsUPeriodic();

		/****************** IsVClosed ******************/
		%feature("compactdefaultargs") IsVClosed;
		%feature("autodoc", "Returns true if this patch is closed in the given parametric direction.

Returns
-------
bool
") IsVClosed;
		Standard_Boolean IsVClosed();

		/****************** IsVPeriodic ******************/
		%feature("compactdefaultargs") IsVPeriodic;
		%feature("autodoc", "Returns true if this patch is periodic and not trimmed in the given parametric direction.

Returns
-------
bool
") IsVPeriodic;
		Standard_Boolean IsVPeriodic();

		/****************** ParametricTransformation ******************/
		%feature("compactdefaultargs") ParametricTransformation;
		%feature("autodoc", "Returns a 2d transformation used to find the new parameters of a point on the transformed surface. //! me->transformed(t)->value(u',v') //! is the same point as //! me->value(u,v).transformed(t) //! where u',v' are obtained by transforming u,v with th 2d transformation returned by //! me->parametrictransformation(t) //! this methods calls the basis surface method.

Parameters
----------
T: gp_Trsf

Returns
-------
gp_GTrsf2d
") ParametricTransformation;
		virtual gp_GTrsf2d ParametricTransformation(const gp_Trsf & T);

		/****************** SetTrim ******************/
		%feature("compactdefaultargs") SetTrim;
		%feature("autodoc", "Modifies this patch by changing the trim values applied to the original surface the u parametric direction of this patch is oriented from u1 to u2. the v parametric direction of this patch is oriented from v1 to v2. usense and vsense are used for the construction only if the surface is periodic in the corresponding parametric direction, and define the available part of the surface; by default in this case, this patch has the same orientation as the basis surface. raised if the basissurface is not periodic in the udirection and u1 or u2 are out of the bounds of the basissurface. the basissurface is not periodic in the vdirection and v1 or v2 are out of the bounds of the basissurface. u1 = u2 or v1 = v2.

Parameters
----------
U1: float
U2: float
V1: float
V2: float
USense: bool,optional
	default value is Standard_True
VSense: bool,optional
	default value is Standard_True

Returns
-------
None
") SetTrim;
		void SetTrim(const Standard_Real U1, const Standard_Real U2, const Standard_Real V1, const Standard_Real V2, const Standard_Boolean USense = Standard_True, const Standard_Boolean VSense = Standard_True);

		/****************** SetTrim ******************/
		%feature("compactdefaultargs") SetTrim;
		%feature("autodoc", "Modifies this patch by changing the trim values applied to the original surface the basis surface is trimmed only in one parametric direction: if utrim is true, the surface is trimmed in the u parametric direction; if it is false, it is trimmed in the v parametric direction. in the 'trimmed' direction, this patch is oriented from param1 to param2. if the basis surface is periodic in the 'trimmed' direction, sense defines its available part. by default in this case, this patch has the same orientation as the basis surface in this parametric direction. if the basis surface is closed or periodic in the other parametric direction (i.e. not the 'trimmed' direction), this patch has the same characteristics as the basis surface in that parametric direction. raised if the basissurface is not periodic in the considered direction and param1 or param2 are out of the bounds of the basissurface. param1 = param2.

Parameters
----------
Param1: float
Param2: float
UTrim: bool
Sense: bool,optional
	default value is Standard_True

Returns
-------
None
") SetTrim;
		void SetTrim(const Standard_Real Param1, const Standard_Real Param2, const Standard_Boolean UTrim, const Standard_Boolean Sense = Standard_True);

		/****************** Transform ******************/
		%feature("compactdefaultargs") Transform;
		%feature("autodoc", "Applies the transformation t to this patch. warning as a consequence, the basis surface included in the data structure of this patch is also modified.

Parameters
----------
T: gp_Trsf

Returns
-------
None
") Transform;
		void Transform(const gp_Trsf & T);

		/****************** TransformParameters ******************/
		%feature("compactdefaultargs") TransformParameters;
		%feature("autodoc", "Computes the parameters on the transformed surface for the transform of the point of parameters u,v on <self>. //! me->transformed(t)->value(u',v') //! is the same point as //! me->value(u,v).transformed(t) //! where u',v' are the new values of u,v after calling //! me->tranformparameters(u,v,t) //! this methods calls the basis surface method.

Parameters
----------
T: gp_Trsf

Returns
-------
U: float
V: float
") TransformParameters;
		virtual void TransformParameters(Standard_Real &OutValue, Standard_Real &OutValue, const gp_Trsf & T);

		/****************** UIso ******************/
		%feature("compactdefaultargs") UIso;
		%feature("autodoc", "Computes the u isoparametric curve.

Parameters
----------
U: float

Returns
-------
opencascade::handle<Geom_Curve>
") UIso;
		opencascade::handle<Geom_Curve> UIso(const Standard_Real U);

		/****************** UPeriod ******************/
		%feature("compactdefaultargs") UPeriod;
		%feature("autodoc", "Returns the period of this patch in the u parametric direction. raises if the surface is not uperiodic.

Returns
-------
float
") UPeriod;
		virtual Standard_Real UPeriod();

		/****************** UReverse ******************/
		%feature("compactdefaultargs") UReverse;
		%feature("autodoc", "Changes the orientation of this patch in the u parametric direction. the bounds of the surface are not changed, but the given parametric direction is reversed. hence the orientation of the surface is reversed.

Returns
-------
None
") UReverse;
		void UReverse();

		/****************** UReversedParameter ******************/
		%feature("compactdefaultargs") UReversedParameter;
		%feature("autodoc", "Computes the u parameter on the modified surface, produced by when reversing its u parametric direction, for any point of u parameter u on this patch.

Parameters
----------
U: float

Returns
-------
float
") UReversedParameter;
		Standard_Real UReversedParameter(const Standard_Real U);

		/****************** VIso ******************/
		%feature("compactdefaultargs") VIso;
		%feature("autodoc", "Computes the v isoparametric curve.

Parameters
----------
V: float

Returns
-------
opencascade::handle<Geom_Curve>
") VIso;
		opencascade::handle<Geom_Curve> VIso(const Standard_Real V);

		/****************** VPeriod ******************/
		%feature("compactdefaultargs") VPeriod;
		%feature("autodoc", "Returns the period of this patch in the v parametric direction. raises if the surface is not vperiodic. value and derivatives.

Returns
-------
float
") VPeriod;
		virtual Standard_Real VPeriod();

		/****************** VReverse ******************/
		%feature("compactdefaultargs") VReverse;
		%feature("autodoc", "Changes the orientation of this patch in the v parametric direction. the bounds of the surface are not changed, but the given parametric direction is reversed. hence the orientation of the surface is reversed.

Returns
-------
None
") VReverse;
		void VReverse();

		/****************** VReversedParameter ******************/
		%feature("compactdefaultargs") VReversedParameter;
		%feature("autodoc", "Computes the v parameter on the modified surface, produced by when reversing its v parametric direction, for any point of v parameter v on this patch.

Parameters
----------
V: float

Returns
-------
float
") VReversedParameter;
		Standard_Real VReversedParameter(const Standard_Real V);

};


%make_alias(Geom_RectangularTrimmedSurface)

%extend Geom_RectangularTrimmedSurface {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************
* class Geom_SphericalSurface *
******************************/
class Geom_SphericalSurface : public Geom_ElementarySurface {
	public:
		/****************** Geom_SphericalSurface ******************/
		%feature("compactdefaultargs") Geom_SphericalSurface;
		%feature("autodoc", "A3 is the local coordinate system of the surface. at the creation the parametrization of the surface is defined such as the normal vector (n = d1u ^ d1v) is directed away from the center of the sphere. the direction of increasing parametric value v is defined by the rotation around the 'ydirection' of a2 in the trigonometric sense and the orientation of increasing parametric value u is defined by the rotation around the main direction of a2 in the trigonometric sense. warnings : it is not forbidden to create a spherical surface with radius = 0.0 raised if radius < 0.0.

Parameters
----------
A3: gp_Ax3
Radius: float

Returns
-------
None
") Geom_SphericalSurface;
		 Geom_SphericalSurface(const gp_Ax3 & A3, const Standard_Real Radius);

		/****************** Geom_SphericalSurface ******************/
		%feature("compactdefaultargs") Geom_SphericalSurface;
		%feature("autodoc", "Creates a sphericalsurface from a non persistent sphere from package gp.

Parameters
----------
S: gp_Sphere

Returns
-------
None
") Geom_SphericalSurface;
		 Geom_SphericalSurface(const gp_Sphere & S);

		/****************** Area ******************/
		%feature("compactdefaultargs") Area;
		%feature("autodoc", "Computes the aera of the spherical surface.

Returns
-------
float
") Area;
		Standard_Real Area();

		/****************** Bounds ******************/
		%feature("compactdefaultargs") Bounds;
		%feature("autodoc", "Returns the parametric bounds u1, u2, v1 and v2 of this sphere. for a sphere: u1 = 0, u2 = 2*pi, v1 = -pi/2, v2 = pi/2.

Parameters
----------

Returns
-------
U1: float
U2: float
V1: float
V2: float
") Bounds;
		void Bounds(Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** Coefficients ******************/
		%feature("compactdefaultargs") Coefficients;
		%feature("autodoc", "Returns the coefficients of the implicit equation of the quadric in the absolute cartesian coordinates system : these coefficients are normalized. a1.x**2 + a2.y**2 + a3.z**2 + 2.(b1.x.y + b2.x.z + b3.y.z) + 2.(c1.x + c2.y + c3.z) + d = 0.0.

Parameters
----------

Returns
-------
A1: float
A2: float
A3: float
B1: float
B2: float
B3: float
C1: float
C2: float
C3: float
D: float
") Coefficients;
		void Coefficients(Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** Copy ******************/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "Creates a new object which is a copy of this sphere.

Returns
-------
opencascade::handle<Geom_Geometry>
") Copy;
		opencascade::handle<Geom_Geometry> Copy();

		/****************** D0 ******************/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "Computes the point p (u, v) on the surface. p (u, v) = loc + radius * sin (v) * zdir + radius * cos (v) * (cos (u) * xdir + sin (u) * ydir) where loc is the origin of the placement plane (xaxis, yaxis) xdir is the direction of the xaxis and ydir the direction of the yaxis and zdir the direction of the zaxis.

Parameters
----------
U: float
V: float
P: gp_Pnt

Returns
-------
None
") D0;
		void D0(const Standard_Real U, const Standard_Real V, gp_Pnt & P);

		/****************** D1 ******************/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "Computes the current point and the first derivatives in the directions u and v.

Parameters
----------
U: float
V: float
P: gp_Pnt
D1U: gp_Vec
D1V: gp_Vec

Returns
-------
None
") D1;
		void D1(const Standard_Real U, const Standard_Real V, gp_Pnt & P, gp_Vec & D1U, gp_Vec & D1V);

		/****************** D2 ******************/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "Computes the current point, the first and the second derivatives in the directions u and v.

Parameters
----------
U: float
V: float
P: gp_Pnt
D1U: gp_Vec
D1V: gp_Vec
D2U: gp_Vec
D2V: gp_Vec
D2UV: gp_Vec

Returns
-------
None
") D2;
		void D2(const Standard_Real U, const Standard_Real V, gp_Pnt & P, gp_Vec & D1U, gp_Vec & D1V, gp_Vec & D2U, gp_Vec & D2V, gp_Vec & D2UV);

		/****************** D3 ******************/
		%feature("compactdefaultargs") D3;
		%feature("autodoc", "Computes the current point, the first,the second and the third derivatives in the directions u and v.

Parameters
----------
U: float
V: float
P: gp_Pnt
D1U: gp_Vec
D1V: gp_Vec
D2U: gp_Vec
D2V: gp_Vec
D2UV: gp_Vec
D3U: gp_Vec
D3V: gp_Vec
D3UUV: gp_Vec
D3UVV: gp_Vec

Returns
-------
None
") D3;
		void D3(const Standard_Real U, const Standard_Real V, gp_Pnt & P, gp_Vec & D1U, gp_Vec & D1V, gp_Vec & D2U, gp_Vec & D2V, gp_Vec & D2UV, gp_Vec & D3U, gp_Vec & D3V, gp_Vec & D3UUV, gp_Vec & D3UVV);

		/****************** DN ******************/
		%feature("compactdefaultargs") DN;
		%feature("autodoc", "Computes the derivative of order nu in the direction u and nv in the direction v. raised if nu + nv < 1 or nu < 0 or nv < 0.

Parameters
----------
U: float
V: float
Nu: int
Nv: int

Returns
-------
gp_Vec
") DN;
		gp_Vec DN(const Standard_Real U, const Standard_Real V, const Standard_Integer Nu, const Standard_Integer Nv);

		/****************** IsUClosed ******************/
		%feature("compactdefaultargs") IsUClosed;
		%feature("autodoc", "Returns true.

Returns
-------
bool
") IsUClosed;
		Standard_Boolean IsUClosed();

		/****************** IsUPeriodic ******************/
		%feature("compactdefaultargs") IsUPeriodic;
		%feature("autodoc", "Returns true.

Returns
-------
bool
") IsUPeriodic;
		Standard_Boolean IsUPeriodic();

		/****************** IsVClosed ******************/
		%feature("compactdefaultargs") IsVClosed;
		%feature("autodoc", "Returns false.

Returns
-------
bool
") IsVClosed;
		Standard_Boolean IsVClosed();

		/****************** IsVPeriodic ******************/
		%feature("compactdefaultargs") IsVPeriodic;
		%feature("autodoc", "Returns false.

Returns
-------
bool
") IsVPeriodic;
		Standard_Boolean IsVPeriodic();

		/****************** Radius ******************/
		%feature("compactdefaultargs") Radius;
		%feature("autodoc", "Computes the coefficients of the implicit equation of this quadric in the absolute cartesian coordinate system: a1.x**2 + a2.y**2 + a3.z**2 + 2.(b1.x.y + b2.x.z + b3.y.z) + 2.(c1.x + c2.y + c3.z) + d = 0.0 an implicit normalization is applied (i.e. a1 = a2 = 1. in the local coordinate system of this sphere).

Returns
-------
float
") Radius;
		Standard_Real Radius();

		/****************** SetRadius ******************/
		%feature("compactdefaultargs") SetRadius;
		%feature("autodoc", "Assigns the value r to the radius of this sphere. exceptions standard_constructionerror if r is less than 0.0.

Parameters
----------
R: float

Returns
-------
None
") SetRadius;
		void SetRadius(const Standard_Real R);

		/****************** SetSphere ******************/
		%feature("compactdefaultargs") SetSphere;
		%feature("autodoc", "Converts the gp_sphere s into this sphere.

Parameters
----------
S: gp_Sphere

Returns
-------
None
") SetSphere;
		void SetSphere(const gp_Sphere & S);

		/****************** Sphere ******************/
		%feature("compactdefaultargs") Sphere;
		%feature("autodoc", "Returns a non persistent sphere with the same geometric properties as <self>.

Returns
-------
gp_Sphere
") Sphere;
		gp_Sphere Sphere();

		/****************** Transform ******************/
		%feature("compactdefaultargs") Transform;
		%feature("autodoc", "Applies the transformation t to this sphere.

Parameters
----------
T: gp_Trsf

Returns
-------
None
") Transform;
		void Transform(const gp_Trsf & T);

		/****************** UIso ******************/
		%feature("compactdefaultargs") UIso;
		%feature("autodoc", "Computes the u isoparametric curve. the u isoparametric curves of the surface are defined by the section of the spherical surface with plane obtained by rotation of the plane (location, xaxis, zaxis) around zaxis. this plane defines the origin of parametrization u. for a sphericalsurface the uiso curve is a circle. warnings : the radius of this circle can be zero.

Parameters
----------
U: float

Returns
-------
opencascade::handle<Geom_Curve>
") UIso;
		opencascade::handle<Geom_Curve> UIso(const Standard_Real U);

		/****************** UReversedParameter ******************/
		%feature("compactdefaultargs") UReversedParameter;
		%feature("autodoc", "Computes the u parameter on the modified surface, when reversing its u parametric direction, for any point of u parameter u on this sphere. in the case of a sphere, these functions returns 2.pi - u.

Parameters
----------
U: float

Returns
-------
float
") UReversedParameter;
		Standard_Real UReversedParameter(const Standard_Real U);

		/****************** VIso ******************/
		%feature("compactdefaultargs") VIso;
		%feature("autodoc", "Computes the v isoparametric curve. the v isoparametric curves of the surface are defined by the section of the spherical surface with plane parallel to the plane (location, xaxis, yaxis). this plane defines the origin of parametrization v. be careful if v is close to pi/2 or 3*pi/2 the radius of the circle becomes tiny. it is not forbidden in this toolkit to create circle with radius = 0.0 for a sphericalsurface the viso curve is a circle. warnings : the radius of this circle can be zero.

Parameters
----------
V: float

Returns
-------
opencascade::handle<Geom_Curve>
") VIso;
		opencascade::handle<Geom_Curve> VIso(const Standard_Real V);

		/****************** VReversedParameter ******************/
		%feature("compactdefaultargs") VReversedParameter;
		%feature("autodoc", "Computes the v parameter on the modified surface, when reversing its v parametric direction, for any point of v parameter v on this sphere. in the case of a sphere, these functions returns -u.

Parameters
----------
V: float

Returns
-------
float
") VReversedParameter;
		Standard_Real VReversedParameter(const Standard_Real V);

		/****************** Volume ******************/
		%feature("compactdefaultargs") Volume;
		%feature("autodoc", "Computes the volume of the spherical surface.

Returns
-------
float
") Volume;
		Standard_Real Volume();

};


%make_alias(Geom_SphericalSurface)

%extend Geom_SphericalSurface {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************************
* class Geom_SurfaceOfLinearExtrusion *
**************************************/
class Geom_SurfaceOfLinearExtrusion : public Geom_SweptSurface {
	public:
		/****************** Geom_SurfaceOfLinearExtrusion ******************/
		%feature("compactdefaultargs") Geom_SurfaceOfLinearExtrusion;
		%feature("autodoc", "V is the direction of extrusion. c is the extruded curve. the form of a surfaceoflinearextrusion can be : . ruled surface (ruledform), . a cylindrical surface if the extruded curve is a circle or a trimmed circle (cylindricalform), . a plane surface if the extruded curve is a line (planarform). warnings : degenerated surface cases are not detected. for example if the curve c is a line and v is parallel to the direction of this line.

Parameters
----------
C: Geom_Curve
V: gp_Dir

Returns
-------
None
") Geom_SurfaceOfLinearExtrusion;
		 Geom_SurfaceOfLinearExtrusion(const opencascade::handle<Geom_Curve> & C, const gp_Dir & V);

		/****************** Bounds ******************/
		%feature("compactdefaultargs") Bounds;
		%feature("autodoc", "Returns the parametric bounds u1, u2, v1 and v2 of this surface of linear extrusion. a surface of linear extrusion is infinite in the v parametric direction, so: - v1 = standard_real::realfirst() - v2 = standard_real::reallast().

Parameters
----------

Returns
-------
U1: float
U2: float
V1: float
V2: float
") Bounds;
		void Bounds(Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** Copy ******************/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "Creates a new object which is a copy of this surface of linear extrusion.

Returns
-------
opencascade::handle<Geom_Geometry>
") Copy;
		opencascade::handle<Geom_Geometry> Copy();

		/****************** D0 ******************/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "Computes the point p (u, v) on the surface. the parameter u is the parameter on the extruded curve. the parametrization v is a linear parametrization, and the direction of parametrization is the direction of extrusion. if the point is on the extruded curve, v = 0.0.

Parameters
----------
U: float
V: float
P: gp_Pnt

Returns
-------
None
") D0;
		void D0(const Standard_Real U, const Standard_Real V, gp_Pnt & P);

		/****************** D1 ******************/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "Computes the current point and the first derivatives in the directions u and v. raises undefinedderivative if the continuity of the surface is not c1.

Parameters
----------
U: float
V: float
P: gp_Pnt
D1U: gp_Vec
D1V: gp_Vec

Returns
-------
None
") D1;
		void D1(const Standard_Real U, const Standard_Real V, gp_Pnt & P, gp_Vec & D1U, gp_Vec & D1V);

		/****************** D2 ******************/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "--- purpose ; computes the current point, the first and the second derivatives in the directions u and v. raises undefinedderivative if the continuity of the surface is not c2.

Parameters
----------
U: float
V: float
P: gp_Pnt
D1U: gp_Vec
D1V: gp_Vec
D2U: gp_Vec
D2V: gp_Vec
D2UV: gp_Vec

Returns
-------
None
") D2;
		void D2(const Standard_Real U, const Standard_Real V, gp_Pnt & P, gp_Vec & D1U, gp_Vec & D1V, gp_Vec & D2U, gp_Vec & D2V, gp_Vec & D2UV);

		/****************** D3 ******************/
		%feature("compactdefaultargs") D3;
		%feature("autodoc", "Computes the current point, the first,the second and the third derivatives in the directions u and v. raises undefinedderivative if the continuity of the surface is not c3.

Parameters
----------
U: float
V: float
P: gp_Pnt
D1U: gp_Vec
D1V: gp_Vec
D2U: gp_Vec
D2V: gp_Vec
D2UV: gp_Vec
D3U: gp_Vec
D3V: gp_Vec
D3UUV: gp_Vec
D3UVV: gp_Vec

Returns
-------
None
") D3;
		void D3(const Standard_Real U, const Standard_Real V, gp_Pnt & P, gp_Vec & D1U, gp_Vec & D1V, gp_Vec & D2U, gp_Vec & D2V, gp_Vec & D2UV, gp_Vec & D3U, gp_Vec & D3V, gp_Vec & D3UUV, gp_Vec & D3UVV);

		/****************** DN ******************/
		%feature("compactdefaultargs") DN;
		%feature("autodoc", "Computes the derivative of order nu in the direction u and nv in the direction v. raises undefinedderivative if the continuity of the surface is not cnu in the u direction and cnv in the v direction. raises rangeerror if nu + nv < 1 or nu < 0 or nv < 0.

Parameters
----------
U: float
V: float
Nu: int
Nv: int

Returns
-------
gp_Vec
") DN;
		gp_Vec DN(const Standard_Real U, const Standard_Real V, const Standard_Integer Nu, const Standard_Integer Nv);

		/****************** IsCNu ******************/
		%feature("compactdefaultargs") IsCNu;
		%feature("autodoc", "Iscnu returns true if the degree of continuity for the 'basis curve' of this surface of linear extrusion is at least n. raises rangeerror if n < 0.

Parameters
----------
N: int

Returns
-------
bool
") IsCNu;
		Standard_Boolean IsCNu(const Standard_Integer N);

		/****************** IsCNv ******************/
		%feature("compactdefaultargs") IsCNv;
		%feature("autodoc", "Iscnv always returns true.

Parameters
----------
N: int

Returns
-------
bool
") IsCNv;
		Standard_Boolean IsCNv(const Standard_Integer N);

		/****************** IsUClosed ******************/
		%feature("compactdefaultargs") IsUClosed;
		%feature("autodoc", "Isuclosed returns true if the 'basis curve' of this surface of linear extrusion is closed.

Returns
-------
bool
") IsUClosed;
		Standard_Boolean IsUClosed();

		/****************** IsUPeriodic ******************/
		%feature("compactdefaultargs") IsUPeriodic;
		%feature("autodoc", "Isuperiodic returns true if the 'basis curve' of this surface of linear extrusion is periodic.

Returns
-------
bool
") IsUPeriodic;
		Standard_Boolean IsUPeriodic();

		/****************** IsVClosed ******************/
		%feature("compactdefaultargs") IsVClosed;
		%feature("autodoc", "Isvclosed always returns false.

Returns
-------
bool
") IsVClosed;
		Standard_Boolean IsVClosed();

		/****************** IsVPeriodic ******************/
		%feature("compactdefaultargs") IsVPeriodic;
		%feature("autodoc", "Isvperiodic always returns false.

Returns
-------
bool
") IsVPeriodic;
		Standard_Boolean IsVPeriodic();

		/****************** ParametricTransformation ******************/
		%feature("compactdefaultargs") ParametricTransformation;
		%feature("autodoc", "Returns a 2d transformation used to find the new parameters of a point on the transformed surface. //! me->transformed(t)->value(u',v') //! is the same point as //! me->value(u,v).transformed(t) //! where u',v' are obtained by transforming u,v with th 2d transformation returned by //! me->parametrictransformation(t) //! this methods returns a scale u by basiscurve()->parametrictransformation(t) v by t.scalefactor().

Parameters
----------
T: gp_Trsf

Returns
-------
gp_GTrsf2d
") ParametricTransformation;
		virtual gp_GTrsf2d ParametricTransformation(const gp_Trsf & T);

		/****************** SetBasisCurve ******************/
		%feature("compactdefaultargs") SetBasisCurve;
		%feature("autodoc", "Modifies this surface of linear extrusion by redefining its 'basis curve' (the 'extruded curve').

Parameters
----------
C: Geom_Curve

Returns
-------
None
") SetBasisCurve;
		void SetBasisCurve(const opencascade::handle<Geom_Curve> & C);

		/****************** SetDirection ******************/
		%feature("compactdefaultargs") SetDirection;
		%feature("autodoc", "Assigns v as the 'direction of extrusion' for this surface of linear extrusion.

Parameters
----------
V: gp_Dir

Returns
-------
None
") SetDirection;
		void SetDirection(const gp_Dir & V);

		/****************** Transform ******************/
		%feature("compactdefaultargs") Transform;
		%feature("autodoc", "Applies the transformation t to this surface of linear extrusion.

Parameters
----------
T: gp_Trsf

Returns
-------
None
") Transform;
		void Transform(const gp_Trsf & T);

		/****************** TransformParameters ******************/
		%feature("compactdefaultargs") TransformParameters;
		%feature("autodoc", "Computes the parameters on the transformed surface for the transform of the point of parameters u,v on <self>. //! me->transformed(t)->value(u',v') //! is the same point as //! me->value(u,v).transformed(t) //! where u',v' are the new values of u,v after calling //! me->tranformparameters(u,v,t) //! this methods multiplies : u by basiscurve()->parametrictransformation(t) v by t.scalefactor().

Parameters
----------
T: gp_Trsf

Returns
-------
U: float
V: float
") TransformParameters;
		virtual void TransformParameters(Standard_Real &OutValue, Standard_Real &OutValue, const gp_Trsf & T);

		/****************** UIso ******************/
		%feature("compactdefaultargs") UIso;
		%feature("autodoc", "Computes the u isoparametric curve of this surface of linear extrusion. this is the line parallel to the direction of extrusion, passing through the point of parameter u of the basis curve.

Parameters
----------
U: float

Returns
-------
opencascade::handle<Geom_Curve>
") UIso;
		opencascade::handle<Geom_Curve> UIso(const Standard_Real U);

		/****************** UReverse ******************/
		%feature("compactdefaultargs") UReverse;
		%feature("autodoc", "Changes the orientation of this surface of linear extrusion in the u parametric direction. the bounds of the surface are not changed, but the given parametric direction is reversed. hence the orientation of the surface is reversed. in the case of a surface of linear extrusion: - ureverse reverses the basis curve, and - vreverse reverses the direction of linear extrusion.

Returns
-------
None
") UReverse;
		void UReverse();

		/****************** UReversedParameter ******************/
		%feature("compactdefaultargs") UReversedParameter;
		%feature("autodoc", "Computes the u parameter on the modified surface, produced by reversing its u parametric direction, for any point of u parameter u on this surface of linear extrusion. in the case of an extruded surface: - ureverseparameter returns the reversed parameter given by the function reversedparameter called with u on the basis curve,.

Parameters
----------
U: float

Returns
-------
float
") UReversedParameter;
		Standard_Real UReversedParameter(const Standard_Real U);

		/****************** VIso ******************/
		%feature("compactdefaultargs") VIso;
		%feature("autodoc", "Computes the v isoparametric curve of this surface of linear extrusion. this curve is obtained by translating the extruded curve in the direction of extrusion, with the magnitude v.

Parameters
----------
V: float

Returns
-------
opencascade::handle<Geom_Curve>
") VIso;
		opencascade::handle<Geom_Curve> VIso(const Standard_Real V);

		/****************** VReverse ******************/
		%feature("compactdefaultargs") VReverse;
		%feature("autodoc", "Changes the orientation of this surface of linear extrusion in the v parametric direction. the bounds of the surface are not changed, but the given parametric direction is reversed. hence the orientation of the surface is reversed. in the case of a surface of linear extrusion: - ureverse reverses the basis curve, and - vreverse reverses the direction of linear extrusion.

Returns
-------
None
") VReverse;
		void VReverse();

		/****************** VReversedParameter ******************/
		%feature("compactdefaultargs") VReversedParameter;
		%feature("autodoc", "Computes the v parameter on the modified surface, produced by reversing its u v parametric direction, for any point of v parameter v on this surface of linear extrusion. in the case of an extruded surface vreverse returns -v.

Parameters
----------
V: float

Returns
-------
float
") VReversedParameter;
		Standard_Real VReversedParameter(const Standard_Real V);

};


%make_alias(Geom_SurfaceOfLinearExtrusion)

%extend Geom_SurfaceOfLinearExtrusion {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************
* class Geom_SurfaceOfRevolution *
*********************************/
class Geom_SurfaceOfRevolution : public Geom_SweptSurface {
	public:
		/****************** Geom_SurfaceOfRevolution ******************/
		%feature("compactdefaultargs") Geom_SurfaceOfRevolution;
		%feature("autodoc", "C : is the meridian or the referenced curve. a1 is the axis of revolution. the form of a surfaceofrevolution can be : . a general revolution surface (revolutionform), . a conical surface if the meridian is a line or a trimmed line (conicalform), . a cylindrical surface if the meridian is a line or a trimmed line parallel to the revolution axis (cylindricalform), . a planar surface if the meridian is a line perpendicular to the revolution axis of the surface (planarform). . a spherical surface, . a toroidal surface, . a quadric surface. warnings : it is not checked that the curve c is planar and that the surface axis is in the plane of the curve. it is not checked that the revolved curve c doesn't self-intersects.

Parameters
----------
C: Geom_Curve
A1: gp_Ax1

Returns
-------
None
") Geom_SurfaceOfRevolution;
		 Geom_SurfaceOfRevolution(const opencascade::handle<Geom_Curve> & C, const gp_Ax1 & A1);

		/****************** Axis ******************/
		%feature("compactdefaultargs") Axis;
		%feature("autodoc", "Returns the revolution axis of the surface.

Returns
-------
gp_Ax1
") Axis;
		gp_Ax1 Axis();

		/****************** Bounds ******************/
		%feature("compactdefaultargs") Bounds;
		%feature("autodoc", "Returns the parametric bounds u1, u2 , v1 and v2 of this surface. a surface of revolution is always complete, so u1 = 0, u2 = 2*pi.

Parameters
----------

Returns
-------
U1: float
U2: float
V1: float
V2: float
") Bounds;
		void Bounds(Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** Copy ******************/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "Creates a new object which is a copy of this surface of revolution.

Returns
-------
opencascade::handle<Geom_Geometry>
") Copy;
		opencascade::handle<Geom_Geometry> Copy();

		/****************** D0 ******************/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "Computes the point p (u, v) on the surface. u is the angle of the rotation around the revolution axis. the direction of this axis gives the sense of rotation. v is the parameter of the revolved curve.

Parameters
----------
U: float
V: float
P: gp_Pnt

Returns
-------
None
") D0;
		void D0(const Standard_Real U, const Standard_Real V, gp_Pnt & P);

		/****************** D1 ******************/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "Computes the current point and the first derivatives in the directions u and v. raised if the continuity of the surface is not c1.

Parameters
----------
U: float
V: float
P: gp_Pnt
D1U: gp_Vec
D1V: gp_Vec

Returns
-------
None
") D1;
		void D1(const Standard_Real U, const Standard_Real V, gp_Pnt & P, gp_Vec & D1U, gp_Vec & D1V);

		/****************** D2 ******************/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "Computes the current point, the first and the second derivatives in the directions u and v. raised if the continuity of the surface is not c2.

Parameters
----------
U: float
V: float
P: gp_Pnt
D1U: gp_Vec
D1V: gp_Vec
D2U: gp_Vec
D2V: gp_Vec
D2UV: gp_Vec

Returns
-------
None
") D2;
		void D2(const Standard_Real U, const Standard_Real V, gp_Pnt & P, gp_Vec & D1U, gp_Vec & D1V, gp_Vec & D2U, gp_Vec & D2V, gp_Vec & D2UV);

		/****************** D3 ******************/
		%feature("compactdefaultargs") D3;
		%feature("autodoc", "Computes the current point, the first,the second and the third derivatives in the directions u and v. raised if the continuity of the surface is not c3.

Parameters
----------
U: float
V: float
P: gp_Pnt
D1U: gp_Vec
D1V: gp_Vec
D2U: gp_Vec
D2V: gp_Vec
D2UV: gp_Vec
D3U: gp_Vec
D3V: gp_Vec
D3UUV: gp_Vec
D3UVV: gp_Vec

Returns
-------
None
") D3;
		void D3(const Standard_Real U, const Standard_Real V, gp_Pnt & P, gp_Vec & D1U, gp_Vec & D1V, gp_Vec & D2U, gp_Vec & D2V, gp_Vec & D2UV, gp_Vec & D3U, gp_Vec & D3V, gp_Vec & D3UUV, gp_Vec & D3UVV);

		/****************** DN ******************/
		%feature("compactdefaultargs") DN;
		%feature("autodoc", "Computes the derivative of order nu in the direction u and nv in the direction v. //! raised if the continuity of the surface is not cnu in the u direction and cnv in the v direction. raised if nu + nv < 1 or nu < 0 or nv < 0. the following functions evaluates the local derivatives on surface. useful to manage discontinuities on the surface. if side = 1 -> p = s( u+,v ) if side = -1 -> p = s( u-,v ) else p is betveen discontinuities can be evaluated using methods of global evaluations p = s( u ,v ).

Parameters
----------
U: float
V: float
Nu: int
Nv: int

Returns
-------
gp_Vec
") DN;
		gp_Vec DN(const Standard_Real U, const Standard_Real V, const Standard_Integer Nu, const Standard_Integer Nv);

		/****************** IsCNu ******************/
		%feature("compactdefaultargs") IsCNu;
		%feature("autodoc", "Iscnu always returns true.

Parameters
----------
N: int

Returns
-------
bool
") IsCNu;
		Standard_Boolean IsCNu(const Standard_Integer N);

		/****************** IsCNv ******************/
		%feature("compactdefaultargs") IsCNv;
		%feature("autodoc", "Iscnv returns true if the degree of continuity of the meridian of this surface of revolution is at least n. raised if n < 0.

Parameters
----------
N: int

Returns
-------
bool
") IsCNv;
		Standard_Boolean IsCNv(const Standard_Integer N);

		/****************** IsUClosed ******************/
		%feature("compactdefaultargs") IsUClosed;
		%feature("autodoc", "Isuclosed always returns true.

Returns
-------
bool
") IsUClosed;
		Standard_Boolean IsUClosed();

		/****************** IsUPeriodic ******************/
		%feature("compactdefaultargs") IsUPeriodic;
		%feature("autodoc", "Returns true.

Returns
-------
bool
") IsUPeriodic;
		Standard_Boolean IsUPeriodic();

		/****************** IsVClosed ******************/
		%feature("compactdefaultargs") IsVClosed;
		%feature("autodoc", "Isvclosed returns true if the meridian of this surface of revolution is closed.

Returns
-------
bool
") IsVClosed;
		Standard_Boolean IsVClosed();

		/****************** IsVPeriodic ******************/
		%feature("compactdefaultargs") IsVPeriodic;
		%feature("autodoc", "Isvperiodic returns true if the meridian of this surface of revolution is periodic.

Returns
-------
bool
") IsVPeriodic;
		Standard_Boolean IsVPeriodic();

		/****************** Location ******************/
		%feature("compactdefaultargs") Location;
		%feature("autodoc", "Returns the location point of the axis of revolution.

Returns
-------
gp_Pnt
") Location;
		const gp_Pnt Location();

		/****************** ParametricTransformation ******************/
		%feature("compactdefaultargs") ParametricTransformation;
		%feature("autodoc", "Returns a 2d transformation used to find the new parameters of a point on the transformed surface. //! me->transformed(t)->value(u',v') //! is the same point as //! me->value(u,v).transformed(t) //! where u',v' are obtained by transforming u,v with th 2d transformation returned by //! me->parametrictransformation(t) //! this methods returns a scale centered on the u axis with basiscurve()->parametrictransformation(t).

Parameters
----------
T: gp_Trsf

Returns
-------
gp_GTrsf2d
") ParametricTransformation;
		virtual gp_GTrsf2d ParametricTransformation(const gp_Trsf & T);

		/****************** ReferencePlane ******************/
		%feature("compactdefaultargs") ReferencePlane;
		%feature("autodoc", "Computes the position of the reference plane of the surface defined by the basis curve and the symmetry axis. the location point is the location point of the revolution's axis, the xdirection of the plane is given by the revolution's axis and the orientation of the normal to the plane is given by the sense of revolution. //! raised if the revolved curve is not planar or if the revolved curve and the symmetry axis are not in the same plane or if the maximum of distance between the axis and the revolved curve is lower or equal to resolution from gp.

Returns
-------
gp_Ax2
") ReferencePlane;
		gp_Ax2 ReferencePlane();

		/****************** SetAxis ******************/
		%feature("compactdefaultargs") SetAxis;
		%feature("autodoc", "Changes the axis of revolution. warnings : it is not checked that the axis is in the plane of the revolved curve.

Parameters
----------
A1: gp_Ax1

Returns
-------
None
") SetAxis;
		void SetAxis(const gp_Ax1 & A1);

		/****************** SetBasisCurve ******************/
		%feature("compactdefaultargs") SetBasisCurve;
		%feature("autodoc", "Changes the revolved curve of the surface. warnings : it is not checked that the curve c is planar and that the surface axis is in the plane of the curve. it is not checked that the revolved curve c doesn't self-intersects.

Parameters
----------
C: Geom_Curve

Returns
-------
None
") SetBasisCurve;
		void SetBasisCurve(const opencascade::handle<Geom_Curve> & C);

		/****************** SetDirection ******************/
		%feature("compactdefaultargs") SetDirection;
		%feature("autodoc", "Changes the direction of the revolution axis. warnings : it is not checked that the axis is in the plane of the revolved curve.

Parameters
----------
V: gp_Dir

Returns
-------
None
") SetDirection;
		void SetDirection(const gp_Dir & V);

		/****************** SetLocation ******************/
		%feature("compactdefaultargs") SetLocation;
		%feature("autodoc", "Changes the location point of the revolution axis. warnings : it is not checked that the axis is in the plane of the revolved curve.

Parameters
----------
P: gp_Pnt

Returns
-------
None
") SetLocation;
		void SetLocation(const gp_Pnt & P);

		/****************** Transform ******************/
		%feature("compactdefaultargs") Transform;
		%feature("autodoc", "Applies the transformation t to this surface of revolution.

Parameters
----------
T: gp_Trsf

Returns
-------
None
") Transform;
		void Transform(const gp_Trsf & T);

		/****************** TransformParameters ******************/
		%feature("compactdefaultargs") TransformParameters;
		%feature("autodoc", "Computes the parameters on the transformed surface for the transform of the point of parameters u,v on <self>. //! me->transformed(t)->value(u',v') //! is the same point as //! me->value(u,v).transformed(t) //! where u',v' are the new values of u,v after calling //! me->tranformparameters(u,v,t) //! this methods multiplies v by basiscurve()->parametrictransformation(t).

Parameters
----------
T: gp_Trsf

Returns
-------
U: float
V: float
") TransformParameters;
		virtual void TransformParameters(Standard_Real &OutValue, Standard_Real &OutValue, const gp_Trsf & T);

		/****************** UIso ******************/
		%feature("compactdefaultargs") UIso;
		%feature("autodoc", "Computes the u isoparametric curve of this surface of revolution. it is the curve obtained by rotating the meridian through an angle u about the axis of revolution.

Parameters
----------
U: float

Returns
-------
opencascade::handle<Geom_Curve>
") UIso;
		opencascade::handle<Geom_Curve> UIso(const Standard_Real U);

		/****************** UReverse ******************/
		%feature("compactdefaultargs") UReverse;
		%feature("autodoc", "Changes the orientation of this surface of revolution in the u parametric direction. the bounds of the surface are not changed but the given parametric direction is reversed. hence the orientation of the surface is reversed. as a consequence: - ureverse reverses the direction of the axis of revolution of this surface,.

Returns
-------
None
") UReverse;
		void UReverse();

		/****************** UReversedParameter ******************/
		%feature("compactdefaultargs") UReversedParameter;
		%feature("autodoc", "Computes the u parameter on the modified surface, when reversing its u parametric direction, for any point of u parameter u on this surface of revolution. in the case of a revolved surface: - ureversedparameter returns 2.*pi - u.

Parameters
----------
U: float

Returns
-------
float
") UReversedParameter;
		Standard_Real UReversedParameter(const Standard_Real U);

		/****************** VIso ******************/
		%feature("compactdefaultargs") VIso;
		%feature("autodoc", "Computes the u isoparametric curve of this surface of revolution. it is the curve obtained by rotating the meridian through an angle u about the axis of revolution.

Parameters
----------
V: float

Returns
-------
opencascade::handle<Geom_Curve>
") VIso;
		opencascade::handle<Geom_Curve> VIso(const Standard_Real V);

		/****************** VReverse ******************/
		%feature("compactdefaultargs") VReverse;
		%feature("autodoc", "Changes the orientation of this surface of revolution in the v parametric direction. the bounds of the surface are not changed but the given parametric direction is reversed. hence the orientation of the surface is reversed. as a consequence: - vreverse reverses the meridian of this surface of revolution.

Returns
-------
None
") VReverse;
		void VReverse();

		/****************** VReversedParameter ******************/
		%feature("compactdefaultargs") VReversedParameter;
		%feature("autodoc", "Computes the v parameter on the modified surface, when reversing its v parametric direction, for any point of v parameter v on this surface of revolution. in the case of a revolved surface: - vreversedparameter returns the reversed parameter given by the function reversedparameter called with v on the meridian.

Parameters
----------
V: float

Returns
-------
float
") VReversedParameter;
		Standard_Real VReversedParameter(const Standard_Real V);

};


%make_alias(Geom_SurfaceOfRevolution)

%extend Geom_SurfaceOfRevolution {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************
* class Geom_ToroidalSurface *
*****************************/
class Geom_ToroidalSurface : public Geom_ElementarySurface {
	public:
		/****************** Geom_ToroidalSurface ******************/
		%feature("compactdefaultargs") Geom_ToroidalSurface;
		%feature("autodoc", "A3 is the local coordinate system of the surface. the orientation of increasing v parametric value is defined by the rotation around the main axis (zaxis) in the trigonometric sense. the parametrization of the surface in the u direction is defined such as the normal vector (n = d1u ^ d1v) is oriented towards the 'outside region' of the surface. warnings : it is not forbidden to create a toroidal surface with majorradius = minorradius = 0.0 //! raised if minorradius < 0.0 or if majorradius < 0.0.

Parameters
----------
A3: gp_Ax3
MajorRadius: float
MinorRadius: float

Returns
-------
None
") Geom_ToroidalSurface;
		 Geom_ToroidalSurface(const gp_Ax3 & A3, const Standard_Real MajorRadius, const Standard_Real MinorRadius);

		/****************** Geom_ToroidalSurface ******************/
		%feature("compactdefaultargs") Geom_ToroidalSurface;
		%feature("autodoc", "Creates a toroidalsurface from a non transient torus from package gp.

Parameters
----------
T: gp_Torus

Returns
-------
None
") Geom_ToroidalSurface;
		 Geom_ToroidalSurface(const gp_Torus & T);

		/****************** Area ******************/
		%feature("compactdefaultargs") Area;
		%feature("autodoc", "Computes the aera of the surface.

Returns
-------
float
") Area;
		Standard_Real Area();

		/****************** Bounds ******************/
		%feature("compactdefaultargs") Bounds;
		%feature("autodoc", "Returns the parametric bounds u1, u2, v1 and v2 of this torus. for a torus: u1 = v1 = 0 and u2 = v2 = 2*pi .

Parameters
----------

Returns
-------
U1: float
U2: float
V1: float
V2: float
") Bounds;
		void Bounds(Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** Coefficients ******************/
		%feature("compactdefaultargs") Coefficients;
		%feature("autodoc", "Returns the coefficients of the implicit equation of the surface in the absolute cartesian coordinate system : coef(1) * x**4 + coef(2) * y**4 + coef(3) * z**4 + coef(4) * x**3 * y + coef(5) * x**3 * z + coef(6) * y**3 * x + coef(7) * y**3 * z + coef(8) * z**3 * x + coef(9) * z**3 * y + coef(10) * x**2 * y**2 + coef(11) * x**2 * z**2 + coef(12) * y**2 * z**2 + coef(13) * x**3 + coef(14) * y**3 + coef(15) * z**3 + coef(16) * x**2 * y + coef(17) * x**2 * z + coef(18) * y**2 * x + coef(19) * y**2 * z + coef(20) * z**2 * x + coef(21) * z**2 * y + coef(22) * x**2 + coef(23) * y**2 + coef(24) * z**2 + coef(25) * x * y + coef(26) * x * z + coef(27) * y * z + coef(28) * x + coef(29) * y + coef(30) * z + coef(31) = 0.0 raised if the length of coef is lower than 31.

Parameters
----------
Coef: TColStd_Array1OfReal

Returns
-------
None
") Coefficients;
		void Coefficients(TColStd_Array1OfReal & Coef);

		/****************** Copy ******************/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "Creates a new object which is a copy of this torus.

Returns
-------
opencascade::handle<Geom_Geometry>
") Copy;
		opencascade::handle<Geom_Geometry> Copy();

		/****************** D0 ******************/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "Computes the point p (u, v) on the surface. p (u, v) = loc + minorradius * sin (v) * zdir + (majorradius + minorradius * cos(v)) * (cos (u) * xdir + sin (u) * ydir) where loc is the origin of the placement plane (xaxis, yaxis) xdir is the direction of the xaxis and ydir the direction of the yaxis and zdir the direction of the zaxis.

Parameters
----------
U: float
V: float
P: gp_Pnt

Returns
-------
None
") D0;
		void D0(const Standard_Real U, const Standard_Real V, gp_Pnt & P);

		/****************** D1 ******************/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "Computes the current point and the first derivatives in the directions u and v.

Parameters
----------
U: float
V: float
P: gp_Pnt
D1U: gp_Vec
D1V: gp_Vec

Returns
-------
None
") D1;
		void D1(const Standard_Real U, const Standard_Real V, gp_Pnt & P, gp_Vec & D1U, gp_Vec & D1V);

		/****************** D2 ******************/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "Computes the current point, the first and the second derivatives in the directions u and v.

Parameters
----------
U: float
V: float
P: gp_Pnt
D1U: gp_Vec
D1V: gp_Vec
D2U: gp_Vec
D2V: gp_Vec
D2UV: gp_Vec

Returns
-------
None
") D2;
		void D2(const Standard_Real U, const Standard_Real V, gp_Pnt & P, gp_Vec & D1U, gp_Vec & D1V, gp_Vec & D2U, gp_Vec & D2V, gp_Vec & D2UV);

		/****************** D3 ******************/
		%feature("compactdefaultargs") D3;
		%feature("autodoc", "Computes the current point, the first,the second and the third derivatives in the directions u and v.

Parameters
----------
U: float
V: float
P: gp_Pnt
D1U: gp_Vec
D1V: gp_Vec
D2U: gp_Vec
D2V: gp_Vec
D2UV: gp_Vec
D3U: gp_Vec
D3V: gp_Vec
D3UUV: gp_Vec
D3UVV: gp_Vec

Returns
-------
None
") D3;
		void D3(const Standard_Real U, const Standard_Real V, gp_Pnt & P, gp_Vec & D1U, gp_Vec & D1V, gp_Vec & D2U, gp_Vec & D2V, gp_Vec & D2UV, gp_Vec & D3U, gp_Vec & D3V, gp_Vec & D3UUV, gp_Vec & D3UVV);

		/****************** DN ******************/
		%feature("compactdefaultargs") DN;
		%feature("autodoc", "Computes the derivative of order nu in the direction u and nv in the direction v. raised if nu + nv < 1 or nu < 0 or nv < 0.

Parameters
----------
U: float
V: float
Nu: int
Nv: int

Returns
-------
gp_Vec
") DN;
		gp_Vec DN(const Standard_Real U, const Standard_Real V, const Standard_Integer Nu, const Standard_Integer Nv);

		/****************** IsUClosed ******************/
		%feature("compactdefaultargs") IsUClosed;
		%feature("autodoc", "Returns true.

Returns
-------
bool
") IsUClosed;
		Standard_Boolean IsUClosed();

		/****************** IsUPeriodic ******************/
		%feature("compactdefaultargs") IsUPeriodic;
		%feature("autodoc", "Returns true.

Returns
-------
bool
") IsUPeriodic;
		Standard_Boolean IsUPeriodic();

		/****************** IsVClosed ******************/
		%feature("compactdefaultargs") IsVClosed;
		%feature("autodoc", "Returns true.

Returns
-------
bool
") IsVClosed;
		Standard_Boolean IsVClosed();

		/****************** IsVPeriodic ******************/
		%feature("compactdefaultargs") IsVPeriodic;
		%feature("autodoc", "Returns true.

Returns
-------
bool
") IsVPeriodic;
		Standard_Boolean IsVPeriodic();

		/****************** MajorRadius ******************/
		%feature("compactdefaultargs") MajorRadius;
		%feature("autodoc", "Returns the major radius, or the minor radius, of this torus.

Returns
-------
float
") MajorRadius;
		Standard_Real MajorRadius();

		/****************** MinorRadius ******************/
		%feature("compactdefaultargs") MinorRadius;
		%feature("autodoc", "Returns the major radius, or the minor radius, of this torus.

Returns
-------
float
") MinorRadius;
		Standard_Real MinorRadius();

		/****************** SetMajorRadius ******************/
		%feature("compactdefaultargs") SetMajorRadius;
		%feature("autodoc", "Modifies this torus by changing its major radius. exceptions standard_constructionerror if: - majorradius is negative, or - majorradius - r is less than or equal to gp::resolution(), where r is the minor radius of this torus.

Parameters
----------
MajorRadius: float

Returns
-------
None
") SetMajorRadius;
		void SetMajorRadius(const Standard_Real MajorRadius);

		/****************** SetMinorRadius ******************/
		%feature("compactdefaultargs") SetMinorRadius;
		%feature("autodoc", "Modifies this torus by changing its minor radius. exceptions standard_constructionerror if: - minorradius is negative, or - r - minorradius is less than or equal to gp::resolution(), where r is the major radius of this torus.

Parameters
----------
MinorRadius: float

Returns
-------
None
") SetMinorRadius;
		void SetMinorRadius(const Standard_Real MinorRadius);

		/****************** SetTorus ******************/
		%feature("compactdefaultargs") SetTorus;
		%feature("autodoc", "Converts the gp_torus torus t into this torus.

Parameters
----------
T: gp_Torus

Returns
-------
None
") SetTorus;
		void SetTorus(const gp_Torus & T);

		/****************** Torus ******************/
		%feature("compactdefaultargs") Torus;
		%feature("autodoc", "Returns the non transient torus with the same geometric properties as <self>.

Returns
-------
gp_Torus
") Torus;
		gp_Torus Torus();

		/****************** Transform ******************/
		%feature("compactdefaultargs") Transform;
		%feature("autodoc", "Applies the transformation t to this torus.

Parameters
----------
T: gp_Trsf

Returns
-------
None
") Transform;
		void Transform(const gp_Trsf & T);

		/****************** UIso ******************/
		%feature("compactdefaultargs") UIso;
		%feature("autodoc", "Computes the u isoparametric curve. //! for a toroidal surface the uiso curve is a circle. the center of the uiso circle is at the distance majorradius from the location point of the toroidal surface. warnings : the radius of the circle can be zero if for the surface minorradius = 0.0.

Parameters
----------
U: float

Returns
-------
opencascade::handle<Geom_Curve>
") UIso;
		opencascade::handle<Geom_Curve> UIso(const Standard_Real U);

		/****************** UReversedParameter ******************/
		%feature("compactdefaultargs") UReversedParameter;
		%feature("autodoc", "Return the parameter on the ureversed surface for the point of parameter u on <self>. return 2.pi - u.

Parameters
----------
U: float

Returns
-------
float
") UReversedParameter;
		Standard_Real UReversedParameter(const Standard_Real U);

		/****************** VIso ******************/
		%feature("compactdefaultargs") VIso;
		%feature("autodoc", "Computes the v isoparametric curve. //! for a toroidalsurface the viso curve is a circle. the axis of the circle is the main axis (zaxis) of the toroidal surface. warnings : the radius of the circle can be zero if for the surface majorradius = minorradius.

Parameters
----------
V: float

Returns
-------
opencascade::handle<Geom_Curve>
") VIso;
		opencascade::handle<Geom_Curve> VIso(const Standard_Real V);

		/****************** VReversedParameter ******************/
		%feature("compactdefaultargs") VReversedParameter;
		%feature("autodoc", "Return the parameter on the ureversed surface for the point of parameter u on <self>. return 2.pi - u.

Parameters
----------
U: float

Returns
-------
float
") VReversedParameter;
		Standard_Real VReversedParameter(const Standard_Real U);

		/****************** Volume ******************/
		%feature("compactdefaultargs") Volume;
		%feature("autodoc", "Computes the volume.

Returns
-------
float
") Volume;
		Standard_Real Volume();

};


%make_alias(Geom_ToroidalSurface)

%extend Geom_ToroidalSurface {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************
* class Geom_TrimmedCurve *
**************************/
class Geom_TrimmedCurve : public Geom_BoundedCurve {
	public:
		/****************** Geom_TrimmedCurve ******************/
		%feature("compactdefaultargs") Geom_TrimmedCurve;
		%feature("autodoc", "Constructs a trimmed curve from the basis curve c which is limited between parameter values u1 and u2. note: - u1 can be greater or less than u2; in both cases, the returned curve is oriented from u1 to u2. - if the basis curve c is periodic, there is an ambiguity because two parts are available. in this case, the trimmed curve has the same orientation as the basis curve if sense is true (default value) or the opposite orientation if sense is false. - if the curve is closed but not periodic, it is not possible to keep the part of the curve which includes the junction point (except if the junction point is at the beginning or at the end of the trimmed curve). if you tried to do this, you could alter the fundamental characteristics of the basis curve, which are used, for example, to compute the derivatives of the trimmed curve. the rules for a closed curve are therefore the same as those for an open curve. warning: the trimmed curve is built from a copy of curve c. therefore, when c is modified, the trimmed curve is not modified. - if the basis curve is periodic and theadjustperiodic is true, the bounds of the trimmed curve may be different from u1 and u2 if the parametric origin of the basis curve is within the arc of the trimmed curve. in this case, the modified parameter will be equal to u1 or u2 plus or minus the period. when theadjustperiodic is false, parameters u1 and u2 will be the same, without adjustment into the first period. exceptions standard_constructionerror if: - c is not periodic and u1 or u2 is outside the bounds of c, or - u1 is equal to u2.

Parameters
----------
C: Geom_Curve
U1: float
U2: float
Sense: bool,optional
	default value is Standard_True
theAdjustPeriodic: bool,optional
	default value is Standard_True

Returns
-------
None
") Geom_TrimmedCurve;
		 Geom_TrimmedCurve(const opencascade::handle<Geom_Curve> & C, const Standard_Real U1, const Standard_Real U2, const Standard_Boolean Sense = Standard_True, const Standard_Boolean theAdjustPeriodic = Standard_True);

		/****************** BasisCurve ******************/
		%feature("compactdefaultargs") BasisCurve;
		%feature("autodoc", "Returns the basis curve. warning this function does not return a constant reference. consequently, any modification of the returned value directly modifies the trimmed curve.

Returns
-------
opencascade::handle<Geom_Curve>
") BasisCurve;
		opencascade::handle<Geom_Curve> BasisCurve();

		/****************** Continuity ******************/
		%feature("compactdefaultargs") Continuity;
		%feature("autodoc", "Returns the continuity of the curve : c0 : only geometric continuity, c1 : continuity of the first derivative all along the curve, c2 : continuity of the second derivative all along the curve, c3 : continuity of the third derivative all along the curve, cn : the order of continuity is infinite.

Returns
-------
GeomAbs_Shape
") Continuity;
		GeomAbs_Shape Continuity();

		/****************** Copy ******************/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "Creates a new object which is a copy of this trimmed curve.

Returns
-------
opencascade::handle<Geom_Geometry>
") Copy;
		opencascade::handle<Geom_Geometry> Copy();

		/****************** D0 ******************/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "Returns in p the point of parameter u. //! if the basis curve is an offsetcurve sometimes it is not possible to do the evaluation of the curve at the parameter u (see class offsetcurve).

Parameters
----------
U: float
P: gp_Pnt

Returns
-------
None
") D0;
		void D0(const Standard_Real U, gp_Pnt & P);

		/****************** D1 ******************/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "Raised if the continuity of the curve is not c1.

Parameters
----------
U: float
P: gp_Pnt
V1: gp_Vec

Returns
-------
None
") D1;
		void D1(const Standard_Real U, gp_Pnt & P, gp_Vec & V1);

		/****************** D2 ******************/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "Raised if the continuity of the curve is not c2.

Parameters
----------
U: float
P: gp_Pnt
V1: gp_Vec
V2: gp_Vec

Returns
-------
None
") D2;
		void D2(const Standard_Real U, gp_Pnt & P, gp_Vec & V1, gp_Vec & V2);

		/****************** D3 ******************/
		%feature("compactdefaultargs") D3;
		%feature("autodoc", "Raised if the continuity of the curve is not c3.

Parameters
----------
U: float
P: gp_Pnt
V1: gp_Vec
V2: gp_Vec
V3: gp_Vec

Returns
-------
None
") D3;
		void D3(const Standard_Real U, gp_Pnt & P, gp_Vec & V1, gp_Vec & V2, gp_Vec & V3);

		/****************** DN ******************/
		%feature("compactdefaultargs") DN;
		%feature("autodoc", "N is the order of derivation. raised if the continuity of the curve is not cn. raised if n < 1. geometric transformations.

Parameters
----------
U: float
N: int

Returns
-------
gp_Vec
") DN;
		gp_Vec DN(const Standard_Real U, const Standard_Integer N);

		/****************** EndPoint ******************/
		%feature("compactdefaultargs") EndPoint;
		%feature("autodoc", "Returns the end point of <self>. this point is the evaluation of the curve for the 'lastparameter'.

Returns
-------
gp_Pnt
") EndPoint;
		gp_Pnt EndPoint();

		/****************** FirstParameter ******************/
		%feature("compactdefaultargs") FirstParameter;
		%feature("autodoc", "Returns the value of the first parameter of <self>. the first parameter is the parameter of the 'startpoint' of the trimmed curve.

Returns
-------
float
") FirstParameter;
		Standard_Real FirstParameter();

		/****************** IsCN ******************/
		%feature("compactdefaultargs") IsCN;
		%feature("autodoc", "Returns true if the degree of continuity of the basis curve of this trimmed curve is at least n. a trimmed curve is at least 'c0' continuous. warnings : the continuity of the trimmed curve can be greater than the continuity of the basis curve because you consider only a part of the basis curve. raised if n < 0.

Parameters
----------
N: int

Returns
-------
bool
") IsCN;
		Standard_Boolean IsCN(const Standard_Integer N);

		/****************** IsClosed ******************/
		%feature("compactdefaultargs") IsClosed;
		%feature("autodoc", "Returns true if the distance between the startpoint and the endpoint is lower or equal to resolution from package gp.

Returns
-------
bool
") IsClosed;
		Standard_Boolean IsClosed();

		/****************** IsPeriodic ******************/
		%feature("compactdefaultargs") IsPeriodic;
		%feature("autodoc", "Always returns false (independently of the type of basis curve).

Returns
-------
bool
") IsPeriodic;
		Standard_Boolean IsPeriodic();

		/****************** LastParameter ******************/
		%feature("compactdefaultargs") LastParameter;
		%feature("autodoc", "Returns the value of the last parameter of <self>. the last parameter is the parameter of the 'endpoint' of the trimmed curve.

Returns
-------
float
") LastParameter;
		Standard_Real LastParameter();

		/****************** ParametricTransformation ******************/
		%feature("compactdefaultargs") ParametricTransformation;
		%feature("autodoc", "Returns a coefficient to compute the parameter on the transformed curve for the transform of the point on <self>. //! transformed(t)->value(u * parametrictransformation(t)) //! is the same point as //! value(u).transformed(t) //! this methods calls the basis curve method.

Parameters
----------
T: gp_Trsf

Returns
-------
float
") ParametricTransformation;
		virtual Standard_Real ParametricTransformation(const gp_Trsf & T);

		/****************** Period ******************/
		%feature("compactdefaultargs") Period;
		%feature("autodoc", "Returns the period of the basis curve of this trimmed curve. exceptions standard_nosuchobject if the basis curve is not periodic.

Returns
-------
float
") Period;
		virtual Standard_Real Period();

		/****************** Reverse ******************/
		%feature("compactdefaultargs") Reverse;
		%feature("autodoc", "Changes the orientation of this trimmed curve. as a result: - the basis curve is reversed, - the start point of the initial curve becomes the end point of the reversed curve, - the end point of the initial curve becomes the start point of the reversed curve, - the first and last parameters are recomputed. if the trimmed curve was defined by: - a basis curve whose parameter range is [ 0., 1. ], - the two trim values u1 (first parameter) and u2 (last parameter), the reversed trimmed curve is defined by: - the reversed basis curve, whose parameter range is still [ 0., 1. ], - the two trim values 1. - u2 (first parameter) and 1. - u1 (last parameter).

Returns
-------
None
") Reverse;
		void Reverse();

		/****************** ReversedParameter ******************/
		%feature("compactdefaultargs") ReversedParameter;
		%feature("autodoc", "Computes the parameter on the reversed curve for the point of parameter u on this trimmed curve.

Parameters
----------
U: float

Returns
-------
float
") ReversedParameter;
		Standard_Real ReversedParameter(const Standard_Real U);

		/****************** SetTrim ******************/
		%feature("compactdefaultargs") SetTrim;
		%feature("autodoc", "Changes this trimmed curve, by redefining the parameter values u1 and u2 which limit its basis curve. note: if the basis curve is periodic, the trimmed curve has the same orientation as the basis curve if sense is true (default value) or the opposite orientation if sense is false. warning if the basis curve is periodic and theadjustperiodic is true, the bounds of the trimmed curve may be different from u1 and u2 if the parametric origin of the basis curve is within the arc of the trimmed curve. in this case, the modified parameter will be equal to u1 or u2 plus or minus the period. when theadjustperiodic is false, parameters u1 and u2 will be the same, without adjustment into the first period. exceptions standard_constructionerror if: - the basis curve is not periodic, and either u1 or u2 are outside the bounds of the basis curve, or - u1 is equal to u2.

Parameters
----------
U1: float
U2: float
Sense: bool,optional
	default value is Standard_True
theAdjustPeriodic: bool,optional
	default value is Standard_True

Returns
-------
None
") SetTrim;
		void SetTrim(const Standard_Real U1, const Standard_Real U2, const Standard_Boolean Sense = Standard_True, const Standard_Boolean theAdjustPeriodic = Standard_True);

		/****************** StartPoint ******************/
		%feature("compactdefaultargs") StartPoint;
		%feature("autodoc", "Returns the start point of <self>. this point is the evaluation of the curve from the 'firstparameter'. value and derivatives warnings : the returned derivatives have the same orientation as the derivatives of the basis curve even if the trimmed curve has not the same orientation as the basis curve.

Returns
-------
gp_Pnt
") StartPoint;
		gp_Pnt StartPoint();

		/****************** Transform ******************/
		%feature("compactdefaultargs") Transform;
		%feature("autodoc", "Applies the transformation t to this trimmed curve. warning the basis curve is also modified.

Parameters
----------
T: gp_Trsf

Returns
-------
None
") Transform;
		void Transform(const gp_Trsf & T);

		/****************** TransformedParameter ******************/
		%feature("compactdefaultargs") TransformedParameter;
		%feature("autodoc", "Returns the parameter on the transformed curve for the transform of the point of parameter u on <self>. //! me->transformed(t)->value(me->transformedparameter(u,t)) //! is the same point as //! me->value(u).transformed(t) //! this methods calls the basis curve method.

Parameters
----------
U: float
T: gp_Trsf

Returns
-------
float
") TransformedParameter;
		virtual Standard_Real TransformedParameter(const Standard_Real U, const gp_Trsf & T);

};


%make_alias(Geom_TrimmedCurve)

%extend Geom_TrimmedCurve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* harray1 classes */
/* harray2 classes */
/* hsequence classes */
class Geom_HSequenceOfBSplineSurface : public Geom_SequenceOfBSplineSurface, public Standard_Transient {
  public:
    Geom_HSequenceOfBSplineSurface();
    Geom_HSequenceOfBSplineSurface(const Geom_SequenceOfBSplineSurface& theOther);
    const Geom_SequenceOfBSplineSurface& Sequence();
    void Append (const Geom_SequenceOfBSplineSurface::value_type& theItem);
    void Append (Geom_SequenceOfBSplineSurface& theSequence);
    Geom_SequenceOfBSplineSurface& ChangeSequence();
};
%make_alias(Geom_HSequenceOfBSplineSurface)


