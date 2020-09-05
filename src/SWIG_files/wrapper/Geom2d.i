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
%define GEOM2DDOCSTRING
"Geom2d module, see official documentation at
https://www.opencascade.com/doc/occt-7.4.0/refman/html/package_geom2d.html"
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
%include ../common/Operators.i
%include ../common/OccHandle.i


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
		/****************** Copy ******************/
		/**** md5 signature: e941544322101d25f6ce3e354598b6da ****/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<Geom2d_Geometry>
") Copy;
		virtual opencascade::handle<Geom2d_Geometry> Copy();

		/****************** Mirror ******************/
		/**** md5 signature: 5a90a3ec4faf7909390bb0bfb4d9be0f ****/
		%feature("compactdefaultargs") Mirror;
		%feature("autodoc", "Performs the symmetrical transformation of a geometry with respect to the point p which is the center of the symmetry and assigns the result to this geometric object.

Parameters
----------
P: gp_Pnt2d

Returns
-------
None
") Mirror;
		void Mirror(const gp_Pnt2d & P);

		/****************** Mirror ******************/
		/**** md5 signature: 8b8d921c1e87f73e8278c4d42ae298f7 ****/
		%feature("compactdefaultargs") Mirror;
		%feature("autodoc", "Performs the symmetrical transformation of a geometry with respect to an axis placement which is the axis of the symmetry.

Parameters
----------
A: gp_Ax2d

Returns
-------
None
") Mirror;
		void Mirror(const gp_Ax2d & A);

		/****************** Mirrored ******************/
		/**** md5 signature: 49242289e864c4f165347a3dd5bb65c0 ****/
		%feature("compactdefaultargs") Mirrored;
		%feature("autodoc", "No available documentation.

Parameters
----------
P: gp_Pnt2d

Returns
-------
opencascade::handle<Geom2d_Geometry>
") Mirrored;
		opencascade::handle<Geom2d_Geometry> Mirrored(const gp_Pnt2d & P);

		/****************** Mirrored ******************/
		/**** md5 signature: 4ead5798e50f8f5bb5867aded4611bbc ****/
		%feature("compactdefaultargs") Mirrored;
		%feature("autodoc", "No available documentation.

Parameters
----------
A: gp_Ax2d

Returns
-------
opencascade::handle<Geom2d_Geometry>
") Mirrored;
		opencascade::handle<Geom2d_Geometry> Mirrored(const gp_Ax2d & A);

		/****************** Rotate ******************/
		/**** md5 signature: 795edcbb32146eb6f071bea4c90f5cfd ****/
		%feature("compactdefaultargs") Rotate;
		%feature("autodoc", "Rotates a geometry. p is the center of the rotation. ang is the angular value of the rotation in radians.

Parameters
----------
P: gp_Pnt2d
Ang: float

Returns
-------
None
") Rotate;
		void Rotate(const gp_Pnt2d & P, const Standard_Real Ang);

		/****************** Rotated ******************/
		/**** md5 signature: 67dfe35f0ac7a9b5eb2353f03cfc74f1 ****/
		%feature("compactdefaultargs") Rotated;
		%feature("autodoc", "No available documentation.

Parameters
----------
P: gp_Pnt2d
Ang: float

Returns
-------
opencascade::handle<Geom2d_Geometry>
") Rotated;
		opencascade::handle<Geom2d_Geometry> Rotated(const gp_Pnt2d & P, const Standard_Real Ang);

		/****************** Scale ******************/
		/**** md5 signature: 5b49a8aeffcacace07c66937f77f1e03 ****/
		%feature("compactdefaultargs") Scale;
		%feature("autodoc", "Scales a geometry. s is the scaling value.

Parameters
----------
P: gp_Pnt2d
S: float

Returns
-------
None
") Scale;
		void Scale(const gp_Pnt2d & P, const Standard_Real S);

		/****************** Scaled ******************/
		/**** md5 signature: 193feacc3feb7b5697843e5d625c1c2c ****/
		%feature("compactdefaultargs") Scaled;
		%feature("autodoc", "No available documentation.

Parameters
----------
P: gp_Pnt2d
S: float

Returns
-------
opencascade::handle<Geom2d_Geometry>
") Scaled;
		opencascade::handle<Geom2d_Geometry> Scaled(const gp_Pnt2d & P, const Standard_Real S);

		/****************** Transform ******************/
		/**** md5 signature: c3ffea2eab5fb0806d25cb15f6b04040 ****/
		%feature("compactdefaultargs") Transform;
		%feature("autodoc", "Transformation of a geometric object. this tansformation can be a translation, a rotation, a symmetry, a scaling or a complex transformation obtained by combination of the previous elementaries transformations. (see class transformation of the package geom2d). the following transformations have the same properties as the previous ones but they don't modified the object itself. a copy of the object is returned.

Parameters
----------
T: gp_Trsf2d

Returns
-------
None
") Transform;
		virtual void Transform(const gp_Trsf2d & T);

		/****************** Transformed ******************/
		/**** md5 signature: bcfedd39e1cdbe24142d5657f9eef985 ****/
		%feature("compactdefaultargs") Transformed;
		%feature("autodoc", "No available documentation.

Parameters
----------
T: gp_Trsf2d

Returns
-------
opencascade::handle<Geom2d_Geometry>
") Transformed;
		opencascade::handle<Geom2d_Geometry> Transformed(const gp_Trsf2d & T);

		/****************** Translate ******************/
		/**** md5 signature: 1cd2e000b85692a9f89a6bf8e8e4782c ****/
		%feature("compactdefaultargs") Translate;
		%feature("autodoc", "Translates a geometry. v is the vector of the tanslation.

Parameters
----------
V: gp_Vec2d

Returns
-------
None
") Translate;
		void Translate(const gp_Vec2d & V);

		/****************** Translate ******************/
		/**** md5 signature: c7768f1dcf9b6595f2bd4653737544f9 ****/
		%feature("compactdefaultargs") Translate;
		%feature("autodoc", "Translates a geometry from the point p1 to the point p2.

Parameters
----------
P1: gp_Pnt2d
P2: gp_Pnt2d

Returns
-------
None
") Translate;
		void Translate(const gp_Pnt2d & P1, const gp_Pnt2d & P2);

		/****************** Translated ******************/
		/**** md5 signature: 6fca5d54a6f24c5d9c223451e560b770 ****/
		%feature("compactdefaultargs") Translated;
		%feature("autodoc", "No available documentation.

Parameters
----------
V: gp_Vec2d

Returns
-------
opencascade::handle<Geom2d_Geometry>
") Translated;
		opencascade::handle<Geom2d_Geometry> Translated(const gp_Vec2d & V);

		/****************** Translated ******************/
		/**** md5 signature: 047815d976186c88c7521c06787992e9 ****/
		%feature("compactdefaultargs") Translated;
		%feature("autodoc", "No available documentation.

Parameters
----------
P1: gp_Pnt2d
P2: gp_Pnt2d

Returns
-------
opencascade::handle<Geom2d_Geometry>
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
		/****************** Geom2d_Transformation ******************/
		/**** md5 signature: 0f03ea49c0526417ce39b130dcc97e09 ****/
		%feature("compactdefaultargs") Geom2d_Transformation;
		%feature("autodoc", "Creates an identity transformation.

Returns
-------
None
") Geom2d_Transformation;
		 Geom2d_Transformation();

		/****************** Geom2d_Transformation ******************/
		/**** md5 signature: 46c844c0fcce2abbfb326c65c62e5c41 ****/
		%feature("compactdefaultargs") Geom2d_Transformation;
		%feature("autodoc", "Creates a persistent copy of t.

Parameters
----------
T: gp_Trsf2d

Returns
-------
None
") Geom2d_Transformation;
		 Geom2d_Transformation(const gp_Trsf2d & T);

		/****************** Copy ******************/
		/**** md5 signature: 6df047016d06bfed1f9fcc0643348901 ****/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "Creates a new object, which is a copy of this transformation.

Returns
-------
opencascade::handle<Geom2d_Transformation>
") Copy;
		opencascade::handle<Geom2d_Transformation> Copy();

		/****************** Form ******************/
		/**** md5 signature: 9bfbf058eebcd895fd3b29a4bba4ff05 ****/
		%feature("compactdefaultargs") Form;
		%feature("autodoc", "Returns the nature of this transformation as a value of the gp_trsfform enumeration. returns the nature of the transformation. it can be identity, rotation, translation, pntmirror, ax1mirror, scale, compoundtrsf.

Returns
-------
gp_TrsfForm
") Form;
		gp_TrsfForm Form();

		/****************** Invert ******************/
		/**** md5 signature: 980f166f600d23a8c77565829af2eeff ****/
		%feature("compactdefaultargs") Invert;
		%feature("autodoc", "Computes the inverse of this transformation. and assigns the result to this transformatio //! raised if the the transformation is singular. this means that the scalefactor is lower or equal to resolution from package gp.

Returns
-------
None
") Invert;
		void Invert();

		/****************** Inverted ******************/
		/**** md5 signature: ac7792d594b6e5d63f643761efff806c ****/
		%feature("compactdefaultargs") Inverted;
		%feature("autodoc", "Computes the inverse of this transformation and creates a new one. raises constructionerror if the the transformation is singular. this means that the scalefactor is lower or equal to resolution from package gp.

Returns
-------
opencascade::handle<Geom2d_Transformation>
") Inverted;
		opencascade::handle<Geom2d_Transformation> Inverted();

		/****************** IsNegative ******************/
		/**** md5 signature: 526e6184e7b7162d8ef698149b1c8ce5 ****/
		%feature("compactdefaultargs") IsNegative;
		%feature("autodoc", "Checks whether this transformation is an indirect transformation: returns true if the determinant of the matrix of the vectorial part of the transformation is less than 0.

Returns
-------
bool
") IsNegative;
		Standard_Boolean IsNegative();

		/****************** Multiplied ******************/
		/**** md5 signature: ff8178e5123036b64b3a48d6d1795233 ****/
		%feature("compactdefaultargs") Multiplied;
		%feature("autodoc", "No available documentation.

Parameters
----------
Other: Geom2d_Transformation

Returns
-------
opencascade::handle<Geom2d_Transformation>
") Multiplied;
		opencascade::handle<Geom2d_Transformation> Multiplied(const opencascade::handle<Geom2d_Transformation> & Other);

		/****************** Multiply ******************/
		/**** md5 signature: d5f7d077f3830e2c8783e1f4f428d5d4 ****/
		%feature("compactdefaultargs") Multiply;
		%feature("autodoc", "Computes the transformation composed with other and <self> . <self> = <self> * other. //! computes the following composition of transformations if n > 0 <self> * <self> * .......* <self>. if n = 0 identity if n < 0 <self>.invert() * .........* <self>.invert().

Parameters
----------
Other: Geom2d_Transformation

Returns
-------
None
") Multiply;
		void Multiply(const opencascade::handle<Geom2d_Transformation> & Other);

		/****************** Power ******************/
		/**** md5 signature: 269b25031ee3626d57e26795a85486bb ****/
		%feature("compactdefaultargs") Power;
		%feature("autodoc", "Raised if n < 0 and if the transformation is not inversible.

Parameters
----------
N: int

Returns
-------
None
") Power;
		void Power(const Standard_Integer N);

		/****************** Powered ******************/
		/**** md5 signature: 7970d41b77c5892e2d40d76b7e066c64 ****/
		%feature("compactdefaultargs") Powered;
		%feature("autodoc", "Raised if n < 0 and if the transformation is not inversible.

Parameters
----------
N: int

Returns
-------
opencascade::handle<Geom2d_Transformation>
") Powered;
		opencascade::handle<Geom2d_Transformation> Powered(const Standard_Integer N);

		/****************** PreMultiply ******************/
		/**** md5 signature: fab364bcaf77ab9214ca12530e1db853 ****/
		%feature("compactdefaultargs") PreMultiply;
		%feature("autodoc", "Computes the matrix of the transformation composed with <self> and other. <self> = other * <self>.

Parameters
----------
Other: Geom2d_Transformation

Returns
-------
None
") PreMultiply;
		void PreMultiply(const opencascade::handle<Geom2d_Transformation> & Other);

		/****************** ScaleFactor ******************/
		/**** md5 signature: 67d4a7cfb2dd29c2b400060f1b45b408 ****/
		%feature("compactdefaultargs") ScaleFactor;
		%feature("autodoc", "Returns the scale value of the transformation.

Returns
-------
float
") ScaleFactor;
		Standard_Real ScaleFactor();

		/****************** SetMirror ******************/
		/**** md5 signature: b99a2a0975c5afd1079e68a54f4ee024 ****/
		%feature("compactdefaultargs") SetMirror;
		%feature("autodoc", "Makes the transformation into a symmetrical transformation with respect to a point p. p is the center of the symmetry.

Parameters
----------
P: gp_Pnt2d

Returns
-------
None
") SetMirror;
		void SetMirror(const gp_Pnt2d & P);

		/****************** SetMirror ******************/
		/**** md5 signature: 09840925aa066f9e81dc705a4274f47c ****/
		%feature("compactdefaultargs") SetMirror;
		%feature("autodoc", "Makes the transformation into a symmetrical transformation with respect to an axis a. a is the center of the axial symmetry.

Parameters
----------
A: gp_Ax2d

Returns
-------
None
") SetMirror;
		void SetMirror(const gp_Ax2d & A);

		/****************** SetRotation ******************/
		/**** md5 signature: 04db1b532a5a3b4eb737b00808774dcc ****/
		%feature("compactdefaultargs") SetRotation;
		%feature("autodoc", "Assigns to this transformation the geometric properties of a rotation at angle ang (in radians) about point p.

Parameters
----------
P: gp_Pnt2d
Ang: float

Returns
-------
None
") SetRotation;
		void SetRotation(const gp_Pnt2d & P, const Standard_Real Ang);

		/****************** SetScale ******************/
		/**** md5 signature: 72fce8983d864dc21ee0c17f7fcfe769 ****/
		%feature("compactdefaultargs") SetScale;
		%feature("autodoc", "Makes the transformation into a scale. p is the center of the scale and s is the scaling value.

Parameters
----------
P: gp_Pnt2d
S: float

Returns
-------
None
") SetScale;
		void SetScale(const gp_Pnt2d & P, const Standard_Real S);

		/****************** SetTransformation ******************/
		/**** md5 signature: 0af598d076d78b705fb5e9c4db627afa ****/
		%feature("compactdefaultargs") SetTransformation;
		%feature("autodoc", "Makes a transformation allowing passage from the coordinate system 'fromsystem1' to the coordinate system 'tosystem2'.

Parameters
----------
FromSystem1: gp_Ax2d
ToSystem2: gp_Ax2d

Returns
-------
None
") SetTransformation;
		void SetTransformation(const gp_Ax2d & FromSystem1, const gp_Ax2d & ToSystem2);

		/****************** SetTransformation ******************/
		/**** md5 signature: 55e7631d5275e21b43e271ccbadbacb9 ****/
		%feature("compactdefaultargs") SetTransformation;
		%feature("autodoc", "Makes the transformation allowing passage from the basic coordinate system {p(0.,0.,0.), vx (1.,0.,0.), vy (0.,1.,0.)} to the local coordinate system defined with the ax2d tosystem.

Parameters
----------
ToSystem: gp_Ax2d

Returns
-------
None
") SetTransformation;
		void SetTransformation(const gp_Ax2d & ToSystem);

		/****************** SetTranslation ******************/
		/**** md5 signature: 230c4cb205b25788ec6ee808ed25cf44 ****/
		%feature("compactdefaultargs") SetTranslation;
		%feature("autodoc", "Makes the transformation into a translation. v is the vector of the translation.

Parameters
----------
V: gp_Vec2d

Returns
-------
None
") SetTranslation;
		void SetTranslation(const gp_Vec2d & V);

		/****************** SetTranslation ******************/
		/**** md5 signature: d386103debd5645a0cbdd65157e0552f ****/
		%feature("compactdefaultargs") SetTranslation;
		%feature("autodoc", "Makes the transformation into a translation from the point p1 to the point p2.

Parameters
----------
P1: gp_Pnt2d
P2: gp_Pnt2d

Returns
-------
None
") SetTranslation;
		void SetTranslation(const gp_Pnt2d & P1, const gp_Pnt2d & P2);

		/****************** SetTrsf2d ******************/
		/**** md5 signature: 941daf470871f4c0229dd5afe5a83fae ****/
		%feature("compactdefaultargs") SetTrsf2d;
		%feature("autodoc", "Makes the transformation into a transformation t from package gp.

Parameters
----------
T: gp_Trsf2d

Returns
-------
None
") SetTrsf2d;
		void SetTrsf2d(const gp_Trsf2d & T);

		/****************** Transforms ******************/
		/**** md5 signature: 7a2a4d09be3965069a02b1ab2fe75da0 ****/
		%feature("compactdefaultargs") Transforms;
		%feature("autodoc", "Applies the transformation <self> to the triplet {x, y}.

Parameters
----------

Returns
-------
X: float
Y: float
") Transforms;
		void Transforms(Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** Trsf2d ******************/
		/**** md5 signature: 6ea70105baee17870344c337ed09ffe5 ****/
		%feature("compactdefaultargs") Trsf2d;
		%feature("autodoc", "Converts this transformation into a gp_trsf2d transformation. returns a non persistent copy of <self>. -c++: return const&.

Returns
-------
gp_Trsf2d
") Trsf2d;
		gp_Trsf2d Trsf2d();

		/****************** Value ******************/
		/**** md5 signature: 1f17b21423db514e298b820a9dd11211 ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Returns the coefficients of the global matrix of tranformation. it is a 2 rows x 3 columns matrix. //! raised if row < 1 or row > 2 or col < 1 or col > 2 //! computes the reverse transformation.

Parameters
----------
Row: int
Col: int

Returns
-------
float
") Value;
		Standard_Real Value(const Standard_Integer Row, const Standard_Integer Col);

		/****************** operator * ******************/
		/**** md5 signature: c4fa2b13a73971dfc97b4ab665674be2 ****/
		%feature("compactdefaultargs") operator *;
		%feature("autodoc", "No available documentation.

Parameters
----------
Other: Geom2d_Transformation

Returns
-------
opencascade::handle<Geom2d_Transformation>
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
		/****************** Geom2d_AxisPlacement ******************/
		/**** md5 signature: 1a609b33120da24d304dd02ed954c905 ****/
		%feature("compactdefaultargs") Geom2d_AxisPlacement;
		%feature("autodoc", "Constructs an axis by conversion of the gp_ax2d axis a.

Parameters
----------
A: gp_Ax2d

Returns
-------
None
") Geom2d_AxisPlacement;
		 Geom2d_AxisPlacement(const gp_Ax2d & A);

		/****************** Geom2d_AxisPlacement ******************/
		/**** md5 signature: dbb5a1bcc681a9307167b5b9f7f56aa9 ****/
		%feature("compactdefaultargs") Geom2d_AxisPlacement;
		%feature("autodoc", "Constructs an axis from a given origin p and unit vector v.

Parameters
----------
P: gp_Pnt2d
V: gp_Dir2d

Returns
-------
None
") Geom2d_AxisPlacement;
		 Geom2d_AxisPlacement(const gp_Pnt2d & P, const gp_Dir2d & V);

		/****************** Angle ******************/
		/**** md5 signature: e58c0d87cbb108bebae622f8570c977a ****/
		%feature("compactdefaultargs") Angle;
		%feature("autodoc", "Computes the angle between the 'direction' of two axis placement in radians. the result is comprised between -pi and pi.

Parameters
----------
Other: Geom2d_AxisPlacement

Returns
-------
float
") Angle;
		Standard_Real Angle(const opencascade::handle<Geom2d_AxisPlacement> & Other);

		/****************** Ax2d ******************/
		/**** md5 signature: 8907c1e8609b11e2c3b10e0464d25255 ****/
		%feature("compactdefaultargs") Ax2d;
		%feature("autodoc", "Converts this axis into a gp_ax2d axis.

Returns
-------
gp_Ax2d
") Ax2d;
		gp_Ax2d Ax2d();

		/****************** Copy ******************/
		/**** md5 signature: e14f86fd39aef4f82b5296205cbd25eb ****/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "Creates a new object which is a copy of this axis.

Returns
-------
opencascade::handle<Geom2d_Geometry>
") Copy;
		opencascade::handle<Geom2d_Geometry> Copy();

		/****************** Direction ******************/
		/**** md5 signature: e457bfc5d72a6522edd233700e481de0 ****/
		%feature("compactdefaultargs") Direction;
		%feature("autodoc", "Returns the 'direction' of <self>. -c++: return const&.

Returns
-------
gp_Dir2d
") Direction;
		gp_Dir2d Direction();

		/****************** Location ******************/
		/**** md5 signature: b6d70f653f0835eef3aab3bab16c5c7c ****/
		%feature("compactdefaultargs") Location;
		%feature("autodoc", "Returns the 'location' point (origin) of the axis placement. -c++: return const&.

Returns
-------
gp_Pnt2d
") Location;
		gp_Pnt2d Location();

		/****************** Reverse ******************/
		/**** md5 signature: b751d6874fc026e19a7a6cb37e9ac1b4 ****/
		%feature("compactdefaultargs") Reverse;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Reverse;
		void Reverse();

		/****************** Reversed ******************/
		/**** md5 signature: f601af67de69032cf1e0303681735b98 ****/
		%feature("compactdefaultargs") Reversed;
		%feature("autodoc", "Reverses the unit vector of this axis. note: - reverse assigns the result to this axis, while - reversed creates a new one.

Returns
-------
opencascade::handle<Geom2d_AxisPlacement>
") Reversed;
		opencascade::handle<Geom2d_AxisPlacement> Reversed();

		/****************** SetAxis ******************/
		/**** md5 signature: 89d2b8fa20a02d53e362c642f1259e7d ****/
		%feature("compactdefaultargs") SetAxis;
		%feature("autodoc", "Changes the complete definition of the axis placement.

Parameters
----------
A: gp_Ax2d

Returns
-------
None
") SetAxis;
		void SetAxis(const gp_Ax2d & A);

		/****************** SetDirection ******************/
		/**** md5 signature: 12767d6ecad16faa02d3f67f1fb01553 ****/
		%feature("compactdefaultargs") SetDirection;
		%feature("autodoc", "Changes the 'direction' of the axis placement.

Parameters
----------
V: gp_Dir2d

Returns
-------
None
") SetDirection;
		void SetDirection(const gp_Dir2d & V);

		/****************** SetLocation ******************/
		/**** md5 signature: 368c9b8c039b553e22ee650e75e4d404 ****/
		%feature("compactdefaultargs") SetLocation;
		%feature("autodoc", "Changes the 'location' point (origin) of the axis placement.

Parameters
----------
P: gp_Pnt2d

Returns
-------
None
") SetLocation;
		void SetLocation(const gp_Pnt2d & P);

		/****************** Transform ******************/
		/**** md5 signature: 45c8e1b1d6196f6efcf8f7b40a0fb1f5 ****/
		%feature("compactdefaultargs") Transform;
		%feature("autodoc", "Applies the transformation t to this axis.

Parameters
----------
T: gp_Trsf2d

Returns
-------
None
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
		/****************** Continuity ******************/
		/**** md5 signature: 8dbb475c198ca068fb275dadeaaecf82 ****/
		%feature("compactdefaultargs") Continuity;
		%feature("autodoc", "It is the global continuity of the curve : c0 : only geometric continuity, c1 : continuity of the first derivative all along the curve, c2 : continuity of the second derivative all along the curve, c3 : continuity of the third derivative all along the curve, g1 : tangency continuity all along the curve, g2 : curvature continuity all along the curve, cn : the order of continuity is infinite.

Returns
-------
GeomAbs_Shape
") Continuity;
		virtual GeomAbs_Shape Continuity();

		/****************** D0 ******************/
		/**** md5 signature: 652ff605762526e1108b353679f13c1c ****/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "Returns in p the point of parameter u. if the curve is periodic then the returned point is p(u) with u = ustart + (u - uend) where ustart and uend are the parametric bounds of the curve. //! raised only for the 'offsetcurve' if it is not possible to compute the current point. for example when the first derivative on the basis curve and the offset direction are parallel.

Parameters
----------
U: float
P: gp_Pnt2d

Returns
-------
None
") D0;
		virtual void D0(const Standard_Real U, gp_Pnt2d & P);

		/****************** D1 ******************/
		/**** md5 signature: 4f7f93c3be55a66ed910af918b7e2db5 ****/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "Returns the point p of parameter u and the first derivative v1. raised if the continuity of the curve is not c1.

Parameters
----------
U: float
P: gp_Pnt2d
V1: gp_Vec2d

Returns
-------
None
") D1;
		virtual void D1(const Standard_Real U, gp_Pnt2d & P, gp_Vec2d & V1);

		/****************** D2 ******************/
		/**** md5 signature: 49c4e00c1b44b7ccbf0c72639443a998 ****/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "Returns the point p of parameter u, the first and second derivatives v1 and v2. raised if the continuity of the curve is not c2.

Parameters
----------
U: float
P: gp_Pnt2d
V1: gp_Vec2d
V2: gp_Vec2d

Returns
-------
None
") D2;
		virtual void D2(const Standard_Real U, gp_Pnt2d & P, gp_Vec2d & V1, gp_Vec2d & V2);

		/****************** D3 ******************/
		/**** md5 signature: e709b00b12f1bdbbde565ba8d65e3caf ****/
		%feature("compactdefaultargs") D3;
		%feature("autodoc", "Returns the point p of parameter u, the first, the second and the third derivative. raised if the continuity of the curve is not c3.

Parameters
----------
U: float
P: gp_Pnt2d
V1: gp_Vec2d
V2: gp_Vec2d
V3: gp_Vec2d

Returns
-------
None
") D3;
		virtual void D3(const Standard_Real U, gp_Pnt2d & P, gp_Vec2d & V1, gp_Vec2d & V2, gp_Vec2d & V3);

		/****************** DN ******************/
		/**** md5 signature: bced76a735e9bc20d1b4b613688415c6 ****/
		%feature("compactdefaultargs") DN;
		%feature("autodoc", "For the point of parameter u of this curve, computes the vector corresponding to the nth derivative. exceptions stdfail_undefinedderivative if: - the continuity of the curve is not 'cn', or - the derivative vector cannot be computed easily; this is the case with specific types of curve (for example, a rational bspline curve where n is greater than 3). standard_rangeerror if n is less than 1.

Parameters
----------
U: float
N: int

Returns
-------
gp_Vec2d
") DN;
		virtual gp_Vec2d DN(const Standard_Real U, const Standard_Integer N);

		/****************** FirstParameter ******************/
		/**** md5 signature: d1641ead93c23610f9b5155af230348d ****/
		%feature("compactdefaultargs") FirstParameter;
		%feature("autodoc", "Returns the value of the first parameter. warnings : it can be realfirst or reallast from package standard if the curve is infinite.

Returns
-------
float
") FirstParameter;
		virtual Standard_Real FirstParameter();

		/****************** IsCN ******************/
		/**** md5 signature: cdc71317785ad261bf847a4d35bd338d ****/
		%feature("compactdefaultargs") IsCN;
		%feature("autodoc", "Returns true if the degree of continuity of this curve is at least n. exceptions standard_rangeerror if n is less than 0.

Parameters
----------
N: int

Returns
-------
bool
") IsCN;
		virtual Standard_Boolean IsCN(const Standard_Integer N);

		/****************** IsClosed ******************/
		/**** md5 signature: be44ba5ab9beeb7f60f33a5068f1446b ****/
		%feature("compactdefaultargs") IsClosed;
		%feature("autodoc", "Returns true if the curve is closed. examples : some curves such as circle are always closed, others such as line are never closed (by definition). some curves such as offsetcurve can be closed or not. these curves are considered as closed if the distance between the first point and the last point of the curve is lower or equal to the resolution from package gp wich is a fixed criterion independant of the application.

Returns
-------
bool
") IsClosed;
		virtual Standard_Boolean IsClosed();

		/****************** IsPeriodic ******************/
		/**** md5 signature: d56d22c204e88ed05ef91fdcfed4696c ****/
		%feature("compactdefaultargs") IsPeriodic;
		%feature("autodoc", "Returns true if the parameter of the curve is periodic. it is possible only if the curve is closed and if the following relation is satisfied : for each parametric value u the distance between the point p(u) and the point p (u + t) is lower or equal to resolution from package gp, t is the period and must be a constant. there are three possibilities : . the curve is never periodic by definition (segmentline) . the curve is always periodic by definition (circle) . the curve can be defined as periodic (bspline). in this case a function setperiodic allows you to give the shape of the curve. the general rule for this case is : if a curve can be periodic or not the default periodicity set is non periodic and you have to turn (explicitly) the curve into a periodic curve if you want the curve to be periodic.

Returns
-------
bool
") IsPeriodic;
		virtual Standard_Boolean IsPeriodic();

		/****************** LastParameter ******************/
		/**** md5 signature: 78c346d133438e913e50667c32977882 ****/
		%feature("compactdefaultargs") LastParameter;
		%feature("autodoc", "Value of the last parameter. warnings : it can be realfirst or reallast from package standard if the curve is infinite.

Returns
-------
float
") LastParameter;
		virtual Standard_Real LastParameter();

		/****************** ParametricTransformation ******************/
		/**** md5 signature: 3b64ad768a6def3685653d473e02384d ****/
		%feature("compactdefaultargs") ParametricTransformation;
		%feature("autodoc", "Returns the coefficient required to compute the parametric transformation of this curve when transformation t is applied. this coefficient is the ratio between the parameter of a point on this curve and the parameter of the transformed point on the new curve transformed by t. note: this function generally returns 1. but it can be redefined (for example, on a line).

Parameters
----------
T: gp_Trsf2d

Returns
-------
float
") ParametricTransformation;
		virtual Standard_Real ParametricTransformation(const gp_Trsf2d & T);

		/****************** Period ******************/
		/**** md5 signature: e4913c399f3a0a7037e498c5a9da8e1f ****/
		%feature("compactdefaultargs") Period;
		%feature("autodoc", "Returns thne period of this curve. raises if the curve is not periodic.

Returns
-------
float
") Period;
		virtual Standard_Real Period();

		/****************** Reverse ******************/
		/**** md5 signature: a5409b070cc6638cc52d06409c4a4a1c ****/
		%feature("compactdefaultargs") Reverse;
		%feature("autodoc", "Changes the direction of parametrization of <self>. the 'firstparameter' and the 'lastparameter' are not changed but the orientation of the curve is modified. if the curve is bounded the startpoint of the initial curve becomes the endpoint of the reversed curve and the endpoint of the initial curve becomes the startpoint of the reversed curve.

Returns
-------
None
") Reverse;
		virtual void Reverse();

		/****************** Reversed ******************/
		/**** md5 signature: 213618aedf08a1c3f5aa636ef2ff6e2a ****/
		%feature("compactdefaultargs") Reversed;
		%feature("autodoc", "Creates a reversed duplicate changes the orientation of this curve. the first and last parameters are not changed, but the parametric direction of the curve is reversed. if the curve is bounded: - the start point of the initial curve becomes the end point of the reversed curve, and - the end point of the initial curve becomes the start point of the reversed curve. - reversed creates a new curve.

Returns
-------
opencascade::handle<Geom2d_Curve>
") Reversed;
		opencascade::handle<Geom2d_Curve> Reversed();

		/****************** ReversedParameter ******************/
		/**** md5 signature: 1e6faad2f92c4f0b35b1d30d75ce1d6e ****/
		%feature("compactdefaultargs") ReversedParameter;
		%feature("autodoc", "Computes the parameter on the reversed curve for the point of parameter u on this curve. note: the point of parameter u on this curve is identical to the point of parameter reversedparameter(u) on the reversed curve.

Parameters
----------
U: float

Returns
-------
float
") ReversedParameter;
		virtual Standard_Real ReversedParameter(const Standard_Real U);

		/****************** TransformedParameter ******************/
		/**** md5 signature: d5c8fde8e79aec0a4853b2521e0c4056 ****/
		%feature("compactdefaultargs") TransformedParameter;
		%feature("autodoc", "Computes the parameter on the curve transformed by t for the point of parameter u on this curve. note: this function generally returns u but it can be redefined (for example, on a line).

Parameters
----------
U: float
T: gp_Trsf2d

Returns
-------
float
") TransformedParameter;
		virtual Standard_Real TransformedParameter(const Standard_Real U, const gp_Trsf2d & T);

		/****************** Value ******************/
		/**** md5 signature: 1105e8ccba0b18e6fe7169aa8e376b83 ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Computes the point of parameter u on <self>. if the curve is periodic then the returned point is p(u) with u = ustart + (u - uend) where ustart and uend are the parametric bounds of the curve. //! it is implemented with d0. //! raised only for the 'offsetcurve' if it is not possible to compute the current point. for example when the first derivative on the basis curve and the offset direction are parallel.

Parameters
----------
U: float

Returns
-------
gp_Pnt2d
") Value;
		gp_Pnt2d Value(const Standard_Real U);

};


%make_alias(Geom2d_Curve)

%extend Geom2d_Curve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************
* class Geom2d_Point *
*********************/
%nodefaultctor Geom2d_Point;
class Geom2d_Point : public Geom2d_Geometry {
	public:
		/****************** Coord ******************/
		/**** md5 signature: 0c8a3b8b98c144557bc75b42a2866c6d ****/
		%feature("compactdefaultargs") Coord;
		%feature("autodoc", "Returns the coordinates of <self>.

Parameters
----------

Returns
-------
X: float
Y: float
") Coord;
		virtual void Coord(Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** Distance ******************/
		/**** md5 signature: 0a880113eea58b83378c27f2f8d5e690 ****/
		%feature("compactdefaultargs") Distance;
		%feature("autodoc", "Computes the distance between <self> and <other>.

Parameters
----------
Other: Geom2d_Point

Returns
-------
float
") Distance;
		Standard_Real Distance(const opencascade::handle<Geom2d_Point> & Other);

		/****************** Pnt2d ******************/
		/**** md5 signature: 4ad29577d24628012003658d14094751 ****/
		%feature("compactdefaultargs") Pnt2d;
		%feature("autodoc", "Returns a non persistent copy of <self>.

Returns
-------
gp_Pnt2d
") Pnt2d;
		virtual gp_Pnt2d Pnt2d();

		/****************** SquareDistance ******************/
		/**** md5 signature: dfb9862905b746ff42e9628bfb874519 ****/
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "Computes the square distance between <self> and <other>.

Parameters
----------
Other: Geom2d_Point

Returns
-------
float
") SquareDistance;
		Standard_Real SquareDistance(const opencascade::handle<Geom2d_Point> & Other);

		/****************** X ******************/
		/**** md5 signature: 413eb82a4e8452543b5734eec1c1d581 ****/
		%feature("compactdefaultargs") X;
		%feature("autodoc", "Returns the x coordinate of <self>.

Returns
-------
float
") X;
		virtual Standard_Real X();

		/****************** Y ******************/
		/**** md5 signature: f3f396df994cd6abe723c99ac9bdc8cf ****/
		%feature("compactdefaultargs") Y;
		%feature("autodoc", "Returns the y coordinate of <self>.

Returns
-------
float
") Y;
		virtual Standard_Real Y();

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
		/****************** Angle ******************/
		/**** md5 signature: 1cc240f149646e1fd85383f89b02f281 ****/
		%feature("compactdefaultargs") Angle;
		%feature("autodoc", "Computes the angular value, in radians, between this vector and vector other. the result is a value between -pi and pi. the orientation is from this vector to vector other. raises vectorwithnullmagnitude if one of the two vectors is a vector with null magnitude because the angular value is indefinite.

Parameters
----------
Other: Geom2d_Vector

Returns
-------
float
") Angle;
		Standard_Real Angle(const opencascade::handle<Geom2d_Vector> & Other);

		/****************** Coord ******************/
		/**** md5 signature: 2bbebb135dcc8c9f5d324bb139387460 ****/
		%feature("compactdefaultargs") Coord;
		%feature("autodoc", "Returns the coordinates of <self>.

Parameters
----------

Returns
-------
X: float
Y: float
") Coord;
		void Coord(Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** Crossed ******************/
		/**** md5 signature: 69026237dca7e19f873c6a3cfffb5fa8 ****/
		%feature("compactdefaultargs") Crossed;
		%feature("autodoc", "Cross product of <self> with the vector <other>.

Parameters
----------
Other: Geom2d_Vector

Returns
-------
float
") Crossed;
		virtual Standard_Real Crossed(const opencascade::handle<Geom2d_Vector> & Other);

		/****************** Dot ******************/
		/**** md5 signature: 4674879ca2cd8793f07019b13f9695cd ****/
		%feature("compactdefaultargs") Dot;
		%feature("autodoc", "Returns the scalar product of 2 vectors.

Parameters
----------
Other: Geom2d_Vector

Returns
-------
float
") Dot;
		Standard_Real Dot(const opencascade::handle<Geom2d_Vector> & Other);

		/****************** Magnitude ******************/
		/**** md5 signature: 0ebeea8be91ecea6aa2ed50ad4c62ecc ****/
		%feature("compactdefaultargs") Magnitude;
		%feature("autodoc", "Returns the magnitude of <self>.

Returns
-------
float
") Magnitude;
		virtual Standard_Real Magnitude();

		/****************** Reverse ******************/
		/**** md5 signature: b751d6874fc026e19a7a6cb37e9ac1b4 ****/
		%feature("compactdefaultargs") Reverse;
		%feature("autodoc", "Reverses the vector <self>.

Returns
-------
None
") Reverse;
		void Reverse();

		/****************** Reversed ******************/
		/**** md5 signature: e8600d990a22cc664108a6dd79a3f6f3 ****/
		%feature("compactdefaultargs") Reversed;
		%feature("autodoc", "Returns a copy of <self> reversed.

Returns
-------
opencascade::handle<Geom2d_Vector>
") Reversed;
		opencascade::handle<Geom2d_Vector> Reversed();

		/****************** SquareMagnitude ******************/
		/**** md5 signature: fcb1984b0230cd2baf43b1ca4e59922e ****/
		%feature("compactdefaultargs") SquareMagnitude;
		%feature("autodoc", "Returns the square magnitude of <self>.

Returns
-------
float
") SquareMagnitude;
		virtual Standard_Real SquareMagnitude();

		/****************** Vec2d ******************/
		/**** md5 signature: d9f1f1694ce0bd17c66b36e8cb82480a ****/
		%feature("compactdefaultargs") Vec2d;
		%feature("autodoc", "Returns a non persistent copy of <self>.

Returns
-------
gp_Vec2d
") Vec2d;
		gp_Vec2d Vec2d();

		/****************** X ******************/
		/**** md5 signature: 2dbf42f7dc56303f104fb0fa585dc6e6 ****/
		%feature("compactdefaultargs") X;
		%feature("autodoc", "Returns the x coordinate of <self>.

Returns
-------
float
") X;
		Standard_Real X();

		/****************** Y ******************/
		/**** md5 signature: 7fd17991f11a9702e525c7070ce7cec6 ****/
		%feature("compactdefaultargs") Y;
		%feature("autodoc", "Returns the y coordinate of <self>.

Returns
-------
float
") Y;
		Standard_Real Y();

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
		/****************** EndPoint ******************/
		/**** md5 signature: cabba8ba02807b5bb937fe3e63f56ebe ****/
		%feature("compactdefaultargs") EndPoint;
		%feature("autodoc", "Returns the end point of the curve. the end point is the value of the curve for the 'lastparameter' of the curve.

Returns
-------
gp_Pnt2d
") EndPoint;
		virtual gp_Pnt2d EndPoint();

		/****************** StartPoint ******************/
		/**** md5 signature: 60e2ba94d4dc875ff409e452c130cfec ****/
		%feature("compactdefaultargs") StartPoint;
		%feature("autodoc", "Returns the start point of the curve. the start point is the value of the curve for the 'firstparameter' of the curve.

Returns
-------
gp_Pnt2d
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
		/****************** Geom2d_CartesianPoint ******************/
		/**** md5 signature: d56d1b09c70e8726d01835c76b77c215 ****/
		%feature("compactdefaultargs") Geom2d_CartesianPoint;
		%feature("autodoc", "Returns a persistent copy of p.

Parameters
----------
P: gp_Pnt2d

Returns
-------
None
") Geom2d_CartesianPoint;
		 Geom2d_CartesianPoint(const gp_Pnt2d & P);

		/****************** Geom2d_CartesianPoint ******************/
		/**** md5 signature: 704decd7b242f5092899fcd3e6138de8 ****/
		%feature("compactdefaultargs") Geom2d_CartesianPoint;
		%feature("autodoc", "No available documentation.

Parameters
----------
X: float
Y: float

Returns
-------
None
") Geom2d_CartesianPoint;
		 Geom2d_CartesianPoint(const Standard_Real X, const Standard_Real Y);

		/****************** Coord ******************/
		/**** md5 signature: bc8fc33885f5141f98fe06a1f3bff87c ****/
		%feature("compactdefaultargs") Coord;
		%feature("autodoc", "Returns the coordinates of <self>.

Parameters
----------

Returns
-------
X: float
Y: float
") Coord;
		void Coord(Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** Copy ******************/
		/**** md5 signature: e14f86fd39aef4f82b5296205cbd25eb ****/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<Geom2d_Geometry>
") Copy;
		opencascade::handle<Geom2d_Geometry> Copy();

		/****************** Pnt2d ******************/
		/**** md5 signature: e4d9cf03598aebce98bdbe282b90b2bf ****/
		%feature("compactdefaultargs") Pnt2d;
		%feature("autodoc", "Returns a non persistent cartesian point with the same coordinates as <self>. -c++: return const&.

Returns
-------
gp_Pnt2d
") Pnt2d;
		gp_Pnt2d Pnt2d();

		/****************** SetCoord ******************/
		/**** md5 signature: 7dcfdae9b9ff412a3b0904f02beeae09 ****/
		%feature("compactdefaultargs") SetCoord;
		%feature("autodoc", "Set <self> to x, y coordinates.

Parameters
----------
X: float
Y: float

Returns
-------
None
") SetCoord;
		void SetCoord(const Standard_Real X, const Standard_Real Y);

		/****************** SetPnt2d ******************/
		/**** md5 signature: 4019e9fc83ac7e024f5664cfdb6467fa ****/
		%feature("compactdefaultargs") SetPnt2d;
		%feature("autodoc", "Set <self> to p.x(), p.y() coordinates.

Parameters
----------
P: gp_Pnt2d

Returns
-------
None
") SetPnt2d;
		void SetPnt2d(const gp_Pnt2d & P);

		/****************** SetX ******************/
		/**** md5 signature: 30fe204d4c67d94370133e1d40dc6787 ****/
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
		/**** md5 signature: 8f42f770a3959dece2671d90f60e35e2 ****/
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

		/****************** Transform ******************/
		/**** md5 signature: 45c8e1b1d6196f6efcf8f7b40a0fb1f5 ****/
		%feature("compactdefaultargs") Transform;
		%feature("autodoc", "No available documentation.

Parameters
----------
T: gp_Trsf2d

Returns
-------
None
") Transform;
		void Transform(const gp_Trsf2d & T);

		/****************** X ******************/
		/**** md5 signature: 99239da966ea182594b91106a0316293 ****/
		%feature("compactdefaultargs") X;
		%feature("autodoc", "Returns the x coordinate of <self>.

Returns
-------
float
") X;
		Standard_Real X();

		/****************** Y ******************/
		/**** md5 signature: 91c17711edaab163697b6c8ad095a159 ****/
		%feature("compactdefaultargs") Y;
		%feature("autodoc", "Returns the y coordinate of <self>.

Returns
-------
float
") Y;
		Standard_Real Y();

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
		/****************** Continuity ******************/
		/**** md5 signature: 9381b370dfdd50af7f1b79ce202f0c6f ****/
		%feature("compactdefaultargs") Continuity;
		%feature("autodoc", "Returns geomabs_cn which is the global continuity of any conic.

Returns
-------
GeomAbs_Shape
") Continuity;
		GeomAbs_Shape Continuity();

		/****************** Eccentricity ******************/
		/**** md5 signature: 41bb637fc6d20616b1d8cd81afbd8bee ****/
		%feature("compactdefaultargs") Eccentricity;
		%feature("autodoc", "Returns the eccentricity value of the conic e. e = 0 for a circle 0 < e < 1 for an ellipse (e = 0 if majorradius = minorradius) e > 1 for a hyperbola e = 1 for a parabola.

Returns
-------
float
") Eccentricity;
		virtual Standard_Real Eccentricity();

		/****************** IsCN ******************/
		/**** md5 signature: 73c2d9ecdd776a5227f0665f0702fcb3 ****/
		%feature("compactdefaultargs") IsCN;
		%feature("autodoc", "Returns true, the order of continuity of a conic is infinite.

Parameters
----------
N: int

Returns
-------
bool
") IsCN;
		Standard_Boolean IsCN(const Standard_Integer N);

		/****************** Location ******************/
		/**** md5 signature: b6d70f653f0835eef3aab3bab16c5c7c ****/
		%feature("compactdefaultargs") Location;
		%feature("autodoc", "Returns the location point of the conic. for the circle, the ellipse and the hyperbola it is the center of the conic. for the parabola it is the vertex of the parabola.

Returns
-------
gp_Pnt2d
") Location;
		gp_Pnt2d Location();

		/****************** Position ******************/
		/**** md5 signature: 345d379c8378049c9b2912713f5142d1 ****/
		%feature("compactdefaultargs") Position;
		%feature("autodoc", "Returns the local coordinates system of the conic.

Returns
-------
gp_Ax22d
") Position;
		const gp_Ax22d Position();

		/****************** Reverse ******************/
		/**** md5 signature: bff3d53d1cf0b268b7de85021a2bf3c4 ****/
		%feature("compactdefaultargs") Reverse;
		%feature("autodoc", "Reverses the direction of parameterization of <self>. the local coordinate system of the conic is modified.

Returns
-------
None
") Reverse;
		void Reverse();

		/****************** ReversedParameter ******************/
		/**** md5 signature: 4258c49eccf44c1163561aeb5d9c0830 ****/
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
		/**** md5 signature: 016f6d0b52d2d85d5711abca672ca103 ****/
		%feature("compactdefaultargs") SetAxis;
		%feature("autodoc", "Modifies this conic, redefining its local coordinate system partially, by assigning p as its origin.

Parameters
----------
A: gp_Ax22d

Returns
-------
None
") SetAxis;
		void SetAxis(const gp_Ax22d & A);

		/****************** SetLocation ******************/
		/**** md5 signature: 368c9b8c039b553e22ee650e75e4d404 ****/
		%feature("compactdefaultargs") SetLocation;
		%feature("autodoc", "Modifies this conic, redefining its local coordinate system fully, by assigning a as this coordinate system.

Parameters
----------
P: gp_Pnt2d

Returns
-------
None
") SetLocation;
		void SetLocation(const gp_Pnt2d & P);

		/****************** SetXAxis ******************/
		/**** md5 signature: ec66b4bfc97a7a2706907f916a07745f ****/
		%feature("compactdefaultargs") SetXAxis;
		%feature("autodoc", "No available documentation.

Parameters
----------
A: gp_Ax2d

Returns
-------
None
") SetXAxis;
		void SetXAxis(const gp_Ax2d & A);

		/****************** SetYAxis ******************/
		/**** md5 signature: f0f5b973b3cd13921764c845a5c4cc95 ****/
		%feature("compactdefaultargs") SetYAxis;
		%feature("autodoc", "Assigns the origin and unit vector of axis a to the origin of the local coordinate system of this conic and either: - its 'x direction', or - its 'y direction'. the other unit vector of the local coordinate system of this conic is recomputed normal to a, without changing the orientation of the local coordinate system (right-handed or left-handed).

Parameters
----------
A: gp_Ax2d

Returns
-------
None
") SetYAxis;
		void SetYAxis(const gp_Ax2d & A);

		/****************** XAxis ******************/
		/**** md5 signature: 5bcd651b87069885e2b5ecad2bd89992 ****/
		%feature("compactdefaultargs") XAxis;
		%feature("autodoc", "Returns the 'xaxis' of the conic. this axis defines the origin of parametrization of the conic. this axis and the 'yaxis' define the local coordinate system of the conic. -c++: return const&.

Returns
-------
gp_Ax2d
") XAxis;
		gp_Ax2d XAxis();

		/****************** YAxis ******************/
		/**** md5 signature: 1e80565ed75c7e231792089b80d7c873 ****/
		%feature("compactdefaultargs") YAxis;
		%feature("autodoc", "Returns the 'yaxis' of the conic. the 'yaxis' is perpendicular to the 'xaxis'.

Returns
-------
gp_Ax2d
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
		/****************** Geom2d_Direction ******************/
		/**** md5 signature: 96ace76863a384f76d84200ad73df7c8 ****/
		%feature("compactdefaultargs") Geom2d_Direction;
		%feature("autodoc", "Creates a unit vector with it 2 cartesian coordinates. //! raised if sqrt( x*x + y*y) <= resolution from gp.

Parameters
----------
X: float
Y: float

Returns
-------
None
") Geom2d_Direction;
		 Geom2d_Direction(const Standard_Real X, const Standard_Real Y);

		/****************** Geom2d_Direction ******************/
		/**** md5 signature: 9aa0c4e41dac0f1a7422ba761567830a ****/
		%feature("compactdefaultargs") Geom2d_Direction;
		%feature("autodoc", "Creates a persistent copy of <self>.

Parameters
----------
V: gp_Dir2d

Returns
-------
None
") Geom2d_Direction;
		 Geom2d_Direction(const gp_Dir2d & V);

		/****************** Copy ******************/
		/**** md5 signature: e14f86fd39aef4f82b5296205cbd25eb ****/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "Creates a new object which is a copy of this unit vector.

Returns
-------
opencascade::handle<Geom2d_Geometry>
") Copy;
		opencascade::handle<Geom2d_Geometry> Copy();

		/****************** Crossed ******************/
		/**** md5 signature: 60a984b316e7d05dadd7a20f93f56b81 ****/
		%feature("compactdefaultargs") Crossed;
		%feature("autodoc", "Computes the cross product between <self> and <other>.

Parameters
----------
Other: Geom2d_Vector

Returns
-------
float
") Crossed;
		Standard_Real Crossed(const opencascade::handle<Geom2d_Vector> & Other);

		/****************** Dir2d ******************/
		/**** md5 signature: e038c8f594851f20129c96f9b1a76267 ****/
		%feature("compactdefaultargs") Dir2d;
		%feature("autodoc", "Converts this unit vector into a gp_dir2d unit vector.

Returns
-------
gp_Dir2d
") Dir2d;
		gp_Dir2d Dir2d();

		/****************** Magnitude ******************/
		/**** md5 signature: 7de7b7dd76586e80dfb981b910f5ec5e ****/
		%feature("compactdefaultargs") Magnitude;
		%feature("autodoc", "Returns 1.0.

Returns
-------
float
") Magnitude;
		Standard_Real Magnitude();

		/****************** SetCoord ******************/
		/**** md5 signature: 7dcfdae9b9ff412a3b0904f02beeae09 ****/
		%feature("compactdefaultargs") SetCoord;
		%feature("autodoc", "Assigns the coordinates x and y to this unit vector, then normalizes it. exceptions standard_constructionerror if sqrt(x*x + y*y) is less than or equal to gp::resolution().

Parameters
----------
X: float
Y: float

Returns
-------
None
") SetCoord;
		void SetCoord(const Standard_Real X, const Standard_Real Y);

		/****************** SetDir2d ******************/
		/**** md5 signature: d586af66a90b7452474a8df439583909 ****/
		%feature("compactdefaultargs") SetDir2d;
		%feature("autodoc", "Converts the gp_dir2d unit vector v into this unit vector.

Parameters
----------
V: gp_Dir2d

Returns
-------
None
") SetDir2d;
		void SetDir2d(const gp_Dir2d & V);

		/****************** SetX ******************/
		/**** md5 signature: 30fe204d4c67d94370133e1d40dc6787 ****/
		%feature("compactdefaultargs") SetX;
		%feature("autodoc", "Assigns a value to the x coordinate of this unit vector, then normalizes it. exceptions standard_constructionerror if the value assigned causes the magnitude of the vector to become less than or equal to gp::resolution().

Parameters
----------
X: float

Returns
-------
None
") SetX;
		void SetX(const Standard_Real X);

		/****************** SetY ******************/
		/**** md5 signature: 8f42f770a3959dece2671d90f60e35e2 ****/
		%feature("compactdefaultargs") SetY;
		%feature("autodoc", "Assigns a value to the y coordinate of this unit vector, then normalizes it. exceptions standard_constructionerror if the value assigned causes the magnitude of the vector to become less than or equal to gp::resolution().

Parameters
----------
Y: float

Returns
-------
None
") SetY;
		void SetY(const Standard_Real Y);

		/****************** SquareMagnitude ******************/
		/**** md5 signature: e9cc7ce2500a11b7e18b76619fa1de15 ****/
		%feature("compactdefaultargs") SquareMagnitude;
		%feature("autodoc", "Returns 1.0.

Returns
-------
float
") SquareMagnitude;
		Standard_Real SquareMagnitude();

		/****************** Transform ******************/
		/**** md5 signature: 45c8e1b1d6196f6efcf8f7b40a0fb1f5 ****/
		%feature("compactdefaultargs") Transform;
		%feature("autodoc", "Applies the transformation t to this unit vector, then normalizes it.

Parameters
----------
T: gp_Trsf2d

Returns
-------
None
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
		/****************** Geom2d_Line ******************/
		/**** md5 signature: 1dfcd9cca30c59c42ced5c52907b3989 ****/
		%feature("compactdefaultargs") Geom2d_Line;
		%feature("autodoc", "Creates a line located in 2d space with the axis placement a. the location of a is the origin of the line.

Parameters
----------
A: gp_Ax2d

Returns
-------
None
") Geom2d_Line;
		 Geom2d_Line(const gp_Ax2d & A);

		/****************** Geom2d_Line ******************/
		/**** md5 signature: 8702e04e5651081b2198553e42ad55d2 ****/
		%feature("compactdefaultargs") Geom2d_Line;
		%feature("autodoc", "Creates a line by conversion of the gp_lin2d line l.

Parameters
----------
L: gp_Lin2d

Returns
-------
None
") Geom2d_Line;
		 Geom2d_Line(const gp_Lin2d & L);

		/****************** Geom2d_Line ******************/
		/**** md5 signature: f0fa4fa6cd8c784d4931f5e6a2495b0a ****/
		%feature("compactdefaultargs") Geom2d_Line;
		%feature("autodoc", "Constructs a line passing through point p and parallel to vector v (p and v are, respectively, the origin and the unit vector of the positioning axis of the line).

Parameters
----------
P: gp_Pnt2d
V: gp_Dir2d

Returns
-------
None
") Geom2d_Line;
		 Geom2d_Line(const gp_Pnt2d & P, const gp_Dir2d & V);

		/****************** Continuity ******************/
		/**** md5 signature: 9381b370dfdd50af7f1b79ce202f0c6f ****/
		%feature("compactdefaultargs") Continuity;
		%feature("autodoc", "Returns geomabs_cn, which is the global continuity of any line.

Returns
-------
GeomAbs_Shape
") Continuity;
		GeomAbs_Shape Continuity();

		/****************** Copy ******************/
		/**** md5 signature: e14f86fd39aef4f82b5296205cbd25eb ****/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "Creates a new object, which is a copy of this line.

Returns
-------
opencascade::handle<Geom2d_Geometry>
") Copy;
		opencascade::handle<Geom2d_Geometry> Copy();

		/****************** D0 ******************/
		/**** md5 signature: 01a5234aae6db090351bac35b3718fd9 ****/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "Returns in p the point of parameter u. p (u) = o + u * dir where o is the 'location' point of the line and dir the direction of the line.

Parameters
----------
U: float
P: gp_Pnt2d

Returns
-------
None
") D0;
		void D0(const Standard_Real U, gp_Pnt2d & P);

		/****************** D1 ******************/
		/**** md5 signature: 78ab988905058ca54a64c0ab51a90e46 ****/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "Returns the point p of parameter u and the first derivative v1.

Parameters
----------
U: float
P: gp_Pnt2d
V1: gp_Vec2d

Returns
-------
None
") D1;
		void D1(const Standard_Real U, gp_Pnt2d & P, gp_Vec2d & V1);

		/****************** D2 ******************/
		/**** md5 signature: acc8c0955596bb0bf809102736ad1124 ****/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "Returns the point p of parameter u, the first and second derivatives v1 and v2. v2 is a vector with null magnitude for a line.

Parameters
----------
U: float
P: gp_Pnt2d
V1: gp_Vec2d
V2: gp_Vec2d

Returns
-------
None
") D2;
		void D2(const Standard_Real U, gp_Pnt2d & P, gp_Vec2d & V1, gp_Vec2d & V2);

		/****************** D3 ******************/
		/**** md5 signature: 28315b7efe2f6c64fe9497aa5c5ddaf6 ****/
		%feature("compactdefaultargs") D3;
		%feature("autodoc", "V2 and v3 are vectors with null magnitude for a line.

Parameters
----------
U: float
P: gp_Pnt2d
V1: gp_Vec2d
V2: gp_Vec2d
V3: gp_Vec2d

Returns
-------
None
") D3;
		void D3(const Standard_Real U, gp_Pnt2d & P, gp_Vec2d & V1, gp_Vec2d & V2, gp_Vec2d & V3);

		/****************** DN ******************/
		/**** md5 signature: a05d2f76912764cef5ac7bb40ebda3d7 ****/
		%feature("compactdefaultargs") DN;
		%feature("autodoc", "For the point of parameter u of this line, computes the vector corresponding to the nth derivative. note: if n is greater than or equal to 2, the result is a vector with null magnitude. exceptions standard_rangeerror if n is less than 1.

Parameters
----------
U: float
N: int

Returns
-------
gp_Vec2d
") DN;
		gp_Vec2d DN(const Standard_Real U, const Standard_Integer N);

		/****************** Direction ******************/
		/**** md5 signature: 24b32913fac63aab5fb6c5d1d7be7851 ****/
		%feature("compactdefaultargs") Direction;
		%feature("autodoc", "Changes the direction of the line.

Returns
-------
gp_Dir2d
") Direction;
		const gp_Dir2d Direction();

		/****************** Distance ******************/
		/**** md5 signature: eafbc4fbb17061433dcb80a2bf868650 ****/
		%feature("compactdefaultargs") Distance;
		%feature("autodoc", "Computes the distance between <self> and the point p.

Parameters
----------
P: gp_Pnt2d

Returns
-------
float
") Distance;
		Standard_Real Distance(const gp_Pnt2d & P);

		/****************** FirstParameter ******************/
		/**** md5 signature: eb9ebe94572bd67588fe8811eac261fb ****/
		%feature("compactdefaultargs") FirstParameter;
		%feature("autodoc", "Returns realfirst from standard.

Returns
-------
float
") FirstParameter;
		Standard_Real FirstParameter();

		/****************** IsCN ******************/
		/**** md5 signature: 73c2d9ecdd776a5227f0665f0702fcb3 ****/
		%feature("compactdefaultargs") IsCN;
		%feature("autodoc", "Returns true.

Parameters
----------
N: int

Returns
-------
bool
") IsCN;
		Standard_Boolean IsCN(const Standard_Integer N);

		/****************** IsClosed ******************/
		/**** md5 signature: 00978070ec4cb5f00d1d002a8d5d3763 ****/
		%feature("compactdefaultargs") IsClosed;
		%feature("autodoc", "Returns false.

Returns
-------
bool
") IsClosed;
		Standard_Boolean IsClosed();

		/****************** IsPeriodic ******************/
		/**** md5 signature: 15e3ccfd3ad4ae42959489f7f64aa8ca ****/
		%feature("compactdefaultargs") IsPeriodic;
		%feature("autodoc", "Returns false.

Returns
-------
bool
") IsPeriodic;
		Standard_Boolean IsPeriodic();

		/****************** LastParameter ******************/
		/**** md5 signature: cb4925a2d4a451ceec8f6ad486530f9c ****/
		%feature("compactdefaultargs") LastParameter;
		%feature("autodoc", "Returns reallast from standard.

Returns
-------
float
") LastParameter;
		Standard_Real LastParameter();

		/****************** Lin2d ******************/
		/**** md5 signature: a31ef8cb14503ca77be39e2816957515 ****/
		%feature("compactdefaultargs") Lin2d;
		%feature("autodoc", "Returns non persistent line from gp with the same geometric properties as <self>.

Returns
-------
gp_Lin2d
") Lin2d;
		gp_Lin2d Lin2d();

		/****************** Location ******************/
		/**** md5 signature: fbf774a3a1efe16540d680c0476bcbc8 ****/
		%feature("compactdefaultargs") Location;
		%feature("autodoc", "Changes the 'location' point (origin) of the line.

Returns
-------
gp_Pnt2d
") Location;
		const gp_Pnt2d Location();

		/****************** ParametricTransformation ******************/
		/**** md5 signature: c55f3070fbb8250ad20eb38b8b2fe8cf ****/
		%feature("compactdefaultargs") ParametricTransformation;
		%feature("autodoc", "Returns the coefficient required to compute the parametric transformation of this line when transformation t is applied. this coefficient is the ratio between the parameter of a point on this line and the parameter of the transformed point on the new line transformed by t. for a line, the returned value is the scale factor of the transformation t.

Parameters
----------
T: gp_Trsf2d

Returns
-------
float
") ParametricTransformation;
		virtual Standard_Real ParametricTransformation(const gp_Trsf2d & T);

		/****************** Position ******************/
		/**** md5 signature: 918ef7d5550c41cbbd9512dcf1888fbe ****/
		%feature("compactdefaultargs") Position;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Ax2d
") Position;
		const gp_Ax2d Position();

		/****************** Reverse ******************/
		/**** md5 signature: bff3d53d1cf0b268b7de85021a2bf3c4 ****/
		%feature("compactdefaultargs") Reverse;
		%feature("autodoc", "Changes the orientation of this line. as a result, the unit vector of the positioning axis of this line is reversed.

Returns
-------
None
") Reverse;
		void Reverse();

		/****************** ReversedParameter ******************/
		/**** md5 signature: 382721d5a4ea752fecc12f03ab0de9a1 ****/
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
		/**** md5 signature: 12767d6ecad16faa02d3f67f1fb01553 ****/
		%feature("compactdefaultargs") SetDirection;
		%feature("autodoc", "Changes the direction of the line.

Parameters
----------
V: gp_Dir2d

Returns
-------
None
") SetDirection;
		void SetDirection(const gp_Dir2d & V);

		/****************** SetLin2d ******************/
		/**** md5 signature: faf3d424dae22218db03626a5d7aa0b1 ****/
		%feature("compactdefaultargs") SetLin2d;
		%feature("autodoc", "Set <self> so that <self> has the same geometric properties as l.

Parameters
----------
L: gp_Lin2d

Returns
-------
None
") SetLin2d;
		void SetLin2d(const gp_Lin2d & L);

		/****************** SetLocation ******************/
		/**** md5 signature: 368c9b8c039b553e22ee650e75e4d404 ****/
		%feature("compactdefaultargs") SetLocation;
		%feature("autodoc", "Changes the 'location' point (origin) of the line.

Parameters
----------
P: gp_Pnt2d

Returns
-------
None
") SetLocation;
		void SetLocation(const gp_Pnt2d & P);

		/****************** SetPosition ******************/
		/**** md5 signature: ea9b5278e5665b3886ffa693a4fe03fb ****/
		%feature("compactdefaultargs") SetPosition;
		%feature("autodoc", "Changes the 'location' and a the 'direction' of <self>.

Parameters
----------
A: gp_Ax2d

Returns
-------
None
") SetPosition;
		void SetPosition(const gp_Ax2d & A);

		/****************** Transform ******************/
		/**** md5 signature: 45c8e1b1d6196f6efcf8f7b40a0fb1f5 ****/
		%feature("compactdefaultargs") Transform;
		%feature("autodoc", "Applies the transformation t to this line.

Parameters
----------
T: gp_Trsf2d

Returns
-------
None
") Transform;
		void Transform(const gp_Trsf2d & T);

		/****************** TransformedParameter ******************/
		/**** md5 signature: a8fa80dec72c518278d67ce7a2a0b3fa ****/
		%feature("compactdefaultargs") TransformedParameter;
		%feature("autodoc", "Computes the parameter on the line transformed by t for the point of parameter u on this line. for a line, the returned value is equal to u multiplied by the scale factor of transformation t.

Parameters
----------
U: float
T: gp_Trsf2d

Returns
-------
float
") TransformedParameter;
		virtual Standard_Real TransformedParameter(const Standard_Real U, const gp_Trsf2d & T);

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
		/****************** Geom2d_OffsetCurve ******************/
		/**** md5 signature: 8c3d7a153e5568aa9ce3d6356373d018 ****/
		%feature("compactdefaultargs") Geom2d_OffsetCurve;
		%feature("autodoc", "Constructs a curve offset from the basis curve c, where offset is the distance between the offset curve and the basis curve at any point. a point on the offset curve is built by measuring the offset value along a normal vector at a point on c. this normal vector is obtained by rotating the vector tangential to c at 90 degrees in the anti-trigonometric sense. the side of c on which the offset value is measured is indicated by this normal vector if offset is positive, or in the inverse sense if offset is negative. if isnotcheckc0 = true checking if basis curve has c0-continuity is not made. warnings : in this package the entities are not shared. the offsetcurve is built with a copy of the curve c. so when c is modified the offsetcurve is not modified warning! if isnotcheckc0 = false, constructionerror raised if the basis curve c is not at least c1. no check is done to know if ||v^z|| != 0.0 at any point.

Parameters
----------
C: Geom2d_Curve
Offset: float
isNotCheckC0: bool,optional
	default value is Standard_False

Returns
-------
None
") Geom2d_OffsetCurve;
		 Geom2d_OffsetCurve(const opencascade::handle<Geom2d_Curve> & C, const Standard_Real Offset, const Standard_Boolean isNotCheckC0 = Standard_False);

		/****************** BasisCurve ******************/
		/**** md5 signature: a8e3b477d1e52617cbab75e7ce241296 ****/
		%feature("compactdefaultargs") BasisCurve;
		%feature("autodoc", "Returns the basis curve of this offset curve. the basis curve can be an offset curve.

Returns
-------
opencascade::handle<Geom2d_Curve>
") BasisCurve;
		opencascade::handle<Geom2d_Curve> BasisCurve();

		/****************** Continuity ******************/
		/**** md5 signature: 9381b370dfdd50af7f1b79ce202f0c6f ****/
		%feature("compactdefaultargs") Continuity;
		%feature("autodoc", "Continuity of the offset curve : c0 : only geometric continuity, c1 : continuity of the first derivative all along the curve, c2 : continuity of the second derivative all along the curve, c3 : continuity of the third derivative all along the curve, g1 : tangency continuity all along the curve, g2 : curvature continuity all along the curve, cn : the order of continuity is infinite. warnings : returns the continuity of the basis curve - 1. the offset curve must have a unique normal direction defined at any point. value and derivatives //! warnings : the exception undefinedvalue or undefinedderivative is raised if it is not possible to compute a unique offset direction. if t is the first derivative with not null length and z the direction normal to the plane of the curve, the relation ||t(u) ^ z|| != 0 must be satisfied to evaluate the offset curve. no check is done at the creation time and we suppose in this package that the offset curve is well defined.

Returns
-------
GeomAbs_Shape
") Continuity;
		GeomAbs_Shape Continuity();

		/****************** Copy ******************/
		/**** md5 signature: e14f86fd39aef4f82b5296205cbd25eb ****/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "Creates a new object, which is a copy of this offset curve.

Returns
-------
opencascade::handle<Geom2d_Geometry>
") Copy;
		opencascade::handle<Geom2d_Geometry> Copy();

		/****************** D0 ******************/
		/**** md5 signature: 01a5234aae6db090351bac35b3718fd9 ****/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "Warning! this should not be called if the basis curve is not at least c1. nevertheless if used on portion where the curve is c1, it is ok.

Parameters
----------
U: float
P: gp_Pnt2d

Returns
-------
None
") D0;
		void D0(const Standard_Real U, gp_Pnt2d & P);

		/****************** D1 ******************/
		/**** md5 signature: 78ab988905058ca54a64c0ab51a90e46 ****/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "Warning! this should not be called if the continuity of the basis curve is not c2. nevertheless, it's ok to use it on portion where the curve is c2.

Parameters
----------
U: float
P: gp_Pnt2d
V1: gp_Vec2d

Returns
-------
None
") D1;
		void D1(const Standard_Real U, gp_Pnt2d & P, gp_Vec2d & V1);

		/****************** D2 ******************/
		/**** md5 signature: acc8c0955596bb0bf809102736ad1124 ****/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "Warning! this should not be called if the continuity of the basis curve is not c3. nevertheless, it's ok to use it on portion where the curve is c3.

Parameters
----------
U: float
P: gp_Pnt2d
V1: gp_Vec2d
V2: gp_Vec2d

Returns
-------
None
") D2;
		void D2(const Standard_Real U, gp_Pnt2d & P, gp_Vec2d & V1, gp_Vec2d & V2);

		/****************** D3 ******************/
		/**** md5 signature: 28315b7efe2f6c64fe9497aa5c5ddaf6 ****/
		%feature("compactdefaultargs") D3;
		%feature("autodoc", "Warning! this should not be called if the continuity of the basis curve is not c4. nevertheless, it's ok to use it on portion where the curve is c4.

Parameters
----------
U: float
P: gp_Pnt2d
V1: gp_Vec2d
V2: gp_Vec2d
V3: gp_Vec2d

Returns
-------
None
") D3;
		void D3(const Standard_Real U, gp_Pnt2d & P, gp_Vec2d & V1, gp_Vec2d & V2, gp_Vec2d & V3);

		/****************** DN ******************/
		/**** md5 signature: a05d2f76912764cef5ac7bb40ebda3d7 ****/
		%feature("compactdefaultargs") DN;
		%feature("autodoc", "The returned vector gives the value of the derivative for the order of derivation n. warning! this should not be called raises undefunedderivative if the continuity of the basis curve is not cn+1. nevertheless, it's ok to use it on portion where the curve is cn+1 raises rangeerror if n < 1. raises notimplemented if n > 3. the following functions compute the value and derivatives on the offset curve and returns the derivatives on the basis curve too. the computation of the value and derivatives on the basis curve are used to evaluate the offset curve warnings : the exception undefinedvalue or undefinedderivative is raised if it is not possible to compute a unique offset direction.

Parameters
----------
U: float
N: int

Returns
-------
gp_Vec2d
") DN;
		gp_Vec2d DN(const Standard_Real U, const Standard_Integer N);

		/****************** FirstParameter ******************/
		/**** md5 signature: eb9ebe94572bd67588fe8811eac261fb ****/
		%feature("compactdefaultargs") FirstParameter;
		%feature("autodoc", "Returns the value of the first parameter of this offset curve. the first parameter corresponds to the start point of the curve. note: the first and last parameters of this offset curve are also the ones of its basis curve.

Returns
-------
float
") FirstParameter;
		Standard_Real FirstParameter();

		/****************** GetBasisCurveContinuity ******************/
		/**** md5 signature: 5542c2675753571f1c65d428430b4583 ****/
		%feature("compactdefaultargs") GetBasisCurveContinuity;
		%feature("autodoc", "Returns continuity of the basis curve.

Returns
-------
GeomAbs_Shape
") GetBasisCurveContinuity;
		GeomAbs_Shape GetBasisCurveContinuity();

		/****************** IsCN ******************/
		/**** md5 signature: 73c2d9ecdd776a5227f0665f0702fcb3 ****/
		%feature("compactdefaultargs") IsCN;
		%feature("autodoc", "Is the order of continuity of the curve n ? warnings : this method answer true if the continuity of the basis curve is n + 1. we suppose in this class that a normal direction to the basis curve (used to compute the offset curve) is defined at any point on the basis curve. raised if n < 0.

Parameters
----------
N: int

Returns
-------
bool
") IsCN;
		Standard_Boolean IsCN(const Standard_Integer N);

		/****************** IsClosed ******************/
		/**** md5 signature: 00978070ec4cb5f00d1d002a8d5d3763 ****/
		%feature("compactdefaultargs") IsClosed;
		%feature("autodoc", "Returns true if the distance between the start point and the end point of the curve is lower or equal to resolution from package gp.

Returns
-------
bool
") IsClosed;
		Standard_Boolean IsClosed();

		/****************** IsPeriodic ******************/
		/**** md5 signature: 15e3ccfd3ad4ae42959489f7f64aa8ca ****/
		%feature("compactdefaultargs") IsPeriodic;
		%feature("autodoc", "Is the parametrization of a curve is periodic ? if the basis curve is a circle or an ellipse the corresponding offsetcurve is periodic. if the basis curve can't be periodic (for example beziercurve) the offsetcurve can't be periodic.

Returns
-------
bool
") IsPeriodic;
		Standard_Boolean IsPeriodic();

		/****************** LastParameter ******************/
		/**** md5 signature: cb4925a2d4a451ceec8f6ad486530f9c ****/
		%feature("compactdefaultargs") LastParameter;
		%feature("autodoc", "Returns the value of the last parameter of this offset curve. the last parameter corresponds to the end point. note: the first and last parameters of this offset curve are also the ones of its basis curve.

Returns
-------
float
") LastParameter;
		Standard_Real LastParameter();

		/****************** Offset ******************/
		/**** md5 signature: 02d05c913be85cd7a6e18ff06a18b8e7 ****/
		%feature("compactdefaultargs") Offset;
		%feature("autodoc", "Returns the offset value of this offset curve.

Returns
-------
float
") Offset;
		Standard_Real Offset();

		/****************** ParametricTransformation ******************/
		/**** md5 signature: c55f3070fbb8250ad20eb38b8b2fe8cf ****/
		%feature("compactdefaultargs") ParametricTransformation;
		%feature("autodoc", "Returns a coefficient to compute the parameter on the transformed curve for the transform of the point on <self>. //! transformed(t)->value(u * parametrictransformation(t)) //! is the same point as //! value(u).transformed(t) //! this methods calls the basis curve method.

Parameters
----------
T: gp_Trsf2d

Returns
-------
float
") ParametricTransformation;
		virtual Standard_Real ParametricTransformation(const gp_Trsf2d & T);

		/****************** Period ******************/
		/**** md5 signature: a0af1de0407384df43b0e76d6b472231 ****/
		%feature("compactdefaultargs") Period;
		%feature("autodoc", "Returns the period of this offset curve, i.e. the period of the basis curve of this offset curve. exceptions standard_nosuchobject if the basis curve is not periodic.

Returns
-------
float
") Period;
		virtual Standard_Real Period();

		/****************** Reverse ******************/
		/**** md5 signature: bff3d53d1cf0b268b7de85021a2bf3c4 ****/
		%feature("compactdefaultargs") Reverse;
		%feature("autodoc", "Changes the direction of parametrization of <self>. as a result: - the basis curve is reversed, - the start point of the initial curve becomes the end point of the reversed curve, - the end point of the initial curve becomes the start point of the reversed curve, and - the first and last parameters are recomputed.

Returns
-------
None
") Reverse;
		void Reverse();

		/****************** ReversedParameter ******************/
		/**** md5 signature: 382721d5a4ea752fecc12f03ab0de9a1 ****/
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
		/**** md5 signature: 78e1bfe3405a486c3077d65fc70e8438 ****/
		%feature("compactdefaultargs") SetBasisCurve;
		%feature("autodoc", "Changes this offset curve by assigning c as the basis curve from which it is built. if isnotcheckc0 = true checking if basis curve has c0-continuity is not made. exceptions if isnotcheckc0 = false, standard_constructionerror if the curve c is not at least 'c1' continuous.

Parameters
----------
C: Geom2d_Curve
isNotCheckC0: bool,optional
	default value is Standard_False

Returns
-------
None
") SetBasisCurve;
		void SetBasisCurve(const opencascade::handle<Geom2d_Curve> & C, const Standard_Boolean isNotCheckC0 = Standard_False);

		/****************** SetOffsetValue ******************/
		/**** md5 signature: b0345a26ec85d9ad16bb8be0106b4798 ****/
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
		/**** md5 signature: 45c8e1b1d6196f6efcf8f7b40a0fb1f5 ****/
		%feature("compactdefaultargs") Transform;
		%feature("autodoc", "Applies the transformation t to this offset curve. note: the basis curve is also modified.

Parameters
----------
T: gp_Trsf2d

Returns
-------
None
") Transform;
		void Transform(const gp_Trsf2d & T);

		/****************** TransformedParameter ******************/
		/**** md5 signature: a8fa80dec72c518278d67ce7a2a0b3fa ****/
		%feature("compactdefaultargs") TransformedParameter;
		%feature("autodoc", "Returns the parameter on the transformed curve for the transform of the point of parameter u on <self>. //! me->transformed(t)->value(me->transformedparameter(u,t)) //! is the same point as //! me->value(u).transformed(t) //! this methods calls the basis curve method.

Parameters
----------
U: float
T: gp_Trsf2d

Returns
-------
float
") TransformedParameter;
		virtual Standard_Real TransformedParameter(const Standard_Real U, const gp_Trsf2d & T);

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
		/****************** Geom2d_VectorWithMagnitude ******************/
		/**** md5 signature: f217f9f58457955ac44075e8157d4840 ****/
		%feature("compactdefaultargs") Geom2d_VectorWithMagnitude;
		%feature("autodoc", "Creates a persistent copy of v.

Parameters
----------
V: gp_Vec2d

Returns
-------
None
") Geom2d_VectorWithMagnitude;
		 Geom2d_VectorWithMagnitude(const gp_Vec2d & V);

		/****************** Geom2d_VectorWithMagnitude ******************/
		/**** md5 signature: b251b389f7de333721997315d4e2b8ce ****/
		%feature("compactdefaultargs") Geom2d_VectorWithMagnitude;
		%feature("autodoc", "Creates a vector with two cartesian coordinates.

Parameters
----------
X: float
Y: float

Returns
-------
None
") Geom2d_VectorWithMagnitude;
		 Geom2d_VectorWithMagnitude(const Standard_Real X, const Standard_Real Y);

		/****************** Geom2d_VectorWithMagnitude ******************/
		/**** md5 signature: c88dc1cdae8eb0574200ae0c25d562c5 ****/
		%feature("compactdefaultargs") Geom2d_VectorWithMagnitude;
		%feature("autodoc", "Creates a vector from the point p1 to the point p2. the magnitude of the vector is the distance between p1 and p2.

Parameters
----------
P1: gp_Pnt2d
P2: gp_Pnt2d

Returns
-------
None
") Geom2d_VectorWithMagnitude;
		 Geom2d_VectorWithMagnitude(const gp_Pnt2d & P1, const gp_Pnt2d & P2);

		/****************** Add ******************/
		/**** md5 signature: f7b5c1b5bf0696f32918ee9c07834f8d ****/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "Adds the vector other to <self>.

Parameters
----------
Other: Geom2d_Vector

Returns
-------
None
") Add;
		void Add(const opencascade::handle<Geom2d_Vector> & Other);

		/****************** Added ******************/
		/**** md5 signature: 9115475aabc98af8d41462cc81c932cc ****/
		%feature("compactdefaultargs") Added;
		%feature("autodoc", "No available documentation.

Parameters
----------
Other: Geom2d_Vector

Returns
-------
opencascade::handle<Geom2d_VectorWithMagnitude>
") Added;
		opencascade::handle<Geom2d_VectorWithMagnitude> Added(const opencascade::handle<Geom2d_Vector> & Other);

		/****************** Copy ******************/
		/**** md5 signature: e14f86fd39aef4f82b5296205cbd25eb ****/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "Creates a new object which is a copy of this vector.

Returns
-------
opencascade::handle<Geom2d_Geometry>
") Copy;
		opencascade::handle<Geom2d_Geometry> Copy();

		/****************** Crossed ******************/
		/**** md5 signature: 60a984b316e7d05dadd7a20f93f56b81 ****/
		%feature("compactdefaultargs") Crossed;
		%feature("autodoc", "Computes the cross product between <self> and other <self> ^ other. a new vector is returned.

Parameters
----------
Other: Geom2d_Vector

Returns
-------
float
") Crossed;
		Standard_Real Crossed(const opencascade::handle<Geom2d_Vector> & Other);

		/****************** Divide ******************/
		/**** md5 signature: 7bc46cf38daaa2229b322d9add0408e3 ****/
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
		/**** md5 signature: 2b6bc1f0d07f4a8dfd2247ce53643a88 ****/
		%feature("compactdefaultargs") Divided;
		%feature("autodoc", "Divides <self> by a scalar. a new vector is returned.

Parameters
----------
Scalar: float

Returns
-------
opencascade::handle<Geom2d_VectorWithMagnitude>
") Divided;
		opencascade::handle<Geom2d_VectorWithMagnitude> Divided(const Standard_Real Scalar);

		/****************** Magnitude ******************/
		/**** md5 signature: 7de7b7dd76586e80dfb981b910f5ec5e ****/
		%feature("compactdefaultargs") Magnitude;
		%feature("autodoc", "Returns the magnitude of <self>.

Returns
-------
float
") Magnitude;
		Standard_Real Magnitude();

		/****************** Multiplied ******************/
		/**** md5 signature: aed2118316908a68b856d19780b06d12 ****/
		%feature("compactdefaultargs") Multiplied;
		%feature("autodoc", "Computes the product of the vector <self> by a scalar. a new vector is returned. //! -c++: alias operator * collision with same operator defined for the class vector!.

Parameters
----------
Scalar: float

Returns
-------
opencascade::handle<Geom2d_VectorWithMagnitude>
") Multiplied;
		opencascade::handle<Geom2d_VectorWithMagnitude> Multiplied(const Standard_Real Scalar);

		/****************** Multiply ******************/
		/**** md5 signature: c6d925fe0833ff6abc2c1aab20682246 ****/
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
		/**** md5 signature: 587346cf1e1c12fdf674aedc915ccd95 ****/
		%feature("compactdefaultargs") Normalize;
		%feature("autodoc", "Normalizes <self>. //! raised if the magnitude of the vector is lower or equal to resolution from package gp.

Returns
-------
None
") Normalize;
		void Normalize();

		/****************** Normalized ******************/
		/**** md5 signature: 14bd1ebbd370df99d9623cd73aa96456 ****/
		%feature("compactdefaultargs") Normalized;
		%feature("autodoc", "Returns a copy of <self> normalized. //! raised if the magnitude of the vector is lower or equal to resolution from package gp.

Returns
-------
opencascade::handle<Geom2d_VectorWithMagnitude>
") Normalized;
		opencascade::handle<Geom2d_VectorWithMagnitude> Normalized();

		/****************** SetCoord ******************/
		/**** md5 signature: 7dcfdae9b9ff412a3b0904f02beeae09 ****/
		%feature("compactdefaultargs") SetCoord;
		%feature("autodoc", "Set <self> to x, y coordinates.

Parameters
----------
X: float
Y: float

Returns
-------
None
") SetCoord;
		void SetCoord(const Standard_Real X, const Standard_Real Y);

		/****************** SetVec2d ******************/
		/**** md5 signature: 863f12e1dec37e33194ea8900547718d ****/
		%feature("compactdefaultargs") SetVec2d;
		%feature("autodoc", "No available documentation.

Parameters
----------
V: gp_Vec2d

Returns
-------
None
") SetVec2d;
		void SetVec2d(const gp_Vec2d & V);

		/****************** SetX ******************/
		/**** md5 signature: 30fe204d4c67d94370133e1d40dc6787 ****/
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
		/**** md5 signature: 8f42f770a3959dece2671d90f60e35e2 ****/
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

		/****************** SquareMagnitude ******************/
		/**** md5 signature: e9cc7ce2500a11b7e18b76619fa1de15 ****/
		%feature("compactdefaultargs") SquareMagnitude;
		%feature("autodoc", "Returns the square magnitude of <self>.

Returns
-------
float
") SquareMagnitude;
		Standard_Real SquareMagnitude();

		/****************** Subtract ******************/
		/**** md5 signature: d8e9cfde46a3e7c6080c069df7dbb788 ****/
		%feature("compactdefaultargs") Subtract;
		%feature("autodoc", "Subtracts the vector other to <self>.

Parameters
----------
Other: Geom2d_Vector

Returns
-------
None
") Subtract;
		void Subtract(const opencascade::handle<Geom2d_Vector> & Other);

		/****************** Subtracted ******************/
		/**** md5 signature: 4fbb6b22e705df6acc8e9854d44ae113 ****/
		%feature("compactdefaultargs") Subtracted;
		%feature("autodoc", "No available documentation.

Parameters
----------
Other: Geom2d_Vector

Returns
-------
opencascade::handle<Geom2d_VectorWithMagnitude>
") Subtracted;
		opencascade::handle<Geom2d_VectorWithMagnitude> Subtracted(const opencascade::handle<Geom2d_Vector> & Other);

		/****************** Transform ******************/
		/**** md5 signature: 45c8e1b1d6196f6efcf8f7b40a0fb1f5 ****/
		%feature("compactdefaultargs") Transform;
		%feature("autodoc", "Applies the transformation t to this vector.

Parameters
----------
T: gp_Trsf2d

Returns
-------
None
") Transform;
		void Transform(const gp_Trsf2d & T);


            %extend{
                void __imul_wrapper__(const Standard_Real other) {
                *self *= other;
                }
            }
            %pythoncode {
            def __imul__(self, right):
                self.__imul_wrapper__(right)
                return self
            }
		/****************** operator + ******************/
		/**** md5 signature: 771c6f61e4c20d4eb184cb5b33f68d78 ****/
		%feature("compactdefaultargs") operator +;
		%feature("autodoc", "No available documentation.

Parameters
----------
Other: Geom2d_Vector

Returns
-------
opencascade::handle<Geom2d_VectorWithMagnitude>
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
		/****************** operator - ******************/
		/**** md5 signature: 2530c89d8b5c4d19ce213e1343e40928 ****/
		%feature("compactdefaultargs") operator -;
		%feature("autodoc", "No available documentation.

Parameters
----------
Other: Geom2d_Vector

Returns
-------
opencascade::handle<Geom2d_VectorWithMagnitude>
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
		/****************** operator / ******************/
		/**** md5 signature: 0a56286c62dba74f36f30742050f131f ****/
		%feature("compactdefaultargs") operator /;
		%feature("autodoc", "No available documentation.

Parameters
----------
Scalar: float

Returns
-------
opencascade::handle<Geom2d_VectorWithMagnitude>
") operator /;
		opencascade::handle<Geom2d_VectorWithMagnitude> operator /(const Standard_Real Scalar);


            %extend{
                void __itruediv_wrapper__(const Standard_Real other) {
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
		/****************** Geom2d_BSplineCurve ******************/
		/**** md5 signature: 11a20905aef4367dd31844768a3e3683 ****/
		%feature("compactdefaultargs") Geom2d_BSplineCurve;
		%feature("autodoc", "Creates a non-rational b_spline curve on the basis <knots, multiplicities> of degree <degree>. the following conditions must be verified. 0 < degree <= maxdegree. //! knots.length() == mults.length() >= 2 //! knots(i) < knots(i+1) (knots are increasing) //! 1 <= mults(i) <= degree //! on a non periodic curve the first and last multiplicities may be degree+1 (this is even recommanded if you want the curve to start and finish on the first and last pole). //! on a periodic curve the first and the last multicities must be the same. //! on non-periodic curves //! poles.length() == sum(mults(i)) - degree - 1 >= 2 //! on periodic curves //! poles.length() == sum(mults(i)) except the first or last.

Parameters
----------
Poles: TColgp_Array1OfPnt2d
Knots: TColStd_Array1OfReal
Multiplicities: TColStd_Array1OfInteger
Degree: int
Periodic: bool,optional
	default value is Standard_False

Returns
-------
None
") Geom2d_BSplineCurve;
		 Geom2d_BSplineCurve(const TColgp_Array1OfPnt2d & Poles, const TColStd_Array1OfReal & Knots, const TColStd_Array1OfInteger & Multiplicities, const Standard_Integer Degree, const Standard_Boolean Periodic = Standard_False);

		/****************** Geom2d_BSplineCurve ******************/
		/**** md5 signature: bfc846dbbd0da2db80352d8b9059ba5b ****/
		%feature("compactdefaultargs") Geom2d_BSplineCurve;
		%feature("autodoc", "Creates a rational b_spline curve on the basis <knots, multiplicities> of degree <degree>. the following conditions must be verified. 0 < degree <= maxdegree. //! knots.length() == mults.length() >= 2 //! knots(i) < knots(i+1) (knots are increasing) //! 1 <= mults(i) <= degree //! on a non periodic curve the first and last multiplicities may be degree+1 (this is even recommanded if you want the curve to start and finish on the first and last pole). //! on a periodic curve the first and the last multicities must be the same. //! on non-periodic curves //! poles.length() == sum(mults(i)) - degree - 1 >= 2 //! on periodic curves //! poles.length() == sum(mults(i)) except the first or last.

Parameters
----------
Poles: TColgp_Array1OfPnt2d
Weights: TColStd_Array1OfReal
Knots: TColStd_Array1OfReal
Multiplicities: TColStd_Array1OfInteger
Degree: int
Periodic: bool,optional
	default value is Standard_False

Returns
-------
None
") Geom2d_BSplineCurve;
		 Geom2d_BSplineCurve(const TColgp_Array1OfPnt2d & Poles, const TColStd_Array1OfReal & Weights, const TColStd_Array1OfReal & Knots, const TColStd_Array1OfInteger & Multiplicities, const Standard_Integer Degree, const Standard_Boolean Periodic = Standard_False);

		/****************** Continuity ******************/
		/**** md5 signature: 9381b370dfdd50af7f1b79ce202f0c6f ****/
		%feature("compactdefaultargs") Continuity;
		%feature("autodoc", "Returns the global continuity of the curve : c0 : only geometric continuity, c1 : continuity of the first derivative all along the curve, c2 : continuity of the second derivative all along the curve, c3 : continuity of the third derivative all along the curve, cn : the order of continuity is infinite. for a b-spline curve of degree d if a knot ui has a multiplicity p the b-spline curve is only cd-p continuous at ui. so the global continuity of the curve can't be greater than cd-p where p is the maximum multiplicity of the interior knots. in the interior of a knot span the curve is infinitely continuously differentiable.

Returns
-------
GeomAbs_Shape
") Continuity;
		GeomAbs_Shape Continuity();

		/****************** Copy ******************/
		/**** md5 signature: e14f86fd39aef4f82b5296205cbd25eb ****/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "Creates a new object which is a copy of this bspline curve.

Returns
-------
opencascade::handle<Geom2d_Geometry>
") Copy;
		opencascade::handle<Geom2d_Geometry> Copy();

		/****************** D0 ******************/
		/**** md5 signature: 01a5234aae6db090351bac35b3718fd9 ****/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "No available documentation.

Parameters
----------
U: float
P: gp_Pnt2d

Returns
-------
None
") D0;
		void D0(const Standard_Real U, gp_Pnt2d & P);

		/****************** D1 ******************/
		/**** md5 signature: 78ab988905058ca54a64c0ab51a90e46 ****/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "Raised if the continuity of the curve is not c1.

Parameters
----------
U: float
P: gp_Pnt2d
V1: gp_Vec2d

Returns
-------
None
") D1;
		void D1(const Standard_Real U, gp_Pnt2d & P, gp_Vec2d & V1);

		/****************** D2 ******************/
		/**** md5 signature: acc8c0955596bb0bf809102736ad1124 ****/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "Raised if the continuity of the curve is not c2.

Parameters
----------
U: float
P: gp_Pnt2d
V1: gp_Vec2d
V2: gp_Vec2d

Returns
-------
None
") D2;
		void D2(const Standard_Real U, gp_Pnt2d & P, gp_Vec2d & V1, gp_Vec2d & V2);

		/****************** D3 ******************/
		/**** md5 signature: 28315b7efe2f6c64fe9497aa5c5ddaf6 ****/
		%feature("compactdefaultargs") D3;
		%feature("autodoc", "For this bspline curve, computes - the point p of parameter u, or - the point p and one or more of the following values: - v1, the first derivative vector, - v2, the second derivative vector, - v3, the third derivative vector. warning on a point where the continuity of the curve is not the one requested, these functions impact the part defined by the parameter with a value greater than u, i.e. the part of the curve to the 'right' of the singularity. raises undefinedderivative if the continuity of the curve is not c3.

Parameters
----------
U: float
P: gp_Pnt2d
V1: gp_Vec2d
V2: gp_Vec2d
V3: gp_Vec2d

Returns
-------
None
") D3;
		void D3(const Standard_Real U, gp_Pnt2d & P, gp_Vec2d & V1, gp_Vec2d & V2, gp_Vec2d & V3);

		/****************** DN ******************/
		/**** md5 signature: a05d2f76912764cef5ac7bb40ebda3d7 ****/
		%feature("compactdefaultargs") DN;
		%feature("autodoc", "For the point of parameter u of this bspline curve, computes the vector corresponding to the nth derivative. warning on a point where the continuity of the curve is not the one requested, this function impacts the part defined by the parameter with a value greater than u, i.e. the part of the curve to the 'right' of the singularity. raises undefinedderivative if the continuity of the curve is not cn. rangeerror if n < 1. the following functions computes the point of parameter u and the derivatives at this point on the b-spline curve arc defined between the knot fromk1 and the knot tok2. u can be out of bounds [knot (fromk1), knot (tok2)] but for the computation we only use the definition of the curve between these two knots. this method is useful to compute local derivative, if the order of continuity of the whole curve is not greater enough. inside the parametric domain knot (fromk1), knot (tok2) the evaluations are the same as if we consider the whole definition of the curve. of course the evaluations are different outside this parametric domain.

Parameters
----------
U: float
N: int

Returns
-------
gp_Vec2d
") DN;
		gp_Vec2d DN(const Standard_Real U, const Standard_Integer N);

		/****************** Degree ******************/
		/**** md5 signature: e3276df1ce733e2c8e940db548a26d03 ****/
		%feature("compactdefaultargs") Degree;
		%feature("autodoc", "Returns the degree of this bspline curve. in this class the degree of the basis normalized b-spline functions cannot be greater than 'maxdegree' computation of value and derivatives.

Returns
-------
int
") Degree;
		Standard_Integer Degree();

		/****************** EndPoint ******************/
		/**** md5 signature: 728da2f708cdaeb8d7659531afcee1a8 ****/
		%feature("compactdefaultargs") EndPoint;
		%feature("autodoc", "Returns the last point of the curve. warnings : the last point of the curve is different from the last pole of the curve if the multiplicity of the last knot is lower than degree.

Returns
-------
gp_Pnt2d
") EndPoint;
		gp_Pnt2d EndPoint();

		/****************** FirstParameter ******************/
		/**** md5 signature: eb9ebe94572bd67588fe8811eac261fb ****/
		%feature("compactdefaultargs") FirstParameter;
		%feature("autodoc", "Computes the parametric value of the start point of the curve. it is a knot value.

Returns
-------
float
") FirstParameter;
		Standard_Real FirstParameter();

		/****************** FirstUKnotIndex ******************/
		/**** md5 signature: cd1268c018861ca921686718cddd2c78 ****/
		%feature("compactdefaultargs") FirstUKnotIndex;
		%feature("autodoc", "For a b-spline curve the first parameter (which gives the start point of the curve) is a knot value but if the multiplicity of the first knot index is lower than degree + 1 it is not the first knot of the curve. this method computes the index of the knot corresponding to the first parameter.

Returns
-------
int
") FirstUKnotIndex;
		Standard_Integer FirstUKnotIndex();

		/****************** IncreaseDegree ******************/
		/**** md5 signature: 2f404362ae4c6786bc49eb532abfeb06 ****/
		%feature("compactdefaultargs") IncreaseDegree;
		%feature("autodoc", "Increases the degree of this bspline curve to degree. as a result, the poles, weights and multiplicities tables are modified; the knots table is not changed. nothing is done if degree is less than or equal to the current degree. exceptions standard_constructionerror if degree is greater than geom2d_bsplinecurve::maxdegree().

Parameters
----------
Degree: int

Returns
-------
None
") IncreaseDegree;
		void IncreaseDegree(const Standard_Integer Degree);

		/****************** IncreaseMultiplicity ******************/
		/**** md5 signature: acbc64714702b7201cc3229bfdba4081 ****/
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
		/**** md5 signature: 20329617e559bb513534e7b5d8d351fc ****/
		%feature("compactdefaultargs") IncreaseMultiplicity;
		%feature("autodoc", "Increases the multiplicities of the knots in [i1,i2] to <m>. //! for each knot if <m> is lower or equal to the current multiplicity nothing is done. if <m> is higher than the degree the degree is used. as a result, the poles and weights tables of this curve are modified. warning it is forbidden to modify the multiplicity of the first or last knot of a non-periodic curve. be careful as geom2d does not protect against this. exceptions standard_outofrange if either index, i1 or i2 is outside the bounds of the knots table.

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
		/**** md5 signature: 7c6b4452fa65fae5da2a1a56ab1d1564 ****/
		%feature("compactdefaultargs") IncrementMultiplicity;
		%feature("autodoc", "Increases by m the multiplicity of the knots of indexes i1 to i2 in the knots table of this bspline curve. for each knot, the resulting multiplicity is limited to the degree of this curve. if m is negative, nothing is done. as a result, the poles and weights tables of this bspline curve are modified. warning it is forbidden to modify the multiplicity of the first or last knot of a non-periodic curve. be careful as geom2d does not protect against this. exceptions standard_outofrange if i1 or i2 is outside the bounds of the knots table.

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
		/**** md5 signature: c489f261510b3eb2aa6636487e7bc6f2 ****/
		%feature("compactdefaultargs") InsertKnot;
		%feature("autodoc", "Inserts a knot value in the sequence of knots. if <u> is an existing knot the multiplicity is increased by <m>. //! if u is not on the parameter range nothing is done. //! if the multiplicity is negative or null nothing is done. the new multiplicity is limited to the degree. //! the tolerance criterion for knots equality is the max of epsilon(u) and parametrictolerance. warning - if u is less than the first parameter or greater than the last parameter of this bspline curve, nothing is done. - if m is negative or null, nothing is done. - the multiplicity of a knot is limited to the degree of this bspline curve.

Parameters
----------
U: float
M: int,optional
	default value is 1
ParametricTolerance: float,optional
	default value is 0.0

Returns
-------
None
") InsertKnot;
		void InsertKnot(const Standard_Real U, const Standard_Integer M = 1, const Standard_Real ParametricTolerance = 0.0);

		/****************** InsertKnots ******************/
		/**** md5 signature: 6518beb27958c7c7882b20b52acc844f ****/
		%feature("compactdefaultargs") InsertKnots;
		%feature("autodoc", "Inserts the values of the array knots, with the respective multiplicities given by the array mults, into the knots table of this bspline curve. if a value of the array knots is an existing knot, its multiplicity is: - increased by m, if add is true, or - increased to m, if add is false (default value). the tolerance criterion used for knot equality is the larger of the values parametrictolerance (defaulted to 0.) and standard_real::epsilon(u), where u is the current knot value. warning - for a value of the array knots which is less than the first parameter or greater than the last parameter of this bspline curve, nothing is done. - for a value of the array mults which is negative or null, nothing is done. - the multiplicity of a knot is limited to the degree of this bspline curve.

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

		/****************** InsertPoleAfter ******************/
		/**** md5 signature: a0225ff33ac0c6773b12c61354e243fb ****/
		%feature("compactdefaultargs") InsertPoleAfter;
		%feature("autodoc", "The new pole is inserted after the pole of range index. if the curve was non rational it can become rational. //! raised if the b-spline is nonuniform or piecewisebezier or if weight <= 0.0 raised if index is not in the range [1, number of poles].

Parameters
----------
Index: int
P: gp_Pnt2d
Weight: float,optional
	default value is 1.0

Returns
-------
None
") InsertPoleAfter;
		void InsertPoleAfter(const Standard_Integer Index, const gp_Pnt2d & P, const Standard_Real Weight = 1.0);

		/****************** InsertPoleBefore ******************/
		/**** md5 signature: 0abad1f025d60dc0fad727465acffa3d ****/
		%feature("compactdefaultargs") InsertPoleBefore;
		%feature("autodoc", "The new pole is inserted before the pole of range index. if the curve was non rational it can become rational. //! raised if the b-spline is nonuniform or piecewisebezier or if weight <= 0.0 raised if index is not in the range [1, number of poles].

Parameters
----------
Index: int
P: gp_Pnt2d
Weight: float,optional
	default value is 1.0

Returns
-------
None
") InsertPoleBefore;
		void InsertPoleBefore(const Standard_Integer Index, const gp_Pnt2d & P, const Standard_Real Weight = 1.0);

		/****************** IsCN ******************/
		/**** md5 signature: 73c2d9ecdd776a5227f0665f0702fcb3 ****/
		%feature("compactdefaultargs") IsCN;
		%feature("autodoc", "Returns true if the degree of continuity of this bspline curve is at least n. a bspline curve is at least geomabs_c0. exceptions standard_rangeerror if n is negative.

Parameters
----------
N: int

Returns
-------
bool
") IsCN;
		Standard_Boolean IsCN(const Standard_Integer N);

		/****************** IsClosed ******************/
		/**** md5 signature: 00978070ec4cb5f00d1d002a8d5d3763 ****/
		%feature("compactdefaultargs") IsClosed;
		%feature("autodoc", "Returns true if the distance between the first point and the last point of the curve is lower or equal to resolution from package gp. warnings : the first and the last point can be different from the first pole and the last pole of the curve.

Returns
-------
bool
") IsClosed;
		Standard_Boolean IsClosed();

		/****************** IsG1 ******************/
		/**** md5 signature: 9f6daa5a840326c7c14dda9f95a957d1 ****/
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
		/**** md5 signature: 15e3ccfd3ad4ae42959489f7f64aa8ca ****/
		%feature("compactdefaultargs") IsPeriodic;
		%feature("autodoc", "Returns true if the curve is periodic.

Returns
-------
bool
") IsPeriodic;
		Standard_Boolean IsPeriodic();

		/****************** IsRational ******************/
		/**** md5 signature: fd4212ffa7bc30cde420e74a2c539434 ****/
		%feature("compactdefaultargs") IsRational;
		%feature("autodoc", "Returns true if the weights are not identical. the tolerance criterion is epsilon of the class real.

Returns
-------
bool
") IsRational;
		Standard_Boolean IsRational();

		/****************** Knot ******************/
		/**** md5 signature: 87780028b98a8253068f050487c4f4d5 ****/
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
		/**** md5 signature: 6b866e71367b1f5428eba6d3bcc36415 ****/
		%feature("compactdefaultargs") KnotDistribution;
		%feature("autodoc", "Returns nonuniform or uniform or quasiuniform or piecewisebezier. if all the knots differ by a positive constant from the preceding knot the bspline curve can be : - uniform if all the knots are of multiplicity 1, - quasiuniform if all the knots are of multiplicity 1 except for the first and last knot which are of multiplicity degree + 1, - piecewisebezier if the first and last knots have multiplicity degree + 1 and if interior knots have multiplicity degree a piecewise bezier with only two knots is a beziercurve. else the curve is non uniform. the tolerance criterion is epsilon from class real.

Returns
-------
GeomAbs_BSplKnotDistribution
") KnotDistribution;
		GeomAbs_BSplKnotDistribution KnotDistribution();

		/****************** KnotSequence ******************/
		/**** md5 signature: 16870e6acc7bcd815fb4e50aaa88ac5a ****/
		%feature("compactdefaultargs") KnotSequence;
		%feature("autodoc", "Returns the knots sequence. in this sequence the knots with a multiplicity greater than 1 are repeated. example : k = {k1, k1, k1, k2, k3, k3, k4, k4, k4} //! raised if k.lower() is less than number of first knot in knot sequence with repetitions or k.upper() is more than number of last knot in knot sequence with repetitions.

Parameters
----------
K: TColStd_Array1OfReal

Returns
-------
None
") KnotSequence;
		void KnotSequence(TColStd_Array1OfReal & K);

		/****************** KnotSequence ******************/
		/**** md5 signature: 4c1c40cd0e87a5ecb1feb1289774c756 ****/
		%feature("compactdefaultargs") KnotSequence;
		%feature("autodoc", "Returns the knots sequence. in this sequence the knots with a multiplicity greater than 1 are repeated. example : k = {k1, k1, k1, k2, k3, k3, k4, k4, k4}.

Returns
-------
TColStd_Array1OfReal
") KnotSequence;
		const TColStd_Array1OfReal & KnotSequence();

		/****************** Knots ******************/
		/**** md5 signature: 949cf09b8db41cbb8ab5188bcb475e56 ****/
		%feature("compactdefaultargs") Knots;
		%feature("autodoc", "Returns the knot values of the b-spline curve; //! raised k.lower() is less than number of first knot or k.upper() is more than number of last knot.

Parameters
----------
K: TColStd_Array1OfReal

Returns
-------
None
") Knots;
		void Knots(TColStd_Array1OfReal & K);

		/****************** Knots ******************/
		/**** md5 signature: 8001460ab922c7159116eb85f0693b97 ****/
		%feature("compactdefaultargs") Knots;
		%feature("autodoc", "Returns the knot values of the b-spline curve;.

Returns
-------
TColStd_Array1OfReal
") Knots;
		const TColStd_Array1OfReal & Knots();

		/****************** LastParameter ******************/
		/**** md5 signature: cb4925a2d4a451ceec8f6ad486530f9c ****/
		%feature("compactdefaultargs") LastParameter;
		%feature("autodoc", "Computes the parametric value of the end point of the curve. it is a knot value.

Returns
-------
float
") LastParameter;
		Standard_Real LastParameter();

		/****************** LastUKnotIndex ******************/
		/**** md5 signature: b5183e855ac73e665e20fe9cd9a25fef ****/
		%feature("compactdefaultargs") LastUKnotIndex;
		%feature("autodoc", "For a bspline curve the last parameter (which gives the end point of the curve) is a knot value but if the multiplicity of the last knot index is lower than degree + 1 it is not the last knot of the curve. this method computes the index of the knot corresponding to the last parameter.

Returns
-------
int
") LastUKnotIndex;
		Standard_Integer LastUKnotIndex();

		/****************** LocalD0 ******************/
		/**** md5 signature: 83fbb9b9e169718d7685988e9bde35ea ****/
		%feature("compactdefaultargs") LocalD0;
		%feature("autodoc", "Raised if fromk1 = tok2.

Parameters
----------
U: float
FromK1: int
ToK2: int
P: gp_Pnt2d

Returns
-------
None
") LocalD0;
		void LocalD0(const Standard_Real U, const Standard_Integer FromK1, const Standard_Integer ToK2, gp_Pnt2d & P);

		/****************** LocalD1 ******************/
		/**** md5 signature: 6c46a056b5398e28a972ad4c58e12469 ****/
		%feature("compactdefaultargs") LocalD1;
		%feature("autodoc", "Raised if the local continuity of the curve is not c1 between the knot k1 and the knot k2. raised if fromk1 = tok2.

Parameters
----------
U: float
FromK1: int
ToK2: int
P: gp_Pnt2d
V1: gp_Vec2d

Returns
-------
None
") LocalD1;
		void LocalD1(const Standard_Real U, const Standard_Integer FromK1, const Standard_Integer ToK2, gp_Pnt2d & P, gp_Vec2d & V1);

		/****************** LocalD2 ******************/
		/**** md5 signature: 5146b63c72d887c9270b9d8d1feca7a2 ****/
		%feature("compactdefaultargs") LocalD2;
		%feature("autodoc", "Raised if the local continuity of the curve is not c2 between the knot k1 and the knot k2. raised if fromk1 = tok2.

Parameters
----------
U: float
FromK1: int
ToK2: int
P: gp_Pnt2d
V1: gp_Vec2d
V2: gp_Vec2d

Returns
-------
None
") LocalD2;
		void LocalD2(const Standard_Real U, const Standard_Integer FromK1, const Standard_Integer ToK2, gp_Pnt2d & P, gp_Vec2d & V1, gp_Vec2d & V2);

		/****************** LocalD3 ******************/
		/**** md5 signature: e297e28149dce76d4dd660f8b2773ad2 ****/
		%feature("compactdefaultargs") LocalD3;
		%feature("autodoc", "Raised if the local continuity of the curve is not c3 between the knot k1 and the knot k2. raised if fromk1 = tok2.

Parameters
----------
U: float
FromK1: int
ToK2: int
P: gp_Pnt2d
V1: gp_Vec2d
V2: gp_Vec2d
V3: gp_Vec2d

Returns
-------
None
") LocalD3;
		void LocalD3(const Standard_Real U, const Standard_Integer FromK1, const Standard_Integer ToK2, gp_Pnt2d & P, gp_Vec2d & V1, gp_Vec2d & V2, gp_Vec2d & V3);

		/****************** LocalDN ******************/
		/**** md5 signature: c84ad6fc039323192b5b98f9e6fcff9d ****/
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
gp_Vec2d
") LocalDN;
		gp_Vec2d LocalDN(const Standard_Real U, const Standard_Integer FromK1, const Standard_Integer ToK2, const Standard_Integer N);

		/****************** LocalValue ******************/
		/**** md5 signature: ed7470d46e3742a4e6e1d135798f3606 ****/
		%feature("compactdefaultargs") LocalValue;
		%feature("autodoc", "Raised if fromk1 = tok2.

Parameters
----------
U: float
FromK1: int
ToK2: int

Returns
-------
gp_Pnt2d
") LocalValue;
		gp_Pnt2d LocalValue(const Standard_Real U, const Standard_Integer FromK1, const Standard_Integer ToK2);

		/****************** LocateU ******************/
		/**** md5 signature: d536ddd65ca3edfb5dd75e59f7417959 ****/
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
		/**** md5 signature: 985314a0ed62b597a9bdf0f555b97bed ****/
		%feature("compactdefaultargs") MaxDegree;
		%feature("autodoc", "Returns the value of the maximum degree of the normalized b-spline basis functions in this package.

Returns
-------
int
") MaxDegree;
		static Standard_Integer MaxDegree();

		/****************** MovePoint ******************/
		/**** md5 signature: af6e90bbfb9e4fa9e64cbb25b1f98b9b ****/
		%feature("compactdefaultargs") MovePoint;
		%feature("autodoc", "Moves the point of parameter u of this bspline curve to p. index1 and index2 are the indexes in the table of poles of this bspline curve of the first and last poles designated to be moved. firstmodifiedpole and lastmodifiedpole are the indexes of the first and last poles, which are effectively modified. in the event of incompatibility between index1, index2 and the value u: - no change is made to this bspline curve, and - the firstmodifiedpole and lastmodifiedpole are returned null. exceptions standard_outofrange if: - index1 is greater than or equal to index2, or - index1 or index2 is less than 1 or greater than the number of poles of this bspline curve.

Parameters
----------
U: float
P: gp_Pnt2d
Index1: int
Index2: int

Returns
-------
FirstModifiedPole: int
LastModifiedPole: int
") MovePoint;
		void MovePoint(const Standard_Real U, const gp_Pnt2d & P, const Standard_Integer Index1, const Standard_Integer Index2, Standard_Integer &OutValue, Standard_Integer &OutValue);

		/****************** MovePointAndTangent ******************/
		/**** md5 signature: b6aeba81982b81257d85b0fd1b73a01d ****/
		%feature("compactdefaultargs") MovePointAndTangent;
		%feature("autodoc", "Move a point with parameter u to p. and makes it tangent at u be tangent. startingcondition = -1 means first can move endingcondition = -1 means last point can move startingcondition = 0 means the first point cannot move endingcondition = 0 means the last point cannot move startingcondition = 1 means the first point and tangent cannot move endingcondition = 1 means the last point and tangent cannot move and so forth errorstatus != 0 means that there are not enought degree of freedom with the constrain to deform the curve accordingly.

Parameters
----------
U: float
P: gp_Pnt2d
Tangent: gp_Vec2d
Tolerance: float
StartingCondition: int
EndingCondition: int

Returns
-------
ErrorStatus: int
") MovePointAndTangent;
		void MovePointAndTangent(const Standard_Real U, const gp_Pnt2d & P, const gp_Vec2d & Tangent, const Standard_Real Tolerance, const Standard_Integer StartingCondition, const Standard_Integer EndingCondition, Standard_Integer &OutValue);

		/****************** Multiplicities ******************/
		/**** md5 signature: 5e4cb134cc2959735c59c531d6a8b490 ****/
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
		/**** md5 signature: cde561f92fd30b25ca2f1b1b8716c207 ****/
		%feature("compactdefaultargs") Multiplicities;
		%feature("autodoc", "Returns the multiplicity of the knots of the curve.

Returns
-------
TColStd_Array1OfInteger
") Multiplicities;
		const TColStd_Array1OfInteger & Multiplicities();

		/****************** Multiplicity ******************/
		/**** md5 signature: 0b00002ea9c75b6fa0f22b159f127931 ****/
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
		/**** md5 signature: ccda669299f8eba1ba0d3387af4c950e ****/
		%feature("compactdefaultargs") NbKnots;
		%feature("autodoc", "Returns the number of knots. this method returns the number of knot without repetition of multiple knots.

Returns
-------
int
") NbKnots;
		Standard_Integer NbKnots();

		/****************** NbPoles ******************/
		/**** md5 signature: 9a7d6d5f8a21c5833786e951bce99604 ****/
		%feature("compactdefaultargs") NbPoles;
		%feature("autodoc", "Returns the number of poles.

Returns
-------
int
") NbPoles;
		Standard_Integer NbPoles();

		/****************** PeriodicNormalization ******************/
		/**** md5 signature: ba1016bda06943eb982997be7f9da740 ****/
		%feature("compactdefaultargs") PeriodicNormalization;
		%feature("autodoc", "Computes the parameter normalized within the 'first' period of this bspline curve, if it is periodic: the returned value is in the range param1 and param1 + period, where: - param1 is the 'first parameter', and - period the period of this bspline curve. note: if this curve is not periodic, u is not modified.

Parameters
----------

Returns
-------
U: float
") PeriodicNormalization;
		void PeriodicNormalization(Standard_Real &OutValue);

		/****************** Pole ******************/
		/**** md5 signature: e119f9db1ceed9e1a493a153273d9dda ****/
		%feature("compactdefaultargs") Pole;
		%feature("autodoc", "Returns the pole of range index. raised if index < 1 or index > nbpoles.

Parameters
----------
Index: int

Returns
-------
gp_Pnt2d
") Pole;
		const gp_Pnt2d Pole(const Standard_Integer Index);

		/****************** Poles ******************/
		/**** md5 signature: b561a93701d8426c87d2ab571d9b7d51 ****/
		%feature("compactdefaultargs") Poles;
		%feature("autodoc", "Returns the poles of the b-spline curve; //! raised if the length of p is not equal to the number of poles.

Parameters
----------
P: TColgp_Array1OfPnt2d

Returns
-------
None
") Poles;
		void Poles(TColgp_Array1OfPnt2d & P);

		/****************** Poles ******************/
		/**** md5 signature: 98d66f9097e11406a5b5ca34bda9e5bb ****/
		%feature("compactdefaultargs") Poles;
		%feature("autodoc", "Returns the poles of the b-spline curve;.

Returns
-------
TColgp_Array1OfPnt2d
") Poles;
		const TColgp_Array1OfPnt2d & Poles();

		/****************** RemoveKnot ******************/
		/**** md5 signature: 9210db71a77261be541bbc23355610eb ****/
		%feature("compactdefaultargs") RemoveKnot;
		%feature("autodoc", "Reduces the multiplicity of the knot of index index to m. if m is equal to 0, the knot is removed. with a modification of this type, the array of poles is also modified. two different algorithms are systematically used to compute the new poles of the curve. if, for each pole, the distance between the pole calculated using the first algorithm and the same pole calculated using the second algorithm, is less than tolerance, this ensures that the curve is not modified by more than tolerance. under these conditions, true is returned; otherwise, false is returned. a low tolerance is used to prevent modification of the curve. a high tolerance is used to 'smooth' the curve. exceptions standard_outofrange if index is outside the bounds of the knots table.

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

		/****************** RemovePole ******************/
		/**** md5 signature: b488f4ba1aa92b1c805329ca2c5bc2e2 ****/
		%feature("compactdefaultargs") RemovePole;
		%feature("autodoc", "Removes the pole of range index if the curve was rational it can become non rational. //! raised if the b-spline is nonuniform or piecewisebezier. raised if the number of poles of the b-spline curve is lower or equal to 2 before removing. raised if index is not in the range [1, number of poles].

Parameters
----------
Index: int

Returns
-------
None
") RemovePole;
		void RemovePole(const Standard_Integer Index);

		/****************** Resolution ******************/
		/**** md5 signature: 852b2ec8453b5312cb01b93a4f3180b6 ****/
		%feature("compactdefaultargs") Resolution;
		%feature("autodoc", "Computes for this bspline curve the parametric tolerance utolerance for a given tolerance tolerance3d (relative to dimensions in the plane). if f(t) is the equation of this bspline curve, utolerance ensures that: | t1 - t0| < utolerance ===> |f(t1) - f(t0)| < toleranceuv.

Parameters
----------
ToleranceUV: float

Returns
-------
UTolerance: float
") Resolution;
		void Resolution(const Standard_Real ToleranceUV, Standard_Real &OutValue);

		/****************** Reverse ******************/
		/**** md5 signature: bff3d53d1cf0b268b7de85021a2bf3c4 ****/
		%feature("compactdefaultargs") Reverse;
		%feature("autodoc", "Reverses the orientation of this bspline curve. as a result - the knots and poles tables are modified; - the start point of the initial curve becomes the end point of the reversed curve; - the end point of the initial curve becomes the start point of the reversed curve.

Returns
-------
None
") Reverse;
		void Reverse();

		/****************** ReversedParameter ******************/
		/**** md5 signature: 382721d5a4ea752fecc12f03ab0de9a1 ****/
		%feature("compactdefaultargs") ReversedParameter;
		%feature("autodoc", "Computes the parameter on the reversed curve for the point of parameter u on this bspline curve. the returned value is: ufirst + ulast - u, where ufirst and ulast are the values of the first and last parameters of this bspline curve.

Parameters
----------
U: float

Returns
-------
float
") ReversedParameter;
		Standard_Real ReversedParameter(const Standard_Real U);

		/****************** Segment ******************/
		/**** md5 signature: 26df5d98b25171a395c66397318dcefc ****/
		%feature("compactdefaultargs") Segment;
		%feature("autodoc", "Modifies this bspline curve by segmenting it between u1 and u2. either of these values can be outside the bounds of the curve, but u2 must be greater than u1. all data structure tables of this bspline curve are modified, but the knots located between u1 and u2 are retained. the degree of the curve is not modified. //! parameter thetolerance defines the possible proximity of the segment boundaries and b-spline knots to treat them as equal. //! warnings : even if <self> is not closed it can become closed after the segmentation for example if u1 or u2 are out of the bounds of the curve <self> or if the curve makes loop. after the segmentation the length of a curve can be null. - the segmentation of a periodic curve over an interval corresponding to its period generates a non-periodic curve with equivalent geometry. exceptions standard_domainerror if u2 is less than u1. raises if u2 < u1. standard_domainerror if u2 - u1 exceeds the period for periodic curves. i.e. ((u2 - u1) - period) > precision::pconfusion().

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
		/**** md5 signature: 24248dddb124af2118f7043ae254694e ****/
		%feature("compactdefaultargs") SetKnot;
		%feature("autodoc", "Modifies this bspline curve by assigning the value k to the knot of index index in the knots table. this is a relatively local modification because k must be such that: knots(index - 1) < k < knots(index + 1) exceptions standard_constructionerror if: - k is not such that: knots(index - 1) < k < knots(index + 1) - m is greater than the degree of this bspline curve or lower than the previous multiplicity of knot of index index in the knots table. standard_outofrange if index is outside the bounds of the knots table.

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
		/**** md5 signature: 12123e73421d28330eec5dae317ac18f ****/
		%feature("compactdefaultargs") SetKnot;
		%feature("autodoc", "Modifies this bspline curve by assigning the value k to the knot of index index in the knots table. this is a relatively local modification because k must be such that: knots(index - 1) < k < knots(index + 1) the second syntax allows you also to increase the multiplicity of the knot to m (but it is not possible to decrease the multiplicity of the knot with this function). exceptions standard_constructionerror if: - k is not such that: knots(index - 1) < k < knots(index + 1) - m is greater than the degree of this bspline curve or lower than the previous multiplicity of knot of index index in the knots table. standard_outofrange if index is outside the bounds of the knots table.

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
		/**** md5 signature: d319c647ea235edd171c661a477e0338 ****/
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
		/**** md5 signature: ccfbd171d2b38df3531b77ecbc51dcae ****/
		%feature("compactdefaultargs") SetNotPeriodic;
		%feature("autodoc", "Changes this bspline curve into a non-periodic curve. if this curve is already non-periodic, it is not modified. note that the poles and knots tables are modified. warning if this curve is periodic, as the multiplicity of the first and last knots is not modified, and is not equal to degree + 1, where degree is the degree of this bspline curve, the start and end points of the curve are not its first and last poles.

Returns
-------
None
") SetNotPeriodic;
		void SetNotPeriodic();

		/****************** SetOrigin ******************/
		/**** md5 signature: bcb4756c4db11bf7ed3d05d2f98659f0 ****/
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

		/****************** SetPeriodic ******************/
		/**** md5 signature: 3d498279f2dd83a2ab9aa88181da253f ****/
		%feature("compactdefaultargs") SetPeriodic;
		%feature("autodoc", "Changes this bspline curve into a periodic curve. to become periodic, the curve must first be closed. next, the knot sequence must be periodic. for this, firstuknotindex and lastuknotindex are used to compute i1 and i2, the indexes in the knots array of the knots corresponding to the first and last parameters of this bspline curve. the period is therefore knot(i2) - knot(i1). consequently, the knots and poles tables are modified. exceptions standard_constructionerror if this bspline curve is not closed.

Returns
-------
None
") SetPeriodic;
		void SetPeriodic();

		/****************** SetPole ******************/
		/**** md5 signature: af2dcfab29f838d60e85bd9962d96c79 ****/
		%feature("compactdefaultargs") SetPole;
		%feature("autodoc", "Modifies this bspline curve by assigning p to the pole of index index in the poles table. exceptions standard_outofrange if index is outside the bounds of the poles table. standard_constructionerror if weight is negative or null.

Parameters
----------
Index: int
P: gp_Pnt2d

Returns
-------
None
") SetPole;
		void SetPole(const Standard_Integer Index, const gp_Pnt2d & P);

		/****************** SetPole ******************/
		/**** md5 signature: 9e03d974fa49d2a4e0ea176311d3b25c ****/
		%feature("compactdefaultargs") SetPole;
		%feature("autodoc", "Modifies this bspline curve by assigning p to the pole of index index in the poles table. the second syntax also allows you to modify the weight of the modified pole, which becomes weight. in this case, if this bspline curve is non-rational, it can become rational and vice versa. exceptions standard_outofrange if index is outside the bounds of the poles table. standard_constructionerror if weight is negative or null.

Parameters
----------
Index: int
P: gp_Pnt2d
Weight: float

Returns
-------
None
") SetPole;
		void SetPole(const Standard_Integer Index, const gp_Pnt2d & P, const Standard_Real Weight);

		/****************** SetWeight ******************/
		/**** md5 signature: 4e7aa00d12e09e9b776d4bf66f07ecec ****/
		%feature("compactdefaultargs") SetWeight;
		%feature("autodoc", "Assigns the weight weight to the pole of index index of the poles table. if the curve was non rational it can become rational. if the curve was rational it can become non rational. exceptions standard_outofrange if index is outside the bounds of the poles table. standard_constructionerror if weight is negative or null.

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
		/**** md5 signature: 75fa6f4dbe3ec2b82daa06e6b66df23a ****/
		%feature("compactdefaultargs") StartPoint;
		%feature("autodoc", "Returns the start point of the curve. warnings : this point is different from the first pole of the curve if the multiplicity of the first knot is lower than degree.

Returns
-------
gp_Pnt2d
") StartPoint;
		gp_Pnt2d StartPoint();

		/****************** Transform ******************/
		/**** md5 signature: 45c8e1b1d6196f6efcf8f7b40a0fb1f5 ****/
		%feature("compactdefaultargs") Transform;
		%feature("autodoc", "Applies the transformation t to this bspline curve.

Parameters
----------
T: gp_Trsf2d

Returns
-------
None
") Transform;
		void Transform(const gp_Trsf2d & T);

		/****************** Weight ******************/
		/**** md5 signature: 70cf193bf7498ec22102a906ea9db6f5 ****/
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
		/**** md5 signature: dd63733e96eafbaacbd2d7b600471c30 ****/
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
		/**** md5 signature: 761d13c1de73ab225be280fb8ae764b6 ****/
		%feature("compactdefaultargs") Weights;
		%feature("autodoc", "Returns the weights of the b-spline curve;.

Returns
-------
TColStd_Array1OfReal *
") Weights;
		const TColStd_Array1OfReal * Weights();

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
		/****************** Geom2d_BezierCurve ******************/
		/**** md5 signature: 188c7bb3dba855933398961b6e6e299e ****/
		%feature("compactdefaultargs") Geom2d_BezierCurve;
		%feature("autodoc", "Creates a non rational bezier curve with a set of poles : curvepoles. the weights are defaulted to all being 1. raises constructionerror if the number of poles is greater than maxdegree + 1 or lower than 2.

Parameters
----------
CurvePoles: TColgp_Array1OfPnt2d

Returns
-------
None
") Geom2d_BezierCurve;
		 Geom2d_BezierCurve(const TColgp_Array1OfPnt2d & CurvePoles);

		/****************** Geom2d_BezierCurve ******************/
		/**** md5 signature: 53102d2aeb23ea5b4bee3360eb1a9d59 ****/
		%feature("compactdefaultargs") Geom2d_BezierCurve;
		%feature("autodoc", "Creates a rational bezier curve with the set of poles curvepoles and the set of weights poleweights . if all the weights are identical the curve is considered as non rational. raises constructionerror if the number of poles is greater than maxdegree + 1 or lower than 2 or curvepoles and curveweights have not the same length or one weight value is lower or equal to resolution from package gp.

Parameters
----------
CurvePoles: TColgp_Array1OfPnt2d
PoleWeights: TColStd_Array1OfReal

Returns
-------
None
") Geom2d_BezierCurve;
		 Geom2d_BezierCurve(const TColgp_Array1OfPnt2d & CurvePoles, const TColStd_Array1OfReal & PoleWeights);

		/****************** Continuity ******************/
		/**** md5 signature: 9381b370dfdd50af7f1b79ce202f0c6f ****/
		%feature("compactdefaultargs") Continuity;
		%feature("autodoc", "Returns geomabs_cn, which is the continuity of any bezier curve.

Returns
-------
GeomAbs_Shape
") Continuity;
		GeomAbs_Shape Continuity();

		/****************** Copy ******************/
		/**** md5 signature: e14f86fd39aef4f82b5296205cbd25eb ****/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "Creates a new object which is a copy of this bezier curve.

Returns
-------
opencascade::handle<Geom2d_Geometry>
") Copy;
		opencascade::handle<Geom2d_Geometry> Copy();

		/****************** D0 ******************/
		/**** md5 signature: 01a5234aae6db090351bac35b3718fd9 ****/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "No available documentation.

Parameters
----------
U: float
P: gp_Pnt2d

Returns
-------
None
") D0;
		void D0(const Standard_Real U, gp_Pnt2d & P);

		/****************** D1 ******************/
		/**** md5 signature: 78ab988905058ca54a64c0ab51a90e46 ****/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "No available documentation.

Parameters
----------
U: float
P: gp_Pnt2d
V1: gp_Vec2d

Returns
-------
None
") D1;
		void D1(const Standard_Real U, gp_Pnt2d & P, gp_Vec2d & V1);

		/****************** D2 ******************/
		/**** md5 signature: acc8c0955596bb0bf809102736ad1124 ****/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "No available documentation.

Parameters
----------
U: float
P: gp_Pnt2d
V1: gp_Vec2d
V2: gp_Vec2d

Returns
-------
None
") D2;
		void D2(const Standard_Real U, gp_Pnt2d & P, gp_Vec2d & V1, gp_Vec2d & V2);

		/****************** D3 ******************/
		/**** md5 signature: 28315b7efe2f6c64fe9497aa5c5ddaf6 ****/
		%feature("compactdefaultargs") D3;
		%feature("autodoc", "No available documentation.

Parameters
----------
U: float
P: gp_Pnt2d
V1: gp_Vec2d
V2: gp_Vec2d
V3: gp_Vec2d

Returns
-------
None
") D3;
		void D3(const Standard_Real U, gp_Pnt2d & P, gp_Vec2d & V1, gp_Vec2d & V2, gp_Vec2d & V3);

		/****************** DN ******************/
		/**** md5 signature: a05d2f76912764cef5ac7bb40ebda3d7 ****/
		%feature("compactdefaultargs") DN;
		%feature("autodoc", "For this bezier curve, computes - the point p of parameter u, or - the point p and one or more of the following values: - v1, the first derivative vector, - v2, the second derivative vector, - v3, the third derivative vector. note: the parameter u can be outside the bounds of the curve. raises rangeerror if n < 1.

Parameters
----------
U: float
N: int

Returns
-------
gp_Vec2d
") DN;
		gp_Vec2d DN(const Standard_Real U, const Standard_Integer N);

		/****************** Degree ******************/
		/**** md5 signature: e3276df1ce733e2c8e940db548a26d03 ****/
		%feature("compactdefaultargs") Degree;
		%feature("autodoc", "Returns the polynomial degree of the curve. it is the number of poles less one. in this package the degree of a bezier curve cannot be greater than 'maxdegree'.

Returns
-------
int
") Degree;
		Standard_Integer Degree();

		/****************** EndPoint ******************/
		/**** md5 signature: 728da2f708cdaeb8d7659531afcee1a8 ****/
		%feature("compactdefaultargs") EndPoint;
		%feature("autodoc", "Returns the end point or start point of this bezier curve.

Returns
-------
gp_Pnt2d
") EndPoint;
		gp_Pnt2d EndPoint();

		/****************** FirstParameter ******************/
		/**** md5 signature: eb9ebe94572bd67588fe8811eac261fb ****/
		%feature("compactdefaultargs") FirstParameter;
		%feature("autodoc", "Returns the value of the first parameter of this bezier curve. this is 0.0, which gives the start point of this bezier curve.

Returns
-------
float
") FirstParameter;
		Standard_Real FirstParameter();

		/****************** Increase ******************/
		/**** md5 signature: e664d16cbd2a07ca42f612f3b1c0f48b ****/
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
		/**** md5 signature: a0225ff33ac0c6773b12c61354e243fb ****/
		%feature("compactdefaultargs") InsertPoleAfter;
		%feature("autodoc", "Inserts a pole with its weight in the set of poles after the pole of range index. if the curve was non rational it can become rational if all the weights are not identical. raised if index is not in the range [0, nbpoles] //! raised if the resulting number of poles is greater than maxdegree + 1.

Parameters
----------
Index: int
P: gp_Pnt2d
Weight: float,optional
	default value is 1.0

Returns
-------
None
") InsertPoleAfter;
		void InsertPoleAfter(const Standard_Integer Index, const gp_Pnt2d & P, const Standard_Real Weight = 1.0);

		/****************** InsertPoleBefore ******************/
		/**** md5 signature: 0abad1f025d60dc0fad727465acffa3d ****/
		%feature("compactdefaultargs") InsertPoleBefore;
		%feature("autodoc", "Inserts a pole with its weight in the set of poles after the pole of range index. if the curve was non rational it can become rational if all the weights are not identical. raised if index is not in the range [1, nbpoles+1] //! raised if the resulting number of poles is greater than maxdegree + 1.

Parameters
----------
Index: int
P: gp_Pnt2d
Weight: float,optional
	default value is 1.0

Returns
-------
None
") InsertPoleBefore;
		void InsertPoleBefore(const Standard_Integer Index, const gp_Pnt2d & P, const Standard_Real Weight = 1.0);

		/****************** IsCN ******************/
		/**** md5 signature: 73c2d9ecdd776a5227f0665f0702fcb3 ****/
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
		/**** md5 signature: 00978070ec4cb5f00d1d002a8d5d3763 ****/
		%feature("compactdefaultargs") IsClosed;
		%feature("autodoc", "Returns true if the distance between the first point and the last point of the curve is lower or equal to the resolution from package gp.

Returns
-------
bool
") IsClosed;
		Standard_Boolean IsClosed();

		/****************** IsPeriodic ******************/
		/**** md5 signature: 15e3ccfd3ad4ae42959489f7f64aa8ca ****/
		%feature("compactdefaultargs") IsPeriodic;
		%feature("autodoc", "Returns false. a beziercurve cannot be periodic in this package.

Returns
-------
bool
") IsPeriodic;
		Standard_Boolean IsPeriodic();

		/****************** IsRational ******************/
		/**** md5 signature: fd4212ffa7bc30cde420e74a2c539434 ****/
		%feature("compactdefaultargs") IsRational;
		%feature("autodoc", "Returns false if all the weights are identical. the tolerance criterion is resolution from package gp.

Returns
-------
bool
") IsRational;
		Standard_Boolean IsRational();

		/****************** LastParameter ******************/
		/**** md5 signature: cb4925a2d4a451ceec8f6ad486530f9c ****/
		%feature("compactdefaultargs") LastParameter;
		%feature("autodoc", "Returns the value of the last parameter of this bezier curve. this is 1.0, which gives the end point of this bezier curve.

Returns
-------
float
") LastParameter;
		Standard_Real LastParameter();

		/****************** MaxDegree ******************/
		/**** md5 signature: 985314a0ed62b597a9bdf0f555b97bed ****/
		%feature("compactdefaultargs") MaxDegree;
		%feature("autodoc", "Returns the value of the maximum polynomial degree of a beziercurve. this value is 25.

Returns
-------
int
") MaxDegree;
		static Standard_Integer MaxDegree();

		/****************** NbPoles ******************/
		/**** md5 signature: 9a7d6d5f8a21c5833786e951bce99604 ****/
		%feature("compactdefaultargs") NbPoles;
		%feature("autodoc", "Returns the number of poles for this bezier curve.

Returns
-------
int
") NbPoles;
		Standard_Integer NbPoles();

		/****************** Pole ******************/
		/**** md5 signature: e119f9db1ceed9e1a493a153273d9dda ****/
		%feature("compactdefaultargs") Pole;
		%feature("autodoc", "Returns the pole of range index. raised if index is not in the range [1, nbpoles].

Parameters
----------
Index: int

Returns
-------
gp_Pnt2d
") Pole;
		const gp_Pnt2d Pole(const Standard_Integer Index);

		/****************** Poles ******************/
		/**** md5 signature: b561a93701d8426c87d2ab571d9b7d51 ****/
		%feature("compactdefaultargs") Poles;
		%feature("autodoc", "Returns all the poles of the curve. //! raised if the length of p is not equal to the number of poles.

Parameters
----------
P: TColgp_Array1OfPnt2d

Returns
-------
None
") Poles;
		void Poles(TColgp_Array1OfPnt2d & P);

		/****************** Poles ******************/
		/**** md5 signature: 72f4f2993510e7a04b798a41a156cedf ****/
		%feature("compactdefaultargs") Poles;
		%feature("autodoc", "Returns all the poles of the curve.

Returns
-------
TColgp_Array1OfPnt2d
") Poles;
		const TColgp_Array1OfPnt2d & Poles();

		/****************** RemovePole ******************/
		/**** md5 signature: b488f4ba1aa92b1c805329ca2c5bc2e2 ****/
		%feature("compactdefaultargs") RemovePole;
		%feature("autodoc", "Removes the pole of range index. if the curve was rational it can become non rational. raised if index is not in the range [1, nbpoles].

Parameters
----------
Index: int

Returns
-------
None
") RemovePole;
		void RemovePole(const Standard_Integer Index);

		/****************** Resolution ******************/
		/**** md5 signature: 852b2ec8453b5312cb01b93a4f3180b6 ****/
		%feature("compactdefaultargs") Resolution;
		%feature("autodoc", "Computes for this bezier curve the parametric tolerance utolerance for a given tolerance tolerance3d (relative to dimensions in the plane). if f(t) is the equation of this bezier curve, utolerance ensures that | t1 - t0| < utolerance ===> |f(t1) - f(t0)| < toleranceuv.

Parameters
----------
ToleranceUV: float

Returns
-------
UTolerance: float
") Resolution;
		void Resolution(const Standard_Real ToleranceUV, Standard_Real &OutValue);

		/****************** Reverse ******************/
		/**** md5 signature: bff3d53d1cf0b268b7de85021a2bf3c4 ****/
		%feature("compactdefaultargs") Reverse;
		%feature("autodoc", "Reverses the direction of parametrization of <self> value (newu) = value (1 - oldu).

Returns
-------
None
") Reverse;
		void Reverse();

		/****************** ReversedParameter ******************/
		/**** md5 signature: 382721d5a4ea752fecc12f03ab0de9a1 ****/
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
		/**** md5 signature: fb72a1522f77fa9f134af7f8bf81def8 ****/
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
		/**** md5 signature: af2dcfab29f838d60e85bd9962d96c79 ****/
		%feature("compactdefaultargs") SetPole;
		%feature("autodoc", "Substitutes the pole of range index with p. if the curve <self> is rational the weight of range index is not modified. raised if index is not in the range [1, nbpoles].

Parameters
----------
Index: int
P: gp_Pnt2d

Returns
-------
None
") SetPole;
		void SetPole(const Standard_Integer Index, const gp_Pnt2d & P);

		/****************** SetPole ******************/
		/**** md5 signature: 9e03d974fa49d2a4e0ea176311d3b25c ****/
		%feature("compactdefaultargs") SetPole;
		%feature("autodoc", "Substitutes the pole and the weights of range index. if the curve <self> is not rational it can become rational if all the weights are not identical. if the curve was rational it can become non rational if all the weights are identical. raised if index is not in the range [1, nbpoles] raised if weight <= resolution from package gp.

Parameters
----------
Index: int
P: gp_Pnt2d
Weight: float

Returns
-------
None
") SetPole;
		void SetPole(const Standard_Integer Index, const gp_Pnt2d & P, const Standard_Real Weight);

		/****************** SetWeight ******************/
		/**** md5 signature: 4e7aa00d12e09e9b776d4bf66f07ecec ****/
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
		/**** md5 signature: 75fa6f4dbe3ec2b82daa06e6b66df23a ****/
		%feature("compactdefaultargs") StartPoint;
		%feature("autodoc", "Returns value (u=1), it is the first control point of the curve.

Returns
-------
gp_Pnt2d
") StartPoint;
		gp_Pnt2d StartPoint();

		/****************** Transform ******************/
		/**** md5 signature: 45c8e1b1d6196f6efcf8f7b40a0fb1f5 ****/
		%feature("compactdefaultargs") Transform;
		%feature("autodoc", "Applies the transformation t to this bezier curve.

Parameters
----------
T: gp_Trsf2d

Returns
-------
None
") Transform;
		void Transform(const gp_Trsf2d & T);

		/****************** Weight ******************/
		/**** md5 signature: 70cf193bf7498ec22102a906ea9db6f5 ****/
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
		/**** md5 signature: dd63733e96eafbaacbd2d7b600471c30 ****/
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
		/**** md5 signature: 7c14f36f7b022f971de3890428e2025c ****/
		%feature("compactdefaultargs") Weights;
		%feature("autodoc", "Returns all the weights of the curve.

Returns
-------
TColStd_Array1OfReal *
") Weights;
		const TColStd_Array1OfReal * Weights();

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
		/****************** Geom2d_Circle ******************/
		/**** md5 signature: 6022589d38b5b6ff091db5d9d03d3760 ****/
		%feature("compactdefaultargs") Geom2d_Circle;
		%feature("autodoc", "Constructs a circle by conversion of the gp_circ2d circle c.

Parameters
----------
C: gp_Circ2d

Returns
-------
None
") Geom2d_Circle;
		 Geom2d_Circle(const gp_Circ2d & C);

		/****************** Geom2d_Circle ******************/
		/**** md5 signature: 4785dd22e356e71f926b6b27c51cf4fa ****/
		%feature("compactdefaultargs") Geom2d_Circle;
		%feature("autodoc", "Constructs a circle of radius radius, whose center is the origin of axis a; a is the 'x axis' of the local coordinate system of the circle; this coordinate system is direct if sense is true (default value) or indirect if sense is false. note: it is possible to create a circle where radius is equal to 0.0. exceptions standard_constructionerror if radius is negative.

Parameters
----------
A: gp_Ax2d
Radius: float
Sense: bool,optional
	default value is Standard_True

Returns
-------
None
") Geom2d_Circle;
		 Geom2d_Circle(const gp_Ax2d & A, const Standard_Real Radius, const Standard_Boolean Sense = Standard_True);

		/****************** Geom2d_Circle ******************/
		/**** md5 signature: b8bc0bc5db97c4d36142c49770b10d11 ****/
		%feature("compactdefaultargs") Geom2d_Circle;
		%feature("autodoc", "Constructs a circle of radius radius, where the coordinate system a locates the circle and defines its orientation in the plane such that: - the center of the circle is the origin of a, - the orientation (direct or indirect) of a gives the orientation of the circle.

Parameters
----------
A: gp_Ax22d
Radius: float

Returns
-------
None
") Geom2d_Circle;
		 Geom2d_Circle(const gp_Ax22d & A, const Standard_Real Radius);

		/****************** Circ2d ******************/
		/**** md5 signature: 0bb74df9a406e7f4dc0a135d1a47fd6d ****/
		%feature("compactdefaultargs") Circ2d;
		%feature("autodoc", "Returns the non persistent circle from gp with the same geometric properties as <self>.

Returns
-------
gp_Circ2d
") Circ2d;
		gp_Circ2d Circ2d();

		/****************** Copy ******************/
		/**** md5 signature: e14f86fd39aef4f82b5296205cbd25eb ****/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "Creates a new object which is a copy of this circle.

Returns
-------
opencascade::handle<Geom2d_Geometry>
") Copy;
		opencascade::handle<Geom2d_Geometry> Copy();

		/****************** D0 ******************/
		/**** md5 signature: 01a5234aae6db090351bac35b3718fd9 ****/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "Returns in p the point of parameter u. p = c + r * cos (u) * xdir + r * sin (u) * ydir where c is the center of the circle , xdir the xdirection and ydir the ydirection of the circle's local coordinate system.

Parameters
----------
U: float
P: gp_Pnt2d

Returns
-------
None
") D0;
		void D0(const Standard_Real U, gp_Pnt2d & P);

		/****************** D1 ******************/
		/**** md5 signature: 78ab988905058ca54a64c0ab51a90e46 ****/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "Returns the point p of parameter u and the first derivative v1.

Parameters
----------
U: float
P: gp_Pnt2d
V1: gp_Vec2d

Returns
-------
None
") D1;
		void D1(const Standard_Real U, gp_Pnt2d & P, gp_Vec2d & V1);

		/****************** D2 ******************/
		/**** md5 signature: acc8c0955596bb0bf809102736ad1124 ****/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "Returns the point p of parameter u, the first and second derivatives v1 and v2.

Parameters
----------
U: float
P: gp_Pnt2d
V1: gp_Vec2d
V2: gp_Vec2d

Returns
-------
None
") D2;
		void D2(const Standard_Real U, gp_Pnt2d & P, gp_Vec2d & V1, gp_Vec2d & V2);

		/****************** D3 ******************/
		/**** md5 signature: 28315b7efe2f6c64fe9497aa5c5ddaf6 ****/
		%feature("compactdefaultargs") D3;
		%feature("autodoc", "Returns the point p of parameter u, the first second and third derivatives v1 v2 and v3.

Parameters
----------
U: float
P: gp_Pnt2d
V1: gp_Vec2d
V2: gp_Vec2d
V3: gp_Vec2d

Returns
-------
None
") D3;
		void D3(const Standard_Real U, gp_Pnt2d & P, gp_Vec2d & V1, gp_Vec2d & V2, gp_Vec2d & V3);

		/****************** DN ******************/
		/**** md5 signature: a05d2f76912764cef5ac7bb40ebda3d7 ****/
		%feature("compactdefaultargs") DN;
		%feature("autodoc", "For the point of parameter u of this circle, computes the vector corresponding to the nth derivative. exceptions: standard_rangeerror if n is less than 1.

Parameters
----------
U: float
N: int

Returns
-------
gp_Vec2d
") DN;
		gp_Vec2d DN(const Standard_Real U, const Standard_Integer N);

		/****************** Eccentricity ******************/
		/**** md5 signature: 7cc0cae0413ab4c2d528df125e42b57e ****/
		%feature("compactdefaultargs") Eccentricity;
		%feature("autodoc", "Returns 0., which is the eccentricity of any circle.

Returns
-------
float
") Eccentricity;
		Standard_Real Eccentricity();

		/****************** FirstParameter ******************/
		/**** md5 signature: eb9ebe94572bd67588fe8811eac261fb ****/
		%feature("compactdefaultargs") FirstParameter;
		%feature("autodoc", "Returns 0.0.

Returns
-------
float
") FirstParameter;
		Standard_Real FirstParameter();

		/****************** IsClosed ******************/
		/**** md5 signature: 00978070ec4cb5f00d1d002a8d5d3763 ****/
		%feature("compactdefaultargs") IsClosed;
		%feature("autodoc", "Returns true.

Returns
-------
bool
") IsClosed;
		Standard_Boolean IsClosed();

		/****************** IsPeriodic ******************/
		/**** md5 signature: 15e3ccfd3ad4ae42959489f7f64aa8ca ****/
		%feature("compactdefaultargs") IsPeriodic;
		%feature("autodoc", "Returns true. the period of a circle is 2.*pi.

Returns
-------
bool
") IsPeriodic;
		Standard_Boolean IsPeriodic();

		/****************** LastParameter ******************/
		/**** md5 signature: cb4925a2d4a451ceec8f6ad486530f9c ****/
		%feature("compactdefaultargs") LastParameter;
		%feature("autodoc", "Returns 2*pi.

Returns
-------
float
") LastParameter;
		Standard_Real LastParameter();

		/****************** Radius ******************/
		/**** md5 signature: 506a8dc1140a54bd4146c24bb5357fbf ****/
		%feature("compactdefaultargs") Radius;
		%feature("autodoc", "Returns the radius of this circle.

Returns
-------
float
") Radius;
		Standard_Real Radius();

		/****************** ReversedParameter ******************/
		/**** md5 signature: 382721d5a4ea752fecc12f03ab0de9a1 ****/
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

		/****************** SetCirc2d ******************/
		/**** md5 signature: 74dd850444d6bc87e568eef6a8a6fbcb ****/
		%feature("compactdefaultargs") SetCirc2d;
		%feature("autodoc", "Converts the gp_circ2d circle c into this circle.

Parameters
----------
C: gp_Circ2d

Returns
-------
None
") SetCirc2d;
		void SetCirc2d(const gp_Circ2d & C);

		/****************** SetRadius ******************/
		/**** md5 signature: 452d48523583bd00e647880614077dd6 ****/
		%feature("compactdefaultargs") SetRadius;
		%feature("autodoc", "No available documentation.

Parameters
----------
R: float

Returns
-------
None
") SetRadius;
		void SetRadius(const Standard_Real R);

		/****************** Transform ******************/
		/**** md5 signature: 45c8e1b1d6196f6efcf8f7b40a0fb1f5 ****/
		%feature("compactdefaultargs") Transform;
		%feature("autodoc", "Applies the transformation t to this circle.

Parameters
----------
T: gp_Trsf2d

Returns
-------
None
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
		/****************** Geom2d_Ellipse ******************/
		/**** md5 signature: b0fb699e6ae3c1e50bdb2f1ad25e29bc ****/
		%feature("compactdefaultargs") Geom2d_Ellipse;
		%feature("autodoc", "Creates an ellipse by conversion of the gp_elips2d ellipse e.

Parameters
----------
E: gp_Elips2d

Returns
-------
None
") Geom2d_Ellipse;
		 Geom2d_Ellipse(const gp_Elips2d & E);

		/****************** Geom2d_Ellipse ******************/
		/**** md5 signature: 3068be63131be96576d5e4041d516612 ****/
		%feature("compactdefaultargs") Geom2d_Ellipse;
		%feature("autodoc", "Creates an ellipse defined by its major and minor radii, majorradius and minorradius, and positioned in the plane by its major axis majoraxis; the center of the ellipse is the origin of majoraxis and the unit vector of majoraxis is the 'x direction' of the local coordinate system of the ellipse; this coordinate system is direct if sense is true (default value) or indirect if sense is false. warnings : it is not forbidden to create an ellipse with majorradius = minorradius. exceptions standard_constructionerror if: - majorradius is less than minorradius, or - minorradius is less than 0.

Parameters
----------
MajorAxis: gp_Ax2d
MajorRadius: float
MinorRadius: float
Sense: bool,optional
	default value is Standard_True

Returns
-------
None
") Geom2d_Ellipse;
		 Geom2d_Ellipse(const gp_Ax2d & MajorAxis, const Standard_Real MajorRadius, const Standard_Real MinorRadius, const Standard_Boolean Sense = Standard_True);

		/****************** Geom2d_Ellipse ******************/
		/**** md5 signature: 943e9414603dd4e937db3d8f4aa71832 ****/
		%feature("compactdefaultargs") Geom2d_Ellipse;
		%feature("autodoc", "Creates an ellipse defined by its major and minor radii, majorradius and minorradius, where the coordinate system axis locates the ellipse and defines its orientation in the plane such that: - the center of the ellipse is the origin of axis, - the 'x direction' of axis defines the major axis of the ellipse, - the 'y direction' of axis defines the minor axis of the ellipse, - the orientation of axis (direct or indirect) gives the orientation of the ellipse. warnings : it is not forbidden to create an ellipse with majorradius = minorradius. exceptions standard_constructionerror if: - majorradius is less than minorradius, or - minorradius is less than 0.

Parameters
----------
Axis: gp_Ax22d
MajorRadius: float
MinorRadius: float

Returns
-------
None
") Geom2d_Ellipse;
		 Geom2d_Ellipse(const gp_Ax22d & Axis, const Standard_Real MajorRadius, const Standard_Real MinorRadius);

		/****************** Copy ******************/
		/**** md5 signature: e14f86fd39aef4f82b5296205cbd25eb ****/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "Creates a new object which is a copy of this ellipse.

Returns
-------
opencascade::handle<Geom2d_Geometry>
") Copy;
		opencascade::handle<Geom2d_Geometry> Copy();

		/****************** D0 ******************/
		/**** md5 signature: 01a5234aae6db090351bac35b3718fd9 ****/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "Returns in p the point of parameter u. p = c + majorradius * cos (u) * xdir + minorradius * sin (u) * ydir where c is the center of the ellipse , xdir the direction of the 'xaxis' and 'ydir' the 'yaxis' of the ellipse.

Parameters
----------
U: float
P: gp_Pnt2d

Returns
-------
None
") D0;
		void D0(const Standard_Real U, gp_Pnt2d & P);

		/****************** D1 ******************/
		/**** md5 signature: 78ab988905058ca54a64c0ab51a90e46 ****/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "No available documentation.

Parameters
----------
U: float
P: gp_Pnt2d
V1: gp_Vec2d

Returns
-------
None
") D1;
		void D1(const Standard_Real U, gp_Pnt2d & P, gp_Vec2d & V1);

		/****************** D2 ******************/
		/**** md5 signature: acc8c0955596bb0bf809102736ad1124 ****/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "Returns the point p of parameter u. the vectors v1 and v2 are the first and second derivatives at this point.

Parameters
----------
U: float
P: gp_Pnt2d
V1: gp_Vec2d
V2: gp_Vec2d

Returns
-------
None
") D2;
		void D2(const Standard_Real U, gp_Pnt2d & P, gp_Vec2d & V1, gp_Vec2d & V2);

		/****************** D3 ******************/
		/**** md5 signature: 28315b7efe2f6c64fe9497aa5c5ddaf6 ****/
		%feature("compactdefaultargs") D3;
		%feature("autodoc", "Returns the point p of parameter u, the first second and third derivatives v1 v2 and v3.

Parameters
----------
U: float
P: gp_Pnt2d
V1: gp_Vec2d
V2: gp_Vec2d
V3: gp_Vec2d

Returns
-------
None
") D3;
		void D3(const Standard_Real U, gp_Pnt2d & P, gp_Vec2d & V1, gp_Vec2d & V2, gp_Vec2d & V3);

		/****************** DN ******************/
		/**** md5 signature: a05d2f76912764cef5ac7bb40ebda3d7 ****/
		%feature("compactdefaultargs") DN;
		%feature("autodoc", "For the point of parameter u of this ellipse, computes the vector corresponding to the nth derivative. exceptions standard_rangeerror if n is less than 1.

Parameters
----------
U: float
N: int

Returns
-------
gp_Vec2d
") DN;
		gp_Vec2d DN(const Standard_Real U, const Standard_Integer N);

		/****************** Directrix1 ******************/
		/**** md5 signature: fcbef2c85b670a856d4882ec13ce9c6f ****/
		%feature("compactdefaultargs") Directrix1;
		%feature("autodoc", "Computes the directrices of this ellipse. this directrix is the line normal to the xaxis of the ellipse in the local plane (z = 0) at a distance d = majorradius / e from the center of the ellipse, where e is the eccentricity of the ellipse. this line is parallel to the 'yaxis'. the intersection point between directrix1 and the 'xaxis' is the 'location' point of the directrix1. this point is on the positive side of the 'xaxis'. raises constructionerror if eccentricity = 0.0. (the ellipse degenerates into a circle).

Returns
-------
gp_Ax2d
") Directrix1;
		gp_Ax2d Directrix1();

		/****************** Directrix2 ******************/
		/**** md5 signature: 6932241de7dde0eb204208e30fe6363c ****/
		%feature("compactdefaultargs") Directrix2;
		%feature("autodoc", "This line is obtained by the symmetrical transformation of 'directrix1' with respect to the 'yaxis' of the ellipse. raises constructionerror if eccentricity = 0.0. (the ellipse degenerates into a circle).

Returns
-------
gp_Ax2d
") Directrix2;
		gp_Ax2d Directrix2();

		/****************** Eccentricity ******************/
		/**** md5 signature: 7cc0cae0413ab4c2d528df125e42b57e ****/
		%feature("compactdefaultargs") Eccentricity;
		%feature("autodoc", "Returns the eccentricity of the ellipse between 0.0 and 1.0 if f is the distance between the center of the ellipse and the focus1 then the eccentricity e = f / majorradius. returns 0 if majorradius = 0.

Returns
-------
float
") Eccentricity;
		Standard_Real Eccentricity();

		/****************** Elips2d ******************/
		/**** md5 signature: ecbf143cbc90feccf147fe03c443a520 ****/
		%feature("compactdefaultargs") Elips2d;
		%feature("autodoc", "Converts this ellipse into a gp_elips2d ellipse.

Returns
-------
gp_Elips2d
") Elips2d;
		gp_Elips2d Elips2d();

		/****************** FirstParameter ******************/
		/**** md5 signature: eb9ebe94572bd67588fe8811eac261fb ****/
		%feature("compactdefaultargs") FirstParameter;
		%feature("autodoc", "Returns the value of the first parameter of this ellipse. this is 0.0, which gives the start point of this ellipse. the start point and end point of an ellipse are coincident.

Returns
-------
float
") FirstParameter;
		Standard_Real FirstParameter();

		/****************** Focal ******************/
		/**** md5 signature: 36c97a85b2e31ded83d59428f0f74c3c ****/
		%feature("compactdefaultargs") Focal;
		%feature("autodoc", "Computes the focal distance. the focal distance is the distance between the center and a focus of the ellipse.

Returns
-------
float
") Focal;
		Standard_Real Focal();

		/****************** Focus1 ******************/
		/**** md5 signature: dccbe483b29092eb91431c64e1c5bcd9 ****/
		%feature("compactdefaultargs") Focus1;
		%feature("autodoc", "Returns the first focus of the ellipse. this focus is on the positive side of the 'xaxis' of the ellipse.

Returns
-------
gp_Pnt2d
") Focus1;
		gp_Pnt2d Focus1();

		/****************** Focus2 ******************/
		/**** md5 signature: ca24694273a9069fddac1db8a37c6c68 ****/
		%feature("compactdefaultargs") Focus2;
		%feature("autodoc", "Returns the second focus of the ellipse. this focus is on the negative side of the 'xaxis' of the ellipse.

Returns
-------
gp_Pnt2d
") Focus2;
		gp_Pnt2d Focus2();

		/****************** IsClosed ******************/
		/**** md5 signature: 00978070ec4cb5f00d1d002a8d5d3763 ****/
		%feature("compactdefaultargs") IsClosed;
		%feature("autodoc", "Return true.

Returns
-------
bool
") IsClosed;
		Standard_Boolean IsClosed();

		/****************** IsPeriodic ******************/
		/**** md5 signature: 15e3ccfd3ad4ae42959489f7f64aa8ca ****/
		%feature("compactdefaultargs") IsPeriodic;
		%feature("autodoc", "Return true.

Returns
-------
bool
") IsPeriodic;
		Standard_Boolean IsPeriodic();

		/****************** LastParameter ******************/
		/**** md5 signature: cb4925a2d4a451ceec8f6ad486530f9c ****/
		%feature("compactdefaultargs") LastParameter;
		%feature("autodoc", "Returns the value of the last parameter of this ellipse. this is 2.*pi, which gives the end point of this ellipse. the start point and end point of an ellipse are coincident.

Returns
-------
float
") LastParameter;
		Standard_Real LastParameter();

		/****************** MajorRadius ******************/
		/**** md5 signature: e961bb81456f4d0a6154d0e9401e1ce8 ****/
		%feature("compactdefaultargs") MajorRadius;
		%feature("autodoc", "Returns the major radius of this ellipse.

Returns
-------
float
") MajorRadius;
		Standard_Real MajorRadius();

		/****************** MinorRadius ******************/
		/**** md5 signature: e1383e2287a25901af1e2b42cc95af4d ****/
		%feature("compactdefaultargs") MinorRadius;
		%feature("autodoc", "Returns the minor radius of this ellipse.

Returns
-------
float
") MinorRadius;
		Standard_Real MinorRadius();

		/****************** Parameter ******************/
		/**** md5 signature: ecccdeaeaa0deed24f47e61ad75d24f1 ****/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "Computes the parameter of this ellipse. this value is given by the formula p = (1 - e * e) * majorradius where e is the eccentricity of the ellipse. returns 0 if majorradius = 0.

Returns
-------
float
") Parameter;
		Standard_Real Parameter();

		/****************** ReversedParameter ******************/
		/**** md5 signature: 382721d5a4ea752fecc12f03ab0de9a1 ****/
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

		/****************** SetElips2d ******************/
		/**** md5 signature: e895d343c29146a497bb9b5472311179 ****/
		%feature("compactdefaultargs") SetElips2d;
		%feature("autodoc", "Converts the gp_elips2d ellipse e into this ellipse.

Parameters
----------
E: gp_Elips2d

Returns
-------
None
") SetElips2d;
		void SetElips2d(const gp_Elips2d & E);

		/****************** SetMajorRadius ******************/
		/**** md5 signature: 5b6d39118ca624402ca904f240869d93 ****/
		%feature("compactdefaultargs") SetMajorRadius;
		%feature("autodoc", "Assigns a value to the major radius of this ellipse. exceptions standard_constructionerror if: - the major radius of this ellipse becomes less than the minor radius, or - minorradius is less than 0.

Parameters
----------
MajorRadius: float

Returns
-------
None
") SetMajorRadius;
		void SetMajorRadius(const Standard_Real MajorRadius);

		/****************** SetMinorRadius ******************/
		/**** md5 signature: 55b33932324c77b3c1e82a433bb9350f ****/
		%feature("compactdefaultargs") SetMinorRadius;
		%feature("autodoc", "Assigns a value to the minor radius of this ellipse. exceptions standard_constructionerror if: - the major radius of this ellipse becomes less than the minor radius, or - minorradius is less than 0.

Parameters
----------
MinorRadius: float

Returns
-------
None
") SetMinorRadius;
		void SetMinorRadius(const Standard_Real MinorRadius);

		/****************** Transform ******************/
		/**** md5 signature: 45c8e1b1d6196f6efcf8f7b40a0fb1f5 ****/
		%feature("compactdefaultargs") Transform;
		%feature("autodoc", "Applies the transformation t to this ellipse.

Parameters
----------
T: gp_Trsf2d

Returns
-------
None
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
		/****************** Geom2d_Hyperbola ******************/
		/**** md5 signature: c712e1ef84caffe5bca6b6776a8ec431 ****/
		%feature("compactdefaultargs") Geom2d_Hyperbola;
		%feature("autodoc", "Creates an hyperbola from a non persistent one from package gp.

Parameters
----------
H: gp_Hypr2d

Returns
-------
None
") Geom2d_Hyperbola;
		 Geom2d_Hyperbola(const gp_Hypr2d & H);

		/****************** Geom2d_Hyperbola ******************/
		/**** md5 signature: ff866fe3888051f4e9b880f72bacf365 ****/
		%feature("compactdefaultargs") Geom2d_Hyperbola;
		%feature("autodoc", "Majoraxis is the 'xaxis' of the hyperbola. the yaxis is in the direct sense if 'sense' is true; the major radius of the hyperbola is on this 'xaxis' and the minor radius is on the 'yaxis' of the hyperbola. raised if majorradius < 0.0 or if minorradius < 0.0.

Parameters
----------
MajorAxis: gp_Ax2d
MajorRadius: float
MinorRadius: float
Sense: bool,optional
	default value is Standard_True

Returns
-------
None
") Geom2d_Hyperbola;
		 Geom2d_Hyperbola(const gp_Ax2d & MajorAxis, const Standard_Real MajorRadius, const Standard_Real MinorRadius, const Standard_Boolean Sense = Standard_True);

		/****************** Geom2d_Hyperbola ******************/
		/**** md5 signature: 8ad1b4d8a46803ca0027b9a8a7ee93a3 ****/
		%feature("compactdefaultargs") Geom2d_Hyperbola;
		%feature("autodoc", "The xdirection of 'axis' is the 'xaxis' of the hyperbola and the ydirection of 'axis' is the 'yaxis'. the major radius of the hyperbola is on this 'xaxis' and the minor radius is on the 'yaxis' of the hyperbola. raised if majorradius < 0.0 or if minorradius < 0.0.

Parameters
----------
Axis: gp_Ax22d
MajorRadius: float
MinorRadius: float

Returns
-------
None
") Geom2d_Hyperbola;
		 Geom2d_Hyperbola(const gp_Ax22d & Axis, const Standard_Real MajorRadius, const Standard_Real MinorRadius);

		/****************** Asymptote1 ******************/
		/**** md5 signature: f7602d62af48fa687b9c94102a074f0b ****/
		%feature("compactdefaultargs") Asymptote1;
		%feature("autodoc", "In the local coordinate system of the hyperbola the equation of the hyperbola is (x*x)/(a*a) - (y*y)/(b*b) = 1.0 and the equation of the first asymptote is y = (b/a)*x where a is the major radius of the hyperbola and b is the minor radius of the hyperbola. raised if majorradius = 0.0.

Returns
-------
gp_Ax2d
") Asymptote1;
		gp_Ax2d Asymptote1();

		/****************** Asymptote2 ******************/
		/**** md5 signature: ae762c76c64b4be67fd988e980bd70ef ****/
		%feature("compactdefaultargs") Asymptote2;
		%feature("autodoc", "In the local coordinate system of the hyperbola the equation of the hyperbola is (x*x)/(a*a) - (y*y)/(b*b) = 1.0 and the equation of the first asymptote is y = -(b/a)*x. where a is the major radius of the hyperbola and b is the minor radius of the hyperbola. raised if majorradius = 0.0.

Returns
-------
gp_Ax2d
") Asymptote2;
		gp_Ax2d Asymptote2();

		/****************** ConjugateBranch1 ******************/
		/**** md5 signature: 64c762dbacf1b9b583f85bbe39250178 ****/
		%feature("compactdefaultargs") ConjugateBranch1;
		%feature("autodoc", "Computes the first conjugate branch relative to this hyperbola. note: the diagram given under the class purpose indicates where these two branches of hyperbola are positioned in relation to this branch of hyperbola.

Returns
-------
gp_Hypr2d
") ConjugateBranch1;
		gp_Hypr2d ConjugateBranch1();

		/****************** ConjugateBranch2 ******************/
		/**** md5 signature: b4fca477a92cf56be479876d60440a0d ****/
		%feature("compactdefaultargs") ConjugateBranch2;
		%feature("autodoc", "Computes the second conjugate branch relative to this hyperbola. note: the diagram given under the class purpose indicates where these two branches of hyperbola are positioned in relation to this branch of hyperbola.

Returns
-------
gp_Hypr2d
") ConjugateBranch2;
		gp_Hypr2d ConjugateBranch2();

		/****************** Copy ******************/
		/**** md5 signature: e14f86fd39aef4f82b5296205cbd25eb ****/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "Creates a new object which is a copy of this hyperbola.

Returns
-------
opencascade::handle<Geom2d_Geometry>
") Copy;
		opencascade::handle<Geom2d_Geometry> Copy();

		/****************** D0 ******************/
		/**** md5 signature: 01a5234aae6db090351bac35b3718fd9 ****/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "Returns in p the point of parameter u. p = c + majorradius * cosh (u) * xdir + minorradius * sinh (u) * ydir where c is the center of the hyperbola , xdir the xdirection and ydir the ydirection of the hyperbola's local coordinate system.

Parameters
----------
U: float
P: gp_Pnt2d

Returns
-------
None
") D0;
		void D0(const Standard_Real U, gp_Pnt2d & P);

		/****************** D1 ******************/
		/**** md5 signature: 78ab988905058ca54a64c0ab51a90e46 ****/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "Returns the point p of parameter u and the first derivative v1.

Parameters
----------
U: float
P: gp_Pnt2d
V1: gp_Vec2d

Returns
-------
None
") D1;
		void D1(const Standard_Real U, gp_Pnt2d & P, gp_Vec2d & V1);

		/****************** D2 ******************/
		/**** md5 signature: acc8c0955596bb0bf809102736ad1124 ****/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "Returns the point p of parameter u, the first and second derivatives v1 and v2.

Parameters
----------
U: float
P: gp_Pnt2d
V1: gp_Vec2d
V2: gp_Vec2d

Returns
-------
None
") D2;
		void D2(const Standard_Real U, gp_Pnt2d & P, gp_Vec2d & V1, gp_Vec2d & V2);

		/****************** D3 ******************/
		/**** md5 signature: 28315b7efe2f6c64fe9497aa5c5ddaf6 ****/
		%feature("compactdefaultargs") D3;
		%feature("autodoc", "Returns the point p of parameter u, the first second and third derivatives v1 v2 and v3.

Parameters
----------
U: float
P: gp_Pnt2d
V1: gp_Vec2d
V2: gp_Vec2d
V3: gp_Vec2d

Returns
-------
None
") D3;
		void D3(const Standard_Real U, gp_Pnt2d & P, gp_Vec2d & V1, gp_Vec2d & V2, gp_Vec2d & V3);

		/****************** DN ******************/
		/**** md5 signature: a05d2f76912764cef5ac7bb40ebda3d7 ****/
		%feature("compactdefaultargs") DN;
		%feature("autodoc", "For the point of parameter u of this hyperbola, computes the vector corresponding to the nth derivative. exceptions standard_rangeerror if n is less than 1.

Parameters
----------
U: float
N: int

Returns
-------
gp_Vec2d
") DN;
		gp_Vec2d DN(const Standard_Real U, const Standard_Integer N);

		/****************** Directrix1 ******************/
		/**** md5 signature: fcbef2c85b670a856d4882ec13ce9c6f ****/
		%feature("compactdefaultargs") Directrix1;
		%feature("autodoc", "This directrix is the line normal to the xaxis of the hyperbola in the local plane (z = 0) at a distance d = majorradius / e from the center of the hyperbola, where e is the eccentricity of the hyperbola. this line is parallel to the 'yaxis'. the intersection point between directrix1 and the 'xaxis' is the location point of the directrix1. this point is on the positive side of the 'xaxis'.

Returns
-------
gp_Ax2d
") Directrix1;
		gp_Ax2d Directrix1();

		/****************** Directrix2 ******************/
		/**** md5 signature: 6932241de7dde0eb204208e30fe6363c ****/
		%feature("compactdefaultargs") Directrix2;
		%feature("autodoc", "This line is obtained by the symmetrical transformation of 'directrix1' with respect to the 'yaxis' of the hyperbola.

Returns
-------
gp_Ax2d
") Directrix2;
		gp_Ax2d Directrix2();

		/****************** Eccentricity ******************/
		/**** md5 signature: 7cc0cae0413ab4c2d528df125e42b57e ****/
		%feature("compactdefaultargs") Eccentricity;
		%feature("autodoc", "Returns the excentricity of the hyperbola (e > 1). if f is the distance between the location of the hyperbola and the focus1 then the eccentricity e = f / majorradius. raised if majorradius = 0.0.

Returns
-------
float
") Eccentricity;
		Standard_Real Eccentricity();

		/****************** FirstParameter ******************/
		/**** md5 signature: eb9ebe94572bd67588fe8811eac261fb ****/
		%feature("compactdefaultargs") FirstParameter;
		%feature("autodoc", "Returns realfirst from standard.

Returns
-------
float
") FirstParameter;
		Standard_Real FirstParameter();

		/****************** Focal ******************/
		/**** md5 signature: 36c97a85b2e31ded83d59428f0f74c3c ****/
		%feature("compactdefaultargs") Focal;
		%feature("autodoc", "Computes the focal distance. it is the distance between the two focus of the hyperbola.

Returns
-------
float
") Focal;
		Standard_Real Focal();

		/****************** Focus1 ******************/
		/**** md5 signature: dccbe483b29092eb91431c64e1c5bcd9 ****/
		%feature("compactdefaultargs") Focus1;
		%feature("autodoc", "Returns the first focus of the hyperbola. this focus is on the positive side of the 'xaxis' of the hyperbola.

Returns
-------
gp_Pnt2d
") Focus1;
		gp_Pnt2d Focus1();

		/****************** Focus2 ******************/
		/**** md5 signature: ca24694273a9069fddac1db8a37c6c68 ****/
		%feature("compactdefaultargs") Focus2;
		%feature("autodoc", "Returns the second focus of the hyperbola. this focus is on the negative side of the 'xaxis' of the hyperbola.

Returns
-------
gp_Pnt2d
") Focus2;
		gp_Pnt2d Focus2();

		/****************** Hypr2d ******************/
		/**** md5 signature: 1e5a2ba02ede7c38c243028792d2514e ****/
		%feature("compactdefaultargs") Hypr2d;
		%feature("autodoc", "Converts this hyperbola into a gp_hypr2d one.

Returns
-------
gp_Hypr2d
") Hypr2d;
		gp_Hypr2d Hypr2d();

		/****************** IsClosed ******************/
		/**** md5 signature: 00978070ec4cb5f00d1d002a8d5d3763 ****/
		%feature("compactdefaultargs") IsClosed;
		%feature("autodoc", "Returns false.

Returns
-------
bool
") IsClosed;
		Standard_Boolean IsClosed();

		/****************** IsPeriodic ******************/
		/**** md5 signature: 15e3ccfd3ad4ae42959489f7f64aa8ca ****/
		%feature("compactdefaultargs") IsPeriodic;
		%feature("autodoc", "Return false for an hyperbola.

Returns
-------
bool
") IsPeriodic;
		Standard_Boolean IsPeriodic();

		/****************** LastParameter ******************/
		/**** md5 signature: cb4925a2d4a451ceec8f6ad486530f9c ****/
		%feature("compactdefaultargs") LastParameter;
		%feature("autodoc", "Returns reallast from standard.

Returns
-------
float
") LastParameter;
		Standard_Real LastParameter();

		/****************** MajorRadius ******************/
		/**** md5 signature: e961bb81456f4d0a6154d0e9401e1ce8 ****/
		%feature("compactdefaultargs") MajorRadius;
		%feature("autodoc", "Returns the major or minor radius of this hyperbola. the major radius is also the distance between the center of the hyperbola and the apex of the main branch (located on the 'x axis' of the hyperbola).

Returns
-------
float
") MajorRadius;
		Standard_Real MajorRadius();

		/****************** MinorRadius ******************/
		/**** md5 signature: e1383e2287a25901af1e2b42cc95af4d ****/
		%feature("compactdefaultargs") MinorRadius;
		%feature("autodoc", "Returns the major or minor radius of this hyperbola. the minor radius is also the distance between the center of the hyperbola and the apex of a conjugate branch (located on the 'y axis' of the hyperbola).

Returns
-------
float
") MinorRadius;
		Standard_Real MinorRadius();

		/****************** OtherBranch ******************/
		/**** md5 signature: f232cd4a55a16558916bb20e24dddcc5 ****/
		%feature("compactdefaultargs") OtherBranch;
		%feature("autodoc", "Computes the 'other' branch of this hyperbola. this is a symmetrical branch with respect to the center of this hyperbola. note: the diagram given under the class purpose indicates where the 'other' branch is positioned in relation to this branch of the hyperbola. ^ yaxis | firstconjugatebranch | other | main ---------------------------- c ------------------------------------------&gtxaxis branch | branch | | secondconjugatebranch | warning the major radius can be less than the minor radius.

Returns
-------
gp_Hypr2d
") OtherBranch;
		gp_Hypr2d OtherBranch();

		/****************** Parameter ******************/
		/**** md5 signature: ecccdeaeaa0deed24f47e61ad75d24f1 ****/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "Computes the parameter of this hyperbola. the parameter is: p = (e*e - 1) * majorradius where e is the eccentricity of this hyperbola and majorradius its major radius. exceptions standard_domainerror if the major radius of this hyperbola is null.

Returns
-------
float
") Parameter;
		Standard_Real Parameter();

		/****************** ReversedParameter ******************/
		/**** md5 signature: 382721d5a4ea752fecc12f03ab0de9a1 ****/
		%feature("compactdefaultargs") ReversedParameter;
		%feature("autodoc", "Computes the parameter on the reversed hyperbola, for the point of parameter u on this hyperbola. for a hyperbola, the returned value is -u.

Parameters
----------
U: float

Returns
-------
float
") ReversedParameter;
		Standard_Real ReversedParameter(const Standard_Real U);

		/****************** SetHypr2d ******************/
		/**** md5 signature: a1470a5fc8adb6787ca453ec0f06ec38 ****/
		%feature("compactdefaultargs") SetHypr2d;
		%feature("autodoc", "Converts the gp_hypr2d hyperbola h into this hyperbola.

Parameters
----------
H: gp_Hypr2d

Returns
-------
None
") SetHypr2d;
		void SetHypr2d(const gp_Hypr2d & H);

		/****************** SetMajorRadius ******************/
		/**** md5 signature: 5b6d39118ca624402ca904f240869d93 ****/
		%feature("compactdefaultargs") SetMajorRadius;
		%feature("autodoc", "Assigns a value to the major or minor radius of this hyperbola. exceptions standard_constructionerror if: - majorradius is less than 0.0, - minorradius is less than 0.0.

Parameters
----------
MajorRadius: float

Returns
-------
None
") SetMajorRadius;
		void SetMajorRadius(const Standard_Real MajorRadius);

		/****************** SetMinorRadius ******************/
		/**** md5 signature: 55b33932324c77b3c1e82a433bb9350f ****/
		%feature("compactdefaultargs") SetMinorRadius;
		%feature("autodoc", "Assigns a value to the major or minor radius of this hyperbola. exceptions standard_constructionerror if: - majorradius is less than 0.0, - minorradius is less than 0.0.

Parameters
----------
MinorRadius: float

Returns
-------
None
") SetMinorRadius;
		void SetMinorRadius(const Standard_Real MinorRadius);

		/****************** Transform ******************/
		/**** md5 signature: 45c8e1b1d6196f6efcf8f7b40a0fb1f5 ****/
		%feature("compactdefaultargs") Transform;
		%feature("autodoc", "Applies the transformation t to this hyperbola.

Parameters
----------
T: gp_Trsf2d

Returns
-------
None
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
		/****************** Geom2d_Parabola ******************/
		/**** md5 signature: 2cd2b1e16e0ada192fcb6a1a634995cd ****/
		%feature("compactdefaultargs") Geom2d_Parabola;
		%feature("autodoc", "Creates a parabola from a non persistent one.

Parameters
----------
Prb: gp_Parab2d

Returns
-------
None
") Geom2d_Parabola;
		 Geom2d_Parabola(const gp_Parab2d & Prb);

		/****************** Geom2d_Parabola ******************/
		/**** md5 signature: 6284d7f4712f2a44a398f20bfd625368 ****/
		%feature("compactdefaultargs") Geom2d_Parabola;
		%feature("autodoc", "Creates a parabola with its 'mirroraxis' and it's focal length 'focal'. mirroraxis is the axis of symmetry of the curve, it is the 'xaxis'. the 'yaxis' is parallel to the directrix of the parabola and is in the direct sense if sense is true. the 'location' point of 'mirroraxis' is the vertex of the parabola raised if focal < 0.0.

Parameters
----------
MirrorAxis: gp_Ax2d
Focal: float
Sense: bool,optional
	default value is Standard_True

Returns
-------
None
") Geom2d_Parabola;
		 Geom2d_Parabola(const gp_Ax2d & MirrorAxis, const Standard_Real Focal, const Standard_Boolean Sense = Standard_True);

		/****************** Geom2d_Parabola ******************/
		/**** md5 signature: e9fa2b8cb3ba0310365da5c457f46f8c ****/
		%feature("compactdefaultargs") Geom2d_Parabola;
		%feature("autodoc", "Creates a parabola with its axis and it's focal length 'focal'. the xdirection of axis is the axis of symmetry of the curve, it is the 'xaxis'. the 'yaxis' is parallel to the directrix of the parabola. the 'location' point of 'axis' is the vertex of the parabola. raised if focal < 0.0.

Parameters
----------
Axis: gp_Ax22d
Focal: float

Returns
-------
None
") Geom2d_Parabola;
		 Geom2d_Parabola(const gp_Ax22d & Axis, const Standard_Real Focal);

		/****************** Geom2d_Parabola ******************/
		/**** md5 signature: 45cc4a3559779a52b0e367b9c5fb89c6 ****/
		%feature("compactdefaultargs") Geom2d_Parabola;
		%feature("autodoc", "D is the directrix of the parabola and f the focus point. the symmetry axis 'xaxis' of the parabola is normal to the directrix and pass through the focus point f, but its 'location' point is the vertex of the parabola. the 'yaxis' of the parabola is parallel to d and its 'location' point is the vertex of the parabola.

Parameters
----------
D: gp_Ax2d
F: gp_Pnt2d

Returns
-------
None
") Geom2d_Parabola;
		 Geom2d_Parabola(const gp_Ax2d & D, const gp_Pnt2d & F);

		/****************** Copy ******************/
		/**** md5 signature: e14f86fd39aef4f82b5296205cbd25eb ****/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "Creates a new object, which is a copy of this parabola.

Returns
-------
opencascade::handle<Geom2d_Geometry>
") Copy;
		opencascade::handle<Geom2d_Geometry> Copy();

		/****************** D0 ******************/
		/**** md5 signature: 01a5234aae6db090351bac35b3718fd9 ****/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "Returns in p the point of parameter u. if u = 0 the returned point is the origin of the xaxis and the yaxis of the parabola and it is the vertex of the parabola. p = s + f * (u * u * xdir + * u * ydir) where s is the vertex of the parabola, xdir the xdirection and ydir the ydirection of the parabola's local coordinate system.

Parameters
----------
U: float
P: gp_Pnt2d

Returns
-------
None
") D0;
		void D0(const Standard_Real U, gp_Pnt2d & P);

		/****************** D1 ******************/
		/**** md5 signature: 78ab988905058ca54a64c0ab51a90e46 ****/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "Returns the point p of parameter u and the first derivative v1.

Parameters
----------
U: float
P: gp_Pnt2d
V1: gp_Vec2d

Returns
-------
None
") D1;
		void D1(const Standard_Real U, gp_Pnt2d & P, gp_Vec2d & V1);

		/****************** D2 ******************/
		/**** md5 signature: acc8c0955596bb0bf809102736ad1124 ****/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "Returns the point p of parameter u, the first and second derivatives v1 and v2.

Parameters
----------
U: float
P: gp_Pnt2d
V1: gp_Vec2d
V2: gp_Vec2d

Returns
-------
None
") D2;
		void D2(const Standard_Real U, gp_Pnt2d & P, gp_Vec2d & V1, gp_Vec2d & V2);

		/****************** D3 ******************/
		/**** md5 signature: 28315b7efe2f6c64fe9497aa5c5ddaf6 ****/
		%feature("compactdefaultargs") D3;
		%feature("autodoc", "Returns the point p of parameter u, the first second and third derivatives v1 v2 and v3.

Parameters
----------
U: float
P: gp_Pnt2d
V1: gp_Vec2d
V2: gp_Vec2d
V3: gp_Vec2d

Returns
-------
None
") D3;
		void D3(const Standard_Real U, gp_Pnt2d & P, gp_Vec2d & V1, gp_Vec2d & V2, gp_Vec2d & V3);

		/****************** DN ******************/
		/**** md5 signature: a05d2f76912764cef5ac7bb40ebda3d7 ****/
		%feature("compactdefaultargs") DN;
		%feature("autodoc", "For the point of parameter u of this parabola, computes the vector corresponding to the nth derivative. exceptions standard_rangeerror if n is less than 1.

Parameters
----------
U: float
N: int

Returns
-------
gp_Vec2d
") DN;
		gp_Vec2d DN(const Standard_Real U, const Standard_Integer N);

		/****************** Directrix ******************/
		/**** md5 signature: ace6e59edfa4fed38fc517abd7cec6ce ****/
		%feature("compactdefaultargs") Directrix;
		%feature("autodoc", "The directrix is parallel to the 'yaxis' of the parabola. the 'location' point of the directrix is the intersection point between the directrix and the symmetry axis ('xaxis') of the parabola.

Returns
-------
gp_Ax2d
") Directrix;
		gp_Ax2d Directrix();

		/****************** Eccentricity ******************/
		/**** md5 signature: 7cc0cae0413ab4c2d528df125e42b57e ****/
		%feature("compactdefaultargs") Eccentricity;
		%feature("autodoc", "Returns the eccentricity e = 1.0.

Returns
-------
float
") Eccentricity;
		Standard_Real Eccentricity();

		/****************** FirstParameter ******************/
		/**** md5 signature: eb9ebe94572bd67588fe8811eac261fb ****/
		%feature("compactdefaultargs") FirstParameter;
		%feature("autodoc", "Returns realfirst from standard.

Returns
-------
float
") FirstParameter;
		Standard_Real FirstParameter();

		/****************** Focal ******************/
		/**** md5 signature: 36c97a85b2e31ded83d59428f0f74c3c ****/
		%feature("compactdefaultargs") Focal;
		%feature("autodoc", "Computes the focal length of this parabola. the focal length is the distance between the apex and the focus of the parabola.

Returns
-------
float
") Focal;
		Standard_Real Focal();

		/****************** Focus ******************/
		/**** md5 signature: 2c1658317ec9295538436248b7bfe86f ****/
		%feature("compactdefaultargs") Focus;
		%feature("autodoc", "Computes the focus of this parabola the focus is on the positive side of the 'x axis' of the local coordinate system of the parabola.

Returns
-------
gp_Pnt2d
") Focus;
		gp_Pnt2d Focus();

		/****************** IsClosed ******************/
		/**** md5 signature: 00978070ec4cb5f00d1d002a8d5d3763 ****/
		%feature("compactdefaultargs") IsClosed;
		%feature("autodoc", "Returns false.

Returns
-------
bool
") IsClosed;
		Standard_Boolean IsClosed();

		/****************** IsPeriodic ******************/
		/**** md5 signature: 15e3ccfd3ad4ae42959489f7f64aa8ca ****/
		%feature("compactdefaultargs") IsPeriodic;
		%feature("autodoc", "Returns false.

Returns
-------
bool
") IsPeriodic;
		Standard_Boolean IsPeriodic();

		/****************** LastParameter ******************/
		/**** md5 signature: cb4925a2d4a451ceec8f6ad486530f9c ****/
		%feature("compactdefaultargs") LastParameter;
		%feature("autodoc", "Returns reallast from standard.

Returns
-------
float
") LastParameter;
		Standard_Real LastParameter();

		/****************** Parab2d ******************/
		/**** md5 signature: f38a0a2de9b72afcd07619a575164090 ****/
		%feature("compactdefaultargs") Parab2d;
		%feature("autodoc", "Returns the non persistent parabola from gp with the same geometric properties as <self>.

Returns
-------
gp_Parab2d
") Parab2d;
		gp_Parab2d Parab2d();

		/****************** Parameter ******************/
		/**** md5 signature: ecccdeaeaa0deed24f47e61ad75d24f1 ****/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "Computes the parameter of this parabola, which is the distance between its focus and its directrix. this distance is twice the focal length. if p is the parameter of the parabola, the equation of the parabola in its local coordinate system is: y**2 = 2.*p*x.

Returns
-------
float
") Parameter;
		Standard_Real Parameter();

		/****************** ParametricTransformation ******************/
		/**** md5 signature: ad9e9868254ff23e50de23c8903e48c0 ****/
		%feature("compactdefaultargs") ParametricTransformation;
		%feature("autodoc", "Returns a coefficient to compute the parameter on the transformed curve for the transform of the point on <self>. //! transformed(t)->value(u * parametrictransformation(t)) //! is the same point as //! value(u).transformed(t) //! this methods returns t.scalefactor().

Parameters
----------
T: gp_Trsf2d

Returns
-------
float
") ParametricTransformation;
		Standard_Real ParametricTransformation(const gp_Trsf2d & T);

		/****************** ReversedParameter ******************/
		/**** md5 signature: 382721d5a4ea752fecc12f03ab0de9a1 ****/
		%feature("compactdefaultargs") ReversedParameter;
		%feature("autodoc", "Computes the parameter on the reversed parabola for the point of parameter u on this parabola. for a parabola, the returned value is -u.

Parameters
----------
U: float

Returns
-------
float
") ReversedParameter;
		Standard_Real ReversedParameter(const Standard_Real U);

		/****************** SetFocal ******************/
		/**** md5 signature: b79f368485f4739b39b65cdd8789fb05 ****/
		%feature("compactdefaultargs") SetFocal;
		%feature("autodoc", "Assigns the value focal to the focal length of this parabola. exceptions standard_constructionerror if focal is negative.

Parameters
----------
Focal: float

Returns
-------
None
") SetFocal;
		void SetFocal(const Standard_Real Focal);

		/****************** SetParab2d ******************/
		/**** md5 signature: 355df5653f49f40d0f9471ef1d2a4ecc ****/
		%feature("compactdefaultargs") SetParab2d;
		%feature("autodoc", "Converts the gp_parab2d parabola prb into this parabola.

Parameters
----------
Prb: gp_Parab2d

Returns
-------
None
") SetParab2d;
		void SetParab2d(const gp_Parab2d & Prb);

		/****************** Transform ******************/
		/**** md5 signature: 45c8e1b1d6196f6efcf8f7b40a0fb1f5 ****/
		%feature("compactdefaultargs") Transform;
		%feature("autodoc", "Applies the transformation t to this parabola.

Parameters
----------
T: gp_Trsf2d

Returns
-------
None
") Transform;
		void Transform(const gp_Trsf2d & T);

		/****************** TransformedParameter ******************/
		/**** md5 signature: 3bea23aa76dbe75d00eada505d15e859 ****/
		%feature("compactdefaultargs") TransformedParameter;
		%feature("autodoc", "Computes the parameter on the transformed parabola, for the point of parameter u on this parabola. for a parabola, the returned value is equal to u multiplied by the scale factor of transformation t.

Parameters
----------
U: float
T: gp_Trsf2d

Returns
-------
float
") TransformedParameter;
		Standard_Real TransformedParameter(const Standard_Real U, const gp_Trsf2d & T);

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
		/****************** Geom2d_TrimmedCurve ******************/
		/**** md5 signature: 028a8f9c73eb3bcd4eaed186399d8190 ****/
		%feature("compactdefaultargs") Geom2d_TrimmedCurve;
		%feature("autodoc", "Creates a trimmed curve from the basis curve c limited between u1 and u2. //! . u1 can be greater or lower than u2. . the returned curve is oriented from u1 to u2. . if the basis curve c is periodic there is an ambiguity because two parts are available. in this case by default the trimmed curve has the same orientation as the basis curve (sense = true). if sense = false then the orientation of the trimmed curve is opposite to the orientation of the basis curve c. if the curve is closed but not periodic it is not possible to keep the part of the curve including the junction point (except if the junction point is at the beginning or at the end of the trimmed curve) because you could lose the fundamental characteristics of the basis curve which are used for example to compute the derivatives of the trimmed curve. so for a closed curve the rules are the same as for a open curve. warnings : in this package the entities are not shared. the trimmedcurve is built with a copy of the curve c. so when c is modified the trimmedcurve is not modified warnings : if <c> is periodic and <theadjustperiodic> is true, parametrics bounds of the trimmedcurve, can be different to [<u1>;<u2>}, if <u1> or <u2> are not in the principal period. include : for more explanation see the scheme given with this class. raises constructionerror the c is not periodic and u1 or u2 are out of the bounds of c. raised if u1 = u2.

Parameters
----------
C: Geom2d_Curve
U1: float
U2: float
Sense: bool,optional
	default value is Standard_True
theAdjustPeriodic: bool,optional
	default value is Standard_True

Returns
-------
None
") Geom2d_TrimmedCurve;
		 Geom2d_TrimmedCurve(const opencascade::handle<Geom2d_Curve> & C, const Standard_Real U1, const Standard_Real U2, const Standard_Boolean Sense = Standard_True, const Standard_Boolean theAdjustPeriodic = Standard_True);

		/****************** BasisCurve ******************/
		/**** md5 signature: a8e3b477d1e52617cbab75e7ce241296 ****/
		%feature("compactdefaultargs") BasisCurve;
		%feature("autodoc", "Returns the basis curve. warning this function does not return a constant reference. consequently, any modification of the returned value directly modifies the trimmed curve.

Returns
-------
opencascade::handle<Geom2d_Curve>
") BasisCurve;
		opencascade::handle<Geom2d_Curve> BasisCurve();

		/****************** Continuity ******************/
		/**** md5 signature: 9381b370dfdd50af7f1b79ce202f0c6f ****/
		%feature("compactdefaultargs") Continuity;
		%feature("autodoc", "Returns the global continuity of the basis curve of this trimmed curve. c0 : only geometric continuity, c1 : continuity of the first derivative all along the curve, c2 : continuity of the second derivative all along the curve, c3 : continuity of the third derivative all along the curve, cn : the order of continuity is infinite.

Returns
-------
GeomAbs_Shape
") Continuity;
		GeomAbs_Shape Continuity();

		/****************** Copy ******************/
		/**** md5 signature: e14f86fd39aef4f82b5296205cbd25eb ****/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "Creates a new object, which is a copy of this trimmed curve.

Returns
-------
opencascade::handle<Geom2d_Geometry>
") Copy;
		opencascade::handle<Geom2d_Geometry> Copy();

		/****************** D0 ******************/
		/**** md5 signature: 01a5234aae6db090351bac35b3718fd9 ****/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "If the basis curve is an offsetcurve sometimes it is not possible to do the evaluation of the curve at the parameter u (see class offsetcurve).

Parameters
----------
U: float
P: gp_Pnt2d

Returns
-------
None
") D0;
		void D0(const Standard_Real U, gp_Pnt2d & P);

		/****************** D1 ******************/
		/**** md5 signature: 78ab988905058ca54a64c0ab51a90e46 ****/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "Raised if the continuity of the curve is not c1.

Parameters
----------
U: float
P: gp_Pnt2d
V1: gp_Vec2d

Returns
-------
None
") D1;
		void D1(const Standard_Real U, gp_Pnt2d & P, gp_Vec2d & V1);

		/****************** D2 ******************/
		/**** md5 signature: acc8c0955596bb0bf809102736ad1124 ****/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "Raised if the continuity of the curve is not c2.

Parameters
----------
U: float
P: gp_Pnt2d
V1: gp_Vec2d
V2: gp_Vec2d

Returns
-------
None
") D2;
		void D2(const Standard_Real U, gp_Pnt2d & P, gp_Vec2d & V1, gp_Vec2d & V2);

		/****************** D3 ******************/
		/**** md5 signature: 28315b7efe2f6c64fe9497aa5c5ddaf6 ****/
		%feature("compactdefaultargs") D3;
		%feature("autodoc", "Raised if the continuity of the curve is not c3.

Parameters
----------
U: float
P: gp_Pnt2d
V1: gp_Vec2d
V2: gp_Vec2d
V3: gp_Vec2d

Returns
-------
None
") D3;
		void D3(const Standard_Real U, gp_Pnt2d & P, gp_Vec2d & V1, gp_Vec2d & V2, gp_Vec2d & V3);

		/****************** DN ******************/
		/**** md5 signature: a05d2f76912764cef5ac7bb40ebda3d7 ****/
		%feature("compactdefaultargs") DN;
		%feature("autodoc", "For the point of parameter u of this trimmed curve, computes the vector corresponding to the nth derivative. warning the returned derivative vector has the same orientation as the derivative vector of the basis curve, even if the trimmed curve does not have the same orientation as the basis curve. exceptions standard_rangeerror if n is less than 1. geometric transformations.

Parameters
----------
U: float
N: int

Returns
-------
gp_Vec2d
") DN;
		gp_Vec2d DN(const Standard_Real U, const Standard_Integer N);

		/****************** EndPoint ******************/
		/**** md5 signature: 728da2f708cdaeb8d7659531afcee1a8 ****/
		%feature("compactdefaultargs") EndPoint;
		%feature("autodoc", "Returns the end point of <self>. this point is the evaluation of the curve for the 'lastparameter'.

Returns
-------
gp_Pnt2d
") EndPoint;
		gp_Pnt2d EndPoint();

		/****************** FirstParameter ******************/
		/**** md5 signature: eb9ebe94572bd67588fe8811eac261fb ****/
		%feature("compactdefaultargs") FirstParameter;
		%feature("autodoc", "Returns the value of the first parameter of <self>. the first parameter is the parameter of the 'startpoint' of the trimmed curve.

Returns
-------
float
") FirstParameter;
		Standard_Real FirstParameter();

		/****************** IsCN ******************/
		/**** md5 signature: 73c2d9ecdd776a5227f0665f0702fcb3 ****/
		%feature("compactdefaultargs") IsCN;
		%feature("autodoc", "--- purpose returns true if the order of continuity of the trimmed curve is n. a trimmed curve is at least 'c0' continuous. warnings : the continuity of the trimmed curve can be greater than the continuity of the basis curve because you consider only a part of the basis curve. raised if n < 0.

Parameters
----------
N: int

Returns
-------
bool
") IsCN;
		Standard_Boolean IsCN(const Standard_Integer N);

		/****************** IsClosed ******************/
		/**** md5 signature: 00978070ec4cb5f00d1d002a8d5d3763 ****/
		%feature("compactdefaultargs") IsClosed;
		%feature("autodoc", "Returns true if the distance between the startpoint and the endpoint is lower or equal to resolution from package gp.

Returns
-------
bool
") IsClosed;
		Standard_Boolean IsClosed();

		/****************** IsPeriodic ******************/
		/**** md5 signature: 15e3ccfd3ad4ae42959489f7f64aa8ca ****/
		%feature("compactdefaultargs") IsPeriodic;
		%feature("autodoc", "Always returns false (independently of the type of basis curve).

Returns
-------
bool
") IsPeriodic;
		Standard_Boolean IsPeriodic();

		/****************** LastParameter ******************/
		/**** md5 signature: cb4925a2d4a451ceec8f6ad486530f9c ****/
		%feature("compactdefaultargs") LastParameter;
		%feature("autodoc", "Returns the value of the last parameter of <self>. the last parameter is the parameter of the 'endpoint' of the trimmed curve.

Returns
-------
float
") LastParameter;
		Standard_Real LastParameter();

		/****************** ParametricTransformation ******************/
		/**** md5 signature: c55f3070fbb8250ad20eb38b8b2fe8cf ****/
		%feature("compactdefaultargs") ParametricTransformation;
		%feature("autodoc", "Returns a coefficient to compute the parameter on the transformed curve for the transform of the point on <self>. //! transformed(t)->value(u * parametrictransformation(t)) //! is the same point as //! value(u).transformed(t) //! this methods calls the basis curve method.

Parameters
----------
T: gp_Trsf2d

Returns
-------
float
") ParametricTransformation;
		virtual Standard_Real ParametricTransformation(const gp_Trsf2d & T);

		/****************** Period ******************/
		/**** md5 signature: a0af1de0407384df43b0e76d6b472231 ****/
		%feature("compactdefaultargs") Period;
		%feature("autodoc", "Returns the period of the basis curve of this trimmed curve. exceptions standard_nosuchobject if the basis curve is not periodic.

Returns
-------
float
") Period;
		virtual Standard_Real Period();

		/****************** Reverse ******************/
		/**** md5 signature: bff3d53d1cf0b268b7de85021a2bf3c4 ****/
		%feature("compactdefaultargs") Reverse;
		%feature("autodoc", "Changes the direction of parametrization of <self>. the first and the last parametric values are modified. the 'startpoint' of the initial curve becomes the 'endpoint' of the reversed curve and the 'endpoint' of the initial curve becomes the 'startpoint' of the reversed curve. example - if the trimmed curve is defined by: - a basis curve whose parameter range is [ 0.,1. ], and - the two trim values u1 (first parameter) and u2 (last parameter), the reversed trimmed curve is defined by: - the reversed basis curve, whose parameter range is still [ 0.,1. ], and - the two trim values 1. - u2 (first parameter) and 1. - u1 (last parameter).

Returns
-------
None
") Reverse;
		void Reverse();

		/****************** ReversedParameter ******************/
		/**** md5 signature: 382721d5a4ea752fecc12f03ab0de9a1 ****/
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

		/****************** SetTrim ******************/
		/**** md5 signature: e089a6e39b5be7b78b7d6ffa6359d842 ****/
		%feature("compactdefaultargs") SetTrim;
		%feature("autodoc", "Changes this trimmed curve, by redefining the parameter values u1 and u2, which limit its basis curve. note: if the basis curve is periodic, the trimmed curve has the same orientation as the basis curve if sense is true (default value) or the opposite orientation if sense is false. warning if the basis curve is periodic and theadjustperiodic is true, the bounds of the trimmed curve may be different from u1 and u2 if the parametric origin of the basis curve is within the arc of the trimmed curve. in this case, the modified parameter will be equal to u1 or u2 plus or minus the period. if theadjustperiodic is false, parameters u1 and u2 will stay unchanged. exceptions standard_constructionerror if: - the basis curve is not periodic, and either u1 or u2 are outside the bounds of the basis curve, or - u1 is equal to u2.

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
		/**** md5 signature: 75fa6f4dbe3ec2b82daa06e6b66df23a ****/
		%feature("compactdefaultargs") StartPoint;
		%feature("autodoc", "Returns the start point of <self>. this point is the evaluation of the curve from the 'firstparameter'. value and derivatives warnings : the returned derivatives have the same orientation as the derivatives of the basis curve.

Returns
-------
gp_Pnt2d
") StartPoint;
		gp_Pnt2d StartPoint();

		/****************** Transform ******************/
		/**** md5 signature: 45c8e1b1d6196f6efcf8f7b40a0fb1f5 ****/
		%feature("compactdefaultargs") Transform;
		%feature("autodoc", "Applies the transformation t to this trimmed curve. warning the basis curve is also modified.

Parameters
----------
T: gp_Trsf2d

Returns
-------
None
") Transform;
		void Transform(const gp_Trsf2d & T);

		/****************** TransformedParameter ******************/
		/**** md5 signature: a8fa80dec72c518278d67ce7a2a0b3fa ****/
		%feature("compactdefaultargs") TransformedParameter;
		%feature("autodoc", "Returns the parameter on the transformed curve for the transform of the point of parameter u on <self>. //! me->transformed(t)->value(me->transformedparameter(u,t)) //! is the same point as //! me->value(u).transformed(t) //! this methods calls the basis curve method.

Parameters
----------
U: float
T: gp_Trsf2d

Returns
-------
float
") TransformedParameter;
		virtual Standard_Real TransformedParameter(const Standard_Real U, const gp_Trsf2d & T);

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
