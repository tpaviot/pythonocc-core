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
		/**** md5 signature: 816685723183e6c0cd67bb85bd668cc0 ****/
		%feature("compactdefaultargs") DX;
		%feature("autodoc", "Returns a unit vector with the combination (1,0,0).

Returns
-------
gp_Dir
") DX;
		static const gp_Dir DX();

		/****************** DX2d ******************/
		/**** md5 signature: 42a3e9a52aac0ab4f9f555873b03761d ****/
		%feature("compactdefaultargs") DX2d;
		%feature("autodoc", "Returns a unit vector with the combinations (1,0).

Returns
-------
gp_Dir2d
") DX2d;
		static const gp_Dir2d DX2d();

		/****************** DY ******************/
		/**** md5 signature: 22c21f56763a0f94eac7a7ebba8e4912 ****/
		%feature("compactdefaultargs") DY;
		%feature("autodoc", "Returns a unit vector with the combination (0,1,0).

Returns
-------
gp_Dir
") DY;
		static const gp_Dir DY();

		/****************** DY2d ******************/
		/**** md5 signature: 3b72c33d1d485657a3c41af2deac8e0b ****/
		%feature("compactdefaultargs") DY2d;
		%feature("autodoc", "Returns a unit vector with the combinations (0,1).

Returns
-------
gp_Dir2d
") DY2d;
		static const gp_Dir2d DY2d();

		/****************** DZ ******************/
		/**** md5 signature: 524e2b6091c04479b30410a9eefaf13f ****/
		%feature("compactdefaultargs") DZ;
		%feature("autodoc", "Returns a unit vector with the combination (0,0,1).

Returns
-------
gp_Dir
") DZ;
		static const gp_Dir DZ();

		/****************** OX ******************/
		/**** md5 signature: ef7894b9a0f57ea10751b5048e97a6b3 ****/
		%feature("compactdefaultargs") OX;
		%feature("autodoc", "Identifies an axis where its origin is origin and its unit vector coordinates x = 1.0, y = z = 0.0.

Returns
-------
gp_Ax1
") OX;
		static const gp_Ax1 OX();

		/****************** OX2d ******************/
		/**** md5 signature: 5557f5dffab0aa4f79204d2338d67b69 ****/
		%feature("compactdefaultargs") OX2d;
		%feature("autodoc", "Identifies an axis where its origin is origin2d and its unit vector coordinates are: x = 1.0, y = 0.0.

Returns
-------
gp_Ax2d
") OX2d;
		static const gp_Ax2d OX2d();

		/****************** OY ******************/
		/**** md5 signature: e2227425c69bb05cd1623833078271d6 ****/
		%feature("compactdefaultargs") OY;
		%feature("autodoc", "Identifies an axis where its origin is origin and its unit vector coordinates y = 1.0, x = z = 0.0.

Returns
-------
gp_Ax1
") OY;
		static const gp_Ax1 OY();

		/****************** OY2d ******************/
		/**** md5 signature: f3223bd20bed7ec52129dc95cfe8db96 ****/
		%feature("compactdefaultargs") OY2d;
		%feature("autodoc", "Identifies an axis where its origin is origin2d and its unit vector coordinates are y = 1.0, x = 0.0.

Returns
-------
gp_Ax2d
") OY2d;
		static const gp_Ax2d OY2d();

		/****************** OZ ******************/
		/**** md5 signature: c7060ea54c741b99561fce09b24fb584 ****/
		%feature("compactdefaultargs") OZ;
		%feature("autodoc", "Identifies an axis where its origin is origin and its unit vector coordinates z = 1.0, y = x = 0.0.

Returns
-------
gp_Ax1
") OZ;
		static const gp_Ax1 OZ();

		/****************** Origin ******************/
		/**** md5 signature: 613c484437712b0cad85038f630d1f47 ****/
		%feature("compactdefaultargs") Origin;
		%feature("autodoc", "Identifies a cartesian point with coordinates x = y = z = 0.0.0.

Returns
-------
gp_Pnt
") Origin;
		static const gp_Pnt Origin();

		/****************** Origin2d ******************/
		/**** md5 signature: 228cd463a58b7060457252e7c48a318d ****/
		%feature("compactdefaultargs") Origin2d;
		%feature("autodoc", "Identifies a cartesian point with coordinates x = y = 0.0.

Returns
-------
gp_Pnt2d
") Origin2d;
		static const gp_Pnt2d Origin2d();

		/****************** Resolution ******************/
		/**** md5 signature: c41a5ee3b5f2326dc6d21dd37cf291eb ****/
		%feature("compactdefaultargs") Resolution;
		%feature("autodoc", "Method of package gp //! in geometric computations, defines the tolerance criterion used to determine when two numbers can be considered equal. many class functions use this tolerance criterion, for example, to avoid division by zero in geometric computations. in the documentation, tolerance criterion is always referred to as gp::resolution().

Returns
-------
float
") Resolution;
		static Standard_Real Resolution();

		/****************** XOY ******************/
		/**** md5 signature: 67760ba4d90b4d7fc19b9128ace5377a ****/
		%feature("compactdefaultargs") XOY;
		%feature("autodoc", "Identifies a coordinate system where its origin is origin, and its 'main direction' and 'x direction' coordinates z = 1.0, x = y =0.0 and x direction coordinates x = 1.0, y = z = 0.0.

Returns
-------
gp_Ax2
") XOY;
		static const gp_Ax2 XOY();

		/****************** YOZ ******************/
		/**** md5 signature: 171fcfda4bc6222118cb9b0c6d12c0bb ****/
		%feature("compactdefaultargs") YOZ;
		%feature("autodoc", "Identifies a coordinate system where its origin is origin, and its 'main direction' and 'x direction' coordinates x = 1.0, z = y =0.0 and x direction coordinates y = 1.0, x = z = 0.0 in 2d space.

Returns
-------
gp_Ax2
") YOZ;
		static const gp_Ax2 YOZ();

		/****************** ZOX ******************/
		/**** md5 signature: 0b3979b5fd5cfa33de1f0766fae7209c ****/
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
		/**** md5 signature: 7b007f788140c752a098264cba05a244 ****/
		%feature("compactdefaultargs") gp_Ax1;
		%feature("autodoc", "Creates an axis object representing z axis of the reference co-ordinate system.

Returns
-------
None
") gp_Ax1;
		 gp_Ax1();

		/****************** gp_Ax1 ******************/
		/**** md5 signature: 637c7fee81315c0164fae433ed650664 ****/
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
		/**** md5 signature: 1c6fdaf964c700d3540d1eefe2589a5c ****/
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
		/**** md5 signature: 6107c9113155a9ae9007c5c8e526a738 ****/
		%feature("compactdefaultargs") Direction;
		%feature("autodoc", "Returns the direction of <self>.

Returns
-------
gp_Dir
") Direction;
		const gp_Dir Direction();

		/****************** IsCoaxial ******************/
		/**** md5 signature: 5a0f3aebace8af9610e7543d64eaa8a4 ****/
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
		/**** md5 signature: 392653e30b82c78b059dfff313c869e4 ****/
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
		/**** md5 signature: 77b99f08b02e32a56ec35742e68e80cd ****/
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
		/**** md5 signature: c9943ad4fff3522cfbecfdcab92b5a3a ****/
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
		/**** md5 signature: 42040ad2ed401b7e80bf90e4b6b5f418 ****/
		%feature("compactdefaultargs") Location;
		%feature("autodoc", "Returns the location point of <self>.

Returns
-------
gp_Pnt
") Location;
		const gp_Pnt Location();

		/****************** Mirror ******************/
		/**** md5 signature: b133f2e6e1c74f672a216a0094bdfda6 ****/
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
		/**** md5 signature: d1a0189a98d756bd9e5b51b4ae49992a ****/
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
		/**** md5 signature: 874cde0169043be133e205e960c3ca57 ****/
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
		/**** md5 signature: 08e715ccb378378a36498623a8bab732 ****/
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
		/**** md5 signature: 52da30597ff096d51b4173b021c3f9db ****/
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
		/**** md5 signature: 2ecbe9f40d159da557ee86baef897f7d ****/
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
		/**** md5 signature: b751d6874fc026e19a7a6cb37e9ac1b4 ****/
		%feature("compactdefaultargs") Reverse;
		%feature("autodoc", "Reverses the unit vector of this axis. and assigns the result to this axis.

Returns
-------
None
") Reverse;
		void Reverse();

		/****************** Reversed ******************/
		/**** md5 signature: c77950ee3a33ab2ba7ed6ca9c3547c50 ****/
		%feature("compactdefaultargs") Reversed;
		%feature("autodoc", "Reverses the unit vector of this axis and creates a new one.

Returns
-------
gp_Ax1
") Reversed;
		gp_Ax1 Reversed();

		/****************** Rotate ******************/
		/**** md5 signature: 12c4967f27a0900e4176252164d2f2ce ****/
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
		/**** md5 signature: a60f3b2c65b23dd068a442afde38a4f4 ****/
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
		/**** md5 signature: e66fc526c4232f21fb4238a81292d522 ****/
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
		/**** md5 signature: 1e6d96ac52c696e1614fe941d93eec69 ****/
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
		/**** md5 signature: df8744d729e050a65ee65230eb199390 ****/
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
		/**** md5 signature: c028aee785b685956e8e7d5cba7ecb46 ****/
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
		/**** md5 signature: 45ee6a37cbc92ff06bd17b5653f32913 ****/
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
		/**** md5 signature: 808c21db5efacb6106f90512f25370cc ****/
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
		/**** md5 signature: b3667af07c9a238180bc31cc15803f78 ****/
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
		/**** md5 signature: 5053222ade9605c7c37102310f06f2e8 ****/
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
		/**** md5 signature: 5cd458e26a0d98eb601efbb21f375975 ****/
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
		/**** md5 signature: 2d7a05e32f8a573ce6ca426eda511b1c ****/
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
		/**** md5 signature: 58bb88d4fb7ed3ca0c652d4198529276 ****/
		%feature("compactdefaultargs") gp_Ax2;
		%feature("autodoc", "Creates an object corresponding to the reference coordinate system (oxyz).

Returns
-------
None
") gp_Ax2;
		 gp_Ax2();

		/****************** gp_Ax2 ******************/
		/**** md5 signature: 36de8ac59c2a34a89fe5b8b4066caf2e ****/
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
		/**** md5 signature: 521894c3551259b470c23a56b917c3bc ****/
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
		/**** md5 signature: 108c06ae9c733a99a95e07b79dc5224e ****/
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
		/**** md5 signature: cb9b52ff887b682f8bfc1eb2f646705a ****/
		%feature("compactdefaultargs") Axis;
		%feature("autodoc", "Returns the main axis of <self>. it is the 'location' point and the main 'direction'.

Returns
-------
gp_Ax1
") Axis;
		const gp_Ax1 Axis();

		/****************** Direction ******************/
		/**** md5 signature: 6107c9113155a9ae9007c5c8e526a738 ****/
		%feature("compactdefaultargs") Direction;
		%feature("autodoc", "Returns the main direction of <self>.

Returns
-------
gp_Dir
") Direction;
		const gp_Dir Direction();

		/****************** IsCoplanar ******************/
		/**** md5 signature: b5afd6b5d22740e47c1cc2021bf5f05f ****/
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
		/**** md5 signature: 9d017c24775b2c198dc6fae3ec6ac7e2 ****/
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
		/**** md5 signature: 42040ad2ed401b7e80bf90e4b6b5f418 ****/
		%feature("compactdefaultargs") Location;
		%feature("autodoc", "Returns the 'location' point (origin) of <self>.

Returns
-------
gp_Pnt
") Location;
		const gp_Pnt Location();

		/****************** Mirror ******************/
		/**** md5 signature: b133f2e6e1c74f672a216a0094bdfda6 ****/
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
		/**** md5 signature: d1a0189a98d756bd9e5b51b4ae49992a ****/
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
		/**** md5 signature: 874cde0169043be133e205e960c3ca57 ****/
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
		/**** md5 signature: 0cc467f32eec1a08f583d07798a3bed4 ****/
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
		/**** md5 signature: cd76323d08d1a74c97ae7accdafbe5ed ****/
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
		/**** md5 signature: be1595105fbb55ff06221b22fd36206f ****/
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
		/**** md5 signature: 12c4967f27a0900e4176252164d2f2ce ****/
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
		/**** md5 signature: 61f304b7d0ec99518eae099e717ac6da ****/
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
		/**** md5 signature: e66fc526c4232f21fb4238a81292d522 ****/
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
		/**** md5 signature: 9c63e1f744c6aa46cc4772253c660cc3 ****/
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
		/**** md5 signature: 4f1ae44e92ff7b1da601b2ca71a3a58a ****/
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
		/**** md5 signature: df8744d729e050a65ee65230eb199390 ****/
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
		/**** md5 signature: c028aee785b685956e8e7d5cba7ecb46 ****/
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
		/**** md5 signature: 7eca57e5a0ce16869c4831a889c43a11 ****/
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
		/**** md5 signature: a17e9c62e6e6ab1cb8c83307d7a48bda ****/
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
		/**** md5 signature: 45ee6a37cbc92ff06bd17b5653f32913 ****/
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
		/**** md5 signature: 84c770961a27249da82d5a2d857ffb52 ****/
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
		/**** md5 signature: b3667af07c9a238180bc31cc15803f78 ****/
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
		/**** md5 signature: 5053222ade9605c7c37102310f06f2e8 ****/
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
		/**** md5 signature: 9e99b32b398898dab3d5090155c9b744 ****/
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
		/**** md5 signature: 9d6aa5332865494dca452b6363685104 ****/
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
		/**** md5 signature: 961290da84516159b8901f300dd3110d ****/
		%feature("compactdefaultargs") XDirection;
		%feature("autodoc", "Returns the 'xdirection' of <self>.

Returns
-------
gp_Dir
") XDirection;
		const gp_Dir XDirection();

		/****************** YDirection ******************/
		/**** md5 signature: cc21cc9ed5abd09b9e251302c66ef4f2 ****/
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
		/**** md5 signature: 86fefb7b1c5ff71dbb4ed0d3f92e6a73 ****/
		%feature("compactdefaultargs") gp_Ax22d;
		%feature("autodoc", "Creates an object representing the reference co-ordinate system (oxy).

Returns
-------
None
") gp_Ax22d;
		 gp_Ax22d();

		/****************** gp_Ax22d ******************/
		/**** md5 signature: a3bc6c5144b3912aed80ffb7b60b92c4 ****/
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
		/**** md5 signature: a713247a4ee59749ec6cf58b44246088 ****/
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
		/**** md5 signature: 4d45b00279ac1a2ee0eea7efb94d2cc1 ****/
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
		/**** md5 signature: fbf774a3a1efe16540d680c0476bcbc8 ****/
		%feature("compactdefaultargs") Location;
		%feature("autodoc", "Returns the 'location' point (origin) of <self>.

Returns
-------
gp_Pnt2d
") Location;
		const gp_Pnt2d Location();

		/****************** Mirror ******************/
		/**** md5 signature: 5a90a3ec4faf7909390bb0bfb4d9be0f ****/
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
		/**** md5 signature: 8b8d921c1e87f73e8278c4d42ae298f7 ****/
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
		/**** md5 signature: 6453d3351d5ddf5cc0f64b1d39a859e8 ****/
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
		/**** md5 signature: 2414c69e0dba540019d13bd8372e2b47 ****/
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
		/**** md5 signature: 795edcbb32146eb6f071bea4c90f5cfd ****/
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
		/**** md5 signature: 5720b65374e7daa30aedf90fd91275d6 ****/
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
		/**** md5 signature: 5b49a8aeffcacace07c66937f77f1e03 ****/
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
		/**** md5 signature: e82ea2ce2b2aa9314e4a952f34f34261 ****/
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
		/**** md5 signature: d9f98040a18c5fcb281108b15e245613 ****/
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
		/**** md5 signature: 368c9b8c039b553e22ee650e75e4d404 ****/
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
		/**** md5 signature: d470e8fee8e0908f1286bff27f125b55 ****/
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
		/**** md5 signature: 1cfcd5391256e5129d63a49bb045739d ****/
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
		/**** md5 signature: 71db8eb31883ebd90c5b31f7f4fbcae8 ****/
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
		/**** md5 signature: 0940c8832babb0a1a55960e8952d2887 ****/
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
		/**** md5 signature: dace16a29a39216c0dd584c6964e840b ****/
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
		/**** md5 signature: a56f80cc758e66248547abb6fcf0127a ****/
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
		/**** md5 signature: 1cd2e000b85692a9f89a6bf8e8e4782c ****/
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
		/**** md5 signature: c7768f1dcf9b6595f2bd4653737544f9 ****/
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
		/**** md5 signature: 7ea30d40893f3f0c5701e95e5442781e ****/
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
		/**** md5 signature: f38ec6a16063580507affe862933d36c ****/
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
		/**** md5 signature: 5bcd651b87069885e2b5ecad2bd89992 ****/
		%feature("compactdefaultargs") XAxis;
		%feature("autodoc", "Returns an axis, for which - the origin is that of this coordinate system, and - the unit vector is either the 'x direction' of this coordinate system. note: the result is the 'x axis' of this coordinate system.

Returns
-------
gp_Ax2d
") XAxis;
		gp_Ax2d XAxis();

		/****************** XDirection ******************/
		/**** md5 signature: 763c05435f3b6eb3a05978e8e62f5636 ****/
		%feature("compactdefaultargs") XDirection;
		%feature("autodoc", "Returns the 'xdirection' of <self>.

Returns
-------
gp_Dir2d
") XDirection;
		const gp_Dir2d XDirection();

		/****************** YAxis ******************/
		/**** md5 signature: 1e80565ed75c7e231792089b80d7c873 ****/
		%feature("compactdefaultargs") YAxis;
		%feature("autodoc", "Returns an axis, for which - the origin is that of this coordinate system, and - the unit vector is either the 'y direction' of this coordinate system. note: the result is the 'y axis' of this coordinate system.

Returns
-------
gp_Ax2d
") YAxis;
		gp_Ax2d YAxis();

		/****************** YDirection ******************/
		/**** md5 signature: a2b87f3c5a312d05cb0bb9e3f7a86501 ****/
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
		/**** md5 signature: 09541c8cc9f239f2456018d5b036ed93 ****/
		%feature("compactdefaultargs") gp_Ax2d;
		%feature("autodoc", "Creates an axis object representing x axis of the reference co-ordinate system.

Returns
-------
None
") gp_Ax2d;
		 gp_Ax2d();

		/****************** gp_Ax2d ******************/
		/**** md5 signature: f415a4a8975bd93dab6fe4ec485bade5 ****/
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
		/**** md5 signature: 2be1ddee3e67780bff9638b8bbc37adb ****/
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
		/**** md5 signature: 24b32913fac63aab5fb6c5d1d7be7851 ****/
		%feature("compactdefaultargs") Direction;
		%feature("autodoc", "Returns the direction of <self>.

Returns
-------
gp_Dir2d
") Direction;
		const gp_Dir2d Direction();

		/****************** IsCoaxial ******************/
		/**** md5 signature: 75e748f680609f8e38c2264eb1a2db73 ****/
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
		/**** md5 signature: 3dbb9d19b9580a5622aa73531b2e64e8 ****/
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
		/**** md5 signature: beda3bf96d6caea94b1408960be8cd96 ****/
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
		/**** md5 signature: 6aebe73e34378dc657adf4529e2a27e3 ****/
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
		/**** md5 signature: fbf774a3a1efe16540d680c0476bcbc8 ****/
		%feature("compactdefaultargs") Location;
		%feature("autodoc", "Returns the origin of <self>.

Returns
-------
gp_Pnt2d
") Location;
		const gp_Pnt2d Location();

		/****************** Mirror ******************/
		/**** md5 signature: 5a90a3ec4faf7909390bb0bfb4d9be0f ****/
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
		/**** md5 signature: 8b8d921c1e87f73e8278c4d42ae298f7 ****/
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
		/**** md5 signature: 6fb036fc1f45fe9989030dfbdebac0ea ****/
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
		/**** md5 signature: f3f6d2f09cb7c474ab9f0d93f8940599 ****/
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
		/**** md5 signature: b751d6874fc026e19a7a6cb37e9ac1b4 ****/
		%feature("compactdefaultargs") Reverse;
		%feature("autodoc", "Reverses the direction of <self> and assigns the result to this axis.

Returns
-------
None
") Reverse;
		void Reverse();

		/****************** Reversed ******************/
		/**** md5 signature: be9ba02b677fc59c4188f5004997cefe ****/
		%feature("compactdefaultargs") Reversed;
		%feature("autodoc", "Computes a new axis placement with a direction opposite to the direction of <self>.

Returns
-------
gp_Ax2d
") Reversed;
		gp_Ax2d Reversed();

		/****************** Rotate ******************/
		/**** md5 signature: 795edcbb32146eb6f071bea4c90f5cfd ****/
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
		/**** md5 signature: bb85376347950cf75fa6ea3ac1fe74ab ****/
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
		/**** md5 signature: 5b49a8aeffcacace07c66937f77f1e03 ****/
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
		/**** md5 signature: 6c8d79002bf79c3b05e0863ce1d20486 ****/
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
		/**** md5 signature: 12767d6ecad16faa02d3f67f1fb01553 ****/
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
		/**** md5 signature: 55b318bfd438b582dad2794c473529bc ****/
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
		/**** md5 signature: dace16a29a39216c0dd584c6964e840b ****/
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
		/**** md5 signature: 4f83007b453226f942aa92b91df4b5b4 ****/
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
		/**** md5 signature: 1cd2e000b85692a9f89a6bf8e8e4782c ****/
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
		/**** md5 signature: c7768f1dcf9b6595f2bd4653737544f9 ****/
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
		/**** md5 signature: 97e4a767c7511b492d1d9a6226de9dd2 ****/
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
		/**** md5 signature: adde277cb194bb4555252485d7e6ca40 ****/
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
		/**** md5 signature: 9ee5f51c9f0bc03764241213409c830c ****/
		%feature("compactdefaultargs") gp_Ax3;
		%feature("autodoc", "Creates an object corresponding to the reference coordinate system (oxyz).

Returns
-------
None
") gp_Ax3;
		 gp_Ax3();

		/****************** gp_Ax3 ******************/
		/**** md5 signature: 328d648f0a87a8644a8a4fd7514feea4 ****/
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
		/**** md5 signature: 137a0e9cd8b8747ec023d14d6413d1d6 ****/
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
		/**** md5 signature: 6c9a339763daa459c3496b93087285ee ****/
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
		/**** md5 signature: 5fd634354dc6612843229d2a000799ff ****/
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
		/**** md5 signature: c9b4af4169eef4b21cfe015142d7278a ****/
		%feature("compactdefaultargs") Ax2;
		%feature("autodoc", "Computes a right-handed coordinate system with the same 'x direction' and 'y direction' as those of this coordinate system, then recomputes the 'main direction'. if this coordinate system is right-handed, the result returned is the same coordinate system. if this coordinate system is left-handed, the result is reversed.

Returns
-------
gp_Ax2
") Ax2;
		gp_Ax2 Ax2();

		/****************** Axis ******************/
		/**** md5 signature: cb9b52ff887b682f8bfc1eb2f646705a ****/
		%feature("compactdefaultargs") Axis;
		%feature("autodoc", "Returns the main axis of <self>. it is the 'location' point and the main 'direction'.

Returns
-------
gp_Ax1
") Axis;
		const gp_Ax1 Axis();

		/****************** Direct ******************/
		/**** md5 signature: 33e4e96f61de8e23c989d6f9aec7d457 ****/
		%feature("compactdefaultargs") Direct;
		%feature("autodoc", "Returns true if the coordinate system is right-handed. i.e. xdirection().crossed(ydirection()).dot(direction()) > 0.

Returns
-------
bool
") Direct;
		Standard_Boolean Direct();

		/****************** Direction ******************/
		/**** md5 signature: 6107c9113155a9ae9007c5c8e526a738 ****/
		%feature("compactdefaultargs") Direction;
		%feature("autodoc", "Returns the main direction of <self>.

Returns
-------
gp_Dir
") Direction;
		const gp_Dir Direction();

		/****************** IsCoplanar ******************/
		/**** md5 signature: 7a81678968149480bd1087dc8a4f6d4a ****/
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
		/**** md5 signature: 9d017c24775b2c198dc6fae3ec6ac7e2 ****/
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
		/**** md5 signature: 42040ad2ed401b7e80bf90e4b6b5f418 ****/
		%feature("compactdefaultargs") Location;
		%feature("autodoc", "Returns the 'location' point (origin) of <self>.

Returns
-------
gp_Pnt
") Location;
		const gp_Pnt Location();

		/****************** Mirror ******************/
		/**** md5 signature: b133f2e6e1c74f672a216a0094bdfda6 ****/
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
		/**** md5 signature: d1a0189a98d756bd9e5b51b4ae49992a ****/
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
		/**** md5 signature: 874cde0169043be133e205e960c3ca57 ****/
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
		/**** md5 signature: b4bba249367f343155a42ee4397d745c ****/
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
		/**** md5 signature: e99e3fc1e38815ab49b74d728dd9e02f ****/
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
		/**** md5 signature: 3379c25f3ba398be2e89122f4f69b0f4 ****/
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
		/**** md5 signature: 12c4967f27a0900e4176252164d2f2ce ****/
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
		/**** md5 signature: 5f86f29311549ab4117f93bc40487543 ****/
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
		/**** md5 signature: e66fc526c4232f21fb4238a81292d522 ****/
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
		/**** md5 signature: 0bd003567af5701968e49e623c3d113a ****/
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
		/**** md5 signature: 4f1ae44e92ff7b1da601b2ca71a3a58a ****/
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
		/**** md5 signature: df8744d729e050a65ee65230eb199390 ****/
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
		/**** md5 signature: c028aee785b685956e8e7d5cba7ecb46 ****/
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
		/**** md5 signature: 7eca57e5a0ce16869c4831a889c43a11 ****/
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
		/**** md5 signature: a17e9c62e6e6ab1cb8c83307d7a48bda ****/
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
		/**** md5 signature: 45ee6a37cbc92ff06bd17b5653f32913 ****/
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
		/**** md5 signature: f8240fcf0b6b9600b917704130d03dc9 ****/
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
		/**** md5 signature: b3667af07c9a238180bc31cc15803f78 ****/
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
		/**** md5 signature: 5053222ade9605c7c37102310f06f2e8 ****/
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
		/**** md5 signature: ff6bc91d962e8f099a9d3eb38b271c1b ****/
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
		/**** md5 signature: 95276330078af4c40107723481c87bb4 ****/
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
		/**** md5 signature: 961290da84516159b8901f300dd3110d ****/
		%feature("compactdefaultargs") XDirection;
		%feature("autodoc", "Returns the 'xdirection' of <self>.

Returns
-------
gp_Dir
") XDirection;
		const gp_Dir XDirection();

		/****************** XReverse ******************/
		/**** md5 signature: a59a0d5ce809b327255e8a5583570409 ****/
		%feature("compactdefaultargs") XReverse;
		%feature("autodoc", "Reverses the x direction of <self>.

Returns
-------
None
") XReverse;
		void XReverse();

		/****************** YDirection ******************/
		/**** md5 signature: cc21cc9ed5abd09b9e251302c66ef4f2 ****/
		%feature("compactdefaultargs") YDirection;
		%feature("autodoc", "Returns the 'ydirection' of <self>.

Returns
-------
gp_Dir
") YDirection;
		const gp_Dir YDirection();

		/****************** YReverse ******************/
		/**** md5 signature: 25ff312ffbe13c5be8bd85f4c2e7817f ****/
		%feature("compactdefaultargs") YReverse;
		%feature("autodoc", "Reverses the y direction of <self>.

Returns
-------
None
") YReverse;
		void YReverse();

		/****************** ZReverse ******************/
		/**** md5 signature: 9915b1a450300177dd75f9fae2dc2f75 ****/
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
		/**** md5 signature: 6efafd0c8f6f99ecc53e37140d53b7ca ****/
		%feature("compactdefaultargs") gp_Circ;
		%feature("autodoc", "Creates an indefinite circle.

Returns
-------
None
") gp_Circ;
		 gp_Circ();

		/****************** gp_Circ ******************/
		/**** md5 signature: b560c3375982e5d3aae0d5f8918ec935 ****/
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
		/**** md5 signature: a514cbcf0bd2f53e9374f58dcecded92 ****/
		%feature("compactdefaultargs") Area;
		%feature("autodoc", "Computes the area of the circle.

Returns
-------
float
") Area;
		Standard_Real Area();

		/****************** Axis ******************/
		/**** md5 signature: cb9b52ff887b682f8bfc1eb2f646705a ****/
		%feature("compactdefaultargs") Axis;
		%feature("autodoc", "Returns the main axis of the circle. it is the axis perpendicular to the plane of the circle, passing through the 'location' point (center) of the circle.

Returns
-------
gp_Ax1
") Axis;
		const gp_Ax1 Axis();

		/****************** Contains ******************/
		/**** md5 signature: 4617c578d595c204f331df6213e3ae4a ****/
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
		/**** md5 signature: d9ba17ce87a8f8e1c8805850d4d732ba ****/
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
		/**** md5 signature: 7a11021be5ff74a321b964da373ca8bd ****/
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "Computes the circumference of the circle.

Returns
-------
float
") Length;
		Standard_Real Length();

		/****************** Location ******************/
		/**** md5 signature: 42040ad2ed401b7e80bf90e4b6b5f418 ****/
		%feature("compactdefaultargs") Location;
		%feature("autodoc", "Returns the center of the circle. it is the 'location' point of the local coordinate system of the circle.

Returns
-------
gp_Pnt
") Location;
		const gp_Pnt Location();

		/****************** Mirror ******************/
		/**** md5 signature: b133f2e6e1c74f672a216a0094bdfda6 ****/
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
		/**** md5 signature: d1a0189a98d756bd9e5b51b4ae49992a ****/
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
		/**** md5 signature: 874cde0169043be133e205e960c3ca57 ****/
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
		/**** md5 signature: 32916670d972b0097467f6f81875ef01 ****/
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
		/**** md5 signature: c0652096ea5891063833f57104a91d53 ****/
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
		/**** md5 signature: 94b9ea424d4b06fa18648a7f13c852c7 ****/
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
		/**** md5 signature: 4998eb006d0dfaf45366e64da028e2d8 ****/
		%feature("compactdefaultargs") Position;
		%feature("autodoc", "Returns the position of the circle. it is the local coordinate system of the circle.

Returns
-------
gp_Ax2
") Position;
		const gp_Ax2 Position();

		/****************** Radius ******************/
		/**** md5 signature: 506a8dc1140a54bd4146c24bb5357fbf ****/
		%feature("compactdefaultargs") Radius;
		%feature("autodoc", "Returns the radius of this circle.

Returns
-------
float
") Radius;
		Standard_Real Radius();

		/****************** Rotate ******************/
		/**** md5 signature: 12c4967f27a0900e4176252164d2f2ce ****/
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
		/**** md5 signature: d29198aa8896dda042847c5a54cfcf85 ****/
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
		/**** md5 signature: e66fc526c4232f21fb4238a81292d522 ****/
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
		/**** md5 signature: a7543226b13402b6a4209acf795db108 ****/
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
		/**** md5 signature: 4f1ae44e92ff7b1da601b2ca71a3a58a ****/
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
		/**** md5 signature: c028aee785b685956e8e7d5cba7ecb46 ****/
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
		/**** md5 signature: 370491d423dd18be72ddbe9a7e5a5d72 ****/
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
		/**** md5 signature: 021f3150e83db7a660562352251b37b0 ****/
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
		/**** md5 signature: 382f20ab66f794f70a8fbaad3ecad14c ****/
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
		/**** md5 signature: 45ee6a37cbc92ff06bd17b5653f32913 ****/
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
		/**** md5 signature: c01d3f0f7d69b81caf3492954db9dc94 ****/
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
		/**** md5 signature: b3667af07c9a238180bc31cc15803f78 ****/
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
		/**** md5 signature: 5053222ade9605c7c37102310f06f2e8 ****/
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
		/**** md5 signature: 5da4aba8d1300ccfbd2887afab3b9b94 ****/
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
		/**** md5 signature: 718667671355fb3f099fffc7a9400f5c ****/
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
		/**** md5 signature: 33f98d138ae3ce92d202330aa4ae814d ****/
		%feature("compactdefaultargs") XAxis;
		%feature("autodoc", "Returns the 'xaxis' of the circle. this axis is perpendicular to the axis of the conic. this axis and the 'yaxis' define the plane of the conic.

Returns
-------
gp_Ax1
") XAxis;
		gp_Ax1 XAxis();

		/****************** YAxis ******************/
		/**** md5 signature: b471d966aca0b452073c5d55f8f5e027 ****/
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
		/**** md5 signature: 6ca5dd11332453e12292665a231cb5ef ****/
		%feature("compactdefaultargs") gp_Circ2d;
		%feature("autodoc", "Creates an indefinite circle.

Returns
-------
None
") gp_Circ2d;
		 gp_Circ2d();

		/****************** gp_Circ2d ******************/
		/**** md5 signature: fee8a57273837a8f1f6e4d96ebf47ebd ****/
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
		/**** md5 signature: 8d25db8c89bcbc1ee0bba323421c113e ****/
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
		/**** md5 signature: a514cbcf0bd2f53e9374f58dcecded92 ****/
		%feature("compactdefaultargs") Area;
		%feature("autodoc", "Computes the area of the circle.

Returns
-------
float
") Area;
		Standard_Real Area();

		/****************** Axis ******************/
		/**** md5 signature: 56ba1d39cb5b229cbbc254dbe68307ea ****/
		%feature("compactdefaultargs") Axis;
		%feature("autodoc", "Returns the position of the circle.

Returns
-------
gp_Ax22d
") Axis;
		const gp_Ax22d Axis();

		/****************** Coefficients ******************/
		/**** md5 signature: 2252ad010357f4e043a3c6dac4c3923c ****/
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
		/**** md5 signature: b5f4c6607c2df5e4dff0bd5cfe532775 ****/
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
		/**** md5 signature: eafbc4fbb17061433dcb80a2bf868650 ****/
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
		/**** md5 signature: e230b64eefbb898397296c5ca615d396 ****/
		%feature("compactdefaultargs") IsDirect;
		%feature("autodoc", "Returns true if the local coordinate system is direct and false in the other case.

Returns
-------
bool
") IsDirect;
		Standard_Boolean IsDirect();

		/****************** Length ******************/
		/**** md5 signature: 7a11021be5ff74a321b964da373ca8bd ****/
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "Computes the circumference of the circle.

Returns
-------
float
") Length;
		Standard_Real Length();

		/****************** Location ******************/
		/**** md5 signature: fbf774a3a1efe16540d680c0476bcbc8 ****/
		%feature("compactdefaultargs") Location;
		%feature("autodoc", "Returns the location point (center) of the circle.

Returns
-------
gp_Pnt2d
") Location;
		const gp_Pnt2d Location();

		/****************** Mirror ******************/
		/**** md5 signature: 5a90a3ec4faf7909390bb0bfb4d9be0f ****/
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
		/**** md5 signature: 8b8d921c1e87f73e8278c4d42ae298f7 ****/
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
		/**** md5 signature: 56e4695edcea39bd6e606e1779f45d7a ****/
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
		/**** md5 signature: f80d1ed612f77a66a7007f2972d11676 ****/
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
		/**** md5 signature: 345d379c8378049c9b2912713f5142d1 ****/
		%feature("compactdefaultargs") Position;
		%feature("autodoc", "Returns the position of the circle. idem axis(me).

Returns
-------
gp_Ax22d
") Position;
		const gp_Ax22d Position();

		/****************** Radius ******************/
		/**** md5 signature: 506a8dc1140a54bd4146c24bb5357fbf ****/
		%feature("compactdefaultargs") Radius;
		%feature("autodoc", "Returns the radius value of the circle.

Returns
-------
float
") Radius;
		Standard_Real Radius();

		/****************** Reverse ******************/
		/**** md5 signature: b751d6874fc026e19a7a6cb37e9ac1b4 ****/
		%feature("compactdefaultargs") Reverse;
		%feature("autodoc", "Reverses the orientation of the local coordinate system of this circle (the 'y direction' is reversed) and therefore changes the implicit orientation of this circle. reverse assigns the result to this circle,.

Returns
-------
None
") Reverse;
		void Reverse();

		/****************** Reversed ******************/
		/**** md5 signature: 03a7c5a065e85445047f4b8355bff9c3 ****/
		%feature("compactdefaultargs") Reversed;
		%feature("autodoc", "Reverses the orientation of the local coordinate system of this circle (the 'y direction' is reversed) and therefore changes the implicit orientation of this circle. reversed creates a new circle.

Returns
-------
gp_Circ2d
") Reversed;
		gp_Circ2d Reversed();

		/****************** Rotate ******************/
		/**** md5 signature: 795edcbb32146eb6f071bea4c90f5cfd ****/
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
		/**** md5 signature: 34510d74cbb6a3e85ab97c6d5bebea35 ****/
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
		/**** md5 signature: 5b49a8aeffcacace07c66937f77f1e03 ****/
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
		/**** md5 signature: 3d681fd57b139c6aee38aee25bd23eb1 ****/
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
		/**** md5 signature: 016f6d0b52d2d85d5711abca672ca103 ****/
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
		/**** md5 signature: 368c9b8c039b553e22ee650e75e4d404 ****/
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
		/**** md5 signature: 021f3150e83db7a660562352251b37b0 ****/
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
		/**** md5 signature: ec66b4bfc97a7a2706907f916a07745f ****/
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
		/**** md5 signature: f0f5b973b3cd13921764c845a5c4cc95 ****/
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
		/**** md5 signature: 235c49cb5ac12c3b838afde8f85743f4 ****/
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
		/**** md5 signature: dace16a29a39216c0dd584c6964e840b ****/
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
		/**** md5 signature: bbc7f3de544690652001e620d3f9058b ****/
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
		/**** md5 signature: 1cd2e000b85692a9f89a6bf8e8e4782c ****/
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
		/**** md5 signature: c7768f1dcf9b6595f2bd4653737544f9 ****/
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
		/**** md5 signature: d835450a57f2c2b8f88c217fa166e9e7 ****/
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
		/**** md5 signature: 1046d1e58ad9f959d0d7922e750000d5 ****/
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
		/**** md5 signature: 5bcd651b87069885e2b5ecad2bd89992 ****/
		%feature("compactdefaultargs") XAxis;
		%feature("autodoc", "Returns the x axis of the circle.

Returns
-------
gp_Ax2d
") XAxis;
		gp_Ax2d XAxis();

		/****************** YAxis ******************/
		/**** md5 signature: 1e80565ed75c7e231792089b80d7c873 ****/
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
		/**** md5 signature: 12b92dfe4f1239cf38f08e253288ed43 ****/
		%feature("compactdefaultargs") gp_Cone;
		%feature("autodoc", "Creates an indefinite cone.

Returns
-------
None
") gp_Cone;
		 gp_Cone();

		/****************** gp_Cone ******************/
		/**** md5 signature: 526badaac893b57eb9504e32ff1a4b37 ****/
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
		/**** md5 signature: 4b3f8494dd9ac086de8c6d241abd07f8 ****/
		%feature("compactdefaultargs") Apex;
		%feature("autodoc", "Computes the cone's top. the apex of the cone is on the negative side of the symmetry axis of the cone.

Returns
-------
gp_Pnt
") Apex;
		gp_Pnt Apex();

		/****************** Axis ******************/
		/**** md5 signature: cb9b52ff887b682f8bfc1eb2f646705a ****/
		%feature("compactdefaultargs") Axis;
		%feature("autodoc", "Returns the symmetry axis of the cone.

Returns
-------
gp_Ax1
") Axis;
		const gp_Ax1 Axis();

		/****************** Coefficients ******************/
		/**** md5 signature: 922ffb066c913dfb924eafd175a6358f ****/
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
		/**** md5 signature: 33e4e96f61de8e23c989d6f9aec7d457 ****/
		%feature("compactdefaultargs") Direct;
		%feature("autodoc", "Returns true if the local coordinate system of this cone is right-handed.

Returns
-------
bool
") Direct;
		Standard_Boolean Direct();

		/****************** Location ******************/
		/**** md5 signature: 42040ad2ed401b7e80bf90e4b6b5f418 ****/
		%feature("compactdefaultargs") Location;
		%feature("autodoc", "Returns the 'location' point of the cone.

Returns
-------
gp_Pnt
") Location;
		const gp_Pnt Location();

		/****************** Mirror ******************/
		/**** md5 signature: b133f2e6e1c74f672a216a0094bdfda6 ****/
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
		/**** md5 signature: d1a0189a98d756bd9e5b51b4ae49992a ****/
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
		/**** md5 signature: 874cde0169043be133e205e960c3ca57 ****/
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
		/**** md5 signature: 798080970ed2c16220271096fbb45659 ****/
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
		/**** md5 signature: d7124ba2a5e40edda27d7388cbf77348 ****/
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
		/**** md5 signature: 1f25101b9654e27dc01e12ba7c875ad8 ****/
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
		/**** md5 signature: 68613464f15b3681020927244b13614a ****/
		%feature("compactdefaultargs") Position;
		%feature("autodoc", "Returns the local coordinates system of the cone.

Returns
-------
gp_Ax3
") Position;
		const gp_Ax3 Position();

		/****************** RefRadius ******************/
		/**** md5 signature: c2dd1bdf66e360705fa187fafdaf00a1 ****/
		%feature("compactdefaultargs") RefRadius;
		%feature("autodoc", "Returns the radius of the cone in the reference plane.

Returns
-------
float
") RefRadius;
		Standard_Real RefRadius();

		/****************** Rotate ******************/
		/**** md5 signature: 12c4967f27a0900e4176252164d2f2ce ****/
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
		/**** md5 signature: a48230d8440101f7bfabc3a76c343089 ****/
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
		/**** md5 signature: e66fc526c4232f21fb4238a81292d522 ****/
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
		/**** md5 signature: 7aa4fe42661bd5c1029f2e4f76595017 ****/
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
		/**** md5 signature: a49ed9cc6318be7aa50219450c80bb02 ****/
		%feature("compactdefaultargs") SemiAngle;
		%feature("autodoc", "Returns the half-angle at the apex of this cone. attention! semi-angle can be negative.

Returns
-------
float
") SemiAngle;
		Standard_Real SemiAngle();

		/****************** SetAxis ******************/
		/**** md5 signature: 4f1ae44e92ff7b1da601b2ca71a3a58a ****/
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
		/**** md5 signature: e697bd81202b5a89ce79ee03acd13d7c ****/
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
		/**** md5 signature: a135fc8d2ccb75941a304eed1c57e31d ****/
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
		/**** md5 signature: 452d48523583bd00e647880614077dd6 ****/
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
		/**** md5 signature: 36b463d2613106dd0747eaeb6783e4fc ****/
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
		/**** md5 signature: 45ee6a37cbc92ff06bd17b5653f32913 ****/
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
		/**** md5 signature: 8863d292c7762d4a369a01450dcad0a0 ****/
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
		/**** md5 signature: b3667af07c9a238180bc31cc15803f78 ****/
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
		/**** md5 signature: 5053222ade9605c7c37102310f06f2e8 ****/
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
		/**** md5 signature: fc1abd3ea5f4af39706968892a3f41c1 ****/
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
		/**** md5 signature: 245cf94df35a0cdd5764393862fc57a7 ****/
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
		/**** md5 signature: abf35d5ee439e7b6d5054caae87282cf ****/
		%feature("compactdefaultargs") UReverse;
		%feature("autodoc", "Reverses the u parametrization of the cone reversing the yaxis.

Returns
-------
None
") UReverse;
		void UReverse();

		/****************** VReverse ******************/
		/**** md5 signature: 01a05d129bc344a1e2870352e479923d ****/
		%feature("compactdefaultargs") VReverse;
		%feature("autodoc", "Reverses the v parametrization of the cone reversing the zaxis.

Returns
-------
None
") VReverse;
		void VReverse();

		/****************** XAxis ******************/
		/**** md5 signature: 33f98d138ae3ce92d202330aa4ae814d ****/
		%feature("compactdefaultargs") XAxis;
		%feature("autodoc", "Returns the xaxis of the reference plane.

Returns
-------
gp_Ax1
") XAxis;
		gp_Ax1 XAxis();

		/****************** YAxis ******************/
		/**** md5 signature: b471d966aca0b452073c5d55f8f5e027 ****/
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
		/**** md5 signature: 406430509bd2ac08dfd8c6361beeda1e ****/
		%feature("compactdefaultargs") gp_Cylinder;
		%feature("autodoc", "Creates a indefinite cylinder.

Returns
-------
None
") gp_Cylinder;
		 gp_Cylinder();

		/****************** gp_Cylinder ******************/
		/**** md5 signature: 053d36b95d2130f39b7829af0fa80cb6 ****/
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
		/**** md5 signature: cb9b52ff887b682f8bfc1eb2f646705a ****/
		%feature("compactdefaultargs") Axis;
		%feature("autodoc", "Returns the symmetry axis of the cylinder.

Returns
-------
gp_Ax1
") Axis;
		const gp_Ax1 Axis();

		/****************** Coefficients ******************/
		/**** md5 signature: 922ffb066c913dfb924eafd175a6358f ****/
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
		/**** md5 signature: 33e4e96f61de8e23c989d6f9aec7d457 ****/
		%feature("compactdefaultargs") Direct;
		%feature("autodoc", "Returns true if the local coordinate system of this cylinder is right-handed.

Returns
-------
bool
") Direct;
		Standard_Boolean Direct();

		/****************** Location ******************/
		/**** md5 signature: 42040ad2ed401b7e80bf90e4b6b5f418 ****/
		%feature("compactdefaultargs") Location;
		%feature("autodoc", "Returns the 'location' point of the cylinder.

Returns
-------
gp_Pnt
") Location;
		const gp_Pnt Location();

		/****************** Mirror ******************/
		/**** md5 signature: b133f2e6e1c74f672a216a0094bdfda6 ****/
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
		/**** md5 signature: d1a0189a98d756bd9e5b51b4ae49992a ****/
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
		/**** md5 signature: 874cde0169043be133e205e960c3ca57 ****/
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
		/**** md5 signature: de3a6dbb82960a2d9ca50f4922c94a9e ****/
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
		/**** md5 signature: d363f488a293489f62fd6b6a17c627a7 ****/
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
		/**** md5 signature: 90381b8362fef1a6c62e7c2314d42d90 ****/
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
		/**** md5 signature: 68613464f15b3681020927244b13614a ****/
		%feature("compactdefaultargs") Position;
		%feature("autodoc", "Returns the local coordinate system of the cylinder.

Returns
-------
gp_Ax3
") Position;
		const gp_Ax3 Position();

		/****************** Radius ******************/
		/**** md5 signature: 506a8dc1140a54bd4146c24bb5357fbf ****/
		%feature("compactdefaultargs") Radius;
		%feature("autodoc", "Returns the radius of the cylinder.

Returns
-------
float
") Radius;
		Standard_Real Radius();

		/****************** Rotate ******************/
		/**** md5 signature: 12c4967f27a0900e4176252164d2f2ce ****/
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
		/**** md5 signature: 67c373e30b51f6ff2ca307d0f140d00c ****/
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
		/**** md5 signature: e66fc526c4232f21fb4238a81292d522 ****/
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
		/**** md5 signature: 8883de195f1ad83a4a1952204f4d10b7 ****/
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
		/**** md5 signature: 4f1ae44e92ff7b1da601b2ca71a3a58a ****/
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
		/**** md5 signature: e697bd81202b5a89ce79ee03acd13d7c ****/
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
		/**** md5 signature: a135fc8d2ccb75941a304eed1c57e31d ****/
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
		/**** md5 signature: 452d48523583bd00e647880614077dd6 ****/
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
		/**** md5 signature: 45ee6a37cbc92ff06bd17b5653f32913 ****/
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
		/**** md5 signature: af4587d9cbf6fe0bbd45826d0d926adf ****/
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
		/**** md5 signature: b3667af07c9a238180bc31cc15803f78 ****/
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
		/**** md5 signature: 5053222ade9605c7c37102310f06f2e8 ****/
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
		/**** md5 signature: b959c170b2d47bada51d1679cb9e9fec ****/
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
		/**** md5 signature: 7fbc18ac7e9734baa3ea12f54b9b2a34 ****/
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
		/**** md5 signature: abf35d5ee439e7b6d5054caae87282cf ****/
		%feature("compactdefaultargs") UReverse;
		%feature("autodoc", "Reverses the u parametrization of the cylinder reversing the yaxis.

Returns
-------
None
") UReverse;
		void UReverse();

		/****************** VReverse ******************/
		/**** md5 signature: 01a05d129bc344a1e2870352e479923d ****/
		%feature("compactdefaultargs") VReverse;
		%feature("autodoc", "Reverses the v parametrization of the plane reversing the axis.

Returns
-------
None
") VReverse;
		void VReverse();

		/****************** XAxis ******************/
		/**** md5 signature: 33f98d138ae3ce92d202330aa4ae814d ****/
		%feature("compactdefaultargs") XAxis;
		%feature("autodoc", "Returns the axis x of the cylinder.

Returns
-------
gp_Ax1
") XAxis;
		gp_Ax1 XAxis();

		/****************** YAxis ******************/
		/**** md5 signature: b471d966aca0b452073c5d55f8f5e027 ****/
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
		/**** md5 signature: d0e68d6b98abb3008f385f57f7ddadba ****/
		%feature("compactdefaultargs") gp_Dir;
		%feature("autodoc", "Creates a direction corresponding to x axis.

Returns
-------
None
") gp_Dir;
		 gp_Dir();

		/****************** gp_Dir ******************/
		/**** md5 signature: 5c1d59ab1447d0abe495931655ab99e9 ****/
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
		/**** md5 signature: 5abc88f8173aab8316c9a76958048160 ****/
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
		/**** md5 signature: c4d3d086c0c3ebe59e0febe0eabb5e89 ****/
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
		/**** md5 signature: 6ed05f0efdf7135200b38e7a7495867a ****/
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
		/**** md5 signature: 6149e19647e569ca678d4f40c4fc45d9 ****/
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
		/**** md5 signature: 615686a863135af4177d92a1b696f909 ****/
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
		/**** md5 signature: c21dee938f2596ca1071e28c84295612 ****/
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
		/**** md5 signature: a12b2ab97fcf5b89f967f68126efa9d5 ****/
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
		/**** md5 signature: 54d74dc624fb3d754a9e98dea0b915e7 ****/
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
		/**** md5 signature: 57b300d66eb8301cfdbba326bdf8e188 ****/
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
		/**** md5 signature: eb1b18256522e0fdbea2d977184c73a8 ****/
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
		/**** md5 signature: 949cea512e7eb7015cff944f885ef39e ****/
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
		/**** md5 signature: 4ea8ae53d7223d1ccc1a2f694009a306 ****/
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
		/**** md5 signature: 9bd10523f960cee618dbe142c29feac0 ****/
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
		/**** md5 signature: 7bd7f951751c87cc7d3cb0a585ee2d01 ****/
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
		/**** md5 signature: ea2cc39f7205d0c8581d915c4fb32056 ****/
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
		/**** md5 signature: 067e7e6f5aa5f47ec960ca5bd0432cda ****/
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
		/**** md5 signature: ae7c0411fdd0377438bcccd31fef2186 ****/
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
		/**** md5 signature: d1a0189a98d756bd9e5b51b4ae49992a ****/
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
		/**** md5 signature: 874cde0169043be133e205e960c3ca57 ****/
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
		/**** md5 signature: 02c73be4aabfee2d794566cbfa37b007 ****/
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
		/**** md5 signature: b3b209caacaaa4009ff77d7f85a5d508 ****/
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
		/**** md5 signature: fa0555cb7b8a07e042043accf1bfa8c4 ****/
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
		/**** md5 signature: b751d6874fc026e19a7a6cb37e9ac1b4 ****/
		%feature("compactdefaultargs") Reverse;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Reverse;
		void Reverse();

		/****************** Reversed ******************/
		/**** md5 signature: 1ba812456f0b4eaab476fe1d0cf29322 ****/
		%feature("compactdefaultargs") Reversed;
		%feature("autodoc", "Reverses the orientation of a direction geometric transformations performs the symmetrical transformation of a direction with respect to the direction v which is the center of the symmetry.].

Returns
-------
gp_Dir
") Reversed;
		gp_Dir Reversed();

		/****************** Rotate ******************/
		/**** md5 signature: 12c4967f27a0900e4176252164d2f2ce ****/
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
		/**** md5 signature: 937d66eff6ed1208f993c0e6a4deb1ed ****/
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
		/**** md5 signature: 6a7aba643afced1a67b8420fce55034e ****/
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
		/**** md5 signature: 535398862a18988c21af008f70ee6ea3 ****/
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
		/**** md5 signature: 30fe204d4c67d94370133e1d40dc6787 ****/
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
		/**** md5 signature: 970583a1db197d138846d12b1374d359 ****/
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
		/**** md5 signature: 8f42f770a3959dece2671d90f60e35e2 ****/
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
		/**** md5 signature: d96a64d9a788ed7bdd745a3dcbb831ea ****/
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
		/**** md5 signature: 45ee6a37cbc92ff06bd17b5653f32913 ****/
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
		/**** md5 signature: 1056bea1a5bada84ef2b22911d48cfb9 ****/
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
		/**** md5 signature: 2dbf42f7dc56303f104fb0fa585dc6e6 ****/
		%feature("compactdefaultargs") X;
		%feature("autodoc", "Returns the x coordinate for a unit vector.

Returns
-------
float
") X;
		Standard_Real X();

		/****************** XYZ ******************/
		/**** md5 signature: ad2670b5502d8f29f92f756fdb200090 ****/
		%feature("compactdefaultargs") XYZ;
		%feature("autodoc", "For this unit vector, returns its three coordinates as a number triplea.

Returns
-------
gp_XYZ
") XYZ;
		const gp_XYZ XYZ();

		/****************** Y ******************/
		/**** md5 signature: 7fd17991f11a9702e525c7070ce7cec6 ****/
		%feature("compactdefaultargs") Y;
		%feature("autodoc", "Returns the y coordinate for a unit vector.

Returns
-------
float
") Y;
		Standard_Real Y();

		/****************** Z ******************/
		/**** md5 signature: 87b89b9e016f37b0146cf52868684676 ****/
		%feature("compactdefaultargs") Z;
		%feature("autodoc", "Returns the z coordinate for a unit vector.

Returns
-------
float
") Z;
		Standard_Real Z();

		/****************** operator * ******************/
		/**** md5 signature: 84dcbab84ad34d366bc9d60517fc2a5e ****/
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
		/**** md5 signature: edcd14a5e53746d4bdebf14f5cb01e64 ****/
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
		/**** md5 signature: d95d61fe5b1b7a3e24d176f773dd1a15 ****/
		%feature("compactdefaultargs") gp_Dir2d;
		%feature("autodoc", "Creates a direction corresponding to x axis.

Returns
-------
None
") gp_Dir2d;
		 gp_Dir2d();

		/****************** gp_Dir2d ******************/
		/**** md5 signature: 51772ddc6398f55bd5cbabca760a96ef ****/
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
		/**** md5 signature: d869d4dbfcf007e1aa2f76bfc2d58ebf ****/
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
		/**** md5 signature: d6be9452b4b59fc53227a2b841950eaa ****/
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
		/**** md5 signature: 4d5e7bcb23d4735b41ba3996fe5902d5 ****/
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
		/**** md5 signature: 615686a863135af4177d92a1b696f909 ****/
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
		/**** md5 signature: b8a284c811b6527ab91769eb2ef6424d ****/
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
		/**** md5 signature: 6cadfb48997ffa3207b7a07f13d00d49 ****/
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
		/**** md5 signature: e5f049f0fd4208377741c120c7894b80 ****/
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
		/**** md5 signature: c2d8852909e1955d337b5fbac80c68ce ****/
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
		/**** md5 signature: 707d70a1ad927fee333f826f0c6af34e ****/
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
		/**** md5 signature: 3633109ee23b9badc52069f87a88f5d3 ****/
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
		/**** md5 signature: 9bc9a4a8ed05787ed107a6745d9f299e ****/
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
		/**** md5 signature: b8208fe0cfdd808a6b726408c89c6dd2 ****/
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
		/**** md5 signature: 8b8d921c1e87f73e8278c4d42ae298f7 ****/
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
		/**** md5 signature: 8f721721ff275b5891e8678a176a017e ****/
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
		/**** md5 signature: 9a74e8fc078ab5b6ad543b185b380f72 ****/
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
		/**** md5 signature: b751d6874fc026e19a7a6cb37e9ac1b4 ****/
		%feature("compactdefaultargs") Reverse;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Reverse;
		void Reverse();

		/****************** Reversed ******************/
		/**** md5 signature: b2216175e6c33d80742cc89e6a46baaa ****/
		%feature("compactdefaultargs") Reversed;
		%feature("autodoc", "Reverses the orientation of a direction.

Returns
-------
gp_Dir2d
") Reversed;
		gp_Dir2d Reversed();

		/****************** Rotate ******************/
		/**** md5 signature: 1f5728589a1f78e2418cd03d8bfa9e86 ****/
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
		/**** md5 signature: 3b44d4c94288262e05c5e47e14539158 ****/
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
		/**** md5 signature: 6a7aba643afced1a67b8420fce55034e ****/
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
		/**** md5 signature: 89ebec90371b06b65c615274fc32dbb5 ****/
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
		/**** md5 signature: 30fe204d4c67d94370133e1d40dc6787 ****/
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
		/**** md5 signature: 6c2893a57a740cb14668b2ad98f8f8f8 ****/
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
		/**** md5 signature: 8f42f770a3959dece2671d90f60e35e2 ****/
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
		/**** md5 signature: dace16a29a39216c0dd584c6964e840b ****/
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
		/**** md5 signature: bf915e60faf86f092b7a51bac08f9e45 ****/
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
		/**** md5 signature: 2dbf42f7dc56303f104fb0fa585dc6e6 ****/
		%feature("compactdefaultargs") X;
		%feature("autodoc", "For this unit vector, returns its x coordinate.

Returns
-------
float
") X;
		Standard_Real X();

		/****************** XY ******************/
		/**** md5 signature: 0572c9669063bef343b6bffa656e7e3a ****/
		%feature("compactdefaultargs") XY;
		%feature("autodoc", "For this unit vector, returns its two coordinates as a number pair. comparison between directions the precision value is an input data.

Returns
-------
gp_XY
") XY;
		const gp_XY XY();

		/****************** Y ******************/
		/**** md5 signature: 7fd17991f11a9702e525c7070ce7cec6 ****/
		%feature("compactdefaultargs") Y;
		%feature("autodoc", "For this unit vector, returns its y coordinate.

Returns
-------
float
") Y;
		Standard_Real Y();

		/****************** operator * ******************/
		/**** md5 signature: 0207b56c87d0d37308d11b7183f16352 ****/
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
		/**** md5 signature: d02d0251cfab53caf477f39aaaf94353 ****/
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
		/**** md5 signature: 70a91ec0800e7cd9534e43f95e9bbf2c ****/
		%feature("compactdefaultargs") gp_Elips;
		%feature("autodoc", "Creates an indefinite ellipse.

Returns
-------
None
") gp_Elips;
		 gp_Elips();

		/****************** gp_Elips ******************/
		/**** md5 signature: f810b5d227c35f14437acbea3845b817 ****/
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
		/**** md5 signature: a514cbcf0bd2f53e9374f58dcecded92 ****/
		%feature("compactdefaultargs") Area;
		%feature("autodoc", "Computes the area of the ellipse.

Returns
-------
float
") Area;
		Standard_Real Area();

		/****************** Axis ******************/
		/**** md5 signature: cb9b52ff887b682f8bfc1eb2f646705a ****/
		%feature("compactdefaultargs") Axis;
		%feature("autodoc", "Computes the axis normal to the plane of the ellipse.

Returns
-------
gp_Ax1
") Axis;
		const gp_Ax1 Axis();

		/****************** Directrix1 ******************/
		/**** md5 signature: 10272c6052549861204070aa44f046a5 ****/
		%feature("compactdefaultargs") Directrix1;
		%feature("autodoc", "Computes the first or second directrix of this ellipse. these are the lines, in the plane of the ellipse, normal to the major axis, at a distance equal to majorradius/e from the center of the ellipse, where e is the eccentricity of the ellipse. the first directrix (directrix1) is on the positive side of the major axis. the second directrix (directrix2) is on the negative side. the directrix is returned as an axis (gp_ax1 object), the origin of which is situated on the 'x axis' of the local coordinate system of this ellipse. exceptions standard_constructionerror if the eccentricity is null (the ellipse has degenerated into a circle).

Returns
-------
gp_Ax1
") Directrix1;
		gp_Ax1 Directrix1();

		/****************** Directrix2 ******************/
		/**** md5 signature: 88339a214155f2a41d76691fd00c9167 ****/
		%feature("compactdefaultargs") Directrix2;
		%feature("autodoc", "This line is obtained by the symmetrical transformation of 'directrix1' with respect to the 'yaxis' of the ellipse. exceptions standard_constructionerror if the eccentricity is null (the ellipse has degenerated into a circle).

Returns
-------
gp_Ax1
") Directrix2;
		gp_Ax1 Directrix2();

		/****************** Eccentricity ******************/
		/**** md5 signature: 78de488c9cbac7c761a28f28e3d39522 ****/
		%feature("compactdefaultargs") Eccentricity;
		%feature("autodoc", "Returns the eccentricity of the ellipse between 0.0 and 1.0 if f is the distance between the center of the ellipse and the focus1 then the eccentricity e = f / majorradius. raises constructionerror if majorradius = 0.0.

Returns
-------
float
") Eccentricity;
		Standard_Real Eccentricity();

		/****************** Focal ******************/
		/**** md5 signature: 36c97a85b2e31ded83d59428f0f74c3c ****/
		%feature("compactdefaultargs") Focal;
		%feature("autodoc", "Computes the focal distance. it is the distance between the two focus focus1 and focus2 of the ellipse.

Returns
-------
float
") Focal;
		Standard_Real Focal();

		/****************** Focus1 ******************/
		/**** md5 signature: 44668390e44007b6344ae1f20fcc3003 ****/
		%feature("compactdefaultargs") Focus1;
		%feature("autodoc", "Returns the first focus of the ellipse. this focus is on the positive side of the 'xaxis' of the ellipse.

Returns
-------
gp_Pnt
") Focus1;
		gp_Pnt Focus1();

		/****************** Focus2 ******************/
		/**** md5 signature: 19e89a037d2bd912a8348a9c245bd935 ****/
		%feature("compactdefaultargs") Focus2;
		%feature("autodoc", "Returns the second focus of the ellipse. this focus is on the negative side of the 'xaxis' of the ellipse.

Returns
-------
gp_Pnt
") Focus2;
		gp_Pnt Focus2();

		/****************** Location ******************/
		/**** md5 signature: 42040ad2ed401b7e80bf90e4b6b5f418 ****/
		%feature("compactdefaultargs") Location;
		%feature("autodoc", "Returns the center of the ellipse. it is the 'location' point of the coordinate system of the ellipse.

Returns
-------
gp_Pnt
") Location;
		const gp_Pnt Location();

		/****************** MajorRadius ******************/
		/**** md5 signature: e961bb81456f4d0a6154d0e9401e1ce8 ****/
		%feature("compactdefaultargs") MajorRadius;
		%feature("autodoc", "Returns the major radius of the ellipse.

Returns
-------
float
") MajorRadius;
		Standard_Real MajorRadius();

		/****************** MinorRadius ******************/
		/**** md5 signature: e1383e2287a25901af1e2b42cc95af4d ****/
		%feature("compactdefaultargs") MinorRadius;
		%feature("autodoc", "Returns the minor radius of the ellipse.

Returns
-------
float
") MinorRadius;
		Standard_Real MinorRadius();

		/****************** Mirror ******************/
		/**** md5 signature: b133f2e6e1c74f672a216a0094bdfda6 ****/
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
		/**** md5 signature: d1a0189a98d756bd9e5b51b4ae49992a ****/
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
		/**** md5 signature: 874cde0169043be133e205e960c3ca57 ****/
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
		/**** md5 signature: 42ed037d62d13064fe73a2782115a301 ****/
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
		/**** md5 signature: 9ba2ffb65754e8bc7158eaf27c63df92 ****/
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
		/**** md5 signature: c46e748d1b01d0c1f47d0723b22125bc ****/
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
		/**** md5 signature: ecccdeaeaa0deed24f47e61ad75d24f1 ****/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "Returns p = (1 - e * e) * majorradius where e is the eccentricity of the ellipse. returns 0 if majorradius = 0.

Returns
-------
float
") Parameter;
		Standard_Real Parameter();

		/****************** Position ******************/
		/**** md5 signature: 4998eb006d0dfaf45366e64da028e2d8 ****/
		%feature("compactdefaultargs") Position;
		%feature("autodoc", "Returns the coordinate system of the ellipse.

Returns
-------
gp_Ax2
") Position;
		const gp_Ax2 Position();

		/****************** Rotate ******************/
		/**** md5 signature: 12c4967f27a0900e4176252164d2f2ce ****/
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
		/**** md5 signature: aa10e38e09f4bd0f180e0223861fe10c ****/
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
		/**** md5 signature: e66fc526c4232f21fb4238a81292d522 ****/
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
		/**** md5 signature: 31a094bddec3e24dbed1653e7f93622c ****/
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
		/**** md5 signature: 4f1ae44e92ff7b1da601b2ca71a3a58a ****/
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
		/**** md5 signature: c028aee785b685956e8e7d5cba7ecb46 ****/
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
		/**** md5 signature: 5b6d39118ca624402ca904f240869d93 ****/
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
		/**** md5 signature: 55b33932324c77b3c1e82a433bb9350f ****/
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
		/**** md5 signature: 370491d423dd18be72ddbe9a7e5a5d72 ****/
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
		/**** md5 signature: 45ee6a37cbc92ff06bd17b5653f32913 ****/
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
		/**** md5 signature: 0aff90d868de1e28e04db58cb917f057 ****/
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
		/**** md5 signature: b3667af07c9a238180bc31cc15803f78 ****/
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
		/**** md5 signature: 5053222ade9605c7c37102310f06f2e8 ****/
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
		/**** md5 signature: 828523c632360a3b03ffc95e9a81e631 ****/
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
		/**** md5 signature: c03cc9a88dbb937a2849467a3bb9c03f ****/
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
		/**** md5 signature: 33f98d138ae3ce92d202330aa4ae814d ****/
		%feature("compactdefaultargs") XAxis;
		%feature("autodoc", "Returns the 'xaxis' of the ellipse whose origin is the center of this ellipse. it is the major axis of the ellipse.

Returns
-------
gp_Ax1
") XAxis;
		gp_Ax1 XAxis();

		/****************** YAxis ******************/
		/**** md5 signature: b471d966aca0b452073c5d55f8f5e027 ****/
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
		/**** md5 signature: 0cd695dc67863c68d90da95dd5d4db3c ****/
		%feature("compactdefaultargs") gp_Elips2d;
		%feature("autodoc", "Creates an indefinite ellipse.

Returns
-------
None
") gp_Elips2d;
		 gp_Elips2d();

		/****************** gp_Elips2d ******************/
		/**** md5 signature: 5d90c5d5e98ed2e94f1cb596748fe02c ****/
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
		/**** md5 signature: b27df7243fa0ca1797aba859e57cb553 ****/
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
		/**** md5 signature: a514cbcf0bd2f53e9374f58dcecded92 ****/
		%feature("compactdefaultargs") Area;
		%feature("autodoc", "Computes the area of the ellipse.

Returns
-------
float
") Area;
		Standard_Real Area();

		/****************** Axis ******************/
		/**** md5 signature: 56ba1d39cb5b229cbbc254dbe68307ea ****/
		%feature("compactdefaultargs") Axis;
		%feature("autodoc", "Returns the major axis of the ellipse.

Returns
-------
gp_Ax22d
") Axis;
		const gp_Ax22d Axis();

		/****************** Coefficients ******************/
		/**** md5 signature: 2252ad010357f4e043a3c6dac4c3923c ****/
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
		/**** md5 signature: fcbef2c85b670a856d4882ec13ce9c6f ****/
		%feature("compactdefaultargs") Directrix1;
		%feature("autodoc", "This directrix is the line normal to the xaxis of the ellipse in the local plane (z = 0) at a distance d = majorradius / e from the center of the ellipse, where e is the eccentricity of the ellipse. this line is parallel to the 'yaxis'. the intersection point between directrix1 and the 'xaxis' is the location point of the directrix1. this point is on the positive side of the 'xaxis'. //! raised if eccentricity = 0.0. (the ellipse degenerates into a circle).

Returns
-------
gp_Ax2d
") Directrix1;
		gp_Ax2d Directrix1();

		/****************** Directrix2 ******************/
		/**** md5 signature: 6932241de7dde0eb204208e30fe6363c ****/
		%feature("compactdefaultargs") Directrix2;
		%feature("autodoc", "This line is obtained by the symmetrical transformation of 'directrix1' with respect to the minor axis of the ellipse. //! raised if eccentricity = 0.0. (the ellipse degenerates into a circle).

Returns
-------
gp_Ax2d
") Directrix2;
		gp_Ax2d Directrix2();

		/****************** Eccentricity ******************/
		/**** md5 signature: 78de488c9cbac7c761a28f28e3d39522 ****/
		%feature("compactdefaultargs") Eccentricity;
		%feature("autodoc", "Returns the eccentricity of the ellipse between 0.0 and 1.0 if f is the distance between the center of the ellipse and the focus1 then the eccentricity e = f / majorradius. returns 0 if majorradius = 0.

Returns
-------
float
") Eccentricity;
		Standard_Real Eccentricity();

		/****************** Focal ******************/
		/**** md5 signature: 36c97a85b2e31ded83d59428f0f74c3c ****/
		%feature("compactdefaultargs") Focal;
		%feature("autodoc", "Returns the distance between the center of the ellipse and focus1 or focus2.

Returns
-------
float
") Focal;
		Standard_Real Focal();

		/****************** Focus1 ******************/
		/**** md5 signature: dccbe483b29092eb91431c64e1c5bcd9 ****/
		%feature("compactdefaultargs") Focus1;
		%feature("autodoc", "Returns the first focus of the ellipse. this focus is on the positive side of the major axis of the ellipse.

Returns
-------
gp_Pnt2d
") Focus1;
		gp_Pnt2d Focus1();

		/****************** Focus2 ******************/
		/**** md5 signature: ca24694273a9069fddac1db8a37c6c68 ****/
		%feature("compactdefaultargs") Focus2;
		%feature("autodoc", "Returns the second focus of the ellipse. this focus is on the negative side of the major axis of the ellipse.

Returns
-------
gp_Pnt2d
") Focus2;
		gp_Pnt2d Focus2();

		/****************** IsDirect ******************/
		/**** md5 signature: e230b64eefbb898397296c5ca615d396 ****/
		%feature("compactdefaultargs") IsDirect;
		%feature("autodoc", "Returns true if the local coordinate system is direct and false in the other case.

Returns
-------
bool
") IsDirect;
		Standard_Boolean IsDirect();

		/****************** Location ******************/
		/**** md5 signature: fbf774a3a1efe16540d680c0476bcbc8 ****/
		%feature("compactdefaultargs") Location;
		%feature("autodoc", "Returns the center of the ellipse.

Returns
-------
gp_Pnt2d
") Location;
		const gp_Pnt2d Location();

		/****************** MajorRadius ******************/
		/**** md5 signature: e961bb81456f4d0a6154d0e9401e1ce8 ****/
		%feature("compactdefaultargs") MajorRadius;
		%feature("autodoc", "Returns the major radius of the ellipse.

Returns
-------
float
") MajorRadius;
		Standard_Real MajorRadius();

		/****************** MinorRadius ******************/
		/**** md5 signature: e1383e2287a25901af1e2b42cc95af4d ****/
		%feature("compactdefaultargs") MinorRadius;
		%feature("autodoc", "Returns the minor radius of the ellipse.

Returns
-------
float
") MinorRadius;
		Standard_Real MinorRadius();

		/****************** Mirror ******************/
		/**** md5 signature: 5a90a3ec4faf7909390bb0bfb4d9be0f ****/
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
		/**** md5 signature: 8b8d921c1e87f73e8278c4d42ae298f7 ****/
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
		/**** md5 signature: d7c47f72461c1e23774db49e84e61c21 ****/
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
		/**** md5 signature: 57c7eb740b22de6e0e1429058269890f ****/
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
		/**** md5 signature: ecccdeaeaa0deed24f47e61ad75d24f1 ****/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "Returns p = (1 - e * e) * majorradius where e is the eccentricity of the ellipse. returns 0 if majorradius = 0.

Returns
-------
float
") Parameter;
		Standard_Real Parameter();

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
		/**** md5 signature: 646a9705a5846951deabdef03f9d5f58 ****/
		%feature("compactdefaultargs") Reversed;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Elips2d
") Reversed;
		gp_Elips2d Reversed();

		/****************** Rotate ******************/
		/**** md5 signature: 795edcbb32146eb6f071bea4c90f5cfd ****/
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
		/**** md5 signature: 3c9ea3e3c86084cbb9cad95e5f7b6f5d ****/
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
		/**** md5 signature: 5b49a8aeffcacace07c66937f77f1e03 ****/
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
		/**** md5 signature: 7168271c1fe1a01b68d1848d7a0a4271 ****/
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
		/**** md5 signature: 016f6d0b52d2d85d5711abca672ca103 ****/
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
		/**** md5 signature: 368c9b8c039b553e22ee650e75e4d404 ****/
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
		/**** md5 signature: 5b6d39118ca624402ca904f240869d93 ****/
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
		/**** md5 signature: 55b33932324c77b3c1e82a433bb9350f ****/
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
		/**** md5 signature: ec66b4bfc97a7a2706907f916a07745f ****/
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
		/**** md5 signature: f0f5b973b3cd13921764c845a5c4cc95 ****/
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
		/**** md5 signature: dace16a29a39216c0dd584c6964e840b ****/
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
		/**** md5 signature: f83dc56c7ba1efe3e4858dad480a8f4f ****/
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
		/**** md5 signature: 1cd2e000b85692a9f89a6bf8e8e4782c ****/
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
		/**** md5 signature: c7768f1dcf9b6595f2bd4653737544f9 ****/
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
		/**** md5 signature: 6d2dcf44ec33fadd05110f5d8f458817 ****/
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
		/**** md5 signature: 81f1dae966bde17156111d8cede730fb ****/
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
		/**** md5 signature: 5bcd651b87069885e2b5ecad2bd89992 ****/
		%feature("compactdefaultargs") XAxis;
		%feature("autodoc", "Returns the major axis of the ellipse.

Returns
-------
gp_Ax2d
") XAxis;
		gp_Ax2d XAxis();

		/****************** YAxis ******************/
		/**** md5 signature: 1e80565ed75c7e231792089b80d7c873 ****/
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
		/**** md5 signature: 5af682ea331c9109fd55e315f9e59a91 ****/
		%feature("compactdefaultargs") gp_GTrsf;
		%feature("autodoc", "Returns the identity transformation.

Returns
-------
None
") gp_GTrsf;
		 gp_GTrsf();

		/****************** gp_GTrsf ******************/
		/**** md5 signature: 195e8767eecf1e27947aab019ff8315c ****/
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
		/**** md5 signature: 973ae2615659d7b3049fc21bf8f215b2 ****/
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
		/**** md5 signature: 9bfbf058eebcd895fd3b29a4bba4ff05 ****/
		%feature("compactdefaultargs") Form;
		%feature("autodoc", "Returns the nature of the transformation. it can be an identity transformation, a rotation, a translation, a mirror transformation (relative to a point, an axis or a plane), a scaling transformation, a compound transformation or some other type of transformation.

Returns
-------
gp_TrsfForm
") Form;
		gp_TrsfForm Form();

		/****************** Invert ******************/
		/**** md5 signature: 980f166f600d23a8c77565829af2eeff ****/
		%feature("compactdefaultargs") Invert;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Invert;
		void Invert();

		/****************** Inverted ******************/
		/**** md5 signature: 6aecd1a624ed775c847887380509f2fa ****/
		%feature("compactdefaultargs") Inverted;
		%feature("autodoc", "Computes the reverse transformation. raises an exception if the matrix of the transformation is not inversible.

Returns
-------
gp_GTrsf
") Inverted;
		gp_GTrsf Inverted();

		/****************** IsNegative ******************/
		/**** md5 signature: 526e6184e7b7162d8ef698149b1c8ce5 ****/
		%feature("compactdefaultargs") IsNegative;
		%feature("autodoc", "Returns true if the determinant of the vectorial part of this transformation is negative.

Returns
-------
bool
") IsNegative;
		Standard_Boolean IsNegative();

		/****************** IsSingular ******************/
		/**** md5 signature: a0f47fe8c8ec8cb2abeeacefc1391dcc ****/
		%feature("compactdefaultargs") IsSingular;
		%feature("autodoc", "Returns true if this transformation is singular (and therefore, cannot be inverted). note: the gauss lu decomposition is used to invert the transformation matrix. consequently, the transformation is considered as singular if the largest pivot found is less than or equal to gp::resolution(). warning if this transformation is singular, it cannot be inverted.

Returns
-------
bool
") IsSingular;
		Standard_Boolean IsSingular();

		/****************** Multiplied ******************/
		/**** md5 signature: d41d18f939ba5f7f9e50c821aff5f145 ****/
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
		/**** md5 signature: 85029720187f37aa9dfca742737a5c8b ****/
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
		/**** md5 signature: 269b25031ee3626d57e26795a85486bb ****/
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
		/**** md5 signature: ff038eeaf4d48357e7237483a03e3ba2 ****/
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
		/**** md5 signature: 0b369b9eba09e73bc4b733ba86312183 ****/
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
		/**** md5 signature: ab05a862807b8b5bd8dfb271e68d8495 ****/
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
		/**** md5 signature: 8cc29710c9e0faa6eac83d4f7710a30a ****/
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
		/**** md5 signature: 24aaa37eae60e1c6ddc89cc5799d3e54 ****/
		%feature("compactdefaultargs") SetForm;
		%feature("autodoc", "Verify and set the shape of the gtrsf other or compoundtrsf ex : mygtrsf.setvalue(row1,col1,val1); mygtrsf.setvalue(row2,col2,val2); ... mygtrsf.setform();.

Returns
-------
None
") SetForm;
		void SetForm();

		/****************** SetTranslationPart ******************/
		/**** md5 signature: 43b89d3c3e7bdfc500909689d30e042f ****/
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
		/**** md5 signature: 40ab44b5c18d6292c5bc589b3cc5f286 ****/
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
		/**** md5 signature: db365e16a78bd3bf72b91ac00f7ecbe0 ****/
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
		/**** md5 signature: 132c951a8b5720f2ff9c1f3bbef5f86b ****/
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
		/**** md5 signature: 7c9a74fca6704e5441fbd1b45b0d2603 ****/
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
		/**** md5 signature: e55c1b0b3132b0094009ac78081a704b ****/
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
		/**** md5 signature: 522a640cf54bd3f09fb41e692c8c176d ****/
		%feature("compactdefaultargs") TranslationPart;
		%feature("autodoc", "Returns the translation part of the gtrsf.

Returns
-------
gp_XYZ
") TranslationPart;
		const gp_XYZ TranslationPart();

		/****************** Trsf ******************/
		/**** md5 signature: b145fbbd7dcaa4f9903d5fe3c25b5982 ****/
		%feature("compactdefaultargs") Trsf;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Trsf
") Trsf;
		gp_Trsf Trsf();

		/****************** Value ******************/
		/**** md5 signature: 1f17b21423db514e298b820a9dd11211 ****/
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
		/**** md5 signature: e6dedadc26d46b9b0e3810ac5e30d248 ****/
		%feature("compactdefaultargs") VectorialPart;
		%feature("autodoc", "Computes the vectorial part of the gtrsf. the returned matrix is a 3*3 matrix.

Returns
-------
gp_Mat
") VectorialPart;
		const gp_Mat VectorialPart();

		/****************** operator * ******************/
		/**** md5 signature: 842fcc6d1b6f5f41820093dea2e894d9 ****/
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
		/**** md5 signature: 933166f71fcf47cabfb96ea8ec45021c ****/
		%feature("compactdefaultargs") gp_GTrsf2d;
		%feature("autodoc", "Returns identity transformation.

Returns
-------
None
") gp_GTrsf2d;
		 gp_GTrsf2d();

		/****************** gp_GTrsf2d ******************/
		/**** md5 signature: 3042ccd7b3cfac4e0854e1e134227c79 ****/
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
		/**** md5 signature: 84147eddf8a3266721c2f37402e5f312 ****/
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
		/**** md5 signature: 9bfbf058eebcd895fd3b29a4bba4ff05 ****/
		%feature("compactdefaultargs") Form;
		%feature("autodoc", "Returns the nature of the transformation. it can be an identity transformation, a rotation, a translation, a mirror transformation (relative to a point or axis), a scaling transformation, a compound transformation or some other type of transformation.

Returns
-------
gp_TrsfForm
") Form;
		gp_TrsfForm Form();

		/****************** Invert ******************/
		/**** md5 signature: 980f166f600d23a8c77565829af2eeff ****/
		%feature("compactdefaultargs") Invert;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Invert;
		void Invert();

		/****************** Inverted ******************/
		/**** md5 signature: 7622d698ffe490d460567150b0afa0b2 ****/
		%feature("compactdefaultargs") Inverted;
		%feature("autodoc", "Computes the reverse transformation. raised an exception if the matrix of the transformation is not inversible.

Returns
-------
gp_GTrsf2d
") Inverted;
		gp_GTrsf2d Inverted();

		/****************** IsNegative ******************/
		/**** md5 signature: 526e6184e7b7162d8ef698149b1c8ce5 ****/
		%feature("compactdefaultargs") IsNegative;
		%feature("autodoc", "Returns true if the determinant of the vectorial part of this transformation is negative.

Returns
-------
bool
") IsNegative;
		Standard_Boolean IsNegative();

		/****************** IsSingular ******************/
		/**** md5 signature: a0f47fe8c8ec8cb2abeeacefc1391dcc ****/
		%feature("compactdefaultargs") IsSingular;
		%feature("autodoc", "Returns true if this transformation is singular (and therefore, cannot be inverted). note: the gauss lu decomposition is used to invert the transformation matrix. consequently, the transformation is considered as singular if the largest pivot found is less than or equal to gp::resolution(). warning if this transformation is singular, it cannot be inverted.

Returns
-------
bool
") IsSingular;
		Standard_Boolean IsSingular();

		/****************** Multiplied ******************/
		/**** md5 signature: 835593b1b1ce9ca62aa023f2a568b781 ****/
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
		/**** md5 signature: 1950c83dc572ea26a054daa4065e7cc1 ****/
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
		/**** md5 signature: 269b25031ee3626d57e26795a85486bb ****/
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
		/**** md5 signature: ae752b1a029dc64311a9a3c8673d67c3 ****/
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
		/**** md5 signature: 4bee70e61b224e4d6f5d578d78a62697 ****/
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
		/**** md5 signature: 781d2d9f55277b9b34a59751097d34e9 ****/
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
		/**** md5 signature: 7449568a86af8d6301df24780815ad7e ****/
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
		/**** md5 signature: 941daf470871f4c0229dd5afe5a83fae ****/
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
		/**** md5 signature: db365e16a78bd3bf72b91ac00f7ecbe0 ****/
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
		/**** md5 signature: 00debb9f9e8828af00639c6ce379b021 ****/
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
		/**** md5 signature: ec59db2b70ecf4d57a92ec9c29786bcb ****/
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
		/**** md5 signature: 42fcc5a0a1f5720bc6e9d9621687e72b ****/
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
		/**** md5 signature: 7a2a4d09be3965069a02b1ab2fe75da0 ****/
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
		/**** md5 signature: 2ba6f5175540b0ed3cbb670f3c8ff5d3 ****/
		%feature("compactdefaultargs") TranslationPart;
		%feature("autodoc", "Returns the translation part of the gtrsf2d.

Returns
-------
gp_XY
") TranslationPart;
		const gp_XY TranslationPart();

		/****************** Trsf2d ******************/
		/**** md5 signature: 6ea70105baee17870344c337ed09ffe5 ****/
		%feature("compactdefaultargs") Trsf2d;
		%feature("autodoc", "Converts this transformation into a gp_trsf2d transformation. exceptions standard_constructionerror if this transformation cannot be converted, i.e. if its form is gp_other.

Returns
-------
gp_Trsf2d
") Trsf2d;
		gp_Trsf2d Trsf2d();

		/****************** Value ******************/
		/**** md5 signature: 1f17b21423db514e298b820a9dd11211 ****/
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
		/**** md5 signature: c70b55607bc5601a60c7027d02caca4b ****/
		%feature("compactdefaultargs") VectorialPart;
		%feature("autodoc", "Computes the vectorial part of the gtrsf2d. the returned matrix is a 2*2 matrix.

Returns
-------
gp_Mat2d
") VectorialPart;
		const gp_Mat2d VectorialPart();

		/****************** operator * ******************/
		/**** md5 signature: c19807404020983d43601cdd08933d4a ****/
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
		/**** md5 signature: 2c9fe37efbc49d4f9cfad9cb4de642fd ****/
		%feature("compactdefaultargs") gp_Hypr;
		%feature("autodoc", "Creates of an indefinite hyperbola.

Returns
-------
None
") gp_Hypr;
		 gp_Hypr();

		/****************** gp_Hypr ******************/
		/**** md5 signature: 67caa21841cdcc515ee7e4712ff02258 ****/
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
		/**** md5 signature: de14135c1ce647b5a9f90af716eea7a8 ****/
		%feature("compactdefaultargs") Asymptote1;
		%feature("autodoc", "In the local coordinate system of the hyperbola the equation of the hyperbola is (x*x)/(a*a) - (y*y)/(b*b) = 1.0 and the equation of the first asymptote is y = (b/a)*x where a is the major radius and b is the minor radius. raises constructionerror if majorradius = 0.0.

Returns
-------
gp_Ax1
") Asymptote1;
		gp_Ax1 Asymptote1();

		/****************** Asymptote2 ******************/
		/**** md5 signature: 13c1b779412722927b3766066de238ea ****/
		%feature("compactdefaultargs") Asymptote2;
		%feature("autodoc", "In the local coordinate system of the hyperbola the equation of the hyperbola is (x*x)/(a*a) - (y*y)/(b*b) = 1.0 and the equation of the first asymptote is y = -(b/a)*x. where a is the major radius and b is the minor radius. raises constructionerror if majorradius = 0.0.

Returns
-------
gp_Ax1
") Asymptote2;
		gp_Ax1 Asymptote2();

		/****************** Axis ******************/
		/**** md5 signature: cb9b52ff887b682f8bfc1eb2f646705a ****/
		%feature("compactdefaultargs") Axis;
		%feature("autodoc", "Returns the axis passing through the center, and normal to the plane of this hyperbola.

Returns
-------
gp_Ax1
") Axis;
		const gp_Ax1 Axis();

		/****************** ConjugateBranch1 ******************/
		/**** md5 signature: 056e2135e75007339e6abcd54be7d73e ****/
		%feature("compactdefaultargs") ConjugateBranch1;
		%feature("autodoc", "Computes the branch of hyperbola which is on the positive side of the 'yaxis' of <self>.

Returns
-------
gp_Hypr
") ConjugateBranch1;
		gp_Hypr ConjugateBranch1();

		/****************** ConjugateBranch2 ******************/
		/**** md5 signature: e361e496e4cb0dd5e52876d78f726b91 ****/
		%feature("compactdefaultargs") ConjugateBranch2;
		%feature("autodoc", "Computes the branch of hyperbola which is on the negative side of the 'yaxis' of <self>.

Returns
-------
gp_Hypr
") ConjugateBranch2;
		gp_Hypr ConjugateBranch2();

		/****************** Directrix1 ******************/
		/**** md5 signature: 10272c6052549861204070aa44f046a5 ****/
		%feature("compactdefaultargs") Directrix1;
		%feature("autodoc", "This directrix is the line normal to the xaxis of the hyperbola in the local plane (z = 0) at a distance d = majorradius / e from the center of the hyperbola, where e is the eccentricity of the hyperbola. this line is parallel to the 'yaxis'. the intersection point between the directrix1 and the 'xaxis' is the 'location' point of the directrix1. this point is on the positive side of the 'xaxis'.

Returns
-------
gp_Ax1
") Directrix1;
		gp_Ax1 Directrix1();

		/****************** Directrix2 ******************/
		/**** md5 signature: 88339a214155f2a41d76691fd00c9167 ****/
		%feature("compactdefaultargs") Directrix2;
		%feature("autodoc", "This line is obtained by the symmetrical transformation of 'directrix1' with respect to the 'yaxis' of the hyperbola.

Returns
-------
gp_Ax1
") Directrix2;
		gp_Ax1 Directrix2();

		/****************** Eccentricity ******************/
		/**** md5 signature: 78de488c9cbac7c761a28f28e3d39522 ****/
		%feature("compactdefaultargs") Eccentricity;
		%feature("autodoc", "Returns the excentricity of the hyperbola (e > 1). if f is the distance between the location of the hyperbola and the focus1 then the eccentricity e = f / majorradius. raises domainerror if majorradius = 0.0.

Returns
-------
float
") Eccentricity;
		Standard_Real Eccentricity();

		/****************** Focal ******************/
		/**** md5 signature: 36c97a85b2e31ded83d59428f0f74c3c ****/
		%feature("compactdefaultargs") Focal;
		%feature("autodoc", "Computes the focal distance. it is the distance between the the two focus of the hyperbola.

Returns
-------
float
") Focal;
		Standard_Real Focal();

		/****************** Focus1 ******************/
		/**** md5 signature: 44668390e44007b6344ae1f20fcc3003 ****/
		%feature("compactdefaultargs") Focus1;
		%feature("autodoc", "Returns the first focus of the hyperbola. this focus is on the positive side of the 'xaxis' of the hyperbola.

Returns
-------
gp_Pnt
") Focus1;
		gp_Pnt Focus1();

		/****************** Focus2 ******************/
		/**** md5 signature: 19e89a037d2bd912a8348a9c245bd935 ****/
		%feature("compactdefaultargs") Focus2;
		%feature("autodoc", "Returns the second focus of the hyperbola. this focus is on the negative side of the 'xaxis' of the hyperbola.

Returns
-------
gp_Pnt
") Focus2;
		gp_Pnt Focus2();

		/****************** Location ******************/
		/**** md5 signature: 42040ad2ed401b7e80bf90e4b6b5f418 ****/
		%feature("compactdefaultargs") Location;
		%feature("autodoc", "Returns the location point of the hyperbola. it is the intersection point between the 'xaxis' and the 'yaxis'.

Returns
-------
gp_Pnt
") Location;
		const gp_Pnt Location();

		/****************** MajorRadius ******************/
		/**** md5 signature: e961bb81456f4d0a6154d0e9401e1ce8 ****/
		%feature("compactdefaultargs") MajorRadius;
		%feature("autodoc", "Returns the major radius of the hyperbola. it is the radius on the 'xaxis' of the hyperbola.

Returns
-------
float
") MajorRadius;
		Standard_Real MajorRadius();

		/****************** MinorRadius ******************/
		/**** md5 signature: e1383e2287a25901af1e2b42cc95af4d ****/
		%feature("compactdefaultargs") MinorRadius;
		%feature("autodoc", "Returns the minor radius of the hyperbola. it is the radius on the 'yaxis' of the hyperbola.

Returns
-------
float
") MinorRadius;
		Standard_Real MinorRadius();

		/****************** Mirror ******************/
		/**** md5 signature: b133f2e6e1c74f672a216a0094bdfda6 ****/
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
		/**** md5 signature: d1a0189a98d756bd9e5b51b4ae49992a ****/
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
		/**** md5 signature: 874cde0169043be133e205e960c3ca57 ****/
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
		/**** md5 signature: 1ef2297d7b19e5dd2b271fc9c446501e ****/
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
		/**** md5 signature: 2af9e1543bda3616c6d14d1ac1c4aa45 ****/
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
		/**** md5 signature: 5f2c39f43d8e92ec08d28a7eb86225dc ****/
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
		/**** md5 signature: e3f08eb290c33f5759deca11d2e4aa65 ****/
		%feature("compactdefaultargs") OtherBranch;
		%feature("autodoc", "Returns the branch of hyperbola obtained by doing the symmetrical transformation of <self> with respect to the 'yaxis' of <self>.

Returns
-------
gp_Hypr
") OtherBranch;
		gp_Hypr OtherBranch();

		/****************** Parameter ******************/
		/**** md5 signature: ecccdeaeaa0deed24f47e61ad75d24f1 ****/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "Returns p = (e * e - 1) * majorradius where e is the eccentricity of the hyperbola. raises domainerror if majorradius = 0.0.

Returns
-------
float
") Parameter;
		Standard_Real Parameter();

		/****************** Position ******************/
		/**** md5 signature: 4998eb006d0dfaf45366e64da028e2d8 ****/
		%feature("compactdefaultargs") Position;
		%feature("autodoc", "Returns the coordinate system of the hyperbola.

Returns
-------
gp_Ax2
") Position;
		const gp_Ax2 Position();

		/****************** Rotate ******************/
		/**** md5 signature: 12c4967f27a0900e4176252164d2f2ce ****/
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
		/**** md5 signature: 6880474f6486cb5543c659f227d03fa6 ****/
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
		/**** md5 signature: e66fc526c4232f21fb4238a81292d522 ****/
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
		/**** md5 signature: d2cc9f48b1f0f9f58342b70f6ba3da0d ****/
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
		/**** md5 signature: 4f1ae44e92ff7b1da601b2ca71a3a58a ****/
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
		/**** md5 signature: c028aee785b685956e8e7d5cba7ecb46 ****/
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
		/**** md5 signature: 5b6d39118ca624402ca904f240869d93 ****/
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
		/**** md5 signature: 55b33932324c77b3c1e82a433bb9350f ****/
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
		/**** md5 signature: 370491d423dd18be72ddbe9a7e5a5d72 ****/
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
		/**** md5 signature: 45ee6a37cbc92ff06bd17b5653f32913 ****/
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
		/**** md5 signature: c305b9f758bea790f5cd89131e6a5340 ****/
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
		/**** md5 signature: b3667af07c9a238180bc31cc15803f78 ****/
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
		/**** md5 signature: 5053222ade9605c7c37102310f06f2e8 ****/
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
		/**** md5 signature: 28d768c150925337f911dd9148265045 ****/
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
		/**** md5 signature: 65c344088e2e9704db8f46dad230247c ****/
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
		/**** md5 signature: 33f98d138ae3ce92d202330aa4ae814d ****/
		%feature("compactdefaultargs") XAxis;
		%feature("autodoc", "Computes an axis, whose - the origin is the center of this hyperbola, and - the unit vector is the 'x direction' of the local coordinate system of this hyperbola. these axes are, the major axis (the 'x axis') and of this hyperboreturns the 'xaxis' of the hyperbola.

Returns
-------
gp_Ax1
") XAxis;
		gp_Ax1 XAxis();

		/****************** YAxis ******************/
		/**** md5 signature: b471d966aca0b452073c5d55f8f5e027 ****/
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
		/**** md5 signature: 6bfe1e84b557c9b0a91b4a7b46652423 ****/
		%feature("compactdefaultargs") gp_Hypr2d;
		%feature("autodoc", "Creates of an indefinite hyperbola.

Returns
-------
None
") gp_Hypr2d;
		 gp_Hypr2d();

		/****************** gp_Hypr2d ******************/
		/**** md5 signature: 23102346a8349855cda0d4a51f1bc834 ****/
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
		/**** md5 signature: b04d00e277dd82089f539301cf08b55a ****/
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
		/**** md5 signature: f7602d62af48fa687b9c94102a074f0b ****/
		%feature("compactdefaultargs") Asymptote1;
		%feature("autodoc", "In the local coordinate system of the hyperbola the equation of the hyperbola is (x*x)/(a*a) - (y*y)/(b*b) = 1.0 and the equation of the first asymptote is y = (b/a)*x where a is the major radius of the hyperbola and b the minor radius of the hyperbola. raises constructionerror if majorradius = 0.0.

Returns
-------
gp_Ax2d
") Asymptote1;
		gp_Ax2d Asymptote1();

		/****************** Asymptote2 ******************/
		/**** md5 signature: ae762c76c64b4be67fd988e980bd70ef ****/
		%feature("compactdefaultargs") Asymptote2;
		%feature("autodoc", "In the local coordinate system of the hyperbola the equation of the hyperbola is (x*x)/(a*a) - (y*y)/(b*b) = 1.0 and the equation of the first asymptote is y = -(b/a)*x where a is the major radius of the hyperbola and b the minor radius of the hyperbola. raises constructionerror if majorradius = 0.0.

Returns
-------
gp_Ax2d
") Asymptote2;
		gp_Ax2d Asymptote2();

		/****************** Axis ******************/
		/**** md5 signature: 56ba1d39cb5b229cbbc254dbe68307ea ****/
		%feature("compactdefaultargs") Axis;
		%feature("autodoc", "Returns the axisplacement of the hyperbola.

Returns
-------
gp_Ax22d
") Axis;
		const gp_Ax22d Axis();

		/****************** Coefficients ******************/
		/**** md5 signature: 2252ad010357f4e043a3c6dac4c3923c ****/
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
		/**** md5 signature: 64c762dbacf1b9b583f85bbe39250178 ****/
		%feature("compactdefaultargs") ConjugateBranch1;
		%feature("autodoc", "Computes the branch of hyperbola which is on the positive side of the 'yaxis' of <self>.

Returns
-------
gp_Hypr2d
") ConjugateBranch1;
		gp_Hypr2d ConjugateBranch1();

		/****************** ConjugateBranch2 ******************/
		/**** md5 signature: b4fca477a92cf56be479876d60440a0d ****/
		%feature("compactdefaultargs") ConjugateBranch2;
		%feature("autodoc", "Computes the branch of hyperbola which is on the negative side of the 'yaxis' of <self>.

Returns
-------
gp_Hypr2d
") ConjugateBranch2;
		gp_Hypr2d ConjugateBranch2();

		/****************** Directrix1 ******************/
		/**** md5 signature: fcbef2c85b670a856d4882ec13ce9c6f ****/
		%feature("compactdefaultargs") Directrix1;
		%feature("autodoc", "Computes the directrix which is the line normal to the xaxis of the hyperbola in the local plane (z = 0) at a distance d = majorradius / e from the center of the hyperbola, where e is the eccentricity of the hyperbola. this line is parallel to the 'yaxis'. the intersection point between the 'directrix1' and the 'xaxis' is the 'location' point of the 'directrix1'. this point is on the positive side of the 'xaxis'.

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
		/**** md5 signature: 78de488c9cbac7c761a28f28e3d39522 ****/
		%feature("compactdefaultargs") Eccentricity;
		%feature("autodoc", "Returns the excentricity of the hyperbola (e > 1). if f is the distance between the location of the hyperbola and the focus1 then the eccentricity e = f / majorradius. raises domainerror if majorradius = 0.0.

Returns
-------
float
") Eccentricity;
		Standard_Real Eccentricity();

		/****************** Focal ******************/
		/**** md5 signature: 36c97a85b2e31ded83d59428f0f74c3c ****/
		%feature("compactdefaultargs") Focal;
		%feature("autodoc", "Computes the focal distance. it is the distance between the 'location' of the hyperbola and 'focus1' or 'focus2'.

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

		/****************** IsDirect ******************/
		/**** md5 signature: e230b64eefbb898397296c5ca615d396 ****/
		%feature("compactdefaultargs") IsDirect;
		%feature("autodoc", "Returns true if the local coordinate system is direct and false in the other case.

Returns
-------
bool
") IsDirect;
		Standard_Boolean IsDirect();

		/****************** Location ******************/
		/**** md5 signature: fbf774a3a1efe16540d680c0476bcbc8 ****/
		%feature("compactdefaultargs") Location;
		%feature("autodoc", "Returns the location point of the hyperbola. it is the intersection point between the 'xaxis' and the 'yaxis'.

Returns
-------
gp_Pnt2d
") Location;
		const gp_Pnt2d Location();

		/****************** MajorRadius ******************/
		/**** md5 signature: e961bb81456f4d0a6154d0e9401e1ce8 ****/
		%feature("compactdefaultargs") MajorRadius;
		%feature("autodoc", "Returns the major radius of the hyperbola (it is the radius corresponding to the 'xaxis' of the hyperbola).

Returns
-------
float
") MajorRadius;
		Standard_Real MajorRadius();

		/****************** MinorRadius ******************/
		/**** md5 signature: e1383e2287a25901af1e2b42cc95af4d ****/
		%feature("compactdefaultargs") MinorRadius;
		%feature("autodoc", "Returns the minor radius of the hyperbola (it is the radius corresponding to the 'yaxis' of the hyperbola).

Returns
-------
float
") MinorRadius;
		Standard_Real MinorRadius();

		/****************** Mirror ******************/
		/**** md5 signature: 5a90a3ec4faf7909390bb0bfb4d9be0f ****/
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
		/**** md5 signature: 8b8d921c1e87f73e8278c4d42ae298f7 ****/
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
		/**** md5 signature: b1639c7ae355e12d641bbbae087dd419 ****/
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
		/**** md5 signature: fa10de32c39936308c9de0392f0a31ab ****/
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
		/**** md5 signature: f232cd4a55a16558916bb20e24dddcc5 ****/
		%feature("compactdefaultargs") OtherBranch;
		%feature("autodoc", "Returns the branch of hyperbola obtained by doing the symmetrical transformation of <self> with respect to the 'yaxis' of <self>.

Returns
-------
gp_Hypr2d
") OtherBranch;
		gp_Hypr2d OtherBranch();

		/****************** Parameter ******************/
		/**** md5 signature: ecccdeaeaa0deed24f47e61ad75d24f1 ****/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "Returns p = (e * e - 1) * majorradius where e is the eccentricity of the hyperbola. raises domainerror if majorradius = 0.0.

Returns
-------
float
") Parameter;
		Standard_Real Parameter();

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
		/**** md5 signature: 0d9b975a843201c053f96b6da8f5ee68 ****/
		%feature("compactdefaultargs") Reversed;
		%feature("autodoc", "Reverses the orientation of the local coordinate system of this hyperbola (the 'y axis' is reversed). therefore, the implicit orientation of this hyperbola is reversed. note: - reverse assigns the result to this hyperbola, while - reversed creates a new one.

Returns
-------
gp_Hypr2d
") Reversed;
		gp_Hypr2d Reversed();

		/****************** Rotate ******************/
		/**** md5 signature: 795edcbb32146eb6f071bea4c90f5cfd ****/
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
		/**** md5 signature: 20b9603d2101ca24b846a9ac4f12ed50 ****/
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
		/**** md5 signature: 5b49a8aeffcacace07c66937f77f1e03 ****/
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
		/**** md5 signature: 081d4964611f0779d2913b167e981f05 ****/
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
		/**** md5 signature: 016f6d0b52d2d85d5711abca672ca103 ****/
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
		/**** md5 signature: 368c9b8c039b553e22ee650e75e4d404 ****/
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
		/**** md5 signature: 5b6d39118ca624402ca904f240869d93 ****/
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
		/**** md5 signature: 55b33932324c77b3c1e82a433bb9350f ****/
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
		/**** md5 signature: ec66b4bfc97a7a2706907f916a07745f ****/
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
		/**** md5 signature: f0f5b973b3cd13921764c845a5c4cc95 ****/
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
		/**** md5 signature: dace16a29a39216c0dd584c6964e840b ****/
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
		/**** md5 signature: 7e22380d089c3da8d4a2116bf6c03e44 ****/
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
		/**** md5 signature: 1cd2e000b85692a9f89a6bf8e8e4782c ****/
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
		/**** md5 signature: c7768f1dcf9b6595f2bd4653737544f9 ****/
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
		/**** md5 signature: 09b6bd829fd0ca0e96a0cea39ca00a14 ****/
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
		/**** md5 signature: 979b6471664373ae8cca254a233fcc98 ****/
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
		/**** md5 signature: 5bcd651b87069885e2b5ecad2bd89992 ****/
		%feature("compactdefaultargs") XAxis;
		%feature("autodoc", "Computes an axis whose - the origin is the center of this hyperbola, and - the unit vector is the 'x direction' or 'y direction' respectively of the local coordinate system of this hyperbola returns the major axis of the hyperbola.

Returns
-------
gp_Ax2d
") XAxis;
		gp_Ax2d XAxis();

		/****************** YAxis ******************/
		/**** md5 signature: 1e80565ed75c7e231792089b80d7c873 ****/
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
		/**** md5 signature: 89c33a3734f757cab3d8d2c6b75e369e ****/
		%feature("compactdefaultargs") gp_Lin;
		%feature("autodoc", "Creates a line corresponding to z axis of the reference coordinate system.

Returns
-------
None
") gp_Lin;
		 gp_Lin();

		/****************** gp_Lin ******************/
		/**** md5 signature: 27c788d49a0d5f8fe46e8c0baeeac5c8 ****/
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
		/**** md5 signature: 2b22e32969aa959133cce2da5e386b80 ****/
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
		/**** md5 signature: 40cf84de3724c0f26adae3136cc60ef0 ****/
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
		/**** md5 signature: 4617c578d595c204f331df6213e3ae4a ****/
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
		/**** md5 signature: 6107c9113155a9ae9007c5c8e526a738 ****/
		%feature("compactdefaultargs") Direction;
		%feature("autodoc", "Returns the direction of the line.

Returns
-------
gp_Dir
") Direction;
		const gp_Dir Direction();

		/****************** Distance ******************/
		/**** md5 signature: d9ba17ce87a8f8e1c8805850d4d732ba ****/
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
		/**** md5 signature: 9b60fdf4b3c0bb17849fad38ec737c70 ****/
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
		/**** md5 signature: 42040ad2ed401b7e80bf90e4b6b5f418 ****/
		%feature("compactdefaultargs") Location;
		%feature("autodoc", "Returns the location point (origin) of the line.

Returns
-------
gp_Pnt
") Location;
		const gp_Pnt Location();

		/****************** Mirror ******************/
		/**** md5 signature: b133f2e6e1c74f672a216a0094bdfda6 ****/
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
		/**** md5 signature: d1a0189a98d756bd9e5b51b4ae49992a ****/
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
		/**** md5 signature: 874cde0169043be133e205e960c3ca57 ****/
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
		/**** md5 signature: c36fa38985c193de5ce5f10a43e7c5ad ****/
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
		/**** md5 signature: 875f23317162473bee6950445f7d942d ****/
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
		/**** md5 signature: 0737537a3ea30aeb31e526bc2a28a67a ****/
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
		/**** md5 signature: 04c11d6852469b1efe293367e801d4e0 ****/
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
		/**** md5 signature: af37a1ddce8f862eeb41e9689b597340 ****/
		%feature("compactdefaultargs") Position;
		%feature("autodoc", "Returns the axis placement one axis whith the same location and direction as <self>.

Returns
-------
gp_Ax1
") Position;
		const gp_Ax1 Position();

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
		/**** md5 signature: dd92b366c404d10581f0822053753c60 ****/
		%feature("compactdefaultargs") Reversed;
		%feature("autodoc", "Reverses the direction of the line. note: - reverse assigns the result to this line, while - reversed creates a new one.

Returns
-------
gp_Lin
") Reversed;
		gp_Lin Reversed();

		/****************** Rotate ******************/
		/**** md5 signature: 12c4967f27a0900e4176252164d2f2ce ****/
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
		/**** md5 signature: 0c7e9ce6ffcdf89ba8539f33c9836123 ****/
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
		/**** md5 signature: e66fc526c4232f21fb4238a81292d522 ****/
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
		/**** md5 signature: 942bc945113dac22034172a99bc7dd96 ****/
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
		/**** md5 signature: df8744d729e050a65ee65230eb199390 ****/
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
		/**** md5 signature: c028aee785b685956e8e7d5cba7ecb46 ****/
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
		/**** md5 signature: ca1bae47b8ae90618ff03190da8061a3 ****/
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
		/**** md5 signature: 382f20ab66f794f70a8fbaad3ecad14c ****/
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
		/**** md5 signature: d59d1cc67cac376a6685d4fa27a5d2c9 ****/
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
		/**** md5 signature: 45ee6a37cbc92ff06bd17b5653f32913 ****/
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
		/**** md5 signature: 0ed88089f376e4bf3e5b2599770e2977 ****/
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
		/**** md5 signature: b3667af07c9a238180bc31cc15803f78 ****/
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
		/**** md5 signature: 5053222ade9605c7c37102310f06f2e8 ****/
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
		/**** md5 signature: eb58b70d78479ed67464106a877ec711 ****/
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
		/**** md5 signature: 37f378560e2be6fe99ebaca8103ddde7 ****/
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
		/**** md5 signature: a9a83f5440a691b65180354883bd2b9d ****/
		%feature("compactdefaultargs") gp_Lin2d;
		%feature("autodoc", "Creates a line corresponding to x axis of the reference coordinate system.

Returns
-------
None
") gp_Lin2d;
		 gp_Lin2d();

		/****************** gp_Lin2d ******************/
		/**** md5 signature: 80f21b08773368652622e743bd1f1fc6 ****/
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
		/**** md5 signature: 72ef8201a42040f0b10ecb53945e4bcf ****/
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
		/**** md5 signature: 5587b65bfec74198b05785bf5420f9ed ****/
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
		/**** md5 signature: aa64f8683e9538f51f7fc9afbc7814bd ****/
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
		/**** md5 signature: 9d3c2cc4c296328289eebaf4bc880928 ****/
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
		/**** md5 signature: b5f4c6607c2df5e4dff0bd5cfe532775 ****/
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
		/**** md5 signature: 24b32913fac63aab5fb6c5d1d7be7851 ****/
		%feature("compactdefaultargs") Direction;
		%feature("autodoc", "Returns the direction of the line.

Returns
-------
gp_Dir2d
") Direction;
		const gp_Dir2d Direction();

		/****************** Distance ******************/
		/**** md5 signature: eafbc4fbb17061433dcb80a2bf868650 ****/
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
		/**** md5 signature: b7d391f99d5e516a9fee9b846e29b6e1 ****/
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
		/**** md5 signature: fbf774a3a1efe16540d680c0476bcbc8 ****/
		%feature("compactdefaultargs") Location;
		%feature("autodoc", "Returns the location point (origin) of the line.

Returns
-------
gp_Pnt2d
") Location;
		const gp_Pnt2d Location();

		/****************** Mirror ******************/
		/**** md5 signature: 5a90a3ec4faf7909390bb0bfb4d9be0f ****/
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
		/**** md5 signature: 8b8d921c1e87f73e8278c4d42ae298f7 ****/
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
		/**** md5 signature: d97e28c6ba0109add109dc0a5ecf93ab ****/
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
		/**** md5 signature: 436657c7fe1471b6065f225da7e006eb ****/
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
		/**** md5 signature: a0f525e061e0c40920eb6c7c6bdb1a92 ****/
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
		/**** md5 signature: 918ef7d5550c41cbbd9512dcf1888fbe ****/
		%feature("compactdefaultargs") Position;
		%feature("autodoc", "Returns the axis placement one axis whith the same location and direction as <self>.

Returns
-------
gp_Ax2d
") Position;
		const gp_Ax2d Position();

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
		/**** md5 signature: 75fa59a4d07e3ae924b141b9a38511c7 ****/
		%feature("compactdefaultargs") Reversed;
		%feature("autodoc", "Reverses the positioning axis of this line. note: - reverse assigns the result to this line, while - reversed creates a new one.

Returns
-------
gp_Lin2d
") Reversed;
		gp_Lin2d Reversed();

		/****************** Rotate ******************/
		/**** md5 signature: 795edcbb32146eb6f071bea4c90f5cfd ****/
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
		/**** md5 signature: ce0d8ab3cb060a7887f18a75e16a416c ****/
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
		/**** md5 signature: 5b49a8aeffcacace07c66937f77f1e03 ****/
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
		/**** md5 signature: d48b78d01a9018de0c4e51a0b586ad15 ****/
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

		/****************** SetLocation ******************/
		/**** md5 signature: 368c9b8c039b553e22ee650e75e4d404 ****/
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
		/**** md5 signature: ea9b5278e5665b3886ffa693a4fe03fb ****/
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
		/**** md5 signature: 235c49cb5ac12c3b838afde8f85743f4 ****/
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
		/**** md5 signature: aebd149dbac33e5185a65ef719d6cb42 ****/
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
		/**** md5 signature: dace16a29a39216c0dd584c6964e840b ****/
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
		/**** md5 signature: 8b2533c8870ac814cf9ba2dd0626d6cc ****/
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
		/**** md5 signature: 1cd2e000b85692a9f89a6bf8e8e4782c ****/
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
		/**** md5 signature: c7768f1dcf9b6595f2bd4653737544f9 ****/
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
		/**** md5 signature: f1ba6ef1f911cdbec1ee2aafdebd8194 ****/
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
		/**** md5 signature: ae584da98a44629917c3b4e276793577 ****/
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
		/**** md5 signature: 1e2480d8563054dcbcc9daa398b48ecc ****/
		%feature("compactdefaultargs") gp_Mat;
		%feature("autodoc", "Creates a matrix with null coefficients.

Returns
-------
None
") gp_Mat;
		 gp_Mat();

		/****************** gp_Mat ******************/
		/**** md5 signature: cb46433aac7d6afb82c8743d13aef3b5 ****/
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
		/**** md5 signature: a175935b88fd1042aacd85b286fedf9d ****/
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
		/**** md5 signature: 7a8cd0364af21c8844991cc0ab763b51 ****/
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
		/**** md5 signature: b9474d4fae99c7d06dd7dad51295a423 ****/
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
		/**** md5 signature: 0d8612416c7d04e05de6206f48c27c7a ****/
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
		/**** md5 signature: 5ac8cd01bd8c7b44a3e7395b4e2f6518 ****/
		%feature("compactdefaultargs") Determinant;
		%feature("autodoc", "Computes the determinant of the matrix.

Returns
-------
float
") Determinant;
		Standard_Real Determinant();

		/****************** Diagonal ******************/
		/**** md5 signature: 1f1fc2674e4c70afa35cc086a7d5dabb ****/
		%feature("compactdefaultargs") Diagonal;
		%feature("autodoc", "Returns the main diagonal of the matrix.

Returns
-------
gp_XYZ
") Diagonal;
		gp_XYZ Diagonal();

		/****************** Divide ******************/
		/**** md5 signature: 7bc46cf38daaa2229b322d9add0408e3 ****/
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
		/**** md5 signature: 648aed422bff520e6354a05820a077ba ****/
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
		/**** md5 signature: 980f166f600d23a8c77565829af2eeff ****/
		%feature("compactdefaultargs") Invert;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Invert;
		void Invert();

		/****************** Inverted ******************/
		/**** md5 signature: 0fc8d68232f4accc4c200c6594a3c6f8 ****/
		%feature("compactdefaultargs") Inverted;
		%feature("autodoc", "Inverses the matrix and raises if the matrix is singular. - invert assigns the result to this matrix, while - inverted creates a new one. warning the gauss lu decomposition is used to invert the matrix. consequently, the matrix is considered as singular if the largest pivot found is less than or equal to gp::resolution(). exceptions standard_constructionerror if this matrix is singular, and therefore cannot be inverted.

Returns
-------
gp_Mat
") Inverted;
		gp_Mat Inverted();

		/****************** IsSingular ******************/
		/**** md5 signature: a0f47fe8c8ec8cb2abeeacefc1391dcc ****/
		%feature("compactdefaultargs") IsSingular;
		%feature("autodoc", "The gauss lu decomposition is used to invert the matrix (see math package) so the matrix is considered as singular if the largest pivot found is lower or equal to resolution from gp.

Returns
-------
bool
") IsSingular;
		Standard_Boolean IsSingular();

		/****************** Multiplied ******************/
		/**** md5 signature: e8c71823a2fdf477d5d701747740c290 ****/
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
		/**** md5 signature: 35c3aa5b6714574d2774a86ff1e41bc7 ****/
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
		/**** md5 signature: 287b909082db8aa7498856cdc8899cb5 ****/
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
		/**** md5 signature: c6d925fe0833ff6abc2c1aab20682246 ****/
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
		/**** md5 signature: 269b25031ee3626d57e26795a85486bb ****/
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
		/**** md5 signature: 22ad2f3780f48c2e055a8a2925492a2c ****/
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
		/**** md5 signature: 6f91145de3a840221732dcfcc0743578 ****/
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
		/**** md5 signature: 87e95203634e9da82bbb0e09bff5797f ****/
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
		/**** md5 signature: 81be148009105008a74c82524218b997 ****/
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
		/**** md5 signature: f7f14e4da8d3fbaf7a42ebcf8a1984e9 ****/
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
		/**** md5 signature: 6e97d41fdcf18f4921caca2d7473eb96 ****/
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
		/**** md5 signature: 846927f6a3d9643c74d65a1037181328 ****/
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
		/**** md5 signature: e8ca8e91dfbb699ded371e0fec68633f ****/
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
		/**** md5 signature: 5bbdc9fdffc9b653a262b82f3031092e ****/
		%feature("compactdefaultargs") SetIdentity;
		%feature("autodoc", "Modifies this matrix so that it represents the identity matrix.

Returns
-------
None
") SetIdentity;
		void SetIdentity();

		/****************** SetRotation ******************/
		/**** md5 signature: cb359fc0704bbfbae4d0e22881e3c5d4 ****/
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
		/**** md5 signature: 3be971dfae66b67ded0bceb4dc6a676f ****/
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
		/**** md5 signature: 5d8c5df2133fc87623bed77ac3c8adfd ****/
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
		/**** md5 signature: ed1e020e7e73778204761e7ad82059cb ****/
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
		/**** md5 signature: db365e16a78bd3bf72b91ac00f7ecbe0 ****/
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
		/**** md5 signature: bbd73df6fe6f9db59e2c47a133e82a16 ****/
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
		/**** md5 signature: e01cedd860fb50335ad89e7ce4d23725 ****/
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
		/**** md5 signature: 70e27025c56428cd3bbca609f0f0cfbd ****/
		%feature("compactdefaultargs") Transpose;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Transpose;
		void Transpose();

		/****************** Transposed ******************/
		/**** md5 signature: 010793b64a105b4317bc7aba186423f1 ****/
		%feature("compactdefaultargs") Transposed;
		%feature("autodoc", "Transposes the matrix. a(j, i) -> a (i, j).

Returns
-------
gp_Mat
") Transposed;
		gp_Mat Transposed();

		/****************** Value ******************/
		/**** md5 signature: a9482d47079caf6e7f07fc5a5d2375b1 ****/
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
		/**** md5 signature: 45d38880a906bdc2ecfbfd53f046cde9 ****/
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
		/**** md5 signature: a0ce831e9d54cd6279b3636f79cb8ef7 ****/
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
		/**** md5 signature: 888e64b4d79e7b5a714ea96df62d877c ****/
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
		/**** md5 signature: b2c8b203557e9b67eae6119380409e4d ****/
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
		/**** md5 signature: aa0da0c3d4c3e2c28dae27ce91d28fa5 ****/
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
		/**** md5 signature: 3f9ad8079a6630f1d29e23ff1a2dc6a9 ****/
		%feature("compactdefaultargs") gp_Mat2d;
		%feature("autodoc", "Creates a matrix with null coefficients.

Returns
-------
None
") gp_Mat2d;
		 gp_Mat2d();

		/****************** gp_Mat2d ******************/
		/**** md5 signature: d615e498bcafcc974846c98219422ed9 ****/
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
		/**** md5 signature: 9f84026b13c61ba373b10330d3726faf ****/
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
		/**** md5 signature: 81b2e6efaf67481f37c2626c37d14459 ****/
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
		/**** md5 signature: 2134bcea4c24f661b08e9883d8479c32 ****/
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
		/**** md5 signature: 5ac8cd01bd8c7b44a3e7395b4e2f6518 ****/
		%feature("compactdefaultargs") Determinant;
		%feature("autodoc", "Computes the determinant of the matrix.

Returns
-------
float
") Determinant;
		Standard_Real Determinant();

		/****************** Diagonal ******************/
		/**** md5 signature: aece2ad385867950872716b830ca5dc0 ****/
		%feature("compactdefaultargs") Diagonal;
		%feature("autodoc", "Returns the main diagonal of the matrix.

Returns
-------
gp_XY
") Diagonal;
		gp_XY Diagonal();

		/****************** Divide ******************/
		/**** md5 signature: 7bc46cf38daaa2229b322d9add0408e3 ****/
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
		/**** md5 signature: 080d1a785450e084ea181bdeda5f386e ****/
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
		/**** md5 signature: 980f166f600d23a8c77565829af2eeff ****/
		%feature("compactdefaultargs") Invert;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Invert;
		void Invert();

		/****************** Inverted ******************/
		/**** md5 signature: 0212ea2a0fdffd77eaa40fe4dd3e2eae ****/
		%feature("compactdefaultargs") Inverted;
		%feature("autodoc", "Inverses the matrix and raises exception if the matrix is singular.

Returns
-------
gp_Mat2d
") Inverted;
		gp_Mat2d Inverted();

		/****************** IsSingular ******************/
		/**** md5 signature: a0f47fe8c8ec8cb2abeeacefc1391dcc ****/
		%feature("compactdefaultargs") IsSingular;
		%feature("autodoc", "Returns true if this matrix is singular (and therefore, cannot be inverted). the gauss lu decomposition is used to invert the matrix so the matrix is considered as singular if the largest pivot found is lower or equal to resolution from gp.

Returns
-------
bool
") IsSingular;
		Standard_Boolean IsSingular();

		/****************** Multiplied ******************/
		/**** md5 signature: 4fcb9407a2252203a62bb63402b66229 ****/
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
		/**** md5 signature: babfd1851bc808a202f226a1b8a27d15 ****/
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
		/**** md5 signature: 198f5714b6594623c34e6a5cc372819f ****/
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
		/**** md5 signature: c6d925fe0833ff6abc2c1aab20682246 ****/
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
		/**** md5 signature: 269b25031ee3626d57e26795a85486bb ****/
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
		/**** md5 signature: 661908624c22c04980a9d67a8cde0066 ****/
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
		/**** md5 signature: ef2fc80801794836ab5ff95c139fb82b ****/
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
		/**** md5 signature: df302aa210335aa000b2cfef12b08b4f ****/
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
		/**** md5 signature: 78c41204cb9b57314502eeecf0329c2a ****/
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
		/**** md5 signature: cd333d94dafa69f436113f8f5d459147 ****/
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
		/**** md5 signature: 0030d64303d9ed0b4736cb062dc69967 ****/
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
		/**** md5 signature: 5bbdc9fdffc9b653a262b82f3031092e ****/
		%feature("compactdefaultargs") SetIdentity;
		%feature("autodoc", "Modifies this matrix, so that it represents the identity matrix.

Returns
-------
None
") SetIdentity;
		void SetIdentity();

		/****************** SetRotation ******************/
		/**** md5 signature: 779a0e2b4ad005b9683bae98de50aef0 ****/
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
		/**** md5 signature: 386d735ca93edd828b22966cdcdb98d6 ****/
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
		/**** md5 signature: fc0b78f732840fc6a9858bae94cc6062 ****/
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
		/**** md5 signature: ed1e020e7e73778204761e7ad82059cb ****/
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
		/**** md5 signature: db365e16a78bd3bf72b91ac00f7ecbe0 ****/
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
		/**** md5 signature: b5dad0e007121eba734309739a87df5f ****/
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
		/**** md5 signature: 4961cb1fbfc37eea0a8cde77fb8e3261 ****/
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
		/**** md5 signature: 70e27025c56428cd3bbca609f0f0cfbd ****/
		%feature("compactdefaultargs") Transpose;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Transpose;
		void Transpose();

		/****************** Transposed ******************/
		/**** md5 signature: 5698591f2ae126b757ed3b0b79fd6ff0 ****/
		%feature("compactdefaultargs") Transposed;
		%feature("autodoc", "Transposes the matrix. a(j, i) -> a (i, j).

Returns
-------
gp_Mat2d
") Transposed;
		gp_Mat2d Transposed();

		/****************** Value ******************/
		/**** md5 signature: a9482d47079caf6e7f07fc5a5d2375b1 ****/
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
		/**** md5 signature: 55dad889f6069c2935c250e98bdb6035 ****/
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
		/**** md5 signature: af835aafa15e587e4df61655e93a35ac ****/
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
		/**** md5 signature: c60363dec8c652e51c5ed746f699db30 ****/
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
		/**** md5 signature: 73c59474a30e4347b43b54ecb8a48c7a ****/
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
		/**** md5 signature: 20b9287e4c7e1d57b97810086b3852a9 ****/
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
		/**** md5 signature: e3fc01e2d0307aca63ac3cb95cf5abc4 ****/
		%feature("compactdefaultargs") gp_Parab;
		%feature("autodoc", "Creates an indefinite parabola.

Returns
-------
None
") gp_Parab;
		 gp_Parab();

		/****************** gp_Parab ******************/
		/**** md5 signature: 4ba3c829ef007ee33f2272443829c269 ****/
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
		/**** md5 signature: b945fc2a26bc6e7ec4ddbc18f0b7e19c ****/
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
		/**** md5 signature: cb9b52ff887b682f8bfc1eb2f646705a ****/
		%feature("compactdefaultargs") Axis;
		%feature("autodoc", "Returns the main axis of the parabola. it is the axis normal to the plane of the parabola passing through the vertex of the parabola.

Returns
-------
gp_Ax1
") Axis;
		const gp_Ax1 Axis();

		/****************** Directrix ******************/
		/**** md5 signature: 1608f5c20dd70d6d9961c85822ba9a57 ****/
		%feature("compactdefaultargs") Directrix;
		%feature("autodoc", "Computes the directrix of this parabola. the directrix is: - a line parallel to the 'y direction' of the local coordinate system of this parabola, and - located on the negative side of the axis of symmetry, at a distance from the apex which is equal to the focal length of this parabola. the directrix is returned as an axis (a gp_ax1 object), the origin of which is situated on the 'x axis' of this parabola.

Returns
-------
gp_Ax1
") Directrix;
		gp_Ax1 Directrix();

		/****************** Focal ******************/
		/**** md5 signature: 36c97a85b2e31ded83d59428f0f74c3c ****/
		%feature("compactdefaultargs") Focal;
		%feature("autodoc", "Returns the distance between the vertex and the focus of the parabola.

Returns
-------
float
") Focal;
		Standard_Real Focal();

		/****************** Focus ******************/
		/**** md5 signature: dfde257d151e75b4057f91980799f5e1 ****/
		%feature("compactdefaultargs") Focus;
		%feature("autodoc", "- computes the focus of the parabola.

Returns
-------
gp_Pnt
") Focus;
		gp_Pnt Focus();

		/****************** Location ******************/
		/**** md5 signature: 42040ad2ed401b7e80bf90e4b6b5f418 ****/
		%feature("compactdefaultargs") Location;
		%feature("autodoc", "Returns the vertex of the parabola. it is the 'location' point of the coordinate system of the parabola.

Returns
-------
gp_Pnt
") Location;
		const gp_Pnt Location();

		/****************** Mirror ******************/
		/**** md5 signature: b133f2e6e1c74f672a216a0094bdfda6 ****/
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
		/**** md5 signature: d1a0189a98d756bd9e5b51b4ae49992a ****/
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
		/**** md5 signature: 874cde0169043be133e205e960c3ca57 ****/
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
		/**** md5 signature: bc987a480af27afdd8ff0264de94909e ****/
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
		/**** md5 signature: 3a0e7acd2963abb3dbf567f0484f1ff9 ****/
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
		/**** md5 signature: d51d02d9e5a7140dc07f332dc92ac39f ****/
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
		/**** md5 signature: ecccdeaeaa0deed24f47e61ad75d24f1 ****/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "Computes the parameter of the parabola. it is the distance between the focus and the directrix of the parabola. this distance is twice the focal length.

Returns
-------
float
") Parameter;
		Standard_Real Parameter();

		/****************** Position ******************/
		/**** md5 signature: 4998eb006d0dfaf45366e64da028e2d8 ****/
		%feature("compactdefaultargs") Position;
		%feature("autodoc", "Returns the local coordinate system of the parabola.

Returns
-------
gp_Ax2
") Position;
		const gp_Ax2 Position();

		/****************** Rotate ******************/
		/**** md5 signature: 12c4967f27a0900e4176252164d2f2ce ****/
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
		/**** md5 signature: f88fc2abdf873ebfedc57ad34a7da24b ****/
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
		/**** md5 signature: e66fc526c4232f21fb4238a81292d522 ****/
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
		/**** md5 signature: 93257f779b0924acfc4f09f74520d25a ****/
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
		/**** md5 signature: 4f1ae44e92ff7b1da601b2ca71a3a58a ****/
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
		/**** md5 signature: b79f368485f4739b39b65cdd8789fb05 ****/
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
		/**** md5 signature: c028aee785b685956e8e7d5cba7ecb46 ****/
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
		/**** md5 signature: 370491d423dd18be72ddbe9a7e5a5d72 ****/
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
		/**** md5 signature: 45ee6a37cbc92ff06bd17b5653f32913 ****/
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
		/**** md5 signature: 066b2a61a2170a20e4f85febd9567d46 ****/
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
		/**** md5 signature: b3667af07c9a238180bc31cc15803f78 ****/
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
		/**** md5 signature: 5053222ade9605c7c37102310f06f2e8 ****/
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
		/**** md5 signature: 10a6ffc7244762f226e2e20d5335a07d ****/
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
		/**** md5 signature: 94f030853d481c7fa67787e1d592d31d ****/
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
		/**** md5 signature: 33f98d138ae3ce92d202330aa4ae814d ****/
		%feature("compactdefaultargs") XAxis;
		%feature("autodoc", "Returns the symmetry axis of the parabola. the location point of the axis is the vertex of the parabola.

Returns
-------
gp_Ax1
") XAxis;
		gp_Ax1 XAxis();

		/****************** YAxis ******************/
		/**** md5 signature: b471d966aca0b452073c5d55f8f5e027 ****/
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
		/**** md5 signature: c7819fb5b0cac3646e03c5348cef2cdb ****/
		%feature("compactdefaultargs") gp_Parab2d;
		%feature("autodoc", "Creates an indefinite parabola.

Returns
-------
None
") gp_Parab2d;
		 gp_Parab2d();

		/****************** gp_Parab2d ******************/
		/**** md5 signature: 07792fe9d304f25695f05f61ddba3ec6 ****/
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
		/**** md5 signature: df9ae9e68dd32a93a1ba91cbcad1ec55 ****/
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
		/**** md5 signature: d56288c65f680683fc33ea0d498efa76 ****/
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
		/**** md5 signature: 0eff9937795d77d7fba0cf7a211c0d78 ****/
		%feature("compactdefaultargs") Axis;
		%feature("autodoc", "Returns the local coordinate system of the parabola. the 'location' point of this axis is the vertex of the parabola.

Returns
-------
gp_Ax22d
") Axis;
		gp_Ax22d Axis();

		/****************** Coefficients ******************/
		/**** md5 signature: 2252ad010357f4e043a3c6dac4c3923c ****/
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
		/**** md5 signature: ace6e59edfa4fed38fc517abd7cec6ce ****/
		%feature("compactdefaultargs") Directrix;
		%feature("autodoc", "Computes the directrix of the parabola. the directrix is: - a line parallel to the 'y direction' of the local coordinate system of this parabola, and - located on the negative side of the axis of symmetry, at a distance from the apex which is equal to the focal length of this parabola. the directrix is returned as an axis (a gp_ax2d object), the origin of which is situated on the 'x axis' of this parabola.

Returns
-------
gp_Ax2d
") Directrix;
		gp_Ax2d Directrix();

		/****************** Focal ******************/
		/**** md5 signature: 36c97a85b2e31ded83d59428f0f74c3c ****/
		%feature("compactdefaultargs") Focal;
		%feature("autodoc", "Returns the distance between the vertex and the focus of the parabola.

Returns
-------
float
") Focal;
		Standard_Real Focal();

		/****************** Focus ******************/
		/**** md5 signature: 2c1658317ec9295538436248b7bfe86f ****/
		%feature("compactdefaultargs") Focus;
		%feature("autodoc", "Returns the focus of the parabola.

Returns
-------
gp_Pnt2d
") Focus;
		gp_Pnt2d Focus();

		/****************** IsDirect ******************/
		/**** md5 signature: e230b64eefbb898397296c5ca615d396 ****/
		%feature("compactdefaultargs") IsDirect;
		%feature("autodoc", "Returns true if the local coordinate system is direct and false in the other case.

Returns
-------
bool
") IsDirect;
		Standard_Boolean IsDirect();

		/****************** Location ******************/
		/**** md5 signature: b6d70f653f0835eef3aab3bab16c5c7c ****/
		%feature("compactdefaultargs") Location;
		%feature("autodoc", "Returns the vertex of the parabola.

Returns
-------
gp_Pnt2d
") Location;
		gp_Pnt2d Location();

		/****************** Mirror ******************/
		/**** md5 signature: 5a90a3ec4faf7909390bb0bfb4d9be0f ****/
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
		/**** md5 signature: 8b8d921c1e87f73e8278c4d42ae298f7 ****/
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
		/**** md5 signature: ccb0e47112b65a37a870aee7e58f1808 ****/
		%feature("compactdefaultargs") MirrorAxis;
		%feature("autodoc", "Returns the symmetry axis of the parabola. the 'location' point of this axis is the vertex of the parabola.

Returns
-------
gp_Ax2d
") MirrorAxis;
		gp_Ax2d MirrorAxis();

		/****************** Mirrored ******************/
		/**** md5 signature: ce2e41ca5e4823f565b00761100fb361 ****/
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
		/**** md5 signature: bd84043c244950a58ca43e9e0a2a3d21 ****/
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
		/**** md5 signature: ecccdeaeaa0deed24f47e61ad75d24f1 ****/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "Returns the distance between the focus and the directrix of the parabola.

Returns
-------
float
") Parameter;
		Standard_Real Parameter();

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
		/**** md5 signature: 6bf48843f087cae95361a7db862af02b ****/
		%feature("compactdefaultargs") Reversed;
		%feature("autodoc", "Reverses the orientation of the local coordinate system of this parabola (the 'y direction' is reversed). therefore, the implicit orientation of this parabola is reversed. note: - reverse assigns the result to this parabola, while - reversed creates a new one.

Returns
-------
gp_Parab2d
") Reversed;
		gp_Parab2d Reversed();

		/****************** Rotate ******************/
		/**** md5 signature: 795edcbb32146eb6f071bea4c90f5cfd ****/
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
		/**** md5 signature: fe8504136f3c4abdd45105851b3a2b71 ****/
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
		/**** md5 signature: 5b49a8aeffcacace07c66937f77f1e03 ****/
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
		/**** md5 signature: c6ce0a4e8ae46e5ac90b0067962c7abf ****/
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
		/**** md5 signature: 016f6d0b52d2d85d5711abca672ca103 ****/
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
		/**** md5 signature: b79f368485f4739b39b65cdd8789fb05 ****/
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
		/**** md5 signature: 368c9b8c039b553e22ee650e75e4d404 ****/
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
		/**** md5 signature: 631ceb375b96aa42133509bb9453c5c4 ****/
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
		/**** md5 signature: dace16a29a39216c0dd584c6964e840b ****/
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
		/**** md5 signature: a9e7f590e99a486ea5b42440f32e6069 ****/
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
		/**** md5 signature: 1cd2e000b85692a9f89a6bf8e8e4782c ****/
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
		/**** md5 signature: c7768f1dcf9b6595f2bd4653737544f9 ****/
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
		/**** md5 signature: 7c54dc1a5740026f4e3d9295fed3ae62 ****/
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
		/**** md5 signature: e5f1435e96ae0f486e8d88842afa30c4 ****/
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
		/**** md5 signature: e5e5b8bb0d4fcb8a0a532209a60412ec ****/
		%feature("compactdefaultargs") gp_Pln;
		%feature("autodoc", "Creates a plane coincident with oxy plane of the reference coordinate system.

Returns
-------
None
") gp_Pln;
		 gp_Pln();

		/****************** gp_Pln ******************/
		/**** md5 signature: f7541cf67b6cd85d535e6a191aad6272 ****/
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
		/**** md5 signature: ce6fa1723d6c7fef5ad3fca83a58c732 ****/
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
		/**** md5 signature: d208dff85d8216c73adc04a1452897c6 ****/
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
		/**** md5 signature: cb9b52ff887b682f8bfc1eb2f646705a ****/
		%feature("compactdefaultargs") Axis;
		%feature("autodoc", "Returns the plane's normal axis.

Returns
-------
gp_Ax1
") Axis;
		const gp_Ax1 Axis();

		/****************** Coefficients ******************/
		/**** md5 signature: 5b10aec82a9daa5f313dd60e84b2b00b ****/
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
		/**** md5 signature: 4617c578d595c204f331df6213e3ae4a ****/
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
		/**** md5 signature: b87a7584a63c110678cc5d19e6ae39cb ****/
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
		/**** md5 signature: 33e4e96f61de8e23c989d6f9aec7d457 ****/
		%feature("compactdefaultargs") Direct;
		%feature("autodoc", "Returns true if the ax3 is right handed.

Returns
-------
bool
") Direct;
		Standard_Boolean Direct();

		/****************** Distance ******************/
		/**** md5 signature: d9ba17ce87a8f8e1c8805850d4d732ba ****/
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
		/**** md5 signature: 74f2c2bccd99eafebf461617eb35bd53 ****/
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
		/**** md5 signature: 2dd359e43fa33a1b8ad5abbd2c9b42f8 ****/
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
		/**** md5 signature: 42040ad2ed401b7e80bf90e4b6b5f418 ****/
		%feature("compactdefaultargs") Location;
		%feature("autodoc", "Returns the plane's location (origin).

Returns
-------
gp_Pnt
") Location;
		const gp_Pnt Location();

		/****************** Mirror ******************/
		/**** md5 signature: b133f2e6e1c74f672a216a0094bdfda6 ****/
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
		/**** md5 signature: d1a0189a98d756bd9e5b51b4ae49992a ****/
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
		/**** md5 signature: 874cde0169043be133e205e960c3ca57 ****/
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
		/**** md5 signature: 6483b411a3fa025bd342dc38c7afbc8d ****/
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
		/**** md5 signature: 14516c768e011aabf5bfe877f3457194 ****/
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
		/**** md5 signature: 9d136d70f75717363c3f1500d40d3860 ****/
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
		/**** md5 signature: 68613464f15b3681020927244b13614a ****/
		%feature("compactdefaultargs") Position;
		%feature("autodoc", "Returns the local coordinate system of the plane .

Returns
-------
gp_Ax3
") Position;
		const gp_Ax3 Position();

		/****************** Rotate ******************/
		/**** md5 signature: 12c4967f27a0900e4176252164d2f2ce ****/
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
		/**** md5 signature: cf9b30be4425a77f5a5e0c321a1ef802 ****/
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
		/**** md5 signature: e66fc526c4232f21fb4238a81292d522 ****/
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
		/**** md5 signature: 4edad6906b4eceab594f317715870612 ****/
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
		/**** md5 signature: 4f1ae44e92ff7b1da601b2ca71a3a58a ****/
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
		/**** md5 signature: e697bd81202b5a89ce79ee03acd13d7c ****/
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
		/**** md5 signature: a135fc8d2ccb75941a304eed1c57e31d ****/
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
		/**** md5 signature: 382f20ab66f794f70a8fbaad3ecad14c ****/
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
		/**** md5 signature: ce976f40a4beaf7f94981d49a2f54445 ****/
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
		/**** md5 signature: 1e48ca8e7bc7332edadba77c764cb503 ****/
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
		/**** md5 signature: 45ee6a37cbc92ff06bd17b5653f32913 ****/
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
		/**** md5 signature: 14a13d53ea025ea6314250cfc840f553 ****/
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
		/**** md5 signature: b3667af07c9a238180bc31cc15803f78 ****/
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
		/**** md5 signature: 5053222ade9605c7c37102310f06f2e8 ****/
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
		/**** md5 signature: faa03ad19b44178f15a5c8268dddc174 ****/
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
		/**** md5 signature: 277e4ef7ad7b64dc9cef6f5490ac8f6a ****/
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
		/**** md5 signature: abf35d5ee439e7b6d5054caae87282cf ****/
		%feature("compactdefaultargs") UReverse;
		%feature("autodoc", "Reverses the u parametrization of the plane reversing the xaxis.

Returns
-------
None
") UReverse;
		void UReverse();

		/****************** VReverse ******************/
		/**** md5 signature: 01a05d129bc344a1e2870352e479923d ****/
		%feature("compactdefaultargs") VReverse;
		%feature("autodoc", "Reverses the v parametrization of the plane reversing the yaxis.

Returns
-------
None
") VReverse;
		void VReverse();

		/****************** XAxis ******************/
		/**** md5 signature: 33f98d138ae3ce92d202330aa4ae814d ****/
		%feature("compactdefaultargs") XAxis;
		%feature("autodoc", "Returns the x axis of the plane.

Returns
-------
gp_Ax1
") XAxis;
		gp_Ax1 XAxis();

		/****************** YAxis ******************/
		/**** md5 signature: b471d966aca0b452073c5d55f8f5e027 ****/
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
		/**** md5 signature: 9986b2be22205ca669d961b504cb10d6 ****/
		%feature("compactdefaultargs") gp_Pnt;
		%feature("autodoc", "Creates a point with zero coordinates.

Returns
-------
None
") gp_Pnt;
		 gp_Pnt();

		/****************** gp_Pnt ******************/
		/**** md5 signature: 52a9ae66aafdb298b35e4775441b34e3 ****/
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
		/**** md5 signature: d005a967c242040a4678fe778b250536 ****/
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
		/**** md5 signature: bf3a34847072aaf6946762140c9e7ef4 ****/
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
		/**** md5 signature: d91a016f7d04b80a3a235c21dc303efd ****/
		%feature("compactdefaultargs") ChangeCoord;
		%feature("autodoc", "Returns the coordinates of this point. note: this syntax allows direct modification of the returned value.

Returns
-------
gp_XYZ
") ChangeCoord;
		gp_XYZ ChangeCoord();

		/****************** Coord ******************/
		/**** md5 signature: 615686a863135af4177d92a1b696f909 ****/
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
		/**** md5 signature: 8d12511db3c61746f51be65107e427ef ****/
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
		/**** md5 signature: 4b57b76897a7b1cefab8b85d379a9b61 ****/
		%feature("compactdefaultargs") Coord;
		%feature("autodoc", "For this point, returns its three coordinates as a xyz object.

Returns
-------
gp_XYZ
") Coord;
		const gp_XYZ Coord();

		/****************** Distance ******************/
		/**** md5 signature: a3f76ef7087abde72f705ea17a532c32 ****/
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
		/**** md5 signature: fac4cb0b0c6a2d6b9d46b54ba1428589 ****/
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
		/**** md5 signature: b133f2e6e1c74f672a216a0094bdfda6 ****/
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
		/**** md5 signature: d1a0189a98d756bd9e5b51b4ae49992a ****/
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
		/**** md5 signature: 874cde0169043be133e205e960c3ca57 ****/
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
		/**** md5 signature: 52066bc5dd5834801faec2f2e0389b42 ****/
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
		/**** md5 signature: 003fad303721f03992a3523f97234579 ****/
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
		/**** md5 signature: f1fe1457937d7f6cb258ba2c904c0302 ****/
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
		/**** md5 signature: 12c4967f27a0900e4176252164d2f2ce ****/
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
		/**** md5 signature: a61f63082aa6d7c69240687cc6db7957 ****/
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
		/**** md5 signature: e66fc526c4232f21fb4238a81292d522 ****/
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
		/**** md5 signature: 49253a0db54f2dddf5e3b51341a95a25 ****/
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
		/**** md5 signature: 6a7aba643afced1a67b8420fce55034e ****/
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
		/**** md5 signature: 04daf90424b865da259787c0c109b56e ****/
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
		/**** md5 signature: 30fe204d4c67d94370133e1d40dc6787 ****/
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
		/**** md5 signature: 970583a1db197d138846d12b1374d359 ****/
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
		/**** md5 signature: 8f42f770a3959dece2671d90f60e35e2 ****/
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
		/**** md5 signature: d96a64d9a788ed7bdd745a3dcbb831ea ****/
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
		/**** md5 signature: b1b7443f7eb77c19895513a3c2ecc35e ****/
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
		/**** md5 signature: 45ee6a37cbc92ff06bd17b5653f32913 ****/
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
		/**** md5 signature: 85a803c53321bd028fd87108d787242e ****/
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
		/**** md5 signature: b3667af07c9a238180bc31cc15803f78 ****/
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
		/**** md5 signature: 5053222ade9605c7c37102310f06f2e8 ****/
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
		/**** md5 signature: b9d0448ca2ce59b9555512423c2f300c ****/
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
		/**** md5 signature: bd8eb14c4e34e3e3dd37c5e50ee57a4b ****/
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
		/**** md5 signature: 2dbf42f7dc56303f104fb0fa585dc6e6 ****/
		%feature("compactdefaultargs") X;
		%feature("autodoc", "For this point, returns its x coordinate.

Returns
-------
float
") X;
		Standard_Real X();

		/****************** XYZ ******************/
		/**** md5 signature: ad2670b5502d8f29f92f756fdb200090 ****/
		%feature("compactdefaultargs") XYZ;
		%feature("autodoc", "For this point, returns its three coordinates as a xyz object.

Returns
-------
gp_XYZ
") XYZ;
		const gp_XYZ XYZ();

		/****************** Y ******************/
		/**** md5 signature: 7fd17991f11a9702e525c7070ce7cec6 ****/
		%feature("compactdefaultargs") Y;
		%feature("autodoc", "For this point, returns its y coordinate.

Returns
-------
float
") Y;
		Standard_Real Y();

		/****************** Z ******************/
		/**** md5 signature: 87b89b9e016f37b0146cf52868684676 ****/
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
		/**** md5 signature: bdb5e7db958fb2f7240c5d4064004d09 ****/
		%feature("compactdefaultargs") gp_Pnt2d;
		%feature("autodoc", "Creates a point with zero coordinates.

Returns
-------
None
") gp_Pnt2d;
		 gp_Pnt2d();

		/****************** gp_Pnt2d ******************/
		/**** md5 signature: 5555a158a84391043ca41f24d4995cf0 ****/
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
		/**** md5 signature: f458ba6fe010062959e1a1295c4c6ed6 ****/
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
		/**** md5 signature: daa7b4f69b48a458b836d6c84fd26869 ****/
		%feature("compactdefaultargs") ChangeCoord;
		%feature("autodoc", "Returns the coordinates of this point. note: this syntax allows direct modification of the returned value.

Returns
-------
gp_XY
") ChangeCoord;
		gp_XY ChangeCoord();

		/****************** Coord ******************/
		/**** md5 signature: 615686a863135af4177d92a1b696f909 ****/
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
		/**** md5 signature: bf99eedc1b01fce64310eda5f9815756 ****/
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
		/**** md5 signature: 8cf95df0ebf8dea346f97abb4b1c36bd ****/
		%feature("compactdefaultargs") Coord;
		%feature("autodoc", "For this point, returns its two coordinates as a number pair.

Returns
-------
gp_XY
") Coord;
		const gp_XY Coord();

		/****************** Distance ******************/
		/**** md5 signature: 45d37779d0699a561f05bd0252dd478b ****/
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
		/**** md5 signature: c7b908b5b337585cb84e3de55f70564d ****/
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
		/**** md5 signature: 5a90a3ec4faf7909390bb0bfb4d9be0f ****/
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
		/**** md5 signature: 8b8d921c1e87f73e8278c4d42ae298f7 ****/
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
		/**** md5 signature: 5ddcbaf7de65adc88c09d20bc6bfa1af ****/
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
		/**** md5 signature: 3237eec51f4d13884ee7352228c40147 ****/
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
		/**** md5 signature: 795edcbb32146eb6f071bea4c90f5cfd ****/
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
		/**** md5 signature: b3b5f15a41a4c44f3e4c0afb47ca2b3f ****/
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
		/**** md5 signature: 5b49a8aeffcacace07c66937f77f1e03 ****/
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
		/**** md5 signature: 501ecf9172096ebf6c460629f8b5741e ****/
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
		/**** md5 signature: 6a7aba643afced1a67b8420fce55034e ****/
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
		/**** md5 signature: 6360ae07448638f0dbe624db729d2fc2 ****/
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
		/**** md5 signature: 30fe204d4c67d94370133e1d40dc6787 ****/
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
		/**** md5 signature: 6c2893a57a740cb14668b2ad98f8f8f8 ****/
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
		/**** md5 signature: 8f42f770a3959dece2671d90f60e35e2 ****/
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
		/**** md5 signature: 1717e60f5fc9fff5a5d235f31e374703 ****/
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
		/**** md5 signature: dace16a29a39216c0dd584c6964e840b ****/
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
		/**** md5 signature: 686672b50d5d601ea082ab9bcb9de181 ****/
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
		/**** md5 signature: 1cd2e000b85692a9f89a6bf8e8e4782c ****/
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
		/**** md5 signature: c7768f1dcf9b6595f2bd4653737544f9 ****/
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
		/**** md5 signature: 131ffbdb9bd95a382668df31ca088793 ****/
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
		/**** md5 signature: 554d42a2d057b762bf2620b7d6ff191e ****/
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
		/**** md5 signature: 2dbf42f7dc56303f104fb0fa585dc6e6 ****/
		%feature("compactdefaultargs") X;
		%feature("autodoc", "For this point, returns its x coordinate.

Returns
-------
float
") X;
		Standard_Real X();

		/****************** XY ******************/
		/**** md5 signature: 0572c9669063bef343b6bffa656e7e3a ****/
		%feature("compactdefaultargs") XY;
		%feature("autodoc", "For this point, returns its two coordinates as a number pair.

Returns
-------
gp_XY
") XY;
		const gp_XY XY();

		/****************** Y ******************/
		/**** md5 signature: 7fd17991f11a9702e525c7070ce7cec6 ****/
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
		/**** md5 signature: 8f260eebb7d0825b3549c0f26322905d ****/
		%feature("compactdefaultargs") gp_Quaternion;
		%feature("autodoc", "Creates an identity quaternion.

Returns
-------
None
") gp_Quaternion;
		 gp_Quaternion();

		/****************** gp_Quaternion ******************/
		/**** md5 signature: be14d63eeace74121262994a3638f24e ****/
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
		/**** md5 signature: 598558a9ff5a5d25aa21a89720f4b597 ****/
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
		/**** md5 signature: f435bfacfee67199c3f9552e8bb3cb01 ****/
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
		/**** md5 signature: 7430bdcc642a839c4641b17063ddc1fe ****/
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
		/**** md5 signature: 67cd5bb33c490fe562d97967f7b36087 ****/
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
		/**** md5 signature: 3d8b1704f51b684d73640239af448e00 ****/
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
		/**** md5 signature: 89bc03e00ba8a3a9b28df641bf26e36f ****/
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
		/**** md5 signature: cd1f332eb9636e6e73dd41e1d2919236 ****/
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
		/**** md5 signature: c9c9c1574b059eb19623af08fdbed154 ****/
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
		/**** md5 signature: 858ec6e98f8ac9b013d0c47e564c3f13 ****/
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
		/**** md5 signature: b713aea5ecd36799afb034f7a8cb805c ****/
		%feature("compactdefaultargs") GetMatrix;
		%feature("autodoc", "Returns rotation operation as 3*3 matrix.

Returns
-------
gp_Mat
") GetMatrix;
		gp_Mat GetMatrix();

		/****************** GetRotationAngle ******************/
		/**** md5 signature: df2f57e7257eb50bc4a37dacae6aec21 ****/
		%feature("compactdefaultargs") GetRotationAngle;
		%feature("autodoc", "Return rotation angle from -pi to pi.

Returns
-------
float
") GetRotationAngle;
		Standard_Real GetRotationAngle();

		/****************** GetVectorAndAngle ******************/
		/**** md5 signature: c25ff6da9e4be0e2a3559f1af7e29e6f ****/
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
		/**** md5 signature: 980f166f600d23a8c77565829af2eeff ****/
		%feature("compactdefaultargs") Invert;
		%feature("autodoc", "Inverts quaternion (both rotation direction and norm).

Returns
-------
None
") Invert;
		void Invert();

		/****************** Inverted ******************/
		/**** md5 signature: 0eb99f8a9da22cb5404e45f9d14290e5 ****/
		%feature("compactdefaultargs") Inverted;
		%feature("autodoc", "Return inversed quaternion q^-1.

Returns
-------
gp_Quaternion
") Inverted;
		gp_Quaternion Inverted();

		/****************** IsEqual ******************/
		/**** md5 signature: 194ecc3e695bd2557b35338e153dfbd5 ****/
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
		/**** md5 signature: f63c763a6bb61294f87ae40ab0dca3a7 ****/
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
		/**** md5 signature: f68470dcbe66c530ffbe63b2a92b6de6 ****/
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
		/**** md5 signature: ced669a12f9467bc1c436087062a6afc ****/
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
		/**** md5 signature: d37595c9f907def7fe6ee7b947fdf46e ****/
		%feature("compactdefaultargs") Negated;
		%feature("autodoc", "Returns quaternion with all components negated. note that this operation does not affect neither rotation operator defined by quaternion nor its norm.

Returns
-------
gp_Quaternion
") Negated;
		gp_Quaternion Negated();

		/****************** Norm ******************/
		/**** md5 signature: ef03a75c3e2c2e2728051dc33ad502de ****/
		%feature("compactdefaultargs") Norm;
		%feature("autodoc", "Returns norm of quaternion.

Returns
-------
float
") Norm;
		Standard_Real Norm();

		/****************** Normalize ******************/
		/**** md5 signature: 587346cf1e1c12fdf674aedc915ccd95 ****/
		%feature("compactdefaultargs") Normalize;
		%feature("autodoc", "Scale quaternion that its norm goes to 1. the appearing of 0 magnitude or near is a error, so we can be sure that can divide by magnitude.

Returns
-------
None
") Normalize;
		void Normalize();

		/****************** Normalized ******************/
		/**** md5 signature: d80fbdff5f3814015f8fd80babe081b3 ****/
		%feature("compactdefaultargs") Normalized;
		%feature("autodoc", "Returns quaternion scaled so that its norm goes to 1.

Returns
-------
gp_Quaternion
") Normalized;
		gp_Quaternion Normalized();

		/****************** Reverse ******************/
		/**** md5 signature: b751d6874fc026e19a7a6cb37e9ac1b4 ****/
		%feature("compactdefaultargs") Reverse;
		%feature("autodoc", "Reverse direction of rotation (conjugate quaternion).

Returns
-------
None
") Reverse;
		void Reverse();

		/****************** Reversed ******************/
		/**** md5 signature: 7d979f487396b0328f735b565cae6be5 ****/
		%feature("compactdefaultargs") Reversed;
		%feature("autodoc", "Return rotation with reversed direction (conjugated quaternion).

Returns
-------
gp_Quaternion
") Reversed;
		gp_Quaternion Reversed();

		/****************** Scale ******************/
		/**** md5 signature: d90438501cb2e3c1df2f960e1732ab23 ****/
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
		/**** md5 signature: 0846fc600b0f4910286582bbca23f7f4 ****/
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
		/**** md5 signature: 5f25cb94856e75f818d2daff38b5d59b ****/
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
		/**** md5 signature: ad310ae032124af045ddec68bbe1f321 ****/
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
		/**** md5 signature: 3d1d996912bb69649939bcb3dfb99030 ****/
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
		/**** md5 signature: ba812ca978f2b1dcb6e27631c4e569ca ****/
		%feature("compactdefaultargs") SetIdent;
		%feature("autodoc", "Make identity quaternion (zero-rotation).

Returns
-------
None
") SetIdent;
		void SetIdent();

		/****************** SetMatrix ******************/
		/**** md5 signature: a4cbfa86f7b0850889e49d3a99812bf2 ****/
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
		/**** md5 signature: cf8784d6b71b8f58af12ffa7098db996 ****/
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
		/**** md5 signature: 0c660ebf2aa10cb48307332420b5d9a6 ****/
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
		/**** md5 signature: 99b6d310a7d7edbc9970f6d714c01f21 ****/
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
		/**** md5 signature: 2c83246f1397a00d645d56132302070e ****/
		%feature("compactdefaultargs") SquareNorm;
		%feature("autodoc", "Returns square norm of quaternion.

Returns
-------
float
") SquareNorm;
		Standard_Real SquareNorm();

		/****************** StabilizeLength ******************/
		/**** md5 signature: aaaf2fcf2c978a91cf9ac2310589bf1a ****/
		%feature("compactdefaultargs") StabilizeLength;
		%feature("autodoc", "Stabilize quaternion length within 1 - 1/4. this operation is a lot faster than normalization and preserve length goes to 0 or infinity.

Returns
-------
None
") StabilizeLength;
		void StabilizeLength();

		/****************** Subtract ******************/
		/**** md5 signature: 9ef89e00b18ea43c5e3d529b547464e9 ****/
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
		/**** md5 signature: 17253b3a7801af2e41256947dc7619b7 ****/
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
		/**** md5 signature: dde24677dd63b48ccacea2fe8006eed7 ****/
		%feature("compactdefaultargs") W;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") W;
		Standard_Real W();

		/****************** X ******************/
		/**** md5 signature: 2dbf42f7dc56303f104fb0fa585dc6e6 ****/
		%feature("compactdefaultargs") X;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") X;
		Standard_Real X();

		/****************** Y ******************/
		/**** md5 signature: 7fd17991f11a9702e525c7070ce7cec6 ****/
		%feature("compactdefaultargs") Y;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") Y;
		Standard_Real Y();

		/****************** Z ******************/
		/**** md5 signature: 87b89b9e016f37b0146cf52868684676 ****/
		%feature("compactdefaultargs") Z;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") Z;
		Standard_Real Z();

		/****************** operator * ******************/
		/**** md5 signature: dcdedaf1e0bc52cb9bc0dd8c635f10f1 ****/
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
		/**** md5 signature: b519a6298d5bf2aa386a53bb7b786f21 ****/
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
		/**** md5 signature: dd038dab60466c206b35e47705edc0dc ****/
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
		/**** md5 signature: 8a4916c7f7f9f9981e41b258333dba26 ****/
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
		/**** md5 signature: 2400ff17b24d500dd5a6327221c22f34 ****/
		%feature("compactdefaultargs") operator -;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Quaternion
") operator -;
		gp_Quaternion operator -();

		/****************** operator - ******************/
		/**** md5 signature: 60b31e4c0b9b796c593c9036083f2044 ****/
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
		/**** md5 signature: a01b62f343ae78c29cbc993282b2b806 ****/
		%feature("compactdefaultargs") gp_QuaternionNLerp;
		%feature("autodoc", "Empty constructor,.

Returns
-------
None
") gp_QuaternionNLerp;
		 gp_QuaternionNLerp();

		/****************** gp_QuaternionNLerp ******************/
		/**** md5 signature: a3dc49965f8fc9eb5b1b3c4839244818 ****/
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
		/**** md5 signature: 307170b955ce7b69e82a89c8c86d7085 ****/
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
		/**** md5 signature: 032020104006f196b9b1aa3af37bb646 ****/
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
		/**** md5 signature: ce97d06be5dda8783b3aa792c761c918 ****/
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
		/**** md5 signature: 9ba9baebd825100859017f381d1804ef ****/
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
		/**** md5 signature: 66fbc74f555bc06073eb6c0f87894298 ****/
		%feature("compactdefaultargs") gp_QuaternionSLerp;
		%feature("autodoc", "Empty constructor,.

Returns
-------
None
") gp_QuaternionSLerp;
		 gp_QuaternionSLerp();

		/****************** gp_QuaternionSLerp ******************/
		/**** md5 signature: 17456e45790f76559348af2931e6d077 ****/
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
		/**** md5 signature: 307170b955ce7b69e82a89c8c86d7085 ****/
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
		/**** md5 signature: 032020104006f196b9b1aa3af37bb646 ****/
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
		/**** md5 signature: ce97d06be5dda8783b3aa792c761c918 ****/
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
		/**** md5 signature: 9ba9baebd825100859017f381d1804ef ****/
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
		/**** md5 signature: 196219305043019f242a0c1cd15f6b1c ****/
		%feature("compactdefaultargs") gp_Sphere;
		%feature("autodoc", "Creates an indefinite sphere.

Returns
-------
None
") gp_Sphere;
		 gp_Sphere();

		/****************** gp_Sphere ******************/
		/**** md5 signature: ee91c99cb23d92a082dd42b8a4663765 ****/
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
		/**** md5 signature: a514cbcf0bd2f53e9374f58dcecded92 ****/
		%feature("compactdefaultargs") Area;
		%feature("autodoc", "Computes the aera of the sphere.

Returns
-------
float
") Area;
		Standard_Real Area();

		/****************** Coefficients ******************/
		/**** md5 signature: 922ffb066c913dfb924eafd175a6358f ****/
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
		/**** md5 signature: 33e4e96f61de8e23c989d6f9aec7d457 ****/
		%feature("compactdefaultargs") Direct;
		%feature("autodoc", "Returns true if the local coordinate system of this sphere is right-handed.

Returns
-------
bool
") Direct;
		Standard_Boolean Direct();

		/****************** Location ******************/
		/**** md5 signature: 42040ad2ed401b7e80bf90e4b6b5f418 ****/
		%feature("compactdefaultargs") Location;
		%feature("autodoc", "--- purpose ; returns the center of the sphere.

Returns
-------
gp_Pnt
") Location;
		const gp_Pnt Location();

		/****************** Mirror ******************/
		/**** md5 signature: b133f2e6e1c74f672a216a0094bdfda6 ****/
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
		/**** md5 signature: d1a0189a98d756bd9e5b51b4ae49992a ****/
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
		/**** md5 signature: 874cde0169043be133e205e960c3ca57 ****/
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
		/**** md5 signature: b9020cd73b456ee3fcd548ddd993f42e ****/
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
		/**** md5 signature: d7fd743f716f8e86a09dbe2ad879f5f2 ****/
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
		/**** md5 signature: 7b21d0fdbd50bd2c035ea3d72eb0664f ****/
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
		/**** md5 signature: 68613464f15b3681020927244b13614a ****/
		%feature("compactdefaultargs") Position;
		%feature("autodoc", "Returns the local coordinates system of the sphere.

Returns
-------
gp_Ax3
") Position;
		const gp_Ax3 Position();

		/****************** Radius ******************/
		/**** md5 signature: 506a8dc1140a54bd4146c24bb5357fbf ****/
		%feature("compactdefaultargs") Radius;
		%feature("autodoc", "Returns the radius of the sphere.

Returns
-------
float
") Radius;
		Standard_Real Radius();

		/****************** Rotate ******************/
		/**** md5 signature: 12c4967f27a0900e4176252164d2f2ce ****/
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
		/**** md5 signature: 0c6d3c7fc4963e7d571f54211068486b ****/
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
		/**** md5 signature: e66fc526c4232f21fb4238a81292d522 ****/
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
		/**** md5 signature: d4261d215dd48dc912e7df9f8164385b ****/
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
		/**** md5 signature: e697bd81202b5a89ce79ee03acd13d7c ****/
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
		/**** md5 signature: a135fc8d2ccb75941a304eed1c57e31d ****/
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
		/**** md5 signature: 452d48523583bd00e647880614077dd6 ****/
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
		/**** md5 signature: 45ee6a37cbc92ff06bd17b5653f32913 ****/
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
		/**** md5 signature: 2d1a460a3c470b5ba1330c957be01438 ****/
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
		/**** md5 signature: b3667af07c9a238180bc31cc15803f78 ****/
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
		/**** md5 signature: 5053222ade9605c7c37102310f06f2e8 ****/
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
		/**** md5 signature: ead19d106198a3daf20637efa461c847 ****/
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
		/**** md5 signature: 00a4973c344d6db8f3031123478a23e8 ****/
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
		/**** md5 signature: abf35d5ee439e7b6d5054caae87282cf ****/
		%feature("compactdefaultargs") UReverse;
		%feature("autodoc", "Reverses the u parametrization of the sphere reversing the yaxis.

Returns
-------
None
") UReverse;
		void UReverse();

		/****************** VReverse ******************/
		/**** md5 signature: 01a05d129bc344a1e2870352e479923d ****/
		%feature("compactdefaultargs") VReverse;
		%feature("autodoc", "Reverses the v parametrization of the sphere reversing the zaxis.

Returns
-------
None
") VReverse;
		void VReverse();

		/****************** Volume ******************/
		/**** md5 signature: 09f69eb56723243a302bd3839799847b ****/
		%feature("compactdefaultargs") Volume;
		%feature("autodoc", "Computes the volume of the sphere.

Returns
-------
float
") Volume;
		Standard_Real Volume();

		/****************** XAxis ******************/
		/**** md5 signature: 33f98d138ae3ce92d202330aa4ae814d ****/
		%feature("compactdefaultargs") XAxis;
		%feature("autodoc", "Returns the axis x of the sphere.

Returns
-------
gp_Ax1
") XAxis;
		gp_Ax1 XAxis();

		/****************** YAxis ******************/
		/**** md5 signature: b471d966aca0b452073c5d55f8f5e027 ****/
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
		/**** md5 signature: b8b97b042b5c52a5b6588a0daf923e14 ****/
		%feature("compactdefaultargs") gp_Torus;
		%feature("autodoc", "Creates an indefinite torus.

Returns
-------
None
") gp_Torus;
		 gp_Torus();

		/****************** gp_Torus ******************/
		/**** md5 signature: 67c6d04618551e27fc6e3723983ffed7 ****/
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
		/**** md5 signature: a514cbcf0bd2f53e9374f58dcecded92 ****/
		%feature("compactdefaultargs") Area;
		%feature("autodoc", "Computes the area of the torus.

Returns
-------
float
") Area;
		Standard_Real Area();

		/****************** Axis ******************/
		/**** md5 signature: cb9b52ff887b682f8bfc1eb2f646705a ****/
		%feature("compactdefaultargs") Axis;
		%feature("autodoc", "Returns the symmetry axis of the torus.

Returns
-------
gp_Ax1
") Axis;
		const gp_Ax1 Axis();

		/****************** Direct ******************/
		/**** md5 signature: 33e4e96f61de8e23c989d6f9aec7d457 ****/
		%feature("compactdefaultargs") Direct;
		%feature("autodoc", "Returns true if the ax3, the local coordinate system of this torus, is right handed.

Returns
-------
bool
") Direct;
		Standard_Boolean Direct();

		/****************** Location ******************/
		/**** md5 signature: 42040ad2ed401b7e80bf90e4b6b5f418 ****/
		%feature("compactdefaultargs") Location;
		%feature("autodoc", "Returns the torus's location.

Returns
-------
gp_Pnt
") Location;
		const gp_Pnt Location();

		/****************** MajorRadius ******************/
		/**** md5 signature: e961bb81456f4d0a6154d0e9401e1ce8 ****/
		%feature("compactdefaultargs") MajorRadius;
		%feature("autodoc", "Returns the major radius of the torus.

Returns
-------
float
") MajorRadius;
		Standard_Real MajorRadius();

		/****************** MinorRadius ******************/
		/**** md5 signature: e1383e2287a25901af1e2b42cc95af4d ****/
		%feature("compactdefaultargs") MinorRadius;
		%feature("autodoc", "Returns the minor radius of the torus.

Returns
-------
float
") MinorRadius;
		Standard_Real MinorRadius();

		/****************** Mirror ******************/
		/**** md5 signature: b133f2e6e1c74f672a216a0094bdfda6 ****/
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
		/**** md5 signature: d1a0189a98d756bd9e5b51b4ae49992a ****/
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
		/**** md5 signature: 874cde0169043be133e205e960c3ca57 ****/
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
		/**** md5 signature: 3cd892460ad0ff5200f0fee6e9fb5954 ****/
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
		/**** md5 signature: e3646debc1ef6aa780856d482104a451 ****/
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
		/**** md5 signature: 49bd16952885af8df050070235b63c39 ****/
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
		/**** md5 signature: 68613464f15b3681020927244b13614a ****/
		%feature("compactdefaultargs") Position;
		%feature("autodoc", "Returns the local coordinates system of the torus.

Returns
-------
gp_Ax3
") Position;
		const gp_Ax3 Position();

		/****************** Rotate ******************/
		/**** md5 signature: 12c4967f27a0900e4176252164d2f2ce ****/
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
		/**** md5 signature: 63c6ce6f9847836420b2dfdfe8ef7db2 ****/
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
		/**** md5 signature: e66fc526c4232f21fb4238a81292d522 ****/
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
		/**** md5 signature: 023289c427d1ae9537decd18f9d7f05c ****/
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
		/**** md5 signature: 4f1ae44e92ff7b1da601b2ca71a3a58a ****/
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
		/**** md5 signature: e697bd81202b5a89ce79ee03acd13d7c ****/
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
		/**** md5 signature: 5b6d39118ca624402ca904f240869d93 ****/
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
		/**** md5 signature: 55b33932324c77b3c1e82a433bb9350f ****/
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
		/**** md5 signature: a135fc8d2ccb75941a304eed1c57e31d ****/
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
		/**** md5 signature: 45ee6a37cbc92ff06bd17b5653f32913 ****/
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
		/**** md5 signature: a7b0ae46f066ffaff4f308e5ab407c61 ****/
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
		/**** md5 signature: b3667af07c9a238180bc31cc15803f78 ****/
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
		/**** md5 signature: 5053222ade9605c7c37102310f06f2e8 ****/
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
		/**** md5 signature: dd1d054b4122018296d398fcb7d3f473 ****/
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
		/**** md5 signature: c9efe90de6ed10d06ef68f6b33d2b8bb ****/
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
		/**** md5 signature: abf35d5ee439e7b6d5054caae87282cf ****/
		%feature("compactdefaultargs") UReverse;
		%feature("autodoc", "Reverses the u parametrization of the torus reversing the yaxis.

Returns
-------
None
") UReverse;
		void UReverse();

		/****************** VReverse ******************/
		/**** md5 signature: 01a05d129bc344a1e2870352e479923d ****/
		%feature("compactdefaultargs") VReverse;
		%feature("autodoc", "Reverses the v parametrization of the torus reversing the zaxis.

Returns
-------
None
") VReverse;
		void VReverse();

		/****************** Volume ******************/
		/**** md5 signature: 09f69eb56723243a302bd3839799847b ****/
		%feature("compactdefaultargs") Volume;
		%feature("autodoc", "Computes the volume of the torus.

Returns
-------
float
") Volume;
		Standard_Real Volume();

		/****************** XAxis ******************/
		/**** md5 signature: 33f98d138ae3ce92d202330aa4ae814d ****/
		%feature("compactdefaultargs") XAxis;
		%feature("autodoc", "Returns the axis x of the torus.

Returns
-------
gp_Ax1
") XAxis;
		gp_Ax1 XAxis();

		/****************** YAxis ******************/
		/**** md5 signature: b471d966aca0b452073c5d55f8f5e027 ****/
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
		/**** md5 signature: 8d27be753f710db915d5c753f537a389 ****/
		%feature("compactdefaultargs") gp_Trsf;
		%feature("autodoc", "Returns the identity transformation.

Returns
-------
None
") gp_Trsf;
		 gp_Trsf();

		/****************** gp_Trsf ******************/
		/**** md5 signature: ff319e1df46aadd34b6bb57ed5a8adc4 ****/
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
		/**** md5 signature: 9bfbf058eebcd895fd3b29a4bba4ff05 ****/
		%feature("compactdefaultargs") Form;
		%feature("autodoc", "Returns the nature of the transformation. it can be: an identity transformation, a rotation, a translation, a mirror transformation (relative to a point, an axis or a plane), a scaling transformation, or a compound transformation.

Returns
-------
gp_TrsfForm
") Form;
		gp_TrsfForm Form();

		/****************** GetRotation ******************/
		/**** md5 signature: 507be993084ed6437c3e6d646f1fc5b8 ****/
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
		/**** md5 signature: 2b6ec5870e6bdcf47232f9eb0ab62106 ****/
		%feature("compactdefaultargs") GetRotation;
		%feature("autodoc", "Returns quaternion representing rotational part of the transformation.

Returns
-------
gp_Quaternion
") GetRotation;
		gp_Quaternion GetRotation();

		/****************** HVectorialPart ******************/
		/**** md5 signature: 9d5ac2039e694cad172914c9b0b47f35 ****/
		%feature("compactdefaultargs") HVectorialPart;
		%feature("autodoc", "Computes the homogeneous vectorial part of the transformation. it is a 3*3 matrix which doesn't include the scale factor. in other words, the vectorial part of this transformation is equal to its homogeneous vectorial part, multiplied by the scale factor. the coefficients of this matrix must be multiplied by the scale factor to obtain the coefficients of the transformation.

Returns
-------
gp_Mat
") HVectorialPart;
		const gp_Mat HVectorialPart();

		/****************** Invert ******************/
		/**** md5 signature: 980f166f600d23a8c77565829af2eeff ****/
		%feature("compactdefaultargs") Invert;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Invert;
		void Invert();

		/****************** Inverted ******************/
		/**** md5 signature: 0af22f80e92f934a325f524749a27b71 ****/
		%feature("compactdefaultargs") Inverted;
		%feature("autodoc", "Computes the reverse transformation raises an exception if the matrix of the transformation is not inversible, it means that the scale factor is lower or equal to resolution from package gp. computes the transformation composed with t and <self>. in a c++ implementation you can also write tcomposed = <self> * t. example : trsf t1, t2, tcomp; ............... tcomp = t2.multiplied(t1); // or (tcomp = t2 * t1) pnt p1(10.,3.,4.); pnt p2 = p1.transformed(tcomp); //using tcomp pnt p3 = p1.transformed(t1); //using t1 then t2 p3.transform(t2); // p3 = p2 !!!.

Returns
-------
gp_Trsf
") Inverted;
		gp_Trsf Inverted();

		/****************** IsNegative ******************/
		/**** md5 signature: 526e6184e7b7162d8ef698149b1c8ce5 ****/
		%feature("compactdefaultargs") IsNegative;
		%feature("autodoc", "Returns true if the determinant of the vectorial part of this transformation is negative.

Returns
-------
bool
") IsNegative;
		Standard_Boolean IsNegative();

		/****************** Multiplied ******************/
		/**** md5 signature: 89b92b3a39c58aebd18082edd25d666a ****/
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
		/**** md5 signature: bc915dbbebad2f35a4cfab175626a227 ****/
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
		/**** md5 signature: 269b25031ee3626d57e26795a85486bb ****/
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
		/**** md5 signature: 6e96fd771da7729ebceb97ff688f16a1 ****/
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
		/**** md5 signature: d4d32a76005d5e4a96b92c51a22f3aa2 ****/
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
		/**** md5 signature: 67d4a7cfb2dd29c2b400060f1b45b408 ****/
		%feature("compactdefaultargs") ScaleFactor;
		%feature("autodoc", "Returns the scale factor.

Returns
-------
float
") ScaleFactor;
		Standard_Real ScaleFactor();

		/****************** SetDisplacement ******************/
		/**** md5 signature: 9bf849b4599711f0b03637e4e716c209 ****/
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
		/**** md5 signature: 65354246303419aa6b6fa1be5cf42b84 ****/
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
		/**** md5 signature: f79e1ea77fbdee1c320e31f1361c6730 ****/
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
		/**** md5 signature: 7066d9b31af98c9ea86817347daf465c ****/
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
		/**** md5 signature: 2cac197a24c1c944e551f1729fc5c5a3 ****/
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
		/**** md5 signature: e4f7150e32cd576cae0fcd176262eefe ****/
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
		/**** md5 signature: 7d51e336d3737a06a70e6b5412ccae8f ****/
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
		/**** md5 signature: bf33240be4dcb89b9e42c27b642a81bf ****/
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
		/**** md5 signature: da113cffaf2ef9a65380a09f05d05bb1 ****/
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
		/**** md5 signature: 1172606e4d13b47f0de8f2da05be4ded ****/
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
		/**** md5 signature: f2a94f640dbd08deb586685735aab53b ****/
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
		/**** md5 signature: 8194ad800cc651e635a541abc46fe606 ****/
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
		/**** md5 signature: 3c31d10ba59c354954be3d02e796470a ****/
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
		/**** md5 signature: 95f25a5655da9a70e74001ee732a80d6 ****/
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
		/**** md5 signature: 144e7417a5d30b2f71608f942b5e11c9 ****/
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
		/**** md5 signature: 2824051ae13eff24c35e73ba100d22d0 ****/
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
		/**** md5 signature: e55c1b0b3132b0094009ac78081a704b ****/
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
		/**** md5 signature: 7c9a74fca6704e5441fbd1b45b0d2603 ****/
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
		/**** md5 signature: 522a640cf54bd3f09fb41e692c8c176d ****/
		%feature("compactdefaultargs") TranslationPart;
		%feature("autodoc", "Returns the translation part of the transformation's matrix.

Returns
-------
gp_XYZ
") TranslationPart;
		const gp_XYZ TranslationPart();

		/****************** Value ******************/
		/**** md5 signature: 1f17b21423db514e298b820a9dd11211 ****/
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
		/**** md5 signature: bdd8d899188313a9c1b3691b370bb091 ****/
		%feature("compactdefaultargs") VectorialPart;
		%feature("autodoc", "Returns the vectorial part of the transformation. it is a 3*3 matrix which includes the scale factor.

Returns
-------
gp_Mat
") VectorialPart;
		gp_Mat VectorialPart();

		/****************** operator * ******************/
		/**** md5 signature: b5e0c5dd5461f3e088b7301ffbe546b4 ****/
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
		/**** md5 signature: a2842cead7c6914d1488c16aeca3c8d4 ****/
		%feature("compactdefaultargs") gp_Trsf2d;
		%feature("autodoc", "Returns identity transformation.

Returns
-------
None
") gp_Trsf2d;
		 gp_Trsf2d();

		/****************** gp_Trsf2d ******************/
		/**** md5 signature: 53fc95cc4a94621ba2c1184e8346eaea ****/
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
		/**** md5 signature: 9bfbf058eebcd895fd3b29a4bba4ff05 ****/
		%feature("compactdefaultargs") Form;
		%feature("autodoc", "Returns the nature of the transformation. it can be an identity transformation, a rotation, a translation, a mirror (relative to a point or an axis), a scaling transformation, or a compound transformation.

Returns
-------
gp_TrsfForm
") Form;
		gp_TrsfForm Form();

		/****************** HVectorialPart ******************/
		/**** md5 signature: bd1f63761c4c14f4dfb772d30e566927 ****/
		%feature("compactdefaultargs") HVectorialPart;
		%feature("autodoc", "Returns the homogeneous vectorial part of the transformation. it is a 2*2 matrix which doesn't include the scale factor. the coefficients of this matrix must be multiplied by the scale factor to obtain the coefficients of the transformation.

Returns
-------
gp_Mat2d
") HVectorialPart;
		const gp_Mat2d HVectorialPart();

		/****************** Invert ******************/
		/**** md5 signature: 980f166f600d23a8c77565829af2eeff ****/
		%feature("compactdefaultargs") Invert;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Invert;
		void Invert();

		/****************** Inverted ******************/
		/**** md5 signature: 3d081d8c57884a9afc0f1bd4f128a05e ****/
		%feature("compactdefaultargs") Inverted;
		%feature("autodoc", "Computes the reverse transformation. raises an exception if the matrix of the transformation is not inversible, it means that the scale factor is lower or equal to resolution from package gp.

Returns
-------
gp_Trsf2d
") Inverted;
		gp_Trsf2d Inverted();

		/****************** IsNegative ******************/
		/**** md5 signature: 526e6184e7b7162d8ef698149b1c8ce5 ****/
		%feature("compactdefaultargs") IsNegative;
		%feature("autodoc", "Returns true if the determinant of the vectorial part of this transformation is negative..

Returns
-------
bool
") IsNegative;
		Standard_Boolean IsNegative();

		/****************** Multiplied ******************/
		/**** md5 signature: 1a9d8509663d4fa6bdf27ad8e94c9639 ****/
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
		/**** md5 signature: 857c5db7666b24a165df8dbbe22dff8a ****/
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
		/**** md5 signature: 269b25031ee3626d57e26795a85486bb ****/
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
		/**** md5 signature: 74809284995a1c5be9d84a688691e939 ****/
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
		/**** md5 signature: 30ae1d2a51ac1b0d453ef14ffdf4e12f ****/
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
		/**** md5 signature: 998e0caa47d024b1641265a66c85c396 ****/
		%feature("compactdefaultargs") RotationPart;
		%feature("autodoc", "Returns the angle corresponding to the rotational component of the transformation matrix (operation opposite to setrotation()).

Returns
-------
float
") RotationPart;
		Standard_Real RotationPart();

		/****************** ScaleFactor ******************/
		/**** md5 signature: 67d4a7cfb2dd29c2b400060f1b45b408 ****/
		%feature("compactdefaultargs") ScaleFactor;
		%feature("autodoc", "Returns the scale factor.

Returns
-------
float
") ScaleFactor;
		Standard_Real ScaleFactor();

		/****************** SetMirror ******************/
		/**** md5 signature: b99a2a0975c5afd1079e68a54f4ee024 ****/
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
		/**** md5 signature: 09840925aa066f9e81dc705a4274f47c ****/
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
		/**** md5 signature: 04db1b532a5a3b4eb737b00808774dcc ****/
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
		/**** md5 signature: 72fce8983d864dc21ee0c17f7fcfe769 ****/
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
		/**** md5 signature: da113cffaf2ef9a65380a09f05d05bb1 ****/
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
		/**** md5 signature: 0af598d076d78b705fb5e9c4db627afa ****/
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
		/**** md5 signature: 55e7631d5275e21b43e271ccbadbacb9 ****/
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
		/**** md5 signature: 230c4cb205b25788ec6ee808ed25cf44 ****/
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

		/****************** SetTranslationPart ******************/
		/**** md5 signature: c6610a4e9b4bbda8b4b630616d1f2275 ****/
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
		/**** md5 signature: 03457aff397202bdadcf7b24752bfb08 ****/
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
		/**** md5 signature: 7a2a4d09be3965069a02b1ab2fe75da0 ****/
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
		/**** md5 signature: 42fcc5a0a1f5720bc6e9d9621687e72b ****/
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
		/**** md5 signature: 2ba6f5175540b0ed3cbb670f3c8ff5d3 ****/
		%feature("compactdefaultargs") TranslationPart;
		%feature("autodoc", "Returns the translation part of the transformation's matrix.

Returns
-------
gp_XY
") TranslationPart;
		const gp_XY TranslationPart();

		/****************** Value ******************/
		/**** md5 signature: 1f17b21423db514e298b820a9dd11211 ****/
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
		/**** md5 signature: 672fae35ed3393d8331524559101b431 ****/
		%feature("compactdefaultargs") VectorialPart;
		%feature("autodoc", "Returns the vectorial part of the transformation. it is a 2*2 matrix which includes the scale factor.

Returns
-------
gp_Mat2d
") VectorialPart;
		gp_Mat2d VectorialPart();

		/****************** operator * ******************/
		/**** md5 signature: eae9930751ddd82516a80e9812b43d93 ****/
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
		/**** md5 signature: a83e11d1efa17c66e0590318efe9ad8a ****/
		%feature("compactdefaultargs") gp_Vec;
		%feature("autodoc", "Creates a zero vector.

Returns
-------
None
") gp_Vec;
		 gp_Vec();

		/****************** gp_Vec ******************/
		/**** md5 signature: 9cfc9b7ff0513de00ccfba72ec8dd4c5 ****/
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
		/**** md5 signature: 76da4eb2de14db7049739da4e0034583 ****/
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
		/**** md5 signature: e96afc2d047c05754a28a2afbd3da192 ****/
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
		/**** md5 signature: 0e4db29a7e598c85fed6f0ccd6ec8795 ****/
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
		/**** md5 signature: 552879d85b04d201aae866c5a8a3a5c2 ****/
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
		/**** md5 signature: a032ac9189c4d4e2816524da070cc13a ****/
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
		/**** md5 signature: 4e624552dc9786fcd4917adf2a9778da ****/
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
		/**** md5 signature: 9c8df4551f37ad797a026470c44e31d5 ****/
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
		/**** md5 signature: 615686a863135af4177d92a1b696f909 ****/
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
		/**** md5 signature: c21dee938f2596ca1071e28c84295612 ****/
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
		/**** md5 signature: 2b1f5aa67b623e5305810f00fac44b05 ****/
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
		/**** md5 signature: 229c54d290a453f8a9f868a599045445 ****/
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
		/**** md5 signature: cf58fa9d37af67fffff64e115a98eb9d ****/
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
		/**** md5 signature: 17e72cffa9792bcf70c1c87dac9e47ef ****/
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
		/**** md5 signature: 876754e28c723bbad60485c5657e0b2d ****/
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
		/**** md5 signature: a6a151358db4d559aaaa71ac1ec992e1 ****/
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
		/**** md5 signature: 7bc46cf38daaa2229b322d9add0408e3 ****/
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
		/**** md5 signature: 6f9ee1be03b1b0eacd85abca77a29eee ****/
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
		/**** md5 signature: ff4de6cc5bdebb2ffbbf29d24178a988 ****/
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
		/**** md5 signature: aff0f711ffc32d7f1d9db1fb06bb9ea1 ****/
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
		/**** md5 signature: 1eccffb4c9b9c582baf9d99667ad6ef7 ****/
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
		/**** md5 signature: 49ce46f87bd5b8891bb36ed6d7ea3a69 ****/
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
		/**** md5 signature: 8fdddb9ec53803bd7416a5dd2efaaabe ****/
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
		/**** md5 signature: 9a12db6b7541ae7a15f5f7d374379ecf ****/
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
		/**** md5 signature: 226b68b23c63a4cea2ecf63c5b3ac5b6 ****/
		%feature("compactdefaultargs") Magnitude;
		%feature("autodoc", "Computes the magnitude of this vector.

Returns
-------
float
") Magnitude;
		Standard_Real Magnitude();

		/****************** Mirror ******************/
		/**** md5 signature: 26a87960df64ac81888cd18e27471055 ****/
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
		/**** md5 signature: d1a0189a98d756bd9e5b51b4ae49992a ****/
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
		/**** md5 signature: 874cde0169043be133e205e960c3ca57 ****/
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
		/**** md5 signature: fb4bfc408d7a9a84b830c61677b335d3 ****/
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
		/**** md5 signature: eccf7400cf908e1b1745e3c27cf67e57 ****/
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
		/**** md5 signature: ec241ef8bbb7218292f0e1adca15f422 ****/
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
		/**** md5 signature: d0ee6e3c15e50592c7a514d7c1b76927 ****/
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
		/**** md5 signature: c6d925fe0833ff6abc2c1aab20682246 ****/
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
		/**** md5 signature: 587346cf1e1c12fdf674aedc915ccd95 ****/
		%feature("compactdefaultargs") Normalize;
		%feature("autodoc", "Normalizes a vector raises an exception if the magnitude of the vector is lower or equal to resolution from gp.

Returns
-------
None
") Normalize;
		void Normalize();

		/****************** Normalized ******************/
		/**** md5 signature: aeef953109572684206e8085ce2bb249 ****/
		%feature("compactdefaultargs") Normalized;
		%feature("autodoc", "Normalizes a vector raises an exception if the magnitude of the vector is lower or equal to resolution from gp.

Returns
-------
gp_Vec
") Normalized;
		gp_Vec Normalized();

		/****************** Reverse ******************/
		/**** md5 signature: b751d6874fc026e19a7a6cb37e9ac1b4 ****/
		%feature("compactdefaultargs") Reverse;
		%feature("autodoc", "Reverses the direction of a vector.

Returns
-------
None
") Reverse;
		void Reverse();

		/****************** Reversed ******************/
		/**** md5 signature: 941836b04539ff9d955d90dd49a886cc ****/
		%feature("compactdefaultargs") Reversed;
		%feature("autodoc", "Reverses the direction of a vector.

Returns
-------
gp_Vec
") Reversed;
		gp_Vec Reversed();

		/****************** Rotate ******************/
		/**** md5 signature: 12c4967f27a0900e4176252164d2f2ce ****/
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
		/**** md5 signature: 64d4c6da36423a9cbd267c6228533ccc ****/
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
		/**** md5 signature: 0874a05e93802f5d3b05494e8f21a8d2 ****/
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
		/**** md5 signature: 40d5aa7a038a9d372e064b6245be966e ****/
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
		/**** md5 signature: 6a7aba643afced1a67b8420fce55034e ****/
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
		/**** md5 signature: 535398862a18988c21af008f70ee6ea3 ****/
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
		/**** md5 signature: dd95b3f245e090a0c36a5470d4441ebd ****/
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
		/**** md5 signature: fd5685aeca2246f732f78edccc12291a ****/
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
		/**** md5 signature: ef53ae47adf65eff64d933e736d9086f ****/
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
		/**** md5 signature: b4bdfe148de05fe038d1ded3546dc063 ****/
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
		/**** md5 signature: b1e40a374589c4373bdfa3052deeb126 ****/
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
		/**** md5 signature: eaab8f479a867119c47acbcec5283fe4 ****/
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
		/**** md5 signature: 30fe204d4c67d94370133e1d40dc6787 ****/
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
		/**** md5 signature: 970583a1db197d138846d12b1374d359 ****/
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
		/**** md5 signature: 8f42f770a3959dece2671d90f60e35e2 ****/
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
		/**** md5 signature: d96a64d9a788ed7bdd745a3dcbb831ea ****/
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
		/**** md5 signature: 86bd25f4a05f6f29c03f2f6a040d94d0 ****/
		%feature("compactdefaultargs") SquareMagnitude;
		%feature("autodoc", "Computes the square magnitude of this vector.

Returns
-------
float
") SquareMagnitude;
		Standard_Real SquareMagnitude();

		/****************** Subtract ******************/
		/**** md5 signature: b240158f96d5587b72da4b3e861f074c ****/
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
		/**** md5 signature: 640c9ad477d577623b4bdbf57daa8178 ****/
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
		/**** md5 signature: 45ee6a37cbc92ff06bd17b5653f32913 ****/
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
		/**** md5 signature: 8580133342fec060b475de807e5396b6 ****/
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
		/**** md5 signature: 2dbf42f7dc56303f104fb0fa585dc6e6 ****/
		%feature("compactdefaultargs") X;
		%feature("autodoc", "For this vector, returns its x coordinate.

Returns
-------
float
") X;
		Standard_Real X();

		/****************** XYZ ******************/
		/**** md5 signature: ad2670b5502d8f29f92f756fdb200090 ****/
		%feature("compactdefaultargs") XYZ;
		%feature("autodoc", "For this vector, returns - its three coordinates as a number triple.

Returns
-------
gp_XYZ
") XYZ;
		const gp_XYZ XYZ();

		/****************** Y ******************/
		/**** md5 signature: 7fd17991f11a9702e525c7070ce7cec6 ****/
		%feature("compactdefaultargs") Y;
		%feature("autodoc", "For this vector, returns its y coordinate.

Returns
-------
float
") Y;
		Standard_Real Y();

		/****************** Z ******************/
		/**** md5 signature: 87b89b9e016f37b0146cf52868684676 ****/
		%feature("compactdefaultargs") Z;
		%feature("autodoc", "For this vector, returns its z coordinate.

Returns
-------
float
") Z;
		Standard_Real Z();

		/****************** operator * ******************/
		/**** md5 signature: 82d7bf92bb06d504e1ce609511526478 ****/
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
		/**** md5 signature: bc839c21be5ffd61619ad20a3bf1ab24 ****/
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
		/**** md5 signature: 7c384abf55762605bfdda262a0711593 ****/
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
		/**** md5 signature: 63ccf3d23895222a708b6ada14f17250 ****/
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
		/**** md5 signature: b019f223dbc17f31ce64d3eb0e5cdab5 ****/
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
		/**** md5 signature: 558b4772600a3036b00c67d12db7dd14 ****/
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
		/**** md5 signature: 738201ddfdb54479920976aa8b51068f ****/
		%feature("compactdefaultargs") gp_Vec2d;
		%feature("autodoc", "Creates a zero vector.

Returns
-------
None
") gp_Vec2d;
		 gp_Vec2d();

		/****************** gp_Vec2d ******************/
		/**** md5 signature: c2921f00c6eb98c579bdc0aea6ac728b ****/
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
		/**** md5 signature: d6d7b268c679b2141e899d9cb5390af7 ****/
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
		/**** md5 signature: e931c980849960964ef8f82200d9205e ****/
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
		/**** md5 signature: ba71a2a695fea76c909ac177da58a16a ****/
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
		/**** md5 signature: f8f123e87693fcde3f214e9062026bb0 ****/
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
		/**** md5 signature: 27ae5ecc23c0f54ede7ca955c0a4d4dc ****/
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
		/**** md5 signature: 0ddba91fa8211bd9ecfa7ad41b793ea8 ****/
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
		/**** md5 signature: 615686a863135af4177d92a1b696f909 ****/
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
		/**** md5 signature: b8a284c811b6527ab91769eb2ef6424d ****/
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
		/**** md5 signature: ee12b4c07c95a5fba348585848919356 ****/
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
		/**** md5 signature: 4840a4b1ffb04d8d6e29509545103fdf ****/
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
		/**** md5 signature: 47dc649aeb55e3faeb46861fe97c1965 ****/
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
		/**** md5 signature: 7bc46cf38daaa2229b322d9add0408e3 ****/
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
		/**** md5 signature: 71641d2d49495f2c447e3362a45a85e8 ****/
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
		/**** md5 signature: 5dbc96bfefacd876fca25a123dddfb69 ****/
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
		/**** md5 signature: 764cc3c99b6de4a17a4ae68f5fda52ac ****/
		%feature("compactdefaultargs") GetNormal;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Vec2d
") GetNormal;
		gp_Vec2d GetNormal();

		/****************** IsEqual ******************/
		/**** md5 signature: f0d01535abf67eaaee7933df52b76b9a ****/
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
		/**** md5 signature: 6c86838395da309e31e17ad62d65b4e2 ****/
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
		/**** md5 signature: b37ed60ac6430d490dc8034b219c8a36 ****/
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
		/**** md5 signature: 1b233ca5596da993b7bf0bf8e0b190eb ****/
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
		/**** md5 signature: 226b68b23c63a4cea2ecf63c5b3ac5b6 ****/
		%feature("compactdefaultargs") Magnitude;
		%feature("autodoc", "Computes the magnitude of this vector.

Returns
-------
float
") Magnitude;
		Standard_Real Magnitude();

		/****************** Mirror ******************/
		/**** md5 signature: 9e0344961f8b2170ff3b5d956316d749 ****/
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
		/**** md5 signature: 25e1e0ec76d8e19946a8283b83e4164c ****/
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
		/**** md5 signature: 2cf59fc9c65df7b00db69df465f11228 ****/
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
		/**** md5 signature: 669b3fb584f2f43533801ae69ed8d373 ****/
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
		/**** md5 signature: 16b656cb2d055241ddb497884ea91190 ****/
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
		/**** md5 signature: c6d925fe0833ff6abc2c1aab20682246 ****/
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
		/**** md5 signature: 587346cf1e1c12fdf674aedc915ccd95 ****/
		%feature("compactdefaultargs") Normalize;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Normalize;
		void Normalize();

		/****************** Normalized ******************/
		/**** md5 signature: 86d603dc02ee841c7172dbf48966fb92 ****/
		%feature("compactdefaultargs") Normalized;
		%feature("autodoc", "Normalizes a vector raises an exception if the magnitude of the vector is lower or equal to resolution from package gp. reverses the direction of a vector.

Returns
-------
gp_Vec2d
") Normalized;
		gp_Vec2d Normalized();

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
		/**** md5 signature: a991541fca6390f64df9d589cd37193f ****/
		%feature("compactdefaultargs") Reversed;
		%feature("autodoc", "Reverses the direction of a vector.

Returns
-------
gp_Vec2d
") Reversed;
		gp_Vec2d Reversed();

		/****************** Rotate ******************/
		/**** md5 signature: 1f5728589a1f78e2418cd03d8bfa9e86 ****/
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
		/**** md5 signature: ff874b66d9e1bfe9e9ec62d0cad989bb ****/
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
		/**** md5 signature: 0874a05e93802f5d3b05494e8f21a8d2 ****/
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
		/**** md5 signature: 82743635d7f97723add016524b99dc57 ****/
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
		/**** md5 signature: 6a7aba643afced1a67b8420fce55034e ****/
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
		/**** md5 signature: 89ebec90371b06b65c615274fc32dbb5 ****/
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
		/**** md5 signature: d7d0dce6b273b83078f36cb30bf1908c ****/
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
		/**** md5 signature: 167b24f7866ea95c55b52f082dc0879f ****/
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
		/**** md5 signature: 823780e08736f8450a2ab04ce89dead0 ****/
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
		/**** md5 signature: 9cc397b35ea5d911d89b95c8259a48cc ****/
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
		/**** md5 signature: 30fe204d4c67d94370133e1d40dc6787 ****/
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
		/**** md5 signature: 6c2893a57a740cb14668b2ad98f8f8f8 ****/
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
		/**** md5 signature: 8f42f770a3959dece2671d90f60e35e2 ****/
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
		/**** md5 signature: 86bd25f4a05f6f29c03f2f6a040d94d0 ****/
		%feature("compactdefaultargs") SquareMagnitude;
		%feature("autodoc", "Computes the square magnitude of this vector.

Returns
-------
float
") SquareMagnitude;
		Standard_Real SquareMagnitude();

		/****************** Subtract ******************/
		/**** md5 signature: bfd02e9426dd88459644bb82dfd3f343 ****/
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
		/**** md5 signature: fda5d8617dc470d34ead39747515c336 ****/
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
		/**** md5 signature: dace16a29a39216c0dd584c6964e840b ****/
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
		/**** md5 signature: 9d4f37e13ff7f955f0e23bbd5c27214d ****/
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
		/**** md5 signature: 2dbf42f7dc56303f104fb0fa585dc6e6 ****/
		%feature("compactdefaultargs") X;
		%feature("autodoc", "For this vector, returns its x coordinate.

Returns
-------
float
") X;
		Standard_Real X();

		/****************** XY ******************/
		/**** md5 signature: 0572c9669063bef343b6bffa656e7e3a ****/
		%feature("compactdefaultargs") XY;
		%feature("autodoc", "For this vector, returns its two coordinates as a number pair.

Returns
-------
gp_XY
") XY;
		const gp_XY XY();

		/****************** Y ******************/
		/**** md5 signature: 7fd17991f11a9702e525c7070ce7cec6 ****/
		%feature("compactdefaultargs") Y;
		%feature("autodoc", "For this vector, returns its y coordinate.

Returns
-------
float
") Y;
		Standard_Real Y();

		/****************** operator * ******************/
		/**** md5 signature: 820f4246d0d1a06e16854afdb1d45387 ****/
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
		/**** md5 signature: dc570e85a3a724281555cd67dcc05103 ****/
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
		/**** md5 signature: 8c1dba3f824b6f273bc09bbeb6d7a444 ****/
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
		/**** md5 signature: cbda9d88ce3397da41adc1df0723fc91 ****/
		%feature("compactdefaultargs") operator -;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Vec2d
") operator -;
		gp_Vec2d operator -();

		/****************** operator - ******************/
		/**** md5 signature: 8c412a78c416a5fb1ac6ba5cf6e0c922 ****/
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
		/**** md5 signature: 87606ae9d4c24ce5e7463f4a7848d298 ****/
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
		/**** md5 signature: 9b9b5c7e8c1877fd22cf4bcfef592562 ****/
		%feature("compactdefaultargs") gp_XY;
		%feature("autodoc", "Creates xy object with zero coordinates (0,0).

Returns
-------
None
") gp_XY;
		 gp_XY();

		/****************** gp_XY ******************/
		/**** md5 signature: f77752d9049b6a28d4e97e8f0fe963df ****/
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
		/**** md5 signature: 4556d0386f28b55bf241c4f572e2bc9c ****/
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
		/**** md5 signature: d0ec543da58e472bf4f53ec5eceff2f5 ****/
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
		/**** md5 signature: 615686a863135af4177d92a1b696f909 ****/
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
		/**** md5 signature: 2bbebb135dcc8c9f5d324bb139387460 ****/
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
		/**** md5 signature: 6233f5d00c4226d0dc8082c924898c88 ****/
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
		/**** md5 signature: 6783da7fa10361b03cd1efd585501ae0 ****/
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
		/**** md5 signature: ea63b7bd7d53c30e07ec9f9f61796429 ****/
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
		/**** md5 signature: 7bc46cf38daaa2229b322d9add0408e3 ****/
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
		/**** md5 signature: 37e9ca4695c81cd4756de62d64fa8b6d ****/
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
		/**** md5 signature: 64c515ab0f9e5774381c8632bed28593 ****/
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
		/**** md5 signature: 336bd2c356d5e60179075d81a58487ba ****/
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
		/**** md5 signature: fd1ea39f3920d59a842af376171fb4a0 ****/
		%feature("compactdefaultargs") Modulus;
		%feature("autodoc", "Computes sqrt (x*x + y*y) where x and y are the two coordinates of this number pair.

Returns
-------
float
") Modulus;
		Standard_Real Modulus();

		/****************** Multiplied ******************/
		/**** md5 signature: 860248bfcbba3bca7f4bef4e4b4bddbf ****/
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
		/**** md5 signature: b44b85e3dfdb2c519f9cbae112f6caf6 ****/
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
		/**** md5 signature: b2d8ef1627ca605c735b55d513acb17c ****/
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
		/**** md5 signature: c6d925fe0833ff6abc2c1aab20682246 ****/
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
		/**** md5 signature: a420b732d79b66d7a3238d3e3f6422ea ****/
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
		/**** md5 signature: d2427b842de46096dd5fb54a0c795f3b ****/
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
		/**** md5 signature: 587346cf1e1c12fdf674aedc915ccd95 ****/
		%feature("compactdefaultargs") Normalize;
		%feature("autodoc", "<self>.x() = <self>.x()/ <self>.modulus() <self>.y() = <self>.y()/ <self>.modulus() raises constructionerror if <self>.modulus() <= resolution from gp.

Returns
-------
None
") Normalize;
		void Normalize();

		/****************** Normalized ******************/
		/**** md5 signature: 174ef09f589bc28ecc468d5199a2b619 ****/
		%feature("compactdefaultargs") Normalized;
		%feature("autodoc", "New.x() = <self>.x()/ <self>.modulus() new.y() = <self>.y()/ <self>.modulus() raises constructionerror if <self>.modulus() <= resolution from gp.

Returns
-------
gp_XY
") Normalized;
		gp_XY Normalized();

		/****************** Reverse ******************/
		/**** md5 signature: b751d6874fc026e19a7a6cb37e9ac1b4 ****/
		%feature("compactdefaultargs") Reverse;
		%feature("autodoc", "<self>.x() = -<self>.x() <self>.y() = -<self>.y().

Returns
-------
None
") Reverse;
		void Reverse();

		/****************** Reversed ******************/
		/**** md5 signature: 427034000e7cda43b09154b1f7672730 ****/
		%feature("compactdefaultargs") Reversed;
		%feature("autodoc", "New.x() = -<self>.x() new.y() = -<self>.y().

Returns
-------
gp_XY
") Reversed;
		gp_XY Reversed();

		/****************** SetCoord ******************/
		/**** md5 signature: 6a7aba643afced1a67b8420fce55034e ****/
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
		/**** md5 signature: 7dcfdae9b9ff412a3b0904f02beeae09 ****/
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
		/**** md5 signature: 131bc64c1a2d837a9c9fcb9f50c95051 ****/
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
		/**** md5 signature: a702ad60b752b1b613ba32c09608ac4a ****/
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
		/**** md5 signature: 34ef928dfd841fb7e117f87b876756c3 ****/
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
		/**** md5 signature: 3a05137192dffb088fa03132d435106d ****/
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
		/**** md5 signature: 30fe204d4c67d94370133e1d40dc6787 ****/
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
		/**** md5 signature: 8f42f770a3959dece2671d90f60e35e2 ****/
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
		/**** md5 signature: e568dbeb039e9e13533b9c14cc54c454 ****/
		%feature("compactdefaultargs") SquareModulus;
		%feature("autodoc", "Computes x*x + y*y where x and y are the two coordinates of this number pair.

Returns
-------
float
") SquareModulus;
		Standard_Real SquareModulus();

		/****************** Subtract ******************/
		/**** md5 signature: 449e4bb00c6fff10f8c2c186d01ff47d ****/
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
		/**** md5 signature: 47915cd519662979cc21fd45ad55e13c ****/
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
		/**** md5 signature: 2dbf42f7dc56303f104fb0fa585dc6e6 ****/
		%feature("compactdefaultargs") X;
		%feature("autodoc", "Returns the x coordinate of this number pair.

Returns
-------
float
") X;
		Standard_Real X();

		/****************** Y ******************/
		/**** md5 signature: 7fd17991f11a9702e525c7070ce7cec6 ****/
		%feature("compactdefaultargs") Y;
		%feature("autodoc", "Returns the y coordinate of this number pair.

Returns
-------
float
") Y;
		Standard_Real Y();

		/****************** operator * ******************/
		/**** md5 signature: e802d7bd675be0157161309fa2c9542a ****/
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
		/**** md5 signature: ba132ce6fd501b599dc2083d5bfcfc7c ****/
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
		/**** md5 signature: d0015076d4b3402831a5b623fa362a89 ****/
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
		/**** md5 signature: 5c3ba0a3e1175b6ad7975782967c00e8 ****/
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
		/**** md5 signature: 67c07ba3c8d9e3c28626b927db1ec14a ****/
		%feature("compactdefaultargs") operator -;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_XY
") operator -;
		gp_XY operator -();

		/****************** operator - ******************/
		/**** md5 signature: fe73a14d5e0e90e6ce61890d1a9e82fd ****/
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
		/**** md5 signature: 2762076a671a9e10098eafc444e23e69 ****/
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
		/**** md5 signature: 1d329b1abf57382d25814b36ad126094 ****/
		%feature("compactdefaultargs") gp_XYZ;
		%feature("autodoc", "Creates an xyz object with zero co-ordinates (0,0,0).

Returns
-------
None
") gp_XYZ;
		 gp_XYZ();

		/****************** gp_XYZ ******************/
		/**** md5 signature: bc2af43372e657a22b176e1816a98afc ****/
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
		/**** md5 signature: 737352234eb33550cc346552adcc9e36 ****/
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
		/**** md5 signature: a0a552d6e954c9b43f982c5e10c0c166 ****/
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
		/**** md5 signature: f67de4d76a4dc069bec2279769c356f3 ****/
		%feature("compactdefaultargs") ChangeData;
		%feature("autodoc", "Returns a ptr to coordinates location. is useful for algorithms, but does not perform any checks!.

Returns
-------
float *
") ChangeData;
		Standard_Real * ChangeData();

		/****************** Coord ******************/
		/**** md5 signature: 615686a863135af4177d92a1b696f909 ****/
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
		/**** md5 signature: 43b0651f3b971777fc055ece9d877be9 ****/
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
		/**** md5 signature: 26e2781fd47b59936af096df9756ab29 ****/
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
		/**** md5 signature: b68c8730f4028c72b91247dfcda00f12 ****/
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
		/**** md5 signature: fabfec399e2eed71cf2ebfc062d9d48d ****/
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
		/**** md5 signature: 5abd1621dc2bc29d4703930a9a901f9b ****/
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
		/**** md5 signature: 5149bdd9d2e5f96c8a10411eb65ccb7f ****/
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
		/**** md5 signature: 47507d4fa5bfdc4db754c687dc46fb30 ****/
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
		/**** md5 signature: 7bc46cf38daaa2229b322d9add0408e3 ****/
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
		/**** md5 signature: a6cd54f82957ce74ecec2ac439bf85ca ****/
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
		/**** md5 signature: 2789a9141397a45f8ccb1c77b8d80be2 ****/
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
		/**** md5 signature: 1d82040d9678943a8dabace18e414116 ****/
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
		/**** md5 signature: fd12237104a886c16bf39a8750201e39 ****/
		%feature("compactdefaultargs") GetData;
		%feature("autodoc", "Returns a const ptr to coordinates location. is useful for algorithms, but does not perform any checks!.

Returns
-------
float *
") GetData;
		const Standard_Real * GetData();

		/****************** IsEqual ******************/
		/**** md5 signature: d23503bef8a5d867cb3e2f5bae904afb ****/
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
		/**** md5 signature: fd1ea39f3920d59a842af376171fb4a0 ****/
		%feature("compactdefaultargs") Modulus;
		%feature("autodoc", "Computes sqrt (x*x + y*y + z*z) where x, y and z are the three coordinates of this xyz object.

Returns
-------
float
") Modulus;
		Standard_Real Modulus();

		/****************** Multiplied ******************/
		/**** md5 signature: 20b1b9aeecfb6bbf87aad0f00ae5333e ****/
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
		/**** md5 signature: 92a34cec157f0791d7c03277b71cc875 ****/
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
		/**** md5 signature: 40023907e401d14f0f5e68be5060d6a3 ****/
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
		/**** md5 signature: c6d925fe0833ff6abc2c1aab20682246 ****/
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
		/**** md5 signature: 4884fb695e11902209f7f03ebd132973 ****/
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
		/**** md5 signature: aeeb166a5b8afb48b61dd65efda4061d ****/
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
		/**** md5 signature: 587346cf1e1c12fdf674aedc915ccd95 ****/
		%feature("compactdefaultargs") Normalize;
		%feature("autodoc", "<self>.x() = <self>.x()/ <self>.modulus() <self>.y() = <self>.y()/ <self>.modulus() <self>.z() = <self>.z()/ <self>.modulus() raised if <self>.modulus() <= resolution from gp.

Returns
-------
None
") Normalize;
		void Normalize();

		/****************** Normalized ******************/
		/**** md5 signature: bdff66b04d5a06b736ecae9c1e49ac93 ****/
		%feature("compactdefaultargs") Normalized;
		%feature("autodoc", "New.x() = <self>.x()/ <self>.modulus() new.y() = <self>.y()/ <self>.modulus() new.z() = <self>.z()/ <self>.modulus() raised if <self>.modulus() <= resolution from gp.

Returns
-------
gp_XYZ
") Normalized;
		gp_XYZ Normalized();

		/****************** Reverse ******************/
		/**** md5 signature: b751d6874fc026e19a7a6cb37e9ac1b4 ****/
		%feature("compactdefaultargs") Reverse;
		%feature("autodoc", "<self>.x() = -<self>.x() <self>.y() = -<self>.y() <self>.z() = -<self>.z().

Returns
-------
None
") Reverse;
		void Reverse();

		/****************** Reversed ******************/
		/**** md5 signature: e0f33a8f1169d8b42845765ed8af0988 ****/
		%feature("compactdefaultargs") Reversed;
		%feature("autodoc", "New.x() = -<self>.x() new.y() = -<self>.y() new.z() = -<self>.z().

Returns
-------
gp_XYZ
") Reversed;
		gp_XYZ Reversed();

		/****************** SetCoord ******************/
		/**** md5 signature: 191a33c01dc9e7fdb47a43d5d7ff9d99 ****/
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
		/**** md5 signature: 6a7aba643afced1a67b8420fce55034e ****/
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
		/**** md5 signature: a4aeff26c15eeef1f7e306868d72e3a4 ****/
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
		/**** md5 signature: c888f7cec906ff175af4ae32fb00ae1b ****/
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
		/**** md5 signature: 3666fcade3b797169c49b77dc156aaeb ****/
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
		/**** md5 signature: 37633a47abada4d8a166a3bdbd459978 ****/
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
		/**** md5 signature: 86d64f19481f78cc1566f3ff96ffc84a ****/
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
		/**** md5 signature: f34d788cd256ace1d2636e769e0df8c9 ****/
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
		/**** md5 signature: 30fe204d4c67d94370133e1d40dc6787 ****/
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
		/**** md5 signature: 8f42f770a3959dece2671d90f60e35e2 ****/
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
		/**** md5 signature: d96a64d9a788ed7bdd745a3dcbb831ea ****/
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
		/**** md5 signature: e568dbeb039e9e13533b9c14cc54c454 ****/
		%feature("compactdefaultargs") SquareModulus;
		%feature("autodoc", "Computes x*x + y*y + z*z where x, y and z are the three coordinates of this xyz object.

Returns
-------
float
") SquareModulus;
		Standard_Real SquareModulus();

		/****************** Subtract ******************/
		/**** md5 signature: 9310e472ac69edef1869ac650e25a5c0 ****/
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
		/**** md5 signature: 42430ee59d710f67ddbbc4d7ed29af8a ****/
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
		/**** md5 signature: 2dbf42f7dc56303f104fb0fa585dc6e6 ****/
		%feature("compactdefaultargs") X;
		%feature("autodoc", "Returns the x coordinate.

Returns
-------
float
") X;
		Standard_Real X();

		/****************** Y ******************/
		/**** md5 signature: 7fd17991f11a9702e525c7070ce7cec6 ****/
		%feature("compactdefaultargs") Y;
		%feature("autodoc", "Returns the y coordinate.

Returns
-------
float
") Y;
		Standard_Real Y();

		/****************** Z ******************/
		/**** md5 signature: 87b89b9e016f37b0146cf52868684676 ****/
		%feature("compactdefaultargs") Z;
		%feature("autodoc", "Returns the z coordinate.

Returns
-------
float
") Z;
		Standard_Real Z();

		/****************** operator * ******************/
		/**** md5 signature: 5b52e614850ab774fba8c8d1072e9d14 ****/
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
		/**** md5 signature: 6a78b9db7b998bce12bc23b860ea5931 ****/
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
		/**** md5 signature: e7a4207193cb2b7520ee8d75cc1fde7c ****/
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
		/**** md5 signature: b4c5f0b0c3bcd3603a26b7c664f94b34 ****/
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
		/**** md5 signature: ed1aeae30e9c62f250d3b7a571ecd6d2 ****/
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
		/**** md5 signature: 4a3024612d9a35e3fdbb14bd386bfb24 ****/
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
