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
%module (package="OCC") gp

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


%include gp_headers.i


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

%rename(gp) gp;
class gp {
	public:
		%feature("compactdefaultargs") Resolution;
		%feature("autodoc", "	* Method of package gp //! In geometric computations, defines the tolerance criterion used to determine when two numbers can be considered equal. Many class functions use this tolerance criterion, for example, to avoid division by zero in geometric computations. In the documentation, tolerance criterion is always referred to as gp::Resolution().

	:rtype: float
") Resolution;
		static Standard_Real Resolution ();
		%feature("compactdefaultargs") Origin;
		%feature("autodoc", "	* Identifies a Cartesian point with coordinates X = Y = Z = 0.0.0

	:rtype: gp_Pnt
") Origin;
		static const gp_Pnt  Origin ();
		%feature("compactdefaultargs") DX;
		%feature("autodoc", "	* Returns a unit vector with the combination (1,0,0)

	:rtype: gp_Dir
") DX;
		static const gp_Dir  DX ();
		%feature("compactdefaultargs") DY;
		%feature("autodoc", "	* Returns a unit vector with the combination (0,1,0)

	:rtype: gp_Dir
") DY;
		static const gp_Dir  DY ();
		%feature("compactdefaultargs") DZ;
		%feature("autodoc", "	* Returns a unit vector with the combination (0,0,1)

	:rtype: gp_Dir
") DZ;
		static const gp_Dir  DZ ();
		%feature("compactdefaultargs") OX;
		%feature("autodoc", "	* Identifies an axis where its origin is Origin and its unit vector coordinates X = 1.0, Y = Z = 0.0

	:rtype: gp_Ax1
") OX;
		static const gp_Ax1  OX ();
		%feature("compactdefaultargs") OY;
		%feature("autodoc", "	* Identifies an axis where its origin is Origin and its unit vector coordinates Y = 1.0, X = Z = 0.0

	:rtype: gp_Ax1
") OY;
		static const gp_Ax1  OY ();
		%feature("compactdefaultargs") OZ;
		%feature("autodoc", "	* Identifies an axis where its origin is Origin and its unit vector coordinates Z = 1.0, Y = X = 0.0

	:rtype: gp_Ax1
") OZ;
		static const gp_Ax1  OZ ();
		%feature("compactdefaultargs") XOY;
		%feature("autodoc", "	* Identifies a coordinate system where its origin is Origin, and its 'main Direction' and 'X Direction' coordinates Z = 1.0, X = Y =0.0 and X direction coordinates X = 1.0, Y = Z = 0.0

	:rtype: gp_Ax2
") XOY;
		static const gp_Ax2  XOY ();
		%feature("compactdefaultargs") ZOX;
		%feature("autodoc", "	* Identifies a coordinate system where its origin is Origin, and its 'main Direction' and 'X Direction' coordinates Y = 1.0, X = Z =0.0 and X direction coordinates Z = 1.0, X = Y = 0.0

	:rtype: gp_Ax2
") ZOX;
		static const gp_Ax2  ZOX ();
		%feature("compactdefaultargs") YOZ;
		%feature("autodoc", "	* Identifies a coordinate system where its origin is Origin, and its 'main Direction' and 'X Direction' coordinates X = 1.0, Z = Y =0.0 and X direction coordinates Y = 1.0, X = Z = 0.0 In 2D space

	:rtype: gp_Ax2
") YOZ;
		static const gp_Ax2  YOZ ();
		%feature("compactdefaultargs") Origin2d;
		%feature("autodoc", "	* Identifies a Cartesian point with coordinates X = Y = 0.0

	:rtype: gp_Pnt2d
") Origin2d;
		static const gp_Pnt2d  Origin2d ();
		%feature("compactdefaultargs") DX2d;
		%feature("autodoc", "	* Returns a unit vector with the combinations (1,0)

	:rtype: gp_Dir2d
") DX2d;
		static const gp_Dir2d  DX2d ();
		%feature("compactdefaultargs") DY2d;
		%feature("autodoc", "	* Returns a unit vector with the combinations (0,1)

	:rtype: gp_Dir2d
") DY2d;
		static const gp_Dir2d  DY2d ();
		%feature("compactdefaultargs") OX2d;
		%feature("autodoc", "	* Identifies an axis where its origin is Origin2d and its unit vector coordinates are: X = 1.0, Y = 0.0

	:rtype: gp_Ax2d
") OX2d;
		static const gp_Ax2d  OX2d ();
		%feature("compactdefaultargs") OY2d;
		%feature("autodoc", "	* Identifies an axis where its origin is Origin2d and its unit vector coordinates are Y = 1.0, X = 0.0

	:rtype: gp_Ax2d
") OY2d;
		static const gp_Ax2d  OY2d ();
};


%extend gp {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor gp_Ax1;
class gp_Ax1 {
	public:
		%feature("compactdefaultargs") gp_Ax1;
		%feature("autodoc", "	* Creates an axis object representing Z axis of the reference co-ordinate system.

	:rtype: None
") gp_Ax1;
		 gp_Ax1 ();
		%feature("compactdefaultargs") gp_Ax1;
		%feature("autodoc", "	* P is the location point and V is the direction of <self>.

	:param P:
	:type P: gp_Pnt
	:param V:
	:type V: gp_Dir
	:rtype: None
") gp_Ax1;
		 gp_Ax1 (const gp_Pnt & P,const gp_Dir & V);
		%feature("compactdefaultargs") SetDirection;
		%feature("autodoc", "	* Assigns V as the 'Direction' of this axis.

	:param V:
	:type V: gp_Dir
	:rtype: None
") SetDirection;
		void SetDirection (const gp_Dir & V);
		%feature("compactdefaultargs") SetLocation;
		%feature("autodoc", "	* Assigns P as the origin of this axis.

	:param P:
	:type P: gp_Pnt
	:rtype: None
") SetLocation;
		void SetLocation (const gp_Pnt & P);
		%feature("compactdefaultargs") Direction;
		%feature("autodoc", "	* Returns the direction of <self>.

	:rtype: gp_Dir
") Direction;
		const gp_Dir  Direction ();
		%feature("compactdefaultargs") Location;
		%feature("autodoc", "	* Returns the location point of <self>.

	:rtype: gp_Pnt
") Location;
		const gp_Pnt  Location ();
		%feature("compactdefaultargs") IsCoaxial;
		%feature("autodoc", "	* Returns True if : . the angle between <self> and <Other> is lower or equal to <AngularTolerance> and . the distance between <self>.Location() and <Other> is lower or equal to <LinearTolerance> and . the distance between <Other>.Location() and <self> is lower or equal to LinearTolerance.

	:param Other:
	:type Other: gp_Ax1
	:param AngularTolerance:
	:type AngularTolerance: float
	:param LinearTolerance:
	:type LinearTolerance: float
	:rtype: bool
") IsCoaxial;
		Standard_Boolean IsCoaxial (const gp_Ax1 & Other,const Standard_Real AngularTolerance,const Standard_Real LinearTolerance);
		%feature("compactdefaultargs") IsNormal;
		%feature("autodoc", "	* Returns True if the direction of the <self> and <Other> are normal to each other. That is, if the angle between the two axes is equal to Pi/2. Note: the tolerance criterion is given by AngularTolerance..

	:param Other:
	:type Other: gp_Ax1
	:param AngularTolerance:
	:type AngularTolerance: float
	:rtype: bool
") IsNormal;
		Standard_Boolean IsNormal (const gp_Ax1 & Other,const Standard_Real AngularTolerance);
		%feature("compactdefaultargs") IsOpposite;
		%feature("autodoc", "	* Returns True if the direction of <self> and <Other> are parallel with opposite orientation. That is, if the angle between the two axes is equal to Pi. Note: the tolerance criterion is given by AngularTolerance.

	:param Other:
	:type Other: gp_Ax1
	:param AngularTolerance:
	:type AngularTolerance: float
	:rtype: bool
") IsOpposite;
		Standard_Boolean IsOpposite (const gp_Ax1 & Other,const Standard_Real AngularTolerance);
		%feature("compactdefaultargs") IsParallel;
		%feature("autodoc", "	* Returns True if the direction of <self> and <Other> are parallel with same orientation or opposite orientation. That is, if the angle between the two axes is equal to 0 or Pi. Note: the tolerance criterion is given by AngularTolerance.

	:param Other:
	:type Other: gp_Ax1
	:param AngularTolerance:
	:type AngularTolerance: float
	:rtype: bool
") IsParallel;
		Standard_Boolean IsParallel (const gp_Ax1 & Other,const Standard_Real AngularTolerance);
		%feature("compactdefaultargs") Angle;
		%feature("autodoc", "	* Computes the angular value, in radians, between <self>.Direction() and <Other>.Direction(). Returns the angle between 0 and 2*PI radians.

	:param Other:
	:type Other: gp_Ax1
	:rtype: float
") Angle;
		Standard_Real Angle (const gp_Ax1 & Other);
		%feature("compactdefaultargs") Reverse;
		%feature("autodoc", "	* Reverses the unit vector of this axis. and assigns the result to this axis.

	:rtype: None
") Reverse;
		void Reverse ();
		%feature("compactdefaultargs") Reversed;
		%feature("autodoc", "	* Reverses the unit vector of this axis and creates a new one.

	:rtype: gp_Ax1
") Reversed;
		gp_Ax1 Reversed ();
		%feature("compactdefaultargs") Mirror;
		%feature("autodoc", "	* Performs the symmetrical transformation of an axis placement with respect to the point P which is the center of the symmetry and assigns the result to this axis.

	:param P:
	:type P: gp_Pnt
	:rtype: None
") Mirror;
		void Mirror (const gp_Pnt & P);
		%feature("compactdefaultargs") Mirrored;
		%feature("autodoc", "	* Performs the symmetrical transformation of an axis placement with respect to the point P which is the center of the symmetry and creates a new axis.

	:param P:
	:type P: gp_Pnt
	:rtype: gp_Ax1
") Mirrored;
		gp_Ax1 Mirrored (const gp_Pnt & P);
		%feature("compactdefaultargs") Mirror;
		%feature("autodoc", "	* Performs the symmetrical transformation of an axis placement with respect to an axis placement which is the axis of the symmetry and assigns the result to this axis.

	:param A1:
	:type A1: gp_Ax1
	:rtype: None
") Mirror;
		void Mirror (const gp_Ax1 & A1);
		%feature("compactdefaultargs") Mirrored;
		%feature("autodoc", "	* Performs the symmetrical transformation of an axis placement with respect to an axis placement which is the axis of the symmetry and creates a new axis.

	:param A1:
	:type A1: gp_Ax1
	:rtype: gp_Ax1
") Mirrored;
		gp_Ax1 Mirrored (const gp_Ax1 & A1);
		%feature("compactdefaultargs") Mirror;
		%feature("autodoc", "	* Performs the symmetrical transformation of an axis placement with respect to a plane. The axis placement <A2> locates the plane of the symmetry : (Location, XDirection, YDirection) and assigns the result to this axis.

	:param A2:
	:type A2: gp_Ax2
	:rtype: None
") Mirror;
		void Mirror (const gp_Ax2 & A2);
		%feature("compactdefaultargs") Mirrored;
		%feature("autodoc", "	* Performs the symmetrical transformation of an axis placement with respect to a plane. The axis placement <A2> locates the plane of the symmetry : (Location, XDirection, YDirection) and creates a new axis.

	:param A2:
	:type A2: gp_Ax2
	:rtype: gp_Ax1
") Mirrored;
		gp_Ax1 Mirrored (const gp_Ax2 & A2);
		%feature("compactdefaultargs") Rotate;
		%feature("autodoc", "	* Rotates this axis at an angle Ang (in radians) about the axis A1 and assigns the result to this axis.

	:param A1:
	:type A1: gp_Ax1
	:param Ang:
	:type Ang: float
	:rtype: None
") Rotate;
		void Rotate (const gp_Ax1 & A1,const Standard_Real Ang);
		%feature("compactdefaultargs") Rotated;
		%feature("autodoc", "	* Rotates this axis at an angle Ang (in radians) about the axis A1 and creates a new one.

	:param A1:
	:type A1: gp_Ax1
	:param Ang:
	:type Ang: float
	:rtype: gp_Ax1
") Rotated;
		gp_Ax1 Rotated (const gp_Ax1 & A1,const Standard_Real Ang);
		%feature("compactdefaultargs") Scale;
		%feature("autodoc", "	* Applies a scaling transformation to this axis with: - scale factor S, and - center P and assigns the result to this axis.

	:param P:
	:type P: gp_Pnt
	:param S:
	:type S: float
	:rtype: None
") Scale;
		void Scale (const gp_Pnt & P,const Standard_Real S);
		%feature("compactdefaultargs") Scaled;
		%feature("autodoc", "	* Applies a scaling transformation to this axis with: - scale factor S, and - center P and creates a new axis.

	:param P:
	:type P: gp_Pnt
	:param S:
	:type S: float
	:rtype: gp_Ax1
") Scaled;
		gp_Ax1 Scaled (const gp_Pnt & P,const Standard_Real S);
		%feature("compactdefaultargs") Transform;
		%feature("autodoc", "	* Applies the transformation T to this axis. and assigns the result to this axis.

	:param T:
	:type T: gp_Trsf
	:rtype: None
") Transform;
		void Transform (const gp_Trsf & T);
		%feature("compactdefaultargs") Transformed;
		%feature("autodoc", "	* Applies the transformation T to this axis and creates a new one. //! Translates an axis plaxement in the direction of the vector <V>. The magnitude of the translation is the vector's magnitude.

	:param T:
	:type T: gp_Trsf
	:rtype: gp_Ax1
") Transformed;
		gp_Ax1 Transformed (const gp_Trsf & T);
		%feature("compactdefaultargs") Translate;
		%feature("autodoc", "	* Translates this axis by the vector V, and assigns the result to this axis.

	:param V:
	:type V: gp_Vec
	:rtype: None
") Translate;
		void Translate (const gp_Vec & V);
		%feature("compactdefaultargs") Translated;
		%feature("autodoc", "	* Translates this axis by the vector V, and creates a new one.

	:param V:
	:type V: gp_Vec
	:rtype: gp_Ax1
") Translated;
		gp_Ax1 Translated (const gp_Vec & V);
		%feature("compactdefaultargs") Translate;
		%feature("autodoc", "	* Translates this axis by: the vector (P1, P2) defined from point P1 to point P2. and assigns the result to this axis.

	:param P1:
	:type P1: gp_Pnt
	:param P2:
	:type P2: gp_Pnt
	:rtype: None
") Translate;
		void Translate (const gp_Pnt & P1,const gp_Pnt & P2);
		%feature("compactdefaultargs") Translated;
		%feature("autodoc", "	* Translates this axis by: the vector (P1, P2) defined from point P1 to point P2. and creates a new one.

	:param P1:
	:type P1: gp_Pnt
	:param P2:
	:type P2: gp_Pnt
	:rtype: gp_Ax1
") Translated;
		gp_Ax1 Translated (const gp_Pnt & P1,const gp_Pnt & P2);
		%feature("compactdefaultargs") _CSFDB_Getgp_Ax1loc;
		%feature("autodoc", "	:rtype: gp_Pnt
") _CSFDB_Getgp_Ax1loc;
		const gp_Pnt  _CSFDB_Getgp_Ax1loc ();
		%feature("compactdefaultargs") _CSFDB_Getgp_Ax1vdir;
		%feature("autodoc", "	:rtype: gp_Dir
") _CSFDB_Getgp_Ax1vdir;
		const gp_Dir  _CSFDB_Getgp_Ax1vdir ();
};


%extend gp_Ax1 {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor gp_Ax2;
class gp_Ax2 {
	public:
		%feature("compactdefaultargs") gp_Ax2;
		%feature("autodoc", "	* Creates an object corresponding to the reference coordinate system (OXYZ).

	:rtype: None
") gp_Ax2;
		 gp_Ax2 ();
		%feature("compactdefaultargs") gp_Ax2;
		%feature("autodoc", "	* Creates an axis placement with an origin P such that: - N is the Direction, and - the 'X Direction' is normal to N, in the plane defined by the vectors (N, Vx): 'X Direction' = (N ^ Vx) ^ N, Exception: raises ConstructionError if N and Vx are parallel (same or opposite orientation).

	:param P:
	:type P: gp_Pnt
	:param N:
	:type N: gp_Dir
	:param Vx:
	:type Vx: gp_Dir
	:rtype: None
") gp_Ax2;
		 gp_Ax2 (const gp_Pnt & P,const gp_Dir & N,const gp_Dir & Vx);
		%feature("compactdefaultargs") gp_Ax2;
		%feature("autodoc", "	* Creates - a coordinate system with an origin P, where V gives the 'main Direction' (here, 'X Direction' and 'Y Direction' are defined automatically).

	:param P:
	:type P: gp_Pnt
	:param V:
	:type V: gp_Dir
	:rtype: None
") gp_Ax2;
		 gp_Ax2 (const gp_Pnt & P,const gp_Dir & V);
		%feature("compactdefaultargs") SetAxis;
		%feature("autodoc", "	* Assigns the origin and 'main Direction' of the axis A1 to this coordinate system, then recomputes its 'X Direction' and 'Y Direction'. Note: The new 'X Direction' is computed as follows: new 'X Direction' = V1 ^(previous 'X Direction' ^ V) where V is the 'Direction' of A1. Exceptions Standard_ConstructionError if A1 is parallel to the 'X Direction' of this coordinate system.

	:param A1:
	:type A1: gp_Ax1
	:rtype: None
") SetAxis;
		void SetAxis (const gp_Ax1 & A1);
		%feature("compactdefaultargs") SetDirection;
		%feature("autodoc", "	* Changes the 'main Direction' of this coordinate system, then recomputes its 'X Direction' and 'Y Direction'. Note: the new 'X Direction' is computed as follows: new 'X Direction' = V ^ (previous 'X Direction' ^ V) Exceptions Standard_ConstructionError if V is parallel to the 'X Direction' of this coordinate system.

	:param V:
	:type V: gp_Dir
	:rtype: None
") SetDirection;
		void SetDirection (const gp_Dir & V);
		%feature("compactdefaultargs") SetLocation;
		%feature("autodoc", "	* Changes the 'Location' point (origin) of <self>.

	:param P:
	:type P: gp_Pnt
	:rtype: None
") SetLocation;
		void SetLocation (const gp_Pnt & P);
		%feature("compactdefaultargs") SetXDirection;
		%feature("autodoc", "	* Changes the 'Xdirection' of <self>. The main direction 'Direction' is not modified, the 'Ydirection' is modified. If <Vx> is not normal to the main direction then <XDirection> is computed as follows XDirection = Direction ^ (Vx ^ Direction). Exceptions Standard_ConstructionError if Vx or Vy is parallel to the 'main Direction' of this coordinate system.

	:param Vx:
	:type Vx: gp_Dir
	:rtype: None
") SetXDirection;
		void SetXDirection (const gp_Dir & Vx);
		%feature("compactdefaultargs") SetYDirection;
		%feature("autodoc", "	* Changes the 'Ydirection' of <self>. The main direction is not modified but the 'Xdirection' is changed. If <Vy> is not normal to the main direction then 'YDirection' is computed as follows YDirection = Direction ^ (<Vy> ^ Direction). Exceptions Standard_ConstructionError if Vx or Vy is parallel to the 'main Direction' of this coordinate system.

	:param Vy:
	:type Vy: gp_Dir
	:rtype: None
") SetYDirection;
		void SetYDirection (const gp_Dir & Vy);
		%feature("compactdefaultargs") Angle;
		%feature("autodoc", "	* Computes the angular value, in radians, between the main direction of <self> and the main direction of <Other>. Returns the angle between 0 and PI in radians.

	:param Other:
	:type Other: gp_Ax2
	:rtype: float
") Angle;
		Standard_Real Angle (const gp_Ax2 & Other);
		%feature("compactdefaultargs") Axis;
		%feature("autodoc", "	* Returns the main axis of <self>. It is the 'Location' point and the main 'Direction'.

	:rtype: gp_Ax1
") Axis;
		const gp_Ax1  Axis ();
		%feature("compactdefaultargs") Direction;
		%feature("autodoc", "	* Returns the main direction of <self>.

	:rtype: gp_Dir
") Direction;
		const gp_Dir  Direction ();
		%feature("compactdefaultargs") Location;
		%feature("autodoc", "	* Returns the 'Location' point (origin) of <self>.

	:rtype: gp_Pnt
") Location;
		const gp_Pnt  Location ();
		%feature("compactdefaultargs") XDirection;
		%feature("autodoc", "	* Returns the 'XDirection' of <self>.

	:rtype: gp_Dir
") XDirection;
		const gp_Dir  XDirection ();
		%feature("compactdefaultargs") YDirection;
		%feature("autodoc", "	* Returns the 'YDirection' of <self>.

	:rtype: gp_Dir
") YDirection;
		const gp_Dir  YDirection ();
		%feature("compactdefaultargs") IsCoplanar;
		%feature("autodoc", "	:param Other:
	:type Other: gp_Ax2
	:param LinearTolerance:
	:type LinearTolerance: float
	:param AngularTolerance:
	:type AngularTolerance: float
	:rtype: bool
") IsCoplanar;
		Standard_Boolean IsCoplanar (const gp_Ax2 & Other,const Standard_Real LinearTolerance,const Standard_Real AngularTolerance);
		%feature("compactdefaultargs") IsCoplanar;
		%feature("autodoc", "	* Returns True if . the distance between <self> and the 'Location' point of A1 is lower of equal to LinearTolerance and . the main direction of <self> and the direction of A1 are normal. Note: the tolerance criterion for angular equality is given by AngularTolerance.

	:param A1:
	:type A1: gp_Ax1
	:param LinearTolerance:
	:type LinearTolerance: float
	:param AngularTolerance:
	:type AngularTolerance: float
	:rtype: bool
") IsCoplanar;
		Standard_Boolean IsCoplanar (const gp_Ax1 & A1,const Standard_Real LinearTolerance,const Standard_Real AngularTolerance);
		%feature("compactdefaultargs") Mirror;
		%feature("autodoc", "	* Performs a symmetrical transformation of this coordinate system with respect to: - the point P, and assigns the result to this coordinate system. Warning This transformation is always performed on the origin. In case of a reflection with respect to a point: - the main direction of the coordinate system is not changed, and - the 'X Direction' and the 'Y Direction' are simply reversed In case of a reflection with respect to an axis or a plane: - the transformation is applied to the 'X Direction' and the 'Y Direction', then - the 'main Direction' is recomputed as the cross product 'X Direction' ^ 'Y Direction'. This maintains the right-handed property of the coordinate system.

	:param P:
	:type P: gp_Pnt
	:rtype: None
") Mirror;
		void Mirror (const gp_Pnt & P);
		%feature("compactdefaultargs") Mirrored;
		%feature("autodoc", "	* Performs a symmetrical transformation of this coordinate system with respect to: - the point P, and creates a new one. Warning This transformation is always performed on the origin. In case of a reflection with respect to a point: - the main direction of the coordinate system is not changed, and - the 'X Direction' and the 'Y Direction' are simply reversed In case of a reflection with respect to an axis or a plane: - the transformation is applied to the 'X Direction' and the 'Y Direction', then - the 'main Direction' is recomputed as the cross product 'X Direction' ^ 'Y Direction'. This maintains the right-handed property of the coordinate system.

	:param P:
	:type P: gp_Pnt
	:rtype: gp_Ax2
") Mirrored;
		gp_Ax2 Mirrored (const gp_Pnt & P);
		%feature("compactdefaultargs") Mirror;
		%feature("autodoc", "	* Performs a symmetrical transformation of this coordinate system with respect to: - the axis A1, and assigns the result to this coordinate systeme. Warning This transformation is always performed on the origin. In case of a reflection with respect to a point: - the main direction of the coordinate system is not changed, and - the 'X Direction' and the 'Y Direction' are simply reversed In case of a reflection with respect to an axis or a plane: - the transformation is applied to the 'X Direction' and the 'Y Direction', then - the 'main Direction' is recomputed as the cross product 'X Direction' ^ 'Y Direction'. This maintains the right-handed property of the coordinate system.

	:param A1:
	:type A1: gp_Ax1
	:rtype: None
") Mirror;
		void Mirror (const gp_Ax1 & A1);
		%feature("compactdefaultargs") Mirrored;
		%feature("autodoc", "	* Performs a symmetrical transformation of this coordinate system with respect to: - the axis A1, and creates a new one. Warning This transformation is always performed on the origin. In case of a reflection with respect to a point: - the main direction of the coordinate system is not changed, and - the 'X Direction' and the 'Y Direction' are simply reversed In case of a reflection with respect to an axis or a plane: - the transformation is applied to the 'X Direction' and the 'Y Direction', then - the 'main Direction' is recomputed as the cross product 'X Direction' ^ 'Y Direction'. This maintains the right-handed property of the coordinate system.

	:param A1:
	:type A1: gp_Ax1
	:rtype: gp_Ax2
") Mirrored;
		gp_Ax2 Mirrored (const gp_Ax1 & A1);
		%feature("compactdefaultargs") Mirror;
		%feature("autodoc", "	* Performs a symmetrical transformation of this coordinate system with respect to: - the plane defined by the origin, 'X Direction' and 'Y Direction' of coordinate system A2 and assigns the result to this coordinate systeme. Warning This transformation is always performed on the origin. In case of a reflection with respect to a point: - the main direction of the coordinate system is not changed, and - the 'X Direction' and the 'Y Direction' are simply reversed In case of a reflection with respect to an axis or a plane: - the transformation is applied to the 'X Direction' and the 'Y Direction', then - the 'main Direction' is recomputed as the cross product 'X Direction' ^ 'Y Direction'. This maintains the right-handed property of the coordinate system.

	:param A2:
	:type A2: gp_Ax2
	:rtype: None
") Mirror;
		void Mirror (const gp_Ax2 & A2);
		%feature("compactdefaultargs") Mirrored;
		%feature("autodoc", "	* Performs a symmetrical transformation of this coordinate system with respect to: - the plane defined by the origin, 'X Direction' and 'Y Direction' of coordinate system A2 and creates a new one. Warning This transformation is always performed on the origin. In case of a reflection with respect to a point: - the main direction of the coordinate system is not changed, and - the 'X Direction' and the 'Y Direction' are simply reversed In case of a reflection with respect to an axis or a plane: - the transformation is applied to the 'X Direction' and the 'Y Direction', then - the 'main Direction' is recomputed as the cross product 'X Direction' ^ 'Y Direction'. This maintains the right-handed property of the coordinate system.

	:param A2:
	:type A2: gp_Ax2
	:rtype: gp_Ax2
") Mirrored;
		gp_Ax2 Mirrored (const gp_Ax2 & A2);
		%feature("compactdefaultargs") Rotate;
		%feature("autodoc", "	:param A1:
	:type A1: gp_Ax1
	:param Ang:
	:type Ang: float
	:rtype: None
") Rotate;
		void Rotate (const gp_Ax1 & A1,const Standard_Real Ang);
		%feature("compactdefaultargs") Rotated;
		%feature("autodoc", "	* Rotates an axis placement. <A1> is the axis of the rotation . Ang is the angular value of the rotation in radians.

	:param A1:
	:type A1: gp_Ax1
	:param Ang:
	:type Ang: float
	:rtype: gp_Ax2
") Rotated;
		gp_Ax2 Rotated (const gp_Ax1 & A1,const Standard_Real Ang);
		%feature("compactdefaultargs") Scale;
		%feature("autodoc", "	:param P:
	:type P: gp_Pnt
	:param S:
	:type S: float
	:rtype: None
") Scale;
		void Scale (const gp_Pnt & P,const Standard_Real S);
		%feature("compactdefaultargs") Scaled;
		%feature("autodoc", "	* Applies a scaling transformation on the axis placement. The 'Location' point of the axisplacement is modified. Warnings : If the scale <S> is negative : . the main direction of the axis placement is not changed. . The 'XDirection' and the 'YDirection' are reversed. So the axis placement stay right handed.

	:param P:
	:type P: gp_Pnt
	:param S:
	:type S: float
	:rtype: gp_Ax2
") Scaled;
		gp_Ax2 Scaled (const gp_Pnt & P,const Standard_Real S);
		%feature("compactdefaultargs") Transform;
		%feature("autodoc", "	:param T:
	:type T: gp_Trsf
	:rtype: None
") Transform;
		void Transform (const gp_Trsf & T);
		%feature("compactdefaultargs") Transformed;
		%feature("autodoc", "	* Transforms an axis placement with a Trsf. The 'Location' point, the 'XDirection' and the 'YDirection' are transformed with T. The resulting main 'Direction' of <self> is the cross product between the 'XDirection' and the 'YDirection' after transformation.

	:param T:
	:type T: gp_Trsf
	:rtype: gp_Ax2
") Transformed;
		gp_Ax2 Transformed (const gp_Trsf & T);
		%feature("compactdefaultargs") Translate;
		%feature("autodoc", "	:param V:
	:type V: gp_Vec
	:rtype: None
") Translate;
		void Translate (const gp_Vec & V);
		%feature("compactdefaultargs") Translated;
		%feature("autodoc", "	* Translates an axis plaxement in the direction of the vector <V>. The magnitude of the translation is the vector's magnitude.

	:param V:
	:type V: gp_Vec
	:rtype: gp_Ax2
") Translated;
		gp_Ax2 Translated (const gp_Vec & V);
		%feature("compactdefaultargs") Translate;
		%feature("autodoc", "	:param P1:
	:type P1: gp_Pnt
	:param P2:
	:type P2: gp_Pnt
	:rtype: None
") Translate;
		void Translate (const gp_Pnt & P1,const gp_Pnt & P2);
		%feature("compactdefaultargs") Translated;
		%feature("autodoc", "	* Translates an axis placement from the point <P1> to the point <P2>.

	:param P1:
	:type P1: gp_Pnt
	:param P2:
	:type P2: gp_Pnt
	:rtype: gp_Ax2
") Translated;
		gp_Ax2 Translated (const gp_Pnt & P1,const gp_Pnt & P2);
		%feature("compactdefaultargs") _CSFDB_Getgp_Ax2axis;
		%feature("autodoc", "	:rtype: gp_Ax1
") _CSFDB_Getgp_Ax2axis;
		const gp_Ax1  _CSFDB_Getgp_Ax2axis ();
		%feature("compactdefaultargs") _CSFDB_Getgp_Ax2vydir;
		%feature("autodoc", "	:rtype: gp_Dir
") _CSFDB_Getgp_Ax2vydir;
		const gp_Dir  _CSFDB_Getgp_Ax2vydir ();
		%feature("compactdefaultargs") _CSFDB_Getgp_Ax2vxdir;
		%feature("autodoc", "	:rtype: gp_Dir
") _CSFDB_Getgp_Ax2vxdir;
		const gp_Dir  _CSFDB_Getgp_Ax2vxdir ();
};


%extend gp_Ax2 {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor gp_Ax22d;
class gp_Ax22d {
	public:
		%feature("compactdefaultargs") gp_Ax22d;
		%feature("autodoc", "	* Creates an object representing the reference co-ordinate system (OXY).

	:rtype: None
") gp_Ax22d;
		 gp_Ax22d ();
		%feature("compactdefaultargs") gp_Ax22d;
		%feature("autodoc", "	* Creates a coordinate system with origin P and where: - Vx is the 'X Direction', and - the 'Y Direction' is orthogonal to Vx and oriented so that the cross products Vx^'Y Direction' and Vx^Vy have the same sign. Raises ConstructionError if Vx and Vy are parallel (same or opposite orientation).

	:param P:
	:type P: gp_Pnt2d
	:param Vx:
	:type Vx: gp_Dir2d
	:param Vy:
	:type Vy: gp_Dir2d
	:rtype: None
") gp_Ax22d;
		 gp_Ax22d (const gp_Pnt2d & P,const gp_Dir2d & Vx,const gp_Dir2d & Vy);
		%feature("compactdefaultargs") gp_Ax22d;
		%feature("autodoc", "	* Creates - a coordinate system with origin P and 'X Direction' V, which is: - right-handed if Sense is true (default value), or - left-handed if Sense is false

	:param P:
	:type P: gp_Pnt2d
	:param V:
	:type V: gp_Dir2d
	:param Sense: default value is Standard_True
	:type Sense: bool
	:rtype: None
") gp_Ax22d;
		 gp_Ax22d (const gp_Pnt2d & P,const gp_Dir2d & V,const Standard_Boolean Sense = Standard_True);
		%feature("compactdefaultargs") gp_Ax22d;
		%feature("autodoc", "	* Creates - a coordinate system where its origin is the origin of A and its 'X Direction' is the unit vector of A, which is: - right-handed if Sense is true (default value), or - left-handed if Sense is false.

	:param A:
	:type A: gp_Ax2d
	:param Sense: default value is Standard_True
	:type Sense: bool
	:rtype: None
") gp_Ax22d;
		 gp_Ax22d (const gp_Ax2d & A,const Standard_Boolean Sense = Standard_True);
		%feature("compactdefaultargs") SetAxis;
		%feature("autodoc", "	* Assigns the origin and the two unit vectors of the coordinate system A1 to this coordinate system.

	:param A1:
	:type A1: gp_Ax22d
	:rtype: None
") SetAxis;
		void SetAxis (const gp_Ax22d & A1);
		%feature("compactdefaultargs") SetXAxis;
		%feature("autodoc", "	* Changes the XAxis and YAxis ('Location' point and 'Direction') of <self>. The 'YDirection' is recomputed in the same sense as before.

	:param A1:
	:type A1: gp_Ax2d
	:rtype: None
") SetXAxis;
		void SetXAxis (const gp_Ax2d & A1);
		%feature("compactdefaultargs") SetYAxis;
		%feature("autodoc", "	* Changes the XAxis and YAxis ('Location' point and 'Direction') of <self>. The 'XDirection' is recomputed in the same sense as before.

	:param A1:
	:type A1: gp_Ax2d
	:rtype: None
") SetYAxis;
		void SetYAxis (const gp_Ax2d & A1);
		%feature("compactdefaultargs") SetLocation;
		%feature("autodoc", "	* Changes the 'Location' point (origin) of <self>.

	:param P:
	:type P: gp_Pnt2d
	:rtype: None
") SetLocation;
		void SetLocation (const gp_Pnt2d & P);
		%feature("compactdefaultargs") SetXDirection;
		%feature("autodoc", "	* Assigns Vx to the 'X Direction' of this coordinate system. The other unit vector of this coordinate system is recomputed, normal to Vx , without modifying the orientation (right-handed or left-handed) of this coordinate system.

	:param Vx:
	:type Vx: gp_Dir2d
	:rtype: None
") SetXDirection;
		void SetXDirection (const gp_Dir2d & Vx);
		%feature("compactdefaultargs") SetYDirection;
		%feature("autodoc", "	* Assignsr Vy to the 'Y Direction' of this coordinate system. The other unit vector of this coordinate system is recomputed, normal to Vy, without modifying the orientation (right-handed or left-handed) of this coordinate system.

	:param Vy:
	:type Vy: gp_Dir2d
	:rtype: None
") SetYDirection;
		void SetYDirection (const gp_Dir2d & Vy);
		%feature("compactdefaultargs") XAxis;
		%feature("autodoc", "	* Returns an axis, for which - the origin is that of this coordinate system, and - the unit vector is either the 'X Direction' of this coordinate system. Note: the result is the 'X Axis' of this coordinate system.

	:rtype: gp_Ax2d
") XAxis;
		gp_Ax2d XAxis ();
		%feature("compactdefaultargs") YAxis;
		%feature("autodoc", "	* Returns an axis, for which - the origin is that of this coordinate system, and - the unit vector is either the 'Y Direction' of this coordinate system. Note: the result is the 'Y Axis' of this coordinate system.

	:rtype: gp_Ax2d
") YAxis;
		gp_Ax2d YAxis ();
		%feature("compactdefaultargs") Location;
		%feature("autodoc", "	* Returns the 'Location' point (origin) of <self>.

	:rtype: gp_Pnt2d
") Location;
		const gp_Pnt2d  Location ();
		%feature("compactdefaultargs") XDirection;
		%feature("autodoc", "	* Returns the 'XDirection' of <self>.

	:rtype: gp_Dir2d
") XDirection;
		const gp_Dir2d  XDirection ();
		%feature("compactdefaultargs") YDirection;
		%feature("autodoc", "	* Returns the 'YDirection' of <self>.

	:rtype: gp_Dir2d
") YDirection;
		const gp_Dir2d  YDirection ();
		%feature("compactdefaultargs") Mirror;
		%feature("autodoc", "	:param P:
	:type P: gp_Pnt2d
	:rtype: None
") Mirror;
		void Mirror (const gp_Pnt2d & P);
		%feature("compactdefaultargs") Mirrored;
		%feature("autodoc", "	* Performs the symmetrical transformation of an axis placement with respect to the point P which is the center of the symmetry. Warnings : The main direction of the axis placement is not changed. The 'XDirection' and the 'YDirection' are reversed. So the axis placement stay right handed.

	:param P:
	:type P: gp_Pnt2d
	:rtype: gp_Ax22d
") Mirrored;
		gp_Ax22d Mirrored (const gp_Pnt2d & P);
		%feature("compactdefaultargs") Mirror;
		%feature("autodoc", "	:param A:
	:type A: gp_Ax2d
	:rtype: None
") Mirror;
		void Mirror (const gp_Ax2d & A);
		%feature("compactdefaultargs") Mirrored;
		%feature("autodoc", "	* Performs the symmetrical transformation of an axis placement with respect to an axis placement which is the axis of the symmetry. The transformation is performed on the 'Location' point, on the 'XDirection' and 'YDirection'. The resulting main 'Direction' is the cross product between the 'XDirection' and the 'YDirection' after transformation.

	:param A:
	:type A: gp_Ax2d
	:rtype: gp_Ax22d
") Mirrored;
		gp_Ax22d Mirrored (const gp_Ax2d & A);
		%feature("compactdefaultargs") Rotate;
		%feature("autodoc", "	:param P:
	:type P: gp_Pnt2d
	:param Ang:
	:type Ang: float
	:rtype: None
") Rotate;
		void Rotate (const gp_Pnt2d & P,const Standard_Real Ang);
		%feature("compactdefaultargs") Rotated;
		%feature("autodoc", "	* Rotates an axis placement. <A1> is the axis of the rotation . Ang is the angular value of the rotation in radians.

	:param P:
	:type P: gp_Pnt2d
	:param Ang:
	:type Ang: float
	:rtype: gp_Ax22d
") Rotated;
		gp_Ax22d Rotated (const gp_Pnt2d & P,const Standard_Real Ang);
		%feature("compactdefaultargs") Scale;
		%feature("autodoc", "	:param P:
	:type P: gp_Pnt2d
	:param S:
	:type S: float
	:rtype: None
") Scale;
		void Scale (const gp_Pnt2d & P,const Standard_Real S);
		%feature("compactdefaultargs") Scaled;
		%feature("autodoc", "	* Applies a scaling transformation on the axis placement. The 'Location' point of the axisplacement is modified. Warnings : If the scale <S> is negative : . the main direction of the axis placement is not changed. . The 'XDirection' and the 'YDirection' are reversed. So the axis placement stay right handed.

	:param P:
	:type P: gp_Pnt2d
	:param S:
	:type S: float
	:rtype: gp_Ax22d
") Scaled;
		gp_Ax22d Scaled (const gp_Pnt2d & P,const Standard_Real S);
		%feature("compactdefaultargs") Transform;
		%feature("autodoc", "	:param T:
	:type T: gp_Trsf2d
	:rtype: None
") Transform;
		void Transform (const gp_Trsf2d & T);
		%feature("compactdefaultargs") Transformed;
		%feature("autodoc", "	* Transforms an axis placement with a Trsf. The 'Location' point, the 'XDirection' and the 'YDirection' are transformed with T. The resulting main 'Direction' of <self> is the cross product between the 'XDirection' and the 'YDirection' after transformation.

	:param T:
	:type T: gp_Trsf2d
	:rtype: gp_Ax22d
") Transformed;
		gp_Ax22d Transformed (const gp_Trsf2d & T);
		%feature("compactdefaultargs") Translate;
		%feature("autodoc", "	:param V:
	:type V: gp_Vec2d
	:rtype: None
") Translate;
		void Translate (const gp_Vec2d & V);
		%feature("compactdefaultargs") Translated;
		%feature("autodoc", "	* Translates an axis plaxement in the direction of the vector <V>. The magnitude of the translation is the vector's magnitude.

	:param V:
	:type V: gp_Vec2d
	:rtype: gp_Ax22d
") Translated;
		gp_Ax22d Translated (const gp_Vec2d & V);
		%feature("compactdefaultargs") Translate;
		%feature("autodoc", "	:param P1:
	:type P1: gp_Pnt2d
	:param P2:
	:type P2: gp_Pnt2d
	:rtype: None
") Translate;
		void Translate (const gp_Pnt2d & P1,const gp_Pnt2d & P2);
		%feature("compactdefaultargs") Translated;
		%feature("autodoc", "	* Translates an axis placement from the point <P1> to the point <P2>.

	:param P1:
	:type P1: gp_Pnt2d
	:param P2:
	:type P2: gp_Pnt2d
	:rtype: gp_Ax22d
") Translated;
		gp_Ax22d Translated (const gp_Pnt2d & P1,const gp_Pnt2d & P2);
		%feature("compactdefaultargs") _CSFDB_Getgp_Ax22dpoint;
		%feature("autodoc", "	:rtype: gp_Pnt2d
") _CSFDB_Getgp_Ax22dpoint;
		const gp_Pnt2d  _CSFDB_Getgp_Ax22dpoint ();
		%feature("compactdefaultargs") _CSFDB_Getgp_Ax22dvydir;
		%feature("autodoc", "	:rtype: gp_Dir2d
") _CSFDB_Getgp_Ax22dvydir;
		const gp_Dir2d  _CSFDB_Getgp_Ax22dvydir ();
		%feature("compactdefaultargs") _CSFDB_Getgp_Ax22dvxdir;
		%feature("autodoc", "	:rtype: gp_Dir2d
") _CSFDB_Getgp_Ax22dvxdir;
		const gp_Dir2d  _CSFDB_Getgp_Ax22dvxdir ();
};


%extend gp_Ax22d {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor gp_Ax2d;
class gp_Ax2d {
	public:
		%feature("compactdefaultargs") gp_Ax2d;
		%feature("autodoc", "	* Creates an axis object representing X axis of the reference co-ordinate system.

	:rtype: None
") gp_Ax2d;
		 gp_Ax2d ();
		%feature("compactdefaultargs") gp_Ax2d;
		%feature("autodoc", "	* Creates an Ax2d. <P> is the 'Location' point of the axis placement and V is the 'Direction' of the axis placement.

	:param P:
	:type P: gp_Pnt2d
	:param V:
	:type V: gp_Dir2d
	:rtype: None
") gp_Ax2d;
		 gp_Ax2d (const gp_Pnt2d & P,const gp_Dir2d & V);
		%feature("compactdefaultargs") SetLocation;
		%feature("autodoc", "	* Changes the 'Location' point (origin) of <self>.

	:param Locat:
	:type Locat: gp_Pnt2d
	:rtype: None
") SetLocation;
		void SetLocation (const gp_Pnt2d & Locat);
		%feature("compactdefaultargs") SetDirection;
		%feature("autodoc", "	* Changes the direction of <self>.

	:param V:
	:type V: gp_Dir2d
	:rtype: None
") SetDirection;
		void SetDirection (const gp_Dir2d & V);
		%feature("compactdefaultargs") Location;
		%feature("autodoc", "	* Returns the origin of <self>.

	:rtype: gp_Pnt2d
") Location;
		const gp_Pnt2d  Location ();
		%feature("compactdefaultargs") Direction;
		%feature("autodoc", "	* Returns the direction of <self>.

	:rtype: gp_Dir2d
") Direction;
		const gp_Dir2d  Direction ();
		%feature("compactdefaultargs") IsCoaxial;
		%feature("autodoc", "	* Returns True if : . the angle between <self> and <Other> is lower or equal to <AngularTolerance> and . the distance between <self>.Location() and <Other> is lower or equal to <LinearTolerance> and . the distance between <Other>.Location() and <self> is lower or equal to LinearTolerance.

	:param Other:
	:type Other: gp_Ax2d
	:param AngularTolerance:
	:type AngularTolerance: float
	:param LinearTolerance:
	:type LinearTolerance: float
	:rtype: bool
") IsCoaxial;
		Standard_Boolean IsCoaxial (const gp_Ax2d & Other,const Standard_Real AngularTolerance,const Standard_Real LinearTolerance);
		%feature("compactdefaultargs") IsNormal;
		%feature("autodoc", "	* Returns true if this axis and the axis Other are normal to each other. That is, if the angle between the two axes is equal to Pi/2 or -Pi/2. Note: the tolerance criterion is given by AngularTolerance.

	:param Other:
	:type Other: gp_Ax2d
	:param AngularTolerance:
	:type AngularTolerance: float
	:rtype: bool
") IsNormal;
		Standard_Boolean IsNormal (const gp_Ax2d & Other,const Standard_Real AngularTolerance);
		%feature("compactdefaultargs") IsOpposite;
		%feature("autodoc", "	* Returns true if this axis and the axis Other are parallel, and have opposite orientations. That is, if the angle between the two axes is equal to Pi or -Pi. Note: the tolerance criterion is given by AngularTolerance.

	:param Other:
	:type Other: gp_Ax2d
	:param AngularTolerance:
	:type AngularTolerance: float
	:rtype: bool
") IsOpposite;
		Standard_Boolean IsOpposite (const gp_Ax2d & Other,const Standard_Real AngularTolerance);
		%feature("compactdefaultargs") IsParallel;
		%feature("autodoc", "	* Returns true if this axis and the axis Other are parallel, and have either the same or opposite orientations. That is, if the angle between the two axes is equal to 0, Pi or -Pi. Note: the tolerance criterion is given by AngularTolerance.

	:param Other:
	:type Other: gp_Ax2d
	:param AngularTolerance:
	:type AngularTolerance: float
	:rtype: bool
") IsParallel;
		Standard_Boolean IsParallel (const gp_Ax2d & Other,const Standard_Real AngularTolerance);
		%feature("compactdefaultargs") Angle;
		%feature("autodoc", "	* Computes the angle, in radians, between this axis and the axis Other. The value of the angle is between -Pi and Pi.

	:param Other:
	:type Other: gp_Ax2d
	:rtype: float
") Angle;
		Standard_Real Angle (const gp_Ax2d & Other);
		%feature("compactdefaultargs") Reverse;
		%feature("autodoc", "	* Reverses the direction of <self> and assigns the result to this axis.

	:rtype: None
") Reverse;
		void Reverse ();
		%feature("compactdefaultargs") Reversed;
		%feature("autodoc", "	* Computes a new axis placement with a direction opposite to the direction of <self>.

	:rtype: gp_Ax2d
") Reversed;
		gp_Ax2d Reversed ();
		%feature("compactdefaultargs") Mirror;
		%feature("autodoc", "	:param P:
	:type P: gp_Pnt2d
	:rtype: None
") Mirror;
		void Mirror (const gp_Pnt2d & P);
		%feature("compactdefaultargs") Mirrored;
		%feature("autodoc", "	* Performs the symmetrical transformation of an axis placement with respect to the point P which is the center of the symmetry.

	:param P:
	:type P: gp_Pnt2d
	:rtype: gp_Ax2d
") Mirrored;
		gp_Ax2d Mirrored (const gp_Pnt2d & P);
		%feature("compactdefaultargs") Mirror;
		%feature("autodoc", "	:param A:
	:type A: gp_Ax2d
	:rtype: None
") Mirror;
		void Mirror (const gp_Ax2d & A);
		%feature("compactdefaultargs") Mirrored;
		%feature("autodoc", "	* Performs the symmetrical transformation of an axis placement with respect to an axis placement which is the axis of the symmetry.

	:param A:
	:type A: gp_Ax2d
	:rtype: gp_Ax2d
") Mirrored;
		gp_Ax2d Mirrored (const gp_Ax2d & A);
		%feature("compactdefaultargs") Rotate;
		%feature("autodoc", "	:param P:
	:type P: gp_Pnt2d
	:param Ang:
	:type Ang: float
	:rtype: None
") Rotate;
		void Rotate (const gp_Pnt2d & P,const Standard_Real Ang);
		%feature("compactdefaultargs") Rotated;
		%feature("autodoc", "	* Rotates an axis placement. <P> is the center of the rotation . Ang is the angular value of the rotation in radians.

	:param P:
	:type P: gp_Pnt2d
	:param Ang:
	:type Ang: float
	:rtype: gp_Ax2d
") Rotated;
		gp_Ax2d Rotated (const gp_Pnt2d & P,const Standard_Real Ang);
		%feature("compactdefaultargs") Scale;
		%feature("autodoc", "	:param P:
	:type P: gp_Pnt2d
	:param S:
	:type S: float
	:rtype: None
") Scale;
		void Scale (const gp_Pnt2d & P,const Standard_Real S);
		%feature("compactdefaultargs") Scaled;
		%feature("autodoc", "	* Applies a scaling transformation on the axis placement. The 'Location' point of the axisplacement is modified. The 'Direction' is reversed if the scale is negative.

	:param P:
	:type P: gp_Pnt2d
	:param S:
	:type S: float
	:rtype: gp_Ax2d
") Scaled;
		gp_Ax2d Scaled (const gp_Pnt2d & P,const Standard_Real S);
		%feature("compactdefaultargs") Transform;
		%feature("autodoc", "	:param T:
	:type T: gp_Trsf2d
	:rtype: None
") Transform;
		void Transform (const gp_Trsf2d & T);
		%feature("compactdefaultargs") Transformed;
		%feature("autodoc", "	* Transforms an axis placement with a Trsf.

	:param T:
	:type T: gp_Trsf2d
	:rtype: gp_Ax2d
") Transformed;
		gp_Ax2d Transformed (const gp_Trsf2d & T);
		%feature("compactdefaultargs") Translate;
		%feature("autodoc", "	:param V:
	:type V: gp_Vec2d
	:rtype: None
") Translate;
		void Translate (const gp_Vec2d & V);
		%feature("compactdefaultargs") Translated;
		%feature("autodoc", "	* Translates an axis placement in the direction of the vector <V>. The magnitude of the translation is the vector's magnitude.

	:param V:
	:type V: gp_Vec2d
	:rtype: gp_Ax2d
") Translated;
		gp_Ax2d Translated (const gp_Vec2d & V);
		%feature("compactdefaultargs") Translate;
		%feature("autodoc", "	:param P1:
	:type P1: gp_Pnt2d
	:param P2:
	:type P2: gp_Pnt2d
	:rtype: None
") Translate;
		void Translate (const gp_Pnt2d & P1,const gp_Pnt2d & P2);
		%feature("compactdefaultargs") Translated;
		%feature("autodoc", "	* Translates an axis placement from the point <P1> to the point <P2>.

	:param P1:
	:type P1: gp_Pnt2d
	:param P2:
	:type P2: gp_Pnt2d
	:rtype: gp_Ax2d
") Translated;
		gp_Ax2d Translated (const gp_Pnt2d & P1,const gp_Pnt2d & P2);
		%feature("compactdefaultargs") _CSFDB_Getgp_Ax2dloc;
		%feature("autodoc", "	:rtype: gp_Pnt2d
") _CSFDB_Getgp_Ax2dloc;
		const gp_Pnt2d  _CSFDB_Getgp_Ax2dloc ();
		%feature("compactdefaultargs") _CSFDB_Getgp_Ax2dvdir;
		%feature("autodoc", "	:rtype: gp_Dir2d
") _CSFDB_Getgp_Ax2dvdir;
		const gp_Dir2d  _CSFDB_Getgp_Ax2dvdir ();
};


%extend gp_Ax2d {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor gp_Ax3;
class gp_Ax3 {
	public:
		%feature("compactdefaultargs") gp_Ax3;
		%feature("autodoc", "	* Creates an object corresponding to the reference coordinate system (OXYZ).

	:rtype: None
") gp_Ax3;
		 gp_Ax3 ();
		%feature("compactdefaultargs") gp_Ax3;
		%feature("autodoc", "	* Creates a coordinate system from a right-handed coordinate system.

	:param A:
	:type A: gp_Ax2
	:rtype: None
") gp_Ax3;
		 gp_Ax3 (const gp_Ax2 & A);
		%feature("compactdefaultargs") gp_Ax3;
		%feature("autodoc", "	* Creates a right handed axis placement with the 'Location' point P and two directions, N gives the 'Direction' and Vx gives the 'XDirection'. Raises ConstructionError if N and Vx are parallel (same or opposite orientation).

	:param P:
	:type P: gp_Pnt
	:param N:
	:type N: gp_Dir
	:param Vx:
	:type Vx: gp_Dir
	:rtype: None
") gp_Ax3;
		 gp_Ax3 (const gp_Pnt & P,const gp_Dir & N,const gp_Dir & Vx);
		%feature("compactdefaultargs") gp_Ax3;
		%feature("autodoc", "	* Creates an axis placement with the 'Location' point <P> and the normal direction <V>.

	:param P:
	:type P: gp_Pnt
	:param V:
	:type V: gp_Dir
	:rtype: None
") gp_Ax3;
		 gp_Ax3 (const gp_Pnt & P,const gp_Dir & V);
		%feature("compactdefaultargs") XReverse;
		%feature("autodoc", "	* Reverses the X direction of <self>.

	:rtype: None
") XReverse;
		void XReverse ();
		%feature("compactdefaultargs") YReverse;
		%feature("autodoc", "	* Reverses the Y direction of <self>.

	:rtype: None
") YReverse;
		void YReverse ();
		%feature("compactdefaultargs") ZReverse;
		%feature("autodoc", "	* Reverses the Z direction of <self>.

	:rtype: None
") ZReverse;
		void ZReverse ();
		%feature("compactdefaultargs") SetAxis;
		%feature("autodoc", "	* Assigns the origin and 'main Direction' of the axis A1 to this coordinate system, then recomputes its 'X Direction' and 'Y Direction'. Note: - The new 'X Direction' is computed as follows: new 'X Direction' = V1 ^(previous 'X Direction' ^ V) where V is the 'Direction' of A1. - The orientation of this coordinate system (right-handed or left-handed) is not modified. Raises ConstructionError if the 'Direction' of <A1> and the 'XDirection' of <self> are parallel (same or opposite orientation) because it is impossible to calculate the new 'XDirection' and the new 'YDirection'.

	:param A1:
	:type A1: gp_Ax1
	:rtype: None
") SetAxis;
		void SetAxis (const gp_Ax1 & A1);
		%feature("compactdefaultargs") SetDirection;
		%feature("autodoc", "	* Changes the main direction of this coordinate system, then recomputes its 'X Direction' and 'Y Direction'. Note: - The new 'X Direction' is computed as follows: new 'X Direction' = V ^ (previous 'X Direction' ^ V). - The orientation of this coordinate system (left- or right-handed) is not modified. Raises ConstructionError if <V< and the previous 'XDirection' are parallel because it is impossible to calculate the new 'XDirection' and the new 'YDirection'.

	:param V:
	:type V: gp_Dir
	:rtype: None
") SetDirection;
		void SetDirection (const gp_Dir & V);
		%feature("compactdefaultargs") SetLocation;
		%feature("autodoc", "	* Changes the 'Location' point (origin) of <self>.

	:param P:
	:type P: gp_Pnt
	:rtype: None
") SetLocation;
		void SetLocation (const gp_Pnt & P);
		%feature("compactdefaultargs") SetXDirection;
		%feature("autodoc", "	* Changes the 'Xdirection' of <self>. The main direction 'Direction' is not modified, the 'Ydirection' is modified. If <Vx> is not normal to the main direction then <XDirection> is computed as follows XDirection = Direction ^ (Vx ^ Direction). Raises ConstructionError if <Vx> is parallel (same or opposite orientation) to the main direction of <self>

	:param Vx:
	:type Vx: gp_Dir
	:rtype: None
") SetXDirection;
		void SetXDirection (const gp_Dir & Vx);
		%feature("compactdefaultargs") SetYDirection;
		%feature("autodoc", "	* Changes the 'Ydirection' of <self>. The main direction is not modified but the 'Xdirection' is changed. If <Vy> is not normal to the main direction then 'YDirection' is computed as follows YDirection = Direction ^ (<Vy> ^ Direction). Raises ConstructionError if <Vy> is parallel to the main direction of <self>

	:param Vy:
	:type Vy: gp_Dir
	:rtype: None
") SetYDirection;
		void SetYDirection (const gp_Dir & Vy);
		%feature("compactdefaultargs") Angle;
		%feature("autodoc", "	* Computes the angular value between the main direction of <self> and the main direction of <Other>. Returns the angle between 0 and PI in radians.

	:param Other:
	:type Other: gp_Ax3
	:rtype: float
") Angle;
		Standard_Real Angle (const gp_Ax3 & Other);
		%feature("compactdefaultargs") Axis;
		%feature("autodoc", "	* Returns the main axis of <self>. It is the 'Location' point and the main 'Direction'.

	:rtype: gp_Ax1
") Axis;
		const gp_Ax1  Axis ();
		%feature("compactdefaultargs") Ax2;
		%feature("autodoc", "	* Computes a right-handed coordinate system with the same 'X Direction' and 'Y Direction' as those of this coordinate system, then recomputes the 'main Direction'. If this coordinate system is right-handed, the result returned is the same coordinate system. If this coordinate system is left-handed, the result is reversed.

	:rtype: gp_Ax2
") Ax2;
		gp_Ax2 Ax2 ();
		%feature("compactdefaultargs") Direction;
		%feature("autodoc", "	* Returns the main direction of <self>.

	:rtype: gp_Dir
") Direction;
		const gp_Dir  Direction ();
		%feature("compactdefaultargs") Location;
		%feature("autodoc", "	* Returns the 'Location' point (origin) of <self>.

	:rtype: gp_Pnt
") Location;
		const gp_Pnt  Location ();
		%feature("compactdefaultargs") XDirection;
		%feature("autodoc", "	* Returns the 'XDirection' of <self>.

	:rtype: gp_Dir
") XDirection;
		const gp_Dir  XDirection ();
		%feature("compactdefaultargs") YDirection;
		%feature("autodoc", "	* Returns the 'YDirection' of <self>.

	:rtype: gp_Dir
") YDirection;
		const gp_Dir  YDirection ();
		%feature("compactdefaultargs") Direct;
		%feature("autodoc", "	* Returns True if the coordinate system is right-handed. i.e. XDirection().Crossed(YDirection()).Dot(Direction()) > 0

	:rtype: bool
") Direct;
		Standard_Boolean Direct ();
		%feature("compactdefaultargs") IsCoplanar;
		%feature("autodoc", "	* Returns True if . the distance between the 'Location' point of <self> and <Other> is lower or equal to LinearTolerance and . the distance between the 'Location' point of <Other> and <self> is lower or equal to LinearTolerance and . the main direction of <self> and the main direction of <Other> are parallel (same or opposite orientation).

	:param Other:
	:type Other: gp_Ax3
	:param LinearTolerance:
	:type LinearTolerance: float
	:param AngularTolerance:
	:type AngularTolerance: float
	:rtype: bool
") IsCoplanar;
		Standard_Boolean IsCoplanar (const gp_Ax3 & Other,const Standard_Real LinearTolerance,const Standard_Real AngularTolerance);
		%feature("compactdefaultargs") IsCoplanar;
		%feature("autodoc", "	* Returns True if . the distance between <self> and the 'Location' point of A1 is lower of equal to LinearTolerance and . the distance between A1 and the 'Location' point of <self> is lower or equal to LinearTolerance and . the main direction of <self> and the direction of A1 are normal.

	:param A1:
	:type A1: gp_Ax1
	:param LinearTolerance:
	:type LinearTolerance: float
	:param AngularTolerance:
	:type AngularTolerance: float
	:rtype: bool
") IsCoplanar;
		Standard_Boolean IsCoplanar (const gp_Ax1 & A1,const Standard_Real LinearTolerance,const Standard_Real AngularTolerance);
		%feature("compactdefaultargs") Mirror;
		%feature("autodoc", "	:param P:
	:type P: gp_Pnt
	:rtype: None
") Mirror;
		void Mirror (const gp_Pnt & P);
		%feature("compactdefaultargs") Mirrored;
		%feature("autodoc", "	* Performs the symmetrical transformation of an axis placement with respect to the point P which is the center of the symmetry. Warnings : The main direction of the axis placement is not changed. The 'XDirection' and the 'YDirection' are reversed. So the axis placement stay right handed.

	:param P:
	:type P: gp_Pnt
	:rtype: gp_Ax3
") Mirrored;
		gp_Ax3 Mirrored (const gp_Pnt & P);
		%feature("compactdefaultargs") Mirror;
		%feature("autodoc", "	:param A1:
	:type A1: gp_Ax1
	:rtype: None
") Mirror;
		void Mirror (const gp_Ax1 & A1);
		%feature("compactdefaultargs") Mirrored;
		%feature("autodoc", "	* Performs the symmetrical transformation of an axis placement with respect to an axis placement which is the axis of the symmetry. The transformation is performed on the 'Location' point, on the 'XDirection' and 'YDirection'. The resulting main 'Direction' is the cross product between the 'XDirection' and the 'YDirection' after transformation.

	:param A1:
	:type A1: gp_Ax1
	:rtype: gp_Ax3
") Mirrored;
		gp_Ax3 Mirrored (const gp_Ax1 & A1);
		%feature("compactdefaultargs") Mirror;
		%feature("autodoc", "	:param A2:
	:type A2: gp_Ax2
	:rtype: None
") Mirror;
		void Mirror (const gp_Ax2 & A2);
		%feature("compactdefaultargs") Mirrored;
		%feature("autodoc", "	* Performs the symmetrical transformation of an axis placement with respect to a plane. The axis placement <A2> locates the plane of the symmetry : (Location, XDirection, YDirection). The transformation is performed on the 'Location' point, on the 'XDirection' and 'YDirection'. The resulting main 'Direction' is the cross product between the 'XDirection' and the 'YDirection' after transformation.

	:param A2:
	:type A2: gp_Ax2
	:rtype: gp_Ax3
") Mirrored;
		gp_Ax3 Mirrored (const gp_Ax2 & A2);
		%feature("compactdefaultargs") Rotate;
		%feature("autodoc", "	:param A1:
	:type A1: gp_Ax1
	:param Ang:
	:type Ang: float
	:rtype: None
") Rotate;
		void Rotate (const gp_Ax1 & A1,const Standard_Real Ang);
		%feature("compactdefaultargs") Rotated;
		%feature("autodoc", "	* Rotates an axis placement. <A1> is the axis of the rotation . Ang is the angular value of the rotation in radians.

	:param A1:
	:type A1: gp_Ax1
	:param Ang:
	:type Ang: float
	:rtype: gp_Ax3
") Rotated;
		gp_Ax3 Rotated (const gp_Ax1 & A1,const Standard_Real Ang);
		%feature("compactdefaultargs") Scale;
		%feature("autodoc", "	:param P:
	:type P: gp_Pnt
	:param S:
	:type S: float
	:rtype: None
") Scale;
		void Scale (const gp_Pnt & P,const Standard_Real S);
		%feature("compactdefaultargs") Scaled;
		%feature("autodoc", "	* Applies a scaling transformation on the axis placement. The 'Location' point of the axisplacement is modified. Warnings : If the scale <S> is negative : . the main direction of the axis placement is not changed. . The 'XDirection' and the 'YDirection' are reversed. So the axis placement stay right handed.

	:param P:
	:type P: gp_Pnt
	:param S:
	:type S: float
	:rtype: gp_Ax3
") Scaled;
		gp_Ax3 Scaled (const gp_Pnt & P,const Standard_Real S);
		%feature("compactdefaultargs") Transform;
		%feature("autodoc", "	:param T:
	:type T: gp_Trsf
	:rtype: None
") Transform;
		void Transform (const gp_Trsf & T);
		%feature("compactdefaultargs") Transformed;
		%feature("autodoc", "	* Transforms an axis placement with a Trsf. The 'Location' point, the 'XDirection' and the 'YDirection' are transformed with T. The resulting main 'Direction' of <self> is the cross product between the 'XDirection' and the 'YDirection' after transformation.

	:param T:
	:type T: gp_Trsf
	:rtype: gp_Ax3
") Transformed;
		gp_Ax3 Transformed (const gp_Trsf & T);
		%feature("compactdefaultargs") Translate;
		%feature("autodoc", "	:param V:
	:type V: gp_Vec
	:rtype: None
") Translate;
		void Translate (const gp_Vec & V);
		%feature("compactdefaultargs") Translated;
		%feature("autodoc", "	* Translates an axis plaxement in the direction of the vector <V>. The magnitude of the translation is the vector's magnitude.

	:param V:
	:type V: gp_Vec
	:rtype: gp_Ax3
") Translated;
		gp_Ax3 Translated (const gp_Vec & V);
		%feature("compactdefaultargs") Translate;
		%feature("autodoc", "	:param P1:
	:type P1: gp_Pnt
	:param P2:
	:type P2: gp_Pnt
	:rtype: None
") Translate;
		void Translate (const gp_Pnt & P1,const gp_Pnt & P2);
		%feature("compactdefaultargs") Translated;
		%feature("autodoc", "	* Translates an axis placement from the point <P1> to the point <P2>.

	:param P1:
	:type P1: gp_Pnt
	:param P2:
	:type P2: gp_Pnt
	:rtype: gp_Ax3
") Translated;
		gp_Ax3 Translated (const gp_Pnt & P1,const gp_Pnt & P2);
		%feature("compactdefaultargs") _CSFDB_Getgp_Ax3axis;
		%feature("autodoc", "	:rtype: gp_Ax1
") _CSFDB_Getgp_Ax3axis;
		const gp_Ax1  _CSFDB_Getgp_Ax3axis ();
		%feature("compactdefaultargs") _CSFDB_Getgp_Ax3vydir;
		%feature("autodoc", "	:rtype: gp_Dir
") _CSFDB_Getgp_Ax3vydir;
		const gp_Dir  _CSFDB_Getgp_Ax3vydir ();
		%feature("compactdefaultargs") _CSFDB_Getgp_Ax3vxdir;
		%feature("autodoc", "	:rtype: gp_Dir
") _CSFDB_Getgp_Ax3vxdir;
		const gp_Dir  _CSFDB_Getgp_Ax3vxdir ();
};


%extend gp_Ax3 {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor gp_Circ;
class gp_Circ {
	public:
		%feature("compactdefaultargs") gp_Circ;
		%feature("autodoc", "	* Creates an indefinite circle.

	:rtype: None
") gp_Circ;
		 gp_Circ ();
		%feature("compactdefaultargs") gp_Circ;
		%feature("autodoc", "	* A2 locates the circle and gives its orientation in 3D space. Warnings : It is not forbidden to create a circle with Radius = 0.0 Raises ConstructionError if Radius < 0.0

	:param A2:
	:type A2: gp_Ax2
	:param Radius:
	:type Radius: float
	:rtype: None
") gp_Circ;
		 gp_Circ (const gp_Ax2 & A2,const Standard_Real Radius);
		%feature("compactdefaultargs") SetAxis;
		%feature("autodoc", "	* Changes the main axis of the circle. It is the axis perpendicular to the plane of the circle. Raises ConstructionError if the direction of A1 is parallel to the 'XAxis' of the circle.

	:param A1:
	:type A1: gp_Ax1
	:rtype: None
") SetAxis;
		void SetAxis (const gp_Ax1 & A1);
		%feature("compactdefaultargs") SetLocation;
		%feature("autodoc", "	* Changes the 'Location' point (center) of the circle.

	:param P:
	:type P: gp_Pnt
	:rtype: None
") SetLocation;
		void SetLocation (const gp_Pnt & P);
		%feature("compactdefaultargs") SetPosition;
		%feature("autodoc", "	* Changes the position of the circle.

	:param A2:
	:type A2: gp_Ax2
	:rtype: None
") SetPosition;
		void SetPosition (const gp_Ax2 & A2);
		%feature("compactdefaultargs") SetRadius;
		%feature("autodoc", "	* Modifies the radius of this circle. Warning. This class does not prevent the creation of a circle where Radius is null. Exceptions Standard_ConstructionError if Radius is negative.

	:param Radius:
	:type Radius: float
	:rtype: None
") SetRadius;
		void SetRadius (const Standard_Real Radius);
		%feature("compactdefaultargs") Area;
		%feature("autodoc", "	* Computes the area of the circle.

	:rtype: float
") Area;
		Standard_Real Area ();
		%feature("compactdefaultargs") Axis;
		%feature("autodoc", "	* Returns the main axis of the circle. It is the axis perpendicular to the plane of the circle, passing through the 'Location' point (center) of the circle.

	:rtype: gp_Ax1
") Axis;
		const gp_Ax1  Axis ();
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "	* Computes the circumference of the circle.

	:rtype: float
") Length;
		Standard_Real Length ();
		%feature("compactdefaultargs") Location;
		%feature("autodoc", "	* Returns the center of the circle. It is the 'Location' point of the local coordinate system of the circle

	:rtype: gp_Pnt
") Location;
		const gp_Pnt  Location ();
		%feature("compactdefaultargs") Position;
		%feature("autodoc", "	* Returns the position of the circle. It is the local coordinate system of the circle.

	:rtype: gp_Ax2
") Position;
		const gp_Ax2  Position ();
		%feature("compactdefaultargs") Radius;
		%feature("autodoc", "	* Returns the radius of this circle.

	:rtype: float
") Radius;
		Standard_Real Radius ();
		%feature("compactdefaultargs") XAxis;
		%feature("autodoc", "	* Returns the 'XAxis' of the circle. This axis is perpendicular to the axis of the conic. This axis and the 'Yaxis' define the plane of the conic.

	:rtype: gp_Ax1
") XAxis;
		gp_Ax1 XAxis ();
		%feature("compactdefaultargs") YAxis;
		%feature("autodoc", "	* Returns the 'YAxis' of the circle. This axis and the 'Xaxis' define the plane of the conic. The 'YAxis' is perpendicular to the 'Xaxis'.

	:rtype: gp_Ax1
") YAxis;
		gp_Ax1 YAxis ();
		%feature("compactdefaultargs") Distance;
		%feature("autodoc", "	* Computes the minimum of distance between the point P and any point on the circumference of the circle.

	:param P:
	:type P: gp_Pnt
	:rtype: float
") Distance;
		Standard_Real Distance (const gp_Pnt & P);
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "	* Computes the square distance between <self> and the point P.

	:param P:
	:type P: gp_Pnt
	:rtype: float
") SquareDistance;
		Standard_Real SquareDistance (const gp_Pnt & P);
		%feature("compactdefaultargs") Contains;
		%feature("autodoc", "	* Returns True if the point P is on the circumference. The distance between <self> and <P> must be lower or equal to LinearTolerance.

	:param P:
	:type P: gp_Pnt
	:param LinearTolerance:
	:type LinearTolerance: float
	:rtype: bool
") Contains;
		Standard_Boolean Contains (const gp_Pnt & P,const Standard_Real LinearTolerance);
		%feature("compactdefaultargs") Mirror;
		%feature("autodoc", "	:param P:
	:type P: gp_Pnt
	:rtype: None
") Mirror;
		void Mirror (const gp_Pnt & P);
		%feature("compactdefaultargs") Mirrored;
		%feature("autodoc", "	* Performs the symmetrical transformation of a circle with respect to the point P which is the center of the symmetry.

	:param P:
	:type P: gp_Pnt
	:rtype: gp_Circ
") Mirrored;
		gp_Circ Mirrored (const gp_Pnt & P);
		%feature("compactdefaultargs") Mirror;
		%feature("autodoc", "	:param A1:
	:type A1: gp_Ax1
	:rtype: None
") Mirror;
		void Mirror (const gp_Ax1 & A1);
		%feature("compactdefaultargs") Mirrored;
		%feature("autodoc", "	* Performs the symmetrical transformation of a circle with respect to an axis placement which is the axis of the symmetry.

	:param A1:
	:type A1: gp_Ax1
	:rtype: gp_Circ
") Mirrored;
		gp_Circ Mirrored (const gp_Ax1 & A1);
		%feature("compactdefaultargs") Mirror;
		%feature("autodoc", "	:param A2:
	:type A2: gp_Ax2
	:rtype: None
") Mirror;
		void Mirror (const gp_Ax2 & A2);
		%feature("compactdefaultargs") Mirrored;
		%feature("autodoc", "	* Performs the symmetrical transformation of a circle with respect to a plane. The axis placement A2 locates the plane of the of the symmetry : (Location, XDirection, YDirection).

	:param A2:
	:type A2: gp_Ax2
	:rtype: gp_Circ
") Mirrored;
		gp_Circ Mirrored (const gp_Ax2 & A2);
		%feature("compactdefaultargs") Rotate;
		%feature("autodoc", "	:param A1:
	:type A1: gp_Ax1
	:param Ang:
	:type Ang: float
	:rtype: None
") Rotate;
		void Rotate (const gp_Ax1 & A1,const Standard_Real Ang);
		%feature("compactdefaultargs") Rotated;
		%feature("autodoc", "	* Rotates a circle. A1 is the axis of the rotation. Ang is the angular value of the rotation in radians.

	:param A1:
	:type A1: gp_Ax1
	:param Ang:
	:type Ang: float
	:rtype: gp_Circ
") Rotated;
		gp_Circ Rotated (const gp_Ax1 & A1,const Standard_Real Ang);
		%feature("compactdefaultargs") Scale;
		%feature("autodoc", "	:param P:
	:type P: gp_Pnt
	:param S:
	:type S: float
	:rtype: None
") Scale;
		void Scale (const gp_Pnt & P,const Standard_Real S);
		%feature("compactdefaultargs") Scaled;
		%feature("autodoc", "	* Scales a circle. S is the scaling value. Warnings : If S is negative the radius stay positive but the 'XAxis' and the 'YAxis' are reversed as for an ellipse.

	:param P:
	:type P: gp_Pnt
	:param S:
	:type S: float
	:rtype: gp_Circ
") Scaled;
		gp_Circ Scaled (const gp_Pnt & P,const Standard_Real S);
		%feature("compactdefaultargs") Transform;
		%feature("autodoc", "	:param T:
	:type T: gp_Trsf
	:rtype: None
") Transform;
		void Transform (const gp_Trsf & T);
		%feature("compactdefaultargs") Transformed;
		%feature("autodoc", "	* Transforms a circle with the transformation T from class Trsf.

	:param T:
	:type T: gp_Trsf
	:rtype: gp_Circ
") Transformed;
		gp_Circ Transformed (const gp_Trsf & T);
		%feature("compactdefaultargs") Translate;
		%feature("autodoc", "	:param V:
	:type V: gp_Vec
	:rtype: None
") Translate;
		void Translate (const gp_Vec & V);
		%feature("compactdefaultargs") Translated;
		%feature("autodoc", "	* Translates a circle in the direction of the vector V. The magnitude of the translation is the vector's magnitude.

	:param V:
	:type V: gp_Vec
	:rtype: gp_Circ
") Translated;
		gp_Circ Translated (const gp_Vec & V);
		%feature("compactdefaultargs") Translate;
		%feature("autodoc", "	:param P1:
	:type P1: gp_Pnt
	:param P2:
	:type P2: gp_Pnt
	:rtype: None
") Translate;
		void Translate (const gp_Pnt & P1,const gp_Pnt & P2);
		%feature("compactdefaultargs") Translated;
		%feature("autodoc", "	* Translates a circle from the point P1 to the point P2.

	:param P1:
	:type P1: gp_Pnt
	:param P2:
	:type P2: gp_Pnt
	:rtype: gp_Circ
") Translated;
		gp_Circ Translated (const gp_Pnt & P1,const gp_Pnt & P2);
		%feature("compactdefaultargs") _CSFDB_Getgp_Circpos;
		%feature("autodoc", "	:rtype: gp_Ax2
") _CSFDB_Getgp_Circpos;
		const gp_Ax2  _CSFDB_Getgp_Circpos ();
		%feature("compactdefaultargs") _CSFDB_Getgp_Circradius;
		%feature("autodoc", "	:rtype: float
") _CSFDB_Getgp_Circradius;
		Standard_Real _CSFDB_Getgp_Circradius ();
		%feature("compactdefaultargs") _CSFDB_Setgp_Circradius;
		%feature("autodoc", "	:param p:
	:type p: float
	:rtype: None
") _CSFDB_Setgp_Circradius;
		void _CSFDB_Setgp_Circradius (const Standard_Real p);
};


%extend gp_Circ {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor gp_Circ2d;
class gp_Circ2d {
	public:
		%feature("compactdefaultargs") gp_Circ2d;
		%feature("autodoc", "	* creates an indefinite circle.

	:rtype: None
") gp_Circ2d;
		 gp_Circ2d ();
		%feature("compactdefaultargs") gp_Circ2d;
		%feature("autodoc", "	* The location point of XAxis is the center of the circle. Warnings : It is not forbidden to create a circle with Radius = 0.0 Raises ConstructionError if Radius < 0.0. Raised if Radius < 0.0.

	:param XAxis:
	:type XAxis: gp_Ax2d
	:param Radius:
	:type Radius: float
	:param Sense: default value is Standard_True
	:type Sense: bool
	:rtype: None
") gp_Circ2d;
		 gp_Circ2d (const gp_Ax2d & XAxis,const Standard_Real Radius,const Standard_Boolean Sense = Standard_True);
		%feature("compactdefaultargs") gp_Circ2d;
		%feature("autodoc", "	* Axis defines the Xaxis and Yaxis of the circle which defines the origin and the sense of parametrization. The location point of Axis is the center of the circle. Warnings : It is not forbidden to create a circle with Radius = 0.0 Raises ConstructionError if Radius < 0.0. Raised if Radius < 0.0.

	:param Axis:
	:type Axis: gp_Ax22d
	:param Radius:
	:type Radius: float
	:rtype: None
") gp_Circ2d;
		 gp_Circ2d (const gp_Ax22d & Axis,const Standard_Real Radius);
		%feature("compactdefaultargs") SetLocation;
		%feature("autodoc", "	* Changes the location point (center) of the circle.

	:param P:
	:type P: gp_Pnt2d
	:rtype: None
") SetLocation;
		void SetLocation (const gp_Pnt2d & P);
		%feature("compactdefaultargs") SetXAxis;
		%feature("autodoc", "	* Changes the X axis of the circle.

	:param A:
	:type A: gp_Ax2d
	:rtype: None
") SetXAxis;
		void SetXAxis (const gp_Ax2d & A);
		%feature("compactdefaultargs") SetAxis;
		%feature("autodoc", "	* Changes the X axis of the circle.

	:param A:
	:type A: gp_Ax22d
	:rtype: None
") SetAxis;
		void SetAxis (const gp_Ax22d & A);
		%feature("compactdefaultargs") SetYAxis;
		%feature("autodoc", "	* Changes the Y axis of the circle.

	:param A:
	:type A: gp_Ax2d
	:rtype: None
") SetYAxis;
		void SetYAxis (const gp_Ax2d & A);
		%feature("compactdefaultargs") SetRadius;
		%feature("autodoc", "	* Modifies the radius of this circle. This class does not prevent the creation of a circle where Radius is null. Exceptions Standard_ConstructionError if Radius is negative.

	:param Radius:
	:type Radius: float
	:rtype: None
") SetRadius;
		void SetRadius (const Standard_Real Radius);
		%feature("compactdefaultargs") Area;
		%feature("autodoc", "	* Computes the area of the circle.

	:rtype: float
") Area;
		Standard_Real Area ();
		%feature("compactdefaultargs") Coefficients;
		%feature("autodoc", "	* Returns the normalized coefficients from the implicit equation of the circle : A * (X**2) + B * (Y**2) + 2*C*(X*Y) + 2*D*X + 2*E*Y + F = 0.0

	:param A:
	:type A: float &
	:param B:
	:type B: float &
	:param C:
	:type C: float &
	:param D:
	:type D: float &
	:param E:
	:type E: float &
	:param F:
	:type F: float &
	:rtype: None
") Coefficients;
		void Coefficients (Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") Contains;
		%feature("autodoc", "	* Does <self> contain P ? Returns True if the distance between P and any point on the circumference of the circle is lower of equal to <LinearTolerance>.

	:param P:
	:type P: gp_Pnt2d
	:param LinearTolerance:
	:type LinearTolerance: float
	:rtype: bool
") Contains;
		Standard_Boolean Contains (const gp_Pnt2d & P,const Standard_Real LinearTolerance);
		%feature("compactdefaultargs") Distance;
		%feature("autodoc", "	* Computes the minimum of distance between the point P and any point on the circumference of the circle.

	:param P:
	:type P: gp_Pnt2d
	:rtype: float
") Distance;
		Standard_Real Distance (const gp_Pnt2d & P);
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "	* Computes the square distance between <self> and the point P.

	:param P:
	:type P: gp_Pnt2d
	:rtype: float
") SquareDistance;
		Standard_Real SquareDistance (const gp_Pnt2d & P);
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "	* computes the circumference of the circle.

	:rtype: float
") Length;
		Standard_Real Length ();
		%feature("compactdefaultargs") Location;
		%feature("autodoc", "	* Returns the location point (center) of the circle.

	:rtype: gp_Pnt2d
") Location;
		const gp_Pnt2d  Location ();
		%feature("compactdefaultargs") Radius;
		%feature("autodoc", "	* Returns the radius value of the circle.

	:rtype: float
") Radius;
		Standard_Real Radius ();
		%feature("compactdefaultargs") Axis;
		%feature("autodoc", "	* returns the position of the circle.

	:rtype: gp_Ax22d
") Axis;
		const gp_Ax22d  Axis ();
		%feature("compactdefaultargs") Position;
		%feature("autodoc", "	* returns the position of the circle. Idem Axis(me).

	:rtype: gp_Ax22d
") Position;
		const gp_Ax22d  Position ();
		%feature("compactdefaultargs") XAxis;
		%feature("autodoc", "	* returns the X axis of the circle.

	:rtype: gp_Ax2d
") XAxis;
		gp_Ax2d XAxis ();
		%feature("compactdefaultargs") YAxis;
		%feature("autodoc", "	* Returns the Y axis of the circle. Reverses the direction of the circle.

	:rtype: gp_Ax2d
") YAxis;
		gp_Ax2d YAxis ();
		%feature("compactdefaultargs") Reverse;
		%feature("autodoc", "	* Reverses the orientation of the local coordinate system of this circle (the 'Y Direction' is reversed) and therefore changes the implicit orientation of this circle. Reverse assigns the result to this circle,

	:rtype: None
") Reverse;
		void Reverse ();
		%feature("compactdefaultargs") Reversed;
		%feature("autodoc", "	* Reverses the orientation of the local coordinate system of this circle (the 'Y Direction' is reversed) and therefore changes the implicit orientation of this circle. Reversed creates a new circle.

	:rtype: gp_Circ2d
") Reversed;
		gp_Circ2d Reversed ();
		%feature("compactdefaultargs") IsDirect;
		%feature("autodoc", "	* Returns true if the local coordinate system is direct and false in the other case.

	:rtype: bool
") IsDirect;
		Standard_Boolean IsDirect ();
		%feature("compactdefaultargs") Mirror;
		%feature("autodoc", "	:param P:
	:type P: gp_Pnt2d
	:rtype: None
") Mirror;
		void Mirror (const gp_Pnt2d & P);
		%feature("compactdefaultargs") Mirrored;
		%feature("autodoc", "	* Performs the symmetrical transformation of a circle with respect to the point P which is the center of the symmetry

	:param P:
	:type P: gp_Pnt2d
	:rtype: gp_Circ2d
") Mirrored;
		gp_Circ2d Mirrored (const gp_Pnt2d & P);
		%feature("compactdefaultargs") Mirror;
		%feature("autodoc", "	:param A:
	:type A: gp_Ax2d
	:rtype: None
") Mirror;
		void Mirror (const gp_Ax2d & A);
		%feature("compactdefaultargs") Mirrored;
		%feature("autodoc", "	* Performs the symmetrical transformation of a circle with respect to an axis placement which is the axis of the symmetry.

	:param A:
	:type A: gp_Ax2d
	:rtype: gp_Circ2d
") Mirrored;
		gp_Circ2d Mirrored (const gp_Ax2d & A);
		%feature("compactdefaultargs") Rotate;
		%feature("autodoc", "	:param P:
	:type P: gp_Pnt2d
	:param Ang:
	:type Ang: float
	:rtype: None
") Rotate;
		void Rotate (const gp_Pnt2d & P,const Standard_Real Ang);
		%feature("compactdefaultargs") Rotated;
		%feature("autodoc", "	* Rotates a circle. P is the center of the rotation. Ang is the angular value of the rotation in radians.

	:param P:
	:type P: gp_Pnt2d
	:param Ang:
	:type Ang: float
	:rtype: gp_Circ2d
") Rotated;
		gp_Circ2d Rotated (const gp_Pnt2d & P,const Standard_Real Ang);
		%feature("compactdefaultargs") Scale;
		%feature("autodoc", "	:param P:
	:type P: gp_Pnt2d
	:param S:
	:type S: float
	:rtype: None
") Scale;
		void Scale (const gp_Pnt2d & P,const Standard_Real S);
		%feature("compactdefaultargs") Scaled;
		%feature("autodoc", "	* Scales a circle. S is the scaling value. Warnings : If S is negative the radius stay positive but the 'XAxis' and the 'YAxis' are reversed as for an ellipse.

	:param P:
	:type P: gp_Pnt2d
	:param S:
	:type S: float
	:rtype: gp_Circ2d
") Scaled;
		gp_Circ2d Scaled (const gp_Pnt2d & P,const Standard_Real S);
		%feature("compactdefaultargs") Transform;
		%feature("autodoc", "	:param T:
	:type T: gp_Trsf2d
	:rtype: None
") Transform;
		void Transform (const gp_Trsf2d & T);
		%feature("compactdefaultargs") Transformed;
		%feature("autodoc", "	* Transforms a circle with the transformation T from class Trsf2d.

	:param T:
	:type T: gp_Trsf2d
	:rtype: gp_Circ2d
") Transformed;
		gp_Circ2d Transformed (const gp_Trsf2d & T);
		%feature("compactdefaultargs") Translate;
		%feature("autodoc", "	:param V:
	:type V: gp_Vec2d
	:rtype: None
") Translate;
		void Translate (const gp_Vec2d & V);
		%feature("compactdefaultargs") Translated;
		%feature("autodoc", "	* Translates a circle in the direction of the vector V. The magnitude of the translation is the vector's magnitude.

	:param V:
	:type V: gp_Vec2d
	:rtype: gp_Circ2d
") Translated;
		gp_Circ2d Translated (const gp_Vec2d & V);
		%feature("compactdefaultargs") Translate;
		%feature("autodoc", "	:param P1:
	:type P1: gp_Pnt2d
	:param P2:
	:type P2: gp_Pnt2d
	:rtype: None
") Translate;
		void Translate (const gp_Pnt2d & P1,const gp_Pnt2d & P2);
		%feature("compactdefaultargs") Translated;
		%feature("autodoc", "	* Translates a circle from the point P1 to the point P2.

	:param P1:
	:type P1: gp_Pnt2d
	:param P2:
	:type P2: gp_Pnt2d
	:rtype: gp_Circ2d
") Translated;
		gp_Circ2d Translated (const gp_Pnt2d & P1,const gp_Pnt2d & P2);
		%feature("compactdefaultargs") _CSFDB_Getgp_Circ2dpos;
		%feature("autodoc", "	:rtype: gp_Ax22d
") _CSFDB_Getgp_Circ2dpos;
		const gp_Ax22d  _CSFDB_Getgp_Circ2dpos ();
		%feature("compactdefaultargs") _CSFDB_Getgp_Circ2dradius;
		%feature("autodoc", "	:rtype: float
") _CSFDB_Getgp_Circ2dradius;
		Standard_Real _CSFDB_Getgp_Circ2dradius ();
		%feature("compactdefaultargs") _CSFDB_Setgp_Circ2dradius;
		%feature("autodoc", "	:param p:
	:type p: float
	:rtype: None
") _CSFDB_Setgp_Circ2dradius;
		void _CSFDB_Setgp_Circ2dradius (const Standard_Real p);
};


%extend gp_Circ2d {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor gp_Cone;
class gp_Cone {
	public:
		%feature("compactdefaultargs") gp_Cone;
		%feature("autodoc", "	* Creates an indefinite Cone.

	:rtype: None
") gp_Cone;
		 gp_Cone ();
		%feature("compactdefaultargs") gp_Cone;
		%feature("autodoc", "	* Creates an infinite conical surface. A3 locates the cone in the space and defines the reference plane of the surface. Ang is the conical surface semi-angle between 0 and PI/2 radians. Radius is the radius of the circle in the reference plane of the cone. Raises ConstructionError . if Radius is lower than 0.0 . Ang < Resolution from gp or Ang >= (PI/2) - Resolution.

	:param A3:
	:type A3: gp_Ax3
	:param Ang:
	:type Ang: float
	:param Radius:
	:type Radius: float
	:rtype: None
") gp_Cone;
		 gp_Cone (const gp_Ax3 & A3,const Standard_Real Ang,const Standard_Real Radius);
		%feature("compactdefaultargs") SetAxis;
		%feature("autodoc", "	* Changes the symmetry axis of the cone. Raises ConstructionError the direction of A1 is parallel to the 'XDirection' of the coordinate system of the cone.

	:param A1:
	:type A1: gp_Ax1
	:rtype: None
") SetAxis;
		void SetAxis (const gp_Ax1 & A1);
		%feature("compactdefaultargs") SetLocation;
		%feature("autodoc", "	* Changes the location of the cone.

	:param Loc:
	:type Loc: gp_Pnt
	:rtype: None
") SetLocation;
		void SetLocation (const gp_Pnt & Loc);
		%feature("compactdefaultargs") SetPosition;
		%feature("autodoc", "	* Changes the local coordinate system of the cone. This coordinate system defines the reference plane of the cone.

	:param A3:
	:type A3: gp_Ax3
	:rtype: None
") SetPosition;
		void SetPosition (const gp_Ax3 & A3);
		%feature("compactdefaultargs") SetRadius;
		%feature("autodoc", "	* Changes the radius of the cone in the reference plane of the cone. Raised if R < 0.0

	:param R:
	:type R: float
	:rtype: None
") SetRadius;
		void SetRadius (const Standard_Real R);
		%feature("compactdefaultargs") SetSemiAngle;
		%feature("autodoc", "	* Changes the semi-angle of the cone. Ang is the conical surface semi-angle ]0,PI/2[. Raises ConstructionError if Ang < Resolution from gp or Ang >= PI/2 - Resolution

	:param Ang:
	:type Ang: float
	:rtype: None
") SetSemiAngle;
		void SetSemiAngle (const Standard_Real Ang);
		%feature("compactdefaultargs") Apex;
		%feature("autodoc", "	* Computes the cone's top. The Apex of the cone is on the negative side of the symmetry axis of the cone.

	:rtype: gp_Pnt
") Apex;
		gp_Pnt Apex ();
		%feature("compactdefaultargs") UReverse;
		%feature("autodoc", "	* Reverses the U parametrization of the cone reversing the YAxis.

	:rtype: None
") UReverse;
		void UReverse ();
		%feature("compactdefaultargs") VReverse;
		%feature("autodoc", "	* Reverses the V parametrization of the cone reversing the ZAxis.

	:rtype: None
") VReverse;
		void VReverse ();
		%feature("compactdefaultargs") Direct;
		%feature("autodoc", "	* Returns true if the local coordinate system of this cone is right-handed.

	:rtype: bool
") Direct;
		Standard_Boolean Direct ();
		%feature("compactdefaultargs") Axis;
		%feature("autodoc", "	* returns the symmetry axis of the cone.

	:rtype: gp_Ax1
") Axis;
		const gp_Ax1  Axis ();
		%feature("compactdefaultargs") Coefficients;
		%feature("autodoc", "	* Computes the coefficients of the implicit equation of the quadric in the absolute cartesian coordinates system : A1.X**2 + A2.Y**2 + A3.Z**2 + 2.(B1.X.Y + B2.X.Z + B3.Y.Z) + 2.(C1.X + C2.Y + C3.Z) + D = 0.0

	:param A1:
	:type A1: float &
	:param A2:
	:type A2: float &
	:param A3:
	:type A3: float &
	:param B1:
	:type B1: float &
	:param B2:
	:type B2: float &
	:param B3:
	:type B3: float &
	:param C1:
	:type C1: float &
	:param C2:
	:type C2: float &
	:param C3:
	:type C3: float &
	:param D:
	:type D: float &
	:rtype: None
") Coefficients;
		void Coefficients (Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") Location;
		%feature("autodoc", "	* returns the 'Location' point of the cone.

	:rtype: gp_Pnt
") Location;
		const gp_Pnt  Location ();
		%feature("compactdefaultargs") Position;
		%feature("autodoc", "	* Returns the local coordinates system of the cone.

	:rtype: gp_Ax3
") Position;
		const gp_Ax3  Position ();
		%feature("compactdefaultargs") RefRadius;
		%feature("autodoc", "	* Returns the radius of the cone in the reference plane.

	:rtype: float
") RefRadius;
		Standard_Real RefRadius ();
		%feature("compactdefaultargs") SemiAngle;
		%feature("autodoc", "	* Returns the half-angle at the apex of this cone.

	:rtype: float
") SemiAngle;
		Standard_Real SemiAngle ();
		%feature("compactdefaultargs") XAxis;
		%feature("autodoc", "	* Returns the XAxis of the reference plane.

	:rtype: gp_Ax1
") XAxis;
		gp_Ax1 XAxis ();
		%feature("compactdefaultargs") YAxis;
		%feature("autodoc", "	* Returns the YAxis of the reference plane.

	:rtype: gp_Ax1
") YAxis;
		gp_Ax1 YAxis ();
		%feature("compactdefaultargs") Mirror;
		%feature("autodoc", "	:param P:
	:type P: gp_Pnt
	:rtype: None
") Mirror;
		void Mirror (const gp_Pnt & P);
		%feature("compactdefaultargs") Mirrored;
		%feature("autodoc", "	* Performs the symmetrical transformation of a cone with respect to the point P which is the center of the symmetry.

	:param P:
	:type P: gp_Pnt
	:rtype: gp_Cone
") Mirrored;
		gp_Cone Mirrored (const gp_Pnt & P);
		%feature("compactdefaultargs") Mirror;
		%feature("autodoc", "	:param A1:
	:type A1: gp_Ax1
	:rtype: None
") Mirror;
		void Mirror (const gp_Ax1 & A1);
		%feature("compactdefaultargs") Mirrored;
		%feature("autodoc", "	* Performs the symmetrical transformation of a cone with respect to an axis placement which is the axis of the symmetry.

	:param A1:
	:type A1: gp_Ax1
	:rtype: gp_Cone
") Mirrored;
		gp_Cone Mirrored (const gp_Ax1 & A1);
		%feature("compactdefaultargs") Mirror;
		%feature("autodoc", "	:param A2:
	:type A2: gp_Ax2
	:rtype: None
") Mirror;
		void Mirror (const gp_Ax2 & A2);
		%feature("compactdefaultargs") Mirrored;
		%feature("autodoc", "	* Performs the symmetrical transformation of a cone with respect to a plane. The axis placement A2 locates the plane of the of the symmetry : (Location, XDirection, YDirection).

	:param A2:
	:type A2: gp_Ax2
	:rtype: gp_Cone
") Mirrored;
		gp_Cone Mirrored (const gp_Ax2 & A2);
		%feature("compactdefaultargs") Rotate;
		%feature("autodoc", "	:param A1:
	:type A1: gp_Ax1
	:param Ang:
	:type Ang: float
	:rtype: None
") Rotate;
		void Rotate (const gp_Ax1 & A1,const Standard_Real Ang);
		%feature("compactdefaultargs") Rotated;
		%feature("autodoc", "	* Rotates a cone. A1 is the axis of the rotation. Ang is the angular value of the rotation in radians.

	:param A1:
	:type A1: gp_Ax1
	:param Ang:
	:type Ang: float
	:rtype: gp_Cone
") Rotated;
		gp_Cone Rotated (const gp_Ax1 & A1,const Standard_Real Ang);
		%feature("compactdefaultargs") Scale;
		%feature("autodoc", "	:param P:
	:type P: gp_Pnt
	:param S:
	:type S: float
	:rtype: None
") Scale;
		void Scale (const gp_Pnt & P,const Standard_Real S);
		%feature("compactdefaultargs") Scaled;
		%feature("autodoc", "	* Scales a cone. S is the scaling value. The absolute value of S is used to scale the cone

	:param P:
	:type P: gp_Pnt
	:param S:
	:type S: float
	:rtype: gp_Cone
") Scaled;
		gp_Cone Scaled (const gp_Pnt & P,const Standard_Real S);
		%feature("compactdefaultargs") Transform;
		%feature("autodoc", "	:param T:
	:type T: gp_Trsf
	:rtype: None
") Transform;
		void Transform (const gp_Trsf & T);
		%feature("compactdefaultargs") Transformed;
		%feature("autodoc", "	* Transforms a cone with the transformation T from class Trsf.

	:param T:
	:type T: gp_Trsf
	:rtype: gp_Cone
") Transformed;
		gp_Cone Transformed (const gp_Trsf & T);
		%feature("compactdefaultargs") Translate;
		%feature("autodoc", "	:param V:
	:type V: gp_Vec
	:rtype: None
") Translate;
		void Translate (const gp_Vec & V);
		%feature("compactdefaultargs") Translated;
		%feature("autodoc", "	* Translates a cone in the direction of the vector V. The magnitude of the translation is the vector's magnitude.

	:param V:
	:type V: gp_Vec
	:rtype: gp_Cone
") Translated;
		gp_Cone Translated (const gp_Vec & V);
		%feature("compactdefaultargs") Translate;
		%feature("autodoc", "	:param P1:
	:type P1: gp_Pnt
	:param P2:
	:type P2: gp_Pnt
	:rtype: None
") Translate;
		void Translate (const gp_Pnt & P1,const gp_Pnt & P2);
		%feature("compactdefaultargs") Translated;
		%feature("autodoc", "	* Translates a cone from the point P1 to the point P2.

	:param P1:
	:type P1: gp_Pnt
	:param P2:
	:type P2: gp_Pnt
	:rtype: gp_Cone
") Translated;
		gp_Cone Translated (const gp_Pnt & P1,const gp_Pnt & P2);
		%feature("compactdefaultargs") _CSFDB_Getgp_Conepos;
		%feature("autodoc", "	:rtype: gp_Ax3
") _CSFDB_Getgp_Conepos;
		const gp_Ax3  _CSFDB_Getgp_Conepos ();
		%feature("compactdefaultargs") _CSFDB_Getgp_Coneradius;
		%feature("autodoc", "	:rtype: float
") _CSFDB_Getgp_Coneradius;
		Standard_Real _CSFDB_Getgp_Coneradius ();
		%feature("compactdefaultargs") _CSFDB_Setgp_Coneradius;
		%feature("autodoc", "	:param p:
	:type p: float
	:rtype: None
") _CSFDB_Setgp_Coneradius;
		void _CSFDB_Setgp_Coneradius (const Standard_Real p);
		%feature("compactdefaultargs") _CSFDB_Getgp_ConesemiAngle;
		%feature("autodoc", "	:rtype: float
") _CSFDB_Getgp_ConesemiAngle;
		Standard_Real _CSFDB_Getgp_ConesemiAngle ();
		%feature("compactdefaultargs") _CSFDB_Setgp_ConesemiAngle;
		%feature("autodoc", "	:param p:
	:type p: float
	:rtype: None
") _CSFDB_Setgp_ConesemiAngle;
		void _CSFDB_Setgp_ConesemiAngle (const Standard_Real p);
};


%extend gp_Cone {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor gp_Cylinder;
class gp_Cylinder {
	public:
		%feature("compactdefaultargs") gp_Cylinder;
		%feature("autodoc", "	* Creates a indefinite cylinder.

	:rtype: None
") gp_Cylinder;
		 gp_Cylinder ();
		%feature("compactdefaultargs") gp_Cylinder;
		%feature("autodoc", "	* Creates a cylinder of radius Radius, whose axis is the 'main Axis' of A3. A3 is the local coordinate system of the cylinder. Raises ConstructionErrord if R < 0.0

	:param A3:
	:type A3: gp_Ax3
	:param Radius:
	:type Radius: float
	:rtype: None
") gp_Cylinder;
		 gp_Cylinder (const gp_Ax3 & A3,const Standard_Real Radius);
		%feature("compactdefaultargs") SetAxis;
		%feature("autodoc", "	* Changes the symmetry axis of the cylinder. Raises ConstructionError if the direction of A1 is parallel to the 'XDirection' of the coordinate system of the cylinder.

	:param A1:
	:type A1: gp_Ax1
	:rtype: None
") SetAxis;
		void SetAxis (const gp_Ax1 & A1);
		%feature("compactdefaultargs") SetLocation;
		%feature("autodoc", "	* Changes the location of the surface.

	:param Loc:
	:type Loc: gp_Pnt
	:rtype: None
") SetLocation;
		void SetLocation (const gp_Pnt & Loc);
		%feature("compactdefaultargs") SetPosition;
		%feature("autodoc", "	* Change the local coordinate system of the surface.

	:param A3:
	:type A3: gp_Ax3
	:rtype: None
") SetPosition;
		void SetPosition (const gp_Ax3 & A3);
		%feature("compactdefaultargs") SetRadius;
		%feature("autodoc", "	* Modifies the radius of this cylinder. Exceptions Standard_ConstructionError if R is negative.

	:param R:
	:type R: float
	:rtype: None
") SetRadius;
		void SetRadius (const Standard_Real R);
		%feature("compactdefaultargs") UReverse;
		%feature("autodoc", "	* Reverses the U parametrization of the cylinder reversing the YAxis.

	:rtype: None
") UReverse;
		void UReverse ();
		%feature("compactdefaultargs") VReverse;
		%feature("autodoc", "	* Reverses the V parametrization of the plane reversing the Axis.

	:rtype: None
") VReverse;
		void VReverse ();
		%feature("compactdefaultargs") Direct;
		%feature("autodoc", "	* Returns true if the local coordinate system of this cylinder is right-handed.

	:rtype: bool
") Direct;
		Standard_Boolean Direct ();
		%feature("compactdefaultargs") Axis;
		%feature("autodoc", "	* Returns the symmetry axis of the cylinder.

	:rtype: gp_Ax1
") Axis;
		const gp_Ax1  Axis ();
		%feature("compactdefaultargs") Coefficients;
		%feature("autodoc", "	* Computes the coefficients of the implicit equation of the quadric in the absolute cartesian coordinate system : A1.X**2 + A2.Y**2 + A3.Z**2 + 2.(B1.X.Y + B2.X.Z + B3.Y.Z) + 2.(C1.X + C2.Y + C3.Z) + D = 0.0

	:param A1:
	:type A1: float &
	:param A2:
	:type A2: float &
	:param A3:
	:type A3: float &
	:param B1:
	:type B1: float &
	:param B2:
	:type B2: float &
	:param B3:
	:type B3: float &
	:param C1:
	:type C1: float &
	:param C2:
	:type C2: float &
	:param C3:
	:type C3: float &
	:param D:
	:type D: float &
	:rtype: None
") Coefficients;
		void Coefficients (Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") Location;
		%feature("autodoc", "	* Returns the 'Location' point of the cylinder.

	:rtype: gp_Pnt
") Location;
		const gp_Pnt  Location ();
		%feature("compactdefaultargs") Position;
		%feature("autodoc", "	* Returns the local coordinate system of the cylinder.

	:rtype: gp_Ax3
") Position;
		const gp_Ax3  Position ();
		%feature("compactdefaultargs") Radius;
		%feature("autodoc", "	* Returns the radius of the cylinder.

	:rtype: float
") Radius;
		Standard_Real Radius ();
		%feature("compactdefaultargs") XAxis;
		%feature("autodoc", "	* Returns the axis X of the cylinder.

	:rtype: gp_Ax1
") XAxis;
		gp_Ax1 XAxis ();
		%feature("compactdefaultargs") YAxis;
		%feature("autodoc", "	* Returns the axis Y of the cylinder.

	:rtype: gp_Ax1
") YAxis;
		gp_Ax1 YAxis ();
		%feature("compactdefaultargs") Mirror;
		%feature("autodoc", "	:param P:
	:type P: gp_Pnt
	:rtype: None
") Mirror;
		void Mirror (const gp_Pnt & P);
		%feature("compactdefaultargs") Mirrored;
		%feature("autodoc", "	* Performs the symmetrical transformation of a cylinder with respect to the point P which is the center of the symmetry.

	:param P:
	:type P: gp_Pnt
	:rtype: gp_Cylinder
") Mirrored;
		gp_Cylinder Mirrored (const gp_Pnt & P);
		%feature("compactdefaultargs") Mirror;
		%feature("autodoc", "	:param A1:
	:type A1: gp_Ax1
	:rtype: None
") Mirror;
		void Mirror (const gp_Ax1 & A1);
		%feature("compactdefaultargs") Mirrored;
		%feature("autodoc", "	* Performs the symmetrical transformation of a cylinder with respect to an axis placement which is the axis of the symmetry.

	:param A1:
	:type A1: gp_Ax1
	:rtype: gp_Cylinder
") Mirrored;
		gp_Cylinder Mirrored (const gp_Ax1 & A1);
		%feature("compactdefaultargs") Mirror;
		%feature("autodoc", "	:param A2:
	:type A2: gp_Ax2
	:rtype: None
") Mirror;
		void Mirror (const gp_Ax2 & A2);
		%feature("compactdefaultargs") Mirrored;
		%feature("autodoc", "	* Performs the symmetrical transformation of a cylinder with respect to a plane. The axis placement A2 locates the plane of the of the symmetry : (Location, XDirection, YDirection).

	:param A2:
	:type A2: gp_Ax2
	:rtype: gp_Cylinder
") Mirrored;
		gp_Cylinder Mirrored (const gp_Ax2 & A2);
		%feature("compactdefaultargs") Rotate;
		%feature("autodoc", "	:param A1:
	:type A1: gp_Ax1
	:param Ang:
	:type Ang: float
	:rtype: None
") Rotate;
		void Rotate (const gp_Ax1 & A1,const Standard_Real Ang);
		%feature("compactdefaultargs") Rotated;
		%feature("autodoc", "	* Rotates a cylinder. A1 is the axis of the rotation. Ang is the angular value of the rotation in radians.

	:param A1:
	:type A1: gp_Ax1
	:param Ang:
	:type Ang: float
	:rtype: gp_Cylinder
") Rotated;
		gp_Cylinder Rotated (const gp_Ax1 & A1,const Standard_Real Ang);
		%feature("compactdefaultargs") Scale;
		%feature("autodoc", "	:param P:
	:type P: gp_Pnt
	:param S:
	:type S: float
	:rtype: None
") Scale;
		void Scale (const gp_Pnt & P,const Standard_Real S);
		%feature("compactdefaultargs") Scaled;
		%feature("autodoc", "	* Scales a cylinder. S is the scaling value. The absolute value of S is used to scale the cylinder

	:param P:
	:type P: gp_Pnt
	:param S:
	:type S: float
	:rtype: gp_Cylinder
") Scaled;
		gp_Cylinder Scaled (const gp_Pnt & P,const Standard_Real S);
		%feature("compactdefaultargs") Transform;
		%feature("autodoc", "	:param T:
	:type T: gp_Trsf
	:rtype: None
") Transform;
		void Transform (const gp_Trsf & T);
		%feature("compactdefaultargs") Transformed;
		%feature("autodoc", "	* Transforms a cylinder with the transformation T from class Trsf.

	:param T:
	:type T: gp_Trsf
	:rtype: gp_Cylinder
") Transformed;
		gp_Cylinder Transformed (const gp_Trsf & T);
		%feature("compactdefaultargs") Translate;
		%feature("autodoc", "	:param V:
	:type V: gp_Vec
	:rtype: None
") Translate;
		void Translate (const gp_Vec & V);
		%feature("compactdefaultargs") Translated;
		%feature("autodoc", "	* Translates a cylinder in the direction of the vector V. The magnitude of the translation is the vector's magnitude.

	:param V:
	:type V: gp_Vec
	:rtype: gp_Cylinder
") Translated;
		gp_Cylinder Translated (const gp_Vec & V);
		%feature("compactdefaultargs") Translate;
		%feature("autodoc", "	:param P1:
	:type P1: gp_Pnt
	:param P2:
	:type P2: gp_Pnt
	:rtype: None
") Translate;
		void Translate (const gp_Pnt & P1,const gp_Pnt & P2);
		%feature("compactdefaultargs") Translated;
		%feature("autodoc", "	* Translates a cylinder from the point P1 to the point P2.

	:param P1:
	:type P1: gp_Pnt
	:param P2:
	:type P2: gp_Pnt
	:rtype: gp_Cylinder
") Translated;
		gp_Cylinder Translated (const gp_Pnt & P1,const gp_Pnt & P2);
		%feature("compactdefaultargs") _CSFDB_Getgp_Cylinderpos;
		%feature("autodoc", "	:rtype: gp_Ax3
") _CSFDB_Getgp_Cylinderpos;
		const gp_Ax3  _CSFDB_Getgp_Cylinderpos ();
		%feature("compactdefaultargs") _CSFDB_Getgp_Cylinderradius;
		%feature("autodoc", "	:rtype: float
") _CSFDB_Getgp_Cylinderradius;
		Standard_Real _CSFDB_Getgp_Cylinderradius ();
		%feature("compactdefaultargs") _CSFDB_Setgp_Cylinderradius;
		%feature("autodoc", "	:param p:
	:type p: float
	:rtype: None
") _CSFDB_Setgp_Cylinderradius;
		void _CSFDB_Setgp_Cylinderradius (const Standard_Real p);
};


%extend gp_Cylinder {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor gp_Dir;
class gp_Dir {
	public:
		%feature("compactdefaultargs") gp_Dir;
		%feature("autodoc", "	* Creates a direction corresponding to X axis.

	:rtype: None
") gp_Dir;
		 gp_Dir ();
		%feature("compactdefaultargs") gp_Dir;
		%feature("autodoc", "	* Normalizes the vector V and creates a direction. Raises ConstructionError if V.Magnitude() <= Resolution.

	:param V:
	:type V: gp_Vec
	:rtype: None
") gp_Dir;
		 gp_Dir (const gp_Vec & V);
		%feature("compactdefaultargs") gp_Dir;
		%feature("autodoc", "	* Creates a direction from a triplet of coordinates. Raises ConstructionError if Coord.Modulus() <= Resolution from gp.

	:param Coord:
	:type Coord: gp_XYZ
	:rtype: None
") gp_Dir;
		 gp_Dir (const gp_XYZ & Coord);
		%feature("compactdefaultargs") gp_Dir;
		%feature("autodoc", "	* Creates a direction with its 3 cartesian coordinates. Raises ConstructionError if Sqrt(Xv*Xv + Yv*Yv + Zv*Zv) <= Resolution Modification of the direction's coordinates If Sqrt (X*X + Y*Y + Z*Z) <= Resolution from gp where X, Y ,Z are the new coordinates it is not possible to construct the direction and the method raises the exception ConstructionError.

	:param Xv:
	:type Xv: float
	:param Yv:
	:type Yv: float
	:param Zv:
	:type Zv: float
	:rtype: None
") gp_Dir;
		 gp_Dir (const Standard_Real Xv,const Standard_Real Yv,const Standard_Real Zv);
		%feature("compactdefaultargs") SetCoord;
		%feature("autodoc", "	* For this unit vector, assigns the value Xi to: - the X coordinate if Index is 1, or - the Y coordinate if Index is 2, or - the Z coordinate if Index is 3, and then normalizes it. Warning Remember that all the coordinates of a unit vector are implicitly modified when any single one is changed directly. Exceptions Standard_OutOfRange if Index is not 1, 2, or 3. Standard_ConstructionError if either of the following is less than or equal to gp::Resolution(): - Sqrt(Xv*Xv + Yv*Yv + Zv*Zv), or - the modulus of the number triple formed by the new value Xi and the two other coordinates of this vector that were not directly modified.

	:param Index:
	:type Index: int
	:param Xi:
	:type Xi: float
	:rtype: None
") SetCoord;
		void SetCoord (const Standard_Integer Index,const Standard_Real Xi);
		%feature("compactdefaultargs") SetCoord;
		%feature("autodoc", "	* For this unit vector, assigns the values Xv, Yv and Zv to its three coordinates. Remember that all the coordinates of a unit vector are implicitly modified when any single one is changed directly.

	:param Xv:
	:type Xv: float
	:param Yv:
	:type Yv: float
	:param Zv:
	:type Zv: float
	:rtype: None
") SetCoord;
		void SetCoord (const Standard_Real Xv,const Standard_Real Yv,const Standard_Real Zv);
		%feature("compactdefaultargs") SetX;
		%feature("autodoc", "	* Assigns the given value to the X coordinate of this unit vector.

	:param X:
	:type X: float
	:rtype: None
") SetX;
		void SetX (const Standard_Real X);
		%feature("compactdefaultargs") SetY;
		%feature("autodoc", "	* Assigns the given value to the Y coordinate of this unit vector.

	:param Y:
	:type Y: float
	:rtype: None
") SetY;
		void SetY (const Standard_Real Y);
		%feature("compactdefaultargs") SetZ;
		%feature("autodoc", "	* Assigns the given value to the Z coordinate of this unit vector.

	:param Z:
	:type Z: float
	:rtype: None
") SetZ;
		void SetZ (const Standard_Real Z);
		%feature("compactdefaultargs") SetXYZ;
		%feature("autodoc", "	* Assigns the three coordinates of Coord to this unit vector.

	:param Coord:
	:type Coord: gp_XYZ
	:rtype: None
") SetXYZ;
		void SetXYZ (const gp_XYZ & Coord);
		%feature("compactdefaultargs") Coord;
		%feature("autodoc", "	* Returns the coordinate of range Index : Index = 1 => X is returned Index = 2 => Y is returned Index = 3 => Z is returned Exceptions Standard_OutOfRange if Index is not 1, 2, or 3.

	:param Index:
	:type Index: int
	:rtype: float
") Coord;
		Standard_Real Coord (const Standard_Integer Index);
		%feature("compactdefaultargs") Coord;
		%feature("autodoc", "	* Returns for the unit vector its three coordinates Xv, Yv, and Zv.

	:param Xv:
	:type Xv: float &
	:param Yv:
	:type Yv: float &
	:param Zv:
	:type Zv: float &
	:rtype: None
") Coord;
		void Coord (Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") X;
		%feature("autodoc", "	* Returns the X coordinate for a unit vector.

	:rtype: float
") X;
		Standard_Real X ();
		%feature("compactdefaultargs") Y;
		%feature("autodoc", "	* Returns the Y coordinate for a unit vector.

	:rtype: float
") Y;
		Standard_Real Y ();
		%feature("compactdefaultargs") Z;
		%feature("autodoc", "	* Returns the Z coordinate for a unit vector.

	:rtype: float
") Z;
		Standard_Real Z ();
		%feature("compactdefaultargs") XYZ;
		%feature("autodoc", "	* for this unit vector, returns its three coordinates as a number triplea.

	:rtype: gp_XYZ
") XYZ;
		const gp_XYZ  XYZ ();
		%feature("compactdefaultargs") IsEqual;
		%feature("autodoc", "	* Returns True if the angle between the two directions is lower or equal to AngularTolerance.

	:param Other:
	:type Other: gp_Dir
	:param AngularTolerance:
	:type AngularTolerance: float
	:rtype: bool
") IsEqual;
		Standard_Boolean IsEqual (const gp_Dir & Other,const Standard_Real AngularTolerance);
		%feature("compactdefaultargs") IsNormal;
		%feature("autodoc", "	* Returns True if the angle between this unit vector and the unit vector Other is equal to Pi/2 (normal).

	:param Other:
	:type Other: gp_Dir
	:param AngularTolerance:
	:type AngularTolerance: float
	:rtype: bool
") IsNormal;
		Standard_Boolean IsNormal (const gp_Dir & Other,const Standard_Real AngularTolerance);
		%feature("compactdefaultargs") IsOpposite;
		%feature("autodoc", "	* Returns True if the angle between this unit vector and the unit vector Other is equal to Pi (opposite).

	:param Other:
	:type Other: gp_Dir
	:param AngularTolerance:
	:type AngularTolerance: float
	:rtype: bool
") IsOpposite;
		Standard_Boolean IsOpposite (const gp_Dir & Other,const Standard_Real AngularTolerance);
		%feature("compactdefaultargs") IsParallel;
		%feature("autodoc", "	* Returns true if the angle between this unit vector and the unit vector Other is equal to 0 or to Pi. Note: the tolerance criterion is given by AngularTolerance.

	:param Other:
	:type Other: gp_Dir
	:param AngularTolerance:
	:type AngularTolerance: float
	:rtype: bool
") IsParallel;
		Standard_Boolean IsParallel (const gp_Dir & Other,const Standard_Real AngularTolerance);
		%feature("compactdefaultargs") Angle;
		%feature("autodoc", "	* Computes the angular value in radians between <self> and <Other>. This value is always positive in 3D space. Returns the angle in the range [0, PI]

	:param Other:
	:type Other: gp_Dir
	:rtype: float
") Angle;
		Standard_Real Angle (const gp_Dir & Other);
		%feature("compactdefaultargs") AngleWithRef;
		%feature("autodoc", "	* Computes the angular value between <self> and <Other>. <VRef> is the direction of reference normal to <self> and <Other> and its orientation gives the positive sense of rotation. If the cross product <self> ^ <Other> has the same orientation as <VRef> the angular value is positive else negative. Returns the angular value in the range -PI and PI (in radians). Raises DomainError if <self> and <Other> are not parallel this exception is raised when <VRef> is in the same plane as <self> and <Other> The tolerance criterion is Resolution from package gp.

	:param Other:
	:type Other: gp_Dir
	:param VRef:
	:type VRef: gp_Dir
	:rtype: float
") AngleWithRef;
		Standard_Real AngleWithRef (const gp_Dir & Other,const gp_Dir & VRef);
		%feature("compactdefaultargs") Cross;
		%feature("autodoc", "	* Computes the cross product between two directions Raises the exception ConstructionError if the two directions are parallel because the computed vector cannot be normalized to create a direction.

	:param Right:
	:type Right: gp_Dir
	:rtype: None
") Cross;
		void Cross (const gp_Dir & Right);
		%feature("compactdefaultargs") operator ^=;
		%feature("autodoc", "	:param Right:
	:type Right: gp_Dir
	:rtype: None
") operator ^=;
		void operator ^= (const gp_Dir & Right);
		%feature("compactdefaultargs") Crossed;
		%feature("autodoc", "	* Computes the triple vector product. <self> ^ (V1 ^ V2) Raises the exception ConstructionError if V1 and V2 are parallel or <self> and (V1^V2) are parallel because the computed vector can't be normalized to create a direction.

	:param Right:
	:type Right: gp_Dir
	:rtype: gp_Dir
") Crossed;
		gp_Dir Crossed (const gp_Dir & Right);
		%feature("compactdefaultargs") operator ^;
		%feature("autodoc", "	:param Right:
	:type Right: gp_Dir
	:rtype: gp_Dir
") operator ^;
		gp_Dir operator ^ (const gp_Dir & Right);
		%feature("compactdefaultargs") CrossCross;
		%feature("autodoc", "	:param V1:
	:type V1: gp_Dir
	:param V2:
	:type V2: gp_Dir
	:rtype: None
") CrossCross;
		void CrossCross (const gp_Dir & V1,const gp_Dir & V2);
		%feature("compactdefaultargs") CrossCrossed;
		%feature("autodoc", "	* Computes the double vector product this ^ (V1 ^ V2). - CrossCrossed creates a new unit vector. Exceptions Standard_ConstructionError if: - V1 and V2 are parallel, or - this unit vector and (V1 ^ V2) are parallel. This is because, in these conditions, the computed vector is null and cannot be normalized.

	:param V1:
	:type V1: gp_Dir
	:param V2:
	:type V2: gp_Dir
	:rtype: gp_Dir
") CrossCrossed;
		gp_Dir CrossCrossed (const gp_Dir & V1,const gp_Dir & V2);
		%feature("compactdefaultargs") Dot;
		%feature("autodoc", "	* Computes the scalar product

	:param Other:
	:type Other: gp_Dir
	:rtype: float
") Dot;
		Standard_Real Dot (const gp_Dir & Other);
		%feature("compactdefaultargs") operator *;
		%feature("autodoc", "	:param Other:
	:type Other: gp_Dir
	:rtype: float
") operator *;
		Standard_Real operator * (const gp_Dir & Other);
		%feature("compactdefaultargs") DotCross;
		%feature("autodoc", "	* Computes the triple scalar product <self> * (V1 ^ V2). Warnings : The computed vector V1' = V1 ^ V2 is not normalized to create a unitary vector. So this method never raises an exception even if V1 and V2 are parallel.

	:param V1:
	:type V1: gp_Dir
	:param V2:
	:type V2: gp_Dir
	:rtype: float
") DotCross;
		Standard_Real DotCross (const gp_Dir & V1,const gp_Dir & V2);
		%feature("compactdefaultargs") Reverse;
		%feature("autodoc", "	:rtype: None
") Reverse;
		void Reverse ();
		%feature("compactdefaultargs") Reversed;
		%feature("autodoc", "	* Reverses the orientation of a direction geometric transformations Performs the symmetrical transformation of a direction with respect to the direction V which is the center of the symmetry.]

	:rtype: gp_Dir
") Reversed;
		gp_Dir Reversed ();
		%feature("compactdefaultargs") operator -;
		%feature("autodoc", "	:rtype: gp_Dir
") operator -;
		gp_Dir operator - ();
		%feature("compactdefaultargs") Mirror;
		%feature("autodoc", "	:param V:
	:type V: gp_Dir
	:rtype: None
") Mirror;
		void Mirror (const gp_Dir & V);
		%feature("compactdefaultargs") Mirrored;
		%feature("autodoc", "	* Performs the symmetrical transformation of a direction with respect to the direction V which is the center of the symmetry.

	:param V:
	:type V: gp_Dir
	:rtype: gp_Dir
") Mirrored;
		gp_Dir Mirrored (const gp_Dir & V);
		%feature("compactdefaultargs") Mirror;
		%feature("autodoc", "	:param A1:
	:type A1: gp_Ax1
	:rtype: None
") Mirror;
		void Mirror (const gp_Ax1 & A1);
		%feature("compactdefaultargs") Mirrored;
		%feature("autodoc", "	* Performs the symmetrical transformation of a direction with respect to an axis placement which is the axis of the symmetry.

	:param A1:
	:type A1: gp_Ax1
	:rtype: gp_Dir
") Mirrored;
		gp_Dir Mirrored (const gp_Ax1 & A1);
		%feature("compactdefaultargs") Mirror;
		%feature("autodoc", "	:param A2:
	:type A2: gp_Ax2
	:rtype: None
") Mirror;
		void Mirror (const gp_Ax2 & A2);
		%feature("compactdefaultargs") Mirrored;
		%feature("autodoc", "	* Performs the symmetrical transformation of a direction with respect to a plane. The axis placement A2 locates the plane of the symmetry : (Location, XDirection, YDirection).

	:param A2:
	:type A2: gp_Ax2
	:rtype: gp_Dir
") Mirrored;
		gp_Dir Mirrored (const gp_Ax2 & A2);
		%feature("compactdefaultargs") Rotate;
		%feature("autodoc", "	:param A1:
	:type A1: gp_Ax1
	:param Ang:
	:type Ang: float
	:rtype: None
") Rotate;
		void Rotate (const gp_Ax1 & A1,const Standard_Real Ang);
		%feature("compactdefaultargs") Rotated;
		%feature("autodoc", "	* Rotates a direction. A1 is the axis of the rotation. Ang is the angular value of the rotation in radians.

	:param A1:
	:type A1: gp_Ax1
	:param Ang:
	:type Ang: float
	:rtype: gp_Dir
") Rotated;
		gp_Dir Rotated (const gp_Ax1 & A1,const Standard_Real Ang);
		%feature("compactdefaultargs") Transform;
		%feature("autodoc", "	:param T:
	:type T: gp_Trsf
	:rtype: None
") Transform;
		void Transform (const gp_Trsf & T);
		%feature("compactdefaultargs") Transformed;
		%feature("autodoc", "	* Transforms a direction with a 'Trsf' from gp. Warnings : If the scale factor of the 'Trsf' T is negative then the direction <self> is reversed.

	:param T:
	:type T: gp_Trsf
	:rtype: gp_Dir
") Transformed;
		gp_Dir Transformed (const gp_Trsf & T);
		%feature("compactdefaultargs") _CSFDB_Getgp_Dircoord;
		%feature("autodoc", "	:rtype: gp_XYZ
") _CSFDB_Getgp_Dircoord;
		const gp_XYZ  _CSFDB_Getgp_Dircoord ();
};


%extend gp_Dir {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor gp_Dir2d;
class gp_Dir2d {
	public:
		%feature("compactdefaultargs") gp_Dir2d;
		%feature("autodoc", "	* Creates a direction corresponding to X axis.

	:rtype: None
") gp_Dir2d;
		 gp_Dir2d ();
		%feature("compactdefaultargs") gp_Dir2d;
		%feature("autodoc", "	* Normalizes the vector V and creates a Direction. Raises ConstructionError if V.Magnitude() <= Resolution from gp.

	:param V:
	:type V: gp_Vec2d
	:rtype: None
") gp_Dir2d;
		 gp_Dir2d (const gp_Vec2d & V);
		%feature("compactdefaultargs") gp_Dir2d;
		%feature("autodoc", "	* Creates a Direction from a doublet of coordinates. Raises ConstructionError if Coord.Modulus() <= Resolution from gp.

	:param Coord:
	:type Coord: gp_XY
	:rtype: None
") gp_Dir2d;
		 gp_Dir2d (const gp_XY & Coord);
		%feature("compactdefaultargs") gp_Dir2d;
		%feature("autodoc", "	* Creates a Direction with its 2 cartesian coordinates. Raises ConstructionError if Sqrt(Xv*Xv + Yv*Yv) <= Resolution from gp.

	:param Xv:
	:type Xv: float
	:param Yv:
	:type Yv: float
	:rtype: None
") gp_Dir2d;
		 gp_Dir2d (const Standard_Real Xv,const Standard_Real Yv);
		%feature("compactdefaultargs") SetCoord;
		%feature("autodoc", "	* For this unit vector, assigns: the value Xi to: - the X coordinate if Index is 1, or - the Y coordinate if Index is 2, and then normalizes it. Warning Remember that all the coordinates of a unit vector are implicitly modified when any single one is changed directly. Exceptions Standard_OutOfRange if Index is not 1 or 2. Standard_ConstructionError if either of the following is less than or equal to gp::Resolution(): - Sqrt(Xv*Xv + Yv*Yv), or - the modulus of the number pair formed by the new value Xi and the other coordinate of this vector that was not directly modified. Raises OutOfRange if Index != {1, 2}.

	:param Index:
	:type Index: int
	:param Xi:
	:type Xi: float
	:rtype: None
") SetCoord;
		void SetCoord (const Standard_Integer Index,const Standard_Real Xi);
		%feature("compactdefaultargs") SetCoord;
		%feature("autodoc", "	* For this unit vector, assigns: - the values Xv and Yv to its two coordinates, Warning Remember that all the coordinates of a unit vector are implicitly modified when any single one is changed directly. Exceptions Standard_OutOfRange if Index is not 1 or 2. Standard_ConstructionError if either of the following is less than or equal to gp::Resolution(): - Sqrt(Xv*Xv + Yv*Yv), or - the modulus of the number pair formed by the new value Xi and the other coordinate of this vector that was not directly modified. Raises OutOfRange if Index != {1, 2}.

	:param Xv:
	:type Xv: float
	:param Yv:
	:type Yv: float
	:rtype: None
") SetCoord;
		void SetCoord (const Standard_Real Xv,const Standard_Real Yv);
		%feature("compactdefaultargs") SetX;
		%feature("autodoc", "	* Assigns the given value to the X coordinate of this unit vector, and then normalizes it. Warning Remember that all the coordinates of a unit vector are implicitly modified when any single one is changed directly. Exceptions Standard_ConstructionError if either of the following is less than or equal to gp::Resolution(): - the modulus of Coord, or - the modulus of the number pair formed from the new X or Y coordinate and the other coordinate of this vector that was not directly modified.

	:param X:
	:type X: float
	:rtype: None
") SetX;
		void SetX (const Standard_Real X);
		%feature("compactdefaultargs") SetY;
		%feature("autodoc", "	* Assigns the given value to the Y coordinate of this unit vector, and then normalizes it. Warning Remember that all the coordinates of a unit vector are implicitly modified when any single one is changed directly. Exceptions Standard_ConstructionError if either of the following is less than or equal to gp::Resolution(): - the modulus of Coord, or - the modulus of the number pair formed from the new X or Y coordinate and the other coordinate of this vector that was not directly modified.

	:param Y:
	:type Y: float
	:rtype: None
") SetY;
		void SetY (const Standard_Real Y);
		%feature("compactdefaultargs") SetXY;
		%feature("autodoc", "	* Assigns: - the two coordinates of Coord to this unit vector, and then normalizes it. Warning Remember that all the coordinates of a unit vector are implicitly modified when any single one is changed directly. Exceptions Standard_ConstructionError if either of the following is less than or equal to gp::Resolution(): - the modulus of Coord, or - the modulus of the number pair formed from the new X or Y coordinate and the other coordinate of this vector that was not directly modified.

	:param Coord:
	:type Coord: gp_XY
	:rtype: None
") SetXY;
		void SetXY (const gp_XY & Coord);
		%feature("compactdefaultargs") Coord;
		%feature("autodoc", "	* For this unit vector returns the coordinate of range Index : Index = 1 => X is returned Index = 2 => Y is returned Raises OutOfRange if Index != {1, 2}.

	:param Index:
	:type Index: int
	:rtype: float
") Coord;
		Standard_Real Coord (const Standard_Integer Index);
		%feature("compactdefaultargs") Coord;
		%feature("autodoc", "	* For this unit vector returns its two coordinates Xv and Yv. Raises OutOfRange if Index != {1, 2}.

	:param Xv:
	:type Xv: float &
	:param Yv:
	:type Yv: float &
	:rtype: None
") Coord;
		void Coord (Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") X;
		%feature("autodoc", "	* For this unit vector, returns its X coordinate.

	:rtype: float
") X;
		Standard_Real X ();
		%feature("compactdefaultargs") Y;
		%feature("autodoc", "	* For this unit vector, returns its Y coordinate.

	:rtype: float
") Y;
		Standard_Real Y ();
		%feature("compactdefaultargs") XY;
		%feature("autodoc", "	* For this unit vector, returns its two coordinates as a number pair. Comparison between Directions The precision value is an input data.

	:rtype: gp_XY
") XY;
		const gp_XY  XY ();
		%feature("compactdefaultargs") IsEqual;
		%feature("autodoc", "	* Returns True if the two vectors have the same direction i.e. the angle between this unit vector and the unit vector Other is less than or equal to AngularTolerance.

	:param Other:
	:type Other: gp_Dir2d
	:param AngularTolerance:
	:type AngularTolerance: float
	:rtype: bool
") IsEqual;
		Standard_Boolean IsEqual (const gp_Dir2d & Other,const Standard_Real AngularTolerance);
		%feature("compactdefaultargs") IsNormal;
		%feature("autodoc", "	* Returns True if the angle between this unit vector and the unit vector Other is equal to Pi/2 or -Pi/2 (normal) i.e. Abs(Abs(<self>.Angle(Other)) - PI/2.) <= AngularTolerance

	:param Other:
	:type Other: gp_Dir2d
	:param AngularTolerance:
	:type AngularTolerance: float
	:rtype: bool
") IsNormal;
		Standard_Boolean IsNormal (const gp_Dir2d & Other,const Standard_Real AngularTolerance);
		%feature("compactdefaultargs") IsOpposite;
		%feature("autodoc", "	* Returns True if the angle between this unit vector and the unit vector Other is equal to Pi or -Pi (opposite). i.e. PI - Abs(<self>.Angle(Other)) <= AngularTolerance

	:param Other:
	:type Other: gp_Dir2d
	:param AngularTolerance:
	:type AngularTolerance: float
	:rtype: bool
") IsOpposite;
		Standard_Boolean IsOpposite (const gp_Dir2d & Other,const Standard_Real AngularTolerance);
		%feature("compactdefaultargs") IsParallel;
		%feature("autodoc", "	* returns true if if the angle between this unit vector and unit vector Other is equal to 0, Pi or -Pi. i.e. Abs(Angle(<self>, Other)) <= AngularTolerance or PI - Abs(Angle(<self>, Other)) <= AngularTolerance

	:param Other:
	:type Other: gp_Dir2d
	:param AngularTolerance:
	:type AngularTolerance: float
	:rtype: bool
") IsParallel;
		Standard_Boolean IsParallel (const gp_Dir2d & Other,const Standard_Real AngularTolerance);
		%feature("compactdefaultargs") Angle;
		%feature("autodoc", "	* Computes the angular value in radians between <self> and <Other>. Returns the angle in the range [-PI, PI].

	:param Other:
	:type Other: gp_Dir2d
	:rtype: float
") Angle;
		Standard_Real Angle (const gp_Dir2d & Other);
		%feature("compactdefaultargs") Crossed;
		%feature("autodoc", "	* Computes the cross product between two directions.

	:param Right:
	:type Right: gp_Dir2d
	:rtype: float
") Crossed;
		Standard_Real Crossed (const gp_Dir2d & Right);
		%feature("compactdefaultargs") operator ^;
		%feature("autodoc", "	:param Right:
	:type Right: gp_Dir2d
	:rtype: float
") operator ^;
		Standard_Real operator ^ (const gp_Dir2d & Right);
		%feature("compactdefaultargs") Dot;
		%feature("autodoc", "	* Computes the scalar product

	:param Other:
	:type Other: gp_Dir2d
	:rtype: float
") Dot;
		Standard_Real Dot (const gp_Dir2d & Other);
		%feature("compactdefaultargs") operator *;
		%feature("autodoc", "	:param Other:
	:type Other: gp_Dir2d
	:rtype: float
") operator *;
		Standard_Real operator * (const gp_Dir2d & Other);
		%feature("compactdefaultargs") Reverse;
		%feature("autodoc", "	:rtype: None
") Reverse;
		void Reverse ();
		%feature("compactdefaultargs") Reversed;
		%feature("autodoc", "	* Reverses the orientation of a direction

	:rtype: gp_Dir2d
") Reversed;
		gp_Dir2d Reversed ();
		%feature("compactdefaultargs") operator -;
		%feature("autodoc", "	:rtype: gp_Dir2d
") operator -;
		gp_Dir2d operator - ();
		%feature("compactdefaultargs") Mirror;
		%feature("autodoc", "	:param V:
	:type V: gp_Dir2d
	:rtype: None
") Mirror;
		void Mirror (const gp_Dir2d & V);
		%feature("compactdefaultargs") Mirrored;
		%feature("autodoc", "	* Performs the symmetrical transformation of a direction with respect to the direction V which is the center of the symmetry.

	:param V:
	:type V: gp_Dir2d
	:rtype: gp_Dir2d
") Mirrored;
		gp_Dir2d Mirrored (const gp_Dir2d & V);
		%feature("compactdefaultargs") Mirror;
		%feature("autodoc", "	:param A:
	:type A: gp_Ax2d
	:rtype: None
") Mirror;
		void Mirror (const gp_Ax2d & A);
		%feature("compactdefaultargs") Mirrored;
		%feature("autodoc", "	* Performs the symmetrical transformation of a direction with respect to an axis placement which is the axis of the symmetry.

	:param A:
	:type A: gp_Ax2d
	:rtype: gp_Dir2d
") Mirrored;
		gp_Dir2d Mirrored (const gp_Ax2d & A);
		%feature("compactdefaultargs") Rotate;
		%feature("autodoc", "	:param Ang:
	:type Ang: float
	:rtype: None
") Rotate;
		void Rotate (const Standard_Real Ang);
		%feature("compactdefaultargs") Rotated;
		%feature("autodoc", "	* Rotates a direction. Ang is the angular value of the rotation in radians.

	:param Ang:
	:type Ang: float
	:rtype: gp_Dir2d
") Rotated;
		gp_Dir2d Rotated (const Standard_Real Ang);
		%feature("compactdefaultargs") Transform;
		%feature("autodoc", "	:param T:
	:type T: gp_Trsf2d
	:rtype: None
") Transform;
		void Transform (const gp_Trsf2d & T);
		%feature("compactdefaultargs") Transformed;
		%feature("autodoc", "	* Transforms a direction with the 'Trsf' T. Warnings : If the scale factor of the 'Trsf' T is negative then the direction <self> is reversed.

	:param T:
	:type T: gp_Trsf2d
	:rtype: gp_Dir2d
") Transformed;
		gp_Dir2d Transformed (const gp_Trsf2d & T);
		%feature("compactdefaultargs") _CSFDB_Getgp_Dir2dcoord;
		%feature("autodoc", "	:rtype: gp_XY
") _CSFDB_Getgp_Dir2dcoord;
		const gp_XY  _CSFDB_Getgp_Dir2dcoord ();
};


%extend gp_Dir2d {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor gp_Elips;
class gp_Elips {
	public:
		%feature("compactdefaultargs") gp_Elips;
		%feature("autodoc", "	* Creates an indefinite ellipse.

	:rtype: None
") gp_Elips;
		 gp_Elips ();
		%feature("compactdefaultargs") gp_Elips;
		%feature("autodoc", "	* The major radius of the ellipse is on the 'XAxis' and the minor radius is on the 'YAxis' of the ellipse. The 'XAxis' is defined with the 'XDirection' of A2 and the 'YAxis' is defined with the 'YDirection' of A2. Warnings : It is not forbidden to create an ellipse with MajorRadius = MinorRadius. Raises ConstructionError if MajorRadius < MinorRadius or MinorRadius < 0.

	:param A2:
	:type A2: gp_Ax2
	:param MajorRadius:
	:type MajorRadius: float
	:param MinorRadius:
	:type MinorRadius: float
	:rtype: None
") gp_Elips;
		 gp_Elips (const gp_Ax2 & A2,const Standard_Real MajorRadius,const Standard_Real MinorRadius);
		%feature("compactdefaultargs") SetAxis;
		%feature("autodoc", "	* Changes the axis normal to the plane of the ellipse. It modifies the definition of this plane. The 'XAxis' and the 'YAxis' are recomputed. The local coordinate system is redefined so that: - its origin and 'main Direction' become those of the axis A1 (the 'X Direction' and 'Y Direction' are then recomputed in the same way as for any gp_Ax2), or Raises ConstructionError if the direction of A1 is parallel to the direction of the 'XAxis' of the ellipse.

	:param A1:
	:type A1: gp_Ax1
	:rtype: None
") SetAxis;
		void SetAxis (const gp_Ax1 & A1);
		%feature("compactdefaultargs") SetLocation;
		%feature("autodoc", "	* Modifies this ellipse, by redefining its local coordinate so that its origin becomes P.

	:param P:
	:type P: gp_Pnt
	:rtype: None
") SetLocation;
		void SetLocation (const gp_Pnt & P);
		%feature("compactdefaultargs") SetMajorRadius;
		%feature("autodoc", "	* The major radius of the ellipse is on the 'XAxis' (major axis) of the ellipse. Raises ConstructionError if MajorRadius < MinorRadius.

	:param MajorRadius:
	:type MajorRadius: float
	:rtype: None
") SetMajorRadius;
		void SetMajorRadius (const Standard_Real MajorRadius);
		%feature("compactdefaultargs") SetMinorRadius;
		%feature("autodoc", "	* The minor radius of the ellipse is on the 'YAxis' (minor axis) of the ellipse. Raises ConstructionError if MinorRadius > MajorRadius or MinorRadius < 0.

	:param MinorRadius:
	:type MinorRadius: float
	:rtype: None
") SetMinorRadius;
		void SetMinorRadius (const Standard_Real MinorRadius);
		%feature("compactdefaultargs") SetPosition;
		%feature("autodoc", "	* Modifies this ellipse, by redefining its local coordinate so that it becomes A2e.

	:param A2:
	:type A2: gp_Ax2
	:rtype: None
") SetPosition;
		void SetPosition (const gp_Ax2 & A2);
		%feature("compactdefaultargs") Area;
		%feature("autodoc", "	* Computes the area of the Ellipse.

	:rtype: float
") Area;
		Standard_Real Area ();
		%feature("compactdefaultargs") Axis;
		%feature("autodoc", "	* Computes the axis normal to the plane of the ellipse.

	:rtype: gp_Ax1
") Axis;
		const gp_Ax1  Axis ();
		%feature("compactdefaultargs") Directrix1;
		%feature("autodoc", "	* Computes the first or second directrix of this ellipse. These are the lines, in the plane of the ellipse, normal to the major axis, at a distance equal to MajorRadius/e from the center of the ellipse, where e is the eccentricity of the ellipse. The first directrix (Directrix1) is on the positive side of the major axis. The second directrix (Directrix2) is on the negative side. The directrix is returned as an axis (gp_Ax1 object), the origin of which is situated on the 'X Axis' of the local coordinate system of this ellipse. Exceptions Standard_ConstructionError if the eccentricity is null (the ellipse has degenerated into a circle).

	:rtype: gp_Ax1
") Directrix1;
		gp_Ax1 Directrix1 ();
		%feature("compactdefaultargs") Directrix2;
		%feature("autodoc", "	* This line is obtained by the symmetrical transformation of 'Directrix1' with respect to the 'YAxis' of the ellipse. Exceptions Standard_ConstructionError if the eccentricity is null (the ellipse has degenerated into a circle).

	:rtype: gp_Ax1
") Directrix2;
		gp_Ax1 Directrix2 ();
		%feature("compactdefaultargs") Eccentricity;
		%feature("autodoc", "	* Returns the eccentricity of the ellipse between 0.0 and 1.0 If f is the distance between the center of the ellipse and the Focus1 then the eccentricity e = f / MajorRadius. Raises ConstructionError if MajorRadius = 0.0

	:rtype: float
") Eccentricity;
		Standard_Real Eccentricity ();
		%feature("compactdefaultargs") Focal;
		%feature("autodoc", "	* Computes the focal distance. It is the distance between the two focus focus1 and focus2 of the ellipse.

	:rtype: float
") Focal;
		Standard_Real Focal ();
		%feature("compactdefaultargs") Focus1;
		%feature("autodoc", "	* Returns the first focus of the ellipse. This focus is on the positive side of the 'XAxis' of the ellipse.

	:rtype: gp_Pnt
") Focus1;
		gp_Pnt Focus1 ();
		%feature("compactdefaultargs") Focus2;
		%feature("autodoc", "	* Returns the second focus of the ellipse. This focus is on the negative side of the 'XAxis' of the ellipse.

	:rtype: gp_Pnt
") Focus2;
		gp_Pnt Focus2 ();
		%feature("compactdefaultargs") Location;
		%feature("autodoc", "	* Returns the center of the ellipse. It is the 'Location' point of the coordinate system of the ellipse.

	:rtype: gp_Pnt
") Location;
		const gp_Pnt  Location ();
		%feature("compactdefaultargs") MajorRadius;
		%feature("autodoc", "	* Returns the major radius of the ellipse.

	:rtype: float
") MajorRadius;
		Standard_Real MajorRadius ();
		%feature("compactdefaultargs") MinorRadius;
		%feature("autodoc", "	* Returns the minor radius of the ellipse.

	:rtype: float
") MinorRadius;
		Standard_Real MinorRadius ();
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "	* Returns p = (1 - e * e) * MajorRadius where e is the eccentricity of the ellipse. Returns 0 if MajorRadius = 0

	:rtype: float
") Parameter;
		Standard_Real Parameter ();
		%feature("compactdefaultargs") Position;
		%feature("autodoc", "	* Returns the coordinate system of the ellipse.

	:rtype: gp_Ax2
") Position;
		const gp_Ax2  Position ();
		%feature("compactdefaultargs") XAxis;
		%feature("autodoc", "	* Returns the 'XAxis' of the ellipse whose origin is the center of this ellipse. It is the major axis of the ellipse.

	:rtype: gp_Ax1
") XAxis;
		gp_Ax1 XAxis ();
		%feature("compactdefaultargs") YAxis;
		%feature("autodoc", "	* Returns the 'YAxis' of the ellipse whose unit vector is the 'X Direction' or the 'Y Direction' of the local coordinate system of this ellipse. This is the minor axis of the ellipse.

	:rtype: gp_Ax1
") YAxis;
		gp_Ax1 YAxis ();
		%feature("compactdefaultargs") Mirror;
		%feature("autodoc", "	:param P:
	:type P: gp_Pnt
	:rtype: None
") Mirror;
		void Mirror (const gp_Pnt & P);
		%feature("compactdefaultargs") Mirrored;
		%feature("autodoc", "	* Performs the symmetrical transformation of an ellipse with respect to the point P which is the center of the symmetry.

	:param P:
	:type P: gp_Pnt
	:rtype: gp_Elips
") Mirrored;
		gp_Elips Mirrored (const gp_Pnt & P);
		%feature("compactdefaultargs") Mirror;
		%feature("autodoc", "	:param A1:
	:type A1: gp_Ax1
	:rtype: None
") Mirror;
		void Mirror (const gp_Ax1 & A1);
		%feature("compactdefaultargs") Mirrored;
		%feature("autodoc", "	* Performs the symmetrical transformation of an ellipse with respect to an axis placement which is the axis of the symmetry.

	:param A1:
	:type A1: gp_Ax1
	:rtype: gp_Elips
") Mirrored;
		gp_Elips Mirrored (const gp_Ax1 & A1);
		%feature("compactdefaultargs") Mirror;
		%feature("autodoc", "	:param A2:
	:type A2: gp_Ax2
	:rtype: None
") Mirror;
		void Mirror (const gp_Ax2 & A2);
		%feature("compactdefaultargs") Mirrored;
		%feature("autodoc", "	* Performs the symmetrical transformation of an ellipse with respect to a plane. The axis placement A2 locates the plane of the symmetry (Location, XDirection, YDirection).

	:param A2:
	:type A2: gp_Ax2
	:rtype: gp_Elips
") Mirrored;
		gp_Elips Mirrored (const gp_Ax2 & A2);
		%feature("compactdefaultargs") Rotate;
		%feature("autodoc", "	:param A1:
	:type A1: gp_Ax1
	:param Ang:
	:type Ang: float
	:rtype: None
") Rotate;
		void Rotate (const gp_Ax1 & A1,const Standard_Real Ang);
		%feature("compactdefaultargs") Rotated;
		%feature("autodoc", "	* Rotates an ellipse. A1 is the axis of the rotation. Ang is the angular value of the rotation in radians.

	:param A1:
	:type A1: gp_Ax1
	:param Ang:
	:type Ang: float
	:rtype: gp_Elips
") Rotated;
		gp_Elips Rotated (const gp_Ax1 & A1,const Standard_Real Ang);
		%feature("compactdefaultargs") Scale;
		%feature("autodoc", "	:param P:
	:type P: gp_Pnt
	:param S:
	:type S: float
	:rtype: None
") Scale;
		void Scale (const gp_Pnt & P,const Standard_Real S);
		%feature("compactdefaultargs") Scaled;
		%feature("autodoc", "	* Scales an ellipse. S is the scaling value.

	:param P:
	:type P: gp_Pnt
	:param S:
	:type S: float
	:rtype: gp_Elips
") Scaled;
		gp_Elips Scaled (const gp_Pnt & P,const Standard_Real S);
		%feature("compactdefaultargs") Transform;
		%feature("autodoc", "	:param T:
	:type T: gp_Trsf
	:rtype: None
") Transform;
		void Transform (const gp_Trsf & T);
		%feature("compactdefaultargs") Transformed;
		%feature("autodoc", "	* Transforms an ellipse with the transformation T from class Trsf.

	:param T:
	:type T: gp_Trsf
	:rtype: gp_Elips
") Transformed;
		gp_Elips Transformed (const gp_Trsf & T);
		%feature("compactdefaultargs") Translate;
		%feature("autodoc", "	:param V:
	:type V: gp_Vec
	:rtype: None
") Translate;
		void Translate (const gp_Vec & V);
		%feature("compactdefaultargs") Translated;
		%feature("autodoc", "	* Translates an ellipse in the direction of the vector V. The magnitude of the translation is the vector's magnitude.

	:param V:
	:type V: gp_Vec
	:rtype: gp_Elips
") Translated;
		gp_Elips Translated (const gp_Vec & V);
		%feature("compactdefaultargs") Translate;
		%feature("autodoc", "	:param P1:
	:type P1: gp_Pnt
	:param P2:
	:type P2: gp_Pnt
	:rtype: None
") Translate;
		void Translate (const gp_Pnt & P1,const gp_Pnt & P2);
		%feature("compactdefaultargs") Translated;
		%feature("autodoc", "	* Translates an ellipse from the point P1 to the point P2.

	:param P1:
	:type P1: gp_Pnt
	:param P2:
	:type P2: gp_Pnt
	:rtype: gp_Elips
") Translated;
		gp_Elips Translated (const gp_Pnt & P1,const gp_Pnt & P2);
		%feature("compactdefaultargs") _CSFDB_Getgp_Elipspos;
		%feature("autodoc", "	:rtype: gp_Ax2
") _CSFDB_Getgp_Elipspos;
		const gp_Ax2  _CSFDB_Getgp_Elipspos ();
		%feature("compactdefaultargs") _CSFDB_Getgp_ElipsmajorRadius;
		%feature("autodoc", "	:rtype: float
") _CSFDB_Getgp_ElipsmajorRadius;
		Standard_Real _CSFDB_Getgp_ElipsmajorRadius ();
		%feature("compactdefaultargs") _CSFDB_Setgp_ElipsmajorRadius;
		%feature("autodoc", "	:param p:
	:type p: float
	:rtype: None
") _CSFDB_Setgp_ElipsmajorRadius;
		void _CSFDB_Setgp_ElipsmajorRadius (const Standard_Real p);
		%feature("compactdefaultargs") _CSFDB_Getgp_ElipsminorRadius;
		%feature("autodoc", "	:rtype: float
") _CSFDB_Getgp_ElipsminorRadius;
		Standard_Real _CSFDB_Getgp_ElipsminorRadius ();
		%feature("compactdefaultargs") _CSFDB_Setgp_ElipsminorRadius;
		%feature("autodoc", "	:param p:
	:type p: float
	:rtype: None
") _CSFDB_Setgp_ElipsminorRadius;
		void _CSFDB_Setgp_ElipsminorRadius (const Standard_Real p);
};


%extend gp_Elips {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor gp_Elips2d;
class gp_Elips2d {
	public:
		%feature("compactdefaultargs") gp_Elips2d;
		%feature("autodoc", "	* Creates an indefinite ellipse.

	:rtype: None
") gp_Elips2d;
		 gp_Elips2d ();
		%feature("compactdefaultargs") gp_Elips2d;
		%feature("autodoc", "	* Creates an ellipse with the major axis, the major and the minor radius. The location of the MajorAxis is the center of the ellipse. The sense of parametrization is given by Sense. Warnings : It is possible to create an ellipse with MajorRadius = MinorRadius. Raises ConstructionError if MajorRadius < MinorRadius or MinorRadius < 0.0

	:param MajorAxis:
	:type MajorAxis: gp_Ax2d
	:param MajorRadius:
	:type MajorRadius: float
	:param MinorRadius:
	:type MinorRadius: float
	:param Sense: default value is Standard_True
	:type Sense: bool
	:rtype: None
") gp_Elips2d;
		 gp_Elips2d (const gp_Ax2d & MajorAxis,const Standard_Real MajorRadius,const Standard_Real MinorRadius,const Standard_Boolean Sense = Standard_True);
		%feature("compactdefaultargs") gp_Elips2d;
		%feature("autodoc", "	* Creates an ellipse with radii MajorRadius and MinorRadius, positioned in the plane by coordinate system A where: - the origin of A is the center of the ellipse, - the 'X Direction' of A defines the major axis of the ellipse, that is, the major radius MajorRadius is measured along this axis, and - the 'Y Direction' of A defines the minor axis of the ellipse, that is, the minor radius MinorRadius is measured along this axis, and - the orientation (direct or indirect sense) of A gives the orientation of the ellipse. Warnings : It is possible to create an ellipse with MajorRadius = MinorRadius. Raises ConstructionError if MajorRadius < MinorRadius or MinorRadius < 0.0

	:param A:
	:type A: gp_Ax22d
	:param MajorRadius:
	:type MajorRadius: float
	:param MinorRadius:
	:type MinorRadius: float
	:rtype: None
") gp_Elips2d;
		 gp_Elips2d (const gp_Ax22d & A,const Standard_Real MajorRadius,const Standard_Real MinorRadius);
		%feature("compactdefaultargs") SetLocation;
		%feature("autodoc", "	* Modifies this ellipse, by redefining its local coordinate system so that - its origin becomes P.

	:param P:
	:type P: gp_Pnt2d
	:rtype: None
") SetLocation;
		void SetLocation (const gp_Pnt2d & P);
		%feature("compactdefaultargs") SetMajorRadius;
		%feature("autodoc", "	* Changes the value of the major radius. Raises ConstructionError if MajorRadius < MinorRadius.

	:param MajorRadius:
	:type MajorRadius: float
	:rtype: None
") SetMajorRadius;
		void SetMajorRadius (const Standard_Real MajorRadius);
		%feature("compactdefaultargs") SetMinorRadius;
		%feature("autodoc", "	* Changes the value of the minor radius. Raises ConstructionError if MajorRadius < MinorRadius or MinorRadius < 0.0

	:param MinorRadius:
	:type MinorRadius: float
	:rtype: None
") SetMinorRadius;
		void SetMinorRadius (const Standard_Real MinorRadius);
		%feature("compactdefaultargs") SetAxis;
		%feature("autodoc", "	* Modifies this ellipse, by redefining its local coordinate system so that it becomes A.

	:param A:
	:type A: gp_Ax22d
	:rtype: None
") SetAxis;
		void SetAxis (const gp_Ax22d & A);
		%feature("compactdefaultargs") SetXAxis;
		%feature("autodoc", "	* Modifies this ellipse, by redefining its local coordinate system so that its origin and its 'X Direction' become those of the axis A. The 'Y Direction' is then recomputed. The orientation of the local coordinate system is not modified.

	:param A:
	:type A: gp_Ax2d
	:rtype: None
") SetXAxis;
		void SetXAxis (const gp_Ax2d & A);
		%feature("compactdefaultargs") SetYAxis;
		%feature("autodoc", "	* Modifies this ellipse, by redefining its local coordinate system so that its origin and its 'Y Direction' become those of the axis A. The 'X Direction' is then recomputed. The orientation of the local coordinate system is not modified.

	:param A:
	:type A: gp_Ax2d
	:rtype: None
") SetYAxis;
		void SetYAxis (const gp_Ax2d & A);
		%feature("compactdefaultargs") Area;
		%feature("autodoc", "	* Computes the area of the ellipse.

	:rtype: float
") Area;
		Standard_Real Area ();
		%feature("compactdefaultargs") Coefficients;
		%feature("autodoc", "	* Returns the coefficients of the implicit equation of the ellipse. A * (X**2) + B * (Y**2) + 2*C*(X*Y) + 2*D*X + 2*E*Y + F = 0.

	:param A:
	:type A: float &
	:param B:
	:type B: float &
	:param C:
	:type C: float &
	:param D:
	:type D: float &
	:param E:
	:type E: float &
	:param F:
	:type F: float &
	:rtype: None
") Coefficients;
		void Coefficients (Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") Directrix1;
		%feature("autodoc", "	* This directrix is the line normal to the XAxis of the ellipse in the local plane (Z = 0) at a distance d = MajorRadius / e from the center of the ellipse, where e is the eccentricity of the ellipse. This line is parallel to the 'YAxis'. The intersection point between directrix1 and the 'XAxis' is the location point of the directrix1. This point is on the positive side of the 'XAxis'. //! Raised if Eccentricity = 0.0. (The ellipse degenerates into a circle)

	:rtype: gp_Ax2d
") Directrix1;
		gp_Ax2d Directrix1 ();
		%feature("compactdefaultargs") Directrix2;
		%feature("autodoc", "	* This line is obtained by the symmetrical transformation of 'Directrix1' with respect to the minor axis of the ellipse. //! Raised if Eccentricity = 0.0. (The ellipse degenerates into a circle).

	:rtype: gp_Ax2d
") Directrix2;
		gp_Ax2d Directrix2 ();
		%feature("compactdefaultargs") Eccentricity;
		%feature("autodoc", "	* Returns the eccentricity of the ellipse between 0.0 and 1.0 If f is the distance between the center of the ellipse and the Focus1 then the eccentricity e = f / MajorRadius. Returns 0 if MajorRadius = 0.

	:rtype: float
") Eccentricity;
		Standard_Real Eccentricity ();
		%feature("compactdefaultargs") Focal;
		%feature("autodoc", "	* Returns the distance between the center of the ellipse and focus1 or focus2.

	:rtype: float
") Focal;
		Standard_Real Focal ();
		%feature("compactdefaultargs") Focus1;
		%feature("autodoc", "	* Returns the first focus of the ellipse. This focus is on the positive side of the major axis of the ellipse.

	:rtype: gp_Pnt2d
") Focus1;
		gp_Pnt2d Focus1 ();
		%feature("compactdefaultargs") Focus2;
		%feature("autodoc", "	* Returns the second focus of the ellipse. This focus is on the negative side of the major axis of the ellipse.

	:rtype: gp_Pnt2d
") Focus2;
		gp_Pnt2d Focus2 ();
		%feature("compactdefaultargs") Location;
		%feature("autodoc", "	* Returns the center of the ellipse.

	:rtype: gp_Pnt2d
") Location;
		const gp_Pnt2d  Location ();
		%feature("compactdefaultargs") MajorRadius;
		%feature("autodoc", "	* Returns the major radius of the Ellipse.

	:rtype: float
") MajorRadius;
		Standard_Real MajorRadius ();
		%feature("compactdefaultargs") MinorRadius;
		%feature("autodoc", "	* Returns the minor radius of the Ellipse.

	:rtype: float
") MinorRadius;
		Standard_Real MinorRadius ();
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "	* Returns p = (1 - e * e) * MajorRadius where e is the eccentricity of the ellipse. Returns 0 if MajorRadius = 0

	:rtype: float
") Parameter;
		Standard_Real Parameter ();
		%feature("compactdefaultargs") Axis;
		%feature("autodoc", "	* Returns the major axis of the ellipse.

	:rtype: gp_Ax22d
") Axis;
		const gp_Ax22d  Axis ();
		%feature("compactdefaultargs") XAxis;
		%feature("autodoc", "	* Returns the major axis of the ellipse.

	:rtype: gp_Ax2d
") XAxis;
		gp_Ax2d XAxis ();
		%feature("compactdefaultargs") YAxis;
		%feature("autodoc", "	* Returns the minor axis of the ellipse. Reverses the direction of the circle.

	:rtype: gp_Ax2d
") YAxis;
		gp_Ax2d YAxis ();
		%feature("compactdefaultargs") Reverse;
		%feature("autodoc", "	:rtype: None
") Reverse;
		void Reverse ();
		%feature("compactdefaultargs") Reversed;
		%feature("autodoc", "	:rtype: gp_Elips2d
") Reversed;
		gp_Elips2d Reversed ();
		%feature("compactdefaultargs") IsDirect;
		%feature("autodoc", "	* Returns true if the local coordinate system is direct and false in the other case.

	:rtype: bool
") IsDirect;
		Standard_Boolean IsDirect ();
		%feature("compactdefaultargs") Mirror;
		%feature("autodoc", "	:param P:
	:type P: gp_Pnt2d
	:rtype: None
") Mirror;
		void Mirror (const gp_Pnt2d & P);
		%feature("compactdefaultargs") Mirrored;
		%feature("autodoc", "	* Performs the symmetrical transformation of a ellipse with respect to the point P which is the center of the symmetry

	:param P:
	:type P: gp_Pnt2d
	:rtype: gp_Elips2d
") Mirrored;
		gp_Elips2d Mirrored (const gp_Pnt2d & P);
		%feature("compactdefaultargs") Mirror;
		%feature("autodoc", "	:param A:
	:type A: gp_Ax2d
	:rtype: None
") Mirror;
		void Mirror (const gp_Ax2d & A);
		%feature("compactdefaultargs") Mirrored;
		%feature("autodoc", "	* Performs the symmetrical transformation of a ellipse with respect to an axis placement which is the axis of the symmetry.

	:param A:
	:type A: gp_Ax2d
	:rtype: gp_Elips2d
") Mirrored;
		gp_Elips2d Mirrored (const gp_Ax2d & A);
		%feature("compactdefaultargs") Rotate;
		%feature("autodoc", "	:param P:
	:type P: gp_Pnt2d
	:param Ang:
	:type Ang: float
	:rtype: None
") Rotate;
		void Rotate (const gp_Pnt2d & P,const Standard_Real Ang);
		%feature("compactdefaultargs") Rotated;
		%feature("autodoc", "	:param P:
	:type P: gp_Pnt2d
	:param Ang:
	:type Ang: float
	:rtype: gp_Elips2d
") Rotated;
		gp_Elips2d Rotated (const gp_Pnt2d & P,const Standard_Real Ang);
		%feature("compactdefaultargs") Scale;
		%feature("autodoc", "	:param P:
	:type P: gp_Pnt2d
	:param S:
	:type S: float
	:rtype: None
") Scale;
		void Scale (const gp_Pnt2d & P,const Standard_Real S);
		%feature("compactdefaultargs") Scaled;
		%feature("autodoc", "	* Scales a ellipse. S is the scaling value.

	:param P:
	:type P: gp_Pnt2d
	:param S:
	:type S: float
	:rtype: gp_Elips2d
") Scaled;
		gp_Elips2d Scaled (const gp_Pnt2d & P,const Standard_Real S);
		%feature("compactdefaultargs") Transform;
		%feature("autodoc", "	:param T:
	:type T: gp_Trsf2d
	:rtype: None
") Transform;
		void Transform (const gp_Trsf2d & T);
		%feature("compactdefaultargs") Transformed;
		%feature("autodoc", "	* Transforms an ellipse with the transformation T from class Trsf2d.

	:param T:
	:type T: gp_Trsf2d
	:rtype: gp_Elips2d
") Transformed;
		gp_Elips2d Transformed (const gp_Trsf2d & T);
		%feature("compactdefaultargs") Translate;
		%feature("autodoc", "	:param V:
	:type V: gp_Vec2d
	:rtype: None
") Translate;
		void Translate (const gp_Vec2d & V);
		%feature("compactdefaultargs") Translated;
		%feature("autodoc", "	* Translates a ellipse in the direction of the vector V. The magnitude of the translation is the vector's magnitude.

	:param V:
	:type V: gp_Vec2d
	:rtype: gp_Elips2d
") Translated;
		gp_Elips2d Translated (const gp_Vec2d & V);
		%feature("compactdefaultargs") Translate;
		%feature("autodoc", "	:param P1:
	:type P1: gp_Pnt2d
	:param P2:
	:type P2: gp_Pnt2d
	:rtype: None
") Translate;
		void Translate (const gp_Pnt2d & P1,const gp_Pnt2d & P2);
		%feature("compactdefaultargs") Translated;
		%feature("autodoc", "	* Translates a ellipse from the point P1 to the point P2.

	:param P1:
	:type P1: gp_Pnt2d
	:param P2:
	:type P2: gp_Pnt2d
	:rtype: gp_Elips2d
") Translated;
		gp_Elips2d Translated (const gp_Pnt2d & P1,const gp_Pnt2d & P2);
		%feature("compactdefaultargs") _CSFDB_Getgp_Elips2dpos;
		%feature("autodoc", "	:rtype: gp_Ax22d
") _CSFDB_Getgp_Elips2dpos;
		const gp_Ax22d  _CSFDB_Getgp_Elips2dpos ();
		%feature("compactdefaultargs") _CSFDB_Getgp_Elips2dmajorRadius;
		%feature("autodoc", "	:rtype: float
") _CSFDB_Getgp_Elips2dmajorRadius;
		Standard_Real _CSFDB_Getgp_Elips2dmajorRadius ();
		%feature("compactdefaultargs") _CSFDB_Setgp_Elips2dmajorRadius;
		%feature("autodoc", "	:param p:
	:type p: float
	:rtype: None
") _CSFDB_Setgp_Elips2dmajorRadius;
		void _CSFDB_Setgp_Elips2dmajorRadius (const Standard_Real p);
		%feature("compactdefaultargs") _CSFDB_Getgp_Elips2dminorRadius;
		%feature("autodoc", "	:rtype: float
") _CSFDB_Getgp_Elips2dminorRadius;
		Standard_Real _CSFDB_Getgp_Elips2dminorRadius ();
		%feature("compactdefaultargs") _CSFDB_Setgp_Elips2dminorRadius;
		%feature("autodoc", "	:param p:
	:type p: float
	:rtype: None
") _CSFDB_Setgp_Elips2dminorRadius;
		void _CSFDB_Setgp_Elips2dminorRadius (const Standard_Real p);
};


%extend gp_Elips2d {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor gp_GTrsf;
class gp_GTrsf {
	public:
		%feature("compactdefaultargs") gp_GTrsf;
		%feature("autodoc", "	* Returns the Identity transformation.

	:rtype: None
") gp_GTrsf;
		 gp_GTrsf ();
		%feature("compactdefaultargs") gp_GTrsf;
		%feature("autodoc", "	* Converts the gp_Trsf transformation T into a general transformation, i.e. Returns a GTrsf with the same matrix of coefficients as the Trsf T.

	:param T:
	:type T: gp_Trsf
	:rtype: None
") gp_GTrsf;
		 gp_GTrsf (const gp_Trsf & T);
		%feature("compactdefaultargs") gp_GTrsf;
		%feature("autodoc", "	* Creates a transformation based on the matrix M and the vector V where M defines the vectorial part of the transformation, and V the translation part, or

	:param M:
	:type M: gp_Mat
	:param V:
	:type V: gp_XYZ
	:rtype: None
") gp_GTrsf;
		 gp_GTrsf (const gp_Mat & M,const gp_XYZ & V);
		%feature("compactdefaultargs") SetAffinity;
		%feature("autodoc", "	* Changes this transformation into an affinity of ratio Ratio with respect to the axis A1. Note: an affinity is a point-by-point transformation that transforms any point P into a point P' such that if H is the orthogonal projection of P on the axis A1 or the plane A2, the vectors HP and HP' satisfy: HP' = Ratio * HP.

	:param A1:
	:type A1: gp_Ax1
	:param Ratio:
	:type Ratio: float
	:rtype: None
") SetAffinity;
		void SetAffinity (const gp_Ax1 & A1,const Standard_Real Ratio);
		%feature("compactdefaultargs") SetAffinity;
		%feature("autodoc", "	* Changes this transformation into an affinity of ratio Ratio with respect to the plane defined by the origin, the 'X Direction' and the 'Y Direction' of coordinate system A2. Note: an affinity is a point-by-point transformation that transforms any point P into a point P' such that if H is the orthogonal projection of P on the axis A1 or the plane A2, the vectors HP and HP' satisfy: HP' = Ratio * HP.

	:param A2:
	:type A2: gp_Ax2
	:param Ratio:
	:type Ratio: float
	:rtype: None
") SetAffinity;
		void SetAffinity (const gp_Ax2 & A2,const Standard_Real Ratio);
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	* Replaces the coefficient (Row, Col) of the matrix representing this transformation by Value. Raises OutOfRange if Row < 1 or Row > 3 or Col < 1 or Col > 4

	:param Row:
	:type Row: int
	:param Col:
	:type Col: int
	:param Value:
	:type Value: float
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Row,const Standard_Integer Col,const Standard_Real Value);
		%feature("compactdefaultargs") SetVectorialPart;
		%feature("autodoc", "	* Replaces the vectorial part of this transformation by Matrix.

	:param Matrix:
	:type Matrix: gp_Mat
	:rtype: None
") SetVectorialPart;
		void SetVectorialPart (const gp_Mat & Matrix);
		%feature("compactdefaultargs") SetTranslationPart;
		%feature("autodoc", "	* Replaces the translation part of this transformation by the coordinates of the number triple Coord.

	:param Coord:
	:type Coord: gp_XYZ
	:rtype: None
") SetTranslationPart;
		void SetTranslationPart (const gp_XYZ & Coord);
		%feature("compactdefaultargs") SetTrsf;
		%feature("autodoc", "	* Assigns the vectorial and translation parts of T to this transformation.

	:param T:
	:type T: gp_Trsf
	:rtype: None
") SetTrsf;
		void SetTrsf (const gp_Trsf & T);
		%feature("compactdefaultargs") IsNegative;
		%feature("autodoc", "	* Returns true if the determinant of the vectorial part of this transformation is negative.

	:rtype: bool
") IsNegative;
		Standard_Boolean IsNegative ();
		%feature("compactdefaultargs") IsSingular;
		%feature("autodoc", "	* Returns true if this transformation is singular (and therefore, cannot be inverted). Note: The Gauss LU decomposition is used to invert the transformation matrix. Consequently, the transformation is considered as singular if the largest pivot found is less than or equal to gp::Resolution(). Warning If this transformation is singular, it cannot be inverted.

	:rtype: bool
") IsSingular;
		Standard_Boolean IsSingular ();
		%feature("compactdefaultargs") Form;
		%feature("autodoc", "	* Returns the nature of the transformation. It can be an identity transformation, a rotation, a translation, a mirror transformation (relative to a point, an axis or a plane), a scaling transformation, a compound transformation or some other type of transformation.

	:rtype: gp_TrsfForm
") Form;
		gp_TrsfForm Form ();
		%feature("compactdefaultargs") SetForm;
		%feature("autodoc", "	* verify and set the shape of the GTrsf Other or CompoundTrsf Ex : myGTrsf.SetValue(row1,col1,val1); myGTrsf.SetValue(row2,col2,val2); ... myGTrsf.SetForm();

	:rtype: None
") SetForm;
		void SetForm ();
		%feature("compactdefaultargs") TranslationPart;
		%feature("autodoc", "	* Returns the translation part of the GTrsf.

	:rtype: gp_XYZ
") TranslationPart;
		const gp_XYZ  TranslationPart ();
		%feature("compactdefaultargs") VectorialPart;
		%feature("autodoc", "	* Computes the vectorial part of the GTrsf. The returned Matrix is a 3*3 matrix.

	:rtype: gp_Mat
") VectorialPart;
		const gp_Mat  VectorialPart ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	* Returns the coefficients of the global matrix of transformation. Raises OutOfRange if Row < 1 or Row > 3 or Col < 1 or Col > 4

	:param Row:
	:type Row: int
	:param Col:
	:type Col: int
	:rtype: float
") Value;
		Standard_Real Value (const Standard_Integer Row,const Standard_Integer Col);
		%feature("compactdefaultargs") Invert;
		%feature("autodoc", "	:rtype: None
") Invert;
		void Invert ();
		%feature("compactdefaultargs") Inverted;
		%feature("autodoc", "	* Computes the reverse transformation. Raises an exception if the matrix of the transformation is not inversible.

	:rtype: gp_GTrsf
") Inverted;
		gp_GTrsf Inverted ();
		%feature("compactdefaultargs") Multiplied;
		%feature("autodoc", "	* Computes the transformation composed from T and <self>. In a C++ implementation you can also write Tcomposed = <self> * T. Example : GTrsf T1, T2, Tcomp; ............... //composition : Tcomp = T2.Multiplied(T1); // or (Tcomp = T2 * T1) // transformation of a point XYZ P(10.,3.,4.); XYZ P1(P); Tcomp.Transforms(P1); //using Tcomp XYZ P2(P); T1.Transforms(P2); //using T1 then T2 T2.Transforms(P2); // P1 = P2 !!!

	:param T:
	:type T: gp_GTrsf
	:rtype: gp_GTrsf
") Multiplied;
		gp_GTrsf Multiplied (const gp_GTrsf & T);
		%feature("compactdefaultargs") operator *;
		%feature("autodoc", "	:param T:
	:type T: gp_GTrsf
	:rtype: gp_GTrsf
") operator *;
		gp_GTrsf operator * (const gp_GTrsf & T);
		%feature("compactdefaultargs") Multiply;
		%feature("autodoc", "	* Computes the transformation composed with <self> and T. <self> = <self> * T

	:param T:
	:type T: gp_GTrsf
	:rtype: None
") Multiply;
		void Multiply (const gp_GTrsf & T);
		%feature("compactdefaultargs") operator *=;
		%feature("autodoc", "	:param T:
	:type T: gp_GTrsf
	:rtype: None
") operator *=;
		void operator *= (const gp_GTrsf & T);
		%feature("compactdefaultargs") PreMultiply;
		%feature("autodoc", "	* Computes the product of the transformation T and this transformation and assigns the result to this transformation. this = T * this

	:param T:
	:type T: gp_GTrsf
	:rtype: None
") PreMultiply;
		void PreMultiply (const gp_GTrsf & T);
		%feature("compactdefaultargs") Power;
		%feature("autodoc", "	:param N:
	:type N: int
	:rtype: None
") Power;
		void Power (const Standard_Integer N);
		%feature("compactdefaultargs") Powered;
		%feature("autodoc", "	* Computes: - the product of this transformation multiplied by itself N times, if N is positive, or - the product of the inverse of this transformation multiplied by itself |N| times, if N is negative. If N equals zero, the result is equal to the Identity transformation. I.e.: <self> * <self> * .......* <self>, N time. if N =0 <self> = Identity if N < 0 <self> = <self>.Inverse() *...........* <self>.Inverse(). //! Raises an exception if N < 0 and if the matrix of the transformation not inversible.

	:param N:
	:type N: int
	:rtype: gp_GTrsf
") Powered;
		gp_GTrsf Powered (const Standard_Integer N);
		%feature("compactdefaultargs") Transforms;
		%feature("autodoc", "	:param Coord:
	:type Coord: gp_XYZ
	:rtype: None
") Transforms;
		void Transforms (gp_XYZ & Coord);
		%feature("compactdefaultargs") Transforms;
		%feature("autodoc", "	* Transforms a triplet XYZ with a GTrsf.

	:param X:
	:type X: float &
	:param Y:
	:type Y: float &
	:param Z:
	:type Z: float &
	:rtype: None
") Transforms;
		void Transforms (Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") Trsf;
		%feature("autodoc", "	:rtype: gp_Trsf
") Trsf;
		gp_Trsf Trsf ();
		%feature("compactdefaultargs") _CSFDB_Getgp_GTrsfmatrix;
		%feature("autodoc", "	:rtype: gp_Mat
") _CSFDB_Getgp_GTrsfmatrix;
		const gp_Mat  _CSFDB_Getgp_GTrsfmatrix ();
		%feature("compactdefaultargs") _CSFDB_Getgp_GTrsfloc;
		%feature("autodoc", "	:rtype: gp_XYZ
") _CSFDB_Getgp_GTrsfloc;
		const gp_XYZ  _CSFDB_Getgp_GTrsfloc ();
		%feature("compactdefaultargs") _CSFDB_Getgp_GTrsfshape;
		%feature("autodoc", "	:rtype: gp_TrsfForm
") _CSFDB_Getgp_GTrsfshape;
		gp_TrsfForm _CSFDB_Getgp_GTrsfshape ();
		%feature("compactdefaultargs") _CSFDB_Setgp_GTrsfshape;
		%feature("autodoc", "	:param p:
	:type p: gp_TrsfForm
	:rtype: None
") _CSFDB_Setgp_GTrsfshape;
		void _CSFDB_Setgp_GTrsfshape (const gp_TrsfForm p);
		%feature("compactdefaultargs") _CSFDB_Getgp_GTrsfscale;
		%feature("autodoc", "	:rtype: float
") _CSFDB_Getgp_GTrsfscale;
		Standard_Real _CSFDB_Getgp_GTrsfscale ();
		%feature("compactdefaultargs") _CSFDB_Setgp_GTrsfscale;
		%feature("autodoc", "	:param p:
	:type p: float
	:rtype: None
") _CSFDB_Setgp_GTrsfscale;
		void _CSFDB_Setgp_GTrsfscale (const Standard_Real p);
};


%extend gp_GTrsf {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor gp_GTrsf2d;
class gp_GTrsf2d {
	public:
		%feature("compactdefaultargs") gp_GTrsf2d;
		%feature("autodoc", "	* returns identity transformation.

	:rtype: None
") gp_GTrsf2d;
		 gp_GTrsf2d ();
		%feature("compactdefaultargs") gp_GTrsf2d;
		%feature("autodoc", "	* Converts the gp_Trsf2d transformation T into a general transformation.

	:param T:
	:type T: gp_Trsf2d
	:rtype: None
") gp_GTrsf2d;
		 gp_GTrsf2d (const gp_Trsf2d & T);
		%feature("compactdefaultargs") gp_GTrsf2d;
		%feature("autodoc", "	* Creates a transformation based on the matrix M and the vector V where M defines the vectorial part of the transformation, and V the translation part.

	:param M:
	:type M: gp_Mat2d
	:param V:
	:type V: gp_XY
	:rtype: None
") gp_GTrsf2d;
		 gp_GTrsf2d (const gp_Mat2d & M,const gp_XY & V);
		%feature("compactdefaultargs") SetAffinity;
		%feature("autodoc", "	* Changes this transformation into an affinity of ratio Ratio with respect to the axis A. Note: An affinity is a point-by-point transformation that transforms any point P into a point P' such that if H is the orthogonal projection of P on the axis A, the vectors HP and HP' satisfy: HP' = Ratio * HP.

	:param A:
	:type A: gp_Ax2d
	:param Ratio:
	:type Ratio: float
	:rtype: None
") SetAffinity;
		void SetAffinity (const gp_Ax2d & A,const Standard_Real Ratio);
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	* Replaces the coefficient (Row, Col) of the matrix representing this transformation by Value, Raises OutOfRange if Row < 1 or Row > 2 or Col < 1 or Col > 3

	:param Row:
	:type Row: int
	:param Col:
	:type Col: int
	:param Value:
	:type Value: float
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Row,const Standard_Integer Col,const Standard_Real Value);
		%feature("compactdefaultargs") SetTranslationPart;
		%feature("autodoc", "	* Replacesthe translation part of this transformation by the coordinates of the number pair Coord.

	:param Coord:
	:type Coord: gp_XY
	:rtype: None
") SetTranslationPart;
		void SetTranslationPart (const gp_XY & Coord);
		%feature("compactdefaultargs") SetTrsf2d;
		%feature("autodoc", "	* Assigns the vectorial and translation parts of T to this transformation.

	:param T:
	:type T: gp_Trsf2d
	:rtype: None
") SetTrsf2d;
		void SetTrsf2d (const gp_Trsf2d & T);
		%feature("compactdefaultargs") SetVectorialPart;
		%feature("autodoc", "	* Replaces the vectorial part of this transformation by Matrix.

	:param Matrix:
	:type Matrix: gp_Mat2d
	:rtype: None
") SetVectorialPart;
		void SetVectorialPart (const gp_Mat2d & Matrix);
		%feature("compactdefaultargs") IsNegative;
		%feature("autodoc", "	* Returns true if the determinant of the vectorial part of this transformation is negative.

	:rtype: bool
") IsNegative;
		Standard_Boolean IsNegative ();
		%feature("compactdefaultargs") IsSingular;
		%feature("autodoc", "	* Returns true if this transformation is singular (and therefore, cannot be inverted). Note: The Gauss LU decomposition is used to invert the transformation matrix. Consequently, the transformation is considered as singular if the largest pivot found is less than or equal to gp::Resolution(). Warning If this transformation is singular, it cannot be inverted.

	:rtype: bool
") IsSingular;
		Standard_Boolean IsSingular ();
		%feature("compactdefaultargs") Form;
		%feature("autodoc", "	* Returns the nature of the transformation. It can be an identity transformation, a rotation, a translation, a mirror transformation (relative to a point or axis), a scaling transformation, a compound transformation or some other type of transformation.

	:rtype: gp_TrsfForm
") Form;
		gp_TrsfForm Form ();
		%feature("compactdefaultargs") TranslationPart;
		%feature("autodoc", "	* Returns the translation part of the GTrsf2d.

	:rtype: gp_XY
") TranslationPart;
		const gp_XY  TranslationPart ();
		%feature("compactdefaultargs") VectorialPart;
		%feature("autodoc", "	* Computes the vectorial part of the GTrsf2d. The returned Matrix is a 2*2 matrix.

	:rtype: gp_Mat2d
") VectorialPart;
		const gp_Mat2d  VectorialPart ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	* Returns the coefficients of the global matrix of transformation. Raised OutOfRange if Row < 1 or Row > 2 or Col < 1 or Col > 3

	:param Row:
	:type Row: int
	:param Col:
	:type Col: int
	:rtype: float
") Value;
		Standard_Real Value (const Standard_Integer Row,const Standard_Integer Col);
		%feature("compactdefaultargs") Invert;
		%feature("autodoc", "	:rtype: None
") Invert;
		void Invert ();
		%feature("compactdefaultargs") Inverted;
		%feature("autodoc", "	* Computes the reverse transformation. Raised an exception if the matrix of the transformation is not inversible.

	:rtype: gp_GTrsf2d
") Inverted;
		gp_GTrsf2d Inverted ();
		%feature("compactdefaultargs") Multiplied;
		%feature("autodoc", "	* Computes the transformation composed with T and <self>. In a C++ implementation you can also write Tcomposed = <self> * T. Example : GTrsf2d T1, T2, Tcomp; ............... //composition : Tcomp = T2.Multiplied(T1); // or (Tcomp = T2 * T1) // transformation of a point XY P(10.,3.); XY P1(P); Tcomp.Transforms(P1); //using Tcomp XY P2(P); T1.Transforms(P2); //using T1 then T2 T2.Transforms(P2); // P1 = P2 !!!

	:param T:
	:type T: gp_GTrsf2d
	:rtype: gp_GTrsf2d
") Multiplied;
		gp_GTrsf2d Multiplied (const gp_GTrsf2d & T);
		%feature("compactdefaultargs") operator *;
		%feature("autodoc", "	:param T:
	:type T: gp_GTrsf2d
	:rtype: gp_GTrsf2d
") operator *;
		gp_GTrsf2d operator * (const gp_GTrsf2d & T);
		%feature("compactdefaultargs") Multiply;
		%feature("autodoc", "	:param T:
	:type T: gp_GTrsf2d
	:rtype: None
") Multiply;
		void Multiply (const gp_GTrsf2d & T);
		%feature("compactdefaultargs") operator *=;
		%feature("autodoc", "	:param T:
	:type T: gp_GTrsf2d
	:rtype: None
") operator *=;
		void operator *= (const gp_GTrsf2d & T);
		%feature("compactdefaultargs") PreMultiply;
		%feature("autodoc", "	* Computes the product of the transformation T and this transformation, and assigns the result to this transformation: this = T * this

	:param T:
	:type T: gp_GTrsf2d
	:rtype: None
") PreMultiply;
		void PreMultiply (const gp_GTrsf2d & T);
		%feature("compactdefaultargs") Power;
		%feature("autodoc", "	:param N:
	:type N: int
	:rtype: None
") Power;
		void Power (const Standard_Integer N);
		%feature("compactdefaultargs") Powered;
		%feature("autodoc", "	* Computes the following composition of transformations <self> * <self> * .......* <self>, N time. if N = 0 <self> = Identity if N < 0 <self> = <self>.Inverse() *...........* <self>.Inverse(). //! Raises an exception if N < 0 and if the matrix of the transformation is not inversible.

	:param N:
	:type N: int
	:rtype: gp_GTrsf2d
") Powered;
		gp_GTrsf2d Powered (const Standard_Integer N);
		%feature("compactdefaultargs") Transforms;
		%feature("autodoc", "	:param Coord:
	:type Coord: gp_XY
	:rtype: None
") Transforms;
		void Transforms (gp_XY & Coord);
		%feature("compactdefaultargs") Transformed;
		%feature("autodoc", "	:param Coord:
	:type Coord: gp_XY
	:rtype: gp_XY
") Transformed;
		gp_XY Transformed (const gp_XY & Coord);
		%feature("compactdefaultargs") Transforms;
		%feature("autodoc", "	* Applies this transformation to the coordinates: - of the number pair Coord, or - X and Y. //! Note: - Transforms modifies X, Y, or the coordinate pair Coord, while - Transformed creates a new coordinate pair.

	:param X:
	:type X: float &
	:param Y:
	:type Y: float &
	:rtype: None
") Transforms;
		void Transforms (Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") Trsf2d;
		%feature("autodoc", "	* Converts this transformation into a gp_Trsf2d transformation. Exceptions Standard_ConstructionError if this transformation cannot be converted, i.e. if its form is gp_Other.

	:rtype: gp_Trsf2d
") Trsf2d;
		gp_Trsf2d Trsf2d ();
		%feature("compactdefaultargs") _CSFDB_Getgp_GTrsf2dmatrix;
		%feature("autodoc", "	:rtype: gp_Mat2d
") _CSFDB_Getgp_GTrsf2dmatrix;
		const gp_Mat2d  _CSFDB_Getgp_GTrsf2dmatrix ();
		%feature("compactdefaultargs") _CSFDB_Getgp_GTrsf2dloc;
		%feature("autodoc", "	:rtype: gp_XY
") _CSFDB_Getgp_GTrsf2dloc;
		const gp_XY  _CSFDB_Getgp_GTrsf2dloc ();
		%feature("compactdefaultargs") _CSFDB_Getgp_GTrsf2dshape;
		%feature("autodoc", "	:rtype: gp_TrsfForm
") _CSFDB_Getgp_GTrsf2dshape;
		gp_TrsfForm _CSFDB_Getgp_GTrsf2dshape ();
		%feature("compactdefaultargs") _CSFDB_Setgp_GTrsf2dshape;
		%feature("autodoc", "	:param p:
	:type p: gp_TrsfForm
	:rtype: None
") _CSFDB_Setgp_GTrsf2dshape;
		void _CSFDB_Setgp_GTrsf2dshape (const gp_TrsfForm p);
		%feature("compactdefaultargs") _CSFDB_Getgp_GTrsf2dscale;
		%feature("autodoc", "	:rtype: float
") _CSFDB_Getgp_GTrsf2dscale;
		Standard_Real _CSFDB_Getgp_GTrsf2dscale ();
		%feature("compactdefaultargs") _CSFDB_Setgp_GTrsf2dscale;
		%feature("autodoc", "	:param p:
	:type p: float
	:rtype: None
") _CSFDB_Setgp_GTrsf2dscale;
		void _CSFDB_Setgp_GTrsf2dscale (const Standard_Real p);
};


%extend gp_GTrsf2d {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor gp_Hypr;
class gp_Hypr {
	public:
		%feature("compactdefaultargs") gp_Hypr;
		%feature("autodoc", "	* Creates of an indefinite hyperbola.

	:rtype: None
") gp_Hypr;
		 gp_Hypr ();
		%feature("compactdefaultargs") gp_Hypr;
		%feature("autodoc", "	* Creates a hyperbola with radii MajorRadius and MinorRadius, positioned in the space by the coordinate system A2 such that: - the origin of A2 is the center of the hyperbola, - the 'X Direction' of A2 defines the major axis of the hyperbola, that is, the major radius MajorRadius is measured along this axis, and - the 'Y Direction' of A2 defines the minor axis of the hyperbola, that is, the minor radius MinorRadius is measured along this axis. Note: This class does not prevent the creation of a hyperbola where: - MajorAxis is equal to MinorAxis, or - MajorAxis is less than MinorAxis. Exceptions Standard_ConstructionError if MajorAxis or MinorAxis is negative. Raises ConstructionError if MajorRadius < 0.0 or MinorRadius < 0.0 Raised if MajorRadius < 0.0 or MinorRadius < 0.0

	:param A2:
	:type A2: gp_Ax2
	:param MajorRadius:
	:type MajorRadius: float
	:param MinorRadius:
	:type MinorRadius: float
	:rtype: None
") gp_Hypr;
		 gp_Hypr (const gp_Ax2 & A2,const Standard_Real MajorRadius,const Standard_Real MinorRadius);
		%feature("compactdefaultargs") SetAxis;
		%feature("autodoc", "	* Modifies this hyperbola, by redefining its local coordinate system so that: - its origin and 'main Direction' become those of the axis A1 (the 'X Direction' and 'Y Direction' are then recomputed in the same way as for any gp_Ax2). Raises ConstructionError if the direction of A1 is parallel to the direction of the 'XAxis' of the hyperbola.

	:param A1:
	:type A1: gp_Ax1
	:rtype: None
") SetAxis;
		void SetAxis (const gp_Ax1 & A1);
		%feature("compactdefaultargs") SetLocation;
		%feature("autodoc", "	* Modifies this hyperbola, by redefining its local coordinate system so that its origin becomes P.

	:param P:
	:type P: gp_Pnt
	:rtype: None
") SetLocation;
		void SetLocation (const gp_Pnt & P);
		%feature("compactdefaultargs") SetMajorRadius;
		%feature("autodoc", "	* Modifies the major radius of this hyperbola. Exceptions Standard_ConstructionError if MajorRadius is negative.

	:param MajorRadius:
	:type MajorRadius: float
	:rtype: None
") SetMajorRadius;
		void SetMajorRadius (const Standard_Real MajorRadius);
		%feature("compactdefaultargs") SetMinorRadius;
		%feature("autodoc", "	* Modifies the minor radius of this hyperbola. Exceptions Standard_ConstructionError if MinorRadius is negative.

	:param MinorRadius:
	:type MinorRadius: float
	:rtype: None
") SetMinorRadius;
		void SetMinorRadius (const Standard_Real MinorRadius);
		%feature("compactdefaultargs") SetPosition;
		%feature("autodoc", "	* Modifies this hyperbola, by redefining its local coordinate system so that it becomes A2.

	:param A2:
	:type A2: gp_Ax2
	:rtype: None
") SetPosition;
		void SetPosition (const gp_Ax2 & A2);
		%feature("compactdefaultargs") Asymptote1;
		%feature("autodoc", "	* In the local coordinate system of the hyperbola the equation of the hyperbola is (X*X)/(A*A) - (Y*Y)/(B*B) = 1.0 and the equation of the first asymptote is Y = (B/A)*X where A is the major radius and B is the minor radius. Raises ConstructionError if MajorRadius = 0.0

	:rtype: gp_Ax1
") Asymptote1;
		gp_Ax1 Asymptote1 ();
		%feature("compactdefaultargs") Asymptote2;
		%feature("autodoc", "	* In the local coordinate system of the hyperbola the equation of the hyperbola is (X*X)/(A*A) - (Y*Y)/(B*B) = 1.0 and the equation of the first asymptote is Y = -(B/A)*X. where A is the major radius and B is the minor radius. Raises ConstructionError if MajorRadius = 0.0

	:rtype: gp_Ax1
") Asymptote2;
		gp_Ax1 Asymptote2 ();
		%feature("compactdefaultargs") Axis;
		%feature("autodoc", "	* Returns the axis passing through the center, and normal to the plane of this hyperbola.

	:rtype: gp_Ax1
") Axis;
		const gp_Ax1  Axis ();
		%feature("compactdefaultargs") ConjugateBranch1;
		%feature("autodoc", "	* Computes the branch of hyperbola which is on the positive side of the 'YAxis' of <self>.

	:rtype: gp_Hypr
") ConjugateBranch1;
		gp_Hypr ConjugateBranch1 ();
		%feature("compactdefaultargs") ConjugateBranch2;
		%feature("autodoc", "	* Computes the branch of hyperbola which is on the negative side of the 'YAxis' of <self>.

	:rtype: gp_Hypr
") ConjugateBranch2;
		gp_Hypr ConjugateBranch2 ();
		%feature("compactdefaultargs") Directrix1;
		%feature("autodoc", "	* This directrix is the line normal to the XAxis of the hyperbola in the local plane (Z = 0) at a distance d = MajorRadius / e from the center of the hyperbola, where e is the eccentricity of the hyperbola. This line is parallel to the 'YAxis'. The intersection point between the directrix1 and the 'XAxis' is the 'Location' point of the directrix1. This point is on the positive side of the 'XAxis'.

	:rtype: gp_Ax1
") Directrix1;
		gp_Ax1 Directrix1 ();
		%feature("compactdefaultargs") Directrix2;
		%feature("autodoc", "	* This line is obtained by the symmetrical transformation of 'Directrix1' with respect to the 'YAxis' of the hyperbola.

	:rtype: gp_Ax1
") Directrix2;
		gp_Ax1 Directrix2 ();
		%feature("compactdefaultargs") Eccentricity;
		%feature("autodoc", "	* Returns the excentricity of the hyperbola (e > 1). If f is the distance between the location of the hyperbola and the Focus1 then the eccentricity e = f / MajorRadius. Raises DomainError if MajorRadius = 0.0

	:rtype: float
") Eccentricity;
		Standard_Real Eccentricity ();
		%feature("compactdefaultargs") Focal;
		%feature("autodoc", "	* Computes the focal distance. It is the distance between the the two focus of the hyperbola.

	:rtype: float
") Focal;
		Standard_Real Focal ();
		%feature("compactdefaultargs") Focus1;
		%feature("autodoc", "	* Returns the first focus of the hyperbola. This focus is on the positive side of the 'XAxis' of the hyperbola.

	:rtype: gp_Pnt
") Focus1;
		gp_Pnt Focus1 ();
		%feature("compactdefaultargs") Focus2;
		%feature("autodoc", "	* Returns the second focus of the hyperbola. This focus is on the negative side of the 'XAxis' of the hyperbola.

	:rtype: gp_Pnt
") Focus2;
		gp_Pnt Focus2 ();
		%feature("compactdefaultargs") Location;
		%feature("autodoc", "	* Returns the location point of the hyperbola. It is the intersection point between the 'XAxis' and the 'YAxis'.

	:rtype: gp_Pnt
") Location;
		const gp_Pnt  Location ();
		%feature("compactdefaultargs") MajorRadius;
		%feature("autodoc", "	* Returns the major radius of the hyperbola. It is the radius on the 'XAxis' of the hyperbola.

	:rtype: float
") MajorRadius;
		Standard_Real MajorRadius ();
		%feature("compactdefaultargs") MinorRadius;
		%feature("autodoc", "	* Returns the minor radius of the hyperbola. It is the radius on the 'YAxis' of the hyperbola.

	:rtype: float
") MinorRadius;
		Standard_Real MinorRadius ();
		%feature("compactdefaultargs") OtherBranch;
		%feature("autodoc", "	* Returns the branch of hyperbola obtained by doing the symmetrical transformation of <self> with respect to the 'YAxis' of <self>.

	:rtype: gp_Hypr
") OtherBranch;
		gp_Hypr OtherBranch ();
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "	* Returns p = (e * e - 1) * MajorRadius where e is the eccentricity of the hyperbola. Raises DomainError if MajorRadius = 0.0

	:rtype: float
") Parameter;
		Standard_Real Parameter ();
		%feature("compactdefaultargs") Position;
		%feature("autodoc", "	* Returns the coordinate system of the hyperbola.

	:rtype: gp_Ax2
") Position;
		const gp_Ax2  Position ();
		%feature("compactdefaultargs") XAxis;
		%feature("autodoc", "	* Computes an axis, whose - the origin is the center of this hyperbola, and - the unit vector is the 'X Direction' of the local coordinate system of this hyperbola. These axes are, the major axis (the 'X Axis') and of this hyperboReturns the 'XAxis' of the hyperbola.

	:rtype: gp_Ax1
") XAxis;
		gp_Ax1 XAxis ();
		%feature("compactdefaultargs") YAxis;
		%feature("autodoc", "	* Computes an axis, whose - the origin is the center of this hyperbola, and - the unit vector is the 'Y Direction' of the local coordinate system of this hyperbola. These axes are the minor axis (the 'Y Axis') of this hyperbola

	:rtype: gp_Ax1
") YAxis;
		gp_Ax1 YAxis ();
		%feature("compactdefaultargs") Mirror;
		%feature("autodoc", "	:param P:
	:type P: gp_Pnt
	:rtype: None
") Mirror;
		void Mirror (const gp_Pnt & P);
		%feature("compactdefaultargs") Mirrored;
		%feature("autodoc", "	* Performs the symmetrical transformation of an hyperbola with respect to the point P which is the center of the symmetry.

	:param P:
	:type P: gp_Pnt
	:rtype: gp_Hypr
") Mirrored;
		gp_Hypr Mirrored (const gp_Pnt & P);
		%feature("compactdefaultargs") Mirror;
		%feature("autodoc", "	:param A1:
	:type A1: gp_Ax1
	:rtype: None
") Mirror;
		void Mirror (const gp_Ax1 & A1);
		%feature("compactdefaultargs") Mirrored;
		%feature("autodoc", "	* Performs the symmetrical transformation of an hyperbola with respect to an axis placement which is the axis of the symmetry.

	:param A1:
	:type A1: gp_Ax1
	:rtype: gp_Hypr
") Mirrored;
		gp_Hypr Mirrored (const gp_Ax1 & A1);
		%feature("compactdefaultargs") Mirror;
		%feature("autodoc", "	:param A2:
	:type A2: gp_Ax2
	:rtype: None
") Mirror;
		void Mirror (const gp_Ax2 & A2);
		%feature("compactdefaultargs") Mirrored;
		%feature("autodoc", "	* Performs the symmetrical transformation of an hyperbola with respect to a plane. The axis placement A2 locates the plane of the symmetry (Location, XDirection, YDirection).

	:param A2:
	:type A2: gp_Ax2
	:rtype: gp_Hypr
") Mirrored;
		gp_Hypr Mirrored (const gp_Ax2 & A2);
		%feature("compactdefaultargs") Rotate;
		%feature("autodoc", "	:param A1:
	:type A1: gp_Ax1
	:param Ang:
	:type Ang: float
	:rtype: None
") Rotate;
		void Rotate (const gp_Ax1 & A1,const Standard_Real Ang);
		%feature("compactdefaultargs") Rotated;
		%feature("autodoc", "	* Rotates an hyperbola. A1 is the axis of the rotation. Ang is the angular value of the rotation in radians.

	:param A1:
	:type A1: gp_Ax1
	:param Ang:
	:type Ang: float
	:rtype: gp_Hypr
") Rotated;
		gp_Hypr Rotated (const gp_Ax1 & A1,const Standard_Real Ang);
		%feature("compactdefaultargs") Scale;
		%feature("autodoc", "	:param P:
	:type P: gp_Pnt
	:param S:
	:type S: float
	:rtype: None
") Scale;
		void Scale (const gp_Pnt & P,const Standard_Real S);
		%feature("compactdefaultargs") Scaled;
		%feature("autodoc", "	* Scales an hyperbola. S is the scaling value.

	:param P:
	:type P: gp_Pnt
	:param S:
	:type S: float
	:rtype: gp_Hypr
") Scaled;
		gp_Hypr Scaled (const gp_Pnt & P,const Standard_Real S);
		%feature("compactdefaultargs") Transform;
		%feature("autodoc", "	:param T:
	:type T: gp_Trsf
	:rtype: None
") Transform;
		void Transform (const gp_Trsf & T);
		%feature("compactdefaultargs") Transformed;
		%feature("autodoc", "	* Transforms an hyperbola with the transformation T from class Trsf.

	:param T:
	:type T: gp_Trsf
	:rtype: gp_Hypr
") Transformed;
		gp_Hypr Transformed (const gp_Trsf & T);
		%feature("compactdefaultargs") Translate;
		%feature("autodoc", "	:param V:
	:type V: gp_Vec
	:rtype: None
") Translate;
		void Translate (const gp_Vec & V);
		%feature("compactdefaultargs") Translated;
		%feature("autodoc", "	* Translates an hyperbola in the direction of the vector V. The magnitude of the translation is the vector's magnitude.

	:param V:
	:type V: gp_Vec
	:rtype: gp_Hypr
") Translated;
		gp_Hypr Translated (const gp_Vec & V);
		%feature("compactdefaultargs") Translate;
		%feature("autodoc", "	:param P1:
	:type P1: gp_Pnt
	:param P2:
	:type P2: gp_Pnt
	:rtype: None
") Translate;
		void Translate (const gp_Pnt & P1,const gp_Pnt & P2);
		%feature("compactdefaultargs") Translated;
		%feature("autodoc", "	* Translates an hyperbola from the point P1 to the point P2.

	:param P1:
	:type P1: gp_Pnt
	:param P2:
	:type P2: gp_Pnt
	:rtype: gp_Hypr
") Translated;
		gp_Hypr Translated (const gp_Pnt & P1,const gp_Pnt & P2);
		%feature("compactdefaultargs") _CSFDB_Getgp_Hyprpos;
		%feature("autodoc", "	:rtype: gp_Ax2
") _CSFDB_Getgp_Hyprpos;
		const gp_Ax2  _CSFDB_Getgp_Hyprpos ();
		%feature("compactdefaultargs") _CSFDB_Getgp_HyprmajorRadius;
		%feature("autodoc", "	:rtype: float
") _CSFDB_Getgp_HyprmajorRadius;
		Standard_Real _CSFDB_Getgp_HyprmajorRadius ();
		%feature("compactdefaultargs") _CSFDB_Setgp_HyprmajorRadius;
		%feature("autodoc", "	:param p:
	:type p: float
	:rtype: None
") _CSFDB_Setgp_HyprmajorRadius;
		void _CSFDB_Setgp_HyprmajorRadius (const Standard_Real p);
		%feature("compactdefaultargs") _CSFDB_Getgp_HyprminorRadius;
		%feature("autodoc", "	:rtype: float
") _CSFDB_Getgp_HyprminorRadius;
		Standard_Real _CSFDB_Getgp_HyprminorRadius ();
		%feature("compactdefaultargs") _CSFDB_Setgp_HyprminorRadius;
		%feature("autodoc", "	:param p:
	:type p: float
	:rtype: None
") _CSFDB_Setgp_HyprminorRadius;
		void _CSFDB_Setgp_HyprminorRadius (const Standard_Real p);
};


%extend gp_Hypr {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor gp_Hypr2d;
class gp_Hypr2d {
	public:
		%feature("compactdefaultargs") gp_Hypr2d;
		%feature("autodoc", "	* Creates of an indefinite hyperbola.

	:rtype: None
") gp_Hypr2d;
		 gp_Hypr2d ();
		%feature("compactdefaultargs") gp_Hypr2d;
		%feature("autodoc", "	* Creates a hyperbola with radii MajorRadius and MinorRadius, centered on the origin of MajorAxis and where the unit vector of MajorAxis is the 'X Direction' of the local coordinate system of the hyperbola. This coordinate system is direct if Sense is true (the default value), and indirect if Sense is false. Warnings : It is yet possible to create an Hyperbola with MajorRadius <= MinorRadius. Raises ConstructionError if MajorRadius < 0.0 or MinorRadius < 0.0

	:param MajorAxis:
	:type MajorAxis: gp_Ax2d
	:param MajorRadius:
	:type MajorRadius: float
	:param MinorRadius:
	:type MinorRadius: float
	:param Sense: default value is Standard_True
	:type Sense: bool
	:rtype: None
") gp_Hypr2d;
		 gp_Hypr2d (const gp_Ax2d & MajorAxis,const Standard_Real MajorRadius,const Standard_Real MinorRadius,const Standard_Boolean Sense = Standard_True);
		%feature("compactdefaultargs") gp_Hypr2d;
		%feature("autodoc", "	* a hyperbola with radii MajorRadius and MinorRadius, positioned in the plane by coordinate system A where: - the origin of A is the center of the hyperbola, - the 'X Direction' of A defines the major axis of the hyperbola, that is, the major radius MajorRadius is measured along this axis, and - the 'Y Direction' of A defines the minor axis of the hyperbola, that is, the minor radius MinorRadius is measured along this axis, and - the orientation (direct or indirect sense) of A gives the implicit orientation of the hyperbola. Warnings : It is yet possible to create an Hyperbola with MajorRadius <= MinorRadius. Raises ConstructionError if MajorRadius < 0.0 or MinorRadius < 0.0

	:param A:
	:type A: gp_Ax22d
	:param MajorRadius:
	:type MajorRadius: float
	:param MinorRadius:
	:type MinorRadius: float
	:rtype: None
") gp_Hypr2d;
		 gp_Hypr2d (const gp_Ax22d & A,const Standard_Real MajorRadius,const Standard_Real MinorRadius);
		%feature("compactdefaultargs") SetLocation;
		%feature("autodoc", "	* Modifies this hyperbola, by redefining its local coordinate system so that its origin becomes P.

	:param P:
	:type P: gp_Pnt2d
	:rtype: None
") SetLocation;
		void SetLocation (const gp_Pnt2d & P);
		%feature("compactdefaultargs") SetMajorRadius;
		%feature("autodoc", "	* Modifies the major or minor radius of this hyperbola. Exceptions Standard_ConstructionError if MajorRadius or MinorRadius is negative.

	:param MajorRadius:
	:type MajorRadius: float
	:rtype: None
") SetMajorRadius;
		void SetMajorRadius (const Standard_Real MajorRadius);
		%feature("compactdefaultargs") SetMinorRadius;
		%feature("autodoc", "	* Modifies the major or minor radius of this hyperbola. Exceptions Standard_ConstructionError if MajorRadius or MinorRadius is negative.

	:param MinorRadius:
	:type MinorRadius: float
	:rtype: None
") SetMinorRadius;
		void SetMinorRadius (const Standard_Real MinorRadius);
		%feature("compactdefaultargs") SetAxis;
		%feature("autodoc", "	* Modifies this hyperbola, by redefining its local coordinate system so that it becomes A.

	:param A:
	:type A: gp_Ax22d
	:rtype: None
") SetAxis;
		void SetAxis (const gp_Ax22d & A);
		%feature("compactdefaultargs") SetXAxis;
		%feature("autodoc", "	* Changes the major axis of the hyperbola. The minor axis is recomputed and the location of the hyperbola too.

	:param A:
	:type A: gp_Ax2d
	:rtype: None
") SetXAxis;
		void SetXAxis (const gp_Ax2d & A);
		%feature("compactdefaultargs") SetYAxis;
		%feature("autodoc", "	* Changes the minor axis of the hyperbola.The minor axis is recomputed and the location of the hyperbola too.

	:param A:
	:type A: gp_Ax2d
	:rtype: None
") SetYAxis;
		void SetYAxis (const gp_Ax2d & A);
		%feature("compactdefaultargs") Asymptote1;
		%feature("autodoc", "	* In the local coordinate system of the hyperbola the equation of the hyperbola is (X*X)/(A*A) - (Y*Y)/(B*B) = 1.0 and the equation of the first asymptote is Y = (B/A)*X where A is the major radius of the hyperbola and B the minor radius of the hyperbola. Raises ConstructionError if MajorRadius = 0.0

	:rtype: gp_Ax2d
") Asymptote1;
		gp_Ax2d Asymptote1 ();
		%feature("compactdefaultargs") Asymptote2;
		%feature("autodoc", "	* In the local coordinate system of the hyperbola the equation of the hyperbola is (X*X)/(A*A) - (Y*Y)/(B*B) = 1.0 and the equation of the first asymptote is Y = -(B/A)*X where A is the major radius of the hyperbola and B the minor radius of the hyperbola. Raises ConstructionError if MajorRadius = 0.0

	:rtype: gp_Ax2d
") Asymptote2;
		gp_Ax2d Asymptote2 ();
		%feature("compactdefaultargs") Coefficients;
		%feature("autodoc", "	* Computes the coefficients of the implicit equation of the hyperbola : A * (X**2) + B * (Y**2) + 2*C*(X*Y) + 2*D*X + 2*E*Y + F = 0.

	:param A:
	:type A: float &
	:param B:
	:type B: float &
	:param C:
	:type C: float &
	:param D:
	:type D: float &
	:param E:
	:type E: float &
	:param F:
	:type F: float &
	:rtype: None
") Coefficients;
		void Coefficients (Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") ConjugateBranch1;
		%feature("autodoc", "	* Computes the branch of hyperbola which is on the positive side of the 'YAxis' of <self>.

	:rtype: gp_Hypr2d
") ConjugateBranch1;
		gp_Hypr2d ConjugateBranch1 ();
		%feature("compactdefaultargs") ConjugateBranch2;
		%feature("autodoc", "	* Computes the branch of hyperbola which is on the negative side of the 'YAxis' of <self>.

	:rtype: gp_Hypr2d
") ConjugateBranch2;
		gp_Hypr2d ConjugateBranch2 ();
		%feature("compactdefaultargs") Directrix1;
		%feature("autodoc", "	* Computes the directrix which is the line normal to the XAxis of the hyperbola in the local plane (Z = 0) at a distance d = MajorRadius / e from the center of the hyperbola, where e is the eccentricity of the hyperbola. This line is parallel to the 'YAxis'. The intersection point between the 'Directrix1' and the 'XAxis' is the 'Location' point of the 'Directrix1'. This point is on the positive side of the 'XAxis'.

	:rtype: gp_Ax2d
") Directrix1;
		gp_Ax2d Directrix1 ();
		%feature("compactdefaultargs") Directrix2;
		%feature("autodoc", "	* This line is obtained by the symmetrical transformation of 'Directrix1' with respect to the 'YAxis' of the hyperbola.

	:rtype: gp_Ax2d
") Directrix2;
		gp_Ax2d Directrix2 ();
		%feature("compactdefaultargs") Eccentricity;
		%feature("autodoc", "	* Returns the excentricity of the hyperbola (e > 1). If f is the distance between the location of the hyperbola and the Focus1 then the eccentricity e = f / MajorRadius. Raises DomainError if MajorRadius = 0.0.

	:rtype: float
") Eccentricity;
		Standard_Real Eccentricity ();
		%feature("compactdefaultargs") Focal;
		%feature("autodoc", "	* Computes the focal distance. It is the distance between the 'Location' of the hyperbola and 'Focus1' or 'Focus2'.

	:rtype: float
") Focal;
		Standard_Real Focal ();
		%feature("compactdefaultargs") Focus1;
		%feature("autodoc", "	* Returns the first focus of the hyperbola. This focus is on the positive side of the 'XAxis' of the hyperbola.

	:rtype: gp_Pnt2d
") Focus1;
		gp_Pnt2d Focus1 ();
		%feature("compactdefaultargs") Focus2;
		%feature("autodoc", "	* Returns the second focus of the hyperbola. This focus is on the negative side of the 'XAxis' of the hyperbola.

	:rtype: gp_Pnt2d
") Focus2;
		gp_Pnt2d Focus2 ();
		%feature("compactdefaultargs") Location;
		%feature("autodoc", "	* Returns the location point of the hyperbola. It is the intersection point between the 'XAxis' and the 'YAxis'.

	:rtype: gp_Pnt2d
") Location;
		const gp_Pnt2d  Location ();
		%feature("compactdefaultargs") MajorRadius;
		%feature("autodoc", "	* Returns the major radius of the hyperbola (it is the radius corresponding to the 'XAxis' of the hyperbola).

	:rtype: float
") MajorRadius;
		Standard_Real MajorRadius ();
		%feature("compactdefaultargs") MinorRadius;
		%feature("autodoc", "	* Returns the minor radius of the hyperbola (it is the radius corresponding to the 'YAxis' of the hyperbola).

	:rtype: float
") MinorRadius;
		Standard_Real MinorRadius ();
		%feature("compactdefaultargs") OtherBranch;
		%feature("autodoc", "	* Returns the branch of hyperbola obtained by doing the symmetrical transformation of <self> with respect to the 'YAxis' of <self>.

	:rtype: gp_Hypr2d
") OtherBranch;
		gp_Hypr2d OtherBranch ();
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "	* Returns p = (e * e - 1) * MajorRadius where e is the eccentricity of the hyperbola. Raises DomainError if MajorRadius = 0.0

	:rtype: float
") Parameter;
		Standard_Real Parameter ();
		%feature("compactdefaultargs") Axis;
		%feature("autodoc", "	* Returns the axisplacement of the hyperbola.

	:rtype: gp_Ax22d
") Axis;
		const gp_Ax22d  Axis ();
		%feature("compactdefaultargs") XAxis;
		%feature("autodoc", "	* Computes an axis whose - the origin is the center of this hyperbola, and - the unit vector is the 'X Direction' or 'Y Direction' respectively of the local coordinate system of this hyperbola Returns the major axis of the hyperbola.

	:rtype: gp_Ax2d
") XAxis;
		gp_Ax2d XAxis ();
		%feature("compactdefaultargs") YAxis;
		%feature("autodoc", "	* Computes an axis whose - the origin is the center of this hyperbola, and - the unit vector is the 'X Direction' or 'Y Direction' respectively of the local coordinate system of this hyperbola Returns the minor axis of the hyperbola.

	:rtype: gp_Ax2d
") YAxis;
		gp_Ax2d YAxis ();
		%feature("compactdefaultargs") Reverse;
		%feature("autodoc", "	:rtype: None
") Reverse;
		void Reverse ();
		%feature("compactdefaultargs") Reversed;
		%feature("autodoc", "	* Reverses the orientation of the local coordinate system of this hyperbola (the 'Y Axis' is reversed). Therefore, the implicit orientation of this hyperbola is reversed. Note: - Reverse assigns the result to this hyperbola, while - Reversed creates a new one.

	:rtype: gp_Hypr2d
") Reversed;
		gp_Hypr2d Reversed ();
		%feature("compactdefaultargs") IsDirect;
		%feature("autodoc", "	* Returns true if the local coordinate system is direct and false in the other case.

	:rtype: bool
") IsDirect;
		Standard_Boolean IsDirect ();
		%feature("compactdefaultargs") Mirror;
		%feature("autodoc", "	:param P:
	:type P: gp_Pnt2d
	:rtype: None
") Mirror;
		void Mirror (const gp_Pnt2d & P);
		%feature("compactdefaultargs") Mirrored;
		%feature("autodoc", "	* Performs the symmetrical transformation of an hyperbola with respect to the point P which is the center of the symmetry.

	:param P:
	:type P: gp_Pnt2d
	:rtype: gp_Hypr2d
") Mirrored;
		gp_Hypr2d Mirrored (const gp_Pnt2d & P);
		%feature("compactdefaultargs") Mirror;
		%feature("autodoc", "	:param A:
	:type A: gp_Ax2d
	:rtype: None
") Mirror;
		void Mirror (const gp_Ax2d & A);
		%feature("compactdefaultargs") Mirrored;
		%feature("autodoc", "	* Performs the symmetrical transformation of an hyperbola with respect to an axis placement which is the axis of the symmetry.

	:param A:
	:type A: gp_Ax2d
	:rtype: gp_Hypr2d
") Mirrored;
		gp_Hypr2d Mirrored (const gp_Ax2d & A);
		%feature("compactdefaultargs") Rotate;
		%feature("autodoc", "	:param P:
	:type P: gp_Pnt2d
	:param Ang:
	:type Ang: float
	:rtype: None
") Rotate;
		void Rotate (const gp_Pnt2d & P,const Standard_Real Ang);
		%feature("compactdefaultargs") Rotated;
		%feature("autodoc", "	* Rotates an hyperbola. P is the center of the rotation. Ang is the angular value of the rotation in radians.

	:param P:
	:type P: gp_Pnt2d
	:param Ang:
	:type Ang: float
	:rtype: gp_Hypr2d
") Rotated;
		gp_Hypr2d Rotated (const gp_Pnt2d & P,const Standard_Real Ang);
		%feature("compactdefaultargs") Scale;
		%feature("autodoc", "	:param P:
	:type P: gp_Pnt2d
	:param S:
	:type S: float
	:rtype: None
") Scale;
		void Scale (const gp_Pnt2d & P,const Standard_Real S);
		%feature("compactdefaultargs") Scaled;
		%feature("autodoc", "	* Scales an hyperbola. <S> is the scaling value. If <S> is positive only the location point is modified. But if <S> is negative the 'XAxis' is reversed and the 'YAxis' too.

	:param P:
	:type P: gp_Pnt2d
	:param S:
	:type S: float
	:rtype: gp_Hypr2d
") Scaled;
		gp_Hypr2d Scaled (const gp_Pnt2d & P,const Standard_Real S);
		%feature("compactdefaultargs") Transform;
		%feature("autodoc", "	:param T:
	:type T: gp_Trsf2d
	:rtype: None
") Transform;
		void Transform (const gp_Trsf2d & T);
		%feature("compactdefaultargs") Transformed;
		%feature("autodoc", "	* Transforms an hyperbola with the transformation T from class Trsf2d.

	:param T:
	:type T: gp_Trsf2d
	:rtype: gp_Hypr2d
") Transformed;
		gp_Hypr2d Transformed (const gp_Trsf2d & T);
		%feature("compactdefaultargs") Translate;
		%feature("autodoc", "	:param V:
	:type V: gp_Vec2d
	:rtype: None
") Translate;
		void Translate (const gp_Vec2d & V);
		%feature("compactdefaultargs") Translated;
		%feature("autodoc", "	* Translates an hyperbola in the direction of the vector V. The magnitude of the translation is the vector's magnitude.

	:param V:
	:type V: gp_Vec2d
	:rtype: gp_Hypr2d
") Translated;
		gp_Hypr2d Translated (const gp_Vec2d & V);
		%feature("compactdefaultargs") Translate;
		%feature("autodoc", "	:param P1:
	:type P1: gp_Pnt2d
	:param P2:
	:type P2: gp_Pnt2d
	:rtype: None
") Translate;
		void Translate (const gp_Pnt2d & P1,const gp_Pnt2d & P2);
		%feature("compactdefaultargs") Translated;
		%feature("autodoc", "	* Translates an hyperbola from the point P1 to the point P2.

	:param P1:
	:type P1: gp_Pnt2d
	:param P2:
	:type P2: gp_Pnt2d
	:rtype: gp_Hypr2d
") Translated;
		gp_Hypr2d Translated (const gp_Pnt2d & P1,const gp_Pnt2d & P2);
		%feature("compactdefaultargs") _CSFDB_Getgp_Hypr2dpos;
		%feature("autodoc", "	:rtype: gp_Ax22d
") _CSFDB_Getgp_Hypr2dpos;
		const gp_Ax22d  _CSFDB_Getgp_Hypr2dpos ();
		%feature("compactdefaultargs") _CSFDB_Getgp_Hypr2dmajorRadius;
		%feature("autodoc", "	:rtype: float
") _CSFDB_Getgp_Hypr2dmajorRadius;
		Standard_Real _CSFDB_Getgp_Hypr2dmajorRadius ();
		%feature("compactdefaultargs") _CSFDB_Setgp_Hypr2dmajorRadius;
		%feature("autodoc", "	:param p:
	:type p: float
	:rtype: None
") _CSFDB_Setgp_Hypr2dmajorRadius;
		void _CSFDB_Setgp_Hypr2dmajorRadius (const Standard_Real p);
		%feature("compactdefaultargs") _CSFDB_Getgp_Hypr2dminorRadius;
		%feature("autodoc", "	:rtype: float
") _CSFDB_Getgp_Hypr2dminorRadius;
		Standard_Real _CSFDB_Getgp_Hypr2dminorRadius ();
		%feature("compactdefaultargs") _CSFDB_Setgp_Hypr2dminorRadius;
		%feature("autodoc", "	:param p:
	:type p: float
	:rtype: None
") _CSFDB_Setgp_Hypr2dminorRadius;
		void _CSFDB_Setgp_Hypr2dminorRadius (const Standard_Real p);
};


%extend gp_Hypr2d {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor gp_Lin;
class gp_Lin {
	public:
		%feature("compactdefaultargs") gp_Lin;
		%feature("autodoc", "	* Creates a Line corresponding to Z axis of the reference coordinate system.

	:rtype: None
") gp_Lin;
		 gp_Lin ();
		%feature("compactdefaultargs") gp_Lin;
		%feature("autodoc", "	* Creates a line defined by axis A1.

	:param A1:
	:type A1: gp_Ax1
	:rtype: None
") gp_Lin;
		 gp_Lin (const gp_Ax1 & A1);
		%feature("compactdefaultargs") gp_Lin;
		%feature("autodoc", "	* Creates a line passing through point P and parallel to vector V (P and V are, respectively, the origin and the unit vector of the positioning axis of the line).

	:param P:
	:type P: gp_Pnt
	:param V:
	:type V: gp_Dir
	:rtype: None
") gp_Lin;
		 gp_Lin (const gp_Pnt & P,const gp_Dir & V);
		%feature("compactdefaultargs") Reverse;
		%feature("autodoc", "	:rtype: None
") Reverse;
		void Reverse ();
		%feature("compactdefaultargs") Reversed;
		%feature("autodoc", "	* Reverses the direction of the line. Note: - Reverse assigns the result to this line, while - Reversed creates a new one.

	:rtype: gp_Lin
") Reversed;
		gp_Lin Reversed ();
		%feature("compactdefaultargs") SetDirection;
		%feature("autodoc", "	* Changes the direction of the line.

	:param V:
	:type V: gp_Dir
	:rtype: None
") SetDirection;
		void SetDirection (const gp_Dir & V);
		%feature("compactdefaultargs") SetLocation;
		%feature("autodoc", "	* Changes the location point (origin) of the line.

	:param P:
	:type P: gp_Pnt
	:rtype: None
") SetLocation;
		void SetLocation (const gp_Pnt & P);
		%feature("compactdefaultargs") SetPosition;
		%feature("autodoc", "	* Complete redefinition of the line. The 'Location' point of <A1> is the origin of the line. The 'Direction' of <A1> is the direction of the line.

	:param A1:
	:type A1: gp_Ax1
	:rtype: None
") SetPosition;
		void SetPosition (const gp_Ax1 & A1);
		%feature("compactdefaultargs") Direction;
		%feature("autodoc", "	* Returns the direction of the line.

	:rtype: gp_Dir
") Direction;
		const gp_Dir  Direction ();
		%feature("compactdefaultargs") Location;
		%feature("autodoc", "	* Returns the location point (origin) of the line.

	:rtype: gp_Pnt
") Location;
		const gp_Pnt  Location ();
		%feature("compactdefaultargs") Position;
		%feature("autodoc", "	* Returns the axis placement one axis whith the same location and direction as <self>.

	:rtype: gp_Ax1
") Position;
		const gp_Ax1  Position ();
		%feature("compactdefaultargs") Angle;
		%feature("autodoc", "	* Computes the angle between two lines in radians.

	:param Other:
	:type Other: gp_Lin
	:rtype: float
") Angle;
		Standard_Real Angle (const gp_Lin & Other);
		%feature("compactdefaultargs") Contains;
		%feature("autodoc", "	* Returns true if this line contains the point P, that is, if the distance between point P and this line is less than or equal to LinearTolerance..

	:param P:
	:type P: gp_Pnt
	:param LinearTolerance:
	:type LinearTolerance: float
	:rtype: bool
") Contains;
		Standard_Boolean Contains (const gp_Pnt & P,const Standard_Real LinearTolerance);
		%feature("compactdefaultargs") Distance;
		%feature("autodoc", "	* Computes the distance between <self> and the point P.

	:param P:
	:type P: gp_Pnt
	:rtype: float
") Distance;
		Standard_Real Distance (const gp_Pnt & P);
		%feature("compactdefaultargs") Distance;
		%feature("autodoc", "	* Computes the distance between two lines.

	:param Other:
	:type Other: gp_Lin
	:rtype: float
") Distance;
		Standard_Real Distance (const gp_Lin & Other);
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "	* Computes the square distance between <self> and the point P.

	:param P:
	:type P: gp_Pnt
	:rtype: float
") SquareDistance;
		Standard_Real SquareDistance (const gp_Pnt & P);
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "	* Computes the square distance between two lines.

	:param Other:
	:type Other: gp_Lin
	:rtype: float
") SquareDistance;
		Standard_Real SquareDistance (const gp_Lin & Other);
		%feature("compactdefaultargs") Normal;
		%feature("autodoc", "	* Computes the line normal to the direction of <self>, passing through the point P. Raises ConstructionError if the distance between <self> and the point P is lower or equal to Resolution from gp because there is an infinity of solutions in 3D space.

	:param P:
	:type P: gp_Pnt
	:rtype: gp_Lin
") Normal;
		gp_Lin Normal (const gp_Pnt & P);
		%feature("compactdefaultargs") Mirror;
		%feature("autodoc", "	:param P:
	:type P: gp_Pnt
	:rtype: None
") Mirror;
		void Mirror (const gp_Pnt & P);
		%feature("compactdefaultargs") Mirrored;
		%feature("autodoc", "	* Performs the symmetrical transformation of a line with respect to the point P which is the center of the symmetry.

	:param P:
	:type P: gp_Pnt
	:rtype: gp_Lin
") Mirrored;
		gp_Lin Mirrored (const gp_Pnt & P);
		%feature("compactdefaultargs") Mirror;
		%feature("autodoc", "	:param A1:
	:type A1: gp_Ax1
	:rtype: None
") Mirror;
		void Mirror (const gp_Ax1 & A1);
		%feature("compactdefaultargs") Mirrored;
		%feature("autodoc", "	* Performs the symmetrical transformation of a line with respect to an axis placement which is the axis of the symmetry.

	:param A1:
	:type A1: gp_Ax1
	:rtype: gp_Lin
") Mirrored;
		gp_Lin Mirrored (const gp_Ax1 & A1);
		%feature("compactdefaultargs") Mirror;
		%feature("autodoc", "	:param A2:
	:type A2: gp_Ax2
	:rtype: None
") Mirror;
		void Mirror (const gp_Ax2 & A2);
		%feature("compactdefaultargs") Mirrored;
		%feature("autodoc", "	* Performs the symmetrical transformation of a line with respect to a plane. The axis placement <A2> locates the plane of the symmetry : (Location, XDirection, YDirection).

	:param A2:
	:type A2: gp_Ax2
	:rtype: gp_Lin
") Mirrored;
		gp_Lin Mirrored (const gp_Ax2 & A2);
		%feature("compactdefaultargs") Rotate;
		%feature("autodoc", "	:param A1:
	:type A1: gp_Ax1
	:param Ang:
	:type Ang: float
	:rtype: None
") Rotate;
		void Rotate (const gp_Ax1 & A1,const Standard_Real Ang);
		%feature("compactdefaultargs") Rotated;
		%feature("autodoc", "	* Rotates a line. A1 is the axis of the rotation. Ang is the angular value of the rotation in radians.

	:param A1:
	:type A1: gp_Ax1
	:param Ang:
	:type Ang: float
	:rtype: gp_Lin
") Rotated;
		gp_Lin Rotated (const gp_Ax1 & A1,const Standard_Real Ang);
		%feature("compactdefaultargs") Scale;
		%feature("autodoc", "	:param P:
	:type P: gp_Pnt
	:param S:
	:type S: float
	:rtype: None
") Scale;
		void Scale (const gp_Pnt & P,const Standard_Real S);
		%feature("compactdefaultargs") Scaled;
		%feature("autodoc", "	* Scales a line. S is the scaling value. The 'Location' point (origin) of the line is modified. The 'Direction' is reversed if the scale is negative.

	:param P:
	:type P: gp_Pnt
	:param S:
	:type S: float
	:rtype: gp_Lin
") Scaled;
		gp_Lin Scaled (const gp_Pnt & P,const Standard_Real S);
		%feature("compactdefaultargs") Transform;
		%feature("autodoc", "	:param T:
	:type T: gp_Trsf
	:rtype: None
") Transform;
		void Transform (const gp_Trsf & T);
		%feature("compactdefaultargs") Transformed;
		%feature("autodoc", "	* Transforms a line with the transformation T from class Trsf.

	:param T:
	:type T: gp_Trsf
	:rtype: gp_Lin
") Transformed;
		gp_Lin Transformed (const gp_Trsf & T);
		%feature("compactdefaultargs") Translate;
		%feature("autodoc", "	:param V:
	:type V: gp_Vec
	:rtype: None
") Translate;
		void Translate (const gp_Vec & V);
		%feature("compactdefaultargs") Translated;
		%feature("autodoc", "	* Translates a line in the direction of the vector V. The magnitude of the translation is the vector's magnitude.

	:param V:
	:type V: gp_Vec
	:rtype: gp_Lin
") Translated;
		gp_Lin Translated (const gp_Vec & V);
		%feature("compactdefaultargs") Translate;
		%feature("autodoc", "	:param P1:
	:type P1: gp_Pnt
	:param P2:
	:type P2: gp_Pnt
	:rtype: None
") Translate;
		void Translate (const gp_Pnt & P1,const gp_Pnt & P2);
		%feature("compactdefaultargs") Translated;
		%feature("autodoc", "	* Translates a line from the point P1 to the point P2.

	:param P1:
	:type P1: gp_Pnt
	:param P2:
	:type P2: gp_Pnt
	:rtype: gp_Lin
") Translated;
		gp_Lin Translated (const gp_Pnt & P1,const gp_Pnt & P2);
		%feature("compactdefaultargs") _CSFDB_Getgp_Linpos;
		%feature("autodoc", "	:rtype: gp_Ax1
") _CSFDB_Getgp_Linpos;
		const gp_Ax1  _CSFDB_Getgp_Linpos ();
};


%extend gp_Lin {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor gp_Lin2d;
class gp_Lin2d {
	public:
		%feature("compactdefaultargs") gp_Lin2d;
		%feature("autodoc", "	* Creates a Line corresponding to X axis of the reference coordinate system.

	:rtype: None
") gp_Lin2d;
		 gp_Lin2d ();
		%feature("compactdefaultargs") gp_Lin2d;
		%feature("autodoc", "	* Creates a line located with A.

	:param A:
	:type A: gp_Ax2d
	:rtype: None
") gp_Lin2d;
		 gp_Lin2d (const gp_Ax2d & A);
		%feature("compactdefaultargs") gp_Lin2d;
		%feature("autodoc", "	* <P> is the location point (origin) of the line and <V> is the direction of the line.

	:param P:
	:type P: gp_Pnt2d
	:param V:
	:type V: gp_Dir2d
	:rtype: None
") gp_Lin2d;
		 gp_Lin2d (const gp_Pnt2d & P,const gp_Dir2d & V);
		%feature("compactdefaultargs") gp_Lin2d;
		%feature("autodoc", "	* Creates the line from the equation A*X + B*Y + C = 0.0 Raises ConstructionError if Sqrt(A*A + B*B) <= Resolution from gp. Raised if Sqrt(A*A + B*B) <= Resolution from gp.

	:param A:
	:type A: float
	:param B:
	:type B: float
	:param C:
	:type C: float
	:rtype: None
") gp_Lin2d;
		 gp_Lin2d (const Standard_Real A,const Standard_Real B,const Standard_Real C);
		%feature("compactdefaultargs") Reverse;
		%feature("autodoc", "	:rtype: None
") Reverse;
		void Reverse ();
		%feature("compactdefaultargs") Reversed;
		%feature("autodoc", "	* Reverses the positioning axis of this line. Note: - Reverse assigns the result to this line, while - Reversed creates a new one.

	:rtype: gp_Lin2d
") Reversed;
		gp_Lin2d Reversed ();
		%feature("compactdefaultargs") SetDirection;
		%feature("autodoc", "	* Changes the direction of the line.

	:param V:
	:type V: gp_Dir2d
	:rtype: None
") SetDirection;
		void SetDirection (const gp_Dir2d & V);
		%feature("compactdefaultargs") SetLocation;
		%feature("autodoc", "	* Changes the origin of the line.

	:param P:
	:type P: gp_Pnt2d
	:rtype: None
") SetLocation;
		void SetLocation (const gp_Pnt2d & P);
		%feature("compactdefaultargs") SetPosition;
		%feature("autodoc", "	* Complete redefinition of the line. The 'Location' point of <A> is the origin of the line. The 'Direction' of <A> is the direction of the line.

	:param A:
	:type A: gp_Ax2d
	:rtype: None
") SetPosition;
		void SetPosition (const gp_Ax2d & A);
		%feature("compactdefaultargs") Coefficients;
		%feature("autodoc", "	* Returns the normalized coefficients of the line : A * X + B * Y + C = 0.

	:param A:
	:type A: float &
	:param B:
	:type B: float &
	:param C:
	:type C: float &
	:rtype: None
") Coefficients;
		void Coefficients (Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") Direction;
		%feature("autodoc", "	* Returns the direction of the line.

	:rtype: gp_Dir2d
") Direction;
		const gp_Dir2d  Direction ();
		%feature("compactdefaultargs") Location;
		%feature("autodoc", "	* Returns the location point (origin) of the line.

	:rtype: gp_Pnt2d
") Location;
		const gp_Pnt2d  Location ();
		%feature("compactdefaultargs") Position;
		%feature("autodoc", "	* Returns the axis placement one axis whith the same location and direction as <self>.

	:rtype: gp_Ax2d
") Position;
		const gp_Ax2d  Position ();
		%feature("compactdefaultargs") Angle;
		%feature("autodoc", "	* Computes the angle between two lines in radians.

	:param Other:
	:type Other: gp_Lin2d
	:rtype: float
") Angle;
		Standard_Real Angle (const gp_Lin2d & Other);
		%feature("compactdefaultargs") Contains;
		%feature("autodoc", "	* Returns true if this line contains the point P, that is, if the distance between point P and this line is less than or equal to LinearTolerance.

	:param P:
	:type P: gp_Pnt2d
	:param LinearTolerance:
	:type LinearTolerance: float
	:rtype: bool
") Contains;
		Standard_Boolean Contains (const gp_Pnt2d & P,const Standard_Real LinearTolerance);
		%feature("compactdefaultargs") Distance;
		%feature("autodoc", "	* Computes the distance between <self> and the point <P>.

	:param P:
	:type P: gp_Pnt2d
	:rtype: float
") Distance;
		Standard_Real Distance (const gp_Pnt2d & P);
		%feature("compactdefaultargs") Distance;
		%feature("autodoc", "	* Computes the distance between two lines.

	:param Other:
	:type Other: gp_Lin2d
	:rtype: float
") Distance;
		Standard_Real Distance (const gp_Lin2d & Other);
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "	* Computes the square distance between <self> and the point <P>.

	:param P:
	:type P: gp_Pnt2d
	:rtype: float
") SquareDistance;
		Standard_Real SquareDistance (const gp_Pnt2d & P);
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "	* Computes the square distance between two lines.

	:param Other:
	:type Other: gp_Lin2d
	:rtype: float
") SquareDistance;
		Standard_Real SquareDistance (const gp_Lin2d & Other);
		%feature("compactdefaultargs") Normal;
		%feature("autodoc", "	* Computes the line normal to the direction of <self>, passing through the point <P>.

	:param P:
	:type P: gp_Pnt2d
	:rtype: gp_Lin2d
") Normal;
		gp_Lin2d Normal (const gp_Pnt2d & P);
		%feature("compactdefaultargs") Mirror;
		%feature("autodoc", "	:param P:
	:type P: gp_Pnt2d
	:rtype: None
") Mirror;
		void Mirror (const gp_Pnt2d & P);
		%feature("compactdefaultargs") Mirrored;
		%feature("autodoc", "	* Performs the symmetrical transformation of a line with respect to the point <P> which is the center of the symmetry

	:param P:
	:type P: gp_Pnt2d
	:rtype: gp_Lin2d
") Mirrored;
		gp_Lin2d Mirrored (const gp_Pnt2d & P);
		%feature("compactdefaultargs") Mirror;
		%feature("autodoc", "	:param A:
	:type A: gp_Ax2d
	:rtype: None
") Mirror;
		void Mirror (const gp_Ax2d & A);
		%feature("compactdefaultargs") Mirrored;
		%feature("autodoc", "	* Performs the symmetrical transformation of a line with respect to an axis placement which is the axis of the symmetry.

	:param A:
	:type A: gp_Ax2d
	:rtype: gp_Lin2d
") Mirrored;
		gp_Lin2d Mirrored (const gp_Ax2d & A);
		%feature("compactdefaultargs") Rotate;
		%feature("autodoc", "	:param P:
	:type P: gp_Pnt2d
	:param Ang:
	:type Ang: float
	:rtype: None
") Rotate;
		void Rotate (const gp_Pnt2d & P,const Standard_Real Ang);
		%feature("compactdefaultargs") Rotated;
		%feature("autodoc", "	* Rotates a line. P is the center of the rotation. Ang is the angular value of the rotation in radians.

	:param P:
	:type P: gp_Pnt2d
	:param Ang:
	:type Ang: float
	:rtype: gp_Lin2d
") Rotated;
		gp_Lin2d Rotated (const gp_Pnt2d & P,const Standard_Real Ang);
		%feature("compactdefaultargs") Scale;
		%feature("autodoc", "	:param P:
	:type P: gp_Pnt2d
	:param S:
	:type S: float
	:rtype: None
") Scale;
		void Scale (const gp_Pnt2d & P,const Standard_Real S);
		%feature("compactdefaultargs") Scaled;
		%feature("autodoc", "	* Scales a line. S is the scaling value. Only the origin of the line is modified.

	:param P:
	:type P: gp_Pnt2d
	:param S:
	:type S: float
	:rtype: gp_Lin2d
") Scaled;
		gp_Lin2d Scaled (const gp_Pnt2d & P,const Standard_Real S);
		%feature("compactdefaultargs") Transform;
		%feature("autodoc", "	:param T:
	:type T: gp_Trsf2d
	:rtype: None
") Transform;
		void Transform (const gp_Trsf2d & T);
		%feature("compactdefaultargs") Transformed;
		%feature("autodoc", "	* Transforms a line with the transformation T from class Trsf2d.

	:param T:
	:type T: gp_Trsf2d
	:rtype: gp_Lin2d
") Transformed;
		gp_Lin2d Transformed (const gp_Trsf2d & T);
		%feature("compactdefaultargs") Translate;
		%feature("autodoc", "	:param V:
	:type V: gp_Vec2d
	:rtype: None
") Translate;
		void Translate (const gp_Vec2d & V);
		%feature("compactdefaultargs") Translated;
		%feature("autodoc", "	* Translates a line in the direction of the vector V. The magnitude of the translation is the vector's magnitude.

	:param V:
	:type V: gp_Vec2d
	:rtype: gp_Lin2d
") Translated;
		gp_Lin2d Translated (const gp_Vec2d & V);
		%feature("compactdefaultargs") Translate;
		%feature("autodoc", "	:param P1:
	:type P1: gp_Pnt2d
	:param P2:
	:type P2: gp_Pnt2d
	:rtype: None
") Translate;
		void Translate (const gp_Pnt2d & P1,const gp_Pnt2d & P2);
		%feature("compactdefaultargs") Translated;
		%feature("autodoc", "	* Translates a line from the point P1 to the point P2.

	:param P1:
	:type P1: gp_Pnt2d
	:param P2:
	:type P2: gp_Pnt2d
	:rtype: gp_Lin2d
") Translated;
		gp_Lin2d Translated (const gp_Pnt2d & P1,const gp_Pnt2d & P2);
		%feature("compactdefaultargs") _CSFDB_Getgp_Lin2dpos;
		%feature("autodoc", "	:rtype: gp_Ax2d
") _CSFDB_Getgp_Lin2dpos;
		const gp_Ax2d  _CSFDB_Getgp_Lin2dpos ();
};


%extend gp_Lin2d {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor gp_Mat;
class gp_Mat {
	public:
		%feature("compactdefaultargs") gp_Mat;
		%feature("autodoc", "	* creates a matrix with null coefficients.

	:rtype: None
") gp_Mat;
		 gp_Mat ();
		%feature("compactdefaultargs") gp_Mat;
		%feature("autodoc", "	:param a11:
	:type a11: float
	:param a12:
	:type a12: float
	:param a13:
	:type a13: float
	:param a21:
	:type a21: float
	:param a22:
	:type a22: float
	:param a23:
	:type a23: float
	:param a31:
	:type a31: float
	:param a32:
	:type a32: float
	:param a33:
	:type a33: float
	:rtype: None
") gp_Mat;
		 gp_Mat (const Standard_Real a11,const Standard_Real a12,const Standard_Real a13,const Standard_Real a21,const Standard_Real a22,const Standard_Real a23,const Standard_Real a31,const Standard_Real a32,const Standard_Real a33);
		%feature("compactdefaultargs") gp_Mat;
		%feature("autodoc", "	* Creates a matrix. Col1, Col2, Col3 are the 3 columns of the matrix.

	:param Col1:
	:type Col1: gp_XYZ
	:param Col2:
	:type Col2: gp_XYZ
	:param Col3:
	:type Col3: gp_XYZ
	:rtype: None
") gp_Mat;
		 gp_Mat (const gp_XYZ & Col1,const gp_XYZ & Col2,const gp_XYZ & Col3);
		%feature("compactdefaultargs") SetCol;
		%feature("autodoc", "	* Assigns the three coordinates of Value to the column of index Col of this matrix. Raises OutOfRange if Col < 1 or Col > 3.

	:param Col:
	:type Col: int
	:param Value:
	:type Value: gp_XYZ
	:rtype: None
") SetCol;
		void SetCol (const Standard_Integer Col,const gp_XYZ & Value);
		%feature("compactdefaultargs") SetCols;
		%feature("autodoc", "	* Assigns the number triples Col1, Col2, Col3 to the three columns of this matrix.

	:param Col1:
	:type Col1: gp_XYZ
	:param Col2:
	:type Col2: gp_XYZ
	:param Col3:
	:type Col3: gp_XYZ
	:rtype: None
") SetCols;
		void SetCols (const gp_XYZ & Col1,const gp_XYZ & Col2,const gp_XYZ & Col3);
		%feature("compactdefaultargs") SetCross;
		%feature("autodoc", "	* Modifies the matrix M so that applying it to any number triple (X, Y, Z) produces the same result as the cross product of Ref and the number triple (X, Y, Z): i.e.: M * {X,Y,Z}t = Ref.Cross({X, Y ,Z}) this matrix is anti symmetric. To apply this matrix to the triplet {XYZ} is the same as to do the cross product between the triplet Ref and the triplet {XYZ}. Note: this matrix is anti-symmetric.

	:param Ref:
	:type Ref: gp_XYZ
	:rtype: None
") SetCross;
		void SetCross (const gp_XYZ & Ref);
		%feature("compactdefaultargs") SetDiagonal;
		%feature("autodoc", "	* Modifies the main diagonal of the matrix. <self>.Value (1, 1) = X1 <self>.Value (2, 2) = X2 <self>.Value (3, 3) = X3 The other coefficients of the matrix are not modified.

	:param X1:
	:type X1: float
	:param X2:
	:type X2: float
	:param X3:
	:type X3: float
	:rtype: None
") SetDiagonal;
		void SetDiagonal (const Standard_Real X1,const Standard_Real X2,const Standard_Real X3);
		%feature("compactdefaultargs") SetDot;
		%feature("autodoc", "	* Modifies this matrix so that applying it to any number triple (X, Y, Z) produces the same result as the scalar product of Ref and the number triple (X, Y, Z): this * (X,Y,Z) = Ref.(X,Y,Z) Note: this matrix is symmetric.

	:param Ref:
	:type Ref: gp_XYZ
	:rtype: None
") SetDot;
		void SetDot (const gp_XYZ & Ref);
		%feature("compactdefaultargs") SetIdentity;
		%feature("autodoc", "	* Modifies this matrix so that it represents the Identity matrix.

	:rtype: None
") SetIdentity;
		void SetIdentity ();
		%feature("compactdefaultargs") SetRotation;
		%feature("autodoc", "	* Modifies this matrix so that it represents a rotation. Ang is the angular value in radians and the XYZ axis gives the direction of the rotation. Raises ConstructionError if XYZ.Modulus() <= Resolution()

	:param Axis:
	:type Axis: gp_XYZ
	:param Ang:
	:type Ang: float
	:rtype: None
") SetRotation;
		void SetRotation (const gp_XYZ & Axis,const Standard_Real Ang);
		%feature("compactdefaultargs") SetRow;
		%feature("autodoc", "	* Assigns the three coordinates of Value to the row of index Row of this matrix. Raises OutOfRange if Row < 1 or Row > 3.

	:param Row:
	:type Row: int
	:param Value:
	:type Value: gp_XYZ
	:rtype: None
") SetRow;
		void SetRow (const Standard_Integer Row,const gp_XYZ & Value);
		%feature("compactdefaultargs") SetRows;
		%feature("autodoc", "	* Assigns the number triples Row1, Row2, Row3 to the three rows of this matrix.

	:param Row1:
	:type Row1: gp_XYZ
	:param Row2:
	:type Row2: gp_XYZ
	:param Row3:
	:type Row3: gp_XYZ
	:rtype: None
") SetRows;
		void SetRows (const gp_XYZ & Row1,const gp_XYZ & Row2,const gp_XYZ & Row3);
		%feature("compactdefaultargs") SetScale;
		%feature("autodoc", "	* Modifies the the matrix so that it represents a scaling transformation, where S is the scale factor. : | S 0.0 0.0 | <self> = | 0.0 S 0.0 | | 0.0 0.0 S |

	:param S:
	:type S: float
	:rtype: None
") SetScale;
		void SetScale (const Standard_Real S);
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	* Assigns <Value> to the coefficient of row Row, column Col of this matrix. Raises OutOfRange if Row < 1 or Row > 3 or Col < 1 or Col > 3

	:param Row:
	:type Row: int
	:param Col:
	:type Col: int
	:param Value:
	:type Value: float
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Row,const Standard_Integer Col,const Standard_Real Value);
		%feature("compactdefaultargs") Column;
		%feature("autodoc", "	* Returns the column of Col index. Raises OutOfRange if Col < 1 or Col > 3

	:param Col:
	:type Col: int
	:rtype: gp_XYZ
") Column;
		gp_XYZ Column (const Standard_Integer Col);
		%feature("compactdefaultargs") Determinant;
		%feature("autodoc", "	* Computes the determinant of the matrix.

	:rtype: float
") Determinant;
		Standard_Real Determinant ();
		%feature("compactdefaultargs") Diagonal;
		%feature("autodoc", "	* Returns the main diagonal of the matrix.

	:rtype: gp_XYZ
") Diagonal;
		gp_XYZ Diagonal ();
		%feature("compactdefaultargs") Row;
		%feature("autodoc", "	* returns the row of Row index. Raises OutOfRange if Row < 1 or Row > 3

	:param Row:
	:type Row: int
	:rtype: gp_XYZ
") Row;
		gp_XYZ Row (const Standard_Integer Row);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	* Returns the coefficient of range (Row, Col) Raises OutOfRange if Row < 1 or Row > 3 or Col < 1 or Col > 3

	:param Row:
	:type Row: int
	:param Col:
	:type Col: int
	:rtype: float
") Value;
		const Standard_Real & Value (const Standard_Integer Row,const Standard_Integer Col);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	* Returns the coefficient of range (Row, Col) Raises OutOfRange if Row < 1 or Row > 3 or Col < 1 or Col > 3

	:param Row:
	:type Row: int
	:param Col:
	:type Col: int
	:rtype: float
") ChangeValue;
		Standard_Real & ChangeValue (const Standard_Integer Row,const Standard_Integer Col);
		%feature("compactdefaultargs") IsSingular;
		%feature("autodoc", "	* The Gauss LU decomposition is used to invert the matrix (see Math package) so the matrix is considered as singular if the largest pivot found is lower or equal to Resolution from gp.

	:rtype: bool
") IsSingular;
		Standard_Boolean IsSingular ();
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "	:param Other:
	:type Other: gp_Mat
	:rtype: None
") Add;
		void Add (const gp_Mat & Other);
		%feature("compactdefaultargs") operator +=;
		%feature("autodoc", "	:param Other:
	:type Other: gp_Mat
	:rtype: None
") operator +=;
		void operator += (const gp_Mat & Other);
		%feature("compactdefaultargs") Added;
		%feature("autodoc", "	* Computes the sum of this matrix and the matrix Other for each coefficient of the matrix : <self>.Coef(i,j) + <Other>.Coef(i,j)

	:param Other:
	:type Other: gp_Mat
	:rtype: gp_Mat
") Added;
		gp_Mat Added (const gp_Mat & Other);
		%feature("compactdefaultargs") operator +;
		%feature("autodoc", "	:param Other:
	:type Other: gp_Mat
	:rtype: gp_Mat
") operator +;
		gp_Mat operator + (const gp_Mat & Other);
		%feature("compactdefaultargs") Divide;
		%feature("autodoc", "	:param Scalar:
	:type Scalar: float
	:rtype: None
") Divide;
		void Divide (const Standard_Real Scalar);
		%feature("compactdefaultargs") operator /=;
		%feature("autodoc", "	:param Scalar:
	:type Scalar: float
	:rtype: None
") operator /=;
		void operator /= (const Standard_Real Scalar);
		%feature("compactdefaultargs") Divided;
		%feature("autodoc", "	* Divides all the coefficients of the matrix by Scalar

	:param Scalar:
	:type Scalar: float
	:rtype: gp_Mat
") Divided;
		gp_Mat Divided (const Standard_Real Scalar);
		%feature("compactdefaultargs") operator /;
		%feature("autodoc", "	:param Scalar:
	:type Scalar: float
	:rtype: gp_Mat
") operator /;
		gp_Mat operator / (const Standard_Real Scalar);
		%feature("compactdefaultargs") Invert;
		%feature("autodoc", "	:rtype: None
") Invert;
		void Invert ();
		%feature("compactdefaultargs") Inverted;
		%feature("autodoc", "	* Inverses the matrix and raises if the matrix is singular. - Invert assigns the result to this matrix, while - Inverted creates a new one. Warning The Gauss LU decomposition is used to invert the matrix. Consequently, the matrix is considered as singular if the largest pivot found is less than or equal to gp::Resolution(). Exceptions Standard_ConstructionError if this matrix is singular, and therefore cannot be inverted.

	:rtype: gp_Mat
") Inverted;
		gp_Mat Inverted ();
		%feature("compactdefaultargs") Multiplied;
		%feature("autodoc", "	* Computes the product of two matrices <self> * <Other>

	:param Other:
	:type Other: gp_Mat
	:rtype: gp_Mat
") Multiplied;
		gp_Mat Multiplied (const gp_Mat & Other);
		%feature("compactdefaultargs") operator *;
		%feature("autodoc", "	:param Other:
	:type Other: gp_Mat
	:rtype: gp_Mat
") operator *;
		gp_Mat operator * (const gp_Mat & Other);
		%feature("compactdefaultargs") Multiply;
		%feature("autodoc", "	* Computes the product of two matrices <self> = <Other> * <self>.

	:param Other:
	:type Other: gp_Mat
	:rtype: None
") Multiply;
		void Multiply (const gp_Mat & Other);
		%feature("compactdefaultargs") operator *=;
		%feature("autodoc", "	:param Other:
	:type Other: gp_Mat
	:rtype: None
") operator *=;
		void operator *= (const gp_Mat & Other);
		%feature("compactdefaultargs") PreMultiply;
		%feature("autodoc", "	:param Other:
	:type Other: gp_Mat
	:rtype: None
") PreMultiply;
		void PreMultiply (const gp_Mat & Other);
		%feature("compactdefaultargs") Multiplied;
		%feature("autodoc", "	:param Scalar:
	:type Scalar: float
	:rtype: gp_Mat
") Multiplied;
		gp_Mat Multiplied (const Standard_Real Scalar);
		%feature("compactdefaultargs") operator *;
		%feature("autodoc", "	:param Scalar:
	:type Scalar: float
	:rtype: gp_Mat
") operator *;
		gp_Mat operator * (const Standard_Real Scalar);
		%feature("compactdefaultargs") Multiply;
		%feature("autodoc", "	* Multiplies all the coefficients of the matrix by Scalar

	:param Scalar:
	:type Scalar: float
	:rtype: None
") Multiply;
		void Multiply (const Standard_Real Scalar);
		%feature("compactdefaultargs") operator *=;
		%feature("autodoc", "	:param Scalar:
	:type Scalar: float
	:rtype: None
") operator *=;
		void operator *= (const Standard_Real Scalar);
		%feature("compactdefaultargs") Power;
		%feature("autodoc", "	:param N:
	:type N: int
	:rtype: None
") Power;
		void Power (const Standard_Integer N);
		%feature("compactdefaultargs") Powered;
		%feature("autodoc", "	* Computes <self> = <self> * <self> * .......* <self>, N time. if N = 0 <self> = Identity if N < 0 <self> = <self>.Invert() *...........* <self>.Invert(). If N < 0 an exception will be raised if the matrix is not inversible

	:param N:
	:type N: int
	:rtype: gp_Mat
") Powered;
		gp_Mat Powered (const Standard_Integer N);
		%feature("compactdefaultargs") Subtract;
		%feature("autodoc", "	:param Other:
	:type Other: gp_Mat
	:rtype: None
") Subtract;
		void Subtract (const gp_Mat & Other);
		%feature("compactdefaultargs") operator -=;
		%feature("autodoc", "	:param Other:
	:type Other: gp_Mat
	:rtype: None
") operator -=;
		void operator -= (const gp_Mat & Other);
		%feature("compactdefaultargs") Subtracted;
		%feature("autodoc", "	* cOmputes for each coefficient of the matrix : <self>.Coef(i,j) - <Other>.Coef(i,j)

	:param Other:
	:type Other: gp_Mat
	:rtype: gp_Mat
") Subtracted;
		gp_Mat Subtracted (const gp_Mat & Other);
		%feature("compactdefaultargs") operator -;
		%feature("autodoc", "	:param Other:
	:type Other: gp_Mat
	:rtype: gp_Mat
") operator -;
		gp_Mat operator - (const gp_Mat & Other);
		%feature("compactdefaultargs") Transpose;
		%feature("autodoc", "	:rtype: None
") Transpose;
		void Transpose ();
		%feature("compactdefaultargs") Transposed;
		%feature("autodoc", "	* Transposes the matrix. A(j, i) -> A (i, j)

	:rtype: gp_Mat
") Transposed;
		gp_Mat Transposed ();
		%feature("compactdefaultargs") _CSFDB_Getgp_Matmatrix;
		%feature("autodoc", "	:param i1:
	:type i1: int
	:param i2:
	:type i2: int
	:rtype: float
") _CSFDB_Getgp_Matmatrix;
		Standard_Real & _CSFDB_Getgp_Matmatrix (const Standard_Integer i1,const Standard_Integer i2);
};


%extend gp_Mat {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor gp_Mat2d;
class gp_Mat2d {
	public:
		%feature("compactdefaultargs") gp_Mat2d;
		%feature("autodoc", "	* Creates a matrix with null coefficients.

	:rtype: None
") gp_Mat2d;
		 gp_Mat2d ();
		%feature("compactdefaultargs") gp_Mat2d;
		%feature("autodoc", "	* Col1, Col2 are the 2 columns of the matrix.

	:param Col1:
	:type Col1: gp_XY
	:param Col2:
	:type Col2: gp_XY
	:rtype: None
") gp_Mat2d;
		 gp_Mat2d (const gp_XY & Col1,const gp_XY & Col2);
		%feature("compactdefaultargs") SetCol;
		%feature("autodoc", "	* Assigns the two coordinates of Value to the column of range Col of this matrix Raises OutOfRange if Col < 1 or Col > 2.

	:param Col:
	:type Col: int
	:param Value:
	:type Value: gp_XY
	:rtype: None
") SetCol;
		void SetCol (const Standard_Integer Col,const gp_XY & Value);
		%feature("compactdefaultargs") SetCols;
		%feature("autodoc", "	* Assigns the number pairs Col1, Col2 to the two columns of this matrix

	:param Col1:
	:type Col1: gp_XY
	:param Col2:
	:type Col2: gp_XY
	:rtype: None
") SetCols;
		void SetCols (const gp_XY & Col1,const gp_XY & Col2);
		%feature("compactdefaultargs") SetDiagonal;
		%feature("autodoc", "	* Modifies the main diagonal of the matrix. <self>.Value (1, 1) = X1 <self>.Value (2, 2) = X2 The other coefficients of the matrix are not modified.

	:param X1:
	:type X1: float
	:param X2:
	:type X2: float
	:rtype: None
") SetDiagonal;
		void SetDiagonal (const Standard_Real X1,const Standard_Real X2);
		%feature("compactdefaultargs") SetIdentity;
		%feature("autodoc", "	* Modifies this matrix, so that it represents the Identity matrix.

	:rtype: None
") SetIdentity;
		void SetIdentity ();
		%feature("compactdefaultargs") SetRotation;
		%feature("autodoc", "	* Modifies this matrix, so that it representso a rotation. Ang is the angular value in radian of the rotation.

	:param Ang:
	:type Ang: float
	:rtype: None
") SetRotation;
		void SetRotation (const Standard_Real Ang);
		%feature("compactdefaultargs") SetRow;
		%feature("autodoc", "	* Assigns the two coordinates of Value to the row of index Row of this matrix. Raises OutOfRange if Row < 1 or Row > 2.

	:param Row:
	:type Row: int
	:param Value:
	:type Value: gp_XY
	:rtype: None
") SetRow;
		void SetRow (const Standard_Integer Row,const gp_XY & Value);
		%feature("compactdefaultargs") SetRows;
		%feature("autodoc", "	* Assigns the number pairs Row1, Row2 to the two rows of this matrix.

	:param Row1:
	:type Row1: gp_XY
	:param Row2:
	:type Row2: gp_XY
	:rtype: None
") SetRows;
		void SetRows (const gp_XY & Row1,const gp_XY & Row2);
		%feature("compactdefaultargs") SetScale;
		%feature("autodoc", "	* Modifies the matrix such that it represents a scaling transformation, where S is the scale factor : | S 0.0 | <self> = | 0.0 S |

	:param S:
	:type S: float
	:rtype: None
") SetScale;
		void SetScale (const Standard_Real S);
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	* Assigns <Value> to the coefficient of row Row, column Col of this matrix. Raises OutOfRange if Row < 1 or Row > 2 or Col < 1 or Col > 2

	:param Row:
	:type Row: int
	:param Col:
	:type Col: int
	:param Value:
	:type Value: float
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Row,const Standard_Integer Col,const Standard_Real Value);
		%feature("compactdefaultargs") Column;
		%feature("autodoc", "	* Returns the column of Col index. Raises OutOfRange if Col < 1 or Col > 2

	:param Col:
	:type Col: int
	:rtype: gp_XY
") Column;
		gp_XY Column (const Standard_Integer Col);
		%feature("compactdefaultargs") Determinant;
		%feature("autodoc", "	* Computes the determinant of the matrix.

	:rtype: float
") Determinant;
		Standard_Real Determinant ();
		%feature("compactdefaultargs") Diagonal;
		%feature("autodoc", "	* Returns the main diagonal of the matrix.

	:rtype: gp_XY
") Diagonal;
		gp_XY Diagonal ();
		%feature("compactdefaultargs") Row;
		%feature("autodoc", "	* Returns the row of index Row. Raised if Row < 1 or Row > 2

	:param Row:
	:type Row: int
	:rtype: gp_XY
") Row;
		gp_XY Row (const Standard_Integer Row);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	* Returns the coefficient of range (Row, Col) Raises OutOfRange if Row < 1 or Row > 2 or Col < 1 or Col > 2

	:param Row:
	:type Row: int
	:param Col:
	:type Col: int
	:rtype: float
") Value;
		const Standard_Real & Value (const Standard_Integer Row,const Standard_Integer Col);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	* Returns the coefficient of range (Row, Col) Raises OutOfRange if Row < 1 or Row > 2 or Col < 1 or Col > 2

	:param Row:
	:type Row: int
	:param Col:
	:type Col: int
	:rtype: float
") ChangeValue;
		Standard_Real & ChangeValue (const Standard_Integer Row,const Standard_Integer Col);
		%feature("compactdefaultargs") IsSingular;
		%feature("autodoc", "	* Returns true if this matrix is singular (and therefore, cannot be inverted). The Gauss LU decomposition is used to invert the matrix so the matrix is considered as singular if the largest pivot found is lower or equal to Resolution from gp.

	:rtype: bool
") IsSingular;
		Standard_Boolean IsSingular ();
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "	:param Other:
	:type Other: gp_Mat2d
	:rtype: None
") Add;
		void Add (const gp_Mat2d & Other);
		%feature("compactdefaultargs") operator +=;
		%feature("autodoc", "	:param Other:
	:type Other: gp_Mat2d
	:rtype: None
") operator +=;
		void operator += (const gp_Mat2d & Other);
		%feature("compactdefaultargs") Added;
		%feature("autodoc", "	* Computes the sum of this matrix and the matrix Other.for each coefficient of the matrix : <self>.Coef(i,j) + <Other>.Coef(i,j) Note: - operator += assigns the result to this matrix, while - operator + creates a new one.

	:param Other:
	:type Other: gp_Mat2d
	:rtype: gp_Mat2d
") Added;
		gp_Mat2d Added (const gp_Mat2d & Other);
		%feature("compactdefaultargs") operator +;
		%feature("autodoc", "	:param Other:
	:type Other: gp_Mat2d
	:rtype: gp_Mat2d
") operator +;
		gp_Mat2d operator + (const gp_Mat2d & Other);
		%feature("compactdefaultargs") Divide;
		%feature("autodoc", "	:param Scalar:
	:type Scalar: float
	:rtype: None
") Divide;
		void Divide (const Standard_Real Scalar);
		%feature("compactdefaultargs") operator /=;
		%feature("autodoc", "	:param Scalar:
	:type Scalar: float
	:rtype: None
") operator /=;
		void operator /= (const Standard_Real Scalar);
		%feature("compactdefaultargs") Divided;
		%feature("autodoc", "	* Divides all the coefficients of the matrix by a scalar.

	:param Scalar:
	:type Scalar: float
	:rtype: gp_Mat2d
") Divided;
		gp_Mat2d Divided (const Standard_Real Scalar);
		%feature("compactdefaultargs") operator /;
		%feature("autodoc", "	:param Scalar:
	:type Scalar: float
	:rtype: gp_Mat2d
") operator /;
		gp_Mat2d operator / (const Standard_Real Scalar);
		%feature("compactdefaultargs") Invert;
		%feature("autodoc", "	:rtype: None
") Invert;
		void Invert ();
		%feature("compactdefaultargs") Inverted;
		%feature("autodoc", "	* Inverses the matrix and raises exception if the matrix is singular.

	:rtype: gp_Mat2d
") Inverted;
		gp_Mat2d Inverted ();
		%feature("compactdefaultargs") Multiplied;
		%feature("autodoc", "	:param Other:
	:type Other: gp_Mat2d
	:rtype: gp_Mat2d
") Multiplied;
		gp_Mat2d Multiplied (const gp_Mat2d & Other);
		%feature("compactdefaultargs") operator *;
		%feature("autodoc", "	:param Other:
	:type Other: gp_Mat2d
	:rtype: gp_Mat2d
") operator *;
		gp_Mat2d operator * (const gp_Mat2d & Other);
		%feature("compactdefaultargs") Multiply;
		%feature("autodoc", "	* Computes the product of two matrices <self> * <Other>

	:param Other:
	:type Other: gp_Mat2d
	:rtype: None
") Multiply;
		void Multiply (const gp_Mat2d & Other);
		%feature("compactdefaultargs") PreMultiply;
		%feature("autodoc", "	* Modifies this matrix by premultiplying it by the matrix Other <self> = Other * <self>.

	:param Other:
	:type Other: gp_Mat2d
	:rtype: None
") PreMultiply;
		void PreMultiply (const gp_Mat2d & Other);
		%feature("compactdefaultargs") Multiplied;
		%feature("autodoc", "	:param Scalar:
	:type Scalar: float
	:rtype: gp_Mat2d
") Multiplied;
		gp_Mat2d Multiplied (const Standard_Real Scalar);
		%feature("compactdefaultargs") operator *;
		%feature("autodoc", "	:param Scalar:
	:type Scalar: float
	:rtype: gp_Mat2d
") operator *;
		gp_Mat2d operator * (const Standard_Real Scalar);
		%feature("compactdefaultargs") Multiply;
		%feature("autodoc", "	* Multiplies all the coefficients of the matrix by a scalar.

	:param Scalar:
	:type Scalar: float
	:rtype: None
") Multiply;
		void Multiply (const Standard_Real Scalar);
		%feature("compactdefaultargs") operator *=;
		%feature("autodoc", "	:param Scalar:
	:type Scalar: float
	:rtype: None
") operator *=;
		void operator *= (const Standard_Real Scalar);
		%feature("compactdefaultargs") Power;
		%feature("autodoc", "	:param N:
	:type N: int
	:rtype: None
") Power;
		void Power (const Standard_Integer N);
		%feature("compactdefaultargs") Powered;
		%feature("autodoc", "	* computes <self> = <self> * <self> * .......* <self>, N time. if N = 0 <self> = Identity if N < 0 <self> = <self>.Invert() *...........* <self>.Invert(). If N < 0 an exception can be raised if the matrix is not inversible

	:param N:
	:type N: int
	:rtype: gp_Mat2d
") Powered;
		gp_Mat2d Powered (const Standard_Integer N);
		%feature("compactdefaultargs") Subtract;
		%feature("autodoc", "	:param Other:
	:type Other: gp_Mat2d
	:rtype: None
") Subtract;
		void Subtract (const gp_Mat2d & Other);
		%feature("compactdefaultargs") operator -=;
		%feature("autodoc", "	:param Other:
	:type Other: gp_Mat2d
	:rtype: None
") operator -=;
		void operator -= (const gp_Mat2d & Other);
		%feature("compactdefaultargs") Subtracted;
		%feature("autodoc", "	* Computes for each coefficient of the matrix : <self>.Coef(i,j) - <Other>.Coef(i,j)

	:param Other:
	:type Other: gp_Mat2d
	:rtype: gp_Mat2d
") Subtracted;
		gp_Mat2d Subtracted (const gp_Mat2d & Other);
		%feature("compactdefaultargs") operator -;
		%feature("autodoc", "	:param Other:
	:type Other: gp_Mat2d
	:rtype: gp_Mat2d
") operator -;
		gp_Mat2d operator - (const gp_Mat2d & Other);
		%feature("compactdefaultargs") Transpose;
		%feature("autodoc", "	:rtype: None
") Transpose;
		void Transpose ();
		%feature("compactdefaultargs") Transposed;
		%feature("autodoc", "	* Transposes the matrix. A(j, i) -> A (i, j)

	:rtype: gp_Mat2d
") Transposed;
		gp_Mat2d Transposed ();
		%feature("compactdefaultargs") _CSFDB_Getgp_Mat2dmatrix;
		%feature("autodoc", "	:param i1:
	:type i1: int
	:param i2:
	:type i2: int
	:rtype: float
") _CSFDB_Getgp_Mat2dmatrix;
		Standard_Real & _CSFDB_Getgp_Mat2dmatrix (const Standard_Integer i1,const Standard_Integer i2);
};


%extend gp_Mat2d {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor gp_Parab;
class gp_Parab {
	public:
		%feature("compactdefaultargs") gp_Parab;
		%feature("autodoc", "	* Creates an indefinite Parabola.

	:rtype: None
") gp_Parab;
		 gp_Parab ();
		%feature("compactdefaultargs") gp_Parab;
		%feature("autodoc", "	* Creates a parabola with its local coordinate system 'A2' and it's focal length 'Focal'. The XDirection of A2 defines the axis of symmetry of the parabola. The YDirection of A2 is parallel to the directrix of the parabola. The Location point of A2 is the vertex of the parabola Raises ConstructionError if Focal < 0.0 Raised if Focal < 0.0

	:param A2:
	:type A2: gp_Ax2
	:param Focal:
	:type Focal: float
	:rtype: None
") gp_Parab;
		 gp_Parab (const gp_Ax2 & A2,const Standard_Real Focal);
		%feature("compactdefaultargs") gp_Parab;
		%feature("autodoc", "	* D is the directrix of the parabola and F the focus point. The symmetry axis (XAxis) of the parabola is normal to the directrix and pass through the focus point F, but its location point is the vertex of the parabola. The YAxis of the parabola is parallel to D and its location point is the vertex of the parabola. The normal to the plane of the parabola is the cross product between the XAxis and the YAxis.

	:param D:
	:type D: gp_Ax1
	:param F:
	:type F: gp_Pnt
	:rtype: None
") gp_Parab;
		 gp_Parab (const gp_Ax1 & D,const gp_Pnt & F);
		%feature("compactdefaultargs") SetAxis;
		%feature("autodoc", "	* Modifies this parabola by redefining its local coordinate system so that - its origin and 'main Direction' become those of the axis A1 (the 'X Direction' and 'Y Direction' are then recomputed in the same way as for any gp_Ax2) Raises ConstructionError if the direction of A1 is parallel to the previous XAxis of the parabola.

	:param A1:
	:type A1: gp_Ax1
	:rtype: None
") SetAxis;
		void SetAxis (const gp_Ax1 & A1);
		%feature("compactdefaultargs") SetFocal;
		%feature("autodoc", "	* Changes the focal distance of the parabola. Raises ConstructionError if Focal < 0.0

	:param Focal:
	:type Focal: float
	:rtype: None
") SetFocal;
		void SetFocal (const Standard_Real Focal);
		%feature("compactdefaultargs") SetLocation;
		%feature("autodoc", "	* Changes the location of the parabola. It is the vertex of the parabola.

	:param P:
	:type P: gp_Pnt
	:rtype: None
") SetLocation;
		void SetLocation (const gp_Pnt & P);
		%feature("compactdefaultargs") SetPosition;
		%feature("autodoc", "	* Changes the local coordinate system of the parabola.

	:param A2:
	:type A2: gp_Ax2
	:rtype: None
") SetPosition;
		void SetPosition (const gp_Ax2 & A2);
		%feature("compactdefaultargs") Axis;
		%feature("autodoc", "	* Returns the main axis of the parabola. It is the axis normal to the plane of the parabola passing through the vertex of the parabola.

	:rtype: gp_Ax1
") Axis;
		const gp_Ax1  Axis ();
		%feature("compactdefaultargs") Directrix;
		%feature("autodoc", "	* Computes the directrix of this parabola. The directrix is: - a line parallel to the 'Y Direction' of the local coordinate system of this parabola, and - located on the negative side of the axis of symmetry, at a distance from the apex which is equal to the focal length of this parabola. The directrix is returned as an axis (a gp_Ax1 object), the origin of which is situated on the 'X Axis' of this parabola.

	:rtype: gp_Ax1
") Directrix;
		gp_Ax1 Directrix ();
		%feature("compactdefaultargs") Focal;
		%feature("autodoc", "	* Returns the distance between the vertex and the focus of the parabola.

	:rtype: float
") Focal;
		Standard_Real Focal ();
		%feature("compactdefaultargs") Focus;
		%feature("autodoc", "	* - Computes the focus of the parabola.

	:rtype: gp_Pnt
") Focus;
		gp_Pnt Focus ();
		%feature("compactdefaultargs") Location;
		%feature("autodoc", "	* Returns the vertex of the parabola. It is the 'Location' point of the coordinate system of the parabola.

	:rtype: gp_Pnt
") Location;
		const gp_Pnt  Location ();
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "	* Computes the parameter of the parabola. It is the distance between the focus and the directrix of the parabola. This distance is twice the focal length.

	:rtype: float
") Parameter;
		Standard_Real Parameter ();
		%feature("compactdefaultargs") Position;
		%feature("autodoc", "	* Returns the local coordinate system of the parabola.

	:rtype: gp_Ax2
") Position;
		const gp_Ax2  Position ();
		%feature("compactdefaultargs") XAxis;
		%feature("autodoc", "	* Returns the symmetry axis of the parabola. The location point of the axis is the vertex of the parabola.

	:rtype: gp_Ax1
") XAxis;
		gp_Ax1 XAxis ();
		%feature("compactdefaultargs") YAxis;
		%feature("autodoc", "	* It is an axis parallel to the directrix of the parabola. The location point of this axis is the vertex of the parabola.

	:rtype: gp_Ax1
") YAxis;
		gp_Ax1 YAxis ();
		%feature("compactdefaultargs") Mirror;
		%feature("autodoc", "	:param P:
	:type P: gp_Pnt
	:rtype: None
") Mirror;
		void Mirror (const gp_Pnt & P);
		%feature("compactdefaultargs") Mirrored;
		%feature("autodoc", "	* Performs the symmetrical transformation of a parabola with respect to the point P which is the center of the symmetry.

	:param P:
	:type P: gp_Pnt
	:rtype: gp_Parab
") Mirrored;
		gp_Parab Mirrored (const gp_Pnt & P);
		%feature("compactdefaultargs") Mirror;
		%feature("autodoc", "	:param A1:
	:type A1: gp_Ax1
	:rtype: None
") Mirror;
		void Mirror (const gp_Ax1 & A1);
		%feature("compactdefaultargs") Mirrored;
		%feature("autodoc", "	* Performs the symmetrical transformation of a parabola with respect to an axis placement which is the axis of the symmetry.

	:param A1:
	:type A1: gp_Ax1
	:rtype: gp_Parab
") Mirrored;
		gp_Parab Mirrored (const gp_Ax1 & A1);
		%feature("compactdefaultargs") Mirror;
		%feature("autodoc", "	:param A2:
	:type A2: gp_Ax2
	:rtype: None
") Mirror;
		void Mirror (const gp_Ax2 & A2);
		%feature("compactdefaultargs") Mirrored;
		%feature("autodoc", "	* Performs the symmetrical transformation of a parabola with respect to a plane. The axis placement A2 locates the plane of the symmetry (Location, XDirection, YDirection).

	:param A2:
	:type A2: gp_Ax2
	:rtype: gp_Parab
") Mirrored;
		gp_Parab Mirrored (const gp_Ax2 & A2);
		%feature("compactdefaultargs") Rotate;
		%feature("autodoc", "	:param A1:
	:type A1: gp_Ax1
	:param Ang:
	:type Ang: float
	:rtype: None
") Rotate;
		void Rotate (const gp_Ax1 & A1,const Standard_Real Ang);
		%feature("compactdefaultargs") Rotated;
		%feature("autodoc", "	* Rotates a parabola. A1 is the axis of the rotation. Ang is the angular value of the rotation in radians.

	:param A1:
	:type A1: gp_Ax1
	:param Ang:
	:type Ang: float
	:rtype: gp_Parab
") Rotated;
		gp_Parab Rotated (const gp_Ax1 & A1,const Standard_Real Ang);
		%feature("compactdefaultargs") Scale;
		%feature("autodoc", "	:param P:
	:type P: gp_Pnt
	:param S:
	:type S: float
	:rtype: None
") Scale;
		void Scale (const gp_Pnt & P,const Standard_Real S);
		%feature("compactdefaultargs") Scaled;
		%feature("autodoc", "	* Scales a parabola. S is the scaling value. If S is negative the direction of the symmetry axis XAxis is reversed and the direction of the YAxis too.

	:param P:
	:type P: gp_Pnt
	:param S:
	:type S: float
	:rtype: gp_Parab
") Scaled;
		gp_Parab Scaled (const gp_Pnt & P,const Standard_Real S);
		%feature("compactdefaultargs") Transform;
		%feature("autodoc", "	:param T:
	:type T: gp_Trsf
	:rtype: None
") Transform;
		void Transform (const gp_Trsf & T);
		%feature("compactdefaultargs") Transformed;
		%feature("autodoc", "	* Transforms a parabola with the transformation T from class Trsf.

	:param T:
	:type T: gp_Trsf
	:rtype: gp_Parab
") Transformed;
		gp_Parab Transformed (const gp_Trsf & T);
		%feature("compactdefaultargs") Translate;
		%feature("autodoc", "	:param V:
	:type V: gp_Vec
	:rtype: None
") Translate;
		void Translate (const gp_Vec & V);
		%feature("compactdefaultargs") Translated;
		%feature("autodoc", "	* Translates a parabola in the direction of the vector V. The magnitude of the translation is the vector's magnitude.

	:param V:
	:type V: gp_Vec
	:rtype: gp_Parab
") Translated;
		gp_Parab Translated (const gp_Vec & V);
		%feature("compactdefaultargs") Translate;
		%feature("autodoc", "	:param P1:
	:type P1: gp_Pnt
	:param P2:
	:type P2: gp_Pnt
	:rtype: None
") Translate;
		void Translate (const gp_Pnt & P1,const gp_Pnt & P2);
		%feature("compactdefaultargs") Translated;
		%feature("autodoc", "	* Translates a parabola from the point P1 to the point P2.

	:param P1:
	:type P1: gp_Pnt
	:param P2:
	:type P2: gp_Pnt
	:rtype: gp_Parab
") Translated;
		gp_Parab Translated (const gp_Pnt & P1,const gp_Pnt & P2);
		%feature("compactdefaultargs") _CSFDB_Getgp_Parabpos;
		%feature("autodoc", "	:rtype: gp_Ax2
") _CSFDB_Getgp_Parabpos;
		const gp_Ax2  _CSFDB_Getgp_Parabpos ();
		%feature("compactdefaultargs") _CSFDB_Getgp_ParabfocalLength;
		%feature("autodoc", "	:rtype: float
") _CSFDB_Getgp_ParabfocalLength;
		Standard_Real _CSFDB_Getgp_ParabfocalLength ();
		%feature("compactdefaultargs") _CSFDB_Setgp_ParabfocalLength;
		%feature("autodoc", "	:param p:
	:type p: float
	:rtype: None
") _CSFDB_Setgp_ParabfocalLength;
		void _CSFDB_Setgp_ParabfocalLength (const Standard_Real p);
};


%extend gp_Parab {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor gp_Parab2d;
class gp_Parab2d {
	public:
		%feature("compactdefaultargs") gp_Parab2d;
		%feature("autodoc", "	* Creates an indefinite parabola.

	:rtype: None
") gp_Parab2d;
		 gp_Parab2d ();
		%feature("compactdefaultargs") gp_Parab2d;
		%feature("autodoc", "	* Creates a parabola with its vertex point, its axis of symmetry ('XAxis') and its focal length. The sense of parametrization is given by Sense. Warnings : It is possible to have Focal = 0. Raises ConstructionError if Focal < 0.0

	:param MirrorAxis:
	:type MirrorAxis: gp_Ax2d
	:param Focal:
	:type Focal: float
	:param Sense: default value is Standard_True
	:type Sense: bool
	:rtype: None
") gp_Parab2d;
		 gp_Parab2d (const gp_Ax2d & MirrorAxis,const Standard_Real Focal,const Standard_Boolean Sense = Standard_True);
		%feature("compactdefaultargs") gp_Parab2d;
		%feature("autodoc", "	* Creates a parabola with its vertex point, its axis of symmetry ('XAxis') and its focal length. The sense of parametrization is given by A. Warnings : It is possible to have Focal = 0. Raises ConstructionError if Focal < 0.0

	:param A:
	:type A: gp_Ax22d
	:param Focal:
	:type Focal: float
	:rtype: None
") gp_Parab2d;
		 gp_Parab2d (const gp_Ax22d & A,const Standard_Real Focal);
		%feature("compactdefaultargs") gp_Parab2d;
		%feature("autodoc", "	* Creates a parabola with the directrix and the focus point. The sense of parametrization is given by Sense.

	:param D:
	:type D: gp_Ax2d
	:param F:
	:type F: gp_Pnt2d
	:param Sense: default value is Standard_True
	:type Sense: bool
	:rtype: None
") gp_Parab2d;
		 gp_Parab2d (const gp_Ax2d & D,const gp_Pnt2d & F,const Standard_Boolean Sense = Standard_True);
		%feature("compactdefaultargs") gp_Parab2d;
		%feature("autodoc", "	* Creates a parabola with the directrix and the focus point. The Sense of parametrization is given by D.

	:param D:
	:type D: gp_Ax22d
	:param F:
	:type F: gp_Pnt2d
	:rtype: None
") gp_Parab2d;
		 gp_Parab2d (const gp_Ax22d & D,const gp_Pnt2d & F);
		%feature("compactdefaultargs") SetFocal;
		%feature("autodoc", "	* Changes the focal distance of the parabola Warnings : It is possible to have Focal = 0. Raises ConstructionError if Focal < 0.0

	:param Focal:
	:type Focal: float
	:rtype: None
") SetFocal;
		void SetFocal (const Standard_Real Focal);
		%feature("compactdefaultargs") SetLocation;
		%feature("autodoc", "	* Changes the 'Location' point of the parabola. It is the vertex of the parabola.

	:param P:
	:type P: gp_Pnt2d
	:rtype: None
") SetLocation;
		void SetLocation (const gp_Pnt2d & P);
		%feature("compactdefaultargs") SetMirrorAxis;
		%feature("autodoc", "	* Modifies this parabola, by redefining its local coordinate system so that its origin and 'X Direction' become those of the axis MA. The 'Y Direction' of the local coordinate system is then recomputed. The orientation of the local coordinate system is not modified.

	:param A:
	:type A: gp_Ax2d
	:rtype: None
") SetMirrorAxis;
		void SetMirrorAxis (const gp_Ax2d & A);
		%feature("compactdefaultargs") SetAxis;
		%feature("autodoc", "	* Changes the local coordinate system of the parabola. The 'Location' point of A becomes the vertex of the parabola.

	:param A:
	:type A: gp_Ax22d
	:rtype: None
") SetAxis;
		void SetAxis (const gp_Ax22d & A);
		%feature("compactdefaultargs") Coefficients;
		%feature("autodoc", "	* Computes the coefficients of the implicit equation of the parabola. A * (X**2) + B * (Y**2) + 2*C*(X*Y) + 2*D*X + 2*E*Y + F = 0.

	:param A:
	:type A: float &
	:param B:
	:type B: float &
	:param C:
	:type C: float &
	:param D:
	:type D: float &
	:param E:
	:type E: float &
	:param F:
	:type F: float &
	:rtype: None
") Coefficients;
		void Coefficients (Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") Directrix;
		%feature("autodoc", "	* Computes the directrix of the parabola. The directrix is: - a line parallel to the 'Y Direction' of the local coordinate system of this parabola, and - located on the negative side of the axis of symmetry, at a distance from the apex which is equal to the focal length of this parabola. The directrix is returned as an axis (a gp_Ax2d object), the origin of which is situated on the 'X Axis' of this parabola.

	:rtype: gp_Ax2d
") Directrix;
		gp_Ax2d Directrix ();
		%feature("compactdefaultargs") Focal;
		%feature("autodoc", "	* Returns the distance between the vertex and the focus of the parabola.

	:rtype: float
") Focal;
		Standard_Real Focal ();
		%feature("compactdefaultargs") Focus;
		%feature("autodoc", "	* Returns the focus of the parabola.

	:rtype: gp_Pnt2d
") Focus;
		gp_Pnt2d Focus ();
		%feature("compactdefaultargs") Location;
		%feature("autodoc", "	* Returns the vertex of the parabola.

	:rtype: gp_Pnt2d
") Location;
		gp_Pnt2d Location ();
		%feature("compactdefaultargs") MirrorAxis;
		%feature("autodoc", "	* Returns the symmetry axis of the parabola. The 'Location' point of this axis is the vertex of the parabola.

	:rtype: gp_Ax2d
") MirrorAxis;
		gp_Ax2d MirrorAxis ();
		%feature("compactdefaultargs") Axis;
		%feature("autodoc", "	* Returns the local coordinate system of the parabola. The 'Location' point of this axis is the vertex of the parabola.

	:rtype: gp_Ax22d
") Axis;
		gp_Ax22d Axis ();
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "	* Returns the distance between the focus and the directrix of the parabola.

	:rtype: float
") Parameter;
		Standard_Real Parameter ();
		%feature("compactdefaultargs") Reverse;
		%feature("autodoc", "	:rtype: None
") Reverse;
		void Reverse ();
		%feature("compactdefaultargs") Reversed;
		%feature("autodoc", "	* Reverses the orientation of the local coordinate system of this parabola (the 'Y Direction' is reversed). Therefore, the implicit orientation of this parabola is reversed. Note: - Reverse assigns the result to this parabola, while - Reversed creates a new one.

	:rtype: gp_Parab2d
") Reversed;
		gp_Parab2d Reversed ();
		%feature("compactdefaultargs") IsDirect;
		%feature("autodoc", "	* Returns true if the local coordinate system is direct and false in the other case.

	:rtype: bool
") IsDirect;
		Standard_Boolean IsDirect ();
		%feature("compactdefaultargs") Mirror;
		%feature("autodoc", "	:param P:
	:type P: gp_Pnt2d
	:rtype: None
") Mirror;
		void Mirror (const gp_Pnt2d & P);
		%feature("compactdefaultargs") Mirrored;
		%feature("autodoc", "	* Performs the symmetrical transformation of a parabola with respect to the point P which is the center of the symmetry

	:param P:
	:type P: gp_Pnt2d
	:rtype: gp_Parab2d
") Mirrored;
		gp_Parab2d Mirrored (const gp_Pnt2d & P);
		%feature("compactdefaultargs") Mirror;
		%feature("autodoc", "	:param A:
	:type A: gp_Ax2d
	:rtype: None
") Mirror;
		void Mirror (const gp_Ax2d & A);
		%feature("compactdefaultargs") Mirrored;
		%feature("autodoc", "	* Performs the symmetrical transformation of a parabola with respect to an axis placement which is the axis of the symmetry.

	:param A:
	:type A: gp_Ax2d
	:rtype: gp_Parab2d
") Mirrored;
		gp_Parab2d Mirrored (const gp_Ax2d & A);
		%feature("compactdefaultargs") Rotate;
		%feature("autodoc", "	:param P:
	:type P: gp_Pnt2d
	:param Ang:
	:type Ang: float
	:rtype: None
") Rotate;
		void Rotate (const gp_Pnt2d & P,const Standard_Real Ang);
		%feature("compactdefaultargs") Rotated;
		%feature("autodoc", "	* Rotates a parabola. P is the center of the rotation. Ang is the angular value of the rotation in radians.

	:param P:
	:type P: gp_Pnt2d
	:param Ang:
	:type Ang: float
	:rtype: gp_Parab2d
") Rotated;
		gp_Parab2d Rotated (const gp_Pnt2d & P,const Standard_Real Ang);
		%feature("compactdefaultargs") Scale;
		%feature("autodoc", "	:param P:
	:type P: gp_Pnt2d
	:param S:
	:type S: float
	:rtype: None
") Scale;
		void Scale (const gp_Pnt2d & P,const Standard_Real S);
		%feature("compactdefaultargs") Scaled;
		%feature("autodoc", "	* Scales a parabola. S is the scaling value. If S is negative the direction of the symmetry axis 'XAxis' is reversed and the direction of the 'YAxis' too.

	:param P:
	:type P: gp_Pnt2d
	:param S:
	:type S: float
	:rtype: gp_Parab2d
") Scaled;
		gp_Parab2d Scaled (const gp_Pnt2d & P,const Standard_Real S);
		%feature("compactdefaultargs") Transform;
		%feature("autodoc", "	:param T:
	:type T: gp_Trsf2d
	:rtype: None
") Transform;
		void Transform (const gp_Trsf2d & T);
		%feature("compactdefaultargs") Transformed;
		%feature("autodoc", "	* Transforms an parabola with the transformation T from class Trsf2d.

	:param T:
	:type T: gp_Trsf2d
	:rtype: gp_Parab2d
") Transformed;
		gp_Parab2d Transformed (const gp_Trsf2d & T);
		%feature("compactdefaultargs") Translate;
		%feature("autodoc", "	:param V:
	:type V: gp_Vec2d
	:rtype: None
") Translate;
		void Translate (const gp_Vec2d & V);
		%feature("compactdefaultargs") Translated;
		%feature("autodoc", "	* Translates a parabola in the direction of the vector V. The magnitude of the translation is the vector's magnitude.

	:param V:
	:type V: gp_Vec2d
	:rtype: gp_Parab2d
") Translated;
		gp_Parab2d Translated (const gp_Vec2d & V);
		%feature("compactdefaultargs") Translate;
		%feature("autodoc", "	:param P1:
	:type P1: gp_Pnt2d
	:param P2:
	:type P2: gp_Pnt2d
	:rtype: None
") Translate;
		void Translate (const gp_Pnt2d & P1,const gp_Pnt2d & P2);
		%feature("compactdefaultargs") Translated;
		%feature("autodoc", "	* Translates a parabola from the point P1 to the point P2.

	:param P1:
	:type P1: gp_Pnt2d
	:param P2:
	:type P2: gp_Pnt2d
	:rtype: gp_Parab2d
") Translated;
		gp_Parab2d Translated (const gp_Pnt2d & P1,const gp_Pnt2d & P2);
		%feature("compactdefaultargs") _CSFDB_Getgp_Parab2dpos;
		%feature("autodoc", "	:rtype: gp_Ax22d
") _CSFDB_Getgp_Parab2dpos;
		const gp_Ax22d  _CSFDB_Getgp_Parab2dpos ();
		%feature("compactdefaultargs") _CSFDB_Getgp_Parab2dfocalLength;
		%feature("autodoc", "	:rtype: float
") _CSFDB_Getgp_Parab2dfocalLength;
		Standard_Real _CSFDB_Getgp_Parab2dfocalLength ();
		%feature("compactdefaultargs") _CSFDB_Setgp_Parab2dfocalLength;
		%feature("autodoc", "	:param p:
	:type p: float
	:rtype: None
") _CSFDB_Setgp_Parab2dfocalLength;
		void _CSFDB_Setgp_Parab2dfocalLength (const Standard_Real p);
};


%extend gp_Parab2d {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor gp_Pln;
class gp_Pln {
	public:
		%feature("compactdefaultargs") gp_Pln;
		%feature("autodoc", "	* Creates a plane coincident with OXY plane of the reference coordinate system.

	:rtype: None
") gp_Pln;
		 gp_Pln ();
		%feature("compactdefaultargs") gp_Pln;
		%feature("autodoc", "	* The coordinate system of the plane is defined with the axis placement A3. The 'Direction' of A3 defines the normal to the plane. The 'Location' of A3 defines the location (origin) of the plane. The 'XDirection' and 'YDirection' of A3 define the 'XAxis' and the 'YAxis' of the plane used to parametrize the plane.

	:param A3:
	:type A3: gp_Ax3
	:rtype: None
") gp_Pln;
		 gp_Pln (const gp_Ax3 & A3);
		%feature("compactdefaultargs") gp_Pln;
		%feature("autodoc", "	* Creates a plane with the 'Location' point <P> and the normal direction <V>.

	:param P:
	:type P: gp_Pnt
	:param V:
	:type V: gp_Dir
	:rtype: None
") gp_Pln;
		 gp_Pln (const gp_Pnt & P,const gp_Dir & V);
		%feature("compactdefaultargs") gp_Pln;
		%feature("autodoc", "	* Creates a plane from its cartesian equation : A * X + B * Y + C * Z + D = 0.0 Raises ConstructionError if Sqrt (A*A + B*B + C*C) <= Resolution from gp.

	:param A:
	:type A: float
	:param B:
	:type B: float
	:param C:
	:type C: float
	:param D:
	:type D: float
	:rtype: None
") gp_Pln;
		 gp_Pln (const Standard_Real A,const Standard_Real B,const Standard_Real C,const Standard_Real D);
		%feature("compactdefaultargs") Coefficients;
		%feature("autodoc", "	* Returns the coefficients of the plane's cartesian equation : A * X + B * Y + C * Z + D = 0.

	:param A:
	:type A: float &
	:param B:
	:type B: float &
	:param C:
	:type C: float &
	:param D:
	:type D: float &
	:rtype: None
") Coefficients;
		void Coefficients (Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") SetAxis;
		%feature("autodoc", "	* Modifies this plane, by redefining its local coordinate system so that - its origin and 'main Direction' become those of the axis A1 (the 'X Direction' and 'Y Direction' are then recomputed). Raises ConstructionError if the A1 is parallel to the 'XAxis' of the plane.

	:param A1:
	:type A1: gp_Ax1
	:rtype: None
") SetAxis;
		void SetAxis (const gp_Ax1 & A1);
		%feature("compactdefaultargs") SetLocation;
		%feature("autodoc", "	* Changes the origin of the plane.

	:param Loc:
	:type Loc: gp_Pnt
	:rtype: None
") SetLocation;
		void SetLocation (const gp_Pnt & Loc);
		%feature("compactdefaultargs") SetPosition;
		%feature("autodoc", "	* Changes the local coordinate system of the plane.

	:param A3:
	:type A3: gp_Ax3
	:rtype: None
") SetPosition;
		void SetPosition (const gp_Ax3 & A3);
		%feature("compactdefaultargs") UReverse;
		%feature("autodoc", "	* Reverses the U parametrization of the plane reversing the XAxis.

	:rtype: None
") UReverse;
		void UReverse ();
		%feature("compactdefaultargs") VReverse;
		%feature("autodoc", "	* Reverses the V parametrization of the plane reversing the YAxis.

	:rtype: None
") VReverse;
		void VReverse ();
		%feature("compactdefaultargs") Direct;
		%feature("autodoc", "	* returns true if the Ax3 is right handed.

	:rtype: bool
") Direct;
		Standard_Boolean Direct ();
		%feature("compactdefaultargs") Axis;
		%feature("autodoc", "	* Returns the plane's normal Axis.

	:rtype: gp_Ax1
") Axis;
		const gp_Ax1  Axis ();
		%feature("compactdefaultargs") Location;
		%feature("autodoc", "	* Returns the plane's location (origin).

	:rtype: gp_Pnt
") Location;
		const gp_Pnt  Location ();
		%feature("compactdefaultargs") Position;
		%feature("autodoc", "	* Returns the local coordinate system of the plane .

	:rtype: gp_Ax3
") Position;
		const gp_Ax3  Position ();
		%feature("compactdefaultargs") Distance;
		%feature("autodoc", "	* Computes the distance between <self> and the point <P>.

	:param P:
	:type P: gp_Pnt
	:rtype: float
") Distance;
		Standard_Real Distance (const gp_Pnt & P);
		%feature("compactdefaultargs") Distance;
		%feature("autodoc", "	* Computes the distance between <self> and the line <L>.

	:param L:
	:type L: gp_Lin
	:rtype: float
") Distance;
		Standard_Real Distance (const gp_Lin & L);
		%feature("compactdefaultargs") Distance;
		%feature("autodoc", "	* Computes the distance between two planes.

	:param Other:
	:type Other: gp_Pln
	:rtype: float
") Distance;
		Standard_Real Distance (const gp_Pln & Other);
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "	* Computes the square distance between <self> and the point <P>.

	:param P:
	:type P: gp_Pnt
	:rtype: float
") SquareDistance;
		Standard_Real SquareDistance (const gp_Pnt & P);
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "	* Computes the square distance between <self> and the line <L>.

	:param L:
	:type L: gp_Lin
	:rtype: float
") SquareDistance;
		Standard_Real SquareDistance (const gp_Lin & L);
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "	* Computes the square distance between two planes.

	:param Other:
	:type Other: gp_Pln
	:rtype: float
") SquareDistance;
		Standard_Real SquareDistance (const gp_Pln & Other);
		%feature("compactdefaultargs") XAxis;
		%feature("autodoc", "	* Returns the X axis of the plane.

	:rtype: gp_Ax1
") XAxis;
		gp_Ax1 XAxis ();
		%feature("compactdefaultargs") YAxis;
		%feature("autodoc", "	* Returns the Y axis of the plane.

	:rtype: gp_Ax1
") YAxis;
		gp_Ax1 YAxis ();
		%feature("compactdefaultargs") Contains;
		%feature("autodoc", "	* Returns true if this plane contains the point P. This means that - the distance between point P and this plane is less than or equal to LinearTolerance, or - line L is normal to the 'main Axis' of the local coordinate system of this plane, within the tolerance AngularTolerance, and the distance between the origin of line L and this plane is less than or equal to LinearTolerance.

	:param P:
	:type P: gp_Pnt
	:param LinearTolerance:
	:type LinearTolerance: float
	:rtype: bool
") Contains;
		Standard_Boolean Contains (const gp_Pnt & P,const Standard_Real LinearTolerance);
		%feature("compactdefaultargs") Contains;
		%feature("autodoc", "	* Returns true if this plane contains the line L. This means that - the distance between point P and this plane is less than or equal to LinearTolerance, or - line L is normal to the 'main Axis' of the local coordinate system of this plane, within the tolerance AngularTolerance, and the distance between the origin of line L and this plane is less than or equal to LinearTolerance.

	:param L:
	:type L: gp_Lin
	:param LinearTolerance:
	:type LinearTolerance: float
	:param AngularTolerance:
	:type AngularTolerance: float
	:rtype: bool
") Contains;
		Standard_Boolean Contains (const gp_Lin & L,const Standard_Real LinearTolerance,const Standard_Real AngularTolerance);
		%feature("compactdefaultargs") Mirror;
		%feature("autodoc", "	:param P:
	:type P: gp_Pnt
	:rtype: None
") Mirror;
		void Mirror (const gp_Pnt & P);
		%feature("compactdefaultargs") Mirrored;
		%feature("autodoc", "	* Performs the symmetrical transformation of a plane with respect to the point <P> which is the center of the symmetry Warnings : The normal direction to the plane is not changed. The 'XAxis' and the 'YAxis' are reversed.

	:param P:
	:type P: gp_Pnt
	:rtype: gp_Pln
") Mirrored;
		gp_Pln Mirrored (const gp_Pnt & P);
		%feature("compactdefaultargs") Mirror;
		%feature("autodoc", "	:param A1:
	:type A1: gp_Ax1
	:rtype: None
") Mirror;
		void Mirror (const gp_Ax1 & A1);
		%feature("compactdefaultargs") Mirrored;
		%feature("autodoc", "	* Performs the symmetrical transformation of a plane with respect to an axis placement which is the axis of the symmetry. The transformation is performed on the 'Location' point, on the 'XAxis' and the 'YAxis'. The resulting normal direction is the cross product between the 'XDirection' and the 'YDirection' after transformation if the initial plane was right handed, else it is the opposite.

	:param A1:
	:type A1: gp_Ax1
	:rtype: gp_Pln
") Mirrored;
		gp_Pln Mirrored (const gp_Ax1 & A1);
		%feature("compactdefaultargs") Mirror;
		%feature("autodoc", "	:param A2:
	:type A2: gp_Ax2
	:rtype: None
") Mirror;
		void Mirror (const gp_Ax2 & A2);
		%feature("compactdefaultargs") Mirrored;
		%feature("autodoc", "	* Performs the symmetrical transformation of a plane with respect to an axis placement. The axis placement <A2> locates the plane of the symmetry. The transformation is performed on the 'Location' point, on the 'XAxis' and the 'YAxis'. The resulting normal direction is the cross product between the 'XDirection' and the 'YDirection' after transformation if the initial plane was right handed, else it is the opposite.

	:param A2:
	:type A2: gp_Ax2
	:rtype: gp_Pln
") Mirrored;
		gp_Pln Mirrored (const gp_Ax2 & A2);
		%feature("compactdefaultargs") Rotate;
		%feature("autodoc", "	:param A1:
	:type A1: gp_Ax1
	:param Ang:
	:type Ang: float
	:rtype: None
") Rotate;
		void Rotate (const gp_Ax1 & A1,const Standard_Real Ang);
		%feature("compactdefaultargs") Rotated;
		%feature("autodoc", "	* rotates a plane. A1 is the axis of the rotation. Ang is the angular value of the rotation in radians.

	:param A1:
	:type A1: gp_Ax1
	:param Ang:
	:type Ang: float
	:rtype: gp_Pln
") Rotated;
		gp_Pln Rotated (const gp_Ax1 & A1,const Standard_Real Ang);
		%feature("compactdefaultargs") Scale;
		%feature("autodoc", "	:param P:
	:type P: gp_Pnt
	:param S:
	:type S: float
	:rtype: None
") Scale;
		void Scale (const gp_Pnt & P,const Standard_Real S);
		%feature("compactdefaultargs") Scaled;
		%feature("autodoc", "	* Scales a plane. S is the scaling value.

	:param P:
	:type P: gp_Pnt
	:param S:
	:type S: float
	:rtype: gp_Pln
") Scaled;
		gp_Pln Scaled (const gp_Pnt & P,const Standard_Real S);
		%feature("compactdefaultargs") Transform;
		%feature("autodoc", "	:param T:
	:type T: gp_Trsf
	:rtype: None
") Transform;
		void Transform (const gp_Trsf & T);
		%feature("compactdefaultargs") Transformed;
		%feature("autodoc", "	* Transforms a plane with the transformation T from class Trsf. The transformation is performed on the 'Location' point, on the 'XAxis' and the 'YAxis'. The resulting normal direction is the cross product between the 'XDirection' and the 'YDirection' after transformation.

	:param T:
	:type T: gp_Trsf
	:rtype: gp_Pln
") Transformed;
		gp_Pln Transformed (const gp_Trsf & T);
		%feature("compactdefaultargs") Translate;
		%feature("autodoc", "	:param V:
	:type V: gp_Vec
	:rtype: None
") Translate;
		void Translate (const gp_Vec & V);
		%feature("compactdefaultargs") Translated;
		%feature("autodoc", "	* Translates a plane in the direction of the vector V. The magnitude of the translation is the vector's magnitude.

	:param V:
	:type V: gp_Vec
	:rtype: gp_Pln
") Translated;
		gp_Pln Translated (const gp_Vec & V);
		%feature("compactdefaultargs") Translate;
		%feature("autodoc", "	:param P1:
	:type P1: gp_Pnt
	:param P2:
	:type P2: gp_Pnt
	:rtype: None
") Translate;
		void Translate (const gp_Pnt & P1,const gp_Pnt & P2);
		%feature("compactdefaultargs") Translated;
		%feature("autodoc", "	* Translates a plane from the point P1 to the point P2.

	:param P1:
	:type P1: gp_Pnt
	:param P2:
	:type P2: gp_Pnt
	:rtype: gp_Pln
") Translated;
		gp_Pln Translated (const gp_Pnt & P1,const gp_Pnt & P2);
		%feature("compactdefaultargs") _CSFDB_Getgp_Plnpos;
		%feature("autodoc", "	:rtype: gp_Ax3
") _CSFDB_Getgp_Plnpos;
		const gp_Ax3  _CSFDB_Getgp_Plnpos ();
};


%extend gp_Pln {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor gp_Pnt;
class gp_Pnt {
	public:
		%feature("compactdefaultargs") gp_Pnt;
		%feature("autodoc", "	* Creates a point with zero coordinates.

	:rtype: None
") gp_Pnt;
		 gp_Pnt ();
		%feature("compactdefaultargs") gp_Pnt;
		%feature("autodoc", "	* Creates a point from a XYZ object.

	:param Coord:
	:type Coord: gp_XYZ
	:rtype: None
") gp_Pnt;
		 gp_Pnt (const gp_XYZ & Coord);
		%feature("compactdefaultargs") gp_Pnt;
		%feature("autodoc", "	* Creates a point with its 3 cartesian's coordinates : Xp, Yp, Zp.

	:param Xp:
	:type Xp: float
	:param Yp:
	:type Yp: float
	:param Zp:
	:type Zp: float
	:rtype: None
") gp_Pnt;
		 gp_Pnt (const Standard_Real Xp,const Standard_Real Yp,const Standard_Real Zp);
		%feature("compactdefaultargs") SetCoord;
		%feature("autodoc", "	* Changes the coordinate of range Index : Index = 1 => X is modified Index = 2 => Y is modified Index = 3 => Z is modified Raised if Index != {1, 2, 3}.

	:param Index:
	:type Index: int
	:param Xi:
	:type Xi: float
	:rtype: None
") SetCoord;
		void SetCoord (const Standard_Integer Index,const Standard_Real Xi);
		%feature("compactdefaultargs") SetCoord;
		%feature("autodoc", "	* For this point, assigns the values Xp, Yp and Zp to its three coordinates.

	:param Xp:
	:type Xp: float
	:param Yp:
	:type Yp: float
	:param Zp:
	:type Zp: float
	:rtype: None
") SetCoord;
		void SetCoord (const Standard_Real Xp,const Standard_Real Yp,const Standard_Real Zp);
		%feature("compactdefaultargs") SetX;
		%feature("autodoc", "	* Assigns the given value to the X coordinate of this point.

	:param X:
	:type X: float
	:rtype: None
") SetX;
		void SetX (const Standard_Real X);
		%feature("compactdefaultargs") SetY;
		%feature("autodoc", "	* Assigns the given value to the Y coordinate of this point.

	:param Y:
	:type Y: float
	:rtype: None
") SetY;
		void SetY (const Standard_Real Y);
		%feature("compactdefaultargs") SetZ;
		%feature("autodoc", "	* Assigns the given value to the Z coordinate of this point.

	:param Z:
	:type Z: float
	:rtype: None
") SetZ;
		void SetZ (const Standard_Real Z);
		%feature("compactdefaultargs") SetXYZ;
		%feature("autodoc", "	* Assigns the three coordinates of Coord to this point.

	:param Coord:
	:type Coord: gp_XYZ
	:rtype: None
") SetXYZ;
		void SetXYZ (const gp_XYZ & Coord);
		%feature("compactdefaultargs") Coord;
		%feature("autodoc", "	* Returns the coordinate of corresponding to the value of Index : Index = 1 => X is returned Index = 2 => Y is returned Index = 3 => Z is returned Raises OutOfRange if Index != {1, 2, 3}. Raised if Index != {1, 2, 3}.

	:param Index:
	:type Index: int
	:rtype: float
") Coord;
		Standard_Real Coord (const Standard_Integer Index);
		%feature("compactdefaultargs") Coord;
		%feature("autodoc", "	* For this point gives its three coordinates Xp, Yp and Zp.

	:param Xp:
	:type Xp: float &
	:param Yp:
	:type Yp: float &
	:param Zp:
	:type Zp: float &
	:rtype: None
") Coord;
		void Coord (Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") X;
		%feature("autodoc", "	* For this point, returns its X coordinate.

	:rtype: float
") X;
		Standard_Real X ();
		%feature("compactdefaultargs") Y;
		%feature("autodoc", "	* For this point, returns its Y coordinate.

	:rtype: float
") Y;
		Standard_Real Y ();
		%feature("compactdefaultargs") Z;
		%feature("autodoc", "	* For this point, returns its Z coordinate.

	:rtype: float
") Z;
		Standard_Real Z ();
		%feature("compactdefaultargs") XYZ;
		%feature("autodoc", "	* For this point, returns its three coordinates as a XYZ object.

	:rtype: gp_XYZ
") XYZ;
		const gp_XYZ  XYZ ();
		%feature("compactdefaultargs") Coord;
		%feature("autodoc", "	* For this point, returns its three coordinates as a XYZ object.

	:rtype: gp_XYZ
") Coord;
		const gp_XYZ  Coord ();
		%feature("compactdefaultargs") ChangeCoord;
		%feature("autodoc", "	* Returns the coordinates of this point. Note: This syntax allows direct modification of the returned value.

	:rtype: gp_XYZ
") ChangeCoord;
		gp_XYZ  ChangeCoord ();
		%feature("compactdefaultargs") BaryCenter;
		%feature("autodoc", "	* Assigns the result of the following expression to this point (Alpha*this + Beta*P) / (Alpha + Beta)

	:param Alpha:
	:type Alpha: float
	:param P:
	:type P: gp_Pnt
	:param Beta:
	:type Beta: float
	:rtype: None
") BaryCenter;
		void BaryCenter (const Standard_Real Alpha,const gp_Pnt & P,const Standard_Real Beta);
		%feature("compactdefaultargs") IsEqual;
		%feature("autodoc", "	* Comparison Returns True if the distance between the two points is lower or equal to LinearTolerance.

	:param Other:
	:type Other: gp_Pnt
	:param LinearTolerance:
	:type LinearTolerance: float
	:rtype: bool
") IsEqual;
		Standard_Boolean IsEqual (const gp_Pnt & Other,const Standard_Real LinearTolerance);
		%feature("compactdefaultargs") Distance;
		%feature("autodoc", "	* Computes the distance between two points.

	:param Other:
	:type Other: gp_Pnt
	:rtype: float
") Distance;
		Standard_Real Distance (const gp_Pnt & Other);
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "	* Computes the square distance between two points.

	:param Other:
	:type Other: gp_Pnt
	:rtype: float
") SquareDistance;
		Standard_Real SquareDistance (const gp_Pnt & Other);
		%feature("compactdefaultargs") Mirror;
		%feature("autodoc", "	* Performs the symmetrical transformation of a point with respect to the point P which is the center of the symmetry.

	:param P:
	:type P: gp_Pnt
	:rtype: None
") Mirror;
		void Mirror (const gp_Pnt & P);
		%feature("compactdefaultargs") Mirrored;
		%feature("autodoc", "	* Performs the symmetrical transformation of a point with respect to an axis placement which is the axis of the symmetry.

	:param P:
	:type P: gp_Pnt
	:rtype: gp_Pnt
") Mirrored;
		gp_Pnt Mirrored (const gp_Pnt & P);
		%feature("compactdefaultargs") Mirror;
		%feature("autodoc", "	:param A1:
	:type A1: gp_Ax1
	:rtype: None
") Mirror;
		void Mirror (const gp_Ax1 & A1);
		%feature("compactdefaultargs") Mirrored;
		%feature("autodoc", "	* Performs the symmetrical transformation of a point with respect to a plane. The axis placement A2 locates the plane of the symmetry : (Location, XDirection, YDirection).

	:param A1:
	:type A1: gp_Ax1
	:rtype: gp_Pnt
") Mirrored;
		gp_Pnt Mirrored (const gp_Ax1 & A1);
		%feature("compactdefaultargs") Mirror;
		%feature("autodoc", "	:param A2:
	:type A2: gp_Ax2
	:rtype: None
") Mirror;
		void Mirror (const gp_Ax2 & A2);
		%feature("compactdefaultargs") Mirrored;
		%feature("autodoc", "	* Rotates a point. A1 is the axis of the rotation. Ang is the angular value of the rotation in radians.

	:param A2:
	:type A2: gp_Ax2
	:rtype: gp_Pnt
") Mirrored;
		gp_Pnt Mirrored (const gp_Ax2 & A2);
		%feature("compactdefaultargs") Rotate;
		%feature("autodoc", "	:param A1:
	:type A1: gp_Ax1
	:param Ang:
	:type Ang: float
	:rtype: None
") Rotate;
		void Rotate (const gp_Ax1 & A1,const Standard_Real Ang);
		%feature("compactdefaultargs") Rotated;
		%feature("autodoc", "	* Scales a point. S is the scaling value.

	:param A1:
	:type A1: gp_Ax1
	:param Ang:
	:type Ang: float
	:rtype: gp_Pnt
") Rotated;
		gp_Pnt Rotated (const gp_Ax1 & A1,const Standard_Real Ang);
		%feature("compactdefaultargs") Scale;
		%feature("autodoc", "	:param P:
	:type P: gp_Pnt
	:param S:
	:type S: float
	:rtype: None
") Scale;
		void Scale (const gp_Pnt & P,const Standard_Real S);
		%feature("compactdefaultargs") Scaled;
		%feature("autodoc", "	* Transforms a point with the transformation T.

	:param P:
	:type P: gp_Pnt
	:param S:
	:type S: float
	:rtype: gp_Pnt
") Scaled;
		gp_Pnt Scaled (const gp_Pnt & P,const Standard_Real S);
		%feature("compactdefaultargs") Transform;
		%feature("autodoc", "	:param T:
	:type T: gp_Trsf
	:rtype: None
") Transform;
		void Transform (const gp_Trsf & T);
		%feature("compactdefaultargs") Transformed;
		%feature("autodoc", "	* Translates a point in the direction of the vector V. The magnitude of the translation is the vector's magnitude.

	:param T:
	:type T: gp_Trsf
	:rtype: gp_Pnt
") Transformed;
		gp_Pnt Transformed (const gp_Trsf & T);
		%feature("compactdefaultargs") Translate;
		%feature("autodoc", "	:param V:
	:type V: gp_Vec
	:rtype: None
") Translate;
		void Translate (const gp_Vec & V);
		%feature("compactdefaultargs") Translated;
		%feature("autodoc", "	* Translates a point from the point P1 to the point P2.

	:param V:
	:type V: gp_Vec
	:rtype: gp_Pnt
") Translated;
		gp_Pnt Translated (const gp_Vec & V);
		%feature("compactdefaultargs") Translate;
		%feature("autodoc", "	:param P1:
	:type P1: gp_Pnt
	:param P2:
	:type P2: gp_Pnt
	:rtype: None
") Translate;
		void Translate (const gp_Pnt & P1,const gp_Pnt & P2);
		%feature("compactdefaultargs") Translated;
		%feature("autodoc", "	:param P1:
	:type P1: gp_Pnt
	:param P2:
	:type P2: gp_Pnt
	:rtype: gp_Pnt
") Translated;
		gp_Pnt Translated (const gp_Pnt & P1,const gp_Pnt & P2);
		%feature("compactdefaultargs") _CSFDB_Getgp_Pntcoord;
		%feature("autodoc", "	:rtype: gp_XYZ
") _CSFDB_Getgp_Pntcoord;
		const gp_XYZ  _CSFDB_Getgp_Pntcoord ();
};


%extend gp_Pnt {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor gp_Pnt2d;
class gp_Pnt2d {
	public:
		%feature("compactdefaultargs") gp_Pnt2d;
		%feature("autodoc", "	* Creates a point with zero coordinates.

	:rtype: None
") gp_Pnt2d;
		 gp_Pnt2d ();
		%feature("compactdefaultargs") gp_Pnt2d;
		%feature("autodoc", "	* Creates a point with a doublet of coordinates.

	:param Coord:
	:type Coord: gp_XY
	:rtype: None
") gp_Pnt2d;
		 gp_Pnt2d (const gp_XY & Coord);
		%feature("compactdefaultargs") gp_Pnt2d;
		%feature("autodoc", "	* Creates a point with its 2 cartesian's coordinates : Xp, Yp.

	:param Xp:
	:type Xp: float
	:param Yp:
	:type Yp: float
	:rtype: None
") gp_Pnt2d;
		 gp_Pnt2d (const Standard_Real Xp,const Standard_Real Yp);
		%feature("compactdefaultargs") SetCoord;
		%feature("autodoc", "	* Assigns the value Xi to the coordinate that corresponds to Index: Index = 1 => X is modified Index = 2 => Y is modified Raises OutOfRange if Index != {1, 2}.

	:param Index:
	:type Index: int
	:param Xi:
	:type Xi: float
	:rtype: None
") SetCoord;
		void SetCoord (const Standard_Integer Index,const Standard_Real Xi);
		%feature("compactdefaultargs") SetCoord;
		%feature("autodoc", "	* For this point, assigns the values Xp and Yp to its two coordinates

	:param Xp:
	:type Xp: float
	:param Yp:
	:type Yp: float
	:rtype: None
") SetCoord;
		void SetCoord (const Standard_Real Xp,const Standard_Real Yp);
		%feature("compactdefaultargs") SetX;
		%feature("autodoc", "	* Assigns the given value to the X coordinate of this point.

	:param X:
	:type X: float
	:rtype: None
") SetX;
		void SetX (const Standard_Real X);
		%feature("compactdefaultargs") SetY;
		%feature("autodoc", "	* Assigns the given value to the Y coordinate of this point.

	:param Y:
	:type Y: float
	:rtype: None
") SetY;
		void SetY (const Standard_Real Y);
		%feature("compactdefaultargs") SetXY;
		%feature("autodoc", "	* Assigns the two coordinates of Coord to this point.

	:param Coord:
	:type Coord: gp_XY
	:rtype: None
") SetXY;
		void SetXY (const gp_XY & Coord);
		%feature("compactdefaultargs") Coord;
		%feature("autodoc", "	* Returns the coordinate of range Index : Index = 1 => X is returned Index = 2 => Y is returned Raises OutOfRange if Index != {1, 2}.

	:param Index:
	:type Index: int
	:rtype: float
") Coord;
		Standard_Real Coord (const Standard_Integer Index);
		%feature("compactdefaultargs") Coord;
		%feature("autodoc", "	* For this point returns its two coordinates as a number pair.

	:param Xp:
	:type Xp: float &
	:param Yp:
	:type Yp: float &
	:rtype: None
") Coord;
		void Coord (Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") X;
		%feature("autodoc", "	* For this point, returns its X coordinate.

	:rtype: float
") X;
		Standard_Real X ();
		%feature("compactdefaultargs") Y;
		%feature("autodoc", "	* For this point, returns its Y coordinate.

	:rtype: float
") Y;
		Standard_Real Y ();
		%feature("compactdefaultargs") XY;
		%feature("autodoc", "	* For this point, returns its two coordinates as a number pair.

	:rtype: gp_XY
") XY;
		const gp_XY  XY ();
		%feature("compactdefaultargs") Coord;
		%feature("autodoc", "	* For this point, returns its two coordinates as a number pair.

	:rtype: gp_XY
") Coord;
		const gp_XY  Coord ();
		%feature("compactdefaultargs") ChangeCoord;
		%feature("autodoc", "	* Returns the coordinates of this point. Note: This syntax allows direct modification of the returned value.

	:rtype: gp_XY
") ChangeCoord;
		gp_XY  ChangeCoord ();
		%feature("compactdefaultargs") IsEqual;
		%feature("autodoc", "	* Comparison Returns True if the distance between the two points is lower or equal to LinearTolerance.

	:param Other:
	:type Other: gp_Pnt2d
	:param LinearTolerance:
	:type LinearTolerance: float
	:rtype: bool
") IsEqual;
		Standard_Boolean IsEqual (const gp_Pnt2d & Other,const Standard_Real LinearTolerance);
		%feature("compactdefaultargs") Distance;
		%feature("autodoc", "	* Computes the distance between two points.

	:param Other:
	:type Other: gp_Pnt2d
	:rtype: float
") Distance;
		Standard_Real Distance (const gp_Pnt2d & Other);
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "	* Computes the square distance between two points.

	:param Other:
	:type Other: gp_Pnt2d
	:rtype: float
") SquareDistance;
		Standard_Real SquareDistance (const gp_Pnt2d & Other);
		%feature("compactdefaultargs") Mirror;
		%feature("autodoc", "	* Performs the symmetrical transformation of a point with respect to the point P which is the center of the symmetry.

	:param P:
	:type P: gp_Pnt2d
	:rtype: None
") Mirror;
		void Mirror (const gp_Pnt2d & P);
		%feature("compactdefaultargs") Mirrored;
		%feature("autodoc", "	* Performs the symmetrical transformation of a point with respect to an axis placement which is the axis

	:param P:
	:type P: gp_Pnt2d
	:rtype: gp_Pnt2d
") Mirrored;
		gp_Pnt2d Mirrored (const gp_Pnt2d & P);
		%feature("compactdefaultargs") Mirror;
		%feature("autodoc", "	:param A:
	:type A: gp_Ax2d
	:rtype: None
") Mirror;
		void Mirror (const gp_Ax2d & A);
		%feature("compactdefaultargs") Mirrored;
		%feature("autodoc", "	* Rotates a point. A1 is the axis of the rotation. Ang is the angular value of the rotation in radians.

	:param A:
	:type A: gp_Ax2d
	:rtype: gp_Pnt2d
") Mirrored;
		gp_Pnt2d Mirrored (const gp_Ax2d & A);
		%feature("compactdefaultargs") Rotate;
		%feature("autodoc", "	:param P:
	:type P: gp_Pnt2d
	:param Ang:
	:type Ang: float
	:rtype: None
") Rotate;
		void Rotate (const gp_Pnt2d & P,const Standard_Real Ang);
		%feature("compactdefaultargs") Rotated;
		%feature("autodoc", "	* Scales a point. S is the scaling value.

	:param P:
	:type P: gp_Pnt2d
	:param Ang:
	:type Ang: float
	:rtype: gp_Pnt2d
") Rotated;
		gp_Pnt2d Rotated (const gp_Pnt2d & P,const Standard_Real Ang);
		%feature("compactdefaultargs") Scale;
		%feature("autodoc", "	:param P:
	:type P: gp_Pnt2d
	:param S:
	:type S: float
	:rtype: None
") Scale;
		void Scale (const gp_Pnt2d & P,const Standard_Real S);
		%feature("compactdefaultargs") Scaled;
		%feature("autodoc", "	* Transforms a point with the transformation T.

	:param P:
	:type P: gp_Pnt2d
	:param S:
	:type S: float
	:rtype: gp_Pnt2d
") Scaled;
		gp_Pnt2d Scaled (const gp_Pnt2d & P,const Standard_Real S);
		%feature("compactdefaultargs") Transform;
		%feature("autodoc", "	:param T:
	:type T: gp_Trsf2d
	:rtype: None
") Transform;
		void Transform (const gp_Trsf2d & T);
		%feature("compactdefaultargs") Transformed;
		%feature("autodoc", "	* Translates a point in the direction of the vector V. The magnitude of the translation is the vector's magnitude.

	:param T:
	:type T: gp_Trsf2d
	:rtype: gp_Pnt2d
") Transformed;
		gp_Pnt2d Transformed (const gp_Trsf2d & T);
		%feature("compactdefaultargs") Translate;
		%feature("autodoc", "	:param V:
	:type V: gp_Vec2d
	:rtype: None
") Translate;
		void Translate (const gp_Vec2d & V);
		%feature("compactdefaultargs") Translated;
		%feature("autodoc", "	* Translates a point from the point P1 to the point P2.

	:param V:
	:type V: gp_Vec2d
	:rtype: gp_Pnt2d
") Translated;
		gp_Pnt2d Translated (const gp_Vec2d & V);
		%feature("compactdefaultargs") Translate;
		%feature("autodoc", "	:param P1:
	:type P1: gp_Pnt2d
	:param P2:
	:type P2: gp_Pnt2d
	:rtype: None
") Translate;
		void Translate (const gp_Pnt2d & P1,const gp_Pnt2d & P2);
		%feature("compactdefaultargs") Translated;
		%feature("autodoc", "	:param P1:
	:type P1: gp_Pnt2d
	:param P2:
	:type P2: gp_Pnt2d
	:rtype: gp_Pnt2d
") Translated;
		gp_Pnt2d Translated (const gp_Pnt2d & P1,const gp_Pnt2d & P2);
		%feature("compactdefaultargs") _CSFDB_Getgp_Pnt2dcoord;
		%feature("autodoc", "	:rtype: gp_XY
") _CSFDB_Getgp_Pnt2dcoord;
		const gp_XY  _CSFDB_Getgp_Pnt2dcoord ();
};


%extend gp_Pnt2d {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor gp_Quaternion;
class gp_Quaternion {
	public:
		%feature("compactdefaultargs") gp_Quaternion;
		%feature("autodoc", "	* Creates an identity quaternion

	:rtype: None
") gp_Quaternion;
		 gp_Quaternion ();
		%feature("compactdefaultargs") gp_Quaternion;
		%feature("autodoc", "	* Creates quaternion directly from component values

	:param x:
	:type x: float
	:param y:
	:type y: float
	:param z:
	:type z: float
	:param w:
	:type w: float
	:rtype: None
") gp_Quaternion;
		 gp_Quaternion (const Standard_Real x,const Standard_Real y,const Standard_Real z,const Standard_Real w);
		%feature("compactdefaultargs") gp_Quaternion;
		%feature("autodoc", "	* Creates copy of another quaternion

	:param theToCopy:
	:type theToCopy: gp_Quaternion
	:rtype: None
") gp_Quaternion;
		 gp_Quaternion (const gp_Quaternion & theToCopy);
		%feature("compactdefaultargs") gp_Quaternion;
		%feature("autodoc", "	* Creates quaternion representing shortest-arc rotation operator producing vector theVecTo from vector theVecFrom.

	:param theVecFrom:
	:type theVecFrom: gp_Vec
	:param theVecTo:
	:type theVecTo: gp_Vec
	:rtype: None
") gp_Quaternion;
		 gp_Quaternion (const gp_Vec & theVecFrom,const gp_Vec & theVecTo);
		%feature("compactdefaultargs") gp_Quaternion;
		%feature("autodoc", "	* Creates quaternion representing shortest-arc rotation operator producing vector theVecTo from vector theVecFrom. Additional vector theHelpCrossVec defines preferred direction for rotation and is used when theVecTo and theVecFrom are directed oppositely.

	:param theVecFrom:
	:type theVecFrom: gp_Vec
	:param theVecTo:
	:type theVecTo: gp_Vec
	:param theHelpCrossVec:
	:type theHelpCrossVec: gp_Vec
	:rtype: None
") gp_Quaternion;
		 gp_Quaternion (const gp_Vec & theVecFrom,const gp_Vec & theVecTo,const gp_Vec & theHelpCrossVec);
		%feature("compactdefaultargs") gp_Quaternion;
		%feature("autodoc", "	* Creates quaternion representing rotation on angle theAngle around vector theAxis

	:param theAxis:
	:type theAxis: gp_Vec
	:param theAngle:
	:type theAngle: float
	:rtype: None
") gp_Quaternion;
		 gp_Quaternion (const gp_Vec & theAxis,const Standard_Real theAngle);
		%feature("compactdefaultargs") gp_Quaternion;
		%feature("autodoc", "	* Creates quaternion from rotation matrix 3*3 (which should be orthonormal skew-symmetric matrix)

	:param theMat:
	:type theMat: gp_Mat
	:rtype: None
") gp_Quaternion;
		 gp_Quaternion (const gp_Mat & theMat);
		%feature("compactdefaultargs") IsEqual;
		%feature("autodoc", "	* Simple equal test without precision

	:param theOther:
	:type theOther: gp_Quaternion
	:rtype: bool
") IsEqual;
		Standard_Boolean IsEqual (const gp_Quaternion & theOther);
		%feature("compactdefaultargs") SetRotation;
		%feature("autodoc", "	* Sets quaternion to shortest-arc rotation producing vector theVecTo from vector theVecFrom. If vectors theVecFrom and theVecTo are opposite then rotation axis is computed as theVecFrom ^ (1,0,0) or theVecFrom ^ (0,0,1).

	:param theVecFrom:
	:type theVecFrom: gp_Vec
	:param theVecTo:
	:type theVecTo: gp_Vec
	:rtype: None
") SetRotation;
		void SetRotation (const gp_Vec & theVecFrom,const gp_Vec & theVecTo);
		%feature("compactdefaultargs") SetRotation;
		%feature("autodoc", "	* Sets quaternion to shortest-arc rotation producing vector theVecTo from vector theVecFrom. If vectors theVecFrom and theVecTo are opposite then rotation axis is computed as theVecFrom ^ theHelpCrossVec.

	:param theVecFrom:
	:type theVecFrom: gp_Vec
	:param theVecTo:
	:type theVecTo: gp_Vec
	:param theHelpCrossVec:
	:type theHelpCrossVec: gp_Vec
	:rtype: None
") SetRotation;
		void SetRotation (const gp_Vec & theVecFrom,const gp_Vec & theVecTo,const gp_Vec & theHelpCrossVec);
		%feature("compactdefaultargs") SetVectorAndAngle;
		%feature("autodoc", "	* Create a unit quaternion from Axis+Angle representation

	:param theAxis:
	:type theAxis: gp_Vec
	:param theAngle:
	:type theAngle: float
	:rtype: None
") SetVectorAndAngle;
		void SetVectorAndAngle (const gp_Vec & theAxis,const Standard_Real theAngle);
		%feature("compactdefaultargs") GetVectorAndAngle;
		%feature("autodoc", "	* Convert a quaternion to Axis+Angle representation, preserve the axis direction and angle from -PI to +PI

	:param theAxis:
	:type theAxis: gp_Vec
	:param theAngle:
	:type theAngle: float &
	:rtype: None
") GetVectorAndAngle;
		void GetVectorAndAngle (gp_Vec & theAxis,Standard_Real &OutValue);
		%feature("compactdefaultargs") SetMatrix;
		%feature("autodoc", "	* Create a unit quaternion by rotation matrix matrix must contain only rotation (not scale or shear) //! For numerical stability we find first the greatest component of quaternion and than search others from this one

	:param theMat:
	:type theMat: gp_Mat
	:rtype: None
") SetMatrix;
		void SetMatrix (const gp_Mat & theMat);
		%feature("compactdefaultargs") GetMatrix;
		%feature("autodoc", "	* Returns rotation operation as 3*3 matrix

	:rtype: gp_Mat
") GetMatrix;
		gp_Mat GetMatrix ();
		%feature("compactdefaultargs") SetEulerAngles;
		%feature("autodoc", "	* Create a unit quaternion representing rotation defined by generalized Euler angles

	:param theOrder:
	:type theOrder: gp_EulerSequence
	:param theAlpha:
	:type theAlpha: float
	:param theBeta:
	:type theBeta: float
	:param theGamma:
	:type theGamma: float
	:rtype: None
") SetEulerAngles;
		void SetEulerAngles (const gp_EulerSequence theOrder,const Standard_Real theAlpha,const Standard_Real theBeta,const Standard_Real theGamma);
		%feature("compactdefaultargs") GetEulerAngles;
		%feature("autodoc", "	* Returns Euler angles describing current rotation

	:param theOrder:
	:type theOrder: gp_EulerSequence
	:param theAlpha:
	:type theAlpha: float &
	:param theBeta:
	:type theBeta: float &
	:param theGamma:
	:type theGamma: float &
	:rtype: None
") GetEulerAngles;
		void GetEulerAngles (const gp_EulerSequence theOrder,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "	:param x:
	:type x: float
	:param y:
	:type y: float
	:param z:
	:type z: float
	:param w:
	:type w: float
	:rtype: None
") Set;
		void Set (const Standard_Real x,const Standard_Real y,const Standard_Real z,const Standard_Real w);
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "	:param theQuaternion:
	:type theQuaternion: gp_Quaternion
	:rtype: None
") Set;
		void Set (const gp_Quaternion & theQuaternion);
		%feature("compactdefaultargs") X;
		%feature("autodoc", "	:rtype: float
") X;
		Standard_Real X ();
		%feature("compactdefaultargs") Y;
		%feature("autodoc", "	:rtype: float
") Y;
		Standard_Real Y ();
		%feature("compactdefaultargs") Z;
		%feature("autodoc", "	:rtype: float
") Z;
		Standard_Real Z ();
		%feature("compactdefaultargs") W;
		%feature("autodoc", "	:rtype: float
") W;
		Standard_Real W ();
		%feature("compactdefaultargs") SetIdent;
		%feature("autodoc", "	* Make identity quaternion (zero-rotation)

	:rtype: None
") SetIdent;
		void SetIdent ();
		%feature("compactdefaultargs") Reverse;
		%feature("autodoc", "	* Reverse direction of rotation (conjugate quaternion)

	:rtype: None
") Reverse;
		void Reverse ();
		%feature("compactdefaultargs") Reversed;
		%feature("autodoc", "	* Return rotation with reversed direction (conjugated quaternion)

	:rtype: gp_Quaternion
") Reversed;
		gp_Quaternion Reversed ();
		%feature("compactdefaultargs") Invert;
		%feature("autodoc", "	* Inverts quaternion (both rotation direction and norm)

	:rtype: None
") Invert;
		void Invert ();
		%feature("compactdefaultargs") Inverted;
		%feature("autodoc", "	* Return inversed quaternion q^-1

	:rtype: gp_Quaternion
") Inverted;
		gp_Quaternion Inverted ();
		%feature("compactdefaultargs") SquareNorm;
		%feature("autodoc", "	* Returns square norm of quaternion

	:rtype: float
") SquareNorm;
		Standard_Real SquareNorm ();
		%feature("compactdefaultargs") Norm;
		%feature("autodoc", "	* Returns norm of quaternion

	:rtype: float
") Norm;
		Standard_Real Norm ();
		%feature("compactdefaultargs") Scale;
		%feature("autodoc", "	* Scale all components by quaternion by theScale; note that rotation is not changed by this operation (except 0-scaling)

	:param theScale:
	:type theScale: float
	:rtype: None
") Scale;
		void Scale (const Standard_Real theScale);
		%feature("compactdefaultargs") operator *=;
		%feature("autodoc", "	:param theScale:
	:type theScale: float
	:rtype: None
") operator *=;
		void operator *= (const Standard_Real theScale);
		%feature("compactdefaultargs") Scaled;
		%feature("autodoc", "	* Returns scaled quaternion

	:param theScale:
	:type theScale: float
	:rtype: gp_Quaternion
") Scaled;
		gp_Quaternion Scaled (const Standard_Real theScale);
		%feature("compactdefaultargs") operator *;
		%feature("autodoc", "	:param theScale:
	:type theScale: float
	:rtype: gp_Quaternion
") operator *;
		gp_Quaternion operator * (const Standard_Real theScale);
		%feature("compactdefaultargs") StabilizeLength;
		%feature("autodoc", "	* Stabilize quaternion length within 1 - 1/4. This operation is a lot faster than normalization and preserve length goes to 0 or infinity

	:rtype: None
") StabilizeLength;
		void StabilizeLength ();
		%feature("compactdefaultargs") Normalize;
		%feature("autodoc", "	* Scale quaternion that its norm goes to 1. The appearing of 0 magnitude or near is a error, so we can be sure that can divide by magnitude

	:rtype: None
") Normalize;
		void Normalize ();
		%feature("compactdefaultargs") Normalized;
		%feature("autodoc", "	* Returns quaternion scaled so that its norm goes to 1.

	:rtype: gp_Quaternion
") Normalized;
		gp_Quaternion Normalized ();
		%feature("compactdefaultargs") Negated;
		%feature("autodoc", "	* Returns quaternion with all components negated. Note that this operation does not affect neither rotation operator defined by quaternion nor its norm.

	:rtype: gp_Quaternion
") Negated;
		gp_Quaternion Negated ();
		%feature("compactdefaultargs") operator -;
		%feature("autodoc", "	:rtype: gp_Quaternion
") operator -;
		gp_Quaternion operator - ();
		%feature("compactdefaultargs") Added;
		%feature("autodoc", "	* Makes sum of quaternion components; result is 'rotations mix'

	:param theOther:
	:type theOther: gp_Quaternion
	:rtype: gp_Quaternion
") Added;
		gp_Quaternion Added (const gp_Quaternion & theOther);
		%feature("compactdefaultargs") operator +;
		%feature("autodoc", "	:param theOther:
	:type theOther: gp_Quaternion
	:rtype: gp_Quaternion
") operator +;
		gp_Quaternion operator + (const gp_Quaternion & theOther);
		%feature("compactdefaultargs") Subtracted;
		%feature("autodoc", "	* Makes difference of quaternion components; result is 'rotations mix'

	:param theOther:
	:type theOther: gp_Quaternion
	:rtype: gp_Quaternion
") Subtracted;
		gp_Quaternion Subtracted (const gp_Quaternion & theOther);
		%feature("compactdefaultargs") operator -;
		%feature("autodoc", "	:param theOther:
	:type theOther: gp_Quaternion
	:rtype: gp_Quaternion
") operator -;
		gp_Quaternion operator - (const gp_Quaternion & theOther);
		%feature("compactdefaultargs") Multiplied;
		%feature("autodoc", "	* Multiply function - work the same as Matrices multiplying. qq' = (cross(v,v') + wv' + w'v, ww' - dot(v,v')) Result is rotation combination: q' than q (here q=this, q'=theQ). Notices than: qq' != q'q; qq^-1 = q;

	:param theOther:
	:type theOther: gp_Quaternion
	:rtype: gp_Quaternion
") Multiplied;
		gp_Quaternion Multiplied (const gp_Quaternion & theOther);
		%feature("compactdefaultargs") operator *;
		%feature("autodoc", "	:param theOther:
	:type theOther: gp_Quaternion
	:rtype: gp_Quaternion
") operator *;
		gp_Quaternion operator * (const gp_Quaternion & theOther);
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "	* Adds componnets of other quaternion; result is 'rotations mix'

	:param theOther:
	:type theOther: gp_Quaternion
	:rtype: None
") Add;
		void Add (const gp_Quaternion & theOther);
		%feature("compactdefaultargs") operator +=;
		%feature("autodoc", "	:param theOther:
	:type theOther: gp_Quaternion
	:rtype: None
") operator +=;
		void operator += (const gp_Quaternion & theOther);
		%feature("compactdefaultargs") Subtract;
		%feature("autodoc", "	* Subtracts componnets of other quaternion; result is 'rotations mix'

	:param theOther:
	:type theOther: gp_Quaternion
	:rtype: None
") Subtract;
		void Subtract (const gp_Quaternion & theOther);
		%feature("compactdefaultargs") operator -=;
		%feature("autodoc", "	:param theOther:
	:type theOther: gp_Quaternion
	:rtype: None
") operator -=;
		void operator -= (const gp_Quaternion & theOther);
		%feature("compactdefaultargs") Multiply;
		%feature("autodoc", "	* Adds rotation by multiplication

	:param theOther:
	:type theOther: gp_Quaternion
	:rtype: None
") Multiply;
		void Multiply (const gp_Quaternion & theOther);
		%feature("compactdefaultargs") operator *=;
		%feature("autodoc", "	:param theOther:
	:type theOther: gp_Quaternion
	:rtype: None
") operator *=;
		void operator *= (const gp_Quaternion & theOther);
		%feature("compactdefaultargs") Dot;
		%feature("autodoc", "	* Computes inner product / scalar product / Dot

	:param theOther:
	:type theOther: gp_Quaternion
	:rtype: float
") Dot;
		Standard_Real Dot (const gp_Quaternion & theOther);
		%feature("compactdefaultargs") GetRotationAngle;
		%feature("autodoc", "	* Return rotation angle from -PI to PI

	:rtype: float
") GetRotationAngle;
		Standard_Real GetRotationAngle ();
		%feature("compactdefaultargs") Multiply;
		%feature("autodoc", "	* Rotates vector by quaternion as rotation operator

	:param theVec:
	:type theVec: gp_Vec
	:rtype: gp_Vec
") Multiply;
		gp_Vec Multiply (const gp_Vec & theVec);
		%feature("compactdefaultargs") operator *;
		%feature("autodoc", "	:param theVec:
	:type theVec: gp_Vec
	:rtype: gp_Vec
") operator *;
		gp_Vec operator * (const gp_Vec & theVec);
};


%extend gp_Quaternion {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor gp_QuaternionNLerp;
class gp_QuaternionNLerp {
	public:
		%feature("compactdefaultargs") gp_QuaternionNLerp;
		%feature("autodoc", "	:rtype: None
") gp_QuaternionNLerp;
		 gp_QuaternionNLerp ();
		%feature("compactdefaultargs") gp_QuaternionNLerp;
		%feature("autodoc", "	:param theQStart:
	:type theQStart: gp_Quaternion
	:param theQEnd:
	:type theQEnd: gp_Quaternion
	:rtype: None
") gp_QuaternionNLerp;
		 gp_QuaternionNLerp (const gp_Quaternion & theQStart,const gp_Quaternion & theQEnd);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param theQStart:
	:type theQStart: gp_Quaternion
	:param theQEnd:
	:type theQEnd: gp_Quaternion
	:rtype: None
") Init;
		void Init (const gp_Quaternion & theQStart,const gp_Quaternion & theQEnd);
		%feature("compactdefaultargs") InitFromUnit;
		%feature("autodoc", "	:param theQStart:
	:type theQStart: gp_Quaternion
	:param theQEnd:
	:type theQEnd: gp_Quaternion
	:rtype: None
") InitFromUnit;
		void InitFromUnit (const gp_Quaternion & theQStart,const gp_Quaternion & theQEnd);
		%feature("compactdefaultargs") Interpolate;
		%feature("autodoc", "	* Set interpolated quaternion for theT position (from 0.0 to 1.0)

	:param theT:
	:type theT: float
	:param theResultQ:
	:type theResultQ: gp_Quaternion
	:rtype: None
") Interpolate;
		void Interpolate (Standard_Real theT,gp_Quaternion & theResultQ);
		%feature("compactdefaultargs") Interpolate;
		%feature("autodoc", "	:param theQStart:
	:type theQStart: gp_Quaternion
	:param theQEnd:
	:type theQEnd: gp_Quaternion
	:param theT:
	:type theT: float
	:rtype: gp_Quaternion
") Interpolate;
		static gp_Quaternion Interpolate (const gp_Quaternion & theQStart,const gp_Quaternion & theQEnd,Standard_Real theT);
};


%extend gp_QuaternionNLerp {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor gp_QuaternionSLerp;
class gp_QuaternionSLerp {
	public:
		%feature("compactdefaultargs") gp_QuaternionSLerp;
		%feature("autodoc", "	:rtype: None
") gp_QuaternionSLerp;
		 gp_QuaternionSLerp ();
		%feature("compactdefaultargs") gp_QuaternionSLerp;
		%feature("autodoc", "	:param theQStart:
	:type theQStart: gp_Quaternion
	:param theQEnd:
	:type theQEnd: gp_Quaternion
	:rtype: None
") gp_QuaternionSLerp;
		 gp_QuaternionSLerp (const gp_Quaternion & theQStart,const gp_Quaternion & theQEnd);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param theQStart:
	:type theQStart: gp_Quaternion
	:param theQEnd:
	:type theQEnd: gp_Quaternion
	:rtype: None
") Init;
		void Init (const gp_Quaternion & theQStart,const gp_Quaternion & theQEnd);
		%feature("compactdefaultargs") InitFromUnit;
		%feature("autodoc", "	:param theQStart:
	:type theQStart: gp_Quaternion
	:param theQEnd:
	:type theQEnd: gp_Quaternion
	:rtype: None
") InitFromUnit;
		void InitFromUnit (const gp_Quaternion & theQStart,const gp_Quaternion & theQEnd);
		%feature("compactdefaultargs") Interpolate;
		%feature("autodoc", "	* Set interpolated quaternion for theT position (from 0.0 to 1.0)

	:param theT:
	:type theT: float
	:param theResultQ:
	:type theResultQ: gp_Quaternion
	:rtype: None
") Interpolate;
		void Interpolate (Standard_Real theT,gp_Quaternion & theResultQ);
};


%extend gp_QuaternionSLerp {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor gp_Sphere;
class gp_Sphere {
	public:
		%feature("compactdefaultargs") gp_Sphere;
		%feature("autodoc", "	* Creates an indefinite sphere.

	:rtype: None
") gp_Sphere;
		 gp_Sphere ();
		%feature("compactdefaultargs") gp_Sphere;
		%feature("autodoc", "	* Constructs a sphere with radius Radius, centered on the origin of A3. A3 is the local coordinate system of the sphere. Warnings : It is not forbidden to create a sphere with null radius. Raises ConstructionError if Radius < 0.0

	:param A3:
	:type A3: gp_Ax3
	:param Radius:
	:type Radius: float
	:rtype: None
") gp_Sphere;
		 gp_Sphere (const gp_Ax3 & A3,const Standard_Real Radius);
		%feature("compactdefaultargs") SetLocation;
		%feature("autodoc", "	* Changes the center of the sphere.

	:param Loc:
	:type Loc: gp_Pnt
	:rtype: None
") SetLocation;
		void SetLocation (const gp_Pnt & Loc);
		%feature("compactdefaultargs") SetPosition;
		%feature("autodoc", "	* Changes the local coordinate system of the sphere.

	:param A3:
	:type A3: gp_Ax3
	:rtype: None
") SetPosition;
		void SetPosition (const gp_Ax3 & A3);
		%feature("compactdefaultargs") SetRadius;
		%feature("autodoc", "	* Assigns R the radius of the Sphere. Warnings : It is not forbidden to create a sphere with null radius. Raises ConstructionError if R < 0.0

	:param R:
	:type R: float
	:rtype: None
") SetRadius;
		void SetRadius (const Standard_Real R);
		%feature("compactdefaultargs") Area;
		%feature("autodoc", "	* Computes the aera of the sphere.

	:rtype: float
") Area;
		Standard_Real Area ();
		%feature("compactdefaultargs") Coefficients;
		%feature("autodoc", "	* Computes the coefficients of the implicit equation of the quadric in the absolute cartesian coordinates system : A1.X**2 + A2.Y**2 + A3.Z**2 + 2.(B1.X.Y + B2.X.Z + B3.Y.Z) + 2.(C1.X + C2.Y + C3.Z) + D = 0.0

	:param A1:
	:type A1: float &
	:param A2:
	:type A2: float &
	:param A3:
	:type A3: float &
	:param B1:
	:type B1: float &
	:param B2:
	:type B2: float &
	:param B3:
	:type B3: float &
	:param C1:
	:type C1: float &
	:param C2:
	:type C2: float &
	:param C3:
	:type C3: float &
	:param D:
	:type D: float &
	:rtype: None
") Coefficients;
		void Coefficients (Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") UReverse;
		%feature("autodoc", "	* Reverses the U parametrization of the sphere reversing the YAxis.

	:rtype: None
") UReverse;
		void UReverse ();
		%feature("compactdefaultargs") VReverse;
		%feature("autodoc", "	* Reverses the V parametrization of the sphere reversing the ZAxis.

	:rtype: None
") VReverse;
		void VReverse ();
		%feature("compactdefaultargs") Direct;
		%feature("autodoc", "	* Returns true if the local coordinate system of this sphere is right-handed.

	:rtype: bool
") Direct;
		Standard_Boolean Direct ();
		%feature("compactdefaultargs") Location;
		%feature("autodoc", "	* --- Purpose ; Returns the center of the sphere.

	:rtype: gp_Pnt
") Location;
		const gp_Pnt  Location ();
		%feature("compactdefaultargs") Position;
		%feature("autodoc", "	* Returns the local coordinates system of the sphere.

	:rtype: gp_Ax3
") Position;
		const gp_Ax3  Position ();
		%feature("compactdefaultargs") Radius;
		%feature("autodoc", "	* Returns the radius of the sphere.

	:rtype: float
") Radius;
		Standard_Real Radius ();
		%feature("compactdefaultargs") Volume;
		%feature("autodoc", "	* Computes the volume of the sphere

	:rtype: float
") Volume;
		Standard_Real Volume ();
		%feature("compactdefaultargs") XAxis;
		%feature("autodoc", "	* Returns the axis X of the sphere.

	:rtype: gp_Ax1
") XAxis;
		gp_Ax1 XAxis ();
		%feature("compactdefaultargs") YAxis;
		%feature("autodoc", "	* Returns the axis Y of the sphere.

	:rtype: gp_Ax1
") YAxis;
		gp_Ax1 YAxis ();
		%feature("compactdefaultargs") Mirror;
		%feature("autodoc", "	:param P:
	:type P: gp_Pnt
	:rtype: None
") Mirror;
		void Mirror (const gp_Pnt & P);
		%feature("compactdefaultargs") Mirrored;
		%feature("autodoc", "	* Performs the symmetrical transformation of a sphere with respect to the point P which is the center of the symmetry.

	:param P:
	:type P: gp_Pnt
	:rtype: gp_Sphere
") Mirrored;
		gp_Sphere Mirrored (const gp_Pnt & P);
		%feature("compactdefaultargs") Mirror;
		%feature("autodoc", "	:param A1:
	:type A1: gp_Ax1
	:rtype: None
") Mirror;
		void Mirror (const gp_Ax1 & A1);
		%feature("compactdefaultargs") Mirrored;
		%feature("autodoc", "	* Performs the symmetrical transformation of a sphere with respect to an axis placement which is the axis of the symmetry.

	:param A1:
	:type A1: gp_Ax1
	:rtype: gp_Sphere
") Mirrored;
		gp_Sphere Mirrored (const gp_Ax1 & A1);
		%feature("compactdefaultargs") Mirror;
		%feature("autodoc", "	:param A2:
	:type A2: gp_Ax2
	:rtype: None
") Mirror;
		void Mirror (const gp_Ax2 & A2);
		%feature("compactdefaultargs") Mirrored;
		%feature("autodoc", "	* Performs the symmetrical transformation of a sphere with respect to a plane. The axis placement A2 locates the plane of the of the symmetry : (Location, XDirection, YDirection).

	:param A2:
	:type A2: gp_Ax2
	:rtype: gp_Sphere
") Mirrored;
		gp_Sphere Mirrored (const gp_Ax2 & A2);
		%feature("compactdefaultargs") Rotate;
		%feature("autodoc", "	:param A1:
	:type A1: gp_Ax1
	:param Ang:
	:type Ang: float
	:rtype: None
") Rotate;
		void Rotate (const gp_Ax1 & A1,const Standard_Real Ang);
		%feature("compactdefaultargs") Rotated;
		%feature("autodoc", "	* Rotates a sphere. A1 is the axis of the rotation. Ang is the angular value of the rotation in radians.

	:param A1:
	:type A1: gp_Ax1
	:param Ang:
	:type Ang: float
	:rtype: gp_Sphere
") Rotated;
		gp_Sphere Rotated (const gp_Ax1 & A1,const Standard_Real Ang);
		%feature("compactdefaultargs") Scale;
		%feature("autodoc", "	:param P:
	:type P: gp_Pnt
	:param S:
	:type S: float
	:rtype: None
") Scale;
		void Scale (const gp_Pnt & P,const Standard_Real S);
		%feature("compactdefaultargs") Scaled;
		%feature("autodoc", "	* Scales a sphere. S is the scaling value. The absolute value of S is used to scale the sphere

	:param P:
	:type P: gp_Pnt
	:param S:
	:type S: float
	:rtype: gp_Sphere
") Scaled;
		gp_Sphere Scaled (const gp_Pnt & P,const Standard_Real S);
		%feature("compactdefaultargs") Transform;
		%feature("autodoc", "	:param T:
	:type T: gp_Trsf
	:rtype: None
") Transform;
		void Transform (const gp_Trsf & T);
		%feature("compactdefaultargs") Transformed;
		%feature("autodoc", "	* Transforms a sphere with the transformation T from class Trsf.

	:param T:
	:type T: gp_Trsf
	:rtype: gp_Sphere
") Transformed;
		gp_Sphere Transformed (const gp_Trsf & T);
		%feature("compactdefaultargs") Translate;
		%feature("autodoc", "	:param V:
	:type V: gp_Vec
	:rtype: None
") Translate;
		void Translate (const gp_Vec & V);
		%feature("compactdefaultargs") Translated;
		%feature("autodoc", "	* Translates a sphere in the direction of the vector V. The magnitude of the translation is the vector's magnitude.

	:param V:
	:type V: gp_Vec
	:rtype: gp_Sphere
") Translated;
		gp_Sphere Translated (const gp_Vec & V);
		%feature("compactdefaultargs") Translate;
		%feature("autodoc", "	:param P1:
	:type P1: gp_Pnt
	:param P2:
	:type P2: gp_Pnt
	:rtype: None
") Translate;
		void Translate (const gp_Pnt & P1,const gp_Pnt & P2);
		%feature("compactdefaultargs") Translated;
		%feature("autodoc", "	* Translates a sphere from the point P1 to the point P2.

	:param P1:
	:type P1: gp_Pnt
	:param P2:
	:type P2: gp_Pnt
	:rtype: gp_Sphere
") Translated;
		gp_Sphere Translated (const gp_Pnt & P1,const gp_Pnt & P2);
		%feature("compactdefaultargs") _CSFDB_Getgp_Spherepos;
		%feature("autodoc", "	:rtype: gp_Ax3
") _CSFDB_Getgp_Spherepos;
		const gp_Ax3  _CSFDB_Getgp_Spherepos ();
		%feature("compactdefaultargs") _CSFDB_Getgp_Sphereradius;
		%feature("autodoc", "	:rtype: float
") _CSFDB_Getgp_Sphereradius;
		Standard_Real _CSFDB_Getgp_Sphereradius ();
		%feature("compactdefaultargs") _CSFDB_Setgp_Sphereradius;
		%feature("autodoc", "	:param p:
	:type p: float
	:rtype: None
") _CSFDB_Setgp_Sphereradius;
		void _CSFDB_Setgp_Sphereradius (const Standard_Real p);
};


%extend gp_Sphere {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor gp_Torus;
class gp_Torus {
	public:
		%feature("compactdefaultargs") gp_Torus;
		%feature("autodoc", "	* creates an indefinite Torus.

	:rtype: None
") gp_Torus;
		 gp_Torus ();
		%feature("compactdefaultargs") gp_Torus;
		%feature("autodoc", "	* a torus centered on the origin of coordinate system A3, with major radius MajorRadius and minor radius MinorRadius, and with the reference plane defined by the origin, the 'X Direction' and the 'Y Direction' of A3. Warnings : It is not forbidden to create a torus with MajorRadius = MinorRadius = 0.0 Raises ConstructionError if MinorRadius < 0.0 or if MajorRadius < 0.0

	:param A3:
	:type A3: gp_Ax3
	:param MajorRadius:
	:type MajorRadius: float
	:param MinorRadius:
	:type MinorRadius: float
	:rtype: None
") gp_Torus;
		 gp_Torus (const gp_Ax3 & A3,const Standard_Real MajorRadius,const Standard_Real MinorRadius);
		%feature("compactdefaultargs") SetAxis;
		%feature("autodoc", "	* Modifies this torus, by redefining its local coordinate system so that: - its origin and 'main Direction' become those of the axis A1 (the 'X Direction' and 'Y Direction' are then recomputed). Raises ConstructionError if the direction of A1 is parallel to the 'XDirection' of the coordinate system of the toroidal surface.

	:param A1:
	:type A1: gp_Ax1
	:rtype: None
") SetAxis;
		void SetAxis (const gp_Ax1 & A1);
		%feature("compactdefaultargs") SetLocation;
		%feature("autodoc", "	* Changes the location of the torus.

	:param Loc:
	:type Loc: gp_Pnt
	:rtype: None
") SetLocation;
		void SetLocation (const gp_Pnt & Loc);
		%feature("compactdefaultargs") SetMajorRadius;
		%feature("autodoc", "	* Assigns value to the major radius of this torus. Raises ConstructionError if MajorRadius - MinorRadius <= Resolution()

	:param MajorRadius:
	:type MajorRadius: float
	:rtype: None
") SetMajorRadius;
		void SetMajorRadius (const Standard_Real MajorRadius);
		%feature("compactdefaultargs") SetMinorRadius;
		%feature("autodoc", "	* Assigns value to the minor radius of this torus. Raises ConstructionError if MinorRadius < 0.0 or if MajorRadius - MinorRadius <= Resolution from gp.

	:param MinorRadius:
	:type MinorRadius: float
	:rtype: None
") SetMinorRadius;
		void SetMinorRadius (const Standard_Real MinorRadius);
		%feature("compactdefaultargs") SetPosition;
		%feature("autodoc", "	* Changes the local coordinate system of the surface.

	:param A3:
	:type A3: gp_Ax3
	:rtype: None
") SetPosition;
		void SetPosition (const gp_Ax3 & A3);
		%feature("compactdefaultargs") Area;
		%feature("autodoc", "	* Computes the area of the torus.

	:rtype: float
") Area;
		Standard_Real Area ();
		%feature("compactdefaultargs") UReverse;
		%feature("autodoc", "	* Reverses the U parametrization of the torus reversing the YAxis.

	:rtype: None
") UReverse;
		void UReverse ();
		%feature("compactdefaultargs") VReverse;
		%feature("autodoc", "	* Reverses the V parametrization of the torus reversing the ZAxis.

	:rtype: None
") VReverse;
		void VReverse ();
		%feature("compactdefaultargs") Direct;
		%feature("autodoc", "	* returns true if the Ax3, the local coordinate system of this torus, is right handed.

	:rtype: bool
") Direct;
		Standard_Boolean Direct ();
		%feature("compactdefaultargs") Axis;
		%feature("autodoc", "	* returns the symmetry axis of the torus.

	:rtype: gp_Ax1
") Axis;
		const gp_Ax1  Axis ();
		%feature("compactdefaultargs") Location;
		%feature("autodoc", "	* Returns the Torus's location.

	:rtype: gp_Pnt
") Location;
		const gp_Pnt  Location ();
		%feature("compactdefaultargs") Position;
		%feature("autodoc", "	* Returns the local coordinates system of the torus.

	:rtype: gp_Ax3
") Position;
		const gp_Ax3  Position ();
		%feature("compactdefaultargs") MajorRadius;
		%feature("autodoc", "	* returns the major radius of the torus.

	:rtype: float
") MajorRadius;
		Standard_Real MajorRadius ();
		%feature("compactdefaultargs") MinorRadius;
		%feature("autodoc", "	* returns the minor radius of the torus.

	:rtype: float
") MinorRadius;
		Standard_Real MinorRadius ();
		%feature("compactdefaultargs") Volume;
		%feature("autodoc", "	* Computes the volume of the torus.

	:rtype: float
") Volume;
		Standard_Real Volume ();
		%feature("compactdefaultargs") XAxis;
		%feature("autodoc", "	* returns the axis X of the torus.

	:rtype: gp_Ax1
") XAxis;
		gp_Ax1 XAxis ();
		%feature("compactdefaultargs") YAxis;
		%feature("autodoc", "	* returns the axis Y of the torus.

	:rtype: gp_Ax1
") YAxis;
		gp_Ax1 YAxis ();
		%feature("compactdefaultargs") Mirror;
		%feature("autodoc", "	:param P:
	:type P: gp_Pnt
	:rtype: None
") Mirror;
		void Mirror (const gp_Pnt & P);
		%feature("compactdefaultargs") Mirrored;
		%feature("autodoc", "	* Performs the symmetrical transformation of a torus with respect to the point P which is the center of the symmetry.

	:param P:
	:type P: gp_Pnt
	:rtype: gp_Torus
") Mirrored;
		gp_Torus Mirrored (const gp_Pnt & P);
		%feature("compactdefaultargs") Mirror;
		%feature("autodoc", "	:param A1:
	:type A1: gp_Ax1
	:rtype: None
") Mirror;
		void Mirror (const gp_Ax1 & A1);
		%feature("compactdefaultargs") Mirrored;
		%feature("autodoc", "	* Performs the symmetrical transformation of a torus with respect to an axis placement which is the axis of the symmetry.

	:param A1:
	:type A1: gp_Ax1
	:rtype: gp_Torus
") Mirrored;
		gp_Torus Mirrored (const gp_Ax1 & A1);
		%feature("compactdefaultargs") Mirror;
		%feature("autodoc", "	:param A2:
	:type A2: gp_Ax2
	:rtype: None
") Mirror;
		void Mirror (const gp_Ax2 & A2);
		%feature("compactdefaultargs") Mirrored;
		%feature("autodoc", "	* Performs the symmetrical transformation of a torus with respect to a plane. The axis placement A2 locates the plane of the of the symmetry : (Location, XDirection, YDirection).

	:param A2:
	:type A2: gp_Ax2
	:rtype: gp_Torus
") Mirrored;
		gp_Torus Mirrored (const gp_Ax2 & A2);
		%feature("compactdefaultargs") Rotate;
		%feature("autodoc", "	:param A1:
	:type A1: gp_Ax1
	:param Ang:
	:type Ang: float
	:rtype: None
") Rotate;
		void Rotate (const gp_Ax1 & A1,const Standard_Real Ang);
		%feature("compactdefaultargs") Rotated;
		%feature("autodoc", "	* Rotates a torus. A1 is the axis of the rotation. Ang is the angular value of the rotation in radians.

	:param A1:
	:type A1: gp_Ax1
	:param Ang:
	:type Ang: float
	:rtype: gp_Torus
") Rotated;
		gp_Torus Rotated (const gp_Ax1 & A1,const Standard_Real Ang);
		%feature("compactdefaultargs") Scale;
		%feature("autodoc", "	:param P:
	:type P: gp_Pnt
	:param S:
	:type S: float
	:rtype: None
") Scale;
		void Scale (const gp_Pnt & P,const Standard_Real S);
		%feature("compactdefaultargs") Scaled;
		%feature("autodoc", "	* Scales a torus. S is the scaling value. The absolute value of S is used to scale the torus

	:param P:
	:type P: gp_Pnt
	:param S:
	:type S: float
	:rtype: gp_Torus
") Scaled;
		gp_Torus Scaled (const gp_Pnt & P,const Standard_Real S);
		%feature("compactdefaultargs") Transform;
		%feature("autodoc", "	:param T:
	:type T: gp_Trsf
	:rtype: None
") Transform;
		void Transform (const gp_Trsf & T);
		%feature("compactdefaultargs") Transformed;
		%feature("autodoc", "	* Transforms a torus with the transformation T from class Trsf.

	:param T:
	:type T: gp_Trsf
	:rtype: gp_Torus
") Transformed;
		gp_Torus Transformed (const gp_Trsf & T);
		%feature("compactdefaultargs") Translate;
		%feature("autodoc", "	:param V:
	:type V: gp_Vec
	:rtype: None
") Translate;
		void Translate (const gp_Vec & V);
		%feature("compactdefaultargs") Translated;
		%feature("autodoc", "	* Translates a torus in the direction of the vector V. The magnitude of the translation is the vector's magnitude.

	:param V:
	:type V: gp_Vec
	:rtype: gp_Torus
") Translated;
		gp_Torus Translated (const gp_Vec & V);
		%feature("compactdefaultargs") Translate;
		%feature("autodoc", "	:param P1:
	:type P1: gp_Pnt
	:param P2:
	:type P2: gp_Pnt
	:rtype: None
") Translate;
		void Translate (const gp_Pnt & P1,const gp_Pnt & P2);
		%feature("compactdefaultargs") Translated;
		%feature("autodoc", "	* Translates a torus from the point P1 to the point P2.

	:param P1:
	:type P1: gp_Pnt
	:param P2:
	:type P2: gp_Pnt
	:rtype: gp_Torus
") Translated;
		gp_Torus Translated (const gp_Pnt & P1,const gp_Pnt & P2);
		%feature("compactdefaultargs") _CSFDB_Getgp_Toruspos;
		%feature("autodoc", "	:rtype: gp_Ax3
") _CSFDB_Getgp_Toruspos;
		const gp_Ax3  _CSFDB_Getgp_Toruspos ();
		%feature("compactdefaultargs") _CSFDB_Getgp_TorusmajorRadius;
		%feature("autodoc", "	:rtype: float
") _CSFDB_Getgp_TorusmajorRadius;
		Standard_Real _CSFDB_Getgp_TorusmajorRadius ();
		%feature("compactdefaultargs") _CSFDB_Setgp_TorusmajorRadius;
		%feature("autodoc", "	:param p:
	:type p: float
	:rtype: None
") _CSFDB_Setgp_TorusmajorRadius;
		void _CSFDB_Setgp_TorusmajorRadius (const Standard_Real p);
		%feature("compactdefaultargs") _CSFDB_Getgp_TorusminorRadius;
		%feature("autodoc", "	:rtype: float
") _CSFDB_Getgp_TorusminorRadius;
		Standard_Real _CSFDB_Getgp_TorusminorRadius ();
		%feature("compactdefaultargs") _CSFDB_Setgp_TorusminorRadius;
		%feature("autodoc", "	:param p:
	:type p: float
	:rtype: None
") _CSFDB_Setgp_TorusminorRadius;
		void _CSFDB_Setgp_TorusminorRadius (const Standard_Real p);
};


%extend gp_Torus {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor gp_Trsf;
class gp_Trsf {
	public:
		%feature("compactdefaultargs") gp_Trsf;
		%feature("autodoc", "	* Returns the identity transformation.

	:rtype: None
") gp_Trsf;
		 gp_Trsf ();
		%feature("compactdefaultargs") gp_Trsf;
		%feature("autodoc", "	* Creates a 3D transformation from the 2D transformation T. The resulting transformation has a homogeneous vectorial part, V3, and a translation part, T3, built from T: a11 a12 0 a13 V3 = a21 a22 0 T3 = a23 0 0 1. 0 It also has the same scale factor as T. This guarantees (by projection) that the transformation which would be performed by T in a plane (2D space) is performed by the resulting transformation in the xOy plane of the 3D space, (i.e. in the plane defined by the origin (0., 0., 0.) and the vectors DX (1., 0., 0.), and DY (0., 1., 0.)). The scale factor is applied to the entire space.

	:param T:
	:type T: gp_Trsf2d
	:rtype: None
") gp_Trsf;
		 gp_Trsf (const gp_Trsf2d & T);
		%feature("compactdefaultargs") SetMirror;
		%feature("autodoc", "	* Makes the transformation into a symmetrical transformation. P is the center of the symmetry.

	:param P:
	:type P: gp_Pnt
	:rtype: None
") SetMirror;
		void SetMirror (const gp_Pnt & P);
		%feature("compactdefaultargs") SetMirror;
		%feature("autodoc", "	* Makes the transformation into a symmetrical transformation. A1 is the center of the axial symmetry.

	:param A1:
	:type A1: gp_Ax1
	:rtype: None
") SetMirror;
		void SetMirror (const gp_Ax1 & A1);
		%feature("compactdefaultargs") SetMirror;
		%feature("autodoc", "	* Makes the transformation into a symmetrical transformation. A2 is the center of the planar symmetry and defines the plane of symmetry by its origin, 'X Direction' and 'Y Direction'.

	:param A2:
	:type A2: gp_Ax2
	:rtype: None
") SetMirror;
		void SetMirror (const gp_Ax2 & A2);
		%feature("compactdefaultargs") SetRotation;
		%feature("autodoc", "	* Changes the transformation into a rotation. A1 is the rotation axis and Ang is the angular value of the rotation in radians.

	:param A1:
	:type A1: gp_Ax1
	:param Ang:
	:type Ang: float
	:rtype: None
") SetRotation;
		void SetRotation (const gp_Ax1 & A1,const Standard_Real Ang);
		%feature("compactdefaultargs") SetRotation;
		%feature("autodoc", "	* Changes the transformation into a rotation defined by quaternion. Note that rotation is performed around origin, i.e. no translation is involved.

	:param R:
	:type R: gp_Quaternion
	:rtype: None
") SetRotation;
		void SetRotation (const gp_Quaternion & R);
		%feature("compactdefaultargs") SetScale;
		%feature("autodoc", "	* Changes the transformation into a scale. P is the center of the scale and S is the scaling value. Raises ConstructionError If <S> is null.

	:param P:
	:type P: gp_Pnt
	:param S:
	:type S: float
	:rtype: None
") SetScale;
		void SetScale (const gp_Pnt & P,const Standard_Real S);
		%feature("compactdefaultargs") SetDisplacement;
		%feature("autodoc", "	* Modifies this transformation so that it transforms the coordinate system defined by FromSystem1 into the one defined by ToSystem2. After this modification, this transformation transforms: - the origin of FromSystem1 into the origin of ToSystem2, - the 'X Direction' of FromSystem1 into the 'X Direction' of ToSystem2, - the 'Y Direction' of FromSystem1 into the 'Y Direction' of ToSystem2, and - the 'main Direction' of FromSystem1 into the 'main Direction' of ToSystem2. Warning When you know the coordinates of a point in one coordinate system and you want to express these coordinates in another one, do not use the transformation resulting from this function. Use the transformation that results from SetTransformation instead. SetDisplacement and SetTransformation create related transformations: the vectorial part of one is the inverse of the vectorial part of the other.

	:param FromSystem1:
	:type FromSystem1: gp_Ax3
	:param ToSystem2:
	:type ToSystem2: gp_Ax3
	:rtype: None
") SetDisplacement;
		void SetDisplacement (const gp_Ax3 & FromSystem1,const gp_Ax3 & ToSystem2);
		%feature("compactdefaultargs") SetTransformation;
		%feature("autodoc", "	* Modifies this transformation so that it transforms the coordinates of any point, (x, y, z), relative to a source coordinate system into the coordinates (x', y', z') which are relative to a target coordinate system, but which represent the same point The transformation is from the coordinate system 'FromSystem1' to the coordinate system 'ToSystem2'. Example : In a C++ implementation : Real x1, y1, z1; // are the coordinates of a point in the // local system FromSystem1 Real x2, y2, z2; // are the coordinates of a point in the // local system ToSystem2 gp_Pnt P1 (x1, y1, z1) Trsf T; T.SetTransformation (FromSystem1, ToSystem2); gp_Pnt P2 = P1.Transformed (T); P2.Coord (x2, y2, z2);

	:param FromSystem1:
	:type FromSystem1: gp_Ax3
	:param ToSystem2:
	:type ToSystem2: gp_Ax3
	:rtype: None
") SetTransformation;
		void SetTransformation (const gp_Ax3 & FromSystem1,const gp_Ax3 & ToSystem2);
		%feature("compactdefaultargs") SetTransformation;
		%feature("autodoc", "	* Modifies this transformation so that it transforms the coordinates of any point, (x, y, z), relative to a source coordinate system into the coordinates (x', y', z') which are relative to a target coordinate system, but which represent the same point The transformation is from the default coordinate system {P(0.,0.,0.), VX (1.,0.,0.), VY (0.,1.,0.), VZ (0., 0. ,1.) } to the local coordinate system defined with the Ax3 ToSystem. Use in the same way as the previous method. FromSystem1 is defaulted to the absolute coordinate system.

	:param ToSystem:
	:type ToSystem: gp_Ax3
	:rtype: None
") SetTransformation;
		void SetTransformation (const gp_Ax3 & ToSystem);
		%feature("compactdefaultargs") SetTransformation;
		%feature("autodoc", "	* Sets transformation by directly specified rotation and translation.

	:param R:
	:type R: gp_Quaternion
	:param T:
	:type T: gp_Vec
	:rtype: None
") SetTransformation;
		void SetTransformation (const gp_Quaternion & R,const gp_Vec & T);
		%feature("compactdefaultargs") SetTranslation;
		%feature("autodoc", "	* Changes the transformation into a translation. V is the vector of the translation.

	:param V:
	:type V: gp_Vec
	:rtype: None
") SetTranslation;
		void SetTranslation (const gp_Vec & V);
		%feature("compactdefaultargs") SetTranslation;
		%feature("autodoc", "	* Makes the transformation into a translation where the translation vector is the vector (P1, P2) defined from point P1 to point P2.

	:param P1:
	:type P1: gp_Pnt
	:param P2:
	:type P2: gp_Pnt
	:rtype: None
") SetTranslation;
		void SetTranslation (const gp_Pnt & P1,const gp_Pnt & P2);
		%feature("compactdefaultargs") SetTranslationPart;
		%feature("autodoc", "	* Replaces the translation vector with the vector V.

	:param V:
	:type V: gp_Vec
	:rtype: None
") SetTranslationPart;
		void SetTranslationPart (const gp_Vec & V);
		%feature("compactdefaultargs") SetScaleFactor;
		%feature("autodoc", "	* Modifies the scale factor. Raises ConstructionError If S is null.

	:param S:
	:type S: float
	:rtype: None
") SetScaleFactor;
		void SetScaleFactor (const Standard_Real S);
		%feature("compactdefaultargs") SetValues;
		%feature("autodoc", "	* Sets the coefficients of the transformation. The transformation of the point x,y,z is the point x',y',z' with : //! x' = a11 x + a12 y + a13 z + a14 y' = a21 x + a22 y + a23 z + a24 z' = a31 x + a32 y + a33 z + a34 //! The method Value(i,j) will return aij. Raises ConstructionError if the determinant of the aij is null. The matrix is orthogonalized before future using.

	:param a11:
	:type a11: float
	:param a12:
	:type a12: float
	:param a13:
	:type a13: float
	:param a14:
	:type a14: float
	:param a21:
	:type a21: float
	:param a22:
	:type a22: float
	:param a23:
	:type a23: float
	:param a24:
	:type a24: float
	:param a31:
	:type a31: float
	:param a32:
	:type a32: float
	:param a33:
	:type a33: float
	:param a34:
	:type a34: float
	:rtype: None
") SetValues;
		void SetValues (const Standard_Real a11,const Standard_Real a12,const Standard_Real a13,const Standard_Real a14,const Standard_Real a21,const Standard_Real a22,const Standard_Real a23,const Standard_Real a24,const Standard_Real a31,const Standard_Real a32,const Standard_Real a33,const Standard_Real a34);
		%feature("compactdefaultargs") IsNegative;
		%feature("autodoc", "	* Returns true if the determinant of the vectorial part of this transformation is negative.

	:rtype: bool
") IsNegative;
		Standard_Boolean IsNegative ();
		%feature("compactdefaultargs") Form;
		%feature("autodoc", "	* Returns the nature of the transformation. It can be: an identity transformation, a rotation, a translation, a mirror transformation (relative to a point, an axis or a plane), a scaling transformation, or a compound transformation.

	:rtype: gp_TrsfForm
") Form;
		gp_TrsfForm Form ();
		%feature("compactdefaultargs") ScaleFactor;
		%feature("autodoc", "	* Returns the scale factor.

	:rtype: float
") ScaleFactor;
		Standard_Real ScaleFactor ();
		%feature("compactdefaultargs") TranslationPart;
		%feature("autodoc", "	* Returns the translation part of the transformation's matrix

	:rtype: gp_XYZ
") TranslationPart;
		const gp_XYZ  TranslationPart ();
		%feature("compactdefaultargs") GetRotation;
		%feature("autodoc", "	* Returns the boolean True if there is non-zero rotation. In the presence of rotation, the output parameters store the axis and the angle of rotation. The method always returns positive value 'theAngle', i.e., 0. < theAngle <= PI. Note that this rotation is defined only by the vectorial part of the transformation; generally you would need to check also the translational part to obtain the axis (gp_Ax1) of rotation.

	:param theAxis:
	:type theAxis: gp_XYZ
	:param theAngle:
	:type theAngle: float &
	:rtype: bool
") GetRotation;
		Standard_Boolean GetRotation (gp_XYZ & theAxis,Standard_Real &OutValue);
		%feature("compactdefaultargs") GetRotation;
		%feature("autodoc", "	* Returns quaternion representing rotational part of the transformation.

	:rtype: gp_Quaternion
") GetRotation;
		gp_Quaternion GetRotation ();
		%feature("compactdefaultargs") VectorialPart;
		%feature("autodoc", "	* Returns the vectorial part of the transformation. It is a 3*3 matrix which includes the scale factor.

	:rtype: gp_Mat
") VectorialPart;
		gp_Mat VectorialPart ();
		%feature("compactdefaultargs") HVectorialPart;
		%feature("autodoc", "	* Computes the homogeneous vectorial part of the transformation. It is a 3*3 matrix which doesn't include the scale factor. In other words, the vectorial part of this transformation is equal to its homogeneous vectorial part, multiplied by the scale factor. The coefficients of this matrix must be multiplied by the scale factor to obtain the coefficients of the transformation.

	:rtype: gp_Mat
") HVectorialPart;
		const gp_Mat  HVectorialPart ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	* Returns the coefficients of the transformation's matrix. It is a 3 rows * 4 columns matrix. This coefficient includes the scale factor. Raises OutOfRanged if Row < 1 or Row > 3 or Col < 1 or Col > 4

	:param Row:
	:type Row: int
	:param Col:
	:type Col: int
	:rtype: float
") Value;
		Standard_Real Value (const Standard_Integer Row,const Standard_Integer Col);
		%feature("compactdefaultargs") Invert;
		%feature("autodoc", "	:rtype: None
") Invert;
		void Invert ();
		%feature("compactdefaultargs") Inverted;
		%feature("autodoc", "	* Computes the reverse transformation Raises an exception if the matrix of the transformation is not inversible, it means that the scale factor is lower or equal to Resolution from package gp. Computes the transformation composed with T and <self>. In a C++ implementation you can also write Tcomposed = <self> * T. Example : Trsf T1, T2, Tcomp; ............... Tcomp = T2.Multiplied(T1); // or (Tcomp = T2 * T1) Pnt P1(10.,3.,4.); Pnt P2 = P1.Transformed(Tcomp); //using Tcomp Pnt P3 = P1.Transformed(T1); //using T1 then T2 P3.Transform(T2); // P3 = P2 !!!

	:rtype: gp_Trsf
") Inverted;
		gp_Trsf Inverted ();
		%feature("compactdefaultargs") Multiplied;
		%feature("autodoc", "	:param T:
	:type T: gp_Trsf
	:rtype: gp_Trsf
") Multiplied;
		gp_Trsf Multiplied (const gp_Trsf & T);
		%feature("compactdefaultargs") operator *;
		%feature("autodoc", "	:param T:
	:type T: gp_Trsf
	:rtype: gp_Trsf
") operator *;
		gp_Trsf operator * (const gp_Trsf & T);
		%feature("compactdefaultargs") Multiply;
		%feature("autodoc", "	* Computes the transformation composed with <self> and T. <self> = <self> * T

	:param T:
	:type T: gp_Trsf
	:rtype: None
") Multiply;
		void Multiply (const gp_Trsf & T);
		%feature("compactdefaultargs") operator *=;
		%feature("autodoc", "	:param T:
	:type T: gp_Trsf
	:rtype: None
") operator *=;
		void operator *= (const gp_Trsf & T);
		%feature("compactdefaultargs") PreMultiply;
		%feature("autodoc", "	* Computes the transformation composed with <self> and T. <self> = T * <self>

	:param T:
	:type T: gp_Trsf
	:rtype: None
") PreMultiply;
		void PreMultiply (const gp_Trsf & T);
		%feature("compactdefaultargs") Power;
		%feature("autodoc", "	:param N:
	:type N: int
	:rtype: None
") Power;
		void Power (const Standard_Integer N);
		%feature("compactdefaultargs") Powered;
		%feature("autodoc", "	* Computes the following composition of transformations <self> * <self> * .......* <self>, N time. if N = 0 <self> = Identity if N < 0 <self> = <self>.Inverse() *...........* <self>.Inverse(). //! Raises if N < 0 and if the matrix of the transformation not inversible.

	:param N:
	:type N: int
	:rtype: gp_Trsf
") Powered;
		gp_Trsf Powered (const Standard_Integer N);
		%feature("compactdefaultargs") Transforms;
		%feature("autodoc", "	:param X:
	:type X: float &
	:param Y:
	:type Y: float &
	:param Z:
	:type Z: float &
	:rtype: None
") Transforms;
		void Transforms (Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") Transforms;
		%feature("autodoc", "	* Transformation of a triplet XYZ with a Trsf

	:param Coord:
	:type Coord: gp_XYZ
	:rtype: None
") Transforms;
		void Transforms (gp_XYZ & Coord);
		%feature("compactdefaultargs") _CSFDB_Getgp_Trsfscale;
		%feature("autodoc", "	:rtype: float
") _CSFDB_Getgp_Trsfscale;
		Standard_Real _CSFDB_Getgp_Trsfscale ();
		%feature("compactdefaultargs") _CSFDB_Setgp_Trsfscale;
		%feature("autodoc", "	:param p:
	:type p: float
	:rtype: None
") _CSFDB_Setgp_Trsfscale;
		void _CSFDB_Setgp_Trsfscale (const Standard_Real p);
		%feature("compactdefaultargs") _CSFDB_Getgp_Trsfshape;
		%feature("autodoc", "	:rtype: gp_TrsfForm
") _CSFDB_Getgp_Trsfshape;
		gp_TrsfForm _CSFDB_Getgp_Trsfshape ();
		%feature("compactdefaultargs") _CSFDB_Setgp_Trsfshape;
		%feature("autodoc", "	:param p:
	:type p: gp_TrsfForm
	:rtype: None
") _CSFDB_Setgp_Trsfshape;
		void _CSFDB_Setgp_Trsfshape (const gp_TrsfForm p);
		%feature("compactdefaultargs") _CSFDB_Getgp_Trsfmatrix;
		%feature("autodoc", "	:rtype: gp_Mat
") _CSFDB_Getgp_Trsfmatrix;
		const gp_Mat  _CSFDB_Getgp_Trsfmatrix ();
		%feature("compactdefaultargs") _CSFDB_Getgp_Trsfloc;
		%feature("autodoc", "	:rtype: gp_XYZ
") _CSFDB_Getgp_Trsfloc;
		const gp_XYZ  _CSFDB_Getgp_Trsfloc ();
};


%extend gp_Trsf {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor gp_Trsf2d;
class gp_Trsf2d {
	public:
		%feature("compactdefaultargs") gp_Trsf2d;
		%feature("autodoc", "	* Returns identity transformation.

	:rtype: None
") gp_Trsf2d;
		 gp_Trsf2d ();
		%feature("compactdefaultargs") gp_Trsf2d;
		%feature("autodoc", "	* Creates a 2d transformation in the XY plane from a 3d transformation .

	:param T:
	:type T: gp_Trsf
	:rtype: None
") gp_Trsf2d;
		 gp_Trsf2d (const gp_Trsf & T);
		%feature("compactdefaultargs") SetMirror;
		%feature("autodoc", "	* Changes the transformation into a symmetrical transformation. P is the center of the symmetry.

	:param P:
	:type P: gp_Pnt2d
	:rtype: None
") SetMirror;
		void SetMirror (const gp_Pnt2d & P);
		%feature("compactdefaultargs") SetMirror;
		%feature("autodoc", "	* Changes the transformation into a symmetrical transformation. A is the center of the axial symmetry.

	:param A:
	:type A: gp_Ax2d
	:rtype: None
") SetMirror;
		void SetMirror (const gp_Ax2d & A);
		%feature("compactdefaultargs") SetRotation;
		%feature("autodoc", "	* Changes the transformation into a rotation. P is the rotation's center and Ang is the angular value of the rotation in radian.

	:param P:
	:type P: gp_Pnt2d
	:param Ang:
	:type Ang: float
	:rtype: None
") SetRotation;
		void SetRotation (const gp_Pnt2d & P,const Standard_Real Ang);
		%feature("compactdefaultargs") SetScale;
		%feature("autodoc", "	* Changes the transformation into a scale. P is the center of the scale and S is the scaling value.

	:param P:
	:type P: gp_Pnt2d
	:param S:
	:type S: float
	:rtype: None
") SetScale;
		void SetScale (const gp_Pnt2d & P,const Standard_Real S);
		%feature("compactdefaultargs") SetTransformation;
		%feature("autodoc", "	* Changes a transformation allowing passage from the coordinate system 'FromSystem1' to the coordinate system 'ToSystem2'.

	:param FromSystem1:
	:type FromSystem1: gp_Ax2d
	:param ToSystem2:
	:type ToSystem2: gp_Ax2d
	:rtype: None
") SetTransformation;
		void SetTransformation (const gp_Ax2d & FromSystem1,const gp_Ax2d & ToSystem2);
		%feature("compactdefaultargs") SetTransformation;
		%feature("autodoc", "	* Changes the transformation allowing passage from the basic coordinate system {P(0.,0.,0.), VX (1.,0.,0.), VY (0.,1.,0.)} to the local coordinate system defined with the Ax2d ToSystem.

	:param ToSystem:
	:type ToSystem: gp_Ax2d
	:rtype: None
") SetTransformation;
		void SetTransformation (const gp_Ax2d & ToSystem);
		%feature("compactdefaultargs") SetTranslation;
		%feature("autodoc", "	* Changes the transformation into a translation. V is the vector of the translation.

	:param V:
	:type V: gp_Vec2d
	:rtype: None
") SetTranslation;
		void SetTranslation (const gp_Vec2d & V);
		%feature("compactdefaultargs") SetTranslation;
		%feature("autodoc", "	* Makes the transformation into a translation from the point P1 to the point P2.

	:param P1:
	:type P1: gp_Pnt2d
	:param P2:
	:type P2: gp_Pnt2d
	:rtype: None
") SetTranslation;
		void SetTranslation (const gp_Pnt2d & P1,const gp_Pnt2d & P2);
		%feature("compactdefaultargs") SetTranslationPart;
		%feature("autodoc", "	* Replaces the translation vector with V.

	:param V:
	:type V: gp_Vec2d
	:rtype: None
") SetTranslationPart;
		void SetTranslationPart (const gp_Vec2d & V);
		%feature("compactdefaultargs") SetScaleFactor;
		%feature("autodoc", "	* Modifies the scale factor.

	:param S:
	:type S: float
	:rtype: None
") SetScaleFactor;
		void SetScaleFactor (const Standard_Real S);
		%feature("compactdefaultargs") IsNegative;
		%feature("autodoc", "	* Returns true if the determinant of the vectorial part of this transformation is negative..

	:rtype: bool
") IsNegative;
		Standard_Boolean IsNegative ();
		%feature("compactdefaultargs") Form;
		%feature("autodoc", "	* Returns the nature of the transformation. It can be an identity transformation, a rotation, a translation, a mirror (relative to a point or an axis), a scaling transformation, or a compound transformation.

	:rtype: gp_TrsfForm
") Form;
		gp_TrsfForm Form ();
		%feature("compactdefaultargs") ScaleFactor;
		%feature("autodoc", "	* Returns the scale factor.

	:rtype: float
") ScaleFactor;
		Standard_Real ScaleFactor ();
		%feature("compactdefaultargs") TranslationPart;
		%feature("autodoc", "	* Returns the translation part of the transformation's matrix

	:rtype: gp_XY
") TranslationPart;
		const gp_XY  TranslationPart ();
		%feature("compactdefaultargs") VectorialPart;
		%feature("autodoc", "	* Returns the vectorial part of the transformation. It is a 2*2 matrix which includes the scale factor.

	:rtype: gp_Mat2d
") VectorialPart;
		gp_Mat2d VectorialPart ();
		%feature("compactdefaultargs") HVectorialPart;
		%feature("autodoc", "	* Returns the homogeneous vectorial part of the transformation. It is a 2*2 matrix which doesn't include the scale factor. The coefficients of this matrix must be multiplied by the scale factor to obtain the coefficients of the transformation.

	:rtype: gp_Mat2d
") HVectorialPart;
		const gp_Mat2d  HVectorialPart ();
		%feature("compactdefaultargs") RotationPart;
		%feature("autodoc", "	* Returns the angle corresponding to the rotational component of the transformation matrix (operation opposite to SetRotation()).

	:rtype: float
") RotationPart;
		Standard_Real RotationPart ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	* Returns the coefficients of the transformation's matrix. It is a 2 rows * 3 columns matrix. Raises OutOfRange if Row < 1 or Row > 2 or Col < 1 or Col > 3

	:param Row:
	:type Row: int
	:param Col:
	:type Col: int
	:rtype: float
") Value;
		Standard_Real Value (const Standard_Integer Row,const Standard_Integer Col);
		%feature("compactdefaultargs") Invert;
		%feature("autodoc", "	:rtype: None
") Invert;
		void Invert ();
		%feature("compactdefaultargs") Inverted;
		%feature("autodoc", "	* Computes the reverse transformation. Raises an exception if the matrix of the transformation is not inversible, it means that the scale factor is lower or equal to Resolution from package gp.

	:rtype: gp_Trsf2d
") Inverted;
		gp_Trsf2d Inverted ();
		%feature("compactdefaultargs") Multiplied;
		%feature("autodoc", "	:param T:
	:type T: gp_Trsf2d
	:rtype: gp_Trsf2d
") Multiplied;
		gp_Trsf2d Multiplied (const gp_Trsf2d & T);
		%feature("compactdefaultargs") operator *;
		%feature("autodoc", "	:param T:
	:type T: gp_Trsf2d
	:rtype: gp_Trsf2d
") operator *;
		gp_Trsf2d operator * (const gp_Trsf2d & T);
		%feature("compactdefaultargs") Multiply;
		%feature("autodoc", "	* Computes the transformation composed from <self> and T. <self> = <self> * T

	:param T:
	:type T: gp_Trsf2d
	:rtype: None
") Multiply;
		void Multiply (const gp_Trsf2d & T);
		%feature("compactdefaultargs") operator *=;
		%feature("autodoc", "	:param T:
	:type T: gp_Trsf2d
	:rtype: None
") operator *=;
		void operator *= (const gp_Trsf2d & T);
		%feature("compactdefaultargs") PreMultiply;
		%feature("autodoc", "	* Computes the transformation composed from <self> and T. <self> = T * <self>

	:param T:
	:type T: gp_Trsf2d
	:rtype: None
") PreMultiply;
		void PreMultiply (const gp_Trsf2d & T);
		%feature("compactdefaultargs") Power;
		%feature("autodoc", "	:param N:
	:type N: int
	:rtype: None
") Power;
		void Power (const Standard_Integer N);
		%feature("compactdefaultargs") Powered;
		%feature("autodoc", "	* Computes the following composition of transformations <self> * <self> * .......* <self>, N time. if N = 0 <self> = Identity if N < 0 <self> = <self>.Inverse() *...........* <self>.Inverse(). //! Raises if N < 0 and if the matrix of the transformation not inversible.

	:param N:
	:type N: int
	:rtype: gp_Trsf2d
") Powered;
		gp_Trsf2d Powered (const Standard_Integer N);
		%feature("compactdefaultargs") Transforms;
		%feature("autodoc", "	:param X:
	:type X: float &
	:param Y:
	:type Y: float &
	:rtype: None
") Transforms;
		void Transforms (Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") Transforms;
		%feature("autodoc", "	* Transforms a doublet XY with a Trsf2d

	:param Coord:
	:type Coord: gp_XY
	:rtype: None
") Transforms;
		void Transforms (gp_XY & Coord);
		%feature("compactdefaultargs") SetValues;
		%feature("autodoc", "	* Sets the coefficients of the transformation. The transformation of the point x,y is the point x',y' with : //! x' = a11 x + a12 y + a13 y' = a21 x + a22 y + a23 //! The method Value(i,j) will return aij. Raises ConstructionError if the determinant of the aij is null. If the matrix as not a uniform scale it will be orthogonalized before future using.

	:param a11:
	:type a11: float
	:param a12:
	:type a12: float
	:param a13:
	:type a13: float
	:param a21:
	:type a21: float
	:param a22:
	:type a22: float
	:param a23:
	:type a23: float
	:rtype: None
") SetValues;
		void SetValues (const Standard_Real a11,const Standard_Real a12,const Standard_Real a13,const Standard_Real a21,const Standard_Real a22,const Standard_Real a23);
		%feature("compactdefaultargs") _CSFDB_Getgp_Trsf2dscale;
		%feature("autodoc", "	:rtype: float
") _CSFDB_Getgp_Trsf2dscale;
		Standard_Real _CSFDB_Getgp_Trsf2dscale ();
		%feature("compactdefaultargs") _CSFDB_Setgp_Trsf2dscale;
		%feature("autodoc", "	:param p:
	:type p: float
	:rtype: None
") _CSFDB_Setgp_Trsf2dscale;
		void _CSFDB_Setgp_Trsf2dscale (const Standard_Real p);
		%feature("compactdefaultargs") _CSFDB_Getgp_Trsf2dshape;
		%feature("autodoc", "	:rtype: gp_TrsfForm
") _CSFDB_Getgp_Trsf2dshape;
		gp_TrsfForm _CSFDB_Getgp_Trsf2dshape ();
		%feature("compactdefaultargs") _CSFDB_Setgp_Trsf2dshape;
		%feature("autodoc", "	:param p:
	:type p: gp_TrsfForm
	:rtype: None
") _CSFDB_Setgp_Trsf2dshape;
		void _CSFDB_Setgp_Trsf2dshape (const gp_TrsfForm p);
		%feature("compactdefaultargs") _CSFDB_Getgp_Trsf2dmatrix;
		%feature("autodoc", "	:rtype: gp_Mat2d
") _CSFDB_Getgp_Trsf2dmatrix;
		const gp_Mat2d  _CSFDB_Getgp_Trsf2dmatrix ();
		%feature("compactdefaultargs") _CSFDB_Getgp_Trsf2dloc;
		%feature("autodoc", "	:rtype: gp_XY
") _CSFDB_Getgp_Trsf2dloc;
		const gp_XY  _CSFDB_Getgp_Trsf2dloc ();
};


%extend gp_Trsf2d {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor gp_Vec;
class gp_Vec {
	public:
		%feature("compactdefaultargs") gp_Vec;
		%feature("autodoc", "	* Creates a zero vector.

	:rtype: None
") gp_Vec;
		 gp_Vec ();
		%feature("compactdefaultargs") gp_Vec;
		%feature("autodoc", "	* Creates a unitary vector from a direction V.

	:param V:
	:type V: gp_Dir
	:rtype: None
") gp_Vec;
		 gp_Vec (const gp_Dir & V);
		%feature("compactdefaultargs") gp_Vec;
		%feature("autodoc", "	* Creates a vector with a triplet of coordinates.

	:param Coord:
	:type Coord: gp_XYZ
	:rtype: None
") gp_Vec;
		 gp_Vec (const gp_XYZ & Coord);
		%feature("compactdefaultargs") gp_Vec;
		%feature("autodoc", "	* Creates a point with its three cartesian coordinates.

	:param Xv:
	:type Xv: float
	:param Yv:
	:type Yv: float
	:param Zv:
	:type Zv: float
	:rtype: None
") gp_Vec;
		 gp_Vec (const Standard_Real Xv,const Standard_Real Yv,const Standard_Real Zv);
		%feature("compactdefaultargs") gp_Vec;
		%feature("autodoc", "	* Creates a vector from two points. The length of the vector is the distance between P1 and P2

	:param P1:
	:type P1: gp_Pnt
	:param P2:
	:type P2: gp_Pnt
	:rtype: None
") gp_Vec;
		 gp_Vec (const gp_Pnt & P1,const gp_Pnt & P2);
		%feature("compactdefaultargs") SetCoord;
		%feature("autodoc", "	* Changes the coordinate of range Index Index = 1 => X is modified Index = 2 => Y is modified Index = 3 => Z is modified Raised if Index != {1, 2, 3}.

	:param Index:
	:type Index: int
	:param Xi:
	:type Xi: float
	:rtype: None
") SetCoord;
		void SetCoord (const Standard_Integer Index,const Standard_Real Xi);
		%feature("compactdefaultargs") SetCoord;
		%feature("autodoc", "	* For this vector, assigns - the values Xv, Yv and Zv to its three coordinates.

	:param Xv:
	:type Xv: float
	:param Yv:
	:type Yv: float
	:param Zv:
	:type Zv: float
	:rtype: None
") SetCoord;
		void SetCoord (const Standard_Real Xv,const Standard_Real Yv,const Standard_Real Zv);
		%feature("compactdefaultargs") SetX;
		%feature("autodoc", "	* Assigns the given value to the X coordinate of this vector.

	:param X:
	:type X: float
	:rtype: None
") SetX;
		void SetX (const Standard_Real X);
		%feature("compactdefaultargs") SetY;
		%feature("autodoc", "	* Assigns the given value to the X coordinate of this vector.

	:param Y:
	:type Y: float
	:rtype: None
") SetY;
		void SetY (const Standard_Real Y);
		%feature("compactdefaultargs") SetZ;
		%feature("autodoc", "	* Assigns the given value to the X coordinate of this vector.

	:param Z:
	:type Z: float
	:rtype: None
") SetZ;
		void SetZ (const Standard_Real Z);
		%feature("compactdefaultargs") SetXYZ;
		%feature("autodoc", "	* Assigns the three coordinates of Coord to this vector.

	:param Coord:
	:type Coord: gp_XYZ
	:rtype: None
") SetXYZ;
		void SetXYZ (const gp_XYZ & Coord);
		%feature("compactdefaultargs") Coord;
		%feature("autodoc", "	* Returns the coordinate of range Index : Index = 1 => X is returned Index = 2 => Y is returned Index = 3 => Z is returned Raised if Index != {1, 2, 3}.

	:param Index:
	:type Index: int
	:rtype: float
") Coord;
		Standard_Real Coord (const Standard_Integer Index);
		%feature("compactdefaultargs") Coord;
		%feature("autodoc", "	* For this vector returns its three coordinates Xv, Yv, and Zvinline

	:param Xv:
	:type Xv: float &
	:param Yv:
	:type Yv: float &
	:param Zv:
	:type Zv: float &
	:rtype: None
") Coord;
		void Coord (Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") X;
		%feature("autodoc", "	* For this vector, returns its X coordinate.

	:rtype: float
") X;
		Standard_Real X ();
		%feature("compactdefaultargs") Y;
		%feature("autodoc", "	* For this vector, returns its Y coordinate.

	:rtype: float
") Y;
		Standard_Real Y ();
		%feature("compactdefaultargs") Z;
		%feature("autodoc", "	* For this vector, returns its Z coordinate.

	:rtype: float
") Z;
		Standard_Real Z ();
		%feature("compactdefaultargs") XYZ;
		%feature("autodoc", "	* For this vector, returns - its three coordinates as a number triple

	:rtype: gp_XYZ
") XYZ;
		const gp_XYZ  XYZ ();
		%feature("compactdefaultargs") IsEqual;
		%feature("autodoc", "	* Returns True if the two vectors have the same magnitude value and the same direction. The precision values are LinearTolerance for the magnitude and AngularTolerance for the direction.

	:param Other:
	:type Other: gp_Vec
	:param LinearTolerance:
	:type LinearTolerance: float
	:param AngularTolerance:
	:type AngularTolerance: float
	:rtype: bool
") IsEqual;
		Standard_Boolean IsEqual (const gp_Vec & Other,const Standard_Real LinearTolerance,const Standard_Real AngularTolerance);
		%feature("compactdefaultargs") IsNormal;
		%feature("autodoc", "	* Returns True if abs(<self>.Angle(Other) - PI/2.) <= AngularTolerance Raises VectorWithNullMagnitude if <self>.Magnitude() <= Resolution or Other.Magnitude() <= Resolution from gp

	:param Other:
	:type Other: gp_Vec
	:param AngularTolerance:
	:type AngularTolerance: float
	:rtype: bool
") IsNormal;
		Standard_Boolean IsNormal (const gp_Vec & Other,const Standard_Real AngularTolerance);
		%feature("compactdefaultargs") IsOpposite;
		%feature("autodoc", "	* Returns True if PI - <self>.Angle(Other) <= AngularTolerance Raises VectorWithNullMagnitude if <self>.Magnitude() <= Resolution or Other.Magnitude() <= Resolution from gp

	:param Other:
	:type Other: gp_Vec
	:param AngularTolerance:
	:type AngularTolerance: float
	:rtype: bool
") IsOpposite;
		Standard_Boolean IsOpposite (const gp_Vec & Other,const Standard_Real AngularTolerance);
		%feature("compactdefaultargs") IsParallel;
		%feature("autodoc", "	* Returns True if Angle(<self>, Other) <= AngularTolerance or PI - Angle(<self>, Other) <= AngularTolerance This definition means that two parallel vectors cannot define a plane but two vectors with opposite directions are considered as parallel. Raises VectorWithNullMagnitude if <self>.Magnitude() <= Resolution or Other.Magnitude() <= Resolution from gp

	:param Other:
	:type Other: gp_Vec
	:param AngularTolerance:
	:type AngularTolerance: float
	:rtype: bool
") IsParallel;
		Standard_Boolean IsParallel (const gp_Vec & Other,const Standard_Real AngularTolerance);
		%feature("compactdefaultargs") Angle;
		%feature("autodoc", "	* Computes the angular value between <self> and <Other> Returns the angle value between 0 and PI in radian. Raises VectorWithNullMagnitude if <self>.Magnitude() <= Resolution from gp or Other.Magnitude() <= Resolution because the angular value is indefinite if one of the vectors has a null magnitude.

	:param Other:
	:type Other: gp_Vec
	:rtype: float
") Angle;
		Standard_Real Angle (const gp_Vec & Other);
		%feature("compactdefaultargs") AngleWithRef;
		%feature("autodoc", "	* Computes the angle, in radians, between this vector and vector Other. The result is a value between -Pi and Pi. For this, VRef defines the positive sense of rotation: the angular value is positive, if the cross product this ^ Other has the same orientation as VRef relative to the plane defined by the vectors this and Other. Otherwise, the angular value is negative. Exceptions gp_VectorWithNullMagnitude if the magnitude of this vector, the vector Other, or the vector VRef is less than or equal to gp::Resolution(). Standard_DomainError if this vector, the vector Other, and the vector VRef are coplanar, unless this vector and the vector Other are parallel.

	:param Other:
	:type Other: gp_Vec
	:param VRef:
	:type VRef: gp_Vec
	:rtype: float
") AngleWithRef;
		Standard_Real AngleWithRef (const gp_Vec & Other,const gp_Vec & VRef);
		%feature("compactdefaultargs") Magnitude;
		%feature("autodoc", "	* Computes the magnitude of this vector.

	:rtype: float
") Magnitude;
		Standard_Real Magnitude ();
		%feature("compactdefaultargs") SquareMagnitude;
		%feature("autodoc", "	* Computes the square magnitude of this vector.

	:rtype: float
") SquareMagnitude;
		Standard_Real SquareMagnitude ();
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "	* Adds two vectors

	:param Other:
	:type Other: gp_Vec
	:rtype: None
") Add;
		void Add (const gp_Vec & Other);
		%feature("compactdefaultargs") operator +=;
		%feature("autodoc", "	:param Other:
	:type Other: gp_Vec
	:rtype: None
") operator +=;
		void operator += (const gp_Vec & Other);
		%feature("compactdefaultargs") Added;
		%feature("autodoc", "	* Adds two vectors

	:param Other:
	:type Other: gp_Vec
	:rtype: gp_Vec
") Added;
		gp_Vec Added (const gp_Vec & Other);
		%feature("compactdefaultargs") operator +;
		%feature("autodoc", "	:param Other:
	:type Other: gp_Vec
	:rtype: gp_Vec
") operator +;
		gp_Vec operator + (const gp_Vec & Other);
		%feature("compactdefaultargs") Subtract;
		%feature("autodoc", "	* Subtracts two vectors

	:param Right:
	:type Right: gp_Vec
	:rtype: None
") Subtract;
		void Subtract (const gp_Vec & Right);
		%feature("compactdefaultargs") operator -=;
		%feature("autodoc", "	:param Right:
	:type Right: gp_Vec
	:rtype: None
") operator -=;
		void operator -= (const gp_Vec & Right);
		%feature("compactdefaultargs") Subtracted;
		%feature("autodoc", "	* Subtracts two vectors

	:param Right:
	:type Right: gp_Vec
	:rtype: gp_Vec
") Subtracted;
		gp_Vec Subtracted (const gp_Vec & Right);
		%feature("compactdefaultargs") operator -;
		%feature("autodoc", "	:param Right:
	:type Right: gp_Vec
	:rtype: gp_Vec
") operator -;
		gp_Vec operator - (const gp_Vec & Right);
		%feature("compactdefaultargs") Multiply;
		%feature("autodoc", "	* Multiplies a vector by a scalar

	:param Scalar:
	:type Scalar: float
	:rtype: None
") Multiply;
		void Multiply (const Standard_Real Scalar);
		%feature("compactdefaultargs") operator *=;
		%feature("autodoc", "	:param Scalar:
	:type Scalar: float
	:rtype: None
") operator *=;
		void operator *= (const Standard_Real Scalar);
		%feature("compactdefaultargs") Multiplied;
		%feature("autodoc", "	* Multiplies a vector by a scalar

	:param Scalar:
	:type Scalar: float
	:rtype: gp_Vec
") Multiplied;
		gp_Vec Multiplied (const Standard_Real Scalar);
		%feature("compactdefaultargs") operator *;
		%feature("autodoc", "	:param Scalar:
	:type Scalar: float
	:rtype: gp_Vec
") operator *;
		gp_Vec operator * (const Standard_Real Scalar);
		%feature("compactdefaultargs") Divide;
		%feature("autodoc", "	* Divides a vector by a scalar

	:param Scalar:
	:type Scalar: float
	:rtype: None
") Divide;
		void Divide (const Standard_Real Scalar);
		%feature("compactdefaultargs") operator /=;
		%feature("autodoc", "	:param Scalar:
	:type Scalar: float
	:rtype: None
") operator /=;
		void operator /= (const Standard_Real Scalar);
		%feature("compactdefaultargs") Divided;
		%feature("autodoc", "	* Divides a vector by a scalar

	:param Scalar:
	:type Scalar: float
	:rtype: gp_Vec
") Divided;
		gp_Vec Divided (const Standard_Real Scalar);
		%feature("compactdefaultargs") operator /;
		%feature("autodoc", "	:param Scalar:
	:type Scalar: float
	:rtype: gp_Vec
") operator /;
		gp_Vec operator / (const Standard_Real Scalar);
		%feature("compactdefaultargs") Cross;
		%feature("autodoc", "	* computes the cross product between two vectors

	:param Right:
	:type Right: gp_Vec
	:rtype: None
") Cross;
		void Cross (const gp_Vec & Right);
		%feature("compactdefaultargs") operator ^=;
		%feature("autodoc", "	:param Right:
	:type Right: gp_Vec
	:rtype: None
") operator ^=;
		void operator ^= (const gp_Vec & Right);
		%feature("compactdefaultargs") Crossed;
		%feature("autodoc", "	* computes the cross product between two vectors

	:param Right:
	:type Right: gp_Vec
	:rtype: gp_Vec
") Crossed;
		gp_Vec Crossed (const gp_Vec & Right);
		%feature("compactdefaultargs") operator ^;
		%feature("autodoc", "	:param Right:
	:type Right: gp_Vec
	:rtype: gp_Vec
") operator ^;
		gp_Vec operator ^ (const gp_Vec & Right);
		%feature("compactdefaultargs") CrossMagnitude;
		%feature("autodoc", "	* Computes the magnitude of the cross product between <self> and Right. Returns || <self> ^ Right ||

	:param Right:
	:type Right: gp_Vec
	:rtype: float
") CrossMagnitude;
		Standard_Real CrossMagnitude (const gp_Vec & Right);
		%feature("compactdefaultargs") CrossSquareMagnitude;
		%feature("autodoc", "	* Computes the square magnitude of the cross product between <self> and Right. Returns || <self> ^ Right ||**2

	:param Right:
	:type Right: gp_Vec
	:rtype: float
") CrossSquareMagnitude;
		Standard_Real CrossSquareMagnitude (const gp_Vec & Right);
		%feature("compactdefaultargs") CrossCross;
		%feature("autodoc", "	* Computes the triple vector product. <self> ^= (V1 ^ V2)

	:param V1:
	:type V1: gp_Vec
	:param V2:
	:type V2: gp_Vec
	:rtype: None
") CrossCross;
		void CrossCross (const gp_Vec & V1,const gp_Vec & V2);
		%feature("compactdefaultargs") CrossCrossed;
		%feature("autodoc", "	* Computes the triple vector product. <self> ^ (V1 ^ V2)

	:param V1:
	:type V1: gp_Vec
	:param V2:
	:type V2: gp_Vec
	:rtype: gp_Vec
") CrossCrossed;
		gp_Vec CrossCrossed (const gp_Vec & V1,const gp_Vec & V2);
		%feature("compactdefaultargs") Dot;
		%feature("autodoc", "	* computes the scalar product

	:param Other:
	:type Other: gp_Vec
	:rtype: float
") Dot;
		Standard_Real Dot (const gp_Vec & Other);
		%feature("compactdefaultargs") operator *;
		%feature("autodoc", "	:param Other:
	:type Other: gp_Vec
	:rtype: float
") operator *;
		Standard_Real operator * (const gp_Vec & Other);
		%feature("compactdefaultargs") DotCross;
		%feature("autodoc", "	* Computes the triple scalar product <self> * (V1 ^ V2).

	:param V1:
	:type V1: gp_Vec
	:param V2:
	:type V2: gp_Vec
	:rtype: float
") DotCross;
		Standard_Real DotCross (const gp_Vec & V1,const gp_Vec & V2);
		%feature("compactdefaultargs") Normalize;
		%feature("autodoc", "	* normalizes a vector Raises an exception if the magnitude of the vector is lower or equal to Resolution from gp.

	:rtype: None
") Normalize;
		void Normalize ();
		%feature("compactdefaultargs") Normalized;
		%feature("autodoc", "	* normalizes a vector Raises an exception if the magnitude of the vector is lower or equal to Resolution from gp.

	:rtype: gp_Vec
") Normalized;
		gp_Vec Normalized ();
		%feature("compactdefaultargs") Reverse;
		%feature("autodoc", "	* Reverses the direction of a vector

	:rtype: None
") Reverse;
		void Reverse ();
		%feature("compactdefaultargs") Reversed;
		%feature("autodoc", "	* Reverses the direction of a vector

	:rtype: gp_Vec
") Reversed;
		gp_Vec Reversed ();
		%feature("compactdefaultargs") operator -;
		%feature("autodoc", "	:rtype: gp_Vec
") operator -;
		gp_Vec operator - ();
		%feature("compactdefaultargs") SetLinearForm;
		%feature("autodoc", "	* <self> is set to the following linear form : A1 * V1 + A2 * V2 + A3 * V3 + V4

	:param A1:
	:type A1: float
	:param V1:
	:type V1: gp_Vec
	:param A2:
	:type A2: float
	:param V2:
	:type V2: gp_Vec
	:param A3:
	:type A3: float
	:param V3:
	:type V3: gp_Vec
	:param V4:
	:type V4: gp_Vec
	:rtype: None
") SetLinearForm;
		void SetLinearForm (const Standard_Real A1,const gp_Vec & V1,const Standard_Real A2,const gp_Vec & V2,const Standard_Real A3,const gp_Vec & V3,const gp_Vec & V4);
		%feature("compactdefaultargs") SetLinearForm;
		%feature("autodoc", "	* <self> is set to the following linear form : A1 * V1 + A2 * V2 + A3 * V3

	:param A1:
	:type A1: float
	:param V1:
	:type V1: gp_Vec
	:param A2:
	:type A2: float
	:param V2:
	:type V2: gp_Vec
	:param A3:
	:type A3: float
	:param V3:
	:type V3: gp_Vec
	:rtype: None
") SetLinearForm;
		void SetLinearForm (const Standard_Real A1,const gp_Vec & V1,const Standard_Real A2,const gp_Vec & V2,const Standard_Real A3,const gp_Vec & V3);
		%feature("compactdefaultargs") SetLinearForm;
		%feature("autodoc", "	* <self> is set to the following linear form : A1 * V1 + A2 * V2 + V3

	:param A1:
	:type A1: float
	:param V1:
	:type V1: gp_Vec
	:param A2:
	:type A2: float
	:param V2:
	:type V2: gp_Vec
	:param V3:
	:type V3: gp_Vec
	:rtype: None
") SetLinearForm;
		void SetLinearForm (const Standard_Real A1,const gp_Vec & V1,const Standard_Real A2,const gp_Vec & V2,const gp_Vec & V3);
		%feature("compactdefaultargs") SetLinearForm;
		%feature("autodoc", "	* <self> is set to the following linear form : A1 * V1 + A2 * V2

	:param A1:
	:type A1: float
	:param V1:
	:type V1: gp_Vec
	:param A2:
	:type A2: float
	:param V2:
	:type V2: gp_Vec
	:rtype: None
") SetLinearForm;
		void SetLinearForm (const Standard_Real A1,const gp_Vec & V1,const Standard_Real A2,const gp_Vec & V2);
		%feature("compactdefaultargs") SetLinearForm;
		%feature("autodoc", "	* <self> is set to the following linear form : A1 * V1 + V2

	:param A1:
	:type A1: float
	:param V1:
	:type V1: gp_Vec
	:param V2:
	:type V2: gp_Vec
	:rtype: None
") SetLinearForm;
		void SetLinearForm (const Standard_Real A1,const gp_Vec & V1,const gp_Vec & V2);
		%feature("compactdefaultargs") SetLinearForm;
		%feature("autodoc", "	* <self> is set to the following linear form : V1 + V2

	:param V1:
	:type V1: gp_Vec
	:param V2:
	:type V2: gp_Vec
	:rtype: None
") SetLinearForm;
		void SetLinearForm (const gp_Vec & V1,const gp_Vec & V2);
		%feature("compactdefaultargs") Mirror;
		%feature("autodoc", "	:param V:
	:type V: gp_Vec
	:rtype: None
") Mirror;
		void Mirror (const gp_Vec & V);
		%feature("compactdefaultargs") Mirrored;
		%feature("autodoc", "	* Performs the symmetrical transformation of a vector with respect to the vector V which is the center of the symmetry.

	:param V:
	:type V: gp_Vec
	:rtype: gp_Vec
") Mirrored;
		gp_Vec Mirrored (const gp_Vec & V);
		%feature("compactdefaultargs") Mirror;
		%feature("autodoc", "	:param A1:
	:type A1: gp_Ax1
	:rtype: None
") Mirror;
		void Mirror (const gp_Ax1 & A1);
		%feature("compactdefaultargs") Mirrored;
		%feature("autodoc", "	* Performs the symmetrical transformation of a vector with respect to an axis placement which is the axis of the symmetry.

	:param A1:
	:type A1: gp_Ax1
	:rtype: gp_Vec
") Mirrored;
		gp_Vec Mirrored (const gp_Ax1 & A1);
		%feature("compactdefaultargs") Mirror;
		%feature("autodoc", "	:param A2:
	:type A2: gp_Ax2
	:rtype: None
") Mirror;
		void Mirror (const gp_Ax2 & A2);
		%feature("compactdefaultargs") Mirrored;
		%feature("autodoc", "	* Performs the symmetrical transformation of a vector with respect to a plane. The axis placement A2 locates the plane of the symmetry : (Location, XDirection, YDirection).

	:param A2:
	:type A2: gp_Ax2
	:rtype: gp_Vec
") Mirrored;
		gp_Vec Mirrored (const gp_Ax2 & A2);
		%feature("compactdefaultargs") Rotate;
		%feature("autodoc", "	:param A1:
	:type A1: gp_Ax1
	:param Ang:
	:type Ang: float
	:rtype: None
") Rotate;
		void Rotate (const gp_Ax1 & A1,const Standard_Real Ang);
		%feature("compactdefaultargs") Rotated;
		%feature("autodoc", "	* Rotates a vector. A1 is the axis of the rotation. Ang is the angular value of the rotation in radians.

	:param A1:
	:type A1: gp_Ax1
	:param Ang:
	:type Ang: float
	:rtype: gp_Vec
") Rotated;
		gp_Vec Rotated (const gp_Ax1 & A1,const Standard_Real Ang);
		%feature("compactdefaultargs") Scale;
		%feature("autodoc", "	:param S:
	:type S: float
	:rtype: None
") Scale;
		void Scale (const Standard_Real S);
		%feature("compactdefaultargs") Scaled;
		%feature("autodoc", "	* Scales a vector. S is the scaling value.

	:param S:
	:type S: float
	:rtype: gp_Vec
") Scaled;
		gp_Vec Scaled (const Standard_Real S);
		%feature("compactdefaultargs") Transform;
		%feature("autodoc", "	* Transforms a vector with the transformation T.

	:param T:
	:type T: gp_Trsf
	:rtype: None
") Transform;
		void Transform (const gp_Trsf & T);
		%feature("compactdefaultargs") Transformed;
		%feature("autodoc", "	* Transforms a vector with the transformation T.

	:param T:
	:type T: gp_Trsf
	:rtype: gp_Vec
") Transformed;
		gp_Vec Transformed (const gp_Trsf & T);
		%feature("compactdefaultargs") _CSFDB_Getgp_Veccoord;
		%feature("autodoc", "	:rtype: gp_XYZ
") _CSFDB_Getgp_Veccoord;
		const gp_XYZ  _CSFDB_Getgp_Veccoord ();
};


%extend gp_Vec {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor gp_Vec2d;
class gp_Vec2d {
	public:
		%feature("compactdefaultargs") gp_Vec2d;
		%feature("autodoc", "	* Creates a zero vector.

	:rtype: None
") gp_Vec2d;
		 gp_Vec2d ();
		%feature("compactdefaultargs") gp_Vec2d;
		%feature("autodoc", "	* Creates a unitary vector from a direction V.

	:param V:
	:type V: gp_Dir2d
	:rtype: None
") gp_Vec2d;
		 gp_Vec2d (const gp_Dir2d & V);
		%feature("compactdefaultargs") gp_Vec2d;
		%feature("autodoc", "	* Creates a vector with a doublet of coordinates.

	:param Coord:
	:type Coord: gp_XY
	:rtype: None
") gp_Vec2d;
		 gp_Vec2d (const gp_XY & Coord);
		%feature("compactdefaultargs") gp_Vec2d;
		%feature("autodoc", "	* Creates a point with its two Cartesian coordinates.

	:param Xv:
	:type Xv: float
	:param Yv:
	:type Yv: float
	:rtype: None
") gp_Vec2d;
		 gp_Vec2d (const Standard_Real Xv,const Standard_Real Yv);
		%feature("compactdefaultargs") gp_Vec2d;
		%feature("autodoc", "	* Creates a vector from two points. The length of the vector is the distance between P1 and P2

	:param P1:
	:type P1: gp_Pnt2d
	:param P2:
	:type P2: gp_Pnt2d
	:rtype: None
") gp_Vec2d;
		 gp_Vec2d (const gp_Pnt2d & P1,const gp_Pnt2d & P2);
		%feature("compactdefaultargs") SetCoord;
		%feature("autodoc", "	* Changes the coordinate of range Index Index = 1 => X is modified Index = 2 => Y is modified Raises OutOfRange if Index != {1, 2}.

	:param Index:
	:type Index: int
	:param Xi:
	:type Xi: float
	:rtype: None
") SetCoord;
		void SetCoord (const Standard_Integer Index,const Standard_Real Xi);
		%feature("compactdefaultargs") SetCoord;
		%feature("autodoc", "	* For this vector, assigns the values Xv and Yv to its two coordinates

	:param Xv:
	:type Xv: float
	:param Yv:
	:type Yv: float
	:rtype: None
") SetCoord;
		void SetCoord (const Standard_Real Xv,const Standard_Real Yv);
		%feature("compactdefaultargs") SetX;
		%feature("autodoc", "	* Assigns the given value to the X coordinate of this vector.

	:param X:
	:type X: float
	:rtype: None
") SetX;
		void SetX (const Standard_Real X);
		%feature("compactdefaultargs") SetY;
		%feature("autodoc", "	* Assigns the given value to the Y coordinate of this vector.

	:param Y:
	:type Y: float
	:rtype: None
") SetY;
		void SetY (const Standard_Real Y);
		%feature("compactdefaultargs") SetXY;
		%feature("autodoc", "	* Assigns the two coordinates of Coord to this vector.

	:param Coord:
	:type Coord: gp_XY
	:rtype: None
") SetXY;
		void SetXY (const gp_XY & Coord);
		%feature("compactdefaultargs") Coord;
		%feature("autodoc", "	* Returns the coordinate of range Index : Index = 1 => X is returned Index = 2 => Y is returned Raised if Index != {1, 2}.

	:param Index:
	:type Index: int
	:rtype: float
") Coord;
		Standard_Real Coord (const Standard_Integer Index);
		%feature("compactdefaultargs") Coord;
		%feature("autodoc", "	* For this vector, returns its two coordinates Xv and Yv

	:param Xv:
	:type Xv: float &
	:param Yv:
	:type Yv: float &
	:rtype: None
") Coord;
		void Coord (Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") X;
		%feature("autodoc", "	* For this vector, returns its X coordinate.

	:rtype: float
") X;
		Standard_Real X ();
		%feature("compactdefaultargs") Y;
		%feature("autodoc", "	* For this vector, returns its Y coordinate.

	:rtype: float
") Y;
		Standard_Real Y ();
		%feature("compactdefaultargs") XY;
		%feature("autodoc", "	* For this vector, returns its two coordinates as a number pair

	:rtype: gp_XY
") XY;
		const gp_XY  XY ();
		%feature("compactdefaultargs") IsEqual;
		%feature("autodoc", "	* Returns True if the two vectors have the same magnitude value and the same direction. The precision values are LinearTolerance for the magnitude and AngularTolerance for the direction.

	:param Other:
	:type Other: gp_Vec2d
	:param LinearTolerance:
	:type LinearTolerance: float
	:param AngularTolerance:
	:type AngularTolerance: float
	:rtype: bool
") IsEqual;
		Standard_Boolean IsEqual (const gp_Vec2d & Other,const Standard_Real LinearTolerance,const Standard_Real AngularTolerance);
		%feature("compactdefaultargs") IsNormal;
		%feature("autodoc", "	* Returns True if abs(Abs(<self>.Angle(Other)) - PI/2.) <= AngularTolerance Raises VectorWithNullMagnitude if <self>.Magnitude() <= Resolution or Other.Magnitude() <= Resolution from gp.

	:param Other:
	:type Other: gp_Vec2d
	:param AngularTolerance:
	:type AngularTolerance: float
	:rtype: bool
") IsNormal;
		Standard_Boolean IsNormal (const gp_Vec2d & Other,const Standard_Real AngularTolerance);
		%feature("compactdefaultargs") IsOpposite;
		%feature("autodoc", "	* Returns True if PI - Abs(<self>.Angle(Other)) <= AngularTolerance Raises VectorWithNullMagnitude if <self>.Magnitude() <= Resolution or Other.Magnitude() <= Resolution from gp.

	:param Other:
	:type Other: gp_Vec2d
	:param AngularTolerance:
	:type AngularTolerance: float
	:rtype: bool
") IsOpposite;
		Standard_Boolean IsOpposite (const gp_Vec2d & Other,const Standard_Real AngularTolerance);
		%feature("compactdefaultargs") IsParallel;
		%feature("autodoc", "	* Returns true if Abs(Angle(<self>, Other)) <= AngularTolerance or PI - Abs(Angle(<self>, Other)) <= AngularTolerance Two vectors with opposite directions are considered as parallel. Raises VectorWithNullMagnitude if <self>.Magnitude() <= Resolution or Other.Magnitude() <= Resolution from gp

	:param Other:
	:type Other: gp_Vec2d
	:param AngularTolerance:
	:type AngularTolerance: float
	:rtype: bool
") IsParallel;
		Standard_Boolean IsParallel (const gp_Vec2d & Other,const Standard_Real AngularTolerance);
		%feature("compactdefaultargs") Angle;
		%feature("autodoc", "	* Computes the angular value between <self> and <Other> returns the angle value between -PI and PI in radian. The orientation is from <self> to Other. The positive sense is the trigonometric sense. Raises VectorWithNullMagnitude if <self>.Magnitude() <= Resolution from gp or Other.Magnitude() <= Resolution because the angular value is indefinite if one of the vectors has a null magnitude.

	:param Other:
	:type Other: gp_Vec2d
	:rtype: float
") Angle;
		Standard_Real Angle (const gp_Vec2d & Other);
		%feature("compactdefaultargs") Magnitude;
		%feature("autodoc", "	* Computes the magnitude of this vector.

	:rtype: float
") Magnitude;
		Standard_Real Magnitude ();
		%feature("compactdefaultargs") SquareMagnitude;
		%feature("autodoc", "	* Computes the square magnitude of this vector.

	:rtype: float
") SquareMagnitude;
		Standard_Real SquareMagnitude ();
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "	:param Other:
	:type Other: gp_Vec2d
	:rtype: None
") Add;
		void Add (const gp_Vec2d & Other);
		%feature("compactdefaultargs") operator +=;
		%feature("autodoc", "	:param Other:
	:type Other: gp_Vec2d
	:rtype: None
") operator +=;
		void operator += (const gp_Vec2d & Other);
		%feature("compactdefaultargs") Added;
		%feature("autodoc", "	* Adds two vectors

	:param Other:
	:type Other: gp_Vec2d
	:rtype: gp_Vec2d
") Added;
		gp_Vec2d Added (const gp_Vec2d & Other);
		%feature("compactdefaultargs") operator +;
		%feature("autodoc", "	:param Other:
	:type Other: gp_Vec2d
	:rtype: gp_Vec2d
") operator +;
		gp_Vec2d operator + (const gp_Vec2d & Other);
		%feature("compactdefaultargs") Crossed;
		%feature("autodoc", "	* Computes the crossing product between two vectors

	:param Right:
	:type Right: gp_Vec2d
	:rtype: float
") Crossed;
		Standard_Real Crossed (const gp_Vec2d & Right);
		%feature("compactdefaultargs") operator ^;
		%feature("autodoc", "	:param Right:
	:type Right: gp_Vec2d
	:rtype: float
") operator ^;
		Standard_Real operator ^ (const gp_Vec2d & Right);
		%feature("compactdefaultargs") CrossMagnitude;
		%feature("autodoc", "	* Computes the magnitude of the cross product between <self> and Right. Returns || <self> ^ Right ||

	:param Right:
	:type Right: gp_Vec2d
	:rtype: float
") CrossMagnitude;
		Standard_Real CrossMagnitude (const gp_Vec2d & Right);
		%feature("compactdefaultargs") CrossSquareMagnitude;
		%feature("autodoc", "	* Computes the square magnitude of the cross product between <self> and Right. Returns || <self> ^ Right ||**2

	:param Right:
	:type Right: gp_Vec2d
	:rtype: float
") CrossSquareMagnitude;
		Standard_Real CrossSquareMagnitude (const gp_Vec2d & Right);
		%feature("compactdefaultargs") Divide;
		%feature("autodoc", "	:param Scalar:
	:type Scalar: float
	:rtype: None
") Divide;
		void Divide (const Standard_Real Scalar);
		%feature("compactdefaultargs") operator /=;
		%feature("autodoc", "	:param Scalar:
	:type Scalar: float
	:rtype: None
") operator /=;
		void operator /= (const Standard_Real Scalar);
		%feature("compactdefaultargs") Divided;
		%feature("autodoc", "	* divides a vector by a scalar

	:param Scalar:
	:type Scalar: float
	:rtype: gp_Vec2d
") Divided;
		gp_Vec2d Divided (const Standard_Real Scalar);
		%feature("compactdefaultargs") operator /;
		%feature("autodoc", "	:param Scalar:
	:type Scalar: float
	:rtype: gp_Vec2d
") operator /;
		gp_Vec2d operator / (const Standard_Real Scalar);
		%feature("compactdefaultargs") Dot;
		%feature("autodoc", "	* Computes the scalar product

	:param Other:
	:type Other: gp_Vec2d
	:rtype: float
") Dot;
		Standard_Real Dot (const gp_Vec2d & Other);
		%feature("compactdefaultargs") operator *;
		%feature("autodoc", "	:param Other:
	:type Other: gp_Vec2d
	:rtype: float
") operator *;
		Standard_Real operator * (const gp_Vec2d & Other);
		%feature("compactdefaultargs") GetNormal;
		%feature("autodoc", "	:rtype: gp_Vec2d
") GetNormal;
		gp_Vec2d GetNormal ();
		%feature("compactdefaultargs") Multiply;
		%feature("autodoc", "	:param Scalar:
	:type Scalar: float
	:rtype: None
") Multiply;
		void Multiply (const Standard_Real Scalar);
		%feature("compactdefaultargs") operator *=;
		%feature("autodoc", "	:param Scalar:
	:type Scalar: float
	:rtype: None
") operator *=;
		void operator *= (const Standard_Real Scalar);
		%feature("compactdefaultargs") Multiplied;
		%feature("autodoc", "	* Normalizes a vector Raises an exception if the magnitude of the vector is lower or equal to Resolution from package gp.

	:param Scalar:
	:type Scalar: float
	:rtype: gp_Vec2d
") Multiplied;
		gp_Vec2d Multiplied (const Standard_Real Scalar);
		%feature("compactdefaultargs") operator *;
		%feature("autodoc", "	:param Scalar:
	:type Scalar: float
	:rtype: gp_Vec2d
") operator *;
		gp_Vec2d operator * (const Standard_Real Scalar);
		%feature("compactdefaultargs") Normalize;
		%feature("autodoc", "	:rtype: None
") Normalize;
		void Normalize ();
		%feature("compactdefaultargs") Normalized;
		%feature("autodoc", "	* Normalizes a vector Raises an exception if the magnitude of the vector is lower or equal to Resolution from package gp. Reverses the direction of a vector

	:rtype: gp_Vec2d
") Normalized;
		gp_Vec2d Normalized ();
		%feature("compactdefaultargs") Reverse;
		%feature("autodoc", "	:rtype: None
") Reverse;
		void Reverse ();
		%feature("compactdefaultargs") Reversed;
		%feature("autodoc", "	* Reverses the direction of a vector

	:rtype: gp_Vec2d
") Reversed;
		gp_Vec2d Reversed ();
		%feature("compactdefaultargs") operator -;
		%feature("autodoc", "	:rtype: gp_Vec2d
") operator -;
		gp_Vec2d operator - ();
		%feature("compactdefaultargs") Subtract;
		%feature("autodoc", "	* Subtracts two vectors

	:param Right:
	:type Right: gp_Vec2d
	:rtype: None
") Subtract;
		void Subtract (const gp_Vec2d & Right);
		%feature("compactdefaultargs") operator -=;
		%feature("autodoc", "	:param Right:
	:type Right: gp_Vec2d
	:rtype: None
") operator -=;
		void operator -= (const gp_Vec2d & Right);
		%feature("compactdefaultargs") Subtracted;
		%feature("autodoc", "	* Subtracts two vectors

	:param Right:
	:type Right: gp_Vec2d
	:rtype: gp_Vec2d
") Subtracted;
		gp_Vec2d Subtracted (const gp_Vec2d & Right);
		%feature("compactdefaultargs") operator -;
		%feature("autodoc", "	:param Right:
	:type Right: gp_Vec2d
	:rtype: gp_Vec2d
") operator -;
		gp_Vec2d operator - (const gp_Vec2d & Right);
		%feature("compactdefaultargs") SetLinearForm;
		%feature("autodoc", "	* <self> is set to the following linear form : A1 * V1 + A2 * V2 + V3

	:param A1:
	:type A1: float
	:param V1:
	:type V1: gp_Vec2d
	:param A2:
	:type A2: float
	:param V2:
	:type V2: gp_Vec2d
	:param V3:
	:type V3: gp_Vec2d
	:rtype: None
") SetLinearForm;
		void SetLinearForm (const Standard_Real A1,const gp_Vec2d & V1,const Standard_Real A2,const gp_Vec2d & V2,const gp_Vec2d & V3);
		%feature("compactdefaultargs") SetLinearForm;
		%feature("autodoc", "	* <self> is set to the following linear form : A1 * V1 + A2 * V2

	:param A1:
	:type A1: float
	:param V1:
	:type V1: gp_Vec2d
	:param A2:
	:type A2: float
	:param V2:
	:type V2: gp_Vec2d
	:rtype: None
") SetLinearForm;
		void SetLinearForm (const Standard_Real A1,const gp_Vec2d & V1,const Standard_Real A2,const gp_Vec2d & V2);
		%feature("compactdefaultargs") SetLinearForm;
		%feature("autodoc", "	* <self> is set to the following linear form : A1 * V1 + V2

	:param A1:
	:type A1: float
	:param V1:
	:type V1: gp_Vec2d
	:param V2:
	:type V2: gp_Vec2d
	:rtype: None
") SetLinearForm;
		void SetLinearForm (const Standard_Real A1,const gp_Vec2d & V1,const gp_Vec2d & V2);
		%feature("compactdefaultargs") SetLinearForm;
		%feature("autodoc", "	* <self> is set to the following linear form : Left + Right

	:param Left:
	:type Left: gp_Vec2d
	:param Right:
	:type Right: gp_Vec2d
	:rtype: None
") SetLinearForm;
		void SetLinearForm (const gp_Vec2d & Left,const gp_Vec2d & Right);
		%feature("compactdefaultargs") Mirror;
		%feature("autodoc", "	* Performs the symmetrical transformation of a vector with respect to the vector V which is the center of the symmetry.

	:param V:
	:type V: gp_Vec2d
	:rtype: None
") Mirror;
		void Mirror (const gp_Vec2d & V);
		%feature("compactdefaultargs") Mirrored;
		%feature("autodoc", "	* Performs the symmetrical transformation of a vector with respect to the vector V which is the center of the symmetry.

	:param V:
	:type V: gp_Vec2d
	:rtype: gp_Vec2d
") Mirrored;
		gp_Vec2d Mirrored (const gp_Vec2d & V);
		%feature("compactdefaultargs") Mirror;
		%feature("autodoc", "	* Performs the symmetrical transformation of a vector with respect to an axis placement which is the axis of the symmetry.

	:param A1:
	:type A1: gp_Ax2d
	:rtype: None
") Mirror;
		void Mirror (const gp_Ax2d & A1);
		%feature("compactdefaultargs") Mirrored;
		%feature("autodoc", "	* Performs the symmetrical transformation of a vector with respect to an axis placement which is the axis of the symmetry.

	:param A1:
	:type A1: gp_Ax2d
	:rtype: gp_Vec2d
") Mirrored;
		gp_Vec2d Mirrored (const gp_Ax2d & A1);
		%feature("compactdefaultargs") Rotate;
		%feature("autodoc", "	:param Ang:
	:type Ang: float
	:rtype: None
") Rotate;
		void Rotate (const Standard_Real Ang);
		%feature("compactdefaultargs") Rotated;
		%feature("autodoc", "	* Rotates a vector. Ang is the angular value of the rotation in radians.

	:param Ang:
	:type Ang: float
	:rtype: gp_Vec2d
") Rotated;
		gp_Vec2d Rotated (const Standard_Real Ang);
		%feature("compactdefaultargs") Scale;
		%feature("autodoc", "	:param S:
	:type S: float
	:rtype: None
") Scale;
		void Scale (const Standard_Real S);
		%feature("compactdefaultargs") Scaled;
		%feature("autodoc", "	* Scales a vector. S is the scaling value.

	:param S:
	:type S: float
	:rtype: gp_Vec2d
") Scaled;
		gp_Vec2d Scaled (const Standard_Real S);
		%feature("compactdefaultargs") Transform;
		%feature("autodoc", "	:param T:
	:type T: gp_Trsf2d
	:rtype: None
") Transform;
		void Transform (const gp_Trsf2d & T);
		%feature("compactdefaultargs") Transformed;
		%feature("autodoc", "	* Transforms a vector with a Trsf from gp.

	:param T:
	:type T: gp_Trsf2d
	:rtype: gp_Vec2d
") Transformed;
		gp_Vec2d Transformed (const gp_Trsf2d & T);
		%feature("compactdefaultargs") _CSFDB_Getgp_Vec2dcoord;
		%feature("autodoc", "	:rtype: gp_XY
") _CSFDB_Getgp_Vec2dcoord;
		const gp_XY  _CSFDB_Getgp_Vec2dcoord ();
};


%extend gp_Vec2d {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor gp_XY;
class gp_XY {
	public:
		%feature("compactdefaultargs") gp_XY;
		%feature("autodoc", "	* Creates XY object with zero coordinates (0,0).

	:rtype: None
") gp_XY;
		 gp_XY ();
		%feature("compactdefaultargs") gp_XY;
		%feature("autodoc", "	* a number pair defined by the XY coordinates

	:param X:
	:type X: float
	:param Y:
	:type Y: float
	:rtype: None
") gp_XY;
		 gp_XY (const Standard_Real X,const Standard_Real Y);
		%feature("compactdefaultargs") SetCoord;
		%feature("autodoc", "	* modifies the coordinate of range Index Index = 1 => X is modified Index = 2 => Y is modified Raises OutOfRange if Index != {1, 2}.

	:param Index:
	:type Index: int
	:param Xi:
	:type Xi: float
	:rtype: None
") SetCoord;
		void SetCoord (const Standard_Integer Index,const Standard_Real Xi);
		%feature("compactdefaultargs") SetCoord;
		%feature("autodoc", "	* For this number pair, assigns the values X and Y to its coordinates

	:param X:
	:type X: float
	:param Y:
	:type Y: float
	:rtype: None
") SetCoord;
		void SetCoord (const Standard_Real X,const Standard_Real Y);
		%feature("compactdefaultargs") SetX;
		%feature("autodoc", "	* Assigns the given value to the X coordinate of this number pair.

	:param X:
	:type X: float
	:rtype: None
") SetX;
		void SetX (const Standard_Real X);
		%feature("compactdefaultargs") SetY;
		%feature("autodoc", "	* Assigns the given value to the Y coordinate of this number pair.

	:param Y:
	:type Y: float
	:rtype: None
") SetY;
		void SetY (const Standard_Real Y);
		%feature("compactdefaultargs") Coord;
		%feature("autodoc", "	* returns the coordinate of range Index : Index = 1 => X is returned Index = 2 => Y is returned Raises OutOfRange if Index != {1, 2}.

	:param Index:
	:type Index: int
	:rtype: float
") Coord;
		Standard_Real Coord (const Standard_Integer Index);
		%feature("compactdefaultargs") ChangeCoord;
		%feature("autodoc", "	:param theIndex:
	:type theIndex: int
	:rtype: float
") ChangeCoord;
		Standard_Real & ChangeCoord (const Standard_Integer theIndex);
		%feature("compactdefaultargs") Coord;
		%feature("autodoc", "	* For this number pair, returns its coordinates X and Y.

	:param X:
	:type X: float &
	:param Y:
	:type Y: float &
	:rtype: None
") Coord;
		void Coord (Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") X;
		%feature("autodoc", "	* Returns the X coordinate of this number pair.

	:rtype: float
") X;
		Standard_Real X ();
		%feature("compactdefaultargs") Y;
		%feature("autodoc", "	* Returns the Y coordinate of this number pair.

	:rtype: float
") Y;
		Standard_Real Y ();
		%feature("compactdefaultargs") Modulus;
		%feature("autodoc", "	* Computes Sqrt (X*X + Y*Y) where X and Y are the two coordinates of this number pair.

	:rtype: float
") Modulus;
		Standard_Real Modulus ();
		%feature("compactdefaultargs") SquareModulus;
		%feature("autodoc", "	* Computes X*X + Y*Y where X and Y are the two coordinates of this number pair.

	:rtype: float
") SquareModulus;
		Standard_Real SquareModulus ();
		%feature("compactdefaultargs") IsEqual;
		%feature("autodoc", "	* Returns true if the coordinates of this number pair are equal to the respective coordinates of the number pair Other, within the specified tolerance Tolerance. I.e.: abs(<self>.X() - Other.X()) <= Tolerance and abs(<self>.Y() - Other.Y()) <= Tolerance and computations

	:param Other:
	:type Other: gp_XY
	:param Tolerance:
	:type Tolerance: float
	:rtype: bool
") IsEqual;
		Standard_Boolean IsEqual (const gp_XY & Other,const Standard_Real Tolerance);
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "	* Computes the sum of this number pair and number pair Other <self>.X() = <self>.X() + Other.X() <self>.Y() = <self>.Y() + Other.Y()

	:param Other:
	:type Other: gp_XY
	:rtype: None
") Add;
		void Add (const gp_XY & Other);
		%feature("compactdefaultargs") operator +=;
		%feature("autodoc", "	:param Other:
	:type Other: gp_XY
	:rtype: None
") operator +=;
		void operator += (const gp_XY & Other);
		%feature("compactdefaultargs") Added;
		%feature("autodoc", "	* Computes the sum of this number pair and number pair Other new.X() = <self>.X() + Other.X() new.Y() = <self>.Y() + Other.Y()

	:param Other:
	:type Other: gp_XY
	:rtype: gp_XY
") Added;
		gp_XY Added (const gp_XY & Other);
		%feature("compactdefaultargs") operator +;
		%feature("autodoc", "	:param Other:
	:type Other: gp_XY
	:rtype: gp_XY
") operator +;
		gp_XY operator + (const gp_XY & Other);
		%feature("compactdefaultargs") Crossed;
		%feature("autodoc", "	* Real D = <self>.X() * Other.Y() - <self>.Y() * Other.X()

	:param Right:
	:type Right: gp_XY
	:rtype: float
") Crossed;
		Standard_Real Crossed (const gp_XY & Right);
		%feature("compactdefaultargs") operator ^;
		%feature("autodoc", "	:param Right:
	:type Right: gp_XY
	:rtype: float
") operator ^;
		Standard_Real operator ^ (const gp_XY & Right);
		%feature("compactdefaultargs") CrossMagnitude;
		%feature("autodoc", "	* computes the magnitude of the cross product between <self> and Right. Returns || <self> ^ Right ||

	:param Right:
	:type Right: gp_XY
	:rtype: float
") CrossMagnitude;
		Standard_Real CrossMagnitude (const gp_XY & Right);
		%feature("compactdefaultargs") CrossSquareMagnitude;
		%feature("autodoc", "	* computes the square magnitude of the cross product between <self> and Right. Returns || <self> ^ Right ||**2

	:param Right:
	:type Right: gp_XY
	:rtype: float
") CrossSquareMagnitude;
		Standard_Real CrossSquareMagnitude (const gp_XY & Right);
		%feature("compactdefaultargs") Divide;
		%feature("autodoc", "	* divides <self> by a real.

	:param Scalar:
	:type Scalar: float
	:rtype: None
") Divide;
		void Divide (const Standard_Real Scalar);
		%feature("compactdefaultargs") operator /=;
		%feature("autodoc", "	:param Scalar:
	:type Scalar: float
	:rtype: None
") operator /=;
		void operator /= (const Standard_Real Scalar);
		%feature("compactdefaultargs") Divided;
		%feature("autodoc", "	* Divides <self> by a real.

	:param Scalar:
	:type Scalar: float
	:rtype: gp_XY
") Divided;
		gp_XY Divided (const Standard_Real Scalar);
		%feature("compactdefaultargs") operator /;
		%feature("autodoc", "	:param Scalar:
	:type Scalar: float
	:rtype: gp_XY
") operator /;
		gp_XY operator / (const Standard_Real Scalar);
		%feature("compactdefaultargs") Dot;
		%feature("autodoc", "	* Computes the scalar product between <self> and Other

	:param Other:
	:type Other: gp_XY
	:rtype: float
") Dot;
		Standard_Real Dot (const gp_XY & Other);
		%feature("compactdefaultargs") operator *;
		%feature("autodoc", "	:param Other:
	:type Other: gp_XY
	:rtype: float
") operator *;
		Standard_Real operator * (const gp_XY & Other);
		%feature("compactdefaultargs") Multiply;
		%feature("autodoc", "	* <self>.X() = <self>.X() * Scalar; <self>.Y() = <self>.Y() * Scalar;

	:param Scalar:
	:type Scalar: float
	:rtype: None
") Multiply;
		void Multiply (const Standard_Real Scalar);
		%feature("compactdefaultargs") operator *=;
		%feature("autodoc", "	:param Scalar:
	:type Scalar: float
	:rtype: None
") operator *=;
		void operator *= (const Standard_Real Scalar);
		%feature("compactdefaultargs") Multiply;
		%feature("autodoc", "	* <self>.X() = <self>.X() * Other.X(); <self>.Y() = <self>.Y() * Other.Y();

	:param Other:
	:type Other: gp_XY
	:rtype: None
") Multiply;
		void Multiply (const gp_XY & Other);
		%feature("compactdefaultargs") operator *=;
		%feature("autodoc", "	:param Other:
	:type Other: gp_XY
	:rtype: None
") operator *=;
		void operator *= (const gp_XY & Other);
		%feature("compactdefaultargs") Multiply;
		%feature("autodoc", "	* <self> = Matrix * <self>

	:param Matrix:
	:type Matrix: gp_Mat2d
	:rtype: None
") Multiply;
		void Multiply (const gp_Mat2d & Matrix);
		%feature("compactdefaultargs") operator *=;
		%feature("autodoc", "	:param Matrix:
	:type Matrix: gp_Mat2d
	:rtype: None
") operator *=;
		void operator *= (const gp_Mat2d & Matrix);
		%feature("compactdefaultargs") Multiplied;
		%feature("autodoc", "	* New.X() = <self>.X() * Scalar; New.Y() = <self>.Y() * Scalar;

	:param Scalar:
	:type Scalar: float
	:rtype: gp_XY
") Multiplied;
		gp_XY Multiplied (const Standard_Real Scalar);
		%feature("compactdefaultargs") operator *;
		%feature("autodoc", "	:param Scalar:
	:type Scalar: float
	:rtype: gp_XY
") operator *;
		gp_XY operator * (const Standard_Real Scalar);
		%feature("compactdefaultargs") Multiplied;
		%feature("autodoc", "	* new.X() = <self>.X() * Other.X(); new.Y() = <self>.Y() * Other.Y();

	:param Other:
	:type Other: gp_XY
	:rtype: gp_XY
") Multiplied;
		gp_XY Multiplied (const gp_XY & Other);
		%feature("compactdefaultargs") Multiplied;
		%feature("autodoc", "	* New = Matrix * <self>

	:param Matrix:
	:type Matrix: gp_Mat2d
	:rtype: gp_XY
") Multiplied;
		gp_XY Multiplied (const gp_Mat2d & Matrix);
		%feature("compactdefaultargs") operator *;
		%feature("autodoc", "	:param Matrix:
	:type Matrix: gp_Mat2d
	:rtype: gp_XY
") operator *;
		gp_XY operator * (const gp_Mat2d & Matrix);
		%feature("compactdefaultargs") Normalize;
		%feature("autodoc", "	* <self>.X() = <self>.X()/ <self>.Modulus() <self>.Y() = <self>.Y()/ <self>.Modulus() Raises ConstructionError if <self>.Modulus() <= Resolution from gp

	:rtype: None
") Normalize;
		void Normalize ();
		%feature("compactdefaultargs") Normalized;
		%feature("autodoc", "	* New.X() = <self>.X()/ <self>.Modulus() New.Y() = <self>.Y()/ <self>.Modulus() Raises ConstructionError if <self>.Modulus() <= Resolution from gp

	:rtype: gp_XY
") Normalized;
		gp_XY Normalized ();
		%feature("compactdefaultargs") Reverse;
		%feature("autodoc", "	* <self>.X() = -<self>.X() <self>.Y() = -<self>.Y()

	:rtype: None
") Reverse;
		void Reverse ();
		%feature("compactdefaultargs") Reversed;
		%feature("autodoc", "	* New.X() = -<self>.X() New.Y() = -<self>.Y()

	:rtype: gp_XY
") Reversed;
		gp_XY Reversed ();
		%feature("compactdefaultargs") operator -;
		%feature("autodoc", "	:rtype: gp_XY
") operator -;
		gp_XY operator - ();
		%feature("compactdefaultargs") SetLinearForm;
		%feature("autodoc", "	* Computes the following linear combination and assigns the result to this number pair: A1 * XY1 + A2 * XY2

	:param A1:
	:type A1: float
	:param XY1:
	:type XY1: gp_XY
	:param A2:
	:type A2: float
	:param XY2:
	:type XY2: gp_XY
	:rtype: None
") SetLinearForm;
		void SetLinearForm (const Standard_Real A1,const gp_XY & XY1,const Standard_Real A2,const gp_XY & XY2);
		%feature("compactdefaultargs") SetLinearForm;
		%feature("autodoc", "	* -- Computes the following linear combination and assigns the result to this number pair: A1 * XY1 + A2 * XY2 + XY3

	:param A1:
	:type A1: float
	:param XY1:
	:type XY1: gp_XY
	:param A2:
	:type A2: float
	:param XY2:
	:type XY2: gp_XY
	:param XY3:
	:type XY3: gp_XY
	:rtype: None
") SetLinearForm;
		void SetLinearForm (const Standard_Real A1,const gp_XY & XY1,const Standard_Real A2,const gp_XY & XY2,const gp_XY & XY3);
		%feature("compactdefaultargs") SetLinearForm;
		%feature("autodoc", "	* Computes the following linear combination and assigns the result to this number pair: A1 * XY1 + XY2

	:param A1:
	:type A1: float
	:param XY1:
	:type XY1: gp_XY
	:param XY2:
	:type XY2: gp_XY
	:rtype: None
") SetLinearForm;
		void SetLinearForm (const Standard_Real A1,const gp_XY & XY1,const gp_XY & XY2);
		%feature("compactdefaultargs") SetLinearForm;
		%feature("autodoc", "	* Computes the following linear combination and assigns the result to this number pair: XY1 + XY2

	:param XY1:
	:type XY1: gp_XY
	:param XY2:
	:type XY2: gp_XY
	:rtype: None
") SetLinearForm;
		void SetLinearForm (const gp_XY & XY1,const gp_XY & XY2);
		%feature("compactdefaultargs") Subtract;
		%feature("autodoc", "	* <self>.X() = <self>.X() - Other.X() <self>.Y() = <self>.Y() - Other.Y()

	:param Right:
	:type Right: gp_XY
	:rtype: None
") Subtract;
		void Subtract (const gp_XY & Right);
		%feature("compactdefaultargs") operator -=;
		%feature("autodoc", "	:param Right:
	:type Right: gp_XY
	:rtype: None
") operator -=;
		void operator -= (const gp_XY & Right);
		%feature("compactdefaultargs") Subtracted;
		%feature("autodoc", "	* new.X() = <self>.X() - Other.X() new.Y() = <self>.Y() - Other.Y()

	:param Right:
	:type Right: gp_XY
	:rtype: gp_XY
") Subtracted;
		gp_XY Subtracted (const gp_XY & Right);
		%feature("compactdefaultargs") operator -;
		%feature("autodoc", "	:param Right:
	:type Right: gp_XY
	:rtype: gp_XY
") operator -;
		gp_XY operator - (const gp_XY & Right);
		%feature("compactdefaultargs") _CSFDB_Getgp_XYx;
		%feature("autodoc", "	:rtype: float
") _CSFDB_Getgp_XYx;
		Standard_Real _CSFDB_Getgp_XYx ();
		%feature("compactdefaultargs") _CSFDB_Setgp_XYx;
		%feature("autodoc", "	:param p:
	:type p: float
	:rtype: None
") _CSFDB_Setgp_XYx;
		void _CSFDB_Setgp_XYx (const Standard_Real p);
		%feature("compactdefaultargs") _CSFDB_Getgp_XYy;
		%feature("autodoc", "	:rtype: float
") _CSFDB_Getgp_XYy;
		Standard_Real _CSFDB_Getgp_XYy ();
		%feature("compactdefaultargs") _CSFDB_Setgp_XYy;
		%feature("autodoc", "	:param p:
	:type p: float
	:rtype: None
") _CSFDB_Setgp_XYy;
		void _CSFDB_Setgp_XYy (const Standard_Real p);
};


%extend gp_XY {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor gp_XYZ;
class gp_XYZ {
	public:
		%feature("compactdefaultargs") gp_XYZ;
		%feature("autodoc", "	* Creates an XYZ object with zero co-ordinates (0,0,0)

	:rtype: None
") gp_XYZ;
		 gp_XYZ ();
		%feature("compactdefaultargs") gp_XYZ;
		%feature("autodoc", "	* creates an XYZ with given coordinates

	:param X:
	:type X: float
	:param Y:
	:type Y: float
	:param Z:
	:type Z: float
	:rtype: None
") gp_XYZ;
		 gp_XYZ (const Standard_Real X,const Standard_Real Y,const Standard_Real Z);
		%feature("compactdefaultargs") SetCoord;
		%feature("autodoc", "	* For this XYZ object, assigns the values X, Y and Z to its three coordinates

	:param X:
	:type X: float
	:param Y:
	:type Y: float
	:param Z:
	:type Z: float
	:rtype: None
") SetCoord;
		void SetCoord (const Standard_Real X,const Standard_Real Y,const Standard_Real Z);
		%feature("compactdefaultargs") SetCoord;
		%feature("autodoc", "	* modifies the coordinate of range Index Index = 1 => X is modified Index = 2 => Y is modified Index = 3 => Z is modified Raises OutOfRange if Index != {1, 2, 3}.

	:param Index:
	:type Index: int
	:param Xi:
	:type Xi: float
	:rtype: None
") SetCoord;
		void SetCoord (const Standard_Integer Index,const Standard_Real Xi);
		%feature("compactdefaultargs") SetX;
		%feature("autodoc", "	* Assigns the given value to the X coordinate

	:param X:
	:type X: float
	:rtype: None
") SetX;
		void SetX (const Standard_Real X);
		%feature("compactdefaultargs") SetY;
		%feature("autodoc", "	* Assigns the given value to the Y coordinate

	:param Y:
	:type Y: float
	:rtype: None
") SetY;
		void SetY (const Standard_Real Y);
		%feature("compactdefaultargs") SetZ;
		%feature("autodoc", "	* Assigns the given value to the Z coordinate

	:param Z:
	:type Z: float
	:rtype: None
") SetZ;
		void SetZ (const Standard_Real Z);
		%feature("compactdefaultargs") Coord;
		%feature("autodoc", "	* returns the coordinate of range Index : Index = 1 => X is returned Index = 2 => Y is returned Index = 3 => Z is returned //! Raises OutOfRange if Index != {1, 2, 3}.

	:param Index:
	:type Index: int
	:rtype: float
") Coord;
		Standard_Real Coord (const Standard_Integer Index);
		%feature("compactdefaultargs") ChangeCoord;
		%feature("autodoc", "	:param theIndex:
	:type theIndex: int
	:rtype: float
") ChangeCoord;
		Standard_Real & ChangeCoord (const Standard_Integer theIndex);
		%feature("compactdefaultargs") Coord;
		%feature("autodoc", "	:param X:
	:type X: float &
	:param Y:
	:type Y: float &
	:param Z:
	:type Z: float &
	:rtype: None
") Coord;
		void Coord (Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") X;
		%feature("autodoc", "	* Returns the X coordinate

	:rtype: float
") X;
		Standard_Real X ();
		%feature("compactdefaultargs") Y;
		%feature("autodoc", "	* Returns the Y coordinate

	:rtype: float
") Y;
		Standard_Real Y ();
		%feature("compactdefaultargs") Z;
		%feature("autodoc", "	* Returns the Z coordinate

	:rtype: float
") Z;
		Standard_Real Z ();
		%feature("compactdefaultargs") GetData;
		%feature("autodoc", "	* Returns a const ptr to coordinates location. Is useful for algorithms, but DOES NOT PERFORM ANY CHECKS!

	:rtype: float *
") GetData;
		const Standard_Real * GetData ();
		%feature("compactdefaultargs") ChangeData;
		%feature("autodoc", "	* Returns a ptr to coordinates location. Is useful for algorithms, but DOES NOT PERFORM ANY CHECKS!

	:rtype: float *
") ChangeData;
		Standard_Real * ChangeData ();
		%feature("compactdefaultargs") Modulus;
		%feature("autodoc", "	* computes Sqrt (X*X + Y*Y + Z*Z) where X, Y and Z are the three coordinates of this XYZ object.

	:rtype: float
") Modulus;
		Standard_Real Modulus ();
		%feature("compactdefaultargs") SquareModulus;
		%feature("autodoc", "	* Computes X*X + Y*Y + Z*Z where X, Y and Z are the three coordinates of this XYZ object.

	:rtype: float
") SquareModulus;
		Standard_Real SquareModulus ();
		%feature("compactdefaultargs") IsEqual;
		%feature("autodoc", "	* Returns True if he coordinates of this XYZ object are equal to the respective coordinates Other, within the specified tolerance Tolerance. I.e.: abs(<self>.X() - Other.X()) <= Tolerance and abs(<self>.Y() - Other.Y()) <= Tolerance and abs(<self>.Z() - Other.Z()) <= Tolerance.

	:param Other:
	:type Other: gp_XYZ
	:param Tolerance:
	:type Tolerance: float
	:rtype: bool
") IsEqual;
		Standard_Boolean IsEqual (const gp_XYZ & Other,const Standard_Real Tolerance);
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "	* <self>.X() = <self>.X() + Other.X() <self>.Y() = <self>.Y() + Other.Y() <self>.Z() = <self>.Z() + Other.Z()

	:param Other:
	:type Other: gp_XYZ
	:rtype: None
") Add;
		void Add (const gp_XYZ & Other);
		%feature("compactdefaultargs") operator +=;
		%feature("autodoc", "	:param Other:
	:type Other: gp_XYZ
	:rtype: None
") operator +=;
		void operator += (const gp_XYZ & Other);
		%feature("compactdefaultargs") Added;
		%feature("autodoc", "	* new.X() = <self>.X() + Other.X() new.Y() = <self>.Y() + Other.Y() new.Z() = <self>.Z() + Other.Z()

	:param Other:
	:type Other: gp_XYZ
	:rtype: gp_XYZ
") Added;
		gp_XYZ Added (const gp_XYZ & Other);
		%feature("compactdefaultargs") operator +;
		%feature("autodoc", "	:param Other:
	:type Other: gp_XYZ
	:rtype: gp_XYZ
") operator +;
		gp_XYZ operator + (const gp_XYZ & Other);
		%feature("compactdefaultargs") Cross;
		%feature("autodoc", "	* <self>.X() = <self>.Y() * Other.Z() - <self>.Z() * Other.Y() <self>.Y() = <self>.Z() * Other.X() - <self>.X() * Other.Z() <self>.Z() = <self>.X() * Other.Y() - <self>.Y() * Other.X()

	:param Right:
	:type Right: gp_XYZ
	:rtype: None
") Cross;
		void Cross (const gp_XYZ & Right);
		%feature("compactdefaultargs") operator ^=;
		%feature("autodoc", "	:param Right:
	:type Right: gp_XYZ
	:rtype: None
") operator ^=;
		void operator ^= (const gp_XYZ & Right);
		%feature("compactdefaultargs") Crossed;
		%feature("autodoc", "	* new.X() = <self>.Y() * Other.Z() - <self>.Z() * Other.Y() new.Y() = <self>.Z() * Other.X() - <self>.X() * Other.Z() new.Z() = <self>.X() * Other.Y() - <self>.Y() * Other.X()

	:param Right:
	:type Right: gp_XYZ
	:rtype: gp_XYZ
") Crossed;
		gp_XYZ Crossed (const gp_XYZ & Right);
		%feature("compactdefaultargs") operator ^;
		%feature("autodoc", "	:param Right:
	:type Right: gp_XYZ
	:rtype: gp_XYZ
") operator ^;
		gp_XYZ operator ^ (const gp_XYZ & Right);
		%feature("compactdefaultargs") CrossMagnitude;
		%feature("autodoc", "	* Computes the magnitude of the cross product between <self> and Right. Returns || <self> ^ Right ||

	:param Right:
	:type Right: gp_XYZ
	:rtype: float
") CrossMagnitude;
		Standard_Real CrossMagnitude (const gp_XYZ & Right);
		%feature("compactdefaultargs") CrossSquareMagnitude;
		%feature("autodoc", "	* Computes the square magnitude of the cross product between <self> and Right. Returns || <self> ^ Right ||**2

	:param Right:
	:type Right: gp_XYZ
	:rtype: float
") CrossSquareMagnitude;
		Standard_Real CrossSquareMagnitude (const gp_XYZ & Right);
		%feature("compactdefaultargs") CrossCross;
		%feature("autodoc", "	* Triple vector product Computes <self> = <self>.Cross(Coord1.Cross(Coord2))

	:param Coord1:
	:type Coord1: gp_XYZ
	:param Coord2:
	:type Coord2: gp_XYZ
	:rtype: None
") CrossCross;
		void CrossCross (const gp_XYZ & Coord1,const gp_XYZ & Coord2);
		%feature("compactdefaultargs") CrossCrossed;
		%feature("autodoc", "	* Triple vector product computes New = <self>.Cross(Coord1.Cross(Coord2))

	:param Coord1:
	:type Coord1: gp_XYZ
	:param Coord2:
	:type Coord2: gp_XYZ
	:rtype: gp_XYZ
") CrossCrossed;
		gp_XYZ CrossCrossed (const gp_XYZ & Coord1,const gp_XYZ & Coord2);
		%feature("compactdefaultargs") Divide;
		%feature("autodoc", "	* divides <self> by a real.

	:param Scalar:
	:type Scalar: float
	:rtype: None
") Divide;
		void Divide (const Standard_Real Scalar);
		%feature("compactdefaultargs") operator /=;
		%feature("autodoc", "	:param Scalar:
	:type Scalar: float
	:rtype: None
") operator /=;
		void operator /= (const Standard_Real Scalar);
		%feature("compactdefaultargs") Divided;
		%feature("autodoc", "	* divides <self> by a real.

	:param Scalar:
	:type Scalar: float
	:rtype: gp_XYZ
") Divided;
		gp_XYZ Divided (const Standard_Real Scalar);
		%feature("compactdefaultargs") operator /;
		%feature("autodoc", "	:param Scalar:
	:type Scalar: float
	:rtype: gp_XYZ
") operator /;
		gp_XYZ operator / (const Standard_Real Scalar);
		%feature("compactdefaultargs") Dot;
		%feature("autodoc", "	* computes the scalar product between <self> and Other

	:param Other:
	:type Other: gp_XYZ
	:rtype: float
") Dot;
		Standard_Real Dot (const gp_XYZ & Other);
		%feature("compactdefaultargs") operator *;
		%feature("autodoc", "	:param Other:
	:type Other: gp_XYZ
	:rtype: float
") operator *;
		Standard_Real operator * (const gp_XYZ & Other);
		%feature("compactdefaultargs") DotCross;
		%feature("autodoc", "	* computes the triple scalar product

	:param Coord1:
	:type Coord1: gp_XYZ
	:param Coord2:
	:type Coord2: gp_XYZ
	:rtype: float
") DotCross;
		Standard_Real DotCross (const gp_XYZ & Coord1,const gp_XYZ & Coord2);
		%feature("compactdefaultargs") Multiply;
		%feature("autodoc", "	* <self>.X() = <self>.X() * Scalar; <self>.Y() = <self>.Y() * Scalar; <self>.Z() = <self>.Z() * Scalar;

	:param Scalar:
	:type Scalar: float
	:rtype: None
") Multiply;
		void Multiply (const Standard_Real Scalar);
		%feature("compactdefaultargs") operator *=;
		%feature("autodoc", "	:param Scalar:
	:type Scalar: float
	:rtype: None
") operator *=;
		void operator *= (const Standard_Real Scalar);
		%feature("compactdefaultargs") Multiply;
		%feature("autodoc", "	* <self>.X() = <self>.X() * Other.X(); <self>.Y() = <self>.Y() * Other.Y(); <self>.Z() = <self>.Z() * Other.Z();

	:param Other:
	:type Other: gp_XYZ
	:rtype: None
") Multiply;
		void Multiply (const gp_XYZ & Other);
		%feature("compactdefaultargs") operator *=;
		%feature("autodoc", "	:param Other:
	:type Other: gp_XYZ
	:rtype: None
") operator *=;
		void operator *= (const gp_XYZ & Other);
		%feature("compactdefaultargs") Multiply;
		%feature("autodoc", "	* <self> = Matrix * <self>

	:param Matrix:
	:type Matrix: gp_Mat
	:rtype: None
") Multiply;
		void Multiply (const gp_Mat & Matrix);
		%feature("compactdefaultargs") operator *=;
		%feature("autodoc", "	:param Matrix:
	:type Matrix: gp_Mat
	:rtype: None
") operator *=;
		void operator *= (const gp_Mat & Matrix);
		%feature("compactdefaultargs") Multiplied;
		%feature("autodoc", "	* New.X() = <self>.X() * Scalar; New.Y() = <self>.Y() * Scalar; New.Z() = <self>.Z() * Scalar;

	:param Scalar:
	:type Scalar: float
	:rtype: gp_XYZ
") Multiplied;
		gp_XYZ Multiplied (const Standard_Real Scalar);
		%feature("compactdefaultargs") operator *;
		%feature("autodoc", "	:param Scalar:
	:type Scalar: float
	:rtype: gp_XYZ
") operator *;
		gp_XYZ operator * (const Standard_Real Scalar);
		%feature("compactdefaultargs") Multiplied;
		%feature("autodoc", "	* new.X() = <self>.X() * Other.X(); new.Y() = <self>.Y() * Other.Y(); new.Z() = <self>.Z() * Other.Z();

	:param Other:
	:type Other: gp_XYZ
	:rtype: gp_XYZ
") Multiplied;
		gp_XYZ Multiplied (const gp_XYZ & Other);
		%feature("compactdefaultargs") Multiplied;
		%feature("autodoc", "	* New = Matrix * <self>

	:param Matrix:
	:type Matrix: gp_Mat
	:rtype: gp_XYZ
") Multiplied;
		gp_XYZ Multiplied (const gp_Mat & Matrix);
		%feature("compactdefaultargs") operator *;
		%feature("autodoc", "	:param Matrix:
	:type Matrix: gp_Mat
	:rtype: gp_XYZ
") operator *;
		gp_XYZ operator * (const gp_Mat & Matrix);
		%feature("compactdefaultargs") Normalize;
		%feature("autodoc", "	* <self>.X() = <self>.X()/ <self>.Modulus() <self>.Y() = <self>.Y()/ <self>.Modulus() <self>.Z() = <self>.Z()/ <self>.Modulus() Raised if <self>.Modulus() <= Resolution from gp

	:rtype: None
") Normalize;
		void Normalize ();
		%feature("compactdefaultargs") Normalized;
		%feature("autodoc", "	* New.X() = <self>.X()/ <self>.Modulus() New.Y() = <self>.Y()/ <self>.Modulus() New.Z() = <self>.Z()/ <self>.Modulus() Raised if <self>.Modulus() <= Resolution from gp

	:rtype: gp_XYZ
") Normalized;
		gp_XYZ Normalized ();
		%feature("compactdefaultargs") Reverse;
		%feature("autodoc", "	* <self>.X() = -<self>.X() <self>.Y() = -<self>.Y() <self>.Z() = -<self>.Z()

	:rtype: None
") Reverse;
		void Reverse ();
		%feature("compactdefaultargs") Reversed;
		%feature("autodoc", "	* New.X() = -<self>.X() New.Y() = -<self>.Y() New.Z() = -<self>.Z()

	:rtype: gp_XYZ
") Reversed;
		gp_XYZ Reversed ();
		%feature("compactdefaultargs") Subtract;
		%feature("autodoc", "	* <self>.X() = <self>.X() - Other.X() <self>.Y() = <self>.Y() - Other.Y() <self>.Z() = <self>.Z() - Other.Z()

	:param Right:
	:type Right: gp_XYZ
	:rtype: None
") Subtract;
		void Subtract (const gp_XYZ & Right);
		%feature("compactdefaultargs") operator -=;
		%feature("autodoc", "	:param Right:
	:type Right: gp_XYZ
	:rtype: None
") operator -=;
		void operator -= (const gp_XYZ & Right);
		%feature("compactdefaultargs") Subtracted;
		%feature("autodoc", "	* new.X() = <self>.X() - Other.X() new.Y() = <self>.Y() - Other.Y() new.Z() = <self>.Z() - Other.Z()

	:param Right:
	:type Right: gp_XYZ
	:rtype: gp_XYZ
") Subtracted;
		gp_XYZ Subtracted (const gp_XYZ & Right);
		%feature("compactdefaultargs") operator -;
		%feature("autodoc", "	:param Right:
	:type Right: gp_XYZ
	:rtype: gp_XYZ
") operator -;
		gp_XYZ operator - (const gp_XYZ & Right);
		%feature("compactdefaultargs") SetLinearForm;
		%feature("autodoc", "	* <self> is set to the following linear form : A1 * XYZ1 + A2 * XYZ2 + A3 * XYZ3 + XYZ4

	:param A1:
	:type A1: float
	:param XYZ1:
	:type XYZ1: gp_XYZ
	:param A2:
	:type A2: float
	:param XYZ2:
	:type XYZ2: gp_XYZ
	:param A3:
	:type A3: float
	:param XYZ3:
	:type XYZ3: gp_XYZ
	:param XYZ4:
	:type XYZ4: gp_XYZ
	:rtype: None
") SetLinearForm;
		void SetLinearForm (const Standard_Real A1,const gp_XYZ & XYZ1,const Standard_Real A2,const gp_XYZ & XYZ2,const Standard_Real A3,const gp_XYZ & XYZ3,const gp_XYZ & XYZ4);
		%feature("compactdefaultargs") SetLinearForm;
		%feature("autodoc", "	* <self> is set to the following linear form : A1 * XYZ1 + A2 * XYZ2 + A3 * XYZ3

	:param A1:
	:type A1: float
	:param XYZ1:
	:type XYZ1: gp_XYZ
	:param A2:
	:type A2: float
	:param XYZ2:
	:type XYZ2: gp_XYZ
	:param A3:
	:type A3: float
	:param XYZ3:
	:type XYZ3: gp_XYZ
	:rtype: None
") SetLinearForm;
		void SetLinearForm (const Standard_Real A1,const gp_XYZ & XYZ1,const Standard_Real A2,const gp_XYZ & XYZ2,const Standard_Real A3,const gp_XYZ & XYZ3);
		%feature("compactdefaultargs") SetLinearForm;
		%feature("autodoc", "	* <self> is set to the following linear form : A1 * XYZ1 + A2 * XYZ2 + XYZ3

	:param A1:
	:type A1: float
	:param XYZ1:
	:type XYZ1: gp_XYZ
	:param A2:
	:type A2: float
	:param XYZ2:
	:type XYZ2: gp_XYZ
	:param XYZ3:
	:type XYZ3: gp_XYZ
	:rtype: None
") SetLinearForm;
		void SetLinearForm (const Standard_Real A1,const gp_XYZ & XYZ1,const Standard_Real A2,const gp_XYZ & XYZ2,const gp_XYZ & XYZ3);
		%feature("compactdefaultargs") SetLinearForm;
		%feature("autodoc", "	* <self> is set to the following linear form : A1 * XYZ1 + A2 * XYZ2

	:param A1:
	:type A1: float
	:param XYZ1:
	:type XYZ1: gp_XYZ
	:param A2:
	:type A2: float
	:param XYZ2:
	:type XYZ2: gp_XYZ
	:rtype: None
") SetLinearForm;
		void SetLinearForm (const Standard_Real A1,const gp_XYZ & XYZ1,const Standard_Real A2,const gp_XYZ & XYZ2);
		%feature("compactdefaultargs") SetLinearForm;
		%feature("autodoc", "	* <self> is set to the following linear form : A1 * XYZ1 + XYZ2

	:param A1:
	:type A1: float
	:param XYZ1:
	:type XYZ1: gp_XYZ
	:param XYZ2:
	:type XYZ2: gp_XYZ
	:rtype: None
") SetLinearForm;
		void SetLinearForm (const Standard_Real A1,const gp_XYZ & XYZ1,const gp_XYZ & XYZ2);
		%feature("compactdefaultargs") SetLinearForm;
		%feature("autodoc", "	* <self> is set to the following linear form : XYZ1 + XYZ2

	:param XYZ1:
	:type XYZ1: gp_XYZ
	:param XYZ2:
	:type XYZ2: gp_XYZ
	:rtype: None
") SetLinearForm;
		void SetLinearForm (const gp_XYZ & XYZ1,const gp_XYZ & XYZ2);
		%feature("compactdefaultargs") _CSFDB_Getgp_XYZx;
		%feature("autodoc", "	:rtype: float
") _CSFDB_Getgp_XYZx;
		Standard_Real _CSFDB_Getgp_XYZx ();
		%feature("compactdefaultargs") _CSFDB_Setgp_XYZx;
		%feature("autodoc", "	:param p:
	:type p: float
	:rtype: None
") _CSFDB_Setgp_XYZx;
		void _CSFDB_Setgp_XYZx (const Standard_Real p);
		%feature("compactdefaultargs") _CSFDB_Getgp_XYZy;
		%feature("autodoc", "	:rtype: float
") _CSFDB_Getgp_XYZy;
		Standard_Real _CSFDB_Getgp_XYZy ();
		%feature("compactdefaultargs") _CSFDB_Setgp_XYZy;
		%feature("autodoc", "	:param p:
	:type p: float
	:rtype: None
") _CSFDB_Setgp_XYZy;
		void _CSFDB_Setgp_XYZy (const Standard_Real p);
		%feature("compactdefaultargs") _CSFDB_Getgp_XYZz;
		%feature("autodoc", "	:rtype: float
") _CSFDB_Getgp_XYZz;
		Standard_Real _CSFDB_Getgp_XYZz ();
		%feature("compactdefaultargs") _CSFDB_Setgp_XYZz;
		%feature("autodoc", "	:param p:
	:type p: float
	:rtype: None
") _CSFDB_Setgp_XYZz;
		void _CSFDB_Setgp_XYZz (const Standard_Real p);
};


%extend gp_XYZ {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
