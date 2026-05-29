/*
Copyright 2008-2026 Thomas Paviot (tpaviot@gmail.com)

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
%define GEOM2DDOCSTRING
"Geom2d module, see official documentation at
https://dev.opencascade.org/doc/occt-7.9.0/refman/html/package_geom2d.html"
%enddef
%module (package="OCC.Core", docstring=GEOM2DDOCSTRING) Geom2d


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
#include<Geom2d_module.hxx>

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
%wrap_handle(Geom2d_Geometry)
%wrap_handle(Geom2d_Transformation)
%wrap_handle(Geom2d_AxisPlacement)
%wrap_handle(Geom2d_Curve)
%wrap_handle(Geom2d_Point)
%wrap_handle(Geom2d_Vector)
%wrap_handle(Geom2d_BoundedCurve)
%wrap_handle(Geom2d_CartesianPoint)
%wrap_handle(Geom2d_Conic)
%wrap_handle(Geom2d_Direction)
%wrap_handle(Geom2d_Line)
%wrap_handle(Geom2d_OffsetCurve)
%wrap_handle(Geom2d_VectorWithMagnitude)
%wrap_handle(Geom2d_BSplineCurve)
%wrap_handle(Geom2d_BezierCurve)
%wrap_handle(Geom2d_Circle)
%wrap_handle(Geom2d_Ellipse)
%wrap_handle(Geom2d_Hyperbola)
%wrap_handle(Geom2d_Parabola)
%wrap_handle(Geom2d_TrimmedCurve)
/* end handles declaration */

/* templates */
/* end templates declaration */

/* typedefs */
/* end typedefs declaration */

/************************
* class Geom2d_Geometry *
************************/
%nodefaultctor Geom2d_Geometry;
class Geom2d_Geometry : public Standard_Transient {
	public:
		/****** Geom2d_Geometry::Copy ******/
		/****** md5 signature: e941544322101d25f6ce3e354598b6da ******/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom2d_Geometry>

Description
-----------
No available documentation.
") Copy;
		virtual opencascade::handle<Geom2d_Geometry> Copy();


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
		/****** Geom2d_Geometry::Mirror ******/
		/****** md5 signature: 5a90a3ec4faf7909390bb0bfb4d9be0f ******/
		%feature("compactdefaultargs") Mirror;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt2d

Return
-------
None

Description
-----------
Performs the symmetrical transformation of a Geometry with respect to the point P which is the center of the symmetry and assigns the result to this geometric object.
") Mirror;
		void Mirror(const gp_Pnt2d & P);

		/****** Geom2d_Geometry::Mirror ******/
		/****** md5 signature: 8b8d921c1e87f73e8278c4d42ae298f7 ******/
		%feature("compactdefaultargs") Mirror;
		%feature("autodoc", "
Parameters
----------
A: gp_Ax2d

Return
-------
None

Description
-----------
Performs the symmetrical transformation of a Geometry with respect to an axis placement which is the axis of the symmetry.
") Mirror;
		void Mirror(const gp_Ax2d & A);

		/****** Geom2d_Geometry::Mirrored ******/
		/****** md5 signature: 49242289e864c4f165347a3dd5bb65c0 ******/
		%feature("compactdefaultargs") Mirrored;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt2d

Return
-------
opencascade::handle<Geom2d_Geometry>

Description
-----------
No available documentation.
") Mirrored;
		opencascade::handle<Geom2d_Geometry> Mirrored(const gp_Pnt2d & P);

		/****** Geom2d_Geometry::Mirrored ******/
		/****** md5 signature: 4ead5798e50f8f5bb5867aded4611bbc ******/
		%feature("compactdefaultargs") Mirrored;
		%feature("autodoc", "
Parameters
----------
A: gp_Ax2d

Return
-------
opencascade::handle<Geom2d_Geometry>

Description
-----------
No available documentation.
") Mirrored;
		opencascade::handle<Geom2d_Geometry> Mirrored(const gp_Ax2d & A);

		/****** Geom2d_Geometry::Rotate ******/
		/****** md5 signature: 2592cd0a6c5949d0f528c5a9e66c0d34 ******/
		%feature("compactdefaultargs") Rotate;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt2d
Ang: double

Return
-------
None

Description
-----------
Rotates a Geometry. P is the center of the rotation. Ang is the angular value of the rotation in radians.
") Rotate;
		void Rotate(const gp_Pnt2d & P, const double Ang);

		/****** Geom2d_Geometry::Rotated ******/
		/****** md5 signature: c68b2c2edb2300473e626c122a5a5fa5 ******/
		%feature("compactdefaultargs") Rotated;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt2d
Ang: double

Return
-------
opencascade::handle<Geom2d_Geometry>

Description
-----------
No available documentation.
") Rotated;
		opencascade::handle<Geom2d_Geometry> Rotated(const gp_Pnt2d & P, const double Ang);

		/****** Geom2d_Geometry::Scale ******/
		/****** md5 signature: 185e17cf09e4114cdb1b85551d1347d8 ******/
		%feature("compactdefaultargs") Scale;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt2d
S: double

Return
-------
None

Description
-----------
Scales a Geometry. S is the scaling value.
") Scale;
		void Scale(const gp_Pnt2d & P, const double S);

		/****** Geom2d_Geometry::Scaled ******/
		/****** md5 signature: a6916d20196e2eb716d3e96efccb8cbd ******/
		%feature("compactdefaultargs") Scaled;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt2d
S: double

Return
-------
opencascade::handle<Geom2d_Geometry>

Description
-----------
No available documentation.
") Scaled;
		opencascade::handle<Geom2d_Geometry> Scaled(const gp_Pnt2d & P, const double S);

		/****** Geom2d_Geometry::Transform ******/
		/****** md5 signature: c3ffea2eab5fb0806d25cb15f6b04040 ******/
		%feature("compactdefaultargs") Transform;
		%feature("autodoc", "
Parameters
----------
T: gp_Trsf2d

Return
-------
None

Description
-----------
Transformation of a geometric object. This transformation can be a translation, a rotation, a symmetry, a scaling or a complex transformation obtained by combination of the previous elementaries transformations. (see class Transformation of the package Geom2d). The following transformations have the same properties as the previous ones but they don't modified the object itself. A copy of the object is returned.
") Transform;
		virtual void Transform(const gp_Trsf2d & T);

		/****** Geom2d_Geometry::Transformed ******/
		/****** md5 signature: bcfedd39e1cdbe24142d5657f9eef985 ******/
		%feature("compactdefaultargs") Transformed;
		%feature("autodoc", "
Parameters
----------
T: gp_Trsf2d

Return
-------
opencascade::handle<Geom2d_Geometry>

Description
-----------
No available documentation.
") Transformed;
		opencascade::handle<Geom2d_Geometry> Transformed(const gp_Trsf2d & T);

		/****** Geom2d_Geometry::Translate ******/
		/****** md5 signature: 1cd2e000b85692a9f89a6bf8e8e4782c ******/
		%feature("compactdefaultargs") Translate;
		%feature("autodoc", "
Parameters
----------
V: gp_Vec2d

Return
-------
None

Description
-----------
Translates a Geometry. V is the vector of the translation.
") Translate;
		void Translate(const gp_Vec2d & V);

		/****** Geom2d_Geometry::Translate ******/
		/****** md5 signature: c7768f1dcf9b6595f2bd4653737544f9 ******/
		%feature("compactdefaultargs") Translate;
		%feature("autodoc", "
Parameters
----------
P1: gp_Pnt2d
P2: gp_Pnt2d

Return
-------
None

Description
-----------
Translates a Geometry from the point P1 to the point P2.
") Translate;
		void Translate(const gp_Pnt2d & P1, const gp_Pnt2d & P2);

		/****** Geom2d_Geometry::Translated ******/
		/****** md5 signature: 6fca5d54a6f24c5d9c223451e560b770 ******/
		%feature("compactdefaultargs") Translated;
		%feature("autodoc", "
Parameters
----------
V: gp_Vec2d

Return
-------
opencascade::handle<Geom2d_Geometry>

Description
-----------
No available documentation.
") Translated;
		opencascade::handle<Geom2d_Geometry> Translated(const gp_Vec2d & V);

		/****** Geom2d_Geometry::Translated ******/
		/****** md5 signature: 047815d976186c88c7521c06787992e9 ******/
		%feature("compactdefaultargs") Translated;
		%feature("autodoc", "
Parameters
----------
P1: gp_Pnt2d
P2: gp_Pnt2d

Return
-------
opencascade::handle<Geom2d_Geometry>

Description
-----------
No available documentation.
") Translated;
		opencascade::handle<Geom2d_Geometry> Translated(const gp_Pnt2d & P1, const gp_Pnt2d & P2);

};


%make_alias(Geom2d_Geometry)

%extend Geom2d_Geometry {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************
* class Geom2d_Transformation *
******************************/
class Geom2d_Transformation : public Standard_Transient {
	public:
		/****** Geom2d_Transformation::Geom2d_Transformation ******/
		/****** md5 signature: 0f03ea49c0526417ce39b130dcc97e09 ******/
		%feature("compactdefaultargs") Geom2d_Transformation;
		%feature("autodoc", "Return
-------
None

Description
-----------
Creates an identity transformation.
") Geom2d_Transformation;
		 Geom2d_Transformation();

		/****** Geom2d_Transformation::Geom2d_Transformation ******/
		/****** md5 signature: 46c844c0fcce2abbfb326c65c62e5c41 ******/
		%feature("compactdefaultargs") Geom2d_Transformation;
		%feature("autodoc", "
Parameters
----------
T: gp_Trsf2d

Return
-------
None

Description
-----------
Creates a persistent copy of T.
") Geom2d_Transformation;
		 Geom2d_Transformation(const gp_Trsf2d & T);

		/****** Geom2d_Transformation::Copy ******/
		/****** md5 signature: 6df047016d06bfed1f9fcc0643348901 ******/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom2d_Transformation>

Description
-----------
Creates a new object, which is a copy of this transformation.
") Copy;
		opencascade::handle<Geom2d_Transformation> Copy();

		/****** Geom2d_Transformation::Form ******/
		/****** md5 signature: 9bfbf058eebcd895fd3b29a4bba4ff05 ******/
		%feature("compactdefaultargs") Form;
		%feature("autodoc", "Return
-------
gp_TrsfForm

Description
-----------
Returns the nature of this transformation as a value of the gp_TrsfForm enumeration. Returns the nature of the transformation. It can be Identity, Rotation, Translation, PntMirror, Ax1Mirror, Scale, CompoundTrsf.
") Form;
		gp_TrsfForm Form();

		/****** Geom2d_Transformation::Invert ******/
		/****** md5 signature: 980f166f600d23a8c77565829af2eeff ******/
		%feature("compactdefaultargs") Invert;
		%feature("autodoc", "Return
-------
None

Description
-----------
Computes the inverse of this transformation and assigns the result to this transformation. //! Raised if the transformation is singular. This means that the ScaleFactor is lower or equal to Resolution from package gp.
") Invert;
		void Invert();

		/****** Geom2d_Transformation::Inverted ******/
		/****** md5 signature: ac7792d594b6e5d63f643761efff806c ******/
		%feature("compactdefaultargs") Inverted;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom2d_Transformation>

Description
-----------
Computes the inverse of this transformation and creates a new one. Raises ConstructionError if the transformation is singular. This means that the ScaleFactor is lower or equal to Resolution from package gp.
") Inverted;
		opencascade::handle<Geom2d_Transformation> Inverted();

		/****** Geom2d_Transformation::IsNegative ******/
		/****** md5 signature: be9b409231cb3b69c57c1899ebc536a7 ******/
		%feature("compactdefaultargs") IsNegative;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Checks whether this transformation is an indirect transformation: returns true if the determinant of the matrix of the vectorial part of the transformation is less than 0.
") IsNegative;
		bool IsNegative();

		/****** Geom2d_Transformation::Multiplied ******/
		/****** md5 signature: ff8178e5123036b64b3a48d6d1795233 ******/
		%feature("compactdefaultargs") Multiplied;
		%feature("autodoc", "
Parameters
----------
Other: Geom2d_Transformation

Return
-------
opencascade::handle<Geom2d_Transformation>

Description
-----------
Computes the transformation composed with Other and <self>. <self> * Other. Returns a new transformation.
") Multiplied;
		opencascade::handle<Geom2d_Transformation> Multiplied(const opencascade::handle<Geom2d_Transformation> & Other);

		/****** Geom2d_Transformation::Multiply ******/
		/****** md5 signature: d5f7d077f3830e2c8783e1f4f428d5d4 ******/
		%feature("compactdefaultargs") Multiply;
		%feature("autodoc", "
Parameters
----------
Other: Geom2d_Transformation

Return
-------
None

Description
-----------
Computes the transformation composed with Other and <self> . <self> = <self> * Other. //! Computes the following composition of transformations if N > 0 <self> * <self> * .......* <self>. if N = 0 Identity if N < 0 <self>.Invert() * .........* <self>.Invert().
") Multiply;
		void Multiply(const opencascade::handle<Geom2d_Transformation> & Other);

		/****** Geom2d_Transformation::Power ******/
		/****** md5 signature: a7e374be9d95744c97f4138f50b553b6 ******/
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
Raised if N < 0 and if the transformation is not inversible.
") Power;
		void Power(const int N);

		/****** Geom2d_Transformation::Powered ******/
		/****** md5 signature: 1a9161fb69bbbe90e59947299a778470 ******/
		%feature("compactdefaultargs") Powered;
		%feature("autodoc", "
Parameters
----------
N: int

Return
-------
opencascade::handle<Geom2d_Transformation>

Description
-----------
Raised if N < 0 and if the transformation is not inversible.
") Powered;
		opencascade::handle<Geom2d_Transformation> Powered(const int N);

		/****** Geom2d_Transformation::PreMultiply ******/
		/****** md5 signature: fab364bcaf77ab9214ca12530e1db853 ******/
		%feature("compactdefaultargs") PreMultiply;
		%feature("autodoc", "
Parameters
----------
Other: Geom2d_Transformation

Return
-------
None

Description
-----------
Computes the matrix of the transformation composed with <self> and Other. <self> = Other * <self>.
") PreMultiply;
		void PreMultiply(const opencascade::handle<Geom2d_Transformation> & Other);

		/****** Geom2d_Transformation::ScaleFactor ******/
		/****** md5 signature: a94b1918f178d6d377c4cc6001ac78ea ******/
		%feature("compactdefaultargs") ScaleFactor;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns the scale value of the transformation.
") ScaleFactor;
		double ScaleFactor();

		/****** Geom2d_Transformation::SetMirror ******/
		/****** md5 signature: b99a2a0975c5afd1079e68a54f4ee024 ******/
		%feature("compactdefaultargs") SetMirror;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt2d

Return
-------
None

Description
-----------
Makes the transformation into a symmetrical transformation with respect to a point P. P is the center of the symmetry.
") SetMirror;
		void SetMirror(const gp_Pnt2d & P);

		/****** Geom2d_Transformation::SetMirror ******/
		/****** md5 signature: 09840925aa066f9e81dc705a4274f47c ******/
		%feature("compactdefaultargs") SetMirror;
		%feature("autodoc", "
Parameters
----------
A: gp_Ax2d

Return
-------
None

Description
-----------
Makes the transformation into a symmetrical transformation with respect to an axis A. A is the center of the axial symmetry.
") SetMirror;
		void SetMirror(const gp_Ax2d & A);

		/****** Geom2d_Transformation::SetRotation ******/
		/****** md5 signature: ed0b61b3832daaa1aeccec70b73a129f ******/
		%feature("compactdefaultargs") SetRotation;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt2d
Ang: double

Return
-------
None

Description
-----------
Assigns to this transformation the geometric properties of a rotation at angle Ang (in radians) about point P.
") SetRotation;
		void SetRotation(const gp_Pnt2d & P, const double Ang);

		/****** Geom2d_Transformation::SetScale ******/
		/****** md5 signature: 963db9b198279e10130f5c6519c454e5 ******/
		%feature("compactdefaultargs") SetScale;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt2d
S: double

Return
-------
None

Description
-----------
Makes the transformation into a scale. P is the center of the scale and S is the scaling value.
") SetScale;
		void SetScale(const gp_Pnt2d & P, const double S);

		/****** Geom2d_Transformation::SetTransformation ******/
		/****** md5 signature: 0af598d076d78b705fb5e9c4db627afa ******/
		%feature("compactdefaultargs") SetTransformation;
		%feature("autodoc", "
Parameters
----------
FromSystem1: gp_Ax2d
ToSystem2: gp_Ax2d

Return
-------
None

Description
-----------
Makes a transformation allowing passage from the coordinate system 'FromSystem1' to the coordinate system 'ToSystem2'.
") SetTransformation;
		void SetTransformation(const gp_Ax2d & FromSystem1, const gp_Ax2d & ToSystem2);

		/****** Geom2d_Transformation::SetTransformation ******/
		/****** md5 signature: 55e7631d5275e21b43e271ccbadbacb9 ******/
		%feature("compactdefaultargs") SetTransformation;
		%feature("autodoc", "
Parameters
----------
ToSystem: gp_Ax2d

Return
-------
None

Description
-----------
Makes the transformation allowing passage from the basic coordinate system {P(0.,0.,0.), VX (1.,0.,0.), VY (0.,1.,0.)} to the local coordinate system defined with the Ax2d ToSystem.
") SetTransformation;
		void SetTransformation(const gp_Ax2d & ToSystem);

		/****** Geom2d_Transformation::SetTranslation ******/
		/****** md5 signature: 230c4cb205b25788ec6ee808ed25cf44 ******/
		%feature("compactdefaultargs") SetTranslation;
		%feature("autodoc", "
Parameters
----------
V: gp_Vec2d

Return
-------
None

Description
-----------
Makes the transformation into a translation. V is the vector of the translation.
") SetTranslation;
		void SetTranslation(const gp_Vec2d & V);

		/****** Geom2d_Transformation::SetTranslation ******/
		/****** md5 signature: d386103debd5645a0cbdd65157e0552f ******/
		%feature("compactdefaultargs") SetTranslation;
		%feature("autodoc", "
Parameters
----------
P1: gp_Pnt2d
P2: gp_Pnt2d

Return
-------
None

Description
-----------
Makes the transformation into a translation from the point P1 to the point P2.
") SetTranslation;
		void SetTranslation(const gp_Pnt2d & P1, const gp_Pnt2d & P2);

		/****** Geom2d_Transformation::SetTrsf2d ******/
		/****** md5 signature: 941daf470871f4c0229dd5afe5a83fae ******/
		%feature("compactdefaultargs") SetTrsf2d;
		%feature("autodoc", "
Parameters
----------
T: gp_Trsf2d

Return
-------
None

Description
-----------
Makes the transformation into a transformation T from package gp.
") SetTrsf2d;
		void SetTrsf2d(const gp_Trsf2d & T);

		/****** Geom2d_Transformation::Transforms ******/
		/****** md5 signature: 1315a929b0a21329c4669414500ed2f2 ******/
		%feature("compactdefaultargs") Transforms;
		%feature("autodoc", "
Parameters
----------

Return
-------
X: double
Y: double

Description
-----------
Applies the transformation <self> to the triplet {X, Y}.
") Transforms;
		void Transforms(Standard_Real &OutValue, Standard_Real &OutValue);

		/****** Geom2d_Transformation::Trsf2d ******/
		/****** md5 signature: 6ea70105baee17870344c337ed09ffe5 ******/
		%feature("compactdefaultargs") Trsf2d;
		%feature("autodoc", "Return
-------
gp_Trsf2d

Description
-----------
Converts this transformation into a gp_Trsf2d transformation. Returns a non persistent copy of <self>. -C++: return const&.
") Trsf2d;
		gp_Trsf2d Trsf2d();

		/****** Geom2d_Transformation::Value ******/
		/****** md5 signature: f9f22baa37dbf030b26aabe4c2195b31 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
Row: int
Col: int

Return
-------
double

Description
-----------
Returns the coefficients of the global matrix of transformation. It is a 2 rows X 3 columns matrix. //! Raised if Row < 1 or Row > 2 or Col < 1 or Col > 2 //! Computes the reverse transformation.
") Value;
		double Value(const int Row, const int Col);

		/****** Geom2d_Transformation::operator * ******/
		/****** md5 signature: c4fa2b13a73971dfc97b4ab665674be2 ******/
		%feature("compactdefaultargs") operator *;
		%feature("autodoc", "
Parameters
----------
Other: Geom2d_Transformation

Return
-------
opencascade::handle<Geom2d_Transformation>

Description
-----------
No available documentation.
") operator *;
		opencascade::handle<Geom2d_Transformation> operator *(const opencascade::handle<Geom2d_Transformation> & Other);


%extend{
    void __imul_wrapper__(const opencascade::handle<Geom2d_Transformation> other) {
    *self *= other;
    }
}
%pythoncode {
def __imul__(self, right):
    self.__imul_wrapper__(right)
    return self
}
};


%make_alias(Geom2d_Transformation)

%extend Geom2d_Transformation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************
* class Geom2d_AxisPlacement *
*****************************/
class Geom2d_AxisPlacement : public Geom2d_Geometry {
	public:
		/****** Geom2d_AxisPlacement::Geom2d_AxisPlacement ******/
		/****** md5 signature: 1a609b33120da24d304dd02ed954c905 ******/
		%feature("compactdefaultargs") Geom2d_AxisPlacement;
		%feature("autodoc", "
Parameters
----------
A: gp_Ax2d

Return
-------
None

Description
-----------
Constructs an axis by conversion of the gp_Ax2d axis A.
") Geom2d_AxisPlacement;
		 Geom2d_AxisPlacement(const gp_Ax2d & A);

		/****** Geom2d_AxisPlacement::Geom2d_AxisPlacement ******/
		/****** md5 signature: dbb5a1bcc681a9307167b5b9f7f56aa9 ******/
		%feature("compactdefaultargs") Geom2d_AxisPlacement;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt2d
V: gp_Dir2d

Return
-------
None

Description
-----------
Constructs an axis from a given origin P and unit vector V.
") Geom2d_AxisPlacement;
		 Geom2d_AxisPlacement(const gp_Pnt2d & P, const gp_Dir2d & V);

		/****** Geom2d_AxisPlacement::Angle ******/
		/****** md5 signature: 2e1105684ed8cdca8ae0246877bbde85 ******/
		%feature("compactdefaultargs") Angle;
		%feature("autodoc", "
Parameters
----------
Other: Geom2d_AxisPlacement

Return
-------
double

Description
-----------
Computes the angle between the 'Direction' of two axis placement in radians. The result is comprised between -Pi and Pi.
") Angle;
		double Angle(const opencascade::handle<Geom2d_AxisPlacement> & Other);

		/****** Geom2d_AxisPlacement::Ax2d ******/
		/****** md5 signature: 8907c1e8609b11e2c3b10e0464d25255 ******/
		%feature("compactdefaultargs") Ax2d;
		%feature("autodoc", "Return
-------
gp_Ax2d

Description
-----------
Converts this axis into a gp_Ax2d axis.
") Ax2d;
		gp_Ax2d Ax2d();

		/****** Geom2d_AxisPlacement::Copy ******/
		/****** md5 signature: 357e0361ce7af4bdc756de6d7ba219d9 ******/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom2d_Geometry>

Description
-----------
Creates a new object which is a copy of this axis.
") Copy;
		opencascade::handle<Geom2d_Geometry> Copy();

		/****** Geom2d_AxisPlacement::Direction ******/
		/****** md5 signature: e457bfc5d72a6522edd233700e481de0 ******/
		%feature("compactdefaultargs") Direction;
		%feature("autodoc", "Return
-------
gp_Dir2d

Description
-----------
Returns the 'Direction' of <self>. -C++: return const&.
") Direction;
		gp_Dir2d Direction();

		/****** Geom2d_AxisPlacement::Location ******/
		/****** md5 signature: b6d70f653f0835eef3aab3bab16c5c7c ******/
		%feature("compactdefaultargs") Location;
		%feature("autodoc", "Return
-------
gp_Pnt2d

Description
-----------
Returns the 'Location' point (origin) of the axis placement. -C++: return const&.
") Location;
		gp_Pnt2d Location();

		/****** Geom2d_AxisPlacement::Reverse ******/
		/****** md5 signature: b751d6874fc026e19a7a6cb37e9ac1b4 ******/
		%feature("compactdefaultargs") Reverse;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Reverse;
		void Reverse();

		/****** Geom2d_AxisPlacement::Reversed ******/
		/****** md5 signature: f601af67de69032cf1e0303681735b98 ******/
		%feature("compactdefaultargs") Reversed;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom2d_AxisPlacement>

Description
-----------
Reverses the unit vector of this axis. Note: - Reverse assigns the result to this axis, while - Reversed creates a new one.
") Reversed;
		opencascade::handle<Geom2d_AxisPlacement> Reversed();

		/****** Geom2d_AxisPlacement::SetAxis ******/
		/****** md5 signature: 89d2b8fa20a02d53e362c642f1259e7d ******/
		%feature("compactdefaultargs") SetAxis;
		%feature("autodoc", "
Parameters
----------
A: gp_Ax2d

Return
-------
None

Description
-----------
Changes the complete definition of the axis placement.
") SetAxis;
		void SetAxis(const gp_Ax2d & A);

		/****** Geom2d_AxisPlacement::SetDirection ******/
		/****** md5 signature: 12767d6ecad16faa02d3f67f1fb01553 ******/
		%feature("compactdefaultargs") SetDirection;
		%feature("autodoc", "
Parameters
----------
V: gp_Dir2d

Return
-------
None

Description
-----------
Changes the 'Direction' of the axis placement.
") SetDirection;
		void SetDirection(const gp_Dir2d & V);

		/****** Geom2d_AxisPlacement::SetLocation ******/
		/****** md5 signature: 368c9b8c039b553e22ee650e75e4d404 ******/
		%feature("compactdefaultargs") SetLocation;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt2d

Return
-------
None

Description
-----------
Changes the 'Location' point (origin) of the axis placement.
") SetLocation;
		void SetLocation(const gp_Pnt2d & P);

		/****** Geom2d_AxisPlacement::Transform ******/
		/****** md5 signature: c3e9d0cbb6ef2be1d446ca43c7e51616 ******/
		%feature("compactdefaultargs") Transform;
		%feature("autodoc", "
Parameters
----------
T: gp_Trsf2d

Return
-------
None

Description
-----------
Applies the transformation T to this axis.
") Transform;
		void Transform(const gp_Trsf2d & T);

};


%make_alias(Geom2d_AxisPlacement)

%extend Geom2d_AxisPlacement {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************
* class Geom2d_Curve *
*********************/
%nodefaultctor Geom2d_Curve;
class Geom2d_Curve : public Geom2d_Geometry {
	public:
		class ResD1 {};
		class ResD2 {};
		class ResD3 {};
		/****** Geom2d_Curve::Continuity ******/
		/****** md5 signature: 8dbb475c198ca068fb275dadeaaecf82 ******/
		%feature("compactdefaultargs") Continuity;
		%feature("autodoc", "Return
-------
GeomAbs_Shape

Description
-----------
It is the global continuity of the curve: C0: only geometric continuity, C1: continuity of the first derivative all along the Curve, C2: continuity of the second derivative all along the Curve, C3: continuity of the third derivative all along the Curve, G1: tangency continuity all along the Curve, G2: curvature continuity all along the Curve, CN: the order of continuity is infinite.
") Continuity;
		virtual GeomAbs_Shape Continuity();

		/****** Geom2d_Curve::D0 ******/
		/****** md5 signature: 35544ce8437cb6848e72c7c3437ac18f ******/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "
Parameters
----------
U: double
P: gp_Pnt2d

Return
-------
None

Description
-----------
Returns in P the point of parameter U.
") D0;
		void D0(const double U, gp_Pnt2d & P);

		/****** Geom2d_Curve::D1 ******/
		/****** md5 signature: 75f7ab78a16525e93db8b6649b666362 ******/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "
Parameters
----------
U: double
P: gp_Pnt2d
V1: gp_Vec2d

Return
-------
None

Description
-----------
Returns the point P of parameter U and the first derivative V1.
") D1;
		void D1(const double U, gp_Pnt2d & P, gp_Vec2d & V1);

		/****** Geom2d_Curve::D2 ******/
		/****** md5 signature: 072edd246eb471ee152d4eaccb91fa71 ******/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "
Parameters
----------
U: double
P: gp_Pnt2d
V1: gp_Vec2d
V2: gp_Vec2d

Return
-------
None

Description
-----------
Returns the point P of parameter U, the first and second derivatives V1 and V2.
") D2;
		void D2(const double U, gp_Pnt2d & P, gp_Vec2d & V1, gp_Vec2d & V2);

		/****** Geom2d_Curve::D3 ******/
		/****** md5 signature: 4fc6b255dc12d14eab6c0865639cf136 ******/
		%feature("compactdefaultargs") D3;
		%feature("autodoc", "
Parameters
----------
U: double
P: gp_Pnt2d
V1: gp_Vec2d
V2: gp_Vec2d
V3: gp_Vec2d

Return
-------
None

Description
-----------
Returns the point P of parameter U, the first, the second and the third derivative.
") D3;
		void D3(const double U, gp_Pnt2d & P, gp_Vec2d & V1, gp_Vec2d & V2, gp_Vec2d & V3);

		/****** Geom2d_Curve::DN ******/
		/****** md5 signature: 78bb964824833f1b78f6bfbbb4708c7a ******/
		%feature("compactdefaultargs") DN;
		%feature("autodoc", "
Parameters
----------
U: double
N: int

Return
-------
gp_Vec2d

Description
-----------
Computes the Nth derivative vector.
") DN;
		gp_Vec2d DN(const double U, const int N);


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
		/****** Geom2d_Curve::EvalD0 ******/
		/****** md5 signature: c342639bb7e98278bc92280aa8c28dab ******/
		%feature("compactdefaultargs") EvalD0;
		%feature("autodoc", "
Parameters
----------
U: double

Return
-------
gp_Pnt2d

Description
-----------
Computes the point of parameter U. Raises an exception on failure.
") EvalD0;
		virtual gp_Pnt2d EvalD0(const double U);

		/****** Geom2d_Curve::EvalD1 ******/
		/****** md5 signature: 5df5bc30fb1157ffc4fac3d13b4447ea ******/
		%feature("compactdefaultargs") EvalD1;
		%feature("autodoc", "
Parameters
----------
U: double

Return
-------
Geom2d_Curve::ResD1

Description
-----------
Computes the point and first derivative at parameter U. Raises an exception if the curve continuity is not C1.
") EvalD1;
		virtual Geom2d_Curve::ResD1 EvalD1(const double U);

		/****** Geom2d_Curve::EvalD2 ******/
		/****** md5 signature: 423e9207dec280b4758e8008e22ad80b ******/
		%feature("compactdefaultargs") EvalD2;
		%feature("autodoc", "
Parameters
----------
U: double

Return
-------
Geom2d_Curve::ResD2

Description
-----------
Computes the point and first two derivatives at parameter U. Raises an exception if the curve continuity is not C2.
") EvalD2;
		virtual Geom2d_Curve::ResD2 EvalD2(const double U);

		/****** Geom2d_Curve::EvalD3 ******/
		/****** md5 signature: a0d3367911b895d245d7d2d3633a78c3 ******/
		%feature("compactdefaultargs") EvalD3;
		%feature("autodoc", "
Parameters
----------
U: double

Return
-------
Geom2d_Curve::ResD3

Description
-----------
Computes the point and first three derivatives at parameter U. Raises an exception if the curve continuity is not C3.
") EvalD3;
		virtual Geom2d_Curve::ResD3 EvalD3(const double U);

		/****** Geom2d_Curve::EvalDN ******/
		/****** md5 signature: a0f572f0417cbd7da794e8c10497e80b ******/
		%feature("compactdefaultargs") EvalDN;
		%feature("autodoc", "
Parameters
----------
U: double
N: int

Return
-------
gp_Vec2d

Description
-----------
Computes the Nth derivative at parameter U. Raises an exception if the curve continuity is not CN, or N < 1.
") EvalDN;
		virtual gp_Vec2d EvalDN(const double U, const int N);

		/****** Geom2d_Curve::FirstParameter ******/
		/****** md5 signature: a78bafc15480770b071a253f06828586 ******/
		%feature("compactdefaultargs") FirstParameter;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns the value of the first parameter. Warnings: It can be RealFirst or RealLast from package Standard if the curve is infinite.
") FirstParameter;
		virtual double FirstParameter();

		/****** Geom2d_Curve::IsCN ******/
		/****** md5 signature: d91b7f1c6f18e99f7967c482d42ed15a ******/
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
Returns true if the degree of continuity of this curve is at least N. Exceptions Standard_RangeError if N is less than 0.
") IsCN;
		virtual bool IsCN(const int N);

		/****** Geom2d_Curve::IsClosed ******/
		/****** md5 signature: 405d237c077e28f85d15fe632f54a459 ******/
		%feature("compactdefaultargs") IsClosed;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if the curve is closed. Examples: Some curves such as circle are always closed, others such as line are never closed (by definition). Some Curves such as OffsetCurve can be closed or not. These curves are considered as closed if the distance between the first point and the last point of the curve is lower or equal to the Resolution from package gp which is a fixed criterion independent of the application.
") IsClosed;
		virtual bool IsClosed();

		/****** Geom2d_Curve::IsPeriodic ******/
		/****** md5 signature: cc1f4d34e3157e4b3935c7e06662e775 ******/
		%feature("compactdefaultargs") IsPeriodic;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if the parameter of the curve is periodic. It is possible only if the curve is closed and if the following relation is satisfied: for each parametric value U the distance between the point P(u) and the point P (u + T) is lower or equal to Resolution from package gp, T is the period and must be a constant. There are three possibilities: . the curve is never periodic by definition (SegmentLine) . the curve is always periodic by definition (Circle) . the curve can be defined as periodic (BSpline). In this case a function SetPeriodic allows you to give the shape of the curve. The general rule for this case is: if a curve can be periodic or not the default periodicity set is non periodic and you have to turn (explicitly) the curve into a periodic curve if you want the curve to be periodic.
") IsPeriodic;
		virtual bool IsPeriodic();

		/****** Geom2d_Curve::LastParameter ******/
		/****** md5 signature: 8158738d773dc87261105cbfc8f7b45a ******/
		%feature("compactdefaultargs") LastParameter;
		%feature("autodoc", "Return
-------
double

Description
-----------
Value of the last parameter. Warnings: It can be RealFirst or RealLast from package Standard if the curve is infinite.
") LastParameter;
		virtual double LastParameter();

		/****** Geom2d_Curve::ParametricTransformation ******/
		/****** md5 signature: df48f47e9ca9048777596ff601d0ebc3 ******/
		%feature("compactdefaultargs") ParametricTransformation;
		%feature("autodoc", "
Parameters
----------
T: gp_Trsf2d

Return
-------
double

Description
-----------
Returns the coefficient required to compute the parametric transformation of this curve when transformation T is applied. This coefficient is the ratio between the parameter of a point on this curve and the parameter of the transformed point on the new curve transformed by T. Note: this function generally returns 1. but it can be redefined (for example, on a line).
") ParametricTransformation;
		virtual double ParametricTransformation(const gp_Trsf2d & T);

		/****** Geom2d_Curve::Period ******/
		/****** md5 signature: 7838680e9098dc30bd28a13c225a8304 ******/
		%feature("compactdefaultargs") Period;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns the period of this curve. raises if the curve is not periodic.
") Period;
		virtual double Period();

		/****** Geom2d_Curve::Reverse ******/
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

		/****** Geom2d_Curve::Reversed ******/
		/****** md5 signature: 213618aedf08a1c3f5aa636ef2ff6e2a ******/
		%feature("compactdefaultargs") Reversed;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom2d_Curve>

Description
-----------
Creates a reversed duplicate Changes the orientation of this curve. The first and last parameters are not changed, but the parametric direction of the curve is reversed. If the curve is bounded: - the start point of the initial curve becomes the end point of the reversed curve, and - the end point of the initial curve becomes the start point of the reversed curve. - Reversed creates a new curve.
") Reversed;
		opencascade::handle<Geom2d_Curve> Reversed();

		/****** Geom2d_Curve::ReversedParameter ******/
		/****** md5 signature: 3086ae27f5263c3640995e2eed822306 ******/
		%feature("compactdefaultargs") ReversedParameter;
		%feature("autodoc", "
Parameters
----------
U: double

Return
-------
double

Description
-----------
Computes the parameter on the reversed curve for the point of parameter U on this curve. Note: The point of parameter U on this curve is identical to the point of parameter ReversedParameter(U) on the reversed curve.
") ReversedParameter;
		virtual double ReversedParameter(const double U);

		/****** Geom2d_Curve::TransformedParameter ******/
		/****** md5 signature: 54ab795a4cf3f0d562deeb9165d70b72 ******/
		%feature("compactdefaultargs") TransformedParameter;
		%feature("autodoc", "
Parameters
----------
U: double
T: gp_Trsf2d

Return
-------
double

Description
-----------
Computes the parameter on the curve transformed by T for the point of parameter U on this curve. Note: this function generally returns U but it can be redefined (for example, on a line).
") TransformedParameter;
		virtual double TransformedParameter(const double U, const gp_Trsf2d & T);

		/****** Geom2d_Curve::Value ******/
		/****** md5 signature: d81b6c54096547700b91b9c259aefa3c ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
U: double

Return
-------
gp_Pnt2d

Description
-----------
Computes the point of parameter U on <self>. Implemented with D0.
") Value;
		gp_Pnt2d Value(const double U);

};


%make_alias(Geom2d_Curve)

%extend Geom2d_Curve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

// numpy support for Geom2d_Curve
Curve2dArrayEvalExtend(Geom2d_Curve)

/*********************
* class Geom2d_Point *
*********************/
%nodefaultctor Geom2d_Point;
class Geom2d_Point : public Geom2d_Geometry {
	public:
		/****** Geom2d_Point::Coord ******/
		/****** md5 signature: 3f4c709d3b7586bc6cbb06ff1b666124 ******/
		%feature("compactdefaultargs") Coord;
		%feature("autodoc", "
Parameters
----------

Return
-------
X: double
Y: double

Description
-----------
returns the Coordinates of <self>.
") Coord;
		virtual void Coord(Standard_Real &OutValue, Standard_Real &OutValue);

		/****** Geom2d_Point::Distance ******/
		/****** md5 signature: 7a87e67712aa724ed0593d021c9ff77c ******/
		%feature("compactdefaultargs") Distance;
		%feature("autodoc", "
Parameters
----------
Other: Geom2d_Point

Return
-------
double

Description
-----------
computes the distance between <self> and <Other>.
") Distance;
		double Distance(const opencascade::handle<Geom2d_Point> & Other);


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
		/****** Geom2d_Point::Pnt2d ******/
		/****** md5 signature: 4ad29577d24628012003658d14094751 ******/
		%feature("compactdefaultargs") Pnt2d;
		%feature("autodoc", "Return
-------
gp_Pnt2d

Description
-----------
returns a non persistent copy of <self>.
") Pnt2d;
		virtual gp_Pnt2d Pnt2d();

		/****** Geom2d_Point::SquareDistance ******/
		/****** md5 signature: 15effddb5781318ebcbbf31f4a5e1db1 ******/
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "
Parameters
----------
Other: Geom2d_Point

Return
-------
double

Description
-----------
computes the square distance between <self> and <Other>.
") SquareDistance;
		double SquareDistance(const opencascade::handle<Geom2d_Point> & Other);

		/****** Geom2d_Point::X ******/
		/****** md5 signature: 6a1a08089ba6ebfca1e32a89c4db240e ******/
		%feature("compactdefaultargs") X;
		%feature("autodoc", "Return
-------
double

Description
-----------
returns the X coordinate of <self>.
") X;
		virtual double X();

		/****** Geom2d_Point::Y ******/
		/****** md5 signature: c57cbfbdf22037ef086c0e73eca57ff2 ******/
		%feature("compactdefaultargs") Y;
		%feature("autodoc", "Return
-------
double

Description
-----------
returns the Y coordinate of <self>.
") Y;
		virtual double Y();

};


%make_alias(Geom2d_Point)

%extend Geom2d_Point {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************
* class Geom2d_Vector *
**********************/
%nodefaultctor Geom2d_Vector;
class Geom2d_Vector : public Geom2d_Geometry {
	public:
		/****** Geom2d_Vector::Angle ******/
		/****** md5 signature: f45026a01f2f7d1f844430056fa343db ******/
		%feature("compactdefaultargs") Angle;
		%feature("autodoc", "
Parameters
----------
Other: Geom2d_Vector

Return
-------
double

Description
-----------
Computes the angular value, in radians, between this vector and vector Other. The result is a value between -Pi and Pi. The orientation is from this vector to vector Other. Raises VectorWithNullMagnitude if one of the two vectors is a vector with null magnitude because the angular value is indefinite.
") Angle;
		double Angle(const opencascade::handle<Geom2d_Vector> & Other);

		/****** Geom2d_Vector::Coord ******/
		/****** md5 signature: bd8ae590d669de04d7a2351fec601312 ******/
		%feature("compactdefaultargs") Coord;
		%feature("autodoc", "
Parameters
----------

Return
-------
X: double
Y: double

Description
-----------
Returns the coordinates of <self>.
") Coord;
		void Coord(Standard_Real &OutValue, Standard_Real &OutValue);

		/****** Geom2d_Vector::Crossed ******/
		/****** md5 signature: 153140589257f1c396e7524acb47b02b ******/
		%feature("compactdefaultargs") Crossed;
		%feature("autodoc", "
Parameters
----------
Other: Geom2d_Vector

Return
-------
double

Description
-----------
Cross product of <self> with the vector <Other>.
") Crossed;
		virtual double Crossed(const opencascade::handle<Geom2d_Vector> & Other);

		/****** Geom2d_Vector::Dot ******/
		/****** md5 signature: 03b63ce85ea5335b7385175820c8ee52 ******/
		%feature("compactdefaultargs") Dot;
		%feature("autodoc", "
Parameters
----------
Other: Geom2d_Vector

Return
-------
double

Description
-----------
Returns the scalar product of 2 Vectors.
") Dot;
		double Dot(const opencascade::handle<Geom2d_Vector> & Other);

		/****** Geom2d_Vector::Magnitude ******/
		/****** md5 signature: 95ec16e9fa0ced1bc59271892b633fa9 ******/
		%feature("compactdefaultargs") Magnitude;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns the Magnitude of <self>.
") Magnitude;
		virtual double Magnitude();

		/****** Geom2d_Vector::Reverse ******/
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

		/****** Geom2d_Vector::Reversed ******/
		/****** md5 signature: e8600d990a22cc664108a6dd79a3f6f3 ******/
		%feature("compactdefaultargs") Reversed;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom2d_Vector>

Description
-----------
Returns a copy of <self> reversed.
") Reversed;
		opencascade::handle<Geom2d_Vector> Reversed();

		/****** Geom2d_Vector::SquareMagnitude ******/
		/****** md5 signature: 5edb9f761dc5797eca195a49d75e4f16 ******/
		%feature("compactdefaultargs") SquareMagnitude;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns the square magnitude of <self>.
") SquareMagnitude;
		virtual double SquareMagnitude();

		/****** Geom2d_Vector::Vec2d ******/
		/****** md5 signature: d9f1f1694ce0bd17c66b36e8cb82480a ******/
		%feature("compactdefaultargs") Vec2d;
		%feature("autodoc", "Return
-------
gp_Vec2d

Description
-----------
Returns a non persistent copy of <self>.
") Vec2d;
		gp_Vec2d Vec2d();

		/****** Geom2d_Vector::X ******/
		/****** md5 signature: d1cd5c739a5e638da850f6d4184da84c ******/
		%feature("compactdefaultargs") X;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns the X coordinate of <self>.
") X;
		double X();

		/****** Geom2d_Vector::Y ******/
		/****** md5 signature: a8645c42b76f8d7a4895271f99de6d50 ******/
		%feature("compactdefaultargs") Y;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns the Y coordinate of <self>.
") Y;
		double Y();

};


%make_alias(Geom2d_Vector)

%extend Geom2d_Vector {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************
* class Geom2d_BoundedCurve *
****************************/
%nodefaultctor Geom2d_BoundedCurve;
class Geom2d_BoundedCurve : public Geom2d_Curve {
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
		/****** Geom2d_BoundedCurve::EndPoint ******/
		/****** md5 signature: cabba8ba02807b5bb937fe3e63f56ebe ******/
		%feature("compactdefaultargs") EndPoint;
		%feature("autodoc", "Return
-------
gp_Pnt2d

Description
-----------
Returns the end point of the curve. The end point is the value of the curve for the 'LastParameter' of the curve.
") EndPoint;
		virtual gp_Pnt2d EndPoint();

		/****** Geom2d_BoundedCurve::StartPoint ******/
		/****** md5 signature: 60e2ba94d4dc875ff409e452c130cfec ******/
		%feature("compactdefaultargs") StartPoint;
		%feature("autodoc", "Return
-------
gp_Pnt2d

Description
-----------
Returns the start point of the curve. The start point is the value of the curve for the 'FirstParameter' of the curve.
") StartPoint;
		virtual gp_Pnt2d StartPoint();

};


%make_alias(Geom2d_BoundedCurve)

%extend Geom2d_BoundedCurve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************
* class Geom2d_CartesianPoint *
******************************/
class Geom2d_CartesianPoint : public Geom2d_Point {
	public:
		/****** Geom2d_CartesianPoint::Geom2d_CartesianPoint ******/
		/****** md5 signature: d56d1b09c70e8726d01835c76b77c215 ******/
		%feature("compactdefaultargs") Geom2d_CartesianPoint;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt2d

Return
-------
None

Description
-----------
Returns a persistent copy of P.
") Geom2d_CartesianPoint;
		 Geom2d_CartesianPoint(const gp_Pnt2d & P);

		/****** Geom2d_CartesianPoint::Geom2d_CartesianPoint ******/
		/****** md5 signature: 32c522e70552dd2138379d9d91d1785c ******/
		%feature("compactdefaultargs") Geom2d_CartesianPoint;
		%feature("autodoc", "
Parameters
----------
X: double
Y: double

Return
-------
None

Description
-----------
No available documentation.
") Geom2d_CartesianPoint;
		 Geom2d_CartesianPoint(const double X, const double Y);

		/****** Geom2d_CartesianPoint::Coord ******/
		/****** md5 signature: d2c01f9db6257a1c31621f6bc372a2b4 ******/
		%feature("compactdefaultargs") Coord;
		%feature("autodoc", "
Parameters
----------

Return
-------
X: double
Y: double

Description
-----------
Returns the coordinates of <self>.
") Coord;
		void Coord(Standard_Real &OutValue, Standard_Real &OutValue);

		/****** Geom2d_CartesianPoint::Copy ******/
		/****** md5 signature: 357e0361ce7af4bdc756de6d7ba219d9 ******/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom2d_Geometry>

Description
-----------
No available documentation.
") Copy;
		opencascade::handle<Geom2d_Geometry> Copy();


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
		/****** Geom2d_CartesianPoint::Pnt2d ******/
		/****** md5 signature: 128724e0a19bdbb890e637618645ca16 ******/
		%feature("compactdefaultargs") Pnt2d;
		%feature("autodoc", "Return
-------
gp_Pnt2d

Description
-----------
Returns a non persistent cartesian point with the same coordinates as <self>. -C++: return const&.
") Pnt2d;
		gp_Pnt2d Pnt2d();

		/****** Geom2d_CartesianPoint::SetCoord ******/
		/****** md5 signature: 4ba372cec3164648b27af191e52590e8 ******/
		%feature("compactdefaultargs") SetCoord;
		%feature("autodoc", "
Parameters
----------
X: double
Y: double

Return
-------
None

Description
-----------
Set <self> to X, Y coordinates.
") SetCoord;
		void SetCoord(const double X, const double Y);

		/****** Geom2d_CartesianPoint::SetPnt2d ******/
		/****** md5 signature: 4019e9fc83ac7e024f5664cfdb6467fa ******/
		%feature("compactdefaultargs") SetPnt2d;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt2d

Return
-------
None

Description
-----------
Set <self> to P.X(), P.Y() coordinates.
") SetPnt2d;
		void SetPnt2d(const gp_Pnt2d & P);

		/****** Geom2d_CartesianPoint::SetX ******/
		/****** md5 signature: b2a1aeaab5eb38d0f723f9862b1dcc0b ******/
		%feature("compactdefaultargs") SetX;
		%feature("autodoc", "
Parameters
----------
X: double

Return
-------
None

Description
-----------
Changes the X coordinate of me.
") SetX;
		void SetX(const double X);

		/****** Geom2d_CartesianPoint::SetY ******/
		/****** md5 signature: 999029c3c06ea6c6b1fd3b4a9def6c70 ******/
		%feature("compactdefaultargs") SetY;
		%feature("autodoc", "
Parameters
----------
Y: double

Return
-------
None

Description
-----------
Changes the Y coordinate of me.
") SetY;
		void SetY(const double Y);

		/****** Geom2d_CartesianPoint::Transform ******/
		/****** md5 signature: c3e9d0cbb6ef2be1d446ca43c7e51616 ******/
		%feature("compactdefaultargs") Transform;
		%feature("autodoc", "
Parameters
----------
T: gp_Trsf2d

Return
-------
None

Description
-----------
No available documentation.
") Transform;
		void Transform(const gp_Trsf2d & T);

		/****** Geom2d_CartesianPoint::X ******/
		/****** md5 signature: 6b68a610151127ede93eadedfa074c72 ******/
		%feature("compactdefaultargs") X;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns the X coordinate of <self>.
") X;
		double X();

		/****** Geom2d_CartesianPoint::Y ******/
		/****** md5 signature: 48e7bf2a681c5ea1d44b1c5e8fa99158 ******/
		%feature("compactdefaultargs") Y;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns the Y coordinate of <self>.
") Y;
		double Y();

};


%make_alias(Geom2d_CartesianPoint)

%extend Geom2d_CartesianPoint {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************
* class Geom2d_Conic *
*********************/
%nodefaultctor Geom2d_Conic;
class Geom2d_Conic : public Geom2d_Curve {
	public:
		/****** Geom2d_Conic::Continuity ******/
		/****** md5 signature: 8a904df22c5de40ac55e533d992dce2a ******/
		%feature("compactdefaultargs") Continuity;
		%feature("autodoc", "Return
-------
GeomAbs_Shape

Description
-----------
Returns GeomAbs_CN which is the global continuity of any conic.
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
		/****** Geom2d_Conic::Eccentricity ******/
		/****** md5 signature: a6a8ac678dd10557d1872da9c2b28bb0 ******/
		%feature("compactdefaultargs") Eccentricity;
		%feature("autodoc", "Return
-------
double

Description
-----------
returns the eccentricity value of the conic e. e = 0 for a circle 0 < e < 1 for an ellipse (e = 0 if MajorRadius = MinorRadius) e > 1 for a hyperbola e = 1 for a parabola.
") Eccentricity;
		virtual double Eccentricity();

		/****** Geom2d_Conic::IsCN ******/
		/****** md5 signature: 7148abeb948e78dbe081ec4edd4357f0 ******/
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
Returns True, the order of continuity of a conic is infinite.
") IsCN;
		bool IsCN(const int N);

		/****** Geom2d_Conic::Location ******/
		/****** md5 signature: 0e4556028ba61472400043e40317f1e2 ******/
		%feature("compactdefaultargs") Location;
		%feature("autodoc", "Return
-------
gp_Pnt2d

Description
-----------
Returns the location point of the conic. For the circle, the ellipse and the hyperbola it is the center of the conic. For the parabola it is the vertex of the parabola.
") Location;
		const gp_Pnt2d Location();

		/****** Geom2d_Conic::Position ******/
		/****** md5 signature: 8247b1efb09dc461f7d1cce90ebd0c14 ******/
		%feature("compactdefaultargs") Position;
		%feature("autodoc", "Return
-------
gp_Ax22d

Description
-----------
Returns the local coordinates system of the conic.
") Position;
		const gp_Ax22d Position();

		/****** Geom2d_Conic::Reverse ******/
		/****** md5 signature: 061259e9a1d8313b86b97b8a1591d999 ******/
		%feature("compactdefaultargs") Reverse;
		%feature("autodoc", "Return
-------
None

Description
-----------
Reverses the direction of parameterization of <self>. The local coordinate system of the conic is modified.
") Reverse;
		void Reverse();

		/****** Geom2d_Conic::ReversedParameter ******/
		/****** md5 signature: 3df6a145ea2a841a97299da3f3da9d59 ******/
		%feature("compactdefaultargs") ReversedParameter;
		%feature("autodoc", "
Parameters
----------
U: double

Return
-------
double

Description
-----------
Returns the parameter on the reversed curve for the point of parameter U on <self>.
") ReversedParameter;
		double ReversedParameter(const double U);

		/****** Geom2d_Conic::SetAxis ******/
		/****** md5 signature: fba67a5039095eddccca14c1039ad8be ******/
		%feature("compactdefaultargs") SetAxis;
		%feature("autodoc", "
Parameters
----------
theA: gp_Ax22d

Return
-------
None

Description
-----------
Modifies this conic, redefining its local coordinate system partially, by assigning theA as its axis.
") SetAxis;
		void SetAxis(const gp_Ax22d & theA);

		/****** Geom2d_Conic::SetLocation ******/
		/****** md5 signature: fea6486624f66c26e32103313f4d0c00 ******/
		%feature("compactdefaultargs") SetLocation;
		%feature("autodoc", "
Parameters
----------
theP: gp_Pnt2d

Return
-------
None

Description
-----------
Modifies this conic, redefining its local coordinate system partially, by assigning theP as its origin.
") SetLocation;
		void SetLocation(const gp_Pnt2d & theP);

		/****** Geom2d_Conic::SetXAxis ******/
		/****** md5 signature: a940d42d37d70f1fa54d8c4b631fa857 ******/
		%feature("compactdefaultargs") SetXAxis;
		%feature("autodoc", "
Parameters
----------
theAX: gp_Ax2d

Return
-------
None

Description
-----------
Assigns the origin and unit vector of axis theA to the origin of the local coordinate system of this conic and X Direction. The other unit vector of the local coordinate system of this conic is recomputed normal to theA, without changing the orientation of the local coordinate system (right-handed or left-handed).
") SetXAxis;
		void SetXAxis(const gp_Ax2d & theAX);

		/****** Geom2d_Conic::SetYAxis ******/
		/****** md5 signature: e0866d51ed896da56c8b4c40fa15c187 ******/
		%feature("compactdefaultargs") SetYAxis;
		%feature("autodoc", "
Parameters
----------
theAY: gp_Ax2d

Return
-------
None

Description
-----------
Assigns the origin and unit vector of axis theA to the origin of the local coordinate system of this conic and Y Direction. The other unit vector of the local coordinate system of this conic is recomputed normal to theA, without changing the orientation of the local coordinate system (right-handed or left-handed).
") SetYAxis;
		void SetYAxis(const gp_Ax2d & theAY);

		/****** Geom2d_Conic::XAxis ******/
		/****** md5 signature: 5bcd651b87069885e2b5ecad2bd89992 ******/
		%feature("compactdefaultargs") XAxis;
		%feature("autodoc", "Return
-------
gp_Ax2d

Description
-----------
Returns the 'XAxis' of the conic. This axis defines the origin of parametrization of the conic. This axis and the 'Yaxis' define the local coordinate system of the conic. -C++: return const&.
") XAxis;
		gp_Ax2d XAxis();

		/****** Geom2d_Conic::YAxis ******/
		/****** md5 signature: 1e80565ed75c7e231792089b80d7c873 ******/
		%feature("compactdefaultargs") YAxis;
		%feature("autodoc", "Return
-------
gp_Ax2d

Description
-----------
Returns the 'YAxis' of the conic. The 'YAxis' is perpendicular to the 'Xaxis'.
") YAxis;
		gp_Ax2d YAxis();

};


%make_alias(Geom2d_Conic)

%extend Geom2d_Conic {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************
* class Geom2d_Direction *
*************************/
class Geom2d_Direction : public Geom2d_Vector {
	public:
		/****** Geom2d_Direction::Geom2d_Direction ******/
		/****** md5 signature: 1b97aef19df31912a8ac6c631b31f67a ******/
		%feature("compactdefaultargs") Geom2d_Direction;
		%feature("autodoc", "
Parameters
----------
X: double
Y: double

Return
-------
None

Description
-----------
Creates a unit vector with it 2 cartesian coordinates. //! Raised if std::sqrt( X*X + Y*Y) <= Resolution from gp.
") Geom2d_Direction;
		 Geom2d_Direction(const double X, const double Y);

		/****** Geom2d_Direction::Geom2d_Direction ******/
		/****** md5 signature: 9aa0c4e41dac0f1a7422ba761567830a ******/
		%feature("compactdefaultargs") Geom2d_Direction;
		%feature("autodoc", "
Parameters
----------
V: gp_Dir2d

Return
-------
None

Description
-----------
Creates a persistent copy of <self>.
") Geom2d_Direction;
		 Geom2d_Direction(const gp_Dir2d & V);

		/****** Geom2d_Direction::Copy ******/
		/****** md5 signature: 357e0361ce7af4bdc756de6d7ba219d9 ******/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom2d_Geometry>

Description
-----------
Creates a new object which is a copy of this unit vector.
") Copy;
		opencascade::handle<Geom2d_Geometry> Copy();

		/****** Geom2d_Direction::Crossed ******/
		/****** md5 signature: cdb7bf2e1e4e7d7f43c17917bc266d77 ******/
		%feature("compactdefaultargs") Crossed;
		%feature("autodoc", "
Parameters
----------
Other: Geom2d_Vector

Return
-------
double

Description
-----------
Computes the cross product between <self> and <Other>.
") Crossed;
		double Crossed(const opencascade::handle<Geom2d_Vector> & Other);

		/****** Geom2d_Direction::Dir2d ******/
		/****** md5 signature: e038c8f594851f20129c96f9b1a76267 ******/
		%feature("compactdefaultargs") Dir2d;
		%feature("autodoc", "Return
-------
gp_Dir2d

Description
-----------
Converts this unit vector into a gp_Dir2d unit vector.
") Dir2d;
		gp_Dir2d Dir2d();

		/****** Geom2d_Direction::Magnitude ******/
		/****** md5 signature: f81e88eb8b9208e45dd09a16fc9ced2c ******/
		%feature("compactdefaultargs") Magnitude;
		%feature("autodoc", "Return
-------
double

Description
-----------
returns 1.0.
") Magnitude;
		double Magnitude();

		/****** Geom2d_Direction::SetCoord ******/
		/****** md5 signature: 4ba372cec3164648b27af191e52590e8 ******/
		%feature("compactdefaultargs") SetCoord;
		%feature("autodoc", "
Parameters
----------
X: double
Y: double

Return
-------
None

Description
-----------
Assigns the coordinates X and Y to this unit vector, then normalizes it. Exceptions Standard_ConstructionError if std::sqrt(X*X + Y*Y) is less than or equal to gp::Resolution().
") SetCoord;
		void SetCoord(const double X, const double Y);

		/****** Geom2d_Direction::SetDir2d ******/
		/****** md5 signature: d586af66a90b7452474a8df439583909 ******/
		%feature("compactdefaultargs") SetDir2d;
		%feature("autodoc", "
Parameters
----------
V: gp_Dir2d

Return
-------
None

Description
-----------
Converts the gp_Dir2d unit vector V into this unit vector.
") SetDir2d;
		void SetDir2d(const gp_Dir2d & V);

		/****** Geom2d_Direction::SetX ******/
		/****** md5 signature: b2a1aeaab5eb38d0f723f9862b1dcc0b ******/
		%feature("compactdefaultargs") SetX;
		%feature("autodoc", "
Parameters
----------
X: double

Return
-------
None

Description
-----------
Assigns a value to the X coordinate of this unit vector, then normalizes it. Exceptions Standard_ConstructionError if the value assigned causes the magnitude of the vector to become less than or equal to gp::Resolution().
") SetX;
		void SetX(const double X);

		/****** Geom2d_Direction::SetY ******/
		/****** md5 signature: 999029c3c06ea6c6b1fd3b4a9def6c70 ******/
		%feature("compactdefaultargs") SetY;
		%feature("autodoc", "
Parameters
----------
Y: double

Return
-------
None

Description
-----------
Assigns a value to the Y coordinate of this unit vector, then normalizes it. Exceptions Standard_ConstructionError if the value assigned causes the magnitude of the vector to become less than or equal to gp::Resolution().
") SetY;
		void SetY(const double Y);

		/****** Geom2d_Direction::SquareMagnitude ******/
		/****** md5 signature: 36232d3c8b696593d29a30a15f29c945 ******/
		%feature("compactdefaultargs") SquareMagnitude;
		%feature("autodoc", "Return
-------
double

Description
-----------
returns 1.0.
") SquareMagnitude;
		double SquareMagnitude();

		/****** Geom2d_Direction::Transform ******/
		/****** md5 signature: c3e9d0cbb6ef2be1d446ca43c7e51616 ******/
		%feature("compactdefaultargs") Transform;
		%feature("autodoc", "
Parameters
----------
T: gp_Trsf2d

Return
-------
None

Description
-----------
Applies the transformation T to this unit vector, then normalizes it.
") Transform;
		void Transform(const gp_Trsf2d & T);

};


%make_alias(Geom2d_Direction)

%extend Geom2d_Direction {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************
* class Geom2d_Line *
********************/
class Geom2d_Line : public Geom2d_Curve {
	public:
		/****** Geom2d_Line::Geom2d_Line ******/
		/****** md5 signature: 1dfcd9cca30c59c42ced5c52907b3989 ******/
		%feature("compactdefaultargs") Geom2d_Line;
		%feature("autodoc", "
Parameters
----------
A: gp_Ax2d

Return
-------
None

Description
-----------
Creates a line located in 2D space with the axis placement A. The Location of A is the origin of the line.
") Geom2d_Line;
		 Geom2d_Line(const gp_Ax2d & A);

		/****** Geom2d_Line::Geom2d_Line ******/
		/****** md5 signature: 8702e04e5651081b2198553e42ad55d2 ******/
		%feature("compactdefaultargs") Geom2d_Line;
		%feature("autodoc", "
Parameters
----------
L: gp_Lin2d

Return
-------
None

Description
-----------
Creates a line by conversion of the gp_Lin2d line L.
") Geom2d_Line;
		 Geom2d_Line(const gp_Lin2d & L);

		/****** Geom2d_Line::Geom2d_Line ******/
		/****** md5 signature: f0fa4fa6cd8c784d4931f5e6a2495b0a ******/
		%feature("compactdefaultargs") Geom2d_Line;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt2d
V: gp_Dir2d

Return
-------
None

Description
-----------
Constructs a line passing through point P and parallel to vector V (P and V are, respectively, the origin and the unit vector of the positioning axis of the line).
") Geom2d_Line;
		 Geom2d_Line(const gp_Pnt2d & P, const gp_Dir2d & V);

		/****** Geom2d_Line::Continuity ******/
		/****** md5 signature: 3913f24bd9959795c7debf7fdd9fbb85 ******/
		%feature("compactdefaultargs") Continuity;
		%feature("autodoc", "Return
-------
GeomAbs_Shape

Description
-----------
Returns GeomAbs_CN, which is the global continuity of any line.
") Continuity;
		GeomAbs_Shape Continuity();

		/****** Geom2d_Line::Copy ******/
		/****** md5 signature: 74978107abfe60e7556292524128d117 ******/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom2d_Geometry>

Description
-----------
Creates a new object, which is a copy of this line.
") Copy;
		opencascade::handle<Geom2d_Geometry> Copy();

		/****** Geom2d_Line::Direction ******/
		/****** md5 signature: 24b32913fac63aab5fb6c5d1d7be7851 ******/
		%feature("compactdefaultargs") Direction;
		%feature("autodoc", "Return
-------
gp_Dir2d

Description
-----------
changes the direction of the line.
") Direction;
		const gp_Dir2d Direction();

		/****** Geom2d_Line::Distance ******/
		/****** md5 signature: f54a4432a8cfc2ca33c2afb3297c5457 ******/
		%feature("compactdefaultargs") Distance;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt2d

Return
-------
double

Description
-----------
Computes the distance between <self> and the point P.
") Distance;
		double Distance(const gp_Pnt2d & P);


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
		/****** Geom2d_Line::EvalD0 ******/
		/****** md5 signature: c8a189e7ecec0f3816c2e727cd23497e ******/
		%feature("compactdefaultargs") EvalD0;
		%feature("autodoc", "
Parameters
----------
U: double

Return
-------
gp_Pnt2d

Description
-----------
Returns in P the point of parameter U. P (U) = O + U * Dir where O is the 'Location' point of the line and Dir the direction of the line.
") EvalD0;
		gp_Pnt2d EvalD0(const double U);

		/****** Geom2d_Line::EvalD1 ******/
		/****** md5 signature: 462ecd6034b2afa120bdac346ba132d5 ******/
		%feature("compactdefaultargs") EvalD1;
		%feature("autodoc", "
Parameters
----------
U: double

Return
-------
Geom2d_Curve::ResD1

Description
-----------
Returns the point P of parameter u and the first derivative V1.
") EvalD1;
		Geom2d_Curve::ResD1 EvalD1(const double U);

		/****** Geom2d_Line::EvalD2 ******/
		/****** md5 signature: 195e2415ae9d3e0cc993940e201783d4 ******/
		%feature("compactdefaultargs") EvalD2;
		%feature("autodoc", "
Parameters
----------
U: double

Return
-------
Geom2d_Curve::ResD2

Description
-----------
Returns the point P of parameter U, the first and second derivatives V1 and V2. V2 is a vector with null magnitude for a line.
") EvalD2;
		Geom2d_Curve::ResD2 EvalD2(const double U);

		/****** Geom2d_Line::EvalD3 ******/
		/****** md5 signature: d77ee3aa017f69682a733367b913cdf5 ******/
		%feature("compactdefaultargs") EvalD3;
		%feature("autodoc", "
Parameters
----------
U: double

Return
-------
Geom2d_Curve::ResD3

Description
-----------
V2 and V3 are vectors with null magnitude for a line.
") EvalD3;
		Geom2d_Curve::ResD3 EvalD3(const double U);

		/****** Geom2d_Line::EvalDN ******/
		/****** md5 signature: 01a8d56d875f517809d0d195f9d25048 ******/
		%feature("compactdefaultargs") EvalDN;
		%feature("autodoc", "
Parameters
----------
U: double
N: int

Return
-------
gp_Vec2d

Description
-----------
For the point of parameter U of this line, computes the vector corresponding to the Nth derivative. Note: if N is greater than or equal to 2, the result is a vector with null magnitude. Exceptions Standard_RangeError if N is less than 1.
") EvalDN;
		gp_Vec2d EvalDN(const double U, const int N);

		/****** Geom2d_Line::FirstParameter ******/
		/****** md5 signature: c178e87663f41d496599eac833971a1b ******/
		%feature("compactdefaultargs") FirstParameter;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns RealFirst from Standard.
") FirstParameter;
		double FirstParameter();

		/****** Geom2d_Line::IsCN ******/
		/****** md5 signature: 42a5bf57a05eb6426c49586172f0db7e ******/
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
Returns True.
") IsCN;
		bool IsCN(const int N);

		/****** Geom2d_Line::IsClosed ******/
		/****** md5 signature: ad3909cb34dcb95a599222e5d4a64ef8 ******/
		%feature("compactdefaultargs") IsClosed;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns False.
") IsClosed;
		bool IsClosed();

		/****** Geom2d_Line::IsPeriodic ******/
		/****** md5 signature: 04e54c03a031850aca5f08a3025c1d5a ******/
		%feature("compactdefaultargs") IsPeriodic;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns False.
") IsPeriodic;
		bool IsPeriodic();

		/****** Geom2d_Line::LastParameter ******/
		/****** md5 signature: e183aab1f162396963682ac01a945da8 ******/
		%feature("compactdefaultargs") LastParameter;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns RealLast from Standard.
") LastParameter;
		double LastParameter();

		/****** Geom2d_Line::Lin2d ******/
		/****** md5 signature: a31ef8cb14503ca77be39e2816957515 ******/
		%feature("compactdefaultargs") Lin2d;
		%feature("autodoc", "Return
-------
gp_Lin2d

Description
-----------
Returns non persistent line from gp with the same geometric properties as <self>.
") Lin2d;
		gp_Lin2d Lin2d();

		/****** Geom2d_Line::Location ******/
		/****** md5 signature: fbf774a3a1efe16540d680c0476bcbc8 ******/
		%feature("compactdefaultargs") Location;
		%feature("autodoc", "Return
-------
gp_Pnt2d

Description
-----------
Changes the 'Location' point (origin) of the line.
") Location;
		const gp_Pnt2d Location();

		/****** Geom2d_Line::ParametricTransformation ******/
		/****** md5 signature: 55a643b3b901f410373528852b5587fb ******/
		%feature("compactdefaultargs") ParametricTransformation;
		%feature("autodoc", "
Parameters
----------
T: gp_Trsf2d

Return
-------
double

Description
-----------
Returns the coefficient required to compute the parametric transformation of this line when transformation T is applied. This coefficient is the ratio between the parameter of a point on this line and the parameter of the transformed point on the new line transformed by T. For a line, the returned value is the scale factor of the transformation T.
") ParametricTransformation;
		double ParametricTransformation(const gp_Trsf2d & T);

		/****** Geom2d_Line::Position ******/
		/****** md5 signature: 918ef7d5550c41cbbd9512dcf1888fbe ******/
		%feature("compactdefaultargs") Position;
		%feature("autodoc", "Return
-------
gp_Ax2d

Description
-----------
No available documentation.
") Position;
		const gp_Ax2d Position();

		/****** Geom2d_Line::Reverse ******/
		/****** md5 signature: 3329d3f633fce7835a9f2ded949a6050 ******/
		%feature("compactdefaultargs") Reverse;
		%feature("autodoc", "Return
-------
None

Description
-----------
Changes the orientation of this line. As a result, the unit vector of the positioning axis of this line is reversed.
") Reverse;
		void Reverse();

		/****** Geom2d_Line::ReversedParameter ******/
		/****** md5 signature: 27411d9c5403a777b5b7a63ba1bc2d4a ******/
		%feature("compactdefaultargs") ReversedParameter;
		%feature("autodoc", "
Parameters
----------
U: double

Return
-------
double

Description
-----------
Computes the parameter on the reversed line for the point of parameter U on this line. For a line, the returned value is -U.
") ReversedParameter;
		double ReversedParameter(const double U);

		/****** Geom2d_Line::SetDirection ******/
		/****** md5 signature: 12767d6ecad16faa02d3f67f1fb01553 ******/
		%feature("compactdefaultargs") SetDirection;
		%feature("autodoc", "
Parameters
----------
V: gp_Dir2d

Return
-------
None

Description
-----------
changes the direction of the line.
") SetDirection;
		void SetDirection(const gp_Dir2d & V);

		/****** Geom2d_Line::SetLin2d ******/
		/****** md5 signature: faf3d424dae22218db03626a5d7aa0b1 ******/
		%feature("compactdefaultargs") SetLin2d;
		%feature("autodoc", "
Parameters
----------
L: gp_Lin2d

Return
-------
None

Description
-----------
Set <self> so that <self> has the same geometric properties as L.
") SetLin2d;
		void SetLin2d(const gp_Lin2d & L);

		/****** Geom2d_Line::SetLocation ******/
		/****** md5 signature: 368c9b8c039b553e22ee650e75e4d404 ******/
		%feature("compactdefaultargs") SetLocation;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt2d

Return
-------
None

Description
-----------
Changes the 'Location' point (origin) of the line.
") SetLocation;
		void SetLocation(const gp_Pnt2d & P);

		/****** Geom2d_Line::SetPosition ******/
		/****** md5 signature: ea9b5278e5665b3886ffa693a4fe03fb ******/
		%feature("compactdefaultargs") SetPosition;
		%feature("autodoc", "
Parameters
----------
A: gp_Ax2d

Return
-------
None

Description
-----------
Changes the 'Location' and a the 'Direction' of <self>.
") SetPosition;
		void SetPosition(const gp_Ax2d & A);

		/****** Geom2d_Line::Transform ******/
		/****** md5 signature: f0c538f132ce05ee89ade1eb503968b4 ******/
		%feature("compactdefaultargs") Transform;
		%feature("autodoc", "
Parameters
----------
T: gp_Trsf2d

Return
-------
None

Description
-----------
Applies the transformation T to this line.
") Transform;
		void Transform(const gp_Trsf2d & T);

		/****** Geom2d_Line::TransformedParameter ******/
		/****** md5 signature: f28b84cfecafc520237e513f1e00974d ******/
		%feature("compactdefaultargs") TransformedParameter;
		%feature("autodoc", "
Parameters
----------
U: double
T: gp_Trsf2d

Return
-------
double

Description
-----------
Computes the parameter on the line transformed by T for the point of parameter U on this line. For a line, the returned value is equal to U multiplied by the scale factor of transformation T.
") TransformedParameter;
		double TransformedParameter(const double U, const gp_Trsf2d & T);

};


%make_alias(Geom2d_Line)

%extend Geom2d_Line {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************
* class Geom2d_OffsetCurve *
***************************/
class Geom2d_OffsetCurve : public Geom2d_Curve {
	public:
		/****** Geom2d_OffsetCurve::Geom2d_OffsetCurve ******/
		/****** md5 signature: f72d01166adae40bef24e29bf472f294 ******/
		%feature("compactdefaultargs") Geom2d_OffsetCurve;
		%feature("autodoc", "
Parameters
----------
C: Geom2d_Curve
Offset: double
isNotCheckC0: bool (optional, default to false)

Return
-------
None

Description
-----------
Constructs a curve offset from the basis curve C, where Offset is the distance between the offset curve and the basis curve at any point. A point on the offset curve is built by measuring the offset value along a normal vector at a point on C. This normal vector is obtained by rotating the vector tangential to C at 90 degrees in the anti-trigonometric sense. The side of C on which the offset value is measured is indicated by this normal vector if Offset is positive, or in the inverse sense if Offset is negative. If isNotCheckC0 = True checking if basis curve has C0-continuity is not made. Warnings: In this package the entities are not shared. The OffsetCurve is built with a copy of the curve C. So when C is modified the OffsetCurve is not modified Warning! if isNotCheckC0 = false, ConstructionError raised if the basis curve C is not at least C1. No check is done to know if ||V^Z|| != 0.0 at any point.
") Geom2d_OffsetCurve;
		 Geom2d_OffsetCurve(const opencascade::handle<Geom2d_Curve> & C, const double Offset, const bool isNotCheckC0 = false);

		/****** Geom2d_OffsetCurve::Geom2d_OffsetCurve ******/
		/****** md5 signature: 13aac9bc10cca08361d150f44cc9473f ******/
		%feature("compactdefaultargs") Geom2d_OffsetCurve;
		%feature("autodoc", "
Parameters
----------
theOther: Geom2d_OffsetCurve

Return
-------
None

Description
-----------
Copy constructor for optimized copying without validation.
") Geom2d_OffsetCurve;
		 Geom2d_OffsetCurve(const Geom2d_OffsetCurve & theOther);

		/****** Geom2d_OffsetCurve::BasisCurve ******/
		/****** md5 signature: a8e3b477d1e52617cbab75e7ce241296 ******/
		%feature("compactdefaultargs") BasisCurve;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom2d_Curve>

Description
-----------
Returns the basis curve of this offset curve. The basis curve can be an offset curve.
") BasisCurve;
		opencascade::handle<Geom2d_Curve> BasisCurve();

		/****** Geom2d_OffsetCurve::ClearEvalRepresentation ******/
		/****** md5 signature: 5c78bc9d081436c816c3f8de3b3086a8 ******/
		%feature("compactdefaultargs") ClearEvalRepresentation;
		%feature("autodoc", "Return
-------
None

Description
-----------
Removes the evaluation representation.
") ClearEvalRepresentation;
		void ClearEvalRepresentation();

		/****** Geom2d_OffsetCurve::Continuity ******/
		/****** md5 signature: 3913f24bd9959795c7debf7fdd9fbb85 ******/
		%feature("compactdefaultargs") Continuity;
		%feature("autodoc", "Return
-------
GeomAbs_Shape

Description
-----------
Continuity of the Offset curve: C0: only geometric continuity, C1: continuity of the first derivative all along the Curve, C2: continuity of the second derivative all along the Curve, C3: continuity of the third derivative all along the Curve, G1: tangency continuity all along the Curve, G2: curvature continuity all along the Curve, CN: the order of continuity is infinite. Warnings: Returns the continuity of the basis curve - 1. The offset curve must have a unique normal direction defined at any point. Value and derivatives //! Warnings: The exception UndefinedValue or UndefinedDerivative is raised if it is not possible to compute a unique offset direction. If T is the first derivative with not null length and Z the direction normal to the plane of the curve, the relation ||T(U) ^ Z|| != 0 must be satisfied to evaluate the offset curve. No check is done at the creation time and we suppose in this package that the offset curve is well defined.
") Continuity;
		GeomAbs_Shape Continuity();

		/****** Geom2d_OffsetCurve::Copy ******/
		/****** md5 signature: 74978107abfe60e7556292524128d117 ******/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom2d_Geometry>

Description
-----------
Creates a new object, which is a copy of this offset curve.
") Copy;
		opencascade::handle<Geom2d_Geometry> Copy();


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
		/****** Geom2d_OffsetCurve::EvalD0 ******/
		/****** md5 signature: c8a189e7ecec0f3816c2e727cd23497e ******/
		%feature("compactdefaultargs") EvalD0;
		%feature("autodoc", "
Parameters
----------
U: double

Return
-------
gp_Pnt2d

Description
-----------
Warning! this should not be called if the basis curve is not at least C1. Nevertheless if used on portion where the curve is C1, it is OK.
") EvalD0;
		gp_Pnt2d EvalD0(const double U);

		/****** Geom2d_OffsetCurve::EvalD1 ******/
		/****** md5 signature: 462ecd6034b2afa120bdac346ba132d5 ******/
		%feature("compactdefaultargs") EvalD1;
		%feature("autodoc", "
Parameters
----------
U: double

Return
-------
Geom2d_Curve::ResD1

Description
-----------
Warning! this should not be called if the continuity of the basis curve is not C2. Nevertheless, it's OK to use it on portion where the curve is C2.
") EvalD1;
		Geom2d_Curve::ResD1 EvalD1(const double U);

		/****** Geom2d_OffsetCurve::EvalD2 ******/
		/****** md5 signature: 195e2415ae9d3e0cc993940e201783d4 ******/
		%feature("compactdefaultargs") EvalD2;
		%feature("autodoc", "
Parameters
----------
U: double

Return
-------
Geom2d_Curve::ResD2

Description
-----------
Warning! This should not be called if the continuity of the basis curve is not C3. Nevertheless, it's OK to use it on portion where the curve is C3.
") EvalD2;
		Geom2d_Curve::ResD2 EvalD2(const double U);

		/****** Geom2d_OffsetCurve::EvalD3 ******/
		/****** md5 signature: d77ee3aa017f69682a733367b913cdf5 ******/
		%feature("compactdefaultargs") EvalD3;
		%feature("autodoc", "
Parameters
----------
U: double

Return
-------
Geom2d_Curve::ResD3

Description
-----------
Warning! This should not be called if the continuity of the basis curve is not C4. Nevertheless, it's OK to use it on portion where the curve is C4.
") EvalD3;
		Geom2d_Curve::ResD3 EvalD3(const double U);

		/****** Geom2d_OffsetCurve::EvalDN ******/
		/****** md5 signature: 01a8d56d875f517809d0d195f9d25048 ******/
		%feature("compactdefaultargs") EvalDN;
		%feature("autodoc", "
Parameters
----------
U: double
N: int

Return
-------
gp_Vec2d

Description
-----------
The returned vector gives the value of the derivative for the order of derivation N. Warning! this should not be called raises UndefunedDerivative if the continuity of the basis curve is not CN+1. Nevertheless, it's OK to use it on portion where the curve is CN+1 raises RangeError if N < 1. raises NotImplemented if N > 3. The following functions compute the value and derivatives on the offset curve and returns the derivatives on the basis curve too. The computation of the value and derivatives on the basis curve are used to evaluate the offset curve Warnings: The exception UndefinedValue or UndefinedDerivative is raised if it is not possible to compute a unique offset direction.
") EvalDN;
		gp_Vec2d EvalDN(const double U, const int N);

		/****** Geom2d_OffsetCurve::EvalRepresentation ******/
		/****** md5 signature: 79008f0c02d59fb82e2c23399f4e977c ******/
		%feature("compactdefaultargs") EvalRepresentation;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom2dEval_RepCurveDesc::Base>

Description
-----------
Returns the current evaluation representation descriptor (may be null).
") EvalRepresentation;
		const opencascade::handle<Geom2dEval_RepCurveDesc::Base> & EvalRepresentation();

		/****** Geom2d_OffsetCurve::FirstParameter ******/
		/****** md5 signature: c178e87663f41d496599eac833971a1b ******/
		%feature("compactdefaultargs") FirstParameter;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns the value of the first parameter of this offset curve. The first parameter corresponds to the start point of the curve. Note: the first and last parameters of this offset curve are also the ones of its basis curve.
") FirstParameter;
		double FirstParameter();

		/****** Geom2d_OffsetCurve::GetBasisCurveContinuity ******/
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

		/****** Geom2d_OffsetCurve::HasEvalRepresentation ******/
		/****** md5 signature: 4c7fcc1bfd1528c32230ca532f41f437 ******/
		%feature("compactdefaultargs") HasEvalRepresentation;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if an evaluation representation is attached.
") HasEvalRepresentation;
		bool HasEvalRepresentation();

		/****** Geom2d_OffsetCurve::IsCN ******/
		/****** md5 signature: 42a5bf57a05eb6426c49586172f0db7e ******/
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
Is the order of continuity of the curve N ? Warnings: This method answer True if the continuity of the basis curve is N + 1. We suppose in this class that a normal direction to the basis curve (used to compute the offset curve) is defined at any point on the basis curve. Raised if N < 0.
") IsCN;
		bool IsCN(const int N);

		/****** Geom2d_OffsetCurve::IsClosed ******/
		/****** md5 signature: ad3909cb34dcb95a599222e5d4a64ef8 ******/
		%feature("compactdefaultargs") IsClosed;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if the distance between the start point and the end point of the curve is lower or equal to Resolution from package gp.
") IsClosed;
		bool IsClosed();

		/****** Geom2d_OffsetCurve::IsPeriodic ******/
		/****** md5 signature: 04e54c03a031850aca5f08a3025c1d5a ******/
		%feature("compactdefaultargs") IsPeriodic;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Is the parametrization of a curve is periodic ? If the basis curve is a circle or an ellipse the corresponding OffsetCurve is periodic. If the basis curve can't be periodic (for example BezierCurve) the OffsetCurve can't be periodic.
") IsPeriodic;
		bool IsPeriodic();

		/****** Geom2d_OffsetCurve::LastParameter ******/
		/****** md5 signature: e183aab1f162396963682ac01a945da8 ******/
		%feature("compactdefaultargs") LastParameter;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns the value of the last parameter of this offset curve. The last parameter corresponds to the end point. Note: the first and last parameters of this offset curve are also the ones of its basis curve.
") LastParameter;
		double LastParameter();

		/****** Geom2d_OffsetCurve::Offset ******/
		/****** md5 signature: 836b6ce2e49b4dad24937fa829c24b3c ******/
		%feature("compactdefaultargs") Offset;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns the offset value of this offset curve.
") Offset;
		double Offset();

		/****** Geom2d_OffsetCurve::ParametricTransformation ******/
		/****** md5 signature: 55a643b3b901f410373528852b5587fb ******/
		%feature("compactdefaultargs") ParametricTransformation;
		%feature("autodoc", "
Parameters
----------
T: gp_Trsf2d

Return
-------
double

Description
-----------
Returns a coefficient to compute the parameter on the transformed curve for the transform of the point on <self>. //! Transformed(T)->Value(U * ParametricTransformation(T)) //! is the same point as //! Value(U).Transformed(T) //! This methods calls the basis curve method.
") ParametricTransformation;
		double ParametricTransformation(const gp_Trsf2d & T);

		/****** Geom2d_OffsetCurve::Period ******/
		/****** md5 signature: 840c481cf79bd2e1a55b5fd149e36dea ******/
		%feature("compactdefaultargs") Period;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns the period of this offset curve, i.e. the period of the basis curve of this offset curve. Exceptions Standard_NoSuchObject if the basis curve is not periodic.
") Period;
		double Period();

		/****** Geom2d_OffsetCurve::Reverse ******/
		/****** md5 signature: 3329d3f633fce7835a9f2ded949a6050 ******/
		%feature("compactdefaultargs") Reverse;
		%feature("autodoc", "Return
-------
None

Description
-----------
Changes the direction of parametrization of <self>. As a result: - the basis curve is reversed, - the start point of the initial curve becomes the end point of the reversed curve, - the end point of the initial curve becomes the start point of the reversed curve, and - the first and last parameters are recomputed.
") Reverse;
		void Reverse();

		/****** Geom2d_OffsetCurve::ReversedParameter ******/
		/****** md5 signature: 27411d9c5403a777b5b7a63ba1bc2d4a ******/
		%feature("compactdefaultargs") ReversedParameter;
		%feature("autodoc", "
Parameters
----------
U: double

Return
-------
double

Description
-----------
Computes the parameter on the reversed curve for the point of parameter U on this offset curve.
") ReversedParameter;
		double ReversedParameter(const double U);

		/****** Geom2d_OffsetCurve::SetBasisCurve ******/
		/****** md5 signature: c6de20f3819cb82493901a3d4bdb5258 ******/
		%feature("compactdefaultargs") SetBasisCurve;
		%feature("autodoc", "
Parameters
----------
C: Geom2d_Curve
isNotCheckC0: bool (optional, default to false)

Return
-------
None

Description
-----------
Changes this offset curve by assigning C as the basis curve from which it is built. If isNotCheckC0 = True checking if basis curve has C0-continuity is not made. Exceptions if isNotCheckC0 = false, Standard_ConstructionError if the curve C is not at least 'C1' continuous.
") SetBasisCurve;
		void SetBasisCurve(const opencascade::handle<Geom2d_Curve> & C, const bool isNotCheckC0 = false);

		/****** Geom2d_OffsetCurve::SetEvalRepresentation ******/
		/****** md5 signature: 71cef6212c8b55d57a83bcf2966726c8 ******/
		%feature("compactdefaultargs") SetEvalRepresentation;
		%feature("autodoc", "
Parameters
----------
theDesc: Geom2dEval_RepCurveDesc::Base

Return
-------
None

Description
-----------
Sets a new evaluation representation. Validates descriptor data and ensures no circular references.
") SetEvalRepresentation;
		void SetEvalRepresentation(const opencascade::handle<Geom2dEval_RepCurveDesc::Base> & theDesc);

		/****** Geom2d_OffsetCurve::SetOffsetValue ******/
		/****** md5 signature: 638fc518e51dadf4ff1193be6830c419 ******/
		%feature("compactdefaultargs") SetOffsetValue;
		%feature("autodoc", "
Parameters
----------
D: double

Return
-------
None

Description
-----------
Changes this offset curve by assigning D as the offset value.
") SetOffsetValue;
		void SetOffsetValue(const double D);

		/****** Geom2d_OffsetCurve::Transform ******/
		/****** md5 signature: f0c538f132ce05ee89ade1eb503968b4 ******/
		%feature("compactdefaultargs") Transform;
		%feature("autodoc", "
Parameters
----------
T: gp_Trsf2d

Return
-------
None

Description
-----------
Applies the transformation T to this offset curve. Note: the basis curve is also modified.
") Transform;
		void Transform(const gp_Trsf2d & T);

		/****** Geom2d_OffsetCurve::TransformedParameter ******/
		/****** md5 signature: f28b84cfecafc520237e513f1e00974d ******/
		%feature("compactdefaultargs") TransformedParameter;
		%feature("autodoc", "
Parameters
----------
U: double
T: gp_Trsf2d

Return
-------
double

Description
-----------
Returns the parameter on the transformed curve for the transform of the point of parameter U on <self>. //! me->Transformed(T)->Value(me->TransformedParameter(U,T)) //! is the same point as //! me->Value(U).Transformed(T) //! This methods calls the basis curve method.
") TransformedParameter;
		double TransformedParameter(const double U, const gp_Trsf2d & T);

};


%make_alias(Geom2d_OffsetCurve)

%extend Geom2d_OffsetCurve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************************
* class Geom2d_VectorWithMagnitude *
***********************************/
class Geom2d_VectorWithMagnitude : public Geom2d_Vector {
	public:
		/****** Geom2d_VectorWithMagnitude::Geom2d_VectorWithMagnitude ******/
		/****** md5 signature: f217f9f58457955ac44075e8157d4840 ******/
		%feature("compactdefaultargs") Geom2d_VectorWithMagnitude;
		%feature("autodoc", "
Parameters
----------
V: gp_Vec2d

Return
-------
None

Description
-----------
Creates a persistent copy of V.
") Geom2d_VectorWithMagnitude;
		 Geom2d_VectorWithMagnitude(const gp_Vec2d & V);

		/****** Geom2d_VectorWithMagnitude::Geom2d_VectorWithMagnitude ******/
		/****** md5 signature: 5fc135f67b8accb743ed11040fee7b8d ******/
		%feature("compactdefaultargs") Geom2d_VectorWithMagnitude;
		%feature("autodoc", "
Parameters
----------
X: double
Y: double

Return
-------
None

Description
-----------
Creates a vector with two cartesian coordinates.
") Geom2d_VectorWithMagnitude;
		 Geom2d_VectorWithMagnitude(const double X, const double Y);

		/****** Geom2d_VectorWithMagnitude::Geom2d_VectorWithMagnitude ******/
		/****** md5 signature: c88dc1cdae8eb0574200ae0c25d562c5 ******/
		%feature("compactdefaultargs") Geom2d_VectorWithMagnitude;
		%feature("autodoc", "
Parameters
----------
P1: gp_Pnt2d
P2: gp_Pnt2d

Return
-------
None

Description
-----------
Creates a vector from the point P1 to the point P2. The magnitude of the vector is the distance between P1 and P2.
") Geom2d_VectorWithMagnitude;
		 Geom2d_VectorWithMagnitude(const gp_Pnt2d & P1, const gp_Pnt2d & P2);

		/****** Geom2d_VectorWithMagnitude::Add ******/
		/****** md5 signature: f7b5c1b5bf0696f32918ee9c07834f8d ******/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
Other: Geom2d_Vector

Return
-------
None

Description
-----------
Adds the Vector Other to <self>.
") Add;
		void Add(const opencascade::handle<Geom2d_Vector> & Other);

		/****** Geom2d_VectorWithMagnitude::Added ******/
		/****** md5 signature: 9115475aabc98af8d41462cc81c932cc ******/
		%feature("compactdefaultargs") Added;
		%feature("autodoc", "
Parameters
----------
Other: Geom2d_Vector

Return
-------
opencascade::handle<Geom2d_VectorWithMagnitude>

Description
-----------
Adds the vector Other to <self>.
") Added;
		opencascade::handle<Geom2d_VectorWithMagnitude> Added(const opencascade::handle<Geom2d_Vector> & Other);

		/****** Geom2d_VectorWithMagnitude::Copy ******/
		/****** md5 signature: 357e0361ce7af4bdc756de6d7ba219d9 ******/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom2d_Geometry>

Description
-----------
Creates a new object which is a copy of this vector.
") Copy;
		opencascade::handle<Geom2d_Geometry> Copy();

		/****** Geom2d_VectorWithMagnitude::Crossed ******/
		/****** md5 signature: cdb7bf2e1e4e7d7f43c17917bc266d77 ******/
		%feature("compactdefaultargs") Crossed;
		%feature("autodoc", "
Parameters
----------
Other: Geom2d_Vector

Return
-------
double

Description
-----------
Computes the cross product between <self> and Other <self> ^ Other. A new vector is returned.
") Crossed;
		double Crossed(const opencascade::handle<Geom2d_Vector> & Other);

		/****** Geom2d_VectorWithMagnitude::Divide ******/
		/****** md5 signature: 832336b743e9ae406509c1b8deba867e ******/
		%feature("compactdefaultargs") Divide;
		%feature("autodoc", "
Parameters
----------
Scalar: double

Return
-------
None

Description
-----------
Divides <self> by a scalar.
") Divide;
		void Divide(const double Scalar);

		/****** Geom2d_VectorWithMagnitude::Divided ******/
		/****** md5 signature: f39eff2a245929891fbe82f06db48411 ******/
		%feature("compactdefaultargs") Divided;
		%feature("autodoc", "
Parameters
----------
Scalar: double

Return
-------
opencascade::handle<Geom2d_VectorWithMagnitude>

Description
-----------
Divides <self> by a scalar. A new vector is returned.
") Divided;
		opencascade::handle<Geom2d_VectorWithMagnitude> Divided(const double Scalar);

		/****** Geom2d_VectorWithMagnitude::Magnitude ******/
		/****** md5 signature: f81e88eb8b9208e45dd09a16fc9ced2c ******/
		%feature("compactdefaultargs") Magnitude;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns the magnitude of <self>.
") Magnitude;
		double Magnitude();

		/****** Geom2d_VectorWithMagnitude::Multiplied ******/
		/****** md5 signature: ab0d065fd61998c89304d225eac75e79 ******/
		%feature("compactdefaultargs") Multiplied;
		%feature("autodoc", "
Parameters
----------
Scalar: double

Return
-------
opencascade::handle<Geom2d_VectorWithMagnitude>

Description
-----------
Computes the product of the vector <self> by a scalar. A new vector is returned. //! -C++: alias operator * Collision with same operator defined for the class Vector!.
") Multiplied;
		opencascade::handle<Geom2d_VectorWithMagnitude> Multiplied(const double Scalar);

		/****** Geom2d_VectorWithMagnitude::Multiply ******/
		/****** md5 signature: c1b5020cc596ee49b88e41fb192e9e5e ******/
		%feature("compactdefaultargs") Multiply;
		%feature("autodoc", "
Parameters
----------
Scalar: double

Return
-------
None

Description
-----------
Computes the product of the vector <self> by a scalar.
") Multiply;
		void Multiply(const double Scalar);

		/****** Geom2d_VectorWithMagnitude::Normalize ******/
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

		/****** Geom2d_VectorWithMagnitude::Normalized ******/
		/****** md5 signature: 14bd1ebbd370df99d9623cd73aa96456 ******/
		%feature("compactdefaultargs") Normalized;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom2d_VectorWithMagnitude>

Description
-----------
Returns a copy of <self> Normalized. //! Raised if the magnitude of the vector is lower or equal to Resolution from package gp.
") Normalized;
		opencascade::handle<Geom2d_VectorWithMagnitude> Normalized();

		/****** Geom2d_VectorWithMagnitude::SetCoord ******/
		/****** md5 signature: 4ba372cec3164648b27af191e52590e8 ******/
		%feature("compactdefaultargs") SetCoord;
		%feature("autodoc", "
Parameters
----------
X: double
Y: double

Return
-------
None

Description
-----------
Set <self> to X, Y coordinates.
") SetCoord;
		void SetCoord(const double X, const double Y);

		/****** Geom2d_VectorWithMagnitude::SetVec2d ******/
		/****** md5 signature: 863f12e1dec37e33194ea8900547718d ******/
		%feature("compactdefaultargs") SetVec2d;
		%feature("autodoc", "
Parameters
----------
V: gp_Vec2d

Return
-------
None

Description
-----------
No available documentation.
") SetVec2d;
		void SetVec2d(const gp_Vec2d & V);

		/****** Geom2d_VectorWithMagnitude::SetX ******/
		/****** md5 signature: b2a1aeaab5eb38d0f723f9862b1dcc0b ******/
		%feature("compactdefaultargs") SetX;
		%feature("autodoc", "
Parameters
----------
X: double

Return
-------
None

Description
-----------
Changes the X coordinate of <self>.
") SetX;
		void SetX(const double X);

		/****** Geom2d_VectorWithMagnitude::SetY ******/
		/****** md5 signature: 999029c3c06ea6c6b1fd3b4a9def6c70 ******/
		%feature("compactdefaultargs") SetY;
		%feature("autodoc", "
Parameters
----------
Y: double

Return
-------
None

Description
-----------
Changes the Y coordinate of <self>.
") SetY;
		void SetY(const double Y);

		/****** Geom2d_VectorWithMagnitude::SquareMagnitude ******/
		/****** md5 signature: 36232d3c8b696593d29a30a15f29c945 ******/
		%feature("compactdefaultargs") SquareMagnitude;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns the square magnitude of <self>.
") SquareMagnitude;
		double SquareMagnitude();

		/****** Geom2d_VectorWithMagnitude::Subtract ******/
		/****** md5 signature: d8e9cfde46a3e7c6080c069df7dbb788 ******/
		%feature("compactdefaultargs") Subtract;
		%feature("autodoc", "
Parameters
----------
Other: Geom2d_Vector

Return
-------
None

Description
-----------
Subtracts the Vector Other to <self>.
") Subtract;
		void Subtract(const opencascade::handle<Geom2d_Vector> & Other);

		/****** Geom2d_VectorWithMagnitude::Subtracted ******/
		/****** md5 signature: 4fbb6b22e705df6acc8e9854d44ae113 ******/
		%feature("compactdefaultargs") Subtracted;
		%feature("autodoc", "
Parameters
----------
Other: Geom2d_Vector

Return
-------
opencascade::handle<Geom2d_VectorWithMagnitude>

Description
-----------
Subtracts the vector Other to <self>. A new vector is returned.
") Subtracted;
		opencascade::handle<Geom2d_VectorWithMagnitude> Subtracted(const opencascade::handle<Geom2d_Vector> & Other);

		/****** Geom2d_VectorWithMagnitude::Transform ******/
		/****** md5 signature: c3e9d0cbb6ef2be1d446ca43c7e51616 ******/
		%feature("compactdefaultargs") Transform;
		%feature("autodoc", "
Parameters
----------
T: gp_Trsf2d

Return
-------
None

Description
-----------
Applies the transformation T to this vector.
") Transform;
		void Transform(const gp_Trsf2d & T);


%extend{
    void __imul_wrapper__(const double other) {
    *self *= other;
    }
}
%pythoncode {
def __imul__(self, right):
    self.__imul_wrapper__(right)
    return self
}
		/****** Geom2d_VectorWithMagnitude::operator + ******/
		/****** md5 signature: 771c6f61e4c20d4eb184cb5b33f68d78 ******/
		%feature("compactdefaultargs") operator +;
		%feature("autodoc", "
Parameters
----------
Other: Geom2d_Vector

Return
-------
opencascade::handle<Geom2d_VectorWithMagnitude>

Description
-----------
No available documentation.
") operator +;
		opencascade::handle<Geom2d_VectorWithMagnitude> operator +(const opencascade::handle<Geom2d_Vector> & Other);


%extend{
    void __iadd_wrapper__(const opencascade::handle<Geom2d_Vector> other) {
    *self += other;
    }
}
%pythoncode {
def __iadd__(self, right):
    self.__iadd_wrapper__(right)
    return self
}
		/****** Geom2d_VectorWithMagnitude::operator - ******/
		/****** md5 signature: 2530c89d8b5c4d19ce213e1343e40928 ******/
		%feature("compactdefaultargs") operator -;
		%feature("autodoc", "
Parameters
----------
Other: Geom2d_Vector

Return
-------
opencascade::handle<Geom2d_VectorWithMagnitude>

Description
-----------
No available documentation.
") operator -;
		opencascade::handle<Geom2d_VectorWithMagnitude> operator -(const opencascade::handle<Geom2d_Vector> & Other);


%extend{
    void __isub_wrapper__(const opencascade::handle<Geom2d_Vector> other) {
    *self -= other;
    }
}
%pythoncode {
def __isub__(self, right):
    self.__isub_wrapper__(right)
    return self
}
		/****** Geom2d_VectorWithMagnitude::operator / ******/
		/****** md5 signature: 5d46857e26521160854c338e920f9023 ******/
		%feature("compactdefaultargs") operator /;
		%feature("autodoc", "
Parameters
----------
Scalar: double

Return
-------
opencascade::handle<Geom2d_VectorWithMagnitude>

Description
-----------
No available documentation.
") operator /;
		opencascade::handle<Geom2d_VectorWithMagnitude> operator /(const double Scalar);


%extend{
    void __itruediv_wrapper__(const double other) {
    *self /= other;
    }
}
%pythoncode {
def __itruediv__(self, right):
    self.__itruediv_wrapper__(right)
    return self
}
};


%make_alias(Geom2d_VectorWithMagnitude)

%extend Geom2d_VectorWithMagnitude {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************
* class Geom2d_BSplineCurve *
****************************/
class Geom2d_BSplineCurve : public Geom2d_BoundedCurve {
	public:
		/****** Geom2d_BSplineCurve::Geom2d_BSplineCurve ******/
		/****** md5 signature: f41d5095cfe80e2e66bc6d11e2bc81e2 ******/
		%feature("compactdefaultargs") Geom2d_BSplineCurve;
		%feature("autodoc", "
Parameters
----------
Poles: TColgp_Array1OfPnt2d
Knots: TColStd_Array1OfReal
Multiplicities: TColStd_Array1OfInteger
Degree: int
Periodic: bool (optional, default to false)

Return
-------
None

Description
-----------
Creates a non-rational B_spline curve on the basis <Knots, Multiplicities> of degree <Degree>. The following conditions must be verified. 0 < Degree <= MaxDegree. //! Knots.Length() == Mults.Length() >= 2 //! Knots(i) < Knots(i+1) (Knots are increasing) //! 1 <= Mults(i) <= Degree //! On a non periodic curve the first and last multiplicities may be Degree+1 (this is even recommended if you want the curve to start and finish on the first and last pole). //! On a periodic curve the first and the last multicities must be the same. //! on non-periodic curves //! Poles.Length() == Sum(Mults(i)) - Degree - 1 >= 2 //! on periodic curves //! Poles.Length() == Sum(Mults(i)) except the first or last.
") Geom2d_BSplineCurve;
		 Geom2d_BSplineCurve(const TColgp_Array1OfPnt2d & Poles, const TColStd_Array1OfReal & Knots, const TColStd_Array1OfInteger & Multiplicities, const int Degree, const bool Periodic = false);

		/****** Geom2d_BSplineCurve::Geom2d_BSplineCurve ******/
		/****** md5 signature: 727ea289c6b0455d54f824f7a753b522 ******/
		%feature("compactdefaultargs") Geom2d_BSplineCurve;
		%feature("autodoc", "
Parameters
----------
Poles: TColgp_Array1OfPnt2d
Weights: TColStd_Array1OfReal
Knots: TColStd_Array1OfReal
Multiplicities: TColStd_Array1OfInteger
Degree: int
Periodic: bool (optional, default to false)

Return
-------
None

Description
-----------
Creates a rational B_spline curve on the basis <Knots, Multiplicities> of degree <Degree>. The following conditions must be verified. 0 < Degree <= MaxDegree. //! Knots.Length() == Mults.Length() >= 2 //! Knots(i) < Knots(i+1) (Knots are increasing) //! 1 <= Mults(i) <= Degree //! On a non periodic curve the first and last multiplicities may be Degree+1 (this is even recommended if you want the curve to start and finish on the first and last pole). //! On a periodic curve the first and the last multicities must be the same. //! on non-periodic curves //! Poles.Length() == Sum(Mults(i)) - Degree - 1 >= 2 //! on periodic curves //! Poles.Length() == Sum(Mults(i)) except the first or last.
") Geom2d_BSplineCurve;
		 Geom2d_BSplineCurve(const TColgp_Array1OfPnt2d & Poles, const TColStd_Array1OfReal & Weights, const TColStd_Array1OfReal & Knots, const TColStd_Array1OfInteger & Multiplicities, const int Degree, const bool Periodic = false);

		/****** Geom2d_BSplineCurve::Geom2d_BSplineCurve ******/
		/****** md5 signature: 3218317f2a4b0c2191e0f14616eb6aab ******/
		%feature("compactdefaultargs") Geom2d_BSplineCurve;
		%feature("autodoc", "
Parameters
----------
theOther: Geom2d_BSplineCurve

Return
-------
None

Description
-----------
Copy constructor for optimized copying without validation.
") Geom2d_BSplineCurve;
		 Geom2d_BSplineCurve(const Geom2d_BSplineCurve & theOther);

		/****** Geom2d_BSplineCurve::ClearEvalRepresentation ******/
		/****** md5 signature: 5c78bc9d081436c816c3f8de3b3086a8 ******/
		%feature("compactdefaultargs") ClearEvalRepresentation;
		%feature("autodoc", "Return
-------
None

Description
-----------
Removes the evaluation representation.
") ClearEvalRepresentation;
		void ClearEvalRepresentation();

		/****** Geom2d_BSplineCurve::Continuity ******/
		/****** md5 signature: 3913f24bd9959795c7debf7fdd9fbb85 ******/
		%feature("compactdefaultargs") Continuity;
		%feature("autodoc", "Return
-------
GeomAbs_Shape

Description
-----------
Returns the global continuity of the curve: C0: only geometric continuity, C1: continuity of the first derivative all along the Curve, C2: continuity of the second derivative all along the Curve, C3: continuity of the third derivative all along the Curve, CN: the order of continuity is infinite. For a B-spline curve of degree d if a knot Ui has a multiplicity p the B-spline curve is only Cd-p continuous at Ui. So the global continuity of the curve can't be greater than Cd-p where p is the maximum multiplicity of the interior Knots. In the interior of a knot span the curve is infinitely continuously differentiable.
") Continuity;
		GeomAbs_Shape Continuity();

		/****** Geom2d_BSplineCurve::Copy ******/
		/****** md5 signature: 74978107abfe60e7556292524128d117 ******/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom2d_Geometry>

Description
-----------
Creates a new object which is a copy of this BSpline curve.
") Copy;
		opencascade::handle<Geom2d_Geometry> Copy();

		/****** Geom2d_BSplineCurve::Degree ******/
		/****** md5 signature: 41ab768385e3189d3d3bc517c9606dbb ******/
		%feature("compactdefaultargs") Degree;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the degree of this BSpline curve. In this class the degree of the basis normalized B-spline functions cannot be greater than 'MaxDegree' Computation of value and derivatives.
") Degree;
		int Degree();


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
		/****** Geom2d_BSplineCurve::EndPoint ******/
		/****** md5 signature: 46b1d7929694ea99d1f1a364c0266b97 ******/
		%feature("compactdefaultargs") EndPoint;
		%feature("autodoc", "Return
-------
gp_Pnt2d

Description
-----------
Returns the last point of the curve. Warnings: The last point of the curve is different from the last pole of the curve if the multiplicity of the last knot is lower than Degree.
") EndPoint;
		gp_Pnt2d EndPoint();

		/****** Geom2d_BSplineCurve::EvalD0 ******/
		/****** md5 signature: c8a189e7ecec0f3816c2e727cd23497e ******/
		%feature("compactdefaultargs") EvalD0;
		%feature("autodoc", "
Parameters
----------
U: double

Return
-------
gp_Pnt2d

Description
-----------
No available documentation.
") EvalD0;
		gp_Pnt2d EvalD0(const double U);

		/****** Geom2d_BSplineCurve::EvalD1 ******/
		/****** md5 signature: 462ecd6034b2afa120bdac346ba132d5 ******/
		%feature("compactdefaultargs") EvalD1;
		%feature("autodoc", "
Parameters
----------
U: double

Return
-------
Geom2d_Curve::ResD1

Description
-----------
Raised if the continuity of the curve is not C1.
") EvalD1;
		Geom2d_Curve::ResD1 EvalD1(const double U);

		/****** Geom2d_BSplineCurve::EvalD2 ******/
		/****** md5 signature: 195e2415ae9d3e0cc993940e201783d4 ******/
		%feature("compactdefaultargs") EvalD2;
		%feature("autodoc", "
Parameters
----------
U: double

Return
-------
Geom2d_Curve::ResD2

Description
-----------
Raised if the continuity of the curve is not C2.
") EvalD2;
		Geom2d_Curve::ResD2 EvalD2(const double U);

		/****** Geom2d_BSplineCurve::EvalD3 ******/
		/****** md5 signature: d77ee3aa017f69682a733367b913cdf5 ******/
		%feature("compactdefaultargs") EvalD3;
		%feature("autodoc", "
Parameters
----------
U: double

Return
-------
Geom2d_Curve::ResD3

Description
-----------
For this BSpline curve, computes - the point P of parameter U, or - the point P and one or more of the following values: - V1, the first derivative vector, - V2, the second derivative vector, - V3, the third derivative vector. Warning On a point where the continuity of the curve is not the one requested, these functions impact the part defined by the parameter with a value greater than U, i.e. the part of the curve to the 'right' of the singularity. Raises UndefinedDerivative if the continuity of the curve is not C3.
") EvalD3;
		Geom2d_Curve::ResD3 EvalD3(const double U);

		/****** Geom2d_BSplineCurve::EvalDN ******/
		/****** md5 signature: 01a8d56d875f517809d0d195f9d25048 ******/
		%feature("compactdefaultargs") EvalDN;
		%feature("autodoc", "
Parameters
----------
U: double
N: int

Return
-------
gp_Vec2d

Description
-----------
For the point of parameter U of this BSpline curve, computes the vector corresponding to the Nth derivative. Warning On a point where the continuity of the curve is not the one requested, this function impacts the part defined by the parameter with a value greater than U, i.e. the part of the curve to the 'right' of the singularity. Raises UndefinedDerivative if the continuity of the curve is not CN. RangeError if N < 1. The following functions computes the point of parameter U and the derivatives at this point on the B-spline curve arc defined between the knot FromK1 and the knot ToK2. U can be out of bounds [Knot (FromK1), Knot (ToK2)] but for the computation we only use the definition of the curve between these two knots. This method is useful to compute local derivative, if the order of continuity of the whole curve is not greater enough. Inside the parametric domain Knot (FromK1), Knot (ToK2) the evaluations are the same as if we consider the whole definition of the curve. Of course the evaluations are different outside this parametric domain.
") EvalDN;
		gp_Vec2d EvalDN(const double U, const int N);

		/****** Geom2d_BSplineCurve::EvalRepresentation ******/
		/****** md5 signature: 79008f0c02d59fb82e2c23399f4e977c ******/
		%feature("compactdefaultargs") EvalRepresentation;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom2dEval_RepCurveDesc::Base>

Description
-----------
Returns the current evaluation representation descriptor (may be null).
") EvalRepresentation;
		const opencascade::handle<Geom2dEval_RepCurveDesc::Base> & EvalRepresentation();

		/****** Geom2d_BSplineCurve::FirstParameter ******/
		/****** md5 signature: c178e87663f41d496599eac833971a1b ******/
		%feature("compactdefaultargs") FirstParameter;
		%feature("autodoc", "Return
-------
double

Description
-----------
Computes the parametric value of the start point of the curve. It is a knot value.
") FirstParameter;
		double FirstParameter();

		/****** Geom2d_BSplineCurve::FirstUKnotIndex ******/
		/****** md5 signature: 73211d64126e1b184f22787c35589527 ******/
		%feature("compactdefaultargs") FirstUKnotIndex;
		%feature("autodoc", "Return
-------
int

Description
-----------
For a B-spline curve the first parameter (which gives the start point of the curve) is a knot value but if the multiplicity of the first knot index is lower than Degree + 1 it is not the first knot of the curve. This method computes the index of the knot corresponding to the first parameter.
") FirstUKnotIndex;
		int FirstUKnotIndex();

		/****** Geom2d_BSplineCurve::HasEvalRepresentation ******/
		/****** md5 signature: 4c7fcc1bfd1528c32230ca532f41f437 ******/
		%feature("compactdefaultargs") HasEvalRepresentation;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if an evaluation representation is attached.
") HasEvalRepresentation;
		bool HasEvalRepresentation();

		/****** Geom2d_BSplineCurve::IncreaseDegree ******/
		/****** md5 signature: bedab57b39ff02828eefe07c657320e1 ******/
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
Increases the degree of this BSpline curve to Degree. As a result, the poles, weights and multiplicities tables are modified; the knots table is not changed. Nothing is done if Degree is less than or equal to the current degree. Exceptions Standard_ConstructionError if Degree is greater than Geom2d_BSplineCurve::MaxDegree().
") IncreaseDegree;
		void IncreaseDegree(const int Degree);

		/****** Geom2d_BSplineCurve::IncreaseMultiplicity ******/
		/****** md5 signature: 3546b162d433c77b2281ee8ee90f0cfb ******/
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
Increases the multiplicity of the knot <Index> to <M>. //! If <M> is lower or equal to the current multiplicity nothing is done. If <M> is higher than the degree, the degree is used. If <Index> is not in [FirstUKnotIndex, LastUKnotIndex].
") IncreaseMultiplicity;
		void IncreaseMultiplicity(const int Index, const int M);

		/****** Geom2d_BSplineCurve::IncreaseMultiplicity ******/
		/****** md5 signature: 338e0e1466ae655261a8fdb422f3c746 ******/
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
Increases the multiplicities of the knots in [I1,I2] to <M>. //! For each knot if <M> is lower or equal to the current multiplicity nothing is done. If <M> is higher than the degree the degree is used. As a result, the poles and weights tables of this curve are modified. Warning It is forbidden to modify the multiplicity of the first or last knot of a non-periodic curve. Be careful as Geom2d does not protect against this. Exceptions Standard_OutOfRange if either Index, I1 or I2 is outside the bounds of the knots table.
") IncreaseMultiplicity;
		void IncreaseMultiplicity(const int I1, const int I2, const int M);

		/****** Geom2d_BSplineCurve::IncrementMultiplicity ******/
		/****** md5 signature: ae8bd1f92cb1267858ba8100c2a97184 ******/
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
Increases by M the multiplicity of the knots of indexes I1 to I2 in the knots table of this BSpline curve. For each knot, the resulting multiplicity is limited to the degree of this curve. If M is negative, nothing is done. As a result, the poles and weights tables of this BSpline curve are modified. Warning It is forbidden to modify the multiplicity of the first or last knot of a non-periodic curve. Be careful as Geom2d does not protect against this. Exceptions Standard_OutOfRange if I1 or I2 is outside the bounds of the knots table.
") IncrementMultiplicity;
		void IncrementMultiplicity(const int I1, const int I2, const int M);

		/****** Geom2d_BSplineCurve::InsertKnot ******/
		/****** md5 signature: f30e7bbc2255d502d68ef7c785cff81b ******/
		%feature("compactdefaultargs") InsertKnot;
		%feature("autodoc", "
Parameters
----------
U: double
M: int (optional, default to 1)
ParametricTolerance: double (optional, default to 0.0)

Return
-------
None

Description
-----------
Inserts a knot value in the sequence of knots. If <U> is an existing knot the multiplicity is increased by <M>. //! If U is not on the parameter range nothing is done. //! If the multiplicity is negative or null nothing is done. The new multiplicity is limited to the degree. //! The tolerance criterion for knots equality is the max of Epsilon(U) and ParametricTolerance. Warning - If U is less than the first parameter or greater than the last parameter of this BSpline curve, nothing is done. - If M is negative or null, nothing is done. - The multiplicity of a knot is limited to the degree of this BSpline curve.
") InsertKnot;
		void InsertKnot(const double U, const int M = 1, const double ParametricTolerance = 0.0);

		/****** Geom2d_BSplineCurve::InsertKnots ******/
		/****** md5 signature: 566872a4790cfd3823ae734c0748a45d ******/
		%feature("compactdefaultargs") InsertKnots;
		%feature("autodoc", "
Parameters
----------
Knots: TColStd_Array1OfReal
Mults: TColStd_Array1OfInteger
ParametricTolerance: double (optional, default to 0.0)
Add: bool (optional, default to false)

Return
-------
None

Description
-----------
Inserts the values of the array Knots, with the respective multiplicities given by the array Mults, into the knots table of this BSpline curve. If a value of the array Knots is an existing knot, its multiplicity is: - increased by M, if Add is true, or - increased to M, if Add is false (default value). The tolerance criterion used for knot equality is the larger of the values ParametricTolerance (defaulted to 0.) and double::Epsilon(U), where U is the current knot value. Warning - For a value of the array Knots which is less than the first parameter or greater than the last parameter of this BSpline curve, nothing is done. - For a value of the array Mults which is negative or null, nothing is done. - The multiplicity of a knot is limited to the degree of this BSpline curve.
") InsertKnots;
		void InsertKnots(const TColStd_Array1OfReal & Knots, const TColStd_Array1OfInteger & Mults, const double ParametricTolerance = 0.0, const bool Add = false);

		/****** Geom2d_BSplineCurve::InsertPoleAfter ******/
		/****** md5 signature: c65748e8f1d88a46c227251500fc9252 ******/
		%feature("compactdefaultargs") InsertPoleAfter;
		%feature("autodoc", "
Parameters
----------
Index: int
P: gp_Pnt2d
Weight: double (optional, default to 1.0)

Return
-------
None

Description
-----------
The new pole is inserted after the pole of range Index. If the curve was non rational it can become rational. //! Raised if the B-spline is NonUniform or PiecewiseBezier or if Weight <= 0.0 Raised if Index is not in the range [1, Number of Poles].
") InsertPoleAfter;
		void InsertPoleAfter(const int Index, const gp_Pnt2d & P, const double Weight = 1.0);

		/****** Geom2d_BSplineCurve::InsertPoleBefore ******/
		/****** md5 signature: 0a641e255d3ce12a08614e6fb280f475 ******/
		%feature("compactdefaultargs") InsertPoleBefore;
		%feature("autodoc", "
Parameters
----------
Index: int
P: gp_Pnt2d
Weight: double (optional, default to 1.0)

Return
-------
None

Description
-----------
The new pole is inserted before the pole of range Index. If the curve was non rational it can become rational. //! Raised if the B-spline is NonUniform or PiecewiseBezier or if Weight <= 0.0 Raised if Index is not in the range [1, Number of Poles].
") InsertPoleBefore;
		void InsertPoleBefore(const int Index, const gp_Pnt2d & P, const double Weight = 1.0);

		/****** Geom2d_BSplineCurve::IsCN ******/
		/****** md5 signature: 42a5bf57a05eb6426c49586172f0db7e ******/
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
Returns true if the degree of continuity of this BSpline curve is at least N. A BSpline curve is at least GeomAbs_C0. Exceptions Standard_RangeError if N is negative.
") IsCN;
		bool IsCN(const int N);

		/****** Geom2d_BSplineCurve::IsClosed ******/
		/****** md5 signature: ad3909cb34dcb95a599222e5d4a64ef8 ******/
		%feature("compactdefaultargs") IsClosed;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if the distance between the first point and the last point of the curve is lower or equal to Resolution from package gp. Warnings: The first and the last point can be different from the first pole and the last pole of the curve.
") IsClosed;
		bool IsClosed();

		/****** Geom2d_BSplineCurve::IsG1 ******/
		/****** md5 signature: 3a7232666f5251e8a91b74bc6f689780 ******/
		%feature("compactdefaultargs") IsG1;
		%feature("autodoc", "
Parameters
----------
theTf: double
theTl: double
theAngTol: double

Return
-------
bool

Description
-----------
Check if curve has at least G1 continuity in interval [theTf, theTl] Returns true if IsCN(1) or angle between 'left' and 'right' first derivatives at knots with C0 continuity is less then theAngTol only knots in interval [theTf, theTl] is checked.
") IsG1;
		bool IsG1(const double theTf, const double theTl, const double theAngTol);

		/****** Geom2d_BSplineCurve::IsPeriodic ******/
		/****** md5 signature: 04e54c03a031850aca5f08a3025c1d5a ******/
		%feature("compactdefaultargs") IsPeriodic;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if the curve is periodic.
") IsPeriodic;
		bool IsPeriodic();

		/****** Geom2d_BSplineCurve::IsRational ******/
		/****** md5 signature: 2d134f58b1ac19806ba32cb72ce44772 ******/
		%feature("compactdefaultargs") IsRational;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if the weights are not identical. The tolerance criterion is Epsilon of the class Real.
") IsRational;
		bool IsRational();

		/****** Geom2d_BSplineCurve::Knot ******/
		/****** md5 signature: 1f8adaf53c02059612473e2f4f2e5b01 ******/
		%feature("compactdefaultargs") Knot;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
double

Description
-----------
Returns the knot of range Index. When there is a knot with a multiplicity greater than 1 the knot is not repeated. The method Multiplicity can be used to get the multiplicity of the Knot. Raised if Index < 1 or Index > NbKnots.
") Knot;
		double Knot(const int Index);

		/****** Geom2d_BSplineCurve::KnotDistribution ******/
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

		/****** Geom2d_BSplineCurve::KnotSequence ******/
		/****** md5 signature: 1b7301fa6b31d7a4f5ea6086e2fd0bec ******/
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
No available documentation.
") KnotSequence;
		void KnotSequence(TColStd_Array1OfReal & K);

		/****** Geom2d_BSplineCurve::KnotSequence ******/
		/****** md5 signature: 13e41dae8bd546a82617e7927f39c7c2 ******/
		%feature("compactdefaultargs") KnotSequence;
		%feature("autodoc", "Return
-------
TColStd_Array1OfReal

Description
-----------
Returns the knots sequence. In this sequence the knots with a multiplicity greater than 1 are repeated. Example: K = {k1, k1, k1, k2, k3, k3, k4, k4, k4}.
") KnotSequence;
		const TColStd_Array1OfReal & KnotSequence();

		/****** Geom2d_BSplineCurve::Knots ******/
		/****** md5 signature: 28e846af74f6d8e9d9bca42676b511f9 ******/
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
No available documentation.
") Knots;
		void Knots(TColStd_Array1OfReal & K);

		/****** Geom2d_BSplineCurve::Knots ******/
		/****** md5 signature: 40e5d7863b64333908f7ebce7f29fffe ******/
		%feature("compactdefaultargs") Knots;
		%feature("autodoc", "Return
-------
TColStd_Array1OfReal

Description
-----------
returns the knot values of the B-spline curve;.
") Knots;
		const TColStd_Array1OfReal & Knots();

		/****** Geom2d_BSplineCurve::LastParameter ******/
		/****** md5 signature: e183aab1f162396963682ac01a945da8 ******/
		%feature("compactdefaultargs") LastParameter;
		%feature("autodoc", "Return
-------
double

Description
-----------
Computes the parametric value of the end point of the curve. It is a knot value.
") LastParameter;
		double LastParameter();

		/****** Geom2d_BSplineCurve::LastUKnotIndex ******/
		/****** md5 signature: fdb1b3a0341af13d2cac11b5f8f49486 ******/
		%feature("compactdefaultargs") LastUKnotIndex;
		%feature("autodoc", "Return
-------
int

Description
-----------
For a BSpline curve the last parameter (which gives the end point of the curve) is a knot value but if the multiplicity of the last knot index is lower than Degree + 1 it is not the last knot of the curve. This method computes the index of the knot corresponding to the last parameter.
") LastUKnotIndex;
		int LastUKnotIndex();

		/****** Geom2d_BSplineCurve::LocalD0 ******/
		/****** md5 signature: 00f272de86db425ca370dbbf3d4f739a ******/
		%feature("compactdefaultargs") LocalD0;
		%feature("autodoc", "
Parameters
----------
U: double
FromK1: int
ToK2: int
P: gp_Pnt2d

Return
-------
None

Description
-----------
Raised if FromK1 = ToK2.
") LocalD0;
		void LocalD0(const double U, const int FromK1, const int ToK2, gp_Pnt2d & P);

		/****** Geom2d_BSplineCurve::LocalD1 ******/
		/****** md5 signature: 96d538dc398e676192d35255e2793619 ******/
		%feature("compactdefaultargs") LocalD1;
		%feature("autodoc", "
Parameters
----------
U: double
FromK1: int
ToK2: int
P: gp_Pnt2d
V1: gp_Vec2d

Return
-------
None

Description
-----------
Raised if the local continuity of the curve is not C1 between the knot K1 and the knot K2. Raised if FromK1 = ToK2.
") LocalD1;
		void LocalD1(const double U, const int FromK1, const int ToK2, gp_Pnt2d & P, gp_Vec2d & V1);

		/****** Geom2d_BSplineCurve::LocalD2 ******/
		/****** md5 signature: 36ece1045dd9b8cea33573cf8140573b ******/
		%feature("compactdefaultargs") LocalD2;
		%feature("autodoc", "
Parameters
----------
U: double
FromK1: int
ToK2: int
P: gp_Pnt2d
V1: gp_Vec2d
V2: gp_Vec2d

Return
-------
None

Description
-----------
Raised if the local continuity of the curve is not C2 between the knot K1 and the knot K2. Raised if FromK1 = ToK2.
") LocalD2;
		void LocalD2(const double U, const int FromK1, const int ToK2, gp_Pnt2d & P, gp_Vec2d & V1, gp_Vec2d & V2);

		/****** Geom2d_BSplineCurve::LocalD3 ******/
		/****** md5 signature: 917f31ef9beef40ea4cd48315494b48e ******/
		%feature("compactdefaultargs") LocalD3;
		%feature("autodoc", "
Parameters
----------
U: double
FromK1: int
ToK2: int
P: gp_Pnt2d
V1: gp_Vec2d
V2: gp_Vec2d
V3: gp_Vec2d

Return
-------
None

Description
-----------
Raised if the local continuity of the curve is not C3 between the knot K1 and the knot K2. Raised if FromK1 = ToK2.
") LocalD3;
		void LocalD3(const double U, const int FromK1, const int ToK2, gp_Pnt2d & P, gp_Vec2d & V1, gp_Vec2d & V2, gp_Vec2d & V3);

		/****** Geom2d_BSplineCurve::LocalDN ******/
		/****** md5 signature: 22e88421dc71533c8b9c51b86618d1b1 ******/
		%feature("compactdefaultargs") LocalDN;
		%feature("autodoc", "
Parameters
----------
U: double
FromK1: int
ToK2: int
N: int

Return
-------
gp_Vec2d

Description
-----------
Raised if the local continuity of the curve is not CN between the knot K1 and the knot K2. Raised if FromK1 = ToK2. Raised if N < 1.
") LocalDN;
		gp_Vec2d LocalDN(const double U, const int FromK1, const int ToK2, const int N);

		/****** Geom2d_BSplineCurve::LocalValue ******/
		/****** md5 signature: 2aca919f526d8b768e15cf467b2442aa ******/
		%feature("compactdefaultargs") LocalValue;
		%feature("autodoc", "
Parameters
----------
U: double
FromK1: int
ToK2: int

Return
-------
gp_Pnt2d

Description
-----------
Raised if FromK1 = ToK2.
") LocalValue;
		gp_Pnt2d LocalValue(const double U, const int FromK1, const int ToK2);

		/****** Geom2d_BSplineCurve::LocateU ******/
		/****** md5 signature: 1cd251285614aa4c353c1e6f8a41242d ******/
		%feature("compactdefaultargs") LocateU;
		%feature("autodoc", "
Parameters
----------
U: double
ParametricTolerance: double
WithKnotRepetition: bool (optional, default to false)

Return
-------
I1: int
I2: int

Description
-----------
Locates the parametric value U in the sequence of knots. If 'WithKnotRepetition' is True we consider the knot's representation with repetition of multiple knot value, otherwise we consider the knot's representation with no repetition of multiple knot values. Knots (I1) <= U <= Knots (I2) . if I1 = I2 U is a knot value (the tolerance criterion ParametricTolerance is used). . if I1 < 1 => U < Knots (1) - std::abs(ParametricTolerance) . if I2 > NbKnots => U > Knots (NbKnots) + std::abs(ParametricTolerance).
") LocateU;
		void LocateU(const double U, const double ParametricTolerance, Standard_Integer &OutValue, Standard_Integer &OutValue, const bool WithKnotRepetition = false);

		/****** Geom2d_BSplineCurve::MaxDegree ******/
		/****** md5 signature: c1d162018b4c908f3a00335cd079a0ea ******/
		%feature("compactdefaultargs") MaxDegree;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the value of the maximum degree of the normalized B-spline basis functions in this package.
") MaxDegree;
		static int MaxDegree();

		/****** Geom2d_BSplineCurve::MovePoint ******/
		/****** md5 signature: b7ccc09f53938d96932c9b4576b7abc6 ******/
		%feature("compactdefaultargs") MovePoint;
		%feature("autodoc", "
Parameters
----------
U: double
P: gp_Pnt2d
Index1: int
Index2: int

Return
-------
FirstModifiedPole: int
LastModifiedPole: int

Description
-----------
Moves the point of parameter U of this BSpline curve to P. Index1 and Index2 are the indexes in the table of poles of this BSpline curve of the first and last poles designated to be moved. FirstModifiedPole and LastModifiedPole are the indexes of the first and last poles, which are effectively modified. In the event of incompatibility between Index1, Index2 and the value U: - no change is made to this BSpline curve, and - the FirstModifiedPole and LastModifiedPole are returned null. Exceptions Standard_OutOfRange if: - Index1 is greater than or equal to Index2, or - Index1 or Index2 is less than 1 or greater than the number of poles of this BSpline curve.
") MovePoint;
		void MovePoint(const double U, const gp_Pnt2d & P, const int Index1, const int Index2, Standard_Integer &OutValue, Standard_Integer &OutValue);

		/****** Geom2d_BSplineCurve::MovePointAndTangent ******/
		/****** md5 signature: 9656b9ce829d6228d6ebafc9312d75ba ******/
		%feature("compactdefaultargs") MovePointAndTangent;
		%feature("autodoc", "
Parameters
----------
U: double
P: gp_Pnt2d
Tangent: gp_Vec2d
Tolerance: double
StartingCondition: int
EndingCondition: int

Return
-------
ErrorStatus: int

Description
-----------
Move a point with parameter U to P. and makes it tangent at U be Tangent. StartingCondition = -1 means first can move EndingCondition = -1 means last point can move StartingCondition = 0 means the first point cannot move EndingCondition = 0 means the last point cannot move StartingCondition = 1 means the first point and tangent cannot move EndingCondition = 1 means the last point and tangent cannot move and so forth ErrorStatus != 0 means that there are not enough degree of freedom with the constrain to deform the curve accordingly.
") MovePointAndTangent;
		void MovePointAndTangent(const double U, const gp_Pnt2d & P, const gp_Vec2d & Tangent, const double Tolerance, const int StartingCondition, const int EndingCondition, Standard_Integer &OutValue);

		/****** Geom2d_BSplineCurve::Multiplicities ******/
		/****** md5 signature: 1415188431c1974d7791a9ca90b50607 ******/
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
No available documentation.
") Multiplicities;
		void Multiplicities(TColStd_Array1OfInteger & M);

		/****** Geom2d_BSplineCurve::Multiplicities ******/
		/****** md5 signature: abbd7cb742db6e8534100ea895e298c9 ******/
		%feature("compactdefaultargs") Multiplicities;
		%feature("autodoc", "Return
-------
TColStd_Array1OfInteger

Description
-----------
returns the multiplicity of the knots of the curve.
") Multiplicities;
		const TColStd_Array1OfInteger & Multiplicities();

		/****** Geom2d_BSplineCurve::Multiplicity ******/
		/****** md5 signature: 6deea6eef255db56cfdeb88488a383cc ******/
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
		int Multiplicity(const int Index);

		/****** Geom2d_BSplineCurve::NbKnots ******/
		/****** md5 signature: 1d7f6bb61170b57fc8534832d22fab99 ******/
		%feature("compactdefaultargs") NbKnots;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of knots. This method returns the number of knot without repetition of multiple knots.
") NbKnots;
		int NbKnots();

		/****** Geom2d_BSplineCurve::NbPoles ******/
		/****** md5 signature: ec44b31f908a8be9d45ab84543b6e8d5 ******/
		%feature("compactdefaultargs") NbPoles;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of poles.
") NbPoles;
		int NbPoles();

		/****** Geom2d_BSplineCurve::PeriodicNormalization ******/
		/****** md5 signature: 561cf2a1584a7411ebe6b9b581602ad1 ******/
		%feature("compactdefaultargs") PeriodicNormalization;
		%feature("autodoc", "
Parameters
----------

Return
-------
U: double

Description
-----------
Computes the parameter normalized within the 'first' period of this BSpline curve, if it is periodic: the returned value is in the range Param1 and Param1 + Period, where: - Param1 is the 'first parameter', and - Period the period of this BSpline curve. Note: If this curve is not periodic, U is not modified.
") PeriodicNormalization;
		void PeriodicNormalization(Standard_Real &OutValue);

		/****** Geom2d_BSplineCurve::Pole ******/
		/****** md5 signature: 231a4812d67e2e5448043779c37beded ******/
		%feature("compactdefaultargs") Pole;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
gp_Pnt2d

Description
-----------
Returns the pole of range Index. Raised if Index < 1 or Index > NbPoles.
") Pole;
		const gp_Pnt2d Pole(const int Index);

		/****** Geom2d_BSplineCurve::Poles ******/
		/****** md5 signature: 6dcc77dc5716c10d9775d45a61f4e1c5 ******/
		%feature("compactdefaultargs") Poles;
		%feature("autodoc", "
Parameters
----------
P: TColgp_Array1OfPnt2d

Return
-------
None

Description
-----------
No available documentation.
") Poles;
		void Poles(TColgp_Array1OfPnt2d & P);

		/****** Geom2d_BSplineCurve::Poles ******/
		/****** md5 signature: 8afae95fa5301d98d2ab229e2b82ae7d ******/
		%feature("compactdefaultargs") Poles;
		%feature("autodoc", "Return
-------
TColgp_Array1OfPnt2d

Description
-----------
Returns the poles of the B-spline curve;.
") Poles;
		const TColgp_Array1OfPnt2d & Poles();

		/****** Geom2d_BSplineCurve::RemoveKnot ******/
		/****** md5 signature: 54905b41bbca7519e1f70b87cdd71db9 ******/
		%feature("compactdefaultargs") RemoveKnot;
		%feature("autodoc", "
Parameters
----------
Index: int
M: int
Tolerance: double

Return
-------
bool

Description
-----------
Reduces the multiplicity of the knot of index Index to M. If M is equal to 0, the knot is removed. With a modification of this type, the array of poles is also modified. Two different algorithms are systematically used to compute the new poles of the curve. If, for each pole, the distance between the pole calculated using the first algorithm and the same pole calculated using the second algorithm, is less than Tolerance, this ensures that the curve is not modified by more than Tolerance. Under these conditions, true is returned; otherwise, false is returned. A low tolerance is used to prevent modification of the curve. A high tolerance is used to 'smooth' the curve. Exceptions Standard_OutOfRange if Index is outside the bounds of the knots table.
") RemoveKnot;
		bool RemoveKnot(const int Index, const int M, const double Tolerance);

		/****** Geom2d_BSplineCurve::RemovePole ******/
		/****** md5 signature: e5a8000c59dc6fb4e1e49bcebf40135a ******/
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
Removes the pole of range Index If the curve was rational it can become non rational. //! Raised if the B-spline is NonUniform or PiecewiseBezier. Raised if the number of poles of the B-spline curve is lower or equal to 2 before removing. Raised if Index is not in the range [1, Number of Poles].
") RemovePole;
		void RemovePole(const int Index);

		/****** Geom2d_BSplineCurve::Resolution ******/
		/****** md5 signature: 6614e17180e861066efc96bfbc17b2e8 ******/
		%feature("compactdefaultargs") Resolution;
		%feature("autodoc", "
Parameters
----------
ToleranceUV: double

Return
-------
UTolerance: double

Description
-----------
Computes for this BSpline curve the parametric tolerance UTolerance for a given tolerance Tolerance3D (relative to dimensions in the plane). If f(t) is the equation of this BSpline curve, UTolerance ensures that: | t1 - t0| < Utolerance ===> |f(t1) - f(t0)| < ToleranceUV.
") Resolution;
		void Resolution(const double ToleranceUV, Standard_Real &OutValue);

		/****** Geom2d_BSplineCurve::Reverse ******/
		/****** md5 signature: 3329d3f633fce7835a9f2ded949a6050 ******/
		%feature("compactdefaultargs") Reverse;
		%feature("autodoc", "Return
-------
None

Description
-----------
Reverses the orientation of this BSpline curve. As a result - the knots and poles tables are modified; - the start point of the initial curve becomes the end point of the reversed curve; - the end point of the initial curve becomes the start point of the reversed curve.
") Reverse;
		void Reverse();

		/****** Geom2d_BSplineCurve::ReversedParameter ******/
		/****** md5 signature: 27411d9c5403a777b5b7a63ba1bc2d4a ******/
		%feature("compactdefaultargs") ReversedParameter;
		%feature("autodoc", "
Parameters
----------
U: double

Return
-------
double

Description
-----------
Computes the parameter on the reversed curve for the point of parameter U on this BSpline curve. The returned value is: UFirst + ULast - U, where UFirst and ULast are the values of the first and last parameters of this BSpline curve.
") ReversedParameter;
		double ReversedParameter(const double U);

		/****** Geom2d_BSplineCurve::Segment ******/
		/****** md5 signature: d52b984932170ee91ebb3fe384e1f143 ******/
		%feature("compactdefaultargs") Segment;
		%feature("autodoc", "
Parameters
----------
U1: double
U2: double
theTolerance: double (optional, default to Precision::PConfusion())

Return
-------
None

Description
-----------
Modifies this BSpline curve by segmenting it between U1 and U2. Either of these values can be outside the bounds of the curve, but U2 must be greater than U1. All data structure tables of this BSpline curve are modified, but the knots located between U1 and U2 are retained. The degree of the curve is not modified. //! Parameter theTolerance defines the possible proximity of the segment boundaries and B-spline knots to treat them as equal. //! Warnings: Even if <self> is not closed it can become closed after the segmentation for example if U1 or U2 are out of the bounds of the curve <self> or if the curve makes loop. After the segmentation the length of a curve can be null. - The segmentation of a periodic curve over an interval corresponding to its period generates a non-periodic curve with equivalent geometry. Exceptions Standard_DomainError if U2 is less than U1. raises if U2 < U1. Standard_DomainError if U2 - U1 exceeds the period for periodic curves. i.e. ((U2 - U1) - Period) > Precision::PConfusion().
") Segment;
		void Segment(const double U1, const double U2, const double theTolerance = Precision::PConfusion());

		/****** Geom2d_BSplineCurve::SetEvalRepresentation ******/
		/****** md5 signature: 71cef6212c8b55d57a83bcf2966726c8 ******/
		%feature("compactdefaultargs") SetEvalRepresentation;
		%feature("autodoc", "
Parameters
----------
theDesc: Geom2dEval_RepCurveDesc::Base

Return
-------
None

Description
-----------
Sets a new evaluation representation. Validates descriptor data and ensures no circular references.
") SetEvalRepresentation;
		void SetEvalRepresentation(const opencascade::handle<Geom2dEval_RepCurveDesc::Base> & theDesc);

		/****** Geom2d_BSplineCurve::SetKnot ******/
		/****** md5 signature: 3671e77deddb12405c65a4fc2c4c7333 ******/
		%feature("compactdefaultargs") SetKnot;
		%feature("autodoc", "
Parameters
----------
Index: int
K: double

Return
-------
None

Description
-----------
Modifies this BSpline curve by assigning the value K to the knot of index Index in the knots table. This is a relatively local modification because K must be such that: Knots(Index - 1) < K < Knots(Index + 1) Exceptions Standard_ConstructionError if: - K is not such that: Knots(Index - 1) < K < Knots(Index + 1) - M is greater than the degree of this BSpline curve or lower than the previous multiplicity of knot of index Index in the knots table. Standard_OutOfRange if Index is outside the bounds of the knots table.
") SetKnot;
		void SetKnot(const int Index, const double K);

		/****** Geom2d_BSplineCurve::SetKnot ******/
		/****** md5 signature: 0de49b51f368a1d5ff63bf35be32f5b7 ******/
		%feature("compactdefaultargs") SetKnot;
		%feature("autodoc", "
Parameters
----------
Index: int
K: double
M: int

Return
-------
None

Description
-----------
Modifies this BSpline curve by assigning the value K to the knot of index Index in the knots table. This is a relatively local modification because K must be such that: Knots(Index - 1) < K < Knots(Index + 1) The second syntax allows you also to increase the multiplicity of the knot to M (but it is not possible to decrease the multiplicity of the knot with this function). Exceptions Standard_ConstructionError if: - K is not such that: Knots(Index - 1) < K < Knots(Index + 1) - M is greater than the degree of this BSpline curve or lower than the previous multiplicity of knot of index Index in the knots table. Standard_OutOfRange if Index is outside the bounds of the knots table.
") SetKnot;
		void SetKnot(const int Index, const double K, const int M);

		/****** Geom2d_BSplineCurve::SetKnots ******/
		/****** md5 signature: c76939d5e20553630d805de848e55d1d ******/
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

		/****** Geom2d_BSplineCurve::SetNotPeriodic ******/
		/****** md5 signature: ccfbd171d2b38df3531b77ecbc51dcae ******/
		%feature("compactdefaultargs") SetNotPeriodic;
		%feature("autodoc", "Return
-------
None

Description
-----------
Changes this BSpline curve into a non-periodic curve. If this curve is already non-periodic, it is not modified. Note that the poles and knots tables are modified. Warning If this curve is periodic, as the multiplicity of the first and last knots is not modified, and is not equal to Degree + 1, where Degree is the degree of this BSpline curve, the start and end points of the curve are not its first and last poles.
") SetNotPeriodic;
		void SetNotPeriodic();

		/****** Geom2d_BSplineCurve::SetOrigin ******/
		/****** md5 signature: a689352e8bf76c88d77419d37d16683c ******/
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
		void SetOrigin(const int Index);

		/****** Geom2d_BSplineCurve::SetPeriodic ******/
		/****** md5 signature: 3d498279f2dd83a2ab9aa88181da253f ******/
		%feature("compactdefaultargs") SetPeriodic;
		%feature("autodoc", "Return
-------
None

Description
-----------
Changes this BSpline curve into a periodic curve. To become periodic, the curve must first be closed. Next, the knot sequence must be periodic. For this, FirstUKnotIndex and LastUKnotIndex are used to compute I1 and I2, the indexes in the knots array of the knots corresponding to the first and last parameters of this BSpline curve. The period is therefore Knot(I2) - Knot(I1). Consequently, the knots and poles tables are modified. Exceptions Standard_ConstructionError if this BSpline curve is not closed.
") SetPeriodic;
		void SetPeriodic();

		/****** Geom2d_BSplineCurve::SetPole ******/
		/****** md5 signature: b8d081066cbf2144ae6f346b405d703b ******/
		%feature("compactdefaultargs") SetPole;
		%feature("autodoc", "
Parameters
----------
Index: int
P: gp_Pnt2d

Return
-------
None

Description
-----------
Modifies this BSpline curve by assigning P to the pole of index Index in the poles table. Exceptions Standard_OutOfRange if Index is outside the bounds of the poles table. Standard_ConstructionError if Weight is negative or null.
") SetPole;
		void SetPole(const int Index, const gp_Pnt2d & P);

		/****** Geom2d_BSplineCurve::SetPole ******/
		/****** md5 signature: c42a827323cfb9a0181b43d7eb79b18f ******/
		%feature("compactdefaultargs") SetPole;
		%feature("autodoc", "
Parameters
----------
Index: int
P: gp_Pnt2d
Weight: double

Return
-------
None

Description
-----------
Modifies this BSpline curve by assigning P to the pole of index Index in the poles table. The second syntax also allows you to modify the weight of the modified pole, which becomes Weight. In this case, if this BSpline curve is non-rational, it can become rational and vice versa. Exceptions Standard_OutOfRange if Index is outside the bounds of the poles table. Standard_ConstructionError if Weight is negative or null.
") SetPole;
		void SetPole(const int Index, const gp_Pnt2d & P, const double Weight);

		/****** Geom2d_BSplineCurve::SetWeight ******/
		/****** md5 signature: 070f4d4d27969cd02dc5548cbd61269b ******/
		%feature("compactdefaultargs") SetWeight;
		%feature("autodoc", "
Parameters
----------
Index: int
Weight: double

Return
-------
None

Description
-----------
Assigns the weight Weight to the pole of index Index of the poles table. If the curve was non rational it can become rational. If the curve was rational it can become non rational. Exceptions Standard_OutOfRange if Index is outside the bounds of the poles table. Standard_ConstructionError if Weight is negative or null.
") SetWeight;
		void SetWeight(const int Index, const double Weight);

		/****** Geom2d_BSplineCurve::StartPoint ******/
		/****** md5 signature: 4c8f62db2cdb046b55fb2302933a985f ******/
		%feature("compactdefaultargs") StartPoint;
		%feature("autodoc", "Return
-------
gp_Pnt2d

Description
-----------
Returns the start point of the curve. Warnings: This point is different from the first pole of the curve if the multiplicity of the first knot is lower than Degree.
") StartPoint;
		gp_Pnt2d StartPoint();

		/****** Geom2d_BSplineCurve::Transform ******/
		/****** md5 signature: f0c538f132ce05ee89ade1eb503968b4 ******/
		%feature("compactdefaultargs") Transform;
		%feature("autodoc", "
Parameters
----------
T: gp_Trsf2d

Return
-------
None

Description
-----------
Applies the transformation T to this BSpline curve.
") Transform;
		void Transform(const gp_Trsf2d & T);

		/****** Geom2d_BSplineCurve::Weight ******/
		/****** md5 signature: 4e490ff1aecfd614d673f3411c64fe0f ******/
		%feature("compactdefaultargs") Weight;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
double

Description
-----------
Returns the weight of the pole of range Index . Raised if Index < 1 or Index > NbPoles.
") Weight;
		double Weight(const int Index);

		/****** Geom2d_BSplineCurve::Weights ******/
		/****** md5 signature: 75a527ca0732a5a4c79c4c170bad065d ******/
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
No available documentation.
") Weights;
		void Weights(TColStd_Array1OfReal & W);

		/****** Geom2d_BSplineCurve::Weights ******/
		/****** md5 signature: b577b4e8ac6293b0a90c61644b9e289c ******/
		%feature("compactdefaultargs") Weights;
		%feature("autodoc", "Return
-------
TColStd_Array1OfReal *

Description
-----------
Returns the weights of the B-spline curve;.
") Weights;
		const TColStd_Array1OfReal * Weights();

		/****** Geom2d_BSplineCurve::WeightsArray ******/
		/****** md5 signature: 11d54b7f26ac2ed2bce7e0eb76165f25 ******/
		%feature("compactdefaultargs") WeightsArray;
		%feature("autodoc", "Return
-------
TColStd_Array1OfReal

Description
-----------
Returns a const reference to the weights array. For rational curves: the internal owning weights array. For non-rational curves: a non-owning view of unit weights from BSplCLib. The array is always sized to match NbPoles(). @warning Do NOT modify elements through the returned reference.
") WeightsArray;
		const TColStd_Array1OfReal & WeightsArray();

};


%make_alias(Geom2d_BSplineCurve)

%extend Geom2d_BSplineCurve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************
* class Geom2d_BezierCurve *
***************************/
class Geom2d_BezierCurve : public Geom2d_BoundedCurve {
	public:
		/****** Geom2d_BezierCurve::Geom2d_BezierCurve ******/
		/****** md5 signature: c0c190bee6509b4e6f6e1b785248ae7b ******/
		%feature("compactdefaultargs") Geom2d_BezierCurve;
		%feature("autodoc", "
Parameters
----------
CurvePoles: TColgp_Array1OfPnt2d

Return
-------
None

Description
-----------
Creates a non rational Bezier curve with a set of poles: CurvePoles. The weights are defaulted to all being 1. Raises ConstructionError if the number of poles is greater than MaxDegree + 1 or lower than 2.
") Geom2d_BezierCurve;
		 Geom2d_BezierCurve(const TColgp_Array1OfPnt2d & CurvePoles);

		/****** Geom2d_BezierCurve::Geom2d_BezierCurve ******/
		/****** md5 signature: c17bd89b64a0584c968f10a39e8ef84b ******/
		%feature("compactdefaultargs") Geom2d_BezierCurve;
		%feature("autodoc", "
Parameters
----------
CurvePoles: TColgp_Array1OfPnt2d
PoleWeights: TColStd_Array1OfReal

Return
-------
None

Description
-----------
Creates a rational Bezier curve with the set of poles CurvePoles and the set of weights PoleWeights. If all the weights are identical the curve is considered as non rational. Raises ConstructionError if the number of poles is greater than MaxDegree + 1 or lower than 2 or CurvePoles and CurveWeights have not the same length or one weight value is lower or equal to Resolution from package gp.
") Geom2d_BezierCurve;
		 Geom2d_BezierCurve(const TColgp_Array1OfPnt2d & CurvePoles, const TColStd_Array1OfReal & PoleWeights);

		/****** Geom2d_BezierCurve::Geom2d_BezierCurve ******/
		/****** md5 signature: f04ed35050ae3ffb2c3a6524fe7b0256 ******/
		%feature("compactdefaultargs") Geom2d_BezierCurve;
		%feature("autodoc", "
Parameters
----------
theOther: Geom2d_BezierCurve

Return
-------
None

Description
-----------
Copy constructor for optimized copying without validation.
") Geom2d_BezierCurve;
		 Geom2d_BezierCurve(const Geom2d_BezierCurve & theOther);

		/****** Geom2d_BezierCurve::ClearEvalRepresentation ******/
		/****** md5 signature: 5c78bc9d081436c816c3f8de3b3086a8 ******/
		%feature("compactdefaultargs") ClearEvalRepresentation;
		%feature("autodoc", "Return
-------
None

Description
-----------
Removes the evaluation representation.
") ClearEvalRepresentation;
		void ClearEvalRepresentation();

		/****** Geom2d_BezierCurve::Continuity ******/
		/****** md5 signature: 3913f24bd9959795c7debf7fdd9fbb85 ******/
		%feature("compactdefaultargs") Continuity;
		%feature("autodoc", "Return
-------
GeomAbs_Shape

Description
-----------
Returns GeomAbs_CN, which is the continuity of any Bezier curve.
") Continuity;
		GeomAbs_Shape Continuity();

		/****** Geom2d_BezierCurve::Copy ******/
		/****** md5 signature: 74978107abfe60e7556292524128d117 ******/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom2d_Geometry>

Description
-----------
Creates a new object which is a copy of this Bezier curve.
") Copy;
		opencascade::handle<Geom2d_Geometry> Copy();

		/****** Geom2d_BezierCurve::Degree ******/
		/****** md5 signature: 41ab768385e3189d3d3bc517c9606dbb ******/
		%feature("compactdefaultargs") Degree;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the polynomial degree of the curve. It is the number of poles less one. In this package the Degree of a Bezier curve cannot be greater than 'MaxDegree'.
") Degree;
		int Degree();


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
		/****** Geom2d_BezierCurve::EndPoint ******/
		/****** md5 signature: 46b1d7929694ea99d1f1a364c0266b97 ******/
		%feature("compactdefaultargs") EndPoint;
		%feature("autodoc", "Return
-------
gp_Pnt2d

Description
-----------
Returns the end point or start point of this Bezier curve.
") EndPoint;
		gp_Pnt2d EndPoint();

		/****** Geom2d_BezierCurve::EvalD0 ******/
		/****** md5 signature: c8a189e7ecec0f3816c2e727cd23497e ******/
		%feature("compactdefaultargs") EvalD0;
		%feature("autodoc", "
Parameters
----------
U: double

Return
-------
gp_Pnt2d

Description
-----------
No available documentation.
") EvalD0;
		gp_Pnt2d EvalD0(const double U);

		/****** Geom2d_BezierCurve::EvalD1 ******/
		/****** md5 signature: 462ecd6034b2afa120bdac346ba132d5 ******/
		%feature("compactdefaultargs") EvalD1;
		%feature("autodoc", "
Parameters
----------
U: double

Return
-------
Geom2d_Curve::ResD1

Description
-----------
No available documentation.
") EvalD1;
		Geom2d_Curve::ResD1 EvalD1(const double U);

		/****** Geom2d_BezierCurve::EvalD2 ******/
		/****** md5 signature: 195e2415ae9d3e0cc993940e201783d4 ******/
		%feature("compactdefaultargs") EvalD2;
		%feature("autodoc", "
Parameters
----------
U: double

Return
-------
Geom2d_Curve::ResD2

Description
-----------
No available documentation.
") EvalD2;
		Geom2d_Curve::ResD2 EvalD2(const double U);

		/****** Geom2d_BezierCurve::EvalD3 ******/
		/****** md5 signature: d77ee3aa017f69682a733367b913cdf5 ******/
		%feature("compactdefaultargs") EvalD3;
		%feature("autodoc", "
Parameters
----------
U: double

Return
-------
Geom2d_Curve::ResD3

Description
-----------
No available documentation.
") EvalD3;
		Geom2d_Curve::ResD3 EvalD3(const double U);

		/****** Geom2d_BezierCurve::EvalDN ******/
		/****** md5 signature: 01a8d56d875f517809d0d195f9d25048 ******/
		%feature("compactdefaultargs") EvalDN;
		%feature("autodoc", "
Parameters
----------
U: double
N: int

Return
-------
gp_Vec2d

Description
-----------
For this Bezier curve, computes - the point P of parameter U, or - the point P and one or more of the following values: - V1, the first derivative vector, - V2, the second derivative vector, - V3, the third derivative vector. Note: the parameter U can be outside the bounds of the curve. Raises RangeError if N < 1.
") EvalDN;
		gp_Vec2d EvalDN(const double U, const int N);

		/****** Geom2d_BezierCurve::EvalRepresentation ******/
		/****** md5 signature: 79008f0c02d59fb82e2c23399f4e977c ******/
		%feature("compactdefaultargs") EvalRepresentation;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom2dEval_RepCurveDesc::Base>

Description
-----------
Returns the current evaluation representation descriptor (may be null).
") EvalRepresentation;
		const opencascade::handle<Geom2dEval_RepCurveDesc::Base> & EvalRepresentation();

		/****** Geom2d_BezierCurve::FirstParameter ******/
		/****** md5 signature: c178e87663f41d496599eac833971a1b ******/
		%feature("compactdefaultargs") FirstParameter;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns the value of the first parameter of this Bezier curve. This is 0.0, which gives the start point of this Bezier curve.
") FirstParameter;
		double FirstParameter();

		/****** Geom2d_BezierCurve::HasEvalRepresentation ******/
		/****** md5 signature: 4c7fcc1bfd1528c32230ca532f41f437 ******/
		%feature("compactdefaultargs") HasEvalRepresentation;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if an evaluation representation is attached.
") HasEvalRepresentation;
		bool HasEvalRepresentation();

		/****** Geom2d_BezierCurve::Increase ******/
		/****** md5 signature: 42a99bf63923cac198244f0a91eaa25c ******/
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
Increases the degree of a bezier curve. Degree is the new degree of <self>. raises ConstructionError if Degree is greater than MaxDegree or lower than 2 or lower than the initial degree of <self>.
") Increase;
		void Increase(const int Degree);

		/****** Geom2d_BezierCurve::InsertPoleAfter ******/
		/****** md5 signature: c65748e8f1d88a46c227251500fc9252 ******/
		%feature("compactdefaultargs") InsertPoleAfter;
		%feature("autodoc", "
Parameters
----------
Index: int
P: gp_Pnt2d
Weight: double (optional, default to 1.0)

Return
-------
None

Description
-----------
Inserts a pole with its weight in the set of poles after the pole of range Index. If the curve was non rational it can become rational if all the weights are not identical. Raised if Index is not in the range [0, NbPoles] //! Raised if the resulting number of poles is greater than MaxDegree + 1.
") InsertPoleAfter;
		void InsertPoleAfter(const int Index, const gp_Pnt2d & P, const double Weight = 1.0);

		/****** Geom2d_BezierCurve::InsertPoleBefore ******/
		/****** md5 signature: 0a641e255d3ce12a08614e6fb280f475 ******/
		%feature("compactdefaultargs") InsertPoleBefore;
		%feature("autodoc", "
Parameters
----------
Index: int
P: gp_Pnt2d
Weight: double (optional, default to 1.0)

Return
-------
None

Description
-----------
Inserts a pole with its weight in the set of poles after the pole of range Index. If the curve was non rational it can become rational if all the weights are not identical. Raised if Index is not in the range [1, NbPoles+1] //! Raised if the resulting number of poles is greater than MaxDegree + 1.
") InsertPoleBefore;
		void InsertPoleBefore(const int Index, const gp_Pnt2d & P, const double Weight = 1.0);

		/****** Geom2d_BezierCurve::IsCN ******/
		/****** md5 signature: 42a5bf57a05eb6426c49586172f0db7e ******/
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
		bool IsCN(const int N);

		/****** Geom2d_BezierCurve::IsClosed ******/
		/****** md5 signature: ad3909cb34dcb95a599222e5d4a64ef8 ******/
		%feature("compactdefaultargs") IsClosed;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if the distance between the first point and the last point of the curve is lower or equal to the Resolution from package gp.
") IsClosed;
		bool IsClosed();

		/****** Geom2d_BezierCurve::IsPeriodic ******/
		/****** md5 signature: 04e54c03a031850aca5f08a3025c1d5a ******/
		%feature("compactdefaultargs") IsPeriodic;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns False. A BezierCurve cannot be periodic in this package.
") IsPeriodic;
		bool IsPeriodic();

		/****** Geom2d_BezierCurve::IsRational ******/
		/****** md5 signature: 2d134f58b1ac19806ba32cb72ce44772 ******/
		%feature("compactdefaultargs") IsRational;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns false if all the weights are identical. The tolerance criterion is Resolution from package gp.
") IsRational;
		bool IsRational();

		/****** Geom2d_BezierCurve::KnotSequence ******/
		/****** md5 signature: 13e41dae8bd546a82617e7927f39c7c2 ******/
		%feature("compactdefaultargs") KnotSequence;
		%feature("autodoc", "Return
-------
TColStd_Array1OfReal

Description
-----------
Returns Bezier flat knots for the current degree.
") KnotSequence;
		const TColStd_Array1OfReal & KnotSequence();

		/****** Geom2d_BezierCurve::Knots ******/
		/****** md5 signature: 40e5d7863b64333908f7ebce7f29fffe ******/
		%feature("compactdefaultargs") Knots;
		%feature("autodoc", "Return
-------
TColStd_Array1OfReal

Description
-----------
Returns Bezier knots {0.0, 1.0} as a static array.
") Knots;
		const TColStd_Array1OfReal & Knots();

		/****** Geom2d_BezierCurve::LastParameter ******/
		/****** md5 signature: e183aab1f162396963682ac01a945da8 ******/
		%feature("compactdefaultargs") LastParameter;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns the value of the last parameter of this Bezier curve. This is 1.0, which gives the end point of this Bezier curve.
") LastParameter;
		double LastParameter();

		/****** Geom2d_BezierCurve::MaxDegree ******/
		/****** md5 signature: c1d162018b4c908f3a00335cd079a0ea ******/
		%feature("compactdefaultargs") MaxDegree;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the value of the maximum polynomial degree of a BezierCurve. This value is 25.
") MaxDegree;
		static int MaxDegree();

		/****** Geom2d_BezierCurve::Multiplicities ******/
		/****** md5 signature: abbd7cb742db6e8534100ea895e298c9 ******/
		%feature("compactdefaultargs") Multiplicities;
		%feature("autodoc", "Return
-------
TColStd_Array1OfInteger

Description
-----------
Returns Bezier multiplicities for the current degree.
") Multiplicities;
		const TColStd_Array1OfInteger & Multiplicities();

		/****** Geom2d_BezierCurve::NbPoles ******/
		/****** md5 signature: ec44b31f908a8be9d45ab84543b6e8d5 ******/
		%feature("compactdefaultargs") NbPoles;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of poles for this Bezier curve.
") NbPoles;
		int NbPoles();

		/****** Geom2d_BezierCurve::Pole ******/
		/****** md5 signature: 231a4812d67e2e5448043779c37beded ******/
		%feature("compactdefaultargs") Pole;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
gp_Pnt2d

Description
-----------
Returns the pole of range Index. Raised if Index is not in the range [1, NbPoles].
") Pole;
		const gp_Pnt2d Pole(const int Index);

		/****** Geom2d_BezierCurve::Poles ******/
		/****** md5 signature: 6dcc77dc5716c10d9775d45a61f4e1c5 ******/
		%feature("compactdefaultargs") Poles;
		%feature("autodoc", "
Parameters
----------
P: TColgp_Array1OfPnt2d

Return
-------
None

Description
-----------
No available documentation.
") Poles;
		void Poles(TColgp_Array1OfPnt2d & P);

		/****** Geom2d_BezierCurve::Poles ******/
		/****** md5 signature: 2daa8afc5cd5ac7baf6da5f8d481a385 ******/
		%feature("compactdefaultargs") Poles;
		%feature("autodoc", "Return
-------
TColgp_Array1OfPnt2d

Description
-----------
Returns all the poles of the curve.
") Poles;
		const TColgp_Array1OfPnt2d & Poles();

		/****** Geom2d_BezierCurve::RemovePole ******/
		/****** md5 signature: e5a8000c59dc6fb4e1e49bcebf40135a ******/
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
Removes the pole of range Index. If the curve was rational it can become non rational. Raised if Index is not in the range [1, NbPoles].
") RemovePole;
		void RemovePole(const int Index);

		/****** Geom2d_BezierCurve::Resolution ******/
		/****** md5 signature: 6614e17180e861066efc96bfbc17b2e8 ******/
		%feature("compactdefaultargs") Resolution;
		%feature("autodoc", "
Parameters
----------
ToleranceUV: double

Return
-------
UTolerance: double

Description
-----------
Computes for this Bezier curve the parametric tolerance UTolerance for a given tolerance Tolerance3D (relative to dimensions in the plane). If f(t) is the equation of this Bezier curve, UTolerance ensures that | t1 - t0| < Utolerance ===> |f(t1) - f(t0)| < ToleranceUV.
") Resolution;
		void Resolution(const double ToleranceUV, Standard_Real &OutValue);

		/****** Geom2d_BezierCurve::Reverse ******/
		/****** md5 signature: 3329d3f633fce7835a9f2ded949a6050 ******/
		%feature("compactdefaultargs") Reverse;
		%feature("autodoc", "Return
-------
None

Description
-----------
Reverses the direction of parametrization of <self> Value (NewU) = Value (1 - OldU).
") Reverse;
		void Reverse();

		/****** Geom2d_BezierCurve::ReversedParameter ******/
		/****** md5 signature: 27411d9c5403a777b5b7a63ba1bc2d4a ******/
		%feature("compactdefaultargs") ReversedParameter;
		%feature("autodoc", "
Parameters
----------
U: double

Return
-------
double

Description
-----------
Returns the parameter on the reversed curve for the point of parameter U on <self>. //! returns 1-U.
") ReversedParameter;
		double ReversedParameter(const double U);

		/****** Geom2d_BezierCurve::Segment ******/
		/****** md5 signature: 431d11e406cedb37e1fce1b029086d31 ******/
		%feature("compactdefaultargs") Segment;
		%feature("autodoc", "
Parameters
----------
U1: double
U2: double

Return
-------
None

Description
-----------
Segments the curve between U1 and U2 which can be out of the bounds of the curve. The curve is oriented from U1 to U2. The control points are modified, the first and the last point are not the same but the parametrization range is [0, 1] else it could not be a Bezier curve. Warnings: Even if <self> is not closed it can become closed after the segmentation for example if U1 or U2 are out of the bounds of the curve <self> or if the curve makes loop. After the segmentation the length of a curve can be null.
") Segment;
		void Segment(const double U1, const double U2);

		/****** Geom2d_BezierCurve::SetEvalRepresentation ******/
		/****** md5 signature: 71cef6212c8b55d57a83bcf2966726c8 ******/
		%feature("compactdefaultargs") SetEvalRepresentation;
		%feature("autodoc", "
Parameters
----------
theDesc: Geom2dEval_RepCurveDesc::Base

Return
-------
None

Description
-----------
Sets a new evaluation representation. Validates descriptor data and ensures no circular references.
") SetEvalRepresentation;
		void SetEvalRepresentation(const opencascade::handle<Geom2dEval_RepCurveDesc::Base> & theDesc);

		/****** Geom2d_BezierCurve::SetPole ******/
		/****** md5 signature: b8d081066cbf2144ae6f346b405d703b ******/
		%feature("compactdefaultargs") SetPole;
		%feature("autodoc", "
Parameters
----------
Index: int
P: gp_Pnt2d

Return
-------
None

Description
-----------
Substitutes the pole of range index with P. If the curve <self> is rational the weight of range Index is not modified. raiseD if Index is not in the range [1, NbPoles].
") SetPole;
		void SetPole(const int Index, const gp_Pnt2d & P);

		/****** Geom2d_BezierCurve::SetPole ******/
		/****** md5 signature: c42a827323cfb9a0181b43d7eb79b18f ******/
		%feature("compactdefaultargs") SetPole;
		%feature("autodoc", "
Parameters
----------
Index: int
P: gp_Pnt2d
Weight: double

Return
-------
None

Description
-----------
Substitutes the pole and the weights of range Index. If the curve <self> is not rational it can become rational if all the weights are not identical. If the curve was rational it can become non rational if all the weights are identical. Raised if Index is not in the range [1, NbPoles] Raised if Weight <= Resolution from package gp.
") SetPole;
		void SetPole(const int Index, const gp_Pnt2d & P, const double Weight);

		/****** Geom2d_BezierCurve::SetWeight ******/
		/****** md5 signature: 070f4d4d27969cd02dc5548cbd61269b ******/
		%feature("compactdefaultargs") SetWeight;
		%feature("autodoc", "
Parameters
----------
Index: int
Weight: double

Return
-------
None

Description
-----------
Changes the weight of the pole of range Index. If the curve <self> is not rational it can become rational if all the weights are not identical. If the curve was rational it can become non rational if all the weights are identical. Raised if Index is not in the range [1, NbPoles] Raised if Weight <= Resolution from package gp.
") SetWeight;
		void SetWeight(const int Index, const double Weight);

		/****** Geom2d_BezierCurve::StartPoint ******/
		/****** md5 signature: 4c8f62db2cdb046b55fb2302933a985f ******/
		%feature("compactdefaultargs") StartPoint;
		%feature("autodoc", "Return
-------
gp_Pnt2d

Description
-----------
Returns Value (U=1), it is the first control point of the curve.
") StartPoint;
		gp_Pnt2d StartPoint();

		/****** Geom2d_BezierCurve::Transform ******/
		/****** md5 signature: f0c538f132ce05ee89ade1eb503968b4 ******/
		%feature("compactdefaultargs") Transform;
		%feature("autodoc", "
Parameters
----------
T: gp_Trsf2d

Return
-------
None

Description
-----------
Applies the transformation T to this Bezier curve.
") Transform;
		void Transform(const gp_Trsf2d & T);

		/****** Geom2d_BezierCurve::Weight ******/
		/****** md5 signature: 4e490ff1aecfd614d673f3411c64fe0f ******/
		%feature("compactdefaultargs") Weight;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
double

Description
-----------
Returns the weight of range Index. Raised if Index is not in the range [1, NbPoles].
") Weight;
		double Weight(const int Index);

		/****** Geom2d_BezierCurve::Weights ******/
		/****** md5 signature: 75a527ca0732a5a4c79c4c170bad065d ******/
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
No available documentation.
") Weights;
		void Weights(TColStd_Array1OfReal & W);

		/****** Geom2d_BezierCurve::Weights ******/
		/****** md5 signature: d58e535c0e2f6d48057cd9bdc03d1788 ******/
		%feature("compactdefaultargs") Weights;
		%feature("autodoc", "Return
-------
TColStd_Array1OfReal *

Description
-----------
Returns all the weights of the curve.
") Weights;
		const TColStd_Array1OfReal * Weights();

		/****** Geom2d_BezierCurve::WeightsArray ******/
		/****** md5 signature: 11d54b7f26ac2ed2bce7e0eb76165f25 ******/
		%feature("compactdefaultargs") WeightsArray;
		%feature("autodoc", "Return
-------
TColStd_Array1OfReal

Description
-----------
Returns a const reference to the weights array. For rational curves: the internal owning weights array. For non-rational curves: a non-owning view of unit weights from BSplCLib. The array is always sized to match NbPoles(). @warning Do NOT modify elements through the returned reference.
") WeightsArray;
		const TColStd_Array1OfReal & WeightsArray();

};


%make_alias(Geom2d_BezierCurve)

%extend Geom2d_BezierCurve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************
* class Geom2d_Circle *
**********************/
class Geom2d_Circle : public Geom2d_Conic {
	public:
		/****** Geom2d_Circle::Geom2d_Circle ******/
		/****** md5 signature: 6022589d38b5b6ff091db5d9d03d3760 ******/
		%feature("compactdefaultargs") Geom2d_Circle;
		%feature("autodoc", "
Parameters
----------
C: gp_Circ2d

Return
-------
None

Description
-----------
Constructs a circle by conversion of the gp_Circ2d circle C.
") Geom2d_Circle;
		 Geom2d_Circle(const gp_Circ2d & C);

		/****** Geom2d_Circle::Geom2d_Circle ******/
		/****** md5 signature: 88fdb98aafcf7033a0e9194d35b3cae9 ******/
		%feature("compactdefaultargs") Geom2d_Circle;
		%feature("autodoc", "
Parameters
----------
A: gp_Ax2d
Radius: double
Sense: bool (optional, default to true)

Return
-------
None

Description
-----------
Constructs a circle of radius Radius, whose center is the origin of axis A; A is the 'X Axis' of the local coordinate system of the circle; this coordinate system is direct if Sense is true (default value) or indirect if Sense is false. Note: It is possible to create a circle where Radius is equal to 0.0. Exceptions Standard_ConstructionError if Radius is negative.
") Geom2d_Circle;
		 Geom2d_Circle(const gp_Ax2d & A, const double Radius, const bool Sense = true);

		/****** Geom2d_Circle::Geom2d_Circle ******/
		/****** md5 signature: 23c2a319f01530296d9dfa3c9a82c90d ******/
		%feature("compactdefaultargs") Geom2d_Circle;
		%feature("autodoc", "
Parameters
----------
A: gp_Ax22d
Radius: double

Return
-------
None

Description
-----------
Constructs a circle of radius Radius, where the coordinate system A locates the circle and defines its orientation in the plane such that: - the center of the circle is the origin of A, - the orientation (direct or indirect) of A gives the orientation of the circle.
") Geom2d_Circle;
		 Geom2d_Circle(const gp_Ax22d & A, const double Radius);

		/****** Geom2d_Circle::Circ2d ******/
		/****** md5 signature: 0bb74df9a406e7f4dc0a135d1a47fd6d ******/
		%feature("compactdefaultargs") Circ2d;
		%feature("autodoc", "Return
-------
gp_Circ2d

Description
-----------
Returns the non persistent circle from gp with the same geometric properties as <self>.
") Circ2d;
		gp_Circ2d Circ2d();

		/****** Geom2d_Circle::Copy ******/
		/****** md5 signature: 74978107abfe60e7556292524128d117 ******/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom2d_Geometry>

Description
-----------
Creates a new object which is a copy of this circle.
") Copy;
		opencascade::handle<Geom2d_Geometry> Copy();


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
		/****** Geom2d_Circle::Eccentricity ******/
		/****** md5 signature: 699f9e1f6116a4a04b89d43165f9b70c ******/
		%feature("compactdefaultargs") Eccentricity;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns 0., which is the eccentricity of any circle.
") Eccentricity;
		double Eccentricity();

		/****** Geom2d_Circle::EvalD0 ******/
		/****** md5 signature: c8a189e7ecec0f3816c2e727cd23497e ******/
		%feature("compactdefaultargs") EvalD0;
		%feature("autodoc", "
Parameters
----------
U: double

Return
-------
gp_Pnt2d

Description
-----------
Returns in P the point of parameter U. P = C + R * Cos (U) * XDir + R * Sin (U) * YDir where C is the center of the circle , XDir the XDirection and YDir the YDirection of the circle's local coordinate system.
") EvalD0;
		gp_Pnt2d EvalD0(const double U);

		/****** Geom2d_Circle::EvalD1 ******/
		/****** md5 signature: 462ecd6034b2afa120bdac346ba132d5 ******/
		%feature("compactdefaultargs") EvalD1;
		%feature("autodoc", "
Parameters
----------
U: double

Return
-------
Geom2d_Curve::ResD1

Description
-----------
Returns the point P of parameter U and the first derivative V1.
") EvalD1;
		Geom2d_Curve::ResD1 EvalD1(const double U);

		/****** Geom2d_Circle::EvalD2 ******/
		/****** md5 signature: 195e2415ae9d3e0cc993940e201783d4 ******/
		%feature("compactdefaultargs") EvalD2;
		%feature("autodoc", "
Parameters
----------
U: double

Return
-------
Geom2d_Curve::ResD2

Description
-----------
Returns the point P of parameter U, the first and second derivatives V1 and V2.
") EvalD2;
		Geom2d_Curve::ResD2 EvalD2(const double U);

		/****** Geom2d_Circle::EvalD3 ******/
		/****** md5 signature: d77ee3aa017f69682a733367b913cdf5 ******/
		%feature("compactdefaultargs") EvalD3;
		%feature("autodoc", "
Parameters
----------
U: double

Return
-------
Geom2d_Curve::ResD3

Description
-----------
Returns the point P of parameter u, the first second and third derivatives V1 V2 and V3.
") EvalD3;
		Geom2d_Curve::ResD3 EvalD3(const double U);

		/****** Geom2d_Circle::EvalDN ******/
		/****** md5 signature: 01a8d56d875f517809d0d195f9d25048 ******/
		%feature("compactdefaultargs") EvalDN;
		%feature("autodoc", "
Parameters
----------
U: double
N: int

Return
-------
gp_Vec2d

Description
-----------
For the point of parameter U of this circle, computes the vector corresponding to the Nth derivative. Exceptions: Standard_RangeError if N is less than 1.
") EvalDN;
		gp_Vec2d EvalDN(const double U, const int N);

		/****** Geom2d_Circle::FirstParameter ******/
		/****** md5 signature: c178e87663f41d496599eac833971a1b ******/
		%feature("compactdefaultargs") FirstParameter;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns 0.0.
") FirstParameter;
		double FirstParameter();

		/****** Geom2d_Circle::IsClosed ******/
		/****** md5 signature: ad3909cb34dcb95a599222e5d4a64ef8 ******/
		%feature("compactdefaultargs") IsClosed;
		%feature("autodoc", "Return
-------
bool

Description
-----------
returns True.
") IsClosed;
		bool IsClosed();

		/****** Geom2d_Circle::IsPeriodic ******/
		/****** md5 signature: 04e54c03a031850aca5f08a3025c1d5a ******/
		%feature("compactdefaultargs") IsPeriodic;
		%feature("autodoc", "Return
-------
bool

Description
-----------
returns True. The period of a circle is 2.*Pi.
") IsPeriodic;
		bool IsPeriodic();

		/****** Geom2d_Circle::LastParameter ******/
		/****** md5 signature: e183aab1f162396963682ac01a945da8 ******/
		%feature("compactdefaultargs") LastParameter;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns 2*PI.
") LastParameter;
		double LastParameter();

		/****** Geom2d_Circle::Radius ******/
		/****** md5 signature: 3f212b2355d53c03baacfd2fb8e2678a ******/
		%feature("compactdefaultargs") Radius;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns the radius of this circle.
") Radius;
		double Radius();

		/****** Geom2d_Circle::ReversedParameter ******/
		/****** md5 signature: 27411d9c5403a777b5b7a63ba1bc2d4a ******/
		%feature("compactdefaultargs") ReversedParameter;
		%feature("autodoc", "
Parameters
----------
U: double

Return
-------
double

Description
-----------
Computes the parameter on the reversed circle for the point of parameter U on this circle. For a circle, the returned value is: 2.*Pi - U.
") ReversedParameter;
		double ReversedParameter(const double U);

		/****** Geom2d_Circle::SetCirc2d ******/
		/****** md5 signature: 74dd850444d6bc87e568eef6a8a6fbcb ******/
		%feature("compactdefaultargs") SetCirc2d;
		%feature("autodoc", "
Parameters
----------
C: gp_Circ2d

Return
-------
None

Description
-----------
Converts the gp_Circ2d circle C into this circle.
") SetCirc2d;
		void SetCirc2d(const gp_Circ2d & C);

		/****** Geom2d_Circle::SetRadius ******/
		/****** md5 signature: 032449434c157a5943c66be20d1fafca ******/
		%feature("compactdefaultargs") SetRadius;
		%feature("autodoc", "
Parameters
----------
R: double

Return
-------
None

Description
-----------
No available documentation.
") SetRadius;
		void SetRadius(const double R);

		/****** Geom2d_Circle::Transform ******/
		/****** md5 signature: f0c538f132ce05ee89ade1eb503968b4 ******/
		%feature("compactdefaultargs") Transform;
		%feature("autodoc", "
Parameters
----------
T: gp_Trsf2d

Return
-------
None

Description
-----------
Applies the transformation T to this circle.
") Transform;
		void Transform(const gp_Trsf2d & T);

};


%make_alias(Geom2d_Circle)

%extend Geom2d_Circle {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************
* class Geom2d_Ellipse *
***********************/
class Geom2d_Ellipse : public Geom2d_Conic {
	public:
		/****** Geom2d_Ellipse::Geom2d_Ellipse ******/
		/****** md5 signature: b0fb699e6ae3c1e50bdb2f1ad25e29bc ******/
		%feature("compactdefaultargs") Geom2d_Ellipse;
		%feature("autodoc", "
Parameters
----------
E: gp_Elips2d

Return
-------
None

Description
-----------
Creates an ellipse by conversion of the gp_Elips2d ellipse E.
") Geom2d_Ellipse;
		 Geom2d_Ellipse(const gp_Elips2d & E);

		/****** Geom2d_Ellipse::Geom2d_Ellipse ******/
		/****** md5 signature: 6eabcc6b9a249e4b95698d2388b6de62 ******/
		%feature("compactdefaultargs") Geom2d_Ellipse;
		%feature("autodoc", "
Parameters
----------
MajorAxis: gp_Ax2d
MajorRadius: double
MinorRadius: double
Sense: bool (optional, default to true)

Return
-------
None

Description
-----------
Creates an ellipse defined by its major and minor radii, MajorRadius and MinorRadius, and positioned in the plane by its major axis MajorAxis; the center of the ellipse is the origin of MajorAxis and the unit vector of MajorAxis is the 'X Direction' of the local coordinate system of the ellipse; this coordinate system is direct if Sense is true (default value) or indirect if Sense is false. Warnings: It is not forbidden to create an ellipse with MajorRadius = MinorRadius. Exceptions Standard_ConstructionError if: - MajorRadius is less than MinorRadius, or - MinorRadius is less than 0.
") Geom2d_Ellipse;
		 Geom2d_Ellipse(const gp_Ax2d & MajorAxis, const double MajorRadius, const double MinorRadius, const bool Sense = true);

		/****** Geom2d_Ellipse::Geom2d_Ellipse ******/
		/****** md5 signature: 6e1d26ad17bdfcea3f3fdb0cac695362 ******/
		%feature("compactdefaultargs") Geom2d_Ellipse;
		%feature("autodoc", "
Parameters
----------
Axis: gp_Ax22d
MajorRadius: double
MinorRadius: double

Return
-------
None

Description
-----------
Creates an ellipse defined by its major and minor radii, MajorRadius and MinorRadius, where the coordinate system Axis locates the ellipse and defines its orientation in the plane such that: - the center of the ellipse is the origin of Axis, - the 'X Direction' of Axis defines the major axis of the ellipse, - the 'Y Direction' of Axis defines the minor axis of the ellipse, - the orientation of Axis (direct or indirect) gives the orientation of the ellipse. Warnings: It is not forbidden to create an ellipse with MajorRadius = MinorRadius. Exceptions Standard_ConstructionError if: - MajorRadius is less than MinorRadius, or - MinorRadius is less than 0.
") Geom2d_Ellipse;
		 Geom2d_Ellipse(const gp_Ax22d & Axis, const double MajorRadius, const double MinorRadius);

		/****** Geom2d_Ellipse::Copy ******/
		/****** md5 signature: 74978107abfe60e7556292524128d117 ******/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom2d_Geometry>

Description
-----------
Creates a new object which is a copy of this ellipse.
") Copy;
		opencascade::handle<Geom2d_Geometry> Copy();

		/****** Geom2d_Ellipse::Directrix1 ******/
		/****** md5 signature: fcbef2c85b670a856d4882ec13ce9c6f ******/
		%feature("compactdefaultargs") Directrix1;
		%feature("autodoc", "Return
-------
gp_Ax2d

Description
-----------
Computes the directrices of this ellipse. This directrix is the line normal to the XAxis of the ellipse in the local plane (Z = 0) at a distance d = MajorRadius / e from the center of the ellipse, where e is the eccentricity of the ellipse. This line is parallel to the 'YAxis'. The intersection point between directrix1 and the 'XAxis' is the 'Location' point of the directrix1. This point is on the positive side of the 'XAxis'. Raises ConstructionError if Eccentricity = 0.0. (The ellipse degenerates into a circle).
") Directrix1;
		gp_Ax2d Directrix1();

		/****** Geom2d_Ellipse::Directrix2 ******/
		/****** md5 signature: 6932241de7dde0eb204208e30fe6363c ******/
		%feature("compactdefaultargs") Directrix2;
		%feature("autodoc", "Return
-------
gp_Ax2d

Description
-----------
This line is obtained by the symmetrical transformation of 'Directrix1' with respect to the 'YAxis' of the ellipse. Raises ConstructionError if Eccentricity = 0.0. (The ellipse degenerates into a circle).
") Directrix2;
		gp_Ax2d Directrix2();


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
		/****** Geom2d_Ellipse::Eccentricity ******/
		/****** md5 signature: 699f9e1f6116a4a04b89d43165f9b70c ******/
		%feature("compactdefaultargs") Eccentricity;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns the eccentricity of the ellipse between 0.0 and 1.0 If f is the distance between the center of the ellipse and the Focus1 then the eccentricity e = f / MajorRadius. Returns 0 if MajorRadius = 0.
") Eccentricity;
		double Eccentricity();

		/****** Geom2d_Ellipse::Elips2d ******/
		/****** md5 signature: ecbf143cbc90feccf147fe03c443a520 ******/
		%feature("compactdefaultargs") Elips2d;
		%feature("autodoc", "Return
-------
gp_Elips2d

Description
-----------
Converts this ellipse into a gp_Elips2d ellipse.
") Elips2d;
		gp_Elips2d Elips2d();

		/****** Geom2d_Ellipse::EvalD0 ******/
		/****** md5 signature: c8a189e7ecec0f3816c2e727cd23497e ******/
		%feature("compactdefaultargs") EvalD0;
		%feature("autodoc", "
Parameters
----------
U: double

Return
-------
gp_Pnt2d

Description
-----------
Returns in P the point of parameter U. P = C + MajorRadius * Cos (U) * XDir + MinorRadius * Sin (U) * YDir where C is the center of the ellipse , XDir the direction of the 'XAxis' and 'YDir' the 'YAxis' of the ellipse.
") EvalD0;
		gp_Pnt2d EvalD0(const double U);

		/****** Geom2d_Ellipse::EvalD1 ******/
		/****** md5 signature: 462ecd6034b2afa120bdac346ba132d5 ******/
		%feature("compactdefaultargs") EvalD1;
		%feature("autodoc", "
Parameters
----------
U: double

Return
-------
Geom2d_Curve::ResD1

Description
-----------
No available documentation.
") EvalD1;
		Geom2d_Curve::ResD1 EvalD1(const double U);

		/****** Geom2d_Ellipse::EvalD2 ******/
		/****** md5 signature: 195e2415ae9d3e0cc993940e201783d4 ******/
		%feature("compactdefaultargs") EvalD2;
		%feature("autodoc", "
Parameters
----------
U: double

Return
-------
Geom2d_Curve::ResD2

Description
-----------
Returns the point P of parameter U. The vectors V1 and V2 are the first and second derivatives at this point.
") EvalD2;
		Geom2d_Curve::ResD2 EvalD2(const double U);

		/****** Geom2d_Ellipse::EvalD3 ******/
		/****** md5 signature: d77ee3aa017f69682a733367b913cdf5 ******/
		%feature("compactdefaultargs") EvalD3;
		%feature("autodoc", "
Parameters
----------
U: double

Return
-------
Geom2d_Curve::ResD3

Description
-----------
Returns the point P of parameter U, the first second and third derivatives V1 V2 and V3.
") EvalD3;
		Geom2d_Curve::ResD3 EvalD3(const double U);

		/****** Geom2d_Ellipse::EvalDN ******/
		/****** md5 signature: 01a8d56d875f517809d0d195f9d25048 ******/
		%feature("compactdefaultargs") EvalDN;
		%feature("autodoc", "
Parameters
----------
U: double
N: int

Return
-------
gp_Vec2d

Description
-----------
For the point of parameter U of this ellipse, computes the vector corresponding to the Nth derivative. Exceptions Standard_RangeError if N is less than 1.
") EvalDN;
		gp_Vec2d EvalDN(const double U, const int N);

		/****** Geom2d_Ellipse::FirstParameter ******/
		/****** md5 signature: c178e87663f41d496599eac833971a1b ******/
		%feature("compactdefaultargs") FirstParameter;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns the value of the first parameter of this ellipse. This is 0.0, which gives the start point of this ellipse. The start point and end point of an ellipse are coincident.
") FirstParameter;
		double FirstParameter();

		/****** Geom2d_Ellipse::Focal ******/
		/****** md5 signature: 3803e722169e3501b54b680807b4ccc1 ******/
		%feature("compactdefaultargs") Focal;
		%feature("autodoc", "Return
-------
double

Description
-----------
Computes the focal distance. The focal distance is the distance between the center and a focus of the ellipse.
") Focal;
		double Focal();

		/****** Geom2d_Ellipse::Focus1 ******/
		/****** md5 signature: dccbe483b29092eb91431c64e1c5bcd9 ******/
		%feature("compactdefaultargs") Focus1;
		%feature("autodoc", "Return
-------
gp_Pnt2d

Description
-----------
Returns the first focus of the ellipse. This focus is on the positive side of the 'XAxis' of the ellipse.
") Focus1;
		gp_Pnt2d Focus1();

		/****** Geom2d_Ellipse::Focus2 ******/
		/****** md5 signature: ca24694273a9069fddac1db8a37c6c68 ******/
		%feature("compactdefaultargs") Focus2;
		%feature("autodoc", "Return
-------
gp_Pnt2d

Description
-----------
Returns the second focus of the ellipse. This focus is on the negative side of the 'XAxis' of the ellipse.
") Focus2;
		gp_Pnt2d Focus2();

		/****** Geom2d_Ellipse::IsClosed ******/
		/****** md5 signature: ad3909cb34dcb95a599222e5d4a64ef8 ******/
		%feature("compactdefaultargs") IsClosed;
		%feature("autodoc", "Return
-------
bool

Description
-----------
return True.
") IsClosed;
		bool IsClosed();

		/****** Geom2d_Ellipse::IsPeriodic ******/
		/****** md5 signature: 04e54c03a031850aca5f08a3025c1d5a ******/
		%feature("compactdefaultargs") IsPeriodic;
		%feature("autodoc", "Return
-------
bool

Description
-----------
return True.
") IsPeriodic;
		bool IsPeriodic();

		/****** Geom2d_Ellipse::LastParameter ******/
		/****** md5 signature: e183aab1f162396963682ac01a945da8 ******/
		%feature("compactdefaultargs") LastParameter;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns the value of the last parameter of this ellipse. This is 2.*Pi, which gives the end point of this ellipse. The start point and end point of an ellipse are coincident.
") LastParameter;
		double LastParameter();

		/****** Geom2d_Ellipse::MajorRadius ******/
		/****** md5 signature: 0a2ccb3f2f96e1276e50fba8091d72cb ******/
		%feature("compactdefaultargs") MajorRadius;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns the major radius of this ellipse.
") MajorRadius;
		double MajorRadius();

		/****** Geom2d_Ellipse::MinorRadius ******/
		/****** md5 signature: 9e6683b74c7166396bffd8c50cf9899c ******/
		%feature("compactdefaultargs") MinorRadius;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns the minor radius of this ellipse.
") MinorRadius;
		double MinorRadius();

		/****** Geom2d_Ellipse::Parameter ******/
		/****** md5 signature: 28e42519a120bf741c23eca7aaca5525 ******/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "Return
-------
double

Description
-----------
Computes the parameter of this ellipse. This value is given by the formula p = (1 - e * e) * MajorRadius where e is the eccentricity of the ellipse. Returns 0 if MajorRadius = 0.
") Parameter;
		double Parameter();

		/****** Geom2d_Ellipse::ReversedParameter ******/
		/****** md5 signature: 27411d9c5403a777b5b7a63ba1bc2d4a ******/
		%feature("compactdefaultargs") ReversedParameter;
		%feature("autodoc", "
Parameters
----------
U: double

Return
-------
double

Description
-----------
Computes the parameter on the reversed ellipse for the point of parameter U on this ellipse. For an ellipse, the returned value is: 2.*Pi - U.
") ReversedParameter;
		double ReversedParameter(const double U);

		/****** Geom2d_Ellipse::SetElips2d ******/
		/****** md5 signature: e895d343c29146a497bb9b5472311179 ******/
		%feature("compactdefaultargs") SetElips2d;
		%feature("autodoc", "
Parameters
----------
E: gp_Elips2d

Return
-------
None

Description
-----------
Converts the gp_Elips2d ellipse E into this ellipse.
") SetElips2d;
		void SetElips2d(const gp_Elips2d & E);

		/****** Geom2d_Ellipse::SetMajorRadius ******/
		/****** md5 signature: d5b45898082f4683aba784db3a9427e2 ******/
		%feature("compactdefaultargs") SetMajorRadius;
		%feature("autodoc", "
Parameters
----------
MajorRadius: double

Return
-------
None

Description
-----------
Assigns a value to the major radius of this ellipse. Exceptions Standard_ConstructionError if: - the major radius of this ellipse becomes less than the minor radius, or - MinorRadius is less than 0.
") SetMajorRadius;
		void SetMajorRadius(const double MajorRadius);

		/****** Geom2d_Ellipse::SetMinorRadius ******/
		/****** md5 signature: 16bb9b548a4db78f0b246fb9bd8633c4 ******/
		%feature("compactdefaultargs") SetMinorRadius;
		%feature("autodoc", "
Parameters
----------
MinorRadius: double

Return
-------
None

Description
-----------
Assigns a value to the minor radius of this ellipse. Exceptions Standard_ConstructionError if: - the major radius of this ellipse becomes less than the minor radius, or - MinorRadius is less than 0.
") SetMinorRadius;
		void SetMinorRadius(const double MinorRadius);

		/****** Geom2d_Ellipse::Transform ******/
		/****** md5 signature: f0c538f132ce05ee89ade1eb503968b4 ******/
		%feature("compactdefaultargs") Transform;
		%feature("autodoc", "
Parameters
----------
T: gp_Trsf2d

Return
-------
None

Description
-----------
Applies the transformation T to this ellipse.
") Transform;
		void Transform(const gp_Trsf2d & T);

};


%make_alias(Geom2d_Ellipse)

%extend Geom2d_Ellipse {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************
* class Geom2d_Hyperbola *
*************************/
class Geom2d_Hyperbola : public Geom2d_Conic {
	public:
		/****** Geom2d_Hyperbola::Geom2d_Hyperbola ******/
		/****** md5 signature: c712e1ef84caffe5bca6b6776a8ec431 ******/
		%feature("compactdefaultargs") Geom2d_Hyperbola;
		%feature("autodoc", "
Parameters
----------
H: gp_Hypr2d

Return
-------
None

Description
-----------
Creates an Hyperbola from a non persistent one from package gp.
") Geom2d_Hyperbola;
		 Geom2d_Hyperbola(const gp_Hypr2d & H);

		/****** Geom2d_Hyperbola::Geom2d_Hyperbola ******/
		/****** md5 signature: d732a4015046f643eecbf2c0f9a2603c ******/
		%feature("compactdefaultargs") Geom2d_Hyperbola;
		%feature("autodoc", "
Parameters
----------
MajorAxis: gp_Ax2d
MajorRadius: double
MinorRadius: double
Sense: bool (optional, default to true)

Return
-------
None

Description
-----------
MajorAxis is the 'XAxis' of the hyperbola. The YAxis is in the direct sense if 'Sense' is True; The major radius of the hyperbola is on this 'XAxis' and the minor radius is on the 'YAxis' of the hyperbola. Raised if MajorRadius < 0.0 or if MinorRadius < 0.0.
") Geom2d_Hyperbola;
		 Geom2d_Hyperbola(const gp_Ax2d & MajorAxis, const double MajorRadius, const double MinorRadius, const bool Sense = true);

		/****** Geom2d_Hyperbola::Geom2d_Hyperbola ******/
		/****** md5 signature: 302e77e9d372c8be9c8635f4dd627a01 ******/
		%feature("compactdefaultargs") Geom2d_Hyperbola;
		%feature("autodoc", "
Parameters
----------
Axis: gp_Ax22d
MajorRadius: double
MinorRadius: double

Return
-------
None

Description
-----------
The XDirection of 'Axis' is the 'XAxis' of the hyperbola and the YDirection of 'Axis' is the 'YAxis'. The major radius of the hyperbola is on this 'XAxis' and the minor radius is on the 'YAxis' of the hyperbola. Raised if MajorRadius < 0.0 or if MinorRadius < 0.0.
") Geom2d_Hyperbola;
		 Geom2d_Hyperbola(const gp_Ax22d & Axis, const double MajorRadius, const double MinorRadius);

		/****** Geom2d_Hyperbola::Asymptote1 ******/
		/****** md5 signature: f7602d62af48fa687b9c94102a074f0b ******/
		%feature("compactdefaultargs") Asymptote1;
		%feature("autodoc", "Return
-------
gp_Ax2d

Description
-----------
In the local coordinate system of the hyperbola the equation of the hyperbola is (X*X)/(A*A) - (Y*Y)/(B*B) = 1.0 and the equation of the first asymptote is Y = (B/A)*X where A is the major radius of the hyperbola and B is the minor radius of the hyperbola. Raised if MajorRadius = 0.0.
") Asymptote1;
		gp_Ax2d Asymptote1();

		/****** Geom2d_Hyperbola::Asymptote2 ******/
		/****** md5 signature: ae762c76c64b4be67fd988e980bd70ef ******/
		%feature("compactdefaultargs") Asymptote2;
		%feature("autodoc", "Return
-------
gp_Ax2d

Description
-----------
In the local coordinate system of the hyperbola the equation of the hyperbola is (X*X)/(A*A) - (Y*Y)/(B*B) = 1.0 and the equation of the first asymptote is Y = -(B/A)*X. where A is the major radius of the hyperbola and B is the minor radius of the hyperbola. raised if MajorRadius = 0.0.
") Asymptote2;
		gp_Ax2d Asymptote2();

		/****** Geom2d_Hyperbola::ConjugateBranch1 ******/
		/****** md5 signature: 64c762dbacf1b9b583f85bbe39250178 ******/
		%feature("compactdefaultargs") ConjugateBranch1;
		%feature("autodoc", "Return
-------
gp_Hypr2d

Description
-----------
Computes the first conjugate branch relative to this hyperbola. Note: The diagram given under the class purpose indicates where these two branches of hyperbola are positioned in relation to this branch of hyperbola.
") ConjugateBranch1;
		gp_Hypr2d ConjugateBranch1();

		/****** Geom2d_Hyperbola::ConjugateBranch2 ******/
		/****** md5 signature: b4fca477a92cf56be479876d60440a0d ******/
		%feature("compactdefaultargs") ConjugateBranch2;
		%feature("autodoc", "Return
-------
gp_Hypr2d

Description
-----------
Computes the second conjugate branch relative to this hyperbola. Note: The diagram given under the class purpose indicates where these two branches of hyperbola are positioned in relation to this branch of hyperbola.
") ConjugateBranch2;
		gp_Hypr2d ConjugateBranch2();

		/****** Geom2d_Hyperbola::Copy ******/
		/****** md5 signature: 74978107abfe60e7556292524128d117 ******/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom2d_Geometry>

Description
-----------
Creates a new object which is a copy of this hyperbola.
") Copy;
		opencascade::handle<Geom2d_Geometry> Copy();

		/****** Geom2d_Hyperbola::Directrix1 ******/
		/****** md5 signature: fcbef2c85b670a856d4882ec13ce9c6f ******/
		%feature("compactdefaultargs") Directrix1;
		%feature("autodoc", "Return
-------
gp_Ax2d

Description
-----------
This directrix is the line normal to the XAxis of the hyperbola in the local plane (Z = 0) at a distance d = MajorRadius / e from the center of the hyperbola, where e is the eccentricity of the hyperbola. This line is parallel to the 'YAxis'. The intersection point between directrix1 and the 'XAxis' is the location point of the directrix1. This point is on the positive side of the 'XAxis'.
") Directrix1;
		gp_Ax2d Directrix1();

		/****** Geom2d_Hyperbola::Directrix2 ******/
		/****** md5 signature: 6932241de7dde0eb204208e30fe6363c ******/
		%feature("compactdefaultargs") Directrix2;
		%feature("autodoc", "Return
-------
gp_Ax2d

Description
-----------
This line is obtained by the symmetrical transformation of 'Directrix1' with respect to the 'YAxis' of the hyperbola.
") Directrix2;
		gp_Ax2d Directrix2();


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
		/****** Geom2d_Hyperbola::Eccentricity ******/
		/****** md5 signature: 699f9e1f6116a4a04b89d43165f9b70c ******/
		%feature("compactdefaultargs") Eccentricity;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns the eccentricity of the hyperbola (e > 1). If f is the distance between the location of the hyperbola and the Focus1 then the eccentricity e = f / MajorRadius. raised if MajorRadius = 0.0.
") Eccentricity;
		double Eccentricity();

		/****** Geom2d_Hyperbola::EvalD0 ******/
		/****** md5 signature: c8a189e7ecec0f3816c2e727cd23497e ******/
		%feature("compactdefaultargs") EvalD0;
		%feature("autodoc", "
Parameters
----------
U: double

Return
-------
gp_Pnt2d

Description
-----------
Returns in P the point of parameter U. P = C + MajorRadius * std::cosh(U) * XDir + MinorRadius * std::sinh(U) * YDir where C is the center of the hyperbola , XDir the XDirection and YDir the YDirection of the hyperbola's local coordinate system.
") EvalD0;
		gp_Pnt2d EvalD0(const double U);

		/****** Geom2d_Hyperbola::EvalD1 ******/
		/****** md5 signature: 462ecd6034b2afa120bdac346ba132d5 ******/
		%feature("compactdefaultargs") EvalD1;
		%feature("autodoc", "
Parameters
----------
U: double

Return
-------
Geom2d_Curve::ResD1

Description
-----------
Returns the point P of parameter U and the first derivative V1.
") EvalD1;
		Geom2d_Curve::ResD1 EvalD1(const double U);

		/****** Geom2d_Hyperbola::EvalD2 ******/
		/****** md5 signature: 195e2415ae9d3e0cc993940e201783d4 ******/
		%feature("compactdefaultargs") EvalD2;
		%feature("autodoc", "
Parameters
----------
U: double

Return
-------
Geom2d_Curve::ResD2

Description
-----------
Returns the point P of parameter U, the first and second derivatives V1 and V2.
") EvalD2;
		Geom2d_Curve::ResD2 EvalD2(const double U);

		/****** Geom2d_Hyperbola::EvalD3 ******/
		/****** md5 signature: d77ee3aa017f69682a733367b913cdf5 ******/
		%feature("compactdefaultargs") EvalD3;
		%feature("autodoc", "
Parameters
----------
U: double

Return
-------
Geom2d_Curve::ResD3

Description
-----------
Returns the point P of parameter U, the first second and third derivatives V1 V2 and V3.
") EvalD3;
		Geom2d_Curve::ResD3 EvalD3(const double U);

		/****** Geom2d_Hyperbola::EvalDN ******/
		/****** md5 signature: 01a8d56d875f517809d0d195f9d25048 ******/
		%feature("compactdefaultargs") EvalDN;
		%feature("autodoc", "
Parameters
----------
U: double
N: int

Return
-------
gp_Vec2d

Description
-----------
For the point of parameter U of this hyperbola, computes the vector corresponding to the Nth derivative. Exceptions Standard_RangeError if N is less than 1.
") EvalDN;
		gp_Vec2d EvalDN(const double U, const int N);

		/****** Geom2d_Hyperbola::FirstParameter ******/
		/****** md5 signature: c178e87663f41d496599eac833971a1b ******/
		%feature("compactdefaultargs") FirstParameter;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns RealFirst from Standard.
") FirstParameter;
		double FirstParameter();

		/****** Geom2d_Hyperbola::Focal ******/
		/****** md5 signature: 3803e722169e3501b54b680807b4ccc1 ******/
		%feature("compactdefaultargs") Focal;
		%feature("autodoc", "Return
-------
double

Description
-----------
Computes the focal distance. It is the distance between the two focus of the hyperbola.
") Focal;
		double Focal();

		/****** Geom2d_Hyperbola::Focus1 ******/
		/****** md5 signature: dccbe483b29092eb91431c64e1c5bcd9 ******/
		%feature("compactdefaultargs") Focus1;
		%feature("autodoc", "Return
-------
gp_Pnt2d

Description
-----------
Returns the first focus of the hyperbola. This focus is on the positive side of the 'XAxis' of the hyperbola.
") Focus1;
		gp_Pnt2d Focus1();

		/****** Geom2d_Hyperbola::Focus2 ******/
		/****** md5 signature: ca24694273a9069fddac1db8a37c6c68 ******/
		%feature("compactdefaultargs") Focus2;
		%feature("autodoc", "Return
-------
gp_Pnt2d

Description
-----------
Returns the second focus of the hyperbola. This focus is on the negative side of the 'XAxis' of the hyperbola.
") Focus2;
		gp_Pnt2d Focus2();

		/****** Geom2d_Hyperbola::Hypr2d ******/
		/****** md5 signature: 1e5a2ba02ede7c38c243028792d2514e ******/
		%feature("compactdefaultargs") Hypr2d;
		%feature("autodoc", "Return
-------
gp_Hypr2d

Description
-----------
Converts this hyperbola into a gp_Hypr2d one.
") Hypr2d;
		gp_Hypr2d Hypr2d();

		/****** Geom2d_Hyperbola::IsClosed ******/
		/****** md5 signature: ad3909cb34dcb95a599222e5d4a64ef8 ******/
		%feature("compactdefaultargs") IsClosed;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns False.
") IsClosed;
		bool IsClosed();

		/****** Geom2d_Hyperbola::IsPeriodic ******/
		/****** md5 signature: 04e54c03a031850aca5f08a3025c1d5a ******/
		%feature("compactdefaultargs") IsPeriodic;
		%feature("autodoc", "Return
-------
bool

Description
-----------
return False for an hyperbola.
") IsPeriodic;
		bool IsPeriodic();

		/****** Geom2d_Hyperbola::LastParameter ******/
		/****** md5 signature: e183aab1f162396963682ac01a945da8 ******/
		%feature("compactdefaultargs") LastParameter;
		%feature("autodoc", "Return
-------
double

Description
-----------
returns RealLast from Standard.
") LastParameter;
		double LastParameter();

		/****** Geom2d_Hyperbola::MajorRadius ******/
		/****** md5 signature: 0a2ccb3f2f96e1276e50fba8091d72cb ******/
		%feature("compactdefaultargs") MajorRadius;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns the major or minor radius of this hyperbola. The major radius is also the distance between the center of the hyperbola and the apex of the main branch (located on the 'X Axis' of the hyperbola).
") MajorRadius;
		double MajorRadius();

		/****** Geom2d_Hyperbola::MinorRadius ******/
		/****** md5 signature: 9e6683b74c7166396bffd8c50cf9899c ******/
		%feature("compactdefaultargs") MinorRadius;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns the major or minor radius of this hyperbola. The minor radius is also the distance between the center of the hyperbola and the apex of a conjugate branch (located on the 'Y Axis' of the hyperbola).
") MinorRadius;
		double MinorRadius();

		/****** Geom2d_Hyperbola::OtherBranch ******/
		/****** md5 signature: f232cd4a55a16558916bb20e24dddcc5 ******/
		%feature("compactdefaultargs") OtherBranch;
		%feature("autodoc", "Return
-------
gp_Hypr2d

Description
-----------
Computes the 'other' branch of this hyperbola. This is a symmetrical branch with respect to the center of this hyperbola. Note: The diagram given under the class purpose indicates where the 'other' branch is positioned in relation to this branch of the hyperbola. ^ YAxis | FirstConjugateBranch | Other | Main ---------------------------- C ------------------------------------------&gtXAxis Branch | Branch | | SecondConjugateBranch | Warning The major radius can be less than the minor radius.
") OtherBranch;
		gp_Hypr2d OtherBranch();

		/****** Geom2d_Hyperbola::Parameter ******/
		/****** md5 signature: 28e42519a120bf741c23eca7aaca5525 ******/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "Return
-------
double

Description
-----------
Computes the parameter of this hyperbola. The parameter is: p = (e*e - 1) * MajorRadius where e is the eccentricity of this hyperbola and MajorRadius its major radius. Exceptions Standard_DomainError if the major radius of this hyperbola is null.
") Parameter;
		double Parameter();

		/****** Geom2d_Hyperbola::ReversedParameter ******/
		/****** md5 signature: 27411d9c5403a777b5b7a63ba1bc2d4a ******/
		%feature("compactdefaultargs") ReversedParameter;
		%feature("autodoc", "
Parameters
----------
U: double

Return
-------
double

Description
-----------
Computes the parameter on the reversed hyperbola, for the point of parameter U on this hyperbola. For a hyperbola, the returned value is -U.
") ReversedParameter;
		double ReversedParameter(const double U);

		/****** Geom2d_Hyperbola::SetHypr2d ******/
		/****** md5 signature: a1470a5fc8adb6787ca453ec0f06ec38 ******/
		%feature("compactdefaultargs") SetHypr2d;
		%feature("autodoc", "
Parameters
----------
H: gp_Hypr2d

Return
-------
None

Description
-----------
Converts the gp_Hypr2d hyperbola H into this hyperbola.
") SetHypr2d;
		void SetHypr2d(const gp_Hypr2d & H);

		/****** Geom2d_Hyperbola::SetMajorRadius ******/
		/****** md5 signature: d5b45898082f4683aba784db3a9427e2 ******/
		%feature("compactdefaultargs") SetMajorRadius;
		%feature("autodoc", "
Parameters
----------
MajorRadius: double

Return
-------
None

Description
-----------
Assigns a value to the major or minor radius of this hyperbola. Exceptions Standard_ConstructionError if: - MajorRadius is less than 0.0, - MinorRadius is less than 0.0.
") SetMajorRadius;
		void SetMajorRadius(const double MajorRadius);

		/****** Geom2d_Hyperbola::SetMinorRadius ******/
		/****** md5 signature: 16bb9b548a4db78f0b246fb9bd8633c4 ******/
		%feature("compactdefaultargs") SetMinorRadius;
		%feature("autodoc", "
Parameters
----------
MinorRadius: double

Return
-------
None

Description
-----------
Assigns a value to the major or minor radius of this hyperbola. Exceptions Standard_ConstructionError if: - MajorRadius is less than 0.0, - MinorRadius is less than 0.0.
") SetMinorRadius;
		void SetMinorRadius(const double MinorRadius);

		/****** Geom2d_Hyperbola::Transform ******/
		/****** md5 signature: f0c538f132ce05ee89ade1eb503968b4 ******/
		%feature("compactdefaultargs") Transform;
		%feature("autodoc", "
Parameters
----------
T: gp_Trsf2d

Return
-------
None

Description
-----------
Applies the transformation T to this hyperbola.
") Transform;
		void Transform(const gp_Trsf2d & T);

};


%make_alias(Geom2d_Hyperbola)

%extend Geom2d_Hyperbola {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************
* class Geom2d_Parabola *
************************/
class Geom2d_Parabola : public Geom2d_Conic {
	public:
		/****** Geom2d_Parabola::Geom2d_Parabola ******/
		/****** md5 signature: 2cd2b1e16e0ada192fcb6a1a634995cd ******/
		%feature("compactdefaultargs") Geom2d_Parabola;
		%feature("autodoc", "
Parameters
----------
Prb: gp_Parab2d

Return
-------
None

Description
-----------
Creates a parabola from a non persistent one.
") Geom2d_Parabola;
		 Geom2d_Parabola(const gp_Parab2d & Prb);

		/****** Geom2d_Parabola::Geom2d_Parabola ******/
		/****** md5 signature: 8505f41af2da76ade3be8435329d7a9e ******/
		%feature("compactdefaultargs") Geom2d_Parabola;
		%feature("autodoc", "
Parameters
----------
MirrorAxis: gp_Ax2d
Focal: double
Sense: bool (optional, default to true)

Return
-------
None

Description
-----------
Creates a parabola with its 'MirrorAxis' and it's focal length 'Focal'. MirrorAxis is the axis of symmetry of the curve, it is the 'XAxis'. The 'YAxis' is parallel to the directrix of the parabola and is in the direct sense if Sense is True. The 'Location' point of 'MirrorAxis' is the vertex of the parabola Raised if Focal < 0.0.
") Geom2d_Parabola;
		 Geom2d_Parabola(const gp_Ax2d & MirrorAxis, const double Focal, const bool Sense = true);

		/****** Geom2d_Parabola::Geom2d_Parabola ******/
		/****** md5 signature: 1cf7666172b915e221009e241c6c1436 ******/
		%feature("compactdefaultargs") Geom2d_Parabola;
		%feature("autodoc", "
Parameters
----------
Axis: gp_Ax22d
Focal: double

Return
-------
None

Description
-----------
Creates a parabola with its Axis and it's focal length 'Focal'. The XDirection of Axis is the axis of symmetry of the curve, it is the 'XAxis'. The 'YAxis' is parallel to the directrix of the parabola. The 'Location' point of 'Axis' is the vertex of the parabola. Raised if Focal < 0.0.
") Geom2d_Parabola;
		 Geom2d_Parabola(const gp_Ax22d & Axis, const double Focal);

		/****** Geom2d_Parabola::Geom2d_Parabola ******/
		/****** md5 signature: 45cc4a3559779a52b0e367b9c5fb89c6 ******/
		%feature("compactdefaultargs") Geom2d_Parabola;
		%feature("autodoc", "
Parameters
----------
D: gp_Ax2d
F: gp_Pnt2d

Return
-------
None

Description
-----------
D is the directrix of the parabola and F the focus point. The symmetry axis 'XAxis' of the parabola is normal to the directrix and pass through the focus point F, but its 'Location' point is the vertex of the parabola. The 'YAxis' of the parabola is parallel to D and its 'Location' point is the vertex of the parabola.
") Geom2d_Parabola;
		 Geom2d_Parabola(const gp_Ax2d & D, const gp_Pnt2d & F);

		/****** Geom2d_Parabola::Copy ******/
		/****** md5 signature: 74978107abfe60e7556292524128d117 ******/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom2d_Geometry>

Description
-----------
Creates a new object, which is a copy of this parabola.
") Copy;
		opencascade::handle<Geom2d_Geometry> Copy();

		/****** Geom2d_Parabola::Directrix ******/
		/****** md5 signature: ace6e59edfa4fed38fc517abd7cec6ce ******/
		%feature("compactdefaultargs") Directrix;
		%feature("autodoc", "Return
-------
gp_Ax2d

Description
-----------
The directrix is parallel to the 'YAxis' of the parabola. The 'Location' point of the directrix is the intersection point between the directrix and the symmetry axis ('XAxis') of the parabola.
") Directrix;
		gp_Ax2d Directrix();


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
		/****** Geom2d_Parabola::Eccentricity ******/
		/****** md5 signature: 699f9e1f6116a4a04b89d43165f9b70c ******/
		%feature("compactdefaultargs") Eccentricity;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns the eccentricity e = 1.0.
") Eccentricity;
		double Eccentricity();

		/****** Geom2d_Parabola::EvalD0 ******/
		/****** md5 signature: c8a189e7ecec0f3816c2e727cd23497e ******/
		%feature("compactdefaultargs") EvalD0;
		%feature("autodoc", "
Parameters
----------
U: double

Return
-------
gp_Pnt2d

Description
-----------
Returns in P the point of parameter U. If U = 0 the returned point is the origin of the XAxis and the YAxis of the parabola and it is the vertex of the parabola. P = S + F * (U * U * XDir + * U * YDir) where S is the vertex of the parabola, XDir the XDirection and YDir the YDirection of the parabola's local coordinate system.
") EvalD0;
		gp_Pnt2d EvalD0(const double U);

		/****** Geom2d_Parabola::EvalD1 ******/
		/****** md5 signature: 462ecd6034b2afa120bdac346ba132d5 ******/
		%feature("compactdefaultargs") EvalD1;
		%feature("autodoc", "
Parameters
----------
U: double

Return
-------
Geom2d_Curve::ResD1

Description
-----------
Returns the point P of parameter U and the first derivative V1.
") EvalD1;
		Geom2d_Curve::ResD1 EvalD1(const double U);

		/****** Geom2d_Parabola::EvalD2 ******/
		/****** md5 signature: 195e2415ae9d3e0cc993940e201783d4 ******/
		%feature("compactdefaultargs") EvalD2;
		%feature("autodoc", "
Parameters
----------
U: double

Return
-------
Geom2d_Curve::ResD2

Description
-----------
Returns the point P of parameter U, the first and second derivatives V1 and V2.
") EvalD2;
		Geom2d_Curve::ResD2 EvalD2(const double U);

		/****** Geom2d_Parabola::EvalD3 ******/
		/****** md5 signature: d77ee3aa017f69682a733367b913cdf5 ******/
		%feature("compactdefaultargs") EvalD3;
		%feature("autodoc", "
Parameters
----------
U: double

Return
-------
Geom2d_Curve::ResD3

Description
-----------
Returns the point P of parameter U, the first second and third derivatives V1 V2 and V3.
") EvalD3;
		Geom2d_Curve::ResD3 EvalD3(const double U);

		/****** Geom2d_Parabola::EvalDN ******/
		/****** md5 signature: 01a8d56d875f517809d0d195f9d25048 ******/
		%feature("compactdefaultargs") EvalDN;
		%feature("autodoc", "
Parameters
----------
U: double
N: int

Return
-------
gp_Vec2d

Description
-----------
For the point of parameter U of this parabola, computes the vector corresponding to the Nth derivative. Exceptions Standard_RangeError if N is less than 1.
") EvalDN;
		gp_Vec2d EvalDN(const double U, const int N);

		/****** Geom2d_Parabola::FirstParameter ******/
		/****** md5 signature: c178e87663f41d496599eac833971a1b ******/
		%feature("compactdefaultargs") FirstParameter;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns RealFirst from Standard.
") FirstParameter;
		double FirstParameter();

		/****** Geom2d_Parabola::Focal ******/
		/****** md5 signature: 3803e722169e3501b54b680807b4ccc1 ******/
		%feature("compactdefaultargs") Focal;
		%feature("autodoc", "Return
-------
double

Description
-----------
Computes the focal length of this parabola. The focal length is the distance between the apex and the focus of the parabola.
") Focal;
		double Focal();

		/****** Geom2d_Parabola::Focus ******/
		/****** md5 signature: 2c1658317ec9295538436248b7bfe86f ******/
		%feature("compactdefaultargs") Focus;
		%feature("autodoc", "Return
-------
gp_Pnt2d

Description
-----------
Computes the focus of this parabola The focus is on the positive side of the 'X Axis' of the local coordinate system of the parabola.
") Focus;
		gp_Pnt2d Focus();

		/****** Geom2d_Parabola::IsClosed ******/
		/****** md5 signature: ad3909cb34dcb95a599222e5d4a64ef8 ******/
		%feature("compactdefaultargs") IsClosed;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns False.
") IsClosed;
		bool IsClosed();

		/****** Geom2d_Parabola::IsPeriodic ******/
		/****** md5 signature: 04e54c03a031850aca5f08a3025c1d5a ******/
		%feature("compactdefaultargs") IsPeriodic;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns False.
") IsPeriodic;
		bool IsPeriodic();

		/****** Geom2d_Parabola::LastParameter ******/
		/****** md5 signature: e183aab1f162396963682ac01a945da8 ******/
		%feature("compactdefaultargs") LastParameter;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns RealLast from Standard.
") LastParameter;
		double LastParameter();

		/****** Geom2d_Parabola::Parab2d ******/
		/****** md5 signature: f38a0a2de9b72afcd07619a575164090 ******/
		%feature("compactdefaultargs") Parab2d;
		%feature("autodoc", "Return
-------
gp_Parab2d

Description
-----------
Returns the non persistent parabola from gp with the same geometric properties as <self>.
") Parab2d;
		gp_Parab2d Parab2d();

		/****** Geom2d_Parabola::Parameter ******/
		/****** md5 signature: 28e42519a120bf741c23eca7aaca5525 ******/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "Return
-------
double

Description
-----------
Computes the parameter of this parabola, which is the distance between its focus and its directrix. This distance is twice the focal length. If P is the parameter of the parabola, the equation of the parabola in its local coordinate system is: Y**2 = 2.*P*X.
") Parameter;
		double Parameter();

		/****** Geom2d_Parabola::ParametricTransformation ******/
		/****** md5 signature: 55a643b3b901f410373528852b5587fb ******/
		%feature("compactdefaultargs") ParametricTransformation;
		%feature("autodoc", "
Parameters
----------
T: gp_Trsf2d

Return
-------
double

Description
-----------
Returns a coefficient to compute the parameter on the transformed curve for the transform of the point on <self>. //! Transformed(T)->Value(U * ParametricTransformation(T)) //! is the same point as //! Value(U).Transformed(T) //! This methods returns T.ScaleFactor().
") ParametricTransformation;
		double ParametricTransformation(const gp_Trsf2d & T);

		/****** Geom2d_Parabola::ReversedParameter ******/
		/****** md5 signature: 27411d9c5403a777b5b7a63ba1bc2d4a ******/
		%feature("compactdefaultargs") ReversedParameter;
		%feature("autodoc", "
Parameters
----------
U: double

Return
-------
double

Description
-----------
Computes the parameter on the reversed parabola for the point of parameter U on this parabola. For a parabola, the returned value is -U.
") ReversedParameter;
		double ReversedParameter(const double U);

		/****** Geom2d_Parabola::SetFocal ******/
		/****** md5 signature: 633a4701c2142bdd242c16cf670d9d92 ******/
		%feature("compactdefaultargs") SetFocal;
		%feature("autodoc", "
Parameters
----------
Focal: double

Return
-------
None

Description
-----------
Assigns the value Focal to the focal length of this parabola. Exceptions Standard_ConstructionError if Focal is negative.
") SetFocal;
		void SetFocal(const double Focal);

		/****** Geom2d_Parabola::SetParab2d ******/
		/****** md5 signature: 355df5653f49f40d0f9471ef1d2a4ecc ******/
		%feature("compactdefaultargs") SetParab2d;
		%feature("autodoc", "
Parameters
----------
Prb: gp_Parab2d

Return
-------
None

Description
-----------
Converts the gp_Parab2d parabola Prb into this parabola.
") SetParab2d;
		void SetParab2d(const gp_Parab2d & Prb);

		/****** Geom2d_Parabola::Transform ******/
		/****** md5 signature: f0c538f132ce05ee89ade1eb503968b4 ******/
		%feature("compactdefaultargs") Transform;
		%feature("autodoc", "
Parameters
----------
T: gp_Trsf2d

Return
-------
None

Description
-----------
Applies the transformation T to this parabola.
") Transform;
		void Transform(const gp_Trsf2d & T);

		/****** Geom2d_Parabola::TransformedParameter ******/
		/****** md5 signature: f28b84cfecafc520237e513f1e00974d ******/
		%feature("compactdefaultargs") TransformedParameter;
		%feature("autodoc", "
Parameters
----------
U: double
T: gp_Trsf2d

Return
-------
double

Description
-----------
Computes the parameter on the transformed parabola, for the point of parameter U on this parabola. For a parabola, the returned value is equal to U multiplied by the scale factor of transformation T.
") TransformedParameter;
		double TransformedParameter(const double U, const gp_Trsf2d & T);

};


%make_alias(Geom2d_Parabola)

%extend Geom2d_Parabola {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************
* class Geom2d_TrimmedCurve *
****************************/
class Geom2d_TrimmedCurve : public Geom2d_BoundedCurve {
	public:
		/****** Geom2d_TrimmedCurve::Geom2d_TrimmedCurve ******/
		/****** md5 signature: ef1e80237a662b7585f771715b0b925b ******/
		%feature("compactdefaultargs") Geom2d_TrimmedCurve;
		%feature("autodoc", "
Parameters
----------
C: Geom2d_Curve
U1: double
U2: double
Sense: bool (optional, default to true)
theAdjustPeriodic: bool (optional, default to true)

Return
-------
None

Description
-----------
Creates a trimmed curve from the basis curve C limited between U1 and U2. //! . U1 can be greater or lower than U2. . The returned curve is oriented from U1 to U2. . If the basis curve C is periodic there is an ambiguity because two parts are available. In this case by default the trimmed curve has the same orientation as the basis curve (Sense = True). If Sense = False then the orientation of the trimmed curve is opposite to the orientation of the basis curve C. If the curve is closed but not periodic it is not possible to keep the part of the curve including the junction point (except if the junction point is at the beginning or at the end of the trimmed curve) because you could lose the fundamental characteristics of the basis curve which are used for example to compute the derivatives of the trimmed curve. So for a closed curve the rules are the same as for a open curve. Warnings: In this package the entities are not shared. The TrimmedCurve is built with a copy of the curve C. So when C is modified the TrimmedCurve is not modified Warnings: If <C> is periodic and <theAdjustPeriodic> is True, parametrics bounds of the TrimmedCurve, can be different to [<U1>;<U2>}, if <U1> or <U2> are not in the principal period. Include: For more explanation see the scheme given with this class. Raises ConstructionError the C is not periodic and U1 or U2 are out of the bounds of C. Raised if U1 = U2.
") Geom2d_TrimmedCurve;
		 Geom2d_TrimmedCurve(const opencascade::handle<Geom2d_Curve> & C, const double U1, const double U2, const bool Sense = true, const bool theAdjustPeriodic = true);

		/****** Geom2d_TrimmedCurve::BasisCurve ******/
		/****** md5 signature: a8e3b477d1e52617cbab75e7ce241296 ******/
		%feature("compactdefaultargs") BasisCurve;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom2d_Curve>

Description
-----------
Returns the basis curve. Warning This function does not return a constant reference. Consequently, any modification of the returned value directly modifies the trimmed curve.
") BasisCurve;
		opencascade::handle<Geom2d_Curve> BasisCurve();

		/****** Geom2d_TrimmedCurve::Continuity ******/
		/****** md5 signature: 3913f24bd9959795c7debf7fdd9fbb85 ******/
		%feature("compactdefaultargs") Continuity;
		%feature("autodoc", "Return
-------
GeomAbs_Shape

Description
-----------
Returns the global continuity of the basis curve of this trimmed curve. C0: only geometric continuity, C1: continuity of the first derivative all along the Curve, C2: continuity of the second derivative all along the Curve, C3: continuity of the third derivative all along the Curve, CN: the order of continuity is infinite.
") Continuity;
		GeomAbs_Shape Continuity();

		/****** Geom2d_TrimmedCurve::Copy ******/
		/****** md5 signature: 74978107abfe60e7556292524128d117 ******/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom2d_Geometry>

Description
-----------
Creates a new object, which is a copy of this trimmed curve.
") Copy;
		opencascade::handle<Geom2d_Geometry> Copy();


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
		/****** Geom2d_TrimmedCurve::EndPoint ******/
		/****** md5 signature: 46b1d7929694ea99d1f1a364c0266b97 ******/
		%feature("compactdefaultargs") EndPoint;
		%feature("autodoc", "Return
-------
gp_Pnt2d

Description
-----------
Returns the end point of <self>. This point is the evaluation of the curve for the 'LastParameter'.
") EndPoint;
		gp_Pnt2d EndPoint();

		/****** Geom2d_TrimmedCurve::EvalD0 ******/
		/****** md5 signature: c8a189e7ecec0f3816c2e727cd23497e ******/
		%feature("compactdefaultargs") EvalD0;
		%feature("autodoc", "
Parameters
----------
U: double

Return
-------
gp_Pnt2d

Description
-----------
If the basis curve is an OffsetCurve sometimes it is not possible to do the evaluation of the curve at the parameter U (see class OffsetCurve).
") EvalD0;
		gp_Pnt2d EvalD0(const double U);

		/****** Geom2d_TrimmedCurve::EvalD1 ******/
		/****** md5 signature: 462ecd6034b2afa120bdac346ba132d5 ******/
		%feature("compactdefaultargs") EvalD1;
		%feature("autodoc", "
Parameters
----------
U: double

Return
-------
Geom2d_Curve::ResD1

Description
-----------
Raised if the continuity of the curve is not C1.
") EvalD1;
		Geom2d_Curve::ResD1 EvalD1(const double U);

		/****** Geom2d_TrimmedCurve::EvalD2 ******/
		/****** md5 signature: 195e2415ae9d3e0cc993940e201783d4 ******/
		%feature("compactdefaultargs") EvalD2;
		%feature("autodoc", "
Parameters
----------
U: double

Return
-------
Geom2d_Curve::ResD2

Description
-----------
Raised if the continuity of the curve is not C2.
") EvalD2;
		Geom2d_Curve::ResD2 EvalD2(const double U);

		/****** Geom2d_TrimmedCurve::EvalD3 ******/
		/****** md5 signature: d77ee3aa017f69682a733367b913cdf5 ******/
		%feature("compactdefaultargs") EvalD3;
		%feature("autodoc", "
Parameters
----------
U: double

Return
-------
Geom2d_Curve::ResD3

Description
-----------
Raised if the continuity of the curve is not C3.
") EvalD3;
		Geom2d_Curve::ResD3 EvalD3(const double U);

		/****** Geom2d_TrimmedCurve::EvalDN ******/
		/****** md5 signature: 01a8d56d875f517809d0d195f9d25048 ******/
		%feature("compactdefaultargs") EvalDN;
		%feature("autodoc", "
Parameters
----------
U: double
N: int

Return
-------
gp_Vec2d

Description
-----------
For the point of parameter U of this trimmed curve, computes the vector corresponding to the Nth derivative. Warning The returned derivative vector has the same orientation as the derivative vector of the basis curve, even if the trimmed curve does not have the same orientation as the basis curve. Exceptions Standard_RangeError if N is less than 1. geometric transformations.
") EvalDN;
		gp_Vec2d EvalDN(const double U, const int N);

		/****** Geom2d_TrimmedCurve::FirstParameter ******/
		/****** md5 signature: c178e87663f41d496599eac833971a1b ******/
		%feature("compactdefaultargs") FirstParameter;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns the value of the first parameter of <self>. The first parameter is the parameter of the 'StartPoint' of the trimmed curve.
") FirstParameter;
		double FirstParameter();

		/****** Geom2d_TrimmedCurve::IsCN ******/
		/****** md5 signature: 42a5bf57a05eb6426c49586172f0db7e ******/
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
--- Purpose Returns True if the order of continuity of the trimmed curve is N. A trimmed curve is at least 'C0' continuous. Warnings: The continuity of the trimmed curve can be greater than the continuity of the basis curve because you consider only a part of the basis curve. Raised if N < 0.
") IsCN;
		bool IsCN(const int N);

		/****** Geom2d_TrimmedCurve::IsClosed ******/
		/****** md5 signature: ad3909cb34dcb95a599222e5d4a64ef8 ******/
		%feature("compactdefaultargs") IsClosed;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if the basis curve is periodic and the trim spans exactly one full period, or if the distance between the StartPoint and the EndPoint is within computational precision.
") IsClosed;
		bool IsClosed();

		/****** Geom2d_TrimmedCurve::IsPeriodic ******/
		/****** md5 signature: 04e54c03a031850aca5f08a3025c1d5a ******/
		%feature("compactdefaultargs") IsPeriodic;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if the basis curve is periodic and the trim spans exactly one full period. Returns False otherwise.
") IsPeriodic;
		bool IsPeriodic();

		/****** Geom2d_TrimmedCurve::LastParameter ******/
		/****** md5 signature: e183aab1f162396963682ac01a945da8 ******/
		%feature("compactdefaultargs") LastParameter;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns the value of the last parameter of <self>. The last parameter is the parameter of the 'EndPoint' of the trimmed curve.
") LastParameter;
		double LastParameter();

		/****** Geom2d_TrimmedCurve::ParametricTransformation ******/
		/****** md5 signature: 55a643b3b901f410373528852b5587fb ******/
		%feature("compactdefaultargs") ParametricTransformation;
		%feature("autodoc", "
Parameters
----------
T: gp_Trsf2d

Return
-------
double

Description
-----------
Returns a coefficient to compute the parameter on the transformed curve for the transform of the point on <self>. //! Transformed(T)->Value(U * ParametricTransformation(T)) //! is the same point as //! Value(U).Transformed(T) //! This methods calls the basis curve method.
") ParametricTransformation;
		double ParametricTransformation(const gp_Trsf2d & T);

		/****** Geom2d_TrimmedCurve::Period ******/
		/****** md5 signature: 840c481cf79bd2e1a55b5fd149e36dea ******/
		%feature("compactdefaultargs") Period;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns the period of the basis curve of this trimmed curve. Exceptions Standard_NoSuchObject if the basis curve is not periodic.
") Period;
		double Period();

		/****** Geom2d_TrimmedCurve::Reverse ******/
		/****** md5 signature: 3329d3f633fce7835a9f2ded949a6050 ******/
		%feature("compactdefaultargs") Reverse;
		%feature("autodoc", "Return
-------
None

Description
-----------
Changes the direction of parametrization of <self>. The first and the last parametric values are modified. The 'StartPoint' of the initial curve becomes the 'EndPoint' of the reversed curve and the 'EndPoint' of the initial curve becomes the 'StartPoint' of the reversed curve. Example - If the trimmed curve is defined by: - a basis curve whose parameter range is [ 0.,1. ], and - the two trim values U1 (first parameter) and U2 (last parameter), the reversed trimmed curve is defined by: - the reversed basis curve, whose parameter range is still [ 0.,1. ], and - the two trim values 1. - U2 (first parameter) and 1. - U1 (last parameter).
") Reverse;
		void Reverse();

		/****** Geom2d_TrimmedCurve::ReversedParameter ******/
		/****** md5 signature: 27411d9c5403a777b5b7a63ba1bc2d4a ******/
		%feature("compactdefaultargs") ReversedParameter;
		%feature("autodoc", "
Parameters
----------
U: double

Return
-------
double

Description
-----------
Returns the parameter on the reversed curve for the point of parameter U on <self>. //! returns UFirst + ULast - U.
") ReversedParameter;
		double ReversedParameter(const double U);

		/****** Geom2d_TrimmedCurve::SetTrim ******/
		/****** md5 signature: f73139a607353eb066386b1409339da3 ******/
		%feature("compactdefaultargs") SetTrim;
		%feature("autodoc", "
Parameters
----------
U1: double
U2: double
Sense: bool (optional, default to true)
theAdjustPeriodic: bool (optional, default to true)

Return
-------
None

Description
-----------
Changes this trimmed curve, by redefining the parameter values U1 and U2, which limit its basis curve. Note: If the basis curve is periodic, the trimmed curve has the same orientation as the basis curve if Sense is true (default value) or the opposite orientation if Sense is false. Warning If the basis curve is periodic and theAdjustPeriodic is True, the bounds of the trimmed curve may be different from U1 and U2 if the parametric origin of the basis curve is within the arc of the trimmed curve. In this case, the modified parameter will be equal to U1 or U2 plus or minus the period. If theAdjustPeriodic is False, parameters U1 and U2 will stay unchanged. Exceptions Standard_ConstructionError if: - the basis curve is not periodic, and either U1 or U2 are outside the bounds of the basis curve, or - U1 is equal to U2.
") SetTrim;
		void SetTrim(const double U1, const double U2, const bool Sense = true, const bool theAdjustPeriodic = true);

		/****** Geom2d_TrimmedCurve::StartPoint ******/
		/****** md5 signature: 4c8f62db2cdb046b55fb2302933a985f ******/
		%feature("compactdefaultargs") StartPoint;
		%feature("autodoc", "Return
-------
gp_Pnt2d

Description
-----------
Returns the start point of <self>. This point is the evaluation of the curve from the 'FirstParameter'. value and derivatives Warnings: The returned derivatives have the same orientation as the derivatives of the basis curve.
") StartPoint;
		gp_Pnt2d StartPoint();

		/****** Geom2d_TrimmedCurve::Transform ******/
		/****** md5 signature: f0c538f132ce05ee89ade1eb503968b4 ******/
		%feature("compactdefaultargs") Transform;
		%feature("autodoc", "
Parameters
----------
T: gp_Trsf2d

Return
-------
None

Description
-----------
Applies the transformation T to this trimmed curve. Warning The basis curve is also modified.
") Transform;
		void Transform(const gp_Trsf2d & T);

		/****** Geom2d_TrimmedCurve::TransformedParameter ******/
		/****** md5 signature: f28b84cfecafc520237e513f1e00974d ******/
		%feature("compactdefaultargs") TransformedParameter;
		%feature("autodoc", "
Parameters
----------
U: double
T: gp_Trsf2d

Return
-------
double

Description
-----------
Returns the parameter on the transformed curve for the transform of the point of parameter U on <self>. //! me->Transformed(T)->Value(me->TransformedParameter(U,T)) //! is the same point as //! me->Value(U).Transformed(T) //! This methods calls the basis curve method.
") TransformedParameter;
		double TransformedParameter(const double U, const gp_Trsf2d & T);

};


%make_alias(Geom2d_TrimmedCurve)

%extend Geom2d_TrimmedCurve {
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
def Geom2d_BSplineCurve_MaxDegree(*args):
	return Geom2d_BSplineCurve.MaxDegree(*args)

@deprecated
def Geom2d_BezierCurve_MaxDegree(*args):
	return Geom2d_BezierCurve.MaxDegree(*args)

}
