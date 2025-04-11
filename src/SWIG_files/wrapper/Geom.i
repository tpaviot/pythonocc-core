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
%define GEOMDOCSTRING
"Geom module, see official documentation at
https://dev.opencascade.org/doc/occt-7.9.0/refman/html/package_geom.html"
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
%include ../common/EnumTemplates.i
%include ../common/Operators.i
%include ../common/OccHandle.i
%include ../common/IOStream.i
%include ../common/ArrayMacros.i


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

/*
numpy support for Geom, Geom2d, Poly, TColStd, TColgp, TShort see
https://github.com/tpaviot/pythonocc-core/pull/1381
*/
%{
#define SWIG_FILE_WITH_INIT
%}
%include ../common/numpy.i

%init %{
        import_array();
%}

%pythoncode {
    import numpy as np
}
%apply (double* IN_ARRAY1, int DIM1) { (double* numpyArrayU, int nRowsU) };
%apply (double* IN_ARRAY2, int DIM1, int DIM2) { (double* numpyArrayUV, int nRowsUV, int nColUV) };
%apply (double* ARGOUT_ARRAY1, int DIM1) { (double* numpyArrayResultArgout, int aSizeArgout) };

/*
end of numpy support section
*/
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

/* python proxy classes for enums */
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

%extend NCollection_Sequence<opencascade::handle<Geom_BSplineSurface>> {
    %pythoncode {
    def __len__(self):
        return self.Size()
    }
};
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
		/****** Geom_Geometry::Copy ******/
		/****** md5 signature: a934295692540e96ea5abfee672e9912 ******/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom_Geometry>

Description
-----------
Creates a new object which is a copy of this geometric object.
") Copy;
		virtual opencascade::handle<Geom_Geometry> Copy();


        /****************** DumpJson ******************/
        %feature("autodoc", "
Parameters
----------
depth: int, default=-1

Return
-------
str

Description
-----------
Dump the object to JSON string.
") DumpJson;
        %extend{
            std::string DumpJson(int depth=-1) {
            std::stringstream s;
            self->DumpJson(s, depth);
            return "{" + s.str() + "}" ;}
        };
		/****** Geom_Geometry::Mirror ******/
		/****** md5 signature: b133f2e6e1c74f672a216a0094bdfda6 ******/
		%feature("compactdefaultargs") Mirror;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt

Return
-------
None

Description
-----------
Performs the symmetrical transformation of a Geometry with respect to the point P which is the center of the symmetry.
") Mirror;
		void Mirror(const gp_Pnt & P);

		/****** Geom_Geometry::Mirror ******/
		/****** md5 signature: d1a0189a98d756bd9e5b51b4ae49992a ******/
		%feature("compactdefaultargs") Mirror;
		%feature("autodoc", "
Parameters
----------
A1: gp_Ax1

Return
-------
None

Description
-----------
Performs the symmetrical transformation of a Geometry with respect to an axis placement which is the axis of the symmetry.
") Mirror;
		void Mirror(const gp_Ax1 & A1);

		/****** Geom_Geometry::Mirror ******/
		/****** md5 signature: 874cde0169043be133e205e960c3ca57 ******/
		%feature("compactdefaultargs") Mirror;
		%feature("autodoc", "
Parameters
----------
A2: gp_Ax2

Return
-------
None

Description
-----------
Performs the symmetrical transformation of a Geometry with respect to a plane. The axis placement A2 locates the plane of the symmetry: (Location, XDirection, YDirection).
") Mirror;
		void Mirror(const gp_Ax2 & A2);

		/****** Geom_Geometry::Mirrored ******/
		/****** md5 signature: a8f893c21e87dedda7a258bfc0f54e1c ******/
		%feature("compactdefaultargs") Mirrored;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt

Return
-------
opencascade::handle<Geom_Geometry>

Description
-----------
No available documentation.
") Mirrored;
		opencascade::handle<Geom_Geometry> Mirrored(const gp_Pnt & P);

		/****** Geom_Geometry::Mirrored ******/
		/****** md5 signature: db30e3408f004fea91507f7e19927706 ******/
		%feature("compactdefaultargs") Mirrored;
		%feature("autodoc", "
Parameters
----------
A1: gp_Ax1

Return
-------
opencascade::handle<Geom_Geometry>

Description
-----------
No available documentation.
") Mirrored;
		opencascade::handle<Geom_Geometry> Mirrored(const gp_Ax1 & A1);

		/****** Geom_Geometry::Mirrored ******/
		/****** md5 signature: f93a8d60c38e0a2a46eca34899f0eef1 ******/
		%feature("compactdefaultargs") Mirrored;
		%feature("autodoc", "
Parameters
----------
A2: gp_Ax2

Return
-------
opencascade::handle<Geom_Geometry>

Description
-----------
No available documentation.
") Mirrored;
		opencascade::handle<Geom_Geometry> Mirrored(const gp_Ax2 & A2);

		/****** Geom_Geometry::Rotate ******/
		/****** md5 signature: 12c4967f27a0900e4176252164d2f2ce ******/
		%feature("compactdefaultargs") Rotate;
		%feature("autodoc", "
Parameters
----------
A1: gp_Ax1
Ang: float

Return
-------
None

Description
-----------
Rotates a Geometry. A1 is the axis of the rotation. Ang is the angular value of the rotation in radians.
") Rotate;
		void Rotate(const gp_Ax1 & A1, const Standard_Real Ang);

		/****** Geom_Geometry::Rotated ******/
		/****** md5 signature: cb5a01a90604da02e01690d5f3ec0573 ******/
		%feature("compactdefaultargs") Rotated;
		%feature("autodoc", "
Parameters
----------
A1: gp_Ax1
Ang: float

Return
-------
opencascade::handle<Geom_Geometry>

Description
-----------
No available documentation.
") Rotated;
		opencascade::handle<Geom_Geometry> Rotated(const gp_Ax1 & A1, const Standard_Real Ang);

		/****** Geom_Geometry::Scale ******/
		/****** md5 signature: e66fc526c4232f21fb4238a81292d522 ******/
		%feature("compactdefaultargs") Scale;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt
S: float

Return
-------
None

Description
-----------
Scales a Geometry. S is the scaling value.
") Scale;
		void Scale(const gp_Pnt & P, const Standard_Real S);

		/****** Geom_Geometry::Scaled ******/
		/****** md5 signature: b56b19e6f209b14dfb703b8090a22d67 ******/
		%feature("compactdefaultargs") Scaled;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt
S: float

Return
-------
opencascade::handle<Geom_Geometry>

Description
-----------
No available documentation.
") Scaled;
		opencascade::handle<Geom_Geometry> Scaled(const gp_Pnt & P, const Standard_Real S);

		/****** Geom_Geometry::Transform ******/
		/****** md5 signature: a1d3460922b11ae022509ed1313e419c ******/
		%feature("compactdefaultargs") Transform;
		%feature("autodoc", "
Parameters
----------
T: gp_Trsf

Return
-------
None

Description
-----------
Transformation of a geometric object. This transformation can be a translation, a rotation, a symmetry, a scaling or a complex transformation obtained by combination of the previous elementaries transformations. (see class Transformation of the package Geom).
") Transform;
		virtual void Transform(const gp_Trsf & T);

		/****** Geom_Geometry::Transformed ******/
		/****** md5 signature: 01661dc392d3d2a24efc55e2ff689cf0 ******/
		%feature("compactdefaultargs") Transformed;
		%feature("autodoc", "
Parameters
----------
T: gp_Trsf

Return
-------
opencascade::handle<Geom_Geometry>

Description
-----------
No available documentation.
") Transformed;
		opencascade::handle<Geom_Geometry> Transformed(const gp_Trsf & T);

		/****** Geom_Geometry::Translate ******/
		/****** md5 signature: b3667af07c9a238180bc31cc15803f78 ******/
		%feature("compactdefaultargs") Translate;
		%feature("autodoc", "
Parameters
----------
V: gp_Vec

Return
-------
None

Description
-----------
Translates a Geometry. V is the vector of the translation.
") Translate;
		void Translate(const gp_Vec & V);

		/****** Geom_Geometry::Translate ******/
		/****** md5 signature: 5053222ade9605c7c37102310f06f2e8 ******/
		%feature("compactdefaultargs") Translate;
		%feature("autodoc", "
Parameters
----------
P1: gp_Pnt
P2: gp_Pnt

Return
-------
None

Description
-----------
Translates a Geometry from the point P1 to the point P2.
") Translate;
		void Translate(const gp_Pnt & P1, const gp_Pnt & P2);

		/****** Geom_Geometry::Translated ******/
		/****** md5 signature: 804237ab31c102b2e6f8a6d70f0855f4 ******/
		%feature("compactdefaultargs") Translated;
		%feature("autodoc", "
Parameters
----------
V: gp_Vec

Return
-------
opencascade::handle<Geom_Geometry>

Description
-----------
No available documentation.
") Translated;
		opencascade::handle<Geom_Geometry> Translated(const gp_Vec & V);

		/****** Geom_Geometry::Translated ******/
		/****** md5 signature: f47ac651fdf54fc6c047f11123eafd90 ******/
		%feature("compactdefaultargs") Translated;
		%feature("autodoc", "
Parameters
----------
P1: gp_Pnt
P2: gp_Pnt

Return
-------
opencascade::handle<Geom_Geometry>

Description
-----------
No available documentation.
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
		/****** Geom_OsculatingSurface::Geom_OsculatingSurface ******/
		/****** md5 signature: 1ee8edb50ce59753aeed0bf012ba88e5 ******/
		%feature("compactdefaultargs") Geom_OsculatingSurface;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Geom_OsculatingSurface;
		 Geom_OsculatingSurface();

		/****** Geom_OsculatingSurface::Geom_OsculatingSurface ******/
		/****** md5 signature: 6805f264f7a2aca9c843e15662924f3b ******/
		%feature("compactdefaultargs") Geom_OsculatingSurface;
		%feature("autodoc", "
Parameters
----------
BS: Geom_Surface
Tol: float

Return
-------
None

Description
-----------
detects if the surface has punctual U or V isoparametric curve along on the bounds of the surface relatively to the tolerance Tol and Builds the corresponding osculating surfaces.
") Geom_OsculatingSurface;
		 Geom_OsculatingSurface(const opencascade::handle<Geom_Surface> & BS, const Standard_Real Tol);

		/****** Geom_OsculatingSurface::BasisSurface ******/
		/****** md5 signature: 8dbbf01303a0ac26e255b604d8f6addc ******/
		%feature("compactdefaultargs") BasisSurface;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom_Surface>

Description
-----------
No available documentation.
") BasisSurface;
		opencascade::handle<Geom_Surface> BasisSurface();


        /****************** DumpJson ******************/
        %feature("autodoc", "
Parameters
----------
depth: int, default=-1

Return
-------
str

Description
-----------
Dump the object to JSON string.
") DumpJson;
        %extend{
            std::string DumpJson(int depth=-1) {
            std::stringstream s;
            self->DumpJson(s, depth);
            return "{" + s.str() + "}" ;}
        };
		/****** Geom_OsculatingSurface::Init ******/
		/****** md5 signature: 05c5bc64624158cab2c176b4ec75d4d9 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
BS: Geom_Surface
Tol: float

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const opencascade::handle<Geom_Surface> & BS, const Standard_Real Tol);

		/****** Geom_OsculatingSurface::Tolerance ******/
		/****** md5 signature: 9e5775014410d884d1a1adc1cd47930b ******/
		%feature("compactdefaultargs") Tolerance;
		%feature("autodoc", "Return
-------
float

Description
-----------
No available documentation.
") Tolerance;
		Standard_Real Tolerance();

		/****** Geom_OsculatingSurface::UOscSurf ******/
		/****** md5 signature: d214d7f2559a57bdb210c2f1992638e5 ******/
		%feature("compactdefaultargs") UOscSurf;
		%feature("autodoc", "
Parameters
----------
U: float
V: float
L: Geom_BSplineSurface

Return
-------
t: bool

Description
-----------
if Standard_True, L is the local osculating surface along U at the point U,V.
") UOscSurf;
		Standard_Boolean UOscSurf(const Standard_Real U, const Standard_Real V, Standard_Boolean &OutValue, opencascade::handle<Geom_BSplineSurface> & L);

		/****** Geom_OsculatingSurface::VOscSurf ******/
		/****** md5 signature: 9fe9b662c9482f9ffa9e40c07368f309 ******/
		%feature("compactdefaultargs") VOscSurf;
		%feature("autodoc", "
Parameters
----------
U: float
V: float
L: Geom_BSplineSurface

Return
-------
t: bool

Description
-----------
if Standard_True, L is the local osculating surface along V at the point U,V.
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
		/****** Geom_Transformation::Geom_Transformation ******/
		/****** md5 signature: 3d50c253a0394eb32e349fc6d7c0c03d ******/
		%feature("compactdefaultargs") Geom_Transformation;
		%feature("autodoc", "Return
-------
None

Description
-----------
Creates an identity transformation.
") Geom_Transformation;
		 Geom_Transformation();

		/****** Geom_Transformation::Geom_Transformation ******/
		/****** md5 signature: 9cce9b1002d60d4d45b18623bd27d755 ******/
		%feature("compactdefaultargs") Geom_Transformation;
		%feature("autodoc", "
Parameters
----------
T: gp_Trsf

Return
-------
None

Description
-----------
Creates a transient copy of T.
") Geom_Transformation;
		 Geom_Transformation(const gp_Trsf & T);

		/****** Geom_Transformation::Copy ******/
		/****** md5 signature: 07d5b3f64c43268b3d92da2f43bfadfe ******/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom_Transformation>

Description
-----------
Creates a new object which is a copy of this transformation.
") Copy;
		opencascade::handle<Geom_Transformation> Copy();


        /****************** DumpJson ******************/
        %feature("autodoc", "
Parameters
----------
depth: int, default=-1

Return
-------
str

Description
-----------
Dump the object to JSON string.
") DumpJson;
        %extend{
            std::string DumpJson(int depth=-1) {
            std::stringstream s;
            self->DumpJson(s, depth);
            return "{" + s.str() + "}" ;}
        };
		/****** Geom_Transformation::Form ******/
		/****** md5 signature: f29bb1eb1523b456c279366338ab9947 ******/
		%feature("compactdefaultargs") Form;
		%feature("autodoc", "Return
-------
gp_TrsfForm

Description
-----------
Returns the nature of this transformation as a value of the gp_TrsfForm enumeration.
") Form;
		gp_TrsfForm Form();

		/****** Geom_Transformation::Invert ******/
		/****** md5 signature: 27ae24404e0570a708e2e3589a9d9074 ******/
		%feature("compactdefaultargs") Invert;
		%feature("autodoc", "Return
-------
None

Description
-----------
Raised if the transformation is singular. This means that the ScaleFactor is lower or equal to Resolution from package gp.
") Invert;
		void Invert();

		/****** Geom_Transformation::Inverted ******/
		/****** md5 signature: a7f4838eb23ef8226ce1998df318c767 ******/
		%feature("compactdefaultargs") Inverted;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom_Transformation>

Description
-----------
Raised if the transformation is singular. This means that the ScaleFactor is lower or equal to Resolution from package gp.
") Inverted;
		opencascade::handle<Geom_Transformation> Inverted();

		/****** Geom_Transformation::IsNegative ******/
		/****** md5 signature: 4a3d241c868ecfc4b59898855c5acee1 ******/
		%feature("compactdefaultargs") IsNegative;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Checks whether this transformation is an indirect transformation: returns true if the determinant of the matrix of the vectorial part of the transformation is less than 0.
") IsNegative;
		Standard_Boolean IsNegative();

		/****** Geom_Transformation::Multiplied ******/
		/****** md5 signature: 71e173a64e0e4d8853e47622b257cfeb ******/
		%feature("compactdefaultargs") Multiplied;
		%feature("autodoc", "
Parameters
----------
Other: Geom_Transformation

Return
-------
opencascade::handle<Geom_Transformation>

Description
-----------
Computes the transformation composed with Other and <self>. <self> * Other. Returns a new transformation.
") Multiplied;
		opencascade::handle<Geom_Transformation> Multiplied(const opencascade::handle<Geom_Transformation> & Other);

		/****** Geom_Transformation::Multiply ******/
		/****** md5 signature: f2958e50263d3c8beb71a98ab2738788 ******/
		%feature("compactdefaultargs") Multiply;
		%feature("autodoc", "
Parameters
----------
theOther: Geom_Transformation

Return
-------
None

Description
-----------
Computes the transformation composed with Other and <self> . <self> = <self> * Other.
") Multiply;
		void Multiply(const opencascade::handle<Geom_Transformation> & theOther);

		/****** Geom_Transformation::Power ******/
		/****** md5 signature: b0a91d705e2c59e2c06b5d1e8653c266 ******/
		%feature("compactdefaultargs") Power;
		%feature("autodoc", "
Parameters
----------
N: int

Return
-------
None

Description
-----------
Computes the following composition of transformations if N > 0 <self> * <self> * .......* <self>. if N = 0 Identity if N < 0 <self>.Invert() * .........* <self>.Invert() //! Raised if N < 0 and if the transformation is not inversible.
") Power;
		void Power(const Standard_Integer N);

		/****** Geom_Transformation::Powered ******/
		/****** md5 signature: 09f92389ad4c408e25d52b4bfd9123f3 ******/
		%feature("compactdefaultargs") Powered;
		%feature("autodoc", "
Parameters
----------
N: int

Return
-------
opencascade::handle<Geom_Transformation>

Description
-----------
Raised if N < 0 and if the transformation is not inversible.
") Powered;
		opencascade::handle<Geom_Transformation> Powered(const Standard_Integer N);

		/****** Geom_Transformation::PreMultiply ******/
		/****** md5 signature: b5036346785a93fa4e2524abf7a94067 ******/
		%feature("compactdefaultargs") PreMultiply;
		%feature("autodoc", "
Parameters
----------
Other: Geom_Transformation

Return
-------
None

Description
-----------
Computes the matrix of the transformation composed with <self> and Other. <self> = Other * <self>.
") PreMultiply;
		void PreMultiply(const opencascade::handle<Geom_Transformation> & Other);

		/****** Geom_Transformation::ScaleFactor ******/
		/****** md5 signature: bf80fcb76494dd02d25b2cd942a598b0 ******/
		%feature("compactdefaultargs") ScaleFactor;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the scale value of the transformation.
") ScaleFactor;
		Standard_Real ScaleFactor();

		/****** Geom_Transformation::SetMirror ******/
		/****** md5 signature: 018517f54000b1b8726ef644507d76de ******/
		%feature("compactdefaultargs") SetMirror;
		%feature("autodoc", "
Parameters
----------
thePnt: gp_Pnt

Return
-------
None

Description
-----------
Makes the transformation into a symmetrical transformation with respect to a point P. P is the center of the symmetry.
") SetMirror;
		void SetMirror(const gp_Pnt & thePnt);

		/****** Geom_Transformation::SetMirror ******/
		/****** md5 signature: 1a201338be7eefc42fbfdeaac149a919 ******/
		%feature("compactdefaultargs") SetMirror;
		%feature("autodoc", "
Parameters
----------
theA1: gp_Ax1

Return
-------
None

Description
-----------
Makes the transformation into a symmetrical transformation with respect to an axis A1. A1 is the center of the axial symmetry.
") SetMirror;
		void SetMirror(const gp_Ax1 & theA1);

		/****** Geom_Transformation::SetMirror ******/
		/****** md5 signature: 3c09d72f63f586d362aff02f8c6c7071 ******/
		%feature("compactdefaultargs") SetMirror;
		%feature("autodoc", "
Parameters
----------
theA2: gp_Ax2

Return
-------
None

Description
-----------
Makes the transformation into a symmetrical transformation with respect to a plane. The plane of the symmetry is defined with the axis placement A2. It is the plane (Location, XDirection, YDirection).
") SetMirror;
		void SetMirror(const gp_Ax2 & theA2);

		/****** Geom_Transformation::SetRotation ******/
		/****** md5 signature: 2da91cfc39e0fe56bfb0d5751f6035e6 ******/
		%feature("compactdefaultargs") SetRotation;
		%feature("autodoc", "
Parameters
----------
theA1: gp_Ax1
theAng: float

Return
-------
None

Description
-----------
Makes the transformation into a rotation. A1 is the axis rotation and Ang is the angular value of the rotation in radians.
") SetRotation;
		void SetRotation(const gp_Ax1 & theA1, const Standard_Real theAng);

		/****** Geom_Transformation::SetScale ******/
		/****** md5 signature: bed998146235d63758e4787ea7082fd7 ******/
		%feature("compactdefaultargs") SetScale;
		%feature("autodoc", "
Parameters
----------
thePnt: gp_Pnt
theScale: float

Return
-------
None

Description
-----------
Makes the transformation into a scale. P is the center of the scale and S is the scaling value.
") SetScale;
		void SetScale(const gp_Pnt & thePnt, const Standard_Real theScale);

		/****** Geom_Transformation::SetTransformation ******/
		/****** md5 signature: 0442703330a767f0acf817a93f5412e6 ******/
		%feature("compactdefaultargs") SetTransformation;
		%feature("autodoc", "
Parameters
----------
theFromSystem1: gp_Ax3
theToSystem2: gp_Ax3

Return
-------
None

Description
-----------
Makes a transformation allowing passage from the coordinate system 'FromSystem1' to the coordinate system 'ToSystem2'. Example: In a C++ implementation: Real x1, y1, z1; // are the coordinates of a point in the // local system FromSystem1 Real x2, y2, z2; // are the coordinates of a point in the // local system ToSystem2 gp_Pnt P1 (x1, y1, z1) Geom_Transformation T; T.SetTransformation (FromSystem1, ToSystem2); gp_Pnt P2 = P1.Transformed (T); P2.Coord (x2, y2, z2);.
") SetTransformation;
		void SetTransformation(const gp_Ax3 & theFromSystem1, const gp_Ax3 & theToSystem2);

		/****** Geom_Transformation::SetTransformation ******/
		/****** md5 signature: 27fbfb85daa695dbbc27804c36e2df85 ******/
		%feature("compactdefaultargs") SetTransformation;
		%feature("autodoc", "
Parameters
----------
theToSystem: gp_Ax3

Return
-------
None

Description
-----------
Makes the transformation allowing passage from the basic coordinate system {P(0.,0.,0.), VX (1.,0.,0.), VY (0.,1.,0.), VZ (0., 0. ,1.) } to the local coordinate system defined with the Ax2 ToSystem. Same utilisation as the previous method. FromSystem1 is defaulted to the absolute coordinate system.
") SetTransformation;
		void SetTransformation(const gp_Ax3 & theToSystem);

		/****** Geom_Transformation::SetTranslation ******/
		/****** md5 signature: 84e68302c44b61de7fb68de9c123c14a ******/
		%feature("compactdefaultargs") SetTranslation;
		%feature("autodoc", "
Parameters
----------
theVec: gp_Vec

Return
-------
None

Description
-----------
Makes the transformation into a translation. V is the vector of the translation.
") SetTranslation;
		void SetTranslation(const gp_Vec & theVec);

		/****** Geom_Transformation::SetTranslation ******/
		/****** md5 signature: fe0ce663e2f47c1e48728781a5e08fc0 ******/
		%feature("compactdefaultargs") SetTranslation;
		%feature("autodoc", "
Parameters
----------
P1: gp_Pnt
P2: gp_Pnt

Return
-------
None

Description
-----------
Makes the transformation into a translation from the point P1 to the point P2.
") SetTranslation;
		void SetTranslation(const gp_Pnt & P1, const gp_Pnt & P2);

		/****** Geom_Transformation::SetTrsf ******/
		/****** md5 signature: 1a91030a3a81f641a81466daaf5c0c2f ******/
		%feature("compactdefaultargs") SetTrsf;
		%feature("autodoc", "
Parameters
----------
theTrsf: gp_Trsf

Return
-------
None

Description
-----------
Converts the gp_Trsf transformation T into this transformation.
") SetTrsf;
		void SetTrsf(const gp_Trsf & theTrsf);

		/****** Geom_Transformation::Transforms ******/
		/****** md5 signature: f2a89563519a1a2e66e96d7ba9d8a162 ******/
		%feature("compactdefaultargs") Transforms;
		%feature("autodoc", "
Parameters
----------

Return
-------
theX: float
theY: float
theZ: float

Description
-----------
Applies the transformation <self> to the triplet {X, Y, Z}.
") Transforms;
		void Transforms(Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** Geom_Transformation::Trsf ******/
		/****** md5 signature: 994369af5cf027a69090540425b26b58 ******/
		%feature("compactdefaultargs") Trsf;
		%feature("autodoc", "Return
-------
gp_Trsf

Description
-----------
Returns a non transient copy of <self>.
") Trsf;
		const gp_Trsf Trsf();

		/****** Geom_Transformation::Value ******/
		/****** md5 signature: db31835fbba84053249e8011cb71725d ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
theRow: int
theCol: int

Return
-------
float

Description
-----------
Returns the coefficients of the global matrix of transformation. It is a 3 rows X 4 columns matrix. //! Raised if Row < 1 or Row > 3 or Col < 1 or Col > 4.
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
		/****** Geom_AxisPlacement::Angle ******/
		/****** md5 signature: 5790a43e2c6e3e0e15204554178ae983 ******/
		%feature("compactdefaultargs") Angle;
		%feature("autodoc", "
Parameters
----------
Other: Geom_AxisPlacement

Return
-------
float

Description
-----------
Computes the angular value, in radians, between the 'main Direction' of this positioning system and that of positioning system Other. The result is a value between 0 and Pi.
") Angle;
		Standard_Real Angle(const opencascade::handle<Geom_AxisPlacement> & Other);

		/****** Geom_AxisPlacement::Axis ******/
		/****** md5 signature: cb9b52ff887b682f8bfc1eb2f646705a ******/
		%feature("compactdefaultargs") Axis;
		%feature("autodoc", "Return
-------
gp_Ax1

Description
-----------
Returns the main axis of the axis placement. For an 'Axis2placement' it is the main axis (Location, Direction ). For an 'Axis1Placement' this method returns a copy of <self>.
") Axis;
		const gp_Ax1 Axis();

		/****** Geom_AxisPlacement::Direction ******/
		/****** md5 signature: 7db1622a0b370b4453af0886bb5f840c ******/
		%feature("compactdefaultargs") Direction;
		%feature("autodoc", "Return
-------
gp_Dir

Description
-----------
Returns the main 'Direction' of an axis placement.
") Direction;
		gp_Dir Direction();

		/****** Geom_AxisPlacement::Location ******/
		/****** md5 signature: c56007a1ad6fefe1a8fd1240d909d17e ******/
		%feature("compactdefaultargs") Location;
		%feature("autodoc", "Return
-------
gp_Pnt

Description
-----------
Returns the Location point (origin) of the axis placement.
") Location;
		gp_Pnt Location();

		/****** Geom_AxisPlacement::SetAxis ******/
		/****** md5 signature: 4f1ae44e92ff7b1da601b2ca71a3a58a ******/
		%feature("compactdefaultargs") SetAxis;
		%feature("autodoc", "
Parameters
----------
A1: gp_Ax1

Return
-------
None

Description
-----------
Assigns A1 as the 'main Axis' of this positioning system. This modifies - its origin, and - its 'main Direction'. If this positioning system is a Geom_Axis2Placement, then its 'X Direction' and 'Y Direction' are recomputed. Exceptions For a Geom_Axis2Placement: Standard_ConstructionError if A1 and the previous 'X Direction' of the coordinate system are parallel.
") SetAxis;
		void SetAxis(const gp_Ax1 & A1);

		/****** Geom_AxisPlacement::SetDirection ******/
		/****** md5 signature: 2184c02693dfce4ecaebd04b6c10a730 ******/
		%feature("compactdefaultargs") SetDirection;
		%feature("autodoc", "
Parameters
----------
V: gp_Dir

Return
-------
None

Description
-----------
Changes the direction of the axis placement. If <self> is an axis placement two axis the main 'Direction' is modified and the 'XDirection' and 'YDirection' are recomputed. Raises ConstructionError only for an axis placement two axis if V and the previous 'XDirection' are parallel because it is not possible to calculate the new 'XDirection' and the new 'YDirection'.
") SetDirection;
		virtual void SetDirection(const gp_Dir & V);

		/****** Geom_AxisPlacement::SetLocation ******/
		/****** md5 signature: c028aee785b685956e8e7d5cba7ecb46 ******/
		%feature("compactdefaultargs") SetLocation;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt

Return
-------
None

Description
-----------
Assigns the point P as the origin of this positioning system.
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
		/****** Geom_Curve::Continuity ******/
		/****** md5 signature: 8dbb475c198ca068fb275dadeaaecf82 ******/
		%feature("compactdefaultargs") Continuity;
		%feature("autodoc", "Return
-------
GeomAbs_Shape

Description
-----------
It is the global continuity of the curve C0: only geometric continuity, C1: continuity of the first derivative all along the Curve, C2: continuity of the second derivative all along the Curve, C3: continuity of the third derivative all along the Curve, G1: tangency continuity all along the Curve, G2: curvature continuity all along the Curve, CN: the order of continuity is infinite.
") Continuity;
		virtual GeomAbs_Shape Continuity();

		/****** Geom_Curve::D0 ******/
		/****** md5 signature: 3375707864bca566a2f8c23866c10a67 ******/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "
Parameters
----------
U: float
P: gp_Pnt

Return
-------
None

Description
-----------
Returns in P the point of parameter U. If the curve is periodic then the returned point is P(U) with U = Ustart + (U - Uend) where Ustart and Uend are the parametric bounds of the curve. //! Raised only for the 'OffsetCurve' if it is not possible to compute the current point. For example when the first derivative on the basis curve and the offset direction are parallel.
") D0;
		virtual void D0(const Standard_Real U, gp_Pnt & P);

		/****** Geom_Curve::D1 ******/
		/****** md5 signature: 89cd394b2ffd1198b81d32873974b234 ******/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "
Parameters
----------
U: float
P: gp_Pnt
V1: gp_Vec

Return
-------
None

Description
-----------
Returns the point P of parameter U and the first derivative V1. Raised if the continuity of the curve is not C1.
") D1;
		virtual void D1(const Standard_Real U, gp_Pnt & P, gp_Vec & V1);

		/****** Geom_Curve::D2 ******/
		/****** md5 signature: 024994d212dd3b4aa49741339d125c2b ******/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "
Parameters
----------
U: float
P: gp_Pnt
V1: gp_Vec
V2: gp_Vec

Return
-------
None

Description
-----------
Returns the point P of parameter U, the first and second derivatives V1 and V2. Raised if the continuity of the curve is not C2.
") D2;
		virtual void D2(const Standard_Real U, gp_Pnt & P, gp_Vec & V1, gp_Vec & V2);

		/****** Geom_Curve::D3 ******/
		/****** md5 signature: 40d448ccc90da6aafa9dfe27018a93d8 ******/
		%feature("compactdefaultargs") D3;
		%feature("autodoc", "
Parameters
----------
U: float
P: gp_Pnt
V1: gp_Vec
V2: gp_Vec
V3: gp_Vec

Return
-------
None

Description
-----------
Returns the point P of parameter U, the first, the second and the third derivative. Raised if the continuity of the curve is not C3.
") D3;
		virtual void D3(const Standard_Real U, gp_Pnt & P, gp_Vec & V1, gp_Vec & V2, gp_Vec & V3);

		/****** Geom_Curve::DN ******/
		/****** md5 signature: 5f534d3ebc7a93ebbca7a9711f3bbf69 ******/
		%feature("compactdefaultargs") DN;
		%feature("autodoc", "
Parameters
----------
U: float
N: int

Return
-------
gp_Vec

Description
-----------
The returned vector gives the value of the derivative for the order of derivation N. Raised if the continuity of the curve is not CN. //! Raised if the derivative cannot be computed easily. e.g. rational bspline and n > 3. Raised if N < 1.
") DN;
		virtual gp_Vec DN(const Standard_Real U, const Standard_Integer N);


        /****************** DumpJson ******************/
        %feature("autodoc", "
Parameters
----------
depth: int, default=-1

Return
-------
str

Description
-----------
Dump the object to JSON string.
") DumpJson;
        %extend{
            std::string DumpJson(int depth=-1) {
            std::stringstream s;
            self->DumpJson(s, depth);
            return "{" + s.str() + "}" ;}
        };
		/****** Geom_Curve::FirstParameter ******/
		/****** md5 signature: d1641ead93c23610f9b5155af230348d ******/
		%feature("compactdefaultargs") FirstParameter;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the value of the first parameter. Warnings: It can be RealFirst from package Standard if the curve is infinite.
") FirstParameter;
		virtual Standard_Real FirstParameter();

		/****** Geom_Curve::IsCN ******/
		/****** md5 signature: cdc71317785ad261bf847a4d35bd338d ******/
		%feature("compactdefaultargs") IsCN;
		%feature("autodoc", "
Parameters
----------
N: int

Return
-------
bool

Description
-----------
Returns true if the degree of continuity of this curve is at least N. Exceptions - Standard_RangeError if N is less than 0.
") IsCN;
		virtual Standard_Boolean IsCN(const Standard_Integer N);

		/****** Geom_Curve::IsClosed ******/
		/****** md5 signature: be44ba5ab9beeb7f60f33a5068f1446b ******/
		%feature("compactdefaultargs") IsClosed;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if the curve is closed. Some curves such as circle are always closed, others such as line are never closed (by definition). Some Curves such as OffsetCurve can be closed or not. These curves are considered as closed if the distance between the first point and the last point of the curve is lower or equal to the Resolution from package gp which is a fixed criterion independent of the application.
") IsClosed;
		virtual Standard_Boolean IsClosed();

		/****** Geom_Curve::IsPeriodic ******/
		/****** md5 signature: d56d22c204e88ed05ef91fdcfed4696c ******/
		%feature("compactdefaultargs") IsPeriodic;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Is the parametrization of the curve periodic ? It is possible only if the curve is closed and if the following relation is satisfied: for each parametric value U the distance between the point P(u) and the point P (u + T) is lower or equal to Resolution from package gp, T is the period and must be a constant. There are three possibilities: . the curve is never periodic by definition (SegmentLine) . the curve is always periodic by definition (Circle) . the curve can be defined as periodic (BSpline). In this case a function SetPeriodic allows you to give the shape of the curve. The general rule for this case is: if a curve can be periodic or not the default periodicity set is non periodic and you have to turn (explicitly) the curve into a periodic curve if you want the curve to be periodic.
") IsPeriodic;
		virtual Standard_Boolean IsPeriodic();

		/****** Geom_Curve::LastParameter ******/
		/****** md5 signature: 78c346d133438e913e50667c32977882 ******/
		%feature("compactdefaultargs") LastParameter;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the value of the last parameter. Warnings: It can be RealLast from package Standard if the curve is infinite.
") LastParameter;
		virtual Standard_Real LastParameter();

		/****** Geom_Curve::ParametricTransformation ******/
		/****** md5 signature: bdca45730355736db0adad0640921553 ******/
		%feature("compactdefaultargs") ParametricTransformation;
		%feature("autodoc", "
Parameters
----------
T: gp_Trsf

Return
-------
float

Description
-----------
Returns a coefficient to compute the parameter on the transformed curve for the transform of the point on <self>. //! Transformed(T)->Value(U * ParametricTransformation(T)) //! is the same point as //! Value(U).Transformed(T) //! This methods returns 1. //! It can be redefined. For example on the Line.
") ParametricTransformation;
		virtual Standard_Real ParametricTransformation(const gp_Trsf & T);

		/****** Geom_Curve::Period ******/
		/****** md5 signature: e4913c399f3a0a7037e498c5a9da8e1f ******/
		%feature("compactdefaultargs") Period;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the period of this curve. Exceptions Standard_NoSuchObject if this curve is not periodic.
") Period;
		virtual Standard_Real Period();

		/****** Geom_Curve::Reverse ******/
		/****** md5 signature: a5409b070cc6638cc52d06409c4a4a1c ******/
		%feature("compactdefaultargs") Reverse;
		%feature("autodoc", "Return
-------
None

Description
-----------
Changes the direction of parametrization of <self>. The 'FirstParameter' and the 'LastParameter' are not changed but the orientation of the curve is modified. If the curve is bounded the StartPoint of the initial curve becomes the EndPoint of the reversed curve and the EndPoint of the initial curve becomes the StartPoint of the reversed curve.
") Reverse;
		virtual void Reverse();

		/****** Geom_Curve::Reversed ******/
		/****** md5 signature: a1d1c184b082313d97066c45d18bc774 ******/
		%feature("compactdefaultargs") Reversed;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom_Curve>

Description
-----------
Returns a copy of <self> reversed.
") Reversed;
		opencascade::handle<Geom_Curve> Reversed();

		/****** Geom_Curve::ReversedParameter ******/
		/****** md5 signature: 1e6faad2f92c4f0b35b1d30d75ce1d6e ******/
		%feature("compactdefaultargs") ReversedParameter;
		%feature("autodoc", "
Parameters
----------
U: float

Return
-------
float

Description
-----------
Returns the parameter on the reversed curve for the point of parameter U on <self>. //! me->Reversed()->Value(me->ReversedParameter(U)) //! is the same point as //! me->Value(U).
") ReversedParameter;
		virtual Standard_Real ReversedParameter(const Standard_Real U);

		/****** Geom_Curve::TransformedParameter ******/
		/****** md5 signature: d80751dbb3219578b31bd3c0a414bac8 ******/
		%feature("compactdefaultargs") TransformedParameter;
		%feature("autodoc", "
Parameters
----------
U: float
T: gp_Trsf

Return
-------
float

Description
-----------
Returns the parameter on the transformed curve for the transform of the point of parameter U on <self>. //! me->Transformed(T)->Value(me->TransformedParameter(U,T)) //! is the same point as //! me->Value(U).Transformed(T) //! This methods returns <U> //! It can be redefined. For example on the Line.
") TransformedParameter;
		virtual Standard_Real TransformedParameter(const Standard_Real U, const gp_Trsf & T);

		/****** Geom_Curve::Value ******/
		/****** md5 signature: 183286476627e1c9a629476db3ac9809 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
U: float

Return
-------
gp_Pnt

Description
-----------
Computes the point of parameter U on <self>. If the curve is periodic then the returned point is P(U) with U = Ustart + (U - Uend) where Ustart and Uend are the parametric bounds of the curve. it is implemented with D0. //! Raised only for the 'OffsetCurve' if it is not possible to compute the current point. For example when the first derivative on the basis curve and the offset direction are parallel.
") Value;
		gp_Pnt Value(const Standard_Real U);

};


%make_alias(Geom_Curve)

%extend Geom_Curve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

// numpy support for Geom_Curve
CurveArrayEvalExtend(Geom_Curve)

/*******************
* class Geom_Point *
*******************/
%nodefaultctor Geom_Point;
class Geom_Point : public Geom_Geometry {
	public:
		/****** Geom_Point::Coord ******/
		/****** md5 signature: 79450184f151cdfb2e17082273c2711b ******/
		%feature("compactdefaultargs") Coord;
		%feature("autodoc", "
Parameters
----------

Return
-------
X: float
Y: float
Z: float

Description
-----------
returns the Coordinates of <self>.
") Coord;
		virtual void Coord(Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** Geom_Point::Distance ******/
		/****** md5 signature: 5ca541e2eedee55fbb99d8ccbfeef545 ******/
		%feature("compactdefaultargs") Distance;
		%feature("autodoc", "
Parameters
----------
Other: Geom_Point

Return
-------
float

Description
-----------
Computes the distance between <self> and <Other>.
") Distance;
		Standard_Real Distance(const opencascade::handle<Geom_Point> & Other);

		/****** Geom_Point::Pnt ******/
		/****** md5 signature: 62185e082456296be704b7021bf04c3c ******/
		%feature("compactdefaultargs") Pnt;
		%feature("autodoc", "Return
-------
gp_Pnt

Description
-----------
returns a non transient copy of <self>.
") Pnt;
		virtual gp_Pnt Pnt();

		/****** Geom_Point::SquareDistance ******/
		/****** md5 signature: e1841e9c758beabac14dfeb3418f94be ******/
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "
Parameters
----------
Other: Geom_Point

Return
-------
float

Description
-----------
Computes the square distance between <self> and <Other>.
") SquareDistance;
		Standard_Real SquareDistance(const opencascade::handle<Geom_Point> & Other);

		/****** Geom_Point::X ******/
		/****** md5 signature: 413eb82a4e8452543b5734eec1c1d581 ******/
		%feature("compactdefaultargs") X;
		%feature("autodoc", "Return
-------
float

Description
-----------
returns the X coordinate of <self>.
") X;
		virtual Standard_Real X();

		/****** Geom_Point::Y ******/
		/****** md5 signature: f3f396df994cd6abe723c99ac9bdc8cf ******/
		%feature("compactdefaultargs") Y;
		%feature("autodoc", "Return
-------
float

Description
-----------
returns the Y coordinate of <self>.
") Y;
		virtual Standard_Real Y();

		/****** Geom_Point::Z ******/
		/****** md5 signature: ce6bda01c58a8fbde5f89a8ecfb8ff29 ******/
		%feature("compactdefaultargs") Z;
		%feature("autodoc", "Return
-------
float

Description
-----------
returns the Z coordinate of <self>.
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
		/****** Geom_Surface::Bounds ******/
		/****** md5 signature: 360399f01d1e8a352d0e92c21b81737e ******/
		%feature("compactdefaultargs") Bounds;
		%feature("autodoc", "
Parameters
----------

Return
-------
U1: float
U2: float
V1: float
V2: float

Description
-----------
Returns the parametric bounds U1, U2, V1 and V2 of this surface. If the surface is infinite, this function can return a value equal to Precision::Infinite: instead of Standard_Real::LastReal.
") Bounds;
		virtual void Bounds(Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** Geom_Surface::Continuity ******/
		/****** md5 signature: 8dbb475c198ca068fb275dadeaaecf82 ******/
		%feature("compactdefaultargs") Continuity;
		%feature("autodoc", "Return
-------
GeomAbs_Shape

Description
-----------
Returns the Global Continuity of the surface in direction U and V: - C0: only geometric continuity, - C1: continuity of the first derivative all along the surface, - C2: continuity of the second derivative all along the surface, - C3: continuity of the third derivative all along the surface, - G1: tangency continuity all along the surface, - G2: curvature continuity all along the surface, - CN: the order of continuity is infinite. //! Example: If the surface is C1 in the V parametric direction and C2 in the U parametric direction Shape = C1.
") Continuity;
		virtual GeomAbs_Shape Continuity();

		/****** Geom_Surface::D0 ******/
		/****** md5 signature: f22bf3454948ea1083f2b615379eae1f ******/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "
Parameters
----------
U: float
V: float
P: gp_Pnt

Return
-------
None

Description
-----------
Computes the point of parameter U,V on the surface. //! Raised only for an 'OffsetSurface' if it is not possible to compute the current point.
") D0;
		virtual void D0(const Standard_Real U, const Standard_Real V, gp_Pnt & P);

		/****** Geom_Surface::D1 ******/
		/****** md5 signature: 91515045f48dad47c0dde2583e926abf ******/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "
Parameters
----------
U: float
V: float
P: gp_Pnt
D1U: gp_Vec
D1V: gp_Vec

Return
-------
None

Description
-----------
Computes the point P and the first derivatives in the directions U and V at this point. Raised if the continuity of the surface is not C1. //! Tip: use GeomLib::NormEstim() to calculate surface normal at specified (U, V) point.
") D1;
		virtual void D1(const Standard_Real U, const Standard_Real V, gp_Pnt & P, gp_Vec & D1U, gp_Vec & D1V);

		/****** Geom_Surface::D2 ******/
		/****** md5 signature: 1b0a714cc440a85085eed2fbfa932f3d ******/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "
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

Return
-------
None

Description
-----------
Computes the point P, the first and the second derivatives in the directions U and V at this point. Raised if the continuity of the surface is not C2.
") D2;
		virtual void D2(const Standard_Real U, const Standard_Real V, gp_Pnt & P, gp_Vec & D1U, gp_Vec & D1V, gp_Vec & D2U, gp_Vec & D2V, gp_Vec & D2UV);

		/****** Geom_Surface::D3 ******/
		/****** md5 signature: 079e32ecf07f1478bd5b19119b3ad84f ******/
		%feature("compactdefaultargs") D3;
		%feature("autodoc", "
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

Return
-------
None

Description
-----------
Computes the point P, the first,the second and the third derivatives in the directions U and V at this point. Raised if the continuity of the surface is not C2.
") D3;
		virtual void D3(const Standard_Real U, const Standard_Real V, gp_Pnt & P, gp_Vec & D1U, gp_Vec & D1V, gp_Vec & D2U, gp_Vec & D2V, gp_Vec & D2UV, gp_Vec & D3U, gp_Vec & D3V, gp_Vec & D3UUV, gp_Vec & D3UVV);

		/****** Geom_Surface::DN ******/
		/****** md5 signature: c33ccd4f50ab17b4dcf5bde75edfe95e ******/
		%feature("compactdefaultargs") DN;
		%feature("autodoc", "
Parameters
----------
U: float
V: float
Nu: int
Nv: int

Return
-------
gp_Vec

Description
-----------
Computes the derivative of order Nu in the direction U and Nv in the direction V at the point P(U, V). //! Raised if the continuity of the surface is not CNu in the U direction or not CNv in the V direction. Raised if Nu + Nv < 1 or Nu < 0 or Nv < 0.
") DN;
		virtual gp_Vec DN(const Standard_Real U, const Standard_Real V, const Standard_Integer Nu, const Standard_Integer Nv);


        /****************** DumpJson ******************/
        %feature("autodoc", "
Parameters
----------
depth: int, default=-1

Return
-------
str

Description
-----------
Dump the object to JSON string.
") DumpJson;
        %extend{
            std::string DumpJson(int depth=-1) {
            std::stringstream s;
            self->DumpJson(s, depth);
            return "{" + s.str() + "}" ;}
        };
		/****** Geom_Surface::IsCNu ******/
		/****** md5 signature: 9a8d69e4cda56394291ac9a353acde96 ******/
		%feature("compactdefaultargs") IsCNu;
		%feature("autodoc", "
Parameters
----------
N: int

Return
-------
bool

Description
-----------
Returns the order of continuity of the surface in the U parametric direction. Raised if N < 0.
") IsCNu;
		virtual Standard_Boolean IsCNu(const Standard_Integer N);

		/****** Geom_Surface::IsCNv ******/
		/****** md5 signature: f2ead6755ee2f9b5670869325296fbe1 ******/
		%feature("compactdefaultargs") IsCNv;
		%feature("autodoc", "
Parameters
----------
N: int

Return
-------
bool

Description
-----------
Returns the order of continuity of the surface in the V parametric direction. Raised if N < 0.
") IsCNv;
		virtual Standard_Boolean IsCNv(const Standard_Integer N);

		/****** Geom_Surface::IsUClosed ******/
		/****** md5 signature: c0ae2370b7fac0bc8df5c69af1a4bb4f ******/
		%feature("compactdefaultargs") IsUClosed;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Checks whether this surface is closed in the u parametric direction. Returns true if, in the u parametric direction: taking uFirst and uLast as the parametric bounds in the u parametric direction, for each parameter v, the distance between the points P(uFirst, v) and P(uLast, v) is less than or equal to gp::Resolution().
") IsUClosed;
		virtual Standard_Boolean IsUClosed();

		/****** Geom_Surface::IsUPeriodic ******/
		/****** md5 signature: 7581170790b0f02294b3a98c2ef39654 ******/
		%feature("compactdefaultargs") IsUPeriodic;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Checks if this surface is periodic in the u parametric direction. Returns true if: - this surface is closed in the u parametric direction, and - there is a constant T such that the distance between the points P (u, v) and P (u + T, v) (or the points P (u, v) and P (u, v + T)) is less than or equal to gp::Resolution(). //! Note: T is the parametric period in the u parametric direction.
") IsUPeriodic;
		virtual Standard_Boolean IsUPeriodic();

		/****** Geom_Surface::IsVClosed ******/
		/****** md5 signature: 7bc708d0e5aa4c7d8e106b0974c6ff1a ******/
		%feature("compactdefaultargs") IsVClosed;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Checks whether this surface is closed in the u parametric direction. Returns true if, in the v parametric direction: taking vFirst and vLast as the parametric bounds in the v parametric direction, for each parameter u, the distance between the points P(u, vFirst) and P(u, vLast) is less than or equal to gp::Resolution().
") IsVClosed;
		virtual Standard_Boolean IsVClosed();

		/****** Geom_Surface::IsVPeriodic ******/
		/****** md5 signature: 157f80ff35b8cd25014f915c1fea4793 ******/
		%feature("compactdefaultargs") IsVPeriodic;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Checks if this surface is periodic in the v parametric direction. Returns true if: - this surface is closed in the v parametric direction, and - there is a constant T such that the distance between the points P (u, v) and P (u + T, v) (or the points P (u, v) and P (u, v + T)) is less than or equal to gp::Resolution(). //! Note: T is the parametric period in the v parametric direction.
") IsVPeriodic;
		virtual Standard_Boolean IsVPeriodic();

		/****** Geom_Surface::ParametricTransformation ******/
		/****** md5 signature: 40e23eaf2984de2985d125adc2919a99 ******/
		%feature("compactdefaultargs") ParametricTransformation;
		%feature("autodoc", "
Parameters
----------
T: gp_Trsf

Return
-------
gp_GTrsf2d

Description
-----------
Returns a 2d transformation used to find the new parameters of a point on the transformed surface. @code me->Transformed(T)->Value(U',V') @endcode is the same point as @code me->Value(U,V).Transformed(T) @endcode Where U',V' are obtained by transforming U,V with the 2d transformation returned by @code me->ParametricTransformation(T) @endcode This method returns an identity transformation //! It can be redefined. For example on the Plane, Cylinder, Cone, Revolved and Extruded surfaces.
") ParametricTransformation;
		virtual gp_GTrsf2d ParametricTransformation(const gp_Trsf & T);

		/****** Geom_Surface::TransformParameters ******/
		/****** md5 signature: 0142b5420374870689e386ed7648e08a ******/
		%feature("compactdefaultargs") TransformParameters;
		%feature("autodoc", "
Parameters
----------
T: gp_Trsf

Return
-------
U: float
V: float

Description
-----------
Computes the parameters on the transformed surface for the transform of the point of parameters U,V on <self>. @code me->Transformed(T)->Value(U',V') @endcode is the same point as @code me->Value(U,V).Transformed(T) @endcode Where U',V' are the new values of U,V after calling @code me->TransformParameters(U,V,T) @endcode This method does not change <U> and <V> //! It can be redefined. For example on the Plane, Cylinder, Cone, Revolved and Extruded surfaces.
") TransformParameters;
		virtual void TransformParameters(Standard_Real &OutValue, Standard_Real &OutValue, const gp_Trsf & T);

		/****** Geom_Surface::UIso ******/
		/****** md5 signature: 655eceb48190f9eee1c9e258704f6fd1 ******/
		%feature("compactdefaultargs") UIso;
		%feature("autodoc", "
Parameters
----------
U: float

Return
-------
opencascade::handle<Geom_Curve>

Description
-----------
Computes the U isoparametric curve.
") UIso;
		virtual opencascade::handle<Geom_Curve> UIso(const Standard_Real U);

		/****** Geom_Surface::UPeriod ******/
		/****** md5 signature: b5a8af3fdd028670ffc618d509b562aa ******/
		%feature("compactdefaultargs") UPeriod;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the period of this surface in the u parametric direction. Raises if the surface is not uperiodic.
") UPeriod;
		virtual Standard_Real UPeriod();

		/****** Geom_Surface::UReverse ******/
		/****** md5 signature: c37eb1d71c5ca68f919a2a5076d1feb1 ******/
		%feature("compactdefaultargs") UReverse;
		%feature("autodoc", "Return
-------
None

Description
-----------
Reverses the U direction of parametrization of <self>. The bounds of the surface are not modified.
") UReverse;
		virtual void UReverse();

		/****** Geom_Surface::UReversed ******/
		/****** md5 signature: 12d667364f0d63ce30ce61cc3a4261f1 ******/
		%feature("compactdefaultargs") UReversed;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom_Surface>

Description
-----------
Reverses the U direction of parametrization of <self>. The bounds of the surface are not modified. A copy of <self> is returned.
") UReversed;
		opencascade::handle<Geom_Surface> UReversed();

		/****** Geom_Surface::UReversedParameter ******/
		/****** md5 signature: 7fd7d20296a57b638e5ad7571b2de083 ******/
		%feature("compactdefaultargs") UReversedParameter;
		%feature("autodoc", "
Parameters
----------
U: float

Return
-------
float

Description
-----------
Returns the parameter on the Ureversed surface for the point of parameter U on <self>. @code me->UReversed()->Value(me->UReversedParameter(U),V) @endcode is the same point as @code me->Value(U,V) @endcode.
") UReversedParameter;
		virtual Standard_Real UReversedParameter(const Standard_Real U);

		/****** Geom_Surface::VIso ******/
		/****** md5 signature: db68084f77ce9d3f4f4583ec9350bf65 ******/
		%feature("compactdefaultargs") VIso;
		%feature("autodoc", "
Parameters
----------
V: float

Return
-------
opencascade::handle<Geom_Curve>

Description
-----------
Computes the V isoparametric curve.
") VIso;
		virtual opencascade::handle<Geom_Curve> VIso(const Standard_Real V);

		/****** Geom_Surface::VPeriod ******/
		/****** md5 signature: aaa8f393a9608b88a2a3f8c8043833cb ******/
		%feature("compactdefaultargs") VPeriod;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the period of this surface in the v parametric direction. raises if the surface is not vperiodic.
") VPeriod;
		virtual Standard_Real VPeriod();

		/****** Geom_Surface::VReverse ******/
		/****** md5 signature: 6d6df699bdaaa274fe4fc413bec7e505 ******/
		%feature("compactdefaultargs") VReverse;
		%feature("autodoc", "Return
-------
None

Description
-----------
Reverses the V direction of parametrization of <self>. The bounds of the surface are not modified.
") VReverse;
		virtual void VReverse();

		/****** Geom_Surface::VReversed ******/
		/****** md5 signature: ecd008e5542d0a8a53e7973192a3ea07 ******/
		%feature("compactdefaultargs") VReversed;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom_Surface>

Description
-----------
Reverses the V direction of parametrization of <self>. The bounds of the surface are not modified. A copy of <self> is returned.
") VReversed;
		opencascade::handle<Geom_Surface> VReversed();

		/****** Geom_Surface::VReversedParameter ******/
		/****** md5 signature: 1d95298bde777a8594bd52e1249dc41e ******/
		%feature("compactdefaultargs") VReversedParameter;
		%feature("autodoc", "
Parameters
----------
V: float

Return
-------
float

Description
-----------
Returns the parameter on the Vreversed surface for the point of parameter V on <self>. @code me->VReversed()->Value(U,me->VReversedParameter(V)) @endcode is the same point as @code me->Value(U,V) @endcode.
") VReversedParameter;
		virtual Standard_Real VReversedParameter(const Standard_Real V);

		/****** Geom_Surface::Value ******/
		/****** md5 signature: 42959897db65d301eb66b5528ed15f16 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
U: float
V: float

Return
-------
gp_Pnt

Description
-----------
Computes the point of parameter (U, V) on the surface. //! It is implemented with D0. Tip: use GeomLib::NormEstim() to calculate surface normal at specified (U, V) point. //! Raised only for an 'OffsetSurface' if it is not possible to compute the current point.
") Value;
		gp_Pnt Value(const Standard_Real U, const Standard_Real V);

};


%make_alias(Geom_Surface)

%extend Geom_Surface {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

// numpy support for Geom_Surface
SurfaceArrayEvalExtend(Geom_Surface)

/********************
* class Geom_Vector *
********************/
%nodefaultctor Geom_Vector;
class Geom_Vector : public Geom_Geometry {
	public:
		/****** Geom_Vector::Angle ******/
		/****** md5 signature: e05d4c108d8e1f2ef3793dcc911b8156 ******/
		%feature("compactdefaultargs") Angle;
		%feature("autodoc", "
Parameters
----------
Other: Geom_Vector

Return
-------
float

Description
-----------
Computes the angular value, in radians, between this vector and vector Other. The result is a value between 0 and Pi. Exceptions gp_VectorWithNullMagnitude if: - the magnitude of this vector is less than or equal to gp::Resolution(), or - the magnitude of vector Other is less than or equal to gp::Resolution().
") Angle;
		Standard_Real Angle(const opencascade::handle<Geom_Vector> & Other);

		/****** Geom_Vector::AngleWithRef ******/
		/****** md5 signature: 6e41e75c2ebb14296a5478ce43f1e727 ******/
		%feature("compactdefaultargs") AngleWithRef;
		%feature("autodoc", "
Parameters
----------
Other: Geom_Vector
VRef: Geom_Vector

Return
-------
float

Description
-----------
Computes the angular value, in radians, between this vector and vector Other. The result is a value between -Pi and Pi. The vector VRef defines the positive sense of rotation: the angular value is positive if the cross product this ^ Other has the same orientation as VRef (in relation to the plane defined by this vector and vector Other). Otherwise, it is negative. Exceptions Standard_DomainError if this vector, vector Other and vector VRef are coplanar, except if this vector and vector Other are parallel. gp_VectorWithNullMagnitude if the magnitude of this vector, vector Other or vector VRef is less than or equal to gp::Resolution().
") AngleWithRef;
		Standard_Real AngleWithRef(const opencascade::handle<Geom_Vector> & Other, const opencascade::handle<Geom_Vector> & VRef);

		/****** Geom_Vector::Coord ******/
		/****** md5 signature: 43b0651f3b971777fc055ece9d877be9 ******/
		%feature("compactdefaultargs") Coord;
		%feature("autodoc", "
Parameters
----------

Return
-------
X: float
Y: float
Z: float

Description
-----------
Returns the coordinates X, Y and Z of this vector.
") Coord;
		void Coord(Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** Geom_Vector::Cross ******/
		/****** md5 signature: 846de6609037315d34cd9a41e5f44e75 ******/
		%feature("compactdefaultargs") Cross;
		%feature("autodoc", "
Parameters
----------
Other: Geom_Vector

Return
-------
None

Description
-----------
Computes the cross product between <self> and <Other>. //! Raised if <self> is a 'Direction' and if <self> and <Other> are parallel because it is not possible to build a 'Direction' with null length.
") Cross;
		virtual void Cross(const opencascade::handle<Geom_Vector> & Other);

		/****** Geom_Vector::CrossCross ******/
		/****** md5 signature: 6e8f359bb48d2983ca1fa95402c9631c ******/
		%feature("compactdefaultargs") CrossCross;
		%feature("autodoc", "
Parameters
----------
V1: Geom_Vector
V2: Geom_Vector

Return
-------
None

Description
-----------
Computes the triple vector product <self> ^(V1 ^ V2). //! Raised if <self> is a 'Direction' and if V1 and V2 are parallel or <self> and (V1 ^ V2) are parallel.
") CrossCross;
		virtual void CrossCross(const opencascade::handle<Geom_Vector> & V1, const opencascade::handle<Geom_Vector> & V2);

		/****** Geom_Vector::CrossCrossed ******/
		/****** md5 signature: 2e5c67bc50919fea24913e0984c62a98 ******/
		%feature("compactdefaultargs") CrossCrossed;
		%feature("autodoc", "
Parameters
----------
V1: Geom_Vector
V2: Geom_Vector

Return
-------
opencascade::handle<Geom_Vector>

Description
-----------
Computes the triple vector product <self> ^(V1 ^ V2). //! Raised if <self> is a direction and if V1 and V2 are parallel or <self> and (V1 ^ V2) are parallel.
") CrossCrossed;
		virtual opencascade::handle<Geom_Vector> CrossCrossed(const opencascade::handle<Geom_Vector> & V1, const opencascade::handle<Geom_Vector> & V2);

		/****** Geom_Vector::Crossed ******/
		/****** md5 signature: 178b71c2c2d1937f16d0589d7d75836b ******/
		%feature("compactdefaultargs") Crossed;
		%feature("autodoc", "
Parameters
----------
Other: Geom_Vector

Return
-------
opencascade::handle<Geom_Vector>

Description
-----------
Computes the cross product between <self> and <Other>. A new direction is returned. //! Raised if <self> is a 'Direction' and if the two vectors are parallel because it is not possible to create a 'Direction' with null length.
") Crossed;
		virtual opencascade::handle<Geom_Vector> Crossed(const opencascade::handle<Geom_Vector> & Other);

		/****** Geom_Vector::Dot ******/
		/****** md5 signature: a084614ff065a86541c23b7789ce6ddc ******/
		%feature("compactdefaultargs") Dot;
		%feature("autodoc", "
Parameters
----------
Other: Geom_Vector

Return
-------
float

Description
-----------
Computes the scalar product of this vector and vector Other.
") Dot;
		Standard_Real Dot(const opencascade::handle<Geom_Vector> & Other);

		/****** Geom_Vector::DotCross ******/
		/****** md5 signature: fb2becfd159c35bf86275a5c5fd05d09 ******/
		%feature("compactdefaultargs") DotCross;
		%feature("autodoc", "
Parameters
----------
V1: Geom_Vector
V2: Geom_Vector

Return
-------
float

Description
-----------
Computes the triple scalar product. Returns me . (V1 ^ V2).
") DotCross;
		Standard_Real DotCross(const opencascade::handle<Geom_Vector> & V1, const opencascade::handle<Geom_Vector> & V2);

		/****** Geom_Vector::Magnitude ******/
		/****** md5 signature: 0ebeea8be91ecea6aa2ed50ad4c62ecc ******/
		%feature("compactdefaultargs") Magnitude;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the Magnitude of <self>.
") Magnitude;
		virtual Standard_Real Magnitude();

		/****** Geom_Vector::Reverse ******/
		/****** md5 signature: b751d6874fc026e19a7a6cb37e9ac1b4 ******/
		%feature("compactdefaultargs") Reverse;
		%feature("autodoc", "Return
-------
None

Description
-----------
Reverses the vector <self>.
") Reverse;
		void Reverse();

		/****** Geom_Vector::Reversed ******/
		/****** md5 signature: 8fd8499ee74e492819186d573b4dbab6 ******/
		%feature("compactdefaultargs") Reversed;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom_Vector>

Description
-----------
Returns a copy of <self> reversed.
") Reversed;
		opencascade::handle<Geom_Vector> Reversed();

		/****** Geom_Vector::SquareMagnitude ******/
		/****** md5 signature: fcb1984b0230cd2baf43b1ca4e59922e ******/
		%feature("compactdefaultargs") SquareMagnitude;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the square magnitude of <self>.
") SquareMagnitude;
		virtual Standard_Real SquareMagnitude();

		/****** Geom_Vector::Vec ******/
		/****** md5 signature: 42aa6840ad15a2b32f7e0eedf8e96165 ******/
		%feature("compactdefaultargs") Vec;
		%feature("autodoc", "Return
-------
gp_Vec

Description
-----------
Converts this vector into a gp_Vec vector.
") Vec;
		const gp_Vec Vec();

		/****** Geom_Vector::X ******/
		/****** md5 signature: 2dbf42f7dc56303f104fb0fa585dc6e6 ******/
		%feature("compactdefaultargs") X;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the X coordinate of <self>.
") X;
		Standard_Real X();

		/****** Geom_Vector::Y ******/
		/****** md5 signature: 7fd17991f11a9702e525c7070ce7cec6 ******/
		%feature("compactdefaultargs") Y;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the Y coordinate of <self>.
") Y;
		Standard_Real Y();

		/****** Geom_Vector::Z ******/
		/****** md5 signature: 87b89b9e016f37b0146cf52868684676 ******/
		%feature("compactdefaultargs") Z;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the Z coordinate of <self>.
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
		/****** Geom_Axis1Placement::Geom_Axis1Placement ******/
		/****** md5 signature: 4917de3e473b9026af64f43cc083a38d ******/
		%feature("compactdefaultargs") Geom_Axis1Placement;
		%feature("autodoc", "
Parameters
----------
A1: gp_Ax1

Return
-------
None

Description
-----------
Returns a transient copy of A1.
") Geom_Axis1Placement;
		 Geom_Axis1Placement(const gp_Ax1 & A1);

		/****** Geom_Axis1Placement::Geom_Axis1Placement ******/
		/****** md5 signature: 1b598d775b926d33ee5b523d8b776979 ******/
		%feature("compactdefaultargs") Geom_Axis1Placement;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt
V: gp_Dir

Return
-------
None

Description
-----------
P is the origin of the axis placement and V is the direction of the axis placement.
") Geom_Axis1Placement;
		 Geom_Axis1Placement(const gp_Pnt & P, const gp_Dir & V);

		/****** Geom_Axis1Placement::Ax1 ******/
		/****** md5 signature: 61d01651dc2757d7f359770b1ac6ae79 ******/
		%feature("compactdefaultargs") Ax1;
		%feature("autodoc", "Return
-------
gp_Ax1

Description
-----------
Returns a non transient copy of <self>.
") Ax1;
		const gp_Ax1 Ax1();

		/****** Geom_Axis1Placement::Copy ******/
		/****** md5 signature: 1360a3e0ea51e38ae19c71fb8aa1c4e9 ******/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom_Geometry>

Description
-----------
Creates a new object, which is a copy of this axis.
") Copy;
		opencascade::handle<Geom_Geometry> Copy();

		/****** Geom_Axis1Placement::Reverse ******/
		/****** md5 signature: b751d6874fc026e19a7a6cb37e9ac1b4 ******/
		%feature("compactdefaultargs") Reverse;
		%feature("autodoc", "Return
-------
None

Description
-----------
Reverses the direction of the axis placement.
") Reverse;
		void Reverse();

		/****** Geom_Axis1Placement::Reversed ******/
		/****** md5 signature: 2ab262d72078be9d79d61493384710de ******/
		%feature("compactdefaultargs") Reversed;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom_Axis1Placement>

Description
-----------
Returns a copy of <self> reversed.
") Reversed;
		opencascade::handle<Geom_Axis1Placement> Reversed();

		/****** Geom_Axis1Placement::SetDirection ******/
		/****** md5 signature: 089cd0dbd337e8a7cca112bb9c58f86d ******/
		%feature("compactdefaultargs") SetDirection;
		%feature("autodoc", "
Parameters
----------
V: gp_Dir

Return
-------
None

Description
-----------
Assigns V to the unit vector of this axis.
") SetDirection;
		void SetDirection(const gp_Dir & V);

		/****** Geom_Axis1Placement::Transform ******/
		/****** md5 signature: b643be97d129c62226d788cd0501ced0 ******/
		%feature("compactdefaultargs") Transform;
		%feature("autodoc", "
Parameters
----------
T: gp_Trsf

Return
-------
None

Description
-----------
Applies the transformation T to this axis.
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
		/****** Geom_Axis2Placement::Geom_Axis2Placement ******/
		/****** md5 signature: dabc9bcbd8c719367c747aa7a9f643f1 ******/
		%feature("compactdefaultargs") Geom_Axis2Placement;
		%feature("autodoc", "
Parameters
----------
A2: gp_Ax2

Return
-------
None

Description
-----------
Returns a transient copy of A2.
") Geom_Axis2Placement;
		 Geom_Axis2Placement(const gp_Ax2 & A2);

		/****** Geom_Axis2Placement::Geom_Axis2Placement ******/
		/****** md5 signature: 082edc13cc365df970a9a7f4d0ab7a2a ******/
		%feature("compactdefaultargs") Geom_Axis2Placement;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt
N: gp_Dir
Vx: gp_Dir

Return
-------
None

Description
-----------
P is the origin of the axis placement, N is the main direction of the axis placement and Vx is the 'XDirection'. If the two directions N and Vx are not orthogonal the 'XDirection' is computed as follow: XDirection = N ^ (Vx ^ N). Raised if N and Vx are parallel.
") Geom_Axis2Placement;
		 Geom_Axis2Placement(const gp_Pnt & P, const gp_Dir & N, const gp_Dir & Vx);

		/****** Geom_Axis2Placement::Ax2 ******/
		/****** md5 signature: c9b4af4169eef4b21cfe015142d7278a ******/
		%feature("compactdefaultargs") Ax2;
		%feature("autodoc", "Return
-------
gp_Ax2

Description
-----------
Returns a non transient copy of <self>.
") Ax2;
		gp_Ax2 Ax2();

		/****** Geom_Axis2Placement::Copy ******/
		/****** md5 signature: 1360a3e0ea51e38ae19c71fb8aa1c4e9 ******/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom_Geometry>

Description
-----------
Creates a new object which is a copy of this coordinate system.
") Copy;
		opencascade::handle<Geom_Geometry> Copy();

		/****** Geom_Axis2Placement::SetAx2 ******/
		/****** md5 signature: 9d2a5c86939b9b231422a91fd6fc2782 ******/
		%feature("compactdefaultargs") SetAx2;
		%feature("autodoc", "
Parameters
----------
A2: gp_Ax2

Return
-------
None

Description
-----------
Assigns the origin and the three unit vectors of A2 to this coordinate system.
") SetAx2;
		void SetAx2(const gp_Ax2 & A2);

		/****** Geom_Axis2Placement::SetDirection ******/
		/****** md5 signature: 089cd0dbd337e8a7cca112bb9c58f86d ******/
		%feature("compactdefaultargs") SetDirection;
		%feature("autodoc", "
Parameters
----------
V: gp_Dir

Return
-------
None

Description
-----------
Changes the main direction of the axis placement. The 'Xdirection' is modified: New XDirection = V ^ (Previous_Xdirection ^ V). //! Raised if V and the previous 'XDirection' are parallel because it is impossible to calculate the new 'XDirection' and the new 'YDirection'.
") SetDirection;
		void SetDirection(const gp_Dir & V);

		/****** Geom_Axis2Placement::SetXDirection ******/
		/****** md5 signature: 7eca57e5a0ce16869c4831a889c43a11 ******/
		%feature("compactdefaultargs") SetXDirection;
		%feature("autodoc", "
Parameters
----------
Vx: gp_Dir

Return
-------
None

Description
-----------
Changes the 'XDirection' of the axis placement, Vx is the new 'XDirection'. If Vx is not normal to the main direction then 'XDirection' is computed as follow: XDirection = Direction ^ ( Vx ^ Direction). The main direction is not modified. Raised if Vx and 'Direction' are parallel.
") SetXDirection;
		void SetXDirection(const gp_Dir & Vx);

		/****** Geom_Axis2Placement::SetYDirection ******/
		/****** md5 signature: a17e9c62e6e6ab1cb8c83307d7a48bda ******/
		%feature("compactdefaultargs") SetYDirection;
		%feature("autodoc", "
Parameters
----------
Vy: gp_Dir

Return
-------
None

Description
-----------
Changes the 'YDirection' of the axis placement, Vy is the new 'YDirection'. If Vy is not normal to the main direction then 'YDirection' is computed as follow: YDirection = Direction ^ ( Vy ^ Direction). The main direction is not modified. The 'XDirection' is modified. Raised if Vy and the main direction are parallel.
") SetYDirection;
		void SetYDirection(const gp_Dir & Vy);

		/****** Geom_Axis2Placement::Transform ******/
		/****** md5 signature: b643be97d129c62226d788cd0501ced0 ******/
		%feature("compactdefaultargs") Transform;
		%feature("autodoc", "
Parameters
----------
T: gp_Trsf

Return
-------
None

Description
-----------
Transforms an axis placement with a Trsf. The 'Location' point, the 'XDirection' and the 'YDirection' are transformed with T. The resulting main 'Direction' of <self> is the cross product between the 'XDirection' and the 'YDirection' after transformation.
") Transform;
		void Transform(const gp_Trsf & T);

		/****** Geom_Axis2Placement::XDirection ******/
		/****** md5 signature: 961290da84516159b8901f300dd3110d ******/
		%feature("compactdefaultargs") XDirection;
		%feature("autodoc", "Return
-------
gp_Dir

Description
-----------
Returns the 'XDirection'. This is a unit vector.
") XDirection;
		const gp_Dir XDirection();

		/****** Geom_Axis2Placement::YDirection ******/
		/****** md5 signature: cc21cc9ed5abd09b9e251302c66ef4f2 ******/
		%feature("compactdefaultargs") YDirection;
		%feature("autodoc", "Return
-------
gp_Dir

Description
-----------
Returns the 'YDirection'. This is a unit vector.
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

        /****************** DumpJson ******************/
        %feature("autodoc", "
Parameters
----------
depth: int, default=-1

Return
-------
str

Description
-----------
Dump the object to JSON string.
") DumpJson;
        %extend{
            std::string DumpJson(int depth=-1) {
            std::stringstream s;
            self->DumpJson(s, depth);
            return "{" + s.str() + "}" ;}
        };
		/****** Geom_BoundedCurve::EndPoint ******/
		/****** md5 signature: fe7ec4eb708b4d9d9316df55a55ae448 ******/
		%feature("compactdefaultargs") EndPoint;
		%feature("autodoc", "Return
-------
gp_Pnt

Description
-----------
Returns the end point of the curve.
") EndPoint;
		virtual gp_Pnt EndPoint();

		/****** Geom_BoundedCurve::StartPoint ******/
		/****** md5 signature: 6fa42d6d6c220d872941b04d14cf111d ******/
		%feature("compactdefaultargs") StartPoint;
		%feature("autodoc", "Return
-------
gp_Pnt

Description
-----------
Returns the start point of the curve.
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
		/****** Geom_CartesianPoint::Geom_CartesianPoint ******/
		/****** md5 signature: 2019aa07fc37a3f1cc19faef80f865dd ******/
		%feature("compactdefaultargs") Geom_CartesianPoint;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt

Return
-------
None

Description
-----------
Returns a transient copy of P.
") Geom_CartesianPoint;
		 Geom_CartesianPoint(const gp_Pnt & P);

		/****** Geom_CartesianPoint::Geom_CartesianPoint ******/
		/****** md5 signature: e3a4b66d209480e6fd0b562beca8419a ******/
		%feature("compactdefaultargs") Geom_CartesianPoint;
		%feature("autodoc", "
Parameters
----------
X: float
Y: float
Z: float

Return
-------
None

Description
-----------
Constructs a point defined by its three Cartesian coordinates X, Y and Z.
") Geom_CartesianPoint;
		 Geom_CartesianPoint(const Standard_Real X, const Standard_Real Y, const Standard_Real Z);

		/****** Geom_CartesianPoint::Coord ******/
		/****** md5 signature: e99cf8b292099c83aa1f0e5a180b32f4 ******/
		%feature("compactdefaultargs") Coord;
		%feature("autodoc", "
Parameters
----------

Return
-------
X: float
Y: float
Z: float

Description
-----------
Returns the coordinates of <self>.
") Coord;
		void Coord(Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** Geom_CartesianPoint::Copy ******/
		/****** md5 signature: 1360a3e0ea51e38ae19c71fb8aa1c4e9 ******/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom_Geometry>

Description
-----------
Creates a new object which is a copy of this point.
") Copy;
		opencascade::handle<Geom_Geometry> Copy();

		/****** Geom_CartesianPoint::Pnt ******/
		/****** md5 signature: b4f96417d5d5e751d865e2331d6e77f7 ******/
		%feature("compactdefaultargs") Pnt;
		%feature("autodoc", "Return
-------
gp_Pnt

Description
-----------
Returns a non transient cartesian point with the same coordinates as <self>.
") Pnt;
		gp_Pnt Pnt();

		/****** Geom_CartesianPoint::SetCoord ******/
		/****** md5 signature: 191a33c01dc9e7fdb47a43d5d7ff9d99 ******/
		%feature("compactdefaultargs") SetCoord;
		%feature("autodoc", "
Parameters
----------
X: float
Y: float
Z: float

Return
-------
None

Description
-----------
Assigns the coordinates X, Y and Z to this point.
") SetCoord;
		void SetCoord(const Standard_Real X, const Standard_Real Y, const Standard_Real Z);

		/****** Geom_CartesianPoint::SetPnt ******/
		/****** md5 signature: bb1b3b80f2d6031f72db1ef2885b3648 ******/
		%feature("compactdefaultargs") SetPnt;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt

Return
-------
None

Description
-----------
Set <self> to P.X(), P.Y(), P.Z() coordinates.
") SetPnt;
		void SetPnt(const gp_Pnt & P);

		/****** Geom_CartesianPoint::SetX ******/
		/****** md5 signature: 30fe204d4c67d94370133e1d40dc6787 ******/
		%feature("compactdefaultargs") SetX;
		%feature("autodoc", "
Parameters
----------
X: float

Return
-------
None

Description
-----------
Changes the X coordinate of me.
") SetX;
		void SetX(const Standard_Real X);

		/****** Geom_CartesianPoint::SetY ******/
		/****** md5 signature: 8f42f770a3959dece2671d90f60e35e2 ******/
		%feature("compactdefaultargs") SetY;
		%feature("autodoc", "
Parameters
----------
Y: float

Return
-------
None

Description
-----------
Changes the Y coordinate of me.
") SetY;
		void SetY(const Standard_Real Y);

		/****** Geom_CartesianPoint::SetZ ******/
		/****** md5 signature: d96a64d9a788ed7bdd745a3dcbb831ea ******/
		%feature("compactdefaultargs") SetZ;
		%feature("autodoc", "
Parameters
----------
Z: float

Return
-------
None

Description
-----------
Changes the Z coordinate of me.
") SetZ;
		void SetZ(const Standard_Real Z);

		/****** Geom_CartesianPoint::Transform ******/
		/****** md5 signature: b643be97d129c62226d788cd0501ced0 ******/
		%feature("compactdefaultargs") Transform;
		%feature("autodoc", "
Parameters
----------
T: gp_Trsf

Return
-------
None

Description
-----------
Applies the transformation T to this point.
") Transform;
		void Transform(const gp_Trsf & T);

		/****** Geom_CartesianPoint::X ******/
		/****** md5 signature: 99239da966ea182594b91106a0316293 ******/
		%feature("compactdefaultargs") X;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the X coordinate of <self>.
") X;
		Standard_Real X();

		/****** Geom_CartesianPoint::Y ******/
		/****** md5 signature: 91c17711edaab163697b6c8ad095a159 ******/
		%feature("compactdefaultargs") Y;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the Y coordinate of <self>.
") Y;
		Standard_Real Y();

		/****** Geom_CartesianPoint::Z ******/
		/****** md5 signature: 4e11ebaa740d12349baa8c6841171adc ******/
		%feature("compactdefaultargs") Z;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the Z coordinate of <self>.
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
		/****** Geom_Conic::Axis ******/
		/****** md5 signature: 8e27675ecbe6e648730266788c8e255c ******/
		%feature("compactdefaultargs") Axis;
		%feature("autodoc", "Return
-------
gp_Ax1

Description
-----------
Returns the 'main Axis' of this conic. This axis is normal to the plane of the conic.
") Axis;
		const gp_Ax1 Axis();

		/****** Geom_Conic::Continuity ******/
		/****** md5 signature: 9381b370dfdd50af7f1b79ce202f0c6f ******/
		%feature("compactdefaultargs") Continuity;
		%feature("autodoc", "Return
-------
GeomAbs_Shape

Description
-----------
The continuity of the conic is Cn.
") Continuity;
		GeomAbs_Shape Continuity();


        /****************** DumpJson ******************/
        %feature("autodoc", "
Parameters
----------
depth: int, default=-1

Return
-------
str

Description
-----------
Dump the object to JSON string.
") DumpJson;
        %extend{
            std::string DumpJson(int depth=-1) {
            std::stringstream s;
            self->DumpJson(s, depth);
            return "{" + s.str() + "}" ;}
        };
		/****** Geom_Conic::Eccentricity ******/
		/****** md5 signature: 41bb637fc6d20616b1d8cd81afbd8bee ******/
		%feature("compactdefaultargs") Eccentricity;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the eccentricity value of the conic e. e = 0 for a circle 0 < e < 1 for an ellipse (e = 0 if MajorRadius = MinorRadius) e > 1 for a hyperbola e = 1 for a parabola Exceptions Standard_DomainError in the case of a hyperbola if its major radius is null.
") Eccentricity;
		virtual Standard_Real Eccentricity();

		/****** Geom_Conic::IsCN ******/
		/****** md5 signature: 73c2d9ecdd776a5227f0665f0702fcb3 ******/
		%feature("compactdefaultargs") IsCN;
		%feature("autodoc", "
Parameters
----------
N: int

Return
-------
bool

Description
-----------
Returns True. Raised if N < 0.
") IsCN;
		Standard_Boolean IsCN(const Standard_Integer N);

		/****** Geom_Conic::Location ******/
		/****** md5 signature: becd3d5ba73b438c501a139df51b6b7f ******/
		%feature("compactdefaultargs") Location;
		%feature("autodoc", "Return
-------
gp_Pnt

Description
-----------
Returns the location point of the conic. For the circle, the ellipse and the hyperbola it is the center of the conic. For the parabola it is the Apex of the parabola.
") Location;
		const gp_Pnt Location();

		/****** Geom_Conic::Position ******/
		/****** md5 signature: 0919c787263d4f8ff9c1e18688f5d16c ******/
		%feature("compactdefaultargs") Position;
		%feature("autodoc", "Return
-------
gp_Ax2

Description
-----------
Returns the local coordinates system of the conic. The main direction of the Axis2Placement is normal to the plane of the conic. The X direction of the Axis2placement is in the plane of the conic and corresponds to the origin for the conic's parametric value u.
") Position;
		const gp_Ax2 Position();

		/****** Geom_Conic::Reverse ******/
		/****** md5 signature: bff3d53d1cf0b268b7de85021a2bf3c4 ******/
		%feature("compactdefaultargs") Reverse;
		%feature("autodoc", "Return
-------
None

Description
-----------
Reverses the direction of parameterization of <self>. The local coordinate system of the conic is modified.
") Reverse;
		void Reverse();

		/****** Geom_Conic::ReversedParameter ******/
		/****** md5 signature: 4258c49eccf44c1163561aeb5d9c0830 ******/
		%feature("compactdefaultargs") ReversedParameter;
		%feature("autodoc", "
Parameters
----------
U: float

Return
-------
float

Description
-----------
Returns the parameter on the reversed curve for the point of parameter U on <self>.
") ReversedParameter;
		virtual Standard_Real ReversedParameter(const Standard_Real U);

		/****** Geom_Conic::SetAxis ******/
		/****** md5 signature: 23e0b01de6336ec5c57ea6909e327d35 ******/
		%feature("compactdefaultargs") SetAxis;
		%feature("autodoc", "
Parameters
----------
theA1: gp_Ax1

Return
-------
None

Description
-----------
Changes the orientation of the conic's plane. The normal axis to the plane is A1. The XAxis and the YAxis are recomputed. //! raised if the A1 is parallel to the XAxis of the conic.
") SetAxis;
		void SetAxis(const gp_Ax1 & theA1);

		/****** Geom_Conic::SetLocation ******/
		/****** md5 signature: c106a7d7c472c3f26d65a1d2a029717b ******/
		%feature("compactdefaultargs") SetLocation;
		%feature("autodoc", "
Parameters
----------
theP: gp_Pnt

Return
-------
None

Description
-----------
changes the location point of the conic.
") SetLocation;
		void SetLocation(const gp_Pnt & theP);

		/****** Geom_Conic::SetPosition ******/
		/****** md5 signature: ebc7dd35ccc08a819f6ac865a49dfe89 ******/
		%feature("compactdefaultargs") SetPosition;
		%feature("autodoc", "
Parameters
----------
theA2: gp_Ax2

Return
-------
None

Description
-----------
changes the local coordinate system of the conic.
") SetPosition;
		void SetPosition(const gp_Ax2 & theA2);

		/****** Geom_Conic::XAxis ******/
		/****** md5 signature: 33f98d138ae3ce92d202330aa4ae814d ******/
		%feature("compactdefaultargs") XAxis;
		%feature("autodoc", "Return
-------
gp_Ax1

Description
-----------
Returns the XAxis of the conic. This axis defines the origin of parametrization of the conic. This axis is perpendicular to the Axis of the conic. This axis and the Yaxis define the plane of the conic.
") XAxis;
		gp_Ax1 XAxis();

		/****** Geom_Conic::YAxis ******/
		/****** md5 signature: b471d966aca0b452073c5d55f8f5e027 ******/
		%feature("compactdefaultargs") YAxis;
		%feature("autodoc", "Return
-------
gp_Ax1

Description
-----------
Returns the YAxis of the conic. The YAxis is perpendicular to the Xaxis. This axis and the Xaxis define the plane of the conic.
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
		/****** Geom_Direction::Geom_Direction ******/
		/****** md5 signature: 7902c47708d9347585333a9cf11608f3 ******/
		%feature("compactdefaultargs") Geom_Direction;
		%feature("autodoc", "
Parameters
----------
X: float
Y: float
Z: float

Return
-------
None

Description
-----------
Creates a unit vector with it 3 cartesian coordinates. //! Raised if Sqrt( X*X + Y*Y + Z*Z) <= Resolution from gp.
") Geom_Direction;
		 Geom_Direction(const Standard_Real X, const Standard_Real Y, const Standard_Real Z);

		/****** Geom_Direction::Geom_Direction ******/
		/****** md5 signature: 77e2a6d99aadc1d8d6f66986ba161b3d ******/
		%feature("compactdefaultargs") Geom_Direction;
		%feature("autodoc", "
Parameters
----------
V: gp_Dir

Return
-------
None

Description
-----------
Creates a transient copy of <self>.
") Geom_Direction;
		 Geom_Direction(const gp_Dir & V);

		/****** Geom_Direction::Copy ******/
		/****** md5 signature: 1360a3e0ea51e38ae19c71fb8aa1c4e9 ******/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom_Geometry>

Description
-----------
Creates a new object which is a copy of this unit vector.
") Copy;
		opencascade::handle<Geom_Geometry> Copy();

		/****** Geom_Direction::Cross ******/
		/****** md5 signature: a06b8645c602d8aef3b712051c34ad37 ******/
		%feature("compactdefaultargs") Cross;
		%feature("autodoc", "
Parameters
----------
Other: Geom_Vector

Return
-------
None

Description
-----------
Computes the cross product between <self> and <Other>. //! Raised if the two vectors are parallel because it is not possible to have a direction with null length.
") Cross;
		void Cross(const opencascade::handle<Geom_Vector> & Other);

		/****** Geom_Direction::CrossCross ******/
		/****** md5 signature: 4b3dec90e760f8fc351eaf98bbe17760 ******/
		%feature("compactdefaultargs") CrossCross;
		%feature("autodoc", "
Parameters
----------
V1: Geom_Vector
V2: Geom_Vector

Return
-------
None

Description
-----------
Computes the triple vector product <self> ^(V1 ^ V2). //! Raised if V1 and V2 are parallel or <self> and (V1 ^ V2) are parallel.
") CrossCross;
		void CrossCross(const opencascade::handle<Geom_Vector> & V1, const opencascade::handle<Geom_Vector> & V2);

		/****** Geom_Direction::CrossCrossed ******/
		/****** md5 signature: 773178c0edb5c20353137f54da44fafe ******/
		%feature("compactdefaultargs") CrossCrossed;
		%feature("autodoc", "
Parameters
----------
V1: Geom_Vector
V2: Geom_Vector

Return
-------
opencascade::handle<Geom_Vector>

Description
-----------
Computes the triple vector product <self> ^(V1 ^ V2). //! Raised if V1 and V2 are parallel or <self> and (V1 ^ V2) are parallel.
") CrossCrossed;
		opencascade::handle<Geom_Vector> CrossCrossed(const opencascade::handle<Geom_Vector> & V1, const opencascade::handle<Geom_Vector> & V2);

		/****** Geom_Direction::Crossed ******/
		/****** md5 signature: 2c8e8934238b7f03649fb8fb7a43e59a ******/
		%feature("compactdefaultargs") Crossed;
		%feature("autodoc", "
Parameters
----------
Other: Geom_Vector

Return
-------
opencascade::handle<Geom_Vector>

Description
-----------
Computes the cross product between <self> and <Other>. A new direction is returned. //! Raised if the two vectors are parallel because it is not possible to have a direction with null length.
") Crossed;
		opencascade::handle<Geom_Vector> Crossed(const opencascade::handle<Geom_Vector> & Other);

		/****** Geom_Direction::Dir ******/
		/****** md5 signature: e4e49250b982bd6fa2ead48d6cde2af0 ******/
		%feature("compactdefaultargs") Dir;
		%feature("autodoc", "Return
-------
gp_Dir

Description
-----------
Returns the non transient direction with the same coordinates as <self>.
") Dir;
		gp_Dir Dir();

		/****** Geom_Direction::Magnitude ******/
		/****** md5 signature: 7de7b7dd76586e80dfb981b910f5ec5e ******/
		%feature("compactdefaultargs") Magnitude;
		%feature("autodoc", "Return
-------
float

Description
-----------
returns 1.0 which is the magnitude of any unit vector.
") Magnitude;
		Standard_Real Magnitude();

		/****** Geom_Direction::SetCoord ******/
		/****** md5 signature: 191a33c01dc9e7fdb47a43d5d7ff9d99 ******/
		%feature("compactdefaultargs") SetCoord;
		%feature("autodoc", "
Parameters
----------
X: float
Y: float
Z: float

Return
-------
None

Description
-----------
Sets <self> to X,Y,Z coordinates. //! Raised if Sqrt( X*X + Y*Y + Z*Z) <= Resolution from gp.
") SetCoord;
		void SetCoord(const Standard_Real X, const Standard_Real Y, const Standard_Real Z);

		/****** Geom_Direction::SetDir ******/
		/****** md5 signature: 530871ac10ae33b7e8737a2c06440a5a ******/
		%feature("compactdefaultargs") SetDir;
		%feature("autodoc", "
Parameters
----------
V: gp_Dir

Return
-------
None

Description
-----------
Converts the gp_Dir unit vector V into this unit vector.
") SetDir;
		void SetDir(const gp_Dir & V);

		/****** Geom_Direction::SetX ******/
		/****** md5 signature: 30fe204d4c67d94370133e1d40dc6787 ******/
		%feature("compactdefaultargs") SetX;
		%feature("autodoc", "
Parameters
----------
X: float

Return
-------
None

Description
-----------
Changes the X coordinate of <self>. //! Raised if Sqrt( X*X + Y*Y + Z*Z) <= Resolution from gp.
") SetX;
		void SetX(const Standard_Real X);

		/****** Geom_Direction::SetY ******/
		/****** md5 signature: 8f42f770a3959dece2671d90f60e35e2 ******/
		%feature("compactdefaultargs") SetY;
		%feature("autodoc", "
Parameters
----------
Y: float

Return
-------
None

Description
-----------
Changes the Y coordinate of <self>. //! Raised if Sqrt( X*X + Y*Y + Z*Z) <= Resolution from gp.
") SetY;
		void SetY(const Standard_Real Y);

		/****** Geom_Direction::SetZ ******/
		/****** md5 signature: d96a64d9a788ed7bdd745a3dcbb831ea ******/
		%feature("compactdefaultargs") SetZ;
		%feature("autodoc", "
Parameters
----------
Z: float

Return
-------
None

Description
-----------
Changes the Z coordinate of <self>. //! Raised if Sqrt( X*X + Y*Y + Z*Z) <= Resolution from gp.
") SetZ;
		void SetZ(const Standard_Real Z);

		/****** Geom_Direction::SquareMagnitude ******/
		/****** md5 signature: e9cc7ce2500a11b7e18b76619fa1de15 ******/
		%feature("compactdefaultargs") SquareMagnitude;
		%feature("autodoc", "Return
-------
float

Description
-----------
returns 1.0 which is the square magnitude of any unit vector.
") SquareMagnitude;
		Standard_Real SquareMagnitude();

		/****** Geom_Direction::Transform ******/
		/****** md5 signature: b643be97d129c62226d788cd0501ced0 ******/
		%feature("compactdefaultargs") Transform;
		%feature("autodoc", "
Parameters
----------
T: gp_Trsf

Return
-------
None

Description
-----------
Applies the transformation T to this unit vector, then normalizes it.
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
		/****** Geom_ElementarySurface::Axis ******/
		/****** md5 signature: 8e27675ecbe6e648730266788c8e255c ******/
		%feature("compactdefaultargs") Axis;
		%feature("autodoc", "Return
-------
gp_Ax1

Description
-----------
Returns the main axis of the surface (ZAxis).
") Axis;
		const gp_Ax1 Axis();

		/****** Geom_ElementarySurface::Continuity ******/
		/****** md5 signature: 9381b370dfdd50af7f1b79ce202f0c6f ******/
		%feature("compactdefaultargs") Continuity;
		%feature("autodoc", "Return
-------
GeomAbs_Shape

Description
-----------
Returns GeomAbs_CN, the global continuity of any elementary surface.
") Continuity;
		GeomAbs_Shape Continuity();


        /****************** DumpJson ******************/
        %feature("autodoc", "
Parameters
----------
depth: int, default=-1

Return
-------
str

Description
-----------
Dump the object to JSON string.
") DumpJson;
        %extend{
            std::string DumpJson(int depth=-1) {
            std::stringstream s;
            self->DumpJson(s, depth);
            return "{" + s.str() + "}" ;}
        };
		/****** Geom_ElementarySurface::IsCNu ******/
		/****** md5 signature: c9f9f7f6eb82d83e9ba43e721cffba8a ******/
		%feature("compactdefaultargs") IsCNu;
		%feature("autodoc", "
Parameters
----------
N: int

Return
-------
bool

Description
-----------
Returns True.
") IsCNu;
		Standard_Boolean IsCNu(const Standard_Integer N);

		/****** Geom_ElementarySurface::IsCNv ******/
		/****** md5 signature: 0acb88d1ffd7eea46785f30d7fc5f85e ******/
		%feature("compactdefaultargs") IsCNv;
		%feature("autodoc", "
Parameters
----------
N: int

Return
-------
bool

Description
-----------
Returns True.
") IsCNv;
		Standard_Boolean IsCNv(const Standard_Integer N);

		/****** Geom_ElementarySurface::Location ******/
		/****** md5 signature: becd3d5ba73b438c501a139df51b6b7f ******/
		%feature("compactdefaultargs") Location;
		%feature("autodoc", "Return
-------
gp_Pnt

Description
-----------
Returns the location point of the local coordinate system of the surface.
") Location;
		const gp_Pnt Location();

		/****** Geom_ElementarySurface::Position ******/
		/****** md5 signature: c702d3a208cf0124b56544ef1f5c6ae7 ******/
		%feature("compactdefaultargs") Position;
		%feature("autodoc", "Return
-------
gp_Ax3

Description
-----------
Returns the local coordinates system of the surface.
") Position;
		const gp_Ax3 Position();

		/****** Geom_ElementarySurface::SetAxis ******/
		/****** md5 signature: 23e0b01de6336ec5c57ea6909e327d35 ******/
		%feature("compactdefaultargs") SetAxis;
		%feature("autodoc", "
Parameters
----------
theA1: gp_Ax1

Return
-------
None

Description
-----------
Changes the main axis (ZAxis) of the elementary surface. //! Raised if the direction of A1 is parallel to the XAxis of the coordinate system of the surface.
") SetAxis;
		void SetAxis(const gp_Ax1 & theA1);

		/****** Geom_ElementarySurface::SetLocation ******/
		/****** md5 signature: 549208ae587d601427fb98d16d4de1b7 ******/
		%feature("compactdefaultargs") SetLocation;
		%feature("autodoc", "
Parameters
----------
theLoc: gp_Pnt

Return
-------
None

Description
-----------
Changes the location of the local coordinates system of the surface.
") SetLocation;
		void SetLocation(const gp_Pnt & theLoc);

		/****** Geom_ElementarySurface::SetPosition ******/
		/****** md5 signature: 7237d92ef9be95345f4bac3b8a006689 ******/
		%feature("compactdefaultargs") SetPosition;
		%feature("autodoc", "
Parameters
----------
theAx3: gp_Ax3

Return
-------
None

Description
-----------
Changes the local coordinates system of the surface.
") SetPosition;
		void SetPosition(const gp_Ax3 & theAx3);

		/****** Geom_ElementarySurface::UReverse ******/
		/****** md5 signature: d70147d3bce5fe1e36771349f34ded17 ******/
		%feature("compactdefaultargs") UReverse;
		%feature("autodoc", "Return
-------
None

Description
-----------
Reverses the U parametric direction of the surface.
") UReverse;
		virtual void UReverse();

		/****** Geom_ElementarySurface::UReversedParameter ******/
		/****** md5 signature: c74cce5ab6f23209482402eb2638c3e0 ******/
		%feature("compactdefaultargs") UReversedParameter;
		%feature("autodoc", "
Parameters
----------
U: float

Return
-------
float

Description
-----------
Return the parameter on the Ureversed surface for the point of parameter U on <self>. //! me->UReversed()->Value(me->UReversedParameter(U),V) is the same point as me->Value(U,V).
") UReversedParameter;
		virtual Standard_Real UReversedParameter(const Standard_Real U);

		/****** Geom_ElementarySurface::VReverse ******/
		/****** md5 signature: 60a0c07d53675378b2bcbe23d1e7e281 ******/
		%feature("compactdefaultargs") VReverse;
		%feature("autodoc", "Return
-------
None

Description
-----------
Reverses the V parametric direction of the surface.
") VReverse;
		virtual void VReverse();

		/****** Geom_ElementarySurface::VReversedParameter ******/
		/****** md5 signature: 9ed1a8c3bcf52498af3508eecc419d55 ******/
		%feature("compactdefaultargs") VReversedParameter;
		%feature("autodoc", "
Parameters
----------
V: float

Return
-------
float

Description
-----------
Return the parameter on the Vreversed surface for the point of parameter V on <self>. //! me->VReversed()->Value(U,me->VReversedParameter(V)) is the same point as me->Value(U,V).
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
		/****** Geom_Line::Geom_Line ******/
		/****** md5 signature: 5d74439c11958007e41a0dc8b8914169 ******/
		%feature("compactdefaultargs") Geom_Line;
		%feature("autodoc", "
Parameters
----------
A1: gp_Ax1

Return
-------
None

Description
-----------
Creates a line located in 3D space with the axis placement A1. The Location of A1 is the origin of the line.
") Geom_Line;
		 Geom_Line(const gp_Ax1 & A1);

		/****** Geom_Line::Geom_Line ******/
		/****** md5 signature: 848674ed52e8520194572c154b85627c ******/
		%feature("compactdefaultargs") Geom_Line;
		%feature("autodoc", "
Parameters
----------
L: gp_Lin

Return
-------
None

Description
-----------
Creates a line from a non transient line from package gp.
") Geom_Line;
		 Geom_Line(const gp_Lin & L);

		/****** Geom_Line::Geom_Line ******/
		/****** md5 signature: cead9ee1d699e4fb1fc9f6094d81309d ******/
		%feature("compactdefaultargs") Geom_Line;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt
V: gp_Dir

Return
-------
None

Description
-----------
Constructs a line passing through point P and parallel to vector V (P and V are, respectively, the origin and the unit vector of the positioning axis of the line).
") Geom_Line;
		 Geom_Line(const gp_Pnt & P, const gp_Dir & V);

		/****** Geom_Line::Continuity ******/
		/****** md5 signature: 9381b370dfdd50af7f1b79ce202f0c6f ******/
		%feature("compactdefaultargs") Continuity;
		%feature("autodoc", "Return
-------
GeomAbs_Shape

Description
-----------
Returns GeomAbs_CN, which is the global continuity of any line.
") Continuity;
		GeomAbs_Shape Continuity();

		/****** Geom_Line::Copy ******/
		/****** md5 signature: 1360a3e0ea51e38ae19c71fb8aa1c4e9 ******/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom_Geometry>

Description
-----------
Creates a new object which is a copy of this line.
") Copy;
		opencascade::handle<Geom_Geometry> Copy();

		/****** Geom_Line::D0 ******/
		/****** md5 signature: 5f7d08d8d17afc516aac9ef64bf9711f ******/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "
Parameters
----------
U: float
P: gp_Pnt

Return
-------
None

Description
-----------
Returns in P the point of parameter U. P (U) = O + U * Dir where O is the 'Location' point of the line and Dir the direction of the line.
") D0;
		void D0(const Standard_Real U, gp_Pnt & P);

		/****** Geom_Line::D1 ******/
		/****** md5 signature: 0264d3f49439e8cb4580d20449d25b51 ******/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "
Parameters
----------
U: float
P: gp_Pnt
V1: gp_Vec

Return
-------
None

Description
-----------
Returns the point P of parameter u and the first derivative V1.
") D1;
		void D1(const Standard_Real U, gp_Pnt & P, gp_Vec & V1);

		/****** Geom_Line::D2 ******/
		/****** md5 signature: a694b4ba68c0fd83fbac79f945cb5d8c ******/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "
Parameters
----------
U: float
P: gp_Pnt
V1: gp_Vec
V2: gp_Vec

Return
-------
None

Description
-----------
Returns the point P of parameter U, the first and second derivatives V1 and V2. V2 is a vector with null magnitude for a line.
") D2;
		void D2(const Standard_Real U, gp_Pnt & P, gp_Vec & V1, gp_Vec & V2);

		/****** Geom_Line::D3 ******/
		/****** md5 signature: cf1c3b5fe7af9d5c183c1b16b21c43f1 ******/
		%feature("compactdefaultargs") D3;
		%feature("autodoc", "
Parameters
----------
U: float
P: gp_Pnt
V1: gp_Vec
V2: gp_Vec
V3: gp_Vec

Return
-------
None

Description
-----------
V2 and V3 are vectors with null magnitude for a line.
") D3;
		void D3(const Standard_Real U, gp_Pnt & P, gp_Vec & V1, gp_Vec & V2, gp_Vec & V3);

		/****** Geom_Line::DN ******/
		/****** md5 signature: 0d4a3e2fc2b4b03d2a49e0796a487efb ******/
		%feature("compactdefaultargs") DN;
		%feature("autodoc", "
Parameters
----------
U: float
N: int

Return
-------
gp_Vec

Description
-----------
The returned vector gives the value of the derivative for the order of derivation N. Raised if N < 1.
") DN;
		gp_Vec DN(const Standard_Real U, const Standard_Integer N);


        /****************** DumpJson ******************/
        %feature("autodoc", "
Parameters
----------
depth: int, default=-1

Return
-------
str

Description
-----------
Dump the object to JSON string.
") DumpJson;
        %extend{
            std::string DumpJson(int depth=-1) {
            std::stringstream s;
            self->DumpJson(s, depth);
            return "{" + s.str() + "}" ;}
        };
		/****** Geom_Line::FirstParameter ******/
		/****** md5 signature: eb9ebe94572bd67588fe8811eac261fb ******/
		%feature("compactdefaultargs") FirstParameter;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the value of the first parameter of this line. This is Standard_Real::RealFirst().
") FirstParameter;
		Standard_Real FirstParameter();

		/****** Geom_Line::IsCN ******/
		/****** md5 signature: 73c2d9ecdd776a5227f0665f0702fcb3 ******/
		%feature("compactdefaultargs") IsCN;
		%feature("autodoc", "
Parameters
----------
N: int

Return
-------
bool

Description
-----------
returns True. Raised if N < 0.
") IsCN;
		Standard_Boolean IsCN(const Standard_Integer N);

		/****** Geom_Line::IsClosed ******/
		/****** md5 signature: 00978070ec4cb5f00d1d002a8d5d3763 ******/
		%feature("compactdefaultargs") IsClosed;
		%feature("autodoc", "Return
-------
bool

Description
-----------
returns False.
") IsClosed;
		Standard_Boolean IsClosed();

		/****** Geom_Line::IsPeriodic ******/
		/****** md5 signature: 15e3ccfd3ad4ae42959489f7f64aa8ca ******/
		%feature("compactdefaultargs") IsPeriodic;
		%feature("autodoc", "Return
-------
bool

Description
-----------
returns False.
") IsPeriodic;
		Standard_Boolean IsPeriodic();

		/****** Geom_Line::LastParameter ******/
		/****** md5 signature: cb4925a2d4a451ceec8f6ad486530f9c ******/
		%feature("compactdefaultargs") LastParameter;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the value of the last parameter of this line. This is Standard_Real::RealLast().
") LastParameter;
		Standard_Real LastParameter();

		/****** Geom_Line::Lin ******/
		/****** md5 signature: 15cb03d637d756d27ca006a1853cd726 ******/
		%feature("compactdefaultargs") Lin;
		%feature("autodoc", "Return
-------
gp_Lin

Description
-----------
Returns non transient line from gp with the same geometric properties as <self>.
") Lin;
		gp_Lin Lin();

		/****** Geom_Line::ParametricTransformation ******/
		/****** md5 signature: 0cdeed55440cf3859605fa52b3b17441 ******/
		%feature("compactdefaultargs") ParametricTransformation;
		%feature("autodoc", "
Parameters
----------
T: gp_Trsf

Return
-------
float

Description
-----------
Returns a coefficient to compute the parameter on the transformed curve for the transform of the point on <self>. //! Transformed(T)->Value(U * ParametricTransformation(T)) //! is the same point as //! Value(U).Transformed(T) //! This methods returns T.ScaleFactor().
") ParametricTransformation;
		virtual Standard_Real ParametricTransformation(const gp_Trsf & T);

		/****** Geom_Line::Position ******/
		/****** md5 signature: af37a1ddce8f862eeb41e9689b597340 ******/
		%feature("compactdefaultargs") Position;
		%feature("autodoc", "Return
-------
gp_Ax1

Description
-----------
Returns the positioning axis of this line; this is also its local coordinate system.
") Position;
		const gp_Ax1 Position();

		/****** Geom_Line::Reverse ******/
		/****** md5 signature: bff3d53d1cf0b268b7de85021a2bf3c4 ******/
		%feature("compactdefaultargs") Reverse;
		%feature("autodoc", "Return
-------
None

Description
-----------
Changes the orientation of this line. As a result, the unit vector of the positioning axis of this line is reversed.
") Reverse;
		void Reverse();

		/****** Geom_Line::ReversedParameter ******/
		/****** md5 signature: 382721d5a4ea752fecc12f03ab0de9a1 ******/
		%feature("compactdefaultargs") ReversedParameter;
		%feature("autodoc", "
Parameters
----------
U: float

Return
-------
float

Description
-----------
Computes the parameter on the reversed line for the point of parameter U on this line. For a line, the returned value is -U.
") ReversedParameter;
		Standard_Real ReversedParameter(const Standard_Real U);

		/****** Geom_Line::SetDirection ******/
		/****** md5 signature: df8744d729e050a65ee65230eb199390 ******/
		%feature("compactdefaultargs") SetDirection;
		%feature("autodoc", "
Parameters
----------
V: gp_Dir

Return
-------
None

Description
-----------
changes the direction of the line.
") SetDirection;
		void SetDirection(const gp_Dir & V);

		/****** Geom_Line::SetLin ******/
		/****** md5 signature: 1e9af410d46d9fb1c95b73068b7ad74d ******/
		%feature("compactdefaultargs") SetLin;
		%feature("autodoc", "
Parameters
----------
L: gp_Lin

Return
-------
None

Description
-----------
Set <self> so that <self> has the same geometric properties as L.
") SetLin;
		void SetLin(const gp_Lin & L);

		/****** Geom_Line::SetLocation ******/
		/****** md5 signature: c028aee785b685956e8e7d5cba7ecb46 ******/
		%feature("compactdefaultargs") SetLocation;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt

Return
-------
None

Description
-----------
changes the 'Location' point (origin) of the line.
") SetLocation;
		void SetLocation(const gp_Pnt & P);

		/****** Geom_Line::SetPosition ******/
		/****** md5 signature: ca1bae47b8ae90618ff03190da8061a3 ******/
		%feature("compactdefaultargs") SetPosition;
		%feature("autodoc", "
Parameters
----------
A1: gp_Ax1

Return
-------
None

Description
-----------
changes the 'Location' and a the 'Direction' of <self>.
") SetPosition;
		void SetPosition(const gp_Ax1 & A1);

		/****** Geom_Line::Transform ******/
		/****** md5 signature: b643be97d129c62226d788cd0501ced0 ******/
		%feature("compactdefaultargs") Transform;
		%feature("autodoc", "
Parameters
----------
T: gp_Trsf

Return
-------
None

Description
-----------
Applies the transformation T to this line.
") Transform;
		void Transform(const gp_Trsf & T);

		/****** Geom_Line::TransformedParameter ******/
		/****** md5 signature: 1a552ef75f7726e4135a5d28749cc3da ******/
		%feature("compactdefaultargs") TransformedParameter;
		%feature("autodoc", "
Parameters
----------
U: float
T: gp_Trsf

Return
-------
float

Description
-----------
Returns the parameter on the transformed curve for the transform of the point of parameter U on <self>. //! me->Transformed(T)->Value(me->TransformedParameter(U,T)) //! is the same point as //! me->Value(U).Transformed(T) //! This methods returns <U> * T.ScaleFactor().
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
		/****** Geom_OffsetCurve::Geom_OffsetCurve ******/
		/****** md5 signature: b632bc220051dc17b379a040b1c35d40 ******/
		%feature("compactdefaultargs") Geom_OffsetCurve;
		%feature("autodoc", "
Parameters
----------
C: Geom_Curve
Offset: float
V: gp_Dir
isNotCheckC0: bool (optional, default to Standard_False)

Return
-------
None

Description
-----------
C is the basis curve, Offset is the distance between <self> and the basis curve at any point. V defines the fixed reference direction (offset direction). If P is a point on the basis curve and T the first derivative with non zero length at this point, the corresponding point on the offset curve is in the direction of the vector-product N = V ^ T where N is a unitary vector. If isNotCheckC0 = True checking if basis curve has C0-continuity is not made. Warnings: In this package the entities are not shared. The OffsetCurve is built with a copy of the curve C. So when C is modified the OffsetCurve is not modified //! Raised if the basis curve C is not at least C1. Warnings: No check is done to know if ||V^T|| != 0.0 at any point.
") Geom_OffsetCurve;
		 Geom_OffsetCurve(const opencascade::handle<Geom_Curve> & C, const Standard_Real Offset, const gp_Dir & V, const Standard_Boolean isNotCheckC0 = Standard_False);

		/****** Geom_OffsetCurve::BasisCurve ******/
		/****** md5 signature: ece4de977d9b1715803929678e07eec5 ******/
		%feature("compactdefaultargs") BasisCurve;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom_Curve>

Description
-----------
Returns the basis curve of this offset curve. Note: The basis curve can be an offset curve.
") BasisCurve;
		opencascade::handle<Geom_Curve> BasisCurve();

		/****** Geom_OffsetCurve::Continuity ******/
		/****** md5 signature: 9381b370dfdd50af7f1b79ce202f0c6f ******/
		%feature("compactdefaultargs") Continuity;
		%feature("autodoc", "Return
-------
GeomAbs_Shape

Description
-----------
Returns the global continuity of this offset curve as a value of the GeomAbs_Shape enumeration. The degree of continuity of this offset curve is equal to the degree of continuity of the basis curve minus 1. Continuity of the Offset curve: C0: only geometric continuity, C1: continuity of the first derivative all along the Curve, C2: continuity of the second derivative all along the Curve, C3: continuity of the third derivative all along the Curve, G1: tangency continuity all along the Curve, G2: curvature continuity all along the Curve, CN: the order of continuity is infinite. Warnings: Returns the continuity of the basis curve - 1. The offset curve must have a unique offset direction defined at any point.
") Continuity;
		GeomAbs_Shape Continuity();

		/****** Geom_OffsetCurve::Copy ******/
		/****** md5 signature: 1360a3e0ea51e38ae19c71fb8aa1c4e9 ******/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom_Geometry>

Description
-----------
Creates a new object which is a copy of this offset curve.
") Copy;
		opencascade::handle<Geom_Geometry> Copy();

		/****** Geom_OffsetCurve::D0 ******/
		/****** md5 signature: 5f7d08d8d17afc516aac9ef64bf9711f ******/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "
Parameters
----------
U: float
P: gp_Pnt

Return
-------
None

Description
-----------
Warning! this should not be called if the basis curve is not at least C1. Nevertheless if used on portion where the curve is C1, it is OK.
") D0;
		void D0(const Standard_Real U, gp_Pnt & P);

		/****** Geom_OffsetCurve::D1 ******/
		/****** md5 signature: 0264d3f49439e8cb4580d20449d25b51 ******/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "
Parameters
----------
U: float
P: gp_Pnt
V1: gp_Vec

Return
-------
None

Description
-----------
Warning! this should not be called if the continuity of the basis curve is not C2. Nevertheless, it's OK to use it on portion where the curve is C2.
") D1;
		void D1(const Standard_Real U, gp_Pnt & P, gp_Vec & V1);

		/****** Geom_OffsetCurve::D2 ******/
		/****** md5 signature: a694b4ba68c0fd83fbac79f945cb5d8c ******/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "
Parameters
----------
U: float
P: gp_Pnt
V1: gp_Vec
V2: gp_Vec

Return
-------
None

Description
-----------
Warning! this should not be called if the continuity of the basis curve is not C3. Nevertheless, it's OK to use it on portion where the curve is C3.
") D2;
		void D2(const Standard_Real U, gp_Pnt & P, gp_Vec & V1, gp_Vec & V2);

		/****** Geom_OffsetCurve::D3 ******/
		/****** md5 signature: cf1c3b5fe7af9d5c183c1b16b21c43f1 ******/
		%feature("compactdefaultargs") D3;
		%feature("autodoc", "
Parameters
----------
U: float
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
		void D3(const Standard_Real U, gp_Pnt & P, gp_Vec & V1, gp_Vec & V2, gp_Vec & V3);

		/****** Geom_OffsetCurve::DN ******/
		/****** md5 signature: 0d4a3e2fc2b4b03d2a49e0796a487efb ******/
		%feature("compactdefaultargs") DN;
		%feature("autodoc", "
Parameters
----------
U: float
N: int

Return
-------
gp_Vec

Description
-----------
The returned vector gives the value of the derivative for the order of derivation N. //! The following functions compute the value and derivatives on the offset curve and returns the derivatives on the basis curve too. The computation of the value and derivatives on the basis curve are used to evaluate the offset curve //! Warning: The exception UndefinedValue or UndefinedDerivative is raised if it is not possible to compute a unique offset direction. Raised if N < 1.
") DN;
		gp_Vec DN(const Standard_Real U, const Standard_Integer N);

		/****** Geom_OffsetCurve::Direction ******/
		/****** md5 signature: 6107c9113155a9ae9007c5c8e526a738 ******/
		%feature("compactdefaultargs") Direction;
		%feature("autodoc", "Return
-------
gp_Dir

Description
-----------
Returns the reference vector of this offset curve. Value and derivatives Warnings: The exception UndefinedValue or UndefinedDerivative is raised if it is not possible to compute a unique offset direction. If T is the first derivative with not null length and V the offset direction the relation ||T(U) ^ V|| != 0 must be satisfied to evaluate the offset curve. No check is done at the creation time and we suppose in this package that the offset curve is well defined.
") Direction;
		const gp_Dir Direction();


        /****************** DumpJson ******************/
        %feature("autodoc", "
Parameters
----------
depth: int, default=-1

Return
-------
str

Description
-----------
Dump the object to JSON string.
") DumpJson;
        %extend{
            std::string DumpJson(int depth=-1) {
            std::stringstream s;
            self->DumpJson(s, depth);
            return "{" + s.str() + "}" ;}
        };
		/****** Geom_OffsetCurve::FirstParameter ******/
		/****** md5 signature: eb9ebe94572bd67588fe8811eac261fb ******/
		%feature("compactdefaultargs") FirstParameter;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the value of the first parameter of this offset curve. The first parameter corresponds to the start point of the curve. Note: the first and last parameters of this offset curve are also the ones of its basis curve.
") FirstParameter;
		Standard_Real FirstParameter();

		/****** Geom_OffsetCurve::GetBasisCurveContinuity ******/
		/****** md5 signature: 5542c2675753571f1c65d428430b4583 ******/
		%feature("compactdefaultargs") GetBasisCurveContinuity;
		%feature("autodoc", "Return
-------
GeomAbs_Shape

Description
-----------
Returns continuity of the basis curve.
") GetBasisCurveContinuity;
		GeomAbs_Shape GetBasisCurveContinuity();

		/****** Geom_OffsetCurve::IsCN ******/
		/****** md5 signature: 73c2d9ecdd776a5227f0665f0702fcb3 ******/
		%feature("compactdefaultargs") IsCN;
		%feature("autodoc", "
Parameters
----------
N: int

Return
-------
bool

Description
-----------
Returns true if the degree of continuity of the basis curve of this offset curve is at least N + 1. This method answer True if the continuity of the basis curve is N + 1. We suppose in this class that a normal direction to the basis curve (used to compute the offset curve) is defined at any point on the basis curve. Raised if N < 0.
") IsCN;
		Standard_Boolean IsCN(const Standard_Integer N);

		/****** Geom_OffsetCurve::IsClosed ******/
		/****** md5 signature: 00978070ec4cb5f00d1d002a8d5d3763 ******/
		%feature("compactdefaultargs") IsClosed;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if the distance between the start point and the end point of the curve is lower or equal to Resolution from package gp.
") IsClosed;
		Standard_Boolean IsClosed();

		/****** Geom_OffsetCurve::IsPeriodic ******/
		/****** md5 signature: 15e3ccfd3ad4ae42959489f7f64aa8ca ******/
		%feature("compactdefaultargs") IsPeriodic;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if this offset curve is periodic, i.e. if the basis curve of this offset curve is periodic.
") IsPeriodic;
		Standard_Boolean IsPeriodic();

		/****** Geom_OffsetCurve::LastParameter ******/
		/****** md5 signature: cb4925a2d4a451ceec8f6ad486530f9c ******/
		%feature("compactdefaultargs") LastParameter;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the value of the last parameter of this offset curve. The last parameter corresponds to the end point. Note: the first and last parameters of this offset curve are also the ones of its basis curve.
") LastParameter;
		Standard_Real LastParameter();

		/****** Geom_OffsetCurve::Offset ******/
		/****** md5 signature: 02d05c913be85cd7a6e18ff06a18b8e7 ******/
		%feature("compactdefaultargs") Offset;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the offset value of this offset curve.
") Offset;
		Standard_Real Offset();

		/****** Geom_OffsetCurve::ParametricTransformation ******/
		/****** md5 signature: 0cdeed55440cf3859605fa52b3b17441 ******/
		%feature("compactdefaultargs") ParametricTransformation;
		%feature("autodoc", "
Parameters
----------
T: gp_Trsf

Return
-------
float

Description
-----------
Returns a coefficient to compute the parameter on the transformed curve for the transform of the point on <self>. //! Transformed(T)->Value(U * ParametricTransformation(T)) is the same point as Value(U).Transformed(T) This methods calls the basis curve method.
") ParametricTransformation;
		virtual Standard_Real ParametricTransformation(const gp_Trsf & T);

		/****** Geom_OffsetCurve::Period ******/
		/****** md5 signature: a0af1de0407384df43b0e76d6b472231 ******/
		%feature("compactdefaultargs") Period;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the period of this offset curve, i.e. the period of the basis curve of this offset curve. Exceptions Standard_NoSuchObject if the basis curve is not periodic.
") Period;
		virtual Standard_Real Period();

		/****** Geom_OffsetCurve::Reverse ******/
		/****** md5 signature: bff3d53d1cf0b268b7de85021a2bf3c4 ******/
		%feature("compactdefaultargs") Reverse;
		%feature("autodoc", "Return
-------
None

Description
-----------
Changes the orientation of this offset curve. As a result: - the basis curve is reversed, - the start point of the initial curve becomes the end point of the reversed curve, - the end point of the initial curve becomes the start point of the reversed curve, and - the first and last parameters are recomputed.
") Reverse;
		void Reverse();

		/****** Geom_OffsetCurve::ReversedParameter ******/
		/****** md5 signature: 382721d5a4ea752fecc12f03ab0de9a1 ******/
		%feature("compactdefaultargs") ReversedParameter;
		%feature("autodoc", "
Parameters
----------
U: float

Return
-------
float

Description
-----------
Computes the parameter on the reversed curve for the point of parameter U on this offset curve.
") ReversedParameter;
		Standard_Real ReversedParameter(const Standard_Real U);

		/****** Geom_OffsetCurve::SetBasisCurve ******/
		/****** md5 signature: f45b5f3e6433ae51405d3a64ea717a8a ******/
		%feature("compactdefaultargs") SetBasisCurve;
		%feature("autodoc", "
Parameters
----------
C: Geom_Curve
isNotCheckC0: bool (optional, default to Standard_False)

Return
-------
None

Description
-----------
Changes this offset curve by assigning C as the basis curve from which it is built. If isNotCheckC0 = True checking if basis curve has C0-continuity is not made. Exceptions Standard_ConstructionError if the curve C is not at least 'C1' continuous.
") SetBasisCurve;
		void SetBasisCurve(const opencascade::handle<Geom_Curve> & C, const Standard_Boolean isNotCheckC0 = Standard_False);

		/****** Geom_OffsetCurve::SetDirection ******/
		/****** md5 signature: df8744d729e050a65ee65230eb199390 ******/
		%feature("compactdefaultargs") SetDirection;
		%feature("autodoc", "
Parameters
----------
V: gp_Dir

Return
-------
None

Description
-----------
Changes this offset curve by assigning V as the reference vector used to compute the offset direction.
") SetDirection;
		void SetDirection(const gp_Dir & V);

		/****** Geom_OffsetCurve::SetOffsetValue ******/
		/****** md5 signature: b0345a26ec85d9ad16bb8be0106b4798 ******/
		%feature("compactdefaultargs") SetOffsetValue;
		%feature("autodoc", "
Parameters
----------
D: float

Return
-------
None

Description
-----------
Changes this offset curve by assigning D as the offset value.
") SetOffsetValue;
		void SetOffsetValue(const Standard_Real D);

		/****** Geom_OffsetCurve::Transform ******/
		/****** md5 signature: b643be97d129c62226d788cd0501ced0 ******/
		%feature("compactdefaultargs") Transform;
		%feature("autodoc", "
Parameters
----------
T: gp_Trsf

Return
-------
None

Description
-----------
Applies the transformation T to this offset curve. Note: the basis curve is also modified.
") Transform;
		void Transform(const gp_Trsf & T);

		/****** Geom_OffsetCurve::TransformedParameter ******/
		/****** md5 signature: 1a552ef75f7726e4135a5d28749cc3da ******/
		%feature("compactdefaultargs") TransformedParameter;
		%feature("autodoc", "
Parameters
----------
U: float
T: gp_Trsf

Return
-------
float

Description
-----------
Returns the parameter on the transformed curve for the transform of the point of parameter U on <self>. me->Transformed(T)->Value(me->TransformedParameter(U,T)) is the same point as me->Value(U).Transformed(T) This methods calls the basis curve method.
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
		/****** Geom_OffsetSurface::Geom_OffsetSurface ******/
		/****** md5 signature: 19f12998955114838f962d530aecf707 ******/
		%feature("compactdefaultargs") Geom_OffsetSurface;
		%feature("autodoc", "
Parameters
----------
S: Geom_Surface
Offset: float
isNotCheckC0: bool (optional, default to Standard_False)

Return
-------
None

Description
-----------
Constructs a surface offset from the basis surface S, where Offset is the distance between the offset surface and the basis surface at any point. A point on the offset surface is built by measuring the offset value along a normal vector at a point on S. This normal vector is given by the cross product D1u^D1v, where D1u and D1v are the vectors tangential to the basis surface in the u and v parametric directions at this point. The side of S on which the offset value is measured is indicated by this normal vector if Offset is positive, or is the inverse sense if Offset is negative. If isNotCheckC0 = True checking if basis surface has C0-continuity is not made. Warnings: - The offset surface is built with a copy of the surface S. Therefore, when S is modified the offset surface is not modified. - No check is made at the time of construction to detect points on S with multiple possible normal directions. Raised if S is not at least C1. Warnings: No check is done to verify that a unique normal direction is defined at any point of the basis surface S.
") Geom_OffsetSurface;
		 Geom_OffsetSurface(const opencascade::handle<Geom_Surface> & S, const Standard_Real Offset, const Standard_Boolean isNotCheckC0 = Standard_False);

		/****** Geom_OffsetSurface::BasisSurface ******/
		/****** md5 signature: 3daca3cd1c714a11ab105f803cdf2ef7 ******/
		%feature("compactdefaultargs") BasisSurface;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom_Surface>

Description
-----------
Returns the basis surface of this offset surface. Note: The basis surface can be an offset surface.
") BasisSurface;
		const opencascade::handle<Geom_Surface> & BasisSurface();

		/****** Geom_OffsetSurface::Bounds ******/
		/****** md5 signature: bbc36976e796eedf3c69513e986f2adb ******/
		%feature("compactdefaultargs") Bounds;
		%feature("autodoc", "
Parameters
----------

Return
-------
U1: float
U2: float
V1: float
V2: float

Description
-----------
Returns the parametric bounds U1, U2, V1 and V2 of this offset surface. If the surface is infinite, this function can return: - Standard_Real::RealFirst(), or - Standard_Real::RealLast().
") Bounds;
		void Bounds(Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** Geom_OffsetSurface::Continuity ******/
		/****** md5 signature: 9381b370dfdd50af7f1b79ce202f0c6f ******/
		%feature("compactdefaultargs") Continuity;
		%feature("autodoc", "Return
-------
GeomAbs_Shape

Description
-----------
This method returns the continuity of the basis surface - 1. Continuity of the Offset surface: C0: only geometric continuity, C1: continuity of the first derivative all along the Surface, C2: continuity of the second derivative all along the Surface, C3: continuity of the third derivative all along the Surface, CN: the order of continuity is infinite. Example: If the basis surface is C2 in the V direction and C3 in the U direction Shape = C1. Warnings: If the basis surface has a unique normal direction defined at any point this method gives the continuity of the offset surface otherwise the effective continuity can be lower than the continuity of the basis surface - 1.
") Continuity;
		GeomAbs_Shape Continuity();

		/****** Geom_OffsetSurface::Copy ******/
		/****** md5 signature: 1360a3e0ea51e38ae19c71fb8aa1c4e9 ******/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom_Geometry>

Description
-----------
Creates a new object which is a copy of this offset surface.
") Copy;
		opencascade::handle<Geom_Geometry> Copy();

		/****** Geom_OffsetSurface::D0 ******/
		/****** md5 signature: 909f7ecc223d561155c9c3ba4b8e7b64 ******/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "
Parameters
----------
U: float
V: float
P: gp_Pnt

Return
-------
None

Description
-----------
@code P (U, V) = Pbasis + Offset * Ndir @endcode where @code Ndir = D1Ubasis ^ D1Vbasis / ||D1Ubasis ^ D1Vbasis|| @endcode is the normal direction of the basis surface. Pbasis, D1Ubasis, D1Vbasis are the point and the first derivatives on the basis surface. If Ndir is undefined this method computes an approached normal direction using the following limited development: @code Ndir = N0 + DNdir/DU + DNdir/DV + Eps @endcode with Eps->0 which requires to compute the second derivatives on the basis surface. If the normal direction cannot be approximate for this order of derivation the exception UndefinedValue is raised. //! Raised if the continuity of the basis surface is not C1. Raised if the order of derivation required to compute the normal direction is greater than the second order.
") D0;
		void D0(const Standard_Real U, const Standard_Real V, gp_Pnt & P);

		/****** Geom_OffsetSurface::D1 ******/
		/****** md5 signature: 0868b105367e01c443402a5728aa3395 ******/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "
Parameters
----------
U: float
V: float
P: gp_Pnt
D1U: gp_Vec
D1V: gp_Vec

Return
-------
None

Description
-----------
Raised if the continuity of the basis surface is not C2.
") D1;
		void D1(const Standard_Real U, const Standard_Real V, gp_Pnt & P, gp_Vec & D1U, gp_Vec & D1V);

		/****** Geom_OffsetSurface::D2 ******/
		/****** md5 signature: 5bdb029d3f1561c55d7ab1d1b0b0282a ******/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "
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

Return
-------
None

Description
-----------
Raised if the continuity of the basis surface is not C3.
") D2;
		void D2(const Standard_Real U, const Standard_Real V, gp_Pnt & P, gp_Vec & D1U, gp_Vec & D1V, gp_Vec & D2U, gp_Vec & D2V, gp_Vec & D2UV);

		/****** Geom_OffsetSurface::D3 ******/
		/****** md5 signature: 2fbd4d1b6bb5f19034b05b5a6e0ddec0 ******/
		%feature("compactdefaultargs") D3;
		%feature("autodoc", "
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

Return
-------
None

Description
-----------
Raised if the continuity of the basis surface is not C4.
") D3;
		void D3(const Standard_Real U, const Standard_Real V, gp_Pnt & P, gp_Vec & D1U, gp_Vec & D1V, gp_Vec & D2U, gp_Vec & D2V, gp_Vec & D2UV, gp_Vec & D3U, gp_Vec & D3V, gp_Vec & D3UUV, gp_Vec & D3UVV);

		/****** Geom_OffsetSurface::DN ******/
		/****** md5 signature: 78200f5fa5a4060f4022c2e3d9d8ac0e ******/
		%feature("compactdefaultargs") DN;
		%feature("autodoc", "
Parameters
----------
U: float
V: float
Nu: int
Nv: int

Return
-------
gp_Vec

Description
-----------
Computes the derivative of order Nu in the direction u and Nv in the direction v. //! Raised if the continuity of the basis surface is not CNu + 1 in the U direction and CNv + 1 in the V direction. Raised if Nu + Nv < 1 or Nu < 0 or Nv < 0. //! The following methods compute the value and derivatives on the offset surface and returns the derivatives on the basis surface too. The computation of the value and derivatives on the basis surface are used to evaluate the offset surface. //! Warnings: The exception UndefinedValue or UndefinedDerivative is raised if it is not possible to compute a unique offset direction.
") DN;
		gp_Vec DN(const Standard_Real U, const Standard_Real V, const Standard_Integer Nu, const Standard_Integer Nv);


        /****************** DumpJson ******************/
        %feature("autodoc", "
Parameters
----------
depth: int, default=-1

Return
-------
str

Description
-----------
Dump the object to JSON string.
") DumpJson;
        %extend{
            std::string DumpJson(int depth=-1) {
            std::stringstream s;
            self->DumpJson(s, depth);
            return "{" + s.str() + "}" ;}
        };
		/****** Geom_OffsetSurface::GetBasisSurfContinuity ******/
		/****** md5 signature: 40b8f706c00d911b3fc43528ba8520d6 ******/
		%feature("compactdefaultargs") GetBasisSurfContinuity;
		%feature("autodoc", "Return
-------
GeomAbs_Shape

Description
-----------
Returns continuity of the basis surface.
") GetBasisSurfContinuity;
		GeomAbs_Shape GetBasisSurfContinuity();

		/****** Geom_OffsetSurface::IsCNu ******/
		/****** md5 signature: c9f9f7f6eb82d83e9ba43e721cffba8a ******/
		%feature("compactdefaultargs") IsCNu;
		%feature("autodoc", "
Parameters
----------
N: int

Return
-------
bool

Description
-----------
This method answer True if the continuity of the basis surface is N + 1 in the U parametric direction. We suppose in this class that a unique normal is defined at any point on the basis surface. Raised if N <0.
") IsCNu;
		Standard_Boolean IsCNu(const Standard_Integer N);

		/****** Geom_OffsetSurface::IsCNv ******/
		/****** md5 signature: 0acb88d1ffd7eea46785f30d7fc5f85e ******/
		%feature("compactdefaultargs") IsCNv;
		%feature("autodoc", "
Parameters
----------
N: int

Return
-------
bool

Description
-----------
This method answer True if the continuity of the basis surface is N + 1 in the V parametric direction. We suppose in this class that a unique normal is defined at any point on the basis surface. Raised if N <0.
") IsCNv;
		Standard_Boolean IsCNv(const Standard_Integer N);

		/****** Geom_OffsetSurface::IsUClosed ******/
		/****** md5 signature: d1e8bae29b90dc447f4693c94ad31c37 ******/
		%feature("compactdefaultargs") IsUClosed;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Checks whether this offset surface is closed in the u parametric direction. Returns true if, taking uFirst and uLast as the parametric bounds in the u parametric direction, the distance between the points P(uFirst,v) and P(uLast,v) is less than or equal to gp::Resolution() for each value of the parameter v.
") IsUClosed;
		Standard_Boolean IsUClosed();

		/****** Geom_OffsetSurface::IsUPeriodic ******/
		/****** md5 signature: 91acb028d6850ac4bbf00dc198b558b7 ******/
		%feature("compactdefaultargs") IsUPeriodic;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if this offset surface is periodic in the u parametric direction, i.e. if the basis surface of this offset surface is periodic in this direction.
") IsUPeriodic;
		Standard_Boolean IsUPeriodic();

		/****** Geom_OffsetSurface::IsVClosed ******/
		/****** md5 signature: aa0eae8155ddef3e9f1d0cc573955bb6 ******/
		%feature("compactdefaultargs") IsVClosed;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Checks whether this offset surface is closed in the u or v parametric direction. Returns true if taking vFirst and vLast as the parametric bounds in the v parametric direction, the distance between the points P(u,vFirst) and P(u,vLast) is less than or equal to gp::Resolution() for each value of the parameter u.
") IsVClosed;
		Standard_Boolean IsVClosed();

		/****** Geom_OffsetSurface::IsVPeriodic ******/
		/****** md5 signature: 88e9b94f2ab4a3d73c3fe787315e4448 ******/
		%feature("compactdefaultargs") IsVPeriodic;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if this offset surface is periodic in the v parametric direction, i.e. if the basis surface of this offset surface is periodic in this direction.
") IsVPeriodic;
		Standard_Boolean IsVPeriodic();

		/****** Geom_OffsetSurface::Offset ******/
		/****** md5 signature: a94c4bf9f31884e74a7dc8632571268e ******/
		%feature("compactdefaultargs") Offset;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the offset value of this offset surface.
") Offset;
		Standard_Real Offset();

		/****** Geom_OffsetSurface::OsculatingSurface ******/
		/****** md5 signature: 3b2b79c090adc05a74f74def3f1d4232 ******/
		%feature("compactdefaultargs") OsculatingSurface;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom_OsculatingSurface>

Description
-----------
Returns osculating surface if base surface is B-spline or Bezier.
") OsculatingSurface;
		const opencascade::handle<Geom_OsculatingSurface> & OsculatingSurface();

		/****** Geom_OffsetSurface::ParametricTransformation ******/
		/****** md5 signature: 019b69215b9dcafd8e9b0052b449ea05 ******/
		%feature("compactdefaultargs") ParametricTransformation;
		%feature("autodoc", "
Parameters
----------
T: gp_Trsf

Return
-------
gp_GTrsf2d

Description
-----------
Returns a 2d transformation used to find the new parameters of a point on the transformed surface. @code me->Transformed(T)->Value(U',V') @endcode is the same point as @code me->Value(U,V).Transformed(T) @endcode Where U',V' are obtained by transforming U,V with the 2d transformation returned by @code me->ParametricTransformation(T) @endcode This method calls the basis surface method.
") ParametricTransformation;
		virtual gp_GTrsf2d ParametricTransformation(const gp_Trsf & T);

		/****** Geom_OffsetSurface::SetBasisSurface ******/
		/****** md5 signature: 3c9791d7995b558fed5ffbe2e9d33ce2 ******/
		%feature("compactdefaultargs") SetBasisSurface;
		%feature("autodoc", "
Parameters
----------
S: Geom_Surface
isNotCheckC0: bool (optional, default to Standard_False)

Return
-------
None

Description
-----------
Raised if S is not at least C1. Warnings: No check is done to verify that a unique normal direction is defined at any point of the basis surface S. If isNotCheckC0 = True checking if basis surface has C0-continuity is not made. Exceptions Standard_ConstructionError if the surface S is not at least 'C1' continuous.
") SetBasisSurface;
		void SetBasisSurface(const opencascade::handle<Geom_Surface> & S, const Standard_Boolean isNotCheckC0 = Standard_False);

		/****** Geom_OffsetSurface::SetOffsetValue ******/
		/****** md5 signature: b0345a26ec85d9ad16bb8be0106b4798 ******/
		%feature("compactdefaultargs") SetOffsetValue;
		%feature("autodoc", "
Parameters
----------
D: float

Return
-------
None

Description
-----------
Changes this offset surface by assigning D as the offset value.
") SetOffsetValue;
		void SetOffsetValue(const Standard_Real D);

		/****** Geom_OffsetSurface::Surface ******/
		/****** md5 signature: 352bd890213763e77e08756c09e1fdcc ******/
		%feature("compactdefaultargs") Surface;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom_Surface>

Description
-----------
returns an equivalent surface of the offset surface when the basis surface is a canonic surface or a rectangular limited surface on canonic surface or if the offset is null.
") Surface;
		opencascade::handle<Geom_Surface> Surface();

		/****** Geom_OffsetSurface::Transform ******/
		/****** md5 signature: b643be97d129c62226d788cd0501ced0 ******/
		%feature("compactdefaultargs") Transform;
		%feature("autodoc", "
Parameters
----------
T: gp_Trsf

Return
-------
None

Description
-----------
Applies the transformation T to this offset surface. Note: the basis surface is also modified.
") Transform;
		void Transform(const gp_Trsf & T);

		/****** Geom_OffsetSurface::TransformParameters ******/
		/****** md5 signature: 2d9e8651399bacbb299466ac222a6ca8 ******/
		%feature("compactdefaultargs") TransformParameters;
		%feature("autodoc", "
Parameters
----------
T: gp_Trsf

Return
-------
U: float
V: float

Description
-----------
Computes the parameters on the transformed surface for the transform of the point of parameters U,V on <self>. @code me->Transformed(T)->Value(U',V') @endcode is the same point as @code me->Value(U,V).Transformed(T) @endcode Where U',V' are the new values of U,V after calling @code me->TransformParameters(U,V,T) @endcode This method calls the basis surface method.
") TransformParameters;
		virtual void TransformParameters(Standard_Real &OutValue, Standard_Real &OutValue, const gp_Trsf & T);

		/****** Geom_OffsetSurface::UIso ******/
		/****** md5 signature: f5e8cbc22e32c38f4dd05caadff59fee ******/
		%feature("compactdefaultargs") UIso;
		%feature("autodoc", "
Parameters
----------
U: float

Return
-------
opencascade::handle<Geom_Curve>

Description
-----------
Computes the U isoparametric curve.
") UIso;
		opencascade::handle<Geom_Curve> UIso(const Standard_Real U);

		/****** Geom_OffsetSurface::UOsculatingSurface ******/
		/****** md5 signature: 4b32d3dc69a020e36ad4fe4216209098 ******/
		%feature("compactdefaultargs") UOsculatingSurface;
		%feature("autodoc", "
Parameters
----------
U: float
V: float
UOsculSurf: Geom_BSplineSurface

Return
-------
IsOpposite: bool

Description
-----------
if Standard_True, L is the local osculating surface along U at the point U,V. It means that DL/DU is collinear to DS/DU . If IsOpposite == Standard_True these vectors have opposite direction.
") UOsculatingSurface;
		Standard_Boolean UOsculatingSurface(const Standard_Real U, const Standard_Real V, Standard_Boolean &OutValue, opencascade::handle<Geom_BSplineSurface> & UOsculSurf);

		/****** Geom_OffsetSurface::UPeriod ******/
		/****** md5 signature: 99929007fac43736aa36012893e9b882 ******/
		%feature("compactdefaultargs") UPeriod;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the period of this offset surface in the u parametric direction respectively, i.e. the period of the basis surface of this offset surface in this parametric direction. raises if the surface is not uperiodic.
") UPeriod;
		virtual Standard_Real UPeriod();

		/****** Geom_OffsetSurface::UReverse ******/
		/****** md5 signature: 31a376207d6b3f3c82d0cde57034e1f2 ******/
		%feature("compactdefaultargs") UReverse;
		%feature("autodoc", "Return
-------
None

Description
-----------
Changes the orientation of this offset surface in the u parametric direction. The bounds of the surface are not changed but the given parametric direction is reversed.
") UReverse;
		void UReverse();

		/****** Geom_OffsetSurface::UReversedParameter ******/
		/****** md5 signature: 0071925b176316f0aaaf26f369ac410c ******/
		%feature("compactdefaultargs") UReversedParameter;
		%feature("autodoc", "
Parameters
----------
U: float

Return
-------
float

Description
-----------
Computes the u parameter on the modified surface, produced by reversing the u parametric direction of this offset surface, for any point of u parameter U on this offset surface.
") UReversedParameter;
		Standard_Real UReversedParameter(const Standard_Real U);

		/****** Geom_OffsetSurface::VIso ******/
		/****** md5 signature: ef8726fc193d6cf33f54c94b9ed952a5 ******/
		%feature("compactdefaultargs") VIso;
		%feature("autodoc", "
Parameters
----------
V: float

Return
-------
opencascade::handle<Geom_Curve>

Description
-----------
Computes the V isoparametric curve. //! The following methods compute value and derivatives. //! Warnings An exception is raised if a unique normal vector is not defined on the basis surface for the parametric value (U,V). No check is done at the creation time and we suppose in this package that the offset surface can be defined at any point.
") VIso;
		opencascade::handle<Geom_Curve> VIso(const Standard_Real V);

		/****** Geom_OffsetSurface::VOsculatingSurface ******/
		/****** md5 signature: 7d608cfa41efd7176bc7900e25924abf ******/
		%feature("compactdefaultargs") VOsculatingSurface;
		%feature("autodoc", "
Parameters
----------
U: float
V: float
VOsculSurf: Geom_BSplineSurface

Return
-------
IsOpposite: bool

Description
-----------
if Standard_True, L is the local osculating surface along V at the point U,V. It means that DL/DV is collinear to DS/DV . If IsOpposite == Standard_True these vectors have opposite direction.
") VOsculatingSurface;
		Standard_Boolean VOsculatingSurface(const Standard_Real U, const Standard_Real V, Standard_Boolean &OutValue, opencascade::handle<Geom_BSplineSurface> & VOsculSurf);

		/****** Geom_OffsetSurface::VPeriod ******/
		/****** md5 signature: 0b2fb065ece518694127e1e1eadebb25 ******/
		%feature("compactdefaultargs") VPeriod;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the period of this offset surface in the v parametric direction respectively, i.e. the period of the basis surface of this offset surface in this parametric direction. raises if the surface is not vperiodic.
") VPeriod;
		virtual Standard_Real VPeriod();

		/****** Geom_OffsetSurface::VReverse ******/
		/****** md5 signature: ca22d262a13cf236e9be77a884d19536 ******/
		%feature("compactdefaultargs") VReverse;
		%feature("autodoc", "Return
-------
None

Description
-----------
Changes the orientation of this offset surface in the v parametric direction. The bounds of the surface are not changed but the given parametric direction is reversed.
") VReverse;
		void VReverse();

		/****** Geom_OffsetSurface::VReversedParameter ******/
		/****** md5 signature: 92057d43e0e5ee078908582a4176343b ******/
		%feature("compactdefaultargs") VReversedParameter;
		%feature("autodoc", "
Parameters
----------
V: float

Return
-------
float

Description
-----------
Computes the v parameter on the modified surface, produced by reversing the or v parametric direction of this offset surface, for any point of v parameter V on this offset surface.
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
		/****** Geom_SweptSurface::BasisCurve ******/
		/****** md5 signature: ece4de977d9b1715803929678e07eec5 ******/
		%feature("compactdefaultargs") BasisCurve;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom_Curve>

Description
-----------
Returns the referenced curve of the surface. For a surface of revolution it is the revolution curve, for a surface of linear extrusion it is the extruded curve.
") BasisCurve;
		opencascade::handle<Geom_Curve> BasisCurve();

		/****** Geom_SweptSurface::Continuity ******/
		/****** md5 signature: 9381b370dfdd50af7f1b79ce202f0c6f ******/
		%feature("compactdefaultargs") Continuity;
		%feature("autodoc", "Return
-------
GeomAbs_Shape

Description
-----------
returns the continuity of the surface: C0: only geometric continuity, C1: continuity of the first derivative all along the surface, C2: continuity of the second derivative all along the surface, C3: continuity of the third derivative all along the surface, G1: tangency continuity all along the surface, G2: curvature continuity all along the surface, CN: the order of continuity is infinite.
") Continuity;
		GeomAbs_Shape Continuity();

		/****** Geom_SweptSurface::Direction ******/
		/****** md5 signature: 6107c9113155a9ae9007c5c8e526a738 ******/
		%feature("compactdefaultargs") Direction;
		%feature("autodoc", "Return
-------
gp_Dir

Description
-----------
Returns the reference direction of the swept surface. For a surface of revolution it is the direction of the revolution axis, for a surface of linear extrusion it is the direction of extrusion.
") Direction;
		const gp_Dir Direction();


        /****************** DumpJson ******************/
        %feature("autodoc", "
Parameters
----------
depth: int, default=-1

Return
-------
str

Description
-----------
Dump the object to JSON string.
") DumpJson;
        %extend{
            std::string DumpJson(int depth=-1) {
            std::stringstream s;
            self->DumpJson(s, depth);
            return "{" + s.str() + "}" ;}
        };
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
		/****** Geom_VectorWithMagnitude::Geom_VectorWithMagnitude ******/
		/****** md5 signature: d452ebe86bc347315e2c41dad6267754 ******/
		%feature("compactdefaultargs") Geom_VectorWithMagnitude;
		%feature("autodoc", "
Parameters
----------
V: gp_Vec

Return
-------
None

Description
-----------
Creates a transient copy of V.
") Geom_VectorWithMagnitude;
		 Geom_VectorWithMagnitude(const gp_Vec & V);

		/****** Geom_VectorWithMagnitude::Geom_VectorWithMagnitude ******/
		/****** md5 signature: 721cda91d973dd3353331d0964e1b76d ******/
		%feature("compactdefaultargs") Geom_VectorWithMagnitude;
		%feature("autodoc", "
Parameters
----------
X: float
Y: float
Z: float

Return
-------
None

Description
-----------
Creates a vector with three cartesian coordinates.
") Geom_VectorWithMagnitude;
		 Geom_VectorWithMagnitude(const Standard_Real X, const Standard_Real Y, const Standard_Real Z);

		/****** Geom_VectorWithMagnitude::Geom_VectorWithMagnitude ******/
		/****** md5 signature: 24229209f10fb0d557f9072e9cdb94fb ******/
		%feature("compactdefaultargs") Geom_VectorWithMagnitude;
		%feature("autodoc", "
Parameters
----------
P1: gp_Pnt
P2: gp_Pnt

Return
-------
None

Description
-----------
Creates a vector from the point P1 to the point P2. The magnitude of the vector is the distance between P1 and P2.
") Geom_VectorWithMagnitude;
		 Geom_VectorWithMagnitude(const gp_Pnt & P1, const gp_Pnt & P2);

		/****** Geom_VectorWithMagnitude::Add ******/
		/****** md5 signature: 09e25bd598db678c1b1c733cb1e60933 ******/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
Other: Geom_Vector

Return
-------
None

Description
-----------
Adds the Vector Other to <self>.
") Add;
		void Add(const opencascade::handle<Geom_Vector> & Other);

		/****** Geom_VectorWithMagnitude::Added ******/
		/****** md5 signature: 94707da5af4746ec73d7588657693cb8 ******/
		%feature("compactdefaultargs") Added;
		%feature("autodoc", "
Parameters
----------
Other: Geom_Vector

Return
-------
opencascade::handle<Geom_VectorWithMagnitude>

Description
-----------
Adds the vector Other to <self>.
") Added;
		opencascade::handle<Geom_VectorWithMagnitude> Added(const opencascade::handle<Geom_Vector> & Other);

		/****** Geom_VectorWithMagnitude::Copy ******/
		/****** md5 signature: 1360a3e0ea51e38ae19c71fb8aa1c4e9 ******/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom_Geometry>

Description
-----------
Creates a new object which is a copy of this vector.
") Copy;
		opencascade::handle<Geom_Geometry> Copy();

		/****** Geom_VectorWithMagnitude::Cross ******/
		/****** md5 signature: a06b8645c602d8aef3b712051c34ad37 ******/
		%feature("compactdefaultargs") Cross;
		%feature("autodoc", "
Parameters
----------
Other: Geom_Vector

Return
-------
None

Description
-----------
Computes the cross product between <self> and Other <self> ^ Other.
") Cross;
		void Cross(const opencascade::handle<Geom_Vector> & Other);

		/****** Geom_VectorWithMagnitude::CrossCross ******/
		/****** md5 signature: 4b3dec90e760f8fc351eaf98bbe17760 ******/
		%feature("compactdefaultargs") CrossCross;
		%feature("autodoc", "
Parameters
----------
V1: Geom_Vector
V2: Geom_Vector

Return
-------
None

Description
-----------
Computes the triple vector product <self> ^ (V1 ^ V2).
") CrossCross;
		void CrossCross(const opencascade::handle<Geom_Vector> & V1, const opencascade::handle<Geom_Vector> & V2);

		/****** Geom_VectorWithMagnitude::CrossCrossed ******/
		/****** md5 signature: 773178c0edb5c20353137f54da44fafe ******/
		%feature("compactdefaultargs") CrossCrossed;
		%feature("autodoc", "
Parameters
----------
V1: Geom_Vector
V2: Geom_Vector

Return
-------
opencascade::handle<Geom_Vector>

Description
-----------
Computes the triple vector product <self> ^ (V1 ^ V2). A new vector is returned.
") CrossCrossed;
		opencascade::handle<Geom_Vector> CrossCrossed(const opencascade::handle<Geom_Vector> & V1, const opencascade::handle<Geom_Vector> & V2);

		/****** Geom_VectorWithMagnitude::Crossed ******/
		/****** md5 signature: 2c8e8934238b7f03649fb8fb7a43e59a ******/
		%feature("compactdefaultargs") Crossed;
		%feature("autodoc", "
Parameters
----------
Other: Geom_Vector

Return
-------
opencascade::handle<Geom_Vector>

Description
-----------
Computes the cross product between <self> and Other <self> ^ Other. A new vector is returned.
") Crossed;
		opencascade::handle<Geom_Vector> Crossed(const opencascade::handle<Geom_Vector> & Other);

		/****** Geom_VectorWithMagnitude::Divide ******/
		/****** md5 signature: 7bc46cf38daaa2229b322d9add0408e3 ******/
		%feature("compactdefaultargs") Divide;
		%feature("autodoc", "
Parameters
----------
Scalar: float

Return
-------
None

Description
-----------
Divides <self> by a scalar.
") Divide;
		void Divide(const Standard_Real Scalar);

		/****** Geom_VectorWithMagnitude::Divided ******/
		/****** md5 signature: 083e82bd7d9299e7e5b8f00407207b44 ******/
		%feature("compactdefaultargs") Divided;
		%feature("autodoc", "
Parameters
----------
Scalar: float

Return
-------
opencascade::handle<Geom_VectorWithMagnitude>

Description
-----------
Divides <self> by a scalar. A new vector is returned.
") Divided;
		opencascade::handle<Geom_VectorWithMagnitude> Divided(const Standard_Real Scalar);

		/****** Geom_VectorWithMagnitude::Magnitude ******/
		/****** md5 signature: 7de7b7dd76586e80dfb981b910f5ec5e ******/
		%feature("compactdefaultargs") Magnitude;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the magnitude of <self>.
") Magnitude;
		Standard_Real Magnitude();

		/****** Geom_VectorWithMagnitude::Multiplied ******/
		/****** md5 signature: daa7dc993f23e1e76f5f8bf2428d513f ******/
		%feature("compactdefaultargs") Multiplied;
		%feature("autodoc", "
Parameters
----------
Scalar: float

Return
-------
opencascade::handle<Geom_VectorWithMagnitude>

Description
-----------
Computes the product of the vector <self> by a scalar. A new vector is returned.
") Multiplied;
		opencascade::handle<Geom_VectorWithMagnitude> Multiplied(const Standard_Real Scalar);

		/****** Geom_VectorWithMagnitude::Multiply ******/
		/****** md5 signature: c6d925fe0833ff6abc2c1aab20682246 ******/
		%feature("compactdefaultargs") Multiply;
		%feature("autodoc", "
Parameters
----------
Scalar: float

Return
-------
None

Description
-----------
Computes the product of the vector <self> by a scalar.
") Multiply;
		void Multiply(const Standard_Real Scalar);

		/****** Geom_VectorWithMagnitude::Normalize ******/
		/****** md5 signature: 587346cf1e1c12fdf674aedc915ccd95 ******/
		%feature("compactdefaultargs") Normalize;
		%feature("autodoc", "Return
-------
None

Description
-----------
Normalizes <self>. //! Raised if the magnitude of the vector is lower or equal to Resolution from package gp.
") Normalize;
		void Normalize();

		/****** Geom_VectorWithMagnitude::Normalized ******/
		/****** md5 signature: 63792ae8de598e3246c89063dfb6a7ad ******/
		%feature("compactdefaultargs") Normalized;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom_VectorWithMagnitude>

Description
-----------
Returns a copy of <self> Normalized. //! Raised if the magnitude of the vector is lower or equal to Resolution from package gp.
") Normalized;
		opencascade::handle<Geom_VectorWithMagnitude> Normalized();

		/****** Geom_VectorWithMagnitude::SetCoord ******/
		/****** md5 signature: 191a33c01dc9e7fdb47a43d5d7ff9d99 ******/
		%feature("compactdefaultargs") SetCoord;
		%feature("autodoc", "
Parameters
----------
X: float
Y: float
Z: float

Return
-------
None

Description
-----------
Assigns the values X, Y and Z to the coordinates of this vector.
") SetCoord;
		void SetCoord(const Standard_Real X, const Standard_Real Y, const Standard_Real Z);

		/****** Geom_VectorWithMagnitude::SetVec ******/
		/****** md5 signature: 679db7366752a8b2b6694fa169fbe412 ******/
		%feature("compactdefaultargs") SetVec;
		%feature("autodoc", "
Parameters
----------
V: gp_Vec

Return
-------
None

Description
-----------
Converts the gp_Vec vector V into this vector.
") SetVec;
		void SetVec(const gp_Vec & V);

		/****** Geom_VectorWithMagnitude::SetX ******/
		/****** md5 signature: 30fe204d4c67d94370133e1d40dc6787 ******/
		%feature("compactdefaultargs") SetX;
		%feature("autodoc", "
Parameters
----------
X: float

Return
-------
None

Description
-----------
Changes the X coordinate of <self>.
") SetX;
		void SetX(const Standard_Real X);

		/****** Geom_VectorWithMagnitude::SetY ******/
		/****** md5 signature: 8f42f770a3959dece2671d90f60e35e2 ******/
		%feature("compactdefaultargs") SetY;
		%feature("autodoc", "
Parameters
----------
Y: float

Return
-------
None

Description
-----------
Changes the Y coordinate of <self>.
") SetY;
		void SetY(const Standard_Real Y);

		/****** Geom_VectorWithMagnitude::SetZ ******/
		/****** md5 signature: d96a64d9a788ed7bdd745a3dcbb831ea ******/
		%feature("compactdefaultargs") SetZ;
		%feature("autodoc", "
Parameters
----------
Z: float

Return
-------
None

Description
-----------
Changes the Z coordinate of <self>.
") SetZ;
		void SetZ(const Standard_Real Z);

		/****** Geom_VectorWithMagnitude::SquareMagnitude ******/
		/****** md5 signature: e9cc7ce2500a11b7e18b76619fa1de15 ******/
		%feature("compactdefaultargs") SquareMagnitude;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the square magnitude of <self>.
") SquareMagnitude;
		Standard_Real SquareMagnitude();

		/****** Geom_VectorWithMagnitude::Subtract ******/
		/****** md5 signature: d3146a986ae9b0a260509489a297c95f ******/
		%feature("compactdefaultargs") Subtract;
		%feature("autodoc", "
Parameters
----------
Other: Geom_Vector

Return
-------
None

Description
-----------
Subtracts the Vector Other to <self>.
") Subtract;
		void Subtract(const opencascade::handle<Geom_Vector> & Other);

		/****** Geom_VectorWithMagnitude::Subtracted ******/
		/****** md5 signature: 5df26fa71096eabaaaebf8fc9486c2a5 ******/
		%feature("compactdefaultargs") Subtracted;
		%feature("autodoc", "
Parameters
----------
Other: Geom_Vector

Return
-------
opencascade::handle<Geom_VectorWithMagnitude>

Description
-----------
Subtracts the vector Other to <self>. A new vector is returned.
") Subtracted;
		opencascade::handle<Geom_VectorWithMagnitude> Subtracted(const opencascade::handle<Geom_Vector> & Other);

		/****** Geom_VectorWithMagnitude::Transform ******/
		/****** md5 signature: b643be97d129c62226d788cd0501ced0 ******/
		%feature("compactdefaultargs") Transform;
		%feature("autodoc", "
Parameters
----------
T: gp_Trsf

Return
-------
None

Description
-----------
Applies the transformation T to this vector.
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
		/****** Geom_BSplineCurve::Geom_BSplineCurve ******/
		/****** md5 signature: aa959be4aa942a29a2164d6bbbaa9836 ******/
		%feature("compactdefaultargs") Geom_BSplineCurve;
		%feature("autodoc", "
Parameters
----------
Poles: TColgp_Array1OfPnt
Knots: TColStd_Array1OfReal
Multiplicities: TColStd_Array1OfInteger
Degree: int
Periodic: bool (optional, default to Standard_False)

Return
-------
None

Description
-----------
Creates a non-rational B_spline curve on the basis <Knots, Multiplicities> of degree <Degree>.
") Geom_BSplineCurve;
		 Geom_BSplineCurve(const TColgp_Array1OfPnt & Poles, const TColStd_Array1OfReal & Knots, const TColStd_Array1OfInteger & Multiplicities, const Standard_Integer Degree, const Standard_Boolean Periodic = Standard_False);

		/****** Geom_BSplineCurve::Geom_BSplineCurve ******/
		/****** md5 signature: febe71f9f4b62c4419f66a23769ade54 ******/
		%feature("compactdefaultargs") Geom_BSplineCurve;
		%feature("autodoc", "
Parameters
----------
Poles: TColgp_Array1OfPnt
Weights: TColStd_Array1OfReal
Knots: TColStd_Array1OfReal
Multiplicities: TColStd_Array1OfInteger
Degree: int
Periodic: bool (optional, default to Standard_False)
CheckRational: bool (optional, default to Standard_True)

Return
-------
None

Description
-----------
Creates a rational B_spline curve on the basis <Knots, Multiplicities> of degree <Degree>. Raises ConstructionError subject to the following conditions 0 < Degree <= MaxDegree. //! Weights.Length() == Poles.Length() //! Knots.Length() == Mults.Length() >= 2 //! Knots(i) < Knots(i+1) (Knots are increasing) //! 1 <= Mults(i) <= Degree //! On a non periodic curve the first and last multiplicities may be Degree+1 (this is even recommended if you want the curve to start and finish on the first and last pole). //! On a periodic curve the first and the last multicities must be the same. //! on non-periodic curves //! Poles.Length() == Sum(Mults(i)) - Degree - 1 >= 2 //! on periodic curves //! Poles.Length() == Sum(Mults(i)) except the first or last.
") Geom_BSplineCurve;
		 Geom_BSplineCurve(const TColgp_Array1OfPnt & Poles, const TColStd_Array1OfReal & Weights, const TColStd_Array1OfReal & Knots, const TColStd_Array1OfInteger & Multiplicities, const Standard_Integer Degree, const Standard_Boolean Periodic = Standard_False, const Standard_Boolean CheckRational = Standard_True);

		/****** Geom_BSplineCurve::Continuity ******/
		/****** md5 signature: 9381b370dfdd50af7f1b79ce202f0c6f ******/
		%feature("compactdefaultargs") Continuity;
		%feature("autodoc", "Return
-------
GeomAbs_Shape

Description
-----------
Returns the global continuity of the curve: C0: only geometric continuity, C1: continuity of the first derivative all along the Curve, C2: continuity of the second derivative all along the Curve, C3: continuity of the third derivative all along the Curve, CN: the order of continuity is infinite. For a B-spline curve of degree d if a knot Ui has a multiplicity p the B-spline curve is only Cd-p continuous at Ui. So the global continuity of the curve can't be greater than Cd-p where p is the maximum multiplicity of the interior Knots. In the interior of a knot span the curve is infinitely continuously differentiable.
") Continuity;
		GeomAbs_Shape Continuity();

		/****** Geom_BSplineCurve::Copy ******/
		/****** md5 signature: 1360a3e0ea51e38ae19c71fb8aa1c4e9 ******/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom_Geometry>

Description
-----------
Creates a new object which is a copy of this BSpline curve.
") Copy;
		opencascade::handle<Geom_Geometry> Copy();

		/****** Geom_BSplineCurve::D0 ******/
		/****** md5 signature: 5f7d08d8d17afc516aac9ef64bf9711f ******/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "
Parameters
----------
U: float
P: gp_Pnt

Return
-------
None

Description
-----------
Returns in P the point of parameter U.
") D0;
		void D0(const Standard_Real U, gp_Pnt & P);

		/****** Geom_BSplineCurve::D1 ******/
		/****** md5 signature: 0264d3f49439e8cb4580d20449d25b51 ******/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "
Parameters
----------
U: float
P: gp_Pnt
V1: gp_Vec

Return
-------
None

Description
-----------
Raised if the continuity of the curve is not C1.
") D1;
		void D1(const Standard_Real U, gp_Pnt & P, gp_Vec & V1);

		/****** Geom_BSplineCurve::D2 ******/
		/****** md5 signature: a694b4ba68c0fd83fbac79f945cb5d8c ******/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "
Parameters
----------
U: float
P: gp_Pnt
V1: gp_Vec
V2: gp_Vec

Return
-------
None

Description
-----------
Raised if the continuity of the curve is not C2.
") D2;
		void D2(const Standard_Real U, gp_Pnt & P, gp_Vec & V1, gp_Vec & V2);

		/****** Geom_BSplineCurve::D3 ******/
		/****** md5 signature: cf1c3b5fe7af9d5c183c1b16b21c43f1 ******/
		%feature("compactdefaultargs") D3;
		%feature("autodoc", "
Parameters
----------
U: float
P: gp_Pnt
V1: gp_Vec
V2: gp_Vec
V3: gp_Vec

Return
-------
None

Description
-----------
Raised if the continuity of the curve is not C3.
") D3;
		void D3(const Standard_Real U, gp_Pnt & P, gp_Vec & V1, gp_Vec & V2, gp_Vec & V3);

		/****** Geom_BSplineCurve::DN ******/
		/****** md5 signature: 0d4a3e2fc2b4b03d2a49e0796a487efb ******/
		%feature("compactdefaultargs") DN;
		%feature("autodoc", "
Parameters
----------
U: float
N: int

Return
-------
gp_Vec

Description
-----------
For the point of parameter U of this BSpline curve, computes the vector corresponding to the Nth derivative. Warning On a point where the continuity of the curve is not the one requested, this function impacts the part defined by the parameter with a value greater than U, i.e. the part of the curve to the 'right' of the singularity. Exceptions Standard_RangeError if N is less than 1. //! The following functions compute the point of parameter U and the derivatives at this point on the B-spline curve arc defined between the knot FromK1 and the knot ToK2. U can be out of bounds [Knot (FromK1), Knot (ToK2)] but for the computation we only use the definition of the curve between these two knots. This method is useful to compute local derivative, if the order of continuity of the whole curve is not greater enough. Inside the parametric domain Knot (FromK1), Knot (ToK2) the evaluations are the same as if we consider the whole definition of the curve. Of course the evaluations are different outside this parametric domain.
") DN;
		gp_Vec DN(const Standard_Real U, const Standard_Integer N);

		/****** Geom_BSplineCurve::Degree ******/
		/****** md5 signature: e3276df1ce733e2c8e940db548a26d03 ******/
		%feature("compactdefaultargs") Degree;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the degree of this BSpline curve. The degree of a Geom_BSplineCurve curve cannot be greater than Geom_BSplineCurve::MaxDegree(). Computation of value and derivatives.
") Degree;
		Standard_Integer Degree();


        /****************** DumpJson ******************/
        %feature("autodoc", "
Parameters
----------
depth: int, default=-1

Return
-------
str

Description
-----------
Dump the object to JSON string.
") DumpJson;
        %extend{
            std::string DumpJson(int depth=-1) {
            std::stringstream s;
            self->DumpJson(s, depth);
            return "{" + s.str() + "}" ;}
        };
		/****** Geom_BSplineCurve::EndPoint ******/
		/****** md5 signature: 8dd4886e4c303cec8092c23bff0110c3 ******/
		%feature("compactdefaultargs") EndPoint;
		%feature("autodoc", "Return
-------
gp_Pnt

Description
-----------
Returns the last point of the curve. Warnings: The last point of the curve is different from the last pole of the curve if the multiplicity of the last knot is lower than Degree.
") EndPoint;
		gp_Pnt EndPoint();

		/****** Geom_BSplineCurve::FirstParameter ******/
		/****** md5 signature: eb9ebe94572bd67588fe8811eac261fb ******/
		%feature("compactdefaultargs") FirstParameter;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the value of the first parameter of this BSpline curve. This is a knot value. The first parameter is the one of the start point of the BSpline curve.
") FirstParameter;
		Standard_Real FirstParameter();

		/****** Geom_BSplineCurve::FirstUKnotIndex ******/
		/****** md5 signature: cd1268c018861ca921686718cddd2c78 ******/
		%feature("compactdefaultargs") FirstUKnotIndex;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the index in the knot array of the knot corresponding to the first or last parameter of this BSpline curve. For a BSpline curve, the first (or last) parameter (which gives the start (or end) point of the curve) is a knot value. However, if the multiplicity of the first (or last) knot is less than Degree + 1, where Degree is the degree of the curve, it is not the first (or last) knot of the curve.
") FirstUKnotIndex;
		Standard_Integer FirstUKnotIndex();

		/****** Geom_BSplineCurve::IncreaseDegree ******/
		/****** md5 signature: 2f404362ae4c6786bc49eb532abfeb06 ******/
		%feature("compactdefaultargs") IncreaseDegree;
		%feature("autodoc", "
Parameters
----------
Degree: int

Return
-------
None

Description
-----------
Increases the degree of this BSpline curve to Degree. As a result, the poles, weights and multiplicities tables are modified; the knots table is not changed. Nothing is done if Degree is less than or equal to the current degree. Exceptions Standard_ConstructionError if Degree is greater than Geom_BSplineCurve::MaxDegree().
") IncreaseDegree;
		void IncreaseDegree(const Standard_Integer Degree);

		/****** Geom_BSplineCurve::IncreaseMultiplicity ******/
		/****** md5 signature: acbc64714702b7201cc3229bfdba4081 ******/
		%feature("compactdefaultargs") IncreaseMultiplicity;
		%feature("autodoc", "
Parameters
----------
Index: int
M: int

Return
-------
None

Description
-----------
Increases the multiplicity of the knot <Index> to <M>. //! If <M> is lower or equal to the current multiplicity nothing is done. If <M> is higher than the degree the degree is used. If <Index> is not in [FirstUKnotIndex, LastUKnotIndex].
") IncreaseMultiplicity;
		void IncreaseMultiplicity(const Standard_Integer Index, const Standard_Integer M);

		/****** Geom_BSplineCurve::IncreaseMultiplicity ******/
		/****** md5 signature: 20329617e559bb513534e7b5d8d351fc ******/
		%feature("compactdefaultargs") IncreaseMultiplicity;
		%feature("autodoc", "
Parameters
----------
I1: int
I2: int
M: int

Return
-------
None

Description
-----------
Increases the multiplicities of the knots in [I1,I2] to <M>. //! For each knot if <M> is lower or equal to the current multiplicity nothing is done. If <M> is higher than the degree the degree is used. If <I1,I2> are not in [FirstUKnotIndex, LastUKnotIndex].
") IncreaseMultiplicity;
		void IncreaseMultiplicity(const Standard_Integer I1, const Standard_Integer I2, const Standard_Integer M);

		/****** Geom_BSplineCurve::IncrementMultiplicity ******/
		/****** md5 signature: 7c6b4452fa65fae5da2a1a56ab1d1564 ******/
		%feature("compactdefaultargs") IncrementMultiplicity;
		%feature("autodoc", "
Parameters
----------
I1: int
I2: int
M: int

Return
-------
None

Description
-----------
Increment the multiplicities of the knots in [I1,I2] by <M>. //! If <M> is not positive nithing is done. //! For each knot the resulting multiplicity is limited to the Degree. If <I1,I2> are not in [FirstUKnotIndex, LastUKnotIndex].
") IncrementMultiplicity;
		void IncrementMultiplicity(const Standard_Integer I1, const Standard_Integer I2, const Standard_Integer M);

		/****** Geom_BSplineCurve::InsertKnot ******/
		/****** md5 signature: 4107fd8f43066c1257644c676b582c67 ******/
		%feature("compactdefaultargs") InsertKnot;
		%feature("autodoc", "
Parameters
----------
U: float
M: int (optional, default to 1)
ParametricTolerance: float (optional, default to 0.0)
Add: bool (optional, default to Standard_True)

Return
-------
None

Description
-----------
Inserts a knot value in the sequence of knots. If <U> is an existing knot the multiplicity is increased by <M>. //! If U is not on the parameter range nothing is done. //! If the multiplicity is negative or null nothing is done. The new multiplicity is limited to the degree. //! The tolerance criterion for knots equality is the max of Epsilon(U) and ParametricTolerance.
") InsertKnot;
		void InsertKnot(const Standard_Real U, const Standard_Integer M = 1, const Standard_Real ParametricTolerance = 0.0, const Standard_Boolean Add = Standard_True);

		/****** Geom_BSplineCurve::InsertKnots ******/
		/****** md5 signature: 6518beb27958c7c7882b20b52acc844f ******/
		%feature("compactdefaultargs") InsertKnots;
		%feature("autodoc", "
Parameters
----------
Knots: TColStd_Array1OfReal
Mults: TColStd_Array1OfInteger
ParametricTolerance: float (optional, default to 0.0)
Add: bool (optional, default to Standard_False)

Return
-------
None

Description
-----------
Inserts a set of knots values in the sequence of knots. //! For each U = Knots(i), M = Mults(i) //! If <U> is an existing knot the multiplicity is increased by <M> if <Add> is True, increased to <M> if <Add> is False. //! If U is not on the parameter range nothing is done. //! If the multiplicity is negative or null nothing is done. The new multiplicity is limited to the degree. //! The tolerance criterion for knots equality is the max of Epsilon(U) and ParametricTolerance.
") InsertKnots;
		void InsertKnots(const TColStd_Array1OfReal & Knots, const TColStd_Array1OfInteger & Mults, const Standard_Real ParametricTolerance = 0.0, const Standard_Boolean Add = Standard_False);

		/****** Geom_BSplineCurve::IsCN ******/
		/****** md5 signature: 73c2d9ecdd776a5227f0665f0702fcb3 ******/
		%feature("compactdefaultargs") IsCN;
		%feature("autodoc", "
Parameters
----------
N: int

Return
-------
bool

Description
-----------
Returns the continuity of the curve, the curve is at least C0. Raised if N < 0.
") IsCN;
		Standard_Boolean IsCN(const Standard_Integer N);

		/****** Geom_BSplineCurve::IsClosed ******/
		/****** md5 signature: 00978070ec4cb5f00d1d002a8d5d3763 ******/
		%feature("compactdefaultargs") IsClosed;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if the distance between the first point and the last point of the curve is lower or equal to Resolution from package gp. Warnings: The first and the last point can be different from the first pole and the last pole of the curve.
") IsClosed;
		Standard_Boolean IsClosed();

		/****** Geom_BSplineCurve::IsEqual ******/
		/****** md5 signature: b76d8f87acae5fdabd21328ec54f8e57 ******/
		%feature("compactdefaultargs") IsEqual;
		%feature("autodoc", "
Parameters
----------
theOther: Geom_BSplineCurve
thePreci: float

Return
-------
bool

Description
-----------
Compare two Bspline curve on identity;.
") IsEqual;
		Standard_Boolean IsEqual(const opencascade::handle<Geom_BSplineCurve> & theOther, const Standard_Real thePreci);

		/****** Geom_BSplineCurve::IsG1 ******/
		/****** md5 signature: 9f6daa5a840326c7c14dda9f95a957d1 ******/
		%feature("compactdefaultargs") IsG1;
		%feature("autodoc", "
Parameters
----------
theTf: float
theTl: float
theAngTol: float

Return
-------
bool

Description
-----------
Check if curve has at least G1 continuity in interval [theTf, theTl] Returns true if IsCN(1) or angle between 'left' and 'right' first derivatives at knots with C0 continuity is less then theAngTol only knots in interval [theTf, theTl] is checked.
") IsG1;
		Standard_Boolean IsG1(const Standard_Real theTf, const Standard_Real theTl, const Standard_Real theAngTol);

		/****** Geom_BSplineCurve::IsPeriodic ******/
		/****** md5 signature: 15e3ccfd3ad4ae42959489f7f64aa8ca ******/
		%feature("compactdefaultargs") IsPeriodic;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if the curve is periodic.
") IsPeriodic;
		Standard_Boolean IsPeriodic();

		/****** Geom_BSplineCurve::IsRational ******/
		/****** md5 signature: fd4212ffa7bc30cde420e74a2c539434 ******/
		%feature("compactdefaultargs") IsRational;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if the weights are not identical. The tolerance criterion is Epsilon of the class Real.
") IsRational;
		Standard_Boolean IsRational();

		/****** Geom_BSplineCurve::Knot ******/
		/****** md5 signature: 87780028b98a8253068f050487c4f4d5 ******/
		%feature("compactdefaultargs") Knot;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
float

Description
-----------
Returns the knot of range Index. When there is a knot with a multiplicity greater than 1 the knot is not repeated. The method Multiplicity can be used to get the multiplicity of the Knot. Raised if Index < 1 or Index > NbKnots.
") Knot;
		Standard_Real Knot(const Standard_Integer Index);

		/****** Geom_BSplineCurve::KnotDistribution ******/
		/****** md5 signature: 6b866e71367b1f5428eba6d3bcc36415 ******/
		%feature("compactdefaultargs") KnotDistribution;
		%feature("autodoc", "Return
-------
GeomAbs_BSplKnotDistribution

Description
-----------
Returns NonUniform or Uniform or QuasiUniform or PiecewiseBezier. If all the knots differ by a positive constant from the preceding knot the BSpline Curve can be: - Uniform if all the knots are of multiplicity 1, - QuasiUniform if all the knots are of multiplicity 1 except for the first and last knot which are of multiplicity Degree + 1, - PiecewiseBezier if the first and last knots have multiplicity Degree + 1 and if interior knots have multiplicity Degree A piecewise Bezier with only two knots is a BezierCurve. else the curve is non uniform. The tolerance criterion is Epsilon from class Real.
") KnotDistribution;
		GeomAbs_BSplKnotDistribution KnotDistribution();

		/****** Geom_BSplineCurve::KnotSequence ******/
		/****** md5 signature: 16870e6acc7bcd815fb4e50aaa88ac5a ******/
		%feature("compactdefaultargs") KnotSequence;
		%feature("autodoc", "
Parameters
----------
K: TColStd_Array1OfReal

Return
-------
None

Description
-----------
Returns K, the knots sequence of this BSpline curve. In this sequence, knots with a multiplicity greater than 1 are repeated. In the case of a non-periodic curve the length of the sequence must be equal to the sum of the NbKnots multiplicities of the knots of the curve (where NbKnots is the number of knots of this BSpline curve). This sum is also equal to: NbPoles + Degree + 1 where NbPoles is the number of poles and Degree the degree of this BSpline curve. In the case of a periodic curve, if there are k periodic knots, the period is Knot(k+1) - Knot(1). The initial sequence is built by writing knots 1 to k+1, which are repeated according to their corresponding multiplicities. If Degree is the degree of the curve, the degree of continuity of the curve at the knot of index 1 (or k+1) is equal to c = Degree + 1 - Mult(1). c knots are then inserted at the beginning and end of the initial sequence: - the c values of knots preceding the first item Knot(k+1) in the initial sequence are inserted at the beginning; the period is subtracted from these c values; - the c values of knots following the last item Knot(1) in the initial sequence are inserted at the end; the period is added to these c values. The length of the sequence must therefore be equal to: NbPoles + 2*Degree - Mult(1) + 2. Example For a non-periodic BSpline curve of degree 2 where: - the array of knots is: { k1 k2 k3 k4 }, - with associated multiplicities: { 3 1 2 3 }, the knot sequence is: K = { k1 k1 k1 k2 k3 k3 k4 k4 k4 } For a periodic BSpline curve of degree 4 , which is 'C1' continuous at the first knot, and where: - the periodic knots are: { k1 k2 k3 (k4) } (3 periodic knots: the points of parameter k1 and k4 are identical, the period is p = k4 - k1), - with associated multiplicities: { 3 1 2 (3) }, the degree of continuity at knots k1 and k4 is: Degree + 1 - Mult(i) = 2. 2 supplementary knots are added at the beginning and end of the sequence: - at the beginning: the 2 knots preceding k4 minus the period; in this example, this is k3 - p both times; - at the end: the 2 knots following k1 plus the period; in this example, this is k2 + p and k3 + p. The knot sequence is therefore: K = { k3-p k3-p k1 k1 k1 k2 k3 k3 k4 k4 k4 k2+p k3+p } Exceptions Raised if K.Lower() is less than number of first knot in knot sequence with repetitions or K.Upper() is more than number of last knot in knot sequence with repetitions.
") KnotSequence;
		void KnotSequence(TColStd_Array1OfReal & K);

		/****** Geom_BSplineCurve::KnotSequence ******/
		/****** md5 signature: 4c1c40cd0e87a5ecb1feb1289774c756 ******/
		%feature("compactdefaultargs") KnotSequence;
		%feature("autodoc", "Return
-------
TColStd_Array1OfReal

Description
-----------
returns the knots of the B-spline curve. Knots with multiplicit greater than 1 are repeated.
") KnotSequence;
		const TColStd_Array1OfReal & KnotSequence();

		/****** Geom_BSplineCurve::Knots ******/
		/****** md5 signature: 949cf09b8db41cbb8ab5188bcb475e56 ******/
		%feature("compactdefaultargs") Knots;
		%feature("autodoc", "
Parameters
----------
K: TColStd_Array1OfReal

Return
-------
None

Description
-----------
returns the knot values of the B-spline curve; Warning A knot with a multiplicity greater than 1 is not repeated in the knot table. The Multiplicity function can be used to obtain the multiplicity of each knot. //! Raised K.Lower() is less than number of first knot or K.Upper() is more than number of last knot.
") Knots;
		void Knots(TColStd_Array1OfReal & K);

		/****** Geom_BSplineCurve::Knots ******/
		/****** md5 signature: 8001460ab922c7159116eb85f0693b97 ******/
		%feature("compactdefaultargs") Knots;
		%feature("autodoc", "Return
-------
TColStd_Array1OfReal

Description
-----------
returns the knot values of the B-spline curve; Warning A knot with a multiplicity greater than 1 is not repeated in the knot table. The Multiplicity function can be used to obtain the multiplicity of each knot.
") Knots;
		const TColStd_Array1OfReal & Knots();

		/****** Geom_BSplineCurve::LastParameter ******/
		/****** md5 signature: cb4925a2d4a451ceec8f6ad486530f9c ******/
		%feature("compactdefaultargs") LastParameter;
		%feature("autodoc", "Return
-------
float

Description
-----------
Computes the parametric value of the end point of the curve. It is a knot value.
") LastParameter;
		Standard_Real LastParameter();

		/****** Geom_BSplineCurve::LastUKnotIndex ******/
		/****** md5 signature: b5183e855ac73e665e20fe9cd9a25fef ******/
		%feature("compactdefaultargs") LastUKnotIndex;
		%feature("autodoc", "Return
-------
int

Description
-----------
For a BSpline curve the last parameter (which gives the end point of the curve) is a knot value but if the multiplicity of the last knot index is lower than Degree + 1 it is not the last knot of the curve. This method computes the index of the knot corresponding to the last parameter.
") LastUKnotIndex;
		Standard_Integer LastUKnotIndex();

		/****** Geom_BSplineCurve::LocalD0 ******/
		/****** md5 signature: 7f47ff3d5e00339610831a0d52809be4 ******/
		%feature("compactdefaultargs") LocalD0;
		%feature("autodoc", "
Parameters
----------
U: float
FromK1: int
ToK2: int
P: gp_Pnt

Return
-------
None

Description
-----------
Raised if FromK1 = ToK2.
") LocalD0;
		void LocalD0(const Standard_Real U, const Standard_Integer FromK1, const Standard_Integer ToK2, gp_Pnt & P);

		/****** Geom_BSplineCurve::LocalD1 ******/
		/****** md5 signature: 384daee5e7c8e473572b28a29f4c0084 ******/
		%feature("compactdefaultargs") LocalD1;
		%feature("autodoc", "
Parameters
----------
U: float
FromK1: int
ToK2: int
P: gp_Pnt
V1: gp_Vec

Return
-------
None

Description
-----------
Raised if the local continuity of the curve is not C1 between the knot K1 and the knot K2. Raised if FromK1 = ToK2.
") LocalD1;
		void LocalD1(const Standard_Real U, const Standard_Integer FromK1, const Standard_Integer ToK2, gp_Pnt & P, gp_Vec & V1);

		/****** Geom_BSplineCurve::LocalD2 ******/
		/****** md5 signature: ef77beb8e22657fb4d943898ae2df73d ******/
		%feature("compactdefaultargs") LocalD2;
		%feature("autodoc", "
Parameters
----------
U: float
FromK1: int
ToK2: int
P: gp_Pnt
V1: gp_Vec
V2: gp_Vec

Return
-------
None

Description
-----------
Raised if the local continuity of the curve is not C2 between the knot K1 and the knot K2. Raised if FromK1 = ToK2.
") LocalD2;
		void LocalD2(const Standard_Real U, const Standard_Integer FromK1, const Standard_Integer ToK2, gp_Pnt & P, gp_Vec & V1, gp_Vec & V2);

		/****** Geom_BSplineCurve::LocalD3 ******/
		/****** md5 signature: 0758e25d0170dd9e8bb8ee73e2ec3aaf ******/
		%feature("compactdefaultargs") LocalD3;
		%feature("autodoc", "
Parameters
----------
U: float
FromK1: int
ToK2: int
P: gp_Pnt
V1: gp_Vec
V2: gp_Vec
V3: gp_Vec

Return
-------
None

Description
-----------
Raised if the local continuity of the curve is not C3 between the knot K1 and the knot K2. Raised if FromK1 = ToK2.
") LocalD3;
		void LocalD3(const Standard_Real U, const Standard_Integer FromK1, const Standard_Integer ToK2, gp_Pnt & P, gp_Vec & V1, gp_Vec & V2, gp_Vec & V3);

		/****** Geom_BSplineCurve::LocalDN ******/
		/****** md5 signature: 4f668f6913b751c73e9de6b9c190fb02 ******/
		%feature("compactdefaultargs") LocalDN;
		%feature("autodoc", "
Parameters
----------
U: float
FromK1: int
ToK2: int
N: int

Return
-------
gp_Vec

Description
-----------
Raised if the local continuity of the curve is not CN between the knot K1 and the knot K2. Raised if FromK1 = ToK2. Raised if N < 1.
") LocalDN;
		gp_Vec LocalDN(const Standard_Real U, const Standard_Integer FromK1, const Standard_Integer ToK2, const Standard_Integer N);

		/****** Geom_BSplineCurve::LocalValue ******/
		/****** md5 signature: 9df5c7e700773d0c94d83d2117dedfd3 ******/
		%feature("compactdefaultargs") LocalValue;
		%feature("autodoc", "
Parameters
----------
U: float
FromK1: int
ToK2: int

Return
-------
gp_Pnt

Description
-----------
Raised if FromK1 = ToK2.
") LocalValue;
		gp_Pnt LocalValue(const Standard_Real U, const Standard_Integer FromK1, const Standard_Integer ToK2);

		/****** Geom_BSplineCurve::LocateU ******/
		/****** md5 signature: d536ddd65ca3edfb5dd75e59f7417959 ******/
		%feature("compactdefaultargs") LocateU;
		%feature("autodoc", "
Parameters
----------
U: float
ParametricTolerance: float
WithKnotRepetition: bool (optional, default to Standard_False)

Return
-------
I1: int
I2: int

Description
-----------
Locates the parametric value U in the sequence of knots. If 'WithKnotRepetition' is True we consider the knot's representation with repetition of multiple knot value, otherwise we consider the knot's representation with no repetition of multiple knot values. Knots (I1) <= U <= Knots (I2) . if I1 = I2 U is a knot value (the tolerance criterion ParametricTolerance is used). . if I1 < 1 => U < Knots (1) - Abs(ParametricTolerance) . if I2 > NbKnots => U > Knots (NbKnots) + Abs(ParametricTolerance).
") LocateU;
		void LocateU(const Standard_Real U, const Standard_Real ParametricTolerance, Standard_Integer &OutValue, Standard_Integer &OutValue, const Standard_Boolean WithKnotRepetition = Standard_False);

		/****** Geom_BSplineCurve::MaxDegree ******/
		/****** md5 signature: 985314a0ed62b597a9bdf0f555b97bed ******/
		%feature("compactdefaultargs") MaxDegree;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the value of the maximum degree of the normalized B-spline basis functions in this package.
") MaxDegree;
		static Standard_Integer MaxDegree();

		/****** Geom_BSplineCurve::MovePoint ******/
		/****** md5 signature: 482b67aaf4ab72d5f2ec26c1a1e1a38c ******/
		%feature("compactdefaultargs") MovePoint;
		%feature("autodoc", "
Parameters
----------
U: float
P: gp_Pnt
Index1: int
Index2: int

Return
-------
FirstModifiedPole: int
LastModifiedPole: int

Description
-----------
Moves the point of parameter U of this BSpline curve to P. Index1 and Index2 are the indexes in the table of poles of this BSpline curve of the first and last poles designated to be moved. FirstModifiedPole and LastModifiedPole are the indexes of the first and last poles which are effectively modified. In the event of incompatibility between Index1, Index2 and the value U: - no change is made to this BSpline curve, and - the FirstModifiedPole and LastModifiedPole are returned null. Exceptions Standard_OutOfRange if: - Index1 is greater than or equal to Index2, or - Index1 or Index2 is less than 1 or greater than the number of poles of this BSpline curve.
") MovePoint;
		void MovePoint(const Standard_Real U, const gp_Pnt & P, const Standard_Integer Index1, const Standard_Integer Index2, Standard_Integer &OutValue, Standard_Integer &OutValue);

		/****** Geom_BSplineCurve::MovePointAndTangent ******/
		/****** md5 signature: 5d9cf04ee9481c575090c788835bb070 ******/
		%feature("compactdefaultargs") MovePointAndTangent;
		%feature("autodoc", "
Parameters
----------
U: float
P: gp_Pnt
Tangent: gp_Vec
Tolerance: float
StartingCondition: int
EndingCondition: int

Return
-------
ErrorStatus: int

Description
-----------
Move a point with parameter U to P. and makes it tangent at U be Tangent. StartingCondition = -1 means first can move EndingCondition = -1 means last point can move StartingCondition = 0 means the first point cannot move EndingCondition = 0 means the last point cannot move StartingCondition = 1 means the first point and tangent cannot move EndingCondition = 1 means the last point and tangent cannot move and so forth ErrorStatus != 0 means that there are not enough degree of freedom with the constrain to deform the curve accordingly.
") MovePointAndTangent;
		void MovePointAndTangent(const Standard_Real U, const gp_Pnt & P, const gp_Vec & Tangent, const Standard_Real Tolerance, const Standard_Integer StartingCondition, const Standard_Integer EndingCondition, Standard_Integer &OutValue);

		/****** Geom_BSplineCurve::Multiplicities ******/
		/****** md5 signature: 5e4cb134cc2959735c59c531d6a8b490 ******/
		%feature("compactdefaultargs") Multiplicities;
		%feature("autodoc", "
Parameters
----------
M: TColStd_Array1OfInteger

Return
-------
None

Description
-----------
Returns the multiplicity of the knots of the curve. //! Raised if the length of M is not equal to NbKnots.
") Multiplicities;
		void Multiplicities(TColStd_Array1OfInteger & M);

		/****** Geom_BSplineCurve::Multiplicities ******/
		/****** md5 signature: cde561f92fd30b25ca2f1b1b8716c207 ******/
		%feature("compactdefaultargs") Multiplicities;
		%feature("autodoc", "Return
-------
TColStd_Array1OfInteger

Description
-----------
returns the multiplicity of the knots of the curve.
") Multiplicities;
		const TColStd_Array1OfInteger & Multiplicities();

		/****** Geom_BSplineCurve::Multiplicity ******/
		/****** md5 signature: 0b00002ea9c75b6fa0f22b159f127931 ******/
		%feature("compactdefaultargs") Multiplicity;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
int

Description
-----------
Returns the multiplicity of the knots of range Index. Raised if Index < 1 or Index > NbKnots.
") Multiplicity;
		Standard_Integer Multiplicity(const Standard_Integer Index);

		/****** Geom_BSplineCurve::NbKnots ******/
		/****** md5 signature: ccda669299f8eba1ba0d3387af4c950e ******/
		%feature("compactdefaultargs") NbKnots;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of knots. This method returns the number of knot without repetition of multiple knots.
") NbKnots;
		Standard_Integer NbKnots();

		/****** Geom_BSplineCurve::NbPoles ******/
		/****** md5 signature: 9a7d6d5f8a21c5833786e951bce99604 ******/
		%feature("compactdefaultargs") NbPoles;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of poles.
") NbPoles;
		Standard_Integer NbPoles();

		/****** Geom_BSplineCurve::PeriodicNormalization ******/
		/****** md5 signature: ba1016bda06943eb982997be7f9da740 ******/
		%feature("compactdefaultargs") PeriodicNormalization;
		%feature("autodoc", "
Parameters
----------

Return
-------
U: float

Description
-----------
returns the parameter normalized within the period if the curve is periodic: otherwise does not do anything.
") PeriodicNormalization;
		void PeriodicNormalization(Standard_Real &OutValue);

		/****** Geom_BSplineCurve::Pole ******/
		/****** md5 signature: 5a83797398b762820fe4e76a1b7c2504 ******/
		%feature("compactdefaultargs") Pole;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
gp_Pnt

Description
-----------
Returns the pole of range Index. Raised if Index < 1 or Index > NbPoles.
") Pole;
		const gp_Pnt Pole(const Standard_Integer Index);

		/****** Geom_BSplineCurve::Poles ******/
		/****** md5 signature: 6f58b0e5f2985c3cf12db24d338cf6c3 ******/
		%feature("compactdefaultargs") Poles;
		%feature("autodoc", "
Parameters
----------
P: TColgp_Array1OfPnt

Return
-------
None

Description
-----------
Returns the poles of the B-spline curve; //! Raised if the length of P is not equal to the number of poles.
") Poles;
		void Poles(TColgp_Array1OfPnt & P);

		/****** Geom_BSplineCurve::Poles ******/
		/****** md5 signature: 74aabdc9663f922ca9ac5a471f930356 ******/
		%feature("compactdefaultargs") Poles;
		%feature("autodoc", "Return
-------
TColgp_Array1OfPnt

Description
-----------
Returns the poles of the B-spline curve;.
") Poles;
		const TColgp_Array1OfPnt & Poles();

		/****** Geom_BSplineCurve::RemoveKnot ******/
		/****** md5 signature: 9210db71a77261be541bbc23355610eb ******/
		%feature("compactdefaultargs") RemoveKnot;
		%feature("autodoc", "
Parameters
----------
Index: int
M: int
Tolerance: float

Return
-------
bool

Description
-----------
Reduces the multiplicity of the knot of index Index to M. If M is equal to 0, the knot is removed. With a modification of this type, the array of poles is also modified. Two different algorithms are systematically used to compute the new poles of the curve. If, for each pole, the distance between the pole calculated using the first algorithm and the same pole calculated using the second algorithm, is less than Tolerance, this ensures that the curve is not modified by more than Tolerance. Under these conditions, true is returned; otherwise, false is returned. A low tolerance is used to prevent modification of the curve. A high tolerance is used to 'smooth' the curve. Exceptions Standard_OutOfRange if Index is outside the bounds of the knots table. pole insertion and pole removing this operation is limited to the Uniform or QuasiUniform BSplineCurve. The knot values are modified . If the BSpline is NonUniform or Piecewise Bezier an exception Construction error is raised.
") RemoveKnot;
		Standard_Boolean RemoveKnot(const Standard_Integer Index, const Standard_Integer M, const Standard_Real Tolerance);

		/****** Geom_BSplineCurve::Resolution ******/
		/****** md5 signature: 6437f52eb15539577fb4ae8621d2ded9 ******/
		%feature("compactdefaultargs") Resolution;
		%feature("autodoc", "
Parameters
----------
Tolerance3D: float

Return
-------
UTolerance: float

Description
-----------
Computes for this BSpline curve the parametric tolerance UTolerance for a given 3D tolerance Tolerance3D. If f(t) is the equation of this BSpline curve, UTolerance ensures that: | t1 - t0| < Utolerance ===> |f(t1) - f(t0)| < Tolerance3D.
") Resolution;
		void Resolution(const Standard_Real Tolerance3D, Standard_Real &OutValue);

		/****** Geom_BSplineCurve::Reverse ******/
		/****** md5 signature: bff3d53d1cf0b268b7de85021a2bf3c4 ******/
		%feature("compactdefaultargs") Reverse;
		%feature("autodoc", "Return
-------
None

Description
-----------
Changes the direction of parametrization of <self>. The Knot sequence is modified, the FirstParameter and the LastParameter are not modified. The StartPoint of the initial curve becomes the EndPoint of the reversed curve and the EndPoint of the initial curve becomes the StartPoint of the reversed curve.
") Reverse;
		void Reverse();

		/****** Geom_BSplineCurve::ReversedParameter ******/
		/****** md5 signature: 382721d5a4ea752fecc12f03ab0de9a1 ******/
		%feature("compactdefaultargs") ReversedParameter;
		%feature("autodoc", "
Parameters
----------
U: float

Return
-------
float

Description
-----------
Returns the parameter on the reversed curve for the point of parameter U on <self>. //! returns UFirst + ULast - U.
") ReversedParameter;
		Standard_Real ReversedParameter(const Standard_Real U);

		/****** Geom_BSplineCurve::Segment ******/
		/****** md5 signature: 26df5d98b25171a395c66397318dcefc ******/
		%feature("compactdefaultargs") Segment;
		%feature("autodoc", "
Parameters
----------
U1: float
U2: float
theTolerance: float (optional, default to Precision::PConfusion())

Return
-------
None

Description
-----------
Modifies this BSpline curve by segmenting it between U1 and U2. Either of these values can be outside the bounds of the curve, but U2 must be greater than U1. All data structure tables of this BSpline curve are modified, but the knots located between U1 and U2 are retained. The degree of the curve is not modified. //! Parameter theTolerance defines the possible proximity of the segment boundaries and B-spline knots to treat them as equal. //! Warnings: Even if <self> is not closed it can become closed after the segmentation for example if U1 or U2 are out of the bounds of the curve <self> or if the curve makes loop. After the segmentation the length of a curve can be null. raises if U2 < U1. Standard_DomainError if U2 - U1 exceeds the period for periodic curves. i.e. ((U2 - U1) - Period) > Precision::PConfusion().
") Segment;
		void Segment(const Standard_Real U1, const Standard_Real U2, const Standard_Real theTolerance = Precision::PConfusion());

		/****** Geom_BSplineCurve::SetKnot ******/
		/****** md5 signature: 24248dddb124af2118f7043ae254694e ******/
		%feature("compactdefaultargs") SetKnot;
		%feature("autodoc", "
Parameters
----------
Index: int
K: float

Return
-------
None

Description
-----------
Modifies this BSpline curve by assigning the value K to the knot of index Index in the knots table. This is a relatively local modification because K must be such that: Knots(Index - 1) < K < Knots(Index + 1) The second syntax allows you also to increase the multiplicity of the knot to M (but it is not possible to decrease the multiplicity of the knot with this function). Standard_ConstructionError if: - K is not such that: Knots(Index - 1) < K < Knots(Index + 1) - M is greater than the degree of this BSpline curve or lower than the previous multiplicity of knot of index Index in the knots table. Standard_OutOfRange if Index is outside the bounds of the knots table.
") SetKnot;
		void SetKnot(const Standard_Integer Index, const Standard_Real K);

		/****** Geom_BSplineCurve::SetKnot ******/
		/****** md5 signature: 12123e73421d28330eec5dae317ac18f ******/
		%feature("compactdefaultargs") SetKnot;
		%feature("autodoc", "
Parameters
----------
Index: int
K: float
M: int

Return
-------
None

Description
-----------
Changes the knot of range Index with its multiplicity. You can increase the multiplicity of a knot but it is not allowed to decrease the multiplicity of an existing knot. //! Raised if K >= Knots(Index+1) or K <= Knots(Index-1). Raised if M is greater than Degree or lower than the previous multiplicity of knot of range Index. Raised if Index < 1 || Index > NbKnots.
") SetKnot;
		void SetKnot(const Standard_Integer Index, const Standard_Real K, const Standard_Integer M);

		/****** Geom_BSplineCurve::SetKnots ******/
		/****** md5 signature: d319c647ea235edd171c661a477e0338 ******/
		%feature("compactdefaultargs") SetKnots;
		%feature("autodoc", "
Parameters
----------
K: TColStd_Array1OfReal

Return
-------
None

Description
-----------
Modifies this BSpline curve by assigning the array K to its knots table. The multiplicity of the knots is not modified. Exceptions Standard_ConstructionError if the values in the array K are not in ascending order. Standard_OutOfRange if the bounds of the array K are not respectively 1 and the number of knots of this BSpline curve.
") SetKnots;
		void SetKnots(const TColStd_Array1OfReal & K);

		/****** Geom_BSplineCurve::SetNotPeriodic ******/
		/****** md5 signature: ccfbd171d2b38df3531b77ecbc51dcae ******/
		%feature("compactdefaultargs") SetNotPeriodic;
		%feature("autodoc", "Return
-------
None

Description
-----------
Changes this BSpline curve into a non-periodic curve. If this curve is already non-periodic, it is not modified. Note: the poles and knots tables are modified. Warning If this curve is periodic, as the multiplicity of the first and last knots is not modified, and is not equal to Degree + 1, where Degree is the degree of this BSpline curve, the start and end points of the curve are not its first and last poles.
") SetNotPeriodic;
		void SetNotPeriodic();

		/****** Geom_BSplineCurve::SetOrigin ******/
		/****** md5 signature: bcb4756c4db11bf7ed3d05d2f98659f0 ******/
		%feature("compactdefaultargs") SetOrigin;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
None

Description
-----------
Assigns the knot of index Index in the knots table as the origin of this periodic BSpline curve. As a consequence, the knots and poles tables are modified. Exceptions Standard_NoSuchObject if this curve is not periodic. Standard_DomainError if Index is outside the bounds of the knots table.
") SetOrigin;
		void SetOrigin(const Standard_Integer Index);

		/****** Geom_BSplineCurve::SetOrigin ******/
		/****** md5 signature: 6ec07ce42052ea40f10882071071f1bc ******/
		%feature("compactdefaultargs") SetOrigin;
		%feature("autodoc", "
Parameters
----------
U: float
Tol: float

Return
-------
None

Description
-----------
Set the origin of a periodic curve at Knot U. If U is not a knot of the BSpline a new knot is inserted. KnotVector and poles are modified. Raised if the curve is not periodic.
") SetOrigin;
		void SetOrigin(const Standard_Real U, const Standard_Real Tol);

		/****** Geom_BSplineCurve::SetPeriodic ******/
		/****** md5 signature: 3d498279f2dd83a2ab9aa88181da253f ******/
		%feature("compactdefaultargs") SetPeriodic;
		%feature("autodoc", "Return
-------
None

Description
-----------
Changes this BSpline curve into a periodic curve. To become periodic, the curve must first be closed. Next, the knot sequence must be periodic. For this, FirstUKnotIndex and LastUKnotIndex are used to compute I1 and I2, the indexes in the knots array of the knots corresponding to the first and last parameters of this BSpline curve. The period is therefore: Knots(I2) - Knots(I1). Consequently, the knots and poles tables are modified. Exceptions Standard_ConstructionError if this BSpline curve is not closed.
") SetPeriodic;
		void SetPeriodic();

		/****** Geom_BSplineCurve::SetPole ******/
		/****** md5 signature: c804d6e49d15c749b2cf3bf061821fae ******/
		%feature("compactdefaultargs") SetPole;
		%feature("autodoc", "
Parameters
----------
Index: int
P: gp_Pnt

Return
-------
None

Description
-----------
Modifies this BSpline curve by assigning P to the pole of index Index in the poles table. Exceptions Standard_OutOfRange if Index is outside the bounds of the poles table. Standard_ConstructionError if Weight is negative or null.
") SetPole;
		void SetPole(const Standard_Integer Index, const gp_Pnt & P);

		/****** Geom_BSplineCurve::SetPole ******/
		/****** md5 signature: ae5484e750e2e148a7cbe47257d71d1c ******/
		%feature("compactdefaultargs") SetPole;
		%feature("autodoc", "
Parameters
----------
Index: int
P: gp_Pnt
Weight: float

Return
-------
None

Description
-----------
Modifies this BSpline curve by assigning P to the pole of index Index in the poles table. This syntax also allows you to modify the weight of the modified pole, which becomes Weight. In this case, if this BSpline curve is non-rational, it can become rational and vice versa. Exceptions Standard_OutOfRange if Index is outside the bounds of the poles table. Standard_ConstructionError if Weight is negative or null.
") SetPole;
		void SetPole(const Standard_Integer Index, const gp_Pnt & P, const Standard_Real Weight);

		/****** Geom_BSplineCurve::SetWeight ******/
		/****** md5 signature: 4e7aa00d12e09e9b776d4bf66f07ecec ******/
		%feature("compactdefaultargs") SetWeight;
		%feature("autodoc", "
Parameters
----------
Index: int
Weight: float

Return
-------
None

Description
-----------
Changes the weight for the pole of range Index. If the curve was non rational it can become rational. If the curve was rational it can become non rational. //! Raised if Index < 1 || Index > NbPoles Raised if Weight <= 0.0.
") SetWeight;
		void SetWeight(const Standard_Integer Index, const Standard_Real Weight);

		/****** Geom_BSplineCurve::StartPoint ******/
		/****** md5 signature: ccb2a909a54dc7dd0800015a563c1ff7 ******/
		%feature("compactdefaultargs") StartPoint;
		%feature("autodoc", "Return
-------
gp_Pnt

Description
-----------
Returns the start point of the curve. Warnings: This point is different from the first pole of the curve if the multiplicity of the first knot is lower than Degree.
") StartPoint;
		gp_Pnt StartPoint();

		/****** Geom_BSplineCurve::Transform ******/
		/****** md5 signature: b643be97d129c62226d788cd0501ced0 ******/
		%feature("compactdefaultargs") Transform;
		%feature("autodoc", "
Parameters
----------
T: gp_Trsf

Return
-------
None

Description
-----------
Applies the transformation T to this BSpline curve.
") Transform;
		void Transform(const gp_Trsf & T);

		/****** Geom_BSplineCurve::Weight ******/
		/****** md5 signature: 70cf193bf7498ec22102a906ea9db6f5 ******/
		%feature("compactdefaultargs") Weight;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
float

Description
-----------
Returns the weight of the pole of range Index . Raised if Index < 1 or Index > NbPoles.
") Weight;
		Standard_Real Weight(const Standard_Integer Index);

		/****** Geom_BSplineCurve::Weights ******/
		/****** md5 signature: dd63733e96eafbaacbd2d7b600471c30 ******/
		%feature("compactdefaultargs") Weights;
		%feature("autodoc", "
Parameters
----------
W: TColStd_Array1OfReal

Return
-------
None

Description
-----------
Returns the weights of the B-spline curve; //! Raised if the length of W is not equal to NbPoles.
") Weights;
		void Weights(TColStd_Array1OfReal & W);

		/****** Geom_BSplineCurve::Weights ******/
		/****** md5 signature: 761d13c1de73ab225be280fb8ae764b6 ******/
		%feature("compactdefaultargs") Weights;
		%feature("autodoc", "Return
-------
TColStd_Array1OfReal *

Description
-----------
Returns the weights of the B-spline curve;.
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
		/****** Geom_BSplineSurface::Geom_BSplineSurface ******/
		/****** md5 signature: d0e79094e818d7c29ef7d04c55973c13 ******/
		%feature("compactdefaultargs") Geom_BSplineSurface;
		%feature("autodoc", "
Parameters
----------
Poles: TColgp_Array2OfPnt
UKnots: TColStd_Array1OfReal
VKnots: TColStd_Array1OfReal
UMults: TColStd_Array1OfInteger
VMults: TColStd_Array1OfInteger
UDegree: int
VDegree: int
UPeriodic: bool (optional, default to Standard_False)
VPeriodic: bool (optional, default to Standard_False)

Return
-------
None

Description
-----------
Creates a non-rational b-spline surface (weights default value is 1.). The following conditions must be verified. 0 < UDegree <= MaxDegree. UKnots.Length() == UMults.Length() >= 2 UKnots(i) < UKnots(i+1) (Knots are increasing) 1 <= UMults(i) <= UDegree On a non uperiodic surface the first and last umultiplicities may be UDegree+1 (this is even recommended if you want the curve to start and finish on the first and last pole). On a uperiodic surface the first and the last umultiplicities must be the same. on non-uperiodic surfaces Poles.ColLength() == Sum(UMults(i)) - UDegree - 1 >= 2 on uperiodic surfaces Poles.ColLength() == Sum(UMults(i)) except the first or last The previous conditions for U holds also for V, with the RowLength of the poles.
") Geom_BSplineSurface;
		 Geom_BSplineSurface(const TColgp_Array2OfPnt & Poles, const TColStd_Array1OfReal & UKnots, const TColStd_Array1OfReal & VKnots, const TColStd_Array1OfInteger & UMults, const TColStd_Array1OfInteger & VMults, const Standard_Integer UDegree, const Standard_Integer VDegree, const Standard_Boolean UPeriodic = Standard_False, const Standard_Boolean VPeriodic = Standard_False);

		/****** Geom_BSplineSurface::Geom_BSplineSurface ******/
		/****** md5 signature: 52fa5de422f3f634c1a7b0a56209d8b5 ******/
		%feature("compactdefaultargs") Geom_BSplineSurface;
		%feature("autodoc", "
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
UPeriodic: bool (optional, default to Standard_False)
VPeriodic: bool (optional, default to Standard_False)

Return
-------
None

Description
-----------
Creates a non-rational b-spline surface (weights default value is 1.). //! The following conditions must be verified. 0 < UDegree <= MaxDegree. //! UKnots.Length() == UMults.Length() >= 2 //! UKnots(i) < UKnots(i+1) (Knots are increasing) 1 <= UMults(i) <= UDegree //! On a non uperiodic surface the first and last umultiplicities may be UDegree+1 (this is even recommended if you want the curve to start and finish on the first and last pole). //! On a uperiodic surface the first and the last umultiplicities must be the same. //! on non-uperiodic surfaces //! Poles.ColLength() == Sum(UMults(i)) - UDegree - 1 >= 2 //! on uperiodic surfaces //! Poles.ColLength() == Sum(UMults(i)) except the first or last //! The previous conditions for U holds also for V, with the RowLength of the poles.
") Geom_BSplineSurface;
		 Geom_BSplineSurface(const TColgp_Array2OfPnt & Poles, const TColStd_Array2OfReal & Weights, const TColStd_Array1OfReal & UKnots, const TColStd_Array1OfReal & VKnots, const TColStd_Array1OfInteger & UMults, const TColStd_Array1OfInteger & VMults, const Standard_Integer UDegree, const Standard_Integer VDegree, const Standard_Boolean UPeriodic = Standard_False, const Standard_Boolean VPeriodic = Standard_False);

		/****** Geom_BSplineSurface::Bounds ******/
		/****** md5 signature: bbc36976e796eedf3c69513e986f2adb ******/
		%feature("compactdefaultargs") Bounds;
		%feature("autodoc", "
Parameters
----------

Return
-------
U1: float
U2: float
V1: float
V2: float

Description
-----------
Returns the parametric bounds of the surface. Warnings: These parametric values are the bounds of the array of knots UKnots and VKnots only if the first knots and the last knots have a multiplicity equal to UDegree + 1 or VDegree + 1.
") Bounds;
		void Bounds(Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** Geom_BSplineSurface::CheckAndSegment ******/
		/****** md5 signature: dfc5bea5858729c40332110aa28e7bb8 ******/
		%feature("compactdefaultargs") CheckAndSegment;
		%feature("autodoc", "
Parameters
----------
U1: float
U2: float
V1: float
V2: float
theUTolerance: float (optional, default to Precision::PConfusion())
theVTolerance: float (optional, default to Precision::PConfusion())

Return
-------
None

Description
-----------
Segments the surface between U1 and U2 in the U-Direction. between V1 and V2 in the V-Direction. //! same as Segment but do nothing if U1 and U2 (resp. V1 and V2) are equal to the bounds in U (resp. in V) of <self>. For example, if <self> is periodic in V, it will be always periodic in V after the segmentation if the bounds in V are unchanged //! Parameters theUTolerance, theVTolerance define the possible proximity along the corresponding direction of the segment boundaries and B-spline knots to treat them as equal. //! Warnings: Even if <self> is not closed it can become closed after the segmentation for example if U1 or U2 are out of the bounds of the surface <self> or if the surface makes loop. raises if U2 < U1 or V2 < V1. Standard_DomainError if U2 - U1 exceeds the uperiod for uperiodic surfaces. i.e. ((U2 - U1) - UPeriod) > Precision::PConfusion(). Standard_DomainError if V2 - V1 exceeds the vperiod for vperiodic surfaces. i.e. ((V2 - V1) - VPeriod) > Precision::PConfusion()).
") CheckAndSegment;
		void CheckAndSegment(const Standard_Real U1, const Standard_Real U2, const Standard_Real V1, const Standard_Real V2, const Standard_Real theUTolerance = Precision::PConfusion(), const Standard_Real theVTolerance = Precision::PConfusion());

		/****** Geom_BSplineSurface::Continuity ******/
		/****** md5 signature: 9381b370dfdd50af7f1b79ce202f0c6f ******/
		%feature("compactdefaultargs") Continuity;
		%feature("autodoc", "Return
-------
GeomAbs_Shape

Description
-----------
Returns the continuity of the surface: C0: only geometric continuity, C1: continuity of the first derivative all along the Surface, C2: continuity of the second derivative all along the Surface, C3: continuity of the third derivative all along the Surface, CN: the order of continuity is infinite. A B-spline surface is infinitely continuously differentiable for the couple of parameters U, V such that U != UKnots(i) and V != VKnots(i). The continuity of the surface at a knot value depends on the multiplicity of this knot. Example: If the surface is C1 in the V direction and C2 in the U direction this function returns Shape = C1.
") Continuity;
		GeomAbs_Shape Continuity();

		/****** Geom_BSplineSurface::Copy ******/
		/****** md5 signature: 1360a3e0ea51e38ae19c71fb8aa1c4e9 ******/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom_Geometry>

Description
-----------
Creates a new object which is a copy of this BSpline surface.
") Copy;
		opencascade::handle<Geom_Geometry> Copy();

		/****** Geom_BSplineSurface::D0 ******/
		/****** md5 signature: 909f7ecc223d561155c9c3ba4b8e7b64 ******/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "
Parameters
----------
U: float
V: float
P: gp_Pnt

Return
-------
None

Description
-----------
No available documentation.
") D0;
		void D0(const Standard_Real U, const Standard_Real V, gp_Pnt & P);

		/****** Geom_BSplineSurface::D1 ******/
		/****** md5 signature: 0868b105367e01c443402a5728aa3395 ******/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "
Parameters
----------
U: float
V: float
P: gp_Pnt
D1U: gp_Vec
D1V: gp_Vec

Return
-------
None

Description
-----------
Raised if the continuity of the surface is not C1.
") D1;
		void D1(const Standard_Real U, const Standard_Real V, gp_Pnt & P, gp_Vec & D1U, gp_Vec & D1V);

		/****** Geom_BSplineSurface::D2 ******/
		/****** md5 signature: 5bdb029d3f1561c55d7ab1d1b0b0282a ******/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "
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

Return
-------
None

Description
-----------
Raised if the continuity of the surface is not C2.
") D2;
		void D2(const Standard_Real U, const Standard_Real V, gp_Pnt & P, gp_Vec & D1U, gp_Vec & D1V, gp_Vec & D2U, gp_Vec & D2V, gp_Vec & D2UV);

		/****** Geom_BSplineSurface::D3 ******/
		/****** md5 signature: 2fbd4d1b6bb5f19034b05b5a6e0ddec0 ******/
		%feature("compactdefaultargs") D3;
		%feature("autodoc", "
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

Return
-------
None

Description
-----------
Raised if the continuity of the surface is not C3.
") D3;
		void D3(const Standard_Real U, const Standard_Real V, gp_Pnt & P, gp_Vec & D1U, gp_Vec & D1V, gp_Vec & D2U, gp_Vec & D2V, gp_Vec & D2UV, gp_Vec & D3U, gp_Vec & D3V, gp_Vec & D3UUV, gp_Vec & D3UVV);

		/****** Geom_BSplineSurface::DN ******/
		/****** md5 signature: 78200f5fa5a4060f4022c2e3d9d8ac0e ******/
		%feature("compactdefaultargs") DN;
		%feature("autodoc", "
Parameters
----------
U: float
V: float
Nu: int
Nv: int

Return
-------
gp_Vec

Description
-----------
Nu is the order of derivation in the U parametric direction and Nv is the order of derivation in the V parametric direction. //! Raised if the continuity of the surface is not CNu in the U direction and CNv in the V direction. //! Raised if Nu + Nv < 1 or Nu < 0 or Nv < 0. //! The following functions computes the point for the parametric values (U, V) and the derivatives at this point on the B-spline surface patch delimited with the knots FromUK1, FromVK1 and the knots ToUK2, ToVK2. (U, V) can be out of these parametric bounds but for the computation we only use the definition of the surface between these knots. This method is useful to compute local derivative, if the order of continuity of the whole surface is not greater enough. Inside the parametric knot's domain previously defined the evaluations are the same as if we consider the whole definition of the surface. Of course the evaluations are different outside this parametric domain.
") DN;
		gp_Vec DN(const Standard_Real U, const Standard_Real V, const Standard_Integer Nu, const Standard_Integer Nv);


        /****************** DumpJson ******************/
        %feature("autodoc", "
Parameters
----------
depth: int, default=-1

Return
-------
str

Description
-----------
Dump the object to JSON string.
") DumpJson;
        %extend{
            std::string DumpJson(int depth=-1) {
            std::stringstream s;
            self->DumpJson(s, depth);
            return "{" + s.str() + "}" ;}
        };
		/****** Geom_BSplineSurface::ExchangeUV ******/
		/****** md5 signature: fcaf4a45cf2f84fab80e6127ee17ec77 ******/
		%feature("compactdefaultargs") ExchangeUV;
		%feature("autodoc", "Return
-------
None

Description
-----------
Exchanges the u and v parametric directions on this BSpline surface. As a consequence: - the poles and weights tables are transposed, - the knots and multiplicities tables are exchanged, - degrees of continuity, and rational, periodic and uniform characteristics are exchanged, and - the orientation of the surface is inverted.
") ExchangeUV;
		void ExchangeUV();

		/****** Geom_BSplineSurface::FirstUKnotIndex ******/
		/****** md5 signature: cd1268c018861ca921686718cddd2c78 ******/
		%feature("compactdefaultargs") FirstUKnotIndex;
		%feature("autodoc", "Return
-------
int

Description
-----------
Computes the Index of the UKnots which gives the first parametric value of the surface in the U direction. The UIso curve corresponding to this value is a boundary curve of the surface.
") FirstUKnotIndex;
		Standard_Integer FirstUKnotIndex();

		/****** Geom_BSplineSurface::FirstVKnotIndex ******/
		/****** md5 signature: 7d1184baba1e1523d293389085ada7fe ******/
		%feature("compactdefaultargs") FirstVKnotIndex;
		%feature("autodoc", "Return
-------
int

Description
-----------
Computes the Index of the VKnots which gives the first parametric value of the surface in the V direction. The VIso curve corresponding to this knot is a boundary curve of the surface.
") FirstVKnotIndex;
		Standard_Integer FirstVKnotIndex();

		/****** Geom_BSplineSurface::IncreaseDegree ******/
		/****** md5 signature: 412378019dc10e155c60641469f98819 ******/
		%feature("compactdefaultargs") IncreaseDegree;
		%feature("autodoc", "
Parameters
----------
UDegree: int
VDegree: int

Return
-------
None

Description
-----------
Increases the degrees of this BSpline surface to UDegree and VDegree in the u and v parametric directions respectively. As a result, the tables of poles, weights and multiplicities are modified. The tables of knots is not changed. Note: Nothing is done if the given degree is less than or equal to the current degree in the corresponding parametric direction. Exceptions Standard_ConstructionError if UDegree or VDegree is greater than Geom_BSplineSurface::MaxDegree().
") IncreaseDegree;
		void IncreaseDegree(const Standard_Integer UDegree, const Standard_Integer VDegree);

		/****** Geom_BSplineSurface::IncreaseUMultiplicity ******/
		/****** md5 signature: 127425f9638c40fcc7256ed9a20184d2 ******/
		%feature("compactdefaultargs") IncreaseUMultiplicity;
		%feature("autodoc", "
Parameters
----------
UIndex: int
M: int

Return
-------
None

Description
-----------
Increases the multiplicity of the knot of range UIndex in the UKnots sequence. M is the new multiplicity. M must be greater than the previous multiplicity and lower or equal to the degree of the surface in the U parametric direction. Raised if M is not in the range [1, UDegree] //! Raised if UIndex is not in the range [FirstUKnotIndex, LastUKnotIndex] given by the methods with the same name.
") IncreaseUMultiplicity;
		void IncreaseUMultiplicity(const Standard_Integer UIndex, const Standard_Integer M);

		/****** Geom_BSplineSurface::IncreaseUMultiplicity ******/
		/****** md5 signature: 14e25878c4743ca2c9d03481892d2039 ******/
		%feature("compactdefaultargs") IncreaseUMultiplicity;
		%feature("autodoc", "
Parameters
----------
FromI1: int
ToI2: int
M: int

Return
-------
None

Description
-----------
Increases until order M the multiplicity of the set of knots FromI1,...., ToI2 in the U direction. This method can be used to make a B_spline surface into a PiecewiseBezier B_spline surface. If <self> was uniform, it can become non uniform. //! Raised if FromI1 or ToI2 is out of the range [FirstUKnotIndex, LastUKnotIndex]. //! M should be greater than the previous multiplicity of the all the knots FromI1,..., ToI2 and lower or equal to the Degree of the surface in the U parametric direction.
") IncreaseUMultiplicity;
		void IncreaseUMultiplicity(const Standard_Integer FromI1, const Standard_Integer ToI2, const Standard_Integer M);

		/****** Geom_BSplineSurface::IncreaseVMultiplicity ******/
		/****** md5 signature: bad1723250c8432860262382bfb3c026 ******/
		%feature("compactdefaultargs") IncreaseVMultiplicity;
		%feature("autodoc", "
Parameters
----------
VIndex: int
M: int

Return
-------
None

Description
-----------
Increases the multiplicity of a knot in the V direction. M is the new multiplicity. //! M should be greater than the previous multiplicity and lower than the degree of the surface in the V parametric direction. //! Raised if VIndex is not in the range [FirstVKnotIndex, LastVKnotIndex] given by the methods with the same name.
") IncreaseVMultiplicity;
		void IncreaseVMultiplicity(const Standard_Integer VIndex, const Standard_Integer M);

		/****** Geom_BSplineSurface::IncreaseVMultiplicity ******/
		/****** md5 signature: 4977cec37cd17cd47b6f921f6b86d065 ******/
		%feature("compactdefaultargs") IncreaseVMultiplicity;
		%feature("autodoc", "
Parameters
----------
FromI1: int
ToI2: int
M: int

Return
-------
None

Description
-----------
Increases until order M the multiplicity of the set of knots FromI1,...., ToI2 in the V direction. This method can be used to make a BSplineSurface into a PiecewiseBezier B_spline surface. If <self> was uniform, it can become non-uniform. //! Raised if FromI1 or ToI2 is out of the range [FirstVKnotIndex, LastVKnotIndex] given by the methods with the same name. //! M should be greater than the previous multiplicity of the all the knots FromI1,..., ToI2 and lower or equal to the Degree of the surface in the V parametric direction.
") IncreaseVMultiplicity;
		void IncreaseVMultiplicity(const Standard_Integer FromI1, const Standard_Integer ToI2, const Standard_Integer M);

		/****** Geom_BSplineSurface::IncrementUMultiplicity ******/
		/****** md5 signature: 3c3524b4447db6ae66d098a0c14f8303 ******/
		%feature("compactdefaultargs") IncrementUMultiplicity;
		%feature("autodoc", "
Parameters
----------
FromI1: int
ToI2: int
Step: int

Return
-------
None

Description
-----------
Increments the multiplicity of the consecutives uknots FromI1..ToI2 by step. The multiplicity of each knot FromI1,.....,ToI2 must be lower or equal to the UDegree of the B_spline. //! Raised if FromI1 or ToI2 is not in the range [FirstUKnotIndex, LastUKnotIndex] //! Raised if one knot has a multiplicity greater than UDegree.
") IncrementUMultiplicity;
		void IncrementUMultiplicity(const Standard_Integer FromI1, const Standard_Integer ToI2, const Standard_Integer Step);

		/****** Geom_BSplineSurface::IncrementVMultiplicity ******/
		/****** md5 signature: 3bc44c719c953c6e08b0aed6ad5fbcfa ******/
		%feature("compactdefaultargs") IncrementVMultiplicity;
		%feature("autodoc", "
Parameters
----------
FromI1: int
ToI2: int
Step: int

Return
-------
None

Description
-----------
Increments the multiplicity of the consecutives vknots FromI1..ToI2 by step. The multiplicity of each knot FromI1,.....,ToI2 must be lower or equal to the VDegree of the B_spline. //! Raised if FromI1 or ToI2 is not in the range [FirstVKnotIndex, LastVKnotIndex] //! Raised if one knot has a multiplicity greater than VDegree.
") IncrementVMultiplicity;
		void IncrementVMultiplicity(const Standard_Integer FromI1, const Standard_Integer ToI2, const Standard_Integer Step);

		/****** Geom_BSplineSurface::InsertUKnot ******/
		/****** md5 signature: 159d96507482b523179fbba31b268f8b ******/
		%feature("compactdefaultargs") InsertUKnot;
		%feature("autodoc", "
Parameters
----------
U: float
M: int
ParametricTolerance: float
Add: bool (optional, default to Standard_True)

Return
-------
None

Description
-----------
Inserts a knot value in the sequence of UKnots. If U is a knot value this method increases the multiplicity of the knot if the previous multiplicity was lower than M else it does nothing. The tolerance criterion is ParametricTolerance. ParametricTolerance should be greater or equal than Resolution from package gp. //! Raised if U is out of the bounds [U1, U2] given by the methods Bounds, the criterion ParametricTolerance is used. Raised if M is not in the range [1, UDegree].
") InsertUKnot;
		void InsertUKnot(const Standard_Real U, const Standard_Integer M, const Standard_Real ParametricTolerance, const Standard_Boolean Add = Standard_True);

		/****** Geom_BSplineSurface::InsertUKnots ******/
		/****** md5 signature: e7acce1e38ade8afc325615dffddde74 ******/
		%feature("compactdefaultargs") InsertUKnots;
		%feature("autodoc", "
Parameters
----------
Knots: TColStd_Array1OfReal
Mults: TColStd_Array1OfInteger
ParametricTolerance: float (optional, default to 0.0)
Add: bool (optional, default to Standard_True)

Return
-------
None

Description
-----------
Inserts into the knots table for the U parametric direction of this BSpline surface: - the values of the array Knots, with their respective multiplicities, Mults. If the knot value to insert already exists in the table, its multiplicity is: - increased by M, if Add is true (the default), or - increased to M, if Add is false. The tolerance criterion used to check the equality of the knots is the larger of the values ParametricTolerance and Standard_Real::Epsilon(val), where val is the knot value to be inserted. Warning - If a given multiplicity coefficient is null, or negative, nothing is done. - The new multiplicity of a knot is limited to the degree of this BSpline surface in the corresponding parametric direction. Exceptions Standard_ConstructionError if a knot value to insert is outside the bounds of this BSpline surface in the specified parametric direction. The comparison uses the precision criterion ParametricTolerance.
") InsertUKnots;
		void InsertUKnots(const TColStd_Array1OfReal & Knots, const TColStd_Array1OfInteger & Mults, const Standard_Real ParametricTolerance = 0.0, const Standard_Boolean Add = Standard_True);

		/****** Geom_BSplineSurface::InsertVKnot ******/
		/****** md5 signature: bcd411440e0545abbba69eee2f586c0c ******/
		%feature("compactdefaultargs") InsertVKnot;
		%feature("autodoc", "
Parameters
----------
V: float
M: int
ParametricTolerance: float
Add: bool (optional, default to Standard_True)

Return
-------
None

Description
-----------
Inserts a knot value in the sequence of VKnots. If V is a knot value this method increases the multiplicity of the knot if the previous multiplicity was lower than M otherwise it does nothing. The tolerance criterion is ParametricTolerance. ParametricTolerance should be greater or equal than Resolution from package gp. //! raises if V is out of the Bounds [V1, V2] given by the methods Bounds, the criterion ParametricTolerance is used. raises if M is not in the range [1, VDegree].
") InsertVKnot;
		void InsertVKnot(const Standard_Real V, const Standard_Integer M, const Standard_Real ParametricTolerance, const Standard_Boolean Add = Standard_True);

		/****** Geom_BSplineSurface::InsertVKnots ******/
		/****** md5 signature: 1073cf49364a966c64a7793cfa15cd30 ******/
		%feature("compactdefaultargs") InsertVKnots;
		%feature("autodoc", "
Parameters
----------
Knots: TColStd_Array1OfReal
Mults: TColStd_Array1OfInteger
ParametricTolerance: float (optional, default to 0.0)
Add: bool (optional, default to Standard_True)

Return
-------
None

Description
-----------
Inserts into the knots table for the V parametric direction of this BSpline surface: - the values of the array Knots, with their respective multiplicities, Mults. If the knot value to insert already exists in the table, its multiplicity is: - increased by M, if Add is true (the default), or - increased to M, if Add is false. The tolerance criterion used to check the equality of the knots is the larger of the values ParametricTolerance and Standard_Real::Epsilon(val), where val is the knot value to be inserted. Warning - If a given multiplicity coefficient is null, or negative, nothing is done. - The new multiplicity of a knot is limited to the degree of this BSpline surface in the corresponding parametric direction. Exceptions Standard_ConstructionError if a knot value to insert is outside the bounds of this BSpline surface in the specified parametric direction. The comparison uses the precision criterion ParametricTolerance.
") InsertVKnots;
		void InsertVKnots(const TColStd_Array1OfReal & Knots, const TColStd_Array1OfInteger & Mults, const Standard_Real ParametricTolerance = 0.0, const Standard_Boolean Add = Standard_True);

		/****** Geom_BSplineSurface::IsCNu ******/
		/****** md5 signature: c9f9f7f6eb82d83e9ba43e721cffba8a ******/
		%feature("compactdefaultargs") IsCNu;
		%feature("autodoc", "
Parameters
----------
N: int

Return
-------
bool

Description
-----------
Returns True if the order of continuity of the surface in the U direction is N. Raised if N < 0.
") IsCNu;
		Standard_Boolean IsCNu(const Standard_Integer N);

		/****** Geom_BSplineSurface::IsCNv ******/
		/****** md5 signature: 0acb88d1ffd7eea46785f30d7fc5f85e ******/
		%feature("compactdefaultargs") IsCNv;
		%feature("autodoc", "
Parameters
----------
N: int

Return
-------
bool

Description
-----------
Returns True if the order of continuity of the surface in the V direction is N. Raised if N < 0.
") IsCNv;
		Standard_Boolean IsCNv(const Standard_Integer N);

		/****** Geom_BSplineSurface::IsUClosed ******/
		/****** md5 signature: d1e8bae29b90dc447f4693c94ad31c37 ******/
		%feature("compactdefaultargs") IsUClosed;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if the first control points row and the last control points row are identical. The tolerance criterion is Resolution from package gp.
") IsUClosed;
		Standard_Boolean IsUClosed();

		/****** Geom_BSplineSurface::IsUPeriodic ******/
		/****** md5 signature: 91acb028d6850ac4bbf00dc198b558b7 ******/
		%feature("compactdefaultargs") IsUPeriodic;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if the surface is closed in the U direction and if the B-spline has been turned into a periodic surface using the function SetUPeriodic.
") IsUPeriodic;
		Standard_Boolean IsUPeriodic();

		/****** Geom_BSplineSurface::IsURational ******/
		/****** md5 signature: d3be4b63bc17a9c6de48bb978a5cf0e7 ******/
		%feature("compactdefaultargs") IsURational;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns False if for each row of weights all the weights are identical. The tolerance criterion is resolution from package gp. Example: |1.0, 1.0, 1.0| if Weights = |0.5, 0.5, 0.5| returns False |2.0, 2.0, 2.0|.
") IsURational;
		Standard_Boolean IsURational();

		/****** Geom_BSplineSurface::IsVClosed ******/
		/****** md5 signature: aa0eae8155ddef3e9f1d0cc573955bb6 ******/
		%feature("compactdefaultargs") IsVClosed;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if the first control points column and the last last control points column are identical. The tolerance criterion is Resolution from package gp.
") IsVClosed;
		Standard_Boolean IsVClosed();

		/****** Geom_BSplineSurface::IsVPeriodic ******/
		/****** md5 signature: 88e9b94f2ab4a3d73c3fe787315e4448 ******/
		%feature("compactdefaultargs") IsVPeriodic;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if the surface is closed in the V direction and if the B-spline has been turned into a periodic surface using the function SetVPeriodic.
") IsVPeriodic;
		Standard_Boolean IsVPeriodic();

		/****** Geom_BSplineSurface::IsVRational ******/
		/****** md5 signature: dcc1c1ae4603545d87819084535899bc ******/
		%feature("compactdefaultargs") IsVRational;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns False if for each column of weights all the weights are identical. The tolerance criterion is resolution from package gp. Examples: |1.0, 2.0, 0.5| if Weights = |1.0, 2.0, 0.5| returns False |1.0, 2.0, 0.5|.
") IsVRational;
		Standard_Boolean IsVRational();

		/****** Geom_BSplineSurface::LastUKnotIndex ******/
		/****** md5 signature: b5183e855ac73e665e20fe9cd9a25fef ******/
		%feature("compactdefaultargs") LastUKnotIndex;
		%feature("autodoc", "Return
-------
int

Description
-----------
Computes the Index of the UKnots which gives the last parametric value of the surface in the U direction. The UIso curve corresponding to this knot is a boundary curve of the surface.
") LastUKnotIndex;
		Standard_Integer LastUKnotIndex();

		/****** Geom_BSplineSurface::LastVKnotIndex ******/
		/****** md5 signature: def5df58d1554a5891cc82afbddd40bc ******/
		%feature("compactdefaultargs") LastVKnotIndex;
		%feature("autodoc", "Return
-------
int

Description
-----------
Computes the Index of the VKnots which gives the last parametric value of the surface in the V direction. The VIso curve corresponding to this knot is a boundary curve of the surface.
") LastVKnotIndex;
		Standard_Integer LastVKnotIndex();

		/****** Geom_BSplineSurface::LocalD0 ******/
		/****** md5 signature: 90582eea4db1eff768df386d583eb11c ******/
		%feature("compactdefaultargs") LocalD0;
		%feature("autodoc", "
Parameters
----------
U: float
V: float
FromUK1: int
ToUK2: int
FromVK1: int
ToVK2: int
P: gp_Pnt

Return
-------
None

Description
-----------
Raised if FromUK1 = ToUK2 or FromVK1 = ToVK2.
") LocalD0;
		void LocalD0(const Standard_Real U, const Standard_Real V, const Standard_Integer FromUK1, const Standard_Integer ToUK2, const Standard_Integer FromVK1, const Standard_Integer ToVK2, gp_Pnt & P);

		/****** Geom_BSplineSurface::LocalD1 ******/
		/****** md5 signature: 116c10fb1a5973b110226a32d68d2b77 ******/
		%feature("compactdefaultargs") LocalD1;
		%feature("autodoc", "
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

Return
-------
None

Description
-----------
Raised if the local continuity of the surface is not C1 between the knots FromUK1, ToUK2 and FromVK1, ToVK2. Raised if FromUK1 = ToUK2 or FromVK1 = ToVK2.
") LocalD1;
		void LocalD1(const Standard_Real U, const Standard_Real V, const Standard_Integer FromUK1, const Standard_Integer ToUK2, const Standard_Integer FromVK1, const Standard_Integer ToVK2, gp_Pnt & P, gp_Vec & D1U, gp_Vec & D1V);

		/****** Geom_BSplineSurface::LocalD2 ******/
		/****** md5 signature: adf6d11394af32c7676d493bfb1deb60 ******/
		%feature("compactdefaultargs") LocalD2;
		%feature("autodoc", "
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

Return
-------
None

Description
-----------
Raised if the local continuity of the surface is not C2 between the knots FromUK1, ToUK2 and FromVK1, ToVK2. Raised if FromUK1 = ToUK2 or FromVK1 = ToVK2.
") LocalD2;
		void LocalD2(const Standard_Real U, const Standard_Real V, const Standard_Integer FromUK1, const Standard_Integer ToUK2, const Standard_Integer FromVK1, const Standard_Integer ToVK2, gp_Pnt & P, gp_Vec & D1U, gp_Vec & D1V, gp_Vec & D2U, gp_Vec & D2V, gp_Vec & D2UV);

		/****** Geom_BSplineSurface::LocalD3 ******/
		/****** md5 signature: 147fb4a3d611ca3bcc190498316af4e1 ******/
		%feature("compactdefaultargs") LocalD3;
		%feature("autodoc", "
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

Return
-------
None

Description
-----------
Raised if the local continuity of the surface is not C3 between the knots FromUK1, ToUK2 and FromVK1, ToVK2. Raised if FromUK1 = ToUK2 or FromVK1 = ToVK2.
") LocalD3;
		void LocalD3(const Standard_Real U, const Standard_Real V, const Standard_Integer FromUK1, const Standard_Integer ToUK2, const Standard_Integer FromVK1, const Standard_Integer ToVK2, gp_Pnt & P, gp_Vec & D1U, gp_Vec & D1V, gp_Vec & D2U, gp_Vec & D2V, gp_Vec & D2UV, gp_Vec & D3U, gp_Vec & D3V, gp_Vec & D3UUV, gp_Vec & D3UVV);

		/****** Geom_BSplineSurface::LocalDN ******/
		/****** md5 signature: 948da59e73692d79e0499f1ec5f253d0 ******/
		%feature("compactdefaultargs") LocalDN;
		%feature("autodoc", "
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

Return
-------
gp_Vec

Description
-----------
Raised if the local continuity of the surface is not CNu between the knots FromUK1, ToUK2 and CNv between the knots FromVK1, ToVK2. Raised if FromUK1 = ToUK2 or FromVK1 = ToVK2.
") LocalDN;
		gp_Vec LocalDN(const Standard_Real U, const Standard_Real V, const Standard_Integer FromUK1, const Standard_Integer ToUK2, const Standard_Integer FromVK1, const Standard_Integer ToVK2, const Standard_Integer Nu, const Standard_Integer Nv);

		/****** Geom_BSplineSurface::LocalValue ******/
		/****** md5 signature: 2c3bbf44dc57ab1d1015d4fe52ecbf0c ******/
		%feature("compactdefaultargs") LocalValue;
		%feature("autodoc", "
Parameters
----------
U: float
V: float
FromUK1: int
ToUK2: int
FromVK1: int
ToVK2: int

Return
-------
gp_Pnt

Description
-----------
Computes the point of parameter U, V on the BSpline surface patch defines between the knots UK1 UK2, VK1, VK2. U can be out of the bounds [Knot UK1, Knot UK2] and V can be outof the bounds [Knot VK1, Knot VK2] but for the computation we only use the definition of the surface between these knot values. Raises if FromUK1 = ToUK2 or FromVK1 = ToVK2.
") LocalValue;
		gp_Pnt LocalValue(const Standard_Real U, const Standard_Real V, const Standard_Integer FromUK1, const Standard_Integer ToUK2, const Standard_Integer FromVK1, const Standard_Integer ToVK2);

		/****** Geom_BSplineSurface::LocateU ******/
		/****** md5 signature: d536ddd65ca3edfb5dd75e59f7417959 ******/
		%feature("compactdefaultargs") LocateU;
		%feature("autodoc", "
Parameters
----------
U: float
ParametricTolerance: float
WithKnotRepetition: bool (optional, default to Standard_False)

Return
-------
I1: int
I2: int

Description
-----------
Locates the parametric value U in the sequence of UKnots. If 'WithKnotRepetition' is True we consider the knot's representation with repetition of multiple knot value, otherwise we consider the knot's representation with no repetition of multiple knot values. UKnots (I1) <= U <= UKnots (I2) . if I1 = I2 U is a knot value (the tolerance criterion ParametricTolerance is used). . if I1 < 1 => U < UKnots(1) - Abs(ParametricTolerance) . if I2 > NbUKnots => U > UKnots(NbUKnots)+Abs(ParametricTolerance).
") LocateU;
		void LocateU(const Standard_Real U, const Standard_Real ParametricTolerance, Standard_Integer &OutValue, Standard_Integer &OutValue, const Standard_Boolean WithKnotRepetition = Standard_False);

		/****** Geom_BSplineSurface::LocateV ******/
		/****** md5 signature: be5529d72fc5185e944cc4b64dff67d7 ******/
		%feature("compactdefaultargs") LocateV;
		%feature("autodoc", "
Parameters
----------
V: float
ParametricTolerance: float
WithKnotRepetition: bool (optional, default to Standard_False)

Return
-------
I1: int
I2: int

Description
-----------
Locates the parametric value V in the sequence of knots. If 'WithKnotRepetition' is True we consider the knot's representation with repetition of multiple knot value, otherwise we consider the knot's representation with no repetition of multiple knot values. VKnots (I1) <= V <= VKnots (I2) . if I1 = I2 V is a knot value (the tolerance criterion ParametricTolerance is used). . if I1 < 1 => V < VKnots(1) - Abs(ParametricTolerance) . if I2 > NbVKnots => V > VKnots(NbVKnots)+Abs(ParametricTolerance) poles insertion and removing The following methods are available only if the surface is Uniform or QuasiUniform in the considered direction The knot repartition is modified.
") LocateV;
		void LocateV(const Standard_Real V, const Standard_Real ParametricTolerance, Standard_Integer &OutValue, Standard_Integer &OutValue, const Standard_Boolean WithKnotRepetition = Standard_False);

		/****** Geom_BSplineSurface::MaxDegree ******/
		/****** md5 signature: 985314a0ed62b597a9bdf0f555b97bed ******/
		%feature("compactdefaultargs") MaxDegree;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the value of the maximum degree of the normalized B-spline basis functions in the u and v directions.
") MaxDegree;
		static Standard_Integer MaxDegree();

		/****** Geom_BSplineSurface::MovePoint ******/
		/****** md5 signature: 38420f7602e5315b227fe46280e42e38 ******/
		%feature("compactdefaultargs") MovePoint;
		%feature("autodoc", "
Parameters
----------
U: float
V: float
P: gp_Pnt
UIndex1: int
UIndex2: int
VIndex1: int
VIndex2: int

Return
-------
UFirstIndex: int
ULastIndex: int
VFirstIndex: int
VLastIndex: int

Description
-----------
Move a point with parameter U and V to P. given u,v as parameters) to reach a new position UIndex1, UIndex2, VIndex1, VIndex2: indicates the poles which can be moved if Problem in BSplineBasis calculation, no change for the curve and UFirstIndex, VLastIndex = 0 VFirstIndex, VLastIndex = 0 //! Raised if UIndex1 < UIndex2 or VIndex1 < VIndex2 or UIndex1 < 1 || UIndex1 > NbUPoles or UIndex2 < 1 || UIndex2 > NbUPoles VIndex1 < 1 || VIndex1 > NbVPoles or VIndex2 < 1 || VIndex2 > NbVPoles characteristics of the surface.
") MovePoint;
		void MovePoint(const Standard_Real U, const Standard_Real V, const gp_Pnt & P, const Standard_Integer UIndex1, const Standard_Integer UIndex2, const Standard_Integer VIndex1, const Standard_Integer VIndex2, Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue);

		/****** Geom_BSplineSurface::NbUKnots ******/
		/****** md5 signature: dad62b27d386c8d79ed8a3faddece815 ******/
		%feature("compactdefaultargs") NbUKnots;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of knots in the U direction.
") NbUKnots;
		Standard_Integer NbUKnots();

		/****** Geom_BSplineSurface::NbUPoles ******/
		/****** md5 signature: fb7c625af5aeee8be8cffdd28f1b08d5 ******/
		%feature("compactdefaultargs") NbUPoles;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns number of poles in the U direction.
") NbUPoles;
		Standard_Integer NbUPoles();

		/****** Geom_BSplineSurface::NbVKnots ******/
		/****** md5 signature: c5483500ef062c3949009d9a2ec75b29 ******/
		%feature("compactdefaultargs") NbVKnots;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of knots in the V direction.
") NbVKnots;
		Standard_Integer NbVKnots();

		/****** Geom_BSplineSurface::NbVPoles ******/
		/****** md5 signature: 098754ae7893287e442d0a3c48b39cf0 ******/
		%feature("compactdefaultargs") NbVPoles;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of poles in the V direction.
") NbVPoles;
		Standard_Integer NbVPoles();

		/****** Geom_BSplineSurface::PeriodicNormalization ******/
		/****** md5 signature: 0a3e623e55f06f9f39c798f12e70177c ******/
		%feature("compactdefaultargs") PeriodicNormalization;
		%feature("autodoc", "
Parameters
----------

Return
-------
U: float
V: float

Description
-----------
returns the parameter normalized within the period if the surface is periodic: otherwise does not do anything.
") PeriodicNormalization;
		void PeriodicNormalization(Standard_Real &OutValue, Standard_Real &OutValue);

		/****** Geom_BSplineSurface::Pole ******/
		/****** md5 signature: ff2d8ec1af0c36c07e8626aeeac8ea5a ******/
		%feature("compactdefaultargs") Pole;
		%feature("autodoc", "
Parameters
----------
UIndex: int
VIndex: int

Return
-------
gp_Pnt

Description
-----------
Returns the pole of range (UIndex, VIndex). //! Raised if UIndex < 1 or UIndex > NbUPoles or VIndex < 1 or VIndex > NbVPoles.
") Pole;
		const gp_Pnt Pole(const Standard_Integer UIndex, const Standard_Integer VIndex);

		/****** Geom_BSplineSurface::Poles ******/
		/****** md5 signature: 13f89ef9fb8304ab9a388808727297da ******/
		%feature("compactdefaultargs") Poles;
		%feature("autodoc", "
Parameters
----------
P: TColgp_Array2OfPnt

Return
-------
None

Description
-----------
Returns the poles of the B-spline surface. //! Raised if the length of P in the U and V direction is not equal to NbUpoles and NbVPoles.
") Poles;
		void Poles(TColgp_Array2OfPnt & P);

		/****** Geom_BSplineSurface::Poles ******/
		/****** md5 signature: 8549a39bf10f707b8ef3f52012972a89 ******/
		%feature("compactdefaultargs") Poles;
		%feature("autodoc", "Return
-------
TColgp_Array2OfPnt

Description
-----------
Returns the poles of the B-spline surface.
") Poles;
		const TColgp_Array2OfPnt & Poles();

		/****** Geom_BSplineSurface::RemoveUKnot ******/
		/****** md5 signature: 3c1c28077acf2faff1bf5fe31f38c1e2 ******/
		%feature("compactdefaultargs") RemoveUKnot;
		%feature("autodoc", "
Parameters
----------
Index: int
M: int
Tolerance: float

Return
-------
bool

Description
-----------
Reduces to M the multiplicity of the knot of index Index in the U parametric direction. If M is 0, the knot is removed. With a modification of this type, the table of poles is also modified. Two different algorithms are used systematically to compute the new poles of the surface. For each pole, the distance between the pole calculated using the first algorithm and the same pole calculated using the second algorithm, is checked. If this distance is less than Tolerance it ensures that the surface is not modified by more than Tolerance. Under these conditions, the function returns true; otherwise, it returns false. A low tolerance prevents modification of the surface. A high tolerance 'smoothes' the surface. Exceptions Standard_OutOfRange if Index is outside the bounds of the knots table of this BSpline surface.
") RemoveUKnot;
		Standard_Boolean RemoveUKnot(const Standard_Integer Index, const Standard_Integer M, const Standard_Real Tolerance);

		/****** Geom_BSplineSurface::RemoveVKnot ******/
		/****** md5 signature: 85514d1299f04725520a8160843d4e16 ******/
		%feature("compactdefaultargs") RemoveVKnot;
		%feature("autodoc", "
Parameters
----------
Index: int
M: int
Tolerance: float

Return
-------
bool

Description
-----------
Reduces to M the multiplicity of the knot of index Index in the V parametric direction. If M is 0, the knot is removed. With a modification of this type, the table of poles is also modified. Two different algorithms are used systematically to compute the new poles of the surface. For each pole, the distance between the pole calculated using the first algorithm and the same pole calculated using the second algorithm, is checked. If this distance is less than Tolerance it ensures that the surface is not modified by more than Tolerance. Under these conditions, the function returns true; otherwise, it returns false. A low tolerance prevents modification of the surface. A high tolerance 'smoothes' the surface. Exceptions Standard_OutOfRange if Index is outside the bounds of the knots table of this BSpline surface.
") RemoveVKnot;
		Standard_Boolean RemoveVKnot(const Standard_Integer Index, const Standard_Integer M, const Standard_Real Tolerance);

		/****** Geom_BSplineSurface::Resolution ******/
		/****** md5 signature: f550ea5c1bc2e29d0800724fa69c6ce9 ******/
		%feature("compactdefaultargs") Resolution;
		%feature("autodoc", "
Parameters
----------
Tolerance3D: float

Return
-------
UTolerance: float
VTolerance: float

Description
-----------
Computes two tolerance values for this BSpline surface, based on the given tolerance in 3D space Tolerance3D. The tolerances computed are: - UTolerance in the u parametric direction, and - VTolerance in the v parametric direction. If f(u,v) is the equation of this BSpline surface, UTolerance and VTolerance guarantee that: | u1 - u0 | < UTolerance and | v1 - v0 | < VTolerance ====> |f (u1,v1) - f (u0,v0)| < Tolerance3D.
") Resolution;
		void Resolution(const Standard_Real Tolerance3D, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** Geom_BSplineSurface::Segment ******/
		/****** md5 signature: fd76d320a01952f2645e752c81f84bc9 ******/
		%feature("compactdefaultargs") Segment;
		%feature("autodoc", "
Parameters
----------
U1: float
U2: float
V1: float
V2: float
theUTolerance: float (optional, default to Precision::PConfusion())
theVTolerance: float (optional, default to Precision::PConfusion())

Return
-------
None

Description
-----------
Segments the surface between U1 and U2 in the U-Direction. between V1 and V2 in the V-Direction. The control points are modified, the first and the last point are not the same. //! Parameters theUTolerance, theVTolerance define the possible proximity along the corresponding direction of the segment boundaries and B-spline knots to treat them as equal. //! Warnings: Even if <self> is not closed it can become closed after the segmentation for example if U1 or U2 are out of the bounds of the surface <self> or if the surface makes loop. raises if U2 < U1 or V2 < V1. Standard_DomainError if U2 - U1 exceeds the uperiod for uperiodic surfaces. i.e. ((U2 - U1) - UPeriod) > Precision::PConfusion(). Standard_DomainError if V2 - V1 exceeds the vperiod for vperiodic surfaces. i.e. ((V2 - V1) - VPeriod) > Precision::PConfusion()).
") Segment;
		void Segment(const Standard_Real U1, const Standard_Real U2, const Standard_Real V1, const Standard_Real V2, const Standard_Real theUTolerance = Precision::PConfusion(), const Standard_Real theVTolerance = Precision::PConfusion());

		/****** Geom_BSplineSurface::SetPole ******/
		/****** md5 signature: 7626021decdd1633f78d695c98c81907 ******/
		%feature("compactdefaultargs") SetPole;
		%feature("autodoc", "
Parameters
----------
UIndex: int
VIndex: int
P: gp_Pnt

Return
-------
None

Description
-----------
Substitutes the pole of range (UIndex, VIndex) with P. If the surface is rational the weight of range (UIndex, VIndex) is not modified. //! Raised if UIndex < 1 or UIndex > NbUPoles or VIndex < 1 or VIndex > NbVPoles.
") SetPole;
		void SetPole(const Standard_Integer UIndex, const Standard_Integer VIndex, const gp_Pnt & P);

		/****** Geom_BSplineSurface::SetPole ******/
		/****** md5 signature: ddaccd4b5c1880bee0dcb58b2720ffc1 ******/
		%feature("compactdefaultargs") SetPole;
		%feature("autodoc", "
Parameters
----------
UIndex: int
VIndex: int
P: gp_Pnt
Weight: float

Return
-------
None

Description
-----------
Substitutes the pole and the weight of range (UIndex, VIndex) with P and W. //! Raised if UIndex < 1 or UIndex > NbUPoles or VIndex < 1 or VIndex > NbVPoles. Raised if Weight <= Resolution from package gp.
") SetPole;
		void SetPole(const Standard_Integer UIndex, const Standard_Integer VIndex, const gp_Pnt & P, const Standard_Real Weight);

		/****** Geom_BSplineSurface::SetPoleCol ******/
		/****** md5 signature: b487d5aaa1aef838201a8aba83188f5e ******/
		%feature("compactdefaultargs") SetPoleCol;
		%feature("autodoc", "
Parameters
----------
VIndex: int
CPoles: TColgp_Array1OfPnt

Return
-------
None

Description
-----------
Changes a column of poles or a part of this column. Raised if Vindex < 1 or VIndex > NbVPoles. //! Raised if CPoles.Lower() < 1 or CPoles.Upper() > NbUPoles.
") SetPoleCol;
		void SetPoleCol(const Standard_Integer VIndex, const TColgp_Array1OfPnt & CPoles);

		/****** Geom_BSplineSurface::SetPoleCol ******/
		/****** md5 signature: d64560c21dd051f71154432933ab3740 ******/
		%feature("compactdefaultargs") SetPoleCol;
		%feature("autodoc", "
Parameters
----------
VIndex: int
CPoles: TColgp_Array1OfPnt
CPoleWeights: TColStd_Array1OfReal

Return
-------
None

Description
-----------
Changes a column of poles or a part of this column with the corresponding weights. If the surface was rational it can become non rational. If the surface was non rational it can become rational. Raised if Vindex < 1 or VIndex > NbVPoles. //! Raised if CPoles.Lower() < 1 or CPoles.Upper() > NbUPoles Raised if the bounds of CPoleWeights are not the same as the bounds of CPoles. Raised if one of the weight value of CPoleWeights is lower or equal to Resolution from package gp.
") SetPoleCol;
		void SetPoleCol(const Standard_Integer VIndex, const TColgp_Array1OfPnt & CPoles, const TColStd_Array1OfReal & CPoleWeights);

		/****** Geom_BSplineSurface::SetPoleRow ******/
		/****** md5 signature: 8b1783ae4e3ecbab3a746a8ae970da2f ******/
		%feature("compactdefaultargs") SetPoleRow;
		%feature("autodoc", "
Parameters
----------
UIndex: int
CPoles: TColgp_Array1OfPnt
CPoleWeights: TColStd_Array1OfReal

Return
-------
None

Description
-----------
Changes a row of poles or a part of this row with the corresponding weights. If the surface was rational it can become non rational. If the surface was non rational it can become rational. Raised if Uindex < 1 or UIndex > NbUPoles. //! Raised if CPoles.Lower() < 1 or CPoles.Upper() > NbVPoles raises if the bounds of CPoleWeights are not the same as the bounds of CPoles. Raised if one of the weight value of CPoleWeights is lower or equal to Resolution from package gp.
") SetPoleRow;
		void SetPoleRow(const Standard_Integer UIndex, const TColgp_Array1OfPnt & CPoles, const TColStd_Array1OfReal & CPoleWeights);

		/****** Geom_BSplineSurface::SetPoleRow ******/
		/****** md5 signature: 2174ec9de03976c55b3d4c714c979abc ******/
		%feature("compactdefaultargs") SetPoleRow;
		%feature("autodoc", "
Parameters
----------
UIndex: int
CPoles: TColgp_Array1OfPnt

Return
-------
None

Description
-----------
Changes a row of poles or a part of this row. Raised if Uindex < 1 or UIndex > NbUPoles. //! Raised if CPoles.Lower() < 1 or CPoles.Upper() > NbVPoles.
") SetPoleRow;
		void SetPoleRow(const Standard_Integer UIndex, const TColgp_Array1OfPnt & CPoles);

		/****** Geom_BSplineSurface::SetUKnot ******/
		/****** md5 signature: 845306343d5bfda3da28f055e2f226c1 ******/
		%feature("compactdefaultargs") SetUKnot;
		%feature("autodoc", "
Parameters
----------
UIndex: int
K: float

Return
-------
None

Description
-----------
Substitutes the UKnots of range UIndex with K. //! Raised if UIndex < 1 or UIndex > NbUKnots //! Raised if K >= UKnots(UIndex+1) or K <= UKnots(UIndex-1).
") SetUKnot;
		void SetUKnot(const Standard_Integer UIndex, const Standard_Real K);

		/****** Geom_BSplineSurface::SetUKnot ******/
		/****** md5 signature: f8a26e8f14f910f81e606b126cfefeaf ******/
		%feature("compactdefaultargs") SetUKnot;
		%feature("autodoc", "
Parameters
----------
UIndex: int
K: float
M: int

Return
-------
None

Description
-----------
Changes the value of the UKnots of range UIndex and increases its multiplicity. //! Raised if UIndex is not in the range [FirstUKnotIndex, LastUKnotIndex] given by the methods with the same name. //! Raised if K >= UKnots(UIndex+1) or K <= UKnots(UIndex-1) M must be lower than UDegree and greater than the previous multiplicity of the knot of range UIndex.
") SetUKnot;
		void SetUKnot(const Standard_Integer UIndex, const Standard_Real K, const Standard_Integer M);

		/****** Geom_BSplineSurface::SetUKnots ******/
		/****** md5 signature: 9d12566748977c7846f4a19e5778a7d2 ******/
		%feature("compactdefaultargs") SetUKnots;
		%feature("autodoc", "
Parameters
----------
UK: TColStd_Array1OfReal

Return
-------
None

Description
-----------
Changes all the U-knots of the surface. The multiplicity of the knots are not modified. //! Raised if there is an index such that UK (Index+1) <= UK (Index). //! Raised if UK.Lower() < 1 or UK.Upper() > NbUKnots.
") SetUKnots;
		void SetUKnots(const TColStd_Array1OfReal & UK);

		/****** Geom_BSplineSurface::SetUNotPeriodic ******/
		/****** md5 signature: 0c7c503e46c4002268ee61603e4110c5 ******/
		%feature("compactdefaultargs") SetUNotPeriodic;
		%feature("autodoc", "Return
-------
None

Description
-----------
Sets the surface U not periodic. Changes this BSpline surface into a non-periodic surface along U direction. If this surface is already non-periodic, it is not modified. Note: the poles and knots tables are modified.
") SetUNotPeriodic;
		void SetUNotPeriodic();

		/****** Geom_BSplineSurface::SetUOrigin ******/
		/****** md5 signature: 23ef2fe4aaf020d7c47d71261dd540ac ******/
		%feature("compactdefaultargs") SetUOrigin;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
None

Description
-----------
Assigns the knot of index Index in the knots table in the corresponding parametric direction to be the origin of this periodic BSpline surface. As a consequence, the knots and poles tables are modified. Exceptions Standard_NoSuchObject if this BSpline surface is not periodic in the given parametric direction. Standard_DomainError if Index is outside the bounds of the knots table in the given parametric direction.
") SetUOrigin;
		void SetUOrigin(const Standard_Integer Index);

		/****** Geom_BSplineSurface::SetUPeriodic ******/
		/****** md5 signature: 9fd613b3eac0305a90220f75c600a3ff ******/
		%feature("compactdefaultargs") SetUPeriodic;
		%feature("autodoc", "Return
-------
None

Description
-----------
Sets the surface U periodic. Modifies this surface to be periodic in the U parametric direction. To become periodic in a given parametric direction a surface must be closed in that parametric direction, and the knot sequence relative to that direction must be periodic. To generate this periodic sequence of knots, the functions FirstUKnotIndex and LastUKnotIndex are used to compute I1 and I2. These are the indexes, in the knot array associated with the given parametric direction, of the knots that correspond to the first and last parameters of this BSpline surface in the given parametric direction. Hence the period is: Knots(I1) - Knots(I2) As a result, the knots and poles tables are modified. Exceptions Standard_ConstructionError if the surface is not closed in the given parametric direction.
") SetUPeriodic;
		void SetUPeriodic();

		/****** Geom_BSplineSurface::SetVKnot ******/
		/****** md5 signature: 4e244b53c44e5a5291d9037bb3d65ce1 ******/
		%feature("compactdefaultargs") SetVKnot;
		%feature("autodoc", "
Parameters
----------
VIndex: int
K: float

Return
-------
None

Description
-----------
Substitutes the VKnots of range VIndex with K. //! Raised if VIndex < 1 or VIndex > NbVKnots //! Raised if K >= VKnots(VIndex+1) or K <= VKnots(VIndex-1).
") SetVKnot;
		void SetVKnot(const Standard_Integer VIndex, const Standard_Real K);

		/****** Geom_BSplineSurface::SetVKnot ******/
		/****** md5 signature: c07f5a612587ccc48c1ab6b7b6b1cabb ******/
		%feature("compactdefaultargs") SetVKnot;
		%feature("autodoc", "
Parameters
----------
VIndex: int
K: float
M: int

Return
-------
None

Description
-----------
Changes the value of the VKnots of range VIndex and increases its multiplicity. //! Raised if VIndex is not in the range [FirstVKnotIndex, LastVKnotIndex] given by the methods with the same name. //! Raised if K >= VKnots(VIndex+1) or K <= VKnots(VIndex-1) M must be lower than VDegree and greater than the previous multiplicity of the knot of range VIndex.
") SetVKnot;
		void SetVKnot(const Standard_Integer VIndex, const Standard_Real K, const Standard_Integer M);

		/****** Geom_BSplineSurface::SetVKnots ******/
		/****** md5 signature: fde74b904b1d78a8ce8ee5f37d96da75 ******/
		%feature("compactdefaultargs") SetVKnots;
		%feature("autodoc", "
Parameters
----------
VK: TColStd_Array1OfReal

Return
-------
None

Description
-----------
Changes all the V-knots of the surface. The multiplicity of the knots are not modified. //! Raised if there is an index such that VK (Index+1) <= VK (Index). //! Raised if VK.Lower() < 1 or VK.Upper() > NbVKnots.
") SetVKnots;
		void SetVKnots(const TColStd_Array1OfReal & VK);

		/****** Geom_BSplineSurface::SetVNotPeriodic ******/
		/****** md5 signature: da42223bbcd25fdcedfef03c261300b5 ******/
		%feature("compactdefaultargs") SetVNotPeriodic;
		%feature("autodoc", "Return
-------
None

Description
-----------
Sets the surface V not periodic. Changes this BSpline surface into a non-periodic surface along V direction. If this surface is already non-periodic, it is not modified. Note: the poles and knots tables are modified.
") SetVNotPeriodic;
		void SetVNotPeriodic();

		/****** Geom_BSplineSurface::SetVOrigin ******/
		/****** md5 signature: 6eefd3fca7f144d4992d1ffe6d769ad2 ******/
		%feature("compactdefaultargs") SetVOrigin;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
None

Description
-----------
Assigns the knot of index Index in the knots table in the corresponding parametric direction to be the origin of this periodic BSpline surface. As a consequence, the knots and poles tables are modified. Exceptions Standard_NoSuchObject if this BSpline surface is not periodic in the given parametric direction. Standard_DomainError if Index is outside the bounds of the knots table in the given parametric direction.
") SetVOrigin;
		void SetVOrigin(const Standard_Integer Index);

		/****** Geom_BSplineSurface::SetVPeriodic ******/
		/****** md5 signature: 1f94890b9cb288124aa1b039be07bd00 ******/
		%feature("compactdefaultargs") SetVPeriodic;
		%feature("autodoc", "Return
-------
None

Description
-----------
Sets the surface V periodic. Modifies this surface to be periodic in the V parametric direction. To become periodic in a given parametric direction a surface must be closed in that parametric direction, and the knot sequence relative to that direction must be periodic. To generate this periodic sequence of knots, the functions FirstVKnotIndex and LastVKnotIndex are used to compute I1 and I2. These are the indexes, in the knot array associated with the given parametric direction, of the knots that correspond to the first and last parameters of this BSpline surface in the given parametric direction. Hence the period is: Knots(I1) - Knots(I2) As a result, the knots and poles tables are modified. Exceptions Standard_ConstructionError if the surface is not closed in the given parametric direction.
") SetVPeriodic;
		void SetVPeriodic();

		/****** Geom_BSplineSurface::SetWeight ******/
		/****** md5 signature: a6c32aa43dac551c815b66f94dd1c53a ******/
		%feature("compactdefaultargs") SetWeight;
		%feature("autodoc", "
Parameters
----------
UIndex: int
VIndex: int
Weight: float

Return
-------
None

Description
-----------
Changes the weight of the pole of range UIndex, VIndex. If the surface was non rational it can become rational. If the surface was rational it can become non rational. //! Raised if UIndex < 1 or UIndex > NbUPoles or VIndex < 1 or VIndex > NbVPoles //! Raised if weight is lower or equal to Resolution from package gp.
") SetWeight;
		void SetWeight(const Standard_Integer UIndex, const Standard_Integer VIndex, const Standard_Real Weight);

		/****** Geom_BSplineSurface::SetWeightCol ******/
		/****** md5 signature: 234dcaf213f6c00246270b60b622de79 ******/
		%feature("compactdefaultargs") SetWeightCol;
		%feature("autodoc", "
Parameters
----------
VIndex: int
CPoleWeights: TColStd_Array1OfReal

Return
-------
None

Description
-----------
Changes a column of weights of a part of this column. //! Raised if VIndex < 1 or VIndex > NbVPoles //! Raised if CPoleWeights.Lower() < 1 or CPoleWeights.Upper() > NbUPoles. Raised if a weight value is lower or equal to Resolution from package gp.
") SetWeightCol;
		void SetWeightCol(const Standard_Integer VIndex, const TColStd_Array1OfReal & CPoleWeights);

		/****** Geom_BSplineSurface::SetWeightRow ******/
		/****** md5 signature: dc1d6ada2bbed4e33ef552c09c88f19d ******/
		%feature("compactdefaultargs") SetWeightRow;
		%feature("autodoc", "
Parameters
----------
UIndex: int
CPoleWeights: TColStd_Array1OfReal

Return
-------
None

Description
-----------
Changes a row of weights or a part of this row. //! Raised if UIndex < 1 or UIndex > NbUPoles //! Raised if CPoleWeights.Lower() < 1 or CPoleWeights.Upper() > NbVPoles. Raised if a weight value is lower or equal to Resolution from package gp.
") SetWeightRow;
		void SetWeightRow(const Standard_Integer UIndex, const TColStd_Array1OfReal & CPoleWeights);

		/****** Geom_BSplineSurface::Transform ******/
		/****** md5 signature: b643be97d129c62226d788cd0501ced0 ******/
		%feature("compactdefaultargs") Transform;
		%feature("autodoc", "
Parameters
----------
T: gp_Trsf

Return
-------
None

Description
-----------
Applies the transformation T to this BSpline surface.
") Transform;
		void Transform(const gp_Trsf & T);

		/****** Geom_BSplineSurface::UDegree ******/
		/****** md5 signature: f204e5fbf1c49e3d9e4889dfead5a190 ******/
		%feature("compactdefaultargs") UDegree;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the degree of the normalized B-splines Ni,n in the U direction.
") UDegree;
		Standard_Integer UDegree();

		/****** Geom_BSplineSurface::UIso ******/
		/****** md5 signature: f5e8cbc22e32c38f4dd05caadff59fee ******/
		%feature("compactdefaultargs") UIso;
		%feature("autodoc", "
Parameters
----------
U: float

Return
-------
opencascade::handle<Geom_Curve>

Description
-----------
Computes the U isoparametric curve. A B-spline curve is returned.
") UIso;
		opencascade::handle<Geom_Curve> UIso(const Standard_Real U);

		/****** Geom_BSplineSurface::UIso ******/
		/****** md5 signature: 7cce444f1376c16f94e0b1e9b700f48a ******/
		%feature("compactdefaultargs") UIso;
		%feature("autodoc", "
Parameters
----------
U: float
CheckRational: bool

Return
-------
opencascade::handle<Geom_Curve>

Description
-----------
Computes the U isoparametric curve. If CheckRational=False, no try to make it non-rational. A B-spline curve is returned.
") UIso;
		opencascade::handle<Geom_Curve> UIso(const Standard_Real U, const Standard_Boolean CheckRational);

		/****** Geom_BSplineSurface::UKnot ******/
		/****** md5 signature: ea5353985fdf78f530adfdba4dac6b0b ******/
		%feature("compactdefaultargs") UKnot;
		%feature("autodoc", "
Parameters
----------
UIndex: int

Return
-------
float

Description
-----------
Returns the Knot value of range UIndex. Raised if UIndex < 1 or UIndex > NbUKnots.
") UKnot;
		Standard_Real UKnot(const Standard_Integer UIndex);

		/****** Geom_BSplineSurface::UKnotDistribution ******/
		/****** md5 signature: 2fc78c45c9aea809e270962378dd363c ******/
		%feature("compactdefaultargs") UKnotDistribution;
		%feature("autodoc", "Return
-------
GeomAbs_BSplKnotDistribution

Description
-----------
Returns NonUniform or Uniform or QuasiUniform or PiecewiseBezier. If all the knots differ by a positive constant from the preceding knot in the U direction the B-spline surface can be: - Uniform if all the knots are of multiplicity 1, - QuasiUniform if all the knots are of multiplicity 1 except for the first and last knot which are of multiplicity Degree + 1, - PiecewiseBezier if the first and last knots have multiplicity Degree + 1 and if interior knots have multiplicity Degree otherwise the surface is non uniform in the U direction The tolerance criterion is Resolution from package gp.
") UKnotDistribution;
		GeomAbs_BSplKnotDistribution UKnotDistribution();

		/****** Geom_BSplineSurface::UKnotSequence ******/
		/****** md5 signature: ffefc781eb9e61f0fa262a839bd822b2 ******/
		%feature("compactdefaultargs") UKnotSequence;
		%feature("autodoc", "
Parameters
----------
Ku: TColStd_Array1OfReal

Return
-------
None

Description
-----------
Returns the uknots sequence. In this sequence the knots with a multiplicity greater than 1 are repeated. Example: Ku = {k1, k1, k1, k2, k3, k3, k4, k4, k4} //! Raised if the length of Ku is not equal to NbUPoles + UDegree + 1.
") UKnotSequence;
		void UKnotSequence(TColStd_Array1OfReal & Ku);

		/****** Geom_BSplineSurface::UKnotSequence ******/
		/****** md5 signature: 9c08bbbe538cce85f3b5344af4253953 ******/
		%feature("compactdefaultargs") UKnotSequence;
		%feature("autodoc", "Return
-------
TColStd_Array1OfReal

Description
-----------
Returns the uknots sequence. In this sequence the knots with a multiplicity greater than 1 are repeated. Example: Ku = {k1, k1, k1, k2, k3, k3, k4, k4, k4}.
") UKnotSequence;
		const TColStd_Array1OfReal & UKnotSequence();

		/****** Geom_BSplineSurface::UKnots ******/
		/****** md5 signature: 74505cc9e15944eba0c72af5df136b4c ******/
		%feature("compactdefaultargs") UKnots;
		%feature("autodoc", "
Parameters
----------
Ku: TColStd_Array1OfReal

Return
-------
None

Description
-----------
Returns the knots in the U direction. //! Raised if the length of Ku is not equal to the number of knots in the U direction.
") UKnots;
		void UKnots(TColStd_Array1OfReal & Ku);

		/****** Geom_BSplineSurface::UKnots ******/
		/****** md5 signature: e600039b7e20985058138f77feba6fe0 ******/
		%feature("compactdefaultargs") UKnots;
		%feature("autodoc", "Return
-------
TColStd_Array1OfReal

Description
-----------
Returns the knots in the U direction.
") UKnots;
		const TColStd_Array1OfReal & UKnots();

		/****** Geom_BSplineSurface::UMultiplicities ******/
		/****** md5 signature: cf043bb9d8146195a2d72f075029ed41 ******/
		%feature("compactdefaultargs") UMultiplicities;
		%feature("autodoc", "
Parameters
----------
Mu: TColStd_Array1OfInteger

Return
-------
None

Description
-----------
Returns the multiplicities of the knots in the U direction. //! Raised if the length of Mu is not equal to the number of knots in the U direction.
") UMultiplicities;
		void UMultiplicities(TColStd_Array1OfInteger & Mu);

		/****** Geom_BSplineSurface::UMultiplicities ******/
		/****** md5 signature: e83f5ba93b5b062c75fba51c3acc7d8e ******/
		%feature("compactdefaultargs") UMultiplicities;
		%feature("autodoc", "Return
-------
TColStd_Array1OfInteger

Description
-----------
Returns the multiplicities of the knots in the U direction.
") UMultiplicities;
		const TColStd_Array1OfInteger & UMultiplicities();

		/****** Geom_BSplineSurface::UMultiplicity ******/
		/****** md5 signature: dad23f162889ff220e8176306861eaa1 ******/
		%feature("compactdefaultargs") UMultiplicity;
		%feature("autodoc", "
Parameters
----------
UIndex: int

Return
-------
int

Description
-----------
Returns the multiplicity value of knot of range UIndex in the u direction. Raised if UIndex < 1 or UIndex > NbUKnots.
") UMultiplicity;
		Standard_Integer UMultiplicity(const Standard_Integer UIndex);

		/****** Geom_BSplineSurface::UReverse ******/
		/****** md5 signature: 31a376207d6b3f3c82d0cde57034e1f2 ******/
		%feature("compactdefaultargs") UReverse;
		%feature("autodoc", "Return
-------
None

Description
-----------
Changes the orientation of this BSpline surface in the U parametric direction. The bounds of the surface are not changed but the given parametric direction is reversed. Hence the orientation of the surface is reversed. The knots and poles tables are modified.
") UReverse;
		void UReverse();

		/****** Geom_BSplineSurface::UReversedParameter ******/
		/****** md5 signature: 0071925b176316f0aaaf26f369ac410c ******/
		%feature("compactdefaultargs") UReversedParameter;
		%feature("autodoc", "
Parameters
----------
U: float

Return
-------
float

Description
-----------
Computes the u parameter on the modified surface, produced by reversing its U parametric direction, for the point of u parameter U, on this BSpline surface. For a BSpline surface, these functions return respectively: - UFirst + ULast - U, where UFirst, ULast are the values of the first and last parameters of this BSpline surface, in the u parametric directions.
") UReversedParameter;
		Standard_Real UReversedParameter(const Standard_Real U);

		/****** Geom_BSplineSurface::VDegree ******/
		/****** md5 signature: 4901bdb3b29a5c2410ca93d6a7816f06 ******/
		%feature("compactdefaultargs") VDegree;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the degree of the normalized B-splines Ni,d in the V direction.
") VDegree;
		Standard_Integer VDegree();

		/****** Geom_BSplineSurface::VIso ******/
		/****** md5 signature: ef8726fc193d6cf33f54c94b9ed952a5 ******/
		%feature("compactdefaultargs") VIso;
		%feature("autodoc", "
Parameters
----------
V: float

Return
-------
opencascade::handle<Geom_Curve>

Description
-----------
Computes the V isoparametric curve. A B-spline curve is returned.
") VIso;
		opencascade::handle<Geom_Curve> VIso(const Standard_Real V);

		/****** Geom_BSplineSurface::VIso ******/
		/****** md5 signature: fc6b3d4095cfce94274b6d401aaae02f ******/
		%feature("compactdefaultargs") VIso;
		%feature("autodoc", "
Parameters
----------
V: float
CheckRational: bool

Return
-------
opencascade::handle<Geom_Curve>

Description
-----------
Computes the V isoparametric curve. If CheckRational=False, no try to make it non-rational. A B-spline curve is returned. transformations.
") VIso;
		opencascade::handle<Geom_Curve> VIso(const Standard_Real V, const Standard_Boolean CheckRational);

		/****** Geom_BSplineSurface::VKnot ******/
		/****** md5 signature: a0608310ec00728bb71733055be08e33 ******/
		%feature("compactdefaultargs") VKnot;
		%feature("autodoc", "
Parameters
----------
VIndex: int

Return
-------
float

Description
-----------
Returns the Knot value of range VIndex. Raised if VIndex < 1 or VIndex > NbVKnots.
") VKnot;
		Standard_Real VKnot(const Standard_Integer VIndex);

		/****** Geom_BSplineSurface::VKnotDistribution ******/
		/****** md5 signature: 37243a8c428a8788b1ed2d20f1deb712 ******/
		%feature("compactdefaultargs") VKnotDistribution;
		%feature("autodoc", "Return
-------
GeomAbs_BSplKnotDistribution

Description
-----------
Returns NonUniform or Uniform or QuasiUniform or PiecewiseBezier. If all the knots differ by a positive constant from the preceding knot in the V direction the B-spline surface can be: - Uniform if all the knots are of multiplicity 1, - QuasiUniform if all the knots are of multiplicity 1 except for the first and last knot which are of multiplicity Degree + 1, - PiecewiseBezier if the first and last knots have multiplicity Degree + 1 and if interior knots have multiplicity Degree otherwise the surface is non uniform in the V direction. The tolerance criterion is Resolution from package gp.
") VKnotDistribution;
		GeomAbs_BSplKnotDistribution VKnotDistribution();

		/****** Geom_BSplineSurface::VKnotSequence ******/
		/****** md5 signature: 9f3f351d744aca31a83fc1669d89f1b1 ******/
		%feature("compactdefaultargs") VKnotSequence;
		%feature("autodoc", "
Parameters
----------
Kv: TColStd_Array1OfReal

Return
-------
None

Description
-----------
Returns the vknots sequence. In this sequence the knots with a multiplicity greater than 1 are repeated. Example: Kv = {k1, k1, k1, k2, k3, k3, k4, k4, k4} //! Raised if the length of Kv is not equal to NbVPoles + VDegree + 1.
") VKnotSequence;
		void VKnotSequence(TColStd_Array1OfReal & Kv);

		/****** Geom_BSplineSurface::VKnotSequence ******/
		/****** md5 signature: 6a165f095b8367bee175e8be8feab317 ******/
		%feature("compactdefaultargs") VKnotSequence;
		%feature("autodoc", "Return
-------
TColStd_Array1OfReal

Description
-----------
Returns the vknots sequence. In this sequence the knots with a multiplicity greater than 1 are repeated. Example: Ku = {k1, k1, k1, k2, k3, k3, k4, k4, k4}.
") VKnotSequence;
		const TColStd_Array1OfReal & VKnotSequence();

		/****** Geom_BSplineSurface::VKnots ******/
		/****** md5 signature: 12b193caec12d0ac888795f65e0d0ae1 ******/
		%feature("compactdefaultargs") VKnots;
		%feature("autodoc", "
Parameters
----------
Kv: TColStd_Array1OfReal

Return
-------
None

Description
-----------
Returns the knots in the V direction. //! Raised if the length of Kv is not equal to the number of knots in the V direction.
") VKnots;
		void VKnots(TColStd_Array1OfReal & Kv);

		/****** Geom_BSplineSurface::VKnots ******/
		/****** md5 signature: abf017b4e3038ef4c4599c229a61c857 ******/
		%feature("compactdefaultargs") VKnots;
		%feature("autodoc", "Return
-------
TColStd_Array1OfReal

Description
-----------
Returns the knots in the V direction.
") VKnots;
		const TColStd_Array1OfReal & VKnots();

		/****** Geom_BSplineSurface::VMultiplicities ******/
		/****** md5 signature: a8ac3d40bf4a116820e3d4bc53ef5def ******/
		%feature("compactdefaultargs") VMultiplicities;
		%feature("autodoc", "
Parameters
----------
Mv: TColStd_Array1OfInteger

Return
-------
None

Description
-----------
Returns the multiplicities of the knots in the V direction. //! Raised if the length of Mv is not equal to the number of knots in the V direction.
") VMultiplicities;
		void VMultiplicities(TColStd_Array1OfInteger & Mv);

		/****** Geom_BSplineSurface::VMultiplicities ******/
		/****** md5 signature: 42e4ed449de2a286993c2a1ade45b1d5 ******/
		%feature("compactdefaultargs") VMultiplicities;
		%feature("autodoc", "Return
-------
TColStd_Array1OfInteger

Description
-----------
Returns the multiplicities of the knots in the V direction.
") VMultiplicities;
		const TColStd_Array1OfInteger & VMultiplicities();

		/****** Geom_BSplineSurface::VMultiplicity ******/
		/****** md5 signature: d21b3a277f002a7f3b2fcadb35374bc1 ******/
		%feature("compactdefaultargs") VMultiplicity;
		%feature("autodoc", "
Parameters
----------
VIndex: int

Return
-------
int

Description
-----------
Returns the multiplicity value of knot of range VIndex in the v direction. Raised if VIndex < 1 or VIndex > NbVKnots.
") VMultiplicity;
		Standard_Integer VMultiplicity(const Standard_Integer VIndex);

		/****** Geom_BSplineSurface::VReverse ******/
		/****** md5 signature: ca22d262a13cf236e9be77a884d19536 ******/
		%feature("compactdefaultargs") VReverse;
		%feature("autodoc", "Return
-------
None

Description
-----------
Changes the orientation of this BSpline surface in the V parametric direction. The bounds of the surface are not changed but the given parametric direction is reversed. Hence the orientation of the surface is reversed. The knots and poles tables are modified.
") VReverse;
		void VReverse();

		/****** Geom_BSplineSurface::VReversedParameter ******/
		/****** md5 signature: 92057d43e0e5ee078908582a4176343b ******/
		%feature("compactdefaultargs") VReversedParameter;
		%feature("autodoc", "
Parameters
----------
V: float

Return
-------
float

Description
-----------
Computes the v parameter on the modified surface, produced by reversing its V parametric direction, for the point of v parameter V on this BSpline surface. For a BSpline surface, these functions return respectively: - VFirst + VLast - V, VFirst and VLast are the values of the first and last parameters of this BSpline surface, in the v pametric directions.
") VReversedParameter;
		Standard_Real VReversedParameter(const Standard_Real V);

		/****** Geom_BSplineSurface::Weight ******/
		/****** md5 signature: 3f3d90bfc32174f677371ed3017fc02e ******/
		%feature("compactdefaultargs") Weight;
		%feature("autodoc", "
Parameters
----------
UIndex: int
VIndex: int

Return
-------
float

Description
-----------
Returns the weight value of range UIndex, VIndex. //! Raised if UIndex < 1 or UIndex > NbUPoles or VIndex < 1 or VIndex > NbVPoles.
") Weight;
		Standard_Real Weight(const Standard_Integer UIndex, const Standard_Integer VIndex);

		/****** Geom_BSplineSurface::Weights ******/
		/****** md5 signature: bfcff4bb351c5cc316fe1eebca09f020 ******/
		%feature("compactdefaultargs") Weights;
		%feature("autodoc", "
Parameters
----------
W: TColStd_Array2OfReal

Return
-------
None

Description
-----------
Returns the weights of the B-spline surface. //! Raised if the length of W in the U and V direction is not equal to NbUPoles and NbVPoles.
") Weights;
		void Weights(TColStd_Array2OfReal & W);

		/****** Geom_BSplineSurface::Weights ******/
		/****** md5 signature: 6a757f06b12c74eb2bedf827727d3100 ******/
		%feature("compactdefaultargs") Weights;
		%feature("autodoc", "Return
-------
TColStd_Array2OfReal *

Description
-----------
Returns the weights of the B-spline surface. value and derivatives computation.
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
		/****** Geom_BezierCurve::Geom_BezierCurve ******/
		/****** md5 signature: 7b0c51ed2f2bce368deb726ed6e3208f ******/
		%feature("compactdefaultargs") Geom_BezierCurve;
		%feature("autodoc", "
Parameters
----------
CurvePoles: TColgp_Array1OfPnt

Return
-------
None

Description
-----------
Creates a non rational Bezier curve with a set of poles CurvePoles. The weights are defaulted to all being 1. Raises ConstructionError if the number of poles is greater than MaxDegree + 1 or lower than 2.
") Geom_BezierCurve;
		 Geom_BezierCurve(const TColgp_Array1OfPnt & CurvePoles);

		/****** Geom_BezierCurve::Geom_BezierCurve ******/
		/****** md5 signature: 0b6fccb02dabb97c415680b0476d10e8 ******/
		%feature("compactdefaultargs") Geom_BezierCurve;
		%feature("autodoc", "
Parameters
----------
CurvePoles: TColgp_Array1OfPnt
PoleWeights: TColStd_Array1OfReal

Return
-------
None

Description
-----------
Creates a rational Bezier curve with the set of poles CurvePoles and the set of weights PoleWeights . If all the weights are identical the curve is considered as non rational. Raises ConstructionError if the number of poles is greater than MaxDegree + 1 or lower than 2 or CurvePoles and CurveWeights have not the same length or one weight value is lower or equal to Resolution from package gp.
") Geom_BezierCurve;
		 Geom_BezierCurve(const TColgp_Array1OfPnt & CurvePoles, const TColStd_Array1OfReal & PoleWeights);

		/****** Geom_BezierCurve::Continuity ******/
		/****** md5 signature: 9381b370dfdd50af7f1b79ce202f0c6f ******/
		%feature("compactdefaultargs") Continuity;
		%feature("autodoc", "Return
-------
GeomAbs_Shape

Description
-----------
a Bezier curve is CN.
") Continuity;
		GeomAbs_Shape Continuity();

		/****** Geom_BezierCurve::Copy ******/
		/****** md5 signature: 1360a3e0ea51e38ae19c71fb8aa1c4e9 ******/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom_Geometry>

Description
-----------
Creates a new object which is a copy of this Bezier curve.
") Copy;
		opencascade::handle<Geom_Geometry> Copy();

		/****** Geom_BezierCurve::D0 ******/
		/****** md5 signature: 5f7d08d8d17afc516aac9ef64bf9711f ******/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "
Parameters
----------
U: float
P: gp_Pnt

Return
-------
None

Description
-----------
No available documentation.
") D0;
		void D0(const Standard_Real U, gp_Pnt & P);

		/****** Geom_BezierCurve::D1 ******/
		/****** md5 signature: 0264d3f49439e8cb4580d20449d25b51 ******/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "
Parameters
----------
U: float
P: gp_Pnt
V1: gp_Vec

Return
-------
None

Description
-----------
No available documentation.
") D1;
		void D1(const Standard_Real U, gp_Pnt & P, gp_Vec & V1);

		/****** Geom_BezierCurve::D2 ******/
		/****** md5 signature: a694b4ba68c0fd83fbac79f945cb5d8c ******/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "
Parameters
----------
U: float
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
		void D2(const Standard_Real U, gp_Pnt & P, gp_Vec & V1, gp_Vec & V2);

		/****** Geom_BezierCurve::D3 ******/
		/****** md5 signature: cf1c3b5fe7af9d5c183c1b16b21c43f1 ******/
		%feature("compactdefaultargs") D3;
		%feature("autodoc", "
Parameters
----------
U: float
P: gp_Pnt
V1: gp_Vec
V2: gp_Vec
V3: gp_Vec

Return
-------
None

Description
-----------
For this Bezier curve, computes - the point P of parameter U, or - the point P and one or more of the following values: - V1, the first derivative vector, - V2, the second derivative vector, - V3, the third derivative vector. Note: the parameter U can be outside the bounds of the curve.
") D3;
		void D3(const Standard_Real U, gp_Pnt & P, gp_Vec & V1, gp_Vec & V2, gp_Vec & V3);

		/****** Geom_BezierCurve::DN ******/
		/****** md5 signature: 0d4a3e2fc2b4b03d2a49e0796a487efb ******/
		%feature("compactdefaultargs") DN;
		%feature("autodoc", "
Parameters
----------
U: float
N: int

Return
-------
gp_Vec

Description
-----------
For the point of parameter U of this Bezier curve, computes the vector corresponding to the Nth derivative. Note: the parameter U can be outside the bounds of the curve. Exceptions Standard_RangeError if N is less than 1.
") DN;
		gp_Vec DN(const Standard_Real U, const Standard_Integer N);

		/****** Geom_BezierCurve::Degree ******/
		/****** md5 signature: e3276df1ce733e2c8e940db548a26d03 ******/
		%feature("compactdefaultargs") Degree;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the polynomial degree of the curve. it is the number of poles - 1 point P and derivatives (V1, V2, V3) computation The Bezier Curve has a Polynomial representation so the parameter U can be out of the bounds of the curve.
") Degree;
		Standard_Integer Degree();


        /****************** DumpJson ******************/
        %feature("autodoc", "
Parameters
----------
depth: int, default=-1

Return
-------
str

Description
-----------
Dump the object to JSON string.
") DumpJson;
        %extend{
            std::string DumpJson(int depth=-1) {
            std::stringstream s;
            self->DumpJson(s, depth);
            return "{" + s.str() + "}" ;}
        };
		/****** Geom_BezierCurve::EndPoint ******/
		/****** md5 signature: 8dd4886e4c303cec8092c23bff0110c3 ******/
		%feature("compactdefaultargs") EndPoint;
		%feature("autodoc", "Return
-------
gp_Pnt

Description
-----------
Returns Value (U=1.), it is the last control point of the Bezier curve.
") EndPoint;
		gp_Pnt EndPoint();

		/****** Geom_BezierCurve::FirstParameter ******/
		/****** md5 signature: eb9ebe94572bd67588fe8811eac261fb ******/
		%feature("compactdefaultargs") FirstParameter;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the value of the first parameter of this Bezier curve. This is 0.0, which gives the start point of this Bezier curve.
") FirstParameter;
		Standard_Real FirstParameter();

		/****** Geom_BezierCurve::Increase ******/
		/****** md5 signature: e664d16cbd2a07ca42f612f3b1c0f48b ******/
		%feature("compactdefaultargs") Increase;
		%feature("autodoc", "
Parameters
----------
Degree: int

Return
-------
None

Description
-----------
Increases the degree of a bezier curve. Degree is the new degree of <self>. Raises ConstructionError if Degree is greater than MaxDegree or lower than 2 or lower than the initial degree of <self>.
") Increase;
		void Increase(const Standard_Integer Degree);

		/****** Geom_BezierCurve::InsertPoleAfter ******/
		/****** md5 signature: dda28aaffe10cbe608e626c5dd654962 ******/
		%feature("compactdefaultargs") InsertPoleAfter;
		%feature("autodoc", "
Parameters
----------
Index: int
P: gp_Pnt

Return
-------
None

Description
-----------
Inserts a pole P after the pole of range Index. If the curve <self> is rational the weight value for the new pole of range Index is 1.0. raised if Index is not in the range [1, NbPoles] //! raised if the resulting number of poles is greater than MaxDegree + 1.
") InsertPoleAfter;
		void InsertPoleAfter(const Standard_Integer Index, const gp_Pnt & P);

		/****** Geom_BezierCurve::InsertPoleAfter ******/
		/****** md5 signature: f3a89b8b481b99f9b0b9304a2ac0e7f0 ******/
		%feature("compactdefaultargs") InsertPoleAfter;
		%feature("autodoc", "
Parameters
----------
Index: int
P: gp_Pnt
Weight: float

Return
-------
None

Description
-----------
Inserts a pole with its weight in the set of poles after the pole of range Index. If the curve was non rational it can become rational if all the weights are not identical. Raised if Index is not in the range [1, NbPoles] //! Raised if the resulting number of poles is greater than MaxDegree + 1. Raised if Weight is lower or equal to Resolution from package gp.
") InsertPoleAfter;
		void InsertPoleAfter(const Standard_Integer Index, const gp_Pnt & P, const Standard_Real Weight);

		/****** Geom_BezierCurve::InsertPoleBefore ******/
		/****** md5 signature: 54e59e7f1bd435e1ff2d398aff5c61cb ******/
		%feature("compactdefaultargs") InsertPoleBefore;
		%feature("autodoc", "
Parameters
----------
Index: int
P: gp_Pnt

Return
-------
None

Description
-----------
Inserts a pole P before the pole of range Index. If the curve <self> is rational the weight value for the new pole of range Index is 1.0. Raised if Index is not in the range [1, NbPoles] //! Raised if the resulting number of poles is greater than MaxDegree + 1.
") InsertPoleBefore;
		void InsertPoleBefore(const Standard_Integer Index, const gp_Pnt & P);

		/****** Geom_BezierCurve::InsertPoleBefore ******/
		/****** md5 signature: 1fbbc780e37b1af530053e4a71efcfec ******/
		%feature("compactdefaultargs") InsertPoleBefore;
		%feature("autodoc", "
Parameters
----------
Index: int
P: gp_Pnt
Weight: float

Return
-------
None

Description
-----------
Inserts a pole with its weight in the set of poles after the pole of range Index. If the curve was non rational it can become rational if all the weights are not identical. Raised if Index is not in the range [1, NbPoles] //! Raised if the resulting number of poles is greater than MaxDegree + 1. Raised if Weight is lower or equal to Resolution from package gp.
") InsertPoleBefore;
		void InsertPoleBefore(const Standard_Integer Index, const gp_Pnt & P, const Standard_Real Weight);

		/****** Geom_BezierCurve::IsCN ******/
		/****** md5 signature: 73c2d9ecdd776a5227f0665f0702fcb3 ******/
		%feature("compactdefaultargs") IsCN;
		%feature("autodoc", "
Parameters
----------
N: int

Return
-------
bool

Description
-----------
Continuity of the curve, returns True.
") IsCN;
		Standard_Boolean IsCN(const Standard_Integer N);

		/****** Geom_BezierCurve::IsClosed ******/
		/****** md5 signature: 00978070ec4cb5f00d1d002a8d5d3763 ******/
		%feature("compactdefaultargs") IsClosed;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if the distance between the first point and the last point of the curve is lower or equal to the Resolution from package gp.
") IsClosed;
		Standard_Boolean IsClosed();

		/****** Geom_BezierCurve::IsPeriodic ******/
		/****** md5 signature: 15e3ccfd3ad4ae42959489f7f64aa8ca ******/
		%feature("compactdefaultargs") IsPeriodic;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if the parametrization of a curve is periodic. (P(u) = P(u + T) T = constante).
") IsPeriodic;
		Standard_Boolean IsPeriodic();

		/****** Geom_BezierCurve::IsRational ******/
		/****** md5 signature: fd4212ffa7bc30cde420e74a2c539434 ******/
		%feature("compactdefaultargs") IsRational;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns false if all the weights are identical. The tolerance criterion is Resolution from package gp.
") IsRational;
		Standard_Boolean IsRational();

		/****** Geom_BezierCurve::LastParameter ******/
		/****** md5 signature: cb4925a2d4a451ceec8f6ad486530f9c ******/
		%feature("compactdefaultargs") LastParameter;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the value of the last parameter of this Bezier curve. This is 1.0, which gives the end point of this Bezier curve.
") LastParameter;
		Standard_Real LastParameter();

		/****** Geom_BezierCurve::MaxDegree ******/
		/****** md5 signature: 985314a0ed62b597a9bdf0f555b97bed ******/
		%feature("compactdefaultargs") MaxDegree;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the value of the maximum polynomial degree of any Geom_BezierCurve curve. This value is 25.
") MaxDegree;
		static Standard_Integer MaxDegree();

		/****** Geom_BezierCurve::NbPoles ******/
		/****** md5 signature: 9a7d6d5f8a21c5833786e951bce99604 ******/
		%feature("compactdefaultargs") NbPoles;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of poles of this Bezier curve.
") NbPoles;
		Standard_Integer NbPoles();

		/****** Geom_BezierCurve::Pole ******/
		/****** md5 signature: 5a83797398b762820fe4e76a1b7c2504 ******/
		%feature("compactdefaultargs") Pole;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
gp_Pnt

Description
-----------
Returns the pole of range Index. Raised if Index is not in the range [1, NbPoles].
") Pole;
		const gp_Pnt Pole(const Standard_Integer Index);

		/****** Geom_BezierCurve::Poles ******/
		/****** md5 signature: 6f58b0e5f2985c3cf12db24d338cf6c3 ******/
		%feature("compactdefaultargs") Poles;
		%feature("autodoc", "
Parameters
----------
P: TColgp_Array1OfPnt

Return
-------
None

Description
-----------
Returns all the poles of the curve. //! Raised if the length of P is not equal to the number of poles.
") Poles;
		void Poles(TColgp_Array1OfPnt & P);

		/****** Geom_BezierCurve::Poles ******/
		/****** md5 signature: 74aabdc9663f922ca9ac5a471f930356 ******/
		%feature("compactdefaultargs") Poles;
		%feature("autodoc", "Return
-------
TColgp_Array1OfPnt

Description
-----------
Returns all the poles of the curve.
") Poles;
		const TColgp_Array1OfPnt & Poles();

		/****** Geom_BezierCurve::RemovePole ******/
		/****** md5 signature: b488f4ba1aa92b1c805329ca2c5bc2e2 ******/
		%feature("compactdefaultargs") RemovePole;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
None

Description
-----------
Removes the pole of range Index. If the curve was rational it can become non rational. Raised if Index is not in the range [1, NbPoles] Raised if Degree is lower than 2.
") RemovePole;
		void RemovePole(const Standard_Integer Index);

		/****** Geom_BezierCurve::Resolution ******/
		/****** md5 signature: 6437f52eb15539577fb4ae8621d2ded9 ******/
		%feature("compactdefaultargs") Resolution;
		%feature("autodoc", "
Parameters
----------
Tolerance3D: float

Return
-------
UTolerance: float

Description
-----------
Computes for this Bezier curve the parametric tolerance UTolerance for a given 3D tolerance Tolerance3D. If f(t) is the equation of this Bezier curve, UTolerance ensures that: |t1-t0| < UTolerance ===> |f(t1)-f(t0)| < Tolerance3D.
") Resolution;
		void Resolution(const Standard_Real Tolerance3D, Standard_Real &OutValue);

		/****** Geom_BezierCurve::Reverse ******/
		/****** md5 signature: bff3d53d1cf0b268b7de85021a2bf3c4 ******/
		%feature("compactdefaultargs") Reverse;
		%feature("autodoc", "Return
-------
None

Description
-----------
Reverses the direction of parametrization of <self> Value (NewU) = Value (1 - OldU).
") Reverse;
		void Reverse();

		/****** Geom_BezierCurve::ReversedParameter ******/
		/****** md5 signature: 382721d5a4ea752fecc12f03ab0de9a1 ******/
		%feature("compactdefaultargs") ReversedParameter;
		%feature("autodoc", "
Parameters
----------
U: float

Return
-------
float

Description
-----------
Returns the parameter on the reversed curve for the point of parameter U on <self>. //! returns 1-U.
") ReversedParameter;
		Standard_Real ReversedParameter(const Standard_Real U);

		/****** Geom_BezierCurve::Segment ******/
		/****** md5 signature: fb72a1522f77fa9f134af7f8bf81def8 ******/
		%feature("compactdefaultargs") Segment;
		%feature("autodoc", "
Parameters
----------
U1: float
U2: float

Return
-------
None

Description
-----------
Segments the curve between U1 and U2 which can be out of the bounds of the curve. The curve is oriented from U1 to U2. The control points are modified, the first and the last point are not the same but the parametrization range is [0, 1] else it could not be a Bezier curve. Warnings: Even if <self> is not closed it can become closed after the segmentation for example if U1 or U2 are out of the bounds of the curve <self> or if the curve makes loop. After the segmentation the length of a curve can be null.
") Segment;
		void Segment(const Standard_Real U1, const Standard_Real U2);

		/****** Geom_BezierCurve::SetPole ******/
		/****** md5 signature: c804d6e49d15c749b2cf3bf061821fae ******/
		%feature("compactdefaultargs") SetPole;
		%feature("autodoc", "
Parameters
----------
Index: int
P: gp_Pnt

Return
-------
None

Description
-----------
Substitutes the pole of range index with P. If the curve <self> is rational the weight of range Index is not modified. raiseD if Index is not in the range [1, NbPoles].
") SetPole;
		void SetPole(const Standard_Integer Index, const gp_Pnt & P);

		/****** Geom_BezierCurve::SetPole ******/
		/****** md5 signature: ae5484e750e2e148a7cbe47257d71d1c ******/
		%feature("compactdefaultargs") SetPole;
		%feature("autodoc", "
Parameters
----------
Index: int
P: gp_Pnt
Weight: float

Return
-------
None

Description
-----------
Substitutes the pole and the weights of range Index. If the curve <self> is not rational it can become rational if all the weights are not identical. If the curve was rational it can become non rational if all the weights are identical. Raised if Index is not in the range [1, NbPoles] Raised if Weight <= Resolution from package gp.
") SetPole;
		void SetPole(const Standard_Integer Index, const gp_Pnt & P, const Standard_Real Weight);

		/****** Geom_BezierCurve::SetWeight ******/
		/****** md5 signature: 4e7aa00d12e09e9b776d4bf66f07ecec ******/
		%feature("compactdefaultargs") SetWeight;
		%feature("autodoc", "
Parameters
----------
Index: int
Weight: float

Return
-------
None

Description
-----------
Changes the weight of the pole of range Index. If the curve <self> is not rational it can become rational if all the weights are not identical. If the curve was rational it can become non rational if all the weights are identical. Raised if Index is not in the range [1, NbPoles] Raised if Weight <= Resolution from package gp.
") SetWeight;
		void SetWeight(const Standard_Integer Index, const Standard_Real Weight);

		/****** Geom_BezierCurve::StartPoint ******/
		/****** md5 signature: ccb2a909a54dc7dd0800015a563c1ff7 ******/
		%feature("compactdefaultargs") StartPoint;
		%feature("autodoc", "Return
-------
gp_Pnt

Description
-----------
Returns Value (U=0.), it is the first control point of the curve.
") StartPoint;
		gp_Pnt StartPoint();

		/****** Geom_BezierCurve::Transform ******/
		/****** md5 signature: b643be97d129c62226d788cd0501ced0 ******/
		%feature("compactdefaultargs") Transform;
		%feature("autodoc", "
Parameters
----------
T: gp_Trsf

Return
-------
None

Description
-----------
Applies the transformation T to this Bezier curve.
") Transform;
		void Transform(const gp_Trsf & T);

		/****** Geom_BezierCurve::Weight ******/
		/****** md5 signature: 70cf193bf7498ec22102a906ea9db6f5 ******/
		%feature("compactdefaultargs") Weight;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
float

Description
-----------
Returns the weight of range Index. Raised if Index is not in the range [1, NbPoles].
") Weight;
		Standard_Real Weight(const Standard_Integer Index);

		/****** Geom_BezierCurve::Weights ******/
		/****** md5 signature: dd63733e96eafbaacbd2d7b600471c30 ******/
		%feature("compactdefaultargs") Weights;
		%feature("autodoc", "
Parameters
----------
W: TColStd_Array1OfReal

Return
-------
None

Description
-----------
Returns all the weights of the curve. //! Raised if the length of W is not equal to the number of poles.
") Weights;
		void Weights(TColStd_Array1OfReal & W);

		/****** Geom_BezierCurve::Weights ******/
		/****** md5 signature: 7c14f36f7b022f971de3890428e2025c ******/
		%feature("compactdefaultargs") Weights;
		%feature("autodoc", "Return
-------
TColStd_Array1OfReal *

Description
-----------
Returns all the weights of the curve.
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
		/****** Geom_BezierSurface::Geom_BezierSurface ******/
		/****** md5 signature: 832ae573ef6a0bd15e1156961264150a ******/
		%feature("compactdefaultargs") Geom_BezierSurface;
		%feature("autodoc", "
Parameters
----------
SurfacePoles: TColgp_Array2OfPnt

Return
-------
None

Description
-----------
Creates a non-rational Bezier surface with a set of poles. Control points representation: SPoles(Uorigin,Vorigin) ...................SPoles(Uorigin,Vend) .  . .  . SPoles(Uend, Vorigin) .....................SPoles(Uend, Vend) For the double array the row indice corresponds to the parametric U direction and the columns indice corresponds to the parametric V direction. The weights are defaulted to all being 1. //! Raised if the number of poles of the surface is lower than 2 or greater than MaxDegree + 1 in one of the two directions U or V.
") Geom_BezierSurface;
		 Geom_BezierSurface(const TColgp_Array2OfPnt & SurfacePoles);

		/****** Geom_BezierSurface::Geom_BezierSurface ******/
		/****** md5 signature: 51418e64bf9bc8ac15418248adb2ef31 ******/
		%feature("compactdefaultargs") Geom_BezierSurface;
		%feature("autodoc", "
Parameters
----------
SurfacePoles: TColgp_Array2OfPnt
PoleWeights: TColStd_Array2OfReal

Return
-------
None

Description
-----------
---Purpose Creates a rational Bezier surface with a set of poles and a set of weights. For the double array the row indice corresponds to the parametric U direction and the columns indice corresponds to the parametric V direction. If all the weights are identical the surface is considered as non-rational (the tolerance criterion is Resolution from package gp). //! Raised if SurfacePoles and PoleWeights have not the same Rowlength or have not the same ColLength. Raised if PoleWeights (i, j) <= Resolution from gp; Raised if the number of poles of the surface is lower than 2 or greater than MaxDegree + 1 in one of the two directions U or V.
") Geom_BezierSurface;
		 Geom_BezierSurface(const TColgp_Array2OfPnt & SurfacePoles, const TColStd_Array2OfReal & PoleWeights);

		/****** Geom_BezierSurface::Bounds ******/
		/****** md5 signature: bbc36976e796eedf3c69513e986f2adb ******/
		%feature("compactdefaultargs") Bounds;
		%feature("autodoc", "
Parameters
----------

Return
-------
U1: float
U2: float
V1: float
V2: float

Description
-----------
Returns the parametric bounds U1, U2, V1 and V2 of this Bezier surface. In the case of a Bezier surface, this function returns U1 = 0, V1 = 0, U2 = 1, V2 = 1.
") Bounds;
		void Bounds(Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** Geom_BezierSurface::Continuity ******/
		/****** md5 signature: 9381b370dfdd50af7f1b79ce202f0c6f ******/
		%feature("compactdefaultargs") Continuity;
		%feature("autodoc", "Return
-------
GeomAbs_Shape

Description
-----------
Returns the continuity of the surface CN: the order of continuity is infinite.
") Continuity;
		GeomAbs_Shape Continuity();

		/****** Geom_BezierSurface::Copy ******/
		/****** md5 signature: 1360a3e0ea51e38ae19c71fb8aa1c4e9 ******/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom_Geometry>

Description
-----------
Creates a new object which is a copy of this Bezier surface.
") Copy;
		opencascade::handle<Geom_Geometry> Copy();

		/****** Geom_BezierSurface::D0 ******/
		/****** md5 signature: 909f7ecc223d561155c9c3ba4b8e7b64 ******/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "
Parameters
----------
U: float
V: float
P: gp_Pnt

Return
-------
None

Description
-----------
No available documentation.
") D0;
		void D0(const Standard_Real U, const Standard_Real V, gp_Pnt & P);

		/****** Geom_BezierSurface::D1 ******/
		/****** md5 signature: 0868b105367e01c443402a5728aa3395 ******/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "
Parameters
----------
U: float
V: float
P: gp_Pnt
D1U: gp_Vec
D1V: gp_Vec

Return
-------
None

Description
-----------
No available documentation.
") D1;
		void D1(const Standard_Real U, const Standard_Real V, gp_Pnt & P, gp_Vec & D1U, gp_Vec & D1V);

		/****** Geom_BezierSurface::D2 ******/
		/****** md5 signature: 5bdb029d3f1561c55d7ab1d1b0b0282a ******/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "
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

Return
-------
None

Description
-----------
No available documentation.
") D2;
		void D2(const Standard_Real U, const Standard_Real V, gp_Pnt & P, gp_Vec & D1U, gp_Vec & D1V, gp_Vec & D2U, gp_Vec & D2V, gp_Vec & D2UV);

		/****** Geom_BezierSurface::D3 ******/
		/****** md5 signature: 2fbd4d1b6bb5f19034b05b5a6e0ddec0 ******/
		%feature("compactdefaultargs") D3;
		%feature("autodoc", "
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

Return
-------
None

Description
-----------
Computes P, the point of parameters (U, V) of this Bezier surface, and - one or more of the following sets of vectors: - D1U and D1V, the first derivative vectors at this point, - D2U, D2V and D2UV, the second derivative vectors at this point, - D3U, D3V, D3UUV and D3UVV, the third derivative vectors at this point. Note: The parameters U and V can be outside the bounds of the surface.
") D3;
		void D3(const Standard_Real U, const Standard_Real V, gp_Pnt & P, gp_Vec & D1U, gp_Vec & D1V, gp_Vec & D2U, gp_Vec & D2V, gp_Vec & D2UV, gp_Vec & D3U, gp_Vec & D3V, gp_Vec & D3UUV, gp_Vec & D3UVV);

		/****** Geom_BezierSurface::DN ******/
		/****** md5 signature: 78200f5fa5a4060f4022c2e3d9d8ac0e ******/
		%feature("compactdefaultargs") DN;
		%feature("autodoc", "
Parameters
----------
U: float
V: float
Nu: int
Nv: int

Return
-------
gp_Vec

Description
-----------
Computes the derivative of order Nu in the u parametric direction, and Nv in the v parametric direction, at the point of parameters (U, V) of this Bezier surface. Note: The parameters U and V can be outside the bounds of the surface. Exceptions Standard_RangeError if: - Nu + Nv is less than 1, or Nu or Nv is negative.
") DN;
		gp_Vec DN(const Standard_Real U, const Standard_Real V, const Standard_Integer Nu, const Standard_Integer Nv);


        /****************** DumpJson ******************/
        %feature("autodoc", "
Parameters
----------
depth: int, default=-1

Return
-------
str

Description
-----------
Dump the object to JSON string.
") DumpJson;
        %extend{
            std::string DumpJson(int depth=-1) {
            std::stringstream s;
            self->DumpJson(s, depth);
            return "{" + s.str() + "}" ;}
        };
		/****** Geom_BezierSurface::ExchangeUV ******/
		/****** md5 signature: fcaf4a45cf2f84fab80e6127ee17ec77 ******/
		%feature("compactdefaultargs") ExchangeUV;
		%feature("autodoc", "Return
-------
None

Description
-----------
Exchanges the direction U and V on a Bezier surface As a consequence: - the poles and weights tables are transposed, - degrees, rational characteristics and so on are exchanged between the two parametric directions, and - the orientation of the surface is reversed.
") ExchangeUV;
		void ExchangeUV();

		/****** Geom_BezierSurface::Increase ******/
		/****** md5 signature: fdbaa7924ce9aa9fdf464643ea61bc84 ******/
		%feature("compactdefaultargs") Increase;
		%feature("autodoc", "
Parameters
----------
UDeg: int
VDeg: int

Return
-------
None

Description
-----------
Increases the degree of this Bezier surface in the two parametric directions. //! Raised if UDegree < UDegree <self> or VDegree < VDegree <self> Raised if the degree of the surface is greater than MaxDegree in one of the two directions U or V.
") Increase;
		void Increase(const Standard_Integer UDeg, const Standard_Integer VDeg);

		/****** Geom_BezierSurface::InsertPoleColAfter ******/
		/****** md5 signature: 898872ba66e7216dd984f0ddf70a9322 ******/
		%feature("compactdefaultargs") InsertPoleColAfter;
		%feature("autodoc", "
Parameters
----------
VIndex: int
CPoles: TColgp_Array1OfPnt

Return
-------
None

Description
-----------
Inserts a column of poles. If the surface is rational the weights values associated with CPoles are equal defaulted to 1. //! Raised if Vindex < 1 or VIndex > NbVPoles. //! raises if VDegree is greater than MaxDegree. raises if the Length of CPoles is not equal to NbUPoles.
") InsertPoleColAfter;
		void InsertPoleColAfter(const Standard_Integer VIndex, const TColgp_Array1OfPnt & CPoles);

		/****** Geom_BezierSurface::InsertPoleColAfter ******/
		/****** md5 signature: e73b2056aa8c4c6fb8d0917600c41fd1 ******/
		%feature("compactdefaultargs") InsertPoleColAfter;
		%feature("autodoc", "
Parameters
----------
VIndex: int
CPoles: TColgp_Array1OfPnt
CPoleWeights: TColStd_Array1OfReal

Return
-------
None

Description
-----------
Inserts a column of poles and weights. If the surface was non-rational it can become rational. //! Raised if Vindex < 1 or VIndex > NbVPoles. Raised if . VDegree is greater than MaxDegree. . the Length of CPoles is not equal to NbUPoles . a weight value is lower or equal to Resolution from package gp.
") InsertPoleColAfter;
		void InsertPoleColAfter(const Standard_Integer VIndex, const TColgp_Array1OfPnt & CPoles, const TColStd_Array1OfReal & CPoleWeights);

		/****** Geom_BezierSurface::InsertPoleColBefore ******/
		/****** md5 signature: 7b93ba3d35d8472c600bbe679879615c ******/
		%feature("compactdefaultargs") InsertPoleColBefore;
		%feature("autodoc", "
Parameters
----------
VIndex: int
CPoles: TColgp_Array1OfPnt

Return
-------
None

Description
-----------
Inserts a column of poles. If the surface is rational the weights values associated with CPoles are equal defaulted to 1. //! Raised if Vindex < 1 or VIndex > NbVPoles. //! Raised if VDegree is greater than MaxDegree. Raised if the Length of CPoles is not equal to NbUPoles.
") InsertPoleColBefore;
		void InsertPoleColBefore(const Standard_Integer VIndex, const TColgp_Array1OfPnt & CPoles);

		/****** Geom_BezierSurface::InsertPoleColBefore ******/
		/****** md5 signature: e48c7767254a0fafe55ed7093e403d3c ******/
		%feature("compactdefaultargs") InsertPoleColBefore;
		%feature("autodoc", "
Parameters
----------
VIndex: int
CPoles: TColgp_Array1OfPnt
CPoleWeights: TColStd_Array1OfReal

Return
-------
None

Description
-----------
Inserts a column of poles and weights. If the surface was non-rational it can become rational. //! Raised if Vindex < 1 or VIndex > NbVPoles. Raised if: . VDegree is greater than MaxDegree. . the Length of CPoles is not equal to NbUPoles . a weight value is lower or equal to Resolution from package gp.
") InsertPoleColBefore;
		void InsertPoleColBefore(const Standard_Integer VIndex, const TColgp_Array1OfPnt & CPoles, const TColStd_Array1OfReal & CPoleWeights);

		/****** Geom_BezierSurface::InsertPoleRowAfter ******/
		/****** md5 signature: fc5c6aba8c350ef75fd28702d512d2be ******/
		%feature("compactdefaultargs") InsertPoleRowAfter;
		%feature("autodoc", "
Parameters
----------
UIndex: int
CPoles: TColgp_Array1OfPnt

Return
-------
None

Description
-----------
Inserts a row of poles. If the surface is rational the weights values associated with CPoles are equal defaulted to 1. //! Raised if Uindex < 1 or UIndex > NbUPoles. //! Raised if UDegree is greater than MaxDegree. Raised if the Length of CPoles is not equal to NbVPoles.
") InsertPoleRowAfter;
		void InsertPoleRowAfter(const Standard_Integer UIndex, const TColgp_Array1OfPnt & CPoles);

		/****** Geom_BezierSurface::InsertPoleRowAfter ******/
		/****** md5 signature: 14acc60702407d2e3c7a44315291559f ******/
		%feature("compactdefaultargs") InsertPoleRowAfter;
		%feature("autodoc", "
Parameters
----------
UIndex: int
CPoles: TColgp_Array1OfPnt
CPoleWeights: TColStd_Array1OfReal

Return
-------
None

Description
-----------
Inserts a row of poles and weights. If the surface was non-rational it can become rational. //! Raised if Uindex < 1 or UIndex > NbUPoles. Raised if: . UDegree is greater than MaxDegree. . the Length of CPoles is not equal to NbVPoles . a weight value is lower or equal to Resolution from package gp.
") InsertPoleRowAfter;
		void InsertPoleRowAfter(const Standard_Integer UIndex, const TColgp_Array1OfPnt & CPoles, const TColStd_Array1OfReal & CPoleWeights);

		/****** Geom_BezierSurface::InsertPoleRowBefore ******/
		/****** md5 signature: b0982f47b1fbfea3390ed5eeefed5912 ******/
		%feature("compactdefaultargs") InsertPoleRowBefore;
		%feature("autodoc", "
Parameters
----------
UIndex: int
CPoles: TColgp_Array1OfPnt

Return
-------
None

Description
-----------
Inserts a row of poles. If the surface is rational the weights values associated with CPoles are equal defaulted to 1. //! Raised if Uindex < 1 or UIndex > NbUPoles. //! Raised if UDegree is greater than MaxDegree. Raised if the Length of CPoles is not equal to NbVPoles.
") InsertPoleRowBefore;
		void InsertPoleRowBefore(const Standard_Integer UIndex, const TColgp_Array1OfPnt & CPoles);

		/****** Geom_BezierSurface::InsertPoleRowBefore ******/
		/****** md5 signature: b3913710825162736c3fd555cb070efe ******/
		%feature("compactdefaultargs") InsertPoleRowBefore;
		%feature("autodoc", "
Parameters
----------
UIndex: int
CPoles: TColgp_Array1OfPnt
CPoleWeights: TColStd_Array1OfReal

Return
-------
None

Description
-----------
Inserts a row of poles and weights. If the surface was non-rational it can become rational. //! Raised if Uindex < 1 or UIndex > NbUPoles. Raised if: . UDegree is greater than MaxDegree. . the Length of CPoles is not equal to NbVPoles . a weight value is lower or equal to Resolution from package gp.
") InsertPoleRowBefore;
		void InsertPoleRowBefore(const Standard_Integer UIndex, const TColgp_Array1OfPnt & CPoles, const TColStd_Array1OfReal & CPoleWeights);

		/****** Geom_BezierSurface::IsCNu ******/
		/****** md5 signature: c9f9f7f6eb82d83e9ba43e721cffba8a ******/
		%feature("compactdefaultargs") IsCNu;
		%feature("autodoc", "
Parameters
----------
N: int

Return
-------
bool

Description
-----------
Returns True, a Bezier surface is always CN.
") IsCNu;
		Standard_Boolean IsCNu(const Standard_Integer N);

		/****** Geom_BezierSurface::IsCNv ******/
		/****** md5 signature: 0acb88d1ffd7eea46785f30d7fc5f85e ******/
		%feature("compactdefaultargs") IsCNv;
		%feature("autodoc", "
Parameters
----------
N: int

Return
-------
bool

Description
-----------
Returns True, a BezierSurface is always CN.
") IsCNv;
		Standard_Boolean IsCNv(const Standard_Integer N);

		/****** Geom_BezierSurface::IsUClosed ******/
		/****** md5 signature: d1e8bae29b90dc447f4693c94ad31c37 ******/
		%feature("compactdefaultargs") IsUClosed;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if the first control points row and the last control points row are identical. The tolerance criterion is Resolution from package gp.
") IsUClosed;
		Standard_Boolean IsUClosed();

		/****** Geom_BezierSurface::IsUPeriodic ******/
		/****** md5 signature: 91acb028d6850ac4bbf00dc198b558b7 ******/
		%feature("compactdefaultargs") IsUPeriodic;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns False.
") IsUPeriodic;
		Standard_Boolean IsUPeriodic();

		/****** Geom_BezierSurface::IsURational ******/
		/****** md5 signature: d3be4b63bc17a9c6de48bb978a5cf0e7 ******/
		%feature("compactdefaultargs") IsURational;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns False if the weights are identical in the U direction, The tolerance criterion is Resolution from package gp. Example: |1.0, 1.0, 1.0| if Weights = |0.5, 0.5, 0.5| returns False |2.0, 2.0, 2.0|.
") IsURational;
		Standard_Boolean IsURational();

		/****** Geom_BezierSurface::IsVClosed ******/
		/****** md5 signature: aa0eae8155ddef3e9f1d0cc573955bb6 ******/
		%feature("compactdefaultargs") IsVClosed;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if the first control points column and the last control points column are identical. The tolerance criterion is Resolution from package gp.
") IsVClosed;
		Standard_Boolean IsVClosed();

		/****** Geom_BezierSurface::IsVPeriodic ******/
		/****** md5 signature: 88e9b94f2ab4a3d73c3fe787315e4448 ******/
		%feature("compactdefaultargs") IsVPeriodic;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns False.
") IsVPeriodic;
		Standard_Boolean IsVPeriodic();

		/****** Geom_BezierSurface::IsVRational ******/
		/****** md5 signature: dcc1c1ae4603545d87819084535899bc ******/
		%feature("compactdefaultargs") IsVRational;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns False if the weights are identical in the V direction, The tolerance criterion is Resolution from package gp. Example: |1.0, 2.0, 0.5| if Weights = |1.0, 2.0, 0.5| returns False |1.0, 2.0, 0.5|.
") IsVRational;
		Standard_Boolean IsVRational();

		/****** Geom_BezierSurface::MaxDegree ******/
		/****** md5 signature: 985314a0ed62b597a9bdf0f555b97bed ******/
		%feature("compactdefaultargs") MaxDegree;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the value of the maximum polynomial degree of a Bezier surface. This value is 25.
") MaxDegree;
		static Standard_Integer MaxDegree();

		/****** Geom_BezierSurface::NbUPoles ******/
		/****** md5 signature: fb7c625af5aeee8be8cffdd28f1b08d5 ******/
		%feature("compactdefaultargs") NbUPoles;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of poles in the U direction.
") NbUPoles;
		Standard_Integer NbUPoles();

		/****** Geom_BezierSurface::NbVPoles ******/
		/****** md5 signature: 098754ae7893287e442d0a3c48b39cf0 ******/
		%feature("compactdefaultargs") NbVPoles;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of poles in the V direction.
") NbVPoles;
		Standard_Integer NbVPoles();

		/****** Geom_BezierSurface::Pole ******/
		/****** md5 signature: ff2d8ec1af0c36c07e8626aeeac8ea5a ******/
		%feature("compactdefaultargs") Pole;
		%feature("autodoc", "
Parameters
----------
UIndex: int
VIndex: int

Return
-------
gp_Pnt

Description
-----------
Returns the pole of range UIndex, VIndex Raised if UIndex < 1 or UIndex > NbUPoles, or VIndex < 1 or VIndex > NbVPoles.
") Pole;
		const gp_Pnt Pole(const Standard_Integer UIndex, const Standard_Integer VIndex);

		/****** Geom_BezierSurface::Poles ******/
		/****** md5 signature: 13f89ef9fb8304ab9a388808727297da ******/
		%feature("compactdefaultargs") Poles;
		%feature("autodoc", "
Parameters
----------
P: TColgp_Array2OfPnt

Return
-------
None

Description
-----------
Returns the poles of the Bezier surface. //! Raised if the length of P in the U an V direction is not equal to NbUPoles and NbVPoles.
") Poles;
		void Poles(TColgp_Array2OfPnt & P);

		/****** Geom_BezierSurface::Poles ******/
		/****** md5 signature: 1efd06442f0df57e43eea2715b77f1f3 ******/
		%feature("compactdefaultargs") Poles;
		%feature("autodoc", "Return
-------
TColgp_Array2OfPnt

Description
-----------
Returns the poles of the Bezier surface.
") Poles;
		const TColgp_Array2OfPnt & Poles();

		/****** Geom_BezierSurface::RemovePoleCol ******/
		/****** md5 signature: ae84ce73f1805b8c88b45af6979d0bf3 ******/
		%feature("compactdefaultargs") RemovePoleCol;
		%feature("autodoc", "
Parameters
----------
VIndex: int

Return
-------
None

Description
-----------
Removes a column of poles. If the surface was rational it can become non-rational. //! Raised if NbVPoles <= 2 after removing, a Bezier surface must have at least two columns of poles. Raised if Vindex < 1 or VIndex > NbVPoles.
") RemovePoleCol;
		void RemovePoleCol(const Standard_Integer VIndex);

		/****** Geom_BezierSurface::RemovePoleRow ******/
		/****** md5 signature: 798c91d196c5e50c9ef235b8a642131c ******/
		%feature("compactdefaultargs") RemovePoleRow;
		%feature("autodoc", "
Parameters
----------
UIndex: int

Return
-------
None

Description
-----------
Removes a row of poles. If the surface was rational it can become non-rational. //! Raised if NbUPoles <= 2 after removing, a Bezier surface must have at least two rows of poles. Raised if Uindex < 1 or UIndex > NbUPoles.
") RemovePoleRow;
		void RemovePoleRow(const Standard_Integer UIndex);

		/****** Geom_BezierSurface::Resolution ******/
		/****** md5 signature: f550ea5c1bc2e29d0800724fa69c6ce9 ******/
		%feature("compactdefaultargs") Resolution;
		%feature("autodoc", "
Parameters
----------
Tolerance3D: float

Return
-------
UTolerance: float
VTolerance: float

Description
-----------
Computes two tolerance values for this Bezier surface, based on the given tolerance in 3D space Tolerance3D. The tolerances computed are: - UTolerance in the u parametric direction, and - VTolerance in the v parametric direction. If f(u,v) is the equation of this Bezier surface, UTolerance and VTolerance guarantee that: | u1 - u0 | < UTolerance and | v1 - v0 | < VTolerance ====> |f (u1,v1) - f (u0,v0)| < Tolerance3D.
") Resolution;
		void Resolution(const Standard_Real Tolerance3D, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** Geom_BezierSurface::Segment ******/
		/****** md5 signature: bda5f7e0a8e55a80a12dc23a16dfe301 ******/
		%feature("compactdefaultargs") Segment;
		%feature("autodoc", "
Parameters
----------
U1: float
U2: float
V1: float
V2: float

Return
-------
None

Description
-----------
Modifies this Bezier surface by segmenting it between U1 and U2 in the u parametric direction, and between V1 and V2 in the v parametric direction. U1, U2, V1, and V2 can be outside the bounds of this surface. - U1 and U2 isoparametric Bezier curves, segmented between V1 and V2, become the two bounds of the surface in the v parametric direction (0. and 1. u isoparametric curves). - V1 and V2 isoparametric Bezier curves, segmented between U1 and U2, become the two bounds of the surface in the u parametric direction (0. and 1. v isoparametric curves). The poles and weights tables are modified, but the degree of this surface in the u and v parametric directions does not change. U1 can be greater than U2, and V1 can be greater than V2. In these cases, the corresponding parametric direction is inverted. The orientation of the surface is inverted if one (and only one) parametric direction is inverted.
") Segment;
		void Segment(const Standard_Real U1, const Standard_Real U2, const Standard_Real V1, const Standard_Real V2);

		/****** Geom_BezierSurface::SetPole ******/
		/****** md5 signature: 7626021decdd1633f78d695c98c81907 ******/
		%feature("compactdefaultargs") SetPole;
		%feature("autodoc", "
Parameters
----------
UIndex: int
VIndex: int
P: gp_Pnt

Return
-------
None

Description
-----------
Modifies a pole value. If the surface is rational the weight of range (UIndex, VIndex) is not modified. //! Raised if UIndex < 1 or UIndex > NbUPoles or VIndex < 1 or VIndex > NbVPoles.
") SetPole;
		void SetPole(const Standard_Integer UIndex, const Standard_Integer VIndex, const gp_Pnt & P);

		/****** Geom_BezierSurface::SetPole ******/
		/****** md5 signature: ddaccd4b5c1880bee0dcb58b2720ffc1 ******/
		%feature("compactdefaultargs") SetPole;
		%feature("autodoc", "
Parameters
----------
UIndex: int
VIndex: int
P: gp_Pnt
Weight: float

Return
-------
None

Description
-----------
Substitutes the pole and the weight of range UIndex, VIndex. If the surface <self> is not rational it can become rational. if the surface was rational it can become non-rational. //! raises if UIndex < 1 or UIndex > NbUPoles or VIndex < 1 or VIndex > NbVPoles. Raised if Weight <= Resolution from package gp.
") SetPole;
		void SetPole(const Standard_Integer UIndex, const Standard_Integer VIndex, const gp_Pnt & P, const Standard_Real Weight);

		/****** Geom_BezierSurface::SetPoleCol ******/
		/****** md5 signature: b487d5aaa1aef838201a8aba83188f5e ******/
		%feature("compactdefaultargs") SetPoleCol;
		%feature("autodoc", "
Parameters
----------
VIndex: int
CPoles: TColgp_Array1OfPnt

Return
-------
None

Description
-----------
Modifies a column of poles. The length of CPoles can be lower but not greater than NbUPoles so you can modify just a part of the column. Raised if VIndex < 1 or VIndex > NbVPoles //! Raised if CPoles.Lower() < 1 or CPoles.Upper() > NbUPoles.
") SetPoleCol;
		void SetPoleCol(const Standard_Integer VIndex, const TColgp_Array1OfPnt & CPoles);

		/****** Geom_BezierSurface::SetPoleCol ******/
		/****** md5 signature: d64560c21dd051f71154432933ab3740 ******/
		%feature("compactdefaultargs") SetPoleCol;
		%feature("autodoc", "
Parameters
----------
VIndex: int
CPoles: TColgp_Array1OfPnt
CPoleWeights: TColStd_Array1OfReal

Return
-------
None

Description
-----------
Modifies a column of poles. If the surface was rational it can become non-rational If the surface was non-rational it can become rational. The length of CPoles can be lower but not greater than NbUPoles so you can modify just a part of the column. Raised if VIndex < 1 or VIndex > NbVPoles //! Raised if CPoles.Lower() < 1 or CPoles.Upper() > NbUPoles Raised if CPoleWeights and CPoles have not the same bounds. Raised if one of the weight value CPoleWeights (i) is lower or equal to Resolution from package gp.
") SetPoleCol;
		void SetPoleCol(const Standard_Integer VIndex, const TColgp_Array1OfPnt & CPoles, const TColStd_Array1OfReal & CPoleWeights);

		/****** Geom_BezierSurface::SetPoleRow ******/
		/****** md5 signature: 2174ec9de03976c55b3d4c714c979abc ******/
		%feature("compactdefaultargs") SetPoleRow;
		%feature("autodoc", "
Parameters
----------
UIndex: int
CPoles: TColgp_Array1OfPnt

Return
-------
None

Description
-----------
Modifies a row of poles. The length of CPoles can be lower but not greater than NbVPoles so you can modify just a part of the row. Raised if UIndex < 1 or UIndex > NbUPoles //! Raised if CPoles.Lower() < 1 or CPoles.Upper() > NbVPoles.
") SetPoleRow;
		void SetPoleRow(const Standard_Integer UIndex, const TColgp_Array1OfPnt & CPoles);

		/****** Geom_BezierSurface::SetPoleRow ******/
		/****** md5 signature: 8b1783ae4e3ecbab3a746a8ae970da2f ******/
		%feature("compactdefaultargs") SetPoleRow;
		%feature("autodoc", "
Parameters
----------
UIndex: int
CPoles: TColgp_Array1OfPnt
CPoleWeights: TColStd_Array1OfReal

Return
-------
None

Description
-----------
Modifies a row of poles and weights. If the surface was rational it can become non-rational. If the surface was non-rational it can become rational. The length of CPoles can be lower but not greater than NbVPoles so you can modify just a part of the row. Raised if UIndex < 1 or UIndex > NbUPoles //! Raised if CPoles.Lower() < 1 or CPoles.Upper() > NbVPoles Raised if CPoleWeights and CPoles have not the same bounds. Raised if one of the weight value CPoleWeights (i) is lower or equal to Resolution from gp.
") SetPoleRow;
		void SetPoleRow(const Standard_Integer UIndex, const TColgp_Array1OfPnt & CPoles, const TColStd_Array1OfReal & CPoleWeights);

		/****** Geom_BezierSurface::SetWeight ******/
		/****** md5 signature: a6c32aa43dac551c815b66f94dd1c53a ******/
		%feature("compactdefaultargs") SetWeight;
		%feature("autodoc", "
Parameters
----------
UIndex: int
VIndex: int
Weight: float

Return
-------
None

Description
-----------
Modifies the weight of the pole of range UIndex, VIndex. If the surface was non-rational it can become rational. If the surface was rational it can become non-rational. //! Raised if UIndex < 1 or UIndex > NbUPoles or VIndex < 1 or VIndex > NbVPoles. Raised if Weight <= Resolution from package gp.
") SetWeight;
		void SetWeight(const Standard_Integer UIndex, const Standard_Integer VIndex, const Standard_Real Weight);

		/****** Geom_BezierSurface::SetWeightCol ******/
		/****** md5 signature: 234dcaf213f6c00246270b60b622de79 ******/
		%feature("compactdefaultargs") SetWeightCol;
		%feature("autodoc", "
Parameters
----------
VIndex: int
CPoleWeights: TColStd_Array1OfReal

Return
-------
None

Description
-----------
Modifies a column of weights. If the surface was rational it can become non-rational. If the surface was non-rational it can become rational. The length of CPoleWeights can be lower but not greater than NbUPoles. Raised if VIndex < 1 or VIndex > NbVPoles //! Raised if CPoleWeights.Lower() < 1 or CPoleWeights.Upper() > NbUPoles Raised if one of the weight value CPoleWeights (i) is lower or equal to Resolution from package gp.
") SetWeightCol;
		void SetWeightCol(const Standard_Integer VIndex, const TColStd_Array1OfReal & CPoleWeights);

		/****** Geom_BezierSurface::SetWeightRow ******/
		/****** md5 signature: dc1d6ada2bbed4e33ef552c09c88f19d ******/
		%feature("compactdefaultargs") SetWeightRow;
		%feature("autodoc", "
Parameters
----------
UIndex: int
CPoleWeights: TColStd_Array1OfReal

Return
-------
None

Description
-----------
Modifies a row of weights. If the surface was rational it can become non-rational. If the surface was non-rational it can become rational. The length of CPoleWeights can be lower but not greater than NbVPoles. Raised if UIndex < 1 or UIndex > NbUPoles //! Raised if CPoleWeights.Lower() < 1 or CPoleWeights.Upper() > NbVPoles Raised if one of the weight value CPoleWeights (i) is lower or equal to Resolution from package gp.
") SetWeightRow;
		void SetWeightRow(const Standard_Integer UIndex, const TColStd_Array1OfReal & CPoleWeights);

		/****** Geom_BezierSurface::Transform ******/
		/****** md5 signature: b643be97d129c62226d788cd0501ced0 ******/
		%feature("compactdefaultargs") Transform;
		%feature("autodoc", "
Parameters
----------
T: gp_Trsf

Return
-------
None

Description
-----------
Applies the transformation T to this Bezier surface.
") Transform;
		void Transform(const gp_Trsf & T);

		/****** Geom_BezierSurface::UDegree ******/
		/****** md5 signature: f204e5fbf1c49e3d9e4889dfead5a190 ******/
		%feature("compactdefaultargs") UDegree;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the degree of the surface in the U direction it is NbUPoles - 1.
") UDegree;
		Standard_Integer UDegree();

		/****** Geom_BezierSurface::UIso ******/
		/****** md5 signature: f5e8cbc22e32c38f4dd05caadff59fee ******/
		%feature("compactdefaultargs") UIso;
		%feature("autodoc", "
Parameters
----------
U: float

Return
-------
opencascade::handle<Geom_Curve>

Description
-----------
Computes the U isoparametric curve. For a Bezier surface the UIso curve is a Bezier curve.
") UIso;
		opencascade::handle<Geom_Curve> UIso(const Standard_Real U);

		/****** Geom_BezierSurface::UReverse ******/
		/****** md5 signature: 31a376207d6b3f3c82d0cde57034e1f2 ******/
		%feature("compactdefaultargs") UReverse;
		%feature("autodoc", "Return
-------
None

Description
-----------
Changes the orientation of this Bezier surface in the u parametric direction. The bounds of the surface are not changed, but the given parametric direction is reversed. Hence, the orientation of the surface is reversed.
") UReverse;
		void UReverse();

		/****** Geom_BezierSurface::UReversedParameter ******/
		/****** md5 signature: 0071925b176316f0aaaf26f369ac410c ******/
		%feature("compactdefaultargs") UReversedParameter;
		%feature("autodoc", "
Parameters
----------
U: float

Return
-------
float

Description
-----------
Computes the u (or v) parameter on the modified surface, produced by reversing its u (or v) parametric direction, for any point of u parameter U (or of v parameter V) on this Bezier surface. In the case of a Bezier surface, these functions return respectively: - 1.-U, or 1.-V.
") UReversedParameter;
		Standard_Real UReversedParameter(const Standard_Real U);

		/****** Geom_BezierSurface::VDegree ******/
		/****** md5 signature: 4901bdb3b29a5c2410ca93d6a7816f06 ******/
		%feature("compactdefaultargs") VDegree;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the degree of the surface in the V direction it is NbVPoles - 1.
") VDegree;
		Standard_Integer VDegree();

		/****** Geom_BezierSurface::VIso ******/
		/****** md5 signature: ef8726fc193d6cf33f54c94b9ed952a5 ******/
		%feature("compactdefaultargs") VIso;
		%feature("autodoc", "
Parameters
----------
V: float

Return
-------
opencascade::handle<Geom_Curve>

Description
-----------
Computes the V isoparametric curve. For a Bezier surface the VIso curve is a Bezier curve.
") VIso;
		opencascade::handle<Geom_Curve> VIso(const Standard_Real V);

		/****** Geom_BezierSurface::VReverse ******/
		/****** md5 signature: ca22d262a13cf236e9be77a884d19536 ******/
		%feature("compactdefaultargs") VReverse;
		%feature("autodoc", "Return
-------
None

Description
-----------
Changes the orientation of this Bezier surface in the v parametric direction. The bounds of the surface are not changed, but the given parametric direction is reversed. Hence, the orientation of the surface is reversed.
") VReverse;
		void VReverse();

		/****** Geom_BezierSurface::VReversedParameter ******/
		/****** md5 signature: 92057d43e0e5ee078908582a4176343b ******/
		%feature("compactdefaultargs") VReversedParameter;
		%feature("autodoc", "
Parameters
----------
V: float

Return
-------
float

Description
-----------
Computes the u (or v) parameter on the modified surface, produced by reversing its u (or v) parametric direction, for any point of u parameter U (or of v parameter V) on this Bezier surface. In the case of a Bezier surface, these functions return respectively: - 1.-U, or 1.-V.
") VReversedParameter;
		Standard_Real VReversedParameter(const Standard_Real V);

		/****** Geom_BezierSurface::Weight ******/
		/****** md5 signature: 3f3d90bfc32174f677371ed3017fc02e ******/
		%feature("compactdefaultargs") Weight;
		%feature("autodoc", "
Parameters
----------
UIndex: int
VIndex: int

Return
-------
float

Description
-----------
Returns the weight of range UIndex, VIndex //! Raised if UIndex < 1 or UIndex > NbUPoles, or VIndex < 1 or VIndex > NbVPoles.
") Weight;
		Standard_Real Weight(const Standard_Integer UIndex, const Standard_Integer VIndex);

		/****** Geom_BezierSurface::Weights ******/
		/****** md5 signature: bfcff4bb351c5cc316fe1eebca09f020 ******/
		%feature("compactdefaultargs") Weights;
		%feature("autodoc", "
Parameters
----------
W: TColStd_Array2OfReal

Return
-------
None

Description
-----------
Returns the weights of the Bezier surface. //! Raised if the length of W in the U an V direction is not equal to NbUPoles and NbVPoles.
") Weights;
		void Weights(TColStd_Array2OfReal & W);

		/****** Geom_BezierSurface::Weights ******/
		/****** md5 signature: d156ea3ac60631d77ea2f23f1d8ddf4f ******/
		%feature("compactdefaultargs") Weights;
		%feature("autodoc", "Return
-------
TColStd_Array2OfReal *

Description
-----------
Returns the weights of the Bezier surface.
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
		/****** Geom_Circle::Geom_Circle ******/
		/****** md5 signature: a155b35ce80960a37fc0eed60e2e6f10 ******/
		%feature("compactdefaultargs") Geom_Circle;
		%feature("autodoc", "
Parameters
----------
C: gp_Circ

Return
-------
None

Description
-----------
Constructs a circle by conversion of the gp_Circ circle C.
") Geom_Circle;
		 Geom_Circle(const gp_Circ & C);

		/****** Geom_Circle::Geom_Circle ******/
		/****** md5 signature: b8542d594f82b8aa370774e475b4d7f0 ******/
		%feature("compactdefaultargs") Geom_Circle;
		%feature("autodoc", "
Parameters
----------
A2: gp_Ax2
Radius: float

Return
-------
None

Description
-----------
Constructs a circle of radius Radius, where A2 locates the circle and defines its orientation in 3D space such that: - the center of the circle is the origin of A2, - the origin, 'X Direction' and 'Y Direction' of A2 define the plane of the circle, - A2 is the local coordinate system of the circle. Note: It is possible to create a circle where Radius is equal to 0.0. raised if Radius < 0.
") Geom_Circle;
		 Geom_Circle(const gp_Ax2 & A2, const Standard_Real Radius);

		/****** Geom_Circle::Circ ******/
		/****** md5 signature: 5112b99c9c2742a21073a09349dfe6cd ******/
		%feature("compactdefaultargs") Circ;
		%feature("autodoc", "Return
-------
gp_Circ

Description
-----------
returns the non transient circle from gp with the same geometric properties as <self>.
") Circ;
		gp_Circ Circ();

		/****** Geom_Circle::Copy ******/
		/****** md5 signature: 1360a3e0ea51e38ae19c71fb8aa1c4e9 ******/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom_Geometry>

Description
-----------
Creates a new object which is a copy of this circle.
") Copy;
		opencascade::handle<Geom_Geometry> Copy();

		/****** Geom_Circle::D0 ******/
		/****** md5 signature: 5f7d08d8d17afc516aac9ef64bf9711f ******/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "
Parameters
----------
U: float
P: gp_Pnt

Return
-------
None

Description
-----------
Returns in P the point of parameter U. P = C + R * Cos (U) * XDir + R * Sin (U) * YDir where C is the center of the circle , XDir the XDirection and YDir the YDirection of the circle's local coordinate system.
") D0;
		void D0(const Standard_Real U, gp_Pnt & P);

		/****** Geom_Circle::D1 ******/
		/****** md5 signature: 0264d3f49439e8cb4580d20449d25b51 ******/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "
Parameters
----------
U: float
P: gp_Pnt
V1: gp_Vec

Return
-------
None

Description
-----------
Returns the point P of parameter U and the first derivative V1.
") D1;
		void D1(const Standard_Real U, gp_Pnt & P, gp_Vec & V1);

		/****** Geom_Circle::D2 ******/
		/****** md5 signature: a694b4ba68c0fd83fbac79f945cb5d8c ******/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "
Parameters
----------
U: float
P: gp_Pnt
V1: gp_Vec
V2: gp_Vec

Return
-------
None

Description
-----------
Returns the point P of parameter U, the first and second derivatives V1 and V2.
") D2;
		void D2(const Standard_Real U, gp_Pnt & P, gp_Vec & V1, gp_Vec & V2);

		/****** Geom_Circle::D3 ******/
		/****** md5 signature: cf1c3b5fe7af9d5c183c1b16b21c43f1 ******/
		%feature("compactdefaultargs") D3;
		%feature("autodoc", "
Parameters
----------
U: float
P: gp_Pnt
V1: gp_Vec
V2: gp_Vec
V3: gp_Vec

Return
-------
None

Description
-----------
Returns the point P of parameter u, the first second and third derivatives V1 V2 and V3.
") D3;
		void D3(const Standard_Real U, gp_Pnt & P, gp_Vec & V1, gp_Vec & V2, gp_Vec & V3);

		/****** Geom_Circle::DN ******/
		/****** md5 signature: 0d4a3e2fc2b4b03d2a49e0796a487efb ******/
		%feature("compactdefaultargs") DN;
		%feature("autodoc", "
Parameters
----------
U: float
N: int

Return
-------
gp_Vec

Description
-----------
The returned vector gives the value of the derivative for the order of derivation N. Raised if N < 1.
") DN;
		gp_Vec DN(const Standard_Real U, const Standard_Integer N);


        /****************** DumpJson ******************/
        %feature("autodoc", "
Parameters
----------
depth: int, default=-1

Return
-------
str

Description
-----------
Dump the object to JSON string.
") DumpJson;
        %extend{
            std::string DumpJson(int depth=-1) {
            std::stringstream s;
            self->DumpJson(s, depth);
            return "{" + s.str() + "}" ;}
        };
		/****** Geom_Circle::Eccentricity ******/
		/****** md5 signature: 7cc0cae0413ab4c2d528df125e42b57e ******/
		%feature("compactdefaultargs") Eccentricity;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the eccentricity e = 0 for a circle.
") Eccentricity;
		Standard_Real Eccentricity();

		/****** Geom_Circle::FirstParameter ******/
		/****** md5 signature: eb9ebe94572bd67588fe8811eac261fb ******/
		%feature("compactdefaultargs") FirstParameter;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the value of the first parameter of this circle. This is 0.0, which gives the start point of this circle, or The start point and end point of a circle are coincident.
") FirstParameter;
		Standard_Real FirstParameter();

		/****** Geom_Circle::IsClosed ******/
		/****** md5 signature: 00978070ec4cb5f00d1d002a8d5d3763 ******/
		%feature("compactdefaultargs") IsClosed;
		%feature("autodoc", "Return
-------
bool

Description
-----------
returns True.
") IsClosed;
		Standard_Boolean IsClosed();

		/****** Geom_Circle::IsPeriodic ******/
		/****** md5 signature: 15e3ccfd3ad4ae42959489f7f64aa8ca ******/
		%feature("compactdefaultargs") IsPeriodic;
		%feature("autodoc", "Return
-------
bool

Description
-----------
returns True.
") IsPeriodic;
		Standard_Boolean IsPeriodic();

		/****** Geom_Circle::LastParameter ******/
		/****** md5 signature: cb4925a2d4a451ceec8f6ad486530f9c ******/
		%feature("compactdefaultargs") LastParameter;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the value of the last parameter of this circle. This is 2.*Pi, which gives the end point of this circle. The start point and end point of a circle are coincident.
") LastParameter;
		Standard_Real LastParameter();

		/****** Geom_Circle::Radius ******/
		/****** md5 signature: 506a8dc1140a54bd4146c24bb5357fbf ******/
		%feature("compactdefaultargs") Radius;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the radius of this circle.
") Radius;
		Standard_Real Radius();

		/****** Geom_Circle::ReversedParameter ******/
		/****** md5 signature: 382721d5a4ea752fecc12f03ab0de9a1 ******/
		%feature("compactdefaultargs") ReversedParameter;
		%feature("autodoc", "
Parameters
----------
U: float

Return
-------
float

Description
-----------
Computes the parameter on the reversed circle for the point of parameter U on this circle. For a circle, the returned value is: 2.*Pi - U.
") ReversedParameter;
		Standard_Real ReversedParameter(const Standard_Real U);

		/****** Geom_Circle::SetCirc ******/
		/****** md5 signature: 5bf0a7618877e387d8580730ee3beeb3 ******/
		%feature("compactdefaultargs") SetCirc;
		%feature("autodoc", "
Parameters
----------
C: gp_Circ

Return
-------
None

Description
-----------
Set <self> so that <self> has the same geometric properties as C.
") SetCirc;
		void SetCirc(const gp_Circ & C);

		/****** Geom_Circle::SetRadius ******/
		/****** md5 signature: 452d48523583bd00e647880614077dd6 ******/
		%feature("compactdefaultargs") SetRadius;
		%feature("autodoc", "
Parameters
----------
R: float

Return
-------
None

Description
-----------
Assigns the value R to the radius of this circle. Note: it is possible to have a circle with a radius equal to 0.0. Exceptions - Standard_ConstructionError if R is negative.
") SetRadius;
		void SetRadius(const Standard_Real R);

		/****** Geom_Circle::Transform ******/
		/****** md5 signature: b643be97d129c62226d788cd0501ced0 ******/
		%feature("compactdefaultargs") Transform;
		%feature("autodoc", "
Parameters
----------
T: gp_Trsf

Return
-------
None

Description
-----------
Applies the transformation T to this circle.
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
		/****** Geom_ConicalSurface::Geom_ConicalSurface ******/
		/****** md5 signature: edef5991bfc9fe184952d7ca05a0c972 ******/
		%feature("compactdefaultargs") Geom_ConicalSurface;
		%feature("autodoc", "
Parameters
----------
A3: gp_Ax3
Ang: float
Radius: float

Return
-------
None

Description
-----------
A3 defines the local coordinate system of the conical surface. Ang is the conical surface semi-angle. Its absolute value is in range ]0, PI/2[. Radius is the radius of the circle Viso in the placement plane of the conical surface defined with 'XAxis' and 'YAxis'. The 'ZDirection' of A3 defines the direction of the surface's axis of symmetry. If the location point of A3 is the apex of the surface Radius = 0 . At the creation the parametrization of the surface is defined such that the normal Vector (N = D1U ^ D1V) is oriented towards the 'outside region' of the surface. //! Raised if Radius < 0.0 or Abs(Ang) < Resolution from gp or Abs(Ang) >= PI/2 - Resolution.
") Geom_ConicalSurface;
		 Geom_ConicalSurface(const gp_Ax3 & A3, const Standard_Real Ang, const Standard_Real Radius);

		/****** Geom_ConicalSurface::Geom_ConicalSurface ******/
		/****** md5 signature: 517bd27c841c28046143c5aadd886c4a ******/
		%feature("compactdefaultargs") Geom_ConicalSurface;
		%feature("autodoc", "
Parameters
----------
C: gp_Cone

Return
-------
None

Description
-----------
Creates a ConicalSurface from a non transient gp_Cone.
") Geom_ConicalSurface;
		 Geom_ConicalSurface(const gp_Cone & C);

		/****** Geom_ConicalSurface::Apex ******/
		/****** md5 signature: 4b3f8494dd9ac086de8c6d241abd07f8 ******/
		%feature("compactdefaultargs") Apex;
		%feature("autodoc", "Return
-------
gp_Pnt

Description
-----------
Computes the apex of this cone. It is on the negative side of the axis of revolution of this cone if the half-angle at the apex is positive, and on the positive side of the 'main Axis' if the half-angle is negative.
") Apex;
		gp_Pnt Apex();

		/****** Geom_ConicalSurface::Bounds ******/
		/****** md5 signature: bbc36976e796eedf3c69513e986f2adb ******/
		%feature("compactdefaultargs") Bounds;
		%feature("autodoc", "
Parameters
----------

Return
-------
U1: float
U2: float
V1: float
V2: float

Description
-----------
The conical surface is infinite in the V direction so V1 = Realfirst from Standard and V2 = RealLast. U1 = 0 and U2 = 2*PI.
") Bounds;
		void Bounds(Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** Geom_ConicalSurface::Coefficients ******/
		/****** md5 signature: 922ffb066c913dfb924eafd175a6358f ******/
		%feature("compactdefaultargs") Coefficients;
		%feature("autodoc", "
Parameters
----------

Return
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

Description
-----------
Returns the coefficients of the implicit equation of the quadric in the absolute cartesian coordinate system: These coefficients are normalized. @code A1.X**2 + A2.Y**2 + A3.Z**2 + 2.(B1.X.Y + B2.X.Z + B3.Y.Z) + 2.(C1.X + C2.Y + C3.Z) + D = 0.0 @endcode.
") Coefficients;
		void Coefficients(Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** Geom_ConicalSurface::Cone ******/
		/****** md5 signature: 433ba8697232d6bc7b71708b08d190e5 ******/
		%feature("compactdefaultargs") Cone;
		%feature("autodoc", "Return
-------
gp_Cone

Description
-----------
Returns a non transient cone with the same geometric properties as <self>.
") Cone;
		gp_Cone Cone();

		/****** Geom_ConicalSurface::Copy ******/
		/****** md5 signature: 1360a3e0ea51e38ae19c71fb8aa1c4e9 ******/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom_Geometry>

Description
-----------
Creates a new object which is a copy of this cone.
") Copy;
		opencascade::handle<Geom_Geometry> Copy();

		/****** Geom_ConicalSurface::D0 ******/
		/****** md5 signature: 909f7ecc223d561155c9c3ba4b8e7b64 ******/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "
Parameters
----------
U: float
V: float
P: gp_Pnt

Return
-------
None

Description
-----------
Computes the point P (U, V) on the surface. @code P (U, V) = Loc +  (RefRadius + V * sin (Semi-Angle)) * (cos (U) * XDir + sin (U) * YDir) +  V * cos (Semi-Angle) * ZDir @endcode where Loc is the origin of the placement plane (XAxis, YAxis) XDir is the direction of the XAxis and YDir the direction of the YAxis.
") D0;
		void D0(const Standard_Real U, const Standard_Real V, gp_Pnt & P);

		/****** Geom_ConicalSurface::D1 ******/
		/****** md5 signature: 0868b105367e01c443402a5728aa3395 ******/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "
Parameters
----------
U: float
V: float
P: gp_Pnt
D1U: gp_Vec
D1V: gp_Vec

Return
-------
None

Description
-----------
Computes the current point and the first derivatives in the directions U and V.
") D1;
		void D1(const Standard_Real U, const Standard_Real V, gp_Pnt & P, gp_Vec & D1U, gp_Vec & D1V);

		/****** Geom_ConicalSurface::D2 ******/
		/****** md5 signature: 5bdb029d3f1561c55d7ab1d1b0b0282a ******/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "
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

Return
-------
None

Description
-----------
Computes the current point, the first and the second derivatives in the directions U and V.
") D2;
		void D2(const Standard_Real U, const Standard_Real V, gp_Pnt & P, gp_Vec & D1U, gp_Vec & D1V, gp_Vec & D2U, gp_Vec & D2V, gp_Vec & D2UV);

		/****** Geom_ConicalSurface::D3 ******/
		/****** md5 signature: 2fbd4d1b6bb5f19034b05b5a6e0ddec0 ******/
		%feature("compactdefaultargs") D3;
		%feature("autodoc", "
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

Return
-------
None

Description
-----------
Computes the current point, the first,the second and the third derivatives in the directions U and V.
") D3;
		void D3(const Standard_Real U, const Standard_Real V, gp_Pnt & P, gp_Vec & D1U, gp_Vec & D1V, gp_Vec & D2U, gp_Vec & D2V, gp_Vec & D2UV, gp_Vec & D3U, gp_Vec & D3V, gp_Vec & D3UUV, gp_Vec & D3UVV);

		/****** Geom_ConicalSurface::DN ******/
		/****** md5 signature: 78200f5fa5a4060f4022c2e3d9d8ac0e ******/
		%feature("compactdefaultargs") DN;
		%feature("autodoc", "
Parameters
----------
U: float
V: float
Nu: int
Nv: int

Return
-------
gp_Vec

Description
-----------
Computes the derivative of order Nu in the u parametric direction, and Nv in the v parametric direction at the point of parameters (U, V) of this cone. Exceptions Standard_RangeError if: - Nu + Nv is less than 1, - Nu or Nv is negative.
") DN;
		gp_Vec DN(const Standard_Real U, const Standard_Real V, const Standard_Integer Nu, const Standard_Integer Nv);


        /****************** DumpJson ******************/
        %feature("autodoc", "
Parameters
----------
depth: int, default=-1

Return
-------
str

Description
-----------
Dump the object to JSON string.
") DumpJson;
        %extend{
            std::string DumpJson(int depth=-1) {
            std::stringstream s;
            self->DumpJson(s, depth);
            return "{" + s.str() + "}" ;}
        };
		/****** Geom_ConicalSurface::IsUClosed ******/
		/****** md5 signature: d1e8bae29b90dc447f4693c94ad31c37 ******/
		%feature("compactdefaultargs") IsUClosed;
		%feature("autodoc", "Return
-------
bool

Description
-----------
returns True.
") IsUClosed;
		Standard_Boolean IsUClosed();

		/****** Geom_ConicalSurface::IsUPeriodic ******/
		/****** md5 signature: 91acb028d6850ac4bbf00dc198b558b7 ******/
		%feature("compactdefaultargs") IsUPeriodic;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True.
") IsUPeriodic;
		Standard_Boolean IsUPeriodic();

		/****** Geom_ConicalSurface::IsVClosed ******/
		/****** md5 signature: aa0eae8155ddef3e9f1d0cc573955bb6 ******/
		%feature("compactdefaultargs") IsVClosed;
		%feature("autodoc", "Return
-------
bool

Description
-----------
returns False.
") IsVClosed;
		Standard_Boolean IsVClosed();

		/****** Geom_ConicalSurface::IsVPeriodic ******/
		/****** md5 signature: 88e9b94f2ab4a3d73c3fe787315e4448 ******/
		%feature("compactdefaultargs") IsVPeriodic;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns False.
") IsVPeriodic;
		Standard_Boolean IsVPeriodic();

		/****** Geom_ConicalSurface::ParametricTransformation ******/
		/****** md5 signature: 019b69215b9dcafd8e9b0052b449ea05 ******/
		%feature("compactdefaultargs") ParametricTransformation;
		%feature("autodoc", "
Parameters
----------
T: gp_Trsf

Return
-------
gp_GTrsf2d

Description
-----------
Returns a 2d transformation used to find the new parameters of a point on the transformed surface. @code me->Transformed(T)->Value(U',V') @endcode is the same point as @code me->Value(U,V).Transformed(T) @endcode Where U',V' are obtained by transforming U,V with the 2d transformation returned by @code me->ParametricTransformation(T) @endcode This method returns a scale centered on the U axis with T.ScaleFactor.
") ParametricTransformation;
		virtual gp_GTrsf2d ParametricTransformation(const gp_Trsf & T);

		/****** Geom_ConicalSurface::RefRadius ******/
		/****** md5 signature: c2dd1bdf66e360705fa187fafdaf00a1 ******/
		%feature("compactdefaultargs") RefRadius;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the reference radius of this cone. The reference radius is the radius of the circle formed by the intersection of this cone and its reference plane (i.e. the plane defined by the origin, 'X Direction' and 'Y Direction' of the local coordinate system of this cone). If the apex of this cone is on the origin of the local coordinate system of this cone, the returned value is 0.
") RefRadius;
		Standard_Real RefRadius();

		/****** Geom_ConicalSurface::SemiAngle ******/
		/****** md5 signature: a49ed9cc6318be7aa50219450c80bb02 ******/
		%feature("compactdefaultargs") SemiAngle;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the semi-angle at the apex of this cone. Attention! Semi-angle can be negative.
") SemiAngle;
		Standard_Real SemiAngle();

		/****** Geom_ConicalSurface::SetCone ******/
		/****** md5 signature: 1d6bb07a3b7a9dc07b34ffcfcb3e9146 ******/
		%feature("compactdefaultargs") SetCone;
		%feature("autodoc", "
Parameters
----------
C: gp_Cone

Return
-------
None

Description
-----------
Set <self> so that <self> has the same geometric properties as C.
") SetCone;
		void SetCone(const gp_Cone & C);

		/****** Geom_ConicalSurface::SetRadius ******/
		/****** md5 signature: 452d48523583bd00e647880614077dd6 ******/
		%feature("compactdefaultargs") SetRadius;
		%feature("autodoc", "
Parameters
----------
R: float

Return
-------
None

Description
-----------
Changes the radius of the conical surface in the placement plane (Z = 0, V = 0). The local coordinate system is not modified. Raised if R < 0.0.
") SetRadius;
		void SetRadius(const Standard_Real R);

		/****** Geom_ConicalSurface::SetSemiAngle ******/
		/****** md5 signature: 36b463d2613106dd0747eaeb6783e4fc ******/
		%feature("compactdefaultargs") SetSemiAngle;
		%feature("autodoc", "
Parameters
----------
Ang: float

Return
-------
None

Description
-----------
Changes the semi angle of the conical surface. Semi-angle can be negative. Its absolute value Abs(Ang) is in range ]0,PI/2[. Raises ConstructionError if Abs(Ang) < Resolution from gp or Abs(Ang) >= PI/2 - Resolution.
") SetSemiAngle;
		void SetSemiAngle(const Standard_Real Ang);

		/****** Geom_ConicalSurface::Transform ******/
		/****** md5 signature: b643be97d129c62226d788cd0501ced0 ******/
		%feature("compactdefaultargs") Transform;
		%feature("autodoc", "
Parameters
----------
T: gp_Trsf

Return
-------
None

Description
-----------
Applies the transformation T to this cone.
") Transform;
		void Transform(const gp_Trsf & T);

		/****** Geom_ConicalSurface::TransformParameters ******/
		/****** md5 signature: 2d9e8651399bacbb299466ac222a6ca8 ******/
		%feature("compactdefaultargs") TransformParameters;
		%feature("autodoc", "
Parameters
----------
T: gp_Trsf

Return
-------
U: float
V: float

Description
-----------
Computes the parameters on the transformed surface for the transform of the point of parameters U,V on <self>. @code me->Transformed(T)->Value(U',V') @endcode is the same point as @code me->Value(U,V).Transformed(T) @endcode Where U',V' are the new values of U,V after calling @code me->TransformParameters(U,V,T) @endcode This method multiplies V by T.ScaleFactor().
") TransformParameters;
		virtual void TransformParameters(Standard_Real &OutValue, Standard_Real &OutValue, const gp_Trsf & T);

		/****** Geom_ConicalSurface::UIso ******/
		/****** md5 signature: f5e8cbc22e32c38f4dd05caadff59fee ******/
		%feature("compactdefaultargs") UIso;
		%feature("autodoc", "
Parameters
----------
U: float

Return
-------
opencascade::handle<Geom_Curve>

Description
-----------
Builds the U isoparametric line of this cone. The origin of this line is on the reference plane of this cone (i.e. the plane defined by the origin, 'X Direction' and 'Y Direction' of the local coordinate system of this cone).
") UIso;
		opencascade::handle<Geom_Curve> UIso(const Standard_Real U);

		/****** Geom_ConicalSurface::UReversedParameter ******/
		/****** md5 signature: 0071925b176316f0aaaf26f369ac410c ******/
		%feature("compactdefaultargs") UReversedParameter;
		%feature("autodoc", "
Parameters
----------
U: float

Return
-------
float

Description
-----------
Eeturn 2.PI - U.
") UReversedParameter;
		Standard_Real UReversedParameter(const Standard_Real U);

		/****** Geom_ConicalSurface::VIso ******/
		/****** md5 signature: ef8726fc193d6cf33f54c94b9ed952a5 ******/
		%feature("compactdefaultargs") VIso;
		%feature("autodoc", "
Parameters
----------
V: float

Return
-------
opencascade::handle<Geom_Curve>

Description
-----------
Builds the V isoparametric circle of this cone. It is the circle on this cone, located in the plane of Z coordinate V*cos(Semi-Angle) in the local coordinate system of this cone. The 'Axis' of this circle is the axis of revolution of this cone. Its starting point is defined by the 'X Direction' of this cone. Warning If the V isoparametric circle is close to the apex of this cone, the radius of the circle becomes very small. It is possible to have a circle with radius equal to 0.0.
") VIso;
		opencascade::handle<Geom_Curve> VIso(const Standard_Real V);

		/****** Geom_ConicalSurface::VReverse ******/
		/****** md5 signature: 60a0c07d53675378b2bcbe23d1e7e281 ******/
		%feature("compactdefaultargs") VReverse;
		%feature("autodoc", "Return
-------
None

Description
-----------
Changes the orientation of this cone in the v parametric direction. The bounds of the surface are not changed but the v parametric direction is reversed. As a consequence, for a cone: - the 'main Direction' of the local coordinate system is reversed, and - the half-angle at the apex is inverted.
") VReverse;
		virtual void VReverse();

		/****** Geom_ConicalSurface::VReversedParameter ******/
		/****** md5 signature: 92057d43e0e5ee078908582a4176343b ******/
		%feature("compactdefaultargs") VReversedParameter;
		%feature("autodoc", "
Parameters
----------
V: float

Return
-------
float

Description
-----------
Computes the u (or v) parameter on the modified surface, when reversing its u (or v) parametric direction, for any point of u parameter U (or of v parameter V) on this cone. In the case of a cone, these functions return respectively: - 2.*Pi - U, -V.
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
		/****** Geom_CylindricalSurface::Geom_CylindricalSurface ******/
		/****** md5 signature: 1045dba72c04cccaf7e24ea1f8070e1a ******/
		%feature("compactdefaultargs") Geom_CylindricalSurface;
		%feature("autodoc", "
Parameters
----------
A3: gp_Ax3
Radius: float

Return
-------
None

Description
-----------
A3 defines the local coordinate system of the cylindrical surface. The 'ZDirection' of A3 defines the direction of the surface's axis of symmetry. At the creation the parametrization of the surface is defined such that the normal Vector (N = D1U ^ D1V) is oriented towards the 'outside region' of the surface. Warnings: It is not forbidden to create a cylindrical surface with Radius = 0.0 Raised if Radius < 0.0.
") Geom_CylindricalSurface;
		 Geom_CylindricalSurface(const gp_Ax3 & A3, const Standard_Real Radius);

		/****** Geom_CylindricalSurface::Geom_CylindricalSurface ******/
		/****** md5 signature: 6c266d29cc5bbdf322667ddabfeb2ff7 ******/
		%feature("compactdefaultargs") Geom_CylindricalSurface;
		%feature("autodoc", "
Parameters
----------
C: gp_Cylinder

Return
-------
None

Description
-----------
Creates a CylindricalSurface from a non transient gp_Cylinder.
") Geom_CylindricalSurface;
		 Geom_CylindricalSurface(const gp_Cylinder & C);

		/****** Geom_CylindricalSurface::Bounds ******/
		/****** md5 signature: bbc36976e796eedf3c69513e986f2adb ******/
		%feature("compactdefaultargs") Bounds;
		%feature("autodoc", "
Parameters
----------

Return
-------
U1: float
U2: float
V1: float
V2: float

Description
-----------
The CylindricalSurface is infinite in the V direction so V1 = Realfirst, V2 = RealLast from package Standard. U1 = 0 and U2 = 2*PI.
") Bounds;
		void Bounds(Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** Geom_CylindricalSurface::Coefficients ******/
		/****** md5 signature: 922ffb066c913dfb924eafd175a6358f ******/
		%feature("compactdefaultargs") Coefficients;
		%feature("autodoc", "
Parameters
----------

Return
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

Description
-----------
Returns the coefficients of the implicit equation of the quadric in the absolute cartesian coordinate system: These coefficients are normalized. @code A1.X**2 + A2.Y**2 + A3.Z**2 + 2.(B1.X.Y + B2.X.Z + B3.Y.Z) + 2.(C1.X + C2.Y + C3.Z) + D = 0.0 @endcode.
") Coefficients;
		void Coefficients(Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** Geom_CylindricalSurface::Copy ******/
		/****** md5 signature: 1360a3e0ea51e38ae19c71fb8aa1c4e9 ******/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom_Geometry>

Description
-----------
Creates a new object which is a copy of this cylinder.
") Copy;
		opencascade::handle<Geom_Geometry> Copy();

		/****** Geom_CylindricalSurface::Cylinder ******/
		/****** md5 signature: 60a8831694e0858ad1a30449c1edb3c9 ******/
		%feature("compactdefaultargs") Cylinder;
		%feature("autodoc", "Return
-------
gp_Cylinder

Description
-----------
returns a non transient cylinder with the same geometric properties as <self>.
") Cylinder;
		gp_Cylinder Cylinder();

		/****** Geom_CylindricalSurface::D0 ******/
		/****** md5 signature: 909f7ecc223d561155c9c3ba4b8e7b64 ******/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "
Parameters
----------
U: float
V: float
P: gp_Pnt

Return
-------
None

Description
-----------
Computes the point P (U, V) on the surface. P (U, V) = Loc + Radius * (cos (U) * XDir + sin (U) * YDir) + V * ZDir where Loc is the origin of the placement plane (XAxis, YAxis) XDir is the direction of the XAxis and YDir the direction of the YAxis.
") D0;
		void D0(const Standard_Real U, const Standard_Real V, gp_Pnt & P);

		/****** Geom_CylindricalSurface::D1 ******/
		/****** md5 signature: 0868b105367e01c443402a5728aa3395 ******/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "
Parameters
----------
U: float
V: float
P: gp_Pnt
D1U: gp_Vec
D1V: gp_Vec

Return
-------
None

Description
-----------
Computes the current point and the first derivatives in the directions U and V.
") D1;
		void D1(const Standard_Real U, const Standard_Real V, gp_Pnt & P, gp_Vec & D1U, gp_Vec & D1V);

		/****** Geom_CylindricalSurface::D2 ******/
		/****** md5 signature: 5bdb029d3f1561c55d7ab1d1b0b0282a ******/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "
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

Return
-------
None

Description
-----------
Computes the current point, the first and the second derivatives in the directions U and V.
") D2;
		void D2(const Standard_Real U, const Standard_Real V, gp_Pnt & P, gp_Vec & D1U, gp_Vec & D1V, gp_Vec & D2U, gp_Vec & D2V, gp_Vec & D2UV);

		/****** Geom_CylindricalSurface::D3 ******/
		/****** md5 signature: 2fbd4d1b6bb5f19034b05b5a6e0ddec0 ******/
		%feature("compactdefaultargs") D3;
		%feature("autodoc", "
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

Return
-------
None

Description
-----------
Computes the current point, the first, the second and the third derivatives in the directions U and V.
") D3;
		void D3(const Standard_Real U, const Standard_Real V, gp_Pnt & P, gp_Vec & D1U, gp_Vec & D1V, gp_Vec & D2U, gp_Vec & D2V, gp_Vec & D2UV, gp_Vec & D3U, gp_Vec & D3V, gp_Vec & D3UUV, gp_Vec & D3UVV);

		/****** Geom_CylindricalSurface::DN ******/
		/****** md5 signature: 78200f5fa5a4060f4022c2e3d9d8ac0e ******/
		%feature("compactdefaultargs") DN;
		%feature("autodoc", "
Parameters
----------
U: float
V: float
Nu: int
Nv: int

Return
-------
gp_Vec

Description
-----------
Computes the derivative of order Nu in the direction u and Nv in the direction v. Raised if Nu + Nv < 1 or Nu < 0 or Nv < 0.
") DN;
		gp_Vec DN(const Standard_Real U, const Standard_Real V, const Standard_Integer Nu, const Standard_Integer Nv);


        /****************** DumpJson ******************/
        %feature("autodoc", "
Parameters
----------
depth: int, default=-1

Return
-------
str

Description
-----------
Dump the object to JSON string.
") DumpJson;
        %extend{
            std::string DumpJson(int depth=-1) {
            std::stringstream s;
            self->DumpJson(s, depth);
            return "{" + s.str() + "}" ;}
        };
		/****** Geom_CylindricalSurface::IsUClosed ******/
		/****** md5 signature: d1e8bae29b90dc447f4693c94ad31c37 ******/
		%feature("compactdefaultargs") IsUClosed;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True.
") IsUClosed;
		Standard_Boolean IsUClosed();

		/****** Geom_CylindricalSurface::IsUPeriodic ******/
		/****** md5 signature: 91acb028d6850ac4bbf00dc198b558b7 ******/
		%feature("compactdefaultargs") IsUPeriodic;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True.
") IsUPeriodic;
		Standard_Boolean IsUPeriodic();

		/****** Geom_CylindricalSurface::IsVClosed ******/
		/****** md5 signature: aa0eae8155ddef3e9f1d0cc573955bb6 ******/
		%feature("compactdefaultargs") IsVClosed;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns False.
") IsVClosed;
		Standard_Boolean IsVClosed();

		/****** Geom_CylindricalSurface::IsVPeriodic ******/
		/****** md5 signature: 88e9b94f2ab4a3d73c3fe787315e4448 ******/
		%feature("compactdefaultargs") IsVPeriodic;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns False.
") IsVPeriodic;
		Standard_Boolean IsVPeriodic();

		/****** Geom_CylindricalSurface::ParametricTransformation ******/
		/****** md5 signature: 019b69215b9dcafd8e9b0052b449ea05 ******/
		%feature("compactdefaultargs") ParametricTransformation;
		%feature("autodoc", "
Parameters
----------
T: gp_Trsf

Return
-------
gp_GTrsf2d

Description
-----------
Returns a 2d transformation used to find the new parameters of a point on the transformed surface. @code me->Transformed(T)->Value(U',V') @endcode is the same point as @code me->Value(U,V).Transformed(T) @endcode Where U',V' are obtained by transforming U,V with the 2d transformation returned by @code me->ParametricTransformation(T) @endcode This method returns a scale centered on the U axis with T.ScaleFactor.
") ParametricTransformation;
		virtual gp_GTrsf2d ParametricTransformation(const gp_Trsf & T);

		/****** Geom_CylindricalSurface::Radius ******/
		/****** md5 signature: 506a8dc1140a54bd4146c24bb5357fbf ******/
		%feature("compactdefaultargs") Radius;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the radius of this cylinder.
") Radius;
		Standard_Real Radius();

		/****** Geom_CylindricalSurface::SetCylinder ******/
		/****** md5 signature: 325fb22ec545e2ea4aeb1fa4a39cea5e ******/
		%feature("compactdefaultargs") SetCylinder;
		%feature("autodoc", "
Parameters
----------
C: gp_Cylinder

Return
-------
None

Description
-----------
Set <self> so that <self> has the same geometric properties as C.
") SetCylinder;
		void SetCylinder(const gp_Cylinder & C);

		/****** Geom_CylindricalSurface::SetRadius ******/
		/****** md5 signature: 452d48523583bd00e647880614077dd6 ******/
		%feature("compactdefaultargs") SetRadius;
		%feature("autodoc", "
Parameters
----------
R: float

Return
-------
None

Description
-----------
Changes the radius of the cylinder. Raised if R < 0.0.
") SetRadius;
		void SetRadius(const Standard_Real R);

		/****** Geom_CylindricalSurface::Transform ******/
		/****** md5 signature: b643be97d129c62226d788cd0501ced0 ******/
		%feature("compactdefaultargs") Transform;
		%feature("autodoc", "
Parameters
----------
T: gp_Trsf

Return
-------
None

Description
-----------
Applies the transformation T to this cylinder.
") Transform;
		void Transform(const gp_Trsf & T);

		/****** Geom_CylindricalSurface::TransformParameters ******/
		/****** md5 signature: 2d9e8651399bacbb299466ac222a6ca8 ******/
		%feature("compactdefaultargs") TransformParameters;
		%feature("autodoc", "
Parameters
----------
T: gp_Trsf

Return
-------
U: float
V: float

Description
-----------
Computes the parameters on the transformed surface for the transform of the point of parameters U,V on <self>. @code me->Transformed(T)->Value(U',V') @endcode is the same point as @code me->Value(U,V).Transformed(T) @endcode Where U',V' are the new values of U,V after calling @code me->TransformParameters(U,V,T) @endcode This method multiplies V by T.ScaleFactor().
") TransformParameters;
		virtual void TransformParameters(Standard_Real &OutValue, Standard_Real &OutValue, const gp_Trsf & T);

		/****** Geom_CylindricalSurface::UIso ******/
		/****** md5 signature: f5e8cbc22e32c38f4dd05caadff59fee ******/
		%feature("compactdefaultargs") UIso;
		%feature("autodoc", "
Parameters
----------
U: float

Return
-------
opencascade::handle<Geom_Curve>

Description
-----------
The UIso curve is a Line. The location point of this line is on the placement plane (XAxis, YAxis) of the surface. This line is parallel to the axis of symmetry of the surface.
") UIso;
		opencascade::handle<Geom_Curve> UIso(const Standard_Real U);

		/****** Geom_CylindricalSurface::UReversedParameter ******/
		/****** md5 signature: 0071925b176316f0aaaf26f369ac410c ******/
		%feature("compactdefaultargs") UReversedParameter;
		%feature("autodoc", "
Parameters
----------
U: float

Return
-------
float

Description
-----------
Return the parameter on the Ureversed surface for the point of parameter U on <self>. Return 2.PI - U.
") UReversedParameter;
		Standard_Real UReversedParameter(const Standard_Real U);

		/****** Geom_CylindricalSurface::VIso ******/
		/****** md5 signature: ef8726fc193d6cf33f54c94b9ed952a5 ******/
		%feature("compactdefaultargs") VIso;
		%feature("autodoc", "
Parameters
----------
V: float

Return
-------
opencascade::handle<Geom_Curve>

Description
-----------
The VIso curve is a circle. The start point of this circle (U = 0) is defined with the 'XAxis' of the surface. The center of the circle is on the symmetry axis.
") VIso;
		opencascade::handle<Geom_Curve> VIso(const Standard_Real V);

		/****** Geom_CylindricalSurface::VReversedParameter ******/
		/****** md5 signature: 92057d43e0e5ee078908582a4176343b ******/
		%feature("compactdefaultargs") VReversedParameter;
		%feature("autodoc", "
Parameters
----------
V: float

Return
-------
float

Description
-----------
Return the parameter on the Vreversed surface for the point of parameter V on <self>. Return -V.
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
		/****** Geom_Ellipse::Geom_Ellipse ******/
		/****** md5 signature: 4ed1f4cf090bb7910ba2709637d427fd ******/
		%feature("compactdefaultargs") Geom_Ellipse;
		%feature("autodoc", "
Parameters
----------
E: gp_Elips

Return
-------
None

Description
-----------
Constructs an ellipse by conversion of the gp_Elips ellipse E.
") Geom_Ellipse;
		 Geom_Ellipse(const gp_Elips & E);

		/****** Geom_Ellipse::Geom_Ellipse ******/
		/****** md5 signature: 3bd0e865627599f0fe69a1146fa5b72a ******/
		%feature("compactdefaultargs") Geom_Ellipse;
		%feature("autodoc", "
Parameters
----------
A2: gp_Ax2
MajorRadius: float
MinorRadius: float

Return
-------
None

Description
-----------
Constructs an ellipse defined by its major and minor radii, MajorRadius and MinorRadius, where A2 locates the ellipse and defines its orientation in 3D space such that: - the center of the ellipse is the origin of A2, - the 'X Direction' of A2 defines the major axis of the ellipse, i.e. the major radius MajorRadius is measured along this axis, - the 'Y Direction' of A2 defines the minor axis of the ellipse, i.e. the minor radius MinorRadius is measured along this axis, - A2 is the local coordinate system of the ellipse. Exceptions Standard_ConstructionError if: - MajorRadius is less than MinorRadius, or - MinorRadius is less than 0. Warning The Geom package does not prevent the construction of an ellipse where MajorRadius and MinorRadius are equal.
") Geom_Ellipse;
		 Geom_Ellipse(const gp_Ax2 & A2, const Standard_Real MajorRadius, const Standard_Real MinorRadius);

		/****** Geom_Ellipse::Copy ******/
		/****** md5 signature: 1360a3e0ea51e38ae19c71fb8aa1c4e9 ******/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom_Geometry>

Description
-----------
Creates a new object which is a copy of this ellipse.
") Copy;
		opencascade::handle<Geom_Geometry> Copy();

		/****** Geom_Ellipse::D0 ******/
		/****** md5 signature: 5f7d08d8d17afc516aac9ef64bf9711f ******/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "
Parameters
----------
U: float
P: gp_Pnt

Return
-------
None

Description
-----------
Returns in P the point of parameter U. P = C + MajorRadius * Cos (U) * XDir + MinorRadius * Sin (U) * YDir where C is the center of the ellipse , XDir the direction of the 'XAxis' and 'YDir' the 'YAxis' of the ellipse.
") D0;
		void D0(const Standard_Real U, gp_Pnt & P);

		/****** Geom_Ellipse::D1 ******/
		/****** md5 signature: 0264d3f49439e8cb4580d20449d25b51 ******/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "
Parameters
----------
U: float
P: gp_Pnt
V1: gp_Vec

Return
-------
None

Description
-----------
No available documentation.
") D1;
		void D1(const Standard_Real U, gp_Pnt & P, gp_Vec & V1);

		/****** Geom_Ellipse::D2 ******/
		/****** md5 signature: a694b4ba68c0fd83fbac79f945cb5d8c ******/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "
Parameters
----------
U: float
P: gp_Pnt
V1: gp_Vec
V2: gp_Vec

Return
-------
None

Description
-----------
Returns the point P of parameter U. The vectors V1 and V2 are the first and second derivatives at this point.
") D2;
		void D2(const Standard_Real U, gp_Pnt & P, gp_Vec & V1, gp_Vec & V2);

		/****** Geom_Ellipse::D3 ******/
		/****** md5 signature: cf1c3b5fe7af9d5c183c1b16b21c43f1 ******/
		%feature("compactdefaultargs") D3;
		%feature("autodoc", "
Parameters
----------
U: float
P: gp_Pnt
V1: gp_Vec
V2: gp_Vec
V3: gp_Vec

Return
-------
None

Description
-----------
Returns the point P of parameter U, the first second and third derivatives V1 V2 and V3.
") D3;
		void D3(const Standard_Real U, gp_Pnt & P, gp_Vec & V1, gp_Vec & V2, gp_Vec & V3);

		/****** Geom_Ellipse::DN ******/
		/****** md5 signature: 0d4a3e2fc2b4b03d2a49e0796a487efb ******/
		%feature("compactdefaultargs") DN;
		%feature("autodoc", "
Parameters
----------
U: float
N: int

Return
-------
gp_Vec

Description
-----------
For the point of parameter U of this ellipse, computes the vector corresponding to the Nth derivative. Exceptions Standard_RangeError if N is less than 1.
") DN;
		gp_Vec DN(const Standard_Real U, const Standard_Integer N);

		/****** Geom_Ellipse::Directrix1 ******/
		/****** md5 signature: 10272c6052549861204070aa44f046a5 ******/
		%feature("compactdefaultargs") Directrix1;
		%feature("autodoc", "Return
-------
gp_Ax1

Description
-----------
This directrix is the line normal to the XAxis of the ellipse in the local plane (Z = 0) at a distance d = MajorRadius / e from the center of the ellipse, where e is the eccentricity of the ellipse. This line is parallel to the 'YAxis'. The intersection point between directrix1 and the 'XAxis' is the 'Location' point of the directrix1. This point is on the positive side of the 'XAxis'. Raised if Eccentricity = 0.0. (The ellipse degenerates into a circle).
") Directrix1;
		gp_Ax1 Directrix1();

		/****** Geom_Ellipse::Directrix2 ******/
		/****** md5 signature: 88339a214155f2a41d76691fd00c9167 ******/
		%feature("compactdefaultargs") Directrix2;
		%feature("autodoc", "Return
-------
gp_Ax1

Description
-----------
This line is obtained by the symmetrical transformation of 'Directrix1' with respect to the 'YAxis' of the ellipse. //! Raised if Eccentricity = 0.0. (The ellipse degenerates into a circle).
") Directrix2;
		gp_Ax1 Directrix2();


        /****************** DumpJson ******************/
        %feature("autodoc", "
Parameters
----------
depth: int, default=-1

Return
-------
str

Description
-----------
Dump the object to JSON string.
") DumpJson;
        %extend{
            std::string DumpJson(int depth=-1) {
            std::stringstream s;
            self->DumpJson(s, depth);
            return "{" + s.str() + "}" ;}
        };
		/****** Geom_Ellipse::Eccentricity ******/
		/****** md5 signature: 7cc0cae0413ab4c2d528df125e42b57e ******/
		%feature("compactdefaultargs") Eccentricity;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the eccentricity of the ellipse between 0.0 and 1.0 If f is the distance between the center of the ellipse and the Focus1 then the eccentricity e = f / MajorRadius. Returns 0 if MajorRadius = 0.
") Eccentricity;
		Standard_Real Eccentricity();

		/****** Geom_Ellipse::Elips ******/
		/****** md5 signature: edb0fab3707edd8be995a5317ea6bab7 ******/
		%feature("compactdefaultargs") Elips;
		%feature("autodoc", "Return
-------
gp_Elips

Description
-----------
returns the non transient ellipse from gp with the same.
") Elips;
		gp_Elips Elips();

		/****** Geom_Ellipse::FirstParameter ******/
		/****** md5 signature: eb9ebe94572bd67588fe8811eac261fb ******/
		%feature("compactdefaultargs") FirstParameter;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the value of the first parameter of this ellipse. This is respectively: - 0.0, which gives the start point of this ellipse, or The start point and end point of an ellipse are coincident.
") FirstParameter;
		Standard_Real FirstParameter();

		/****** Geom_Ellipse::Focal ******/
		/****** md5 signature: 36c97a85b2e31ded83d59428f0f74c3c ******/
		%feature("compactdefaultargs") Focal;
		%feature("autodoc", "Return
-------
float

Description
-----------
Computes the focal distance. It is the distance between the the two focus of the ellipse.
") Focal;
		Standard_Real Focal();

		/****** Geom_Ellipse::Focus1 ******/
		/****** md5 signature: 44668390e44007b6344ae1f20fcc3003 ******/
		%feature("compactdefaultargs") Focus1;
		%feature("autodoc", "Return
-------
gp_Pnt

Description
-----------
Returns the first focus of the ellipse. This focus is on the positive side of the 'XAxis' of the ellipse.
") Focus1;
		gp_Pnt Focus1();

		/****** Geom_Ellipse::Focus2 ******/
		/****** md5 signature: 19e89a037d2bd912a8348a9c245bd935 ******/
		%feature("compactdefaultargs") Focus2;
		%feature("autodoc", "Return
-------
gp_Pnt

Description
-----------
Returns the second focus of the ellipse. This focus is on the negative side of the 'XAxis' of the ellipse.
") Focus2;
		gp_Pnt Focus2();

		/****** Geom_Ellipse::IsClosed ******/
		/****** md5 signature: 00978070ec4cb5f00d1d002a8d5d3763 ******/
		%feature("compactdefaultargs") IsClosed;
		%feature("autodoc", "Return
-------
bool

Description
-----------
return True.
") IsClosed;
		Standard_Boolean IsClosed();

		/****** Geom_Ellipse::IsPeriodic ******/
		/****** md5 signature: 15e3ccfd3ad4ae42959489f7f64aa8ca ******/
		%feature("compactdefaultargs") IsPeriodic;
		%feature("autodoc", "Return
-------
bool

Description
-----------
return True.
") IsPeriodic;
		Standard_Boolean IsPeriodic();

		/****** Geom_Ellipse::LastParameter ******/
		/****** md5 signature: cb4925a2d4a451ceec8f6ad486530f9c ******/
		%feature("compactdefaultargs") LastParameter;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the value of the last parameter of this ellipse. This is respectively: - 2.*Pi, which gives the end point of this ellipse. The start point and end point of an ellipse are coincident.
") LastParameter;
		Standard_Real LastParameter();

		/****** Geom_Ellipse::MajorRadius ******/
		/****** md5 signature: e961bb81456f4d0a6154d0e9401e1ce8 ******/
		%feature("compactdefaultargs") MajorRadius;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the major radius of this ellipse.
") MajorRadius;
		Standard_Real MajorRadius();

		/****** Geom_Ellipse::MinorRadius ******/
		/****** md5 signature: e1383e2287a25901af1e2b42cc95af4d ******/
		%feature("compactdefaultargs") MinorRadius;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the minor radius of this ellipse.
") MinorRadius;
		Standard_Real MinorRadius();

		/****** Geom_Ellipse::Parameter ******/
		/****** md5 signature: ecccdeaeaa0deed24f47e61ad75d24f1 ******/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns p = (1 - e * e) * MajorRadius where e is the eccentricity of the ellipse. Returns 0 if MajorRadius = 0.
") Parameter;
		Standard_Real Parameter();

		/****** Geom_Ellipse::ReversedParameter ******/
		/****** md5 signature: 382721d5a4ea752fecc12f03ab0de9a1 ******/
		%feature("compactdefaultargs") ReversedParameter;
		%feature("autodoc", "
Parameters
----------
U: float

Return
-------
float

Description
-----------
Computes the parameter on the reversed ellipse for the point of parameter U on this ellipse. For an ellipse, the returned value is: 2.*Pi - U.
") ReversedParameter;
		Standard_Real ReversedParameter(const Standard_Real U);

		/****** Geom_Ellipse::SetElips ******/
		/****** md5 signature: c0fbd702936a7b910f79d219ea0ca3da ******/
		%feature("compactdefaultargs") SetElips;
		%feature("autodoc", "
Parameters
----------
E: gp_Elips

Return
-------
None

Description
-----------
Converts the gp_Elips ellipse E into this ellipse.
") SetElips;
		void SetElips(const gp_Elips & E);

		/****** Geom_Ellipse::SetMajorRadius ******/
		/****** md5 signature: 5b6d39118ca624402ca904f240869d93 ******/
		%feature("compactdefaultargs") SetMajorRadius;
		%feature("autodoc", "
Parameters
----------
MajorRadius: float

Return
-------
None

Description
-----------
Assigns a value to the major radius of this ellipse. ConstructionError raised if MajorRadius < MinorRadius.
") SetMajorRadius;
		void SetMajorRadius(const Standard_Real MajorRadius);

		/****** Geom_Ellipse::SetMinorRadius ******/
		/****** md5 signature: 55b33932324c77b3c1e82a433bb9350f ******/
		%feature("compactdefaultargs") SetMinorRadius;
		%feature("autodoc", "
Parameters
----------
MinorRadius: float

Return
-------
None

Description
-----------
Assigns a value to the minor radius of this ellipse. ConstructionError raised if MajorRadius < MinorRadius or if MinorRadius < 0.
") SetMinorRadius;
		void SetMinorRadius(const Standard_Real MinorRadius);

		/****** Geom_Ellipse::Transform ******/
		/****** md5 signature: b643be97d129c62226d788cd0501ced0 ******/
		%feature("compactdefaultargs") Transform;
		%feature("autodoc", "
Parameters
----------
T: gp_Trsf

Return
-------
None

Description
-----------
Applies the transformation T to this ellipse.
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
		/****** Geom_Hyperbola::Geom_Hyperbola ******/
		/****** md5 signature: 8820b99f641f689ae7dd11efc0b0ae7b ******/
		%feature("compactdefaultargs") Geom_Hyperbola;
		%feature("autodoc", "
Parameters
----------
H: gp_Hypr

Return
-------
None

Description
-----------
Constructs a hyperbola by conversion of the gp_Hypr hyperbola H.
") Geom_Hyperbola;
		 Geom_Hyperbola(const gp_Hypr & H);

		/****** Geom_Hyperbola::Geom_Hyperbola ******/
		/****** md5 signature: 427f6f6ac1bbf02bd941d7596b4c05df ******/
		%feature("compactdefaultargs") Geom_Hyperbola;
		%feature("autodoc", "
Parameters
----------
A2: gp_Ax2
MajorRadius: float
MinorRadius: float

Return
-------
None

Description
-----------
Constructs a hyperbola defined by its major and minor radii, MajorRadius and MinorRadius, where A2 locates the hyperbola and defines its orientation in 3D space such that: - the center of the hyperbola is the origin of A2, - the 'X Direction' of A2 defines the major axis of the hyperbola, i.e. the major radius MajorRadius is measured along this axis, - the 'Y Direction' of A2 defines the minor axis of the hyperbola, i.e. the minor radius MinorRadius is measured along this axis, - A2 is the local coordinate system of the hyperbola. Exceptions Standard_ConstructionError if: - MajorRadius is less than 0.0, - MinorRadius is less than 0.0.
") Geom_Hyperbola;
		 Geom_Hyperbola(const gp_Ax2 & A2, const Standard_Real MajorRadius, const Standard_Real MinorRadius);

		/****** Geom_Hyperbola::Asymptote1 ******/
		/****** md5 signature: de14135c1ce647b5a9f90af716eea7a8 ******/
		%feature("compactdefaultargs") Asymptote1;
		%feature("autodoc", "Return
-------
gp_Ax1

Description
-----------
In the local coordinate system of the hyperbola the equation of the hyperbola is (X*X)/(A*A) - (Y*Y)/(B*B) = 1.0 and the equation of the first asymptote is Y = (B/A)*X. Raises ConstructionError if MajorRadius = 0.0.
") Asymptote1;
		gp_Ax1 Asymptote1();

		/****** Geom_Hyperbola::Asymptote2 ******/
		/****** md5 signature: 13c1b779412722927b3766066de238ea ******/
		%feature("compactdefaultargs") Asymptote2;
		%feature("autodoc", "Return
-------
gp_Ax1

Description
-----------
In the local coordinate system of the hyperbola the equation of the hyperbola is (X*X)/(A*A) - (Y*Y)/(B*B) = 1.0 and the equation of the first asymptote is Y = -(B/A)*X. Raises ConstructionError if MajorRadius = 0.0.
") Asymptote2;
		gp_Ax1 Asymptote2();

		/****** Geom_Hyperbola::ConjugateBranch1 ******/
		/****** md5 signature: 056e2135e75007339e6abcd54be7d73e ******/
		%feature("compactdefaultargs") ConjugateBranch1;
		%feature("autodoc", "Return
-------
gp_Hypr

Description
-----------
This branch of hyperbola is on the positive side of the YAxis of <self>.
") ConjugateBranch1;
		gp_Hypr ConjugateBranch1();

		/****** Geom_Hyperbola::ConjugateBranch2 ******/
		/****** md5 signature: e361e496e4cb0dd5e52876d78f726b91 ******/
		%feature("compactdefaultargs") ConjugateBranch2;
		%feature("autodoc", "Return
-------
gp_Hypr

Description
-----------
This branch of hyperbola is on the negative side of the YAxis of <self>. Note: The diagram given under the class purpose indicates where these two branches of hyperbola are positioned in relation to this branch of hyperbola.
") ConjugateBranch2;
		gp_Hypr ConjugateBranch2();

		/****** Geom_Hyperbola::Copy ******/
		/****** md5 signature: 1360a3e0ea51e38ae19c71fb8aa1c4e9 ******/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom_Geometry>

Description
-----------
Creates a new object which is a copy of this hyperbola.
") Copy;
		opencascade::handle<Geom_Geometry> Copy();

		/****** Geom_Hyperbola::D0 ******/
		/****** md5 signature: 5f7d08d8d17afc516aac9ef64bf9711f ******/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "
Parameters
----------
U: float
P: gp_Pnt

Return
-------
None

Description
-----------
Returns in P the point of parameter U. P = C + MajorRadius * Cosh (U) * XDir + MinorRadius * Sinh (U) * YDir where C is the center of the hyperbola , XDir the XDirection and YDir the YDirection of the hyperbola's local coordinate system.
") D0;
		void D0(const Standard_Real U, gp_Pnt & P);

		/****** Geom_Hyperbola::D1 ******/
		/****** md5 signature: 0264d3f49439e8cb4580d20449d25b51 ******/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "
Parameters
----------
U: float
P: gp_Pnt
V1: gp_Vec

Return
-------
None

Description
-----------
Returns the point P of parameter U and the first derivative V1.
") D1;
		void D1(const Standard_Real U, gp_Pnt & P, gp_Vec & V1);

		/****** Geom_Hyperbola::D2 ******/
		/****** md5 signature: a694b4ba68c0fd83fbac79f945cb5d8c ******/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "
Parameters
----------
U: float
P: gp_Pnt
V1: gp_Vec
V2: gp_Vec

Return
-------
None

Description
-----------
Returns the point P of parameter U, the first and second derivatives V1 and V2.
") D2;
		void D2(const Standard_Real U, gp_Pnt & P, gp_Vec & V1, gp_Vec & V2);

		/****** Geom_Hyperbola::D3 ******/
		/****** md5 signature: cf1c3b5fe7af9d5c183c1b16b21c43f1 ******/
		%feature("compactdefaultargs") D3;
		%feature("autodoc", "
Parameters
----------
U: float
P: gp_Pnt
V1: gp_Vec
V2: gp_Vec
V3: gp_Vec

Return
-------
None

Description
-----------
Returns the point P of parameter U, the first second and third derivatives V1 V2 and V3.
") D3;
		void D3(const Standard_Real U, gp_Pnt & P, gp_Vec & V1, gp_Vec & V2, gp_Vec & V3);

		/****** Geom_Hyperbola::DN ******/
		/****** md5 signature: 0d4a3e2fc2b4b03d2a49e0796a487efb ******/
		%feature("compactdefaultargs") DN;
		%feature("autodoc", "
Parameters
----------
U: float
N: int

Return
-------
gp_Vec

Description
-----------
The returned vector gives the value of the derivative for the order of derivation N. Raised if N < 1.
") DN;
		gp_Vec DN(const Standard_Real U, const Standard_Integer N);

		/****** Geom_Hyperbola::Directrix1 ******/
		/****** md5 signature: 10272c6052549861204070aa44f046a5 ******/
		%feature("compactdefaultargs") Directrix1;
		%feature("autodoc", "Return
-------
gp_Ax1

Description
-----------
This directrix is the line normal to the XAxis of the hyperbola in the local plane (Z = 0) at a distance d = MajorRadius / e from the center of the hyperbola, where e is the eccentricity of the hyperbola. This line is parallel to the YAxis. The intersection point between directrix1 and the XAxis is the location point of the directrix1. This point is on the positive side of the XAxis.
") Directrix1;
		gp_Ax1 Directrix1();

		/****** Geom_Hyperbola::Directrix2 ******/
		/****** md5 signature: 88339a214155f2a41d76691fd00c9167 ******/
		%feature("compactdefaultargs") Directrix2;
		%feature("autodoc", "Return
-------
gp_Ax1

Description
-----------
This line is obtained by the symmetrical transformation of 'directrix1' with respect to the YAxis of the hyperbola.
") Directrix2;
		gp_Ax1 Directrix2();


        /****************** DumpJson ******************/
        %feature("autodoc", "
Parameters
----------
depth: int, default=-1

Return
-------
str

Description
-----------
Dump the object to JSON string.
") DumpJson;
        %extend{
            std::string DumpJson(int depth=-1) {
            std::stringstream s;
            self->DumpJson(s, depth);
            return "{" + s.str() + "}" ;}
        };
		/****** Geom_Hyperbola::Eccentricity ******/
		/****** md5 signature: 7cc0cae0413ab4c2d528df125e42b57e ******/
		%feature("compactdefaultargs") Eccentricity;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the eccentricity of the hyperbola (e > 1). If f is the distance between the location of the hyperbola and the Focus1 then the eccentricity e = f / MajorRadius. raised if MajorRadius = 0.0.
") Eccentricity;
		Standard_Real Eccentricity();

		/****** Geom_Hyperbola::FirstParameter ******/
		/****** md5 signature: eb9ebe94572bd67588fe8811eac261fb ******/
		%feature("compactdefaultargs") FirstParameter;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns RealFirst from Standard.
") FirstParameter;
		Standard_Real FirstParameter();

		/****** Geom_Hyperbola::Focal ******/
		/****** md5 signature: 36c97a85b2e31ded83d59428f0f74c3c ******/
		%feature("compactdefaultargs") Focal;
		%feature("autodoc", "Return
-------
float

Description
-----------
Computes the focal distance. It is the distance between the two focus of the hyperbola.
") Focal;
		Standard_Real Focal();

		/****** Geom_Hyperbola::Focus1 ******/
		/****** md5 signature: 44668390e44007b6344ae1f20fcc3003 ******/
		%feature("compactdefaultargs") Focus1;
		%feature("autodoc", "Return
-------
gp_Pnt

Description
-----------
Returns the first focus of the hyperbola. This focus is on the positive side of the XAxis of the hyperbola.
") Focus1;
		gp_Pnt Focus1();

		/****** Geom_Hyperbola::Focus2 ******/
		/****** md5 signature: 19e89a037d2bd912a8348a9c245bd935 ******/
		%feature("compactdefaultargs") Focus2;
		%feature("autodoc", "Return
-------
gp_Pnt

Description
-----------
Returns the second focus of the hyperbola. This focus is on the negative side of the XAxis of the hyperbola.
") Focus2;
		gp_Pnt Focus2();

		/****** Geom_Hyperbola::Hypr ******/
		/****** md5 signature: d8375ffbe37ad2146eb3a7adf1050f3c ******/
		%feature("compactdefaultargs") Hypr;
		%feature("autodoc", "Return
-------
gp_Hypr

Description
-----------
returns the non transient parabola from gp with the same geometric properties as <self>.
") Hypr;
		gp_Hypr Hypr();

		/****** Geom_Hyperbola::IsClosed ******/
		/****** md5 signature: 00978070ec4cb5f00d1d002a8d5d3763 ******/
		%feature("compactdefaultargs") IsClosed;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns False.
") IsClosed;
		Standard_Boolean IsClosed();

		/****** Geom_Hyperbola::IsPeriodic ******/
		/****** md5 signature: 15e3ccfd3ad4ae42959489f7f64aa8ca ******/
		%feature("compactdefaultargs") IsPeriodic;
		%feature("autodoc", "Return
-------
bool

Description
-----------
return False for an hyperbola.
") IsPeriodic;
		Standard_Boolean IsPeriodic();

		/****** Geom_Hyperbola::LastParameter ******/
		/****** md5 signature: cb4925a2d4a451ceec8f6ad486530f9c ******/
		%feature("compactdefaultargs") LastParameter;
		%feature("autodoc", "Return
-------
float

Description
-----------
returns RealLast from Standard.
") LastParameter;
		Standard_Real LastParameter();

		/****** Geom_Hyperbola::MajorRadius ******/
		/****** md5 signature: e961bb81456f4d0a6154d0e9401e1ce8 ******/
		%feature("compactdefaultargs") MajorRadius;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the major or minor radius of this hyperbola. The major radius is also the distance between the center of the hyperbola and the apex of the main branch (located on the 'X Axis' of the hyperbola).
") MajorRadius;
		Standard_Real MajorRadius();

		/****** Geom_Hyperbola::MinorRadius ******/
		/****** md5 signature: e1383e2287a25901af1e2b42cc95af4d ******/
		%feature("compactdefaultargs") MinorRadius;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the major or minor radius of this hyperbola. The minor radius is also the distance between the center of the hyperbola and the apex of a conjugate branch (located on the 'Y Axis' of the hyperbola).
") MinorRadius;
		Standard_Real MinorRadius();

		/****** Geom_Hyperbola::OtherBranch ******/
		/****** md5 signature: e3f08eb290c33f5759deca11d2e4aa65 ******/
		%feature("compactdefaultargs") OtherBranch;
		%feature("autodoc", "Return
-------
gp_Hypr

Description
-----------
Computes the 'other' branch of this hyperbola. This is the symmetrical branch with respect to the center of this hyperbola. Note: The diagram given under the class purpose indicates where the 'other' branch is positioned in relation to this branch of the hyperbola.
") OtherBranch;
		gp_Hypr OtherBranch();

		/****** Geom_Hyperbola::Parameter ******/
		/****** md5 signature: ecccdeaeaa0deed24f47e61ad75d24f1 ******/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns p = (e * e - 1) * MajorRadius where e is the eccentricity of the hyperbola. raised if MajorRadius = 0.0.
") Parameter;
		Standard_Real Parameter();

		/****** Geom_Hyperbola::ReversedParameter ******/
		/****** md5 signature: 382721d5a4ea752fecc12f03ab0de9a1 ******/
		%feature("compactdefaultargs") ReversedParameter;
		%feature("autodoc", "
Parameters
----------
U: float

Return
-------
float

Description
-----------
Computes the parameter on the reversed hyperbola, for the point of parameter U on this hyperbola. For a hyperbola, the returned value is: -U.
") ReversedParameter;
		Standard_Real ReversedParameter(const Standard_Real U);

		/****** Geom_Hyperbola::SetHypr ******/
		/****** md5 signature: c2958419f8bbf226a53a28e6cfcbc792 ******/
		%feature("compactdefaultargs") SetHypr;
		%feature("autodoc", "
Parameters
----------
H: gp_Hypr

Return
-------
None

Description
-----------
Converts the gp_Hypr hyperbola H into this hyperbola.
") SetHypr;
		void SetHypr(const gp_Hypr & H);

		/****** Geom_Hyperbola::SetMajorRadius ******/
		/****** md5 signature: 5b6d39118ca624402ca904f240869d93 ******/
		%feature("compactdefaultargs") SetMajorRadius;
		%feature("autodoc", "
Parameters
----------
MajorRadius: float

Return
-------
None

Description
-----------
Assigns a value to the major radius of this hyperbola. Exceptions Standard_ConstructionError if: - MajorRadius is less than 0.0, or - MinorRadius is less than 0.0.Raised if MajorRadius < 0.0.
") SetMajorRadius;
		void SetMajorRadius(const Standard_Real MajorRadius);

		/****** Geom_Hyperbola::SetMinorRadius ******/
		/****** md5 signature: 55b33932324c77b3c1e82a433bb9350f ******/
		%feature("compactdefaultargs") SetMinorRadius;
		%feature("autodoc", "
Parameters
----------
MinorRadius: float

Return
-------
None

Description
-----------
Assigns a value to the minor radius of this hyperbola. Exceptions Standard_ConstructionError if: - MajorRadius is less than 0.0, or - MinorRadius is less than 0.0.Raised if MajorRadius < 0.0.
") SetMinorRadius;
		void SetMinorRadius(const Standard_Real MinorRadius);

		/****** Geom_Hyperbola::Transform ******/
		/****** md5 signature: b643be97d129c62226d788cd0501ced0 ******/
		%feature("compactdefaultargs") Transform;
		%feature("autodoc", "
Parameters
----------
T: gp_Trsf

Return
-------
None

Description
-----------
Applies the transformation T to this hyperbola.
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
		/****** Geom_Parabola::Geom_Parabola ******/
		/****** md5 signature: d5bb0de72e68f88451c8d2b062eb5ab1 ******/
		%feature("compactdefaultargs") Geom_Parabola;
		%feature("autodoc", "
Parameters
----------
Prb: gp_Parab

Return
-------
None

Description
-----------
Creates a parabola from a non transient one.
") Geom_Parabola;
		 Geom_Parabola(const gp_Parab & Prb);

		/****** Geom_Parabola::Geom_Parabola ******/
		/****** md5 signature: 30e7a439bb87bdaf52aeb60ee7bba4dc ******/
		%feature("compactdefaultargs") Geom_Parabola;
		%feature("autodoc", "
Parameters
----------
A2: gp_Ax2
Focal: float

Return
-------
None

Description
-----------
Creates a parabola with its local coordinate system 'A2' and it's focal length 'Focal'. The XDirection of A2 defines the axis of symmetry of the parabola. The YDirection of A2 is parallel to the directrix of the parabola. The Location point of A2 is the vertex of the parabola Raised if Focal < 0.0.
") Geom_Parabola;
		 Geom_Parabola(const gp_Ax2 & A2, const Standard_Real Focal);

		/****** Geom_Parabola::Geom_Parabola ******/
		/****** md5 signature: 3e715743cb09ef5f9513e9452fe92251 ******/
		%feature("compactdefaultargs") Geom_Parabola;
		%feature("autodoc", "
Parameters
----------
D: gp_Ax1
F: gp_Pnt

Return
-------
None

Description
-----------
D is the directrix of the parabola and F the focus point. The symmetry axis (XAxis) of the parabola is normal to the directrix and pass through the focus point F, but its location point is the vertex of the parabola. The YAxis of the parabola is parallel to D and its location point is the vertex of the parabola. The normal to the plane of the parabola is the cross product between the XAxis and the YAxis.
") Geom_Parabola;
		 Geom_Parabola(const gp_Ax1 & D, const gp_Pnt & F);

		/****** Geom_Parabola::Copy ******/
		/****** md5 signature: 1360a3e0ea51e38ae19c71fb8aa1c4e9 ******/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom_Geometry>

Description
-----------
Creates a new object which is a copy of this parabola.
") Copy;
		opencascade::handle<Geom_Geometry> Copy();

		/****** Geom_Parabola::D0 ******/
		/****** md5 signature: 5f7d08d8d17afc516aac9ef64bf9711f ******/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "
Parameters
----------
U: float
P: gp_Pnt

Return
-------
None

Description
-----------
Returns in P the point of parameter U. If U = 0 the returned point is the origin of the XAxis and the YAxis of the parabola and it is the vertex of the parabola. P = S + F * (U * U * XDir + * U * YDir) where S is the vertex of the parabola, XDir the XDirection and YDir the YDirection of the parabola's local coordinate system.
") D0;
		void D0(const Standard_Real U, gp_Pnt & P);

		/****** Geom_Parabola::D1 ******/
		/****** md5 signature: 0264d3f49439e8cb4580d20449d25b51 ******/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "
Parameters
----------
U: float
P: gp_Pnt
V1: gp_Vec

Return
-------
None

Description
-----------
Returns the point P of parameter U and the first derivative V1.
") D1;
		void D1(const Standard_Real U, gp_Pnt & P, gp_Vec & V1);

		/****** Geom_Parabola::D2 ******/
		/****** md5 signature: a694b4ba68c0fd83fbac79f945cb5d8c ******/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "
Parameters
----------
U: float
P: gp_Pnt
V1: gp_Vec
V2: gp_Vec

Return
-------
None

Description
-----------
Returns the point P of parameter U, the first and second derivatives V1 and V2.
") D2;
		void D2(const Standard_Real U, gp_Pnt & P, gp_Vec & V1, gp_Vec & V2);

		/****** Geom_Parabola::D3 ******/
		/****** md5 signature: cf1c3b5fe7af9d5c183c1b16b21c43f1 ******/
		%feature("compactdefaultargs") D3;
		%feature("autodoc", "
Parameters
----------
U: float
P: gp_Pnt
V1: gp_Vec
V2: gp_Vec
V3: gp_Vec

Return
-------
None

Description
-----------
Returns the point P of parameter U, the first second and third derivatives V1 V2 and V3.
") D3;
		void D3(const Standard_Real U, gp_Pnt & P, gp_Vec & V1, gp_Vec & V2, gp_Vec & V3);

		/****** Geom_Parabola::DN ******/
		/****** md5 signature: 0d4a3e2fc2b4b03d2a49e0796a487efb ******/
		%feature("compactdefaultargs") DN;
		%feature("autodoc", "
Parameters
----------
U: float
N: int

Return
-------
gp_Vec

Description
-----------
For the point of parameter U of this parabola, computes the vector corresponding to the Nth derivative. Exceptions Standard_RangeError if N is less than 1.
") DN;
		gp_Vec DN(const Standard_Real U, const Standard_Integer N);

		/****** Geom_Parabola::Directrix ******/
		/****** md5 signature: 1608f5c20dd70d6d9961c85822ba9a57 ******/
		%feature("compactdefaultargs") Directrix;
		%feature("autodoc", "Return
-------
gp_Ax1

Description
-----------
Computes the directrix of this parabola. This is a line normal to the axis of symmetry, in the plane of this parabola, located on the negative side of its axis of symmetry, at a distance from the apex equal to the focal length. The directrix is returned as an axis (gp_Ax1 object), where the origin is located on the 'X Axis' of this parabola.
") Directrix;
		gp_Ax1 Directrix();


        /****************** DumpJson ******************/
        %feature("autodoc", "
Parameters
----------
depth: int, default=-1

Return
-------
str

Description
-----------
Dump the object to JSON string.
") DumpJson;
        %extend{
            std::string DumpJson(int depth=-1) {
            std::stringstream s;
            self->DumpJson(s, depth);
            return "{" + s.str() + "}" ;}
        };
		/****** Geom_Parabola::Eccentricity ******/
		/****** md5 signature: 7cc0cae0413ab4c2d528df125e42b57e ******/
		%feature("compactdefaultargs") Eccentricity;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns 1. (which is the eccentricity of any parabola).
") Eccentricity;
		Standard_Real Eccentricity();

		/****** Geom_Parabola::FirstParameter ******/
		/****** md5 signature: eb9ebe94572bd67588fe8811eac261fb ******/
		%feature("compactdefaultargs") FirstParameter;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the value of the first or last parameter of this parabola. This is, respectively: - Standard_Real::RealFirst(), or - Standard_Real::RealLast().
") FirstParameter;
		Standard_Real FirstParameter();

		/****** Geom_Parabola::Focal ******/
		/****** md5 signature: 36c97a85b2e31ded83d59428f0f74c3c ******/
		%feature("compactdefaultargs") Focal;
		%feature("autodoc", "Return
-------
float

Description
-----------
Computes the focal distance of this parabola The focal distance is the distance between the apex and the focus of the parabola.
") Focal;
		Standard_Real Focal();

		/****** Geom_Parabola::Focus ******/
		/****** md5 signature: dfde257d151e75b4057f91980799f5e1 ******/
		%feature("compactdefaultargs") Focus;
		%feature("autodoc", "Return
-------
gp_Pnt

Description
-----------
Computes the focus of this parabola. The focus is on the positive side of the 'X Axis' of the local coordinate system of the parabola.
") Focus;
		gp_Pnt Focus();

		/****** Geom_Parabola::IsClosed ******/
		/****** md5 signature: 00978070ec4cb5f00d1d002a8d5d3763 ******/
		%feature("compactdefaultargs") IsClosed;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns False.
") IsClosed;
		Standard_Boolean IsClosed();

		/****** Geom_Parabola::IsPeriodic ******/
		/****** md5 signature: 15e3ccfd3ad4ae42959489f7f64aa8ca ******/
		%feature("compactdefaultargs") IsPeriodic;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns False.
") IsPeriodic;
		Standard_Boolean IsPeriodic();

		/****** Geom_Parabola::LastParameter ******/
		/****** md5 signature: cb4925a2d4a451ceec8f6ad486530f9c ******/
		%feature("compactdefaultargs") LastParameter;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the value of the first or last parameter of this parabola. This is, respectively: - Standard_Real::RealFirst(), or - Standard_Real::RealLast().
") LastParameter;
		Standard_Real LastParameter();

		/****** Geom_Parabola::Parab ******/
		/****** md5 signature: 257cf820f8e80528c6bff34f838212c6 ******/
		%feature("compactdefaultargs") Parab;
		%feature("autodoc", "Return
-------
gp_Parab

Description
-----------
Returns the non transient parabola from gp with the same geometric properties as <self>.
") Parab;
		gp_Parab Parab();

		/****** Geom_Parabola::Parameter ******/
		/****** md5 signature: ecccdeaeaa0deed24f47e61ad75d24f1 ******/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "Return
-------
float

Description
-----------
Computes the parameter of this parabola which is the distance between its focus and its directrix. This distance is twice the focal length. If P is the parameter of the parabola, the equation of the parabola in its local coordinate system is: Y**2 = 2.*P*X.
") Parameter;
		Standard_Real Parameter();

		/****** Geom_Parabola::ParametricTransformation ******/
		/****** md5 signature: e3749cc07a54624f5dc3f6abf7103443 ******/
		%feature("compactdefaultargs") ParametricTransformation;
		%feature("autodoc", "
Parameters
----------
T: gp_Trsf

Return
-------
float

Description
-----------
Returns a coefficient to compute the parameter on the transformed curve for the transform of the point on <self>. //! Transformed(T)->Value(U * ParametricTransformation(T)) //! is the same point as //! Value(U).Transformed(T) //! This methods returns T.ScaleFactor().
") ParametricTransformation;
		Standard_Real ParametricTransformation(const gp_Trsf & T);

		/****** Geom_Parabola::ReversedParameter ******/
		/****** md5 signature: 382721d5a4ea752fecc12f03ab0de9a1 ******/
		%feature("compactdefaultargs") ReversedParameter;
		%feature("autodoc", "
Parameters
----------
U: float

Return
-------
float

Description
-----------
Computes the parameter on the reversed parabola, for the point of parameter U on this parabola. For a parabola, the returned value is: -U.
") ReversedParameter;
		Standard_Real ReversedParameter(const Standard_Real U);

		/****** Geom_Parabola::SetFocal ******/
		/****** md5 signature: b79f368485f4739b39b65cdd8789fb05 ******/
		%feature("compactdefaultargs") SetFocal;
		%feature("autodoc", "
Parameters
----------
Focal: float

Return
-------
None

Description
-----------
Assigns the value Focal to the focal distance of this parabola. Exceptions Standard_ConstructionError if Focal is negative.
") SetFocal;
		void SetFocal(const Standard_Real Focal);

		/****** Geom_Parabola::SetParab ******/
		/****** md5 signature: bbdf18772ba2eb13af3515334f2070d8 ******/
		%feature("compactdefaultargs") SetParab;
		%feature("autodoc", "
Parameters
----------
Prb: gp_Parab

Return
-------
None

Description
-----------
Converts the gp_Parab parabola Prb into this parabola.
") SetParab;
		void SetParab(const gp_Parab & Prb);

		/****** Geom_Parabola::Transform ******/
		/****** md5 signature: b643be97d129c62226d788cd0501ced0 ******/
		%feature("compactdefaultargs") Transform;
		%feature("autodoc", "
Parameters
----------
T: gp_Trsf

Return
-------
None

Description
-----------
Applies the transformation T to this parabola.
") Transform;
		void Transform(const gp_Trsf & T);

		/****** Geom_Parabola::TransformedParameter ******/
		/****** md5 signature: ab2014ea10ce915fb745e74cd1fc4a6d ******/
		%feature("compactdefaultargs") TransformedParameter;
		%feature("autodoc", "
Parameters
----------
U: float
T: gp_Trsf

Return
-------
float

Description
-----------
Returns the parameter on the transformed curve for the transform of the point of parameter U on <self>. //! me->Transformed(T)->Value(me->TransformedParameter(U,T)) //! is the same point as //! me->Value(U).Transformed(T) //! This methods returns <U> * T.ScaleFactor().
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
		/****** Geom_Plane::Geom_Plane ******/
		/****** md5 signature: d1c94b78536f80ccbd2832ae7fbbc02c ******/
		%feature("compactdefaultargs") Geom_Plane;
		%feature("autodoc", "
Parameters
----------
A3: gp_Ax3

Return
-------
None

Description
-----------
Creates a plane located in 3D space with an axis placement three axis. The 'ZDirection' of 'A3' is the direction normal to the plane. The 'Location' point of 'A3' is the origin of the plane. The 'XDirection' and 'YDirection' of 'A3' define the directions of the U isoparametric and V isoparametric curves.
") Geom_Plane;
		 Geom_Plane(const gp_Ax3 & A3);

		/****** Geom_Plane::Geom_Plane ******/
		/****** md5 signature: 19e9bf30f8290a183157d035825735ec ******/
		%feature("compactdefaultargs") Geom_Plane;
		%feature("autodoc", "
Parameters
----------
Pl: gp_Pln

Return
-------
None

Description
-----------
Creates a plane from a non transient plane from package gp.
") Geom_Plane;
		 Geom_Plane(const gp_Pln & Pl);

		/****** Geom_Plane::Geom_Plane ******/
		/****** md5 signature: 10d9a4150b93047f057f04737f57dc39 ******/
		%feature("compactdefaultargs") Geom_Plane;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt
V: gp_Dir

Return
-------
None

Description
-----------
P is the 'Location' point or origin of the plane. V is the direction normal to the plane.
") Geom_Plane;
		 Geom_Plane(const gp_Pnt & P, const gp_Dir & V);

		/****** Geom_Plane::Geom_Plane ******/
		/****** md5 signature: 06c0ffe19922feef3a5e812341930d38 ******/
		%feature("compactdefaultargs") Geom_Plane;
		%feature("autodoc", "
Parameters
----------
A: float
B: float
C: float
D: float

Return
-------
None

Description
-----------
Creates a plane from its cartesian equation: @code Ax + By + Cz + D = 0.0 @endcode Raised if Sqrt (A*A + B*B + C*C) <= Resolution from gp.
") Geom_Plane;
		 Geom_Plane(const Standard_Real A, const Standard_Real B, const Standard_Real C, const Standard_Real D);

		/****** Geom_Plane::Bounds ******/
		/****** md5 signature: bbc36976e796eedf3c69513e986f2adb ******/
		%feature("compactdefaultargs") Bounds;
		%feature("autodoc", "
Parameters
----------

Return
-------
U1: float
U2: float
V1: float
V2: float

Description
-----------
Returns the parametric bounds U1, U2, V1 and V2 of this plane. Because a plane is an infinite surface, the following is always true: - U1 = V1 = Standard_Real::RealFirst() - U2 = V2 = Standard_Real::RealLast().
") Bounds;
		void Bounds(Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** Geom_Plane::Coefficients ******/
		/****** md5 signature: 5b10aec82a9daa5f313dd60e84b2b00b ******/
		%feature("compactdefaultargs") Coefficients;
		%feature("autodoc", "
Parameters
----------

Return
-------
A: float
B: float
C: float
D: float

Description
-----------
Computes the normalized coefficients of the plane's cartesian equation: @code Ax + By + Cz + D = 0.0 @endcode.
") Coefficients;
		void Coefficients(Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** Geom_Plane::Copy ******/
		/****** md5 signature: 1360a3e0ea51e38ae19c71fb8aa1c4e9 ******/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom_Geometry>

Description
-----------
Creates a new object which is a copy of this plane.
") Copy;
		opencascade::handle<Geom_Geometry> Copy();

		/****** Geom_Plane::D0 ******/
		/****** md5 signature: 909f7ecc223d561155c9c3ba4b8e7b64 ******/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "
Parameters
----------
U: float
V: float
P: gp_Pnt

Return
-------
None

Description
-----------
Computes the point P (U, V) on <self>. @code P = O + U * XDir + V * YDir. @endcode where O is the 'Location' point of the plane, XDir the 'XDirection' and YDir the 'YDirection' of the plane's local coordinate system.
") D0;
		void D0(const Standard_Real U, const Standard_Real V, gp_Pnt & P);

		/****** Geom_Plane::D1 ******/
		/****** md5 signature: 0868b105367e01c443402a5728aa3395 ******/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "
Parameters
----------
U: float
V: float
P: gp_Pnt
D1U: gp_Vec
D1V: gp_Vec

Return
-------
None

Description
-----------
Computes the current point and the first derivatives in the directions U and V.
") D1;
		void D1(const Standard_Real U, const Standard_Real V, gp_Pnt & P, gp_Vec & D1U, gp_Vec & D1V);

		/****** Geom_Plane::D2 ******/
		/****** md5 signature: 5bdb029d3f1561c55d7ab1d1b0b0282a ******/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "
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

Return
-------
None

Description
-----------
Computes the current point, the first and the second derivatives in the directions U and V.
") D2;
		void D2(const Standard_Real U, const Standard_Real V, gp_Pnt & P, gp_Vec & D1U, gp_Vec & D1V, gp_Vec & D2U, gp_Vec & D2V, gp_Vec & D2UV);

		/****** Geom_Plane::D3 ******/
		/****** md5 signature: 2fbd4d1b6bb5f19034b05b5a6e0ddec0 ******/
		%feature("compactdefaultargs") D3;
		%feature("autodoc", "
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

Return
-------
None

Description
-----------
Computes the current point, the first,the second and the third derivatives in the directions U and V.
") D3;
		void D3(const Standard_Real U, const Standard_Real V, gp_Pnt & P, gp_Vec & D1U, gp_Vec & D1V, gp_Vec & D2U, gp_Vec & D2V, gp_Vec & D2UV, gp_Vec & D3U, gp_Vec & D3V, gp_Vec & D3UUV, gp_Vec & D3UVV);

		/****** Geom_Plane::DN ******/
		/****** md5 signature: 78200f5fa5a4060f4022c2e3d9d8ac0e ******/
		%feature("compactdefaultargs") DN;
		%feature("autodoc", "
Parameters
----------
U: float
V: float
Nu: int
Nv: int

Return
-------
gp_Vec

Description
-----------
Computes the derivative of order Nu in the direction u and Nv in the direction v. Raised if Nu + Nv < 1 or Nu < 0 or Nv < 0.
") DN;
		gp_Vec DN(const Standard_Real U, const Standard_Real V, const Standard_Integer Nu, const Standard_Integer Nv);


        /****************** DumpJson ******************/
        %feature("autodoc", "
Parameters
----------
depth: int, default=-1

Return
-------
str

Description
-----------
Dump the object to JSON string.
") DumpJson;
        %extend{
            std::string DumpJson(int depth=-1) {
            std::stringstream s;
            self->DumpJson(s, depth);
            return "{" + s.str() + "}" ;}
        };
		/****** Geom_Plane::IsUClosed ******/
		/****** md5 signature: d1e8bae29b90dc447f4693c94ad31c37 ******/
		%feature("compactdefaultargs") IsUClosed;
		%feature("autodoc", "Return
-------
bool

Description
-----------
return False.
") IsUClosed;
		Standard_Boolean IsUClosed();

		/****** Geom_Plane::IsUPeriodic ******/
		/****** md5 signature: 91acb028d6850ac4bbf00dc198b558b7 ******/
		%feature("compactdefaultargs") IsUPeriodic;
		%feature("autodoc", "Return
-------
bool

Description
-----------
return False.
") IsUPeriodic;
		Standard_Boolean IsUPeriodic();

		/****** Geom_Plane::IsVClosed ******/
		/****** md5 signature: aa0eae8155ddef3e9f1d0cc573955bb6 ******/
		%feature("compactdefaultargs") IsVClosed;
		%feature("autodoc", "Return
-------
bool

Description
-----------
return False.
") IsVClosed;
		Standard_Boolean IsVClosed();

		/****** Geom_Plane::IsVPeriodic ******/
		/****** md5 signature: 88e9b94f2ab4a3d73c3fe787315e4448 ******/
		%feature("compactdefaultargs") IsVPeriodic;
		%feature("autodoc", "Return
-------
bool

Description
-----------
return False.
") IsVPeriodic;
		Standard_Boolean IsVPeriodic();

		/****** Geom_Plane::ParametricTransformation ******/
		/****** md5 signature: 019b69215b9dcafd8e9b0052b449ea05 ******/
		%feature("compactdefaultargs") ParametricTransformation;
		%feature("autodoc", "
Parameters
----------
T: gp_Trsf

Return
-------
gp_GTrsf2d

Description
-----------
Returns a 2d transformation used to find the new parameters of a point on the transformed surface. @code me->Transformed(T)->Value(U',V') @endcode is the same point as @code me->Value(U,V).Transformed(T) @endcode Where U',V' are obtained by transforming U,V with the 2d transformation returned by @code me->ParametricTransformation(T) @endcode This method returns a scale centered on the origin with T.ScaleFactor.
") ParametricTransformation;
		virtual gp_GTrsf2d ParametricTransformation(const gp_Trsf & T);

		/****** Geom_Plane::Pln ******/
		/****** md5 signature: cb90d57e82c29a723470cfc56b2b22df ******/
		%feature("compactdefaultargs") Pln;
		%feature("autodoc", "Return
-------
gp_Pln

Description
-----------
Converts this plane into a gp_Pln plane.
") Pln;
		gp_Pln Pln();

		/****** Geom_Plane::SetPln ******/
		/****** md5 signature: 003b2c83d02e2285fb08112c43dec848 ******/
		%feature("compactdefaultargs") SetPln;
		%feature("autodoc", "
Parameters
----------
Pl: gp_Pln

Return
-------
None

Description
-----------
Set <self> so that <self> has the same geometric properties as Pl.
") SetPln;
		void SetPln(const gp_Pln & Pl);

		/****** Geom_Plane::Transform ******/
		/****** md5 signature: b643be97d129c62226d788cd0501ced0 ******/
		%feature("compactdefaultargs") Transform;
		%feature("autodoc", "
Parameters
----------
T: gp_Trsf

Return
-------
None

Description
-----------
Applies the transformation T to this plane.
") Transform;
		void Transform(const gp_Trsf & T);

		/****** Geom_Plane::TransformParameters ******/
		/****** md5 signature: 2d9e8651399bacbb299466ac222a6ca8 ******/
		%feature("compactdefaultargs") TransformParameters;
		%feature("autodoc", "
Parameters
----------
T: gp_Trsf

Return
-------
U: float
V: float

Description
-----------
Computes the parameters on the transformed surface for the transform of the point of parameters U,V on <self>. @code me->Transformed(T)->Value(U',V') @endcode is the same point as @code me->Value(U,V).Transformed(T) @endcode Where U',V' are the new values of U,V after calling @code me->TransformParameters(U,V,T) @endcode This method multiplies U and V by T.ScaleFactor().
") TransformParameters;
		virtual void TransformParameters(Standard_Real &OutValue, Standard_Real &OutValue, const gp_Trsf & T);

		/****** Geom_Plane::UIso ******/
		/****** md5 signature: f5e8cbc22e32c38f4dd05caadff59fee ******/
		%feature("compactdefaultargs") UIso;
		%feature("autodoc", "
Parameters
----------
U: float

Return
-------
opencascade::handle<Geom_Curve>

Description
-----------
Computes the U isoparametric curve. This is a Line parallel to the YAxis of the plane.
") UIso;
		opencascade::handle<Geom_Curve> UIso(const Standard_Real U);

		/****** Geom_Plane::UReverse ******/
		/****** md5 signature: d70147d3bce5fe1e36771349f34ded17 ******/
		%feature("compactdefaultargs") UReverse;
		%feature("autodoc", "Return
-------
None

Description
-----------
Changes the orientation of this plane in the u (or v) parametric direction. The bounds of the plane are not changed but the given parametric direction is reversed. Hence the orientation of the surface is reversed.
") UReverse;
		virtual void UReverse();

		/****** Geom_Plane::UReversedParameter ******/
		/****** md5 signature: 0071925b176316f0aaaf26f369ac410c ******/
		%feature("compactdefaultargs") UReversedParameter;
		%feature("autodoc", "
Parameters
----------
U: float

Return
-------
float

Description
-----------
Computes the u parameter on the modified plane, produced when reversing the u parametric of this plane, for any point of u parameter U on this plane. In the case of a plane, these methods return - -U.
") UReversedParameter;
		Standard_Real UReversedParameter(const Standard_Real U);

		/****** Geom_Plane::VIso ******/
		/****** md5 signature: ef8726fc193d6cf33f54c94b9ed952a5 ******/
		%feature("compactdefaultargs") VIso;
		%feature("autodoc", "
Parameters
----------
V: float

Return
-------
opencascade::handle<Geom_Curve>

Description
-----------
Computes the V isoparametric curve. This is a Line parallel to the XAxis of the plane.
") VIso;
		opencascade::handle<Geom_Curve> VIso(const Standard_Real V);

		/****** Geom_Plane::VReverse ******/
		/****** md5 signature: 60a0c07d53675378b2bcbe23d1e7e281 ******/
		%feature("compactdefaultargs") VReverse;
		%feature("autodoc", "Return
-------
None

Description
-----------
Changes the orientation of this plane in the u (or v) parametric direction. The bounds of the plane are not changed but the given parametric direction is reversed. Hence the orientation of the surface is reversed.
") VReverse;
		virtual void VReverse();

		/****** Geom_Plane::VReversedParameter ******/
		/****** md5 signature: 92057d43e0e5ee078908582a4176343b ******/
		%feature("compactdefaultargs") VReversedParameter;
		%feature("autodoc", "
Parameters
----------
V: float

Return
-------
float

Description
-----------
Computes the v parameter on the modified plane, produced when reversing the v parametric of this plane, for any point of v parameter V on this plane. In the case of a plane, these methods return -V.
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
		/****** Geom_RectangularTrimmedSurface::Geom_RectangularTrimmedSurface ******/
		/****** md5 signature: f7c04061f43d7804d94b684eda583d55 ******/
		%feature("compactdefaultargs") Geom_RectangularTrimmedSurface;
		%feature("autodoc", "
Parameters
----------
S: Geom_Surface
U1: float
U2: float
V1: float
V2: float
USense: bool (optional, default to Standard_True)
VSense: bool (optional, default to Standard_True)

Return
-------
None

Description
-----------
The U parametric direction of the surface is oriented from U1 to U2. The V parametric direction of the surface is oriented from V1 to V2. These two directions define the orientation of the surface (normal). If the surface is not periodic USense and VSense are not used for the construction. If the surface S is periodic in one direction USense and VSense give the available part of the surface. By default in this case the surface has the same orientation as the basis surface S. The returned surface is not closed and not periodic. ConstructionError Raised if S is not periodic in the UDirection and U1 or U2 are out of the bounds of S. S is not periodic in the VDirection and V1 or V2 are out of the bounds of S. U1 = U2 or V1 = V2.
") Geom_RectangularTrimmedSurface;
		 Geom_RectangularTrimmedSurface(const opencascade::handle<Geom_Surface> & S, const Standard_Real U1, const Standard_Real U2, const Standard_Real V1, const Standard_Real V2, const Standard_Boolean USense = Standard_True, const Standard_Boolean VSense = Standard_True);

		/****** Geom_RectangularTrimmedSurface::Geom_RectangularTrimmedSurface ******/
		/****** md5 signature: f6030b4c9a985b497c958a26156fd356 ******/
		%feature("compactdefaultargs") Geom_RectangularTrimmedSurface;
		%feature("autodoc", "
Parameters
----------
S: Geom_Surface
Param1: float
Param2: float
UTrim: bool
Sense: bool (optional, default to Standard_True)

Return
-------
None

Description
-----------
The basis surface S is only trim in one parametric direction. If UTrim = True the surface is trimmed in the U parametric direction else the surface is trimmed in the V parametric direction. In the considered parametric direction the resulting surface is oriented from Param1 to Param2. If S is periodic Sense gives the available part of the surface. By default the trimmed surface has the same orientation as the basis surface S in the considered parametric direction (Sense = True). If the basis surface S is closed or periodic in the parametric direction opposite to the trimming direction the trimmed surface has the same characteristics as the surface S in this direction. Warnings: In this package the entities are not shared. The RectangularTrimmedSurface is built with a copy of the surface S. So when S is modified the RectangularTrimmedSurface is not modified Raised if S is not periodic in the considered parametric direction and Param1 or Param2 are out of the bounds of S. Param1 = Param2.
") Geom_RectangularTrimmedSurface;
		 Geom_RectangularTrimmedSurface(const opencascade::handle<Geom_Surface> & S, const Standard_Real Param1, const Standard_Real Param2, const Standard_Boolean UTrim, const Standard_Boolean Sense = Standard_True);

		/****** Geom_RectangularTrimmedSurface::BasisSurface ******/
		/****** md5 signature: 8dbbf01303a0ac26e255b604d8f6addc ******/
		%feature("compactdefaultargs") BasisSurface;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom_Surface>

Description
-----------
Returns the Basis surface of <self>.
") BasisSurface;
		opencascade::handle<Geom_Surface> BasisSurface();

		/****** Geom_RectangularTrimmedSurface::Bounds ******/
		/****** md5 signature: bbc36976e796eedf3c69513e986f2adb ******/
		%feature("compactdefaultargs") Bounds;
		%feature("autodoc", "
Parameters
----------

Return
-------
U1: float
U2: float
V1: float
V2: float

Description
-----------
Returns the parametric bounds U1, U2, V1 and V2 of this patch.
") Bounds;
		void Bounds(Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** Geom_RectangularTrimmedSurface::Continuity ******/
		/****** md5 signature: 9381b370dfdd50af7f1b79ce202f0c6f ******/
		%feature("compactdefaultargs") Continuity;
		%feature("autodoc", "Return
-------
GeomAbs_Shape

Description
-----------
Returns the continuity of the surface: C0: only geometric continuity, C1: continuity of the first derivative all along the Surface, C2: continuity of the second derivative all along the Surface, C3: continuity of the third derivative all along the Surface, CN: the order of continuity is infinite.
") Continuity;
		GeomAbs_Shape Continuity();

		/****** Geom_RectangularTrimmedSurface::Copy ******/
		/****** md5 signature: 1360a3e0ea51e38ae19c71fb8aa1c4e9 ******/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom_Geometry>

Description
-----------
Creates a new object which is a copy of this patch.
") Copy;
		opencascade::handle<Geom_Geometry> Copy();

		/****** Geom_RectangularTrimmedSurface::D0 ******/
		/****** md5 signature: 909f7ecc223d561155c9c3ba4b8e7b64 ******/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "
Parameters
----------
U: float
V: float
P: gp_Pnt

Return
-------
None

Description
-----------
Can be raised if the basis surface is an OffsetSurface.
") D0;
		void D0(const Standard_Real U, const Standard_Real V, gp_Pnt & P);

		/****** Geom_RectangularTrimmedSurface::D1 ******/
		/****** md5 signature: 0868b105367e01c443402a5728aa3395 ******/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "
Parameters
----------
U: float
V: float
P: gp_Pnt
D1U: gp_Vec
D1V: gp_Vec

Return
-------
None

Description
-----------
The returned derivatives have the same orientation as the derivatives of the basis surface even if the trimmed surface has not the same parametric orientation. Warning! UndefinedDerivative raised if the continuity of the surface is not C1.
") D1;
		void D1(const Standard_Real U, const Standard_Real V, gp_Pnt & P, gp_Vec & D1U, gp_Vec & D1V);

		/****** Geom_RectangularTrimmedSurface::D2 ******/
		/****** md5 signature: 5bdb029d3f1561c55d7ab1d1b0b0282a ******/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "
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

Return
-------
None

Description
-----------
The returned derivatives have the same orientation as the derivatives of the basis surface even if the trimmed surface has not the same parametric orientation. Warning! UndefinedDerivative raised if the continuity of the surface is not C2.
") D2;
		void D2(const Standard_Real U, const Standard_Real V, gp_Pnt & P, gp_Vec & D1U, gp_Vec & D1V, gp_Vec & D2U, gp_Vec & D2V, gp_Vec & D2UV);

		/****** Geom_RectangularTrimmedSurface::D3 ******/
		/****** md5 signature: 2fbd4d1b6bb5f19034b05b5a6e0ddec0 ******/
		%feature("compactdefaultargs") D3;
		%feature("autodoc", "
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

Return
-------
None

Description
-----------
The returned derivatives have the same orientation as the derivatives of the basis surface even if the trimmed surface has not the same parametric orientation. Warning UndefinedDerivative raised if the continuity of the surface is not C3.
") D3;
		void D3(const Standard_Real U, const Standard_Real V, gp_Pnt & P, gp_Vec & D1U, gp_Vec & D1V, gp_Vec & D2U, gp_Vec & D2V, gp_Vec & D2UV, gp_Vec & D3U, gp_Vec & D3V, gp_Vec & D3UUV, gp_Vec & D3UVV);

		/****** Geom_RectangularTrimmedSurface::DN ******/
		/****** md5 signature: 78200f5fa5a4060f4022c2e3d9d8ac0e ******/
		%feature("compactdefaultargs") DN;
		%feature("autodoc", "
Parameters
----------
U: float
V: float
Nu: int
Nv: int

Return
-------
gp_Vec

Description
-----------
The returned derivative has the same orientation as the derivative of the basis surface even if the trimmed surface has not the same parametric orientation. Warning! UndefinedDerivative raised if the continuity of the surface is not CNu in the U parametric direction and CNv in the V parametric direction. RangeError Raised if Nu + Nv < 1 or Nu < 0 or Nv < 0.
") DN;
		gp_Vec DN(const Standard_Real U, const Standard_Real V, const Standard_Integer Nu, const Standard_Integer Nv);


        /****************** DumpJson ******************/
        %feature("autodoc", "
Parameters
----------
depth: int, default=-1

Return
-------
str

Description
-----------
Dump the object to JSON string.
") DumpJson;
        %extend{
            std::string DumpJson(int depth=-1) {
            std::stringstream s;
            self->DumpJson(s, depth);
            return "{" + s.str() + "}" ;}
        };
		/****** Geom_RectangularTrimmedSurface::IsCNu ******/
		/****** md5 signature: c9f9f7f6eb82d83e9ba43e721cffba8a ******/
		%feature("compactdefaultargs") IsCNu;
		%feature("autodoc", "
Parameters
----------
N: int

Return
-------
bool

Description
-----------
Returns true if the order of derivation in the U parametric direction is N. Raised if N < 0.
") IsCNu;
		Standard_Boolean IsCNu(const Standard_Integer N);

		/****** Geom_RectangularTrimmedSurface::IsCNv ******/
		/****** md5 signature: 0acb88d1ffd7eea46785f30d7fc5f85e ******/
		%feature("compactdefaultargs") IsCNv;
		%feature("autodoc", "
Parameters
----------
N: int

Return
-------
bool

Description
-----------
Returns true if the order of derivation in the V parametric direction is N. Raised if N < 0.
") IsCNv;
		Standard_Boolean IsCNv(const Standard_Integer N);

		/****** Geom_RectangularTrimmedSurface::IsUClosed ******/
		/****** md5 signature: d1e8bae29b90dc447f4693c94ad31c37 ******/
		%feature("compactdefaultargs") IsUClosed;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if this patch is closed in the given parametric direction.
") IsUClosed;
		Standard_Boolean IsUClosed();

		/****** Geom_RectangularTrimmedSurface::IsUPeriodic ******/
		/****** md5 signature: 91acb028d6850ac4bbf00dc198b558b7 ******/
		%feature("compactdefaultargs") IsUPeriodic;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if this patch is periodic and not trimmed in the given parametric direction.
") IsUPeriodic;
		Standard_Boolean IsUPeriodic();

		/****** Geom_RectangularTrimmedSurface::IsVClosed ******/
		/****** md5 signature: aa0eae8155ddef3e9f1d0cc573955bb6 ******/
		%feature("compactdefaultargs") IsVClosed;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if this patch is closed in the given parametric direction.
") IsVClosed;
		Standard_Boolean IsVClosed();

		/****** Geom_RectangularTrimmedSurface::IsVPeriodic ******/
		/****** md5 signature: 88e9b94f2ab4a3d73c3fe787315e4448 ******/
		%feature("compactdefaultargs") IsVPeriodic;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if this patch is periodic and not trimmed in the given parametric direction.
") IsVPeriodic;
		Standard_Boolean IsVPeriodic();

		/****** Geom_RectangularTrimmedSurface::ParametricTransformation ******/
		/****** md5 signature: 019b69215b9dcafd8e9b0052b449ea05 ******/
		%feature("compactdefaultargs") ParametricTransformation;
		%feature("autodoc", "
Parameters
----------
T: gp_Trsf

Return
-------
gp_GTrsf2d

Description
-----------
Returns a 2d transformation used to find the new parameters of a point on the transformed surface. @code me->Transformed(T)->Value(U',V') @endcode is the same point as @code me->Value(U,V).Transformed(T) @endcode Where U',V' are obtained by transforming U,V with the 2d transformation returned by @code me->ParametricTransformation(T) @endcode This method calls the basis surface method.
") ParametricTransformation;
		virtual gp_GTrsf2d ParametricTransformation(const gp_Trsf & T);

		/****** Geom_RectangularTrimmedSurface::SetTrim ******/
		/****** md5 signature: 9844be93bcf31079b2728cc2858138cd ******/
		%feature("compactdefaultargs") SetTrim;
		%feature("autodoc", "
Parameters
----------
U1: float
U2: float
V1: float
V2: float
USense: bool (optional, default to Standard_True)
VSense: bool (optional, default to Standard_True)

Return
-------
None

Description
-----------
Modifies this patch by changing the trim values applied to the original surface The u parametric direction of this patch is oriented from U1 to U2. The v parametric direction of this patch is oriented from V1 to V2. USense and VSense are used for the construction only if the surface is periodic in the corresponding parametric direction, and define the available part of the surface; by default in this case, this patch has the same orientation as the basis surface. Raised if The BasisSurface is not periodic in the UDirection and U1 or U2 are out of the bounds of the BasisSurface. The BasisSurface is not periodic in the VDirection and V1 or V2 are out of the bounds of the BasisSurface. U1 = U2 or V1 = V2.
") SetTrim;
		void SetTrim(const Standard_Real U1, const Standard_Real U2, const Standard_Real V1, const Standard_Real V2, const Standard_Boolean USense = Standard_True, const Standard_Boolean VSense = Standard_True);

		/****** Geom_RectangularTrimmedSurface::SetTrim ******/
		/****** md5 signature: e528556b2c58f895bdbfdc36edc57c37 ******/
		%feature("compactdefaultargs") SetTrim;
		%feature("autodoc", "
Parameters
----------
Param1: float
Param2: float
UTrim: bool
Sense: bool (optional, default to Standard_True)

Return
-------
None

Description
-----------
Modifies this patch by changing the trim values applied to the original surface The basis surface is trimmed only in one parametric direction: if UTrim is true, the surface is trimmed in the u parametric direction; if it is false, it is trimmed in the v parametric direction. In the 'trimmed' direction, this patch is oriented from Param1 to Param2. If the basis surface is periodic in the 'trimmed' direction, Sense defines its available part. By default in this case, this patch has the same orientation as the basis surface in this parametric direction. If the basis surface is closed or periodic in the other parametric direction (i.e. not the 'trimmed' direction), this patch has the same characteristics as the basis surface in that parametric direction. Raised if The BasisSurface is not periodic in the considered direction and Param1 or Param2 are out of the bounds of the BasisSurface. Param1 = Param2.
") SetTrim;
		void SetTrim(const Standard_Real Param1, const Standard_Real Param2, const Standard_Boolean UTrim, const Standard_Boolean Sense = Standard_True);

		/****** Geom_RectangularTrimmedSurface::Transform ******/
		/****** md5 signature: b643be97d129c62226d788cd0501ced0 ******/
		%feature("compactdefaultargs") Transform;
		%feature("autodoc", "
Parameters
----------
T: gp_Trsf

Return
-------
None

Description
-----------
Applies the transformation T to this patch. Warning As a consequence, the basis surface included in the data structure of this patch is also modified.
") Transform;
		void Transform(const gp_Trsf & T);

		/****** Geom_RectangularTrimmedSurface::TransformParameters ******/
		/****** md5 signature: 2d9e8651399bacbb299466ac222a6ca8 ******/
		%feature("compactdefaultargs") TransformParameters;
		%feature("autodoc", "
Parameters
----------
T: gp_Trsf

Return
-------
U: float
V: float

Description
-----------
Computes the parameters on the transformed surface for the transform of the point of parameters U,V on <self>. @code me->Transformed(T)->Value(U',V') @endcode is the same point as @code me->Value(U,V).Transformed(T) @endcode Where U',V' are the new values of U,V after calling @code me->TransformParameters(U,V,T) @endcode This method calls the basis surface method.
") TransformParameters;
		virtual void TransformParameters(Standard_Real &OutValue, Standard_Real &OutValue, const gp_Trsf & T);

		/****** Geom_RectangularTrimmedSurface::UIso ******/
		/****** md5 signature: f5e8cbc22e32c38f4dd05caadff59fee ******/
		%feature("compactdefaultargs") UIso;
		%feature("autodoc", "
Parameters
----------
U: float

Return
-------
opencascade::handle<Geom_Curve>

Description
-----------
computes the U isoparametric curve.
") UIso;
		opencascade::handle<Geom_Curve> UIso(const Standard_Real U);

		/****** Geom_RectangularTrimmedSurface::UPeriod ******/
		/****** md5 signature: 99929007fac43736aa36012893e9b882 ******/
		%feature("compactdefaultargs") UPeriod;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the period of this patch in the u parametric direction. raises if the surface is not uperiodic.
") UPeriod;
		virtual Standard_Real UPeriod();

		/****** Geom_RectangularTrimmedSurface::UReverse ******/
		/****** md5 signature: 31a376207d6b3f3c82d0cde57034e1f2 ******/
		%feature("compactdefaultargs") UReverse;
		%feature("autodoc", "Return
-------
None

Description
-----------
Changes the orientation of this patch in the u parametric direction. The bounds of the surface are not changed, but the given parametric direction is reversed. Hence the orientation of the surface is reversed.
") UReverse;
		void UReverse();

		/****** Geom_RectangularTrimmedSurface::UReversedParameter ******/
		/****** md5 signature: 0071925b176316f0aaaf26f369ac410c ******/
		%feature("compactdefaultargs") UReversedParameter;
		%feature("autodoc", "
Parameters
----------
U: float

Return
-------
float

Description
-----------
Computes the u parameter on the modified surface, produced by when reversing its u parametric direction, for any point of u parameter U on this patch.
") UReversedParameter;
		Standard_Real UReversedParameter(const Standard_Real U);

		/****** Geom_RectangularTrimmedSurface::VIso ******/
		/****** md5 signature: ef8726fc193d6cf33f54c94b9ed952a5 ******/
		%feature("compactdefaultargs") VIso;
		%feature("autodoc", "
Parameters
----------
V: float

Return
-------
opencascade::handle<Geom_Curve>

Description
-----------
Computes the V isoparametric curve.
") VIso;
		opencascade::handle<Geom_Curve> VIso(const Standard_Real V);

		/****** Geom_RectangularTrimmedSurface::VPeriod ******/
		/****** md5 signature: 0b2fb065ece518694127e1e1eadebb25 ******/
		%feature("compactdefaultargs") VPeriod;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the period of this patch in the v parametric direction. raises if the surface is not vperiodic. value and derivatives.
") VPeriod;
		virtual Standard_Real VPeriod();

		/****** Geom_RectangularTrimmedSurface::VReverse ******/
		/****** md5 signature: ca22d262a13cf236e9be77a884d19536 ******/
		%feature("compactdefaultargs") VReverse;
		%feature("autodoc", "Return
-------
None

Description
-----------
Changes the orientation of this patch in the v parametric direction. The bounds of the surface are not changed, but the given parametric direction is reversed. Hence the orientation of the surface is reversed.
") VReverse;
		void VReverse();

		/****** Geom_RectangularTrimmedSurface::VReversedParameter ******/
		/****** md5 signature: 92057d43e0e5ee078908582a4176343b ******/
		%feature("compactdefaultargs") VReversedParameter;
		%feature("autodoc", "
Parameters
----------
V: float

Return
-------
float

Description
-----------
Computes the v parameter on the modified surface, produced by when reversing its v parametric direction, for any point of v parameter V on this patch.
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
		/****** Geom_SphericalSurface::Geom_SphericalSurface ******/
		/****** md5 signature: 73d076df291bdc9a529b87fcc692ea7f ******/
		%feature("compactdefaultargs") Geom_SphericalSurface;
		%feature("autodoc", "
Parameters
----------
A3: gp_Ax3
Radius: float

Return
-------
None

Description
-----------
A3 is the local coordinate system of the surface. At the creation the parametrization of the surface is defined such as the normal Vector (N = D1U ^ D1V) is directed away from the center of the sphere. The direction of increasing parametric value V is defined by the rotation around the 'YDirection' of A2 in the trigonometric sense and the orientation of increasing parametric value U is defined by the rotation around the main direction of A2 in the trigonometric sense. Warnings: It is not forbidden to create a spherical surface with Radius = 0.0 Raised if Radius < 0.0.
") Geom_SphericalSurface;
		 Geom_SphericalSurface(const gp_Ax3 & A3, const Standard_Real Radius);

		/****** Geom_SphericalSurface::Geom_SphericalSurface ******/
		/****** md5 signature: 45dfeecf08b0b59c47720f33f80ea4dc ******/
		%feature("compactdefaultargs") Geom_SphericalSurface;
		%feature("autodoc", "
Parameters
----------
S: gp_Sphere

Return
-------
None

Description
-----------
Creates a SphericalSurface from a non persistent Sphere from package gp.
") Geom_SphericalSurface;
		 Geom_SphericalSurface(const gp_Sphere & S);

		/****** Geom_SphericalSurface::Area ******/
		/****** md5 signature: a514cbcf0bd2f53e9374f58dcecded92 ******/
		%feature("compactdefaultargs") Area;
		%feature("autodoc", "Return
-------
float

Description
-----------
Computes the aera of the spherical surface.
") Area;
		Standard_Real Area();

		/****** Geom_SphericalSurface::Bounds ******/
		/****** md5 signature: bbc36976e796eedf3c69513e986f2adb ******/
		%feature("compactdefaultargs") Bounds;
		%feature("autodoc", "
Parameters
----------

Return
-------
U1: float
U2: float
V1: float
V2: float

Description
-----------
Returns the parametric bounds U1, U2, V1 and V2 of this sphere. For a sphere: U1 = 0, U2 = 2*PI, V1 = -PI/2, V2 = PI/2.
") Bounds;
		void Bounds(Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** Geom_SphericalSurface::Coefficients ******/
		/****** md5 signature: 922ffb066c913dfb924eafd175a6358f ******/
		%feature("compactdefaultargs") Coefficients;
		%feature("autodoc", "
Parameters
----------

Return
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

Description
-----------
Returns the coefficients of the implicit equation of the quadric in the absolute cartesian coordinates system: These coefficients are normalized. A1.X**2 + A2.Y**2 + A3.Z**2 + 2.(B1.X.Y + B2.X.Z + B3.Y.Z) + 2.(C1.X + C2.Y + C3.Z) + D = 0.0.
") Coefficients;
		void Coefficients(Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** Geom_SphericalSurface::Copy ******/
		/****** md5 signature: 1360a3e0ea51e38ae19c71fb8aa1c4e9 ******/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom_Geometry>

Description
-----------
Creates a new object which is a copy of this sphere.
") Copy;
		opencascade::handle<Geom_Geometry> Copy();

		/****** Geom_SphericalSurface::D0 ******/
		/****** md5 signature: 909f7ecc223d561155c9c3ba4b8e7b64 ******/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "
Parameters
----------
U: float
V: float
P: gp_Pnt

Return
-------
None

Description
-----------
Computes the point P (U, V) on the surface. P (U, V) = Loc + Radius * Sin (V) * Zdir + Radius * Cos (V) * (cos (U) * XDir + sin (U) * YDir) where Loc is the origin of the placement plane (XAxis, YAxis) XDir is the direction of the XAxis and YDir the direction of the YAxis and ZDir the direction of the ZAxis.
") D0;
		void D0(const Standard_Real U, const Standard_Real V, gp_Pnt & P);

		/****** Geom_SphericalSurface::D1 ******/
		/****** md5 signature: 0868b105367e01c443402a5728aa3395 ******/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "
Parameters
----------
U: float
V: float
P: gp_Pnt
D1U: gp_Vec
D1V: gp_Vec

Return
-------
None

Description
-----------
Computes the current point and the first derivatives in the directions U and V.
") D1;
		void D1(const Standard_Real U, const Standard_Real V, gp_Pnt & P, gp_Vec & D1U, gp_Vec & D1V);

		/****** Geom_SphericalSurface::D2 ******/
		/****** md5 signature: 5bdb029d3f1561c55d7ab1d1b0b0282a ******/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "
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

Return
-------
None

Description
-----------
Computes the current point, the first and the second derivatives in the directions U and V.
") D2;
		void D2(const Standard_Real U, const Standard_Real V, gp_Pnt & P, gp_Vec & D1U, gp_Vec & D1V, gp_Vec & D2U, gp_Vec & D2V, gp_Vec & D2UV);

		/****** Geom_SphericalSurface::D3 ******/
		/****** md5 signature: 2fbd4d1b6bb5f19034b05b5a6e0ddec0 ******/
		%feature("compactdefaultargs") D3;
		%feature("autodoc", "
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

Return
-------
None

Description
-----------
Computes the current point, the first,the second and the third derivatives in the directions U and V.
") D3;
		void D3(const Standard_Real U, const Standard_Real V, gp_Pnt & P, gp_Vec & D1U, gp_Vec & D1V, gp_Vec & D2U, gp_Vec & D2V, gp_Vec & D2UV, gp_Vec & D3U, gp_Vec & D3V, gp_Vec & D3UUV, gp_Vec & D3UVV);

		/****** Geom_SphericalSurface::DN ******/
		/****** md5 signature: 78200f5fa5a4060f4022c2e3d9d8ac0e ******/
		%feature("compactdefaultargs") DN;
		%feature("autodoc", "
Parameters
----------
U: float
V: float
Nu: int
Nv: int

Return
-------
gp_Vec

Description
-----------
Computes the derivative of order Nu in the direction u and Nv in the direction v. Raised if Nu + Nv < 1 or Nu < 0 or Nv < 0.
") DN;
		gp_Vec DN(const Standard_Real U, const Standard_Real V, const Standard_Integer Nu, const Standard_Integer Nv);


        /****************** DumpJson ******************/
        %feature("autodoc", "
Parameters
----------
depth: int, default=-1

Return
-------
str

Description
-----------
Dump the object to JSON string.
") DumpJson;
        %extend{
            std::string DumpJson(int depth=-1) {
            std::stringstream s;
            self->DumpJson(s, depth);
            return "{" + s.str() + "}" ;}
        };
		/****** Geom_SphericalSurface::IsUClosed ******/
		/****** md5 signature: d1e8bae29b90dc447f4693c94ad31c37 ******/
		%feature("compactdefaultargs") IsUClosed;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True.
") IsUClosed;
		Standard_Boolean IsUClosed();

		/****** Geom_SphericalSurface::IsUPeriodic ******/
		/****** md5 signature: 91acb028d6850ac4bbf00dc198b558b7 ******/
		%feature("compactdefaultargs") IsUPeriodic;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True.
") IsUPeriodic;
		Standard_Boolean IsUPeriodic();

		/****** Geom_SphericalSurface::IsVClosed ******/
		/****** md5 signature: aa0eae8155ddef3e9f1d0cc573955bb6 ******/
		%feature("compactdefaultargs") IsVClosed;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns False.
") IsVClosed;
		Standard_Boolean IsVClosed();

		/****** Geom_SphericalSurface::IsVPeriodic ******/
		/****** md5 signature: 88e9b94f2ab4a3d73c3fe787315e4448 ******/
		%feature("compactdefaultargs") IsVPeriodic;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns False.
") IsVPeriodic;
		Standard_Boolean IsVPeriodic();

		/****** Geom_SphericalSurface::Radius ******/
		/****** md5 signature: 506a8dc1140a54bd4146c24bb5357fbf ******/
		%feature("compactdefaultargs") Radius;
		%feature("autodoc", "Return
-------
float

Description
-----------
Computes the coefficients of the implicit equation of this quadric in the absolute Cartesian coordinate system: A1.X**2 + A2.Y**2 + A3.Z**2 + 2.(B1.X.Y + B2.X.Z + B3.Y.Z) + 2.(C1.X + C2.Y + C3.Z) + D = 0.0 An implicit normalization is applied (i.e. A1 = A2 = 1. in the local coordinate system of this sphere).
") Radius;
		Standard_Real Radius();

		/****** Geom_SphericalSurface::SetRadius ******/
		/****** md5 signature: 452d48523583bd00e647880614077dd6 ******/
		%feature("compactdefaultargs") SetRadius;
		%feature("autodoc", "
Parameters
----------
R: float

Return
-------
None

Description
-----------
Assigns the value R to the radius of this sphere. Exceptions Standard_ConstructionError if R is less than 0.0.
") SetRadius;
		void SetRadius(const Standard_Real R);

		/****** Geom_SphericalSurface::SetSphere ******/
		/****** md5 signature: c8c7ef86f14ea8b6cd3dd391115e82d4 ******/
		%feature("compactdefaultargs") SetSphere;
		%feature("autodoc", "
Parameters
----------
S: gp_Sphere

Return
-------
None

Description
-----------
Converts the gp_Sphere S into this sphere.
") SetSphere;
		void SetSphere(const gp_Sphere & S);

		/****** Geom_SphericalSurface::Sphere ******/
		/****** md5 signature: e02f27c8c733f0b938d13039e1e73f8c ******/
		%feature("compactdefaultargs") Sphere;
		%feature("autodoc", "Return
-------
gp_Sphere

Description
-----------
Returns a non persistent sphere with the same geometric properties as <self>.
") Sphere;
		gp_Sphere Sphere();

		/****** Geom_SphericalSurface::Transform ******/
		/****** md5 signature: b643be97d129c62226d788cd0501ced0 ******/
		%feature("compactdefaultargs") Transform;
		%feature("autodoc", "
Parameters
----------
T: gp_Trsf

Return
-------
None

Description
-----------
Applies the transformation T to this sphere.
") Transform;
		void Transform(const gp_Trsf & T);

		/****** Geom_SphericalSurface::UIso ******/
		/****** md5 signature: f5e8cbc22e32c38f4dd05caadff59fee ******/
		%feature("compactdefaultargs") UIso;
		%feature("autodoc", "
Parameters
----------
U: float

Return
-------
opencascade::handle<Geom_Curve>

Description
-----------
Computes the U isoparametric curve. The U isoparametric curves of the surface are defined by the section of the spherical surface with plane obtained by rotation of the plane (Location, XAxis, ZAxis) around ZAxis. This plane defines the origin of parametrization u. For a SphericalSurface the UIso curve is a Circle. Warnings: The radius of this circle can be zero.
") UIso;
		opencascade::handle<Geom_Curve> UIso(const Standard_Real U);

		/****** Geom_SphericalSurface::UReversedParameter ******/
		/****** md5 signature: 0071925b176316f0aaaf26f369ac410c ******/
		%feature("compactdefaultargs") UReversedParameter;
		%feature("autodoc", "
Parameters
----------
U: float

Return
-------
float

Description
-----------
Computes the u parameter on the modified surface, when reversing its u parametric direction, for any point of u parameter U on this sphere. In the case of a sphere, these functions returns 2.PI - U.
") UReversedParameter;
		Standard_Real UReversedParameter(const Standard_Real U);

		/****** Geom_SphericalSurface::VIso ******/
		/****** md5 signature: ef8726fc193d6cf33f54c94b9ed952a5 ******/
		%feature("compactdefaultargs") VIso;
		%feature("autodoc", "
Parameters
----------
V: float

Return
-------
opencascade::handle<Geom_Curve>

Description
-----------
Computes the V isoparametric curve. The V isoparametric curves of the surface are defined by the section of the spherical surface with plane parallel to the plane (Location, XAxis, YAxis). This plane defines the origin of parametrization V. Be careful if V is close to PI/2 or 3*PI/2 the radius of the circle becomes tiny. It is not forbidden in this toolkit to create circle with radius = 0.0 For a SphericalSurface the VIso curve is a Circle. Warnings: The radius of this circle can be zero.
") VIso;
		opencascade::handle<Geom_Curve> VIso(const Standard_Real V);

		/****** Geom_SphericalSurface::VReversedParameter ******/
		/****** md5 signature: 92057d43e0e5ee078908582a4176343b ******/
		%feature("compactdefaultargs") VReversedParameter;
		%feature("autodoc", "
Parameters
----------
V: float

Return
-------
float

Description
-----------
Computes the v parameter on the modified surface, when reversing its v parametric direction, for any point of v parameter V on this sphere. In the case of a sphere, these functions returns -U.
") VReversedParameter;
		Standard_Real VReversedParameter(const Standard_Real V);

		/****** Geom_SphericalSurface::Volume ******/
		/****** md5 signature: 09f69eb56723243a302bd3839799847b ******/
		%feature("compactdefaultargs") Volume;
		%feature("autodoc", "Return
-------
float

Description
-----------
Computes the volume of the spherical surface.
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
		/****** Geom_SurfaceOfLinearExtrusion::Geom_SurfaceOfLinearExtrusion ******/
		/****** md5 signature: b17ef9c2821e6403b3e2f41954e7aeb5 ******/
		%feature("compactdefaultargs") Geom_SurfaceOfLinearExtrusion;
		%feature("autodoc", "
Parameters
----------
C: Geom_Curve
V: gp_Dir

Return
-------
None

Description
-----------
V is the direction of extrusion. C is the extruded curve. The form of a SurfaceOfLinearExtrusion can be: . ruled surface (RuledForm), . a cylindrical surface if the extruded curve is a circle or a trimmed circle (CylindricalForm), . a plane surface if the extruded curve is a Line (PlanarForm). Warnings: Degenerated surface cases are not detected. For example if the curve C is a line and V is parallel to the direction of this line.
") Geom_SurfaceOfLinearExtrusion;
		 Geom_SurfaceOfLinearExtrusion(const opencascade::handle<Geom_Curve> & C, const gp_Dir & V);

		/****** Geom_SurfaceOfLinearExtrusion::Bounds ******/
		/****** md5 signature: bbc36976e796eedf3c69513e986f2adb ******/
		%feature("compactdefaultargs") Bounds;
		%feature("autodoc", "
Parameters
----------

Return
-------
U1: float
U2: float
V1: float
V2: float

Description
-----------
Returns the parametric bounds U1, U2, V1 and V2 of this surface of linear extrusion. A surface of linear extrusion is infinite in the v parametric direction, so: - V1 = Standard_Real::RealFirst() - V2 = Standard_Real::RealLast().
") Bounds;
		void Bounds(Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** Geom_SurfaceOfLinearExtrusion::Copy ******/
		/****** md5 signature: 1360a3e0ea51e38ae19c71fb8aa1c4e9 ******/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom_Geometry>

Description
-----------
Creates a new object which is a copy of this surface of linear extrusion.
") Copy;
		opencascade::handle<Geom_Geometry> Copy();

		/****** Geom_SurfaceOfLinearExtrusion::D0 ******/
		/****** md5 signature: 909f7ecc223d561155c9c3ba4b8e7b64 ******/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "
Parameters
----------
U: float
V: float
P: gp_Pnt

Return
-------
None

Description
-----------
Computes the point P (U, V) on the surface. The parameter U is the parameter on the extruded curve. The parametrization V is a linear parametrization, and the direction of parametrization is the direction of extrusion. If the point is on the extruded curve, V = 0.0.
") D0;
		void D0(const Standard_Real U, const Standard_Real V, gp_Pnt & P);

		/****** Geom_SurfaceOfLinearExtrusion::D1 ******/
		/****** md5 signature: 0868b105367e01c443402a5728aa3395 ******/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "
Parameters
----------
U: float
V: float
P: gp_Pnt
D1U: gp_Vec
D1V: gp_Vec

Return
-------
None

Description
-----------
Computes the current point and the first derivatives in the directions U and V. Raises UndefinedDerivative if the continuity of the surface is not C1.
") D1;
		void D1(const Standard_Real U, const Standard_Real V, gp_Pnt & P, gp_Vec & D1U, gp_Vec & D1V);

		/****** Geom_SurfaceOfLinearExtrusion::D2 ******/
		/****** md5 signature: 5bdb029d3f1561c55d7ab1d1b0b0282a ******/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "
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

Return
-------
None

Description
-----------
--- Purpose ; Computes the current point, the first and the second derivatives in the directions U and V. Raises UndefinedDerivative if the continuity of the surface is not C2.
") D2;
		void D2(const Standard_Real U, const Standard_Real V, gp_Pnt & P, gp_Vec & D1U, gp_Vec & D1V, gp_Vec & D2U, gp_Vec & D2V, gp_Vec & D2UV);

		/****** Geom_SurfaceOfLinearExtrusion::D3 ******/
		/****** md5 signature: 2fbd4d1b6bb5f19034b05b5a6e0ddec0 ******/
		%feature("compactdefaultargs") D3;
		%feature("autodoc", "
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

Return
-------
None

Description
-----------
Computes the current point, the first,the second and the third derivatives in the directions U and V. Raises UndefinedDerivative if the continuity of the surface is not C3.
") D3;
		void D3(const Standard_Real U, const Standard_Real V, gp_Pnt & P, gp_Vec & D1U, gp_Vec & D1V, gp_Vec & D2U, gp_Vec & D2V, gp_Vec & D2UV, gp_Vec & D3U, gp_Vec & D3V, gp_Vec & D3UUV, gp_Vec & D3UVV);

		/****** Geom_SurfaceOfLinearExtrusion::DN ******/
		/****** md5 signature: 78200f5fa5a4060f4022c2e3d9d8ac0e ******/
		%feature("compactdefaultargs") DN;
		%feature("autodoc", "
Parameters
----------
U: float
V: float
Nu: int
Nv: int

Return
-------
gp_Vec

Description
-----------
Computes the derivative of order Nu in the direction u and Nv in the direction v. Raises UndefinedDerivative if the continuity of the surface is not CNu in the u direction and CNv in the v direction. Raises RangeError if Nu + Nv < 1 or Nu < 0 or Nv < 0.
") DN;
		gp_Vec DN(const Standard_Real U, const Standard_Real V, const Standard_Integer Nu, const Standard_Integer Nv);


        /****************** DumpJson ******************/
        %feature("autodoc", "
Parameters
----------
depth: int, default=-1

Return
-------
str

Description
-----------
Dump the object to JSON string.
") DumpJson;
        %extend{
            std::string DumpJson(int depth=-1) {
            std::stringstream s;
            self->DumpJson(s, depth);
            return "{" + s.str() + "}" ;}
        };
		/****** Geom_SurfaceOfLinearExtrusion::IsCNu ******/
		/****** md5 signature: c9f9f7f6eb82d83e9ba43e721cffba8a ******/
		%feature("compactdefaultargs") IsCNu;
		%feature("autodoc", "
Parameters
----------
N: int

Return
-------
bool

Description
-----------
IsCNu returns true if the degree of continuity for the 'basis curve' of this surface of linear extrusion is at least N. Raises RangeError if N < 0.
") IsCNu;
		Standard_Boolean IsCNu(const Standard_Integer N);

		/****** Geom_SurfaceOfLinearExtrusion::IsCNv ******/
		/****** md5 signature: 0acb88d1ffd7eea46785f30d7fc5f85e ******/
		%feature("compactdefaultargs") IsCNv;
		%feature("autodoc", "
Parameters
----------
N: int

Return
-------
bool

Description
-----------
IsCNv always returns true.
") IsCNv;
		Standard_Boolean IsCNv(const Standard_Integer N);

		/****** Geom_SurfaceOfLinearExtrusion::IsUClosed ******/
		/****** md5 signature: d1e8bae29b90dc447f4693c94ad31c37 ******/
		%feature("compactdefaultargs") IsUClosed;
		%feature("autodoc", "Return
-------
bool

Description
-----------
IsUClosed returns true if the 'basis curve' of this surface of linear extrusion is closed.
") IsUClosed;
		Standard_Boolean IsUClosed();

		/****** Geom_SurfaceOfLinearExtrusion::IsUPeriodic ******/
		/****** md5 signature: 91acb028d6850ac4bbf00dc198b558b7 ******/
		%feature("compactdefaultargs") IsUPeriodic;
		%feature("autodoc", "Return
-------
bool

Description
-----------
IsUPeriodic returns true if the 'basis curve' of this surface of linear extrusion is periodic.
") IsUPeriodic;
		Standard_Boolean IsUPeriodic();

		/****** Geom_SurfaceOfLinearExtrusion::IsVClosed ******/
		/****** md5 signature: aa0eae8155ddef3e9f1d0cc573955bb6 ******/
		%feature("compactdefaultargs") IsVClosed;
		%feature("autodoc", "Return
-------
bool

Description
-----------
IsVClosed always returns false.
") IsVClosed;
		Standard_Boolean IsVClosed();

		/****** Geom_SurfaceOfLinearExtrusion::IsVPeriodic ******/
		/****** md5 signature: 88e9b94f2ab4a3d73c3fe787315e4448 ******/
		%feature("compactdefaultargs") IsVPeriodic;
		%feature("autodoc", "Return
-------
bool

Description
-----------
IsVPeriodic always returns false.
") IsVPeriodic;
		Standard_Boolean IsVPeriodic();

		/****** Geom_SurfaceOfLinearExtrusion::ParametricTransformation ******/
		/****** md5 signature: 019b69215b9dcafd8e9b0052b449ea05 ******/
		%feature("compactdefaultargs") ParametricTransformation;
		%feature("autodoc", "
Parameters
----------
T: gp_Trsf

Return
-------
gp_GTrsf2d

Description
-----------
Returns a 2d transformation used to find the new parameters of a point on the transformed surface. @code me->Transformed(T)->Value(U',V') @endcode is the same point as @code me->Value(U,V).Transformed(T) @endcode Where U',V' are obtained by transforming U,V with the 2d transformation returned by @code me->ParametricTransformation(T) @endcode This method returns a scale U by BasisCurve()->ParametricTransformation(T) V by T.ScaleFactor().
") ParametricTransformation;
		virtual gp_GTrsf2d ParametricTransformation(const gp_Trsf & T);

		/****** Geom_SurfaceOfLinearExtrusion::SetBasisCurve ******/
		/****** md5 signature: 0bacb30e6132653809532b048ced8a5b ******/
		%feature("compactdefaultargs") SetBasisCurve;
		%feature("autodoc", "
Parameters
----------
C: Geom_Curve

Return
-------
None

Description
-----------
Modifies this surface of linear extrusion by redefining its 'basis curve' (the 'extruded curve').
") SetBasisCurve;
		void SetBasisCurve(const opencascade::handle<Geom_Curve> & C);

		/****** Geom_SurfaceOfLinearExtrusion::SetDirection ******/
		/****** md5 signature: df8744d729e050a65ee65230eb199390 ******/
		%feature("compactdefaultargs") SetDirection;
		%feature("autodoc", "
Parameters
----------
V: gp_Dir

Return
-------
None

Description
-----------
Assigns V as the 'direction of extrusion' for this surface of linear extrusion.
") SetDirection;
		void SetDirection(const gp_Dir & V);

		/****** Geom_SurfaceOfLinearExtrusion::Transform ******/
		/****** md5 signature: b643be97d129c62226d788cd0501ced0 ******/
		%feature("compactdefaultargs") Transform;
		%feature("autodoc", "
Parameters
----------
T: gp_Trsf

Return
-------
None

Description
-----------
Applies the transformation T to this surface of linear extrusion.
") Transform;
		void Transform(const gp_Trsf & T);

		/****** Geom_SurfaceOfLinearExtrusion::TransformParameters ******/
		/****** md5 signature: 2d9e8651399bacbb299466ac222a6ca8 ******/
		%feature("compactdefaultargs") TransformParameters;
		%feature("autodoc", "
Parameters
----------
T: gp_Trsf

Return
-------
U: float
V: float

Description
-----------
Computes the parameters on the transformed surface for the transform of the point of parameters U,V on <self>. @code me->Transformed(T)->Value(U',V') @endcode is the same point as @code me->Value(U,V).Transformed(T) @endcode Where U',V' are the new values of U,V after calling @code me->TransformParameters(U,V,T) @endcode This method multiplies: U by BasisCurve()->ParametricTransformation(T) V by T.ScaleFactor().
") TransformParameters;
		virtual void TransformParameters(Standard_Real &OutValue, Standard_Real &OutValue, const gp_Trsf & T);

		/****** Geom_SurfaceOfLinearExtrusion::UIso ******/
		/****** md5 signature: f5e8cbc22e32c38f4dd05caadff59fee ******/
		%feature("compactdefaultargs") UIso;
		%feature("autodoc", "
Parameters
----------
U: float

Return
-------
opencascade::handle<Geom_Curve>

Description
-----------
Computes the U isoparametric curve of this surface of linear extrusion. This is the line parallel to the direction of extrusion, passing through the point of parameter U of the basis curve.
") UIso;
		opencascade::handle<Geom_Curve> UIso(const Standard_Real U);

		/****** Geom_SurfaceOfLinearExtrusion::UReverse ******/
		/****** md5 signature: 31a376207d6b3f3c82d0cde57034e1f2 ******/
		%feature("compactdefaultargs") UReverse;
		%feature("autodoc", "Return
-------
None

Description
-----------
Changes the orientation of this surface of linear extrusion in the u parametric direction. The bounds of the surface are not changed, but the given parametric direction is reversed. Hence the orientation of the surface is reversed. In the case of a surface of linear extrusion: - UReverse reverses the basis curve, and - VReverse reverses the direction of linear extrusion.
") UReverse;
		void UReverse();

		/****** Geom_SurfaceOfLinearExtrusion::UReversedParameter ******/
		/****** md5 signature: 0071925b176316f0aaaf26f369ac410c ******/
		%feature("compactdefaultargs") UReversedParameter;
		%feature("autodoc", "
Parameters
----------
U: float

Return
-------
float

Description
-----------
Computes the u parameter on the modified surface, produced by reversing its u parametric direction, for any point of u parameter U on this surface of linear extrusion. In the case of an extruded surface: - UReverseParameter returns the reversed parameter given by the function ReversedParameter called with U on the basis curve,.
") UReversedParameter;
		Standard_Real UReversedParameter(const Standard_Real U);

		/****** Geom_SurfaceOfLinearExtrusion::VIso ******/
		/****** md5 signature: ef8726fc193d6cf33f54c94b9ed952a5 ******/
		%feature("compactdefaultargs") VIso;
		%feature("autodoc", "
Parameters
----------
V: float

Return
-------
opencascade::handle<Geom_Curve>

Description
-----------
Computes the V isoparametric curve of this surface of linear extrusion. This curve is obtained by translating the extruded curve in the direction of extrusion, with the magnitude V.
") VIso;
		opencascade::handle<Geom_Curve> VIso(const Standard_Real V);

		/****** Geom_SurfaceOfLinearExtrusion::VReverse ******/
		/****** md5 signature: ca22d262a13cf236e9be77a884d19536 ******/
		%feature("compactdefaultargs") VReverse;
		%feature("autodoc", "Return
-------
None

Description
-----------
Changes the orientation of this surface of linear extrusion in the v parametric direction. The bounds of the surface are not changed, but the given parametric direction is reversed. Hence the orientation of the surface is reversed. In the case of a surface of linear extrusion: - UReverse reverses the basis curve, and - VReverse reverses the direction of linear extrusion.
") VReverse;
		void VReverse();

		/****** Geom_SurfaceOfLinearExtrusion::VReversedParameter ******/
		/****** md5 signature: 92057d43e0e5ee078908582a4176343b ******/
		%feature("compactdefaultargs") VReversedParameter;
		%feature("autodoc", "
Parameters
----------
V: float

Return
-------
float

Description
-----------
Computes the v parameter on the modified surface, produced by reversing its u v parametric direction, for any point of v parameter V on this surface of linear extrusion. In the case of an extruded surface VReverse returns -V.
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
		/****** Geom_SurfaceOfRevolution::Geom_SurfaceOfRevolution ******/
		/****** md5 signature: 3c172fb62cb1ab38634e0a9d815e5aa6 ******/
		%feature("compactdefaultargs") Geom_SurfaceOfRevolution;
		%feature("autodoc", "
Parameters
----------
C: Geom_Curve
A1: gp_Ax1

Return
-------
None

Description
-----------
C: is the meridian or the referenced curve. A1 is the axis of revolution. The form of a SurfaceOfRevolution can be: . a general revolution surface (RevolutionForm), . a conical surface if the meridian is a line or a trimmed line (ConicalForm), . a cylindrical surface if the meridian is a line or a trimmed line parallel to the revolution axis (CylindricalForm), . a planar surface if the meridian is a line perpendicular to the revolution axis of the surface (PlanarForm). . a spherical surface, . a toroidal surface, . a quadric surface. Warnings: It is not checked that the curve C is planar and that the surface axis is in the plane of the curve. It is not checked that the revolved curve C doesn't self-intersects.
") Geom_SurfaceOfRevolution;
		 Geom_SurfaceOfRevolution(const opencascade::handle<Geom_Curve> & C, const gp_Ax1 & A1);

		/****** Geom_SurfaceOfRevolution::Axis ******/
		/****** md5 signature: 90d598524d3fccf742e7b8be8e83e849 ******/
		%feature("compactdefaultargs") Axis;
		%feature("autodoc", "Return
-------
gp_Ax1

Description
-----------
Returns the revolution axis of the surface.
") Axis;
		gp_Ax1 Axis();

		/****** Geom_SurfaceOfRevolution::Bounds ******/
		/****** md5 signature: bbc36976e796eedf3c69513e986f2adb ******/
		%feature("compactdefaultargs") Bounds;
		%feature("autodoc", "
Parameters
----------

Return
-------
U1: float
U2: float
V1: float
V2: float

Description
-----------
Returns the parametric bounds U1, U2 , V1 and V2 of this surface. A surface of revolution is always complete, so U1 = 0, U2 = 2*PI.
") Bounds;
		void Bounds(Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** Geom_SurfaceOfRevolution::Copy ******/
		/****** md5 signature: 1360a3e0ea51e38ae19c71fb8aa1c4e9 ******/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom_Geometry>

Description
-----------
Creates a new object which is a copy of this surface of revolution.
") Copy;
		opencascade::handle<Geom_Geometry> Copy();

		/****** Geom_SurfaceOfRevolution::D0 ******/
		/****** md5 signature: 909f7ecc223d561155c9c3ba4b8e7b64 ******/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "
Parameters
----------
U: float
V: float
P: gp_Pnt

Return
-------
None

Description
-----------
Computes the point P (U, V) on the surface. U is the angle of the rotation around the revolution axis. The direction of this axis gives the sense of rotation. V is the parameter of the revolved curve.
") D0;
		void D0(const Standard_Real U, const Standard_Real V, gp_Pnt & P);

		/****** Geom_SurfaceOfRevolution::D1 ******/
		/****** md5 signature: 0868b105367e01c443402a5728aa3395 ******/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "
Parameters
----------
U: float
V: float
P: gp_Pnt
D1U: gp_Vec
D1V: gp_Vec

Return
-------
None

Description
-----------
Computes the current point and the first derivatives in the directions U and V. Raised if the continuity of the surface is not C1.
") D1;
		void D1(const Standard_Real U, const Standard_Real V, gp_Pnt & P, gp_Vec & D1U, gp_Vec & D1V);

		/****** Geom_SurfaceOfRevolution::D2 ******/
		/****** md5 signature: 5bdb029d3f1561c55d7ab1d1b0b0282a ******/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "
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

Return
-------
None

Description
-----------
Computes the current point, the first and the second derivatives in the directions U and V. Raised if the continuity of the surface is not C2.
") D2;
		void D2(const Standard_Real U, const Standard_Real V, gp_Pnt & P, gp_Vec & D1U, gp_Vec & D1V, gp_Vec & D2U, gp_Vec & D2V, gp_Vec & D2UV);

		/****** Geom_SurfaceOfRevolution::D3 ******/
		/****** md5 signature: 2fbd4d1b6bb5f19034b05b5a6e0ddec0 ******/
		%feature("compactdefaultargs") D3;
		%feature("autodoc", "
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

Return
-------
None

Description
-----------
Computes the current point, the first,the second and the third derivatives in the directions U and V. Raised if the continuity of the surface is not C3.
") D3;
		void D3(const Standard_Real U, const Standard_Real V, gp_Pnt & P, gp_Vec & D1U, gp_Vec & D1V, gp_Vec & D2U, gp_Vec & D2V, gp_Vec & D2UV, gp_Vec & D3U, gp_Vec & D3V, gp_Vec & D3UUV, gp_Vec & D3UVV);

		/****** Geom_SurfaceOfRevolution::DN ******/
		/****** md5 signature: 78200f5fa5a4060f4022c2e3d9d8ac0e ******/
		%feature("compactdefaultargs") DN;
		%feature("autodoc", "
Parameters
----------
U: float
V: float
Nu: int
Nv: int

Return
-------
gp_Vec

Description
-----------
Computes the derivative of order Nu in the direction u and Nv in the direction v. //! Raised if the continuity of the surface is not CNu in the u direction and CNv in the v direction. Raised if Nu + Nv < 1 or Nu < 0 or Nv < 0. The following functions evaluates the local derivatives on surface. Useful to manage discontinuities on the surface. if Side = 1 -> P = S( U+,V ) if Side = -1 -> P = S( U-,V ) else P is betveen discontinuities can be evaluated using methods of global evaluations P = S( U ,V ).
") DN;
		gp_Vec DN(const Standard_Real U, const Standard_Real V, const Standard_Integer Nu, const Standard_Integer Nv);


        /****************** DumpJson ******************/
        %feature("autodoc", "
Parameters
----------
depth: int, default=-1

Return
-------
str

Description
-----------
Dump the object to JSON string.
") DumpJson;
        %extend{
            std::string DumpJson(int depth=-1) {
            std::stringstream s;
            self->DumpJson(s, depth);
            return "{" + s.str() + "}" ;}
        };
		/****** Geom_SurfaceOfRevolution::IsCNu ******/
		/****** md5 signature: c9f9f7f6eb82d83e9ba43e721cffba8a ******/
		%feature("compactdefaultargs") IsCNu;
		%feature("autodoc", "
Parameters
----------
N: int

Return
-------
bool

Description
-----------
IsCNu always returns true.
") IsCNu;
		Standard_Boolean IsCNu(const Standard_Integer N);

		/****** Geom_SurfaceOfRevolution::IsCNv ******/
		/****** md5 signature: 0acb88d1ffd7eea46785f30d7fc5f85e ******/
		%feature("compactdefaultargs") IsCNv;
		%feature("autodoc", "
Parameters
----------
N: int

Return
-------
bool

Description
-----------
IsCNv returns true if the degree of continuity of the meridian of this surface of revolution is at least N. Raised if N < 0.
") IsCNv;
		Standard_Boolean IsCNv(const Standard_Integer N);

		/****** Geom_SurfaceOfRevolution::IsUClosed ******/
		/****** md5 signature: d1e8bae29b90dc447f4693c94ad31c37 ******/
		%feature("compactdefaultargs") IsUClosed;
		%feature("autodoc", "Return
-------
bool

Description
-----------
IsUClosed always returns true.
") IsUClosed;
		Standard_Boolean IsUClosed();

		/****** Geom_SurfaceOfRevolution::IsUPeriodic ******/
		/****** md5 signature: 91acb028d6850ac4bbf00dc198b558b7 ******/
		%feature("compactdefaultargs") IsUPeriodic;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True.
") IsUPeriodic;
		Standard_Boolean IsUPeriodic();

		/****** Geom_SurfaceOfRevolution::IsVClosed ******/
		/****** md5 signature: aa0eae8155ddef3e9f1d0cc573955bb6 ******/
		%feature("compactdefaultargs") IsVClosed;
		%feature("autodoc", "Return
-------
bool

Description
-----------
IsVClosed returns true if the meridian of this surface of revolution is closed.
") IsVClosed;
		Standard_Boolean IsVClosed();

		/****** Geom_SurfaceOfRevolution::IsVPeriodic ******/
		/****** md5 signature: 88e9b94f2ab4a3d73c3fe787315e4448 ******/
		%feature("compactdefaultargs") IsVPeriodic;
		%feature("autodoc", "Return
-------
bool

Description
-----------
IsVPeriodic returns true if the meridian of this surface of revolution is periodic.
") IsVPeriodic;
		Standard_Boolean IsVPeriodic();

		/****** Geom_SurfaceOfRevolution::Location ******/
		/****** md5 signature: 42040ad2ed401b7e80bf90e4b6b5f418 ******/
		%feature("compactdefaultargs") Location;
		%feature("autodoc", "Return
-------
gp_Pnt

Description
-----------
Returns the location point of the axis of revolution.
") Location;
		const gp_Pnt Location();

		/****** Geom_SurfaceOfRevolution::ParametricTransformation ******/
		/****** md5 signature: 019b69215b9dcafd8e9b0052b449ea05 ******/
		%feature("compactdefaultargs") ParametricTransformation;
		%feature("autodoc", "
Parameters
----------
T: gp_Trsf

Return
-------
gp_GTrsf2d

Description
-----------
Returns a 2d transformation used to find the new parameters of a point on the transformed surface. @code me->Transformed(T)->Value(U',V') @endcode is the same point as @code me->Value(U,V).Transformed(T) @endcode Where U',V' are obtained by transforming U,V with the 2d transformation returned by @code me->ParametricTransformation(T) @endcode This method returns a scale centered on the U axis with BasisCurve()->ParametricTransformation(T).
") ParametricTransformation;
		virtual gp_GTrsf2d ParametricTransformation(const gp_Trsf & T);

		/****** Geom_SurfaceOfRevolution::ReferencePlane ******/
		/****** md5 signature: 92b79d852695acc61193a9d9588bc947 ******/
		%feature("compactdefaultargs") ReferencePlane;
		%feature("autodoc", "Return
-------
gp_Ax2

Description
-----------
Computes the position of the reference plane of the surface defined by the basis curve and the symmetry axis. The location point is the location point of the revolution's axis, the XDirection of the plane is given by the revolution's axis and the orientation of the normal to the plane is given by the sense of revolution. //! Raised if the revolved curve is not planar or if the revolved curve and the symmetry axis are not in the same plane or if the maximum of distance between the axis and the revolved curve is lower or equal to Resolution from gp.
") ReferencePlane;
		gp_Ax2 ReferencePlane();

		/****** Geom_SurfaceOfRevolution::SetAxis ******/
		/****** md5 signature: 4f1ae44e92ff7b1da601b2ca71a3a58a ******/
		%feature("compactdefaultargs") SetAxis;
		%feature("autodoc", "
Parameters
----------
A1: gp_Ax1

Return
-------
None

Description
-----------
Changes the axis of revolution. Warnings: It is not checked that the axis is in the plane of the revolved curve.
") SetAxis;
		void SetAxis(const gp_Ax1 & A1);

		/****** Geom_SurfaceOfRevolution::SetBasisCurve ******/
		/****** md5 signature: 0bacb30e6132653809532b048ced8a5b ******/
		%feature("compactdefaultargs") SetBasisCurve;
		%feature("autodoc", "
Parameters
----------
C: Geom_Curve

Return
-------
None

Description
-----------
Changes the revolved curve of the surface. Warnings: It is not checked that the curve C is planar and that the surface axis is in the plane of the curve. It is not checked that the revolved curve C doesn't self-intersects.
") SetBasisCurve;
		void SetBasisCurve(const opencascade::handle<Geom_Curve> & C);

		/****** Geom_SurfaceOfRevolution::SetDirection ******/
		/****** md5 signature: df8744d729e050a65ee65230eb199390 ******/
		%feature("compactdefaultargs") SetDirection;
		%feature("autodoc", "
Parameters
----------
V: gp_Dir

Return
-------
None

Description
-----------
Changes the direction of the revolution axis. Warnings: It is not checked that the axis is in the plane of the revolved curve.
") SetDirection;
		void SetDirection(const gp_Dir & V);

		/****** Geom_SurfaceOfRevolution::SetLocation ******/
		/****** md5 signature: c028aee785b685956e8e7d5cba7ecb46 ******/
		%feature("compactdefaultargs") SetLocation;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt

Return
-------
None

Description
-----------
Changes the location point of the revolution axis. Warnings: It is not checked that the axis is in the plane of the revolved curve.
") SetLocation;
		void SetLocation(const gp_Pnt & P);

		/****** Geom_SurfaceOfRevolution::Transform ******/
		/****** md5 signature: b643be97d129c62226d788cd0501ced0 ******/
		%feature("compactdefaultargs") Transform;
		%feature("autodoc", "
Parameters
----------
T: gp_Trsf

Return
-------
None

Description
-----------
Applies the transformation T to this surface of revolution.
") Transform;
		void Transform(const gp_Trsf & T);

		/****** Geom_SurfaceOfRevolution::TransformParameters ******/
		/****** md5 signature: 2d9e8651399bacbb299466ac222a6ca8 ******/
		%feature("compactdefaultargs") TransformParameters;
		%feature("autodoc", "
Parameters
----------
T: gp_Trsf

Return
-------
U: float
V: float

Description
-----------
Computes the parameters on the transformed surface for the transform of the point of parameters U,V on <self>. @code me->Transformed(T)->Value(U',V') @endcode is the same point as @code me->Value(U,V).Transformed(T) @endcode Where U',V' are the new values of U,V after calling @code me->TransformParameters(U,V,T) @endcode This method multiplies V by BasisCurve()->ParametricTransformation(T).
") TransformParameters;
		virtual void TransformParameters(Standard_Real &OutValue, Standard_Real &OutValue, const gp_Trsf & T);

		/****** Geom_SurfaceOfRevolution::UIso ******/
		/****** md5 signature: f5e8cbc22e32c38f4dd05caadff59fee ******/
		%feature("compactdefaultargs") UIso;
		%feature("autodoc", "
Parameters
----------
U: float

Return
-------
opencascade::handle<Geom_Curve>

Description
-----------
Computes the U isoparametric curve of this surface of revolution. It is the curve obtained by rotating the meridian through an angle U about the axis of revolution.
") UIso;
		opencascade::handle<Geom_Curve> UIso(const Standard_Real U);

		/****** Geom_SurfaceOfRevolution::UReverse ******/
		/****** md5 signature: 31a376207d6b3f3c82d0cde57034e1f2 ******/
		%feature("compactdefaultargs") UReverse;
		%feature("autodoc", "Return
-------
None

Description
-----------
Changes the orientation of this surface of revolution in the u parametric direction. The bounds of the surface are not changed but the given parametric direction is reversed. Hence the orientation of the surface is reversed. As a consequence: - UReverse reverses the direction of the axis of revolution of this surface,.
") UReverse;
		void UReverse();

		/****** Geom_SurfaceOfRevolution::UReversedParameter ******/
		/****** md5 signature: 0071925b176316f0aaaf26f369ac410c ******/
		%feature("compactdefaultargs") UReversedParameter;
		%feature("autodoc", "
Parameters
----------
U: float

Return
-------
float

Description
-----------
Computes the u parameter on the modified surface, when reversing its u parametric direction, for any point of u parameter U on this surface of revolution. In the case of a revolved surface: - UReversedParameter returns 2.*Pi - U.
") UReversedParameter;
		Standard_Real UReversedParameter(const Standard_Real U);

		/****** Geom_SurfaceOfRevolution::VIso ******/
		/****** md5 signature: ef8726fc193d6cf33f54c94b9ed952a5 ******/
		%feature("compactdefaultargs") VIso;
		%feature("autodoc", "
Parameters
----------
V: float

Return
-------
opencascade::handle<Geom_Curve>

Description
-----------
Computes the U isoparametric curve of this surface of revolution. It is the curve obtained by rotating the meridian through an angle U about the axis of revolution.
") VIso;
		opencascade::handle<Geom_Curve> VIso(const Standard_Real V);

		/****** Geom_SurfaceOfRevolution::VReverse ******/
		/****** md5 signature: ca22d262a13cf236e9be77a884d19536 ******/
		%feature("compactdefaultargs") VReverse;
		%feature("autodoc", "Return
-------
None

Description
-----------
Changes the orientation of this surface of revolution in the v parametric direction. The bounds of the surface are not changed but the given parametric direction is reversed. Hence the orientation of the surface is reversed. As a consequence: - VReverse reverses the meridian of this surface of revolution.
") VReverse;
		void VReverse();

		/****** Geom_SurfaceOfRevolution::VReversedParameter ******/
		/****** md5 signature: 92057d43e0e5ee078908582a4176343b ******/
		%feature("compactdefaultargs") VReversedParameter;
		%feature("autodoc", "
Parameters
----------
V: float

Return
-------
float

Description
-----------
Computes the v parameter on the modified surface, when reversing its v parametric direction, for any point of v parameter V on this surface of revolution. In the case of a revolved surface: - VReversedParameter returns the reversed parameter given by the function ReversedParameter called with V on the meridian.
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
		/****** Geom_ToroidalSurface::Geom_ToroidalSurface ******/
		/****** md5 signature: 25ed5b4c2b73633dc44555421cf57186 ******/
		%feature("compactdefaultargs") Geom_ToroidalSurface;
		%feature("autodoc", "
Parameters
----------
A3: gp_Ax3
MajorRadius: float
MinorRadius: float

Return
-------
None

Description
-----------
A3 is the local coordinate system of the surface. The orientation of increasing V parametric value is defined by the rotation around the main axis (ZAxis) in the trigonometric sense. The parametrization of the surface in the U direction is defined such as the normal Vector (N = D1U ^ D1V) is oriented towards the 'outside region' of the surface. Warnings: It is not forbidden to create a toroidal surface with MajorRadius = MinorRadius = 0.0 //! Raised if MinorRadius < 0.0 or if MajorRadius < 0.0.
") Geom_ToroidalSurface;
		 Geom_ToroidalSurface(const gp_Ax3 & A3, const Standard_Real MajorRadius, const Standard_Real MinorRadius);

		/****** Geom_ToroidalSurface::Geom_ToroidalSurface ******/
		/****** md5 signature: 83bbb14e7f62fe323233db4d9608d469 ******/
		%feature("compactdefaultargs") Geom_ToroidalSurface;
		%feature("autodoc", "
Parameters
----------
T: gp_Torus

Return
-------
None

Description
-----------
Creates a ToroidalSurface from a non transient Torus from package gp.
") Geom_ToroidalSurface;
		 Geom_ToroidalSurface(const gp_Torus & T);

		/****** Geom_ToroidalSurface::Area ******/
		/****** md5 signature: a514cbcf0bd2f53e9374f58dcecded92 ******/
		%feature("compactdefaultargs") Area;
		%feature("autodoc", "Return
-------
float

Description
-----------
Computes the aera of the surface.
") Area;
		Standard_Real Area();

		/****** Geom_ToroidalSurface::Bounds ******/
		/****** md5 signature: bbc36976e796eedf3c69513e986f2adb ******/
		%feature("compactdefaultargs") Bounds;
		%feature("autodoc", "
Parameters
----------

Return
-------
U1: float
U2: float
V1: float
V2: float

Description
-----------
Returns the parametric bounds U1, U2, V1 and V2 of this torus. For a torus: U1 = V1 = 0 and U2 = V2 = 2*PI .
") Bounds;
		void Bounds(Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** Geom_ToroidalSurface::Coefficients ******/
		/****** md5 signature: f3843308545d4e3af26668e295f3d035 ******/
		%feature("compactdefaultargs") Coefficients;
		%feature("autodoc", "
Parameters
----------
Coef: TColStd_Array1OfReal

Return
-------
None

Description
-----------
Returns the coefficients of the implicit equation of the surface in the absolute cartesian coordinate system: Coef(1) * X**4 + Coef(2) * Y**4 + Coef(3) * Z**4 + Coef(4) * X**3 * Y + Coef(5) * X**3 * Z + Coef(6) * Y**3 * X + Coef(7) * Y**3 * Z + Coef(8) * Z**3 * X + Coef(9) * Z**3 * Y + Coef(10) * X**2 * Y**2 + Coef(11) * X**2 * Z**2 + Coef(12) * Y**2 * Z**2 + Coef(13) * X**3 + Coef(14) * Y**3 + Coef(15) * Z**3 + Coef(16) * X**2 * Y + Coef(17) * X**2 * Z + Coef(18) * Y**2 * X + Coef(19) * Y**2 * Z + Coef(20) * Z**2 * X + Coef(21) * Z**2 * Y + Coef(22) * X**2 + Coef(23) * Y**2 + Coef(24) * Z**2 + Coef(25) * X * Y + Coef(26) * X * Z + Coef(27) * Y * Z + Coef(28) * X + Coef(29) * Y + Coef(30) * Z + Coef(31) = 0.0 Raised if the length of Coef is lower than 31.
") Coefficients;
		void Coefficients(TColStd_Array1OfReal & Coef);

		/****** Geom_ToroidalSurface::Copy ******/
		/****** md5 signature: 1360a3e0ea51e38ae19c71fb8aa1c4e9 ******/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom_Geometry>

Description
-----------
Creates a new object which is a copy of this torus.
") Copy;
		opencascade::handle<Geom_Geometry> Copy();

		/****** Geom_ToroidalSurface::D0 ******/
		/****** md5 signature: 909f7ecc223d561155c9c3ba4b8e7b64 ******/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "
Parameters
----------
U: float
V: float
P: gp_Pnt

Return
-------
None

Description
-----------
Computes the point P (U, V) on the surface. P (U, V) = Loc + MinorRadius * Sin (V) * Zdir + (MajorRadius + MinorRadius * Cos(V)) * (cos (U) * XDir + sin (U) * YDir) where Loc is the origin of the placement plane (XAxis, YAxis) XDir is the direction of the XAxis and YDir the direction of the YAxis and ZDir the direction of the ZAxis.
") D0;
		void D0(const Standard_Real U, const Standard_Real V, gp_Pnt & P);

		/****** Geom_ToroidalSurface::D1 ******/
		/****** md5 signature: 0868b105367e01c443402a5728aa3395 ******/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "
Parameters
----------
U: float
V: float
P: gp_Pnt
D1U: gp_Vec
D1V: gp_Vec

Return
-------
None

Description
-----------
Computes the current point and the first derivatives in the directions U and V.
") D1;
		void D1(const Standard_Real U, const Standard_Real V, gp_Pnt & P, gp_Vec & D1U, gp_Vec & D1V);

		/****** Geom_ToroidalSurface::D2 ******/
		/****** md5 signature: 5bdb029d3f1561c55d7ab1d1b0b0282a ******/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "
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

Return
-------
None

Description
-----------
Computes the current point, the first and the second derivatives in the directions U and V.
") D2;
		void D2(const Standard_Real U, const Standard_Real V, gp_Pnt & P, gp_Vec & D1U, gp_Vec & D1V, gp_Vec & D2U, gp_Vec & D2V, gp_Vec & D2UV);

		/****** Geom_ToroidalSurface::D3 ******/
		/****** md5 signature: 2fbd4d1b6bb5f19034b05b5a6e0ddec0 ******/
		%feature("compactdefaultargs") D3;
		%feature("autodoc", "
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

Return
-------
None

Description
-----------
Computes the current point, the first,the second and the third derivatives in the directions U and V.
") D3;
		void D3(const Standard_Real U, const Standard_Real V, gp_Pnt & P, gp_Vec & D1U, gp_Vec & D1V, gp_Vec & D2U, gp_Vec & D2V, gp_Vec & D2UV, gp_Vec & D3U, gp_Vec & D3V, gp_Vec & D3UUV, gp_Vec & D3UVV);

		/****** Geom_ToroidalSurface::DN ******/
		/****** md5 signature: 78200f5fa5a4060f4022c2e3d9d8ac0e ******/
		%feature("compactdefaultargs") DN;
		%feature("autodoc", "
Parameters
----------
U: float
V: float
Nu: int
Nv: int

Return
-------
gp_Vec

Description
-----------
Computes the derivative of order Nu in the direction u and Nv in the direction v. Raised if Nu + Nv < 1 or Nu < 0 or Nv < 0.
") DN;
		gp_Vec DN(const Standard_Real U, const Standard_Real V, const Standard_Integer Nu, const Standard_Integer Nv);


        /****************** DumpJson ******************/
        %feature("autodoc", "
Parameters
----------
depth: int, default=-1

Return
-------
str

Description
-----------
Dump the object to JSON string.
") DumpJson;
        %extend{
            std::string DumpJson(int depth=-1) {
            std::stringstream s;
            self->DumpJson(s, depth);
            return "{" + s.str() + "}" ;}
        };
		/****** Geom_ToroidalSurface::IsUClosed ******/
		/****** md5 signature: d1e8bae29b90dc447f4693c94ad31c37 ******/
		%feature("compactdefaultargs") IsUClosed;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True.
") IsUClosed;
		Standard_Boolean IsUClosed();

		/****** Geom_ToroidalSurface::IsUPeriodic ******/
		/****** md5 signature: 91acb028d6850ac4bbf00dc198b558b7 ******/
		%feature("compactdefaultargs") IsUPeriodic;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True.
") IsUPeriodic;
		Standard_Boolean IsUPeriodic();

		/****** Geom_ToroidalSurface::IsVClosed ******/
		/****** md5 signature: aa0eae8155ddef3e9f1d0cc573955bb6 ******/
		%feature("compactdefaultargs") IsVClosed;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True.
") IsVClosed;
		Standard_Boolean IsVClosed();

		/****** Geom_ToroidalSurface::IsVPeriodic ******/
		/****** md5 signature: 88e9b94f2ab4a3d73c3fe787315e4448 ******/
		%feature("compactdefaultargs") IsVPeriodic;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True.
") IsVPeriodic;
		Standard_Boolean IsVPeriodic();

		/****** Geom_ToroidalSurface::MajorRadius ******/
		/****** md5 signature: e961bb81456f4d0a6154d0e9401e1ce8 ******/
		%feature("compactdefaultargs") MajorRadius;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the major radius, or the minor radius, of this torus.
") MajorRadius;
		Standard_Real MajorRadius();

		/****** Geom_ToroidalSurface::MinorRadius ******/
		/****** md5 signature: e1383e2287a25901af1e2b42cc95af4d ******/
		%feature("compactdefaultargs") MinorRadius;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the major radius, or the minor radius, of this torus.
") MinorRadius;
		Standard_Real MinorRadius();

		/****** Geom_ToroidalSurface::SetMajorRadius ******/
		/****** md5 signature: 5b6d39118ca624402ca904f240869d93 ******/
		%feature("compactdefaultargs") SetMajorRadius;
		%feature("autodoc", "
Parameters
----------
MajorRadius: float

Return
-------
None

Description
-----------
Modifies this torus by changing its major radius. Exceptions Standard_ConstructionError if: - MajorRadius is negative, or - MajorRadius - r is less than or equal to gp::Resolution(), where r is the minor radius of this torus.
") SetMajorRadius;
		void SetMajorRadius(const Standard_Real MajorRadius);

		/****** Geom_ToroidalSurface::SetMinorRadius ******/
		/****** md5 signature: 55b33932324c77b3c1e82a433bb9350f ******/
		%feature("compactdefaultargs") SetMinorRadius;
		%feature("autodoc", "
Parameters
----------
MinorRadius: float

Return
-------
None

Description
-----------
Modifies this torus by changing its minor radius. Exceptions Standard_ConstructionError if: - MinorRadius is negative, or - R - MinorRadius is less than or equal to gp::Resolution(), where R is the major radius of this torus.
") SetMinorRadius;
		void SetMinorRadius(const Standard_Real MinorRadius);

		/****** Geom_ToroidalSurface::SetTorus ******/
		/****** md5 signature: dde85b6216461d99d1a99d908f38c20c ******/
		%feature("compactdefaultargs") SetTorus;
		%feature("autodoc", "
Parameters
----------
T: gp_Torus

Return
-------
None

Description
-----------
Converts the gp_Torus torus T into this torus.
") SetTorus;
		void SetTorus(const gp_Torus & T);

		/****** Geom_ToroidalSurface::Torus ******/
		/****** md5 signature: 9bb22d5b92ef11cba62e467d89f58c66 ******/
		%feature("compactdefaultargs") Torus;
		%feature("autodoc", "Return
-------
gp_Torus

Description
-----------
Returns the non transient torus with the same geometric properties as <self>.
") Torus;
		gp_Torus Torus();

		/****** Geom_ToroidalSurface::Transform ******/
		/****** md5 signature: b643be97d129c62226d788cd0501ced0 ******/
		%feature("compactdefaultargs") Transform;
		%feature("autodoc", "
Parameters
----------
T: gp_Trsf

Return
-------
None

Description
-----------
Applies the transformation T to this torus.
") Transform;
		void Transform(const gp_Trsf & T);

		/****** Geom_ToroidalSurface::UIso ******/
		/****** md5 signature: f5e8cbc22e32c38f4dd05caadff59fee ******/
		%feature("compactdefaultargs") UIso;
		%feature("autodoc", "
Parameters
----------
U: float

Return
-------
opencascade::handle<Geom_Curve>

Description
-----------
Computes the U isoparametric curve. //! For a toroidal surface the UIso curve is a circle. The center of the Uiso circle is at the distance MajorRadius from the location point of the toroidal surface. Warnings: The radius of the circle can be zero if for the surface MinorRadius = 0.0.
") UIso;
		opencascade::handle<Geom_Curve> UIso(const Standard_Real U);

		/****** Geom_ToroidalSurface::UReversedParameter ******/
		/****** md5 signature: 0071925b176316f0aaaf26f369ac410c ******/
		%feature("compactdefaultargs") UReversedParameter;
		%feature("autodoc", "
Parameters
----------
U: float

Return
-------
float

Description
-----------
Return the parameter on the Ureversed surface for the point of parameter U on <self>. Return 2.PI - U.
") UReversedParameter;
		Standard_Real UReversedParameter(const Standard_Real U);

		/****** Geom_ToroidalSurface::VIso ******/
		/****** md5 signature: ef8726fc193d6cf33f54c94b9ed952a5 ******/
		%feature("compactdefaultargs") VIso;
		%feature("autodoc", "
Parameters
----------
V: float

Return
-------
opencascade::handle<Geom_Curve>

Description
-----------
Computes the V isoparametric curve. //! For a ToroidalSurface the VIso curve is a circle. The axis of the circle is the main axis (ZAxis) of the toroidal surface. Warnings: The radius of the circle can be zero if for the surface MajorRadius = MinorRadius.
") VIso;
		opencascade::handle<Geom_Curve> VIso(const Standard_Real V);

		/****** Geom_ToroidalSurface::VReversedParameter ******/
		/****** md5 signature: 9ba1e2b28a639214b6f94e4db7b7b7f8 ******/
		%feature("compactdefaultargs") VReversedParameter;
		%feature("autodoc", "
Parameters
----------
U: float

Return
-------
float

Description
-----------
Return the parameter on the Ureversed surface for the point of parameter U on <self>. Return 2.PI - U.
") VReversedParameter;
		Standard_Real VReversedParameter(const Standard_Real U);

		/****** Geom_ToroidalSurface::Volume ******/
		/****** md5 signature: 09f69eb56723243a302bd3839799847b ******/
		%feature("compactdefaultargs") Volume;
		%feature("autodoc", "Return
-------
float

Description
-----------
Computes the volume.
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
		/****** Geom_TrimmedCurve::Geom_TrimmedCurve ******/
		/****** md5 signature: af27e9dc4a37cd4bd20912c47b488def ******/
		%feature("compactdefaultargs") Geom_TrimmedCurve;
		%feature("autodoc", "
Parameters
----------
C: Geom_Curve
U1: float
U2: float
Sense: bool (optional, default to Standard_True)
theAdjustPeriodic: bool (optional, default to Standard_True)

Return
-------
None

Description
-----------
Constructs a trimmed curve from the basis curve C which is limited between parameter values U1 and U2. Note: - U1 can be greater or less than U2; in both cases, the returned curve is oriented from U1 to U2. - If the basis curve C is periodic, there is an ambiguity because two parts are available. In this case, the trimmed curve has the same orientation as the basis curve if Sense is true (default value) or the opposite orientation if Sense is false. - If the curve is closed but not periodic, it is not possible to keep the part of the curve which includes the junction point (except if the junction point is at the beginning or at the end of the trimmed curve). If you tried to do this, you could alter the fundamental characteristics of the basis curve, which are used, for example, to compute the derivatives of the trimmed curve. The rules for a closed curve are therefore the same as those for an open curve. Warning: The trimmed curve is built from a copy of curve C. Therefore, when C is modified, the trimmed curve is not modified. - If the basis curve is periodic and theAdjustPeriodic is True, the bounds of the trimmed curve may be different from U1 and U2 if the parametric origin of the basis curve is within the arc of the trimmed curve. In this case, the modified parameter will be equal to U1 or U2 plus or minus the period. When theAdjustPeriodic is False, parameters U1 and U2 will be the same, without adjustment into the first period. Exceptions Standard_ConstructionError if: - C is not periodic and U1 or U2 is outside the bounds of C, or - U1 is equal to U2.
") Geom_TrimmedCurve;
		 Geom_TrimmedCurve(const opencascade::handle<Geom_Curve> & C, const Standard_Real U1, const Standard_Real U2, const Standard_Boolean Sense = Standard_True, const Standard_Boolean theAdjustPeriodic = Standard_True);

		/****** Geom_TrimmedCurve::BasisCurve ******/
		/****** md5 signature: ece4de977d9b1715803929678e07eec5 ******/
		%feature("compactdefaultargs") BasisCurve;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom_Curve>

Description
-----------
Returns the basis curve. Warning This function does not return a constant reference. Consequently, any modification of the returned value directly modifies the trimmed curve.
") BasisCurve;
		opencascade::handle<Geom_Curve> BasisCurve();

		/****** Geom_TrimmedCurve::Continuity ******/
		/****** md5 signature: 9381b370dfdd50af7f1b79ce202f0c6f ******/
		%feature("compactdefaultargs") Continuity;
		%feature("autodoc", "Return
-------
GeomAbs_Shape

Description
-----------
Returns the continuity of the curve: C0: only geometric continuity, C1: continuity of the first derivative all along the Curve, C2: continuity of the second derivative all along the Curve, C3: continuity of the third derivative all along the Curve, CN: the order of continuity is infinite.
") Continuity;
		GeomAbs_Shape Continuity();

		/****** Geom_TrimmedCurve::Copy ******/
		/****** md5 signature: 1360a3e0ea51e38ae19c71fb8aa1c4e9 ******/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom_Geometry>

Description
-----------
Creates a new object which is a copy of this trimmed curve.
") Copy;
		opencascade::handle<Geom_Geometry> Copy();

		/****** Geom_TrimmedCurve::D0 ******/
		/****** md5 signature: 5f7d08d8d17afc516aac9ef64bf9711f ******/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "
Parameters
----------
U: float
P: gp_Pnt

Return
-------
None

Description
-----------
Returns in P the point of parameter U. //! If the basis curve is an OffsetCurve sometimes it is not possible to do the evaluation of the curve at the parameter U (see class OffsetCurve).
") D0;
		void D0(const Standard_Real U, gp_Pnt & P);

		/****** Geom_TrimmedCurve::D1 ******/
		/****** md5 signature: 0264d3f49439e8cb4580d20449d25b51 ******/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "
Parameters
----------
U: float
P: gp_Pnt
V1: gp_Vec

Return
-------
None

Description
-----------
Raised if the continuity of the curve is not C1.
") D1;
		void D1(const Standard_Real U, gp_Pnt & P, gp_Vec & V1);

		/****** Geom_TrimmedCurve::D2 ******/
		/****** md5 signature: a694b4ba68c0fd83fbac79f945cb5d8c ******/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "
Parameters
----------
U: float
P: gp_Pnt
V1: gp_Vec
V2: gp_Vec

Return
-------
None

Description
-----------
Raised if the continuity of the curve is not C2.
") D2;
		void D2(const Standard_Real U, gp_Pnt & P, gp_Vec & V1, gp_Vec & V2);

		/****** Geom_TrimmedCurve::D3 ******/
		/****** md5 signature: cf1c3b5fe7af9d5c183c1b16b21c43f1 ******/
		%feature("compactdefaultargs") D3;
		%feature("autodoc", "
Parameters
----------
U: float
P: gp_Pnt
V1: gp_Vec
V2: gp_Vec
V3: gp_Vec

Return
-------
None

Description
-----------
Raised if the continuity of the curve is not C3.
") D3;
		void D3(const Standard_Real U, gp_Pnt & P, gp_Vec & V1, gp_Vec & V2, gp_Vec & V3);

		/****** Geom_TrimmedCurve::DN ******/
		/****** md5 signature: 0d4a3e2fc2b4b03d2a49e0796a487efb ******/
		%feature("compactdefaultargs") DN;
		%feature("autodoc", "
Parameters
----------
U: float
N: int

Return
-------
gp_Vec

Description
-----------
N is the order of derivation. Raised if the continuity of the curve is not CN. Raised if N < 1. geometric transformations.
") DN;
		gp_Vec DN(const Standard_Real U, const Standard_Integer N);


        /****************** DumpJson ******************/
        %feature("autodoc", "
Parameters
----------
depth: int, default=-1

Return
-------
str

Description
-----------
Dump the object to JSON string.
") DumpJson;
        %extend{
            std::string DumpJson(int depth=-1) {
            std::stringstream s;
            self->DumpJson(s, depth);
            return "{" + s.str() + "}" ;}
        };
		/****** Geom_TrimmedCurve::EndPoint ******/
		/****** md5 signature: 8dd4886e4c303cec8092c23bff0110c3 ******/
		%feature("compactdefaultargs") EndPoint;
		%feature("autodoc", "Return
-------
gp_Pnt

Description
-----------
Returns the end point of <self>. This point is the evaluation of the curve for the 'LastParameter'.
") EndPoint;
		gp_Pnt EndPoint();

		/****** Geom_TrimmedCurve::FirstParameter ******/
		/****** md5 signature: eb9ebe94572bd67588fe8811eac261fb ******/
		%feature("compactdefaultargs") FirstParameter;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the value of the first parameter of <self>. The first parameter is the parameter of the 'StartPoint' of the trimmed curve.
") FirstParameter;
		Standard_Real FirstParameter();

		/****** Geom_TrimmedCurve::IsCN ******/
		/****** md5 signature: 73c2d9ecdd776a5227f0665f0702fcb3 ******/
		%feature("compactdefaultargs") IsCN;
		%feature("autodoc", "
Parameters
----------
N: int

Return
-------
bool

Description
-----------
Returns true if the degree of continuity of the basis curve of this trimmed curve is at least N. A trimmed curve is at least 'C0' continuous. Warnings: The continuity of the trimmed curve can be greater than the continuity of the basis curve because you consider only a part of the basis curve. Raised if N < 0.
") IsCN;
		Standard_Boolean IsCN(const Standard_Integer N);

		/****** Geom_TrimmedCurve::IsClosed ******/
		/****** md5 signature: 00978070ec4cb5f00d1d002a8d5d3763 ******/
		%feature("compactdefaultargs") IsClosed;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if the distance between the StartPoint and the EndPoint is lower or equal to Resolution from package gp.
") IsClosed;
		Standard_Boolean IsClosed();

		/****** Geom_TrimmedCurve::IsPeriodic ******/
		/****** md5 signature: 15e3ccfd3ad4ae42959489f7f64aa8ca ******/
		%feature("compactdefaultargs") IsPeriodic;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Always returns False (independently of the type of basis curve).
") IsPeriodic;
		Standard_Boolean IsPeriodic();

		/****** Geom_TrimmedCurve::LastParameter ******/
		/****** md5 signature: cb4925a2d4a451ceec8f6ad486530f9c ******/
		%feature("compactdefaultargs") LastParameter;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the value of the last parameter of <self>. The last parameter is the parameter of the 'EndPoint' of the trimmed curve.
") LastParameter;
		Standard_Real LastParameter();

		/****** Geom_TrimmedCurve::ParametricTransformation ******/
		/****** md5 signature: 0cdeed55440cf3859605fa52b3b17441 ******/
		%feature("compactdefaultargs") ParametricTransformation;
		%feature("autodoc", "
Parameters
----------
T: gp_Trsf

Return
-------
float

Description
-----------
Returns a coefficient to compute the parameter on the transformed curve for the transform of the point on <self>. //! Transformed(T)->Value(U * ParametricTransformation(T)) //! is the same point as //! Value(U).Transformed(T) //! This methods calls the basis curve method.
") ParametricTransformation;
		virtual Standard_Real ParametricTransformation(const gp_Trsf & T);

		/****** Geom_TrimmedCurve::Period ******/
		/****** md5 signature: a0af1de0407384df43b0e76d6b472231 ******/
		%feature("compactdefaultargs") Period;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the period of the basis curve of this trimmed curve. Exceptions Standard_NoSuchObject if the basis curve is not periodic.
") Period;
		virtual Standard_Real Period();

		/****** Geom_TrimmedCurve::Reverse ******/
		/****** md5 signature: bff3d53d1cf0b268b7de85021a2bf3c4 ******/
		%feature("compactdefaultargs") Reverse;
		%feature("autodoc", "Return
-------
None

Description
-----------
Changes the orientation of this trimmed curve. As a result: - the basis curve is reversed, - the start point of the initial curve becomes the end point of the reversed curve, - the end point of the initial curve becomes the start point of the reversed curve, - the first and last parameters are recomputed. If the trimmed curve was defined by: - a basis curve whose parameter range is [ 0., 1. ], - the two trim values U1 (first parameter) and U2 (last parameter), the reversed trimmed curve is defined by: - the reversed basis curve, whose parameter range is still [ 0., 1. ], - the two trim values 1. - U2 (first parameter) and 1. - U1 (last parameter).
") Reverse;
		void Reverse();

		/****** Geom_TrimmedCurve::ReversedParameter ******/
		/****** md5 signature: 382721d5a4ea752fecc12f03ab0de9a1 ******/
		%feature("compactdefaultargs") ReversedParameter;
		%feature("autodoc", "
Parameters
----------
U: float

Return
-------
float

Description
-----------
Computes the parameter on the reversed curve for the point of parameter U on this trimmed curve.
") ReversedParameter;
		Standard_Real ReversedParameter(const Standard_Real U);

		/****** Geom_TrimmedCurve::SetTrim ******/
		/****** md5 signature: e089a6e39b5be7b78b7d6ffa6359d842 ******/
		%feature("compactdefaultargs") SetTrim;
		%feature("autodoc", "
Parameters
----------
U1: float
U2: float
Sense: bool (optional, default to Standard_True)
theAdjustPeriodic: bool (optional, default to Standard_True)

Return
-------
None

Description
-----------
Changes this trimmed curve, by redefining the parameter values U1 and U2 which limit its basis curve. Note: If the basis curve is periodic, the trimmed curve has the same orientation as the basis curve if Sense is true (default value) or the opposite orientation if Sense is false. Warning If the basis curve is periodic and theAdjustPeriodic is True, the bounds of the trimmed curve may be different from U1 and U2 if the parametric origin of the basis curve is within the arc of the trimmed curve. In this case, the modified parameter will be equal to U1 or U2 plus or minus the period. When theAdjustPeriodic is False, parameters U1 and U2 will be the same, without adjustment into the first period. Exceptions Standard_ConstructionError if: - the basis curve is not periodic, and either U1 or U2 are outside the bounds of the basis curve, or - U1 is equal to U2.
") SetTrim;
		void SetTrim(const Standard_Real U1, const Standard_Real U2, const Standard_Boolean Sense = Standard_True, const Standard_Boolean theAdjustPeriodic = Standard_True);

		/****** Geom_TrimmedCurve::StartPoint ******/
		/****** md5 signature: ccb2a909a54dc7dd0800015a563c1ff7 ******/
		%feature("compactdefaultargs") StartPoint;
		%feature("autodoc", "Return
-------
gp_Pnt

Description
-----------
Returns the start point of <self>. This point is the evaluation of the curve from the 'FirstParameter'. value and derivatives Warnings: The returned derivatives have the same orientation as the derivatives of the basis curve even if the trimmed curve has not the same orientation as the basis curve.
") StartPoint;
		gp_Pnt StartPoint();

		/****** Geom_TrimmedCurve::Transform ******/
		/****** md5 signature: b643be97d129c62226d788cd0501ced0 ******/
		%feature("compactdefaultargs") Transform;
		%feature("autodoc", "
Parameters
----------
T: gp_Trsf

Return
-------
None

Description
-----------
Applies the transformation T to this trimmed curve. Warning The basis curve is also modified.
") Transform;
		void Transform(const gp_Trsf & T);

		/****** Geom_TrimmedCurve::TransformedParameter ******/
		/****** md5 signature: 1a552ef75f7726e4135a5d28749cc3da ******/
		%feature("compactdefaultargs") TransformedParameter;
		%feature("autodoc", "
Parameters
----------
U: float
T: gp_Trsf

Return
-------
float

Description
-----------
Returns the parameter on the transformed curve for the transform of the point of parameter U on <self>. //! me->Transformed(T)->Value(me->TransformedParameter(U,T)) //! is the same point as //! me->Value(U).Transformed(T) //! This methods calls the basis curve method.
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


/* class aliases */
%pythoncode {
}
/* deprecated methods */
%pythoncode {
@deprecated
def Geom_BSplineCurve_MaxDegree(*args):
	return Geom_BSplineCurve.MaxDegree(*args)

@deprecated
def Geom_BSplineSurface_MaxDegree(*args):
	return Geom_BSplineSurface.MaxDegree(*args)

@deprecated
def Geom_BezierCurve_MaxDegree(*args):
	return Geom_BezierCurve.MaxDegree(*args)

@deprecated
def Geom_BezierSurface_MaxDegree(*args):
	return Geom_BezierSurface.MaxDegree(*args)

}
