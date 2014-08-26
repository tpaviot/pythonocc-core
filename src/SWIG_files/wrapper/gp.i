/*
Copyright 2008-2014 Thomas Paviot (tpaviot@gmail.com)


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
%module gp

#pragma SWIG nowarn=504,325,503

%{
#ifdef WNT
#pragma warning(disable : 4716)
#endif
%}

%include ../common/CommonIncludes.i
%include ../common/StandardDefines.i
%include ../common/ExceptionCatcher.i
%include ../common/FunctionTransformers.i
%include ../common/Operators.i

%include gp_required_python_modules.i
%include gp_headers.i

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
%nodefaultctor gp;
class gp {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	static Standard_Real

Parabola.  Method of package gp  
 In geometric computations, defines the tolerance criterion  
used to determine when two numbers can be considered equal.  
Many class functions use this tolerance criterion, for  
example, to avoid division by zero in geometric  
computations. In the documentation, tolerance criterion is  
always referred to as gp::Resolution().") Resolution;
		static Standard_Real Resolution ();
		%feature("autodoc", "Args:
	None
Returns:
	static  gp_Pnt

Identifies a Cartesian point with coordinates X = Y = Z = 0.0.0") Origin;
		static const gp_Pnt & Origin ();
		%feature("autodoc", "Args:
	None
Returns:
	static  gp_Dir

Returns a unit vector with the combination (1,0,0)") DX;
		static const gp_Dir & DX ();
		%feature("autodoc", "Args:
	None
Returns:
	static  gp_Dir

Returns a unit vector with the combination (0,1,0)") DY;
		static const gp_Dir & DY ();
		%feature("autodoc", "Args:
	None
Returns:
	static  gp_Dir

Returns a unit vector with the combination (0,0,1)") DZ;
		static const gp_Dir & DZ ();
		%feature("autodoc", "Args:
	None
Returns:
	static  gp_Ax1

//!Identifies an axis where its origin is Origin  
and its unit vector coordinates  X = 1.0,  Y = Z = 0.0") OX;
		static const gp_Ax1 & OX ();
		%feature("autodoc", "Args:
	None
Returns:
	static  gp_Ax1

//!Identifies an axis where its origin is Origin  
and its unit vector coordinates Y = 1.0,  X = Z = 0.0") OY;
		static const gp_Ax1 & OY ();
		%feature("autodoc", "Args:
	None
Returns:
	static  gp_Ax1

//!Identifies an axis where its origin is Origin  
and its unit vector coordinates Z = 1.0,  Y = X = 0.0") OZ;
		static const gp_Ax1 & OZ ();
		%feature("autodoc", "Args:
	None
Returns:
	static  gp_Ax2

//!Identifies a coordinate system where its origin is Origin,  
and its 'main Direction' and 'X Direction' coordinates  
 Z = 1.0, X = Y =0.0 and X direction coordinates X = 1.0, Y = Z = 0.0") XOY;
		static const gp_Ax2 & XOY ();
		%feature("autodoc", "Args:
	None
Returns:
	static  gp_Ax2

//!Identifies a coordinate system where its origin is Origin,  
and its 'main Direction' and 'X Direction' coordinates  
 Y = 1.0, X = Z =0.0 and X direction coordinates Z = 1.0, X = Y = 0.0") ZOX;
		static const gp_Ax2 & ZOX ();
		%feature("autodoc", "Args:
	None
Returns:
	static  gp_Ax2

//!Identifies a coordinate system where its origin is Origin,  
and its 'main Direction' and 'X Direction' coordinates  
 X = 1.0, Z = Y =0.0 and X direction coordinates Y = 1.0, X = Z = 0.0  In 2D space") YOZ;
		static const gp_Ax2 & YOZ ();
		%feature("autodoc", "Args:
	None
Returns:
	static  gp_Pnt2d

Identifies a Cartesian point with coordinates X = Y = 0.0") Origin2d;
		static const gp_Pnt2d & Origin2d ();
		%feature("autodoc", "Args:
	None
Returns:
	static  gp_Dir2d

Returns a unit vector with the combinations (1,0)") DX2d;
		static const gp_Dir2d & DX2d ();
		%feature("autodoc", "Args:
	None
Returns:
	static  gp_Dir2d

Returns a unit vector with the combinations (0,1)") DY2d;
		static const gp_Dir2d & DY2d ();
		%feature("autodoc", "Args:
	None
Returns:
	static  gp_Ax2d

Identifies an axis where its origin is Origin2d  
and its unit vector coordinates are: X = 1.0,  Y = 0.0") OX2d;
		static const gp_Ax2d & OX2d ();
		%feature("autodoc", "Args:
	None
Returns:
	static  gp_Ax2d

Identifies an axis where its origin is Origin2d  
and its unit vector coordinates are Y = 1.0,  X = 0.0") OY2d;
		static const gp_Ax2d & OY2d ();
};


%feature("shadow") gp::~gp %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend gp {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor gp_Ax1;
class gp_Ax1 {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

Creates an axis object representing Z axis of  
           the reference co-ordinate system.") gp_Ax1;
		 gp_Ax1 ();
		%feature("autodoc", "Args:
	P(gp_Pnt)
	V(gp_Dir)

Returns:
	None

P is the location point and V is the direction of <self>.") gp_Ax1;
		 gp_Ax1 (const gp_Pnt  P,const gp_Dir  V);
		%feature("autodoc", "Args:
	V(gp_Dir)

Returns:
	None

Assigns V as the 'Direction'  of this axis.") SetDirection;
		void SetDirection (const gp_Dir  V);
		%feature("autodoc", "Args:
	P(gp_Pnt)

Returns:
	None

Assigns  P as the origin of this axis.") SetLocation;
		void SetLocation (const gp_Pnt  P);
		%feature("autodoc", "Args:
	None
Returns:
	gp_Dir

Returns the direction of <self>.") Direction;
		const gp_Dir & Direction ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Pnt

Returns the location point of <self>.") Location;
		const gp_Pnt & Location ();
		%feature("autodoc", "Args:
	Other(gp_Ax1)
	AngularTolerance(Standard_Real)
	LinearTolerance(Standard_Real)

Returns:
	Standard_Boolean

Returns True if  :  
 . the angle between <self> and <Other> is lower or equal  
   to <AngularTolerance> and  
 . the distance between <self>.Location() and <Other> is lower  
   or equal to <LinearTolerance> and  
 . the distance between <Other>.Location() and <self> is lower  
   or equal to LinearTolerance.") IsCoaxial;
		Standard_Boolean IsCoaxial (const gp_Ax1  Other,const Standard_Real AngularTolerance,const Standard_Real LinearTolerance);
		%feature("autodoc", "Args:
	Other(gp_Ax1)
	AngularTolerance(Standard_Real)

Returns:
	Standard_Boolean

Returns True if the direction of the <self> and <Other>  
 are normal to each other.  
That is, if the angle between the two axes is equal to Pi/2.  
Note: the tolerance criterion is given by AngularTolerance..") IsNormal;
		Standard_Boolean IsNormal (const gp_Ax1  Other,const Standard_Real AngularTolerance);
		%feature("autodoc", "Args:
	Other(gp_Ax1)
	AngularTolerance(Standard_Real)

Returns:
	Standard_Boolean

Returns True if the direction of <self> and <Other> are  
 parallel with opposite orientation. That is, if the angle  
between the two axes is equal to Pi.  
Note: the tolerance criterion is given by AngularTolerance.") IsOpposite;
		Standard_Boolean IsOpposite (const gp_Ax1  Other,const Standard_Real AngularTolerance);
		%feature("autodoc", "Args:
	Other(gp_Ax1)
	AngularTolerance(Standard_Real)

Returns:
	Standard_Boolean

Returns True if the direction of <self> and <Other> are  
 parallel with same orientation or opposite orientation. That  
is, if the angle between the two axes is equal to 0 or Pi.  
Note: the tolerance criterion is given by  
AngularTolerance.") IsParallel;
		Standard_Boolean IsParallel (const gp_Ax1  Other,const Standard_Real AngularTolerance);
		%feature("autodoc", "Args:
	Other(gp_Ax1)

Returns:
	Standard_Real

Computes the angular value, in radians, between <self>.Direction() and  
 <Other>.Direction(). Returns the angle between 0 and 2*PI  
 radians.") Angle;
		Standard_Real Angle (const gp_Ax1  Other);
		%feature("autodoc", "Args:
	None
Returns:
	None

Reverses the unit vector of this axis.  
and  assigns the result to this axis.") Reverse;
		void Reverse ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Ax1

Reverses the unit vector of this axis and creates a new one.") Reversed;
		gp_Ax1 Reversed ();
		%feature("autodoc", "Args:
	P(gp_Pnt)

Returns:
	None

Performs the symmetrical transformation of an axis  
 placement with respect to the point P which is the  
 center of the symmetry and assigns the result to this axis.") Mirror;
		void Mirror (const gp_Pnt  P);
		%feature("autodoc", "Args:
	P(gp_Pnt)

Returns:
	gp_Ax1

Performs the symmetrical transformation of an axis  
 placement with respect to the point P which is the  
 center of the symmetry and creates a new axis.") Mirrored;
		gp_Ax1 Mirrored (const gp_Pnt  P);
		%feature("autodoc", "Args:
	A1(gp_Ax1)

Returns:
	None

Performs the symmetrical transformation of an axis  
 placement with respect to an axis placement which  
 is the axis of the symmetry and assigns the result to this axis.") Mirror;
		void Mirror (const gp_Ax1  A1);
		%feature("autodoc", "Args:
	A1(gp_Ax1)

Returns:
	gp_Ax1

Performs the symmetrical transformation of an axis  
 placement with respect to an axis placement which  
 is the axis of the symmetry and creates a new axis.") Mirrored;
		gp_Ax1 Mirrored (const gp_Ax1  A1);
		%feature("autodoc", "Args:
	A2(gp_Ax2)

Returns:
	None

Performs the symmetrical transformation of an axis  
 placement with respect to a plane. The axis placement  
 <A2> locates the plane of the symmetry :  
 (Location, XDirection, YDirection) and assigns the result to this axis.") Mirror;
		void Mirror (const gp_Ax2  A2);
		%feature("autodoc", "Args:
	A2(gp_Ax2)

Returns:
	gp_Ax1

Performs the symmetrical transformation of an axis  
 placement with respect to a plane. The axis placement  
 <A2> locates the plane of the symmetry :  
 (Location, XDirection, YDirection) and creates a new axis.") Mirrored;
		gp_Ax1 Mirrored (const gp_Ax2  A2);
		%feature("autodoc", "Args:
	A1(gp_Ax1)
	Ang(Standard_Real)

Returns:
	None

Rotates this axis at an angle Ang (in radians) about the axis A1  
and assigns the result to this axis.") Rotate;
		void Rotate (const gp_Ax1  A1,const Standard_Real Ang);
		%feature("autodoc", "Args:
	A1(gp_Ax1)
	Ang(Standard_Real)

Returns:
	gp_Ax1

Rotates this axis at an angle Ang (in radians) about the axis A1  
and creates a new one.") Rotated;
		gp_Ax1 Rotated (const gp_Ax1  A1,const Standard_Real Ang);
		%feature("autodoc", "Args:
	P(gp_Pnt)
	S(Standard_Real)

Returns:
	None

Applies a scaling transformation to this axis with:  
-   scale factor S, and  
-   center P and assigns the result to this axis.") Scale;
		void Scale (const gp_Pnt  P,const Standard_Real S);
		%feature("autodoc", "Args:
	P(gp_Pnt)
	S(Standard_Real)

Returns:
	gp_Ax1

Applies a scaling transformation to this axis with:  
-   scale factor S, and  
-   center P and creates a new axis.") Scaled;
		gp_Ax1 Scaled (const gp_Pnt  P,const Standard_Real S);
		%feature("autodoc", "Args:
	T(gp_Trsf)

Returns:
	None

Applies the transformation T to this axis.  
and assigns the result to this axis.") Transform;
		void Transform (const gp_Trsf  T);
		%feature("autodoc", "Args:
	T(gp_Trsf)

Returns:
	gp_Ax1

Applies the transformation T to this axis and creates a new one.  
 Translates an axis plaxement in the direction of the vector  
 <V>. The magnitude of the translation is the vector's magnitude.") Transformed;
		gp_Ax1 Transformed (const gp_Trsf  T);
		%feature("autodoc", "Args:
	V(gp_Vec)

Returns:
	None

Translates this axis by the vector V,  
and assigns the result to this axis.") Translate;
		void Translate (const gp_Vec  V);
		%feature("autodoc", "Args:
	V(gp_Vec)

Returns:
	gp_Ax1

Translates this axis by the vector V,  
and creates a new one.") Translated;
		gp_Ax1 Translated (const gp_Vec  V);
		%feature("autodoc", "Args:
	P1(gp_Pnt)
	P2(gp_Pnt)

Returns:
	None

Translates this axis by:  
the vector (P1, P2) defined from point P1 to point P2.  
and assigns the result to this axis.") Translate;
		void Translate (const gp_Pnt  P1,const gp_Pnt  P2);
		%feature("autodoc", "Args:
	P1(gp_Pnt)
	P2(gp_Pnt)

Returns:
	gp_Ax1

Translates this axis by:  
the vector (P1, P2) defined from point P1 to point P2.  
and creates a new one.") Translated;
		gp_Ax1 Translated (const gp_Pnt  P1,const gp_Pnt  P2);
		%feature("autodoc", "Args:
	None
Returns:
	gp_Pnt

No detailed docstring for this function.") _CSFDB_Getgp_Ax1loc;
		const gp_Pnt & _CSFDB_Getgp_Ax1loc ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Dir

No detailed docstring for this function.") _CSFDB_Getgp_Ax1vdir;
		const gp_Dir & _CSFDB_Getgp_Ax1vdir ();
};


%feature("shadow") gp_Ax1::~gp_Ax1 %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend gp_Ax1 {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor gp_Ax2;
class gp_Ax2 {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

Creates an object corresponding to the reference  
           coordinate system (OXYZ).") gp_Ax2;
		 gp_Ax2 ();
		%feature("autodoc", "Args:
	P(gp_Pnt)
	N(gp_Dir)
	Vx(gp_Dir)

Returns:
	None

Creates an axis placement with an origin P such that:  
  -   N is the Direction, and  
  -   the 'X Direction' is normal to N, in the plane  
   defined by the vectors (N, Vx): 'X  
   Direction' = (N ^ Vx) ^ N,  
 Exception: raises ConstructionError if N and Vx are parallel (same or opposite orientation).") gp_Ax2;
		 gp_Ax2 (const gp_Pnt  P,const gp_Dir  N,const gp_Dir  Vx);
		%feature("autodoc", "Args:
	P(gp_Pnt)
	V(gp_Dir)

Returns:
	None

Creates -   a coordinate system with an origin P, where V  
gives the 'main Direction' (here, 'X Direction' and 'Y  
 Direction' are defined automatically).") gp_Ax2;
		 gp_Ax2 (const gp_Pnt  P,const gp_Dir  V);
		%feature("autodoc", "Args:
	A1(gp_Ax1)

Returns:
	None

Assigns the origin and 'main Direction' of the axis A1 to  
this coordinate system, then recomputes its 'X Direction' and 'Y Direction'.  
Note: The new 'X Direction' is computed as follows:  
new 'X Direction' = V1 ^(previous 'X Direction' ^ V)  
where V is the 'Direction' of A1.  
Exceptions  
Standard_ConstructionError if A1 is parallel to the 'X  
Direction' of this coordinate system.") SetAxis;
		void SetAxis (const gp_Ax1  A1);
		%feature("autodoc", "Args:
	V(gp_Dir)

Returns:
	None

Changes the 'main Direction' of this coordinate system,  
then recomputes its 'X Direction' and 'Y Direction'.  
Note: the new 'X Direction' is computed as follows:  
new 'X Direction' = V ^ (previous 'X Direction' ^ V)  
  Exceptions  
Standard_ConstructionError if V is parallel to the 'X  
Direction' of this coordinate system.") SetDirection;
		void SetDirection (const gp_Dir  V);
		%feature("autodoc", "Args:
	P(gp_Pnt)

Returns:
	None

Changes the 'Location' point (origin) of <self>.") SetLocation;
		void SetLocation (const gp_Pnt  P);
		%feature("autodoc", "Args:
	Vx(gp_Dir)

Returns:
	None

Changes the 'Xdirection' of <self>. The main direction  
 'Direction' is not modified, the 'Ydirection' is modified.  
 If <Vx> is not normal to the main direction then <XDirection>  
 is computed as follows XDirection = Direction ^ (Vx ^ Direction).  
Exceptions  
Standard_ConstructionError if Vx or Vy is parallel to  
the 'main Direction' of this coordinate system.") SetXDirection;
		void SetXDirection (const gp_Dir  Vx);
		%feature("autodoc", "Args:
	Vy(gp_Dir)

Returns:
	None

Changes the 'Ydirection' of <self>. The main direction is not  
 modified but the 'Xdirection' is changed.  
 If <Vy> is not normal to the main direction then 'YDirection'  
 is computed as  follows  
 YDirection = Direction ^ (<Vy> ^ Direction).  
Exceptions  
Standard_ConstructionError if Vx or Vy is parallel to  
the 'main Direction' of this coordinate system.") SetYDirection;
		void SetYDirection (const gp_Dir  Vy);
		%feature("autodoc", "Args:
	Other(gp_Ax2)

Returns:
	Standard_Real

Computes the angular value, in radians, between the main direction of  
 <self> and the main direction of <Other>. Returns the angle  
 between 0 and PI in radians.") Angle;
		Standard_Real Angle (const gp_Ax2  Other);
		%feature("autodoc", "Args:
	None
Returns:
	gp_Ax1

Returns the main axis of <self>. It is the 'Location' point  
 and the main 'Direction'.") Axis;
		const gp_Ax1 & Axis ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Dir

Returns the main direction of <self>.") Direction;
		const gp_Dir & Direction ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Pnt

Returns the 'Location' point (origin) of <self>.") Location;
		const gp_Pnt & Location ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Dir

Returns the 'XDirection' of <self>.") XDirection;
		const gp_Dir & XDirection ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Dir

Returns the 'YDirection' of <self>.") YDirection;
		const gp_Dir & YDirection ();
		%feature("autodoc", "Args:
	Other(gp_Ax2)
	LinearTolerance(Standard_Real)
	AngularTolerance(Standard_Real)

Returns:
	Standard_Boolean

No detailed docstring for this function.") IsCoplanar;
		Standard_Boolean IsCoplanar (const gp_Ax2  Other,const Standard_Real LinearTolerance,const Standard_Real AngularTolerance);
		%feature("autodoc", "Args:
	A1(gp_Ax1)
	LinearTolerance(Standard_Real)
	AngularTolerance(Standard_Real)

Returns:
	Standard_Boolean

Returns True if  
 . the distance between <self> and the 'Location' point of A1  
   is lower of equal to LinearTolerance and  
 . the main direction of <self> and the direction of A1 are normal.  
Note: the tolerance criterion for angular equality is given by AngularTolerance.") IsCoplanar;
		Standard_Boolean IsCoplanar (const gp_Ax1  A1,const Standard_Real LinearTolerance,const Standard_Real AngularTolerance);
		%feature("autodoc", "Args:
	P(gp_Pnt)

Returns:
	None

Performs a symmetrical transformation of this coordinate  
system with respect to:  
-   the point P, and assigns the result to this coordinate system.  
Warning  
This transformation is always performed on the origin.  
In case of a reflection with respect to a point:  
- the main direction of the coordinate system is not changed, and  
- the 'X Direction' and the 'Y Direction' are simply reversed  
In case of a reflection with respect to an axis or a plane:  
  -   the transformation is applied to the 'X Direction'  
   and the 'Y Direction', then  
  -   the 'main Direction' is recomputed as the cross  
   product 'X Direction' ^ 'Y   Direction'.  
 This maintains the right-handed property of the  
coordinate system.") Mirror;
		void Mirror (const gp_Pnt  P);
		%feature("autodoc", "Args:
	P(gp_Pnt)

Returns:
	gp_Ax2

Performs a symmetrical transformation of this coordinate  
system with respect to:  
-   the point P, and creates a new one.  
Warning  
This transformation is always performed on the origin.  
In case of a reflection with respect to a point:  
- the main direction of the coordinate system is not changed, and  
- the 'X Direction' and the 'Y Direction' are simply reversed  
In case of a reflection with respect to an axis or a plane:  
  -   the transformation is applied to the 'X Direction'  
   and the 'Y Direction', then  
  -   the 'main Direction' is recomputed as the cross  
   product 'X Direction' ^ 'Y   Direction'.  
 This maintains the right-handed property of the  
coordinate system.") Mirrored;
		gp_Ax2 Mirrored (const gp_Pnt  P);
		%feature("autodoc", "Args:
	A1(gp_Ax1)

Returns:
	None

Performs a symmetrical transformation of this coordinate  
system with respect to:  
-   the axis A1, and assigns the result to this coordinate systeme.  
Warning  
This transformation is always performed on the origin.  
In case of a reflection with respect to a point:  
- the main direction of the coordinate system is not changed, and  
- the 'X Direction' and the 'Y Direction' are simply reversed  
In case of a reflection with respect to an axis or a plane:  
  -   the transformation is applied to the 'X Direction'  
   and the 'Y Direction', then  
  -   the 'main Direction' is recomputed as the cross  
   product 'X Direction' ^ 'Y   Direction'.  
 This maintains the right-handed property of the  
coordinate system.") Mirror;
		void Mirror (const gp_Ax1  A1);
		%feature("autodoc", "Args:
	A1(gp_Ax1)

Returns:
	gp_Ax2

Performs a symmetrical transformation of this coordinate  
system with respect to:  
-   the axis A1, and  creates a new one.  
Warning  
This transformation is always performed on the origin.  
In case of a reflection with respect to a point:  
- the main direction of the coordinate system is not changed, and  
- the 'X Direction' and the 'Y Direction' are simply reversed  
In case of a reflection with respect to an axis or a plane:  
  -   the transformation is applied to the 'X Direction'  
   and the 'Y Direction', then  
  -   the 'main Direction' is recomputed as the cross  
   product 'X Direction' ^ 'Y   Direction'.  
 This maintains the right-handed property of the  
coordinate system.") Mirrored;
		gp_Ax2 Mirrored (const gp_Ax1  A1);
		%feature("autodoc", "Args:
	A2(gp_Ax2)

Returns:
	None

Performs a symmetrical transformation of this coordinate  
system with respect to:  
-   the plane defined by the origin, 'X Direction' and 'Y  
  Direction' of coordinate system A2 and  assigns the result to this coordinate systeme.  
Warning  
This transformation is always performed on the origin.  
In case of a reflection with respect to a point:  
- the main direction of the coordinate system is not changed, and  
- the 'X Direction' and the 'Y Direction' are simply reversed  
In case of a reflection with respect to an axis or a plane:  
  -   the transformation is applied to the 'X Direction'  
   and the 'Y Direction', then  
  -   the 'main Direction' is recomputed as the cross  
   product 'X Direction' ^ 'Y   Direction'.  
 This maintains the right-handed property of the  
coordinate system.") Mirror;
		void Mirror (const gp_Ax2  A2);
		%feature("autodoc", "Args:
	A2(gp_Ax2)

Returns:
	gp_Ax2

Performs a symmetrical transformation of this coordinate  
system with respect to:  
-   the plane defined by the origin, 'X Direction' and 'Y  
  Direction' of coordinate system A2 and creates a new one.  
Warning  
This transformation is always performed on the origin.  
In case of a reflection with respect to a point:  
- the main direction of the coordinate system is not changed, and  
- the 'X Direction' and the 'Y Direction' are simply reversed  
In case of a reflection with respect to an axis or a plane:  
  -   the transformation is applied to the 'X Direction'  
   and the 'Y Direction', then  
  -   the 'main Direction' is recomputed as the cross  
   product 'X Direction' ^ 'Y   Direction'.  
 This maintains the right-handed property of the  
coordinate system.") Mirrored;
		gp_Ax2 Mirrored (const gp_Ax2  A2);
		%feature("autodoc", "Args:
	A1(gp_Ax1)
	Ang(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Rotate;
		void Rotate (const gp_Ax1  A1,const Standard_Real Ang);
		%feature("autodoc", "Args:
	A1(gp_Ax1)
	Ang(Standard_Real)

Returns:
	gp_Ax2

Rotates an axis placement. <A1> is the axis of the  
 rotation . Ang is the angular value of the rotation  
 in radians.") Rotated;
		gp_Ax2 Rotated (const gp_Ax1  A1,const Standard_Real Ang);
		%feature("autodoc", "Args:
	P(gp_Pnt)
	S(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Scale;
		void Scale (const gp_Pnt  P,const Standard_Real S);
		%feature("autodoc", "Args:
	P(gp_Pnt)
	S(Standard_Real)

Returns:
	gp_Ax2

Applies a scaling transformation on the axis placement.  
 The 'Location' point of the axisplacement is modified.  
Warnings :  
 If the scale <S> is negative :  
  . the main direction of the axis placement is not changed.  
  . The 'XDirection' and the 'YDirection' are reversed.  
 So the axis placement stay right handed.") Scaled;
		gp_Ax2 Scaled (const gp_Pnt  P,const Standard_Real S);
		%feature("autodoc", "Args:
	T(gp_Trsf)

Returns:
	None

No detailed docstring for this function.") Transform;
		void Transform (const gp_Trsf  T);
		%feature("autodoc", "Args:
	T(gp_Trsf)

Returns:
	gp_Ax2

Transforms an axis placement with a Trsf.  
 The 'Location' point, the 'XDirection' and the  
 'YDirection' are transformed with T.  The resulting  
 main 'Direction' of <self> is the cross product between  
 the 'XDirection' and the 'YDirection' after transformation.") Transformed;
		gp_Ax2 Transformed (const gp_Trsf  T);
		%feature("autodoc", "Args:
	V(gp_Vec)

Returns:
	None

No detailed docstring for this function.") Translate;
		void Translate (const gp_Vec  V);
		%feature("autodoc", "Args:
	V(gp_Vec)

Returns:
	gp_Ax2

Translates an axis plaxement in the direction of the vector  
 <V>. The magnitude of the translation is the vector's magnitude.") Translated;
		gp_Ax2 Translated (const gp_Vec  V);
		%feature("autodoc", "Args:
	P1(gp_Pnt)
	P2(gp_Pnt)

Returns:
	None

No detailed docstring for this function.") Translate;
		void Translate (const gp_Pnt  P1,const gp_Pnt  P2);
		%feature("autodoc", "Args:
	P1(gp_Pnt)
	P2(gp_Pnt)

Returns:
	gp_Ax2

Translates an axis placement from the point <P1> to the  
 point <P2>.") Translated;
		gp_Ax2 Translated (const gp_Pnt  P1,const gp_Pnt  P2);
		%feature("autodoc", "Args:
	None
Returns:
	gp_Ax1

No detailed docstring for this function.") _CSFDB_Getgp_Ax2axis;
		const gp_Ax1 & _CSFDB_Getgp_Ax2axis ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Dir

No detailed docstring for this function.") _CSFDB_Getgp_Ax2vydir;
		const gp_Dir & _CSFDB_Getgp_Ax2vydir ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Dir

No detailed docstring for this function.") _CSFDB_Getgp_Ax2vxdir;
		const gp_Dir & _CSFDB_Getgp_Ax2vxdir ();
};


%feature("shadow") gp_Ax2::~gp_Ax2 %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend gp_Ax2 {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor gp_Ax22d;
class gp_Ax22d {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

Creates an object representing the reference  
           co-ordinate system (OXY).") gp_Ax22d;
		 gp_Ax22d ();
		%feature("autodoc", "Args:
	P(gp_Pnt2d)
	Vx(gp_Dir2d)
	Vy(gp_Dir2d)

Returns:
	None

Creates a coordinate system with origin P and where:  
  -   Vx is the 'X Direction', and  
  -   the 'Y Direction' is orthogonal to Vx and  
   oriented so that the cross products Vx^'Y  
   Direction' and Vx^Vy have the same sign.  
Raises ConstructionError if Vx and Vy are parallel (same or opposite orientation).") gp_Ax22d;
		 gp_Ax22d (const gp_Pnt2d  P,const gp_Dir2d  Vx,const gp_Dir2d  Vy);
		%feature("autodoc", "Args:
	P(gp_Pnt2d)
	V(gp_Dir2d)
	Sense(Standard_Boolean)=Standard_True

Returns:
	None

Creates -   a coordinate system with origin P and 'X Direction'  
  V, which is:  
  -   right-handed if Sense is true (default value), or  
  -   left-handed if Sense is false") gp_Ax22d;
		 gp_Ax22d (const gp_Pnt2d  P,const gp_Dir2d  V,const Standard_Boolean Sense = Standard_True);
		%feature("autodoc", "Args:
	A(gp_Ax2d)
	Sense(Standard_Boolean)=Standard_True

Returns:
	None

Creates -   a coordinate system where its origin is the origin of  
  A and its 'X Direction' is the unit vector of A, which   is:  
  -   right-handed if Sense is true (default value), or  
  -   left-handed if Sense is false.") gp_Ax22d;
		 gp_Ax22d (const gp_Ax2d  A,const Standard_Boolean Sense = Standard_True);
		%feature("autodoc", "Args:
	A1(gp_Ax22d)

Returns:
	None

Assigns the origin and the two unit vectors of the  
coordinate system A1 to this coordinate system.") SetAxis;
		void SetAxis (const gp_Ax22d  A1);
		%feature("autodoc", "Args:
	A1(gp_Ax2d)

Returns:
	None

Changes the XAxis and YAxis ('Location' point and 'Direction')  
 of <self>.  
 The 'YDirection' is recomputed in the same sense as before.") SetXAxis;
		void SetXAxis (const gp_Ax2d  A1);
		%feature("autodoc", "Args:
	A1(gp_Ax2d)

Returns:
	None

Changes the XAxis and YAxis ('Location' point and 'Direction') of <self>.  
 The 'XDirection' is recomputed in the same sense as before.") SetYAxis;
		void SetYAxis (const gp_Ax2d  A1);
		%feature("autodoc", "Args:
	P(gp_Pnt2d)

Returns:
	None

Changes the 'Location' point (origin) of <self>.") SetLocation;
		void SetLocation (const gp_Pnt2d  P);
		%feature("autodoc", "Args:
	Vx(gp_Dir2d)

Returns:
	None

Assigns Vx to the 'X Direction'  of  
this coordinate system. The other unit vector of this  
coordinate system is recomputed, normal to Vx ,  
without modifying the orientation (right-handed or  
left-handed) of this coordinate system.") SetXDirection;
		void SetXDirection (const gp_Dir2d  Vx);
		%feature("autodoc", "Args:
	Vy(gp_Dir2d)

Returns:
	None

Assignsr Vy to the  'Y Direction' of  
this coordinate system. The other unit vector of this  
coordinate system is recomputed, normal to Vy,  
without modifying the orientation (right-handed or  
left-handed) of this coordinate system.") SetYDirection;
		void SetYDirection (const gp_Dir2d  Vy);
		%feature("autodoc", "Args:
	None
Returns:
	gp_Ax2d

Returns an axis, for which  
-   the origin is that of this coordinate system, and  
-   the unit vector is either the 'X Direction'  of this coordinate system.  
Note: the result is the 'X Axis' of this coordinate system.") XAxis;
		gp_Ax2d XAxis ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Ax2d

Returns an axis, for which  
   -   the origin is that of this coordinate system, and  
- the unit vector is either the  'Y Direction' of this coordinate system.  
Note: the result is the 'Y Axis' of this coordinate system.") YAxis;
		gp_Ax2d YAxis ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Pnt2d

Returns the 'Location' point (origin) of <self>.") Location;
		const gp_Pnt2d & Location ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Dir2d

Returns the 'XDirection' of <self>.") XDirection;
		const gp_Dir2d & XDirection ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Dir2d

Returns the 'YDirection' of <self>.") YDirection;
		const gp_Dir2d & YDirection ();
		%feature("autodoc", "Args:
	P(gp_Pnt2d)

Returns:
	None

No detailed docstring for this function.") Mirror;
		void Mirror (const gp_Pnt2d  P);
		%feature("autodoc", "Args:
	P(gp_Pnt2d)

Returns:
	gp_Ax22d

Performs the symmetrical transformation of an axis  
 placement with respect to the point P which is the  
 center of the symmetry.  
Warnings :  
 The main direction of the axis placement is not changed.  
 The 'XDirection' and the 'YDirection' are reversed.  
 So the axis placement stay right handed.") Mirrored;
		gp_Ax22d Mirrored (const gp_Pnt2d  P);
		%feature("autodoc", "Args:
	A(gp_Ax2d)

Returns:
	None

No detailed docstring for this function.") Mirror;
		void Mirror (const gp_Ax2d  A);
		%feature("autodoc", "Args:
	A(gp_Ax2d)

Returns:
	gp_Ax22d

Performs the symmetrical transformation of an axis  
 placement with respect to an axis placement which  
 is the axis of the symmetry.  
 The transformation is performed on the 'Location'  
 point, on the 'XDirection' and 'YDirection'.  
 The resulting main 'Direction' is the cross product between  
 the 'XDirection' and the 'YDirection' after transformation.") Mirrored;
		gp_Ax22d Mirrored (const gp_Ax2d  A);
		%feature("autodoc", "Args:
	P(gp_Pnt2d)
	Ang(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Rotate;
		void Rotate (const gp_Pnt2d  P,const Standard_Real Ang);
		%feature("autodoc", "Args:
	P(gp_Pnt2d)
	Ang(Standard_Real)

Returns:
	gp_Ax22d

Rotates an axis placement. <A1> is the axis of the  
 rotation . Ang is the angular value of the rotation  
 in radians.") Rotated;
		gp_Ax22d Rotated (const gp_Pnt2d  P,const Standard_Real Ang);
		%feature("autodoc", "Args:
	P(gp_Pnt2d)
	S(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Scale;
		void Scale (const gp_Pnt2d  P,const Standard_Real S);
		%feature("autodoc", "Args:
	P(gp_Pnt2d)
	S(Standard_Real)

Returns:
	gp_Ax22d

Applies a scaling transformation on the axis placement.  
 The 'Location' point of the axisplacement is modified.  
Warnings :  
 If the scale <S> is negative :  
  . the main direction of the axis placement is not changed.  
  . The 'XDirection' and the 'YDirection' are reversed.  
 So the axis placement stay right handed.") Scaled;
		gp_Ax22d Scaled (const gp_Pnt2d  P,const Standard_Real S);
		%feature("autodoc", "Args:
	T(gp_Trsf2d)

Returns:
	None

No detailed docstring for this function.") Transform;
		void Transform (const gp_Trsf2d  T);
		%feature("autodoc", "Args:
	T(gp_Trsf2d)

Returns:
	gp_Ax22d

Transforms an axis placement with a Trsf.  
 The 'Location' point, the 'XDirection' and the  
 'YDirection' are transformed with T.  The resulting  
 main 'Direction' of <self> is the cross product between  
 the 'XDirection' and the 'YDirection' after transformation.") Transformed;
		gp_Ax22d Transformed (const gp_Trsf2d  T);
		%feature("autodoc", "Args:
	V(gp_Vec2d)

Returns:
	None

No detailed docstring for this function.") Translate;
		void Translate (const gp_Vec2d  V);
		%feature("autodoc", "Args:
	V(gp_Vec2d)

Returns:
	gp_Ax22d

Translates an axis plaxement in the direction of the vector  
 <V>. The magnitude of the translation is the vector's magnitude.") Translated;
		gp_Ax22d Translated (const gp_Vec2d  V);
		%feature("autodoc", "Args:
	P1(gp_Pnt2d)
	P2(gp_Pnt2d)

Returns:
	None

No detailed docstring for this function.") Translate;
		void Translate (const gp_Pnt2d  P1,const gp_Pnt2d  P2);
		%feature("autodoc", "Args:
	P1(gp_Pnt2d)
	P2(gp_Pnt2d)

Returns:
	gp_Ax22d

Translates an axis placement from the point <P1> to the  
 point <P2>.") Translated;
		gp_Ax22d Translated (const gp_Pnt2d  P1,const gp_Pnt2d  P2);
		%feature("autodoc", "Args:
	None
Returns:
	gp_Pnt2d

No detailed docstring for this function.") _CSFDB_Getgp_Ax22dpoint;
		const gp_Pnt2d & _CSFDB_Getgp_Ax22dpoint ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Dir2d

No detailed docstring for this function.") _CSFDB_Getgp_Ax22dvydir;
		const gp_Dir2d & _CSFDB_Getgp_Ax22dvydir ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Dir2d

No detailed docstring for this function.") _CSFDB_Getgp_Ax22dvxdir;
		const gp_Dir2d & _CSFDB_Getgp_Ax22dvxdir ();
};


%feature("shadow") gp_Ax22d::~gp_Ax22d %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend gp_Ax22d {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor gp_Ax2d;
class gp_Ax2d {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

Creates an axis object representing X axis of  
           the reference co-ordinate system.") gp_Ax2d;
		 gp_Ax2d ();
		%feature("autodoc", "Args:
	P(gp_Pnt2d)
	V(gp_Dir2d)

Returns:
	None

Creates an Ax2d. <P> is the 'Location' point of  
 the axis placement and V is the 'Direction' of  
 the axis placement.") gp_Ax2d;
		 gp_Ax2d (const gp_Pnt2d  P,const gp_Dir2d  V);
		%feature("autodoc", "Args:
	Locat(gp_Pnt2d)

Returns:
	None

Changes the 'Location' point (origin) of <self>.") SetLocation;
		void SetLocation (const gp_Pnt2d  Locat);
		%feature("autodoc", "Args:
	V(gp_Dir2d)

Returns:
	None

Changes the direction of <self>.") SetDirection;
		void SetDirection (const gp_Dir2d  V);
		%feature("autodoc", "Args:
	None
Returns:
	gp_Pnt2d

Returns the origin of <self>.") Location;
		const gp_Pnt2d & Location ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Dir2d

Returns the direction of <self>.") Direction;
		const gp_Dir2d & Direction ();
		%feature("autodoc", "Args:
	Other(gp_Ax2d)
	AngularTolerance(Standard_Real)
	LinearTolerance(Standard_Real)

Returns:
	Standard_Boolean

Returns True if  :  
 . the angle between <self> and <Other> is lower or equal  
   to <AngularTolerance> and  
 . the distance between <self>.Location() and <Other> is lower  
   or equal to <LinearTolerance> and  
 . the distance between <Other>.Location() and <self> is lower  
   or equal to LinearTolerance.") IsCoaxial;
		Standard_Boolean IsCoaxial (const gp_Ax2d  Other,const Standard_Real AngularTolerance,const Standard_Real LinearTolerance);
		%feature("autodoc", "Args:
	Other(gp_Ax2d)
	AngularTolerance(Standard_Real)

Returns:
	Standard_Boolean

Returns true if this axis and the axis Other are normal to  
each other. That is, if the angle between the two axes is equal to Pi/2 or -Pi/2.  
Note: the tolerance criterion is given by AngularTolerance.") IsNormal;
		Standard_Boolean IsNormal (const gp_Ax2d  Other,const Standard_Real AngularTolerance);
		%feature("autodoc", "Args:
	Other(gp_Ax2d)
	AngularTolerance(Standard_Real)

Returns:
	Standard_Boolean

Returns true if this axis and the axis Other are parallel,  
and have opposite orientations. That is, if the angle  
between the two axes is equal to Pi or -Pi.  
Note: the tolerance criterion is given by AngularTolerance.") IsOpposite;
		Standard_Boolean IsOpposite (const gp_Ax2d  Other,const Standard_Real AngularTolerance);
		%feature("autodoc", "Args:
	Other(gp_Ax2d)
	AngularTolerance(Standard_Real)

Returns:
	Standard_Boolean

Returns true if this axis and the axis Other are parallel,  
and have either the same or opposite orientations. That  
is, if the angle between the two axes is equal to 0, Pi or -Pi.  
Note: the tolerance criterion is given by AngularTolerance.") IsParallel;
		Standard_Boolean IsParallel (const gp_Ax2d  Other,const Standard_Real AngularTolerance);
		%feature("autodoc", "Args:
	Other(gp_Ax2d)

Returns:
	Standard_Real

Computes the angle, in radians, between this axis and  
the axis Other. The value of the angle is between -Pi and Pi.") Angle;
		Standard_Real Angle (const gp_Ax2d  Other);
		%feature("autodoc", "Args:
	None
Returns:
	None

Reverses the direction of <self> and assigns the result to this axis.") Reverse;
		void Reverse ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Ax2d

Computes a new axis placement with a direction opposite to  
 the direction of <self>.") Reversed;
		gp_Ax2d Reversed ();
		%feature("autodoc", "Args:
	P(gp_Pnt2d)

Returns:
	None

No detailed docstring for this function.") Mirror;
		void Mirror (const gp_Pnt2d  P);
		%feature("autodoc", "Args:
	P(gp_Pnt2d)

Returns:
	gp_Ax2d

Performs the symmetrical transformation of an axis  
 placement with respect to the point P which is the  
 center of the symmetry.") Mirrored;
		gp_Ax2d Mirrored (const gp_Pnt2d  P);
		%feature("autodoc", "Args:
	A(gp_Ax2d)

Returns:
	None

No detailed docstring for this function.") Mirror;
		void Mirror (const gp_Ax2d  A);
		%feature("autodoc", "Args:
	A(gp_Ax2d)

Returns:
	gp_Ax2d

Performs the symmetrical transformation of an axis  
 placement with respect to an axis placement which  
 is the axis of the symmetry.") Mirrored;
		gp_Ax2d Mirrored (const gp_Ax2d  A);
		%feature("autodoc", "Args:
	P(gp_Pnt2d)
	Ang(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Rotate;
		void Rotate (const gp_Pnt2d  P,const Standard_Real Ang);
		%feature("autodoc", "Args:
	P(gp_Pnt2d)
	Ang(Standard_Real)

Returns:
	gp_Ax2d

Rotates an axis placement. <P> is the center of the  
 rotation . Ang is the angular value of the rotation  
 in radians.") Rotated;
		gp_Ax2d Rotated (const gp_Pnt2d  P,const Standard_Real Ang);
		%feature("autodoc", "Args:
	P(gp_Pnt2d)
	S(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Scale;
		void Scale (const gp_Pnt2d  P,const Standard_Real S);
		%feature("autodoc", "Args:
	P(gp_Pnt2d)
	S(Standard_Real)

Returns:
	gp_Ax2d

Applies a scaling transformation on the axis placement.  
 The 'Location' point of the axisplacement is modified.  
 The 'Direction' is reversed if the scale is negative.") Scaled;
		gp_Ax2d Scaled (const gp_Pnt2d  P,const Standard_Real S);
		%feature("autodoc", "Args:
	T(gp_Trsf2d)

Returns:
	None

No detailed docstring for this function.") Transform;
		void Transform (const gp_Trsf2d  T);
		%feature("autodoc", "Args:
	T(gp_Trsf2d)

Returns:
	gp_Ax2d

Transforms an axis placement with a Trsf.") Transformed;
		gp_Ax2d Transformed (const gp_Trsf2d  T);
		%feature("autodoc", "Args:
	V(gp_Vec2d)

Returns:
	None

No detailed docstring for this function.") Translate;
		void Translate (const gp_Vec2d  V);
		%feature("autodoc", "Args:
	V(gp_Vec2d)

Returns:
	gp_Ax2d

Translates an axis placement in the direction of the vector  
 <V>. The magnitude of the translation is the vector's magnitude.") Translated;
		gp_Ax2d Translated (const gp_Vec2d  V);
		%feature("autodoc", "Args:
	P1(gp_Pnt2d)
	P2(gp_Pnt2d)

Returns:
	None

No detailed docstring for this function.") Translate;
		void Translate (const gp_Pnt2d  P1,const gp_Pnt2d  P2);
		%feature("autodoc", "Args:
	P1(gp_Pnt2d)
	P2(gp_Pnt2d)

Returns:
	gp_Ax2d

Translates an axis placement from the point <P1> to the  
 point <P2>.") Translated;
		gp_Ax2d Translated (const gp_Pnt2d  P1,const gp_Pnt2d  P2);
		%feature("autodoc", "Args:
	None
Returns:
	gp_Pnt2d

No detailed docstring for this function.") _CSFDB_Getgp_Ax2dloc;
		const gp_Pnt2d & _CSFDB_Getgp_Ax2dloc ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Dir2d

No detailed docstring for this function.") _CSFDB_Getgp_Ax2dvdir;
		const gp_Dir2d & _CSFDB_Getgp_Ax2dvdir ();
};


%feature("shadow") gp_Ax2d::~gp_Ax2d %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend gp_Ax2d {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor gp_Ax3;
class gp_Ax3 {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

Creates an object corresponding to the reference  
           coordinate system (OXYZ).") gp_Ax3;
		 gp_Ax3 ();
		%feature("autodoc", "Args:
	A(gp_Ax2)

Returns:
	None

Creates  a  coordinate  system from a right-handed  
         coordinate system.") gp_Ax3;
		 gp_Ax3 (const gp_Ax2  A);
		%feature("autodoc", "Args:
	P(gp_Pnt)
	N(gp_Dir)
	Vx(gp_Dir)

Returns:
	None

Creates a  right handed axis placement with the  
 'Location'  point  P  and  two  directions, N    gives the  
 'Direction' and Vx gives the 'XDirection'.  
 Raises ConstructionError if N and Vx are parallel (same or opposite orientation).") gp_Ax3;
		 gp_Ax3 (const gp_Pnt  P,const gp_Dir  N,const gp_Dir  Vx);
		%feature("autodoc", "Args:
	P(gp_Pnt)
	V(gp_Dir)

Returns:
	None

Creates an axis placement with the  'Location' point <P>  
 and the normal direction <V>.") gp_Ax3;
		 gp_Ax3 (const gp_Pnt  P,const gp_Dir  V);
		%feature("autodoc", "Args:
	None
Returns:
	None

Reverses the X direction of <self>.") XReverse;
		void XReverse ();
		%feature("autodoc", "Args:
	None
Returns:
	None

Reverses the Y direction of <self>.") YReverse;
		void YReverse ();
		%feature("autodoc", "Args:
	None
Returns:
	None

Reverses the Z direction of <self>.") ZReverse;
		void ZReverse ();
		%feature("autodoc", "Args:
	A1(gp_Ax1)

Returns:
	None

Assigns the origin and 'main Direction' of the axis A1 to  
this coordinate system, then recomputes its 'X Direction' and 'Y Direction'.  
Note:  
-   The new 'X Direction' is computed as follows:  
new 'X Direction' = V1 ^(previous 'X Direction' ^ V)  
where V is the 'Direction' of A1.  
-   The orientation of this coordinate system  
  (right-handed or left-handed) is not modified.  
 Raises ConstructionError  if the 'Direction' of <A1> and the 'XDirection' of <self>  
 are parallel (same or opposite orientation) because it is  
 impossible to calculate the new 'XDirection' and the new  
 'YDirection'.") SetAxis;
		void SetAxis (const gp_Ax1  A1);
		%feature("autodoc", "Args:
	V(gp_Dir)

Returns:
	None

Changes the main direction of this coordinate system,  
then recomputes its 'X Direction' and 'Y Direction'.  
Note:  
-   The new 'X Direction' is computed as follows:  
new 'X Direction' = V ^ (previous 'X Direction' ^ V).  
-   The orientation of this coordinate system (left- or right-handed) is not modified.  
Raises ConstructionError if <V< and the previous 'XDirection' are parallel  
 because it is impossible to calculate the new 'XDirection'  
 and the new 'YDirection'.") SetDirection;
		void SetDirection (const gp_Dir  V);
		%feature("autodoc", "Args:
	P(gp_Pnt)

Returns:
	None

Changes the 'Location' point (origin) of <self>.") SetLocation;
		void SetLocation (const gp_Pnt  P);
		%feature("autodoc", "Args:
	Vx(gp_Dir)

Returns:
	None

Changes the 'Xdirection' of <self>. The main direction  
 'Direction' is not modified, the 'Ydirection' is modified.  
 If <Vx> is not normal to the main direction then <XDirection>  
 is computed as follows XDirection = Direction ^ (Vx ^ Direction).  
Raises ConstructionError if <Vx> is parallel (same or opposite  
orientation) to the main direction of <self>") SetXDirection;
		void SetXDirection (const gp_Dir  Vx);
		%feature("autodoc", "Args:
	Vy(gp_Dir)

Returns:
	None

Changes the 'Ydirection' of <self>. The main direction is not  
 modified but the 'Xdirection' is changed.  
 If <Vy> is not normal to the main direction then 'YDirection'  
 is computed as  follows  
 YDirection = Direction ^ (<Vy> ^ Direction).  
Raises ConstructionError if <Vy> is parallel to the main direction of <self>") SetYDirection;
		void SetYDirection (const gp_Dir  Vy);
		%feature("autodoc", "Args:
	Other(gp_Ax3)

Returns:
	Standard_Real

Computes the angular value between the main direction of  
 <self> and the main direction of <Other>. Returns the angle  
 between 0 and PI in radians.") Angle;
		Standard_Real Angle (const gp_Ax3  Other);
		%feature("autodoc", "Args:
	None
Returns:
	gp_Ax1

Returns the main axis of <self>. It is the 'Location' point  
 and the main 'Direction'.") Axis;
		const gp_Ax1 & Axis ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Ax2

Computes a right-handed coordinate system with the  
same 'X Direction' and 'Y Direction' as those of this  
coordinate system, then recomputes the 'main Direction'.  
If this coordinate system is right-handed, the result  
returned is the same coordinate system. If this  
coordinate system is left-handed, the result is reversed.") Ax2;
		gp_Ax2 Ax2 ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Dir

Returns the main direction of <self>.") Direction;
		const gp_Dir & Direction ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Pnt

Returns the 'Location' point (origin) of <self>.") Location;
		const gp_Pnt & Location ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Dir

Returns the 'XDirection' of <self>.") XDirection;
		const gp_Dir & XDirection ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Dir

Returns the 'YDirection' of <self>.") YDirection;
		const gp_Dir & YDirection ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns  True if  the  coordinate  system is right-handed. i.e.  
         XDirection().Crossed(YDirection()).Dot(Direction()) > 0") Direct;
		Standard_Boolean Direct ();
		%feature("autodoc", "Args:
	Other(gp_Ax3)
	LinearTolerance(Standard_Real)
	AngularTolerance(Standard_Real)

Returns:
	Standard_Boolean

Returns True if  
 . the distance between the 'Location' point of <self> and  
   <Other> is lower or equal to LinearTolerance and  
 . the distance between the 'Location' point of <Other> and  
   <self> is lower or equal to LinearTolerance and  
 . the main direction of <self> and the main direction of  
   <Other> are parallel (same or opposite orientation).") IsCoplanar;
		Standard_Boolean IsCoplanar (const gp_Ax3  Other,const Standard_Real LinearTolerance,const Standard_Real AngularTolerance);
		%feature("autodoc", "Args:
	A1(gp_Ax1)
	LinearTolerance(Standard_Real)
	AngularTolerance(Standard_Real)

Returns:
	Standard_Boolean

Returns True if  
 . the distance between <self> and the 'Location' point of A1  
   is lower of equal to LinearTolerance and  
 . the distance between A1 and the 'Location' point of <self>  
   is lower or equal to LinearTolerance and  
 . the main direction of <self> and the direction of A1 are normal.") IsCoplanar;
		Standard_Boolean IsCoplanar (const gp_Ax1  A1,const Standard_Real LinearTolerance,const Standard_Real AngularTolerance);
		%feature("autodoc", "Args:
	P(gp_Pnt)

Returns:
	None

No detailed docstring for this function.") Mirror;
		void Mirror (const gp_Pnt  P);
		%feature("autodoc", "Args:
	P(gp_Pnt)

Returns:
	gp_Ax3

Performs the symmetrical transformation of an axis  
 placement with respect to the point P which is the  
 center of the symmetry.  
 Warnings :  
 The main direction of the axis placement is not changed.  
 The 'XDirection' and the 'YDirection' are reversed.  
 So the axis placement stay right handed.") Mirrored;
		gp_Ax3 Mirrored (const gp_Pnt  P);
		%feature("autodoc", "Args:
	A1(gp_Ax1)

Returns:
	None

No detailed docstring for this function.") Mirror;
		void Mirror (const gp_Ax1  A1);
		%feature("autodoc", "Args:
	A1(gp_Ax1)

Returns:
	gp_Ax3

Performs the symmetrical transformation of an axis  
 placement with respect to an axis placement which  
 is the axis of the symmetry.  
 The transformation is performed on the 'Location'  
 point, on the 'XDirection' and 'YDirection'.  
 The resulting main 'Direction' is the cross product between  
 the 'XDirection' and the 'YDirection' after transformation.") Mirrored;
		gp_Ax3 Mirrored (const gp_Ax1  A1);
		%feature("autodoc", "Args:
	A2(gp_Ax2)

Returns:
	None

No detailed docstring for this function.") Mirror;
		void Mirror (const gp_Ax2  A2);
		%feature("autodoc", "Args:
	A2(gp_Ax2)

Returns:
	gp_Ax3

Performs the symmetrical transformation of an axis  
 placement with respect to a plane.  
 The axis placement  <A2> locates the plane of the symmetry :  
 (Location, XDirection, YDirection).  
 The transformation is performed on the 'Location'  
 point, on the 'XDirection' and 'YDirection'.  
 The resulting main 'Direction' is the cross product between  
 the 'XDirection' and the 'YDirection' after transformation.") Mirrored;
		gp_Ax3 Mirrored (const gp_Ax2  A2);
		%feature("autodoc", "Args:
	A1(gp_Ax1)
	Ang(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Rotate;
		void Rotate (const gp_Ax1  A1,const Standard_Real Ang);
		%feature("autodoc", "Args:
	A1(gp_Ax1)
	Ang(Standard_Real)

Returns:
	gp_Ax3

Rotates an axis placement. <A1> is the axis of the  
 rotation . Ang is the angular value of the rotation  
 in radians.") Rotated;
		gp_Ax3 Rotated (const gp_Ax1  A1,const Standard_Real Ang);
		%feature("autodoc", "Args:
	P(gp_Pnt)
	S(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Scale;
		void Scale (const gp_Pnt  P,const Standard_Real S);
		%feature("autodoc", "Args:
	P(gp_Pnt)
	S(Standard_Real)

Returns:
	gp_Ax3

Applies a scaling transformation on the axis placement.  
 The 'Location' point of the axisplacement is modified.  
Warnings :  
 If the scale <S> is negative :  
  . the main direction of the axis placement is not changed.  
  . The 'XDirection' and the 'YDirection' are reversed.  
 So the axis placement stay right handed.") Scaled;
		gp_Ax3 Scaled (const gp_Pnt  P,const Standard_Real S);
		%feature("autodoc", "Args:
	T(gp_Trsf)

Returns:
	None

No detailed docstring for this function.") Transform;
		void Transform (const gp_Trsf  T);
		%feature("autodoc", "Args:
	T(gp_Trsf)

Returns:
	gp_Ax3

Transforms an axis placement with a Trsf.  
 The 'Location' point, the 'XDirection' and the  
 'YDirection' are transformed with T.  The resulting  
 main 'Direction' of <self> is the cross product between  
 the 'XDirection' and the 'YDirection' after transformation.") Transformed;
		gp_Ax3 Transformed (const gp_Trsf  T);
		%feature("autodoc", "Args:
	V(gp_Vec)

Returns:
	None

No detailed docstring for this function.") Translate;
		void Translate (const gp_Vec  V);
		%feature("autodoc", "Args:
	V(gp_Vec)

Returns:
	gp_Ax3

Translates an axis plaxement in the direction of the vector  
 <V>. The magnitude of the translation is the vector's magnitude.") Translated;
		gp_Ax3 Translated (const gp_Vec  V);
		%feature("autodoc", "Args:
	P1(gp_Pnt)
	P2(gp_Pnt)

Returns:
	None

No detailed docstring for this function.") Translate;
		void Translate (const gp_Pnt  P1,const gp_Pnt  P2);
		%feature("autodoc", "Args:
	P1(gp_Pnt)
	P2(gp_Pnt)

Returns:
	gp_Ax3

Translates an axis placement from the point <P1> to the  
 point <P2>.") Translated;
		gp_Ax3 Translated (const gp_Pnt  P1,const gp_Pnt  P2);
		%feature("autodoc", "Args:
	None
Returns:
	gp_Ax1

No detailed docstring for this function.") _CSFDB_Getgp_Ax3axis;
		const gp_Ax1 & _CSFDB_Getgp_Ax3axis ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Dir

No detailed docstring for this function.") _CSFDB_Getgp_Ax3vydir;
		const gp_Dir & _CSFDB_Getgp_Ax3vydir ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Dir

No detailed docstring for this function.") _CSFDB_Getgp_Ax3vxdir;
		const gp_Dir & _CSFDB_Getgp_Ax3vxdir ();
};


%feature("shadow") gp_Ax3::~gp_Ax3 %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend gp_Ax3 {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor gp_Circ;
class gp_Circ {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

Creates an indefinite circle.") gp_Circ;
		 gp_Circ ();
		%feature("autodoc", "Args:
	A2(gp_Ax2)
	Radius(Standard_Real)

Returns:
	None

A2 locates the circle and gives its orientation in 3D space.  
Warnings :  
 It is not forbidden to create a circle with Radius = 0.0  Raises ConstructionError if Radius < 0.0") gp_Circ;
		 gp_Circ (const gp_Ax2  A2,const Standard_Real Radius);
		%feature("autodoc", "Args:
	A1(gp_Ax1)

Returns:
	None

Changes the main axis of the circle. It is the axis  
 perpendicular to the plane of the circle.  
Raises ConstructionError if the direction of A1  
is parallel to the 'XAxis' of the circle.") SetAxis;
		void SetAxis (const gp_Ax1  A1);
		%feature("autodoc", "Args:
	P(gp_Pnt)

Returns:
	None

Changes the 'Location' point (center) of the circle.") SetLocation;
		void SetLocation (const gp_Pnt  P);
		%feature("autodoc", "Args:
	A2(gp_Ax2)

Returns:
	None

Changes the position of the circle.") SetPosition;
		void SetPosition (const gp_Ax2  A2);
		%feature("autodoc", "Args:
	Radius(Standard_Real)

Returns:
	None

Modifies the radius of this circle.  
Warning. This class does not prevent the creation of a circle where Radius is null.  
Exceptions  
Standard_ConstructionError if Radius is negative.") SetRadius;
		void SetRadius (const Standard_Real Radius);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

Computes the area of the circle.") Area;
		Standard_Real Area ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Ax1

Returns the main axis of the circle.  
 It is the axis perpendicular to the plane of the circle,  
 passing through the 'Location' point (center) of the circle.") Axis;
		const gp_Ax1 & Axis ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

Computes the circumference of the circle.") Length;
		Standard_Real Length ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Pnt

Returns the center of the circle. It is the  
 'Location' point of the local coordinate system  
 of the circle") Location;
		const gp_Pnt & Location ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Ax2

Returns the position of the circle.  
 It is the local coordinate system of the circle.") Position;
		const gp_Ax2 & Position ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

Returns the radius of this circle.") Radius;
		Standard_Real Radius ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Ax1

Returns the 'XAxis' of the circle.  
 This axis is perpendicular to the axis of the conic.  
 This axis and the 'Yaxis' define the plane of the conic.") XAxis;
		gp_Ax1 XAxis ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Ax1

Returns the 'YAxis' of the circle.  
 This axis and the 'Xaxis' define the plane of the conic.  
 The 'YAxis' is perpendicular to the 'Xaxis'.") YAxis;
		gp_Ax1 YAxis ();
		%feature("autodoc", "Args:
	P(gp_Pnt)

Returns:
	Standard_Real

Computes the minimum of distance between the point P and  
 any point on the circumference of the circle.") Distance;
		Standard_Real Distance (const gp_Pnt  P);
		%feature("autodoc", "Args:
	P(gp_Pnt)

Returns:
	Standard_Real

Computes the square distance between <self> and the point P.") SquareDistance;
		Standard_Real SquareDistance (const gp_Pnt  P);
		%feature("autodoc", "Args:
	P(gp_Pnt)
	LinearTolerance(Standard_Real)

Returns:
	Standard_Boolean

Returns True if the point P is on the circumference.  
 The distance between <self> and <P> must be lower or  
 equal to LinearTolerance.") Contains;
		Standard_Boolean Contains (const gp_Pnt  P,const Standard_Real LinearTolerance);
		%feature("autodoc", "Args:
	P(gp_Pnt)

Returns:
	None

No detailed docstring for this function.") Mirror;
		void Mirror (const gp_Pnt  P);
		%feature("autodoc", "Args:
	P(gp_Pnt)

Returns:
	gp_Circ

Performs the symmetrical transformation of a circle  
 with respect to the point P which is the center of the  
 symmetry.") Mirrored;
		gp_Circ Mirrored (const gp_Pnt  P);
		%feature("autodoc", "Args:
	A1(gp_Ax1)

Returns:
	None

No detailed docstring for this function.") Mirror;
		void Mirror (const gp_Ax1  A1);
		%feature("autodoc", "Args:
	A1(gp_Ax1)

Returns:
	gp_Circ

Performs the symmetrical transformation of a circle with  
 respect to an axis placement which is the axis of the  
 symmetry.") Mirrored;
		gp_Circ Mirrored (const gp_Ax1  A1);
		%feature("autodoc", "Args:
	A2(gp_Ax2)

Returns:
	None

No detailed docstring for this function.") Mirror;
		void Mirror (const gp_Ax2  A2);
		%feature("autodoc", "Args:
	A2(gp_Ax2)

Returns:
	gp_Circ

Performs the symmetrical transformation of a circle with respect  
 to a plane. The axis placement A2 locates the plane of the  
 of the symmetry : (Location, XDirection, YDirection).") Mirrored;
		gp_Circ Mirrored (const gp_Ax2  A2);
		%feature("autodoc", "Args:
	A1(gp_Ax1)
	Ang(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Rotate;
		void Rotate (const gp_Ax1  A1,const Standard_Real Ang);
		%feature("autodoc", "Args:
	A1(gp_Ax1)
	Ang(Standard_Real)

Returns:
	gp_Circ

Rotates a circle. A1 is the axis of the rotation.  
 Ang is the angular value of the rotation in radians.") Rotated;
		gp_Circ Rotated (const gp_Ax1  A1,const Standard_Real Ang);
		%feature("autodoc", "Args:
	P(gp_Pnt)
	S(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Scale;
		void Scale (const gp_Pnt  P,const Standard_Real S);
		%feature("autodoc", "Args:
	P(gp_Pnt)
	S(Standard_Real)

Returns:
	gp_Circ

Scales a circle. S is the scaling value.  
 Warnings :  
 If S is negative the radius stay positive but  
 the 'XAxis' and the 'YAxis' are  reversed as for  
 an ellipse.") Scaled;
		gp_Circ Scaled (const gp_Pnt  P,const Standard_Real S);
		%feature("autodoc", "Args:
	T(gp_Trsf)

Returns:
	None

No detailed docstring for this function.") Transform;
		void Transform (const gp_Trsf  T);
		%feature("autodoc", "Args:
	T(gp_Trsf)

Returns:
	gp_Circ

Transforms a circle with the transformation T from class Trsf.") Transformed;
		gp_Circ Transformed (const gp_Trsf  T);
		%feature("autodoc", "Args:
	V(gp_Vec)

Returns:
	None

No detailed docstring for this function.") Translate;
		void Translate (const gp_Vec  V);
		%feature("autodoc", "Args:
	V(gp_Vec)

Returns:
	gp_Circ

Translates a circle in the direction of the vector V.  
 The magnitude of the translation is the vector's magnitude.") Translated;
		gp_Circ Translated (const gp_Vec  V);
		%feature("autodoc", "Args:
	P1(gp_Pnt)
	P2(gp_Pnt)

Returns:
	None

No detailed docstring for this function.") Translate;
		void Translate (const gp_Pnt  P1,const gp_Pnt  P2);
		%feature("autodoc", "Args:
	P1(gp_Pnt)
	P2(gp_Pnt)

Returns:
	gp_Circ

Translates a circle from the point P1 to the point P2.") Translated;
		gp_Circ Translated (const gp_Pnt  P1,const gp_Pnt  P2);
		%feature("autodoc", "Args:
	None
Returns:
	gp_Ax2

No detailed docstring for this function.") _CSFDB_Getgp_Circpos;
		const gp_Ax2 & _CSFDB_Getgp_Circpos ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") _CSFDB_Getgp_Circradius;
		Standard_Real _CSFDB_Getgp_Circradius ();
		%feature("autodoc", "Args:
	p(Standard_Real)

Returns:
	None

No detailed docstring for this function.") _CSFDB_Setgp_Circradius;
		void _CSFDB_Setgp_Circradius (const Standard_Real p);
};


%feature("shadow") gp_Circ::~gp_Circ %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend gp_Circ {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor gp_Circ2d;
class gp_Circ2d {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

creates an indefinite circle.") gp_Circ2d;
		 gp_Circ2d ();
		%feature("autodoc", "Args:
	XAxis(gp_Ax2d)
	Radius(Standard_Real)
	Sense(Standard_Boolean)=Standard_True

Returns:
	None

The location point of XAxis is the center of the circle.  
 Warnings :  
 It is not forbidden to create a circle with Radius = 0.0   Raises ConstructionError if Radius < 0.0.  Raised if Radius < 0.0.") gp_Circ2d;
		 gp_Circ2d (const gp_Ax2d  XAxis,const Standard_Real Radius,const Standard_Boolean Sense = Standard_True);
		%feature("autodoc", "Args:
	Axis(gp_Ax22d)
	Radius(Standard_Real)

Returns:
	None

Axis defines the Xaxis and Yaxis of the circle which defines  
 the origin and the sense of parametrization.  
 The location point of Axis is the center of the circle.  
 Warnings :  
 It is not forbidden to create a circle with Radius = 0.0 Raises ConstructionError if Radius < 0.0.  Raised if Radius < 0.0.") gp_Circ2d;
		 gp_Circ2d (const gp_Ax22d  Axis,const Standard_Real Radius);
		%feature("autodoc", "Args:
	P(gp_Pnt2d)

Returns:
	None

Changes the location point (center) of the circle.") SetLocation;
		void SetLocation (const gp_Pnt2d  P);
		%feature("autodoc", "Args:
	A(gp_Ax2d)

Returns:
	None

Changes the X axis of the circle.") SetXAxis;
		void SetXAxis (const gp_Ax2d  A);
		%feature("autodoc", "Args:
	A(gp_Ax22d)

Returns:
	None

Changes the X axis of the circle.") SetAxis;
		void SetAxis (const gp_Ax22d  A);
		%feature("autodoc", "Args:
	A(gp_Ax2d)

Returns:
	None

Changes the Y axis of the circle.") SetYAxis;
		void SetYAxis (const gp_Ax2d  A);
		%feature("autodoc", "Args:
	Radius(Standard_Real)

Returns:
	None

Modifies the radius of this circle.  
This class does not prevent the creation of a circle where  
Radius is null.  
Exceptions  
Standard_ConstructionError if Radius is negative.") SetRadius;
		void SetRadius (const Standard_Real Radius);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

Computes the area of the circle.") Area;
		Standard_Real Area ();
		%feature("autodoc", "Args:
	A(Standard_Real)
	B(Standard_Real)
	C(Standard_Real)
	D(Standard_Real)
	E(Standard_Real)
	F(Standard_Real)

Returns:
	None

Returns the normalized coefficients from the implicit equation  
 of the circle :  
 A * (X**2) + B * (Y**2) + 2*C*(X*Y) + 2*D*X + 2*E*Y + F = 0.0") Coefficients;
		void Coefficients (Standard_Real  A,Standard_Real  B,Standard_Real  C,Standard_Real  D,Standard_Real  E,Standard_Real  F);
		%feature("autodoc", "Args:
	P(gp_Pnt2d)
	LinearTolerance(Standard_Real)

Returns:
	Standard_Boolean

Does <self> contain P ?  
 Returns True if the distance between P and any point on  
 the circumference of the circle is lower of equal to  
 <LinearTolerance>.") Contains;
		Standard_Boolean Contains (const gp_Pnt2d  P,const Standard_Real LinearTolerance);
		%feature("autodoc", "Args:
	P(gp_Pnt2d)

Returns:
	Standard_Real

Computes the minimum of distance between the point P and any  
 point on the circumference of the circle.") Distance;
		Standard_Real Distance (const gp_Pnt2d  P);
		%feature("autodoc", "Args:
	P(gp_Pnt2d)

Returns:
	Standard_Real

Computes the square distance between <self> and the point P.") SquareDistance;
		Standard_Real SquareDistance (const gp_Pnt2d  P);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

computes the circumference of the circle.") Length;
		Standard_Real Length ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Pnt2d

Returns the location point (center) of the circle.") Location;
		const gp_Pnt2d & Location ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

Returns the radius value of the circle.") Radius;
		Standard_Real Radius ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Ax22d

returns the position of the circle.") Axis;
		const gp_Ax22d & Axis ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Ax22d

returns the position of the circle. Idem Axis(me).") Position;
		const gp_Ax22d & Position ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Ax2d

returns the X axis of the circle.") XAxis;
		gp_Ax2d XAxis ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Ax2d

Returns the Y axis of the circle.  Reverses the direction of the circle.") YAxis;
		gp_Ax2d YAxis ();
		%feature("autodoc", "Args:
	None
Returns:
	None

Reverses the orientation of the local coordinate system  
of this circle (the 'Y Direction' is reversed) and therefore  
changes the implicit orientation of this circle.  
  Reverse assigns the result to this circle,") Reverse;
		void Reverse ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Circ2d

Reverses the orientation of the local coordinate system  
of this circle (the 'Y Direction' is reversed) and therefore  
changes the implicit orientation of this circle.  
  Reversed creates a new circle.") Reversed;
		gp_Circ2d Reversed ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns true if the local coordinate system is direct  
and false in the other case.") IsDirect;
		Standard_Boolean IsDirect ();
		%feature("autodoc", "Args:
	P(gp_Pnt2d)

Returns:
	None

No detailed docstring for this function.") Mirror;
		void Mirror (const gp_Pnt2d  P);
		%feature("autodoc", "Args:
	P(gp_Pnt2d)

Returns:
	gp_Circ2d

Performs the symmetrical transformation of a circle with respect  
 to the point P which is the center of the symmetry") Mirrored;
		gp_Circ2d Mirrored (const gp_Pnt2d  P);
		%feature("autodoc", "Args:
	A(gp_Ax2d)

Returns:
	None

No detailed docstring for this function.") Mirror;
		void Mirror (const gp_Ax2d  A);
		%feature("autodoc", "Args:
	A(gp_Ax2d)

Returns:
	gp_Circ2d

Performs the symmetrical transformation of a circle with respect  
 to an axis placement which is the axis of the symmetry.") Mirrored;
		gp_Circ2d Mirrored (const gp_Ax2d  A);
		%feature("autodoc", "Args:
	P(gp_Pnt2d)
	Ang(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Rotate;
		void Rotate (const gp_Pnt2d  P,const Standard_Real Ang);
		%feature("autodoc", "Args:
	P(gp_Pnt2d)
	Ang(Standard_Real)

Returns:
	gp_Circ2d

Rotates a circle. P is the center of the rotation.  
 Ang is the angular value of the rotation in radians.") Rotated;
		gp_Circ2d Rotated (const gp_Pnt2d  P,const Standard_Real Ang);
		%feature("autodoc", "Args:
	P(gp_Pnt2d)
	S(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Scale;
		void Scale (const gp_Pnt2d  P,const Standard_Real S);
		%feature("autodoc", "Args:
	P(gp_Pnt2d)
	S(Standard_Real)

Returns:
	gp_Circ2d

Scales a circle. S is the scaling value.  
Warnings :  
 If S is negative the radius stay positive but  
 the 'XAxis' and the 'YAxis' are  reversed as for  
 an ellipse.") Scaled;
		gp_Circ2d Scaled (const gp_Pnt2d  P,const Standard_Real S);
		%feature("autodoc", "Args:
	T(gp_Trsf2d)

Returns:
	None

No detailed docstring for this function.") Transform;
		void Transform (const gp_Trsf2d  T);
		%feature("autodoc", "Args:
	T(gp_Trsf2d)

Returns:
	gp_Circ2d

Transforms a circle with the transformation T from class Trsf2d.") Transformed;
		gp_Circ2d Transformed (const gp_Trsf2d  T);
		%feature("autodoc", "Args:
	V(gp_Vec2d)

Returns:
	None

No detailed docstring for this function.") Translate;
		void Translate (const gp_Vec2d  V);
		%feature("autodoc", "Args:
	V(gp_Vec2d)

Returns:
	gp_Circ2d

Translates a circle in the direction of the vector V.  
 The magnitude of the translation is the vector's magnitude.") Translated;
		gp_Circ2d Translated (const gp_Vec2d  V);
		%feature("autodoc", "Args:
	P1(gp_Pnt2d)
	P2(gp_Pnt2d)

Returns:
	None

No detailed docstring for this function.") Translate;
		void Translate (const gp_Pnt2d  P1,const gp_Pnt2d  P2);
		%feature("autodoc", "Args:
	P1(gp_Pnt2d)
	P2(gp_Pnt2d)

Returns:
	gp_Circ2d

Translates a circle from the point P1 to the point P2.") Translated;
		gp_Circ2d Translated (const gp_Pnt2d  P1,const gp_Pnt2d  P2);
		%feature("autodoc", "Args:
	None
Returns:
	gp_Ax22d

No detailed docstring for this function.") _CSFDB_Getgp_Circ2dpos;
		const gp_Ax22d & _CSFDB_Getgp_Circ2dpos ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") _CSFDB_Getgp_Circ2dradius;
		Standard_Real _CSFDB_Getgp_Circ2dradius ();
		%feature("autodoc", "Args:
	p(Standard_Real)

Returns:
	None

No detailed docstring for this function.") _CSFDB_Setgp_Circ2dradius;
		void _CSFDB_Setgp_Circ2dradius (const Standard_Real p);
};


%feature("shadow") gp_Circ2d::~gp_Circ2d %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend gp_Circ2d {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor gp_Cone;
class gp_Cone {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

Creates an indefinite Cone.") gp_Cone;
		 gp_Cone ();
		%feature("autodoc", "Args:
	A3(gp_Ax3)
	Ang(Standard_Real)
	Radius(Standard_Real)

Returns:
	None

Creates an infinite conical surface. A3 locates the cone  
 in the space and defines the reference plane of the surface.  
 Ang is the conical surface semi-angle between 0 and PI/2 radians.  
 Radius is the radius of the circle in the reference plane of  
 the cone.  
Raises ConstructionError  
 . if Radius is lower than 0.0  
 . Ang < Resolution from gp  or Ang >= (PI/2) - Resolution.") gp_Cone;
		 gp_Cone (const gp_Ax3  A3,const Standard_Real Ang,const Standard_Real Radius);
		%feature("autodoc", "Args:
	A1(gp_Ax1)

Returns:
	None

Changes the symmetry axis of the cone.  Raises ConstructionError  
 the direction of A1 is parallel to the 'XDirection'  
 of the coordinate system of the cone.") SetAxis;
		void SetAxis (const gp_Ax1  A1);
		%feature("autodoc", "Args:
	Loc(gp_Pnt)

Returns:
	None

Changes the location of the cone.") SetLocation;
		void SetLocation (const gp_Pnt  Loc);
		%feature("autodoc", "Args:
	A3(gp_Ax3)

Returns:
	None

Changes the local coordinate system of the cone.  
 This coordinate system defines the reference plane of the cone.") SetPosition;
		void SetPosition (const gp_Ax3  A3);
		%feature("autodoc", "Args:
	R(Standard_Real)

Returns:
	None

Changes the radius of the cone in the reference plane of  
 the cone.  Raised if R < 0.0") SetRadius;
		void SetRadius (const Standard_Real R);
		%feature("autodoc", "Args:
	Ang(Standard_Real)

Returns:
	None

Changes the semi-angle of the cone.  
 Ang is the conical surface semi-angle  ]0,PI/2[.  
   Raises ConstructionError if Ang < Resolution from gp or Ang >= PI/2 - Resolution") SetSemiAngle;
		void SetSemiAngle (const Standard_Real Ang);
		%feature("autodoc", "Args:
	None
Returns:
	gp_Pnt

Computes the cone's top. The Apex of the cone is on the  
 negative side of the symmetry axis of the cone.") Apex;
		gp_Pnt Apex ();
		%feature("autodoc", "Args:
	None
Returns:
	None

Reverses the   U   parametrization of   the  cone  
         reversing the YAxis.") UReverse;
		void UReverse ();
		%feature("autodoc", "Args:
	None
Returns:
	None

Reverses the   V   parametrization of   the  cone  reversing the ZAxis.") VReverse;
		void VReverse ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns true if the local coordinate system of this cone is right-handed.") Direct;
		Standard_Boolean Direct ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Ax1

returns the symmetry axis of the cone.") Axis;
		const gp_Ax1 & Axis ();
		%feature("autodoc", "Args:
	A1(Standard_Real)
	A2(Standard_Real)
	A3(Standard_Real)
	B1(Standard_Real)
	B2(Standard_Real)
	B3(Standard_Real)
	C1(Standard_Real)
	C2(Standard_Real)
	C3(Standard_Real)
	D(Standard_Real)

Returns:
	None

Computes the coefficients of the implicit equation of the quadric  
 in the absolute cartesian coordinates system :  
A1.X**2 + A2.Y**2 + A3.Z**2 + 2.(B1.X.Y + B2.X.Z + B3.Y.Z) +  
2.(C1.X + C2.Y + C3.Z) + D = 0.0") Coefficients;
		void Coefficients (Standard_Real  A1,Standard_Real  A2,Standard_Real  A3,Standard_Real  B1,Standard_Real  B2,Standard_Real  B3,Standard_Real  C1,Standard_Real  C2,Standard_Real  C3,Standard_Real  D);
		%feature("autodoc", "Args:
	None
Returns:
	gp_Pnt

returns the 'Location' point of the cone.") Location;
		const gp_Pnt & Location ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Ax3

Returns the local coordinates system of the cone.") Position;
		const gp_Ax3 & Position ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

Returns the radius of the cone in the reference plane.") RefRadius;
		Standard_Real RefRadius ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

Returns the half-angle at the apex of this cone.") SemiAngle;
		Standard_Real SemiAngle ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Ax1

Returns the XAxis of the reference plane.") XAxis;
		gp_Ax1 XAxis ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Ax1

Returns the YAxis of the reference plane.") YAxis;
		gp_Ax1 YAxis ();
		%feature("autodoc", "Args:
	P(gp_Pnt)

Returns:
	None

No detailed docstring for this function.") Mirror;
		void Mirror (const gp_Pnt  P);
		%feature("autodoc", "Args:
	P(gp_Pnt)

Returns:
	gp_Cone

Performs the symmetrical transformation of a cone  
 with respect to the point P which is the center of the  
 symmetry.") Mirrored;
		gp_Cone Mirrored (const gp_Pnt  P);
		%feature("autodoc", "Args:
	A1(gp_Ax1)

Returns:
	None

No detailed docstring for this function.") Mirror;
		void Mirror (const gp_Ax1  A1);
		%feature("autodoc", "Args:
	A1(gp_Ax1)

Returns:
	gp_Cone

Performs the symmetrical transformation of a cone with  
 respect to an axis placement which is the axis of the  
 symmetry.") Mirrored;
		gp_Cone Mirrored (const gp_Ax1  A1);
		%feature("autodoc", "Args:
	A2(gp_Ax2)

Returns:
	None

No detailed docstring for this function.") Mirror;
		void Mirror (const gp_Ax2  A2);
		%feature("autodoc", "Args:
	A2(gp_Ax2)

Returns:
	gp_Cone

Performs the symmetrical transformation of a cone with respect  
 to a plane. The axis placement A2 locates the plane of the  
 of the symmetry : (Location, XDirection, YDirection).") Mirrored;
		gp_Cone Mirrored (const gp_Ax2  A2);
		%feature("autodoc", "Args:
	A1(gp_Ax1)
	Ang(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Rotate;
		void Rotate (const gp_Ax1  A1,const Standard_Real Ang);
		%feature("autodoc", "Args:
	A1(gp_Ax1)
	Ang(Standard_Real)

Returns:
	gp_Cone

Rotates a cone. A1 is the axis of the rotation.  
 Ang is the angular value of the rotation in radians.") Rotated;
		gp_Cone Rotated (const gp_Ax1  A1,const Standard_Real Ang);
		%feature("autodoc", "Args:
	P(gp_Pnt)
	S(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Scale;
		void Scale (const gp_Pnt  P,const Standard_Real S);
		%feature("autodoc", "Args:
	P(gp_Pnt)
	S(Standard_Real)

Returns:
	gp_Cone

Scales a cone. S is the scaling value.  
 The absolute value of S is used to scale the cone") Scaled;
		gp_Cone Scaled (const gp_Pnt  P,const Standard_Real S);
		%feature("autodoc", "Args:
	T(gp_Trsf)

Returns:
	None

No detailed docstring for this function.") Transform;
		void Transform (const gp_Trsf  T);
		%feature("autodoc", "Args:
	T(gp_Trsf)

Returns:
	gp_Cone

Transforms a cone with the transformation T from class Trsf.") Transformed;
		gp_Cone Transformed (const gp_Trsf  T);
		%feature("autodoc", "Args:
	V(gp_Vec)

Returns:
	None

No detailed docstring for this function.") Translate;
		void Translate (const gp_Vec  V);
		%feature("autodoc", "Args:
	V(gp_Vec)

Returns:
	gp_Cone

Translates a cone in the direction of the vector V.  
 The magnitude of the translation is the vector's magnitude.") Translated;
		gp_Cone Translated (const gp_Vec  V);
		%feature("autodoc", "Args:
	P1(gp_Pnt)
	P2(gp_Pnt)

Returns:
	None

No detailed docstring for this function.") Translate;
		void Translate (const gp_Pnt  P1,const gp_Pnt  P2);
		%feature("autodoc", "Args:
	P1(gp_Pnt)
	P2(gp_Pnt)

Returns:
	gp_Cone

Translates a cone from the point P1 to the point P2.") Translated;
		gp_Cone Translated (const gp_Pnt  P1,const gp_Pnt  P2);
		%feature("autodoc", "Args:
	None
Returns:
	gp_Ax3

No detailed docstring for this function.") _CSFDB_Getgp_Conepos;
		const gp_Ax3 & _CSFDB_Getgp_Conepos ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") _CSFDB_Getgp_Coneradius;
		Standard_Real _CSFDB_Getgp_Coneradius ();
		%feature("autodoc", "Args:
	p(Standard_Real)

Returns:
	None

No detailed docstring for this function.") _CSFDB_Setgp_Coneradius;
		void _CSFDB_Setgp_Coneradius (const Standard_Real p);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") _CSFDB_Getgp_ConesemiAngle;
		Standard_Real _CSFDB_Getgp_ConesemiAngle ();
		%feature("autodoc", "Args:
	p(Standard_Real)

Returns:
	None

No detailed docstring for this function.") _CSFDB_Setgp_ConesemiAngle;
		void _CSFDB_Setgp_ConesemiAngle (const Standard_Real p);
};


%feature("shadow") gp_Cone::~gp_Cone %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend gp_Cone {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor gp_Cylinder;
class gp_Cylinder {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

Creates a indefinite cylinder.") gp_Cylinder;
		 gp_Cylinder ();
		%feature("autodoc", "Args:
	A3(gp_Ax3)
	Radius(Standard_Real)

Returns:
	None

Creates a cylinder of radius Radius, whose axis is the 'main  
 Axis' of A3. A3 is the local coordinate system of the cylinder.   Raises ConstructionErrord if R < 0.0") gp_Cylinder;
		 gp_Cylinder (const gp_Ax3  A3,const Standard_Real Radius);
		%feature("autodoc", "Args:
	A1(gp_Ax1)

Returns:
	None

Changes the symmetry axis of the cylinder. Raises ConstructionError if the direction of A1 is parallel to the 'XDirection'  
 of the coordinate system of the cylinder.") SetAxis;
		void SetAxis (const gp_Ax1  A1);
		%feature("autodoc", "Args:
	Loc(gp_Pnt)

Returns:
	None

Changes the location of the surface.") SetLocation;
		void SetLocation (const gp_Pnt  Loc);
		%feature("autodoc", "Args:
	A3(gp_Ax3)

Returns:
	None

Change the local coordinate system of the surface.") SetPosition;
		void SetPosition (const gp_Ax3  A3);
		%feature("autodoc", "Args:
	R(Standard_Real)

Returns:
	None

Modifies the radius of this cylinder.  
Exceptions  
Standard_ConstructionError if R is negative.") SetRadius;
		void SetRadius (const Standard_Real R);
		%feature("autodoc", "Args:
	None
Returns:
	None

Reverses the   U   parametrization of   the cylinder  
         reversing the YAxis.") UReverse;
		void UReverse ();
		%feature("autodoc", "Args:
	None
Returns:
	None

Reverses the   V   parametrization of   the  plane  
         reversing the Axis.") VReverse;
		void VReverse ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns true if the local coordinate system of this cylinder is right-handed.") Direct;
		Standard_Boolean Direct ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Ax1

Returns the symmetry axis of the cylinder.") Axis;
		const gp_Ax1 & Axis ();
		%feature("autodoc", "Args:
	A1(Standard_Real)
	A2(Standard_Real)
	A3(Standard_Real)
	B1(Standard_Real)
	B2(Standard_Real)
	B3(Standard_Real)
	C1(Standard_Real)
	C2(Standard_Real)
	C3(Standard_Real)
	D(Standard_Real)

Returns:
	None

Computes the coefficients of the implicit equation of the quadric  
 in the absolute cartesian coordinate system :  
 A1.X**2 + A2.Y**2 + A3.Z**2 + 2.(B1.X.Y + B2.X.Z + B3.Y.Z) +  
 2.(C1.X + C2.Y + C3.Z) + D = 0.0") Coefficients;
		void Coefficients (Standard_Real  A1,Standard_Real  A2,Standard_Real  A3,Standard_Real  B1,Standard_Real  B2,Standard_Real  B3,Standard_Real  C1,Standard_Real  C2,Standard_Real  C3,Standard_Real  D);
		%feature("autodoc", "Args:
	None
Returns:
	gp_Pnt

Returns the 'Location' point of the cylinder.") Location;
		const gp_Pnt & Location ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Ax3

Returns the local coordinate system of the cylinder.") Position;
		const gp_Ax3 & Position ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

Returns the radius of the cylinder.") Radius;
		Standard_Real Radius ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Ax1

Returns the axis X of the cylinder.") XAxis;
		gp_Ax1 XAxis ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Ax1

Returns the axis Y of the cylinder.") YAxis;
		gp_Ax1 YAxis ();
		%feature("autodoc", "Args:
	P(gp_Pnt)

Returns:
	None

No detailed docstring for this function.") Mirror;
		void Mirror (const gp_Pnt  P);
		%feature("autodoc", "Args:
	P(gp_Pnt)

Returns:
	gp_Cylinder

Performs the symmetrical transformation of a cylinder  
 with respect to the point P which is the center of the  
 symmetry.") Mirrored;
		gp_Cylinder Mirrored (const gp_Pnt  P);
		%feature("autodoc", "Args:
	A1(gp_Ax1)

Returns:
	None

No detailed docstring for this function.") Mirror;
		void Mirror (const gp_Ax1  A1);
		%feature("autodoc", "Args:
	A1(gp_Ax1)

Returns:
	gp_Cylinder

Performs the symmetrical transformation of a cylinder with  
 respect to an axis placement which is the axis of the  
 symmetry.") Mirrored;
		gp_Cylinder Mirrored (const gp_Ax1  A1);
		%feature("autodoc", "Args:
	A2(gp_Ax2)

Returns:
	None

No detailed docstring for this function.") Mirror;
		void Mirror (const gp_Ax2  A2);
		%feature("autodoc", "Args:
	A2(gp_Ax2)

Returns:
	gp_Cylinder

Performs the symmetrical transformation of a cylinder with respect  
 to a plane. The axis placement A2 locates the plane of the  
 of the symmetry : (Location, XDirection, YDirection).") Mirrored;
		gp_Cylinder Mirrored (const gp_Ax2  A2);
		%feature("autodoc", "Args:
	A1(gp_Ax1)
	Ang(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Rotate;
		void Rotate (const gp_Ax1  A1,const Standard_Real Ang);
		%feature("autodoc", "Args:
	A1(gp_Ax1)
	Ang(Standard_Real)

Returns:
	gp_Cylinder

Rotates a cylinder. A1 is the axis of the rotation.  
 Ang is the angular value of the rotation in radians.") Rotated;
		gp_Cylinder Rotated (const gp_Ax1  A1,const Standard_Real Ang);
		%feature("autodoc", "Args:
	P(gp_Pnt)
	S(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Scale;
		void Scale (const gp_Pnt  P,const Standard_Real S);
		%feature("autodoc", "Args:
	P(gp_Pnt)
	S(Standard_Real)

Returns:
	gp_Cylinder

Scales a cylinder. S is the scaling value.  
 The absolute value of S is used to scale the cylinder") Scaled;
		gp_Cylinder Scaled (const gp_Pnt  P,const Standard_Real S);
		%feature("autodoc", "Args:
	T(gp_Trsf)

Returns:
	None

No detailed docstring for this function.") Transform;
		void Transform (const gp_Trsf  T);
		%feature("autodoc", "Args:
	T(gp_Trsf)

Returns:
	gp_Cylinder

Transforms a cylinder with the transformation T from class Trsf.") Transformed;
		gp_Cylinder Transformed (const gp_Trsf  T);
		%feature("autodoc", "Args:
	V(gp_Vec)

Returns:
	None

No detailed docstring for this function.") Translate;
		void Translate (const gp_Vec  V);
		%feature("autodoc", "Args:
	V(gp_Vec)

Returns:
	gp_Cylinder

Translates a cylinder in the direction of the vector V.  
 The magnitude of the translation is the vector's magnitude.") Translated;
		gp_Cylinder Translated (const gp_Vec  V);
		%feature("autodoc", "Args:
	P1(gp_Pnt)
	P2(gp_Pnt)

Returns:
	None

No detailed docstring for this function.") Translate;
		void Translate (const gp_Pnt  P1,const gp_Pnt  P2);
		%feature("autodoc", "Args:
	P1(gp_Pnt)
	P2(gp_Pnt)

Returns:
	gp_Cylinder

Translates a cylinder from the point P1 to the point P2.") Translated;
		gp_Cylinder Translated (const gp_Pnt  P1,const gp_Pnt  P2);
		%feature("autodoc", "Args:
	None
Returns:
	gp_Ax3

No detailed docstring for this function.") _CSFDB_Getgp_Cylinderpos;
		const gp_Ax3 & _CSFDB_Getgp_Cylinderpos ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") _CSFDB_Getgp_Cylinderradius;
		Standard_Real _CSFDB_Getgp_Cylinderradius ();
		%feature("autodoc", "Args:
	p(Standard_Real)

Returns:
	None

No detailed docstring for this function.") _CSFDB_Setgp_Cylinderradius;
		void _CSFDB_Setgp_Cylinderradius (const Standard_Real p);
};


%feature("shadow") gp_Cylinder::~gp_Cylinder %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend gp_Cylinder {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor gp_Dir;
class gp_Dir {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

Creates a direction corresponding to X axis.") gp_Dir;
		 gp_Dir ();
		%feature("autodoc", "Args:
	V(gp_Vec)

Returns:
	None

Normalizes the vector V and creates a direction. Raises ConstructionError if V.Magnitude() <= Resolution.") gp_Dir;
		 gp_Dir (const gp_Vec  V);
		%feature("autodoc", "Args:
	Coord(gp_XYZ)

Returns:
	None

Creates a direction from a triplet of coordinates. Raises ConstructionError if Coord.Modulus() <= Resolution from gp.") gp_Dir;
		 gp_Dir (const gp_XYZ  Coord);
		%feature("autodoc", "Args:
	Xv(Standard_Real)
	Yv(Standard_Real)
	Zv(Standard_Real)

Returns:
	None

Creates a direction with its 3 cartesian coordinates. Raises ConstructionError if Sqrt(Xv*Xv + Yv*Yv + Zv*Zv) <= Resolution  Modification of the direction's coordinates  
 If Sqrt (X*X + Y*Y + Z*Z) <= Resolution from gp where  
 X, Y ,Z are the new coordinates it is not possible to  
 construct the direction and the method raises the  
 exception ConstructionError.") gp_Dir;
		 gp_Dir (const Standard_Real Xv,const Standard_Real Yv,const Standard_Real Zv);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	Xi(Standard_Real)

Returns:
	None

For this unit vector,  assigns the value Xi to:  
  -   the X coordinate if Index is 1, or  
  -   the Y coordinate if Index is 2, or  
  -   the Z coordinate if Index is 3,  
  and then normalizes it.  
Warning  
Remember that all the coordinates of a unit vector are  
implicitly modified when any single one is changed directly.  
Exceptions  
Standard_OutOfRange if Index is not 1, 2, or 3.  
Standard_ConstructionError if either of the following  
is less than or equal to gp::Resolution():  
-   Sqrt(Xv*Xv + Yv*Yv + Zv*Zv), or  
-   the modulus of the number triple formed by the new  
  value Xi and the two other coordinates of this vector  
  that were not directly modified.") SetCoord;
		void SetCoord (const Standard_Integer Index,const Standard_Real Xi);
		%feature("autodoc", "Args:
	Xv(Standard_Real)
	Yv(Standard_Real)
	Zv(Standard_Real)

Returns:
	None

For this unit vector,  assigns the values Xv, Yv and Zv to its three coordinates.  
Remember that all the coordinates of a unit vector are  
implicitly modified when any single one is changed directly.") SetCoord;
		void SetCoord (const Standard_Real Xv,const Standard_Real Yv,const Standard_Real Zv);
		%feature("autodoc", "Args:
	X(Standard_Real)

Returns:
	None

Assigns the given value to the X coordinate of this   unit vector.") SetX;
		void SetX (const Standard_Real X);
		%feature("autodoc", "Args:
	Y(Standard_Real)

Returns:
	None

Assigns the given value to the Y coordinate of this   unit vector.") SetY;
		void SetY (const Standard_Real Y);
		%feature("autodoc", "Args:
	Z(Standard_Real)

Returns:
	None

Assigns the given value to the Z  coordinate of this   unit vector.") SetZ;
		void SetZ (const Standard_Real Z);
		%feature("autodoc", "Args:
	Coord(gp_XYZ)

Returns:
	None

Assigns the three coordinates of Coord to this unit vector.") SetXYZ;
		void SetXYZ (const gp_XYZ  Coord);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Standard_Real

Returns the coordinate of range Index :  
 Index = 1 => X is returned  
 Index = 2 => Y is returned  
 Index = 3 => Z is returned  
Exceptions  
Standard_OutOfRange if Index is not 1, 2, or 3.") Coord;
		Standard_Real Coord (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Xv(Standard_Real)
	Yv(Standard_Real)
	Zv(Standard_Real)

Returns:
	None

Returns for the  unit vector  its three coordinates Xv, Yv, and Zv.") Coord;
		void Coord (Standard_Real  Xv,Standard_Real  Yv,Standard_Real  Zv);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

Returns the X coordinate for a  unit vector.") X;
		Standard_Real X ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

Returns the Y coordinate for a  unit vector.") Y;
		Standard_Real Y ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

Returns the Z coordinate for a  unit vector.") Z;
		Standard_Real Z ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_XYZ

for this unit vector, returns  its three coordinates as a number triplea.") XYZ;
		const gp_XYZ & XYZ ();
		%feature("autodoc", "Args:
	Other(gp_Dir)
	AngularTolerance(Standard_Real)

Returns:
	Standard_Boolean

Returns True if the angle between the two directions is  
 lower or equal to AngularTolerance.") IsEqual;
		Standard_Boolean IsEqual (const gp_Dir  Other,const Standard_Real AngularTolerance);
		%feature("autodoc", "Args:
	Other(gp_Dir)
	AngularTolerance(Standard_Real)

Returns:
	Standard_Boolean

Returns True if  the angle between this unit vector and the unit vector Other is equal to Pi/2 (normal).") IsNormal;
		Standard_Boolean IsNormal (const gp_Dir  Other,const Standard_Real AngularTolerance);
		%feature("autodoc", "Args:
	Other(gp_Dir)
	AngularTolerance(Standard_Real)

Returns:
	Standard_Boolean

Returns True if  the angle between this unit vector and the unit vector Other is equal to  Pi (opposite).") IsOpposite;
		Standard_Boolean IsOpposite (const gp_Dir  Other,const Standard_Real AngularTolerance);
		%feature("autodoc", "Args:
	Other(gp_Dir)
	AngularTolerance(Standard_Real)

Returns:
	Standard_Boolean

Returns true if the angle between this unit vector and the  
unit vector Other is equal to 0 or to Pi.  
Note: the tolerance criterion is given by AngularTolerance.") IsParallel;
		Standard_Boolean IsParallel (const gp_Dir  Other,const Standard_Real AngularTolerance);
		%feature("autodoc", "Args:
	Other(gp_Dir)

Returns:
	Standard_Real

Computes the angular value in radians between <self> and  
 <Other>. This value is always positive in 3D space.  
 Returns the angle in the range [0, PI]") Angle;
		Standard_Real Angle (const gp_Dir  Other);
		%feature("autodoc", "Args:
	Other(gp_Dir)
	VRef(gp_Dir)

Returns:
	Standard_Real

Computes the angular value between <self> and <Other>.  
 <VRef> is the direction of reference normal to <self> and <Other>  
 and its orientation gives the positive sense of rotation.  
 If the cross product <self> ^ <Other> has the same orientation  
 as <VRef> the angular value is positive else negative.  
 Returns the angular value in the range -PI and PI (in radians). Raises  DomainError if <self> and <Other> are not parallel this exception is raised  
 when <VRef> is in the same plane as <self> and <Other>  
 The tolerance criterion is Resolution from package gp.") AngleWithRef;
		Standard_Real AngleWithRef (const gp_Dir  Other,const gp_Dir  VRef);
		%feature("autodoc", "Args:
	Right(gp_Dir)

Returns:
	None

Computes the cross product between two directions  
 Raises the exception ConstructionError if the two directions  
 are parallel because the computed vector cannot be normalized  
 to create a direction.") Cross;
		void Cross (const gp_Dir  Right);
		%feature("autodoc", "Args:
	Right(gp_Dir)

Returns:
	None

No detailed docstring for this function.") operator^=;
		void operator ^= (const gp_Dir  Right);
		%feature("autodoc", "Args:
	Right(gp_Dir)

Returns:
	gp_Dir

Computes the triple vector product.  
 <self> ^ (V1 ^ V2)  
 Raises the exception ConstructionError if V1 and V2 are parallel  
 or <self> and (V1^V2) are parallel because the computed vector  
 can't be normalized to create a direction.") Crossed;
		gp_Dir Crossed (const gp_Dir  Right);
		%feature("autodoc", "Args:
	Right(gp_Dir)

Returns:
	gp_Dir

No detailed docstring for this function.") operator^;
		gp_Dir operator ^ (const gp_Dir  Right);
		%feature("autodoc", "Args:
	V1(gp_Dir)
	V2(gp_Dir)

Returns:
	None

No detailed docstring for this function.") CrossCross;
		void CrossCross (const gp_Dir  V1,const gp_Dir  V2);
		%feature("autodoc", "Args:
	V1(gp_Dir)
	V2(gp_Dir)

Returns:
	gp_Dir

Computes the double vector product this ^ (V1 ^ V2).  
 -   CrossCrossed creates a new unit vector.  
Exceptions  
Standard_ConstructionError if:  
-   V1 and V2 are parallel, or  
-   this unit vector and (V1 ^ V2) are parallel.  
This is because, in these conditions, the computed vector  
is null and cannot be normalized.") CrossCrossed;
		gp_Dir CrossCrossed (const gp_Dir  V1,const gp_Dir  V2);
		%feature("autodoc", "Args:
	Other(gp_Dir)

Returns:
	Standard_Real

Computes the scalar product") Dot;
		Standard_Real Dot (const gp_Dir  Other);
		%feature("autodoc", "Args:
	Other(gp_Dir)

Returns:
	Standard_Real

No detailed docstring for this function.") operator*;
		Standard_Real operator * (const gp_Dir  Other);
		%feature("autodoc", "Args:
	V1(gp_Dir)
	V2(gp_Dir)

Returns:
	Standard_Real

Computes the triple scalar product <self> * (V1 ^ V2).  
Warnings :  
 The computed vector V1' = V1 ^ V2 is not normalized  
 to create a unitary vector. So this method never  
 raises an exception even if V1 and V2 are parallel.") DotCross;
		Standard_Real DotCross (const gp_Dir  V1,const gp_Dir  V2);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Reverse;
		void Reverse ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Dir

Reverses the orientation of a direction  geometric transformations  
 Performs the symmetrical transformation of a direction  
 with respect to the direction V which is the center of  
 the  symmetry.]") Reversed;
		gp_Dir Reversed ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Dir

No detailed docstring for this function.") operator-;
		gp_Dir operator - ();
		%feature("autodoc", "Args:
	V(gp_Dir)

Returns:
	None

No detailed docstring for this function.") Mirror;
		void Mirror (const gp_Dir  V);
		%feature("autodoc", "Args:
	V(gp_Dir)

Returns:
	gp_Dir

Performs the symmetrical transformation of a direction  
 with respect to the direction V which is the center of  
 the  symmetry.") Mirrored;
		gp_Dir Mirrored (const gp_Dir  V);
		%feature("autodoc", "Args:
	A1(gp_Ax1)

Returns:
	None

No detailed docstring for this function.") Mirror;
		void Mirror (const gp_Ax1  A1);
		%feature("autodoc", "Args:
	A1(gp_Ax1)

Returns:
	gp_Dir

Performs the symmetrical transformation of a direction  
 with respect to an axis placement which is the axis  
 of the symmetry.") Mirrored;
		gp_Dir Mirrored (const gp_Ax1  A1);
		%feature("autodoc", "Args:
	A2(gp_Ax2)

Returns:
	None

No detailed docstring for this function.") Mirror;
		void Mirror (const gp_Ax2  A2);
		%feature("autodoc", "Args:
	A2(gp_Ax2)

Returns:
	gp_Dir

Performs the symmetrical transformation of a direction  
 with respect to a plane. The axis placement A2 locates  
 the plane of the symmetry : (Location, XDirection, YDirection).") Mirrored;
		gp_Dir Mirrored (const gp_Ax2  A2);
		%feature("autodoc", "Args:
	A1(gp_Ax1)
	Ang(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Rotate;
		void Rotate (const gp_Ax1  A1,const Standard_Real Ang);
		%feature("autodoc", "Args:
	A1(gp_Ax1)
	Ang(Standard_Real)

Returns:
	gp_Dir

Rotates a direction. A1 is the axis of the rotation.  
 Ang is the angular value of the rotation in radians.") Rotated;
		gp_Dir Rotated (const gp_Ax1  A1,const Standard_Real Ang);
		%feature("autodoc", "Args:
	T(gp_Trsf)

Returns:
	None

No detailed docstring for this function.") Transform;
		void Transform (const gp_Trsf  T);
		%feature("autodoc", "Args:
	T(gp_Trsf)

Returns:
	gp_Dir

Transforms a direction with a 'Trsf' from gp.  
Warnings :  
 If the scale factor of the 'Trsf' T is negative then the  
 direction <self> is reversed.") Transformed;
		gp_Dir Transformed (const gp_Trsf  T);
		%feature("autodoc", "Args:
	None
Returns:
	gp_XYZ

No detailed docstring for this function.") _CSFDB_Getgp_Dircoord;
		const gp_XYZ & _CSFDB_Getgp_Dircoord ();
};


%feature("shadow") gp_Dir::~gp_Dir %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend gp_Dir {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor gp_Dir2d;
class gp_Dir2d {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

Creates a direction corresponding to X axis.") gp_Dir2d;
		 gp_Dir2d ();
		%feature("autodoc", "Args:
	V(gp_Vec2d)

Returns:
	None

Normalizes the vector V and creates a Direction. Raises ConstructionError if V.Magnitude() <= Resolution from gp.") gp_Dir2d;
		 gp_Dir2d (const gp_Vec2d  V);
		%feature("autodoc", "Args:
	Coord(gp_XY)

Returns:
	None

Creates a Direction from a doublet of coordinates. Raises ConstructionError if Coord.Modulus() <= Resolution from gp.") gp_Dir2d;
		 gp_Dir2d (const gp_XY  Coord);
		%feature("autodoc", "Args:
	Xv(Standard_Real)
	Yv(Standard_Real)

Returns:
	None

Creates a Direction with its 2 cartesian coordinates. Raises ConstructionError if Sqrt(Xv*Xv + Yv*Yv) <= Resolution from gp.") gp_Dir2d;
		 gp_Dir2d (const Standard_Real Xv,const Standard_Real Yv);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	Xi(Standard_Real)

Returns:
	None

For this unit vector, assigns:  
the value Xi to:  
  -   the X coordinate if Index is 1, or  
  -   the Y coordinate if Index is 2, and then normalizes it.  
Warning  
Remember that all the coordinates of a unit vector are  
implicitly modified when any single one is changed directly.  
Exceptions  
Standard_OutOfRange if Index is not 1 or 2.  
Standard_ConstructionError if either of the following  
is less than or equal to gp::Resolution():  
-   Sqrt(Xv*Xv + Yv*Yv), or  
-   the modulus of the number pair formed by the new  
  value Xi and the other coordinate of this vector that  
  was not directly modified.  
 Raises OutOfRange if Index != {1, 2}.") SetCoord;
		void SetCoord (const Standard_Integer Index,const Standard_Real Xi);
		%feature("autodoc", "Args:
	Xv(Standard_Real)
	Yv(Standard_Real)

Returns:
	None

For this unit vector, assigns:  
-   the values Xv and Yv to its two coordinates,  
Warning  
Remember that all the coordinates of a unit vector are  
implicitly modified when any single one is changed directly.  
Exceptions  
Standard_OutOfRange if Index is not 1 or 2.  
Standard_ConstructionError if either of the following  
is less than or equal to gp::Resolution():  
-   Sqrt(Xv*Xv + Yv*Yv), or  
-   the modulus of the number pair formed by the new  
  value Xi and the other coordinate of this vector that  
  was not directly modified.  
 Raises OutOfRange if Index != {1, 2}.") SetCoord;
		void SetCoord (const Standard_Real Xv,const Standard_Real Yv);
		%feature("autodoc", "Args:
	X(Standard_Real)

Returns:
	None

Assigns the given value to the X coordinate of this unit   vector,  
  and then normalizes it.  
Warning  
Remember that all the coordinates of a unit vector are  
implicitly modified when any single one is changed directly.  
Exceptions  
Standard_ConstructionError if either of the following  
is less than or equal to gp::Resolution():  
-   the modulus of Coord, or  
-   the modulus of the number pair formed from the new  
  X or Y coordinate and the other coordinate of this  
  vector that was not directly modified.") SetX;
		void SetX (const Standard_Real X);
		%feature("autodoc", "Args:
	Y(Standard_Real)

Returns:
	None

Assigns  the given value to the Y coordinate of this unit   vector,  
  and then normalizes it.  
Warning  
Remember that all the coordinates of a unit vector are  
implicitly modified when any single one is changed directly.  
Exceptions  
Standard_ConstructionError if either of the following  
is less than or equal to gp::Resolution():  
-   the modulus of Coord, or  
-   the modulus of the number pair formed from the new  
  X or Y coordinate and the other coordinate of this  
  vector that was not directly modified.") SetY;
		void SetY (const Standard_Real Y);
		%feature("autodoc", "Args:
	Coord(gp_XY)

Returns:
	None

Assigns:  
-   the two coordinates of Coord to this unit vector,  
  and then normalizes it.  
Warning  
Remember that all the coordinates of a unit vector are  
implicitly modified when any single one is changed directly.  
Exceptions  
Standard_ConstructionError if either of the following  
is less than or equal to gp::Resolution():  
-   the modulus of Coord, or  
-   the modulus of the number pair formed from the new  
  X or Y coordinate and the other coordinate of this  
  vector that was not directly modified.") SetXY;
		void SetXY (const gp_XY  Coord);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Standard_Real

For this unit vector returns the coordinate of range Index :  
 Index = 1 => X is returned  
 Index = 2 => Y is returned  
Raises OutOfRange if Index != {1, 2}.") Coord;
		Standard_Real Coord (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Xv(Standard_Real)
	Yv(Standard_Real)

Returns:
	None

For this unit vector returns its two coordinates Xv and Yv.  
Raises OutOfRange if Index != {1, 2}.") Coord;
		void Coord (Standard_Real  Xv,Standard_Real  Yv);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

For this unit vector, returns its X coordinate.") X;
		Standard_Real X ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

For this unit vector, returns its Y coordinate.") Y;
		Standard_Real Y ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_XY

For this unit vector, returns its two coordinates as a number pair.  Comparison between Directions  
 The precision value is an input data.") XY;
		const gp_XY & XY ();
		%feature("autodoc", "Args:
	Other(gp_Dir2d)
	AngularTolerance(Standard_Real)

Returns:
	Standard_Boolean

Returns True if the two vectors have the same direction  
i.e. the angle between this unit vector and the  
unit vector Other is less than or equal to AngularTolerance.") IsEqual;
		Standard_Boolean IsEqual (const gp_Dir2d  Other,const Standard_Real AngularTolerance);
		%feature("autodoc", "Args:
	Other(gp_Dir2d)
	AngularTolerance(Standard_Real)

Returns:
	Standard_Boolean

Returns True if the angle between this unit vector and the  
unit vector Other is equal to Pi/2 or -Pi/2 (normal)  
i.e. Abs(Abs(<self>.Angle(Other)) - PI/2.) <= AngularTolerance") IsNormal;
		Standard_Boolean IsNormal (const gp_Dir2d  Other,const Standard_Real AngularTolerance);
		%feature("autodoc", "Args:
	Other(gp_Dir2d)
	AngularTolerance(Standard_Real)

Returns:
	Standard_Boolean

Returns True if the angle between this unit vector and the  
unit vector Other is equal to Pi or -Pi (opposite).  
i.e.  PI - Abs(<self>.Angle(Other)) <= AngularTolerance") IsOpposite;
		Standard_Boolean IsOpposite (const gp_Dir2d  Other,const Standard_Real AngularTolerance);
		%feature("autodoc", "Args:
	Other(gp_Dir2d)
	AngularTolerance(Standard_Real)

Returns:
	Standard_Boolean

returns true if if the angle between this unit vector and unit  
vector Other is equal to 0, Pi or -Pi.  
i.e.  Abs(Angle(<self>, Other)) <= AngularTolerance or  
 PI - Abs(Angle(<self>, Other)) <= AngularTolerance") IsParallel;
		Standard_Boolean IsParallel (const gp_Dir2d  Other,const Standard_Real AngularTolerance);
		%feature("autodoc", "Args:
	Other(gp_Dir2d)

Returns:
	Standard_Real

Computes the angular value in radians between <self> and  
 <Other>. Returns the angle in the range [-PI, PI].") Angle;
		Standard_Real Angle (const gp_Dir2d  Other);
		%feature("autodoc", "Args:
	Right(gp_Dir2d)

Returns:
	Standard_Real

Computes the cross product between two directions.") Crossed;
		Standard_Real Crossed (const gp_Dir2d  Right);
		%feature("autodoc", "Args:
	Right(gp_Dir2d)

Returns:
	Standard_Real

No detailed docstring for this function.") operator^;
		Standard_Real operator ^ (const gp_Dir2d  Right);
		%feature("autodoc", "Args:
	Other(gp_Dir2d)

Returns:
	Standard_Real

Computes the scalar product") Dot;
		Standard_Real Dot (const gp_Dir2d  Other);
		%feature("autodoc", "Args:
	Other(gp_Dir2d)

Returns:
	Standard_Real

No detailed docstring for this function.") operator*;
		Standard_Real operator * (const gp_Dir2d  Other);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Reverse;
		void Reverse ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Dir2d

Reverses the orientation of a direction") Reversed;
		gp_Dir2d Reversed ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Dir2d

No detailed docstring for this function.") operator-;
		gp_Dir2d operator - ();
		%feature("autodoc", "Args:
	V(gp_Dir2d)

Returns:
	None

No detailed docstring for this function.") Mirror;
		void Mirror (const gp_Dir2d  V);
		%feature("autodoc", "Args:
	V(gp_Dir2d)

Returns:
	gp_Dir2d

Performs the symmetrical transformation of a direction  
 with respect to the direction V which is the center of  
 the  symmetry.") Mirrored;
		gp_Dir2d Mirrored (const gp_Dir2d  V);
		%feature("autodoc", "Args:
	A(gp_Ax2d)

Returns:
	None

No detailed docstring for this function.") Mirror;
		void Mirror (const gp_Ax2d  A);
		%feature("autodoc", "Args:
	A(gp_Ax2d)

Returns:
	gp_Dir2d

Performs the symmetrical transformation of a direction  
 with respect to an axis placement which is the axis  
 of the symmetry.") Mirrored;
		gp_Dir2d Mirrored (const gp_Ax2d  A);
		%feature("autodoc", "Args:
	Ang(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Rotate;
		void Rotate (const Standard_Real Ang);
		%feature("autodoc", "Args:
	Ang(Standard_Real)

Returns:
	gp_Dir2d

Rotates a direction.  Ang is the angular value of  
 the rotation in radians.") Rotated;
		gp_Dir2d Rotated (const Standard_Real Ang);
		%feature("autodoc", "Args:
	T(gp_Trsf2d)

Returns:
	None

No detailed docstring for this function.") Transform;
		void Transform (const gp_Trsf2d  T);
		%feature("autodoc", "Args:
	T(gp_Trsf2d)

Returns:
	gp_Dir2d

Transforms a direction with the 'Trsf' T.  
Warnings :  
 If the scale factor of the 'Trsf' T is negative then the  
 direction <self> is reversed.") Transformed;
		gp_Dir2d Transformed (const gp_Trsf2d  T);
		%feature("autodoc", "Args:
	None
Returns:
	gp_XY

No detailed docstring for this function.") _CSFDB_Getgp_Dir2dcoord;
		const gp_XY & _CSFDB_Getgp_Dir2dcoord ();
};


%feature("shadow") gp_Dir2d::~gp_Dir2d %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend gp_Dir2d {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor gp_Elips;
class gp_Elips {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

Creates an indefinite ellipse.") gp_Elips;
		 gp_Elips ();
		%feature("autodoc", "Args:
	A2(gp_Ax2)
	MajorRadius(Standard_Real)
	MinorRadius(Standard_Real)

Returns:
	None

The major radius of the ellipse is on the 'XAxis' and the  
 minor radius is on the 'YAxis' of the ellipse. The 'XAxis'  
 is defined with the 'XDirection' of A2 and the 'YAxis' is  
 defined with the 'YDirection' of A2.  
Warnings :  
 It is not forbidden to create an ellipse with MajorRadius =  
 MinorRadius.  
 Raises ConstructionError if MajorRadius < MinorRadius or MinorRadius < 0.") gp_Elips;
		 gp_Elips (const gp_Ax2  A2,const Standard_Real MajorRadius,const Standard_Real MinorRadius);
		%feature("autodoc", "Args:
	A1(gp_Ax1)

Returns:
	None

Changes the axis normal to the plane of the ellipse.  
 It modifies the definition of this plane.  
 The 'XAxis' and the 'YAxis' are recomputed.  
The local coordinate system is redefined so that:  
-   its origin and 'main Direction' become those of the  
  axis A1 (the 'X Direction' and 'Y Direction' are then  
  recomputed in the same way as for any gp_Ax2), or  
 Raises ConstructionError if the direction of A1  
is parallel to the direction of the 'XAxis' of the ellipse.") SetAxis;
		void SetAxis (const gp_Ax1  A1);
		%feature("autodoc", "Args:
	P(gp_Pnt)

Returns:
	None

//!Modifies this ellipse, by redefining its local coordinate  
so that its origin becomes P.") SetLocation;
		void SetLocation (const gp_Pnt  P);
		%feature("autodoc", "Args:
	MajorRadius(Standard_Real)

Returns:
	None

The major radius of the ellipse is on the 'XAxis' (major axis)  
 of the ellipse.  
 Raises ConstructionError if MajorRadius < MinorRadius.") SetMajorRadius;
		void SetMajorRadius (const Standard_Real MajorRadius);
		%feature("autodoc", "Args:
	MinorRadius(Standard_Real)

Returns:
	None

The minor radius of the ellipse is on the 'YAxis' (minor axis)  
 of the ellipse.  
 Raises ConstructionError if MinorRadius > MajorRadius or MinorRadius < 0.") SetMinorRadius;
		void SetMinorRadius (const Standard_Real MinorRadius);
		%feature("autodoc", "Args:
	A2(gp_Ax2)

Returns:
	None

Modifies this ellipse, by redefining its local coordinate  
so that it becomes A2e.") SetPosition;
		void SetPosition (const gp_Ax2  A2);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

Computes the area of the Ellipse.") Area;
		Standard_Real Area ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Ax1

Computes the axis normal to the plane of the ellipse.") Axis;
		const gp_Ax1 & Axis ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Ax1

Computes the first or second directrix of this ellipse.  
These are the lines, in the plane of the ellipse, normal to  
the major axis, at a distance equal to  
MajorRadius/e from the center of the ellipse, where  
e is the eccentricity of the ellipse.  
The first directrix (Directrix1) is on the positive side of  
the major axis. The second directrix (Directrix2) is on  
the negative side.  
The directrix is returned as an axis (gp_Ax1 object), the  
origin of which is situated on the 'X Axis' of the local  
coordinate system of this ellipse.  
Exceptions  
Standard_ConstructionError if the eccentricity is null  
(the ellipse has degenerated into a circle).") Directrix1;
		gp_Ax1 Directrix1 ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Ax1

This line is obtained by the symmetrical transformation  
 of 'Directrix1' with respect to the 'YAxis' of the ellipse.  
Exceptions  
Standard_ConstructionError if the eccentricity is null  
(the ellipse has degenerated into a circle).") Directrix2;
		gp_Ax1 Directrix2 ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

Returns the eccentricity of the ellipse  between 0.0 and 1.0  
 If f is the distance between the center of the ellipse and  
 the Focus1 then the eccentricity e = f / MajorRadius.  
  Raises ConstructionError if MajorRadius = 0.0") Eccentricity;
		Standard_Real Eccentricity ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

Computes the focal distance. It is the distance between the  
 two focus focus1 and focus2 of the ellipse.") Focal;
		Standard_Real Focal ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Pnt

Returns the first focus of the ellipse. This focus is on the  
 positive side of the 'XAxis' of the ellipse.") Focus1;
		gp_Pnt Focus1 ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Pnt

Returns the second focus of the ellipse. This focus is on the  
 negative side of the 'XAxis' of the ellipse.") Focus2;
		gp_Pnt Focus2 ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Pnt

Returns the center of the ellipse. It is the 'Location'  
 point of the coordinate system of the ellipse.") Location;
		const gp_Pnt & Location ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

Returns the major radius of the ellipse.") MajorRadius;
		Standard_Real MajorRadius ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

Returns the minor radius of the ellipse.") MinorRadius;
		Standard_Real MinorRadius ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

Returns p = (1 - e * e) * MajorRadius where e is the eccentricity  
 of the ellipse.  
 Returns 0 if MajorRadius = 0") Parameter;
		Standard_Real Parameter ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Ax2

Returns the coordinate system of the ellipse.") Position;
		const gp_Ax2 & Position ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Ax1

Returns the 'XAxis' of the ellipse whose origin  
is the center of this ellipse. It is the major axis of the  
 ellipse.") XAxis;
		gp_Ax1 XAxis ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Ax1

Returns the 'YAxis' of the ellipse whose unit vector is the 'X Direction' or the 'Y Direction'  
 of the local coordinate system of this ellipse.  
This is the minor axis of the ellipse.") YAxis;
		gp_Ax1 YAxis ();
		%feature("autodoc", "Args:
	P(gp_Pnt)

Returns:
	None

No detailed docstring for this function.") Mirror;
		void Mirror (const gp_Pnt  P);
		%feature("autodoc", "Args:
	P(gp_Pnt)

Returns:
	gp_Elips

Performs the symmetrical transformation of an ellipse with  
 respect to the point P which is the center of the symmetry.") Mirrored;
		gp_Elips Mirrored (const gp_Pnt  P);
		%feature("autodoc", "Args:
	A1(gp_Ax1)

Returns:
	None

No detailed docstring for this function.") Mirror;
		void Mirror (const gp_Ax1  A1);
		%feature("autodoc", "Args:
	A1(gp_Ax1)

Returns:
	gp_Elips

Performs the symmetrical transformation of an ellipse with  
 respect to an axis placement which is the axis of the symmetry.") Mirrored;
		gp_Elips Mirrored (const gp_Ax1  A1);
		%feature("autodoc", "Args:
	A2(gp_Ax2)

Returns:
	None

No detailed docstring for this function.") Mirror;
		void Mirror (const gp_Ax2  A2);
		%feature("autodoc", "Args:
	A2(gp_Ax2)

Returns:
	gp_Elips

Performs the symmetrical transformation of an ellipse with  
 respect to a plane. The axis placement A2 locates the plane  
 of the symmetry (Location, XDirection, YDirection).") Mirrored;
		gp_Elips Mirrored (const gp_Ax2  A2);
		%feature("autodoc", "Args:
	A1(gp_Ax1)
	Ang(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Rotate;
		void Rotate (const gp_Ax1  A1,const Standard_Real Ang);
		%feature("autodoc", "Args:
	A1(gp_Ax1)
	Ang(Standard_Real)

Returns:
	gp_Elips

Rotates an ellipse. A1 is the axis of the rotation.  
 Ang is the angular value of the rotation in radians.") Rotated;
		gp_Elips Rotated (const gp_Ax1  A1,const Standard_Real Ang);
		%feature("autodoc", "Args:
	P(gp_Pnt)
	S(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Scale;
		void Scale (const gp_Pnt  P,const Standard_Real S);
		%feature("autodoc", "Args:
	P(gp_Pnt)
	S(Standard_Real)

Returns:
	gp_Elips

Scales an ellipse. S is the scaling value.") Scaled;
		gp_Elips Scaled (const gp_Pnt  P,const Standard_Real S);
		%feature("autodoc", "Args:
	T(gp_Trsf)

Returns:
	None

No detailed docstring for this function.") Transform;
		void Transform (const gp_Trsf  T);
		%feature("autodoc", "Args:
	T(gp_Trsf)

Returns:
	gp_Elips

Transforms an ellipse with the transformation T from class Trsf.") Transformed;
		gp_Elips Transformed (const gp_Trsf  T);
		%feature("autodoc", "Args:
	V(gp_Vec)

Returns:
	None

No detailed docstring for this function.") Translate;
		void Translate (const gp_Vec  V);
		%feature("autodoc", "Args:
	V(gp_Vec)

Returns:
	gp_Elips

Translates an ellipse in the direction of the vector V.  
 The magnitude of the translation is the vector's magnitude.") Translated;
		gp_Elips Translated (const gp_Vec  V);
		%feature("autodoc", "Args:
	P1(gp_Pnt)
	P2(gp_Pnt)

Returns:
	None

No detailed docstring for this function.") Translate;
		void Translate (const gp_Pnt  P1,const gp_Pnt  P2);
		%feature("autodoc", "Args:
	P1(gp_Pnt)
	P2(gp_Pnt)

Returns:
	gp_Elips

Translates an ellipse from the point P1 to the point P2.") Translated;
		gp_Elips Translated (const gp_Pnt  P1,const gp_Pnt  P2);
		%feature("autodoc", "Args:
	None
Returns:
	gp_Ax2

No detailed docstring for this function.") _CSFDB_Getgp_Elipspos;
		const gp_Ax2 & _CSFDB_Getgp_Elipspos ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") _CSFDB_Getgp_ElipsmajorRadius;
		Standard_Real _CSFDB_Getgp_ElipsmajorRadius ();
		%feature("autodoc", "Args:
	p(Standard_Real)

Returns:
	None

No detailed docstring for this function.") _CSFDB_Setgp_ElipsmajorRadius;
		void _CSFDB_Setgp_ElipsmajorRadius (const Standard_Real p);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") _CSFDB_Getgp_ElipsminorRadius;
		Standard_Real _CSFDB_Getgp_ElipsminorRadius ();
		%feature("autodoc", "Args:
	p(Standard_Real)

Returns:
	None

No detailed docstring for this function.") _CSFDB_Setgp_ElipsminorRadius;
		void _CSFDB_Setgp_ElipsminorRadius (const Standard_Real p);
};


%feature("shadow") gp_Elips::~gp_Elips %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend gp_Elips {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor gp_Elips2d;
class gp_Elips2d {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

Creates an indefinite ellipse.") gp_Elips2d;
		 gp_Elips2d ();
		%feature("autodoc", "Args:
	MajorAxis(gp_Ax2d)
	MajorRadius(Standard_Real)
	MinorRadius(Standard_Real)
	Sense(Standard_Boolean)=Standard_True

Returns:
	None

Creates an ellipse with the major axis, the major and the  
 minor radius. The location of the MajorAxis is the center  
 of the  ellipse.  
 The sense of parametrization is given by Sense.  
 Warnings :  
 It is possible to create an ellipse with  
 MajorRadius = MinorRadius.  
 Raises ConstructionError if MajorRadius < MinorRadius or MinorRadius < 0.0") gp_Elips2d;
		 gp_Elips2d (const gp_Ax2d  MajorAxis,const Standard_Real MajorRadius,const Standard_Real MinorRadius,const Standard_Boolean Sense = Standard_True);
		%feature("autodoc", "Args:
	A(gp_Ax22d)
	MajorRadius(Standard_Real)
	MinorRadius(Standard_Real)

Returns:
	None

Creates an ellipse with radii MajorRadius and  
  MinorRadius, positioned in the plane by coordinate system A where:  
  -   the origin of A is the center of the ellipse,  
  -   the 'X Direction' of A defines the major axis of  
   the ellipse, that is, the major radius MajorRadius  
   is measured along this axis, and  
  -   the 'Y Direction' of A defines the minor axis of  
   the ellipse, that is, the minor radius MinorRadius  
   is measured along this axis, and  
  -   the orientation (direct or indirect sense) of A  
   gives the orientation of the ellipse.  
 Warnings :  
 It is possible to create an ellipse with  
 MajorRadius = MinorRadius.  
Raises ConstructionError if MajorRadius < MinorRadius or MinorRadius < 0.0") gp_Elips2d;
		 gp_Elips2d (const gp_Ax22d  A,const Standard_Real MajorRadius,const Standard_Real MinorRadius);
		%feature("autodoc", "Args:
	P(gp_Pnt2d)

Returns:
	None

Modifies this ellipse, by redefining its local coordinate system so that  
-   its origin becomes P.") SetLocation;
		void SetLocation (const gp_Pnt2d  P);
		%feature("autodoc", "Args:
	MajorRadius(Standard_Real)

Returns:
	None

Changes the value of the major radius.  
Raises ConstructionError if MajorRadius < MinorRadius.") SetMajorRadius;
		void SetMajorRadius (const Standard_Real MajorRadius);
		%feature("autodoc", "Args:
	MinorRadius(Standard_Real)

Returns:
	None

Changes the value of the minor radius.  
Raises ConstructionError if MajorRadius < MinorRadius or MinorRadius < 0.0") SetMinorRadius;
		void SetMinorRadius (const Standard_Real MinorRadius);
		%feature("autodoc", "Args:
	A(gp_Ax22d)

Returns:
	None

Modifies this ellipse, by redefining its local coordinate system so that  
   it becomes A.") SetAxis;
		void SetAxis (const gp_Ax22d  A);
		%feature("autodoc", "Args:
	A(gp_Ax2d)

Returns:
	None

Modifies this ellipse, by redefining its local coordinate system so that  
  its origin and its 'X Direction'  become those  
of the axis A. The 'Y  Direction'  is then  
  recomputed. The orientation of the local coordinate  
  system is not modified.") SetXAxis;
		void SetXAxis (const gp_Ax2d  A);
		%feature("autodoc", "Args:
	A(gp_Ax2d)

Returns:
	None

Modifies this ellipse, by redefining its local coordinate system so that  
  its origin and its 'Y Direction'  become those  
of the axis A. The 'X  Direction'  is then  
  recomputed. The orientation of the local coordinate  
  system is not modified.") SetYAxis;
		void SetYAxis (const gp_Ax2d  A);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

Computes the area of the ellipse.") Area;
		Standard_Real Area ();
		%feature("autodoc", "Args:
	A(Standard_Real)
	B(Standard_Real)
	C(Standard_Real)
	D(Standard_Real)
	E(Standard_Real)
	F(Standard_Real)

Returns:
	None

Returns the coefficients of the implicit equation of the ellipse.  
 A * (X**2) + B * (Y**2) + 2*C*(X*Y) + 2*D*X + 2*E*Y + F = 0.") Coefficients;
		void Coefficients (Standard_Real  A,Standard_Real  B,Standard_Real  C,Standard_Real  D,Standard_Real  E,Standard_Real  F);
		%feature("autodoc", "Args:
	None
Returns:
	gp_Ax2d

This directrix is the line normal to the XAxis of the ellipse  
 in the local plane (Z = 0) at a distance d = MajorRadius / e  
 from the center of the ellipse, where e is the eccentricity of  
 the ellipse.  
 This line is parallel to the 'YAxis'. The intersection point  
 between directrix1 and the 'XAxis' is the location point of the  
 directrix1. This point is on the positive side of the 'XAxis'.  
 Raised if Eccentricity = 0.0. (The ellipse degenerates into a  
 circle)") Directrix1;
		gp_Ax2d Directrix1 ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Ax2d

This line is obtained by the symmetrical transformation  
 of 'Directrix1' with respect to the minor axis of the ellipse.  
 Raised if Eccentricity = 0.0. (The ellipse degenerates into a  
 circle).") Directrix2;
		gp_Ax2d Directrix2 ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

Returns the eccentricity of the ellipse  between 0.0 and 1.0  
 If f is the distance between the center of the ellipse and  
 the Focus1 then the eccentricity e = f / MajorRadius.  
 Returns 0 if MajorRadius = 0.") Eccentricity;
		Standard_Real Eccentricity ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

Returns the distance between the center of the ellipse  
 and focus1 or focus2.") Focal;
		Standard_Real Focal ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Pnt2d

Returns the first focus of the ellipse. This focus is on the  
 positive side of the major axis of the ellipse.") Focus1;
		gp_Pnt2d Focus1 ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Pnt2d

Returns the second focus of the ellipse. This focus is on the  
 negative side of the major axis of the ellipse.") Focus2;
		gp_Pnt2d Focus2 ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Pnt2d

Returns the center of the ellipse.") Location;
		const gp_Pnt2d & Location ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

Returns the major radius of the Ellipse.") MajorRadius;
		Standard_Real MajorRadius ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

Returns the minor radius of the Ellipse.") MinorRadius;
		Standard_Real MinorRadius ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

Returns p = (1 - e * e) * MajorRadius where e is the eccentricity  
 of the ellipse.  
 Returns 0 if MajorRadius = 0") Parameter;
		Standard_Real Parameter ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Ax22d

Returns the major axis of the ellipse.") Axis;
		const gp_Ax22d & Axis ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Ax2d

Returns the major axis of the ellipse.") XAxis;
		gp_Ax2d XAxis ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Ax2d

Returns the minor axis of the ellipse.  Reverses the direction of the circle.") YAxis;
		gp_Ax2d YAxis ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Reverse;
		void Reverse ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Elips2d

No detailed docstring for this function.") Reversed;
		gp_Elips2d Reversed ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns true if the local coordinate system is direct  
           and false in the other case.") IsDirect;
		Standard_Boolean IsDirect ();
		%feature("autodoc", "Args:
	P(gp_Pnt2d)

Returns:
	None

No detailed docstring for this function.") Mirror;
		void Mirror (const gp_Pnt2d  P);
		%feature("autodoc", "Args:
	P(gp_Pnt2d)

Returns:
	gp_Elips2d

Performs the symmetrical transformation of a ellipse with respect  
 to the point P which is the center of the symmetry") Mirrored;
		gp_Elips2d Mirrored (const gp_Pnt2d  P);
		%feature("autodoc", "Args:
	A(gp_Ax2d)

Returns:
	None

No detailed docstring for this function.") Mirror;
		void Mirror (const gp_Ax2d  A);
		%feature("autodoc", "Args:
	A(gp_Ax2d)

Returns:
	gp_Elips2d

Performs the symmetrical transformation of a ellipse with respect  
 to an axis placement which is the axis of the symmetry.") Mirrored;
		gp_Elips2d Mirrored (const gp_Ax2d  A);
		%feature("autodoc", "Args:
	P(gp_Pnt2d)
	Ang(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Rotate;
		void Rotate (const gp_Pnt2d  P,const Standard_Real Ang);
		%feature("autodoc", "Args:
	P(gp_Pnt2d)
	Ang(Standard_Real)

Returns:
	gp_Elips2d

No detailed docstring for this function.") Rotated;
		gp_Elips2d Rotated (const gp_Pnt2d  P,const Standard_Real Ang);
		%feature("autodoc", "Args:
	P(gp_Pnt2d)
	S(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Scale;
		void Scale (const gp_Pnt2d  P,const Standard_Real S);
		%feature("autodoc", "Args:
	P(gp_Pnt2d)
	S(Standard_Real)

Returns:
	gp_Elips2d

Scales a ellipse. S is the scaling value.") Scaled;
		gp_Elips2d Scaled (const gp_Pnt2d  P,const Standard_Real S);
		%feature("autodoc", "Args:
	T(gp_Trsf2d)

Returns:
	None

No detailed docstring for this function.") Transform;
		void Transform (const gp_Trsf2d  T);
		%feature("autodoc", "Args:
	T(gp_Trsf2d)

Returns:
	gp_Elips2d

Transforms an ellipse with the transformation T from class Trsf2d.") Transformed;
		gp_Elips2d Transformed (const gp_Trsf2d  T);
		%feature("autodoc", "Args:
	V(gp_Vec2d)

Returns:
	None

No detailed docstring for this function.") Translate;
		void Translate (const gp_Vec2d  V);
		%feature("autodoc", "Args:
	V(gp_Vec2d)

Returns:
	gp_Elips2d

Translates a ellipse in the direction of the vector V.  
 The magnitude of the translation is the vector's magnitude.") Translated;
		gp_Elips2d Translated (const gp_Vec2d  V);
		%feature("autodoc", "Args:
	P1(gp_Pnt2d)
	P2(gp_Pnt2d)

Returns:
	None

No detailed docstring for this function.") Translate;
		void Translate (const gp_Pnt2d  P1,const gp_Pnt2d  P2);
		%feature("autodoc", "Args:
	P1(gp_Pnt2d)
	P2(gp_Pnt2d)

Returns:
	gp_Elips2d

Translates a ellipse from the point P1 to the point P2.") Translated;
		gp_Elips2d Translated (const gp_Pnt2d  P1,const gp_Pnt2d  P2);
		%feature("autodoc", "Args:
	None
Returns:
	gp_Ax22d

No detailed docstring for this function.") _CSFDB_Getgp_Elips2dpos;
		const gp_Ax22d & _CSFDB_Getgp_Elips2dpos ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") _CSFDB_Getgp_Elips2dmajorRadius;
		Standard_Real _CSFDB_Getgp_Elips2dmajorRadius ();
		%feature("autodoc", "Args:
	p(Standard_Real)

Returns:
	None

No detailed docstring for this function.") _CSFDB_Setgp_Elips2dmajorRadius;
		void _CSFDB_Setgp_Elips2dmajorRadius (const Standard_Real p);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") _CSFDB_Getgp_Elips2dminorRadius;
		Standard_Real _CSFDB_Getgp_Elips2dminorRadius ();
		%feature("autodoc", "Args:
	p(Standard_Real)

Returns:
	None

No detailed docstring for this function.") _CSFDB_Setgp_Elips2dminorRadius;
		void _CSFDB_Setgp_Elips2dminorRadius (const Standard_Real p);
};


%feature("shadow") gp_Elips2d::~gp_Elips2d %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend gp_Elips2d {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor gp_GTrsf;
class gp_GTrsf {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

Returns the Identity transformation.") gp_GTrsf;
		 gp_GTrsf ();
		%feature("autodoc", "Args:
	T(gp_Trsf)

Returns:
	None

Converts the gp_Trsf transformation T into a  
  general transformation, i.e. Returns a GTrsf with  
the same matrix of coefficients as the Trsf T.") gp_GTrsf;
		 gp_GTrsf (const gp_Trsf  T);
		%feature("autodoc", "Args:
	M(gp_Mat)
	V(gp_XYZ)

Returns:
	None

Creates a transformation based on the matrix M and the  
   vector V where M defines the vectorial part of  
   the transformation, and V the translation part, or") gp_GTrsf;
		 gp_GTrsf (const gp_Mat  M,const gp_XYZ  V);
		%feature("autodoc", "Args:
	A1(gp_Ax1)
	Ratio(Standard_Real)

Returns:
	None

Changes this transformation into an affinity of ratio Ratio  
with respect to the axis A1.  
  Note: an affinity is a point-by-point transformation that  
transforms any point P into a point P' such that if H is  
the orthogonal projection of P on the axis A1 or the  
plane A2, the vectors HP and HP' satisfy:  
HP' = Ratio * HP.") SetAffinity;
		void SetAffinity (const gp_Ax1  A1,const Standard_Real Ratio);
		%feature("autodoc", "Args:
	A2(gp_Ax2)
	Ratio(Standard_Real)

Returns:
	None

Changes this transformation into an affinity of ratio Ratio  
with respect to  the plane defined by the origin, the 'X Direction' and  
  the 'Y Direction' of coordinate system A2.  
  Note: an affinity is a point-by-point transformation that  
transforms any point P into a point P' such that if H is  
the orthogonal projection of P on the axis A1 or the  
plane A2, the vectors HP and HP' satisfy:  
HP' = Ratio * HP.") SetAffinity;
		void SetAffinity (const gp_Ax2  A2,const Standard_Real Ratio);
		%feature("autodoc", "Args:
	Row(Standard_Integer)
	Col(Standard_Integer)
	Value(Standard_Real)

Returns:
	None

Replaces  the coefficient (Row, Col) of the matrix representing  
this transformation by Value.  Raises OutOfRange  
if  Row < 1 or Row > 3 or Col < 1 or Col > 4") SetValue;
		void SetValue (const Standard_Integer Row,const Standard_Integer Col,const Standard_Real Value);
		%feature("autodoc", "Args:
	Matrix(gp_Mat)

Returns:
	None

Replaces the vectorial part of this transformation by Matrix.") SetVectorialPart;
		void SetVectorialPart (const gp_Mat  Matrix);
		%feature("autodoc", "Args:
	Coord(gp_XYZ)

Returns:
	None

Replaces the translation part of  
this transformation by the coordinates of the number triple Coord.") SetTranslationPart;
		void SetTranslationPart (const gp_XYZ  Coord);
		%feature("autodoc", "Args:
	T(gp_Trsf)

Returns:
	None

Assigns the vectorial and translation parts of T to this transformation.") SetTrsf;
		void SetTrsf (const gp_Trsf  T);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns true if the determinant of the vectorial part of  
this transformation is negative.") IsNegative;
		Standard_Boolean IsNegative ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns true if this transformation is singular (and  
therefore, cannot be inverted).  
Note: The Gauss LU decomposition is used to invert the  
transformation matrix. Consequently, the transformation  
is considered as singular if the largest pivot found is less  
than or equal to gp::Resolution().  
Warning  
If this transformation is singular, it cannot be inverted.") IsSingular;
		Standard_Boolean IsSingular ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_TrsfForm

Returns the nature of the transformation.  It can be an  
identity transformation, a rotation, a translation, a mirror  
transformation (relative to a point, an axis or a plane), a  
scaling transformation, a compound transformation or  
some other type of transformation.") Form;
		gp_TrsfForm Form ();
		%feature("autodoc", "Args:
	None
Returns:
	None

verify and set the shape of the GTrsf Other or CompoundTrsf  
 Ex :  
 myGTrsf.SetValue(row1,col1,val1);  
 myGTrsf.SetValue(row2,col2,val2);  
 ...  
 myGTrsf.SetForm();") SetForm;
		void SetForm ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_XYZ

Returns the translation part of the GTrsf.") TranslationPart;
		const gp_XYZ & TranslationPart ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Mat

Computes the vectorial part of the GTrsf. The returned Matrix  
 is a  3*3 matrix.") VectorialPart;
		const gp_Mat & VectorialPart ();
		%feature("autodoc", "Args:
	Row(Standard_Integer)
	Col(Standard_Integer)

Returns:
	Standard_Real

Returns the coefficients of the global matrix of transformation.  
Raises OutOfRange if Row < 1 or Row > 3 or Col < 1 or Col > 4") Value;
		Standard_Real Value (const Standard_Integer Row,const Standard_Integer Col);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Invert;
		void Invert ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_GTrsf

Computes the reverse transformation.  
 Raises an exception if the matrix of the transformation  
 is not inversible.") Inverted;
		gp_GTrsf Inverted ();
		%feature("autodoc", "Args:
	T(gp_GTrsf)

Returns:
	None

Computes the transformation composed from T and <self>.  
 In a C++ implementation you can also write Tcomposed = <self> * T.  
Example :  
     GTrsf T1, T2, Tcomp; ...............  
     //composition :  
       Tcomp = T2.Multiplied(T1);         // or   (Tcomp = T2 * T1)  
     // transformation of a point  
       XYZ P(10.,3.,4.);  
       XYZ P1(P);  
       Tcomp.Transforms(P1);               //using Tcomp  
       XYZ P2(P);  
       T1.Transforms(P2);                  //using T1 then T2  
       T2.Transforms(P2);                  // P1 = P2 !!!  
C++: alias operator *=") Multiply;
		void Multiply (const gp_GTrsf  T);
		%feature("autodoc", "Args:
	T(gp_GTrsf)

Returns:
	gp_GTrsf

Computes the transformation composed with <self> and T.  
 <self> = T * <self>") Multiplied;
		gp_GTrsf Multiplied (const gp_GTrsf  T);
		%feature("autodoc", "Args:
	T(gp_GTrsf)

Returns:
	None

Computes the product of the transformation T and this  
transformation and assigns the result to this transformation.  
this = T * this") PreMultiply;
		void PreMultiply (const gp_GTrsf  T);
		%feature("autodoc", "Args:
	N(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Power;
		void Power (const Standard_Integer N);
		%feature("autodoc", "Args:
	N(Standard_Integer)

Returns:
	gp_GTrsf

Computes:  
 -   the product of this transformation multiplied by itself  
  N times, if N is positive, or  
-   the product of the inverse of this transformation  
  multiplied by itself |N| times, if N is negative.  
  If N equals zero, the result is equal to the Identity  
 transformation.  
 I.e.:  <self> * <self> * .......* <self>, N time.  
 if N =0 <self> = Identity  
 if N < 0 <self> = <self>.Inverse() *...........* <self>.Inverse().  
 
 Raises an exception if N < 0 and if the matrix of the  
 transformation not inversible.") Powered;
		gp_GTrsf Powered (const Standard_Integer N);
		%feature("autodoc", "Args:
	Coord(gp_XYZ)

Returns:
	None

No detailed docstring for this function.") Transforms;
		void Transforms (gp_XYZ  Coord);
		%feature("autodoc", "Args:
	X(Standard_Real)
	Y(Standard_Real)
	Z(Standard_Real)

Returns:
	None

Transforms a triplet XYZ with a GTrsf.") Transforms;
		void Transforms (Standard_Real  X,Standard_Real  Y,Standard_Real  Z);
		%feature("autodoc", "Args:
	None
Returns:
	gp_Trsf

No detailed docstring for this function.") Trsf;
		gp_Trsf Trsf ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Mat

No detailed docstring for this function.") _CSFDB_Getgp_GTrsfmatrix;
		const gp_Mat & _CSFDB_Getgp_GTrsfmatrix ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_XYZ

No detailed docstring for this function.") _CSFDB_Getgp_GTrsfloc;
		const gp_XYZ & _CSFDB_Getgp_GTrsfloc ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_TrsfForm

No detailed docstring for this function.") _CSFDB_Getgp_GTrsfshape;
		gp_TrsfForm _CSFDB_Getgp_GTrsfshape ();
		%feature("autodoc", "Args:
	p(gp_TrsfForm)

Returns:
	None

No detailed docstring for this function.") _CSFDB_Setgp_GTrsfshape;
		void _CSFDB_Setgp_GTrsfshape (const gp_TrsfForm p);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") _CSFDB_Getgp_GTrsfscale;
		Standard_Real _CSFDB_Getgp_GTrsfscale ();
		%feature("autodoc", "Args:
	p(Standard_Real)

Returns:
	None

No detailed docstring for this function.") _CSFDB_Setgp_GTrsfscale;
		void _CSFDB_Setgp_GTrsfscale (const Standard_Real p);
};


%feature("shadow") gp_GTrsf::~gp_GTrsf %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend gp_GTrsf {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor gp_GTrsf2d;
class gp_GTrsf2d {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

returns identity transformation.") gp_GTrsf2d;
		 gp_GTrsf2d ();
		%feature("autodoc", "Args:
	T(gp_Trsf2d)

Returns:
	None

Converts the gp_Trsf2d transformation T into a  
  general transformation.") gp_GTrsf2d;
		 gp_GTrsf2d (const gp_Trsf2d  T);
		%feature("autodoc", "Args:
	M(gp_Mat2d)
	V(gp_XY)

Returns:
	None

Creates   a transformation based on the matrix M and the  
   vector V where M defines the vectorial part of the  
   transformation, and V the translation part.") gp_GTrsf2d;
		 gp_GTrsf2d (const gp_Mat2d  M,const gp_XY  V);
		%feature("autodoc", "Args:
	A(gp_Ax2d)
	Ratio(Standard_Real)

Returns:
	None

Changes this transformation into an affinity of ratio Ratio  
with respect to the axis A.  
Note: An affinity is a point-by-point transformation that  
transforms any point P into a point P' such that if H is  
the orthogonal projection of P on the axis A, the vectors  
HP and HP' satisfy: HP' = Ratio * HP.") SetAffinity;
		void SetAffinity (const gp_Ax2d  A,const Standard_Real Ratio);
		%feature("autodoc", "Args:
	Row(Standard_Integer)
	Col(Standard_Integer)
	Value(Standard_Real)

Returns:
	None

Replaces   the coefficient (Row, Col) of the matrix representing  
 this transformation by Value,  
Raises OutOfRange if Row < 1 or Row > 2 or Col < 1 or Col > 3") SetValue;
		void SetValue (const Standard_Integer Row,const Standard_Integer Col,const Standard_Real Value);
		%feature("autodoc", "Args:
	Coord(gp_XY)

Returns:
	None

Replacesthe translation part of this  
transformation by the coordinates of the number pair Coord.") SetTranslationPart;
		void SetTranslationPart (const gp_XY  Coord);
		%feature("autodoc", "Args:
	T(gp_Trsf2d)

Returns:
	None

Assigns the vectorial and translation parts of T to this transformation.") SetTrsf2d;
		void SetTrsf2d (const gp_Trsf2d  T);
		%feature("autodoc", "Args:
	Matrix(gp_Mat2d)

Returns:
	None

Replaces the vectorial part of this transformation by Matrix.") SetVectorialPart;
		void SetVectorialPart (const gp_Mat2d  Matrix);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns true if the determinant of the vectorial part of  
this transformation is negative.") IsNegative;
		Standard_Boolean IsNegative ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns true if this transformation is singular (and  
therefore, cannot be inverted).  
Note: The Gauss LU decomposition is used to invert the  
transformation matrix. Consequently, the transformation  
is considered as singular if the largest pivot found is less  
than or equal to gp::Resolution().  
Warning  
If this transformation is singular, it cannot be inverted.") IsSingular;
		Standard_Boolean IsSingular ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_TrsfForm

Returns the nature of the transformation.  It can be  
 an identity transformation, a rotation, a translation, a mirror  
transformation (relative to a point or axis), a scaling  
transformation, a compound transformation or some  
other type of transformation.") Form;
		gp_TrsfForm Form ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_XY

Returns the translation part of the GTrsf2d.") TranslationPart;
		const gp_XY & TranslationPart ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Mat2d

Computes the vectorial part of the GTrsf2d. The returned  
 Matrix is a 2*2 matrix.") VectorialPart;
		const gp_Mat2d & VectorialPart ();
		%feature("autodoc", "Args:
	Row(Standard_Integer)
	Col(Standard_Integer)

Returns:
	Standard_Real

Returns the coefficients of the global matrix of transformation.  
Raised OutOfRange if Row < 1 or Row > 2 or Col < 1 or Col > 3") Value;
		Standard_Real Value (const Standard_Integer Row,const Standard_Integer Col);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Invert;
		void Invert ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_GTrsf2d

Computes the reverse transformation.  
 Raised an exception if the matrix of the transformation  
 is not inversible.") Inverted;
		gp_GTrsf2d Inverted ();
		%feature("autodoc", "Args:
	T(gp_GTrsf2d)

Returns:
	None

No detailed docstring for this function.") Multiply;
		void Multiply (const gp_GTrsf2d  T);
		%feature("autodoc", "Args:
	T(gp_GTrsf2d)

Returns:
	None

No detailed docstring for this function.") operator*=;
		void operator *= (const gp_GTrsf2d  T);
		%feature("autodoc", "Args:
	T(gp_GTrsf2d)

Returns:
	gp_GTrsf2d

Computes the transformation composed with T and <self>.  
 In a C++ implementation you can also write Tcomposed = <self> * T.  
 Example :  
     GTrsf2d T1, T2, Tcomp; ...............  
     //composition :  
       Tcomp = T2.Multiplied(T1);         // or   (Tcomp = T2 * T1)  
     // transformation of a point  
       XY P(10.,3.);  
       XY P1(P);  
       Tcomp.Transforms(P1);               //using Tcomp  
       XY P2(P);  
       T1.Transforms(P2);                  //using T1 then T2  
       T2.Transforms(P2);                  // P1 = P2 !!!") Multiplied;
		gp_GTrsf2d Multiplied (const gp_GTrsf2d  T);
		%feature("autodoc", "Args:
	T(gp_GTrsf2d)

Returns:
	gp_GTrsf2d

No detailed docstring for this function.") operator*;
		gp_GTrsf2d operator * (const gp_GTrsf2d  T);
		%feature("autodoc", "Args:
	T(gp_GTrsf2d)

Returns:
	None

Computes the product of the transformation T and this  
transformation, and assigns the result to this transformation:  
this = T * this") PreMultiply;
		void PreMultiply (const gp_GTrsf2d  T);
		%feature("autodoc", "Args:
	N(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Power;
		void Power (const Standard_Integer N);
		%feature("autodoc", "Args:
	N(Standard_Integer)

Returns:
	gp_GTrsf2d

Computes the following composition of transformations  
 <self> * <self> * .......* <self>, N time.  
 if N = 0 <self> = Identity  
 if N < 0 <self> = <self>.Inverse() *...........* <self>.Inverse().  
 
 Raises an exception if N < 0 and if the matrix of the  
 transformation is not inversible.") Powered;
		gp_GTrsf2d Powered (const Standard_Integer N);
		%feature("autodoc", "Args:
	Coord(gp_XY)

Returns:
	None

No detailed docstring for this function.") Transforms;
		void Transforms (gp_XY  Coord);
		%feature("autodoc", "Args:
	Coord(gp_XY)

Returns:
	gp_XY

No detailed docstring for this function.") Transformed;
		gp_XY Transformed (const gp_XY  Coord);
		%feature("autodoc", "Args:
	X(Standard_Real)
	Y(Standard_Real)

Returns:
	None

Applies this transformation to the coordinates:  
-   of the number pair Coord, or  
-   X and Y.  
 
Note:  
-   Transforms modifies X, Y, or the coordinate pair Coord, while  
-   Transformed creates a new coordinate pair.") Transforms;
		void Transforms (Standard_Real  X,Standard_Real  Y);
		%feature("autodoc", "Args:
	None
Returns:
	gp_Trsf2d

Converts this transformation into a gp_Trsf2d transformation.  
Exceptions  
Standard_ConstructionError if this transformation  
cannot be converted, i.e. if its form is gp_Other.") Trsf2d;
		gp_Trsf2d Trsf2d ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Mat2d

No detailed docstring for this function.") _CSFDB_Getgp_GTrsf2dmatrix;
		const gp_Mat2d & _CSFDB_Getgp_GTrsf2dmatrix ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_XY

No detailed docstring for this function.") _CSFDB_Getgp_GTrsf2dloc;
		const gp_XY & _CSFDB_Getgp_GTrsf2dloc ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_TrsfForm

No detailed docstring for this function.") _CSFDB_Getgp_GTrsf2dshape;
		gp_TrsfForm _CSFDB_Getgp_GTrsf2dshape ();
		%feature("autodoc", "Args:
	p(gp_TrsfForm)

Returns:
	None

No detailed docstring for this function.") _CSFDB_Setgp_GTrsf2dshape;
		void _CSFDB_Setgp_GTrsf2dshape (const gp_TrsfForm p);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") _CSFDB_Getgp_GTrsf2dscale;
		Standard_Real _CSFDB_Getgp_GTrsf2dscale ();
		%feature("autodoc", "Args:
	p(Standard_Real)

Returns:
	None

No detailed docstring for this function.") _CSFDB_Setgp_GTrsf2dscale;
		void _CSFDB_Setgp_GTrsf2dscale (const Standard_Real p);
};


%feature("shadow") gp_GTrsf2d::~gp_GTrsf2d %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend gp_GTrsf2d {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor gp_Hypr;
class gp_Hypr {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

Creates of an indefinite hyperbola.") gp_Hypr;
		 gp_Hypr ();
		%feature("autodoc", "Args:
	A2(gp_Ax2)
	MajorRadius(Standard_Real)
	MinorRadius(Standard_Real)

Returns:
	None

Creates a hyperbola with radii MajorRadius and  
  MinorRadius, positioned in the space by the  
  coordinate system A2 such that:  
  -   the origin of A2 is the center of the hyperbola,  
  -   the 'X Direction' of A2 defines the major axis of  
   the hyperbola, that is, the major radius  
   MajorRadius is measured along this axis, and  
  -   the 'Y Direction' of A2 defines the minor axis of  
   the hyperbola, that is, the minor radius  
   MinorRadius is measured along this axis.  
Note: This class does not prevent the creation of a  
hyperbola where:  
-   MajorAxis is equal to MinorAxis, or  
-   MajorAxis is less than MinorAxis.  
Exceptions  
Standard_ConstructionError if MajorAxis or MinorAxis is negative.  
    Raises ConstructionError if MajorRadius < 0.0 or MinorRadius < 0.0  Raised if MajorRadius < 0.0 or MinorRadius < 0.0") gp_Hypr;
		 gp_Hypr (const gp_Ax2  A2,const Standard_Real MajorRadius,const Standard_Real MinorRadius);
		%feature("autodoc", "Args:
	A1(gp_Ax1)

Returns:
	None

Modifies this hyperbola, by redefining its local coordinate  
system so that:  
-   its origin and 'main Direction' become those of the  
  axis A1 (the 'X Direction' and 'Y Direction' are then  
  recomputed in the same way as for any gp_Ax2).  
Raises ConstructionError if the direction of A1 is parallel to the direction of  
 the 'XAxis' of the hyperbola.") SetAxis;
		void SetAxis (const gp_Ax1  A1);
		%feature("autodoc", "Args:
	P(gp_Pnt)

Returns:
	None

Modifies this hyperbola, by redefining its local coordinate  
system so that its origin becomes P.") SetLocation;
		void SetLocation (const gp_Pnt  P);
		%feature("autodoc", "Args:
	MajorRadius(Standard_Real)

Returns:
	None

Modifies the major  radius of this hyperbola.  
Exceptions  
Standard_ConstructionError if MajorRadius is negative.") SetMajorRadius;
		void SetMajorRadius (const Standard_Real MajorRadius);
		%feature("autodoc", "Args:
	MinorRadius(Standard_Real)

Returns:
	None

Modifies the minor  radius of this hyperbola.  
Exceptions  
Standard_ConstructionError if MinorRadius is negative.") SetMinorRadius;
		void SetMinorRadius (const Standard_Real MinorRadius);
		%feature("autodoc", "Args:
	A2(gp_Ax2)

Returns:
	None

Modifies this hyperbola, by redefining its local coordinate  
system so that it becomes A2.") SetPosition;
		void SetPosition (const gp_Ax2  A2);
		%feature("autodoc", "Args:
	None
Returns:
	gp_Ax1

In the local coordinate system of the hyperbola the equation of  
 the hyperbola is (X*X)/(A*A) - (Y*Y)/(B*B) = 1.0 and the  
 equation of the first asymptote is Y = (B/A)*X  
 where A is the major radius and B is the minor radius. Raises ConstructionError if MajorRadius = 0.0") Asymptote1;
		gp_Ax1 Asymptote1 ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Ax1

In the local coordinate system of the hyperbola the equation of  
 the hyperbola is (X*X)/(A*A) - (Y*Y)/(B*B) = 1.0 and the  
 equation of the first asymptote is Y = -(B/A)*X.  
 where A is the major radius and B is the minor radius. Raises ConstructionError if MajorRadius = 0.0") Asymptote2;
		gp_Ax1 Asymptote2 ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Ax1

Returns the axis passing through the center,  
and normal to the plane of this hyperbola.") Axis;
		const gp_Ax1 & Axis ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Hypr

Computes the branch of hyperbola which is on the positive side of the  
 'YAxis' of <self>.") ConjugateBranch1;
		gp_Hypr ConjugateBranch1 ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Hypr

Computes the branch of hyperbola which is on the negative side of the  
 'YAxis' of <self>.") ConjugateBranch2;
		gp_Hypr ConjugateBranch2 ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Ax1

This directrix is the line normal to the XAxis of the hyperbola  
 in the local plane (Z = 0) at a distance d = MajorRadius / e  
 from the center of the hyperbola, where e is the eccentricity of  
 the hyperbola.  
 This line is parallel to the 'YAxis'. The intersection point  
 between the directrix1 and the 'XAxis' is the 'Location' point  
 of the directrix1. This point is on the positive side of the  
 'XAxis'.") Directrix1;
		gp_Ax1 Directrix1 ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Ax1

This line is obtained by the symmetrical transformation  
 of 'Directrix1' with respect to the 'YAxis' of the hyperbola.") Directrix2;
		gp_Ax1 Directrix2 ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

Returns the excentricity of the hyperbola (e > 1).  
 If f is the distance between the location of the hyperbola  
 and the Focus1 then the eccentricity e = f / MajorRadius. Raises DomainError if MajorRadius = 0.0") Eccentricity;
		Standard_Real Eccentricity ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

Computes the focal distance. It is the distance between the  
 the two focus of the hyperbola.") Focal;
		Standard_Real Focal ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Pnt

Returns the first focus of the hyperbola. This focus is on the  
 positive side of the 'XAxis' of the hyperbola.") Focus1;
		gp_Pnt Focus1 ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Pnt

Returns the second focus of the hyperbola. This focus is on the  
 negative side of the 'XAxis' of the hyperbola.") Focus2;
		gp_Pnt Focus2 ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Pnt

Returns  the location point of the hyperbola. It is the  
 intersection point between the 'XAxis' and the 'YAxis'.") Location;
		const gp_Pnt & Location ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

Returns the major radius of the hyperbola. It is the radius  
 on the 'XAxis' of the hyperbola.") MajorRadius;
		Standard_Real MajorRadius ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

Returns the minor radius of the hyperbola. It is the radius  
 on the 'YAxis' of the hyperbola.") MinorRadius;
		Standard_Real MinorRadius ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Hypr

Returns the branch of hyperbola obtained by doing the  
 symmetrical transformation of <self> with respect to the  
 'YAxis'  of <self>.") OtherBranch;
		gp_Hypr OtherBranch ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

Returns p = (e * e - 1) * MajorRadius where e is the  
 eccentricity of the hyperbola.  
Raises DomainError if MajorRadius = 0.0") Parameter;
		Standard_Real Parameter ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Ax2

Returns the coordinate system of the hyperbola.") Position;
		const gp_Ax2 & Position ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Ax1

Computes an axis, whose  
-   the origin is the center of this hyperbola, and  
-   the unit vector is the 'X Direction'  
  of the local coordinate system of this hyperbola.  
These axes are, the major axis (the 'X  
Axis') and  of this hyperboReturns the 'XAxis' of the hyperbola.") XAxis;
		gp_Ax1 XAxis ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Ax1

Computes an axis, whose  
-   the origin is the center of this hyperbola, and  
-   the unit vector is the 'Y Direction'  
  of the local coordinate system of this hyperbola.  
These axes are the minor axis (the 'Y Axis') of this hyperbola") YAxis;
		gp_Ax1 YAxis ();
		%feature("autodoc", "Args:
	P(gp_Pnt)

Returns:
	None

No detailed docstring for this function.") Mirror;
		void Mirror (const gp_Pnt  P);
		%feature("autodoc", "Args:
	P(gp_Pnt)

Returns:
	gp_Hypr

Performs the symmetrical transformation of an hyperbola with  
 respect  to the point P which is the center of the symmetry.") Mirrored;
		gp_Hypr Mirrored (const gp_Pnt  P);
		%feature("autodoc", "Args:
	A1(gp_Ax1)

Returns:
	None

No detailed docstring for this function.") Mirror;
		void Mirror (const gp_Ax1  A1);
		%feature("autodoc", "Args:
	A1(gp_Ax1)

Returns:
	gp_Hypr

Performs the symmetrical transformation of an hyperbola with  
 respect to an axis placement which is the axis of the symmetry.") Mirrored;
		gp_Hypr Mirrored (const gp_Ax1  A1);
		%feature("autodoc", "Args:
	A2(gp_Ax2)

Returns:
	None

No detailed docstring for this function.") Mirror;
		void Mirror (const gp_Ax2  A2);
		%feature("autodoc", "Args:
	A2(gp_Ax2)

Returns:
	gp_Hypr

Performs the symmetrical transformation of an hyperbola with  
 respect to a plane. The axis placement A2 locates the plane  
 of the symmetry (Location, XDirection, YDirection).") Mirrored;
		gp_Hypr Mirrored (const gp_Ax2  A2);
		%feature("autodoc", "Args:
	A1(gp_Ax1)
	Ang(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Rotate;
		void Rotate (const gp_Ax1  A1,const Standard_Real Ang);
		%feature("autodoc", "Args:
	A1(gp_Ax1)
	Ang(Standard_Real)

Returns:
	gp_Hypr

Rotates an hyperbola. A1 is the axis of the rotation.  
 Ang is the angular value of the rotation in radians.") Rotated;
		gp_Hypr Rotated (const gp_Ax1  A1,const Standard_Real Ang);
		%feature("autodoc", "Args:
	P(gp_Pnt)
	S(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Scale;
		void Scale (const gp_Pnt  P,const Standard_Real S);
		%feature("autodoc", "Args:
	P(gp_Pnt)
	S(Standard_Real)

Returns:
	gp_Hypr

Scales an hyperbola. S is the scaling value.") Scaled;
		gp_Hypr Scaled (const gp_Pnt  P,const Standard_Real S);
		%feature("autodoc", "Args:
	T(gp_Trsf)

Returns:
	None

No detailed docstring for this function.") Transform;
		void Transform (const gp_Trsf  T);
		%feature("autodoc", "Args:
	T(gp_Trsf)

Returns:
	gp_Hypr

Transforms an hyperbola with the transformation T from  
 class Trsf.") Transformed;
		gp_Hypr Transformed (const gp_Trsf  T);
		%feature("autodoc", "Args:
	V(gp_Vec)

Returns:
	None

No detailed docstring for this function.") Translate;
		void Translate (const gp_Vec  V);
		%feature("autodoc", "Args:
	V(gp_Vec)

Returns:
	gp_Hypr

Translates an hyperbola in the direction of the vector V.  
 The magnitude of the translation is the vector's magnitude.") Translated;
		gp_Hypr Translated (const gp_Vec  V);
		%feature("autodoc", "Args:
	P1(gp_Pnt)
	P2(gp_Pnt)

Returns:
	None

No detailed docstring for this function.") Translate;
		void Translate (const gp_Pnt  P1,const gp_Pnt  P2);
		%feature("autodoc", "Args:
	P1(gp_Pnt)
	P2(gp_Pnt)

Returns:
	gp_Hypr

Translates an hyperbola from the point P1 to the point P2.") Translated;
		gp_Hypr Translated (const gp_Pnt  P1,const gp_Pnt  P2);
		%feature("autodoc", "Args:
	None
Returns:
	gp_Ax2

No detailed docstring for this function.") _CSFDB_Getgp_Hyprpos;
		const gp_Ax2 & _CSFDB_Getgp_Hyprpos ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") _CSFDB_Getgp_HyprmajorRadius;
		Standard_Real _CSFDB_Getgp_HyprmajorRadius ();
		%feature("autodoc", "Args:
	p(Standard_Real)

Returns:
	None

No detailed docstring for this function.") _CSFDB_Setgp_HyprmajorRadius;
		void _CSFDB_Setgp_HyprmajorRadius (const Standard_Real p);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") _CSFDB_Getgp_HyprminorRadius;
		Standard_Real _CSFDB_Getgp_HyprminorRadius ();
		%feature("autodoc", "Args:
	p(Standard_Real)

Returns:
	None

No detailed docstring for this function.") _CSFDB_Setgp_HyprminorRadius;
		void _CSFDB_Setgp_HyprminorRadius (const Standard_Real p);
};


%feature("shadow") gp_Hypr::~gp_Hypr %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend gp_Hypr {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor gp_Hypr2d;
class gp_Hypr2d {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

Creates of an indefinite hyperbola.") gp_Hypr2d;
		 gp_Hypr2d ();
		%feature("autodoc", "Args:
	MajorAxis(gp_Ax2d)
	MajorRadius(Standard_Real)
	MinorRadius(Standard_Real)
	Sense(Standard_Boolean)=Standard_True

Returns:
	None

Creates a hyperbola with radii MajorRadius and  
  MinorRadius, centered on the origin of MajorAxis  
  and where the unit vector of MajorAxis is the 'X  
  Direction' of the local coordinate system of the  
  hyperbola. This coordinate system is direct if Sense  
  is true (the default value), and indirect if Sense is false.  
 Warnings :  
 It is yet  possible to create an Hyperbola with  
 MajorRadius <= MinorRadius.  
Raises ConstructionError if MajorRadius < 0.0 or MinorRadius < 0.0") gp_Hypr2d;
		 gp_Hypr2d (const gp_Ax2d  MajorAxis,const Standard_Real MajorRadius,const Standard_Real MinorRadius,const Standard_Boolean Sense = Standard_True);
		%feature("autodoc", "Args:
	A(gp_Ax22d)
	MajorRadius(Standard_Real)
	MinorRadius(Standard_Real)

Returns:
	None

a hyperbola with radii MajorRadius and  
  MinorRadius, positioned in the plane by coordinate system A where:  
  -   the origin of A is the center of the hyperbola,  
  -   the 'X Direction' of A defines the major axis of  
   the hyperbola, that is, the major radius  
   MajorRadius is measured along this axis, and  
  -   the 'Y Direction' of A defines the minor axis of  
   the hyperbola, that is, the minor radius  
   MinorRadius is measured along this axis, and  
  -   the orientation (direct or indirect sense) of A  
   gives the implicit orientation of the hyperbola.  
 Warnings :  
 It is yet  possible to create an Hyperbola with  
 MajorRadius <= MinorRadius.  
Raises ConstructionError if MajorRadius < 0.0 or MinorRadius < 0.0") gp_Hypr2d;
		 gp_Hypr2d (const gp_Ax22d  A,const Standard_Real MajorRadius,const Standard_Real MinorRadius);
		%feature("autodoc", "Args:
	P(gp_Pnt2d)

Returns:
	None

Modifies this hyperbola, by redefining its local  
coordinate system so that its origin becomes P.") SetLocation;
		void SetLocation (const gp_Pnt2d  P);
		%feature("autodoc", "Args:
	MajorRadius(Standard_Real)

Returns:
	None

Modifies the major or minor radius of this hyperbola.  
Exceptions  
Standard_ConstructionError if MajorRadius or  
MinorRadius is negative.") SetMajorRadius;
		void SetMajorRadius (const Standard_Real MajorRadius);
		%feature("autodoc", "Args:
	MinorRadius(Standard_Real)

Returns:
	None

Modifies the major or minor radius of this hyperbola.  
Exceptions  
Standard_ConstructionError if MajorRadius or  
MinorRadius is negative.") SetMinorRadius;
		void SetMinorRadius (const Standard_Real MinorRadius);
		%feature("autodoc", "Args:
	A(gp_Ax22d)

Returns:
	None

Modifies this hyperbola, by redefining its local  
coordinate system so that it becomes A.") SetAxis;
		void SetAxis (const gp_Ax22d  A);
		%feature("autodoc", "Args:
	A(gp_Ax2d)

Returns:
	None

Changes the major axis of the hyperbola. The minor axis is  
 recomputed and the location of the hyperbola too.") SetXAxis;
		void SetXAxis (const gp_Ax2d  A);
		%feature("autodoc", "Args:
	A(gp_Ax2d)

Returns:
	None

Changes the minor axis of the hyperbola.The minor axis is  
 recomputed and the location of the hyperbola too.") SetYAxis;
		void SetYAxis (const gp_Ax2d  A);
		%feature("autodoc", "Args:
	None
Returns:
	gp_Ax2d

In the local coordinate system of the hyperbola the equation of  
 the hyperbola is (X*X)/(A*A) - (Y*Y)/(B*B) = 1.0 and the  
 equation of the first asymptote is Y = (B/A)*X  
 where A is the major radius of the hyperbola and B the minor  
 radius of the hyperbola.  
Raises ConstructionError if MajorRadius = 0.0") Asymptote1;
		gp_Ax2d Asymptote1 ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Ax2d

In the local coordinate system of the hyperbola the equation of  
 the hyperbola is (X*X)/(A*A) - (Y*Y)/(B*B) = 1.0 and the  
 equation of the first asymptote is Y = -(B/A)*X  
 where A is the major radius of the hyperbola and B the minor  
 radius of the hyperbola.  
Raises ConstructionError if MajorRadius = 0.0") Asymptote2;
		gp_Ax2d Asymptote2 ();
		%feature("autodoc", "Args:
	A(Standard_Real)
	B(Standard_Real)
	C(Standard_Real)
	D(Standard_Real)
	E(Standard_Real)
	F(Standard_Real)

Returns:
	None

Computes the coefficients of the implicit equation of  
 the hyperbola :  
 A * (X**2) + B * (Y**2) + 2*C*(X*Y) + 2*D*X + 2*E*Y + F = 0.") Coefficients;
		void Coefficients (Standard_Real  A,Standard_Real  B,Standard_Real  C,Standard_Real  D,Standard_Real  E,Standard_Real  F);
		%feature("autodoc", "Args:
	None
Returns:
	gp_Hypr2d

Computes the branch of hyperbola which is on the positive side of the  
 'YAxis' of <self>.") ConjugateBranch1;
		gp_Hypr2d ConjugateBranch1 ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Hypr2d

Computes the branch of hyperbola which is on the negative side of the  
 'YAxis' of <self>.") ConjugateBranch2;
		gp_Hypr2d ConjugateBranch2 ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Ax2d

Computes the directrix which is the line normal to the XAxis of the hyperbola  
 in the local plane (Z = 0) at a distance d = MajorRadius / e  
 from the center of the hyperbola, where e is the eccentricity of  
 the hyperbola.  
 This line is parallel to the 'YAxis'. The intersection point  
 between the 'Directrix1' and the 'XAxis' is the 'Location' point  
 of the 'Directrix1'.  
 This point is on the positive side of the 'XAxis'.") Directrix1;
		gp_Ax2d Directrix1 ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Ax2d

This line is obtained by the symmetrical transformation  
 of 'Directrix1' with respect to the 'YAxis' of the hyperbola.") Directrix2;
		gp_Ax2d Directrix2 ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

Returns the excentricity of the hyperbola (e > 1).  
 If f is the distance between the location of the hyperbola  
 and the Focus1 then the eccentricity e = f / MajorRadius. Raises DomainError if MajorRadius = 0.0.") Eccentricity;
		Standard_Real Eccentricity ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

Computes the focal distance. It is the distance between the  
 'Location' of the hyperbola and 'Focus1' or 'Focus2'.") Focal;
		Standard_Real Focal ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Pnt2d

Returns the first focus of the hyperbola. This focus is on the  
 positive side of the 'XAxis' of the hyperbola.") Focus1;
		gp_Pnt2d Focus1 ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Pnt2d

Returns the second focus of the hyperbola. This focus is on the  
 negative side of the 'XAxis' of the hyperbola.") Focus2;
		gp_Pnt2d Focus2 ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Pnt2d

Returns  the location point of the hyperbola.  
 It is the intersection point between the 'XAxis' and  
 the 'YAxis'.") Location;
		const gp_Pnt2d & Location ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

Returns the major radius of the hyperbola (it is the radius  
 corresponding to the 'XAxis' of the hyperbola).") MajorRadius;
		Standard_Real MajorRadius ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

Returns the minor radius of the hyperbola (it is the radius  
 corresponding to the 'YAxis' of the hyperbola).") MinorRadius;
		Standard_Real MinorRadius ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Hypr2d

Returns the branch of hyperbola obtained by doing the  
 symmetrical transformation of <self> with respect to the  
 'YAxis' of <self>.") OtherBranch;
		gp_Hypr2d OtherBranch ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

Returns p = (e * e - 1) * MajorRadius where e is the  
 eccentricity of the hyperbola.  
Raises DomainError if MajorRadius = 0.0") Parameter;
		Standard_Real Parameter ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Ax22d

Returns the axisplacement of the hyperbola.") Axis;
		const gp_Ax22d & Axis ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Ax2d

Computes an axis whose  
-   the origin is the center of this hyperbola, and  
-   the unit vector is the 'X Direction' or 'Y Direction'  
respectively of the local coordinate system of this hyperbola  
       Returns the major axis of the hyperbola.") XAxis;
		gp_Ax2d XAxis ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Ax2d

Computes an axis whose  
-   the origin is the center of this hyperbola, and  
-   the unit vector is the 'X Direction' or 'Y Direction'  
 respectively of the local coordinate system of this hyperbola  
 Returns the minor axis of the hyperbola.") YAxis;
		gp_Ax2d YAxis ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Reverse;
		void Reverse ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Hypr2d

Reverses the orientation of the local coordinate system  
of this hyperbola (the 'Y Axis' is reversed). Therefore,  
the implicit orientation of this hyperbola is reversed.  
Note:  
-   Reverse assigns the result to this hyperbola, while  
-   Reversed creates a new one.") Reversed;
		gp_Hypr2d Reversed ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns true if the local coordinate system is direct  
           and false in the other case.") IsDirect;
		Standard_Boolean IsDirect ();
		%feature("autodoc", "Args:
	P(gp_Pnt2d)

Returns:
	None

No detailed docstring for this function.") Mirror;
		void Mirror (const gp_Pnt2d  P);
		%feature("autodoc", "Args:
	P(gp_Pnt2d)

Returns:
	gp_Hypr2d

Performs the symmetrical transformation of an hyperbola with  
 respect  to the point P which is the center of the symmetry.") Mirrored;
		gp_Hypr2d Mirrored (const gp_Pnt2d  P);
		%feature("autodoc", "Args:
	A(gp_Ax2d)

Returns:
	None

No detailed docstring for this function.") Mirror;
		void Mirror (const gp_Ax2d  A);
		%feature("autodoc", "Args:
	A(gp_Ax2d)

Returns:
	gp_Hypr2d

Performs the symmetrical transformation of an hyperbola with  
 respect to an axis placement which is the axis of the symmetry.") Mirrored;
		gp_Hypr2d Mirrored (const gp_Ax2d  A);
		%feature("autodoc", "Args:
	P(gp_Pnt2d)
	Ang(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Rotate;
		void Rotate (const gp_Pnt2d  P,const Standard_Real Ang);
		%feature("autodoc", "Args:
	P(gp_Pnt2d)
	Ang(Standard_Real)

Returns:
	gp_Hypr2d

Rotates an hyperbola. P is the center of the rotation.  
 Ang is the angular value of the rotation in radians.") Rotated;
		gp_Hypr2d Rotated (const gp_Pnt2d  P,const Standard_Real Ang);
		%feature("autodoc", "Args:
	P(gp_Pnt2d)
	S(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Scale;
		void Scale (const gp_Pnt2d  P,const Standard_Real S);
		%feature("autodoc", "Args:
	P(gp_Pnt2d)
	S(Standard_Real)

Returns:
	gp_Hypr2d

Scales an hyperbola. <S> is the scaling value.  
 If <S> is positive only the location point is  
 modified. But if <S> is negative the 'XAxis' is  
 reversed and the 'YAxis' too.") Scaled;
		gp_Hypr2d Scaled (const gp_Pnt2d  P,const Standard_Real S);
		%feature("autodoc", "Args:
	T(gp_Trsf2d)

Returns:
	None

No detailed docstring for this function.") Transform;
		void Transform (const gp_Trsf2d  T);
		%feature("autodoc", "Args:
	T(gp_Trsf2d)

Returns:
	gp_Hypr2d

Transforms an hyperbola with the transformation T from  
 class Trsf2d.") Transformed;
		gp_Hypr2d Transformed (const gp_Trsf2d  T);
		%feature("autodoc", "Args:
	V(gp_Vec2d)

Returns:
	None

No detailed docstring for this function.") Translate;
		void Translate (const gp_Vec2d  V);
		%feature("autodoc", "Args:
	V(gp_Vec2d)

Returns:
	gp_Hypr2d

Translates an hyperbola in the direction of the vector V.  
 The magnitude of the translation is the vector's magnitude.") Translated;
		gp_Hypr2d Translated (const gp_Vec2d  V);
		%feature("autodoc", "Args:
	P1(gp_Pnt2d)
	P2(gp_Pnt2d)

Returns:
	None

No detailed docstring for this function.") Translate;
		void Translate (const gp_Pnt2d  P1,const gp_Pnt2d  P2);
		%feature("autodoc", "Args:
	P1(gp_Pnt2d)
	P2(gp_Pnt2d)

Returns:
	gp_Hypr2d

Translates an hyperbola from the point P1 to the point P2.") Translated;
		gp_Hypr2d Translated (const gp_Pnt2d  P1,const gp_Pnt2d  P2);
		%feature("autodoc", "Args:
	None
Returns:
	gp_Ax22d

No detailed docstring for this function.") _CSFDB_Getgp_Hypr2dpos;
		const gp_Ax22d & _CSFDB_Getgp_Hypr2dpos ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") _CSFDB_Getgp_Hypr2dmajorRadius;
		Standard_Real _CSFDB_Getgp_Hypr2dmajorRadius ();
		%feature("autodoc", "Args:
	p(Standard_Real)

Returns:
	None

No detailed docstring for this function.") _CSFDB_Setgp_Hypr2dmajorRadius;
		void _CSFDB_Setgp_Hypr2dmajorRadius (const Standard_Real p);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") _CSFDB_Getgp_Hypr2dminorRadius;
		Standard_Real _CSFDB_Getgp_Hypr2dminorRadius ();
		%feature("autodoc", "Args:
	p(Standard_Real)

Returns:
	None

No detailed docstring for this function.") _CSFDB_Setgp_Hypr2dminorRadius;
		void _CSFDB_Setgp_Hypr2dminorRadius (const Standard_Real p);
};


%feature("shadow") gp_Hypr2d::~gp_Hypr2d %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend gp_Hypr2d {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor gp_Lin;
class gp_Lin {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

Creates a Line corresponding to Z axis of the  
           reference coordinate system.") gp_Lin;
		 gp_Lin ();
		%feature("autodoc", "Args:
	A1(gp_Ax1)

Returns:
	None

Creates a line defined by axis A1.") gp_Lin;
		 gp_Lin (const gp_Ax1  A1);
		%feature("autodoc", "Args:
	P(gp_Pnt)
	V(gp_Dir)

Returns:
	None

Creates a line passing through point P and parallel to  
 vector V (P and V are, respectively, the origin and  
the unit vector of the positioning axis of the line).") gp_Lin;
		 gp_Lin (const gp_Pnt  P,const gp_Dir  V);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Reverse;
		void Reverse ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Lin

Reverses the direction of the line.  
Note:  
-   Reverse assigns the result to this line, while  
-   Reversed creates a new one.") Reversed;
		gp_Lin Reversed ();
		%feature("autodoc", "Args:
	V(gp_Dir)

Returns:
	None

Changes the direction of the line.") SetDirection;
		void SetDirection (const gp_Dir  V);
		%feature("autodoc", "Args:
	P(gp_Pnt)

Returns:
	None

Changes the location point (origin) of the line.") SetLocation;
		void SetLocation (const gp_Pnt  P);
		%feature("autodoc", "Args:
	A1(gp_Ax1)

Returns:
	None

Complete redefinition of the line.  
 The 'Location' point of <A1> is the origin of the line.  
 The 'Direction' of <A1> is  the direction of the line.") SetPosition;
		void SetPosition (const gp_Ax1  A1);
		%feature("autodoc", "Args:
	None
Returns:
	gp_Dir

Returns the direction of the line.") Direction;
		const gp_Dir & Direction ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Pnt

Returns the location point (origin) of the line.") Location;
		const gp_Pnt & Location ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Ax1

Returns the axis placement one axis whith the same  
 location and direction as <self>.") Position;
		const gp_Ax1 & Position ();
		%feature("autodoc", "Args:
	Other(gp_Lin)

Returns:
	Standard_Real

Computes the angle between two lines in radians.") Angle;
		Standard_Real Angle (const gp_Lin  Other);
		%feature("autodoc", "Args:
	P(gp_Pnt)
	LinearTolerance(Standard_Real)

Returns:
	Standard_Boolean

Returns true if this line contains the point P, that is, if the  
distance between point P and this line is less than or  
equal to LinearTolerance..") Contains;
		Standard_Boolean Contains (const gp_Pnt  P,const Standard_Real LinearTolerance);
		%feature("autodoc", "Args:
	P(gp_Pnt)

Returns:
	Standard_Real

Computes the distance between <self> and the point P.") Distance;
		Standard_Real Distance (const gp_Pnt  P);
		%feature("autodoc", "Args:
	Other(gp_Lin)

Returns:
	Standard_Real

Computes the distance between two lines.") Distance;
		Standard_Real Distance (const gp_Lin  Other);
		%feature("autodoc", "Args:
	P(gp_Pnt)

Returns:
	Standard_Real

Computes the square distance between <self> and the point P.") SquareDistance;
		Standard_Real SquareDistance (const gp_Pnt  P);
		%feature("autodoc", "Args:
	Other(gp_Lin)

Returns:
	Standard_Real

Computes the square distance between two lines.") SquareDistance;
		Standard_Real SquareDistance (const gp_Lin  Other);
		%feature("autodoc", "Args:
	P(gp_Pnt)

Returns:
	gp_Lin

Computes the line normal to the direction of <self>, passing  
 through the point P.  Raises ConstructionError  
 if the distance between <self> and the point P is lower  
 or equal to Resolution from gp because there is an infinity of  
 solutions in 3D space.") Normal;
		gp_Lin Normal (const gp_Pnt  P);
		%feature("autodoc", "Args:
	P(gp_Pnt)

Returns:
	None

No detailed docstring for this function.") Mirror;
		void Mirror (const gp_Pnt  P);
		%feature("autodoc", "Args:
	P(gp_Pnt)

Returns:
	gp_Lin

Performs the symmetrical transformation of a line  
 with respect to the point P which is the center of  
 the symmetry.") Mirrored;
		gp_Lin Mirrored (const gp_Pnt  P);
		%feature("autodoc", "Args:
	A1(gp_Ax1)

Returns:
	None

No detailed docstring for this function.") Mirror;
		void Mirror (const gp_Ax1  A1);
		%feature("autodoc", "Args:
	A1(gp_Ax1)

Returns:
	gp_Lin

Performs the symmetrical transformation of a line  
 with respect to an axis placement which is the axis  
 of the symmetry.") Mirrored;
		gp_Lin Mirrored (const gp_Ax1  A1);
		%feature("autodoc", "Args:
	A2(gp_Ax2)

Returns:
	None

No detailed docstring for this function.") Mirror;
		void Mirror (const gp_Ax2  A2);
		%feature("autodoc", "Args:
	A2(gp_Ax2)

Returns:
	gp_Lin

Performs the symmetrical transformation of a line  
 with respect to a plane. The axis placement  <A2>  
 locates the plane of the symmetry :  
 (Location, XDirection, YDirection).") Mirrored;
		gp_Lin Mirrored (const gp_Ax2  A2);
		%feature("autodoc", "Args:
	A1(gp_Ax1)
	Ang(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Rotate;
		void Rotate (const gp_Ax1  A1,const Standard_Real Ang);
		%feature("autodoc", "Args:
	A1(gp_Ax1)
	Ang(Standard_Real)

Returns:
	gp_Lin

Rotates a line. A1 is the axis of the rotation.  
 Ang is the angular value of the rotation in radians.") Rotated;
		gp_Lin Rotated (const gp_Ax1  A1,const Standard_Real Ang);
		%feature("autodoc", "Args:
	P(gp_Pnt)
	S(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Scale;
		void Scale (const gp_Pnt  P,const Standard_Real S);
		%feature("autodoc", "Args:
	P(gp_Pnt)
	S(Standard_Real)

Returns:
	gp_Lin

Scales a line. S is the scaling value.  
 The 'Location' point (origin) of the line is modified.  
 The 'Direction' is reversed if the scale is negative.") Scaled;
		gp_Lin Scaled (const gp_Pnt  P,const Standard_Real S);
		%feature("autodoc", "Args:
	T(gp_Trsf)

Returns:
	None

No detailed docstring for this function.") Transform;
		void Transform (const gp_Trsf  T);
		%feature("autodoc", "Args:
	T(gp_Trsf)

Returns:
	gp_Lin

Transforms a line with the transformation T from class Trsf.") Transformed;
		gp_Lin Transformed (const gp_Trsf  T);
		%feature("autodoc", "Args:
	V(gp_Vec)

Returns:
	None

No detailed docstring for this function.") Translate;
		void Translate (const gp_Vec  V);
		%feature("autodoc", "Args:
	V(gp_Vec)

Returns:
	gp_Lin

Translates a line in the direction of the vector V.  
 The magnitude of the translation is the vector's magnitude.") Translated;
		gp_Lin Translated (const gp_Vec  V);
		%feature("autodoc", "Args:
	P1(gp_Pnt)
	P2(gp_Pnt)

Returns:
	None

No detailed docstring for this function.") Translate;
		void Translate (const gp_Pnt  P1,const gp_Pnt  P2);
		%feature("autodoc", "Args:
	P1(gp_Pnt)
	P2(gp_Pnt)

Returns:
	gp_Lin

Translates a line from the point P1 to the point P2.") Translated;
		gp_Lin Translated (const gp_Pnt  P1,const gp_Pnt  P2);
		%feature("autodoc", "Args:
	None
Returns:
	gp_Ax1

No detailed docstring for this function.") _CSFDB_Getgp_Linpos;
		const gp_Ax1 & _CSFDB_Getgp_Linpos ();
};


%feature("shadow") gp_Lin::~gp_Lin %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend gp_Lin {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor gp_Lin2d;
class gp_Lin2d {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

Creates a Line corresponding to X axis of the  
           reference coordinate system.") gp_Lin2d;
		 gp_Lin2d ();
		%feature("autodoc", "Args:
	A(gp_Ax2d)

Returns:
	None

Creates a line located with A.") gp_Lin2d;
		 gp_Lin2d (const gp_Ax2d  A);
		%feature("autodoc", "Args:
	P(gp_Pnt2d)
	V(gp_Dir2d)

Returns:
	None

<P> is the location point (origin) of the line and  
 <V> is the direction of the line.") gp_Lin2d;
		 gp_Lin2d (const gp_Pnt2d  P,const gp_Dir2d  V);
		%feature("autodoc", "Args:
	A(Standard_Real)
	B(Standard_Real)
	C(Standard_Real)

Returns:
	None

Creates the line from the equation A*X + B*Y + C = 0.0 Raises ConstructionError if Sqrt(A*A + B*B) <= Resolution from gp.  Raised if Sqrt(A*A + B*B) <= Resolution from gp.") gp_Lin2d;
		 gp_Lin2d (const Standard_Real A,const Standard_Real B,const Standard_Real C);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Reverse;
		void Reverse ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Lin2d

Reverses the positioning axis of this line.  
Note:  
-   Reverse assigns the result to this line, while  
-   Reversed creates a new one.") Reversed;
		gp_Lin2d Reversed ();
		%feature("autodoc", "Args:
	V(gp_Dir2d)

Returns:
	None

Changes the direction of the line.") SetDirection;
		void SetDirection (const gp_Dir2d  V);
		%feature("autodoc", "Args:
	P(gp_Pnt2d)

Returns:
	None

Changes the origin of the line.") SetLocation;
		void SetLocation (const gp_Pnt2d  P);
		%feature("autodoc", "Args:
	A(gp_Ax2d)

Returns:
	None

Complete redefinition of the line.  
 The 'Location' point of <A> is the origin of the line.  
 The 'Direction' of <A> is  the direction of the line.") SetPosition;
		void SetPosition (const gp_Ax2d  A);
		%feature("autodoc", "Args:
	A(Standard_Real)
	B(Standard_Real)
	C(Standard_Real)

Returns:
	None

Returns the normalized coefficients of the line :  
 A * X + B * Y + C = 0.") Coefficients;
		void Coefficients (Standard_Real  A,Standard_Real  B,Standard_Real  C);
		%feature("autodoc", "Args:
	None
Returns:
	gp_Dir2d

Returns the direction of the line.") Direction;
		const gp_Dir2d & Direction ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Pnt2d

Returns the location point (origin) of the line.") Location;
		const gp_Pnt2d & Location ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Ax2d

Returns the axis placement one axis whith the same  
 location and direction as <self>.") Position;
		const gp_Ax2d & Position ();
		%feature("autodoc", "Args:
	Other(gp_Lin2d)

Returns:
	Standard_Real

Computes the angle between two lines in radians.") Angle;
		Standard_Real Angle (const gp_Lin2d  Other);
		%feature("autodoc", "Args:
	P(gp_Pnt2d)
	LinearTolerance(Standard_Real)

Returns:
	Standard_Boolean

Returns true if this line contains the point P, that is, if the  
distance between point P and this line is less than or  
equal to LinearTolerance.") Contains;
		Standard_Boolean Contains (const gp_Pnt2d  P,const Standard_Real LinearTolerance);
		%feature("autodoc", "Args:
	P(gp_Pnt2d)

Returns:
	Standard_Real

Computes the distance between <self> and the point <P>.") Distance;
		Standard_Real Distance (const gp_Pnt2d  P);
		%feature("autodoc", "Args:
	Other(gp_Lin2d)

Returns:
	Standard_Real

Computes the distance between two lines.") Distance;
		Standard_Real Distance (const gp_Lin2d  Other);
		%feature("autodoc", "Args:
	P(gp_Pnt2d)

Returns:
	Standard_Real

Computes the square distance between <self> and the point  
 <P>.") SquareDistance;
		Standard_Real SquareDistance (const gp_Pnt2d  P);
		%feature("autodoc", "Args:
	Other(gp_Lin2d)

Returns:
	Standard_Real

Computes the square distance between two lines.") SquareDistance;
		Standard_Real SquareDistance (const gp_Lin2d  Other);
		%feature("autodoc", "Args:
	P(gp_Pnt2d)

Returns:
	gp_Lin2d

Computes the line normal to the direction of <self>,  
 passing through the point <P>.") Normal;
		gp_Lin2d Normal (const gp_Pnt2d  P);
		%feature("autodoc", "Args:
	P(gp_Pnt2d)

Returns:
	None

No detailed docstring for this function.") Mirror;
		void Mirror (const gp_Pnt2d  P);
		%feature("autodoc", "Args:
	P(gp_Pnt2d)

Returns:
	gp_Lin2d

Performs the symmetrical transformation of a line  
 with respect to the point <P> which is the center  
 of the symmetry") Mirrored;
		gp_Lin2d Mirrored (const gp_Pnt2d  P);
		%feature("autodoc", "Args:
	A(gp_Ax2d)

Returns:
	None

No detailed docstring for this function.") Mirror;
		void Mirror (const gp_Ax2d  A);
		%feature("autodoc", "Args:
	A(gp_Ax2d)

Returns:
	gp_Lin2d

Performs the symmetrical transformation of a line  
 with respect to an axis placement which is the axis  
 of the symmetry.") Mirrored;
		gp_Lin2d Mirrored (const gp_Ax2d  A);
		%feature("autodoc", "Args:
	P(gp_Pnt2d)
	Ang(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Rotate;
		void Rotate (const gp_Pnt2d  P,const Standard_Real Ang);
		%feature("autodoc", "Args:
	P(gp_Pnt2d)
	Ang(Standard_Real)

Returns:
	gp_Lin2d

Rotates a line. P is the center of the rotation.  
 Ang is the angular value of the rotation in radians.") Rotated;
		gp_Lin2d Rotated (const gp_Pnt2d  P,const Standard_Real Ang);
		%feature("autodoc", "Args:
	P(gp_Pnt2d)
	S(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Scale;
		void Scale (const gp_Pnt2d  P,const Standard_Real S);
		%feature("autodoc", "Args:
	P(gp_Pnt2d)
	S(Standard_Real)

Returns:
	gp_Lin2d

Scales a line. S is the scaling value. Only the  
 origin of the line is modified.") Scaled;
		gp_Lin2d Scaled (const gp_Pnt2d  P,const Standard_Real S);
		%feature("autodoc", "Args:
	T(gp_Trsf2d)

Returns:
	None

No detailed docstring for this function.") Transform;
		void Transform (const gp_Trsf2d  T);
		%feature("autodoc", "Args:
	T(gp_Trsf2d)

Returns:
	gp_Lin2d

Transforms a line with the transformation T from class Trsf2d.") Transformed;
		gp_Lin2d Transformed (const gp_Trsf2d  T);
		%feature("autodoc", "Args:
	V(gp_Vec2d)

Returns:
	None

No detailed docstring for this function.") Translate;
		void Translate (const gp_Vec2d  V);
		%feature("autodoc", "Args:
	V(gp_Vec2d)

Returns:
	gp_Lin2d

Translates a line in the direction of the vector V.  
 The magnitude of the translation is the vector's magnitude.") Translated;
		gp_Lin2d Translated (const gp_Vec2d  V);
		%feature("autodoc", "Args:
	P1(gp_Pnt2d)
	P2(gp_Pnt2d)

Returns:
	None

No detailed docstring for this function.") Translate;
		void Translate (const gp_Pnt2d  P1,const gp_Pnt2d  P2);
		%feature("autodoc", "Args:
	P1(gp_Pnt2d)
	P2(gp_Pnt2d)

Returns:
	gp_Lin2d

Translates a line from the point P1 to the point P2.") Translated;
		gp_Lin2d Translated (const gp_Pnt2d  P1,const gp_Pnt2d  P2);
		%feature("autodoc", "Args:
	None
Returns:
	gp_Ax2d

No detailed docstring for this function.") _CSFDB_Getgp_Lin2dpos;
		const gp_Ax2d & _CSFDB_Getgp_Lin2dpos ();
};


%feature("shadow") gp_Lin2d::~gp_Lin2d %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend gp_Lin2d {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor gp_Mat;
class gp_Mat {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

creates  a matrix with null coefficients.") gp_Mat;
		 gp_Mat ();
		%feature("autodoc", "Args:
	a11(Standard_Real)
	a12(Standard_Real)
	a13(Standard_Real)
	a21(Standard_Real)
	a22(Standard_Real)
	a23(Standard_Real)
	a31(Standard_Real)
	a32(Standard_Real)
	a33(Standard_Real)

Returns:
	None

No detailed docstring for this function.") gp_Mat;
		 gp_Mat (const Standard_Real a11,const Standard_Real a12,const Standard_Real a13,const Standard_Real a21,const Standard_Real a22,const Standard_Real a23,const Standard_Real a31,const Standard_Real a32,const Standard_Real a33);
		%feature("autodoc", "Args:
	Col1(gp_XYZ)
	Col2(gp_XYZ)
	Col3(gp_XYZ)

Returns:
	None

Creates a matrix.  
 Col1, Col2, Col3 are the 3 columns of the matrix.") gp_Mat;
		 gp_Mat (const gp_XYZ  Col1,const gp_XYZ  Col2,const gp_XYZ  Col3);
		%feature("autodoc", "Args:
	Col(Standard_Integer)
	Value(gp_XYZ)

Returns:
	None

Assigns the three coordinates of Value to the column of index  
  Col of this matrix.  
Raises OutOfRange if Col < 1 or Col > 3.") SetCol;
		void SetCol (const Standard_Integer Col,const gp_XYZ  Value);
		%feature("autodoc", "Args:
	Col1(gp_XYZ)
	Col2(gp_XYZ)
	Col3(gp_XYZ)

Returns:
	None

Assigns the number triples Col1, Col2, Col3 to the three  
  columns of this matrix.") SetCols;
		void SetCols (const gp_XYZ  Col1,const gp_XYZ  Col2,const gp_XYZ  Col3);
		%feature("autodoc", "Args:
	Ref(gp_XYZ)

Returns:
	None

Modifies the matrix  M so that applying it to any number  
triple (X, Y, Z) produces the same result as the cross  
product of Ref and the number triple (X, Y, Z):  
i.e.: M * {X,Y,Z}t = Ref.Cross({X, Y ,Z})  
 this matrix is anti symmetric. To apply this matrix to the  
 triplet  {XYZ} is the same as to do the cross product between the  
 triplet Ref and the triplet {XYZ}.  
Note: this matrix is anti-symmetric.") SetCross;
		void SetCross (const gp_XYZ  Ref);
		%feature("autodoc", "Args:
	X1(Standard_Real)
	X2(Standard_Real)
	X3(Standard_Real)

Returns:
	None

Modifies the main diagonal of the matrix.  
 <self>.Value (1, 1) = X1  
 <self>.Value (2, 2) = X2  
 <self>.Value (3, 3) = X3  
 The other coefficients of the matrix are not modified.") SetDiagonal;
		void SetDiagonal (const Standard_Real X1,const Standard_Real X2,const Standard_Real X3);
		%feature("autodoc", "Args:
	Ref(gp_XYZ)

Returns:
	None

Modifies this matrix so that applying it to any number  
triple (X, Y, Z) produces the same result as the scalar  
product of Ref and the number triple (X, Y, Z):  
this * (X,Y,Z) = Ref.(X,Y,Z)  
Note: this matrix is symmetric.") SetDot;
		void SetDot (const gp_XYZ  Ref);
		%feature("autodoc", "Args:
	None
Returns:
	None

Modifies this matrix so that it represents the Identity matrix.") SetIdentity;
		void SetIdentity ();
		%feature("autodoc", "Args:
	Axis(gp_XYZ)
	Ang(Standard_Real)

Returns:
	None

Modifies this matrix so that it represents a rotation. Ang is the angular value in  
 radians and the XYZ axis gives the direction of the  
 rotation.  
 Raises ConstructionError if XYZ.Modulus() <= Resolution()") SetRotation;
		void SetRotation (const gp_XYZ  Axis,const Standard_Real Ang);
		%feature("autodoc", "Args:
	Row(Standard_Integer)
	Value(gp_XYZ)

Returns:
	None

Assigns the three coordinates of Value to the row of index  
  Row of this matrix. Raises OutOfRange if Row < 1 or Row > 3.") SetRow;
		void SetRow (const Standard_Integer Row,const gp_XYZ  Value);
		%feature("autodoc", "Args:
	Row1(gp_XYZ)
	Row2(gp_XYZ)
	Row3(gp_XYZ)

Returns:
	None

Assigns the number triples Row1, Row2, Row3 to the three  
  rows of this matrix.") SetRows;
		void SetRows (const gp_XYZ  Row1,const gp_XYZ  Row2,const gp_XYZ  Row3);
		%feature("autodoc", "Args:
	S(Standard_Real)

Returns:
	None

Modifies the the matrix so that it represents  
a scaling transformation, where S is the scale factor. :  
          | S    0.0  0.0 |  
  <self> =  | 0.0   S   0.0 |  
          | 0.0  0.0   S  |") SetScale;
		void SetScale (const Standard_Real S);
		%feature("autodoc", "Args:
	Row(Standard_Integer)
	Col(Standard_Integer)
	Value(Standard_Real)

Returns:
	None

Assigns <Value> to the coefficient of row Row, column Col of   this matrix.  
Raises OutOfRange if Row < 1 or Row > 3 or Col < 1 or Col > 3") SetValue;
		void SetValue (const Standard_Integer Row,const Standard_Integer Col,const Standard_Real Value);
		%feature("autodoc", "Args:
	Col(Standard_Integer)

Returns:
	gp_XYZ

Returns the column of Col index.  
  Raises OutOfRange if Col < 1 or Col > 3") Column;
		gp_XYZ Column (const Standard_Integer Col);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

Computes the determinant of the matrix.") Determinant;
		Standard_Real Determinant ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_XYZ

Returns the main diagonal of the matrix.") Diagonal;
		gp_XYZ Diagonal ();
		%feature("autodoc", "Args:
	Row(Standard_Integer)

Returns:
	gp_XYZ

returns the row of Row index.  
 Raises OutOfRange if Row < 1 or Row > 3") Row;
		gp_XYZ Row (const Standard_Integer Row);
		%feature("autodoc", "Args:
	Row(Standard_Integer)
	Col(Standard_Integer)

Returns:
	Standard_Real

Returns the coefficient of range (Row, Col)  
 Raises OutOfRange if Row < 1 or Row > 3 or Col < 1 or Col > 3") Value;
		const Standard_Real & Value (const Standard_Integer Row,const Standard_Integer Col);
		%feature("autodoc", "Args:
	Row(Standard_Integer)
	Col(Standard_Integer)

Returns:
	Standard_Real

Returns the coefficient of range (Row, Col)  
 Raises OutOfRange if Row < 1 or Row > 3 or Col < 1 or Col > 3") ChangeValue;
		Standard_Real & ChangeValue (const Standard_Integer Row,const Standard_Integer Col);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

The Gauss LU decomposition is used to invert the matrix  
 (see Math package) so the matrix is considered as singular if  
 the largest pivot found is lower or equal to Resolution from gp.") IsSingular;
		Standard_Boolean IsSingular ();
		%feature("autodoc", "Args:
	Other(gp_Mat)

Returns:
	None

No detailed docstring for this function.") Add;
		void Add (const gp_Mat  Other);
		%feature("autodoc", "Args:
	Other(gp_Mat)

Returns:
	None

No detailed docstring for this function.") operator+=;
		void operator += (const gp_Mat  Other);
		%feature("autodoc", "Args:
	Other(gp_Mat)

Returns:
	gp_Mat

Computes the sum of this matrix and  
 the matrix Other for each coefficient of the matrix :  
 <self>.Coef(i,j) + <Other>.Coef(i,j)") Added;
		gp_Mat Added (const gp_Mat  Other);
		%feature("autodoc", "Args:
	Other(gp_Mat)

Returns:
	gp_Mat

No detailed docstring for this function.") operator+;
		gp_Mat operator + (const gp_Mat  Other);
		%feature("autodoc", "Args:
	Scalar(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Divide;
		void Divide (const Standard_Real Scalar);
		%feature("autodoc", "Args:
	Scalar(Standard_Real)

Returns:
	None

No detailed docstring for this function.") operator/=;
		void operator /= (const Standard_Real Scalar);
		%feature("autodoc", "Args:
	Scalar(Standard_Real)

Returns:
	gp_Mat

Divides all the coefficients of the matrix by Scalar") Divided;
		gp_Mat Divided (const Standard_Real Scalar);
		%feature("autodoc", "Args:
	Scalar(Standard_Real)

Returns:
	gp_Mat

No detailed docstring for this function.") operator/;
		gp_Mat operator / (const Standard_Real Scalar);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Invert;
		void Invert ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Mat

Inverses the matrix and raises if the matrix is singular.  
-   Invert assigns the result to this matrix, while  
-   Inverted creates a new one.  
Warning  
The Gauss LU decomposition is used to invert the matrix.  
Consequently, the matrix is considered as singular if the  
largest pivot found is less than or equal to gp::Resolution().  
Exceptions  
Standard_ConstructionError if this matrix is singular,  
and therefore cannot be inverted.") Inverted;
		gp_Mat Inverted ();
		%feature("autodoc", "Args:
	Other(gp_Mat)

Returns:
	gp_Mat

Computes  the product of two matrices <self> * <Other>") Multiplied;
		gp_Mat Multiplied (const gp_Mat  Other);
		%feature("autodoc", "Args:
	Other(gp_Mat)

Returns:
	gp_Mat

No detailed docstring for this function.") operator*;
		gp_Mat operator * (const gp_Mat  Other);
		%feature("autodoc", "Args:
	Other(gp_Mat)

Returns:
	None

Computes the product of two matrices <self> = <Other> * <self>.") Multiply;
		void Multiply (const gp_Mat  Other);
		%feature("autodoc", "Args:
	Other(gp_Mat)

Returns:
	None

No detailed docstring for this function.") operator*=;
		void operator *= (const gp_Mat  Other);
		%feature("autodoc", "Args:
	Other(gp_Mat)

Returns:
	None

No detailed docstring for this function.") PreMultiply;
		void PreMultiply (const gp_Mat  Other);
		%feature("autodoc", "Args:
	Scalar(Standard_Real)

Returns:
	gp_Mat

No detailed docstring for this function.") Multiplied;
		gp_Mat Multiplied (const Standard_Real Scalar);
		%feature("autodoc", "Args:
	Scalar(Standard_Real)

Returns:
	gp_Mat

No detailed docstring for this function.") operator*;
		gp_Mat operator * (const Standard_Real Scalar);
		%feature("autodoc", "Args:
	Scalar(Standard_Real)

Returns:
	None

Multiplies all the coefficients of the matrix by Scalar") Multiply;
		void Multiply (const Standard_Real Scalar);
		%feature("autodoc", "Args:
	Scalar(Standard_Real)

Returns:
	None

No detailed docstring for this function.") operator*=;
		void operator *= (const Standard_Real Scalar);
		%feature("autodoc", "Args:
	N(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Power;
		void Power (const Standard_Integer N);
		%feature("autodoc", "Args:
	N(Standard_Integer)

Returns:
	gp_Mat

Computes <self> = <self> * <self> * .......* <self>,   N time.  
 if N = 0 <self> = Identity  
 if N < 0 <self> = <self>.Invert() *...........* <self>.Invert().  
 If N < 0 an exception will be raised if the matrix is not  
 inversible") Powered;
		gp_Mat Powered (const Standard_Integer N);
		%feature("autodoc", "Args:
	Other(gp_Mat)

Returns:
	None

No detailed docstring for this function.") Subtract;
		void Subtract (const gp_Mat  Other);
		%feature("autodoc", "Args:
	Other(gp_Mat)

Returns:
	None

No detailed docstring for this function.") operator-=;
		void operator -= (const gp_Mat  Other);
		%feature("autodoc", "Args:
	Other(gp_Mat)

Returns:
	gp_Mat

cOmputes for each coefficient of the matrix :  
 <self>.Coef(i,j) - <Other>.Coef(i,j)") Subtracted;
		gp_Mat Subtracted (const gp_Mat  Other);
		%feature("autodoc", "Args:
	Other(gp_Mat)

Returns:
	gp_Mat

No detailed docstring for this function.") operator-;
		gp_Mat operator - (const gp_Mat  Other);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Transpose;
		void Transpose ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Mat

Transposes the matrix. A(j, i) -> A (i, j)") Transposed;
		gp_Mat Transposed ();
		%feature("autodoc", "Args:
	i1(Standard_Integer)
	i2(Standard_Integer)

Returns:
	Standard_Real

No detailed docstring for this function.") _CSFDB_Getgp_Matmatrix;
		Standard_Real & _CSFDB_Getgp_Matmatrix (const Standard_Integer i1,const Standard_Integer i2);
};


%feature("shadow") gp_Mat::~gp_Mat %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend gp_Mat {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor gp_Mat2d;
class gp_Mat2d {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

Creates  a matrix with null coefficients.") gp_Mat2d;
		 gp_Mat2d ();
		%feature("autodoc", "Args:
	Col1(gp_XY)
	Col2(gp_XY)

Returns:
	None

Col1, Col2 are the 2 columns of the matrix.") gp_Mat2d;
		 gp_Mat2d (const gp_XY  Col1,const gp_XY  Col2);
		%feature("autodoc", "Args:
	Col(Standard_Integer)
	Value(gp_XY)

Returns:
	None

Assigns the two coordinates of Value to the column of range  
  Col of this matrix  
Raises OutOfRange if Col < 1 or Col > 2.") SetCol;
		void SetCol (const Standard_Integer Col,const gp_XY  Value);
		%feature("autodoc", "Args:
	Col1(gp_XY)
	Col2(gp_XY)

Returns:
	None

Assigns the number pairs Col1, Col2 to the two columns of   this matrix") SetCols;
		void SetCols (const gp_XY  Col1,const gp_XY  Col2);
		%feature("autodoc", "Args:
	X1(Standard_Real)
	X2(Standard_Real)

Returns:
	None

Modifies the main diagonal of the matrix.  
 <self>.Value (1, 1) = X1  
 <self>.Value (2, 2) = X2  
 The other coefficients of the matrix are not modified.") SetDiagonal;
		void SetDiagonal (const Standard_Real X1,const Standard_Real X2);
		%feature("autodoc", "Args:
	None
Returns:
	None

Modifies this matrix, so that it represents the Identity matrix.") SetIdentity;
		void SetIdentity ();
		%feature("autodoc", "Args:
	Ang(Standard_Real)

Returns:
	None

Modifies this matrix, so that it representso a rotation. Ang is the angular  
 value in radian of the rotation.") SetRotation;
		void SetRotation (const Standard_Real Ang);
		%feature("autodoc", "Args:
	Row(Standard_Integer)
	Value(gp_XY)

Returns:
	None

Assigns the two coordinates of Value to the row of index Row of this matrix.  
Raises OutOfRange if Row < 1 or Row > 2.") SetRow;
		void SetRow (const Standard_Integer Row,const gp_XY  Value);
		%feature("autodoc", "Args:
	Row1(gp_XY)
	Row2(gp_XY)

Returns:
	None

Assigns the number pairs Row1, Row2 to the two rows of this matrix.") SetRows;
		void SetRows (const gp_XY  Row1,const gp_XY  Row2);
		%feature("autodoc", "Args:
	S(Standard_Real)

Returns:
	None

Modifies the matrix such that it  
represents a scaling transformation, where S is the scale   factor :  
          | S    0.0 |  
  <self> =  | 0.0   S  |") SetScale;
		void SetScale (const Standard_Real S);
		%feature("autodoc", "Args:
	Row(Standard_Integer)
	Col(Standard_Integer)
	Value(Standard_Real)

Returns:
	None

Assigns <Value> to the coefficient of row Row, column Col of this matrix.  
Raises OutOfRange if Row < 1 or Row > 2 or Col < 1 or Col > 2") SetValue;
		void SetValue (const Standard_Integer Row,const Standard_Integer Col,const Standard_Real Value);
		%feature("autodoc", "Args:
	Col(Standard_Integer)

Returns:
	gp_XY

Returns the column of Col index.  
Raises OutOfRange if Col < 1 or Col > 2") Column;
		gp_XY Column (const Standard_Integer Col);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

Computes the determinant of the matrix.") Determinant;
		Standard_Real Determinant ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_XY

Returns the main diagonal of the matrix.") Diagonal;
		gp_XY Diagonal ();
		%feature("autodoc", "Args:
	Row(Standard_Integer)

Returns:
	gp_XY

Returns the row of index Row.  Raised if Row < 1 or Row > 2") Row;
		gp_XY Row (const Standard_Integer Row);
		%feature("autodoc", "Args:
	Row(Standard_Integer)
	Col(Standard_Integer)

Returns:
	Standard_Real

Returns the coefficient of range (Row, Col)  
Raises OutOfRange  
if Row < 1 or Row > 2 or Col < 1 or Col > 2") Value;
		const Standard_Real & Value (const Standard_Integer Row,const Standard_Integer Col);
		%feature("autodoc", "Args:
	Row(Standard_Integer)
	Col(Standard_Integer)

Returns:
	Standard_Real

Returns the coefficient of range (Row, Col)  
Raises OutOfRange  
if Row < 1 or Row > 2 or Col < 1 or Col > 2") ChangeValue;
		Standard_Real & ChangeValue (const Standard_Integer Row,const Standard_Integer Col);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns true if this matrix is singular (and therefore, cannot be inverted).  
 The Gauss LU decomposition is used to invert the matrix  
 so the matrix is considered as singular if the largest  
 pivot found is lower or equal to Resolution from gp.") IsSingular;
		Standard_Boolean IsSingular ();
		%feature("autodoc", "Args:
	Other(gp_Mat2d)

Returns:
	None

No detailed docstring for this function.") Add;
		void Add (const gp_Mat2d  Other);
		%feature("autodoc", "Args:
	Other(gp_Mat2d)

Returns:
	None

No detailed docstring for this function.") operator+=;
		void operator += (const gp_Mat2d  Other);
		%feature("autodoc", "Args:
	Other(gp_Mat2d)

Returns:
	gp_Mat2d

Computes the sum of this matrix and the matrix  
Other.for each coefficient of the matrix :  
 <self>.Coef(i,j) + <Other>.Coef(i,j)  
Note:  
-   operator += assigns the result to this matrix, while  
-   operator + creates a new one.") Added;
		gp_Mat2d Added (const gp_Mat2d  Other);
		%feature("autodoc", "Args:
	Other(gp_Mat2d)

Returns:
	gp_Mat2d

No detailed docstring for this function.") operator+;
		gp_Mat2d operator + (const gp_Mat2d  Other);
		%feature("autodoc", "Args:
	Scalar(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Divide;
		void Divide (const Standard_Real Scalar);
		%feature("autodoc", "Args:
	Scalar(Standard_Real)

Returns:
	None

No detailed docstring for this function.") operator/=;
		void operator /= (const Standard_Real Scalar);
		%feature("autodoc", "Args:
	Scalar(Standard_Real)

Returns:
	gp_Mat2d

Divides all the coefficients of the matrix by a scalar.") Divided;
		gp_Mat2d Divided (const Standard_Real Scalar);
		%feature("autodoc", "Args:
	Scalar(Standard_Real)

Returns:
	gp_Mat2d

No detailed docstring for this function.") operator/;
		gp_Mat2d operator / (const Standard_Real Scalar);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Invert;
		void Invert ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Mat2d

Inverses the matrix and raises exception if the matrix  
 is singular.") Inverted;
		gp_Mat2d Inverted ();
		%feature("autodoc", "Args:
	Other(gp_Mat2d)

Returns:
	gp_Mat2d

No detailed docstring for this function.") Multiplied;
		gp_Mat2d Multiplied (const gp_Mat2d  Other);
		%feature("autodoc", "Args:
	Other(gp_Mat2d)

Returns:
	gp_Mat2d

No detailed docstring for this function.") operator*;
		gp_Mat2d operator * (const gp_Mat2d  Other);
		%feature("autodoc", "Args:
	Other(gp_Mat2d)

Returns:
	None

Computes the product of two matrices <self> * <Other>") Multiply;
		void Multiply (const gp_Mat2d  Other);
		%feature("autodoc", "Args:
	Other(gp_Mat2d)

Returns:
	None

Modifies this matrix by premultiplying it by the matrix Other  
<self> = Other * <self>.") PreMultiply;
		void PreMultiply (const gp_Mat2d  Other);
		%feature("autodoc", "Args:
	Scalar(Standard_Real)

Returns:
	gp_Mat2d

No detailed docstring for this function.") Multiplied;
		gp_Mat2d Multiplied (const Standard_Real Scalar);
		%feature("autodoc", "Args:
	Scalar(Standard_Real)

Returns:
	gp_Mat2d

No detailed docstring for this function.") operator*;
		gp_Mat2d operator * (const Standard_Real Scalar);
		%feature("autodoc", "Args:
	Scalar(Standard_Real)

Returns:
	None

Multiplies all the coefficients of the matrix by a scalar.") Multiply;
		void Multiply (const Standard_Real Scalar);
		%feature("autodoc", "Args:
	Scalar(Standard_Real)

Returns:
	None

No detailed docstring for this function.") operator*=;
		void operator *= (const Standard_Real Scalar);
		%feature("autodoc", "Args:
	N(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Power;
		void Power (const Standard_Integer N);
		%feature("autodoc", "Args:
	N(Standard_Integer)

Returns:
	gp_Mat2d

computes <self> = <self> * <self> * .......* <self>, N time.  
 if N = 0 <self> = Identity  
 if N < 0 <self> = <self>.Invert() *...........* <self>.Invert().  
 If N < 0 an exception can be raised if the matrix is not  
 inversible") Powered;
		gp_Mat2d Powered (const Standard_Integer N);
		%feature("autodoc", "Args:
	Other(gp_Mat2d)

Returns:
	None

No detailed docstring for this function.") Subtract;
		void Subtract (const gp_Mat2d  Other);
		%feature("autodoc", "Args:
	Other(gp_Mat2d)

Returns:
	None

No detailed docstring for this function.") operator-=;
		void operator -= (const gp_Mat2d  Other);
		%feature("autodoc", "Args:
	Other(gp_Mat2d)

Returns:
	gp_Mat2d

Computes for each coefficient of the matrix :  
 <self>.Coef(i,j) - <Other>.Coef(i,j)") Subtracted;
		gp_Mat2d Subtracted (const gp_Mat2d  Other);
		%feature("autodoc", "Args:
	Other(gp_Mat2d)

Returns:
	gp_Mat2d

No detailed docstring for this function.") operator-;
		gp_Mat2d operator - (const gp_Mat2d  Other);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Transpose;
		void Transpose ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Mat2d

Transposes the matrix. A(j, i) -> A (i, j)") Transposed;
		gp_Mat2d Transposed ();
		%feature("autodoc", "Args:
	i1(Standard_Integer)
	i2(Standard_Integer)

Returns:
	Standard_Real

No detailed docstring for this function.") _CSFDB_Getgp_Mat2dmatrix;
		Standard_Real & _CSFDB_Getgp_Mat2dmatrix (const Standard_Integer i1,const Standard_Integer i2);
};


%feature("shadow") gp_Mat2d::~gp_Mat2d %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend gp_Mat2d {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor gp_Parab;
class gp_Parab {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

Creates an indefinite Parabola.") gp_Parab;
		 gp_Parab ();
		%feature("autodoc", "Args:
	A2(gp_Ax2)
	Focal(Standard_Real)

Returns:
	None

Creates a parabola with its local coordinate system 'A2'  
 and it's focal length 'Focal'.  
 The XDirection of A2 defines the axis of symmetry of the  
 parabola. The YDirection of A2 is parallel to the directrix  
 of the parabola. The Location point of A2 is the vertex of  
 the parabola  
Raises ConstructionError if Focal < 0.0  Raised if Focal < 0.0") gp_Parab;
		 gp_Parab (const gp_Ax2  A2,const Standard_Real Focal);
		%feature("autodoc", "Args:
	D(gp_Ax1)
	F(gp_Pnt)

Returns:
	None

D is the directrix of the parabola and F the focus point.  
 The symmetry axis (XAxis) of the parabola is normal to the  
 directrix and pass through the focus point F, but its  
 location point is the vertex of the parabola.  
 The YAxis of the parabola is parallel to D and its location  
 point is the vertex of the parabola. The normal to the plane  
 of the parabola is the cross product between the XAxis and the  
 YAxis.") gp_Parab;
		 gp_Parab (const gp_Ax1  D,const gp_Pnt  F);
		%feature("autodoc", "Args:
	A1(gp_Ax1)

Returns:
	None

Modifies this parabola by redefining its local coordinate system so that  
-   its origin and 'main Direction' become those of the  
  axis A1 (the 'X Direction' and 'Y Direction' are then  
  recomputed in the same way as for any gp_Ax2)  
 Raises ConstructionError if the direction of A1 is parallel to the previous  
 XAxis of the parabola.") SetAxis;
		void SetAxis (const gp_Ax1  A1);
		%feature("autodoc", "Args:
	Focal(Standard_Real)

Returns:
	None

Changes the focal distance of the parabola.  
 Raises ConstructionError if Focal < 0.0") SetFocal;
		void SetFocal (const Standard_Real Focal);
		%feature("autodoc", "Args:
	P(gp_Pnt)

Returns:
	None

Changes the location of the parabola. It is the vertex of  
 the parabola.") SetLocation;
		void SetLocation (const gp_Pnt  P);
		%feature("autodoc", "Args:
	A2(gp_Ax2)

Returns:
	None

Changes the local coordinate system of the parabola.") SetPosition;
		void SetPosition (const gp_Ax2  A2);
		%feature("autodoc", "Args:
	None
Returns:
	gp_Ax1

Returns the main axis of the parabola.  
 It is the axis normal to the plane of the parabola passing  
 through the vertex of the parabola.") Axis;
		const gp_Ax1 & Axis ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Ax1

Computes the directrix of this parabola.  
The directrix is:  
-   a line parallel to the 'Y Direction' of the local  
  coordinate system of this parabola, and  
-   located on the negative side of the axis of symmetry,  
  at a distance from the apex which is equal to the focal  
  length of this parabola.  
The directrix is returned as an axis (a gp_Ax1 object),  
the origin of which is situated on the 'X Axis' of this parabola.") Directrix;
		gp_Ax1 Directrix ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

Returns the distance between the vertex and the focus  
 of the parabola.") Focal;
		Standard_Real Focal ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Pnt

-   Computes the focus of the parabola.") Focus;
		gp_Pnt Focus ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Pnt

Returns the vertex of the parabola. It is the 'Location'  
 point of the coordinate system of the parabola.") Location;
		const gp_Pnt & Location ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

Computes the parameter of the parabola.  
 It is the distance between the focus and the directrix of  
 the parabola. This distance is twice the focal length.") Parameter;
		Standard_Real Parameter ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Ax2

Returns the local coordinate system of the parabola.") Position;
		const gp_Ax2 & Position ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Ax1

Returns the symmetry axis of the parabola. The location point  
 of the axis is the vertex of the parabola.") XAxis;
		gp_Ax1 XAxis ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Ax1

It is an axis parallel to the directrix of the parabola.  
 The location point of this axis is the vertex of the parabola.") YAxis;
		gp_Ax1 YAxis ();
		%feature("autodoc", "Args:
	P(gp_Pnt)

Returns:
	None

No detailed docstring for this function.") Mirror;
		void Mirror (const gp_Pnt  P);
		%feature("autodoc", "Args:
	P(gp_Pnt)

Returns:
	gp_Parab

Performs the symmetrical transformation of a parabola  
 with respect to the point P which is the center of the  
 symmetry.") Mirrored;
		gp_Parab Mirrored (const gp_Pnt  P);
		%feature("autodoc", "Args:
	A1(gp_Ax1)

Returns:
	None

No detailed docstring for this function.") Mirror;
		void Mirror (const gp_Ax1  A1);
		%feature("autodoc", "Args:
	A1(gp_Ax1)

Returns:
	gp_Parab

Performs the symmetrical transformation of a parabola  
 with respect to an axis placement which is the axis of  
 the symmetry.") Mirrored;
		gp_Parab Mirrored (const gp_Ax1  A1);
		%feature("autodoc", "Args:
	A2(gp_Ax2)

Returns:
	None

No detailed docstring for this function.") Mirror;
		void Mirror (const gp_Ax2  A2);
		%feature("autodoc", "Args:
	A2(gp_Ax2)

Returns:
	gp_Parab

Performs the symmetrical transformation of a parabola  
 with respect to a plane. The axis placement A2 locates  
 the plane of the symmetry (Location, XDirection, YDirection).") Mirrored;
		gp_Parab Mirrored (const gp_Ax2  A2);
		%feature("autodoc", "Args:
	A1(gp_Ax1)
	Ang(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Rotate;
		void Rotate (const gp_Ax1  A1,const Standard_Real Ang);
		%feature("autodoc", "Args:
	A1(gp_Ax1)
	Ang(Standard_Real)

Returns:
	gp_Parab

Rotates a parabola. A1 is the axis of the rotation.  
 Ang is the angular value of the rotation in radians.") Rotated;
		gp_Parab Rotated (const gp_Ax1  A1,const Standard_Real Ang);
		%feature("autodoc", "Args:
	P(gp_Pnt)
	S(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Scale;
		void Scale (const gp_Pnt  P,const Standard_Real S);
		%feature("autodoc", "Args:
	P(gp_Pnt)
	S(Standard_Real)

Returns:
	gp_Parab

Scales a parabola. S is the scaling value.  
 If S is negative the direction of the symmetry axis  
 XAxis is reversed and the direction of the YAxis too.") Scaled;
		gp_Parab Scaled (const gp_Pnt  P,const Standard_Real S);
		%feature("autodoc", "Args:
	T(gp_Trsf)

Returns:
	None

No detailed docstring for this function.") Transform;
		void Transform (const gp_Trsf  T);
		%feature("autodoc", "Args:
	T(gp_Trsf)

Returns:
	gp_Parab

Transforms a parabola with the transformation T from class Trsf.") Transformed;
		gp_Parab Transformed (const gp_Trsf  T);
		%feature("autodoc", "Args:
	V(gp_Vec)

Returns:
	None

No detailed docstring for this function.") Translate;
		void Translate (const gp_Vec  V);
		%feature("autodoc", "Args:
	V(gp_Vec)

Returns:
	gp_Parab

Translates a parabola in the direction of the vector V.  
 The magnitude of the translation is the vector's magnitude.") Translated;
		gp_Parab Translated (const gp_Vec  V);
		%feature("autodoc", "Args:
	P1(gp_Pnt)
	P2(gp_Pnt)

Returns:
	None

No detailed docstring for this function.") Translate;
		void Translate (const gp_Pnt  P1,const gp_Pnt  P2);
		%feature("autodoc", "Args:
	P1(gp_Pnt)
	P2(gp_Pnt)

Returns:
	gp_Parab

Translates a parabola from the point P1 to the point P2.") Translated;
		gp_Parab Translated (const gp_Pnt  P1,const gp_Pnt  P2);
		%feature("autodoc", "Args:
	None
Returns:
	gp_Ax2

No detailed docstring for this function.") _CSFDB_Getgp_Parabpos;
		const gp_Ax2 & _CSFDB_Getgp_Parabpos ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") _CSFDB_Getgp_ParabfocalLength;
		Standard_Real _CSFDB_Getgp_ParabfocalLength ();
		%feature("autodoc", "Args:
	p(Standard_Real)

Returns:
	None

No detailed docstring for this function.") _CSFDB_Setgp_ParabfocalLength;
		void _CSFDB_Setgp_ParabfocalLength (const Standard_Real p);
};


%feature("shadow") gp_Parab::~gp_Parab %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend gp_Parab {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor gp_Parab2d;
class gp_Parab2d {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

Creates an indefinite parabola.") gp_Parab2d;
		 gp_Parab2d ();
		%feature("autodoc", "Args:
	MirrorAxis(gp_Ax2d)
	Focal(Standard_Real)
	Sense(Standard_Boolean)=Standard_True

Returns:
	None

Creates a parabola with its vertex point, its axis of symmetry  
 ('XAxis') and its focal length.  
 The sense of parametrization is given by Sense.  
 Warnings : It is possible to have Focal = 0.  
Raises ConstructionError if Focal < 0.0") gp_Parab2d;
		 gp_Parab2d (const gp_Ax2d  MirrorAxis,const Standard_Real Focal,const Standard_Boolean Sense = Standard_True);
		%feature("autodoc", "Args:
	A(gp_Ax22d)
	Focal(Standard_Real)

Returns:
	None

Creates a parabola with its vertex point, its axis of symmetry  
 ('XAxis') and its focal length.  
 The sense of parametrization is given by A.  
Warnings : It is possible to have Focal = 0.  
Raises ConstructionError if Focal < 0.0") gp_Parab2d;
		 gp_Parab2d (const gp_Ax22d  A,const Standard_Real Focal);
		%feature("autodoc", "Args:
	D(gp_Ax2d)
	F(gp_Pnt2d)
	Sense(Standard_Boolean)=Standard_True

Returns:
	None

Creates a parabola with the directrix and the focus point.  
 The sense of parametrization is given by Sense.") gp_Parab2d;
		 gp_Parab2d (const gp_Ax2d  D,const gp_Pnt2d  F,const Standard_Boolean Sense = Standard_True);
		%feature("autodoc", "Args:
	D(gp_Ax22d)
	F(gp_Pnt2d)

Returns:
	None

Creates a parabola with the directrix and the focus point.  
 The Sense of parametrization is given by D.") gp_Parab2d;
		 gp_Parab2d (const gp_Ax22d  D,const gp_Pnt2d  F);
		%feature("autodoc", "Args:
	Focal(Standard_Real)

Returns:
	None

Changes the focal distance of the parabola  
Warnings : It is possible to have Focal = 0.  
Raises ConstructionError if Focal < 0.0") SetFocal;
		void SetFocal (const Standard_Real Focal);
		%feature("autodoc", "Args:
	P(gp_Pnt2d)

Returns:
	None

Changes the 'Location' point of the parabola. It is the  
 vertex of the parabola.") SetLocation;
		void SetLocation (const gp_Pnt2d  P);
		%feature("autodoc", "Args:
	A(gp_Ax2d)

Returns:
	None

Modifies this parabola, by redefining its local coordinate system so that  
   its origin and 'X Direction' become those of the axis  
 MA. The 'Y Direction' of the local coordinate system is  
  then recomputed. The orientation of the local  
  coordinate system is not modified.") SetMirrorAxis;
		void SetMirrorAxis (const gp_Ax2d  A);
		%feature("autodoc", "Args:
	A(gp_Ax22d)

Returns:
	None

Changes the local coordinate system of the parabola.  
 The 'Location' point of A becomes the vertex of the parabola.") SetAxis;
		void SetAxis (const gp_Ax22d  A);
		%feature("autodoc", "Args:
	A(Standard_Real)
	B(Standard_Real)
	C(Standard_Real)
	D(Standard_Real)
	E(Standard_Real)
	F(Standard_Real)

Returns:
	None

Computes the coefficients of the implicit equation of the parabola.  
 A * (X**2) + B * (Y**2) + 2*C*(X*Y) + 2*D*X + 2*E*Y + F = 0.") Coefficients;
		void Coefficients (Standard_Real  A,Standard_Real  B,Standard_Real  C,Standard_Real  D,Standard_Real  E,Standard_Real  F);
		%feature("autodoc", "Args:
	None
Returns:
	gp_Ax2d

Computes the directrix of the parabola.  
The directrix is:  
-   a line parallel to the 'Y Direction' of the local  
  coordinate system of this parabola, and  
-   located on the negative side of the axis of symmetry,  
  at a distance from the apex which is equal to the focal  length of this parabola.  
  The directrix is returned as an axis (a gp_Ax2d object),  
the origin of which is situated on the 'X Axis' of this parabola.") Directrix;
		gp_Ax2d Directrix ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

Returns the distance between the vertex and the focus  
 of the parabola.") Focal;
		Standard_Real Focal ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Pnt2d

Returns the focus of the parabola.") Focus;
		gp_Pnt2d Focus ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Pnt2d

Returns the vertex of the parabola.") Location;
		gp_Pnt2d Location ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Ax2d

Returns the symmetry axis of the parabola.  
 The 'Location' point of this axis is the vertex of the parabola.") MirrorAxis;
		gp_Ax2d MirrorAxis ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Ax22d

Returns the local coordinate system of the parabola.  
 The 'Location' point of this axis is the vertex of the parabola.") Axis;
		gp_Ax22d Axis ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

Returns the distance between the focus and the  
 directrix of the parabola.") Parameter;
		Standard_Real Parameter ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Reverse;
		void Reverse ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Parab2d

Reverses the orientation of the local coordinate system  
of this parabola (the 'Y Direction' is reversed).  
Therefore, the implicit orientation of this parabola is reversed.  
Note:  
-   Reverse assigns the result to this parabola, while  
-   Reversed creates a new one.") Reversed;
		gp_Parab2d Reversed ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns true if the local coordinate system is direct  
           and false in the other case.") IsDirect;
		Standard_Boolean IsDirect ();
		%feature("autodoc", "Args:
	P(gp_Pnt2d)

Returns:
	None

No detailed docstring for this function.") Mirror;
		void Mirror (const gp_Pnt2d  P);
		%feature("autodoc", "Args:
	P(gp_Pnt2d)

Returns:
	gp_Parab2d

Performs the symmetrical transformation of a parabola with respect  
 to the point P which is the center of the symmetry") Mirrored;
		gp_Parab2d Mirrored (const gp_Pnt2d  P);
		%feature("autodoc", "Args:
	A(gp_Ax2d)

Returns:
	None

No detailed docstring for this function.") Mirror;
		void Mirror (const gp_Ax2d  A);
		%feature("autodoc", "Args:
	A(gp_Ax2d)

Returns:
	gp_Parab2d

Performs the symmetrical transformation of a parabola with respect  
 to an axis placement which is the axis of the symmetry.") Mirrored;
		gp_Parab2d Mirrored (const gp_Ax2d  A);
		%feature("autodoc", "Args:
	P(gp_Pnt2d)
	Ang(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Rotate;
		void Rotate (const gp_Pnt2d  P,const Standard_Real Ang);
		%feature("autodoc", "Args:
	P(gp_Pnt2d)
	Ang(Standard_Real)

Returns:
	gp_Parab2d

Rotates a parabola. P is the center of the rotation.  
 Ang is the angular value of the rotation in radians.") Rotated;
		gp_Parab2d Rotated (const gp_Pnt2d  P,const Standard_Real Ang);
		%feature("autodoc", "Args:
	P(gp_Pnt2d)
	S(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Scale;
		void Scale (const gp_Pnt2d  P,const Standard_Real S);
		%feature("autodoc", "Args:
	P(gp_Pnt2d)
	S(Standard_Real)

Returns:
	gp_Parab2d

Scales a parabola. S is the scaling value.  
 If S is negative the direction of the symmetry axis  
 'XAxis' is reversed and the direction of the 'YAxis' too.") Scaled;
		gp_Parab2d Scaled (const gp_Pnt2d  P,const Standard_Real S);
		%feature("autodoc", "Args:
	T(gp_Trsf2d)

Returns:
	None

No detailed docstring for this function.") Transform;
		void Transform (const gp_Trsf2d  T);
		%feature("autodoc", "Args:
	T(gp_Trsf2d)

Returns:
	gp_Parab2d

Transforms an parabola with the transformation T from class Trsf2d.") Transformed;
		gp_Parab2d Transformed (const gp_Trsf2d  T);
		%feature("autodoc", "Args:
	V(gp_Vec2d)

Returns:
	None

No detailed docstring for this function.") Translate;
		void Translate (const gp_Vec2d  V);
		%feature("autodoc", "Args:
	V(gp_Vec2d)

Returns:
	gp_Parab2d

Translates a parabola in the direction of the vector V.  
 The magnitude of the translation is the vector's magnitude.") Translated;
		gp_Parab2d Translated (const gp_Vec2d  V);
		%feature("autodoc", "Args:
	P1(gp_Pnt2d)
	P2(gp_Pnt2d)

Returns:
	None

No detailed docstring for this function.") Translate;
		void Translate (const gp_Pnt2d  P1,const gp_Pnt2d  P2);
		%feature("autodoc", "Args:
	P1(gp_Pnt2d)
	P2(gp_Pnt2d)

Returns:
	gp_Parab2d

Translates a parabola from the point P1 to the point P2.") Translated;
		gp_Parab2d Translated (const gp_Pnt2d  P1,const gp_Pnt2d  P2);
		%feature("autodoc", "Args:
	None
Returns:
	gp_Ax22d

No detailed docstring for this function.") _CSFDB_Getgp_Parab2dpos;
		const gp_Ax22d & _CSFDB_Getgp_Parab2dpos ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") _CSFDB_Getgp_Parab2dfocalLength;
		Standard_Real _CSFDB_Getgp_Parab2dfocalLength ();
		%feature("autodoc", "Args:
	p(Standard_Real)

Returns:
	None

No detailed docstring for this function.") _CSFDB_Setgp_Parab2dfocalLength;
		void _CSFDB_Setgp_Parab2dfocalLength (const Standard_Real p);
};


%feature("shadow") gp_Parab2d::~gp_Parab2d %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend gp_Parab2d {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor gp_Pln;
class gp_Pln {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

Creates a plane coincident with OXY plane of the  
           reference coordinate system.") gp_Pln;
		 gp_Pln ();
		%feature("autodoc", "Args:
	A3(gp_Ax3)

Returns:
	None

The coordinate system of the plane is defined with the axis  
 placement A3.  
 The 'Direction' of A3 defines the normal to the plane.  
 The 'Location' of A3 defines the location (origin) of the plane.  
 The 'XDirection' and 'YDirection' of A3 define the 'XAxis' and  
 the 'YAxis' of the plane used to parametrize the plane.") gp_Pln;
		 gp_Pln (const gp_Ax3  A3);
		%feature("autodoc", "Args:
	P(gp_Pnt)
	V(gp_Dir)

Returns:
	None

Creates a plane with the  'Location' point <P>  
 and the normal direction <V>.") gp_Pln;
		 gp_Pln (const gp_Pnt  P,const gp_Dir  V);
		%feature("autodoc", "Args:
	A(Standard_Real)
	B(Standard_Real)
	C(Standard_Real)
	D(Standard_Real)

Returns:
	None

Creates a plane from its cartesian equation :  
 A * X + B * Y + C * Z + D = 0.0  
 Raises ConstructionError if Sqrt (A*A + B*B + C*C) <= Resolution from gp.") gp_Pln;
		 gp_Pln (const Standard_Real A,const Standard_Real B,const Standard_Real C,const Standard_Real D);
		%feature("autodoc", "Args:
	A(Standard_Real)
	B(Standard_Real)
	C(Standard_Real)
	D(Standard_Real)

Returns:
	None

Returns the coefficients of the plane's cartesian equation :  
 A * X + B * Y + C * Z + D = 0.") Coefficients;
		void Coefficients (Standard_Real  A,Standard_Real  B,Standard_Real  C,Standard_Real  D);
		%feature("autodoc", "Args:
	A1(gp_Ax1)

Returns:
	None

Modifies this plane, by redefining its local coordinate system so that  
-   its origin and 'main Direction' become those of the  
  axis A1 (the 'X Direction' and 'Y Direction' are then recomputed).  
 Raises ConstructionError if the A1 is parallel to the 'XAxis' of the plane.") SetAxis;
		void SetAxis (const gp_Ax1  A1);
		%feature("autodoc", "Args:
	Loc(gp_Pnt)

Returns:
	None

Changes the origin of the plane.") SetLocation;
		void SetLocation (const gp_Pnt  Loc);
		%feature("autodoc", "Args:
	A3(gp_Ax3)

Returns:
	None

Changes the local coordinate system of the plane.") SetPosition;
		void SetPosition (const gp_Ax3  A3);
		%feature("autodoc", "Args:
	None
Returns:
	None

Reverses the   U   parametrization of   the  plane  
         reversing the XAxis.") UReverse;
		void UReverse ();
		%feature("autodoc", "Args:
	None
Returns:
	None

Reverses the   V   parametrization of   the  plane  
         reversing the YAxis.") VReverse;
		void VReverse ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

returns true if the Ax3 is right handed.") Direct;
		Standard_Boolean Direct ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Ax1

Returns the plane's normal Axis.") Axis;
		const gp_Ax1 & Axis ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Pnt

Returns the plane's location (origin).") Location;
		const gp_Pnt & Location ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Ax3

Returns the local coordinate system of the plane .") Position;
		const gp_Ax3 & Position ();
		%feature("autodoc", "Args:
	P(gp_Pnt)

Returns:
	Standard_Real

Computes the distance between <self> and the point <P>.") Distance;
		Standard_Real Distance (const gp_Pnt  P);
		%feature("autodoc", "Args:
	L(gp_Lin)

Returns:
	Standard_Real

Computes the distance between <self> and the line <L>.") Distance;
		Standard_Real Distance (const gp_Lin  L);
		%feature("autodoc", "Args:
	Other(gp_Pln)

Returns:
	Standard_Real

Computes the distance between two planes.") Distance;
		Standard_Real Distance (const gp_Pln  Other);
		%feature("autodoc", "Args:
	P(gp_Pnt)

Returns:
	Standard_Real

Computes the square distance between <self> and the point <P>.") SquareDistance;
		Standard_Real SquareDistance (const gp_Pnt  P);
		%feature("autodoc", "Args:
	L(gp_Lin)

Returns:
	Standard_Real

Computes the square distance between <self> and the line <L>.") SquareDistance;
		Standard_Real SquareDistance (const gp_Lin  L);
		%feature("autodoc", "Args:
	Other(gp_Pln)

Returns:
	Standard_Real

Computes the square distance between two planes.") SquareDistance;
		Standard_Real SquareDistance (const gp_Pln  Other);
		%feature("autodoc", "Args:
	None
Returns:
	gp_Ax1

Returns the X axis of the plane.") XAxis;
		gp_Ax1 XAxis ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Ax1

Returns the Y axis  of the plane.") YAxis;
		gp_Ax1 YAxis ();
		%feature("autodoc", "Args:
	P(gp_Pnt)
	LinearTolerance(Standard_Real)

Returns:
	Standard_Boolean

Returns true if this plane contains the point P. This means that  
-   the distance between point P and this plane is less  
  than or equal to LinearTolerance, or  
-   line L is normal to the 'main Axis' of the local  
  coordinate system of this plane, within the tolerance  
  AngularTolerance, and the distance between the origin  
  of line L and this plane is less than or equal to  
  LinearTolerance.") Contains;
		Standard_Boolean Contains (const gp_Pnt  P,const Standard_Real LinearTolerance);
		%feature("autodoc", "Args:
	L(gp_Lin)
	LinearTolerance(Standard_Real)
	AngularTolerance(Standard_Real)

Returns:
	Standard_Boolean

Returns true if this plane contains the line L. This means that  
-   the distance between point P and this plane is less  
  than or equal to LinearTolerance, or  
-   line L is normal to the 'main Axis' of the local  
  coordinate system of this plane, within the tolerance  
  AngularTolerance, and the distance between the origin  
  of line L and this plane is less than or equal to  
  LinearTolerance.") Contains;
		Standard_Boolean Contains (const gp_Lin  L,const Standard_Real LinearTolerance,const Standard_Real AngularTolerance);
		%feature("autodoc", "Args:
	P(gp_Pnt)

Returns:
	None

No detailed docstring for this function.") Mirror;
		void Mirror (const gp_Pnt  P);
		%feature("autodoc", "Args:
	P(gp_Pnt)

Returns:
	gp_Pln

Performs the symmetrical transformation of a plane with respect  
 to the point <P> which is the center of the symmetry  
Warnings :  
 The normal direction to the plane is not changed.  
 The 'XAxis' and the 'YAxis' are reversed.") Mirrored;
		gp_Pln Mirrored (const gp_Pnt  P);
		%feature("autodoc", "Args:
	A1(gp_Ax1)

Returns:
	None

No detailed docstring for this function.") Mirror;
		void Mirror (const gp_Ax1  A1);
		%feature("autodoc", "Args:
	A1(gp_Ax1)

Returns:
	gp_Pln

Performs   the symmetrical transformation  of a  
 plane with respect to an axis placement  which is the axis  
 of  the symmetry.  The  transformation is performed on the  
 'Location' point, on  the 'XAxis'  and the 'YAxis'.    The  
 resulting normal  direction  is  the cross product between  
 the 'XDirection' and the 'YDirection' after transformation  
 if  the  initial plane was right  handed,  else  it is the  
 opposite.") Mirrored;
		gp_Pln Mirrored (const gp_Ax1  A1);
		%feature("autodoc", "Args:
	A2(gp_Ax2)

Returns:
	None

No detailed docstring for this function.") Mirror;
		void Mirror (const gp_Ax2  A2);
		%feature("autodoc", "Args:
	A2(gp_Ax2)

Returns:
	gp_Pln

Performs the  symmetrical transformation  of  a  
 plane    with respect to    an axis  placement.   The axis  
 placement  <A2> locates the plane  of  the symmetry.   The  
 transformation is performed  on  the  'Location' point, on  
 the  'XAxis' and  the    'YAxis'.  The resulting    normal  
 direction is the cross  product between   the 'XDirection'  
 and the 'YDirection'  after  transformation if the initial  
 plane was right handed, else it is the opposite.") Mirrored;
		gp_Pln Mirrored (const gp_Ax2  A2);
		%feature("autodoc", "Args:
	A1(gp_Ax1)
	Ang(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Rotate;
		void Rotate (const gp_Ax1  A1,const Standard_Real Ang);
		%feature("autodoc", "Args:
	A1(gp_Ax1)
	Ang(Standard_Real)

Returns:
	gp_Pln

rotates a plane. A1 is the axis of the rotation.  
 Ang is the angular value of the rotation in radians.") Rotated;
		gp_Pln Rotated (const gp_Ax1  A1,const Standard_Real Ang);
		%feature("autodoc", "Args:
	P(gp_Pnt)
	S(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Scale;
		void Scale (const gp_Pnt  P,const Standard_Real S);
		%feature("autodoc", "Args:
	P(gp_Pnt)
	S(Standard_Real)

Returns:
	gp_Pln

Scales a plane. S is the scaling value.") Scaled;
		gp_Pln Scaled (const gp_Pnt  P,const Standard_Real S);
		%feature("autodoc", "Args:
	T(gp_Trsf)

Returns:
	None

No detailed docstring for this function.") Transform;
		void Transform (const gp_Trsf  T);
		%feature("autodoc", "Args:
	T(gp_Trsf)

Returns:
	gp_Pln

Transforms a plane with the transformation T from class Trsf.  
 The transformation is performed on the 'Location'  
 point, on the 'XAxis' and the 'YAxis'.  
 The resulting normal direction is the cross product between  
 the 'XDirection' and the 'YDirection' after transformation.") Transformed;
		gp_Pln Transformed (const gp_Trsf  T);
		%feature("autodoc", "Args:
	V(gp_Vec)

Returns:
	None

No detailed docstring for this function.") Translate;
		void Translate (const gp_Vec  V);
		%feature("autodoc", "Args:
	V(gp_Vec)

Returns:
	gp_Pln

Translates a plane in the direction of the vector V.  
 The magnitude of the translation is the vector's magnitude.") Translated;
		gp_Pln Translated (const gp_Vec  V);
		%feature("autodoc", "Args:
	P1(gp_Pnt)
	P2(gp_Pnt)

Returns:
	None

No detailed docstring for this function.") Translate;
		void Translate (const gp_Pnt  P1,const gp_Pnt  P2);
		%feature("autodoc", "Args:
	P1(gp_Pnt)
	P2(gp_Pnt)

Returns:
	gp_Pln

Translates a plane from the point P1 to the point P2.") Translated;
		gp_Pln Translated (const gp_Pnt  P1,const gp_Pnt  P2);
		%feature("autodoc", "Args:
	None
Returns:
	gp_Ax3

No detailed docstring for this function.") _CSFDB_Getgp_Plnpos;
		const gp_Ax3 & _CSFDB_Getgp_Plnpos ();
};


%feature("shadow") gp_Pln::~gp_Pln %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend gp_Pln {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor gp_Pnt;
class gp_Pnt {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

Creates a point with zero coordinates.") gp_Pnt;
		 gp_Pnt ();
		%feature("autodoc", "Args:
	Coord(gp_XYZ)

Returns:
	None

Creates a point from a XYZ object.") gp_Pnt;
		 gp_Pnt (const gp_XYZ  Coord);
		%feature("autodoc", "Args:
	Xp(Standard_Real)
	Yp(Standard_Real)
	Zp(Standard_Real)

Returns:
	None

Creates a  point with its 3 cartesian's coordinates : Xp, Yp, Zp.") gp_Pnt;
		 gp_Pnt (const Standard_Real Xp,const Standard_Real Yp,const Standard_Real Zp);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	Xi(Standard_Real)

Returns:
	None

Changes the coordinate of range Index :  
 Index = 1 => X is modified  
 Index = 2 => Y is modified  
 Index = 3 => Z is modified  Raised if Index != {1, 2, 3}.") SetCoord;
		void SetCoord (const Standard_Integer Index,const Standard_Real Xi);
		%feature("autodoc", "Args:
	Xp(Standard_Real)
	Yp(Standard_Real)
	Zp(Standard_Real)

Returns:
	None

For this point, assigns  the values Xp, Yp and Zp to its three coordinates.") SetCoord;
		void SetCoord (const Standard_Real Xp,const Standard_Real Yp,const Standard_Real Zp);
		%feature("autodoc", "Args:
	X(Standard_Real)

Returns:
	None

Assigns the given value to the X coordinate of this point.") SetX;
		void SetX (const Standard_Real X);
		%feature("autodoc", "Args:
	Y(Standard_Real)

Returns:
	None

Assigns the given value to the Y coordinate of this point.") SetY;
		void SetY (const Standard_Real Y);
		%feature("autodoc", "Args:
	Z(Standard_Real)

Returns:
	None

Assigns the given value to the Z coordinate of this point.") SetZ;
		void SetZ (const Standard_Real Z);
		%feature("autodoc", "Args:
	Coord(gp_XYZ)

Returns:
	None

Assigns the three coordinates of Coord to this point.") SetXYZ;
		void SetXYZ (const gp_XYZ  Coord);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Standard_Real

Returns the coordinate of corresponding to the value of  Index :  
 Index = 1 => X is returned  
 Index = 2 => Y is returned  
 Index = 3 => Z is returned  
Raises OutOfRange if Index != {1, 2, 3}.  Raised if Index != {1, 2, 3}.") Coord;
		Standard_Real Coord (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Xp(Standard_Real)
	Yp(Standard_Real)
	Zp(Standard_Real)

Returns:
	None

For this point gives its three coordinates Xp, Yp and Zp.") Coord;
		void Coord (Standard_Real  Xp,Standard_Real  Yp,Standard_Real  Zp);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

For this point, returns its X coordinate.") X;
		Standard_Real X ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

For this point, returns its Y coordinate.") Y;
		Standard_Real Y ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

For this point, returns its Z coordinate.") Z;
		Standard_Real Z ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_XYZ

For this point, returns its three coordinates as a XYZ object.") XYZ;
		const gp_XYZ & XYZ ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_XYZ

For this point, returns its three coordinates as a XYZ object.") Coord;
		const gp_XYZ & Coord ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_XYZ

Returns the coordinates of this point.  
Note: This syntax allows direct modification of the returned value.") ChangeCoord;
		gp_XYZ & ChangeCoord ();
		%feature("autodoc", "Args:
	Alpha(Standard_Real)
	P(gp_Pnt)
	Beta(Standard_Real)

Returns:
	None

Assigns the result of the following expression to this point  
(Alpha*this + Beta*P) / (Alpha + Beta)") BaryCenter;
		void BaryCenter (const Standard_Real Alpha,const gp_Pnt  P,const Standard_Real Beta);
		%feature("autodoc", "Args:
	Other(gp_Pnt)
	LinearTolerance(Standard_Real)

Returns:
	Standard_Boolean

Comparison  
 Returns True if the distance between the two points is  
 lower or equal to LinearTolerance.") IsEqual;
		Standard_Boolean IsEqual (const gp_Pnt  Other,const Standard_Real LinearTolerance);
		%feature("autodoc", "Args:
	Other(gp_Pnt)

Returns:
	Standard_Real

Computes the distance between two points.") Distance;
		Standard_Real Distance (const gp_Pnt  Other);
		%feature("autodoc", "Args:
	Other(gp_Pnt)

Returns:
	Standard_Real

Computes the square distance between two points.") SquareDistance;
		Standard_Real SquareDistance (const gp_Pnt  Other);
		%feature("autodoc", "Args:
	P(gp_Pnt)

Returns:
	None

Performs the symmetrical transformation of a point  
 with respect to the point P which is the center of  
 the  symmetry.") Mirror;
		void Mirror (const gp_Pnt  P);
		%feature("autodoc", "Args:
	P(gp_Pnt)

Returns:
	gp_Pnt

Performs the symmetrical transformation of a point  
 with respect to an axis placement which is the axis  
 of the symmetry.") Mirrored;
		gp_Pnt Mirrored (const gp_Pnt  P);
		%feature("autodoc", "Args:
	A1(gp_Ax1)

Returns:
	None

No detailed docstring for this function.") Mirror;
		void Mirror (const gp_Ax1  A1);
		%feature("autodoc", "Args:
	A1(gp_Ax1)

Returns:
	gp_Pnt

Performs the symmetrical transformation of a point  
 with respect to a plane. The axis placement A2 locates  
 the plane of the symmetry : (Location, XDirection, YDirection).") Mirrored;
		gp_Pnt Mirrored (const gp_Ax1  A1);
		%feature("autodoc", "Args:
	A2(gp_Ax2)

Returns:
	None

No detailed docstring for this function.") Mirror;
		void Mirror (const gp_Ax2  A2);
		%feature("autodoc", "Args:
	A2(gp_Ax2)

Returns:
	gp_Pnt

Rotates a point. A1 is the axis of the rotation.  
 Ang is the angular value of the rotation in radians.") Mirrored;
		gp_Pnt Mirrored (const gp_Ax2  A2);
		%feature("autodoc", "Args:
	A1(gp_Ax1)
	Ang(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Rotate;
		void Rotate (const gp_Ax1  A1,const Standard_Real Ang);
		%feature("autodoc", "Args:
	A1(gp_Ax1)
	Ang(Standard_Real)

Returns:
	gp_Pnt

Scales a point. S is the scaling value.") Rotated;
		gp_Pnt Rotated (const gp_Ax1  A1,const Standard_Real Ang);
		%feature("autodoc", "Args:
	P(gp_Pnt)
	S(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Scale;
		void Scale (const gp_Pnt  P,const Standard_Real S);
		%feature("autodoc", "Args:
	P(gp_Pnt)
	S(Standard_Real)

Returns:
	gp_Pnt

Transforms a point with the transformation T.") Scaled;
		gp_Pnt Scaled (const gp_Pnt  P,const Standard_Real S);
		%feature("autodoc", "Args:
	T(gp_Trsf)

Returns:
	None

No detailed docstring for this function.") Transform;
		void Transform (const gp_Trsf  T);
		%feature("autodoc", "Args:
	T(gp_Trsf)

Returns:
	gp_Pnt

Translates a point in the direction of the vector V.  
 The magnitude of the translation is the vector's magnitude.") Transformed;
		gp_Pnt Transformed (const gp_Trsf  T);
		%feature("autodoc", "Args:
	V(gp_Vec)

Returns:
	None

No detailed docstring for this function.") Translate;
		void Translate (const gp_Vec  V);
		%feature("autodoc", "Args:
	V(gp_Vec)

Returns:
	gp_Pnt

Translates a point from the point P1 to the point P2.") Translated;
		gp_Pnt Translated (const gp_Vec  V);
		%feature("autodoc", "Args:
	P1(gp_Pnt)
	P2(gp_Pnt)

Returns:
	None

No detailed docstring for this function.") Translate;
		void Translate (const gp_Pnt  P1,const gp_Pnt  P2);
		%feature("autodoc", "Args:
	P1(gp_Pnt)
	P2(gp_Pnt)

Returns:
	gp_Pnt

No detailed docstring for this function.") Translated;
		gp_Pnt Translated (const gp_Pnt  P1,const gp_Pnt  P2);
		%feature("autodoc", "Args:
	None
Returns:
	gp_XYZ

No detailed docstring for this function.") _CSFDB_Getgp_Pntcoord;
		const gp_XYZ & _CSFDB_Getgp_Pntcoord ();
};


%feature("shadow") gp_Pnt::~gp_Pnt %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend gp_Pnt {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor gp_Pnt2d;
class gp_Pnt2d {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

Creates a point with zero coordinates.") gp_Pnt2d;
		 gp_Pnt2d ();
		%feature("autodoc", "Args:
	Coord(gp_XY)

Returns:
	None

Creates a point with a doublet of coordinates.") gp_Pnt2d;
		 gp_Pnt2d (const gp_XY  Coord);
		%feature("autodoc", "Args:
	Xp(Standard_Real)
	Yp(Standard_Real)

Returns:
	None

Creates a  point with its 2 cartesian's coordinates : Xp, Yp.") gp_Pnt2d;
		 gp_Pnt2d (const Standard_Real Xp,const Standard_Real Yp);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	Xi(Standard_Real)

Returns:
	None

Assigns the value Xi to the coordinate that corresponds to Index:  
 Index = 1 => X is modified  
 Index = 2 => Y is modified  
Raises OutOfRange if Index != {1, 2}.") SetCoord;
		void SetCoord (const Standard_Integer Index,const Standard_Real Xi);
		%feature("autodoc", "Args:
	Xp(Standard_Real)
	Yp(Standard_Real)

Returns:
	None

For this point, assigns the values Xp and Yp to its two coordinates") SetCoord;
		void SetCoord (const Standard_Real Xp,const Standard_Real Yp);
		%feature("autodoc", "Args:
	X(Standard_Real)

Returns:
	None

Assigns the given value to the X  coordinate of this point.") SetX;
		void SetX (const Standard_Real X);
		%feature("autodoc", "Args:
	Y(Standard_Real)

Returns:
	None

Assigns the given value to the Y  coordinate of this point.") SetY;
		void SetY (const Standard_Real Y);
		%feature("autodoc", "Args:
	Coord(gp_XY)

Returns:
	None

Assigns the two coordinates of Coord to this point.") SetXY;
		void SetXY (const gp_XY  Coord);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Standard_Real

Returns the coordinate of range Index :  
 Index = 1 => X is returned  
 Index = 2 => Y is returned  
Raises OutOfRange if Index != {1, 2}.") Coord;
		Standard_Real Coord (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Xp(Standard_Real)
	Yp(Standard_Real)

Returns:
	None

For this point returns its two coordinates as a number pair.") Coord;
		void Coord (Standard_Real  Xp,Standard_Real  Yp);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

For this point, returns its X  coordinate.") X;
		Standard_Real X ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

For this point, returns its Y coordinate.") Y;
		Standard_Real Y ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_XY

For this point, returns its two coordinates as a number pair.") XY;
		const gp_XY & XY ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_XY

For this point, returns its two coordinates as a number pair.") Coord;
		const gp_XY & Coord ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_XY

Returns the coordinates of this point.  
Note: This syntax allows direct modification of the returned value.") ChangeCoord;
		gp_XY & ChangeCoord ();
		%feature("autodoc", "Args:
	Other(gp_Pnt2d)
	LinearTolerance(Standard_Real)

Returns:
	Standard_Boolean

Comparison  
 Returns True if the distance between the two  
 points is lower or equal to LinearTolerance.") IsEqual;
		Standard_Boolean IsEqual (const gp_Pnt2d  Other,const Standard_Real LinearTolerance);
		%feature("autodoc", "Args:
	Other(gp_Pnt2d)

Returns:
	Standard_Real

Computes the distance between two points.") Distance;
		Standard_Real Distance (const gp_Pnt2d  Other);
		%feature("autodoc", "Args:
	Other(gp_Pnt2d)

Returns:
	Standard_Real

Computes the square distance between two points.") SquareDistance;
		Standard_Real SquareDistance (const gp_Pnt2d  Other);
		%feature("autodoc", "Args:
	P(gp_Pnt2d)

Returns:
	None

Performs the symmetrical transformation of a point  
 with respect to the point P which is the center of  
 the  symmetry.") Mirror;
		void Mirror (const gp_Pnt2d  P);
		%feature("autodoc", "Args:
	P(gp_Pnt2d)

Returns:
	gp_Pnt2d

Performs the symmetrical transformation of a point  
 with respect to an axis placement which is the axis") Mirrored;
		gp_Pnt2d Mirrored (const gp_Pnt2d  P);
		%feature("autodoc", "Args:
	A(gp_Ax2d)

Returns:
	None

No detailed docstring for this function.") Mirror;
		void Mirror (const gp_Ax2d  A);
		%feature("autodoc", "Args:
	A(gp_Ax2d)

Returns:
	gp_Pnt2d

Rotates a point. A1 is the axis of the rotation.  
 Ang is the angular value of the rotation in radians.") Mirrored;
		gp_Pnt2d Mirrored (const gp_Ax2d  A);
		%feature("autodoc", "Args:
	P(gp_Pnt2d)
	Ang(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Rotate;
		void Rotate (const gp_Pnt2d  P,const Standard_Real Ang);
		%feature("autodoc", "Args:
	P(gp_Pnt2d)
	Ang(Standard_Real)

Returns:
	gp_Pnt2d

Scales a point. S is the scaling value.") Rotated;
		gp_Pnt2d Rotated (const gp_Pnt2d  P,const Standard_Real Ang);
		%feature("autodoc", "Args:
	P(gp_Pnt2d)
	S(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Scale;
		void Scale (const gp_Pnt2d  P,const Standard_Real S);
		%feature("autodoc", "Args:
	P(gp_Pnt2d)
	S(Standard_Real)

Returns:
	gp_Pnt2d

Transforms a point with the transformation T.") Scaled;
		gp_Pnt2d Scaled (const gp_Pnt2d  P,const Standard_Real S);
		%feature("autodoc", "Args:
	T(gp_Trsf2d)

Returns:
	None

No detailed docstring for this function.") Transform;
		void Transform (const gp_Trsf2d  T);
		%feature("autodoc", "Args:
	T(gp_Trsf2d)

Returns:
	gp_Pnt2d

Translates a point in the direction of the vector V.  
 The magnitude of the translation is the vector's magnitude.") Transformed;
		gp_Pnt2d Transformed (const gp_Trsf2d  T);
		%feature("autodoc", "Args:
	V(gp_Vec2d)

Returns:
	None

No detailed docstring for this function.") Translate;
		void Translate (const gp_Vec2d  V);
		%feature("autodoc", "Args:
	V(gp_Vec2d)

Returns:
	gp_Pnt2d

Translates a point from the point P1 to the point P2.") Translated;
		gp_Pnt2d Translated (const gp_Vec2d  V);
		%feature("autodoc", "Args:
	P1(gp_Pnt2d)
	P2(gp_Pnt2d)

Returns:
	None

No detailed docstring for this function.") Translate;
		void Translate (const gp_Pnt2d  P1,const gp_Pnt2d  P2);
		%feature("autodoc", "Args:
	P1(gp_Pnt2d)
	P2(gp_Pnt2d)

Returns:
	gp_Pnt2d

No detailed docstring for this function.") Translated;
		gp_Pnt2d Translated (const gp_Pnt2d  P1,const gp_Pnt2d  P2);
		%feature("autodoc", "Args:
	None
Returns:
	gp_XY

No detailed docstring for this function.") _CSFDB_Getgp_Pnt2dcoord;
		const gp_XY & _CSFDB_Getgp_Pnt2dcoord ();
};


%feature("shadow") gp_Pnt2d::~gp_Pnt2d %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend gp_Pnt2d {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor gp_Quaternion;
class gp_Quaternion {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

Creates an identity quaternion") gp_Quaternion;
		 gp_Quaternion ();
		%feature("autodoc", "Args:
	x(Standard_Real)
	y(Standard_Real)
	z(Standard_Real)
	w(Standard_Real)

Returns:
	None

Creates quaternion directly from component values") gp_Quaternion;
		 gp_Quaternion (const Standard_Real x,const Standard_Real y,const Standard_Real z,const Standard_Real w);
		%feature("autodoc", "Args:
	theToCopy(gp_Quaternion)

Returns:
	None

Creates copy of another quaternion") gp_Quaternion;
		 gp_Quaternion (const gp_Quaternion  theToCopy);
		%feature("autodoc", "Args:
	theVecFrom(gp_Vec)
	theVecTo(gp_Vec)

Returns:
	None

Creates quaternion representing shortest-arc rotation  
         operator producing vector theVecTo from vector theVecFrom.") gp_Quaternion;
		 gp_Quaternion (const gp_Vec  theVecFrom,const gp_Vec  theVecTo);
		%feature("autodoc", "Args:
	theVecFrom(gp_Vec)
	theVecTo(gp_Vec)
	theHelpCrossVec(gp_Vec)

Returns:
	None

Creates quaternion representing shortest-arc rotation  
         operator producing vector theVecTo from vector theVecFrom.  
         Additional vector theHelpCrossVec defines preferred direction for  
         rotation and is used when theVecTo and theVecFrom are directed  
         oppositely.") gp_Quaternion;
		 gp_Quaternion (const gp_Vec  theVecFrom,const gp_Vec  theVecTo,const gp_Vec  theHelpCrossVec);
		%feature("autodoc", "Args:
	theAxis(gp_Vec)
	theAngle(Standard_Real)

Returns:
	None

Creates quaternion representing rotation on angle  
         theAngle around vector theAxis") gp_Quaternion;
		 gp_Quaternion (const gp_Vec  theAxis,const Standard_Real theAngle);
		%feature("autodoc", "Args:
	theMat(gp_Mat)

Returns:
	None

Creates quaternion from rotation matrix 3*3  
         (which should be orthonormal skew-symmetric matrix)") gp_Quaternion;
		 gp_Quaternion (const gp_Mat  theMat);
		%feature("autodoc", "Args:
	theOther(gp_Quaternion)

Returns:
	Standard_Boolean

Simple equal test without precision") IsEqual;
		Standard_Boolean IsEqual (const gp_Quaternion  theOther);
		%feature("autodoc", "Args:
	theVecFrom(gp_Vec)
	theVecTo(gp_Vec)

Returns:
	None

Sets quaternion to shortest-arc rotation producing  
         vector theVecTo from vector theVecFrom.  
         If vectors theVecFrom and theVecTo are opposite then rotation  
         axis is computed as theVecFrom ^ (1,0,0) or theVecFrom ^ (0,0,1).") SetRotation;
		void SetRotation (const gp_Vec  theVecFrom,const gp_Vec  theVecTo);
		%feature("autodoc", "Args:
	theVecFrom(gp_Vec)
	theVecTo(gp_Vec)
	theHelpCrossVec(gp_Vec)

Returns:
	None

Sets quaternion to shortest-arc rotation producing  
         vector theVecTo from vector theVecFrom.  
         If vectors theVecFrom and theVecTo are opposite then rotation  
         axis is computed as theVecFrom ^ theHelpCrossVec.") SetRotation;
		void SetRotation (const gp_Vec  theVecFrom,const gp_Vec  theVecTo,const gp_Vec  theHelpCrossVec);
		%feature("autodoc", "Args:
	theAxis(gp_Vec)
	theAngle(Standard_Real)

Returns:
	None

Create a unit quaternion from Axis+Angle representation") SetVectorAndAngle;
		void SetVectorAndAngle (const gp_Vec  theAxis,const Standard_Real theAngle);
		%feature("autodoc", "Args:
	theAxis(gp_Vec)
	theAngle(Standard_Real)

Returns:
	None

Convert a quaternion to Axis+Angle representation,  
         preserve the axis direction and angle from -PI to +PI") GetVectorAndAngle;
		void GetVectorAndAngle (gp_Vec  theAxis,Standard_Real  theAngle);
		%feature("autodoc", "Args:
	theMat(gp_Mat)

Returns:
	None

Create a unit quaternion by rotation matrix  
         matrix must contain only rotation (not scale or shear)  
 
         For numerical stability we find first the greatest component of quaternion  
         and than search others from this one") SetMatrix;
		void SetMatrix (const gp_Mat  theMat);
		%feature("autodoc", "Args:
	None
Returns:
	gp_Mat

Returns rotation operation as 3*3 matrix") GetMatrix;
		gp_Mat GetMatrix ();
		%feature("autodoc", "Args:
	theOrder(gp_EulerSequence)
	theAlpha(Standard_Real)
	theBeta(Standard_Real)
	theGamma(Standard_Real)

Returns:
	None

Create a unit quaternion representing rotation defined  
         by generalized Euler angles") SetEulerAngles;
		void SetEulerAngles (const gp_EulerSequence theOrder,const Standard_Real theAlpha,const Standard_Real theBeta,const Standard_Real theGamma);
		%feature("autodoc", "Args:
	theOrder(gp_EulerSequence)
	theAlpha(Standard_Real)
	theBeta(Standard_Real)
	theGamma(Standard_Real)

Returns:
	None

Returns Euler angles describing current rotation") GetEulerAngles;
		void GetEulerAngles (const gp_EulerSequence theOrder,Standard_Real  theAlpha,Standard_Real  theBeta,Standard_Real  theGamma);
		%feature("autodoc", "Args:
	x(Standard_Real)
	y(Standard_Real)
	z(Standard_Real)
	w(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Set;
		void Set (const Standard_Real x,const Standard_Real y,const Standard_Real z,const Standard_Real w);
		%feature("autodoc", "Args:
	theQuaternion(gp_Quaternion)

Returns:
	None

No detailed docstring for this function.") Set;
		void Set (const gp_Quaternion  theQuaternion);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") X;
		Standard_Real X ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") Y;
		Standard_Real Y ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") Z;
		Standard_Real Z ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") W;
		Standard_Real W ();
		%feature("autodoc", "Args:
	None
Returns:
	None

Make identity quaternion (zero-rotation)") SetIdent;
		void SetIdent ();
		%feature("autodoc", "Args:
	None
Returns:
	None

Reverse direction of rotation (conjugate quaternion)") Reverse;
		void Reverse ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Quaternion

Return rotation with reversed direction (conjugated quaternion)") Reversed;
		gp_Quaternion Reversed ();
		%feature("autodoc", "Args:
	None
Returns:
	None

Inverts quaternion (both rotation direction and norm)") Invert;
		void Invert ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Quaternion

Return inversed quaternion q^-1") Inverted;
		gp_Quaternion Inverted ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

Returns square norm of quaternion") SquareNorm;
		Standard_Real SquareNorm ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

Returns norm of quaternion") Norm;
		Standard_Real Norm ();
		%feature("autodoc", "Args:
	theScale(Standard_Real)

Returns:
	None

Scale all components by quaternion by theScale; note that  
         rotation is not changed by this operation (except 0-scaling)") Scale;
		void Scale (const Standard_Real theScale);
		%feature("autodoc", "Args:
	theScale(Standard_Real)

Returns:
	None

No detailed docstring for this function.") operator*=;
		void operator *= (const Standard_Real theScale);
		%feature("autodoc", "Args:
	theScale(Standard_Real)

Returns:
	gp_Quaternion

Returns scaled quaternion") Scaled;
		gp_Quaternion Scaled (const Standard_Real theScale);
		%feature("autodoc", "Args:
	theScale(Standard_Real)

Returns:
	gp_Quaternion

No detailed docstring for this function.") operator*;
		gp_Quaternion operator * (const Standard_Real theScale);
		%feature("autodoc", "Args:
	None
Returns:
	None

Stabilize quaternion length within 1 - 1/4.  
         This operation is a lot faster than normalization  
         and preserve length goes to 0 or infinity") StabilizeLength;
		void StabilizeLength ();
		%feature("autodoc", "Args:
	None
Returns:
	None

Scale quaternion that its norm goes to 1.  
         The appearing of 0 magnitude or near is a error,  
         so we can be sure that can divide by magnitude") Normalize;
		void Normalize ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Quaternion

Returns quaternion scaled so that its norm goes to 1.") Normalized;
		gp_Quaternion Normalized ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Quaternion

Returns quaternion with all components negated.  
         Note that this operation does not affect neither  
         rotation operator defined by quaternion nor its norm.") Negated;
		gp_Quaternion Negated ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Quaternion

No detailed docstring for this function.") operator-;
		gp_Quaternion operator - ();
		%feature("autodoc", "Args:
	theOther(gp_Quaternion)

Returns:
	gp_Quaternion

Makes sum of quaternion components; result is 'rotations mix'") Added;
		gp_Quaternion Added (const gp_Quaternion  theOther);
		%feature("autodoc", "Args:
	theOther(gp_Quaternion)

Returns:
	gp_Quaternion

No detailed docstring for this function.") operator+;
		gp_Quaternion operator + (const gp_Quaternion  theOther);
		%feature("autodoc", "Args:
	theOther(gp_Quaternion)

Returns:
	gp_Quaternion

Makes difference of quaternion components; result is 'rotations mix'") Subtracted;
		gp_Quaternion Subtracted (const gp_Quaternion  theOther);
		%feature("autodoc", "Args:
	theOther(gp_Quaternion)

Returns:
	gp_Quaternion

No detailed docstring for this function.") operator-;
		gp_Quaternion operator - (const gp_Quaternion  theOther);
		%feature("autodoc", "Args:
	theOther(gp_Quaternion)

Returns:
	gp_Quaternion

Multiply function - work the same as Matrices multiplying.  
         qq' = (cross(v,v') + wv' + w'v, ww' - dot(v,v'))  
         Result is rotation combination: q' than q (here q=this, q'=theQ).  
         Notices than:  
         qq' != q'q;  
         qq^-1 = q;") Multiplied;
		gp_Quaternion Multiplied (const gp_Quaternion  theOther);
		%feature("autodoc", "Args:
	theOther(gp_Quaternion)

Returns:
	gp_Quaternion

No detailed docstring for this function.") operator*;
		gp_Quaternion operator * (const gp_Quaternion  theOther);
		%feature("autodoc", "Args:
	theOther(gp_Quaternion)

Returns:
	None

Adds componnets of other quaternion; result is 'rotations mix'") Add;
		void Add (const gp_Quaternion  theOther);
		%feature("autodoc", "Args:
	theOther(gp_Quaternion)

Returns:
	None

No detailed docstring for this function.") operator+=;
		void operator += (const gp_Quaternion  theOther);
		%feature("autodoc", "Args:
	theOther(gp_Quaternion)

Returns:
	None

Subtracts componnets of other quaternion; result is 'rotations mix'") Subtract;
		void Subtract (const gp_Quaternion  theOther);
		%feature("autodoc", "Args:
	theOther(gp_Quaternion)

Returns:
	None

No detailed docstring for this function.") operator-=;
		void operator -= (const gp_Quaternion  theOther);
		%feature("autodoc", "Args:
	theOther(gp_Quaternion)

Returns:
	None

Adds rotation by multiplication") Multiply;
		void Multiply (const gp_Quaternion  theOther);
		%feature("autodoc", "Args:
	theOther(gp_Quaternion)

Returns:
	None

No detailed docstring for this function.") operator*=;
		void operator *= (const gp_Quaternion  theOther);
		%feature("autodoc", "Args:
	theOther(gp_Quaternion)

Returns:
	Standard_Real

Computes inner product / scalar product / Dot") Dot;
		Standard_Real Dot (const gp_Quaternion  theOther);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

Return rotation angle from -PI to PI") GetRotationAngle;
		Standard_Real GetRotationAngle ();
		%feature("autodoc", "Args:
	theVec(gp_Vec)

Returns:
	gp_Vec

Rotates vector by quaternion as rotation operator") Multiply;
		gp_Vec Multiply (const gp_Vec  theVec);
		%feature("autodoc", "Args:
	theVec(gp_Vec)

Returns:
	gp_Vec

No detailed docstring for this function.") operator*;
		gp_Vec operator * (const gp_Vec  theVec);
};


%feature("shadow") gp_Quaternion::~gp_Quaternion %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend gp_Quaternion {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor gp_QuaternionNLerp;
class gp_QuaternionNLerp {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") gp_QuaternionNLerp;
		 gp_QuaternionNLerp ();
		%feature("autodoc", "Args:
	theQStart(gp_Quaternion)
	theQEnd(gp_Quaternion)

Returns:
	None

No detailed docstring for this function.") gp_QuaternionNLerp;
		 gp_QuaternionNLerp (const gp_Quaternion  theQStart,const gp_Quaternion  theQEnd);
		%feature("autodoc", "Args:
	theQStart(gp_Quaternion)
	theQEnd(gp_Quaternion)

Returns:
	None

No detailed docstring for this function.") Init;
		void Init (const gp_Quaternion  theQStart,const gp_Quaternion  theQEnd);
		%feature("autodoc", "Args:
	theQStart(gp_Quaternion)
	theQEnd(gp_Quaternion)

Returns:
	None

No detailed docstring for this function.") InitFromUnit;
		void InitFromUnit (const gp_Quaternion  theQStart,const gp_Quaternion  theQEnd);
		%feature("autodoc", "Args:
	theT(Standard_Real)
	theResultQ(gp_Quaternion)

Returns:
	None

Set interpolated quaternion for theT position (from 0.0 to 1.0)") Interpolate;
		void Interpolate (Standard_Real theT,gp_Quaternion  theResultQ);
		%feature("autodoc", "Args:
	theQStart(gp_Quaternion)
	theQEnd(gp_Quaternion)
	theT(Standard_Real)

Returns:
	static gp_Quaternion

No detailed docstring for this function.") Interpolate;
		static gp_Quaternion Interpolate (const gp_Quaternion  theQStart,const gp_Quaternion  theQEnd,Standard_Real theT);
};


%feature("shadow") gp_QuaternionNLerp::~gp_QuaternionNLerp %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend gp_QuaternionNLerp {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor gp_QuaternionSLerp;
class gp_QuaternionSLerp {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") gp_QuaternionSLerp;
		 gp_QuaternionSLerp ();
		%feature("autodoc", "Args:
	theQStart(gp_Quaternion)
	theQEnd(gp_Quaternion)

Returns:
	None

No detailed docstring for this function.") gp_QuaternionSLerp;
		 gp_QuaternionSLerp (const gp_Quaternion  theQStart,const gp_Quaternion  theQEnd);
		%feature("autodoc", "Args:
	theQStart(gp_Quaternion)
	theQEnd(gp_Quaternion)

Returns:
	None

No detailed docstring for this function.") Init;
		void Init (const gp_Quaternion  theQStart,const gp_Quaternion  theQEnd);
		%feature("autodoc", "Args:
	theQStart(gp_Quaternion)
	theQEnd(gp_Quaternion)

Returns:
	None

No detailed docstring for this function.") InitFromUnit;
		void InitFromUnit (const gp_Quaternion  theQStart,const gp_Quaternion  theQEnd);
		%feature("autodoc", "Args:
	theT(Standard_Real)
	theResultQ(gp_Quaternion)

Returns:
	None

Set interpolated quaternion for theT position (from 0.0 to 1.0)") Interpolate;
		void Interpolate (Standard_Real theT,gp_Quaternion  theResultQ);
};


%feature("shadow") gp_QuaternionSLerp::~gp_QuaternionSLerp %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend gp_QuaternionSLerp {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor gp_Sphere;
class gp_Sphere {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

Creates an indefinite sphere.") gp_Sphere;
		 gp_Sphere ();
		%feature("autodoc", "Args:
	A3(gp_Ax3)
	Radius(Standard_Real)

Returns:
	None

Constructs a sphere with radius Radius, centered on the origin  
  of A3.  A3 is the local coordinate system of the sphere.  
 Warnings :  
 It is not forbidden to create a sphere with null radius.  
Raises ConstructionError if Radius < 0.0") gp_Sphere;
		 gp_Sphere (const gp_Ax3  A3,const Standard_Real Radius);
		%feature("autodoc", "Args:
	Loc(gp_Pnt)

Returns:
	None

Changes the center of the sphere.") SetLocation;
		void SetLocation (const gp_Pnt  Loc);
		%feature("autodoc", "Args:
	A3(gp_Ax3)

Returns:
	None

Changes the local coordinate system of the sphere.") SetPosition;
		void SetPosition (const gp_Ax3  A3);
		%feature("autodoc", "Args:
	R(Standard_Real)

Returns:
	None

Assigns R the radius of the Sphere.  
Warnings :  
 It is not forbidden to create a sphere with null radius.  
Raises ConstructionError if R < 0.0") SetRadius;
		void SetRadius (const Standard_Real R);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

Computes the aera of the sphere.") Area;
		Standard_Real Area ();
		%feature("autodoc", "Args:
	A1(Standard_Real)
	A2(Standard_Real)
	A3(Standard_Real)
	B1(Standard_Real)
	B2(Standard_Real)
	B3(Standard_Real)
	C1(Standard_Real)
	C2(Standard_Real)
	C3(Standard_Real)
	D(Standard_Real)

Returns:
	None

Computes the coefficients of the implicit equation of the quadric  
 in the absolute cartesian coordinates system :  
 A1.X**2 + A2.Y**2 + A3.Z**2 + 2.(B1.X.Y + B2.X.Z + B3.Y.Z) +  
 2.(C1.X + C2.Y + C3.Z) + D = 0.0") Coefficients;
		void Coefficients (Standard_Real  A1,Standard_Real  A2,Standard_Real  A3,Standard_Real  B1,Standard_Real  B2,Standard_Real  B3,Standard_Real  C1,Standard_Real  C2,Standard_Real  C3,Standard_Real  D);
		%feature("autodoc", "Args:
	None
Returns:
	None

Reverses the   U   parametrization of   the sphere  
         reversing the YAxis.") UReverse;
		void UReverse ();
		%feature("autodoc", "Args:
	None
Returns:
	None

Reverses the   V   parametrization of   the  sphere  
         reversing the ZAxis.") VReverse;
		void VReverse ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns true if the local coordinate system of this sphere  
is right-handed.") Direct;
		Standard_Boolean Direct ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Pnt

//!--- Purpose ;  
 Returns the center of the sphere.") Location;
		const gp_Pnt & Location ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Ax3

Returns the local coordinates system of the sphere.") Position;
		const gp_Ax3 & Position ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

Returns the radius of the sphere.") Radius;
		Standard_Real Radius ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

Computes the volume of the sphere") Volume;
		Standard_Real Volume ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Ax1

Returns the axis X of the sphere.") XAxis;
		gp_Ax1 XAxis ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Ax1

Returns the axis Y of the sphere.") YAxis;
		gp_Ax1 YAxis ();
		%feature("autodoc", "Args:
	P(gp_Pnt)

Returns:
	None

No detailed docstring for this function.") Mirror;
		void Mirror (const gp_Pnt  P);
		%feature("autodoc", "Args:
	P(gp_Pnt)

Returns:
	gp_Sphere

Performs the symmetrical transformation of a sphere  
 with respect to the point P which is the center of the  
 symmetry.") Mirrored;
		gp_Sphere Mirrored (const gp_Pnt  P);
		%feature("autodoc", "Args:
	A1(gp_Ax1)

Returns:
	None

No detailed docstring for this function.") Mirror;
		void Mirror (const gp_Ax1  A1);
		%feature("autodoc", "Args:
	A1(gp_Ax1)

Returns:
	gp_Sphere

Performs the symmetrical transformation of a sphere with  
 respect to an axis placement which is the axis of the  
 symmetry.") Mirrored;
		gp_Sphere Mirrored (const gp_Ax1  A1);
		%feature("autodoc", "Args:
	A2(gp_Ax2)

Returns:
	None

No detailed docstring for this function.") Mirror;
		void Mirror (const gp_Ax2  A2);
		%feature("autodoc", "Args:
	A2(gp_Ax2)

Returns:
	gp_Sphere

Performs the symmetrical transformation of a sphere with respect  
 to a plane. The axis placement A2 locates the plane of the  
 of the symmetry : (Location, XDirection, YDirection).") Mirrored;
		gp_Sphere Mirrored (const gp_Ax2  A2);
		%feature("autodoc", "Args:
	A1(gp_Ax1)
	Ang(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Rotate;
		void Rotate (const gp_Ax1  A1,const Standard_Real Ang);
		%feature("autodoc", "Args:
	A1(gp_Ax1)
	Ang(Standard_Real)

Returns:
	gp_Sphere

Rotates a sphere. A1 is the axis of the rotation.  
 Ang is the angular value of the rotation in radians.") Rotated;
		gp_Sphere Rotated (const gp_Ax1  A1,const Standard_Real Ang);
		%feature("autodoc", "Args:
	P(gp_Pnt)
	S(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Scale;
		void Scale (const gp_Pnt  P,const Standard_Real S);
		%feature("autodoc", "Args:
	P(gp_Pnt)
	S(Standard_Real)

Returns:
	gp_Sphere

Scales a sphere. S is the scaling value.  
 The absolute value of S is used to scale the sphere") Scaled;
		gp_Sphere Scaled (const gp_Pnt  P,const Standard_Real S);
		%feature("autodoc", "Args:
	T(gp_Trsf)

Returns:
	None

No detailed docstring for this function.") Transform;
		void Transform (const gp_Trsf  T);
		%feature("autodoc", "Args:
	T(gp_Trsf)

Returns:
	gp_Sphere

Transforms a sphere with the transformation T from class Trsf.") Transformed;
		gp_Sphere Transformed (const gp_Trsf  T);
		%feature("autodoc", "Args:
	V(gp_Vec)

Returns:
	None

No detailed docstring for this function.") Translate;
		void Translate (const gp_Vec  V);
		%feature("autodoc", "Args:
	V(gp_Vec)

Returns:
	gp_Sphere

Translates a sphere in the direction of the vector V.  
 The magnitude of the translation is the vector's magnitude.") Translated;
		gp_Sphere Translated (const gp_Vec  V);
		%feature("autodoc", "Args:
	P1(gp_Pnt)
	P2(gp_Pnt)

Returns:
	None

No detailed docstring for this function.") Translate;
		void Translate (const gp_Pnt  P1,const gp_Pnt  P2);
		%feature("autodoc", "Args:
	P1(gp_Pnt)
	P2(gp_Pnt)

Returns:
	gp_Sphere

Translates a sphere from the point P1 to the point P2.") Translated;
		gp_Sphere Translated (const gp_Pnt  P1,const gp_Pnt  P2);
		%feature("autodoc", "Args:
	None
Returns:
	gp_Ax3

No detailed docstring for this function.") _CSFDB_Getgp_Spherepos;
		const gp_Ax3 & _CSFDB_Getgp_Spherepos ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") _CSFDB_Getgp_Sphereradius;
		Standard_Real _CSFDB_Getgp_Sphereradius ();
		%feature("autodoc", "Args:
	p(Standard_Real)

Returns:
	None

No detailed docstring for this function.") _CSFDB_Setgp_Sphereradius;
		void _CSFDB_Setgp_Sphereradius (const Standard_Real p);
};


%feature("shadow") gp_Sphere::~gp_Sphere %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend gp_Sphere {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor gp_Torus;
class gp_Torus {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

creates an indefinite Torus.") gp_Torus;
		 gp_Torus ();
		%feature("autodoc", "Args:
	A3(gp_Ax3)
	MajorRadius(Standard_Real)
	MinorRadius(Standard_Real)

Returns:
	None

a torus centered on the origin of coordinate system  
  A3, with major radius MajorRadius and minor radius  
  MinorRadius, and with the reference plane defined  
  by the origin, the 'X Direction' and the 'Y Direction' of A3.  
 Warnings :  
 It is not forbidden to create a torus with  
 MajorRadius = MinorRadius = 0.0  
Raises ConstructionError if MinorRadius < 0.0 or if MajorRadius < 0.0") gp_Torus;
		 gp_Torus (const gp_Ax3  A3,const Standard_Real MajorRadius,const Standard_Real MinorRadius);
		%feature("autodoc", "Args:
	A1(gp_Ax1)

Returns:
	None

Modifies this torus, by redefining its local coordinate  
system so that:  
-   its origin and 'main Direction' become those of the  
axis A1 (the 'X Direction' and 'Y Direction' are then recomputed).  
Raises ConstructionError if the direction of A1 is parallel to the 'XDirection'  
 of the coordinate system of the toroidal surface.") SetAxis;
		void SetAxis (const gp_Ax1  A1);
		%feature("autodoc", "Args:
	Loc(gp_Pnt)

Returns:
	None

Changes the location of the torus.") SetLocation;
		void SetLocation (const gp_Pnt  Loc);
		%feature("autodoc", "Args:
	MajorRadius(Standard_Real)

Returns:
	None

Assigns value to the major radius  of this torus.  
Raises ConstructionError if MajorRadius - MinorRadius <= Resolution()") SetMajorRadius;
		void SetMajorRadius (const Standard_Real MajorRadius);
		%feature("autodoc", "Args:
	MinorRadius(Standard_Real)

Returns:
	None

Assigns value to the  minor radius of this torus.  
Raises ConstructionError if MinorRadius < 0.0 or if  
 MajorRadius - MinorRadius <= Resolution from gp.") SetMinorRadius;
		void SetMinorRadius (const Standard_Real MinorRadius);
		%feature("autodoc", "Args:
	A3(gp_Ax3)

Returns:
	None

Changes the local coordinate system of the surface.") SetPosition;
		void SetPosition (const gp_Ax3  A3);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

Computes the area of the torus.") Area;
		Standard_Real Area ();
		%feature("autodoc", "Args:
	None
Returns:
	None

Reverses the   U   parametrization of   the  torus  
         reversing the YAxis.") UReverse;
		void UReverse ();
		%feature("autodoc", "Args:
	None
Returns:
	None

Reverses the   V   parametrization of   the  torus  
         reversing the ZAxis.") VReverse;
		void VReverse ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

returns true if the Ax3, the local coordinate system of this torus, is right handed.") Direct;
		Standard_Boolean Direct ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Ax1

returns the symmetry axis of the torus.") Axis;
		const gp_Ax1 & Axis ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Pnt

Returns the Torus's location.") Location;
		const gp_Pnt & Location ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Ax3

Returns the local coordinates system of the torus.") Position;
		const gp_Ax3 & Position ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

returns the major radius of the torus.") MajorRadius;
		Standard_Real MajorRadius ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

returns the minor radius of the torus.") MinorRadius;
		Standard_Real MinorRadius ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

Computes the volume of the torus.") Volume;
		Standard_Real Volume ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Ax1

returns the axis X of the torus.") XAxis;
		gp_Ax1 XAxis ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Ax1

returns the axis Y of the torus.") YAxis;
		gp_Ax1 YAxis ();
		%feature("autodoc", "Args:
	P(gp_Pnt)

Returns:
	None

No detailed docstring for this function.") Mirror;
		void Mirror (const gp_Pnt  P);
		%feature("autodoc", "Args:
	P(gp_Pnt)

Returns:
	gp_Torus

Performs the symmetrical transformation of a torus  
 with respect to the point P which is the center of the  
 symmetry.") Mirrored;
		gp_Torus Mirrored (const gp_Pnt  P);
		%feature("autodoc", "Args:
	A1(gp_Ax1)

Returns:
	None

No detailed docstring for this function.") Mirror;
		void Mirror (const gp_Ax1  A1);
		%feature("autodoc", "Args:
	A1(gp_Ax1)

Returns:
	gp_Torus

Performs the symmetrical transformation of a torus with  
 respect to an axis placement which is the axis of the  
 symmetry.") Mirrored;
		gp_Torus Mirrored (const gp_Ax1  A1);
		%feature("autodoc", "Args:
	A2(gp_Ax2)

Returns:
	None

No detailed docstring for this function.") Mirror;
		void Mirror (const gp_Ax2  A2);
		%feature("autodoc", "Args:
	A2(gp_Ax2)

Returns:
	gp_Torus

Performs the symmetrical transformation of a torus with respect  
 to a plane. The axis placement A2 locates the plane of the  
 of the symmetry : (Location, XDirection, YDirection).") Mirrored;
		gp_Torus Mirrored (const gp_Ax2  A2);
		%feature("autodoc", "Args:
	A1(gp_Ax1)
	Ang(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Rotate;
		void Rotate (const gp_Ax1  A1,const Standard_Real Ang);
		%feature("autodoc", "Args:
	A1(gp_Ax1)
	Ang(Standard_Real)

Returns:
	gp_Torus

Rotates a torus. A1 is the axis of the rotation.  
 Ang is the angular value of the rotation in radians.") Rotated;
		gp_Torus Rotated (const gp_Ax1  A1,const Standard_Real Ang);
		%feature("autodoc", "Args:
	P(gp_Pnt)
	S(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Scale;
		void Scale (const gp_Pnt  P,const Standard_Real S);
		%feature("autodoc", "Args:
	P(gp_Pnt)
	S(Standard_Real)

Returns:
	gp_Torus

Scales a torus. S is the scaling value.  
 The absolute value of S is used to scale the torus") Scaled;
		gp_Torus Scaled (const gp_Pnt  P,const Standard_Real S);
		%feature("autodoc", "Args:
	T(gp_Trsf)

Returns:
	None

No detailed docstring for this function.") Transform;
		void Transform (const gp_Trsf  T);
		%feature("autodoc", "Args:
	T(gp_Trsf)

Returns:
	gp_Torus

Transforms a torus with the transformation T from class Trsf.") Transformed;
		gp_Torus Transformed (const gp_Trsf  T);
		%feature("autodoc", "Args:
	V(gp_Vec)

Returns:
	None

No detailed docstring for this function.") Translate;
		void Translate (const gp_Vec  V);
		%feature("autodoc", "Args:
	V(gp_Vec)

Returns:
	gp_Torus

Translates a torus in the direction of the vector V.  
 The magnitude of the translation is the vector's magnitude.") Translated;
		gp_Torus Translated (const gp_Vec  V);
		%feature("autodoc", "Args:
	P1(gp_Pnt)
	P2(gp_Pnt)

Returns:
	None

No detailed docstring for this function.") Translate;
		void Translate (const gp_Pnt  P1,const gp_Pnt  P2);
		%feature("autodoc", "Args:
	P1(gp_Pnt)
	P2(gp_Pnt)

Returns:
	gp_Torus

Translates a torus from the point P1 to the point P2.") Translated;
		gp_Torus Translated (const gp_Pnt  P1,const gp_Pnt  P2);
		%feature("autodoc", "Args:
	None
Returns:
	gp_Ax3

No detailed docstring for this function.") _CSFDB_Getgp_Toruspos;
		const gp_Ax3 & _CSFDB_Getgp_Toruspos ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") _CSFDB_Getgp_TorusmajorRadius;
		Standard_Real _CSFDB_Getgp_TorusmajorRadius ();
		%feature("autodoc", "Args:
	p(Standard_Real)

Returns:
	None

No detailed docstring for this function.") _CSFDB_Setgp_TorusmajorRadius;
		void _CSFDB_Setgp_TorusmajorRadius (const Standard_Real p);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") _CSFDB_Getgp_TorusminorRadius;
		Standard_Real _CSFDB_Getgp_TorusminorRadius ();
		%feature("autodoc", "Args:
	p(Standard_Real)

Returns:
	None

No detailed docstring for this function.") _CSFDB_Setgp_TorusminorRadius;
		void _CSFDB_Setgp_TorusminorRadius (const Standard_Real p);
};


%feature("shadow") gp_Torus::~gp_Torus %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend gp_Torus {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor gp_Trsf;
class gp_Trsf {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

Returns the identity transformation.") gp_Trsf;
		 gp_Trsf ();
		%feature("autodoc", "Args:
	T(gp_Trsf2d)

Returns:
	None

Creates  a 3D transformation from the 2D transformation T.  
The resulting transformation has a homogeneous  
vectorial part, V3, and a translation part, T3, built from T:  
      a11    a12  
0             a13  
V3 =    a21    a22    0       T3  
=   a23  
          0    0    1.  
0  
It also has the same scale factor as T. This  
guarantees (by projection) that the transformation  
which would be performed by T in a plane (2D space)  
is performed by the resulting transformation in the xOy  
plane of the 3D space, (i.e. in the plane defined by the  
origin (0., 0., 0.) and the vectors DX (1., 0., 0.), and DY  
(0., 1., 0.)). The scale factor is applied to the entire space.") gp_Trsf;
		 gp_Trsf (const gp_Trsf2d  T);
		%feature("autodoc", "Args:
	P(gp_Pnt)

Returns:
	None

Makes the transformation into a symmetrical transformation.  
 P is the center of the symmetry.") SetMirror;
		void SetMirror (const gp_Pnt  P);
		%feature("autodoc", "Args:
	A1(gp_Ax1)

Returns:
	None

Makes the transformation into a symmetrical transformation.  
 A1 is the center of the axial symmetry.") SetMirror;
		void SetMirror (const gp_Ax1  A1);
		%feature("autodoc", "Args:
	A2(gp_Ax2)

Returns:
	None

Makes the transformation into a symmetrical transformation.  
 A2 is the center of the planar symmetry  
 and defines the plane of symmetry by its origin, 'X  
 Direction' and 'Y Direction'.") SetMirror;
		void SetMirror (const gp_Ax2  A2);
		%feature("autodoc", "Args:
	A1(gp_Ax1)
	Ang(Standard_Real)

Returns:
	None

Changes the transformation into a rotation.  
 A1 is the rotation axis and Ang is the angular value of the  
 rotation in radians.") SetRotation;
		void SetRotation (const gp_Ax1  A1,const Standard_Real Ang);
		%feature("autodoc", "Args:
	R(gp_Quaternion)

Returns:
	None

Changes the transformation into a rotation defined by quaternion.  
 Note that rotation is performed around origin, i.e.  
 no translation is involved.") SetRotation;
		void SetRotation (const gp_Quaternion  R);
		%feature("autodoc", "Args:
	P(gp_Pnt)
	S(Standard_Real)

Returns:
	None

Changes the transformation into a scale.  
 P is the center of the scale and S is the scaling value.  
 Raises ConstructionError  If <S> is null.") SetScale;
		void SetScale (const gp_Pnt  P,const Standard_Real S);
		%feature("autodoc", "Args:
	FromSystem1(gp_Ax3)
	ToSystem2(gp_Ax3)

Returns:
	None

Modifies this transformation so that it transforms the  
 coordinate system defined by FromSystem1 into the  
 one defined by ToSystem2. After this modification, this  
 transformation transforms:  
-   the origin of FromSystem1 into the origin of ToSystem2,  
-   the 'X Direction' of FromSystem1 into the 'X  
  Direction' of ToSystem2,  
-   the 'Y Direction' of FromSystem1 into the 'Y  
  Direction' of ToSystem2, and  
-   the 'main Direction' of FromSystem1 into the 'main  
  Direction' of ToSystem2.  
Warning  
When you know the coordinates of a point in one  
coordinate system and you want to express these  
coordinates in another one, do not use the  
transformation resulting from this function. Use the  
transformation that results from SetTransformation instead.  
SetDisplacement and SetTransformation create  
related transformations: the vectorial part of one is the  
inverse of the vectorial part of the other.") SetDisplacement;
		void SetDisplacement (const gp_Ax3  FromSystem1,const gp_Ax3  ToSystem2);
		%feature("autodoc", "Args:
	FromSystem1(gp_Ax3)
	ToSystem2(gp_Ax3)

Returns:
	None

Modifies this transformation so that it transforms the  
coordinates of any point, (x, y, z), relative to a source  
coordinate system into the coordinates (x', y', z') which  
are relative to a target coordinate system, but which  
represent the same point  
 The transformation is from the coordinate  
 system 'FromSystem1' to the coordinate system 'ToSystem2'.  
Example :  
 In a C++ implementation :  
 Real x1, y1, z1;  // are the coordinates of a point in the  
                   // local system FromSystem1  
 Real x2, y2, z2;  // are the coordinates of a point in the  
                   // local system ToSystem2  
 gp_Pnt P1 (x1, y1, z1)  
 Trsf T;  
 T.SetTransformation (FromSystem1, ToSystem2);  
 gp_Pnt P2 = P1.Transformed (T);  
 P2.Coord (x2, y2, z2);") SetTransformation;
		void SetTransformation (const gp_Ax3  FromSystem1,const gp_Ax3  ToSystem2);
		%feature("autodoc", "Args:
	ToSystem(gp_Ax3)

Returns:
	None

Modifies this transformation so that it transforms the  
 coordinates of any point, (x, y, z), relative to a source  
 coordinate system into the coordinates (x', y', z') which  
 are relative to a target coordinate system, but which  
 represent the same point  
 The transformation is from the default coordinate system  
 {P(0.,0.,0.), VX (1.,0.,0.), VY (0.,1.,0.), VZ (0., 0. ,1.) }  
 to the local coordinate system defined with the Ax3 ToSystem.  
 Use in the same way  as the previous method. FromSystem1 is  
 defaulted to the absolute coordinate system.") SetTransformation;
		void SetTransformation (const gp_Ax3  ToSystem);
		%feature("autodoc", "Args:
	R(gp_Quaternion)
	T(gp_Vec)

Returns:
	None

Sets transformation by directly specified rotation and translation.") SetTransformation;
		void SetTransformation (const gp_Quaternion  R,const gp_Vec  T);
		%feature("autodoc", "Args:
	V(gp_Vec)

Returns:
	None

Changes the transformation into a translation.  
 V is the vector of the translation.") SetTranslation;
		void SetTranslation (const gp_Vec  V);
		%feature("autodoc", "Args:
	P1(gp_Pnt)
	P2(gp_Pnt)

Returns:
	None

Makes the transformation into a translation where the translation vector  
is the vector (P1, P2) defined from point P1 to point P2.") SetTranslation;
		void SetTranslation (const gp_Pnt  P1,const gp_Pnt  P2);
		%feature("autodoc", "Args:
	V(gp_Vec)

Returns:
	None

Replaces the translation vector with the vector V.") SetTranslationPart;
		void SetTranslationPart (const gp_Vec  V);
		%feature("autodoc", "Args:
	S(Standard_Real)

Returns:
	None

Modifies the scale factor.  
Raises ConstructionError  If S is null.") SetScaleFactor;
		void SetScaleFactor (const Standard_Real S);
		%feature("autodoc", "Args:
	a11(Standard_Real)
	a12(Standard_Real)
	a13(Standard_Real)
	a14(Standard_Real)
	a21(Standard_Real)
	a22(Standard_Real)
	a23(Standard_Real)
	a24(Standard_Real)
	a31(Standard_Real)
	a32(Standard_Real)
	a33(Standard_Real)
	a34(Standard_Real)
	Tolang(Standard_Real)
	TolDist(Standard_Real)

Returns:
	None

Sets the coefficients  of the transformation.  The  
         transformation  of the  point  x,y,z is  the point  
         x',y',z' with :  
 
         x' = a11 x + a12 y + a13 z + a14  
         y' = a21 x + a22 y + a23 z + a24  
         z' = a31 x + a32 y + a43 z + a34  
 
         Tolang and  TolDist are  used  to  test  for  null  
         angles and null distances to determine the form of  
         the transformation (identity, translation, etc..).  
 
         The method Value(i,j) will return aij.  
         Raises ConstructionError if the determinant of  the aij is null. Or  if  
         the matrix as not a uniform scale.") SetValues;
		void SetValues (const Standard_Real a11,const Standard_Real a12,const Standard_Real a13,const Standard_Real a14,const Standard_Real a21,const Standard_Real a22,const Standard_Real a23,const Standard_Real a24,const Standard_Real a31,const Standard_Real a32,const Standard_Real a33,const Standard_Real a34,const Standard_Real Tolang,const Standard_Real TolDist);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns true if the determinant of the vectorial part of  
this transformation is negative.") IsNegative;
		Standard_Boolean IsNegative ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_TrsfForm

Returns the nature of the transformation. It can be: an  
identity transformation, a rotation, a translation, a mirror  
transformation (relative to a point, an axis or a plane), a  
scaling transformation, or a compound transformation.") Form;
		gp_TrsfForm Form ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

Returns the scale factor.") ScaleFactor;
		Standard_Real ScaleFactor ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_XYZ

Returns the translation part of the transformation's matrix") TranslationPart;
		const gp_XYZ & TranslationPart ();
		%feature("autodoc", "Args:
	theAxis(gp_XYZ)
	theAngle(Standard_Real)

Returns:
	Standard_Boolean

Returns the boolean True if there is non-zero rotation.  
 In the presence of rotation, the output parameters store the axis  
 and the angle of rotation. The method always returns positive  
 value 'theAngle', i.e., 0. < theAngle <= PI.  
 Note that this rotation is defined only by the vectorial part of  
 the transformation; generally you would need to check also the  
 translational part to obtain the axis (gp_Ax1) of rotation.") GetRotation;
		Standard_Boolean GetRotation (gp_XYZ  theAxis,Standard_Real  theAngle);
		%feature("autodoc", "Args:
	None
Returns:
	gp_Quaternion

Returns quaternion representing rotational part of the transformation.") GetRotation;
		gp_Quaternion GetRotation ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Mat

Returns the vectorial part of the transformation. It is  
 a 3*3 matrix which includes the scale factor.") VectorialPart;
		gp_Mat VectorialPart ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Mat

Computes the homogeneous vectorial part of the transformation.  
 It is a 3*3 matrix which doesn't include the scale factor.  
 In other words, the vectorial part of this transformation is equal  
 to its homogeneous vectorial part, multiplied by the scale factor.  
 The coefficients of this matrix must be multiplied by the  
 scale factor to obtain the coefficients of the transformation.") HVectorialPart;
		const gp_Mat & HVectorialPart ();
		%feature("autodoc", "Args:
	Row(Standard_Integer)
	Col(Standard_Integer)

Returns:
	Standard_Real

Returns the coefficients of the transformation's matrix.  
 It is a 3 rows * 4 columns matrix.  
 This coefficient includes the scale factor.  
 Raises OutOfRanged if Row < 1 or Row > 3 or Col < 1 or Col > 4") Value;
		Standard_Real Value (const Standard_Integer Row,const Standard_Integer Col);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Invert;
		void Invert ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Trsf

Computes the reverse transformation  
 Raises an exception if the matrix of the transformation  
 is not inversible, it means that the scale factor is lower  
 or equal to Resolution from package gp.  
 Computes the transformation composed with T and  <self>.  
 In a C++ implementation you can also write Tcomposed = <self> * T.  
Example :  
     Trsf T1, T2, Tcomp; ...............  
       Tcomp = T2.Multiplied(T1);         // or   (Tcomp = T2 * T1)  
       Pnt P1(10.,3.,4.);  
       Pnt P2 = P1.Transformed(Tcomp);    //using Tcomp  
       Pnt P3 = P1.Transformed(T1);       //using T1 then T2  
       P3.Transform(T2);                  // P3 = P2 !!!") Inverted;
		gp_Trsf Inverted ();
		%feature("autodoc", "Args:
	T(gp_Trsf)

Returns:
	gp_Trsf

No detailed docstring for this function.") Multiplied;
		gp_Trsf Multiplied (const gp_Trsf  T);
		%feature("autodoc", "Args:
	T(gp_Trsf)

Returns:
	gp_Trsf

No detailed docstring for this function.") operator*;
		gp_Trsf operator * (const gp_Trsf  T);
		%feature("autodoc", "Args:
	T(gp_Trsf)

Returns:
	None

Computes the transformation composed with T and  <self>.  
 In a C++ implementation you can also write Tcomposed = <self> * T.  
 Example :  
     Trsf T1, T2, Tcomp; ...............  
     //composition :  
       Tcomp = T2.Multiplied(T1);         // or   (Tcomp = T2 * T1)  
     // transformation of a point  
       Pnt P1(10.,3.,4.);  
       Pnt P2 = P1.Transformed(Tcomp);    //using Tcomp  
       Pnt P3 = P1.Transformed(T1);       //using T1 then T2  
       P3.Transform(T2);                  // P3 = P2 !!!  
 Computes the transformation composed with <self> and T.  
 <self> = T * <self>") Multiply;
		void Multiply (const gp_Trsf  T);
		%feature("autodoc", "Args:
	T(gp_Trsf)

Returns:
	None

No detailed docstring for this function.") operator*=;
		void operator *= (const gp_Trsf  T);
		%feature("autodoc", "Args:
	T(gp_Trsf)

Returns:
	None

Computes the transformation composed with <self> and T.  
 <self> = T * <self>") PreMultiply;
		void PreMultiply (const gp_Trsf  T);
		%feature("autodoc", "Args:
	N(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Power;
		void Power (const Standard_Integer N);
		%feature("autodoc", "Args:
	N(Standard_Integer)

Returns:
	gp_Trsf

Computes the following composition of transformations  
 <self> * <self> * .......* <self>, N time.  
 if N = 0 <self> = Identity  
 if N < 0 <self> = <self>.Inverse() *...........* <self>.Inverse().  
 
 Raises if N < 0 and if the matrix of the transformation not  
 inversible.") Powered;
		gp_Trsf Powered (const Standard_Integer N);
		%feature("autodoc", "Args:
	X(Standard_Real)
	Y(Standard_Real)
	Z(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Transforms;
		void Transforms (Standard_Real  X,Standard_Real  Y,Standard_Real  Z);
		%feature("autodoc", "Args:
	Coord(gp_XYZ)

Returns:
	None

Transformation of a triplet XYZ with a Trsf") Transforms;
		void Transforms (gp_XYZ  Coord);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") _CSFDB_Getgp_Trsfscale;
		Standard_Real _CSFDB_Getgp_Trsfscale ();
		%feature("autodoc", "Args:
	p(Standard_Real)

Returns:
	None

No detailed docstring for this function.") _CSFDB_Setgp_Trsfscale;
		void _CSFDB_Setgp_Trsfscale (const Standard_Real p);
		%feature("autodoc", "Args:
	None
Returns:
	gp_TrsfForm

No detailed docstring for this function.") _CSFDB_Getgp_Trsfshape;
		gp_TrsfForm _CSFDB_Getgp_Trsfshape ();
		%feature("autodoc", "Args:
	p(gp_TrsfForm)

Returns:
	None

No detailed docstring for this function.") _CSFDB_Setgp_Trsfshape;
		void _CSFDB_Setgp_Trsfshape (const gp_TrsfForm p);
		%feature("autodoc", "Args:
	None
Returns:
	gp_Mat

No detailed docstring for this function.") _CSFDB_Getgp_Trsfmatrix;
		const gp_Mat & _CSFDB_Getgp_Trsfmatrix ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_XYZ

No detailed docstring for this function.") _CSFDB_Getgp_Trsfloc;
		const gp_XYZ & _CSFDB_Getgp_Trsfloc ();
};


%feature("shadow") gp_Trsf::~gp_Trsf %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend gp_Trsf {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor gp_Trsf2d;
class gp_Trsf2d {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

Returns identity transformation.") gp_Trsf2d;
		 gp_Trsf2d ();
		%feature("autodoc", "Args:
	T(gp_Trsf)

Returns:
	None

Creates a 2d transformation in the XY plane from a  
         3d transformation .") gp_Trsf2d;
		 gp_Trsf2d (const gp_Trsf  T);
		%feature("autodoc", "Args:
	P(gp_Pnt2d)

Returns:
	None

Changes the transformation into a symmetrical transformation.  
 P is the center of the symmetry.") SetMirror;
		void SetMirror (const gp_Pnt2d  P);
		%feature("autodoc", "Args:
	A(gp_Ax2d)

Returns:
	None

Changes the transformation into a symmetrical transformation.  
 A is the center of the axial symmetry.") SetMirror;
		void SetMirror (const gp_Ax2d  A);
		%feature("autodoc", "Args:
	P(gp_Pnt2d)
	Ang(Standard_Real)

Returns:
	None

Changes the transformation into a rotation.  
 P is the rotation's center and Ang is the angular value of the  
 rotation in radian.") SetRotation;
		void SetRotation (const gp_Pnt2d  P,const Standard_Real Ang);
		%feature("autodoc", "Args:
	P(gp_Pnt2d)
	S(Standard_Real)

Returns:
	None

Changes the transformation into a scale.  
 P is the center of the scale and S is the scaling value.") SetScale;
		void SetScale (const gp_Pnt2d  P,const Standard_Real S);
		%feature("autodoc", "Args:
	FromSystem1(gp_Ax2d)
	ToSystem2(gp_Ax2d)

Returns:
	None

Changes a transformation allowing passage from the coordinate  
 system 'FromSystem1' to the coordinate system 'ToSystem2'.") SetTransformation;
		void SetTransformation (const gp_Ax2d  FromSystem1,const gp_Ax2d  ToSystem2);
		%feature("autodoc", "Args:
	ToSystem(gp_Ax2d)

Returns:
	None

Changes the transformation allowing passage from the basic  
 coordinate system  
 {P(0.,0.,0.), VX (1.,0.,0.), VY (0.,1.,0.)}  
 to the local coordinate system defined with the Ax2d ToSystem.") SetTransformation;
		void SetTransformation (const gp_Ax2d  ToSystem);
		%feature("autodoc", "Args:
	V(gp_Vec2d)

Returns:
	None

Changes the transformation into a translation.  
 V is the vector of the translation.") SetTranslation;
		void SetTranslation (const gp_Vec2d  V);
		%feature("autodoc", "Args:
	P1(gp_Pnt2d)
	P2(gp_Pnt2d)

Returns:
	None

Makes the transformation into a translation from  
 the point P1 to the point P2.") SetTranslation;
		void SetTranslation (const gp_Pnt2d  P1,const gp_Pnt2d  P2);
		%feature("autodoc", "Args:
	V(gp_Vec2d)

Returns:
	None

Replaces the translation vector with V.") SetTranslationPart;
		void SetTranslationPart (const gp_Vec2d  V);
		%feature("autodoc", "Args:
	S(Standard_Real)

Returns:
	None

Modifies the scale factor.") SetScaleFactor;
		void SetScaleFactor (const Standard_Real S);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns true if the determinant of the vectorial part of  
this transformation is negative..") IsNegative;
		Standard_Boolean IsNegative ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_TrsfForm

Returns the nature of the transformation. It can be  an  
identity transformation, a rotation, a translation, a mirror  
(relative to a point or an axis), a scaling transformation,  
or a compound transformation.") Form;
		gp_TrsfForm Form ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

Returns the scale factor.") ScaleFactor;
		Standard_Real ScaleFactor ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_XY

Returns the translation part of the transformation's matrix") TranslationPart;
		const gp_XY & TranslationPart ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Mat2d

Returns the vectorial part of the transformation. It is a  
 2*2 matrix which includes the scale factor.") VectorialPart;
		gp_Mat2d VectorialPart ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Mat2d

Returns the homogeneous vectorial part of the transformation.  
 It is a 2*2 matrix which doesn't include the scale factor.  
 The coefficients of this matrix must be multiplied by the  
 scale factor to obtain the coefficients of the transformation.") HVectorialPart;
		const gp_Mat2d & HVectorialPart ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

Returns the angle corresponding to the rotational component  
 of the transformation matrix (operation opposite to SetRotation()).") RotationPart;
		Standard_Real RotationPart ();
		%feature("autodoc", "Args:
	Row(Standard_Integer)
	Col(Standard_Integer)

Returns:
	Standard_Real

Returns the coefficients of the transformation's matrix.  
 It is a 2 rows * 3 columns matrix.  
Raises OutOfRange if Row < 1 or Row > 2 or Col < 1 or Col > 3") Value;
		Standard_Real Value (const Standard_Integer Row,const Standard_Integer Col);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Invert;
		void Invert ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Trsf2d

Computes the reverse transformation.  
 Raises an exception if the matrix of the transformation  
 is not inversible, it means that the scale factor is lower  
 or equal to Resolution from package gp.") Inverted;
		gp_Trsf2d Inverted ();
		%feature("autodoc", "Args:
	T(gp_Trsf2d)

Returns:
	gp_Trsf2d

No detailed docstring for this function.") Multiplied;
		gp_Trsf2d Multiplied (const gp_Trsf2d  T);
		%feature("autodoc", "Args:
	T(gp_Trsf2d)

Returns:
	gp_Trsf2d

No detailed docstring for this function.") operator*;
		gp_Trsf2d operator * (const gp_Trsf2d  T);
		%feature("autodoc", "Args:
	T(gp_Trsf2d)

Returns:
	None

Computes the transformation composed from <T> and  <self>.  
 In a C++ implementation you can also write Tcomposed = <self> * T.  
 Example :  
     Trsf2d T1, T2, Tcomp; ...............  
     //composition :  
       Tcomp = T2.Multiplied(T1);         // or   (Tcomp = T2 * T1)  
     // transformation of a point  
       Pnt2d P1(10.,3.,4.);  
       Pnt2d P2 = P1.Transformed(Tcomp);  //using Tcomp  
       Pnt2d P3 = P1.Transformed(T1);     //using T1 then T2  
       P3.Transform(T2);                  // P3 = P2 !!!") Multiply;
		void Multiply (const gp_Trsf2d  T);
		%feature("autodoc", "Args:
	T(gp_Trsf2d)

Returns:
	None

No detailed docstring for this function.") operator*=;
		void operator *= (const gp_Trsf2d  T);
		%feature("autodoc", "Args:
	T(gp_Trsf2d)

Returns:
	None

Computes the transformation composed from <self> and T.  
 <self> = T * <self>") PreMultiply;
		void PreMultiply (const gp_Trsf2d  T);
		%feature("autodoc", "Args:
	N(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Power;
		void Power (const Standard_Integer N);
		%feature("autodoc", "Args:
	N(Standard_Integer)

Returns:
	gp_Trsf2d

Computes the following composition of transformations  
 <self> * <self> * .......* <self>,  N time.  
 if N = 0 <self> = Identity  
 if N < 0 <self> = <self>.Inverse() *...........* <self>.Inverse().  
 
 Raises if N < 0 and if the matrix of the transformation not  
 inversible.") Powered;
		gp_Trsf2d Powered (const Standard_Integer N);
		%feature("autodoc", "Args:
	X(Standard_Real)
	Y(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Transforms;
		void Transforms (Standard_Real  X,Standard_Real  Y);
		%feature("autodoc", "Args:
	Coord(gp_XY)

Returns:
	None

Transforms  a doublet XY with a Trsf2d") Transforms;
		void Transforms (gp_XY  Coord);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") _CSFDB_Getgp_Trsf2dscale;
		Standard_Real _CSFDB_Getgp_Trsf2dscale ();
		%feature("autodoc", "Args:
	p(Standard_Real)

Returns:
	None

No detailed docstring for this function.") _CSFDB_Setgp_Trsf2dscale;
		void _CSFDB_Setgp_Trsf2dscale (const Standard_Real p);
		%feature("autodoc", "Args:
	None
Returns:
	gp_TrsfForm

No detailed docstring for this function.") _CSFDB_Getgp_Trsf2dshape;
		gp_TrsfForm _CSFDB_Getgp_Trsf2dshape ();
		%feature("autodoc", "Args:
	p(gp_TrsfForm)

Returns:
	None

No detailed docstring for this function.") _CSFDB_Setgp_Trsf2dshape;
		void _CSFDB_Setgp_Trsf2dshape (const gp_TrsfForm p);
		%feature("autodoc", "Args:
	None
Returns:
	gp_Mat2d

No detailed docstring for this function.") _CSFDB_Getgp_Trsf2dmatrix;
		const gp_Mat2d & _CSFDB_Getgp_Trsf2dmatrix ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_XY

No detailed docstring for this function.") _CSFDB_Getgp_Trsf2dloc;
		const gp_XY & _CSFDB_Getgp_Trsf2dloc ();
};


%feature("shadow") gp_Trsf2d::~gp_Trsf2d %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend gp_Trsf2d {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor gp_Vec;
class gp_Vec {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

Creates a zero vector.") gp_Vec;
		 gp_Vec ();
		%feature("autodoc", "Args:
	V(gp_Dir)

Returns:
	None

Creates a unitary vector from a direction V.") gp_Vec;
		 gp_Vec (const gp_Dir  V);
		%feature("autodoc", "Args:
	Coord(gp_XYZ)

Returns:
	None

Creates a vector with a triplet of coordinates.") gp_Vec;
		 gp_Vec (const gp_XYZ  Coord);
		%feature("autodoc", "Args:
	Xv(Standard_Real)
	Yv(Standard_Real)
	Zv(Standard_Real)

Returns:
	None

Creates a point with its three cartesian coordinates.") gp_Vec;
		 gp_Vec (const Standard_Real Xv,const Standard_Real Yv,const Standard_Real Zv);
		%feature("autodoc", "Args:
	P1(gp_Pnt)
	P2(gp_Pnt)

Returns:
	None

Creates a vector from two points. The length of the vector  
 is the distance between P1 and P2") gp_Vec;
		 gp_Vec (const gp_Pnt  P1,const gp_Pnt  P2);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	Xi(Standard_Real)

Returns:
	None

Changes the coordinate of range Index  
 Index = 1 => X is modified  
 Index = 2 => Y is modified  
 Index = 3 => Z is modified  Raised if Index != {1, 2, 3}.") SetCoord;
		void SetCoord (const Standard_Integer Index,const Standard_Real Xi);
		%feature("autodoc", "Args:
	Xv(Standard_Real)
	Yv(Standard_Real)
	Zv(Standard_Real)

Returns:
	None

For this vector, assigns  
-   the values Xv, Yv and Zv to its three coordinates.") SetCoord;
		void SetCoord (const Standard_Real Xv,const Standard_Real Yv,const Standard_Real Zv);
		%feature("autodoc", "Args:
	X(Standard_Real)

Returns:
	None

Assigns the given value to the X coordinate of this vector.") SetX;
		void SetX (const Standard_Real X);
		%feature("autodoc", "Args:
	Y(Standard_Real)

Returns:
	None

Assigns the given value to the X coordinate of this vector.") SetY;
		void SetY (const Standard_Real Y);
		%feature("autodoc", "Args:
	Z(Standard_Real)

Returns:
	None

Assigns the given value to the X coordinate of this vector.") SetZ;
		void SetZ (const Standard_Real Z);
		%feature("autodoc", "Args:
	Coord(gp_XYZ)

Returns:
	None

Assigns the three coordinates of Coord to this vector.") SetXYZ;
		void SetXYZ (const gp_XYZ  Coord);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Standard_Real

Returns the coordinate of range Index :  
 Index = 1 => X is returned  
 Index = 2 => Y is returned  
 Index = 3 => Z is returned  Raised if Index != {1, 2, 3}.") Coord;
		Standard_Real Coord (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Xv(Standard_Real)
	Yv(Standard_Real)
	Zv(Standard_Real)

Returns:
	None

For this vector returns its three coordinates Xv, Yv, and Zvinline") Coord;
		void Coord (Standard_Real  Xv,Standard_Real  Yv,Standard_Real  Zv);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

For this vector, returns its X coordinate.") X;
		Standard_Real X ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

For this vector, returns its Y coordinate.") Y;
		Standard_Real Y ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

For this vector, returns its Z  coordinate.") Z;
		Standard_Real Z ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_XYZ

For this vector, returns  
-   its three coordinates as a number triple") XYZ;
		const gp_XYZ & XYZ ();
		%feature("autodoc", "Args:
	Other(gp_Vec)
	LinearTolerance(Standard_Real)
	AngularTolerance(Standard_Real)

Returns:
	Standard_Boolean

Returns True if the two vectors have the same magnitude value  
 and the same direction. The precision values are LinearTolerance  
 for the magnitude and AngularTolerance for the direction.") IsEqual;
		Standard_Boolean IsEqual (const gp_Vec  Other,const Standard_Real LinearTolerance,const Standard_Real AngularTolerance);
		%feature("autodoc", "Args:
	Other(gp_Vec)
	AngularTolerance(Standard_Real)

Returns:
	Standard_Boolean

Returns True if abs(<self>.Angle(Other) - PI/2.) <= AngularTolerance  
  Raises VectorWithNullMagnitude if <self>.Magnitude() <= Resolution or  
 Other.Magnitude() <= Resolution from gp") IsNormal;
		Standard_Boolean IsNormal (const gp_Vec  Other,const Standard_Real AngularTolerance);
		%feature("autodoc", "Args:
	Other(gp_Vec)
	AngularTolerance(Standard_Real)

Returns:
	Standard_Boolean

Returns True if PI - <self>.Angle(Other) <= AngularTolerance  
 Raises VectorWithNullMagnitude if <self>.Magnitude() <= Resolution or  
 Other.Magnitude() <= Resolution from gp") IsOpposite;
		Standard_Boolean IsOpposite (const gp_Vec  Other,const Standard_Real AngularTolerance);
		%feature("autodoc", "Args:
	Other(gp_Vec)
	AngularTolerance(Standard_Real)

Returns:
	Standard_Boolean

Returns True if Angle(<self>, Other) <= AngularTolerance or  
 PI - Angle(<self>, Other) <= AngularTolerance  
 This definition means that two parallel vectors cannot define  
 a plane but two vectors with opposite directions are considered  
 as parallel. Raises VectorWithNullMagnitude if <self>.Magnitude() <= Resolution or  
 Other.Magnitude() <= Resolution from gp") IsParallel;
		Standard_Boolean IsParallel (const gp_Vec  Other,const Standard_Real AngularTolerance);
		%feature("autodoc", "Args:
	Other(gp_Vec)

Returns:
	Standard_Real

Computes the angular value between <self> and <Other>  
 Returns the angle value between 0 and PI in radian.  
   Raises VectorWithNullMagnitude if <self>.Magnitude() <= Resolution from gp or  
 Other.Magnitude() <= Resolution because the angular value is  
 indefinite if one of the vectors has a null magnitude.") Angle;
		Standard_Real Angle (const gp_Vec  Other);
		%feature("autodoc", "Args:
	Other(gp_Vec)
	VRef(gp_Vec)

Returns:
	Standard_Real

Computes the angle, in radians, between this vector and  
vector Other. The result is a value between -Pi and Pi.  
For this, VRef defines the positive sense of rotation: the  
angular value is positive, if the cross product this ^ Other  
has the same orientation as VRef relative to the plane  
defined by the vectors this and Other. Otherwise, the  
angular value is negative.  
Exceptions  
gp_VectorWithNullMagnitude if the magnitude of this  
vector, the vector Other, or the vector VRef is less than or  
equal to gp::Resolution().  
Standard_DomainError if this vector, the vector Other,  
and the vector VRef are coplanar, unless this vector and  
the vector Other are parallel.") AngleWithRef;
		Standard_Real AngleWithRef (const gp_Vec  Other,const gp_Vec  VRef);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

Computes the magnitude of this vector.") Magnitude;
		Standard_Real Magnitude ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

Computes the square magnitude of this vector.  Adds two vectors") SquareMagnitude;
		Standard_Real SquareMagnitude ();
		%feature("autodoc", "Args:
	Other(gp_Vec)

Returns:
	None

No detailed docstring for this function.") Add;
		void Add (const gp_Vec  Other);
		%feature("autodoc", "Args:
	Other(gp_Vec)

Returns:
	None

No detailed docstring for this function.") operator+=;
		void operator += (const gp_Vec  Other);
		%feature("autodoc", "Args:
	Other(gp_Vec)

Returns:
	gp_Vec

Adds two vectors  Subtracts two vectors") Added;
		gp_Vec Added (const gp_Vec  Other);
		%feature("autodoc", "Args:
	Other(gp_Vec)

Returns:
	gp_Vec

No detailed docstring for this function.") operator+;
		gp_Vec operator + (const gp_Vec  Other);
		%feature("autodoc", "Args:
	Right(gp_Vec)

Returns:
	None

No detailed docstring for this function.") Subtract;
		void Subtract (const gp_Vec  Right);
		%feature("autodoc", "Args:
	Right(gp_Vec)

Returns:
	None

No detailed docstring for this function.") operator-=;
		void operator -= (const gp_Vec  Right);
		%feature("autodoc", "Args:
	Right(gp_Vec)

Returns:
	gp_Vec

Subtracts two vectors  Multiplies a vector by a scalar") Subtracted;
		gp_Vec Subtracted (const gp_Vec  Right);
		%feature("autodoc", "Args:
	Right(gp_Vec)

Returns:
	gp_Vec

No detailed docstring for this function.") operator-;
		gp_Vec operator - (const gp_Vec  Right);
		%feature("autodoc", "Args:
	Scalar(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Multiply;
		void Multiply (const Standard_Real Scalar);
		%feature("autodoc", "Args:
	Scalar(Standard_Real)

Returns:
	None

No detailed docstring for this function.") operator*=;
		void operator *= (const Standard_Real Scalar);
		%feature("autodoc", "Args:
	Scalar(Standard_Real)

Returns:
	gp_Vec

Multiplies a vector by a scalar  Divides a vector by a scalar") Multiplied;
		gp_Vec Multiplied (const Standard_Real Scalar);
		%feature("autodoc", "Args:
	Scalar(Standard_Real)

Returns:
	gp_Vec

No detailed docstring for this function.") operator*;
		gp_Vec operator * (const Standard_Real Scalar);
		%feature("autodoc", "Args:
	Scalar(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Divide;
		void Divide (const Standard_Real Scalar);
		%feature("autodoc", "Args:
	Scalar(Standard_Real)

Returns:
	None

No detailed docstring for this function.") operator/=;
		void operator /= (const Standard_Real Scalar);
		%feature("autodoc", "Args:
	Scalar(Standard_Real)

Returns:
	gp_Vec

Divides a vector by a scalar  computes the cross product between two vectors") Divided;
		gp_Vec Divided (const Standard_Real Scalar);
		%feature("autodoc", "Args:
	Scalar(Standard_Real)

Returns:
	gp_Vec

No detailed docstring for this function.") operator/;
		gp_Vec operator / (const Standard_Real Scalar);
		%feature("autodoc", "Args:
	Right(gp_Vec)

Returns:
	None

No detailed docstring for this function.") Cross;
		void Cross (const gp_Vec  Right);
		%feature("autodoc", "Args:
	Right(gp_Vec)

Returns:
	None

No detailed docstring for this function.") operator^=;
		void operator ^= (const gp_Vec  Right);
		%feature("autodoc", "Args:
	Right(gp_Vec)

Returns:
	gp_Vec

computes the cross product between two vectors") Crossed;
		gp_Vec Crossed (const gp_Vec  Right);
		%feature("autodoc", "Args:
	Right(gp_Vec)

Returns:
	gp_Vec

No detailed docstring for this function.") operator^;
		gp_Vec operator ^ (const gp_Vec  Right);
		%feature("autodoc", "Args:
	Right(gp_Vec)

Returns:
	Standard_Real

Computes the magnitude of the cross  
 product between <self> and Right.  
 Returns || <self> ^ Right ||") CrossMagnitude;
		Standard_Real CrossMagnitude (const gp_Vec  Right);
		%feature("autodoc", "Args:
	Right(gp_Vec)

Returns:
	Standard_Real

Computes the square magnitude of  
 the cross product between <self> and Right.  
 Returns || <self> ^ Right ||**2  Computes the triple vector product.  
 <self> ^ (V1 ^ V2)") CrossSquareMagnitude;
		Standard_Real CrossSquareMagnitude (const gp_Vec  Right);
		%feature("autodoc", "Args:
	V1(gp_Vec)
	V2(gp_Vec)

Returns:
	None

No detailed docstring for this function.") CrossCross;
		void CrossCross (const gp_Vec  V1,const gp_Vec  V2);
		%feature("autodoc", "Args:
	V1(gp_Vec)
	V2(gp_Vec)

Returns:
	gp_Vec

Computes the triple vector product.  
 <self> ^ (V1 ^ V2)") CrossCrossed;
		gp_Vec CrossCrossed (const gp_Vec  V1,const gp_Vec  V2);
		%feature("autodoc", "Args:
	Other(gp_Vec)

Returns:
	Standard_Real

computes the scalar product") Dot;
		Standard_Real Dot (const gp_Vec  Other);
		%feature("autodoc", "Args:
	Other(gp_Vec)

Returns:
	Standard_Real

No detailed docstring for this function.") operator*;
		Standard_Real operator * (const gp_Vec  Other);
		%feature("autodoc", "Args:
	V1(gp_Vec)
	V2(gp_Vec)

Returns:
	Standard_Real

Computes the triple scalar product <self> * (V1 ^ V2).  normalizes a vector  
 Raises an exception if the magnitude of the vector is  
 lower or equal to Resolution from gp.") DotCross;
		Standard_Real DotCross (const gp_Vec  V1,const gp_Vec  V2);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Normalize;
		void Normalize ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Vec

normalizes a vector  
 Raises an exception if the magnitude of the vector is  
 lower or equal to Resolution from gp.  Reverses the direction of a vector") Normalized;
		gp_Vec Normalized ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Reverse;
		void Reverse ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Vec

Reverses the direction of a vector") Reversed;
		gp_Vec Reversed ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Vec

No detailed docstring for this function.") operator-;
		gp_Vec operator - ();
		%feature("autodoc", "Args:
	A1(Standard_Real)
	V1(gp_Vec)
	A2(Standard_Real)
	V2(gp_Vec)
	A3(Standard_Real)
	V3(gp_Vec)
	V4(gp_Vec)

Returns:
	None

<self> is setted to the following linear form :  
 A1 * V1 + A2 * V2 + A3 * V3 + V4") SetLinearForm;
		void SetLinearForm (const Standard_Real A1,const gp_Vec  V1,const Standard_Real A2,const gp_Vec  V2,const Standard_Real A3,const gp_Vec  V3,const gp_Vec  V4);
		%feature("autodoc", "Args:
	A1(Standard_Real)
	V1(gp_Vec)
	A2(Standard_Real)
	V2(gp_Vec)
	A3(Standard_Real)
	V3(gp_Vec)

Returns:
	None

<self> is setted to the following linear form :  
 A1 * V1 + A2 * V2 + A3 * V3") SetLinearForm;
		void SetLinearForm (const Standard_Real A1,const gp_Vec  V1,const Standard_Real A2,const gp_Vec  V2,const Standard_Real A3,const gp_Vec  V3);
		%feature("autodoc", "Args:
	A1(Standard_Real)
	V1(gp_Vec)
	A2(Standard_Real)
	V2(gp_Vec)
	V3(gp_Vec)

Returns:
	None

<self> is setted to the following linear form :  
 A1 * V1 + A2 * V2 + V3") SetLinearForm;
		void SetLinearForm (const Standard_Real A1,const gp_Vec  V1,const Standard_Real A2,const gp_Vec  V2,const gp_Vec  V3);
		%feature("autodoc", "Args:
	A1(Standard_Real)
	V1(gp_Vec)
	A2(Standard_Real)
	V2(gp_Vec)

Returns:
	None

<self> is setted to the following linear form :  
 A1 * V1 + A2 * V2") SetLinearForm;
		void SetLinearForm (const Standard_Real A1,const gp_Vec  V1,const Standard_Real A2,const gp_Vec  V2);
		%feature("autodoc", "Args:
	A1(Standard_Real)
	V1(gp_Vec)
	V2(gp_Vec)

Returns:
	None

<self> is setted to the following linear form : A1 * V1 + V2") SetLinearForm;
		void SetLinearForm (const Standard_Real A1,const gp_Vec  V1,const gp_Vec  V2);
		%feature("autodoc", "Args:
	V1(gp_Vec)
	V2(gp_Vec)

Returns:
	None

<self> is setted to the following linear form : V1 + V2") SetLinearForm;
		void SetLinearForm (const gp_Vec  V1,const gp_Vec  V2);
		%feature("autodoc", "Args:
	V(gp_Vec)

Returns:
	None

No detailed docstring for this function.") Mirror;
		void Mirror (const gp_Vec  V);
		%feature("autodoc", "Args:
	V(gp_Vec)

Returns:
	gp_Vec

Performs the symmetrical transformation of a vector  
 with respect to the vector V which is the center of  
 the  symmetry.") Mirrored;
		gp_Vec Mirrored (const gp_Vec  V);
		%feature("autodoc", "Args:
	A1(gp_Ax1)

Returns:
	None

No detailed docstring for this function.") Mirror;
		void Mirror (const gp_Ax1  A1);
		%feature("autodoc", "Args:
	A1(gp_Ax1)

Returns:
	gp_Vec

Performs the symmetrical transformation of a vector  
 with respect to an axis placement which is the axis  
 of the symmetry.") Mirrored;
		gp_Vec Mirrored (const gp_Ax1  A1);
		%feature("autodoc", "Args:
	A2(gp_Ax2)

Returns:
	None

No detailed docstring for this function.") Mirror;
		void Mirror (const gp_Ax2  A2);
		%feature("autodoc", "Args:
	A2(gp_Ax2)

Returns:
	gp_Vec

Performs the symmetrical transformation of a vector  
 with respect to a plane. The axis placement A2 locates  
 the plane of the symmetry : (Location, XDirection, YDirection).") Mirrored;
		gp_Vec Mirrored (const gp_Ax2  A2);
		%feature("autodoc", "Args:
	A1(gp_Ax1)
	Ang(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Rotate;
		void Rotate (const gp_Ax1  A1,const Standard_Real Ang);
		%feature("autodoc", "Args:
	A1(gp_Ax1)
	Ang(Standard_Real)

Returns:
	gp_Vec

Rotates a vector. A1 is the axis of the rotation.  
 Ang is the angular value of the rotation in radians.") Rotated;
		gp_Vec Rotated (const gp_Ax1  A1,const Standard_Real Ang);
		%feature("autodoc", "Args:
	S(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Scale;
		void Scale (const Standard_Real S);
		%feature("autodoc", "Args:
	S(Standard_Real)

Returns:
	gp_Vec

Scales a vector. S is the scaling value.  Transforms a vector with the transformation T.") Scaled;
		gp_Vec Scaled (const Standard_Real S);
		%feature("autodoc", "Args:
	T(gp_Trsf)

Returns:
	None

No detailed docstring for this function.") Transform;
		void Transform (const gp_Trsf  T);
		%feature("autodoc", "Args:
	T(gp_Trsf)

Returns:
	gp_Vec

Transforms a vector with the transformation T.") Transformed;
		gp_Vec Transformed (const gp_Trsf  T);
		%feature("autodoc", "Args:
	None
Returns:
	gp_XYZ

No detailed docstring for this function.") _CSFDB_Getgp_Veccoord;
		const gp_XYZ & _CSFDB_Getgp_Veccoord ();
};


%feature("shadow") gp_Vec::~gp_Vec %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend gp_Vec {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor gp_Vec2d;
class gp_Vec2d {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

Creates a zero vector.") gp_Vec2d;
		 gp_Vec2d ();
		%feature("autodoc", "Args:
	V(gp_Dir2d)

Returns:
	None

Creates a unitary vector from a direction V.") gp_Vec2d;
		 gp_Vec2d (const gp_Dir2d  V);
		%feature("autodoc", "Args:
	Coord(gp_XY)

Returns:
	None

Creates a vector with a doublet of coordinates.") gp_Vec2d;
		 gp_Vec2d (const gp_XY  Coord);
		%feature("autodoc", "Args:
	Xv(Standard_Real)
	Yv(Standard_Real)

Returns:
	None

Creates a point with its two cartesian coordinates.") gp_Vec2d;
		 gp_Vec2d (const Standard_Real Xv,const Standard_Real Yv);
		%feature("autodoc", "Args:
	P1(gp_Pnt2d)
	P2(gp_Pnt2d)

Returns:
	None

Creates a vector from two points. The length of the vector  
 is the distance between P1 and P2") gp_Vec2d;
		 gp_Vec2d (const gp_Pnt2d  P1,const gp_Pnt2d  P2);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	Xi(Standard_Real)

Returns:
	None

Changes the coordinate of range Index  
 Index = 1 => X is modified  
 Index = 2 => Y is modified  
Raises OutOfRange if Index != {1, 2}.") SetCoord;
		void SetCoord (const Standard_Integer Index,const Standard_Real Xi);
		%feature("autodoc", "Args:
	Xv(Standard_Real)
	Yv(Standard_Real)

Returns:
	None

For this vector, assigns  
  the values Xv and Yv to its two coordinates") SetCoord;
		void SetCoord (const Standard_Real Xv,const Standard_Real Yv);
		%feature("autodoc", "Args:
	X(Standard_Real)

Returns:
	None

Assigns the given value to the X coordinate of this vector.") SetX;
		void SetX (const Standard_Real X);
		%feature("autodoc", "Args:
	Y(Standard_Real)

Returns:
	None

Assigns the given value to the Y coordinate of this vector.") SetY;
		void SetY (const Standard_Real Y);
		%feature("autodoc", "Args:
	Coord(gp_XY)

Returns:
	None

Assigns the two coordinates of Coord to this vector.") SetXY;
		void SetXY (const gp_XY  Coord);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Standard_Real

Returns the coordinate of range Index :  
 Index = 1 => X is returned  
 Index = 2 => Y is returned  Raised if Index != {1, 2}.") Coord;
		Standard_Real Coord (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Xv(Standard_Real)
	Yv(Standard_Real)

Returns:
	None

For this vector, returns  its two coordinates Xv and Yv") Coord;
		void Coord (Standard_Real  Xv,Standard_Real  Yv);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

For this vector, returns its X  coordinate.") X;
		Standard_Real X ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

For this vector, returns its Y  coordinate.") Y;
		Standard_Real Y ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_XY

For this vector, returns its two coordinates as a number pair") XY;
		const gp_XY & XY ();
		%feature("autodoc", "Args:
	Other(gp_Vec2d)
	LinearTolerance(Standard_Real)
	AngularTolerance(Standard_Real)

Returns:
	Standard_Boolean

Returns True if the two vectors have the same magnitude value  
 and the same direction. The precision values are LinearTolerance  
 for the magnitude and AngularTolerance for the direction.") IsEqual;
		Standard_Boolean IsEqual (const gp_Vec2d  Other,const Standard_Real LinearTolerance,const Standard_Real AngularTolerance);
		%feature("autodoc", "Args:
	Other(gp_Vec2d)
	AngularTolerance(Standard_Real)

Returns:
	Standard_Boolean

Returns True if abs(Abs(<self>.Angle(Other)) - PI/2.)  
 <= AngularTolerance  
Raises VectorWithNullMagnitude if <self>.Magnitude() <= Resolution or  
 Other.Magnitude() <= Resolution from gp.") IsNormal;
		Standard_Boolean IsNormal (const gp_Vec2d  Other,const Standard_Real AngularTolerance);
		%feature("autodoc", "Args:
	Other(gp_Vec2d)
	AngularTolerance(Standard_Real)

Returns:
	Standard_Boolean

Returns True if PI - Abs(<self>.Angle(Other)) <= AngularTolerance  
 Raises VectorWithNullMagnitude if <self>.Magnitude() <= Resolution or  
 Other.Magnitude() <= Resolution from gp.") IsOpposite;
		Standard_Boolean IsOpposite (const gp_Vec2d  Other,const Standard_Real AngularTolerance);
		%feature("autodoc", "Args:
	Other(gp_Vec2d)
	AngularTolerance(Standard_Real)

Returns:
	Standard_Boolean

Returns true if Abs(Angle(<self>, Other)) <= AngularTolerance or  
 PI - Abs(Angle(<self>, Other)) <= AngularTolerance  
 Two vectors with opposite directions are considered as parallel.  
 Raises VectorWithNullMagnitude if <self>.Magnitude() <= Resolution or  
 Other.Magnitude() <= Resolution from gp") IsParallel;
		Standard_Boolean IsParallel (const gp_Vec2d  Other,const Standard_Real AngularTolerance);
		%feature("autodoc", "Args:
	Other(gp_Vec2d)

Returns:
	Standard_Real

Computes the angular value between <self> and <Other>  
 returns the angle value between -PI and PI in radian.  
 The orientation is from <self> to Other. The positive sense is the  
 trigonometric sense.  
   Raises VectorWithNullMagnitude if <self>.Magnitude() <= Resolution from gp or  
 Other.Magnitude() <= Resolution because the angular value is  
 indefinite if one of the vectors has a null magnitude.") Angle;
		Standard_Real Angle (const gp_Vec2d  Other);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

Computes the magnitude of this vector.") Magnitude;
		Standard_Real Magnitude ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

Computes the square magnitude of this vector.") SquareMagnitude;
		Standard_Real SquareMagnitude ();
		%feature("autodoc", "Args:
	Other(gp_Vec2d)

Returns:
	None

No detailed docstring for this function.") Add;
		void Add (const gp_Vec2d  Other);
		%feature("autodoc", "Args:
	Other(gp_Vec2d)

Returns:
	None

No detailed docstring for this function.") operator+=;
		void operator += (const gp_Vec2d  Other);
		%feature("autodoc", "Args:
	Other(gp_Vec2d)

Returns:
	gp_Vec2d

Adds two vectors") Added;
		gp_Vec2d Added (const gp_Vec2d  Other);
		%feature("autodoc", "Args:
	Other(gp_Vec2d)

Returns:
	gp_Vec2d

No detailed docstring for this function.") operator+;
		gp_Vec2d operator + (const gp_Vec2d  Other);
		%feature("autodoc", "Args:
	Right(gp_Vec2d)

Returns:
	Standard_Real

Computes the crossing product between two vectors") Crossed;
		Standard_Real Crossed (const gp_Vec2d  Right);
		%feature("autodoc", "Args:
	Right(gp_Vec2d)

Returns:
	Standard_Real

No detailed docstring for this function.") operator^;
		Standard_Real operator ^ (const gp_Vec2d  Right);
		%feature("autodoc", "Args:
	Right(gp_Vec2d)

Returns:
	Standard_Real

Computes the magnitude of the cross product between <self> and  
 Right. Returns || <self> ^ Right ||") CrossMagnitude;
		Standard_Real CrossMagnitude (const gp_Vec2d  Right);
		%feature("autodoc", "Args:
	Right(gp_Vec2d)

Returns:
	Standard_Real

Computes the square magnitude of the cross product between <self> and  
 Right. Returns || <self> ^ Right ||**2") CrossSquareMagnitude;
		Standard_Real CrossSquareMagnitude (const gp_Vec2d  Right);
		%feature("autodoc", "Args:
	Scalar(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Divide;
		void Divide (const Standard_Real Scalar);
		%feature("autodoc", "Args:
	Scalar(Standard_Real)

Returns:
	None

No detailed docstring for this function.") operator/=;
		void operator /= (const Standard_Real Scalar);
		%feature("autodoc", "Args:
	Scalar(Standard_Real)

Returns:
	gp_Vec2d

divides a vector by a scalar") Divided;
		gp_Vec2d Divided (const Standard_Real Scalar);
		%feature("autodoc", "Args:
	Scalar(Standard_Real)

Returns:
	gp_Vec2d

No detailed docstring for this function.") operator/;
		gp_Vec2d operator / (const Standard_Real Scalar);
		%feature("autodoc", "Args:
	Other(gp_Vec2d)

Returns:
	Standard_Real

Computes the scalar product") Dot;
		Standard_Real Dot (const gp_Vec2d  Other);
		%feature("autodoc", "Args:
	Other(gp_Vec2d)

Returns:
	Standard_Real

No detailed docstring for this function.") operator*;
		Standard_Real operator * (const gp_Vec2d  Other);
		%feature("autodoc", "Args:
	None
Returns:
	gp_Vec2d

No detailed docstring for this function.") GetNormal;
		gp_Vec2d GetNormal ();
		%feature("autodoc", "Args:
	Scalar(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Multiply;
		void Multiply (const Standard_Real Scalar);
		%feature("autodoc", "Args:
	Scalar(Standard_Real)

Returns:
	None

No detailed docstring for this function.") operator*=;
		void operator *= (const Standard_Real Scalar);
		%feature("autodoc", "Args:
	Scalar(Standard_Real)

Returns:
	gp_Vec2d

Normalizes a vector  
 Raises an exception if the magnitude of the vector is  
 lower or equal to Resolution from package gp.") Multiplied;
		gp_Vec2d Multiplied (const Standard_Real Scalar);
		%feature("autodoc", "Args:
	Scalar(Standard_Real)

Returns:
	gp_Vec2d

No detailed docstring for this function.") operator*;
		gp_Vec2d operator * (const Standard_Real Scalar);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Normalize;
		void Normalize ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Vec2d

Normalizes a vector  
 Raises an exception if the magnitude of the vector is  
 lower or equal to Resolution from package gp.  Reverses the direction of a vector") Normalized;
		gp_Vec2d Normalized ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Reverse;
		void Reverse ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Vec2d

Reverses the direction of a vector  Subtracts two vectors") Reversed;
		gp_Vec2d Reversed ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Vec2d

No detailed docstring for this function.") operator-;
		gp_Vec2d operator - ();
		%feature("autodoc", "Args:
	Right(gp_Vec2d)

Returns:
	None

No detailed docstring for this function.") Subtract;
		void Subtract (const gp_Vec2d  Right);
		%feature("autodoc", "Args:
	Right(gp_Vec2d)

Returns:
	None

No detailed docstring for this function.") operator-=;
		void operator -= (const gp_Vec2d  Right);
		%feature("autodoc", "Args:
	Right(gp_Vec2d)

Returns:
	gp_Vec2d

Subtracts two vectors") Subtracted;
		gp_Vec2d Subtracted (const gp_Vec2d  Right);
		%feature("autodoc", "Args:
	Right(gp_Vec2d)

Returns:
	gp_Vec2d

No detailed docstring for this function.") operator-;
		gp_Vec2d operator - (const gp_Vec2d  Right);
		%feature("autodoc", "Args:
	A1(Standard_Real)
	V1(gp_Vec2d)
	A2(Standard_Real)
	V2(gp_Vec2d)
	V3(gp_Vec2d)

Returns:
	None

<self> is setted to the following linear form :  
 A1 * V1 + A2 * V2 + V3") SetLinearForm;
		void SetLinearForm (const Standard_Real A1,const gp_Vec2d  V1,const Standard_Real A2,const gp_Vec2d  V2,const gp_Vec2d  V3);
		%feature("autodoc", "Args:
	A1(Standard_Real)
	V1(gp_Vec2d)
	A2(Standard_Real)
	V2(gp_Vec2d)

Returns:
	None

<self> is setted to the following linear form : A1 * V1 + A2 * V2") SetLinearForm;
		void SetLinearForm (const Standard_Real A1,const gp_Vec2d  V1,const Standard_Real A2,const gp_Vec2d  V2);
		%feature("autodoc", "Args:
	A1(Standard_Real)
	V1(gp_Vec2d)
	V2(gp_Vec2d)

Returns:
	None

<self> is setted to the following linear form : A1 * V1 + V2") SetLinearForm;
		void SetLinearForm (const Standard_Real A1,const gp_Vec2d  V1,const gp_Vec2d  V2);
		%feature("autodoc", "Args:
	Left(gp_Vec2d)
	Right(gp_Vec2d)

Returns:
	None

<self> is setted to the following linear form : Left + Right  
 Performs the symmetrical transformation of a vector  
 with respect to the vector V which is the center of  
 the  symmetry.") SetLinearForm;
		void SetLinearForm (const gp_Vec2d  Left,const gp_Vec2d  Right);
		%feature("autodoc", "Args:
	V(gp_Vec2d)

Returns:
	None

No detailed docstring for this function.") Mirror;
		void Mirror (const gp_Vec2d  V);
		%feature("autodoc", "Args:
	V(gp_Vec2d)

Returns:
	gp_Vec2d

Performs the symmetrical transformation of a vector  
 with respect to the vector V which is the center of  
 the  symmetry.  
 Performs the symmetrical transformation of a vector  
 with respect to an axis placement which is the axis  
 of the symmetry.") Mirrored;
		gp_Vec2d Mirrored (const gp_Vec2d  V);
		%feature("autodoc", "Args:
	A1(gp_Ax2d)

Returns:
	None

No detailed docstring for this function.") Mirror;
		void Mirror (const gp_Ax2d  A1);
		%feature("autodoc", "Args:
	A1(gp_Ax2d)

Returns:
	gp_Vec2d

Performs the symmetrical transformation of a vector  
 with respect to an axis placement which is the axis  
 of the symmetry.") Mirrored;
		gp_Vec2d Mirrored (const gp_Ax2d  A1);
		%feature("autodoc", "Args:
	Ang(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Rotate;
		void Rotate (const Standard_Real Ang);
		%feature("autodoc", "Args:
	Ang(Standard_Real)

Returns:
	gp_Vec2d

Rotates a vector. Ang is the angular value of the  
 rotation in radians.") Rotated;
		gp_Vec2d Rotated (const Standard_Real Ang);
		%feature("autodoc", "Args:
	S(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Scale;
		void Scale (const Standard_Real S);
		%feature("autodoc", "Args:
	S(Standard_Real)

Returns:
	gp_Vec2d

Scales a vector. S is the scaling value.") Scaled;
		gp_Vec2d Scaled (const Standard_Real S);
		%feature("autodoc", "Args:
	T(gp_Trsf2d)

Returns:
	None

No detailed docstring for this function.") Transform;
		void Transform (const gp_Trsf2d  T);
		%feature("autodoc", "Args:
	T(gp_Trsf2d)

Returns:
	gp_Vec2d

Transforms a vector with a Trsf from gp.") Transformed;
		gp_Vec2d Transformed (const gp_Trsf2d  T);
		%feature("autodoc", "Args:
	None
Returns:
	gp_XY

No detailed docstring for this function.") _CSFDB_Getgp_Vec2dcoord;
		const gp_XY & _CSFDB_Getgp_Vec2dcoord ();
};


%feature("shadow") gp_Vec2d::~gp_Vec2d %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend gp_Vec2d {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor gp_XY;
class gp_XY {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

Creates XY object with zero coordinates (0,0).") gp_XY;
		 gp_XY ();
		%feature("autodoc", "Args:
	X(Standard_Real)
	Y(Standard_Real)

Returns:
	None

a number pair defined by the XY coordinates") gp_XY;
		 gp_XY (const Standard_Real X,const Standard_Real Y);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	Xi(Standard_Real)

Returns:
	None

modifies the coordinate of range Index  
 Index = 1 => X is modified  
 Index = 2 => Y is modified  
  Raises OutOfRange if Index != {1, 2}.") SetCoord;
		void SetCoord (const Standard_Integer Index,const Standard_Real Xi);
		%feature("autodoc", "Args:
	X(Standard_Real)
	Y(Standard_Real)

Returns:
	None

For this number pair, assigns  
  the values X and Y to its coordinates") SetCoord;
		void SetCoord (const Standard_Real X,const Standard_Real Y);
		%feature("autodoc", "Args:
	X(Standard_Real)

Returns:
	None

Assigns the given value to the X coordinate of this number pair.") SetX;
		void SetX (const Standard_Real X);
		%feature("autodoc", "Args:
	Y(Standard_Real)

Returns:
	None

Assigns the given value to the Y  coordinate of this number pair.") SetY;
		void SetY (const Standard_Real Y);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Standard_Real

returns the coordinate of range Index :  
 Index = 1 => X is returned  
 Index = 2 => Y is returned  
Raises OutOfRange if Index != {1, 2}.") Coord;
		Standard_Real Coord (const Standard_Integer Index);
		%feature("autodoc", "Args:
	X(Standard_Real)
	Y(Standard_Real)

Returns:
	None

For this number pair, returns its coordinates X and Y.") Coord;
		void Coord (Standard_Real  X,Standard_Real  Y);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

Returns the X coordinate of this number pair.") X;
		Standard_Real X ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

Returns the Y coordinate of this number pair.") Y;
		Standard_Real Y ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

Computes Sqrt (X*X + Y*Y) where X and Y are the two coordinates of this number pair.") Modulus;
		Standard_Real Modulus ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

Computes X*X + Y*Y where X and Y are the two coordinates of this number pair.") SquareModulus;
		Standard_Real SquareModulus ();
		%feature("autodoc", "Args:
	Other(gp_XY)
	Tolerance(Standard_Real)

Returns:
	Standard_Boolean

Returns true if the coordinates of this number pair are  
equal to the respective coordinates of the number pair  
Other, within the specified tolerance Tolerance. I.e.:  
 abs(<self>.X() - Other.X()) <= Tolerance and  
 abs(<self>.Y() - Other.Y()) <= Tolerance and  computations") IsEqual;
		Standard_Boolean IsEqual (const gp_XY  Other,const Standard_Real Tolerance);
		%feature("autodoc", "Args:
	Other(gp_XY)

Returns:
	None

Computes the sum of this number pair and number pair Other  
<self>.X() = <self>.X() + Other.X()  
<self>.Y() = <self>.Y() + Other.Y()") Add;
		void Add (const gp_XY  Other);
		%feature("autodoc", "Args:
	Other(gp_XY)

Returns:
	None

No detailed docstring for this function.") operator+=;
		void operator += (const gp_XY  Other);
		%feature("autodoc", "Args:
	Other(gp_XY)

Returns:
	gp_XY

Computes the sum of this number pair and number pair Other  
new.X() = <self>.X() + Other.X()  
new.Y() = <self>.Y() + Other.Y()") Added;
		gp_XY Added (const gp_XY  Other);
		%feature("autodoc", "Args:
	Other(gp_XY)

Returns:
	gp_XY

No detailed docstring for this function.") operator+;
		gp_XY operator + (const gp_XY  Other);
		%feature("autodoc", "Args:
	Right(gp_XY)

Returns:
	Standard_Real

Real D = <self>.X() * Other.Y() - <self>.Y() * Other.X()") Crossed;
		Standard_Real Crossed (const gp_XY  Right);
		%feature("autodoc", "Args:
	Right(gp_XY)

Returns:
	Standard_Real

No detailed docstring for this function.") operator^;
		Standard_Real operator ^ (const gp_XY  Right);
		%feature("autodoc", "Args:
	Right(gp_XY)

Returns:
	Standard_Real

computes the magnitude of the cross product between <self> and  
 Right. Returns || <self> ^ Right ||") CrossMagnitude;
		Standard_Real CrossMagnitude (const gp_XY  Right);
		%feature("autodoc", "Args:
	Right(gp_XY)

Returns:
	Standard_Real

computes the square magnitude of the cross product between <self> and  
 Right. Returns || <self> ^ Right ||**2") CrossSquareMagnitude;
		Standard_Real CrossSquareMagnitude (const gp_XY  Right);
		%feature("autodoc", "Args:
	Scalar(Standard_Real)

Returns:
	None

divides <self> by a real.") Divide;
		void Divide (const Standard_Real Scalar);
		%feature("autodoc", "Args:
	Scalar(Standard_Real)

Returns:
	None

No detailed docstring for this function.") operator/=;
		void operator /= (const Standard_Real Scalar);
		%feature("autodoc", "Args:
	Scalar(Standard_Real)

Returns:
	gp_XY

Divides <self> by a real.") Divided;
		gp_XY Divided (const Standard_Real Scalar);
		%feature("autodoc", "Args:
	Scalar(Standard_Real)

Returns:
	gp_XY

No detailed docstring for this function.") operator/;
		gp_XY operator / (const Standard_Real Scalar);
		%feature("autodoc", "Args:
	Other(gp_XY)

Returns:
	Standard_Real

Computes the scalar product between <self> and Other") Dot;
		Standard_Real Dot (const gp_XY  Other);
		%feature("autodoc", "Args:
	Other(gp_XY)

Returns:
	Standard_Real

No detailed docstring for this function.") operator*;
		Standard_Real operator * (const gp_XY  Other);
		%feature("autodoc", "Args:
	Scalar(Standard_Real)

Returns:
	None

<self>.X() = <self>.X() * Scalar;  
 <self>.Y() = <self>.Y() * Scalar;") Multiply;
		void Multiply (const Standard_Real Scalar);
		%feature("autodoc", "Args:
	Scalar(Standard_Real)

Returns:
	None

No detailed docstring for this function.") operator*=;
		void operator *= (const Standard_Real Scalar);
		%feature("autodoc", "Args:
	Other(gp_XY)

Returns:
	None

<self>.X() = <self>.X() * Other.X();  
 <self>.Y() = <self>.Y() * Other.Y();") Multiply;
		void Multiply (const gp_XY  Other);
		%feature("autodoc", "Args:
	Other(gp_XY)

Returns:
	None

No detailed docstring for this function.") operator*=;
		void operator *= (const gp_XY  Other);
		%feature("autodoc", "Args:
	Matrix(gp_Mat2d)

Returns:
	None

<self> = Matrix * <self>") Multiply;
		void Multiply (const gp_Mat2d  Matrix);
		%feature("autodoc", "Args:
	Matrix(gp_Mat2d)

Returns:
	None

No detailed docstring for this function.") operator*=;
		void operator *= (const gp_Mat2d  Matrix);
		%feature("autodoc", "Args:
	Scalar(Standard_Real)

Returns:
	gp_XY

New.X() = <self>.X() * Scalar;  
 New.Y() = <self>.Y() * Scalar;") Multiplied;
		gp_XY Multiplied (const Standard_Real Scalar);
		%feature("autodoc", "Args:
	Scalar(Standard_Real)

Returns:
	gp_XY

No detailed docstring for this function.") operator*;
		gp_XY operator * (const Standard_Real Scalar);
		%feature("autodoc", "Args:
	Other(gp_XY)

Returns:
	gp_XY

new.X() = <self>.X() * Other.X();  
 new.Y() = <self>.Y() * Other.Y();") Multiplied;
		gp_XY Multiplied (const gp_XY  Other);
		%feature("autodoc", "Args:
	Matrix(gp_Mat2d)

Returns:
	gp_XY

New = Matrix * <self>") Multiplied;
		gp_XY Multiplied (const gp_Mat2d  Matrix);
		%feature("autodoc", "Args:
	Matrix(gp_Mat2d)

Returns:
	gp_XY

No detailed docstring for this function.") operator*;
		gp_XY operator * (const gp_Mat2d  Matrix);
		%feature("autodoc", "Args:
	None
Returns:
	None

<self>.X() = <self>.X()/ <self>.Modulus()  
 <self>.Y() = <self>.Y()/ <self>.Modulus()  
Raises ConstructionError if <self>.Modulus() <= Resolution from gp") Normalize;
		void Normalize ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_XY

New.X() = <self>.X()/ <self>.Modulus()  
 New.Y() = <self>.Y()/ <self>.Modulus()  
Raises ConstructionError if <self>.Modulus() <= Resolution from gp") Normalized;
		gp_XY Normalized ();
		%feature("autodoc", "Args:
	None
Returns:
	None

<self>.X() = -<self>.X()  
 <self>.Y() = -<self>.Y()") Reverse;
		void Reverse ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_XY

New.X() = -<self>.X()  
 New.Y() = -<self>.Y()") Reversed;
		gp_XY Reversed ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_XY

No detailed docstring for this function.") operator-;
		gp_XY operator - ();
		%feature("autodoc", "Args:
	A1(Standard_Real)
	XY1(gp_XY)
	A2(Standard_Real)
	XY2(gp_XY)

Returns:
	None

Computes  the following linear combination and  
assigns the result to this number pair:  
 A1 * XY1 + A2 * XY2") SetLinearForm;
		void SetLinearForm (const Standard_Real A1,const gp_XY  XY1,const Standard_Real A2,const gp_XY  XY2);
		%feature("autodoc", "Args:
	A1(Standard_Real)
	XY1(gp_XY)
	A2(Standard_Real)
	XY2(gp_XY)
	XY3(gp_XY)

Returns:
	None

--  Computes  the following linear combination and  
assigns the result to this number pair:  
 A1 * XY1 + A2 * XY2 + XY3") SetLinearForm;
		void SetLinearForm (const Standard_Real A1,const gp_XY  XY1,const Standard_Real A2,const gp_XY  XY2,const gp_XY  XY3);
		%feature("autodoc", "Args:
	A1(Standard_Real)
	XY1(gp_XY)
	XY2(gp_XY)

Returns:
	None

Computes  the following linear combination and  
assigns the result to this number pair:  
 A1 * XY1 + XY2") SetLinearForm;
		void SetLinearForm (const Standard_Real A1,const gp_XY  XY1,const gp_XY  XY2);
		%feature("autodoc", "Args:
	XY1(gp_XY)
	XY2(gp_XY)

Returns:
	None

Computes  the following linear combination and  
assigns the result to this number pair:  
 XY1 + XY2") SetLinearForm;
		void SetLinearForm (const gp_XY  XY1,const gp_XY  XY2);
		%feature("autodoc", "Args:
	Right(gp_XY)

Returns:
	None

<self>.X() = <self>.X() - Other.X()  
 <self>.Y() = <self>.Y() - Other.Y()") Subtract;
		void Subtract (const gp_XY  Right);
		%feature("autodoc", "Args:
	Right(gp_XY)

Returns:
	None

No detailed docstring for this function.") operator-=;
		void operator -= (const gp_XY  Right);
		%feature("autodoc", "Args:
	Right(gp_XY)

Returns:
	gp_XY

new.X() = <self>.X() - Other.X()  
 new.Y() = <self>.Y() - Other.Y()") Subtracted;
		gp_XY Subtracted (const gp_XY  Right);
		%feature("autodoc", "Args:
	Right(gp_XY)

Returns:
	gp_XY

No detailed docstring for this function.") operator-;
		gp_XY operator - (const gp_XY  Right);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") _CSFDB_Getgp_XYx;
		Standard_Real _CSFDB_Getgp_XYx ();
		%feature("autodoc", "Args:
	p(Standard_Real)

Returns:
	None

No detailed docstring for this function.") _CSFDB_Setgp_XYx;
		void _CSFDB_Setgp_XYx (const Standard_Real p);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") _CSFDB_Getgp_XYy;
		Standard_Real _CSFDB_Getgp_XYy ();
		%feature("autodoc", "Args:
	p(Standard_Real)

Returns:
	None

No detailed docstring for this function.") _CSFDB_Setgp_XYy;
		void _CSFDB_Setgp_XYy (const Standard_Real p);
};


%feature("shadow") gp_XY::~gp_XY %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend gp_XY {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor gp_XYZ;
class gp_XYZ {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

Creates an XYZ object with zero co-ordinates (0,0,0)") gp_XYZ;
		 gp_XYZ ();
		%feature("autodoc", "Args:
	X(Standard_Real)
	Y(Standard_Real)
	Z(Standard_Real)

Returns:
	None

creates an XYZ with given coordinates") gp_XYZ;
		 gp_XYZ (const Standard_Real X,const Standard_Real Y,const Standard_Real Z);
		%feature("autodoc", "Args:
	X(Standard_Real)
	Y(Standard_Real)
	Z(Standard_Real)

Returns:
	None

For this XYZ object, assigns  
  the values X, Y and Z to its three coordinates") SetCoord;
		void SetCoord (const Standard_Real X,const Standard_Real Y,const Standard_Real Z);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	Xi(Standard_Real)

Returns:
	None

modifies the coordinate of range Index  
 Index = 1 => X is modified  
 Index = 2 => Y is modified  
 Index = 3 => Z is modified  
 Raises OutOfRange if Index != {1, 2, 3}.") SetCoord;
		void SetCoord (const Standard_Integer Index,const Standard_Real Xi);
		%feature("autodoc", "Args:
	X(Standard_Real)

Returns:
	None

Assigns the given value to the X coordinate") SetX;
		void SetX (const Standard_Real X);
		%feature("autodoc", "Args:
	Y(Standard_Real)

Returns:
	None

Assigns the given value to the Y coordinate") SetY;
		void SetY (const Standard_Real Y);
		%feature("autodoc", "Args:
	Z(Standard_Real)

Returns:
	None

Assigns the given value to the Z coordinate") SetZ;
		void SetZ (const Standard_Real Z);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Standard_Real

returns the coordinate of range Index :  
 Index = 1 => X is returned  
 Index = 2 => Y is returned  
 Index = 3 => Z is returned  
 
Raises OutOfRange if Index != {1, 2, 3}.") Coord;
		Standard_Real Coord (const Standard_Integer Index);
		%feature("autodoc", "Args:
	X(Standard_Real)
	Y(Standard_Real)
	Z(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Coord;
		void Coord (Standard_Real  X,Standard_Real  Y,Standard_Real  Z);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

Returns the X coordinate") X;
		Standard_Real X ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

Returns the Y coordinate") Y;
		Standard_Real Y ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

Returns the Z coordinate") Z;
		Standard_Real Z ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

computes Sqrt (X*X + Y*Y + Z*Z) where X, Y and Z are the three coordinates of this XYZ object.") Modulus;
		Standard_Real Modulus ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

Computes X*X + Y*Y + Z*Z where X, Y and Z are the three coordinates of this XYZ object.") SquareModulus;
		Standard_Real SquareModulus ();
		%feature("autodoc", "Args:
	Other(gp_XYZ)
	Tolerance(Standard_Real)

Returns:
	Standard_Boolean

Returns True if he coordinates of this XYZ object are  
equal to the respective coordinates Other,  
within the specified tolerance Tolerance. I.e.:  
 abs(<self>.X() - Other.X()) <= Tolerance and  
 abs(<self>.Y() - Other.Y()) <= Tolerance and  
 abs(<self>.Z() - Other.Z()) <= Tolerance.") IsEqual;
		Standard_Boolean IsEqual (const gp_XYZ  Other,const Standard_Real Tolerance);
		%feature("autodoc", "Args:
	Other(gp_XYZ)

Returns:
	None

<self>.X() = <self>.X() + Other.X()  
<self>.Y() = <self>.Y() + Other.Y()  
<self>.Z() = <self>.Z() + Other.Z()") Add;
		void Add (const gp_XYZ  Other);
		%feature("autodoc", "Args:
	Other(gp_XYZ)

Returns:
	None

No detailed docstring for this function.") operator+=;
		void operator += (const gp_XYZ  Other);
		%feature("autodoc", "Args:
	Other(gp_XYZ)

Returns:
	gp_XYZ

new.X() = <self>.X() + Other.X()  
new.Y() = <self>.Y() + Other.Y()  
new.Z() = <self>.Z() + Other.Z()") Added;
		gp_XYZ Added (const gp_XYZ  Other);
		%feature("autodoc", "Args:
	Other(gp_XYZ)

Returns:
	gp_XYZ

No detailed docstring for this function.") operator+;
		gp_XYZ operator + (const gp_XYZ  Other);
		%feature("autodoc", "Args:
	Right(gp_XYZ)

Returns:
	None

<self>.X() = <self>.Y() * Other.Z() - <self>.Z() * Other.Y()  
<self>.Y() = <self>.Z() * Other.X() - <self>.X() * Other.Z()  
<self>.Z() = <self>.X() * Other.Y() - <self>.Y() * Other.X()") Cross;
		void Cross (const gp_XYZ  Right);
		%feature("autodoc", "Args:
	Right(gp_XYZ)

Returns:
	None

No detailed docstring for this function.") operator^=;
		void operator ^= (const gp_XYZ  Right);
		%feature("autodoc", "Args:
	Right(gp_XYZ)

Returns:
	gp_XYZ

new.X() = <self>.Y() * Other.Z() - <self>.Z() * Other.Y()  
new.Y() = <self>.Z() * Other.X() - <self>.X() * Other.Z()  
new.Z() = <self>.X() * Other.Y() - <self>.Y() * Other.X()") Crossed;
		gp_XYZ Crossed (const gp_XYZ  Right);
		%feature("autodoc", "Args:
	Right(gp_XYZ)

Returns:
	gp_XYZ

No detailed docstring for this function.") operator^;
		gp_XYZ operator ^ (const gp_XYZ  Right);
		%feature("autodoc", "Args:
	Right(gp_XYZ)

Returns:
	Standard_Real

Computes the magnitude of the cross product between <self> and  
 Right. Returns || <self> ^ Right ||") CrossMagnitude;
		Standard_Real CrossMagnitude (const gp_XYZ  Right);
		%feature("autodoc", "Args:
	Right(gp_XYZ)

Returns:
	Standard_Real

Computes the square magnitude of the cross product between <self> and  
 Right. Returns || <self> ^ Right ||**2") CrossSquareMagnitude;
		Standard_Real CrossSquareMagnitude (const gp_XYZ  Right);
		%feature("autodoc", "Args:
	Coord1(gp_XYZ)
	Coord2(gp_XYZ)

Returns:
	None

Triple vector product  
 Computes <self> = <self>.Cross(Coord1.Cross(Coord2))") CrossCross;
		void CrossCross (const gp_XYZ  Coord1,const gp_XYZ  Coord2);
		%feature("autodoc", "Args:
	Coord1(gp_XYZ)
	Coord2(gp_XYZ)

Returns:
	gp_XYZ

Triple vector product  
 computes New = <self>.Cross(Coord1.Cross(Coord2))") CrossCrossed;
		gp_XYZ CrossCrossed (const gp_XYZ  Coord1,const gp_XYZ  Coord2);
		%feature("autodoc", "Args:
	Scalar(Standard_Real)

Returns:
	None

divides <self> by a real.") Divide;
		void Divide (const Standard_Real Scalar);
		%feature("autodoc", "Args:
	Scalar(Standard_Real)

Returns:
	None

No detailed docstring for this function.") operator/=;
		void operator /= (const Standard_Real Scalar);
		%feature("autodoc", "Args:
	Scalar(Standard_Real)

Returns:
	gp_XYZ

divides <self> by a real.") Divided;
		gp_XYZ Divided (const Standard_Real Scalar);
		%feature("autodoc", "Args:
	Scalar(Standard_Real)

Returns:
	gp_XYZ

No detailed docstring for this function.") operator/;
		gp_XYZ operator / (const Standard_Real Scalar);
		%feature("autodoc", "Args:
	Other(gp_XYZ)

Returns:
	Standard_Real

computes the scalar product between <self> and Other") Dot;
		Standard_Real Dot (const gp_XYZ  Other);
		%feature("autodoc", "Args:
	Other(gp_XYZ)

Returns:
	Standard_Real

No detailed docstring for this function.") operator*;
		Standard_Real operator * (const gp_XYZ  Other);
		%feature("autodoc", "Args:
	Coord1(gp_XYZ)
	Coord2(gp_XYZ)

Returns:
	Standard_Real

computes the triple scalar product") DotCross;
		Standard_Real DotCross (const gp_XYZ  Coord1,const gp_XYZ  Coord2);
		%feature("autodoc", "Args:
	Scalar(Standard_Real)

Returns:
	None

<self>.X() = <self>.X() * Scalar;  
 <self>.Y() = <self>.Y() * Scalar;  
 <self>.Z() = <self>.Z() * Scalar;") Multiply;
		void Multiply (const Standard_Real Scalar);
		%feature("autodoc", "Args:
	Scalar(Standard_Real)

Returns:
	None

No detailed docstring for this function.") operator*=;
		void operator *= (const Standard_Real Scalar);
		%feature("autodoc", "Args:
	Other(gp_XYZ)

Returns:
	None

<self>.X() = <self>.X() * Other.X();  
 <self>.Y() = <self>.Y() * Other.Y();  
 <self>.Z() = <self>.Z() * Other.Z();") Multiply;
		void Multiply (const gp_XYZ  Other);
		%feature("autodoc", "Args:
	Other(gp_XYZ)

Returns:
	None

No detailed docstring for this function.") operator*=;
		void operator *= (const gp_XYZ  Other);
		%feature("autodoc", "Args:
	Matrix(gp_Mat)

Returns:
	None

<self> = Matrix * <self>") Multiply;
		void Multiply (const gp_Mat  Matrix);
		%feature("autodoc", "Args:
	Matrix(gp_Mat)

Returns:
	None

No detailed docstring for this function.") operator*=;
		void operator *= (const gp_Mat  Matrix);
		%feature("autodoc", "Args:
	Scalar(Standard_Real)

Returns:
	gp_XYZ

New.X() = <self>.X() * Scalar;  
 New.Y() = <self>.Y() * Scalar;  
 New.Z() = <self>.Z() * Scalar;") Multiplied;
		gp_XYZ Multiplied (const Standard_Real Scalar);
		%feature("autodoc", "Args:
	Scalar(Standard_Real)

Returns:
	gp_XYZ

No detailed docstring for this function.") operator*;
		gp_XYZ operator * (const Standard_Real Scalar);
		%feature("autodoc", "Args:
	Other(gp_XYZ)

Returns:
	gp_XYZ

new.X() = <self>.X() * Other.X();  
 new.Y() = <self>.Y() * Other.Y();  
 new.Z() = <self>.Z() * Other.Z();") Multiplied;
		gp_XYZ Multiplied (const gp_XYZ  Other);
		%feature("autodoc", "Args:
	Matrix(gp_Mat)

Returns:
	gp_XYZ

New = Matrix * <self>") Multiplied;
		gp_XYZ Multiplied (const gp_Mat  Matrix);
		%feature("autodoc", "Args:
	Matrix(gp_Mat)

Returns:
	gp_XYZ

No detailed docstring for this function.") operator*;
		gp_XYZ operator * (const gp_Mat  Matrix);
		%feature("autodoc", "Args:
	None
Returns:
	None

<self>.X() = <self>.X()/ <self>.Modulus()  
 <self>.Y() = <self>.Y()/ <self>.Modulus()  
 <self>.Z() = <self>.Z()/ <self>.Modulus()  Raised if <self>.Modulus() <= Resolution from gp") Normalize;
		void Normalize ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_XYZ

New.X() = <self>.X()/ <self>.Modulus()  
 New.Y() = <self>.Y()/ <self>.Modulus()  
 New.Z() = <self>.Z()/ <self>.Modulus()  Raised if <self>.Modulus() <= Resolution from gp") Normalized;
		gp_XYZ Normalized ();
		%feature("autodoc", "Args:
	None
Returns:
	None

<self>.X() = -<self>.X()  
 <self>.Y() = -<self>.Y()  
 <self>.Z() = -<self>.Z()") Reverse;
		void Reverse ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_XYZ

New.X() = -<self>.X()  
 New.Y() = -<self>.Y()  
 New.Z() = -<self>.Z()") Reversed;
		gp_XYZ Reversed ();
		%feature("autodoc", "Args:
	Right(gp_XYZ)

Returns:
	None

<self>.X() = <self>.X() - Other.X()  
 <self>.Y() = <self>.Y() - Other.Y()  
 <self>.Z() = <self>.Z() - Other.Z()") Subtract;
		void Subtract (const gp_XYZ  Right);
		%feature("autodoc", "Args:
	Right(gp_XYZ)

Returns:
	None

No detailed docstring for this function.") operator-=;
		void operator -= (const gp_XYZ  Right);
		%feature("autodoc", "Args:
	Right(gp_XYZ)

Returns:
	gp_XYZ

new.X() = <self>.X() - Other.X()  
 new.Y() = <self>.Y() - Other.Y()  
 new.Z() = <self>.Z() - Other.Z()") Subtracted;
		gp_XYZ Subtracted (const gp_XYZ  Right);
		%feature("autodoc", "Args:
	Right(gp_XYZ)

Returns:
	gp_XYZ

No detailed docstring for this function.") operator-;
		gp_XYZ operator - (const gp_XYZ  Right);
		%feature("autodoc", "Args:
	A1(Standard_Real)
	XYZ1(gp_XYZ)
	A2(Standard_Real)
	XYZ2(gp_XYZ)
	A3(Standard_Real)
	XYZ3(gp_XYZ)
	XYZ4(gp_XYZ)

Returns:
	None

<self> is set to the following linear form :  
 A1 * XYZ1 + A2 * XYZ2 + A3 * XYZ3 + XYZ4") SetLinearForm;
		void SetLinearForm (const Standard_Real A1,const gp_XYZ  XYZ1,const Standard_Real A2,const gp_XYZ  XYZ2,const Standard_Real A3,const gp_XYZ  XYZ3,const gp_XYZ  XYZ4);
		%feature("autodoc", "Args:
	A1(Standard_Real)
	XYZ1(gp_XYZ)
	A2(Standard_Real)
	XYZ2(gp_XYZ)
	A3(Standard_Real)
	XYZ3(gp_XYZ)

Returns:
	None

<self> is set to the following linear form :  
 A1 * XYZ1 + A2 * XYZ2 + A3 * XYZ3") SetLinearForm;
		void SetLinearForm (const Standard_Real A1,const gp_XYZ  XYZ1,const Standard_Real A2,const gp_XYZ  XYZ2,const Standard_Real A3,const gp_XYZ  XYZ3);
		%feature("autodoc", "Args:
	A1(Standard_Real)
	XYZ1(gp_XYZ)
	A2(Standard_Real)
	XYZ2(gp_XYZ)
	XYZ3(gp_XYZ)

Returns:
	None

<self> is set to the following linear form :  
 A1 * XYZ1 + A2 * XYZ2 + XYZ3") SetLinearForm;
		void SetLinearForm (const Standard_Real A1,const gp_XYZ  XYZ1,const Standard_Real A2,const gp_XYZ  XYZ2,const gp_XYZ  XYZ3);
		%feature("autodoc", "Args:
	A1(Standard_Real)
	XYZ1(gp_XYZ)
	A2(Standard_Real)
	XYZ2(gp_XYZ)

Returns:
	None

<self> is set to the following linear form :  
 A1 * XYZ1 + A2 * XYZ2") SetLinearForm;
		void SetLinearForm (const Standard_Real A1,const gp_XYZ  XYZ1,const Standard_Real A2,const gp_XYZ  XYZ2);
		%feature("autodoc", "Args:
	A1(Standard_Real)
	XYZ1(gp_XYZ)
	XYZ2(gp_XYZ)

Returns:
	None

<self> is set to the following linear form :  
 A1 * XYZ1 + XYZ2") SetLinearForm;
		void SetLinearForm (const Standard_Real A1,const gp_XYZ  XYZ1,const gp_XYZ  XYZ2);
		%feature("autodoc", "Args:
	XYZ1(gp_XYZ)
	XYZ2(gp_XYZ)

Returns:
	None

<self> is set to the following linear form :  
 XYZ1 + XYZ2") SetLinearForm;
		void SetLinearForm (const gp_XYZ  XYZ1,const gp_XYZ  XYZ2);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") _CSFDB_Getgp_XYZx;
		Standard_Real _CSFDB_Getgp_XYZx ();
		%feature("autodoc", "Args:
	p(Standard_Real)

Returns:
	None

No detailed docstring for this function.") _CSFDB_Setgp_XYZx;
		void _CSFDB_Setgp_XYZx (const Standard_Real p);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") _CSFDB_Getgp_XYZy;
		Standard_Real _CSFDB_Getgp_XYZy ();
		%feature("autodoc", "Args:
	p(Standard_Real)

Returns:
	None

No detailed docstring for this function.") _CSFDB_Setgp_XYZy;
		void _CSFDB_Setgp_XYZy (const Standard_Real p);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") _CSFDB_Getgp_XYZz;
		Standard_Real _CSFDB_Getgp_XYZz ();
		%feature("autodoc", "Args:
	p(Standard_Real)

Returns:
	None

No detailed docstring for this function.") _CSFDB_Setgp_XYZz;
		void _CSFDB_Setgp_XYZz (const Standard_Real p);
};


%feature("shadow") gp_XYZ::~gp_XYZ %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend gp_XYZ {
	void _kill_pointed() {
		delete $self;
	}
};
