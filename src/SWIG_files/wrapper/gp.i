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
%define GPDOCSTRING
"gp module, see official documentation at
https://dev.opencascade.org/doc/occt-7.9.0/refman/html/package_gp.html"
%enddef
%module (package="OCC.Core", docstring=GPDOCSTRING) gp


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
#include<gp_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<TColStd_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import TColStd.i

%pythoncode {
from enum import IntEnum
from OCC.Core.Exception import *
};

/* public enums */
enum gp_EulerSequence {
	gp_EulerAngles = 0,
	gp_YawPitchRoll = 1,
	gp_Extrinsic_XYZ = 2,
	gp_Extrinsic_XZY = 3,
	gp_Extrinsic_YZX = 4,
	gp_Extrinsic_YXZ = 5,
	gp_Extrinsic_ZXY = 6,
	gp_Extrinsic_ZYX = 7,
	gp_Intrinsic_XYZ = 8,
	gp_Intrinsic_XZY = 9,
	gp_Intrinsic_YZX = 10,
	gp_Intrinsic_YXZ = 11,
	gp_Intrinsic_ZXY = 12,
	gp_Intrinsic_ZYX = 13,
	gp_Extrinsic_XYX = 14,
	gp_Extrinsic_XZX = 15,
	gp_Extrinsic_YZY = 16,
	gp_Extrinsic_YXY = 17,
	gp_Extrinsic_ZYZ = 18,
	gp_Extrinsic_ZXZ = 19,
	gp_Intrinsic_XYX = 20,
	gp_Intrinsic_XZX = 21,
	gp_Intrinsic_YZY = 22,
	gp_Intrinsic_YXY = 23,
	gp_Intrinsic_ZXZ = 24,
	gp_Intrinsic_ZYZ = 25,
};

enum gp_TrsfForm {
	gp_Identity = 0,
	gp_Rotation = 1,
	gp_Translation = 2,
	gp_PntMirror = 3,
	gp_Ax1Mirror = 4,
	gp_Ax2Mirror = 5,
	gp_Scale = 6,
	gp_CompoundTrsf = 7,
	gp_Other = 8,
};

/* end public enums declaration */

/* python proxy classes for enums */
%pythoncode {

class gp_EulerSequence(IntEnum):
	gp_EulerAngles = 0
	gp_YawPitchRoll = 1
	gp_Extrinsic_XYZ = 2
	gp_Extrinsic_XZY = 3
	gp_Extrinsic_YZX = 4
	gp_Extrinsic_YXZ = 5
	gp_Extrinsic_ZXY = 6
	gp_Extrinsic_ZYX = 7
	gp_Intrinsic_XYZ = 8
	gp_Intrinsic_XZY = 9
	gp_Intrinsic_YZX = 10
	gp_Intrinsic_YXZ = 11
	gp_Intrinsic_ZXY = 12
	gp_Intrinsic_ZYX = 13
	gp_Extrinsic_XYX = 14
	gp_Extrinsic_XZX = 15
	gp_Extrinsic_YZY = 16
	gp_Extrinsic_YXY = 17
	gp_Extrinsic_ZYZ = 18
	gp_Extrinsic_ZXZ = 19
	gp_Intrinsic_XYX = 20
	gp_Intrinsic_XZX = 21
	gp_Intrinsic_YZY = 22
	gp_Intrinsic_YXY = 23
	gp_Intrinsic_ZXZ = 24
	gp_Intrinsic_ZYZ = 25
gp_EulerAngles = gp_EulerSequence.gp_EulerAngles
gp_YawPitchRoll = gp_EulerSequence.gp_YawPitchRoll
gp_Extrinsic_XYZ = gp_EulerSequence.gp_Extrinsic_XYZ
gp_Extrinsic_XZY = gp_EulerSequence.gp_Extrinsic_XZY
gp_Extrinsic_YZX = gp_EulerSequence.gp_Extrinsic_YZX
gp_Extrinsic_YXZ = gp_EulerSequence.gp_Extrinsic_YXZ
gp_Extrinsic_ZXY = gp_EulerSequence.gp_Extrinsic_ZXY
gp_Extrinsic_ZYX = gp_EulerSequence.gp_Extrinsic_ZYX
gp_Intrinsic_XYZ = gp_EulerSequence.gp_Intrinsic_XYZ
gp_Intrinsic_XZY = gp_EulerSequence.gp_Intrinsic_XZY
gp_Intrinsic_YZX = gp_EulerSequence.gp_Intrinsic_YZX
gp_Intrinsic_YXZ = gp_EulerSequence.gp_Intrinsic_YXZ
gp_Intrinsic_ZXY = gp_EulerSequence.gp_Intrinsic_ZXY
gp_Intrinsic_ZYX = gp_EulerSequence.gp_Intrinsic_ZYX
gp_Extrinsic_XYX = gp_EulerSequence.gp_Extrinsic_XYX
gp_Extrinsic_XZX = gp_EulerSequence.gp_Extrinsic_XZX
gp_Extrinsic_YZY = gp_EulerSequence.gp_Extrinsic_YZY
gp_Extrinsic_YXY = gp_EulerSequence.gp_Extrinsic_YXY
gp_Extrinsic_ZYZ = gp_EulerSequence.gp_Extrinsic_ZYZ
gp_Extrinsic_ZXZ = gp_EulerSequence.gp_Extrinsic_ZXZ
gp_Intrinsic_XYX = gp_EulerSequence.gp_Intrinsic_XYX
gp_Intrinsic_XZX = gp_EulerSequence.gp_Intrinsic_XZX
gp_Intrinsic_YZY = gp_EulerSequence.gp_Intrinsic_YZY
gp_Intrinsic_YXY = gp_EulerSequence.gp_Intrinsic_YXY
gp_Intrinsic_ZXZ = gp_EulerSequence.gp_Intrinsic_ZXZ
gp_Intrinsic_ZYZ = gp_EulerSequence.gp_Intrinsic_ZYZ

class gp_TrsfForm(IntEnum):
	gp_Identity = 0
	gp_Rotation = 1
	gp_Translation = 2
	gp_PntMirror = 3
	gp_Ax1Mirror = 4
	gp_Ax2Mirror = 5
	gp_Scale = 6
	gp_CompoundTrsf = 7
	gp_Other = 8
gp_Identity = gp_TrsfForm.gp_Identity
gp_Rotation = gp_TrsfForm.gp_Rotation
gp_Translation = gp_TrsfForm.gp_Translation
gp_PntMirror = gp_TrsfForm.gp_PntMirror
gp_Ax1Mirror = gp_TrsfForm.gp_Ax1Mirror
gp_Ax2Mirror = gp_TrsfForm.gp_Ax2Mirror
gp_Scale = gp_TrsfForm.gp_Scale
gp_CompoundTrsf = gp_TrsfForm.gp_CompoundTrsf
gp_Other = gp_TrsfForm.gp_Other
};
/* end python proxy for enums */

/* handles */
/* end handles declaration */

/* templates */
%template(gp_Vec2f) NCollection_Vec2<float>;
%template(gp_Vec3f) NCollection_Vec3<float>;
/* end templates declaration */

/* typedefs */
typedef NCollection_Vec2<float> gp_Vec2f;
typedef NCollection_Vec3<float> gp_Vec3f;
/* end typedefs declaration */

/**********************************
* class NCollection_Lerp<gp_Trsf> *
**********************************/
/*************************
* class equal_to<gp_Pnt> *
*************************/
/***********
* class gp *
***********/
%rename(gp) gp;
%nodefaultctor gp;
class gp {
	public:
		/****** gp::DX ******/
		/****** md5 signature: 369444ad221eda0316c9149a4ba56cc6 ******/
		%feature("compactdefaultargs") DX;
		%feature("autodoc", "Return
-------
gp_Dir

Description
-----------
Returns a unit vector with the combination (1,0,0).
") DX;
		static const gp_Dir DX();

		/****** gp::DX2d ******/
		/****** md5 signature: 310f29b604ef0f04262c91fcd109b6d8 ******/
		%feature("compactdefaultargs") DX2d;
		%feature("autodoc", "Return
-------
gp_Dir2d

Description
-----------
Returns a unit vector with the combinations (1,0).
") DX2d;
		static const gp_Dir2d DX2d();

		/****** gp::DY ******/
		/****** md5 signature: fee5904c29eb6bb23e7614752f01af42 ******/
		%feature("compactdefaultargs") DY;
		%feature("autodoc", "Return
-------
gp_Dir

Description
-----------
Returns a unit vector with the combination (0,1,0).
") DY;
		static const gp_Dir DY();

		/****** gp::DY2d ******/
		/****** md5 signature: a2c29609d4a4ef316185a3876b08c26f ******/
		%feature("compactdefaultargs") DY2d;
		%feature("autodoc", "Return
-------
gp_Dir2d

Description
-----------
Returns a unit vector with the combinations (0,1).
") DY2d;
		static const gp_Dir2d DY2d();

		/****** gp::DZ ******/
		/****** md5 signature: be8aa86d84b6c062056f49be77dafc58 ******/
		%feature("compactdefaultargs") DZ;
		%feature("autodoc", "Return
-------
gp_Dir

Description
-----------
Returns a unit vector with the combination (0,0,1).
") DZ;
		static const gp_Dir DZ();

		/****** gp::OX ******/
		/****** md5 signature: 9060517989b7a0b62de5ad7cfb27c3c8 ******/
		%feature("compactdefaultargs") OX;
		%feature("autodoc", "Return
-------
gp_Ax1

Description
-----------
Identifies an axis where its origin is Origin and its unit vector coordinates X = 1.0, Y = Z = 0.0.
") OX;
		static const gp_Ax1 OX();

		/****** gp::OX2d ******/
		/****** md5 signature: 05a5d287f991f7f174093d70e322c61f ******/
		%feature("compactdefaultargs") OX2d;
		%feature("autodoc", "Return
-------
gp_Ax2d

Description
-----------
Identifies an axis where its origin is Origin2d and its unit vector coordinates are: X = 1.0, Y = 0.0.
") OX2d;
		static const gp_Ax2d OX2d();

		/****** gp::OY ******/
		/****** md5 signature: ddb027a4dff5dc5303a419c759d837da ******/
		%feature("compactdefaultargs") OY;
		%feature("autodoc", "Return
-------
gp_Ax1

Description
-----------
Identifies an axis where its origin is Origin and its unit vector coordinates Y = 1.0, X = Z = 0.0.
") OY;
		static const gp_Ax1 OY();

		/****** gp::OY2d ******/
		/****** md5 signature: 2172a9129d3e9372e407a098d44fd969 ******/
		%feature("compactdefaultargs") OY2d;
		%feature("autodoc", "Return
-------
gp_Ax2d

Description
-----------
Identifies an axis where its origin is Origin2d and its unit vector coordinates are Y = 1.0, X = 0.0.
") OY2d;
		static const gp_Ax2d OY2d();

		/****** gp::OZ ******/
		/****** md5 signature: d3401c8ae2f54c1ffa50e8cc681fe576 ******/
		%feature("compactdefaultargs") OZ;
		%feature("autodoc", "Return
-------
gp_Ax1

Description
-----------
Identifies an axis where its origin is Origin and its unit vector coordinates Z = 1.0, Y = X = 0.0.
") OZ;
		static const gp_Ax1 OZ();

		/****** gp::Origin ******/
		/****** md5 signature: 9786b8d81fb920f79df8a8b8d1adf34a ******/
		%feature("compactdefaultargs") Origin;
		%feature("autodoc", "Return
-------
gp_Pnt

Description
-----------
Identifies a Cartesian point with coordinates X = Y = Z = 0.0.0.
") Origin;
		static const gp_Pnt Origin();

		/****** gp::Origin2d ******/
		/****** md5 signature: b599a1a6e2d74488b634ac8571133b8b ******/
		%feature("compactdefaultargs") Origin2d;
		%feature("autodoc", "Return
-------
gp_Pnt2d

Description
-----------
Identifies a Cartesian point with coordinates X = Y = 0.0.
") Origin2d;
		static const gp_Pnt2d Origin2d();

		/****** gp::Resolution ******/
		/****** md5 signature: 39c9229fa796f82bf5cf1a918262b085 ******/
		%feature("compactdefaultargs") Resolution;
		%feature("autodoc", "Return
-------
double

Description
-----------
Method of package gp //! In geometric computations, defines the tolerance criterion used to determine when two numbers can be considered equal. Many class functions use this tolerance criterion, for example, to avoid division by zero in geometric computations. In the documentation, tolerance criterion is always referred to as gp::Resolution().
") Resolution;
		static double Resolution();

		/****** gp::XOY ******/
		/****** md5 signature: 3cc5f792c7e30d249532c853b3cfb29e ******/
		%feature("compactdefaultargs") XOY;
		%feature("autodoc", "Return
-------
gp_Ax2

Description
-----------
Identifies a coordinate system where its origin is Origin, and its 'main Direction' and 'X Direction' coordinates Z = 1.0, X = Y =0.0 and X direction coordinates X = 1.0, Y = Z = 0.0.
") XOY;
		static const gp_Ax2 XOY();

		/****** gp::YOZ ******/
		/****** md5 signature: 6329e70e961f3c6b748693bfd196319f ******/
		%feature("compactdefaultargs") YOZ;
		%feature("autodoc", "Return
-------
gp_Ax2

Description
-----------
Identifies a coordinate system where its origin is Origin, and its 'main Direction' and 'X Direction' coordinates X = 1.0, Z = Y =0.0 and X direction coordinates Y = 1.0, X = Z = 0.0 In 2D space.
") YOZ;
		static const gp_Ax2 YOZ();

		/****** gp::ZOX ******/
		/****** md5 signature: 46a25c074e01f776b2c55dc9ff51469e ******/
		%feature("compactdefaultargs") ZOX;
		%feature("autodoc", "Return
-------
gp_Ax2

Description
-----------
Identifies a coordinate system where its origin is Origin, and its 'main Direction' and 'X Direction' coordinates Y = 1.0, X = Z =0.0 and X direction coordinates Z = 1.0, X = Y = 0.0.
") ZOX;
		static const gp_Ax2 ZOX();

};


%extend gp {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************
* class gp_Ax1 *
***************/
class gp_Ax1 {
	public:
		/****** gp_Ax1::gp_Ax1 ******/
		/****** md5 signature: 72d2610192c4d136c773583d4bbc0a84 ******/
		%feature("compactdefaultargs") gp_Ax1;
		%feature("autodoc", "Return
-------
None

Description
-----------
Creates an axis object representing Z axis of the reference coordinate system.
") gp_Ax1;
		 gp_Ax1();

		/****** gp_Ax1::gp_Ax1 ******/
		/****** md5 signature: e2ebcb93c97c7b24bb9fc2f4917fea9e ******/
		%feature("compactdefaultargs") gp_Ax1;
		%feature("autodoc", "
Parameters
----------
theP: gp_Pnt
theV: gp_Dir

Return
-------
None

Description
-----------
P is the location point and V is the direction of <self>.
") gp_Ax1;
		 gp_Ax1(const gp_Pnt & theP, const gp_Dir & theV);

		/****** gp_Ax1::gp_Ax1 ******/
		/****** md5 signature: 0e4a40080aab466e5e877024cc6a6339 ******/
		%feature("compactdefaultargs") gp_Ax1;
		%feature("autodoc", "
Parameters
----------
theP: gp_Pnt
theDir: gp_Dir::D

Return
-------
None

Description
-----------
Creates an axis with the given location point and standard direction.
") gp_Ax1;
		 gp_Ax1(const gp_Pnt & theP, const gp_Dir::D theDir);

		/****** gp_Ax1::gp_Ax1 ******/
		/****** md5 signature: 4c7e189f8df12da648a1d005ac30db67 ******/
		%feature("compactdefaultargs") gp_Ax1;
		%feature("autodoc", "
Parameters
----------
theDir: gp_Dir::D

Return
-------
None

Description
-----------
Creates an axis at the origin with the given standard direction. Replaces gp::OX(), gp::OY(), gp::OZ() static functions.
") gp_Ax1;
		 gp_Ax1(const gp_Dir::D theDir);

		/****** gp_Ax1::Angle ******/
		/****** md5 signature: 774502a8060ac5cf22803a026074c36c ******/
		%feature("compactdefaultargs") Angle;
		%feature("autodoc", "
Parameters
----------
theOther: gp_Ax1

Return
-------
double

Description
-----------
Computes the angular value, in radians, between this.Direction() and theOther.Direction(). Returns the angle between 0 and 2*PI radians.
") Angle;
		double Angle(const gp_Ax1 & theOther);

		/****** gp_Ax1::Direction ******/
		/****** md5 signature: 52b593a77853d9d22e96443cc8f6fb8d ******/
		%feature("compactdefaultargs") Direction;
		%feature("autodoc", "Return
-------
gp_Dir

Description
-----------
Returns the direction of <self>.
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

        /****************** InitFromJson ******************/
        %feature("autodoc", "
Parameters
----------
json_string: the string

Return
-------
bool

Description
-----------
Init the object from a JSON string.
") InitFromJson;
        %extend{
            bool InitFromJson(std::string json_string) {
            std::stringstream s(json_string);
            Standard_Integer pos=2;
            return self->InitFromJson(s, pos);}
        };
		/****** gp_Ax1::IsCoaxial ******/
		/****** md5 signature: 83e812fb9b4f2dbfaef1061c7ad45615 ******/
		%feature("compactdefaultargs") IsCoaxial;
		%feature("autodoc", "
Parameters
----------
Other: gp_Ax1
AngularTolerance: double
LinearTolerance: double

Return
-------
bool

Description
-----------
Returns True if: . the angle between <self> and <Other> is lower or equal to <AngularTolerance> and . the distance between <self>.Location() and <Other> is lower or equal to <LinearTolerance> and . the distance between <Other>.Location() and <self> is lower or equal to LinearTolerance.
") IsCoaxial;
		bool IsCoaxial(const gp_Ax1 & Other, const double AngularTolerance, const double LinearTolerance);

		/****** gp_Ax1::IsNormal ******/
		/****** md5 signature: 8b5c8e34d0d89ccf10301d7b6645e800 ******/
		%feature("compactdefaultargs") IsNormal;
		%feature("autodoc", "
Parameters
----------
theOther: gp_Ax1
theAngularTolerance: double

Return
-------
bool

Description
-----------
Returns True if the direction of this and another axis are normal to each other. That is, if the angle between the two axes is equal to Pi/2. Note: the tolerance criterion is given by theAngularTolerance.
") IsNormal;
		bool IsNormal(const gp_Ax1 & theOther, const double theAngularTolerance);

		/****** gp_Ax1::IsOpposite ******/
		/****** md5 signature: 0ea5825c2b8c18c3a2e6ae0dbcd757cf ******/
		%feature("compactdefaultargs") IsOpposite;
		%feature("autodoc", "
Parameters
----------
theOther: gp_Ax1
theAngularTolerance: double

Return
-------
bool

Description
-----------
Returns True if the direction of this and another axis are parallel with opposite orientation. That is, if the angle between the two axes is equal to Pi. Note: the tolerance criterion is given by theAngularTolerance.
") IsOpposite;
		bool IsOpposite(const gp_Ax1 & theOther, const double theAngularTolerance);

		/****** gp_Ax1::IsParallel ******/
		/****** md5 signature: 4da59f451dec8360ed1900723355e199 ******/
		%feature("compactdefaultargs") IsParallel;
		%feature("autodoc", "
Parameters
----------
theOther: gp_Ax1
theAngularTolerance: double

Return
-------
bool

Description
-----------
Returns True if the direction of this and another axis are parallel with same orientation or opposite orientation. That is, if the angle between the two axes is equal to 0 or Pi. Note: the tolerance criterion is given by theAngularTolerance.
") IsParallel;
		bool IsParallel(const gp_Ax1 & theOther, const double theAngularTolerance);

		/****** gp_Ax1::Location ******/
		/****** md5 signature: 2c3e536bdb11b2c2c46fc19fd8a6c569 ******/
		%feature("compactdefaultargs") Location;
		%feature("autodoc", "Return
-------
gp_Pnt

Description
-----------
Returns the location point of <self>.
") Location;
		const gp_Pnt Location();

		/****** gp_Ax1::Mirror ******/
		/****** md5 signature: d149ec37669d36862dddc1e69726d44d ******/
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
Performs the symmetrical transformation of an axis placement with respect to the point P which is the center of the symmetry and assigns the result to this axis.
") Mirror;
		void Mirror(const gp_Pnt & P);

		/****** gp_Ax1::Mirror ******/
		/****** md5 signature: 452e8b6f6498c7e93e9ec374b00d33e6 ******/
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
Performs the symmetrical transformation of an axis placement with respect to an axis placement which is the axis of the symmetry and assigns the result to this axis.
") Mirror;
		void Mirror(const gp_Ax1 & A1);

		/****** gp_Ax1::Mirror ******/
		/****** md5 signature: 6509794bb82b6e1879b4f51f0339f90f ******/
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
Performs the symmetrical transformation of an axis placement with respect to a plane. The axis placement <A2> locates the plane of the symmetry: (Location, XDirection, YDirection) and assigns the result to this axis.
") Mirror;
		void Mirror(const gp_Ax2 & A2);

		/****** gp_Ax1::Mirrored ******/
		/****** md5 signature: f4e35f3985babe615e7af356d801b79e ******/
		%feature("compactdefaultargs") Mirrored;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt

Return
-------
gp_Ax1

Description
-----------
Performs the symmetrical transformation of an axis placement with respect to the point P which is the center of the symmetry and creates a new axis.
") Mirrored;
		gp_Ax1 Mirrored(const gp_Pnt & P);

		/****** gp_Ax1::Mirrored ******/
		/****** md5 signature: cb1e29516920243a84930f6b3853611f ******/
		%feature("compactdefaultargs") Mirrored;
		%feature("autodoc", "
Parameters
----------
A1: gp_Ax1

Return
-------
gp_Ax1

Description
-----------
Performs the symmetrical transformation of an axis placement with respect to an axis placement which is the axis of the symmetry and creates a new axis.
") Mirrored;
		gp_Ax1 Mirrored(const gp_Ax1 & A1);

		/****** gp_Ax1::Mirrored ******/
		/****** md5 signature: 240677007d19c4ceaebc282d59ceaf8e ******/
		%feature("compactdefaultargs") Mirrored;
		%feature("autodoc", "
Parameters
----------
A2: gp_Ax2

Return
-------
gp_Ax1

Description
-----------
Performs the symmetrical transformation of an axis placement with respect to a plane. The axis placement <A2> locates the plane of the symmetry: (Location, XDirection, YDirection) and creates a new axis.
") Mirrored;
		gp_Ax1 Mirrored(const gp_Ax2 & A2);

		/****** gp_Ax1::Reverse ******/
		/****** md5 signature: 229f8663d04c43240c56ed238a384b26 ******/
		%feature("compactdefaultargs") Reverse;
		%feature("autodoc", "Return
-------
None

Description
-----------
Reverses the unit vector of this axis and assigns the result to this axis.
") Reverse;
		void Reverse();

		/****** gp_Ax1::Reversed ******/
		/****** md5 signature: 3a47b616c60312636658e791107fa0e0 ******/
		%feature("compactdefaultargs") Reversed;
		%feature("autodoc", "Return
-------
gp_Ax1

Description
-----------
Reverses the unit vector of this axis and creates a new one.
") Reversed;
		gp_Ax1 Reversed();

		/****** gp_Ax1::Rotate ******/
		/****** md5 signature: 27fda2dae7c55e998ff72517ad377e45 ******/
		%feature("compactdefaultargs") Rotate;
		%feature("autodoc", "
Parameters
----------
theA1: gp_Ax1
theAngRad: double

Return
-------
None

Description
-----------
Rotates this axis at an angle theAngRad (in radians) about the axis theA1 and assigns the result to this axis.
") Rotate;
		void Rotate(const gp_Ax1 & theA1, const double theAngRad);

		/****** gp_Ax1::Rotated ******/
		/****** md5 signature: 898d76fd60b3f784fd5d1d4d886e4745 ******/
		%feature("compactdefaultargs") Rotated;
		%feature("autodoc", "
Parameters
----------
theA1: gp_Ax1
theAngRad: double

Return
-------
gp_Ax1

Description
-----------
Rotates this axis at an angle theAngRad (in radians) about the axis theA1 and creates a new one.
") Rotated;
		gp_Ax1 Rotated(const gp_Ax1 & theA1, const double theAngRad);

		/****** gp_Ax1::Scale ******/
		/****** md5 signature: ac261aa356d90bb031b712f6d0e16d96 ******/
		%feature("compactdefaultargs") Scale;
		%feature("autodoc", "
Parameters
----------
theP: gp_Pnt
theS: double

Return
-------
None

Description
-----------
Applies a scaling transformation to this axis with: - scale factor theS, and - center theP and assigns the result to this axis.
") Scale;
		void Scale(const gp_Pnt & theP, const double theS);

		/****** gp_Ax1::Scaled ******/
		/****** md5 signature: 58646f4b04b0ae936f90d47ae580d364 ******/
		%feature("compactdefaultargs") Scaled;
		%feature("autodoc", "
Parameters
----------
theP: gp_Pnt
theS: double

Return
-------
gp_Ax1

Description
-----------
Applies a scaling transformation to this axis with: - scale factor theS, and - center theP and creates a new axis.
") Scaled;
		gp_Ax1 Scaled(const gp_Pnt & theP, const double theS);

		/****** gp_Ax1::SetDirection ******/
		/****** md5 signature: ecfbd4ec664daf37cf5941e10ecef842 ******/
		%feature("compactdefaultargs") SetDirection;
		%feature("autodoc", "
Parameters
----------
theV: gp_Dir

Return
-------
None

Description
-----------
Assigns V as the 'Direction' of this axis.
") SetDirection;
		void SetDirection(const gp_Dir & theV);

		/****** gp_Ax1::SetLocation ******/
		/****** md5 signature: cdddcf5cbfcb37a25a0fad06f827f527 ******/
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
Assigns P as the origin of this axis.
") SetLocation;
		void SetLocation(const gp_Pnt & theP);

		/****** gp_Ax1::Transform ******/
		/****** md5 signature: ad39e75f28af84e2a27f2cfbe322b0a3 ******/
		%feature("compactdefaultargs") Transform;
		%feature("autodoc", "
Parameters
----------
theT: gp_Trsf

Return
-------
None

Description
-----------
Applies the transformation theT to this axis and assigns the result to this axis.
") Transform;
		void Transform(const gp_Trsf & theT);

		/****** gp_Ax1::Transformed ******/
		/****** md5 signature: 29ec1caee1c355de6e8ede6088d85cc5 ******/
		%feature("compactdefaultargs") Transformed;
		%feature("autodoc", "
Parameters
----------
theT: gp_Trsf

Return
-------
gp_Ax1

Description
-----------
Applies the transformation theT to this axis and creates a new one. //! Translates an axis plaxement in the direction of the vector <V>. The magnitude of the translation is the vector's magnitude.
") Transformed;
		gp_Ax1 Transformed(const gp_Trsf & theT);

		/****** gp_Ax1::Translate ******/
		/****** md5 signature: 8ae07d4c829c1eef2e7708ef5390638b ******/
		%feature("compactdefaultargs") Translate;
		%feature("autodoc", "
Parameters
----------
theV: gp_Vec

Return
-------
None

Description
-----------
Translates this axis by the vector theV, and assigns the result to this axis.
") Translate;
		void Translate(const gp_Vec & theV);

		/****** gp_Ax1::Translate ******/
		/****** md5 signature: 279c13d6194eb867625753d756d110ab ******/
		%feature("compactdefaultargs") Translate;
		%feature("autodoc", "
Parameters
----------
theP1: gp_Pnt
theP2: gp_Pnt

Return
-------
None

Description
-----------
Translates this axis by: the vector (theP1, theP2) defined from point theP1 to point theP2. and assigns the result to this axis.
") Translate;
		void Translate(const gp_Pnt & theP1, const gp_Pnt & theP2);

		/****** gp_Ax1::Translated ******/
		/****** md5 signature: f59805e4c645d56faded1555aaa5e242 ******/
		%feature("compactdefaultargs") Translated;
		%feature("autodoc", "
Parameters
----------
theV: gp_Vec

Return
-------
gp_Ax1

Description
-----------
Translates this axis by the vector theV, and creates a new one.
") Translated;
		gp_Ax1 Translated(const gp_Vec & theV);

		/****** gp_Ax1::Translated ******/
		/****** md5 signature: ae8faac084586066596b6960d1c27035 ******/
		%feature("compactdefaultargs") Translated;
		%feature("autodoc", "
Parameters
----------
theP1: gp_Pnt
theP2: gp_Pnt

Return
-------
gp_Ax1

Description
-----------
Translates this axis by: the vector (theP1, theP2) defined from point theP1 to point theP2. and creates a new one.
") Translated;
		gp_Ax1 Translated(const gp_Pnt & theP1, const gp_Pnt & theP2);

};



%extend gp_Ax1 {
%pythoncode {
    def __getstate__(self):
        return self.DumpJson()
    }
};

%extend gp_Ax1 {
%pythoncode {
    def __setstate__(self, state):
        inst = gp_Ax1()
        if inst.InitFromJson(state):
            self.this = inst.this
        else:
            raise IOError('Failed to set state of gp_Ax1')
    }
};
%extend gp_Ax1 {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************
* class gp_Ax2 *
***************/
class gp_Ax2 {
	public:
		/****** gp_Ax2::gp_Ax2 ******/
		/****** md5 signature: f854884d8470db26ad4c1626dbe80650 ******/
		%feature("compactdefaultargs") gp_Ax2;
		%feature("autodoc", "Return
-------
None

Description
-----------
Creates an object corresponding to the reference coordinate system (OXYZ).
") gp_Ax2;
		 gp_Ax2();

		/****** gp_Ax2::gp_Ax2 ******/
		/****** md5 signature: 4186a3383cec63c1de7a886d351d34ba ******/
		%feature("compactdefaultargs") gp_Ax2;
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
Creates an axis placement with an origin P such that: - N is the Direction, and - the 'X Direction' is normal to N, in the plane defined by the vectors (N, Vx): 'X Direction' = (N ^ Vx) ^ N, Exception: raises ConstructionError if N and Vx are parallel (same or opposite orientation).
") gp_Ax2;
		 gp_Ax2(const gp_Pnt & P, const gp_Dir & N, const gp_Dir & Vx);

		/****** gp_Ax2::gp_Ax2 ******/
		/****** md5 signature: 5f340287455bdfe4e13edc4601876f2e ******/
		%feature("compactdefaultargs") gp_Ax2;
		%feature("autodoc", "
Parameters
----------
theP: gp_Pnt
theN: gp_Dir::D
theVx: gp_Dir::D

Return
-------
None

Description
-----------
Creates an axis placement with standard directions.
") gp_Ax2;
		 gp_Ax2(const gp_Pnt & theP, const gp_Dir::D theN, const gp_Dir::D theVx);

		/****** gp_Ax2::gp_Ax2 ******/
		/****** md5 signature: 521894c3551259b470c23a56b917c3bc ******/
		%feature("compactdefaultargs") gp_Ax2;
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
Creates a coordinate system with an origin P, where V gives the 'main Direction' (here, 'X Direction' and 'Y Direction' are defined automatically).
") gp_Ax2;
		 gp_Ax2(const gp_Pnt & P, const gp_Dir & V);

		/****** gp_Ax2::gp_Ax2 ******/
		/****** md5 signature: 4a73c0c8998d592cb016549a4f589968 ******/
		%feature("compactdefaultargs") gp_Ax2;
		%feature("autodoc", "
Parameters
----------
theP: gp_Pnt
theV: gp_Dir::D

Return
-------
None

Description
-----------
Creates a coordinate system with an origin P and standard main direction.
") gp_Ax2;
		 gp_Ax2(const gp_Pnt & theP, const gp_Dir::D theV);

		/****** gp_Ax2::gp_Ax2 ******/
		/****** md5 signature: 941b5b2a0b065bb0126b1def41d6b35f ******/
		%feature("compactdefaultargs") gp_Ax2;
		%feature("autodoc", "
Parameters
----------
theV: gp_Dir::D

Return
-------
None

Description
-----------
Creates a coordinate system at the origin with the given standard main direction. Replaces gp::XOY(), gp::YOZ(), gp::ZOX() static functions.
") gp_Ax2;
		 gp_Ax2(const gp_Dir::D theV);

		/****** gp_Ax2::Angle ******/
		/****** md5 signature: b76715016850c5f13dd5dddbe2ff3198 ******/
		%feature("compactdefaultargs") Angle;
		%feature("autodoc", "
Parameters
----------
theOther: gp_Ax2

Return
-------
double

Description
-----------
Computes the angular value, in radians, between the main direction of <self> and the main direction of <theOther>. Returns the angle between 0 and PI in radians.
") Angle;
		double Angle(const gp_Ax2 & theOther);

		/****** gp_Ax2::Axis ******/
		/****** md5 signature: 92df3aa78c9ee700462ef461d4ed4603 ******/
		%feature("compactdefaultargs") Axis;
		%feature("autodoc", "Return
-------
gp_Ax1

Description
-----------
Returns the main axis of <self>. It is the 'Location' point and the main 'Direction'.
") Axis;
		const gp_Ax1 Axis();

		/****** gp_Ax2::Direction ******/
		/****** md5 signature: 52b593a77853d9d22e96443cc8f6fb8d ******/
		%feature("compactdefaultargs") Direction;
		%feature("autodoc", "Return
-------
gp_Dir

Description
-----------
Returns the main direction of <self>.
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

        /****************** InitFromJson ******************/
        %feature("autodoc", "
Parameters
----------
json_string: the string

Return
-------
bool

Description
-----------
Init the object from a JSON string.
") InitFromJson;
        %extend{
            bool InitFromJson(std::string json_string) {
            std::stringstream s(json_string);
            Standard_Integer pos=2;
            return self->InitFromJson(s, pos);}
        };
		/****** gp_Ax2::IsCoplanar ******/
		/****** md5 signature: a21b6fce0690c787817b15e33a51f45f ******/
		%feature("compactdefaultargs") IsCoplanar;
		%feature("autodoc", "
Parameters
----------
Other: gp_Ax2
LinearTolerance: double
AngularTolerance: double

Return
-------
bool

Description
-----------
No available documentation.
") IsCoplanar;
		bool IsCoplanar(const gp_Ax2 & Other, const double LinearTolerance, const double AngularTolerance);

		/****** gp_Ax2::IsCoplanar ******/
		/****** md5 signature: 29cb0806fc42afe82fc0b17024a525eb ******/
		%feature("compactdefaultargs") IsCoplanar;
		%feature("autodoc", "
Parameters
----------
A1: gp_Ax1
LinearTolerance: double
AngularTolerance: double

Return
-------
bool

Description
-----------
Returns True if: . the distance between <self> and the 'Location' point of A1 is lower of equal to LinearTolerance and . the main direction of <self> and the direction of A1 are normal. Note: the tolerance criterion for angular equality is given by AngularTolerance.
") IsCoplanar;
		bool IsCoplanar(const gp_Ax1 & A1, const double LinearTolerance, const double AngularTolerance);

		/****** gp_Ax2::Location ******/
		/****** md5 signature: 2c3e536bdb11b2c2c46fc19fd8a6c569 ******/
		%feature("compactdefaultargs") Location;
		%feature("autodoc", "Return
-------
gp_Pnt

Description
-----------
Returns the 'Location' point (origin) of <self>.
") Location;
		const gp_Pnt Location();

		/****** gp_Ax2::Mirror ******/
		/****** md5 signature: d149ec37669d36862dddc1e69726d44d ******/
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
Performs a symmetrical transformation of this coordinate system with respect to: - the point P, and assigns the result to this coordinate system. Warning This transformation is always performed on the origin. In case of a reflection with respect to a point: - the main direction of the coordinate system is not changed, and - the 'X Direction' and the 'Y Direction' are simply reversed In case of a reflection with respect to an axis or a plane: - the transformation is applied to the 'X Direction' and the 'Y Direction', then - the 'main Direction' is recomputed as the cross product 'X Direction' ^ 'Y Direction'. This maintains the right-handed property of the coordinate system.
") Mirror;
		void Mirror(const gp_Pnt & P);

		/****** gp_Ax2::Mirror ******/
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
Performs a symmetrical transformation of this coordinate system with respect to: - the axis A1, and assigns the result to this coordinate system. Warning This transformation is always performed on the origin. In case of a reflection with respect to a point: - the main direction of the coordinate system is not changed, and - the 'X Direction' and the 'Y Direction' are simply reversed In case of a reflection with respect to an axis or a plane: - the transformation is applied to the 'X Direction' and the 'Y Direction', then - the 'main Direction' is recomputed as the cross product 'X Direction' ^ 'Y Direction'. This maintains the right-handed property of the coordinate system.
") Mirror;
		void Mirror(const gp_Ax1 & A1);

		/****** gp_Ax2::Mirror ******/
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
Performs a symmetrical transformation of this coordinate system with respect to: - the plane defined by the origin, 'X Direction' and 'Y Direction' of coordinate system A2 and assigns the result to this coordinate system. Warning This transformation is always performed on the origin. In case of a reflection with respect to a point: - the main direction of the coordinate system is not changed, and - the 'X Direction' and the 'Y Direction' are simply reversed In case of a reflection with respect to an axis or a plane: - the transformation is applied to the 'X Direction' and the 'Y Direction', then - the 'main Direction' is recomputed as the cross product 'X Direction' ^ 'Y Direction'. This maintains the right-handed property of the coordinate system.
") Mirror;
		void Mirror(const gp_Ax2 & A2);

		/****** gp_Ax2::Mirrored ******/
		/****** md5 signature: 38c7b9fc45b9726034acd11f31ff4490 ******/
		%feature("compactdefaultargs") Mirrored;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt

Return
-------
gp_Ax2

Description
-----------
Performs a symmetrical transformation of this coordinate system with respect to: - the point P, and creates a new one. Warning This transformation is always performed on the origin. In case of a reflection with respect to a point: - the main direction of the coordinate system is not changed, and - the 'X Direction' and the 'Y Direction' are simply reversed In case of a reflection with respect to an axis or a plane: - the transformation is applied to the 'X Direction' and the 'Y Direction', then - the 'main Direction' is recomputed as the cross product 'X Direction' ^ 'Y Direction'. This maintains the right-handed property of the coordinate system.
") Mirrored;
		gp_Ax2 Mirrored(const gp_Pnt & P);

		/****** gp_Ax2::Mirrored ******/
		/****** md5 signature: cd76323d08d1a74c97ae7accdafbe5ed ******/
		%feature("compactdefaultargs") Mirrored;
		%feature("autodoc", "
Parameters
----------
A1: gp_Ax1

Return
-------
gp_Ax2

Description
-----------
Performs a symmetrical transformation of this coordinate system with respect to: - the axis A1, and creates a new one. Warning This transformation is always performed on the origin. In case of a reflection with respect to a point: - the main direction of the coordinate system is not changed, and - the 'X Direction' and the 'Y Direction' are simply reversed In case of a reflection with respect to an axis or a plane: - the transformation is applied to the 'X Direction' and the 'Y Direction', then - the 'main Direction' is recomputed as the cross product 'X Direction' ^ 'Y Direction'. This maintains the right-handed property of the coordinate system.
") Mirrored;
		gp_Ax2 Mirrored(const gp_Ax1 & A1);

		/****** gp_Ax2::Mirrored ******/
		/****** md5 signature: be1595105fbb55ff06221b22fd36206f ******/
		%feature("compactdefaultargs") Mirrored;
		%feature("autodoc", "
Parameters
----------
A2: gp_Ax2

Return
-------
gp_Ax2

Description
-----------
Performs a symmetrical transformation of this coordinate system with respect to: - the plane defined by the origin, 'X Direction' and 'Y Direction' of coordinate system A2 and creates a new one. Warning This transformation is always performed on the origin. In case of a reflection with respect to a point: - the main direction of the coordinate system is not changed, and - the 'X Direction' and the 'Y Direction' are simply reversed In case of a reflection with respect to an axis or a plane: - the transformation is applied to the 'X Direction' and the 'Y Direction', then - the 'main Direction' is recomputed as the cross product 'X Direction' ^ 'Y Direction'. This maintains the right-handed property of the coordinate system.
") Mirrored;
		gp_Ax2 Mirrored(const gp_Ax2 & A2);

		/****** gp_Ax2::Rotate ******/
		/****** md5 signature: 652dfbf621c2c092ff5b68d608de4634 ******/
		%feature("compactdefaultargs") Rotate;
		%feature("autodoc", "
Parameters
----------
theA1: gp_Ax1
theAng: double

Return
-------
None

Description
-----------
No available documentation.
") Rotate;
		void Rotate(const gp_Ax1 & theA1, const double theAng);

		/****** gp_Ax2::Rotated ******/
		/****** md5 signature: 29ae4066bfb14a7c03c8c9989d03f46b ******/
		%feature("compactdefaultargs") Rotated;
		%feature("autodoc", "
Parameters
----------
theA1: gp_Ax1
theAng: double

Return
-------
gp_Ax2

Description
-----------
Rotates an axis placement. <theA1> is the axis of the rotation. theAng is the angular value of the rotation in radians.
") Rotated;
		gp_Ax2 Rotated(const gp_Ax1 & theA1, const double theAng);

		/****** gp_Ax2::Scale ******/
		/****** md5 signature: ac261aa356d90bb031b712f6d0e16d96 ******/
		%feature("compactdefaultargs") Scale;
		%feature("autodoc", "
Parameters
----------
theP: gp_Pnt
theS: double

Return
-------
None

Description
-----------
No available documentation.
") Scale;
		void Scale(const gp_Pnt & theP, const double theS);

		/****** gp_Ax2::Scaled ******/
		/****** md5 signature: 50871652697c74da4bb2c1c4991b46c0 ******/
		%feature("compactdefaultargs") Scaled;
		%feature("autodoc", "
Parameters
----------
theP: gp_Pnt
theS: double

Return
-------
gp_Ax2

Description
-----------
Applies a scaling transformation on the axis placement. The 'Location' point of the axisplacement is modified. Warnings: If the scale <S> is negative: . the main direction of the axis placement is not changed. . The 'XDirection' and the 'YDirection' are reversed. So the axis placement stay right handed.
") Scaled;
		gp_Ax2 Scaled(const gp_Pnt & theP, const double theS);

		/****** gp_Ax2::SetAxis ******/
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
Assigns the origin and 'main Direction' of the axis A1 to this coordinate system, then recomputes its 'X Direction' and 'Y Direction'. Note: The new 'X Direction' is computed as follows: new 'X Direction' = V1 ^(previous 'X Direction' ^ V) where V is the 'Direction' of A1. Exceptions Standard_ConstructionError if A1 is parallel to the 'X Direction' of this coordinate system.
") SetAxis;
		void SetAxis(const gp_Ax1 & A1);

		/****** gp_Ax2::SetDirection ******/
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
Changes the 'main Direction' of this coordinate system, then recomputes its 'X Direction' and 'Y Direction'. Note: the new 'X Direction' is computed as follows: new 'X Direction' = V ^ (previous 'X Direction' ^ V) Exceptions Standard_ConstructionError if V is parallel to the 'X Direction' of this coordinate system.
") SetDirection;
		void SetDirection(const gp_Dir & V);

		/****** gp_Ax2::SetLocation ******/
		/****** md5 signature: cdddcf5cbfcb37a25a0fad06f827f527 ******/
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
Changes the 'Location' point (origin) of <self>.
") SetLocation;
		void SetLocation(const gp_Pnt & theP);

		/****** gp_Ax2::SetXDirection ******/
		/****** md5 signature: 3d3bab20c677349ee7fa8a9102c91ae2 ******/
		%feature("compactdefaultargs") SetXDirection;
		%feature("autodoc", "
Parameters
----------
theVx: gp_Dir

Return
-------
None

Description
-----------
Changes the 'Xdirection' of <self>. The main direction 'Direction' is not modified, the 'Ydirection' is modified. If <Vx> is not normal to the main direction then <XDirection> is computed as follows XDirection = Direction ^ (Vx ^ Direction). Exceptions Standard_ConstructionError if Vx or Vy is parallel to the 'main Direction' of this coordinate system.
") SetXDirection;
		void SetXDirection(const gp_Dir & theVx);

		/****** gp_Ax2::SetYDirection ******/
		/****** md5 signature: f2ed46b9eac8afb73a5e63e5efa3be13 ******/
		%feature("compactdefaultargs") SetYDirection;
		%feature("autodoc", "
Parameters
----------
theVy: gp_Dir

Return
-------
None

Description
-----------
Changes the 'Ydirection' of <self>. The main direction is not modified but the 'Xdirection' is changed. If <Vy> is not normal to the main direction then 'YDirection' is computed as follows YDirection = Direction ^ (<Vy> ^ Direction). Exceptions Standard_ConstructionError if Vx or Vy is parallel to the 'main Direction' of this coordinate system.
") SetYDirection;
		void SetYDirection(const gp_Dir & theVy);

		/****** gp_Ax2::Transform ******/
		/****** md5 signature: ad39e75f28af84e2a27f2cfbe322b0a3 ******/
		%feature("compactdefaultargs") Transform;
		%feature("autodoc", "
Parameters
----------
theT: gp_Trsf

Return
-------
None

Description
-----------
No available documentation.
") Transform;
		void Transform(const gp_Trsf & theT);

		/****** gp_Ax2::Transformed ******/
		/****** md5 signature: eab1930f7a063cb7876b93843ac8abf3 ******/
		%feature("compactdefaultargs") Transformed;
		%feature("autodoc", "
Parameters
----------
theT: gp_Trsf

Return
-------
gp_Ax2

Description
-----------
Transforms an axis placement with a Trsf. The 'Location' point, the 'XDirection' and the 'YDirection' are transformed with theT. The resulting main 'Direction' of <self> is the cross product between the 'XDirection' and the 'YDirection' after transformation.
") Transformed;
		gp_Ax2 Transformed(const gp_Trsf & theT);

		/****** gp_Ax2::Translate ******/
		/****** md5 signature: 8ae07d4c829c1eef2e7708ef5390638b ******/
		%feature("compactdefaultargs") Translate;
		%feature("autodoc", "
Parameters
----------
theV: gp_Vec

Return
-------
None

Description
-----------
No available documentation.
") Translate;
		void Translate(const gp_Vec & theV);

		/****** gp_Ax2::Translate ******/
		/****** md5 signature: 279c13d6194eb867625753d756d110ab ******/
		%feature("compactdefaultargs") Translate;
		%feature("autodoc", "
Parameters
----------
theP1: gp_Pnt
theP2: gp_Pnt

Return
-------
None

Description
-----------
No available documentation.
") Translate;
		void Translate(const gp_Pnt & theP1, const gp_Pnt & theP2);

		/****** gp_Ax2::Translated ******/
		/****** md5 signature: 68e56b2e8d9e4c52894cdaef64cc9458 ******/
		%feature("compactdefaultargs") Translated;
		%feature("autodoc", "
Parameters
----------
theV: gp_Vec

Return
-------
gp_Ax2

Description
-----------
Translates an axis plaxement in the direction of the vector <theV>. The magnitude of the translation is the vector's magnitude.
") Translated;
		gp_Ax2 Translated(const gp_Vec & theV);

		/****** gp_Ax2::Translated ******/
		/****** md5 signature: fc84ec5cb84c4547873599211090b57c ******/
		%feature("compactdefaultargs") Translated;
		%feature("autodoc", "
Parameters
----------
theP1: gp_Pnt
theP2: gp_Pnt

Return
-------
gp_Ax2

Description
-----------
Translates an axis placement from the point <theP1> to the point <theP2>.
") Translated;
		gp_Ax2 Translated(const gp_Pnt & theP1, const gp_Pnt & theP2);

		/****** gp_Ax2::XDirection ******/
		/****** md5 signature: dee10cdd5f6822ed9986a335f6eb04c9 ******/
		%feature("compactdefaultargs") XDirection;
		%feature("autodoc", "Return
-------
gp_Dir

Description
-----------
Returns the 'XDirection' of <self>.
") XDirection;
		const gp_Dir XDirection();

		/****** gp_Ax2::YDirection ******/
		/****** md5 signature: 4c555b344552f4ee65787c4d01d35837 ******/
		%feature("compactdefaultargs") YDirection;
		%feature("autodoc", "Return
-------
gp_Dir

Description
-----------
Returns the 'YDirection' of <self>.
") YDirection;
		const gp_Dir YDirection();

};



%extend gp_Ax2 {
%pythoncode {
    def __getstate__(self):
        return self.DumpJson()
    }
};

%extend gp_Ax2 {
%pythoncode {
    def __setstate__(self, state):
        inst = gp_Ax2()
        if inst.InitFromJson(state):
            self.this = inst.this
        else:
            raise IOError('Failed to set state of gp_Ax2')
    }
};
%extend gp_Ax2 {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************
* class gp_Ax22d *
*****************/
class gp_Ax22d {
	public:
		/****** gp_Ax22d::gp_Ax22d ******/
		/****** md5 signature: 389390161c77d81c270fd899d8502c1b ******/
		%feature("compactdefaultargs") gp_Ax22d;
		%feature("autodoc", "Return
-------
None

Description
-----------
Creates an object representing the reference coordinate system (OXY).
") gp_Ax22d;
		 gp_Ax22d();

		/****** gp_Ax22d::gp_Ax22d ******/
		/****** md5 signature: e530b86b6f776a56be9637454845b918 ******/
		%feature("compactdefaultargs") gp_Ax22d;
		%feature("autodoc", "
Parameters
----------
theP: gp_Pnt2d
theVx: gp_Dir2d
theVy: gp_Dir2d

Return
-------
None

Description
-----------
Creates a coordinate system with origin theP and where: - theVx is the 'X Direction', and - the 'Y Direction' is orthogonal to theVx and oriented so that the cross products theVx^'Y Direction' and theVx^theVy have the same sign. Raises ConstructionError if theVx and theVy are parallel (same or opposite orientation).
") gp_Ax22d;
		 gp_Ax22d(const gp_Pnt2d & theP, const gp_Dir2d & theVx, const gp_Dir2d & theVy);

		/****** gp_Ax22d::gp_Ax22d ******/
		/****** md5 signature: 541a2ea6729c108ec291a2c31520c905 ******/
		%feature("compactdefaultargs") gp_Ax22d;
		%feature("autodoc", "
Parameters
----------
theP: gp_Pnt2d
theV: gp_Dir2d
theIsSense: bool (optional, default to true)

Return
-------
None

Description
-----------
Creates a coordinate system with origin theP and 'X Direction' theV, which is: - right-handed if theIsSense is true (default value), or - left-handed if theIsSense is false.
") gp_Ax22d;
		 gp_Ax22d(const gp_Pnt2d & theP, const gp_Dir2d & theV, const bool theIsSense = true);

		/****** gp_Ax22d::gp_Ax22d ******/
		/****** md5 signature: b6ccd3efe808609e3b6143c93279e629 ******/
		%feature("compactdefaultargs") gp_Ax22d;
		%feature("autodoc", "
Parameters
----------
theA: gp_Ax2d
theIsSense: bool (optional, default to true)

Return
-------
None

Description
-----------
Creates a coordinate system where its origin is the origin of theA and its 'X Direction' is the unit vector of theA, which is: - right-handed if theIsSense is true (default value), or - left-handed if theIsSense is false.
") gp_Ax22d;
		 gp_Ax22d(const gp_Ax2d & theA, const bool theIsSense = true);


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
		/****** gp_Ax22d::Location ******/
		/****** md5 signature: 61a7e489acd8b8c2b8c75b6b63b63221 ******/
		%feature("compactdefaultargs") Location;
		%feature("autodoc", "Return
-------
gp_Pnt2d

Description
-----------
Returns the 'Location' point (origin) of <self>.
") Location;
		const gp_Pnt2d Location();

		/****** gp_Ax22d::Mirror ******/
		/****** md5 signature: 55ca8745c822fce8b8395ef5348dd658 ******/
		%feature("compactdefaultargs") Mirror;
		%feature("autodoc", "
Parameters
----------
theP: gp_Pnt2d

Return
-------
None

Description
-----------
No available documentation.
") Mirror;
		void Mirror(const gp_Pnt2d & theP);

		/****** gp_Ax22d::Mirror ******/
		/****** md5 signature: c8b01b19fc436ab187f95301941edbc1 ******/
		%feature("compactdefaultargs") Mirror;
		%feature("autodoc", "
Parameters
----------
theA: gp_Ax2d

Return
-------
None

Description
-----------
No available documentation.
") Mirror;
		void Mirror(const gp_Ax2d & theA);

		/****** gp_Ax22d::Mirrored ******/
		/****** md5 signature: 9e5be8c0ea1b99c3eb3d1574d992bff1 ******/
		%feature("compactdefaultargs") Mirrored;
		%feature("autodoc", "
Parameters
----------
theP: gp_Pnt2d

Return
-------
gp_Ax22d

Description
-----------
Performs the symmetrical transformation of an axis placement with respect to the point theP which is the center of the symmetry. Warnings: The main direction of the axis placement is not changed. The 'XDirection' and the 'YDirection' are reversed. So the axis placement stay right handed.
") Mirrored;
		gp_Ax22d Mirrored(const gp_Pnt2d & theP);

		/****** gp_Ax22d::Mirrored ******/
		/****** md5 signature: e213bc446f942db86bc856cb8c5f847e ******/
		%feature("compactdefaultargs") Mirrored;
		%feature("autodoc", "
Parameters
----------
theA: gp_Ax2d

Return
-------
gp_Ax22d

Description
-----------
Performs the symmetrical transformation of an axis placement with respect to an axis placement which is the axis of the symmetry. The transformation is performed on the 'Location' point, on the 'XDirection' and 'YDirection'. The resulting main 'Direction' is the cross product between the 'XDirection' and the 'YDirection' after transformation.
") Mirrored;
		gp_Ax22d Mirrored(const gp_Ax2d & theA);

		/****** gp_Ax22d::Rotate ******/
		/****** md5 signature: 7b903ea495df9da9f0d582a332f1eb65 ******/
		%feature("compactdefaultargs") Rotate;
		%feature("autodoc", "
Parameters
----------
theP: gp_Pnt2d
theAng: double

Return
-------
None

Description
-----------
No available documentation.
") Rotate;
		void Rotate(const gp_Pnt2d & theP, const double theAng);

		/****** gp_Ax22d::Rotated ******/
		/****** md5 signature: 5e1d726c4fa5e22255cb3c4e08afbbf1 ******/
		%feature("compactdefaultargs") Rotated;
		%feature("autodoc", "
Parameters
----------
theP: gp_Pnt2d
theAng: double

Return
-------
gp_Ax22d

Description
-----------
Rotates an axis placement. <theA1> is the axis of the rotation. theAng is the angular value of the rotation in radians.
") Rotated;
		gp_Ax22d Rotated(const gp_Pnt2d & theP, const double theAng);

		/****** gp_Ax22d::Scale ******/
		/****** md5 signature: ce786424d6b372a402b20bab4c859bd5 ******/
		%feature("compactdefaultargs") Scale;
		%feature("autodoc", "
Parameters
----------
theP: gp_Pnt2d
theS: double

Return
-------
None

Description
-----------
No available documentation.
") Scale;
		void Scale(const gp_Pnt2d & theP, const double theS);

		/****** gp_Ax22d::Scaled ******/
		/****** md5 signature: 0fcf2961307eb7fdd3adab846546298b ******/
		%feature("compactdefaultargs") Scaled;
		%feature("autodoc", "
Parameters
----------
theP: gp_Pnt2d
theS: double

Return
-------
gp_Ax22d

Description
-----------
Applies a scaling transformation on the axis placement. The 'Location' point of the axisplacement is modified. Warnings: If the scale <theS> is negative: . the main direction of the axis placement is not changed. . The 'XDirection' and the 'YDirection' are reversed. So the axis placement stay right handed.
") Scaled;
		gp_Ax22d Scaled(const gp_Pnt2d & theP, const double theS);

		/****** gp_Ax22d::SetAxis ******/
		/****** md5 signature: a7e3dc68dc3b05ba227677785510d38b ******/
		%feature("compactdefaultargs") SetAxis;
		%feature("autodoc", "
Parameters
----------
theA1: gp_Ax22d

Return
-------
None

Description
-----------
Assigns the origin and the two unit vectors of the coordinate system theA1 to this coordinate system.
") SetAxis;
		void SetAxis(const gp_Ax22d & theA1);

		/****** gp_Ax22d::SetLocation ******/
		/****** md5 signature: 480b751d2165373d2617a13d19b91d48 ******/
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
Changes the 'Location' point (origin) of <self>.
") SetLocation;
		void SetLocation(const gp_Pnt2d & theP);

		/****** gp_Ax22d::SetXAxis ******/
		/****** md5 signature: 3f511b47f249fb8f69b58750631ef87d ******/
		%feature("compactdefaultargs") SetXAxis;
		%feature("autodoc", "
Parameters
----------
theA1: gp_Ax2d

Return
-------
None

Description
-----------
Changes the XAxis and YAxis ('Location' point and 'Direction') of <self>. The 'YDirection' is recomputed in the same sense as before.
") SetXAxis;
		void SetXAxis(const gp_Ax2d & theA1);

		/****** gp_Ax22d::SetXDirection ******/
		/****** md5 signature: bca08891ed2f4f4f003c6afdda128a1d ******/
		%feature("compactdefaultargs") SetXDirection;
		%feature("autodoc", "
Parameters
----------
theVx: gp_Dir2d

Return
-------
None

Description
-----------
Assigns theVx to the 'X Direction' of this coordinate system. The other unit vector of this coordinate system is recomputed, normal to theVx , without modifying the orientation (right-handed or left-handed) of this coordinate system.
") SetXDirection;
		void SetXDirection(const gp_Dir2d & theVx);

		/****** gp_Ax22d::SetYAxis ******/
		/****** md5 signature: 39eb91ab786b088536e97004bcc7338c ******/
		%feature("compactdefaultargs") SetYAxis;
		%feature("autodoc", "
Parameters
----------
theA1: gp_Ax2d

Return
-------
None

Description
-----------
Changes the XAxis and YAxis ('Location' point and 'Direction') of <self>. The 'XDirection' is recomputed in the same sense as before.
") SetYAxis;
		void SetYAxis(const gp_Ax2d & theA1);

		/****** gp_Ax22d::SetYDirection ******/
		/****** md5 signature: ab36ffd4d07f996b67d3376d947d113c ******/
		%feature("compactdefaultargs") SetYDirection;
		%feature("autodoc", "
Parameters
----------
theVy: gp_Dir2d

Return
-------
None

Description
-----------
Assigns theVy to the 'Y Direction' of this coordinate system. The other unit vector of this coordinate system is recomputed, normal to theVy, without modifying the orientation (right-handed or left-handed) of this coordinate system.
") SetYDirection;
		void SetYDirection(const gp_Dir2d & theVy);

		/****** gp_Ax22d::Transform ******/
		/****** md5 signature: 3afd1642fe7b497a7dbcbc3902ad7fa7 ******/
		%feature("compactdefaultargs") Transform;
		%feature("autodoc", "
Parameters
----------
theT: gp_Trsf2d

Return
-------
None

Description
-----------
No available documentation.
") Transform;
		void Transform(const gp_Trsf2d & theT);

		/****** gp_Ax22d::Transformed ******/
		/****** md5 signature: 533173274bc81be883d8e80dc324d48c ******/
		%feature("compactdefaultargs") Transformed;
		%feature("autodoc", "
Parameters
----------
theT: gp_Trsf2d

Return
-------
gp_Ax22d

Description
-----------
Transforms an axis placement with a Trsf. The 'Location' point, the 'XDirection' and the 'YDirection' are transformed with theT. The resulting main 'Direction' of <self> is the cross product between the 'XDirection' and the 'YDirection' after transformation.
") Transformed;
		gp_Ax22d Transformed(const gp_Trsf2d & theT);

		/****** gp_Ax22d::Translate ******/
		/****** md5 signature: db1336b52b0bf528c543a448adb435f1 ******/
		%feature("compactdefaultargs") Translate;
		%feature("autodoc", "
Parameters
----------
theV: gp_Vec2d

Return
-------
None

Description
-----------
No available documentation.
") Translate;
		void Translate(const gp_Vec2d & theV);

		/****** gp_Ax22d::Translate ******/
		/****** md5 signature: fbfb79b99757b462451a758b25d06d71 ******/
		%feature("compactdefaultargs") Translate;
		%feature("autodoc", "
Parameters
----------
theP1: gp_Pnt2d
theP2: gp_Pnt2d

Return
-------
None

Description
-----------
No available documentation.
") Translate;
		void Translate(const gp_Pnt2d & theP1, const gp_Pnt2d & theP2);

		/****** gp_Ax22d::Translated ******/
		/****** md5 signature: e837509fa6e447b42c82577ccc002464 ******/
		%feature("compactdefaultargs") Translated;
		%feature("autodoc", "
Parameters
----------
theV: gp_Vec2d

Return
-------
gp_Ax22d

Description
-----------
Translates an axis plaxement in the direction of the vector <theV>. The magnitude of the translation is the vector's magnitude.
") Translated;
		gp_Ax22d Translated(const gp_Vec2d & theV);

		/****** gp_Ax22d::Translated ******/
		/****** md5 signature: ae6670cc7e88de8c8597aa5603a06607 ******/
		%feature("compactdefaultargs") Translated;
		%feature("autodoc", "
Parameters
----------
theP1: gp_Pnt2d
theP2: gp_Pnt2d

Return
-------
gp_Ax22d

Description
-----------
Translates an axis placement from the point <theP1> to the point <theP2>.
") Translated;
		gp_Ax22d Translated(const gp_Pnt2d & theP1, const gp_Pnt2d & theP2);

		/****** gp_Ax22d::XAxis ******/
		/****** md5 signature: 6a005542df14e10d67ac38644cf8c7ae ******/
		%feature("compactdefaultargs") XAxis;
		%feature("autodoc", "Return
-------
gp_Ax2d

Description
-----------
Returns an axis, for which - the origin is that of this coordinate system, and - the unit vector is either the 'X Direction' of this coordinate system. Note: the result is the 'X Axis' of this coordinate system.
") XAxis;
		gp_Ax2d XAxis();

		/****** gp_Ax22d::XDirection ******/
		/****** md5 signature: d556e1d5fc9ec2eb23ed426fafdc650e ******/
		%feature("compactdefaultargs") XDirection;
		%feature("autodoc", "Return
-------
gp_Dir2d

Description
-----------
Returns the 'XDirection' of <self>.
") XDirection;
		const gp_Dir2d XDirection();

		/****** gp_Ax22d::YAxis ******/
		/****** md5 signature: d49975ff0e9ed400148a36ac6e990919 ******/
		%feature("compactdefaultargs") YAxis;
		%feature("autodoc", "Return
-------
gp_Ax2d

Description
-----------
Returns an axis, for which - the origin is that of this coordinate system, and - the unit vector is either the 'Y Direction' of this coordinate system. Note: the result is the 'Y Axis' of this coordinate system.
") YAxis;
		gp_Ax2d YAxis();

		/****** gp_Ax22d::YDirection ******/
		/****** md5 signature: 8af4e159f9100cec772ebc00a8af3413 ******/
		%feature("compactdefaultargs") YDirection;
		%feature("autodoc", "Return
-------
gp_Dir2d

Description
-----------
Returns the 'YDirection' of <self>.
") YDirection;
		const gp_Dir2d YDirection();

};



%extend gp_Ax22d {
%pythoncode {
    def __getstate__(self):
        return self.DumpJson()
    }
};

%extend gp_Ax22d {
%pythoncode {
    def __setstate__(self, state):
        inst = gp_Ax22d()
        if inst.InitFromJson(state):
            self.this = inst.this
        else:
            raise IOError('Failed to set state of gp_Ax22d')
    }
};
%extend gp_Ax22d {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************
* class gp_Ax2d *
****************/
class gp_Ax2d {
	public:
		/****** gp_Ax2d::gp_Ax2d ******/
		/****** md5 signature: 27758b909580dd7eff108111c2b568f6 ******/
		%feature("compactdefaultargs") gp_Ax2d;
		%feature("autodoc", "Return
-------
None

Description
-----------
Creates an axis object representing X axis of the reference coordinate system.
") gp_Ax2d;
		 gp_Ax2d();

		/****** gp_Ax2d::gp_Ax2d ******/
		/****** md5 signature: ff12f7f666b5330716769cab587e87eb ******/
		%feature("compactdefaultargs") gp_Ax2d;
		%feature("autodoc", "
Parameters
----------
theP: gp_Pnt2d
theV: gp_Dir2d

Return
-------
None

Description
-----------
Creates an Ax2d. <theP> is the 'Location' point of the axis placement and theV is the 'Direction' of the axis placement.
") gp_Ax2d;
		 gp_Ax2d(const gp_Pnt2d & theP, const gp_Dir2d & theV);

		/****** gp_Ax2d::gp_Ax2d ******/
		/****** md5 signature: b6eba3d9e8fdd5556b3a931fcb41d978 ******/
		%feature("compactdefaultargs") gp_Ax2d;
		%feature("autodoc", "
Parameters
----------
theP: gp_Pnt2d
theDir: gp_Dir2d::D

Return
-------
None

Description
-----------
Creates an axis with the given location point and standard direction.
") gp_Ax2d;
		 gp_Ax2d(const gp_Pnt2d & theP, const gp_Dir2d::D theDir);

		/****** gp_Ax2d::gp_Ax2d ******/
		/****** md5 signature: b2d9cb51ef9815c15319f86c15f870ce ******/
		%feature("compactdefaultargs") gp_Ax2d;
		%feature("autodoc", "
Parameters
----------
theDir: gp_Dir2d::D

Return
-------
None

Description
-----------
Creates an axis at the origin with the given standard direction. Replaces gp::OX2d(), gp::OY2d() static functions.
") gp_Ax2d;
		 gp_Ax2d(const gp_Dir2d::D theDir);

		/****** gp_Ax2d::Angle ******/
		/****** md5 signature: 6a6f7d3b35d4dcb01e69744323c21503 ******/
		%feature("compactdefaultargs") Angle;
		%feature("autodoc", "
Parameters
----------
theOther: gp_Ax2d

Return
-------
double

Description
-----------
Computes the angle, in radians, between this axis and the axis theOther. The value of the angle is between -Pi and Pi.
") Angle;
		double Angle(const gp_Ax2d & theOther);

		/****** gp_Ax2d::Direction ******/
		/****** md5 signature: 42aa5ac2d9cfd7cf75f22d42d8d3d6d6 ******/
		%feature("compactdefaultargs") Direction;
		%feature("autodoc", "Return
-------
gp_Dir2d

Description
-----------
Returns the direction of <self>.
") Direction;
		const gp_Dir2d Direction();


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
		/****** gp_Ax2d::IsCoaxial ******/
		/****** md5 signature: b907558b38669abd53220b89248062b2 ******/
		%feature("compactdefaultargs") IsCoaxial;
		%feature("autodoc", "
Parameters
----------
Other: gp_Ax2d
AngularTolerance: double
LinearTolerance: double

Return
-------
bool

Description
-----------
Returns True if: . the angle between <self> and <Other> is lower or equal to <AngularTolerance> and . the distance between <self>.Location() and <Other> is lower or equal to <LinearTolerance> and . the distance between <Other>.Location() and <self> is lower or equal to LinearTolerance.
") IsCoaxial;
		bool IsCoaxial(const gp_Ax2d & Other, const double AngularTolerance, const double LinearTolerance);

		/****** gp_Ax2d::IsNormal ******/
		/****** md5 signature: 47327a6a29ac464d7be229a302e772a6 ******/
		%feature("compactdefaultargs") IsNormal;
		%feature("autodoc", "
Parameters
----------
theOther: gp_Ax2d
theAngularTolerance: double

Return
-------
bool

Description
-----------
Returns true if this axis and the axis theOther are normal to each other. That is, if the angle between the two axes is equal to Pi/2 or -Pi/2. Note: the tolerance criterion is given by theAngularTolerance.
") IsNormal;
		bool IsNormal(const gp_Ax2d & theOther, const double theAngularTolerance);

		/****** gp_Ax2d::IsOpposite ******/
		/****** md5 signature: 200e16d5dabf017ca1b09d531b6494a9 ******/
		%feature("compactdefaultargs") IsOpposite;
		%feature("autodoc", "
Parameters
----------
theOther: gp_Ax2d
theAngularTolerance: double

Return
-------
bool

Description
-----------
Returns true if this axis and the axis theOther are parallel, and have opposite orientations. That is, if the angle between the two axes is equal to Pi or -Pi. Note: the tolerance criterion is given by theAngularTolerance.
") IsOpposite;
		bool IsOpposite(const gp_Ax2d & theOther, const double theAngularTolerance);

		/****** gp_Ax2d::IsParallel ******/
		/****** md5 signature: aab42ccc8b094608e56d9550d8af8fc6 ******/
		%feature("compactdefaultargs") IsParallel;
		%feature("autodoc", "
Parameters
----------
theOther: gp_Ax2d
theAngularTolerance: double

Return
-------
bool

Description
-----------
Returns true if this axis and the axis theOther are parallel, and have either the same or opposite orientations. That is, if the angle between the two axes is equal to 0, Pi or -Pi. Note: the tolerance criterion is given by theAngularTolerance.
") IsParallel;
		bool IsParallel(const gp_Ax2d & theOther, const double theAngularTolerance);

		/****** gp_Ax2d::Location ******/
		/****** md5 signature: 61a7e489acd8b8c2b8c75b6b63b63221 ******/
		%feature("compactdefaultargs") Location;
		%feature("autodoc", "Return
-------
gp_Pnt2d

Description
-----------
Returns the origin of <self>.
") Location;
		const gp_Pnt2d Location();

		/****** gp_Ax2d::Mirror ******/
		/****** md5 signature: b122cf50ae2751c58c84dce93bec72a3 ******/
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
No available documentation.
") Mirror;
		void Mirror(const gp_Pnt2d & P);

		/****** gp_Ax2d::Mirror ******/
		/****** md5 signature: 0d22af2454c14903dfb18e98aed9be26 ******/
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
No available documentation.
") Mirror;
		void Mirror(const gp_Ax2d & A);

		/****** gp_Ax2d::Mirrored ******/
		/****** md5 signature: 0814fb67e1e26dd8bb9a20c87ee775fe ******/
		%feature("compactdefaultargs") Mirrored;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt2d

Return
-------
gp_Ax2d

Description
-----------
Performs the symmetrical transformation of an axis placement with respect to the point P which is the center of the symmetry.
") Mirrored;
		gp_Ax2d Mirrored(const gp_Pnt2d & P);

		/****** gp_Ax2d::Mirrored ******/
		/****** md5 signature: 1e33fae38de448458ff5775da0f51a1c ******/
		%feature("compactdefaultargs") Mirrored;
		%feature("autodoc", "
Parameters
----------
A: gp_Ax2d

Return
-------
gp_Ax2d

Description
-----------
Performs the symmetrical transformation of an axis placement with respect to an axis placement which is the axis of the symmetry.
") Mirrored;
		gp_Ax2d Mirrored(const gp_Ax2d & A);

		/****** gp_Ax2d::Reverse ******/
		/****** md5 signature: 229f8663d04c43240c56ed238a384b26 ******/
		%feature("compactdefaultargs") Reverse;
		%feature("autodoc", "Return
-------
None

Description
-----------
Reverses the direction of <self> and assigns the result to this axis.
") Reverse;
		void Reverse();

		/****** gp_Ax2d::Reversed ******/
		/****** md5 signature: 821f5eaeb4398e15d6a463be361b142a ******/
		%feature("compactdefaultargs") Reversed;
		%feature("autodoc", "Return
-------
gp_Ax2d

Description
-----------
Computes a new axis placement with a direction opposite to the direction of <self>.
") Reversed;
		gp_Ax2d Reversed();

		/****** gp_Ax2d::Rotate ******/
		/****** md5 signature: 084595cbfff710f953ac0ae91d732bf0 ******/
		%feature("compactdefaultargs") Rotate;
		%feature("autodoc", "
Parameters
----------
theP: gp_Pnt2d
theAng: double

Return
-------
None

Description
-----------
No available documentation.
") Rotate;
		void Rotate(const gp_Pnt2d & theP, const double theAng);

		/****** gp_Ax2d::Rotated ******/
		/****** md5 signature: 796a900aa99ddf1ed14822a5c427dd0e ******/
		%feature("compactdefaultargs") Rotated;
		%feature("autodoc", "
Parameters
----------
theP: gp_Pnt2d
theAng: double

Return
-------
gp_Ax2d

Description
-----------
Rotates an axis placement. <theP> is the center of the rotation. theAng is the angular value of the rotation in radians.
") Rotated;
		gp_Ax2d Rotated(const gp_Pnt2d & theP, const double theAng);

		/****** gp_Ax2d::Scale ******/
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
No available documentation.
") Scale;
		void Scale(const gp_Pnt2d & P, const double S);

		/****** gp_Ax2d::Scaled ******/
		/****** md5 signature: 7244386df7723b98eed2b1a18ad4d5f6 ******/
		%feature("compactdefaultargs") Scaled;
		%feature("autodoc", "
Parameters
----------
theP: gp_Pnt2d
theS: double

Return
-------
gp_Ax2d

Description
-----------
Applies a scaling transformation on the axis placement. The 'Location' point of the axisplacement is modified. The 'Direction' is reversed if the scale is negative.
") Scaled;
		gp_Ax2d Scaled(const gp_Pnt2d & theP, const double theS);

		/****** gp_Ax2d::SetDirection ******/
		/****** md5 signature: ca2779f8ad7c9e7dbd15d9006e40953e ******/
		%feature("compactdefaultargs") SetDirection;
		%feature("autodoc", "
Parameters
----------
theV: gp_Dir2d

Return
-------
None

Description
-----------
Changes the direction of <self>.
") SetDirection;
		void SetDirection(const gp_Dir2d & theV);

		/****** gp_Ax2d::SetLocation ******/
		/****** md5 signature: 480b751d2165373d2617a13d19b91d48 ******/
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
Changes the 'Location' point (origin) of <self>.
") SetLocation;
		void SetLocation(const gp_Pnt2d & theP);

		/****** gp_Ax2d::Transform ******/
		/****** md5 signature: 730ddba08a3831e8eddc8ca7a1e1a563 ******/
		%feature("compactdefaultargs") Transform;
		%feature("autodoc", "
Parameters
----------
theT: gp_Trsf2d

Return
-------
None

Description
-----------
No available documentation.
") Transform;
		void Transform(const gp_Trsf2d & theT);

		/****** gp_Ax2d::Transformed ******/
		/****** md5 signature: cf58c8d22f8204832226887d60a2abc8 ******/
		%feature("compactdefaultargs") Transformed;
		%feature("autodoc", "
Parameters
----------
theT: gp_Trsf2d

Return
-------
gp_Ax2d

Description
-----------
Transforms an axis placement with a Trsf.
") Transformed;
		gp_Ax2d Transformed(const gp_Trsf2d & theT);

		/****** gp_Ax2d::Translate ******/
		/****** md5 signature: db1336b52b0bf528c543a448adb435f1 ******/
		%feature("compactdefaultargs") Translate;
		%feature("autodoc", "
Parameters
----------
theV: gp_Vec2d

Return
-------
None

Description
-----------
No available documentation.
") Translate;
		void Translate(const gp_Vec2d & theV);

		/****** gp_Ax2d::Translate ******/
		/****** md5 signature: fbfb79b99757b462451a758b25d06d71 ******/
		%feature("compactdefaultargs") Translate;
		%feature("autodoc", "
Parameters
----------
theP1: gp_Pnt2d
theP2: gp_Pnt2d

Return
-------
None

Description
-----------
No available documentation.
") Translate;
		void Translate(const gp_Pnt2d & theP1, const gp_Pnt2d & theP2);

		/****** gp_Ax2d::Translated ******/
		/****** md5 signature: 420e133fa878b2d299a3f27a013c29a3 ******/
		%feature("compactdefaultargs") Translated;
		%feature("autodoc", "
Parameters
----------
theV: gp_Vec2d

Return
-------
gp_Ax2d

Description
-----------
Translates an axis placement in the direction of the vector theV. The magnitude of the translation is the vector's magnitude.
") Translated;
		gp_Ax2d Translated(const gp_Vec2d & theV);

		/****** gp_Ax2d::Translated ******/
		/****** md5 signature: 1b02d3951073f96fef841351fb542a10 ******/
		%feature("compactdefaultargs") Translated;
		%feature("autodoc", "
Parameters
----------
theP1: gp_Pnt2d
theP2: gp_Pnt2d

Return
-------
gp_Ax2d

Description
-----------
Translates an axis placement from the point theP1 to the point theP2.
") Translated;
		gp_Ax2d Translated(const gp_Pnt2d & theP1, const gp_Pnt2d & theP2);

};



%extend gp_Ax2d {
%pythoncode {
    def __getstate__(self):
        return self.DumpJson()
    }
};

%extend gp_Ax2d {
%pythoncode {
    def __setstate__(self, state):
        inst = gp_Ax2d()
        if inst.InitFromJson(state):
            self.this = inst.this
        else:
            raise IOError('Failed to set state of gp_Ax2d')
    }
};
%extend gp_Ax2d {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************
* class gp_Ax3 *
***************/
class gp_Ax3 {
	public:
		/****** gp_Ax3::gp_Ax3 ******/
		/****** md5 signature: 7e79e415cc894a742ceb32e80c0b6dae ******/
		%feature("compactdefaultargs") gp_Ax3;
		%feature("autodoc", "Return
-------
None

Description
-----------
Creates an object corresponding to the reference coordinate system (OXYZ).
") gp_Ax3;
		 gp_Ax3();

		/****** gp_Ax3::gp_Ax3 ******/
		/****** md5 signature: 9800ecb7325577d5aaff98252e57e898 ******/
		%feature("compactdefaultargs") gp_Ax3;
		%feature("autodoc", "
Parameters
----------
theA: gp_Ax2

Return
-------
None

Description
-----------
Creates a coordinate system from a right-handed coordinate system.
") gp_Ax3;
		 gp_Ax3(const gp_Ax2 & theA);

		/****** gp_Ax3::gp_Ax3 ******/
		/****** md5 signature: 377b87eb0622cdfcce4e27a9fafe4493 ******/
		%feature("compactdefaultargs") gp_Ax3;
		%feature("autodoc", "
Parameters
----------
theP: gp_Pnt
theN: gp_Dir
theVx: gp_Dir

Return
-------
None

Description
-----------
Creates a right handed axis placement with the 'Location' point theP and two directions, theN gives the 'Direction' and theVx gives the 'XDirection'. Raises ConstructionError if theN and theVx are parallel (same or opposite orientation).
") gp_Ax3;
		 gp_Ax3(const gp_Pnt & theP, const gp_Dir & theN, const gp_Dir & theVx);

		/****** gp_Ax3::gp_Ax3 ******/
		/****** md5 signature: 1af5122ceba6741bdc80c4c3a44fb649 ******/
		%feature("compactdefaultargs") gp_Ax3;
		%feature("autodoc", "
Parameters
----------
theP: gp_Pnt
theN: gp_Dir::D
theVx: gp_Dir::D

Return
-------
None

Description
-----------
Creates an axis placement with standard directions. This constructor allows constexpr and noexcept construction when using standard directions.
") gp_Ax3;
		 gp_Ax3(const gp_Pnt & theP, const gp_Dir::D theN, const gp_Dir::D theVx);

		/****** gp_Ax3::gp_Ax3 ******/
		/****** md5 signature: c4f0bf6274e2b9849997b0622ec82495 ******/
		%feature("compactdefaultargs") gp_Ax3;
		%feature("autodoc", "
Parameters
----------
theP: gp_Pnt
theV: gp_Dir

Return
-------
None

Description
-----------
Creates an axis placement with the 'Location' point <theP> and the normal direction <theV>.
") gp_Ax3;
		 gp_Ax3(const gp_Pnt & theP, const gp_Dir & theV);

		/****** gp_Ax3::gp_Ax3 ******/
		/****** md5 signature: 6747a3deb974e9b21b5088b728002ad7 ******/
		%feature("compactdefaultargs") gp_Ax3;
		%feature("autodoc", "
Parameters
----------
theP: gp_Pnt
theV: gp_Dir::D

Return
-------
None

Description
-----------
Creates an axis placement with the given location point and standard direction.
") gp_Ax3;
		 gp_Ax3(const gp_Pnt & theP, const gp_Dir::D theV);

		/****** gp_Ax3::gp_Ax3 ******/
		/****** md5 signature: d1411405b37c91bc98607d97107a88df ******/
		%feature("compactdefaultargs") gp_Ax3;
		%feature("autodoc", "
Parameters
----------
theV: gp_Dir::D

Return
-------
None

Description
-----------
Creates an axis placement at the origin with the given standard direction.
") gp_Ax3;
		 gp_Ax3(const gp_Dir::D theV);

		/****** gp_Ax3::Angle ******/
		/****** md5 signature: 0118038289b9f4c052423a0994761a82 ******/
		%feature("compactdefaultargs") Angle;
		%feature("autodoc", "
Parameters
----------
theOther: gp_Ax3

Return
-------
double

Description
-----------
Computes the angular value between the main direction of <self> and the main direction of <theOther>. Returns the angle between 0 and PI in radians.
") Angle;
		double Angle(const gp_Ax3 & theOther);

		/****** gp_Ax3::Ax2 ******/
		/****** md5 signature: c9b4af4169eef4b21cfe015142d7278a ******/
		%feature("compactdefaultargs") Ax2;
		%feature("autodoc", "Return
-------
gp_Ax2

Description
-----------
Computes a right-handed coordinate system with the same 'X Direction' and 'Y Direction' as those of this coordinate system, then recomputes the 'main Direction'. If this coordinate system is right-handed, the result returned is the same coordinate system. If this coordinate system is left-handed, the result is reversed.
") Ax2;
		gp_Ax2 Ax2();

		/****** gp_Ax3::Axis ******/
		/****** md5 signature: 92df3aa78c9ee700462ef461d4ed4603 ******/
		%feature("compactdefaultargs") Axis;
		%feature("autodoc", "Return
-------
gp_Ax1

Description
-----------
Returns the main axis of <self>. It is the 'Location' point and the main 'Direction'.
") Axis;
		const gp_Ax1 Axis();

		/****** gp_Ax3::Direct ******/
		/****** md5 signature: 3a4dc03f7f44029dd167c527c17f95a7 ******/
		%feature("compactdefaultargs") Direct;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if the coordinate system is right-handed. i.e. XDirection().Crossed(YDirection()).Dot(Direction()) > 0.
") Direct;
		bool Direct();

		/****** gp_Ax3::Direction ******/
		/****** md5 signature: 52b593a77853d9d22e96443cc8f6fb8d ******/
		%feature("compactdefaultargs") Direction;
		%feature("autodoc", "Return
-------
gp_Dir

Description
-----------
Returns the main direction of <self>.
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

        /****************** InitFromJson ******************/
        %feature("autodoc", "
Parameters
----------
json_string: the string

Return
-------
bool

Description
-----------
Init the object from a JSON string.
") InitFromJson;
        %extend{
            bool InitFromJson(std::string json_string) {
            std::stringstream s(json_string);
            Standard_Integer pos=2;
            return self->InitFromJson(s, pos);}
        };
		/****** gp_Ax3::IsCoplanar ******/
		/****** md5 signature: 56d883cde60194de028f0bf66986087b ******/
		%feature("compactdefaultargs") IsCoplanar;
		%feature("autodoc", "
Parameters
----------
theOther: gp_Ax3
theLinearTolerance: double
theAngularTolerance: double

Return
-------
bool

Description
-----------
Returns True if . the distance between the 'Location' point of <self> and <theOther> is lower or equal to theLinearTolerance and . the distance between the 'Location' point of <theOther> and <self> is lower or equal to theLinearTolerance and . the main direction of <self> and the main direction of <theOther> are parallel (same or opposite orientation).
") IsCoplanar;
		bool IsCoplanar(const gp_Ax3 & theOther, const double theLinearTolerance, const double theAngularTolerance);

		/****** gp_Ax3::IsCoplanar ******/
		/****** md5 signature: 08535efd80338ac33820c6774308c5b0 ******/
		%feature("compactdefaultargs") IsCoplanar;
		%feature("autodoc", "
Parameters
----------
theA1: gp_Ax1
theLinearTolerance: double
theAngularTolerance: double

Return
-------
bool

Description
-----------
Returns True if . the distance between <self> and the 'Location' point of theA1 is lower of equal to theLinearTolerance and . the distance between theA1 and the 'Location' point of <self> is lower or equal to theLinearTolerance and . the main direction of <self> and the direction of theA1 are normal.
") IsCoplanar;
		bool IsCoplanar(const gp_Ax1 & theA1, const double theLinearTolerance, const double theAngularTolerance);

		/****** gp_Ax3::Location ******/
		/****** md5 signature: 2c3e536bdb11b2c2c46fc19fd8a6c569 ******/
		%feature("compactdefaultargs") Location;
		%feature("autodoc", "Return
-------
gp_Pnt

Description
-----------
Returns the 'Location' point (origin) of <self>.
") Location;
		const gp_Pnt Location();

		/****** gp_Ax3::Mirror ******/
		/****** md5 signature: 0f424be72f12474fe3ff290168029c4e ******/
		%feature("compactdefaultargs") Mirror;
		%feature("autodoc", "
Parameters
----------
theP: gp_Pnt

Return
-------
None

Description
-----------
No available documentation.
") Mirror;
		void Mirror(const gp_Pnt & theP);

		/****** gp_Ax3::Mirror ******/
		/****** md5 signature: f508bc9f1879a959242732c259593a0a ******/
		%feature("compactdefaultargs") Mirror;
		%feature("autodoc", "
Parameters
----------
theA1: gp_Ax1

Return
-------
None

Description
-----------
No available documentation.
") Mirror;
		void Mirror(const gp_Ax1 & theA1);

		/****** gp_Ax3::Mirror ******/
		/****** md5 signature: ba516d9e4a2b6af0ed16d37de915dd83 ******/
		%feature("compactdefaultargs") Mirror;
		%feature("autodoc", "
Parameters
----------
theA2: gp_Ax2

Return
-------
None

Description
-----------
No available documentation.
") Mirror;
		void Mirror(const gp_Ax2 & theA2);

		/****** gp_Ax3::Mirrored ******/
		/****** md5 signature: 391fc7477bf48890baa067028c41d388 ******/
		%feature("compactdefaultargs") Mirrored;
		%feature("autodoc", "
Parameters
----------
theP: gp_Pnt

Return
-------
gp_Ax3

Description
-----------
Performs the symmetrical transformation of an axis placement with respect to the point theP which is the center of the symmetry. Warnings: The main direction of the axis placement is not changed. The 'XDirection' and the 'YDirection' are reversed. So the axis placement stay right handed.
") Mirrored;
		gp_Ax3 Mirrored(const gp_Pnt & theP);

		/****** gp_Ax3::Mirrored ******/
		/****** md5 signature: 52405f50d68482951adc2c291c1efbfa ******/
		%feature("compactdefaultargs") Mirrored;
		%feature("autodoc", "
Parameters
----------
theA1: gp_Ax1

Return
-------
gp_Ax3

Description
-----------
Performs the symmetrical transformation of an axis placement with respect to an axis placement which is the axis of the symmetry. The transformation is performed on the 'Location' point, on the 'XDirection' and 'YDirection'. The resulting main 'Direction' is the cross product between the 'XDirection' and the 'YDirection' after transformation.
") Mirrored;
		gp_Ax3 Mirrored(const gp_Ax1 & theA1);

		/****** gp_Ax3::Mirrored ******/
		/****** md5 signature: 940069901fdeb0af3b5ffbeac530670d ******/
		%feature("compactdefaultargs") Mirrored;
		%feature("autodoc", "
Parameters
----------
theA2: gp_Ax2

Return
-------
gp_Ax3

Description
-----------
Performs the symmetrical transformation of an axis placement with respect to a plane. The axis placement <theA2> locates the plane of the symmetry: (Location, XDirection, YDirection). The transformation is performed on the 'Location' point, on the 'XDirection' and 'YDirection'. The resulting main 'Direction' is the cross product between the 'XDirection' and the 'YDirection' after transformation.
") Mirrored;
		gp_Ax3 Mirrored(const gp_Ax2 & theA2);

		/****** gp_Ax3::Rotate ******/
		/****** md5 signature: 652dfbf621c2c092ff5b68d608de4634 ******/
		%feature("compactdefaultargs") Rotate;
		%feature("autodoc", "
Parameters
----------
theA1: gp_Ax1
theAng: double

Return
-------
None

Description
-----------
No available documentation.
") Rotate;
		void Rotate(const gp_Ax1 & theA1, const double theAng);

		/****** gp_Ax3::Rotated ******/
		/****** md5 signature: 9139ccb2c1c0d738bc07de43e0142f02 ******/
		%feature("compactdefaultargs") Rotated;
		%feature("autodoc", "
Parameters
----------
theA1: gp_Ax1
theAng: double

Return
-------
gp_Ax3

Description
-----------
Rotates an axis placement. <theA1> is the axis of the rotation. theAng is the angular value of the rotation in radians.
") Rotated;
		gp_Ax3 Rotated(const gp_Ax1 & theA1, const double theAng);

		/****** gp_Ax3::Scale ******/
		/****** md5 signature: 9fa53937842c668acd0d1cc256eb2732 ******/
		%feature("compactdefaultargs") Scale;
		%feature("autodoc", "
Parameters
----------
theP: gp_Pnt
theS: double

Return
-------
None

Description
-----------
No available documentation.
") Scale;
		void Scale(const gp_Pnt & theP, const double theS);

		/****** gp_Ax3::Scaled ******/
		/****** md5 signature: 8db26ac50961d350edcc59309bf18afd ******/
		%feature("compactdefaultargs") Scaled;
		%feature("autodoc", "
Parameters
----------
theP: gp_Pnt
theS: double

Return
-------
gp_Ax3

Description
-----------
Applies a scaling transformation on the axis placement. The 'Location' point of the axisplacement is modified. Warnings: If the scale <theS> is negative: . the main direction of the axis placement is not changed. . The 'XDirection' and the 'YDirection' are reversed. So the axis placement stay right handed.
") Scaled;
		gp_Ax3 Scaled(const gp_Pnt & theP, const double theS);

		/****** gp_Ax3::SetAxis ******/
		/****** md5 signature: 43324233139e9364ed0345f04485c556 ******/
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
Assigns the origin and 'main Direction' of the axis theA1 to this coordinate system, then recomputes its 'X Direction' and 'Y Direction'. Note: - The new 'X Direction' is computed as follows: new 'X Direction' = V1 ^(previous 'X Direction' ^ V) where V is the 'Direction' of theA1. - The orientation of this coordinate system (right-handed or left-handed) is not modified. Raises ConstructionError if the 'Direction' of <theA1> and the 'XDirection' of <self> are parallel (same or opposite orientation) because it is impossible to calculate the new 'XDirection' and the new 'YDirection'.
") SetAxis;
		void SetAxis(const gp_Ax1 & theA1);

		/****** gp_Ax3::SetDirection ******/
		/****** md5 signature: 8b5ca597f3afabbc57f16735908eb058 ******/
		%feature("compactdefaultargs") SetDirection;
		%feature("autodoc", "
Parameters
----------
theV: gp_Dir

Return
-------
None

Description
-----------
Changes the main direction of this coordinate system, then recomputes its 'X Direction' and 'Y Direction'. Note: - The new 'X Direction' is computed as follows: new 'X Direction' = theV ^ (previous 'X Direction' ^ theV). - The orientation of this coordinate system (left- or right-handed) is not modified. Raises ConstructionError if <theV> and the previous 'XDirection' are parallel because it is impossible to calculate the new 'XDirection' and the new 'YDirection'.
") SetDirection;
		void SetDirection(const gp_Dir & theV);

		/****** gp_Ax3::SetLocation ******/
		/****** md5 signature: cdddcf5cbfcb37a25a0fad06f827f527 ******/
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
Changes the 'Location' point (origin) of <self>.
") SetLocation;
		void SetLocation(const gp_Pnt & theP);

		/****** gp_Ax3::SetXDirection ******/
		/****** md5 signature: 7c7709263c1f5e7e9b0cffdbb4ad187a ******/
		%feature("compactdefaultargs") SetXDirection;
		%feature("autodoc", "
Parameters
----------
theVx: gp_Dir

Return
-------
None

Description
-----------
Changes the 'Xdirection' of <self>. The main direction 'Direction' is not modified, the 'Ydirection' is modified. If <theVx> is not normal to the main direction then <XDirection> is computed as follows XDirection = Direction ^ (theVx ^ Direction). Raises ConstructionError if <theVx> is parallel (same or opposite orientation) to the main direction of <self>.
") SetXDirection;
		void SetXDirection(const gp_Dir & theVx);

		/****** gp_Ax3::SetYDirection ******/
		/****** md5 signature: 899268beb5d91c4e317724e14fe72fd6 ******/
		%feature("compactdefaultargs") SetYDirection;
		%feature("autodoc", "
Parameters
----------
theVy: gp_Dir

Return
-------
None

Description
-----------
Changes the 'Ydirection' of <self>. The main direction is not modified but the 'Xdirection' is changed. If <theVy> is not normal to the main direction then 'YDirection' is computed as follows YDirection = Direction ^ (<theVy> ^ Direction). Raises ConstructionError if <theVy> is parallel to the main direction of <self>.
") SetYDirection;
		void SetYDirection(const gp_Dir & theVy);

		/****** gp_Ax3::Transform ******/
		/****** md5 signature: ad39e75f28af84e2a27f2cfbe322b0a3 ******/
		%feature("compactdefaultargs") Transform;
		%feature("autodoc", "
Parameters
----------
theT: gp_Trsf

Return
-------
None

Description
-----------
No available documentation.
") Transform;
		void Transform(const gp_Trsf & theT);

		/****** gp_Ax3::Transformed ******/
		/****** md5 signature: a19295588196b05ec78621a6dbf05e07 ******/
		%feature("compactdefaultargs") Transformed;
		%feature("autodoc", "
Parameters
----------
theT: gp_Trsf

Return
-------
gp_Ax3

Description
-----------
Transforms an axis placement with a Trsf. The 'Location' point, the 'XDirection' and the 'YDirection' are transformed with theT. The resulting main 'Direction' of <self> is the cross product between the 'XDirection' and the 'YDirection' after transformation.
") Transformed;
		gp_Ax3 Transformed(const gp_Trsf & theT);

		/****** gp_Ax3::Translate ******/
		/****** md5 signature: 8ae07d4c829c1eef2e7708ef5390638b ******/
		%feature("compactdefaultargs") Translate;
		%feature("autodoc", "
Parameters
----------
theV: gp_Vec

Return
-------
None

Description
-----------
No available documentation.
") Translate;
		void Translate(const gp_Vec & theV);

		/****** gp_Ax3::Translate ******/
		/****** md5 signature: 279c13d6194eb867625753d756d110ab ******/
		%feature("compactdefaultargs") Translate;
		%feature("autodoc", "
Parameters
----------
theP1: gp_Pnt
theP2: gp_Pnt

Return
-------
None

Description
-----------
No available documentation.
") Translate;
		void Translate(const gp_Pnt & theP1, const gp_Pnt & theP2);

		/****** gp_Ax3::Translated ******/
		/****** md5 signature: c30bb1b4523f7b2083a78cf85c88be32 ******/
		%feature("compactdefaultargs") Translated;
		%feature("autodoc", "
Parameters
----------
theV: gp_Vec

Return
-------
gp_Ax3

Description
-----------
Translates an axis plaxement in the direction of the vector <theV>. The magnitude of the translation is the vector's magnitude.
") Translated;
		gp_Ax3 Translated(const gp_Vec & theV);

		/****** gp_Ax3::Translated ******/
		/****** md5 signature: bcf3a2b6e08375d9a9a26fe37c681b25 ******/
		%feature("compactdefaultargs") Translated;
		%feature("autodoc", "
Parameters
----------
theP1: gp_Pnt
theP2: gp_Pnt

Return
-------
gp_Ax3

Description
-----------
Translates an axis placement from the point <theP1> to the point <theP2>.
") Translated;
		gp_Ax3 Translated(const gp_Pnt & theP1, const gp_Pnt & theP2);

		/****** gp_Ax3::XDirection ******/
		/****** md5 signature: dee10cdd5f6822ed9986a335f6eb04c9 ******/
		%feature("compactdefaultargs") XDirection;
		%feature("autodoc", "Return
-------
gp_Dir

Description
-----------
Returns the 'XDirection' of <self>.
") XDirection;
		const gp_Dir XDirection();

		/****** gp_Ax3::XReverse ******/
		/****** md5 signature: 30e0ff934067c03b92a57f4861353434 ******/
		%feature("compactdefaultargs") XReverse;
		%feature("autodoc", "Return
-------
None

Description
-----------
Reverses the X direction of <self>.
") XReverse;
		void XReverse();

		/****** gp_Ax3::YDirection ******/
		/****** md5 signature: 4c555b344552f4ee65787c4d01d35837 ******/
		%feature("compactdefaultargs") YDirection;
		%feature("autodoc", "Return
-------
gp_Dir

Description
-----------
Returns the 'YDirection' of <self>.
") YDirection;
		const gp_Dir YDirection();

		/****** gp_Ax3::YReverse ******/
		/****** md5 signature: d98bc2fcd31cc0a4103df4591b655d05 ******/
		%feature("compactdefaultargs") YReverse;
		%feature("autodoc", "Return
-------
None

Description
-----------
Reverses the Y direction of <self>.
") YReverse;
		void YReverse();

		/****** gp_Ax3::ZReverse ******/
		/****** md5 signature: a1fe3201d64214ee988795f1ae5b8515 ******/
		%feature("compactdefaultargs") ZReverse;
		%feature("autodoc", "Return
-------
None

Description
-----------
Reverses the Z direction of <self>.
") ZReverse;
		void ZReverse();

};



%extend gp_Ax3 {
%pythoncode {
    def __getstate__(self):
        return self.DumpJson()
    }
};

%extend gp_Ax3 {
%pythoncode {
    def __setstate__(self, state):
        inst = gp_Ax3()
        if inst.InitFromJson(state):
            self.this = inst.this
        else:
            raise IOError('Failed to set state of gp_Ax3')
    }
};
%extend gp_Ax3 {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************
* class gp_Circ *
****************/
class gp_Circ {
	public:
		/****** gp_Circ::gp_Circ ******/
		/****** md5 signature: 168db786c12a09c6fbce4370c884f0df ******/
		%feature("compactdefaultargs") gp_Circ;
		%feature("autodoc", "Return
-------
None

Description
-----------
Creates an indefinite circle.
") gp_Circ;
		 gp_Circ();

		/****** gp_Circ::gp_Circ ******/
		/****** md5 signature: 264c2c0bb4e1fa8d3963bf56dd721b8c ******/
		%feature("compactdefaultargs") gp_Circ;
		%feature("autodoc", "
Parameters
----------
theA2: gp_Ax2
theRadius: double

Return
-------
None

Description
-----------
A2 locates the circle and gives its orientation in 3D space. Warnings: It is not forbidden to create a circle with theRadius = 0.0 Raises ConstructionError if theRadius < 0.0.
") gp_Circ;
		 gp_Circ(const gp_Ax2 & theA2, const double theRadius);

		/****** gp_Circ::Area ******/
		/****** md5 signature: a088fd3ed75aeafb3fa8330998cab53d ******/
		%feature("compactdefaultargs") Area;
		%feature("autodoc", "Return
-------
double

Description
-----------
Computes the area of the circle.
") Area;
		double Area();

		/****** gp_Circ::Axis ******/
		/****** md5 signature: 92df3aa78c9ee700462ef461d4ed4603 ******/
		%feature("compactdefaultargs") Axis;
		%feature("autodoc", "Return
-------
gp_Ax1

Description
-----------
Returns the main axis of the circle. It is the axis perpendicular to the plane of the circle, passing through the 'Location' point (center) of the circle.
") Axis;
		const gp_Ax1 Axis();

		/****** gp_Circ::Contains ******/
		/****** md5 signature: a776f893327aa6bb589da12f738c27c2 ******/
		%feature("compactdefaultargs") Contains;
		%feature("autodoc", "
Parameters
----------
theP: gp_Pnt
theLinearTolerance: double

Return
-------
bool

Description
-----------
Returns True if the point theP is on the circumference. The distance between <self> and <theP> must be lower or equal to theLinearTolerance.
") Contains;
		bool Contains(const gp_Pnt & theP, const double theLinearTolerance);

		/****** gp_Circ::Distance ******/
		/****** md5 signature: b0a0966e67ad04fd1640d5a137f45f48 ******/
		%feature("compactdefaultargs") Distance;
		%feature("autodoc", "
Parameters
----------
theP: gp_Pnt

Return
-------
double

Description
-----------
Computes the minimum of distance between the point theP and any point on the circumference of the circle.
") Distance;
		double Distance(const gp_Pnt & theP);

		/****** gp_Circ::Length ******/
		/****** md5 signature: def906c3bae24f6e2868196c9bcef44b ******/
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "Return
-------
double

Description
-----------
Computes the circumference of the circle.
") Length;
		double Length();

		/****** gp_Circ::Location ******/
		/****** md5 signature: 2c3e536bdb11b2c2c46fc19fd8a6c569 ******/
		%feature("compactdefaultargs") Location;
		%feature("autodoc", "Return
-------
gp_Pnt

Description
-----------
Returns the center of the circle. It is the 'Location' point of the local coordinate system of the circle.
") Location;
		const gp_Pnt Location();

		/****** gp_Circ::Mirror ******/
		/****** md5 signature: 0f424be72f12474fe3ff290168029c4e ******/
		%feature("compactdefaultargs") Mirror;
		%feature("autodoc", "
Parameters
----------
theP: gp_Pnt

Return
-------
None

Description
-----------
No available documentation.
") Mirror;
		void Mirror(const gp_Pnt & theP);

		/****** gp_Circ::Mirror ******/
		/****** md5 signature: cfb16cae08525c5f4ab330102e0377d4 ******/
		%feature("compactdefaultargs") Mirror;
		%feature("autodoc", "
Parameters
----------
theA1: gp_Ax1

Return
-------
None

Description
-----------
No available documentation.
") Mirror;
		void Mirror(const gp_Ax1 & theA1);

		/****** gp_Circ::Mirror ******/
		/****** md5 signature: ad34943401a2334beed8ccc79094d8df ******/
		%feature("compactdefaultargs") Mirror;
		%feature("autodoc", "
Parameters
----------
theA2: gp_Ax2

Return
-------
None

Description
-----------
No available documentation.
") Mirror;
		void Mirror(const gp_Ax2 & theA2);

		/****** gp_Circ::Mirrored ******/
		/****** md5 signature: 236286ad251fd5131c71649fdefd39ab ******/
		%feature("compactdefaultargs") Mirrored;
		%feature("autodoc", "
Parameters
----------
theP: gp_Pnt

Return
-------
gp_Circ

Description
-----------
Performs the symmetrical transformation of a circle with respect to the point theP which is the center of the symmetry.
") Mirrored;
		gp_Circ Mirrored(const gp_Pnt & theP);

		/****** gp_Circ::Mirrored ******/
		/****** md5 signature: dca03722aa867dbbda201002c87da479 ******/
		%feature("compactdefaultargs") Mirrored;
		%feature("autodoc", "
Parameters
----------
theA1: gp_Ax1

Return
-------
gp_Circ

Description
-----------
Performs the symmetrical transformation of a circle with respect to an axis placement which is the axis of the symmetry.
") Mirrored;
		gp_Circ Mirrored(const gp_Ax1 & theA1);

		/****** gp_Circ::Mirrored ******/
		/****** md5 signature: a328233c47d4c15b36f2b1518877c9fb ******/
		%feature("compactdefaultargs") Mirrored;
		%feature("autodoc", "
Parameters
----------
theA2: gp_Ax2

Return
-------
gp_Circ

Description
-----------
Performs the symmetrical transformation of a circle with respect to a plane. The axis placement theA2 locates the plane of the of the symmetry: (Location, XDirection, YDirection).
") Mirrored;
		gp_Circ Mirrored(const gp_Ax2 & theA2);

		/****** gp_Circ::Position ******/
		/****** md5 signature: 57187ff46d597fddf97672bf3cca7377 ******/
		%feature("compactdefaultargs") Position;
		%feature("autodoc", "Return
-------
gp_Ax2

Description
-----------
Returns the position of the circle. It is the local coordinate system of the circle.
") Position;
		const gp_Ax2 Position();

		/****** gp_Circ::Radius ******/
		/****** md5 signature: a9fd144d0cbef7b3a906e17ab20118f2 ******/
		%feature("compactdefaultargs") Radius;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns the radius of this circle.
") Radius;
		double Radius();

		/****** gp_Circ::Rotate ******/
		/****** md5 signature: 652dfbf621c2c092ff5b68d608de4634 ******/
		%feature("compactdefaultargs") Rotate;
		%feature("autodoc", "
Parameters
----------
theA1: gp_Ax1
theAng: double

Return
-------
None

Description
-----------
No available documentation.
") Rotate;
		void Rotate(const gp_Ax1 & theA1, const double theAng);

		/****** gp_Circ::Rotated ******/
		/****** md5 signature: 0334e697e928d85946361dd3133e09e8 ******/
		%feature("compactdefaultargs") Rotated;
		%feature("autodoc", "
Parameters
----------
theA1: gp_Ax1
theAng: double

Return
-------
gp_Circ

Description
-----------
Rotates a circle. theA1 is the axis of the rotation. theAng is the angular value of the rotation in radians.
") Rotated;
		gp_Circ Rotated(const gp_Ax1 & theA1, const double theAng);

		/****** gp_Circ::Scale ******/
		/****** md5 signature: a03901fe94facbb26121cd37d5814f81 ******/
		%feature("compactdefaultargs") Scale;
		%feature("autodoc", "
Parameters
----------
theP: gp_Pnt
theS: double

Return
-------
None

Description
-----------
No available documentation.
") Scale;
		void Scale(const gp_Pnt & theP, const double theS);

		/****** gp_Circ::Scaled ******/
		/****** md5 signature: f4603243a77615eb6d53056cf5a4960c ******/
		%feature("compactdefaultargs") Scaled;
		%feature("autodoc", "
Parameters
----------
theP: gp_Pnt
theS: double

Return
-------
gp_Circ

Description
-----------
Scales a circle. theS is the scaling value. Warnings: If theS is negative the radius stay positive but the 'XAxis' and the 'YAxis' are reversed as for an ellipse.
") Scaled;
		gp_Circ Scaled(const gp_Pnt & theP, const double theS);

		/****** gp_Circ::SetAxis ******/
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
Changes the main axis of the circle. It is the axis perpendicular to the plane of the circle. Raises ConstructionError if the direction of theA1 is parallel to the 'XAxis' of the circle.
") SetAxis;
		void SetAxis(const gp_Ax1 & theA1);

		/****** gp_Circ::SetLocation ******/
		/****** md5 signature: cdddcf5cbfcb37a25a0fad06f827f527 ******/
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
Changes the 'Location' point (center) of the circle.
") SetLocation;
		void SetLocation(const gp_Pnt & theP);

		/****** gp_Circ::SetPosition ******/
		/****** md5 signature: 73d3a6a70843b70b52fc8f3fa07a25a7 ******/
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
Changes the position of the circle.
") SetPosition;
		void SetPosition(const gp_Ax2 & theA2);

		/****** gp_Circ::SetRadius ******/
		/****** md5 signature: 33acdaa90253f5b439514ff8a38f6451 ******/
		%feature("compactdefaultargs") SetRadius;
		%feature("autodoc", "
Parameters
----------
theRadius: double

Return
-------
None

Description
-----------
Modifies the radius of this circle. Warning: This class does not prevent the creation of a circle where theRadius is null. Exceptions Standard_ConstructionError if theRadius is negative.
") SetRadius;
		void SetRadius(const double theRadius);

		/****** gp_Circ::SquareDistance ******/
		/****** md5 signature: f61773e74eff1d299ed536f19f40261e ******/
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "
Parameters
----------
theP: gp_Pnt

Return
-------
double

Description
-----------
Computes the square distance between <self> and the point theP.
") SquareDistance;
		double SquareDistance(const gp_Pnt & theP);

		/****** gp_Circ::Transform ******/
		/****** md5 signature: 0737a7286be728220e1a55ba0d6eafc3 ******/
		%feature("compactdefaultargs") Transform;
		%feature("autodoc", "
Parameters
----------
theT: gp_Trsf

Return
-------
None

Description
-----------
No available documentation.
") Transform;
		void Transform(const gp_Trsf & theT);

		/****** gp_Circ::Transformed ******/
		/****** md5 signature: e1c6143ec0b0351694a5fc9bdee53f59 ******/
		%feature("compactdefaultargs") Transformed;
		%feature("autodoc", "
Parameters
----------
theT: gp_Trsf

Return
-------
gp_Circ

Description
-----------
Transforms a circle with the transformation theT from class Trsf.
") Transformed;
		gp_Circ Transformed(const gp_Trsf & theT);

		/****** gp_Circ::Translate ******/
		/****** md5 signature: 8ae07d4c829c1eef2e7708ef5390638b ******/
		%feature("compactdefaultargs") Translate;
		%feature("autodoc", "
Parameters
----------
theV: gp_Vec

Return
-------
None

Description
-----------
No available documentation.
") Translate;
		void Translate(const gp_Vec & theV);

		/****** gp_Circ::Translate ******/
		/****** md5 signature: 279c13d6194eb867625753d756d110ab ******/
		%feature("compactdefaultargs") Translate;
		%feature("autodoc", "
Parameters
----------
theP1: gp_Pnt
theP2: gp_Pnt

Return
-------
None

Description
-----------
No available documentation.
") Translate;
		void Translate(const gp_Pnt & theP1, const gp_Pnt & theP2);

		/****** gp_Circ::Translated ******/
		/****** md5 signature: 98d335d44de6ae16d9d07db3ac5570fe ******/
		%feature("compactdefaultargs") Translated;
		%feature("autodoc", "
Parameters
----------
theV: gp_Vec

Return
-------
gp_Circ

Description
-----------
Translates a circle in the direction of the vector theV. The magnitude of the translation is the vector's magnitude.
") Translated;
		gp_Circ Translated(const gp_Vec & theV);

		/****** gp_Circ::Translated ******/
		/****** md5 signature: 5a5c7f7ecfa71229a126a29de380dc95 ******/
		%feature("compactdefaultargs") Translated;
		%feature("autodoc", "
Parameters
----------
theP1: gp_Pnt
theP2: gp_Pnt

Return
-------
gp_Circ

Description
-----------
Translates a circle from the point theP1 to the point theP2.
") Translated;
		gp_Circ Translated(const gp_Pnt & theP1, const gp_Pnt & theP2);

		/****** gp_Circ::XAxis ******/
		/****** md5 signature: 37d8185a57a29bf9b7aa10d76b1229a2 ******/
		%feature("compactdefaultargs") XAxis;
		%feature("autodoc", "Return
-------
gp_Ax1

Description
-----------
Returns the 'XAxis' of the circle. This axis is perpendicular to the axis of the conic. This axis and the 'Yaxis' define the plane of the conic.
") XAxis;
		gp_Ax1 XAxis();

		/****** gp_Circ::YAxis ******/
		/****** md5 signature: 78f0cb55c98fbe890a49b3158d9f5039 ******/
		%feature("compactdefaultargs") YAxis;
		%feature("autodoc", "Return
-------
gp_Ax1

Description
-----------
Returns the 'YAxis' of the circle. This axis and the 'Xaxis' define the plane of the conic. The 'YAxis' is perpendicular to the 'Xaxis'.
") YAxis;
		gp_Ax1 YAxis();

};



%extend gp_Circ {
%pythoncode {
    def __getstate__(self):
        return self.DumpJson()
    }
};

%extend gp_Circ {
%pythoncode {
    def __setstate__(self, state):
        inst = gp_Circ()
        if inst.InitFromJson(state):
            self.this = inst.this
        else:
            raise IOError('Failed to set state of gp_Circ')
    }
};
%extend gp_Circ {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************
* class gp_Circ2d *
******************/
class gp_Circ2d {
	public:
		/****** gp_Circ2d::gp_Circ2d ******/
		/****** md5 signature: 056b9376da6503d063ee8d6abba82f8e ******/
		%feature("compactdefaultargs") gp_Circ2d;
		%feature("autodoc", "Return
-------
None

Description
-----------
creates an indefinite circle.
") gp_Circ2d;
		 gp_Circ2d();

		/****** gp_Circ2d::gp_Circ2d ******/
		/****** md5 signature: 55424d1478111df320ef2b75e414b54a ******/
		%feature("compactdefaultargs") gp_Circ2d;
		%feature("autodoc", "
Parameters
----------
theXAxis: gp_Ax2d
theRadius: double
theIsSense: bool (optional, default to true)

Return
-------
None

Description
-----------
The location point of theXAxis is the center of the circle. Warnings: It is not forbidden to create a circle with theRadius = 0.0 Raises ConstructionError if theRadius < 0.0.
") gp_Circ2d;
		 gp_Circ2d(const gp_Ax2d & theXAxis, const double theRadius, const bool theIsSense = true);

		/****** gp_Circ2d::gp_Circ2d ******/
		/****** md5 signature: 65fb0279671c502901b78066f4571911 ******/
		%feature("compactdefaultargs") gp_Circ2d;
		%feature("autodoc", "
Parameters
----------
theAxis: gp_Ax22d
theRadius: double

Return
-------
None

Description
-----------
theAxis defines the Xaxis and Yaxis of the circle which defines the origin and the sense of parametrization. The location point of theAxis is the center of the circle. Warnings: It is not forbidden to create a circle with theRadius = 0.0 Raises ConstructionError if theRadius < 0.0.
") gp_Circ2d;
		 gp_Circ2d(const gp_Ax22d & theAxis, const double theRadius);

		/****** gp_Circ2d::Area ******/
		/****** md5 signature: a088fd3ed75aeafb3fa8330998cab53d ******/
		%feature("compactdefaultargs") Area;
		%feature("autodoc", "Return
-------
double

Description
-----------
Computes the area of the circle.
") Area;
		double Area();

		/****** gp_Circ2d::Axis ******/
		/****** md5 signature: e16486dd6873b7754da4b441ae82cea8 ******/
		%feature("compactdefaultargs") Axis;
		%feature("autodoc", "Return
-------
gp_Ax22d

Description
-----------
returns the position of the circle.
") Axis;
		const gp_Ax22d Axis();

		/****** gp_Circ2d::Coefficients ******/
		/****** md5 signature: 0c4aef6e4c58aec6e100312229bed38a ******/
		%feature("compactdefaultargs") Coefficients;
		%feature("autodoc", "
Parameters
----------

Return
-------
theA: double
theB: double
theC: double
theD: double
theE: double
theF: double

Description
-----------
Returns the normalized coefficients from the implicit equation of the circle: theA * (X**2) + theB * (Y**2) + 2*theC*(X*Y) + 2*theD*X + 2*theE*Y + theF = 0.0.
") Coefficients;
		void Coefficients(Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** gp_Circ2d::Contains ******/
		/****** md5 signature: b2edf068c3bcc21858baa2786789c5f4 ******/
		%feature("compactdefaultargs") Contains;
		%feature("autodoc", "
Parameters
----------
theP: gp_Pnt2d
theLinearTolerance: double

Return
-------
bool

Description
-----------
Does <self> contain theP ? Returns True if the distance between theP and any point on the circumference of the circle is lower of equal to <theLinearTolerance>.
") Contains;
		bool Contains(const gp_Pnt2d & theP, const double theLinearTolerance);

		/****** gp_Circ2d::Distance ******/
		/****** md5 signature: 31788fec6e87fe3f164f085366fb6ca3 ******/
		%feature("compactdefaultargs") Distance;
		%feature("autodoc", "
Parameters
----------
theP: gp_Pnt2d

Return
-------
double

Description
-----------
Computes the minimum of distance between the point theP and any point on the circumference of the circle.
") Distance;
		double Distance(const gp_Pnt2d & theP);

		/****** gp_Circ2d::IsDirect ******/
		/****** md5 signature: b020e2b79b290dfefeeb15e69cd69d05 ******/
		%feature("compactdefaultargs") IsDirect;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if the local coordinate system is direct and false in the other case.
") IsDirect;
		bool IsDirect();

		/****** gp_Circ2d::Length ******/
		/****** md5 signature: def906c3bae24f6e2868196c9bcef44b ******/
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "Return
-------
double

Description
-----------
computes the circumference of the circle.
") Length;
		double Length();

		/****** gp_Circ2d::Location ******/
		/****** md5 signature: 61a7e489acd8b8c2b8c75b6b63b63221 ******/
		%feature("compactdefaultargs") Location;
		%feature("autodoc", "Return
-------
gp_Pnt2d

Description
-----------
Returns the location point (center) of the circle.
") Location;
		const gp_Pnt2d Location();

		/****** gp_Circ2d::Mirror ******/
		/****** md5 signature: 55ca8745c822fce8b8395ef5348dd658 ******/
		%feature("compactdefaultargs") Mirror;
		%feature("autodoc", "
Parameters
----------
theP: gp_Pnt2d

Return
-------
None

Description
-----------
No available documentation.
") Mirror;
		void Mirror(const gp_Pnt2d & theP);

		/****** gp_Circ2d::Mirror ******/
		/****** md5 signature: c8b01b19fc436ab187f95301941edbc1 ******/
		%feature("compactdefaultargs") Mirror;
		%feature("autodoc", "
Parameters
----------
theA: gp_Ax2d

Return
-------
None

Description
-----------
No available documentation.
") Mirror;
		void Mirror(const gp_Ax2d & theA);

		/****** gp_Circ2d::Mirrored ******/
		/****** md5 signature: 346494b959099503fd8296a4b4a9fce8 ******/
		%feature("compactdefaultargs") Mirrored;
		%feature("autodoc", "
Parameters
----------
theP: gp_Pnt2d

Return
-------
gp_Circ2d

Description
-----------
Performs the symmetrical transformation of a circle with respect to the point theP which is the center of the symmetry.
") Mirrored;
		gp_Circ2d Mirrored(const gp_Pnt2d & theP);

		/****** gp_Circ2d::Mirrored ******/
		/****** md5 signature: f01786aafac78f166076860f0a20dc7f ******/
		%feature("compactdefaultargs") Mirrored;
		%feature("autodoc", "
Parameters
----------
theA: gp_Ax2d

Return
-------
gp_Circ2d

Description
-----------
Performs the symmetrical transformation of a circle with respect to an axis placement which is the axis of the symmetry.
") Mirrored;
		gp_Circ2d Mirrored(const gp_Ax2d & theA);

		/****** gp_Circ2d::Position ******/
		/****** md5 signature: 03297321e741b605f43ca3fe15dbf7ab ******/
		%feature("compactdefaultargs") Position;
		%feature("autodoc", "Return
-------
gp_Ax22d

Description
-----------
returns the position of the circle. Idem Axis(me).
") Position;
		const gp_Ax22d Position();

		/****** gp_Circ2d::Radius ******/
		/****** md5 signature: a9fd144d0cbef7b3a906e17ab20118f2 ******/
		%feature("compactdefaultargs") Radius;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns the radius value of the circle.
") Radius;
		double Radius();

		/****** gp_Circ2d::Reverse ******/
		/****** md5 signature: a3a97cdcd6acb50dcac8455358723872 ******/
		%feature("compactdefaultargs") Reverse;
		%feature("autodoc", "Return
-------
None

Description
-----------
Reverses the orientation of the local coordinate system of this circle (the 'Y Direction' is reversed) and therefore changes the implicit orientation of this circle. Reverse assigns the result to this circle,.
") Reverse;
		void Reverse();

		/****** gp_Circ2d::Reversed ******/
		/****** md5 signature: 69252885f3722001b1010e9de45fd782 ******/
		%feature("compactdefaultargs") Reversed;
		%feature("autodoc", "Return
-------
gp_Circ2d

Description
-----------
Reverses the orientation of the local coordinate system of this circle (the 'Y Direction' is reversed) and therefore changes the implicit orientation of this circle. Reversed creates a new circle.
") Reversed;
		gp_Circ2d Reversed();

		/****** gp_Circ2d::Rotate ******/
		/****** md5 signature: 084595cbfff710f953ac0ae91d732bf0 ******/
		%feature("compactdefaultargs") Rotate;
		%feature("autodoc", "
Parameters
----------
theP: gp_Pnt2d
theAng: double

Return
-------
None

Description
-----------
No available documentation.
") Rotate;
		void Rotate(const gp_Pnt2d & theP, const double theAng);

		/****** gp_Circ2d::Rotated ******/
		/****** md5 signature: 300a924a2780b4ec5f1f16a464d85cee ******/
		%feature("compactdefaultargs") Rotated;
		%feature("autodoc", "
Parameters
----------
theP: gp_Pnt2d
theAng: double

Return
-------
gp_Circ2d

Description
-----------
Rotates a circle. theP is the center of the rotation. Ang is the angular value of the rotation in radians.
") Rotated;
		gp_Circ2d Rotated(const gp_Pnt2d & theP, const double theAng);

		/****** gp_Circ2d::Scale ******/
		/****** md5 signature: ce786424d6b372a402b20bab4c859bd5 ******/
		%feature("compactdefaultargs") Scale;
		%feature("autodoc", "
Parameters
----------
theP: gp_Pnt2d
theS: double

Return
-------
None

Description
-----------
No available documentation.
") Scale;
		void Scale(const gp_Pnt2d & theP, const double theS);

		/****** gp_Circ2d::Scaled ******/
		/****** md5 signature: 1e72fc43d876ca5e7db629c4b0909e23 ******/
		%feature("compactdefaultargs") Scaled;
		%feature("autodoc", "
Parameters
----------
theP: gp_Pnt2d
theS: double

Return
-------
gp_Circ2d

Description
-----------
Scales a circle. theS is the scaling value. Warnings: If theS is negative the radius stay positive but the 'XAxis' and the 'YAxis' are reversed as for an ellipse.
") Scaled;
		gp_Circ2d Scaled(const gp_Pnt2d & theP, const double theS);

		/****** gp_Circ2d::SetAxis ******/
		/****** md5 signature: 5a80f392a0f25e50c7bd9a5c5fce8259 ******/
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
Changes the X axis of the circle.
") SetAxis;
		void SetAxis(const gp_Ax22d & theA);

		/****** gp_Circ2d::SetLocation ******/
		/****** md5 signature: 480b751d2165373d2617a13d19b91d48 ******/
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
Changes the location point (center) of the circle.
") SetLocation;
		void SetLocation(const gp_Pnt2d & theP);

		/****** gp_Circ2d::SetRadius ******/
		/****** md5 signature: 33acdaa90253f5b439514ff8a38f6451 ******/
		%feature("compactdefaultargs") SetRadius;
		%feature("autodoc", "
Parameters
----------
theRadius: double

Return
-------
None

Description
-----------
Modifies the radius of this circle. This class does not prevent the creation of a circle where theRadius is null. Exceptions Standard_ConstructionError if theRadius is negative.
") SetRadius;
		void SetRadius(const double theRadius);

		/****** gp_Circ2d::SetXAxis ******/
		/****** md5 signature: 0953d475cb538bb151666a237ed170af ******/
		%feature("compactdefaultargs") SetXAxis;
		%feature("autodoc", "
Parameters
----------
theA: gp_Ax2d

Return
-------
None

Description
-----------
Changes the X axis of the circle.
") SetXAxis;
		void SetXAxis(const gp_Ax2d & theA);

		/****** gp_Circ2d::SetYAxis ******/
		/****** md5 signature: 18c66c982e1061a0c18175947bc7cbc8 ******/
		%feature("compactdefaultargs") SetYAxis;
		%feature("autodoc", "
Parameters
----------
theA: gp_Ax2d

Return
-------
None

Description
-----------
Changes the Y axis of the circle.
") SetYAxis;
		void SetYAxis(const gp_Ax2d & theA);

		/****** gp_Circ2d::SquareDistance ******/
		/****** md5 signature: c400d8be856e4d9710d12d335d042918 ******/
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "
Parameters
----------
theP: gp_Pnt2d

Return
-------
double

Description
-----------
Computes the square distance between <self> and the point theP.
") SquareDistance;
		double SquareDistance(const gp_Pnt2d & theP);

		/****** gp_Circ2d::Transform ******/
		/****** md5 signature: 94f8045e6a4465708e872ec10cb3f4d1 ******/
		%feature("compactdefaultargs") Transform;
		%feature("autodoc", "
Parameters
----------
theT: gp_Trsf2d

Return
-------
None

Description
-----------
No available documentation.
") Transform;
		void Transform(const gp_Trsf2d & theT);

		/****** gp_Circ2d::Transformed ******/
		/****** md5 signature: 4ffec46b19544c4bcb8cdb29687ed3e7 ******/
		%feature("compactdefaultargs") Transformed;
		%feature("autodoc", "
Parameters
----------
theT: gp_Trsf2d

Return
-------
gp_Circ2d

Description
-----------
Transforms a circle with the transformation theT from class Trsf2d.
") Transformed;
		gp_Circ2d Transformed(const gp_Trsf2d & theT);

		/****** gp_Circ2d::Translate ******/
		/****** md5 signature: db1336b52b0bf528c543a448adb435f1 ******/
		%feature("compactdefaultargs") Translate;
		%feature("autodoc", "
Parameters
----------
theV: gp_Vec2d

Return
-------
None

Description
-----------
No available documentation.
") Translate;
		void Translate(const gp_Vec2d & theV);

		/****** gp_Circ2d::Translate ******/
		/****** md5 signature: fbfb79b99757b462451a758b25d06d71 ******/
		%feature("compactdefaultargs") Translate;
		%feature("autodoc", "
Parameters
----------
theP1: gp_Pnt2d
theP2: gp_Pnt2d

Return
-------
None

Description
-----------
No available documentation.
") Translate;
		void Translate(const gp_Pnt2d & theP1, const gp_Pnt2d & theP2);

		/****** gp_Circ2d::Translated ******/
		/****** md5 signature: 2eaa87de506269702b3c40d8e17cb3fd ******/
		%feature("compactdefaultargs") Translated;
		%feature("autodoc", "
Parameters
----------
theV: gp_Vec2d

Return
-------
gp_Circ2d

Description
-----------
Translates a circle in the direction of the vector theV. The magnitude of the translation is the vector's magnitude.
") Translated;
		gp_Circ2d Translated(const gp_Vec2d & theV);

		/****** gp_Circ2d::Translated ******/
		/****** md5 signature: 0e52dea2ba8173b8d26e69d96d5019d6 ******/
		%feature("compactdefaultargs") Translated;
		%feature("autodoc", "
Parameters
----------
theP1: gp_Pnt2d
theP2: gp_Pnt2d

Return
-------
gp_Circ2d

Description
-----------
Translates a circle from the point theP1 to the point theP2.
") Translated;
		gp_Circ2d Translated(const gp_Pnt2d & theP1, const gp_Pnt2d & theP2);

		/****** gp_Circ2d::XAxis ******/
		/****** md5 signature: 83955698d6369777f193b9652c25173b ******/
		%feature("compactdefaultargs") XAxis;
		%feature("autodoc", "Return
-------
gp_Ax2d

Description
-----------
returns the X axis of the circle.
") XAxis;
		gp_Ax2d XAxis();

		/****** gp_Circ2d::YAxis ******/
		/****** md5 signature: a7022bd581881d0a6f0955733fa39838 ******/
		%feature("compactdefaultargs") YAxis;
		%feature("autodoc", "Return
-------
gp_Ax2d

Description
-----------
Returns the Y axis of the circle. Reverses the direction of the circle.
") YAxis;
		gp_Ax2d YAxis();

};



%extend gp_Circ2d {
%pythoncode {
    def __getstate__(self):
        return self.DumpJson()
    }
};

%extend gp_Circ2d {
%pythoncode {
    def __setstate__(self, state):
        inst = gp_Circ2d()
        if inst.InitFromJson(state):
            self.this = inst.this
        else:
            raise IOError('Failed to set state of gp_Circ2d')
    }
};
%extend gp_Circ2d {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************
* class gp_Cone *
****************/
class gp_Cone {
	public:
		/****** gp_Cone::gp_Cone ******/
		/****** md5 signature: 207e9d2c9e4ad17fd6abd03907c2ea35 ******/
		%feature("compactdefaultargs") gp_Cone;
		%feature("autodoc", "Return
-------
None

Description
-----------
Creates an indefinite Cone.
") gp_Cone;
		 gp_Cone();

		/****** gp_Cone::gp_Cone ******/
		/****** md5 signature: f79ecf06b2459b40835c7e0063b63c32 ******/
		%feature("compactdefaultargs") gp_Cone;
		%feature("autodoc", "
Parameters
----------
theA3: gp_Ax3
theAng: double
theRadius: double

Return
-------
None

Description
-----------
Creates an infinite conical surface. theA3 locates the cone in the space and defines the reference plane of the surface. Ang is the conical surface semi-angle. Its absolute value is in range ]0, PI/2[. theRadius is the radius of the circle in the reference plane of the cone. theRaises ConstructionError * if theRadius is lower than 0.0 * std::abs(theAng) < Resolution from gp or std::abs(theAng) >= (PI/2) - Resolution.
") gp_Cone;
		 gp_Cone(const gp_Ax3 & theA3, const double theAng, const double theRadius);

		/****** gp_Cone::Apex ******/
		/****** md5 signature: d7b0902898975a89c9e2f9cefaec36ca ******/
		%feature("compactdefaultargs") Apex;
		%feature("autodoc", "Return
-------
gp_Pnt

Description
-----------
Computes the cone's top. The Apex of the cone is on the negative side of the symmetry axis of the cone.
") Apex;
		gp_Pnt Apex();

		/****** gp_Cone::Axis ******/
		/****** md5 signature: 92df3aa78c9ee700462ef461d4ed4603 ******/
		%feature("compactdefaultargs") Axis;
		%feature("autodoc", "Return
-------
gp_Ax1

Description
-----------
returns the symmetry axis of the cone.
") Axis;
		const gp_Ax1 Axis();

		/****** gp_Cone::Coefficients ******/
		/****** md5 signature: 9bc2d4703484c8ba3d6ad87fcb2af21c ******/
		%feature("compactdefaultargs") Coefficients;
		%feature("autodoc", "
Parameters
----------

Return
-------
theA1: double
theA2: double
theA3: double
theB1: double
theB2: double
theB3: double
theC1: double
theC2: double
theC3: double
theD: double

Description
-----------
Computes the coefficients of the implicit equation of the quadric in the absolute cartesian coordinates system: theA1.X**2 + theA2.Y**2 + theA3.Z**2 + 2.(theB1.X.Y + theB2.X.Z + theB3.Y.Z) + 2.(theC1.X + theC2.Y + theC3.Z) + theD = 0.0.
") Coefficients;
		void Coefficients(Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** gp_Cone::Direct ******/
		/****** md5 signature: 666afd9b1feb9c16371f38b8235304e9 ******/
		%feature("compactdefaultargs") Direct;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if the local coordinate system of this cone is right-handed.
") Direct;
		bool Direct();

		/****** gp_Cone::Location ******/
		/****** md5 signature: 2c3e536bdb11b2c2c46fc19fd8a6c569 ******/
		%feature("compactdefaultargs") Location;
		%feature("autodoc", "Return
-------
gp_Pnt

Description
-----------
returns the 'Location' point of the cone.
") Location;
		const gp_Pnt Location();

		/****** gp_Cone::Mirror ******/
		/****** md5 signature: 0f424be72f12474fe3ff290168029c4e ******/
		%feature("compactdefaultargs") Mirror;
		%feature("autodoc", "
Parameters
----------
theP: gp_Pnt

Return
-------
None

Description
-----------
No available documentation.
") Mirror;
		void Mirror(const gp_Pnt & theP);

		/****** gp_Cone::Mirror ******/
		/****** md5 signature: f508bc9f1879a959242732c259593a0a ******/
		%feature("compactdefaultargs") Mirror;
		%feature("autodoc", "
Parameters
----------
theA1: gp_Ax1

Return
-------
None

Description
-----------
No available documentation.
") Mirror;
		void Mirror(const gp_Ax1 & theA1);

		/****** gp_Cone::Mirror ******/
		/****** md5 signature: ba516d9e4a2b6af0ed16d37de915dd83 ******/
		%feature("compactdefaultargs") Mirror;
		%feature("autodoc", "
Parameters
----------
theA2: gp_Ax2

Return
-------
None

Description
-----------
No available documentation.
") Mirror;
		void Mirror(const gp_Ax2 & theA2);

		/****** gp_Cone::Mirrored ******/
		/****** md5 signature: c9b13255f9cff98bdf268cd0879cdf14 ******/
		%feature("compactdefaultargs") Mirrored;
		%feature("autodoc", "
Parameters
----------
theP: gp_Pnt

Return
-------
gp_Cone

Description
-----------
Performs the symmetrical transformation of a cone with respect to the point theP which is the center of the symmetry.
") Mirrored;
		gp_Cone Mirrored(const gp_Pnt & theP);

		/****** gp_Cone::Mirrored ******/
		/****** md5 signature: 235d31b52c8a8401ef06b4bc84100ffc ******/
		%feature("compactdefaultargs") Mirrored;
		%feature("autodoc", "
Parameters
----------
theA1: gp_Ax1

Return
-------
gp_Cone

Description
-----------
Performs the symmetrical transformation of a cone with respect to an axis placement which is the axis of the symmetry.
") Mirrored;
		gp_Cone Mirrored(const gp_Ax1 & theA1);

		/****** gp_Cone::Mirrored ******/
		/****** md5 signature: b92fa41dd273047d36bf0c025de3d094 ******/
		%feature("compactdefaultargs") Mirrored;
		%feature("autodoc", "
Parameters
----------
theA2: gp_Ax2

Return
-------
gp_Cone

Description
-----------
Performs the symmetrical transformation of a cone with respect to a plane. The axis placement theA2 locates the plane of the of the symmetry: (Location, XDirection, YDirection).
") Mirrored;
		gp_Cone Mirrored(const gp_Ax2 & theA2);

		/****** gp_Cone::Position ******/
		/****** md5 signature: 074afca7172f5d6d32484431775e9338 ******/
		%feature("compactdefaultargs") Position;
		%feature("autodoc", "Return
-------
gp_Ax3

Description
-----------
Returns the local coordinates system of the cone.
") Position;
		const gp_Ax3 Position();

		/****** gp_Cone::RefRadius ******/
		/****** md5 signature: 74e96677ee5b02c9caf037e92f8ea693 ******/
		%feature("compactdefaultargs") RefRadius;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns the radius of the cone in the reference plane.
") RefRadius;
		double RefRadius();

		/****** gp_Cone::Rotate ******/
		/****** md5 signature: 652dfbf621c2c092ff5b68d608de4634 ******/
		%feature("compactdefaultargs") Rotate;
		%feature("autodoc", "
Parameters
----------
theA1: gp_Ax1
theAng: double

Return
-------
None

Description
-----------
No available documentation.
") Rotate;
		void Rotate(const gp_Ax1 & theA1, const double theAng);

		/****** gp_Cone::Rotated ******/
		/****** md5 signature: 48055734f699c1238f75c4906bd6ecf1 ******/
		%feature("compactdefaultargs") Rotated;
		%feature("autodoc", "
Parameters
----------
theA1: gp_Ax1
theAng: double

Return
-------
gp_Cone

Description
-----------
Rotates a cone. theA1 is the axis of the rotation. Ang is the angular value of the rotation in radians.
") Rotated;
		gp_Cone Rotated(const gp_Ax1 & theA1, const double theAng);

		/****** gp_Cone::Scale ******/
		/****** md5 signature: a03901fe94facbb26121cd37d5814f81 ******/
		%feature("compactdefaultargs") Scale;
		%feature("autodoc", "
Parameters
----------
theP: gp_Pnt
theS: double

Return
-------
None

Description
-----------
No available documentation.
") Scale;
		void Scale(const gp_Pnt & theP, const double theS);

		/****** gp_Cone::Scaled ******/
		/****** md5 signature: 5dd17c8e8cc992f782d77c24fd060ba6 ******/
		%feature("compactdefaultargs") Scaled;
		%feature("autodoc", "
Parameters
----------
theP: gp_Pnt
theS: double

Return
-------
gp_Cone

Description
-----------
Scales a cone. theS is the scaling value. The absolute value of theS is used to scale the cone.
") Scaled;
		gp_Cone Scaled(const gp_Pnt & theP, const double theS);

		/****** gp_Cone::SemiAngle ******/
		/****** md5 signature: cb7f6696f435d143013904818c985291 ******/
		%feature("compactdefaultargs") SemiAngle;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns the half-angle at the apex of this cone. Attention! Semi-angle can be negative.
") SemiAngle;
		double SemiAngle();

		/****** gp_Cone::SetAxis ******/
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
Changes the symmetry axis of the cone. Raises ConstructionError the direction of theA1 is parallel to the 'XDirection' of the coordinate system of the cone.
") SetAxis;
		void SetAxis(const gp_Ax1 & theA1);

		/****** gp_Cone::SetLocation ******/
		/****** md5 signature: f1c958277e2e7de2571c6b5691801e2a ******/
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
Changes the location of the cone.
") SetLocation;
		void SetLocation(const gp_Pnt & theLoc);

		/****** gp_Cone::SetPosition ******/
		/****** md5 signature: 967a77c1867c53ae2fb8ec3b93905c83 ******/
		%feature("compactdefaultargs") SetPosition;
		%feature("autodoc", "
Parameters
----------
theA3: gp_Ax3

Return
-------
None

Description
-----------
Changes the local coordinate system of the cone. This coordinate system defines the reference plane of the cone.
") SetPosition;
		void SetPosition(const gp_Ax3 & theA3);

		/****** gp_Cone::SetRadius ******/
		/****** md5 signature: a5bdc5efcd41823cfeb57a16cd83858a ******/
		%feature("compactdefaultargs") SetRadius;
		%feature("autodoc", "
Parameters
----------
theR: double

Return
-------
None

Description
-----------
Changes the radius of the cone in the reference plane of the cone. Raised if theR < 0.0.
") SetRadius;
		void SetRadius(const double theR);

		/****** gp_Cone::SetSemiAngle ******/
		/****** md5 signature: 76972e37c226f0cdad99dc8eae26032e ******/
		%feature("compactdefaultargs") SetSemiAngle;
		%feature("autodoc", "
Parameters
----------
theAng: double

Return
-------
None

Description
-----------
Changes the semi-angle of the cone. Semi-angle can be negative. Its absolute value std::abs(theAng) is in range ]0,PI/2[. Raises ConstructionError if std::abs(theAng) < Resolution from gp or std::abs(theAng) >= PI/2 - Resolution.
") SetSemiAngle;
		void SetSemiAngle(const double theAng);

		/****** gp_Cone::Transform ******/
		/****** md5 signature: 0737a7286be728220e1a55ba0d6eafc3 ******/
		%feature("compactdefaultargs") Transform;
		%feature("autodoc", "
Parameters
----------
theT: gp_Trsf

Return
-------
None

Description
-----------
No available documentation.
") Transform;
		void Transform(const gp_Trsf & theT);

		/****** gp_Cone::Transformed ******/
		/****** md5 signature: a28c96c0fbd26a3345e156db03a9a7d2 ******/
		%feature("compactdefaultargs") Transformed;
		%feature("autodoc", "
Parameters
----------
theT: gp_Trsf

Return
-------
gp_Cone

Description
-----------
Transforms a cone with the transformation theT from class Trsf.
") Transformed;
		gp_Cone Transformed(const gp_Trsf & theT);

		/****** gp_Cone::Translate ******/
		/****** md5 signature: 8ae07d4c829c1eef2e7708ef5390638b ******/
		%feature("compactdefaultargs") Translate;
		%feature("autodoc", "
Parameters
----------
theV: gp_Vec

Return
-------
None

Description
-----------
No available documentation.
") Translate;
		void Translate(const gp_Vec & theV);

		/****** gp_Cone::Translate ******/
		/****** md5 signature: 279c13d6194eb867625753d756d110ab ******/
		%feature("compactdefaultargs") Translate;
		%feature("autodoc", "
Parameters
----------
theP1: gp_Pnt
theP2: gp_Pnt

Return
-------
None

Description
-----------
No available documentation.
") Translate;
		void Translate(const gp_Pnt & theP1, const gp_Pnt & theP2);

		/****** gp_Cone::Translated ******/
		/****** md5 signature: acde70d3b150f0b727a06d20b371526d ******/
		%feature("compactdefaultargs") Translated;
		%feature("autodoc", "
Parameters
----------
theV: gp_Vec

Return
-------
gp_Cone

Description
-----------
Translates a cone in the direction of the vector theV. The magnitude of the translation is the vector's magnitude.
") Translated;
		gp_Cone Translated(const gp_Vec & theV);

		/****** gp_Cone::Translated ******/
		/****** md5 signature: c094ff6b758c8a8f33985ce11cdb9cc0 ******/
		%feature("compactdefaultargs") Translated;
		%feature("autodoc", "
Parameters
----------
theP1: gp_Pnt
theP2: gp_Pnt

Return
-------
gp_Cone

Description
-----------
Translates a cone from the point P1 to the point P2.
") Translated;
		gp_Cone Translated(const gp_Pnt & theP1, const gp_Pnt & theP2);

		/****** gp_Cone::UReverse ******/
		/****** md5 signature: 69a43a8af82ddbb84c6e12cf963de477 ******/
		%feature("compactdefaultargs") UReverse;
		%feature("autodoc", "Return
-------
None

Description
-----------
Reverses the U parametrization of the cone reversing the YAxis.
") UReverse;
		void UReverse();

		/****** gp_Cone::VReverse ******/
		/****** md5 signature: 07b53fb5da02e3545309a68afe3655c9 ******/
		%feature("compactdefaultargs") VReverse;
		%feature("autodoc", "Return
-------
None

Description
-----------
Reverses the V parametrization of the cone reversing the ZAxis.
") VReverse;
		void VReverse();

		/****** gp_Cone::XAxis ******/
		/****** md5 signature: 37d8185a57a29bf9b7aa10d76b1229a2 ******/
		%feature("compactdefaultargs") XAxis;
		%feature("autodoc", "Return
-------
gp_Ax1

Description
-----------
Returns the XAxis of the reference plane.
") XAxis;
		gp_Ax1 XAxis();

		/****** gp_Cone::YAxis ******/
		/****** md5 signature: 78f0cb55c98fbe890a49b3158d9f5039 ******/
		%feature("compactdefaultargs") YAxis;
		%feature("autodoc", "Return
-------
gp_Ax1

Description
-----------
Returns the YAxis of the reference plane.
") YAxis;
		gp_Ax1 YAxis();

};



%extend gp_Cone {
%pythoncode {
    def __getstate__(self):
        return self.DumpJson()
    }
};

%extend gp_Cone {
%pythoncode {
    def __setstate__(self, state):
        inst = gp_Cone()
        if inst.InitFromJson(state):
            self.this = inst.this
        else:
            raise IOError('Failed to set state of gp_Cone')
    }
};
%extend gp_Cone {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************
* class gp_Cylinder *
********************/
class gp_Cylinder {
	public:
		/****** gp_Cylinder::gp_Cylinder ******/
		/****** md5 signature: 02bb5b0c2fcc8af07f0a10176736bb34 ******/
		%feature("compactdefaultargs") gp_Cylinder;
		%feature("autodoc", "Return
-------
None

Description
-----------
Creates a indefinite cylinder.
") gp_Cylinder;
		 gp_Cylinder();

		/****** gp_Cylinder::gp_Cylinder ******/
		/****** md5 signature: e07ee076bd3e31565ead15312ab51e1d ******/
		%feature("compactdefaultargs") gp_Cylinder;
		%feature("autodoc", "
Parameters
----------
theA3: gp_Ax3
theRadius: double

Return
-------
None

Description
-----------
Creates a cylinder of radius Radius, whose axis is the 'main Axis' of theA3. theA3 is the local coordinate system of the cylinder. Raises ConstructionErrord if theRadius < 0.0.
") gp_Cylinder;
		 gp_Cylinder(const gp_Ax3 & theA3, const double theRadius);

		/****** gp_Cylinder::Axis ******/
		/****** md5 signature: 92df3aa78c9ee700462ef461d4ed4603 ******/
		%feature("compactdefaultargs") Axis;
		%feature("autodoc", "Return
-------
gp_Ax1

Description
-----------
Returns the symmetry axis of the cylinder.
") Axis;
		const gp_Ax1 Axis();

		/****** gp_Cylinder::Coefficients ******/
		/****** md5 signature: 9bc2d4703484c8ba3d6ad87fcb2af21c ******/
		%feature("compactdefaultargs") Coefficients;
		%feature("autodoc", "
Parameters
----------

Return
-------
theA1: double
theA2: double
theA3: double
theB1: double
theB2: double
theB3: double
theC1: double
theC2: double
theC3: double
theD: double

Description
-----------
Computes the coefficients of the implicit equation of the quadric in the absolute cartesian coordinate system: theA1.X**2 + theA2.Y**2 + theA3.Z**2 + 2.(theB1.X.Y + theB2.X.Z + theB3.Y.Z) + 2.(theC1.X + theC2.Y + theC3.Z) + theD = 0.0.
") Coefficients;
		void Coefficients(Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** gp_Cylinder::Direct ******/
		/****** md5 signature: 666afd9b1feb9c16371f38b8235304e9 ******/
		%feature("compactdefaultargs") Direct;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if the local coordinate system of this cylinder is right-handed.
") Direct;
		bool Direct();

		/****** gp_Cylinder::Location ******/
		/****** md5 signature: 2c3e536bdb11b2c2c46fc19fd8a6c569 ******/
		%feature("compactdefaultargs") Location;
		%feature("autodoc", "Return
-------
gp_Pnt

Description
-----------
Returns the 'Location' point of the cylinder.
") Location;
		const gp_Pnt Location();

		/****** gp_Cylinder::Mirror ******/
		/****** md5 signature: 0f424be72f12474fe3ff290168029c4e ******/
		%feature("compactdefaultargs") Mirror;
		%feature("autodoc", "
Parameters
----------
theP: gp_Pnt

Return
-------
None

Description
-----------
No available documentation.
") Mirror;
		void Mirror(const gp_Pnt & theP);

		/****** gp_Cylinder::Mirror ******/
		/****** md5 signature: f508bc9f1879a959242732c259593a0a ******/
		%feature("compactdefaultargs") Mirror;
		%feature("autodoc", "
Parameters
----------
theA1: gp_Ax1

Return
-------
None

Description
-----------
No available documentation.
") Mirror;
		void Mirror(const gp_Ax1 & theA1);

		/****** gp_Cylinder::Mirror ******/
		/****** md5 signature: ba516d9e4a2b6af0ed16d37de915dd83 ******/
		%feature("compactdefaultargs") Mirror;
		%feature("autodoc", "
Parameters
----------
theA2: gp_Ax2

Return
-------
None

Description
-----------
No available documentation.
") Mirror;
		void Mirror(const gp_Ax2 & theA2);

		/****** gp_Cylinder::Mirrored ******/
		/****** md5 signature: a7fb7bb03fa3c489d78fc48ea9369e25 ******/
		%feature("compactdefaultargs") Mirrored;
		%feature("autodoc", "
Parameters
----------
theP: gp_Pnt

Return
-------
gp_Cylinder

Description
-----------
Performs the symmetrical transformation of a cylinder with respect to the point theP which is the center of the symmetry.
") Mirrored;
		gp_Cylinder Mirrored(const gp_Pnt & theP);

		/****** gp_Cylinder::Mirrored ******/
		/****** md5 signature: c157c716582925bf870d2fed96a4edbb ******/
		%feature("compactdefaultargs") Mirrored;
		%feature("autodoc", "
Parameters
----------
theA1: gp_Ax1

Return
-------
gp_Cylinder

Description
-----------
Performs the symmetrical transformation of a cylinder with respect to an axis placement which is the axis of the symmetry.
") Mirrored;
		gp_Cylinder Mirrored(const gp_Ax1 & theA1);

		/****** gp_Cylinder::Mirrored ******/
		/****** md5 signature: 8f32687f8c6ef01e328e1625cf729ff9 ******/
		%feature("compactdefaultargs") Mirrored;
		%feature("autodoc", "
Parameters
----------
theA2: gp_Ax2

Return
-------
gp_Cylinder

Description
-----------
Performs the symmetrical transformation of a cylinder with respect to a plane. The axis placement theA2 locates the plane of the of the symmetry: (Location, XDirection, YDirection).
") Mirrored;
		gp_Cylinder Mirrored(const gp_Ax2 & theA2);

		/****** gp_Cylinder::Position ******/
		/****** md5 signature: 074afca7172f5d6d32484431775e9338 ******/
		%feature("compactdefaultargs") Position;
		%feature("autodoc", "Return
-------
gp_Ax3

Description
-----------
Returns the local coordinate system of the cylinder.
") Position;
		const gp_Ax3 Position();

		/****** gp_Cylinder::Radius ******/
		/****** md5 signature: a9fd144d0cbef7b3a906e17ab20118f2 ******/
		%feature("compactdefaultargs") Radius;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns the radius of the cylinder.
") Radius;
		double Radius();

		/****** gp_Cylinder::Rotate ******/
		/****** md5 signature: 652dfbf621c2c092ff5b68d608de4634 ******/
		%feature("compactdefaultargs") Rotate;
		%feature("autodoc", "
Parameters
----------
theA1: gp_Ax1
theAng: double

Return
-------
None

Description
-----------
No available documentation.
") Rotate;
		void Rotate(const gp_Ax1 & theA1, const double theAng);

		/****** gp_Cylinder::Rotated ******/
		/****** md5 signature: 5cbe8783ea7a6a436d8e054090ae357d ******/
		%feature("compactdefaultargs") Rotated;
		%feature("autodoc", "
Parameters
----------
theA1: gp_Ax1
theAng: double

Return
-------
gp_Cylinder

Description
-----------
Rotates a cylinder. theA1 is the axis of the rotation. theAng is the angular value of the rotation in radians.
") Rotated;
		gp_Cylinder Rotated(const gp_Ax1 & theA1, const double theAng);

		/****** gp_Cylinder::Scale ******/
		/****** md5 signature: a03901fe94facbb26121cd37d5814f81 ******/
		%feature("compactdefaultargs") Scale;
		%feature("autodoc", "
Parameters
----------
theP: gp_Pnt
theS: double

Return
-------
None

Description
-----------
No available documentation.
") Scale;
		void Scale(const gp_Pnt & theP, const double theS);

		/****** gp_Cylinder::Scaled ******/
		/****** md5 signature: fdead3c82a21c53722f421dc6cbd37a4 ******/
		%feature("compactdefaultargs") Scaled;
		%feature("autodoc", "
Parameters
----------
theP: gp_Pnt
theS: double

Return
-------
gp_Cylinder

Description
-----------
Scales a cylinder. theS is the scaling value. The absolute value of theS is used to scale the cylinder.
") Scaled;
		gp_Cylinder Scaled(const gp_Pnt & theP, const double theS);

		/****** gp_Cylinder::SetAxis ******/
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
Changes the symmetry axis of the cylinder. Raises ConstructionError if the direction of theA1 is parallel to the 'XDirection' of the coordinate system of the cylinder.
") SetAxis;
		void SetAxis(const gp_Ax1 & theA1);

		/****** gp_Cylinder::SetLocation ******/
		/****** md5 signature: f1c958277e2e7de2571c6b5691801e2a ******/
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
Changes the location of the surface.
") SetLocation;
		void SetLocation(const gp_Pnt & theLoc);

		/****** gp_Cylinder::SetPosition ******/
		/****** md5 signature: 967a77c1867c53ae2fb8ec3b93905c83 ******/
		%feature("compactdefaultargs") SetPosition;
		%feature("autodoc", "
Parameters
----------
theA3: gp_Ax3

Return
-------
None

Description
-----------
Change the local coordinate system of the surface.
") SetPosition;
		void SetPosition(const gp_Ax3 & theA3);

		/****** gp_Cylinder::SetRadius ******/
		/****** md5 signature: a5bdc5efcd41823cfeb57a16cd83858a ******/
		%feature("compactdefaultargs") SetRadius;
		%feature("autodoc", "
Parameters
----------
theR: double

Return
-------
None

Description
-----------
Modifies the radius of this cylinder. Exceptions Standard_ConstructionError if theR is negative.
") SetRadius;
		void SetRadius(const double theR);

		/****** gp_Cylinder::Transform ******/
		/****** md5 signature: 0737a7286be728220e1a55ba0d6eafc3 ******/
		%feature("compactdefaultargs") Transform;
		%feature("autodoc", "
Parameters
----------
theT: gp_Trsf

Return
-------
None

Description
-----------
No available documentation.
") Transform;
		void Transform(const gp_Trsf & theT);

		/****** gp_Cylinder::Transformed ******/
		/****** md5 signature: ce75d4fe0235f160e5dd4ce49f738d90 ******/
		%feature("compactdefaultargs") Transformed;
		%feature("autodoc", "
Parameters
----------
theT: gp_Trsf

Return
-------
gp_Cylinder

Description
-----------
Transforms a cylinder with the transformation theT from class Trsf.
") Transformed;
		gp_Cylinder Transformed(const gp_Trsf & theT);

		/****** gp_Cylinder::Translate ******/
		/****** md5 signature: 8ae07d4c829c1eef2e7708ef5390638b ******/
		%feature("compactdefaultargs") Translate;
		%feature("autodoc", "
Parameters
----------
theV: gp_Vec

Return
-------
None

Description
-----------
No available documentation.
") Translate;
		void Translate(const gp_Vec & theV);

		/****** gp_Cylinder::Translate ******/
		/****** md5 signature: 279c13d6194eb867625753d756d110ab ******/
		%feature("compactdefaultargs") Translate;
		%feature("autodoc", "
Parameters
----------
theP1: gp_Pnt
theP2: gp_Pnt

Return
-------
None

Description
-----------
No available documentation.
") Translate;
		void Translate(const gp_Pnt & theP1, const gp_Pnt & theP2);

		/****** gp_Cylinder::Translated ******/
		/****** md5 signature: 2a015a6584cd0e09bb8ab179fc9902f9 ******/
		%feature("compactdefaultargs") Translated;
		%feature("autodoc", "
Parameters
----------
theV: gp_Vec

Return
-------
gp_Cylinder

Description
-----------
Translates a cylinder in the direction of the vector theV. The magnitude of the translation is the vector's magnitude.
") Translated;
		gp_Cylinder Translated(const gp_Vec & theV);

		/****** gp_Cylinder::Translated ******/
		/****** md5 signature: 34001f8940cec4e49e7431e0b2ec9ae0 ******/
		%feature("compactdefaultargs") Translated;
		%feature("autodoc", "
Parameters
----------
theP1: gp_Pnt
theP2: gp_Pnt

Return
-------
gp_Cylinder

Description
-----------
Translates a cylinder from the point theP1 to the point theP2.
") Translated;
		gp_Cylinder Translated(const gp_Pnt & theP1, const gp_Pnt & theP2);

		/****** gp_Cylinder::UReverse ******/
		/****** md5 signature: 69a43a8af82ddbb84c6e12cf963de477 ******/
		%feature("compactdefaultargs") UReverse;
		%feature("autodoc", "Return
-------
None

Description
-----------
Reverses the U parametrization of the cylinder reversing the YAxis.
") UReverse;
		void UReverse();

		/****** gp_Cylinder::VReverse ******/
		/****** md5 signature: 07b53fb5da02e3545309a68afe3655c9 ******/
		%feature("compactdefaultargs") VReverse;
		%feature("autodoc", "Return
-------
None

Description
-----------
Reverses the V parametrization of the plane reversing the Axis.
") VReverse;
		void VReverse();

		/****** gp_Cylinder::XAxis ******/
		/****** md5 signature: 37d8185a57a29bf9b7aa10d76b1229a2 ******/
		%feature("compactdefaultargs") XAxis;
		%feature("autodoc", "Return
-------
gp_Ax1

Description
-----------
Returns the axis X of the cylinder.
") XAxis;
		gp_Ax1 XAxis();

		/****** gp_Cylinder::YAxis ******/
		/****** md5 signature: 78f0cb55c98fbe890a49b3158d9f5039 ******/
		%feature("compactdefaultargs") YAxis;
		%feature("autodoc", "Return
-------
gp_Ax1

Description
-----------
Returns the axis Y of the cylinder.
") YAxis;
		gp_Ax1 YAxis();

};



%extend gp_Cylinder {
%pythoncode {
    def __getstate__(self):
        return self.DumpJson()
    }
};

%extend gp_Cylinder {
%pythoncode {
    def __setstate__(self, state):
        inst = gp_Cylinder()
        if inst.InitFromJson(state):
            self.this = inst.this
        else:
            raise IOError('Failed to set state of gp_Cylinder')
    }
};
%extend gp_Cylinder {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************
* class gp_Dir *
***************/
class gp_Dir {
	public:
/* public enums */
enum class D {
	X = 0,
	Y = 1,
	Z = 2,
	NX = 3,
	NY = 4,
	NZ = 5,
};

/* end public enums declaration */

/* python proxy classes for enums */
%pythoncode {

class D(IntEnum):
	X = 0
	Y = 1
	Z = 2
	NX = 3
	NY = 4
	NZ = 5
X = D.X
Y = D.Y
Z = D.Z
NX = D.NX
NY = D.NY
NZ = D.NZ
};
/* end python proxy for enums */

		/****** gp_Dir::gp_Dir ******/
		/****** md5 signature: 1ab370cf889de78172fad20b02eaa2bc ******/
		%feature("compactdefaultargs") gp_Dir;
		%feature("autodoc", "Return
-------
None

Description
-----------
Creates a direction corresponding to X axis.
") gp_Dir;
		 gp_Dir();

		/****** gp_Dir::gp_Dir ******/
		/****** md5 signature: b6c9e1d3b4b581f86deac00fd447d076 ******/
		%feature("compactdefaultargs") gp_Dir;
		%feature("autodoc", "
Parameters
----------
theDir: D

Return
-------
None

Description
-----------
Creates a direction from a standard direction enumeration.
") gp_Dir;
		 gp_Dir(D theDir);

		/****** gp_Dir::gp_Dir ******/
		/****** md5 signature: 28fbbf390df51736f6577933c366a5da ******/
		%feature("compactdefaultargs") gp_Dir;
		%feature("autodoc", "
Parameters
----------
theV: gp_Vec

Return
-------
None

Description
-----------
Normalizes the vector theV and creates a direction. Raises ConstructionError if theV.Magnitude() <= Resolution. @note Constexpr-compatible when input is already normalized.
") gp_Dir;
		 gp_Dir(const gp_Vec & theV);

		/****** gp_Dir::gp_Dir ******/
		/****** md5 signature: b06d7483d434c73e99b2cd754cfb5a47 ******/
		%feature("compactdefaultargs") gp_Dir;
		%feature("autodoc", "
Parameters
----------
theCoord: gp_XYZ

Return
-------
None

Description
-----------
Creates a direction from a triplet of coordinates. Raises ConstructionError if theCoord.Modulus() <= Resolution from gp. @note Constexpr-compatible when input is already normalized.
") gp_Dir;
		 gp_Dir(const gp_XYZ & theCoord);

		/****** gp_Dir::gp_Dir ******/
		/****** md5 signature: cc2958e1ad1477ce0d0001be515a5294 ******/
		%feature("compactdefaultargs") gp_Dir;
		%feature("autodoc", "
Parameters
----------
theXv: double
theYv: double
theZv: double

Return
-------
None

Description
-----------
Creates a direction with its 3 cartesian coordinates. Raises ConstructionError if std::sqrt(theXv*theXv + theYv*theYv + theZv*theZv) <= Resolution Modification of the direction's coordinates If std::sqrt (theXv*theXv + theYv*theYv + theZv*theZv) <= Resolution from gp where theXv, theYv ,theZv are the new coordinates it is not possible to construct the direction and the method raises the exception ConstructionError. @note Constexpr-compatible when input is already normalized.
") gp_Dir;
		 gp_Dir(const double theXv, const double theYv, const double theZv);

		/****** gp_Dir::gp_Dir ******/
		/****** md5 signature: 8b5bde22a488b2d406d996546dd81d10 ******/
		%feature("compactdefaultargs") gp_Dir;
		%feature("autodoc", "
Parameters
----------
&: gp_Dir

Return
-------
None

Description
-----------
No available documentation.
") gp_Dir;
		 gp_Dir(const gp_Dir &);

		/****** gp_Dir::gp_Dir ******/
		/****** md5 signature: 4448c5c3336fb7919a62b358aa0eadfb ******/
		%feature("compactdefaultargs") gp_Dir;
		%feature("autodoc", "
Parameters
----------
&: gp_Dir

Return
-------
None

Description
-----------
No available documentation.
") gp_Dir;
		 gp_Dir(gp_Dir &);

		/****** gp_Dir::Angle ******/
		/****** md5 signature: 24556f85b3e9f10b23f18e54cfd359c8 ******/
		%feature("compactdefaultargs") Angle;
		%feature("autodoc", "
Parameters
----------
theOther: gp_Dir

Return
-------
double

Description
-----------
Computes the angular value in radians between <self> and <theOther>. This value is always positive in 3D space. Returns the angle in the range [0, PI].
") Angle;
		double Angle(const gp_Dir & theOther);

		/****** gp_Dir::AngleWithRef ******/
		/****** md5 signature: eede68488e73ffa325e2860b3647515a ******/
		%feature("compactdefaultargs") AngleWithRef;
		%feature("autodoc", "
Parameters
----------
theOther: gp_Dir
theVRef: gp_Dir

Return
-------
double

Description
-----------
Computes the angular value between <self> and <theOther>. <theVRef> is the direction of reference normal to <self> and <theOther> and its orientation gives the positive sense of rotation. If the cross product <self> ^ <theOther> has the same orientation as <theVRef> the angular value is positive else negative. Returns the angular value in the range -PI and PI (in radians). Raises DomainError if <self> and <theOther> are not parallel this exception is raised when <theVRef> is in the same plane as <self> and <theOther> The tolerance criterion is Resolution from package gp.
") AngleWithRef;
		double AngleWithRef(const gp_Dir & theOther, const gp_Dir & theVRef);

		/****** gp_Dir::Coord ******/
		/****** md5 signature: 5ab919f0e89833f70cf3f70d2ba0fddc ******/
		%feature("compactdefaultargs") Coord;
		%feature("autodoc", "
Parameters
----------
theIndex: int

Return
-------
double

Description
-----------
Returns the coordinate of range theIndex: theIndex = 1 => X is returned theIndex = 2 => Y is returned theIndex = 3 => Z is returned Exceptions Standard_OutOfRange if theIndex is not 1, 2, or 3.
") Coord;
		double Coord(const int theIndex);

		/****** gp_Dir::Coord ******/
		/****** md5 signature: 0b7d1d168b363943a7967ea736acb684 ******/
		%feature("compactdefaultargs") Coord;
		%feature("autodoc", "
Parameters
----------

Return
-------
theXv: double
theYv: double
theZv: double

Description
-----------
Returns for the unit vector its three coordinates theXv, theYv, and theZv.
") Coord;
		void Coord(Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** gp_Dir::Cross ******/
		/****** md5 signature: e45297c14fb8ed2a71ac0381dd35478c ******/
		%feature("compactdefaultargs") Cross;
		%feature("autodoc", "
Parameters
----------
theRight: gp_Dir

Return
-------
None

Description
-----------
Computes the cross product between two directions Raises the exception ConstructionError if the two directions are parallel because the computed vector cannot be normalized to create a direction. @note Constexpr-compatible when result is already normalized.
") Cross;
		void Cross(const gp_Dir & theRight);

		/****** gp_Dir::CrossCross ******/
		/****** md5 signature: e3b0ac65593cd422b9c3a136d889387a ******/
		%feature("compactdefaultargs") CrossCross;
		%feature("autodoc", "
Parameters
----------
theV1: gp_Dir
theV2: gp_Dir

Return
-------
None

Description
-----------
@note Constexpr-compatible when result is already normalized.
") CrossCross;
		void CrossCross(const gp_Dir & theV1, const gp_Dir & theV2);

		/****** gp_Dir::CrossCrossed ******/
		/****** md5 signature: c7f1cec3ecabb8e00cbf4727f6089034 ******/
		%feature("compactdefaultargs") CrossCrossed;
		%feature("autodoc", "
Parameters
----------
theV1: gp_Dir
theV2: gp_Dir

Return
-------
gp_Dir

Description
-----------
Computes the double vector product this ^ (theV1 ^ theV2). - CrossCrossed creates a new unit vector. Exceptions Standard_ConstructionError if: - theV1 and theV2 are parallel, or - this unit vector and (theV1 ^ theV2) are parallel. This is because, in these conditions, the computed vector is null and cannot be normalized. @note Constexpr-compatible when result is already normalized.
") CrossCrossed;
		gp_Dir CrossCrossed(const gp_Dir & theV1, const gp_Dir & theV2);

		/****** gp_Dir::Crossed ******/
		/****** md5 signature: a34e9c31a0daf908ec40c6813599f7dc ******/
		%feature("compactdefaultargs") Crossed;
		%feature("autodoc", "
Parameters
----------
theRight: gp_Dir

Return
-------
gp_Dir

Description
-----------
Computes the triple vector product. <self> ^ (V1 ^ V2) Raises the exception ConstructionError if V1 and V2 are parallel or <self> and (V1^V2) are parallel because the computed vector can't be normalized to create a direction. @note Constexpr-compatible when result is already normalized.
") Crossed;
		gp_Dir Crossed(const gp_Dir & theRight);

		/****** gp_Dir::Dot ******/
		/****** md5 signature: 7875322efbee3991232f161820164ace ******/
		%feature("compactdefaultargs") Dot;
		%feature("autodoc", "
Parameters
----------
theOther: gp_Dir

Return
-------
double

Description
-----------
Computes the scalar product.
") Dot;
		double Dot(const gp_Dir & theOther);

		/****** gp_Dir::DotCross ******/
		/****** md5 signature: 7a553bb0549d11c468ac24745f151bbc ******/
		%feature("compactdefaultargs") DotCross;
		%feature("autodoc", "
Parameters
----------
theV1: gp_Dir
theV2: gp_Dir

Return
-------
double

Description
-----------
Computes the triple scalar product <self> * (theV1 ^ theV2). Warnings: The computed vector theV1' = theV1 ^ theV2 is not normalized to create a unitary vector. So this method never raises an exception even if theV1 and theV2 are parallel.
") DotCross;
		double DotCross(const gp_Dir & theV1, const gp_Dir & theV2);


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

        /****************** InitFromJson ******************/
        %feature("autodoc", "
Parameters
----------
json_string: the string

Return
-------
bool

Description
-----------
Init the object from a JSON string.
") InitFromJson;
        %extend{
            bool InitFromJson(std::string json_string) {
            std::stringstream s(json_string);
            Standard_Integer pos=2;
            return self->InitFromJson(s, pos);}
        };
		/****** gp_Dir::IsEqual ******/
		/****** md5 signature: da12d094e075a697d8f66bacf1dbc8ea ******/
		%feature("compactdefaultargs") IsEqual;
		%feature("autodoc", "
Parameters
----------
theOther: gp_Dir
theAngularTolerance: double

Return
-------
bool

Description
-----------
Returns True if the angle between the two directions is lower or equal to theAngularTolerance.
") IsEqual;
		bool IsEqual(const gp_Dir & theOther, const double theAngularTolerance);

		/****** gp_Dir::IsNormal ******/
		/****** md5 signature: f26d017d0062331c9c1780519ddcff23 ******/
		%feature("compactdefaultargs") IsNormal;
		%feature("autodoc", "
Parameters
----------
theOther: gp_Dir
theAngularTolerance: double

Return
-------
bool

Description
-----------
Returns True if the angle between this unit vector and the unit vector theOther is equal to Pi/2 (normal).
") IsNormal;
		bool IsNormal(const gp_Dir & theOther, const double theAngularTolerance);

		/****** gp_Dir::IsOpposite ******/
		/****** md5 signature: 14c8e73a1ce1db7666ce61c6438be51a ******/
		%feature("compactdefaultargs") IsOpposite;
		%feature("autodoc", "
Parameters
----------
theOther: gp_Dir
theAngularTolerance: double

Return
-------
bool

Description
-----------
Returns True if the angle between this unit vector and the unit vector theOther is equal to Pi (opposite).
") IsOpposite;
		bool IsOpposite(const gp_Dir & theOther, const double theAngularTolerance);

		/****** gp_Dir::IsParallel ******/
		/****** md5 signature: 2962460480c95f2f0958e3148b749503 ******/
		%feature("compactdefaultargs") IsParallel;
		%feature("autodoc", "
Parameters
----------
theOther: gp_Dir
theAngularTolerance: double

Return
-------
bool

Description
-----------
Returns true if the angle between this unit vector and the unit vector theOther is equal to 0 or to Pi. Note: the tolerance criterion is given by theAngularTolerance.
") IsParallel;
		bool IsParallel(const gp_Dir & theOther, const double theAngularTolerance);

		/****** gp_Dir::Mirror ******/
		/****** md5 signature: a22ddde3070ef98489d2354e3e9258a2 ******/
		%feature("compactdefaultargs") Mirror;
		%feature("autodoc", "
Parameters
----------
theV: gp_Dir

Return
-------
None

Description
-----------
No available documentation.
") Mirror;
		void Mirror(const gp_Dir & theV);

		/****** gp_Dir::Mirror ******/
		/****** md5 signature: f508bc9f1879a959242732c259593a0a ******/
		%feature("compactdefaultargs") Mirror;
		%feature("autodoc", "
Parameters
----------
theA1: gp_Ax1

Return
-------
None

Description
-----------
No available documentation.
") Mirror;
		void Mirror(const gp_Ax1 & theA1);

		/****** gp_Dir::Mirror ******/
		/****** md5 signature: ba516d9e4a2b6af0ed16d37de915dd83 ******/
		%feature("compactdefaultargs") Mirror;
		%feature("autodoc", "
Parameters
----------
theA2: gp_Ax2

Return
-------
None

Description
-----------
No available documentation.
") Mirror;
		void Mirror(const gp_Ax2 & theA2);

		/****** gp_Dir::Mirrored ******/
		/****** md5 signature: e6e6ebf8619f72cf2ebbdf05b9fad8f4 ******/
		%feature("compactdefaultargs") Mirrored;
		%feature("autodoc", "
Parameters
----------
theV: gp_Dir

Return
-------
gp_Dir

Description
-----------
Performs the symmetrical transformation of a direction with respect to the direction theV which is the center of the symmetry.
") Mirrored;
		gp_Dir Mirrored(const gp_Dir & theV);

		/****** gp_Dir::Mirrored ******/
		/****** md5 signature: af482dfbbd3c7f8dfd50f030cdf9feb0 ******/
		%feature("compactdefaultargs") Mirrored;
		%feature("autodoc", "
Parameters
----------
theA1: gp_Ax1

Return
-------
gp_Dir

Description
-----------
Performs the symmetrical transformation of a direction with respect to an axis placement which is the axis of the symmetry.
") Mirrored;
		gp_Dir Mirrored(const gp_Ax1 & theA1);

		/****** gp_Dir::Mirrored ******/
		/****** md5 signature: f6a5da4911a01c601ed425dd2fbc5b4b ******/
		%feature("compactdefaultargs") Mirrored;
		%feature("autodoc", "
Parameters
----------
theA2: gp_Ax2

Return
-------
gp_Dir

Description
-----------
Performs the symmetrical transformation of a direction with respect to a plane. The axis placement theA2 locates the plane of the symmetry: (Location, XDirection, YDirection).
") Mirrored;
		gp_Dir Mirrored(const gp_Ax2 & theA2);

		/****** gp_Dir::Reverse ******/
		/****** md5 signature: 229f8663d04c43240c56ed238a384b26 ******/
		%feature("compactdefaultargs") Reverse;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Reverse;
		void Reverse();

		/****** gp_Dir::Reversed ******/
		/****** md5 signature: 4122b8d35c35f0d2234a0003609f3aa5 ******/
		%feature("compactdefaultargs") Reversed;
		%feature("autodoc", "Return
-------
gp_Dir

Description
-----------
Reverses the orientation of a direction geometric transformations Performs the symmetrical transformation of a direction with respect to the direction V which is the center of the symmetry.
") Reversed;
		gp_Dir Reversed();

		/****** gp_Dir::Rotate ******/
		/****** md5 signature: 1ad1f6be15e850ce247e9683ec6abb78 ******/
		%feature("compactdefaultargs") Rotate;
		%feature("autodoc", "
Parameters
----------
theA1: gp_Ax1
theAng: double

Return
-------
None

Description
-----------
No available documentation.
") Rotate;
		void Rotate(const gp_Ax1 & theA1, const double theAng);

		/****** gp_Dir::Rotated ******/
		/****** md5 signature: 2a36b46d9b2913a2ff79230e21b18540 ******/
		%feature("compactdefaultargs") Rotated;
		%feature("autodoc", "
Parameters
----------
theA1: gp_Ax1
theAng: double

Return
-------
gp_Dir

Description
-----------
Rotates a direction. theA1 is the axis of the rotation. theAng is the angular value of the rotation in radians.
") Rotated;
		gp_Dir Rotated(const gp_Ax1 & theA1, const double theAng);

		/****** gp_Dir::SetCoord ******/
		/****** md5 signature: 7ed8eb841ea14600f4040c04c51b09bd ******/
		%feature("compactdefaultargs") SetCoord;
		%feature("autodoc", "
Parameters
----------
theIndex: int
theXi: double

Return
-------
None

Description
-----------
For this unit vector, assigns the value Xi to: - the X coordinate if theIndex is 1, or - the Y coordinate if theIndex is 2, or - the Z coordinate if theIndex is 3, and then normalizes it. Warning: Remember that all the coordinates of a unit vector are implicitly modified when any single one is changed directly. Exceptions Standard_OutOfRange if theIndex is not 1, 2, or 3. Standard_ConstructionError if either of the following is less than or equal to gp::Resolution(): - std::sqrt(Xv*Xv + Yv*Yv + Zv*Zv), or - the modulus of the number triple formed by the new value theXi and the two other coordinates of this vector that were not directly modified. @note Constexpr-compatible when result is already normalized.
") SetCoord;
		void SetCoord(const int theIndex, const double theXi);

		/****** gp_Dir::SetCoord ******/
		/****** md5 signature: b559bd407310510fc24816514b74f145 ******/
		%feature("compactdefaultargs") SetCoord;
		%feature("autodoc", "
Parameters
----------
theXv: double
theYv: double
theZv: double

Return
-------
None

Description
-----------
For this unit vector, assigns the values theXv, theYv and theZv to its three coordinates. Remember that all the coordinates of a unit vector are implicitly modified when any single one is changed directly. @note Constexpr-compatible when input is already normalized.
") SetCoord;
		void SetCoord(const double theXv, const double theYv, const double theZv);

		/****** gp_Dir::SetX ******/
		/****** md5 signature: ef73cff52bf34cd295327d9e5a810cd3 ******/
		%feature("compactdefaultargs") SetX;
		%feature("autodoc", "
Parameters
----------
theX: double

Return
-------
None

Description
-----------
Assigns the given value to the X coordinate of this unit vector. @note Constexpr-compatible when result is already normalized.
") SetX;
		void SetX(const double theX);

		/****** gp_Dir::SetXYZ ******/
		/****** md5 signature: 2cee32d706232c178c9e3efbacaf67f3 ******/
		%feature("compactdefaultargs") SetXYZ;
		%feature("autodoc", "
Parameters
----------
theCoord: gp_XYZ

Return
-------
None

Description
-----------
Assigns the three coordinates of theCoord to this unit vector. @note Constexpr-compatible when input is already normalized.
") SetXYZ;
		void SetXYZ(const gp_XYZ & theCoord);

		/****** gp_Dir::SetY ******/
		/****** md5 signature: 58e4c5f5bbcaf8cdd12f97ce9cbec17b ******/
		%feature("compactdefaultargs") SetY;
		%feature("autodoc", "
Parameters
----------
theY: double

Return
-------
None

Description
-----------
Assigns the given value to the Y coordinate of this unit vector. @note Constexpr-compatible when result is already normalized.
") SetY;
		void SetY(const double theY);

		/****** gp_Dir::SetZ ******/
		/****** md5 signature: d5377ab02d69a41b8d8a4509de43d105 ******/
		%feature("compactdefaultargs") SetZ;
		%feature("autodoc", "
Parameters
----------
theZ: double

Return
-------
None

Description
-----------
Assigns the given value to the Z coordinate of this unit vector. @note Constexpr-compatible when result is already normalized.
") SetZ;
		void SetZ(const double theZ);

		/****** gp_Dir::Transform ******/
		/****** md5 signature: 0737a7286be728220e1a55ba0d6eafc3 ******/
		%feature("compactdefaultargs") Transform;
		%feature("autodoc", "
Parameters
----------
theT: gp_Trsf

Return
-------
None

Description
-----------
No available documentation.
") Transform;
		void Transform(const gp_Trsf & theT);

		/****** gp_Dir::Transformed ******/
		/****** md5 signature: d92ccaf5eb2d8f610be5c41a259fbbdd ******/
		%feature("compactdefaultargs") Transformed;
		%feature("autodoc", "
Parameters
----------
theT: gp_Trsf

Return
-------
gp_Dir

Description
-----------
Transforms a direction with a 'Trsf' from gp. Warnings: If the scale factor of the 'Trsf' theT is negative then the direction <self> is reversed.
") Transformed;
		gp_Dir Transformed(const gp_Trsf & theT);

		/****** gp_Dir::X ******/
		/****** md5 signature: c418db3e494968281737cca9c90ecbdf ******/
		%feature("compactdefaultargs") X;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns the X coordinate for a unit vector.
") X;
		double X();

		/****** gp_Dir::XYZ ******/
		/****** md5 signature: db771f2137a73770f8fa68788fc317cc ******/
		%feature("compactdefaultargs") XYZ;
		%feature("autodoc", "Return
-------
gp_XYZ

Description
-----------
for this unit vector, returns its three coordinates as a number triple.
") XYZ;
		const gp_XYZ XYZ();

		/****** gp_Dir::Y ******/
		/****** md5 signature: 25eefb608c358bc135b3158209ee8901 ******/
		%feature("compactdefaultargs") Y;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns the Y coordinate for a unit vector.
") Y;
		double Y();

		/****** gp_Dir::Z ******/
		/****** md5 signature: 078eb43f219d180be16ce27c9708e49a ******/
		%feature("compactdefaultargs") Z;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns the Z coordinate for a unit vector.
") Z;
		double Z();

		/****** gp_Dir::operator * ******/
		/****** md5 signature: a66873891fbfe4460775ad607f80bba7 ******/
		%feature("compactdefaultargs") operator *;
		%feature("autodoc", "
Parameters
----------
theOther: gp_Dir

Return
-------
double

Description
-----------
No available documentation.
") operator *;
		double operator *(const gp_Dir & theOther);

		/****** gp_Dir::operator - ******/
		/****** md5 signature: cbe97989d9a41e0ecfe42791c8184b71 ******/
		%feature("compactdefaultargs") operator -;
		%feature("autodoc", "Return
-------
gp_Dir

Description
-----------
No available documentation.
") operator -;
		gp_Dir operator -();

};



%extend gp_Dir {
%pythoncode {
    def __getstate__(self):
        return self.DumpJson()
    }
};

%extend gp_Dir {
%pythoncode {
    def __setstate__(self, state):
        inst = gp_Dir()
        if inst.InitFromJson(state):
            self.this = inst.this
        else:
            raise IOError('Failed to set state of gp_Dir')
    }
};
%extend gp_Dir {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************
* class gp_Dir2d *
*****************/
class gp_Dir2d {
	public:
/* public enums */
enum class D {
	X = 0,
	Y = 1,
	NX = 2,
	NY = 3,
};

/* end public enums declaration */

/* python proxy classes for enums */
%pythoncode {

class D(IntEnum):
	X = 0
	Y = 1
	NX = 2
	NY = 3
X = D.X
Y = D.Y
NX = D.NX
NY = D.NY
};
/* end python proxy for enums */

		/****** gp_Dir2d::gp_Dir2d ******/
		/****** md5 signature: c6452b709b1c4fff5babcd2b221f1986 ******/
		%feature("compactdefaultargs") gp_Dir2d;
		%feature("autodoc", "Return
-------
None

Description
-----------
Creates a direction corresponding to X axis.
") gp_Dir2d;
		 gp_Dir2d();

		/****** gp_Dir2d::gp_Dir2d ******/
		/****** md5 signature: 7df8c2d8e29a40ae95d45af109000abb ******/
		%feature("compactdefaultargs") gp_Dir2d;
		%feature("autodoc", "
Parameters
----------
theDir: D

Return
-------
None

Description
-----------
Creates a direction from a standard direction enumeration.
") gp_Dir2d;
		 gp_Dir2d(D theDir);

		/****** gp_Dir2d::gp_Dir2d ******/
		/****** md5 signature: 2e83b559fde093a56ff4e9c0efb1deb3 ******/
		%feature("compactdefaultargs") gp_Dir2d;
		%feature("autodoc", "
Parameters
----------
theV: gp_Vec2d

Return
-------
None

Description
-----------
Normalizes the vector theV and creates a Direction. Raises ConstructionError if theV.Magnitude() <= Resolution from gp. @note Constexpr-compatible when input is already normalized.
") gp_Dir2d;
		 gp_Dir2d(const gp_Vec2d & theV);

		/****** gp_Dir2d::gp_Dir2d ******/
		/****** md5 signature: a192682aed6279c6084187b9c3a4bee6 ******/
		%feature("compactdefaultargs") gp_Dir2d;
		%feature("autodoc", "
Parameters
----------
theCoord: gp_XY

Return
-------
None

Description
-----------
Creates a Direction from a doublet of coordinates. Raises ConstructionError if theCoord.Modulus() <= Resolution from gp. @note Constexpr-compatible when input is already normalized.
") gp_Dir2d;
		 gp_Dir2d(const gp_XY & theCoord);

		/****** gp_Dir2d::gp_Dir2d ******/
		/****** md5 signature: 3037a74bae1ed9243afdfda1c5da2e34 ******/
		%feature("compactdefaultargs") gp_Dir2d;
		%feature("autodoc", "
Parameters
----------
theXv: double
theYv: double

Return
-------
None

Description
-----------
Creates a Direction with its 2 cartesian coordinates. Raises ConstructionError if std::sqrt(theXv*theXv + theYv*theYv) <= Resolution from gp. @note Constexpr-compatible when input is already normalized.
") gp_Dir2d;
		 gp_Dir2d(const double theXv, const double theYv);

		/****** gp_Dir2d::Angle ******/
		/****** md5 signature: 97f4868fd92a93dcd5ef6e12b567af17 ******/
		%feature("compactdefaultargs") Angle;
		%feature("autodoc", "
Parameters
----------
theOther: gp_Dir2d

Return
-------
double

Description
-----------
Computes the angular value in radians between <self> and <theOther>. Returns the angle in the range [-PI, PI].
") Angle;
		double Angle(const gp_Dir2d & theOther);

		/****** gp_Dir2d::Coord ******/
		/****** md5 signature: 5ab919f0e89833f70cf3f70d2ba0fddc ******/
		%feature("compactdefaultargs") Coord;
		%feature("autodoc", "
Parameters
----------
theIndex: int

Return
-------
double

Description
-----------
For this unit vector returns the coordinate of range theIndex: theIndex = 1 => X is returned theIndex = 2 => Y is returned Raises OutOfRange if theIndex != {1, 2}.
") Coord;
		double Coord(const int theIndex);

		/****** gp_Dir2d::Coord ******/
		/****** md5 signature: c4f8752985ac7df5dcf67b5ae0e60b81 ******/
		%feature("compactdefaultargs") Coord;
		%feature("autodoc", "
Parameters
----------

Return
-------
theXv: double
theYv: double

Description
-----------
For this unit vector returns its two coordinates theXv and theYv. Raises OutOfRange if theIndex != {1, 2}.
") Coord;
		void Coord(Standard_Real &OutValue, Standard_Real &OutValue);

		/****** gp_Dir2d::Crossed ******/
		/****** md5 signature: 52edb185e94c017361b0133cfa50ac34 ******/
		%feature("compactdefaultargs") Crossed;
		%feature("autodoc", "
Parameters
----------
theRight: gp_Dir2d

Return
-------
double

Description
-----------
Computes the cross product between two directions.
") Crossed;
		double Crossed(const gp_Dir2d & theRight);

		/****** gp_Dir2d::Dot ******/
		/****** md5 signature: ad6c31f61069e4b8f4ae9aae588798b4 ******/
		%feature("compactdefaultargs") Dot;
		%feature("autodoc", "
Parameters
----------
theOther: gp_Dir2d

Return
-------
double

Description
-----------
Computes the scalar product.
") Dot;
		double Dot(const gp_Dir2d & theOther);


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
		/****** gp_Dir2d::IsEqual ******/
		/****** md5 signature: a09aa39b922c0126de4cd0e972b38f76 ******/
		%feature("compactdefaultargs") IsEqual;
		%feature("autodoc", "
Parameters
----------
theOther: gp_Dir2d
theAngularTolerance: double

Return
-------
bool

Description
-----------
Returns True if the two vectors have the same direction i.e. the angle between this unit vector and the unit vector theOther is less than or equal to theAngularTolerance.
") IsEqual;
		bool IsEqual(const gp_Dir2d & theOther, const double theAngularTolerance);

		/****** gp_Dir2d::IsNormal ******/
		/****** md5 signature: 70bd52e0dd6fa71b9c33ddcbbf018f16 ******/
		%feature("compactdefaultargs") IsNormal;
		%feature("autodoc", "
Parameters
----------
theOther: gp_Dir2d
theAngularTolerance: double

Return
-------
bool

Description
-----------
Returns True if the angle between this unit vector and the unit vector theOther is equal to Pi/2 or -Pi/2 (normal) i.e. std::abs(std::abs(<self>.Angle(theOther)) - PI/2.) <= theAngularTolerance.
") IsNormal;
		bool IsNormal(const gp_Dir2d & theOther, const double theAngularTolerance);

		/****** gp_Dir2d::IsOpposite ******/
		/****** md5 signature: 60152040bdf6ab9c99a857e848398b98 ******/
		%feature("compactdefaultargs") IsOpposite;
		%feature("autodoc", "
Parameters
----------
theOther: gp_Dir2d
theAngularTolerance: double

Return
-------
bool

Description
-----------
Returns True if the angle between this unit vector and the unit vector theOther is equal to Pi or -Pi (opposite). i.e. PI - std::abs(<self>.Angle(theOther)) <= theAngularTolerance.
") IsOpposite;
		bool IsOpposite(const gp_Dir2d & theOther, const double theAngularTolerance);

		/****** gp_Dir2d::IsParallel ******/
		/****** md5 signature: 5ad602a4a31a96be87b62aef2071b706 ******/
		%feature("compactdefaultargs") IsParallel;
		%feature("autodoc", "
Parameters
----------
theOther: gp_Dir2d
theAngularTolerance: double

Return
-------
bool

Description
-----------
Returns True if the angle between this unit vector and unit vector theOther is equal to 0, Pi or -Pi. i.e. std::abs(Angle(<self>, theOther)) <= theAngularTolerance or PI - std::abs(Angle(<self>, theOther)) <= theAngularTolerance.
") IsParallel;
		bool IsParallel(const gp_Dir2d & theOther, const double theAngularTolerance);

		/****** gp_Dir2d::Mirror ******/
		/****** md5 signature: 694edbf552bcf456f369d290704abc01 ******/
		%feature("compactdefaultargs") Mirror;
		%feature("autodoc", "
Parameters
----------
theV: gp_Dir2d

Return
-------
None

Description
-----------
No available documentation.
") Mirror;
		void Mirror(const gp_Dir2d & theV);

		/****** gp_Dir2d::Mirror ******/
		/****** md5 signature: c8b01b19fc436ab187f95301941edbc1 ******/
		%feature("compactdefaultargs") Mirror;
		%feature("autodoc", "
Parameters
----------
theA: gp_Ax2d

Return
-------
None

Description
-----------
No available documentation.
") Mirror;
		void Mirror(const gp_Ax2d & theA);

		/****** gp_Dir2d::Mirrored ******/
		/****** md5 signature: f5b077a4b55df1bd5a68d818f4b808d6 ******/
		%feature("compactdefaultargs") Mirrored;
		%feature("autodoc", "
Parameters
----------
theV: gp_Dir2d

Return
-------
gp_Dir2d

Description
-----------
Performs the symmetrical transformation of a direction with respect to the direction theV which is the center of the symmetry.
") Mirrored;
		gp_Dir2d Mirrored(const gp_Dir2d & theV);

		/****** gp_Dir2d::Mirrored ******/
		/****** md5 signature: 6c6db00c23080d0dd02950c83c534948 ******/
		%feature("compactdefaultargs") Mirrored;
		%feature("autodoc", "
Parameters
----------
theA: gp_Ax2d

Return
-------
gp_Dir2d

Description
-----------
Performs the symmetrical transformation of a direction with respect to an axis placement which is the axis of the symmetry.
") Mirrored;
		gp_Dir2d Mirrored(const gp_Ax2d & theA);

		/****** gp_Dir2d::Reverse ******/
		/****** md5 signature: 229f8663d04c43240c56ed238a384b26 ******/
		%feature("compactdefaultargs") Reverse;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Reverse;
		void Reverse();

		/****** gp_Dir2d::Reversed ******/
		/****** md5 signature: 0273fc2b8aeea181cf61837c87e6dc06 ******/
		%feature("compactdefaultargs") Reversed;
		%feature("autodoc", "Return
-------
gp_Dir2d

Description
-----------
Reverses the orientation of a direction.
") Reversed;
		gp_Dir2d Reversed();

		/****** gp_Dir2d::Rotate ******/
		/****** md5 signature: 6d787bcac0d49537cae153c0888a2fc0 ******/
		%feature("compactdefaultargs") Rotate;
		%feature("autodoc", "
Parameters
----------
Ang: double

Return
-------
None

Description
-----------
No available documentation.
") Rotate;
		void Rotate(const double Ang);

		/****** gp_Dir2d::Rotated ******/
		/****** md5 signature: b2bc014b463bcfa6fb5f845c2833fe54 ******/
		%feature("compactdefaultargs") Rotated;
		%feature("autodoc", "
Parameters
----------
theAng: double

Return
-------
gp_Dir2d

Description
-----------
Rotates a direction. theAng is the angular value of the rotation in radians.
") Rotated;
		gp_Dir2d Rotated(const double theAng);

		/****** gp_Dir2d::SetCoord ******/
		/****** md5 signature: 7ed8eb841ea14600f4040c04c51b09bd ******/
		%feature("compactdefaultargs") SetCoord;
		%feature("autodoc", "
Parameters
----------
theIndex: int
theXi: double

Return
-------
None

Description
-----------
For this unit vector, assigns: the value theXi to: - the X coordinate if theIndex is 1, or - the Y coordinate if theIndex is 2, and then normalizes it. Warning Remember that all the coordinates of a unit vector are implicitly modified when any single one is changed directly. Exceptions Standard_OutOfRange if theIndex is not 1 or 2. Standard_ConstructionError if either of the following is less than or equal to gp::Resolution(): - std::sqrt(theXv*theXv + theYv*theYv), or - the modulus of the number pair formed by the new value theXi and the other coordinate of this vector that was not directly modified. Raises OutOfRange if theIndex != {1, 2}. @note Constexpr-compatible when result is already normalized.
") SetCoord;
		void SetCoord(const int theIndex, const double theXi);

		/****** gp_Dir2d::SetCoord ******/
		/****** md5 signature: 6febb7559e7a7147d81e8b0e679423e1 ******/
		%feature("compactdefaultargs") SetCoord;
		%feature("autodoc", "
Parameters
----------
theXv: double
theYv: double

Return
-------
None

Description
-----------
For this unit vector, assigns: - the values theXv and theYv to its two coordinates, Warning Remember that all the coordinates of a unit vector are implicitly modified when any single one is changed directly. Exceptions Standard_OutOfRange if theIndex is not 1 or 2. Standard_ConstructionError if either of the following is less than or equal to gp::Resolution(): - std::sqrt(theXv*theXv + theYv*theYv), or - the modulus of the number pair formed by the new value Xi and the other coordinate of this vector that was not directly modified. Raises OutOfRange if theIndex != {1, 2}. @note Constexpr-compatible when input is already normalized.
") SetCoord;
		void SetCoord(const double theXv, const double theYv);

		/****** gp_Dir2d::SetX ******/
		/****** md5 signature: ef73cff52bf34cd295327d9e5a810cd3 ******/
		%feature("compactdefaultargs") SetX;
		%feature("autodoc", "
Parameters
----------
theX: double

Return
-------
None

Description
-----------
Assigns the given value to the X coordinate of this unit vector, and then normalizes it. Warning Remember that all the coordinates of a unit vector are implicitly modified when any single one is changed directly. Exceptions Standard_ConstructionError if either of the following is less than or equal to gp::Resolution(): - the modulus of Coord, or - the modulus of the number pair formed from the new X or Y coordinate and the other coordinate of this vector that was not directly modified. @note Constexpr-compatible when result is already normalized.
") SetX;
		void SetX(const double theX);

		/****** gp_Dir2d::SetXY ******/
		/****** md5 signature: 6394625985061fced4f3c67aeefd493c ******/
		%feature("compactdefaultargs") SetXY;
		%feature("autodoc", "
Parameters
----------
theCoord: gp_XY

Return
-------
None

Description
-----------
Assigns: - the two coordinates of theCoord to this unit vector, and then normalizes it. Warning Remember that all the coordinates of a unit vector are implicitly modified when any single one is changed directly. Exceptions Standard_ConstructionError if either of the following is less than or equal to gp::Resolution(): - the modulus of theCoord, or - the modulus of the number pair formed from the new X or Y coordinate and the other coordinate of this vector that was not directly modified. @note Constexpr-compatible when input is already normalized.
") SetXY;
		void SetXY(const gp_XY & theCoord);

		/****** gp_Dir2d::SetY ******/
		/****** md5 signature: 58e4c5f5bbcaf8cdd12f97ce9cbec17b ******/
		%feature("compactdefaultargs") SetY;
		%feature("autodoc", "
Parameters
----------
theY: double

Return
-------
None

Description
-----------
Assigns the given value to the Y coordinate of this unit vector, and then normalizes it. Warning Remember that all the coordinates of a unit vector are implicitly modified when any single one is changed directly. Exceptions Standard_ConstructionError if either of the following is less than or equal to gp::Resolution(): - the modulus of Coord, or - the modulus of the number pair formed from the new X or Y coordinate and the other coordinate of this vector that was not directly modified. @note Constexpr-compatible when result is already normalized.
") SetY;
		void SetY(const double theY);

		/****** gp_Dir2d::Transform ******/
		/****** md5 signature: 3afd1642fe7b497a7dbcbc3902ad7fa7 ******/
		%feature("compactdefaultargs") Transform;
		%feature("autodoc", "
Parameters
----------
theT: gp_Trsf2d

Return
-------
None

Description
-----------
No available documentation.
") Transform;
		void Transform(const gp_Trsf2d & theT);

		/****** gp_Dir2d::Transformed ******/
		/****** md5 signature: b7935945b3d8e1941fdf3aa2d19c19fd ******/
		%feature("compactdefaultargs") Transformed;
		%feature("autodoc", "
Parameters
----------
theT: gp_Trsf2d

Return
-------
gp_Dir2d

Description
-----------
Transforms a direction with the 'Trsf' theT. Warnings: If the scale factor of the 'Trsf' theT is negative then the direction <self> is reversed.
") Transformed;
		gp_Dir2d Transformed(const gp_Trsf2d & theT);

		/****** gp_Dir2d::X ******/
		/****** md5 signature: c418db3e494968281737cca9c90ecbdf ******/
		%feature("compactdefaultargs") X;
		%feature("autodoc", "Return
-------
double

Description
-----------
For this unit vector, returns its X coordinate.
") X;
		double X();

		/****** gp_Dir2d::XY ******/
		/****** md5 signature: 370a020741cd39a80c497bd378673a3a ******/
		%feature("compactdefaultargs") XY;
		%feature("autodoc", "Return
-------
gp_XY

Description
-----------
For this unit vector, returns its two coordinates as a number pair. Comparison between Directions The precision value is an input data.
") XY;
		const gp_XY XY();

		/****** gp_Dir2d::Y ******/
		/****** md5 signature: 25eefb608c358bc135b3158209ee8901 ******/
		%feature("compactdefaultargs") Y;
		%feature("autodoc", "Return
-------
double

Description
-----------
For this unit vector, returns its Y coordinate.
") Y;
		double Y();

		/****** gp_Dir2d::operator * ******/
		/****** md5 signature: 90d86df039aa4aa86be6cef6d0f26b23 ******/
		%feature("compactdefaultargs") operator *;
		%feature("autodoc", "
Parameters
----------
theOther: gp_Dir2d

Return
-------
double

Description
-----------
No available documentation.
") operator *;
		double operator *(const gp_Dir2d & theOther);

		/****** gp_Dir2d::operator - ******/
		/****** md5 signature: e30a084d218016a2edf760cb11dad30d ******/
		%feature("compactdefaultargs") operator -;
		%feature("autodoc", "Return
-------
gp_Dir2d

Description
-----------
No available documentation.
") operator -;
		gp_Dir2d operator -();

};



%extend gp_Dir2d {
%pythoncode {
    def __getstate__(self):
        return self.DumpJson()
    }
};

%extend gp_Dir2d {
%pythoncode {
    def __setstate__(self, state):
        inst = gp_Dir2d()
        if inst.InitFromJson(state):
            self.this = inst.this
        else:
            raise IOError('Failed to set state of gp_Dir2d')
    }
};
%extend gp_Dir2d {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************
* class gp_Elips *
*****************/
class gp_Elips {
	public:
		/****** gp_Elips::gp_Elips ******/
		/****** md5 signature: 413308be3ad0fb346d1d421aa7981652 ******/
		%feature("compactdefaultargs") gp_Elips;
		%feature("autodoc", "Return
-------
None

Description
-----------
Creates an indefinite ellipse.
") gp_Elips;
		 gp_Elips();

		/****** gp_Elips::gp_Elips ******/
		/****** md5 signature: 0048763de4863abd7aae2eba3ad8a362 ******/
		%feature("compactdefaultargs") gp_Elips;
		%feature("autodoc", "
Parameters
----------
theA2: gp_Ax2
theMajorRadius: double
theMinorRadius: double

Return
-------
None

Description
-----------
The major radius of the ellipse is on the 'XAxis' and the minor radius is on the 'YAxis' of the ellipse. The 'XAxis' is defined with the 'XDirection' of theA2 and the 'YAxis' is defined with the 'YDirection' of theA2. Warnings: It is not forbidden to create an ellipse with theMajorRadius = theMinorRadius. Raises ConstructionError if theMajorRadius < theMinorRadius or theMinorRadius < 0.
") gp_Elips;
		 gp_Elips(const gp_Ax2 & theA2, const double theMajorRadius, const double theMinorRadius);

		/****** gp_Elips::Area ******/
		/****** md5 signature: a088fd3ed75aeafb3fa8330998cab53d ******/
		%feature("compactdefaultargs") Area;
		%feature("autodoc", "Return
-------
double

Description
-----------
Computes the area of the Ellipse.
") Area;
		double Area();

		/****** gp_Elips::Axis ******/
		/****** md5 signature: 92df3aa78c9ee700462ef461d4ed4603 ******/
		%feature("compactdefaultargs") Axis;
		%feature("autodoc", "Return
-------
gp_Ax1

Description
-----------
Computes the axis normal to the plane of the ellipse.
") Axis;
		const gp_Ax1 Axis();

		/****** gp_Elips::Directrix1 ******/
		/****** md5 signature: 10272c6052549861204070aa44f046a5 ******/
		%feature("compactdefaultargs") Directrix1;
		%feature("autodoc", "Return
-------
gp_Ax1

Description
-----------
Computes the first or second directrix of this ellipse. These are the lines, in the plane of the ellipse, normal to the major axis, at a distance equal to MajorRadius/e from the center of the ellipse, where e is the eccentricity of the ellipse. The first directrix (Directrix1) is on the positive side of the major axis. The second directrix (Directrix2) is on the negative side. The directrix is returned as an axis (gp_Ax1 object), the origin of which is situated on the 'X Axis' of the local coordinate system of this ellipse. Exceptions Standard_ConstructionError if the eccentricity is null (the ellipse has degenerated into a circle).
") Directrix1;
		gp_Ax1 Directrix1();

		/****** gp_Elips::Directrix2 ******/
		/****** md5 signature: 88339a214155f2a41d76691fd00c9167 ******/
		%feature("compactdefaultargs") Directrix2;
		%feature("autodoc", "Return
-------
gp_Ax1

Description
-----------
This line is obtained by the symmetrical transformation of 'Directrix1' with respect to the 'YAxis' of the ellipse. Exceptions Standard_ConstructionError if the eccentricity is null (the ellipse has degenerated into a circle).
") Directrix2;
		gp_Ax1 Directrix2();

		/****** gp_Elips::Eccentricity ******/
		/****** md5 signature: 9f90e42dbefc9ae0bf29952afeb8e7eb ******/
		%feature("compactdefaultargs") Eccentricity;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns the eccentricity of the ellipse between 0.0 and 1.0 If f is the distance between the center of the ellipse and the Focus1 then the eccentricity e = f / MajorRadius. Raises ConstructionError if MajorRadius = 0.0.
") Eccentricity;
		double Eccentricity();

		/****** gp_Elips::Focal ******/
		/****** md5 signature: fc6d17adae4ec395e74f6a74f1f05838 ******/
		%feature("compactdefaultargs") Focal;
		%feature("autodoc", "Return
-------
double

Description
-----------
Computes the focal distance. It is the distance between the two focus focus1 and focus2 of the ellipse.
") Focal;
		double Focal();

		/****** gp_Elips::Focus1 ******/
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

		/****** gp_Elips::Focus2 ******/
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

		/****** gp_Elips::Location ******/
		/****** md5 signature: 2c3e536bdb11b2c2c46fc19fd8a6c569 ******/
		%feature("compactdefaultargs") Location;
		%feature("autodoc", "Return
-------
gp_Pnt

Description
-----------
Returns the center of the ellipse. It is the 'Location' point of the coordinate system of the ellipse.
") Location;
		const gp_Pnt Location();

		/****** gp_Elips::MajorRadius ******/
		/****** md5 signature: f3c8e84cfab3df86862664576afed07f ******/
		%feature("compactdefaultargs") MajorRadius;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns the major radius of the ellipse.
") MajorRadius;
		double MajorRadius();

		/****** gp_Elips::MinorRadius ******/
		/****** md5 signature: 2cdcbbe9dc623324c534b7df914ad3c3 ******/
		%feature("compactdefaultargs") MinorRadius;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns the minor radius of the ellipse.
") MinorRadius;
		double MinorRadius();

		/****** gp_Elips::Mirror ******/
		/****** md5 signature: 0f424be72f12474fe3ff290168029c4e ******/
		%feature("compactdefaultargs") Mirror;
		%feature("autodoc", "
Parameters
----------
theP: gp_Pnt

Return
-------
None

Description
-----------
No available documentation.
") Mirror;
		void Mirror(const gp_Pnt & theP);

		/****** gp_Elips::Mirror ******/
		/****** md5 signature: cfb16cae08525c5f4ab330102e0377d4 ******/
		%feature("compactdefaultargs") Mirror;
		%feature("autodoc", "
Parameters
----------
theA1: gp_Ax1

Return
-------
None

Description
-----------
No available documentation.
") Mirror;
		void Mirror(const gp_Ax1 & theA1);

		/****** gp_Elips::Mirror ******/
		/****** md5 signature: ad34943401a2334beed8ccc79094d8df ******/
		%feature("compactdefaultargs") Mirror;
		%feature("autodoc", "
Parameters
----------
theA2: gp_Ax2

Return
-------
None

Description
-----------
No available documentation.
") Mirror;
		void Mirror(const gp_Ax2 & theA2);

		/****** gp_Elips::Mirrored ******/
		/****** md5 signature: 734cb5dee4ce8755ba8419c4733f551b ******/
		%feature("compactdefaultargs") Mirrored;
		%feature("autodoc", "
Parameters
----------
theP: gp_Pnt

Return
-------
gp_Elips

Description
-----------
Performs the symmetrical transformation of an ellipse with respect to the point theP which is the center of the symmetry.
") Mirrored;
		gp_Elips Mirrored(const gp_Pnt & theP);

		/****** gp_Elips::Mirrored ******/
		/****** md5 signature: 7836cabf078d820a4b5e8716338e620d ******/
		%feature("compactdefaultargs") Mirrored;
		%feature("autodoc", "
Parameters
----------
theA1: gp_Ax1

Return
-------
gp_Elips

Description
-----------
Performs the symmetrical transformation of an ellipse with respect to an axis placement which is the axis of the symmetry.
") Mirrored;
		gp_Elips Mirrored(const gp_Ax1 & theA1);

		/****** gp_Elips::Mirrored ******/
		/****** md5 signature: 70283daeaf7c826589fd28e3e212fd26 ******/
		%feature("compactdefaultargs") Mirrored;
		%feature("autodoc", "
Parameters
----------
theA2: gp_Ax2

Return
-------
gp_Elips

Description
-----------
Performs the symmetrical transformation of an ellipse with respect to a plane. The axis placement theA2 locates the plane of the symmetry (Location, XDirection, YDirection).
") Mirrored;
		gp_Elips Mirrored(const gp_Ax2 & theA2);

		/****** gp_Elips::Parameter ******/
		/****** md5 signature: 28e42519a120bf741c23eca7aaca5525 ******/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns p = (1 - e * e) * MajorRadius where e is the eccentricity of the ellipse. Returns 0 if MajorRadius = 0.
") Parameter;
		double Parameter();

		/****** gp_Elips::Position ******/
		/****** md5 signature: 57187ff46d597fddf97672bf3cca7377 ******/
		%feature("compactdefaultargs") Position;
		%feature("autodoc", "Return
-------
gp_Ax2

Description
-----------
Returns the coordinate system of the ellipse.
") Position;
		const gp_Ax2 Position();

		/****** gp_Elips::Rotate ******/
		/****** md5 signature: 652dfbf621c2c092ff5b68d608de4634 ******/
		%feature("compactdefaultargs") Rotate;
		%feature("autodoc", "
Parameters
----------
theA1: gp_Ax1
theAng: double

Return
-------
None

Description
-----------
No available documentation.
") Rotate;
		void Rotate(const gp_Ax1 & theA1, const double theAng);

		/****** gp_Elips::Rotated ******/
		/****** md5 signature: bfe28c58deab895a39b95a9040a0a99f ******/
		%feature("compactdefaultargs") Rotated;
		%feature("autodoc", "
Parameters
----------
theA1: gp_Ax1
theAng: double

Return
-------
gp_Elips

Description
-----------
Rotates an ellipse. theA1 is the axis of the rotation. theAng is the angular value of the rotation in radians.
") Rotated;
		gp_Elips Rotated(const gp_Ax1 & theA1, const double theAng);

		/****** gp_Elips::Scale ******/
		/****** md5 signature: a03901fe94facbb26121cd37d5814f81 ******/
		%feature("compactdefaultargs") Scale;
		%feature("autodoc", "
Parameters
----------
theP: gp_Pnt
theS: double

Return
-------
None

Description
-----------
No available documentation.
") Scale;
		void Scale(const gp_Pnt & theP, const double theS);

		/****** gp_Elips::Scaled ******/
		/****** md5 signature: 6143f83728c082c97d8a616fee3f1c26 ******/
		%feature("compactdefaultargs") Scaled;
		%feature("autodoc", "
Parameters
----------
theP: gp_Pnt
theS: double

Return
-------
gp_Elips

Description
-----------
Scales an ellipse. theS is the scaling value.
") Scaled;
		gp_Elips Scaled(const gp_Pnt & theP, const double theS);

		/****** gp_Elips::SetAxis ******/
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
Changes the axis normal to the plane of the ellipse. It modifies the definition of this plane. The 'XAxis' and the 'YAxis' are recomputed. The local coordinate system is redefined so that: - its origin and 'main Direction' become those of the axis theA1 (the 'X Direction' and 'Y Direction' are then recomputed in the same way as for any gp_Ax2), or Raises ConstructionError if the direction of theA1 is parallel to the direction of the 'XAxis' of the ellipse.
") SetAxis;
		void SetAxis(const gp_Ax1 & theA1);

		/****** gp_Elips::SetLocation ******/
		/****** md5 signature: cdddcf5cbfcb37a25a0fad06f827f527 ******/
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
Modifies this ellipse, by redefining its local coordinate so that its origin becomes theP.
") SetLocation;
		void SetLocation(const gp_Pnt & theP);

		/****** gp_Elips::SetMajorRadius ******/
		/****** md5 signature: 5eff03578088313d850e2a4c6dac1d86 ******/
		%feature("compactdefaultargs") SetMajorRadius;
		%feature("autodoc", "
Parameters
----------
theMajorRadius: double

Return
-------
None

Description
-----------
The major radius of the ellipse is on the 'XAxis' (major axis) of the ellipse. Raises ConstructionError if theMajorRadius < MinorRadius.
") SetMajorRadius;
		void SetMajorRadius(const double theMajorRadius);

		/****** gp_Elips::SetMinorRadius ******/
		/****** md5 signature: dfefc317649a676db76eca5eab95531a ******/
		%feature("compactdefaultargs") SetMinorRadius;
		%feature("autodoc", "
Parameters
----------
theMinorRadius: double

Return
-------
None

Description
-----------
The minor radius of the ellipse is on the 'YAxis' (minor axis) of the ellipse. Raises ConstructionError if theMinorRadius > MajorRadius or MinorRadius < 0.
") SetMinorRadius;
		void SetMinorRadius(const double theMinorRadius);

		/****** gp_Elips::SetPosition ******/
		/****** md5 signature: 73d3a6a70843b70b52fc8f3fa07a25a7 ******/
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
Modifies this ellipse, by redefining its local coordinate so that it becomes theA2.
") SetPosition;
		void SetPosition(const gp_Ax2 & theA2);

		/****** gp_Elips::Transform ******/
		/****** md5 signature: 0737a7286be728220e1a55ba0d6eafc3 ******/
		%feature("compactdefaultargs") Transform;
		%feature("autodoc", "
Parameters
----------
theT: gp_Trsf

Return
-------
None

Description
-----------
No available documentation.
") Transform;
		void Transform(const gp_Trsf & theT);

		/****** gp_Elips::Transformed ******/
		/****** md5 signature: 7ef491940db1b91e1d267dca992ce77e ******/
		%feature("compactdefaultargs") Transformed;
		%feature("autodoc", "
Parameters
----------
theT: gp_Trsf

Return
-------
gp_Elips

Description
-----------
Transforms an ellipse with the transformation theT from class Trsf.
") Transformed;
		gp_Elips Transformed(const gp_Trsf & theT);

		/****** gp_Elips::Translate ******/
		/****** md5 signature: 8ae07d4c829c1eef2e7708ef5390638b ******/
		%feature("compactdefaultargs") Translate;
		%feature("autodoc", "
Parameters
----------
theV: gp_Vec

Return
-------
None

Description
-----------
No available documentation.
") Translate;
		void Translate(const gp_Vec & theV);

		/****** gp_Elips::Translate ******/
		/****** md5 signature: 279c13d6194eb867625753d756d110ab ******/
		%feature("compactdefaultargs") Translate;
		%feature("autodoc", "
Parameters
----------
theP1: gp_Pnt
theP2: gp_Pnt

Return
-------
None

Description
-----------
No available documentation.
") Translate;
		void Translate(const gp_Pnt & theP1, const gp_Pnt & theP2);

		/****** gp_Elips::Translated ******/
		/****** md5 signature: d85d554a98af8b7daddffe6f8bceb27f ******/
		%feature("compactdefaultargs") Translated;
		%feature("autodoc", "
Parameters
----------
theV: gp_Vec

Return
-------
gp_Elips

Description
-----------
Translates an ellipse in the direction of the vector theV. The magnitude of the translation is the vector's magnitude.
") Translated;
		gp_Elips Translated(const gp_Vec & theV);

		/****** gp_Elips::Translated ******/
		/****** md5 signature: 89c528a4fc40f5d41d4ffbbb420bafe4 ******/
		%feature("compactdefaultargs") Translated;
		%feature("autodoc", "
Parameters
----------
theP1: gp_Pnt
theP2: gp_Pnt

Return
-------
gp_Elips

Description
-----------
Translates an ellipse from the point theP1 to the point theP2.
") Translated;
		gp_Elips Translated(const gp_Pnt & theP1, const gp_Pnt & theP2);

		/****** gp_Elips::XAxis ******/
		/****** md5 signature: 37d8185a57a29bf9b7aa10d76b1229a2 ******/
		%feature("compactdefaultargs") XAxis;
		%feature("autodoc", "Return
-------
gp_Ax1

Description
-----------
Returns the 'XAxis' of the ellipse whose origin is the center of this ellipse. It is the major axis of the ellipse.
") XAxis;
		gp_Ax1 XAxis();

		/****** gp_Elips::YAxis ******/
		/****** md5 signature: 78f0cb55c98fbe890a49b3158d9f5039 ******/
		%feature("compactdefaultargs") YAxis;
		%feature("autodoc", "Return
-------
gp_Ax1

Description
-----------
Returns the 'YAxis' of the ellipse whose unit vector is the 'X Direction' or the 'Y Direction' of the local coordinate system of this ellipse. This is the minor axis of the ellipse.
") YAxis;
		gp_Ax1 YAxis();

};



%extend gp_Elips {
%pythoncode {
    def __getstate__(self):
        return self.DumpJson()
    }
};

%extend gp_Elips {
%pythoncode {
    def __setstate__(self, state):
        inst = gp_Elips()
        if inst.InitFromJson(state):
            self.this = inst.this
        else:
            raise IOError('Failed to set state of gp_Elips')
    }
};
%extend gp_Elips {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************
* class gp_Elips2d *
*******************/
class gp_Elips2d {
	public:
		/****** gp_Elips2d::gp_Elips2d ******/
		/****** md5 signature: abfe167add46edb7959c8995ffb960c3 ******/
		%feature("compactdefaultargs") gp_Elips2d;
		%feature("autodoc", "Return
-------
None

Description
-----------
Creates an indefinite ellipse.
") gp_Elips2d;
		 gp_Elips2d();

		/****** gp_Elips2d::gp_Elips2d ******/
		/****** md5 signature: f6d48be3be62d041fcbc2d1be3f4e239 ******/
		%feature("compactdefaultargs") gp_Elips2d;
		%feature("autodoc", "
Parameters
----------
theMajorAxis: gp_Ax2d
theMajorRadius: double
theMinorRadius: double
theIsSense: bool (optional, default to true)

Return
-------
None

Description
-----------
Creates an ellipse with the major axis, the major and the minor radius. The location of the theMajorAxis is the center of the ellipse. The sense of parametrization is given by theIsSense. Warnings: It is possible to create an ellipse with theMajorRadius = theMinorRadius. Raises ConstructionError if theMajorRadius < theMinorRadius or theMinorRadius < 0.0.
") gp_Elips2d;
		 gp_Elips2d(const gp_Ax2d & theMajorAxis, const double theMajorRadius, const double theMinorRadius, const bool theIsSense = true);

		/****** gp_Elips2d::gp_Elips2d ******/
		/****** md5 signature: 2ac2af364d81d861eb2b348a7b93dc60 ******/
		%feature("compactdefaultargs") gp_Elips2d;
		%feature("autodoc", "
Parameters
----------
theA: gp_Ax22d
theMajorRadius: double
theMinorRadius: double

Return
-------
None

Description
-----------
Creates an ellipse with radii MajorRadius and MinorRadius, positioned in the plane by coordinate system theA where: - the origin of theA is the center of the ellipse, - the 'X Direction' of theA defines the major axis of the ellipse, that is, the major radius MajorRadius is measured along this axis, and - the 'Y Direction' of theA defines the minor axis of the ellipse, that is, the minor radius theMinorRadius is measured along this axis, and - the orientation (direct or indirect sense) of theA gives the orientation of the ellipse. Warnings: It is possible to create an ellipse with theMajorRadius = theMinorRadius. Raises ConstructionError if theMajorRadius < theMinorRadius or theMinorRadius < 0.0.
") gp_Elips2d;
		 gp_Elips2d(const gp_Ax22d & theA, const double theMajorRadius, const double theMinorRadius);

		/****** gp_Elips2d::Area ******/
		/****** md5 signature: a088fd3ed75aeafb3fa8330998cab53d ******/
		%feature("compactdefaultargs") Area;
		%feature("autodoc", "Return
-------
double

Description
-----------
Computes the area of the ellipse.
") Area;
		double Area();

		/****** gp_Elips2d::Axis ******/
		/****** md5 signature: e16486dd6873b7754da4b441ae82cea8 ******/
		%feature("compactdefaultargs") Axis;
		%feature("autodoc", "Return
-------
gp_Ax22d

Description
-----------
Returns the major axis of the ellipse.
") Axis;
		const gp_Ax22d Axis();

		/****** gp_Elips2d::Coefficients ******/
		/****** md5 signature: 05758c67cba8d099d67a3b8db74c835a ******/
		%feature("compactdefaultargs") Coefficients;
		%feature("autodoc", "
Parameters
----------

Return
-------
theA: double
theB: double
theC: double
theD: double
theE: double
theF: double

Description
-----------
Returns the coefficients of the implicit equation of the ellipse. theA * (X**2) + theB * (Y**2) + 2*theC*(X*Y) + 2*theD*X + 2*theE*Y + theF = 0.
") Coefficients;
		void Coefficients(Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** gp_Elips2d::Directrix1 ******/
		/****** md5 signature: fcbef2c85b670a856d4882ec13ce9c6f ******/
		%feature("compactdefaultargs") Directrix1;
		%feature("autodoc", "Return
-------
gp_Ax2d

Description
-----------
This directrix is the line normal to the XAxis of the ellipse in the local plane (Z = 0) at a distance d = MajorRadius / e from the center of the ellipse, where e is the eccentricity of the ellipse. This line is parallel to the 'YAxis'. The intersection point between directrix1 and the 'XAxis' is the location point of the directrix1. This point is on the positive side of the 'XAxis'. //! Raised if Eccentricity = 0.0. (The ellipse degenerates into a circle).
") Directrix1;
		gp_Ax2d Directrix1();

		/****** gp_Elips2d::Directrix2 ******/
		/****** md5 signature: 6932241de7dde0eb204208e30fe6363c ******/
		%feature("compactdefaultargs") Directrix2;
		%feature("autodoc", "Return
-------
gp_Ax2d

Description
-----------
This line is obtained by the symmetrical transformation of 'Directrix1' with respect to the minor axis of the ellipse. //! Raised if Eccentricity = 0.0. (The ellipse degenerates into a circle).
") Directrix2;
		gp_Ax2d Directrix2();

		/****** gp_Elips2d::Eccentricity ******/
		/****** md5 signature: 9f90e42dbefc9ae0bf29952afeb8e7eb ******/
		%feature("compactdefaultargs") Eccentricity;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns the eccentricity of the ellipse between 0.0 and 1.0 If f is the distance between the center of the ellipse and the Focus1 then the eccentricity e = f / MajorRadius. Returns 0 if MajorRadius = 0.
") Eccentricity;
		double Eccentricity();

		/****** gp_Elips2d::Focal ******/
		/****** md5 signature: fc6d17adae4ec395e74f6a74f1f05838 ******/
		%feature("compactdefaultargs") Focal;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns the distance between the center of the ellipse and focus1 or focus2.
") Focal;
		double Focal();

		/****** gp_Elips2d::Focus1 ******/
		/****** md5 signature: dccbe483b29092eb91431c64e1c5bcd9 ******/
		%feature("compactdefaultargs") Focus1;
		%feature("autodoc", "Return
-------
gp_Pnt2d

Description
-----------
Returns the first focus of the ellipse. This focus is on the positive side of the major axis of the ellipse.
") Focus1;
		gp_Pnt2d Focus1();

		/****** gp_Elips2d::Focus2 ******/
		/****** md5 signature: ca24694273a9069fddac1db8a37c6c68 ******/
		%feature("compactdefaultargs") Focus2;
		%feature("autodoc", "Return
-------
gp_Pnt2d

Description
-----------
Returns the second focus of the ellipse. This focus is on the negative side of the major axis of the ellipse.
") Focus2;
		gp_Pnt2d Focus2();

		/****** gp_Elips2d::IsDirect ******/
		/****** md5 signature: b020e2b79b290dfefeeb15e69cd69d05 ******/
		%feature("compactdefaultargs") IsDirect;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if the local coordinate system is direct and false in the other case.
") IsDirect;
		bool IsDirect();

		/****** gp_Elips2d::Location ******/
		/****** md5 signature: 61a7e489acd8b8c2b8c75b6b63b63221 ******/
		%feature("compactdefaultargs") Location;
		%feature("autodoc", "Return
-------
gp_Pnt2d

Description
-----------
Returns the center of the ellipse.
") Location;
		const gp_Pnt2d Location();

		/****** gp_Elips2d::MajorRadius ******/
		/****** md5 signature: f3c8e84cfab3df86862664576afed07f ******/
		%feature("compactdefaultargs") MajorRadius;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns the major radius of the Ellipse.
") MajorRadius;
		double MajorRadius();

		/****** gp_Elips2d::MinorRadius ******/
		/****** md5 signature: 2cdcbbe9dc623324c534b7df914ad3c3 ******/
		%feature("compactdefaultargs") MinorRadius;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns the minor radius of the Ellipse.
") MinorRadius;
		double MinorRadius();

		/****** gp_Elips2d::Mirror ******/
		/****** md5 signature: 55ca8745c822fce8b8395ef5348dd658 ******/
		%feature("compactdefaultargs") Mirror;
		%feature("autodoc", "
Parameters
----------
theP: gp_Pnt2d

Return
-------
None

Description
-----------
No available documentation.
") Mirror;
		void Mirror(const gp_Pnt2d & theP);

		/****** gp_Elips2d::Mirror ******/
		/****** md5 signature: c8b01b19fc436ab187f95301941edbc1 ******/
		%feature("compactdefaultargs") Mirror;
		%feature("autodoc", "
Parameters
----------
theA: gp_Ax2d

Return
-------
None

Description
-----------
No available documentation.
") Mirror;
		void Mirror(const gp_Ax2d & theA);

		/****** gp_Elips2d::Mirrored ******/
		/****** md5 signature: 3f47d6f30640b8be29ae4389ae06cd67 ******/
		%feature("compactdefaultargs") Mirrored;
		%feature("autodoc", "
Parameters
----------
theP: gp_Pnt2d

Return
-------
gp_Elips2d

Description
-----------
Performs the symmetrical transformation of a ellipse with respect to the point theP which is the center of the symmetry.
") Mirrored;
		gp_Elips2d Mirrored(const gp_Pnt2d & theP);

		/****** gp_Elips2d::Mirrored ******/
		/****** md5 signature: 0982af08a6498c22d35cc3b4c04fa320 ******/
		%feature("compactdefaultargs") Mirrored;
		%feature("autodoc", "
Parameters
----------
theA: gp_Ax2d

Return
-------
gp_Elips2d

Description
-----------
Performs the symmetrical transformation of a ellipse with respect to an axis placement which is the axis of the symmetry.
") Mirrored;
		gp_Elips2d Mirrored(const gp_Ax2d & theA);

		/****** gp_Elips2d::Parameter ******/
		/****** md5 signature: 33aca5f15f138f4a5278e9dcf9d9a205 ******/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns p = (1 - e * e) * MajorRadius where e is the eccentricity of the ellipse. Returns 0 if MajorRadius = 0.
") Parameter;
		double Parameter();

		/****** gp_Elips2d::Reverse ******/
		/****** md5 signature: a3a97cdcd6acb50dcac8455358723872 ******/
		%feature("compactdefaultargs") Reverse;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Reverse;
		void Reverse();

		/****** gp_Elips2d::Reversed ******/
		/****** md5 signature: 4e15cc96eeac3f5d8d6b7fc3e7089375 ******/
		%feature("compactdefaultargs") Reversed;
		%feature("autodoc", "Return
-------
gp_Elips2d

Description
-----------
No available documentation.
") Reversed;
		gp_Elips2d Reversed();

		/****** gp_Elips2d::Rotate ******/
		/****** md5 signature: 084595cbfff710f953ac0ae91d732bf0 ******/
		%feature("compactdefaultargs") Rotate;
		%feature("autodoc", "
Parameters
----------
theP: gp_Pnt2d
theAng: double

Return
-------
None

Description
-----------
No available documentation.
") Rotate;
		void Rotate(const gp_Pnt2d & theP, const double theAng);

		/****** gp_Elips2d::Rotated ******/
		/****** md5 signature: 7724d3ba8ab09ecb627f42a92df500e5 ******/
		%feature("compactdefaultargs") Rotated;
		%feature("autodoc", "
Parameters
----------
theP: gp_Pnt2d
theAng: double

Return
-------
gp_Elips2d

Description
-----------
No available documentation.
") Rotated;
		gp_Elips2d Rotated(const gp_Pnt2d & theP, const double theAng);

		/****** gp_Elips2d::Scale ******/
		/****** md5 signature: ce786424d6b372a402b20bab4c859bd5 ******/
		%feature("compactdefaultargs") Scale;
		%feature("autodoc", "
Parameters
----------
theP: gp_Pnt2d
theS: double

Return
-------
None

Description
-----------
No available documentation.
") Scale;
		void Scale(const gp_Pnt2d & theP, const double theS);

		/****** gp_Elips2d::Scaled ******/
		/****** md5 signature: 32f7f7da39b023e122eb93d4ac88ffc5 ******/
		%feature("compactdefaultargs") Scaled;
		%feature("autodoc", "
Parameters
----------
theP: gp_Pnt2d
theS: double

Return
-------
gp_Elips2d

Description
-----------
Scales a ellipse. theS is the scaling value.
") Scaled;
		gp_Elips2d Scaled(const gp_Pnt2d & theP, const double theS);

		/****** gp_Elips2d::SetAxis ******/
		/****** md5 signature: 5a80f392a0f25e50c7bd9a5c5fce8259 ******/
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
Modifies this ellipse, by redefining its local coordinate system so that it becomes theA.
") SetAxis;
		void SetAxis(const gp_Ax22d & theA);

		/****** gp_Elips2d::SetLocation ******/
		/****** md5 signature: 480b751d2165373d2617a13d19b91d48 ******/
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
Modifies this ellipse, by redefining its local coordinate system so that - its origin becomes theP.
") SetLocation;
		void SetLocation(const gp_Pnt2d & theP);

		/****** gp_Elips2d::SetMajorRadius ******/
		/****** md5 signature: 5eff03578088313d850e2a4c6dac1d86 ******/
		%feature("compactdefaultargs") SetMajorRadius;
		%feature("autodoc", "
Parameters
----------
theMajorRadius: double

Return
-------
None

Description
-----------
Changes the value of the major radius. Raises ConstructionError if theMajorRadius < MinorRadius.
") SetMajorRadius;
		void SetMajorRadius(const double theMajorRadius);

		/****** gp_Elips2d::SetMinorRadius ******/
		/****** md5 signature: dfefc317649a676db76eca5eab95531a ******/
		%feature("compactdefaultargs") SetMinorRadius;
		%feature("autodoc", "
Parameters
----------
theMinorRadius: double

Return
-------
None

Description
-----------
Changes the value of the minor radius. Raises ConstructionError if MajorRadius < theMinorRadius or MinorRadius < 0.0.
") SetMinorRadius;
		void SetMinorRadius(const double theMinorRadius);

		/****** gp_Elips2d::SetXAxis ******/
		/****** md5 signature: 0953d475cb538bb151666a237ed170af ******/
		%feature("compactdefaultargs") SetXAxis;
		%feature("autodoc", "
Parameters
----------
theA: gp_Ax2d

Return
-------
None

Description
-----------
Modifies this ellipse, by redefining its local coordinate system so that its origin and its 'X Direction' become those of the axis theA. The 'Y Direction' is then recomputed. The orientation of the local coordinate system is not modified.
") SetXAxis;
		void SetXAxis(const gp_Ax2d & theA);

		/****** gp_Elips2d::SetYAxis ******/
		/****** md5 signature: 18c66c982e1061a0c18175947bc7cbc8 ******/
		%feature("compactdefaultargs") SetYAxis;
		%feature("autodoc", "
Parameters
----------
theA: gp_Ax2d

Return
-------
None

Description
-----------
Modifies this ellipse, by redefining its local coordinate system so that its origin and its 'Y Direction' become those of the axis theA. The 'X Direction' is then recomputed. The orientation of the local coordinate system is not modified.
") SetYAxis;
		void SetYAxis(const gp_Ax2d & theA);

		/****** gp_Elips2d::Transform ******/
		/****** md5 signature: 94f8045e6a4465708e872ec10cb3f4d1 ******/
		%feature("compactdefaultargs") Transform;
		%feature("autodoc", "
Parameters
----------
theT: gp_Trsf2d

Return
-------
None

Description
-----------
No available documentation.
") Transform;
		void Transform(const gp_Trsf2d & theT);

		/****** gp_Elips2d::Transformed ******/
		/****** md5 signature: df82bc60f4eb101b33cd2eeff2197ace ******/
		%feature("compactdefaultargs") Transformed;
		%feature("autodoc", "
Parameters
----------
theT: gp_Trsf2d

Return
-------
gp_Elips2d

Description
-----------
Transforms an ellipse with the transformation theT from class Trsf2d.
") Transformed;
		gp_Elips2d Transformed(const gp_Trsf2d & theT);

		/****** gp_Elips2d::Translate ******/
		/****** md5 signature: db1336b52b0bf528c543a448adb435f1 ******/
		%feature("compactdefaultargs") Translate;
		%feature("autodoc", "
Parameters
----------
theV: gp_Vec2d

Return
-------
None

Description
-----------
No available documentation.
") Translate;
		void Translate(const gp_Vec2d & theV);

		/****** gp_Elips2d::Translate ******/
		/****** md5 signature: fbfb79b99757b462451a758b25d06d71 ******/
		%feature("compactdefaultargs") Translate;
		%feature("autodoc", "
Parameters
----------
theP1: gp_Pnt2d
theP2: gp_Pnt2d

Return
-------
None

Description
-----------
No available documentation.
") Translate;
		void Translate(const gp_Pnt2d & theP1, const gp_Pnt2d & theP2);

		/****** gp_Elips2d::Translated ******/
		/****** md5 signature: 62b617ee2d18a29f00e5169886ae3da0 ******/
		%feature("compactdefaultargs") Translated;
		%feature("autodoc", "
Parameters
----------
theV: gp_Vec2d

Return
-------
gp_Elips2d

Description
-----------
Translates a ellipse in the direction of the vector theV. The magnitude of the translation is the vector's magnitude.
") Translated;
		gp_Elips2d Translated(const gp_Vec2d & theV);

		/****** gp_Elips2d::Translated ******/
		/****** md5 signature: 726a40ef3f34b40906e82cee5e9d8a18 ******/
		%feature("compactdefaultargs") Translated;
		%feature("autodoc", "
Parameters
----------
theP1: gp_Pnt2d
theP2: gp_Pnt2d

Return
-------
gp_Elips2d

Description
-----------
Translates a ellipse from the point theP1 to the point theP2.
") Translated;
		gp_Elips2d Translated(const gp_Pnt2d & theP1, const gp_Pnt2d & theP2);

		/****** gp_Elips2d::XAxis ******/
		/****** md5 signature: 83955698d6369777f193b9652c25173b ******/
		%feature("compactdefaultargs") XAxis;
		%feature("autodoc", "Return
-------
gp_Ax2d

Description
-----------
Returns the major axis of the ellipse.
") XAxis;
		gp_Ax2d XAxis();

		/****** gp_Elips2d::YAxis ******/
		/****** md5 signature: a7022bd581881d0a6f0955733fa39838 ******/
		%feature("compactdefaultargs") YAxis;
		%feature("autodoc", "Return
-------
gp_Ax2d

Description
-----------
Returns the minor axis of the ellipse. Reverses the direction of the circle.
") YAxis;
		gp_Ax2d YAxis();

};



%extend gp_Elips2d {
%pythoncode {
    def __getstate__(self):
        return self.DumpJson()
    }
};

%extend gp_Elips2d {
%pythoncode {
    def __setstate__(self, state):
        inst = gp_Elips2d()
        if inst.InitFromJson(state):
            self.this = inst.this
        else:
            raise IOError('Failed to set state of gp_Elips2d')
    }
};
%extend gp_Elips2d {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************
* class gp_GTrsf *
*****************/
class gp_GTrsf {
	public:
		/****** gp_GTrsf::gp_GTrsf ******/
		/****** md5 signature: bf9eb1cf0f537e4aea99dec9c6a448d3 ******/
		%feature("compactdefaultargs") gp_GTrsf;
		%feature("autodoc", "Return
-------
None

Description
-----------
Returns the Identity transformation.
") gp_GTrsf;
		 gp_GTrsf();

		/****** gp_GTrsf::gp_GTrsf ******/
		/****** md5 signature: ae237a5e098c311e31a76c1158b07cf5 ******/
		%feature("compactdefaultargs") gp_GTrsf;
		%feature("autodoc", "
Parameters
----------
theT: gp_Trsf

Return
-------
None

Description
-----------
Converts the gp_Trsf transformation theT into a general transformation, i.e. Returns a GTrsf with the same matrix of coefficients as the Trsf theT.
") gp_GTrsf;
		 gp_GTrsf(const gp_Trsf & theT);

		/****** gp_GTrsf::gp_GTrsf ******/
		/****** md5 signature: 6863a40fb0cd437e765d05b0eae8fb7a ******/
		%feature("compactdefaultargs") gp_GTrsf;
		%feature("autodoc", "
Parameters
----------
theM: gp_Mat
theV: gp_XYZ

Return
-------
None

Description
-----------
Creates a transformation based on the matrix theM and the vector theV where theM defines the vectorial part of the transformation, and V the translation part, or.
") gp_GTrsf;
		 gp_GTrsf(const gp_Mat & theM, const gp_XYZ & theV);


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
		/****** gp_GTrsf::Form ******/
		/****** md5 signature: 01822abba3940957d80f7a742c62bc53 ******/
		%feature("compactdefaultargs") Form;
		%feature("autodoc", "Return
-------
gp_TrsfForm

Description
-----------
Returns the nature of the transformation. It can be an identity transformation, a rotation, a translation, a mirror transformation (relative to a point, an axis or a plane), a scaling transformation, a compound transformation or some other type of transformation.
") Form;
		gp_TrsfForm Form();

		/****** gp_GTrsf::Invert ******/
		/****** md5 signature: 980f166f600d23a8c77565829af2eeff ******/
		%feature("compactdefaultargs") Invert;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Invert;
		void Invert();

		/****** gp_GTrsf::Inverted ******/
		/****** md5 signature: 20e104c1b972c0dc0ea5c50b20cfe6a4 ******/
		%feature("compactdefaultargs") Inverted;
		%feature("autodoc", "Return
-------
gp_GTrsf

Description
-----------
Computes the reverse transformation. Raises an exception if the matrix of the transformation is not inversible.
") Inverted;
		gp_GTrsf Inverted();

		/****** gp_GTrsf::IsNegative ******/
		/****** md5 signature: 374450f188a20ccc5e75ca9181057e04 ******/
		%feature("compactdefaultargs") IsNegative;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if the determinant of the vectorial part of this transformation is negative.
") IsNegative;
		bool IsNegative();

		/****** gp_GTrsf::IsSingular ******/
		/****** md5 signature: 232ee8c1482120b3b528de82003d4963 ******/
		%feature("compactdefaultargs") IsSingular;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if this transformation is singular (and therefore, cannot be inverted). Note: The Gauss LU decomposition is used to invert the transformation matrix. Consequently, the transformation is considered as singular if the largest pivot found is less than or equal to gp::Resolution(). Warning If this transformation is singular, it cannot be inverted.
") IsSingular;
		bool IsSingular();

		/****** gp_GTrsf::Multiplied ******/
		/****** md5 signature: 0412af175c722164d2eec0421acb3f6a ******/
		%feature("compactdefaultargs") Multiplied;
		%feature("autodoc", "
Parameters
----------
theT: gp_GTrsf

Return
-------
gp_GTrsf

Description
-----------
Computes the transformation composed from theT and <self>. In a C++ implementation you can also write Tcomposed = <self> * theT. Example: @code gp_GTrsf T1, T2, Tcomp; ............... //composition: Tcomp = T2.Multiplied(T1); // or (Tcomp = T2 * T1) // transformation of a point gp_XYZ P(10.,3.,4.); gp_XYZ P1(P); Tcomp.Transforms(P1); //using Tcomp gp_XYZ P2(P); T1.Transforms(P2); //using T1 then T2 T2.Transforms(P2); // P1 = P2 !!! @endcode.
") Multiplied;
		gp_GTrsf Multiplied(const gp_GTrsf & theT);

		/****** gp_GTrsf::Multiply ******/
		/****** md5 signature: a247a1bee447b3badb823f0105999e27 ******/
		%feature("compactdefaultargs") Multiply;
		%feature("autodoc", "
Parameters
----------
theT: gp_GTrsf

Return
-------
None

Description
-----------
Computes the transformation composed with <self> and theT. <self> = <self> * theT.
") Multiply;
		void Multiply(const gp_GTrsf & theT);

		/****** gp_GTrsf::Power ******/
		/****** md5 signature: f3a3cc0edc25db3d73a8d582f1c4bc84 ******/
		%feature("compactdefaultargs") Power;
		%feature("autodoc", "
Parameters
----------
theN: int

Return
-------
None

Description
-----------
No available documentation.
") Power;
		void Power(const int theN);

		/****** gp_GTrsf::Powered ******/
		/****** md5 signature: 5a45ec87641c635ce8b21310db8bc68d ******/
		%feature("compactdefaultargs") Powered;
		%feature("autodoc", "
Parameters
----------
theN: int

Return
-------
gp_GTrsf

Description
-----------
Computes: - the product of this transformation multiplied by itself theN times, if theN is positive, or - the product of the inverse of this transformation multiplied by itself |theN| times, if theN is negative. If theN equals zero, the result is equal to the Identity transformation. I.e.: <self> * <self> * .......* <self>, theN time. if theN =0 <self> = Identity if theN < 0 <self> = <self>.Inverse() *...........* <self>.Inverse(). //! Raises an exception if N < 0 and if the matrix of the transformation not inversible.
") Powered;
		gp_GTrsf Powered(const int theN);

		/****** gp_GTrsf::PreMultiply ******/
		/****** md5 signature: 520cdca00681b657332883d57c2939cb ******/
		%feature("compactdefaultargs") PreMultiply;
		%feature("autodoc", "
Parameters
----------
theT: gp_GTrsf

Return
-------
None

Description
-----------
Computes the product of the transformation theT and this transformation and assigns the result to this transformation. this = theT * this.
") PreMultiply;
		void PreMultiply(const gp_GTrsf & theT);

		/****** gp_GTrsf::SetAffinity ******/
		/****** md5 signature: 0463c8d656f7bfcedbe2944bae2b8082 ******/
		%feature("compactdefaultargs") SetAffinity;
		%feature("autodoc", "
Parameters
----------
theA1: gp_Ax1
theRatio: double

Return
-------
None

Description
-----------
Changes this transformation into an affinity of ratio theRatio with respect to the axis theA1. Note: an affinity is a point-by-point transformation that transforms any point P into a point P' such that if H is the orthogonal projection of P on the axis theA1 or the plane A2, the vectors HP and HP' satisfy: HP' = theRatio * HP.
") SetAffinity;
		void SetAffinity(const gp_Ax1 & theA1, const double theRatio);

		/****** gp_GTrsf::SetAffinity ******/
		/****** md5 signature: f64f7aef0e5d8806e81dcfd098c65487 ******/
		%feature("compactdefaultargs") SetAffinity;
		%feature("autodoc", "
Parameters
----------
theA2: gp_Ax2
theRatio: double

Return
-------
None

Description
-----------
Changes this transformation into an affinity of ratio theRatio with respect to the plane defined by the origin, the 'X Direction' and the 'Y Direction' of coordinate system theA2. Note: an affinity is a point-by-point transformation that transforms any point P into a point P' such that if H is the orthogonal projection of P on the axis A1 or the plane theA2, the vectors HP and HP' satisfy: HP' = theRatio * HP.
") SetAffinity;
		void SetAffinity(const gp_Ax2 & theA2, const double theRatio);

		/****** gp_GTrsf::SetForm ******/
		/****** md5 signature: 24aaa37eae60e1c6ddc89cc5799d3e54 ******/
		%feature("compactdefaultargs") SetForm;
		%feature("autodoc", "Return
-------
None

Description
-----------
verify and set the shape of the GTrsf Other or CompoundTrsf Ex: @code myGTrsf.SetValue(row1,col1,val1); myGTrsf.SetValue(row2,col2,val2); ... myGTrsf.SetForm(); @endcode.
") SetForm;
		void SetForm();

		/****** gp_GTrsf::SetTranslationPart ******/
		/****** md5 signature: 9e742c7bbc3e725da5b9b0aea1596118 ******/
		%feature("compactdefaultargs") SetTranslationPart;
		%feature("autodoc", "
Parameters
----------
theCoord: gp_XYZ

Return
-------
None

Description
-----------
Replaces the translation part of this transformation by the coordinates of the number triple theCoord.
") SetTranslationPart;
		void SetTranslationPart(const gp_XYZ & theCoord);

		/****** gp_GTrsf::SetTrsf ******/
		/****** md5 signature: 7b3bb649abbe2903c4caa00865e50f22 ******/
		%feature("compactdefaultargs") SetTrsf;
		%feature("autodoc", "
Parameters
----------
theT: gp_Trsf

Return
-------
None

Description
-----------
Assigns the vectorial and translation parts of theT to this transformation.
") SetTrsf;
		void SetTrsf(const gp_Trsf & theT);

		/****** gp_GTrsf::SetValue ******/
		/****** md5 signature: a33a91d3a9cccd4f875fad975592252d ******/
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "
Parameters
----------
theRow: int
theCol: int
theValue: double

Return
-------
None

Description
-----------
Replaces the coefficient (theRow, theCol) of the matrix representing this transformation by theValue. Raises OutOfRange if theRow < 1 or theRow > 3 or theCol < 1 or theCol > 4.
") SetValue;
		void SetValue(const int theRow, const int theCol, const double theValue);

		/****** gp_GTrsf::SetVectorialPart ******/
		/****** md5 signature: d19c98cd1d165d3019cacd8116316951 ******/
		%feature("compactdefaultargs") SetVectorialPart;
		%feature("autodoc", "
Parameters
----------
theMatrix: gp_Mat

Return
-------
None

Description
-----------
Replaces the vectorial part of this transformation by theMatrix.
") SetVectorialPart;
		void SetVectorialPart(const gp_Mat & theMatrix);

		/****** gp_GTrsf::Transforms ******/
		/****** md5 signature: a80a85a5c322be8a91246ac2ca77e0f7 ******/
		%feature("compactdefaultargs") Transforms;
		%feature("autodoc", "
Parameters
----------
theCoord: gp_XYZ

Return
-------
None

Description
-----------
No available documentation.
") Transforms;
		void Transforms(gp_XYZ & theCoord);

		/****** gp_GTrsf::Transforms ******/
		/****** md5 signature: a431bedfdca89d6e601967bf688126e9 ******/
		%feature("compactdefaultargs") Transforms;
		%feature("autodoc", "
Parameters
----------

Return
-------
theX: double
theY: double
theZ: double

Description
-----------
Transforms a triplet XYZ with a GTrsf.
") Transforms;
		void Transforms(Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** gp_GTrsf::TranslationPart ******/
		/****** md5 signature: 2e8b1c597fc25157ceb8e1f212767e5b ******/
		%feature("compactdefaultargs") TranslationPart;
		%feature("autodoc", "Return
-------
gp_XYZ

Description
-----------
Returns the translation part of the GTrsf.
") TranslationPart;
		const gp_XYZ TranslationPart();

		/****** gp_GTrsf::Trsf ******/
		/****** md5 signature: b145fbbd7dcaa4f9903d5fe3c25b5982 ******/
		%feature("compactdefaultargs") Trsf;
		%feature("autodoc", "Return
-------
gp_Trsf

Description
-----------
No available documentation.
") Trsf;
		gp_Trsf Trsf();

		/****** gp_GTrsf::Value ******/
		/****** md5 signature: 3f1341b0f5a1b548318b2db63518e612 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
theRow: int
theCol: int

Return
-------
double

Description
-----------
Returns the coefficients of the global matrix of transformation. Raises OutOfRange if theRow < 1 or theRow > 3 or theCol < 1 or theCol > 4.
") Value;
		double Value(const int theRow, const int theCol);

		/****** gp_GTrsf::VectorialPart ******/
		/****** md5 signature: 3c38c5d103a3c0e4d4a09f8b26647106 ******/
		%feature("compactdefaultargs") VectorialPart;
		%feature("autodoc", "Return
-------
gp_Mat

Description
-----------
Computes the vectorial part of the GTrsf. The returned Matrix is a 3*3 matrix.
") VectorialPart;
		const gp_Mat VectorialPart();

		/****** gp_GTrsf::operator * ******/
		/****** md5 signature: 10e76ac91d674cb7708c2608bca82889 ******/
		%feature("compactdefaultargs") operator *;
		%feature("autodoc", "
Parameters
----------
theT: gp_GTrsf

Return
-------
gp_GTrsf

Description
-----------
No available documentation.
") operator *;
		gp_GTrsf operator *(const gp_GTrsf & theT);


%extend{
    void __imul_wrapper__(const gp_GTrsf other) {
    *self *= other;
    }
}
%pythoncode {
def __imul__(self, right):
    self.__imul_wrapper__(right)
    return self
}
};



%extend gp_GTrsf {
%pythoncode {
    def __getstate__(self):
        return self.DumpJson()
    }
};

%extend gp_GTrsf {
%pythoncode {
    def __setstate__(self, state):
        inst = gp_GTrsf()
        if inst.InitFromJson(state):
            self.this = inst.this
        else:
            raise IOError('Failed to set state of gp_GTrsf')
    }
};
%extend gp_GTrsf {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************
* class gp_GTrsf2d *
*******************/
class gp_GTrsf2d {
	public:
		/****** gp_GTrsf2d::gp_GTrsf2d ******/
		/****** md5 signature: 2d0e3911e89e53fd83b611303959172e ******/
		%feature("compactdefaultargs") gp_GTrsf2d;
		%feature("autodoc", "Return
-------
None

Description
-----------
returns identity transformation.
") gp_GTrsf2d;
		 gp_GTrsf2d();

		/****** gp_GTrsf2d::gp_GTrsf2d ******/
		/****** md5 signature: 620ab410ff57eed20fe9970b6e41008a ******/
		%feature("compactdefaultargs") gp_GTrsf2d;
		%feature("autodoc", "
Parameters
----------
theT: gp_Trsf2d

Return
-------
None

Description
-----------
Converts the gp_Trsf2d transformation theT into a general transformation.
") gp_GTrsf2d;
		 gp_GTrsf2d(const gp_Trsf2d & theT);

		/****** gp_GTrsf2d::gp_GTrsf2d ******/
		/****** md5 signature: 0dabc285ea7dbe333f9a3eab4c4871bf ******/
		%feature("compactdefaultargs") gp_GTrsf2d;
		%feature("autodoc", "
Parameters
----------
theM: gp_Mat2d
theV: gp_XY

Return
-------
None

Description
-----------
Creates a transformation based on the matrix theM and the vector theV where theM defines the vectorial part of the transformation, and theV the translation part.
") gp_GTrsf2d;
		 gp_GTrsf2d(const gp_Mat2d & theM, const gp_XY & theV);

		/****** gp_GTrsf2d::Form ******/
		/****** md5 signature: 01822abba3940957d80f7a742c62bc53 ******/
		%feature("compactdefaultargs") Form;
		%feature("autodoc", "Return
-------
gp_TrsfForm

Description
-----------
Returns the nature of the transformation. It can be an identity transformation, a rotation, a translation, a mirror transformation (relative to a point or axis), a scaling transformation, a compound transformation or some other type of transformation.
") Form;
		gp_TrsfForm Form();

		/****** gp_GTrsf2d::Invert ******/
		/****** md5 signature: 980f166f600d23a8c77565829af2eeff ******/
		%feature("compactdefaultargs") Invert;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Invert;
		void Invert();

		/****** gp_GTrsf2d::Inverted ******/
		/****** md5 signature: f60f0491416a0a0fd4ec062a70fe0cec ******/
		%feature("compactdefaultargs") Inverted;
		%feature("autodoc", "Return
-------
gp_GTrsf2d

Description
-----------
Computes the reverse transformation. Raised an exception if the matrix of the transformation is not inversible.
") Inverted;
		gp_GTrsf2d Inverted();

		/****** gp_GTrsf2d::IsNegative ******/
		/****** md5 signature: 374450f188a20ccc5e75ca9181057e04 ******/
		%feature("compactdefaultargs") IsNegative;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if the determinant of the vectorial part of this transformation is negative.
") IsNegative;
		bool IsNegative();

		/****** gp_GTrsf2d::IsSingular ******/
		/****** md5 signature: 232ee8c1482120b3b528de82003d4963 ******/
		%feature("compactdefaultargs") IsSingular;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if this transformation is singular (and therefore, cannot be inverted). Note: The Gauss LU decomposition is used to invert the transformation matrix. Consequently, the transformation is considered as singular if the largest pivot found is less than or equal to gp::Resolution(). Warning If this transformation is singular, it cannot be inverted.
") IsSingular;
		bool IsSingular();

		/****** gp_GTrsf2d::Multiplied ******/
		/****** md5 signature: e158daa87c6102719ad9ab942df8617c ******/
		%feature("compactdefaultargs") Multiplied;
		%feature("autodoc", "
Parameters
----------
theT: gp_GTrsf2d

Return
-------
gp_GTrsf2d

Description
-----------
Computes the transformation composed with theT and <self>. In a C++ implementation you can also write Tcomposed = <self> * theT. Example: @code gp_GTrsf2d T1, T2, Tcomp; ............... //composition: Tcomp = T2.Multiplied(T1); // or (Tcomp = T2 * T1) // transformation of a point gp_XY P(10.,3.); gp_XY P1(P); Tcomp.Transforms(P1); //using Tcomp gp_XY P2(P); T1.Transforms(P2); //using T1 then T2 T2.Transforms(P2); // P1 = P2 !!! @endcode.
") Multiplied;
		gp_GTrsf2d Multiplied(const gp_GTrsf2d & theT);

		/****** gp_GTrsf2d::Multiply ******/
		/****** md5 signature: 5070b8932341dd47405b05e8e355859b ******/
		%feature("compactdefaultargs") Multiply;
		%feature("autodoc", "
Parameters
----------
theT: gp_GTrsf2d

Return
-------
None

Description
-----------
No available documentation.
") Multiply;
		void Multiply(const gp_GTrsf2d & theT);

		/****** gp_GTrsf2d::Power ******/
		/****** md5 signature: f3a3cc0edc25db3d73a8d582f1c4bc84 ******/
		%feature("compactdefaultargs") Power;
		%feature("autodoc", "
Parameters
----------
theN: int

Return
-------
None

Description
-----------
No available documentation.
") Power;
		void Power(const int theN);

		/****** gp_GTrsf2d::Powered ******/
		/****** md5 signature: f562f459dfc25e5bc24ae6354edb99a9 ******/
		%feature("compactdefaultargs") Powered;
		%feature("autodoc", "
Parameters
----------
theN: int

Return
-------
gp_GTrsf2d

Description
-----------
Computes the following composition of transformations <self> * <self> * .......* <self>, theN time. if theN = 0 <self> = Identity if theN < 0 <self> = <self>.Inverse() *...........* <self>.Inverse(). //! Raises an exception if theN < 0 and if the matrix of the transformation is not inversible.
") Powered;
		gp_GTrsf2d Powered(const int theN);

		/****** gp_GTrsf2d::PreMultiply ******/
		/****** md5 signature: 8be694d4d9a5049f2c986fa0b9cee8dd ******/
		%feature("compactdefaultargs") PreMultiply;
		%feature("autodoc", "
Parameters
----------
theT: gp_GTrsf2d

Return
-------
None

Description
-----------
Computes the product of the transformation theT and this transformation, and assigns the result to this transformation: this = theT * this.
") PreMultiply;
		void PreMultiply(const gp_GTrsf2d & theT);

		/****** gp_GTrsf2d::SetAffinity ******/
		/****** md5 signature: ca5ce6b69ab98217c57c445a9bea25b6 ******/
		%feature("compactdefaultargs") SetAffinity;
		%feature("autodoc", "
Parameters
----------
theA: gp_Ax2d
theRatio: double

Return
-------
None

Description
-----------
Changes this transformation into an affinity of ratio theRatio with respect to the axis theA. Note: An affinity is a point-by-point transformation that transforms any point P into a point P' such that if H is the orthogonal projection of P on the axis theA, the vectors HP and HP' satisfy: HP' = theRatio * HP.
") SetAffinity;
		void SetAffinity(const gp_Ax2d & theA, const double theRatio);

		/****** gp_GTrsf2d::SetTranslationPart ******/
		/****** md5 signature: a41985f432639c55f93c33e4be3a3501 ******/
		%feature("compactdefaultargs") SetTranslationPart;
		%feature("autodoc", "
Parameters
----------
theCoord: gp_XY

Return
-------
None

Description
-----------
Replaces the translation part of this transformation by the coordinates of the number pair theCoord.
") SetTranslationPart;
		void SetTranslationPart(const gp_XY & theCoord);

		/****** gp_GTrsf2d::SetTrsf2d ******/
		/****** md5 signature: 57bc6355283dbf478188695a15c97581 ******/
		%feature("compactdefaultargs") SetTrsf2d;
		%feature("autodoc", "
Parameters
----------
theT: gp_Trsf2d

Return
-------
None

Description
-----------
Assigns the vectorial and translation parts of theT to this transformation.
") SetTrsf2d;
		void SetTrsf2d(const gp_Trsf2d & theT);

		/****** gp_GTrsf2d::SetValue ******/
		/****** md5 signature: a33a91d3a9cccd4f875fad975592252d ******/
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "
Parameters
----------
theRow: int
theCol: int
theValue: double

Return
-------
None

Description
-----------
Replaces the coefficient (theRow, theCol) of the matrix representing this transformation by theValue, Raises OutOfRange if theRow < 1 or theRow > 2 or theCol < 1 or theCol > 3.
") SetValue;
		void SetValue(const int theRow, const int theCol, const double theValue);

		/****** gp_GTrsf2d::SetVectorialPart ******/
		/****** md5 signature: a7ec786ec9256cb866e2976a3d16812d ******/
		%feature("compactdefaultargs") SetVectorialPart;
		%feature("autodoc", "
Parameters
----------
theMatrix: gp_Mat2d

Return
-------
None

Description
-----------
Replaces the vectorial part of this transformation by theMatrix.
") SetVectorialPart;
		void SetVectorialPart(const gp_Mat2d & theMatrix);

		/****** gp_GTrsf2d::Transformed ******/
		/****** md5 signature: 4f1021790508140e46047985a7a66c94 ******/
		%feature("compactdefaultargs") Transformed;
		%feature("autodoc", "
Parameters
----------
theCoord: gp_XY

Return
-------
gp_XY

Description
-----------
No available documentation.
") Transformed;
		gp_XY Transformed(const gp_XY & theCoord);

		/****** gp_GTrsf2d::Transforms ******/
		/****** md5 signature: 585e61bff177e6611e27373fcdaa6fc2 ******/
		%feature("compactdefaultargs") Transforms;
		%feature("autodoc", "
Parameters
----------
theCoord: gp_XY

Return
-------
None

Description
-----------
No available documentation.
") Transforms;
		void Transforms(gp_XY & theCoord);

		/****** gp_GTrsf2d::Transforms ******/
		/****** md5 signature: 80fbe9c12b5ec17bad393b0809ee6ad8 ******/
		%feature("compactdefaultargs") Transforms;
		%feature("autodoc", "
Parameters
----------

Return
-------
theX: double
theY: double

Description
-----------
Applies this transformation to the coordinates: - of the number pair Coord, or - X and Y. //! Note: - Transforms modifies theX, theY, or the coordinate pair Coord, while - Transformed creates a new coordinate pair.
") Transforms;
		void Transforms(Standard_Real &OutValue, Standard_Real &OutValue);

		/****** gp_GTrsf2d::TranslationPart ******/
		/****** md5 signature: 3b9750d0fb3e28d1a84f17611142db69 ******/
		%feature("compactdefaultargs") TranslationPart;
		%feature("autodoc", "Return
-------
gp_XY

Description
-----------
Returns the translation part of the GTrsf2d.
") TranslationPart;
		const gp_XY TranslationPart();

		/****** gp_GTrsf2d::Trsf2d ******/
		/****** md5 signature: 6ea70105baee17870344c337ed09ffe5 ******/
		%feature("compactdefaultargs") Trsf2d;
		%feature("autodoc", "Return
-------
gp_Trsf2d

Description
-----------
Converts this transformation into a gp_Trsf2d transformation. Exceptions Standard_ConstructionError if this transformation cannot be converted, i.e. if its form is gp_Other.
") Trsf2d;
		gp_Trsf2d Trsf2d();

		/****** gp_GTrsf2d::Value ******/
		/****** md5 signature: 3f1341b0f5a1b548318b2db63518e612 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
theRow: int
theCol: int

Return
-------
double

Description
-----------
Returns the coefficients of the global matrix of transformation. Raised OutOfRange if theRow < 1 or theRow > 2 or theCol < 1 or theCol > 3.
") Value;
		double Value(const int theRow, const int theCol);

		/****** gp_GTrsf2d::VectorialPart ******/
		/****** md5 signature: 1eeb1145f71181bd6ee40f9703f22370 ******/
		%feature("compactdefaultargs") VectorialPart;
		%feature("autodoc", "Return
-------
gp_Mat2d

Description
-----------
Computes the vectorial part of the GTrsf2d. The returned Matrix is a 2*2 matrix.
") VectorialPart;
		const gp_Mat2d VectorialPart();

		/****** gp_GTrsf2d::operator * ******/
		/****** md5 signature: 64120fcb548b9133abe602a79f862b0c ******/
		%feature("compactdefaultargs") operator *;
		%feature("autodoc", "
Parameters
----------
theT: gp_GTrsf2d

Return
-------
gp_GTrsf2d

Description
-----------
No available documentation.
") operator *;
		gp_GTrsf2d operator *(const gp_GTrsf2d & theT);


%extend{
    void __imul_wrapper__(const gp_GTrsf2d other) {
    *self *= other;
    }
}
%pythoncode {
def __imul__(self, right):
    self.__imul_wrapper__(right)
    return self
}
};



%extend gp_GTrsf2d {
%pythoncode {
    def __getstate__(self):
        return self.DumpJson()
    }
};

%extend gp_GTrsf2d {
%pythoncode {
    def __setstate__(self, state):
        inst = gp_GTrsf2d()
        if inst.InitFromJson(state):
            self.this = inst.this
        else:
            raise IOError('Failed to set state of gp_GTrsf2d')
    }
};
%extend gp_GTrsf2d {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************
* class gp_Hypr *
****************/
class gp_Hypr {
	public:
		/****** gp_Hypr::gp_Hypr ******/
		/****** md5 signature: b630f8faaa55fdf65630873e3c731452 ******/
		%feature("compactdefaultargs") gp_Hypr;
		%feature("autodoc", "Return
-------
None

Description
-----------
Creates of an indefinite hyperbola.
") gp_Hypr;
		 gp_Hypr();

		/****** gp_Hypr::gp_Hypr ******/
		/****** md5 signature: 49276005799840053cf6335f563db02e ******/
		%feature("compactdefaultargs") gp_Hypr;
		%feature("autodoc", "
Parameters
----------
theA2: gp_Ax2
theMajorRadius: double
theMinorRadius: double

Return
-------
None

Description
-----------
Creates a hyperbola with radius theMajorRadius and theMinorRadius, positioned in the space by the coordinate system theA2 such that: - the origin of theA2 is the center of the hyperbola, - the 'X Direction' of theA2 defines the major axis of the hyperbola, that is, the major radius theMajorRadius is measured along this axis, and - the 'Y Direction' of theA2 defines the minor axis of the hyperbola, that is, the minor radius theMinorRadius is measured along this axis. Note: This class does not prevent the creation of a hyperbola where: - theMajorAxis is equal to theMinorAxis, or - theMajorAxis is less than theMinorAxis. Exceptions Standard_ConstructionError if theMajorAxis or theMinorAxis is negative. Raises ConstructionError if theMajorRadius < 0.0 or theMinorRadius < 0.0 Raised if theMajorRadius < 0.0 or theMinorRadius < 0.0.
") gp_Hypr;
		 gp_Hypr(const gp_Ax2 & theA2, const double theMajorRadius, const double theMinorRadius);

		/****** gp_Hypr::Asymptote1 ******/
		/****** md5 signature: de14135c1ce647b5a9f90af716eea7a8 ******/
		%feature("compactdefaultargs") Asymptote1;
		%feature("autodoc", "Return
-------
gp_Ax1

Description
-----------
In the local coordinate system of the hyperbola the equation of the hyperbola is (X*X)/(A*A) - (Y*Y)/(B*B) = 1.0 and the equation of the first asymptote is Y = (B/A)*X where A is the major radius and B is the minor radius. Raises ConstructionError if MajorRadius = 0.0.
") Asymptote1;
		gp_Ax1 Asymptote1();

		/****** gp_Hypr::Asymptote2 ******/
		/****** md5 signature: 13c1b779412722927b3766066de238ea ******/
		%feature("compactdefaultargs") Asymptote2;
		%feature("autodoc", "Return
-------
gp_Ax1

Description
-----------
In the local coordinate system of the hyperbola the equation of the hyperbola is (X*X)/(A*A) - (Y*Y)/(B*B) = 1.0 and the equation of the first asymptote is Y = -(B/A)*X. where A is the major radius and B is the minor radius. Raises ConstructionError if MajorRadius = 0.0.
") Asymptote2;
		gp_Ax1 Asymptote2();

		/****** gp_Hypr::Axis ******/
		/****** md5 signature: 92df3aa78c9ee700462ef461d4ed4603 ******/
		%feature("compactdefaultargs") Axis;
		%feature("autodoc", "Return
-------
gp_Ax1

Description
-----------
Returns the axis passing through the center, and normal to the plane of this hyperbola.
") Axis;
		const gp_Ax1 Axis();

		/****** gp_Hypr::ConjugateBranch1 ******/
		/****** md5 signature: 8d402ac72b793f2be179c15291ced8b3 ******/
		%feature("compactdefaultargs") ConjugateBranch1;
		%feature("autodoc", "Return
-------
gp_Hypr

Description
-----------
Computes the branch of hyperbola which is on the positive side of the 'YAxis' of <self>.
") ConjugateBranch1;
		gp_Hypr ConjugateBranch1();

		/****** gp_Hypr::ConjugateBranch2 ******/
		/****** md5 signature: 95bbcdc59f58d488edbf1e4fbe248577 ******/
		%feature("compactdefaultargs") ConjugateBranch2;
		%feature("autodoc", "Return
-------
gp_Hypr

Description
-----------
Computes the branch of hyperbola which is on the negative side of the 'YAxis' of <self>.
") ConjugateBranch2;
		gp_Hypr ConjugateBranch2();

		/****** gp_Hypr::Directrix1 ******/
		/****** md5 signature: 10272c6052549861204070aa44f046a5 ******/
		%feature("compactdefaultargs") Directrix1;
		%feature("autodoc", "Return
-------
gp_Ax1

Description
-----------
This directrix is the line normal to the XAxis of the hyperbola in the local plane (Z = 0) at a distance d = MajorRadius / e from the center of the hyperbola, where e is the eccentricity of the hyperbola. This line is parallel to the 'YAxis'. The intersection point between the directrix1 and the 'XAxis' is the 'Location' point of the directrix1. This point is on the positive side of the 'XAxis'.
") Directrix1;
		gp_Ax1 Directrix1();

		/****** gp_Hypr::Directrix2 ******/
		/****** md5 signature: 88339a214155f2a41d76691fd00c9167 ******/
		%feature("compactdefaultargs") Directrix2;
		%feature("autodoc", "Return
-------
gp_Ax1

Description
-----------
This line is obtained by the symmetrical transformation of 'Directrix1' with respect to the 'YAxis' of the hyperbola.
") Directrix2;
		gp_Ax1 Directrix2();

		/****** gp_Hypr::Eccentricity ******/
		/****** md5 signature: 6c5e5f3e183d0025b7cd35ab9d28cf3c ******/
		%feature("compactdefaultargs") Eccentricity;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns the eccentricity of the hyperbola (e > 1). If f is the distance between the location of the hyperbola and the Focus1 then the eccentricity e = f / MajorRadius. Raises DomainError if MajorRadius = 0.0.
") Eccentricity;
		double Eccentricity();

		/****** gp_Hypr::Focal ******/
		/****** md5 signature: 5d1e5f9e6604ab079b2344fb657cbd30 ******/
		%feature("compactdefaultargs") Focal;
		%feature("autodoc", "Return
-------
double

Description
-----------
Computes the focal distance. It is the distance between the the two focus of the hyperbola.
") Focal;
		double Focal();

		/****** gp_Hypr::Focus1 ******/
		/****** md5 signature: 44668390e44007b6344ae1f20fcc3003 ******/
		%feature("compactdefaultargs") Focus1;
		%feature("autodoc", "Return
-------
gp_Pnt

Description
-----------
Returns the first focus of the hyperbola. This focus is on the positive side of the 'XAxis' of the hyperbola.
") Focus1;
		gp_Pnt Focus1();

		/****** gp_Hypr::Focus2 ******/
		/****** md5 signature: 19e89a037d2bd912a8348a9c245bd935 ******/
		%feature("compactdefaultargs") Focus2;
		%feature("autodoc", "Return
-------
gp_Pnt

Description
-----------
Returns the second focus of the hyperbola. This focus is on the negative side of the 'XAxis' of the hyperbola.
") Focus2;
		gp_Pnt Focus2();

		/****** gp_Hypr::Location ******/
		/****** md5 signature: 2c3e536bdb11b2c2c46fc19fd8a6c569 ******/
		%feature("compactdefaultargs") Location;
		%feature("autodoc", "Return
-------
gp_Pnt

Description
-----------
Returns the location point of the hyperbola. It is the intersection point between the 'XAxis' and the 'YAxis'.
") Location;
		const gp_Pnt Location();

		/****** gp_Hypr::MajorRadius ******/
		/****** md5 signature: f3c8e84cfab3df86862664576afed07f ******/
		%feature("compactdefaultargs") MajorRadius;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns the major radius of the hyperbola. It is the radius on the 'XAxis' of the hyperbola.
") MajorRadius;
		double MajorRadius();

		/****** gp_Hypr::MinorRadius ******/
		/****** md5 signature: 2cdcbbe9dc623324c534b7df914ad3c3 ******/
		%feature("compactdefaultargs") MinorRadius;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns the minor radius of the hyperbola. It is the radius on the 'YAxis' of the hyperbola.
") MinorRadius;
		double MinorRadius();

		/****** gp_Hypr::Mirror ******/
		/****** md5 signature: 0f424be72f12474fe3ff290168029c4e ******/
		%feature("compactdefaultargs") Mirror;
		%feature("autodoc", "
Parameters
----------
theP: gp_Pnt

Return
-------
None

Description
-----------
No available documentation.
") Mirror;
		void Mirror(const gp_Pnt & theP);

		/****** gp_Hypr::Mirror ******/
		/****** md5 signature: cfb16cae08525c5f4ab330102e0377d4 ******/
		%feature("compactdefaultargs") Mirror;
		%feature("autodoc", "
Parameters
----------
theA1: gp_Ax1

Return
-------
None

Description
-----------
No available documentation.
") Mirror;
		void Mirror(const gp_Ax1 & theA1);

		/****** gp_Hypr::Mirror ******/
		/****** md5 signature: ad34943401a2334beed8ccc79094d8df ******/
		%feature("compactdefaultargs") Mirror;
		%feature("autodoc", "
Parameters
----------
theA2: gp_Ax2

Return
-------
None

Description
-----------
No available documentation.
") Mirror;
		void Mirror(const gp_Ax2 & theA2);

		/****** gp_Hypr::Mirrored ******/
		/****** md5 signature: d7ac39d7e58c230379ea45c40daafc68 ******/
		%feature("compactdefaultargs") Mirrored;
		%feature("autodoc", "
Parameters
----------
theP: gp_Pnt

Return
-------
gp_Hypr

Description
-----------
Performs the symmetrical transformation of an hyperbola with respect to the point theP which is the center of the symmetry.
") Mirrored;
		gp_Hypr Mirrored(const gp_Pnt & theP);

		/****** gp_Hypr::Mirrored ******/
		/****** md5 signature: 5f3340cf49a65e5b62bd724427f653e0 ******/
		%feature("compactdefaultargs") Mirrored;
		%feature("autodoc", "
Parameters
----------
theA1: gp_Ax1

Return
-------
gp_Hypr

Description
-----------
Performs the symmetrical transformation of an hyperbola with respect to an axis placement which is the axis of the symmetry.
") Mirrored;
		gp_Hypr Mirrored(const gp_Ax1 & theA1);

		/****** gp_Hypr::Mirrored ******/
		/****** md5 signature: 4a71d42fda88802f3c62180283d07b33 ******/
		%feature("compactdefaultargs") Mirrored;
		%feature("autodoc", "
Parameters
----------
theA2: gp_Ax2

Return
-------
gp_Hypr

Description
-----------
Performs the symmetrical transformation of an hyperbola with respect to a plane. The axis placement theA2 locates the plane of the symmetry (Location, XDirection, YDirection).
") Mirrored;
		gp_Hypr Mirrored(const gp_Ax2 & theA2);

		/****** gp_Hypr::OtherBranch ******/
		/****** md5 signature: 627cb5f0a034c43843be9b8252852ca6 ******/
		%feature("compactdefaultargs") OtherBranch;
		%feature("autodoc", "Return
-------
gp_Hypr

Description
-----------
Returns the branch of hyperbola obtained by doing the symmetrical transformation of <self> with respect to the 'YAxis' of <self>.
") OtherBranch;
		gp_Hypr OtherBranch();

		/****** gp_Hypr::Parameter ******/
		/****** md5 signature: f2f0d3a4c48532483b401ae3d2d5c5fb ******/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns p = (e * e - 1) * MajorRadius where e is the eccentricity of the hyperbola. Raises DomainError if MajorRadius = 0.0.
") Parameter;
		double Parameter();

		/****** gp_Hypr::Position ******/
		/****** md5 signature: 57187ff46d597fddf97672bf3cca7377 ******/
		%feature("compactdefaultargs") Position;
		%feature("autodoc", "Return
-------
gp_Ax2

Description
-----------
Returns the coordinate system of the hyperbola.
") Position;
		const gp_Ax2 Position();

		/****** gp_Hypr::Rotate ******/
		/****** md5 signature: 652dfbf621c2c092ff5b68d608de4634 ******/
		%feature("compactdefaultargs") Rotate;
		%feature("autodoc", "
Parameters
----------
theA1: gp_Ax1
theAng: double

Return
-------
None

Description
-----------
No available documentation.
") Rotate;
		void Rotate(const gp_Ax1 & theA1, const double theAng);

		/****** gp_Hypr::Rotated ******/
		/****** md5 signature: 36a9d745185ff61453bc53bcecf2822f ******/
		%feature("compactdefaultargs") Rotated;
		%feature("autodoc", "
Parameters
----------
theA1: gp_Ax1
theAng: double

Return
-------
gp_Hypr

Description
-----------
Rotates an hyperbola. theA1 is the axis of the rotation. theAng is the angular value of the rotation in radians.
") Rotated;
		gp_Hypr Rotated(const gp_Ax1 & theA1, const double theAng);

		/****** gp_Hypr::Scale ******/
		/****** md5 signature: a03901fe94facbb26121cd37d5814f81 ******/
		%feature("compactdefaultargs") Scale;
		%feature("autodoc", "
Parameters
----------
theP: gp_Pnt
theS: double

Return
-------
None

Description
-----------
No available documentation.
") Scale;
		void Scale(const gp_Pnt & theP, const double theS);

		/****** gp_Hypr::Scaled ******/
		/****** md5 signature: f770adf7d0e967a37b84bba8baf7f6e3 ******/
		%feature("compactdefaultargs") Scaled;
		%feature("autodoc", "
Parameters
----------
theP: gp_Pnt
theS: double

Return
-------
gp_Hypr

Description
-----------
Scales an hyperbola. theS is the scaling value.
") Scaled;
		gp_Hypr Scaled(const gp_Pnt & theP, const double theS);

		/****** gp_Hypr::SetAxis ******/
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
Modifies this hyperbola, by redefining its local coordinate system so that: - its origin and 'main Direction' become those of the axis theA1 (the 'X Direction' and 'Y Direction' are then recomputed in the same way as for any gp_Ax2). Raises ConstructionError if the direction of theA1 is parallel to the direction of the 'XAxis' of the hyperbola.
") SetAxis;
		void SetAxis(const gp_Ax1 & theA1);

		/****** gp_Hypr::SetLocation ******/
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
Modifies this hyperbola, by redefining its local coordinate system so that its origin becomes theP.
") SetLocation;
		void SetLocation(const gp_Pnt & theP);

		/****** gp_Hypr::SetMajorRadius ******/
		/****** md5 signature: 5eff03578088313d850e2a4c6dac1d86 ******/
		%feature("compactdefaultargs") SetMajorRadius;
		%feature("autodoc", "
Parameters
----------
theMajorRadius: double

Return
-------
None

Description
-----------
Modifies the major radius of this hyperbola. Exceptions Standard_ConstructionError if theMajorRadius is negative.
") SetMajorRadius;
		void SetMajorRadius(const double theMajorRadius);

		/****** gp_Hypr::SetMinorRadius ******/
		/****** md5 signature: dfefc317649a676db76eca5eab95531a ******/
		%feature("compactdefaultargs") SetMinorRadius;
		%feature("autodoc", "
Parameters
----------
theMinorRadius: double

Return
-------
None

Description
-----------
Modifies the minor radius of this hyperbola. Exceptions Standard_ConstructionError if theMinorRadius is negative.
") SetMinorRadius;
		void SetMinorRadius(const double theMinorRadius);

		/****** gp_Hypr::SetPosition ******/
		/****** md5 signature: 73d3a6a70843b70b52fc8f3fa07a25a7 ******/
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
Modifies this hyperbola, by redefining its local coordinate system so that it becomes A2.
") SetPosition;
		void SetPosition(const gp_Ax2 & theA2);

		/****** gp_Hypr::Transform ******/
		/****** md5 signature: 0737a7286be728220e1a55ba0d6eafc3 ******/
		%feature("compactdefaultargs") Transform;
		%feature("autodoc", "
Parameters
----------
theT: gp_Trsf

Return
-------
None

Description
-----------
No available documentation.
") Transform;
		void Transform(const gp_Trsf & theT);

		/****** gp_Hypr::Transformed ******/
		/****** md5 signature: 181db1af3d44e2dfa5decfaf031c0297 ******/
		%feature("compactdefaultargs") Transformed;
		%feature("autodoc", "
Parameters
----------
theT: gp_Trsf

Return
-------
gp_Hypr

Description
-----------
Transforms an hyperbola with the transformation theT from class Trsf.
") Transformed;
		gp_Hypr Transformed(const gp_Trsf & theT);

		/****** gp_Hypr::Translate ******/
		/****** md5 signature: 8ae07d4c829c1eef2e7708ef5390638b ******/
		%feature("compactdefaultargs") Translate;
		%feature("autodoc", "
Parameters
----------
theV: gp_Vec

Return
-------
None

Description
-----------
No available documentation.
") Translate;
		void Translate(const gp_Vec & theV);

		/****** gp_Hypr::Translate ******/
		/****** md5 signature: 279c13d6194eb867625753d756d110ab ******/
		%feature("compactdefaultargs") Translate;
		%feature("autodoc", "
Parameters
----------
theP1: gp_Pnt
theP2: gp_Pnt

Return
-------
None

Description
-----------
No available documentation.
") Translate;
		void Translate(const gp_Pnt & theP1, const gp_Pnt & theP2);

		/****** gp_Hypr::Translated ******/
		/****** md5 signature: d69b3a25886ee89fccb58293d6575e14 ******/
		%feature("compactdefaultargs") Translated;
		%feature("autodoc", "
Parameters
----------
theV: gp_Vec

Return
-------
gp_Hypr

Description
-----------
Translates an hyperbola in the direction of the vector theV. The magnitude of the translation is the vector's magnitude.
") Translated;
		gp_Hypr Translated(const gp_Vec & theV);

		/****** gp_Hypr::Translated ******/
		/****** md5 signature: ef92aa1b74342e19435260d81caa5e6a ******/
		%feature("compactdefaultargs") Translated;
		%feature("autodoc", "
Parameters
----------
theP1: gp_Pnt
theP2: gp_Pnt

Return
-------
gp_Hypr

Description
-----------
Translates an hyperbola from the point theP1 to the point theP2.
") Translated;
		gp_Hypr Translated(const gp_Pnt & theP1, const gp_Pnt & theP2);

		/****** gp_Hypr::XAxis ******/
		/****** md5 signature: 37d8185a57a29bf9b7aa10d76b1229a2 ******/
		%feature("compactdefaultargs") XAxis;
		%feature("autodoc", "Return
-------
gp_Ax1

Description
-----------
Computes an axis, whose - the origin is the center of this hyperbola, and - the unit vector is the 'X Direction' of the local coordinate system of this hyperbola. These axes are, the major axis (the 'X Axis') and of this hyperboReturns the 'XAxis' of the hyperbola.
") XAxis;
		gp_Ax1 XAxis();

		/****** gp_Hypr::YAxis ******/
		/****** md5 signature: 78f0cb55c98fbe890a49b3158d9f5039 ******/
		%feature("compactdefaultargs") YAxis;
		%feature("autodoc", "Return
-------
gp_Ax1

Description
-----------
Computes an axis, whose - the origin is the center of this hyperbola, and - the unit vector is the 'Y Direction' of the local coordinate system of this hyperbola. These axes are the minor axis (the 'Y Axis') of this hyperbola.
") YAxis;
		gp_Ax1 YAxis();

};



%extend gp_Hypr {
%pythoncode {
    def __getstate__(self):
        return self.DumpJson()
    }
};

%extend gp_Hypr {
%pythoncode {
    def __setstate__(self, state):
        inst = gp_Hypr()
        if inst.InitFromJson(state):
            self.this = inst.this
        else:
            raise IOError('Failed to set state of gp_Hypr')
    }
};
%extend gp_Hypr {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************
* class gp_Hypr2d *
******************/
class gp_Hypr2d {
	public:
		/****** gp_Hypr2d::gp_Hypr2d ******/
		/****** md5 signature: 556ac499a53aa019083b729077f7e6de ******/
		%feature("compactdefaultargs") gp_Hypr2d;
		%feature("autodoc", "Return
-------
None

Description
-----------
Creates of an indefinite hyperbola.
") gp_Hypr2d;
		 gp_Hypr2d();

		/****** gp_Hypr2d::gp_Hypr2d ******/
		/****** md5 signature: 595d0ae94db34607f60cfb0fe0ced1d3 ******/
		%feature("compactdefaultargs") gp_Hypr2d;
		%feature("autodoc", "
Parameters
----------
theMajorAxis: gp_Ax2d
theMajorRadius: double
theMinorRadius: double
theIsSense: bool (optional, default to true)

Return
-------
None

Description
-----------
Creates a hyperbola with radii theMajorRadius and theMinorRadius, centered on the origin of theMajorAxis and where the unit vector of theMajorAxis is the 'X Direction' of the local coordinate system of the hyperbola. This coordinate system is direct if theIsSense is true (the default value), and indirect if theIsSense is false. Warnings: It is yet possible to create an Hyperbola with theMajorRadius <= theMinorRadius. Raises ConstructionError if theMajorRadius < 0.0 or theMinorRadius < 0.0.
") gp_Hypr2d;
		 gp_Hypr2d(const gp_Ax2d & theMajorAxis, const double theMajorRadius, const double theMinorRadius, const bool theIsSense = true);

		/****** gp_Hypr2d::gp_Hypr2d ******/
		/****** md5 signature: 3c488c1c816b6912ad339f78d1020183 ******/
		%feature("compactdefaultargs") gp_Hypr2d;
		%feature("autodoc", "
Parameters
----------
theA: gp_Ax22d
theMajorRadius: double
theMinorRadius: double

Return
-------
None

Description
-----------
a hyperbola with radii theMajorRadius and theMinorRadius, positioned in the plane by coordinate system theA where: - the origin of theA is the center of the hyperbola, - the 'X Direction' of theA defines the major axis of the hyperbola, that is, the major radius theMajorRadius is measured along this axis, and - the 'Y Direction' of theA defines the minor axis of the hyperbola, that is, the minor radius theMinorRadius is measured along this axis, and - the orientation (direct or indirect sense) of theA gives the implicit orientation of the hyperbola. Warnings: It is yet possible to create an Hyperbola with theMajorRadius <= theMinorRadius. Raises ConstructionError if theMajorRadius < 0.0 or theMinorRadius < 0.0.
") gp_Hypr2d;
		 gp_Hypr2d(const gp_Ax22d & theA, const double theMajorRadius, const double theMinorRadius);

		/****** gp_Hypr2d::Asymptote1 ******/
		/****** md5 signature: f7602d62af48fa687b9c94102a074f0b ******/
		%feature("compactdefaultargs") Asymptote1;
		%feature("autodoc", "Return
-------
gp_Ax2d

Description
-----------
In the local coordinate system of the hyperbola the equation of the hyperbola is (X*X)/(A*A) - (Y*Y)/(B*B) = 1.0 and the equation of the first asymptote is Y = (B/A)*X where A is the major radius of the hyperbola and B the minor radius of the hyperbola. Raises ConstructionError if MajorRadius = 0.0.
") Asymptote1;
		gp_Ax2d Asymptote1();

		/****** gp_Hypr2d::Asymptote2 ******/
		/****** md5 signature: ae762c76c64b4be67fd988e980bd70ef ******/
		%feature("compactdefaultargs") Asymptote2;
		%feature("autodoc", "Return
-------
gp_Ax2d

Description
-----------
In the local coordinate system of the hyperbola the equation of the hyperbola is (X*X)/(A*A) - (Y*Y)/(B*B) = 1.0 and the equation of the first asymptote is Y = -(B/A)*X where A is the major radius of the hyperbola and B the minor radius of the hyperbola. Raises ConstructionError if MajorRadius = 0.0.
") Asymptote2;
		gp_Ax2d Asymptote2();

		/****** gp_Hypr2d::Axis ******/
		/****** md5 signature: e16486dd6873b7754da4b441ae82cea8 ******/
		%feature("compactdefaultargs") Axis;
		%feature("autodoc", "Return
-------
gp_Ax22d

Description
-----------
Returns the axisplacement of the hyperbola.
") Axis;
		const gp_Ax22d Axis();

		/****** gp_Hypr2d::Coefficients ******/
		/****** md5 signature: 05758c67cba8d099d67a3b8db74c835a ******/
		%feature("compactdefaultargs") Coefficients;
		%feature("autodoc", "
Parameters
----------

Return
-------
theA: double
theB: double
theC: double
theD: double
theE: double
theF: double

Description
-----------
Computes the coefficients of the implicit equation of the hyperbola: theA * (X**2) + theB * (Y**2) + 2*theC*(X*Y) + 2*theD*X + 2*theE*Y + theF = 0.
") Coefficients;
		void Coefficients(Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** gp_Hypr2d::ConjugateBranch1 ******/
		/****** md5 signature: 4fc862006631638b64f1c8f47ea2b695 ******/
		%feature("compactdefaultargs") ConjugateBranch1;
		%feature("autodoc", "Return
-------
gp_Hypr2d

Description
-----------
Computes the branch of hyperbola which is on the positive side of the 'YAxis' of <self>.
") ConjugateBranch1;
		gp_Hypr2d ConjugateBranch1();

		/****** gp_Hypr2d::ConjugateBranch2 ******/
		/****** md5 signature: 2480b40bc6686f7f2fa0d3ee66f1e889 ******/
		%feature("compactdefaultargs") ConjugateBranch2;
		%feature("autodoc", "Return
-------
gp_Hypr2d

Description
-----------
Computes the branch of hyperbola which is on the negative side of the 'YAxis' of <self>.
") ConjugateBranch2;
		gp_Hypr2d ConjugateBranch2();

		/****** gp_Hypr2d::Directrix1 ******/
		/****** md5 signature: fcbef2c85b670a856d4882ec13ce9c6f ******/
		%feature("compactdefaultargs") Directrix1;
		%feature("autodoc", "Return
-------
gp_Ax2d

Description
-----------
Computes the directrix which is the line normal to the XAxis of the hyperbola in the local plane (Z = 0) at a distance d = MajorRadius / e from the center of the hyperbola, where e is the eccentricity of the hyperbola. This line is parallel to the 'YAxis'. The intersection point between the 'Directrix1' and the 'XAxis' is the 'Location' point of the 'Directrix1'. This point is on the positive side of the 'XAxis'.
") Directrix1;
		gp_Ax2d Directrix1();

		/****** gp_Hypr2d::Directrix2 ******/
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

		/****** gp_Hypr2d::Eccentricity ******/
		/****** md5 signature: 6c5e5f3e183d0025b7cd35ab9d28cf3c ******/
		%feature("compactdefaultargs") Eccentricity;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns the eccentricity of the hyperbola (e > 1). If f is the distance between the location of the hyperbola and the Focus1 then the eccentricity e = f / MajorRadius. Raises DomainError if MajorRadius = 0.0.
") Eccentricity;
		double Eccentricity();

		/****** gp_Hypr2d::Focal ******/
		/****** md5 signature: 5d1e5f9e6604ab079b2344fb657cbd30 ******/
		%feature("compactdefaultargs") Focal;
		%feature("autodoc", "Return
-------
double

Description
-----------
Computes the focal distance. It is the distance between the 'Location' of the hyperbola and 'Focus1' or 'Focus2'.
") Focal;
		double Focal();

		/****** gp_Hypr2d::Focus1 ******/
		/****** md5 signature: de82fac3720458da6bfbed15f58916c7 ******/
		%feature("compactdefaultargs") Focus1;
		%feature("autodoc", "Return
-------
gp_Pnt2d

Description
-----------
Returns the first focus of the hyperbola. This focus is on the positive side of the 'XAxis' of the hyperbola.
") Focus1;
		gp_Pnt2d Focus1();

		/****** gp_Hypr2d::Focus2 ******/
		/****** md5 signature: 8e6b7db7add7c05a4664ede21c4b04b3 ******/
		%feature("compactdefaultargs") Focus2;
		%feature("autodoc", "Return
-------
gp_Pnt2d

Description
-----------
Returns the second focus of the hyperbola. This focus is on the negative side of the 'XAxis' of the hyperbola.
") Focus2;
		gp_Pnt2d Focus2();

		/****** gp_Hypr2d::IsDirect ******/
		/****** md5 signature: b020e2b79b290dfefeeb15e69cd69d05 ******/
		%feature("compactdefaultargs") IsDirect;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if the local coordinate system is direct and false in the other case.
") IsDirect;
		bool IsDirect();

		/****** gp_Hypr2d::Location ******/
		/****** md5 signature: 61a7e489acd8b8c2b8c75b6b63b63221 ******/
		%feature("compactdefaultargs") Location;
		%feature("autodoc", "Return
-------
gp_Pnt2d

Description
-----------
Returns the location point of the hyperbola. It is the intersection point between the 'XAxis' and the 'YAxis'.
") Location;
		const gp_Pnt2d Location();

		/****** gp_Hypr2d::MajorRadius ******/
		/****** md5 signature: f3c8e84cfab3df86862664576afed07f ******/
		%feature("compactdefaultargs") MajorRadius;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns the major radius of the hyperbola (it is the radius corresponding to the 'XAxis' of the hyperbola).
") MajorRadius;
		double MajorRadius();

		/****** gp_Hypr2d::MinorRadius ******/
		/****** md5 signature: 2cdcbbe9dc623324c534b7df914ad3c3 ******/
		%feature("compactdefaultargs") MinorRadius;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns the minor radius of the hyperbola (it is the radius corresponding to the 'YAxis' of the hyperbola).
") MinorRadius;
		double MinorRadius();

		/****** gp_Hypr2d::Mirror ******/
		/****** md5 signature: 55ca8745c822fce8b8395ef5348dd658 ******/
		%feature("compactdefaultargs") Mirror;
		%feature("autodoc", "
Parameters
----------
theP: gp_Pnt2d

Return
-------
None

Description
-----------
No available documentation.
") Mirror;
		void Mirror(const gp_Pnt2d & theP);

		/****** gp_Hypr2d::Mirror ******/
		/****** md5 signature: c8b01b19fc436ab187f95301941edbc1 ******/
		%feature("compactdefaultargs") Mirror;
		%feature("autodoc", "
Parameters
----------
theA: gp_Ax2d

Return
-------
None

Description
-----------
No available documentation.
") Mirror;
		void Mirror(const gp_Ax2d & theA);

		/****** gp_Hypr2d::Mirrored ******/
		/****** md5 signature: ea7b556dfe07e164e5e0ccb42ae13521 ******/
		%feature("compactdefaultargs") Mirrored;
		%feature("autodoc", "
Parameters
----------
theP: gp_Pnt2d

Return
-------
gp_Hypr2d

Description
-----------
Performs the symmetrical transformation of an hyperbola with respect to the point theP which is the center of the symmetry.
") Mirrored;
		gp_Hypr2d Mirrored(const gp_Pnt2d & theP);

		/****** gp_Hypr2d::Mirrored ******/
		/****** md5 signature: d8259450e2e9de37fd51dcbb4e970d37 ******/
		%feature("compactdefaultargs") Mirrored;
		%feature("autodoc", "
Parameters
----------
theA: gp_Ax2d

Return
-------
gp_Hypr2d

Description
-----------
Performs the symmetrical transformation of an hyperbola with respect to an axis placement which is the axis of the symmetry.
") Mirrored;
		gp_Hypr2d Mirrored(const gp_Ax2d & theA);

		/****** gp_Hypr2d::OtherBranch ******/
		/****** md5 signature: 02b8cb1379477457504506a8d5baa2af ******/
		%feature("compactdefaultargs") OtherBranch;
		%feature("autodoc", "Return
-------
gp_Hypr2d

Description
-----------
Returns the branch of hyperbola obtained by doing the symmetrical transformation of <self> with respect to the 'YAxis' of <self>.
") OtherBranch;
		gp_Hypr2d OtherBranch();

		/****** gp_Hypr2d::Parameter ******/
		/****** md5 signature: f2f0d3a4c48532483b401ae3d2d5c5fb ******/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns p = (e * e - 1) * MajorRadius where e is the eccentricity of the hyperbola. Raises DomainError if MajorRadius = 0.0.
") Parameter;
		double Parameter();

		/****** gp_Hypr2d::Reverse ******/
		/****** md5 signature: a3a97cdcd6acb50dcac8455358723872 ******/
		%feature("compactdefaultargs") Reverse;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Reverse;
		void Reverse();

		/****** gp_Hypr2d::Reversed ******/
		/****** md5 signature: bc0baf046de32f0e847e745543ae8791 ******/
		%feature("compactdefaultargs") Reversed;
		%feature("autodoc", "Return
-------
gp_Hypr2d

Description
-----------
Reverses the orientation of the local coordinate system of this hyperbola (the 'Y Axis' is reversed). Therefore, the implicit orientation of this hyperbola is reversed. Note: - Reverse assigns the result to this hyperbola, while - Reversed creates a new one.
") Reversed;
		gp_Hypr2d Reversed();

		/****** gp_Hypr2d::Rotate ******/
		/****** md5 signature: 084595cbfff710f953ac0ae91d732bf0 ******/
		%feature("compactdefaultargs") Rotate;
		%feature("autodoc", "
Parameters
----------
theP: gp_Pnt2d
theAng: double

Return
-------
None

Description
-----------
No available documentation.
") Rotate;
		void Rotate(const gp_Pnt2d & theP, const double theAng);

		/****** gp_Hypr2d::Rotated ******/
		/****** md5 signature: f90dae5a0e2a02f12dc8ea6f2abd9b2d ******/
		%feature("compactdefaultargs") Rotated;
		%feature("autodoc", "
Parameters
----------
theP: gp_Pnt2d
theAng: double

Return
-------
gp_Hypr2d

Description
-----------
Rotates an hyperbola. theP is the center of the rotation. theAng is the angular value of the rotation in radians.
") Rotated;
		gp_Hypr2d Rotated(const gp_Pnt2d & theP, const double theAng);

		/****** gp_Hypr2d::Scale ******/
		/****** md5 signature: ce786424d6b372a402b20bab4c859bd5 ******/
		%feature("compactdefaultargs") Scale;
		%feature("autodoc", "
Parameters
----------
theP: gp_Pnt2d
theS: double

Return
-------
None

Description
-----------
No available documentation.
") Scale;
		void Scale(const gp_Pnt2d & theP, const double theS);

		/****** gp_Hypr2d::Scaled ******/
		/****** md5 signature: 56a21120a5d96a27f802ed2904064274 ******/
		%feature("compactdefaultargs") Scaled;
		%feature("autodoc", "
Parameters
----------
theP: gp_Pnt2d
theS: double

Return
-------
gp_Hypr2d

Description
-----------
Scales an hyperbola. <theS> is the scaling value. If <theS> is positive only the location point is modified. But if <theS> is negative the 'XAxis' is reversed and the 'YAxis' too.
") Scaled;
		gp_Hypr2d Scaled(const gp_Pnt2d & theP, const double theS);

		/****** gp_Hypr2d::SetAxis ******/
		/****** md5 signature: 5a80f392a0f25e50c7bd9a5c5fce8259 ******/
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
Modifies this hyperbola, by redefining its local coordinate system so that it becomes theA.
") SetAxis;
		void SetAxis(const gp_Ax22d & theA);

		/****** gp_Hypr2d::SetLocation ******/
		/****** md5 signature: 480b751d2165373d2617a13d19b91d48 ******/
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
Modifies this hyperbola, by redefining its local coordinate system so that its origin becomes theP.
") SetLocation;
		void SetLocation(const gp_Pnt2d & theP);

		/****** gp_Hypr2d::SetMajorRadius ******/
		/****** md5 signature: 5eff03578088313d850e2a4c6dac1d86 ******/
		%feature("compactdefaultargs") SetMajorRadius;
		%feature("autodoc", "
Parameters
----------
theMajorRadius: double

Return
-------
None

Description
-----------
Modifies the major or minor radius of this hyperbola. Exceptions Standard_ConstructionError if theMajorRadius or MinorRadius is negative.
") SetMajorRadius;
		void SetMajorRadius(const double theMajorRadius);

		/****** gp_Hypr2d::SetMinorRadius ******/
		/****** md5 signature: dfefc317649a676db76eca5eab95531a ******/
		%feature("compactdefaultargs") SetMinorRadius;
		%feature("autodoc", "
Parameters
----------
theMinorRadius: double

Return
-------
None

Description
-----------
Modifies the major or minor radius of this hyperbola. Exceptions Standard_ConstructionError if MajorRadius or theMinorRadius is negative.
") SetMinorRadius;
		void SetMinorRadius(const double theMinorRadius);

		/****** gp_Hypr2d::SetXAxis ******/
		/****** md5 signature: 0953d475cb538bb151666a237ed170af ******/
		%feature("compactdefaultargs") SetXAxis;
		%feature("autodoc", "
Parameters
----------
theA: gp_Ax2d

Return
-------
None

Description
-----------
Changes the major axis of the hyperbola. The minor axis is recomputed and the location of the hyperbola too.
") SetXAxis;
		void SetXAxis(const gp_Ax2d & theA);

		/****** gp_Hypr2d::SetYAxis ******/
		/****** md5 signature: 18c66c982e1061a0c18175947bc7cbc8 ******/
		%feature("compactdefaultargs") SetYAxis;
		%feature("autodoc", "
Parameters
----------
theA: gp_Ax2d

Return
-------
None

Description
-----------
Changes the minor axis of the hyperbola.The minor axis is recomputed and the location of the hyperbola too.
") SetYAxis;
		void SetYAxis(const gp_Ax2d & theA);

		/****** gp_Hypr2d::Transform ******/
		/****** md5 signature: 94f8045e6a4465708e872ec10cb3f4d1 ******/
		%feature("compactdefaultargs") Transform;
		%feature("autodoc", "
Parameters
----------
theT: gp_Trsf2d

Return
-------
None

Description
-----------
No available documentation.
") Transform;
		void Transform(const gp_Trsf2d & theT);

		/****** gp_Hypr2d::Transformed ******/
		/****** md5 signature: 878c2d6501db9a557516565338c992f7 ******/
		%feature("compactdefaultargs") Transformed;
		%feature("autodoc", "
Parameters
----------
theT: gp_Trsf2d

Return
-------
gp_Hypr2d

Description
-----------
Transforms an hyperbola with the transformation theT from class Trsf2d.
") Transformed;
		gp_Hypr2d Transformed(const gp_Trsf2d & theT);

		/****** gp_Hypr2d::Translate ******/
		/****** md5 signature: db1336b52b0bf528c543a448adb435f1 ******/
		%feature("compactdefaultargs") Translate;
		%feature("autodoc", "
Parameters
----------
theV: gp_Vec2d

Return
-------
None

Description
-----------
No available documentation.
") Translate;
		void Translate(const gp_Vec2d & theV);

		/****** gp_Hypr2d::Translate ******/
		/****** md5 signature: fbfb79b99757b462451a758b25d06d71 ******/
		%feature("compactdefaultargs") Translate;
		%feature("autodoc", "
Parameters
----------
theP1: gp_Pnt2d
theP2: gp_Pnt2d

Return
-------
None

Description
-----------
No available documentation.
") Translate;
		void Translate(const gp_Pnt2d & theP1, const gp_Pnt2d & theP2);

		/****** gp_Hypr2d::Translated ******/
		/****** md5 signature: a0f37db88f9d7b4a1f24a9c75a6e080b ******/
		%feature("compactdefaultargs") Translated;
		%feature("autodoc", "
Parameters
----------
theV: gp_Vec2d

Return
-------
gp_Hypr2d

Description
-----------
Translates an hyperbola in the direction of the vector theV. The magnitude of the translation is the vector's magnitude.
") Translated;
		gp_Hypr2d Translated(const gp_Vec2d & theV);

		/****** gp_Hypr2d::Translated ******/
		/****** md5 signature: f35171b238ff399d71e2c2b67f421b55 ******/
		%feature("compactdefaultargs") Translated;
		%feature("autodoc", "
Parameters
----------
theP1: gp_Pnt2d
theP2: gp_Pnt2d

Return
-------
gp_Hypr2d

Description
-----------
Translates an hyperbola from the point theP1 to the point theP2.
") Translated;
		gp_Hypr2d Translated(const gp_Pnt2d & theP1, const gp_Pnt2d & theP2);

		/****** gp_Hypr2d::XAxis ******/
		/****** md5 signature: 83955698d6369777f193b9652c25173b ******/
		%feature("compactdefaultargs") XAxis;
		%feature("autodoc", "Return
-------
gp_Ax2d

Description
-----------
Computes an axis whose - the origin is the center of this hyperbola, and - the unit vector is the 'X Direction' or 'Y Direction' respectively of the local coordinate system of this hyperbola Returns the major axis of the hyperbola.
") XAxis;
		gp_Ax2d XAxis();

		/****** gp_Hypr2d::YAxis ******/
		/****** md5 signature: a7022bd581881d0a6f0955733fa39838 ******/
		%feature("compactdefaultargs") YAxis;
		%feature("autodoc", "Return
-------
gp_Ax2d

Description
-----------
Computes an axis whose - the origin is the center of this hyperbola, and - the unit vector is the 'X Direction' or 'Y Direction' respectively of the local coordinate system of this hyperbola Returns the minor axis of the hyperbola.
") YAxis;
		gp_Ax2d YAxis();

};



%extend gp_Hypr2d {
%pythoncode {
    def __getstate__(self):
        return self.DumpJson()
    }
};

%extend gp_Hypr2d {
%pythoncode {
    def __setstate__(self, state):
        inst = gp_Hypr2d()
        if inst.InitFromJson(state):
            self.this = inst.this
        else:
            raise IOError('Failed to set state of gp_Hypr2d')
    }
};
%extend gp_Hypr2d {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************
* class gp_Lin *
***************/
class gp_Lin {
	public:
		/****** gp_Lin::gp_Lin ******/
		/****** md5 signature: a720ce68eb96359779aa4622995476fd ******/
		%feature("compactdefaultargs") gp_Lin;
		%feature("autodoc", "Return
-------
None

Description
-----------
Creates a Line corresponding to Z axis of the reference coordinate system.
") gp_Lin;
		 gp_Lin();

		/****** gp_Lin::gp_Lin ******/
		/****** md5 signature: a680df9fa4655237edb1ee59c3798ef4 ******/
		%feature("compactdefaultargs") gp_Lin;
		%feature("autodoc", "
Parameters
----------
theA1: gp_Ax1

Return
-------
None

Description
-----------
Creates a line defined by axis theA1.
") gp_Lin;
		 gp_Lin(const gp_Ax1 & theA1);

		/****** gp_Lin::gp_Lin ******/
		/****** md5 signature: b5997df3a38e912f25c2c784bf96b2ed ******/
		%feature("compactdefaultargs") gp_Lin;
		%feature("autodoc", "
Parameters
----------
theP: gp_Pnt
theV: gp_Dir

Return
-------
None

Description
-----------
Creates a line passing through point theP and parallel to vector theV (theP and theV are, respectively, the origin and the unit vector of the positioning axis of the line).
") gp_Lin;
		 gp_Lin(const gp_Pnt & theP, const gp_Dir & theV);

		/****** gp_Lin::Angle ******/
		/****** md5 signature: 8eef381ab2f56b4254ef7bbb218b6e36 ******/
		%feature("compactdefaultargs") Angle;
		%feature("autodoc", "
Parameters
----------
theOther: gp_Lin

Return
-------
double

Description
-----------
Computes the angle between two lines in radians.
") Angle;
		double Angle(const gp_Lin & theOther);

		/****** gp_Lin::Contains ******/
		/****** md5 signature: a776f893327aa6bb589da12f738c27c2 ******/
		%feature("compactdefaultargs") Contains;
		%feature("autodoc", "
Parameters
----------
theP: gp_Pnt
theLinearTolerance: double

Return
-------
bool

Description
-----------
Returns true if this line contains the point theP, that is, if the distance between point theP and this line is less than or equal to theLinearTolerance..
") Contains;
		bool Contains(const gp_Pnt & theP, const double theLinearTolerance);

		/****** gp_Lin::Direction ******/
		/****** md5 signature: 52b593a77853d9d22e96443cc8f6fb8d ******/
		%feature("compactdefaultargs") Direction;
		%feature("autodoc", "Return
-------
gp_Dir

Description
-----------
Returns the direction of the line.
") Direction;
		const gp_Dir Direction();

		/****** gp_Lin::Distance ******/
		/****** md5 signature: e1f5d0b12060bde2a85d196e2daf30f6 ******/
		%feature("compactdefaultargs") Distance;
		%feature("autodoc", "
Parameters
----------
theP: gp_Pnt

Return
-------
double

Description
-----------
Computes the distance between <self> and the point theP.
") Distance;
		double Distance(const gp_Pnt & theP);

		/****** gp_Lin::Distance ******/
		/****** md5 signature: 94c05223e88b6a719d4bff8ada6d65cb ******/
		%feature("compactdefaultargs") Distance;
		%feature("autodoc", "
Parameters
----------
theOther: gp_Lin

Return
-------
double

Description
-----------
Computes the distance between two lines.
") Distance;
		double Distance(const gp_Lin & theOther);

		/****** gp_Lin::Location ******/
		/****** md5 signature: 2c3e536bdb11b2c2c46fc19fd8a6c569 ******/
		%feature("compactdefaultargs") Location;
		%feature("autodoc", "Return
-------
gp_Pnt

Description
-----------
Returns the location point (origin) of the line.
") Location;
		const gp_Pnt Location();

		/****** gp_Lin::Mirror ******/
		/****** md5 signature: 0f424be72f12474fe3ff290168029c4e ******/
		%feature("compactdefaultargs") Mirror;
		%feature("autodoc", "
Parameters
----------
theP: gp_Pnt

Return
-------
None

Description
-----------
No available documentation.
") Mirror;
		void Mirror(const gp_Pnt & theP);

		/****** gp_Lin::Mirror ******/
		/****** md5 signature: f508bc9f1879a959242732c259593a0a ******/
		%feature("compactdefaultargs") Mirror;
		%feature("autodoc", "
Parameters
----------
theA1: gp_Ax1

Return
-------
None

Description
-----------
No available documentation.
") Mirror;
		void Mirror(const gp_Ax1 & theA1);

		/****** gp_Lin::Mirror ******/
		/****** md5 signature: ba516d9e4a2b6af0ed16d37de915dd83 ******/
		%feature("compactdefaultargs") Mirror;
		%feature("autodoc", "
Parameters
----------
theA2: gp_Ax2

Return
-------
None

Description
-----------
No available documentation.
") Mirror;
		void Mirror(const gp_Ax2 & theA2);

		/****** gp_Lin::Mirrored ******/
		/****** md5 signature: 2feb0ad22a7e64c0c28c2867103e21ff ******/
		%feature("compactdefaultargs") Mirrored;
		%feature("autodoc", "
Parameters
----------
theP: gp_Pnt

Return
-------
gp_Lin

Description
-----------
Performs the symmetrical transformation of a line with respect to the point theP which is the center of the symmetry.
") Mirrored;
		gp_Lin Mirrored(const gp_Pnt & theP);

		/****** gp_Lin::Mirrored ******/
		/****** md5 signature: 90c707f5e4ccdf91aee45c9aa80b8ac4 ******/
		%feature("compactdefaultargs") Mirrored;
		%feature("autodoc", "
Parameters
----------
theA1: gp_Ax1

Return
-------
gp_Lin

Description
-----------
Performs the symmetrical transformation of a line with respect to an axis placement which is the axis of the symmetry.
") Mirrored;
		gp_Lin Mirrored(const gp_Ax1 & theA1);

		/****** gp_Lin::Mirrored ******/
		/****** md5 signature: e15f85b026119fa1449f3e2c30cfbf2a ******/
		%feature("compactdefaultargs") Mirrored;
		%feature("autodoc", "
Parameters
----------
theA2: gp_Ax2

Return
-------
gp_Lin

Description
-----------
Performs the symmetrical transformation of a line with respect to a plane. The axis placement <theA2> locates the plane of the symmetry: (Location, XDirection, YDirection).
") Mirrored;
		gp_Lin Mirrored(const gp_Ax2 & theA2);

		/****** gp_Lin::Normal ******/
		/****** md5 signature: 818fa3f581256ddc238570a0b3a2759c ******/
		%feature("compactdefaultargs") Normal;
		%feature("autodoc", "
Parameters
----------
theP: gp_Pnt

Return
-------
gp_Lin

Description
-----------
Computes the line normal to the direction of <self>, passing through the point theP. Raises ConstructionError if the distance between <self> and the point theP is lower or equal to Resolution from gp because there is an infinity of solutions in 3D space.
") Normal;
		gp_Lin Normal(const gp_Pnt & theP);

		/****** gp_Lin::Position ******/
		/****** md5 signature: c0bc8e31c8a76f8cef5c22f8586c9855 ******/
		%feature("compactdefaultargs") Position;
		%feature("autodoc", "Return
-------
gp_Ax1

Description
-----------
Returns the axis placement one axis with the same location and direction as <self>.
") Position;
		const gp_Ax1 Position();

		/****** gp_Lin::Reverse ******/
		/****** md5 signature: 229f8663d04c43240c56ed238a384b26 ******/
		%feature("compactdefaultargs") Reverse;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Reverse;
		void Reverse();

		/****** gp_Lin::Reversed ******/
		/****** md5 signature: 635f9f122253314326501a20c3f51eb8 ******/
		%feature("compactdefaultargs") Reversed;
		%feature("autodoc", "Return
-------
gp_Lin

Description
-----------
Reverses the direction of the line. Note: - Reverse assigns the result to this line, while - Reversed creates a new one.
") Reversed;
		gp_Lin Reversed();

		/****** gp_Lin::Rotate ******/
		/****** md5 signature: 652dfbf621c2c092ff5b68d608de4634 ******/
		%feature("compactdefaultargs") Rotate;
		%feature("autodoc", "
Parameters
----------
theA1: gp_Ax1
theAng: double

Return
-------
None

Description
-----------
No available documentation.
") Rotate;
		void Rotate(const gp_Ax1 & theA1, const double theAng);

		/****** gp_Lin::Rotated ******/
		/****** md5 signature: e024c74d0a2d3e4344e20161342349c6 ******/
		%feature("compactdefaultargs") Rotated;
		%feature("autodoc", "
Parameters
----------
theA1: gp_Ax1
theAng: double

Return
-------
gp_Lin

Description
-----------
Rotates a line. A1 is the axis of the rotation. Ang is the angular value of the rotation in radians.
") Rotated;
		gp_Lin Rotated(const gp_Ax1 & theA1, const double theAng);

		/****** gp_Lin::Scale ******/
		/****** md5 signature: 9fa53937842c668acd0d1cc256eb2732 ******/
		%feature("compactdefaultargs") Scale;
		%feature("autodoc", "
Parameters
----------
theP: gp_Pnt
theS: double

Return
-------
None

Description
-----------
No available documentation.
") Scale;
		void Scale(const gp_Pnt & theP, const double theS);

		/****** gp_Lin::Scaled ******/
		/****** md5 signature: e68307195257415f2b57cb2b85887016 ******/
		%feature("compactdefaultargs") Scaled;
		%feature("autodoc", "
Parameters
----------
theP: gp_Pnt
theS: double

Return
-------
gp_Lin

Description
-----------
Scales a line. theS is the scaling value. The 'Location' point (origin) of the line is modified. The 'Direction' is reversed if the scale is negative.
") Scaled;
		gp_Lin Scaled(const gp_Pnt & theP, const double theS);

		/****** gp_Lin::SetDirection ******/
		/****** md5 signature: ecfbd4ec664daf37cf5941e10ecef842 ******/
		%feature("compactdefaultargs") SetDirection;
		%feature("autodoc", "
Parameters
----------
theV: gp_Dir

Return
-------
None

Description
-----------
Changes the direction of the line.
") SetDirection;
		void SetDirection(const gp_Dir & theV);

		/****** gp_Lin::SetLocation ******/
		/****** md5 signature: cdddcf5cbfcb37a25a0fad06f827f527 ******/
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
Changes the location point (origin) of the line.
") SetLocation;
		void SetLocation(const gp_Pnt & theP);

		/****** gp_Lin::SetPosition ******/
		/****** md5 signature: 14535c216286c17ec9db2503974649e9 ******/
		%feature("compactdefaultargs") SetPosition;
		%feature("autodoc", "
Parameters
----------
theA1: gp_Ax1

Return
-------
None

Description
-----------
Complete redefinition of the line. The 'Location' point of <theA1> is the origin of the line. The 'Direction' of <theA1> is the direction of the line.
") SetPosition;
		void SetPosition(const gp_Ax1 & theA1);

		/****** gp_Lin::SquareDistance ******/
		/****** md5 signature: 1ef47697fc570d750b7d08bdafeba2e0 ******/
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "
Parameters
----------
theP: gp_Pnt

Return
-------
double

Description
-----------
Computes the square distance between <self> and the point theP.
") SquareDistance;
		double SquareDistance(const gp_Pnt & theP);

		/****** gp_Lin::SquareDistance ******/
		/****** md5 signature: 1ce8b12e1966e89e3a713da8a04cadbd ******/
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "
Parameters
----------
theOther: gp_Lin

Return
-------
double

Description
-----------
Computes the square distance between two lines.
") SquareDistance;
		double SquareDistance(const gp_Lin & theOther);

		/****** gp_Lin::Transform ******/
		/****** md5 signature: ad39e75f28af84e2a27f2cfbe322b0a3 ******/
		%feature("compactdefaultargs") Transform;
		%feature("autodoc", "
Parameters
----------
theT: gp_Trsf

Return
-------
None

Description
-----------
No available documentation.
") Transform;
		void Transform(const gp_Trsf & theT);

		/****** gp_Lin::Transformed ******/
		/****** md5 signature: 486f47c62db9cc58376c1983e5450c71 ******/
		%feature("compactdefaultargs") Transformed;
		%feature("autodoc", "
Parameters
----------
theT: gp_Trsf

Return
-------
gp_Lin

Description
-----------
Transforms a line with the transformation theT from class Trsf.
") Transformed;
		gp_Lin Transformed(const gp_Trsf & theT);

		/****** gp_Lin::Translate ******/
		/****** md5 signature: 8ae07d4c829c1eef2e7708ef5390638b ******/
		%feature("compactdefaultargs") Translate;
		%feature("autodoc", "
Parameters
----------
theV: gp_Vec

Return
-------
None

Description
-----------
No available documentation.
") Translate;
		void Translate(const gp_Vec & theV);

		/****** gp_Lin::Translate ******/
		/****** md5 signature: 279c13d6194eb867625753d756d110ab ******/
		%feature("compactdefaultargs") Translate;
		%feature("autodoc", "
Parameters
----------
theP1: gp_Pnt
theP2: gp_Pnt

Return
-------
None

Description
-----------
No available documentation.
") Translate;
		void Translate(const gp_Pnt & theP1, const gp_Pnt & theP2);

		/****** gp_Lin::Translated ******/
		/****** md5 signature: 2a99881eba0e7d7324ceaad23b01291f ******/
		%feature("compactdefaultargs") Translated;
		%feature("autodoc", "
Parameters
----------
theV: gp_Vec

Return
-------
gp_Lin

Description
-----------
Translates a line in the direction of the vector theV. The magnitude of the translation is the vector's magnitude.
") Translated;
		gp_Lin Translated(const gp_Vec & theV);

		/****** gp_Lin::Translated ******/
		/****** md5 signature: e2521c63a8d71089a205573103ed6143 ******/
		%feature("compactdefaultargs") Translated;
		%feature("autodoc", "
Parameters
----------
theP1: gp_Pnt
theP2: gp_Pnt

Return
-------
gp_Lin

Description
-----------
Translates a line from the point theP1 to the point theP2.
") Translated;
		gp_Lin Translated(const gp_Pnt & theP1, const gp_Pnt & theP2);

};



%extend gp_Lin {
%pythoncode {
    def __getstate__(self):
        return self.DumpJson()
    }
};

%extend gp_Lin {
%pythoncode {
    def __setstate__(self, state):
        inst = gp_Lin()
        if inst.InitFromJson(state):
            self.this = inst.this
        else:
            raise IOError('Failed to set state of gp_Lin')
    }
};
%extend gp_Lin {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************
* class gp_Lin2d *
*****************/
class gp_Lin2d {
	public:
		/****** gp_Lin2d::gp_Lin2d ******/
		/****** md5 signature: 9db72bd188d5494096c06614b2d16bda ******/
		%feature("compactdefaultargs") gp_Lin2d;
		%feature("autodoc", "Return
-------
None

Description
-----------
Creates a Line corresponding to X axis of the reference coordinate system.
") gp_Lin2d;
		 gp_Lin2d();

		/****** gp_Lin2d::gp_Lin2d ******/
		/****** md5 signature: 64d16318e31d059d8190f92d1d0bef68 ******/
		%feature("compactdefaultargs") gp_Lin2d;
		%feature("autodoc", "
Parameters
----------
theA: gp_Ax2d

Return
-------
None

Description
-----------
Creates a line located with theA.
") gp_Lin2d;
		 gp_Lin2d(const gp_Ax2d & theA);

		/****** gp_Lin2d::gp_Lin2d ******/
		/****** md5 signature: 2ec1580b0f13389eff5d5cf4b6b9aabe ******/
		%feature("compactdefaultargs") gp_Lin2d;
		%feature("autodoc", "
Parameters
----------
theP: gp_Pnt2d
theV: gp_Dir2d

Return
-------
None

Description
-----------
<theP> is the location point (origin) of the line and <theV> is the direction of the line.
") gp_Lin2d;
		 gp_Lin2d(const gp_Pnt2d & theP, const gp_Dir2d & theV);

		/****** gp_Lin2d::gp_Lin2d ******/
		/****** md5 signature: 26d8787b056e390b7f372c40aacdbfc5 ******/
		%feature("compactdefaultargs") gp_Lin2d;
		%feature("autodoc", "
Parameters
----------
theA: double
theB: double
theC: double

Return
-------
None

Description
-----------
Creates the line from the equation theA*X + theB*Y + theC = 0.0 Raises ConstructionError if std::sqrt(theA*theA + theB*theB) <= Resolution from gp. Raised if std::sqrt(theA*theA + theB*theB) <= Resolution from gp.
") gp_Lin2d;
		 gp_Lin2d(const double theA, const double theB, const double theC);

		/****** gp_Lin2d::Angle ******/
		/****** md5 signature: e21846d09a912485283101de0cf59b0b ******/
		%feature("compactdefaultargs") Angle;
		%feature("autodoc", "
Parameters
----------
theOther: gp_Lin2d

Return
-------
double

Description
-----------
Computes the angle between two lines in radians.
") Angle;
		double Angle(const gp_Lin2d & theOther);

		/****** gp_Lin2d::Coefficients ******/
		/****** md5 signature: d81b375cd6ea85621428d20646635a45 ******/
		%feature("compactdefaultargs") Coefficients;
		%feature("autodoc", "
Parameters
----------

Return
-------
theA: double
theB: double
theC: double

Description
-----------
Returns the normalized coefficients of the line: theA * X + theB * Y + theC = 0.
") Coefficients;
		void Coefficients(Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** gp_Lin2d::Contains ******/
		/****** md5 signature: b2edf068c3bcc21858baa2786789c5f4 ******/
		%feature("compactdefaultargs") Contains;
		%feature("autodoc", "
Parameters
----------
theP: gp_Pnt2d
theLinearTolerance: double

Return
-------
bool

Description
-----------
Returns true if this line contains the point theP, that is, if the distance between point theP and this line is less than or equal to theLinearTolerance.
") Contains;
		bool Contains(const gp_Pnt2d & theP, const double theLinearTolerance);

		/****** gp_Lin2d::Direction ******/
		/****** md5 signature: 42aa5ac2d9cfd7cf75f22d42d8d3d6d6 ******/
		%feature("compactdefaultargs") Direction;
		%feature("autodoc", "Return
-------
gp_Dir2d

Description
-----------
Returns the direction of the line.
") Direction;
		const gp_Dir2d Direction();

		/****** gp_Lin2d::Distance ******/
		/****** md5 signature: 31788fec6e87fe3f164f085366fb6ca3 ******/
		%feature("compactdefaultargs") Distance;
		%feature("autodoc", "
Parameters
----------
theP: gp_Pnt2d

Return
-------
double

Description
-----------
Computes the distance between <self> and the point <theP>.
") Distance;
		double Distance(const gp_Pnt2d & theP);

		/****** gp_Lin2d::Distance ******/
		/****** md5 signature: 5eff73af4f7f8280011fd2ad9b335fd7 ******/
		%feature("compactdefaultargs") Distance;
		%feature("autodoc", "
Parameters
----------
theOther: gp_Lin2d

Return
-------
double

Description
-----------
Computes the distance between two lines.
") Distance;
		double Distance(const gp_Lin2d & theOther);

		/****** gp_Lin2d::Location ******/
		/****** md5 signature: 61a7e489acd8b8c2b8c75b6b63b63221 ******/
		%feature("compactdefaultargs") Location;
		%feature("autodoc", "Return
-------
gp_Pnt2d

Description
-----------
Returns the location point (origin) of the line.
") Location;
		const gp_Pnt2d Location();

		/****** gp_Lin2d::Mirror ******/
		/****** md5 signature: 55ca8745c822fce8b8395ef5348dd658 ******/
		%feature("compactdefaultargs") Mirror;
		%feature("autodoc", "
Parameters
----------
theP: gp_Pnt2d

Return
-------
None

Description
-----------
No available documentation.
") Mirror;
		void Mirror(const gp_Pnt2d & theP);

		/****** gp_Lin2d::Mirror ******/
		/****** md5 signature: c8b01b19fc436ab187f95301941edbc1 ******/
		%feature("compactdefaultargs") Mirror;
		%feature("autodoc", "
Parameters
----------
theA: gp_Ax2d

Return
-------
None

Description
-----------
No available documentation.
") Mirror;
		void Mirror(const gp_Ax2d & theA);

		/****** gp_Lin2d::Mirrored ******/
		/****** md5 signature: 1a4168056a7d237da0e277a067b4a687 ******/
		%feature("compactdefaultargs") Mirrored;
		%feature("autodoc", "
Parameters
----------
theP: gp_Pnt2d

Return
-------
gp_Lin2d

Description
-----------
Performs the symmetrical transformation of a line with respect to the point <theP> which is the center of the symmetry.
") Mirrored;
		gp_Lin2d Mirrored(const gp_Pnt2d & theP);

		/****** gp_Lin2d::Mirrored ******/
		/****** md5 signature: e8984d62ea8a543c0ca46075738dd080 ******/
		%feature("compactdefaultargs") Mirrored;
		%feature("autodoc", "
Parameters
----------
theA: gp_Ax2d

Return
-------
gp_Lin2d

Description
-----------
Performs the symmetrical transformation of a line with respect to an axis placement which is the axis of the symmetry.
") Mirrored;
		gp_Lin2d Mirrored(const gp_Ax2d & theA);

		/****** gp_Lin2d::Normal ******/
		/****** md5 signature: 7df040095cbdbdb6d959e592def4510f ******/
		%feature("compactdefaultargs") Normal;
		%feature("autodoc", "
Parameters
----------
theP: gp_Pnt2d

Return
-------
gp_Lin2d

Description
-----------
Computes the line normal to the direction of <self>, passing through the point <theP>.
") Normal;
		gp_Lin2d Normal(const gp_Pnt2d & theP);

		/****** gp_Lin2d::Position ******/
		/****** md5 signature: c0f753eb38642d2736542ad8af23319f ******/
		%feature("compactdefaultargs") Position;
		%feature("autodoc", "Return
-------
gp_Ax2d

Description
-----------
Returns the axis placement one axis with the same location and direction as <self>.
") Position;
		const gp_Ax2d Position();

		/****** gp_Lin2d::Reverse ******/
		/****** md5 signature: 229f8663d04c43240c56ed238a384b26 ******/
		%feature("compactdefaultargs") Reverse;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Reverse;
		void Reverse();

		/****** gp_Lin2d::Reversed ******/
		/****** md5 signature: aa5d3f1725902c0606cdb3b75c922edb ******/
		%feature("compactdefaultargs") Reversed;
		%feature("autodoc", "Return
-------
gp_Lin2d

Description
-----------
Reverses the positioning axis of this line. Note: - Reverse assigns the result to this line, while - Reversed creates a new one.
") Reversed;
		gp_Lin2d Reversed();

		/****** gp_Lin2d::Rotate ******/
		/****** md5 signature: 084595cbfff710f953ac0ae91d732bf0 ******/
		%feature("compactdefaultargs") Rotate;
		%feature("autodoc", "
Parameters
----------
theP: gp_Pnt2d
theAng: double

Return
-------
None

Description
-----------
No available documentation.
") Rotate;
		void Rotate(const gp_Pnt2d & theP, const double theAng);

		/****** gp_Lin2d::Rotated ******/
		/****** md5 signature: 5a065671e96bbb23959de4e4610b166b ******/
		%feature("compactdefaultargs") Rotated;
		%feature("autodoc", "
Parameters
----------
theP: gp_Pnt2d
theAng: double

Return
-------
gp_Lin2d

Description
-----------
Rotates a line. theP is the center of the rotation. theAng is the angular value of the rotation in radians.
") Rotated;
		gp_Lin2d Rotated(const gp_Pnt2d & theP, const double theAng);

		/****** gp_Lin2d::Scale ******/
		/****** md5 signature: e0a38de6d60ac9adbec604e6435b84f6 ******/
		%feature("compactdefaultargs") Scale;
		%feature("autodoc", "
Parameters
----------
theP: gp_Pnt2d
theS: double

Return
-------
None

Description
-----------
No available documentation.
") Scale;
		void Scale(const gp_Pnt2d & theP, const double theS);

		/****** gp_Lin2d::Scaled ******/
		/****** md5 signature: 872dec15d9058f0a4172a5fe7ea66e0b ******/
		%feature("compactdefaultargs") Scaled;
		%feature("autodoc", "
Parameters
----------
theP: gp_Pnt2d
theS: double

Return
-------
gp_Lin2d

Description
-----------
Scales a line. theS is the scaling value. Only the origin of the line is modified.
") Scaled;
		gp_Lin2d Scaled(const gp_Pnt2d & theP, const double theS);

		/****** gp_Lin2d::SetDirection ******/
		/****** md5 signature: ca2779f8ad7c9e7dbd15d9006e40953e ******/
		%feature("compactdefaultargs") SetDirection;
		%feature("autodoc", "
Parameters
----------
theV: gp_Dir2d

Return
-------
None

Description
-----------
Changes the direction of the line.
") SetDirection;
		void SetDirection(const gp_Dir2d & theV);

		/****** gp_Lin2d::SetLocation ******/
		/****** md5 signature: 480b751d2165373d2617a13d19b91d48 ******/
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
Changes the origin of the line.
") SetLocation;
		void SetLocation(const gp_Pnt2d & theP);

		/****** gp_Lin2d::SetPosition ******/
		/****** md5 signature: d8bcc99631ed1abd3a41ff4931e54d9f ******/
		%feature("compactdefaultargs") SetPosition;
		%feature("autodoc", "
Parameters
----------
theA: gp_Ax2d

Return
-------
None

Description
-----------
Complete redefinition of the line. The 'Location' point of <theA> is the origin of the line. The 'Direction' of <theA> is the direction of the line.
") SetPosition;
		void SetPosition(const gp_Ax2d & theA);

		/****** gp_Lin2d::SquareDistance ******/
		/****** md5 signature: f47ceaf805976a1c7adc5c297e44fd3d ******/
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "
Parameters
----------
theP: gp_Pnt2d

Return
-------
double

Description
-----------
Computes the square distance between <self> and the point <theP>.
") SquareDistance;
		double SquareDistance(const gp_Pnt2d & theP);

		/****** gp_Lin2d::SquareDistance ******/
		/****** md5 signature: bc71304b03144de879b3b143cec6d235 ******/
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "
Parameters
----------
theOther: gp_Lin2d

Return
-------
double

Description
-----------
Computes the square distance between two lines.
") SquareDistance;
		double SquareDistance(const gp_Lin2d & theOther);

		/****** gp_Lin2d::Transform ******/
		/****** md5 signature: 8246669b4c8ab833de75a03307694404 ******/
		%feature("compactdefaultargs") Transform;
		%feature("autodoc", "
Parameters
----------
theT: gp_Trsf2d

Return
-------
None

Description
-----------
No available documentation.
") Transform;
		void Transform(const gp_Trsf2d & theT);

		/****** gp_Lin2d::Transformed ******/
		/****** md5 signature: 38eebb8d38cc339c35f62232dcdc0743 ******/
		%feature("compactdefaultargs") Transformed;
		%feature("autodoc", "
Parameters
----------
theT: gp_Trsf2d

Return
-------
gp_Lin2d

Description
-----------
Transforms a line with the transformation theT from class Trsf2d.
") Transformed;
		gp_Lin2d Transformed(const gp_Trsf2d & theT);

		/****** gp_Lin2d::Translate ******/
		/****** md5 signature: db1336b52b0bf528c543a448adb435f1 ******/
		%feature("compactdefaultargs") Translate;
		%feature("autodoc", "
Parameters
----------
theV: gp_Vec2d

Return
-------
None

Description
-----------
No available documentation.
") Translate;
		void Translate(const gp_Vec2d & theV);

		/****** gp_Lin2d::Translate ******/
		/****** md5 signature: fbfb79b99757b462451a758b25d06d71 ******/
		%feature("compactdefaultargs") Translate;
		%feature("autodoc", "
Parameters
----------
theP1: gp_Pnt2d
theP2: gp_Pnt2d

Return
-------
None

Description
-----------
No available documentation.
") Translate;
		void Translate(const gp_Pnt2d & theP1, const gp_Pnt2d & theP2);

		/****** gp_Lin2d::Translated ******/
		/****** md5 signature: 13d7e9af6ba575a4f7a06d8721115b59 ******/
		%feature("compactdefaultargs") Translated;
		%feature("autodoc", "
Parameters
----------
theV: gp_Vec2d

Return
-------
gp_Lin2d

Description
-----------
Translates a line in the direction of the vector theV. The magnitude of the translation is the vector's magnitude.
") Translated;
		gp_Lin2d Translated(const gp_Vec2d & theV);

		/****** gp_Lin2d::Translated ******/
		/****** md5 signature: 356bcc906c2f989b5a8fcf706a60157c ******/
		%feature("compactdefaultargs") Translated;
		%feature("autodoc", "
Parameters
----------
theP1: gp_Pnt2d
theP2: gp_Pnt2d

Return
-------
gp_Lin2d

Description
-----------
Translates a line from the point theP1 to the point theP2.
") Translated;
		gp_Lin2d Translated(const gp_Pnt2d & theP1, const gp_Pnt2d & theP2);

};



%extend gp_Lin2d {
%pythoncode {
    def __getstate__(self):
        return self.DumpJson()
    }
};

%extend gp_Lin2d {
%pythoncode {
    def __setstate__(self, state):
        inst = gp_Lin2d()
        if inst.InitFromJson(state):
            self.this = inst.this
        else:
            raise IOError('Failed to set state of gp_Lin2d')
    }
};
%extend gp_Lin2d {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************
* class gp_Mat *
***************/
class gp_Mat {
	public:
		/****** gp_Mat::gp_Mat ******/
		/****** md5 signature: 24f06c0aa5f82912ec53d776017aeae5 ******/
		%feature("compactdefaultargs") gp_Mat;
		%feature("autodoc", "Return
-------
None

Description
-----------
Creates a matrix with null coefficients.
") gp_Mat;
		 gp_Mat();

		/****** gp_Mat::gp_Mat ******/
		/****** md5 signature: 391379578c447df7694a458c01d62ab2 ******/
		%feature("compactdefaultargs") gp_Mat;
		%feature("autodoc", "
Parameters
----------
theA11: double
theA12: double
theA13: double
theA21: double
theA22: double
theA23: double
theA31: double
theA32: double
theA33: double

Return
-------
None

Description
-----------
No available documentation.
") gp_Mat;
		 gp_Mat(const double theA11, const double theA12, const double theA13, const double theA21, const double theA22, const double theA23, const double theA31, const double theA32, const double theA33);

		/****** gp_Mat::gp_Mat ******/
		/****** md5 signature: c70f7990345cd055920aa4ae17b89c18 ******/
		%feature("compactdefaultargs") gp_Mat;
		%feature("autodoc", "
Parameters
----------
theCol1: gp_XYZ
theCol2: gp_XYZ
theCol3: gp_XYZ

Return
-------
None

Description
-----------
Creates a matrix. theCol1, theCol2, theCol3 are the 3 columns of the matrix.
") gp_Mat;
		 gp_Mat(const gp_XYZ & theCol1, const gp_XYZ & theCol2, const gp_XYZ & theCol3);

		/****** gp_Mat::Add ******/
		/****** md5 signature: 1511c3e2f793e982f993524992b0036c ******/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
theOther: gp_Mat

Return
-------
None

Description
-----------
No available documentation.
") Add;
		void Add(const gp_Mat & theOther);

		/****** gp_Mat::Added ******/
		/****** md5 signature: e93cdb6faf87d5d6fc405683f0ff200d ******/
		%feature("compactdefaultargs") Added;
		%feature("autodoc", "
Parameters
----------
theOther: gp_Mat

Return
-------
gp_Mat

Description
-----------
Computes the sum of this matrix and the matrix theOther for each coefficient of the matrix: <self>.Coef(i,j) + <theOther>.Coef(i,j).
") Added;
		gp_Mat Added(const gp_Mat & theOther);

		/****** gp_Mat::ChangeValue ******/
		/****** md5 signature: 83a4d334c24c1d9785877ef7f1699fa8 ******/
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "
Parameters
----------
theRow: int
theCol: int

Return
-------
double

Description
-----------
Returns the coefficient of range (theRow, theCol) Raises OutOfRange if theRow < 1 or theRow > 3 or theCol < 1 or theCol > 3.
") ChangeValue;
		double & ChangeValue(const int theRow, const int theCol);

		/****** gp_Mat::Column ******/
		/****** md5 signature: 4ca76cbb6ed290ebe58ce12325abb04e ******/
		%feature("compactdefaultargs") Column;
		%feature("autodoc", "
Parameters
----------
theCol: int

Return
-------
gp_XYZ

Description
-----------
Returns the column of theCol index. Raises OutOfRange if theCol < 1 or theCol > 3.
") Column;
		gp_XYZ Column(const int theCol);

		/****** gp_Mat::Determinant ******/
		/****** md5 signature: 47754dc7816fc2408823801a02c7c914 ******/
		%feature("compactdefaultargs") Determinant;
		%feature("autodoc", "Return
-------
double

Description
-----------
Computes the determinant of the matrix.
") Determinant;
		double Determinant();

		/****** gp_Mat::Diagonal ******/
		/****** md5 signature: 1f1fc2674e4c70afa35cc086a7d5dabb ******/
		%feature("compactdefaultargs") Diagonal;
		%feature("autodoc", "Return
-------
gp_XYZ

Description
-----------
Returns the main diagonal of the matrix.
") Diagonal;
		gp_XYZ Diagonal();

		/****** gp_Mat::Divide ******/
		/****** md5 signature: bba423a346acdb08f5981dfae8997209 ******/
		%feature("compactdefaultargs") Divide;
		%feature("autodoc", "
Parameters
----------
theScalar: double

Return
-------
None

Description
-----------
No available documentation.
") Divide;
		void Divide(const double theScalar);

		/****** gp_Mat::Divided ******/
		/****** md5 signature: 7724f8df6228f72e841bfb5f9958d876 ******/
		%feature("compactdefaultargs") Divided;
		%feature("autodoc", "
Parameters
----------
theScalar: double

Return
-------
gp_Mat

Description
-----------
Divides all the coefficients of the matrix by Scalar.
") Divided;
		gp_Mat Divided(const double theScalar);


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
		/****** gp_Mat::Invert ******/
		/****** md5 signature: 980f166f600d23a8c77565829af2eeff ******/
		%feature("compactdefaultargs") Invert;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Invert;
		void Invert();

		/****** gp_Mat::Inverted ******/
		/****** md5 signature: 0fc8d68232f4accc4c200c6594a3c6f8 ******/
		%feature("compactdefaultargs") Inverted;
		%feature("autodoc", "Return
-------
gp_Mat

Description
-----------
Inverses the matrix and raises if the matrix is singular. - Invert assigns the result to this matrix, while - Inverted creates a new one. Warning The Gauss LU decomposition is used to invert the matrix. Consequently, the matrix is considered as singular if the largest pivot found is less than or equal to gp::Resolution(). Exceptions Standard_ConstructionError if this matrix is singular, and therefore cannot be inverted.
") Inverted;
		gp_Mat Inverted();

		/****** gp_Mat::IsSingular ******/
		/****** md5 signature: 232ee8c1482120b3b528de82003d4963 ******/
		%feature("compactdefaultargs") IsSingular;
		%feature("autodoc", "Return
-------
bool

Description
-----------
The Gauss LU decomposition is used to invert the matrix (see Math package) so the matrix is considered as singular if the largest pivot found is lower or equal to Resolution from gp.
") IsSingular;
		bool IsSingular();

		/****** gp_Mat::Multiplied ******/
		/****** md5 signature: 0c582ae4d640d38fe025a4712a8ff050 ******/
		%feature("compactdefaultargs") Multiplied;
		%feature("autodoc", "
Parameters
----------
theOther: gp_Mat

Return
-------
gp_Mat

Description
-----------
Computes the product of two matrices <self> * <Other>.
") Multiplied;
		gp_Mat Multiplied(const gp_Mat & theOther);

		/****** gp_Mat::Multiplied ******/
		/****** md5 signature: 7f32cb6b4df27de69e035cc88295675c ******/
		%feature("compactdefaultargs") Multiplied;
		%feature("autodoc", "
Parameters
----------
theScalar: double

Return
-------
gp_Mat

Description
-----------
No available documentation.
") Multiplied;
		gp_Mat Multiplied(const double theScalar);

		/****** gp_Mat::Multiply ******/
		/****** md5 signature: 2cfaab68982c1584de7882af580b4807 ******/
		%feature("compactdefaultargs") Multiply;
		%feature("autodoc", "
Parameters
----------
theOther: gp_Mat

Return
-------
None

Description
-----------
Computes the product of two matrices <self> = <Other> * <self>.
") Multiply;
		void Multiply(const gp_Mat & theOther);

		/****** gp_Mat::Multiply ******/
		/****** md5 signature: f11f4eb5d66a0c3758925f57f462fd5f ******/
		%feature("compactdefaultargs") Multiply;
		%feature("autodoc", "
Parameters
----------
theScalar: double

Return
-------
None

Description
-----------
Multiplies all the coefficients of the matrix by Scalar.
") Multiply;
		void Multiply(const double theScalar);

		/****** gp_Mat::Power ******/
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
No available documentation.
") Power;
		void Power(const int N);

		/****** gp_Mat::Powered ******/
		/****** md5 signature: f5e4f3727aebd7e445d95a554f57aca0 ******/
		%feature("compactdefaultargs") Powered;
		%feature("autodoc", "
Parameters
----------
theN: int

Return
-------
gp_Mat

Description
-----------
Computes <self> = <self> * <self> * .......* <self>, theN time. if theN = 0 <self> = Identity if theN < 0 <self> = <self>.Invert() *...........* <self>.Invert(). If theN < 0 an exception will be raised if the matrix is not inversible.
") Powered;
		gp_Mat Powered(const int theN);

		/****** gp_Mat::PreMultiply ******/
		/****** md5 signature: 8c6c5698b00c7e8ff0da23083e759a03 ******/
		%feature("compactdefaultargs") PreMultiply;
		%feature("autodoc", "
Parameters
----------
theOther: gp_Mat

Return
-------
None

Description
-----------
No available documentation.
") PreMultiply;
		void PreMultiply(const gp_Mat & theOther);

		/****** gp_Mat::Row ******/
		/****** md5 signature: 1832cc944f1b71d7d8ede90335714c7c ******/
		%feature("compactdefaultargs") Row;
		%feature("autodoc", "
Parameters
----------
theRow: int

Return
-------
gp_XYZ

Description
-----------
returns the row of theRow index. Raises OutOfRange if theRow < 1 or theRow > 3.
") Row;
		gp_XYZ Row(const int theRow);

		/****** gp_Mat::SetCol ******/
		/****** md5 signature: e6a49944299a8a6765c55e538ebaa766 ******/
		%feature("compactdefaultargs") SetCol;
		%feature("autodoc", "
Parameters
----------
theCol: int
theValue: gp_XYZ

Return
-------
None

Description
-----------
Assigns the three coordinates of theValue to the column of index theCol of this matrix. Raises OutOfRange if theCol < 1 or theCol > 3.
") SetCol;
		void SetCol(const int theCol, const gp_XYZ & theValue);

		/****** gp_Mat::SetCols ******/
		/****** md5 signature: 0bb5fe2880a0b326d0ee4be9a050e1fb ******/
		%feature("compactdefaultargs") SetCols;
		%feature("autodoc", "
Parameters
----------
theCol1: gp_XYZ
theCol2: gp_XYZ
theCol3: gp_XYZ

Return
-------
None

Description
-----------
Assigns the number triples theCol1, theCol2, theCol3 to the three columns of this matrix.
") SetCols;
		void SetCols(const gp_XYZ & theCol1, const gp_XYZ & theCol2, const gp_XYZ & theCol3);

		/****** gp_Mat::SetCross ******/
		/****** md5 signature: 3b20c4391761c99e63da723474bf4093 ******/
		%feature("compactdefaultargs") SetCross;
		%feature("autodoc", "
Parameters
----------
theRef: gp_XYZ

Return
-------
None

Description
-----------
Modifies the matrix M so that applying it to any number triple (X, Y, Z) produces the same result as the cross product of theRef and the number triple (X, Y, Z): i.e.: M * {X,Y,Z}t = theRef.Cross({X, Y ,Z}) this matrix is anti symmetric. To apply this matrix to the triplet {XYZ} is the same as to do the cross product between the triplet theRef and the triplet {XYZ}. Note: this matrix is anti-symmetric.
") SetCross;
		void SetCross(const gp_XYZ & theRef);

		/****** gp_Mat::SetDiagonal ******/
		/****** md5 signature: b03947aaab199674f9edc311adb5ad73 ******/
		%feature("compactdefaultargs") SetDiagonal;
		%feature("autodoc", "
Parameters
----------
theX1: double
theX2: double
theX3: double

Return
-------
None

Description
-----------
Modifies the main diagonal of the matrix. @code <self>.Value (1, 1) = theX1 <self>.Value (2, 2) = theX2 <self>.Value (3, 3) = theX3 @endcode The other coefficients of the matrix are not modified.
") SetDiagonal;
		void SetDiagonal(const double theX1, const double theX2, const double theX3);

		/****** gp_Mat::SetDot ******/
		/****** md5 signature: 207b72be2af38240940419c3f42a14d1 ******/
		%feature("compactdefaultargs") SetDot;
		%feature("autodoc", "
Parameters
----------
theRef: gp_XYZ

Return
-------
None

Description
-----------
Modifies this matrix so that applying it to any number triple (X, Y, Z) produces the same result as the scalar product of theRef and the number triple (X, Y, Z): this * (X,Y,Z) = theRef.(X,Y,Z) Note: this matrix is symmetric.
") SetDot;
		void SetDot(const gp_XYZ & theRef);

		/****** gp_Mat::SetIdentity ******/
		/****** md5 signature: 4846334762b9a93dd8dc42bd7ef8a8fa ******/
		%feature("compactdefaultargs") SetIdentity;
		%feature("autodoc", "Return
-------
None

Description
-----------
Modifies this matrix so that it represents the Identity matrix.
") SetIdentity;
		void SetIdentity();

		/****** gp_Mat::SetRotation ******/
		/****** md5 signature: 8f221a8dac39ec5dfea6a85cde711e19 ******/
		%feature("compactdefaultargs") SetRotation;
		%feature("autodoc", "
Parameters
----------
theAxis: gp_XYZ
theAng: double

Return
-------
None

Description
-----------
Modifies this matrix so that it represents a rotation. theAng is the angular value in radians and the XYZ axis gives the direction of the rotation. Raises ConstructionError if XYZ.Modulus() <= Resolution().
") SetRotation;
		void SetRotation(const gp_XYZ & theAxis, const double theAng);

		/****** gp_Mat::SetRow ******/
		/****** md5 signature: b1c65220c56cb57056b10b630f3e97c6 ******/
		%feature("compactdefaultargs") SetRow;
		%feature("autodoc", "
Parameters
----------
theRow: int
theValue: gp_XYZ

Return
-------
None

Description
-----------
Assigns the three coordinates of Value to the row of index theRow of this matrix. Raises OutOfRange if theRow < 1 or theRow > 3.
") SetRow;
		void SetRow(const int theRow, const gp_XYZ & theValue);

		/****** gp_Mat::SetRows ******/
		/****** md5 signature: 9f360a5cd262963fdb0a0e93568929ba ******/
		%feature("compactdefaultargs") SetRows;
		%feature("autodoc", "
Parameters
----------
theRow1: gp_XYZ
theRow2: gp_XYZ
theRow3: gp_XYZ

Return
-------
None

Description
-----------
Assigns the number triples theRow1, theRow2, theRow3 to the three rows of this matrix.
") SetRows;
		void SetRows(const gp_XYZ & theRow1, const gp_XYZ & theRow2, const gp_XYZ & theRow3);

		/****** gp_Mat::SetScale ******/
		/****** md5 signature: 1b77dab60099ec7a294a0943e485e67f ******/
		%feature("compactdefaultargs") SetScale;
		%feature("autodoc", "
Parameters
----------
theS: double

Return
-------
None

Description
-----------
Modifies the matrix so that it represents a scaling transformation, where theS is the scale factor.: @code | theS 0.0 0.0 | <self> = | 0.0 theS 0.0 | | 0.0 0.0 theS | @endcode.
") SetScale;
		void SetScale(const double theS);

		/****** gp_Mat::SetValue ******/
		/****** md5 signature: 06e5ef9025e25c61d485e9426bf0e3df ******/
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "
Parameters
----------
theRow: int
theCol: int
theValue: double

Return
-------
None

Description
-----------
Assigns <theValue> to the coefficient of row theRow, column theCol of this matrix. Raises OutOfRange if theRow < 1 or theRow > 3 or theCol < 1 or theCol > 3.
") SetValue;
		void SetValue(const int theRow, const int theCol, const double theValue);

		/****** gp_Mat::Subtract ******/
		/****** md5 signature: 897aae72ecbf737657a7ebb3a3151ae0 ******/
		%feature("compactdefaultargs") Subtract;
		%feature("autodoc", "
Parameters
----------
theOther: gp_Mat

Return
-------
None

Description
-----------
No available documentation.
") Subtract;
		void Subtract(const gp_Mat & theOther);

		/****** gp_Mat::Subtracted ******/
		/****** md5 signature: 8c3088b89cd29ac97df7f1db88542ceb ******/
		%feature("compactdefaultargs") Subtracted;
		%feature("autodoc", "
Parameters
----------
theOther: gp_Mat

Return
-------
gp_Mat

Description
-----------
cOmputes for each coefficient of the matrix: <self>.Coef(i,j) - <theOther>.Coef(i,j).
") Subtracted;
		gp_Mat Subtracted(const gp_Mat & theOther);

		/****** gp_Mat::Transpose ******/
		/****** md5 signature: 70e27025c56428cd3bbca609f0f0cfbd ******/
		%feature("compactdefaultargs") Transpose;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Transpose;
		void Transpose();

		/****** gp_Mat::Transposed ******/
		/****** md5 signature: 6f431e17dac82c5511fba18a2280b8a0 ******/
		%feature("compactdefaultargs") Transposed;
		%feature("autodoc", "Return
-------
gp_Mat

Description
-----------
Transposes the matrix. A(j, i) -> A (i, j).
") Transposed;
		gp_Mat Transposed();

		/****** gp_Mat::Value ******/
		/****** md5 signature: a3c894f0febd0b85f3ddc5c7f5ba29fd ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
theRow: int
theCol: int

Return
-------
double

Description
-----------
Returns the coefficient of range (theRow, theCol) Raises OutOfRange if theRow < 1 or theRow > 3 or theCol < 1 or theCol > 3.
") Value;
		const double & Value(const int theRow, const int theCol);

		/****** gp_Mat::operator * ******/
		/****** md5 signature: 3cddd4f27f96a5608677a48c4b9e3f1d ******/
		%feature("compactdefaultargs") operator *;
		%feature("autodoc", "
Parameters
----------
theOther: gp_Mat

Return
-------
gp_Mat

Description
-----------
No available documentation.
") operator *;
		gp_Mat operator *(const gp_Mat & theOther);

		/****** gp_Mat::operator * ******/
		/****** md5 signature: b48b94899fc0d6090265348e7c03264b ******/
		%feature("compactdefaultargs") operator *;
		%feature("autodoc", "
Parameters
----------
theScalar: double

Return
-------
gp_Mat

Description
-----------
No available documentation.
") operator *;
		gp_Mat operator *(const double theScalar);


%extend{
    void __imul_wrapper__(const gp_Mat other) {
    *self *= other;
    }
}
%pythoncode {
def __imul__(self, right):
    self.__imul_wrapper__(right)
    return self
}

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
		/****** gp_Mat::operator + ******/
		/****** md5 signature: eeecf32f2c60376080016cfc5184545e ******/
		%feature("compactdefaultargs") operator +;
		%feature("autodoc", "
Parameters
----------
theOther: gp_Mat

Return
-------
gp_Mat

Description
-----------
No available documentation.
") operator +;
		gp_Mat operator +(const gp_Mat & theOther);


%extend{
    void __iadd_wrapper__(const gp_Mat other) {
    *self += other;
    }
}
%pythoncode {
def __iadd__(self, right):
    self.__iadd_wrapper__(right)
    return self
}
		/****** gp_Mat::operator - ******/
		/****** md5 signature: 0b8bf0952e88327bd81dd9a2b914635f ******/
		%feature("compactdefaultargs") operator -;
		%feature("autodoc", "
Parameters
----------
theOther: gp_Mat

Return
-------
gp_Mat

Description
-----------
No available documentation.
") operator -;
		gp_Mat operator -(const gp_Mat & theOther);


%extend{
    void __isub_wrapper__(const gp_Mat other) {
    *self -= other;
    }
}
%pythoncode {
def __isub__(self, right):
    self.__isub_wrapper__(right)
    return self
}
		/****** gp_Mat::operator / ******/
		/****** md5 signature: 254077eb7e2931ae0c13c1955773d398 ******/
		%feature("compactdefaultargs") operator /;
		%feature("autodoc", "
Parameters
----------
theScalar: double

Return
-------
gp_Mat

Description
-----------
No available documentation.
") operator /;
		gp_Mat operator /(const double theScalar);


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



%extend gp_Mat {
%pythoncode {
    def __getstate__(self):
        return self.DumpJson()
    }
};

%extend gp_Mat {
%pythoncode {
    def __setstate__(self, state):
        inst = gp_Mat()
        if inst.InitFromJson(state):
            self.this = inst.this
        else:
            raise IOError('Failed to set state of gp_Mat')
    }
};
%extend gp_Mat {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************
* class gp_Mat2d *
*****************/
class gp_Mat2d {
	public:
		/****** gp_Mat2d::gp_Mat2d ******/
		/****** md5 signature: 3ec71aec4e71f96b03977fdd7a8c167e ******/
		%feature("compactdefaultargs") gp_Mat2d;
		%feature("autodoc", "Return
-------
None

Description
-----------
Creates a matrix with null coefficients.
") gp_Mat2d;
		 gp_Mat2d();

		/****** gp_Mat2d::gp_Mat2d ******/
		/****** md5 signature: 8ee2088d64337c1d8317be4e5edc2cbc ******/
		%feature("compactdefaultargs") gp_Mat2d;
		%feature("autodoc", "
Parameters
----------
theCol1: gp_XY
theCol2: gp_XY

Return
-------
None

Description
-----------
theCol1, theCol2 are the 2 columns of the matrix.
") gp_Mat2d;
		 gp_Mat2d(const gp_XY & theCol1, const gp_XY & theCol2);

		/****** gp_Mat2d::Add ******/
		/****** md5 signature: f3d0d4b0396540c1df462c9396ae4f45 ******/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
Other: gp_Mat2d

Return
-------
None

Description
-----------
No available documentation.
") Add;
		void Add(const gp_Mat2d & Other);

		/****** gp_Mat2d::Added ******/
		/****** md5 signature: f7f91b1992ca80d10ef48e095a081c7d ******/
		%feature("compactdefaultargs") Added;
		%feature("autodoc", "
Parameters
----------
theOther: gp_Mat2d

Return
-------
gp_Mat2d

Description
-----------
Computes the sum of this matrix and the matrix theOther.for each coefficient of the matrix: @code <self>.Coef(i,j) + <theOther>.Coef(i,j) @endcode Note: - operator += assigns the result to this matrix, while - operator + creates a new one.
") Added;
		gp_Mat2d Added(const gp_Mat2d & theOther);

		/****** gp_Mat2d::ChangeValue ******/
		/****** md5 signature: 83a4d334c24c1d9785877ef7f1699fa8 ******/
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "
Parameters
----------
theRow: int
theCol: int

Return
-------
double

Description
-----------
Returns the coefficient of range (theRow, theCol) Raises OutOfRange if theRow < 1 or theRow > 2 or theCol < 1 or theCol > 2.
") ChangeValue;
		double & ChangeValue(const int theRow, const int theCol);

		/****** gp_Mat2d::Column ******/
		/****** md5 signature: dbab06bfd0491055fc1d67769733a4a2 ******/
		%feature("compactdefaultargs") Column;
		%feature("autodoc", "
Parameters
----------
theCol: int

Return
-------
gp_XY

Description
-----------
Returns the column of theCol index. Raises OutOfRange if theCol < 1 or theCol > 2.
") Column;
		gp_XY Column(const int theCol);

		/****** gp_Mat2d::Determinant ******/
		/****** md5 signature: 47754dc7816fc2408823801a02c7c914 ******/
		%feature("compactdefaultargs") Determinant;
		%feature("autodoc", "Return
-------
double

Description
-----------
Computes the determinant of the matrix.
") Determinant;
		double Determinant();

		/****** gp_Mat2d::Diagonal ******/
		/****** md5 signature: aece2ad385867950872716b830ca5dc0 ******/
		%feature("compactdefaultargs") Diagonal;
		%feature("autodoc", "Return
-------
gp_XY

Description
-----------
Returns the main diagonal of the matrix.
") Diagonal;
		gp_XY Diagonal();

		/****** gp_Mat2d::Divide ******/
		/****** md5 signature: bba423a346acdb08f5981dfae8997209 ******/
		%feature("compactdefaultargs") Divide;
		%feature("autodoc", "
Parameters
----------
theScalar: double

Return
-------
None

Description
-----------
No available documentation.
") Divide;
		void Divide(const double theScalar);

		/****** gp_Mat2d::Divided ******/
		/****** md5 signature: 14a55fb6d6facda10689b70f5055e9a8 ******/
		%feature("compactdefaultargs") Divided;
		%feature("autodoc", "
Parameters
----------
theScalar: double

Return
-------
gp_Mat2d

Description
-----------
Divides all the coefficients of the matrix by a scalar.
") Divided;
		gp_Mat2d Divided(const double theScalar);

		/****** gp_Mat2d::Invert ******/
		/****** md5 signature: 980f166f600d23a8c77565829af2eeff ******/
		%feature("compactdefaultargs") Invert;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Invert;
		void Invert();

		/****** gp_Mat2d::Inverted ******/
		/****** md5 signature: e25ae29335c96aa928e72866417e8ab1 ******/
		%feature("compactdefaultargs") Inverted;
		%feature("autodoc", "Return
-------
gp_Mat2d

Description
-----------
Inverses the matrix and raises exception if the matrix is singular.
") Inverted;
		gp_Mat2d Inverted();

		/****** gp_Mat2d::IsSingular ******/
		/****** md5 signature: 232ee8c1482120b3b528de82003d4963 ******/
		%feature("compactdefaultargs") IsSingular;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if this matrix is singular (and therefore, cannot be inverted). The Gauss LU decomposition is used to invert the matrix so the matrix is considered as singular if the largest pivot found is lower or equal to Resolution from gp.
") IsSingular;
		bool IsSingular();

		/****** gp_Mat2d::Multiplied ******/
		/****** md5 signature: 38b50a33a0c805172a9dcf1cd90b1480 ******/
		%feature("compactdefaultargs") Multiplied;
		%feature("autodoc", "
Parameters
----------
theOther: gp_Mat2d

Return
-------
gp_Mat2d

Description
-----------
No available documentation.
") Multiplied;
		gp_Mat2d Multiplied(const gp_Mat2d & theOther);

		/****** gp_Mat2d::Multiplied ******/
		/****** md5 signature: 498e1051ee5e80feec7991f6294bfb8c ******/
		%feature("compactdefaultargs") Multiplied;
		%feature("autodoc", "
Parameters
----------
theScalar: double

Return
-------
gp_Mat2d

Description
-----------
No available documentation.
") Multiplied;
		gp_Mat2d Multiplied(const double theScalar);

		/****** gp_Mat2d::Multiply ******/
		/****** md5 signature: 6819d20333a27654a9a591c12abc1fab ******/
		%feature("compactdefaultargs") Multiply;
		%feature("autodoc", "
Parameters
----------
theOther: gp_Mat2d

Return
-------
None

Description
-----------
Computes the product of two matrices <self> * <theOther>.
") Multiply;
		void Multiply(const gp_Mat2d & theOther);

		/****** gp_Mat2d::Multiply ******/
		/****** md5 signature: f11f4eb5d66a0c3758925f57f462fd5f ******/
		%feature("compactdefaultargs") Multiply;
		%feature("autodoc", "
Parameters
----------
theScalar: double

Return
-------
None

Description
-----------
Multiplies all the coefficients of the matrix by a scalar.
") Multiply;
		void Multiply(const double theScalar);

		/****** gp_Mat2d::Power ******/
		/****** md5 signature: f3a3cc0edc25db3d73a8d582f1c4bc84 ******/
		%feature("compactdefaultargs") Power;
		%feature("autodoc", "
Parameters
----------
theN: int

Return
-------
None

Description
-----------
No available documentation.
") Power;
		void Power(const int theN);

		/****** gp_Mat2d::Powered ******/
		/****** md5 signature: c7f66f43bd268c858d4432e624fba5c3 ******/
		%feature("compactdefaultargs") Powered;
		%feature("autodoc", "
Parameters
----------
theN: int

Return
-------
gp_Mat2d

Description
-----------
computes <self> = <self> * <self> * .......* <self>, theN time. if theN = 0 <self> = Identity if theN < 0 <self> = <self>.Invert() *...........* <self>.Invert(). If theN < 0 an exception can be raised if the matrix is not inversible.
") Powered;
		gp_Mat2d Powered(const int theN);

		/****** gp_Mat2d::PreMultiply ******/
		/****** md5 signature: 68fbfc33e0269fbd413f8c40c7e2ac84 ******/
		%feature("compactdefaultargs") PreMultiply;
		%feature("autodoc", "
Parameters
----------
theOther: gp_Mat2d

Return
-------
None

Description
-----------
Modifies this matrix by premultiplying it by the matrix Other <self> = theOther * <self>.
") PreMultiply;
		void PreMultiply(const gp_Mat2d & theOther);

		/****** gp_Mat2d::Row ******/
		/****** md5 signature: bf5e213358a6e57e82da689ae48e87c8 ******/
		%feature("compactdefaultargs") Row;
		%feature("autodoc", "
Parameters
----------
theRow: int

Return
-------
gp_XY

Description
-----------
Returns the row of index theRow. Raised if theRow < 1 or theRow > 2.
") Row;
		gp_XY Row(const int theRow);

		/****** gp_Mat2d::SetCol ******/
		/****** md5 signature: f3d907140a34999325476016099822d4 ******/
		%feature("compactdefaultargs") SetCol;
		%feature("autodoc", "
Parameters
----------
theCol: int
theValue: gp_XY

Return
-------
None

Description
-----------
Assigns the two coordinates of theValue to the column of range theCol of this matrix Raises OutOfRange if theCol < 1 or theCol > 2.
") SetCol;
		void SetCol(const int theCol, const gp_XY & theValue);

		/****** gp_Mat2d::SetCols ******/
		/****** md5 signature: 6afcfbf6aea2dca97f97a69fe4b45e16 ******/
		%feature("compactdefaultargs") SetCols;
		%feature("autodoc", "
Parameters
----------
theCol1: gp_XY
theCol2: gp_XY

Return
-------
None

Description
-----------
Assigns the number pairs theCol1, theCol2 to the two columns of this matrix.
") SetCols;
		void SetCols(const gp_XY & theCol1, const gp_XY & theCol2);

		/****** gp_Mat2d::SetDiagonal ******/
		/****** md5 signature: c2b0dd9e87f60e68a55e9582a9b3b612 ******/
		%feature("compactdefaultargs") SetDiagonal;
		%feature("autodoc", "
Parameters
----------
theX1: double
theX2: double

Return
-------
None

Description
-----------
Modifies the main diagonal of the matrix. @code <self>.Value (1, 1) = theX1 <self>.Value (2, 2) = theX2 @endcode The other coefficients of the matrix are not modified.
") SetDiagonal;
		void SetDiagonal(const double theX1, const double theX2);

		/****** gp_Mat2d::SetIdentity ******/
		/****** md5 signature: 4846334762b9a93dd8dc42bd7ef8a8fa ******/
		%feature("compactdefaultargs") SetIdentity;
		%feature("autodoc", "Return
-------
None

Description
-----------
Modifies this matrix, so that it represents the Identity matrix.
") SetIdentity;
		void SetIdentity();

		/****** gp_Mat2d::SetRotation ******/
		/****** md5 signature: 92842f1f8dd96904ea9a250e9196d032 ******/
		%feature("compactdefaultargs") SetRotation;
		%feature("autodoc", "
Parameters
----------
theAng: double

Return
-------
None

Description
-----------
Modifies this matrix, so that it represents a rotation. theAng is the angular value in radian of the rotation.
") SetRotation;
		void SetRotation(const double theAng);

		/****** gp_Mat2d::SetRow ******/
		/****** md5 signature: 820a1c0413e3f5c00c993a1c74394707 ******/
		%feature("compactdefaultargs") SetRow;
		%feature("autodoc", "
Parameters
----------
theRow: int
theValue: gp_XY

Return
-------
None

Description
-----------
Assigns the two coordinates of theValue to the row of index theRow of this matrix. Raises OutOfRange if theRow < 1 or theRow > 2.
") SetRow;
		void SetRow(const int theRow, const gp_XY & theValue);

		/****** gp_Mat2d::SetRows ******/
		/****** md5 signature: da27ff36201d86cdab3c3e4eeb2fb37f ******/
		%feature("compactdefaultargs") SetRows;
		%feature("autodoc", "
Parameters
----------
theRow1: gp_XY
theRow2: gp_XY

Return
-------
None

Description
-----------
Assigns the number pairs theRow1, theRow2 to the two rows of this matrix.
") SetRows;
		void SetRows(const gp_XY & theRow1, const gp_XY & theRow2);

		/****** gp_Mat2d::SetScale ******/
		/****** md5 signature: 1b77dab60099ec7a294a0943e485e67f ******/
		%feature("compactdefaultargs") SetScale;
		%feature("autodoc", "
Parameters
----------
theS: double

Return
-------
None

Description
-----------
Modifies the matrix such that it represents a scaling transformation, where theS is the scale factor: @code | theS 0.0 | <self> = | 0.0 theS | @endcode.
") SetScale;
		void SetScale(const double theS);

		/****** gp_Mat2d::SetValue ******/
		/****** md5 signature: 06e5ef9025e25c61d485e9426bf0e3df ******/
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "
Parameters
----------
theRow: int
theCol: int
theValue: double

Return
-------
None

Description
-----------
Assigns <theValue> to the coefficient of row theRow, column theCol of this matrix. Raises OutOfRange if theRow < 1 or theRow > 2 or theCol < 1 or theCol > 2.
") SetValue;
		void SetValue(const int theRow, const int theCol, const double theValue);

		/****** gp_Mat2d::Subtract ******/
		/****** md5 signature: 617005291d5678527cdae5b1653cadf7 ******/
		%feature("compactdefaultargs") Subtract;
		%feature("autodoc", "
Parameters
----------
theOther: gp_Mat2d

Return
-------
None

Description
-----------
No available documentation.
") Subtract;
		void Subtract(const gp_Mat2d & theOther);

		/****** gp_Mat2d::Subtracted ******/
		/****** md5 signature: 5149325649f976b383eab275c4d78a68 ******/
		%feature("compactdefaultargs") Subtracted;
		%feature("autodoc", "
Parameters
----------
theOther: gp_Mat2d

Return
-------
gp_Mat2d

Description
-----------
Computes for each coefficient of the matrix: @code <self>.Coef(i,j) - <theOther>.Coef(i,j) @endcode.
") Subtracted;
		gp_Mat2d Subtracted(const gp_Mat2d & theOther);

		/****** gp_Mat2d::Transpose ******/
		/****** md5 signature: 150599a883ecf87e6c8dfb0ce043dc62 ******/
		%feature("compactdefaultargs") Transpose;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Transpose;
		void Transpose();

		/****** gp_Mat2d::Transposed ******/
		/****** md5 signature: 878ce2be28581701953d0a24c11baf6c ******/
		%feature("compactdefaultargs") Transposed;
		%feature("autodoc", "Return
-------
gp_Mat2d

Description
-----------
Transposes the matrix. A(j, i) -> A (i, j).
") Transposed;
		gp_Mat2d Transposed();

		/****** gp_Mat2d::Value ******/
		/****** md5 signature: a3c894f0febd0b85f3ddc5c7f5ba29fd ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
theRow: int
theCol: int

Return
-------
double

Description
-----------
Returns the coefficient of range (ttheheRow, theCol) Raises OutOfRange if theRow < 1 or theRow > 2 or theCol < 1 or theCol > 2.
") Value;
		const double & Value(const int theRow, const int theCol);

		/****** gp_Mat2d::operator * ******/
		/****** md5 signature: 602e63634b33baba43e88e34a9fb9c10 ******/
		%feature("compactdefaultargs") operator *;
		%feature("autodoc", "
Parameters
----------
theOther: gp_Mat2d

Return
-------
gp_Mat2d

Description
-----------
No available documentation.
") operator *;
		gp_Mat2d operator *(const gp_Mat2d & theOther);

		/****** gp_Mat2d::operator * ******/
		/****** md5 signature: 78b5e3f811a21bb14da303061e1af776 ******/
		%feature("compactdefaultargs") operator *;
		%feature("autodoc", "
Parameters
----------
theScalar: double

Return
-------
gp_Mat2d

Description
-----------
No available documentation.
") operator *;
		gp_Mat2d operator *(const double theScalar);


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
		/****** gp_Mat2d::operator + ******/
		/****** md5 signature: f300ece25d60ba323e3d980756141492 ******/
		%feature("compactdefaultargs") operator +;
		%feature("autodoc", "
Parameters
----------
theOther: gp_Mat2d

Return
-------
gp_Mat2d

Description
-----------
No available documentation.
") operator +;
		gp_Mat2d operator +(const gp_Mat2d & theOther);


%extend{
    void __iadd_wrapper__(const gp_Mat2d other) {
    *self += other;
    }
}
%pythoncode {
def __iadd__(self, right):
    self.__iadd_wrapper__(right)
    return self
}
		/****** gp_Mat2d::operator - ******/
		/****** md5 signature: 59c9ea31cd487cd7571e2c5c953ce3a8 ******/
		%feature("compactdefaultargs") operator -;
		%feature("autodoc", "
Parameters
----------
theOther: gp_Mat2d

Return
-------
gp_Mat2d

Description
-----------
No available documentation.
") operator -;
		gp_Mat2d operator -(const gp_Mat2d & theOther);


%extend{
    void __isub_wrapper__(const gp_Mat2d other) {
    *self -= other;
    }
}
%pythoncode {
def __isub__(self, right):
    self.__isub_wrapper__(right)
    return self
}
		/****** gp_Mat2d::operator / ******/
		/****** md5 signature: d8d35047868f9258d1174459089e8d7e ******/
		%feature("compactdefaultargs") operator /;
		%feature("autodoc", "
Parameters
----------
theScalar: double

Return
-------
gp_Mat2d

Description
-----------
No available documentation.
") operator /;
		gp_Mat2d operator /(const double theScalar);


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



%extend gp_Mat2d {
%pythoncode {
    def __getstate__(self):
        return self.DumpJson()
    }
};

%extend gp_Mat2d {
%pythoncode {
    def __setstate__(self, state):
        inst = gp_Mat2d()
        if inst.InitFromJson(state):
            self.this = inst.this
        else:
            raise IOError('Failed to set state of gp_Mat2d')
    }
};
%extend gp_Mat2d {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************
* class gp_Parab *
*****************/
class gp_Parab {
	public:
		/****** gp_Parab::gp_Parab ******/
		/****** md5 signature: 4076cb585e946ec7343978cc5dd20101 ******/
		%feature("compactdefaultargs") gp_Parab;
		%feature("autodoc", "Return
-------
None

Description
-----------
Creates an indefinite Parabola.
") gp_Parab;
		 gp_Parab();

		/****** gp_Parab::gp_Parab ******/
		/****** md5 signature: 08a85b7e82ae8236804efbf6238de307 ******/
		%feature("compactdefaultargs") gp_Parab;
		%feature("autodoc", "
Parameters
----------
theA2: gp_Ax2
theFocal: double

Return
-------
None

Description
-----------
Creates a parabola with its local coordinate system 'theA2' and it's focal length 'Focal'. The XDirection of theA2 defines the axis of symmetry of the parabola. The YDirection of theA2 is parallel to the directrix of the parabola. The Location point of theA2 is the vertex of the parabola Raises ConstructionError if theFocal < 0.0 Raised if theFocal < 0.0.
") gp_Parab;
		 gp_Parab(const gp_Ax2 & theA2, const double theFocal);

		/****** gp_Parab::gp_Parab ******/
		/****** md5 signature: 259f994397123b24ee9112e5db353e42 ******/
		%feature("compactdefaultargs") gp_Parab;
		%feature("autodoc", "
Parameters
----------
theD: gp_Ax1
theF: gp_Pnt

Return
-------
None

Description
-----------
theD is the directrix of the parabola and theF the focus point. The symmetry axis (XAxis) of the parabola is normal to the directrix and pass through the focus point theF, but its location point is the vertex of the parabola. The YAxis of the parabola is parallel to theD and its location point is the vertex of the parabola. The normal to the plane of the parabola is the cross product between the XAxis and the YAxis.
") gp_Parab;
		 gp_Parab(const gp_Ax1 & theD, const gp_Pnt & theF);

		/****** gp_Parab::Axis ******/
		/****** md5 signature: 92df3aa78c9ee700462ef461d4ed4603 ******/
		%feature("compactdefaultargs") Axis;
		%feature("autodoc", "Return
-------
gp_Ax1

Description
-----------
Returns the main axis of the parabola. It is the axis normal to the plane of the parabola passing through the vertex of the parabola.
") Axis;
		const gp_Ax1 Axis();

		/****** gp_Parab::Directrix ******/
		/****** md5 signature: 1608f5c20dd70d6d9961c85822ba9a57 ******/
		%feature("compactdefaultargs") Directrix;
		%feature("autodoc", "Return
-------
gp_Ax1

Description
-----------
Computes the directrix of this parabola. The directrix is: - a line parallel to the 'Y Direction' of the local coordinate system of this parabola, and - located on the negative side of the axis of symmetry, at a distance from the apex which is equal to the focal length of this parabola. The directrix is returned as an axis (a gp_Ax1 object), the origin of which is situated on the 'X Axis' of this parabola.
") Directrix;
		gp_Ax1 Directrix();

		/****** gp_Parab::Focal ******/
		/****** md5 signature: 7bd45dc7795d8b8364e41436e717d0c0 ******/
		%feature("compactdefaultargs") Focal;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns the distance between the vertex and the focus of the parabola.
") Focal;
		double Focal();

		/****** gp_Parab::Focus ******/
		/****** md5 signature: dfde257d151e75b4057f91980799f5e1 ******/
		%feature("compactdefaultargs") Focus;
		%feature("autodoc", "Return
-------
gp_Pnt

Description
-----------
- Computes the focus of the parabola.
") Focus;
		gp_Pnt Focus();

		/****** gp_Parab::Location ******/
		/****** md5 signature: 2c3e536bdb11b2c2c46fc19fd8a6c569 ******/
		%feature("compactdefaultargs") Location;
		%feature("autodoc", "Return
-------
gp_Pnt

Description
-----------
Returns the vertex of the parabola. It is the 'Location' point of the coordinate system of the parabola.
") Location;
		const gp_Pnt Location();

		/****** gp_Parab::Mirror ******/
		/****** md5 signature: 0f424be72f12474fe3ff290168029c4e ******/
		%feature("compactdefaultargs") Mirror;
		%feature("autodoc", "
Parameters
----------
theP: gp_Pnt

Return
-------
None

Description
-----------
No available documentation.
") Mirror;
		void Mirror(const gp_Pnt & theP);

		/****** gp_Parab::Mirror ******/
		/****** md5 signature: cfb16cae08525c5f4ab330102e0377d4 ******/
		%feature("compactdefaultargs") Mirror;
		%feature("autodoc", "
Parameters
----------
theA1: gp_Ax1

Return
-------
None

Description
-----------
No available documentation.
") Mirror;
		void Mirror(const gp_Ax1 & theA1);

		/****** gp_Parab::Mirror ******/
		/****** md5 signature: ad34943401a2334beed8ccc79094d8df ******/
		%feature("compactdefaultargs") Mirror;
		%feature("autodoc", "
Parameters
----------
theA2: gp_Ax2

Return
-------
None

Description
-----------
No available documentation.
") Mirror;
		void Mirror(const gp_Ax2 & theA2);

		/****** gp_Parab::Mirrored ******/
		/****** md5 signature: 6fb2a0d2d3714db430436986cde15ce8 ******/
		%feature("compactdefaultargs") Mirrored;
		%feature("autodoc", "
Parameters
----------
theP: gp_Pnt

Return
-------
gp_Parab

Description
-----------
Performs the symmetrical transformation of a parabola with respect to the point theP which is the center of the symmetry.
") Mirrored;
		gp_Parab Mirrored(const gp_Pnt & theP);

		/****** gp_Parab::Mirrored ******/
		/****** md5 signature: 2287a4a60fa325b82c4201ceb939ee25 ******/
		%feature("compactdefaultargs") Mirrored;
		%feature("autodoc", "
Parameters
----------
theA1: gp_Ax1

Return
-------
gp_Parab

Description
-----------
Performs the symmetrical transformation of a parabola with respect to an axis placement which is the axis of the symmetry.
") Mirrored;
		gp_Parab Mirrored(const gp_Ax1 & theA1);

		/****** gp_Parab::Mirrored ******/
		/****** md5 signature: 94f2e68fa437c1cf68ae0df536058e66 ******/
		%feature("compactdefaultargs") Mirrored;
		%feature("autodoc", "
Parameters
----------
theA2: gp_Ax2

Return
-------
gp_Parab

Description
-----------
Performs the symmetrical transformation of a parabola with respect to a plane. The axis placement theA2 locates the plane of the symmetry (Location, XDirection, YDirection).
") Mirrored;
		gp_Parab Mirrored(const gp_Ax2 & theA2);

		/****** gp_Parab::Parameter ******/
		/****** md5 signature: 85ec99320a404add827632c19023768f ******/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "Return
-------
double

Description
-----------
Computes the parameter of the parabola. It is the distance between the focus and the directrix of the parabola. This distance is twice the focal length.
") Parameter;
		double Parameter();

		/****** gp_Parab::Position ******/
		/****** md5 signature: 57187ff46d597fddf97672bf3cca7377 ******/
		%feature("compactdefaultargs") Position;
		%feature("autodoc", "Return
-------
gp_Ax2

Description
-----------
Returns the local coordinate system of the parabola.
") Position;
		const gp_Ax2 Position();

		/****** gp_Parab::Rotate ******/
		/****** md5 signature: 652dfbf621c2c092ff5b68d608de4634 ******/
		%feature("compactdefaultargs") Rotate;
		%feature("autodoc", "
Parameters
----------
theA1: gp_Ax1
theAng: double

Return
-------
None

Description
-----------
No available documentation.
") Rotate;
		void Rotate(const gp_Ax1 & theA1, const double theAng);

		/****** gp_Parab::Rotated ******/
		/****** md5 signature: 82ca732eed9afd22888f72db9b19b0a6 ******/
		%feature("compactdefaultargs") Rotated;
		%feature("autodoc", "
Parameters
----------
theA1: gp_Ax1
theAng: double

Return
-------
gp_Parab

Description
-----------
Rotates a parabola. theA1 is the axis of the rotation. Ang is the angular value of the rotation in radians.
") Rotated;
		gp_Parab Rotated(const gp_Ax1 & theA1, const double theAng);

		/****** gp_Parab::Scale ******/
		/****** md5 signature: a03901fe94facbb26121cd37d5814f81 ******/
		%feature("compactdefaultargs") Scale;
		%feature("autodoc", "
Parameters
----------
theP: gp_Pnt
theS: double

Return
-------
None

Description
-----------
No available documentation.
") Scale;
		void Scale(const gp_Pnt & theP, const double theS);

		/****** gp_Parab::Scaled ******/
		/****** md5 signature: 9c28fc3db07aee04789560b4edb91447 ******/
		%feature("compactdefaultargs") Scaled;
		%feature("autodoc", "
Parameters
----------
theP: gp_Pnt
theS: double

Return
-------
gp_Parab

Description
-----------
Scales a parabola. theS is the scaling value. If theS is negative the direction of the symmetry axis XAxis is reversed and the direction of the YAxis too.
") Scaled;
		gp_Parab Scaled(const gp_Pnt & theP, const double theS);

		/****** gp_Parab::SetAxis ******/
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
Modifies this parabola by redefining its local coordinate system so that - its origin and 'main Direction' become those of the axis theA1 (the 'X Direction' and 'Y Direction' are then recomputed in the same way as for any gp_Ax2) Raises ConstructionError if the direction of theA1 is parallel to the previous XAxis of the parabola.
") SetAxis;
		void SetAxis(const gp_Ax1 & theA1);

		/****** gp_Parab::SetFocal ******/
		/****** md5 signature: c785f4bd82a932e84c186ba12c002892 ******/
		%feature("compactdefaultargs") SetFocal;
		%feature("autodoc", "
Parameters
----------
theFocal: double

Return
-------
None

Description
-----------
Changes the focal distance of the parabola. Raises ConstructionError if theFocal < 0.0.
") SetFocal;
		void SetFocal(const double theFocal);

		/****** gp_Parab::SetLocation ******/
		/****** md5 signature: cdddcf5cbfcb37a25a0fad06f827f527 ******/
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
Changes the location of the parabola. It is the vertex of the parabola.
") SetLocation;
		void SetLocation(const gp_Pnt & theP);

		/****** gp_Parab::SetPosition ******/
		/****** md5 signature: 73d3a6a70843b70b52fc8f3fa07a25a7 ******/
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
Changes the local coordinate system of the parabola.
") SetPosition;
		void SetPosition(const gp_Ax2 & theA2);

		/****** gp_Parab::Transform ******/
		/****** md5 signature: 0737a7286be728220e1a55ba0d6eafc3 ******/
		%feature("compactdefaultargs") Transform;
		%feature("autodoc", "
Parameters
----------
theT: gp_Trsf

Return
-------
None

Description
-----------
No available documentation.
") Transform;
		void Transform(const gp_Trsf & theT);

		/****** gp_Parab::Transformed ******/
		/****** md5 signature: a150aee383b2d87a574bfc8b6d5e892c ******/
		%feature("compactdefaultargs") Transformed;
		%feature("autodoc", "
Parameters
----------
theT: gp_Trsf

Return
-------
gp_Parab

Description
-----------
Transforms a parabola with the transformation theT from class Trsf.
") Transformed;
		gp_Parab Transformed(const gp_Trsf & theT);

		/****** gp_Parab::Translate ******/
		/****** md5 signature: 8ae07d4c829c1eef2e7708ef5390638b ******/
		%feature("compactdefaultargs") Translate;
		%feature("autodoc", "
Parameters
----------
theV: gp_Vec

Return
-------
None

Description
-----------
No available documentation.
") Translate;
		void Translate(const gp_Vec & theV);

		/****** gp_Parab::Translate ******/
		/****** md5 signature: 279c13d6194eb867625753d756d110ab ******/
		%feature("compactdefaultargs") Translate;
		%feature("autodoc", "
Parameters
----------
theP1: gp_Pnt
theP2: gp_Pnt

Return
-------
None

Description
-----------
No available documentation.
") Translate;
		void Translate(const gp_Pnt & theP1, const gp_Pnt & theP2);

		/****** gp_Parab::Translated ******/
		/****** md5 signature: ef705a42ddb9b6387d9fb7df4301b8b3 ******/
		%feature("compactdefaultargs") Translated;
		%feature("autodoc", "
Parameters
----------
theV: gp_Vec

Return
-------
gp_Parab

Description
-----------
Translates a parabola in the direction of the vector theV. The magnitude of the translation is the vector's magnitude.
") Translated;
		gp_Parab Translated(const gp_Vec & theV);

		/****** gp_Parab::Translated ******/
		/****** md5 signature: e04b9c581d7671332f40517ba2d6035c ******/
		%feature("compactdefaultargs") Translated;
		%feature("autodoc", "
Parameters
----------
theP1: gp_Pnt
theP2: gp_Pnt

Return
-------
gp_Parab

Description
-----------
Translates a parabola from the point theP1 to the point theP2.
") Translated;
		gp_Parab Translated(const gp_Pnt & theP1, const gp_Pnt & theP2);

		/****** gp_Parab::XAxis ******/
		/****** md5 signature: 37d8185a57a29bf9b7aa10d76b1229a2 ******/
		%feature("compactdefaultargs") XAxis;
		%feature("autodoc", "Return
-------
gp_Ax1

Description
-----------
Returns the symmetry axis of the parabola. The location point of the axis is the vertex of the parabola.
") XAxis;
		gp_Ax1 XAxis();

		/****** gp_Parab::YAxis ******/
		/****** md5 signature: 78f0cb55c98fbe890a49b3158d9f5039 ******/
		%feature("compactdefaultargs") YAxis;
		%feature("autodoc", "Return
-------
gp_Ax1

Description
-----------
It is an axis parallel to the directrix of the parabola. The location point of this axis is the vertex of the parabola.
") YAxis;
		gp_Ax1 YAxis();

};



%extend gp_Parab {
%pythoncode {
    def __getstate__(self):
        return self.DumpJson()
    }
};

%extend gp_Parab {
%pythoncode {
    def __setstate__(self, state):
        inst = gp_Parab()
        if inst.InitFromJson(state):
            self.this = inst.this
        else:
            raise IOError('Failed to set state of gp_Parab')
    }
};
%extend gp_Parab {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************
* class gp_Parab2d *
*******************/
class gp_Parab2d {
	public:
		/****** gp_Parab2d::gp_Parab2d ******/
		/****** md5 signature: 2d644ea01a160e309344c15bf662af6d ******/
		%feature("compactdefaultargs") gp_Parab2d;
		%feature("autodoc", "Return
-------
None

Description
-----------
Creates an indefinite parabola.
") gp_Parab2d;
		 gp_Parab2d();

		/****** gp_Parab2d::gp_Parab2d ******/
		/****** md5 signature: 2f52a497027454ca7d75f14b91c99aa0 ******/
		%feature("compactdefaultargs") gp_Parab2d;
		%feature("autodoc", "
Parameters
----------
theMirrorAxis: gp_Ax2d
theFocalLength: double
theSense: bool (optional, default to true)

Return
-------
None

Description
-----------
Creates a parabola with its vertex point, its axis of symmetry ('XAxis') and its focal length. The sense of parametrization is given by theSense. If theSense == True (by default) then right-handed coordinate system is used, otherwise - left-handed. Warnings: It is possible to have FocalLength = 0. In this case, the parabola looks like a line, which is parallel to the symmetry-axis. Raises ConstructionError if FocalLength < 0.0.
") gp_Parab2d;
		 gp_Parab2d(const gp_Ax2d & theMirrorAxis, const double theFocalLength, const bool theSense = true);

		/****** gp_Parab2d::gp_Parab2d ******/
		/****** md5 signature: 76d0957d2a9f6c3153c86333d414f3bd ******/
		%feature("compactdefaultargs") gp_Parab2d;
		%feature("autodoc", "
Parameters
----------
theAxes: gp_Ax22d
theFocalLength: double

Return
-------
None

Description
-----------
Creates a parabola with its vertex point, its axis of symmetry ('XAxis'), correspond Y-axis and its focal length. Warnings: It is possible to have FocalLength = 0. In this case, the parabola looks like a line, which is parallel to the symmetry-axis. Raises ConstructionError if Focal < 0.0.
") gp_Parab2d;
		 gp_Parab2d(const gp_Ax22d & theAxes, const double theFocalLength);

		/****** gp_Parab2d::gp_Parab2d ******/
		/****** md5 signature: 5d445d963be9d5329120158fa08d08e0 ******/
		%feature("compactdefaultargs") gp_Parab2d;
		%feature("autodoc", "
Parameters
----------
theDirectrix: gp_Ax2d
theFocus: gp_Pnt2d
theSense: bool (optional, default to true)

Return
-------
None

Description
-----------
Creates a parabola with the directrix and the focus point. Y-axis of the parabola (in User Coordinate System - UCS) is the direction of theDirectrix. X-axis always directs from theDirectrix to theFocus point and always comes through theFocus. Apex of the parabola is a middle point between the theFocus and the intersection point of theDirectrix and the X-axis. Warnings: It is possible to have FocalLength = 0 (when theFocus lies in theDirectrix). In this case, X-direction of the parabola is defined by theSense parameter. If theSense == True (by default) then right-handed coordinate system is used, otherwise - left-handed. Result parabola will look like a line, which is perpendicular to the directrix.
") gp_Parab2d;
		 gp_Parab2d(const gp_Ax2d & theDirectrix, const gp_Pnt2d & theFocus, const bool theSense = true);

		/****** gp_Parab2d::Axis ******/
		/****** md5 signature: e16486dd6873b7754da4b441ae82cea8 ******/
		%feature("compactdefaultargs") Axis;
		%feature("autodoc", "Return
-------
gp_Ax22d

Description
-----------
Returns the local coordinate system of the parabola. The 'Location' point of this axis is the vertex of the parabola.
") Axis;
		const gp_Ax22d Axis();

		/****** gp_Parab2d::Coefficients ******/
		/****** md5 signature: 05758c67cba8d099d67a3b8db74c835a ******/
		%feature("compactdefaultargs") Coefficients;
		%feature("autodoc", "
Parameters
----------

Return
-------
theA: double
theB: double
theC: double
theD: double
theE: double
theF: double

Description
-----------
Computes the coefficients of the implicit equation of the parabola (in WCS - World Coordinate System). @code theA * (X**2) + theB * (Y**2) + 2*theC*(X*Y) + 2*theD*X + 2*theE*Y + theF = 0. @endcode.
") Coefficients;
		void Coefficients(Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** gp_Parab2d::Directrix ******/
		/****** md5 signature: 73b0024abb8d6b70e9b99db78ce2b547 ******/
		%feature("compactdefaultargs") Directrix;
		%feature("autodoc", "Return
-------
gp_Ax2d

Description
-----------
Computes the directrix of the parabola. The directrix is: - a line parallel to the 'Y Direction' of the local coordinate system of this parabola, and - located on the negative side of the axis of symmetry, at a distance from the apex which is equal to the focal length of this parabola. The directrix is returned as an axis (a gp_Ax2d object), the origin of which is situated on the 'X Axis' of this parabola.
") Directrix;
		gp_Ax2d Directrix();

		/****** gp_Parab2d::Focal ******/
		/****** md5 signature: 7bd45dc7795d8b8364e41436e717d0c0 ******/
		%feature("compactdefaultargs") Focal;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns the distance between the vertex and the focus of the parabola.
") Focal;
		double Focal();

		/****** gp_Parab2d::Focus ******/
		/****** md5 signature: 9a6e1f369c5d331f334f23c6f9971485 ******/
		%feature("compactdefaultargs") Focus;
		%feature("autodoc", "Return
-------
gp_Pnt2d

Description
-----------
Returns the focus of the parabola.
") Focus;
		gp_Pnt2d Focus();

		/****** gp_Parab2d::IsDirect ******/
		/****** md5 signature: b020e2b79b290dfefeeb15e69cd69d05 ******/
		%feature("compactdefaultargs") IsDirect;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if the local coordinate system is direct and false in the other case.
") IsDirect;
		bool IsDirect();

		/****** gp_Parab2d::Location ******/
		/****** md5 signature: 61a7e489acd8b8c2b8c75b6b63b63221 ******/
		%feature("compactdefaultargs") Location;
		%feature("autodoc", "Return
-------
gp_Pnt2d

Description
-----------
Returns the vertex of the parabola.
") Location;
		const gp_Pnt2d Location();

		/****** gp_Parab2d::Mirror ******/
		/****** md5 signature: 55ca8745c822fce8b8395ef5348dd658 ******/
		%feature("compactdefaultargs") Mirror;
		%feature("autodoc", "
Parameters
----------
theP: gp_Pnt2d

Return
-------
None

Description
-----------
No available documentation.
") Mirror;
		void Mirror(const gp_Pnt2d & theP);

		/****** gp_Parab2d::Mirror ******/
		/****** md5 signature: c8b01b19fc436ab187f95301941edbc1 ******/
		%feature("compactdefaultargs") Mirror;
		%feature("autodoc", "
Parameters
----------
theA: gp_Ax2d

Return
-------
None

Description
-----------
No available documentation.
") Mirror;
		void Mirror(const gp_Ax2d & theA);

		/****** gp_Parab2d::MirrorAxis ******/
		/****** md5 signature: 5069d8faef2a1003898774944dfc2e45 ******/
		%feature("compactdefaultargs") MirrorAxis;
		%feature("autodoc", "Return
-------
gp_Ax2d

Description
-----------
Returns the symmetry axis of the parabola. The 'Location' point of this axis is the vertex of the parabola.
") MirrorAxis;
		gp_Ax2d MirrorAxis();

		/****** gp_Parab2d::Mirrored ******/
		/****** md5 signature: 9c2bc1fa03cc0863d8c12f6787fcb402 ******/
		%feature("compactdefaultargs") Mirrored;
		%feature("autodoc", "
Parameters
----------
theP: gp_Pnt2d

Return
-------
gp_Parab2d

Description
-----------
Performs the symmetrical transformation of a parabola with respect to the point theP which is the center of the symmetry.
") Mirrored;
		gp_Parab2d Mirrored(const gp_Pnt2d & theP);

		/****** gp_Parab2d::Mirrored ******/
		/****** md5 signature: 56c06c766ba186359c7604574bc42a1b ******/
		%feature("compactdefaultargs") Mirrored;
		%feature("autodoc", "
Parameters
----------
theA: gp_Ax2d

Return
-------
gp_Parab2d

Description
-----------
Performs the symmetrical transformation of a parabola with respect to an axis placement which is the axis of the symmetry.
") Mirrored;
		gp_Parab2d Mirrored(const gp_Ax2d & theA);

		/****** gp_Parab2d::Parameter ******/
		/****** md5 signature: 85ec99320a404add827632c19023768f ******/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns the distance between the focus and the directrix of the parabola.
") Parameter;
		double Parameter();

		/****** gp_Parab2d::Reverse ******/
		/****** md5 signature: a3a97cdcd6acb50dcac8455358723872 ******/
		%feature("compactdefaultargs") Reverse;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Reverse;
		void Reverse();

		/****** gp_Parab2d::Reversed ******/
		/****** md5 signature: 59f2ac198fa23533601f31e7dbb1e30e ******/
		%feature("compactdefaultargs") Reversed;
		%feature("autodoc", "Return
-------
gp_Parab2d

Description
-----------
Reverses the orientation of the local coordinate system of this parabola (the 'Y Direction' is reversed). Therefore, the implicit orientation of this parabola is reversed. Note: - Reverse assigns the result to this parabola, while - Reversed creates a new one.
") Reversed;
		gp_Parab2d Reversed();

		/****** gp_Parab2d::Rotate ******/
		/****** md5 signature: 084595cbfff710f953ac0ae91d732bf0 ******/
		%feature("compactdefaultargs") Rotate;
		%feature("autodoc", "
Parameters
----------
theP: gp_Pnt2d
theAng: double

Return
-------
None

Description
-----------
No available documentation.
") Rotate;
		void Rotate(const gp_Pnt2d & theP, const double theAng);

		/****** gp_Parab2d::Rotated ******/
		/****** md5 signature: be77646bbc71eca0f12c38c2b42ff6b6 ******/
		%feature("compactdefaultargs") Rotated;
		%feature("autodoc", "
Parameters
----------
theP: gp_Pnt2d
theAng: double

Return
-------
gp_Parab2d

Description
-----------
Rotates a parabola. theP is the center of the rotation. theAng is the angular value of the rotation in radians.
") Rotated;
		gp_Parab2d Rotated(const gp_Pnt2d & theP, const double theAng);

		/****** gp_Parab2d::Scale ******/
		/****** md5 signature: ce786424d6b372a402b20bab4c859bd5 ******/
		%feature("compactdefaultargs") Scale;
		%feature("autodoc", "
Parameters
----------
theP: gp_Pnt2d
theS: double

Return
-------
None

Description
-----------
No available documentation.
") Scale;
		void Scale(const gp_Pnt2d & theP, const double theS);

		/****** gp_Parab2d::Scaled ******/
		/****** md5 signature: 8d360e3175b2ba35ea0094a0937261f0 ******/
		%feature("compactdefaultargs") Scaled;
		%feature("autodoc", "
Parameters
----------
theP: gp_Pnt2d
theS: double

Return
-------
gp_Parab2d

Description
-----------
Scales a parabola. theS is the scaling value. If theS is negative the direction of the symmetry axis 'XAxis' is reversed and the direction of the 'YAxis' too.
") Scaled;
		gp_Parab2d Scaled(const gp_Pnt2d & theP, const double theS);

		/****** gp_Parab2d::SetAxis ******/
		/****** md5 signature: 5a80f392a0f25e50c7bd9a5c5fce8259 ******/
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
Changes the local coordinate system of the parabola. The 'Location' point of A becomes the vertex of the parabola.
") SetAxis;
		void SetAxis(const gp_Ax22d & theA);

		/****** gp_Parab2d::SetFocal ******/
		/****** md5 signature: c785f4bd82a932e84c186ba12c002892 ******/
		%feature("compactdefaultargs") SetFocal;
		%feature("autodoc", "
Parameters
----------
theFocal: double

Return
-------
None

Description
-----------
Changes the focal distance of the parabola Warnings: It is possible to have theFocal = 0. Raises ConstructionError if theFocal < 0.0.
") SetFocal;
		void SetFocal(const double theFocal);

		/****** gp_Parab2d::SetLocation ******/
		/****** md5 signature: 480b751d2165373d2617a13d19b91d48 ******/
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
Changes the 'Location' point of the parabola. It is the vertex of the parabola.
") SetLocation;
		void SetLocation(const gp_Pnt2d & theP);

		/****** gp_Parab2d::SetMirrorAxis ******/
		/****** md5 signature: 4a7a443247550892ef72ef782a1779bf ******/
		%feature("compactdefaultargs") SetMirrorAxis;
		%feature("autodoc", "
Parameters
----------
theA: gp_Ax2d

Return
-------
None

Description
-----------
Modifies this parabola, by redefining its local coordinate system so that its origin and 'X Direction' become those of the axis MA. The 'Y Direction' of the local coordinate system is then recomputed. The orientation of the local coordinate system is not modified.
") SetMirrorAxis;
		void SetMirrorAxis(const gp_Ax2d & theA);

		/****** gp_Parab2d::Transform ******/
		/****** md5 signature: 94f8045e6a4465708e872ec10cb3f4d1 ******/
		%feature("compactdefaultargs") Transform;
		%feature("autodoc", "
Parameters
----------
theT: gp_Trsf2d

Return
-------
None

Description
-----------
No available documentation.
") Transform;
		void Transform(const gp_Trsf2d & theT);

		/****** gp_Parab2d::Transformed ******/
		/****** md5 signature: 41be15349bfdbf87db07ecec6d33d1cd ******/
		%feature("compactdefaultargs") Transformed;
		%feature("autodoc", "
Parameters
----------
theT: gp_Trsf2d

Return
-------
gp_Parab2d

Description
-----------
Transforms an parabola with the transformation theT from class Trsf2d.
") Transformed;
		gp_Parab2d Transformed(const gp_Trsf2d & theT);

		/****** gp_Parab2d::Translate ******/
		/****** md5 signature: db1336b52b0bf528c543a448adb435f1 ******/
		%feature("compactdefaultargs") Translate;
		%feature("autodoc", "
Parameters
----------
theV: gp_Vec2d

Return
-------
None

Description
-----------
No available documentation.
") Translate;
		void Translate(const gp_Vec2d & theV);

		/****** gp_Parab2d::Translate ******/
		/****** md5 signature: fbfb79b99757b462451a758b25d06d71 ******/
		%feature("compactdefaultargs") Translate;
		%feature("autodoc", "
Parameters
----------
theP1: gp_Pnt2d
theP2: gp_Pnt2d

Return
-------
None

Description
-----------
No available documentation.
") Translate;
		void Translate(const gp_Pnt2d & theP1, const gp_Pnt2d & theP2);

		/****** gp_Parab2d::Translated ******/
		/****** md5 signature: b9bf53f29880fc22bea429bea066af11 ******/
		%feature("compactdefaultargs") Translated;
		%feature("autodoc", "
Parameters
----------
theV: gp_Vec2d

Return
-------
gp_Parab2d

Description
-----------
Translates a parabola in the direction of the vectorthe theV. The magnitude of the translation is the vector's magnitude.
") Translated;
		gp_Parab2d Translated(const gp_Vec2d & theV);

		/****** gp_Parab2d::Translated ******/
		/****** md5 signature: 5ed9ad576cc1f6916dfe5154d5e8e0eb ******/
		%feature("compactdefaultargs") Translated;
		%feature("autodoc", "
Parameters
----------
theP1: gp_Pnt2d
theP2: gp_Pnt2d

Return
-------
gp_Parab2d

Description
-----------
Translates a parabola from the point theP1 to the point theP2.
") Translated;
		gp_Parab2d Translated(const gp_Pnt2d & theP1, const gp_Pnt2d & theP2);

};



%extend gp_Parab2d {
%pythoncode {
    def __getstate__(self):
        return self.DumpJson()
    }
};

%extend gp_Parab2d {
%pythoncode {
    def __setstate__(self, state):
        inst = gp_Parab2d()
        if inst.InitFromJson(state):
            self.this = inst.this
        else:
            raise IOError('Failed to set state of gp_Parab2d')
    }
};
%extend gp_Parab2d {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************
* class gp_Pln *
***************/
class gp_Pln {
	public:
		/****** gp_Pln::gp_Pln ******/
		/****** md5 signature: 80cf526e067950f204a561881d7df9ab ******/
		%feature("compactdefaultargs") gp_Pln;
		%feature("autodoc", "Return
-------
None

Description
-----------
Creates a plane coincident with OXY plane of the reference coordinate system.
") gp_Pln;
		 gp_Pln();

		/****** gp_Pln::gp_Pln ******/
		/****** md5 signature: caeeba5b50a75fe095c242bb0844b6a0 ******/
		%feature("compactdefaultargs") gp_Pln;
		%feature("autodoc", "
Parameters
----------
theA3: gp_Ax3

Return
-------
None

Description
-----------
The coordinate system of the plane is defined with the axis placement theA3. The 'Direction' of theA3 defines the normal to the plane. The 'Location' of theA3 defines the location (origin) of the plane. The 'XDirection' and 'YDirection' of theA3 define the 'XAxis' and the 'YAxis' of the plane used to parametrize the plane.
") gp_Pln;
		 gp_Pln(const gp_Ax3 & theA3);

		/****** gp_Pln::gp_Pln ******/
		/****** md5 signature: cd878bd00d8e7f7e40bc5c64f2ded125 ******/
		%feature("compactdefaultargs") gp_Pln;
		%feature("autodoc", "
Parameters
----------
theP: gp_Pnt
theV: gp_Dir

Return
-------
None

Description
-----------
Creates a plane with the 'Location' point <theP> and the normal direction <theV>.
") gp_Pln;
		 gp_Pln(const gp_Pnt & theP, const gp_Dir & theV);

		/****** gp_Pln::gp_Pln ******/
		/****** md5 signature: 3a4a071a90c09c40b1a1c1709c9dac85 ******/
		%feature("compactdefaultargs") gp_Pln;
		%feature("autodoc", "
Parameters
----------
theA: double
theB: double
theC: double
theD: double

Return
-------
None

Description
-----------
Creates a plane from its cartesian equation: @code theA * X + theB * Y + theC * Z + theD = 0.0 @endcode Raises ConstructionError if std::sqrt (theA*theA + theB*theB + theC*theC) <= Resolution from gp.
") gp_Pln;
		 gp_Pln(const double theA, const double theB, const double theC, const double theD);

		/****** gp_Pln::Axis ******/
		/****** md5 signature: 92df3aa78c9ee700462ef461d4ed4603 ******/
		%feature("compactdefaultargs") Axis;
		%feature("autodoc", "Return
-------
gp_Ax1

Description
-----------
Returns the plane's normal Axis.
") Axis;
		const gp_Ax1 Axis();

		/****** gp_Pln::Coefficients ******/
		/****** md5 signature: d0a641454ebc08091d0273741e045662 ******/
		%feature("compactdefaultargs") Coefficients;
		%feature("autodoc", "
Parameters
----------

Return
-------
theA: double
theB: double
theC: double
theD: double

Description
-----------
Returns the coefficients of the plane's cartesian equation: @code theA * X + theB * Y + theC * Z + theD = 0. @endcode.
") Coefficients;
		void Coefficients(Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** gp_Pln::Contains ******/
		/****** md5 signature: 6b2b808a6ef1a34d288f6ca9564eaf1e ******/
		%feature("compactdefaultargs") Contains;
		%feature("autodoc", "
Parameters
----------
theP: gp_Pnt
theLinearTolerance: double

Return
-------
bool

Description
-----------
Returns true if this plane contains the point theP. This means that - the distance between point theP and this plane is less than or equal to theLinearTolerance, or - line L is normal to the 'main Axis' of the local coordinate system of this plane, within the tolerance AngularTolerance, and the distance between the origin of line L and this plane is less than or equal to theLinearTolerance.
") Contains;
		bool Contains(const gp_Pnt & theP, const double theLinearTolerance);

		/****** gp_Pln::Contains ******/
		/****** md5 signature: 9b11d497fe5c3d2ea021d0f61b881fcb ******/
		%feature("compactdefaultargs") Contains;
		%feature("autodoc", "
Parameters
----------
theL: gp_Lin
theLinearTolerance: double
theAngularTolerance: double

Return
-------
bool

Description
-----------
Returns true if this plane contains the line theL. This means that - the distance between point P and this plane is less than or equal to LinearTolerance, or - line theL is normal to the 'main Axis' of the local coordinate system of this plane, within the tolerance theAngularTolerance, and the distance between the origin of line theL and this plane is less than or equal to theLinearTolerance.
") Contains;
		bool Contains(const gp_Lin & theL, const double theLinearTolerance, const double theAngularTolerance);

		/****** gp_Pln::Direct ******/
		/****** md5 signature: 3a4dc03f7f44029dd167c527c17f95a7 ******/
		%feature("compactdefaultargs") Direct;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if the Ax3 is right handed.
") Direct;
		bool Direct();

		/****** gp_Pln::Distance ******/
		/****** md5 signature: cfde8c4a74dad61e749a8aa62938c5fe ******/
		%feature("compactdefaultargs") Distance;
		%feature("autodoc", "
Parameters
----------
theP: gp_Pnt

Return
-------
double

Description
-----------
Computes the distance between <self> and the point <theP>.
") Distance;
		double Distance(const gp_Pnt & theP);

		/****** gp_Pln::Distance ******/
		/****** md5 signature: 92771bab128eb715059b7ba7e02f1844 ******/
		%feature("compactdefaultargs") Distance;
		%feature("autodoc", "
Parameters
----------
theL: gp_Lin

Return
-------
double

Description
-----------
Computes the distance between <self> and the line <theL>.
") Distance;
		double Distance(const gp_Lin & theL);

		/****** gp_Pln::Distance ******/
		/****** md5 signature: 37f8de94d40a18af26e89cfa3fe636e0 ******/
		%feature("compactdefaultargs") Distance;
		%feature("autodoc", "
Parameters
----------
theOther: gp_Pln

Return
-------
double

Description
-----------
Computes the distance between two planes.
") Distance;
		double Distance(const gp_Pln & theOther);


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
		/****** gp_Pln::Location ******/
		/****** md5 signature: 2c3e536bdb11b2c2c46fc19fd8a6c569 ******/
		%feature("compactdefaultargs") Location;
		%feature("autodoc", "Return
-------
gp_Pnt

Description
-----------
Returns the plane's location (origin).
") Location;
		const gp_Pnt Location();

		/****** gp_Pln::Mirror ******/
		/****** md5 signature: 0f424be72f12474fe3ff290168029c4e ******/
		%feature("compactdefaultargs") Mirror;
		%feature("autodoc", "
Parameters
----------
theP: gp_Pnt

Return
-------
None

Description
-----------
No available documentation.
") Mirror;
		void Mirror(const gp_Pnt & theP);

		/****** gp_Pln::Mirror ******/
		/****** md5 signature: f508bc9f1879a959242732c259593a0a ******/
		%feature("compactdefaultargs") Mirror;
		%feature("autodoc", "
Parameters
----------
theA1: gp_Ax1

Return
-------
None

Description
-----------
No available documentation.
") Mirror;
		void Mirror(const gp_Ax1 & theA1);

		/****** gp_Pln::Mirror ******/
		/****** md5 signature: ba516d9e4a2b6af0ed16d37de915dd83 ******/
		%feature("compactdefaultargs") Mirror;
		%feature("autodoc", "
Parameters
----------
theA2: gp_Ax2

Return
-------
None

Description
-----------
No available documentation.
") Mirror;
		void Mirror(const gp_Ax2 & theA2);

		/****** gp_Pln::Mirrored ******/
		/****** md5 signature: e2ec0f1c232ae56953221ff01648663c ******/
		%feature("compactdefaultargs") Mirrored;
		%feature("autodoc", "
Parameters
----------
theP: gp_Pnt

Return
-------
gp_Pln

Description
-----------
Performs the symmetrical transformation of a plane with respect to the point <theP> which is the center of the symmetry Warnings: The normal direction to the plane is not changed. The 'XAxis' and the 'YAxis' are reversed.
") Mirrored;
		gp_Pln Mirrored(const gp_Pnt & theP);

		/****** gp_Pln::Mirrored ******/
		/****** md5 signature: b43a9cc6cd5f75787727807aea831878 ******/
		%feature("compactdefaultargs") Mirrored;
		%feature("autodoc", "
Parameters
----------
theA1: gp_Ax1

Return
-------
gp_Pln

Description
-----------
Performs the symmetrical transformation of a plane with respect to an axis placement which is the axis of the symmetry. The transformation is performed on the 'Location' point, on the 'XAxis' and the 'YAxis'. The resulting normal direction is the cross product between the 'XDirection' and the 'YDirection' after transformation if the initial plane was right handed, else it is the opposite.
") Mirrored;
		gp_Pln Mirrored(const gp_Ax1 & theA1);

		/****** gp_Pln::Mirrored ******/
		/****** md5 signature: 7cff4b4c39cd40764b36e5fbd6cf8b89 ******/
		%feature("compactdefaultargs") Mirrored;
		%feature("autodoc", "
Parameters
----------
theA2: gp_Ax2

Return
-------
gp_Pln

Description
-----------
Performs the symmetrical transformation of a plane with respect to an axis placement. The axis placement <A2> locates the plane of the symmetry. The transformation is performed on the 'Location' point, on the 'XAxis' and the 'YAxis'. The resulting normal direction is the cross product between the 'XDirection' and the 'YDirection' after transformation if the initial plane was right handed, else it is the opposite.
") Mirrored;
		gp_Pln Mirrored(const gp_Ax2 & theA2);

		/****** gp_Pln::Position ******/
		/****** md5 signature: 074afca7172f5d6d32484431775e9338 ******/
		%feature("compactdefaultargs") Position;
		%feature("autodoc", "Return
-------
gp_Ax3

Description
-----------
Returns the local coordinate system of the plane.
") Position;
		const gp_Ax3 Position();

		/****** gp_Pln::Rotate ******/
		/****** md5 signature: 652dfbf621c2c092ff5b68d608de4634 ******/
		%feature("compactdefaultargs") Rotate;
		%feature("autodoc", "
Parameters
----------
theA1: gp_Ax1
theAng: double

Return
-------
None

Description
-----------
No available documentation.
") Rotate;
		void Rotate(const gp_Ax1 & theA1, const double theAng);

		/****** gp_Pln::Rotated ******/
		/****** md5 signature: 62e4b3ad2c747bff5fe312ed7ccc3e2a ******/
		%feature("compactdefaultargs") Rotated;
		%feature("autodoc", "
Parameters
----------
theA1: gp_Ax1
theAng: double

Return
-------
gp_Pln

Description
-----------
Rotates a plane. theA1 is the axis of the rotation. theAng is the angular value of the rotation in radians.
") Rotated;
		gp_Pln Rotated(const gp_Ax1 & theA1, const double theAng);

		/****** gp_Pln::Scale ******/
		/****** md5 signature: 9fa53937842c668acd0d1cc256eb2732 ******/
		%feature("compactdefaultargs") Scale;
		%feature("autodoc", "
Parameters
----------
theP: gp_Pnt
theS: double

Return
-------
None

Description
-----------
No available documentation.
") Scale;
		void Scale(const gp_Pnt & theP, const double theS);

		/****** gp_Pln::Scaled ******/
		/****** md5 signature: 3d726575a97d6ab9903645ab02cb3566 ******/
		%feature("compactdefaultargs") Scaled;
		%feature("autodoc", "
Parameters
----------
theP: gp_Pnt
theS: double

Return
-------
gp_Pln

Description
-----------
Scales a plane. theS is the scaling value.
") Scaled;
		gp_Pln Scaled(const gp_Pnt & theP, const double theS);

		/****** gp_Pln::SetAxis ******/
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
Modifies this plane, by redefining its local coordinate system so that - its origin and 'main Direction' become those of the axis theA1 (the 'X Direction' and 'Y Direction' are then recomputed). Raises ConstructionError if the theA1 is parallel to the 'XAxis' of the plane.
") SetAxis;
		void SetAxis(const gp_Ax1 & theA1);

		/****** gp_Pln::SetLocation ******/
		/****** md5 signature: f1c958277e2e7de2571c6b5691801e2a ******/
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
Changes the origin of the plane.
") SetLocation;
		void SetLocation(const gp_Pnt & theLoc);

		/****** gp_Pln::SetPosition ******/
		/****** md5 signature: 967a77c1867c53ae2fb8ec3b93905c83 ******/
		%feature("compactdefaultargs") SetPosition;
		%feature("autodoc", "
Parameters
----------
theA3: gp_Ax3

Return
-------
None

Description
-----------
Changes the local coordinate system of the plane.
") SetPosition;
		void SetPosition(const gp_Ax3 & theA3);

		/****** gp_Pln::SignedDistance ******/
		/****** md5 signature: bb07198237e01b44f6eedb8f35167a7b ******/
		%feature("compactdefaultargs") SignedDistance;
		%feature("autodoc", "
Parameters
----------
theP: gp_Pnt

Return
-------
double

Description
-----------
Computes the signed distance between <self> and the point <theP>. The sign of the distance indicates on which side of the plane the point is located: - positive sign: the point is located in the direction of the plane normal, - negative sign: the point is located in the opposite direction to the plane normal, - zero: the point is located on the plane.
") SignedDistance;
		double SignedDistance(const gp_Pnt & theP);

		/****** gp_Pln::SignedDistance ******/
		/****** md5 signature: 876f0d9922545827817e5b82b9f89687 ******/
		%feature("compactdefaultargs") SignedDistance;
		%feature("autodoc", "
Parameters
----------
theL: gp_Lin

Return
-------
double

Description
-----------
Computes the signed distance between <self> and the line <theL>. The sign of the distance indicates on which side of the plane the line is located: - positive sign: the line is located in the direction of the plane normal, - negative sign: the line is located in the opposite direction to the plane normal, - zero: the line intersects the plane.
") SignedDistance;
		double SignedDistance(const gp_Lin & theL);

		/****** gp_Pln::SignedDistance ******/
		/****** md5 signature: ba96da172ea34fbe303c5425f2874c81 ******/
		%feature("compactdefaultargs") SignedDistance;
		%feature("autodoc", "
Parameters
----------
theOther: gp_Pln

Return
-------
double

Description
-----------
Computes the signed distance between two planes. The sign of the distance indicates on which side of <self> the other plane is located: - positive sign: the other plane is located in the direction of the plane normal, - negative sign: the other plane is located in the opposite direction to the plane normal, - zero: the planes intersect.
") SignedDistance;
		double SignedDistance(const gp_Pln & theOther);

		/****** gp_Pln::SquareDistance ******/
		/****** md5 signature: 39172ffa1631ca4554f394dd9bcca28e ******/
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "
Parameters
----------
theP: gp_Pnt

Return
-------
double

Description
-----------
Computes the square distance between <self> and the point <theP>.
") SquareDistance;
		double SquareDistance(const gp_Pnt & theP);

		/****** gp_Pln::SquareDistance ******/
		/****** md5 signature: 33085266b333130cffc086a14dcf99d1 ******/
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "
Parameters
----------
theL: gp_Lin

Return
-------
double

Description
-----------
Computes the square distance between <self> and the line <theL>.
") SquareDistance;
		double SquareDistance(const gp_Lin & theL);

		/****** gp_Pln::SquareDistance ******/
		/****** md5 signature: 73cd08a8ad064f877753e75ec6b831f4 ******/
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "
Parameters
----------
theOther: gp_Pln

Return
-------
double

Description
-----------
Computes the square distance between two planes.
") SquareDistance;
		double SquareDistance(const gp_Pln & theOther);

		/****** gp_Pln::Transform ******/
		/****** md5 signature: ad39e75f28af84e2a27f2cfbe322b0a3 ******/
		%feature("compactdefaultargs") Transform;
		%feature("autodoc", "
Parameters
----------
theT: gp_Trsf

Return
-------
None

Description
-----------
No available documentation.
") Transform;
		void Transform(const gp_Trsf & theT);

		/****** gp_Pln::Transformed ******/
		/****** md5 signature: a0f51f2c7779cdb47a1bad32b7e3c2a9 ******/
		%feature("compactdefaultargs") Transformed;
		%feature("autodoc", "
Parameters
----------
theT: gp_Trsf

Return
-------
gp_Pln

Description
-----------
Transforms a plane with the transformation theT from class Trsf. The transformation is performed on the 'Location' point, on the 'XAxis' and the 'YAxis'. The resulting normal direction is the cross product between the 'XDirection' and the 'YDirection' after transformation.
") Transformed;
		gp_Pln Transformed(const gp_Trsf & theT);

		/****** gp_Pln::Translate ******/
		/****** md5 signature: 8ae07d4c829c1eef2e7708ef5390638b ******/
		%feature("compactdefaultargs") Translate;
		%feature("autodoc", "
Parameters
----------
theV: gp_Vec

Return
-------
None

Description
-----------
No available documentation.
") Translate;
		void Translate(const gp_Vec & theV);

		/****** gp_Pln::Translate ******/
		/****** md5 signature: 279c13d6194eb867625753d756d110ab ******/
		%feature("compactdefaultargs") Translate;
		%feature("autodoc", "
Parameters
----------
theP1: gp_Pnt
theP2: gp_Pnt

Return
-------
None

Description
-----------
No available documentation.
") Translate;
		void Translate(const gp_Pnt & theP1, const gp_Pnt & theP2);

		/****** gp_Pln::Translated ******/
		/****** md5 signature: 67209b5f7f7361940e1e83ac755c9927 ******/
		%feature("compactdefaultargs") Translated;
		%feature("autodoc", "
Parameters
----------
theV: gp_Vec

Return
-------
gp_Pln

Description
-----------
Translates a plane in the direction of the vector theV. The magnitude of the translation is the vector's magnitude.
") Translated;
		gp_Pln Translated(const gp_Vec & theV);

		/****** gp_Pln::Translated ******/
		/****** md5 signature: 3abca93d239d853eb99098a8b3ee1333 ******/
		%feature("compactdefaultargs") Translated;
		%feature("autodoc", "
Parameters
----------
theP1: gp_Pnt
theP2: gp_Pnt

Return
-------
gp_Pln

Description
-----------
Translates a plane from the point theP1 to the point theP2.
") Translated;
		gp_Pln Translated(const gp_Pnt & theP1, const gp_Pnt & theP2);

		/****** gp_Pln::UReverse ******/
		/****** md5 signature: 69a43a8af82ddbb84c6e12cf963de477 ******/
		%feature("compactdefaultargs") UReverse;
		%feature("autodoc", "Return
-------
None

Description
-----------
Reverses the U parametrization of the plane reversing the XAxis.
") UReverse;
		void UReverse();

		/****** gp_Pln::VReverse ******/
		/****** md5 signature: 07b53fb5da02e3545309a68afe3655c9 ******/
		%feature("compactdefaultargs") VReverse;
		%feature("autodoc", "Return
-------
None

Description
-----------
Reverses the V parametrization of the plane reversing the YAxis.
") VReverse;
		void VReverse();

		/****** gp_Pln::XAxis ******/
		/****** md5 signature: 37d8185a57a29bf9b7aa10d76b1229a2 ******/
		%feature("compactdefaultargs") XAxis;
		%feature("autodoc", "Return
-------
gp_Ax1

Description
-----------
Returns the X axis of the plane.
") XAxis;
		gp_Ax1 XAxis();

		/****** gp_Pln::YAxis ******/
		/****** md5 signature: 78f0cb55c98fbe890a49b3158d9f5039 ******/
		%feature("compactdefaultargs") YAxis;
		%feature("autodoc", "Return
-------
gp_Ax1

Description
-----------
Returns the Y axis of the plane.
") YAxis;
		gp_Ax1 YAxis();

};



%extend gp_Pln {
%pythoncode {
    def __getstate__(self):
        return self.DumpJson()
    }
};

%extend gp_Pln {
%pythoncode {
    def __setstate__(self, state):
        inst = gp_Pln()
        if inst.InitFromJson(state):
            self.this = inst.this
        else:
            raise IOError('Failed to set state of gp_Pln')
    }
};
%extend gp_Pln {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************
* class gp_Pnt *
***************/
class gp_Pnt {
	public:
		/****** gp_Pnt::gp_Pnt ******/
		/****** md5 signature: 1687e84f0c2292d52b5d343cce201a1b ******/
		%feature("compactdefaultargs") gp_Pnt;
		%feature("autodoc", "Return
-------
None

Description
-----------
Creates a point with zero coordinates.
") gp_Pnt;
		 gp_Pnt();

		/****** gp_Pnt::gp_Pnt ******/
		/****** md5 signature: 531fc02ba7a82e6d1257ba3bad793763 ******/
		%feature("compactdefaultargs") gp_Pnt;
		%feature("autodoc", "
Parameters
----------
theCoord: gp_XYZ

Return
-------
None

Description
-----------
Creates a point from a XYZ object.
") gp_Pnt;
		 gp_Pnt(const gp_XYZ & theCoord);

		/****** gp_Pnt::gp_Pnt ******/
		/****** md5 signature: 67b0a45e497b41b16464b6d07cbcb62e ******/
		%feature("compactdefaultargs") gp_Pnt;
		%feature("autodoc", "
Parameters
----------
theXp: double
theYp: double
theZp: double

Return
-------
None

Description
-----------
Creates a point with its 3 cartesian's coordinates: theXp, theYp, theZp.
") gp_Pnt;
		 gp_Pnt(const double theXp, const double theYp, const double theZp);

		/****** gp_Pnt::BaryCenter ******/
		/****** md5 signature: 8788dcc29f67f0caf18fb444928f8063 ******/
		%feature("compactdefaultargs") BaryCenter;
		%feature("autodoc", "
Parameters
----------
theAlpha: double
theP: gp_Pnt
theBeta: double

Return
-------
None

Description
-----------
Assigns the result of the following expression to this point (theAlpha*this + theBeta*theP) / (theAlpha + theBeta).
") BaryCenter;
		void BaryCenter(const double theAlpha, const gp_Pnt & theP, const double theBeta);

		/****** gp_Pnt::ChangeCoord ******/
		/****** md5 signature: 61c5f64ac377764a268780a192e0e279 ******/
		%feature("compactdefaultargs") ChangeCoord;
		%feature("autodoc", "Return
-------
gp_XYZ

Description
-----------
Returns the coordinates of this point. Note: This syntax allows direct modification of the returned value.
") ChangeCoord;
		gp_XYZ ChangeCoord();

		/****** gp_Pnt::Coord ******/
		/****** md5 signature: 5ab919f0e89833f70cf3f70d2ba0fddc ******/
		%feature("compactdefaultargs") Coord;
		%feature("autodoc", "
Parameters
----------
theIndex: int

Return
-------
double

Description
-----------
Returns the coordinate of corresponding to the value of theIndex: theIndex = 1 => X is returned theIndex = 2 => Y is returned theIndex = 3 => Z is returned Raises OutOfRange if theIndex != {1, 2, 3}. Raised if theIndex != {1, 2, 3}.
") Coord;
		double Coord(const int theIndex);

		/****** gp_Pnt::Coord ******/
		/****** md5 signature: 897aaa865989df677eb862844cd58058 ******/
		%feature("compactdefaultargs") Coord;
		%feature("autodoc", "
Parameters
----------

Return
-------
theXp: double
theYp: double
theZp: double

Description
-----------
For this point gives its three coordinates theXp, theYp and theZp.
") Coord;
		void Coord(Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** gp_Pnt::Coord ******/
		/****** md5 signature: 827bafdc06abcbce9689ff76c4d27d01 ******/
		%feature("compactdefaultargs") Coord;
		%feature("autodoc", "Return
-------
gp_XYZ

Description
-----------
For this point, returns its three coordinates as a XYZ object.
") Coord;
		const gp_XYZ Coord();

		/****** gp_Pnt::Distance ******/
		/****** md5 signature: bae7354c546e0d7c75f36caadd7d4cb2 ******/
		%feature("compactdefaultargs") Distance;
		%feature("autodoc", "
Parameters
----------
theOther: gp_Pnt

Return
-------
double

Description
-----------
Computes the distance between two points.
") Distance;
		double Distance(const gp_Pnt & theOther);


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

        /****************** InitFromJson ******************/
        %feature("autodoc", "
Parameters
----------
json_string: the string

Return
-------
bool

Description
-----------
Init the object from a JSON string.
") InitFromJson;
        %extend{
            bool InitFromJson(std::string json_string) {
            std::stringstream s(json_string);
            Standard_Integer pos=2;
            return self->InitFromJson(s, pos);}
        };
		/****** gp_Pnt::IsEqual ******/
		/****** md5 signature: 278b73afed9fc83f6c4bab0e9df189c7 ******/
		%feature("compactdefaultargs") IsEqual;
		%feature("autodoc", "
Parameters
----------
theOther: gp_Pnt
theLinearTolerance: double

Return
-------
bool

Description
-----------
Comparison Returns True if the distance between the two points is lower or equal to theLinearTolerance.
") IsEqual;
		bool IsEqual(const gp_Pnt & theOther, const double theLinearTolerance);

		/****** gp_Pnt::Mirror ******/
		/****** md5 signature: 0f424be72f12474fe3ff290168029c4e ******/
		%feature("compactdefaultargs") Mirror;
		%feature("autodoc", "
Parameters
----------
theP: gp_Pnt

Return
-------
None

Description
-----------
Performs the symmetrical transformation of a point with respect to the point theP which is the center of the symmetry.
") Mirror;
		void Mirror(const gp_Pnt & theP);

		/****** gp_Pnt::Mirror ******/
		/****** md5 signature: f508bc9f1879a959242732c259593a0a ******/
		%feature("compactdefaultargs") Mirror;
		%feature("autodoc", "
Parameters
----------
theA1: gp_Ax1

Return
-------
None

Description
-----------
No available documentation.
") Mirror;
		void Mirror(const gp_Ax1 & theA1);

		/****** gp_Pnt::Mirror ******/
		/****** md5 signature: ba516d9e4a2b6af0ed16d37de915dd83 ******/
		%feature("compactdefaultargs") Mirror;
		%feature("autodoc", "
Parameters
----------
theA2: gp_Ax2

Return
-------
None

Description
-----------
No available documentation.
") Mirror;
		void Mirror(const gp_Ax2 & theA2);

		/****** gp_Pnt::Mirrored ******/
		/****** md5 signature: c665a2a180dfa256f755e4ef81746fb3 ******/
		%feature("compactdefaultargs") Mirrored;
		%feature("autodoc", "
Parameters
----------
theP: gp_Pnt

Return
-------
gp_Pnt

Description
-----------
Performs the symmetrical transformation of a point with respect to an axis placement which is the axis of the symmetry.
") Mirrored;
		gp_Pnt Mirrored(const gp_Pnt & theP);

		/****** gp_Pnt::Mirrored ******/
		/****** md5 signature: 850642e772305b4ff75ff859a63dfa8c ******/
		%feature("compactdefaultargs") Mirrored;
		%feature("autodoc", "
Parameters
----------
theA1: gp_Ax1

Return
-------
gp_Pnt

Description
-----------
Performs the symmetrical transformation of a point with respect to a plane. The axis placement theA2 locates the plane of the symmetry: (Location, XDirection, YDirection).
") Mirrored;
		gp_Pnt Mirrored(const gp_Ax1 & theA1);

		/****** gp_Pnt::Mirrored ******/
		/****** md5 signature: e7255963f6e5fcfe14c0e76b6d0f1073 ******/
		%feature("compactdefaultargs") Mirrored;
		%feature("autodoc", "
Parameters
----------
theA2: gp_Ax2

Return
-------
gp_Pnt

Description
-----------
Rotates a point. theA1 is the axis of the rotation. theAng is the angular value of the rotation in radians.
") Mirrored;
		gp_Pnt Mirrored(const gp_Ax2 & theA2);

		/****** gp_Pnt::Rotate ******/
		/****** md5 signature: 1ad1f6be15e850ce247e9683ec6abb78 ******/
		%feature("compactdefaultargs") Rotate;
		%feature("autodoc", "
Parameters
----------
theA1: gp_Ax1
theAng: double

Return
-------
None

Description
-----------
No available documentation.
") Rotate;
		void Rotate(const gp_Ax1 & theA1, const double theAng);

		/****** gp_Pnt::Rotated ******/
		/****** md5 signature: 48eba01ba251db0db80012ef03ff53b4 ******/
		%feature("compactdefaultargs") Rotated;
		%feature("autodoc", "
Parameters
----------
theA1: gp_Ax1
theAng: double

Return
-------
gp_Pnt

Description
-----------
No available documentation.
") Rotated;
		gp_Pnt Rotated(const gp_Ax1 & theA1, const double theAng);

		/****** gp_Pnt::Scale ******/
		/****** md5 signature: a0818e7c6d92476e6a166186b606f69e ******/
		%feature("compactdefaultargs") Scale;
		%feature("autodoc", "
Parameters
----------
theP: gp_Pnt
theS: double

Return
-------
None

Description
-----------
Scales a point. theS is the scaling value.
") Scale;
		void Scale(const gp_Pnt & theP, const double theS);

		/****** gp_Pnt::Scaled ******/
		/****** md5 signature: 036f9719532450af5daf4733bf4c9ab5 ******/
		%feature("compactdefaultargs") Scaled;
		%feature("autodoc", "
Parameters
----------
theP: gp_Pnt
theS: double

Return
-------
gp_Pnt

Description
-----------
No available documentation.
") Scaled;
		gp_Pnt Scaled(const gp_Pnt & theP, const double theS);

		/****** gp_Pnt::SetCoord ******/
		/****** md5 signature: 2133811cb7e2b132083ab2453e33c15c ******/
		%feature("compactdefaultargs") SetCoord;
		%feature("autodoc", "
Parameters
----------
theIndex: int
theXi: double

Return
-------
None

Description
-----------
Changes the coordinate of range theIndex: theIndex = 1 => X is modified theIndex = 2 => Y is modified theIndex = 3 => Z is modified Raised if theIndex != {1, 2, 3}.
") SetCoord;
		void SetCoord(const int theIndex, const double theXi);

		/****** gp_Pnt::SetCoord ******/
		/****** md5 signature: 6d8dfcb5f4d90fdc61c3fcfecdd7a14f ******/
		%feature("compactdefaultargs") SetCoord;
		%feature("autodoc", "
Parameters
----------
theXp: double
theYp: double
theZp: double

Return
-------
None

Description
-----------
For this point, assigns the values theXp, theYp and theZp to its three coordinates.
") SetCoord;
		void SetCoord(const double theXp, const double theYp, const double theZp);

		/****** gp_Pnt::SetX ******/
		/****** md5 signature: bbe6dad756ab4b51b477b97b5d2997db ******/
		%feature("compactdefaultargs") SetX;
		%feature("autodoc", "
Parameters
----------
theX: double

Return
-------
None

Description
-----------
Assigns the given value to the X coordinate of this point.
") SetX;
		void SetX(const double theX);

		/****** gp_Pnt::SetXYZ ******/
		/****** md5 signature: 758229ef2bc42f66d281f37ce53c4741 ******/
		%feature("compactdefaultargs") SetXYZ;
		%feature("autodoc", "
Parameters
----------
theCoord: gp_XYZ

Return
-------
None

Description
-----------
Assigns the three coordinates of theCoord to this point.
") SetXYZ;
		void SetXYZ(const gp_XYZ & theCoord);

		/****** gp_Pnt::SetY ******/
		/****** md5 signature: 84504129c782de522a0d69ceb36f6af7 ******/
		%feature("compactdefaultargs") SetY;
		%feature("autodoc", "
Parameters
----------
theY: double

Return
-------
None

Description
-----------
Assigns the given value to the Y coordinate of this point.
") SetY;
		void SetY(const double theY);

		/****** gp_Pnt::SetZ ******/
		/****** md5 signature: f5e8a0ff6e3eaaf9fdb056b8c6159170 ******/
		%feature("compactdefaultargs") SetZ;
		%feature("autodoc", "
Parameters
----------
theZ: double

Return
-------
None

Description
-----------
Assigns the given value to the Z coordinate of this point.
") SetZ;
		void SetZ(const double theZ);

		/****** gp_Pnt::SquareDistance ******/
		/****** md5 signature: e53856a527c0306c74be2fb7bf626a8a ******/
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "
Parameters
----------
theOther: gp_Pnt

Return
-------
double

Description
-----------
Computes the square distance between two points.
") SquareDistance;
		double SquareDistance(const gp_Pnt & theOther);

		/****** gp_Pnt::Transform ******/
		/****** md5 signature: 0737a7286be728220e1a55ba0d6eafc3 ******/
		%feature("compactdefaultargs") Transform;
		%feature("autodoc", "
Parameters
----------
theT: gp_Trsf

Return
-------
None

Description
-----------
Transforms a point with the transformation T.
") Transform;
		void Transform(const gp_Trsf & theT);

		/****** gp_Pnt::Transformed ******/
		/****** md5 signature: b8b244cee1953af992aa6ca96ff8e3f7 ******/
		%feature("compactdefaultargs") Transformed;
		%feature("autodoc", "
Parameters
----------
theT: gp_Trsf

Return
-------
gp_Pnt

Description
-----------
No available documentation.
") Transformed;
		gp_Pnt Transformed(const gp_Trsf & theT);

		/****** gp_Pnt::Translate ******/
		/****** md5 signature: 5b4b661c9d558be133465b425045001b ******/
		%feature("compactdefaultargs") Translate;
		%feature("autodoc", "
Parameters
----------
theV: gp_Vec

Return
-------
None

Description
-----------
Translates a point in the direction of the vector theV. The magnitude of the translation is the vector's magnitude.
") Translate;
		void Translate(const gp_Vec & theV);

		/****** gp_Pnt::Translate ******/
		/****** md5 signature: 279c13d6194eb867625753d756d110ab ******/
		%feature("compactdefaultargs") Translate;
		%feature("autodoc", "
Parameters
----------
theP1: gp_Pnt
theP2: gp_Pnt

Return
-------
None

Description
-----------
Translates a point from the point theP1 to the point theP2.
") Translate;
		void Translate(const gp_Pnt & theP1, const gp_Pnt & theP2);

		/****** gp_Pnt::Translated ******/
		/****** md5 signature: ab8fd4deebfa7c5ef5ad7acdb6da5f1d ******/
		%feature("compactdefaultargs") Translated;
		%feature("autodoc", "
Parameters
----------
theV: gp_Vec

Return
-------
gp_Pnt

Description
-----------
No available documentation.
") Translated;
		gp_Pnt Translated(const gp_Vec & theV);

		/****** gp_Pnt::Translated ******/
		/****** md5 signature: 79417c690d97d0e3cfb5c1404d419091 ******/
		%feature("compactdefaultargs") Translated;
		%feature("autodoc", "
Parameters
----------
theP1: gp_Pnt
theP2: gp_Pnt

Return
-------
gp_Pnt

Description
-----------
No available documentation.
") Translated;
		gp_Pnt Translated(const gp_Pnt & theP1, const gp_Pnt & theP2);

		/****** gp_Pnt::X ******/
		/****** md5 signature: c418db3e494968281737cca9c90ecbdf ******/
		%feature("compactdefaultargs") X;
		%feature("autodoc", "Return
-------
double

Description
-----------
For this point, returns its X coordinate.
") X;
		double X();

		/****** gp_Pnt::XYZ ******/
		/****** md5 signature: db771f2137a73770f8fa68788fc317cc ******/
		%feature("compactdefaultargs") XYZ;
		%feature("autodoc", "Return
-------
gp_XYZ

Description
-----------
For this point, returns its three coordinates as a XYZ object.
") XYZ;
		const gp_XYZ XYZ();

		/****** gp_Pnt::Y ******/
		/****** md5 signature: 25eefb608c358bc135b3158209ee8901 ******/
		%feature("compactdefaultargs") Y;
		%feature("autodoc", "Return
-------
double

Description
-----------
For this point, returns its Y coordinate.
") Y;
		double Y();

		/****** gp_Pnt::Z ******/
		/****** md5 signature: 078eb43f219d180be16ce27c9708e49a ******/
		%feature("compactdefaultargs") Z;
		%feature("autodoc", "Return
-------
double

Description
-----------
For this point, returns its Z coordinate.
") Z;
		double Z();

};



%extend gp_Pnt {
%pythoncode {
    def __getstate__(self):
        return self.DumpJson()
    }
};

%extend gp_Pnt {
%pythoncode {
    def __setstate__(self, state):
        inst = gp_Pnt()
        if inst.InitFromJson(state):
            self.this = inst.this
        else:
            raise IOError('Failed to set state of gp_Pnt')
    }
};
%extend gp_Pnt {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************
* class gp_Pnt2d *
*****************/
class gp_Pnt2d {
	public:
		/****** gp_Pnt2d::gp_Pnt2d ******/
		/****** md5 signature: d86d8f0dd17d7f81c2d0556aac4aefeb ******/
		%feature("compactdefaultargs") gp_Pnt2d;
		%feature("autodoc", "Return
-------
None

Description
-----------
Creates a point with zero coordinates.
") gp_Pnt2d;
		 gp_Pnt2d();

		/****** gp_Pnt2d::gp_Pnt2d ******/
		/****** md5 signature: 250f7562f3990fe1f3c803a237d65eff ******/
		%feature("compactdefaultargs") gp_Pnt2d;
		%feature("autodoc", "
Parameters
----------
theCoord: gp_XY

Return
-------
None

Description
-----------
Creates a point with a doublet of coordinates.
") gp_Pnt2d;
		 gp_Pnt2d(const gp_XY & theCoord);

		/****** gp_Pnt2d::gp_Pnt2d ******/
		/****** md5 signature: a3ce175163b0d5ba4ff3190476ac946a ******/
		%feature("compactdefaultargs") gp_Pnt2d;
		%feature("autodoc", "
Parameters
----------
theXp: double
theYp: double

Return
-------
None

Description
-----------
Creates a point with its 2 cartesian's coordinates: theXp, theYp.
") gp_Pnt2d;
		 gp_Pnt2d(const double theXp, const double theYp);

		/****** gp_Pnt2d::ChangeCoord ******/
		/****** md5 signature: 7a1739876ee8b70a7e4e19cdf97c91e7 ******/
		%feature("compactdefaultargs") ChangeCoord;
		%feature("autodoc", "Return
-------
gp_XY

Description
-----------
Returns the coordinates of this point. Note: This syntax allows direct modification of the returned value.
") ChangeCoord;
		gp_XY ChangeCoord();

		/****** gp_Pnt2d::Coord ******/
		/****** md5 signature: 5ab919f0e89833f70cf3f70d2ba0fddc ******/
		%feature("compactdefaultargs") Coord;
		%feature("autodoc", "
Parameters
----------
theIndex: int

Return
-------
double

Description
-----------
Returns the coordinate of range theIndex: theIndex = 1 => X is returned theIndex = 2 => Y is returned Raises OutOfRange if theIndex != {1, 2}.
") Coord;
		double Coord(const int theIndex);

		/****** gp_Pnt2d::Coord ******/
		/****** md5 signature: 6b06e062e0858d98171402dbc1df4b72 ******/
		%feature("compactdefaultargs") Coord;
		%feature("autodoc", "
Parameters
----------

Return
-------
theXp: double
theYp: double

Description
-----------
For this point returns its two coordinates as a number pair.
") Coord;
		void Coord(Standard_Real &OutValue, Standard_Real &OutValue);

		/****** gp_Pnt2d::Coord ******/
		/****** md5 signature: cb055c5dd3f340a455988e697af25dbc ******/
		%feature("compactdefaultargs") Coord;
		%feature("autodoc", "Return
-------
gp_XY

Description
-----------
For this point, returns its two coordinates as a number pair.
") Coord;
		const gp_XY Coord();

		/****** gp_Pnt2d::Distance ******/
		/****** md5 signature: 48e46c9a0581e340e20a01349d0818b3 ******/
		%feature("compactdefaultargs") Distance;
		%feature("autodoc", "
Parameters
----------
theOther: gp_Pnt2d

Return
-------
double

Description
-----------
Computes the distance between two points.
") Distance;
		double Distance(const gp_Pnt2d & theOther);


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
		/****** gp_Pnt2d::IsEqual ******/
		/****** md5 signature: 5dad23ca5d0a64e2e6abe911bb384eae ******/
		%feature("compactdefaultargs") IsEqual;
		%feature("autodoc", "
Parameters
----------
theOther: gp_Pnt2d
theLinearTolerance: double

Return
-------
bool

Description
-----------
Comparison Returns True if the distance between the two points is lower or equal to theLinearTolerance.
") IsEqual;
		bool IsEqual(const gp_Pnt2d & theOther, const double theLinearTolerance);

		/****** gp_Pnt2d::Mirror ******/
		/****** md5 signature: 55ca8745c822fce8b8395ef5348dd658 ******/
		%feature("compactdefaultargs") Mirror;
		%feature("autodoc", "
Parameters
----------
theP: gp_Pnt2d

Return
-------
None

Description
-----------
Performs the symmetrical transformation of a point with respect to the point theP which is the center of the symmetry.
") Mirror;
		void Mirror(const gp_Pnt2d & theP);

		/****** gp_Pnt2d::Mirror ******/
		/****** md5 signature: c8b01b19fc436ab187f95301941edbc1 ******/
		%feature("compactdefaultargs") Mirror;
		%feature("autodoc", "
Parameters
----------
theA: gp_Ax2d

Return
-------
None

Description
-----------
No available documentation.
") Mirror;
		void Mirror(const gp_Ax2d & theA);

		/****** gp_Pnt2d::Mirrored ******/
		/****** md5 signature: 6f637df6826ccb5e8911d15fc0607e34 ******/
		%feature("compactdefaultargs") Mirrored;
		%feature("autodoc", "
Parameters
----------
theP: gp_Pnt2d

Return
-------
gp_Pnt2d

Description
-----------
Performs the symmetrical transformation of a point with respect to an axis placement which is the axis.
") Mirrored;
		gp_Pnt2d Mirrored(const gp_Pnt2d & theP);

		/****** gp_Pnt2d::Mirrored ******/
		/****** md5 signature: 569677a2f8357906d65f360fe471f3ae ******/
		%feature("compactdefaultargs") Mirrored;
		%feature("autodoc", "
Parameters
----------
theA: gp_Ax2d

Return
-------
gp_Pnt2d

Description
-----------
No available documentation.
") Mirrored;
		gp_Pnt2d Mirrored(const gp_Ax2d & theA);

		/****** gp_Pnt2d::Rotate ******/
		/****** md5 signature: 7b903ea495df9da9f0d582a332f1eb65 ******/
		%feature("compactdefaultargs") Rotate;
		%feature("autodoc", "
Parameters
----------
theP: gp_Pnt2d
theAng: double

Return
-------
None

Description
-----------
Rotates a point. theA1 is the axis of the rotation. Ang is the angular value of the rotation in radians.
") Rotate;
		void Rotate(const gp_Pnt2d & theP, const double theAng);

		/****** gp_Pnt2d::Rotated ******/
		/****** md5 signature: 4b11ba17d4e75f73956a3446ec345495 ******/
		%feature("compactdefaultargs") Rotated;
		%feature("autodoc", "
Parameters
----------
theP: gp_Pnt2d
theAng: double

Return
-------
gp_Pnt2d

Description
-----------
No available documentation.
") Rotated;
		gp_Pnt2d Rotated(const gp_Pnt2d & theP, const double theAng);

		/****** gp_Pnt2d::Scale ******/
		/****** md5 signature: a5e430be908f22e149b2ec4c0439c1fd ******/
		%feature("compactdefaultargs") Scale;
		%feature("autodoc", "
Parameters
----------
theP: gp_Pnt2d
theS: double

Return
-------
None

Description
-----------
Scales a point. theS is the scaling value.
") Scale;
		void Scale(const gp_Pnt2d & theP, const double theS);

		/****** gp_Pnt2d::Scaled ******/
		/****** md5 signature: 2e9039f90afa37a75dec93ca9d25cb8d ******/
		%feature("compactdefaultargs") Scaled;
		%feature("autodoc", "
Parameters
----------
theP: gp_Pnt2d
theS: double

Return
-------
gp_Pnt2d

Description
-----------
No available documentation.
") Scaled;
		gp_Pnt2d Scaled(const gp_Pnt2d & theP, const double theS);

		/****** gp_Pnt2d::SetCoord ******/
		/****** md5 signature: 2133811cb7e2b132083ab2453e33c15c ******/
		%feature("compactdefaultargs") SetCoord;
		%feature("autodoc", "
Parameters
----------
theIndex: int
theXi: double

Return
-------
None

Description
-----------
Assigns the value Xi to the coordinate that corresponds to theIndex: theIndex = 1 => X is modified theIndex = 2 => Y is modified Raises OutOfRange if theIndex != {1, 2}.
") SetCoord;
		void SetCoord(const int theIndex, const double theXi);

		/****** gp_Pnt2d::SetCoord ******/
		/****** md5 signature: 9756974df3416811000eb556e6d90e38 ******/
		%feature("compactdefaultargs") SetCoord;
		%feature("autodoc", "
Parameters
----------
theXp: double
theYp: double

Return
-------
None

Description
-----------
For this point, assigns the values theXp and theYp to its two coordinates.
") SetCoord;
		void SetCoord(const double theXp, const double theYp);

		/****** gp_Pnt2d::SetX ******/
		/****** md5 signature: bbe6dad756ab4b51b477b97b5d2997db ******/
		%feature("compactdefaultargs") SetX;
		%feature("autodoc", "
Parameters
----------
theX: double

Return
-------
None

Description
-----------
Assigns the given value to the X coordinate of this point.
") SetX;
		void SetX(const double theX);

		/****** gp_Pnt2d::SetXY ******/
		/****** md5 signature: bc5d04dce08a95b9336c5c57a5c630d1 ******/
		%feature("compactdefaultargs") SetXY;
		%feature("autodoc", "
Parameters
----------
theCoord: gp_XY

Return
-------
None

Description
-----------
Assigns the two coordinates of Coord to this point.
") SetXY;
		void SetXY(const gp_XY & theCoord);

		/****** gp_Pnt2d::SetY ******/
		/****** md5 signature: 84504129c782de522a0d69ceb36f6af7 ******/
		%feature("compactdefaultargs") SetY;
		%feature("autodoc", "
Parameters
----------
theY: double

Return
-------
None

Description
-----------
Assigns the given value to the Y coordinate of this point.
") SetY;
		void SetY(const double theY);

		/****** gp_Pnt2d::SquareDistance ******/
		/****** md5 signature: d5b0d923c7e753c38f3c8c5bc59ffd48 ******/
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "
Parameters
----------
theOther: gp_Pnt2d

Return
-------
double

Description
-----------
Computes the square distance between two points.
") SquareDistance;
		double SquareDistance(const gp_Pnt2d & theOther);

		/****** gp_Pnt2d::Transform ******/
		/****** md5 signature: 3afd1642fe7b497a7dbcbc3902ad7fa7 ******/
		%feature("compactdefaultargs") Transform;
		%feature("autodoc", "
Parameters
----------
theT: gp_Trsf2d

Return
-------
None

Description
-----------
Transforms a point with the transformation theT.
") Transform;
		void Transform(const gp_Trsf2d & theT);

		/****** gp_Pnt2d::Transformed ******/
		/****** md5 signature: 156a0e54c907356c56d5ce58236049de ******/
		%feature("compactdefaultargs") Transformed;
		%feature("autodoc", "
Parameters
----------
theT: gp_Trsf2d

Return
-------
gp_Pnt2d

Description
-----------
No available documentation.
") Transformed;
		gp_Pnt2d Transformed(const gp_Trsf2d & theT);

		/****** gp_Pnt2d::Translate ******/
		/****** md5 signature: 97e80834624b01059aa4a2253c966e9a ******/
		%feature("compactdefaultargs") Translate;
		%feature("autodoc", "
Parameters
----------
theV: gp_Vec2d

Return
-------
None

Description
-----------
Translates a point in the direction of the vector theV. The magnitude of the translation is the vector's magnitude.
") Translate;
		void Translate(const gp_Vec2d & theV);

		/****** gp_Pnt2d::Translate ******/
		/****** md5 signature: fbfb79b99757b462451a758b25d06d71 ******/
		%feature("compactdefaultargs") Translate;
		%feature("autodoc", "
Parameters
----------
theP1: gp_Pnt2d
theP2: gp_Pnt2d

Return
-------
None

Description
-----------
Translates a point from the point theP1 to the point theP2.
") Translate;
		void Translate(const gp_Pnt2d & theP1, const gp_Pnt2d & theP2);

		/****** gp_Pnt2d::Translated ******/
		/****** md5 signature: 09a7ecb5d9474519c3cbe21f3999b616 ******/
		%feature("compactdefaultargs") Translated;
		%feature("autodoc", "
Parameters
----------
theV: gp_Vec2d

Return
-------
gp_Pnt2d

Description
-----------
No available documentation.
") Translated;
		gp_Pnt2d Translated(const gp_Vec2d & theV);

		/****** gp_Pnt2d::Translated ******/
		/****** md5 signature: fde178f76562eb239b441681db956925 ******/
		%feature("compactdefaultargs") Translated;
		%feature("autodoc", "
Parameters
----------
theP1: gp_Pnt2d
theP2: gp_Pnt2d

Return
-------
gp_Pnt2d

Description
-----------
No available documentation.
") Translated;
		gp_Pnt2d Translated(const gp_Pnt2d & theP1, const gp_Pnt2d & theP2);

		/****** gp_Pnt2d::X ******/
		/****** md5 signature: c418db3e494968281737cca9c90ecbdf ******/
		%feature("compactdefaultargs") X;
		%feature("autodoc", "Return
-------
double

Description
-----------
For this point, returns its X coordinate.
") X;
		double X();

		/****** gp_Pnt2d::XY ******/
		/****** md5 signature: 370a020741cd39a80c497bd378673a3a ******/
		%feature("compactdefaultargs") XY;
		%feature("autodoc", "Return
-------
gp_XY

Description
-----------
For this point, returns its two coordinates as a number pair.
") XY;
		const gp_XY XY();

		/****** gp_Pnt2d::Y ******/
		/****** md5 signature: 25eefb608c358bc135b3158209ee8901 ******/
		%feature("compactdefaultargs") Y;
		%feature("autodoc", "Return
-------
double

Description
-----------
For this point, returns its Y coordinate.
") Y;
		double Y();

};



%extend gp_Pnt2d {
%pythoncode {
    def __getstate__(self):
        return self.DumpJson()
    }
};

%extend gp_Pnt2d {
%pythoncode {
    def __setstate__(self, state):
        inst = gp_Pnt2d()
        if inst.InitFromJson(state):
            self.this = inst.this
        else:
            raise IOError('Failed to set state of gp_Pnt2d')
    }
};
%extend gp_Pnt2d {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************
* class gp_Quaternion *
**********************/
class gp_Quaternion {
	public:
		/****** gp_Quaternion::gp_Quaternion ******/
		/****** md5 signature: 3782b0ce611910b9484b3fd3cfd214c2 ******/
		%feature("compactdefaultargs") gp_Quaternion;
		%feature("autodoc", "Return
-------
None

Description
-----------
Creates an identity quaternion.
") gp_Quaternion;
		 gp_Quaternion();

		/****** gp_Quaternion::gp_Quaternion ******/
		/****** md5 signature: 7c0e65edacb2efff04f50bb0153ef953 ******/
		%feature("compactdefaultargs") gp_Quaternion;
		%feature("autodoc", "
Parameters
----------
theX: double
theY: double
theZ: double
theW: double

Return
-------
None

Description
-----------
Creates quaternion directly from component values.
") gp_Quaternion;
		 gp_Quaternion(const double theX, const double theY, const double theZ, const double theW);

		/****** gp_Quaternion::gp_Quaternion ******/
		/****** md5 signature: 186a9071fd1f4bab52cf360e731389af ******/
		%feature("compactdefaultargs") gp_Quaternion;
		%feature("autodoc", "
Parameters
----------
theVecFrom: gp_Vec
theVecTo: gp_Vec

Return
-------
None

Description
-----------
Creates quaternion representing shortest-arc rotation operator producing vector theVecTo from vector theVecFrom.
") gp_Quaternion;
		 gp_Quaternion(const gp_Vec & theVecFrom, const gp_Vec & theVecTo);

		/****** gp_Quaternion::gp_Quaternion ******/
		/****** md5 signature: 7fd5e10c59598813a82dcb16327b3428 ******/
		%feature("compactdefaultargs") gp_Quaternion;
		%feature("autodoc", "
Parameters
----------
theVecFrom: gp_Vec
theVecTo: gp_Vec
theHelpCrossVec: gp_Vec

Return
-------
None

Description
-----------
Creates quaternion representing shortest-arc rotation operator producing vector theVecTo from vector theVecFrom. Additional vector theHelpCrossVec defines preferred direction for rotation and is used when theVecTo and theVecFrom are directed oppositely.
") gp_Quaternion;
		 gp_Quaternion(const gp_Vec & theVecFrom, const gp_Vec & theVecTo, const gp_Vec & theHelpCrossVec);

		/****** gp_Quaternion::gp_Quaternion ******/
		/****** md5 signature: eebe9a588f1d5cd0bf94b0e5d3dc83b0 ******/
		%feature("compactdefaultargs") gp_Quaternion;
		%feature("autodoc", "
Parameters
----------
theAxis: gp_Vec
theAngle: double

Return
-------
None

Description
-----------
Creates quaternion representing rotation on angle theAngle around vector theAxis.
") gp_Quaternion;
		 gp_Quaternion(const gp_Vec & theAxis, const double theAngle);

		/****** gp_Quaternion::gp_Quaternion ******/
		/****** md5 signature: f72061baca48c37e52bb33d3fb34b2c9 ******/
		%feature("compactdefaultargs") gp_Quaternion;
		%feature("autodoc", "
Parameters
----------
theMat: gp_Mat

Return
-------
None

Description
-----------
Creates quaternion from rotation matrix 3*3 (which should be orthonormal skew-symmetric matrix).
") gp_Quaternion;
		 gp_Quaternion(const gp_Mat & theMat);

		/****** gp_Quaternion::Add ******/
		/****** md5 signature: 577e387514ebcf93ca8a2efb45f89a1e ******/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
theOther: gp_Quaternion

Return
-------
None

Description
-----------
Adds components of other quaternion; result is 'rotations mix'.
") Add;
		void Add(const gp_Quaternion & theOther);

		/****** gp_Quaternion::Added ******/
		/****** md5 signature: 36c2c10b5ea368da16ba64269825c6ef ******/
		%feature("compactdefaultargs") Added;
		%feature("autodoc", "
Parameters
----------
theOther: gp_Quaternion

Return
-------
gp_Quaternion

Description
-----------
Makes sum of quaternion components; result is 'rotations mix'.
") Added;
		gp_Quaternion Added(const gp_Quaternion & theOther);

		/****** gp_Quaternion::Dot ******/
		/****** md5 signature: 19254688a72b3969967b549f0aaab658 ******/
		%feature("compactdefaultargs") Dot;
		%feature("autodoc", "
Parameters
----------
theOther: gp_Quaternion

Return
-------
double

Description
-----------
Computes inner product / scalar product / Dot.
") Dot;
		double Dot(const gp_Quaternion & theOther);

		/****** gp_Quaternion::GetEulerAngles ******/
		/****** md5 signature: 698a4159ede63267849c9996f677e015 ******/
		%feature("compactdefaultargs") GetEulerAngles;
		%feature("autodoc", "
Parameters
----------
theOrder: gp_EulerSequence

Return
-------
theAlpha: double
theBeta: double
theGamma: double

Description
-----------
Returns Euler angles describing current rotation.
") GetEulerAngles;
		void GetEulerAngles(const gp_EulerSequence theOrder, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** gp_Quaternion::GetMatrix ******/
		/****** md5 signature: b713aea5ecd36799afb034f7a8cb805c ******/
		%feature("compactdefaultargs") GetMatrix;
		%feature("autodoc", "Return
-------
gp_Mat

Description
-----------
Returns rotation operation as 3*3 matrix.
") GetMatrix;
		gp_Mat GetMatrix();

		/****** gp_Quaternion::GetRotationAngle ******/
		/****** md5 signature: b63329868a09cfea25f42b7a4c555d5d ******/
		%feature("compactdefaultargs") GetRotationAngle;
		%feature("autodoc", "Return
-------
double

Description
-----------
Return rotation angle from -PI to PI.
") GetRotationAngle;
		double GetRotationAngle();

		/****** gp_Quaternion::GetVectorAndAngle ******/
		/****** md5 signature: 65b68dbd869b30ef014cf646960926a7 ******/
		%feature("compactdefaultargs") GetVectorAndAngle;
		%feature("autodoc", "
Parameters
----------
theAxis: gp_Vec

Return
-------
theAngle: double

Description
-----------
Convert a quaternion to Axis+Angle representation, preserve the axis direction and angle from -PI to +PI.
") GetVectorAndAngle;
		void GetVectorAndAngle(gp_Vec & theAxis, Standard_Real &OutValue);

		/****** gp_Quaternion::Invert ******/
		/****** md5 signature: 621b10ec5fe47c8b4aea4ec56061c183 ******/
		%feature("compactdefaultargs") Invert;
		%feature("autodoc", "Return
-------
None

Description
-----------
Inverts quaternion (both rotation direction and norm).
") Invert;
		void Invert();

		/****** gp_Quaternion::Inverted ******/
		/****** md5 signature: f975f46ddb211fb4b53463732ce938ac ******/
		%feature("compactdefaultargs") Inverted;
		%feature("autodoc", "Return
-------
gp_Quaternion

Description
-----------
Return inversed quaternion q^-1.
") Inverted;
		gp_Quaternion Inverted();

		/****** gp_Quaternion::IsEqual ******/
		/****** md5 signature: be740e45f801bc8e1cdd781114ac4579 ******/
		%feature("compactdefaultargs") IsEqual;
		%feature("autodoc", "
Parameters
----------
theOther: gp_Quaternion

Return
-------
bool

Description
-----------
Simple equal test without precision.
") IsEqual;
		bool IsEqual(const gp_Quaternion & theOther);

		/****** gp_Quaternion::Multiplied ******/
		/****** md5 signature: d3f85f1fca7352192c2a4f06fc8ca6aa ******/
		%feature("compactdefaultargs") Multiplied;
		%feature("autodoc", "
Parameters
----------
theOther: gp_Quaternion

Return
-------
gp_Quaternion

Description
-----------
Multiply function - work the same as Matrices multiplying. @code qq' = (cross(v,v') + wv' + w'v, ww' - dot(v,v')) @endcode Result is rotation combination: q' than q (here q=this, q'=theQ). Notices that: @code qq' != q'q; qq^-1 = q; @endcode.
") Multiplied;
		gp_Quaternion Multiplied(const gp_Quaternion & theOther);

		/****** gp_Quaternion::Multiply ******/
		/****** md5 signature: 1d8be55262472fb250e74724b4ecdfa6 ******/
		%feature("compactdefaultargs") Multiply;
		%feature("autodoc", "
Parameters
----------
theOther: gp_Quaternion

Return
-------
None

Description
-----------
Adds rotation by multiplication.
") Multiply;
		void Multiply(const gp_Quaternion & theOther);

		/****** gp_Quaternion::Multiply ******/
		/****** md5 signature: ced669a12f9467bc1c436087062a6afc ******/
		%feature("compactdefaultargs") Multiply;
		%feature("autodoc", "
Parameters
----------
theVec: gp_Vec

Return
-------
gp_Vec

Description
-----------
Rotates vector by quaternion as rotation operator.
") Multiply;
		gp_Vec Multiply(const gp_Vec & theVec);

		/****** gp_Quaternion::Negated ******/
		/****** md5 signature: e65a84c21e76a8ac5f5d7ab11bdeb023 ******/
		%feature("compactdefaultargs") Negated;
		%feature("autodoc", "Return
-------
gp_Quaternion

Description
-----------
Returns quaternion with all components negated. Note that this operation does not affect neither rotation operator defined by quaternion nor its norm.
") Negated;
		gp_Quaternion Negated();

		/****** gp_Quaternion::Norm ******/
		/****** md5 signature: d30fe21b83bf90e71a4aea1a7df2e304 ******/
		%feature("compactdefaultargs") Norm;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns norm of quaternion.
") Norm;
		double Norm();

		/****** gp_Quaternion::Normalize ******/
		/****** md5 signature: 587346cf1e1c12fdf674aedc915ccd95 ******/
		%feature("compactdefaultargs") Normalize;
		%feature("autodoc", "Return
-------
None

Description
-----------
Scale quaternion that its norm goes to 1. The appearing of 0 magnitude or near is a error, so we can be sure that can divide by magnitude.
") Normalize;
		void Normalize();

		/****** gp_Quaternion::Normalized ******/
		/****** md5 signature: d58f1c9978a9da4b8d155ede031c091b ******/
		%feature("compactdefaultargs") Normalized;
		%feature("autodoc", "Return
-------
gp_Quaternion

Description
-----------
Returns quaternion scaled so that its norm goes to 1.
") Normalized;
		gp_Quaternion Normalized();

		/****** gp_Quaternion::Reverse ******/
		/****** md5 signature: 229f8663d04c43240c56ed238a384b26 ******/
		%feature("compactdefaultargs") Reverse;
		%feature("autodoc", "Return
-------
None

Description
-----------
Reverse direction of rotation (conjugate quaternion).
") Reverse;
		void Reverse();

		/****** gp_Quaternion::Reversed ******/
		/****** md5 signature: 565d537fe630087b07cac8969f597b68 ******/
		%feature("compactdefaultargs") Reversed;
		%feature("autodoc", "Return
-------
gp_Quaternion

Description
-----------
Return rotation with reversed direction (conjugated quaternion).
") Reversed;
		gp_Quaternion Reversed();

		/****** gp_Quaternion::Scale ******/
		/****** md5 signature: e51f48e34111aa1136508972e053c092 ******/
		%feature("compactdefaultargs") Scale;
		%feature("autodoc", "
Parameters
----------
theScale: double

Return
-------
None

Description
-----------
Scale all components by quaternion by theScale; note that rotation is not changed by this operation (except 0-scaling).
") Scale;
		void Scale(const double theScale);

		/****** gp_Quaternion::Scaled ******/
		/****** md5 signature: fe9622758881862230404ddeec542123 ******/
		%feature("compactdefaultargs") Scaled;
		%feature("autodoc", "
Parameters
----------
theScale: double

Return
-------
gp_Quaternion

Description
-----------
Returns scaled quaternion.
") Scaled;
		gp_Quaternion Scaled(const double theScale);

		/****** gp_Quaternion::Set ******/
		/****** md5 signature: b61a3ba68090f9b222c72e75676f884f ******/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
theX: double
theY: double
theZ: double
theW: double

Return
-------
None

Description
-----------
No available documentation.
") Set;
		void Set(const double theX, const double theY, const double theZ, const double theW);

		/****** gp_Quaternion::Set ******/
		/****** md5 signature: 05aea51a874d77db7ac9399f97562b94 ******/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
theQuaternion: gp_Quaternion

Return
-------
None

Description
-----------
No available documentation.
") Set;
		void Set(const gp_Quaternion & theQuaternion);

		/****** gp_Quaternion::SetEulerAngles ******/
		/****** md5 signature: 00f3e3178c86b086b2c36784b2ce17dd ******/
		%feature("compactdefaultargs") SetEulerAngles;
		%feature("autodoc", "
Parameters
----------
theOrder: gp_EulerSequence
theAlpha: double
theBeta: double
theGamma: double

Return
-------
None

Description
-----------
Create a unit quaternion representing rotation defined by generalized Euler angles.
") SetEulerAngles;
		void SetEulerAngles(const gp_EulerSequence theOrder, const double theAlpha, const double theBeta, const double theGamma);

		/****** gp_Quaternion::SetIdent ******/
		/****** md5 signature: a6dba77eecae276f56ae0976dc3b2b33 ******/
		%feature("compactdefaultargs") SetIdent;
		%feature("autodoc", "Return
-------
None

Description
-----------
Make identity quaternion (zero-rotation).
") SetIdent;
		void SetIdent();

		/****** gp_Quaternion::SetMatrix ******/
		/****** md5 signature: a4cbfa86f7b0850889e49d3a99812bf2 ******/
		%feature("compactdefaultargs") SetMatrix;
		%feature("autodoc", "
Parameters
----------
theMat: gp_Mat

Return
-------
None

Description
-----------
Create a unit quaternion by rotation matrix matrix must contain only rotation (not scale or shear) //! For numerical stability we find first the greatest component of quaternion and than search others from this one.
") SetMatrix;
		void SetMatrix(const gp_Mat & theMat);

		/****** gp_Quaternion::SetRotation ******/
		/****** md5 signature: cf8784d6b71b8f58af12ffa7098db996 ******/
		%feature("compactdefaultargs") SetRotation;
		%feature("autodoc", "
Parameters
----------
theVecFrom: gp_Vec
theVecTo: gp_Vec

Return
-------
None

Description
-----------
Sets quaternion to shortest-arc rotation producing vector theVecTo from vector theVecFrom. If vectors theVecFrom and theVecTo are opposite then rotation axis is computed as theVecFrom ^ (1,0,0) or theVecFrom ^ (0,0,1).
") SetRotation;
		void SetRotation(const gp_Vec & theVecFrom, const gp_Vec & theVecTo);

		/****** gp_Quaternion::SetRotation ******/
		/****** md5 signature: 0c660ebf2aa10cb48307332420b5d9a6 ******/
		%feature("compactdefaultargs") SetRotation;
		%feature("autodoc", "
Parameters
----------
theVecFrom: gp_Vec
theVecTo: gp_Vec
theHelpCrossVec: gp_Vec

Return
-------
None

Description
-----------
Sets quaternion to shortest-arc rotation producing vector theVecTo from vector theVecFrom. If vectors theVecFrom and theVecTo are opposite then rotation axis is computed as theVecFrom ^ theHelpCrossVec.
") SetRotation;
		void SetRotation(const gp_Vec & theVecFrom, const gp_Vec & theVecTo, const gp_Vec & theHelpCrossVec);

		/****** gp_Quaternion::SetVectorAndAngle ******/
		/****** md5 signature: 75d565da4e312ded02e4a1baff774046 ******/
		%feature("compactdefaultargs") SetVectorAndAngle;
		%feature("autodoc", "
Parameters
----------
theAxis: gp_Vec
theAngle: double

Return
-------
None

Description
-----------
Create a unit quaternion from Axis+Angle representation.
") SetVectorAndAngle;
		void SetVectorAndAngle(const gp_Vec & theAxis, const double theAngle);

		/****** gp_Quaternion::SquareNorm ******/
		/****** md5 signature: 9e5b707afc8317511ef2e19025efe0b4 ******/
		%feature("compactdefaultargs") SquareNorm;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns square norm of quaternion.
") SquareNorm;
		double SquareNorm();

		/****** gp_Quaternion::StabilizeLength ******/
		/****** md5 signature: aaaf2fcf2c978a91cf9ac2310589bf1a ******/
		%feature("compactdefaultargs") StabilizeLength;
		%feature("autodoc", "Return
-------
None

Description
-----------
Stabilize quaternion length within 1 - 1/4. This operation is a lot faster than normalization and preserve length goes to 0 or infinity.
") StabilizeLength;
		void StabilizeLength();

		/****** gp_Quaternion::Subtract ******/
		/****** md5 signature: 7243b495ee8d8a4dbb87076def20a04f ******/
		%feature("compactdefaultargs") Subtract;
		%feature("autodoc", "
Parameters
----------
theOther: gp_Quaternion

Return
-------
None

Description
-----------
Subtracts components of other quaternion; result is 'rotations mix'.
") Subtract;
		void Subtract(const gp_Quaternion & theOther);

		/****** gp_Quaternion::Subtracted ******/
		/****** md5 signature: bd6505f83510ea8611f646e49f3bbbc8 ******/
		%feature("compactdefaultargs") Subtracted;
		%feature("autodoc", "
Parameters
----------
theOther: gp_Quaternion

Return
-------
gp_Quaternion

Description
-----------
Makes difference of quaternion components; result is 'rotations mix'.
") Subtracted;
		gp_Quaternion Subtracted(const gp_Quaternion & theOther);

		/****** gp_Quaternion::W ******/
		/****** md5 signature: 6ddd92b08d932a161b91d78290ea274f ******/
		%feature("compactdefaultargs") W;
		%feature("autodoc", "Return
-------
double

Description
-----------
No available documentation.
") W;
		double W();

		/****** gp_Quaternion::X ******/
		/****** md5 signature: c418db3e494968281737cca9c90ecbdf ******/
		%feature("compactdefaultargs") X;
		%feature("autodoc", "Return
-------
double

Description
-----------
No available documentation.
") X;
		double X();

		/****** gp_Quaternion::Y ******/
		/****** md5 signature: 25eefb608c358bc135b3158209ee8901 ******/
		%feature("compactdefaultargs") Y;
		%feature("autodoc", "Return
-------
double

Description
-----------
No available documentation.
") Y;
		double Y();

		/****** gp_Quaternion::Z ******/
		/****** md5 signature: 078eb43f219d180be16ce27c9708e49a ******/
		%feature("compactdefaultargs") Z;
		%feature("autodoc", "Return
-------
double

Description
-----------
No available documentation.
") Z;
		double Z();

		/****** gp_Quaternion::operator * ******/
		/****** md5 signature: d158ba0d2a1001d680c49dd8b87afcaa ******/
		%feature("compactdefaultargs") operator *;
		%feature("autodoc", "
Parameters
----------
theScale: double

Return
-------
gp_Quaternion

Description
-----------
No available documentation.
") operator *;
		gp_Quaternion operator *(const double theScale);

		/****** gp_Quaternion::operator * ******/
		/****** md5 signature: 0e61e1ae15030d9b2e20d7e463980887 ******/
		%feature("compactdefaultargs") operator *;
		%feature("autodoc", "
Parameters
----------
theOther: gp_Quaternion

Return
-------
gp_Quaternion

Description
-----------
No available documentation.
") operator *;
		gp_Quaternion operator *(const gp_Quaternion & theOther);

		/****** gp_Quaternion::operator * ******/
		/****** md5 signature: dd038dab60466c206b35e47705edc0dc ******/
		%feature("compactdefaultargs") operator *;
		%feature("autodoc", "
Parameters
----------
theVec: gp_Vec

Return
-------
gp_Vec

Description
-----------
No available documentation.
") operator *;
		gp_Vec operator *(const gp_Vec & theVec);


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

%extend{
    void __imul_wrapper__(const gp_Quaternion other) {
    *self *= other;
    }
}
%pythoncode {
def __imul__(self, right):
    self.__imul_wrapper__(right)
    return self
}
		/****** gp_Quaternion::operator + ******/
		/****** md5 signature: 0439260d604af205bb98a34a2fffe968 ******/
		%feature("compactdefaultargs") operator +;
		%feature("autodoc", "
Parameters
----------
theOther: gp_Quaternion

Return
-------
gp_Quaternion

Description
-----------
No available documentation.
") operator +;
		gp_Quaternion operator +(const gp_Quaternion & theOther);


%extend{
    void __iadd_wrapper__(const gp_Quaternion other) {
    *self += other;
    }
}
%pythoncode {
def __iadd__(self, right):
    self.__iadd_wrapper__(right)
    return self
}
		/****** gp_Quaternion::operator - ******/
		/****** md5 signature: b0def0901c686c0fd982762d98f42909 ******/
		%feature("compactdefaultargs") operator -;
		%feature("autodoc", "Return
-------
gp_Quaternion

Description
-----------
No available documentation.
") operator -;
		gp_Quaternion operator -();

		/****** gp_Quaternion::operator - ******/
		/****** md5 signature: 3a48ee09893918f26b04df296cf1bec1 ******/
		%feature("compactdefaultargs") operator -;
		%feature("autodoc", "
Parameters
----------
theOther: gp_Quaternion

Return
-------
gp_Quaternion

Description
-----------
No available documentation.
") operator -;
		gp_Quaternion operator -(const gp_Quaternion & theOther);


%extend{
    void __isub_wrapper__(const gp_Quaternion other) {
    *self -= other;
    }
}
%pythoncode {
def __isub__(self, right):
    self.__isub_wrapper__(right)
    return self
}
};



%extend gp_Quaternion {
%pythoncode {
    def __getstate__(self):
        return self.DumpJson()
    }
};

%extend gp_Quaternion {
%pythoncode {
    def __setstate__(self, state):
        inst = gp_Quaternion()
        if inst.InitFromJson(state):
            self.this = inst.this
        else:
            raise IOError('Failed to set state of gp_Quaternion')
    }
};
%extend gp_Quaternion {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************
* class gp_QuaternionNLerp *
***************************/
class gp_QuaternionNLerp {
	public:
		/****** gp_QuaternionNLerp::gp_QuaternionNLerp ******/
		/****** md5 signature: f070e71d26aaa5786d05ec8a0c3c7157 ******/
		%feature("compactdefaultargs") gp_QuaternionNLerp;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor,.
") gp_QuaternionNLerp;
		 gp_QuaternionNLerp();

		/****** gp_QuaternionNLerp::gp_QuaternionNLerp ******/
		/****** md5 signature: a3dc49965f8fc9eb5b1b3c4839244818 ******/
		%feature("compactdefaultargs") gp_QuaternionNLerp;
		%feature("autodoc", "
Parameters
----------
theQStart: gp_Quaternion
theQEnd: gp_Quaternion

Return
-------
None

Description
-----------
Constructor with initialization.
") gp_QuaternionNLerp;
		 gp_QuaternionNLerp(const gp_Quaternion & theQStart, const gp_Quaternion & theQEnd);

		/****** gp_QuaternionNLerp::Init ******/
		/****** md5 signature: 307170b955ce7b69e82a89c8c86d7085 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
theQStart: gp_Quaternion
theQEnd: gp_Quaternion

Return
-------
None

Description
-----------
Initialize the tool with Start and End values.
") Init;
		void Init(const gp_Quaternion & theQStart, const gp_Quaternion & theQEnd);

		/****** gp_QuaternionNLerp::InitFromUnit ******/
		/****** md5 signature: 032020104006f196b9b1aa3af37bb646 ******/
		%feature("compactdefaultargs") InitFromUnit;
		%feature("autodoc", "
Parameters
----------
theQStart: gp_Quaternion
theQEnd: gp_Quaternion

Return
-------
None

Description
-----------
Initialize the tool with Start and End unit quaternions.
") InitFromUnit;
		void InitFromUnit(const gp_Quaternion & theQStart, const gp_Quaternion & theQEnd);

		/****** gp_QuaternionNLerp::Interpolate ******/
		/****** md5 signature: 041b96c15d2d3bea262898a556f5673f ******/
		%feature("compactdefaultargs") Interpolate;
		%feature("autodoc", "
Parameters
----------
theQStart: gp_Quaternion
theQEnd: gp_Quaternion
theT: double

Return
-------
gp_Quaternion

Description
-----------
Compute interpolated quaternion between two quaternions. 
Parameter theStart first quaternion 
Parameter theEnd second quaternion 
Parameter theT normalized interpolation coefficient within 0..1 range, with 0 pointing to theStart and 1 to theEnd.
") Interpolate;
		static gp_Quaternion Interpolate(const gp_Quaternion & theQStart, const gp_Quaternion & theQEnd, double theT);

		/****** gp_QuaternionNLerp::Interpolate ******/
		/****** md5 signature: cf137aa6287a020ddf2cedb9ec27c012 ******/
		%feature("compactdefaultargs") Interpolate;
		%feature("autodoc", "
Parameters
----------
theT: double
theResultQ: gp_Quaternion

Return
-------
None

Description
-----------
Set interpolated quaternion for theT position (from 0.0 to 1.0).
") Interpolate;
		void Interpolate(double theT, gp_Quaternion & theResultQ);

};



%extend gp_QuaternionNLerp {
%pythoncode {
    def __getstate__(self):
        return self.DumpJson()
    }
};

%extend gp_QuaternionNLerp {
%pythoncode {
    def __setstate__(self, state):
        inst = gp_QuaternionNLerp()
        if inst.InitFromJson(state):
            self.this = inst.this
        else:
            raise IOError('Failed to set state of gp_QuaternionNLerp')
    }
};
%extend gp_QuaternionNLerp {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************
* class gp_QuaternionSLerp *
***************************/
class gp_QuaternionSLerp {
	public:
		/****** gp_QuaternionSLerp::gp_QuaternionSLerp ******/
		/****** md5 signature: 473ad8a5bb58ee0047426461f2557a93 ******/
		%feature("compactdefaultargs") gp_QuaternionSLerp;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor,.
") gp_QuaternionSLerp;
		 gp_QuaternionSLerp();

		/****** gp_QuaternionSLerp::gp_QuaternionSLerp ******/
		/****** md5 signature: 17456e45790f76559348af2931e6d077 ******/
		%feature("compactdefaultargs") gp_QuaternionSLerp;
		%feature("autodoc", "
Parameters
----------
theQStart: gp_Quaternion
theQEnd: gp_Quaternion

Return
-------
None

Description
-----------
Constructor with initialization.
") gp_QuaternionSLerp;
		 gp_QuaternionSLerp(const gp_Quaternion & theQStart, const gp_Quaternion & theQEnd);

		/****** gp_QuaternionSLerp::Init ******/
		/****** md5 signature: 307170b955ce7b69e82a89c8c86d7085 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
theQStart: gp_Quaternion
theQEnd: gp_Quaternion

Return
-------
None

Description
-----------
Initialize the tool with Start and End values.
") Init;
		void Init(const gp_Quaternion & theQStart, const gp_Quaternion & theQEnd);

		/****** gp_QuaternionSLerp::InitFromUnit ******/
		/****** md5 signature: 032020104006f196b9b1aa3af37bb646 ******/
		%feature("compactdefaultargs") InitFromUnit;
		%feature("autodoc", "
Parameters
----------
theQStart: gp_Quaternion
theQEnd: gp_Quaternion

Return
-------
None

Description
-----------
Initialize the tool with Start and End unit quaternions.
") InitFromUnit;
		void InitFromUnit(const gp_Quaternion & theQStart, const gp_Quaternion & theQEnd);

		/****** gp_QuaternionSLerp::Interpolate ******/
		/****** md5 signature: 041b96c15d2d3bea262898a556f5673f ******/
		%feature("compactdefaultargs") Interpolate;
		%feature("autodoc", "
Parameters
----------
theQStart: gp_Quaternion
theQEnd: gp_Quaternion
theT: double

Return
-------
gp_Quaternion

Description
-----------
Compute interpolated quaternion between two quaternions. 
Parameter theStart first quaternion 
Parameter theEnd second quaternion 
Parameter theT normalized interpolation coefficient within 0..1 range, with 0 pointing to theStart and 1 to theEnd.
") Interpolate;
		static gp_Quaternion Interpolate(const gp_Quaternion & theQStart, const gp_Quaternion & theQEnd, double theT);

		/****** gp_QuaternionSLerp::Interpolate ******/
		/****** md5 signature: cf137aa6287a020ddf2cedb9ec27c012 ******/
		%feature("compactdefaultargs") Interpolate;
		%feature("autodoc", "
Parameters
----------
theT: double
theResultQ: gp_Quaternion

Return
-------
None

Description
-----------
Set interpolated quaternion for theT position (from 0.0 to 1.0).
") Interpolate;
		void Interpolate(double theT, gp_Quaternion & theResultQ);

};



%extend gp_QuaternionSLerp {
%pythoncode {
    def __getstate__(self):
        return self.DumpJson()
    }
};

%extend gp_QuaternionSLerp {
%pythoncode {
    def __setstate__(self, state):
        inst = gp_QuaternionSLerp()
        if inst.InitFromJson(state):
            self.this = inst.this
        else:
            raise IOError('Failed to set state of gp_QuaternionSLerp')
    }
};
%extend gp_QuaternionSLerp {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************
* class gp_Sphere *
******************/
class gp_Sphere {
	public:
		/****** gp_Sphere::gp_Sphere ******/
		/****** md5 signature: d4fd33d09d1fa2decf8c31cfc27ee1b7 ******/
		%feature("compactdefaultargs") gp_Sphere;
		%feature("autodoc", "Return
-------
None

Description
-----------
Creates an indefinite sphere.
") gp_Sphere;
		 gp_Sphere();

		/****** gp_Sphere::gp_Sphere ******/
		/****** md5 signature: 91a1f04847df11b0c0e08ad9241be892 ******/
		%feature("compactdefaultargs") gp_Sphere;
		%feature("autodoc", "
Parameters
----------
theA3: gp_Ax3
theRadius: double

Return
-------
None

Description
-----------
Constructs a sphere with radius theRadius, centered on the origin of theA3. theA3 is the local coordinate system of the sphere. Warnings: It is not forbidden to create a sphere with null radius. Raises ConstructionError if theRadius < 0.0.
") gp_Sphere;
		 gp_Sphere(const gp_Ax3 & theA3, const double theRadius);

		/****** gp_Sphere::Area ******/
		/****** md5 signature: a088fd3ed75aeafb3fa8330998cab53d ******/
		%feature("compactdefaultargs") Area;
		%feature("autodoc", "Return
-------
double

Description
-----------
Computes the area of the sphere.
") Area;
		double Area();

		/****** gp_Sphere::Coefficients ******/
		/****** md5 signature: 9bc2d4703484c8ba3d6ad87fcb2af21c ******/
		%feature("compactdefaultargs") Coefficients;
		%feature("autodoc", "
Parameters
----------

Return
-------
theA1: double
theA2: double
theA3: double
theB1: double
theB2: double
theB3: double
theC1: double
theC2: double
theC3: double
theD: double

Description
-----------
Computes the coefficients of the implicit equation of the quadric in the absolute cartesian coordinates system: @code theA1.X**2 + theA2.Y**2 + theA3.Z**2 + 2.(theB1.X.Y + theB2.X.Z + theB3.Y.Z) + 2.(theC1.X + theC2.Y + theC3.Z) + theD = 0.0 @endcode.
") Coefficients;
		void Coefficients(Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** gp_Sphere::Direct ******/
		/****** md5 signature: 666afd9b1feb9c16371f38b8235304e9 ******/
		%feature("compactdefaultargs") Direct;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if the local coordinate system of this sphere is right-handed.
") Direct;
		bool Direct();

		/****** gp_Sphere::Location ******/
		/****** md5 signature: 2c3e536bdb11b2c2c46fc19fd8a6c569 ******/
		%feature("compactdefaultargs") Location;
		%feature("autodoc", "Return
-------
gp_Pnt

Description
-----------
--- Purpose ; Returns the center of the sphere.
") Location;
		const gp_Pnt Location();

		/****** gp_Sphere::Mirror ******/
		/****** md5 signature: 0f424be72f12474fe3ff290168029c4e ******/
		%feature("compactdefaultargs") Mirror;
		%feature("autodoc", "
Parameters
----------
theP: gp_Pnt

Return
-------
None

Description
-----------
No available documentation.
") Mirror;
		void Mirror(const gp_Pnt & theP);

		/****** gp_Sphere::Mirror ******/
		/****** md5 signature: f508bc9f1879a959242732c259593a0a ******/
		%feature("compactdefaultargs") Mirror;
		%feature("autodoc", "
Parameters
----------
theA1: gp_Ax1

Return
-------
None

Description
-----------
No available documentation.
") Mirror;
		void Mirror(const gp_Ax1 & theA1);

		/****** gp_Sphere::Mirror ******/
		/****** md5 signature: ba516d9e4a2b6af0ed16d37de915dd83 ******/
		%feature("compactdefaultargs") Mirror;
		%feature("autodoc", "
Parameters
----------
theA2: gp_Ax2

Return
-------
None

Description
-----------
No available documentation.
") Mirror;
		void Mirror(const gp_Ax2 & theA2);

		/****** gp_Sphere::Mirrored ******/
		/****** md5 signature: ba6b0aaa7131327c0bcba1c0d2686f7f ******/
		%feature("compactdefaultargs") Mirrored;
		%feature("autodoc", "
Parameters
----------
theP: gp_Pnt

Return
-------
gp_Sphere

Description
-----------
Performs the symmetrical transformation of a sphere with respect to the point theP which is the center of the symmetry.
") Mirrored;
		gp_Sphere Mirrored(const gp_Pnt & theP);

		/****** gp_Sphere::Mirrored ******/
		/****** md5 signature: a3b7a3c833ebf55e5aa4a70f01eb214b ******/
		%feature("compactdefaultargs") Mirrored;
		%feature("autodoc", "
Parameters
----------
theA1: gp_Ax1

Return
-------
gp_Sphere

Description
-----------
Performs the symmetrical transformation of a sphere with respect to an axis placement which is the axis of the symmetry.
") Mirrored;
		gp_Sphere Mirrored(const gp_Ax1 & theA1);

		/****** gp_Sphere::Mirrored ******/
		/****** md5 signature: 2811578083b76ddf75ac4df58d040e2b ******/
		%feature("compactdefaultargs") Mirrored;
		%feature("autodoc", "
Parameters
----------
theA2: gp_Ax2

Return
-------
gp_Sphere

Description
-----------
Performs the symmetrical transformation of a sphere with respect to a plane. The axis placement theA2 locates the plane of the of the symmetry: (Location, XDirection, YDirection).
") Mirrored;
		gp_Sphere Mirrored(const gp_Ax2 & theA2);

		/****** gp_Sphere::Position ******/
		/****** md5 signature: 074afca7172f5d6d32484431775e9338 ******/
		%feature("compactdefaultargs") Position;
		%feature("autodoc", "Return
-------
gp_Ax3

Description
-----------
Returns the local coordinates system of the sphere.
") Position;
		const gp_Ax3 Position();

		/****** gp_Sphere::Radius ******/
		/****** md5 signature: a9fd144d0cbef7b3a906e17ab20118f2 ******/
		%feature("compactdefaultargs") Radius;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns the radius of the sphere.
") Radius;
		double Radius();

		/****** gp_Sphere::Rotate ******/
		/****** md5 signature: 652dfbf621c2c092ff5b68d608de4634 ******/
		%feature("compactdefaultargs") Rotate;
		%feature("autodoc", "
Parameters
----------
theA1: gp_Ax1
theAng: double

Return
-------
None

Description
-----------
No available documentation.
") Rotate;
		void Rotate(const gp_Ax1 & theA1, const double theAng);

		/****** gp_Sphere::Rotated ******/
		/****** md5 signature: 8bd5223d650b83eb6b049ed393497390 ******/
		%feature("compactdefaultargs") Rotated;
		%feature("autodoc", "
Parameters
----------
theA1: gp_Ax1
theAng: double

Return
-------
gp_Sphere

Description
-----------
Rotates a sphere. theA1 is the axis of the rotation. theAng is the angular value of the rotation in radians.
") Rotated;
		gp_Sphere Rotated(const gp_Ax1 & theA1, const double theAng);

		/****** gp_Sphere::Scale ******/
		/****** md5 signature: a03901fe94facbb26121cd37d5814f81 ******/
		%feature("compactdefaultargs") Scale;
		%feature("autodoc", "
Parameters
----------
theP: gp_Pnt
theS: double

Return
-------
None

Description
-----------
No available documentation.
") Scale;
		void Scale(const gp_Pnt & theP, const double theS);

		/****** gp_Sphere::Scaled ******/
		/****** md5 signature: 3d44ebaf0ef287feb0c969d405ff8707 ******/
		%feature("compactdefaultargs") Scaled;
		%feature("autodoc", "
Parameters
----------
theP: gp_Pnt
theS: double

Return
-------
gp_Sphere

Description
-----------
Scales a sphere. theS is the scaling value. The absolute value of S is used to scale the sphere.
") Scaled;
		gp_Sphere Scaled(const gp_Pnt & theP, const double theS);

		/****** gp_Sphere::SetLocation ******/
		/****** md5 signature: f1c958277e2e7de2571c6b5691801e2a ******/
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
Changes the center of the sphere.
") SetLocation;
		void SetLocation(const gp_Pnt & theLoc);

		/****** gp_Sphere::SetPosition ******/
		/****** md5 signature: 967a77c1867c53ae2fb8ec3b93905c83 ******/
		%feature("compactdefaultargs") SetPosition;
		%feature("autodoc", "
Parameters
----------
theA3: gp_Ax3

Return
-------
None

Description
-----------
Changes the local coordinate system of the sphere.
") SetPosition;
		void SetPosition(const gp_Ax3 & theA3);

		/****** gp_Sphere::SetRadius ******/
		/****** md5 signature: a5bdc5efcd41823cfeb57a16cd83858a ******/
		%feature("compactdefaultargs") SetRadius;
		%feature("autodoc", "
Parameters
----------
theR: double

Return
-------
None

Description
-----------
Assigns theR the radius of the Sphere. Warnings: It is not forbidden to create a sphere with null radius. Raises ConstructionError if theR < 0.0.
") SetRadius;
		void SetRadius(const double theR);

		/****** gp_Sphere::Transform ******/
		/****** md5 signature: 0737a7286be728220e1a55ba0d6eafc3 ******/
		%feature("compactdefaultargs") Transform;
		%feature("autodoc", "
Parameters
----------
theT: gp_Trsf

Return
-------
None

Description
-----------
No available documentation.
") Transform;
		void Transform(const gp_Trsf & theT);

		/****** gp_Sphere::Transformed ******/
		/****** md5 signature: 71dca805732ae4b7ad43addc5dc49ab8 ******/
		%feature("compactdefaultargs") Transformed;
		%feature("autodoc", "
Parameters
----------
theT: gp_Trsf

Return
-------
gp_Sphere

Description
-----------
Transforms a sphere with the transformation theT from class Trsf.
") Transformed;
		gp_Sphere Transformed(const gp_Trsf & theT);

		/****** gp_Sphere::Translate ******/
		/****** md5 signature: 8ae07d4c829c1eef2e7708ef5390638b ******/
		%feature("compactdefaultargs") Translate;
		%feature("autodoc", "
Parameters
----------
theV: gp_Vec

Return
-------
None

Description
-----------
No available documentation.
") Translate;
		void Translate(const gp_Vec & theV);

		/****** gp_Sphere::Translate ******/
		/****** md5 signature: 279c13d6194eb867625753d756d110ab ******/
		%feature("compactdefaultargs") Translate;
		%feature("autodoc", "
Parameters
----------
theP1: gp_Pnt
theP2: gp_Pnt

Return
-------
None

Description
-----------
No available documentation.
") Translate;
		void Translate(const gp_Pnt & theP1, const gp_Pnt & theP2);

		/****** gp_Sphere::Translated ******/
		/****** md5 signature: 9b730d28319442d8458c21924b1e8b71 ******/
		%feature("compactdefaultargs") Translated;
		%feature("autodoc", "
Parameters
----------
theV: gp_Vec

Return
-------
gp_Sphere

Description
-----------
Translates a sphere in the direction of the vector theV. The magnitude of the translation is the vector's magnitude.
") Translated;
		gp_Sphere Translated(const gp_Vec & theV);

		/****** gp_Sphere::Translated ******/
		/****** md5 signature: cf06c8550d7de3cf5c8b6c8645893a87 ******/
		%feature("compactdefaultargs") Translated;
		%feature("autodoc", "
Parameters
----------
theP1: gp_Pnt
theP2: gp_Pnt

Return
-------
gp_Sphere

Description
-----------
Translates a sphere from the point theP1 to the point theP2.
") Translated;
		gp_Sphere Translated(const gp_Pnt & theP1, const gp_Pnt & theP2);

		/****** gp_Sphere::UReverse ******/
		/****** md5 signature: 69a43a8af82ddbb84c6e12cf963de477 ******/
		%feature("compactdefaultargs") UReverse;
		%feature("autodoc", "Return
-------
None

Description
-----------
Reverses the U parametrization of the sphere reversing the YAxis.
") UReverse;
		void UReverse();

		/****** gp_Sphere::VReverse ******/
		/****** md5 signature: 07b53fb5da02e3545309a68afe3655c9 ******/
		%feature("compactdefaultargs") VReverse;
		%feature("autodoc", "Return
-------
None

Description
-----------
Reverses the V parametrization of the sphere reversing the ZAxis.
") VReverse;
		void VReverse();

		/****** gp_Sphere::Volume ******/
		/****** md5 signature: 166f423b2edf1139ae279a35dd46d71c ******/
		%feature("compactdefaultargs") Volume;
		%feature("autodoc", "Return
-------
double

Description
-----------
Computes the volume of the sphere.
") Volume;
		double Volume();

		/****** gp_Sphere::XAxis ******/
		/****** md5 signature: 37d8185a57a29bf9b7aa10d76b1229a2 ******/
		%feature("compactdefaultargs") XAxis;
		%feature("autodoc", "Return
-------
gp_Ax1

Description
-----------
Returns the axis X of the sphere.
") XAxis;
		gp_Ax1 XAxis();

		/****** gp_Sphere::YAxis ******/
		/****** md5 signature: 78f0cb55c98fbe890a49b3158d9f5039 ******/
		%feature("compactdefaultargs") YAxis;
		%feature("autodoc", "Return
-------
gp_Ax1

Description
-----------
Returns the axis Y of the sphere.
") YAxis;
		gp_Ax1 YAxis();

};



%extend gp_Sphere {
%pythoncode {
    def __getstate__(self):
        return self.DumpJson()
    }
};

%extend gp_Sphere {
%pythoncode {
    def __setstate__(self, state):
        inst = gp_Sphere()
        if inst.InitFromJson(state):
            self.this = inst.this
        else:
            raise IOError('Failed to set state of gp_Sphere')
    }
};
%extend gp_Sphere {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************
* class gp_Torus *
*****************/
class gp_Torus {
	public:
		/****** gp_Torus::gp_Torus ******/
		/****** md5 signature: 7e5a7ed611fc27fb30469a8df5b7fb2d ******/
		%feature("compactdefaultargs") gp_Torus;
		%feature("autodoc", "Return
-------
None

Description
-----------
creates an indefinite Torus.
") gp_Torus;
		 gp_Torus();

		/****** gp_Torus::gp_Torus ******/
		/****** md5 signature: 20865bbb347cb045f660bf39cfa486c9 ******/
		%feature("compactdefaultargs") gp_Torus;
		%feature("autodoc", "
Parameters
----------
theA3: gp_Ax3
theMajorRadius: double
theMinorRadius: double

Return
-------
None

Description
-----------
a torus centered on the origin of coordinate system theA3, with major radius theMajorRadius and minor radius theMinorRadius, and with the reference plane defined by the origin, the 'X Direction' and the 'Y Direction' of theA3. Warnings: It is not forbidden to create a torus with theMajorRadius = theMinorRadius = 0.0 Raises ConstructionError if theMinorRadius < 0.0 or if theMajorRadius < 0.0.
") gp_Torus;
		 gp_Torus(const gp_Ax3 & theA3, const double theMajorRadius, const double theMinorRadius);

		/****** gp_Torus::Area ******/
		/****** md5 signature: a088fd3ed75aeafb3fa8330998cab53d ******/
		%feature("compactdefaultargs") Area;
		%feature("autodoc", "Return
-------
double

Description
-----------
Computes the area of the torus.
") Area;
		double Area();

		/****** gp_Torus::Axis ******/
		/****** md5 signature: 92df3aa78c9ee700462ef461d4ed4603 ******/
		%feature("compactdefaultargs") Axis;
		%feature("autodoc", "Return
-------
gp_Ax1

Description
-----------
returns the symmetry axis of the torus.
") Axis;
		const gp_Ax1 Axis();

		/****** gp_Torus::Coefficients ******/
		/****** md5 signature: 19b346475407246acd3f2b2ebd3aa9b1 ******/
		%feature("compactdefaultargs") Coefficients;
		%feature("autodoc", "
Parameters
----------
theCoef: TColStd_Array1OfReal

Return
-------
None

Description
-----------
Computes the coefficients of the implicit equation of the surface in the absolute Cartesian coordinate system: @code Coef(1) * X^4 + Coef(2) * Y^4 + Coef(3) * Z^4 + Coef(4) * X^3 * Y + Coef(5) * X^3 * Z + Coef(6) * Y^3 * X + Coef(7) * Y^3 * Z + Coef(8) * Z^3 * X + Coef(9) * Z^3 * Y + Coef(10) * X^2 * Y^2 + Coef(11) * X^2 * Z^2 + Coef(12) * Y^2 * Z^2 + Coef(13) * X^2 * Y * Z + Coef(14) * X * Y^2 * Z + Coef(15) * X * Y * Z^2 + Coef(16) * X^3 + Coef(17) * Y^3 + Coef(18) * Z^3 + Coef(19) * X^2 * Y + Coef(20) * X^2 * Z + Coef(21) * Y^2 * X + Coef(22) * Y^2 * Z + Coef(23) * Z^2 * X + Coef(24) * Z^2 * Y + Coef(25) * X * Y * Z + Coef(26) * X^2 + Coef(27) * Y^2 + Coef(28) * Z^2 + Coef(29) * X * Y + Coef(30) * X * Z + Coef(31) * Y * Z + Coef(32) * X + Coef(33) * Y + Coef(34) * Z + Coef(35) = 0.0 @endcode Raises DimensionError if the length of theCoef is lower than 35.
") Coefficients;
		void Coefficients(TColStd_Array1OfReal & theCoef);

		/****** gp_Torus::Direct ******/
		/****** md5 signature: 666afd9b1feb9c16371f38b8235304e9 ******/
		%feature("compactdefaultargs") Direct;
		%feature("autodoc", "Return
-------
bool

Description
-----------
returns true if the Ax3, the local coordinate system of this torus, is right handed.
") Direct;
		bool Direct();

		/****** gp_Torus::Location ******/
		/****** md5 signature: 2c3e536bdb11b2c2c46fc19fd8a6c569 ******/
		%feature("compactdefaultargs") Location;
		%feature("autodoc", "Return
-------
gp_Pnt

Description
-----------
Returns the Torus's location.
") Location;
		const gp_Pnt Location();

		/****** gp_Torus::MajorRadius ******/
		/****** md5 signature: f3c8e84cfab3df86862664576afed07f ******/
		%feature("compactdefaultargs") MajorRadius;
		%feature("autodoc", "Return
-------
double

Description
-----------
returns the major radius of the torus.
") MajorRadius;
		double MajorRadius();

		/****** gp_Torus::MinorRadius ******/
		/****** md5 signature: 2cdcbbe9dc623324c534b7df914ad3c3 ******/
		%feature("compactdefaultargs") MinorRadius;
		%feature("autodoc", "Return
-------
double

Description
-----------
returns the minor radius of the torus.
") MinorRadius;
		double MinorRadius();

		/****** gp_Torus::Mirror ******/
		/****** md5 signature: 0f424be72f12474fe3ff290168029c4e ******/
		%feature("compactdefaultargs") Mirror;
		%feature("autodoc", "
Parameters
----------
theP: gp_Pnt

Return
-------
None

Description
-----------
No available documentation.
") Mirror;
		void Mirror(const gp_Pnt & theP);

		/****** gp_Torus::Mirror ******/
		/****** md5 signature: f508bc9f1879a959242732c259593a0a ******/
		%feature("compactdefaultargs") Mirror;
		%feature("autodoc", "
Parameters
----------
theA1: gp_Ax1

Return
-------
None

Description
-----------
No available documentation.
") Mirror;
		void Mirror(const gp_Ax1 & theA1);

		/****** gp_Torus::Mirror ******/
		/****** md5 signature: ba516d9e4a2b6af0ed16d37de915dd83 ******/
		%feature("compactdefaultargs") Mirror;
		%feature("autodoc", "
Parameters
----------
theA2: gp_Ax2

Return
-------
None

Description
-----------
No available documentation.
") Mirror;
		void Mirror(const gp_Ax2 & theA2);

		/****** gp_Torus::Mirrored ******/
		/****** md5 signature: af976a624a9a6fd6e83f55a1bd572b71 ******/
		%feature("compactdefaultargs") Mirrored;
		%feature("autodoc", "
Parameters
----------
theP: gp_Pnt

Return
-------
gp_Torus

Description
-----------
Performs the symmetrical transformation of a torus with respect to the point theP which is the center of the symmetry.
") Mirrored;
		gp_Torus Mirrored(const gp_Pnt & theP);

		/****** gp_Torus::Mirrored ******/
		/****** md5 signature: 1aa807e60007576268f556f9da6cce69 ******/
		%feature("compactdefaultargs") Mirrored;
		%feature("autodoc", "
Parameters
----------
theA1: gp_Ax1

Return
-------
gp_Torus

Description
-----------
Performs the symmetrical transformation of a torus with respect to an axis placement which is the axis of the symmetry.
") Mirrored;
		gp_Torus Mirrored(const gp_Ax1 & theA1);

		/****** gp_Torus::Mirrored ******/
		/****** md5 signature: 6156946ba517a6e0a2c6830a99ac0891 ******/
		%feature("compactdefaultargs") Mirrored;
		%feature("autodoc", "
Parameters
----------
theA2: gp_Ax2

Return
-------
gp_Torus

Description
-----------
Performs the symmetrical transformation of a torus with respect to a plane. The axis placement theA2 locates the plane of the of the symmetry: (Location, XDirection, YDirection).
") Mirrored;
		gp_Torus Mirrored(const gp_Ax2 & theA2);

		/****** gp_Torus::Position ******/
		/****** md5 signature: 074afca7172f5d6d32484431775e9338 ******/
		%feature("compactdefaultargs") Position;
		%feature("autodoc", "Return
-------
gp_Ax3

Description
-----------
Returns the local coordinates system of the torus.
") Position;
		const gp_Ax3 Position();

		/****** gp_Torus::Rotate ******/
		/****** md5 signature: 652dfbf621c2c092ff5b68d608de4634 ******/
		%feature("compactdefaultargs") Rotate;
		%feature("autodoc", "
Parameters
----------
theA1: gp_Ax1
theAng: double

Return
-------
None

Description
-----------
No available documentation.
") Rotate;
		void Rotate(const gp_Ax1 & theA1, const double theAng);

		/****** gp_Torus::Rotated ******/
		/****** md5 signature: 4f33b20187b772917a07f7b3b17ee333 ******/
		%feature("compactdefaultargs") Rotated;
		%feature("autodoc", "
Parameters
----------
theA1: gp_Ax1
theAng: double

Return
-------
gp_Torus

Description
-----------
Rotates a torus. theA1 is the axis of the rotation. theAng is the angular value of the rotation in radians.
") Rotated;
		gp_Torus Rotated(const gp_Ax1 & theA1, const double theAng);

		/****** gp_Torus::Scale ******/
		/****** md5 signature: a03901fe94facbb26121cd37d5814f81 ******/
		%feature("compactdefaultargs") Scale;
		%feature("autodoc", "
Parameters
----------
theP: gp_Pnt
theS: double

Return
-------
None

Description
-----------
No available documentation.
") Scale;
		void Scale(const gp_Pnt & theP, const double theS);

		/****** gp_Torus::Scaled ******/
		/****** md5 signature: d7f7dcfb12aef5b20cfc6c1172923bd3 ******/
		%feature("compactdefaultargs") Scaled;
		%feature("autodoc", "
Parameters
----------
theP: gp_Pnt
theS: double

Return
-------
gp_Torus

Description
-----------
Scales a torus. S is the scaling value. The absolute value of S is used to scale the torus.
") Scaled;
		gp_Torus Scaled(const gp_Pnt & theP, const double theS);

		/****** gp_Torus::SetAxis ******/
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
Modifies this torus, by redefining its local coordinate system so that: - its origin and 'main Direction' become those of the axis theA1 (the 'X Direction' and 'Y Direction' are then recomputed). Raises ConstructionError if the direction of theA1 is parallel to the 'XDirection' of the coordinate system of the toroidal surface.
") SetAxis;
		void SetAxis(const gp_Ax1 & theA1);

		/****** gp_Torus::SetLocation ******/
		/****** md5 signature: f1c958277e2e7de2571c6b5691801e2a ******/
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
Changes the location of the torus.
") SetLocation;
		void SetLocation(const gp_Pnt & theLoc);

		/****** gp_Torus::SetMajorRadius ******/
		/****** md5 signature: 5eff03578088313d850e2a4c6dac1d86 ******/
		%feature("compactdefaultargs") SetMajorRadius;
		%feature("autodoc", "
Parameters
----------
theMajorRadius: double

Return
-------
None

Description
-----------
Assigns value to the major radius of this torus. Raises ConstructionError if theMajorRadius - MinorRadius <= Resolution().
") SetMajorRadius;
		void SetMajorRadius(const double theMajorRadius);

		/****** gp_Torus::SetMinorRadius ******/
		/****** md5 signature: dfefc317649a676db76eca5eab95531a ******/
		%feature("compactdefaultargs") SetMinorRadius;
		%feature("autodoc", "
Parameters
----------
theMinorRadius: double

Return
-------
None

Description
-----------
Assigns value to the minor radius of this torus. Raises ConstructionError if theMinorRadius < 0.0 or if MajorRadius - theMinorRadius <= Resolution from gp.
") SetMinorRadius;
		void SetMinorRadius(const double theMinorRadius);

		/****** gp_Torus::SetPosition ******/
		/****** md5 signature: 967a77c1867c53ae2fb8ec3b93905c83 ******/
		%feature("compactdefaultargs") SetPosition;
		%feature("autodoc", "
Parameters
----------
theA3: gp_Ax3

Return
-------
None

Description
-----------
Changes the local coordinate system of the surface.
") SetPosition;
		void SetPosition(const gp_Ax3 & theA3);

		/****** gp_Torus::Transform ******/
		/****** md5 signature: 0737a7286be728220e1a55ba0d6eafc3 ******/
		%feature("compactdefaultargs") Transform;
		%feature("autodoc", "
Parameters
----------
theT: gp_Trsf

Return
-------
None

Description
-----------
No available documentation.
") Transform;
		void Transform(const gp_Trsf & theT);

		/****** gp_Torus::Transformed ******/
		/****** md5 signature: 163cb63b4e1664daa518145e11148598 ******/
		%feature("compactdefaultargs") Transformed;
		%feature("autodoc", "
Parameters
----------
theT: gp_Trsf

Return
-------
gp_Torus

Description
-----------
Transforms a torus with the transformation theT from class Trsf.
") Transformed;
		gp_Torus Transformed(const gp_Trsf & theT);

		/****** gp_Torus::Translate ******/
		/****** md5 signature: 8ae07d4c829c1eef2e7708ef5390638b ******/
		%feature("compactdefaultargs") Translate;
		%feature("autodoc", "
Parameters
----------
theV: gp_Vec

Return
-------
None

Description
-----------
No available documentation.
") Translate;
		void Translate(const gp_Vec & theV);

		/****** gp_Torus::Translate ******/
		/****** md5 signature: 279c13d6194eb867625753d756d110ab ******/
		%feature("compactdefaultargs") Translate;
		%feature("autodoc", "
Parameters
----------
theP1: gp_Pnt
theP2: gp_Pnt

Return
-------
None

Description
-----------
No available documentation.
") Translate;
		void Translate(const gp_Pnt & theP1, const gp_Pnt & theP2);

		/****** gp_Torus::Translated ******/
		/****** md5 signature: c9cfa9b24fa8e5bd5b44e5a4fbd4509c ******/
		%feature("compactdefaultargs") Translated;
		%feature("autodoc", "
Parameters
----------
theV: gp_Vec

Return
-------
gp_Torus

Description
-----------
Translates a torus in the direction of the vector theV. The magnitude of the translation is the vector's magnitude.
") Translated;
		gp_Torus Translated(const gp_Vec & theV);

		/****** gp_Torus::Translated ******/
		/****** md5 signature: 2ee0ad79bdd3cd10ab6b382e82b1b3a0 ******/
		%feature("compactdefaultargs") Translated;
		%feature("autodoc", "
Parameters
----------
theP1: gp_Pnt
theP2: gp_Pnt

Return
-------
gp_Torus

Description
-----------
Translates a torus from the point theP1 to the point theP2.
") Translated;
		gp_Torus Translated(const gp_Pnt & theP1, const gp_Pnt & theP2);

		/****** gp_Torus::UReverse ******/
		/****** md5 signature: 69a43a8af82ddbb84c6e12cf963de477 ******/
		%feature("compactdefaultargs") UReverse;
		%feature("autodoc", "Return
-------
None

Description
-----------
Reverses the U parametrization of the torus reversing the YAxis.
") UReverse;
		void UReverse();

		/****** gp_Torus::VReverse ******/
		/****** md5 signature: 07b53fb5da02e3545309a68afe3655c9 ******/
		%feature("compactdefaultargs") VReverse;
		%feature("autodoc", "Return
-------
None

Description
-----------
Reverses the V parametrization of the torus reversing the ZAxis.
") VReverse;
		void VReverse();

		/****** gp_Torus::Volume ******/
		/****** md5 signature: 166f423b2edf1139ae279a35dd46d71c ******/
		%feature("compactdefaultargs") Volume;
		%feature("autodoc", "Return
-------
double

Description
-----------
Computes the volume of the torus.
") Volume;
		double Volume();

		/****** gp_Torus::XAxis ******/
		/****** md5 signature: 37d8185a57a29bf9b7aa10d76b1229a2 ******/
		%feature("compactdefaultargs") XAxis;
		%feature("autodoc", "Return
-------
gp_Ax1

Description
-----------
returns the axis X of the torus.
") XAxis;
		gp_Ax1 XAxis();

		/****** gp_Torus::YAxis ******/
		/****** md5 signature: 78f0cb55c98fbe890a49b3158d9f5039 ******/
		%feature("compactdefaultargs") YAxis;
		%feature("autodoc", "Return
-------
gp_Ax1

Description
-----------
returns the axis Y of the torus.
") YAxis;
		gp_Ax1 YAxis();

};



%extend gp_Torus {
%pythoncode {
    def __getstate__(self):
        return self.DumpJson()
    }
};

%extend gp_Torus {
%pythoncode {
    def __setstate__(self, state):
        inst = gp_Torus()
        if inst.InitFromJson(state):
            self.this = inst.this
        else:
            raise IOError('Failed to set state of gp_Torus')
    }
};
%extend gp_Torus {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************
* class gp_Trsf *
****************/
class gp_Trsf {
	public:
		/****** gp_Trsf::gp_Trsf ******/
		/****** md5 signature: f10d1914a99c663698adac59187da93e ******/
		%feature("compactdefaultargs") gp_Trsf;
		%feature("autodoc", "Return
-------
None

Description
-----------
Returns the identity transformation.
") gp_Trsf;
		 gp_Trsf();

		/****** gp_Trsf::gp_Trsf ******/
		/****** md5 signature: 6add598973f1df2d0eb2b3ed0eccd65d ******/
		%feature("compactdefaultargs") gp_Trsf;
		%feature("autodoc", "
Parameters
----------
theT: gp_Trsf2d

Return
-------
None

Description
-----------
Creates a 3D transformation from the 2D transformation theT. The resulting transformation has a homogeneous vectorial part, V3, and a translation part, T3, built from theT: a11 a12 0 a13 V3 = a21 a22 0 T3 = a23 0 0 1. 0 It also has the same scale factor as theT. This guarantees (by projection) that the transformation which would be performed by theT in a plane (2D space) is performed by the resulting transformation in the xOy plane of the 3D space, (i.e. in the plane defined by the origin (0., 0., 0.) and the vectors DX (1., 0., 0.), and DY (0., 1., 0.)). The scale factor is applied to the entire space.
") gp_Trsf;
		 gp_Trsf(const gp_Trsf2d & theT);


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
		/****** gp_Trsf::Form ******/
		/****** md5 signature: 01822abba3940957d80f7a742c62bc53 ******/
		%feature("compactdefaultargs") Form;
		%feature("autodoc", "Return
-------
gp_TrsfForm

Description
-----------
Returns the nature of the transformation. It can be: an identity transformation, a rotation, a translation, a mirror transformation (relative to a point, an axis or a plane), a scaling transformation, or a compound transformation.
") Form;
		gp_TrsfForm Form();

		/****** gp_Trsf::GetRotation ******/
		/****** md5 signature: 2de56ea760e01d546f9025a4f4f25b2e ******/
		%feature("compactdefaultargs") GetRotation;
		%feature("autodoc", "
Parameters
----------
theAxis: gp_XYZ

Return
-------
theAngle: double

Description
-----------
Returns the boolean True if there is non-zero rotation. In the presence of rotation, the output parameters store the axis and the angle of rotation. The method always returns positive value 'theAngle', i.e., 0. < theAngle <= PI. Note that this rotation is defined only by the vectorial part of the transformation; generally you would need to check also the translational part to obtain the axis (gp_Ax1) of rotation.
") GetRotation;
		bool GetRotation(gp_XYZ & theAxis, Standard_Real &OutValue);

		/****** gp_Trsf::GetRotation ******/
		/****** md5 signature: 2b6ec5870e6bdcf47232f9eb0ab62106 ******/
		%feature("compactdefaultargs") GetRotation;
		%feature("autodoc", "Return
-------
gp_Quaternion

Description
-----------
Returns quaternion representing rotational part of the transformation.
") GetRotation;
		gp_Quaternion GetRotation();

		/****** gp_Trsf::HVectorialPart ******/
		/****** md5 signature: 8de3cba8ca58da33c571017d755b1d5e ******/
		%feature("compactdefaultargs") HVectorialPart;
		%feature("autodoc", "Return
-------
gp_Mat

Description
-----------
Computes the homogeneous vectorial part of the transformation. It is a 3*3 matrix which doesn't include the scale factor. In other words, the vectorial part of this transformation is equal to its homogeneous vectorial part, multiplied by the scale factor. The coefficients of this matrix must be multiplied by the scale factor to obtain the coefficients of the transformation.
") HVectorialPart;
		const gp_Mat HVectorialPart();


        /****************** InitFromJson ******************/
        %feature("autodoc", "
Parameters
----------
json_string: the string

Return
-------
bool

Description
-----------
Init the object from a JSON string.
") InitFromJson;
        %extend{
            bool InitFromJson(std::string json_string) {
            std::stringstream s(json_string);
            Standard_Integer pos=2;
            return self->InitFromJson(s, pos);}
        };
		/****** gp_Trsf::Invert ******/
		/****** md5 signature: 980f166f600d23a8c77565829af2eeff ******/
		%feature("compactdefaultargs") Invert;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Invert;
		void Invert();

		/****** gp_Trsf::Inverted ******/
		/****** md5 signature: 8c8178aff8d9de38358efe4f66ee976d ******/
		%feature("compactdefaultargs") Inverted;
		%feature("autodoc", "Return
-------
gp_Trsf

Description
-----------
Computes the reverse transformation Raises an exception if the matrix of the transformation is not inversible, it means that the scale factor is lower or equal to Resolution from package gp. Computes the transformation composed with T and <self>. In a C++ implementation you can also write Tcomposed = <self> * T. Example: @code gp_Trsf T1, T2, Tcomp; ............... Tcomp = T2.Multiplied(T1); // or (Tcomp = T2 * T1) gp_Pnt P1(10.,3.,4.); gp_Pnt P2 = P1.Transformed(Tcomp); // using Tcomp gp_Pnt P3 = P1.Transformed(T1); // using T1 then T2 P3.Transform(T2); // P3 = P2 !!! @endcode.
") Inverted;
		gp_Trsf Inverted();

		/****** gp_Trsf::IsNegative ******/
		/****** md5 signature: 374450f188a20ccc5e75ca9181057e04 ******/
		%feature("compactdefaultargs") IsNegative;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if the determinant of the vectorial part of this transformation is negative.
") IsNegative;
		bool IsNegative();

		/****** gp_Trsf::Multiplied ******/
		/****** md5 signature: a3abf3b187b687f3316b5161531d0cae ******/
		%feature("compactdefaultargs") Multiplied;
		%feature("autodoc", "
Parameters
----------
theT: gp_Trsf

Return
-------
gp_Trsf

Description
-----------
No available documentation.
") Multiplied;
		gp_Trsf Multiplied(const gp_Trsf & theT);

		/****** gp_Trsf::Multiply ******/
		/****** md5 signature: f7e5c9868b36738395306823c3477607 ******/
		%feature("compactdefaultargs") Multiply;
		%feature("autodoc", "
Parameters
----------
theT: gp_Trsf

Return
-------
None

Description
-----------
Computes the transformation composed with <self> and theT. <self> = <self> * theT.
") Multiply;
		void Multiply(const gp_Trsf & theT);

		/****** gp_Trsf::Power ******/
		/****** md5 signature: f3a3cc0edc25db3d73a8d582f1c4bc84 ******/
		%feature("compactdefaultargs") Power;
		%feature("autodoc", "
Parameters
----------
theN: int

Return
-------
None

Description
-----------
No available documentation.
") Power;
		void Power(const int theN);

		/****** gp_Trsf::Powered ******/
		/****** md5 signature: c7c8e9027d7ab31c6dadcfc7c765722d ******/
		%feature("compactdefaultargs") Powered;
		%feature("autodoc", "
Parameters
----------
theN: int

Return
-------
gp_Trsf

Description
-----------
Computes the following composition of transformations <self> * <self> * .......* <self>, theN time. if theN = 0 <self> = Identity if theN < 0 <self> = <self>.Inverse() *...........* <self>.Inverse(). //! Raises if theN < 0 and if the matrix of the transformation not inversible.
") Powered;
		gp_Trsf Powered(const int theN);

		/****** gp_Trsf::PreMultiply ******/
		/****** md5 signature: 42107802698e6c1a034595a950dbefa8 ******/
		%feature("compactdefaultargs") PreMultiply;
		%feature("autodoc", "
Parameters
----------
theT: gp_Trsf

Return
-------
None

Description
-----------
Computes the transformation composed with <self> and T. <self> = theT * <self>.
") PreMultiply;
		void PreMultiply(const gp_Trsf & theT);

		/****** gp_Trsf::ScaleFactor ******/
		/****** md5 signature: fe9aa24a5cde3a30e10ee9dddce69546 ******/
		%feature("compactdefaultargs") ScaleFactor;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns the scale factor.
") ScaleFactor;
		double ScaleFactor();

		/****** gp_Trsf::SetDisplacement ******/
		/****** md5 signature: bc729f850e51b221372c978f53e0e274 ******/
		%feature("compactdefaultargs") SetDisplacement;
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
Modifies this transformation so that it transforms the coordinate system defined by theFromSystem1 into the one defined by theToSystem2. After this modification, this transformation transforms: - the origin of theFromSystem1 into the origin of theToSystem2, - the 'X Direction' of theFromSystem1 into the 'X Direction' of theToSystem2, - the 'Y Direction' of theFromSystem1 into the 'Y Direction' of theToSystem2, and - the 'main Direction' of theFromSystem1 into the 'main Direction' of theToSystem2. Warning When you know the coordinates of a point in one coordinate system and you want to express these coordinates in another one, do not use the transformation resulting from this function. Use the transformation that results from SetTransformation instead. SetDisplacement and SetTransformation create related transformations: the vectorial part of one is the inverse of the vectorial part of the other.
") SetDisplacement;
		void SetDisplacement(const gp_Ax3 & theFromSystem1, const gp_Ax3 & theToSystem2);

		/****** gp_Trsf::SetForm ******/
		/****** md5 signature: 83dc41a106117f5617e24a9105ed8473 ******/
		%feature("compactdefaultargs") SetForm;
		%feature("autodoc", "
Parameters
----------
theP: gp_TrsfForm

Return
-------
None

Description
-----------
No available documentation.
") SetForm;
		void SetForm(const gp_TrsfForm theP);

		/****** gp_Trsf::SetMirror ******/
		/****** md5 signature: f95330f236a3851bacbc37b43e6de30a ******/
		%feature("compactdefaultargs") SetMirror;
		%feature("autodoc", "
Parameters
----------
theP: gp_Pnt

Return
-------
None

Description
-----------
Makes the transformation into a symmetrical transformation. theP is the center of the symmetry.
") SetMirror;
		void SetMirror(const gp_Pnt & theP);

		/****** gp_Trsf::SetMirror ******/
		/****** md5 signature: 7f22791c21e7cef89b40c641b8040d7b ******/
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
Makes the transformation into a symmetrical transformation. theA1 is the center of the axial symmetry.
") SetMirror;
		void SetMirror(const gp_Ax1 & theA1);

		/****** gp_Trsf::SetMirror ******/
		/****** md5 signature: c6455c42a777c074a7df4929500474dc ******/
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
Makes the transformation into a symmetrical transformation. theA2 is the center of the planar symmetry and defines the plane of symmetry by its origin, 'X Direction' and 'Y Direction'.
") SetMirror;
		void SetMirror(const gp_Ax2 & theA2);

		/****** gp_Trsf::SetRotation ******/
		/****** md5 signature: 4c421dda4a8780c3e6ba1d65ee3f5387 ******/
		%feature("compactdefaultargs") SetRotation;
		%feature("autodoc", "
Parameters
----------
theA1: gp_Ax1
theAng: double

Return
-------
None

Description
-----------
Changes the transformation into a rotation. theA1 is the rotation axis and theAng is the angular value of the rotation in radians.
") SetRotation;
		void SetRotation(const gp_Ax1 & theA1, const double theAng);

		/****** gp_Trsf::SetRotation ******/
		/****** md5 signature: 987ac7613cdf0a3488f1e342439d9ee3 ******/
		%feature("compactdefaultargs") SetRotation;
		%feature("autodoc", "
Parameters
----------
theR: gp_Quaternion

Return
-------
None

Description
-----------
Changes the transformation into a rotation defined by quaternion. Note that rotation is performed around origin, i.e. no translation is involved.
") SetRotation;
		void SetRotation(const gp_Quaternion & theR);

		/****** gp_Trsf::SetRotationPart ******/
		/****** md5 signature: 8c5113644708ca7c4e1104b931cda1ca ******/
		%feature("compactdefaultargs") SetRotationPart;
		%feature("autodoc", "
Parameters
----------
theR: gp_Quaternion

Return
-------
None

Description
-----------
Replaces the rotation part with specified quaternion.
") SetRotationPart;
		void SetRotationPart(const gp_Quaternion & theR);

		/****** gp_Trsf::SetScale ******/
		/****** md5 signature: 6537f12abaedd8527d10135f78d0a3f9 ******/
		%feature("compactdefaultargs") SetScale;
		%feature("autodoc", "
Parameters
----------
theP: gp_Pnt
theS: double

Return
-------
None

Description
-----------
Changes the transformation into a scale. theP is the center of the scale and theS is the scaling value. Raises ConstructionError If <theS> is null.
") SetScale;
		void SetScale(const gp_Pnt & theP, const double theS);

		/****** gp_Trsf::SetScaleFactor ******/
		/****** md5 signature: 586f9ae1e2b37abeaaadf642a99b2aa4 ******/
		%feature("compactdefaultargs") SetScaleFactor;
		%feature("autodoc", "
Parameters
----------
theS: double

Return
-------
None

Description
-----------
Modifies the scale factor. Raises ConstructionError If theS is null.
") SetScaleFactor;
		void SetScaleFactor(const double theS);

		/****** gp_Trsf::SetTransformation ******/
		/****** md5 signature: 24bd7f24f8983593be0b8a50fb19e976 ******/
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
Modifies this transformation so that it transforms the coordinates of any point, (x, y, z), relative to a source coordinate system into the coordinates (x', y', z') which are relative to a target coordinate system, but which represent the same point The transformation is from the coordinate system 'theFromSystem1' to the coordinate system 'theToSystem2'. Example: @code gp_Ax3 theFromSystem1, theToSystem2; double x1, y1, z1; // are the coordinates of a point in the local system theFromSystem1 double x2, y2, z2; // are the coordinates of a point in the local system theToSystem2 gp_Pnt P1 (x1, y1, z1) gp_Trsf T; T.SetTransformation (theFromSystem1, theToSystem2); gp_Pnt P2 = P1.Transformed (T); P2.Coord (x2, y2, z2); @endcode.
") SetTransformation;
		void SetTransformation(const gp_Ax3 & theFromSystem1, const gp_Ax3 & theToSystem2);

		/****** gp_Trsf::SetTransformation ******/
		/****** md5 signature: 0745462ab5e4d17def9aec346b35bea2 ******/
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
Modifies this transformation so that it transforms the coordinates of any point, (x, y, z), relative to a source coordinate system into the coordinates (x', y', z') which are relative to a target coordinate system, but which represent the same point The transformation is from the default coordinate system @code {P(0.,0.,0.), VX (1.,0.,0.), VY (0.,1.,0.), VZ (0., 0. ,1.) } @endcode to the local coordinate system defined with the Ax3 theToSystem. Use in the same way as the previous method. FromSystem1 is defaulted to the absolute coordinate system.
") SetTransformation;
		void SetTransformation(const gp_Ax3 & theToSystem);

		/****** gp_Trsf::SetTransformation ******/
		/****** md5 signature: 3a12cdc1c4650d167b7f7d3a0fd125d8 ******/
		%feature("compactdefaultargs") SetTransformation;
		%feature("autodoc", "
Parameters
----------
R: gp_Quaternion
theT: gp_Vec

Return
-------
None

Description
-----------
Sets transformation by directly specified rotation and translation.
") SetTransformation;
		void SetTransformation(const gp_Quaternion & R, const gp_Vec & theT);

		/****** gp_Trsf::SetTranslation ******/
		/****** md5 signature: feb8285be8340494cfcc56882217beb8 ******/
		%feature("compactdefaultargs") SetTranslation;
		%feature("autodoc", "
Parameters
----------
theV: gp_Vec

Return
-------
None

Description
-----------
Changes the transformation into a translation. theV is the vector of the translation.
") SetTranslation;
		void SetTranslation(const gp_Vec & theV);

		/****** gp_Trsf::SetTranslation ******/
		/****** md5 signature: c1c69f606116ec2dbc0240af8b9dbea9 ******/
		%feature("compactdefaultargs") SetTranslation;
		%feature("autodoc", "
Parameters
----------
theP1: gp_Pnt
theP2: gp_Pnt

Return
-------
None

Description
-----------
Makes the transformation into a translation where the translation vector is the vector (theP1, theP2) defined from point theP1 to point theP2.
") SetTranslation;
		void SetTranslation(const gp_Pnt & theP1, const gp_Pnt & theP2);

		/****** gp_Trsf::SetTranslationPart ******/
		/****** md5 signature: 4dad458d11bcf04828e7558cb22aa9c6 ******/
		%feature("compactdefaultargs") SetTranslationPart;
		%feature("autodoc", "
Parameters
----------
theV: gp_Vec

Return
-------
None

Description
-----------
Replaces the translation vector with the vector theV.
") SetTranslationPart;
		void SetTranslationPart(const gp_Vec & theV);

		/****** gp_Trsf::SetValues ******/
		/****** md5 signature: 6617fcee4e89cf32d5a0ec255a9bd286 ******/
		%feature("compactdefaultargs") SetValues;
		%feature("autodoc", "
Parameters
----------
a11: double
a12: double
a13: double
a14: double
a21: double
a22: double
a23: double
a24: double
a31: double
a32: double
a33: double
a34: double

Return
-------
None

Description
-----------
Sets the coefficients of the transformation. The transformation of the point x,y,z is the point x',y',z' with: @code x' = a11 x + a12 y + a13 z + a14 y' = a21 x + a22 y + a23 z + a24 z' = a31 x + a32 y + a33 z + a34 @endcode The method Value(i,j) will return aij. Raises ConstructionError if the determinant of the aij is null. The matrix is orthogonalized before future using.
") SetValues;
		void SetValues(const double a11, const double a12, const double a13, const double a14, const double a21, const double a22, const double a23, const double a24, const double a31, const double a32, const double a33, const double a34);

		/****** gp_Trsf::Transforms ******/
		/****** md5 signature: a431bedfdca89d6e601967bf688126e9 ******/
		%feature("compactdefaultargs") Transforms;
		%feature("autodoc", "
Parameters
----------

Return
-------
theX: double
theY: double
theZ: double

Description
-----------
No available documentation.
") Transforms;
		void Transforms(Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** gp_Trsf::Transforms ******/
		/****** md5 signature: a80a85a5c322be8a91246ac2ca77e0f7 ******/
		%feature("compactdefaultargs") Transforms;
		%feature("autodoc", "
Parameters
----------
theCoord: gp_XYZ

Return
-------
None

Description
-----------
Transformation of a triplet XYZ with a Trsf.
") Transforms;
		void Transforms(gp_XYZ & theCoord);

		/****** gp_Trsf::TranslationPart ******/
		/****** md5 signature: 2e8b1c597fc25157ceb8e1f212767e5b ******/
		%feature("compactdefaultargs") TranslationPart;
		%feature("autodoc", "Return
-------
gp_XYZ

Description
-----------
Returns the translation part of the transformation's matrix.
") TranslationPart;
		const gp_XYZ TranslationPart();

		/****** gp_Trsf::Value ******/
		/****** md5 signature: 3f1341b0f5a1b548318b2db63518e612 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
theRow: int
theCol: int

Return
-------
double

Description
-----------
Returns the coefficients of the transformation's matrix. It is a 3 rows * 4 columns matrix. This coefficient includes the scale factor. Raises OutOfRanged if theRow < 1 or theRow > 3 or theCol < 1 or theCol > 4.
") Value;
		double Value(const int theRow, const int theCol);

		/****** gp_Trsf::VectorialPart ******/
		/****** md5 signature: 1846807386763fd9c8713fbb8e87e830 ******/
		%feature("compactdefaultargs") VectorialPart;
		%feature("autodoc", "Return
-------
gp_Mat

Description
-----------
Returns the vectorial part of the transformation. It is a 3*3 matrix which includes the scale factor.
") VectorialPart;
		gp_Mat VectorialPart();

		/****** gp_Trsf::operator * ******/
		/****** md5 signature: b852c4112a776404e70a5d4e78b8784a ******/
		%feature("compactdefaultargs") operator *;
		%feature("autodoc", "
Parameters
----------
theT: gp_Trsf

Return
-------
gp_Trsf

Description
-----------
No available documentation.
") operator *;
		gp_Trsf operator *(const gp_Trsf & theT);


%extend{
    void __imul_wrapper__(const gp_Trsf other) {
    *self *= other;
    }
}
%pythoncode {
def __imul__(self, right):
    self.__imul_wrapper__(right)
    return self
}
};



%extend gp_Trsf {
%pythoncode {
    def __getstate__(self):
        return self.DumpJson()
    }
};

%extend gp_Trsf {
%pythoncode {
    def __setstate__(self, state):
        inst = gp_Trsf()
        if inst.InitFromJson(state):
            self.this = inst.this
        else:
            raise IOError('Failed to set state of gp_Trsf')
    }
};
%extend gp_Trsf {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************
* class gp_Trsf2d *
******************/
class gp_Trsf2d {
	public:
		/****** gp_Trsf2d::gp_Trsf2d ******/
		/****** md5 signature: 851bed2ee074ee157af313c0f9705e4e ******/
		%feature("compactdefaultargs") gp_Trsf2d;
		%feature("autodoc", "Return
-------
None

Description
-----------
Returns identity transformation.
") gp_Trsf2d;
		 gp_Trsf2d();

		/****** gp_Trsf2d::gp_Trsf2d ******/
		/****** md5 signature: c6c9328acf9434f4dda10fa30184a1a2 ******/
		%feature("compactdefaultargs") gp_Trsf2d;
		%feature("autodoc", "
Parameters
----------
theT: gp_Trsf

Return
-------
None

Description
-----------
Creates a 2d transformation in the XY plane from a 3d transformation .
") gp_Trsf2d;
		 gp_Trsf2d(const gp_Trsf & theT);

		/****** gp_Trsf2d::Form ******/
		/****** md5 signature: 01822abba3940957d80f7a742c62bc53 ******/
		%feature("compactdefaultargs") Form;
		%feature("autodoc", "Return
-------
gp_TrsfForm

Description
-----------
Returns the nature of the transformation. It can be an identity transformation, a rotation, a translation, a mirror (relative to a point or an axis), a scaling transformation, or a compound transformation.
") Form;
		gp_TrsfForm Form();

		/****** gp_Trsf2d::HVectorialPart ******/
		/****** md5 signature: 7428d78db5cbd603a143459ed33caca9 ******/
		%feature("compactdefaultargs") HVectorialPart;
		%feature("autodoc", "Return
-------
gp_Mat2d

Description
-----------
Returns the homogeneous vectorial part of the transformation. It is a 2*2 matrix which doesn't include the scale factor. The coefficients of this matrix must be multiplied by the scale factor to obtain the coefficients of the transformation.
") HVectorialPart;
		const gp_Mat2d HVectorialPart();

		/****** gp_Trsf2d::Invert ******/
		/****** md5 signature: 980f166f600d23a8c77565829af2eeff ******/
		%feature("compactdefaultargs") Invert;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Invert;
		void Invert();

		/****** gp_Trsf2d::Inverted ******/
		/****** md5 signature: 4a87a39cc22573a261c142b1805b0bfd ******/
		%feature("compactdefaultargs") Inverted;
		%feature("autodoc", "Return
-------
gp_Trsf2d

Description
-----------
Computes the reverse transformation. Raises an exception if the matrix of the transformation is not inversible, it means that the scale factor is lower or equal to Resolution from package gp.
") Inverted;
		gp_Trsf2d Inverted();

		/****** gp_Trsf2d::IsNegative ******/
		/****** md5 signature: 374450f188a20ccc5e75ca9181057e04 ******/
		%feature("compactdefaultargs") IsNegative;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if the determinant of the vectorial part of this transformation is negative..
") IsNegative;
		bool IsNegative();

		/****** gp_Trsf2d::Multiplied ******/
		/****** md5 signature: 0bae47e965ad147d9ddee6866d15b1be ******/
		%feature("compactdefaultargs") Multiplied;
		%feature("autodoc", "
Parameters
----------
theT: gp_Trsf2d

Return
-------
gp_Trsf2d

Description
-----------
No available documentation.
") Multiplied;
		gp_Trsf2d Multiplied(const gp_Trsf2d & theT);

		/****** gp_Trsf2d::Multiply ******/
		/****** md5 signature: 83bd30efc23d272e5df01cfeb71d71a0 ******/
		%feature("compactdefaultargs") Multiply;
		%feature("autodoc", "
Parameters
----------
theT: gp_Trsf2d

Return
-------
None

Description
-----------
Computes the transformation composed from <self> and theT. <self> = <self> * theT.
") Multiply;
		void Multiply(const gp_Trsf2d & theT);

		/****** gp_Trsf2d::Power ******/
		/****** md5 signature: f3a3cc0edc25db3d73a8d582f1c4bc84 ******/
		%feature("compactdefaultargs") Power;
		%feature("autodoc", "
Parameters
----------
theN: int

Return
-------
None

Description
-----------
No available documentation.
") Power;
		void Power(const int theN);

		/****** gp_Trsf2d::Powered ******/
		/****** md5 signature: 2133eefd937f189d63ba28a11619d981 ******/
		%feature("compactdefaultargs") Powered;
		%feature("autodoc", "
Parameters
----------
theN: int

Return
-------
gp_Trsf2d

Description
-----------
Computes the following composition of transformations <self> * <self> * .......* <self>, theN time. if theN = 0 <self> = Identity if theN < 0 <self> = <self>.Inverse() *...........* <self>.Inverse(). //! Raises if theN < 0 and if the matrix of the transformation not inversible.
") Powered;
		gp_Trsf2d Powered(const int theN);

		/****** gp_Trsf2d::PreMultiply ******/
		/****** md5 signature: 8eb748a68d09bdd778340085d327b3fc ******/
		%feature("compactdefaultargs") PreMultiply;
		%feature("autodoc", "
Parameters
----------
theT: gp_Trsf2d

Return
-------
None

Description
-----------
Computes the transformation composed from <self> and theT. <self> = theT * <self>.
") PreMultiply;
		void PreMultiply(const gp_Trsf2d & theT);

		/****** gp_Trsf2d::RotationPart ******/
		/****** md5 signature: 6cc9f4c2a5e2cfc09e6b0478f466f232 ******/
		%feature("compactdefaultargs") RotationPart;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns the angle corresponding to the rotational component of the transformation matrix (operation opposite to SetRotation()).
") RotationPart;
		double RotationPart();

		/****** gp_Trsf2d::ScaleFactor ******/
		/****** md5 signature: fe9aa24a5cde3a30e10ee9dddce69546 ******/
		%feature("compactdefaultargs") ScaleFactor;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns the scale factor.
") ScaleFactor;
		double ScaleFactor();

		/****** gp_Trsf2d::SetMirror ******/
		/****** md5 signature: e91df90fb3f80694c43fa5655071cc8b ******/
		%feature("compactdefaultargs") SetMirror;
		%feature("autodoc", "
Parameters
----------
theP: gp_Pnt2d

Return
-------
None

Description
-----------
Changes the transformation into a symmetrical transformation. theP is the center of the symmetry.
") SetMirror;
		void SetMirror(const gp_Pnt2d & theP);

		/****** gp_Trsf2d::SetMirror ******/
		/****** md5 signature: 964a5b1c8a09c6c722ecc048e30719bf ******/
		%feature("compactdefaultargs") SetMirror;
		%feature("autodoc", "
Parameters
----------
theA: gp_Ax2d

Return
-------
None

Description
-----------
Changes the transformation into a symmetrical transformation. theA is the center of the axial symmetry.
") SetMirror;
		void SetMirror(const gp_Ax2d & theA);

		/****** gp_Trsf2d::SetRotation ******/
		/****** md5 signature: 8d6dd9fe7a302bd4dca900b390003c92 ******/
		%feature("compactdefaultargs") SetRotation;
		%feature("autodoc", "
Parameters
----------
theP: gp_Pnt2d
theAng: double

Return
-------
None

Description
-----------
Changes the transformation into a rotation. theP is the rotation's center and theAng is the angular value of the rotation in radian.
") SetRotation;
		void SetRotation(const gp_Pnt2d & theP, const double theAng);

		/****** gp_Trsf2d::SetScale ******/
		/****** md5 signature: b32c7976c3e4427acc8eee75b05b94c5 ******/
		%feature("compactdefaultargs") SetScale;
		%feature("autodoc", "
Parameters
----------
theP: gp_Pnt2d
theS: double

Return
-------
None

Description
-----------
Changes the transformation into a scale. theP is the center of the scale and theS is the scaling value.
") SetScale;
		void SetScale(const gp_Pnt2d & theP, const double theS);

		/****** gp_Trsf2d::SetScaleFactor ******/
		/****** md5 signature: 586f9ae1e2b37abeaaadf642a99b2aa4 ******/
		%feature("compactdefaultargs") SetScaleFactor;
		%feature("autodoc", "
Parameters
----------
theS: double

Return
-------
None

Description
-----------
Modifies the scale factor.
") SetScaleFactor;
		void SetScaleFactor(const double theS);

		/****** gp_Trsf2d::SetTransformation ******/
		/****** md5 signature: 648b6e972dffc1e8307f6e821456e152 ******/
		%feature("compactdefaultargs") SetTransformation;
		%feature("autodoc", "
Parameters
----------
theFromSystem1: gp_Ax2d
theToSystem2: gp_Ax2d

Return
-------
None

Description
-----------
Changes a transformation allowing passage from the coordinate system 'theFromSystem1' to the coordinate system 'theToSystem2'.
") SetTransformation;
		void SetTransformation(const gp_Ax2d & theFromSystem1, const gp_Ax2d & theToSystem2);

		/****** gp_Trsf2d::SetTransformation ******/
		/****** md5 signature: 9db880503eb061f6e7c09a97e2f0ae2e ******/
		%feature("compactdefaultargs") SetTransformation;
		%feature("autodoc", "
Parameters
----------
theToSystem: gp_Ax2d

Return
-------
None

Description
-----------
Changes the transformation allowing passage from the basic coordinate system {P(0.,0.,0.), VX (1.,0.,0.), VY (0.,1.,0.)} to the local coordinate system defined with the Ax2d theToSystem.
") SetTransformation;
		void SetTransformation(const gp_Ax2d & theToSystem);

		/****** gp_Trsf2d::SetTranslation ******/
		/****** md5 signature: 194545521d4415e63a0535fe8e484f50 ******/
		%feature("compactdefaultargs") SetTranslation;
		%feature("autodoc", "
Parameters
----------
theV: gp_Vec2d

Return
-------
None

Description
-----------
Changes the transformation into a translation. theV is the vector of the translation.
") SetTranslation;
		void SetTranslation(const gp_Vec2d & theV);

		/****** gp_Trsf2d::SetTranslation ******/
		/****** md5 signature: 6bdd6819723c7c3ba451dc5ee82dbe23 ******/
		%feature("compactdefaultargs") SetTranslation;
		%feature("autodoc", "
Parameters
----------
theP1: gp_Pnt2d
theP2: gp_Pnt2d

Return
-------
None

Description
-----------
Makes the transformation into a translation from the point theP1 to the point theP2.
") SetTranslation;
		void SetTranslation(const gp_Pnt2d & theP1, const gp_Pnt2d & theP2);

		/****** gp_Trsf2d::SetTranslationPart ******/
		/****** md5 signature: 90998b7bd6da80ae9d5a13d99cde960c ******/
		%feature("compactdefaultargs") SetTranslationPart;
		%feature("autodoc", "
Parameters
----------
theV: gp_Vec2d

Return
-------
None

Description
-----------
Replaces the translation vector with theV.
") SetTranslationPart;
		void SetTranslationPart(const gp_Vec2d & theV);

		/****** gp_Trsf2d::SetValues ******/
		/****** md5 signature: 66ce5747f4438fab20e061725dfee894 ******/
		%feature("compactdefaultargs") SetValues;
		%feature("autodoc", "
Parameters
----------
a11: double
a12: double
a13: double
a21: double
a22: double
a23: double

Return
-------
None

Description
-----------
Sets the coefficients of the transformation. The transformation of the point x,y is the point x',y' with: @code x' = a11 x + a12 y + a13 y' = a21 x + a22 y + a23 @endcode The method Value(i,j) will return aij. Raises ConstructionError if the determinant of the aij is null. If the matrix as not a uniform scale it will be orthogonalized before future using.
") SetValues;
		void SetValues(const double a11, const double a12, const double a13, const double a21, const double a22, const double a23);

		/****** gp_Trsf2d::Transforms ******/
		/****** md5 signature: 80fbe9c12b5ec17bad393b0809ee6ad8 ******/
		%feature("compactdefaultargs") Transforms;
		%feature("autodoc", "
Parameters
----------

Return
-------
theX: double
theY: double

Description
-----------
No available documentation.
") Transforms;
		void Transforms(Standard_Real &OutValue, Standard_Real &OutValue);

		/****** gp_Trsf2d::Transforms ******/
		/****** md5 signature: 585e61bff177e6611e27373fcdaa6fc2 ******/
		%feature("compactdefaultargs") Transforms;
		%feature("autodoc", "
Parameters
----------
theCoord: gp_XY

Return
-------
None

Description
-----------
Transforms a doublet XY with a Trsf2d.
") Transforms;
		void Transforms(gp_XY & theCoord);

		/****** gp_Trsf2d::TranslationPart ******/
		/****** md5 signature: 3b9750d0fb3e28d1a84f17611142db69 ******/
		%feature("compactdefaultargs") TranslationPart;
		%feature("autodoc", "Return
-------
gp_XY

Description
-----------
Returns the translation part of the transformation's matrix.
") TranslationPart;
		const gp_XY TranslationPart();

		/****** gp_Trsf2d::Value ******/
		/****** md5 signature: 3f1341b0f5a1b548318b2db63518e612 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
theRow: int
theCol: int

Return
-------
double

Description
-----------
Returns the coefficients of the transformation's matrix. It is a 2 rows * 3 columns matrix. Raises OutOfRange if theRow < 1 or theRow > 2 or theCol < 1 or theCol > 3.
") Value;
		double Value(const int theRow, const int theCol);

		/****** gp_Trsf2d::VectorialPart ******/
		/****** md5 signature: 672fae35ed3393d8331524559101b431 ******/
		%feature("compactdefaultargs") VectorialPart;
		%feature("autodoc", "Return
-------
gp_Mat2d

Description
-----------
Returns the vectorial part of the transformation. It is a 2*2 matrix which includes the scale factor.
") VectorialPart;
		gp_Mat2d VectorialPart();

		/****** gp_Trsf2d::operator * ******/
		/****** md5 signature: 38afa6a03c04f954af48ca06f900c5d9 ******/
		%feature("compactdefaultargs") operator *;
		%feature("autodoc", "
Parameters
----------
theT: gp_Trsf2d

Return
-------
gp_Trsf2d

Description
-----------
No available documentation.
") operator *;
		gp_Trsf2d operator *(const gp_Trsf2d & theT);


%extend{
    void __imul_wrapper__(const gp_Trsf2d other) {
    *self *= other;
    }
}
%pythoncode {
def __imul__(self, right):
    self.__imul_wrapper__(right)
    return self
}
};



%extend gp_Trsf2d {
%pythoncode {
    def __getstate__(self):
        return self.DumpJson()
    }
};

%extend gp_Trsf2d {
%pythoncode {
    def __setstate__(self, state):
        inst = gp_Trsf2d()
        if inst.InitFromJson(state):
            self.this = inst.this
        else:
            raise IOError('Failed to set state of gp_Trsf2d')
    }
};
%extend gp_Trsf2d {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************
* class gp_Vec *
***************/
class gp_Vec {
	public:
		/****** gp_Vec::gp_Vec ******/
		/****** md5 signature: d832e6828ac83cca73111a55ca3eae0d ******/
		%feature("compactdefaultargs") gp_Vec;
		%feature("autodoc", "Return
-------
None

Description
-----------
Creates a zero vector.
") gp_Vec;
		 gp_Vec();

		/****** gp_Vec::gp_Vec ******/
		/****** md5 signature: a64b9c59c5f78c13793e2843e5cd7f2c ******/
		%feature("compactdefaultargs") gp_Vec;
		%feature("autodoc", "
Parameters
----------
theV: gp_Dir

Return
-------
None

Description
-----------
Creates a unitary vector from a direction theV.
") gp_Vec;
		 gp_Vec(const gp_Dir & theV);

		/****** gp_Vec::gp_Vec ******/
		/****** md5 signature: b111c00107045a321111bc9cf81d5f9e ******/
		%feature("compactdefaultargs") gp_Vec;
		%feature("autodoc", "
Parameters
----------
theCoord: gp_XYZ

Return
-------
None

Description
-----------
Creates a vector with a triplet of coordinates.
") gp_Vec;
		 gp_Vec(const gp_XYZ & theCoord);

		/****** gp_Vec::gp_Vec ******/
		/****** md5 signature: c6d654f1fda84f6718a753e69425bb11 ******/
		%feature("compactdefaultargs") gp_Vec;
		%feature("autodoc", "
Parameters
----------
theXv: double
theYv: double
theZv: double

Return
-------
None

Description
-----------
Creates a point with its three cartesian coordinates.
") gp_Vec;
		 gp_Vec(const double theXv, const double theYv, const double theZv);

		/****** gp_Vec::gp_Vec ******/
		/****** md5 signature: b17107f2d306981583cfe7e5d98b2dc8 ******/
		%feature("compactdefaultargs") gp_Vec;
		%feature("autodoc", "
Parameters
----------
theP1: gp_Pnt
theP2: gp_Pnt

Return
-------
None

Description
-----------
Creates a vector from two points. The length of the vector is the distance between theP1 and theP2.
") gp_Vec;
		 gp_Vec(const gp_Pnt & theP1, const gp_Pnt & theP2);

		/****** gp_Vec::Add ******/
		/****** md5 signature: 2d4416691a4b9d2cc8e99341d8793603 ******/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
theOther: gp_Vec

Return
-------
None

Description
-----------
Adds two vectors.
") Add;
		void Add(const gp_Vec & theOther);

		/****** gp_Vec::Added ******/
		/****** md5 signature: 64981f04272ffc7fb310a4ab0635fb69 ******/
		%feature("compactdefaultargs") Added;
		%feature("autodoc", "
Parameters
----------
theOther: gp_Vec

Return
-------
gp_Vec

Description
-----------
Adds two vectors.
") Added;
		gp_Vec Added(const gp_Vec & theOther);

		/****** gp_Vec::Angle ******/
		/****** md5 signature: 54a5528cc72a15a6417687a07a3bf16c ******/
		%feature("compactdefaultargs") Angle;
		%feature("autodoc", "
Parameters
----------
theOther: gp_Vec

Return
-------
double

Description
-----------
Computes the angular value between <self> and <theOther> Returns the angle value between 0 and PI in radian. Raises VectorWithNullMagnitude if <self>.Magnitude() <= Resolution from gp or theOther.Magnitude() <= Resolution because the angular value is indefinite if one of the vectors has a null magnitude.
") Angle;
		double Angle(const gp_Vec & theOther);

		/****** gp_Vec::AngleWithRef ******/
		/****** md5 signature: 4e8733010f4db33ded5634d5956c3156 ******/
		%feature("compactdefaultargs") AngleWithRef;
		%feature("autodoc", "
Parameters
----------
theOther: gp_Vec
theVRef: gp_Vec

Return
-------
double

Description
-----------
Computes the angle, in radians, between this vector and vector theOther. The result is a value between -Pi and Pi. For this, theVRef defines the positive sense of rotation: the angular value is positive, if the cross product this ^ theOther has the same orientation as theVRef relative to the plane defined by the vectors this and theOther. Otherwise, the angular value is negative. Exceptions gp_VectorWithNullMagnitude if the magnitude of this vector, the vector theOther, or the vector theVRef is less than or equal to gp::Resolution(). Standard_DomainError if this vector, the vector theOther, and the vector theVRef are coplanar, unless this vector and the vector theOther are parallel.
") AngleWithRef;
		double AngleWithRef(const gp_Vec & theOther, const gp_Vec & theVRef);

		/****** gp_Vec::Coord ******/
		/****** md5 signature: 5ab919f0e89833f70cf3f70d2ba0fddc ******/
		%feature("compactdefaultargs") Coord;
		%feature("autodoc", "
Parameters
----------
theIndex: int

Return
-------
double

Description
-----------
Returns the coordinate of range theIndex: theIndex = 1 => X is returned theIndex = 2 => Y is returned theIndex = 3 => Z is returned Raised if theIndex != {1, 2, 3}.
") Coord;
		double Coord(const int theIndex);

		/****** gp_Vec::Coord ******/
		/****** md5 signature: 0b7d1d168b363943a7967ea736acb684 ******/
		%feature("compactdefaultargs") Coord;
		%feature("autodoc", "
Parameters
----------

Return
-------
theXv: double
theYv: double
theZv: double

Description
-----------
For this vector returns its three coordinates theXv, theYv, and theZv inline.
") Coord;
		void Coord(Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** gp_Vec::Cross ******/
		/****** md5 signature: fa6d4ae6352bf67166cda85a32fd3083 ******/
		%feature("compactdefaultargs") Cross;
		%feature("autodoc", "
Parameters
----------
theRight: gp_Vec

Return
-------
None

Description
-----------
computes the cross product between two vectors.
") Cross;
		void Cross(const gp_Vec & theRight);

		/****** gp_Vec::CrossCross ******/
		/****** md5 signature: d6f62d79efa899d9472462c4c40b5510 ******/
		%feature("compactdefaultargs") CrossCross;
		%feature("autodoc", "
Parameters
----------
theV1: gp_Vec
theV2: gp_Vec

Return
-------
None

Description
-----------
Computes the triple vector product. <self> ^= (theV1 ^ theV2).
") CrossCross;
		void CrossCross(const gp_Vec & theV1, const gp_Vec & theV2);

		/****** gp_Vec::CrossCrossed ******/
		/****** md5 signature: d93899a1911457ce6a0feada95123ad1 ******/
		%feature("compactdefaultargs") CrossCrossed;
		%feature("autodoc", "
Parameters
----------
theV1: gp_Vec
theV2: gp_Vec

Return
-------
gp_Vec

Description
-----------
Computes the triple vector product. <self> ^ (theV1 ^ theV2).
") CrossCrossed;
		gp_Vec CrossCrossed(const gp_Vec & theV1, const gp_Vec & theV2);

		/****** gp_Vec::CrossMagnitude ******/
		/****** md5 signature: 30f81152a288dba8af3540daf014229a ******/
		%feature("compactdefaultargs") CrossMagnitude;
		%feature("autodoc", "
Parameters
----------
theRight: gp_Vec

Return
-------
double

Description
-----------
Computes the magnitude of the cross product between <self> and theRight. Returns || <self> ^ theRight ||.
") CrossMagnitude;
		double CrossMagnitude(const gp_Vec & theRight);

		/****** gp_Vec::CrossSquareMagnitude ******/
		/****** md5 signature: 9ab5335a138a155472d057d7f7f4c6c4 ******/
		%feature("compactdefaultargs") CrossSquareMagnitude;
		%feature("autodoc", "
Parameters
----------
theRight: gp_Vec

Return
-------
double

Description
-----------
Computes the square magnitude of the cross product between <self> and theRight. Returns || <self> ^ theRight ||**2.
") CrossSquareMagnitude;
		double CrossSquareMagnitude(const gp_Vec & theRight);

		/****** gp_Vec::Crossed ******/
		/****** md5 signature: aa401932fe4b4d33b04b850119b97f91 ******/
		%feature("compactdefaultargs") Crossed;
		%feature("autodoc", "
Parameters
----------
theRight: gp_Vec

Return
-------
gp_Vec

Description
-----------
computes the cross product between two vectors.
") Crossed;
		gp_Vec Crossed(const gp_Vec & theRight);

		/****** gp_Vec::Divide ******/
		/****** md5 signature: b580a87aac9eb84eb9b5cb607f38e3d1 ******/
		%feature("compactdefaultargs") Divide;
		%feature("autodoc", "
Parameters
----------
theScalar: double

Return
-------
None

Description
-----------
Divides a vector by a scalar.
") Divide;
		void Divide(const double theScalar);

		/****** gp_Vec::Divided ******/
		/****** md5 signature: a141e2ca3de6e6dd70dc478bc411255d ******/
		%feature("compactdefaultargs") Divided;
		%feature("autodoc", "
Parameters
----------
theScalar: double

Return
-------
gp_Vec

Description
-----------
Divides a vector by a scalar.
") Divided;
		gp_Vec Divided(const double theScalar);

		/****** gp_Vec::Dot ******/
		/****** md5 signature: 7e3f3861945b2aeb617c4a13dee54155 ******/
		%feature("compactdefaultargs") Dot;
		%feature("autodoc", "
Parameters
----------
theOther: gp_Vec

Return
-------
double

Description
-----------
computes the scalar product.
") Dot;
		double Dot(const gp_Vec & theOther);

		/****** gp_Vec::DotCross ******/
		/****** md5 signature: 5f9e837de66ae5ad4430740d635bf5d8 ******/
		%feature("compactdefaultargs") DotCross;
		%feature("autodoc", "
Parameters
----------
theV1: gp_Vec
theV2: gp_Vec

Return
-------
double

Description
-----------
Computes the triple scalar product <self> * (theV1 ^ theV2).
") DotCross;
		double DotCross(const gp_Vec & theV1, const gp_Vec & theV2);


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
		/****** gp_Vec::IsEqual ******/
		/****** md5 signature: db5faac8fcbb99c776f4bbf204766d97 ******/
		%feature("compactdefaultargs") IsEqual;
		%feature("autodoc", "
Parameters
----------
theOther: gp_Vec
theLinearTolerance: double
theAngularTolerance: double

Return
-------
bool

Description
-----------
Returns True if the two vectors have the same magnitude value and the same direction. The precision values are theLinearTolerance for the magnitude and theAngularTolerance for the direction.
") IsEqual;
		bool IsEqual(const gp_Vec & theOther, const double theLinearTolerance, const double theAngularTolerance);

		/****** gp_Vec::IsNormal ******/
		/****** md5 signature: 90974773284a05ac6eee34b018e69710 ******/
		%feature("compactdefaultargs") IsNormal;
		%feature("autodoc", "
Parameters
----------
theOther: gp_Vec
theAngularTolerance: double

Return
-------
bool

Description
-----------
Returns True if abs(<self>.Angle(theOther) - PI/2.) <= theAngularTolerance Raises VectorWithNullMagnitude if <self>.Magnitude() <= Resolution or theOther.Magnitude() <= Resolution from gp.
") IsNormal;
		bool IsNormal(const gp_Vec & theOther, const double theAngularTolerance);

		/****** gp_Vec::IsOpposite ******/
		/****** md5 signature: cc2390768741338de1d42891b0f76b58 ******/
		%feature("compactdefaultargs") IsOpposite;
		%feature("autodoc", "
Parameters
----------
theOther: gp_Vec
theAngularTolerance: double

Return
-------
bool

Description
-----------
Returns True if PI - <self>.Angle(theOther) <= theAngularTolerance Raises VectorWithNullMagnitude if <self>.Magnitude() <= Resolution or Other.Magnitude() <= Resolution from gp.
") IsOpposite;
		bool IsOpposite(const gp_Vec & theOther, const double theAngularTolerance);

		/****** gp_Vec::IsParallel ******/
		/****** md5 signature: c78d8147ebb8ebd49f1901295cb9e761 ******/
		%feature("compactdefaultargs") IsParallel;
		%feature("autodoc", "
Parameters
----------
theOther: gp_Vec
theAngularTolerance: double

Return
-------
bool

Description
-----------
Returns True if Angle(<self>, theOther) <= theAngularTolerance or PI - Angle(<self>, theOther) <= theAngularTolerance This definition means that two parallel vectors cannot define a plane but two vectors with opposite directions are considered as parallel. Raises VectorWithNullMagnitude if <self>.Magnitude() <= Resolution or Other.Magnitude() <= Resolution from gp.
") IsParallel;
		bool IsParallel(const gp_Vec & theOther, const double theAngularTolerance);

		/****** gp_Vec::Magnitude ******/
		/****** md5 signature: 6573fd4ffa13d53ed0c1342b544939e2 ******/
		%feature("compactdefaultargs") Magnitude;
		%feature("autodoc", "Return
-------
double

Description
-----------
Computes the magnitude of this vector.
") Magnitude;
		double Magnitude();

		/****** gp_Vec::Mirror ******/
		/****** md5 signature: 01b4d52496170f0a078f00d234cb74a3 ******/
		%feature("compactdefaultargs") Mirror;
		%feature("autodoc", "
Parameters
----------
theV: gp_Vec

Return
-------
None

Description
-----------
No available documentation.
") Mirror;
		void Mirror(const gp_Vec & theV);

		/****** gp_Vec::Mirror ******/
		/****** md5 signature: f508bc9f1879a959242732c259593a0a ******/
		%feature("compactdefaultargs") Mirror;
		%feature("autodoc", "
Parameters
----------
theA1: gp_Ax1

Return
-------
None

Description
-----------
No available documentation.
") Mirror;
		void Mirror(const gp_Ax1 & theA1);

		/****** gp_Vec::Mirror ******/
		/****** md5 signature: ba516d9e4a2b6af0ed16d37de915dd83 ******/
		%feature("compactdefaultargs") Mirror;
		%feature("autodoc", "
Parameters
----------
theA2: gp_Ax2

Return
-------
None

Description
-----------
No available documentation.
") Mirror;
		void Mirror(const gp_Ax2 & theA2);

		/****** gp_Vec::Mirrored ******/
		/****** md5 signature: 029f9f9824127b5ab3604348465892dc ******/
		%feature("compactdefaultargs") Mirrored;
		%feature("autodoc", "
Parameters
----------
theV: gp_Vec

Return
-------
gp_Vec

Description
-----------
Performs the symmetrical transformation of a vector with respect to the vector theV which is the center of the symmetry.
") Mirrored;
		gp_Vec Mirrored(const gp_Vec & theV);

		/****** gp_Vec::Mirrored ******/
		/****** md5 signature: 5d013623421ed1e8c7ebc5f57e3806a6 ******/
		%feature("compactdefaultargs") Mirrored;
		%feature("autodoc", "
Parameters
----------
theA1: gp_Ax1

Return
-------
gp_Vec

Description
-----------
Performs the symmetrical transformation of a vector with respect to an axis placement which is the axis of the symmetry.
") Mirrored;
		gp_Vec Mirrored(const gp_Ax1 & theA1);

		/****** gp_Vec::Mirrored ******/
		/****** md5 signature: 86c8c38dd6825d013597536c31d21094 ******/
		%feature("compactdefaultargs") Mirrored;
		%feature("autodoc", "
Parameters
----------
theA2: gp_Ax2

Return
-------
gp_Vec

Description
-----------
Performs the symmetrical transformation of a vector with respect to a plane. The axis placement theA2 locates the plane of the symmetry: (Location, XDirection, YDirection).
") Mirrored;
		gp_Vec Mirrored(const gp_Ax2 & theA2);

		/****** gp_Vec::Multiplied ******/
		/****** md5 signature: c263c3f278226e1dcae8abd566778b76 ******/
		%feature("compactdefaultargs") Multiplied;
		%feature("autodoc", "
Parameters
----------
theScalar: double

Return
-------
gp_Vec

Description
-----------
Multiplies a vector by a scalar.
") Multiplied;
		gp_Vec Multiplied(const double theScalar);

		/****** gp_Vec::Multiply ******/
		/****** md5 signature: 588810bf411a7cd99a9839f379789b8e ******/
		%feature("compactdefaultargs") Multiply;
		%feature("autodoc", "
Parameters
----------
theScalar: double

Return
-------
None

Description
-----------
Multiplies a vector by a scalar.
") Multiply;
		void Multiply(const double theScalar);

		/****** gp_Vec::Normalize ******/
		/****** md5 signature: df5d0be92b25875af291db140fcd7cf4 ******/
		%feature("compactdefaultargs") Normalize;
		%feature("autodoc", "Return
-------
None

Description
-----------
normalizes a vector Raises an exception if the magnitude of the vector is lower or equal to Resolution from gp.
") Normalize;
		void Normalize();

		/****** gp_Vec::Normalized ******/
		/****** md5 signature: aeef953109572684206e8085ce2bb249 ******/
		%feature("compactdefaultargs") Normalized;
		%feature("autodoc", "Return
-------
gp_Vec

Description
-----------
normalizes a vector Raises an exception if the magnitude of the vector is lower or equal to Resolution from gp.
") Normalized;
		gp_Vec Normalized();

		/****** gp_Vec::Reverse ******/
		/****** md5 signature: 229f8663d04c43240c56ed238a384b26 ******/
		%feature("compactdefaultargs") Reverse;
		%feature("autodoc", "Return
-------
None

Description
-----------
Reverses the direction of a vector.
") Reverse;
		void Reverse();

		/****** gp_Vec::Reversed ******/
		/****** md5 signature: 86d60aa6b0a8d134706393b98dbd73ba ******/
		%feature("compactdefaultargs") Reversed;
		%feature("autodoc", "Return
-------
gp_Vec

Description
-----------
Reverses the direction of a vector.
") Reversed;
		gp_Vec Reversed();

		/****** gp_Vec::Rotate ******/
		/****** md5 signature: 1ad1f6be15e850ce247e9683ec6abb78 ******/
		%feature("compactdefaultargs") Rotate;
		%feature("autodoc", "
Parameters
----------
theA1: gp_Ax1
theAng: double

Return
-------
None

Description
-----------
No available documentation.
") Rotate;
		void Rotate(const gp_Ax1 & theA1, const double theAng);

		/****** gp_Vec::Rotated ******/
		/****** md5 signature: 7e7fd30e86c38e92891915ba74fc0485 ******/
		%feature("compactdefaultargs") Rotated;
		%feature("autodoc", "
Parameters
----------
theA1: gp_Ax1
theAng: double

Return
-------
gp_Vec

Description
-----------
Rotates a vector. theA1 is the axis of the rotation. theAng is the angular value of the rotation in radians.
") Rotated;
		gp_Vec Rotated(const gp_Ax1 & theA1, const double theAng);

		/****** gp_Vec::Scale ******/
		/****** md5 signature: a23897f07db28c35af9680e130534e12 ******/
		%feature("compactdefaultargs") Scale;
		%feature("autodoc", "
Parameters
----------
theS: double

Return
-------
None

Description
-----------
No available documentation.
") Scale;
		void Scale(const double theS);

		/****** gp_Vec::Scaled ******/
		/****** md5 signature: f7b36412aae5c2ebe858da09028e81ce ******/
		%feature("compactdefaultargs") Scaled;
		%feature("autodoc", "
Parameters
----------
theS: double

Return
-------
gp_Vec

Description
-----------
Scales a vector. theS is the scaling value.
") Scaled;
		gp_Vec Scaled(const double theS);

		/****** gp_Vec::SetCoord ******/
		/****** md5 signature: 2133811cb7e2b132083ab2453e33c15c ******/
		%feature("compactdefaultargs") SetCoord;
		%feature("autodoc", "
Parameters
----------
theIndex: int
theXi: double

Return
-------
None

Description
-----------
Changes the coordinate of range theIndex theIndex = 1 => X is modified theIndex = 2 => Y is modified theIndex = 3 => Z is modified Raised if theIndex != {1, 2, 3}.
") SetCoord;
		void SetCoord(const int theIndex, const double theXi);

		/****** gp_Vec::SetCoord ******/
		/****** md5 signature: 1a1871d4b0d480a9ee7ed399232aa2ab ******/
		%feature("compactdefaultargs") SetCoord;
		%feature("autodoc", "
Parameters
----------
theXv: double
theYv: double
theZv: double

Return
-------
None

Description
-----------
For this vector, assigns - the values theXv, theYv and theZv to its three coordinates.
") SetCoord;
		void SetCoord(const double theXv, const double theYv, const double theZv);

		/****** gp_Vec::SetLinearForm ******/
		/****** md5 signature: ecc09c4a1fb288d96f41cce6e3ef8a84 ******/
		%feature("compactdefaultargs") SetLinearForm;
		%feature("autodoc", "
Parameters
----------
theA1: double
theV1: gp_Vec
theA2: double
theV2: gp_Vec
theA3: double
theV3: gp_Vec
theV4: gp_Vec

Return
-------
None

Description
-----------
<self> is set to the following linear form: theA1 * theV1 + theA2 * theV2 + theA3 * theV3 + theV4.
") SetLinearForm;
		void SetLinearForm(const double theA1, const gp_Vec & theV1, const double theA2, const gp_Vec & theV2, const double theA3, const gp_Vec & theV3, const gp_Vec & theV4);

		/****** gp_Vec::SetLinearForm ******/
		/****** md5 signature: 02c82d2298c40c000fe91479431cf468 ******/
		%feature("compactdefaultargs") SetLinearForm;
		%feature("autodoc", "
Parameters
----------
theA1: double
theV1: gp_Vec
theA2: double
theV2: gp_Vec
theA3: double
theV3: gp_Vec

Return
-------
None

Description
-----------
<self> is set to the following linear form: theA1 * theV1 + theA2 * theV2 + theA3 * theV3.
") SetLinearForm;
		void SetLinearForm(const double theA1, const gp_Vec & theV1, const double theA2, const gp_Vec & theV2, const double theA3, const gp_Vec & theV3);

		/****** gp_Vec::SetLinearForm ******/
		/****** md5 signature: 9d4ab3308f95a4a13ea46c6e0365c649 ******/
		%feature("compactdefaultargs") SetLinearForm;
		%feature("autodoc", "
Parameters
----------
theA1: double
theV1: gp_Vec
theA2: double
theV2: gp_Vec
theV3: gp_Vec

Return
-------
None

Description
-----------
<self> is set to the following linear form: theA1 * theV1 + theA2 * theV2 + theV3.
") SetLinearForm;
		void SetLinearForm(const double theA1, const gp_Vec & theV1, const double theA2, const gp_Vec & theV2, const gp_Vec & theV3);

		/****** gp_Vec::SetLinearForm ******/
		/****** md5 signature: 6998037a1176e04b01af25354d108d50 ******/
		%feature("compactdefaultargs") SetLinearForm;
		%feature("autodoc", "
Parameters
----------
theA1: double
theV1: gp_Vec
theA2: double
theV2: gp_Vec

Return
-------
None

Description
-----------
<self> is set to the following linear form: theA1 * theV1 + theA2 * theV2.
") SetLinearForm;
		void SetLinearForm(const double theA1, const gp_Vec & theV1, const double theA2, const gp_Vec & theV2);

		/****** gp_Vec::SetLinearForm ******/
		/****** md5 signature: 726280a6babaa53731d4d3f8c8fca254 ******/
		%feature("compactdefaultargs") SetLinearForm;
		%feature("autodoc", "
Parameters
----------
theA1: double
theV1: gp_Vec
theV2: gp_Vec

Return
-------
None

Description
-----------
<self> is set to the following linear form: theA1 * theV1 + theV2.
") SetLinearForm;
		void SetLinearForm(const double theA1, const gp_Vec & theV1, const gp_Vec & theV2);

		/****** gp_Vec::SetLinearForm ******/
		/****** md5 signature: fda5f55ea51d4bb56d35ce4cd7f645bf ******/
		%feature("compactdefaultargs") SetLinearForm;
		%feature("autodoc", "
Parameters
----------
theV1: gp_Vec
theV2: gp_Vec

Return
-------
None

Description
-----------
<self> is set to the following linear form: theV1 + theV2.
") SetLinearForm;
		void SetLinearForm(const gp_Vec & theV1, const gp_Vec & theV2);

		/****** gp_Vec::SetX ******/
		/****** md5 signature: bbe6dad756ab4b51b477b97b5d2997db ******/
		%feature("compactdefaultargs") SetX;
		%feature("autodoc", "
Parameters
----------
theX: double

Return
-------
None

Description
-----------
Assigns the given value to the X coordinate of this vector.
") SetX;
		void SetX(const double theX);

		/****** gp_Vec::SetXYZ ******/
		/****** md5 signature: 758229ef2bc42f66d281f37ce53c4741 ******/
		%feature("compactdefaultargs") SetXYZ;
		%feature("autodoc", "
Parameters
----------
theCoord: gp_XYZ

Return
-------
None

Description
-----------
Assigns the three coordinates of theCoord to this vector.
") SetXYZ;
		void SetXYZ(const gp_XYZ & theCoord);

		/****** gp_Vec::SetY ******/
		/****** md5 signature: 84504129c782de522a0d69ceb36f6af7 ******/
		%feature("compactdefaultargs") SetY;
		%feature("autodoc", "
Parameters
----------
theY: double

Return
-------
None

Description
-----------
Assigns the given value to the X coordinate of this vector.
") SetY;
		void SetY(const double theY);

		/****** gp_Vec::SetZ ******/
		/****** md5 signature: f5e8a0ff6e3eaaf9fdb056b8c6159170 ******/
		%feature("compactdefaultargs") SetZ;
		%feature("autodoc", "
Parameters
----------
theZ: double

Return
-------
None

Description
-----------
Assigns the given value to the X coordinate of this vector.
") SetZ;
		void SetZ(const double theZ);

		/****** gp_Vec::SquareMagnitude ******/
		/****** md5 signature: 3bda9104e3d2f4ebc15c51031eff11e2 ******/
		%feature("compactdefaultargs") SquareMagnitude;
		%feature("autodoc", "Return
-------
double

Description
-----------
Computes the square magnitude of this vector.
") SquareMagnitude;
		double SquareMagnitude();

		/****** gp_Vec::Subtract ******/
		/****** md5 signature: 11c742761d6f143d16dd31fc00cd7f4e ******/
		%feature("compactdefaultargs") Subtract;
		%feature("autodoc", "
Parameters
----------
theRight: gp_Vec

Return
-------
None

Description
-----------
Subtracts two vectors.
") Subtract;
		void Subtract(const gp_Vec & theRight);

		/****** gp_Vec::Subtracted ******/
		/****** md5 signature: 1024304e46721aa3b7eb1a73e06f80df ******/
		%feature("compactdefaultargs") Subtracted;
		%feature("autodoc", "
Parameters
----------
theRight: gp_Vec

Return
-------
gp_Vec

Description
-----------
Subtracts two vectors.
") Subtracted;
		gp_Vec Subtracted(const gp_Vec & theRight);

		/****** gp_Vec::Transform ******/
		/****** md5 signature: 0737a7286be728220e1a55ba0d6eafc3 ******/
		%feature("compactdefaultargs") Transform;
		%feature("autodoc", "
Parameters
----------
theT: gp_Trsf

Return
-------
None

Description
-----------
Transforms a vector with the transformation theT.
") Transform;
		void Transform(const gp_Trsf & theT);

		/****** gp_Vec::Transformed ******/
		/****** md5 signature: 48cdf716cf3e31fccc783cccf9905ef6 ******/
		%feature("compactdefaultargs") Transformed;
		%feature("autodoc", "
Parameters
----------
theT: gp_Trsf

Return
-------
gp_Vec

Description
-----------
Transforms a vector with the transformation theT.
") Transformed;
		gp_Vec Transformed(const gp_Trsf & theT);

		/****** gp_Vec::X ******/
		/****** md5 signature: c418db3e494968281737cca9c90ecbdf ******/
		%feature("compactdefaultargs") X;
		%feature("autodoc", "Return
-------
double

Description
-----------
For this vector, returns its X coordinate.
") X;
		double X();

		/****** gp_Vec::XYZ ******/
		/****** md5 signature: db771f2137a73770f8fa68788fc317cc ******/
		%feature("compactdefaultargs") XYZ;
		%feature("autodoc", "Return
-------
gp_XYZ

Description
-----------
For this vector, returns - its three coordinates as a number triple.
") XYZ;
		const gp_XYZ XYZ();

		/****** gp_Vec::Y ******/
		/****** md5 signature: 25eefb608c358bc135b3158209ee8901 ******/
		%feature("compactdefaultargs") Y;
		%feature("autodoc", "Return
-------
double

Description
-----------
For this vector, returns its Y coordinate.
") Y;
		double Y();

		/****** gp_Vec::Z ******/
		/****** md5 signature: 078eb43f219d180be16ce27c9708e49a ******/
		%feature("compactdefaultargs") Z;
		%feature("autodoc", "Return
-------
double

Description
-----------
For this vector, returns its Z coordinate.
") Z;
		double Z();

		/****** gp_Vec::operator * ******/
		/****** md5 signature: e3eafe18dc3f04e12bd1c27773045527 ******/
		%feature("compactdefaultargs") operator *;
		%feature("autodoc", "
Parameters
----------
theScalar: double

Return
-------
gp_Vec

Description
-----------
No available documentation.
") operator *;
		gp_Vec operator *(const double theScalar);

		/****** gp_Vec::operator * ******/
		/****** md5 signature: 041d79fe733ad68db285d4e17f8cb7a9 ******/
		%feature("compactdefaultargs") operator *;
		%feature("autodoc", "
Parameters
----------
theOther: gp_Vec

Return
-------
double

Description
-----------
No available documentation.
") operator *;
		double operator *(const gp_Vec & theOther);


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
		/****** gp_Vec::operator + ******/
		/****** md5 signature: 09075225a9e38c213d6382d686a11a9a ******/
		%feature("compactdefaultargs") operator +;
		%feature("autodoc", "
Parameters
----------
theOther: gp_Vec

Return
-------
gp_Vec

Description
-----------
No available documentation.
") operator +;
		gp_Vec operator +(const gp_Vec & theOther);


%extend{
    void __iadd_wrapper__(const gp_Vec other) {
    *self += other;
    }
}
%pythoncode {
def __iadd__(self, right):
    self.__iadd_wrapper__(right)
    return self
}
		/****** gp_Vec::operator - ******/
		/****** md5 signature: f8d945a986d13fe0be74a997166e4bae ******/
		%feature("compactdefaultargs") operator -;
		%feature("autodoc", "
Parameters
----------
theRight: gp_Vec

Return
-------
gp_Vec

Description
-----------
No available documentation.
") operator -;
		gp_Vec operator -(const gp_Vec & theRight);

		/****** gp_Vec::operator - ******/
		/****** md5 signature: 935010a5f6f489138f517535953e3839 ******/
		%feature("compactdefaultargs") operator -;
		%feature("autodoc", "Return
-------
gp_Vec

Description
-----------
No available documentation.
") operator -;
		gp_Vec operator -();


%extend{
    void __isub_wrapper__(const gp_Vec other) {
    *self -= other;
    }
}
%pythoncode {
def __isub__(self, right):
    self.__isub_wrapper__(right)
    return self
}
		/****** gp_Vec::operator / ******/
		/****** md5 signature: 28636ab8c693105054734db39aae255f ******/
		%feature("compactdefaultargs") operator /;
		%feature("autodoc", "
Parameters
----------
theScalar: double

Return
-------
gp_Vec

Description
-----------
No available documentation.
") operator /;
		gp_Vec operator /(const double theScalar);


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



%extend gp_Vec {
%pythoncode {
    def __getstate__(self):
        return self.DumpJson()
    }
};

%extend gp_Vec {
%pythoncode {
    def __setstate__(self, state):
        inst = gp_Vec()
        if inst.InitFromJson(state):
            self.this = inst.this
        else:
            raise IOError('Failed to set state of gp_Vec')
    }
};
%extend gp_Vec {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************
* class gp_Vec2d *
*****************/
class gp_Vec2d {
	public:
		/****** gp_Vec2d::gp_Vec2d ******/
		/****** md5 signature: 8a07c0512155ba5094858e0d13a04a8d ******/
		%feature("compactdefaultargs") gp_Vec2d;
		%feature("autodoc", "Return
-------
None

Description
-----------
Creates a zero vector.
") gp_Vec2d;
		 gp_Vec2d();

		/****** gp_Vec2d::gp_Vec2d ******/
		/****** md5 signature: 52cab9c5983adbf5baeafb01a20d51e0 ******/
		%feature("compactdefaultargs") gp_Vec2d;
		%feature("autodoc", "
Parameters
----------
theV: gp_Dir2d

Return
-------
None

Description
-----------
Creates a unitary vector from a direction theV.
") gp_Vec2d;
		 gp_Vec2d(const gp_Dir2d & theV);

		/****** gp_Vec2d::gp_Vec2d ******/
		/****** md5 signature: f0e254e74761b28eba6883742666b168 ******/
		%feature("compactdefaultargs") gp_Vec2d;
		%feature("autodoc", "
Parameters
----------
theCoord: gp_XY

Return
-------
None

Description
-----------
Creates a vector with a doublet of coordinates.
") gp_Vec2d;
		 gp_Vec2d(const gp_XY & theCoord);

		/****** gp_Vec2d::gp_Vec2d ******/
		/****** md5 signature: 3d66395be13948958202a4532e541ec6 ******/
		%feature("compactdefaultargs") gp_Vec2d;
		%feature("autodoc", "
Parameters
----------
theXv: double
theYv: double

Return
-------
None

Description
-----------
Creates a point with its two Cartesian coordinates.
") gp_Vec2d;
		 gp_Vec2d(const double theXv, const double theYv);

		/****** gp_Vec2d::gp_Vec2d ******/
		/****** md5 signature: 64049acb933d736b314bbfd790338304 ******/
		%feature("compactdefaultargs") gp_Vec2d;
		%feature("autodoc", "
Parameters
----------
theP1: gp_Pnt2d
theP2: gp_Pnt2d

Return
-------
None

Description
-----------
Creates a vector from two points. The length of the vector is the distance between theP1 and theP2.
") gp_Vec2d;
		 gp_Vec2d(const gp_Pnt2d & theP1, const gp_Pnt2d & theP2);

		/****** gp_Vec2d::Add ******/
		/****** md5 signature: c2895febe7400b6786be774a8ff75886 ******/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
theOther: gp_Vec2d

Return
-------
None

Description
-----------
No available documentation.
") Add;
		void Add(const gp_Vec2d & theOther);

		/****** gp_Vec2d::Added ******/
		/****** md5 signature: 432b9c6e72af81b9a938507d15331383 ******/
		%feature("compactdefaultargs") Added;
		%feature("autodoc", "
Parameters
----------
theOther: gp_Vec2d

Return
-------
gp_Vec2d

Description
-----------
Adds two vectors.
") Added;
		gp_Vec2d Added(const gp_Vec2d & theOther);

		/****** gp_Vec2d::Angle ******/
		/****** md5 signature: 67593458b4842e63c1d758dda758441f ******/
		%feature("compactdefaultargs") Angle;
		%feature("autodoc", "
Parameters
----------
theOther: gp_Vec2d

Return
-------
double

Description
-----------
Computes the angular value between <self> and <theOther> returns the angle value between -PI and PI in radian. The orientation is from <self> to theOther. The positive sense is the trigonometric sense. Raises VectorWithNullMagnitude if <self>.Magnitude() <= Resolution from gp or theOther.Magnitude() <= Resolution because the angular value is indefinite if one of the vectors has a null magnitude.
") Angle;
		double Angle(const gp_Vec2d & theOther);

		/****** gp_Vec2d::Coord ******/
		/****** md5 signature: 5ab919f0e89833f70cf3f70d2ba0fddc ******/
		%feature("compactdefaultargs") Coord;
		%feature("autodoc", "
Parameters
----------
theIndex: int

Return
-------
double

Description
-----------
Returns the coordinate of range theIndex: theIndex = 1 => X is returned theIndex = 2 => Y is returned Raised if theIndex != {1, 2}.
") Coord;
		double Coord(const int theIndex);

		/****** gp_Vec2d::Coord ******/
		/****** md5 signature: c4f8752985ac7df5dcf67b5ae0e60b81 ******/
		%feature("compactdefaultargs") Coord;
		%feature("autodoc", "
Parameters
----------

Return
-------
theXv: double
theYv: double

Description
-----------
For this vector, returns its two coordinates theXv and theYv.
") Coord;
		void Coord(Standard_Real &OutValue, Standard_Real &OutValue);

		/****** gp_Vec2d::CrossMagnitude ******/
		/****** md5 signature: e05d925aac16d71971555bbe30aabc64 ******/
		%feature("compactdefaultargs") CrossMagnitude;
		%feature("autodoc", "
Parameters
----------
theRight: gp_Vec2d

Return
-------
double

Description
-----------
Computes the magnitude of the cross product between <self> and theRight. Returns || <self> ^ theRight ||.
") CrossMagnitude;
		double CrossMagnitude(const gp_Vec2d & theRight);

		/****** gp_Vec2d::CrossSquareMagnitude ******/
		/****** md5 signature: b5d898ff41384ae82f967bbfca04c6a0 ******/
		%feature("compactdefaultargs") CrossSquareMagnitude;
		%feature("autodoc", "
Parameters
----------
theRight: gp_Vec2d

Return
-------
double

Description
-----------
Computes the square magnitude of the cross product between <self> and theRight. Returns || <self> ^ theRight ||**2.
") CrossSquareMagnitude;
		double CrossSquareMagnitude(const gp_Vec2d & theRight);

		/****** gp_Vec2d::Crossed ******/
		/****** md5 signature: f3fe817014247c3b036de444b116dee1 ******/
		%feature("compactdefaultargs") Crossed;
		%feature("autodoc", "
Parameters
----------
theRight: gp_Vec2d

Return
-------
double

Description
-----------
Computes the crossing product between two vectors.
") Crossed;
		double Crossed(const gp_Vec2d & theRight);

		/****** gp_Vec2d::Divide ******/
		/****** md5 signature: 23e15d5d94e24f032321d20e3c89ef1d ******/
		%feature("compactdefaultargs") Divide;
		%feature("autodoc", "
Parameters
----------
theScalar: double

Return
-------
None

Description
-----------
No available documentation.
") Divide;
		void Divide(const double theScalar);

		/****** gp_Vec2d::Divided ******/
		/****** md5 signature: 454a59fd7ade9bab4f0a42399b01b448 ******/
		%feature("compactdefaultargs") Divided;
		%feature("autodoc", "
Parameters
----------
theScalar: double

Return
-------
gp_Vec2d

Description
-----------
divides a vector by a scalar.
") Divided;
		gp_Vec2d Divided(const double theScalar);

		/****** gp_Vec2d::Dot ******/
		/****** md5 signature: a75db0f7833e135650c56233df01b1b5 ******/
		%feature("compactdefaultargs") Dot;
		%feature("autodoc", "
Parameters
----------
theOther: gp_Vec2d

Return
-------
double

Description
-----------
Computes the scalar product.
") Dot;
		double Dot(const gp_Vec2d & theOther);

		/****** gp_Vec2d::GetNormal ******/
		/****** md5 signature: dcb93582d2e8508e17b0006ff62d302b ******/
		%feature("compactdefaultargs") GetNormal;
		%feature("autodoc", "Return
-------
gp_Vec2d

Description
-----------
No available documentation.
") GetNormal;
		gp_Vec2d GetNormal();

		/****** gp_Vec2d::IsEqual ******/
		/****** md5 signature: 56c7a15f1d4ed15c697948c5768fe24e ******/
		%feature("compactdefaultargs") IsEqual;
		%feature("autodoc", "
Parameters
----------
theOther: gp_Vec2d
theLinearTolerance: double
theAngularTolerance: double

Return
-------
bool

Description
-----------
Returns True if the two vectors have the same magnitude value and the same direction. The precision values are theLinearTolerance for the magnitude and theAngularTolerance for the direction.
") IsEqual;
		bool IsEqual(const gp_Vec2d & theOther, const double theLinearTolerance, const double theAngularTolerance);

		/****** gp_Vec2d::IsNormal ******/
		/****** md5 signature: dadd8ce866ae705ffb2fb1272c594a22 ******/
		%feature("compactdefaultargs") IsNormal;
		%feature("autodoc", "
Parameters
----------
theOther: gp_Vec2d
theAngularTolerance: double

Return
-------
bool

Description
-----------
Returns True if abs(std::abs(<self>.Angle(theOther)) - PI/2.) <= theAngularTolerance Raises VectorWithNullMagnitude if <self>.Magnitude() <= Resolution or theOther.Magnitude() <= Resolution from gp.
") IsNormal;
		bool IsNormal(const gp_Vec2d & theOther, const double theAngularTolerance);

		/****** gp_Vec2d::IsOpposite ******/
		/****** md5 signature: 172f9935a472d626f9a2c4de2edab454 ******/
		%feature("compactdefaultargs") IsOpposite;
		%feature("autodoc", "
Parameters
----------
theOther: gp_Vec2d
theAngularTolerance: double

Return
-------
bool

Description
-----------
Returns True if PI - std::abs(<self>.Angle(theOther)) <= theAngularTolerance Raises VectorWithNullMagnitude if <self>.Magnitude() <= Resolution or theOther.Magnitude() <= Resolution from gp.
") IsOpposite;
		bool IsOpposite(const gp_Vec2d & theOther, const double theAngularTolerance);

		/****** gp_Vec2d::IsParallel ******/
		/****** md5 signature: 4922868f3006057ab5f89032a7783bb1 ******/
		%feature("compactdefaultargs") IsParallel;
		%feature("autodoc", "
Parameters
----------
theOther: gp_Vec2d
theAngularTolerance: double

Return
-------
bool

Description
-----------
Returns true if std::abs(Angle(<self>, theOther)) <= theAngularTolerance or PI - std::abs(Angle(<self>, theOther)) <= theAngularTolerance Two vectors with opposite directions are considered as parallel. Raises VectorWithNullMagnitude if <self>.Magnitude() <= Resolution or theOther.Magnitude() <= Resolution from gp.
") IsParallel;
		bool IsParallel(const gp_Vec2d & theOther, const double theAngularTolerance);

		/****** gp_Vec2d::Magnitude ******/
		/****** md5 signature: 6573fd4ffa13d53ed0c1342b544939e2 ******/
		%feature("compactdefaultargs") Magnitude;
		%feature("autodoc", "Return
-------
double

Description
-----------
Computes the magnitude of this vector.
") Magnitude;
		double Magnitude();

		/****** gp_Vec2d::Mirror ******/
		/****** md5 signature: ea69e2d6868e004299bb83dd68d54283 ******/
		%feature("compactdefaultargs") Mirror;
		%feature("autodoc", "
Parameters
----------
theV: gp_Vec2d

Return
-------
None

Description
-----------
Performs the symmetrical transformation of a vector with respect to the vector theV which is the center of the symmetry.
") Mirror;
		void Mirror(const gp_Vec2d & theV);

		/****** gp_Vec2d::Mirror ******/
		/****** md5 signature: 235268bdc819ae1aa6028dbccd7a8cfb ******/
		%feature("compactdefaultargs") Mirror;
		%feature("autodoc", "
Parameters
----------
theA1: gp_Ax2d

Return
-------
None

Description
-----------
Performs the symmetrical transformation of a vector with respect to an axis placement which is the axis of the symmetry.
") Mirror;
		void Mirror(const gp_Ax2d & theA1);

		/****** gp_Vec2d::Mirrored ******/
		/****** md5 signature: f8589ba6940d77412bec5604dacd9307 ******/
		%feature("compactdefaultargs") Mirrored;
		%feature("autodoc", "
Parameters
----------
theV: gp_Vec2d

Return
-------
gp_Vec2d

Description
-----------
Performs the symmetrical transformation of a vector with respect to the vector theV which is the center of the symmetry.
") Mirrored;
		gp_Vec2d Mirrored(const gp_Vec2d & theV);

		/****** gp_Vec2d::Mirrored ******/
		/****** md5 signature: 2a2565e4a18bdb5f501d2e7387b1ec22 ******/
		%feature("compactdefaultargs") Mirrored;
		%feature("autodoc", "
Parameters
----------
theA1: gp_Ax2d

Return
-------
gp_Vec2d

Description
-----------
Performs the symmetrical transformation of a vector with respect to an axis placement which is the axis of the symmetry.
") Mirrored;
		gp_Vec2d Mirrored(const gp_Ax2d & theA1);

		/****** gp_Vec2d::Multiplied ******/
		/****** md5 signature: 5716920290cb8fff6f5b35d47ed16b6f ******/
		%feature("compactdefaultargs") Multiplied;
		%feature("autodoc", "
Parameters
----------
theScalar: double

Return
-------
gp_Vec2d

Description
-----------
Normalizes a vector Raises an exception if the magnitude of the vector is lower or equal to Resolution from package gp.
") Multiplied;
		gp_Vec2d Multiplied(const double theScalar);

		/****** gp_Vec2d::Multiply ******/
		/****** md5 signature: 80542cde4114abd4664796be7a03c356 ******/
		%feature("compactdefaultargs") Multiply;
		%feature("autodoc", "
Parameters
----------
theScalar: double

Return
-------
None

Description
-----------
No available documentation.
") Multiply;
		void Multiply(const double theScalar);

		/****** gp_Vec2d::Normalize ******/
		/****** md5 signature: df5d0be92b25875af291db140fcd7cf4 ******/
		%feature("compactdefaultargs") Normalize;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Normalize;
		void Normalize();

		/****** gp_Vec2d::Normalized ******/
		/****** md5 signature: 86d603dc02ee841c7172dbf48966fb92 ******/
		%feature("compactdefaultargs") Normalized;
		%feature("autodoc", "Return
-------
gp_Vec2d

Description
-----------
Normalizes a vector Raises an exception if the magnitude of the vector is lower or equal to Resolution from package gp. Reverses the direction of a vector.
") Normalized;
		gp_Vec2d Normalized();

		/****** gp_Vec2d::Reverse ******/
		/****** md5 signature: 51c7e0d05769dec0ec2bb70e4d25e48d ******/
		%feature("compactdefaultargs") Reverse;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Reverse;
		void Reverse();

		/****** gp_Vec2d::Reversed ******/
		/****** md5 signature: ec423c2fb50a9f76cc25647dc8893a02 ******/
		%feature("compactdefaultargs") Reversed;
		%feature("autodoc", "Return
-------
gp_Vec2d

Description
-----------
Reverses the direction of a vector.
") Reversed;
		gp_Vec2d Reversed();

		/****** gp_Vec2d::Rotate ******/
		/****** md5 signature: 5e21dda5f72311dfaeb4919178749a7c ******/
		%feature("compactdefaultargs") Rotate;
		%feature("autodoc", "
Parameters
----------
theAng: double

Return
-------
None

Description
-----------
No available documentation.
") Rotate;
		void Rotate(const double theAng);

		/****** gp_Vec2d::Rotated ******/
		/****** md5 signature: 501e57570e9432fc2ae793756dcad3c7 ******/
		%feature("compactdefaultargs") Rotated;
		%feature("autodoc", "
Parameters
----------
theAng: double

Return
-------
gp_Vec2d

Description
-----------
Rotates a vector. theAng is the angular value of the rotation in radians.
") Rotated;
		gp_Vec2d Rotated(const double theAng);

		/****** gp_Vec2d::Scale ******/
		/****** md5 signature: 4d61574bb77fbf32825326bec2749d7f ******/
		%feature("compactdefaultargs") Scale;
		%feature("autodoc", "
Parameters
----------
theS: double

Return
-------
None

Description
-----------
No available documentation.
") Scale;
		void Scale(const double theS);

		/****** gp_Vec2d::Scaled ******/
		/****** md5 signature: 574d78abb1cb2636b9884b6d96548acd ******/
		%feature("compactdefaultargs") Scaled;
		%feature("autodoc", "
Parameters
----------
theS: double

Return
-------
gp_Vec2d

Description
-----------
Scales a vector. theS is the scaling value.
") Scaled;
		gp_Vec2d Scaled(const double theS);

		/****** gp_Vec2d::SetCoord ******/
		/****** md5 signature: 2133811cb7e2b132083ab2453e33c15c ******/
		%feature("compactdefaultargs") SetCoord;
		%feature("autodoc", "
Parameters
----------
theIndex: int
theXi: double

Return
-------
None

Description
-----------
Changes the coordinate of range theIndex theIndex = 1 => X is modified theIndex = 2 => Y is modified Raises OutOfRange if theIndex != {1, 2}.
") SetCoord;
		void SetCoord(const int theIndex, const double theXi);

		/****** gp_Vec2d::SetCoord ******/
		/****** md5 signature: 5a96e9bdfe6abe3be199cc64882957a8 ******/
		%feature("compactdefaultargs") SetCoord;
		%feature("autodoc", "
Parameters
----------
theXv: double
theYv: double

Return
-------
None

Description
-----------
For this vector, assigns the values theXv and theYv to its two coordinates.
") SetCoord;
		void SetCoord(const double theXv, const double theYv);

		/****** gp_Vec2d::SetLinearForm ******/
		/****** md5 signature: 3aed44dfefcc0a3e9f26fbfe9c94ca3b ******/
		%feature("compactdefaultargs") SetLinearForm;
		%feature("autodoc", "
Parameters
----------
theA1: double
theV1: gp_Vec2d
theA2: double
theV2: gp_Vec2d
theV3: gp_Vec2d

Return
-------
None

Description
-----------
<self> is set to the following linear form: theA1 * theV1 + theA2 * theV2 + theV3.
") SetLinearForm;
		void SetLinearForm(const double theA1, const gp_Vec2d & theV1, const double theA2, const gp_Vec2d & theV2, const gp_Vec2d & theV3);

		/****** gp_Vec2d::SetLinearForm ******/
		/****** md5 signature: 6c4b0f1032d8dc5924fb3253618e29bf ******/
		%feature("compactdefaultargs") SetLinearForm;
		%feature("autodoc", "
Parameters
----------
theA1: double
theV1: gp_Vec2d
theA2: double
theV2: gp_Vec2d

Return
-------
None

Description
-----------
<self> is set to the following linear form: theA1 * theV1 + theA2 * theV2.
") SetLinearForm;
		void SetLinearForm(const double theA1, const gp_Vec2d & theV1, const double theA2, const gp_Vec2d & theV2);

		/****** gp_Vec2d::SetLinearForm ******/
		/****** md5 signature: c2c2519b7dfab88d380bcc1d76211ccf ******/
		%feature("compactdefaultargs") SetLinearForm;
		%feature("autodoc", "
Parameters
----------
theA1: double
theV1: gp_Vec2d
theV2: gp_Vec2d

Return
-------
None

Description
-----------
<self> is set to the following linear form: theA1 * theV1 + theV2.
") SetLinearForm;
		void SetLinearForm(const double theA1, const gp_Vec2d & theV1, const gp_Vec2d & theV2);

		/****** gp_Vec2d::SetLinearForm ******/
		/****** md5 signature: 33d8769d59477c596bbfbd4c5da17e83 ******/
		%feature("compactdefaultargs") SetLinearForm;
		%feature("autodoc", "
Parameters
----------
theV1: gp_Vec2d
theV2: gp_Vec2d

Return
-------
None

Description
-----------
<self> is set to the following linear form: theV1 + theV2.
") SetLinearForm;
		void SetLinearForm(const gp_Vec2d & theV1, const gp_Vec2d & theV2);

		/****** gp_Vec2d::SetX ******/
		/****** md5 signature: bbe6dad756ab4b51b477b97b5d2997db ******/
		%feature("compactdefaultargs") SetX;
		%feature("autodoc", "
Parameters
----------
theX: double

Return
-------
None

Description
-----------
Assigns the given value to the X coordinate of this vector.
") SetX;
		void SetX(const double theX);

		/****** gp_Vec2d::SetXY ******/
		/****** md5 signature: bc5d04dce08a95b9336c5c57a5c630d1 ******/
		%feature("compactdefaultargs") SetXY;
		%feature("autodoc", "
Parameters
----------
theCoord: gp_XY

Return
-------
None

Description
-----------
Assigns the two coordinates of theCoord to this vector.
") SetXY;
		void SetXY(const gp_XY & theCoord);

		/****** gp_Vec2d::SetY ******/
		/****** md5 signature: 84504129c782de522a0d69ceb36f6af7 ******/
		%feature("compactdefaultargs") SetY;
		%feature("autodoc", "
Parameters
----------
theY: double

Return
-------
None

Description
-----------
Assigns the given value to the Y coordinate of this vector.
") SetY;
		void SetY(const double theY);

		/****** gp_Vec2d::SquareMagnitude ******/
		/****** md5 signature: 0f10875b74aef97790029420c1957aba ******/
		%feature("compactdefaultargs") SquareMagnitude;
		%feature("autodoc", "Return
-------
double

Description
-----------
Computes the square magnitude of this vector.
") SquareMagnitude;
		double SquareMagnitude();

		/****** gp_Vec2d::Subtract ******/
		/****** md5 signature: e0df287ba2f43c66cabb2b6ec4f2c10d ******/
		%feature("compactdefaultargs") Subtract;
		%feature("autodoc", "
Parameters
----------
theRight: gp_Vec2d

Return
-------
None

Description
-----------
Subtracts two vectors.
") Subtract;
		void Subtract(const gp_Vec2d & theRight);

		/****** gp_Vec2d::Subtracted ******/
		/****** md5 signature: 091661a7d99b2cf0d7e78cbf6e194162 ******/
		%feature("compactdefaultargs") Subtracted;
		%feature("autodoc", "
Parameters
----------
theRight: gp_Vec2d

Return
-------
gp_Vec2d

Description
-----------
Subtracts two vectors.
") Subtracted;
		gp_Vec2d Subtracted(const gp_Vec2d & theRight);

		/****** gp_Vec2d::Transform ******/
		/****** md5 signature: 3afd1642fe7b497a7dbcbc3902ad7fa7 ******/
		%feature("compactdefaultargs") Transform;
		%feature("autodoc", "
Parameters
----------
theT: gp_Trsf2d

Return
-------
None

Description
-----------
No available documentation.
") Transform;
		void Transform(const gp_Trsf2d & theT);

		/****** gp_Vec2d::Transformed ******/
		/****** md5 signature: 07ec7b662dc14a46b6ff8505fe429a93 ******/
		%feature("compactdefaultargs") Transformed;
		%feature("autodoc", "
Parameters
----------
theT: gp_Trsf2d

Return
-------
gp_Vec2d

Description
-----------
Transforms a vector with a Trsf from gp.
") Transformed;
		gp_Vec2d Transformed(const gp_Trsf2d & theT);

		/****** gp_Vec2d::X ******/
		/****** md5 signature: c418db3e494968281737cca9c90ecbdf ******/
		%feature("compactdefaultargs") X;
		%feature("autodoc", "Return
-------
double

Description
-----------
For this vector, returns its X coordinate.
") X;
		double X();

		/****** gp_Vec2d::XY ******/
		/****** md5 signature: 370a020741cd39a80c497bd378673a3a ******/
		%feature("compactdefaultargs") XY;
		%feature("autodoc", "Return
-------
gp_XY

Description
-----------
For this vector, returns its two coordinates as a number pair.
") XY;
		const gp_XY XY();

		/****** gp_Vec2d::Y ******/
		/****** md5 signature: 25eefb608c358bc135b3158209ee8901 ******/
		%feature("compactdefaultargs") Y;
		%feature("autodoc", "Return
-------
double

Description
-----------
For this vector, returns its Y coordinate.
") Y;
		double Y();

		/****** gp_Vec2d::operator * ******/
		/****** md5 signature: ead189b00dd6d5bd514a38cb8c20c874 ******/
		%feature("compactdefaultargs") operator *;
		%feature("autodoc", "
Parameters
----------
theOther: gp_Vec2d

Return
-------
double

Description
-----------
No available documentation.
") operator *;
		double operator *(const gp_Vec2d & theOther);

		/****** gp_Vec2d::operator * ******/
		/****** md5 signature: 958e08a3c9649d883f812ad900448e20 ******/
		%feature("compactdefaultargs") operator *;
		%feature("autodoc", "
Parameters
----------
theScalar: double

Return
-------
gp_Vec2d

Description
-----------
No available documentation.
") operator *;
		gp_Vec2d operator *(const double theScalar);


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
		/****** gp_Vec2d::operator + ******/
		/****** md5 signature: 34d7a6c112671277428feb10d3747300 ******/
		%feature("compactdefaultargs") operator +;
		%feature("autodoc", "
Parameters
----------
theOther: gp_Vec2d

Return
-------
gp_Vec2d

Description
-----------
No available documentation.
") operator +;
		gp_Vec2d operator +(const gp_Vec2d & theOther);


%extend{
    void __iadd_wrapper__(const gp_Vec2d other) {
    *self += other;
    }
}
%pythoncode {
def __iadd__(self, right):
    self.__iadd_wrapper__(right)
    return self
}
		/****** gp_Vec2d::operator - ******/
		/****** md5 signature: cbda9d88ce3397da41adc1df0723fc91 ******/
		%feature("compactdefaultargs") operator -;
		%feature("autodoc", "Return
-------
gp_Vec2d

Description
-----------
No available documentation.
") operator -;
		gp_Vec2d operator -();

		/****** gp_Vec2d::operator - ******/
		/****** md5 signature: a5367d44226c848185a1b97cde32ec50 ******/
		%feature("compactdefaultargs") operator -;
		%feature("autodoc", "
Parameters
----------
theRight: gp_Vec2d

Return
-------
gp_Vec2d

Description
-----------
No available documentation.
") operator -;
		gp_Vec2d operator -(const gp_Vec2d & theRight);


%extend{
    void __isub_wrapper__(const gp_Vec2d other) {
    *self -= other;
    }
}
%pythoncode {
def __isub__(self, right):
    self.__isub_wrapper__(right)
    return self
}
		/****** gp_Vec2d::operator / ******/
		/****** md5 signature: 1137b3502ae0ce489ac9c7cb1ccf61e2 ******/
		%feature("compactdefaultargs") operator /;
		%feature("autodoc", "
Parameters
----------
theScalar: double

Return
-------
gp_Vec2d

Description
-----------
No available documentation.
") operator /;
		gp_Vec2d operator /(const double theScalar);


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



%extend gp_Vec2d {
%pythoncode {
    def __getstate__(self):
        return self.DumpJson()
    }
};

%extend gp_Vec2d {
%pythoncode {
    def __setstate__(self, state):
        inst = gp_Vec2d()
        if inst.InitFromJson(state):
            self.this = inst.this
        else:
            raise IOError('Failed to set state of gp_Vec2d')
    }
};
%extend gp_Vec2d {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************
* class gp_XY *
**************/
class gp_XY {
	public:
		/****** gp_XY::gp_XY ******/
		/****** md5 signature: 599e57890e40376f0dd62673b43bd679 ******/
		%feature("compactdefaultargs") gp_XY;
		%feature("autodoc", "Return
-------
None

Description
-----------
Creates XY object with zero coordinates (0,0).
") gp_XY;
		 gp_XY();

		/****** gp_XY::gp_XY ******/
		/****** md5 signature: 4dfe22e272e7d539a195424b21b41d93 ******/
		%feature("compactdefaultargs") gp_XY;
		%feature("autodoc", "
Parameters
----------
theX: double
theY: double

Return
-------
None

Description
-----------
a number pair defined by the XY coordinates.
") gp_XY;
		 gp_XY(const double theX, const double theY);

		/****** gp_XY::Add ******/
		/****** md5 signature: e287e7e5ec5863409ca82c6d0cf85361 ******/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
theOther: gp_XY

Return
-------
None

Description
-----------
Computes the sum of this number pair and number pair theOther @code <self>.X() = <self>.X() + theOther.X() <self>.Y() = <self>.Y() + theOther.Y() @endcode.
") Add;
		void Add(const gp_XY & theOther);

		/****** gp_XY::Added ******/
		/****** md5 signature: 7025ba4ba9c023641f77a3a7ae634938 ******/
		%feature("compactdefaultargs") Added;
		%feature("autodoc", "
Parameters
----------
theOther: gp_XY

Return
-------
gp_XY

Description
-----------
Computes the sum of this number pair and number pair theOther @code new.X() = <self>.X() + theOther.X() new.Y() = <self>.Y() + theOther.Y() @endcode.
") Added;
		gp_XY Added(const gp_XY & theOther);

		/****** gp_XY::ChangeCoord ******/
		/****** md5 signature: 7b446e64fc27e95e2e4cd6a15411b290 ******/
		%feature("compactdefaultargs") ChangeCoord;
		%feature("autodoc", "
Parameters
----------
theIndex: int

Return
-------
double

Description
-----------
No available documentation.
") ChangeCoord;
		double & ChangeCoord(const int theIndex);

		/****** gp_XY::Coord ******/
		/****** md5 signature: 5ab919f0e89833f70cf3f70d2ba0fddc ******/
		%feature("compactdefaultargs") Coord;
		%feature("autodoc", "
Parameters
----------
theIndex: int

Return
-------
double

Description
-----------
returns the coordinate of range theIndex: theIndex = 1 => X is returned theIndex = 2 => Y is returned Raises OutOfRange if theIndex != {1, 2}.
") Coord;
		double Coord(const int theIndex);

		/****** gp_XY::Coord ******/
		/****** md5 signature: 3b6c6c338d7062cbd52d51e1cf63df8a ******/
		%feature("compactdefaultargs") Coord;
		%feature("autodoc", "
Parameters
----------

Return
-------
theX: double
theY: double

Description
-----------
For this number pair, returns its coordinates X and Y.
") Coord;
		void Coord(Standard_Real &OutValue, Standard_Real &OutValue);

		/****** gp_XY::CrossMagnitude ******/
		/****** md5 signature: e8a9c4f94e8b19e59857176fa9c5d571 ******/
		%feature("compactdefaultargs") CrossMagnitude;
		%feature("autodoc", "
Parameters
----------
theRight: gp_XY

Return
-------
double

Description
-----------
computes the magnitude of the cross product between <self> and theRight. Returns || <self> ^ theRight ||.
") CrossMagnitude;
		double CrossMagnitude(const gp_XY & theRight);

		/****** gp_XY::CrossSquareMagnitude ******/
		/****** md5 signature: 3a3de2b0d1757ee204b93288960fdedc ******/
		%feature("compactdefaultargs") CrossSquareMagnitude;
		%feature("autodoc", "
Parameters
----------
theRight: gp_XY

Return
-------
double

Description
-----------
computes the square magnitude of the cross product between <self> and theRight. Returns || <self> ^ theRight ||**2.
") CrossSquareMagnitude;
		double CrossSquareMagnitude(const gp_XY & theRight);

		/****** gp_XY::Crossed ******/
		/****** md5 signature: 8b22857334b8bdd21ac469f3bdf755fe ******/
		%feature("compactdefaultargs") Crossed;
		%feature("autodoc", "
Parameters
----------
theOther: gp_XY

Return
-------
double

Description
-----------
@code double D = <self>.X() * theOther.Y() - <self>.Y() * theOther.X() @endcode.
") Crossed;
		double Crossed(const gp_XY & theOther);

		/****** gp_XY::Divide ******/
		/****** md5 signature: b580a87aac9eb84eb9b5cb607f38e3d1 ******/
		%feature("compactdefaultargs") Divide;
		%feature("autodoc", "
Parameters
----------
theScalar: double

Return
-------
None

Description
-----------
divides <self> by a real.
") Divide;
		void Divide(const double theScalar);

		/****** gp_XY::Divided ******/
		/****** md5 signature: b0aa6c224c74f1d8e620e0ad649a9dd5 ******/
		%feature("compactdefaultargs") Divided;
		%feature("autodoc", "
Parameters
----------
theScalar: double

Return
-------
gp_XY

Description
-----------
Divides <self> by a real.
") Divided;
		gp_XY Divided(const double theScalar);

		/****** gp_XY::Dot ******/
		/****** md5 signature: 48c3981e980037581cbaeb9ba7ebe60f ******/
		%feature("compactdefaultargs") Dot;
		%feature("autodoc", "
Parameters
----------
theOther: gp_XY

Return
-------
double

Description
-----------
Computes the scalar product between <self> and theOther.
") Dot;
		double Dot(const gp_XY & theOther);

		/****** gp_XY::IsEqual ******/
		/****** md5 signature: 81fabd8c4746c129ba4151a91bbfd60a ******/
		%feature("compactdefaultargs") IsEqual;
		%feature("autodoc", "
Parameters
----------
theOther: gp_XY
theTolerance: double

Return
-------
bool

Description
-----------
Returns true if the coordinates of this number pair are equal to the respective coordinates of the number pair theOther, within the specified tolerance theTolerance.
") IsEqual;
		bool IsEqual(const gp_XY & theOther, const double theTolerance);

		/****** gp_XY::Modulus ******/
		/****** md5 signature: 11574f473a8c3cf8c27adb54f9471cf0 ******/
		%feature("compactdefaultargs") Modulus;
		%feature("autodoc", "Return
-------
double

Description
-----------
Computes std::sqrt(X*X + Y*Y) where X and Y are the two coordinates of this number pair.
") Modulus;
		double Modulus();

		/****** gp_XY::Multiplied ******/
		/****** md5 signature: 71e9e26455c64a7652f807822634997c ******/
		%feature("compactdefaultargs") Multiplied;
		%feature("autodoc", "
Parameters
----------
theScalar: double

Return
-------
gp_XY

Description
-----------
@code New.X() = <self>.X() * theScalar; New.Y() = <self>.Y() * theScalar; @endcode.
") Multiplied;
		gp_XY Multiplied(const double theScalar);

		/****** gp_XY::Multiplied ******/
		/****** md5 signature: d078c4c8a34193b58ea31f82d9c812a9 ******/
		%feature("compactdefaultargs") Multiplied;
		%feature("autodoc", "
Parameters
----------
theOther: gp_XY

Return
-------
gp_XY

Description
-----------
@code new.X() = <self>.X() * theOther.X(); new.Y() = <self>.Y() * theOther.Y(); @endcode.
") Multiplied;
		gp_XY Multiplied(const gp_XY & theOther);

		/****** gp_XY::Multiplied ******/
		/****** md5 signature: 0d73b850fc1827d8d6495cdc79039e64 ******/
		%feature("compactdefaultargs") Multiplied;
		%feature("autodoc", "
Parameters
----------
theMatrix: gp_Mat2d

Return
-------
gp_XY

Description
-----------
New = theMatrix * <self>.
") Multiplied;
		gp_XY Multiplied(const gp_Mat2d & theMatrix);

		/****** gp_XY::Multiply ******/
		/****** md5 signature: 588810bf411a7cd99a9839f379789b8e ******/
		%feature("compactdefaultargs") Multiply;
		%feature("autodoc", "
Parameters
----------
theScalar: double

Return
-------
None

Description
-----------
@code <self>.X() = <self>.X() * theScalar; <self>.Y() = <self>.Y() * theScalar; @endcode.
") Multiply;
		void Multiply(const double theScalar);

		/****** gp_XY::Multiply ******/
		/****** md5 signature: f77dd25c5c9f1c864ec3cf16694c2255 ******/
		%feature("compactdefaultargs") Multiply;
		%feature("autodoc", "
Parameters
----------
theOther: gp_XY

Return
-------
None

Description
-----------
@code <self>.X() = <self>.X() * theOther.X(); <self>.Y() = <self>.Y() * theOther.Y(); @endcode.
") Multiply;
		void Multiply(const gp_XY & theOther);

		/****** gp_XY::Multiply ******/
		/****** md5 signature: b449c97ebfac4e9d9433dbc7b7874c87 ******/
		%feature("compactdefaultargs") Multiply;
		%feature("autodoc", "
Parameters
----------
theMatrix: gp_Mat2d

Return
-------
None

Description
-----------
<self> = theMatrix * <self>.
") Multiply;
		void Multiply(const gp_Mat2d & theMatrix);

		/****** gp_XY::Normalize ******/
		/****** md5 signature: 587346cf1e1c12fdf674aedc915ccd95 ******/
		%feature("compactdefaultargs") Normalize;
		%feature("autodoc", "Return
-------
None

Description
-----------
@code <self>.X() = <self>.X()/ <self>.Modulus() <self>.Y() = <self>.Y()/ <self>.Modulus() @endcode Raises ConstructionError if <self>.Modulus() <= Resolution from gp.
") Normalize;
		void Normalize();

		/****** gp_XY::Normalized ******/
		/****** md5 signature: 8898944e3b7e692f706481a3f7cdaa51 ******/
		%feature("compactdefaultargs") Normalized;
		%feature("autodoc", "Return
-------
gp_XY

Description
-----------
@code New.X() = <self>.X()/ <self>.Modulus() New.Y() = <self>.Y()/ <self>.Modulus() @endcode Raises ConstructionError if <self>.Modulus() <= Resolution from gp.
") Normalized;
		gp_XY Normalized();

		/****** gp_XY::Reverse ******/
		/****** md5 signature: 229f8663d04c43240c56ed238a384b26 ******/
		%feature("compactdefaultargs") Reverse;
		%feature("autodoc", "Return
-------
None

Description
-----------
@code <self>.X() = -<self>.X() <self>.Y() = -<self>.Y().
") Reverse;
		void Reverse();

		/****** gp_XY::Reversed ******/
		/****** md5 signature: 17bd919b39b7636d5d5d6946d1e39c87 ******/
		%feature("compactdefaultargs") Reversed;
		%feature("autodoc", "Return
-------
gp_XY

Description
-----------
@code New.X() = -<self>.X() New.Y() = -<self>.Y() @endcode.
") Reversed;
		gp_XY Reversed();

		/****** gp_XY::SetCoord ******/
		/****** md5 signature: 2133811cb7e2b132083ab2453e33c15c ******/
		%feature("compactdefaultargs") SetCoord;
		%feature("autodoc", "
Parameters
----------
theIndex: int
theXi: double

Return
-------
None

Description
-----------
modifies the coordinate of range theIndex theIndex = 1 => X is modified theIndex = 2 => Y is modified Raises OutOfRange if theIndex != {1, 2}.
") SetCoord;
		void SetCoord(const int theIndex, const double theXi);

		/****** gp_XY::SetCoord ******/
		/****** md5 signature: 9aafb5e2a5687d588c6d07d2af14beeb ******/
		%feature("compactdefaultargs") SetCoord;
		%feature("autodoc", "
Parameters
----------
theX: double
theY: double

Return
-------
None

Description
-----------
For this number pair, assigns the values theX and theY to its coordinates.
") SetCoord;
		void SetCoord(const double theX, const double theY);

		/****** gp_XY::SetLinearForm ******/
		/****** md5 signature: 792410f4585f61fe2f489da2dfcac4b1 ******/
		%feature("compactdefaultargs") SetLinearForm;
		%feature("autodoc", "
Parameters
----------
theA1: double
theXY1: gp_XY
theA2: double
theXY2: gp_XY

Return
-------
None

Description
-----------
Computes the following linear combination and assigns the result to this number pair: @code theA1 * theXY1 + theA2 * theXY2 @endcode.
") SetLinearForm;
		void SetLinearForm(const double theA1, const gp_XY & theXY1, const double theA2, const gp_XY & theXY2);

		/****** gp_XY::SetLinearForm ******/
		/****** md5 signature: b5ab4bb6a8327e29f93cb548f582fd2f ******/
		%feature("compactdefaultargs") SetLinearForm;
		%feature("autodoc", "
Parameters
----------
theA1: double
theXY1: gp_XY
theA2: double
theXY2: gp_XY
theXY3: gp_XY

Return
-------
None

Description
-----------
Computes the following linear combination and assigns the result to this number pair: @code theA1 * theXY1 + theA2 * theXY2 + theXY3 @endcode.
") SetLinearForm;
		void SetLinearForm(const double theA1, const gp_XY & theXY1, const double theA2, const gp_XY & theXY2, const gp_XY & theXY3);

		/****** gp_XY::SetLinearForm ******/
		/****** md5 signature: 0658e11fa049e1e09c44e7420b1a6ca0 ******/
		%feature("compactdefaultargs") SetLinearForm;
		%feature("autodoc", "
Parameters
----------
theA1: double
theXY1: gp_XY
theXY2: gp_XY

Return
-------
None

Description
-----------
Computes the following linear combination and assigns the result to this number pair: @code theA1 * theXY1 + theXY2 @endcode.
") SetLinearForm;
		void SetLinearForm(const double theA1, const gp_XY & theXY1, const gp_XY & theXY2);

		/****** gp_XY::SetLinearForm ******/
		/****** md5 signature: 7e840f00bae2e578c53bb2e6b9697c56 ******/
		%feature("compactdefaultargs") SetLinearForm;
		%feature("autodoc", "
Parameters
----------
theXY1: gp_XY
theXY2: gp_XY

Return
-------
None

Description
-----------
Computes the following linear combination and assigns the result to this number pair: @code theXY1 + theXY2 @endcode.
") SetLinearForm;
		void SetLinearForm(const gp_XY & theXY1, const gp_XY & theXY2);

		/****** gp_XY::SetX ******/
		/****** md5 signature: bbe6dad756ab4b51b477b97b5d2997db ******/
		%feature("compactdefaultargs") SetX;
		%feature("autodoc", "
Parameters
----------
theX: double

Return
-------
None

Description
-----------
Assigns the given value to the X coordinate of this number pair.
") SetX;
		void SetX(const double theX);

		/****** gp_XY::SetY ******/
		/****** md5 signature: 84504129c782de522a0d69ceb36f6af7 ******/
		%feature("compactdefaultargs") SetY;
		%feature("autodoc", "
Parameters
----------
theY: double

Return
-------
None

Description
-----------
Assigns the given value to the Y coordinate of this number pair.
") SetY;
		void SetY(const double theY);

		/****** gp_XY::SquareModulus ******/
		/****** md5 signature: 47cf001cc2e719abca35895078e1d80b ******/
		%feature("compactdefaultargs") SquareModulus;
		%feature("autodoc", "Return
-------
double

Description
-----------
Computes X*X + Y*Y where X and Y are the two coordinates of this number pair.
") SquareModulus;
		double SquareModulus();

		/****** gp_XY::Subtract ******/
		/****** md5 signature: 943adae4391c52415a202c327c6fb61f ******/
		%feature("compactdefaultargs") Subtract;
		%feature("autodoc", "
Parameters
----------
theOther: gp_XY

Return
-------
None

Description
-----------
@code <self>.X() = <self>.X() - theOther.X() <self>.Y() = <self>.Y() - theOther.Y() @endcode.
") Subtract;
		void Subtract(const gp_XY & theOther);

		/****** gp_XY::Subtracted ******/
		/****** md5 signature: fb49709ef40ecaddd7b5aa8d31695cdc ******/
		%feature("compactdefaultargs") Subtracted;
		%feature("autodoc", "
Parameters
----------
theOther: gp_XY

Return
-------
gp_XY

Description
-----------
@code new.X() = <self>.X() - theOther.X() new.Y() = <self>.Y() - theOther.Y() @endcode.
") Subtracted;
		gp_XY Subtracted(const gp_XY & theOther);

		/****** gp_XY::X ******/
		/****** md5 signature: c418db3e494968281737cca9c90ecbdf ******/
		%feature("compactdefaultargs") X;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns the X coordinate of this number pair.
") X;
		double X();

		/****** gp_XY::Y ******/
		/****** md5 signature: 25eefb608c358bc135b3158209ee8901 ******/
		%feature("compactdefaultargs") Y;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns the Y coordinate of this number pair.
") Y;
		double Y();

		/****** gp_XY::operator * ******/
		/****** md5 signature: ad0de25b4abb2f5674e43301b0685175 ******/
		%feature("compactdefaultargs") operator *;
		%feature("autodoc", "
Parameters
----------
theOther: gp_XY

Return
-------
double

Description
-----------
No available documentation.
") operator *;
		double operator *(const gp_XY & theOther);

		/****** gp_XY::operator * ******/
		/****** md5 signature: c743615587e9c236be34de6db7b3aaac ******/
		%feature("compactdefaultargs") operator *;
		%feature("autodoc", "
Parameters
----------
theScalar: double

Return
-------
gp_XY

Description
-----------
No available documentation.
") operator *;
		gp_XY operator *(const double theScalar);

		/****** gp_XY::operator * ******/
		/****** md5 signature: 0eedc21f2bf8c48e03170aec633f2528 ******/
		%feature("compactdefaultargs") operator *;
		%feature("autodoc", "
Parameters
----------
theMatrix: gp_Mat2d

Return
-------
gp_XY

Description
-----------
No available documentation.
") operator *;
		gp_XY operator *(const gp_Mat2d & theMatrix);


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

%extend{
    void __imul_wrapper__(const gp_XY other) {
    *self *= other;
    }
}
%pythoncode {
def __imul__(self, right):
    self.__imul_wrapper__(right)
    return self
}

%extend{
    void __imul_wrapper__(const gp_Mat2d other) {
    *self *= other;
    }
}
%pythoncode {
def __imul__(self, right):
    self.__imul_wrapper__(right)
    return self
}
		/****** gp_XY::operator + ******/
		/****** md5 signature: 57f5d82e7d45f3a3078ca7f4d216f50c ******/
		%feature("compactdefaultargs") operator +;
		%feature("autodoc", "
Parameters
----------
theOther: gp_XY

Return
-------
gp_XY

Description
-----------
No available documentation.
") operator +;
		gp_XY operator +(const gp_XY & theOther);


%extend{
    void __iadd_wrapper__(const gp_XY other) {
    *self += other;
    }
}
%pythoncode {
def __iadd__(self, right):
    self.__iadd_wrapper__(right)
    return self
}
		/****** gp_XY::operator - ******/
		/****** md5 signature: 04a9be84b7f0226df2714208a4da8733 ******/
		%feature("compactdefaultargs") operator -;
		%feature("autodoc", "Return
-------
gp_XY

Description
-----------
No available documentation.
") operator -;
		gp_XY operator -();

		/****** gp_XY::operator - ******/
		/****** md5 signature: ff6640b91933aadb13a4a2b47ced710c ******/
		%feature("compactdefaultargs") operator -;
		%feature("autodoc", "
Parameters
----------
theOther: gp_XY

Return
-------
gp_XY

Description
-----------
No available documentation.
") operator -;
		gp_XY operator -(const gp_XY & theOther);


%extend{
    void __isub_wrapper__(const gp_XY other) {
    *self -= other;
    }
}
%pythoncode {
def __isub__(self, right):
    self.__isub_wrapper__(right)
    return self
}
		/****** gp_XY::operator / ******/
		/****** md5 signature: 59f33307aff4d5191cfbfba1187b6f14 ******/
		%feature("compactdefaultargs") operator /;
		%feature("autodoc", "
Parameters
----------
theScalar: double

Return
-------
gp_XY

Description
-----------
No available documentation.
") operator /;
		gp_XY operator /(const double theScalar);


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



%extend gp_XY {
%pythoncode {
    def __getstate__(self):
        return self.DumpJson()
    }
};

%extend gp_XY {
%pythoncode {
    def __setstate__(self, state):
        inst = gp_XY()
        if inst.InitFromJson(state):
            self.this = inst.this
        else:
            raise IOError('Failed to set state of gp_XY')
    }
};
%extend gp_XY {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************
* class gp_XYZ *
***************/
class gp_XYZ {
	public:
		/****** gp_XYZ::gp_XYZ ******/
		/****** md5 signature: 996e9ffa9af4236ed924e99a0a86495d ******/
		%feature("compactdefaultargs") gp_XYZ;
		%feature("autodoc", "Return
-------
None

Description
-----------
Creates an XYZ object with zero coordinates (0,0,0).
") gp_XYZ;
		 gp_XYZ();

		/****** gp_XYZ::gp_XYZ ******/
		/****** md5 signature: 1aa052fd8e7967f9eba21ba1089de9d4 ******/
		%feature("compactdefaultargs") gp_XYZ;
		%feature("autodoc", "
Parameters
----------
theX: double
theY: double
theZ: double

Return
-------
None

Description
-----------
creates an XYZ with given coordinates.
") gp_XYZ;
		 gp_XYZ(const double theX, const double theY, const double theZ);

		/****** gp_XYZ::Add ******/
		/****** md5 signature: 54a9376d07c424b9ff583f15d8261c64 ******/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
theOther: gp_XYZ

Return
-------
None

Description
-----------
@code <self>.X() = <self>.X() + theOther.X() <self>.Y() = <self>.Y() + theOther.Y() <self>.Z() = <self>.Z() + theOther.Z() @endcode.
") Add;
		void Add(const gp_XYZ & theOther);

		/****** gp_XYZ::Added ******/
		/****** md5 signature: f19e59cfecf1672712445d175ed68e99 ******/
		%feature("compactdefaultargs") Added;
		%feature("autodoc", "
Parameters
----------
theOther: gp_XYZ

Return
-------
gp_XYZ

Description
-----------
@code new.X() = <self>.X() + theOther.X() new.Y() = <self>.Y() + theOther.Y() new.Z() = <self>.Z() + theOther.Z() @endcode.
") Added;
		gp_XYZ Added(const gp_XYZ & theOther);

		/****** gp_XYZ::ChangeCoord ******/
		/****** md5 signature: 7b446e64fc27e95e2e4cd6a15411b290 ******/
		%feature("compactdefaultargs") ChangeCoord;
		%feature("autodoc", "
Parameters
----------
theIndex: int

Return
-------
double

Description
-----------
No available documentation.
") ChangeCoord;
		double & ChangeCoord(const int theIndex);

		/****** gp_XYZ::ChangeData ******/
		/****** md5 signature: 354f7635ecf233a5388aa0e2f784d97b ******/
		%feature("compactdefaultargs") ChangeData;
		%feature("autodoc", "Return
-------
double *

Description
-----------
Returns a ptr to coordinates location. Is useful for algorithms, but DOES NOT PERFORM ANY CHECKS!.
") ChangeData;
		double * ChangeData();

		/****** gp_XYZ::Coord ******/
		/****** md5 signature: 5ab919f0e89833f70cf3f70d2ba0fddc ******/
		%feature("compactdefaultargs") Coord;
		%feature("autodoc", "
Parameters
----------
theIndex: int

Return
-------
double

Description
-----------
returns the coordinate of range theIndex: theIndex = 1 => X is returned theIndex = 2 => Y is returned theIndex = 3 => Z is returned //! Raises OutOfRange if theIndex != {1, 2, 3}.
") Coord;
		double Coord(const int theIndex);

		/****** gp_XYZ::Coord ******/
		/****** md5 signature: 57f1be53e2dd2cdef7c75e85c8c5a12c ******/
		%feature("compactdefaultargs") Coord;
		%feature("autodoc", "
Parameters
----------

Return
-------
theX: double
theY: double
theZ: double

Description
-----------
No available documentation.
") Coord;
		void Coord(Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** gp_XYZ::Cross ******/
		/****** md5 signature: 2c2dbd2f34c1aa42c57c39d968dd8ba1 ******/
		%feature("compactdefaultargs") Cross;
		%feature("autodoc", "
Parameters
----------
theOther: gp_XYZ

Return
-------
None

Description
-----------
@code <self>.X() = <self>.Y() * theOther.Z() - <self>.Z() * theOther.Y() <self>.Y() = <self>.Z() * theOther.X() - <self>.X() * theOther.Z() <self>.Z() = <self>.X() * theOther.Y() - <self>.Y() * theOther.X() @endcode.
") Cross;
		void Cross(const gp_XYZ & theOther);

		/****** gp_XYZ::CrossCross ******/
		/****** md5 signature: 36e0df4aee61152a6855d3bf576f875c ******/
		%feature("compactdefaultargs") CrossCross;
		%feature("autodoc", "
Parameters
----------
theCoord1: gp_XYZ
theCoord2: gp_XYZ

Return
-------
None

Description
-----------
Triple vector product Computes <self> = <self>.Cross(theCoord1.Cross(theCoord2)).
") CrossCross;
		void CrossCross(const gp_XYZ & theCoord1, const gp_XYZ & theCoord2);

		/****** gp_XYZ::CrossCrossed ******/
		/****** md5 signature: d2cecf8518c8d3b676842492a72daa2f ******/
		%feature("compactdefaultargs") CrossCrossed;
		%feature("autodoc", "
Parameters
----------
theCoord1: gp_XYZ
theCoord2: gp_XYZ

Return
-------
gp_XYZ

Description
-----------
Triple vector product computes New = <self>.Cross(theCoord1.Cross(theCoord2)).
") CrossCrossed;
		gp_XYZ CrossCrossed(const gp_XYZ & theCoord1, const gp_XYZ & theCoord2);

		/****** gp_XYZ::CrossMagnitude ******/
		/****** md5 signature: 8e3eb5f2e0091bca3dffa33c8e9099ed ******/
		%feature("compactdefaultargs") CrossMagnitude;
		%feature("autodoc", "
Parameters
----------
theRight: gp_XYZ

Return
-------
double

Description
-----------
Computes the magnitude of the cross product between <self> and theRight. Returns || <self> ^ theRight ||.
") CrossMagnitude;
		double CrossMagnitude(const gp_XYZ & theRight);

		/****** gp_XYZ::CrossSquareMagnitude ******/
		/****** md5 signature: a61cd8227a1661370d1698133bd278ba ******/
		%feature("compactdefaultargs") CrossSquareMagnitude;
		%feature("autodoc", "
Parameters
----------
theRight: gp_XYZ

Return
-------
double

Description
-----------
Computes the square magnitude of the cross product between <self> and theRight. Returns || <self> ^ theRight ||**2.
") CrossSquareMagnitude;
		double CrossSquareMagnitude(const gp_XYZ & theRight);

		/****** gp_XYZ::Crossed ******/
		/****** md5 signature: 4bd8dda1ef8ea36867573d1e6e20cb2b ******/
		%feature("compactdefaultargs") Crossed;
		%feature("autodoc", "
Parameters
----------
theOther: gp_XYZ

Return
-------
gp_XYZ

Description
-----------
@code new.X() = <self>.Y() * theOther.Z() - <self>.Z() * theOther.Y() new.Y() = <self>.Z() * theOther.X() - <self>.X() * theOther.Z() new.Z() = <self>.X() * theOther.Y() - <self>.Y() * theOther.X() @endcode.
") Crossed;
		gp_XYZ Crossed(const gp_XYZ & theOther);

		/****** gp_XYZ::Divide ******/
		/****** md5 signature: b580a87aac9eb84eb9b5cb607f38e3d1 ******/
		%feature("compactdefaultargs") Divide;
		%feature("autodoc", "
Parameters
----------
theScalar: double

Return
-------
None

Description
-----------
divides <self> by a real.
") Divide;
		void Divide(const double theScalar);

		/****** gp_XYZ::Divided ******/
		/****** md5 signature: 3f010d880622b15a3c5a42a57cc68975 ******/
		%feature("compactdefaultargs") Divided;
		%feature("autodoc", "
Parameters
----------
theScalar: double

Return
-------
gp_XYZ

Description
-----------
divides <self> by a real.
") Divided;
		gp_XYZ Divided(const double theScalar);

		/****** gp_XYZ::Dot ******/
		/****** md5 signature: 1e70c68f80003cd89682894373c8d704 ******/
		%feature("compactdefaultargs") Dot;
		%feature("autodoc", "
Parameters
----------
theOther: gp_XYZ

Return
-------
double

Description
-----------
Computes the scalar product between <self> and theOther.
") Dot;
		double Dot(const gp_XYZ & theOther);

		/****** gp_XYZ::DotCross ******/
		/****** md5 signature: 2adc3cd34db00aa4fddff144180abeae ******/
		%feature("compactdefaultargs") DotCross;
		%feature("autodoc", "
Parameters
----------
theCoord1: gp_XYZ
theCoord2: gp_XYZ

Return
-------
double

Description
-----------
Computes the triple scalar product.
") DotCross;
		double DotCross(const gp_XYZ & theCoord1, const gp_XYZ & theCoord2);


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
		/****** gp_XYZ::GetData ******/
		/****** md5 signature: ea6533b7ecbeee288738a0857ea8fd64 ******/
		%feature("compactdefaultargs") GetData;
		%feature("autodoc", "Return
-------
double *

Description
-----------
Returns a const ptr to coordinates location. Is useful for algorithms, but DOES NOT PERFORM ANY CHECKS!.
") GetData;
		const double * GetData();


        /****************** InitFromJson ******************/
        %feature("autodoc", "
Parameters
----------
json_string: the string

Return
-------
bool

Description
-----------
Init the object from a JSON string.
") InitFromJson;
        %extend{
            bool InitFromJson(std::string json_string) {
            std::stringstream s(json_string);
            Standard_Integer pos=2;
            return self->InitFromJson(s, pos);}
        };
		/****** gp_XYZ::IsEqual ******/
		/****** md5 signature: 79d6fb17c60af91ea75845b406014c5b ******/
		%feature("compactdefaultargs") IsEqual;
		%feature("autodoc", "
Parameters
----------
theOther: gp_XYZ
theTolerance: double

Return
-------
bool

Description
-----------
Returns True if he coordinates of this XYZ object are equal to the respective coordinates Other, within the specified tolerance theTolerance.
") IsEqual;
		bool IsEqual(const gp_XYZ & theOther, const double theTolerance);

		/****** gp_XYZ::Modulus ******/
		/****** md5 signature: 11574f473a8c3cf8c27adb54f9471cf0 ******/
		%feature("compactdefaultargs") Modulus;
		%feature("autodoc", "Return
-------
double

Description
-----------
Computes std::sqrt(X*X + Y*Y + Z*Z) where X, Y and Z are the three coordinates of this XYZ object.
") Modulus;
		double Modulus();

		/****** gp_XYZ::Multiplied ******/
		/****** md5 signature: 73d089abd4fda008844584df53c2b7f4 ******/
		%feature("compactdefaultargs") Multiplied;
		%feature("autodoc", "
Parameters
----------
theScalar: double

Return
-------
gp_XYZ

Description
-----------
@code New.X() = <self>.X() * theScalar; New.Y() = <self>.Y() * theScalar; New.Z() = <self>.Z() * theScalar; @endcode.
") Multiplied;
		gp_XYZ Multiplied(const double theScalar);

		/****** gp_XYZ::Multiplied ******/
		/****** md5 signature: e4e6d8f5c31e9f3ac13c63eea2195af0 ******/
		%feature("compactdefaultargs") Multiplied;
		%feature("autodoc", "
Parameters
----------
theOther: gp_XYZ

Return
-------
gp_XYZ

Description
-----------
@code new.X() = <self>.X() * theOther.X(); new.Y() = <self>.Y() * theOther.Y(); new.Z() = <self>.Z() * theOther.Z(); @endcode.
") Multiplied;
		gp_XYZ Multiplied(const gp_XYZ & theOther);

		/****** gp_XYZ::Multiplied ******/
		/****** md5 signature: 9e8dc7eeef30fe3ac710929ad9674bb3 ******/
		%feature("compactdefaultargs") Multiplied;
		%feature("autodoc", "
Parameters
----------
theMatrix: gp_Mat

Return
-------
gp_XYZ

Description
-----------
New = theMatrix * <self>.
") Multiplied;
		gp_XYZ Multiplied(const gp_Mat & theMatrix);

		/****** gp_XYZ::Multiply ******/
		/****** md5 signature: 588810bf411a7cd99a9839f379789b8e ******/
		%feature("compactdefaultargs") Multiply;
		%feature("autodoc", "
Parameters
----------
theScalar: double

Return
-------
None

Description
-----------
@code <self>.X() = <self>.X() * theScalar; <self>.Y() = <self>.Y() * theScalar; <self>.Z() = <self>.Z() * theScalar; @endcode.
") Multiply;
		void Multiply(const double theScalar);

		/****** gp_XYZ::Multiply ******/
		/****** md5 signature: af3cbb3b8520f9b3b959acf4a2d729be ******/
		%feature("compactdefaultargs") Multiply;
		%feature("autodoc", "
Parameters
----------
theOther: gp_XYZ

Return
-------
None

Description
-----------
@code <self>.X() = <self>.X() * theOther.X(); <self>.Y() = <self>.Y() * theOther.Y(); <self>.Z() = <self>.Z() * theOther.Z(); @endcode.
") Multiply;
		void Multiply(const gp_XYZ & theOther);

		/****** gp_XYZ::Multiply ******/
		/****** md5 signature: d4eb7936e9913cdf291f2f9c28f6acb7 ******/
		%feature("compactdefaultargs") Multiply;
		%feature("autodoc", "
Parameters
----------
theMatrix: gp_Mat

Return
-------
None

Description
-----------
<self> = theMatrix * <self>.
") Multiply;
		void Multiply(const gp_Mat & theMatrix);

		/****** gp_XYZ::Normalize ******/
		/****** md5 signature: 587346cf1e1c12fdf674aedc915ccd95 ******/
		%feature("compactdefaultargs") Normalize;
		%feature("autodoc", "Return
-------
None

Description
-----------
@code <self>.X() = <self>.X()/ <self>.Modulus() <self>.Y() = <self>.Y()/ <self>.Modulus() <self>.Z() = <self>.Z()/ <self>.Modulus() @endcode Raised if <self>.Modulus() <= Resolution from gp.
") Normalize;
		void Normalize();

		/****** gp_XYZ::Normalized ******/
		/****** md5 signature: 4831d449729805d4ef6171099bb6e815 ******/
		%feature("compactdefaultargs") Normalized;
		%feature("autodoc", "Return
-------
gp_XYZ

Description
-----------
@code New.X() = <self>.X()/ <self>.Modulus() New.Y() = <self>.Y()/ <self>.Modulus() New.Z() = <self>.Z()/ <self>.Modulus() @endcode Raised if <self>.Modulus() <= Resolution from gp.
") Normalized;
		gp_XYZ Normalized();

		/****** gp_XYZ::Reverse ******/
		/****** md5 signature: 229f8663d04c43240c56ed238a384b26 ******/
		%feature("compactdefaultargs") Reverse;
		%feature("autodoc", "Return
-------
None

Description
-----------
@code <self>.X() = -<self>.X() <self>.Y() = -<self>.Y() <self>.Z() = -<self>.Z() @endcode.
") Reverse;
		void Reverse();

		/****** gp_XYZ::Reversed ******/
		/****** md5 signature: 43bde4fe8cace5de124002cf6fa9df55 ******/
		%feature("compactdefaultargs") Reversed;
		%feature("autodoc", "Return
-------
gp_XYZ

Description
-----------
@code New.X() = -<self>.X() New.Y() = -<self>.Y() New.Z() = -<self>.Z() @endcode.
") Reversed;
		gp_XYZ Reversed();

		/****** gp_XYZ::SetCoord ******/
		/****** md5 signature: c068bded6866eb207a8527c171a721b7 ******/
		%feature("compactdefaultargs") SetCoord;
		%feature("autodoc", "
Parameters
----------
theX: double
theY: double
theZ: double

Return
-------
None

Description
-----------
For this XYZ object, assigns the values theX, theY and theZ to its three coordinates.
") SetCoord;
		void SetCoord(const double theX, const double theY, const double theZ);

		/****** gp_XYZ::SetCoord ******/
		/****** md5 signature: 2133811cb7e2b132083ab2453e33c15c ******/
		%feature("compactdefaultargs") SetCoord;
		%feature("autodoc", "
Parameters
----------
theIndex: int
theXi: double

Return
-------
None

Description
-----------
modifies the coordinate of range theIndex theIndex = 1 => X is modified theIndex = 2 => Y is modified theIndex = 3 => Z is modified Raises OutOfRange if theIndex != {1, 2, 3}.
") SetCoord;
		void SetCoord(const int theIndex, const double theXi);

		/****** gp_XYZ::SetLinearForm ******/
		/****** md5 signature: 9b49a946b14ce9f3bcc501f72815d1a0 ******/
		%feature("compactdefaultargs") SetLinearForm;
		%feature("autodoc", "
Parameters
----------
theA1: double
theXYZ1: gp_XYZ
theA2: double
theXYZ2: gp_XYZ
theA3: double
theXYZ3: gp_XYZ
theXYZ4: gp_XYZ

Return
-------
None

Description
-----------
<self> is set to the following linear form: @code theA1 * theXYZ1 + theA2 * theXYZ2 + theA3 * theXYZ3 + theXYZ4 @endcode.
") SetLinearForm;
		void SetLinearForm(const double theA1, const gp_XYZ & theXYZ1, const double theA2, const gp_XYZ & theXYZ2, const double theA3, const gp_XYZ & theXYZ3, const gp_XYZ & theXYZ4);

		/****** gp_XYZ::SetLinearForm ******/
		/****** md5 signature: 4e5c500d862687832ca03914e355dc45 ******/
		%feature("compactdefaultargs") SetLinearForm;
		%feature("autodoc", "
Parameters
----------
theA1: double
theXYZ1: gp_XYZ
theA2: double
theXYZ2: gp_XYZ
theA3: double
theXYZ3: gp_XYZ

Return
-------
None

Description
-----------
<self> is set to the following linear form: @code theA1 * theXYZ1 + theA2 * theXYZ2 + theA3 * theXYZ3 @endcode.
") SetLinearForm;
		void SetLinearForm(const double theA1, const gp_XYZ & theXYZ1, const double theA2, const gp_XYZ & theXYZ2, const double theA3, const gp_XYZ & theXYZ3);

		/****** gp_XYZ::SetLinearForm ******/
		/****** md5 signature: 9fe32bc5dd53675530c0ec5484870811 ******/
		%feature("compactdefaultargs") SetLinearForm;
		%feature("autodoc", "
Parameters
----------
theA1: double
theXYZ1: gp_XYZ
theA2: double
theXYZ2: gp_XYZ
theXYZ3: gp_XYZ

Return
-------
None

Description
-----------
<self> is set to the following linear form: @code theA1 * theXYZ1 + theA2 * theXYZ2 + theXYZ3 @endcode.
") SetLinearForm;
		void SetLinearForm(const double theA1, const gp_XYZ & theXYZ1, const double theA2, const gp_XYZ & theXYZ2, const gp_XYZ & theXYZ3);

		/****** gp_XYZ::SetLinearForm ******/
		/****** md5 signature: 526b7e4f9819ff00b5e951ba6cbcd1c1 ******/
		%feature("compactdefaultargs") SetLinearForm;
		%feature("autodoc", "
Parameters
----------
theA1: double
theXYZ1: gp_XYZ
theA2: double
theXYZ2: gp_XYZ

Return
-------
None

Description
-----------
<self> is set to the following linear form: @code theA1 * theXYZ1 + theA2 * theXYZ2 @endcode.
") SetLinearForm;
		void SetLinearForm(const double theA1, const gp_XYZ & theXYZ1, const double theA2, const gp_XYZ & theXYZ2);

		/****** gp_XYZ::SetLinearForm ******/
		/****** md5 signature: d246dc5e4fa0ae2df578371716b8951b ******/
		%feature("compactdefaultargs") SetLinearForm;
		%feature("autodoc", "
Parameters
----------
theA1: double
theXYZ1: gp_XYZ
theXYZ2: gp_XYZ

Return
-------
None

Description
-----------
<self> is set to the following linear form: @code theA1 * theXYZ1 + theXYZ2 @endcode.
") SetLinearForm;
		void SetLinearForm(const double theA1, const gp_XYZ & theXYZ1, const gp_XYZ & theXYZ2);

		/****** gp_XYZ::SetLinearForm ******/
		/****** md5 signature: 35ce3a92f19d7e186cfe6c36baafb7e0 ******/
		%feature("compactdefaultargs") SetLinearForm;
		%feature("autodoc", "
Parameters
----------
theXYZ1: gp_XYZ
theXYZ2: gp_XYZ

Return
-------
None

Description
-----------
<self> is set to the following linear form: @code theXYZ1 + theXYZ2 @endcode.
") SetLinearForm;
		void SetLinearForm(const gp_XYZ & theXYZ1, const gp_XYZ & theXYZ2);

		/****** gp_XYZ::SetX ******/
		/****** md5 signature: bbe6dad756ab4b51b477b97b5d2997db ******/
		%feature("compactdefaultargs") SetX;
		%feature("autodoc", "
Parameters
----------
theX: double

Return
-------
None

Description
-----------
Assigns the given value to the X coordinate.
") SetX;
		void SetX(const double theX);

		/****** gp_XYZ::SetY ******/
		/****** md5 signature: 84504129c782de522a0d69ceb36f6af7 ******/
		%feature("compactdefaultargs") SetY;
		%feature("autodoc", "
Parameters
----------
theY: double

Return
-------
None

Description
-----------
Assigns the given value to the Y coordinate.
") SetY;
		void SetY(const double theY);

		/****** gp_XYZ::SetZ ******/
		/****** md5 signature: f5e8a0ff6e3eaaf9fdb056b8c6159170 ******/
		%feature("compactdefaultargs") SetZ;
		%feature("autodoc", "
Parameters
----------
theZ: double

Return
-------
None

Description
-----------
Assigns the given value to the Z coordinate.
") SetZ;
		void SetZ(const double theZ);

		/****** gp_XYZ::SquareModulus ******/
		/****** md5 signature: 47cf001cc2e719abca35895078e1d80b ******/
		%feature("compactdefaultargs") SquareModulus;
		%feature("autodoc", "Return
-------
double

Description
-----------
Computes X*X + Y*Y + Z*Z where X, Y and Z are the three coordinates of this XYZ object.
") SquareModulus;
		double SquareModulus();

		/****** gp_XYZ::Subtract ******/
		/****** md5 signature: 319bf7bce166a95f4292b894a0e741aa ******/
		%feature("compactdefaultargs") Subtract;
		%feature("autodoc", "
Parameters
----------
theOther: gp_XYZ

Return
-------
None

Description
-----------
@code <self>.X() = <self>.X() - theOther.X() <self>.Y() = <self>.Y() - theOther.Y() <self>.Z() = <self>.Z() - theOther.Z() @endcode.
") Subtract;
		void Subtract(const gp_XYZ & theOther);

		/****** gp_XYZ::Subtracted ******/
		/****** md5 signature: d6e09e702b67cd9912e1a6762246c0f7 ******/
		%feature("compactdefaultargs") Subtracted;
		%feature("autodoc", "
Parameters
----------
theOther: gp_XYZ

Return
-------
gp_XYZ

Description
-----------
@code new.X() = <self>.X() - theOther.X() new.Y() = <self>.Y() - theOther.Y() new.Z() = <self>.Z() - theOther.Z() @endcode.
") Subtracted;
		gp_XYZ Subtracted(const gp_XYZ & theOther);

		/****** gp_XYZ::X ******/
		/****** md5 signature: c418db3e494968281737cca9c90ecbdf ******/
		%feature("compactdefaultargs") X;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns the X coordinate.
") X;
		double X();

		/****** gp_XYZ::Y ******/
		/****** md5 signature: 25eefb608c358bc135b3158209ee8901 ******/
		%feature("compactdefaultargs") Y;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns the Y coordinate.
") Y;
		double Y();

		/****** gp_XYZ::Z ******/
		/****** md5 signature: 078eb43f219d180be16ce27c9708e49a ******/
		%feature("compactdefaultargs") Z;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns the Z coordinate.
") Z;
		double Z();

		/****** gp_XYZ::operator * ******/
		/****** md5 signature: b0774bb2f4dab9d73ae3eb4813aa7d42 ******/
		%feature("compactdefaultargs") operator *;
		%feature("autodoc", "
Parameters
----------
theOther: gp_XYZ

Return
-------
double

Description
-----------
No available documentation.
") operator *;
		double operator *(const gp_XYZ & theOther);

		/****** gp_XYZ::operator * ******/
		/****** md5 signature: f941b05468e4ef9ff57e0d472bd71219 ******/
		%feature("compactdefaultargs") operator *;
		%feature("autodoc", "
Parameters
----------
theScalar: double

Return
-------
gp_XYZ

Description
-----------
No available documentation.
") operator *;
		gp_XYZ operator *(const double theScalar);

		/****** gp_XYZ::operator * ******/
		/****** md5 signature: 61ac6ea3e6ea4404f89d1548c150f731 ******/
		%feature("compactdefaultargs") operator *;
		%feature("autodoc", "
Parameters
----------
theMatrix: gp_Mat

Return
-------
gp_XYZ

Description
-----------
No available documentation.
") operator *;
		gp_XYZ operator *(const gp_Mat & theMatrix);


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

%extend{
    void __imul_wrapper__(const gp_XYZ other) {
    *self *= other;
    }
}
%pythoncode {
def __imul__(self, right):
    self.__imul_wrapper__(right)
    return self
}

%extend{
    void __imul_wrapper__(const gp_Mat other) {
    *self *= other;
    }
}
%pythoncode {
def __imul__(self, right):
    self.__imul_wrapper__(right)
    return self
}
		/****** gp_XYZ::operator + ******/
		/****** md5 signature: 25ee43bde15a16edd09bb699660b7f3e ******/
		%feature("compactdefaultargs") operator +;
		%feature("autodoc", "
Parameters
----------
theOther: gp_XYZ

Return
-------
gp_XYZ

Description
-----------
No available documentation.
") operator +;
		gp_XYZ operator +(const gp_XYZ & theOther);


%extend{
    void __iadd_wrapper__(const gp_XYZ other) {
    *self += other;
    }
}
%pythoncode {
def __iadd__(self, right):
    self.__iadd_wrapper__(right)
    return self
}
		/****** gp_XYZ::operator - ******/
		/****** md5 signature: 6c91f6634823ed29610bf39d059dad21 ******/
		%feature("compactdefaultargs") operator -;
		%feature("autodoc", "
Parameters
----------
theOther: gp_XYZ

Return
-------
gp_XYZ

Description
-----------
No available documentation.
") operator -;
		gp_XYZ operator -(const gp_XYZ & theOther);


%extend{
    void __isub_wrapper__(const gp_XYZ other) {
    *self -= other;
    }
}
%pythoncode {
def __isub__(self, right):
    self.__isub_wrapper__(right)
    return self
}
		/****** gp_XYZ::operator / ******/
		/****** md5 signature: 9eb5ed612c8e1f68f5d52d70c490dc8d ******/
		%feature("compactdefaultargs") operator /;
		%feature("autodoc", "
Parameters
----------
theScalar: double

Return
-------
gp_XYZ

Description
-----------
No available documentation.
") operator /;
		gp_XYZ operator /(const double theScalar);


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



%extend gp_XYZ {
%pythoncode {
    def __getstate__(self):
        return self.DumpJson()
    }
};

%extend gp_XYZ {
%pythoncode {
    def __setstate__(self, state):
        inst = gp_XYZ()
        if inst.InitFromJson(state):
            self.this = inst.this
        else:
            raise IOError('Failed to set state of gp_XYZ')
    }
};
%extend gp_XYZ {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************
* class hash<gp_Pnt> *
*********************/
/* harray1 classes */
/* harray2 classes */
/* hsequence classes */
/* class aliases */
%pythoncode {
}
/* deprecated methods */
%pythoncode {
@deprecated
def gp_DX(*args):
	return gp.DX(*args)

@deprecated
def gp_DX2d(*args):
	return gp.DX2d(*args)

@deprecated
def gp_DY(*args):
	return gp.DY(*args)

@deprecated
def gp_DY2d(*args):
	return gp.DY2d(*args)

@deprecated
def gp_DZ(*args):
	return gp.DZ(*args)

@deprecated
def gp_OX(*args):
	return gp.OX(*args)

@deprecated
def gp_OX2d(*args):
	return gp.OX2d(*args)

@deprecated
def gp_OY(*args):
	return gp.OY(*args)

@deprecated
def gp_OY2d(*args):
	return gp.OY2d(*args)

@deprecated
def gp_OZ(*args):
	return gp.OZ(*args)

@deprecated
def gp_Origin(*args):
	return gp.Origin(*args)

@deprecated
def gp_Origin2d(*args):
	return gp.Origin2d(*args)

@deprecated
def gp_Resolution(*args):
	return gp.Resolution(*args)

@deprecated
def gp_XOY(*args):
	return gp.XOY(*args)

@deprecated
def gp_YOZ(*args):
	return gp.YOZ(*args)

@deprecated
def gp_ZOX(*args):
	return gp.ZOX(*args)

@deprecated
def gp_QuaternionNLerp_Interpolate(*args):
	return gp_QuaternionNLerp.Interpolate(*args)

@deprecated
def gp_QuaternionSLerp_Interpolate(*args):
	return gp_QuaternionSLerp.Interpolate(*args)

}
