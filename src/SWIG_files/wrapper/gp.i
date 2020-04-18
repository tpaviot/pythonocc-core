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
%define GPDOCSTRING
"gp module, see official documentation at
https://www.opencascade.com/doc/occt-7.4.0/refman/html/package_gp.html"
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
%include ../common/Operators.i
%include ../common/OccHandle.i


%{
#include<gp_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i

%pythoncode {
from enum import IntEnum
from OCC.Core.Exception import *
};

/* public enums */
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

/* end public enums declaration */

/* python proy classes for enums */
%pythoncode {

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
};
/* end python proxy for enums */

/* handles */
/* end handles declaration */

/* templates */
/* end templates declaration */

/* typedefs */
/* end typedefs declaration */

/**********************************
* class NCollection_Lerp<gp_Trsf> *
**********************************/
/***********
* class gp *
***********/
%rename(gp) gp;
class gp {
	public:
		/****************** DX ******************/
		%feature("compactdefaultargs") DX;
		%feature("autodoc", "Returns a unit vector with the combination (1,0,0).

Returns
-------
gp_Dir
") DX;
		static const gp_Dir DX();

		/****************** DX2d ******************/
		%feature("compactdefaultargs") DX2d;
		%feature("autodoc", "Returns a unit vector with the combinations (1,0).

Returns
-------
gp_Dir2d
") DX2d;
		static const gp_Dir2d DX2d();

		/****************** DY ******************/
		%feature("compactdefaultargs") DY;
		%feature("autodoc", "Returns a unit vector with the combination (0,1,0).

Returns
-------
gp_Dir
") DY;
		static const gp_Dir DY();

		/****************** DY2d ******************/
		%feature("compactdefaultargs") DY2d;
		%feature("autodoc", "Returns a unit vector with the combinations (0,1).

Returns
-------
gp_Dir2d
") DY2d;
		static const gp_Dir2d DY2d();

		/****************** DZ ******************/
		%feature("compactdefaultargs") DZ;
		%feature("autodoc", "Returns a unit vector with the combination (0,0,1).

Returns
-------
gp_Dir
") DZ;
		static const gp_Dir DZ();

		/****************** OX ******************/
		%feature("compactdefaultargs") OX;
		%feature("autodoc", "Identifies an axis where its origin is origin and its unit vector coordinates x = 1.0, y = z = 0.0.

Returns
-------
gp_Ax1
") OX;
		static const gp_Ax1 OX();

		/****************** OX2d ******************/
		%feature("compactdefaultargs") OX2d;
		%feature("autodoc", "Identifies an axis where its origin is origin2d and its unit vector coordinates are: x = 1.0, y = 0.0.

Returns
-------
gp_Ax2d
") OX2d;
		static const gp_Ax2d OX2d();

		/****************** OY ******************/
		%feature("compactdefaultargs") OY;
		%feature("autodoc", "Identifies an axis where its origin is origin and its unit vector coordinates y = 1.0, x = z = 0.0.

Returns
-------
gp_Ax1
") OY;
		static const gp_Ax1 OY();

		/****************** OY2d ******************/
		%feature("compactdefaultargs") OY2d;
		%feature("autodoc", "Identifies an axis where its origin is origin2d and its unit vector coordinates are y = 1.0, x = 0.0.

Returns
-------
gp_Ax2d
") OY2d;
		static const gp_Ax2d OY2d();

		/****************** OZ ******************/
		%feature("compactdefaultargs") OZ;
		%feature("autodoc", "Identifies an axis where its origin is origin and its unit vector coordinates z = 1.0, y = x = 0.0.

Returns
-------
gp_Ax1
") OZ;
		static const gp_Ax1 OZ();

		/****************** Origin ******************/
		%feature("compactdefaultargs") Origin;
		%feature("autodoc", "Identifies a cartesian point with coordinates x = y = z = 0.0.0.

Returns
-------
gp_Pnt
") Origin;
		static const gp_Pnt Origin();

		/****************** Origin2d ******************/
		%feature("compactdefaultargs") Origin2d;
		%feature("autodoc", "Identifies a cartesian point with coordinates x = y = 0.0.

Returns
-------
gp_Pnt2d
") Origin2d;
		static const gp_Pnt2d Origin2d();

		/****************** Resolution ******************/
		%feature("compactdefaultargs") Resolution;
		%feature("autodoc", "Method of package gp //! in geometric computations, defines the tolerance criterion used to determine when two numbers can be considered equal. many class functions use this tolerance criterion, for example, to avoid division by zero in geometric computations. in the documentation, tolerance criterion is always referred to as gp::resolution().

Returns
-------
float
") Resolution;
		static Standard_Real Resolution();

		/****************** XOY ******************/
		%feature("compactdefaultargs") XOY;
		%feature("autodoc", "Identifies a coordinate system where its origin is origin, and its 'main direction' and 'x direction' coordinates z = 1.0, x = y =0.0 and x direction coordinates x = 1.0, y = z = 0.0.

Returns
-------
gp_Ax2
") XOY;
		static const gp_Ax2 XOY();

		/****************** YOZ ******************/
		%feature("compactdefaultargs") YOZ;
		%feature("autodoc", "Identifies a coordinate system where its origin is origin, and its 'main direction' and 'x direction' coordinates x = 1.0, z = y =0.0 and x direction coordinates y = 1.0, x = z = 0.0 in 2d space.

Returns
-------
gp_Ax2
") YOZ;
		static const gp_Ax2 YOZ();

		/****************** ZOX ******************/
		%feature("compactdefaultargs") ZOX;
		%feature("autodoc", "Identifies a coordinate system where its origin is origin, and its 'main direction' and 'x direction' coordinates y = 1.0, x = z =0.0 and x direction coordinates z = 1.0, x = y = 0.0.

Returns
-------
gp_Ax2
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
		/****************** gp_Ax1 ******************/
		%feature("compactdefaultargs") gp_Ax1;
		%feature("autodoc", "Creates an axis object representing z axis of the reference co-ordinate system.

Returns
-------
None
") gp_Ax1;
		 gp_Ax1();

		/****************** gp_Ax1 ******************/
		%feature("compactdefaultargs") gp_Ax1;
		%feature("autodoc", "P is the location point and v is the direction of <self>.

Parameters
----------
P: gp_Pnt
V: gp_Dir

Returns
-------
None
") gp_Ax1;
		 gp_Ax1(const gp_Pnt & P, const gp_Dir & V);

		/****************** Angle ******************/
		%feature("compactdefaultargs") Angle;
		%feature("autodoc", "Computes the angular value, in radians, between <self>.direction() and <other>.direction(). returns the angle between 0 and 2*pi radians.

Parameters
----------
Other: gp_Ax1

Returns
-------
float
") Angle;
		Standard_Real Angle(const gp_Ax1 & Other);

		/****************** Direction ******************/
		%feature("compactdefaultargs") Direction;
		%feature("autodoc", "Returns the direction of <self>.

Returns
-------
gp_Dir
") Direction;
		const gp_Dir Direction();

		/****************** IsCoaxial ******************/
		%feature("compactdefaultargs") IsCoaxial;
		%feature("autodoc", "Returns true if : . the angle between <self> and <other> is lower or equal to <angulartolerance> and . the distance between <self>.location() and <other> is lower or equal to <lineartolerance> and . the distance between <other>.location() and <self> is lower or equal to lineartolerance.

Parameters
----------
Other: gp_Ax1
AngularTolerance: float
LinearTolerance: float

Returns
-------
bool
") IsCoaxial;
		Standard_Boolean IsCoaxial(const gp_Ax1 & Other, const Standard_Real AngularTolerance, const Standard_Real LinearTolerance);

		/****************** IsNormal ******************/
		%feature("compactdefaultargs") IsNormal;
		%feature("autodoc", "Returns true if the direction of the <self> and <other> are normal to each other. that is, if the angle between the two axes is equal to pi/2. note: the tolerance criterion is given by angulartolerance..

Parameters
----------
Other: gp_Ax1
AngularTolerance: float

Returns
-------
bool
") IsNormal;
		Standard_Boolean IsNormal(const gp_Ax1 & Other, const Standard_Real AngularTolerance);

		/****************** IsOpposite ******************/
		%feature("compactdefaultargs") IsOpposite;
		%feature("autodoc", "Returns true if the direction of <self> and <other> are parallel with opposite orientation. that is, if the angle between the two axes is equal to pi. note: the tolerance criterion is given by angulartolerance.

Parameters
----------
Other: gp_Ax1
AngularTolerance: float

Returns
-------
bool
") IsOpposite;
		Standard_Boolean IsOpposite(const gp_Ax1 & Other, const Standard_Real AngularTolerance);

		/****************** IsParallel ******************/
		%feature("compactdefaultargs") IsParallel;
		%feature("autodoc", "Returns true if the direction of <self> and <other> are parallel with same orientation or opposite orientation. that is, if the angle between the two axes is equal to 0 or pi. note: the tolerance criterion is given by angulartolerance.

Parameters
----------
Other: gp_Ax1
AngularTolerance: float

Returns
-------
bool
") IsParallel;
		Standard_Boolean IsParallel(const gp_Ax1 & Other, const Standard_Real AngularTolerance);

		/****************** Location ******************/
		%feature("compactdefaultargs") Location;
		%feature("autodoc", "Returns the location point of <self>.

Returns
-------
gp_Pnt
") Location;
		const gp_Pnt Location();

		/****************** Mirror ******************/
		%feature("compactdefaultargs") Mirror;
		%feature("autodoc", "Performs the symmetrical transformation of an axis placement with respect to the point p which is the center of the symmetry and assigns the result to this axis.

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
		%feature("autodoc", "Performs the symmetrical transformation of an axis placement with respect to an axis placement which is the axis of the symmetry and assigns the result to this axis.

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
		%feature("autodoc", "Performs the symmetrical transformation of an axis placement with respect to a plane. the axis placement <a2> locates the plane of the symmetry : (location, xdirection, ydirection) and assigns the result to this axis.

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
		%feature("autodoc", "Performs the symmetrical transformation of an axis placement with respect to the point p which is the center of the symmetry and creates a new axis.

Parameters
----------
P: gp_Pnt

Returns
-------
gp_Ax1
") Mirrored;
		gp_Ax1 Mirrored(const gp_Pnt & P);

		/****************** Mirrored ******************/
		%feature("compactdefaultargs") Mirrored;
		%feature("autodoc", "Performs the symmetrical transformation of an axis placement with respect to an axis placement which is the axis of the symmetry and creates a new axis.

Parameters
----------
A1: gp_Ax1

Returns
-------
gp_Ax1
") Mirrored;
		gp_Ax1 Mirrored(const gp_Ax1 & A1);

		/****************** Mirrored ******************/
		%feature("compactdefaultargs") Mirrored;
		%feature("autodoc", "Performs the symmetrical transformation of an axis placement with respect to a plane. the axis placement <a2> locates the plane of the symmetry : (location, xdirection, ydirection) and creates a new axis.

Parameters
----------
A2: gp_Ax2

Returns
-------
gp_Ax1
") Mirrored;
		gp_Ax1 Mirrored(const gp_Ax2 & A2);

		/****************** Reverse ******************/
		%feature("compactdefaultargs") Reverse;
		%feature("autodoc", "Reverses the unit vector of this axis. and assigns the result to this axis.

Returns
-------
None
") Reverse;
		void Reverse();

		/****************** Reversed ******************/
		%feature("compactdefaultargs") Reversed;
		%feature("autodoc", "Reverses the unit vector of this axis and creates a new one.

Returns
-------
gp_Ax1
") Reversed;
		gp_Ax1 Reversed();

		/****************** Rotate ******************/
		%feature("compactdefaultargs") Rotate;
		%feature("autodoc", "Rotates this axis at an angle ang (in radians) about the axis a1 and assigns the result to this axis.

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
		%feature("autodoc", "Rotates this axis at an angle ang (in radians) about the axis a1 and creates a new one.

Parameters
----------
A1: gp_Ax1
Ang: float

Returns
-------
gp_Ax1
") Rotated;
		gp_Ax1 Rotated(const gp_Ax1 & A1, const Standard_Real Ang);

		/****************** Scale ******************/
		%feature("compactdefaultargs") Scale;
		%feature("autodoc", "Applies a scaling transformation to this axis with: - scale factor s, and - center p and assigns the result to this axis.

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
		%feature("autodoc", "Applies a scaling transformation to this axis with: - scale factor s, and - center p and creates a new axis.

Parameters
----------
P: gp_Pnt
S: float

Returns
-------
gp_Ax1
") Scaled;
		gp_Ax1 Scaled(const gp_Pnt & P, const Standard_Real S);

		/****************** SetDirection ******************/
		%feature("compactdefaultargs") SetDirection;
		%feature("autodoc", "Assigns v as the 'direction' of this axis.

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
		%feature("autodoc", "Assigns p as the origin of this axis.

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
		%feature("autodoc", "Applies the transformation t to this axis. and assigns the result to this axis.

Parameters
----------
T: gp_Trsf

Returns
-------
None
") Transform;
		void Transform(const gp_Trsf & T);

		/****************** Transformed ******************/
		%feature("compactdefaultargs") Transformed;
		%feature("autodoc", "Applies the transformation t to this axis and creates a new one. //! translates an axis plaxement in the direction of the vector <v>. the magnitude of the translation is the vector's magnitude.

Parameters
----------
T: gp_Trsf

Returns
-------
gp_Ax1
") Transformed;
		gp_Ax1 Transformed(const gp_Trsf & T);

		/****************** Translate ******************/
		%feature("compactdefaultargs") Translate;
		%feature("autodoc", "Translates this axis by the vector v, and assigns the result to this axis.

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
		%feature("autodoc", "Translates this axis by: the vector (p1, p2) defined from point p1 to point p2. and assigns the result to this axis.

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
		%feature("autodoc", "Translates this axis by the vector v, and creates a new one.

Parameters
----------
V: gp_Vec

Returns
-------
gp_Ax1
") Translated;
		gp_Ax1 Translated(const gp_Vec & V);

		/****************** Translated ******************/
		%feature("compactdefaultargs") Translated;
		%feature("autodoc", "Translates this axis by: the vector (p1, p2) defined from point p1 to point p2. and creates a new one.

Parameters
----------
P1: gp_Pnt
P2: gp_Pnt

Returns
-------
gp_Ax1
") Translated;
		gp_Ax1 Translated(const gp_Pnt & P1, const gp_Pnt & P2);

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
		/****************** gp_Ax2 ******************/
		%feature("compactdefaultargs") gp_Ax2;
		%feature("autodoc", "Creates an object corresponding to the reference coordinate system (oxyz).

Returns
-------
None
") gp_Ax2;
		 gp_Ax2();

		/****************** gp_Ax2 ******************/
		%feature("compactdefaultargs") gp_Ax2;
		%feature("autodoc", "Creates an axis placement with an origin p such that: - n is the direction, and - the 'x direction' is normal to n, in the plane defined by the vectors (n, vx): 'x direction' = (n ^ vx) ^ n, exception: raises constructionerror if n and vx are parallel (same or opposite orientation).

Parameters
----------
P: gp_Pnt
N: gp_Dir
Vx: gp_Dir

Returns
-------
None
") gp_Ax2;
		 gp_Ax2(const gp_Pnt & P, const gp_Dir & N, const gp_Dir & Vx);

		/****************** gp_Ax2 ******************/
		%feature("compactdefaultargs") gp_Ax2;
		%feature("autodoc", "Creates - a coordinate system with an origin p, where v gives the 'main direction' (here, 'x direction' and 'y direction' are defined automatically).

Parameters
----------
P: gp_Pnt
V: gp_Dir

Returns
-------
None
") gp_Ax2;
		 gp_Ax2(const gp_Pnt & P, const gp_Dir & V);

		/****************** Angle ******************/
		%feature("compactdefaultargs") Angle;
		%feature("autodoc", "Computes the angular value, in radians, between the main direction of <self> and the main direction of <other>. returns the angle between 0 and pi in radians.

Parameters
----------
Other: gp_Ax2

Returns
-------
float
") Angle;
		Standard_Real Angle(const gp_Ax2 & Other);

		/****************** Axis ******************/
		%feature("compactdefaultargs") Axis;
		%feature("autodoc", "Returns the main axis of <self>. it is the 'location' point and the main 'direction'.

Returns
-------
gp_Ax1
") Axis;
		const gp_Ax1 Axis();

		/****************** Direction ******************/
		%feature("compactdefaultargs") Direction;
		%feature("autodoc", "Returns the main direction of <self>.

Returns
-------
gp_Dir
") Direction;
		const gp_Dir Direction();

		/****************** IsCoplanar ******************/
		%feature("compactdefaultargs") IsCoplanar;
		%feature("autodoc", "No available documentation.

Parameters
----------
Other: gp_Ax2
LinearTolerance: float
AngularTolerance: float

Returns
-------
bool
") IsCoplanar;
		Standard_Boolean IsCoplanar(const gp_Ax2 & Other, const Standard_Real LinearTolerance, const Standard_Real AngularTolerance);

		/****************** IsCoplanar ******************/
		%feature("compactdefaultargs") IsCoplanar;
		%feature("autodoc", "Returns true if . the distance between <self> and the 'location' point of a1 is lower of equal to lineartolerance and . the main direction of <self> and the direction of a1 are normal. note: the tolerance criterion for angular equality is given by angulartolerance.

Parameters
----------
A1: gp_Ax1
LinearTolerance: float
AngularTolerance: float

Returns
-------
bool
") IsCoplanar;
		Standard_Boolean IsCoplanar(const gp_Ax1 & A1, const Standard_Real LinearTolerance, const Standard_Real AngularTolerance);

		/****************** Location ******************/
		%feature("compactdefaultargs") Location;
		%feature("autodoc", "Returns the 'location' point (origin) of <self>.

Returns
-------
gp_Pnt
") Location;
		const gp_Pnt Location();

		/****************** Mirror ******************/
		%feature("compactdefaultargs") Mirror;
		%feature("autodoc", "Performs a symmetrical transformation of this coordinate system with respect to: - the point p, and assigns the result to this coordinate system. warning this transformation is always performed on the origin. in case of a reflection with respect to a point: - the main direction of the coordinate system is not changed, and - the 'x direction' and the 'y direction' are simply reversed in case of a reflection with respect to an axis or a plane: - the transformation is applied to the 'x direction' and the 'y direction', then - the 'main direction' is recomputed as the cross product 'x direction' ^ 'y direction'. this maintains the right-handed property of the coordinate system.

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
		%feature("autodoc", "Performs a symmetrical transformation of this coordinate system with respect to: - the axis a1, and assigns the result to this coordinate systeme. warning this transformation is always performed on the origin. in case of a reflection with respect to a point: - the main direction of the coordinate system is not changed, and - the 'x direction' and the 'y direction' are simply reversed in case of a reflection with respect to an axis or a plane: - the transformation is applied to the 'x direction' and the 'y direction', then - the 'main direction' is recomputed as the cross product 'x direction' ^ 'y direction'. this maintains the right-handed property of the coordinate system.

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
		%feature("autodoc", "Performs a symmetrical transformation of this coordinate system with respect to: - the plane defined by the origin, 'x direction' and 'y direction' of coordinate system a2 and assigns the result to this coordinate systeme. warning this transformation is always performed on the origin. in case of a reflection with respect to a point: - the main direction of the coordinate system is not changed, and - the 'x direction' and the 'y direction' are simply reversed in case of a reflection with respect to an axis or a plane: - the transformation is applied to the 'x direction' and the 'y direction', then - the 'main direction' is recomputed as the cross product 'x direction' ^ 'y direction'. this maintains the right-handed property of the coordinate system.

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
		%feature("autodoc", "Performs a symmetrical transformation of this coordinate system with respect to: - the point p, and creates a new one. warning this transformation is always performed on the origin. in case of a reflection with respect to a point: - the main direction of the coordinate system is not changed, and - the 'x direction' and the 'y direction' are simply reversed in case of a reflection with respect to an axis or a plane: - the transformation is applied to the 'x direction' and the 'y direction', then - the 'main direction' is recomputed as the cross product 'x direction' ^ 'y direction'. this maintains the right-handed property of the coordinate system.

Parameters
----------
P: gp_Pnt

Returns
-------
gp_Ax2
") Mirrored;
		gp_Ax2 Mirrored(const gp_Pnt & P);

		/****************** Mirrored ******************/
		%feature("compactdefaultargs") Mirrored;
		%feature("autodoc", "Performs a symmetrical transformation of this coordinate system with respect to: - the axis a1, and creates a new one. warning this transformation is always performed on the origin. in case of a reflection with respect to a point: - the main direction of the coordinate system is not changed, and - the 'x direction' and the 'y direction' are simply reversed in case of a reflection with respect to an axis or a plane: - the transformation is applied to the 'x direction' and the 'y direction', then - the 'main direction' is recomputed as the cross product 'x direction' ^ 'y direction'. this maintains the right-handed property of the coordinate system.

Parameters
----------
A1: gp_Ax1

Returns
-------
gp_Ax2
") Mirrored;
		gp_Ax2 Mirrored(const gp_Ax1 & A1);

		/****************** Mirrored ******************/
		%feature("compactdefaultargs") Mirrored;
		%feature("autodoc", "Performs a symmetrical transformation of this coordinate system with respect to: - the plane defined by the origin, 'x direction' and 'y direction' of coordinate system a2 and creates a new one. warning this transformation is always performed on the origin. in case of a reflection with respect to a point: - the main direction of the coordinate system is not changed, and - the 'x direction' and the 'y direction' are simply reversed in case of a reflection with respect to an axis or a plane: - the transformation is applied to the 'x direction' and the 'y direction', then - the 'main direction' is recomputed as the cross product 'x direction' ^ 'y direction'. this maintains the right-handed property of the coordinate system.

Parameters
----------
A2: gp_Ax2

Returns
-------
gp_Ax2
") Mirrored;
		gp_Ax2 Mirrored(const gp_Ax2 & A2);

		/****************** Rotate ******************/
		%feature("compactdefaultargs") Rotate;
		%feature("autodoc", "No available documentation.

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
		%feature("autodoc", "Rotates an axis placement. <a1> is the axis of the rotation . ang is the angular value of the rotation in radians.

Parameters
----------
A1: gp_Ax1
Ang: float

Returns
-------
gp_Ax2
") Rotated;
		gp_Ax2 Rotated(const gp_Ax1 & A1, const Standard_Real Ang);

		/****************** Scale ******************/
		%feature("compactdefaultargs") Scale;
		%feature("autodoc", "No available documentation.

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
		%feature("autodoc", "Applies a scaling transformation on the axis placement. the 'location' point of the axisplacement is modified. warnings : if the scale <s> is negative : . the main direction of the axis placement is not changed. . the 'xdirection' and the 'ydirection' are reversed. so the axis placement stay right handed.

Parameters
----------
P: gp_Pnt
S: float

Returns
-------
gp_Ax2
") Scaled;
		gp_Ax2 Scaled(const gp_Pnt & P, const Standard_Real S);

		/****************** SetAxis ******************/
		%feature("compactdefaultargs") SetAxis;
		%feature("autodoc", "Assigns the origin and 'main direction' of the axis a1 to this coordinate system, then recomputes its 'x direction' and 'y direction'. note: the new 'x direction' is computed as follows: new 'x direction' = v1 ^(previous 'x direction' ^ v) where v is the 'direction' of a1. exceptions standard_constructionerror if a1 is parallel to the 'x direction' of this coordinate system.

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
		%feature("autodoc", "Changes the 'main direction' of this coordinate system, then recomputes its 'x direction' and 'y direction'. note: the new 'x direction' is computed as follows: new 'x direction' = v ^ (previous 'x direction' ^ v) exceptions standard_constructionerror if v is parallel to the 'x direction' of this coordinate system.

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
		%feature("autodoc", "Changes the 'location' point (origin) of <self>.

Parameters
----------
P: gp_Pnt

Returns
-------
None
") SetLocation;
		void SetLocation(const gp_Pnt & P);

		/****************** SetXDirection ******************/
		%feature("compactdefaultargs") SetXDirection;
		%feature("autodoc", "Changes the 'xdirection' of <self>. the main direction 'direction' is not modified, the 'ydirection' is modified. if <vx> is not normal to the main direction then <xdirection> is computed as follows xdirection = direction ^ (vx ^ direction). exceptions standard_constructionerror if vx or vy is parallel to the 'main direction' of this coordinate system.

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
		%feature("autodoc", "Changes the 'ydirection' of <self>. the main direction is not modified but the 'xdirection' is changed. if <vy> is not normal to the main direction then 'ydirection' is computed as follows ydirection = direction ^ (<vy> ^ direction). exceptions standard_constructionerror if vx or vy is parallel to the 'main direction' of this coordinate system.

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
		%feature("autodoc", "No available documentation.

Parameters
----------
T: gp_Trsf

Returns
-------
None
") Transform;
		void Transform(const gp_Trsf & T);

		/****************** Transformed ******************/
		%feature("compactdefaultargs") Transformed;
		%feature("autodoc", "Transforms an axis placement with a trsf. the 'location' point, the 'xdirection' and the 'ydirection' are transformed with t. the resulting main 'direction' of <self> is the cross product between the 'xdirection' and the 'ydirection' after transformation.

Parameters
----------
T: gp_Trsf

Returns
-------
gp_Ax2
") Transformed;
		gp_Ax2 Transformed(const gp_Trsf & T);

		/****************** Translate ******************/
		%feature("compactdefaultargs") Translate;
		%feature("autodoc", "No available documentation.

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
		%feature("autodoc", "No available documentation.

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
		%feature("autodoc", "Translates an axis plaxement in the direction of the vector <v>. the magnitude of the translation is the vector's magnitude.

Parameters
----------
V: gp_Vec

Returns
-------
gp_Ax2
") Translated;
		gp_Ax2 Translated(const gp_Vec & V);

		/****************** Translated ******************/
		%feature("compactdefaultargs") Translated;
		%feature("autodoc", "Translates an axis placement from the point <p1> to the point <p2>.

Parameters
----------
P1: gp_Pnt
P2: gp_Pnt

Returns
-------
gp_Ax2
") Translated;
		gp_Ax2 Translated(const gp_Pnt & P1, const gp_Pnt & P2);

		/****************** XDirection ******************/
		%feature("compactdefaultargs") XDirection;
		%feature("autodoc", "Returns the 'xdirection' of <self>.

Returns
-------
gp_Dir
") XDirection;
		const gp_Dir XDirection();

		/****************** YDirection ******************/
		%feature("compactdefaultargs") YDirection;
		%feature("autodoc", "Returns the 'ydirection' of <self>.

Returns
-------
gp_Dir
") YDirection;
		const gp_Dir YDirection();

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
		/****************** gp_Ax22d ******************/
		%feature("compactdefaultargs") gp_Ax22d;
		%feature("autodoc", "Creates an object representing the reference co-ordinate system (oxy).

Returns
-------
None
") gp_Ax22d;
		 gp_Ax22d();

		/****************** gp_Ax22d ******************/
		%feature("compactdefaultargs") gp_Ax22d;
		%feature("autodoc", "Creates a coordinate system with origin p and where: - vx is the 'x direction', and - the 'y direction' is orthogonal to vx and oriented so that the cross products vx^'y direction' and vx^vy have the same sign. raises constructionerror if vx and vy are parallel (same or opposite orientation).

Parameters
----------
P: gp_Pnt2d
Vx: gp_Dir2d
Vy: gp_Dir2d

Returns
-------
None
") gp_Ax22d;
		 gp_Ax22d(const gp_Pnt2d & P, const gp_Dir2d & Vx, const gp_Dir2d & Vy);

		/****************** gp_Ax22d ******************/
		%feature("compactdefaultargs") gp_Ax22d;
		%feature("autodoc", "Creates - a coordinate system with origin p and 'x direction' v, which is: - right-handed if sense is true (default value), or - left-handed if sense is false.

Parameters
----------
P: gp_Pnt2d
V: gp_Dir2d
Sense: bool,optional
	default value is Standard_True

Returns
-------
None
") gp_Ax22d;
		 gp_Ax22d(const gp_Pnt2d & P, const gp_Dir2d & V, const Standard_Boolean Sense = Standard_True);

		/****************** gp_Ax22d ******************/
		%feature("compactdefaultargs") gp_Ax22d;
		%feature("autodoc", "Creates - a coordinate system where its origin is the origin of a and its 'x direction' is the unit vector of a, which is: - right-handed if sense is true (default value), or - left-handed if sense is false.

Parameters
----------
A: gp_Ax2d
Sense: bool,optional
	default value is Standard_True

Returns
-------
None
") gp_Ax22d;
		 gp_Ax22d(const gp_Ax2d & A, const Standard_Boolean Sense = Standard_True);

		/****************** Location ******************/
		%feature("compactdefaultargs") Location;
		%feature("autodoc", "Returns the 'location' point (origin) of <self>.

Returns
-------
gp_Pnt2d
") Location;
		const gp_Pnt2d Location();

		/****************** Mirror ******************/
		%feature("compactdefaultargs") Mirror;
		%feature("autodoc", "No available documentation.

Parameters
----------
P: gp_Pnt2d

Returns
-------
None
") Mirror;
		void Mirror(const gp_Pnt2d & P);

		/****************** Mirror ******************/
		%feature("compactdefaultargs") Mirror;
		%feature("autodoc", "No available documentation.

Parameters
----------
A: gp_Ax2d

Returns
-------
None
") Mirror;
		void Mirror(const gp_Ax2d & A);

		/****************** Mirrored ******************/
		%feature("compactdefaultargs") Mirrored;
		%feature("autodoc", "Performs the symmetrical transformation of an axis placement with respect to the point p which is the center of the symmetry. warnings : the main direction of the axis placement is not changed. the 'xdirection' and the 'ydirection' are reversed. so the axis placement stay right handed.

Parameters
----------
P: gp_Pnt2d

Returns
-------
gp_Ax22d
") Mirrored;
		gp_Ax22d Mirrored(const gp_Pnt2d & P);

		/****************** Mirrored ******************/
		%feature("compactdefaultargs") Mirrored;
		%feature("autodoc", "Performs the symmetrical transformation of an axis placement with respect to an axis placement which is the axis of the symmetry. the transformation is performed on the 'location' point, on the 'xdirection' and 'ydirection'. the resulting main 'direction' is the cross product between the 'xdirection' and the 'ydirection' after transformation.

Parameters
----------
A: gp_Ax2d

Returns
-------
gp_Ax22d
") Mirrored;
		gp_Ax22d Mirrored(const gp_Ax2d & A);

		/****************** Rotate ******************/
		%feature("compactdefaultargs") Rotate;
		%feature("autodoc", "No available documentation.

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
		%feature("compactdefaultargs") Rotated;
		%feature("autodoc", "Rotates an axis placement. <a1> is the axis of the rotation . ang is the angular value of the rotation in radians.

Parameters
----------
P: gp_Pnt2d
Ang: float

Returns
-------
gp_Ax22d
") Rotated;
		gp_Ax22d Rotated(const gp_Pnt2d & P, const Standard_Real Ang);

		/****************** Scale ******************/
		%feature("compactdefaultargs") Scale;
		%feature("autodoc", "No available documentation.

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
		%feature("compactdefaultargs") Scaled;
		%feature("autodoc", "Applies a scaling transformation on the axis placement. the 'location' point of the axisplacement is modified. warnings : if the scale <s> is negative : . the main direction of the axis placement is not changed. . the 'xdirection' and the 'ydirection' are reversed. so the axis placement stay right handed.

Parameters
----------
P: gp_Pnt2d
S: float

Returns
-------
gp_Ax22d
") Scaled;
		gp_Ax22d Scaled(const gp_Pnt2d & P, const Standard_Real S);

		/****************** SetAxis ******************/
		%feature("compactdefaultargs") SetAxis;
		%feature("autodoc", "Assigns the origin and the two unit vectors of the coordinate system a1 to this coordinate system.

Parameters
----------
A1: gp_Ax22d

Returns
-------
None
") SetAxis;
		void SetAxis(const gp_Ax22d & A1);

		/****************** SetLocation ******************/
		%feature("compactdefaultargs") SetLocation;
		%feature("autodoc", "Changes the 'location' point (origin) of <self>.

Parameters
----------
P: gp_Pnt2d

Returns
-------
None
") SetLocation;
		void SetLocation(const gp_Pnt2d & P);

		/****************** SetXAxis ******************/
		%feature("compactdefaultargs") SetXAxis;
		%feature("autodoc", "Changes the xaxis and yaxis ('location' point and 'direction') of <self>. the 'ydirection' is recomputed in the same sense as before.

Parameters
----------
A1: gp_Ax2d

Returns
-------
None
") SetXAxis;
		void SetXAxis(const gp_Ax2d & A1);

		/****************** SetXDirection ******************/
		%feature("compactdefaultargs") SetXDirection;
		%feature("autodoc", "Assigns vx to the 'x direction' of this coordinate system. the other unit vector of this coordinate system is recomputed, normal to vx , without modifying the orientation (right-handed or left-handed) of this coordinate system.

Parameters
----------
Vx: gp_Dir2d

Returns
-------
None
") SetXDirection;
		void SetXDirection(const gp_Dir2d & Vx);

		/****************** SetYAxis ******************/
		%feature("compactdefaultargs") SetYAxis;
		%feature("autodoc", "Changes the xaxis and yaxis ('location' point and 'direction') of <self>. the 'xdirection' is recomputed in the same sense as before.

Parameters
----------
A1: gp_Ax2d

Returns
-------
None
") SetYAxis;
		void SetYAxis(const gp_Ax2d & A1);

		/****************** SetYDirection ******************/
		%feature("compactdefaultargs") SetYDirection;
		%feature("autodoc", "Assignsr vy to the 'y direction' of this coordinate system. the other unit vector of this coordinate system is recomputed, normal to vy, without modifying the orientation (right-handed or left-handed) of this coordinate system.

Parameters
----------
Vy: gp_Dir2d

Returns
-------
None
") SetYDirection;
		void SetYDirection(const gp_Dir2d & Vy);

		/****************** Transform ******************/
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

		/****************** Transformed ******************/
		%feature("compactdefaultargs") Transformed;
		%feature("autodoc", "Transforms an axis placement with a trsf. the 'location' point, the 'xdirection' and the 'ydirection' are transformed with t. the resulting main 'direction' of <self> is the cross product between the 'xdirection' and the 'ydirection' after transformation.

Parameters
----------
T: gp_Trsf2d

Returns
-------
gp_Ax22d
") Transformed;
		gp_Ax22d Transformed(const gp_Trsf2d & T);

		/****************** Translate ******************/
		%feature("compactdefaultargs") Translate;
		%feature("autodoc", "No available documentation.

Parameters
----------
V: gp_Vec2d

Returns
-------
None
") Translate;
		void Translate(const gp_Vec2d & V);

		/****************** Translate ******************/
		%feature("compactdefaultargs") Translate;
		%feature("autodoc", "No available documentation.

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
		%feature("compactdefaultargs") Translated;
		%feature("autodoc", "Translates an axis plaxement in the direction of the vector <v>. the magnitude of the translation is the vector's magnitude.

Parameters
----------
V: gp_Vec2d

Returns
-------
gp_Ax22d
") Translated;
		gp_Ax22d Translated(const gp_Vec2d & V);

		/****************** Translated ******************/
		%feature("compactdefaultargs") Translated;
		%feature("autodoc", "Translates an axis placement from the point <p1> to the point <p2>.

Parameters
----------
P1: gp_Pnt2d
P2: gp_Pnt2d

Returns
-------
gp_Ax22d
") Translated;
		gp_Ax22d Translated(const gp_Pnt2d & P1, const gp_Pnt2d & P2);

		/****************** XAxis ******************/
		%feature("compactdefaultargs") XAxis;
		%feature("autodoc", "Returns an axis, for which - the origin is that of this coordinate system, and - the unit vector is either the 'x direction' of this coordinate system. note: the result is the 'x axis' of this coordinate system.

Returns
-------
gp_Ax2d
") XAxis;
		gp_Ax2d XAxis();

		/****************** XDirection ******************/
		%feature("compactdefaultargs") XDirection;
		%feature("autodoc", "Returns the 'xdirection' of <self>.

Returns
-------
gp_Dir2d
") XDirection;
		const gp_Dir2d XDirection();

		/****************** YAxis ******************/
		%feature("compactdefaultargs") YAxis;
		%feature("autodoc", "Returns an axis, for which - the origin is that of this coordinate system, and - the unit vector is either the 'y direction' of this coordinate system. note: the result is the 'y axis' of this coordinate system.

Returns
-------
gp_Ax2d
") YAxis;
		gp_Ax2d YAxis();

		/****************** YDirection ******************/
		%feature("compactdefaultargs") YDirection;
		%feature("autodoc", "Returns the 'ydirection' of <self>.

Returns
-------
gp_Dir2d
") YDirection;
		const gp_Dir2d YDirection();

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
		/****************** gp_Ax2d ******************/
		%feature("compactdefaultargs") gp_Ax2d;
		%feature("autodoc", "Creates an axis object representing x axis of the reference co-ordinate system.

Returns
-------
None
") gp_Ax2d;
		 gp_Ax2d();

		/****************** gp_Ax2d ******************/
		%feature("compactdefaultargs") gp_Ax2d;
		%feature("autodoc", "Creates an ax2d. <p> is the 'location' point of the axis placement and v is the 'direction' of the axis placement.

Parameters
----------
P: gp_Pnt2d
V: gp_Dir2d

Returns
-------
None
") gp_Ax2d;
		 gp_Ax2d(const gp_Pnt2d & P, const gp_Dir2d & V);

		/****************** Angle ******************/
		%feature("compactdefaultargs") Angle;
		%feature("autodoc", "Computes the angle, in radians, between this axis and the axis other. the value of the angle is between -pi and pi.

Parameters
----------
Other: gp_Ax2d

Returns
-------
float
") Angle;
		Standard_Real Angle(const gp_Ax2d & Other);

		/****************** Direction ******************/
		%feature("compactdefaultargs") Direction;
		%feature("autodoc", "Returns the direction of <self>.

Returns
-------
gp_Dir2d
") Direction;
		const gp_Dir2d Direction();

		/****************** IsCoaxial ******************/
		%feature("compactdefaultargs") IsCoaxial;
		%feature("autodoc", "Returns true if : . the angle between <self> and <other> is lower or equal to <angulartolerance> and . the distance between <self>.location() and <other> is lower or equal to <lineartolerance> and . the distance between <other>.location() and <self> is lower or equal to lineartolerance.

Parameters
----------
Other: gp_Ax2d
AngularTolerance: float
LinearTolerance: float

Returns
-------
bool
") IsCoaxial;
		Standard_Boolean IsCoaxial(const gp_Ax2d & Other, const Standard_Real AngularTolerance, const Standard_Real LinearTolerance);

		/****************** IsNormal ******************/
		%feature("compactdefaultargs") IsNormal;
		%feature("autodoc", "Returns true if this axis and the axis other are normal to each other. that is, if the angle between the two axes is equal to pi/2 or -pi/2. note: the tolerance criterion is given by angulartolerance.

Parameters
----------
Other: gp_Ax2d
AngularTolerance: float

Returns
-------
bool
") IsNormal;
		Standard_Boolean IsNormal(const gp_Ax2d & Other, const Standard_Real AngularTolerance);

		/****************** IsOpposite ******************/
		%feature("compactdefaultargs") IsOpposite;
		%feature("autodoc", "Returns true if this axis and the axis other are parallel, and have opposite orientations. that is, if the angle between the two axes is equal to pi or -pi. note: the tolerance criterion is given by angulartolerance.

Parameters
----------
Other: gp_Ax2d
AngularTolerance: float

Returns
-------
bool
") IsOpposite;
		Standard_Boolean IsOpposite(const gp_Ax2d & Other, const Standard_Real AngularTolerance);

		/****************** IsParallel ******************/
		%feature("compactdefaultargs") IsParallel;
		%feature("autodoc", "Returns true if this axis and the axis other are parallel, and have either the same or opposite orientations. that is, if the angle between the two axes is equal to 0, pi or -pi. note: the tolerance criterion is given by angulartolerance.

Parameters
----------
Other: gp_Ax2d
AngularTolerance: float

Returns
-------
bool
") IsParallel;
		Standard_Boolean IsParallel(const gp_Ax2d & Other, const Standard_Real AngularTolerance);

		/****************** Location ******************/
		%feature("compactdefaultargs") Location;
		%feature("autodoc", "Returns the origin of <self>.

Returns
-------
gp_Pnt2d
") Location;
		const gp_Pnt2d Location();

		/****************** Mirror ******************/
		%feature("compactdefaultargs") Mirror;
		%feature("autodoc", "No available documentation.

Parameters
----------
P: gp_Pnt2d

Returns
-------
None
") Mirror;
		void Mirror(const gp_Pnt2d & P);

		/****************** Mirror ******************/
		%feature("compactdefaultargs") Mirror;
		%feature("autodoc", "No available documentation.

Parameters
----------
A: gp_Ax2d

Returns
-------
None
") Mirror;
		void Mirror(const gp_Ax2d & A);

		/****************** Mirrored ******************/
		%feature("compactdefaultargs") Mirrored;
		%feature("autodoc", "Performs the symmetrical transformation of an axis placement with respect to the point p which is the center of the symmetry.

Parameters
----------
P: gp_Pnt2d

Returns
-------
gp_Ax2d
") Mirrored;
		gp_Ax2d Mirrored(const gp_Pnt2d & P);

		/****************** Mirrored ******************/
		%feature("compactdefaultargs") Mirrored;
		%feature("autodoc", "Performs the symmetrical transformation of an axis placement with respect to an axis placement which is the axis of the symmetry.

Parameters
----------
A: gp_Ax2d

Returns
-------
gp_Ax2d
") Mirrored;
		gp_Ax2d Mirrored(const gp_Ax2d & A);

		/****************** Reverse ******************/
		%feature("compactdefaultargs") Reverse;
		%feature("autodoc", "Reverses the direction of <self> and assigns the result to this axis.

Returns
-------
None
") Reverse;
		void Reverse();

		/****************** Reversed ******************/
		%feature("compactdefaultargs") Reversed;
		%feature("autodoc", "Computes a new axis placement with a direction opposite to the direction of <self>.

Returns
-------
gp_Ax2d
") Reversed;
		gp_Ax2d Reversed();

		/****************** Rotate ******************/
		%feature("compactdefaultargs") Rotate;
		%feature("autodoc", "No available documentation.

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
		%feature("compactdefaultargs") Rotated;
		%feature("autodoc", "Rotates an axis placement. <p> is the center of the rotation . ang is the angular value of the rotation in radians.

Parameters
----------
P: gp_Pnt2d
Ang: float

Returns
-------
gp_Ax2d
") Rotated;
		gp_Ax2d Rotated(const gp_Pnt2d & P, const Standard_Real Ang);

		/****************** Scale ******************/
		%feature("compactdefaultargs") Scale;
		%feature("autodoc", "No available documentation.

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
		%feature("compactdefaultargs") Scaled;
		%feature("autodoc", "Applies a scaling transformation on the axis placement. the 'location' point of the axisplacement is modified. the 'direction' is reversed if the scale is negative.

Parameters
----------
P: gp_Pnt2d
S: float

Returns
-------
gp_Ax2d
") Scaled;
		gp_Ax2d Scaled(const gp_Pnt2d & P, const Standard_Real S);

		/****************** SetDirection ******************/
		%feature("compactdefaultargs") SetDirection;
		%feature("autodoc", "Changes the direction of <self>.

Parameters
----------
V: gp_Dir2d

Returns
-------
None
") SetDirection;
		void SetDirection(const gp_Dir2d & V);

		/****************** SetLocation ******************/
		%feature("compactdefaultargs") SetLocation;
		%feature("autodoc", "Changes the 'location' point (origin) of <self>.

Parameters
----------
Locat: gp_Pnt2d

Returns
-------
None
") SetLocation;
		void SetLocation(const gp_Pnt2d & Locat);

		/****************** Transform ******************/
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

		/****************** Transformed ******************/
		%feature("compactdefaultargs") Transformed;
		%feature("autodoc", "Transforms an axis placement with a trsf.

Parameters
----------
T: gp_Trsf2d

Returns
-------
gp_Ax2d
") Transformed;
		gp_Ax2d Transformed(const gp_Trsf2d & T);

		/****************** Translate ******************/
		%feature("compactdefaultargs") Translate;
		%feature("autodoc", "No available documentation.

Parameters
----------
V: gp_Vec2d

Returns
-------
None
") Translate;
		void Translate(const gp_Vec2d & V);

		/****************** Translate ******************/
		%feature("compactdefaultargs") Translate;
		%feature("autodoc", "No available documentation.

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
		%feature("compactdefaultargs") Translated;
		%feature("autodoc", "Translates an axis placement in the direction of the vector <v>. the magnitude of the translation is the vector's magnitude.

Parameters
----------
V: gp_Vec2d

Returns
-------
gp_Ax2d
") Translated;
		gp_Ax2d Translated(const gp_Vec2d & V);

		/****************** Translated ******************/
		%feature("compactdefaultargs") Translated;
		%feature("autodoc", "Translates an axis placement from the point <p1> to the point <p2>.

Parameters
----------
P1: gp_Pnt2d
P2: gp_Pnt2d

Returns
-------
gp_Ax2d
") Translated;
		gp_Ax2d Translated(const gp_Pnt2d & P1, const gp_Pnt2d & P2);

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
		/****************** gp_Ax3 ******************/
		%feature("compactdefaultargs") gp_Ax3;
		%feature("autodoc", "Creates an object corresponding to the reference coordinate system (oxyz).

Returns
-------
None
") gp_Ax3;
		 gp_Ax3();

		/****************** gp_Ax3 ******************/
		%feature("compactdefaultargs") gp_Ax3;
		%feature("autodoc", "Creates a coordinate system from a right-handed coordinate system.

Parameters
----------
A: gp_Ax2

Returns
-------
None
") gp_Ax3;
		 gp_Ax3(const gp_Ax2 & A);

		/****************** gp_Ax3 ******************/
		%feature("compactdefaultargs") gp_Ax3;
		%feature("autodoc", "Creates a right handed axis placement with the 'location' point p and two directions, n gives the 'direction' and vx gives the 'xdirection'. raises constructionerror if n and vx are parallel (same or opposite orientation).

Parameters
----------
P: gp_Pnt
N: gp_Dir
Vx: gp_Dir

Returns
-------
None
") gp_Ax3;
		 gp_Ax3(const gp_Pnt & P, const gp_Dir & N, const gp_Dir & Vx);

		/****************** gp_Ax3 ******************/
		%feature("compactdefaultargs") gp_Ax3;
		%feature("autodoc", "Creates an axis placement with the 'location' point <p> and the normal direction <v>.

Parameters
----------
P: gp_Pnt
V: gp_Dir

Returns
-------
None
") gp_Ax3;
		 gp_Ax3(const gp_Pnt & P, const gp_Dir & V);

		/****************** Angle ******************/
		%feature("compactdefaultargs") Angle;
		%feature("autodoc", "Computes the angular value between the main direction of <self> and the main direction of <other>. returns the angle between 0 and pi in radians.

Parameters
----------
Other: gp_Ax3

Returns
-------
float
") Angle;
		Standard_Real Angle(const gp_Ax3 & Other);

		/****************** Ax2 ******************/
		%feature("compactdefaultargs") Ax2;
		%feature("autodoc", "Computes a right-handed coordinate system with the same 'x direction' and 'y direction' as those of this coordinate system, then recomputes the 'main direction'. if this coordinate system is right-handed, the result returned is the same coordinate system. if this coordinate system is left-handed, the result is reversed.

Returns
-------
gp_Ax2
") Ax2;
		gp_Ax2 Ax2();

		/****************** Axis ******************/
		%feature("compactdefaultargs") Axis;
		%feature("autodoc", "Returns the main axis of <self>. it is the 'location' point and the main 'direction'.

Returns
-------
gp_Ax1
") Axis;
		const gp_Ax1 Axis();

		/****************** Direct ******************/
		%feature("compactdefaultargs") Direct;
		%feature("autodoc", "Returns true if the coordinate system is right-handed. i.e. xdirection().crossed(ydirection()).dot(direction()) > 0.

Returns
-------
bool
") Direct;
		Standard_Boolean Direct();

		/****************** Direction ******************/
		%feature("compactdefaultargs") Direction;
		%feature("autodoc", "Returns the main direction of <self>.

Returns
-------
gp_Dir
") Direction;
		const gp_Dir Direction();

		/****************** IsCoplanar ******************/
		%feature("compactdefaultargs") IsCoplanar;
		%feature("autodoc", "Returns true if . the distance between the 'location' point of <self> and <other> is lower or equal to lineartolerance and . the distance between the 'location' point of <other> and <self> is lower or equal to lineartolerance and . the main direction of <self> and the main direction of <other> are parallel (same or opposite orientation).

Parameters
----------
Other: gp_Ax3
LinearTolerance: float
AngularTolerance: float

Returns
-------
bool
") IsCoplanar;
		Standard_Boolean IsCoplanar(const gp_Ax3 & Other, const Standard_Real LinearTolerance, const Standard_Real AngularTolerance);

		/****************** IsCoplanar ******************/
		%feature("compactdefaultargs") IsCoplanar;
		%feature("autodoc", "Returns true if . the distance between <self> and the 'location' point of a1 is lower of equal to lineartolerance and . the distance between a1 and the 'location' point of <self> is lower or equal to lineartolerance and . the main direction of <self> and the direction of a1 are normal.

Parameters
----------
A1: gp_Ax1
LinearTolerance: float
AngularTolerance: float

Returns
-------
bool
") IsCoplanar;
		Standard_Boolean IsCoplanar(const gp_Ax1 & A1, const Standard_Real LinearTolerance, const Standard_Real AngularTolerance);

		/****************** Location ******************/
		%feature("compactdefaultargs") Location;
		%feature("autodoc", "Returns the 'location' point (origin) of <self>.

Returns
-------
gp_Pnt
") Location;
		const gp_Pnt Location();

		/****************** Mirror ******************/
		%feature("compactdefaultargs") Mirror;
		%feature("autodoc", "No available documentation.

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
		%feature("autodoc", "No available documentation.

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
		%feature("autodoc", "No available documentation.

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
		%feature("autodoc", "Performs the symmetrical transformation of an axis placement with respect to the point p which is the center of the symmetry. warnings : the main direction of the axis placement is not changed. the 'xdirection' and the 'ydirection' are reversed. so the axis placement stay right handed.

Parameters
----------
P: gp_Pnt

Returns
-------
gp_Ax3
") Mirrored;
		gp_Ax3 Mirrored(const gp_Pnt & P);

		/****************** Mirrored ******************/
		%feature("compactdefaultargs") Mirrored;
		%feature("autodoc", "Performs the symmetrical transformation of an axis placement with respect to an axis placement which is the axis of the symmetry. the transformation is performed on the 'location' point, on the 'xdirection' and 'ydirection'. the resulting main 'direction' is the cross product between the 'xdirection' and the 'ydirection' after transformation.

Parameters
----------
A1: gp_Ax1

Returns
-------
gp_Ax3
") Mirrored;
		gp_Ax3 Mirrored(const gp_Ax1 & A1);

		/****************** Mirrored ******************/
		%feature("compactdefaultargs") Mirrored;
		%feature("autodoc", "Performs the symmetrical transformation of an axis placement with respect to a plane. the axis placement <a2> locates the plane of the symmetry : (location, xdirection, ydirection). the transformation is performed on the 'location' point, on the 'xdirection' and 'ydirection'. the resulting main 'direction' is the cross product between the 'xdirection' and the 'ydirection' after transformation.

Parameters
----------
A2: gp_Ax2

Returns
-------
gp_Ax3
") Mirrored;
		gp_Ax3 Mirrored(const gp_Ax2 & A2);

		/****************** Rotate ******************/
		%feature("compactdefaultargs") Rotate;
		%feature("autodoc", "No available documentation.

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
		%feature("autodoc", "Rotates an axis placement. <a1> is the axis of the rotation . ang is the angular value of the rotation in radians.

Parameters
----------
A1: gp_Ax1
Ang: float

Returns
-------
gp_Ax3
") Rotated;
		gp_Ax3 Rotated(const gp_Ax1 & A1, const Standard_Real Ang);

		/****************** Scale ******************/
		%feature("compactdefaultargs") Scale;
		%feature("autodoc", "No available documentation.

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
		%feature("autodoc", "Applies a scaling transformation on the axis placement. the 'location' point of the axisplacement is modified. warnings : if the scale <s> is negative : . the main direction of the axis placement is not changed. . the 'xdirection' and the 'ydirection' are reversed. so the axis placement stay right handed.

Parameters
----------
P: gp_Pnt
S: float

Returns
-------
gp_Ax3
") Scaled;
		gp_Ax3 Scaled(const gp_Pnt & P, const Standard_Real S);

		/****************** SetAxis ******************/
		%feature("compactdefaultargs") SetAxis;
		%feature("autodoc", "Assigns the origin and 'main direction' of the axis a1 to this coordinate system, then recomputes its 'x direction' and 'y direction'. note: - the new 'x direction' is computed as follows: new 'x direction' = v1 ^(previous 'x direction' ^ v) where v is the 'direction' of a1. - the orientation of this coordinate system (right-handed or left-handed) is not modified. raises constructionerror if the 'direction' of <a1> and the 'xdirection' of <self> are parallel (same or opposite orientation) because it is impossible to calculate the new 'xdirection' and the new 'ydirection'.

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
		%feature("autodoc", "Changes the main direction of this coordinate system, then recomputes its 'x direction' and 'y direction'. note: - the new 'x direction' is computed as follows: new 'x direction' = v ^ (previous 'x direction' ^ v). - the orientation of this coordinate system (left- or right-handed) is not modified. raises constructionerror if <v< and the previous 'xdirection' are parallel because it is impossible to calculate the new 'xdirection' and the new 'ydirection'.

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
		%feature("autodoc", "Changes the 'location' point (origin) of <self>.

Parameters
----------
P: gp_Pnt

Returns
-------
None
") SetLocation;
		void SetLocation(const gp_Pnt & P);

		/****************** SetXDirection ******************/
		%feature("compactdefaultargs") SetXDirection;
		%feature("autodoc", "Changes the 'xdirection' of <self>. the main direction 'direction' is not modified, the 'ydirection' is modified. if <vx> is not normal to the main direction then <xdirection> is computed as follows xdirection = direction ^ (vx ^ direction). raises constructionerror if <vx> is parallel (same or opposite orientation) to the main direction of <self>.

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
		%feature("autodoc", "Changes the 'ydirection' of <self>. the main direction is not modified but the 'xdirection' is changed. if <vy> is not normal to the main direction then 'ydirection' is computed as follows ydirection = direction ^ (<vy> ^ direction). raises constructionerror if <vy> is parallel to the main direction of <self>.

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
		%feature("autodoc", "No available documentation.

Parameters
----------
T: gp_Trsf

Returns
-------
None
") Transform;
		void Transform(const gp_Trsf & T);

		/****************** Transformed ******************/
		%feature("compactdefaultargs") Transformed;
		%feature("autodoc", "Transforms an axis placement with a trsf. the 'location' point, the 'xdirection' and the 'ydirection' are transformed with t. the resulting main 'direction' of <self> is the cross product between the 'xdirection' and the 'ydirection' after transformation.

Parameters
----------
T: gp_Trsf

Returns
-------
gp_Ax3
") Transformed;
		gp_Ax3 Transformed(const gp_Trsf & T);

		/****************** Translate ******************/
		%feature("compactdefaultargs") Translate;
		%feature("autodoc", "No available documentation.

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
		%feature("autodoc", "No available documentation.

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
		%feature("autodoc", "Translates an axis plaxement in the direction of the vector <v>. the magnitude of the translation is the vector's magnitude.

Parameters
----------
V: gp_Vec

Returns
-------
gp_Ax3
") Translated;
		gp_Ax3 Translated(const gp_Vec & V);

		/****************** Translated ******************/
		%feature("compactdefaultargs") Translated;
		%feature("autodoc", "Translates an axis placement from the point <p1> to the point <p2>.

Parameters
----------
P1: gp_Pnt
P2: gp_Pnt

Returns
-------
gp_Ax3
") Translated;
		gp_Ax3 Translated(const gp_Pnt & P1, const gp_Pnt & P2);

		/****************** XDirection ******************/
		%feature("compactdefaultargs") XDirection;
		%feature("autodoc", "Returns the 'xdirection' of <self>.

Returns
-------
gp_Dir
") XDirection;
		const gp_Dir XDirection();

		/****************** XReverse ******************/
		%feature("compactdefaultargs") XReverse;
		%feature("autodoc", "Reverses the x direction of <self>.

Returns
-------
None
") XReverse;
		void XReverse();

		/****************** YDirection ******************/
		%feature("compactdefaultargs") YDirection;
		%feature("autodoc", "Returns the 'ydirection' of <self>.

Returns
-------
gp_Dir
") YDirection;
		const gp_Dir YDirection();

		/****************** YReverse ******************/
		%feature("compactdefaultargs") YReverse;
		%feature("autodoc", "Reverses the y direction of <self>.

Returns
-------
None
") YReverse;
		void YReverse();

		/****************** ZReverse ******************/
		%feature("compactdefaultargs") ZReverse;
		%feature("autodoc", "Reverses the z direction of <self>.

Returns
-------
None
") ZReverse;
		void ZReverse();

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
		/****************** gp_Circ ******************/
		%feature("compactdefaultargs") gp_Circ;
		%feature("autodoc", "Creates an indefinite circle.

Returns
-------
None
") gp_Circ;
		 gp_Circ();

		/****************** gp_Circ ******************/
		%feature("compactdefaultargs") gp_Circ;
		%feature("autodoc", "A2 locates the circle and gives its orientation in 3d space. warnings : it is not forbidden to create a circle with radius = 0.0 raises constructionerror if radius < 0.0.

Parameters
----------
A2: gp_Ax2
Radius: float

Returns
-------
None
") gp_Circ;
		 gp_Circ(const gp_Ax2 & A2, const Standard_Real Radius);

		/****************** Area ******************/
		%feature("compactdefaultargs") Area;
		%feature("autodoc", "Computes the area of the circle.

Returns
-------
float
") Area;
		Standard_Real Area();

		/****************** Axis ******************/
		%feature("compactdefaultargs") Axis;
		%feature("autodoc", "Returns the main axis of the circle. it is the axis perpendicular to the plane of the circle, passing through the 'location' point (center) of the circle.

Returns
-------
gp_Ax1
") Axis;
		const gp_Ax1 Axis();

		/****************** Contains ******************/
		%feature("compactdefaultargs") Contains;
		%feature("autodoc", "Returns true if the point p is on the circumference. the distance between <self> and <p> must be lower or equal to lineartolerance.

Parameters
----------
P: gp_Pnt
LinearTolerance: float

Returns
-------
bool
") Contains;
		Standard_Boolean Contains(const gp_Pnt & P, const Standard_Real LinearTolerance);

		/****************** Distance ******************/
		%feature("compactdefaultargs") Distance;
		%feature("autodoc", "Computes the minimum of distance between the point p and any point on the circumference of the circle.

Parameters
----------
P: gp_Pnt

Returns
-------
float
") Distance;
		Standard_Real Distance(const gp_Pnt & P);

		/****************** Length ******************/
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "Computes the circumference of the circle.

Returns
-------
float
") Length;
		Standard_Real Length();

		/****************** Location ******************/
		%feature("compactdefaultargs") Location;
		%feature("autodoc", "Returns the center of the circle. it is the 'location' point of the local coordinate system of the circle.

Returns
-------
gp_Pnt
") Location;
		const gp_Pnt Location();

		/****************** Mirror ******************/
		%feature("compactdefaultargs") Mirror;
		%feature("autodoc", "No available documentation.

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
		%feature("autodoc", "No available documentation.

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
		%feature("autodoc", "No available documentation.

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
		%feature("autodoc", "Performs the symmetrical transformation of a circle with respect to the point p which is the center of the symmetry.

Parameters
----------
P: gp_Pnt

Returns
-------
gp_Circ
") Mirrored;
		gp_Circ Mirrored(const gp_Pnt & P);

		/****************** Mirrored ******************/
		%feature("compactdefaultargs") Mirrored;
		%feature("autodoc", "Performs the symmetrical transformation of a circle with respect to an axis placement which is the axis of the symmetry.

Parameters
----------
A1: gp_Ax1

Returns
-------
gp_Circ
") Mirrored;
		gp_Circ Mirrored(const gp_Ax1 & A1);

		/****************** Mirrored ******************/
		%feature("compactdefaultargs") Mirrored;
		%feature("autodoc", "Performs the symmetrical transformation of a circle with respect to a plane. the axis placement a2 locates the plane of the of the symmetry : (location, xdirection, ydirection).

Parameters
----------
A2: gp_Ax2

Returns
-------
gp_Circ
") Mirrored;
		gp_Circ Mirrored(const gp_Ax2 & A2);

		/****************** Position ******************/
		%feature("compactdefaultargs") Position;
		%feature("autodoc", "Returns the position of the circle. it is the local coordinate system of the circle.

Returns
-------
gp_Ax2
") Position;
		const gp_Ax2 Position();

		/****************** Radius ******************/
		%feature("compactdefaultargs") Radius;
		%feature("autodoc", "Returns the radius of this circle.

Returns
-------
float
") Radius;
		Standard_Real Radius();

		/****************** Rotate ******************/
		%feature("compactdefaultargs") Rotate;
		%feature("autodoc", "No available documentation.

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
		%feature("autodoc", "Rotates a circle. a1 is the axis of the rotation. ang is the angular value of the rotation in radians.

Parameters
----------
A1: gp_Ax1
Ang: float

Returns
-------
gp_Circ
") Rotated;
		gp_Circ Rotated(const gp_Ax1 & A1, const Standard_Real Ang);

		/****************** Scale ******************/
		%feature("compactdefaultargs") Scale;
		%feature("autodoc", "No available documentation.

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
		%feature("autodoc", "Scales a circle. s is the scaling value. warnings : if s is negative the radius stay positive but the 'xaxis' and the 'yaxis' are reversed as for an ellipse.

Parameters
----------
P: gp_Pnt
S: float

Returns
-------
gp_Circ
") Scaled;
		gp_Circ Scaled(const gp_Pnt & P, const Standard_Real S);

		/****************** SetAxis ******************/
		%feature("compactdefaultargs") SetAxis;
		%feature("autodoc", "Changes the main axis of the circle. it is the axis perpendicular to the plane of the circle. raises constructionerror if the direction of a1 is parallel to the 'xaxis' of the circle.

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
		%feature("autodoc", "Changes the 'location' point (center) of the circle.

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
		%feature("autodoc", "Changes the position of the circle.

Parameters
----------
A2: gp_Ax2

Returns
-------
None
") SetPosition;
		void SetPosition(const gp_Ax2 & A2);

		/****************** SetRadius ******************/
		%feature("compactdefaultargs") SetRadius;
		%feature("autodoc", "Modifies the radius of this circle. warning. this class does not prevent the creation of a circle where radius is null. exceptions standard_constructionerror if radius is negative.

Parameters
----------
Radius: float

Returns
-------
None
") SetRadius;
		void SetRadius(const Standard_Real Radius);

		/****************** SquareDistance ******************/
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "Computes the square distance between <self> and the point p.

Parameters
----------
P: gp_Pnt

Returns
-------
float
") SquareDistance;
		Standard_Real SquareDistance(const gp_Pnt & P);

		/****************** Transform ******************/
		%feature("compactdefaultargs") Transform;
		%feature("autodoc", "No available documentation.

Parameters
----------
T: gp_Trsf

Returns
-------
None
") Transform;
		void Transform(const gp_Trsf & T);

		/****************** Transformed ******************/
		%feature("compactdefaultargs") Transformed;
		%feature("autodoc", "Transforms a circle with the transformation t from class trsf.

Parameters
----------
T: gp_Trsf

Returns
-------
gp_Circ
") Transformed;
		gp_Circ Transformed(const gp_Trsf & T);

		/****************** Translate ******************/
		%feature("compactdefaultargs") Translate;
		%feature("autodoc", "No available documentation.

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
		%feature("autodoc", "No available documentation.

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
		%feature("autodoc", "Translates a circle in the direction of the vector v. the magnitude of the translation is the vector's magnitude.

Parameters
----------
V: gp_Vec

Returns
-------
gp_Circ
") Translated;
		gp_Circ Translated(const gp_Vec & V);

		/****************** Translated ******************/
		%feature("compactdefaultargs") Translated;
		%feature("autodoc", "Translates a circle from the point p1 to the point p2.

Parameters
----------
P1: gp_Pnt
P2: gp_Pnt

Returns
-------
gp_Circ
") Translated;
		gp_Circ Translated(const gp_Pnt & P1, const gp_Pnt & P2);

		/****************** XAxis ******************/
		%feature("compactdefaultargs") XAxis;
		%feature("autodoc", "Returns the 'xaxis' of the circle. this axis is perpendicular to the axis of the conic. this axis and the 'yaxis' define the plane of the conic.

Returns
-------
gp_Ax1
") XAxis;
		gp_Ax1 XAxis();

		/****************** YAxis ******************/
		%feature("compactdefaultargs") YAxis;
		%feature("autodoc", "Returns the 'yaxis' of the circle. this axis and the 'xaxis' define the plane of the conic. the 'yaxis' is perpendicular to the 'xaxis'.

Returns
-------
gp_Ax1
") YAxis;
		gp_Ax1 YAxis();

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
		/****************** gp_Circ2d ******************/
		%feature("compactdefaultargs") gp_Circ2d;
		%feature("autodoc", "Creates an indefinite circle.

Returns
-------
None
") gp_Circ2d;
		 gp_Circ2d();

		/****************** gp_Circ2d ******************/
		%feature("compactdefaultargs") gp_Circ2d;
		%feature("autodoc", "The location point of xaxis is the center of the circle. warnings : it is not forbidden to create a circle with radius = 0.0 raises constructionerror if radius < 0.0. raised if radius < 0.0.

Parameters
----------
XAxis: gp_Ax2d
Radius: float
Sense: bool,optional
	default value is Standard_True

Returns
-------
None
") gp_Circ2d;
		 gp_Circ2d(const gp_Ax2d & XAxis, const Standard_Real Radius, const Standard_Boolean Sense = Standard_True);

		/****************** gp_Circ2d ******************/
		%feature("compactdefaultargs") gp_Circ2d;
		%feature("autodoc", "Axis defines the xaxis and yaxis of the circle which defines the origin and the sense of parametrization. the location point of axis is the center of the circle. warnings : it is not forbidden to create a circle with radius = 0.0 raises constructionerror if radius < 0.0. raised if radius < 0.0.

Parameters
----------
Axis: gp_Ax22d
Radius: float

Returns
-------
None
") gp_Circ2d;
		 gp_Circ2d(const gp_Ax22d & Axis, const Standard_Real Radius);

		/****************** Area ******************/
		%feature("compactdefaultargs") Area;
		%feature("autodoc", "Computes the area of the circle.

Returns
-------
float
") Area;
		Standard_Real Area();

		/****************** Axis ******************/
		%feature("compactdefaultargs") Axis;
		%feature("autodoc", "Returns the position of the circle.

Returns
-------
gp_Ax22d
") Axis;
		const gp_Ax22d Axis();

		/****************** Coefficients ******************/
		%feature("compactdefaultargs") Coefficients;
		%feature("autodoc", "Returns the normalized coefficients from the implicit equation of the circle : a * (x**2) + b * (y**2) + 2*c*(x*y) + 2*d*x + 2*e*y + f = 0.0.

Parameters
----------

Returns
-------
A: float
B: float
C: float
D: float
E: float
F: float
") Coefficients;
		void Coefficients(Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** Contains ******************/
		%feature("compactdefaultargs") Contains;
		%feature("autodoc", "Does <self> contain p ? returns true if the distance between p and any point on the circumference of the circle is lower of equal to <lineartolerance>.

Parameters
----------
P: gp_Pnt2d
LinearTolerance: float

Returns
-------
bool
") Contains;
		Standard_Boolean Contains(const gp_Pnt2d & P, const Standard_Real LinearTolerance);

		/****************** Distance ******************/
		%feature("compactdefaultargs") Distance;
		%feature("autodoc", "Computes the minimum of distance between the point p and any point on the circumference of the circle.

Parameters
----------
P: gp_Pnt2d

Returns
-------
float
") Distance;
		Standard_Real Distance(const gp_Pnt2d & P);

		/****************** IsDirect ******************/
		%feature("compactdefaultargs") IsDirect;
		%feature("autodoc", "Returns true if the local coordinate system is direct and false in the other case.

Returns
-------
bool
") IsDirect;
		Standard_Boolean IsDirect();

		/****************** Length ******************/
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "Computes the circumference of the circle.

Returns
-------
float
") Length;
		Standard_Real Length();

		/****************** Location ******************/
		%feature("compactdefaultargs") Location;
		%feature("autodoc", "Returns the location point (center) of the circle.

Returns
-------
gp_Pnt2d
") Location;
		const gp_Pnt2d Location();

		/****************** Mirror ******************/
		%feature("compactdefaultargs") Mirror;
		%feature("autodoc", "No available documentation.

Parameters
----------
P: gp_Pnt2d

Returns
-------
None
") Mirror;
		void Mirror(const gp_Pnt2d & P);

		/****************** Mirror ******************/
		%feature("compactdefaultargs") Mirror;
		%feature("autodoc", "No available documentation.

Parameters
----------
A: gp_Ax2d

Returns
-------
None
") Mirror;
		void Mirror(const gp_Ax2d & A);

		/****************** Mirrored ******************/
		%feature("compactdefaultargs") Mirrored;
		%feature("autodoc", "Performs the symmetrical transformation of a circle with respect to the point p which is the center of the symmetry.

Parameters
----------
P: gp_Pnt2d

Returns
-------
gp_Circ2d
") Mirrored;
		gp_Circ2d Mirrored(const gp_Pnt2d & P);

		/****************** Mirrored ******************/
		%feature("compactdefaultargs") Mirrored;
		%feature("autodoc", "Performs the symmetrical transformation of a circle with respect to an axis placement which is the axis of the symmetry.

Parameters
----------
A: gp_Ax2d

Returns
-------
gp_Circ2d
") Mirrored;
		gp_Circ2d Mirrored(const gp_Ax2d & A);

		/****************** Position ******************/
		%feature("compactdefaultargs") Position;
		%feature("autodoc", "Returns the position of the circle. idem axis(me).

Returns
-------
gp_Ax22d
") Position;
		const gp_Ax22d Position();

		/****************** Radius ******************/
		%feature("compactdefaultargs") Radius;
		%feature("autodoc", "Returns the radius value of the circle.

Returns
-------
float
") Radius;
		Standard_Real Radius();

		/****************** Reverse ******************/
		%feature("compactdefaultargs") Reverse;
		%feature("autodoc", "Reverses the orientation of the local coordinate system of this circle (the 'y direction' is reversed) and therefore changes the implicit orientation of this circle. reverse assigns the result to this circle,.

Returns
-------
None
") Reverse;
		void Reverse();

		/****************** Reversed ******************/
		%feature("compactdefaultargs") Reversed;
		%feature("autodoc", "Reverses the orientation of the local coordinate system of this circle (the 'y direction' is reversed) and therefore changes the implicit orientation of this circle. reversed creates a new circle.

Returns
-------
gp_Circ2d
") Reversed;
		gp_Circ2d Reversed();

		/****************** Rotate ******************/
		%feature("compactdefaultargs") Rotate;
		%feature("autodoc", "No available documentation.

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
		%feature("compactdefaultargs") Rotated;
		%feature("autodoc", "Rotates a circle. p is the center of the rotation. ang is the angular value of the rotation in radians.

Parameters
----------
P: gp_Pnt2d
Ang: float

Returns
-------
gp_Circ2d
") Rotated;
		gp_Circ2d Rotated(const gp_Pnt2d & P, const Standard_Real Ang);

		/****************** Scale ******************/
		%feature("compactdefaultargs") Scale;
		%feature("autodoc", "No available documentation.

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
		%feature("compactdefaultargs") Scaled;
		%feature("autodoc", "Scales a circle. s is the scaling value. warnings : if s is negative the radius stay positive but the 'xaxis' and the 'yaxis' are reversed as for an ellipse.

Parameters
----------
P: gp_Pnt2d
S: float

Returns
-------
gp_Circ2d
") Scaled;
		gp_Circ2d Scaled(const gp_Pnt2d & P, const Standard_Real S);

		/****************** SetAxis ******************/
		%feature("compactdefaultargs") SetAxis;
		%feature("autodoc", "Changes the x axis of the circle.

Parameters
----------
A: gp_Ax22d

Returns
-------
None
") SetAxis;
		void SetAxis(const gp_Ax22d & A);

		/****************** SetLocation ******************/
		%feature("compactdefaultargs") SetLocation;
		%feature("autodoc", "Changes the location point (center) of the circle.

Parameters
----------
P: gp_Pnt2d

Returns
-------
None
") SetLocation;
		void SetLocation(const gp_Pnt2d & P);

		/****************** SetRadius ******************/
		%feature("compactdefaultargs") SetRadius;
		%feature("autodoc", "Modifies the radius of this circle. this class does not prevent the creation of a circle where radius is null. exceptions standard_constructionerror if radius is negative.

Parameters
----------
Radius: float

Returns
-------
None
") SetRadius;
		void SetRadius(const Standard_Real Radius);

		/****************** SetXAxis ******************/
		%feature("compactdefaultargs") SetXAxis;
		%feature("autodoc", "Changes the x axis of the circle.

Parameters
----------
A: gp_Ax2d

Returns
-------
None
") SetXAxis;
		void SetXAxis(const gp_Ax2d & A);

		/****************** SetYAxis ******************/
		%feature("compactdefaultargs") SetYAxis;
		%feature("autodoc", "Changes the y axis of the circle.

Parameters
----------
A: gp_Ax2d

Returns
-------
None
") SetYAxis;
		void SetYAxis(const gp_Ax2d & A);

		/****************** SquareDistance ******************/
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "Computes the square distance between <self> and the point p.

Parameters
----------
P: gp_Pnt2d

Returns
-------
float
") SquareDistance;
		Standard_Real SquareDistance(const gp_Pnt2d & P);

		/****************** Transform ******************/
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

		/****************** Transformed ******************/
		%feature("compactdefaultargs") Transformed;
		%feature("autodoc", "Transforms a circle with the transformation t from class trsf2d.

Parameters
----------
T: gp_Trsf2d

Returns
-------
gp_Circ2d
") Transformed;
		gp_Circ2d Transformed(const gp_Trsf2d & T);

		/****************** Translate ******************/
		%feature("compactdefaultargs") Translate;
		%feature("autodoc", "No available documentation.

Parameters
----------
V: gp_Vec2d

Returns
-------
None
") Translate;
		void Translate(const gp_Vec2d & V);

		/****************** Translate ******************/
		%feature("compactdefaultargs") Translate;
		%feature("autodoc", "No available documentation.

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
		%feature("compactdefaultargs") Translated;
		%feature("autodoc", "Translates a circle in the direction of the vector v. the magnitude of the translation is the vector's magnitude.

Parameters
----------
V: gp_Vec2d

Returns
-------
gp_Circ2d
") Translated;
		gp_Circ2d Translated(const gp_Vec2d & V);

		/****************** Translated ******************/
		%feature("compactdefaultargs") Translated;
		%feature("autodoc", "Translates a circle from the point p1 to the point p2.

Parameters
----------
P1: gp_Pnt2d
P2: gp_Pnt2d

Returns
-------
gp_Circ2d
") Translated;
		gp_Circ2d Translated(const gp_Pnt2d & P1, const gp_Pnt2d & P2);

		/****************** XAxis ******************/
		%feature("compactdefaultargs") XAxis;
		%feature("autodoc", "Returns the x axis of the circle.

Returns
-------
gp_Ax2d
") XAxis;
		gp_Ax2d XAxis();

		/****************** YAxis ******************/
		%feature("compactdefaultargs") YAxis;
		%feature("autodoc", "Returns the y axis of the circle. reverses the direction of the circle.

Returns
-------
gp_Ax2d
") YAxis;
		gp_Ax2d YAxis();

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
		/****************** gp_Cone ******************/
		%feature("compactdefaultargs") gp_Cone;
		%feature("autodoc", "Creates an indefinite cone.

Returns
-------
None
") gp_Cone;
		 gp_Cone();

		/****************** gp_Cone ******************/
		%feature("compactdefaultargs") gp_Cone;
		%feature("autodoc", "Creates an infinite conical surface. a3 locates the cone in the space and defines the reference plane of the surface. ang is the conical surface semi-angle. its absolute value is in range ]0, pi/2[. radius is the radius of the circle in the reference plane of the cone. raises constructionerror * if radius is lower than 0.0 * abs(ang) < resolution from gp or abs(ang) >= (pi/2) - resolution.

Parameters
----------
A3: gp_Ax3
Ang: float
Radius: float

Returns
-------
None
") gp_Cone;
		 gp_Cone(const gp_Ax3 & A3, const Standard_Real Ang, const Standard_Real Radius);

		/****************** Apex ******************/
		%feature("compactdefaultargs") Apex;
		%feature("autodoc", "Computes the cone's top. the apex of the cone is on the negative side of the symmetry axis of the cone.

Returns
-------
gp_Pnt
") Apex;
		gp_Pnt Apex();

		/****************** Axis ******************/
		%feature("compactdefaultargs") Axis;
		%feature("autodoc", "Returns the symmetry axis of the cone.

Returns
-------
gp_Ax1
") Axis;
		const gp_Ax1 Axis();

		/****************** Coefficients ******************/
		%feature("compactdefaultargs") Coefficients;
		%feature("autodoc", "Computes the coefficients of the implicit equation of the quadric in the absolute cartesian coordinates system : a1.x**2 + a2.y**2 + a3.z**2 + 2.(b1.x.y + b2.x.z + b3.y.z) + 2.(c1.x + c2.y + c3.z) + d = 0.0.

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

		/****************** Direct ******************/
		%feature("compactdefaultargs") Direct;
		%feature("autodoc", "Returns true if the local coordinate system of this cone is right-handed.

Returns
-------
bool
") Direct;
		Standard_Boolean Direct();

		/****************** Location ******************/
		%feature("compactdefaultargs") Location;
		%feature("autodoc", "Returns the 'location' point of the cone.

Returns
-------
gp_Pnt
") Location;
		const gp_Pnt Location();

		/****************** Mirror ******************/
		%feature("compactdefaultargs") Mirror;
		%feature("autodoc", "No available documentation.

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
		%feature("autodoc", "No available documentation.

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
		%feature("autodoc", "No available documentation.

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
		%feature("autodoc", "Performs the symmetrical transformation of a cone with respect to the point p which is the center of the symmetry.

Parameters
----------
P: gp_Pnt

Returns
-------
gp_Cone
") Mirrored;
		gp_Cone Mirrored(const gp_Pnt & P);

		/****************** Mirrored ******************/
		%feature("compactdefaultargs") Mirrored;
		%feature("autodoc", "Performs the symmetrical transformation of a cone with respect to an axis placement which is the axis of the symmetry.

Parameters
----------
A1: gp_Ax1

Returns
-------
gp_Cone
") Mirrored;
		gp_Cone Mirrored(const gp_Ax1 & A1);

		/****************** Mirrored ******************/
		%feature("compactdefaultargs") Mirrored;
		%feature("autodoc", "Performs the symmetrical transformation of a cone with respect to a plane. the axis placement a2 locates the plane of the of the symmetry : (location, xdirection, ydirection).

Parameters
----------
A2: gp_Ax2

Returns
-------
gp_Cone
") Mirrored;
		gp_Cone Mirrored(const gp_Ax2 & A2);

		/****************** Position ******************/
		%feature("compactdefaultargs") Position;
		%feature("autodoc", "Returns the local coordinates system of the cone.

Returns
-------
gp_Ax3
") Position;
		const gp_Ax3 Position();

		/****************** RefRadius ******************/
		%feature("compactdefaultargs") RefRadius;
		%feature("autodoc", "Returns the radius of the cone in the reference plane.

Returns
-------
float
") RefRadius;
		Standard_Real RefRadius();

		/****************** Rotate ******************/
		%feature("compactdefaultargs") Rotate;
		%feature("autodoc", "No available documentation.

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
		%feature("autodoc", "Rotates a cone. a1 is the axis of the rotation. ang is the angular value of the rotation in radians.

Parameters
----------
A1: gp_Ax1
Ang: float

Returns
-------
gp_Cone
") Rotated;
		gp_Cone Rotated(const gp_Ax1 & A1, const Standard_Real Ang);

		/****************** Scale ******************/
		%feature("compactdefaultargs") Scale;
		%feature("autodoc", "No available documentation.

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
		%feature("autodoc", "Scales a cone. s is the scaling value. the absolute value of s is used to scale the cone.

Parameters
----------
P: gp_Pnt
S: float

Returns
-------
gp_Cone
") Scaled;
		gp_Cone Scaled(const gp_Pnt & P, const Standard_Real S);

		/****************** SemiAngle ******************/
		%feature("compactdefaultargs") SemiAngle;
		%feature("autodoc", "Returns the half-angle at the apex of this cone. attention! semi-angle can be negative.

Returns
-------
float
") SemiAngle;
		Standard_Real SemiAngle();

		/****************** SetAxis ******************/
		%feature("compactdefaultargs") SetAxis;
		%feature("autodoc", "Changes the symmetry axis of the cone. raises constructionerror the direction of a1 is parallel to the 'xdirection' of the coordinate system of the cone.

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
		%feature("autodoc", "Changes the location of the cone.

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
		%feature("autodoc", "Changes the local coordinate system of the cone. this coordinate system defines the reference plane of the cone.

Parameters
----------
A3: gp_Ax3

Returns
-------
None
") SetPosition;
		void SetPosition(const gp_Ax3 & A3);

		/****************** SetRadius ******************/
		%feature("compactdefaultargs") SetRadius;
		%feature("autodoc", "Changes the radius of the cone in the reference plane of the cone. raised if r < 0.0.

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
		%feature("autodoc", "Changes the semi-angle of the cone. semi-angle can be negative. its absolute value abs(ang) is in range ]0,pi/2[. raises constructionerror if abs(ang) < resolution from gp or abs(ang) >= pi/2 - resolution.

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
		%feature("autodoc", "No available documentation.

Parameters
----------
T: gp_Trsf

Returns
-------
None
") Transform;
		void Transform(const gp_Trsf & T);

		/****************** Transformed ******************/
		%feature("compactdefaultargs") Transformed;
		%feature("autodoc", "Transforms a cone with the transformation t from class trsf.

Parameters
----------
T: gp_Trsf

Returns
-------
gp_Cone
") Transformed;
		gp_Cone Transformed(const gp_Trsf & T);

		/****************** Translate ******************/
		%feature("compactdefaultargs") Translate;
		%feature("autodoc", "No available documentation.

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
		%feature("autodoc", "No available documentation.

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
		%feature("autodoc", "Translates a cone in the direction of the vector v. the magnitude of the translation is the vector's magnitude.

Parameters
----------
V: gp_Vec

Returns
-------
gp_Cone
") Translated;
		gp_Cone Translated(const gp_Vec & V);

		/****************** Translated ******************/
		%feature("compactdefaultargs") Translated;
		%feature("autodoc", "Translates a cone from the point p1 to the point p2.

Parameters
----------
P1: gp_Pnt
P2: gp_Pnt

Returns
-------
gp_Cone
") Translated;
		gp_Cone Translated(const gp_Pnt & P1, const gp_Pnt & P2);

		/****************** UReverse ******************/
		%feature("compactdefaultargs") UReverse;
		%feature("autodoc", "Reverses the u parametrization of the cone reversing the yaxis.

Returns
-------
None
") UReverse;
		void UReverse();

		/****************** VReverse ******************/
		%feature("compactdefaultargs") VReverse;
		%feature("autodoc", "Reverses the v parametrization of the cone reversing the zaxis.

Returns
-------
None
") VReverse;
		void VReverse();

		/****************** XAxis ******************/
		%feature("compactdefaultargs") XAxis;
		%feature("autodoc", "Returns the xaxis of the reference plane.

Returns
-------
gp_Ax1
") XAxis;
		gp_Ax1 XAxis();

		/****************** YAxis ******************/
		%feature("compactdefaultargs") YAxis;
		%feature("autodoc", "Returns the yaxis of the reference plane.

Returns
-------
gp_Ax1
") YAxis;
		gp_Ax1 YAxis();

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
		/****************** gp_Cylinder ******************/
		%feature("compactdefaultargs") gp_Cylinder;
		%feature("autodoc", "Creates a indefinite cylinder.

Returns
-------
None
") gp_Cylinder;
		 gp_Cylinder();

		/****************** gp_Cylinder ******************/
		%feature("compactdefaultargs") gp_Cylinder;
		%feature("autodoc", "Creates a cylinder of radius radius, whose axis is the 'main axis' of a3. a3 is the local coordinate system of the cylinder. raises constructionerrord if r < 0.0.

Parameters
----------
A3: gp_Ax3
Radius: float

Returns
-------
None
") gp_Cylinder;
		 gp_Cylinder(const gp_Ax3 & A3, const Standard_Real Radius);

		/****************** Axis ******************/
		%feature("compactdefaultargs") Axis;
		%feature("autodoc", "Returns the symmetry axis of the cylinder.

Returns
-------
gp_Ax1
") Axis;
		const gp_Ax1 Axis();

		/****************** Coefficients ******************/
		%feature("compactdefaultargs") Coefficients;
		%feature("autodoc", "Computes the coefficients of the implicit equation of the quadric in the absolute cartesian coordinate system : a1.x**2 + a2.y**2 + a3.z**2 + 2.(b1.x.y + b2.x.z + b3.y.z) + 2.(c1.x + c2.y + c3.z) + d = 0.0.

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

		/****************** Direct ******************/
		%feature("compactdefaultargs") Direct;
		%feature("autodoc", "Returns true if the local coordinate system of this cylinder is right-handed.

Returns
-------
bool
") Direct;
		Standard_Boolean Direct();

		/****************** Location ******************/
		%feature("compactdefaultargs") Location;
		%feature("autodoc", "Returns the 'location' point of the cylinder.

Returns
-------
gp_Pnt
") Location;
		const gp_Pnt Location();

		/****************** Mirror ******************/
		%feature("compactdefaultargs") Mirror;
		%feature("autodoc", "No available documentation.

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
		%feature("autodoc", "No available documentation.

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
		%feature("autodoc", "No available documentation.

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
		%feature("autodoc", "Performs the symmetrical transformation of a cylinder with respect to the point p which is the center of the symmetry.

Parameters
----------
P: gp_Pnt

Returns
-------
gp_Cylinder
") Mirrored;
		gp_Cylinder Mirrored(const gp_Pnt & P);

		/****************** Mirrored ******************/
		%feature("compactdefaultargs") Mirrored;
		%feature("autodoc", "Performs the symmetrical transformation of a cylinder with respect to an axis placement which is the axis of the symmetry.

Parameters
----------
A1: gp_Ax1

Returns
-------
gp_Cylinder
") Mirrored;
		gp_Cylinder Mirrored(const gp_Ax1 & A1);

		/****************** Mirrored ******************/
		%feature("compactdefaultargs") Mirrored;
		%feature("autodoc", "Performs the symmetrical transformation of a cylinder with respect to a plane. the axis placement a2 locates the plane of the of the symmetry : (location, xdirection, ydirection).

Parameters
----------
A2: gp_Ax2

Returns
-------
gp_Cylinder
") Mirrored;
		gp_Cylinder Mirrored(const gp_Ax2 & A2);

		/****************** Position ******************/
		%feature("compactdefaultargs") Position;
		%feature("autodoc", "Returns the local coordinate system of the cylinder.

Returns
-------
gp_Ax3
") Position;
		const gp_Ax3 Position();

		/****************** Radius ******************/
		%feature("compactdefaultargs") Radius;
		%feature("autodoc", "Returns the radius of the cylinder.

Returns
-------
float
") Radius;
		Standard_Real Radius();

		/****************** Rotate ******************/
		%feature("compactdefaultargs") Rotate;
		%feature("autodoc", "No available documentation.

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
		%feature("autodoc", "Rotates a cylinder. a1 is the axis of the rotation. ang is the angular value of the rotation in radians.

Parameters
----------
A1: gp_Ax1
Ang: float

Returns
-------
gp_Cylinder
") Rotated;
		gp_Cylinder Rotated(const gp_Ax1 & A1, const Standard_Real Ang);

		/****************** Scale ******************/
		%feature("compactdefaultargs") Scale;
		%feature("autodoc", "No available documentation.

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
		%feature("autodoc", "Scales a cylinder. s is the scaling value. the absolute value of s is used to scale the cylinder.

Parameters
----------
P: gp_Pnt
S: float

Returns
-------
gp_Cylinder
") Scaled;
		gp_Cylinder Scaled(const gp_Pnt & P, const Standard_Real S);

		/****************** SetAxis ******************/
		%feature("compactdefaultargs") SetAxis;
		%feature("autodoc", "Changes the symmetry axis of the cylinder. raises constructionerror if the direction of a1 is parallel to the 'xdirection' of the coordinate system of the cylinder.

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
		%feature("autodoc", "Changes the location of the surface.

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
		%feature("autodoc", "Change the local coordinate system of the surface.

Parameters
----------
A3: gp_Ax3

Returns
-------
None
") SetPosition;
		void SetPosition(const gp_Ax3 & A3);

		/****************** SetRadius ******************/
		%feature("compactdefaultargs") SetRadius;
		%feature("autodoc", "Modifies the radius of this cylinder. exceptions standard_constructionerror if r is negative.

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
		%feature("autodoc", "No available documentation.

Parameters
----------
T: gp_Trsf

Returns
-------
None
") Transform;
		void Transform(const gp_Trsf & T);

		/****************** Transformed ******************/
		%feature("compactdefaultargs") Transformed;
		%feature("autodoc", "Transforms a cylinder with the transformation t from class trsf.

Parameters
----------
T: gp_Trsf

Returns
-------
gp_Cylinder
") Transformed;
		gp_Cylinder Transformed(const gp_Trsf & T);

		/****************** Translate ******************/
		%feature("compactdefaultargs") Translate;
		%feature("autodoc", "No available documentation.

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
		%feature("autodoc", "No available documentation.

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
		%feature("autodoc", "Translates a cylinder in the direction of the vector v. the magnitude of the translation is the vector's magnitude.

Parameters
----------
V: gp_Vec

Returns
-------
gp_Cylinder
") Translated;
		gp_Cylinder Translated(const gp_Vec & V);

		/****************** Translated ******************/
		%feature("compactdefaultargs") Translated;
		%feature("autodoc", "Translates a cylinder from the point p1 to the point p2.

Parameters
----------
P1: gp_Pnt
P2: gp_Pnt

Returns
-------
gp_Cylinder
") Translated;
		gp_Cylinder Translated(const gp_Pnt & P1, const gp_Pnt & P2);

		/****************** UReverse ******************/
		%feature("compactdefaultargs") UReverse;
		%feature("autodoc", "Reverses the u parametrization of the cylinder reversing the yaxis.

Returns
-------
None
") UReverse;
		void UReverse();

		/****************** VReverse ******************/
		%feature("compactdefaultargs") VReverse;
		%feature("autodoc", "Reverses the v parametrization of the plane reversing the axis.

Returns
-------
None
") VReverse;
		void VReverse();

		/****************** XAxis ******************/
		%feature("compactdefaultargs") XAxis;
		%feature("autodoc", "Returns the axis x of the cylinder.

Returns
-------
gp_Ax1
") XAxis;
		gp_Ax1 XAxis();

		/****************** YAxis ******************/
		%feature("compactdefaultargs") YAxis;
		%feature("autodoc", "Returns the axis y of the cylinder.

Returns
-------
gp_Ax1
") YAxis;
		gp_Ax1 YAxis();

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
		/****************** gp_Dir ******************/
		%feature("compactdefaultargs") gp_Dir;
		%feature("autodoc", "Creates a direction corresponding to x axis.

Returns
-------
None
") gp_Dir;
		 gp_Dir();

		/****************** gp_Dir ******************/
		%feature("compactdefaultargs") gp_Dir;
		%feature("autodoc", "Normalizes the vector v and creates a direction. raises constructionerror if v.magnitude() <= resolution.

Parameters
----------
V: gp_Vec

Returns
-------
None
") gp_Dir;
		 gp_Dir(const gp_Vec & V);

		/****************** gp_Dir ******************/
		%feature("compactdefaultargs") gp_Dir;
		%feature("autodoc", "Creates a direction from a triplet of coordinates. raises constructionerror if coord.modulus() <= resolution from gp.

Parameters
----------
Coord: gp_XYZ

Returns
-------
None
") gp_Dir;
		 gp_Dir(const gp_XYZ & Coord);

		/****************** gp_Dir ******************/
		%feature("compactdefaultargs") gp_Dir;
		%feature("autodoc", "Creates a direction with its 3 cartesian coordinates. raises constructionerror if sqrt(xv*xv + yv*yv + zv*zv) <= resolution modification of the direction's coordinates if sqrt (x*x + y*y + z*z) <= resolution from gp where x, y ,z are the new coordinates it is not possible to construct the direction and the method raises the exception constructionerror.

Parameters
----------
Xv: float
Yv: float
Zv: float

Returns
-------
None
") gp_Dir;
		 gp_Dir(const Standard_Real Xv, const Standard_Real Yv, const Standard_Real Zv);

		/****************** Angle ******************/
		%feature("compactdefaultargs") Angle;
		%feature("autodoc", "Computes the angular value in radians between <self> and <other>. this value is always positive in 3d space. returns the angle in the range [0, pi].

Parameters
----------
Other: gp_Dir

Returns
-------
float
") Angle;
		Standard_Real Angle(const gp_Dir & Other);

		/****************** AngleWithRef ******************/
		%feature("compactdefaultargs") AngleWithRef;
		%feature("autodoc", "Computes the angular value between <self> and <other>. <vref> is the direction of reference normal to <self> and <other> and its orientation gives the positive sense of rotation. if the cross product <self> ^ <other> has the same orientation as <vref> the angular value is positive else negative. returns the angular value in the range -pi and pi (in radians). raises domainerror if <self> and <other> are not parallel this exception is raised when <vref> is in the same plane as <self> and <other> the tolerance criterion is resolution from package gp.

Parameters
----------
Other: gp_Dir
VRef: gp_Dir

Returns
-------
float
") AngleWithRef;
		Standard_Real AngleWithRef(const gp_Dir & Other, const gp_Dir & VRef);

		/****************** Coord ******************/
		%feature("compactdefaultargs") Coord;
		%feature("autodoc", "Returns the coordinate of range index : index = 1 => x is returned index = 2 => y is returned index = 3 => z is returned exceptions standard_outofrange if index is not 1, 2, or 3.

Parameters
----------
Index: int

Returns
-------
float
") Coord;
		Standard_Real Coord(const Standard_Integer Index);

		/****************** Coord ******************/
		%feature("compactdefaultargs") Coord;
		%feature("autodoc", "Returns for the unit vector its three coordinates xv, yv, and zv.

Parameters
----------

Returns
-------
Xv: float
Yv: float
Zv: float
") Coord;
		void Coord(Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** Cross ******************/
		%feature("compactdefaultargs") Cross;
		%feature("autodoc", "Computes the cross product between two directions raises the exception constructionerror if the two directions are parallel because the computed vector cannot be normalized to create a direction.

Parameters
----------
Right: gp_Dir

Returns
-------
None
") Cross;
		void Cross(const gp_Dir & Right);

		/****************** CrossCross ******************/
		%feature("compactdefaultargs") CrossCross;
		%feature("autodoc", "No available documentation.

Parameters
----------
V1: gp_Dir
V2: gp_Dir

Returns
-------
None
") CrossCross;
		void CrossCross(const gp_Dir & V1, const gp_Dir & V2);

		/****************** CrossCrossed ******************/
		%feature("compactdefaultargs") CrossCrossed;
		%feature("autodoc", "Computes the double vector product this ^ (v1 ^ v2). - crosscrossed creates a new unit vector. exceptions standard_constructionerror if: - v1 and v2 are parallel, or - this unit vector and (v1 ^ v2) are parallel. this is because, in these conditions, the computed vector is null and cannot be normalized.

Parameters
----------
V1: gp_Dir
V2: gp_Dir

Returns
-------
gp_Dir
") CrossCrossed;
		gp_Dir CrossCrossed(const gp_Dir & V1, const gp_Dir & V2);

		/****************** Crossed ******************/
		%feature("compactdefaultargs") Crossed;
		%feature("autodoc", "Computes the triple vector product. <self> ^ (v1 ^ v2) raises the exception constructionerror if v1 and v2 are parallel or <self> and (v1^v2) are parallel because the computed vector can't be normalized to create a direction.

Parameters
----------
Right: gp_Dir

Returns
-------
gp_Dir
") Crossed;
		gp_Dir Crossed(const gp_Dir & Right);

		/****************** Dot ******************/
		%feature("compactdefaultargs") Dot;
		%feature("autodoc", "Computes the scalar product.

Parameters
----------
Other: gp_Dir

Returns
-------
float
") Dot;
		Standard_Real Dot(const gp_Dir & Other);

		/****************** DotCross ******************/
		%feature("compactdefaultargs") DotCross;
		%feature("autodoc", "Computes the triple scalar product <self> * (v1 ^ v2). warnings : the computed vector v1' = v1 ^ v2 is not normalized to create a unitary vector. so this method never raises an exception even if v1 and v2 are parallel.

Parameters
----------
V1: gp_Dir
V2: gp_Dir

Returns
-------
float
") DotCross;
		Standard_Real DotCross(const gp_Dir & V1, const gp_Dir & V2);

		/****************** IsEqual ******************/
		%feature("compactdefaultargs") IsEqual;
		%feature("autodoc", "Returns true if the angle between the two directions is lower or equal to angulartolerance.

Parameters
----------
Other: gp_Dir
AngularTolerance: float

Returns
-------
bool
") IsEqual;
		Standard_Boolean IsEqual(const gp_Dir & Other, const Standard_Real AngularTolerance);

		/****************** IsNormal ******************/
		%feature("compactdefaultargs") IsNormal;
		%feature("autodoc", "Returns true if the angle between this unit vector and the unit vector other is equal to pi/2 (normal).

Parameters
----------
Other: gp_Dir
AngularTolerance: float

Returns
-------
bool
") IsNormal;
		Standard_Boolean IsNormal(const gp_Dir & Other, const Standard_Real AngularTolerance);

		/****************** IsOpposite ******************/
		%feature("compactdefaultargs") IsOpposite;
		%feature("autodoc", "Returns true if the angle between this unit vector and the unit vector other is equal to pi (opposite).

Parameters
----------
Other: gp_Dir
AngularTolerance: float

Returns
-------
bool
") IsOpposite;
		Standard_Boolean IsOpposite(const gp_Dir & Other, const Standard_Real AngularTolerance);

		/****************** IsParallel ******************/
		%feature("compactdefaultargs") IsParallel;
		%feature("autodoc", "Returns true if the angle between this unit vector and the unit vector other is equal to 0 or to pi. note: the tolerance criterion is given by angulartolerance.

Parameters
----------
Other: gp_Dir
AngularTolerance: float

Returns
-------
bool
") IsParallel;
		Standard_Boolean IsParallel(const gp_Dir & Other, const Standard_Real AngularTolerance);

		/****************** Mirror ******************/
		%feature("compactdefaultargs") Mirror;
		%feature("autodoc", "No available documentation.

Parameters
----------
V: gp_Dir

Returns
-------
None
") Mirror;
		void Mirror(const gp_Dir & V);

		/****************** Mirror ******************/
		%feature("compactdefaultargs") Mirror;
		%feature("autodoc", "No available documentation.

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
		%feature("autodoc", "No available documentation.

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
		%feature("autodoc", "Performs the symmetrical transformation of a direction with respect to the direction v which is the center of the symmetry.

Parameters
----------
V: gp_Dir

Returns
-------
gp_Dir
") Mirrored;
		gp_Dir Mirrored(const gp_Dir & V);

		/****************** Mirrored ******************/
		%feature("compactdefaultargs") Mirrored;
		%feature("autodoc", "Performs the symmetrical transformation of a direction with respect to an axis placement which is the axis of the symmetry.

Parameters
----------
A1: gp_Ax1

Returns
-------
gp_Dir
") Mirrored;
		gp_Dir Mirrored(const gp_Ax1 & A1);

		/****************** Mirrored ******************/
		%feature("compactdefaultargs") Mirrored;
		%feature("autodoc", "Performs the symmetrical transformation of a direction with respect to a plane. the axis placement a2 locates the plane of the symmetry : (location, xdirection, ydirection).

Parameters
----------
A2: gp_Ax2

Returns
-------
gp_Dir
") Mirrored;
		gp_Dir Mirrored(const gp_Ax2 & A2);

		/****************** Reverse ******************/
		%feature("compactdefaultargs") Reverse;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Reverse;
		void Reverse();

		/****************** Reversed ******************/
		%feature("compactdefaultargs") Reversed;
		%feature("autodoc", "Reverses the orientation of a direction geometric transformations performs the symmetrical transformation of a direction with respect to the direction v which is the center of the symmetry.].

Returns
-------
gp_Dir
") Reversed;
		gp_Dir Reversed();

		/****************** Rotate ******************/
		%feature("compactdefaultargs") Rotate;
		%feature("autodoc", "No available documentation.

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
		%feature("autodoc", "Rotates a direction. a1 is the axis of the rotation. ang is the angular value of the rotation in radians.

Parameters
----------
A1: gp_Ax1
Ang: float

Returns
-------
gp_Dir
") Rotated;
		gp_Dir Rotated(const gp_Ax1 & A1, const Standard_Real Ang);

		/****************** SetCoord ******************/
		%feature("compactdefaultargs") SetCoord;
		%feature("autodoc", "For this unit vector, assigns the value xi to: - the x coordinate if index is 1, or - the y coordinate if index is 2, or - the z coordinate if index is 3, and then normalizes it. warning remember that all the coordinates of a unit vector are implicitly modified when any single one is changed directly. exceptions standard_outofrange if index is not 1, 2, or 3. standard_constructionerror if either of the following is less than or equal to gp::resolution(): - sqrt(xv*xv + yv*yv + zv*zv), or - the modulus of the number triple formed by the new value xi and the two other coordinates of this vector that were not directly modified.

Parameters
----------
Index: int
Xi: float

Returns
-------
None
") SetCoord;
		void SetCoord(const Standard_Integer Index, const Standard_Real Xi);

		/****************** SetCoord ******************/
		%feature("compactdefaultargs") SetCoord;
		%feature("autodoc", "For this unit vector, assigns the values xv, yv and zv to its three coordinates. remember that all the coordinates of a unit vector are implicitly modified when any single one is changed directly.

Parameters
----------
Xv: float
Yv: float
Zv: float

Returns
-------
None
") SetCoord;
		void SetCoord(const Standard_Real Xv, const Standard_Real Yv, const Standard_Real Zv);

		/****************** SetX ******************/
		%feature("compactdefaultargs") SetX;
		%feature("autodoc", "Assigns the given value to the x coordinate of this unit vector.

Parameters
----------
X: float

Returns
-------
None
") SetX;
		void SetX(const Standard_Real X);

		/****************** SetXYZ ******************/
		%feature("compactdefaultargs") SetXYZ;
		%feature("autodoc", "Assigns the three coordinates of coord to this unit vector.

Parameters
----------
Coord: gp_XYZ

Returns
-------
None
") SetXYZ;
		void SetXYZ(const gp_XYZ & Coord);

		/****************** SetY ******************/
		%feature("compactdefaultargs") SetY;
		%feature("autodoc", "Assigns the given value to the y coordinate of this unit vector.

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
		%feature("autodoc", "Assigns the given value to the z coordinate of this unit vector.

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
		%feature("autodoc", "No available documentation.

Parameters
----------
T: gp_Trsf

Returns
-------
None
") Transform;
		void Transform(const gp_Trsf & T);

		/****************** Transformed ******************/
		%feature("compactdefaultargs") Transformed;
		%feature("autodoc", "Transforms a direction with a 'trsf' from gp. warnings : if the scale factor of the 'trsf' t is negative then the direction <self> is reversed.

Parameters
----------
T: gp_Trsf

Returns
-------
gp_Dir
") Transformed;
		gp_Dir Transformed(const gp_Trsf & T);

		/****************** X ******************/
		%feature("compactdefaultargs") X;
		%feature("autodoc", "Returns the x coordinate for a unit vector.

Returns
-------
float
") X;
		Standard_Real X();

		/****************** XYZ ******************/
		%feature("compactdefaultargs") XYZ;
		%feature("autodoc", "For this unit vector, returns its three coordinates as a number triplea.

Returns
-------
gp_XYZ
") XYZ;
		const gp_XYZ XYZ();

		/****************** Y ******************/
		%feature("compactdefaultargs") Y;
		%feature("autodoc", "Returns the y coordinate for a unit vector.

Returns
-------
float
") Y;
		Standard_Real Y();

		/****************** Z ******************/
		%feature("compactdefaultargs") Z;
		%feature("autodoc", "Returns the z coordinate for a unit vector.

Returns
-------
float
") Z;
		Standard_Real Z();

		/****************** operator * ******************/
		%feature("compactdefaultargs") operator *;
		%feature("autodoc", "No available documentation.

Parameters
----------
Other: gp_Dir

Returns
-------
float
") operator *;
		Standard_Real operator *(const gp_Dir & Other);

		/****************** operator - ******************/
		%feature("compactdefaultargs") operator -;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Dir
") operator -;
		gp_Dir operator -();

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
		/****************** gp_Dir2d ******************/
		%feature("compactdefaultargs") gp_Dir2d;
		%feature("autodoc", "Creates a direction corresponding to x axis.

Returns
-------
None
") gp_Dir2d;
		 gp_Dir2d();

		/****************** gp_Dir2d ******************/
		%feature("compactdefaultargs") gp_Dir2d;
		%feature("autodoc", "Normalizes the vector v and creates a direction. raises constructionerror if v.magnitude() <= resolution from gp.

Parameters
----------
V: gp_Vec2d

Returns
-------
None
") gp_Dir2d;
		 gp_Dir2d(const gp_Vec2d & V);

		/****************** gp_Dir2d ******************/
		%feature("compactdefaultargs") gp_Dir2d;
		%feature("autodoc", "Creates a direction from a doublet of coordinates. raises constructionerror if coord.modulus() <= resolution from gp.

Parameters
----------
Coord: gp_XY

Returns
-------
None
") gp_Dir2d;
		 gp_Dir2d(const gp_XY & Coord);

		/****************** gp_Dir2d ******************/
		%feature("compactdefaultargs") gp_Dir2d;
		%feature("autodoc", "Creates a direction with its 2 cartesian coordinates. raises constructionerror if sqrt(xv*xv + yv*yv) <= resolution from gp.

Parameters
----------
Xv: float
Yv: float

Returns
-------
None
") gp_Dir2d;
		 gp_Dir2d(const Standard_Real Xv, const Standard_Real Yv);

		/****************** Angle ******************/
		%feature("compactdefaultargs") Angle;
		%feature("autodoc", "Computes the angular value in radians between <self> and <other>. returns the angle in the range [-pi, pi].

Parameters
----------
Other: gp_Dir2d

Returns
-------
float
") Angle;
		Standard_Real Angle(const gp_Dir2d & Other);

		/****************** Coord ******************/
		%feature("compactdefaultargs") Coord;
		%feature("autodoc", "For this unit vector returns the coordinate of range index : index = 1 => x is returned index = 2 => y is returned raises outofrange if index != {1, 2}.

Parameters
----------
Index: int

Returns
-------
float
") Coord;
		Standard_Real Coord(const Standard_Integer Index);

		/****************** Coord ******************/
		%feature("compactdefaultargs") Coord;
		%feature("autodoc", "For this unit vector returns its two coordinates xv and yv. raises outofrange if index != {1, 2}.

Parameters
----------

Returns
-------
Xv: float
Yv: float
") Coord;
		void Coord(Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** Crossed ******************/
		%feature("compactdefaultargs") Crossed;
		%feature("autodoc", "Computes the cross product between two directions.

Parameters
----------
Right: gp_Dir2d

Returns
-------
float
") Crossed;
		Standard_Real Crossed(const gp_Dir2d & Right);

		/****************** Dot ******************/
		%feature("compactdefaultargs") Dot;
		%feature("autodoc", "Computes the scalar product.

Parameters
----------
Other: gp_Dir2d

Returns
-------
float
") Dot;
		Standard_Real Dot(const gp_Dir2d & Other);

		/****************** IsEqual ******************/
		%feature("compactdefaultargs") IsEqual;
		%feature("autodoc", "Returns true if the two vectors have the same direction i.e. the angle between this unit vector and the unit vector other is less than or equal to angulartolerance.

Parameters
----------
Other: gp_Dir2d
AngularTolerance: float

Returns
-------
bool
") IsEqual;
		Standard_Boolean IsEqual(const gp_Dir2d & Other, const Standard_Real AngularTolerance);

		/****************** IsNormal ******************/
		%feature("compactdefaultargs") IsNormal;
		%feature("autodoc", "Returns true if the angle between this unit vector and the unit vector other is equal to pi/2 or -pi/2 (normal) i.e. abs(abs(<self>.angle(other)) - pi/2.) <= angulartolerance.

Parameters
----------
Other: gp_Dir2d
AngularTolerance: float

Returns
-------
bool
") IsNormal;
		Standard_Boolean IsNormal(const gp_Dir2d & Other, const Standard_Real AngularTolerance);

		/****************** IsOpposite ******************/
		%feature("compactdefaultargs") IsOpposite;
		%feature("autodoc", "Returns true if the angle between this unit vector and the unit vector other is equal to pi or -pi (opposite). i.e. pi - abs(<self>.angle(other)) <= angulartolerance.

Parameters
----------
Other: gp_Dir2d
AngularTolerance: float

Returns
-------
bool
") IsOpposite;
		Standard_Boolean IsOpposite(const gp_Dir2d & Other, const Standard_Real AngularTolerance);

		/****************** IsParallel ******************/
		%feature("compactdefaultargs") IsParallel;
		%feature("autodoc", "Returns true if if the angle between this unit vector and unit vector other is equal to 0, pi or -pi. i.e. abs(angle(<self>, other)) <= angulartolerance or pi - abs(angle(<self>, other)) <= angulartolerance.

Parameters
----------
Other: gp_Dir2d
AngularTolerance: float

Returns
-------
bool
") IsParallel;
		Standard_Boolean IsParallel(const gp_Dir2d & Other, const Standard_Real AngularTolerance);

		/****************** Mirror ******************/
		%feature("compactdefaultargs") Mirror;
		%feature("autodoc", "No available documentation.

Parameters
----------
V: gp_Dir2d

Returns
-------
None
") Mirror;
		void Mirror(const gp_Dir2d & V);

		/****************** Mirror ******************/
		%feature("compactdefaultargs") Mirror;
		%feature("autodoc", "No available documentation.

Parameters
----------
A: gp_Ax2d

Returns
-------
None
") Mirror;
		void Mirror(const gp_Ax2d & A);

		/****************** Mirrored ******************/
		%feature("compactdefaultargs") Mirrored;
		%feature("autodoc", "Performs the symmetrical transformation of a direction with respect to the direction v which is the center of the symmetry.

Parameters
----------
V: gp_Dir2d

Returns
-------
gp_Dir2d
") Mirrored;
		gp_Dir2d Mirrored(const gp_Dir2d & V);

		/****************** Mirrored ******************/
		%feature("compactdefaultargs") Mirrored;
		%feature("autodoc", "Performs the symmetrical transformation of a direction with respect to an axis placement which is the axis of the symmetry.

Parameters
----------
A: gp_Ax2d

Returns
-------
gp_Dir2d
") Mirrored;
		gp_Dir2d Mirrored(const gp_Ax2d & A);

		/****************** Reverse ******************/
		%feature("compactdefaultargs") Reverse;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Reverse;
		void Reverse();

		/****************** Reversed ******************/
		%feature("compactdefaultargs") Reversed;
		%feature("autodoc", "Reverses the orientation of a direction.

Returns
-------
gp_Dir2d
") Reversed;
		gp_Dir2d Reversed();

		/****************** Rotate ******************/
		%feature("compactdefaultargs") Rotate;
		%feature("autodoc", "No available documentation.

Parameters
----------
Ang: float

Returns
-------
None
") Rotate;
		void Rotate(const Standard_Real Ang);

		/****************** Rotated ******************/
		%feature("compactdefaultargs") Rotated;
		%feature("autodoc", "Rotates a direction. ang is the angular value of the rotation in radians.

Parameters
----------
Ang: float

Returns
-------
gp_Dir2d
") Rotated;
		gp_Dir2d Rotated(const Standard_Real Ang);

		/****************** SetCoord ******************/
		%feature("compactdefaultargs") SetCoord;
		%feature("autodoc", "For this unit vector, assigns: the value xi to: - the x coordinate if index is 1, or - the y coordinate if index is 2, and then normalizes it. warning remember that all the coordinates of a unit vector are implicitly modified when any single one is changed directly. exceptions standard_outofrange if index is not 1 or 2. standard_constructionerror if either of the following is less than or equal to gp::resolution(): - sqrt(xv*xv + yv*yv), or - the modulus of the number pair formed by the new value xi and the other coordinate of this vector that was not directly modified. raises outofrange if index != {1, 2}.

Parameters
----------
Index: int
Xi: float

Returns
-------
None
") SetCoord;
		void SetCoord(const Standard_Integer Index, const Standard_Real Xi);

		/****************** SetCoord ******************/
		%feature("compactdefaultargs") SetCoord;
		%feature("autodoc", "For this unit vector, assigns: - the values xv and yv to its two coordinates, warning remember that all the coordinates of a unit vector are implicitly modified when any single one is changed directly. exceptions standard_outofrange if index is not 1 or 2. standard_constructionerror if either of the following is less than or equal to gp::resolution(): - sqrt(xv*xv + yv*yv), or - the modulus of the number pair formed by the new value xi and the other coordinate of this vector that was not directly modified. raises outofrange if index != {1, 2}.

Parameters
----------
Xv: float
Yv: float

Returns
-------
None
") SetCoord;
		void SetCoord(const Standard_Real Xv, const Standard_Real Yv);

		/****************** SetX ******************/
		%feature("compactdefaultargs") SetX;
		%feature("autodoc", "Assigns the given value to the x coordinate of this unit vector, and then normalizes it. warning remember that all the coordinates of a unit vector are implicitly modified when any single one is changed directly. exceptions standard_constructionerror if either of the following is less than or equal to gp::resolution(): - the modulus of coord, or - the modulus of the number pair formed from the new x or y coordinate and the other coordinate of this vector that was not directly modified.

Parameters
----------
X: float

Returns
-------
None
") SetX;
		void SetX(const Standard_Real X);

		/****************** SetXY ******************/
		%feature("compactdefaultargs") SetXY;
		%feature("autodoc", "Assigns: - the two coordinates of coord to this unit vector, and then normalizes it. warning remember that all the coordinates of a unit vector are implicitly modified when any single one is changed directly. exceptions standard_constructionerror if either of the following is less than or equal to gp::resolution(): - the modulus of coord, or - the modulus of the number pair formed from the new x or y coordinate and the other coordinate of this vector that was not directly modified.

Parameters
----------
Coord: gp_XY

Returns
-------
None
") SetXY;
		void SetXY(const gp_XY & Coord);

		/****************** SetY ******************/
		%feature("compactdefaultargs") SetY;
		%feature("autodoc", "Assigns the given value to the y coordinate of this unit vector, and then normalizes it. warning remember that all the coordinates of a unit vector are implicitly modified when any single one is changed directly. exceptions standard_constructionerror if either of the following is less than or equal to gp::resolution(): - the modulus of coord, or - the modulus of the number pair formed from the new x or y coordinate and the other coordinate of this vector that was not directly modified.

Parameters
----------
Y: float

Returns
-------
None
") SetY;
		void SetY(const Standard_Real Y);

		/****************** Transform ******************/
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

		/****************** Transformed ******************/
		%feature("compactdefaultargs") Transformed;
		%feature("autodoc", "Transforms a direction with the 'trsf' t. warnings : if the scale factor of the 'trsf' t is negative then the direction <self> is reversed.

Parameters
----------
T: gp_Trsf2d

Returns
-------
gp_Dir2d
") Transformed;
		gp_Dir2d Transformed(const gp_Trsf2d & T);

		/****************** X ******************/
		%feature("compactdefaultargs") X;
		%feature("autodoc", "For this unit vector, returns its x coordinate.

Returns
-------
float
") X;
		Standard_Real X();

		/****************** XY ******************/
		%feature("compactdefaultargs") XY;
		%feature("autodoc", "For this unit vector, returns its two coordinates as a number pair. comparison between directions the precision value is an input data.

Returns
-------
gp_XY
") XY;
		const gp_XY XY();

		/****************** Y ******************/
		%feature("compactdefaultargs") Y;
		%feature("autodoc", "For this unit vector, returns its y coordinate.

Returns
-------
float
") Y;
		Standard_Real Y();

		/****************** operator * ******************/
		%feature("compactdefaultargs") operator *;
		%feature("autodoc", "No available documentation.

Parameters
----------
Other: gp_Dir2d

Returns
-------
float
") operator *;
		Standard_Real operator *(const gp_Dir2d & Other);

		/****************** operator - ******************/
		%feature("compactdefaultargs") operator -;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Dir2d
") operator -;
		gp_Dir2d operator -();

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
		/****************** gp_Elips ******************/
		%feature("compactdefaultargs") gp_Elips;
		%feature("autodoc", "Creates an indefinite ellipse.

Returns
-------
None
") gp_Elips;
		 gp_Elips();

		/****************** gp_Elips ******************/
		%feature("compactdefaultargs") gp_Elips;
		%feature("autodoc", "The major radius of the ellipse is on the 'xaxis' and the minor radius is on the 'yaxis' of the ellipse. the 'xaxis' is defined with the 'xdirection' of a2 and the 'yaxis' is defined with the 'ydirection' of a2. warnings : it is not forbidden to create an ellipse with majorradius = minorradius. raises constructionerror if majorradius < minorradius or minorradius < 0.

Parameters
----------
A2: gp_Ax2
MajorRadius: float
MinorRadius: float

Returns
-------
None
") gp_Elips;
		 gp_Elips(const gp_Ax2 & A2, const Standard_Real MajorRadius, const Standard_Real MinorRadius);

		/****************** Area ******************/
		%feature("compactdefaultargs") Area;
		%feature("autodoc", "Computes the area of the ellipse.

Returns
-------
float
") Area;
		Standard_Real Area();

		/****************** Axis ******************/
		%feature("compactdefaultargs") Axis;
		%feature("autodoc", "Computes the axis normal to the plane of the ellipse.

Returns
-------
gp_Ax1
") Axis;
		const gp_Ax1 Axis();

		/****************** Directrix1 ******************/
		%feature("compactdefaultargs") Directrix1;
		%feature("autodoc", "Computes the first or second directrix of this ellipse. these are the lines, in the plane of the ellipse, normal to the major axis, at a distance equal to majorradius/e from the center of the ellipse, where e is the eccentricity of the ellipse. the first directrix (directrix1) is on the positive side of the major axis. the second directrix (directrix2) is on the negative side. the directrix is returned as an axis (gp_ax1 object), the origin of which is situated on the 'x axis' of the local coordinate system of this ellipse. exceptions standard_constructionerror if the eccentricity is null (the ellipse has degenerated into a circle).

Returns
-------
gp_Ax1
") Directrix1;
		gp_Ax1 Directrix1();

		/****************** Directrix2 ******************/
		%feature("compactdefaultargs") Directrix2;
		%feature("autodoc", "This line is obtained by the symmetrical transformation of 'directrix1' with respect to the 'yaxis' of the ellipse. exceptions standard_constructionerror if the eccentricity is null (the ellipse has degenerated into a circle).

Returns
-------
gp_Ax1
") Directrix2;
		gp_Ax1 Directrix2();

		/****************** Eccentricity ******************/
		%feature("compactdefaultargs") Eccentricity;
		%feature("autodoc", "Returns the eccentricity of the ellipse between 0.0 and 1.0 if f is the distance between the center of the ellipse and the focus1 then the eccentricity e = f / majorradius. raises constructionerror if majorradius = 0.0.

Returns
-------
float
") Eccentricity;
		Standard_Real Eccentricity();

		/****************** Focal ******************/
		%feature("compactdefaultargs") Focal;
		%feature("autodoc", "Computes the focal distance. it is the distance between the two focus focus1 and focus2 of the ellipse.

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

		/****************** Location ******************/
		%feature("compactdefaultargs") Location;
		%feature("autodoc", "Returns the center of the ellipse. it is the 'location' point of the coordinate system of the ellipse.

Returns
-------
gp_Pnt
") Location;
		const gp_Pnt Location();

		/****************** MajorRadius ******************/
		%feature("compactdefaultargs") MajorRadius;
		%feature("autodoc", "Returns the major radius of the ellipse.

Returns
-------
float
") MajorRadius;
		Standard_Real MajorRadius();

		/****************** MinorRadius ******************/
		%feature("compactdefaultargs") MinorRadius;
		%feature("autodoc", "Returns the minor radius of the ellipse.

Returns
-------
float
") MinorRadius;
		Standard_Real MinorRadius();

		/****************** Mirror ******************/
		%feature("compactdefaultargs") Mirror;
		%feature("autodoc", "No available documentation.

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
		%feature("autodoc", "No available documentation.

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
		%feature("autodoc", "No available documentation.

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
		%feature("autodoc", "Performs the symmetrical transformation of an ellipse with respect to the point p which is the center of the symmetry.

Parameters
----------
P: gp_Pnt

Returns
-------
gp_Elips
") Mirrored;
		gp_Elips Mirrored(const gp_Pnt & P);

		/****************** Mirrored ******************/
		%feature("compactdefaultargs") Mirrored;
		%feature("autodoc", "Performs the symmetrical transformation of an ellipse with respect to an axis placement which is the axis of the symmetry.

Parameters
----------
A1: gp_Ax1

Returns
-------
gp_Elips
") Mirrored;
		gp_Elips Mirrored(const gp_Ax1 & A1);

		/****************** Mirrored ******************/
		%feature("compactdefaultargs") Mirrored;
		%feature("autodoc", "Performs the symmetrical transformation of an ellipse with respect to a plane. the axis placement a2 locates the plane of the symmetry (location, xdirection, ydirection).

Parameters
----------
A2: gp_Ax2

Returns
-------
gp_Elips
") Mirrored;
		gp_Elips Mirrored(const gp_Ax2 & A2);

		/****************** Parameter ******************/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "Returns p = (1 - e * e) * majorradius where e is the eccentricity of the ellipse. returns 0 if majorradius = 0.

Returns
-------
float
") Parameter;
		Standard_Real Parameter();

		/****************** Position ******************/
		%feature("compactdefaultargs") Position;
		%feature("autodoc", "Returns the coordinate system of the ellipse.

Returns
-------
gp_Ax2
") Position;
		const gp_Ax2 Position();

		/****************** Rotate ******************/
		%feature("compactdefaultargs") Rotate;
		%feature("autodoc", "No available documentation.

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
		%feature("autodoc", "Rotates an ellipse. a1 is the axis of the rotation. ang is the angular value of the rotation in radians.

Parameters
----------
A1: gp_Ax1
Ang: float

Returns
-------
gp_Elips
") Rotated;
		gp_Elips Rotated(const gp_Ax1 & A1, const Standard_Real Ang);

		/****************** Scale ******************/
		%feature("compactdefaultargs") Scale;
		%feature("autodoc", "No available documentation.

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
		%feature("autodoc", "Scales an ellipse. s is the scaling value.

Parameters
----------
P: gp_Pnt
S: float

Returns
-------
gp_Elips
") Scaled;
		gp_Elips Scaled(const gp_Pnt & P, const Standard_Real S);

		/****************** SetAxis ******************/
		%feature("compactdefaultargs") SetAxis;
		%feature("autodoc", "Changes the axis normal to the plane of the ellipse. it modifies the definition of this plane. the 'xaxis' and the 'yaxis' are recomputed. the local coordinate system is redefined so that: - its origin and 'main direction' become those of the axis a1 (the 'x direction' and 'y direction' are then recomputed in the same way as for any gp_ax2), or raises constructionerror if the direction of a1 is parallel to the direction of the 'xaxis' of the ellipse.

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
		%feature("autodoc", "Modifies this ellipse, by redefining its local coordinate so that its origin becomes p.

Parameters
----------
P: gp_Pnt

Returns
-------
None
") SetLocation;
		void SetLocation(const gp_Pnt & P);

		/****************** SetMajorRadius ******************/
		%feature("compactdefaultargs") SetMajorRadius;
		%feature("autodoc", "The major radius of the ellipse is on the 'xaxis' (major axis) of the ellipse. raises constructionerror if majorradius < minorradius.

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
		%feature("autodoc", "The minor radius of the ellipse is on the 'yaxis' (minor axis) of the ellipse. raises constructionerror if minorradius > majorradius or minorradius < 0.

Parameters
----------
MinorRadius: float

Returns
-------
None
") SetMinorRadius;
		void SetMinorRadius(const Standard_Real MinorRadius);

		/****************** SetPosition ******************/
		%feature("compactdefaultargs") SetPosition;
		%feature("autodoc", "Modifies this ellipse, by redefining its local coordinate so that it becomes a2e.

Parameters
----------
A2: gp_Ax2

Returns
-------
None
") SetPosition;
		void SetPosition(const gp_Ax2 & A2);

		/****************** Transform ******************/
		%feature("compactdefaultargs") Transform;
		%feature("autodoc", "No available documentation.

Parameters
----------
T: gp_Trsf

Returns
-------
None
") Transform;
		void Transform(const gp_Trsf & T);

		/****************** Transformed ******************/
		%feature("compactdefaultargs") Transformed;
		%feature("autodoc", "Transforms an ellipse with the transformation t from class trsf.

Parameters
----------
T: gp_Trsf

Returns
-------
gp_Elips
") Transformed;
		gp_Elips Transformed(const gp_Trsf & T);

		/****************** Translate ******************/
		%feature("compactdefaultargs") Translate;
		%feature("autodoc", "No available documentation.

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
		%feature("autodoc", "No available documentation.

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
		%feature("autodoc", "Translates an ellipse in the direction of the vector v. the magnitude of the translation is the vector's magnitude.

Parameters
----------
V: gp_Vec

Returns
-------
gp_Elips
") Translated;
		gp_Elips Translated(const gp_Vec & V);

		/****************** Translated ******************/
		%feature("compactdefaultargs") Translated;
		%feature("autodoc", "Translates an ellipse from the point p1 to the point p2.

Parameters
----------
P1: gp_Pnt
P2: gp_Pnt

Returns
-------
gp_Elips
") Translated;
		gp_Elips Translated(const gp_Pnt & P1, const gp_Pnt & P2);

		/****************** XAxis ******************/
		%feature("compactdefaultargs") XAxis;
		%feature("autodoc", "Returns the 'xaxis' of the ellipse whose origin is the center of this ellipse. it is the major axis of the ellipse.

Returns
-------
gp_Ax1
") XAxis;
		gp_Ax1 XAxis();

		/****************** YAxis ******************/
		%feature("compactdefaultargs") YAxis;
		%feature("autodoc", "Returns the 'yaxis' of the ellipse whose unit vector is the 'x direction' or the 'y direction' of the local coordinate system of this ellipse. this is the minor axis of the ellipse.

Returns
-------
gp_Ax1
") YAxis;
		gp_Ax1 YAxis();

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
		/****************** gp_Elips2d ******************/
		%feature("compactdefaultargs") gp_Elips2d;
		%feature("autodoc", "Creates an indefinite ellipse.

Returns
-------
None
") gp_Elips2d;
		 gp_Elips2d();

		/****************** gp_Elips2d ******************/
		%feature("compactdefaultargs") gp_Elips2d;
		%feature("autodoc", "Creates an ellipse with the major axis, the major and the minor radius. the location of the majoraxis is the center of the ellipse. the sense of parametrization is given by sense. warnings : it is possible to create an ellipse with majorradius = minorradius. raises constructionerror if majorradius < minorradius or minorradius < 0.0.

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
") gp_Elips2d;
		 gp_Elips2d(const gp_Ax2d & MajorAxis, const Standard_Real MajorRadius, const Standard_Real MinorRadius, const Standard_Boolean Sense = Standard_True);

		/****************** gp_Elips2d ******************/
		%feature("compactdefaultargs") gp_Elips2d;
		%feature("autodoc", "Creates an ellipse with radii majorradius and minorradius, positioned in the plane by coordinate system a where: - the origin of a is the center of the ellipse, - the 'x direction' of a defines the major axis of the ellipse, that is, the major radius majorradius is measured along this axis, and - the 'y direction' of a defines the minor axis of the ellipse, that is, the minor radius minorradius is measured along this axis, and - the orientation (direct or indirect sense) of a gives the orientation of the ellipse. warnings : it is possible to create an ellipse with majorradius = minorradius. raises constructionerror if majorradius < minorradius or minorradius < 0.0.

Parameters
----------
A: gp_Ax22d
MajorRadius: float
MinorRadius: float

Returns
-------
None
") gp_Elips2d;
		 gp_Elips2d(const gp_Ax22d & A, const Standard_Real MajorRadius, const Standard_Real MinorRadius);

		/****************** Area ******************/
		%feature("compactdefaultargs") Area;
		%feature("autodoc", "Computes the area of the ellipse.

Returns
-------
float
") Area;
		Standard_Real Area();

		/****************** Axis ******************/
		%feature("compactdefaultargs") Axis;
		%feature("autodoc", "Returns the major axis of the ellipse.

Returns
-------
gp_Ax22d
") Axis;
		const gp_Ax22d Axis();

		/****************** Coefficients ******************/
		%feature("compactdefaultargs") Coefficients;
		%feature("autodoc", "Returns the coefficients of the implicit equation of the ellipse. a * (x**2) + b * (y**2) + 2*c*(x*y) + 2*d*x + 2*e*y + f = 0.

Parameters
----------

Returns
-------
A: float
B: float
C: float
D: float
E: float
F: float
") Coefficients;
		void Coefficients(Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** Directrix1 ******************/
		%feature("compactdefaultargs") Directrix1;
		%feature("autodoc", "This directrix is the line normal to the xaxis of the ellipse in the local plane (z = 0) at a distance d = majorradius / e from the center of the ellipse, where e is the eccentricity of the ellipse. this line is parallel to the 'yaxis'. the intersection point between directrix1 and the 'xaxis' is the location point of the directrix1. this point is on the positive side of the 'xaxis'. //! raised if eccentricity = 0.0. (the ellipse degenerates into a circle).

Returns
-------
gp_Ax2d
") Directrix1;
		gp_Ax2d Directrix1();

		/****************** Directrix2 ******************/
		%feature("compactdefaultargs") Directrix2;
		%feature("autodoc", "This line is obtained by the symmetrical transformation of 'directrix1' with respect to the minor axis of the ellipse. //! raised if eccentricity = 0.0. (the ellipse degenerates into a circle).

Returns
-------
gp_Ax2d
") Directrix2;
		gp_Ax2d Directrix2();

		/****************** Eccentricity ******************/
		%feature("compactdefaultargs") Eccentricity;
		%feature("autodoc", "Returns the eccentricity of the ellipse between 0.0 and 1.0 if f is the distance between the center of the ellipse and the focus1 then the eccentricity e = f / majorradius. returns 0 if majorradius = 0.

Returns
-------
float
") Eccentricity;
		Standard_Real Eccentricity();

		/****************** Focal ******************/
		%feature("compactdefaultargs") Focal;
		%feature("autodoc", "Returns the distance between the center of the ellipse and focus1 or focus2.

Returns
-------
float
") Focal;
		Standard_Real Focal();

		/****************** Focus1 ******************/
		%feature("compactdefaultargs") Focus1;
		%feature("autodoc", "Returns the first focus of the ellipse. this focus is on the positive side of the major axis of the ellipse.

Returns
-------
gp_Pnt2d
") Focus1;
		gp_Pnt2d Focus1();

		/****************** Focus2 ******************/
		%feature("compactdefaultargs") Focus2;
		%feature("autodoc", "Returns the second focus of the ellipse. this focus is on the negative side of the major axis of the ellipse.

Returns
-------
gp_Pnt2d
") Focus2;
		gp_Pnt2d Focus2();

		/****************** IsDirect ******************/
		%feature("compactdefaultargs") IsDirect;
		%feature("autodoc", "Returns true if the local coordinate system is direct and false in the other case.

Returns
-------
bool
") IsDirect;
		Standard_Boolean IsDirect();

		/****************** Location ******************/
		%feature("compactdefaultargs") Location;
		%feature("autodoc", "Returns the center of the ellipse.

Returns
-------
gp_Pnt2d
") Location;
		const gp_Pnt2d Location();

		/****************** MajorRadius ******************/
		%feature("compactdefaultargs") MajorRadius;
		%feature("autodoc", "Returns the major radius of the ellipse.

Returns
-------
float
") MajorRadius;
		Standard_Real MajorRadius();

		/****************** MinorRadius ******************/
		%feature("compactdefaultargs") MinorRadius;
		%feature("autodoc", "Returns the minor radius of the ellipse.

Returns
-------
float
") MinorRadius;
		Standard_Real MinorRadius();

		/****************** Mirror ******************/
		%feature("compactdefaultargs") Mirror;
		%feature("autodoc", "No available documentation.

Parameters
----------
P: gp_Pnt2d

Returns
-------
None
") Mirror;
		void Mirror(const gp_Pnt2d & P);

		/****************** Mirror ******************/
		%feature("compactdefaultargs") Mirror;
		%feature("autodoc", "No available documentation.

Parameters
----------
A: gp_Ax2d

Returns
-------
None
") Mirror;
		void Mirror(const gp_Ax2d & A);

		/****************** Mirrored ******************/
		%feature("compactdefaultargs") Mirrored;
		%feature("autodoc", "Performs the symmetrical transformation of a ellipse with respect to the point p which is the center of the symmetry.

Parameters
----------
P: gp_Pnt2d

Returns
-------
gp_Elips2d
") Mirrored;
		gp_Elips2d Mirrored(const gp_Pnt2d & P);

		/****************** Mirrored ******************/
		%feature("compactdefaultargs") Mirrored;
		%feature("autodoc", "Performs the symmetrical transformation of a ellipse with respect to an axis placement which is the axis of the symmetry.

Parameters
----------
A: gp_Ax2d

Returns
-------
gp_Elips2d
") Mirrored;
		gp_Elips2d Mirrored(const gp_Ax2d & A);

		/****************** Parameter ******************/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "Returns p = (1 - e * e) * majorradius where e is the eccentricity of the ellipse. returns 0 if majorradius = 0.

Returns
-------
float
") Parameter;
		Standard_Real Parameter();

		/****************** Reverse ******************/
		%feature("compactdefaultargs") Reverse;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Reverse;
		void Reverse();

		/****************** Reversed ******************/
		%feature("compactdefaultargs") Reversed;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Elips2d
") Reversed;
		gp_Elips2d Reversed();

		/****************** Rotate ******************/
		%feature("compactdefaultargs") Rotate;
		%feature("autodoc", "No available documentation.

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
		%feature("compactdefaultargs") Rotated;
		%feature("autodoc", "No available documentation.

Parameters
----------
P: gp_Pnt2d
Ang: float

Returns
-------
gp_Elips2d
") Rotated;
		gp_Elips2d Rotated(const gp_Pnt2d & P, const Standard_Real Ang);

		/****************** Scale ******************/
		%feature("compactdefaultargs") Scale;
		%feature("autodoc", "No available documentation.

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
		%feature("compactdefaultargs") Scaled;
		%feature("autodoc", "Scales a ellipse. s is the scaling value.

Parameters
----------
P: gp_Pnt2d
S: float

Returns
-------
gp_Elips2d
") Scaled;
		gp_Elips2d Scaled(const gp_Pnt2d & P, const Standard_Real S);

		/****************** SetAxis ******************/
		%feature("compactdefaultargs") SetAxis;
		%feature("autodoc", "Modifies this ellipse, by redefining its local coordinate system so that it becomes a.

Parameters
----------
A: gp_Ax22d

Returns
-------
None
") SetAxis;
		void SetAxis(const gp_Ax22d & A);

		/****************** SetLocation ******************/
		%feature("compactdefaultargs") SetLocation;
		%feature("autodoc", "Modifies this ellipse, by redefining its local coordinate system so that - its origin becomes p.

Parameters
----------
P: gp_Pnt2d

Returns
-------
None
") SetLocation;
		void SetLocation(const gp_Pnt2d & P);

		/****************** SetMajorRadius ******************/
		%feature("compactdefaultargs") SetMajorRadius;
		%feature("autodoc", "Changes the value of the major radius. raises constructionerror if majorradius < minorradius.

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
		%feature("autodoc", "Changes the value of the minor radius. raises constructionerror if majorradius < minorradius or minorradius < 0.0.

Parameters
----------
MinorRadius: float

Returns
-------
None
") SetMinorRadius;
		void SetMinorRadius(const Standard_Real MinorRadius);

		/****************** SetXAxis ******************/
		%feature("compactdefaultargs") SetXAxis;
		%feature("autodoc", "Modifies this ellipse, by redefining its local coordinate system so that its origin and its 'x direction' become those of the axis a. the 'y direction' is then recomputed. the orientation of the local coordinate system is not modified.

Parameters
----------
A: gp_Ax2d

Returns
-------
None
") SetXAxis;
		void SetXAxis(const gp_Ax2d & A);

		/****************** SetYAxis ******************/
		%feature("compactdefaultargs") SetYAxis;
		%feature("autodoc", "Modifies this ellipse, by redefining its local coordinate system so that its origin and its 'y direction' become those of the axis a. the 'x direction' is then recomputed. the orientation of the local coordinate system is not modified.

Parameters
----------
A: gp_Ax2d

Returns
-------
None
") SetYAxis;
		void SetYAxis(const gp_Ax2d & A);

		/****************** Transform ******************/
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

		/****************** Transformed ******************/
		%feature("compactdefaultargs") Transformed;
		%feature("autodoc", "Transforms an ellipse with the transformation t from class trsf2d.

Parameters
----------
T: gp_Trsf2d

Returns
-------
gp_Elips2d
") Transformed;
		gp_Elips2d Transformed(const gp_Trsf2d & T);

		/****************** Translate ******************/
		%feature("compactdefaultargs") Translate;
		%feature("autodoc", "No available documentation.

Parameters
----------
V: gp_Vec2d

Returns
-------
None
") Translate;
		void Translate(const gp_Vec2d & V);

		/****************** Translate ******************/
		%feature("compactdefaultargs") Translate;
		%feature("autodoc", "No available documentation.

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
		%feature("compactdefaultargs") Translated;
		%feature("autodoc", "Translates a ellipse in the direction of the vector v. the magnitude of the translation is the vector's magnitude.

Parameters
----------
V: gp_Vec2d

Returns
-------
gp_Elips2d
") Translated;
		gp_Elips2d Translated(const gp_Vec2d & V);

		/****************** Translated ******************/
		%feature("compactdefaultargs") Translated;
		%feature("autodoc", "Translates a ellipse from the point p1 to the point p2.

Parameters
----------
P1: gp_Pnt2d
P2: gp_Pnt2d

Returns
-------
gp_Elips2d
") Translated;
		gp_Elips2d Translated(const gp_Pnt2d & P1, const gp_Pnt2d & P2);

		/****************** XAxis ******************/
		%feature("compactdefaultargs") XAxis;
		%feature("autodoc", "Returns the major axis of the ellipse.

Returns
-------
gp_Ax2d
") XAxis;
		gp_Ax2d XAxis();

		/****************** YAxis ******************/
		%feature("compactdefaultargs") YAxis;
		%feature("autodoc", "Returns the minor axis of the ellipse. reverses the direction of the circle.

Returns
-------
gp_Ax2d
") YAxis;
		gp_Ax2d YAxis();

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
		/****************** gp_GTrsf ******************/
		%feature("compactdefaultargs") gp_GTrsf;
		%feature("autodoc", "Returns the identity transformation.

Returns
-------
None
") gp_GTrsf;
		 gp_GTrsf();

		/****************** gp_GTrsf ******************/
		%feature("compactdefaultargs") gp_GTrsf;
		%feature("autodoc", "Converts the gp_trsf transformation t into a general transformation, i.e. returns a gtrsf with the same matrix of coefficients as the trsf t.

Parameters
----------
T: gp_Trsf

Returns
-------
None
") gp_GTrsf;
		 gp_GTrsf(const gp_Trsf & T);

		/****************** gp_GTrsf ******************/
		%feature("compactdefaultargs") gp_GTrsf;
		%feature("autodoc", "Creates a transformation based on the matrix m and the vector v where m defines the vectorial part of the transformation, and v the translation part, or.

Parameters
----------
M: gp_Mat
V: gp_XYZ

Returns
-------
None
") gp_GTrsf;
		 gp_GTrsf(const gp_Mat & M, const gp_XYZ & V);

		/****************** Form ******************/
		%feature("compactdefaultargs") Form;
		%feature("autodoc", "Returns the nature of the transformation. it can be an identity transformation, a rotation, a translation, a mirror transformation (relative to a point, an axis or a plane), a scaling transformation, a compound transformation or some other type of transformation.

Returns
-------
gp_TrsfForm
") Form;
		gp_TrsfForm Form();

		/****************** Invert ******************/
		%feature("compactdefaultargs") Invert;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Invert;
		void Invert();

		/****************** Inverted ******************/
		%feature("compactdefaultargs") Inverted;
		%feature("autodoc", "Computes the reverse transformation. raises an exception if the matrix of the transformation is not inversible.

Returns
-------
gp_GTrsf
") Inverted;
		gp_GTrsf Inverted();

		/****************** IsNegative ******************/
		%feature("compactdefaultargs") IsNegative;
		%feature("autodoc", "Returns true if the determinant of the vectorial part of this transformation is negative.

Returns
-------
bool
") IsNegative;
		Standard_Boolean IsNegative();

		/****************** IsSingular ******************/
		%feature("compactdefaultargs") IsSingular;
		%feature("autodoc", "Returns true if this transformation is singular (and therefore, cannot be inverted). note: the gauss lu decomposition is used to invert the transformation matrix. consequently, the transformation is considered as singular if the largest pivot found is less than or equal to gp::resolution(). warning if this transformation is singular, it cannot be inverted.

Returns
-------
bool
") IsSingular;
		Standard_Boolean IsSingular();

		/****************** Multiplied ******************/
		%feature("compactdefaultargs") Multiplied;
		%feature("autodoc", "Computes the transformation composed from t and <self>. in a c++ implementation you can also write tcomposed = <self> * t. example : gtrsf t1, t2, tcomp; ............... //composition : tcomp = t2.multiplied(t1); // or (tcomp = t2 * t1) // transformation of a point xyz p(10.,3.,4.); xyz p1(p); tcomp.transforms(p1); //using tcomp xyz p2(p); t1.transforms(p2); //using t1 then t2 t2.transforms(p2); // p1 = p2 !!!.

Parameters
----------
T: gp_GTrsf

Returns
-------
gp_GTrsf
") Multiplied;
		gp_GTrsf Multiplied(const gp_GTrsf & T);

		/****************** Multiply ******************/
		%feature("compactdefaultargs") Multiply;
		%feature("autodoc", "Computes the transformation composed with <self> and t. <self> = <self> * t.

Parameters
----------
T: gp_GTrsf

Returns
-------
None
") Multiply;
		void Multiply(const gp_GTrsf & T);

		/****************** Power ******************/
		%feature("compactdefaultargs") Power;
		%feature("autodoc", "No available documentation.

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
		%feature("autodoc", "Computes: - the product of this transformation multiplied by itself n times, if n is positive, or - the product of the inverse of this transformation multiplied by itself |n| times, if n is negative. if n equals zero, the result is equal to the identity transformation. i.e.: <self> * <self> * .......* <self>, n time. if n =0 <self> = identity if n < 0 <self> = <self>.inverse() *...........* <self>.inverse(). //! raises an exception if n < 0 and if the matrix of the transformation not inversible.

Parameters
----------
N: int

Returns
-------
gp_GTrsf
") Powered;
		gp_GTrsf Powered(const Standard_Integer N);

		/****************** PreMultiply ******************/
		%feature("compactdefaultargs") PreMultiply;
		%feature("autodoc", "Computes the product of the transformation t and this transformation and assigns the result to this transformation. this = t * this.

Parameters
----------
T: gp_GTrsf

Returns
-------
None
") PreMultiply;
		void PreMultiply(const gp_GTrsf & T);

		/****************** SetAffinity ******************/
		%feature("compactdefaultargs") SetAffinity;
		%feature("autodoc", "Changes this transformation into an affinity of ratio ratio with respect to the axis a1. note: an affinity is a point-by-point transformation that transforms any point p into a point p' such that if h is the orthogonal projection of p on the axis a1 or the plane a2, the vectors hp and hp' satisfy: hp' = ratio * hp.

Parameters
----------
A1: gp_Ax1
Ratio: float

Returns
-------
None
") SetAffinity;
		void SetAffinity(const gp_Ax1 & A1, const Standard_Real Ratio);

		/****************** SetAffinity ******************/
		%feature("compactdefaultargs") SetAffinity;
		%feature("autodoc", "Changes this transformation into an affinity of ratio ratio with respect to the plane defined by the origin, the 'x direction' and the 'y direction' of coordinate system a2. note: an affinity is a point-by-point transformation that transforms any point p into a point p' such that if h is the orthogonal projection of p on the axis a1 or the plane a2, the vectors hp and hp' satisfy: hp' = ratio * hp.

Parameters
----------
A2: gp_Ax2
Ratio: float

Returns
-------
None
") SetAffinity;
		void SetAffinity(const gp_Ax2 & A2, const Standard_Real Ratio);

		/****************** SetForm ******************/
		%feature("compactdefaultargs") SetForm;
		%feature("autodoc", "Verify and set the shape of the gtrsf other or compoundtrsf ex : mygtrsf.setvalue(row1,col1,val1); mygtrsf.setvalue(row2,col2,val2); ... mygtrsf.setform();.

Returns
-------
None
") SetForm;
		void SetForm();

		/****************** SetTranslationPart ******************/
		%feature("compactdefaultargs") SetTranslationPart;
		%feature("autodoc", "Replaces the translation part of this transformation by the coordinates of the number triple coord.

Parameters
----------
Coord: gp_XYZ

Returns
-------
None
") SetTranslationPart;
		void SetTranslationPart(const gp_XYZ & Coord);

		/****************** SetTrsf ******************/
		%feature("compactdefaultargs") SetTrsf;
		%feature("autodoc", "Assigns the vectorial and translation parts of t to this transformation.

Parameters
----------
T: gp_Trsf

Returns
-------
None
") SetTrsf;
		void SetTrsf(const gp_Trsf & T);

		/****************** SetValue ******************/
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "Replaces the coefficient (row, col) of the matrix representing this transformation by value. raises outofrange if row < 1 or row > 3 or col < 1 or col > 4.

Parameters
----------
Row: int
Col: int
Value: float

Returns
-------
None
") SetValue;
		void SetValue(const Standard_Integer Row, const Standard_Integer Col, const Standard_Real Value);

		/****************** SetVectorialPart ******************/
		%feature("compactdefaultargs") SetVectorialPart;
		%feature("autodoc", "Replaces the vectorial part of this transformation by matrix.

Parameters
----------
Matrix: gp_Mat

Returns
-------
None
") SetVectorialPart;
		void SetVectorialPart(const gp_Mat & Matrix);

		/****************** Transforms ******************/
		%feature("compactdefaultargs") Transforms;
		%feature("autodoc", "No available documentation.

Parameters
----------
Coord: gp_XYZ

Returns
-------
None
") Transforms;
		void Transforms(gp_XYZ & Coord);

		/****************** Transforms ******************/
		%feature("compactdefaultargs") Transforms;
		%feature("autodoc", "Transforms a triplet xyz with a gtrsf.

Parameters
----------

Returns
-------
X: float
Y: float
Z: float
") Transforms;
		void Transforms(Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** TranslationPart ******************/
		%feature("compactdefaultargs") TranslationPart;
		%feature("autodoc", "Returns the translation part of the gtrsf.

Returns
-------
gp_XYZ
") TranslationPart;
		const gp_XYZ TranslationPart();

		/****************** Trsf ******************/
		%feature("compactdefaultargs") Trsf;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Trsf
") Trsf;
		gp_Trsf Trsf();

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Returns the coefficients of the global matrix of transformation. raises outofrange if row < 1 or row > 3 or col < 1 or col > 4.

Parameters
----------
Row: int
Col: int

Returns
-------
float
") Value;
		Standard_Real Value(const Standard_Integer Row, const Standard_Integer Col);

		/****************** VectorialPart ******************/
		%feature("compactdefaultargs") VectorialPart;
		%feature("autodoc", "Computes the vectorial part of the gtrsf. the returned matrix is a 3*3 matrix.

Returns
-------
gp_Mat
") VectorialPart;
		const gp_Mat VectorialPart();

		/****************** operator * ******************/
		%feature("compactdefaultargs") operator *;
		%feature("autodoc", "No available documentation.

Parameters
----------
T: gp_GTrsf

Returns
-------
gp_GTrsf
") operator *;
		gp_GTrsf operator *(const gp_GTrsf & T);


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
	__repr__ = _dumps_object
	}
};

/*******************
* class gp_GTrsf2d *
*******************/
class gp_GTrsf2d {
	public:
		/****************** gp_GTrsf2d ******************/
		%feature("compactdefaultargs") gp_GTrsf2d;
		%feature("autodoc", "Returns identity transformation.

Returns
-------
None
") gp_GTrsf2d;
		 gp_GTrsf2d();

		/****************** gp_GTrsf2d ******************/
		%feature("compactdefaultargs") gp_GTrsf2d;
		%feature("autodoc", "Converts the gp_trsf2d transformation t into a general transformation.

Parameters
----------
T: gp_Trsf2d

Returns
-------
None
") gp_GTrsf2d;
		 gp_GTrsf2d(const gp_Trsf2d & T);

		/****************** gp_GTrsf2d ******************/
		%feature("compactdefaultargs") gp_GTrsf2d;
		%feature("autodoc", "Creates a transformation based on the matrix m and the vector v where m defines the vectorial part of the transformation, and v the translation part.

Parameters
----------
M: gp_Mat2d
V: gp_XY

Returns
-------
None
") gp_GTrsf2d;
		 gp_GTrsf2d(const gp_Mat2d & M, const gp_XY & V);

		/****************** Form ******************/
		%feature("compactdefaultargs") Form;
		%feature("autodoc", "Returns the nature of the transformation. it can be an identity transformation, a rotation, a translation, a mirror transformation (relative to a point or axis), a scaling transformation, a compound transformation or some other type of transformation.

Returns
-------
gp_TrsfForm
") Form;
		gp_TrsfForm Form();

		/****************** Invert ******************/
		%feature("compactdefaultargs") Invert;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Invert;
		void Invert();

		/****************** Inverted ******************/
		%feature("compactdefaultargs") Inverted;
		%feature("autodoc", "Computes the reverse transformation. raised an exception if the matrix of the transformation is not inversible.

Returns
-------
gp_GTrsf2d
") Inverted;
		gp_GTrsf2d Inverted();

		/****************** IsNegative ******************/
		%feature("compactdefaultargs") IsNegative;
		%feature("autodoc", "Returns true if the determinant of the vectorial part of this transformation is negative.

Returns
-------
bool
") IsNegative;
		Standard_Boolean IsNegative();

		/****************** IsSingular ******************/
		%feature("compactdefaultargs") IsSingular;
		%feature("autodoc", "Returns true if this transformation is singular (and therefore, cannot be inverted). note: the gauss lu decomposition is used to invert the transformation matrix. consequently, the transformation is considered as singular if the largest pivot found is less than or equal to gp::resolution(). warning if this transformation is singular, it cannot be inverted.

Returns
-------
bool
") IsSingular;
		Standard_Boolean IsSingular();

		/****************** Multiplied ******************/
		%feature("compactdefaultargs") Multiplied;
		%feature("autodoc", "Computes the transformation composed with t and <self>. in a c++ implementation you can also write tcomposed = <self> * t. example : gtrsf2d t1, t2, tcomp; ............... //composition : tcomp = t2.multiplied(t1); // or (tcomp = t2 * t1) // transformation of a point xy p(10.,3.); xy p1(p); tcomp.transforms(p1); //using tcomp xy p2(p); t1.transforms(p2); //using t1 then t2 t2.transforms(p2); // p1 = p2 !!!.

Parameters
----------
T: gp_GTrsf2d

Returns
-------
gp_GTrsf2d
") Multiplied;
		gp_GTrsf2d Multiplied(const gp_GTrsf2d & T);

		/****************** Multiply ******************/
		%feature("compactdefaultargs") Multiply;
		%feature("autodoc", "No available documentation.

Parameters
----------
T: gp_GTrsf2d

Returns
-------
None
") Multiply;
		void Multiply(const gp_GTrsf2d & T);

		/****************** Power ******************/
		%feature("compactdefaultargs") Power;
		%feature("autodoc", "No available documentation.

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
		%feature("autodoc", "Computes the following composition of transformations <self> * <self> * .......* <self>, n time. if n = 0 <self> = identity if n < 0 <self> = <self>.inverse() *...........* <self>.inverse(). //! raises an exception if n < 0 and if the matrix of the transformation is not inversible.

Parameters
----------
N: int

Returns
-------
gp_GTrsf2d
") Powered;
		gp_GTrsf2d Powered(const Standard_Integer N);

		/****************** PreMultiply ******************/
		%feature("compactdefaultargs") PreMultiply;
		%feature("autodoc", "Computes the product of the transformation t and this transformation, and assigns the result to this transformation: this = t * this.

Parameters
----------
T: gp_GTrsf2d

Returns
-------
None
") PreMultiply;
		void PreMultiply(const gp_GTrsf2d & T);

		/****************** SetAffinity ******************/
		%feature("compactdefaultargs") SetAffinity;
		%feature("autodoc", "Changes this transformation into an affinity of ratio ratio with respect to the axis a. note: an affinity is a point-by-point transformation that transforms any point p into a point p' such that if h is the orthogonal projection of p on the axis a, the vectors hp and hp' satisfy: hp' = ratio * hp.

Parameters
----------
A: gp_Ax2d
Ratio: float

Returns
-------
None
") SetAffinity;
		void SetAffinity(const gp_Ax2d & A, const Standard_Real Ratio);

		/****************** SetTranslationPart ******************/
		%feature("compactdefaultargs") SetTranslationPart;
		%feature("autodoc", "Replacesthe translation part of this transformation by the coordinates of the number pair coord.

Parameters
----------
Coord: gp_XY

Returns
-------
None
") SetTranslationPart;
		void SetTranslationPart(const gp_XY & Coord);

		/****************** SetTrsf2d ******************/
		%feature("compactdefaultargs") SetTrsf2d;
		%feature("autodoc", "Assigns the vectorial and translation parts of t to this transformation.

Parameters
----------
T: gp_Trsf2d

Returns
-------
None
") SetTrsf2d;
		void SetTrsf2d(const gp_Trsf2d & T);

		/****************** SetValue ******************/
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "Replaces the coefficient (row, col) of the matrix representing this transformation by value, raises outofrange if row < 1 or row > 2 or col < 1 or col > 3.

Parameters
----------
Row: int
Col: int
Value: float

Returns
-------
None
") SetValue;
		void SetValue(const Standard_Integer Row, const Standard_Integer Col, const Standard_Real Value);

		/****************** SetVectorialPart ******************/
		%feature("compactdefaultargs") SetVectorialPart;
		%feature("autodoc", "Replaces the vectorial part of this transformation by matrix.

Parameters
----------
Matrix: gp_Mat2d

Returns
-------
None
") SetVectorialPart;
		void SetVectorialPart(const gp_Mat2d & Matrix);

		/****************** Transformed ******************/
		%feature("compactdefaultargs") Transformed;
		%feature("autodoc", "No available documentation.

Parameters
----------
Coord: gp_XY

Returns
-------
gp_XY
") Transformed;
		gp_XY Transformed(const gp_XY & Coord);

		/****************** Transforms ******************/
		%feature("compactdefaultargs") Transforms;
		%feature("autodoc", "No available documentation.

Parameters
----------
Coord: gp_XY

Returns
-------
None
") Transforms;
		void Transforms(gp_XY & Coord);

		/****************** Transforms ******************/
		%feature("compactdefaultargs") Transforms;
		%feature("autodoc", "Applies this transformation to the coordinates: - of the number pair coord, or - x and y. //! note: - transforms modifies x, y, or the coordinate pair coord, while - transformed creates a new coordinate pair.

Parameters
----------

Returns
-------
X: float
Y: float
") Transforms;
		void Transforms(Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** TranslationPart ******************/
		%feature("compactdefaultargs") TranslationPart;
		%feature("autodoc", "Returns the translation part of the gtrsf2d.

Returns
-------
gp_XY
") TranslationPart;
		const gp_XY TranslationPart();

		/****************** Trsf2d ******************/
		%feature("compactdefaultargs") Trsf2d;
		%feature("autodoc", "Converts this transformation into a gp_trsf2d transformation. exceptions standard_constructionerror if this transformation cannot be converted, i.e. if its form is gp_other.

Returns
-------
gp_Trsf2d
") Trsf2d;
		gp_Trsf2d Trsf2d();

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Returns the coefficients of the global matrix of transformation. raised outofrange if row < 1 or row > 2 or col < 1 or col > 3.

Parameters
----------
Row: int
Col: int

Returns
-------
float
") Value;
		Standard_Real Value(const Standard_Integer Row, const Standard_Integer Col);

		/****************** VectorialPart ******************/
		%feature("compactdefaultargs") VectorialPart;
		%feature("autodoc", "Computes the vectorial part of the gtrsf2d. the returned matrix is a 2*2 matrix.

Returns
-------
gp_Mat2d
") VectorialPart;
		const gp_Mat2d VectorialPart();

		/****************** operator * ******************/
		%feature("compactdefaultargs") operator *;
		%feature("autodoc", "No available documentation.

Parameters
----------
T: gp_GTrsf2d

Returns
-------
gp_GTrsf2d
") operator *;
		gp_GTrsf2d operator *(const gp_GTrsf2d & T);


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
	__repr__ = _dumps_object
	}
};

/****************
* class gp_Hypr *
****************/
class gp_Hypr {
	public:
		/****************** gp_Hypr ******************/
		%feature("compactdefaultargs") gp_Hypr;
		%feature("autodoc", "Creates of an indefinite hyperbola.

Returns
-------
None
") gp_Hypr;
		 gp_Hypr();

		/****************** gp_Hypr ******************/
		%feature("compactdefaultargs") gp_Hypr;
		%feature("autodoc", "Creates a hyperbola with radii majorradius and minorradius, positioned in the space by the coordinate system a2 such that: - the origin of a2 is the center of the hyperbola, - the 'x direction' of a2 defines the major axis of the hyperbola, that is, the major radius majorradius is measured along this axis, and - the 'y direction' of a2 defines the minor axis of the hyperbola, that is, the minor radius minorradius is measured along this axis. note: this class does not prevent the creation of a hyperbola where: - majoraxis is equal to minoraxis, or - majoraxis is less than minoraxis. exceptions standard_constructionerror if majoraxis or minoraxis is negative. raises constructionerror if majorradius < 0.0 or minorradius < 0.0 raised if majorradius < 0.0 or minorradius < 0.0.

Parameters
----------
A2: gp_Ax2
MajorRadius: float
MinorRadius: float

Returns
-------
None
") gp_Hypr;
		 gp_Hypr(const gp_Ax2 & A2, const Standard_Real MajorRadius, const Standard_Real MinorRadius);

		/****************** Asymptote1 ******************/
		%feature("compactdefaultargs") Asymptote1;
		%feature("autodoc", "In the local coordinate system of the hyperbola the equation of the hyperbola is (x*x)/(a*a) - (y*y)/(b*b) = 1.0 and the equation of the first asymptote is y = (b/a)*x where a is the major radius and b is the minor radius. raises constructionerror if majorradius = 0.0.

Returns
-------
gp_Ax1
") Asymptote1;
		gp_Ax1 Asymptote1();

		/****************** Asymptote2 ******************/
		%feature("compactdefaultargs") Asymptote2;
		%feature("autodoc", "In the local coordinate system of the hyperbola the equation of the hyperbola is (x*x)/(a*a) - (y*y)/(b*b) = 1.0 and the equation of the first asymptote is y = -(b/a)*x. where a is the major radius and b is the minor radius. raises constructionerror if majorradius = 0.0.

Returns
-------
gp_Ax1
") Asymptote2;
		gp_Ax1 Asymptote2();

		/****************** Axis ******************/
		%feature("compactdefaultargs") Axis;
		%feature("autodoc", "Returns the axis passing through the center, and normal to the plane of this hyperbola.

Returns
-------
gp_Ax1
") Axis;
		const gp_Ax1 Axis();

		/****************** ConjugateBranch1 ******************/
		%feature("compactdefaultargs") ConjugateBranch1;
		%feature("autodoc", "Computes the branch of hyperbola which is on the positive side of the 'yaxis' of <self>.

Returns
-------
gp_Hypr
") ConjugateBranch1;
		gp_Hypr ConjugateBranch1();

		/****************** ConjugateBranch2 ******************/
		%feature("compactdefaultargs") ConjugateBranch2;
		%feature("autodoc", "Computes the branch of hyperbola which is on the negative side of the 'yaxis' of <self>.

Returns
-------
gp_Hypr
") ConjugateBranch2;
		gp_Hypr ConjugateBranch2();

		/****************** Directrix1 ******************/
		%feature("compactdefaultargs") Directrix1;
		%feature("autodoc", "This directrix is the line normal to the xaxis of the hyperbola in the local plane (z = 0) at a distance d = majorradius / e from the center of the hyperbola, where e is the eccentricity of the hyperbola. this line is parallel to the 'yaxis'. the intersection point between the directrix1 and the 'xaxis' is the 'location' point of the directrix1. this point is on the positive side of the 'xaxis'.

Returns
-------
gp_Ax1
") Directrix1;
		gp_Ax1 Directrix1();

		/****************** Directrix2 ******************/
		%feature("compactdefaultargs") Directrix2;
		%feature("autodoc", "This line is obtained by the symmetrical transformation of 'directrix1' with respect to the 'yaxis' of the hyperbola.

Returns
-------
gp_Ax1
") Directrix2;
		gp_Ax1 Directrix2();

		/****************** Eccentricity ******************/
		%feature("compactdefaultargs") Eccentricity;
		%feature("autodoc", "Returns the excentricity of the hyperbola (e > 1). if f is the distance between the location of the hyperbola and the focus1 then the eccentricity e = f / majorradius. raises domainerror if majorradius = 0.0.

Returns
-------
float
") Eccentricity;
		Standard_Real Eccentricity();

		/****************** Focal ******************/
		%feature("compactdefaultargs") Focal;
		%feature("autodoc", "Computes the focal distance. it is the distance between the the two focus of the hyperbola.

Returns
-------
float
") Focal;
		Standard_Real Focal();

		/****************** Focus1 ******************/
		%feature("compactdefaultargs") Focus1;
		%feature("autodoc", "Returns the first focus of the hyperbola. this focus is on the positive side of the 'xaxis' of the hyperbola.

Returns
-------
gp_Pnt
") Focus1;
		gp_Pnt Focus1();

		/****************** Focus2 ******************/
		%feature("compactdefaultargs") Focus2;
		%feature("autodoc", "Returns the second focus of the hyperbola. this focus is on the negative side of the 'xaxis' of the hyperbola.

Returns
-------
gp_Pnt
") Focus2;
		gp_Pnt Focus2();

		/****************** Location ******************/
		%feature("compactdefaultargs") Location;
		%feature("autodoc", "Returns the location point of the hyperbola. it is the intersection point between the 'xaxis' and the 'yaxis'.

Returns
-------
gp_Pnt
") Location;
		const gp_Pnt Location();

		/****************** MajorRadius ******************/
		%feature("compactdefaultargs") MajorRadius;
		%feature("autodoc", "Returns the major radius of the hyperbola. it is the radius on the 'xaxis' of the hyperbola.

Returns
-------
float
") MajorRadius;
		Standard_Real MajorRadius();

		/****************** MinorRadius ******************/
		%feature("compactdefaultargs") MinorRadius;
		%feature("autodoc", "Returns the minor radius of the hyperbola. it is the radius on the 'yaxis' of the hyperbola.

Returns
-------
float
") MinorRadius;
		Standard_Real MinorRadius();

		/****************** Mirror ******************/
		%feature("compactdefaultargs") Mirror;
		%feature("autodoc", "No available documentation.

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
		%feature("autodoc", "No available documentation.

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
		%feature("autodoc", "No available documentation.

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
		%feature("autodoc", "Performs the symmetrical transformation of an hyperbola with respect to the point p which is the center of the symmetry.

Parameters
----------
P: gp_Pnt

Returns
-------
gp_Hypr
") Mirrored;
		gp_Hypr Mirrored(const gp_Pnt & P);

		/****************** Mirrored ******************/
		%feature("compactdefaultargs") Mirrored;
		%feature("autodoc", "Performs the symmetrical transformation of an hyperbola with respect to an axis placement which is the axis of the symmetry.

Parameters
----------
A1: gp_Ax1

Returns
-------
gp_Hypr
") Mirrored;
		gp_Hypr Mirrored(const gp_Ax1 & A1);

		/****************** Mirrored ******************/
		%feature("compactdefaultargs") Mirrored;
		%feature("autodoc", "Performs the symmetrical transformation of an hyperbola with respect to a plane. the axis placement a2 locates the plane of the symmetry (location, xdirection, ydirection).

Parameters
----------
A2: gp_Ax2

Returns
-------
gp_Hypr
") Mirrored;
		gp_Hypr Mirrored(const gp_Ax2 & A2);

		/****************** OtherBranch ******************/
		%feature("compactdefaultargs") OtherBranch;
		%feature("autodoc", "Returns the branch of hyperbola obtained by doing the symmetrical transformation of <self> with respect to the 'yaxis' of <self>.

Returns
-------
gp_Hypr
") OtherBranch;
		gp_Hypr OtherBranch();

		/****************** Parameter ******************/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "Returns p = (e * e - 1) * majorradius where e is the eccentricity of the hyperbola. raises domainerror if majorradius = 0.0.

Returns
-------
float
") Parameter;
		Standard_Real Parameter();

		/****************** Position ******************/
		%feature("compactdefaultargs") Position;
		%feature("autodoc", "Returns the coordinate system of the hyperbola.

Returns
-------
gp_Ax2
") Position;
		const gp_Ax2 Position();

		/****************** Rotate ******************/
		%feature("compactdefaultargs") Rotate;
		%feature("autodoc", "No available documentation.

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
		%feature("autodoc", "Rotates an hyperbola. a1 is the axis of the rotation. ang is the angular value of the rotation in radians.

Parameters
----------
A1: gp_Ax1
Ang: float

Returns
-------
gp_Hypr
") Rotated;
		gp_Hypr Rotated(const gp_Ax1 & A1, const Standard_Real Ang);

		/****************** Scale ******************/
		%feature("compactdefaultargs") Scale;
		%feature("autodoc", "No available documentation.

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
		%feature("autodoc", "Scales an hyperbola. s is the scaling value.

Parameters
----------
P: gp_Pnt
S: float

Returns
-------
gp_Hypr
") Scaled;
		gp_Hypr Scaled(const gp_Pnt & P, const Standard_Real S);

		/****************** SetAxis ******************/
		%feature("compactdefaultargs") SetAxis;
		%feature("autodoc", "Modifies this hyperbola, by redefining its local coordinate system so that: - its origin and 'main direction' become those of the axis a1 (the 'x direction' and 'y direction' are then recomputed in the same way as for any gp_ax2). raises constructionerror if the direction of a1 is parallel to the direction of the 'xaxis' of the hyperbola.

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
		%feature("autodoc", "Modifies this hyperbola, by redefining its local coordinate system so that its origin becomes p.

Parameters
----------
P: gp_Pnt

Returns
-------
None
") SetLocation;
		void SetLocation(const gp_Pnt & P);

		/****************** SetMajorRadius ******************/
		%feature("compactdefaultargs") SetMajorRadius;
		%feature("autodoc", "Modifies the major radius of this hyperbola. exceptions standard_constructionerror if majorradius is negative.

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
		%feature("autodoc", "Modifies the minor radius of this hyperbola. exceptions standard_constructionerror if minorradius is negative.

Parameters
----------
MinorRadius: float

Returns
-------
None
") SetMinorRadius;
		void SetMinorRadius(const Standard_Real MinorRadius);

		/****************** SetPosition ******************/
		%feature("compactdefaultargs") SetPosition;
		%feature("autodoc", "Modifies this hyperbola, by redefining its local coordinate system so that it becomes a2.

Parameters
----------
A2: gp_Ax2

Returns
-------
None
") SetPosition;
		void SetPosition(const gp_Ax2 & A2);

		/****************** Transform ******************/
		%feature("compactdefaultargs") Transform;
		%feature("autodoc", "No available documentation.

Parameters
----------
T: gp_Trsf

Returns
-------
None
") Transform;
		void Transform(const gp_Trsf & T);

		/****************** Transformed ******************/
		%feature("compactdefaultargs") Transformed;
		%feature("autodoc", "Transforms an hyperbola with the transformation t from class trsf.

Parameters
----------
T: gp_Trsf

Returns
-------
gp_Hypr
") Transformed;
		gp_Hypr Transformed(const gp_Trsf & T);

		/****************** Translate ******************/
		%feature("compactdefaultargs") Translate;
		%feature("autodoc", "No available documentation.

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
		%feature("autodoc", "No available documentation.

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
		%feature("autodoc", "Translates an hyperbola in the direction of the vector v. the magnitude of the translation is the vector's magnitude.

Parameters
----------
V: gp_Vec

Returns
-------
gp_Hypr
") Translated;
		gp_Hypr Translated(const gp_Vec & V);

		/****************** Translated ******************/
		%feature("compactdefaultargs") Translated;
		%feature("autodoc", "Translates an hyperbola from the point p1 to the point p2.

Parameters
----------
P1: gp_Pnt
P2: gp_Pnt

Returns
-------
gp_Hypr
") Translated;
		gp_Hypr Translated(const gp_Pnt & P1, const gp_Pnt & P2);

		/****************** XAxis ******************/
		%feature("compactdefaultargs") XAxis;
		%feature("autodoc", "Computes an axis, whose - the origin is the center of this hyperbola, and - the unit vector is the 'x direction' of the local coordinate system of this hyperbola. these axes are, the major axis (the 'x axis') and of this hyperboreturns the 'xaxis' of the hyperbola.

Returns
-------
gp_Ax1
") XAxis;
		gp_Ax1 XAxis();

		/****************** YAxis ******************/
		%feature("compactdefaultargs") YAxis;
		%feature("autodoc", "Computes an axis, whose - the origin is the center of this hyperbola, and - the unit vector is the 'y direction' of the local coordinate system of this hyperbola. these axes are the minor axis (the 'y axis') of this hyperbola.

Returns
-------
gp_Ax1
") YAxis;
		gp_Ax1 YAxis();

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
		/****************** gp_Hypr2d ******************/
		%feature("compactdefaultargs") gp_Hypr2d;
		%feature("autodoc", "Creates of an indefinite hyperbola.

Returns
-------
None
") gp_Hypr2d;
		 gp_Hypr2d();

		/****************** gp_Hypr2d ******************/
		%feature("compactdefaultargs") gp_Hypr2d;
		%feature("autodoc", "Creates a hyperbola with radii majorradius and minorradius, centered on the origin of majoraxis and where the unit vector of majoraxis is the 'x direction' of the local coordinate system of the hyperbola. this coordinate system is direct if sense is true (the default value), and indirect if sense is false. warnings : it is yet possible to create an hyperbola with majorradius <= minorradius. raises constructionerror if majorradius < 0.0 or minorradius < 0.0.

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
") gp_Hypr2d;
		 gp_Hypr2d(const gp_Ax2d & MajorAxis, const Standard_Real MajorRadius, const Standard_Real MinorRadius, const Standard_Boolean Sense = Standard_True);

		/****************** gp_Hypr2d ******************/
		%feature("compactdefaultargs") gp_Hypr2d;
		%feature("autodoc", "A hyperbola with radii majorradius and minorradius, positioned in the plane by coordinate system a where: - the origin of a is the center of the hyperbola, - the 'x direction' of a defines the major axis of the hyperbola, that is, the major radius majorradius is measured along this axis, and - the 'y direction' of a defines the minor axis of the hyperbola, that is, the minor radius minorradius is measured along this axis, and - the orientation (direct or indirect sense) of a gives the implicit orientation of the hyperbola. warnings : it is yet possible to create an hyperbola with majorradius <= minorradius. raises constructionerror if majorradius < 0.0 or minorradius < 0.0.

Parameters
----------
A: gp_Ax22d
MajorRadius: float
MinorRadius: float

Returns
-------
None
") gp_Hypr2d;
		 gp_Hypr2d(const gp_Ax22d & A, const Standard_Real MajorRadius, const Standard_Real MinorRadius);

		/****************** Asymptote1 ******************/
		%feature("compactdefaultargs") Asymptote1;
		%feature("autodoc", "In the local coordinate system of the hyperbola the equation of the hyperbola is (x*x)/(a*a) - (y*y)/(b*b) = 1.0 and the equation of the first asymptote is y = (b/a)*x where a is the major radius of the hyperbola and b the minor radius of the hyperbola. raises constructionerror if majorradius = 0.0.

Returns
-------
gp_Ax2d
") Asymptote1;
		gp_Ax2d Asymptote1();

		/****************** Asymptote2 ******************/
		%feature("compactdefaultargs") Asymptote2;
		%feature("autodoc", "In the local coordinate system of the hyperbola the equation of the hyperbola is (x*x)/(a*a) - (y*y)/(b*b) = 1.0 and the equation of the first asymptote is y = -(b/a)*x where a is the major radius of the hyperbola and b the minor radius of the hyperbola. raises constructionerror if majorradius = 0.0.

Returns
-------
gp_Ax2d
") Asymptote2;
		gp_Ax2d Asymptote2();

		/****************** Axis ******************/
		%feature("compactdefaultargs") Axis;
		%feature("autodoc", "Returns the axisplacement of the hyperbola.

Returns
-------
gp_Ax22d
") Axis;
		const gp_Ax22d Axis();

		/****************** Coefficients ******************/
		%feature("compactdefaultargs") Coefficients;
		%feature("autodoc", "Computes the coefficients of the implicit equation of the hyperbola : a * (x**2) + b * (y**2) + 2*c*(x*y) + 2*d*x + 2*e*y + f = 0.

Parameters
----------

Returns
-------
A: float
B: float
C: float
D: float
E: float
F: float
") Coefficients;
		void Coefficients(Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** ConjugateBranch1 ******************/
		%feature("compactdefaultargs") ConjugateBranch1;
		%feature("autodoc", "Computes the branch of hyperbola which is on the positive side of the 'yaxis' of <self>.

Returns
-------
gp_Hypr2d
") ConjugateBranch1;
		gp_Hypr2d ConjugateBranch1();

		/****************** ConjugateBranch2 ******************/
		%feature("compactdefaultargs") ConjugateBranch2;
		%feature("autodoc", "Computes the branch of hyperbola which is on the negative side of the 'yaxis' of <self>.

Returns
-------
gp_Hypr2d
") ConjugateBranch2;
		gp_Hypr2d ConjugateBranch2();

		/****************** Directrix1 ******************/
		%feature("compactdefaultargs") Directrix1;
		%feature("autodoc", "Computes the directrix which is the line normal to the xaxis of the hyperbola in the local plane (z = 0) at a distance d = majorradius / e from the center of the hyperbola, where e is the eccentricity of the hyperbola. this line is parallel to the 'yaxis'. the intersection point between the 'directrix1' and the 'xaxis' is the 'location' point of the 'directrix1'. this point is on the positive side of the 'xaxis'.

Returns
-------
gp_Ax2d
") Directrix1;
		gp_Ax2d Directrix1();

		/****************** Directrix2 ******************/
		%feature("compactdefaultargs") Directrix2;
		%feature("autodoc", "This line is obtained by the symmetrical transformation of 'directrix1' with respect to the 'yaxis' of the hyperbola.

Returns
-------
gp_Ax2d
") Directrix2;
		gp_Ax2d Directrix2();

		/****************** Eccentricity ******************/
		%feature("compactdefaultargs") Eccentricity;
		%feature("autodoc", "Returns the excentricity of the hyperbola (e > 1). if f is the distance between the location of the hyperbola and the focus1 then the eccentricity e = f / majorradius. raises domainerror if majorradius = 0.0.

Returns
-------
float
") Eccentricity;
		Standard_Real Eccentricity();

		/****************** Focal ******************/
		%feature("compactdefaultargs") Focal;
		%feature("autodoc", "Computes the focal distance. it is the distance between the 'location' of the hyperbola and 'focus1' or 'focus2'.

Returns
-------
float
") Focal;
		Standard_Real Focal();

		/****************** Focus1 ******************/
		%feature("compactdefaultargs") Focus1;
		%feature("autodoc", "Returns the first focus of the hyperbola. this focus is on the positive side of the 'xaxis' of the hyperbola.

Returns
-------
gp_Pnt2d
") Focus1;
		gp_Pnt2d Focus1();

		/****************** Focus2 ******************/
		%feature("compactdefaultargs") Focus2;
		%feature("autodoc", "Returns the second focus of the hyperbola. this focus is on the negative side of the 'xaxis' of the hyperbola.

Returns
-------
gp_Pnt2d
") Focus2;
		gp_Pnt2d Focus2();

		/****************** IsDirect ******************/
		%feature("compactdefaultargs") IsDirect;
		%feature("autodoc", "Returns true if the local coordinate system is direct and false in the other case.

Returns
-------
bool
") IsDirect;
		Standard_Boolean IsDirect();

		/****************** Location ******************/
		%feature("compactdefaultargs") Location;
		%feature("autodoc", "Returns the location point of the hyperbola. it is the intersection point between the 'xaxis' and the 'yaxis'.

Returns
-------
gp_Pnt2d
") Location;
		const gp_Pnt2d Location();

		/****************** MajorRadius ******************/
		%feature("compactdefaultargs") MajorRadius;
		%feature("autodoc", "Returns the major radius of the hyperbola (it is the radius corresponding to the 'xaxis' of the hyperbola).

Returns
-------
float
") MajorRadius;
		Standard_Real MajorRadius();

		/****************** MinorRadius ******************/
		%feature("compactdefaultargs") MinorRadius;
		%feature("autodoc", "Returns the minor radius of the hyperbola (it is the radius corresponding to the 'yaxis' of the hyperbola).

Returns
-------
float
") MinorRadius;
		Standard_Real MinorRadius();

		/****************** Mirror ******************/
		%feature("compactdefaultargs") Mirror;
		%feature("autodoc", "No available documentation.

Parameters
----------
P: gp_Pnt2d

Returns
-------
None
") Mirror;
		void Mirror(const gp_Pnt2d & P);

		/****************** Mirror ******************/
		%feature("compactdefaultargs") Mirror;
		%feature("autodoc", "No available documentation.

Parameters
----------
A: gp_Ax2d

Returns
-------
None
") Mirror;
		void Mirror(const gp_Ax2d & A);

		/****************** Mirrored ******************/
		%feature("compactdefaultargs") Mirrored;
		%feature("autodoc", "Performs the symmetrical transformation of an hyperbola with respect to the point p which is the center of the symmetry.

Parameters
----------
P: gp_Pnt2d

Returns
-------
gp_Hypr2d
") Mirrored;
		gp_Hypr2d Mirrored(const gp_Pnt2d & P);

		/****************** Mirrored ******************/
		%feature("compactdefaultargs") Mirrored;
		%feature("autodoc", "Performs the symmetrical transformation of an hyperbola with respect to an axis placement which is the axis of the symmetry.

Parameters
----------
A: gp_Ax2d

Returns
-------
gp_Hypr2d
") Mirrored;
		gp_Hypr2d Mirrored(const gp_Ax2d & A);

		/****************** OtherBranch ******************/
		%feature("compactdefaultargs") OtherBranch;
		%feature("autodoc", "Returns the branch of hyperbola obtained by doing the symmetrical transformation of <self> with respect to the 'yaxis' of <self>.

Returns
-------
gp_Hypr2d
") OtherBranch;
		gp_Hypr2d OtherBranch();

		/****************** Parameter ******************/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "Returns p = (e * e - 1) * majorradius where e is the eccentricity of the hyperbola. raises domainerror if majorradius = 0.0.

Returns
-------
float
") Parameter;
		Standard_Real Parameter();

		/****************** Reverse ******************/
		%feature("compactdefaultargs") Reverse;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Reverse;
		void Reverse();

		/****************** Reversed ******************/
		%feature("compactdefaultargs") Reversed;
		%feature("autodoc", "Reverses the orientation of the local coordinate system of this hyperbola (the 'y axis' is reversed). therefore, the implicit orientation of this hyperbola is reversed. note: - reverse assigns the result to this hyperbola, while - reversed creates a new one.

Returns
-------
gp_Hypr2d
") Reversed;
		gp_Hypr2d Reversed();

		/****************** Rotate ******************/
		%feature("compactdefaultargs") Rotate;
		%feature("autodoc", "No available documentation.

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
		%feature("compactdefaultargs") Rotated;
		%feature("autodoc", "Rotates an hyperbola. p is the center of the rotation. ang is the angular value of the rotation in radians.

Parameters
----------
P: gp_Pnt2d
Ang: float

Returns
-------
gp_Hypr2d
") Rotated;
		gp_Hypr2d Rotated(const gp_Pnt2d & P, const Standard_Real Ang);

		/****************** Scale ******************/
		%feature("compactdefaultargs") Scale;
		%feature("autodoc", "No available documentation.

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
		%feature("compactdefaultargs") Scaled;
		%feature("autodoc", "Scales an hyperbola. <s> is the scaling value. if <s> is positive only the location point is modified. but if <s> is negative the 'xaxis' is reversed and the 'yaxis' too.

Parameters
----------
P: gp_Pnt2d
S: float

Returns
-------
gp_Hypr2d
") Scaled;
		gp_Hypr2d Scaled(const gp_Pnt2d & P, const Standard_Real S);

		/****************** SetAxis ******************/
		%feature("compactdefaultargs") SetAxis;
		%feature("autodoc", "Modifies this hyperbola, by redefining its local coordinate system so that it becomes a.

Parameters
----------
A: gp_Ax22d

Returns
-------
None
") SetAxis;
		void SetAxis(const gp_Ax22d & A);

		/****************** SetLocation ******************/
		%feature("compactdefaultargs") SetLocation;
		%feature("autodoc", "Modifies this hyperbola, by redefining its local coordinate system so that its origin becomes p.

Parameters
----------
P: gp_Pnt2d

Returns
-------
None
") SetLocation;
		void SetLocation(const gp_Pnt2d & P);

		/****************** SetMajorRadius ******************/
		%feature("compactdefaultargs") SetMajorRadius;
		%feature("autodoc", "Modifies the major or minor radius of this hyperbola. exceptions standard_constructionerror if majorradius or minorradius is negative.

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
		%feature("autodoc", "Modifies the major or minor radius of this hyperbola. exceptions standard_constructionerror if majorradius or minorradius is negative.

Parameters
----------
MinorRadius: float

Returns
-------
None
") SetMinorRadius;
		void SetMinorRadius(const Standard_Real MinorRadius);

		/****************** SetXAxis ******************/
		%feature("compactdefaultargs") SetXAxis;
		%feature("autodoc", "Changes the major axis of the hyperbola. the minor axis is recomputed and the location of the hyperbola too.

Parameters
----------
A: gp_Ax2d

Returns
-------
None
") SetXAxis;
		void SetXAxis(const gp_Ax2d & A);

		/****************** SetYAxis ******************/
		%feature("compactdefaultargs") SetYAxis;
		%feature("autodoc", "Changes the minor axis of the hyperbola.the minor axis is recomputed and the location of the hyperbola too.

Parameters
----------
A: gp_Ax2d

Returns
-------
None
") SetYAxis;
		void SetYAxis(const gp_Ax2d & A);

		/****************** Transform ******************/
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

		/****************** Transformed ******************/
		%feature("compactdefaultargs") Transformed;
		%feature("autodoc", "Transforms an hyperbola with the transformation t from class trsf2d.

Parameters
----------
T: gp_Trsf2d

Returns
-------
gp_Hypr2d
") Transformed;
		gp_Hypr2d Transformed(const gp_Trsf2d & T);

		/****************** Translate ******************/
		%feature("compactdefaultargs") Translate;
		%feature("autodoc", "No available documentation.

Parameters
----------
V: gp_Vec2d

Returns
-------
None
") Translate;
		void Translate(const gp_Vec2d & V);

		/****************** Translate ******************/
		%feature("compactdefaultargs") Translate;
		%feature("autodoc", "No available documentation.

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
		%feature("compactdefaultargs") Translated;
		%feature("autodoc", "Translates an hyperbola in the direction of the vector v. the magnitude of the translation is the vector's magnitude.

Parameters
----------
V: gp_Vec2d

Returns
-------
gp_Hypr2d
") Translated;
		gp_Hypr2d Translated(const gp_Vec2d & V);

		/****************** Translated ******************/
		%feature("compactdefaultargs") Translated;
		%feature("autodoc", "Translates an hyperbola from the point p1 to the point p2.

Parameters
----------
P1: gp_Pnt2d
P2: gp_Pnt2d

Returns
-------
gp_Hypr2d
") Translated;
		gp_Hypr2d Translated(const gp_Pnt2d & P1, const gp_Pnt2d & P2);

		/****************** XAxis ******************/
		%feature("compactdefaultargs") XAxis;
		%feature("autodoc", "Computes an axis whose - the origin is the center of this hyperbola, and - the unit vector is the 'x direction' or 'y direction' respectively of the local coordinate system of this hyperbola returns the major axis of the hyperbola.

Returns
-------
gp_Ax2d
") XAxis;
		gp_Ax2d XAxis();

		/****************** YAxis ******************/
		%feature("compactdefaultargs") YAxis;
		%feature("autodoc", "Computes an axis whose - the origin is the center of this hyperbola, and - the unit vector is the 'x direction' or 'y direction' respectively of the local coordinate system of this hyperbola returns the minor axis of the hyperbola.

Returns
-------
gp_Ax2d
") YAxis;
		gp_Ax2d YAxis();

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
		/****************** gp_Lin ******************/
		%feature("compactdefaultargs") gp_Lin;
		%feature("autodoc", "Creates a line corresponding to z axis of the reference coordinate system.

Returns
-------
None
") gp_Lin;
		 gp_Lin();

		/****************** gp_Lin ******************/
		%feature("compactdefaultargs") gp_Lin;
		%feature("autodoc", "Creates a line defined by axis a1.

Parameters
----------
A1: gp_Ax1

Returns
-------
None
") gp_Lin;
		 gp_Lin(const gp_Ax1 & A1);

		/****************** gp_Lin ******************/
		%feature("compactdefaultargs") gp_Lin;
		%feature("autodoc", "Creates a line passing through point p and parallel to vector v (p and v are, respectively, the origin and the unit vector of the positioning axis of the line).

Parameters
----------
P: gp_Pnt
V: gp_Dir

Returns
-------
None
") gp_Lin;
		 gp_Lin(const gp_Pnt & P, const gp_Dir & V);

		/****************** Angle ******************/
		%feature("compactdefaultargs") Angle;
		%feature("autodoc", "Computes the angle between two lines in radians.

Parameters
----------
Other: gp_Lin

Returns
-------
float
") Angle;
		Standard_Real Angle(const gp_Lin & Other);

		/****************** Contains ******************/
		%feature("compactdefaultargs") Contains;
		%feature("autodoc", "Returns true if this line contains the point p, that is, if the distance between point p and this line is less than or equal to lineartolerance..

Parameters
----------
P: gp_Pnt
LinearTolerance: float

Returns
-------
bool
") Contains;
		Standard_Boolean Contains(const gp_Pnt & P, const Standard_Real LinearTolerance);

		/****************** Direction ******************/
		%feature("compactdefaultargs") Direction;
		%feature("autodoc", "Returns the direction of the line.

Returns
-------
gp_Dir
") Direction;
		const gp_Dir Direction();

		/****************** Distance ******************/
		%feature("compactdefaultargs") Distance;
		%feature("autodoc", "Computes the distance between <self> and the point p.

Parameters
----------
P: gp_Pnt

Returns
-------
float
") Distance;
		Standard_Real Distance(const gp_Pnt & P);

		/****************** Distance ******************/
		%feature("compactdefaultargs") Distance;
		%feature("autodoc", "Computes the distance between two lines.

Parameters
----------
Other: gp_Lin

Returns
-------
float
") Distance;
		Standard_Real Distance(const gp_Lin & Other);

		/****************** Location ******************/
		%feature("compactdefaultargs") Location;
		%feature("autodoc", "Returns the location point (origin) of the line.

Returns
-------
gp_Pnt
") Location;
		const gp_Pnt Location();

		/****************** Mirror ******************/
		%feature("compactdefaultargs") Mirror;
		%feature("autodoc", "No available documentation.

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
		%feature("autodoc", "No available documentation.

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
		%feature("autodoc", "No available documentation.

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
		%feature("autodoc", "Performs the symmetrical transformation of a line with respect to the point p which is the center of the symmetry.

Parameters
----------
P: gp_Pnt

Returns
-------
gp_Lin
") Mirrored;
		gp_Lin Mirrored(const gp_Pnt & P);

		/****************** Mirrored ******************/
		%feature("compactdefaultargs") Mirrored;
		%feature("autodoc", "Performs the symmetrical transformation of a line with respect to an axis placement which is the axis of the symmetry.

Parameters
----------
A1: gp_Ax1

Returns
-------
gp_Lin
") Mirrored;
		gp_Lin Mirrored(const gp_Ax1 & A1);

		/****************** Mirrored ******************/
		%feature("compactdefaultargs") Mirrored;
		%feature("autodoc", "Performs the symmetrical transformation of a line with respect to a plane. the axis placement <a2> locates the plane of the symmetry : (location, xdirection, ydirection).

Parameters
----------
A2: gp_Ax2

Returns
-------
gp_Lin
") Mirrored;
		gp_Lin Mirrored(const gp_Ax2 & A2);

		/****************** Normal ******************/
		%feature("compactdefaultargs") Normal;
		%feature("autodoc", "Computes the line normal to the direction of <self>, passing through the point p. raises constructionerror if the distance between <self> and the point p is lower or equal to resolution from gp because there is an infinity of solutions in 3d space.

Parameters
----------
P: gp_Pnt

Returns
-------
gp_Lin
") Normal;
		gp_Lin Normal(const gp_Pnt & P);

		/****************** Position ******************/
		%feature("compactdefaultargs") Position;
		%feature("autodoc", "Returns the axis placement one axis whith the same location and direction as <self>.

Returns
-------
gp_Ax1
") Position;
		const gp_Ax1 Position();

		/****************** Reverse ******************/
		%feature("compactdefaultargs") Reverse;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Reverse;
		void Reverse();

		/****************** Reversed ******************/
		%feature("compactdefaultargs") Reversed;
		%feature("autodoc", "Reverses the direction of the line. note: - reverse assigns the result to this line, while - reversed creates a new one.

Returns
-------
gp_Lin
") Reversed;
		gp_Lin Reversed();

		/****************** Rotate ******************/
		%feature("compactdefaultargs") Rotate;
		%feature("autodoc", "No available documentation.

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
		%feature("autodoc", "Rotates a line. a1 is the axis of the rotation. ang is the angular value of the rotation in radians.

Parameters
----------
A1: gp_Ax1
Ang: float

Returns
-------
gp_Lin
") Rotated;
		gp_Lin Rotated(const gp_Ax1 & A1, const Standard_Real Ang);

		/****************** Scale ******************/
		%feature("compactdefaultargs") Scale;
		%feature("autodoc", "No available documentation.

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
		%feature("autodoc", "Scales a line. s is the scaling value. the 'location' point (origin) of the line is modified. the 'direction' is reversed if the scale is negative.

Parameters
----------
P: gp_Pnt
S: float

Returns
-------
gp_Lin
") Scaled;
		gp_Lin Scaled(const gp_Pnt & P, const Standard_Real S);

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

		/****************** SetLocation ******************/
		%feature("compactdefaultargs") SetLocation;
		%feature("autodoc", "Changes the location point (origin) of the line.

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
		%feature("autodoc", "Complete redefinition of the line. the 'location' point of <a1> is the origin of the line. the 'direction' of <a1> is the direction of the line.

Parameters
----------
A1: gp_Ax1

Returns
-------
None
") SetPosition;
		void SetPosition(const gp_Ax1 & A1);

		/****************** SquareDistance ******************/
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "Computes the square distance between <self> and the point p.

Parameters
----------
P: gp_Pnt

Returns
-------
float
") SquareDistance;
		Standard_Real SquareDistance(const gp_Pnt & P);

		/****************** SquareDistance ******************/
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "Computes the square distance between two lines.

Parameters
----------
Other: gp_Lin

Returns
-------
float
") SquareDistance;
		Standard_Real SquareDistance(const gp_Lin & Other);

		/****************** Transform ******************/
		%feature("compactdefaultargs") Transform;
		%feature("autodoc", "No available documentation.

Parameters
----------
T: gp_Trsf

Returns
-------
None
") Transform;
		void Transform(const gp_Trsf & T);

		/****************** Transformed ******************/
		%feature("compactdefaultargs") Transformed;
		%feature("autodoc", "Transforms a line with the transformation t from class trsf.

Parameters
----------
T: gp_Trsf

Returns
-------
gp_Lin
") Transformed;
		gp_Lin Transformed(const gp_Trsf & T);

		/****************** Translate ******************/
		%feature("compactdefaultargs") Translate;
		%feature("autodoc", "No available documentation.

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
		%feature("autodoc", "No available documentation.

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
		%feature("autodoc", "Translates a line in the direction of the vector v. the magnitude of the translation is the vector's magnitude.

Parameters
----------
V: gp_Vec

Returns
-------
gp_Lin
") Translated;
		gp_Lin Translated(const gp_Vec & V);

		/****************** Translated ******************/
		%feature("compactdefaultargs") Translated;
		%feature("autodoc", "Translates a line from the point p1 to the point p2.

Parameters
----------
P1: gp_Pnt
P2: gp_Pnt

Returns
-------
gp_Lin
") Translated;
		gp_Lin Translated(const gp_Pnt & P1, const gp_Pnt & P2);

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
		/****************** gp_Lin2d ******************/
		%feature("compactdefaultargs") gp_Lin2d;
		%feature("autodoc", "Creates a line corresponding to x axis of the reference coordinate system.

Returns
-------
None
") gp_Lin2d;
		 gp_Lin2d();

		/****************** gp_Lin2d ******************/
		%feature("compactdefaultargs") gp_Lin2d;
		%feature("autodoc", "Creates a line located with a.

Parameters
----------
A: gp_Ax2d

Returns
-------
None
") gp_Lin2d;
		 gp_Lin2d(const gp_Ax2d & A);

		/****************** gp_Lin2d ******************/
		%feature("compactdefaultargs") gp_Lin2d;
		%feature("autodoc", "<p> is the location point (origin) of the line and <v> is the direction of the line.

Parameters
----------
P: gp_Pnt2d
V: gp_Dir2d

Returns
-------
None
") gp_Lin2d;
		 gp_Lin2d(const gp_Pnt2d & P, const gp_Dir2d & V);

		/****************** gp_Lin2d ******************/
		%feature("compactdefaultargs") gp_Lin2d;
		%feature("autodoc", "Creates the line from the equation a*x + b*y + c = 0.0 raises constructionerror if sqrt(a*a + b*b) <= resolution from gp. raised if sqrt(a*a + b*b) <= resolution from gp.

Parameters
----------
A: float
B: float
C: float

Returns
-------
None
") gp_Lin2d;
		 gp_Lin2d(const Standard_Real A, const Standard_Real B, const Standard_Real C);

		/****************** Angle ******************/
		%feature("compactdefaultargs") Angle;
		%feature("autodoc", "Computes the angle between two lines in radians.

Parameters
----------
Other: gp_Lin2d

Returns
-------
float
") Angle;
		Standard_Real Angle(const gp_Lin2d & Other);

		/****************** Coefficients ******************/
		%feature("compactdefaultargs") Coefficients;
		%feature("autodoc", "Returns the normalized coefficients of the line : a * x + b * y + c = 0.

Parameters
----------

Returns
-------
A: float
B: float
C: float
") Coefficients;
		void Coefficients(Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** Contains ******************/
		%feature("compactdefaultargs") Contains;
		%feature("autodoc", "Returns true if this line contains the point p, that is, if the distance between point p and this line is less than or equal to lineartolerance.

Parameters
----------
P: gp_Pnt2d
LinearTolerance: float

Returns
-------
bool
") Contains;
		Standard_Boolean Contains(const gp_Pnt2d & P, const Standard_Real LinearTolerance);

		/****************** Direction ******************/
		%feature("compactdefaultargs") Direction;
		%feature("autodoc", "Returns the direction of the line.

Returns
-------
gp_Dir2d
") Direction;
		const gp_Dir2d Direction();

		/****************** Distance ******************/
		%feature("compactdefaultargs") Distance;
		%feature("autodoc", "Computes the distance between <self> and the point <p>.

Parameters
----------
P: gp_Pnt2d

Returns
-------
float
") Distance;
		Standard_Real Distance(const gp_Pnt2d & P);

		/****************** Distance ******************/
		%feature("compactdefaultargs") Distance;
		%feature("autodoc", "Computes the distance between two lines.

Parameters
----------
Other: gp_Lin2d

Returns
-------
float
") Distance;
		Standard_Real Distance(const gp_Lin2d & Other);

		/****************** Location ******************/
		%feature("compactdefaultargs") Location;
		%feature("autodoc", "Returns the location point (origin) of the line.

Returns
-------
gp_Pnt2d
") Location;
		const gp_Pnt2d Location();

		/****************** Mirror ******************/
		%feature("compactdefaultargs") Mirror;
		%feature("autodoc", "No available documentation.

Parameters
----------
P: gp_Pnt2d

Returns
-------
None
") Mirror;
		void Mirror(const gp_Pnt2d & P);

		/****************** Mirror ******************/
		%feature("compactdefaultargs") Mirror;
		%feature("autodoc", "No available documentation.

Parameters
----------
A: gp_Ax2d

Returns
-------
None
") Mirror;
		void Mirror(const gp_Ax2d & A);

		/****************** Mirrored ******************/
		%feature("compactdefaultargs") Mirrored;
		%feature("autodoc", "Performs the symmetrical transformation of a line with respect to the point <p> which is the center of the symmetry.

Parameters
----------
P: gp_Pnt2d

Returns
-------
gp_Lin2d
") Mirrored;
		gp_Lin2d Mirrored(const gp_Pnt2d & P);

		/****************** Mirrored ******************/
		%feature("compactdefaultargs") Mirrored;
		%feature("autodoc", "Performs the symmetrical transformation of a line with respect to an axis placement which is the axis of the symmetry.

Parameters
----------
A: gp_Ax2d

Returns
-------
gp_Lin2d
") Mirrored;
		gp_Lin2d Mirrored(const gp_Ax2d & A);

		/****************** Normal ******************/
		%feature("compactdefaultargs") Normal;
		%feature("autodoc", "Computes the line normal to the direction of <self>, passing through the point <p>.

Parameters
----------
P: gp_Pnt2d

Returns
-------
gp_Lin2d
") Normal;
		gp_Lin2d Normal(const gp_Pnt2d & P);

		/****************** Position ******************/
		%feature("compactdefaultargs") Position;
		%feature("autodoc", "Returns the axis placement one axis whith the same location and direction as <self>.

Returns
-------
gp_Ax2d
") Position;
		const gp_Ax2d Position();

		/****************** Reverse ******************/
		%feature("compactdefaultargs") Reverse;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Reverse;
		void Reverse();

		/****************** Reversed ******************/
		%feature("compactdefaultargs") Reversed;
		%feature("autodoc", "Reverses the positioning axis of this line. note: - reverse assigns the result to this line, while - reversed creates a new one.

Returns
-------
gp_Lin2d
") Reversed;
		gp_Lin2d Reversed();

		/****************** Rotate ******************/
		%feature("compactdefaultargs") Rotate;
		%feature("autodoc", "No available documentation.

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
		%feature("compactdefaultargs") Rotated;
		%feature("autodoc", "Rotates a line. p is the center of the rotation. ang is the angular value of the rotation in radians.

Parameters
----------
P: gp_Pnt2d
Ang: float

Returns
-------
gp_Lin2d
") Rotated;
		gp_Lin2d Rotated(const gp_Pnt2d & P, const Standard_Real Ang);

		/****************** Scale ******************/
		%feature("compactdefaultargs") Scale;
		%feature("autodoc", "No available documentation.

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
		%feature("compactdefaultargs") Scaled;
		%feature("autodoc", "Scales a line. s is the scaling value. only the origin of the line is modified.

Parameters
----------
P: gp_Pnt2d
S: float

Returns
-------
gp_Lin2d
") Scaled;
		gp_Lin2d Scaled(const gp_Pnt2d & P, const Standard_Real S);

		/****************** SetDirection ******************/
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

		/****************** SetLocation ******************/
		%feature("compactdefaultargs") SetLocation;
		%feature("autodoc", "Changes the origin of the line.

Parameters
----------
P: gp_Pnt2d

Returns
-------
None
") SetLocation;
		void SetLocation(const gp_Pnt2d & P);

		/****************** SetPosition ******************/
		%feature("compactdefaultargs") SetPosition;
		%feature("autodoc", "Complete redefinition of the line. the 'location' point of <a> is the origin of the line. the 'direction' of <a> is the direction of the line.

Parameters
----------
A: gp_Ax2d

Returns
-------
None
") SetPosition;
		void SetPosition(const gp_Ax2d & A);

		/****************** SquareDistance ******************/
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "Computes the square distance between <self> and the point <p>.

Parameters
----------
P: gp_Pnt2d

Returns
-------
float
") SquareDistance;
		Standard_Real SquareDistance(const gp_Pnt2d & P);

		/****************** SquareDistance ******************/
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "Computes the square distance between two lines.

Parameters
----------
Other: gp_Lin2d

Returns
-------
float
") SquareDistance;
		Standard_Real SquareDistance(const gp_Lin2d & Other);

		/****************** Transform ******************/
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

		/****************** Transformed ******************/
		%feature("compactdefaultargs") Transformed;
		%feature("autodoc", "Transforms a line with the transformation t from class trsf2d.

Parameters
----------
T: gp_Trsf2d

Returns
-------
gp_Lin2d
") Transformed;
		gp_Lin2d Transformed(const gp_Trsf2d & T);

		/****************** Translate ******************/
		%feature("compactdefaultargs") Translate;
		%feature("autodoc", "No available documentation.

Parameters
----------
V: gp_Vec2d

Returns
-------
None
") Translate;
		void Translate(const gp_Vec2d & V);

		/****************** Translate ******************/
		%feature("compactdefaultargs") Translate;
		%feature("autodoc", "No available documentation.

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
		%feature("compactdefaultargs") Translated;
		%feature("autodoc", "Translates a line in the direction of the vector v. the magnitude of the translation is the vector's magnitude.

Parameters
----------
V: gp_Vec2d

Returns
-------
gp_Lin2d
") Translated;
		gp_Lin2d Translated(const gp_Vec2d & V);

		/****************** Translated ******************/
		%feature("compactdefaultargs") Translated;
		%feature("autodoc", "Translates a line from the point p1 to the point p2.

Parameters
----------
P1: gp_Pnt2d
P2: gp_Pnt2d

Returns
-------
gp_Lin2d
") Translated;
		gp_Lin2d Translated(const gp_Pnt2d & P1, const gp_Pnt2d & P2);

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
		/****************** gp_Mat ******************/
		%feature("compactdefaultargs") gp_Mat;
		%feature("autodoc", "Creates a matrix with null coefficients.

Returns
-------
None
") gp_Mat;
		 gp_Mat();

		/****************** gp_Mat ******************/
		%feature("compactdefaultargs") gp_Mat;
		%feature("autodoc", "No available documentation.

Parameters
----------
a11: float
a12: float
a13: float
a21: float
a22: float
a23: float
a31: float
a32: float
a33: float

Returns
-------
None
") gp_Mat;
		 gp_Mat(const Standard_Real a11, const Standard_Real a12, const Standard_Real a13, const Standard_Real a21, const Standard_Real a22, const Standard_Real a23, const Standard_Real a31, const Standard_Real a32, const Standard_Real a33);

		/****************** gp_Mat ******************/
		%feature("compactdefaultargs") gp_Mat;
		%feature("autodoc", "Creates a matrix. col1, col2, col3 are the 3 columns of the matrix.

Parameters
----------
Col1: gp_XYZ
Col2: gp_XYZ
Col3: gp_XYZ

Returns
-------
None
") gp_Mat;
		 gp_Mat(const gp_XYZ & Col1, const gp_XYZ & Col2, const gp_XYZ & Col3);

		/****************** Add ******************/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "No available documentation.

Parameters
----------
Other: gp_Mat

Returns
-------
None
") Add;
		void Add(const gp_Mat & Other);

		/****************** Added ******************/
		%feature("compactdefaultargs") Added;
		%feature("autodoc", "Computes the sum of this matrix and the matrix other for each coefficient of the matrix : <self>.coef(i,j) + <other>.coef(i,j).

Parameters
----------
Other: gp_Mat

Returns
-------
gp_Mat
") Added;
		gp_Mat Added(const gp_Mat & Other);


        %feature("autodoc","1");
        %extend {
            Standard_Real GetChangeValue(const Standard_Integer Row,const Standard_Integer Col) {
            return (Standard_Real) $self->ChangeValue(Row,Col);
            }
        };
        %feature("autodoc","1");
        %extend {
            void SetChangeValue(const Standard_Integer Row,const Standard_Integer Col,Standard_Real value) {
            $self->ChangeValue(Row,Col)=value;
            }
        };
		/****************** Column ******************/
		%feature("compactdefaultargs") Column;
		%feature("autodoc", "Returns the column of col index. raises outofrange if col < 1 or col > 3.

Parameters
----------
Col: int

Returns
-------
gp_XYZ
") Column;
		gp_XYZ Column(const Standard_Integer Col);

		/****************** Determinant ******************/
		%feature("compactdefaultargs") Determinant;
		%feature("autodoc", "Computes the determinant of the matrix.

Returns
-------
float
") Determinant;
		Standard_Real Determinant();

		/****************** Diagonal ******************/
		%feature("compactdefaultargs") Diagonal;
		%feature("autodoc", "Returns the main diagonal of the matrix.

Returns
-------
gp_XYZ
") Diagonal;
		gp_XYZ Diagonal();

		/****************** Divide ******************/
		%feature("compactdefaultargs") Divide;
		%feature("autodoc", "No available documentation.

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
		%feature("autodoc", "Divides all the coefficients of the matrix by scalar.

Parameters
----------
Scalar: float

Returns
-------
gp_Mat
") Divided;
		gp_Mat Divided(const Standard_Real Scalar);


            %feature("autodoc", "1");
            %extend{
                std::string DumpJsonToString(int depth=-1) {
                std::stringstream s;
                self->DumpJson(s, depth);
                return s.str();}
            };
		/****************** Invert ******************/
		%feature("compactdefaultargs") Invert;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Invert;
		void Invert();

		/****************** Inverted ******************/
		%feature("compactdefaultargs") Inverted;
		%feature("autodoc", "Inverses the matrix and raises if the matrix is singular. - invert assigns the result to this matrix, while - inverted creates a new one. warning the gauss lu decomposition is used to invert the matrix. consequently, the matrix is considered as singular if the largest pivot found is less than or equal to gp::resolution(). exceptions standard_constructionerror if this matrix is singular, and therefore cannot be inverted.

Returns
-------
gp_Mat
") Inverted;
		gp_Mat Inverted();

		/****************** IsSingular ******************/
		%feature("compactdefaultargs") IsSingular;
		%feature("autodoc", "The gauss lu decomposition is used to invert the matrix (see math package) so the matrix is considered as singular if the largest pivot found is lower or equal to resolution from gp.

Returns
-------
bool
") IsSingular;
		Standard_Boolean IsSingular();

		/****************** Multiplied ******************/
		%feature("compactdefaultargs") Multiplied;
		%feature("autodoc", "Computes the product of two matrices <self> * <other>.

Parameters
----------
Other: gp_Mat

Returns
-------
gp_Mat
") Multiplied;
		gp_Mat Multiplied(const gp_Mat & Other);

		/****************** Multiplied ******************/
		%feature("compactdefaultargs") Multiplied;
		%feature("autodoc", "No available documentation.

Parameters
----------
Scalar: float

Returns
-------
gp_Mat
") Multiplied;
		gp_Mat Multiplied(const Standard_Real Scalar);

		/****************** Multiply ******************/
		%feature("compactdefaultargs") Multiply;
		%feature("autodoc", "Computes the product of two matrices <self> = <other> * <self>.

Parameters
----------
Other: gp_Mat

Returns
-------
None
") Multiply;
		void Multiply(const gp_Mat & Other);

		/****************** Multiply ******************/
		%feature("compactdefaultargs") Multiply;
		%feature("autodoc", "Multiplies all the coefficients of the matrix by scalar.

Parameters
----------
Scalar: float

Returns
-------
None
") Multiply;
		void Multiply(const Standard_Real Scalar);

		/****************** Power ******************/
		%feature("compactdefaultargs") Power;
		%feature("autodoc", "No available documentation.

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
		%feature("autodoc", "Computes <self> = <self> * <self> * .......* <self>, n time. if n = 0 <self> = identity if n < 0 <self> = <self>.invert() *...........* <self>.invert(). if n < 0 an exception will be raised if the matrix is not inversible.

Parameters
----------
N: int

Returns
-------
gp_Mat
") Powered;
		gp_Mat Powered(const Standard_Integer N);

		/****************** PreMultiply ******************/
		%feature("compactdefaultargs") PreMultiply;
		%feature("autodoc", "No available documentation.

Parameters
----------
Other: gp_Mat

Returns
-------
None
") PreMultiply;
		void PreMultiply(const gp_Mat & Other);

		/****************** Row ******************/
		%feature("compactdefaultargs") Row;
		%feature("autodoc", "Returns the row of row index. raises outofrange if row < 1 or row > 3.

Parameters
----------
Row: int

Returns
-------
gp_XYZ
") Row;
		gp_XYZ Row(const Standard_Integer Row);

		/****************** SetCol ******************/
		%feature("compactdefaultargs") SetCol;
		%feature("autodoc", "Assigns the three coordinates of value to the column of index col of this matrix. raises outofrange if col < 1 or col > 3.

Parameters
----------
Col: int
Value: gp_XYZ

Returns
-------
None
") SetCol;
		void SetCol(const Standard_Integer Col, const gp_XYZ & Value);

		/****************** SetCols ******************/
		%feature("compactdefaultargs") SetCols;
		%feature("autodoc", "Assigns the number triples col1, col2, col3 to the three columns of this matrix.

Parameters
----------
Col1: gp_XYZ
Col2: gp_XYZ
Col3: gp_XYZ

Returns
-------
None
") SetCols;
		void SetCols(const gp_XYZ & Col1, const gp_XYZ & Col2, const gp_XYZ & Col3);

		/****************** SetCross ******************/
		%feature("compactdefaultargs") SetCross;
		%feature("autodoc", "Modifies the matrix m so that applying it to any number triple (x, y, z) produces the same result as the cross product of ref and the number triple (x, y, z): i.e.: m * {x,y,z}t = ref.cross({x, y ,z}) this matrix is anti symmetric. to apply this matrix to the triplet {xyz} is the same as to do the cross product between the triplet ref and the triplet {xyz}. note: this matrix is anti-symmetric.

Parameters
----------
Ref: gp_XYZ

Returns
-------
None
") SetCross;
		void SetCross(const gp_XYZ & Ref);

		/****************** SetDiagonal ******************/
		%feature("compactdefaultargs") SetDiagonal;
		%feature("autodoc", "Modifies the main diagonal of the matrix. <self>.value (1, 1) = x1 <self>.value (2, 2) = x2 <self>.value (3, 3) = x3 the other coefficients of the matrix are not modified.

Parameters
----------
X1: float
X2: float
X3: float

Returns
-------
None
") SetDiagonal;
		void SetDiagonal(const Standard_Real X1, const Standard_Real X2, const Standard_Real X3);

		/****************** SetDot ******************/
		%feature("compactdefaultargs") SetDot;
		%feature("autodoc", "Modifies this matrix so that applying it to any number triple (x, y, z) produces the same result as the scalar product of ref and the number triple (x, y, z): this * (x,y,z) = ref.(x,y,z) note: this matrix is symmetric.

Parameters
----------
Ref: gp_XYZ

Returns
-------
None
") SetDot;
		void SetDot(const gp_XYZ & Ref);

		/****************** SetIdentity ******************/
		%feature("compactdefaultargs") SetIdentity;
		%feature("autodoc", "Modifies this matrix so that it represents the identity matrix.

Returns
-------
None
") SetIdentity;
		void SetIdentity();

		/****************** SetRotation ******************/
		%feature("compactdefaultargs") SetRotation;
		%feature("autodoc", "Modifies this matrix so that it represents a rotation. ang is the angular value in radians and the xyz axis gives the direction of the rotation. raises constructionerror if xyz.modulus() <= resolution().

Parameters
----------
Axis: gp_XYZ
Ang: float

Returns
-------
None
") SetRotation;
		void SetRotation(const gp_XYZ & Axis, const Standard_Real Ang);

		/****************** SetRow ******************/
		%feature("compactdefaultargs") SetRow;
		%feature("autodoc", "Assigns the three coordinates of value to the row of index row of this matrix. raises outofrange if row < 1 or row > 3.

Parameters
----------
Row: int
Value: gp_XYZ

Returns
-------
None
") SetRow;
		void SetRow(const Standard_Integer Row, const gp_XYZ & Value);

		/****************** SetRows ******************/
		%feature("compactdefaultargs") SetRows;
		%feature("autodoc", "Assigns the number triples row1, row2, row3 to the three rows of this matrix.

Parameters
----------
Row1: gp_XYZ
Row2: gp_XYZ
Row3: gp_XYZ

Returns
-------
None
") SetRows;
		void SetRows(const gp_XYZ & Row1, const gp_XYZ & Row2, const gp_XYZ & Row3);

		/****************** SetScale ******************/
		%feature("compactdefaultargs") SetScale;
		%feature("autodoc", "Modifies the the matrix so that it represents a scaling transformation, where s is the scale factor. : | s 0.0 0.0 | <self> = | 0.0 s 0.0 | | 0.0 0.0 s |.

Parameters
----------
S: float

Returns
-------
None
") SetScale;
		void SetScale(const Standard_Real S);

		/****************** SetValue ******************/
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "Assigns <value> to the coefficient of row row, column col of this matrix. raises outofrange if row < 1 or row > 3 or col < 1 or col > 3.

Parameters
----------
Row: int
Col: int
Value: float

Returns
-------
None
") SetValue;
		void SetValue(const Standard_Integer Row, const Standard_Integer Col, const Standard_Real Value);

		/****************** Subtract ******************/
		%feature("compactdefaultargs") Subtract;
		%feature("autodoc", "No available documentation.

Parameters
----------
Other: gp_Mat

Returns
-------
None
") Subtract;
		void Subtract(const gp_Mat & Other);

		/****************** Subtracted ******************/
		%feature("compactdefaultargs") Subtracted;
		%feature("autodoc", "Computes for each coefficient of the matrix : <self>.coef(i,j) - <other>.coef(i,j).

Parameters
----------
Other: gp_Mat

Returns
-------
gp_Mat
") Subtracted;
		gp_Mat Subtracted(const gp_Mat & Other);

		/****************** Transpose ******************/
		%feature("compactdefaultargs") Transpose;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Transpose;
		void Transpose();

		/****************** Transposed ******************/
		%feature("compactdefaultargs") Transposed;
		%feature("autodoc", "Transposes the matrix. a(j, i) -> a (i, j).

Returns
-------
gp_Mat
") Transposed;
		gp_Mat Transposed();

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Returns the coefficient of range (row, col) raises outofrange if row < 1 or row > 3 or col < 1 or col > 3.

Parameters
----------
Row: int
Col: int

Returns
-------
float
") Value;
		const Standard_Real & Value(const Standard_Integer Row, const Standard_Integer Col);

		/****************** operator * ******************/
		%feature("compactdefaultargs") operator *;
		%feature("autodoc", "No available documentation.

Parameters
----------
Other: gp_Mat

Returns
-------
gp_Mat
") operator *;
		gp_Mat operator *(const gp_Mat & Other);

		/****************** operator * ******************/
		%feature("compactdefaultargs") operator *;
		%feature("autodoc", "No available documentation.

Parameters
----------
Scalar: float

Returns
-------
gp_Mat
") operator *;
		gp_Mat operator *(const Standard_Real Scalar);


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
		%feature("compactdefaultargs") operator +;
		%feature("autodoc", "No available documentation.

Parameters
----------
Other: gp_Mat

Returns
-------
gp_Mat
") operator +;
		gp_Mat operator +(const gp_Mat & Other);


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
		/****************** operator - ******************/
		%feature("compactdefaultargs") operator -;
		%feature("autodoc", "No available documentation.

Parameters
----------
Other: gp_Mat

Returns
-------
gp_Mat
") operator -;
		gp_Mat operator -(const gp_Mat & Other);


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
		/****************** operator / ******************/
		%feature("compactdefaultargs") operator /;
		%feature("autodoc", "No available documentation.

Parameters
----------
Scalar: float

Returns
-------
gp_Mat
") operator /;
		gp_Mat operator /(const Standard_Real Scalar);


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
		/****************** gp_Mat2d ******************/
		%feature("compactdefaultargs") gp_Mat2d;
		%feature("autodoc", "Creates a matrix with null coefficients.

Returns
-------
None
") gp_Mat2d;
		 gp_Mat2d();

		/****************** gp_Mat2d ******************/
		%feature("compactdefaultargs") gp_Mat2d;
		%feature("autodoc", "Col1, col2 are the 2 columns of the matrix.

Parameters
----------
Col1: gp_XY
Col2: gp_XY

Returns
-------
None
") gp_Mat2d;
		 gp_Mat2d(const gp_XY & Col1, const gp_XY & Col2);

		/****************** Add ******************/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "No available documentation.

Parameters
----------
Other: gp_Mat2d

Returns
-------
None
") Add;
		void Add(const gp_Mat2d & Other);

		/****************** Added ******************/
		%feature("compactdefaultargs") Added;
		%feature("autodoc", "Computes the sum of this matrix and the matrix other.for each coefficient of the matrix : <self>.coef(i,j) + <other>.coef(i,j) note: - operator += assigns the result to this matrix, while - operator + creates a new one.

Parameters
----------
Other: gp_Mat2d

Returns
-------
gp_Mat2d
") Added;
		gp_Mat2d Added(const gp_Mat2d & Other);


        %feature("autodoc","1");
        %extend {
            Standard_Real GetChangeValue(const Standard_Integer Row,const Standard_Integer Col) {
            return (Standard_Real) $self->ChangeValue(Row,Col);
            }
        };
        %feature("autodoc","1");
        %extend {
            void SetChangeValue(const Standard_Integer Row,const Standard_Integer Col,Standard_Real value) {
            $self->ChangeValue(Row,Col)=value;
            }
        };
		/****************** Column ******************/
		%feature("compactdefaultargs") Column;
		%feature("autodoc", "Returns the column of col index. raises outofrange if col < 1 or col > 2.

Parameters
----------
Col: int

Returns
-------
gp_XY
") Column;
		gp_XY Column(const Standard_Integer Col);

		/****************** Determinant ******************/
		%feature("compactdefaultargs") Determinant;
		%feature("autodoc", "Computes the determinant of the matrix.

Returns
-------
float
") Determinant;
		Standard_Real Determinant();

		/****************** Diagonal ******************/
		%feature("compactdefaultargs") Diagonal;
		%feature("autodoc", "Returns the main diagonal of the matrix.

Returns
-------
gp_XY
") Diagonal;
		gp_XY Diagonal();

		/****************** Divide ******************/
		%feature("compactdefaultargs") Divide;
		%feature("autodoc", "No available documentation.

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
		%feature("autodoc", "Divides all the coefficients of the matrix by a scalar.

Parameters
----------
Scalar: float

Returns
-------
gp_Mat2d
") Divided;
		gp_Mat2d Divided(const Standard_Real Scalar);

		/****************** Invert ******************/
		%feature("compactdefaultargs") Invert;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Invert;
		void Invert();

		/****************** Inverted ******************/
		%feature("compactdefaultargs") Inverted;
		%feature("autodoc", "Inverses the matrix and raises exception if the matrix is singular.

Returns
-------
gp_Mat2d
") Inverted;
		gp_Mat2d Inverted();

		/****************** IsSingular ******************/
		%feature("compactdefaultargs") IsSingular;
		%feature("autodoc", "Returns true if this matrix is singular (and therefore, cannot be inverted). the gauss lu decomposition is used to invert the matrix so the matrix is considered as singular if the largest pivot found is lower or equal to resolution from gp.

Returns
-------
bool
") IsSingular;
		Standard_Boolean IsSingular();

		/****************** Multiplied ******************/
		%feature("compactdefaultargs") Multiplied;
		%feature("autodoc", "No available documentation.

Parameters
----------
Other: gp_Mat2d

Returns
-------
gp_Mat2d
") Multiplied;
		gp_Mat2d Multiplied(const gp_Mat2d & Other);

		/****************** Multiplied ******************/
		%feature("compactdefaultargs") Multiplied;
		%feature("autodoc", "No available documentation.

Parameters
----------
Scalar: float

Returns
-------
gp_Mat2d
") Multiplied;
		gp_Mat2d Multiplied(const Standard_Real Scalar);

		/****************** Multiply ******************/
		%feature("compactdefaultargs") Multiply;
		%feature("autodoc", "Computes the product of two matrices <self> * <other>.

Parameters
----------
Other: gp_Mat2d

Returns
-------
None
") Multiply;
		void Multiply(const gp_Mat2d & Other);

		/****************** Multiply ******************/
		%feature("compactdefaultargs") Multiply;
		%feature("autodoc", "Multiplies all the coefficients of the matrix by a scalar.

Parameters
----------
Scalar: float

Returns
-------
None
") Multiply;
		void Multiply(const Standard_Real Scalar);

		/****************** Power ******************/
		%feature("compactdefaultargs") Power;
		%feature("autodoc", "No available documentation.

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
		%feature("autodoc", "Computes <self> = <self> * <self> * .......* <self>, n time. if n = 0 <self> = identity if n < 0 <self> = <self>.invert() *...........* <self>.invert(). if n < 0 an exception can be raised if the matrix is not inversible.

Parameters
----------
N: int

Returns
-------
gp_Mat2d
") Powered;
		gp_Mat2d Powered(const Standard_Integer N);

		/****************** PreMultiply ******************/
		%feature("compactdefaultargs") PreMultiply;
		%feature("autodoc", "Modifies this matrix by premultiplying it by the matrix other <self> = other * <self>.

Parameters
----------
Other: gp_Mat2d

Returns
-------
None
") PreMultiply;
		void PreMultiply(const gp_Mat2d & Other);

		/****************** Row ******************/
		%feature("compactdefaultargs") Row;
		%feature("autodoc", "Returns the row of index row. raised if row < 1 or row > 2.

Parameters
----------
Row: int

Returns
-------
gp_XY
") Row;
		gp_XY Row(const Standard_Integer Row);

		/****************** SetCol ******************/
		%feature("compactdefaultargs") SetCol;
		%feature("autodoc", "Assigns the two coordinates of value to the column of range col of this matrix raises outofrange if col < 1 or col > 2.

Parameters
----------
Col: int
Value: gp_XY

Returns
-------
None
") SetCol;
		void SetCol(const Standard_Integer Col, const gp_XY & Value);

		/****************** SetCols ******************/
		%feature("compactdefaultargs") SetCols;
		%feature("autodoc", "Assigns the number pairs col1, col2 to the two columns of this matrix.

Parameters
----------
Col1: gp_XY
Col2: gp_XY

Returns
-------
None
") SetCols;
		void SetCols(const gp_XY & Col1, const gp_XY & Col2);

		/****************** SetDiagonal ******************/
		%feature("compactdefaultargs") SetDiagonal;
		%feature("autodoc", "Modifies the main diagonal of the matrix. <self>.value (1, 1) = x1 <self>.value (2, 2) = x2 the other coefficients of the matrix are not modified.

Parameters
----------
X1: float
X2: float

Returns
-------
None
") SetDiagonal;
		void SetDiagonal(const Standard_Real X1, const Standard_Real X2);

		/****************** SetIdentity ******************/
		%feature("compactdefaultargs") SetIdentity;
		%feature("autodoc", "Modifies this matrix, so that it represents the identity matrix.

Returns
-------
None
") SetIdentity;
		void SetIdentity();

		/****************** SetRotation ******************/
		%feature("compactdefaultargs") SetRotation;
		%feature("autodoc", "Modifies this matrix, so that it representso a rotation. ang is the angular value in radian of the rotation.

Parameters
----------
Ang: float

Returns
-------
None
") SetRotation;
		void SetRotation(const Standard_Real Ang);

		/****************** SetRow ******************/
		%feature("compactdefaultargs") SetRow;
		%feature("autodoc", "Assigns the two coordinates of value to the row of index row of this matrix. raises outofrange if row < 1 or row > 2.

Parameters
----------
Row: int
Value: gp_XY

Returns
-------
None
") SetRow;
		void SetRow(const Standard_Integer Row, const gp_XY & Value);

		/****************** SetRows ******************/
		%feature("compactdefaultargs") SetRows;
		%feature("autodoc", "Assigns the number pairs row1, row2 to the two rows of this matrix.

Parameters
----------
Row1: gp_XY
Row2: gp_XY

Returns
-------
None
") SetRows;
		void SetRows(const gp_XY & Row1, const gp_XY & Row2);

		/****************** SetScale ******************/
		%feature("compactdefaultargs") SetScale;
		%feature("autodoc", "Modifies the matrix such that it represents a scaling transformation, where s is the scale factor : | s 0.0 | <self> = | 0.0 s |.

Parameters
----------
S: float

Returns
-------
None
") SetScale;
		void SetScale(const Standard_Real S);

		/****************** SetValue ******************/
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "Assigns <value> to the coefficient of row row, column col of this matrix. raises outofrange if row < 1 or row > 2 or col < 1 or col > 2.

Parameters
----------
Row: int
Col: int
Value: float

Returns
-------
None
") SetValue;
		void SetValue(const Standard_Integer Row, const Standard_Integer Col, const Standard_Real Value);

		/****************** Subtract ******************/
		%feature("compactdefaultargs") Subtract;
		%feature("autodoc", "No available documentation.

Parameters
----------
Other: gp_Mat2d

Returns
-------
None
") Subtract;
		void Subtract(const gp_Mat2d & Other);

		/****************** Subtracted ******************/
		%feature("compactdefaultargs") Subtracted;
		%feature("autodoc", "Computes for each coefficient of the matrix : <self>.coef(i,j) - <other>.coef(i,j).

Parameters
----------
Other: gp_Mat2d

Returns
-------
gp_Mat2d
") Subtracted;
		gp_Mat2d Subtracted(const gp_Mat2d & Other);

		/****************** Transpose ******************/
		%feature("compactdefaultargs") Transpose;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Transpose;
		void Transpose();

		/****************** Transposed ******************/
		%feature("compactdefaultargs") Transposed;
		%feature("autodoc", "Transposes the matrix. a(j, i) -> a (i, j).

Returns
-------
gp_Mat2d
") Transposed;
		gp_Mat2d Transposed();

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Returns the coefficient of range (row, col) raises outofrange if row < 1 or row > 2 or col < 1 or col > 2.

Parameters
----------
Row: int
Col: int

Returns
-------
float
") Value;
		const Standard_Real & Value(const Standard_Integer Row, const Standard_Integer Col);

		/****************** operator * ******************/
		%feature("compactdefaultargs") operator *;
		%feature("autodoc", "No available documentation.

Parameters
----------
Other: gp_Mat2d

Returns
-------
gp_Mat2d
") operator *;
		gp_Mat2d operator *(const gp_Mat2d & Other);

		/****************** operator * ******************/
		%feature("compactdefaultargs") operator *;
		%feature("autodoc", "No available documentation.

Parameters
----------
Scalar: float

Returns
-------
gp_Mat2d
") operator *;
		gp_Mat2d operator *(const Standard_Real Scalar);


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
		%feature("compactdefaultargs") operator +;
		%feature("autodoc", "No available documentation.

Parameters
----------
Other: gp_Mat2d

Returns
-------
gp_Mat2d
") operator +;
		gp_Mat2d operator +(const gp_Mat2d & Other);


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
		/****************** operator - ******************/
		%feature("compactdefaultargs") operator -;
		%feature("autodoc", "No available documentation.

Parameters
----------
Other: gp_Mat2d

Returns
-------
gp_Mat2d
") operator -;
		gp_Mat2d operator -(const gp_Mat2d & Other);


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
		/****************** operator / ******************/
		%feature("compactdefaultargs") operator /;
		%feature("autodoc", "No available documentation.

Parameters
----------
Scalar: float

Returns
-------
gp_Mat2d
") operator /;
		gp_Mat2d operator /(const Standard_Real Scalar);


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
		/****************** gp_Parab ******************/
		%feature("compactdefaultargs") gp_Parab;
		%feature("autodoc", "Creates an indefinite parabola.

Returns
-------
None
") gp_Parab;
		 gp_Parab();

		/****************** gp_Parab ******************/
		%feature("compactdefaultargs") gp_Parab;
		%feature("autodoc", "Creates a parabola with its local coordinate system 'a2' and it's focal length 'focal'. the xdirection of a2 defines the axis of symmetry of the parabola. the ydirection of a2 is parallel to the directrix of the parabola. the location point of a2 is the vertex of the parabola raises constructionerror if focal < 0.0 raised if focal < 0.0.

Parameters
----------
A2: gp_Ax2
Focal: float

Returns
-------
None
") gp_Parab;
		 gp_Parab(const gp_Ax2 & A2, const Standard_Real Focal);

		/****************** gp_Parab ******************/
		%feature("compactdefaultargs") gp_Parab;
		%feature("autodoc", "D is the directrix of the parabola and f the focus point. the symmetry axis (xaxis) of the parabola is normal to the directrix and pass through the focus point f, but its location point is the vertex of the parabola. the yaxis of the parabola is parallel to d and its location point is the vertex of the parabola. the normal to the plane of the parabola is the cross product between the xaxis and the yaxis.

Parameters
----------
D: gp_Ax1
F: gp_Pnt

Returns
-------
None
") gp_Parab;
		 gp_Parab(const gp_Ax1 & D, const gp_Pnt & F);

		/****************** Axis ******************/
		%feature("compactdefaultargs") Axis;
		%feature("autodoc", "Returns the main axis of the parabola. it is the axis normal to the plane of the parabola passing through the vertex of the parabola.

Returns
-------
gp_Ax1
") Axis;
		const gp_Ax1 Axis();

		/****************** Directrix ******************/
		%feature("compactdefaultargs") Directrix;
		%feature("autodoc", "Computes the directrix of this parabola. the directrix is: - a line parallel to the 'y direction' of the local coordinate system of this parabola, and - located on the negative side of the axis of symmetry, at a distance from the apex which is equal to the focal length of this parabola. the directrix is returned as an axis (a gp_ax1 object), the origin of which is situated on the 'x axis' of this parabola.

Returns
-------
gp_Ax1
") Directrix;
		gp_Ax1 Directrix();

		/****************** Focal ******************/
		%feature("compactdefaultargs") Focal;
		%feature("autodoc", "Returns the distance between the vertex and the focus of the parabola.

Returns
-------
float
") Focal;
		Standard_Real Focal();

		/****************** Focus ******************/
		%feature("compactdefaultargs") Focus;
		%feature("autodoc", "- computes the focus of the parabola.

Returns
-------
gp_Pnt
") Focus;
		gp_Pnt Focus();

		/****************** Location ******************/
		%feature("compactdefaultargs") Location;
		%feature("autodoc", "Returns the vertex of the parabola. it is the 'location' point of the coordinate system of the parabola.

Returns
-------
gp_Pnt
") Location;
		const gp_Pnt Location();

		/****************** Mirror ******************/
		%feature("compactdefaultargs") Mirror;
		%feature("autodoc", "No available documentation.

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
		%feature("autodoc", "No available documentation.

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
		%feature("autodoc", "No available documentation.

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
		%feature("autodoc", "Performs the symmetrical transformation of a parabola with respect to the point p which is the center of the symmetry.

Parameters
----------
P: gp_Pnt

Returns
-------
gp_Parab
") Mirrored;
		gp_Parab Mirrored(const gp_Pnt & P);

		/****************** Mirrored ******************/
		%feature("compactdefaultargs") Mirrored;
		%feature("autodoc", "Performs the symmetrical transformation of a parabola with respect to an axis placement which is the axis of the symmetry.

Parameters
----------
A1: gp_Ax1

Returns
-------
gp_Parab
") Mirrored;
		gp_Parab Mirrored(const gp_Ax1 & A1);

		/****************** Mirrored ******************/
		%feature("compactdefaultargs") Mirrored;
		%feature("autodoc", "Performs the symmetrical transformation of a parabola with respect to a plane. the axis placement a2 locates the plane of the symmetry (location, xdirection, ydirection).

Parameters
----------
A2: gp_Ax2

Returns
-------
gp_Parab
") Mirrored;
		gp_Parab Mirrored(const gp_Ax2 & A2);

		/****************** Parameter ******************/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "Computes the parameter of the parabola. it is the distance between the focus and the directrix of the parabola. this distance is twice the focal length.

Returns
-------
float
") Parameter;
		Standard_Real Parameter();

		/****************** Position ******************/
		%feature("compactdefaultargs") Position;
		%feature("autodoc", "Returns the local coordinate system of the parabola.

Returns
-------
gp_Ax2
") Position;
		const gp_Ax2 Position();

		/****************** Rotate ******************/
		%feature("compactdefaultargs") Rotate;
		%feature("autodoc", "No available documentation.

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
		%feature("autodoc", "Rotates a parabola. a1 is the axis of the rotation. ang is the angular value of the rotation in radians.

Parameters
----------
A1: gp_Ax1
Ang: float

Returns
-------
gp_Parab
") Rotated;
		gp_Parab Rotated(const gp_Ax1 & A1, const Standard_Real Ang);

		/****************** Scale ******************/
		%feature("compactdefaultargs") Scale;
		%feature("autodoc", "No available documentation.

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
		%feature("autodoc", "Scales a parabola. s is the scaling value. if s is negative the direction of the symmetry axis xaxis is reversed and the direction of the yaxis too.

Parameters
----------
P: gp_Pnt
S: float

Returns
-------
gp_Parab
") Scaled;
		gp_Parab Scaled(const gp_Pnt & P, const Standard_Real S);

		/****************** SetAxis ******************/
		%feature("compactdefaultargs") SetAxis;
		%feature("autodoc", "Modifies this parabola by redefining its local coordinate system so that - its origin and 'main direction' become those of the axis a1 (the 'x direction' and 'y direction' are then recomputed in the same way as for any gp_ax2) raises constructionerror if the direction of a1 is parallel to the previous xaxis of the parabola.

Parameters
----------
A1: gp_Ax1

Returns
-------
None
") SetAxis;
		void SetAxis(const gp_Ax1 & A1);

		/****************** SetFocal ******************/
		%feature("compactdefaultargs") SetFocal;
		%feature("autodoc", "Changes the focal distance of the parabola. raises constructionerror if focal < 0.0.

Parameters
----------
Focal: float

Returns
-------
None
") SetFocal;
		void SetFocal(const Standard_Real Focal);

		/****************** SetLocation ******************/
		%feature("compactdefaultargs") SetLocation;
		%feature("autodoc", "Changes the location of the parabola. it is the vertex of the parabola.

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
		%feature("autodoc", "Changes the local coordinate system of the parabola.

Parameters
----------
A2: gp_Ax2

Returns
-------
None
") SetPosition;
		void SetPosition(const gp_Ax2 & A2);

		/****************** Transform ******************/
		%feature("compactdefaultargs") Transform;
		%feature("autodoc", "No available documentation.

Parameters
----------
T: gp_Trsf

Returns
-------
None
") Transform;
		void Transform(const gp_Trsf & T);

		/****************** Transformed ******************/
		%feature("compactdefaultargs") Transformed;
		%feature("autodoc", "Transforms a parabola with the transformation t from class trsf.

Parameters
----------
T: gp_Trsf

Returns
-------
gp_Parab
") Transformed;
		gp_Parab Transformed(const gp_Trsf & T);

		/****************** Translate ******************/
		%feature("compactdefaultargs") Translate;
		%feature("autodoc", "No available documentation.

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
		%feature("autodoc", "No available documentation.

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
		%feature("autodoc", "Translates a parabola in the direction of the vector v. the magnitude of the translation is the vector's magnitude.

Parameters
----------
V: gp_Vec

Returns
-------
gp_Parab
") Translated;
		gp_Parab Translated(const gp_Vec & V);

		/****************** Translated ******************/
		%feature("compactdefaultargs") Translated;
		%feature("autodoc", "Translates a parabola from the point p1 to the point p2.

Parameters
----------
P1: gp_Pnt
P2: gp_Pnt

Returns
-------
gp_Parab
") Translated;
		gp_Parab Translated(const gp_Pnt & P1, const gp_Pnt & P2);

		/****************** XAxis ******************/
		%feature("compactdefaultargs") XAxis;
		%feature("autodoc", "Returns the symmetry axis of the parabola. the location point of the axis is the vertex of the parabola.

Returns
-------
gp_Ax1
") XAxis;
		gp_Ax1 XAxis();

		/****************** YAxis ******************/
		%feature("compactdefaultargs") YAxis;
		%feature("autodoc", "It is an axis parallel to the directrix of the parabola. the location point of this axis is the vertex of the parabola.

Returns
-------
gp_Ax1
") YAxis;
		gp_Ax1 YAxis();

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
		/****************** gp_Parab2d ******************/
		%feature("compactdefaultargs") gp_Parab2d;
		%feature("autodoc", "Creates an indefinite parabola.

Returns
-------
None
") gp_Parab2d;
		 gp_Parab2d();

		/****************** gp_Parab2d ******************/
		%feature("compactdefaultargs") gp_Parab2d;
		%feature("autodoc", "Creates a parabola with its vertex point, its axis of symmetry ('xaxis') and its focal length. the sense of parametrization is given by thesense. if thesense == true (by default) then right-handed coordinate system is used, otherwise - left-handed. warnings : it is possible to have focallength = 0. in this case, the parabola looks like a line, which is parallel to the symmetry-axis. raises constructionerror if focallength < 0.0.

Parameters
----------
theMirrorAxis: gp_Ax2d
theFocalLength: float
theSense: bool,optional
	default value is Standard_True

Returns
-------
None
") gp_Parab2d;
		 gp_Parab2d(const gp_Ax2d & theMirrorAxis, const Standard_Real theFocalLength, const Standard_Boolean theSense = Standard_True);

		/****************** gp_Parab2d ******************/
		%feature("compactdefaultargs") gp_Parab2d;
		%feature("autodoc", "Creates a parabola with its vertex point, its axis of symmetry ('xaxis'), correspond y-axis and its focal length. warnings : it is possible to have focallength = 0. in this case, the parabola looks like a line, which is parallel to the symmetry-axis. raises constructionerror if focal < 0.0.

Parameters
----------
theAxes: gp_Ax22d
theFocalLength: float

Returns
-------
None
") gp_Parab2d;
		 gp_Parab2d(const gp_Ax22d & theAxes, const Standard_Real theFocalLength);

		/****************** gp_Parab2d ******************/
		%feature("compactdefaultargs") gp_Parab2d;
		%feature("autodoc", "Creates a parabola with the directrix and the focus point. y-axis of the parabola (in user coordinate system - ucs) is the direction of thedirectrix. x-axis always directs from thedirectrix to thefocus point and always comes through thefocus. apex of the parabola is a middle point between the thefocus and the intersection point of thedirectrix and the x-axis. warnings : it is possible to have focallength = 0 (when thefocus lies in thedirectrix). in this case, x-direction of the parabola is defined by thesense parameter. if thesense == true (by default) then right-handed coordinate system is used, otherwise - left-handed. result parabola will look like a line, which is perpendicular to the directrix.

Parameters
----------
theDirectrix: gp_Ax2d
theFocus: gp_Pnt2d
theSense: bool,optional
	default value is Standard_True

Returns
-------
None
") gp_Parab2d;
		 gp_Parab2d(const gp_Ax2d & theDirectrix, const gp_Pnt2d & theFocus, const Standard_Boolean theSense = Standard_True);

		/****************** Axis ******************/
		%feature("compactdefaultargs") Axis;
		%feature("autodoc", "Returns the local coordinate system of the parabola. the 'location' point of this axis is the vertex of the parabola.

Returns
-------
gp_Ax22d
") Axis;
		gp_Ax22d Axis();

		/****************** Coefficients ******************/
		%feature("compactdefaultargs") Coefficients;
		%feature("autodoc", "Computes the coefficients of the implicit equation of the parabola (in wcs - world coordinate system). a * (x**2) + b * (y**2) + 2*c*(x*y) + 2*d*x + 2*e*y + f = 0.

Parameters
----------

Returns
-------
A: float
B: float
C: float
D: float
E: float
F: float
") Coefficients;
		void Coefficients(Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** Directrix ******************/
		%feature("compactdefaultargs") Directrix;
		%feature("autodoc", "Computes the directrix of the parabola. the directrix is: - a line parallel to the 'y direction' of the local coordinate system of this parabola, and - located on the negative side of the axis of symmetry, at a distance from the apex which is equal to the focal length of this parabola. the directrix is returned as an axis (a gp_ax2d object), the origin of which is situated on the 'x axis' of this parabola.

Returns
-------
gp_Ax2d
") Directrix;
		gp_Ax2d Directrix();

		/****************** Focal ******************/
		%feature("compactdefaultargs") Focal;
		%feature("autodoc", "Returns the distance between the vertex and the focus of the parabola.

Returns
-------
float
") Focal;
		Standard_Real Focal();

		/****************** Focus ******************/
		%feature("compactdefaultargs") Focus;
		%feature("autodoc", "Returns the focus of the parabola.

Returns
-------
gp_Pnt2d
") Focus;
		gp_Pnt2d Focus();

		/****************** IsDirect ******************/
		%feature("compactdefaultargs") IsDirect;
		%feature("autodoc", "Returns true if the local coordinate system is direct and false in the other case.

Returns
-------
bool
") IsDirect;
		Standard_Boolean IsDirect();

		/****************** Location ******************/
		%feature("compactdefaultargs") Location;
		%feature("autodoc", "Returns the vertex of the parabola.

Returns
-------
gp_Pnt2d
") Location;
		gp_Pnt2d Location();

		/****************** Mirror ******************/
		%feature("compactdefaultargs") Mirror;
		%feature("autodoc", "No available documentation.

Parameters
----------
P: gp_Pnt2d

Returns
-------
None
") Mirror;
		void Mirror(const gp_Pnt2d & P);

		/****************** Mirror ******************/
		%feature("compactdefaultargs") Mirror;
		%feature("autodoc", "No available documentation.

Parameters
----------
A: gp_Ax2d

Returns
-------
None
") Mirror;
		void Mirror(const gp_Ax2d & A);

		/****************** MirrorAxis ******************/
		%feature("compactdefaultargs") MirrorAxis;
		%feature("autodoc", "Returns the symmetry axis of the parabola. the 'location' point of this axis is the vertex of the parabola.

Returns
-------
gp_Ax2d
") MirrorAxis;
		gp_Ax2d MirrorAxis();

		/****************** Mirrored ******************/
		%feature("compactdefaultargs") Mirrored;
		%feature("autodoc", "Performs the symmetrical transformation of a parabola with respect to the point p which is the center of the symmetry.

Parameters
----------
P: gp_Pnt2d

Returns
-------
gp_Parab2d
") Mirrored;
		gp_Parab2d Mirrored(const gp_Pnt2d & P);

		/****************** Mirrored ******************/
		%feature("compactdefaultargs") Mirrored;
		%feature("autodoc", "Performs the symmetrical transformation of a parabola with respect to an axis placement which is the axis of the symmetry.

Parameters
----------
A: gp_Ax2d

Returns
-------
gp_Parab2d
") Mirrored;
		gp_Parab2d Mirrored(const gp_Ax2d & A);

		/****************** Parameter ******************/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "Returns the distance between the focus and the directrix of the parabola.

Returns
-------
float
") Parameter;
		Standard_Real Parameter();

		/****************** Reverse ******************/
		%feature("compactdefaultargs") Reverse;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Reverse;
		void Reverse();

		/****************** Reversed ******************/
		%feature("compactdefaultargs") Reversed;
		%feature("autodoc", "Reverses the orientation of the local coordinate system of this parabola (the 'y direction' is reversed). therefore, the implicit orientation of this parabola is reversed. note: - reverse assigns the result to this parabola, while - reversed creates a new one.

Returns
-------
gp_Parab2d
") Reversed;
		gp_Parab2d Reversed();

		/****************** Rotate ******************/
		%feature("compactdefaultargs") Rotate;
		%feature("autodoc", "No available documentation.

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
		%feature("compactdefaultargs") Rotated;
		%feature("autodoc", "Rotates a parabola. p is the center of the rotation. ang is the angular value of the rotation in radians.

Parameters
----------
P: gp_Pnt2d
Ang: float

Returns
-------
gp_Parab2d
") Rotated;
		gp_Parab2d Rotated(const gp_Pnt2d & P, const Standard_Real Ang);

		/****************** Scale ******************/
		%feature("compactdefaultargs") Scale;
		%feature("autodoc", "No available documentation.

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
		%feature("compactdefaultargs") Scaled;
		%feature("autodoc", "Scales a parabola. s is the scaling value. if s is negative the direction of the symmetry axis 'xaxis' is reversed and the direction of the 'yaxis' too.

Parameters
----------
P: gp_Pnt2d
S: float

Returns
-------
gp_Parab2d
") Scaled;
		gp_Parab2d Scaled(const gp_Pnt2d & P, const Standard_Real S);

		/****************** SetAxis ******************/
		%feature("compactdefaultargs") SetAxis;
		%feature("autodoc", "Changes the local coordinate system of the parabola. the 'location' point of a becomes the vertex of the parabola.

Parameters
----------
A: gp_Ax22d

Returns
-------
None
") SetAxis;
		void SetAxis(const gp_Ax22d & A);

		/****************** SetFocal ******************/
		%feature("compactdefaultargs") SetFocal;
		%feature("autodoc", "Changes the focal distance of the parabola warnings : it is possible to have focal = 0. raises constructionerror if focal < 0.0.

Parameters
----------
Focal: float

Returns
-------
None
") SetFocal;
		void SetFocal(const Standard_Real Focal);

		/****************** SetLocation ******************/
		%feature("compactdefaultargs") SetLocation;
		%feature("autodoc", "Changes the 'location' point of the parabola. it is the vertex of the parabola.

Parameters
----------
P: gp_Pnt2d

Returns
-------
None
") SetLocation;
		void SetLocation(const gp_Pnt2d & P);

		/****************** SetMirrorAxis ******************/
		%feature("compactdefaultargs") SetMirrorAxis;
		%feature("autodoc", "Modifies this parabola, by redefining its local coordinate system so that its origin and 'x direction' become those of the axis ma. the 'y direction' of the local coordinate system is then recomputed. the orientation of the local coordinate system is not modified.

Parameters
----------
A: gp_Ax2d

Returns
-------
None
") SetMirrorAxis;
		void SetMirrorAxis(const gp_Ax2d & A);

		/****************** Transform ******************/
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

		/****************** Transformed ******************/
		%feature("compactdefaultargs") Transformed;
		%feature("autodoc", "Transforms an parabola with the transformation t from class trsf2d.

Parameters
----------
T: gp_Trsf2d

Returns
-------
gp_Parab2d
") Transformed;
		gp_Parab2d Transformed(const gp_Trsf2d & T);

		/****************** Translate ******************/
		%feature("compactdefaultargs") Translate;
		%feature("autodoc", "No available documentation.

Parameters
----------
V: gp_Vec2d

Returns
-------
None
") Translate;
		void Translate(const gp_Vec2d & V);

		/****************** Translate ******************/
		%feature("compactdefaultargs") Translate;
		%feature("autodoc", "No available documentation.

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
		%feature("compactdefaultargs") Translated;
		%feature("autodoc", "Translates a parabola in the direction of the vector v. the magnitude of the translation is the vector's magnitude.

Parameters
----------
V: gp_Vec2d

Returns
-------
gp_Parab2d
") Translated;
		gp_Parab2d Translated(const gp_Vec2d & V);

		/****************** Translated ******************/
		%feature("compactdefaultargs") Translated;
		%feature("autodoc", "Translates a parabola from the point p1 to the point p2.

Parameters
----------
P1: gp_Pnt2d
P2: gp_Pnt2d

Returns
-------
gp_Parab2d
") Translated;
		gp_Parab2d Translated(const gp_Pnt2d & P1, const gp_Pnt2d & P2);

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
		/****************** gp_Pln ******************/
		%feature("compactdefaultargs") gp_Pln;
		%feature("autodoc", "Creates a plane coincident with oxy plane of the reference coordinate system.

Returns
-------
None
") gp_Pln;
		 gp_Pln();

		/****************** gp_Pln ******************/
		%feature("compactdefaultargs") gp_Pln;
		%feature("autodoc", "The coordinate system of the plane is defined with the axis placement a3. the 'direction' of a3 defines the normal to the plane. the 'location' of a3 defines the location (origin) of the plane. the 'xdirection' and 'ydirection' of a3 define the 'xaxis' and the 'yaxis' of the plane used to parametrize the plane.

Parameters
----------
A3: gp_Ax3

Returns
-------
None
") gp_Pln;
		 gp_Pln(const gp_Ax3 & A3);

		/****************** gp_Pln ******************/
		%feature("compactdefaultargs") gp_Pln;
		%feature("autodoc", "Creates a plane with the 'location' point <p> and the normal direction <v>.

Parameters
----------
P: gp_Pnt
V: gp_Dir

Returns
-------
None
") gp_Pln;
		 gp_Pln(const gp_Pnt & P, const gp_Dir & V);

		/****************** gp_Pln ******************/
		%feature("compactdefaultargs") gp_Pln;
		%feature("autodoc", "Creates a plane from its cartesian equation : a * x + b * y + c * z + d = 0.0 raises constructionerror if sqrt (a*a + b*b + c*c) <= resolution from gp.

Parameters
----------
A: float
B: float
C: float
D: float

Returns
-------
None
") gp_Pln;
		 gp_Pln(const Standard_Real A, const Standard_Real B, const Standard_Real C, const Standard_Real D);

		/****************** Axis ******************/
		%feature("compactdefaultargs") Axis;
		%feature("autodoc", "Returns the plane's normal axis.

Returns
-------
gp_Ax1
") Axis;
		const gp_Ax1 Axis();

		/****************** Coefficients ******************/
		%feature("compactdefaultargs") Coefficients;
		%feature("autodoc", "Returns the coefficients of the plane's cartesian equation : a * x + b * y + c * z + d = 0.

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

		/****************** Contains ******************/
		%feature("compactdefaultargs") Contains;
		%feature("autodoc", "Returns true if this plane contains the point p. this means that - the distance between point p and this plane is less than or equal to lineartolerance, or - line l is normal to the 'main axis' of the local coordinate system of this plane, within the tolerance angulartolerance, and the distance between the origin of line l and this plane is less than or equal to lineartolerance.

Parameters
----------
P: gp_Pnt
LinearTolerance: float

Returns
-------
bool
") Contains;
		Standard_Boolean Contains(const gp_Pnt & P, const Standard_Real LinearTolerance);

		/****************** Contains ******************/
		%feature("compactdefaultargs") Contains;
		%feature("autodoc", "Returns true if this plane contains the line l. this means that - the distance between point p and this plane is less than or equal to lineartolerance, or - line l is normal to the 'main axis' of the local coordinate system of this plane, within the tolerance angulartolerance, and the distance between the origin of line l and this plane is less than or equal to lineartolerance.

Parameters
----------
L: gp_Lin
LinearTolerance: float
AngularTolerance: float

Returns
-------
bool
") Contains;
		Standard_Boolean Contains(const gp_Lin & L, const Standard_Real LinearTolerance, const Standard_Real AngularTolerance);

		/****************** Direct ******************/
		%feature("compactdefaultargs") Direct;
		%feature("autodoc", "Returns true if the ax3 is right handed.

Returns
-------
bool
") Direct;
		Standard_Boolean Direct();

		/****************** Distance ******************/
		%feature("compactdefaultargs") Distance;
		%feature("autodoc", "Computes the distance between <self> and the point <p>.

Parameters
----------
P: gp_Pnt

Returns
-------
float
") Distance;
		Standard_Real Distance(const gp_Pnt & P);

		/****************** Distance ******************/
		%feature("compactdefaultargs") Distance;
		%feature("autodoc", "Computes the distance between <self> and the line <l>.

Parameters
----------
L: gp_Lin

Returns
-------
float
") Distance;
		Standard_Real Distance(const gp_Lin & L);

		/****************** Distance ******************/
		%feature("compactdefaultargs") Distance;
		%feature("autodoc", "Computes the distance between two planes.

Parameters
----------
Other: gp_Pln

Returns
-------
float
") Distance;
		Standard_Real Distance(const gp_Pln & Other);

		/****************** Location ******************/
		%feature("compactdefaultargs") Location;
		%feature("autodoc", "Returns the plane's location (origin).

Returns
-------
gp_Pnt
") Location;
		const gp_Pnt Location();

		/****************** Mirror ******************/
		%feature("compactdefaultargs") Mirror;
		%feature("autodoc", "No available documentation.

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
		%feature("autodoc", "No available documentation.

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
		%feature("autodoc", "No available documentation.

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
		%feature("autodoc", "Performs the symmetrical transformation of a plane with respect to the point <p> which is the center of the symmetry warnings : the normal direction to the plane is not changed. the 'xaxis' and the 'yaxis' are reversed.

Parameters
----------
P: gp_Pnt

Returns
-------
gp_Pln
") Mirrored;
		gp_Pln Mirrored(const gp_Pnt & P);

		/****************** Mirrored ******************/
		%feature("compactdefaultargs") Mirrored;
		%feature("autodoc", "Performs the symmetrical transformation of a plane with respect to an axis placement which is the axis of the symmetry. the transformation is performed on the 'location' point, on the 'xaxis' and the 'yaxis'. the resulting normal direction is the cross product between the 'xdirection' and the 'ydirection' after transformation if the initial plane was right handed, else it is the opposite.

Parameters
----------
A1: gp_Ax1

Returns
-------
gp_Pln
") Mirrored;
		gp_Pln Mirrored(const gp_Ax1 & A1);

		/****************** Mirrored ******************/
		%feature("compactdefaultargs") Mirrored;
		%feature("autodoc", "Performs the symmetrical transformation of a plane with respect to an axis placement. the axis placement <a2> locates the plane of the symmetry. the transformation is performed on the 'location' point, on the 'xaxis' and the 'yaxis'. the resulting normal direction is the cross product between the 'xdirection' and the 'ydirection' after transformation if the initial plane was right handed, else it is the opposite.

Parameters
----------
A2: gp_Ax2

Returns
-------
gp_Pln
") Mirrored;
		gp_Pln Mirrored(const gp_Ax2 & A2);

		/****************** Position ******************/
		%feature("compactdefaultargs") Position;
		%feature("autodoc", "Returns the local coordinate system of the plane .

Returns
-------
gp_Ax3
") Position;
		const gp_Ax3 Position();

		/****************** Rotate ******************/
		%feature("compactdefaultargs") Rotate;
		%feature("autodoc", "No available documentation.

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
		%feature("autodoc", "Rotates a plane. a1 is the axis of the rotation. ang is the angular value of the rotation in radians.

Parameters
----------
A1: gp_Ax1
Ang: float

Returns
-------
gp_Pln
") Rotated;
		gp_Pln Rotated(const gp_Ax1 & A1, const Standard_Real Ang);

		/****************** Scale ******************/
		%feature("compactdefaultargs") Scale;
		%feature("autodoc", "No available documentation.

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
		%feature("autodoc", "Scales a plane. s is the scaling value.

Parameters
----------
P: gp_Pnt
S: float

Returns
-------
gp_Pln
") Scaled;
		gp_Pln Scaled(const gp_Pnt & P, const Standard_Real S);

		/****************** SetAxis ******************/
		%feature("compactdefaultargs") SetAxis;
		%feature("autodoc", "Modifies this plane, by redefining its local coordinate system so that - its origin and 'main direction' become those of the axis a1 (the 'x direction' and 'y direction' are then recomputed). raises constructionerror if the a1 is parallel to the 'xaxis' of the plane.

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
		%feature("autodoc", "Changes the origin of the plane.

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
		%feature("autodoc", "Changes the local coordinate system of the plane.

Parameters
----------
A3: gp_Ax3

Returns
-------
None
") SetPosition;
		void SetPosition(const gp_Ax3 & A3);

		/****************** SquareDistance ******************/
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "Computes the square distance between <self> and the point <p>.

Parameters
----------
P: gp_Pnt

Returns
-------
float
") SquareDistance;
		Standard_Real SquareDistance(const gp_Pnt & P);

		/****************** SquareDistance ******************/
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "Computes the square distance between <self> and the line <l>.

Parameters
----------
L: gp_Lin

Returns
-------
float
") SquareDistance;
		Standard_Real SquareDistance(const gp_Lin & L);

		/****************** SquareDistance ******************/
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "Computes the square distance between two planes.

Parameters
----------
Other: gp_Pln

Returns
-------
float
") SquareDistance;
		Standard_Real SquareDistance(const gp_Pln & Other);

		/****************** Transform ******************/
		%feature("compactdefaultargs") Transform;
		%feature("autodoc", "No available documentation.

Parameters
----------
T: gp_Trsf

Returns
-------
None
") Transform;
		void Transform(const gp_Trsf & T);

		/****************** Transformed ******************/
		%feature("compactdefaultargs") Transformed;
		%feature("autodoc", "Transforms a plane with the transformation t from class trsf. the transformation is performed on the 'location' point, on the 'xaxis' and the 'yaxis'. the resulting normal direction is the cross product between the 'xdirection' and the 'ydirection' after transformation.

Parameters
----------
T: gp_Trsf

Returns
-------
gp_Pln
") Transformed;
		gp_Pln Transformed(const gp_Trsf & T);

		/****************** Translate ******************/
		%feature("compactdefaultargs") Translate;
		%feature("autodoc", "No available documentation.

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
		%feature("autodoc", "No available documentation.

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
		%feature("autodoc", "Translates a plane in the direction of the vector v. the magnitude of the translation is the vector's magnitude.

Parameters
----------
V: gp_Vec

Returns
-------
gp_Pln
") Translated;
		gp_Pln Translated(const gp_Vec & V);

		/****************** Translated ******************/
		%feature("compactdefaultargs") Translated;
		%feature("autodoc", "Translates a plane from the point p1 to the point p2.

Parameters
----------
P1: gp_Pnt
P2: gp_Pnt

Returns
-------
gp_Pln
") Translated;
		gp_Pln Translated(const gp_Pnt & P1, const gp_Pnt & P2);

		/****************** UReverse ******************/
		%feature("compactdefaultargs") UReverse;
		%feature("autodoc", "Reverses the u parametrization of the plane reversing the xaxis.

Returns
-------
None
") UReverse;
		void UReverse();

		/****************** VReverse ******************/
		%feature("compactdefaultargs") VReverse;
		%feature("autodoc", "Reverses the v parametrization of the plane reversing the yaxis.

Returns
-------
None
") VReverse;
		void VReverse();

		/****************** XAxis ******************/
		%feature("compactdefaultargs") XAxis;
		%feature("autodoc", "Returns the x axis of the plane.

Returns
-------
gp_Ax1
") XAxis;
		gp_Ax1 XAxis();

		/****************** YAxis ******************/
		%feature("compactdefaultargs") YAxis;
		%feature("autodoc", "Returns the y axis of the plane.

Returns
-------
gp_Ax1
") YAxis;
		gp_Ax1 YAxis();

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
		/****************** gp_Pnt ******************/
		%feature("compactdefaultargs") gp_Pnt;
		%feature("autodoc", "Creates a point with zero coordinates.

Returns
-------
None
") gp_Pnt;
		 gp_Pnt();

		/****************** gp_Pnt ******************/
		%feature("compactdefaultargs") gp_Pnt;
		%feature("autodoc", "Creates a point from a xyz object.

Parameters
----------
Coord: gp_XYZ

Returns
-------
None
") gp_Pnt;
		 gp_Pnt(const gp_XYZ & Coord);

		/****************** gp_Pnt ******************/
		%feature("compactdefaultargs") gp_Pnt;
		%feature("autodoc", "Creates a point with its 3 cartesian's coordinates : xp, yp, zp.

Parameters
----------
Xp: float
Yp: float
Zp: float

Returns
-------
None
") gp_Pnt;
		 gp_Pnt(const Standard_Real Xp, const Standard_Real Yp, const Standard_Real Zp);

		/****************** BaryCenter ******************/
		%feature("compactdefaultargs") BaryCenter;
		%feature("autodoc", "Assigns the result of the following expression to this point (alpha*this + beta*p) / (alpha + beta).

Parameters
----------
Alpha: float
P: gp_Pnt
Beta: float

Returns
-------
None
") BaryCenter;
		void BaryCenter(const Standard_Real Alpha, const gp_Pnt & P, const Standard_Real Beta);

		/****************** ChangeCoord ******************/
		%feature("compactdefaultargs") ChangeCoord;
		%feature("autodoc", "Returns the coordinates of this point. note: this syntax allows direct modification of the returned value.

Returns
-------
gp_XYZ
") ChangeCoord;
		gp_XYZ ChangeCoord();

		/****************** Coord ******************/
		%feature("compactdefaultargs") Coord;
		%feature("autodoc", "Returns the coordinate of corresponding to the value of index : index = 1 => x is returned index = 2 => y is returned index = 3 => z is returned raises outofrange if index != {1, 2, 3}. raised if index != {1, 2, 3}.

Parameters
----------
Index: int

Returns
-------
float
") Coord;
		Standard_Real Coord(const Standard_Integer Index);

		/****************** Coord ******************/
		%feature("compactdefaultargs") Coord;
		%feature("autodoc", "For this point gives its three coordinates xp, yp and zp.

Parameters
----------

Returns
-------
Xp: float
Yp: float
Zp: float
") Coord;
		void Coord(Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** Coord ******************/
		%feature("compactdefaultargs") Coord;
		%feature("autodoc", "For this point, returns its three coordinates as a xyz object.

Returns
-------
gp_XYZ
") Coord;
		const gp_XYZ Coord();

		/****************** Distance ******************/
		%feature("compactdefaultargs") Distance;
		%feature("autodoc", "Computes the distance between two points.

Parameters
----------
Other: gp_Pnt

Returns
-------
float
") Distance;
		Standard_Real Distance(const gp_Pnt & Other);

		/****************** IsEqual ******************/
		%feature("compactdefaultargs") IsEqual;
		%feature("autodoc", "Comparison returns true if the distance between the two points is lower or equal to lineartolerance.

Parameters
----------
Other: gp_Pnt
LinearTolerance: float

Returns
-------
bool
") IsEqual;
		Standard_Boolean IsEqual(const gp_Pnt & Other, const Standard_Real LinearTolerance);

		/****************** Mirror ******************/
		%feature("compactdefaultargs") Mirror;
		%feature("autodoc", "Performs the symmetrical transformation of a point with respect to the point p which is the center of the symmetry.

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
		%feature("autodoc", "No available documentation.

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
		%feature("autodoc", "No available documentation.

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
		%feature("autodoc", "Performs the symmetrical transformation of a point with respect to an axis placement which is the axis of the symmetry.

Parameters
----------
P: gp_Pnt

Returns
-------
gp_Pnt
") Mirrored;
		gp_Pnt Mirrored(const gp_Pnt & P);

		/****************** Mirrored ******************/
		%feature("compactdefaultargs") Mirrored;
		%feature("autodoc", "Performs the symmetrical transformation of a point with respect to a plane. the axis placement a2 locates the plane of the symmetry : (location, xdirection, ydirection).

Parameters
----------
A1: gp_Ax1

Returns
-------
gp_Pnt
") Mirrored;
		gp_Pnt Mirrored(const gp_Ax1 & A1);

		/****************** Mirrored ******************/
		%feature("compactdefaultargs") Mirrored;
		%feature("autodoc", "Rotates a point. a1 is the axis of the rotation. ang is the angular value of the rotation in radians.

Parameters
----------
A2: gp_Ax2

Returns
-------
gp_Pnt
") Mirrored;
		gp_Pnt Mirrored(const gp_Ax2 & A2);

		/****************** Rotate ******************/
		%feature("compactdefaultargs") Rotate;
		%feature("autodoc", "No available documentation.

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
		%feature("autodoc", "Scales a point. s is the scaling value.

Parameters
----------
A1: gp_Ax1
Ang: float

Returns
-------
gp_Pnt
") Rotated;
		gp_Pnt Rotated(const gp_Ax1 & A1, const Standard_Real Ang);

		/****************** Scale ******************/
		%feature("compactdefaultargs") Scale;
		%feature("autodoc", "No available documentation.

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
		%feature("autodoc", "Transforms a point with the transformation t.

Parameters
----------
P: gp_Pnt
S: float

Returns
-------
gp_Pnt
") Scaled;
		gp_Pnt Scaled(const gp_Pnt & P, const Standard_Real S);

		/****************** SetCoord ******************/
		%feature("compactdefaultargs") SetCoord;
		%feature("autodoc", "Changes the coordinate of range index : index = 1 => x is modified index = 2 => y is modified index = 3 => z is modified raised if index != {1, 2, 3}.

Parameters
----------
Index: int
Xi: float

Returns
-------
None
") SetCoord;
		void SetCoord(const Standard_Integer Index, const Standard_Real Xi);

		/****************** SetCoord ******************/
		%feature("compactdefaultargs") SetCoord;
		%feature("autodoc", "For this point, assigns the values xp, yp and zp to its three coordinates.

Parameters
----------
Xp: float
Yp: float
Zp: float

Returns
-------
None
") SetCoord;
		void SetCoord(const Standard_Real Xp, const Standard_Real Yp, const Standard_Real Zp);

		/****************** SetX ******************/
		%feature("compactdefaultargs") SetX;
		%feature("autodoc", "Assigns the given value to the x coordinate of this point.

Parameters
----------
X: float

Returns
-------
None
") SetX;
		void SetX(const Standard_Real X);

		/****************** SetXYZ ******************/
		%feature("compactdefaultargs") SetXYZ;
		%feature("autodoc", "Assigns the three coordinates of coord to this point.

Parameters
----------
Coord: gp_XYZ

Returns
-------
None
") SetXYZ;
		void SetXYZ(const gp_XYZ & Coord);

		/****************** SetY ******************/
		%feature("compactdefaultargs") SetY;
		%feature("autodoc", "Assigns the given value to the y coordinate of this point.

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
		%feature("autodoc", "Assigns the given value to the z coordinate of this point.

Parameters
----------
Z: float

Returns
-------
None
") SetZ;
		void SetZ(const Standard_Real Z);

		/****************** SquareDistance ******************/
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "Computes the square distance between two points.

Parameters
----------
Other: gp_Pnt

Returns
-------
float
") SquareDistance;
		Standard_Real SquareDistance(const gp_Pnt & Other);

		/****************** Transform ******************/
		%feature("compactdefaultargs") Transform;
		%feature("autodoc", "No available documentation.

Parameters
----------
T: gp_Trsf

Returns
-------
None
") Transform;
		void Transform(const gp_Trsf & T);

		/****************** Transformed ******************/
		%feature("compactdefaultargs") Transformed;
		%feature("autodoc", "Translates a point in the direction of the vector v. the magnitude of the translation is the vector's magnitude.

Parameters
----------
T: gp_Trsf

Returns
-------
gp_Pnt
") Transformed;
		gp_Pnt Transformed(const gp_Trsf & T);

		/****************** Translate ******************/
		%feature("compactdefaultargs") Translate;
		%feature("autodoc", "No available documentation.

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
		%feature("autodoc", "No available documentation.

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
		%feature("autodoc", "Translates a point from the point p1 to the point p2.

Parameters
----------
V: gp_Vec

Returns
-------
gp_Pnt
") Translated;
		gp_Pnt Translated(const gp_Vec & V);

		/****************** Translated ******************/
		%feature("compactdefaultargs") Translated;
		%feature("autodoc", "No available documentation.

Parameters
----------
P1: gp_Pnt
P2: gp_Pnt

Returns
-------
gp_Pnt
") Translated;
		gp_Pnt Translated(const gp_Pnt & P1, const gp_Pnt & P2);

		/****************** X ******************/
		%feature("compactdefaultargs") X;
		%feature("autodoc", "For this point, returns its x coordinate.

Returns
-------
float
") X;
		Standard_Real X();

		/****************** XYZ ******************/
		%feature("compactdefaultargs") XYZ;
		%feature("autodoc", "For this point, returns its three coordinates as a xyz object.

Returns
-------
gp_XYZ
") XYZ;
		const gp_XYZ XYZ();

		/****************** Y ******************/
		%feature("compactdefaultargs") Y;
		%feature("autodoc", "For this point, returns its y coordinate.

Returns
-------
float
") Y;
		Standard_Real Y();

		/****************** Z ******************/
		%feature("compactdefaultargs") Z;
		%feature("autodoc", "For this point, returns its z coordinate.

Returns
-------
float
") Z;
		Standard_Real Z();

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
		/****************** gp_Pnt2d ******************/
		%feature("compactdefaultargs") gp_Pnt2d;
		%feature("autodoc", "Creates a point with zero coordinates.

Returns
-------
None
") gp_Pnt2d;
		 gp_Pnt2d();

		/****************** gp_Pnt2d ******************/
		%feature("compactdefaultargs") gp_Pnt2d;
		%feature("autodoc", "Creates a point with a doublet of coordinates.

Parameters
----------
Coord: gp_XY

Returns
-------
None
") gp_Pnt2d;
		 gp_Pnt2d(const gp_XY & Coord);

		/****************** gp_Pnt2d ******************/
		%feature("compactdefaultargs") gp_Pnt2d;
		%feature("autodoc", "Creates a point with its 2 cartesian's coordinates : xp, yp.

Parameters
----------
Xp: float
Yp: float

Returns
-------
None
") gp_Pnt2d;
		 gp_Pnt2d(const Standard_Real Xp, const Standard_Real Yp);

		/****************** ChangeCoord ******************/
		%feature("compactdefaultargs") ChangeCoord;
		%feature("autodoc", "Returns the coordinates of this point. note: this syntax allows direct modification of the returned value.

Returns
-------
gp_XY
") ChangeCoord;
		gp_XY ChangeCoord();

		/****************** Coord ******************/
		%feature("compactdefaultargs") Coord;
		%feature("autodoc", "Returns the coordinate of range index : index = 1 => x is returned index = 2 => y is returned raises outofrange if index != {1, 2}.

Parameters
----------
Index: int

Returns
-------
float
") Coord;
		Standard_Real Coord(const Standard_Integer Index);

		/****************** Coord ******************/
		%feature("compactdefaultargs") Coord;
		%feature("autodoc", "For this point returns its two coordinates as a number pair.

Parameters
----------

Returns
-------
Xp: float
Yp: float
") Coord;
		void Coord(Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** Coord ******************/
		%feature("compactdefaultargs") Coord;
		%feature("autodoc", "For this point, returns its two coordinates as a number pair.

Returns
-------
gp_XY
") Coord;
		const gp_XY Coord();

		/****************** Distance ******************/
		%feature("compactdefaultargs") Distance;
		%feature("autodoc", "Computes the distance between two points.

Parameters
----------
Other: gp_Pnt2d

Returns
-------
float
") Distance;
		Standard_Real Distance(const gp_Pnt2d & Other);

		/****************** IsEqual ******************/
		%feature("compactdefaultargs") IsEqual;
		%feature("autodoc", "Comparison returns true if the distance between the two points is lower or equal to lineartolerance.

Parameters
----------
Other: gp_Pnt2d
LinearTolerance: float

Returns
-------
bool
") IsEqual;
		Standard_Boolean IsEqual(const gp_Pnt2d & Other, const Standard_Real LinearTolerance);

		/****************** Mirror ******************/
		%feature("compactdefaultargs") Mirror;
		%feature("autodoc", "Performs the symmetrical transformation of a point with respect to the point p which is the center of the symmetry.

Parameters
----------
P: gp_Pnt2d

Returns
-------
None
") Mirror;
		void Mirror(const gp_Pnt2d & P);

		/****************** Mirror ******************/
		%feature("compactdefaultargs") Mirror;
		%feature("autodoc", "No available documentation.

Parameters
----------
A: gp_Ax2d

Returns
-------
None
") Mirror;
		void Mirror(const gp_Ax2d & A);

		/****************** Mirrored ******************/
		%feature("compactdefaultargs") Mirrored;
		%feature("autodoc", "Performs the symmetrical transformation of a point with respect to an axis placement which is the axis.

Parameters
----------
P: gp_Pnt2d

Returns
-------
gp_Pnt2d
") Mirrored;
		gp_Pnt2d Mirrored(const gp_Pnt2d & P);

		/****************** Mirrored ******************/
		%feature("compactdefaultargs") Mirrored;
		%feature("autodoc", "Rotates a point. a1 is the axis of the rotation. ang is the angular value of the rotation in radians.

Parameters
----------
A: gp_Ax2d

Returns
-------
gp_Pnt2d
") Mirrored;
		gp_Pnt2d Mirrored(const gp_Ax2d & A);

		/****************** Rotate ******************/
		%feature("compactdefaultargs") Rotate;
		%feature("autodoc", "No available documentation.

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
		%feature("compactdefaultargs") Rotated;
		%feature("autodoc", "Scales a point. s is the scaling value.

Parameters
----------
P: gp_Pnt2d
Ang: float

Returns
-------
gp_Pnt2d
") Rotated;
		gp_Pnt2d Rotated(const gp_Pnt2d & P, const Standard_Real Ang);

		/****************** Scale ******************/
		%feature("compactdefaultargs") Scale;
		%feature("autodoc", "No available documentation.

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
		%feature("compactdefaultargs") Scaled;
		%feature("autodoc", "Transforms a point with the transformation t.

Parameters
----------
P: gp_Pnt2d
S: float

Returns
-------
gp_Pnt2d
") Scaled;
		gp_Pnt2d Scaled(const gp_Pnt2d & P, const Standard_Real S);

		/****************** SetCoord ******************/
		%feature("compactdefaultargs") SetCoord;
		%feature("autodoc", "Assigns the value xi to the coordinate that corresponds to index: index = 1 => x is modified index = 2 => y is modified raises outofrange if index != {1, 2}.

Parameters
----------
Index: int
Xi: float

Returns
-------
None
") SetCoord;
		void SetCoord(const Standard_Integer Index, const Standard_Real Xi);

		/****************** SetCoord ******************/
		%feature("compactdefaultargs") SetCoord;
		%feature("autodoc", "For this point, assigns the values xp and yp to its two coordinates.

Parameters
----------
Xp: float
Yp: float

Returns
-------
None
") SetCoord;
		void SetCoord(const Standard_Real Xp, const Standard_Real Yp);

		/****************** SetX ******************/
		%feature("compactdefaultargs") SetX;
		%feature("autodoc", "Assigns the given value to the x coordinate of this point.

Parameters
----------
X: float

Returns
-------
None
") SetX;
		void SetX(const Standard_Real X);

		/****************** SetXY ******************/
		%feature("compactdefaultargs") SetXY;
		%feature("autodoc", "Assigns the two coordinates of coord to this point.

Parameters
----------
Coord: gp_XY

Returns
-------
None
") SetXY;
		void SetXY(const gp_XY & Coord);

		/****************** SetY ******************/
		%feature("compactdefaultargs") SetY;
		%feature("autodoc", "Assigns the given value to the y coordinate of this point.

Parameters
----------
Y: float

Returns
-------
None
") SetY;
		void SetY(const Standard_Real Y);

		/****************** SquareDistance ******************/
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "Computes the square distance between two points.

Parameters
----------
Other: gp_Pnt2d

Returns
-------
float
") SquareDistance;
		Standard_Real SquareDistance(const gp_Pnt2d & Other);

		/****************** Transform ******************/
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

		/****************** Transformed ******************/
		%feature("compactdefaultargs") Transformed;
		%feature("autodoc", "Translates a point in the direction of the vector v. the magnitude of the translation is the vector's magnitude.

Parameters
----------
T: gp_Trsf2d

Returns
-------
gp_Pnt2d
") Transformed;
		gp_Pnt2d Transformed(const gp_Trsf2d & T);

		/****************** Translate ******************/
		%feature("compactdefaultargs") Translate;
		%feature("autodoc", "No available documentation.

Parameters
----------
V: gp_Vec2d

Returns
-------
None
") Translate;
		void Translate(const gp_Vec2d & V);

		/****************** Translate ******************/
		%feature("compactdefaultargs") Translate;
		%feature("autodoc", "No available documentation.

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
		%feature("compactdefaultargs") Translated;
		%feature("autodoc", "Translates a point from the point p1 to the point p2.

Parameters
----------
V: gp_Vec2d

Returns
-------
gp_Pnt2d
") Translated;
		gp_Pnt2d Translated(const gp_Vec2d & V);

		/****************** Translated ******************/
		%feature("compactdefaultargs") Translated;
		%feature("autodoc", "No available documentation.

Parameters
----------
P1: gp_Pnt2d
P2: gp_Pnt2d

Returns
-------
gp_Pnt2d
") Translated;
		gp_Pnt2d Translated(const gp_Pnt2d & P1, const gp_Pnt2d & P2);

		/****************** X ******************/
		%feature("compactdefaultargs") X;
		%feature("autodoc", "For this point, returns its x coordinate.

Returns
-------
float
") X;
		Standard_Real X();

		/****************** XY ******************/
		%feature("compactdefaultargs") XY;
		%feature("autodoc", "For this point, returns its two coordinates as a number pair.

Returns
-------
gp_XY
") XY;
		const gp_XY XY();

		/****************** Y ******************/
		%feature("compactdefaultargs") Y;
		%feature("autodoc", "For this point, returns its y coordinate.

Returns
-------
float
") Y;
		Standard_Real Y();

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
		/****************** gp_Quaternion ******************/
		%feature("compactdefaultargs") gp_Quaternion;
		%feature("autodoc", "Creates an identity quaternion.

Returns
-------
None
") gp_Quaternion;
		 gp_Quaternion();

		/****************** gp_Quaternion ******************/
		%feature("compactdefaultargs") gp_Quaternion;
		%feature("autodoc", "Creates quaternion directly from component values.

Parameters
----------
x: float
y: float
z: float
w: float

Returns
-------
None
") gp_Quaternion;
		 gp_Quaternion(const Standard_Real x, const Standard_Real y, const Standard_Real z, const Standard_Real w);

		/****************** gp_Quaternion ******************/
		%feature("compactdefaultargs") gp_Quaternion;
		%feature("autodoc", "Creates copy of another quaternion.

Parameters
----------
theToCopy: gp_Quaternion

Returns
-------
None
") gp_Quaternion;
		 gp_Quaternion(const gp_Quaternion & theToCopy);

		/****************** gp_Quaternion ******************/
		%feature("compactdefaultargs") gp_Quaternion;
		%feature("autodoc", "Creates quaternion representing shortest-arc rotation operator producing vector thevecto from vector thevecfrom.

Parameters
----------
theVecFrom: gp_Vec
theVecTo: gp_Vec

Returns
-------
None
") gp_Quaternion;
		 gp_Quaternion(const gp_Vec & theVecFrom, const gp_Vec & theVecTo);

		/****************** gp_Quaternion ******************/
		%feature("compactdefaultargs") gp_Quaternion;
		%feature("autodoc", "Creates quaternion representing shortest-arc rotation operator producing vector thevecto from vector thevecfrom. additional vector thehelpcrossvec defines preferred direction for rotation and is used when thevecto and thevecfrom are directed oppositely.

Parameters
----------
theVecFrom: gp_Vec
theVecTo: gp_Vec
theHelpCrossVec: gp_Vec

Returns
-------
None
") gp_Quaternion;
		 gp_Quaternion(const gp_Vec & theVecFrom, const gp_Vec & theVecTo, const gp_Vec & theHelpCrossVec);

		/****************** gp_Quaternion ******************/
		%feature("compactdefaultargs") gp_Quaternion;
		%feature("autodoc", "Creates quaternion representing rotation on angle theangle around vector theaxis.

Parameters
----------
theAxis: gp_Vec
theAngle: float

Returns
-------
None
") gp_Quaternion;
		 gp_Quaternion(const gp_Vec & theAxis, const Standard_Real theAngle);

		/****************** gp_Quaternion ******************/
		%feature("compactdefaultargs") gp_Quaternion;
		%feature("autodoc", "Creates quaternion from rotation matrix 3*3 (which should be orthonormal skew-symmetric matrix).

Parameters
----------
theMat: gp_Mat

Returns
-------
None
") gp_Quaternion;
		 gp_Quaternion(const gp_Mat & theMat);

		/****************** Add ******************/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "Adds componnets of other quaternion; result is 'rotations mix'.

Parameters
----------
theOther: gp_Quaternion

Returns
-------
None
") Add;
		void Add(const gp_Quaternion & theOther);

		/****************** Added ******************/
		%feature("compactdefaultargs") Added;
		%feature("autodoc", "Makes sum of quaternion components; result is 'rotations mix'.

Parameters
----------
theOther: gp_Quaternion

Returns
-------
gp_Quaternion
") Added;
		gp_Quaternion Added(const gp_Quaternion & theOther);

		/****************** Dot ******************/
		%feature("compactdefaultargs") Dot;
		%feature("autodoc", "Computes inner product / scalar product / dot.

Parameters
----------
theOther: gp_Quaternion

Returns
-------
float
") Dot;
		Standard_Real Dot(const gp_Quaternion & theOther);

		/****************** GetEulerAngles ******************/
		%feature("compactdefaultargs") GetEulerAngles;
		%feature("autodoc", "Returns euler angles describing current rotation.

Parameters
----------
theOrder: gp_EulerSequence

Returns
-------
theAlpha: float
theBeta: float
theGamma: float
") GetEulerAngles;
		void GetEulerAngles(const gp_EulerSequence theOrder, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** GetMatrix ******************/
		%feature("compactdefaultargs") GetMatrix;
		%feature("autodoc", "Returns rotation operation as 3*3 matrix.

Returns
-------
gp_Mat
") GetMatrix;
		gp_Mat GetMatrix();

		/****************** GetRotationAngle ******************/
		%feature("compactdefaultargs") GetRotationAngle;
		%feature("autodoc", "Return rotation angle from -pi to pi.

Returns
-------
float
") GetRotationAngle;
		Standard_Real GetRotationAngle();

		/****************** GetVectorAndAngle ******************/
		%feature("compactdefaultargs") GetVectorAndAngle;
		%feature("autodoc", "Convert a quaternion to axis+angle representation, preserve the axis direction and angle from -pi to +pi.

Parameters
----------
theAxis: gp_Vec

Returns
-------
theAngle: float
") GetVectorAndAngle;
		void GetVectorAndAngle(gp_Vec & theAxis, Standard_Real &OutValue);

		/****************** Invert ******************/
		%feature("compactdefaultargs") Invert;
		%feature("autodoc", "Inverts quaternion (both rotation direction and norm).

Returns
-------
None
") Invert;
		void Invert();

		/****************** Inverted ******************/
		%feature("compactdefaultargs") Inverted;
		%feature("autodoc", "Return inversed quaternion q^-1.

Returns
-------
gp_Quaternion
") Inverted;
		gp_Quaternion Inverted();

		/****************** IsEqual ******************/
		%feature("compactdefaultargs") IsEqual;
		%feature("autodoc", "Simple equal test without precision.

Parameters
----------
theOther: gp_Quaternion

Returns
-------
bool
") IsEqual;
		Standard_Boolean IsEqual(const gp_Quaternion & theOther);

		/****************** Multiplied ******************/
		%feature("compactdefaultargs") Multiplied;
		%feature("autodoc", "Multiply function - work the same as matrices multiplying. qq' = (cross(v,v') + wv' + w'v, ww' - dot(v,v')) result is rotation combination: q' than q (here q=this, q'=theq). notices than: qq' != q'q; qq^-1 = q;.

Parameters
----------
theOther: gp_Quaternion

Returns
-------
gp_Quaternion
") Multiplied;
		gp_Quaternion Multiplied(const gp_Quaternion & theOther);

		/****************** Multiply ******************/
		%feature("compactdefaultargs") Multiply;
		%feature("autodoc", "Adds rotation by multiplication.

Parameters
----------
theOther: gp_Quaternion

Returns
-------
None
") Multiply;
		void Multiply(const gp_Quaternion & theOther);

		/****************** Multiply ******************/
		%feature("compactdefaultargs") Multiply;
		%feature("autodoc", "Rotates vector by quaternion as rotation operator.

Parameters
----------
theVec: gp_Vec

Returns
-------
gp_Vec
") Multiply;
		gp_Vec Multiply(const gp_Vec & theVec);

		/****************** Negated ******************/
		%feature("compactdefaultargs") Negated;
		%feature("autodoc", "Returns quaternion with all components negated. note that this operation does not affect neither rotation operator defined by quaternion nor its norm.

Returns
-------
gp_Quaternion
") Negated;
		gp_Quaternion Negated();

		/****************** Norm ******************/
		%feature("compactdefaultargs") Norm;
		%feature("autodoc", "Returns norm of quaternion.

Returns
-------
float
") Norm;
		Standard_Real Norm();

		/****************** Normalize ******************/
		%feature("compactdefaultargs") Normalize;
		%feature("autodoc", "Scale quaternion that its norm goes to 1. the appearing of 0 magnitude or near is a error, so we can be sure that can divide by magnitude.

Returns
-------
None
") Normalize;
		void Normalize();

		/****************** Normalized ******************/
		%feature("compactdefaultargs") Normalized;
		%feature("autodoc", "Returns quaternion scaled so that its norm goes to 1.

Returns
-------
gp_Quaternion
") Normalized;
		gp_Quaternion Normalized();

		/****************** Reverse ******************/
		%feature("compactdefaultargs") Reverse;
		%feature("autodoc", "Reverse direction of rotation (conjugate quaternion).

Returns
-------
None
") Reverse;
		void Reverse();

		/****************** Reversed ******************/
		%feature("compactdefaultargs") Reversed;
		%feature("autodoc", "Return rotation with reversed direction (conjugated quaternion).

Returns
-------
gp_Quaternion
") Reversed;
		gp_Quaternion Reversed();

		/****************** Scale ******************/
		%feature("compactdefaultargs") Scale;
		%feature("autodoc", "Scale all components by quaternion by thescale; note that rotation is not changed by this operation (except 0-scaling).

Parameters
----------
theScale: float

Returns
-------
None
") Scale;
		void Scale(const Standard_Real theScale);

		/****************** Scaled ******************/
		%feature("compactdefaultargs") Scaled;
		%feature("autodoc", "Returns scaled quaternion.

Parameters
----------
theScale: float

Returns
-------
gp_Quaternion
") Scaled;
		gp_Quaternion Scaled(const Standard_Real theScale);

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "No available documentation.

Parameters
----------
x: float
y: float
z: float
w: float

Returns
-------
None
") Set;
		void Set(const Standard_Real x, const Standard_Real y, const Standard_Real z, const Standard_Real w);

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "No available documentation.

Parameters
----------
theQuaternion: gp_Quaternion

Returns
-------
None
") Set;
		void Set(const gp_Quaternion & theQuaternion);

		/****************** SetEulerAngles ******************/
		%feature("compactdefaultargs") SetEulerAngles;
		%feature("autodoc", "Create a unit quaternion representing rotation defined by generalized euler angles.

Parameters
----------
theOrder: gp_EulerSequence
theAlpha: float
theBeta: float
theGamma: float

Returns
-------
None
") SetEulerAngles;
		void SetEulerAngles(const gp_EulerSequence theOrder, const Standard_Real theAlpha, const Standard_Real theBeta, const Standard_Real theGamma);

		/****************** SetIdent ******************/
		%feature("compactdefaultargs") SetIdent;
		%feature("autodoc", "Make identity quaternion (zero-rotation).

Returns
-------
None
") SetIdent;
		void SetIdent();

		/****************** SetMatrix ******************/
		%feature("compactdefaultargs") SetMatrix;
		%feature("autodoc", "Create a unit quaternion by rotation matrix matrix must contain only rotation (not scale or shear) //! for numerical stability we find first the greatest component of quaternion and than search others from this one.

Parameters
----------
theMat: gp_Mat

Returns
-------
None
") SetMatrix;
		void SetMatrix(const gp_Mat & theMat);

		/****************** SetRotation ******************/
		%feature("compactdefaultargs") SetRotation;
		%feature("autodoc", "Sets quaternion to shortest-arc rotation producing vector thevecto from vector thevecfrom. if vectors thevecfrom and thevecto are opposite then rotation axis is computed as thevecfrom ^ (1,0,0) or thevecfrom ^ (0,0,1).

Parameters
----------
theVecFrom: gp_Vec
theVecTo: gp_Vec

Returns
-------
None
") SetRotation;
		void SetRotation(const gp_Vec & theVecFrom, const gp_Vec & theVecTo);

		/****************** SetRotation ******************/
		%feature("compactdefaultargs") SetRotation;
		%feature("autodoc", "Sets quaternion to shortest-arc rotation producing vector thevecto from vector thevecfrom. if vectors thevecfrom and thevecto are opposite then rotation axis is computed as thevecfrom ^ thehelpcrossvec.

Parameters
----------
theVecFrom: gp_Vec
theVecTo: gp_Vec
theHelpCrossVec: gp_Vec

Returns
-------
None
") SetRotation;
		void SetRotation(const gp_Vec & theVecFrom, const gp_Vec & theVecTo, const gp_Vec & theHelpCrossVec);

		/****************** SetVectorAndAngle ******************/
		%feature("compactdefaultargs") SetVectorAndAngle;
		%feature("autodoc", "Create a unit quaternion from axis+angle representation.

Parameters
----------
theAxis: gp_Vec
theAngle: float

Returns
-------
None
") SetVectorAndAngle;
		void SetVectorAndAngle(const gp_Vec & theAxis, const Standard_Real theAngle);

		/****************** SquareNorm ******************/
		%feature("compactdefaultargs") SquareNorm;
		%feature("autodoc", "Returns square norm of quaternion.

Returns
-------
float
") SquareNorm;
		Standard_Real SquareNorm();

		/****************** StabilizeLength ******************/
		%feature("compactdefaultargs") StabilizeLength;
		%feature("autodoc", "Stabilize quaternion length within 1 - 1/4. this operation is a lot faster than normalization and preserve length goes to 0 or infinity.

Returns
-------
None
") StabilizeLength;
		void StabilizeLength();

		/****************** Subtract ******************/
		%feature("compactdefaultargs") Subtract;
		%feature("autodoc", "Subtracts componnets of other quaternion; result is 'rotations mix'.

Parameters
----------
theOther: gp_Quaternion

Returns
-------
None
") Subtract;
		void Subtract(const gp_Quaternion & theOther);

		/****************** Subtracted ******************/
		%feature("compactdefaultargs") Subtracted;
		%feature("autodoc", "Makes difference of quaternion components; result is 'rotations mix'.

Parameters
----------
theOther: gp_Quaternion

Returns
-------
gp_Quaternion
") Subtracted;
		gp_Quaternion Subtracted(const gp_Quaternion & theOther);

		/****************** W ******************/
		%feature("compactdefaultargs") W;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") W;
		Standard_Real W();

		/****************** X ******************/
		%feature("compactdefaultargs") X;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") X;
		Standard_Real X();

		/****************** Y ******************/
		%feature("compactdefaultargs") Y;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") Y;
		Standard_Real Y();

		/****************** Z ******************/
		%feature("compactdefaultargs") Z;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") Z;
		Standard_Real Z();

		/****************** operator * ******************/
		%feature("compactdefaultargs") operator *;
		%feature("autodoc", "No available documentation.

Parameters
----------
theScale: float

Returns
-------
gp_Quaternion
") operator *;
		gp_Quaternion operator *(const Standard_Real theScale);

		/****************** operator * ******************/
		%feature("compactdefaultargs") operator *;
		%feature("autodoc", "No available documentation.

Parameters
----------
theOther: gp_Quaternion

Returns
-------
gp_Quaternion
") operator *;
		gp_Quaternion operator *(const gp_Quaternion & theOther);

		/****************** operator * ******************/
		%feature("compactdefaultargs") operator *;
		%feature("autodoc", "No available documentation.

Parameters
----------
theVec: gp_Vec

Returns
-------
gp_Vec
") operator *;
		gp_Vec operator *(const gp_Vec & theVec);


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
		/****************** operator + ******************/
		%feature("compactdefaultargs") operator +;
		%feature("autodoc", "No available documentation.

Parameters
----------
theOther: gp_Quaternion

Returns
-------
gp_Quaternion
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
		/****************** operator - ******************/
		%feature("compactdefaultargs") operator -;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Quaternion
") operator -;
		gp_Quaternion operator -();

		/****************** operator - ******************/
		%feature("compactdefaultargs") operator -;
		%feature("autodoc", "No available documentation.

Parameters
----------
theOther: gp_Quaternion

Returns
-------
gp_Quaternion
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
	__repr__ = _dumps_object
	}
};

/***************************
* class gp_QuaternionNLerp *
***************************/
class gp_QuaternionNLerp {
	public:
		/****************** gp_QuaternionNLerp ******************/
		%feature("compactdefaultargs") gp_QuaternionNLerp;
		%feature("autodoc", "Empty constructor,.

Returns
-------
None
") gp_QuaternionNLerp;
		 gp_QuaternionNLerp();

		/****************** gp_QuaternionNLerp ******************/
		%feature("compactdefaultargs") gp_QuaternionNLerp;
		%feature("autodoc", "Constructor with initialization.

Parameters
----------
theQStart: gp_Quaternion
theQEnd: gp_Quaternion

Returns
-------
None
") gp_QuaternionNLerp;
		 gp_QuaternionNLerp(const gp_Quaternion & theQStart, const gp_Quaternion & theQEnd);

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Initialize the tool with start and end values.

Parameters
----------
theQStart: gp_Quaternion
theQEnd: gp_Quaternion

Returns
-------
None
") Init;
		void Init(const gp_Quaternion & theQStart, const gp_Quaternion & theQEnd);

		/****************** InitFromUnit ******************/
		%feature("compactdefaultargs") InitFromUnit;
		%feature("autodoc", "Initialize the tool with start and end unit quaternions.

Parameters
----------
theQStart: gp_Quaternion
theQEnd: gp_Quaternion

Returns
-------
None
") InitFromUnit;
		void InitFromUnit(const gp_Quaternion & theQStart, const gp_Quaternion & theQEnd);

		/****************** Interpolate ******************/
		%feature("compactdefaultargs") Interpolate;
		%feature("autodoc", "Compute interpolated quaternion between two quaternions. @param thestart first quaternion @param theend second quaternion @param thet normalized interpolation coefficient within 0..1 range, with 0 pointing to thestart and 1 to theend.

Parameters
----------
theQStart: gp_Quaternion
theQEnd: gp_Quaternion
theT: float

Returns
-------
gp_Quaternion
") Interpolate;
		static gp_Quaternion Interpolate(const gp_Quaternion & theQStart, const gp_Quaternion & theQEnd, Standard_Real theT);

		/****************** Interpolate ******************/
		%feature("compactdefaultargs") Interpolate;
		%feature("autodoc", "Set interpolated quaternion for thet position (from 0.0 to 1.0).

Parameters
----------
theT: float
theResultQ: gp_Quaternion

Returns
-------
None
") Interpolate;
		void Interpolate(Standard_Real theT, gp_Quaternion & theResultQ);

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
		/****************** gp_QuaternionSLerp ******************/
		%feature("compactdefaultargs") gp_QuaternionSLerp;
		%feature("autodoc", "Empty constructor,.

Returns
-------
None
") gp_QuaternionSLerp;
		 gp_QuaternionSLerp();

		/****************** gp_QuaternionSLerp ******************/
		%feature("compactdefaultargs") gp_QuaternionSLerp;
		%feature("autodoc", "Constructor with initialization.

Parameters
----------
theQStart: gp_Quaternion
theQEnd: gp_Quaternion

Returns
-------
None
") gp_QuaternionSLerp;
		 gp_QuaternionSLerp(const gp_Quaternion & theQStart, const gp_Quaternion & theQEnd);

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Initialize the tool with start and end values.

Parameters
----------
theQStart: gp_Quaternion
theQEnd: gp_Quaternion

Returns
-------
None
") Init;
		void Init(const gp_Quaternion & theQStart, const gp_Quaternion & theQEnd);

		/****************** InitFromUnit ******************/
		%feature("compactdefaultargs") InitFromUnit;
		%feature("autodoc", "Initialize the tool with start and end unit quaternions.

Parameters
----------
theQStart: gp_Quaternion
theQEnd: gp_Quaternion

Returns
-------
None
") InitFromUnit;
		void InitFromUnit(const gp_Quaternion & theQStart, const gp_Quaternion & theQEnd);

		/****************** Interpolate ******************/
		%feature("compactdefaultargs") Interpolate;
		%feature("autodoc", "Compute interpolated quaternion between two quaternions. @param thestart first quaternion @param theend second quaternion @param thet normalized interpolation coefficient within 0..1 range, with 0 pointing to thestart and 1 to theend.

Parameters
----------
theQStart: gp_Quaternion
theQEnd: gp_Quaternion
theT: float

Returns
-------
gp_Quaternion
") Interpolate;
		static gp_Quaternion Interpolate(const gp_Quaternion & theQStart, const gp_Quaternion & theQEnd, Standard_Real theT);

		/****************** Interpolate ******************/
		%feature("compactdefaultargs") Interpolate;
		%feature("autodoc", "Set interpolated quaternion for thet position (from 0.0 to 1.0).

Parameters
----------
theT: float
theResultQ: gp_Quaternion

Returns
-------
None
") Interpolate;
		void Interpolate(Standard_Real theT, gp_Quaternion & theResultQ);

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
		/****************** gp_Sphere ******************/
		%feature("compactdefaultargs") gp_Sphere;
		%feature("autodoc", "Creates an indefinite sphere.

Returns
-------
None
") gp_Sphere;
		 gp_Sphere();

		/****************** gp_Sphere ******************/
		%feature("compactdefaultargs") gp_Sphere;
		%feature("autodoc", "Constructs a sphere with radius radius, centered on the origin of a3. a3 is the local coordinate system of the sphere. warnings : it is not forbidden to create a sphere with null radius. raises constructionerror if radius < 0.0.

Parameters
----------
A3: gp_Ax3
Radius: float

Returns
-------
None
") gp_Sphere;
		 gp_Sphere(const gp_Ax3 & A3, const Standard_Real Radius);

		/****************** Area ******************/
		%feature("compactdefaultargs") Area;
		%feature("autodoc", "Computes the aera of the sphere.

Returns
-------
float
") Area;
		Standard_Real Area();

		/****************** Coefficients ******************/
		%feature("compactdefaultargs") Coefficients;
		%feature("autodoc", "Computes the coefficients of the implicit equation of the quadric in the absolute cartesian coordinates system : a1.x**2 + a2.y**2 + a3.z**2 + 2.(b1.x.y + b2.x.z + b3.y.z) + 2.(c1.x + c2.y + c3.z) + d = 0.0.

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

		/****************** Direct ******************/
		%feature("compactdefaultargs") Direct;
		%feature("autodoc", "Returns true if the local coordinate system of this sphere is right-handed.

Returns
-------
bool
") Direct;
		Standard_Boolean Direct();

		/****************** Location ******************/
		%feature("compactdefaultargs") Location;
		%feature("autodoc", "--- purpose ; returns the center of the sphere.

Returns
-------
gp_Pnt
") Location;
		const gp_Pnt Location();

		/****************** Mirror ******************/
		%feature("compactdefaultargs") Mirror;
		%feature("autodoc", "No available documentation.

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
		%feature("autodoc", "No available documentation.

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
		%feature("autodoc", "No available documentation.

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
		%feature("autodoc", "Performs the symmetrical transformation of a sphere with respect to the point p which is the center of the symmetry.

Parameters
----------
P: gp_Pnt

Returns
-------
gp_Sphere
") Mirrored;
		gp_Sphere Mirrored(const gp_Pnt & P);

		/****************** Mirrored ******************/
		%feature("compactdefaultargs") Mirrored;
		%feature("autodoc", "Performs the symmetrical transformation of a sphere with respect to an axis placement which is the axis of the symmetry.

Parameters
----------
A1: gp_Ax1

Returns
-------
gp_Sphere
") Mirrored;
		gp_Sphere Mirrored(const gp_Ax1 & A1);

		/****************** Mirrored ******************/
		%feature("compactdefaultargs") Mirrored;
		%feature("autodoc", "Performs the symmetrical transformation of a sphere with respect to a plane. the axis placement a2 locates the plane of the of the symmetry : (location, xdirection, ydirection).

Parameters
----------
A2: gp_Ax2

Returns
-------
gp_Sphere
") Mirrored;
		gp_Sphere Mirrored(const gp_Ax2 & A2);

		/****************** Position ******************/
		%feature("compactdefaultargs") Position;
		%feature("autodoc", "Returns the local coordinates system of the sphere.

Returns
-------
gp_Ax3
") Position;
		const gp_Ax3 Position();

		/****************** Radius ******************/
		%feature("compactdefaultargs") Radius;
		%feature("autodoc", "Returns the radius of the sphere.

Returns
-------
float
") Radius;
		Standard_Real Radius();

		/****************** Rotate ******************/
		%feature("compactdefaultargs") Rotate;
		%feature("autodoc", "No available documentation.

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
		%feature("autodoc", "Rotates a sphere. a1 is the axis of the rotation. ang is the angular value of the rotation in radians.

Parameters
----------
A1: gp_Ax1
Ang: float

Returns
-------
gp_Sphere
") Rotated;
		gp_Sphere Rotated(const gp_Ax1 & A1, const Standard_Real Ang);

		/****************** Scale ******************/
		%feature("compactdefaultargs") Scale;
		%feature("autodoc", "No available documentation.

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
		%feature("autodoc", "Scales a sphere. s is the scaling value. the absolute value of s is used to scale the sphere.

Parameters
----------
P: gp_Pnt
S: float

Returns
-------
gp_Sphere
") Scaled;
		gp_Sphere Scaled(const gp_Pnt & P, const Standard_Real S);

		/****************** SetLocation ******************/
		%feature("compactdefaultargs") SetLocation;
		%feature("autodoc", "Changes the center of the sphere.

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
		%feature("autodoc", "Changes the local coordinate system of the sphere.

Parameters
----------
A3: gp_Ax3

Returns
-------
None
") SetPosition;
		void SetPosition(const gp_Ax3 & A3);

		/****************** SetRadius ******************/
		%feature("compactdefaultargs") SetRadius;
		%feature("autodoc", "Assigns r the radius of the sphere. warnings : it is not forbidden to create a sphere with null radius. raises constructionerror if r < 0.0.

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
		%feature("autodoc", "No available documentation.

Parameters
----------
T: gp_Trsf

Returns
-------
None
") Transform;
		void Transform(const gp_Trsf & T);

		/****************** Transformed ******************/
		%feature("compactdefaultargs") Transformed;
		%feature("autodoc", "Transforms a sphere with the transformation t from class trsf.

Parameters
----------
T: gp_Trsf

Returns
-------
gp_Sphere
") Transformed;
		gp_Sphere Transformed(const gp_Trsf & T);

		/****************** Translate ******************/
		%feature("compactdefaultargs") Translate;
		%feature("autodoc", "No available documentation.

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
		%feature("autodoc", "No available documentation.

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
		%feature("autodoc", "Translates a sphere in the direction of the vector v. the magnitude of the translation is the vector's magnitude.

Parameters
----------
V: gp_Vec

Returns
-------
gp_Sphere
") Translated;
		gp_Sphere Translated(const gp_Vec & V);

		/****************** Translated ******************/
		%feature("compactdefaultargs") Translated;
		%feature("autodoc", "Translates a sphere from the point p1 to the point p2.

Parameters
----------
P1: gp_Pnt
P2: gp_Pnt

Returns
-------
gp_Sphere
") Translated;
		gp_Sphere Translated(const gp_Pnt & P1, const gp_Pnt & P2);

		/****************** UReverse ******************/
		%feature("compactdefaultargs") UReverse;
		%feature("autodoc", "Reverses the u parametrization of the sphere reversing the yaxis.

Returns
-------
None
") UReverse;
		void UReverse();

		/****************** VReverse ******************/
		%feature("compactdefaultargs") VReverse;
		%feature("autodoc", "Reverses the v parametrization of the sphere reversing the zaxis.

Returns
-------
None
") VReverse;
		void VReverse();

		/****************** Volume ******************/
		%feature("compactdefaultargs") Volume;
		%feature("autodoc", "Computes the volume of the sphere.

Returns
-------
float
") Volume;
		Standard_Real Volume();

		/****************** XAxis ******************/
		%feature("compactdefaultargs") XAxis;
		%feature("autodoc", "Returns the axis x of the sphere.

Returns
-------
gp_Ax1
") XAxis;
		gp_Ax1 XAxis();

		/****************** YAxis ******************/
		%feature("compactdefaultargs") YAxis;
		%feature("autodoc", "Returns the axis y of the sphere.

Returns
-------
gp_Ax1
") YAxis;
		gp_Ax1 YAxis();

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
		/****************** gp_Torus ******************/
		%feature("compactdefaultargs") gp_Torus;
		%feature("autodoc", "Creates an indefinite torus.

Returns
-------
None
") gp_Torus;
		 gp_Torus();

		/****************** gp_Torus ******************/
		%feature("compactdefaultargs") gp_Torus;
		%feature("autodoc", "A torus centered on the origin of coordinate system a3, with major radius majorradius and minor radius minorradius, and with the reference plane defined by the origin, the 'x direction' and the 'y direction' of a3. warnings : it is not forbidden to create a torus with majorradius = minorradius = 0.0 raises constructionerror if minorradius < 0.0 or if majorradius < 0.0.

Parameters
----------
A3: gp_Ax3
MajorRadius: float
MinorRadius: float

Returns
-------
None
") gp_Torus;
		 gp_Torus(const gp_Ax3 & A3, const Standard_Real MajorRadius, const Standard_Real MinorRadius);

		/****************** Area ******************/
		%feature("compactdefaultargs") Area;
		%feature("autodoc", "Computes the area of the torus.

Returns
-------
float
") Area;
		Standard_Real Area();

		/****************** Axis ******************/
		%feature("compactdefaultargs") Axis;
		%feature("autodoc", "Returns the symmetry axis of the torus.

Returns
-------
gp_Ax1
") Axis;
		const gp_Ax1 Axis();

		/****************** Direct ******************/
		%feature("compactdefaultargs") Direct;
		%feature("autodoc", "Returns true if the ax3, the local coordinate system of this torus, is right handed.

Returns
-------
bool
") Direct;
		Standard_Boolean Direct();

		/****************** Location ******************/
		%feature("compactdefaultargs") Location;
		%feature("autodoc", "Returns the torus's location.

Returns
-------
gp_Pnt
") Location;
		const gp_Pnt Location();

		/****************** MajorRadius ******************/
		%feature("compactdefaultargs") MajorRadius;
		%feature("autodoc", "Returns the major radius of the torus.

Returns
-------
float
") MajorRadius;
		Standard_Real MajorRadius();

		/****************** MinorRadius ******************/
		%feature("compactdefaultargs") MinorRadius;
		%feature("autodoc", "Returns the minor radius of the torus.

Returns
-------
float
") MinorRadius;
		Standard_Real MinorRadius();

		/****************** Mirror ******************/
		%feature("compactdefaultargs") Mirror;
		%feature("autodoc", "No available documentation.

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
		%feature("autodoc", "No available documentation.

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
		%feature("autodoc", "No available documentation.

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
		%feature("autodoc", "Performs the symmetrical transformation of a torus with respect to the point p which is the center of the symmetry.

Parameters
----------
P: gp_Pnt

Returns
-------
gp_Torus
") Mirrored;
		gp_Torus Mirrored(const gp_Pnt & P);

		/****************** Mirrored ******************/
		%feature("compactdefaultargs") Mirrored;
		%feature("autodoc", "Performs the symmetrical transformation of a torus with respect to an axis placement which is the axis of the symmetry.

Parameters
----------
A1: gp_Ax1

Returns
-------
gp_Torus
") Mirrored;
		gp_Torus Mirrored(const gp_Ax1 & A1);

		/****************** Mirrored ******************/
		%feature("compactdefaultargs") Mirrored;
		%feature("autodoc", "Performs the symmetrical transformation of a torus with respect to a plane. the axis placement a2 locates the plane of the of the symmetry : (location, xdirection, ydirection).

Parameters
----------
A2: gp_Ax2

Returns
-------
gp_Torus
") Mirrored;
		gp_Torus Mirrored(const gp_Ax2 & A2);

		/****************** Position ******************/
		%feature("compactdefaultargs") Position;
		%feature("autodoc", "Returns the local coordinates system of the torus.

Returns
-------
gp_Ax3
") Position;
		const gp_Ax3 Position();

		/****************** Rotate ******************/
		%feature("compactdefaultargs") Rotate;
		%feature("autodoc", "No available documentation.

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
		%feature("autodoc", "Rotates a torus. a1 is the axis of the rotation. ang is the angular value of the rotation in radians.

Parameters
----------
A1: gp_Ax1
Ang: float

Returns
-------
gp_Torus
") Rotated;
		gp_Torus Rotated(const gp_Ax1 & A1, const Standard_Real Ang);

		/****************** Scale ******************/
		%feature("compactdefaultargs") Scale;
		%feature("autodoc", "No available documentation.

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
		%feature("autodoc", "Scales a torus. s is the scaling value. the absolute value of s is used to scale the torus.

Parameters
----------
P: gp_Pnt
S: float

Returns
-------
gp_Torus
") Scaled;
		gp_Torus Scaled(const gp_Pnt & P, const Standard_Real S);

		/****************** SetAxis ******************/
		%feature("compactdefaultargs") SetAxis;
		%feature("autodoc", "Modifies this torus, by redefining its local coordinate system so that: - its origin and 'main direction' become those of the axis a1 (the 'x direction' and 'y direction' are then recomputed). raises constructionerror if the direction of a1 is parallel to the 'xdirection' of the coordinate system of the toroidal surface.

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
		%feature("autodoc", "Changes the location of the torus.

Parameters
----------
Loc: gp_Pnt

Returns
-------
None
") SetLocation;
		void SetLocation(const gp_Pnt & Loc);

		/****************** SetMajorRadius ******************/
		%feature("compactdefaultargs") SetMajorRadius;
		%feature("autodoc", "Assigns value to the major radius of this torus. raises constructionerror if majorradius - minorradius <= resolution().

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
		%feature("autodoc", "Assigns value to the minor radius of this torus. raises constructionerror if minorradius < 0.0 or if majorradius - minorradius <= resolution from gp.

Parameters
----------
MinorRadius: float

Returns
-------
None
") SetMinorRadius;
		void SetMinorRadius(const Standard_Real MinorRadius);

		/****************** SetPosition ******************/
		%feature("compactdefaultargs") SetPosition;
		%feature("autodoc", "Changes the local coordinate system of the surface.

Parameters
----------
A3: gp_Ax3

Returns
-------
None
") SetPosition;
		void SetPosition(const gp_Ax3 & A3);

		/****************** Transform ******************/
		%feature("compactdefaultargs") Transform;
		%feature("autodoc", "No available documentation.

Parameters
----------
T: gp_Trsf

Returns
-------
None
") Transform;
		void Transform(const gp_Trsf & T);

		/****************** Transformed ******************/
		%feature("compactdefaultargs") Transformed;
		%feature("autodoc", "Transforms a torus with the transformation t from class trsf.

Parameters
----------
T: gp_Trsf

Returns
-------
gp_Torus
") Transformed;
		gp_Torus Transformed(const gp_Trsf & T);

		/****************** Translate ******************/
		%feature("compactdefaultargs") Translate;
		%feature("autodoc", "No available documentation.

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
		%feature("autodoc", "No available documentation.

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
		%feature("autodoc", "Translates a torus in the direction of the vector v. the magnitude of the translation is the vector's magnitude.

Parameters
----------
V: gp_Vec

Returns
-------
gp_Torus
") Translated;
		gp_Torus Translated(const gp_Vec & V);

		/****************** Translated ******************/
		%feature("compactdefaultargs") Translated;
		%feature("autodoc", "Translates a torus from the point p1 to the point p2.

Parameters
----------
P1: gp_Pnt
P2: gp_Pnt

Returns
-------
gp_Torus
") Translated;
		gp_Torus Translated(const gp_Pnt & P1, const gp_Pnt & P2);

		/****************** UReverse ******************/
		%feature("compactdefaultargs") UReverse;
		%feature("autodoc", "Reverses the u parametrization of the torus reversing the yaxis.

Returns
-------
None
") UReverse;
		void UReverse();

		/****************** VReverse ******************/
		%feature("compactdefaultargs") VReverse;
		%feature("autodoc", "Reverses the v parametrization of the torus reversing the zaxis.

Returns
-------
None
") VReverse;
		void VReverse();

		/****************** Volume ******************/
		%feature("compactdefaultargs") Volume;
		%feature("autodoc", "Computes the volume of the torus.

Returns
-------
float
") Volume;
		Standard_Real Volume();

		/****************** XAxis ******************/
		%feature("compactdefaultargs") XAxis;
		%feature("autodoc", "Returns the axis x of the torus.

Returns
-------
gp_Ax1
") XAxis;
		gp_Ax1 XAxis();

		/****************** YAxis ******************/
		%feature("compactdefaultargs") YAxis;
		%feature("autodoc", "Returns the axis y of the torus.

Returns
-------
gp_Ax1
") YAxis;
		gp_Ax1 YAxis();

};


%extend gp_Torus {
	%pythoncode {
	__repr__ = _dumps_object

	@methodnotwrapped
	def Coefficients(self):
		pass
	}
};

/****************
* class gp_Trsf *
****************/
class gp_Trsf {
	public:
		/****************** gp_Trsf ******************/
		%feature("compactdefaultargs") gp_Trsf;
		%feature("autodoc", "Returns the identity transformation.

Returns
-------
None
") gp_Trsf;
		 gp_Trsf();

		/****************** gp_Trsf ******************/
		%feature("compactdefaultargs") gp_Trsf;
		%feature("autodoc", "Creates a 3d transformation from the 2d transformation t. the resulting transformation has a homogeneous vectorial part, v3, and a translation part, t3, built from t: a11 a12 0 a13 v3 = a21 a22 0 t3 = a23 0 0 1. 0 it also has the same scale factor as t. this guarantees (by projection) that the transformation which would be performed by t in a plane (2d space) is performed by the resulting transformation in the xoy plane of the 3d space, (i.e. in the plane defined by the origin (0., 0., 0.) and the vectors dx (1., 0., 0.), and dy (0., 1., 0.)). the scale factor is applied to the entire space.

Parameters
----------
T: gp_Trsf2d

Returns
-------
None
") gp_Trsf;
		 gp_Trsf(const gp_Trsf2d & T);


            %feature("autodoc", "1");
            %extend{
                std::string DumpJsonToString(int depth=-1) {
                std::stringstream s;
                self->DumpJson(s, depth);
                return s.str();}
            };
		/****************** Form ******************/
		%feature("compactdefaultargs") Form;
		%feature("autodoc", "Returns the nature of the transformation. it can be: an identity transformation, a rotation, a translation, a mirror transformation (relative to a point, an axis or a plane), a scaling transformation, or a compound transformation.

Returns
-------
gp_TrsfForm
") Form;
		gp_TrsfForm Form();

		/****************** GetRotation ******************/
		%feature("compactdefaultargs") GetRotation;
		%feature("autodoc", "Returns the boolean true if there is non-zero rotation. in the presence of rotation, the output parameters store the axis and the angle of rotation. the method always returns positive value 'theangle', i.e., 0. < theangle <= pi. note that this rotation is defined only by the vectorial part of the transformation; generally you would need to check also the translational part to obtain the axis (gp_ax1) of rotation.

Parameters
----------
theAxis: gp_XYZ

Returns
-------
theAngle: float
") GetRotation;
		Standard_Boolean GetRotation(gp_XYZ & theAxis, Standard_Real &OutValue);

		/****************** GetRotation ******************/
		%feature("compactdefaultargs") GetRotation;
		%feature("autodoc", "Returns quaternion representing rotational part of the transformation.

Returns
-------
gp_Quaternion
") GetRotation;
		gp_Quaternion GetRotation();

		/****************** HVectorialPart ******************/
		%feature("compactdefaultargs") HVectorialPart;
		%feature("autodoc", "Computes the homogeneous vectorial part of the transformation. it is a 3*3 matrix which doesn't include the scale factor. in other words, the vectorial part of this transformation is equal to its homogeneous vectorial part, multiplied by the scale factor. the coefficients of this matrix must be multiplied by the scale factor to obtain the coefficients of the transformation.

Returns
-------
gp_Mat
") HVectorialPart;
		const gp_Mat HVectorialPart();

		/****************** Invert ******************/
		%feature("compactdefaultargs") Invert;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Invert;
		void Invert();

		/****************** Inverted ******************/
		%feature("compactdefaultargs") Inverted;
		%feature("autodoc", "Computes the reverse transformation raises an exception if the matrix of the transformation is not inversible, it means that the scale factor is lower or equal to resolution from package gp. computes the transformation composed with t and <self>. in a c++ implementation you can also write tcomposed = <self> * t. example : trsf t1, t2, tcomp; ............... tcomp = t2.multiplied(t1); // or (tcomp = t2 * t1) pnt p1(10.,3.,4.); pnt p2 = p1.transformed(tcomp); //using tcomp pnt p3 = p1.transformed(t1); //using t1 then t2 p3.transform(t2); // p3 = p2 !!!.

Returns
-------
gp_Trsf
") Inverted;
		gp_Trsf Inverted();

		/****************** IsNegative ******************/
		%feature("compactdefaultargs") IsNegative;
		%feature("autodoc", "Returns true if the determinant of the vectorial part of this transformation is negative.

Returns
-------
bool
") IsNegative;
		Standard_Boolean IsNegative();

		/****************** Multiplied ******************/
		%feature("compactdefaultargs") Multiplied;
		%feature("autodoc", "No available documentation.

Parameters
----------
T: gp_Trsf

Returns
-------
gp_Trsf
") Multiplied;
		gp_Trsf Multiplied(const gp_Trsf & T);

		/****************** Multiply ******************/
		%feature("compactdefaultargs") Multiply;
		%feature("autodoc", "Computes the transformation composed with <self> and t. <self> = <self> * t.

Parameters
----------
T: gp_Trsf

Returns
-------
None
") Multiply;
		void Multiply(const gp_Trsf & T);

		/****************** Power ******************/
		%feature("compactdefaultargs") Power;
		%feature("autodoc", "No available documentation.

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
		%feature("autodoc", "Computes the following composition of transformations <self> * <self> * .......* <self>, n time. if n = 0 <self> = identity if n < 0 <self> = <self>.inverse() *...........* <self>.inverse(). //! raises if n < 0 and if the matrix of the transformation not inversible.

Parameters
----------
N: int

Returns
-------
gp_Trsf
") Powered;
		gp_Trsf Powered(const Standard_Integer N);

		/****************** PreMultiply ******************/
		%feature("compactdefaultargs") PreMultiply;
		%feature("autodoc", "Computes the transformation composed with <self> and t. <self> = t * <self>.

Parameters
----------
T: gp_Trsf

Returns
-------
None
") PreMultiply;
		void PreMultiply(const gp_Trsf & T);

		/****************** ScaleFactor ******************/
		%feature("compactdefaultargs") ScaleFactor;
		%feature("autodoc", "Returns the scale factor.

Returns
-------
float
") ScaleFactor;
		Standard_Real ScaleFactor();

		/****************** SetDisplacement ******************/
		%feature("compactdefaultargs") SetDisplacement;
		%feature("autodoc", "Modifies this transformation so that it transforms the coordinate system defined by fromsystem1 into the one defined by tosystem2. after this modification, this transformation transforms: - the origin of fromsystem1 into the origin of tosystem2, - the 'x direction' of fromsystem1 into the 'x direction' of tosystem2, - the 'y direction' of fromsystem1 into the 'y direction' of tosystem2, and - the 'main direction' of fromsystem1 into the 'main direction' of tosystem2. warning when you know the coordinates of a point in one coordinate system and you want to express these coordinates in another one, do not use the transformation resulting from this function. use the transformation that results from settransformation instead. setdisplacement and settransformation create related transformations: the vectorial part of one is the inverse of the vectorial part of the other.

Parameters
----------
FromSystem1: gp_Ax3
ToSystem2: gp_Ax3

Returns
-------
None
") SetDisplacement;
		void SetDisplacement(const gp_Ax3 & FromSystem1, const gp_Ax3 & ToSystem2);

		/****************** SetForm ******************/
		%feature("compactdefaultargs") SetForm;
		%feature("autodoc", "No available documentation.

Parameters
----------
P: gp_TrsfForm

Returns
-------
None
") SetForm;
		void SetForm(const gp_TrsfForm P);

		/****************** SetMirror ******************/
		%feature("compactdefaultargs") SetMirror;
		%feature("autodoc", "Makes the transformation into a symmetrical transformation. p is the center of the symmetry.

Parameters
----------
P: gp_Pnt

Returns
-------
None
") SetMirror;
		void SetMirror(const gp_Pnt & P);

		/****************** SetMirror ******************/
		%feature("compactdefaultargs") SetMirror;
		%feature("autodoc", "Makes the transformation into a symmetrical transformation. a1 is the center of the axial symmetry.

Parameters
----------
A1: gp_Ax1

Returns
-------
None
") SetMirror;
		void SetMirror(const gp_Ax1 & A1);

		/****************** SetMirror ******************/
		%feature("compactdefaultargs") SetMirror;
		%feature("autodoc", "Makes the transformation into a symmetrical transformation. a2 is the center of the planar symmetry and defines the plane of symmetry by its origin, 'x direction' and 'y direction'.

Parameters
----------
A2: gp_Ax2

Returns
-------
None
") SetMirror;
		void SetMirror(const gp_Ax2 & A2);

		/****************** SetRotation ******************/
		%feature("compactdefaultargs") SetRotation;
		%feature("autodoc", "Changes the transformation into a rotation. a1 is the rotation axis and ang is the angular value of the rotation in radians.

Parameters
----------
A1: gp_Ax1
Ang: float

Returns
-------
None
") SetRotation;
		void SetRotation(const gp_Ax1 & A1, const Standard_Real Ang);

		/****************** SetRotation ******************/
		%feature("compactdefaultargs") SetRotation;
		%feature("autodoc", "Changes the transformation into a rotation defined by quaternion. note that rotation is performed around origin, i.e. no translation is involved.

Parameters
----------
R: gp_Quaternion

Returns
-------
None
") SetRotation;
		void SetRotation(const gp_Quaternion & R);

		/****************** SetScale ******************/
		%feature("compactdefaultargs") SetScale;
		%feature("autodoc", "Changes the transformation into a scale. p is the center of the scale and s is the scaling value. raises constructionerror if <s> is null.

Parameters
----------
P: gp_Pnt
S: float

Returns
-------
None
") SetScale;
		void SetScale(const gp_Pnt & P, const Standard_Real S);

		/****************** SetScaleFactor ******************/
		%feature("compactdefaultargs") SetScaleFactor;
		%feature("autodoc", "Modifies the scale factor. raises constructionerror if s is null.

Parameters
----------
S: float

Returns
-------
None
") SetScaleFactor;
		void SetScaleFactor(const Standard_Real S);

		/****************** SetTransformation ******************/
		%feature("compactdefaultargs") SetTransformation;
		%feature("autodoc", "Modifies this transformation so that it transforms the coordinates of any point, (x, y, z), relative to a source coordinate system into the coordinates (x', y', z') which are relative to a target coordinate system, but which represent the same point the transformation is from the coordinate system 'fromsystem1' to the coordinate system 'tosystem2'. example : in a c++ implementation : real x1, y1, z1; // are the coordinates of a point in the // local system fromsystem1 real x2, y2, z2; // are the coordinates of a point in the // local system tosystem2 gp_pnt p1 (x1, y1, z1) trsf t; t.settransformation (fromsystem1, tosystem2); gp_pnt p2 = p1.transformed (t); p2.coord (x2, y2, z2);.

Parameters
----------
FromSystem1: gp_Ax3
ToSystem2: gp_Ax3

Returns
-------
None
") SetTransformation;
		void SetTransformation(const gp_Ax3 & FromSystem1, const gp_Ax3 & ToSystem2);

		/****************** SetTransformation ******************/
		%feature("compactdefaultargs") SetTransformation;
		%feature("autodoc", "Modifies this transformation so that it transforms the coordinates of any point, (x, y, z), relative to a source coordinate system into the coordinates (x', y', z') which are relative to a target coordinate system, but which represent the same point the transformation is from the default coordinate system {p(0.,0.,0.), vx (1.,0.,0.), vy (0.,1.,0.), vz (0., 0. ,1.) } to the local coordinate system defined with the ax3 tosystem. use in the same way as the previous method. fromsystem1 is defaulted to the absolute coordinate system.

Parameters
----------
ToSystem: gp_Ax3

Returns
-------
None
") SetTransformation;
		void SetTransformation(const gp_Ax3 & ToSystem);

		/****************** SetTransformation ******************/
		%feature("compactdefaultargs") SetTransformation;
		%feature("autodoc", "Sets transformation by directly specified rotation and translation.

Parameters
----------
R: gp_Quaternion
T: gp_Vec

Returns
-------
None
") SetTransformation;
		void SetTransformation(const gp_Quaternion & R, const gp_Vec & T);

		/****************** SetTranslation ******************/
		%feature("compactdefaultargs") SetTranslation;
		%feature("autodoc", "Changes the transformation into a translation. v is the vector of the translation.

Parameters
----------
V: gp_Vec

Returns
-------
None
") SetTranslation;
		void SetTranslation(const gp_Vec & V);

		/****************** SetTranslation ******************/
		%feature("compactdefaultargs") SetTranslation;
		%feature("autodoc", "Makes the transformation into a translation where the translation vector is the vector (p1, p2) defined from point p1 to point p2.

Parameters
----------
P1: gp_Pnt
P2: gp_Pnt

Returns
-------
None
") SetTranslation;
		void SetTranslation(const gp_Pnt & P1, const gp_Pnt & P2);

		/****************** SetTranslationPart ******************/
		%feature("compactdefaultargs") SetTranslationPart;
		%feature("autodoc", "Replaces the translation vector with the vector v.

Parameters
----------
V: gp_Vec

Returns
-------
None
") SetTranslationPart;
		void SetTranslationPart(const gp_Vec & V);

		/****************** SetValues ******************/
		%feature("compactdefaultargs") SetValues;
		%feature("autodoc", "Sets the coefficients of the transformation. the transformation of the point x,y,z is the point x',y',z' with : //! x' = a11 x + a12 y + a13 z + a14 y' = a21 x + a22 y + a23 z + a24 z' = a31 x + a32 y + a33 z + a34 //! the method value(i,j) will return aij. raises constructionerror if the determinant of the aij is null. the matrix is orthogonalized before future using.

Parameters
----------
a11: float
a12: float
a13: float
a14: float
a21: float
a22: float
a23: float
a24: float
a31: float
a32: float
a33: float
a34: float

Returns
-------
None
") SetValues;
		void SetValues(const Standard_Real a11, const Standard_Real a12, const Standard_Real a13, const Standard_Real a14, const Standard_Real a21, const Standard_Real a22, const Standard_Real a23, const Standard_Real a24, const Standard_Real a31, const Standard_Real a32, const Standard_Real a33, const Standard_Real a34);

		/****************** Transforms ******************/
		%feature("compactdefaultargs") Transforms;
		%feature("autodoc", "No available documentation.

Parameters
----------

Returns
-------
X: float
Y: float
Z: float
") Transforms;
		void Transforms(Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** Transforms ******************/
		%feature("compactdefaultargs") Transforms;
		%feature("autodoc", "Transformation of a triplet xyz with a trsf.

Parameters
----------
Coord: gp_XYZ

Returns
-------
None
") Transforms;
		void Transforms(gp_XYZ & Coord);

		/****************** TranslationPart ******************/
		%feature("compactdefaultargs") TranslationPart;
		%feature("autodoc", "Returns the translation part of the transformation's matrix.

Returns
-------
gp_XYZ
") TranslationPart;
		const gp_XYZ TranslationPart();

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Returns the coefficients of the transformation's matrix. it is a 3 rows * 4 columns matrix. this coefficient includes the scale factor. raises outofranged if row < 1 or row > 3 or col < 1 or col > 4.

Parameters
----------
Row: int
Col: int

Returns
-------
float
") Value;
		Standard_Real Value(const Standard_Integer Row, const Standard_Integer Col);

		/****************** VectorialPart ******************/
		%feature("compactdefaultargs") VectorialPart;
		%feature("autodoc", "Returns the vectorial part of the transformation. it is a 3*3 matrix which includes the scale factor.

Returns
-------
gp_Mat
") VectorialPart;
		gp_Mat VectorialPart();

		/****************** operator * ******************/
		%feature("compactdefaultargs") operator *;
		%feature("autodoc", "No available documentation.

Parameters
----------
T: gp_Trsf

Returns
-------
gp_Trsf
") operator *;
		gp_Trsf operator *(const gp_Trsf & T);


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
	__repr__ = _dumps_object

	@methodnotwrapped
	def GetMat4(self):
		pass
	}
};

/******************
* class gp_Trsf2d *
******************/
class gp_Trsf2d {
	public:
		/****************** gp_Trsf2d ******************/
		%feature("compactdefaultargs") gp_Trsf2d;
		%feature("autodoc", "Returns identity transformation.

Returns
-------
None
") gp_Trsf2d;
		 gp_Trsf2d();

		/****************** gp_Trsf2d ******************/
		%feature("compactdefaultargs") gp_Trsf2d;
		%feature("autodoc", "Creates a 2d transformation in the xy plane from a 3d transformation .

Parameters
----------
T: gp_Trsf

Returns
-------
None
") gp_Trsf2d;
		 gp_Trsf2d(const gp_Trsf & T);

		/****************** Form ******************/
		%feature("compactdefaultargs") Form;
		%feature("autodoc", "Returns the nature of the transformation. it can be an identity transformation, a rotation, a translation, a mirror (relative to a point or an axis), a scaling transformation, or a compound transformation.

Returns
-------
gp_TrsfForm
") Form;
		gp_TrsfForm Form();

		/****************** HVectorialPart ******************/
		%feature("compactdefaultargs") HVectorialPart;
		%feature("autodoc", "Returns the homogeneous vectorial part of the transformation. it is a 2*2 matrix which doesn't include the scale factor. the coefficients of this matrix must be multiplied by the scale factor to obtain the coefficients of the transformation.

Returns
-------
gp_Mat2d
") HVectorialPart;
		const gp_Mat2d HVectorialPart();

		/****************** Invert ******************/
		%feature("compactdefaultargs") Invert;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Invert;
		void Invert();

		/****************** Inverted ******************/
		%feature("compactdefaultargs") Inverted;
		%feature("autodoc", "Computes the reverse transformation. raises an exception if the matrix of the transformation is not inversible, it means that the scale factor is lower or equal to resolution from package gp.

Returns
-------
gp_Trsf2d
") Inverted;
		gp_Trsf2d Inverted();

		/****************** IsNegative ******************/
		%feature("compactdefaultargs") IsNegative;
		%feature("autodoc", "Returns true if the determinant of the vectorial part of this transformation is negative..

Returns
-------
bool
") IsNegative;
		Standard_Boolean IsNegative();

		/****************** Multiplied ******************/
		%feature("compactdefaultargs") Multiplied;
		%feature("autodoc", "No available documentation.

Parameters
----------
T: gp_Trsf2d

Returns
-------
gp_Trsf2d
") Multiplied;
		gp_Trsf2d Multiplied(const gp_Trsf2d & T);

		/****************** Multiply ******************/
		%feature("compactdefaultargs") Multiply;
		%feature("autodoc", "Computes the transformation composed from <self> and t. <self> = <self> * t.

Parameters
----------
T: gp_Trsf2d

Returns
-------
None
") Multiply;
		void Multiply(const gp_Trsf2d & T);

		/****************** Power ******************/
		%feature("compactdefaultargs") Power;
		%feature("autodoc", "No available documentation.

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
		%feature("autodoc", "Computes the following composition of transformations <self> * <self> * .......* <self>, n time. if n = 0 <self> = identity if n < 0 <self> = <self>.inverse() *...........* <self>.inverse(). //! raises if n < 0 and if the matrix of the transformation not inversible.

Parameters
----------
N: int

Returns
-------
gp_Trsf2d
") Powered;
		gp_Trsf2d Powered(const Standard_Integer N);

		/****************** PreMultiply ******************/
		%feature("compactdefaultargs") PreMultiply;
		%feature("autodoc", "Computes the transformation composed from <self> and t. <self> = t * <self>.

Parameters
----------
T: gp_Trsf2d

Returns
-------
None
") PreMultiply;
		void PreMultiply(const gp_Trsf2d & T);

		/****************** RotationPart ******************/
		%feature("compactdefaultargs") RotationPart;
		%feature("autodoc", "Returns the angle corresponding to the rotational component of the transformation matrix (operation opposite to setrotation()).

Returns
-------
float
") RotationPart;
		Standard_Real RotationPart();

		/****************** ScaleFactor ******************/
		%feature("compactdefaultargs") ScaleFactor;
		%feature("autodoc", "Returns the scale factor.

Returns
-------
float
") ScaleFactor;
		Standard_Real ScaleFactor();

		/****************** SetMirror ******************/
		%feature("compactdefaultargs") SetMirror;
		%feature("autodoc", "Changes the transformation into a symmetrical transformation. p is the center of the symmetry.

Parameters
----------
P: gp_Pnt2d

Returns
-------
None
") SetMirror;
		void SetMirror(const gp_Pnt2d & P);

		/****************** SetMirror ******************/
		%feature("compactdefaultargs") SetMirror;
		%feature("autodoc", "Changes the transformation into a symmetrical transformation. a is the center of the axial symmetry.

Parameters
----------
A: gp_Ax2d

Returns
-------
None
") SetMirror;
		void SetMirror(const gp_Ax2d & A);

		/****************** SetRotation ******************/
		%feature("compactdefaultargs") SetRotation;
		%feature("autodoc", "Changes the transformation into a rotation. p is the rotation's center and ang is the angular value of the rotation in radian.

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
		%feature("compactdefaultargs") SetScale;
		%feature("autodoc", "Changes the transformation into a scale. p is the center of the scale and s is the scaling value.

Parameters
----------
P: gp_Pnt2d
S: float

Returns
-------
None
") SetScale;
		void SetScale(const gp_Pnt2d & P, const Standard_Real S);

		/****************** SetScaleFactor ******************/
		%feature("compactdefaultargs") SetScaleFactor;
		%feature("autodoc", "Modifies the scale factor.

Parameters
----------
S: float

Returns
-------
None
") SetScaleFactor;
		void SetScaleFactor(const Standard_Real S);

		/****************** SetTransformation ******************/
		%feature("compactdefaultargs") SetTransformation;
		%feature("autodoc", "Changes a transformation allowing passage from the coordinate system 'fromsystem1' to the coordinate system 'tosystem2'.

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
		%feature("compactdefaultargs") SetTransformation;
		%feature("autodoc", "Changes the transformation allowing passage from the basic coordinate system {p(0.,0.,0.), vx (1.,0.,0.), vy (0.,1.,0.)} to the local coordinate system defined with the ax2d tosystem.

Parameters
----------
ToSystem: gp_Ax2d

Returns
-------
None
") SetTransformation;
		void SetTransformation(const gp_Ax2d & ToSystem);

		/****************** SetTranslation ******************/
		%feature("compactdefaultargs") SetTranslation;
		%feature("autodoc", "Changes the transformation into a translation. v is the vector of the translation.

Parameters
----------
V: gp_Vec2d

Returns
-------
None
") SetTranslation;
		void SetTranslation(const gp_Vec2d & V);

		/****************** SetTranslation ******************/
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

		/****************** SetTranslationPart ******************/
		%feature("compactdefaultargs") SetTranslationPart;
		%feature("autodoc", "Replaces the translation vector with v.

Parameters
----------
V: gp_Vec2d

Returns
-------
None
") SetTranslationPart;
		void SetTranslationPart(const gp_Vec2d & V);

		/****************** SetValues ******************/
		%feature("compactdefaultargs") SetValues;
		%feature("autodoc", "Sets the coefficients of the transformation. the transformation of the point x,y is the point x',y' with : //! x' = a11 x + a12 y + a13 y' = a21 x + a22 y + a23 //! the method value(i,j) will return aij. raises constructionerror if the determinant of the aij is null. if the matrix as not a uniform scale it will be orthogonalized before future using.

Parameters
----------
a11: float
a12: float
a13: float
a21: float
a22: float
a23: float

Returns
-------
None
") SetValues;
		void SetValues(const Standard_Real a11, const Standard_Real a12, const Standard_Real a13, const Standard_Real a21, const Standard_Real a22, const Standard_Real a23);

		/****************** Transforms ******************/
		%feature("compactdefaultargs") Transforms;
		%feature("autodoc", "No available documentation.

Parameters
----------

Returns
-------
X: float
Y: float
") Transforms;
		void Transforms(Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** Transforms ******************/
		%feature("compactdefaultargs") Transforms;
		%feature("autodoc", "Transforms a doublet xy with a trsf2d.

Parameters
----------
Coord: gp_XY

Returns
-------
None
") Transforms;
		void Transforms(gp_XY & Coord);

		/****************** TranslationPart ******************/
		%feature("compactdefaultargs") TranslationPart;
		%feature("autodoc", "Returns the translation part of the transformation's matrix.

Returns
-------
gp_XY
") TranslationPart;
		const gp_XY TranslationPart();

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Returns the coefficients of the transformation's matrix. it is a 2 rows * 3 columns matrix. raises outofrange if row < 1 or row > 2 or col < 1 or col > 3.

Parameters
----------
Row: int
Col: int

Returns
-------
float
") Value;
		Standard_Real Value(const Standard_Integer Row, const Standard_Integer Col);

		/****************** VectorialPart ******************/
		%feature("compactdefaultargs") VectorialPart;
		%feature("autodoc", "Returns the vectorial part of the transformation. it is a 2*2 matrix which includes the scale factor.

Returns
-------
gp_Mat2d
") VectorialPart;
		gp_Mat2d VectorialPart();

		/****************** operator * ******************/
		%feature("compactdefaultargs") operator *;
		%feature("autodoc", "No available documentation.

Parameters
----------
T: gp_Trsf2d

Returns
-------
gp_Trsf2d
") operator *;
		gp_Trsf2d operator *(const gp_Trsf2d & T);


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
	__repr__ = _dumps_object
	}
};

/***************
* class gp_Vec *
***************/
class gp_Vec {
	public:
		/****************** gp_Vec ******************/
		%feature("compactdefaultargs") gp_Vec;
		%feature("autodoc", "Creates a zero vector.

Returns
-------
None
") gp_Vec;
		 gp_Vec();

		/****************** gp_Vec ******************/
		%feature("compactdefaultargs") gp_Vec;
		%feature("autodoc", "Creates a unitary vector from a direction v.

Parameters
----------
V: gp_Dir

Returns
-------
None
") gp_Vec;
		 gp_Vec(const gp_Dir & V);

		/****************** gp_Vec ******************/
		%feature("compactdefaultargs") gp_Vec;
		%feature("autodoc", "Creates a vector with a triplet of coordinates.

Parameters
----------
Coord: gp_XYZ

Returns
-------
None
") gp_Vec;
		 gp_Vec(const gp_XYZ & Coord);

		/****************** gp_Vec ******************/
		%feature("compactdefaultargs") gp_Vec;
		%feature("autodoc", "Creates a point with its three cartesian coordinates.

Parameters
----------
Xv: float
Yv: float
Zv: float

Returns
-------
None
") gp_Vec;
		 gp_Vec(const Standard_Real Xv, const Standard_Real Yv, const Standard_Real Zv);

		/****************** gp_Vec ******************/
		%feature("compactdefaultargs") gp_Vec;
		%feature("autodoc", "Creates a vector from two points. the length of the vector is the distance between p1 and p2.

Parameters
----------
P1: gp_Pnt
P2: gp_Pnt

Returns
-------
None
") gp_Vec;
		 gp_Vec(const gp_Pnt & P1, const gp_Pnt & P2);

		/****************** Add ******************/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "Adds two vectors.

Parameters
----------
Other: gp_Vec

Returns
-------
None
") Add;
		void Add(const gp_Vec & Other);

		/****************** Added ******************/
		%feature("compactdefaultargs") Added;
		%feature("autodoc", "Adds two vectors.

Parameters
----------
Other: gp_Vec

Returns
-------
gp_Vec
") Added;
		gp_Vec Added(const gp_Vec & Other);

		/****************** Angle ******************/
		%feature("compactdefaultargs") Angle;
		%feature("autodoc", "Computes the angular value between <self> and <other> returns the angle value between 0 and pi in radian. raises vectorwithnullmagnitude if <self>.magnitude() <= resolution from gp or other.magnitude() <= resolution because the angular value is indefinite if one of the vectors has a null magnitude.

Parameters
----------
Other: gp_Vec

Returns
-------
float
") Angle;
		Standard_Real Angle(const gp_Vec & Other);

		/****************** AngleWithRef ******************/
		%feature("compactdefaultargs") AngleWithRef;
		%feature("autodoc", "Computes the angle, in radians, between this vector and vector other. the result is a value between -pi and pi. for this, vref defines the positive sense of rotation: the angular value is positive, if the cross product this ^ other has the same orientation as vref relative to the plane defined by the vectors this and other. otherwise, the angular value is negative. exceptions gp_vectorwithnullmagnitude if the magnitude of this vector, the vector other, or the vector vref is less than or equal to gp::resolution(). standard_domainerror if this vector, the vector other, and the vector vref are coplanar, unless this vector and the vector other are parallel.

Parameters
----------
Other: gp_Vec
VRef: gp_Vec

Returns
-------
float
") AngleWithRef;
		Standard_Real AngleWithRef(const gp_Vec & Other, const gp_Vec & VRef);

		/****************** Coord ******************/
		%feature("compactdefaultargs") Coord;
		%feature("autodoc", "Returns the coordinate of range index : index = 1 => x is returned index = 2 => y is returned index = 3 => z is returned raised if index != {1, 2, 3}.

Parameters
----------
Index: int

Returns
-------
float
") Coord;
		Standard_Real Coord(const Standard_Integer Index);

		/****************** Coord ******************/
		%feature("compactdefaultargs") Coord;
		%feature("autodoc", "For this vector returns its three coordinates xv, yv, and zvinline.

Parameters
----------

Returns
-------
Xv: float
Yv: float
Zv: float
") Coord;
		void Coord(Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** Cross ******************/
		%feature("compactdefaultargs") Cross;
		%feature("autodoc", "Computes the cross product between two vectors.

Parameters
----------
Right: gp_Vec

Returns
-------
None
") Cross;
		void Cross(const gp_Vec & Right);

		/****************** CrossCross ******************/
		%feature("compactdefaultargs") CrossCross;
		%feature("autodoc", "Computes the triple vector product. <self> ^= (v1 ^ v2).

Parameters
----------
V1: gp_Vec
V2: gp_Vec

Returns
-------
None
") CrossCross;
		void CrossCross(const gp_Vec & V1, const gp_Vec & V2);

		/****************** CrossCrossed ******************/
		%feature("compactdefaultargs") CrossCrossed;
		%feature("autodoc", "Computes the triple vector product. <self> ^ (v1 ^ v2).

Parameters
----------
V1: gp_Vec
V2: gp_Vec

Returns
-------
gp_Vec
") CrossCrossed;
		gp_Vec CrossCrossed(const gp_Vec & V1, const gp_Vec & V2);

		/****************** CrossMagnitude ******************/
		%feature("compactdefaultargs") CrossMagnitude;
		%feature("autodoc", "Computes the magnitude of the cross product between <self> and right. returns || <self> ^ right ||.

Parameters
----------
Right: gp_Vec

Returns
-------
float
") CrossMagnitude;
		Standard_Real CrossMagnitude(const gp_Vec & Right);

		/****************** CrossSquareMagnitude ******************/
		%feature("compactdefaultargs") CrossSquareMagnitude;
		%feature("autodoc", "Computes the square magnitude of the cross product between <self> and right. returns || <self> ^ right ||**2.

Parameters
----------
Right: gp_Vec

Returns
-------
float
") CrossSquareMagnitude;
		Standard_Real CrossSquareMagnitude(const gp_Vec & Right);

		/****************** Crossed ******************/
		%feature("compactdefaultargs") Crossed;
		%feature("autodoc", "Computes the cross product between two vectors.

Parameters
----------
Right: gp_Vec

Returns
-------
gp_Vec
") Crossed;
		gp_Vec Crossed(const gp_Vec & Right);

		/****************** Divide ******************/
		%feature("compactdefaultargs") Divide;
		%feature("autodoc", "Divides a vector by a scalar.

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
		%feature("autodoc", "Divides a vector by a scalar.

Parameters
----------
Scalar: float

Returns
-------
gp_Vec
") Divided;
		gp_Vec Divided(const Standard_Real Scalar);

		/****************** Dot ******************/
		%feature("compactdefaultargs") Dot;
		%feature("autodoc", "Computes the scalar product.

Parameters
----------
Other: gp_Vec

Returns
-------
float
") Dot;
		Standard_Real Dot(const gp_Vec & Other);

		/****************** DotCross ******************/
		%feature("compactdefaultargs") DotCross;
		%feature("autodoc", "Computes the triple scalar product <self> * (v1 ^ v2).

Parameters
----------
V1: gp_Vec
V2: gp_Vec

Returns
-------
float
") DotCross;
		Standard_Real DotCross(const gp_Vec & V1, const gp_Vec & V2);

		/****************** IsEqual ******************/
		%feature("compactdefaultargs") IsEqual;
		%feature("autodoc", "Returns true if the two vectors have the same magnitude value and the same direction. the precision values are lineartolerance for the magnitude and angulartolerance for the direction.

Parameters
----------
Other: gp_Vec
LinearTolerance: float
AngularTolerance: float

Returns
-------
bool
") IsEqual;
		Standard_Boolean IsEqual(const gp_Vec & Other, const Standard_Real LinearTolerance, const Standard_Real AngularTolerance);

		/****************** IsNormal ******************/
		%feature("compactdefaultargs") IsNormal;
		%feature("autodoc", "Returns true if abs(<self>.angle(other) - pi/2.) <= angulartolerance raises vectorwithnullmagnitude if <self>.magnitude() <= resolution or other.magnitude() <= resolution from gp.

Parameters
----------
Other: gp_Vec
AngularTolerance: float

Returns
-------
bool
") IsNormal;
		Standard_Boolean IsNormal(const gp_Vec & Other, const Standard_Real AngularTolerance);

		/****************** IsOpposite ******************/
		%feature("compactdefaultargs") IsOpposite;
		%feature("autodoc", "Returns true if pi - <self>.angle(other) <= angulartolerance raises vectorwithnullmagnitude if <self>.magnitude() <= resolution or other.magnitude() <= resolution from gp.

Parameters
----------
Other: gp_Vec
AngularTolerance: float

Returns
-------
bool
") IsOpposite;
		Standard_Boolean IsOpposite(const gp_Vec & Other, const Standard_Real AngularTolerance);

		/****************** IsParallel ******************/
		%feature("compactdefaultargs") IsParallel;
		%feature("autodoc", "Returns true if angle(<self>, other) <= angulartolerance or pi - angle(<self>, other) <= angulartolerance this definition means that two parallel vectors cannot define a plane but two vectors with opposite directions are considered as parallel. raises vectorwithnullmagnitude if <self>.magnitude() <= resolution or other.magnitude() <= resolution from gp.

Parameters
----------
Other: gp_Vec
AngularTolerance: float

Returns
-------
bool
") IsParallel;
		Standard_Boolean IsParallel(const gp_Vec & Other, const Standard_Real AngularTolerance);

		/****************** Magnitude ******************/
		%feature("compactdefaultargs") Magnitude;
		%feature("autodoc", "Computes the magnitude of this vector.

Returns
-------
float
") Magnitude;
		Standard_Real Magnitude();

		/****************** Mirror ******************/
		%feature("compactdefaultargs") Mirror;
		%feature("autodoc", "No available documentation.

Parameters
----------
V: gp_Vec

Returns
-------
None
") Mirror;
		void Mirror(const gp_Vec & V);

		/****************** Mirror ******************/
		%feature("compactdefaultargs") Mirror;
		%feature("autodoc", "No available documentation.

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
		%feature("autodoc", "No available documentation.

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
		%feature("autodoc", "Performs the symmetrical transformation of a vector with respect to the vector v which is the center of the symmetry.

Parameters
----------
V: gp_Vec

Returns
-------
gp_Vec
") Mirrored;
		gp_Vec Mirrored(const gp_Vec & V);

		/****************** Mirrored ******************/
		%feature("compactdefaultargs") Mirrored;
		%feature("autodoc", "Performs the symmetrical transformation of a vector with respect to an axis placement which is the axis of the symmetry.

Parameters
----------
A1: gp_Ax1

Returns
-------
gp_Vec
") Mirrored;
		gp_Vec Mirrored(const gp_Ax1 & A1);

		/****************** Mirrored ******************/
		%feature("compactdefaultargs") Mirrored;
		%feature("autodoc", "Performs the symmetrical transformation of a vector with respect to a plane. the axis placement a2 locates the plane of the symmetry : (location, xdirection, ydirection).

Parameters
----------
A2: gp_Ax2

Returns
-------
gp_Vec
") Mirrored;
		gp_Vec Mirrored(const gp_Ax2 & A2);

		/****************** Multiplied ******************/
		%feature("compactdefaultargs") Multiplied;
		%feature("autodoc", "Multiplies a vector by a scalar.

Parameters
----------
Scalar: float

Returns
-------
gp_Vec
") Multiplied;
		gp_Vec Multiplied(const Standard_Real Scalar);

		/****************** Multiply ******************/
		%feature("compactdefaultargs") Multiply;
		%feature("autodoc", "Multiplies a vector by a scalar.

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
		%feature("autodoc", "Normalizes a vector raises an exception if the magnitude of the vector is lower or equal to resolution from gp.

Returns
-------
None
") Normalize;
		void Normalize();

		/****************** Normalized ******************/
		%feature("compactdefaultargs") Normalized;
		%feature("autodoc", "Normalizes a vector raises an exception if the magnitude of the vector is lower or equal to resolution from gp.

Returns
-------
gp_Vec
") Normalized;
		gp_Vec Normalized();

		/****************** Reverse ******************/
		%feature("compactdefaultargs") Reverse;
		%feature("autodoc", "Reverses the direction of a vector.

Returns
-------
None
") Reverse;
		void Reverse();

		/****************** Reversed ******************/
		%feature("compactdefaultargs") Reversed;
		%feature("autodoc", "Reverses the direction of a vector.

Returns
-------
gp_Vec
") Reversed;
		gp_Vec Reversed();

		/****************** Rotate ******************/
		%feature("compactdefaultargs") Rotate;
		%feature("autodoc", "No available documentation.

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
		%feature("autodoc", "Rotates a vector. a1 is the axis of the rotation. ang is the angular value of the rotation in radians.

Parameters
----------
A1: gp_Ax1
Ang: float

Returns
-------
gp_Vec
") Rotated;
		gp_Vec Rotated(const gp_Ax1 & A1, const Standard_Real Ang);

		/****************** Scale ******************/
		%feature("compactdefaultargs") Scale;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: float

Returns
-------
None
") Scale;
		void Scale(const Standard_Real S);

		/****************** Scaled ******************/
		%feature("compactdefaultargs") Scaled;
		%feature("autodoc", "Scales a vector. s is the scaling value.

Parameters
----------
S: float

Returns
-------
gp_Vec
") Scaled;
		gp_Vec Scaled(const Standard_Real S);

		/****************** SetCoord ******************/
		%feature("compactdefaultargs") SetCoord;
		%feature("autodoc", "Changes the coordinate of range index index = 1 => x is modified index = 2 => y is modified index = 3 => z is modified raised if index != {1, 2, 3}.

Parameters
----------
Index: int
Xi: float

Returns
-------
None
") SetCoord;
		void SetCoord(const Standard_Integer Index, const Standard_Real Xi);

		/****************** SetCoord ******************/
		%feature("compactdefaultargs") SetCoord;
		%feature("autodoc", "For this vector, assigns - the values xv, yv and zv to its three coordinates.

Parameters
----------
Xv: float
Yv: float
Zv: float

Returns
-------
None
") SetCoord;
		void SetCoord(const Standard_Real Xv, const Standard_Real Yv, const Standard_Real Zv);

		/****************** SetLinearForm ******************/
		%feature("compactdefaultargs") SetLinearForm;
		%feature("autodoc", "<self> is set to the following linear form : a1 * v1 + a2 * v2 + a3 * v3 + v4.

Parameters
----------
A1: float
V1: gp_Vec
A2: float
V2: gp_Vec
A3: float
V3: gp_Vec
V4: gp_Vec

Returns
-------
None
") SetLinearForm;
		void SetLinearForm(const Standard_Real A1, const gp_Vec & V1, const Standard_Real A2, const gp_Vec & V2, const Standard_Real A3, const gp_Vec & V3, const gp_Vec & V4);

		/****************** SetLinearForm ******************/
		%feature("compactdefaultargs") SetLinearForm;
		%feature("autodoc", "<self> is set to the following linear form : a1 * v1 + a2 * v2 + a3 * v3.

Parameters
----------
A1: float
V1: gp_Vec
A2: float
V2: gp_Vec
A3: float
V3: gp_Vec

Returns
-------
None
") SetLinearForm;
		void SetLinearForm(const Standard_Real A1, const gp_Vec & V1, const Standard_Real A2, const gp_Vec & V2, const Standard_Real A3, const gp_Vec & V3);

		/****************** SetLinearForm ******************/
		%feature("compactdefaultargs") SetLinearForm;
		%feature("autodoc", "<self> is set to the following linear form : a1 * v1 + a2 * v2 + v3.

Parameters
----------
A1: float
V1: gp_Vec
A2: float
V2: gp_Vec
V3: gp_Vec

Returns
-------
None
") SetLinearForm;
		void SetLinearForm(const Standard_Real A1, const gp_Vec & V1, const Standard_Real A2, const gp_Vec & V2, const gp_Vec & V3);

		/****************** SetLinearForm ******************/
		%feature("compactdefaultargs") SetLinearForm;
		%feature("autodoc", "<self> is set to the following linear form : a1 * v1 + a2 * v2.

Parameters
----------
A1: float
V1: gp_Vec
A2: float
V2: gp_Vec

Returns
-------
None
") SetLinearForm;
		void SetLinearForm(const Standard_Real A1, const gp_Vec & V1, const Standard_Real A2, const gp_Vec & V2);

		/****************** SetLinearForm ******************/
		%feature("compactdefaultargs") SetLinearForm;
		%feature("autodoc", "<self> is set to the following linear form : a1 * v1 + v2.

Parameters
----------
A1: float
V1: gp_Vec
V2: gp_Vec

Returns
-------
None
") SetLinearForm;
		void SetLinearForm(const Standard_Real A1, const gp_Vec & V1, const gp_Vec & V2);

		/****************** SetLinearForm ******************/
		%feature("compactdefaultargs") SetLinearForm;
		%feature("autodoc", "<self> is set to the following linear form : v1 + v2.

Parameters
----------
V1: gp_Vec
V2: gp_Vec

Returns
-------
None
") SetLinearForm;
		void SetLinearForm(const gp_Vec & V1, const gp_Vec & V2);

		/****************** SetX ******************/
		%feature("compactdefaultargs") SetX;
		%feature("autodoc", "Assigns the given value to the x coordinate of this vector.

Parameters
----------
X: float

Returns
-------
None
") SetX;
		void SetX(const Standard_Real X);

		/****************** SetXYZ ******************/
		%feature("compactdefaultargs") SetXYZ;
		%feature("autodoc", "Assigns the three coordinates of coord to this vector.

Parameters
----------
Coord: gp_XYZ

Returns
-------
None
") SetXYZ;
		void SetXYZ(const gp_XYZ & Coord);

		/****************** SetY ******************/
		%feature("compactdefaultargs") SetY;
		%feature("autodoc", "Assigns the given value to the x coordinate of this vector.

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
		%feature("autodoc", "Assigns the given value to the x coordinate of this vector.

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
		%feature("autodoc", "Computes the square magnitude of this vector.

Returns
-------
float
") SquareMagnitude;
		Standard_Real SquareMagnitude();

		/****************** Subtract ******************/
		%feature("compactdefaultargs") Subtract;
		%feature("autodoc", "Subtracts two vectors.

Parameters
----------
Right: gp_Vec

Returns
-------
None
") Subtract;
		void Subtract(const gp_Vec & Right);

		/****************** Subtracted ******************/
		%feature("compactdefaultargs") Subtracted;
		%feature("autodoc", "Subtracts two vectors.

Parameters
----------
Right: gp_Vec

Returns
-------
gp_Vec
") Subtracted;
		gp_Vec Subtracted(const gp_Vec & Right);

		/****************** Transform ******************/
		%feature("compactdefaultargs") Transform;
		%feature("autodoc", "Transforms a vector with the transformation t.

Parameters
----------
T: gp_Trsf

Returns
-------
None
") Transform;
		void Transform(const gp_Trsf & T);

		/****************** Transformed ******************/
		%feature("compactdefaultargs") Transformed;
		%feature("autodoc", "Transforms a vector with the transformation t.

Parameters
----------
T: gp_Trsf

Returns
-------
gp_Vec
") Transformed;
		gp_Vec Transformed(const gp_Trsf & T);

		/****************** X ******************/
		%feature("compactdefaultargs") X;
		%feature("autodoc", "For this vector, returns its x coordinate.

Returns
-------
float
") X;
		Standard_Real X();

		/****************** XYZ ******************/
		%feature("compactdefaultargs") XYZ;
		%feature("autodoc", "For this vector, returns - its three coordinates as a number triple.

Returns
-------
gp_XYZ
") XYZ;
		const gp_XYZ XYZ();

		/****************** Y ******************/
		%feature("compactdefaultargs") Y;
		%feature("autodoc", "For this vector, returns its y coordinate.

Returns
-------
float
") Y;
		Standard_Real Y();

		/****************** Z ******************/
		%feature("compactdefaultargs") Z;
		%feature("autodoc", "For this vector, returns its z coordinate.

Returns
-------
float
") Z;
		Standard_Real Z();

		/****************** operator * ******************/
		%feature("compactdefaultargs") operator *;
		%feature("autodoc", "No available documentation.

Parameters
----------
Scalar: float

Returns
-------
gp_Vec
") operator *;
		gp_Vec operator *(const Standard_Real Scalar);

		/****************** operator * ******************/
		%feature("compactdefaultargs") operator *;
		%feature("autodoc", "No available documentation.

Parameters
----------
Other: gp_Vec

Returns
-------
float
") operator *;
		Standard_Real operator *(const gp_Vec & Other);


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
		%feature("compactdefaultargs") operator +;
		%feature("autodoc", "No available documentation.

Parameters
----------
Other: gp_Vec

Returns
-------
gp_Vec
") operator +;
		gp_Vec operator +(const gp_Vec & Other);


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
		/****************** operator - ******************/
		%feature("compactdefaultargs") operator -;
		%feature("autodoc", "No available documentation.

Parameters
----------
Right: gp_Vec

Returns
-------
gp_Vec
") operator -;
		gp_Vec operator -(const gp_Vec & Right);

		/****************** operator - ******************/
		%feature("compactdefaultargs") operator -;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Vec
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
		/****************** operator / ******************/
		%feature("compactdefaultargs") operator /;
		%feature("autodoc", "No available documentation.

Parameters
----------
Scalar: float

Returns
-------
gp_Vec
") operator /;
		gp_Vec operator /(const Standard_Real Scalar);


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
		/****************** gp_Vec2d ******************/
		%feature("compactdefaultargs") gp_Vec2d;
		%feature("autodoc", "Creates a zero vector.

Returns
-------
None
") gp_Vec2d;
		 gp_Vec2d();

		/****************** gp_Vec2d ******************/
		%feature("compactdefaultargs") gp_Vec2d;
		%feature("autodoc", "Creates a unitary vector from a direction v.

Parameters
----------
V: gp_Dir2d

Returns
-------
None
") gp_Vec2d;
		 gp_Vec2d(const gp_Dir2d & V);

		/****************** gp_Vec2d ******************/
		%feature("compactdefaultargs") gp_Vec2d;
		%feature("autodoc", "Creates a vector with a doublet of coordinates.

Parameters
----------
Coord: gp_XY

Returns
-------
None
") gp_Vec2d;
		 gp_Vec2d(const gp_XY & Coord);

		/****************** gp_Vec2d ******************/
		%feature("compactdefaultargs") gp_Vec2d;
		%feature("autodoc", "Creates a point with its two cartesian coordinates.

Parameters
----------
Xv: float
Yv: float

Returns
-------
None
") gp_Vec2d;
		 gp_Vec2d(const Standard_Real Xv, const Standard_Real Yv);

		/****************** gp_Vec2d ******************/
		%feature("compactdefaultargs") gp_Vec2d;
		%feature("autodoc", "Creates a vector from two points. the length of the vector is the distance between p1 and p2.

Parameters
----------
P1: gp_Pnt2d
P2: gp_Pnt2d

Returns
-------
None
") gp_Vec2d;
		 gp_Vec2d(const gp_Pnt2d & P1, const gp_Pnt2d & P2);

		/****************** Add ******************/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "No available documentation.

Parameters
----------
Other: gp_Vec2d

Returns
-------
None
") Add;
		void Add(const gp_Vec2d & Other);

		/****************** Added ******************/
		%feature("compactdefaultargs") Added;
		%feature("autodoc", "Adds two vectors.

Parameters
----------
Other: gp_Vec2d

Returns
-------
gp_Vec2d
") Added;
		gp_Vec2d Added(const gp_Vec2d & Other);

		/****************** Angle ******************/
		%feature("compactdefaultargs") Angle;
		%feature("autodoc", "Computes the angular value between <self> and <other> returns the angle value between -pi and pi in radian. the orientation is from <self> to other. the positive sense is the trigonometric sense. raises vectorwithnullmagnitude if <self>.magnitude() <= resolution from gp or other.magnitude() <= resolution because the angular value is indefinite if one of the vectors has a null magnitude.

Parameters
----------
Other: gp_Vec2d

Returns
-------
float
") Angle;
		Standard_Real Angle(const gp_Vec2d & Other);

		/****************** Coord ******************/
		%feature("compactdefaultargs") Coord;
		%feature("autodoc", "Returns the coordinate of range index : index = 1 => x is returned index = 2 => y is returned raised if index != {1, 2}.

Parameters
----------
Index: int

Returns
-------
float
") Coord;
		Standard_Real Coord(const Standard_Integer Index);

		/****************** Coord ******************/
		%feature("compactdefaultargs") Coord;
		%feature("autodoc", "For this vector, returns its two coordinates xv and yv.

Parameters
----------

Returns
-------
Xv: float
Yv: float
") Coord;
		void Coord(Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** CrossMagnitude ******************/
		%feature("compactdefaultargs") CrossMagnitude;
		%feature("autodoc", "Computes the magnitude of the cross product between <self> and right. returns || <self> ^ right ||.

Parameters
----------
Right: gp_Vec2d

Returns
-------
float
") CrossMagnitude;
		Standard_Real CrossMagnitude(const gp_Vec2d & Right);

		/****************** CrossSquareMagnitude ******************/
		%feature("compactdefaultargs") CrossSquareMagnitude;
		%feature("autodoc", "Computes the square magnitude of the cross product between <self> and right. returns || <self> ^ right ||**2.

Parameters
----------
Right: gp_Vec2d

Returns
-------
float
") CrossSquareMagnitude;
		Standard_Real CrossSquareMagnitude(const gp_Vec2d & Right);

		/****************** Crossed ******************/
		%feature("compactdefaultargs") Crossed;
		%feature("autodoc", "Computes the crossing product between two vectors.

Parameters
----------
Right: gp_Vec2d

Returns
-------
float
") Crossed;
		Standard_Real Crossed(const gp_Vec2d & Right);

		/****************** Divide ******************/
		%feature("compactdefaultargs") Divide;
		%feature("autodoc", "No available documentation.

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
		%feature("autodoc", "Divides a vector by a scalar.

Parameters
----------
Scalar: float

Returns
-------
gp_Vec2d
") Divided;
		gp_Vec2d Divided(const Standard_Real Scalar);

		/****************** Dot ******************/
		%feature("compactdefaultargs") Dot;
		%feature("autodoc", "Computes the scalar product.

Parameters
----------
Other: gp_Vec2d

Returns
-------
float
") Dot;
		Standard_Real Dot(const gp_Vec2d & Other);

		/****************** GetNormal ******************/
		%feature("compactdefaultargs") GetNormal;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Vec2d
") GetNormal;
		gp_Vec2d GetNormal();

		/****************** IsEqual ******************/
		%feature("compactdefaultargs") IsEqual;
		%feature("autodoc", "Returns true if the two vectors have the same magnitude value and the same direction. the precision values are lineartolerance for the magnitude and angulartolerance for the direction.

Parameters
----------
Other: gp_Vec2d
LinearTolerance: float
AngularTolerance: float

Returns
-------
bool
") IsEqual;
		Standard_Boolean IsEqual(const gp_Vec2d & Other, const Standard_Real LinearTolerance, const Standard_Real AngularTolerance);

		/****************** IsNormal ******************/
		%feature("compactdefaultargs") IsNormal;
		%feature("autodoc", "Returns true if abs(abs(<self>.angle(other)) - pi/2.) <= angulartolerance raises vectorwithnullmagnitude if <self>.magnitude() <= resolution or other.magnitude() <= resolution from gp.

Parameters
----------
Other: gp_Vec2d
AngularTolerance: float

Returns
-------
bool
") IsNormal;
		Standard_Boolean IsNormal(const gp_Vec2d & Other, const Standard_Real AngularTolerance);

		/****************** IsOpposite ******************/
		%feature("compactdefaultargs") IsOpposite;
		%feature("autodoc", "Returns true if pi - abs(<self>.angle(other)) <= angulartolerance raises vectorwithnullmagnitude if <self>.magnitude() <= resolution or other.magnitude() <= resolution from gp.

Parameters
----------
Other: gp_Vec2d
AngularTolerance: float

Returns
-------
bool
") IsOpposite;
		Standard_Boolean IsOpposite(const gp_Vec2d & Other, const Standard_Real AngularTolerance);

		/****************** IsParallel ******************/
		%feature("compactdefaultargs") IsParallel;
		%feature("autodoc", "Returns true if abs(angle(<self>, other)) <= angulartolerance or pi - abs(angle(<self>, other)) <= angulartolerance two vectors with opposite directions are considered as parallel. raises vectorwithnullmagnitude if <self>.magnitude() <= resolution or other.magnitude() <= resolution from gp.

Parameters
----------
Other: gp_Vec2d
AngularTolerance: float

Returns
-------
bool
") IsParallel;
		Standard_Boolean IsParallel(const gp_Vec2d & Other, const Standard_Real AngularTolerance);

		/****************** Magnitude ******************/
		%feature("compactdefaultargs") Magnitude;
		%feature("autodoc", "Computes the magnitude of this vector.

Returns
-------
float
") Magnitude;
		Standard_Real Magnitude();

		/****************** Mirror ******************/
		%feature("compactdefaultargs") Mirror;
		%feature("autodoc", "Performs the symmetrical transformation of a vector with respect to the vector v which is the center of the symmetry.

Parameters
----------
V: gp_Vec2d

Returns
-------
None
") Mirror;
		void Mirror(const gp_Vec2d & V);

		/****************** Mirror ******************/
		%feature("compactdefaultargs") Mirror;
		%feature("autodoc", "Performs the symmetrical transformation of a vector with respect to an axis placement which is the axis of the symmetry.

Parameters
----------
A1: gp_Ax2d

Returns
-------
None
") Mirror;
		void Mirror(const gp_Ax2d & A1);

		/****************** Mirrored ******************/
		%feature("compactdefaultargs") Mirrored;
		%feature("autodoc", "Performs the symmetrical transformation of a vector with respect to the vector v which is the center of the symmetry.

Parameters
----------
V: gp_Vec2d

Returns
-------
gp_Vec2d
") Mirrored;
		gp_Vec2d Mirrored(const gp_Vec2d & V);

		/****************** Mirrored ******************/
		%feature("compactdefaultargs") Mirrored;
		%feature("autodoc", "Performs the symmetrical transformation of a vector with respect to an axis placement which is the axis of the symmetry.

Parameters
----------
A1: gp_Ax2d

Returns
-------
gp_Vec2d
") Mirrored;
		gp_Vec2d Mirrored(const gp_Ax2d & A1);

		/****************** Multiplied ******************/
		%feature("compactdefaultargs") Multiplied;
		%feature("autodoc", "Normalizes a vector raises an exception if the magnitude of the vector is lower or equal to resolution from package gp.

Parameters
----------
Scalar: float

Returns
-------
gp_Vec2d
") Multiplied;
		gp_Vec2d Multiplied(const Standard_Real Scalar);

		/****************** Multiply ******************/
		%feature("compactdefaultargs") Multiply;
		%feature("autodoc", "No available documentation.

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
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Normalize;
		void Normalize();

		/****************** Normalized ******************/
		%feature("compactdefaultargs") Normalized;
		%feature("autodoc", "Normalizes a vector raises an exception if the magnitude of the vector is lower or equal to resolution from package gp. reverses the direction of a vector.

Returns
-------
gp_Vec2d
") Normalized;
		gp_Vec2d Normalized();

		/****************** Reverse ******************/
		%feature("compactdefaultargs") Reverse;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Reverse;
		void Reverse();

		/****************** Reversed ******************/
		%feature("compactdefaultargs") Reversed;
		%feature("autodoc", "Reverses the direction of a vector.

Returns
-------
gp_Vec2d
") Reversed;
		gp_Vec2d Reversed();

		/****************** Rotate ******************/
		%feature("compactdefaultargs") Rotate;
		%feature("autodoc", "No available documentation.

Parameters
----------
Ang: float

Returns
-------
None
") Rotate;
		void Rotate(const Standard_Real Ang);

		/****************** Rotated ******************/
		%feature("compactdefaultargs") Rotated;
		%feature("autodoc", "Rotates a vector. ang is the angular value of the rotation in radians.

Parameters
----------
Ang: float

Returns
-------
gp_Vec2d
") Rotated;
		gp_Vec2d Rotated(const Standard_Real Ang);

		/****************** Scale ******************/
		%feature("compactdefaultargs") Scale;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: float

Returns
-------
None
") Scale;
		void Scale(const Standard_Real S);

		/****************** Scaled ******************/
		%feature("compactdefaultargs") Scaled;
		%feature("autodoc", "Scales a vector. s is the scaling value.

Parameters
----------
S: float

Returns
-------
gp_Vec2d
") Scaled;
		gp_Vec2d Scaled(const Standard_Real S);

		/****************** SetCoord ******************/
		%feature("compactdefaultargs") SetCoord;
		%feature("autodoc", "Changes the coordinate of range index index = 1 => x is modified index = 2 => y is modified raises outofrange if index != {1, 2}.

Parameters
----------
Index: int
Xi: float

Returns
-------
None
") SetCoord;
		void SetCoord(const Standard_Integer Index, const Standard_Real Xi);

		/****************** SetCoord ******************/
		%feature("compactdefaultargs") SetCoord;
		%feature("autodoc", "For this vector, assigns the values xv and yv to its two coordinates.

Parameters
----------
Xv: float
Yv: float

Returns
-------
None
") SetCoord;
		void SetCoord(const Standard_Real Xv, const Standard_Real Yv);

		/****************** SetLinearForm ******************/
		%feature("compactdefaultargs") SetLinearForm;
		%feature("autodoc", "<self> is set to the following linear form : a1 * v1 + a2 * v2 + v3.

Parameters
----------
A1: float
V1: gp_Vec2d
A2: float
V2: gp_Vec2d
V3: gp_Vec2d

Returns
-------
None
") SetLinearForm;
		void SetLinearForm(const Standard_Real A1, const gp_Vec2d & V1, const Standard_Real A2, const gp_Vec2d & V2, const gp_Vec2d & V3);

		/****************** SetLinearForm ******************/
		%feature("compactdefaultargs") SetLinearForm;
		%feature("autodoc", "<self> is set to the following linear form : a1 * v1 + a2 * v2.

Parameters
----------
A1: float
V1: gp_Vec2d
A2: float
V2: gp_Vec2d

Returns
-------
None
") SetLinearForm;
		void SetLinearForm(const Standard_Real A1, const gp_Vec2d & V1, const Standard_Real A2, const gp_Vec2d & V2);

		/****************** SetLinearForm ******************/
		%feature("compactdefaultargs") SetLinearForm;
		%feature("autodoc", "<self> is set to the following linear form : a1 * v1 + v2.

Parameters
----------
A1: float
V1: gp_Vec2d
V2: gp_Vec2d

Returns
-------
None
") SetLinearForm;
		void SetLinearForm(const Standard_Real A1, const gp_Vec2d & V1, const gp_Vec2d & V2);

		/****************** SetLinearForm ******************/
		%feature("compactdefaultargs") SetLinearForm;
		%feature("autodoc", "<self> is set to the following linear form : left + right.

Parameters
----------
Left: gp_Vec2d
Right: gp_Vec2d

Returns
-------
None
") SetLinearForm;
		void SetLinearForm(const gp_Vec2d & Left, const gp_Vec2d & Right);

		/****************** SetX ******************/
		%feature("compactdefaultargs") SetX;
		%feature("autodoc", "Assigns the given value to the x coordinate of this vector.

Parameters
----------
X: float

Returns
-------
None
") SetX;
		void SetX(const Standard_Real X);

		/****************** SetXY ******************/
		%feature("compactdefaultargs") SetXY;
		%feature("autodoc", "Assigns the two coordinates of coord to this vector.

Parameters
----------
Coord: gp_XY

Returns
-------
None
") SetXY;
		void SetXY(const gp_XY & Coord);

		/****************** SetY ******************/
		%feature("compactdefaultargs") SetY;
		%feature("autodoc", "Assigns the given value to the y coordinate of this vector.

Parameters
----------
Y: float

Returns
-------
None
") SetY;
		void SetY(const Standard_Real Y);

		/****************** SquareMagnitude ******************/
		%feature("compactdefaultargs") SquareMagnitude;
		%feature("autodoc", "Computes the square magnitude of this vector.

Returns
-------
float
") SquareMagnitude;
		Standard_Real SquareMagnitude();

		/****************** Subtract ******************/
		%feature("compactdefaultargs") Subtract;
		%feature("autodoc", "Subtracts two vectors.

Parameters
----------
Right: gp_Vec2d

Returns
-------
None
") Subtract;
		void Subtract(const gp_Vec2d & Right);

		/****************** Subtracted ******************/
		%feature("compactdefaultargs") Subtracted;
		%feature("autodoc", "Subtracts two vectors.

Parameters
----------
Right: gp_Vec2d

Returns
-------
gp_Vec2d
") Subtracted;
		gp_Vec2d Subtracted(const gp_Vec2d & Right);

		/****************** Transform ******************/
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

		/****************** Transformed ******************/
		%feature("compactdefaultargs") Transformed;
		%feature("autodoc", "Transforms a vector with a trsf from gp.

Parameters
----------
T: gp_Trsf2d

Returns
-------
gp_Vec2d
") Transformed;
		gp_Vec2d Transformed(const gp_Trsf2d & T);

		/****************** X ******************/
		%feature("compactdefaultargs") X;
		%feature("autodoc", "For this vector, returns its x coordinate.

Returns
-------
float
") X;
		Standard_Real X();

		/****************** XY ******************/
		%feature("compactdefaultargs") XY;
		%feature("autodoc", "For this vector, returns its two coordinates as a number pair.

Returns
-------
gp_XY
") XY;
		const gp_XY XY();

		/****************** Y ******************/
		%feature("compactdefaultargs") Y;
		%feature("autodoc", "For this vector, returns its y coordinate.

Returns
-------
float
") Y;
		Standard_Real Y();

		/****************** operator * ******************/
		%feature("compactdefaultargs") operator *;
		%feature("autodoc", "No available documentation.

Parameters
----------
Other: gp_Vec2d

Returns
-------
float
") operator *;
		Standard_Real operator *(const gp_Vec2d & Other);

		/****************** operator * ******************/
		%feature("compactdefaultargs") operator *;
		%feature("autodoc", "No available documentation.

Parameters
----------
Scalar: float

Returns
-------
gp_Vec2d
") operator *;
		gp_Vec2d operator *(const Standard_Real Scalar);


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
		%feature("compactdefaultargs") operator +;
		%feature("autodoc", "No available documentation.

Parameters
----------
Other: gp_Vec2d

Returns
-------
gp_Vec2d
") operator +;
		gp_Vec2d operator +(const gp_Vec2d & Other);


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
		/****************** operator - ******************/
		%feature("compactdefaultargs") operator -;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Vec2d
") operator -;
		gp_Vec2d operator -();

		/****************** operator - ******************/
		%feature("compactdefaultargs") operator -;
		%feature("autodoc", "No available documentation.

Parameters
----------
Right: gp_Vec2d

Returns
-------
gp_Vec2d
") operator -;
		gp_Vec2d operator -(const gp_Vec2d & Right);


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
		/****************** operator / ******************/
		%feature("compactdefaultargs") operator /;
		%feature("autodoc", "No available documentation.

Parameters
----------
Scalar: float

Returns
-------
gp_Vec2d
") operator /;
		gp_Vec2d operator /(const Standard_Real Scalar);


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
		/****************** gp_XY ******************/
		%feature("compactdefaultargs") gp_XY;
		%feature("autodoc", "Creates xy object with zero coordinates (0,0).

Returns
-------
None
") gp_XY;
		 gp_XY();

		/****************** gp_XY ******************/
		%feature("compactdefaultargs") gp_XY;
		%feature("autodoc", "A number pair defined by the xy coordinates.

Parameters
----------
X: float
Y: float

Returns
-------
None
") gp_XY;
		 gp_XY(const Standard_Real X, const Standard_Real Y);

		/****************** Add ******************/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "Computes the sum of this number pair and number pair other <self>.x() = <self>.x() + other.x() <self>.y() = <self>.y() + other.y().

Parameters
----------
Other: gp_XY

Returns
-------
None
") Add;
		void Add(const gp_XY & Other);

		/****************** Added ******************/
		%feature("compactdefaultargs") Added;
		%feature("autodoc", "Computes the sum of this number pair and number pair other new.x() = <self>.x() + other.x() new.y() = <self>.y() + other.y().

Parameters
----------
Other: gp_XY

Returns
-------
gp_XY
") Added;
		gp_XY Added(const gp_XY & Other);


        %feature("autodoc","1");
        %extend {
            Standard_Real GetChangeCoord(const Standard_Integer theIndex) {
            return (Standard_Real) $self->ChangeCoord(theIndex);
            }
        };
        %feature("autodoc","1");
        %extend {
            void SetChangeCoord(const Standard_Integer theIndex,Standard_Real value) {
            $self->ChangeCoord(theIndex)=value;
            }
        };
		/****************** Coord ******************/
		%feature("compactdefaultargs") Coord;
		%feature("autodoc", "Returns the coordinate of range index : index = 1 => x is returned index = 2 => y is returned raises outofrange if index != {1, 2}.

Parameters
----------
Index: int

Returns
-------
float
") Coord;
		Standard_Real Coord(const Standard_Integer Index);

		/****************** Coord ******************/
		%feature("compactdefaultargs") Coord;
		%feature("autodoc", "For this number pair, returns its coordinates x and y.

Parameters
----------

Returns
-------
X: float
Y: float
") Coord;
		void Coord(Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** CrossMagnitude ******************/
		%feature("compactdefaultargs") CrossMagnitude;
		%feature("autodoc", "Computes the magnitude of the cross product between <self> and right. returns || <self> ^ right ||.

Parameters
----------
Right: gp_XY

Returns
-------
float
") CrossMagnitude;
		Standard_Real CrossMagnitude(const gp_XY & Right);

		/****************** CrossSquareMagnitude ******************/
		%feature("compactdefaultargs") CrossSquareMagnitude;
		%feature("autodoc", "Computes the square magnitude of the cross product between <self> and right. returns || <self> ^ right ||**2.

Parameters
----------
Right: gp_XY

Returns
-------
float
") CrossSquareMagnitude;
		Standard_Real CrossSquareMagnitude(const gp_XY & Right);

		/****************** Crossed ******************/
		%feature("compactdefaultargs") Crossed;
		%feature("autodoc", "Real d = <self>.x() * other.y() - <self>.y() * other.x().

Parameters
----------
Right: gp_XY

Returns
-------
float
") Crossed;
		Standard_Real Crossed(const gp_XY & Right);

		/****************** Divide ******************/
		%feature("compactdefaultargs") Divide;
		%feature("autodoc", "Divides <self> by a real.

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
		%feature("autodoc", "Divides <self> by a real.

Parameters
----------
Scalar: float

Returns
-------
gp_XY
") Divided;
		gp_XY Divided(const Standard_Real Scalar);

		/****************** Dot ******************/
		%feature("compactdefaultargs") Dot;
		%feature("autodoc", "Computes the scalar product between <self> and other.

Parameters
----------
Other: gp_XY

Returns
-------
float
") Dot;
		Standard_Real Dot(const gp_XY & Other);

		/****************** IsEqual ******************/
		%feature("compactdefaultargs") IsEqual;
		%feature("autodoc", "Returns true if the coordinates of this number pair are equal to the respective coordinates of the number pair other, within the specified tolerance tolerance. i.e.: abs(<self>.x() - other.x()) <= tolerance and abs(<self>.y() - other.y()) <= tolerance and computations.

Parameters
----------
Other: gp_XY
Tolerance: float

Returns
-------
bool
") IsEqual;
		Standard_Boolean IsEqual(const gp_XY & Other, const Standard_Real Tolerance);

		/****************** Modulus ******************/
		%feature("compactdefaultargs") Modulus;
		%feature("autodoc", "Computes sqrt (x*x + y*y) where x and y are the two coordinates of this number pair.

Returns
-------
float
") Modulus;
		Standard_Real Modulus();

		/****************** Multiplied ******************/
		%feature("compactdefaultargs") Multiplied;
		%feature("autodoc", "New.x() = <self>.x() * scalar; new.y() = <self>.y() * scalar;.

Parameters
----------
Scalar: float

Returns
-------
gp_XY
") Multiplied;
		gp_XY Multiplied(const Standard_Real Scalar);

		/****************** Multiplied ******************/
		%feature("compactdefaultargs") Multiplied;
		%feature("autodoc", "New.x() = <self>.x() * other.x(); new.y() = <self>.y() * other.y();.

Parameters
----------
Other: gp_XY

Returns
-------
gp_XY
") Multiplied;
		gp_XY Multiplied(const gp_XY & Other);

		/****************** Multiplied ******************/
		%feature("compactdefaultargs") Multiplied;
		%feature("autodoc", "New = matrix * <self>.

Parameters
----------
Matrix: gp_Mat2d

Returns
-------
gp_XY
") Multiplied;
		gp_XY Multiplied(const gp_Mat2d & Matrix);

		/****************** Multiply ******************/
		%feature("compactdefaultargs") Multiply;
		%feature("autodoc", "<self>.x() = <self>.x() * scalar; <self>.y() = <self>.y() * scalar;.

Parameters
----------
Scalar: float

Returns
-------
None
") Multiply;
		void Multiply(const Standard_Real Scalar);

		/****************** Multiply ******************/
		%feature("compactdefaultargs") Multiply;
		%feature("autodoc", "<self>.x() = <self>.x() * other.x(); <self>.y() = <self>.y() * other.y();.

Parameters
----------
Other: gp_XY

Returns
-------
None
") Multiply;
		void Multiply(const gp_XY & Other);

		/****************** Multiply ******************/
		%feature("compactdefaultargs") Multiply;
		%feature("autodoc", "<self> = matrix * <self>.

Parameters
----------
Matrix: gp_Mat2d

Returns
-------
None
") Multiply;
		void Multiply(const gp_Mat2d & Matrix);

		/****************** Normalize ******************/
		%feature("compactdefaultargs") Normalize;
		%feature("autodoc", "<self>.x() = <self>.x()/ <self>.modulus() <self>.y() = <self>.y()/ <self>.modulus() raises constructionerror if <self>.modulus() <= resolution from gp.

Returns
-------
None
") Normalize;
		void Normalize();

		/****************** Normalized ******************/
		%feature("compactdefaultargs") Normalized;
		%feature("autodoc", "New.x() = <self>.x()/ <self>.modulus() new.y() = <self>.y()/ <self>.modulus() raises constructionerror if <self>.modulus() <= resolution from gp.

Returns
-------
gp_XY
") Normalized;
		gp_XY Normalized();

		/****************** Reverse ******************/
		%feature("compactdefaultargs") Reverse;
		%feature("autodoc", "<self>.x() = -<self>.x() <self>.y() = -<self>.y().

Returns
-------
None
") Reverse;
		void Reverse();

		/****************** Reversed ******************/
		%feature("compactdefaultargs") Reversed;
		%feature("autodoc", "New.x() = -<self>.x() new.y() = -<self>.y().

Returns
-------
gp_XY
") Reversed;
		gp_XY Reversed();

		/****************** SetCoord ******************/
		%feature("compactdefaultargs") SetCoord;
		%feature("autodoc", "Modifies the coordinate of range index index = 1 => x is modified index = 2 => y is modified raises outofrange if index != {1, 2}.

Parameters
----------
Index: int
Xi: float

Returns
-------
None
") SetCoord;
		void SetCoord(const Standard_Integer Index, const Standard_Real Xi);

		/****************** SetCoord ******************/
		%feature("compactdefaultargs") SetCoord;
		%feature("autodoc", "For this number pair, assigns the values x and y to its coordinates.

Parameters
----------
X: float
Y: float

Returns
-------
None
") SetCoord;
		void SetCoord(const Standard_Real X, const Standard_Real Y);

		/****************** SetLinearForm ******************/
		%feature("compactdefaultargs") SetLinearForm;
		%feature("autodoc", "Computes the following linear combination and assigns the result to this number pair: a1 * xy1 + a2 * xy2.

Parameters
----------
A1: float
XY1: gp_XY
A2: float
XY2: gp_XY

Returns
-------
None
") SetLinearForm;
		void SetLinearForm(const Standard_Real A1, const gp_XY & XY1, const Standard_Real A2, const gp_XY & XY2);

		/****************** SetLinearForm ******************/
		%feature("compactdefaultargs") SetLinearForm;
		%feature("autodoc", "-- computes the following linear combination and assigns the result to this number pair: a1 * xy1 + a2 * xy2 + xy3.

Parameters
----------
A1: float
XY1: gp_XY
A2: float
XY2: gp_XY
XY3: gp_XY

Returns
-------
None
") SetLinearForm;
		void SetLinearForm(const Standard_Real A1, const gp_XY & XY1, const Standard_Real A2, const gp_XY & XY2, const gp_XY & XY3);

		/****************** SetLinearForm ******************/
		%feature("compactdefaultargs") SetLinearForm;
		%feature("autodoc", "Computes the following linear combination and assigns the result to this number pair: a1 * xy1 + xy2.

Parameters
----------
A1: float
XY1: gp_XY
XY2: gp_XY

Returns
-------
None
") SetLinearForm;
		void SetLinearForm(const Standard_Real A1, const gp_XY & XY1, const gp_XY & XY2);

		/****************** SetLinearForm ******************/
		%feature("compactdefaultargs") SetLinearForm;
		%feature("autodoc", "Computes the following linear combination and assigns the result to this number pair: xy1 + xy2.

Parameters
----------
XY1: gp_XY
XY2: gp_XY

Returns
-------
None
") SetLinearForm;
		void SetLinearForm(const gp_XY & XY1, const gp_XY & XY2);

		/****************** SetX ******************/
		%feature("compactdefaultargs") SetX;
		%feature("autodoc", "Assigns the given value to the x coordinate of this number pair.

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
		%feature("autodoc", "Assigns the given value to the y coordinate of this number pair.

Parameters
----------
Y: float

Returns
-------
None
") SetY;
		void SetY(const Standard_Real Y);

		/****************** SquareModulus ******************/
		%feature("compactdefaultargs") SquareModulus;
		%feature("autodoc", "Computes x*x + y*y where x and y are the two coordinates of this number pair.

Returns
-------
float
") SquareModulus;
		Standard_Real SquareModulus();

		/****************** Subtract ******************/
		%feature("compactdefaultargs") Subtract;
		%feature("autodoc", "<self>.x() = <self>.x() - other.x() <self>.y() = <self>.y() - other.y().

Parameters
----------
Right: gp_XY

Returns
-------
None
") Subtract;
		void Subtract(const gp_XY & Right);

		/****************** Subtracted ******************/
		%feature("compactdefaultargs") Subtracted;
		%feature("autodoc", "New.x() = <self>.x() - other.x() new.y() = <self>.y() - other.y().

Parameters
----------
Right: gp_XY

Returns
-------
gp_XY
") Subtracted;
		gp_XY Subtracted(const gp_XY & Right);

		/****************** X ******************/
		%feature("compactdefaultargs") X;
		%feature("autodoc", "Returns the x coordinate of this number pair.

Returns
-------
float
") X;
		Standard_Real X();

		/****************** Y ******************/
		%feature("compactdefaultargs") Y;
		%feature("autodoc", "Returns the y coordinate of this number pair.

Returns
-------
float
") Y;
		Standard_Real Y();

		/****************** operator * ******************/
		%feature("compactdefaultargs") operator *;
		%feature("autodoc", "No available documentation.

Parameters
----------
Other: gp_XY

Returns
-------
float
") operator *;
		Standard_Real operator *(const gp_XY & Other);

		/****************** operator * ******************/
		%feature("compactdefaultargs") operator *;
		%feature("autodoc", "No available documentation.

Parameters
----------
Scalar: float

Returns
-------
gp_XY
") operator *;
		gp_XY operator *(const Standard_Real Scalar);

		/****************** operator * ******************/
		%feature("compactdefaultargs") operator *;
		%feature("autodoc", "No available documentation.

Parameters
----------
Matrix: gp_Mat2d

Returns
-------
gp_XY
") operator *;
		gp_XY operator *(const gp_Mat2d & Matrix);


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
		/****************** operator + ******************/
		%feature("compactdefaultargs") operator +;
		%feature("autodoc", "No available documentation.

Parameters
----------
Other: gp_XY

Returns
-------
gp_XY
") operator +;
		gp_XY operator +(const gp_XY & Other);


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
		/****************** operator - ******************/
		%feature("compactdefaultargs") operator -;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_XY
") operator -;
		gp_XY operator -();

		/****************** operator - ******************/
		%feature("compactdefaultargs") operator -;
		%feature("autodoc", "No available documentation.

Parameters
----------
Right: gp_XY

Returns
-------
gp_XY
") operator -;
		gp_XY operator -(const gp_XY & Right);


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
		/****************** operator / ******************/
		%feature("compactdefaultargs") operator /;
		%feature("autodoc", "No available documentation.

Parameters
----------
Scalar: float

Returns
-------
gp_XY
") operator /;
		gp_XY operator /(const Standard_Real Scalar);


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
		/****************** gp_XYZ ******************/
		%feature("compactdefaultargs") gp_XYZ;
		%feature("autodoc", "Creates an xyz object with zero co-ordinates (0,0,0).

Returns
-------
None
") gp_XYZ;
		 gp_XYZ();

		/****************** gp_XYZ ******************/
		%feature("compactdefaultargs") gp_XYZ;
		%feature("autodoc", "Creates an xyz with given coordinates.

Parameters
----------
X: float
Y: float
Z: float

Returns
-------
None
") gp_XYZ;
		 gp_XYZ(const Standard_Real X, const Standard_Real Y, const Standard_Real Z);

		/****************** Add ******************/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "<self>.x() = <self>.x() + other.x() <self>.y() = <self>.y() + other.y() <self>.z() = <self>.z() + other.z().

Parameters
----------
Other: gp_XYZ

Returns
-------
None
") Add;
		void Add(const gp_XYZ & Other);

		/****************** Added ******************/
		%feature("compactdefaultargs") Added;
		%feature("autodoc", "New.x() = <self>.x() + other.x() new.y() = <self>.y() + other.y() new.z() = <self>.z() + other.z().

Parameters
----------
Other: gp_XYZ

Returns
-------
gp_XYZ
") Added;
		gp_XYZ Added(const gp_XYZ & Other);


        %feature("autodoc","1");
        %extend {
            Standard_Real GetChangeCoord(const Standard_Integer theIndex) {
            return (Standard_Real) $self->ChangeCoord(theIndex);
            }
        };
        %feature("autodoc","1");
        %extend {
            void SetChangeCoord(const Standard_Integer theIndex,Standard_Real value) {
            $self->ChangeCoord(theIndex)=value;
            }
        };
		/****************** ChangeData ******************/
		%feature("compactdefaultargs") ChangeData;
		%feature("autodoc", "Returns a ptr to coordinates location. is useful for algorithms, but does not perform any checks!.

Returns
-------
float *
") ChangeData;
		Standard_Real * ChangeData();

		/****************** Coord ******************/
		%feature("compactdefaultargs") Coord;
		%feature("autodoc", "Returns the coordinate of range index : index = 1 => x is returned index = 2 => y is returned index = 3 => z is returned //! raises outofrange if index != {1, 2, 3}.

Parameters
----------
Index: int

Returns
-------
float
") Coord;
		Standard_Real Coord(const Standard_Integer Index);

		/****************** Coord ******************/
		%feature("compactdefaultargs") Coord;
		%feature("autodoc", "No available documentation.

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
		%feature("autodoc", "<self>.x() = <self>.y() * other.z() - <self>.z() * other.y() <self>.y() = <self>.z() * other.x() - <self>.x() * other.z() <self>.z() = <self>.x() * other.y() - <self>.y() * other.x().

Parameters
----------
Right: gp_XYZ

Returns
-------
None
") Cross;
		void Cross(const gp_XYZ & Right);

		/****************** CrossCross ******************/
		%feature("compactdefaultargs") CrossCross;
		%feature("autodoc", "Triple vector product computes <self> = <self>.cross(coord1.cross(coord2)).

Parameters
----------
Coord1: gp_XYZ
Coord2: gp_XYZ

Returns
-------
None
") CrossCross;
		void CrossCross(const gp_XYZ & Coord1, const gp_XYZ & Coord2);

		/****************** CrossCrossed ******************/
		%feature("compactdefaultargs") CrossCrossed;
		%feature("autodoc", "Triple vector product computes new = <self>.cross(coord1.cross(coord2)).

Parameters
----------
Coord1: gp_XYZ
Coord2: gp_XYZ

Returns
-------
gp_XYZ
") CrossCrossed;
		gp_XYZ CrossCrossed(const gp_XYZ & Coord1, const gp_XYZ & Coord2);

		/****************** CrossMagnitude ******************/
		%feature("compactdefaultargs") CrossMagnitude;
		%feature("autodoc", "Computes the magnitude of the cross product between <self> and right. returns || <self> ^ right ||.

Parameters
----------
Right: gp_XYZ

Returns
-------
float
") CrossMagnitude;
		Standard_Real CrossMagnitude(const gp_XYZ & Right);

		/****************** CrossSquareMagnitude ******************/
		%feature("compactdefaultargs") CrossSquareMagnitude;
		%feature("autodoc", "Computes the square magnitude of the cross product between <self> and right. returns || <self> ^ right ||**2.

Parameters
----------
Right: gp_XYZ

Returns
-------
float
") CrossSquareMagnitude;
		Standard_Real CrossSquareMagnitude(const gp_XYZ & Right);

		/****************** Crossed ******************/
		%feature("compactdefaultargs") Crossed;
		%feature("autodoc", "New.x() = <self>.y() * other.z() - <self>.z() * other.y() new.y() = <self>.z() * other.x() - <self>.x() * other.z() new.z() = <self>.x() * other.y() - <self>.y() * other.x().

Parameters
----------
Right: gp_XYZ

Returns
-------
gp_XYZ
") Crossed;
		gp_XYZ Crossed(const gp_XYZ & Right);

		/****************** Divide ******************/
		%feature("compactdefaultargs") Divide;
		%feature("autodoc", "Divides <self> by a real.

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
		%feature("autodoc", "Divides <self> by a real.

Parameters
----------
Scalar: float

Returns
-------
gp_XYZ
") Divided;
		gp_XYZ Divided(const Standard_Real Scalar);

		/****************** Dot ******************/
		%feature("compactdefaultargs") Dot;
		%feature("autodoc", "Computes the scalar product between <self> and other.

Parameters
----------
Other: gp_XYZ

Returns
-------
float
") Dot;
		Standard_Real Dot(const gp_XYZ & Other);

		/****************** DotCross ******************/
		%feature("compactdefaultargs") DotCross;
		%feature("autodoc", "Computes the triple scalar product.

Parameters
----------
Coord1: gp_XYZ
Coord2: gp_XYZ

Returns
-------
float
") DotCross;
		Standard_Real DotCross(const gp_XYZ & Coord1, const gp_XYZ & Coord2);


            %feature("autodoc", "1");
            %extend{
                std::string DumpJsonToString(int depth=-1) {
                std::stringstream s;
                self->DumpJson(s, depth);
                return s.str();}
            };
		/****************** GetData ******************/
		%feature("compactdefaultargs") GetData;
		%feature("autodoc", "Returns a const ptr to coordinates location. is useful for algorithms, but does not perform any checks!.

Returns
-------
float *
") GetData;
		const Standard_Real * GetData();

		/****************** IsEqual ******************/
		%feature("compactdefaultargs") IsEqual;
		%feature("autodoc", "Returns true if he coordinates of this xyz object are equal to the respective coordinates other, within the specified tolerance tolerance. i.e.: abs(<self>.x() - other.x()) <= tolerance and abs(<self>.y() - other.y()) <= tolerance and abs(<self>.z() - other.z()) <= tolerance.

Parameters
----------
Other: gp_XYZ
Tolerance: float

Returns
-------
bool
") IsEqual;
		Standard_Boolean IsEqual(const gp_XYZ & Other, const Standard_Real Tolerance);

		/****************** Modulus ******************/
		%feature("compactdefaultargs") Modulus;
		%feature("autodoc", "Computes sqrt (x*x + y*y + z*z) where x, y and z are the three coordinates of this xyz object.

Returns
-------
float
") Modulus;
		Standard_Real Modulus();

		/****************** Multiplied ******************/
		%feature("compactdefaultargs") Multiplied;
		%feature("autodoc", "New.x() = <self>.x() * scalar; new.y() = <self>.y() * scalar; new.z() = <self>.z() * scalar;.

Parameters
----------
Scalar: float

Returns
-------
gp_XYZ
") Multiplied;
		gp_XYZ Multiplied(const Standard_Real Scalar);

		/****************** Multiplied ******************/
		%feature("compactdefaultargs") Multiplied;
		%feature("autodoc", "New.x() = <self>.x() * other.x(); new.y() = <self>.y() * other.y(); new.z() = <self>.z() * other.z();.

Parameters
----------
Other: gp_XYZ

Returns
-------
gp_XYZ
") Multiplied;
		gp_XYZ Multiplied(const gp_XYZ & Other);

		/****************** Multiplied ******************/
		%feature("compactdefaultargs") Multiplied;
		%feature("autodoc", "New = matrix * <self>.

Parameters
----------
Matrix: gp_Mat

Returns
-------
gp_XYZ
") Multiplied;
		gp_XYZ Multiplied(const gp_Mat & Matrix);

		/****************** Multiply ******************/
		%feature("compactdefaultargs") Multiply;
		%feature("autodoc", "<self>.x() = <self>.x() * scalar; <self>.y() = <self>.y() * scalar; <self>.z() = <self>.z() * scalar;.

Parameters
----------
Scalar: float

Returns
-------
None
") Multiply;
		void Multiply(const Standard_Real Scalar);

		/****************** Multiply ******************/
		%feature("compactdefaultargs") Multiply;
		%feature("autodoc", "<self>.x() = <self>.x() * other.x(); <self>.y() = <self>.y() * other.y(); <self>.z() = <self>.z() * other.z();.

Parameters
----------
Other: gp_XYZ

Returns
-------
None
") Multiply;
		void Multiply(const gp_XYZ & Other);

		/****************** Multiply ******************/
		%feature("compactdefaultargs") Multiply;
		%feature("autodoc", "<self> = matrix * <self>.

Parameters
----------
Matrix: gp_Mat

Returns
-------
None
") Multiply;
		void Multiply(const gp_Mat & Matrix);

		/****************** Normalize ******************/
		%feature("compactdefaultargs") Normalize;
		%feature("autodoc", "<self>.x() = <self>.x()/ <self>.modulus() <self>.y() = <self>.y()/ <self>.modulus() <self>.z() = <self>.z()/ <self>.modulus() raised if <self>.modulus() <= resolution from gp.

Returns
-------
None
") Normalize;
		void Normalize();

		/****************** Normalized ******************/
		%feature("compactdefaultargs") Normalized;
		%feature("autodoc", "New.x() = <self>.x()/ <self>.modulus() new.y() = <self>.y()/ <self>.modulus() new.z() = <self>.z()/ <self>.modulus() raised if <self>.modulus() <= resolution from gp.

Returns
-------
gp_XYZ
") Normalized;
		gp_XYZ Normalized();

		/****************** Reverse ******************/
		%feature("compactdefaultargs") Reverse;
		%feature("autodoc", "<self>.x() = -<self>.x() <self>.y() = -<self>.y() <self>.z() = -<self>.z().

Returns
-------
None
") Reverse;
		void Reverse();

		/****************** Reversed ******************/
		%feature("compactdefaultargs") Reversed;
		%feature("autodoc", "New.x() = -<self>.x() new.y() = -<self>.y() new.z() = -<self>.z().

Returns
-------
gp_XYZ
") Reversed;
		gp_XYZ Reversed();

		/****************** SetCoord ******************/
		%feature("compactdefaultargs") SetCoord;
		%feature("autodoc", "For this xyz object, assigns the values x, y and z to its three coordinates.

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

		/****************** SetCoord ******************/
		%feature("compactdefaultargs") SetCoord;
		%feature("autodoc", "Modifies the coordinate of range index index = 1 => x is modified index = 2 => y is modified index = 3 => z is modified raises outofrange if index != {1, 2, 3}.

Parameters
----------
Index: int
Xi: float

Returns
-------
None
") SetCoord;
		void SetCoord(const Standard_Integer Index, const Standard_Real Xi);

		/****************** SetLinearForm ******************/
		%feature("compactdefaultargs") SetLinearForm;
		%feature("autodoc", "<self> is set to the following linear form : a1 * xyz1 + a2 * xyz2 + a3 * xyz3 + xyz4.

Parameters
----------
A1: float
XYZ1: gp_XYZ
A2: float
XYZ2: gp_XYZ
A3: float
XYZ3: gp_XYZ
XYZ4: gp_XYZ

Returns
-------
None
") SetLinearForm;
		void SetLinearForm(const Standard_Real A1, const gp_XYZ & XYZ1, const Standard_Real A2, const gp_XYZ & XYZ2, const Standard_Real A3, const gp_XYZ & XYZ3, const gp_XYZ & XYZ4);

		/****************** SetLinearForm ******************/
		%feature("compactdefaultargs") SetLinearForm;
		%feature("autodoc", "<self> is set to the following linear form : a1 * xyz1 + a2 * xyz2 + a3 * xyz3.

Parameters
----------
A1: float
XYZ1: gp_XYZ
A2: float
XYZ2: gp_XYZ
A3: float
XYZ3: gp_XYZ

Returns
-------
None
") SetLinearForm;
		void SetLinearForm(const Standard_Real A1, const gp_XYZ & XYZ1, const Standard_Real A2, const gp_XYZ & XYZ2, const Standard_Real A3, const gp_XYZ & XYZ3);

		/****************** SetLinearForm ******************/
		%feature("compactdefaultargs") SetLinearForm;
		%feature("autodoc", "<self> is set to the following linear form : a1 * xyz1 + a2 * xyz2 + xyz3.

Parameters
----------
A1: float
XYZ1: gp_XYZ
A2: float
XYZ2: gp_XYZ
XYZ3: gp_XYZ

Returns
-------
None
") SetLinearForm;
		void SetLinearForm(const Standard_Real A1, const gp_XYZ & XYZ1, const Standard_Real A2, const gp_XYZ & XYZ2, const gp_XYZ & XYZ3);

		/****************** SetLinearForm ******************/
		%feature("compactdefaultargs") SetLinearForm;
		%feature("autodoc", "<self> is set to the following linear form : a1 * xyz1 + a2 * xyz2.

Parameters
----------
A1: float
XYZ1: gp_XYZ
A2: float
XYZ2: gp_XYZ

Returns
-------
None
") SetLinearForm;
		void SetLinearForm(const Standard_Real A1, const gp_XYZ & XYZ1, const Standard_Real A2, const gp_XYZ & XYZ2);

		/****************** SetLinearForm ******************/
		%feature("compactdefaultargs") SetLinearForm;
		%feature("autodoc", "<self> is set to the following linear form : a1 * xyz1 + xyz2.

Parameters
----------
A1: float
XYZ1: gp_XYZ
XYZ2: gp_XYZ

Returns
-------
None
") SetLinearForm;
		void SetLinearForm(const Standard_Real A1, const gp_XYZ & XYZ1, const gp_XYZ & XYZ2);

		/****************** SetLinearForm ******************/
		%feature("compactdefaultargs") SetLinearForm;
		%feature("autodoc", "<self> is set to the following linear form : xyz1 + xyz2.

Parameters
----------
XYZ1: gp_XYZ
XYZ2: gp_XYZ

Returns
-------
None
") SetLinearForm;
		void SetLinearForm(const gp_XYZ & XYZ1, const gp_XYZ & XYZ2);

		/****************** SetX ******************/
		%feature("compactdefaultargs") SetX;
		%feature("autodoc", "Assigns the given value to the x coordinate.

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
		%feature("autodoc", "Assigns the given value to the y coordinate.

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
		%feature("autodoc", "Assigns the given value to the z coordinate.

Parameters
----------
Z: float

Returns
-------
None
") SetZ;
		void SetZ(const Standard_Real Z);

		/****************** SquareModulus ******************/
		%feature("compactdefaultargs") SquareModulus;
		%feature("autodoc", "Computes x*x + y*y + z*z where x, y and z are the three coordinates of this xyz object.

Returns
-------
float
") SquareModulus;
		Standard_Real SquareModulus();

		/****************** Subtract ******************/
		%feature("compactdefaultargs") Subtract;
		%feature("autodoc", "<self>.x() = <self>.x() - other.x() <self>.y() = <self>.y() - other.y() <self>.z() = <self>.z() - other.z().

Parameters
----------
Right: gp_XYZ

Returns
-------
None
") Subtract;
		void Subtract(const gp_XYZ & Right);

		/****************** Subtracted ******************/
		%feature("compactdefaultargs") Subtracted;
		%feature("autodoc", "New.x() = <self>.x() - other.x() new.y() = <self>.y() - other.y() new.z() = <self>.z() - other.z().

Parameters
----------
Right: gp_XYZ

Returns
-------
gp_XYZ
") Subtracted;
		gp_XYZ Subtracted(const gp_XYZ & Right);

		/****************** X ******************/
		%feature("compactdefaultargs") X;
		%feature("autodoc", "Returns the x coordinate.

Returns
-------
float
") X;
		Standard_Real X();

		/****************** Y ******************/
		%feature("compactdefaultargs") Y;
		%feature("autodoc", "Returns the y coordinate.

Returns
-------
float
") Y;
		Standard_Real Y();

		/****************** Z ******************/
		%feature("compactdefaultargs") Z;
		%feature("autodoc", "Returns the z coordinate.

Returns
-------
float
") Z;
		Standard_Real Z();

		/****************** operator * ******************/
		%feature("compactdefaultargs") operator *;
		%feature("autodoc", "No available documentation.

Parameters
----------
Other: gp_XYZ

Returns
-------
float
") operator *;
		Standard_Real operator *(const gp_XYZ & Other);

		/****************** operator * ******************/
		%feature("compactdefaultargs") operator *;
		%feature("autodoc", "No available documentation.

Parameters
----------
Scalar: float

Returns
-------
gp_XYZ
") operator *;
		gp_XYZ operator *(const Standard_Real Scalar);

		/****************** operator * ******************/
		%feature("compactdefaultargs") operator *;
		%feature("autodoc", "No available documentation.

Parameters
----------
Matrix: gp_Mat

Returns
-------
gp_XYZ
") operator *;
		gp_XYZ operator *(const gp_Mat & Matrix);


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
		/****************** operator + ******************/
		%feature("compactdefaultargs") operator +;
		%feature("autodoc", "No available documentation.

Parameters
----------
Other: gp_XYZ

Returns
-------
gp_XYZ
") operator +;
		gp_XYZ operator +(const gp_XYZ & Other);


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
		/****************** operator - ******************/
		%feature("compactdefaultargs") operator -;
		%feature("autodoc", "No available documentation.

Parameters
----------
Right: gp_XYZ

Returns
-------
gp_XYZ
") operator -;
		gp_XYZ operator -(const gp_XYZ & Right);


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
		/****************** operator / ******************/
		%feature("compactdefaultargs") operator /;
		%feature("autodoc", "No available documentation.

Parameters
----------
Scalar: float

Returns
-------
gp_XYZ
") operator /;
		gp_XYZ operator /(const Standard_Real Scalar);


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


%extend gp_XYZ {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* harray1 classes */
/* harray2 classes */
/* hsequence classes */
